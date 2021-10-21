Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA59435986
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 05:49:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA6F36EA8B;
	Thu, 21 Oct 2021 03:49:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88E756EA8B
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 03:49:12 +0000 (UTC)
Received: from rorschach.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D03F061183;
 Thu, 21 Oct 2021 03:49:11 +0000 (UTC)
Date: Wed, 20 Oct 2021 23:49:10 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Gurchetan Singh <gurchetansingh@chromium.org>
Cc: dri-devel@lists.freedesktop.org, kaleshsingh@google.com, daniel@ffwll.ch
Subject: Re: [RFC PATCH 4/8] drm: start using drm_gem_trace_gpu_mem_total
Message-ID: <20211020234910.3f11a8f7@rorschach.local.home>
In-Reply-To: <20211021031027.537-5-gurchetansingh@chromium.org>
References: <20211021031027.537-1-gurchetansingh@chromium.org>
 <20211021031027.537-5-gurchetansingh@chromium.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 20 Oct 2021 20:10:23 -0700
Gurchetan Singh <gurchetansingh@chromium.org> wrote:

> - drm_gem_private_object_init(..) increases the total memory
>   counter.
> 
>   * All GEM objects (whether allocated or imported) seem to begin
>     there.
>   * If there's a better place/method, please do let
>     me know.
> 
> - drm_gem_object_free(..) decreases the total memory counter.
> 
> Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
> ---
>  drivers/gpu/drm/drm_gem.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 24a719b79400..528d7b29dccf 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -213,6 +213,7 @@ void drm_gem_private_object_init(struct drm_device *dev,
>  		obj->resv = &obj->_resv;
>  
>  	drm_vma_node_reset(&obj->vma_node);

To save yourself a function call when tracing is disabled, you can add:

	if (trace_gpu_mem_total_enabled())

here, which is a static_branch (meaning it's not a compare and branch,
but a nop when tracing is disabled, and a jmp (to the if block) when
the event is enabled).

> +	drm_gem_trace_gpu_mem_total(dev, obj->size, false);
>  }
>  EXPORT_SYMBOL(drm_gem_private_object_init);
>  
> @@ -1015,6 +1016,10 @@ drm_gem_object_free(struct kref *kref)
>  	struct drm_gem_object *obj =
>  		container_of(kref, struct drm_gem_object, refcount);
>  
> +	struct drm_device *dev = obj->dev;
> +

Same here.

-- Steve

> +	drm_gem_trace_gpu_mem_total(dev, -obj->size, false);
> +
>  	if (WARN_ON(!obj->funcs->free))
>  		return;
>  


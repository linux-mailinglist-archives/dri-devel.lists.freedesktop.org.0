Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0903A435989
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 05:50:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E092B6EA9C;
	Thu, 21 Oct 2021 03:50:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DA0E6EA9C
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 03:50:50 +0000 (UTC)
Received: from rorschach.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A511661183;
 Thu, 21 Oct 2021 03:50:49 +0000 (UTC)
Date: Wed, 20 Oct 2021 23:50:48 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Gurchetan Singh <gurchetansingh@chromium.org>
Cc: dri-devel@lists.freedesktop.org, kaleshsingh@google.com, daniel@ffwll.ch
Subject: Re: [RFC PATCH 5/8] drm: start using drm_gem_trace_gpu_mem_instance
Message-ID: <20211020235048.588bcac0@rorschach.local.home>
In-Reply-To: <20211021031027.537-6-gurchetansingh@chromium.org>
References: <20211021031027.537-1-gurchetansingh@chromium.org>
 <20211021031027.537-6-gurchetansingh@chromium.org>
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

On Wed, 20 Oct 2021 20:10:24 -0700
Gurchetan Singh <gurchetansingh@chromium.org> wrote:

> @@ -305,6 +306,7 @@ drm_gem_object_release_handle(int id, void *ptr, void *data)
>  	drm_gem_remove_prime_handles(obj, file_priv);
>  	drm_vma_node_revoke(&obj->vma_node, file_priv);
>  
> +	drm_gem_trace_gpu_mem_instance(dev, file_priv, -obj->size, false);

I would suggest adding the trace_*_enabled() if statements around all
these callers.

-- Steve


>  	drm_gem_object_handle_put_unlocked(obj);
>  
>  	return 0;

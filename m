Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6A93AB13C
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 12:19:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A0CE6E8DC;
	Thu, 17 Jun 2021 10:19:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E0706E8DC;
 Thu, 17 Jun 2021 10:19:54 +0000 (UTC)
IronPort-SDR: DUF32zd3dma+2vc67wRkP0SzspolRemdtOivvj/i0fLukOtfhhPOzcrGEZGNJujiXdrhIMQit+
 CB1h/4uQo4OA==
X-IronPort-AV: E=McAfee;i="6200,9189,10017"; a="227854481"
X-IronPort-AV: E=Sophos;i="5.83,280,1616482800"; d="scan'208";a="227854481"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2021 03:19:53 -0700
IronPort-SDR: nOu9QEjAnv9q1wer7TjTcFNXG94xhNGr869RJinY94q6BMUJX9L4X+2UaOJKifqTC02v4NXoyv
 jXTS19YK57dQ==
X-IronPort-AV: E=Sophos;i="5.83,280,1616482800"; d="scan'208";a="450974212"
Received: from herold-mobl2.ger.corp.intel.com (HELO [10.252.56.169])
 ([10.252.56.169])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2021 03:19:52 -0700
Subject: Re: [PATCH] drm/i915: Perform execbuffer object locking as a separate
 step
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210615113600.30660-1-thomas.hellstrom@linux.intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <ee235ed1-a9bc-67ad-0df8-c09242921230@linux.intel.com>
Date: Thu, 17 Jun 2021 12:19:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210615113600.30660-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Op 15-06-2021 om 13:36 schreef Thomas Hellström:
> To help avoid evicting already resident buffers from the batch we're
> processing, perform locking as a separate step.
>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 25 ++++++++++++++++---
>  1 file changed, 21 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> index 201fed19d120..394eb40c95b5 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -922,21 +922,38 @@ static int eb_lookup_vmas(struct i915_execbuffer *eb)
>  	return err;
>  }
>  
> -static int eb_validate_vmas(struct i915_execbuffer *eb)
> +static int eb_lock_vmas(struct i915_execbuffer *eb)
>  {
>  	unsigned int i;
>  	int err;
>  
> -	INIT_LIST_HEAD(&eb->unbound);
> -
>  	for (i = 0; i < eb->buffer_count; i++) {
> -		struct drm_i915_gem_exec_object2 *entry = &eb->exec[i];
>  		struct eb_vma *ev = &eb->vma[i];
>  		struct i915_vma *vma = ev->vma;
>  
>  		err = i915_gem_object_lock(vma->obj, &eb->ww);
>  		if (err)
>  			return err;
> +	}
> +
> +	return 0;
> +}
> +
> +static int eb_validate_vmas(struct i915_execbuffer *eb)
> +{
> +	unsigned int i;
> +	int err;
> +
> +	INIT_LIST_HEAD(&eb->unbound);
> +
> +	err = eb_lock_vmas(eb);
> +	if (err)
> +		return err;
> +
> +	for (i = 0; i < eb->buffer_count; i++) {
> +		struct drm_i915_gem_exec_object2 *entry = &eb->exec[i];
> +		struct eb_vma *ev = &eb->vma[i];
> +		struct i915_vma *vma = ev->vma;
>  
>  		err = eb_pin_vma(eb, entry, ev);
>  		if (err == -EDEADLK)

Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F222E5E6895
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 18:38:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5071510E435;
	Thu, 22 Sep 2022 16:38:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E2C210E3AF;
 Thu, 22 Sep 2022 16:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663864705; x=1695400705;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=pHAj6ALU1haGuzOi4Bg63Yjs2I+Jfb8meZID4E27az8=;
 b=Sre5pfAsc5fej+6DzRGCGVUKxmGvku0E11X3UowfT92YqyU+SnDc/lYH
 KXFlZFgqPx7qvoJP6ZG65LIyJdB5OqkiTsIaJUYKYXEtN3GkaTNQdJK/r
 e0LcMLpEkQ/yhnJF36ciDv40gy/5euLyOv/+1pZy33oOtBHebEDmgHHeb
 tGcesjYhK+MQxCEBDSR4qw0xR3LeWoswF7T4VNINTBfwVIxrl6fqRYiuS
 po/xK/CSIILHGo5rrcs1DmoVQS+Xq3Sy2NeUfuvZOKHjSgzclhmmynpr/
 z1zAFqYiDV8VzrZhNGNCphxRbNs1syFF/bYDX/GfOK2aSLBjU4XaWvoWz w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="280074550"
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; d="scan'208";a="280074550"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2022 09:38:24 -0700
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; d="scan'208";a="864928679"
Received: from jmhendri-mobl.ger.corp.intel.com (HELO [10.252.3.12])
 ([10.252.3.12])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2022 09:38:23 -0700
Message-ID: <c9e90c5a-eb2d-0414-5b88-9691ba0c02eb@intel.com>
Date: Thu, 22 Sep 2022 17:38:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.1
Subject: Re: [PATCH] drm/i915: Improve debug print in vm_fault_ttm
Content-Language: en-GB
To: Nirmoy Das <nirmoy.das@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220922120908.10352-1-nirmoy.das@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20220922120908.10352-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/09/2022 13:09, Nirmoy Das wrote:
> Print the error code returned by __i915_ttm_migrate()
> for better debuggability.
> 
> References: https://gitlab.freedesktop.org/drm/intel/-/issues/6889
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> index e3fc38dd5db0..9619c0fe1025 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -1034,7 +1034,7 @@ static vm_fault_t vm_fault_ttm(struct vm_fault *vmf)
>   		}
>   
>   		if (err) {
> -			drm_dbg(dev, "Unable to make resource CPU accessible\n");
> +			drm_dbg(dev, "Unable to make resource CPU accessible(err = %pe)\n", err);

Yeah, looks useful. I think for that bug the object is just too large 
for the mappable part of lmem, so this just gives -2big or similar on 
small-bar systems. I presume that the test needs to be updated to 
account for the cpu_size or so.

With the kernel test robot warning fixed:
Acked-by: Matthew Auld <matthew.auld@intel.com>

I looked at the GEM_BUG_ON(rq->reserved_space > ring->space), and I 
think the issue is maybe with emit_pte() using the ring->space to 
manually figure out the number of dwords it can emit (instead of the 
usual ring_begin()), which I guess works, but if we are unlucky and get 
interrupted (like with a very well timed sigbus here), while waiting for 
more ring space and end up bailing early, we might have trampled over 
the reserved_space when submitting the request. I guess normally the 
next ring_begin() would take care of the reserved_space, like when 
constructing the actual copy packet.

>   			dma_resv_unlock(bo->base.resv);
>   			ret = VM_FAULT_SIGBUS;
>   			goto out_rpm;

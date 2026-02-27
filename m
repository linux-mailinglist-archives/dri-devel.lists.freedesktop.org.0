Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJQONQ6ioWnEvAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 14:54:22 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CCDD1B7F5C
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 14:54:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24F5010EB83;
	Fri, 27 Feb 2026 13:54:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tak59c1M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 371E110EB72
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 13:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772200457; x=1803736457;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=DLTS0lyvWWSvmDK5rBXH2tSDdtVgdl/YTv9aMvsSb0s=;
 b=Tak59c1MEVwUS1g4AqpcREUuswkXQl139RZlyWYyMSj86dgIe+APQkvW
 2Njc2Rr9FzGcAg4ierMUO3xQF6/aYHIG2ypl/OwdXnGXs6vfVVztivYDj
 tYSvvaF7h4SmSPjANF6K1R43n2srqLmLKnnFqaBSVQGnCt+undf00isCE
 wjlDzeMqwTuI+hnaH8fkDt0wwxRHhA3NV3ao7TFeHsUF4yEfJgs24Tpk7
 pNLGE57LvdQqfKozIBZSmD9A90QkiFkOUsNX55bbfDU8UPrXWNYgZvnhH
 QhyUdLcm/7Br3N4LcOcD/w+c8F7a9T/mL9qpqKwM/ForXDPLAKw74Ff4N w==;
X-CSE-ConnectionGUID: r658fRh6TKa6XyAiAsLHUg==
X-CSE-MsgGUID: 0I63wDVURqi+hserL+a4Xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="77146855"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="77146855"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 05:54:16 -0800
X-CSE-ConnectionGUID: j6DcV/RlS9ey5XesHqpKdQ==
X-CSE-MsgGUID: yK8fTTApSl+LMnnfTvhNdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="221403317"
Received: from kwachows-mobl.ger.corp.intel.com (HELO [10.246.19.164])
 ([10.246.19.164])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 05:54:14 -0800
Message-ID: <acb789e6-d7ca-42db-ae2d-8618a8c3feb2@linux.intel.com>
Date: Fri, 27 Feb 2026 14:54:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Test for imported buffers with
 drm_gem_is_imported()
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
 Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>
References: <20260227133113.235940-1-tzimmermann@suse.de>
Content-Language: en-US
From: Karol Wachowski <karol.wachowski@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20260227133113.235940-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tzimmermann@suse.de,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maciej.falkowski@linux.intel.com,m:ogabbay@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[suse.de,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
	FORGED_SENDER(0.00)[karol.wachowski@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[karol.wachowski@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	HAS_ORG_HEADER(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,suse.de:email,linux.intel.com:mid]
X-Rspamd-Queue-Id: 7CCDD1B7F5C
X-Rspamd-Action: no action

On 2/27/2026 2:31 PM, Thomas Zimmermann wrote:
> Instead of testing import_attach for imported GEM buffers, invoke
> drm_gem_is_imported() to do the test. The test itself does not change.

Thank you for spotting this.

There's also another place in drivers/accel/ivpu/ivpu_gem.c:51
drm_WARN_ON(&vdev->drm, !bo->base.base.import_attach);

We will push a patch for that.

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Maciej Falkowski <maciej.falkowski@linux.intel.com>
> Cc: Karol Wachowski <karol.wachowski@linux.intel.com>
> Cc: Oded Gabbay <ogabbay@kernel.org>
> ---
>  drivers/accel/ivpu/ivpu_gem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/accel/ivpu/ivpu_gem.c b/drivers/accel/ivpu/ivpu_gem.c
> index 98b9ce26962b..9e2f1b60f632 100644
> --- a/drivers/accel/ivpu/ivpu_gem.c
> +++ b/drivers/accel/ivpu/ivpu_gem.c
> @@ -157,7 +157,7 @@ static void ivpu_bo_unbind_locked(struct ivpu_bo *bo)
>  	}
>  
>  	if (bo->base.sgt) {
> -		if (bo->base.base.import_attach) {
> +		if (drm_gem_is_imported(&bo->base.base)) {
>  			dma_buf_unmap_attachment(bo->base.base.import_attach,
>  						 bo->base.sgt, DMA_BIDIRECTIONAL);
>  		} else {
Reviewed-by: Karol Wachowski <karol.wachowski@linux.intel.com>

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YBiOA9GPhWkODgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 07:53:05 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCE1FAC6A
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 07:53:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C93B890FE;
	Fri,  6 Feb 2026 06:53:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zvyu1viv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12D12890FE
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 06:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770360780; x=1801896780;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=vVplapJSbFm1IK1Saw/+Hqb9xTPdx04X6rW/ESSYKfM=;
 b=Zvyu1vivMBUrk0+vl4V44YGabm/RL0GgEjqO8ZcP+HIq2Ldx/Yg3kLZ4
 axVCnvAK2GXsApCmI4tI1r/RVLnv5Jwg5fxLwFx6ulswMCt1p+PLKCIRX
 j6H4NYULJLmVtPDLqq+76UWcWsyvhw/7pkGE75wFUEGacI3rSVO/GMsNQ
 ik65jDHOggeIE2LfGmfMG4GRJMmIO1ZmGL4mzcju/lCuo42x7nJ9CLGd8
 AUY+vwNanre+LtajZC4wOiFywwbMERs4sPAQml8RqDjPFIUdkZtTZv7H2
 vSl0b7Z7iNTuOos1K2DP3rGRhfYJFcL+auIP1vXcAyljNuuQKOLihAyG1 w==;
X-CSE-ConnectionGUID: kCt7LxSPR4ixCSyfIOcJCg==
X-CSE-MsgGUID: lJwdgIwxR/2Q04gqnCP/bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="59140150"
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; d="scan'208";a="59140150"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 22:52:59 -0800
X-CSE-ConnectionGUID: ehDad1CxT9GlcGP+i1kZYA==
X-CSE-MsgGUID: 0BB+BCL3SwmXmiwjnzuB4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; d="scan'208";a="210632100"
Received: from nmizonov-mobl2.ccr.corp.intel.com (HELO [10.246.19.19])
 ([10.246.19.19])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 22:52:57 -0800
Message-ID: <66a231b3-3335-4e65-b38f-ff1fa9ec8f2b@linux.intel.com>
Date: Fri, 6 Feb 2026 07:52:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1] accel/amdxdna: Fix crash when destroying a suspended
 hardware context
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org,
 maciej.falkowski@linux.intel.com
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com,
 mario.limonciello@amd.com
References: <20260206060306.4050531-1-lizhi.hou@amd.com>
Content-Language: en-US
From: Karol Wachowski <karol.wachowski@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20260206060306.4050531-1-lizhi.hou@amd.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:lizhi.hou@amd.com,m:ogabbay@kernel.org,m:quic_jhugo@quicinc.com,m:maciej.falkowski@linux.intel.com,m:linux-kernel@vger.kernel.org,m:max.zhen@amd.com,m:sonal.santan@amd.com,m:mario.limonciello@amd.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[karol.wachowski@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[karol.wachowski@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[intel.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,intel.com:email,intel.com:dkim,linux.intel.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 8CCE1FAC6A
X-Rspamd-Action: no action

On 2/6/2026 7:03 AM, Lizhi Hou wrote:
> If userspace issues an ioctl to destroy a hardware context that has
> already been automatically suspended, the driver may crash because the
> mailbox channel pointer is NULL for the suspended context.
> 
> Fix this by checking the mailbox channel pointer in aie2_destroy_context()
> before accessing it.
> 
> Fixes: 97f27573837e ("accel/amdxdna: Fix potential NULL pointer dereference in context cleanup")
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
> ---
>  drivers/accel/amdxdna/aie2_message.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/amdxdna/aie2_message.c
> index 7d7dcfeaf794..ab1178850c47 100644
> --- a/drivers/accel/amdxdna/aie2_message.c
> +++ b/drivers/accel/amdxdna/aie2_message.c
> @@ -318,6 +318,9 @@ int aie2_destroy_context(struct amdxdna_dev_hdl *ndev, struct amdxdna_hwctx *hwc
>  	struct amdxdna_dev *xdna = ndev->xdna;
>  	int ret;
>  
> +	if (!hwctx->priv->mbox_chann)
> +		return 0;
> +
>  	xdna_mailbox_stop_channel(hwctx->priv->mbox_chann);
>  	ret = aie2_destroy_context_req(ndev, hwctx->fw_ctx_id);
>  	xdna_mailbox_destroy_channel(hwctx->priv->mbox_chann);
Reviewed-by: Karol Wachowski <karol.wachowski@linux.intel.com>

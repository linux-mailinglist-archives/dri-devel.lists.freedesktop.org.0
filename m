Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uBfaBW08n2kiZgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 19:16:13 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9D019C1A8
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 19:16:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A453010E78E;
	Wed, 25 Feb 2026 18:16:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RY+/nUv7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29D2510E78E
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 18:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772043368; x=1803579368;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=pAAIi3Amde+7kXTOwlev9Ocut0JUJSu25Td9zH4yF/c=;
 b=RY+/nUv7DOgXDZFONihPaOyk3ZY45aTyVnFrcOT/n2zcBSnsKtRVO5E/
 lC7kfGHH6OKblNmXM684KixTbDoUmkadmC5DWxYkC1cY01zK0DdmahuBR
 axedC82YgGHc2wStGP+J5TbaTlN2GQ0k3Wn351SlziEjnuYcpZzresoNT
 1C8er4pIhnqK/l4v6LxjfyFsuxPcYQINkX2JTBYi+7tEXjytYMUEGIZn+
 q0HUx2oIr5J01dS0BJ7bw/WY+3rxDi6kiSc9FrT2vivhEdQAhq/d+jkOT
 QlHv8I7rmHoquh1T9l/TH2Z30lVRxs/RogBSFzURmshswnAd3LeKw2Uy/ Q==;
X-CSE-ConnectionGUID: ySKx/MMMSOiWPLV4dcyP+A==
X-CSE-MsgGUID: awjSSmUsR9aLM6n3eBCLoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="73268979"
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="73268979"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 10:16:06 -0800
X-CSE-ConnectionGUID: 8kjpZJKaRua5CjsmBNeGfg==
X-CSE-MsgGUID: 1RSuHNaBTWCt9p7oCIyQ8A==
X-ExtLoop1: 1
Received: from mfalkows-mobl.ger.corp.intel.com (HELO [10.245.84.158])
 ([10.245.84.158])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 10:16:05 -0800
Message-ID: <78744b04-cb28-42ce-a0c0-d9718ad1efa3@linux.intel.com>
Date: Wed, 25 Feb 2026 19:16:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] accel/amdxdna: Fix suspend failure after enabling
 turbo mode
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com,
 mario.limonciello@amd.com
References: <20260211204716.722788-1-lizhi.hou@amd.com>
Content-Language: en-US
From: "Falkowski, Maciej" <maciej.falkowski@linux.intel.com>
In-Reply-To: <20260211204716.722788-1-lizhi.hou@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:lizhi.hou@amd.com,m:ogabbay@kernel.org,m:quic_jhugo@quicinc.com,m:linux-kernel@vger.kernel.org,m:max.zhen@amd.com,m:sonal.santan@amd.com,m:mario.limonciello@amd.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[maciej.falkowski@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maciej.falkowski@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[intel.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,linux.intel.com:mid]
X-Rspamd-Queue-Id: 8D9D019C1A8
X-Rspamd-Action: no action

Reviewed-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>

On 2/11/2026 9:47 PM, Lizhi Hou wrote:
> Enabling turbo mode disables hardware clock gating. Suspend requires
> hardware clock gating to be re-enabled, otherwise suspend will fail.
> Fix this by calling aie2_runtime_cfg() from aie2_hw_stop() to
> re-enable clock gating during suspend. Also ensure that firmware is
> initialized in aie2_hw_start() before modifying clock-gating
> settings during resume.
>
> Fixes: f4d7b8a6bc8c ("accel/amdxdna: Enhance power management settings")
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
> ---
>   drivers/accel/amdxdna/aie2_pci.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
> index 5b326e4610e6..0d41a6764892 100644
> --- a/drivers/accel/amdxdna/aie2_pci.c
> +++ b/drivers/accel/amdxdna/aie2_pci.c
> @@ -323,6 +323,7 @@ static void aie2_hw_stop(struct amdxdna_dev *xdna)
>   		return;
>   	}
>   
> +	aie2_runtime_cfg(ndev, AIE2_RT_CFG_CLK_GATING, NULL);
>   	aie2_mgmt_fw_fini(ndev);
>   	xdna_mailbox_stop_channel(ndev->mgmt_chann);
>   	xdna_mailbox_destroy_channel(ndev->mgmt_chann);
> @@ -406,15 +407,15 @@ static int aie2_hw_start(struct amdxdna_dev *xdna)
>   		goto stop_psp;
>   	}
>   
> -	ret = aie2_pm_init(ndev);
> +	ret = aie2_mgmt_fw_init(ndev);
>   	if (ret) {
> -		XDNA_ERR(xdna, "failed to init pm, ret %d", ret);
> +		XDNA_ERR(xdna, "initial mgmt firmware failed, ret %d", ret);
>   		goto destroy_mgmt_chann;
>   	}
>   
> -	ret = aie2_mgmt_fw_init(ndev);
> +	ret = aie2_pm_init(ndev);
>   	if (ret) {
> -		XDNA_ERR(xdna, "initial mgmt firmware failed, ret %d", ret);
> +		XDNA_ERR(xdna, "failed to init pm, ret %d", ret);
>   		goto destroy_mgmt_chann;
>   	}
>   

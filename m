Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0DMcCA6OqGmzvgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 20:54:54 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE642207418
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 20:54:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9FBF10EA63;
	Wed,  4 Mar 2026 19:54:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sLuIKxvq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A92310EA61
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 19:54:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id CEFFC60053;
 Wed,  4 Mar 2026 19:54:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3C15C4CEF7;
 Wed,  4 Mar 2026 19:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772654089;
 bh=dkNS4T1xU2LpYvK8B+12e/GmRNn9DSoIVDixWCEFa4Q=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=sLuIKxvqdV7BfcpdmpIMJ9qBcb1tUSiMFS7M90rq3SLH6uZykkstxoouA1/77FB2v
 zgAR1UVoxxHzny3T6nPBir4VJ0ClHuHoQRWLcvr0ZX5mFk5wcT82Ubr3oNKCgOF8py
 uaI+qpdQAOj0XtOYnTTwKjFRl8Na4rI16OAZwsXRLGmFkGWetum81CwmUROiEhk+IJ
 0kj8RPwBkBiS6ca48NEzFTE93oaQcm96WFQHcPu5Io8FkwvsT6J5Q7N/2LRPggQU2J
 +tu39N6gIeqtZXqkGYdzE6bk3ZPnE7MHhsV19ZHeeti975wLGZVFGs7paBUitIXQa/
 aVoOjkGdrVeCg==
Message-ID: <7595019c-2652-43e8-8597-4fc19d0019c7@kernel.org>
Date: Wed, 4 Mar 2026 13:54:48 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1] accel/amdxdna: Fix major version check on NPU1 platform
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org,
 maciej.falkowski@linux.intel.com
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com
References: <20260304195012.3616908-1-lizhi.hou@amd.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20260304195012.3616908-1-lizhi.hou@amd.com>
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
X-Rspamd-Queue-Id: AE642207418
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lizhi.hou@amd.com,m:ogabbay@kernel.org,m:quic_jhugo@quicinc.com,m:maciej.falkowski@linux.intel.com,m:linux-kernel@vger.kernel.org,m:max.zhen@amd.com,m:sonal.santan@amd.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[superm1@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[superm1@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On 3/4/26 1:50 PM, Lizhi Hou wrote:
> Add the missing major number in npu1_fw_feature_table.
> 
> Without the major version specified, the firmware feature check fails,
> preventing new firmware commands from being enabled on the NPU1
> platform.
> 
> With the correct major version populated, the driver properly detects
> firmware support and enables the new command.
> 
> Fixes: f1eac46fe5f7 ("accel/amdxdna: Update firmware version check for latest firmware")
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> ---
>   drivers/accel/amdxdna/npu1_regs.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/accel/amdxdna/npu1_regs.c b/drivers/accel/amdxdna/npu1_regs.c
> index 6e3d3ca69c04..1320e924e548 100644
> --- a/drivers/accel/amdxdna/npu1_regs.c
> +++ b/drivers/accel/amdxdna/npu1_regs.c
> @@ -67,7 +67,7 @@ const struct dpm_clk_freq npu1_dpm_clk_table[] = {
>   
>   static const struct aie2_fw_feature_tbl npu1_fw_feature_table[] = {
>   	{ .major = 5, .min_minor = 7 },
> -	{ .features = BIT_U64(AIE2_NPU_COMMAND), .min_minor = 8 },
> +	{ .features = BIT_U64(AIE2_NPU_COMMAND), .major = 5, .min_minor = 8 },
>   	{ 0 }
>   };
>   


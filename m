Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id tlPLMNy9fWnvTQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jan 2026 09:31:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1AC5C142F
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jan 2026 09:31:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0736C89358;
	Sat, 31 Jan 2026 08:31:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="BtCPt0Kp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 302 seconds by postgrey-1.36 at gabe;
 Sat, 31 Jan 2026 08:31:20 UTC
Received: from mail-m3272.qiye.163.com (mail-m3272.qiye.163.com
 [220.197.32.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8499989358
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Jan 2026 08:31:20 +0000 (UTC)
Received: from [172.16.12.51] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 32a4eb17c;
 Sat, 31 Jan 2026 16:26:11 +0800 (GMT+08:00)
Message-ID: <4855e4f6-a5ab-4735-9808-83c4adf306a5@rock-chips.com>
Date: Sat, 31 Jan 2026 16:26:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] drm/rockchip: cdn-dp: add missing check in
 cdn_dp_config_video()
To: Sergey Shtylyov <s.shtylyov@auroraos.dev>
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
References: <adf6b313-f7db-4d8f-9000-8c65446ba041@auroraos.dev>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <adf6b313-f7db-4d8f-9000-8c65446ba041@auroraos.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9c1328dda603abkunm096245786fd915
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGRgZSFYeT0IZTxpPHU5PGk5WFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
 hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
 b=BtCPt0Kpcz5TawjOxWrSNM1ajfmdQduEdCw8S/PIiCtJPzcDdwTNDMRZy61Kh8jK/pjOox4RcthoLIG/zFZbkyhMjlRcnaKFaehbNo8oY3yirP6kr1DP8+9eQuX+zWI+/hhT3G5g1zyTFD0e86rwvLInsy6PfcAFyiXAKinnbNQ=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=mARx+b1Q3aoFUp5NQEI2ofWrMi9GfyBXAGYq1ttozEQ=;
 h=date:mime-version:subject:message-id:from;
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
	DMARC_POLICY_ALLOW(-0.50)[rock-chips.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[rock-chips.com:s=default];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:s.shtylyov@auroraos.dev,m:hjc@rock-chips.com,m:heiko@sntech.de,m:andy.yan@rock-chips.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-rockchip@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[chaoyi.chen@rock-chips.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[rock-chips.com,sntech.de,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lists.freedesktop.org,lists.infradead.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[chaoyi.chen@rock-chips.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[rock-chips.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,auroraos.dev:email,linuxtesting.org:url,gitlab.freedesktop.org:url,rock-chips.com:email,rock-chips.com:dkim,rock-chips.com:mid]
X-Rspamd-Queue-Id: C1AC5C142F
X-Rspamd-Action: no action

On 1/31/2026 4:35 AM, Sergey Shtylyov wrote:
> The result of cdn_dp_reg_write() is checked everywhere (with the error
> being logged by the callers) except one place in cdn_dp_config_video().
> Add the missing result check, bailing out early on error...
> 
> Found by Linux Verification Center (linuxtesting.org) with the Svace static
> analysis tool.
> 
> Fixes: 1a0f7ed3abe2 ("drm/rockchip: cdn-dp: add cdn DP support for rk3399")
> Signed-off-by: Sergey Shtylyov <s.shtylyov@auroraos.dev>
> Cc: stable@vger.kernel.org
> ---
> Either we need to add the check or drop the assignment to the ret variable
> as the value gets ignored anyway...
> 
> The patch is against the drm-misc-fixes branch of the DRM kernel.git repo
> on gitlab.freedesktop.org.
> 
>  drivers/gpu/drm/rockchip/cdn-dp-reg.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rockchip/cdn-dp-reg.c b/drivers/gpu/drm/rockchip/cdn-dp-reg.c
> index 0dc3804051a9..9b82b27770e5 100644
> --- a/drivers/gpu/drm/rockchip/cdn-dp-reg.c
> +++ b/drivers/gpu/drm/rockchip/cdn-dp-reg.c
> @@ -685,6 +685,8 @@ int cdn_dp_config_video(struct cdn_dp_device *dp)
>  	val = div_u64(8 * (symbol + 1), bit_per_pix) - val;
>  	val += 2;
>  	ret = cdn_dp_reg_write(dp, DP_VC_TABLE(15), val);
> +	if (ret)
> +		goto err_config_video;
>  
>  	switch (video->color_depth) {
>  	case 6:

Not sure why this was resent, but it looks good to me :)

Reviewed-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>

-- 
Best, 
Chaoyi

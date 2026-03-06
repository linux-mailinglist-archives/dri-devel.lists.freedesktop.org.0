Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0HQrHOfWqmnmXgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 14:30:15 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2078221A29
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 14:30:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32FBA10ED31;
	Fri,  6 Mar 2026 13:30:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="cP70tEHb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2245F10ED31
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 13:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TkOna2Zn+g0GeDZkF0K5HkDGKkSfHhPjH0d5Z2Q8whE=; b=cP70tEHbdQFSsStjctTAuItExQ
 7BhMq0SDthIgau8F7+glguNQghRI4EoySzWgu/z7H7IE8nPWRIPoc3ixlcC2cQdhwzwUdzT6vlQot
 Ww5aNrT4WQOams/hWumoVKAzDmczi9AI0UqPvmc/G4NJAaywPPUqlBp6/+miLwVj2lTSBNJSSgTu4
 singiYvhNeaUtRCc0huP5hCwIkROEFLaKWlfFfIN4mIKksyZ4nR0rRoZYLNQUIhk3sQva4In/SwrX
 +m/8REM2kxAOTZn2hitJ1DH8UmXz3NhChStCIV3QpMPtLT0cLcMr4ZP+5NfmhzBCIKyuz6DaSzcXn
 qr/c5iAw==;
Received: from [90.240.106.137] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vyVFh-00A5r1-TI; Fri, 06 Mar 2026 14:30:01 +0100
Message-ID: <7eefc773-cc4c-4386-a72c-56ce1e724368@igalia.com>
Date: Fri, 6 Mar 2026 13:30:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/11] drm/vc4: Use unique fence timeline names per queue
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Melissa Wen <mwen@igalia.com>, Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org
References: <20260205-vc4-drm-scheduler-v1-0-c6174fd7bbc1@igalia.com>
 <20260205-vc4-drm-scheduler-v1-9-c6174fd7bbc1@igalia.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20260205-vc4-drm-scheduler-v1-9-c6174fd7bbc1@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
X-Rspamd-Queue-Id: F2078221A29
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.49 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:mcanal@igalia.com,m:mwen@igalia.com,m:mripard@kernel.org,m:dave.stevenson@raspberrypi.com,m:kernel-list@raspberrypi.com,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:kernel-dev@igalia.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[igalia.com,kernel.org,raspberrypi.com,linux.intel.com,suse.de,gmail.com,ffwll.ch];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[tvrtko.ursulin@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.354];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tvrtko.ursulin@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[igalia.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[igalia.com:mid,igalia.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action


On 05/02/2026 21:31, Maíra Canal wrote:
> Return distinct timeline names ("vc4-bin" and "vc4-render") from
> vc4_fence_get_timeline_name() based on the fence's queue, instead of
> the generic "vc4-v3d" for all fences. This improves debuggability when
> inspecting fence state.
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---
>   drivers/gpu/drm/vc4/vc4_fence.c | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/vc4/vc4_fence.c b/drivers/gpu/drm/vc4/vc4_fence.c
> index 72aa6b8ba4b6b6bd8affe2c73827bd127b18225e..32a2c78fb632b1d2c647402dba434e7168922dfb 100644
> --- a/drivers/gpu/drm/vc4/vc4_fence.c
> +++ b/drivers/gpu/drm/vc4/vc4_fence.c
> @@ -47,7 +47,16 @@ static const char *vc4_fence_get_driver_name(struct dma_fence *fence)
>   
>   static const char *vc4_fence_get_timeline_name(struct dma_fence *fence)
>   {
> -	return "vc4-v3d";
> +	struct vc4_fence *f = to_vc4_fence(fence);
> +
> +	switch (f->queue) {
> +	case VC4_BIN:
> +		return "vc4-bin";
> +	case VC4_RENDER:
> +		return "vc4-render";
> +	default:
> +		return NULL;

NULL could be problematic for strscpy in sync_file.c. I suggest 
"unknown" or something like that.

Regards,

Tvrtko

> +	}
>   }
>   
>   const struct dma_fence_ops vc4_fence_ops = {
> 


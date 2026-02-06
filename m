Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WCbPNFDyhWlsIgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 14:53:20 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CDAFE769
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 14:53:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2461310E780;
	Fri,  6 Feb 2026 13:53:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="FXAMDs/i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC64B10E06D
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 13:53:15 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 9826F4E42444;
 Fri,  6 Feb 2026 13:53:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6E97060729;
 Fri,  6 Feb 2026 13:53:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CAE58119D1D0B; Fri,  6 Feb 2026 14:53:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770385993; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=AKHu5N02Yogs/kPvZcW42Zgu3Eq1uHqj1jEkbTP4ihs=;
 b=FXAMDs/iw5ghNBQustvfDdQxtZKPxZ1ASesozSqtbLCq8lcPiIlZJq/EQQOoHKrJw30jTj
 ZMvgOxwXusbEgIJidAZ0FZ+i0TU3uK4XMgPYfLeWLsnH1/WX19wIzsLvT54W9YZbzITJiA
 Ad1xjOjGn/H4T4R3rsUCwzbdXywryaqpBPZL9cFgcWqmH3Xsz3uxC61thyA4EY5s3dinrs
 yHTg3wFP+QS4/th9QTxFQGZCNQcpCZ7gAIuInqqQEu7S8cVX+KYDuorbkf4Gzz/FRWCwHS
 RCYS5HWuz2q0ttSPXiGhYtuB3+SP8BVcSDagCtNQodBPYLYs2WXZj5+dh2qPgQ==
Message-ID: <5ee4e72c-0862-40b3-b47b-70ca5d8f89c1@bootlin.com>
Date: Fri, 6 Feb 2026 14:53:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: Re: [PATCH] drm/vkms: fix gamma LUT size check
To: Renjun Wang <renjunw0@foxmail.com>, hamohammed.sa@gmail.com,
 simona@ffwll.ch, melissa.srw@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <tencent_78CE07AD804905B05466486B299306C51B08@qq.com>
Content-Language: en-US
In-Reply-To: <tencent_78CE07AD804905B05466486B299306C51B08@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:renjunw0@foxmail.com,m:hamohammed.sa@gmail.com,m:simona@ffwll.ch,m:melissa.srw@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:linux-kernel@vger.kernel.org,m:hamohammedsa@gmail.com,m:melissasrw@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[louis.chauvet@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[foxmail.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.979];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[louis.chauvet@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[foxmail.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: A1CDAFE769
X-Rspamd-Action: no action



On 2/4/26 15:15, Renjun Wang wrote:
> vkms_atomic_check() computed the gamma LUT entry count using
> sizeof(struct drm_color_lut *), which uses pointer size and
> can incorrectly reject or accept LUT sizes. Use
> drm_color_lut_size() instead to validate against VKMS_LUT_SIZE.
> 
> Signed-off-by: Renjun Wang <renjunw0@foxmail.com>

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

Like for the YUV patch, were you able to reproduce it using a tool?

> ---
>   drivers/gpu/drm/vkms/vkms_drv.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> index dd1402f43773..a09589949f48 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -17,6 +17,7 @@
>   #include <drm/drm_gem.h>
>   #include <drm/drm_atomic.h>
>   #include <drm/drm_atomic_helper.h>
> +#include <drm/drm_color_mgmt.h>
>   #include <drm/drm_drv.h>
>   #include <drm/drm_fbdev_shmem.h>
>   #include <drm/drm_file.h>
> @@ -111,8 +112,7 @@ static int vkms_atomic_check(struct drm_device *dev, struct drm_atomic_state *st
>   		if (!new_crtc_state->gamma_lut || !new_crtc_state->color_mgmt_changed)
>   			continue;
>   
> -		if (new_crtc_state->gamma_lut->length / sizeof(struct drm_color_lut *)
> -		    > VKMS_LUT_SIZE)
> +		if (drm_color_lut_size(new_crtc_state->gamma_lut) > VKMS_LUT_SIZE)
>   			return -EINVAL;
>   	}
>   


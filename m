Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4M/JHOM1lmkkcQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 22:57:55 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B917815A767
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 22:57:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 099B610E1B7;
	Wed, 18 Feb 2026 21:57:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="OKc3d6cu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62B5910E1B7
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Feb 2026 21:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=v/1Pm50zF5YEuKW8HN6JNb2wShCodCYW3o4yzh2+hfs=; b=OKc3d6cuCPkQF6cTOGFnwN7Jgo
 H82wPf6tFTK2AfJuVmBKL5TCiBcldvFoOHdZqM7LLG4V4V+y77x6EWqIG/MGpBL9V5/SEl5/4XPXb
 rDHDpKhBadU1pn0cbBx7/C7OoloGuD0pztZJ3m687O2X0lOOS1Ua3acKUvy4UmeypSkXdXo8Me/nQ
 t3bJJXWDD63GINTqR1oZcLkgvt9nXVVcYHx7I1m6jotm55noMg9U3y5wIBmZhx9QBeJ/9rvubuO3E
 DtEBKrXgCAptRvOM4NjhELpA0C/wilwMC+FRwIFRUWVwsl2gJCr2EPxvXP60Qndf1tDXsM7nQELj7
 FNlHoLxg==;
Received: from [186.208.68.119] (helo=[192.168.18.14])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vspYA-002ELh-4J; Wed, 18 Feb 2026 22:57:38 +0100
Message-ID: <66b1c17a-d555-4e0e-ac09-2f7f9e158fbc@igalia.com>
Date: Wed, 18 Feb 2026 18:57:32 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/11] drm/vc4: Release runtime PM reference after binding
 V3D
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org
References: <20260205-vc4-drm-scheduler-v1-0-c6174fd7bbc1@igalia.com>
 <20260205-vc4-drm-scheduler-v1-1-c6174fd7bbc1@igalia.com>
Content-Language: en-US
From: Melissa Wen <mwen@igalia.com>
In-Reply-To: <20260205-vc4-drm-scheduler-v1-1-c6174fd7bbc1@igalia.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.49 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mcanal@igalia.com,m:mripard@kernel.org,m:dave.stevenson@raspberrypi.com,m:kernel-list@raspberrypi.com,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:kernel-dev@igalia.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[igalia.com,kernel.org,raspberrypi.com,linux.intel.com,suse.de,gmail.com,ffwll.ch];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[mwen@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[igalia.com:-];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.955];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mwen@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: B917815A767
X-Rspamd-Action: no action



On 05/02/2026 18:31, Maíra Canal wrote:
> The vc4_v3d_bind() function acquires a runtime PM reference via
> pm_runtime_resume_and_get() to access V3D registers during setup.
> However, this reference is never released after a successful bind.
> This prevents the device from ever runtime suspending, since the
> reference count never reaches zero.
>
> Release the runtime PM reference by adding pm_runtime_put_autosuspend()
> after autosuspend is configured, allowing the device to runtime suspend
> after the delay.
Reviewed-by: Melissa Wen <mwen@igalia.com>

>
> Fixes: 266cff37d7fc ("drm/vc4: v3d: Rework the runtime_pm setup")
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---
>   drivers/gpu/drm/vc4/vc4_v3d.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_v3d.c b/drivers/gpu/drm/vc4/vc4_v3d.c
> index 3ffe09bc89d273c2ec598f391147425d9f6785bf..d31b906cb8e787517ba3ff72c236ffcf810522b1 100644
> --- a/drivers/gpu/drm/vc4/vc4_v3d.c
> +++ b/drivers/gpu/drm/vc4/vc4_v3d.c
> @@ -481,6 +481,7 @@ static int vc4_v3d_bind(struct device *dev, struct device *master, void *data)
>   
>   	pm_runtime_use_autosuspend(dev);
>   	pm_runtime_set_autosuspend_delay(dev, 40); /* a little over 2 frames. */
> +	pm_runtime_put_autosuspend(dev);
>   
>   	return 0;
>   
>


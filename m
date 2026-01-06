Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5378CF7498
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 09:24:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72A3510E12F;
	Tue,  6 Jan 2026 08:24:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Yj1cl1pu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C41110E12F
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 08:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jGid+2QU/PnqS3t8pccEDNJG7Jp1DDV32r7aN9w2ABQ=; b=Yj1cl1pusg5D/9aI3/FYSMFQ7S
 yl/VLmtHQPGR1wR97/6CyUrThwl9QJHIWCFD0MyZaZf2BkuJnBDaDPCrWct/f20qhAxJnFgcfA/oD
 kuy86P7I+pn2hpAPbO3DmNY0PiuMPDci3/kMywSCxIUfnhW1ArBtumob65TK6qVw/E41m6gmfvYvc
 c5O8LbzK/YgAymmohn3L8CEDXz5palV3qcP9xN13x+TSUCXh9AE8zTIeFF7MMl4RrHOf/KSILcMr1
 jjXluMxfrCnbCZpIkycjw7zkf1eXzIeZd5fFSMeabmufVxc7nR5F2CagyOF7rSGMlF5BJC1YiItx9
 7rIkmdpQ==;
Received: from [90.240.106.137] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vd2Mc-0025e5-Lm; Tue, 06 Jan 2026 09:24:26 +0100
Message-ID: <56655db6-b087-4a94-b5d5-fba2f368b5ea@igalia.com>
Date: Tue, 6 Jan 2026 08:24:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/panic: Ensure drm_panic_type is initialized to a
 valid value
To: Nathan Chancellor <nathan@kernel.org>,
 Jocelyn Falempe <jfalempe@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260105-drm_panic-handle-invalid-drm_panic_screen-v1-0-55228bd4b0f8@kernel.org>
 <20260105-drm_panic-handle-invalid-drm_panic_screen-v1-1-55228bd4b0f8@kernel.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20260105-drm_panic-handle-invalid-drm_panic_screen-v1-1-55228bd4b0f8@kernel.org>
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


On 06/01/2026 06:19, Nathan Chancellor wrote:
> If a user has set an invalid CONFIG_DRM_PANIC_SCREEN value (such as
> "qr_code" without CONFIG_DRM_PANIC_SCREEN_QR_CODE=y due to missing or
> incorrect Rust dependencies), there is a panic when accessing
> /sys/module/drm/parameters/panic_screen:
> 
>    [   12.218375] BUG: unable to handle page fault for address: 0000000796dd8818
>    [   12.219737] #PF: supervisor read access in kernel mode
>    ...
>    [   12.227167] RIP: 0010:drm_panic_type_get+0x1b/0x30
> 
> If drm_panic_type_set() does not find a valid drm_panic_type enumeration
> in drm_panic_type_map based on the provided value, it does not change
> drm_panic_type from the default -1 value, which is not a valid index for
> accessing drm_panic_type_map in drm_panic_type_get(), resulting in the
> crash.
> 
> Validate the value of CONFIG_DRM_PANIC_SCREEN at boot time via the
> return value of drm_panic_type_set() in drm_panic_init() and explicitly
> fall back to the default of "user" with a message to the user so that
> they can adjust their configuration or fix missing dependencies.
> 
>    [    0.800697] Unsupported value for CONFIG_DRM_PANIC_SCREEN ('qr_code'), falling back to 'user'...
> 
> Fixes: e85e9ccf3f84 ("drm/panic: Report invalid or unsupported panic modes")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>   drivers/gpu/drm/drm_panic.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index eb7ef17b9c71..0cd574dd9d88 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -1072,8 +1072,11 @@ void drm_panic_unregister(struct drm_device *dev)
>    */
>   void __init drm_panic_init(void)
>   {
> -	if (drm_panic_type == -1)
> -		drm_panic_type_set(CONFIG_DRM_PANIC_SCREEN, NULL);
> +	if (drm_panic_type == -1 && drm_panic_type_set(CONFIG_DRM_PANIC_SCREEN, NULL)) {
> +		pr_warn("Unsupported value for CONFIG_DRM_PANIC_SCREEN ('%s'), falling back to 'user'...\n",
> +			CONFIG_DRM_PANIC_SCREEN);
> +		drm_panic_type = DRM_PANIC_TYPE_USER;
> +	}
>   	drm_panic_qr_init();
>   }

I actually tested bad string on the kernel command line but did not 
think to test a bad string in CONFIG_DRM_PANIC_SCREEN. :( And that is 
despite the fact I saw that the kconfig is a free-form input so again my 
bad. Even worse is, I briefly considered converting kconfig to a 
mutually exclusive fixed list but then gave up not wanting to think 
about kconfig backward compatibility issues. We should probably tackle 
that problem since free form inputs are bad. We have another one in DRM 
as well for the fbdev client IIRC.

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko


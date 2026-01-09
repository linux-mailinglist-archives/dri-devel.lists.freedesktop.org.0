Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BD9D0800F
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 09:55:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD64910E850;
	Fri,  9 Jan 2026 08:55:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="OxnmN0ZE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 667D410E850
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 08:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fTEki+a4dZq+PCarkxxwEYFqCoPGr+kqWvm5RiTwHrc=; b=OxnmN0ZElZ7RFX9XFmmcsq8Iwu
 lrsbSFYKPohVHaCQ8g0+gNBMq0R5oRbmpcCYKsBHH8oZDVqh6U61osahOtd+l/212BphavtR/+AXi
 zPSGKtcnm3/RQchiRKIWnNsmnpH9CcmcMGsbeZbECldXcgmuU8ps/wtNDij7bfDeCGlxHz/WSBlvg
 IWAWVVSM29O8v2BpVG3M4DxBZaRY8qfjdbZ5ff5q1VhsIFeuT1BmgxcY3wnuX3ky6idkYBGwkn0/p
 DCLU6HdR/5cCaEwGhDhHtVQkRJb3EmqsJZEzzu/e1jlWtz9i87qB3yWyEhloQ8OgS6HoTe1vMF23E
 D3FVVO6g==;
Received: from [90.240.106.137] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1ve8HS-003KbE-Er; Fri, 09 Jan 2026 09:55:38 +0100
Message-ID: <b2197fa6-ab12-41ee-88fd-c57f6caa681e@igalia.com>
Date: Fri, 9 Jan 2026 08:55:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] drm/panic: Avoid crash from invalid
 CONFIG_DRM_PANIC_SCREEN values
To: Nathan Chancellor <nathan@kernel.org>,
 Jocelyn Falempe <jfalempe@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260105-drm_panic-handle-invalid-drm_panic_screen-v1-0-55228bd4b0f8@kernel.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20260105-drm_panic-handle-invalid-drm_panic_screen-v1-0-55228bd4b0f8@kernel.org>
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
> Hi all,
> 
> This series addresses a couple of issues I noticed when accessing
> /sys/module/drm/parameters/panic_screen on my Arch Linux machines, which
> have "qr_code" as the value of CONFIG_DRM_PANIC_SCREEN. This happened to
> be unsupported in my configuration since I was missing some Rust
> dependencies in my environment for CONFIG_DRM_PANIC_SCREEN_QR_CODE,
> resulting in a kernel crash. Patch one addresses the root cause of the
> crash and patch two addresses an inconsistency I noticed between this
> new code and the documented value for CONFIG_DRM_PANIC_SCREEN in Kconfig
> for qr_code.
> 
> If there are any issues, please let me know.

I've pushed the series to drm-misc-next, thanks for fixing it up!

Regards,

Tvrtko

> 
> ---
> Nathan Chancellor (2):
>        drm/panic: Ensure drm_panic_type is initialized to a valid value
>        drm/panic: Fix expected string for QR_CODE in drm_panic_type_map
> 
>   drivers/gpu/drm/drm_panic.c | 11 +++++++----
>   1 file changed, 7 insertions(+), 4 deletions(-)
> ---
> base-commit: 349d4efadc1f831ebc0b872ba1e3a2b7dd58b72b
> change-id: 20260105-drm_panic-handle-invalid-drm_panic_screen-097e49e21c49
> 
> Best regards,
> --
> Nathan Chancellor <nathan@kernel.org>
> 


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BEB879B56
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 19:29:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5A0F10F17A;
	Tue, 12 Mar 2024 18:29:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="LQf6rABS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E5E310F17A
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 18:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EnwBgC7sqK5GJPH6z85eAMNz/YmnKPxbu0l4LtLf4hw=; b=LQf6rABSpj7A/tRu6vv+CQgxJJ
 md3j+iAzRXEcQv666Cx8WQL45ZQP+qydKbWITStW9u16qIDnY3GNy8gdvQzcvBgZ5YYRCaMe/5Lgo
 HHPZeVauQFcaM+m8e9ORliPEannvyx3BMbK9hn9vl6Ku92hZZstdllz9UREH941bGuRNJJXLKUsY2
 G2iuOY+Ao4Pyvk4PuEiFkkeQ9Q1yqjche+XyqgaX/TcX4Nd9K7UGxut9vPgRHhL8CxL+Vf0q15hTp
 YRGt803RpCzBCpcWv7c4Tkm7fkZIFBzAdZ0G5gbAQp7XPVY9VC3esV9XJsZki7WPbxJxSh/LgOEhm
 fILs/+LA==;
Received: from [189.6.17.125] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rk6rs-009TZS-BR; Tue, 12 Mar 2024 19:28:52 +0100
Date: Tue, 12 Mar 2024 15:27:38 -0300
From: Melissa Wen <mwen@igalia.com>
To: Arthur Grillo <arthurgrillo@riseup.net>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, pekka.paalanen@haloniitty.fi, 
 Louis Chauvet <louis.chauvet@bootlin.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com, 
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com, 
 Pekka Paalanen <pekka.paalanen@collabora.com>
Subject: Re: [PATCH 1/7] drm: Fix drm_fixp2int_round() making it add 0.5
Message-ID: <yyrvbqpmqplwtqfdsjkhzmx7wrk4h67kn5443bdou7c7uciouy@hac7zfxiff7t>
References: <20240306-louis-vkms-conv-v1-0-5bfe7d129fdd@riseup.net>
 <20240306-louis-vkms-conv-v1-1-5bfe7d129fdd@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240306-louis-vkms-conv-v1-1-5bfe7d129fdd@riseup.net>
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

On 03/06, Arthur Grillo wrote:
> As well noted by Pekka[1], the rounding of drm_fixp2int_round is wrong.
> To round a number, you need to add 0.5 to the number and floor that,
> drm_fixp2int_round() is adding 0.0000076. Make it add 0.5.
> 
> [1]: https://lore.kernel.org/all/20240301135327.22efe0dd.pekka.paalanen@collabora.com/
> 
Hi Arthur,

thanks for addressing this issue.

Please, add a fix tag to the commit that you are fixing, so we can
easily backport. Might be this commit:
https://cgit.freedesktop.org/drm/drm-misc/commit/drivers/gpu/drm/vkms?id=ab87f558dcfb2562c3497e89600dec798a446665
> Suggested-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> ---
>  include/drm/drm_fixed.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/drm/drm_fixed.h b/include/drm/drm_fixed.h
> index 0c9f917a4d4b..de3a79909ac9 100644
> --- a/include/drm/drm_fixed.h
> +++ b/include/drm/drm_fixed.h
> @@ -90,7 +90,7 @@ static inline int drm_fixp2int(s64 a)
>  
>  static inline int drm_fixp2int_round(s64 a)
>  {
> -	return drm_fixp2int(a + (1 << (DRM_FIXED_POINT_HALF - 1)));
Also, this is the only usage of DRM_FIXED_POINT_HALF. Can you also
remove it as it won't be used anymore?

> +	return drm_fixp2int(a + DRM_FIXED_ONE / 2);
Would this division be equivalent to just shifting 1ULL by 31 instead of
32 as done in DRM_FIXED_ONE?

Melissa

>  }
>  
>  static inline int drm_fixp2int_ceil(s64 a)
> 
> -- 
> 2.43.0
> 

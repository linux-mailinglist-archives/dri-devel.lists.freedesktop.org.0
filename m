Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E588BF16E7
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 15:06:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9F0710E28C;
	Mon, 20 Oct 2025 13:06:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="MxYd1FEt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 959F810E28C
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 13:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760965611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1GZ2MhAAtoW3wg5EgB0BHgQq5JW8ePrI/9tdtDiXq2c=;
 b=MxYd1FEtUWdQtxfsEQpYq4mGthDzCwc8N45+GJsOW1FpyjFtz0ZfMTGuRFzScZhjK5tfUf
 gcVX+4mjpBa2CoOgDo1ZzQ0h+kELv7ah5/9V74NCLJhRn9zQp5hqPB6mKMBFBH/Aub6Jyz
 r3514G2Rz0rPew+uwGYjpxVLd+WTr98=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-281-Cx8bWnDCO46SI5tM7HUnkA-1; Mon, 20 Oct 2025 09:06:50 -0400
X-MC-Unique: Cx8bWnDCO46SI5tM7HUnkA-1
X-Mimecast-MFC-AGG-ID: Cx8bWnDCO46SI5tM7HUnkA_1760965609
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-40fd1b17d2bso2688083f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 06:06:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760965609; x=1761570409;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oRrwSS8w76tb5uYsmUM++kfo2Hr5HM2pbVkrgjoxon0=;
 b=J/l6KGOAuMJHp3pGbJ99Ro87X2v3GbhD5A2TTY3d/BAARV4ttPjXRxuvQyGJ1h5CDD
 CNcJVlpLRbySCAsWSOmtc9uNGLQAaZDZM32RsLABTByzhdt7srJuohi4ajFn08nEY42U
 sWWSGQunRHz+GKQ+d9gSU+hF75JtDJAr3L1roN1tZx5R4EOALqz57GZND+Vd4rDoUvh8
 ZezomYryetfwjTwujR+l3jdG9KyfWmocMvX1i20gyN3qVwtumjhYyIlVolKf0hL/rQmE
 xDh5Ha0aC564hR4PfvDRhtrm6KEtMZtlz5cA8LS6zspBAbkSxJUqU+AK9lnBroBHcRcs
 m9jw==
X-Gm-Message-State: AOJu0Yydtw3KI0OmIAvltmjVys1BD+ZujachDwu3wfYKrOgm6XKsj1jk
 q0Qq4sRT2xKgZ3iNtzr6UFqTk+zsDSLc1c/t0U5NUhwXmcCbJg7NgjItIZCBMAHGoXLeeg3BvY+
 YLq+3BIYL1ZZFsyrdG3yGzIiEwvqT8TIyornKlaENDU054NZRE/cJmXrcxG6zBdbc/VZuCA==
X-Gm-Gg: ASbGncuXam6nHw0U1sjDYi3AgTS0shbiVst6eFTwrm6MPm/EILLWUnQjdu+SFa2K95q
 //++UVH8RBVH5Oe0MCuEZz8pRKhdV2PgGwTXGVwZu+NNRL+iJ7p2WLYYWLAg485sabvOVYaykga
 CGg0Co83L+KN+Ou2Sy2DHWZgGo5F4bBJMRaeElcSIIAOf8hAJu1LDkMI6PqBPUAsNOJ7HLDfUa4
 mKDrqnxm/XgJJFxu+lh9UwbGCa34xF/55Gqk1qZlSt2PXCkDhQMzw18NYXQl++m7/liO2j1yaH2
 o9vSIfGLxfrpVgdLhXhLj2EQbpmmAsdE0M3k3o2VCc2ppvrkOtjUvnlpQ4SFZGYZlEo6bEupEAA
 exrR/Ds25jWi2QmHg07g8zcnIo5Jyu4mgCbuy69EB2Vbm2dPeZEzJwi4wJA==
X-Received: by 2002:a05:600c:4e93:b0:471:672:3486 with SMTP id
 5b1f17b1804b1-4711787dfecmr93483065e9.15.1760965609288; 
 Mon, 20 Oct 2025 06:06:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE01MQuPwbQqPtwVHSf8r/OTdRt6dQdgg9wr2Kb36VSCMNBVglUKPQlsgWyhFbua1gCHR9tEg==
X-Received: by 2002:a05:600c:4e93:b0:471:672:3486 with SMTP id
 5b1f17b1804b1-4711787dfecmr93482815e9.15.1760965608856; 
 Mon, 20 Oct 2025 06:06:48 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427f00b9fa8sm15480379f8f.38.2025.10.20.06.06.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Oct 2025 06:06:48 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, ville.syrjala@linux.intel.com,
 dan.carpenter@linaro.org
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/sysfb: Use new CRTC state in begin_fb_access
In-Reply-To: <20251020125227.41308-1-tzimmermann@suse.de>
References: <20251020125227.41308-1-tzimmermann@suse.de>
Date: Mon, 20 Oct 2025 15:06:47 +0200
Message-ID: <87v7k9pvrs.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8s453ItbYZQTEsaqwXZporgkfYepe9mPPOdDJz3OEP8_1760965609
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

> Retrieve the CRTC's new state with drm_atomic_get_new_crtc_state()
> in drm_sysfb_plane_helper_begin_fb_access(). The blit function might
> be incorrect otherwise.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: cb71de092553 ("drm/sysfb: Lookup blit function during atomic check=
")
> Reported-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Closes: https://lore.kernel.org/dri-devel/aPJrs7_u8KcalNsC@intel.com/
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: dri-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/sysfb/drm_sysfb_modeset.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/sysfb/drm_sysfb_modeset.c b/drivers/gpu/drm/=
sysfb/drm_sysfb_modeset.c
> index 8517c490e815..6214b7709b37 100644
> --- a/drivers/gpu/drm/sysfb/drm_sysfb_modeset.c
> +++ b/drivers/gpu/drm/sysfb/drm_sysfb_modeset.c
> @@ -258,7 +258,7 @@ int drm_sysfb_plane_helper_begin_fb_access(struct drm=
_plane *plane,
> =20
>  =09ret =3D -EINVAL;
> =20
> -=09crtc_state =3D drm_atomic_get_crtc_state(plane_state->state, plane_st=
ate->crtc);
> +=09crtc_state =3D drm_atomic_get_new_crtc_state(plane_state->state, plan=
e_state->crtc);

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


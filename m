Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62CBF9170EE
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 21:11:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17D8F10E07A;
	Tue, 25 Jun 2024 19:11:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Z/V43lAs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B19D10E07A
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 19:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719342678;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J6Dr7XzQihg9MSKxY6pbB34NIR1CD8eMrbVwTROvnJc=;
 b=Z/V43lAsZ3z1c7Cjc7vwel2fJ4VviiJwUH8kjZZF7S7Cs9zhlkKkQqjz9CwjLSQHdr+bQ9
 gIJV0vawQlmJ0NYOieMJ90HHoLNwAo/3NkTO9nJPL1i2pO1W6eWd0JefmakULssxMUCgOa
 p1htAcWg2dL6F/9ksM0YuSNcTjQ6l+s=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-hWS2Bj75Pia3HS6jmhtaUA-1; Tue, 25 Jun 2024 15:11:15 -0400
X-MC-Unique: hWS2Bj75Pia3HS6jmhtaUA-1
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6b50433add5so90310426d6.3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 12:11:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719342675; x=1719947475;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ifx89QbqNTvqNTqVFeOnhXLP0jmM+ngsCZbnU659x1A=;
 b=MTo7oUYaDTOiLOd10g8S3+Zq2cRX2AXQ0cBep535WsdVDqD+SsojmRLDiJNRfpEAkv
 wu5Jb7mmLKO9wn+YBHSYEqgxJR2EwvR0wdRb5XtwG7sTmYqpcjo7/Dd2PHkCJR7MfHdY
 KwnWIGSwQ2PTqAGos1WkUXkvSACRFoMMtV/CbEE+Hba3YktULFonJH0qlbmp+i3e4CS3
 0054H3XBpLVxOmA5D7ZQe01ZiMxv5B//2op/53Xit36KWFVUcix5tEaZPmWU61lbYH8O
 YtyaWL2ZDrPuWowOr0HefXxGMGqT3+dumamgXAX9HopehvckqfUctkeGWsblubipEBJT
 eRNA==
X-Gm-Message-State: AOJu0YzDFhC27it55ZJHUAUw168Ob0SWOzX/w1Wdq1p+8beTixQ/ND6V
 ksURVXh4enzTx5zjDa+tBJ3RTJP8KYLZdo7GUCCvroS3idux1p3nxnzKJGBSsl5DbydeOFvi/XR
 le/0rzupJ9kZkoXDExQFUDnjzCKu1qKRjkBfKo7g8OZiSo8Ose7v3+H+WDf8Kbjo45g==
X-Received: by 2002:a0c:ac4c:0:b0:6b5:101d:201 with SMTP id
 6a1803df08f44-6b53bbd2640mr88923816d6.39.1719342674641; 
 Tue, 25 Jun 2024 12:11:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6Jt3WC0d7hZup1taiuXs6wrI0vbXesfenzHXw1GMzzA+zIlNjhXPp/ZyUSjSvtzxHI6BjjQ==
X-Received: by 2002:a0c:ac4c:0:b0:6b5:101d:201 with SMTP id
 6a1803df08f44-6b53bbd2640mr88923626d6.39.1719342674299; 
 Tue, 25 Jun 2024 12:11:14 -0700 (PDT)
Received: from chopper.lyude.net ([2600:4040:5c4c:a000::789])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b51ef54a9bsm47185826d6.112.2024.06.25.12.11.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 12:11:13 -0700 (PDT)
Message-ID: <2020b1333c0f0be49648b81ebc4b55f3abe0a2cd.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau/dispnv04: fix null pointer dereference in
 nv17_tv_get_ld_modes
From: Lyude Paul <lyude@redhat.com>
To: Ma Ke <make24@iscas.ac.cn>, kherbst@redhat.com, dakr@redhat.com, 
 airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Tue, 25 Jun 2024 15:11:12 -0400
In-Reply-To: <20240625081828.2620794-1-make24@iscas.ac.cn>
References: <20240625081828.2620794-1-make24@iscas.ac.cn>
Organization: Red Hat Inc.
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Tue, 2024-06-25 at 16:18 +0800, Ma Ke wrote:
> In nv17_tv_get_ld_modes(), the return value of drm_mode_duplicate()
> is
> assigned to mode, which will lead to a possible NULL pointer
> dereference
> on failure of drm_mode_duplicate(). Add a check to avoid npd.
>=20
> Cc: stable@vger.kernel.org
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> ---
> =C2=A0drivers/gpu/drm/nouveau/dispnv04/tvnv17.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
> b/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
> index 670c9739e5e1..4a08e61f3336 100644
> --- a/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
> +++ b/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
> @@ -209,6 +209,8 @@ static int nv17_tv_get_ld_modes(struct
> drm_encoder *encoder,
> =C2=A0=09=09struct drm_display_mode *mode;
> =C2=A0
> =C2=A0=09=09mode =3D drm_mode_duplicate(encoder->dev, tv_mode);
> +=09=09if (!mode)
> +=09=09=09continue;
> =C2=A0
> =C2=A0=09=09mode->clock =3D tv_norm->tv_enc_mode.vrefresh *
> =C2=A0=09=09=09mode->htotal / 1000 *

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat


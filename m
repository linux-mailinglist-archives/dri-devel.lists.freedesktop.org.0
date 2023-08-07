Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8AA773054
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 22:33:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65BA710E0F0;
	Mon,  7 Aug 2023 20:32:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B06610E0F0
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Aug 2023 20:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691440377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=feydv8gzqlPAj6AHa2Vc58a8yXOwJJf6YmsxhyRJzEg=;
 b=PcQSPMUmB+vUrfK8s51P4lABfqP9a74C9i9iFvZhos2l6LcKAUEg2UKgdHezEbo3e6MXzp
 6FMBlUQepn5kBa2/qYxvSs2bFa6mzvgyktp01/dYZmiLMssdFpA21LpegdwmshReBEyVvE
 qWb2mIwcajrHdm+KcZI+AlL9zVSkK1Y=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-110--4Hp9EEuOoeEIvGBr3bkOg-1; Mon, 07 Aug 2023 16:32:56 -0400
X-MC-Unique: -4Hp9EEuOoeEIvGBr3bkOg-1
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-40fb76bd50aso40975111cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Aug 2023 13:32:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691440376; x=1692045176;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ef2qFHsqfq9w04kkUFwpr5VGp6ZXP1q9+YtKoiAHED8=;
 b=G2VeBRO+sWmYuEJnaF/kv7bzOZN/OPVroHvg/BZy35e4PjnG5ilA5DurCox9eHLLNx
 tepkKLe98hkDWaRPYUlxkmvT4zzIsxoCyZg8jxvv2um2gLCTBrDSbJDNXRxgVP2Z4bVl
 1y6nA9ROLL4n+4zqm1qO+q3QXwyUaDSnod1dM5CT8VVYEec2n2BwtHPc55Gt5vR5ZNji
 zttPEVJuGdKf8KYYTa5NIzkFjrBAhCGGdiw8OSJSCHTwfcjYwOq/5ka+WKfN+m8XkhJj
 QGKTFaf2P3ZTAxzf4YLU0qdd/9ZF1SPdKX1n/MibCKX0zpPBlgXEqF5kjTq65I+Hv9vt
 qBPw==
X-Gm-Message-State: AOJu0Yw05ItsYiO/0QDJurB1DAdq0mUfNg0JfRme6QcIQ0Lz1RyuIqLv
 2ZE+voXmnu+RlgXfumXMXoT2sjo1HPF3aGoTaH8+KiePur3srqzAOxP1nZ02qForBqaRe8mlMsq
 80WcpGkQ/gtm3SFQsJHFE5Izu4+iO
X-Received: by 2002:a05:622a:1301:b0:410:682:972c with SMTP id
 v1-20020a05622a130100b004100682972cmr6058595qtk.62.1691440375836; 
 Mon, 07 Aug 2023 13:32:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPqPsJ9+KhVuwjTgj9i7DT2wVC/+erfl77JxIrDG0C82kOepjLE2//seLYHR3tPeHf0bg4Kg==
X-Received: by 2002:a05:622a:1301:b0:410:682:972c with SMTP id
 v1-20020a05622a130100b004100682972cmr6058576qtk.62.1691440375600; 
 Mon, 07 Aug 2023 13:32:55 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c7d:5f00:6966:42dc:c4a4:dad3?
 ([2600:4040:5c7d:5f00:6966:42dc:c4a4:dad3])
 by smtp.gmail.com with ESMTPSA id
 r17-20020ac87951000000b00401217aa51dsm2894075qtt.76.2023.08.07.13.32.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 13:32:54 -0700 (PDT)
Message-ID: <b350fd1e60cc0fa24a81be512e35f9b6a2358f94.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau/disp: Revert a NULL check inside
 nouveau_connector_get_modes
From: Lyude Paul <lyude@redhat.com>
To: Karol Herbst <kherbst@redhat.com>, linux-kernel@vger.kernel.org
Date: Mon, 07 Aug 2023 16:32:53 -0400
In-Reply-To: <20230805101813.2603989-1-kherbst@redhat.com>
References: <20230805101813.2603989-1-kherbst@redhat.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.48.3 (3.48.3-1.fc38)
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
Cc: Olaf Skibbe <news@kravcenko.com>, nouveau@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ugh, thanks for catching this!

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Sat, 2023-08-05 at 12:18 +0200, Karol Herbst wrote:
> The original commit adding that check tried to protect the kenrel against
> a potential invalid NULL pointer access.
>=20
> However we call nouveau_connector_detect_depth once without a native_mode
> set on purpose for non LVDS connectors and this broke DP support in a few
> cases.
>=20
> Cc: Olaf Skibbe <news@kravcenko.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Closes: https://gitlab.freedesktop.org/drm/nouveau/-/issues/238
> Closes: https://gitlab.freedesktop.org/drm/nouveau/-/issues/245
> Fixes: 20a2ce87fbaf8 ("drm/nouveau/dp: check for NULL nv_connector->nativ=
e_mode")
> Signed-off-by: Karol Herbst <kherbst@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_connector.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/dr=
m/nouveau/nouveau_connector.c
> index f75c6f09dd2af..a2e0033e8a260 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_connector.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
> @@ -967,7 +967,7 @@ nouveau_connector_get_modes(struct drm_connector *con=
nector)
>  =09/* Determine display colour depth for everything except LVDS now,
>  =09 * DP requires this before mode_valid() is called.
>  =09 */
> -=09if (connector->connector_type !=3D DRM_MODE_CONNECTOR_LVDS && nv_conn=
ector->native_mode)
> +=09if (connector->connector_type !=3D DRM_MODE_CONNECTOR_LVDS)
>  =09=09nouveau_connector_detect_depth(connector);
> =20
>  =09/* Find the native mode if this is a digital panel, if we didn't

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat


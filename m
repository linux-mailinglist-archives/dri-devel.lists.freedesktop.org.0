Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B892D769F
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 14:33:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A44DB6EDED;
	Fri, 11 Dec 2020 13:33:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C331D6EDED
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 13:32:59 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id b10so8565782ljp.6
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 05:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=5EtVoRMjoicKd1UcJfviB3iQms4POZajTyOufISo34Y=;
 b=PWP1HTAK5MhaooPXNc5UItzCaxW8BeUATb4jnV/+X/1KZYWKP2E1af9VO71w8P9g0s
 ID95XJPDF/NV4vUkquIFBffGojMe2l98jucGEIscSN5HUZ5xKxCZQvKu/wduWUK56oBB
 6tH8amfxT7v/NTp0sPhejlwBcMYxS/+S5jyE0SYtVr/X0mFpGxjnOdtEv5qNph0ydjvr
 UjTdUQGZS/xvkziVkUdc+nzFpeXst2OedMD3xHRylwIuvMA+9+vc21FdXcgnlBt/tHEH
 MIHbgdm719WYE8Wz5Gi2dHkpLqEpelHlfmmiYhiDvQTAyDgpbz898mTUhXK5SkrvcSvk
 vwaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=5EtVoRMjoicKd1UcJfviB3iQms4POZajTyOufISo34Y=;
 b=UwznJy/hmNRuip7HP1UvmhOrXmD5nCA5SitjIC6BwPGTiHPQl8KzawadVFQ9c5sPWY
 2L7MLFdPKumGUBmJvPBZVxSz8jdu1rOP6LRQyKs4OQENkrhPMOvp7y+BiIhC/DTlr15g
 wsvySTE/NIreE/1DLrO2PnQvhYt20Zihz0Za4wgfNKm4QKVakUiAXyVOM4tHtlkl/zLa
 NjBoOxlakf6EQXnzWNgNr0Ntdt2BJnda4dCJsx+PAlYCHw38YXqBVEipeRAJyVmASHuf
 h9FgKT7ckhfBBlSHtq9/cG+hMuGUJVzhvyfJ4+78zhE9+yh0dR+pFMio8zWlhlc7PADJ
 sFSA==
X-Gm-Message-State: AOAM530Nq+8Obpvuybnsh1XmL6gD7RXGkbHPMn2okKyOXRqTVnKNUMB6
 cC9AB6k4YYoAmoCwmkNNwO8=
X-Google-Smtp-Source: ABdhPJwpcPggX6N8A8aWIFCQrsLCNSIuw50tOckPJbguFx5lxcHTn/2WOt7s9uczlP7OBqIkph6W5g==
X-Received: by 2002:a2e:9951:: with SMTP id r17mr4905517ljj.113.1607693578193; 
 Fri, 11 Dec 2020 05:32:58 -0800 (PST)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id m17sm885472lfo.132.2020.12.11.05.32.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Dec 2020 05:32:57 -0800 (PST)
Date: Fri, 11 Dec 2020 15:32:55 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v3 2/4] drm: validate possible_crtcs for primary and
 cursor planes
Message-ID: <20201211153255.30782d9e@eldfell>
In-Reply-To: <s0P4QVy7rx7iX5jIPuPPPXwFdJrn1sMI1jgKUBLOsI@cp4-web-032.plabs.ch>
References: <s0P4QVy7rx7iX5jIPuPPPXwFdJrn1sMI1jgKUBLOsI@cp4-web-032.plabs.ch>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0531395438=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0531395438==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/BByGng01=+vY./bz.Mu0KCO"; protocol="application/pgp-signature"

--Sig_/BByGng01=+vY./bz.Mu0KCO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 11 Dec 2020 13:06:14 +0000
Simon Ser <contact@emersion.fr> wrote:

> If a primary or cursor plane is not compatible with a CRTC it's attached
> to via the legacy primary/cursor field, things will be broken for legacy
> user-space.
>=20
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>

Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>

> ---
>  drivers/gpu/drm/drm_mode_config.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode=
_config.c
> index f1affc1bb679..2c73a60e8765 100644
> --- a/drivers/gpu/drm/drm_mode_config.c
> +++ b/drivers/gpu/drm/drm_mode_config.c
> @@ -625,6 +625,7 @@ static void validate_encoder_possible_crtcs(struct dr=
m_encoder *encoder)
>  void drm_mode_config_validate(struct drm_device *dev)
>  {
>  	struct drm_encoder *encoder;
> +	struct drm_crtc *crtc;
> =20
>  	if (!drm_core_check_feature(dev, DRIVER_MODESET))
>  		return;
> @@ -636,4 +637,19 @@ void drm_mode_config_validate(struct drm_device *dev)
>  		validate_encoder_possible_clones(encoder);
>  		validate_encoder_possible_crtcs(encoder);
>  	}
> +
> +	drm_for_each_crtc(crtc, dev) {
> +		if (crtc->primary) {
> +			WARN(!(crtc->primary->possible_crtcs & BIT(crtc->index)),
> +			     "Bogus primary plane possible_crtcs: [PLANE:%d:%s] must be compa=
tible with [CRTC:%d:%s]\n",
> +			     crtc->primary->base.id, crtc->primary->name,
> +			     crtc->base.id, crtc->name);
> +		}
> +		if (crtc->cursor) {
> +			WARN(!(crtc->cursor->possible_crtcs & BIT(crtc->index)),
> +			     "Bogus cursor plane possible_crtcs: [PLANE:%d:%s] must be compat=
ible with [CRTC:%d:%s]\n",
> +			     crtc->cursor->base.id, crtc->cursor->name,
> +			     crtc->base.id, crtc->name);
> +		}
> +	}
>  }


--Sig_/BByGng01=+vY./bz.Mu0KCO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl/TdQcACgkQI1/ltBGq
qqe5fw/+LfoXKzmwFyJg6L0rtcsRF8xSKzo+Yhvz0PU48+LlBuuX75AUdNtSZEwO
GoVzT2L5S3WIpueVf8qVyDFy7tK0hXgOj8fzwyFuClX/hTCAdNXvVTYrPb4nROmq
ogos0ceCsRuLuu+tMZ3qgV+3LVnwSeme+QrIAL4dBwq7SYOdRn8rnqKxbQY/RUHj
YkLZwxtY/XV0ZWNkIsclRAZ9NtGSk9usafJ1ojfzTGPqKjMUeiB2X5nXoK/Z6IoQ
Gy2gxxaNGBDcHyRWv7scN5eCP53v/nkpe+e1OsCWriII2RWv+sWCPtRioBnBSYwO
LuM2RpvqnHBfCRKvixKJBb5qUSXwSsoGaa9KC9h2ziRwy56D3iTzFHgNtNIY6jh1
23mf6f4tpwg7yCre1CwJSxzRqBqdmuqkqQzgZNBOoT4OImKdFXvyYTM+tmTdcKFR
+jcDI7OgCIJJ2rnzS5M1uMDfop2JIsm1Hz/j/tjcrCq85AmfmuCbtVFKBMBW1cLj
7nHmnNAxX6p4j7VDn5xn+ceBXBM3XzXfJQ75dooVvPUrFVFdl61jlnKvzZ9SM2kM
ZFHZmJlpE6KSscK88BkzdtsD+FIyuRctkV3rQ3a3QOdPPNV2prMYNqn1n6yrmYJ+
VEP8XfzB+2yvCS01tX6bksDdEvJZtTbixm1HSiDtJikM/TQYUCM=
=+Dht
-----END PGP SIGNATURE-----

--Sig_/BByGng01=+vY./bz.Mu0KCO--

--===============0531395438==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0531395438==--

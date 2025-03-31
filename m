Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2830A76771
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 16:09:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51AC110E134;
	Mon, 31 Mar 2025 14:09:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TgWE4TFT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B97810E134
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 14:09:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 15B05A40B31;
 Mon, 31 Mar 2025 14:04:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 460D0C4CEE3;
 Mon, 31 Mar 2025 14:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743430188;
 bh=TwSbUk2bexhBRfYZh2O2px1+cAq6T4pwFbXJLNozjNc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TgWE4TFT5TJnnKd32XnTxF64gPG34kwjwETYZ+oclfBfZhMpSdc2PrGfO0zI22S30
 u1Vlj2Qx4I/F/mSDM+f7B84WEYnRKmfaH0Kkf3oec8INZyZ1Fj0vw8hmmsZEG3hLWM
 3HtHgfK79276QhgtSR77rl3GZb/m78EZFfFEzZAJB+XFBNoX8V405FbQoxsnGAlv7b
 nsocigMJTqfkngSDmTIRQqKIvTuhnBFaC1xeiAlLUOExbbdJUwW5Gz+UIKRbWeaM5V
 iEkaGYwa+E9wkFo73tue119OyEuENr4ZWz6UIGplaZE4L7vMI+TO4LeTpgTx8/9Cyv
 YePjfSwKCe8OQ==
Date: Mon, 31 Mar 2025 16:09:45 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 1/4] drm/panel: Add new helpers for refcounted panel
 allocatons
Message-ID: <20250331-defiant-jackrabbit-of-culture-cffe6a@houat>
References: <20250330-b4-panel-refcounting-v3-0-0e0d4e4641eb@redhat.com>
 <20250330-b4-panel-refcounting-v3-1-0e0d4e4641eb@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="imf3y3eouv67rpth"
Content-Disposition: inline
In-Reply-To: <20250330-b4-panel-refcounting-v3-1-0e0d4e4641eb@redhat.com>
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


--imf3y3eouv67rpth
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 1/4] drm/panel: Add new helpers for refcounted panel
 allocatons
MIME-Version: 1.0

On Sun, Mar 30, 2025 at 10:24:12PM -0400, Anusha Srivatsa wrote:
> diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
> index a9c042c8dea1a82ef979c7a68204e0b55483fc28..97a5457b64fbbe9c91c6a4f41=
b8e1fbfe4fa604e 100644
> --- a/include/drm/drm_panel.h
> +++ b/include/drm/drm_panel.h
> @@ -268,6 +268,30 @@ struct drm_panel {
>  	bool enabled;
>  };
> =20
> +void *__devm_drm_panel_alloc(struct device *dev, size_t size, size_t off=
set,
> +			     const struct drm_panel_funcs *funcs,
> +			     int connector_type);
> +
> +/**
> + * devm_drm_panel_alloc - Allocate and initialize a refcounted panel.
> + * The reference count is initialised to 1 and is automatically  given b=
ack
> + * by devm action.

No. I told you in my previous email that it needed to be between the argume=
nts and returns
sections ...

> + * @dev: struct device of the panel device
> + * @type: the type of the struct which contains struct &drm_panel
> + * @member: the name of the &drm_panel within @type
> + * @funcs: callbacks for this panel
> + * @connector_type: the connector type (DRM_MODE_CONNECTOR_*) correspond=
ing to
> + * the panel interface

=2E.. So here, just like you did for all the other functions you introduced.

Also, there's no reference counting yet, so that paragraph should be in
your second patch.

Maxime

--imf3y3eouv67rpth
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ+qiKQAKCRDj7w1vZxhR
xdJRAQCHNMX/G/Wz1zDjAtn+FlQ+3vGE7rpJ3/FEU94kH5uBIgEAlXtggqh5ttPL
ZlOzl5oF4hEn2BkxYrkpcsHty9iH5ws=
=txRs
-----END PGP SIGNATURE-----

--imf3y3eouv67rpth--

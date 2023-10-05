Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3717B9BC5
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 10:19:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA1C410E159;
	Thu,  5 Oct 2023 08:18:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BF6810E159
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Oct 2023 08:18:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id AE7A0B8232A;
 Thu,  5 Oct 2023 08:18:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4CBEC116AA;
 Thu,  5 Oct 2023 08:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696493935;
 bh=oLo6ss21ULG3s83aZaxdADlYrGWYjqQRzJ59PBXW/tg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=No/nQUpU6IVmjZv9ASiYSR0mayvCFf3Ks55L2rn9PgBxyNgz4NVYRrnGkr9gttduW
 wInV7iCrbnAyUl2ZPkMlMoEAsPVOah/Sy0hS7A0NEHuK0e8Yu2Wv/CDxOhdFq/Mxok
 lPCfLc2HOK35Znb2Dx/WS3twVpXY294iCTJ2hWIK+FgO3xf8RVCL7V1f7LWvd7+egG
 LfoDF1+dxs/wMsOaYhXn8WdUGUzEu0+21FEYyn8rYEyBQMnHQzghykoYvIdg8o8Lno
 5CisAufFl0kKN++XoSZdk+WXJ2G5OHNefunqaNxkw3zjhPkHLKzcvItb/uNCe/4ow1
 qYiVCGMSW2AtA==
Date: Thu, 5 Oct 2023 10:18:52 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [PATCH v4 2/4] drm/panic: Add a drm panic handler
Message-ID: <lbwngkco3zam7yjo3owwpn47o3pe6g7oh5giglsclenx52jk5q@lw2fwsxz6kqp>
References: <20231003142508.190246-1-jfalempe@redhat.com>
 <20231003142508.190246-3-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="7chx3cpqdqpsi57g"
Content-Disposition: inline
In-Reply-To: <20231003142508.190246-3-jfalempe@redhat.com>
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
Cc: bluescreen_avenger@verizon.net, tzimmermann@suse.de, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, gpiccoli@igalia.com, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--7chx3cpqdqpsi57g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Oct 03, 2023 at 04:22:45PM +0200, Jocelyn Falempe wrote:
> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index 89e2706cac56..e538c87116d3 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -43,6 +43,7 @@ struct dma_buf_attachment;
>  struct drm_display_mode;
>  struct drm_mode_create_dumb;
>  struct drm_printer;
> +struct drm_scanout_buffer;
>  struct sg_table;
> =20
>  /**
> @@ -408,6 +409,19 @@ struct drm_driver {
>  	 */
>  	void (*show_fdinfo)(struct drm_printer *p, struct drm_file *f);
> =20
> +	/**
> +	 * @get_scanout_buffer:
> +	 *
> +	 * Get the current scanout buffer, to display a panic message with drm_=
panic.
> +	 * It is called from a panic callback, and must follow its restrictions.
> +	 *
> +	 * Returns:
> +	 *
> +	 * Zero on success, negative errno on failure.
> +	 */
> +	int (*get_scanout_buffer)(struct drm_device *dev,
> +				  struct drm_scanout_buffer *sb);
> +

What is the format of that buffer? What is supposed to happen if the
planes / CRTC are setup in a way that is incompatible with the buffer
format?

I've said it in that other series, but I really think we should be
having a proper state on the side to deal with those properly.

Maxime

--7chx3cpqdqpsi57g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZR5xbAAKCRDj7w1vZxhR
xShKAQCb3eVQFjzkcFIy1D/skkPp9MVy/hN1wXbsQKcb464hwgEAkA3jXpQfwzaz
kO1qunui0BMlbdY2qu4AtbN/0hB4vA8=
=U309
-----END PGP SIGNATURE-----

--7chx3cpqdqpsi57g--

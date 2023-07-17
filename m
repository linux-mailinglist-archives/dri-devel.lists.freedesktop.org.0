Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 451BC755E64
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 10:25:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F50C89C86;
	Mon, 17 Jul 2023 08:25:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 119C989C86
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 08:25:22 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4742860FA6;
 Mon, 17 Jul 2023 08:25:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54A55C433C7;
 Mon, 17 Jul 2023 08:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689582321;
 bh=doFHr3QF6bY8ddY9UhfVjgKC7xXSlDDrpfA6E5eb81U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QryReVgmTffP0w3I9RGl4nFKC8sPFjHYkCtysJYPg9S/Sf6VJ5cTUoEpRNchMMySi
 x7bglbzQ/qOk6boZWTyNhibd4AoOatma0gz+uTxQBTUuiqtdWdj6bM1Vvs1GsWAtZN
 dMqewzojwlGJ+PjCkWr8Z+0dWkSctwS5qn4lmMtuSJYNjqORgaXJO8JFgkQ+F2t4Wm
 K8biyc4nm3dSHuA1g8DF7SLnxv4mVWZu0h0reo8TnsHBnOgjtRq+m+SkZ7gJ1r8JAs
 WXgY8cLs670wDadgVhj0UfiKgETTnFZMtx8WRyITd5OlDdD3Tbv435GR5sn+63IZDz
 +JtGNxVZmgPgg==
Date: Mon, 17 Jul 2023 10:25:18 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Sarah Walker <sarah.walker@imgtec.com>
Subject: Re: [PATCH v4 07/17] drm/imagination: Add GPU ID parsing and
 firmware loading
Message-ID: <fd2daftonqrd6ae2pc6jlyw5zv4n4hhmzb5ifnrhb24kjpzecp@vk74clsdhy2l>
References: <20230714142700.111897-1-sarah.walker@imgtec.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="7f4trdj3svh4pmk2"
Content-Disposition: inline
In-Reply-To: <20230714142700.111897-1-sarah.walker@imgtec.com>
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
Cc: matthew.brost@intel.com, luben.tuikov@amd.com, tzimmermann@suse.de,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, afd@ti.com,
 boris.brezillon@collabora.com, dakr@redhat.com, donald.robson@imgtec.com,
 hns@goldelico.com, christian.koenig@amd.com, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--7f4trdj3svh4pmk2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 14, 2023 at 03:27:00PM +0100, Sarah Walker wrote:
> +/**
> + * pvr_device_gpu_fini() - GPU-specific deinitialization for a PowerVR device
> + * @pvr_dev: Target PowerVR device.
> + */
> +static void
> +pvr_device_gpu_fini(struct pvr_device *pvr_dev)
> +{
> +	release_firmware(pvr_dev->fw_dev.firmware);
> +}
> +

Since you call that function at remove time, I think you can register a
devm action using devm_add_action_or_reset() to remove the need to call
it explicitly (and probably the need to have pvr_device_fini() in the
first place)

Maxime

--7f4trdj3svh4pmk2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZLT67gAKCRDj7w1vZxhR
xXSKAP9sDARcLROGvAko1J3uZQb/zCiLFU6sAlcdkH63quaN4QD9EaD0LaWdahRi
9dKFxXH1g5VK/dbuuzt8CBjXUQEMKwk=
=GtC6
-----END PGP SIGNATURE-----

--7f4trdj3svh4pmk2--

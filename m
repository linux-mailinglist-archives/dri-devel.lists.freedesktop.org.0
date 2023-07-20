Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 820A675AB9F
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 12:02:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5701810E5AB;
	Thu, 20 Jul 2023 10:02:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBE4910E58F
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 10:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689847336;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KJqbwcpKpzwPfyG3YY4y4NKa/rYO72LYoQWc/nRB+o0=;
 b=Hop2AXiNVB8E9hIql2qbWeS3l46zD+Ri3wUEWc4r2h0PSxhg8qvN0raRmJxe7Kj33u53Yg
 FXSggxUM2VQdX5FunC7yCZd5njhg5f/ERFVuXVW4K0ySRh8hcSkvn7xEmXVY+qI5JLKh38
 ug6wAbhsneKTTZ7EQqUsgHffWN2EF/4=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-586-tCzdYrg5P6mMx-QIoDw0QA-1; Thu, 20 Jul 2023 06:02:15 -0400
X-MC-Unique: tCzdYrg5P6mMx-QIoDw0QA-1
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-403b7a5be1dso8006131cf.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 03:02:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689847335; x=1690452135;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KJqbwcpKpzwPfyG3YY4y4NKa/rYO72LYoQWc/nRB+o0=;
 b=eOu+wCa94tbgvuYzIb2Xv2o+gFDaMVZcBF7vwHKDbSa7tRS7dMsWgHLTkDYoa2p6MN
 L9sZMMGHGu5blzilpSpXRzxY73qyObsOI7pd4HZVEGDNijo5Veyv/WmeYpXmGf71zhRg
 AqzeApdPk7hHsJFZlfw44jgEwHyUs6NN2rSlI35GtF2/FbUBrM+nJ1JeVy9grKWIlkZk
 BNh0NqxlbJJWS9Zs6r2xZvny1N5XaKhX8Tj+E/inqRRqspo6kOC1UFZHclXHsiVmHiB5
 fmwuFXLq6tXlrEQSIj3ggVVdvnkehZUdH6fof4go6m/l7EIJ5DIl7FADWAVI2p4KpAtJ
 exqw==
X-Gm-Message-State: ABy/qLaUNYPz2CrmzQMpQ2BYu23lxlrpjGyt7uaVrnSgAC+1YCZjcaKA
 /Q4W7VMVWc0CvCbBMnjcRdz0zJiKGSvtyFh3a+zHq/Haau//ivZZTQXQw0/pwG8BFxqxcJ62MhS
 O8pt+sljLvZ/CIbVeuA2vRyCsWR5B
X-Received: by 2002:a05:622a:1805:b0:400:9a53:75d2 with SMTP id
 t5-20020a05622a180500b004009a5375d2mr24445702qtc.18.1689847334835; 
 Thu, 20 Jul 2023 03:02:14 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEueH+j6ORrxZFhAXhiVK6nEIkbqbyb11QsjbwMYGrPWVDKS0lWgmf3hbPTLv9WE3yd3Wg8BA==
X-Received: by 2002:a05:622a:1805:b0:400:9a53:75d2 with SMTP id
 t5-20020a05622a180500b004009a5375d2mr24445677qtc.18.1689847334529; 
 Thu, 20 Jul 2023 03:02:14 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 cr19-20020a05622a429300b0040335131048sm189838qtb.93.2023.07.20.03.02.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jul 2023 03:02:14 -0700 (PDT)
Date: Thu, 20 Jul 2023 12:02:12 +0200
From: Maxime Ripard <mripard@redhat.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v3] drm/ssd130x: Fix an oops when attempting to update a
 disabled plane
Message-ID: <c5khbm4v2ynjgcfhin2htixkyuycfydr6rie5irnyu6gytxg6q@4ghg4ufjgnfx>
References: <20230717163027.480918-1-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="qe3hblf2skw3xamx"
Content-Disposition: inline
In-Reply-To: <20230717163027.480918-1-javierm@redhat.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Geert Uytterhoeven <geert@linux-m68k.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--qe3hblf2skw3xamx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jul 17, 2023 at 06:30:22PM +0200, Javier Martinez Canillas wrote:
> Geert reports that the following NULL pointer dereference happens for him
> after commit 49d7d581ceaf ("drm/ssd130x: Don't allocate buffers on each
> plane update"):
>=20
>     [drm] Initialized ssd130x 1.0.0 20220131 for 0-003c on minor 0
>     ssd130x-i2c 0-003c: [drm] surface width(128), height(32), bpp(1)
>     and format(R1   little-endian (0x20203152))
>     Unable to handle kernel NULL pointer dereference at virtual address 0=
0000000
>     Oops [#1]
>     CPU: 0 PID: 1 Comm: swapper Not tainted
>     6.5.0-rc1-orangecrab-02219-g0a529a1e4bf4 #565
>     epc : ssd130x_update_rect.isra.0+0x13c/0x340
>      ra : ssd130x_update_rect.isra.0+0x2bc/0x340
>     ...
>     status: 00000120 badaddr: 00000000 cause: 0000000f
>     [<c0303d90>] ssd130x_update_rect.isra.0+0x13c/0x340
>     [<c0304200>] ssd130x_primary_plane_helper_atomic_update+0x26c/0x284
>     [<c02f8d54>] drm_atomic_helper_commit_planes+0xfc/0x27c
>     [<c02f9314>] drm_atomic_helper_commit_tail+0x5c/0xb4
>     [<c02f94fc>] commit_tail+0x190/0x1b8
>     [<c02f99fc>] drm_atomic_helper_commit+0x194/0x1c0
>     [<c02c5d00>] drm_atomic_commit+0xa4/0xe4
>     [<c02cce40>] drm_client_modeset_commit_atomic+0x244/0x278
>     [<c02ccef0>] drm_client_modeset_commit_locked+0x7c/0x1bc
>     [<c02cd064>] drm_client_modeset_commit+0x34/0x64
>     [<c0301a78>] __drm_fb_helper_restore_fbdev_mode_unlocked+0xc4/0xe8
>     [<c0303424>] drm_fb_helper_set_par+0x38/0x58
>     [<c027c410>] fbcon_init+0x294/0x534
>     ...
>=20
> The problem is that fbcon calls fbcon_init() which triggers a DRM modeset
> and this leads to drm_atomic_helper_commit_planes() attempting to commit
> the atomic state for all planes, even the ones whose CRTC is not enabled.
>=20
> Since the primary plane buffer is allocated in the encoder .atomic_enable
> callback, this happens after that initial modeset commit and leads to the
> mentioned NULL pointer dereference.

I think that's where the problem lies: you must not allocate a buffer in
atomic_enable.

After drm_atomic_helper_swap_state(), the new commit is being applied
and you aren't allowed to fail, and an allocation can fail.

Everything needs to be prepared by the time _swap_state is called, and
it's one of the point of atomic_check.

So you need to allocate your buffer there, and use it in whatever
atomic_commit related hook you need it in.

The typical way of doing this would be to create a custom state
structure that embeds the global one, create your own reset,
atomic_duplicate_state and atomic_destroy_state implementations, and
store the buffer pointer there.

Maxime

--qe3hblf2skw3xamx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZLkGJAAKCRDj7w1vZxhR
xb3DAP467ZC4xwaMcpeAN/JCF36jZ/w3OkV6Wp2IWhvd6gjJMAEA4vwpEJdb9z9S
vJgNVFAAGlad6ZeJTgQ4tMs+SozE5gA=
=5vxz
-----END PGP SIGNATURE-----

--qe3hblf2skw3xamx--


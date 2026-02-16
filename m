Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJmBA9m0kmmtwgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 07:10:33 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4329114112A
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 07:10:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B366110E04D;
	Mon, 16 Feb 2026 06:10:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="XEyTdsRA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D678710E04D
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 06:10:26 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-48373a4bca3so12702975e9.0
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Feb 2026 22:10:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771222225; x=1771827025;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=SJZWZC5spayAzpOmngv84WsW+TBUL+/34ATLWEqj1r0=;
 b=XEyTdsRAQMq+bGTpy2ai3CHn5x1gCb0sL1ZNiqlihtSKG3pW7LbRZRWf5+y1Rsj5uS
 wZgtNukz3XDxO8g/sNTYfdiJAHmM+XaSALxPW51Q8+nFuQD14oScKbdl/uPqK9MryU1G
 Ck8cNW5qMDr9+u+EzIThzUm+19t2vw3sOsHod0kFfRRMjjJ7HwJF2Ky5slwFxLtxKvTI
 YiorUD1vKqZF7gM4ayt8+lTkbkMRML4tDQmc+7GuHGrDNYA2i/4KCHl0UtQVNrFhhPyT
 R5gLu826Blst9D0r3ditQIiNzancLRhXSAmnxPC5QwUptQTB+sPD7pcMKAYAyHLpwQSR
 lgZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771222225; x=1771827025;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SJZWZC5spayAzpOmngv84WsW+TBUL+/34ATLWEqj1r0=;
 b=cnxkelyyZ8nabRP5abi60ZtFu4iOtFMbzwFMuUEUHeMZh5OVKGOIM611gFMaiUhoXS
 rZRaHFuYtZEnfQzwau2N5RHsdhdDbkkmVXqEXBvGbg04KIVaQc8mPYdQOxrrj7Tdt3Jm
 5uwXILYwhSYWf1HMTNLyZ5Hb2jyWfCaX/w2DTVekOMSs7uN/LRvpm8Pibfa+bDGL9pnM
 TPAFHorEfpHileL6LLVRAgRHPiEMU2xG7j7mAF6zKO9SdPxyW7VK0ZY7cu9axxvxgGS1
 M+zl17myO9x1SPn3szICm3DFA2B2FWsA0mQrhXhhBNGq/+kfbogG8fBrqGuPzpyYEEM4
 P4KA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfkTvium0ElOmifJI2nhEnJl1eC5s7nhVYiNXQyHjrkwP4WpkGiYCKIgTzFCbD8DTVMl3powN1FTk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy+HVwt8czfHQuYJow8zFxTRpWnqRErI0bgv4G7EUlfHxt4X6SB
 Ui8LJxoj7jVRBimjaWG3rvC51dCM9BnLR09O/XB70HZbUX40I+OXvlZuIZMhjeZYsbI=
X-Gm-Gg: AZuq6aLipqv6yPaoinZqrpwEbwQplJBW4cBmK9hDkg2/u2zxLhte+PHE63WD+QGEq8i
 GjEIDM4rIQRtmpUstX2QY+IXXRx4yrI+w8U2Tusn38iBwMsHhJqGytBN7YhiciWRIKSG9SQBI6p
 vQJiOfsRfWzwdu+EbtNdaV45PiBVdLMilS5PGX6Ivwude367hunzXsmKpp/yVJVxMHiwoj0UFwF
 VBFG1yBcglDKNforB8UCoFoFeTJGrAUQnq+xlRE/FkvqEa20B4fbawloRZpF2REcGYZtnB5Zb8n
 CdIZ5Mk7C4NGdtNMIxfyv2HYQx+LVf2viyW1zgdu2JEQ2b6oAyXtIMrWYc8ikl1HcMUesJbeCrT
 5MPEOjvFiOMj8ucASa1kvCrgzTUyto5j/6YqmhUTJKe5e4/+P+5unnnYzJtvMwn44LN53vb7Yp6
 2FsxTaZc9JaQ5PMjHUCqbdfz3p7+IH
X-Received: by 2002:a05:600c:1912:b0:480:69ae:f0e9 with SMTP id
 5b1f17b1804b1-48379ba54aemr115518735e9.16.1771222225241; 
 Sun, 15 Feb 2026 22:10:25 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-48371998777sm267682385e9.1.2026.02.15.22.10.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Feb 2026 22:10:24 -0800 (PST)
Date: Mon, 16 Feb 2026 07:10:24 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Ethan Tidmore <ethantidmore06@gmail.com>
Cc: lanzano.alex@gmail.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 lumag@kernel.org, mehdi.djait@bootlin.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/tiny: sharp-memory: fix pointer error dereference
Message-ID: <aZK0bnHw63orpP3I@monoceros>
References: <20260216040438.43702-1-ethantidmore06@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="gat22qmrijur7gs2"
Content-Disposition: inline
In-Reply-To: <20260216040438.43702-1-ethantidmore06@gmail.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.91 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20230601.gappssmtp.com:s=20230601];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:ethantidmore06@gmail.com,m:lanzano.alex@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:lumag@kernel.org,m:mehdi.djait@bootlin.com,m:linux-kernel@vger.kernel.org,m:lanzanoalex@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,bootlin.com,lists.freedesktop.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[baylibre-com.20230601.gappssmtp.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 4329114112A
X-Rspamd-Action: no action


--gat22qmrijur7gs2
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/tiny: sharp-memory: fix pointer error dereference
MIME-Version: 1.0

On Sun, Feb 15, 2026 at 10:04:38PM -0600, Ethan Tidmore wrote:
> The function devm_drm_dev_alloc() returns a pointer error upon failure
> not NULL. Change null check to pointer error check.
>=20
> Detected by Smatch:
> drivers/gpu/drm/tiny/sharp-memory.c:549 sharp_memory_probe() error:
> 'smd' dereferencing possible ERR_PTR()
>=20
> Fixes: b8f9f21716fec ("drm/tiny: Add driver for Sharp Memory LCD")
> Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

Best regards
Uwe

--gat22qmrijur7gs2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmmStM0ACgkQj4D7WH0S
/k5o3gf+OhPsbnoeTUGSxPOCOvNNgI2tBciQssanxZhjPSLBQwUrPS6wpEtOjs/f
n5FTou39SpOTMZmBUAbGzqpcR8dAOxBxWAZZjzCn1WHSiulLN1p9g4Q45e7UVLbL
B8RGPi4ekyOvgTS2G26ED23QbdCu2FVSZ66D51SnZQy5VTmJnA6DHz/bTwhysJsi
lXqEEo5X5uYJKa7ksv7/8iWF59yVXWINGvrDEtiGoMhuCq9RS5Tvawk2ISceDT0v
RPSTh1esgmKLxKNzb2+pvLbeZpiru2FLE9mlTI/uWuwTyWPgYpUab1DeK1ZH+DoA
AwuVGNvbMvAPupTyjxdj2GcM1X4B8Q==
=0JBq
-----END PGP SIGNATURE-----

--gat22qmrijur7gs2--

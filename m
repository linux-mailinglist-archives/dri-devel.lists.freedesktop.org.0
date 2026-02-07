Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id XOrXJOOvh2nDbwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 07 Feb 2026 22:34:27 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C9C10729C
	for <lists+dri-devel@lfdr.de>; Sat, 07 Feb 2026 22:34:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDD1C10E299;
	Sat,  7 Feb 2026 21:34:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="AWKVbKa+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36F2610E299
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Feb 2026 21:34:23 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4801d7c72a5so15551205e9.0
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Feb 2026 13:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1770500062; x=1771104862;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=tfrnHsqrS7b6As3CIMHSJTCp+MPpzv+h69MSx8cjWHo=;
 b=AWKVbKa+tFpRIV4O9hfxQCri9DsorF4yp6x44bxye7ch4eBdlDb2qu1+on8gGLBHMm
 bXEexoFJGCrX9Hou93sBig2zSGWi0BMWVzR3nK0eVOL2PnmEuRVEi2m1HbcOOF3mieqy
 bRKGGLQvawkjOztYkj5/CBOEpR6EZ5c27gqcH05vbNuU5x5iVN6Evk6+jJCAZc8uF49j
 YCyYmGqxKSQr1dkWaBJPLjxncqjc0FVMIXqJ0t8pAjIhA3MayEiazdL+5bwZrvw1TCk6
 FaQ9ayUubEYNsQ25DsAYOokQmQoDfvJbqj75tAEBJpX+Ps9/w1fanA6N0QVq1hQu1cmf
 sxVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770500062; x=1771104862;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tfrnHsqrS7b6As3CIMHSJTCp+MPpzv+h69MSx8cjWHo=;
 b=iJpMx1p9nsGuhewOxnhaDDaunTjYZgjf/PfEM6NvwqS5FefngGNqUkywjNkjPL+fp1
 XujAMDhxBCe28mJuT4xYWkxaCJtR2p0yXnY5o++dLvB4RvC75Yj5VIyim7U/UR5hYdy3
 Ow87pASRP1FjwcwMYR+fePEdY7njj6f0aUE9cxpSfKZti6EIvTfgfj78FRALbr2UaQcg
 sa1CAUx0kTKfbKRQMXFgyo33Lg95UdMCFD++wC0xDZdIBcrVcT/KFFHxKtcbkwfQj9jO
 lWR8A68lHHRxYDkk9CR+4BCmqoivK6jEGpRQSzT1c2TUr1hkWskvGsb6oJBUcilp/t8E
 TF+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNLBoqVQPEz+VZPuBQu5pVZ5+TP/yxrrE7LUrh9TRj9PPtgKvnhBarie05OoOpekVCdnLciHMnrS8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxxWYdapWZgS7GoiD9dSq3YnunYH2tPT41ey3kJY5Ji2NLhJec9
 38zrsY5r0cWAQReMFLdV1PeT/WLMWeHYzDwmNs9BI6a/aaoWoeqI7J0b6Ogbhaarrfg=
X-Gm-Gg: AZuq6aI+sMcnWUwjpTGIyDN7cm2Bm0CGR7ZM9lGfUgIsUEcVUbgaSA6KaVj4YqJW39p
 LFiLwcnve5JKeuPyHt1iYJ3dRuQxB2MGyQPfKC46w6dA3j22ZrDKCk0xuNFFlDr5mdoOdAHpdrP
 D1x+zEPLsyOP+cDi6YS5BsiCfyrZRmIGotWnRhDjp8GKkG7EwVtmSna1KDzSxPZpmJaTDEUivPP
 X9rcMpfFGzmgR1Pg9URPt8k1tnm/hyRBAu520KkVxDxSm3pre91gu1gxns16IIBPiW+xkR0lw3G
 6P6iQcowhN9WD37I2k15ox7WCYU68Gek/GQmXJl71sN1q1JaR2nSViChXTdLENRdj7rejV0gCJX
 4gSqmJMrNJ7Z3DmBZcUu15EcBCEPXqHlNokIIVzlEuA+4W/m/nTqbjI9diPSaH733xgqXiWGADh
 VcBZ0H1MvOjfxa8+I4
X-Received: by 2002:a05:600c:3b03:b0:480:1b65:b741 with SMTP id
 5b1f17b1804b1-483201e3b8cmr91225305e9.15.1770500061712; 
 Sat, 07 Feb 2026 13:34:21 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-4376a78d796sm176771f8f.20.2026.02.07.13.34.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Feb 2026 13:34:21 -0800 (PST)
Date: Sat, 7 Feb 2026 22:34:16 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Helge Deller <deller@gmx.de>
Cc: Chen Ni <nichen@iscas.ac.cn>, linux-fbdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 1/4] fbdev: au1100fb: Don't store device specific data
 in global variables
Message-ID: <aYevgJ6cfe6JVlJq@monoceros>
References: <cover.1770483674.git.u.kleine-koenig@baylibre.com>
 <0e1ecdde447dc32816f1f066812ec8e84b4aad0a.1770483674.git.u.kleine-koenig@baylibre.com>
 <7334e2a2-d71f-404c-b2b0-170a7117c0c5@gmx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="d35sh22q3uapum4y"
Content-Disposition: inline
In-Reply-To: <7334e2a2-d71f-404c-b2b0-170a7117c0c5@gmx.de>
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
X-Spamd-Result: default: False [-2.41 / 15.00];
	SIGNED_PGP(-2.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmx.de];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:deller@gmx.de,m:nichen@iscas.ac.cn,m:linux-fbdev@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.986];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[baylibre-com.20230601.gappssmtp.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre-com.20230601.gappssmtp.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: D3C9C10729C
X-Rspamd-Action: no action


--d35sh22q3uapum4y
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/4] fbdev: au1100fb: Don't store device specific data
 in global variables
MIME-Version: 1.0

Hello Helge,

On Sat, Feb 07, 2026 at 08:04:21PM +0100, Helge Deller wrote:
> > @@ -547,7 +542,7 @@ void au1100fb_drv_remove(struct platform_device *de=
v)
> >   #ifdef CONFIG_PM
> >   static struct au1100fb_regs fbregs;
>=20
> ^ you missed to delete "fbregs" now.
> Your previous series deleted it.

I guess this is a fallout from reordering the patches. Will fix.

> > -int au1100fb_drv_suspend(struct platform_device *dev, pm_message_t sta=
te)
> > +static int au1100fb_drv_suspend(struct platform_device *dev, pm_messag=
e_t state)
> >   {
> >   	struct au1100fb_device *fbdev =3D platform_get_drvdata(dev);
> > @@ -559,7 +554,7 @@ int au1100fb_drv_suspend(struct platform_device *de=
v, pm_message_t state)
> >   	clk_disable(fbdev->lcdclk);
> > -	memcpy(&fbregs, fbdev->regs, sizeof(struct au1100fb_regs));
> > +	memcpy(&fbdev->pm_regs, fbdev->regs, sizeof(struct au1100fb_regs));
>=20
> Although memcpy() was used before, isn't this:
> 	fbdev->pm_regs =3D *fbdev->regs;
> sufficient and better?

Probably yes, that's a separate patch then.

Best regards
Uwe

--d35sh22q3uapum4y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmmHr9YACgkQj4D7WH0S
/k6iowf/cO96jiS4X1jREbF+RkH18ZfeRULpcSU/4pi2tHEoKSVZk2VwaPUSja+g
CBmrtT4AI6FgqfPzFqpGK753YuwPTqTqSpHUYI6MEPaTTrkbL8eZgDpJIbf6wCSp
7ZW8Rhf4V21/ZkxCbZJ/zvMSui6RG6iaXHDfxFBBRmSKZ9//X8bNreLspMq39R4K
VHaSUk8fAnSRj5HmTQws44AhWp350sbQvxQVp0zG2WaxtInMvkeMTlL0hnNUn/9L
nbgI7waNuqpoFH/scoDXzi/NLqdDMVuUE6PzNe4FeEmhJEWm3vyV47uvN7T3RoLB
GZu4/Ek/pDSQFCCfSZ4ylyO9A0ThNQ==
=bteR
-----END PGP SIGNATURE-----

--d35sh22q3uapum4y--

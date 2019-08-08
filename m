Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C577B87391
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 10:00:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 699136ED08;
	Fri,  9 Aug 2019 08:00:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B802A6ECDB
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 23:11:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id 4534228A70E
Date: Thu, 8 Aug 2019 16:11:10 -0700
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] drm/panfrost: Implement per FD address spaces
Message-ID: <20190808231110.GA12294@kevin>
References: <20190808222918.15153-1-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20190808222918.15153-1-robh@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Fri, 09 Aug 2019 08:00:16 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: multipart/mixed; boundary="===============0763367388=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0763367388==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="azLHFNyN32YCQGCU"
Content-Disposition: inline


--azLHFNyN32YCQGCU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> @@ -448,6 +453,7 @@ static irqreturn_t panfrost_job_irq_handler(int irq, =
void *data)
>  		}
> =20
>  		if (status & JOB_INT_MASK_DONE(j)) {
> +			panfrost_mmu_as_put(pfdev, &pfdev->jobs[j]->file_priv->mmu);
>  			panfrost_devfreq_record_transition(pfdev, j);
>  			dma_fence_signal(pfdev->jobs[j]->done_fence);
>  		}

Is the idea to switch AS's when an IRQ is fired corresponding to a
process with a particular address sspace? (Where do we switch back? Or
is that not how the MMU actually works here?)

Logically it seems sound, just armchair nervous about potential race
conditions with weird multithreading setups.

> +	/* Assign the free or reclaimed AS to the  */

to the....?

--azLHFNyN32YCQGCU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQ17gm7CvANAdqvY4/v5QWgr1WA0FAl1MrAYACgkQ/v5QWgr1
WA0KbQ/7BGo5LpVT1VniPpy2Zbrd+rn7vBisiFeyrIw2f7Dxx2lHo8jn5mJZd/Ws
KW/LpKdSLU1vF71j0sjwXobkmBbolvdr/9ZcRY0kJbt0Pqt1N6tJsumUSsRiv00t
Abh9XKEDfqM0eeXxz14LXB47m1qNT7B5cTrrwSXC1QmAz5czVZvBfn0QWfvmwNqO
/zhg18JhysZku5q15VAFYKjJ5lfsYDd8IW63+hl03o0hXtgTGk55kB9nlJFqSOj5
XlW2/nXJxVcEtqCb9/rqzWmxuFmr7E9+aFZ+sqQfgy+S21AKonZ+BbyIz6LCDiHH
3nYXfhs/A2hurmMttpHNyQbAXDm/nV53z/X2WWFH11xWFRqoSA2KnepxmwXFwcNT
fXwRl7A9joGG9hDj1hVpy6+fBUwX+7AoP50XOgzlYChfcDK3noUbQ/3/ST8SvXAz
XS8CUyE1LZIbcw4Y5iVOgAjad24WHOMtYe0Vzov3zEhRru5/fjyqgJ7V2lVNcjCt
eaVrTBUEwAXAz8sLMlckmcPU1W8bTQTqz7w2p+FQ9bOzB1fTccucam93jxVlpZ7Q
44ZhiHXZ77JLkhtke/tSwsKBeXDEYIV0YlrbWOb+wzPXbu4SiGPTXjUNVlkYauEr
fZzQmV9gISbShAZsCrp6VU+yky4Q1/0O6wntcTh3FNYVeYG52KI=
=cq3K
-----END PGP SIGNATURE-----

--azLHFNyN32YCQGCU--

--===============0763367388==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0763367388==--

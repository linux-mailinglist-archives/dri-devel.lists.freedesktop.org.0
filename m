Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GfPNVOMiWnP+gQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 08:27:15 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2308310C6A2
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 08:27:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9B7110E0A8;
	Mon,  9 Feb 2026 07:27:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="mD1fIMyN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29A5A10E0A8
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Feb 2026 07:27:10 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-4359a302794so1625044f8f.1
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Feb 2026 23:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1770622028; x=1771226828;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=zSRrUJVvFwAIEAMSQdvLDvax5R1ZcBfYM0Suiw+VTt4=;
 b=mD1fIMyNqJt1rSQzpvhjN0429dozT8sE7gxjS6aownewKU0ieBMt4STZmSKLhyXSWx
 0ay83zAkZ0oHq5OVosExTVmop4fnMVU1AdYvVonAsqIXRKWXPMR8aeKcIpne/f3Qry6b
 tLKjWuXhlll65hy8REsUmmwTTA5fTKApkl+FMVRAbMeemhhZSMiazMSSiFgGsxMrTHTt
 EuKm8jWLoljUGQqpJ5Jh+tt7V0EFMcjsLJ7eeJxBc+EPgzFvwMcpA1ZtzqnYuSNLSlE4
 8eeqG4xjUd3uEYWuBdpfF7AoNT5zKYyClE4/9lHFpiskdseAopxY2EU+inTPSyP0JWBa
 094Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770622028; x=1771226828;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zSRrUJVvFwAIEAMSQdvLDvax5R1ZcBfYM0Suiw+VTt4=;
 b=DJB19MgBkYVctdRC4X2IBwBrWeNS2x56XfP3x9sjC3lWzqhuaJe/1qCQ99sbX+WQm9
 rycTdp4eRQDlVDKT8KW9Y7M+UelqFAn5wWyIMEuWD7Fol07RYZjY1JqDHOSRRyi74tzm
 G6NkCKeFbqjpfnhfyJdb3jyDCOtKeNlUGIwYsRDgahdyTAAjQAxpuZmiDwI+6vqMEdpH
 7cii/gIdyy4e2qe0JsjIlSBBnnf+0w6z9LehJf6vhmgL9vCFRIuoxWxKLgaRdnEdH+4c
 0cP1hhmNbTeID5BZm8smMYC4LcWuEz8F6s2KjaOvl2izLrQ8Da2Mg2FRVQWXcS0F2Vw1
 WZ6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUE1hT8rxK4k5jaMhVQlKVqICnWvmis9HjAWylSBRgUkBJRH5As943IDRNyKPFPAty2xw22Qgdb/HM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzC68uJ19AfzKdrjs7ihUIEkP10rVW0QKvTn9ULrxUYqB4g8fzA
 iprwUqWNx6rHO3xcbVKqKfDvtvEf/KoQC+Bgyw8Ze0sJ3oGhxbGJ29LO3Rhb6sbdeyw=
X-Gm-Gg: AZuq6aIbWpYvAGlTQUyNI1q3zhnoKO/Qu7R32G6qS47joHhEBdTaYtACct4/w3PAMrc
 I4/3vTJ0aMgb/WEZxikgHSk4/8DpycvgFmXHJVPJ/Xhx/r47I9BnGPyA69DFA/xFmnpxZD4DeGF
 xS1VuBLxBBt0NwdDHtxUWeEDmXelhGk+zrtvUjFP/bO3dAMu7ZEqlla0W6EfBoprogwuaXMeumf
 JVPEVVDBgHeGGvgQfvIhbK/44pC0rcN9BN5wdrYx5t+Ye3mXLGWYFphVn1DJja7eE9nxKVFc+PI
 p8cv5bYkKB1gNFAillppzEn5X+o4urCGw5o+CfwKKD+kMK9o4qZMHSbSKpetczCWglgP3xeR9T1
 PUO/+oH1WwALyAhDOosaz+i95+Pwhjs+WatNf2HhiTSzvkFZwP/GraksguwI52sY8D/JsF5ZILG
 YT1hOmffWU4jVFujjB
X-Received: by 2002:a05:6000:1ace:b0:435:b068:d3c4 with SMTP id
 ffacd0b85a97d-43629380e94mr16340688f8f.33.1770622028402; 
 Sun, 08 Feb 2026 23:27:08 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-4376686130csm12499489f8f.1.2026.02.08.23.27.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Feb 2026 23:27:07 -0800 (PST)
Date: Mon, 9 Feb 2026 08:27:06 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: kernel test robot <lkp@intel.com>
Cc: Helge Deller <deller@gmx.de>, oe-kbuild-all@lists.linux.dev, 
 Chen Ni <nichen@iscas.ac.cn>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 5/6] fbdev: au1100fb: Make driver compilable on
 non-mips platforms
Message-ID: <aYmLysU_q3C-xLfk@monoceros>
References: <67b7aa0157b9cf5de111ab6b2725d207ec98aae9.1770572936.git.u.kleine-koenig@baylibre.com>
 <202602091447.3HeLynhy-lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3b4rsyg56sd3635q"
Content-Disposition: inline
In-Reply-To: <202602091447.3HeLynhy-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20230601.gappssmtp.com:s=20230601];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[baylibre.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:lkp@intel.com,m:deller@gmx.de,m:oe-kbuild-all@lists.linux.dev,m:nichen@iscas.ac.cn,m:linux-fbdev@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmx.de,lists.linux.dev,iscas.ac.cn,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[baylibre-com.20230601.gappssmtp.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[01.org:url,intel.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,baylibre-com.20230601.gappssmtp.com:dkim]
X-Rspamd-Queue-Id: 2308310C6A2
X-Rspamd-Action: no action


--3b4rsyg56sd3635q
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 5/6] fbdev: au1100fb: Make driver compilable on
 non-mips platforms
MIME-Version: 1.0

Hello,

On Mon, Feb 09, 2026 at 02:30:13PM +0800, kernel test robot wrote:
> kernel test robot noticed the following build errors:
>=20
> [auto build test ERROR on 0636e6205beed850d985276dc56fd73d785bea5c]
>=20
> url:    https://github.com/intel-lab-lkp/linux/commits/Uwe-Kleine-K-nig/f=
bdev-au1100fb-Don-t-store-device-specific-data-in-global-variables/20260209=
-015956
> base:   0636e6205beed850d985276dc56fd73d785bea5c
> patch link:    https://lore.kernel.org/r/67b7aa0157b9cf5de111ab6b2725d207=
ec98aae9.1770572936.git.u.kleine-koenig%40baylibre.com
> patch subject: [PATCH v3 5/6] fbdev: au1100fb: Make driver compilable on =
non-mips platforms
> config: csky-allmodconfig (https://download.01.org/0day-ci/archive/202602=
09/202602091447.3HeLynhy-lkp@intel.com/config)
> compiler: csky-linux-gcc (GCC) 15.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260209/202602091447.3HeLynhy-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202602091447.3HeLynhy-lkp=
@intel.com/
>=20
> All errors (new ones prefixed by >>):
>=20
>    csky-linux-ld: drivers/video/fbdev/au1100fb.o: in function `au1100fb_d=
rv_remove':
>    au1100fb.c:(.text+0x21c): undefined reference to `unregister_framebuff=
er'
> >> csky-linux-ld: au1100fb.c:(.text+0x224): undefined reference to `fb_de=
alloc_cmap'
>    csky-linux-ld: drivers/video/fbdev/au1100fb.o: in function `au1100fb_f=
b_mmap':
>    au1100fb.c:(.text+0x2bc): undefined reference to `unregister_framebuff=
er'
>    csky-linux-ld: au1100fb.c:(.text+0x2c0): undefined reference to `fb_de=
alloc_cmap'
>    csky-linux-ld: drivers/video/fbdev/au1100fb.o: in function `au1100fb_d=
rv_probe':
>    au1100fb.c:(.text+0x540): undefined reference to `fb_get_options'
> >> csky-linux-ld: au1100fb.c:(.text+0x6e4): undefined reference to `fb_ge=
t_options'
> >> csky-linux-ld: au1100fb.c:(.text+0x7bc): undefined reference to `fb_al=
loc_cmap'
> >> csky-linux-ld: au1100fb.c:(.text+0x7d8): undefined reference to `regis=
ter_framebuffer'
>    csky-linux-ld: au1100fb.c:(.text+0x818): undefined reference to `fb_de=
alloc_cmap'
>    csky-linux-ld: au1100fb.c:(.text+0x850): undefined reference to `fb_al=
loc_cmap'
>    csky-linux-ld: au1100fb.c:(.text+0x860): undefined reference to `regis=
ter_framebuffer'
>    csky-linux-ld: au1100fb.c:(.text+0x874): undefined reference to `fb_de=
alloc_cmap'
> >> csky-linux-ld: drivers/video/fbdev/au1100fb.o:(.rodata+0xc): undefined=
 reference to `fb_io_read'
> >> csky-linux-ld: drivers/video/fbdev/au1100fb.o:(.rodata+0x10): undefine=
d reference to `fb_io_write'
> >> csky-linux-ld: drivers/video/fbdev/au1100fb.o:(.rodata+0x2c): undefine=
d reference to `cfb_fillrect'
> >> csky-linux-ld: drivers/video/fbdev/au1100fb.o:(.rodata+0x30): undefine=
d reference to `cfb_copyarea'
> >> csky-linux-ld: drivers/video/fbdev/au1100fb.o:(.rodata+0x34): undefine=
d reference to `cfb_imageblit'

The problem is that we have CONFIG_FB_AU1100=3Dy but only CONFIG_FB=3Dm in
that config. I thought a bool depending on a tristate implies the latter
to be =3Dy, it seems I'm wrong and FB_AU1100 needs to depend on (FB =3D y).

Best regards
Uwe

--3b4rsyg56sd3635q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmmJjEcACgkQj4D7WH0S
/k4A4Af/UeLSYJO6+3KwCZ0PksM2aIcAZXk4qDEAkK2FWzmYyRF1wwg/pVbsy6gD
zrJMdbR2BUYwtDBx7OwEMPNA8e/Z1R+K9ngc7YqtEyI8MJGOP/rQ5AvkY5Gqizu6
ZrAkZOoPdxff3W2cJKJZYAFKx4UXqqFZsXDm0wwh7rmQT2hSdgT7vAhYUE4KYBBn
tbez40Tu2R3lBAwTsIbE7N03EYCt9OOnfQOXo+cT+yCsMSHwLLUd6deR/XWmdcQ7
KJMhosrUr4aG+iWgN6//cLG8ruknQqDM+khJRnIrRWdUXoUG9Ns+rUGEg8twntGv
E6X42zEK5WiKyrAltnYqEq2/jGj5aw==
=283N
-----END PGP SIGNATURE-----

--3b4rsyg56sd3635q--

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1F41E9AF5
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jun 2020 02:25:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52E0D89E86;
	Mon,  1 Jun 2020 00:25:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B212D89E86
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jun 2020 00:25:26 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id q8so7571525qkm.12
 for <dri-devel@lists.freedesktop.org>; Sun, 31 May 2020 17:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Kz5ZwOEUDJkALcMr7ODolUJ33dao0Jqn48aQY1x+fvo=;
 b=JMtde9ZVi4Xh+zrV7qA5+DDbcshUfkjeaSlLaG92QV5ZAvJ8Imr4JILwl+CrsOWBh5
 E8ma1CTQiCghwl/SMoUwdhLqAXPDlHwrnYfJLYSVyn90iZp9IzM5xRcTTIuVGHrKDLAo
 W8nYA/KDkkR//e3DgGfYye+4Ikkq82u3676C5sX1e8iBKpN3mYfbrwN1TU2Nos/DVoLU
 APijplTJSSzdEIgqvXKcaHvcs/LGP4OUXfB0W0hyarrKWsMyPunFty+7Q2YbfU+4dG2H
 kpQZZUZDXkr0rmDKMhhoFu8lfCR/eL1CXt+VXqjepkCjBN0j82X2U71AVyMwxAZ5zs9K
 USBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Kz5ZwOEUDJkALcMr7ODolUJ33dao0Jqn48aQY1x+fvo=;
 b=O7MlgZxceMIRtCIc8nUlGMCNhcT5Lx84lueupqjdppp2ZtQyxSNnYWcqfTv3zTIJvG
 5Xl5box+evuVRhE9mJ04K/fud1N4oQkaQ168TY4TVuydsDQkZHmMSYtL+vS/4o7u/Lu1
 HuOB3bN41zUw/Ps6MAqffnFGgulTYOGfq8wB4aXi/xo43GgzLoFUIz3e6EvfyLnK7g35
 8Fy95EWNlc3JYHjLBNpPXvuo18L5ckhJJ31AnL011JlE5z62g0t2tds4Wd/vK+cGz4li
 EBGwvtOte0Gikg14/148w/q39jTYZcFAfPVz+8a593LOnnNFZVr4COtL4YgWj+7DsW28
 N/eQ==
X-Gm-Message-State: AOAM532KXrTC6aOZ1Pvc05cosAAOyClC8OYBowSCkvP/1mphQLevbljb
 gjfhIUqPnONmv0BX1FTekKs=
X-Google-Smtp-Source: ABdhPJzjP660vRht6J3z9ESxCOhezGV36ibMpKltTC8hYcfK3U1Q3zPuyXcyIMeJVLzWB+Y6WfkMkA==
X-Received: by 2002:a37:ef08:: with SMTP id j8mr17850209qkk.442.1590971125701; 
 Sun, 31 May 2020 17:25:25 -0700 (PDT)
Received: from smtp.gmail.com
 (CPE9050ca2539f3-CM9050ca2539f0.cpe.net.cable.rogers.com. [99.241.37.211])
 by smtp.gmail.com with ESMTPSA id p16sm11089868qkg.63.2020.05.31.17.25.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 May 2020 17:25:24 -0700 (PDT)
Date: Sun, 31 May 2020 20:25:20 -0400
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH] drm/vkms: Optimize compute_crc(), blend()
Message-ID: <20200601002520.hajvtpefi7yzvmuq@smtp.gmail.com>
References: <20200531131237.24781-1-realwakka@gmail.com>
 <CACvgo50SzjUe6usELF33qXW3BWZmH5U4ynPTBorZLDrG-Nx2Pw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACvgo50SzjUe6usELF33qXW3BWZmH5U4ynPTBorZLDrG-Nx2Pw@mail.gmail.com>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>, David Airlie <airlied@linux.ie>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Sidong Yang <realwakka@gmail.com>
Content-Type: multipart/mixed; boundary="===============0089559873=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0089559873==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uqybjdb5ptkemz4z"
Content-Disposition: inline


--uqybjdb5ptkemz4z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

First of all, thanks a lot for all your patch. And thanks Emil for your
feedback.

I have a suggestion here:

Emil:
Could you give me your Acked-by or maybe Reviewed-by for the writeback
series? With that, I can finally apply the series.

Sidong:
Secondly, after applying the writeback series, I would suggest you to
understand Emil's comments (he already provides the link) and prepare a
new patch based on that. Before you submit your patch, I recommend you
to test it with https://patchwork.freedesktop.org/series/68352/ and
kms_flip.

How about that?

Best Regards

On 05/31, Emil Velikov wrote:
> On Sun, 31 May 2020 at 14:12, Sidong Yang <realwakka@gmail.com> wrote:
> >
> > Optimize looping pixels in compute_crc() and blend(). Calculate
> > src_offset in start of looping horizontally and increase it.
> > It's better than calculating in every pixels.
> >
> When you say "optimize" have you observed any actual benefits of the
> patch - be that smaller binary, faster execution time, etc?
> If there are - mentioned them in the commit message. Otherwise, it
> doesn't optimise anything.
>=20
> A while back, I've suggested something similar [1] mostly for cosmetic
> purposes - doubt there's much benefits beyond that.
>=20
> HTH
> -Emil
> [1] https://patchwork.freedesktop.org/patch/365177/#comment_674314

--=20
Rodrigo Siqueira
https://siqueira.tech

--uqybjdb5ptkemz4z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl7USuoACgkQWJzP/com
vP9qrRAAnB7QXjC0la92oJUZ8yyl0o/C442cO+1HhwiRqrbRGs5Vs87vtzgZ0mDG
He5++yIGDNbnPp7eGQSa+9MVb3+/jmfzg7p+WVGLbxSZpQcO4ubR1cbaNVUctt8v
HboNRzPGulJgkky3srDRnGuVAc+2Vtq6SvlwqlK/SyB9eQIBT7EpL7Vw8RFL89zW
g9IwhXur7wQGkaqvPLgIqJgguGhVvHE++m9LcgMF8+oYWX9VlTkpfieO2YT9t+TO
YUqO2Qu/N6xPmcUXYEePXPrkktj+Sv/BREO8PyFIH4WY4o21ztWQ2LAuVb6elpbC
dL0F9JZILPZ96ScsjFErf/NqLXSThKw+S5JkKGYRVnelmf8f5QoC060CHQyDF55x
Uh5ULTbGSE4HmAotJUfOhKsxvBzalQnMrUdaxmNPwIaXd0eLQ1pqpwHPxcy+ndHz
/6LXNTAZiCSDSMBvZ9k8+zJ2blqmpbjo3cqXozC/4pqaZ3zCnDcUtqlpDZlzs34w
U8Nlv1/cdYg5ucWXHATqMoafj1J2PhYe4Z9lLXtdmAH2eDbiapn1ahdr58ATs7A1
BAuzzPMUQdqM2azwjzEh/qD06mVKEk8POtySyRjmKrOdBj8cX11AMpL+3obEQWJA
TDR1PX1KRXexuLe8dgwx4iwV6e0yL+J+NMxFn22d4xxvA28cpm4=
=cya/
-----END PGP SIGNATURE-----

--uqybjdb5ptkemz4z--

--===============0089559873==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0089559873==--

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 571056F6AF2
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 14:13:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 840F910E396;
	Thu,  4 May 2023 12:13:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7C1410E392;
 Thu,  4 May 2023 12:13:31 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4f004cc54f4so478999e87.3; 
 Thu, 04 May 2023 05:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683202409; x=1685794409;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=rONT3tFH/eFNZH2oh2aVBKYil27pOoA6/Qc3qIsA0lA=;
 b=rPOIikho86ZIxawEoaZ304oSvks4toshCJUasJw6Ri5CHb5S2JtDG5a6qRKp3F4p/z
 CE9gbhBCydPWesWyfD97Y5eTIcpilOoBwh7Pm8w0NU1Z2+LWTPjyiiSPFq3wYa9K0Aw8
 avchptBU7t05ORpy7SXwbQrjaBkp2sVhENGDGhRZinwJW4mW1+a7d/m4REUpzar26V+M
 sd8IKI1o2dpvP8WfPFAvQ+miNeMnQ0fgJUmHik7WDM0brydl/3WQGvuAf+/joRYa5ohA
 WVAJvK/cIV6Hfp4DwWb2ewvXwiA74EXqR7tUT0qIOHnIWr+F402/KUG050XTwMRi7xs8
 BOlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683202409; x=1685794409;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rONT3tFH/eFNZH2oh2aVBKYil27pOoA6/Qc3qIsA0lA=;
 b=YQJGeshV2GkTkbW/99jCI3Wy08mLLNVf4UobW8Rmmi7fxzZ1Jy0OpHS38gqkI2aDBg
 N5nnP+qDYPAVwZQTUiEIvz5J7D+uaMZ9saEf1kU/YBvZegRKN6HuCR0UfGtxXsBYHqo6
 JZBqvhKiOJsNQiggI8dnotKrquMHw2mDpHtRIQBTCKySvTe7R+H4vmk7icxJxR73QzRQ
 ZZUqDSGnE3p2kvtAt3Mb5fPcItUA8PJK9Cevgl+HM8e7rg1Fo8p9w0b7qTbNfcQ5Vzns
 8rbIvtzwpPMBbSaAk3+3h7SLnG22HTutMXOiLwf2iM2kK1gclo7NCTVW9Qgb7UTY3xia
 D8Tg==
X-Gm-Message-State: AC+VfDwM0Cdz1F3nYAlteEhFuv1YOugqbR1AplbRwrLWFFA8MYIm7aWv
 LQhAALUPjKFK/r4lxLZZzQI=
X-Google-Smtp-Source: ACHHUZ7/WOGg5I8ZUqVgovT46A2LLUMNbm2eeVCGuYX5cN3iAkZqXbPbHOpIpwTKrpEvWEtnGQtwCw==
X-Received: by 2002:ac2:5551:0:b0:4d1:3d1d:4914 with SMTP id
 l17-20020ac25551000000b004d13d1d4914mr2192756lfk.33.1683202408760; 
 Thu, 04 May 2023 05:13:28 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 n21-20020a195515000000b004f002961a96sm4449180lfe.230.2023.05.04.05.13.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 05:13:28 -0700 (PDT)
Date: Thu, 4 May 2023 15:13:24 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Jonas =?UTF-8?B?w4VkYWhs?= <jadahl@gmail.com>
Subject: Re: [PATCH v2 1/8] drm: Disable the cursor plane on atomic contexts
 with virtualized drivers
Message-ID: <20230504151324.2fafcc1c@eldfell>
In-Reply-To: <ZFOWmhZGEmaksTAo@gmail.com>
References: <20220712033246.1148476-1-zack@kde.org>
 <20220712033246.1148476-2-zack@kde.org>
 <YvPfedG/uLQNFG7e@phenom.ffwll.local>
 <87lei7xemy.fsf@minerva.mail-host-address-is-not-set>
 <0dd2fa763aa0e659c8cbae94f283d8101450082a.camel@vmware.com>
 <87y1m5x3bt.fsf@minerva.mail-host-address-is-not-set>
 <17cc969e9f13fab112827e154495eca28c4bd2b6.camel@vmware.com>
 <20230504133904.4ad3011c@eldfell> <ZFOWmhZGEmaksTAo@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.24; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/IKCuGqSZcOwId12tUtxDYzp";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: Maaz Mombasawala <mombasawalam@vmware.com>,
 "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "belmouss@redhat.com" <belmouss@redhat.com>,
 "javierm@redhat.com" <javierm@redhat.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "gurchetansingh@chromium.org" <gurchetansingh@chromium.org>,
 Martin Krastev <krastevm@vmware.com>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "spice-devel@lists.freedesktop.org" <spice-devel@lists.freedesktop.org>,
 "airlied@redhat.com" <airlied@redhat.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "kraxel@redhat.com" <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/IKCuGqSZcOwId12tUtxDYzp
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 4 May 2023 13:27:22 +0200
Jonas =C3=85dahl <jadahl@gmail.com> wrote:

> On Thu, May 04, 2023 at 01:39:04PM +0300, Pekka Paalanen wrote:
> > On Thu, 4 May 2023 01:50:25 +0000
> > Zack Rusin <zackr@vmware.com> wrote:
> >  =20
> > > On Wed, 2023-05-03 at 09:48 +0200, Javier Martinez Canillas wrote: =20
> > > > Zack Rusin <zackr@vmware.com> writes:
> > > >    =20
> > > > > On Tue, 2023-05-02 at 11:32 +0200, Javier Martinez Canillas wrote=
:   =20
> >  =20
> > > > > > AFAICT this is the only remaining thing to be addressed for thi=
s series ?   =20
> > > > >=20
> > > > > No, there was more. tbh I haven't had the time to think about whe=
ther the above
> > > > > makes sense to me, e.g. I'm not sure if having virtualized driver=
s expose
> > > > > "support
> > > > > universal planes" and adding another plane which is not universal=
 (the only
> > > > > "universal" plane on them being the default one) makes more sense=
 than a flag
> > > > > that
> > > > > says "this driver requires a cursor in the cursor plane". There's=
 certainly a
> > > > > huge
> > > > > difference in how userspace would be required to handle it and it=
's way uglier
> > > > > with
> > > > > two different cursor planes. i.e. there's a lot of ways in which =
this could be
> > > > > cleaner in the kernel but they all require significant changes to=
 userspace,
> > > > > that go
> > > > > way beyond "attach hotspot info to this plane". I'd like to avoid=
 approaches
> > > > > that
> > > > > mean running with atomic kms requires completely separate paths f=
or virtualized
> > > > > drivers because no one will ever support and maintain it.
> > > > >=20
> > > > > It's not a trivial thing because it's fundamentally hard to untan=
gle the fact
> > > > > the
> > > > > virtualized drivers have been advertising universal plane support=
 without ever
> > > > > supporting universal planes. Especially because most new userspac=
e in general
> > > > > checks
> > > > > for "universal planes" to expose atomic kms paths.
> > > > >    =20
> > > >=20
> > > > After some discussion on the #dri-devel, your approach makes sense =
and the
> > > > only contention point is the name of the driver feature flag name. =
The one
> > > > you are using (DRIVER_VIRTUAL) seems to be too broad and generic (t=
he fact
> > > > that vkms won't set and is a virtual driver as well, is a good exam=
ple).
> > > >=20
> > > > Maybe something like DRIVER_CURSOR_HOTSPOT or DRIVER_CURSOR_COMMAND=
EERING
> > > > would be more accurate and self explanatory ?   =20
> > >=20
> > > Sure, or even more verbose DRIVER_NEEDS_CURSOR_PLANE_HOTSPOT, but it =
sounds like
> > > Pekka doesn't agree with this approach. As I mentioned in my response=
 to him, I'd be
> > > happy with any approach that gets paravirtualized drivers working wit=
h atomic kms,
> > > but atm I don't have enough time to be creating a new kernel subsyste=
m or a new set
> > > of uapi's for paravirtualized drivers and then porting mutter/kwin to=
 those. =20
> >=20
> > It seems I have not been clear enough, apologies. Once more, in short:
> >=20
> > Zack, I'm worried about this statement from you (copied from above):
> >  =20
> > > > > I'd like to avoid approaches that mean running with atomic kms
> > > > > requires completely separate paths for virtualized drivers
> > > > > because no one will ever support and maintain it. =20
> >=20
> > It feels like you are intentionally limiting your own design options
> > for the fear of "no one will ever support it". I'm worried that over
> > the coming years, that will lead to a hard to use, hard to maintain
> > patchwork of vague or undocumented or just too many little UAPI details.
> >=20
> > Please, don't limit your designs. There are good reasons why nested KMS
> > drivers behave fundamentally differently to most KMS hardware drivers.
> > Userspace that does not or cannot take that into account is unavoidably
> > crippled. =20
>=20
> From a compositor side, there is a valid reason to minimize the uAPI
> difference between "nested virtual machine" code paths and "running on
> actual hardware" code paths, which is to let virtual machines with a
> viewer connected to KMS act as a testing environment, rather than a
> production environment. Running a production environment in a virtual
> machine doesn't really need to use KMS at all.
>=20
> When using virtual machines for testing, I want to minimize the amount
> of differentation between running on hardware and running in the VM
> because otherwise the parts that are tested are not the same.
>=20
> I realize that hotpspots and the cursor moving viewer side contradicts
> that to some degree, but still, from a graphical testing witha VM point
> of view, one has to compromise, as testing isn't just for the KMS layer,
> but for the DE and distribution as a whole.

Right, I'm looking at this from the production use only point of view,
and not as any kind of testing environment, not for compositor KMS
driving bits at least. Using a virtualized driver for KMS testing seems
so very... manual to me, and like you said, it's not representative of
"real" behaviour.

As for the best choice for production use, KMS in guest OS is
attractive because it offers zero-copy direct scanout to the host
hardware, with the right stack. OTOH, I think RDP has extensions that
could enable that too, and if the end point is not host hardware
display then KMS use in guest is not the best idea indeed.

I don't recall any mention of actual use cases here recently. I agree
the intended use makes a huge difference. Testing KMS userspace and
production use are almost the opposite goals for virtualized drivers.


Thanks,
pq

--Sig_/IKCuGqSZcOwId12tUtxDYzp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmRToWQACgkQI1/ltBGq
qqcviQ//bDaw9E+3b/rzgqYhc8F6x1lxSQ0lsDeL8hzpjsbL3Xc+psxCNSbEM2sp
vUz6a7a89QJHTnEUCrIcZ/8f+M7bo8EpFtUpzwnLIIuCxXdOBrtRGRTfl+JxfRpG
QNnj039GdfXNuFYJqHA1+n6bdgNbElBoRccg/kNmOAtMg/yBMJ4abqlvafAveCsy
FbjH4+LGUC2Ltw/hcQMv5SeLJRcgmq2O/vyBqEzMDUAW8PsPNwgzxROuZn1Nyi6S
NpZKBLcd2ah3PKR9OdAXoA3Cw5oOierxUCKMChNEWJ7muW8pHYWbynMpr6PmXn+G
0+K4d8BkTRbNvTxDVvrtPOwUSaFY7WgdSUhyZkuBa0EV7UH0WLoEDOwytaqVcgm5
IJnNo89U1UVtKzmI9S8Co8ryqzf9VAmNMDwXFNqgHR5Cuu7hWsXMhXeXLvCVIEVz
PBALUMyST6Cyc66rxCh5U5KS/GYlm8u0eqwkU6aOfLsRdJSl6l8xvtjzqSurH8WB
ykpn4p2n7MFKQ5CmJ0QFqajztDMdDwX3TVlj7w/KZoXMVWseeYMp/rl70HnHQ/E2
c/qNF2wbV+/hxoUv0fEcVmmfus7UK16eUEXaRN/IN8aM5gJ5PoeMejQjwrUDyNr7
XhOaXoEau//q4C2eztPLYCGugdZrhiz7vgiCEtr5/IXumCGlTmg=
=rbqo
-----END PGP SIGNATURE-----

--Sig_/IKCuGqSZcOwId12tUtxDYzp--

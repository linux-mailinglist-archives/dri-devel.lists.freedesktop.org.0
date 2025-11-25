Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E1DC85D39
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 16:48:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18C6F10E44F;
	Tue, 25 Nov 2025 15:48:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="UQj4oe93";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FE0010E44A
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 15:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1764085711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LbsJw3XVyMCXF2nJOSiyaSbV+wPkyDhX4KT6TGCRgss=;
 b=UQj4oe93nmNBdopKBoskZA4rQ2BwtHV3kjQiQJBxda6/qNo0jt2/lArA02sV+rQRm151Id
 5N8btrWFYKBHJM04I/e58zdd5P6g4p09tpcWXkECn6kBD/JrjDoTtRhzh5/uU2moGu8BNT
 4oHwFx3QtrjcTbFUkJaaL01ggqgJjFM=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-685-wT98yaCOMsaoeD4elA9CFQ-1; Tue, 25 Nov 2025 10:48:28 -0500
X-MC-Unique: wT98yaCOMsaoeD4elA9CFQ-1
X-Mimecast-MFC-AGG-ID: wT98yaCOMsaoeD4elA9CFQ_1764085707
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-295592eb5dbso119458445ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 07:48:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764085707; x=1764690507;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=k9b09Krqnfah1Efwew759eb1g6delm/Yd1AUWIG5UK4=;
 b=QxrdM6WbF0EqCPzaIB1eGJ/EDS2VFX8FUz6iXwU2UQguXAcJMl3fC+xE5gfYuib1i0
 nVzpKXtO+smuLPh0mpDIcjxbniaQrpQFzJDgvbNgcUIjpIE1mxjekQY7bdIGaY6H9PAP
 mAuha5DRRawbikbEOM68qRDi7UKryct4/PKxZXE80Gsm8/s0sXaf6H3953L+mCv4iSf8
 u39Kg1T+Ci/IZzL+y6tlYFuL6/8Y1Ypz+Z2gMWhhJp+VX+l493F8yFeeumN+8FeetL0X
 Sixt85roN+OvVSd1oaE5V8fS7H7beBgtttsjEmqN6nkTGSdwhYq3hIzr4MfMk5s3W3+K
 EpLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpYQ34e6VSkQHoQvXOA0KNb9UW11Xv9pVE24WWL+S423p4q/NIb1sBIr2AD7LpBZURtl5hIcj+kNU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyxjvdiwM/4Gv7cqKZy9Qjv1mPyJtvj9dsxNibKjjTPcaitvYse
 EtWCcSLEaFLp+KT5MeGvr0DA8y/DVNcrTtUBo/8BTTwvstNWFwUL7l3wWF+P2csQS3sLXo/qKkA
 JugBe99P5kpKTxpc13Q3Z+RXD6Vy+DX2rYZqqrhDjmC2H25XjttWaMvfmtK88g91/9+6HvQ==
X-Gm-Gg: ASbGncvCNzjpuq6n4ffS65Hi6MqBj5BMCPcyCgKd/1pQzxSKHA7h9lY2kvtIJEeapVG
 nIuhU882FUH60xpOXABEViz9c9HdddQr7SqGLW0gGaCIpWaam0viMV3UikCbqAOrsvzcstMN/Ab
 HlAjgYKwMw91Eq30h7qIXIAwBH07PMXJEXhG6H50UPsmjv42/TvNPPRUVnst/bPXURz6NRSAO46
 uqCJuAJEuQrFzArLaDp9oGlpNzP4xunClW9RewUkYlfd9phhINy2X+TO4n61EkRQR+zs1Iqa7Yl
 WenbcPB+UdmZXHQcMYnvP+vDmVcup5syvhrHyyVy3EW8qniXczHlueRpYBUijjB+1YnbCqsy+ea
 91AbBJl3ySDZdaB7kJZogQQ==
X-Received: by 2002:a17:903:b86:b0:295:4d97:8503 with SMTP id
 d9443c01a7336-29b6c575180mr187671365ad.30.1764085707031; 
 Tue, 25 Nov 2025 07:48:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHKvgNQbyrXYYI1Dt7FHL145Gwg3yi+vBGB1qCw8Ugy59NPU8GBaC78JFLtZrJ3YPzGWPblAA==
X-Received: by 2002:a17:903:b86:b0:295:4d97:8503 with SMTP id
 d9443c01a7336-29b6c575180mr187671005ad.30.1764085706489; 
 Tue, 25 Nov 2025 07:48:26 -0800 (PST)
Received: from [10.200.68.138] (nat-pool-muc-u.redhat.com. [149.14.88.27])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29b5b107774sm168940565ad.9.2025.11.25.07.48.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Nov 2025 07:48:25 -0800 (PST)
Message-ID: <414bc2c721bfc60b8b8a1b7d069ff0fc9b3e5283.camel@redhat.com>
Subject: Re: [PATCH v9 02/13] PCI: Add devres helpers for iomap table
 [resulting in backtraces on HPPA]
From: Philipp Stanner <pstanner@redhat.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hans de Goede <hdegoede@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>, Sam
 Ravnborg <sam@ravnborg.org>, dakr@redhat.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-parisc@vger.kernel.org, Helge Deller
 <deller@gmx.de>
Date: Tue, 25 Nov 2025 16:48:11 +0100
In-Reply-To: <16cd212f-6ea0-471d-bf32-34f55d7292fe@roeck-us.net>
References: <20240613115032.29098-1-pstanner@redhat.com>
 <20240613115032.29098-3-pstanner@redhat.com>
 <16cd212f-6ea0-471d-bf32-34f55d7292fe@roeck-us.net>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QKnN0l3g8UrE9QuVQkLDFIG3tF-snEwgebc4RJmpzkc_1764085707
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Sun, 2025-11-23 at 08:42 -0800, Guenter Roeck wrote:
> Hi,
>=20
> On Thu, Jun 13, 2024 at 01:50:15PM +0200, Philipp Stanner wrote:
> > The pcim_iomap_devres.table administrated by pcim_iomap_table() has its
> > entries set and unset at several places throughout devres.c using manua=
l
> > iterations which are effectively code duplications.
> >=20
> > Add pcim_add_mapping_to_legacy_table() and
> > pcim_remove_mapping_from_legacy_table() helper functions and use them w=
here
> > possible.
> >=20
> > Link: https://lore.kernel.org/r/20240605081605.18769-4-pstanner@redhat.=
com
> > Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> > [bhelgaas: s/short bar/int bar/ for consistency]
> > Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> > ---
> > =C2=A0drivers/pci/devres.c | 77 +++++++++++++++++++++++++++++++++------=
-----
> > =C2=A01 file changed, 58 insertions(+), 19 deletions(-)
> >=20
> > diff --git a/drivers/pci/devres.c b/drivers/pci/devres.c
> > index f13edd4a3873..845d6fab0ce7 100644
> > --- a/drivers/pci/devres.c
> > +++ b/drivers/pci/devres.c
> > @@ -297,6 +297,52 @@ void __iomem * const *pcim_iomap_table(struct pci_=
dev *pdev)
> > =C2=A0}
> > =C2=A0EXPORT_SYMBOL(pcim_iomap_table);
> > =C2=A0
> > +/*
> > + * Fill the legacy mapping-table, so that drivers using the old API ca=
n
> > + * still get a BAR's mapping address through pcim_iomap_table().
> > + */
> > +static int pcim_add_mapping_to_legacy_table(struct pci_dev *pdev,
> > +=09=09=09=09=09=C2=A0=C2=A0=C2=A0 void __iomem *mapping, int bar)
> > +{
> > +=09void __iomem **legacy_iomap_table;
> > +
> > +=09if (bar >=3D PCI_STD_NUM_BARS)
> > +=09=09return -EINVAL;
> > +
> > +=09legacy_iomap_table =3D (void __iomem **)pcim_iomap_table(pdev);
> > +=09if (!legacy_iomap_table)
> > +=09=09return -ENOMEM;
> > +
> > +=09/* The legacy mechanism doesn't allow for duplicate mappings. */
> > +=09WARN_ON(legacy_iomap_table[bar]);
> > +
>=20
> Ever since this patch has been applied, I see this warning on all hppa
> (parisc) systems.
>=20
> [=C2=A0=C2=A0=C2=A0 0.978177] WARNING: CPU: 0 PID: 1 at drivers/pci/devre=
s.c:473 pcim_add_mapping_to_legacy_table.part.0+0x54/0x80
> [=C2=A0=C2=A0=C2=A0 0.978850] Modules linked in:
> [=C2=A0=C2=A0=C2=A0 0.979277] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not ta=
inted 6.18.0-rc6-64bit+ #1 NONE
> [=C2=A0=C2=A0=C2=A0 0.979519] Hardware name: 9000/785/C3700
> [=C2=A0=C2=A0=C2=A0 0.979715]
> [=C2=A0=C2=A0=C2=A0 0.979768]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 YZrvWESTHLNXB=
CVMcbcbcbcbOGFRQPDI
> [=C2=A0=C2=A0=C2=A0 0.979886] PSW: 00001000000001000000000000001111 Not t=
ainted
> [=C2=A0=C2=A0=C2=A0 0.980006] r00-03=C2=A0 000000000804000f 00000000414e1=
0a0 0000000040acb300 00000000434b1440
> [=C2=A0=C2=A0=C2=A0 0.980167] r04-07=C2=A0 00000000414a78a0 0000000000029=
000 0000000000000000 0000000043522000
> [=C2=A0=C2=A0=C2=A0 0.980314] r08-11=C2=A0 0000000000000000 0000000000000=
008 0000000000000000 00000000434b0de8
> [=C2=A0=C2=A0=C2=A0 0.980461] r12-15=C2=A0 00000000434b11b0 000000004156a=
8a0 0000000043c655a0 0000000000000000
> [=C2=A0=C2=A0=C2=A0 0.980608] r16-19=C2=A0 000000004016e080 000000004019e=
7d8 0000000000000030 0000000043549780
> [=C2=A0=C2=A0=C2=A0 0.981106] r20-23=C2=A0 0000000020000000 0000000000000=
000 000000000800000e 0000000000000000
> [=C2=A0=C2=A0=C2=A0 0.981317] r24-27=C2=A0 0000000000000000 0000000008000=
00f 0000000043522260 00000000414a78a0
> [=C2=A0=C2=A0=C2=A0 0.981480] r28-31=C2=A0 00000000436af480 00000000434b1=
680 00000000434b14d0 0000000000027000
> [=C2=A0=C2=A0=C2=A0 0.981641] sr00-03=C2=A0 0000000000000000 000000000000=
0000 0000000000000000 0000000000000000
> [=C2=A0=C2=A0=C2=A0 0.981805] sr04-07=C2=A0 0000000000000000 000000000000=
0000 0000000000000000 0000000000000000
> [=C2=A0=C2=A0=C2=A0 0.981972]
> [=C2=A0=C2=A0=C2=A0 0.982024] IASQ: 0000000000000000 0000000000000000 IAO=
Q: 0000000040acb31c 0000000040acb320
> [=C2=A0=C2=A0=C2=A0 0.982185]=C2=A0 IIR: 03ffe01f=C2=A0=C2=A0=C2=A0 ISR: =
0000000000000000=C2=A0 IOR: 00000000436af410
> [=C2=A0=C2=A0=C2=A0 0.982322]=C2=A0 CPU:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 0=C2=A0=C2=A0 CR30: 0000000043549780 CR31: 0000000000000000
> [=C2=A0=C2=A0=C2=A0 0.982458]=C2=A0 ORIG_R28: 00000000434b16b0
> [=C2=A0=C2=A0=C2=A0 0.982548]=C2=A0 IAOQ[0]: pcim_add_mapping_to_legacy_t=
able.part.0+0x54/0x80
> [=C2=A0=C2=A0=C2=A0 0.982733]=C2=A0 IAOQ[1]: pcim_add_mapping_to_legacy_t=
able.part.0+0x58/0x80
> [=C2=A0=C2=A0=C2=A0 0.982871]=C2=A0 RP(r2): pcim_add_mapping_to_legacy_ta=
ble.part.0+0x38/0x80
> [=C2=A0=C2=A0=C2=A0 0.983100] Backtrace:
> [=C2=A0=C2=A0=C2=A0 0.983439]=C2=A0 [<0000000040acba1c>] pcim_iomap+0xc4/=
0x170
> [=C2=A0=C2=A0=C2=A0 0.983577]=C2=A0 [<0000000040ba3e4c>] serial8250_pci_s=
etup_port+0x8c/0x168
> [=C2=A0=C2=A0=C2=A0 0.983725]=C2=A0 [<0000000040ba7588>] setup_port+0x38/=
0x50
> [=C2=A0=C2=A0=C2=A0 0.983837]=C2=A0 [<0000000040ba7d94>] pci_hp_diva_setu=
p+0x8c/0xd8
> [=C2=A0=C2=A0=C2=A0 0.983957]=C2=A0 [<0000000040baa47c>] pciserial_init_p=
orts+0x2c4/0x358
> [=C2=A0=C2=A0=C2=A0 0.984088]=C2=A0 [<0000000040baa8bc>] pciserial_init_o=
ne+0x31c/0x330
> [=C2=A0=C2=A0=C2=A0 0.984214]=C2=A0 [<0000000040abfab4>] pci_device_probe=
+0x194/0x270
>=20
> Looking into serial8250_pci_setup_port():
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (pci_resource_flags(dev, ba=
r) & IORESOURCE_MEM) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 if (!pcim_iomap(dev, bar, 0) && !pcim_iomap_table(dev))
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -=
ENOMEM;

Strange. From the code I see here the WARN_ON in
pcim_add_mapping_to_legacy_table() should not fire. I suspect that it's
actually triggered somewhere else.

>=20
> This suggests that the failure is expected. I can see that pcim_iomap_tab=
le()
> is deprecated, and that one is supposed to use pcim_iomap() instead. Howe=
ver,
> pcim_iomap() _is_ alrady used, and I don't see a function which lets the
> caller replicate what is done above (attach multiple serial ports to the
> same PCI bar).

Is serial8250_pci_setup_port() invoked in a loop somewhere? Where does
the "attach multiple" happen?

>=20
> How would you suggest to fix the problem ?

I suggest you try to remove the `&& pcim_iomap_table(dev)` from above
to see if that's really the cause. pcim_iomap() already creates the
table, and if it succeeds the table has been created with absolute
certainty. The entries will also be present. So the table-check is
surplus.

Report back please if that helps, I'd want to understand what's
happening here.


Regards
P.


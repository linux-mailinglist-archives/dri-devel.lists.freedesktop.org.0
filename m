Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC9677BC0B
	for <lists+dri-devel@lfdr.de>; Mon, 14 Aug 2023 16:51:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6907D10E217;
	Mon, 14 Aug 2023 14:51:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B92A910E217
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Aug 2023 14:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1692024685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RrivKGhWV5Ghwq55IW0eOmxTikIcvfmc5+kus9KBgAw=;
 b=AKRtu5xjvYRQyDqFUFySR3CqkAeNf1yQrhORipiVp8dO1nR05UsWQVMSz5249g9yN9KKNz
 Jy6+rmQSbTyGW+5H8b44S9/M42tzjSmRH4xs02vsCwwIt9Pwt0v64QxpskM3Jy0tm/8RiA
 U2Lqbxi8kKfB4X0w7xkg1LC/301xPc0=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-557-9v3IBo56O3uIOXyvaLzMWQ-1; Mon, 14 Aug 2023 10:51:22 -0400
X-MC-Unique: 9v3IBo56O3uIOXyvaLzMWQ-1
Received: by mail-lj1-f199.google.com with SMTP id
 38308e7fff4ca-2ba5464f9fcso7978991fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Aug 2023 07:51:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692024680; x=1692629480;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RrivKGhWV5Ghwq55IW0eOmxTikIcvfmc5+kus9KBgAw=;
 b=YQdK+D6X3jhdCmiPw0naEAkygrhxIV4AUYW/17t9zno5vlq1mMm9VlSwrCmY3PeXAV
 rZWxypBNTA8KRhEnGjVlZ3f8WWGlL7W1DKgmp+wxwsvf91gHl8FgY9FKeQrcjPK/NG2y
 2f/+9WJDkk5nltrU/3lK4R2PFa/JEFMhr21RhH2I1s2vWFDywuGGGGE4csHNE551LO3U
 Ui8hfk/LoOsBe4iLoyXwpgrnL1FassClQeSxia3TmjPsH/hZ/VpcMYZXwLZSexMHia2o
 HxOfagfB5Mj8Pu6jnFyn3yV4q0zI/8VDhmRxARsARS1dA8NP5rjWu8uhahPOHiwZs+px
 PNiA==
X-Gm-Message-State: AOJu0Yw2vEWKMMVJqXzGHvotJnV4Bi9wZnvS/oAm70I3SE25Qbc3ahSS
 FxZ/w5tjn6NbRgJBp9n6I8fhSg/jrpcwbQDDb79uCpLIjwZDSIyODvdmfTONP8rPdXWPznr0dJW
 qgqiH//jIw68pYCQCBrbY+nrD+DC3TDOKRECOZx8KpcM1
X-Received: by 2002:a2e:a687:0:b0:2b6:af68:6803 with SMTP id
 q7-20020a2ea687000000b002b6af686803mr5694421lje.4.1692024680213; 
 Mon, 14 Aug 2023 07:51:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbLJe1vihzyF9NXlK95t7p70ZqIVDV0PG7vRXfg2ioPgI+3DfSNlplndRwlg9LRIknFdTn+wpHBOLZL3g4w4s=
X-Received: by 2002:a2e:a687:0:b0:2b6:af68:6803 with SMTP id
 q7-20020a2ea687000000b002b6af686803mr5694398lje.4.1692024679771; Mon, 14 Aug
 2023 07:51:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230806213107.GFZNARG6moWpFuSJ9W@fat_crate.local>
 <CACO55tvZD5U4J8DawFTRVnV-dLYLngfhuqO29_sWNEGofKfnBg@mail.gmail.com>
 <20230807150521.GGZNEIMQ9rsyCmkpoA@fat_crate.local>
 <CACO55tvWuSdwdirj7S3Dk-r4NAw8jC8g5RHKFd62WXi43iQP-w@mail.gmail.com>
 <87fs4sfu54.wl-tiwai@suse.de>
 <CACO55tszwFEgt=8xn4auAE7KJVs3ybGG68OzL9HJt19XGVhhHQ@mail.gmail.com>
 <874jl8fngo.wl-tiwai@suse.de>
 <CACO55ts9YWF7nLi3Zs4xKySpdHyUFgf4r566cKx3FwNTCaz0Sg@mail.gmail.com>
 <87wmy4e4uk.wl-tiwai@suse.de> <877cq4e0j5.wl-tiwai@suse.de>
 <87r0occhtw.wl-tiwai@suse.de>
 <CACO55tvbLhn5vC=CpcZbuFEj2cja1=Nt=BKsZmU3+SKgbxoE7Q@mail.gmail.com>
 <87zg2t23js.wl-tiwai@suse.de>
 <CACO55tvPGx7npsXg+tpDoz=KXQBs4Pwz3h9Bie-vHithcHV5eA@mail.gmail.com>
 <CACO55tvD_t4y8s_9gj7vO7zOvsYU1iF=5+a4M2g7_qMH9g3EKg@mail.gmail.com>
 <87r0o521d2.wl-tiwai@suse.de>
 <CACO55tuvzXkUSOQh8NEwC6nEUCWYVfkUmmFWHg_miWcAUWvPsw@mail.gmail.com>
In-Reply-To: <CACO55tuvzXkUSOQh8NEwC6nEUCWYVfkUmmFWHg_miWcAUWvPsw@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 14 Aug 2023 16:51:08 +0200
Message-ID: <CACO55tv4a5fHd6H-bg_W4bCP15mxAKhxCVWyR4_LqZiTsAva4Q@mail.gmail.com>
Subject: Re: 2b5d1c29f6c4 ("drm/nouveau/disp: PIOR DP uses GPIO for HPD, not
 PMGR AUX interrupts")
To: Takashi Iwai <tiwai@suse.de>
X-Mimecast-Spam-Score: 0
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
Cc: nouveau@lists.freedesktop.org, lkml <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, regressions@leemhuis.info,
 Borislav Petkov <bp@alien8.de>, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 14, 2023 at 4:19=E2=80=AFPM Karol Herbst <kherbst@redhat.com> w=
rote:
>
> On Mon, Aug 14, 2023 at 3:35=E2=80=AFPM Takashi Iwai <tiwai@suse.de> wrot=
e:
> >
> > On Mon, 14 Aug 2023 15:19:11 +0200,
> > Karol Herbst wrote:
> > >
> > > On Mon, Aug 14, 2023 at 2:56=E2=80=AFPM Karol Herbst <kherbst@redhat.=
com> wrote:
> > > >
> > > > On Mon, Aug 14, 2023 at 2:48=E2=80=AFPM Takashi Iwai <tiwai@suse.de=
> wrote:
> > > > >
> > > > > On Mon, 14 Aug 2023 14:38:18 +0200,
> > > > > Karol Herbst wrote:
> > > > > >
> > > > > > On Wed, Aug 9, 2023 at 6:16=E2=80=AFPM Takashi Iwai <tiwai@suse=
.de> wrote:
> > > > > > >
> > > > > > > On Wed, 09 Aug 2023 16:46:38 +0200,
> > > > > > > Takashi Iwai wrote:
> > > > > > > >
> > > > > > > > On Wed, 09 Aug 2023 15:13:23 +0200,
> > > > > > > > Takashi Iwai wrote:
> > > > > > > > >
> > > > > > > > > On Wed, 09 Aug 2023 14:19:23 +0200,
> > > > > > > > > Karol Herbst wrote:
> > > > > > > > > >
> > > > > > > > > > On Wed, Aug 9, 2023 at 1:46=E2=80=AFPM Takashi Iwai <ti=
wai@suse.de> wrote:
> > > > > > > > > > >
> > > > > > > > > > > On Wed, 09 Aug 2023 13:42:09 +0200,
> > > > > > > > > > > Karol Herbst wrote:
> > > > > > > > > > > >
> > > > > > > > > > > > On Wed, Aug 9, 2023 at 11:22=E2=80=AFAM Takashi Iwa=
i <tiwai@suse.de> wrote:
> > > > > > > > > > > > >
> > > > > > > > > > > > > On Tue, 08 Aug 2023 12:39:32 +0200,
> > > > > > > > > > > > > Karol Herbst wrote:
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > On Mon, Aug 7, 2023 at 5:05=E2=80=AFPM Borislav=
 Petkov <bp@alien8.de> wrote:
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > On Mon, Aug 07, 2023 at 01:49:42PM +0200, Kar=
ol Herbst wrote:
> > > > > > > > > > > > > > > > in what way does it stop? Just not progress=
ing? That would be kinda
> > > > > > > > > > > > > > > > concerning. Mind tracing with what argument=
s `nvkm_uevent_add` is
> > > > > > > > > > > > > > > > called with and without that patch?
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > Well, me dumping those args I guess made the =
box not freeze before
> > > > > > > > > > > > > > > catching a #PF over serial. Does that help?
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > ....
> > > > > > > > > > > > > > > [    3.410135] Unpacking initramfs...
> > > > > > > > > > > > > > > [    3.416319] software IO TLB: mapped [mem 0=
x00000000a877d000-0x00000000ac77d000] (64MB)
> > > > > > > > > > > > > > > [    3.418227] Initialise system trusted keyr=
ings
> > > > > > > > > > > > > > > [    3.432273] workingset: timestamp_bits=3D5=
6 max_order=3D22 bucket_order=3D0
> > > > > > > > > > > > > > > [    3.439006] ntfs: driver 2.1.32 [Flags: R/=
W].
> > > > > > > > > > > > > > > [    3.443368] fuse: init (API version 7.38)
> > > > > > > > > > > > > > > [    3.447601] 9p: Installing v9fs 9p2000 fil=
e system support
> > > > > > > > > > > > > > > [    3.453223] Key type asymmetric registered
> > > > > > > > > > > > > > > [    3.457332] Asymmetric key parser 'x509' r=
egistered
> > > > > > > > > > > > > > > [    3.462236] Block layer SCSI generic (bsg)=
 driver version 0.4 loaded (major 250)
> > > > > > > > > > > > > > > [    3.475865] efifb: probing for efifb
> > > > > > > > > > > > > > > [    3.479458] efifb: framebuffer at 0xf90000=
00, using 1920k, total 1920k
> > > > > > > > > > > > > > > [    3.485969] efifb: mode is 800x600x32, lin=
elength=3D3200, pages=3D1
> > > > > > > > > > > > > > > [    3.491872] efifb: scrolling: redraw
> > > > > > > > > > > > > > > [    3.495438] efifb: Truecolor: size=3D8:8:8=
:8, shift=3D24:16:8:0
> > > > > > > > > > > > > > > [    3.502349] Console: switching to colour f=
rame buffer device 100x37
> > > > > > > > > > > > > > > [    3.509564] fb0: EFI VGA frame buffer devi=
ce
> > > > > > > > > > > > > > > [    3.514013] ACPI: \_PR_.CP00: Found 4 idle=
 states
> > > > > > > > > > > > > > > [    3.518850] ACPI: \_PR_.CP01: Found 4 idle=
 states
> > > > > > > > > > > > > > > [    3.523687] ACPI: \_PR_.CP02: Found 4 idle=
 states
> > > > > > > > > > > > > > > [    3.528515] ACPI: \_PR_.CP03: Found 4 idle=
 states
> > > > > > > > > > > > > > > [    3.533346] ACPI: \_PR_.CP04: Found 4 idle=
 states
> > > > > > > > > > > > > > > [    3.538173] ACPI: \_PR_.CP05: Found 4 idle=
 states
> > > > > > > > > > > > > > > [    3.543003] ACPI: \_PR_.CP06: Found 4 idle=
 states
> > > > > > > > > > > > > > > [    3.544219] Freeing initrd memory: 8196K
> > > > > > > > > > > > > > > [    3.547844] ACPI: \_PR_.CP07: Found 4 idle=
 states
> > > > > > > > > > > > > > > [    3.609542] Serial: 8250/16550 driver, 4 p=
orts, IRQ sharing enabled
> > > > > > > > > > > > > > > [    3.616224] 00:05: ttyS0 at I/O 0x3f8 (irq=
 =3D 4, base_baud =3D 115200) is a 16550A
> > > > > > > > > > > > > > > [    3.625552] serial 0000:00:16.3: enabling =
device (0000 -> 0003)
> > > > > > > > > > > > > > > [    3.633034] 0000:00:16.3: ttyS1 at I/O 0xf=
0a0 (irq =3D 17, base_baud =3D 115200) is a 16550A
> > > > > > > > > > > > > > > [    3.642451] Linux agpgart interface v0.103
> > > > > > > > > > > > > > > [    3.647141] ACPI: bus type drm_connector r=
egistered
> > > > > > > > > > > > > > > [    3.653261] Console: switching to colour d=
ummy device 80x25
> > > > > > > > > > > > > > > [    3.659092] nouveau 0000:03:00.0: vgaarb: =
deactivate vga console
> > > > > > > > > > > > > > > [    3.665174] nouveau 0000:03:00.0: NVIDIA G=
T218 (0a8c00b1)
> > > > > > > > > > > > > > > [    3.784585] nouveau 0000:03:00.0: bios: ve=
rsion 70.18.83.00.08
> > > > > > > > > > > > > > > [    3.792244] nouveau 0000:03:00.0: fb: 512 =
MiB DDR3
> > > > > > > > > > > > > > > [    3.948786] nouveau 0000:03:00.0: DRM: VRA=
M: 512 MiB
> > > > > > > > > > > > > > > [    3.953755] nouveau 0000:03:00.0: DRM: GAR=
T: 1048576 MiB
> > > > > > > > > > > > > > > [    3.959073] nouveau 0000:03:00.0: DRM: TMD=
S table version 2.0
> > > > > > > > > > > > > > > [    3.964808] nouveau 0000:03:00.0: DRM: DCB=
 version 4.0
> > > > > > > > > > > > > > > [    3.969938] nouveau 0000:03:00.0: DRM: DCB=
 outp 00: 02000360 00000000
> > > > > > > > > > > > > > > [    3.976367] nouveau 0000:03:00.0: DRM: DCB=
 outp 01: 02000362 00020010
> > > > > > > > > > > > > > > [    3.982792] nouveau 0000:03:00.0: DRM: DCB=
 outp 02: 028003a6 0f220010
> > > > > > > > > > > > > > > [    3.989223] nouveau 0000:03:00.0: DRM: DCB=
 outp 03: 01011380 00000000
> > > > > > > > > > > > > > > [    3.995647] nouveau 0000:03:00.0: DRM: DCB=
 outp 04: 08011382 00020010
> > > > > > > > > > > > > > > [    4.002076] nouveau 0000:03:00.0: DRM: DCB=
 outp 05: 088113c6 0f220010
> > > > > > > > > > > > > > > [    4.008511] nouveau 0000:03:00.0: DRM: DCB=
 conn 00: 00101064
> > > > > > > > > > > > > > > [    4.014151] nouveau 0000:03:00.0: DRM: DCB=
 conn 01: 00202165
> > > > > > > > > > > > > > > [    4.021710] nvkm_uevent_add: uevent: 0xfff=
f888100242100, event: 0xffff8881022de1a0, id: 0x0, bits: 0x1, func: 0x00000=
00000000000
> > > > > > > > > > > > > > > [    4.033680] nvkm_uevent_add: uevent: 0xfff=
f888100242300, event: 0xffff8881022de1a0, id: 0x0, bits: 0x1, func: 0x00000=
00000000000
> > > > > > > > > > > > > > > [    4.045429] nouveau 0000:03:00.0: DRM: MM:=
 using COPY for buffer copies
> > > > > > > > > > > > > > > [    4.052059] stackdepot: allocating hash ta=
ble of 1048576 entries via kvcalloc
> > > > > > > > > > > > > > > [    4.067191] nvkm_uevent_add: uevent: 0xfff=
f888100242800, event: 0xffff888104b3e260, id: 0x0, bits: 0x1, func: 0x00000=
00000000000
> > > > > > > > > > > > > > > [    4.078936] nvkm_uevent_add: uevent: 0xfff=
f888100242900, event: 0xffff888104b3e260, id: 0x1, bits: 0x1, func: 0x00000=
00000000000
> > > > > > > > > > > > > > > [    4.090514] nvkm_uevent_add: uevent: 0xfff=
f888100242a00, event: 0xffff888102091f28, id: 0x1, bits: 0x3, func: 0xfffff=
fff8177b700
> > > > > > > > > > > > > > > [    4.102118] tsc: Refined TSC clocksource c=
alibration: 3591.345 MHz
> > > > > > > > > > > > > > > [    4.108342] clocksource: tsc: mask: 0xffff=
ffffffffffff max_cycles: 0x33c4635c383, max_idle_ns: 440795314831 ns
> > > > > > > > > > > > > > > [    4.108401] nvkm_uevent_add: uevent: 0xfff=
f8881020b6000, event: 0xffff888102091f28, id: 0xf, bits: 0x3, func: 0xfffff=
fff8177b700
> > > > > > > > > > > > > > > [    4.129864] clocksource: Switched to clock=
source tsc
> > > > > > > > > > > > > > > [    4.131478] [drm] Initialized nouveau 1.3.=
1 20120801 for 0000:03:00.0 on minor 0
> > > > > > > > > > > > > > > [    4.143806] BUG: kernel NULL pointer deref=
erence, address: 0000000000000020
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > ahh, that would have been good to know :) Mind =
figuring out what's
> > > > > > > > > > > > > > exactly NULL inside nvif_object_mthd? Or rather=
 what line
> > > > > > > > > > > > > > `nvif_object_mthd+0x136` belongs to, then it sh=
ould be easy to figure
> > > > > > > > > > > > > > out what's wrong here.
> > > > > > > > > > > > >
> > > > > > > > > > > > > FWIW, we've hit the bug on openSUSE Tumbleweed 6.=
4.8 kernel:
> > > > > > > > > > > > >   https://bugzilla.suse.com/show_bug.cgi?id=3D121=
4073
> > > > > > > > > > > > > Confirmed that reverting the patch cured the issu=
e.
> > > > > > > > > > > > >
> > > > > > > > > > > > > FWIW, loading nouveau showed a refcount_t warning=
 just before the NULL
> > > > > > > > > > > > > dereference:
> > > > > > > > > > > > >
> > > > > > > > > > > >
> > > > > > > > > > > > mh, I wonder if one of those `return -EINVAL;` bran=
ches is hit where
> > > > > > > > > > > > it wasn't before. Could some of you check if `nvkm_=
uconn_uevent`
> > > > > > > > > > > > returns -EINVAL with that patch where it didn't bef=
ore? I wonder if
> > > > > > > > > > > > it's the `if (&outp->head =3D=3D &conn->disp->outps=
) return -EINVAL;` and
> > > > > > > > > > > > if remove that fixes the crash?
> > > > > > > > > > >
> > > > > > > > > > > Please give a patch, then I can build a kernel and le=
t the reporter
> > > > > > > > > > > testing it :)
> > > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > attached a patch.
> > > > > > > > >
> > > > > > > > > Thanks.  Now I'm building a test kernel and asked the rep=
orter for
> > > > > > > > > testing it.
> > > > > > > >
> > > > > > > > And the result was negative, the boot still hanged up.
> > > > > > >
> > > > > > > And below is another log from the 6.4.8 kernel with KASAN-ena=
bled.
> > > > > > > Some memory corruption seems happening.
> > > > > > >
> > > > > > > [  228.422919] nouveau 0000:02:00.0: DRM: DCB conn 01: 0000a1=
46
> > > > > > > [  228.428674] nouveau 0000:02:00.0: DRM: MM: using M2MF for =
buffer copies
> > > > > > > [  228.436682] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> > > > > > > [  228.436698] BUG: KASAN: slab-use-after-free in drm_connect=
or_list_iter_next+0x176/0x320
> > > > > > > [  228.436715] Read of size 4 at addr ffff8881731ce050 by tas=
k modprobe/6174
> > > > > > >
> > > > > > > [  228.436728] CPU: 0 PID: 6174 Comm: modprobe Not tainted 6.=
4.9-4.g5b9ad20-default #1 openSUSE Tumbleweed (unreleased) d0a6841e538b38d1=
7513f6942fb58770372b54fd
> > > > > > > [  228.436740] Hardware name: Apple Inc. MacBook5,1/Mac-F42D8=
9C8, BIOS     MB51.88Z.007D.B03.0904271443 04/27/09
> > > > > > > [  228.436747] Call Trace:
> > > > > > > [  228.436753]  <TASK>
> > > > > > > [  228.436759]  dump_stack_lvl+0x47/0x60
> > > > > > > [  228.436773]  print_report+0xcf/0x640
> > > > > > > [  228.436784]  ? __pfx__raw_spin_lock_irqsave+0x10/0x10
> > > > > > > [  228.436797]  ? drm_connector_list_iter_next+0x176/0x320
> > > > > > > [  228.436807]  kasan_report+0xb1/0xe0
> > > > > > > [  228.436817]  ? drm_connector_list_iter_next+0x176/0x320
> > > > > > > [  228.436828]  kasan_check_range+0x105/0x1b0
> > > > > > > [  228.436837]  drm_connector_list_iter_next+0x176/0x320
> > > > > > > [  228.436848]  ? __pfx_drm_connector_list_iter_next+0x10/0x1=
0
> > > > > > > [  228.436859]  ? __kmem_cache_free+0x18a/0x2c0
> > > > > > > [  228.436868]  nouveau_connector_create+0x170/0x1cd0 [nouvea=
u d0287dfba9984367c331e8149297392f67038244]
> > > > > > > [  228.437540]  ? drm_encoder_init+0xbe/0x140
> > > > > > > [  228.437554]  ? __pfx_nouveau_connector_create+0x10/0x10 [n=
ouveau d0287dfba9984367c331e8149297392f67038244]
> > > > > > > [  228.438137]  ? nvif_outp_ctor+0x2d9/0x430 [nouveau d0287df=
ba9984367c331e8149297392f67038244]
> > > > > > > [  228.438236]  nv50_display_create+0xe54/0x30d0 [nouveau d02=
87dfba9984367c331e8149297392f67038244]
> > > > > > > [  228.438236]  nouveau_display_create+0x903/0x10c0 [nouveau =
d0287dfba9984367c331e8149297392f67038244]
> > > > > > > [  228.438236]  nouveau_drm_device_init+0x3a4/0x19e0 [nouveau=
 d0287dfba9984367c331e8149297392f67038244]
> > > > > > > [  228.438236]  ? __pfx_nouveau_drm_device_init+0x10/0x10 [no=
uveau d0287dfba9984367c331e8149297392f67038244]
> > > > > > > [  228.438236]  ? __pfx_pci_update_current_state+0x10/0x10
> > > > > > > [  228.438236]  ? __kasan_check_byte+0x13/0x50
> > > > > > > [  228.438236]  nouveau_drm_probe+0x1a2/0x6b0 [nouveau d0287d=
fba9984367c331e8149297392f67038244]
> > > > > > > [  228.438236]  ? __pfx__raw_spin_lock_irqsave+0x10/0x10
> > > > > > > [  228.438236]  ? __pfx_nouveau_drm_probe+0x10/0x10 [nouveau =
d0287dfba9984367c331e8149297392f67038244]
> > > > > > > [  228.438236]  ? __pfx_nouveau_drm_probe+0x10/0x10 [nouveau =
d0287dfba9984367c331e8149297392f67038244]
> > > > > > > [  228.438236]  local_pci_probe+0xdd/0x190
> > > > > > > [  228.438236]  pci_device_probe+0x23a/0x770
> > > > > > > [  228.438236]  ? kernfs_add_one+0x2d8/0x450
> > > > > > > [  228.438236]  ? kernfs_get.part.0+0x4c/0x70
> > > > > > > [  228.438236]  ? __pfx_pci_device_probe+0x10/0x10
> > > > > > > [  228.438236]  ? kernfs_create_link+0x15f/0x230
> > > > > > > [  228.438236]  ? kernfs_put+0x1c/0x40
> > > > > > > [  228.438236]  ? sysfs_do_create_link_sd+0x8e/0x100
> > > > > > > [  228.438236]  really_probe+0x3e2/0xb80
> > > > > > > [  228.438236]  __driver_probe_device+0x18c/0x450
> > > > > > > [  228.438236]  ? __pfx_klist_iter_init_node+0x10/0x10
> > > > > > > [  228.438236]  driver_probe_device+0x4a/0x120
> > > > > > > [  228.438236]  __driver_attach+0x1e1/0x4a0
> > > > > > > [  228.438236]  ? __pfx___driver_attach+0x10/0x10
> > > > > > > [  228.438236]  bus_for_each_dev+0xf4/0x170
> > > > > > > [  228.438236]  ? __pfx__raw_spin_lock+0x10/0x10
> > > > > > > [  228.438236]  ? __pfx_bus_for_each_dev+0x10/0x10
> > > > > > > [  228.438236]  bus_add_driver+0x29e/0x570
> > > > > > > [  228.438236]  ? __pfx_nouveau_drm_init+0x10/0x10 [nouveau d=
0287dfba9984367c331e8149297392f67038244]
> > > > > > > [  228.438236]  ? __pfx_nouveau_drm_init+0x10/0x10 [nouveau d=
0287dfba9984367c331e8149297392f67038244]
> > > > > > > [  228.438236]  driver_register+0x134/0x460
> > > > > > > [  228.438236]  ? __pfx_nouveau_drm_init+0x10/0x10 [nouveau d=
0287dfba9984367c331e8149297392f67038244]
> > > > > > > [  228.438236]  do_one_initcall+0x8e/0x310
> > > > > > > [  228.438236]  ? __pfx_do_one_initcall+0x10/0x10
> > > > > > > [  228.438236]  ? __kmem_cache_alloc_node+0x1b9/0x3b0
> > > > > > > [  228.438236]  ? do_init_module+0x4b/0x730
> > > > > > > [  228.438236]  ? kasan_unpoison+0x44/0x70
> > > > > > > [  228.438236]  do_init_module+0x238/0x730
> > > > > > > [  228.438236]  load_module+0x5b41/0x6dd0
> > > > > > > [  228.438236]  ? __pfx_load_module+0x10/0x10
> > > > > > > [  228.438236]  ? _raw_spin_lock+0x85/0xe0
> > > > > > > [  228.438236]  ? __pfx__raw_spin_lock+0x10/0x10
> > > > > > > [  228.438236]  ? find_vmap_area+0xab/0xe0
> > > > > > > [  228.438236]  ? __do_sys_init_module+0x1df/0x210
> > > > > > > [  228.438236]  __do_sys_init_module+0x1df/0x210
> > > > > > > [  228.438236]  ? __pfx___do_sys_init_module+0x10/0x10
> > > > > > > [  228.438236]  ? syscall_exit_to_user_mode+0x1b/0x40
> > > > > > > [  228.438236]  ? do_syscall_64+0x6c/0x90
> > > > > > > [  228.438236]  ? __pfx_ksys_read+0x10/0x10
> > > > > > > [  228.438236]  do_syscall_64+0x60/0x90
> > > > > > > [  228.438236]  ? syscall_exit_to_user_mode+0x1b/0x40
> > > > > > > [  228.438236]  ? do_syscall_64+0x6c/0x90
> > > > > > > [  228.438236]  ? syscall_exit_to_user_mode+0x1b/0x40
> > > > > > > [  228.438236]  ? do_syscall_64+0x6c/0x90
> > > > > > > [  228.438236]  ? exc_page_fault+0x62/0xd0
> > > > > > > [  228.438236]  entry_SYSCALL_64_after_hwframe+0x77/0xe1
> > > > > > > [  228.438236] RIP: 0033:0x7f91ce119a5e
> > > > > > > [  228.438236] Code: c3 66 2e 0f 1f 84 00 00 00 00 00 90 90 9=
0 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 66 90 49 89 ca b8 af 00 0=
0 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 7a 03 0d 00 f7 d8 64 89 01=
 48
> > > > > > > [  228.438236] RSP: 002b:00007ffce2813538 EFLAGS: 00000246 OR=
IG_RAX: 00000000000000af
> > > > > > > [  228.438236] RAX: ffffffffffffffda RBX: 00005588462def10 RC=
X: 00007f91ce119a5e
> > > > > > > [  228.438236] RDX: 00005588462e39c0 RSI: 0000000000fda8b2 RD=
I: 00007f91cc371010
> > > > > > > [  228.438236] RBP: 00005588462e39c0 R08: 00005588462e3ce0 R0=
9: 0000000000000000
> > > > > > > [  228.438236] R10: 000000000005af11 R11: 0000000000000246 R1=
2: 0000000000040000
> > > > > > > [  228.438236] R13: 0000000000000000 R14: 0000000000000009 R1=
5: 00005588462de7c0
> > > > > > > [  228.438236]  </TASK>
> > > > > > >
> > > > > > > [  228.438236] Allocated by task 6174:
> > > > > > > [  228.438236]  kasan_save_stack+0x20/0x40
> > > > > > > [  228.438236]  kasan_set_track+0x25/0x30
> > > > > > > [  228.438236]  __kasan_kmalloc+0xaa/0xb0
> > > > > > > [  228.438236]  nouveau_connector_create+0x386/0x1cd0 [nouvea=
u]
> > > > > > > [  228.438236]  nv50_display_create+0xe54/0x30d0 [nouveau]
> > > > > > > [  228.438236]  nouveau_display_create+0x903/0x10c0 [nouveau]
> > > > > > > [  228.438236]  nouveau_drm_device_init+0x3a4/0x19e0 [nouveau=
]
> > > > > > > [  228.438236]  nouveau_drm_probe+0x1a2/0x6b0 [nouveau]
> > > > > > > [  228.438236]  local_pci_probe+0xdd/0x190
> > > > > > > [  228.438236]  pci_device_probe+0x23a/0x770
> > > > > > > [  228.438236]  really_probe+0x3e2/0xb80
> > > > > > > [  228.438236]  __driver_probe_device+0x18c/0x450
> > > > > > > [  228.438236]  driver_probe_device+0x4a/0x120
> > > > > > > [  228.438236]  __driver_attach+0x1e1/0x4a0
> > > > > > > [  228.438236]  bus_for_each_dev+0xf4/0x170
> > > > > > > [  228.438236]  bus_add_driver+0x29e/0x570
> > > > > > > [  228.438236]  driver_register+0x134/0x460
> > > > > > > [  228.438236]  do_one_initcall+0x8e/0x310
> > > > > > > [  228.438236]  do_init_module+0x238/0x730
> > > > > > > [  228.438236]  load_module+0x5b41/0x6dd0
> > > > > > > [  228.438236]  __do_sys_init_module+0x1df/0x210
> > > > > > > [  228.438236]  do_syscall_64+0x60/0x90
> > > > > > > [  228.438236]  entry_SYSCALL_64_after_hwframe+0x77/0xe1
> > > > > > >
> > > > > > > [  228.438236] Freed by task 6174:
> > > > > > > [  228.438236]  kasan_save_stack+0x20/0x40
> > > > > > > [  228.438236]  kasan_set_track+0x25/0x30
> > > > > > > [  228.438236]  kasan_save_free_info+0x2e/0x50
> > > > > > > [  228.438236]  ____kasan_slab_free+0x169/0x1c0
> > > > > > > [  228.438236]  slab_free_freelist_hook+0xcd/0x190
> > > > > > > [  228.438236]  __kmem_cache_free+0x18a/0x2c0
> > > > > > > [  228.438236]  nouveau_connector_create+0x1423/0x1cd0 [nouve=
au]
> > > > > > > [  228.438236]  nv50_display_create+0xe54/0x30d0 [nouveau]
> > > > > > > [  228.438236]  nouveau_display_create+0x903/0x10c0 [nouveau]
> > > > > > > [  228.438236]  nouveau_drm_device_init+0x3a4/0x19e0 [nouveau=
]
> > > > > > > [  228.438236]  nouveau_drm_probe+0x1a2/0x6b0 [nouveau]
> > > > > > > [  228.438236]  local_pci_probe+0xdd/0x190
> > > > > > > [  228.438236]  pci_device_probe+0x23a/0x770
> > > > > > > [  228.438236]  really_probe+0x3e2/0xb80
> > > > > > > [  228.438236]  __driver_probe_device+0x18c/0x450
> > > > > > > [  228.438236]  driver_probe_device+0x4a/0x120
> > > > > > > [  228.438236]  __driver_attach+0x1e1/0x4a0
> > > > > > > [  228.438236]  bus_for_each_dev+0xf4/0x170
> > > > > > > [  228.438236]  bus_add_driver+0x29e/0x570
> > > > > > > [  228.438236]  driver_register+0x134/0x460
> > > > > > > [  228.438236]  do_one_initcall+0x8e/0x310
> > > > > > > [  228.438236]  do_init_module+0x238/0x730
> > > > > > > [  228.438236]  load_module+0x5b41/0x6dd0
> > > > > > > [  228.438236]  __do_sys_init_module+0x1df/0x210
> > > > > > > [  228.438236]  do_syscall_64+0x60/0x90
> > > > > > > [  228.438236]  entry_SYSCALL_64_after_hwframe+0x77/0xe1
> > > > > > >
> > > > > > > [  228.438236] The buggy address belongs to the object at fff=
f8881731ce000
> > > > > > >                 which belongs to the cache kmalloc-4k of size=
 4096
> > > > > > > [  228.438236] The buggy address is located 80 bytes inside o=
f
> > > > > > >                 freed 4096-byte region [ffff8881731ce000, fff=
f8881731cf000)
> > > > > > >
> > > > > > > [  228.438236] The buggy address belongs to the physical page=
:
> > > > > > > [  228.438236] page:00000000d1c274b4 refcount:1 mapcount:0 ma=
pping:0000000000000000 index:0x0 pfn:0x1731c8
> > > > > > > [  228.438236] head:00000000d1c274b4 order:3 entire_mapcount:=
0 nr_pages_mapped:0 pincount:0
> > > > > > > [  228.438236] flags: 0x17ffffc0010200(slab|head|node=3D0|zon=
e=3D2|lastcpupid=3D0x1fffff)
> > > > > > > [  228.438236] page_type: 0xffffffff()
> > > > > > > [  228.438236] raw: 0017ffffc0010200 ffff888100042140 dead000=
000000122 0000000000000000
> > > > > > > [  228.438236] raw: 0000000000000000 0000000080040004 0000000=
1ffffffff 0000000000000000
> > > > > > > [  228.438236] page dumped because: kasan: bad access detecte=
d
> > > > > > >
> > > > > > > [  228.438236] Memory state around the buggy address:
> > > > > > > [  228.438236]  ffff8881731cdf00: fc fc fc fc fc fc fc fc fc =
fc fc fc fc fc fc fc
> > > > > > > [  228.438236]  ffff8881731cdf80: fc fc fc fc fc fc fc fc fc =
fc fc fc fc fc fc fc
> > > > > > > [  228.438236] >ffff8881731ce000: fa fb fb fb fb fb fb fb fb =
fb fb fb fb fb fb fb
> > > > > > > [  228.438236]                                               =
   ^
> > > > > > > [  228.438236]  ffff8881731ce080: fb fb fb fb fb fb fb fb fb =
fb fb fb fb fb fb fb
> > > > > > > [  228.438236]  ffff8881731ce100: fb fb fb fb fb fb fb fb fb =
fb fb fb fb fb fb fb
> > > > > > > [  228.438236] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> > > > > > >
> > > > > >
> > > > > > mind resolving those to file lines via decode_stacktrace.sh or
> > > > > > something, because looking at it, it makes no sense really.
> > > > >
> > > > > I don't own the machine, so it's a bit difficult from my side,
> > > > > unfortunately.
> > > > >
> > >
> > > also, you don't need to run it on the same machine if it's all
> > > distribution packaged. As long as you have the exact same binary
> > > available you can resolve the lines. Or just use gdb:
> > > https://docs.kernel.org/admin-guide/bug-hunting.html#gdb
> >
> > Unfortunately it's not possible, as it's a moving target (following
> > the upstream development), and the rpm packages used for the report
> > are already gone.  What I can get now won't match any longer.
> >
> > But now I wonder whether this can be reproduced by injecting an
> > error artificially.
> >
>
> uhh, nvm. I was blind and I didn't see those lines of code:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/d=
rivers/gpu/drm/nouveau/nouveau_connector.c?h=3Dv6.5-rc6#n1403
>
> Those lines probably should only be called after all error checks,
> I'll see if it's safe to do so.
>

I've sent a patch out to address this memory corruption
https://patchwork.freedesktop.org/patch/552642/

It might or might not fix regressions from the original I2C fix, so
please test and report if there are remaining issues.

> >
> > Takashi
> >


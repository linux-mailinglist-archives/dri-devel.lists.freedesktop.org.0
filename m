Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2CD838BA1
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 11:23:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5780710E745;
	Tue, 23 Jan 2024 10:23:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 022A710E745
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 10:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706005406;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OnxS8TUXze8cVtdA6154n5Rqo7M9l26NFn0F0PoNH8E=;
 b=OPH5xail/o64/auwWVT2TnIfxxTxV5nkdV/EC4AXV7JhEs4duuED1XV/YTXtzIcnzCIccM
 aVuVDF+mzHN8UP1Ngk6uN0XT04blCNiXg0QbWV3mijmOWPeOhUcZjx72GBrdMUfmFOgDvw
 WVsNDHA89SmYfEydf2yKLtOTYrIp5Ts=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-588-J17xckszP5-D-ozTECIjgw-1; Tue, 23 Jan 2024 05:23:24 -0500
X-MC-Unique: J17xckszP5-D-ozTECIjgw-1
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-78313358d3bso125403585a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 02:23:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706005404; x=1706610204;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OnxS8TUXze8cVtdA6154n5Rqo7M9l26NFn0F0PoNH8E=;
 b=fSQlQvgaEU1k9He2AZRtTiaQ5/Q1Jonwlnc6UWegjnQ/+v3QJWt79Eh0Qibwj5BSEq
 fBdlPTG5vKLIZ1Y7FmsCH2haD6ea9rukDImJH/fijVgV1z+hx+2Izh1AlWWr5Pvz1fGn
 y80xCWFVHLXnrjVHjqk17uaaCkT/BjByatHOgeSuFjYZQPO5bwGUeN+cUt3Tv3sEEprg
 18udZCJBrgnAik9ztKhNXYsD/0Zz+jDJ4PxFcwsUMBmKH6sERxUyYQKC31eG8muqBfdA
 GVKSkHZJO6oTdADkrMQA6qfBnQ48gDoRxgLjjJQHrGLhxLGyUY9O51olWKfO44h5JTme
 CFLQ==
X-Gm-Message-State: AOJu0Yw626tEWn3/q4Fw41IFojIALfqJ/tvNEqNmaMki/HQpU4nMrdv1
 AlQzffc+JSN4uLHxMHY2up/n0a4A6+yYTr5cjZmFH0dMkmDwkl0sK28hKw/Hz3jHYnnGvKLA7S5
 3onlDA11YiOUbxQiIL4fZVprJhEKB+LJioWWaG6ohYrY6DU40ojCCH5vA39jDjGV3vw==
X-Received: by 2002:a05:620a:1a26:b0:783:88e1:5221 with SMTP id
 bk38-20020a05620a1a2600b0078388e15221mr10976650qkb.6.1706005404050; 
 Tue, 23 Jan 2024 02:23:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF9GfusdFoULGiTnMXwI+zcNJUBSCsfSKoWHpn+j+OQKvKW7sF0qqOHjpzmwKekN7gRPPL31w==
X-Received: by 2002:a05:620a:1a26:b0:783:88e1:5221 with SMTP id
 bk38-20020a05620a1a2600b0078388e15221mr10976638qkb.6.1706005403799; 
 Tue, 23 Jan 2024 02:23:23 -0800 (PST)
Received: from pstanner-thinkpadt14sgen1.remote.csb
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 t8-20020a05620a034800b00783a206381csm1341717qkm.37.2024.01.23.02.23.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jan 2024 02:23:23 -0800 (PST)
Message-ID: <3b2746f7779aa5dc39a406593dae37c4a8da676d.camel@redhat.com>
Subject: Re: [PATCH v2 00/10] Make PCI's devres API more consistent
From: Philipp Stanner <pstanner@redhat.com>
To: Jonathan Corbet <corbet@lwn.net>, Hans de Goede <hdegoede@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas
 <bhelgaas@google.com>, Sam Ravnborg <sam@ravnborg.org>, dakr@redhat.com
Date: Tue, 23 Jan 2024 11:23:20 +0100
In-Reply-To: <20240123094317.15958-1-pstanner@redhat.com>
References: <20240123094317.15958-1-pstanner@redhat.com>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
MIME-Version: 1.0
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
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Forgot to add a few changes to the changelog:

On Tue, 2024-01-23 at 10:42 +0100, Philipp Stanner wrote:
> Changes in v2:
> =C2=A0 - Make commit head lines congruent with PCI's style (Bjorn)
> =C2=A0 - Add missing error checks for devm_add_action(). (Andy)
> =C2=A0 - Repair the "Returns: " marks for docu generation (Andy)
> =C2=A0 - Initialize the addr_devres struct with memset(). (Andy)
> =C2=A0 - Make pcim_intx() a PCI-internal function so that new drivers
> won't
> =C2=A0=C2=A0=C2=A0 be encouraged to use the outdated pci_intx() mechanism=
.
> =C2=A0=C2=A0=C2=A0 (Andy / Philipp)
> =C2=A0 - Fix grammar and spelling (Bjorn)
> =C2=A0 - Be more precise on why pcim_iomap_table() is problematic (Bjorn)
> =C2=A0 - Provide the actual structs' and functions' names in the commit
> =C2=A0=C2=A0=C2=A0 messages (Bjorn)
> =C2=A0 - Remove redundant variable initializers (Andy)
> =C2=A0 - Regroup PM bitfield members in struct pci_dev (Andy)
> =C2=A0 - Consistently use the term "PCI devres API"; also in Patch #10
> (Bjorn)

 * Make pcim_intx() visible only for the PCI subsystem so that new   =20
   drivers won't use this outdated API (Andy, Myself)
 * Add a NOTE to pcim_iomap() to warn about this function being the    onee
   xception that does just return NULL.

This v2 now contains most of the feedback, except the ones Andy and I
haven't agreed on yet.

Thx,
P.

>=20
>=20
> =C2=A1Hola!
>=20
> PCI's devres API suffers several weaknesses:
>=20
> 1. There are functions prefixed with pcim_. Those are always managed
> =C2=A0=C2=A0 counterparts to never-managed functions prefixed with pci_ =
=E2=80=93 or so
> one
> =C2=A0=C2=A0 would like to think. There are some apparently unmanaged fun=
ctions
> =C2=A0=C2=A0 (all region-request / release functions, and pci_intx()) whi=
ch
> =C2=A0=C2=A0 suddenly become managed once the user has initialized the de=
vice
> with
> =C2=A0=C2=A0 pcim_enable_device() instead of pci_enable_device(). This
> "sometimes
> =C2=A0=C2=A0 yes, sometimes no" nature of those functions is confusing an=
d
> =C2=A0=C2=A0 therefore bug-provoking. In fact, it has already caused a bu=
g in
> DRM.
> =C2=A0=C2=A0 The last patch in this series fixes that bug.
> 2. iomappings: Instead of giving each mapping its own callback, the
> =C2=A0=C2=A0 existing API uses a statically allocated struct tracking one
> mapping
> =C2=A0=C2=A0 per bar. This is not extensible. Especially, you can't creat=
e
> =C2=A0=C2=A0 _ranged_ managed mappings that way, which many drivers want.
> 3. Managed request functions only exist as "plural versions" with a
> =C2=A0=C2=A0 bit-mask as a parameter. That's quite over-engineered consid=
ering
> =C2=A0=C2=A0 that each user only ever mapps one, maybe two bars.
>=20
> This series:
> - add a set of new "singular" devres functions that use devres the
> way
> =C2=A0 its intended, with one callback per resource.
> - deprecates the existing iomap-table mechanism.
> - deprecates the hybrid nature of pci_ functions.
> - preserves backwards compatibility so that drivers using the
> existing
> =C2=A0 API won't notice any changes.
> - adds documentation, especially some warning users about the
> =C2=A0 complicated nature of PCI's devres.
>=20
>=20
> Note that this series is based on my "unify pci_iounmap"-series from
> a
> few weeks ago. [1]
>=20
> I tested this on a x86 VM with a simple pci test-device with two
> regions. Operates and reserves resources as intended on my system.
> Kasan and kmemleak didn't find any problems.
>=20
> I believe this series cleans the API up as much as possible without
> having to port all existing drivers to the new API. Especially, I
> think
> that this implementation is easy to extend if the need for new
> managed
> functions arises :)
>=20
> Greetings,
> P.
>=20
> Philipp Stanner (10):
> =C2=A0 PCI: add new set of devres functions
> =C2=A0 PCI: deprecate iomap-table functions
> =C2=A0 PCI: warn users about complicated devres nature
> =C2=A0 PCI: make devres region requests consistent
> =C2=A0 PCI: move dev-enabled status bit to struct pci_dev
> =C2=A0 PCI: move pinned status bit to struct pci_dev
> =C2=A0 PCI: give pcim_set_mwi() its own devres callback
> =C2=A0 PCI: give pci(m)_intx its own devres callback
> =C2=A0 PCI: remove legacy pcim_release()
> =C2=A0 drm/vboxvideo: fix mapping leaks
>=20
> =C2=A0Documentation/driver-api/pci/pci.rst=C2=A0 |=C2=A0=C2=A0=C2=A0 3 +
> =C2=A0drivers/gpu/drm/vboxvideo/vbox_main.c |=C2=A0=C2=A0 24 +-
> =C2=A0drivers/pci/devres.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1015 ++++++++++=
+++++++++++--
> --
> =C2=A0drivers/pci/iomap.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 =
18 +
> =C2=A0drivers/pci/pci.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 123 ++-
> =C2=A0drivers/pci/pci.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 25 +-
> =C2=A0include/linux/pci.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 =
18 +-
> =C2=A07 files changed, 1011 insertions(+), 215 deletions(-)
>=20


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C148AC553
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 09:23:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FD5710E31D;
	Mon, 22 Apr 2024 07:23:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="SeJHuQR6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FBE110E31D
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 07:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1713770587;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OIcMJG+fGAzEz/NTv46bIkb26Nco9QPi8mc1USWHzpU=;
 b=SeJHuQR6am/9hP444de/G2daLMRWouVKzWKYujNTHoPbiIY/QTHkt5ba/RkFDh8RdqiZy8
 lQ7gVNWAMXOEdf89p530Atsvb2jAdmY/DLqYfBDuCDlsTrI7loj9tqGZpf5nYpvch3vb6K
 2rIp7Kbh/shuC0zK5tn2N9yo8/u9Bbs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-132-Izwpe0YRP36M7NTcHjhpUw-1; Mon, 22 Apr 2024 03:23:05 -0400
X-MC-Unique: Izwpe0YRP36M7NTcHjhpUw-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-349c5a9ee38so475264f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 00:23:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713770585; x=1714375385;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OIcMJG+fGAzEz/NTv46bIkb26Nco9QPi8mc1USWHzpU=;
 b=V9T0zv+vUQutuFfYK/2sn0GMTFf2Pp4jmC0su11HiR+eoODqdZRTkU4W4DE4oY9j9I
 PwZro21zZ051FmOCTEWqqFFdwGmr0PsSrb6t4qLlKVBLqfu1VmIDibLf1DfpwEUfpUb0
 GgDjKDys3LrKF6+FaElZezbThpVsUQUvBORGzhU/uRlvRBOrKDT97QwSI45pePFWV5Ly
 y3VpCYQHEPtQbviqGggQkRbN54ppLnyFWY0HjPlXb86de1ED7FxOMYuvXmFBy6bt8aBo
 Luijz5TQFYyvAeslbBCsywQzZs0LLMIx7Xl4JsX0mxV7IdUQtwH009m9B2Ulkx6acetu
 KTxQ==
X-Gm-Message-State: AOJu0YzE+SVYRO8xkcmGB34HCFkfnUTPUFu84jArvQ6ySY7sdPTiQ5gd
 cw60ZdAQuvAxwrW+CuEIXGy/+h6NmzfadadeAbGdreUtxM3eUtJOaaa1b0QuomfYO+gFuQB21MH
 /best9o/aXWcEjb1aPYW4ATy7SRhf1UihNjnFXrWBP4hJ8AMZq3sosz4tDkr4yQb7yQ==
X-Received: by 2002:a5d:6511:0:b0:34a:f759:271d with SMTP id
 x17-20020a5d6511000000b0034af759271dmr1699025wru.6.1713770584793; 
 Mon, 22 Apr 2024 00:23:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENlaXme2bZIvMK2y5/VlaEUR/I0OvQzcGMAQUuht+3420rTQbT8vstQpX7xul4QgqcRpsBcQ==
X-Received: by 2002:a5d:6511:0:b0:34a:f759:271d with SMTP id
 x17-20020a5d6511000000b0034af759271dmr1699006wru.6.1713770584420; 
 Mon, 22 Apr 2024 00:23:04 -0700 (PDT)
Received: from pstanner-thinkpadt14sgen1.remote.csb
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 x5-20020a5d6b45000000b003472489d26fsm11267653wrw.19.2024.04.22.00.23.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 00:23:04 -0700 (PDT)
Message-ID: <7b8ffa914dfefcdb19bca9d80024fb8754b73459.camel@redhat.com>
Subject: Re: [PATCH v6 00/10] Make PCI's devres API more consistent
From: Philipp Stanner <pstanner@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>, Sam
 Ravnborg <sam@ravnborg.org>, dakr@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-pci@vger.kernel.org
Date: Mon, 22 Apr 2024 09:23:03 +0200
In-Reply-To: <20240408084423.6697-1-pstanner@redhat.com>
References: <20240408084423.6697-1-pstanner@redhat.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Yo,

we know reached -rc5.

Is this fine for v6.10?

Regards,
P.


On Mon, 2024-04-08 at 10:44 +0200, Philipp Stanner wrote:
> Changes in v6:
> =C2=A0 - Restructure the cleanup in pcim_iomap_regions_request_all() so
> that
> =C2=A0=C2=A0=C2=A0 it doesn't trigger a (false positive) test robot warni=
ng. No
> =C2=A0=C2=A0=C2=A0 behavior change intended. (Dan Carpenter)
>=20
> Changes in v5:
> =C2=A0 - Add Hans's Reviewed-by to vboxvideo patch (Hans de Goede)
> =C2=A0 - Remove stable-kernel from CC in vboxvideo patch (Hans de Goede)
>=20
> Changes in v4:
> =C2=A0 - Rebase against linux-next
>=20
> Changes in v3:
> =C2=A0 - Use the term "PCI devres API" at some forgotten places.
> =C2=A0 - Fix more grammar errors in patch #3.
> =C2=A0 - Remove the comment advising to call (the outdated) pcim_intx() i=
n
> pci.c
> =C2=A0 - Rename __pcim_request_region_range() flags-field "exclusive" to
> =C2=A0=C2=A0=C2=A0 "req_flags", since this is what the int actually repre=
sents.
> =C2=A0 - Remove the call to pcim_region_request() from patch #10. (Hans)
>=20
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
> =C2=A0 - Make pcim_intx() visible only for the PCI subsystem so that
> new=C2=A0=C2=A0=C2=A0=20
> =C2=A0=C2=A0=C2=A0 drivers won't use this outdated API (Andy, Myself)
> =C2=A0 - Add a NOTE to pcim_iomap() to warn about this function being
> the=C2=A0=C2=A0=C2=A0 onee
> =C2=A0=C2=A0=C2=A0 xception that does just return NULL.
> =C2=A0 - Consistently use the term "PCI devres API"; also in Patch #10
> (Bjorn)
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
> =C2=A0 PCI: Add new set of devres functions
> =C2=A0 PCI: Deprecate iomap-table functions
> =C2=A0 PCI: Warn users about complicated devres nature
> =C2=A0 PCI: Make devres region requests consistent
> =C2=A0 PCI: Move dev-enabled status bit to struct pci_dev
> =C2=A0 PCI: Move pinned status bit to struct pci_dev
> =C2=A0 PCI: Give pcim_set_mwi() its own devres callback
> =C2=A0 PCI: Give pci(m)_intx its own devres callback
> =C2=A0 PCI: Remove legacy pcim_release()
> =C2=A0 drm/vboxvideo: fix mapping leaks
>=20
> =C2=A0drivers/gpu/drm/vboxvideo/vbox_main.c |=C2=A0=C2=A0 20 +-
> =C2=A0drivers/pci/devres.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1011 ++++++++++=
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
=C2=A0=C2=A0 21 +-
> =C2=A0include/linux/pci.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 =
18 +-
> =C2=A06 files changed, 999 insertions(+), 212 deletions(-)
>=20


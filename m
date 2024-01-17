Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D1D8302FE
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 10:59:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1F7110E101;
	Wed, 17 Jan 2024 09:59:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E91210E101
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jan 2024 09:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1705485574;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BXWuaM6cUVSlh8BuiMCFX+aJ/lumUdUFLhol1mX3ptg=;
 b=BbnyZAoH62b58IPXKoIkpMV9SVK+sTZkVFeiWSWOkSFH9Fy+e9rLwUKGRux3drUYy+kWUi
 f3TENXbuMn6f2vTaAvgIIpGA65RISF6/Uh6Ez5SZBKweALQwXFQLc8/9uczT/j7JTZlBwo
 jHFfgJi9dcjnOVYbtLoJrolOxfMD+Q4=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-350-I1ZTpHagPVicbFC40VE8jA-1; Wed, 17 Jan 2024 04:59:33 -0500
X-MC-Unique: I1ZTpHagPVicbFC40VE8jA-1
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-78315f4f5c2so194913685a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jan 2024 01:59:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705485572; x=1706090372;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BXWuaM6cUVSlh8BuiMCFX+aJ/lumUdUFLhol1mX3ptg=;
 b=wkgGjUIYguCWyLDnnSRpH8l0C2JfKxexO1Ls0V4i+RwNJdhfCmBkmM2jwhU2DwQM2l
 QO7m38NZawJr52IS1LYl8vPpbBxkj3tP843nQjvTyVr1wfwiU1pZpognJChOmnzNj2Bw
 BsTmNSIfteOp8t8Yi9X9LGK7PVMqWEnCjWwO99z2cfSKeRlncd5IKy7N8rrsq8Dq5Bsp
 rWm+B31qrv/gzXGc+bJhJo6S8c30M2IbWm6F8uvoKn8BBk5rgkcFaiXLrLcKdhiGc0Fw
 pbSH+zBNcMdjX1TLRtswsQzPw8B6q9b4bDwr4oC/TRd6PNXiPPwwjFH2Nqdm+NaJMc6/
 gXFg==
X-Gm-Message-State: AOJu0YxMHNTwx9inF2bYrhMXMIatnJlO7kFNCj0LBkpETUyLTPbfRNRC
 dGtb9RpYqqpe+HqHd+BsBRszftkjmqGB/1Nu6ikg7+HX76JiB2i9O98hgygKH3P9XgR7vn7lSKm
 TbFxeP4oCRQqShalFyXWot1oqQOCPsaNYvcME
X-Received: by 2002:a05:620a:2712:b0:783:54f7:87e3 with SMTP id
 b18-20020a05620a271200b0078354f787e3mr1912708qkp.3.1705485572524; 
 Wed, 17 Jan 2024 01:59:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFSqiqfszMpvjq99qT6Qsh4E31ne0xTg2kSjDD+8OcYXlRuSFlLMN+j9bbV0ag4d0WislsuJQ==
X-Received: by 2002:a05:620a:2712:b0:783:54f7:87e3 with SMTP id
 b18-20020a05620a271200b0078354f787e3mr1912700qkp.3.1705485572147; 
 Wed, 17 Jan 2024 01:59:32 -0800 (PST)
Received: from pstanner-thinkpadt14sgen1.remote.csb
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 w9-20020a05620a148900b0078322355fb7sm4380924qkj.20.2024.01.17.01.59.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jan 2024 01:59:31 -0800 (PST)
Message-ID: <5e760f104c75efe37100cee5a26b7ee3581f03b4.camel@redhat.com>
Subject: Re: [PATCH 00/10] Make PCI's devres API more consistent
From: Philipp Stanner <pstanner@redhat.com>
To: andy.shevchenko@gmail.com
Date: Wed, 17 Jan 2024 10:59:29 +0100
In-Reply-To: <ZabyY3csP0y-p7lb@surfacebook.localdomain>
References: <20240115144655.32046-2-pstanner@redhat.com>
 <ZabyY3csP0y-p7lb@surfacebook.localdomain>
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
Cc: Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Sam Ravnborg <sam@ravnborg.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, dakr@redhat.com,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2024-01-16 at 23:17 +0200, andy.shevchenko@gmail.com wrote:
> Mon, Jan 15, 2024 at 03:46:11PM +0100, Philipp Stanner kirjoitti:
> > =C2=A1Hola!
>=20
> i? Vim user? :-)

The Dark Side of the Force is the path to many abilities, that some
consider to be... unnatural
https://www.neo-layout.org/

>=20
> > PCI's devres API suffers several weaknesses:
> >=20
> > 1. There are functions prefixed with pcim_. Those are always
> > managed
> > =C2=A0=C2=A0 counterparts to never-managed functions prefixed with pci_=
 =E2=80=93 or
> > so one
> > =C2=A0=C2=A0 would like to think. There are some apparently unmanaged
> > functions
> > =C2=A0=C2=A0 (all region-request / release functions, and pci_intx()) w=
hich
> > =C2=A0=C2=A0 suddenly become managed once the user has initialized the =
device
> > with
> > =C2=A0=C2=A0 pcim_enable_device() instead of pci_enable_device(). This
> > "sometimes
> > =C2=A0=C2=A0 yes, sometimes no" nature of those functions is confusing =
and
> > =C2=A0=C2=A0 therefore bug-provoking. In fact, it has already caused a =
bug in
> > DRM.
> > =C2=A0=C2=A0 The last patch in this series fixes that bug.
> > 2. iomappings: Instead of giving each mapping its own callback, the
> > =C2=A0=C2=A0 existing API uses a statically allocated struct tracking o=
ne
> > mapping
> > =C2=A0=C2=A0 per bar. This is not extensible. Especially, you can't cre=
ate
> > =C2=A0=C2=A0 _ranged_ managed mappings that way, which many drivers wan=
t.
> > 3. Managed request functions only exist as "plural versions" with a
> > =C2=A0=C2=A0 bit-mask as a parameter. That's quite over-engineered
> > considering
> > =C2=A0=C2=A0 that each user only ever mapps one, maybe two bars.
> >=20
> > This series:
> > - add a set of new "singular" devres functions that use devres the
> > way
> > =C2=A0 its intended, with one callback per resource.
> > - deprecates the existing iomap-table mechanism.
> > - deprecates the hybrid nature of pci_ functions.
> > - preserves backwards compatibility so that drivers using the
> > existing
> > =C2=A0 API won't notice any changes.
> > - adds documentation, especially some warning users about the
> > =C2=A0 complicated nature of PCI's devres.
>=20
> Instead of adding pcim_intx(), please provide proper one for
> pci_alloc_irq_vectors(). Ideally it would be nice to deprecate
> old IRQ management functions in PCI core and delete them in the
> future.
>=20

In order to deprecate the intermingling with half-managed hyprid devres
in pci.c, you need to have pci_intx() be backwards compatible. Unless
you can remove it at once.
And the least broken way to do that I thought would be pcim_intx(),
because that's consistent with how I make pci_request_region() & Co.
call into their managed counterparts.

There are 25 users of pci_intx().
We'd have to look how many of them call pcim_enable_device() and how
easy they would be to port to... pci_alloc_irq_vectors() you say? I
haven't used that before. Would have to look into it and see how we
could do that.


P.


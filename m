Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5B183019A
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 09:55:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BE7210E614;
	Wed, 17 Jan 2024 08:54:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58F8B10E614
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jan 2024 08:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1705481692;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wHwrTqEmc1fxlYucG9jB9xhIGHRLiNGj+JCOnWyhNcA=;
 b=XbkPSiN5mZEmgHTN9bIbbAjteZOzWNEd/13YhcHlljDS2s79D9T49mV4eDzOGjZTnnwBg2
 uWL1J/8eqwCnXUDwTEkVvbEofGm3eFR5c0+s3C8F7PDryxfvy9k1pYTVOikmqx9AgAD/80
 U3OeTaIglAMacwj8a5IyjoMA/jkgOP0=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-623-Hq84f9GrNBGEHUuV83ZqUQ-1; Wed, 17 Jan 2024 03:54:51 -0500
X-MC-Unique: Hq84f9GrNBGEHUuV83ZqUQ-1
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-78315f4f5c2so193790485a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jan 2024 00:54:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705481691; x=1706086491;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=D00hU3PzeJuPDTbACxnMMgiUCTQ91p211OWtV23tV44=;
 b=vmEkzgio+jC1Qb1+iNw/ytG2yWuquLPJJTiFBYUbzU5avUocR6fdMO+5WoYoV54wLm
 Rt6TaGu6e3NSAcp73hkdStmg+4p4glMBY4VpaIeGDrZfzISixgRGLiPy7qyANU6zp+wW
 4i/pknN6dKxdFuQgO/NhBYHcSQnjta8gzmnpodrsnXf3r2Wjpr0W7zN5jro28MU65Es/
 Q3UUf9OGn8QZpcHIIa+1a1thws9lFw2ZLGriBNqZA9UkoOableHUZm8x9LNw9egeAkHX
 CGKdxCksVfYyII/QpE7+AiM8agahXWQ59iUkLJLZ8sZcdu9nSrdFN0tjxTjPk9/yal07
 2KAw==
X-Gm-Message-State: AOJu0YzAMe+N8stdOZXq2LGfMBN0QFgjOwzCuvGftsbf1zRWmO3qfsFr
 gbMtqS2taVCuqYvoWbJ60GJJ8qVLQ9qF61cINL7Z4GbWFN+/gcFMGC1uh8LDNLlKzutPtNj5oio
 ctA4OcJiW3MYu1Vnz7ZlMr/uUnc8Pzfo1hmus
X-Received: by 2002:a05:620a:8019:b0:783:68ab:9ade with SMTP id
 ee25-20020a05620a801900b0078368ab9ademr1389365qkb.7.1705481690794; 
 Wed, 17 Jan 2024 00:54:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH/PfPCNwITnjUQYv8Uu8hwD3Ulky89OHnA+85OkcfyY06xXLEGkkaNflyvHvodm12ON4wvqw==
X-Received: by 2002:a05:620a:8019:b0:783:68ab:9ade with SMTP id
 ee25-20020a05620a801900b0078368ab9ademr1389343qkb.7.1705481690454; 
 Wed, 17 Jan 2024 00:54:50 -0800 (PST)
Received: from pstanner-thinkpadt14sgen1.remote.csb
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 vr28-20020a05620a55bc00b0078199077d0asm4355821qkn.125.2024.01.17.00.54.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jan 2024 00:54:50 -0800 (PST)
Message-ID: <1983517bf5d0c98894a7d40fbec353ad75160cb4.camel@redhat.com>
Subject: Re: [PATCH 01/10] pci: add new set of devres functions
From: Philipp Stanner <pstanner@redhat.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Date: Wed, 17 Jan 2024 09:54:47 +0100
In-Reply-To: <20240116184436.GA101781@bhelgaas>
References: <20240116184436.GA101781@bhelgaas>
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

On Tue, 2024-01-16 at 12:44 -0600, Bjorn Helgaas wrote:
> On Mon, Jan 15, 2024 at 03:46:12PM +0100, Philipp Stanner wrote:
> > PCI's devres API is not extensible to ranged mappings and has
> > bug-provoking features. Improve that by providing better
> > alternatives.
>=20
> I guess "ranged mappings" means a mapping that doesn't cover an
> entire
> BAR?=C2=A0 Maybe there's a way to clarify?

That's what it's supposed to mean, yes.
We could give it the longer title "mappings smaller than the whole BAR"
or something, I guess.


>=20
> > When the original devres API for PCI was implemented, priority was
> > given
> > to the creation of a set of "pural functions" such as
> > pcim_request_regions(). These functions have bit masks as
> > parameters to
> > specify which BARs shall get mapped. Most users, however, only use
> > those
> > to mapp 1-3 BARs.
> > A complete set of "singular functions" does not exist.
>=20
> s/mapp/map/
>=20
> Rewrap to fill 75 columns or add blank lines between paragraphs.=C2=A0
> Also
> below.
>=20
> > As functions mapping / requesting multiple BARs at once have
> > (almost) no
> > mechanism in C to return the resources to the caller of the plural
> > function, the devres API utilizes the iomap-table administrated by
> > the
> > function pcim_iomap_table().
> >=20
> > The entire PCI devres implementation was strongly tied to that
> > table
> > which only allows for mapping whole, complete BARs, as the BAR's
> > index
> > is used as table index. Consequently, it's not possible to, e.g.,
> > have a
> > pcim_iomap_range() function with that mechanism.
> >=20
> > An additional problem is that pci-devres has been ipmlemented in a
> > sort
> > of "hybrid-mode": Some unmanaged functions have managed
> > counterparts
> > (e.g.: pci_iomap() <-> pcim_iomap()), making their managed nature
> > obvious to the programmer. However, the region-request functions in
> > pci.c, prefixed with pci_, behave either managed or unmanaged,
> > depending
> > on whether pci_enable_device() or pcim_enable_device() has been
> > called
> > in advance.
>=20
> s/ipmlemented/implemented/
>=20
> > This hybrid API is confusing and should be more cleanly separated
> > by
> > providing always-managed functions prefixed with pcim_.
> >=20
> > Thus, the existing devres API is not desirable because:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0a) The vast majority of=
 the users of the plural functions
> > only
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ever sets =
a single bit in the bit mask, consequently
> > making
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 them singu=
lar functions anyways.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0b) There is no mechanis=
m to request / iomap only part of a
> > BAR.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0c) The iomap-table mech=
anism is over-engineered,
> > complicated and
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 can by def=
inition not perform bounds checks, thus,
> > provoking
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 memory fau=
lts: pcim_iomap_table(pdev)[42]
>=20
> Not sure what "pcim_iomap_table(pdev)[42]" means.

That function currently is implemented with this prototype:
void __iomem * const *pcim_iomap_table(struct pci_dev *pdev);

And apparently, it's intended to index directly over the function. And
that's how at least part of the users use it indeed.

Here in drivers/crypto/inside-secure/safexcel.c, L.1919 for example:

=09priv->base =3D pcim_iomap_table(pdev)[0];

I've never seen something that wonderful in C ever before, so it's not
surprising that you weren't sure what I mean....

pcim_iomap_table() can not and does not perform any bounds check. If
you do

void __iomem *mappy_map_mapface =3D pcim_iomap_table(pdev)[42];

then it will just return random garbage, or it faults. No -EINVAL or
anything. You won't even get NULL.

That's why this function must die.


>=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0d) region-request funct=
ions being sometimes managed and
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sometimes =
not is bug-provoking.
>=20
> Indent with spaces (not tabs) so it still looks good when "git log"
> adds spaces to indent.
>=20
> > + * Legacy struct storing addresses to whole mapped bars.
>=20
> s/bar/BAR/ (several places).
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* A region spaning an entir=
e bar. */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0PCIM_ADDR_DEVRES_TYPE_REGION=
,
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* A region spaning an entir=
e bar, and a mapping for that
> > whole bar. */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0PCIM_ADDR_DEVRES_TYPE_REGION=
_MAPPING,
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/*
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * A mapping within a bar, e=
ither spaning the whole bar or
> > just a range.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Without a requested regio=
n.
>=20
> s/spaning/spanning/ (several places).
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (start =3D=3D 0 || len =
=3D=3D 0) /* that's an unused BAR. */
>=20
> s/that/That/
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/*
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Ranged mappings don't get=
 added to the legacy-table,
> > since the table
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * only ever keeps track of =
whole BARs.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > +
>=20
> Spurious blank line.


I'll take care of the grammar and spelling stuff in v2.

Thanks,
P.

>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0devres_add(&pdev->dev, res);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return mapping;
> > +}
> > +EXPORT_SYMBOL(pcim_iomap_range);
>=20
> Bjorn
>=20


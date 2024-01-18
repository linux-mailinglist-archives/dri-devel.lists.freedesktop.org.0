Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBEC83150F
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jan 2024 09:48:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 274FB10E700;
	Thu, 18 Jan 2024 08:48:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9417B10E730
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 08:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1705567696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ltIaIxUBro6oL2eI0AXfMlFTo1Ldlp+RYBlQ9XGXzE0=;
 b=QgkTSAyUtZEuUpP6OR7y5khYLViR+gREc3CT3/+25W3bPRiXfz3avM1LypqnCHF3Vr38rh
 l8SptYLHsVrboN5Ug31/6hP8MGb3hQ1RKveM3el19m/wTh3xYKloj/cvE7uzot9cVFGIyp
 EnvsGV7jxWKjRO7h6OZV91+zVO7epYQ=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-55-7QinjyS9MJqbgi7JRZKmtw-1; Thu, 18 Jan 2024 03:48:15 -0500
X-MC-Unique: 7QinjyS9MJqbgi7JRZKmtw-1
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-42989eb8897so26537121cf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 00:48:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705567695; x=1706172495;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ltIaIxUBro6oL2eI0AXfMlFTo1Ldlp+RYBlQ9XGXzE0=;
 b=XzmK/wPEH88gYzPIzRXZnuoIq5AV6fvogPzwlIH0Kd7Cv0aF3mIzGyMViX01csQVpM
 l8qqQHn/G1opo5Rs1jWHuSwAzQvIimGI+6TVcfBqWIW08RvpMBCNN/9xWt7CGqnWibjz
 nxxiA+YLJ+nQgXXN9MlmjLduiM0+O9XuKpPcwkACERGf+fxplWuhyM8vDTgvCiPk1Wgk
 md9RkaqM5GPE5dTG03qZ+VlYIZvXCUZzPqE6ey9K5dPEMzcJQWhRh3pKWTyEOEBo50Uj
 yhXfTonlO8IlVbDW16w5FNsAFLS5CLNBRrPemyKFbtmpEVzAL9vBhKxUCwpVECYPDmGn
 he3g==
X-Gm-Message-State: AOJu0YyqugULYFttduVFA8MfHJ74EdLedK2g9Nxee5IHw000VSjbBZbE
 QON1vebOjqnBu592BWIaQlL3t9zim+i3bI79dllgRkSzEe+Zp9mJqI6XuAmQTysaaQ3dPydkdkZ
 qw2w71mV0rpyW18bzeqHNkhGOLQxyM3ddjRXpOiobOSHXWAz5VpM45Jo6vqy5mPDNLw==
X-Received: by 2002:a05:6214:1d06:b0:681:770f:c4af with SMTP id
 e6-20020a0562141d0600b00681770fc4afmr817248qvd.4.1705567695161; 
 Thu, 18 Jan 2024 00:48:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGwYyFKI5f9OpMo2g4V3YbVYvUl96cU/lr7eBalkvPGWVo3fCzvHHWQMyUh2sMkj4110Mx35g==
X-Received: by 2002:a05:6214:1d06:b0:681:770f:c4af with SMTP id
 e6-20020a0562141d0600b00681770fc4afmr817230qvd.4.1705567694827; 
 Thu, 18 Jan 2024 00:48:14 -0800 (PST)
Received: from pstanner-thinkpadt14sgen1.remote.csb
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 nc2-20020a0562142dc200b0068187c4b5d2sm739366qvb.111.2024.01.18.00.48.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jan 2024 00:48:14 -0800 (PST)
Message-ID: <96f355a41bf42c6a604aec37449d35246395d929.camel@redhat.com>
Subject: Re: [PATCH 00/10] Make PCI's devres API more consistent
From: Philipp Stanner <pstanner@redhat.com>
To: andy.shevchenko@gmail.com
Date: Thu, 18 Jan 2024 09:48:11 +0100
In-Reply-To: <5e760f104c75efe37100cee5a26b7ee3581f03b4.camel@redhat.com>
References: <20240115144655.32046-2-pstanner@redhat.com>
 <ZabyY3csP0y-p7lb@surfacebook.localdomain>
 <5e760f104c75efe37100cee5a26b7ee3581f03b4.camel@redhat.com>
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

On Wed, 2024-01-17 at 10:59 +0100, Philipp Stanner wrote:
> On Tue, 2024-01-16 at 23:17 +0200, andy.shevchenko@gmail.com=C2=A0wrote:
> > Mon, Jan 15, 2024 at 03:46:11PM +0100, Philipp Stanner kirjoitti:

[...]

> >=20
> >=20
> > > PCI's devres API suffers several weaknesses:
> > >=20
> > > 1. There are functions prefixed with pcim_. Those are always
> > > managed
> > > =C2=A0=C2=A0 counterparts to never-managed functions prefixed with pc=
i_ =E2=80=93
> > > or
> > > so one
> > > =C2=A0=C2=A0 would like to think. There are some apparently unmanaged
> > > functions
> > > =C2=A0=C2=A0 (all region-request / release functions, and pci_intx())=
 which
> > > =C2=A0=C2=A0 suddenly become managed once the user has initialized th=
e
> > > device
> > > with
> > > =C2=A0=C2=A0 pcim_enable_device() instead of pci_enable_device(). Thi=
s
> > > "sometimes
> > > =C2=A0=C2=A0 yes, sometimes no" nature of those functions is confusin=
g and
> > > =C2=A0=C2=A0 therefore bug-provoking. In fact, it has already caused =
a bug
> > > in
> > > DRM.
> > > =C2=A0=C2=A0 The last patch in this series fixes that bug.
> > > 2. iomappings: Instead of giving each mapping its own callback,
> > > the
> > > =C2=A0=C2=A0 existing API uses a statically allocated struct tracking=
 one
> > > mapping
> > > =C2=A0=C2=A0 per bar. This is not extensible. Especially, you can't c=
reate
> > > =C2=A0=C2=A0 _ranged_ managed mappings that way, which many drivers w=
ant.
> > > 3. Managed request functions only exist as "plural versions" with
> > > a
> > > =C2=A0=C2=A0 bit-mask as a parameter. That's quite over-engineered
> > > considering
> > > =C2=A0=C2=A0 that each user only ever mapps one, maybe two bars.
> > >=20
> > > This series:
> > > - add a set of new "singular" devres functions that use devres
> > > the
> > > way
> > > =C2=A0 its intended, with one callback per resource.
> > > - deprecates the existing iomap-table mechanism.
> > > - deprecates the hybrid nature of pci_ functions.
> > > - preserves backwards compatibility so that drivers using the
> > > existing
> > > =C2=A0 API won't notice any changes.
> > > - adds documentation, especially some warning users about the
> > > =C2=A0 complicated nature of PCI's devres.
> >=20
> > Instead of adding pcim_intx(), please provide proper one for
> > pci_alloc_irq_vectors(). Ideally it would be nice to deprecate
> > old IRQ management functions in PCI core and delete them in the
> > future.
> >=20
>=20
> In order to deprecate the intermingling with half-managed hyprid
> devres
> in pci.c, you need to have pci_intx() be backwards compatible. Unless
> you can remove it at once.
> And the least broken way to do that I thought would be pcim_intx(),
> because that's consistent with how I make pci_request_region() & Co.
> call into their managed counterparts.
>=20
> There are 25 users of pci_intx().
> We'd have to look how many of them call pcim_enable_device() and how
> easy they would be to port to... pci_alloc_irq_vectors() you say? I
> haven't used that before. Would have to look into it and see how we
> could do that.

Alright, so I thought about that a bit.

So pci_intx() is the old way to do it and you would like to deprecate
it for good. Understood, makes sense

This series, however, is about deprecating PCI's broken devres
implementation =E2=80=93 not about deprecating outdated PCI features in
general.

So I wouldn't like to touch anything here unless cleaning up devres
demands it.
Now the question would be: how can we solve this?

My suggestion would be:
Let's implement pcim_intx(), but only make it visible through
drivers/pci/pci.h. So we won't make it usable for other drivers, don't
EXPORT_SYMBOL() it and basically only have it as a tool to move the
devres-part clearly and cleanly from pci.c to devres.c

Further deprecating old PCI stuff could then be done in a separate
series.

ACK?

P.



>=20
>=20
> P.


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D51479085AB
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 10:09:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78FD610EC7D;
	Fri, 14 Jun 2024 08:09:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="V7EAs5Cb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3398410EC79
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 08:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718352591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zeKU0CVwyRvivWCPaa6lgnVkTh9d9JSpkkiaiX9acpI=;
 b=V7EAs5CbAIyk436WouDKsmnB7k69dvxGMjSCOFmkNsG/5llR22gT7sutXawejNGIUDMJJs
 Dn3GM7vqdbjYrbuWGRM69g4QobqAPFmneUgxzk5M+rkxFKbaZgBvx+pgs1Vff7zZsHTBEG
 P1JSbRS9DC1hIs+0NinkefiHLeagnak=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-110-fBnb2SJFPLmaVhBySu0-4Q-1; Fri, 14 Jun 2024 04:09:50 -0400
X-MC-Unique: fBnb2SJFPLmaVhBySu0-4Q-1
Received: by mail-lj1-f197.google.com with SMTP id
 38308e7fff4ca-2ebf1470cbaso2142721fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 01:09:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718352588; x=1718957388;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zeKU0CVwyRvivWCPaa6lgnVkTh9d9JSpkkiaiX9acpI=;
 b=ddk1Vaz1YiGalfnC6YnQe9pGXGD0FnoMS3X7rCvGYxTCTDoG4Qq4j/UUHebkeLS3Wn
 jPA3f0qq+I7n4wnMMH31uQR+v/hgsdCOdj1ZBwhbk9rsmKi/mzwu0fYTIHqKAhtQoMxq
 zadeP9vOxGSgraHDVP/JJNcvDz8U8Ci/y/1SbVqNt0iyZa35LJoM2gVYXw/bEpnyQ2Mh
 ymw579lEFlr2U5CibnoG0BteR9R0Ok6EvQar2dY5Hzz/8y+prWNl0WgpavqYF9rTme1R
 szKdZChwLBLBDoEtvdP8NFbROU9G70KDeCnekqeODTSAWknvrxJSdwg8aOL2ep+OELPs
 H9mg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgk97JW6SwUOGw3bldshsJlfx0TZjUjsoYsO7xRoj0pik0C8mZWvUo0svU02Uq+/tKid8tbXise9rATPVOthH4hni4c7ZBO6kmrsHEFq2d
X-Gm-Message-State: AOJu0YyQElPgxWlWm1yKwQflo8BNaAt0Rxv7Xm4n4f5F4YuuYQ9gyhy9
 U7la04g2lzqS8d8bST8iVet58woXKGnZ50zBLB8Yowf7XNgijgoyNPT6zK9+i9dCjgN9OEi4vbQ
 4JzwxHGK5VpUK0Pjr7biEgq1mMC2ISZPCfRrQYmKdVrRhVKxLRH5OdZ5fLxnK2Wyu0A==
X-Received: by 2002:a2e:3a04:0:b0:2ec:170e:5b24 with SMTP id
 38308e7fff4ca-2ec170e5bdemr5016231fa.4.1718352588581; 
 Fri, 14 Jun 2024 01:09:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEojhkGc53mNCU+E2IN7hi4HmtzQJ53jr3VJgck+QTx6Sd1w0/sVXdy0S6H013pzAwYnFikhQ==
X-Received: by 2002:a2e:3a04:0:b0:2ec:170e:5b24 with SMTP id
 38308e7fff4ca-2ec170e5bdemr5016131fa.4.1718352588163; 
 Fri, 14 Jun 2024 01:09:48 -0700 (PDT)
Received: from pstanner-thinkpadt14sgen1.remote.csb
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422f602e0c2sm50049225e9.14.2024.06.14.01.09.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jun 2024 01:09:47 -0700 (PDT)
Message-ID: <5d38858130e129fd3568e97d466a4b905e864f8f.camel@redhat.com>
Subject: Re: [PATCH v9 10/13] PCI: Give pci_intx() its own devres callback
From: Philipp Stanner <pstanner@redhat.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>, Sam
 Ravnborg <sam@ravnborg.org>, dakr@redhat.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-pci@vger.kernel.org
Date: Fri, 14 Jun 2024 10:09:46 +0200
In-Reply-To: <20240613210614.GA1081813@bhelgaas>
References: <20240613210614.GA1081813@bhelgaas>
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

On Thu, 2024-06-13 at 16:06 -0500, Bjorn Helgaas wrote:
> On Thu, Jun 13, 2024 at 01:50:23PM +0200, Philipp Stanner wrote:
> > pci_intx() is one of the functions that have "hybrid mode" (i.e.,
> > sometimes managed, sometimes not). Providing a separate pcim_intx()
> > function with its own device resource and cleanup callback allows
> > for
> > removing further large parts of the legacy PCI devres
> > implementation.
> >=20
> > As in the region-request-functions, pci_intx() has to call into its
> > managed counterpart for backwards compatibility.
> >=20
> > As pci_intx() is an outdated function, pcim_intx() shall not be
> > made
> > visible to drivers via a public API.
>=20
> What makes pci_intx() outdated?=C2=A0 If it's outdated, we should mention
> why and what the 30+ callers (including a couple in drivers/pci/)
> should use instead.

That is 100% based on Andy Shevchenko's (+CC) statement back from
January 2024 a.D. [1]

Apparently INTx is "old IRQ management" and should be done through
pci_alloc_irq_vectors() nowadays.


[1] https://lore.kernel.org/all/ZabyY3csP0y-p7lb@surfacebook.localdomain/


P.


>=20
> Bjorn
>=20


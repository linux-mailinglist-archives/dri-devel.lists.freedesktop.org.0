Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A07B5AB0D3A
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 10:37:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 144E610E3CE;
	Fri,  9 May 2025 08:37:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="AwTYapvb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B73C10E3CE
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 08:36:55 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4Zv2RR4fPMz9sv3;
 Fri,  9 May 2025 10:36:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1746779811; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jYQoJcACfY1pkP1CNoxq+CRMf69D5FZadKRYDpnPPJE=;
 b=AwTYapvbHm/b+X/4Q9PibHhnW/TC2uHpFba10VXlHBivD7eGIlRKCV3AbIWUa3HQqHaqUE
 M2mzrPFl7PEDzqCILSYCa9efFHesk19cFMLBwDD2w4z8DA1BfyO5V/tnfZsKIzLteQ44Gh
 msiI8yLDtcolaWGqPQUqeVGY39+/D9M1ZfNyCIG31s0ueJFRXRtlolM6GuF2ZlBkL1DWn4
 IxNVIeZ5wXZ7xuJmwsOcInbcET/KFQw1yeSZLqmu9oM0+9OpqhJj2bLK6mfjNnL1h4OJBU
 2OVKye4fTfE2gTPmlKTbCEXcANC7QEFaRNKV6kiywM49hOGJ32LKBfHCms136A==
Message-ID: <e7c45c099f8981257866396e01a91df1afcfbf97.camel@mailbox.org>
Subject: Re: [PATCH] drm/cirrus: Use non-hybrid PCI devres API
From: Philipp Stanner <phasta@mailbox.org>
To: Javier Martinez Canillas <javierm@redhat.com>, Philipp Stanner
 <phasta@kernel.org>, Dave Airlie <airlied@redhat.com>, Gerd Hoffmann
 <kraxel@redhat.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,  Simona Vetter
 <simona@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, Arnd Bergmann
 <arnd@kernel.org>,  Jani Nikula <jani.nikula@intel.com>, Niklas Schnelle
 <schnelle@linux.ibm.com>, Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: virtualization@lists.linux.dev, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Date: Fri, 09 May 2025 10:36:45 +0200
In-Reply-To: <87a57ns7oh.fsf@minerva.mail-host-address-is-not-set>
References: <20250417094009.29297-2-phasta@kernel.org>
 <87frhzc1a9.fsf@minerva.mail-host-address-is-not-set>
 <6d46103afab9fc8e843e5681226f7db34a4ca57d.camel@mailbox.org>
 <87a57ns7oh.fsf@minerva.mail-host-address-is-not-set>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: f4a829c0b291a1defb1
X-MBO-RS-META: 5exj8gn6cgaf58j51wyo13t5h4szd67n
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
Reply-To: phasta@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2025-05-08 at 12:44 +0200, Javier Martinez Canillas wrote:
> Philipp Stanner <phasta@mailbox.org> writes:
>=20
> Hello Philipp,
>=20
> > On Tue, 2025-04-22 at 23:51 +0200, Javier Martinez Canillas wrote:
> > > Philipp Stanner <phasta@kernel.org> writes:
> > >=20
> > > Hello Philipp,
> > >=20
> > > > cirrus enables its PCI device with pcim_enable_device(). This,
> > > > implicitly, switches the function pci_request_regions() into
> > > > managed
> > > > mode, where it becomes a devres function.
> > > >=20
> > > > The PCI subsystem wants to remove this hybrid nature from its
> > > > interfaces. To do so, users of the aforementioned combination
> > > > of
> > > > functions must be ported to non-hybrid functions.
> > > >=20
> > > > Replace the call to sometimes-managed pci_request_regions()
> > > > with
> > > > one to
> > > > the always-managed pcim_request_all_regions().
> > > >=20
> > > > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > > > ---
> > >=20
> > > Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> > >=20
> >=20
> > Who's in charge of applying this? Any objections with me just
> > putting
> > it into drm-misc-next?
> >=20
>=20
> Sure, go ahead.

Applied, thx

>=20
> > P.
> >=20
>=20


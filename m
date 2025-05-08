Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E06DAAF812
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 12:38:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 633E410E00E;
	Thu,  8 May 2025 10:38:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="ayrMChE5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8147310E00E
 for <dri-devel@lists.freedesktop.org>; Thu,  8 May 2025 10:38:33 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4ZtTBD5WXcz9t8J;
 Thu,  8 May 2025 12:38:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1746700708; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AVxwamcYava5lHCm6Qh9yjmfXpxlW465v9ROitrFuKI=;
 b=ayrMChE5XdfDfYf1cfl3RZbSg/culTQ8pB1fMNV3jNoIuXZLlegP7GUMqrhCsvXg+6BLKs
 i8IM9X9YuC04X24Zi2QTKkpoYVHZJ39KD3t9qvLxTBiElFt0oA1dkqHULcuuwTCKycBDbB
 sfXGFKtyQ7Y7GVf2dvlJb53kQ1AHL2GjaYaID0hiLAtkKtR7NKZn2Pu4eESk3GZrjUnvum
 Mk/BPt66RSKSKCE+i6pH/sIIwnq7Ir6H6lEOJTCOWpujkKrc2oxGdXQGLJl0DWvShfMF53
 y8ERh2UyjuDfHo1A4O0z+hPGoIVuhUfhY7AScYqeaJTjnTHD5XNKpEzSKdB3Ow==
Message-ID: <6d46103afab9fc8e843e5681226f7db34a4ca57d.camel@mailbox.org>
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
Date: Thu, 08 May 2025 12:38:20 +0200
In-Reply-To: <87frhzc1a9.fsf@minerva.mail-host-address-is-not-set>
References: <20250417094009.29297-2-phasta@kernel.org>
 <87frhzc1a9.fsf@minerva.mail-host-address-is-not-set>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: 95gcigcooksuqbomehep45nhjaz56pkg
X-MBO-RS-ID: bc6ee78d190767a69aa
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

On Tue, 2025-04-22 at 23:51 +0200, Javier Martinez Canillas wrote:
> Philipp Stanner <phasta@kernel.org> writes:
>=20
> Hello Philipp,
>=20
> > cirrus enables its PCI device with pcim_enable_device(). This,
> > implicitly, switches the function pci_request_regions() into
> > managed
> > mode, where it becomes a devres function.
> >=20
> > The PCI subsystem wants to remove this hybrid nature from its
> > interfaces. To do so, users of the aforementioned combination of
> > functions must be ported to non-hybrid functions.
> >=20
> > Replace the call to sometimes-managed pci_request_regions() with
> > one to
> > the always-managed pcim_request_all_regions().
> >=20
> > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > ---
>=20
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
>=20

Who's in charge of applying this? Any objections with me just putting
it into drm-misc-next?

P.

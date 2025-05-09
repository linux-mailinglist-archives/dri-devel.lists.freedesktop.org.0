Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F551AB0ED1
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 11:23:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8D9B10E9E6;
	Fri,  9 May 2025 09:23:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="lGv0sx9R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D421310E9E6
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 09:23:25 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4Zv3T62yvvz9sPv;
 Fri,  9 May 2025 11:23:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1746782602; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ag5tG00Nd+jJRRq7/gzvtwWW+WAHRV2sFjjJsI/AF94=;
 b=lGv0sx9RQkNMYsHJWgut0rOhogf1/lLNGxETgmHZv0ux9zR4PPEHwlPPltEGyn99R1KSoM
 ViFlDC7tFmkjZd8eBAf87v5UW2COzxoF9wmNN2hA4O1m4NZFi1RD74ON5wfOisNn1woeqt
 Z9zK8H41cGX9jT4+ofQP7d/sfmlXVX+fbWgvTmLCfRssXA8dZObP0fn6ptHT077LAPM/MM
 UWdHbgKipN760+qPs8zMBeHDZRZrNS1izvcOA1l2aelu3TlfOP7YpfhUv6QuU1UhUyKkpr
 Oln+1U/pwRp2hr4ClM6RRb7n39XSNGlJ452640m8PAIowt+OozkpIW/Z9v6NQw==
Message-ID: <a696aeba34894aaca4893f9adc6fa137d04b6c9e.camel@mailbox.org>
Subject: Re: [PATCH v2] drm/vmgfx: Use non-hybrid PCI devres API
From: Philipp Stanner <phasta@mailbox.org>
To: Zack Rusin <zack.rusin@broadcom.com>, phasta@kernel.org
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,  dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Date: Fri, 09 May 2025 11:23:18 +0200
In-Reply-To: <CABQX2QP1U6nUc++5oZf0KVpfXCEMRwX9u0ykq2YNHuQSKx909Q@mail.gmail.com>
References: <20250423120643.66814-2-phasta@kernel.org>
 <e40cf04283e281e2d4a912ff75bce3c6cb8bcf97.camel@mailbox.org>
 <CABQX2QP1U6nUc++5oZf0KVpfXCEMRwX9u0ykq2YNHuQSKx909Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: di6kykp7zde413b4e3sounqozm3sm5ro
X-MBO-RS-ID: 76bcd7afd41cbb0191a
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

On Thu, 2025-05-08 at 11:39 -0400, Zack Rusin wrote:
> On Thu, May 8, 2025 at 6:40=E2=80=AFAM Philipp Stanner <phasta@mailbox.or=
g>
> wrote:
> >=20
> > On Wed, 2025-04-23 at 14:06 +0200, Philipp Stanner wrote:
> > > vmgfx enables its PCI device with pcim_enable_device(). This,
> > > implicitly, switches the function pci_request_regions() into
> > > managed
> > > mode, where it becomes a devres function.
> > >=20
> > > The PCI subsystem wants to remove this hybrid nature from its
> > > interfaces. To do so, users of the aforementioned combination of
> > > functions must be ported to non-hybrid functions.
> > >=20
> > > Moreover, since both functions are already managed in this
> > > driver,
> > > the
> > > calls to pci_release_regions() are unnecessary.
> > >=20
> > > Remove the calls to pci_release_regions().
> > >=20
> > > Replace the call to sometimes-managed pci_request_regions() with
> > > one
> > > to
> > > the always-managed pcim_request_all_regions().
> > >=20
> > > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> >=20
> > *PING*
>=20
> Thanks, that looks great. I missed it because the driver's name is
> vmwgfx. I'd be happy to fix the subject for you while pushing this to
> drm-misc-fixes,

But, I don't think that this is a bug. It's just a bit ugly and this
patch performs cleanup work, but all the code behaves as intended,
without leaks or stuff like that.

Thus, I think it should go to drm-misc-next instead of drm-misc-fixes.

Regards

>  if you're ok with it of course. Otherwise:
> Reviewed-by: Zack Rusin <zack.rusin@broadcom.com>
>=20
> z


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D138298696F
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 01:22:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B1F910E21F;
	Wed, 25 Sep 2024 23:21:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=steffen.cc header.i=@steffen.cc header.b="m5qm48j9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAF9410E08D
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 07:54:27 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4XD8Bm35cZz9v4R;
 Wed, 25 Sep 2024 09:54:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=steffen.cc; s=MBO0001; 
 t=1727250864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ssNsTClmvzZGt7dAiZekgw2sOzzp7SvRTXHsAhVGRrA=;
 b=m5qm48j9NVXvUlqcaEFs1InzyvnLErovyyiYxbLOJMvGrhSi+Ygblqlpzo+flUkc1qaD4N
 O5hPCIPNN2DZJl86hgyWD85IIWtRn5vGbI11Fst2wK+CDFQCD+MDz5iRfoDaYBTfjrcbTF
 aZ6+IV31xFHYV/qT5tCD5gM7DnE/WQ6zB7FQ9xuscjBVpumfzhiJgb1ESidwnl2m7NBQmA
 pRlgWpywZi0EfdSAfxYoR+5+r32bG+R2xnpTLwLtEVwdDZwVmfJ63mITK9obBQ+4/9KmHP
 IFAGHcxINj1MkpH0keea3NMDUtaGg7ZJuKCvNx61YJh/0k0N2bfp6UhR7VM2Wg==
Message-ID: <e4626c1d3b28613d1d219c735bcd8525be0f0d9e.camel@dirkwinkel.cc>
Subject: Re: [PATCH] drm: xlnx: zynqmp_dpsub: also call
 drm_helper_hpd_irq_event
From: Steffen Dirkwinkel <lists@steffen.cc>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Michal Simek <michal.simek@amd.com>,
 linux-arm-kernel@lists.infradead.org, 	linux-kernel@vger.kernel.org
Date: Wed, 25 Sep 2024 09:54:18 +0200
In-Reply-To: <20240924184335.GJ30551@pendragon.ideasonboard.com>
References: <20240923074803.10306-1-lists@steffen.cc>
 <20240924184335.GJ30551@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 25 Sep 2024 23:21:53 +0000
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

Hi Laurent,

On Tue, 2024-09-24 at 21:43 +0300, Laurent Pinchart wrote:
> Hi Steffen,
>=20
> Thank you for the patch.
>=20
> On Mon, Sep 23, 2024 at 09:48:03AM +0200, lists@steffen.cc=C2=A0wrote:
> > From: Steffen Dirkwinkel <s.dirkwinkel@beckhoff.com>
> >=20
> > With hpd going through the bridge as of commit eb2d64bfcc17
> > ("drm: xlnx: zynqmp_dpsub: Report HPD through the bridge")
> > we don't get hotplug events in userspace on zynqmp hardware.
> > Also sending hotplug events with drm_helper_hpd_irq_event works.
>=20
> Why does the driver need to call both drm_helper_hpd_irq_event() and
> drm_bridge_hpd_notify() ? The latter should end up calling
> drm_kms_helper_connector_hotplug_event(), which is the same function
> that drm_helper_hpd_irq_event() calls.

I don't know why we need drm_helper_hpd_irq_event.
I'll try to trace what happens on hotplug.

>=20
> > Fixes: eb2d64bfcc17 ("drm: xlnx: zynqmp_dpsub: Report HPD through
> > the bridge")
> > Signed-off-by: Steffen Dirkwinkel <s.dirkwinkel@beckhoff.com>
> > ---
> > =C2=A0drivers/gpu/drm/xlnx/zynqmp_dp.c | 4 ++++
> > =C2=A01 file changed, 4 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > index 1846c4971fd8..cb823540a412 100644
> > --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > @@ -17,6 +17,7 @@
> > =C2=A0#include <drm/drm_fourcc.h>
> > =C2=A0#include <drm/drm_modes.h>
> > =C2=A0#include <drm/drm_of.h>
> > +#include <drm/drm_probe_helper.h>
> > =C2=A0
> > =C2=A0#include <linux/clk.h>
> > =C2=A0#include <linux/delay.h>
> > @@ -1614,6 +1615,9 @@ static void zynqmp_dp_hpd_work_func(struct
> > work_struct *work)
> > =C2=A0					=C2=A0=C2=A0=C2=A0 hpd_work.work);
> > =C2=A0	enum drm_connector_status status;
> > =C2=A0
> > +	if (dp->bridge.dev)
> > +		drm_helper_hpd_irq_event(dp->bridge.dev);
> > +
> > =C2=A0	status =3D zynqmp_dp_bridge_detect(&dp->bridge);
> > =C2=A0	drm_bridge_hpd_notify(&dp->bridge, status);
> > =C2=A0}
>=20


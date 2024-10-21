Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4419A92FB
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 00:08:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C713110E5AF;
	Mon, 21 Oct 2024 22:08:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=steffen.cc header.i=@steffen.cc header.b="VeZYwkru";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D42C10E4F9
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 13:17:05 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4XXG7216DGz9sp9;
 Mon, 21 Oct 2024 15:17:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=steffen.cc; s=MBO0001; 
 t=1729516622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IaWaSwQGnO3BcDxL4RgpYERLplukMDpUZorLpHSytoA=;
 b=VeZYwkruiUGI6mK4kENVuFEvdPPDgom6IfNj60oCtPc9/pYY0TW7N/ngpp4GPeQnUY2TfN
 GuB6THLg3/6XnvxsoENrd7ZJAP/I/uXzC391srye2IfsxBxxO15jWKG5QdUE4XGAMvT8ZS
 RKMBx13Yxm49QiKblP1GDIdJcdeQFIGbuYuaDxTKkzkKQ+upKI0TD1UOUyJ720R91VRYZh
 XsgIDqepAx0BApg39cHuvS17Oh6mBRwgqxAOaaWgG1giZMOOecKD99Gb9MWvY+tBDUGyG8
 aREszHa4YAv0vymd03lNERnE55jmZEtvmkqYPShSTpuTbE6Odnrc/KjI/hdd4A==
Message-ID: <ba9b5233b980016293a104b764e73bbcdc4246d8.camel@dirkwinkel.cc>
Subject: Re: [PATCH] drm: xlnx: zynqmp_dpsub: also call
 drm_helper_hpd_irq_event
From: Steffen Dirkwinkel <"Steffen Dirkwinkel <lists"@steffen.cc>,>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 dri-devel@lists.freedesktop.org, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Michal Simek <michal.simek@amd.com>,
 linux-arm-kernel@lists.infradead.org, 	linux-kernel@vger.kernel.org
Date: Mon, 21 Oct 2024 15:16:58 +0200
In-Reply-To: <yc43bbhfcc6nnrgxke2khkgcxxpt7mne2vmrggpkkc7gdwet4e@prpfb2wpgs66>
References: <20240923074803.10306-1-lists@steffen.cc>
 <20240924184335.GJ30551@pendragon.ideasonboard.com>
 <e4626c1d3b28613d1d219c735bcd8525be0f0d9e.camel@dirkwinkel.cc>
 <20240925163609.GD27666@pendragon.ideasonboard.com>
 <6cea659387e14f0436105053416a42c4729923b3.camel@dirkwinkel.cc>
 <yc43bbhfcc6nnrgxke2khkgcxxpt7mne2vmrggpkkc7gdwet4e@prpfb2wpgs66>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 47e8a163924a1abfcf1
X-MBO-RS-META: 7wutk4yn96bnq1d7muxio3ushndpdfum
X-Mailman-Approved-At: Mon, 21 Oct 2024 22:07:41 +0000
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

On Sat, 2024-10-19 at 18:11 +0300, Dmitry Baryshkov wrote:
> On Wed, Oct 09, 2024 at 04:28:26PM +0200, Steffen Dirkwinkel wrote:
> > Hi Laurent,
> >=20
> >=20
> > On Wed, 2024-09-25 at 19:36 +0300, Laurent Pinchart wrote:
> > > Hi Steffen,
> > >=20
> > > On Wed, Sep 25, 2024 at 09:54:18AM +0200, Steffen Dirkwinkel
> > > wrote:
> > > > On Tue, 2024-09-24 at 21:43 +0300, Laurent Pinchart wrote:
> > > > > On Mon, Sep 23, 2024 at 09:48:03AM +0200,
> > > > > lists@steffen.cc=C2=A0wrote:
> > > > > > From: Steffen Dirkwinkel <s.dirkwinkel@beckhoff.com>
> > > > > >=20
> > > > > > With hpd going through the bridge as of commit eb2d64bfcc17
> > > > > > ("drm: xlnx: zynqmp_dpsub: Report HPD through the bridge")
> > > > > > we don't get hotplug events in userspace on zynqmp
> > > > > > hardware.
> > > > > > Also sending hotplug events with drm_helper_hpd_irq_event
> > > > > > works.
> > > > >=20
> > > > > Why does the driver need to call both
> > > > > drm_helper_hpd_irq_event()
> > > > > and
> > > > > drm_bridge_hpd_notify() ? The latter should end up calling
> > > > > drm_kms_helper_connector_hotplug_event(), which is the same
> > > > > function
> > > > > that drm_helper_hpd_irq_event() calls.
> > > >=20
> > > > I don't know why we need drm_helper_hpd_irq_event.
> > > > I'll try to trace what happens on hotplug.
> > >=20
> > > Thank you. Let's try to find the best solution based on your
> > > findings.
> >=20
> > There's just nothing registering for hpd with
> > "drm_bridge_connector_enable_hpd" or "drm_bridge_hpd_enable". I'm
> > not
> > sure what the correct way to implement this is. In
> > "drivers/gpu/drm/bridge/ti-tfp410.c" the driver registers for the
> > callback and calls "drm_helper_hpd_irq_event" in the callback. I
> > guess
> > we could also do that, but then we might as well call
> > drm_helper_hpd_irq_event directly? Some other drivers just call
> > both
> > like I did here. (drivers/gpu/drm/mediatek/mtk_hdmi.c for example)
> > For "drivers/gpu/drm/msm/hdmi/hdmi_bridge.c" I also can't find the
> > hpd
> > enable call and it just calls drm_bridge_hpd_notify.
>=20
> The drm_bridge_connector handles enabling it for you when the driver
> calls drm_kms_helper_poll_init() / drm_kms_helper_poll_enable(). It
> seems zynqmp_kms calls drm_kms_helper_poll_init() too early, before
> creating DP chain, so the HPD doesn't get enabled.
Yes, that's it. Thank you

I'll send a patch for it.


>=20
> >=20
> > >=20
> > > > > > Fixes: eb2d64bfcc17 ("drm: xlnx: zynqmp_dpsub: Report HPD
> > > > > > through
> > > > > > the bridge")
> > > > > > Signed-off-by: Steffen Dirkwinkel
> > > > > > <s.dirkwinkel@beckhoff.com>
> > > > > > ---
> > > > > > =C2=A0drivers/gpu/drm/xlnx/zynqmp_dp.c | 4 ++++
> > > > > > =C2=A01 file changed, 4 insertions(+)
> > > > > >=20
> > > > > > diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > > > > > b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > > > > > index 1846c4971fd8..cb823540a412 100644
> > > > > > --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > > > > > +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > > > > > @@ -17,6 +17,7 @@
> > > > > > =C2=A0#include <drm/drm_fourcc.h>
> > > > > > =C2=A0#include <drm/drm_modes.h>
> > > > > > =C2=A0#include <drm/drm_of.h>
> > > > > > +#include <drm/drm_probe_helper.h>
> > > > > > =C2=A0
> > > > > > =C2=A0#include <linux/clk.h>
> > > > > > =C2=A0#include <linux/delay.h>
> > > > > > @@ -1614,6 +1615,9 @@ static void
> > > > > > zynqmp_dp_hpd_work_func(struct
> > > > > > work_struct *work)
> > > > > > =C2=A0					=C2=A0=C2=A0=C2=A0
> > > > > > hpd_work.work);
> > > > > > =C2=A0	enum drm_connector_status status;
> > > > > > =C2=A0
> > > > > > +	if (dp->bridge.dev)
> > > > > > +		drm_helper_hpd_irq_event(dp->bridge.dev);
> > > > > > +
> > > > > > =C2=A0	status =3D zynqmp_dp_bridge_detect(&dp->bridge);
> > > > > > =C2=A0	drm_bridge_hpd_notify(&dp->bridge, status);
> > > > > > =C2=A0}
> > >=20
> >=20
>=20


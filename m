Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6172B7A9A
	for <lists+dri-devel@lfdr.de>; Wed, 18 Nov 2020 10:47:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 684F489C7F;
	Wed, 18 Nov 2020 09:47:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 64462 seconds by postgrey-1.36 at gabe;
 Wed, 18 Nov 2020 09:47:35 UTC
Received: from de-out1.bosch-org.com (de-out1.bosch-org.com [139.15.230.186])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3483C89C7F
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 09:47:35 +0000 (UTC)
Received: from si0vm1948.rbesz01.com
 (lb41g3-ha-dmz-psi-sl1-mailout.fe.ssn.bosch.com [139.15.230.188])
 by si0vms0217.rbdmz01.com (Postfix) with ESMTPS id 4CbdJj0V4Lz4f3lwy;
 Wed, 18 Nov 2020 10:47:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=de.bosch.com;
 s=key2-intmail; t=1605692853;
 bh=+ZtmImHbO2np+GXZw0lIRqvjeiTwqnhZNRUCHLn+6K8=; l=10;
 h=From:Subject:From:Reply-To:Sender;
 b=D+bAcqiGYT1YLNx26LS+l5KVeeECkPtjtFznzVUINFSag2IsYuaXP7/fPymGru5hM
 KcgDaQhFFlSilLYEeQJO2DyYmU6O3uYcirxNAW7ndHuKtY6a8J4vdeJX9rLA2mX+xu
 N93C1f3Lu2PQmgoIEkvw3R04c7RCjzo+x3GiUuWc=
Received: from fe0vm1741.rbesz01.com (unknown [10.58.172.176])
 by si0vm1948.rbesz01.com (Postfix) with ESMTPS id 4CbdJj05Nbz7r6;
 Wed, 18 Nov 2020 10:47:33 +0100 (CET)
X-AuditID: 0a3aad15-fb3ff700000022e8-e4-5fb4edb4be2d
Received: from si0vm1950.rbesz01.com ( [10.58.173.29])
 (using TLS with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by fe0vm1741.rbesz01.com (SMG Outbound) with SMTP id FA.BF.08936.4BDE4BF5;
 Wed, 18 Nov 2020 10:47:32 +0100 (CET)
Received: from FE-MBX2050.de.bosch.com (fe-mbx2050.de.bosch.com [10.3.231.60])
 by si0vm1950.rbesz01.com (Postfix) with ESMTPS id 4CbdJh68FZzW7P;
 Wed, 18 Nov 2020 10:47:32 +0100 (CET)
Received: from FE-MBX2051.de.bosch.com (10.3.231.61) by
 FE-MBX2050.de.bosch.com (10.3.231.60) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Wed, 18 Nov 2020 10:47:32 +0100
Received: from FE-MBX2051.de.bosch.com ([fe80::9402:faf1:5852:4e2f]) by
 FE-MBX2051.de.bosch.com ([fe80::9402:faf1:5852:4e2f%6]) with mapi id
 15.01.2106.004; Wed, 18 Nov 2020 10:47:32 +0100
From: "Jonas Mark (BT-FIR/ENG1-Grb)" <Mark.Jonas@de.bosch.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>
Subject: AW: [PATCH] drm: imx: Move fbdev setup to before output polling
Thread-Topic: [PATCH] drm: imx: Move fbdev setup to before output polling
Thread-Index: AQHWvPnAfxZE9kwfn0Gz111spU5g9qnNecSAgAAN4oCAAAOfAIAAEkZQ
Date: Wed, 18 Nov 2020 09:47:32 +0000
Message-ID: <38c2d92ac5f04a228e55af43a12a4bd7@de.bosch.com>
References: <20201117155229.9837-1-mark.jonas@de.bosch.com>
 <e089d4d5-3bd8-c2cd-3011-ed87ae4284e8@suse.de>
 <CAKMK7uEpEt4w4kVJLOd2Yw1MnsrCn-NMgT4TjcxROpZBa_xvYg@mail.gmail.com>
 <68af913c-9f4e-73b5-a2cb-8692902a2847@suse.de>
In-Reply-To: <68af913c-9f4e-73b5-a2cb-8692902a2847@suse.de>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.141.163.207]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrHIsWRmVeSWpSXmKPExsXCZbVWVnfL2y3xBj+WW1r0njvJZPF/20Rm
 iytf37NZrJq6k8Vi0+NrrBZdv1YyW1zeNYfN4u/2TSwWL7aIW2x5M5HVgctj77cFLB6bVnWy
 eWz/9oDV4373cSaPzUvqPTa+28Hk0f/XwGPz6WqPz5vkAjijuGxSUnMyy1KL9O0SuDK2b/3D
 VnBPpaLhwx32BsYnyl2MnBwSAiYSUzdcZe9i5OIQEpjOJHHpdCcbhLOLUWLC90YWkCohgbeM
 EnM6lCHsA4wSCy5zgdhsAnYS+1+/YQKxRQR8JFZNvg02iVngMbPEptMPwRLCAh4ST1+cZYEo
 8pR4N/c5G4TtJrF9AUQNi4CqxJMv99hBbF4Ba4mHPc1MEFc8YZS4+GY/WAMnUKLp+mdGEJtR
 QFZiw4bzzCA2s4C4xKZn31kh/hGQWLIHIi4hICrx8vE/qLiSxIn374AWcADVa0qs36UP0aoo
 MaX7IdReQYmTM5+wTGAUn4Vk6iyEjllIOmYh6VjAyLKKUTQt1aAs19DcxFCvKCm1uMrAUC85
 P3cTIyTKRXcw3un+oHeIkYmD8RCjBAezkgivi8nGeCHelMTKqtSi/Pii0pzU4kOM0hwsSuK8
 Kjwb44QE0hNLUrNTUwtSi2CyTBycUg1MMzyiOHMf+xamvM6/qfVXU1VTVG/pmy89TuJysy5Y
 8tmm9zz/fbZvRcm8HSeNfr922f9i4lufU83lpQpKy7M3uTnKn2DOu2J/6tmdNc8T9QXW//lT
 McN9ar9Z8FPe+ZJMV3qX1LfG/xHmyM/SVc2ak1ycON17c2y556vtjTd+tbS5rv+eVPrWe8Gh
 1IZdjSEeD8+ztnbJbWGJk5J2/ft6kmncttKlu5iLvshs6X6Z0mTz1n6ysqpog79TQW1tSunj
 knlH3ZjPFu8N0vQ13/4yg6eyQ0nsl37GPs2Pdz7Mst9ePM3XpeXQEtfzFoKBRXcnlz3Uj5Xw
 LHYpurZVjOWJpE15lzNvi5HB6QMfapVYijMSDbWYi4oTAStyvnVhAwAA
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
Cc: "RUAN Tingquan \(BT-FIR/ENG1-Zhu\)" <Tingquan.Ruan@cn.bosch.com>,
 David Airlie <airlied@linux.ie>,
 "Jonas Mark \(BT-FIR/ENG1-Grb\)" <Mark.Jonas@de.bosch.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn
 Guo <shawnguo@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas and Daniel,

Thank you very much for your feedback. We appreciate it.

> >>> diff --git a/drivers/gpu/drm/imx/imx-drm-core.c
> >>> b/drivers/gpu/drm/imx/imx-drm-core.c
> >>> index 9bf5ad6d18a2..2665040e11c7 100644
> >>> --- a/drivers/gpu/drm/imx/imx-drm-core.c
> >>> +++ b/drivers/gpu/drm/imx/imx-drm-core.c
> >>> @@ -240,14 +240,18 @@ static int imx_drm_bind(struct device *dev)
> >>>                legacyfb_depth = 16;
> >>>        }
> >>>
> >>> +     /*
> >>> +      * The generic fbdev has to be setup before enabling output polling.
> >>> +      * Otherwise the fbdev client is not ready to handle delayed events.
> >>> +      */
> >>> +     drm_fbdev_generic_setup(drm, legacyfb_depth);
> >>> +
> >>>        drm_kms_helper_poll_init(drm);
> >>>
> >>>        ret = drm_dev_register(drm, 0);
> >>>        if (ret)
> >>>                goto err_poll_fini;
> >>>
> >>> -     drm_fbdev_generic_setup(drm, legacyfb_depth);
> >>> -
> >>
> >> This does not work well. fbdev is supposed to be another regular DRM
> >> client. It has to be enabled after registering the DRM device.
> >>
> >> I'd rather improve fbdev or the driver to handle this gracefully.
> >
> > Yeah I'm not understanding the point here. Once fbcon is running, you
> > have a screen. Any fbdev userspace client  also should do a modeset
> > first. And if they dont and it's expected uapi for fbdev chardev that
> > the display boots up enabled, then we need to fix that in the fbdev
> > helpers, not through clever reordering in drivers so that a
> > side-effect causes a modeset.
> >
> > Note that this is a bit tricky since fbdev shouldn't take over the
> > screen by default, so we'd need to delay this until first open of
> > /dev/fb0. And we should probably also delay the hotplug handling until
> > the first open. fbcon also fake-opens the fbdev file, so it's the same
> > code path.
> 
> As far as I understand the commit message, the problem is that the display
> blanks out after registering the driver. And fbdev somewhat mitigates this by
> doing an early modeset. Users with fbdev disabled (most of them in
> embedded, I guess) would still run into the issue until userspace makes a
> modeset.
> 
> Mark, if that's the case, an option might be to pick up the device settings
> instead of calling drm_mode_config_reset(). The driver would then continue
> to display whatever is on the screen.

We are started using fbdev in our embedded application with Linux 3.10, later
updated to 4.14 and are now in the process of updating to 5.4. So far the uapi
appeared to us as if we could rely on an already enabled fbdev. That is, none
of our applications does a modeset.

When switching to 5.4 we noticed that the fbdev uapi changed. That is, the
LCD is switched off until it is explicitly enabled. It could be enabled by
writing to /sys/class/graphics/fb0/blank.

You are right, we are not using fbcon. fbcon will still enable the LCD but in our
embedded domain we have it disabled because we must not show a console.

Do we understand your proposal correctly to replace the call to
drm_mode_config_reset() in imx_drm_bind() [imx-drm-core.c] with picking up
the device settings instead?

https://elixir.bootlin.com/linux/v5.10-rc4/source/drivers/gpu/drm/imx/imx-drm-core.c#L231

We are a little clueless right now: How do we pick up the device settings?

Greetings,
Mark
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

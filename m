Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2E1AFFC9A
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 10:42:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FE7810E1DF;
	Thu, 10 Jul 2025 08:42:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFDB710E1DF
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 08:42:12 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1uZmqy-0007le-Dq; Thu, 10 Jul 2025 10:42:04 +0200
Message-ID: <aecd03f464f25d50f379be405a8596261f247897.camel@pengutronix.de>
Subject: Re: DMA-BUFs always uncached on arm64, causing poor camera
 performance on Librem 5
From: Lucas Stach <l.stach@pengutronix.de>
To: Pavel Machek <pavel@ucw.cz>, kraxel@redhat.com,
 vivek.kasireddy@intel.com,  dri-devel@lists.freedesktop.org,
 sumit.semwal@linaro.org,  benjamin.gaignard@collabora.com,
 Brian.Starkey@arm.com, jstultz@google.com,  tjmercier@google.com,
 linux-media@vger.kernel.org,  linaro-mm-sig@lists.linaro.org, kernel list
 <linux-kernel@vger.kernel.org>,  laurent.pinchart@ideasonboard.com,
 linux+etnaviv@armlinux.org.uk,  christian.gmeiner@gmail.com,
 etnaviv@lists.freedesktop.org,  phone-devel@vger.kernel.org
Date: Thu, 10 Jul 2025 10:42:02 +0200
In-Reply-To: <aG94uNDrL1MdHJPM@duo.ucw.cz>
References: <aG94uNDrL1MdHJPM@duo.ucw.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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

Hi Pavel,

Am Donnerstag, dem 10.07.2025 um 10:24 +0200 schrieb Pavel Machek:
> Hi!
>=20
> It seems that DMA-BUFs are always uncached on arm64... which is a
> problem.
>=20
> I'm trying to get useful camera support on Librem 5, and that includes
> recording vidos (and taking photos).
>=20
> memcpy() from normal memory is about 2msec/1MB. Unfortunately, for
> DMA-BUFs it is 20msec/1MB, and that basically means I can't easily do
> 760p video recording. Plus, copying full-resolution photo buffer takes
> more than 200msec!
>=20
> There's possibility to do some processing on GPU, and its implemented her=
e:
>=20
> https://gitlab.com/tui/tui/-/tree/master/icam?ref_type=3Dheads
>=20
> but that hits the same problem in the end -- data is in DMA-BUF,
> uncached, and takes way too long to copy out.
>=20
> And that's ... wrong. DMA ended seconds ago, complete cache flush
> would be way cheaper than copying single frame out, and I still have
> to deal with uncached frames.
>=20
> So I have two questions:
>=20
> 1) Is my analysis correct that, no matter how I get frame from v4l and
> process it on GPU, I'll have to copy it from uncached memory in the
> end?

If you need to touch the buffers using the CPU then you are either
stuck with uncached memory or you need to implement bracketed access to
do the necessary cache maintenance. Be aware that completely flushing
the cache is not really an option, as that would impact other
workloads, so you have to flush the cache by walking the virtual
address space of the buffer, which may take a significant amount of CPU
time.

However, if you are only going to use the buffer with the GPU I see no
reason to touch it from the CPU side. Why would you even need to copy
the content? After all dma-bufs are meant to enable zero-copy between
DMA capable accelerators. You can simply import the V4L2 buffer into a
GL texture using EGL_EXT_image_dma_buf_import. Using this path you
don't need to bother with the cache at all, as the GPU will directly
read the video buffers from RAM.

Regards,
Lucas

>=20
> 2) Does anyone have patches / ideas / roadmap how to solve that? It
> makes GPU unusable for computing, and camera basically unusable for
> video.
>=20
> Best regards,
> 								Pavel


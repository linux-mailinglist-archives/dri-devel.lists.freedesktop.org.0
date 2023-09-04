Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B23791252
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 09:36:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A67F10E0B7;
	Mon,  4 Sep 2023 07:36:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A320E10E101
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 07:36:17 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5CC3AB80D77;
 Mon,  4 Sep 2023 07:36:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC303C433C7;
 Mon,  4 Sep 2023 07:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693812973;
 bh=HFFWGiw/0uizFQtG50aI919dArfwrxeqsAuMKggc+5A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=i4LlWGtoTssrh19alu6FCpRQEpibxXHAQar0iip3haPXS8+6V/gX5G9cnGzsK4+Eh
 3G0ATi5leP6ncrLHJS3g3p0UHpZp/1/ytMmibUUKHLr5RHqogPEmcD5/yrCrTtNOon
 b5hocdZASzjnhqe8c2yFVTr7j6aQTz0WUysn2Ru3JCluyXKyn33w99E6ANdL4AOPpE
 No2N5vfV7EKV/M/fKcjm7ulAdpJOKK+A7KITOTze6tTuSf0O3mibzZ2ruBGSaFCv6m
 WYVtFpH9yLcNt+u4FPI1ZvaAOAymhgSinFNLmapu7QV4QR8JlNaUSjxewJ9Tuf4E7p
 UD98lsz+2IRLw==
Date: Mon, 4 Sep 2023 09:36:10 +0200
From: Maxime Ripard <mripard@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Subject: Re: [RFT PATCH 01/15] drm/armada: Call drm_atomic_helper_shutdown()
 at shutdown time
Message-ID: <wi2j43vzk3t55xc6ylvbekxqybnc62fqpx7v277d5htcqxrtxf@qya4mbky2y7l>
References: <20230901234202.566951-1-dianders@chromium.org>
 <20230901164111.RFT.1.I3d5598bd73a59b5ded71430736c93f67dc5dea61@changeid>
 <ZPSsBhbekKY7VyDg@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ZPSsBhbekKY7VyDg@shell.armlinux.org.uk>
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
Cc: Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Sep 03, 2023 at 04:53:42PM +0100, Russell King (Oracle) wrote:
> On Fri, Sep 01, 2023 at 04:41:12PM -0700, Douglas Anderson wrote:
> > Based on grepping through the source code this driver appears to be
> > missing a call to drm_atomic_helper_shutdown() at system shutdown
> > time. Among other things, this means that if a panel is in use that it
> > won't be cleanly powered off at system shutdown time.
> >=20
> > The fact that we should call drm_atomic_helper_shutdown() in the case
> > of OS shutdown/restart comes straight out of the kernel doc "driver
> > instance overview" in drm_drv.c.
> >=20
> > This driver was fairly easy to update. The drm_device is stored in the
> > drvdata so we just have to make sure the drvdata is NULL whenever the
> > device is not bound.
>=20
> ... and there I think you have a misunderstanding of the driver model.
> Please have a look at device_unbind_cleanup() which will be called if
> probe fails, or when the device is removed (in other words, when it is
> not bound to a driver.)
>=20
> Also, devices which aren't bound to a driver won't have their shutdown
> method called (because there is no driver currently bound to that
> device.) So, ->probe must have completed successfully, and ->remove
> must not have been called for that device.
>=20
> So, I think that all these dev_set_drvdata(dev, NULL) that you're
> adding are just asking for a kernel janitor to come along later and
> remove them because they serve no purpose... so best not introduce
> them in the first place.

What would that hypothetical janitor clean up exactly? Code making sure
that there's no dangling pointer? Doesn't look very wise to me.

Maxime

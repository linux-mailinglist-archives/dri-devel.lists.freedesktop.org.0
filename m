Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D8D1AEB3C
	for <lists+dri-devel@lfdr.de>; Sat, 18 Apr 2020 11:27:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDBD66EC5F;
	Sat, 18 Apr 2020 09:26:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5302::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72EB46E405
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 12:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1587125892;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:Message-Id:Cc:Date:From:Subject:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=PSiPnbfCSm2N4MjrJ4CWsT5t8wQGa5r1063Egonru1I=;
 b=ltCgwNBOmvKk84NE9N5Ji8Ttl6uREIdFelvz9KPb1FxU6lgbDTwRj58SH6KVG+PVDy
 Qu+gaqzSMnpcAQzZMKB1Fp1BTlxqaxQMSVz80uBb9X5imWywPmViPREHFsTUuNGSxVpj
 ecIXWxx2mczPRwVKo5DssQxNSmjNYMkp3FD/wiLyIdIHCgUpXzsLsIuvg/qHBxWZUmqa
 I7esULpDoHnbyoFNQgxkTDXOAz/BKTDvkDEsjFJeyc8vUzbHEhc3ADUGmCs2BohthsNH
 LT5cdGwHprvL4nmU21F968ITaDNKCuK4BRP8D32a13cehicTuVg+p6A+TpbQQ5CrZaj5
 n9vw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGH/PgwDWjbQ=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 46.5.0 DYNA|AUTH)
 with ESMTPSA id g06d2dw3HCIC1cd
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256
 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Fri, 17 Apr 2020 14:18:12 +0200 (CEST)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: [drm:simple_bridge_attach [simple_bridge]] *ERROR* Fix bridge driver
 to make connector optional!
From: H. Nikolaus Schaller <hns@goldelico.com>
Date: Fri, 17 Apr 2020 14:18:11 +0200
Message-Id: <CB5A5B81-F06C-4CBE-95DE-96C8723D2AC5@goldelico.com>
To: Maxime Ripard <maxime@cerno.tech>
X-Mailer: Apple Mail (2.3124)
X-Mailman-Approved-At: Sat, 18 Apr 2020 09:26:15 +0000
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
Cc: linux-omap <linux-omap@vger.kernel.org>,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,
I have started to test v5.7-rc1 and can't fully boot the GTA04
device any more.

What I see in the log is:

[   28.567840] [drm:simple_bridge_attach [simple_bridge]] *ERROR* Fix bridge driver to make connector optional!
[   28.567871] omapdrm omapdrm.0: unable to attach bridge /ocp@68000000/dss@48050000/encoder@48050c00
[   28.786529] omapdrm omapdrm.0: omap_modeset_init failed: ret=-22
[   28.841552] omapdrm: probe of omapdrm.0 failed with error -22

This device uses the ti,opa362 chip which did have a dedicated
omapdss driver before (which is removed now) and which seems to
be supported by the simple_bridge now.

The opa362 is sitting in the video out path from

	omapdrm -> venc -> opa362 -> video-out-connector.

What does this error mean? How can it be fixed?

BR and thanks,
Nikolaus

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

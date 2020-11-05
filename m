Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 010A02A917C
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 09:35:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09D836EE19;
	Fri,  6 Nov 2020 08:35:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2603D6EDD9
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 18:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1604600065;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=L9xvSRO4jZG01PGBZOFAM7iZqNe/T5oryMn7TOV1cNM=;
 b=BF1jGinZSVw3YHUsT8NXUVYiBUQ7wRcFSfr+AWjfC0f/SmOiaKQreexyNO+lMuq7g/
 0kbm6ZyPtHk40dD8LWkGP7D65mZZUIdqOPzIgScfqbqW5R0QOzhxBlQUOpjTsk8mv11+
 /yImNZ1wiKQPSnLWYJR+A6z+/F/sAw5NxqMn/wknB3wE1p9pqhhuuQLupNCP9czjOj31
 u0YUGEoLgaGY41511swqncNcDRbng9+7/eJcbwt9mDCtM8ZckgL5i3VHSQwhM2+xDrqk
 HQvv3CdvyefkFLGYNlLe7S6WoSjgTrxkxd67CO/BB+NVu5O/rdAw8+EiW6dUq04u64Cp
 cChg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDlSfXA0MwM0="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 47.3.2 DYNA|AUTH)
 with ESMTPSA id L07f74wA5IEG0hD
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256
 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Thu, 5 Nov 2020 19:14:16 +0100 (CET)
Subject: Re: [PATCH v3 00/56] Convert DSI code to use drm_mipi_dsi and
 drm_panel
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <fcbc8488-5861-8e51-0f86-1ed6498083f7@ti.com>
Date: Thu, 5 Nov 2020 19:14:15 +0100
Message-Id: <579243AA-014A-411B-9014-F5846C9B8137@goldelico.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <61C04176-4654-4D2D-A55B-31FBB6D2E5AA@goldelico.com>
 <fcbc8488-5861-8e51-0f86-1ed6498083f7@ti.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
X-Mailer: Apple Mail (2.3124)
X-Mailman-Approved-At: Fri, 06 Nov 2020 08:34:42 +0000
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
Cc: Tony Lindgren <tony@atomide.com>, Sekhar Nori <nsekhar@ti.com>,
 Sebastian Reichel <sre@kernel.org>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-omap@vger.kernel.org, Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


> Am 05.11.2020 um 18:36 schrieb Tomi Valkeinen <tomi.valkeinen@ti.com>:
> 
> Hi,
> 
> On 05/11/2020 19:15, H. Nikolaus Schaller wrote:
> 
>> Next, I migrated my long waiting mipi_dsi/drm_panel driver conversion for
>> the panel of the Pyra handheld (omap 5 based) to compile on 5.10-rc2. And
>> I followed the latest existing panel-orisetech-otm8009a.c which uses a
>> similar video mode controller and mipi-dsi.
>> 
>> That one seems to be used by arch/arm/boot/dts/stm32f469-disco.dts.
>> 
>> Unfortunately my panel driver is not even loaded by drm/omap so I can't
>> debug. Does this set of drm/omap drivers need a modification of the device
>> tree? If yes, which one?
> 
> omapdrm doesn't load the panel drivers. If not even your panel's probe is called, then it hints at
> DT and/or driver's compatible string issue. The panel's probe should get called even if omapdrm is
> not loaded at all.

Well, I use the same device tree that loads the old driver...

> 
> Can you push your branch somewhere, so I can have a quick look?

Yes, that would be nice!
Here:

https://git.goldelico.com/?p=letux-kernel.git;a=shortlog;h=refs/heads/letux-pyra-dsi-5.10-rc2

or:

https://github.com/goldelico/letux-kernel/tree/letux-pyra-dsi-5.10-rc2

(full config is not included).

BR and thanks,
Nikolaus

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

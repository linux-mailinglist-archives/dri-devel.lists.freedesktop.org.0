Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C30D1B01E4
	for <lists+dri-devel@lfdr.de>; Mon, 20 Apr 2020 08:55:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A90E76E1A7;
	Mon, 20 Apr 2020 06:55:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp07.smtpout.orange.fr
 [80.12.242.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80FA26E250
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Apr 2020 10:18:41 +0000 (UTC)
Received: from belgarion ([86.210.245.36]) by mwinf5d13 with ME
 id UAJe220080nqnCN03AJeRj; Sat, 18 Apr 2020 12:18:39 +0200
X-ME-Helo: belgarion
X-ME-Auth: amFyem1pay5yb2JlcnRAb3JhbmdlLmZy
X-ME-Date: Sat, 18 Apr 2020 12:18:39 +0200
X-ME-IP: 86.210.245.36
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 2/8] fbdev/ARM: pxa: avoid selecting CONFIG_FB
References: <20200417155553.675905-1-arnd@arndb.de>
 <20200417155553.675905-3-arnd@arndb.de>
X-URL: http://belgarath.falguerolles.org/
Date: Sat, 18 Apr 2020 12:18:38 +0200
In-Reply-To: <20200417155553.675905-3-arnd@arndb.de> (Arnd Bergmann's message
 of "Fri, 17 Apr 2020 17:55:47 +0200")
Message-ID: <873691p05d.fsf@belgarion.home>
User-Agent: Gnus/5.130008 (Ma Gnus v0.8) Emacs/26 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 20 Apr 2020 06:55:01 +0000
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
Cc: linux-fbdev@vger.kernel.org, airlied@linux.ie,
 Andrzej Hajda <a.hajda@samsung.com>, Laurent.pinchart@ideasonboard.com,
 marex@denx.de, thellstrom@vmware.com, dsd@laptop.org,
 Jason Gunthorpe <jgg@ziepe.ca>, masahiroy@kernel.org,
 Saeed Mahameed <saeedm@mellanox.com>, geert@linux-m68k.org,
 linux-graphics-maintainer@vmware.com, haojian.zhuang@gmail.com,
 Nicolas Pitre <nico@fluxnic.net>, dri-devel@lists.freedesktop.org,
 jfrederich@gmail.com, linux-renesas-soc@vger.kernel.org,
 kieran.bingham+renesas@ideasonboard.com, daniel@zonque.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Arnd Bergmann <arnd@arndb.de> writes:

> In order to add more compile-time dependencies to CONFIG_FB, remove the
> last few instances of selecting it from platform code.
>
> This was originally written to allow a modular driver, but that never
> worked because vmlinux cannot call exported functions from a loadable
> module.
>
> Just change the #ifdef check to what it should have been and remove
> the 'select' statement.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Hi Arnd,

Ok, so if you remove the select FB_PXA, I think there will be a couple of
defconfigs which _might_ break, namely :
	corgi_defconfig
	h5000_defconfig
	hx4700_good_defconfig
	lubbock_defconfig
	mmp2_defconfig
	multi_v7_defconfig
	mvebu_v7_defconfig
	pcm027_defconfig
	pxa168_defconfig
	pxa910_defconfig
	xcep_defconfig
	zylonite_defconfig

Could you please have a look to see if they shouldn't have a CONFIG_FB_PXA=y and
CONFIG_FB=y now with this change ?

Cheers.

--
Robert
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

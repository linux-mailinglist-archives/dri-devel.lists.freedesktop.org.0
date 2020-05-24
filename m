Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8F31E07C2
	for <lists+dri-devel@lfdr.de>; Mon, 25 May 2020 09:21:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 212F589DB4;
	Mon, 25 May 2020 07:21:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BB2689D84
 for <dri-devel@lists.freedesktop.org>; Sun, 24 May 2020 16:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1590336807; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:content-transfer-encoding:in-reply-to:
 references; bh=IR9mSfd1alpCngpWaaOrCELM8r/QowG/tNUYQLL38DE=;
 b=xuFq2EMyxIKkboOg3mVuxaVn/N6V/RTgfq42V6xjQiqVumovfCah/EgZwJKlfRy8Xlnmiu
 rOg5zsWl7l1a/h8kZsj8AJdkfIFcZwir5v7esjhGfmDfkkrFzN4jh+ADtIoIBJ5Axc84qi
 gVDNOEXcqNz272ML7z1SlR6vPYqovkE=
Date: Sun, 24 May 2020 18:13:16 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: MIPI DSI, DBI, and tinydrm drivers
To: dri-devel <dri-devel@lists.freedesktop.org>
Message-Id: <4QFUAQ.UPWBIKSUSOG@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 25 May 2020 07:21:04 +0000
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
Cc: Sam Ravnborg <sam@ravnborg.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi list,

I'd like to open a discussion about the current support of MIPI DSI and 
DBI panels.

Both are standards from the MIPI alliance, both are communication 
protocols between a LCD controller and a LCD panel, they generally both 
use the same commands (DCS), the main difference is that DSI is serial 
and DBI is generally parallel.

In the kernel right now, DSI is pretty well implemented. All the 
infrastucture to register a DSI host, DSI device etc. is there. DSI 
panels are implemented as regular drm_panel instances, and their 
drivers go through the DSI API to communicate with the panel, which 
makes them independent of the DSI host driver.

DBI, on the other hand, does not have any of this. All (?) DBI panels 
are implemented as tinydrm drivers, which make them impossible to use 
with regular DRM drivers. Writing a standard drm_panel driver is 
impossible, as there is no concept of host and device. All these 
tinydrm drivers register their own DBI host as they all do DBI over SPI.

I think this needs a good cleanup. Given that DSI and DBI are so 
similar, it would probably make sense to fuse DBI support into the 
current DSI code, as trying to update DBI would result in a lot of code 
being duplicated. With the proper host/device registration mechanism 
from DSI code, it would be possible to turn most of the tinydrm drivers 
into regular drm_panel drivers.

The problem then is that these should still be available as tinydrm 
drivers. If the DSI/DBI panels can somehow register a .update_fb() 
callback, it would make it possible to have a panel-agnostic tinydrm 
driver, which would then probably open a lot of doors, and help a lot 
to clean the mess.

I think I can help with that, I just need some guidance - I am fishing 
in exotic seas here.

Thoughts, comments, are very welcome.

Cheers,
-Paul


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B60B24AFB9
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 09:15:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3565A6E8D4;
	Thu, 20 Aug 2020 07:14:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 578 seconds by postgrey-1.36 at gabe;
 Wed, 19 Aug 2020 10:21:58 UTC
Received: from shell.v3.sk (mail.v3.sk [167.172.186.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BB246E213
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 10:21:58 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by zimbra.v3.sk (Postfix) with ESMTP id 3FFD6DFA71;
 Wed, 19 Aug 2020 10:11:24 +0000 (UTC)
Received: from shell.v3.sk ([127.0.0.1])
 by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 3Ym15nfYp3ad; Wed, 19 Aug 2020 10:11:23 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by zimbra.v3.sk (Postfix) with ESMTP id E05D0DFA44;
 Wed, 19 Aug 2020 10:11:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
 by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id AD0s2r5Zerf0; Wed, 19 Aug 2020 10:11:22 +0000 (UTC)
Received: from localhost (unknown [109.183.109.54])
 by zimbra.v3.sk (Postfix) with ESMTPSA id 81696DEE69;
 Wed, 19 Aug 2020 10:11:22 +0000 (UTC)
From: Lubomir Rintel <lkundrak@v3.sk>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 0/2] drm/panel: Add support for Innolux LS075AT011
Date: Wed, 19 Aug 2020 12:12:04 +0200
Message-Id: <20200819101206.633253-1-lkundrak@v3.sk>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 20 Aug 2020 07:14:47 +0000
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Please take a look at the patches chanied to this message and consider
applying them. They add description of the display panel found on OLPC
laptops to the simple panel driver.

There is no datasheet for the hardware and thus the timings were
determined on a best effort basis. The clock range is gotten from the
data sheet of the display controller [1] and the other timings are what
OLPC laptops actually use. The panel seems to cope with different sync
timings, but I'm not sure wherher there's any value in attempting to
figure out what range is actually permissible.

I could not figure out the right definitions for the connector and the
bus format. I'm not sure how necessary they are, but at least the
drm-panel driver insists on connector type being defined so I picked
LVDS because that seems to be used for internal laptop screens.

The signalling is not actually differential. It uses TTL levels with
data sampled on rising and falling clock edges; sort of like this (taken
from [1], P.20):

          __
    FSTH /  \_______________________________________
          ____      ____      ____      ____      __
    FCLK /    \____/    \____/    \____/    \____/
                  ____ ____ ____ ____ ____ ____ ____
    FD00 ........X____X____X____X____X____X____X____
                  ____ ____ ____ ____ ____ ____ ____
    FD01 ........X____X____X____X____X____X____X____
                  ____ ____ ____ ____ ____ ____ ____
    FD10 ........X____X____X____X____X____X____X____
                  ____ ____ ____ ____ ____ ____ ____
    FD11 ........X____X____X____X____X____X____X____
                  ____ ____ ____ ____ ____ ____ ____
    FD20 ........X____X____X____X____X____X____X____
                  ____ ____ ____ ____ ____ ____ ____
    FD21 ........X____X____X____X____X____X____X____
                   |    |    |    |
                   data 1    data 2   ...
                   (2x6bit)  (2x6bit)

I believe the data just carries brightness because each pixel on the
panel has a fixed color; with the red, green and blue pixels organized
in a pattern [2]. (The HX8837 that drives the color does the conversion
from RGB).

Tested on an OLPC XO-1.75 laptop. XO-1 and XO-1.5 use the same hardware,
but their display controllers are not supported by DRM at the moment.

[1] http://wiki.laptop.org/images/0/09/DCON_datasheet_HX8837-A.pdf
[2] http://wiki.laptop.org/go/Display

Thank you!
Lubo


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE943451D0
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 22:33:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C19096E5B9;
	Mon, 22 Mar 2021 21:33:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from libero.it (smtp-17.italiaonline.it [213.209.10.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F319C89CE3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 21:33:50 +0000 (UTC)
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([87.20.116.197]) by smtp-17.iol.local with ESMTPA
 id OSB9lKwj3tpGHOSBElyOi1; Mon, 22 Mar 2021 22:33:47 +0100
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
 t=1616448827; bh=P157cUPErI7dIQlm2N4AO0ObF6xkwf+djK5WsXbfGFs=;
 h=From;
 b=z52SLEVJcTuIZxwDJyaSTEv7Nzqzq5UjmEA9y4uVAiv2MzeoYsOo8ycEq98j51y5W
 d2bty9f5FE/AJUrfkuRYbz+uO5DpDTrOGXTfKfr+tI+vWeyQ4wdFl3SMR2R5R/GOKB
 ZjTuu4x9OgoHQz1RQeSJFxN4cd8bAw7Yhs6IYk9ABdWEO5wr0UnW6pZZ79F4zpHQv/
 EdipKzp/CEsrxrXmO0DzY0YULGbrGYwp1hu4XgK/tvHJoOh5rxN6U2ixcGbLnFLMAZ
 7Mhqhy8yKY/qFQOtw8q+8vYRwC3r6/Vwmr9Qgn9QLMyUNi5QlhYBbUt3vjvlpUnB7/
 yQH5e7ak65Hfw==
X-CNFS-Analysis: v=2.4 cv=Q7IXX66a c=1 sm=1 tr=0 ts=60590d3b cx=a_exe
 a=AVqmXbCQpuNSdJmApS5GbQ==:117 a=AVqmXbCQpuNSdJmApS5GbQ==:17
 a=avqEcO1kaKR2PiVpUlAA:9
From: Dario Binacchi <dariobin@libero.it>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] drm/tilcdc: fix LCD pixel clock setting
Date: Mon, 22 Mar 2021 22:33:34 +0100
Message-Id: <20210322213337.26667-1-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
X-CMAE-Envelope: MS4xfA0fpS3Le705qB1u6/CBmKnXBW6dgQPIptIRdTsE08Zio8RdtDgWrgkvh0btIFLNVm9DUNUlYrYvc6/re4gjr9OeV5Z4mkTaupXKAD8Q7v23zg5kS3uf
 Gl94t7sX2hwE8lIImbdbckj1mg6TAa+LpbxoWz7N6u61A/G3roNepdbCEmPLSlZsskYkgIPh+3RpWRqhBQ6BinNfTDZlpOUYn4de7N6c6P2PxOVf7Fytoyvm
 q8THQJ4f1evWCO6IsKnEZRVvQIl2w2JhXh8H9kem5eFSQ76/c1IFfAKwousHr3rvNJFKa6kvj9R0Jy3R9upyVhuOfpqExdQpL8lNvkXfT96V/8a+gzre//gT
 jIsiwnIMUhTnPFtYzi8QTRw9ZlEigJhpFXs9JMwtph4MOl7i2XTDUIHCcqCwYg4Tzdqdq9UX
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
Cc: Tomi Valkeinen <tomba@kernel.org>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Jyri Sarha <jyri.sarha@iki.fi>,
 Dario Binacchi <dariobin@libero.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


The series was born from a patch to fix the LCD pixel clock setting.
Two additional patches have been added to this. One renames a misleading
variable name that was probably the cause of the bug and the other fixes
a warning message.


Changes in v3:
- Replace calculated with requested in the warning message.
- Swap the positions of the real_pclk_rate, and pclk_rate parameters
  in the warning message.

Changes in v2:
- The patch has been added in version 2.
- Rename clk_div_rate to real_pclk_rate.
- Provide pixel clock rate to tilcdc_pclk_diff().
- The patch has been added in version 2.

Dario Binacchi (3):
  drm/tilcdc: rename req_rate to pclk_rate
  drm/tilcdc: fix LCD pixel clock setting
  drm/tilcdc: fix pixel clock setting warning message

 drivers/gpu/drm/tilcdc/tilcdc_crtc.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

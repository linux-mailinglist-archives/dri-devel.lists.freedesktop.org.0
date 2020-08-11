Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E587241CED
	for <lists+dri-devel@lfdr.de>; Tue, 11 Aug 2020 17:08:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB2326E580;
	Tue, 11 Aug 2020 15:07:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1029 seconds by postgrey-1.36 at gabe;
 Tue, 11 Aug 2020 15:07:55 UTC
Received: from pp2024.ppsmtp.net (pp2024.ppsmtp.net [132.145.227.111])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5569B6E580
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 15:07:54 +0000 (UTC)
Received: from pps.filterd (pp2024.ppsmtp.internal [127.0.0.1])
 by pp2024.ppsmtp.internal (8.16.0.42/8.16.0.42) with SMTP id 07BEoIWZ001493;
 Tue, 11 Aug 2020 16:50:43 +0200
Received: from exchange.systecgmbh.local ([81.173.215.30])
 by pp2024.ppsmtp.internal with ESMTP id 32shx5srxv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Aug 2020 16:50:43 +0200
Received: from exchange.systecgmbh.local (10.0.1.54) by exchange (10.0.1.54)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.1713.5; Tue, 11 Aug
 2020 16:50:43 +0200
Received: from exchange.systecgmbh.local ([fe80::5086:b331:10c9:2db1]) by
 exchange.systecgmbh.local ([fe80::d829:29c0:9f1d:4a8e%7]) with mapi id
 15.01.1713.009; Tue, 11 Aug 2020 16:50:43 +0200
From: Stefan Birkholz <Birkholz@systecnet.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Subject: imx-drm: master bind failed: -517 with parallel_display (on i.MX6DL)
Thread-Topic: imx-drm: master bind failed: -517 with parallel_display (on
 i.MX6DL)
Thread-Index: AdZv7KKvurew1forSlCr+ylhpmkNJQ==
Date: Tue, 11 Aug 2020 14:50:42 +0000
Message-ID: <f25a430a491c46a9bacef9f62c3c2129@systecnet.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.3.109]
MIME-Version: 1.0
X-Proofpoint-ID: SID=32shx5srxv QID=32shx5srxv-1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-11_13:2020-08-11,
 2020-08-11 signatures=0
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

we are using the mainline kernel (currently on 4.19.128) successfully on an i.MX6DL-based system, but when we try to upgrade to any more recent kernel (>5.1) the display output stops working (screen is blank, backlight works). 

The relevant entries from the kernel log seem to be:
[    8.954942] imx-drm display-subsystem: bound imx-ipuv3-crtc.3 (ops imx_drm_exit [imxdrm])
[    9.028406] imx-drm display-subsystem: failed to bind disp0 (ops imx_pd_ops [parallel_display]): -517
[    9.037873] imx-drm display-subsystem: master bind failed: -517

(I can reproduce those by un-/reloading the parallel-display.ko module.)

On a working 4.19.128 the corresponding entries are:
[    8.879050] imx-drm display-subsystem: bound imx-ipuv3-crtc.3 (ops imx_drm_exit [imxdrm])
[    8.887361] imx-drm display-subsystem: bound disp0 (ops imx_pd_ops [parallel_display])
[    9.131288] imx-drm display-subsystem: fb0: DRM emulated frame buffer device
[    9.139618] [drm] Initialized imx-drm 1.0.0 20120507 for display-subsystem on minor 2

Via git bisection I found the last "good" commit at [044175a06706d516aa42874bb44dbbfc3c4d20eb], and the next "bad" commit at [228cd2dba27cee9956c1af97e6445be056881e41].

I tested both these versions with exactly the same .dtb and our .config (adapted via "make olddefconfig" for both versions) from the 4.19.128 kernel.

Do you have any suggestions what we can do to try and fix this problem?

Kind regards,
 Stefan Birkholz
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

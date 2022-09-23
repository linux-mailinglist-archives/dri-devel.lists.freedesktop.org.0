Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CF35E7B16
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 14:47:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 040B088E45;
	Fri, 23 Sep 2022 12:47:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150049.outbound.protection.outlook.com [40.107.15.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70C6E10E51C
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 12:47:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eBiPn9LSz0UoP0kltDqZ2ReHHMF4AmJu6spKnfMNnu5+gt1cld3CXAWbikV8r8dE4SdoBBxQfmcA51XF37dpXMCxxvq9rXX+qcCh/pCQfIZ5phHQUe4k2LrtIxe0bnI8v2nwv1ohJmBWN6cXTg1g/Vw7e/rHvaf22hbr7KPAXUSrU/FX+xC8i9ZgkMqHhYKqaQa6vZ32PQNb45QVnO78aVsAN6YLZjZVyr3Wlr97sQCBWNgj36bLdMBsTRIyBk76fe1IbIIiQxBFGiB8crIfZoDVvwqW5K0qMyMYgW278Bbcj1zcGPOeeBVgZYOldn84GDJoH1JnDNuPoTA/UJt/pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pEFHJBs0L1C95FxBlxCpNd4rxV+XCT3RBPHHkjmf0n4=;
 b=jjvFmEh80WzP+pX5IuJLzi1xwUZK9WmbvgK11GamFwBQdl+fqsar+uPyGFpihpYeY/7msq9M3rU1EXit8MvLtHPAQ3hjVgHyqIhiCInxDFlBQ5J5R4JilfPkNcFWIeDhIooKOb1T2aFTNOoq2VztIgu8aJ7WnCE8+nyd69sp4uI0is4xYMCnoSu28QbyGVHO1leIM0hfQh7QSRXbsruI9xDDufm5cdgas5MnGyzOXhm9h+3/2PKQm5sl7NjLC+P2AM8SUAiDdSMXXVF4gntTsXNIOmcn4IUfXJFXMGOCUVWVg9ds+4sJabnD8VxDpx/HBJ/xLXCV3KZc/Onvas3zLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pEFHJBs0L1C95FxBlxCpNd4rxV+XCT3RBPHHkjmf0n4=;
 b=nTIWjg2qRD1UFZ4XiOGNrNaxebxYGBgKmTHt1X6JUsdHuYXzFWpnsAqZfAIo0+fOppaMvXUnREZ8lUt8we/hCV3jdDLifNixhjQrG2jaZx6tcveucHBDQhN59yMck3YrAgo9+klVGmsMeKm/cnlbBmTizwFZyReE6VbElOCY4Uc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA4PR04MB9461.eurprd04.prod.outlook.com (2603:10a6:102:2a9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.18; Fri, 23 Sep
 2022 12:47:38 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::80cb:1937:26ca:fc94]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::80cb:1937:26ca:fc94%9]) with mapi id 15.20.5654.017; Fri, 23 Sep 2022
 12:47:38 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-pm@vger.kernel.org
Subject: [PATCH v2] PM: runtime: Return properly from rpm_resume() if
 dev->power.needs_force_resume flag is set
Date: Fri, 23 Sep 2022 20:49:04 +0800
Message-Id: <20220923124904.1373936-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0234.apcprd06.prod.outlook.com
 (2603:1096:4:ac::18) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA4PR04MB9461:EE_
X-MS-Office365-Filtering-Correlation-Id: a32ab6bf-4c39-430a-d50b-08da9d61cbc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RBlhlQ3J5Gmzt2v4TG50fY+iuazEAGeKaeZflibyVfET2xvY6tc3vJWVCuI+8dPGjpX9v1SAASeQwkSK67+xaKbrYIAFrP3wzvbf7ceZ+SmD0wBBKsdx2gMKaaGaNnaU1yoOPOdkI8087MNfzXd/KX4l+2M9uo8Fsn4WAx/V44/iACC1FScCtjJLte6qRDr1oJaBISZMYU163AyoCWYsEQwuxBMk0gZ6ww3wPQQ9Z2lvb4BwdQyH3idJ2n0rZ0LH+x6zuvuAQ/qbkYKfZ9MQjjyqVEO5klA/izoXWNbj3/BBd1SH2x/xjcT/ZciyZIA9PU7M3GbRTF5GrlFPNzdzIfxtw+806gniwZUAFCwhHpo0YG7TtG5G3T1jXfeTuGww435M+fi5PT5GGEUAMlyJ1YY1Zz6KZ6Rj8E9clRDfBNoJFshJwz7q1Ja9wdDBDOYs/QfbTZPWapttLHnPbdrqKt6osdK2GdHeti+JYjwEgBL/mV15Z/0bL0+S6TMIzzwzH1RqRKW2Fk5n5wm0f4jqP54uWEkXq6FsWvFaCBK6c+BLnraNr5ioGRZ7Zn1+0i7TYwfyTCXPZNEnehHaSjiIX+iJZgeXlEp60hsjqFIFkvwtX2kv2cgVxW9Qk51nfhSfl7m/bj03hwbH/0g79fMkx/KozQExFlnVnqAJ9AQamjBPqmvwxFDp/Jk1ZG57x1dq4lhMfuqAAwSDsG9EDo/gqlrTqskpHx8/4wRlar+rnLRvHK30tw7r4jECEsOgeZWaO6rzogZGaltRqBI0ZY8ZsA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(136003)(346002)(376002)(366004)(39860400002)(451199015)(1076003)(2616005)(186003)(2906002)(5660300002)(36756003)(38350700002)(38100700002)(86362001)(83380400001)(54906003)(6916009)(316002)(6512007)(6486002)(478600001)(6666004)(41300700001)(66946007)(52116002)(66476007)(8676002)(66556008)(26005)(4326008)(8936002)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uW7axWm8oApxYyfqKdfe+b070BtAb3tl/5rRtNFJPvhGObifLEHUxdhiekB7?=
 =?us-ascii?Q?TRP7VhGNqrp3IjP1VBicbIyCTNMIxZbUBZWN6awOMlZjo2WlGXO7kn9iOKfA?=
 =?us-ascii?Q?AU9v2mcHaunV/IFNiH8EQoEFS4FoRVkKgUWvkYqNlCzaXTs+W7K6PJxffkYU?=
 =?us-ascii?Q?ijrMyKIppwj1ZINnMqwW7MhL7nMoM50qhjx/GRMEbvayOaJzv1rQTJtAdWXU?=
 =?us-ascii?Q?yFU6RlgDbv5g5/nM+cYTZNJsPNS9psgGSzQva32EQkIIE74HxQCRLiupc59l?=
 =?us-ascii?Q?V4qYK/EO/ebGcyUXFgxkF9/+h6X6Neq+3iJ81JGAwoXRGH9v/Fzg+DUJBBjK?=
 =?us-ascii?Q?dn+iwELEbiS0YA2reoQjORweYTy5ez9LWZtWnx2JgvGTUkyBJgUV6uHwhY7w?=
 =?us-ascii?Q?EiAX1ycInHJJN84RmwxsgJChfyycHXoxuRQm1eS4/Lhinahvis5GE4yvfKd9?=
 =?us-ascii?Q?Iw4s6ScTqsB2oxeq7gAhqZ+PevAJfwArxw7YOAJ8+cIECrdeTnzXih356b68?=
 =?us-ascii?Q?dTNQmKVdfPFMFU6z2PZBsov7PxpIAzYHs3/45iljndHYDS9I3lcI/CxB3Sf0?=
 =?us-ascii?Q?xzgyQx8feoXgWFKh0E2lwmzAYaYuqGz3bbJa8ScFxMTv+q+IOwkbc4yQ6CAn?=
 =?us-ascii?Q?1sDQJY9uL/DnQyVbb0i8Fk2K3XNR5Jh4uTCAD40YkBZLjRP4XS2pYG4aOrHs?=
 =?us-ascii?Q?zX0jM9miXhNIHX0mfID10jV9p8eguiK126vwY3Ez9VAXVt+uREZJyfuv5PEM?=
 =?us-ascii?Q?y4iA1Y9kfJ9j8hmTgQrloeI9hhejnTX5b2ygeg1F8mbkivLGKrBoT4M7M9sZ?=
 =?us-ascii?Q?uO/3nGztJUUHi5XSArWymWHudy1jmFje8Jd2P8Ulk1mTTP5Jknf15+8kI9sP?=
 =?us-ascii?Q?sRUxsxJrred0vzEaHPAJ6pgkxmmSUhMdmF1TlmZoRbu9PF7A5XBn7gs2to/9?=
 =?us-ascii?Q?+0+51A6a/18/yKBQKBD/QOeGiWidK/16CRPs2OS48z9G3WYsRrC4Ug5AXb25?=
 =?us-ascii?Q?SZGHTDv6b+KYt2fcvSLD4umQEOH4/DGka5xX38qBpCwP0exO2S2DUbjyzjRw?=
 =?us-ascii?Q?uTsHOjsrwnlfcdnX9JOZSg2/Ro8mW8rzGr6yYgccsMDvQQ02LCD4qiePC6y+?=
 =?us-ascii?Q?GFDrxZSjjeOjZWr48uxodwUnRo5IYamjok9crhVzTGPSWU91wbdV9yli5KiK?=
 =?us-ascii?Q?vMFzylYAVd743Prh5D6k5dQJbf+v1YhHuve3mGjTi6cSXwR+T6KsD3yvx0/3?=
 =?us-ascii?Q?+1LB8PaEHkrCIQuie7uiE8/9bMDEKHlTCZGsPIZp/fphywh8RhiAiGcIvjZd?=
 =?us-ascii?Q?aBJuNYWYzkIe38vaLTJ72uGODSyehzAYGY06fAnZ7QU57OEFtWml3Z97PBk+?=
 =?us-ascii?Q?MKRvlkyAYrkhB4V6VLKMokgyw1kK6kg8JxYP3l9IG2Ll9El2MEgFaws10zrL?=
 =?us-ascii?Q?Q+DSfbAEqqwHNlp8A/qPs/SZOWWO/zxcbLdK2cn8guAZVnTzemjSbiEtblf9?=
 =?us-ascii?Q?I6y1RYGVVpD1tcp6DmGgZ4W+YClLsjQoI3WFS5KdOr1vQ0qC8K4LrW1kRVIu?=
 =?us-ascii?Q?Cl5Dt7qBmihCUABnBdlUXiklVJwL9TMINION490+?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a32ab6bf-4c39-430a-d50b-08da9d61cbc0
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2022 12:47:38.5130 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fkoBTuofIVAcufdk9GkFVbcq6yy2ZOc0rrYKwQSczrILrGvr3Mfm0Y3VhopBA7O2gUaLkMMoMjH7CnAbg9ejmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9461
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
Cc: Len Brown <len.brown@intel.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-imx@nxp.com,
 Pavel Machek <pavel@ucw.cz>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After a device transitions to sleep state through it's system suspend
callback pm_runtime_force_suspend(), the device's driver may still try
to do runtime PM for the device(runtime suspend first and then runtime
resume) although runtime PM is disabled by that callback.  The runtime
PM operations would not touch the device effectively and the device is
assumed to be resumed through it's system resume callback
pm_runtime_force_resume().

The problem is that since the device's runtime PM status is RPM_SUSPENDED
in the sleep state, rpm_resume() would not take the device as in already
active status and would return -EACCES instead of 1.  The error code
-EACCES may make the device's driver put the device into runtime suspend
status with the RPM_GET_PUT flag set and hence drop the device's usage
count to 1.  Then, at dpm_complete stage, device_complete() would call
pm_runtime_put() to drop the device's usage count again to 0 and call
rpm_idle() to try to put the device into runtime PM suspend status.  So,
the device could eventually stay at the runtime PM suspend status.

A real problematic case is the panel-simple.c driver(works with a
downstream DRM device driver), where the optional enable_gpio(controlled
by the runtime PM callbacks) will be disabled through pm_runtime_put()
called in device_complete() if a DRM atomic commit(triggered by a DRM
device's system resume callback) tries to do runtime PM resume for the
panel before the panel is active with force resume:

1) System suspend:
 - pm_runtime_force_suspend()
  - panel_simple_suspend() // enable_gpio is disabled

2) Runtime suspend with a DRM atomic commit:
 - panel_simple_unprepare()
  - pm_runtime_put_autosuspend() // drop device usage count to 1

3) Runtime resume with a DRM atomic commit:
 - panel_simple_prepare()
  - pm_runtime_get_sync() // increase device usage count to 2
    - rpm_resume() // return -EACCES
  - pm_runtime_put_autosuspend() // drop device usage count to 1

4) System resume:
 - pm_runtime_force_resume()
  - panel_simple_resume() // enable_gpio is enabled

5) PM transition complete:
 - dpm_complete()
  - device_complete()
   - pm_runtime_put() // drop device usage count to 0
    - rpm_idle()
     - rpm_suspend() // start hrtimer with expires

6) hrtimer expires:
 - pm_suspend_timer_fn()
  - rpm_suspend() // queue work on pm_wq

7) work function is called:
 - pm_runtime_work()
  - rpm_suspend()
   - panel_simple_suspend() // enable_gpio is disabled

Fix the issue by checking dev->power.needs_force_resume flag in
rpm_resume() so that it returns 1 instead of -EACCES in this scenario,
since the flag is set in pm_runtime_force_suspend().  Then, device
usage count will be 1 after pm_runtime_put() is called at dpm_complete
stage.

Also, update the documentation to change the description of
pm_runtime_resume() to reflect the new behavior of rpm_resume().

Cc: Rafael J. Wysocki <rafael@kernel.org>
Cc: Len Brown <len.brown@intel.com>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v1->v2:
* Fix commit message to tell the reason why the issue happens, that is,
  zeroed device usage count in pm_runtime_put() at dpm_complete stage
  eventually makes the device be in runtime PM suspend status.

 Documentation/power/runtime_pm.rst | 14 +++++++-------
 drivers/base/power/runtime.c       |  2 ++
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/Documentation/power/runtime_pm.rst b/Documentation/power/runtime_pm.rst
index 65b86e487afe..6266f0ac02a8 100644
--- a/Documentation/power/runtime_pm.rst
+++ b/Documentation/power/runtime_pm.rst
@@ -337,13 +337,13 @@ drivers/base/power/runtime.c and include/linux/pm_runtime.h:
 
   `int pm_runtime_resume(struct device *dev);`
     - execute the subsystem-level resume callback for the device; returns 0 on
-      success, 1 if the device's runtime PM status is already 'active' (also if
-      'power.disable_depth' is nonzero, but the status was 'active' when it was
-      changing from 0 to 1) or error code on failure, where -EAGAIN means it may
-      be safe to attempt to resume the device again in future, but
-      'power.runtime_error' should be checked additionally, and -EACCES means
-      that the callback could not be run, because 'power.disable_depth' was
-      different from 0
+      success, 1 if the device's runtime PM status is assumed to be 'active'
+      with force resume or is already 'active' (also if 'power.disable_depth' is
+      nonzero, but the status was 'active' when it was changing from 0 to 1) or
+      error code on failure, where -EAGAIN means it may be safe to attempt to
+      resume the device again in future, but 'power.runtime_error' should be
+      checked additionally, and -EACCES means that the callback could not be
+      run, because 'power.disable_depth' was different from 0
 
   `int pm_runtime_resume_and_get(struct device *dev);`
     - run pm_runtime_resume(dev) and if successful, increment the device's
diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
index 997be3ac20a7..0bce66ea0036 100644
--- a/drivers/base/power/runtime.c
+++ b/drivers/base/power/runtime.c
@@ -762,6 +762,8 @@ static int rpm_resume(struct device *dev, int rpmflags)
  repeat:
 	if (dev->power.runtime_error) {
 		retval = -EINVAL;
+	} else if (dev->power.needs_force_resume) {
+		retval = 1;
 	} else if (dev->power.disable_depth > 0) {
 		if (dev->power.runtime_status == RPM_ACTIVE &&
 		    dev->power.last_status == RPM_ACTIVE)
-- 
2.37.1


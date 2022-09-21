Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 375F55BFA70
	for <lists+dri-devel@lfdr.de>; Wed, 21 Sep 2022 11:15:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F8B010E8F0;
	Wed, 21 Sep 2022 09:15:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2074.outbound.protection.outlook.com [40.107.21.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E46F810E8F0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Sep 2022 09:15:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K6TpNP1SxOyjqZULjp5LGs5JQhFOK8XCldvevWjU9dHxhB09wvQ/neAYzFGFYjybqvj+GxUi6f8HSUQbUWqpMNgnVe3dp/mqZyzgrVIQJHjOYxaI0njgeJMLEFg3W83RQk4nunYUOrwh+8bc660EfhrYWOcfXllx/pgPolllrVBvxaRH1t9c/veuKzL6VgIBMewsFYEtWYFtJ2DYIcHQoztrXCwOmyPuAaDz6nKdqUCOKrJ/hXTJT1Dd3hWJbKlKSW5m9OaZQsjQiDFxGZIHFXxmO0jDgRBMlTGQWfmln6WCty5UeKDA3FTemn9P6DvwrlVjGdDfTeVZBT+T7lXFnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JMxdf7Hi5tVz8BdVat9JYETbDapc1wB9PWIX6kLXsMw=;
 b=dV6077LgSAxEcR1LxkZsw8Od+tU6JLKG+/TKGdPSn4e0JlD+VQgFzAtl0IqteSe2PQkVGGf5Evq5Dqq+KtBh/Boy2sZPZgkXo/LPpTojCDQswew8MCs162nVXXi1vnLdCItJn+v9Ylzukc0xrdctLHgPvnmlTmvFh/IPiQYGk0keWjca9lb4GvYjmYQqXfselsT8NUY1+4kR+wFbLL2JJc5dmlE90KjhOGpLj3vqpA8OzFONY9kZyjj/wnNZtoffWDu64ZLvzvNKegJm8hegg3hS4DHy5Df7awMDs/BrAre4esB/KQMjyzhpa74tkzst1Mh16MdhQfzxHdjTAs1+vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JMxdf7Hi5tVz8BdVat9JYETbDapc1wB9PWIX6kLXsMw=;
 b=QeeSQJGnzG5spIxzlo3CCTMO4tHXRNPQY6LLR3EkXzY2uBT7fylqlSw1w7o3LdNKi0LaIxa+hQRfIipBCPLj/Iydi8ihQ+3YQIvOplC2YsuI7ncowLPg0f8mHQ490u+mDtdwiqvxbV6tHGBgy2SIXgN7rARY2FM81AkT9TiJzUs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DBBPR04MB7707.eurprd04.prod.outlook.com (2603:10a6:10:1f4::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.16; Wed, 21 Sep
 2022 09:15:07 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::80cb:1937:26ca:fc94]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::80cb:1937:26ca:fc94%9]) with mapi id 15.20.5632.016; Wed, 21 Sep 2022
 09:15:06 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-pm@vger.kernel.org
Subject: [PATCH] PM: runtime: Return properly from rpm_resume() if
 dev->power.needs_force_resume flag is set
Date: Wed, 21 Sep 2022 17:16:23 +0800
Message-Id: <20220921091623.2814500-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0086.apcprd03.prod.outlook.com
 (2603:1096:4:7c::14) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DBBPR04MB7707:EE_
X-MS-Office365-Filtering-Correlation-Id: fd6599fb-2733-4260-bdd8-08da9bb1c65e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: talPD5F5uqqZUDl80vE4PAz4tc2QBrUDp9tVtLSwHLvvxCgytZpM1y1yxWdLTslHz69/fyU38kp26AmgPhATCUZUTEJZC90gipI1DIvjkfjbprjGKiW0ll0v5fI4uX10E5SnjPb6jJvY0F8Sl/e89wX9S2sGQCjvXWdYQ8gJWmnwjdk/4y71h+L5KqxasL0Jh+sFhc1WmCpOY/UQbbiqehudHMezFP1EZCXjeyAmRvXb7LSw6aWKBXKZ+USlqdDaPU62giqSxdFoqYJ1OMAFiEPnbhckFNx+WztFJMsO6H81qdB9Koz4iwSTz7Ee8LvnbSuDcF8nb9IgwfLDaG57TEDHQ6Ntr9VaTBiC5XFFSQW7iqL0Td/uVbJUNj1R3AYKmDS9e0PxyDIRPrdRfFXP7xvb4kF7CxqxTKVcuCeyCDPHPaga6yezrkMqpNAn8ct8Z3SsdV/6eVg9o19G3T/VjyfGWn9tIvA4asLIRmjitBR8kkYIBGIv1qswDHXWtkfpn3zTbnFve2jwFD5D0UzRi4hBNQLFNpQNLsdv/Jx1VWMJ7BZZ+fUloxg5MkEbYbcSdCTgr0nL1sOsN+25hP6PLwFS0O9l+gS/20q/1k/PuKzjUPZS8VHsRJP8w3nxAgFBsoUuuW4BSi6sP93BCCKtGE3dCs4cnuYd/Pea7+YxEXBz/aVCRPgGZj5sqx0ebJ9jykDrS4SnpmxtOWZxpXh4qtI7ml8uorADNQ6TyLUuG0gnA5mJMdplEbbCInNUcZ0v
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(396003)(346002)(136003)(39860400002)(376002)(451199015)(186003)(36756003)(6916009)(8936002)(54906003)(86362001)(316002)(66946007)(66476007)(8676002)(4326008)(66556008)(5660300002)(2616005)(41300700001)(83380400001)(6486002)(6506007)(6666004)(478600001)(1076003)(38350700002)(38100700002)(52116002)(6512007)(26005)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8BTF24ZIYJqgUacyJn0lpjl2cVTgK3YJtaeB/q0XpZ6rnyxZPPzTYqaOOi7w?=
 =?us-ascii?Q?MCsG+3e2Il8kmv2Y6FCxdO9Du8YvsgB87dUkW0uX3fxt53dJIsRaCL71xJEA?=
 =?us-ascii?Q?gvKyzEgPtUeeGqEfkQw0D81neqNyXWwVpfSCy7pMZd+OSzaLQ7mQCbSTngLA?=
 =?us-ascii?Q?+OzBRyqlVvabc4g3ETMTvi993ySZePQDJgU4E4Jg6GPZMWbDTIaWY9iqwbpq?=
 =?us-ascii?Q?lRgyyEv7hCCTqvY+NRpE+dDNWuydQh4XVibi3QTC5Vd5YdHgM/zTiS60F9Tm?=
 =?us-ascii?Q?M8gmtUw7r7+FEHvknKS/LmxTcuBV1wqtMSCgX1+TaK2tGK0h3+FmIYnuV2fM?=
 =?us-ascii?Q?ueyU4iUYeAb+W0P2YiQjktqACmAs/iRuawTRpwxWsdT7pIGF1AmA3U5S9sgh?=
 =?us-ascii?Q?Bj6S577+PVCWSKxOuz5JkE9zkEoEPKgPFBaKJqcPXBilRG4SP6FvSHPMIRUj?=
 =?us-ascii?Q?qT/16y/EiFtC4lp1pumljN3jW4oK0UPy+HJn8x+WVoEEx61FoxKhaq6WAx8j?=
 =?us-ascii?Q?I9XnSC0NvX2cNHTBjsVhJszz855RLLow7jjdxbuiBSp7icjVLP5BlyVJL4u2?=
 =?us-ascii?Q?kjEsMTxOQrFdqDMcIyhhKW8Hsz4xBfF/6tMKEJl8PzFlCu3a6QEei3DNXNo0?=
 =?us-ascii?Q?tab4rBiQT2944PJXIXc1yFNFrJ+1w64514f8xJB429MuvaJ4zbX070mOur+j?=
 =?us-ascii?Q?ecZ+v3v6Vra/Lx4gtRMfFi6aHauEDlUBov1k8Z6DfEiQDCyCZP++LALSp9PC?=
 =?us-ascii?Q?kcxyRQi+lGgWcO5HgTadqzu2Y28SE/L1aJROW/GSm/QNGpo9RzebGC3KTviC?=
 =?us-ascii?Q?gJFxH2IiGeCK3SjA1Cu9fsf/pBnOyE8DHVddf48ZPnEX5wZL4Ug+V3g+zQpb?=
 =?us-ascii?Q?9nR227BEdTbKbre5dtIuhAv3s8tmqAhc06+HBkVxGHR6rLbZbrKL4TiU1any?=
 =?us-ascii?Q?R+KN5Ghv9QCb8m3aSozErrkD3HMCeDcoASzPCGnOP73vq8qW2wIntAagctSG?=
 =?us-ascii?Q?QbKvx7HB9InekTGDiTqWyzjbTQ0T1ePWYW+J/ndCJvgWwQsR6S3tBQlEzIoO?=
 =?us-ascii?Q?ViXDoe+9l4Fh0qWRErYvlZRNTMjeIRZiRo+Ia+u7WvgzRpEPA9zVdHAT3Qli?=
 =?us-ascii?Q?v3Qxb3rLa6y5ccXeQTP52AqPhZd+ohzchMTYSGnubicSrGj7V88xlyOUn925?=
 =?us-ascii?Q?xuS/IEpJMdGUa4Hp82romR4kz7v0NWJc8gFeGZ7hKBnTcMUW5G1YyBHiEIFi?=
 =?us-ascii?Q?T1DxeAi7AhcesIPo1D+lBBBkYJxmc4A0eucB739eAnrobyHvlF3/RnCWeRR/?=
 =?us-ascii?Q?tCCv1BC1Zbs3mbi7/G4Uy2mPMvyqYx9ER5CBgoI02K/UwbOyrnQOWiuslUJ4?=
 =?us-ascii?Q?2RKYoM4BLY/v2A8pt4qa2CsL2z8lgj+OXlzReAhuQduZk56vf5dIqXlrTY2P?=
 =?us-ascii?Q?TXvmO+S1+ArrWDoVr95vnFIIc3zeAX1IrWavHIomsAmawdn/nroKIbM1nNLZ?=
 =?us-ascii?Q?YIB35IjsZDqHNF1oD3d3NIaqooTFdosPgBTJ2fgdEbyyQe71kzBWic3k4gZN?=
 =?us-ascii?Q?NU4NgT5v9o5tPydWVdJIxHMdP70Jiuhy1Zpu9NYs?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd6599fb-2733-4260-bdd8-08da9bb1c65e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2022 09:15:06.8891 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bDzsz+PxQpi6Uvy9N9Am85l4xAsz7E2ZpufH5wj55u12lU5lLtG52pW4gVmKLhWWU53UOjn9VJQL9Gql7GkNHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7707
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
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 linux-imx@nxp.com, Pavel Machek <pavel@ucw.cz>
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
status with an auto suspend delay which may happen after the device is
active again with force resume.

A real problematic case is the panel-simple.c driver(works with a
downstream DRM device driver), where the optional enable_gpio(controlled
by the runtime PM callbacks) will be disabled after the procedure with
an auto suspend delay if a DRM atomic commit(triggered by a DRM device's
system resume callback) tries to do runtime PM resume for the panel
before the panel is active with force resume:

1) System suspend:
 - pm_runtime_force_suspend()
  - panel_simple_suspend() // enable_gpio is disabled

2) Runtime suspend with a DRM atomic commit:
 - panel_simple_unprepare()
  - pm_runtime_put_autosuspend()

3) Runtime resume with a DRM atomic commit:
 - panel_simple_prepare()
  - pm_runtime_get_sync()
    - rpm_resume() // return -EACCES
  - pm_runtime_put_autosuspend() // 1 second delay ...

4) System resume:
 - pm_runtime_force_resume()
  - panel_simple_resume() // enable_gpio is enabled

5) ...
 - pm_runtime_work()
  - rpm_suspend()
   - panel_simple_suspend() // enable_gpio is disabled

Fix the issue by checking dev->power.needs_force_resume flag in
rpm_resume() so that it returns 1 instead of -EACCES in this scenario,
since the flag is set in pm_runtime_force_suspend().

Also, update the documentation to change the description of
pm_runtime_resume() to reflect the new behavior of rpm_resume().

Cc: Rafael J. Wysocki <rafael@kernel.org>
Cc: Len Brown <len.brown@intel.com>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
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


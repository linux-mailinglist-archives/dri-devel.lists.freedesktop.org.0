Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD78A35DAB7
	for <lists+dri-devel@lfdr.de>; Tue, 13 Apr 2021 11:09:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40B306E20A;
	Tue, 13 Apr 2021 09:09:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2082.outbound.protection.outlook.com [40.107.237.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D75AC89E38;
 Tue, 13 Apr 2021 09:02:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X/zsr4UNjuZUx9BkRJxX6kQgqJSCI7U2hbY4gUffl+K3HuCKQe48Zqoylvs2JFdxPYuzR5Sdzrk/l+9laGvQiNdGwzPfJMHlRW3SSvKbWUieSsY9TYsOXd0UHaViUX1+CuoqoLoWDHy24wbZASRrk85YRZAWUpVxlO/fVYeCPWloMAX14UvsaPXjJcZME13O3OBaRAwEWI3wPbyXWsUhdAhPhocGxv6i3fK0x8aBlHvMZGe6TiOrckU4EWkXmXdk0G/5CWaQvbNdiI22wqXtCM9St7z3XrKnGgQXr42fJxN/5NsMBRJj0SyaNiUnUKHu1GapjA4YZYiRv3sfCbXjXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+yPWeme+xeeLdq4gXEumrWjRb/rqm6L+B7YFyQrAv7k=;
 b=N6xw2EXt7LgxmpbbFGFvwibhnorrAdVK5mnmpCtVSfkgnaXA7EhzcUpONXrGNR7sD4OtELeKN1FQ1PldqustF3F2STCpud/w+k/3OjWyNQp8CBjIgimYVu6hhgClGZ61IVvKd50IYJdLHp4Z1FiEyQ1leYzV6bLXtomWvLbvmUsmzj3sPAdr3I3bhmpHJWWavls58SLNyzfhJWv25rR3gR/9EDkpVjs9T6dEKW08zFDYprX2mmiZE6Wj/VB2yqDdbd0Qvp6g+IjW0T+tS0NENEqJOwK57M4fO1rqKS/gOlLEoHGqmIitn80Jq7PTWmk+Lk1s2SAYFk4gRb9QOYwTXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+yPWeme+xeeLdq4gXEumrWjRb/rqm6L+B7YFyQrAv7k=;
 b=k/b/qMOdGUCvboWJjgronG6eOCkKkJxdLQlW/+WW3FsNx7NsVPa95aMxN0sHhF7o4UzcwWPizKtP0Rq1PM2zM/6wbzESky3/L8axhMcJWCFugjXQpBLWXIcImMqVH9R1BJFoRUvKeUNmgGd2MwwSUmdSCmL2N4pB5dvTGQH/rHE=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none
 header.from=synaptics.com;
Received: from BY5PR03MB5345.namprd03.prod.outlook.com (2603:10b6:a03:219::16)
 by BY5PR03MB5048.namprd03.prod.outlook.com (2603:10b6:a03:1e8::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21; Tue, 13 Apr
 2021 09:02:51 +0000
Received: from BY5PR03MB5345.namprd03.prod.outlook.com
 ([fe80::8569:341f:4bc6:5b72]) by BY5PR03MB5345.namprd03.prod.outlook.com
 ([fe80::8569:341f:4bc6:5b72%8]) with mapi id 15.20.4020.022; Tue, 13 Apr 2021
 09:02:51 +0000
Date: Tue, 13 Apr 2021 17:02:40 +0800
From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Chris
 Wilson <chris@chris-wilson.co.uk>, Jon Bloomfield
 <jon.bloomfield@intel.com>
Subject: [PATCH] drm/i915: Fix "mitigations" parsing if i915 is builtin
Message-ID: <20210413170240.0d4ffa38@xhacker.debian>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Originating-IP: [192.147.44.204]
X-ClientProxiedBy: BYAPR04CA0005.namprd04.prod.outlook.com
 (2603:10b6:a03:40::18) To BY5PR03MB5345.namprd03.prod.outlook.com
 (2603:10b6:a03:219::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from xhacker.debian (192.147.44.204) by
 BYAPR04CA0005.namprd04.prod.outlook.com (2603:10b6:a03:40::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.16 via Frontend Transport; Tue, 13 Apr 2021 09:02:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 35b9efab-da46-4724-fbeb-08d8fe5aeab3
X-MS-TrafficTypeDiagnostic: BY5PR03MB5048:
X-Microsoft-Antispam-PRVS: <BY5PR03MB5048EF8CF743B456888DA4D7ED4F9@BY5PR03MB5048.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G1iu8wAJO19rfWIc9wqVC34i4SudX7oyTz3RbV2B3JQeOShBz2mkVQ975yQjoCR2AOwnz6PSRcWOTLVSzihbZR5U4jgM7mCoe1ILJON5H66tHzfoICcZgjI1ERY+Vk8jlXB6XzaYiNC1fk/hy/rOv+ZRhdDpLpDE0IRsfTHLEZz3SIdGadzXLzz8ZReUqavr0G3JryCES8onazg0XSzMbCu+aM0oVifoTbf56QLFI5ldlHZUdn9FO/sFH+MmbvqsF81ehfKBEjdT6IJOA5TiASoB8X0vCmaHlkvzy1XwV15lCkoV5Rwnvw826+JwDVdMA8CHMFO8HPE2RUAwzc9Drk1klRGLunr62X/qRqG57I1b9/l2wokh7jLd0djqnUsQfSxOTBTSUw8uaI6Al4P3BKWomNi2MG59XveaDTGlYjKm00m4DzOsWbQlM9TI/N2878OrfEo1wrubXV2IJxM0TxmtOVSp6L/vlRxxHLf5ujj6fJfSnaJIhWG9PxVh9YlfAOCRVu+6rvLWfoaTrfVBM9lsN2yJM+2IO7Owvoa2YTjs/rAV0r+DwNbiA4tmdKTgKqt3ufjLC93KzCII91OdQJFDDjvFz3pnhIpFwRnaosd+OWwiPSVgXuCsqLNg7YHcxvqUvA6SmbS2wC85QQs4aY/Y9yUIE5GfgAR/4aRV2Qc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR03MB5345.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(39860400002)(376002)(396003)(346002)(136003)(956004)(66556008)(2906002)(52116002)(110136005)(83380400001)(55016002)(316002)(6506007)(186003)(4326008)(7696005)(38350700002)(38100700002)(8936002)(26005)(5660300002)(9686003)(478600001)(8676002)(1076003)(6666004)(66946007)(86362001)(16526019)(7416002)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?QwGNvOy33PtTW7Nijzp3mWd3LmsjXURgezYEtXJ/3KJ94HUtraXwNUHHvy1G?=
 =?us-ascii?Q?Ttx2Ng6TlhlKek5++09pVhVwtDH47z3xG45qpAREUCdx7LbkvlBOapqXdSzs?=
 =?us-ascii?Q?aCLaFS44RLqlCMaATjeGWxuWXREp/Udg7281zfi6xlj7TXUyhg+/8y8CfrK0?=
 =?us-ascii?Q?9aDLOch9QqXaC6PacPfPLH9dIayXy0hlsa5JJgl5n/7QgMuvGKUxxKSiUPv0?=
 =?us-ascii?Q?gZFqlkz43sC2titGYXx0bISh6qvM0CtTRf22o3VqKNBDGi3OKzoAczm9zUY4?=
 =?us-ascii?Q?5ijsLNzm6KocNlrl6JFBr1sPF2Fbkix18yNvczQaGZLHSKB7wTs7che6YArM?=
 =?us-ascii?Q?MLWqk1y3TwTbFJWm6Ldj2w5KpCOnDsxnDLy6a34hf2X1fwwaTmlskf48aUQP?=
 =?us-ascii?Q?mv6uZd7eKZ9Ff4W6fzpmYL1hcOplOP0tIgZTx0JXfGMTbO+lm3/pNOLNXvN2?=
 =?us-ascii?Q?1TG/crRvjOJ+DAoaPUbqVaCqwR6QqGfvYSl0+2klFahhygeD9Y0QLlC2Gx70?=
 =?us-ascii?Q?uDD9na/wn3hwU7wi1mLGWV8tPeRBbSYs+cS/vp1joC6KSTkH9QXZLPQT3j1a?=
 =?us-ascii?Q?zV2xQh5HLUzSXti4v+FbIN1h5kupGC9UzirSD+48tBZSndE9xe1b4fGY2DKS?=
 =?us-ascii?Q?rOVE4LXoDSjQ4IItc3UEglB8Kc6oQcY6Ok4JlO6u2OPMrDStVCvAERTUAa1i?=
 =?us-ascii?Q?Ik13d6wlppQdeDCh22mWbOauHSBFJXXI8ziRwk0ogTxpjuNnTH31jTHIVxns?=
 =?us-ascii?Q?/8if8ikPFXA1K4sqtPRjtFSG93PeAenr6yH7TeTM6jcF8VWzE5xkasJO99c8?=
 =?us-ascii?Q?5Ood8GMgdkJ5ZsjXCNjG1sHukWPiUhwYUN22UKIL6XIxoDBwiUCH7qpS40qH?=
 =?us-ascii?Q?/9jA526I7XBf1dQ7hVU2+3p1l8BPNaBooAQlkIvG16Hzuh9xHGAaUpxw3vMI?=
 =?us-ascii?Q?KTLjFDTg7PxX44ZWzsoh2mDFozW+hNJNOLPp6/ewZlmuQWibeRwGbR/QRyAQ?=
 =?us-ascii?Q?ZFn/1BLodc8gXmNIDdkfd6KKx3ND1EQuCFzVV3nsHlY3AbA+ERUIidDbAFgK?=
 =?us-ascii?Q?lBo3BLoQ62LDmQr9WvOQECrM5sIyMNiEgCRtHOATabJ8O21HHjYvYL0lyj0k?=
 =?us-ascii?Q?el646MfbMeJYDG0kQzvCI16iCl1QGrP2SwqjYJry4N+BRUyIonXMArCue3T7?=
 =?us-ascii?Q?pjncuTBxxdJtjyOW4ueS0eoZs2FtVtaXdjhT/rzOkuMQOJSfuRupBT09enZ1?=
 =?us-ascii?Q?9mwa9oVuTMcBz5Ad1JQuZ2bj5gIW581GrZ2TK/xzNnSn8U/yKw40Wjdnws/B?=
 =?us-ascii?Q?2+zcPupwR4NOzLBhjXBmMoet?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35b9efab-da46-4724-fbeb-08d8fe5aeab3
X-MS-Exchange-CrossTenant-AuthSource: BY5PR03MB5345.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2021 09:02:51.3261 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PldfhMBpt4oFZR3gmxAUYbxHeG3ziJYeUfLcDCWsJw/cObVDQfU/jm6hxE6LP8we/VDQn9KyppCw6Ylt91KAmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5048
X-Mailman-Approved-At: Tue, 13 Apr 2021 09:09:37 +0000
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I met below error during boot with i915 builtin if pass
"i915.mitigations=off":
[    0.015589] Booting kernel: `off' invalid for parameter `i915.mitigations'

The reason is slab subsystem isn't ready at that time, so kstrdup()
returns NULL. Fix this issue by using stack var instead of kstrdup().

Fixes: 984cadea032b ("drm/i915: Allow the sysadmin to override security mitigations")
Signed-off-by: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
---
 drivers/gpu/drm/i915/i915_mitigations.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_mitigations.c b/drivers/gpu/drm/i915/i915_mitigations.c
index 84f12598d145..7dadf41064e0 100644
--- a/drivers/gpu/drm/i915/i915_mitigations.c
+++ b/drivers/gpu/drm/i915/i915_mitigations.c
@@ -29,15 +29,13 @@ bool i915_mitigate_clear_residuals(void)
 static int mitigations_set(const char *val, const struct kernel_param *kp)
 {
 	unsigned long new = ~0UL;
-	char *str, *sep, *tok;
+	char str[64], *sep, *tok;
 	bool first = true;
 	int err = 0;
 
 	BUILD_BUG_ON(ARRAY_SIZE(names) >= BITS_PER_TYPE(mitigations));
 
-	str = kstrdup(val, GFP_KERNEL);
-	if (!str)
-		return -ENOMEM;
+	strncpy(str, val, sizeof(str) - 1);
 
 	for (sep = str; (tok = strsep(&sep, ","));) {
 		bool enable = true;
@@ -86,7 +84,6 @@ static int mitigations_set(const char *val, const struct kernel_param *kp)
 			break;
 		}
 	}
-	kfree(str);
 	if (err)
 		return err;
 
-- 
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 978A637F326
	for <lists+dri-devel@lfdr.de>; Thu, 13 May 2021 08:40:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3BA46E819;
	Thu, 13 May 2021 06:40:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2041.outbound.protection.outlook.com [40.107.220.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74F746E05C;
 Thu, 13 May 2021 06:40:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I7ITl16xTsB8n79N9ObK8nwXpPs0Zxnnlruwew/1ES/N0h0Sh+IODNGV43E7CDWyokTN6mDprx7s4L+YVY4MS4Zt35/MUNPEmN9SVkD8yGrmknmSYfLgxDQfVdSz/MJjy84udVNnH/T1mmApsCGo7aYl77mHgURDrfJ3Qx+huJgIsNivqdRi7WMoKfZBSelvW0mUPJTWSE+2wjTLTp4TkYucUk1hTpGkhq9bs06L6+LiyiOuxgZzZMuie0AbggBaFT8oW3qMffx9Dx6/QgeNA2ErZQetSarB4Lojys2+6t4kGN3tYRqbFpQECHriwJwOjonNQ8w+50YNViTmQPrqEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pXfJlPn00Ee4R1bjyWY+94pyHb6aKlnAHCG4D9Y7WRw=;
 b=T8vjkkSlVAnkhdznw9O31wjW0xMmN8L5Byt334pon6HSh10/uW3m4IBAZKpb4jvm2hv7ywDXhXEcw/GHAA/JlrrFbZS7aun1XVkndvrtrN/gXXeX3dbFgbsm+WEakoAbq3Fyon04Fn4vUiltAo80pbasqMqVoBvYSe3DKGNKgk4EVuVKI8AC5KOlT4q/tb6hdJAyjE8GCc3nOeKqmeQARU0fjg0f0gXzmlw1xqvyvlY62wLBM/ZveG6MN6uPGGMxV9VFTCheDyLsbSZwUPQA2+Kb+fQblmZFzIcY+cMWMqyL3+s1z2SdpCUTVGhZf8gyMWEJoKzY7RUYrT2qiWFW5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pXfJlPn00Ee4R1bjyWY+94pyHb6aKlnAHCG4D9Y7WRw=;
 b=LpU9AYbfQ7P44GcTFpdf3Scy/khrokfVOynpyBteBGNhsqCcBELJp9LegTJWBMfgT0HBt3M6qePsrlSzO1NaVqYKPsvHB0DbVGCIgJD6ip/tfUfj4I5GlgqUhL18t+cWomUUD60kuP8X8/hd0TZyqoAJm8bx/aHCccrgRuW4UUQ=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none
 header.from=synaptics.com;
Received: from BN9PR03MB6058.namprd03.prod.outlook.com (2603:10b6:408:137::15)
 by BN8PR03MB5041.namprd03.prod.outlook.com (2603:10b6:408:d5::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Thu, 13 May
 2021 06:40:03 +0000
Received: from BN9PR03MB6058.namprd03.prod.outlook.com
 ([fe80::308b:9168:78:9791]) by BN9PR03MB6058.namprd03.prod.outlook.com
 ([fe80::308b:9168:78:9791%4]) with mapi id 15.20.4129.026; Thu, 13 May 2021
 06:40:02 +0000
Date: Thu, 13 May 2021 14:39:53 +0800
From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Chris
 Wilson <chris@chris-wilson.co.uk>, Jon Bloomfield
 <jon.bloomfield@intel.com>
Subject: [PATCH V3 RESEND] drm/i915: Fix "mitigations" parsing if i915 is
 builtin
Message-ID: <20210513143953.1f8a82e7@xhacker.debian>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.147.44.204]
X-ClientProxiedBy: BYAPR02CA0056.namprd02.prod.outlook.com
 (2603:10b6:a03:54::33) To BN9PR03MB6058.namprd03.prod.outlook.com
 (2603:10b6:408:137::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from xhacker.debian (192.147.44.204) by
 BYAPR02CA0056.namprd02.prod.outlook.com (2603:10b6:a03:54::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Thu, 13 May 2021 06:39:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 35301b51-949f-465a-f0b8-08d915d9eff6
X-MS-TrafficTypeDiagnostic: BN8PR03MB5041:
X-Microsoft-Antispam-PRVS: <BN8PR03MB50411CC299AD088EFFAE0D59ED519@BN8PR03MB5041.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OehM+pyZrDIb3o69uOfbZIfBMXtmD5rvrsrCdIeA9VZvtwpiKGhO3p81nYP3X2DKZ+voTUzl3h6Da5CTQX70fsINLjNDliuf45SuxPm0v0YQoIUmqpLaQ9nGfOqZ3wJ6kKYfRdHxWkYwwS4Ppc7UN+oMB2IAzSD3ITDHmi3Ao1J7lZgiSJspwYCWobQ0HOBc6rXdJlE+tKdtEZAjcofjspPtyiSqWajTtS+P5+qEyqbb5KUCBu1HAIAxgCSPQMkHJt9gHdn1DbYPptKbuJCFjDOxWy71KGRmFlxGmUFDLJASGNOvy8ZF6NEETPFmkM92WMpAo+gI+Lc5BEoYlnAhnSv7r/3d/yHnjezX+0aEg3gQ/hjogHYjpmCM/zNLpKkWmUtpwn4wWq/UhelbQtdTNphqBFgfEZKK0qQJIetnesfHz6houVRMYWV3+GGrIY9DKBo0EaCSfFY+kNmoHzXkDohGx8TVAiHxjM+V6oPXmaaN+QKMmQpxcYKaxr2pd8vluVnLjnR+aYcXdtTsl8WL5nFiWHRIvy9vtHjWxb3GnIyKtW+tzu7wwtXeQdU97G94aVjay0jjLn5ndlLgP7J57o7qU678wDfBuAKuNmVJc18fX7x9sExJuCxBaLU2FBeGD/QG00sgo4zvAI5rBXnjhenUOj2RxztL/QmtwBXl5Lo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR03MB6058.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(136003)(366004)(376002)(396003)(39830400003)(8676002)(86362001)(9686003)(66556008)(7416002)(52116002)(16526019)(66476007)(7696005)(478600001)(8936002)(55016002)(38100700002)(316002)(38350700002)(956004)(2906002)(110136005)(83380400001)(6666004)(26005)(1076003)(66946007)(6506007)(4326008)(5660300002)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ouWjBckXTmvZAPe8F+0YSf1IWG6QofDIcyST66l08KrFDRiGn8S/ZhB11p7q?=
 =?us-ascii?Q?2pPGbCjc4S+YKqYLFsZSKI11Xpwc1SAl00wfnTZFs90beDvNLFjXXJ6E8tlJ?=
 =?us-ascii?Q?yjrxabutLeEJvWRDOuNnfG/cJNsqKsWwgG/kJVm/iivi9F7GpBQ2Bxwd0I2A?=
 =?us-ascii?Q?BRK0NbfllB8b6VZ4x9ZHQgvzRZhnOpkhmJvJHcHOMUxfYCyQhQtqIYfU/ita?=
 =?us-ascii?Q?NFF6/vaPIpXnSfpygsujZdfo/q7OP0Bu/ccGm8CIN8WNmeqeInZP/KTjDig2?=
 =?us-ascii?Q?aMCO9ELLTLg0dx3ENCAs8Qiby+yU6XggYTLP7M3VRX1LQ4OPvydIdFIznQKx?=
 =?us-ascii?Q?Gxjd5m/F9tPny1km1iSjkQxGNp4ux4dunB/StDXDPQGQBQf5rGzHVfoISNjO?=
 =?us-ascii?Q?eOYQUTCNxInHi8Hh2CkCBSNGiza0vz6OIwcXIzDjRqSiMVrNQ4PFiqmjgESC?=
 =?us-ascii?Q?lN6Keb5jMLM2lJ5SdpDkR/h0NleyzZdwbB2hxlq71+Nnu+CRYsJWI3AUWSDX?=
 =?us-ascii?Q?nAAz5dmSnyFQD+uNnC7FEng2dmHhKgVltidBKWuF4jsfKXSMw9hTxcy8xJQu?=
 =?us-ascii?Q?Rl4st3LtfkkOMk6bwt3x1mKyY1ju9IBiZ6zSlGTUVTW+hV3A6NFXjNR/lcUM?=
 =?us-ascii?Q?HRHLhp128JE7ai4Wbt23r5yx5jWI8CZ7158lk9zdLlSwkwzpE572xNQo7LwV?=
 =?us-ascii?Q?1+7Bsvm5oFTQ1v8J3DiOOo5xS42dBR43It74BJXzYUdPW4LdLsT3q45uPyyF?=
 =?us-ascii?Q?R1OjxT1ot4MdXH6MMbfYjTyYd9X6b5fF1Tw4HUYbe5KMms+MqkflcYNWT32o?=
 =?us-ascii?Q?WK1Wo2sjndgh4AHIC8kDO3yCjIoHBv/10THi5tSZzPLK5WiywM7xx7gaDm1r?=
 =?us-ascii?Q?0Ni1+ujLl6vgpcKEtc9uVy8YtxpeKcWbZo/S8gRtyHgB6i55ektW1qblddfh?=
 =?us-ascii?Q?4diAQSWuB/3yOBN6KG85ksbcBy1olZi+vxYFOl5z88Qu5uz+ArdIx0/YC5Zj?=
 =?us-ascii?Q?qOpLM2l+r0uSGdnQMD4QbW62wExiwIRByP0aspc8HOxSLYqaNNz4OgnlqhXJ?=
 =?us-ascii?Q?6KF7pVVj58zSjys9ESgDf2p9ku894jbylt9yWjMs6tUsDAOngo5CuRyihM7X?=
 =?us-ascii?Q?4p9zSXvO8T+NO1kJco/8vZiXRGTKm1Oe1NO7MDEd/h3yHJjvy6Is5eMfhpsE?=
 =?us-ascii?Q?yWaL3OkbaqtSpCzhFzoucb4PTIgFL9VS65QZJHc9Lz6XTI0eVqTZ/HFp/110?=
 =?us-ascii?Q?c9LVEap8BBwpLXrOr774ivBq6rtr8XiUZufeAZU+4R+of9NlLiRO7tf+DilA?=
 =?us-ascii?Q?I1esXXuzEiyDx6A2jGcXXkZt?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35301b51-949f-465a-f0b8-08d915d9eff6
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB6058.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2021 06:40:02.8168 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tLiWzjiqSp/cL4Yh89nHUrUNuB8cLG//DIbPxaX2PlsrHRtzRp1XXbfkTYoi0mRNjn3UDwdylMN45hQ77Mp+eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5041
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
Since v2:
 - Use strscpy() per Ville's suggestion

Since v1:
 - Ensure "str" is properly terminated. Thanks Ville for pointing this out

 drivers/gpu/drm/i915/i915_mitigations.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_mitigations.c b/drivers/gpu/drm/i915/i915_mitigations.c
index 84f12598d145..70944764a77e 100644
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
+	strscpy(str, val, sizeof(str));
 
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


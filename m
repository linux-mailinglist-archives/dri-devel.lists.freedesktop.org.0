Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FFF0A1021D
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 09:34:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4DEC10E44C;
	Tue, 14 Jan 2025 08:34:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=inmusicbrands.com header.i=@inmusicbrands.com header.b="U5XS0AZl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2121.outbound.protection.outlook.com [40.107.223.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27C5D10E6DF
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 15:28:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xHXgW84EEPtFTfhjq16unnvH1B4tj8rpEFXoPqVTKz+WyCTHx5eMvKZUUzdLY7es9dkGWWsPueni46lCXqEwLUl2e9RzgvrTg/6NzLpVbDHLMSh2bGbIbYFKWeyX+aj1AxLdArbe2H493lPRPTX6UXDRFWByHsO4ab0SQXYtvIrQLLoQ+SXZGezu+tCREmdGutMnhwWlA/67Oe8tY5KYfs3Nacw+SzVi474uHJN+Zs8qOyunYC3mqgPc3GQ4aRJ/40g7/2bYlLF8i8L+QsHjtZFaOTWeOp9FYOKdQyzDHOcWk9kvqlTHc1S5DyRAbJIu4wB+2K8RgplGcS91uZxEcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tsgt/pjIHXHX/3g25D/d6wzDbwkP6JsSbrSvcEOgSUY=;
 b=Qnc+nU4SnW41hMYkZDZpwwpO8ac4mBNSzRzc01cGCBOIl8/a0WOp4vsUZ7b5EFGYGcos+orFDB8X3AU0PM1ZU/DeEpV0Pom4xtsS55J2w2uvRcTwcGieVf+AUi947ZfWJDqENXeejFVbLRo0TewFLmwmN6jnH3kuC8MzHtxYiP84zmIQiRW6bSFTYEOA/U68uUUC2AzUR2x9+ab4aEL7ngMShrrsI4W19Vj/75ya3o8hh5gV0jrJ3AZbODAK1jMk3bG+6yRhrDnoycpXsPiyhQDF/VvTB7pv/o6oNeK+HRJo2ZIxfDjtXBx4wmeX8OskqiCVHDmYp0pp/lfI2OJHRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=inmusicbrands.com; dmarc=pass action=none
 header.from=inmusicbrands.com; dkim=pass header.d=inmusicbrands.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inmusicbrands.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tsgt/pjIHXHX/3g25D/d6wzDbwkP6JsSbrSvcEOgSUY=;
 b=U5XS0AZlVPuMwr7wstoVcgVl/zQWuXR/kjV7RW1ek5bZoD40w/5vTd07gxb9jF5IBXmqhkJYYpNDbCZ6HmnErqHWKf860GPY8mRA9kYo2UPU+vn9FbdBnvsb3Lrai9nrDAZpcnLutlyoGbqYHps6+VeemkOIMHggWtUjfMqLQ4M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=inmusicbrands.com;
Received: from MW4PR08MB8282.namprd08.prod.outlook.com (2603:10b6:303:1bd::18)
 by CH3PR08MB9065.namprd08.prod.outlook.com (2603:10b6:610:1c9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 15:28:07 +0000
Received: from MW4PR08MB8282.namprd08.prod.outlook.com
 ([fe80::55b3:31f1:11c0:4401]) by MW4PR08MB8282.namprd08.prod.outlook.com
 ([fe80::55b3:31f1:11c0:4401%3]) with mapi id 15.20.8335.015; Mon, 13 Jan 2025
 15:28:07 +0000
From: John Keeping <jkeeping@inmusicbrands.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: John Keeping <jkeeping@inmusicbrands.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] drm/ssd130x: Fix reset timing for ssd132x
Date: Mon, 13 Jan 2025 15:27:49 +0000
Message-ID: <20250113152752.3369731-2-jkeeping@inmusicbrands.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250113152752.3369731-1-jkeeping@inmusicbrands.com>
References: <20250113152752.3369731-1-jkeeping@inmusicbrands.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO3P265CA0015.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::20) To MW4PR08MB8282.namprd08.prod.outlook.com
 (2603:10b6:303:1bd::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR08MB8282:EE_|CH3PR08MB9065:EE_
X-MS-Office365-Filtering-Correlation-Id: e6fb6594-5004-41b1-e0b0-08dd33e6e171
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|52116014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DK6erbnwaY0El1S7LaaL5Zu38irs7kCDch2Kw9YF+R+7Ul2gKtOHQBdufXOR?=
 =?us-ascii?Q?wNVIdEJ2ydG6tdVYhDYaYy29/K80hKBBg0db4NWocZkn16jrSXGoja5Ty2J6?=
 =?us-ascii?Q?nCdgVcAvYfFmwuDvGrNtJ1HE0Cv+WwBNeFVAmQZSaBQA6UAqoZsscw5bVblP?=
 =?us-ascii?Q?p4qkr9JUPVgH9Ek/f3uOEA0/6q/BFUSXXHtCa0ssVzTE5LdDDW88OqBmL7IL?=
 =?us-ascii?Q?En8xCux+AVu5+P/E4qDyv2UkPF1RnwPLGWOZk3jytsE7r7N+WvyU1VD47Pav?=
 =?us-ascii?Q?LJgCfVN3qGda51w0yBL5JEhIrx/YBxVZeJyVytxGzGA/SVBtiRHcWy3EJmPu?=
 =?us-ascii?Q?p+X96R/XRV/+xfJV3yn/h1VlnpkJtk9RBsNo/cxqq3MzAznS2wB/TpWcdraE?=
 =?us-ascii?Q?TUMz3ZlsAVfdznnIWahyu3bv64tu96utvHhBodO2i96oGC7Df2lmzhmQfXED?=
 =?us-ascii?Q?7/GhZRo7DXTI7QZFliuwb4aPNWc7STUFEpApzySgO/9YPo64rFEzPHrfeaze?=
 =?us-ascii?Q?S7mvBozW8EfmV+1gWW5QjTvVO6g2GeWmClCGBtFWF3w25Cmm7CmtQvojKloe?=
 =?us-ascii?Q?wPj/QGJPGJ1Iy1UKm4u/alh8vTY1CAW5lVWPoxYPqQPv2fAC7Ek5rYPwdOb5?=
 =?us-ascii?Q?M9kat8HKhmxMl2BGUr75ouz/mcVi+PCsuW1K9Nxk/wyt1EGixgSR4QGez8xd?=
 =?us-ascii?Q?LVJYYPytK1NLISS4kEwTM7dt2u7Ln6T5jw49vuQvMesKEMpQX8iyFNOHni5e?=
 =?us-ascii?Q?U2aotswnKFHiaO1BXfoCkqLWDv15tVyDiUkhXTfPS/ccM33TMjnHWwLaW9pB?=
 =?us-ascii?Q?LCfUJ2RQjmKGZmNGwMiL2ZKUgqcdXgrindBRUeNsQafUCpJMvnHxgcu4yg32?=
 =?us-ascii?Q?rsv3pajEzR10XdlN27QrtiHvHuaSv+R4CIsPuhi21fl4HOs0Gq9eOV3ZzZI9?=
 =?us-ascii?Q?6zOUAJHxv9BrzbZh19TSt6bHSo6wTtwuwggwtRA1ipyVIU6HJZLbPxXsWoF1?=
 =?us-ascii?Q?cCd54gz6VIIMvSvgVfOr6u12Y2iDSmJSjycqu1TTrPZbAs+UadYxCSwO0Q02?=
 =?us-ascii?Q?F2YtQ2LcuWBILwSz3toSltr4cxjSpJX7htIv19QxbruXIfXgHnRWOd7iJv6F?=
 =?us-ascii?Q?xVppYvbv2/KU+nli/HvZ2iu/Qmr3e6j8ARm7UKNjFPdQR0rUNmvRndrGb5Bs?=
 =?us-ascii?Q?fgXiv3hGrEfHjagtLXMZgjzcUFsmj1LuccE1G4XU/IGC8jord7TFX/3rAkDi?=
 =?us-ascii?Q?R3dIHxcjexPgwzZ1aLkq3KROiA0i5EU7oElXkFmC097qDkY7pjxP+RMZJKMj?=
 =?us-ascii?Q?9dGVYj6eXPaKYnOuWmXj+KtNR/JnXWMSn/guzGg/f6/4Jp2WKUapGqN3KT8C?=
 =?us-ascii?Q?+90JdDVNrgd4ipCZkdVIQC9ElsnlieE7rYiJOKYW64eIUr0WEyAxJ2QZfKqj?=
 =?us-ascii?Q?JbjOpP0TDBa1wEwxsiP5ZVV/Jp3LD7Vy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR08MB8282.namprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+bQh10O1esLEWjLqnMUGDezU7ToG9qFt5MiuFUgOeNy8cpUmKeetZLSW59hI?=
 =?us-ascii?Q?jgpyKixHrTjAWQStcKx0PwzrgHP15jTteKL7XL5wND3/d3S0MWJ/iTZBq6Wa?=
 =?us-ascii?Q?2NCmzpCq6lWzMl5SMXIExJH0BPb6DNxb6F4hyhGbJGllMH0uClYuzan1kVRt?=
 =?us-ascii?Q?Lrrz5a+qYgEQHEtjUjmzq3BnP737Q46df/RphCPTK1rRaD6wU5mrVHpw2AZ5?=
 =?us-ascii?Q?8Za2xcJ7339M4Koymkid8bkzt0gH4RqhT4dpZBHKOmqtMB6tOp0SNKSOKgwl?=
 =?us-ascii?Q?pmTiYvrf8/IYMVimHRLrNLpLCN6/PcSTGNcsUlmppW7wa6sD18r9EjZ6psUi?=
 =?us-ascii?Q?n7g+BT6vOBkFmk2V/LNoGqfXa03Og0sJSNRyp7evxwRRwG7SdtlKYrerQzRP?=
 =?us-ascii?Q?ozWfBl6P4dlrEn1o0/wVYZMcD5+VZTstdC7hn8lYXnSha9kgVf3GKYae30NL?=
 =?us-ascii?Q?1NwsgO2/5ttLXiueqpHyb3ujVhTRL1FUM/C3kRTNhIngiQh3H6sT976cnsrr?=
 =?us-ascii?Q?fMMtcWAYC15dbJItn6hzkAhwCJit7UC/OpWrC8LEBrl7pjMZ96AVcslfpGfA?=
 =?us-ascii?Q?udcWiUI3S+CibXP6jwsyiT30r3WS7jfRn2VDbOwmgkvPLOQsRYoLDeUAIwXP?=
 =?us-ascii?Q?V/AXffF8d4T+fhepFqWYO6ZN8DjpRPad1c5ZpwwlbfUonUHSFlblxsTvjHnF?=
 =?us-ascii?Q?+B/hJbm578EkphOPz/QCvUFKhgZdZCtARTzX5YUKimSsyTpHf9BR2B32EJ2/?=
 =?us-ascii?Q?c5AV6gYxSuXZM/QqamHeAHyVgOwzzxCsOTSlYDGpkX+kTnjuD6ct8FivI/wy?=
 =?us-ascii?Q?MUsacUO3pLyDO09zV2XXTEq6JNUANZkqNuymCpvnjquAYHGS05MM2vNNgxbx?=
 =?us-ascii?Q?NDYvAhj4ygSEzc0iXls4pVJ/nwZVeT/yf9iyVHHTbbR0Kfm1JEr6iyJ8Jguh?=
 =?us-ascii?Q?prbgyLt3V05wpKmhEPSpLFVSRJXtive7hcY3GRJhCsdLXsmi/DoqD0ne6+CG?=
 =?us-ascii?Q?2oiW1zcz4/f+oy1ps6EVPcsRU3ttMTah3Bx3ZEXjrlERkJ8K2CjvlS4vNBca?=
 =?us-ascii?Q?NPuGqxaYE0XAWcnZ/Uc+2v9x3mZ2aLgmX1n4L9MVycOoUBhVmpL49j1xNLTV?=
 =?us-ascii?Q?SesRk8DtCnweLTk0cShyGMr1yH6JtsIVcSK7BxMsp/Mf1zOB6VvJgmw/s0EC?=
 =?us-ascii?Q?9rX9rzyP8xHMvTS+yzEfDhccJyCpYjegp3OMSqYmnmCAQWi69or9p5H/yNzJ?=
 =?us-ascii?Q?z1EzNhyphRxrMCRbf/06Z2nOkcKIriK3+5Hw3EVudnbALCAb9GrMrniqRKAN?=
 =?us-ascii?Q?b2DqjyA+Ik950bjIf5aBEd2oibHP1HFLnZnnXT/ACjsShoGDrY8oa67CHyPT?=
 =?us-ascii?Q?Qt9rV3eOPOoR4Ui3PPk7FN+2LHUfmDuWuRjduB/lHi/9tvRvgHr4PNZ0vzS6?=
 =?us-ascii?Q?tum3vX7Yl5Xg72JNCd3a4yZiatLb9tQI4u66uA+fcLqPb8gvjnUqxVxY+A4Z?=
 =?us-ascii?Q?/KI0TzqEecX4kU5fsl0niWz/6zIjcI45hvNEfz+ChHiMxxGDYN5vhLeyK0PX?=
 =?us-ascii?Q?YDqDgM12keguzJvdx821ZRTapaujVFFZ//yzDZTn5km832D5TLYJ2HZJfGEr?=
 =?us-ascii?Q?bQ=3D=3D?=
X-OriginatorOrg: inmusicbrands.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6fb6594-5004-41b1-e0b0-08dd33e6e171
X-MS-Exchange-CrossTenant-AuthSource: MW4PR08MB8282.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 15:28:07.7138 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 24507e43-fb7c-4b60-ab03-f78fafaf0a65
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NOtP2Xyi1U763F4PYOmVH0A9gZBvhQILuI9iZZF7AHIwAB+hcLHR/CtG167hx+iwtoMlwyVsBuRxFgE/h6qqLwdfceFtpGXGYBH0kBq7gx4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR08MB9065
X-Mailman-Approved-At: Tue, 14 Jan 2025 08:33:59 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The ssd132x family of chips require the result pulse to be at least
100us in length.  Increase the reset time to meet this requirement.

Signed-off-by: John Keeping <jkeeping@inmusicbrands.com>
---
 drivers/gpu/drm/solomon/ssd130x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index b777690fd6607..2622172228361 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -363,7 +363,7 @@ static void ssd130x_reset(struct ssd130x_device *ssd130x)
 
 	/* Reset the screen */
 	gpiod_set_value_cansleep(ssd130x->reset, 1);
-	udelay(4);
+	usleep_range(100, 1000);
 	gpiod_set_value_cansleep(ssd130x->reset, 0);
 	udelay(4);
 }
-- 
2.47.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED7B4B1C47
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 03:31:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E49F10E9C2;
	Fri, 11 Feb 2022 02:31:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2131.outbound.protection.outlook.com [40.107.255.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6483310E9C2;
 Fri, 11 Feb 2022 02:31:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hYaNSdFot0WjQEFauAxaxF7LZMAqV0LJMaBNOTZvAgVThCx3V3tVVkxNQ3QAoV8ylW8bJhqipq105DNTzkZEL3bJIYgyoXPyX41UvylIzSl3jPdF4HjC17l1R8XL0nJvybMkKAcgIeUW0EhbbG/zXYQmRiEGj+V8HYnXuZMmuspZ43HrnTD/jrCmlf1Pbp22VtIb6bnnm4s9wqsb2yXXfQnMK0fxgGRLlmfgsidCl29ECxoyiFzTGE6AdgJN7QY5LT34kcer0KAbG1bK6agXSoFiZC1Ma1F+IKW9BBajDbDs7akIwZSTi4ecxXB22kJszWuh7mFvpSKlwdLFE2D9pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tu5+LN5qA0ySjgXs2NbBDr3TFxqioxt/13v16/cZ4jU=;
 b=P+WSgNNqf6CMi9G4UmRd12mMtvjq5KTDtvpzNqq7l4GbBJCMoUlPmDL6o2NIf5zBd9PkkYQXdapyivKOR3tVhDQGqpeajeZt2v2/Qu0B0B0hDX0PxpEdu7P9Mb7PltkS4aZy3s5LNmIz7P2cVnpKH0xwcH8KOt/O3PYrYIb0ZOh1alZ6h97RTYMZPzdZvdN/zF/+x6oHmDrmnidcf1DjZuVhobjxnubw6kCRvVADdvT+hqqLsKdJR33XUVwy/qyAOkIiIZtZGrrXYEQQHaGm8w0c2LodYDreTEf780oOtq3gNjksapLtSILa+hFA0D0RW2okVqMeyL2AkSBvcZ39/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tu5+LN5qA0ySjgXs2NbBDr3TFxqioxt/13v16/cZ4jU=;
 b=SP+54FHc3BzIEa1Lk/wWwAoPfasJWtOsVsJmIkX4CENsCVeXHnSsYk6rE5XlwXGj8ajYAPx3PCMkk8exhtDNePt0xBEaa0WCACvRZwy9WjWOecox30jG0IkJV6OeHH2GfBRAYnK/+XRgttWj8Eyj/RQX6CSVc6MxtMO+KW9tV+0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com (2603:1096:100:37::17)
 by PU1PR06MB2326.apcprd06.prod.outlook.com (2603:1096:803:39::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Fri, 11 Feb
 2022 02:31:21 +0000
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::80b4:e787:47a9:41bb]) by SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::80b4:e787:47a9:41bb%4]) with mapi id 15.20.4975.014; Fri, 11 Feb 2022
 02:31:21 +0000
From: Qing Wang <wangqing@vivo.com>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
 Jens Axboe <axboe@kernel.dk>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>,
 dm-devel@redhat.com, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, xen-devel@lists.xenproject.org,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH V2 2/13] clk: mvebu: use time_is_before_eq_jiffies() instead
 of jiffies judgment
Date: Thu, 10 Feb 2022 18:30:25 -0800
Message-Id: <1644546640-23283-3-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1644546640-23283-1-git-send-email-wangqing@vivo.com>
References: <1644546640-23283-1-git-send-email-wangqing@vivo.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0178.apcprd02.prod.outlook.com
 (2603:1096:201:21::14) To SL2PR06MB3082.apcprd06.prod.outlook.com
 (2603:1096:100:37::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 54f17a6e-fe93-4639-c032-08d9ed06975e
X-MS-TrafficTypeDiagnostic: PU1PR06MB2326:EE_
X-Microsoft-Antispam-PRVS: <PU1PR06MB2326C71B3F3396DFE0CCDDF3BD309@PU1PR06MB2326.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Yqxj2iWIIuzZawtwdzqczDFvGCSFSic0MRN2Sf1CAFjg9Tkt8fxgnGTFe2HJnFX4Kar1GtowNhQRjpm9IFr+M5umWukIXzV2k/j6QtDDF7kU7lJUv8//Cpt/c2yjdw4yf/vh+Re/22Ux4aPtLuI+xsbDPxpx28E7ARpvvqcAxjc9VitMYrYAo2FVa5Y/eUOxzdeTEX+S1AndOk8GsUp06siDV9HGqWYtrnfP8VMQw7WWGV9hrG2U2RybmaDP4i2XZHImaMKzeJtQjqQLkJo4Qyykh9Jly5Lqi5BTSxSkVTSoOy2eBSTWnUnFJdKX3HcsqrsqhEPsZR4Lv3KW6OSUYCe0rl4jeUXzBVO3Gl1zbo7QieZEHMRBZvUu/xbcmuk4ouGKiwzDHumQ6zlSA3VEefE6trY+JiaxCcbwnizpgC1axElAFEldePYE1u2fPqawiNDlT/DZCJENGsUovimfHdB3ywzX5lF8qz1S7MWTEz1xleNSAsvzWvcNJXehKZnHMW+DBJrOg+friLegy1el0p0vXIxJvCIwam4AS5ye5G8DnAccCyhqKoT0XbQdEzw8YHZBslBXHHOltVgW6B1vd4E0ZqusU0FqcS6MbV0MhvCD9ehMRqUDzjKdS5Cjuaajj9rY2zNqgb/VV3dVFYwxqEKy/R0YJOtJcbUV1ffvQ7e7xmpYoIftASyuoTo4JrsDKkISBVnfWP3fVQ4aO0fsr2aBpJwvQZn7SjJWpSzlRhLa07VmpmWgVOa9XKLTlA4z
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SL2PR06MB3082.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6486002)(316002)(508600001)(110136005)(2616005)(52116002)(86362001)(6506007)(6512007)(186003)(26005)(2906002)(36756003)(66476007)(66556008)(66946007)(921005)(8936002)(7416002)(5660300002)(7406005)(4326008)(83380400001)(38350700002)(38100700002)(8676002)(107886003)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EPj7tTLWJhAnjd+8vEpnCLOQzaZHf/ldw+3lsmz1AF3Fva5OW0s7lere35Sn?=
 =?us-ascii?Q?ZMOgw1FMLE5Lmxu3jCbRZbbJWvm6bA49IC0Ovbb1OnlJemmQEr+bFacWNMWD?=
 =?us-ascii?Q?Va3OFIhZQIgjVgjJP/xRUdJLicQN0Mad9GjQRURhZGer5+ZPJXczWo+GeZ3s?=
 =?us-ascii?Q?iUaxQ1lmWlVIMDwGXFWEJfTQvI5ZRZP6ksty6+l0ydTzHE/Zr5Ggfo6H4TeU?=
 =?us-ascii?Q?RudUrJWvaoWYorQ71h6GZyx4YhM3NkBcnGwNhOKSgLI54p5j8EnWgzwV29OB?=
 =?us-ascii?Q?5JDjTsKgqajNKzAYLL8/WaYNLa85oINkIIbbdSChUrisTDXbSbeeGzqd9AMb?=
 =?us-ascii?Q?AxIigRA4CGawimMxNgmX76GCDoIOu1GLX6cyyjPI0kCEc8H7yISe/3mB9U0T?=
 =?us-ascii?Q?AGIJOi3KDOTYR8F7XeXALtdUF+1Pwv4+buqIsQC0L1LvEJfXA3q3ephs6As/?=
 =?us-ascii?Q?nmXP0Vm4ioAiBdQN/Nm73ROW0FPNtqepqzKVMb+db8UlRdNXm6Mv8q5znjAB?=
 =?us-ascii?Q?3cL+r40iGl+q35H3ZrpAveydnySB8bAV7ZWijgDP3qKEdyXP+OxQfR2a++B9?=
 =?us-ascii?Q?80W27Fr7BNRt0ZrPuXFUU3uOBvUXbCtWndZFS2auUVeyzXgiv65vmQ7d+Hol?=
 =?us-ascii?Q?4aU8Qq69SojHQ7meBT7o9JgGPb9Du9A3WIjUYVyMhwaIAl4KWabe2yyon2mY?=
 =?us-ascii?Q?tNBAX3SOVeXENRyJQv+006yfnkyPYgLVdxuNhZFNnM97/wgjvnsKX6kBDitc?=
 =?us-ascii?Q?HiqMec+w/FWSAn5K9llVLbM5m0rTS8l3GfeBDr4x0/1setC8ZVVOkqYWWrAl?=
 =?us-ascii?Q?/BINkH+wfO55iawUDQRJqglD7czL79mfImS6Dxd8jdxVr9C3iHWnLwo3JQVC?=
 =?us-ascii?Q?bxloKb3tUGsTv8YG92ci7pOF9FaFcpBfmC9OniqngUtf4/dKwrO5Bt7jOevh?=
 =?us-ascii?Q?hrVGmcpemlNks4EyFVo2HPxZLSnDi+7BekXwLQRIEvOVKvSXmuR1KWMi1FLs?=
 =?us-ascii?Q?+yOy7bZe+a9oNsOrw55+F86vlxipIoWUUdjoFQ+RhY1Rg7uGyRKhCe4aOXLz?=
 =?us-ascii?Q?8+G0wWvrjLvjMbapL/Y4CqNqmo2S1R+3UegGhAfetpqpNYEbqtlhrvGSGOY+?=
 =?us-ascii?Q?v7gLGmLIcMHVuGouCr7Ti8nFTx71A9QYDVqSWVgUI0y6t4Qmg9cH1k3IZRpt?=
 =?us-ascii?Q?SNFo857/WQHjaYBzjshbRuYnioTsySGjBF3jSlet1fKrE+gTvQ5KdEyGjwd5?=
 =?us-ascii?Q?AwA9+rvBBNQwBoRWAb68ln7pXoBTzaLU/YkFW+me5Claj0MDAwaHGZMd5Pcf?=
 =?us-ascii?Q?XVY6X195ZHQQWfVCME+ehx7djb890wXfiQstqNpRKrhztkgupPjeda0N1V/A?=
 =?us-ascii?Q?/hT/Ga8c1dx0hOS865ftnA4dYvKEGZodAB+z90jH/LCPw9yXfgqZswjRJs3t?=
 =?us-ascii?Q?4NHPpjm/8i69Y16vaOdhED4xQVLHhQkMDAS2C0V3pW5no3mjneytO8Fz4IR/?=
 =?us-ascii?Q?rR3jLp9AwYZe863eMYhzZfpgbi3Qqb/r/shW1JWWhLcC1huJq4bFD53+8BYb?=
 =?us-ascii?Q?0v34Aukej253CX40zwnXz6PJO7EXeWVIBJJxNvFrZZt0u0mguAxCR6uSdjGT?=
 =?us-ascii?Q?LktZppNmqcNY60VH/nfFwUA=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54f17a6e-fe93-4639-c032-08d9ed06975e
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3082.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 02:31:21.7447 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o5ShcZbiCtmLryyUEfbOWjk1acGLL5W9vqCQ+h3lPfIcXbBklSckOaIfy/WuPiY3vyh30C7ya9v6MlU7BMzfeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU1PR06MB2326
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
Cc: Wang Qing <wangqing@vivo.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Wang Qing <wangqing@vivo.com>

It is better use time_xxx() directly instead of jiffies judgment
for understanding.

Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 drivers/clk/mvebu/armada-37xx-periph.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/mvebu/armada-37xx-periph.c b/drivers/clk/mvebu/armada-37xx-periph.c
index 32ac6b6..14d73f8
--- a/drivers/clk/mvebu/armada-37xx-periph.c
+++ b/drivers/clk/mvebu/armada-37xx-periph.c
@@ -25,6 +25,7 @@
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
+#include <linux/jiffies.h>
 
 #define TBG_SEL		0x0
 #define DIV_SEL0	0x4
@@ -541,7 +542,7 @@ static void clk_pm_cpu_set_rate_wa(struct clk_pm_cpu *pm_cpu,
 	 * We are going to L0 with rate >= 1GHz. Check whether we have been at
 	 * L1 for long enough time. If not, go to L1 for 20ms.
 	 */
-	if (pm_cpu->l1_expiration && jiffies >= pm_cpu->l1_expiration)
+	if (pm_cpu->l1_expiration && time_is_before_eq_jiffies(pm_cpu->l1_expiration))
 		goto invalidate_l1_exp;
 
 	regmap_update_bits(base, ARMADA_37XX_NB_CPU_LOAD,
-- 
2.7.4


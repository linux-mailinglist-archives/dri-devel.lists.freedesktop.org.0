Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D793B19C69
	for <lists+dri-devel@lfdr.de>; Mon,  4 Aug 2025 09:24:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C69510E347;
	Mon,  4 Aug 2025 07:24:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="dAPCGc62";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS8PR02CU002.outbound.protection.outlook.com
 (mail-japanwestazon11012029.outbound.protection.outlook.com [40.107.75.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22A9210E347
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Aug 2025 07:24:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wO1mf6QtsX2nLQ0yKbkjzj+4lXcp1/fWYdGLGGIKWl5BlG6gNrtKDcECVuD9FCpKSqB8BcHY3B0Q1cwDPyyaK5Njb2pDRxwdleUa2/lCDVx1s5B2w/ba/zrMjwBLc/qmHFPG12BPSOCRmtUfYvjV+L40YMzkcpg7giJIhi2Q64T01AEjdAT3DBAuCtbiA+llYGFta68USRXumP4EIa9pIBM4xhjUlrnWol5SlwGycRQ21ujb5Nc9jZvrwb/ZqOfQt4PNrdeoT2YJ+CImx6Gt63eGBqKTZsxlpVrra7IZ+1CE0hqFZftxTPyJ9WOCVjfH+Jd7XslIIPIUXF7Yo9jfhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XZyGXp23amXAgVuIUW8FFS60vmPYOrOpiOh6Cc5XslE=;
 b=eYA6yun4DEcPeFW6b+xPmgTNYrUf3YAwR2FfdmMDIqwOHak/k+dmg7jHpOSQaAbHPNIZa69CcXa8zxQDNkG4rXBqEPHtXtDktiEOt4zKRW3iFe5AHeL6WqqpjcCLQ+jRzGqnIOYsuAVrZ8QYa2WM0HQBvzDK4advWklTqyNFNOT/naQzWrs1o7SugvvZuS+LjGXzZU0qMtF655SoOPAkQaiYOmuMcKGzkjaWf+0r3hGo7n+MbqTBjEII0/jQ5/BpFP0oggz+gOHd245r2Yoep8f+taKFxw3THo4LxZVwXlA8bW/YlDdEM8DoVz47SnJhcBSc5+bdfe+kOkr+cGgjnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XZyGXp23amXAgVuIUW8FFS60vmPYOrOpiOh6Cc5XslE=;
 b=dAPCGc62Qj72QOAvMmsA6ijia/xE9bTPeokQNzwWEJ+Iy8AREl6aYdSxex+dDJm6fiab27r+nW59O3zkzIB/358zdUX3Ul4EZfIpBDi/I7cg5gg3xuJpTY18xhnwmOMBIXo/jzE6huwBEs/gZUOQG67OEFTD56bzbB3fsj3RK40q5jusgsoxSE9j/HBiWGoSQ98Zf6bd+JG4Jzk8TbFbZDRlSJmxCzjQ3Jq6k5fCRF41jPKT/sZ/Rx7z4ZuhdI+6e7ZGLxR0x6MOAB2eEQ0d3xuHJPQWzNvI0s/+duatbnaEG3rUA6r28PUJy7dKw+U00LZlbT4qvtxgnVw1PMRBzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 OSQPR06MB7251.apcprd06.prod.outlook.com (2603:1096:604:29b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Mon, 4 Aug
 2025 07:24:23 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%4]) with mapi id 15.20.8989.017; Mon, 4 Aug 2025
 07:24:23 +0000
From: Qianfeng Rong <rongqianfeng@vivo.com>
To: Helge Deller <deller@gmx.de>, Qianfeng Rong <rongqianfeng@vivo.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jason Andryuk <jason.andryuk@amd.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] fbdev: Use vmalloc_array to simplify code
Date: Mon,  4 Aug 2025 15:24:11 +0800
Message-Id: <20250804072413.143154-1-rongqianfeng@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0137.apcprd02.prod.outlook.com
 (2603:1096:4:188::17) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|OSQPR06MB7251:EE_
X-MS-Office365-Filtering-Correlation-Id: 8903d1fe-b491-42a2-9fed-08ddd327ef8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|52116014|376014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CkeIEF4rz2sc1IFF6MJvmhCk6rA5n6JjY3RxuFODwuoswVxsD+LLuzCcVKjC?=
 =?us-ascii?Q?Q8pNVLk9/Cpp/Hz+UIkTZ4IloLTaQrPqHnq9v3yGCyIQFIvQ0mBWV7N1HjZA?=
 =?us-ascii?Q?Gzkq2kb0qloeNIakzBFyjhLPvRX5lXVxJmyKlI/BBkfjxp9OWTzbm1YDBWqt?=
 =?us-ascii?Q?q77lq9ep9wjv9m+LbKUbFLt5SKMDUWQ5Ek57JEv4zbAUlooXfsaRUe+L4VUW?=
 =?us-ascii?Q?7I5XFY96WYLiaPk2CmX6E9rI9szud/HHTvELhhVIRnO2CxcbL+qRtjKSNriI?=
 =?us-ascii?Q?0Ffl4rq9+jUE95bxIuqRg+QZMMy6lhOzeQsqUhV3TMnicK3a0rzEE1THSar/?=
 =?us-ascii?Q?XMeusOBMBcSqYh6UhAzr4fau7T2q8zroH25059hOhuMxL8eOY/BatZym30Ql?=
 =?us-ascii?Q?3y4o1C7qM8GBpW0zhumkKVSC28na6xAw848w6R5ipzUhxqW4lDReoRaWI58u?=
 =?us-ascii?Q?HT2RwwCldXg/9gpy/7TdtX7gCz4WuMXrt8sxnKyXPNHcbSlIIlYHRDEX0fMd?=
 =?us-ascii?Q?zv0lrqOo4YXa6o/cPE8dc/Gc3OilRSQzGDUslCez4scf3ednI4kW4QjRINJZ?=
 =?us-ascii?Q?YBCqgHrlWyD1Jqx+zjrX/HlUybbcEtTNfuQ0k7OSXOAzL7JjWXTmi1DwSfOW?=
 =?us-ascii?Q?pjhDiroc6ZuR8a4T3GyChV8pjbHLm095x/p5r/I5eGLSh2cjQ9rRUbKD7ocH?=
 =?us-ascii?Q?IU9VJuyG+Pn9/2A/X1pmppErZxTkWjcrCc6Hs0yFwGu/0gT6eu88XrAncww7?=
 =?us-ascii?Q?KPPiNubQIRkzWJ2r/NowylB7ttDNFpZWOIL3/18XPzvA11E0B8wChnqX+kGT?=
 =?us-ascii?Q?ennG2u9g+rnZwz94u8exWgSxy/cDSh5pEOrJ9pw0XB2WHmNQQGK/d/bEFvuc?=
 =?us-ascii?Q?kX920oAXVk8Fjtn4ekEdU6o5I+BNMlbMJu0lSkzxih3iM9EaCnjL2iayPDM9?=
 =?us-ascii?Q?hc/dlhh1t03Gu/BZXUPG6EGdJk0gvkUWXYdky7PNbi+/k/7cPeusrRjJcbVH?=
 =?us-ascii?Q?083T0fKZzjcpciLKSn2RksitmDEv0b2Pg98/5u3AJ2vMTBiDcqZrtxRdFHr9?=
 =?us-ascii?Q?HDd+ydC59TMX+wr4vrOzj03zzKFagsShBMvZOnIarfjpZ5b8Aj2CB3+xvn8g?=
 =?us-ascii?Q?IsIVjKEnDg/ZXy+FgIZ+VJMchIalX+Q19+3RrOs+ywh1DE6uwyS+tqUwRsjI?=
 =?us-ascii?Q?2WUeNnxty6aHm35qtAIX7oKwGHg4Khco4mdr29WSiwHjE2os8RwNKdfInJSh?=
 =?us-ascii?Q?sdbZB8167u5pPCY4UKZfV73k8CbrcT6HLVNyL+rqrrZuZP2Tx9Tf9OeueI1g?=
 =?us-ascii?Q?DKsH5+duu+wSGMWMv5g1/g/Vu51XiGiWZqe505Prog4DtZO9JFoabK3UF2R+?=
 =?us-ascii?Q?nZr04W1yK/X8iDI/gHi6VoG4PiDzQ5+aQwXCw191fdF2cSqiqbR/AuZj/gIe?=
 =?us-ascii?Q?i+n/g1QpGkpfA5tRhkVYAhG4yaZg5/u8Qo3xoh9KgwgV28Rh/iU2MA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR06MB5140.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VnNBhaZsy+VHJNTdP/9N9cvOx1ufIExA6nThxRE7CtRttR8XJBH106ZJTAJC?=
 =?us-ascii?Q?uY+VK0kEiRcOo/+yUwlrvAn/1GVVlGncFOXgSMyD98ie4Jl7hhw1aNv4XR+2?=
 =?us-ascii?Q?9ivSRGRQJRBSol7OV9LpPuDBxreDw27Ty0himPblmczRBRjqictO+Ldqs5jU?=
 =?us-ascii?Q?kbBO+lpSWmfACiRN7X2BkFc8NpUTQI/fQGyVhLkLbNFRN6FVVxvqkj80xaA3?=
 =?us-ascii?Q?uC57zHX397ekbdCgbYatH1EPe/ScD2sdfzLVOFJcSdNJihAW7htopGkPLgt2?=
 =?us-ascii?Q?fEo8WYq/rkGXaGyU/f0wihvDyw3h6DcNOSiOPG3ExoREAdRYoq8DX+hTw6jK?=
 =?us-ascii?Q?6TCg5qu/0hUzvJFwoTV/d4JOekEoI4kX6PRSm82xmnmS27UhNtNUnNEwcXmV?=
 =?us-ascii?Q?35DHDi8Fe9/qautZRTtK/poLKlvFqdub/r7DXJSRzbmeXm1zQ/i+vpk2u4pT?=
 =?us-ascii?Q?FD07/47hgMihOguGarDwjOfr7Kf1MFmS8oB9bWqRf486+9vzBTThvXQ8mYlb?=
 =?us-ascii?Q?etmM1EC9y+TyZF0qVBuuA/rX6dt+YD0VyOAPQTiNETU/5G+oWNR8e4qKLkWE?=
 =?us-ascii?Q?GovwCTnPgbSev1otUodZnOXiWpBkY6VhMipEGdz6qDt6ILulXCybHQEUVaiL?=
 =?us-ascii?Q?Vveuu2rfAeDRzPOqHO8mvat48EImk2AO+CMVEC/P9EO2eresRdupIHOWugZ/?=
 =?us-ascii?Q?XAZbBi2Ykbr5ped+SBlTq0zodNeLstS9nxNf2xyxoVV/DATvVSb8YrRppsTW?=
 =?us-ascii?Q?NjJB1U7vPlvrWUMUrMW/hx5Wdl3yOBNuvX1QO/FQhsCT4zj0r5CgnxVxvAe0?=
 =?us-ascii?Q?dc1Gk2STXF8vwF7PgndUmdg0AS6/Ljnz9Zr0pfgtcVoKa4TVT8q7NzYEUlCF?=
 =?us-ascii?Q?8QLoTIPwpTDzD7tQWUEW9ex1QBLTq+BcL58H1WqAbV9qHlQ1l3swNHAUx7Iu?=
 =?us-ascii?Q?gWOA+vkSXdYP55khPq/afqRp7KXdJi2Tjx0Rzj2r6ADqSb2cmbJXNynTGP5M?=
 =?us-ascii?Q?JxbtkhM1KIMtE96X9xNKrq+Rv3zhFragvNjAIN/q4NdTE6G7u6bpl2iTkv74?=
 =?us-ascii?Q?nd7IDotJUKOam+iAZm/1dksLN4vuS06W1TK/wRg4knxamQV6zlPKUhmen+kO?=
 =?us-ascii?Q?9jA3jYRQdoFH9TnKNKNAqy30m00TehBLnzRSPmICfJojxYku4tqyFszeX0f7?=
 =?us-ascii?Q?YAfrVbqi1fro3zc+k35NeG8r+A38IsdzYnQyl+x6DaHBMRf9AYvvSYFeybaq?=
 =?us-ascii?Q?jYmNZihNt+fIPC7J3ioPsdJivuwEMP/WOhQxocBao/wUgxT4hFxryunVW9kY?=
 =?us-ascii?Q?cxR9HxN1H5ttluAjHxK3VcCDY3fwiRYyCslj5jW05sG/J6k0ZwyauV7kemnA?=
 =?us-ascii?Q?tmlBVIIgn8t34EtKNTPCAtfKLuH8hYDugnt2YShAhmkjA0A97FMX37x93ibR?=
 =?us-ascii?Q?ewskmL50IgV1azQ7tzsJwNqrl4WdleTC9eDcWm0yPgcuJm3lWft+QCB+SXdl?=
 =?us-ascii?Q?Z/1MJ2hggI6dj6Ck9t/8ZQWlItJXlZcy5h1PGa9KwrBshT52OtJR4EiRKFOk?=
 =?us-ascii?Q?Cga7Jd4hKJFkmjNNdhetJsgUBqdd+u7WkRX+Ds0N?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8903d1fe-b491-42a2-9fed-08ddd327ef8c
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2025 07:24:23.4861 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H/YqG+kdS2Gg/BYJJv5jI97IvpYgy6jvMccAFHDYGDacrDFl5kn10eJDvxLLYlIljH5Dpv6vz8qb5FfNhJeKBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR06MB7251
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

Use vmalloc_array() instead of vmalloc() to simplify the function
xenfb_probe().

Compile-tested only.

Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
---
 drivers/video/fbdev/xen-fbfront.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/xen-fbfront.c b/drivers/video/fbdev/xen-fbfront.c
index c90f48ebb15e..d8f3bfb2dd6c 100644
--- a/drivers/video/fbdev/xen-fbfront.c
+++ b/drivers/video/fbdev/xen-fbfront.c
@@ -390,7 +390,7 @@ static int xenfb_probe(struct xenbus_device *dev,
 
 	info->nr_pages = (fb_size + PAGE_SIZE - 1) >> PAGE_SHIFT;
 
-	info->gfns = vmalloc(array_size(sizeof(unsigned long), info->nr_pages));
+	info->gfns = vmalloc_array(info->nr_pages, sizeof(unsigned long));
 	if (!info->gfns)
 		goto error_nomem;
 
-- 
2.34.1


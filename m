Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5C6A134B2
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 09:08:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10A9F10E8E5;
	Thu, 16 Jan 2025 08:08:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=inmusicbrands.com header.i=@inmusicbrands.com header.b="mTWLkIU1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2070e.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::70e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EBC210E5E6
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 11:01:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UWaMWI+GyTGOgcv31TsdX5uDnZNS85uOu7EwY9nPxOrwNKVGhK4ExNvIeYGf5p0M9+USinQEJWoaPC8SlvBr3MDGn4CbeaqUetAxjXx9h6taPcfJ/itzCdlO1qW16z80f+BssP3GSl3z5jEyTjYrCyPJjZdQwl2Ucd4mXT2HtsNojiUclNzUd2Fn1vNJqDA3Ug0LeSfawYJ1iaQMOY289DCe59ryIBHnby4uM5ByxnE7MWaedXL1IVlvqwTxkHVQQBfE8JM9Uc2/Lf514ezhE5KS9SGnkJsnOII0Cj6dZQFl1hwE8Wwkkj2L5nw7Ty1ECvm2HQNv/lQzIU9kNHvrDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t4dF1/vajZHlStSiQTr9hy92T3CSMv5aH+8yJyR6smc=;
 b=U8KaiZyy1tND5PbnZM6qeeDBKxuwKtz1UO4ocBOB7PWYnDg8HsJtpSQFzJgtOq46JDUHqnOO6G8dTxJ3FKd9Ak+g+EcIFqwJ7a+f2p3PDdJPXLVnG/PGbdZtFS6JKJ7Q8aQSutw4c/hefjrztocwJ9o2mydN3b+Js6O4TgBUkIGCrsO1yF4BU47HjuoDJg+tBL6qz3tKDrG3EG/Av+Ilj8GELstW09D2UhIo3Sr9YH9u2cySlUlFwpN6Oot7cORRSpNIGUbzn6ENzyGmRFuoIyu3yILzkvS9b8yy4bnHMDefnoMpmdxpC8Ott+PgNn7bUGDZliT/hkUFNOg/sPjeAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=inmusicbrands.com; dmarc=pass action=none
 header.from=inmusicbrands.com; dkim=pass header.d=inmusicbrands.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inmusicbrands.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t4dF1/vajZHlStSiQTr9hy92T3CSMv5aH+8yJyR6smc=;
 b=mTWLkIU1EsPoccBzAgy8oQoy+kbl+NAyn8wCOiHPyW5eqwhHTWdHYSpBboJoYq0aBDPgic2B0QynYfJ7LgDbBruMq3qaMpgTam6pLVIoYhYwCKsT0843usnbUen5AkjWj+//gxzHLu7XeO/E7+uGo7e54mqkwMPrIERh4JNlxFo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=inmusicbrands.com;
Received: from MW4PR08MB8282.namprd08.prod.outlook.com (2603:10b6:303:1bd::18)
 by CH0PR08MB6842.namprd08.prod.outlook.com (2603:10b6:610:c8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Wed, 15 Jan
 2025 11:01:53 +0000
Received: from MW4PR08MB8282.namprd08.prod.outlook.com
 ([fe80::55b3:31f1:11c0:4401]) by MW4PR08MB8282.namprd08.prod.outlook.com
 ([fe80::55b3:31f1:11c0:4401%3]) with mapi id 15.20.8335.015; Wed, 15 Jan 2025
 11:01:53 +0000
From: John Keeping <jkeeping@inmusicbrands.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: John Keeping <jkeeping@inmusicbrands.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] drm/ssd130x: fix ssd132x encoding
Date: Wed, 15 Jan 2025 11:01:37 +0000
Message-ID: <20250115110139.1672488-2-jkeeping@inmusicbrands.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250115110139.1672488-1-jkeeping@inmusicbrands.com>
References: <20250115110139.1672488-1-jkeeping@inmusicbrands.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0215.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::22) To MW4PR08MB8282.namprd08.prod.outlook.com
 (2603:10b6:303:1bd::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR08MB8282:EE_|CH0PR08MB6842:EE_
X-MS-Office365-Filtering-Correlation-Id: 043542f2-866e-40c2-03de-08dd355404a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|376014|366016|1800799024|38350700014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JKpjA+p5U+Z13092pwJOkLaB11RjO8KyymcTVjWLOaPMM6jAx9xO4tlLdXly?=
 =?us-ascii?Q?mtClz6J1w1xcU0u1Q375oWKXtUCRbSVBB8hn7ApnukFxn7g1NJl7ZKnGwzL5?=
 =?us-ascii?Q?WICWdZC5fpZAJfT0oYYFE/cr1Jvvnf+HUyMkcVvdVfKgMid8oNIxomwHIWse?=
 =?us-ascii?Q?st2Wrxg9lnpBw3lAKdoJ0EfRSqDW1ofRNXheJ+0x9FM+mbdkczGwwMtWqejp?=
 =?us-ascii?Q?FUgwJihcdWlIqh8YpW/O44uUCQSeNfB3FNP1KafeSbpJuD5bJdY7GSpQ3W8g?=
 =?us-ascii?Q?xIbPrxD3IamGR+JkjKGiOKRQLmPpDOQ990Whn8txmtC0UV5w9hknAP4fq0J3?=
 =?us-ascii?Q?UktjQ9OnQC0y0wzTGAFMQZVE7qEfoXlmtYd63ZaXf7k1ujIAgGJrGX8b7ZX3?=
 =?us-ascii?Q?kbzOnI3SZuZyzqmtli1VOYU1IWXw/oZ+Mhny0M9A5CUkXxiUIjmPx2z+nhhf?=
 =?us-ascii?Q?3NkOn9tzsthVG6uq9QffsuDkMs1cQCUBUlmwwsBqfl5PxnlyEH7lhwS3Z787?=
 =?us-ascii?Q?QP4dxh8Ae+SSo7g+Nq8KXDvhpzSZNObtTX4n+u0VmlOUBe5vX6Y7P9dUzTi5?=
 =?us-ascii?Q?3t1qlXt3JuqrRE3Tg0dIMwWpyzhMQgGCeHIPt2BAU2jU95O9bsFFIdtRLIfb?=
 =?us-ascii?Q?Ei55p4rBeGDMGWuSiCyNlvRGXtRXrg5kDryrdCgEdxBGJPGZE2FgJ6NfR4dU?=
 =?us-ascii?Q?g7+7BDz3TjooYo92olwQHlgCSAQ+HycBfgoegXGCs1RjXsmXFAD0Wc1ywrqV?=
 =?us-ascii?Q?ubyMktHuN+1nYGGES3g99nZonZLTAN8CIAD/0rrsCHetsA86hv127ArKl7xg?=
 =?us-ascii?Q?xdxvhg9muEn+eXUAfEpvfLu1mQ5sSXdhGNOWgKbnZS4k4dDIJQMDt2ptQNPn?=
 =?us-ascii?Q?7Shrlac4/5n7WMsjMU9aKb0wq2tdHoCmqcciVDZ5sNsQ1rPVnxKQ35mP5LFQ?=
 =?us-ascii?Q?UBY6xOnoT6MgtUYGu5/lbQ//kKDFW6OedfMyYR6LCa3M8pLcnMegk3/SKNqG?=
 =?us-ascii?Q?zLoyFA5ng5l40dEZFUFC8Y+Akli6Nr9Xdv1gPIvggFgeQ2PIDysuNKxF8nh0?=
 =?us-ascii?Q?IiYqEc0c3hv74XTq9C8sRueXSV9qeNC8JnGVungr9ZYDsHp+jfXrB6MrjIvA?=
 =?us-ascii?Q?SoTRAQ95kHvyGoMQDmTfKN4VLH+QDU6YP0dPfdfBhq2i9/RkmKLdLFS33bxJ?=
 =?us-ascii?Q?punICmIjZgSJV7ouQjUJXbhmyKNY65W/aitjLrhrdmkw2XJFb2YrlnMb138f?=
 =?us-ascii?Q?wrrR8STO/Faw0OGQSCnczG8IFPOUzsVIpRpWm/1/vLpFSDloEFhLVWbD0NHj?=
 =?us-ascii?Q?pmfetHQ+cR07RvphtvPTkPUQaytfDEvrGxSqZqPnU2aJGKHWS/ZlG2Bq6Shs?=
 =?us-ascii?Q?QwspSjByXalAWRVCRM8cdJfsW3S0SLMV7sHcefVMFIUKIGqjMbEKh8rq2k9d?=
 =?us-ascii?Q?I/R5HE7+DIZZph6CoYNK7MkHynYxUqP7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR08MB8282.namprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014)(7053199007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QRlSJ8JJuSSufrEJHJ9anfDJrliMxkA52kgs6nrl66XII8HkG66+tPcuX9cM?=
 =?us-ascii?Q?Kl//gc1n/1DM4/kriuhax4ylq17dADLe9Z/7Pl05NikmOCsec/lQTbRXD5Go?=
 =?us-ascii?Q?pMggLh0zYqbvXtIvV0f3lB3uaWL/jWZ2N4Yp8N2JflkqLuKRUxc1wxKAMBEd?=
 =?us-ascii?Q?tom5Q94dsXGa12qyeCvYNavD7AXuEvdp/Iu0Oi+k1sleRo52Y7Fi32f40tju?=
 =?us-ascii?Q?HbW9/UqCsRzgjrO4SxkPyGc+EKOrDqubHpQ5ZBXvxX9N67EkxPTQinwHldkZ?=
 =?us-ascii?Q?CcqescIh0C6HF0uOiqEy+wow5U64mSCSooTHBrHc5xXhlpkBcoFOtupKMPSH?=
 =?us-ascii?Q?8Lyfh7HPSNu4YNN2xc1Ih1iMGAS7zXD6oOno/2u8IfZeR7F8A+Y1qqDbJ7Qk?=
 =?us-ascii?Q?ceoDq7qUNZ28DqufcHfG1yC7CSBzhMC7hC1mEU2q+WTt+eT7N139847g1t78?=
 =?us-ascii?Q?9ly7Z8teARrMx069O+RXXpqcP0yFuAjZ7ZdCSDBk43zzNXrJwCfB7Mj7aLAJ?=
 =?us-ascii?Q?kqownN3ObsB5xJp7TrGviS1SeiZ0VMHIY5z8VKG3lREvB59wzJzLu7vKXdy9?=
 =?us-ascii?Q?MQRNWf2HELcz3yr7Pq1Mn7+2YxqnPDG8uscUZ3nMvcq0p9KA5DCK4HeA7Ul+?=
 =?us-ascii?Q?2ovgCw8prn+MR1rUnb6XRLapf2KedaPR9xRqgE+0IT2XgtnEbgjC75KS9ggS?=
 =?us-ascii?Q?yqjPgwlnd2O/7mvj2XP0zyjgZZB+Ox/IpXWrBTo0kJB3QeU8UKh4cb4fdxPs?=
 =?us-ascii?Q?h2FDEgtDLdTa0VQJBl4HKBi0tpK4ltWDcUltAQgb51HQkmIKdQ56m00qY7T3?=
 =?us-ascii?Q?pcpL3BK4ppF599QzpZF4J8g4cCLJcwU4jzjA3j9xW+Iy6UBoScnVY185U25g?=
 =?us-ascii?Q?coUYtGUBNNM5xr1GqGtAmkDsyUGOVo+FpD2CrVs4Vb94EkBjAnvSSND6oyUR?=
 =?us-ascii?Q?s9L1KmzmbSwnAkCSFsyy6CwBDWh6wWpT121PvEyTejkGYObd6C+Tmcl0125e?=
 =?us-ascii?Q?jsvNAjgQPk0H5l/qf0Usg/BMvOSqNBxigXgWFxY84ppi5Vq5uw8wbsOAWyaQ?=
 =?us-ascii?Q?kuJLMhvk3kPAQxIsMTun/BDhbUGLDOx2ziOEcJQYCDrNyn7LlIK2Le17akEC?=
 =?us-ascii?Q?7E0bUJqmMroXkcoAdzJTNlL1KPXSODG4ZC/l0LIJMTK4NJf8P9lAFxWHDvBK?=
 =?us-ascii?Q?4UV5R5RqixyF9PxSftzYOkRy/8cDTVf4KP41Lep9cutenccXGPZcoSYlE/pR?=
 =?us-ascii?Q?msiD/VvzTGavBeRdkGJ+UDeNauDl52roClsn+Y3bWUh7ndmofYqsCTbq/I9Z?=
 =?us-ascii?Q?IznM72ZOB4lGon75wKBkCQt53AJ+G1fYXkhvJvc4rqC65wVnGoD30XrgcI+g?=
 =?us-ascii?Q?DzpJAFmbmGJKSPuTAuzGquoelfRqAziCYAyrizfKP7/57ToxGL8CDwmT7fG8?=
 =?us-ascii?Q?yLGTaxuU3HPQgGGNuHU7qFx1Owrxt2IbtJsrrT41XCIodNjlg0a8snXYL2G+?=
 =?us-ascii?Q?iF/muyyIVvwwZRRKy+WN9OAG6bRYYNfBqZl01ephbs+Db1yIaFgjBjlFIYvm?=
 =?us-ascii?Q?DmyVPmOkibrXs9FXIz4AscRdVfr2q7+0xus0C3mcdCaOmQl4HyziPCYUbc3x?=
 =?us-ascii?Q?Qw=3D=3D?=
X-OriginatorOrg: inmusicbrands.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 043542f2-866e-40c2-03de-08dd355404a0
X-MS-Exchange-CrossTenant-AuthSource: MW4PR08MB8282.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 11:01:53.0520 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 24507e43-fb7c-4b60-ab03-f78fafaf0a65
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rtbwnNnqWMb5PNDl07rW13+rVhAmeMkVZLisn5SgVQusUpZZbYTTfkdXad0j9+pOVQELvnCwiXncIpShKfg/R1NzK1Z3TuETasYuf88QFH8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR08MB6842
X-Mailman-Approved-At: Thu, 16 Jan 2025 08:07:59 +0000
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

The ssd132x buffer is encoded one pixel per nibble, with two pixels in
each byte.  When encoding an 8-bit greyscale input, take the top 4-bits
as the value and ensure the two pixels are distinct and do not overwrite
each other.

Fixes: fdd591e00a9c ("drm/ssd130x: Add support for the SSD132x OLED controller family")
Signed-off-by: John Keeping <jkeeping@inmusicbrands.com>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
Changes since v1:
- Correct a typo in the commit message
- Add Fixes and Reviewed-by tags (thanks Javier!)

 drivers/gpu/drm/solomon/ssd130x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index b777690fd6607..4bb663f984ce3 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -880,7 +880,7 @@ static int ssd132x_update_rect(struct ssd130x_device *ssd130x,
 			u8 n1 = buf[i * width + j];
 			u8 n2 = buf[i * width + j + 1];
 
-			data_array[array_idx++] = (n2 << 4) | n1;
+			data_array[array_idx++] = (n2 & 0xf0) | (n1 >> 4);
 		}
 	}
 
-- 
2.48.0


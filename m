Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1667F54AB
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 00:32:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B3A410E6B8;
	Wed, 22 Nov 2023 23:31:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM4PR02CU002.outbound.protection.outlook.com
 (mail-centralusazon11013010.outbound.protection.outlook.com [52.101.64.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2ABB10E31E
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Nov 2023 23:31:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nCacTArm+WRteu4CskXJbY+5axyfCe2XoNyrr1ji6THb8VeXi3J7yRJ1ZAjxJRCqtGdEAQn5IcarGlN1PrC+9ojqpdaalEhh5xBFb2ykAD2hN2EubuDmDvTHkmZrKrIk7/gZ/eivly2KZkrJ4YyLs8t6KWA/zDgS5rSDll5vnnoUfZnFLLL/SnjyKi3QkMe1B+JbmbCCHjC/ATn7UTAvfV/X5ATemWBkUhbOKsxkSpoQY27YZhZlRJuwHFqbqgfEUeSXdv9fLoQgBVBD3JrkvkMZo/0eLvkev314VdSIB5dcHi3gfnJtr2pIETbdC7LJpZu44Ukjcp6qRrLnRzU5bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mYs7K700gBSzwO+6j/TEg+wWDBD31/tUc3OwiVR/muA=;
 b=K56V7LcYqfl1JrWOd29C1L3AiDrVQIRT6tcQyBQ3/RafSoCig/0cQWu9RUTBvbfoR4EQVF5mPwimyiKqEEvAesGgkHGVKjMn61zVhNX9gEZSdiOAXHxSMdnm/DT6oA4NbUEJ02OjoXNvrqVOYVkoBQGqJ2+paAyZzURb8FjNdiZLapCZtuscV0OTHZBqwb6g15c9QnBIUi500GGgs/xoWuhiCxq7gWHloFjD1KfUSnqZBsnINFMpZFXVLUTmZ/7kHpW5EywL6BVyzpo5HOh99pZKByK/GgeWw3tlL3pMjXeBHGOu1r+SyD1lSIR1+THrFdFPr314usT/LYk9SPgTxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mYs7K700gBSzwO+6j/TEg+wWDBD31/tUc3OwiVR/muA=;
 b=qvxFxZLXm6V9akRtEnhjzRJJ4Hx/orOJBcr7EMBnsWWL8rxKDDMUuK+oyuM+MVpFnngk1D58it7AmK5VAq8hwH93p7TtnwlD6Dlmh0qc+eDEj2Jvfd2FpVJrKnz1TQLeEo6JIm97s7vXtRO39Ok6JcwC0ITyx483QPL9N6mNG8M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
Received: from MWHPR05MB3648.namprd05.prod.outlook.com (2603:10b6:301:45::23)
 by BY3PR05MB8275.namprd05.prod.outlook.com (2603:10b6:a03:3b6::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Wed, 22 Nov
 2023 23:31:26 +0000
Received: from MWHPR05MB3648.namprd05.prod.outlook.com
 ([fe80::10f0:590a:708:4ad7]) by MWHPR05MB3648.namprd05.prod.outlook.com
 ([fe80::10f0:590a:708:4ad7%2]) with mapi id 15.20.7025.019; Wed, 22 Nov 2023
 23:31:26 +0000
From: Alexey Makhalov <amakhalov@vmware.com>
To: linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
 hpa@zytor.com, x86@kernel.org, dave.hansen@linux.intel.co, bp@alien8.d,
 mingo@redhat.com, tglx@linutronix.de, zackr@vmware.com,
 timothym@vmware.com, dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 airlied@gmail.com, tzimmermann@suse.de, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Subject: [PATCH 3/6] ptp/vmware: Use vmware_hypercall API
Date: Wed, 22 Nov 2023 15:30:55 -0800
Message-Id: <20231122233058.185601-11-amakhalov@vmware.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231122233058.185601-1-amakhalov@vmware.com>
References: <20231122233058.185601-1-amakhalov@vmware.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0039.namprd05.prod.outlook.com
 (2603:10b6:a03:74::16) To MWHPR05MB3648.namprd05.prod.outlook.com
 (2603:10b6:301:45::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR05MB3648:EE_|BY3PR05MB8275:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c01e94b-30ae-4d1c-fa37-08dbebb32544
X-LD-Processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DIfP242+jRcm6uWK9t21PQ++by4xujmkLIGtfd1tm4tDFIu/jt1uCrkn5yylr7UGVuxSTApJb5p6XFf/S8GE19iTo8uAcxIL1MBonld7f25kJD9IkkENVntV+cLAADBmfGUvtCq/5DgjLtaivf62Y0F1exekPrIjMsIJ3AYtsa0Hyd6fomy+PeYgTdy+T001NMNuT2NZacc2eTgIWq0wmJfh34PywKT6oT1r8cXXQQTUyr2RPUSW1Zq2AIaGNOMdZn5eWSTK1RPJYr26EFP7VHB4ZITh1PY46I+OHiRW9g7FU123a7/fPPa73nmz3n5nTwyHE3gnWJoen3RqfhKXaiI9PwHVWRxcFPJHTLyZud5DwCgvbpw3WBdej8SHFRaezUEKgII4lkUi3eRIDpPCkWUHmxwx3ECOamyWRkneVBot5HAeqEWBkVIDgzBOyAU7rxD7axv4SWLH9LgpG0sSXBWTA6j2I/1NvftvJi5efZd5Rk+bzCCDRZKZjoUE3FxxyfoRbaBgAtB8CfVgmRfSrCOt/R5alHmge6twtF+YvUx+vF0wQUBF3XYLUb2jEksgEUwiSfkrQSuG2z/+Uu+/yRrj3LFZ4LMeZ0OMIH+3ISYRObrCQnoz8Agh6cu5VM43UaoRsncSvjj1/yb2PG89gikTRH+9UjXdK6XubR6xdmH9bFyaInq02BavBp3Sx0FB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR05MB3648.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(376002)(136003)(39860400002)(346002)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(6486002)(4326008)(8676002)(8936002)(5660300002)(7416002)(2616005)(107886003)(478600001)(83380400001)(38350700005)(6666004)(2906002)(66946007)(66556008)(66476007)(38100700002)(316002)(41300700001)(6506007)(6512007)(52116002)(26005)(36756003)(86362001)(921008)(1076003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0ADu/phnqPtetqDsPlFxART3aF1ghnqvZeen9BlWe2MUwPq4i6JoPzPB6fDt?=
 =?us-ascii?Q?HL4vmP4YEmlEbhwuikMUrzUPJ6bR7Z+cJfkL054nLdNFfrsgWFA3eXPNKfM3?=
 =?us-ascii?Q?j1ouPn3TciYH9zKeyn0eIap971ET0w4EF0Eo5eI0+qa18qk4QaLJnRmK+dzc?=
 =?us-ascii?Q?6fcfhfvteicAad9amt+V9c4Wnjs71IKxsau6LR6JXpqtLy6ycbNDHFAYB7qn?=
 =?us-ascii?Q?akY/ISD9wf5yOg8s5WJRltqdjl79atvH6kWTH0zH4GJqzEhFAEARWivwrgJ0?=
 =?us-ascii?Q?wHXp6jTQI+NhwXuHl4c7Hf2aeXX93ZU3IPbi5jO2KziW3uNjaf+JXQhyR07B?=
 =?us-ascii?Q?JPNuv2yjeP000w4XlPHGa8fFUpx1/4wlfXOVULLbdseB/jwalCuj8+hRAvlt?=
 =?us-ascii?Q?im4CW0j2qTY13cUQ9g0Y1BzGpso9vTENuGcemhohGMc3Sq5g8r6ZuFJs9JXA?=
 =?us-ascii?Q?4Nc69HCsoSBkR+uM0Kla5H+kaSYViwA1p/8TKHaMDxn4RvPTXVCV342jN7L5?=
 =?us-ascii?Q?mSHHLcixgMAJdLWa9t+jL+sf6F373ga1EyO8Eu/8ooloLeIbeqbtI2EDEeCL?=
 =?us-ascii?Q?mxkhse1pk74VwXMh53Jl3Q+HdCn+p0e4WmssHMHpHqdpV8Wb7T2B8SD/MIyE?=
 =?us-ascii?Q?LzPkkwMuvEqxmVlycbWOATqeoFRb1uVFT20wA5r5MENxAIbQS1wRlIwYwzcM?=
 =?us-ascii?Q?yXMCFHVpNfoCYof2vWZmkd7knSgV3Ba/JEgG3tb+rKKLnUJokgKGBujDNYnY?=
 =?us-ascii?Q?DConRPmJ2ocubg6BxkvVzZLA530Mx/FHHIdK96VG5wDRIY9+lR1u31TTMnl5?=
 =?us-ascii?Q?qu7oLuFU4/KuvqdcU5jVQKQWju5XUUZ6m17+790n1WE50qQvfRTClVfNncN6?=
 =?us-ascii?Q?mEnT2pIEYQTM7kxnrbmzVAitYRyzfGxg2vFpyYOuDBNOZaCRb1xzzraRsx4U?=
 =?us-ascii?Q?prPqKdZPOX011S1ql3yhyxJnfDpYSpwffFBkiPNUdvoO6irKZUJNErZYfahU?=
 =?us-ascii?Q?FsQfzE6x6yzx9nJWUTkWfKQgXaH7ek/dYDSZdwHJy0lpZLmcfOergw9ssuRi?=
 =?us-ascii?Q?KEwJPYoUBAB9o/Jyzdf2SN9j8EPoP7y+OnpcHqFJLHkurpXAsaRc9IdAR0dt?=
 =?us-ascii?Q?Hjmmy6esFhiN8FpKcam+gbUO/CzYwGWWog/s67yvBVSD40nXuBO9QZSxB3EJ?=
 =?us-ascii?Q?N+u785MD4U+v9282t1hJbMomxKl05IvsDk+8L2zraDxYMrJ6SiTvYLJpvXib?=
 =?us-ascii?Q?K2Q1hMyq8yYSaXLESce7GcZGyNIpVNTqXv6TAxwQsvZvDDoL6MDXFoRyUKjW?=
 =?us-ascii?Q?7XN1Rrx1gYTno/tmhLOXwJzATZ7QJOYsNLy4MdQb+1cQ+8cmrU2iKadvcBBs?=
 =?us-ascii?Q?EbJ0lOt17N7zUwnEwTfqLn+ZE5X6zKapE827KGCZbI4RPARF79Q1iBlOMUrB?=
 =?us-ascii?Q?m+yiGVZuB2B+dFN/mZfUpBKR8iQNp1IoAeLthymYyvYeAdKANmJew+spQ1y3?=
 =?us-ascii?Q?tcw4b8BCIW+uLc73+brndhyWTaIRBFK7FNjEyOEvQjA5x1RMjmS0+xkbo5cX?=
 =?us-ascii?Q?nFI++4AjLUjoBk4arlCi1wZ7oNFaJp25VHrDbLo6?=
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c01e94b-30ae-4d1c-fa37-08dbebb32544
X-MS-Exchange-CrossTenant-AuthSource: MWHPR05MB3648.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 23:31:26.4005 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tle+smzcxXq1bZbHF988NhkwQJD+MX+tTM27jlWTrqDWyPz+ICIsgmJzsHolKmp3juY/3j65fUMpDd9GcZY+1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR05MB8275
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
Cc: Alexey Makhalov <amakhalov@vmware.com>, pv-drivers@vmware.com,
 netdev@vger.kernel.org, richardcochran@gmail.com, dmitry.torokhov@gmail.com,
 akaher@vmware.com, linux-graphics-maintainer@vmware.com, jsipek@vmware.com,
 linux-input@vger.kernel.org, namit@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Switch from VMWARE_HYPERCALL macro to vmware_hypercall API.
Eliminate arch specific code. No functional changes intended.

Signed-off-by: Alexey Makhalov <amakhalov@vmware.com>
---
 drivers/ptp/ptp_vmw.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/ptp/ptp_vmw.c b/drivers/ptp/ptp_vmw.c
index 27c5547aa8a9..e5bb521b9b82 100644
--- a/drivers/ptp/ptp_vmw.c
+++ b/drivers/ptp/ptp_vmw.c
@@ -14,7 +14,6 @@
 #include <asm/hypervisor.h>
 #include <asm/vmware.h>
 
-#define VMWARE_MAGIC 0x564D5868
 #define VMWARE_CMD_PCLK(nr) ((nr << 16) | 97)
 #define VMWARE_CMD_PCLK_GETTIME VMWARE_CMD_PCLK(0)
 
@@ -24,15 +23,10 @@ static struct ptp_clock *ptp_vmw_clock;
 
 static int ptp_vmw_pclk_read(u64 *ns)
 {
-	u32 ret, nsec_hi, nsec_lo, unused1, unused2, unused3;
-
-	asm volatile (VMWARE_HYPERCALL :
-		"=a"(ret), "=b"(nsec_hi), "=c"(nsec_lo), "=d"(unused1),
-		"=S"(unused2), "=D"(unused3) :
-		"a"(VMWARE_MAGIC), "b"(0),
-		"c"(VMWARE_CMD_PCLK_GETTIME), "d"(0) :
-		"memory");
+	u32 ret, nsec_hi, nsec_lo;
 
+	ret = vmware_hypercall3(VMWARE_CMD_PCLK_GETTIME, 0,
+				&nsec_hi, &nsec_lo);
 	if (ret == 0)
 		*ns = ((u64)nsec_hi << 32) | nsec_lo;
 	return ret;
-- 
2.39.0


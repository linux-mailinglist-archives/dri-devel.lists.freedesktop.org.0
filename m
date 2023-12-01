Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 762168017BC
	for <lists+dri-devel@lfdr.de>; Sat,  2 Dec 2023 00:26:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F18F10E98F;
	Fri,  1 Dec 2023 23:26:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11011009.outbound.protection.outlook.com [52.101.47.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DBC710E985
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Dec 2023 23:25:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kK+n8BnbJ3lEzU1v4eYkiqKlgou6fKoZmZhHqxPzsoA6Zf3896f6A9H2PI0/2ITlyRS+//QEEOmGFLrLNDtwbVRrbM0AlCCxe0tfIbXokpX387d0llGU7Q0DJ6qZwjJn5oUPRq5RVrfRW1CR5ui1u9bperPbvzKQMUfuNNiKH6wC9EIFZlMzbcOMEloNy0J2rFZLKcufLkGQwypW54GA2fscJOskv/tEZyP+o2tfnTW2ZanPn+rU6o3Y8wcWlFCEC64mR4XWdGkFES9En/hOHFU+3hpOzVJfl/3PWE2liAowHyigiZ8cHeCsRveAIRnpqLm+QjOLFgS26URhawB84Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yQMnr6IIrr6r/3xHLijqfAqg6Qi305k2X4S6yputISE=;
 b=RasGtO2sHYgdD2qbMHqciQCgH5fLKPumunQ3c4eYe4UlL0u5xvjiiW+GqwIklxBzaLBDHaoPvHquV6TJHUg35W++ODT3JmorruCe6+o8odpPppjnsNrsgt5uWTJxETj30LfEbL1dyafXN5L5yvPAWfNH9jqSr4+9FEcqsXg8mokdTLJhudEx0VFypQcIMimhpouYSlGuG1C1dQhZzq1YvVp4vbZwk18ahR2J1/QmCgIUv/yF8YGO7VhmNWDIUjLBx+joYIHqH8p954hNbI0xuXmTGCeo58YMGwNUPJgYLKJpMP8UeTkowhrw4NXlWNqYyq7qwBY4JgrxIbrVVm6uIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yQMnr6IIrr6r/3xHLijqfAqg6Qi305k2X4S6yputISE=;
 b=XBRX7jbIW4DkQ5qDuOVO8/tPOLBM1H29oOFVTMKOZggTsD3FwfHRcsbEjEqd7+QYzFAdOnruKeIguvXzsq5xYJa3yG/sukb9t0Zpv983JtlKSh4JrCMA09brBSxENiPaMFVQ8RruBAOozGBLwaR6z/BpQRLhz+EHgaXEhGif5io=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
Received: from MWHPR05MB3648.namprd05.prod.outlook.com (2603:10b6:301:45::23)
 by SJ0PR05MB7787.namprd05.prod.outlook.com (2603:10b6:a03:2e4::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.27; Fri, 1 Dec
 2023 23:25:09 +0000
Received: from MWHPR05MB3648.namprd05.prod.outlook.com
 ([fe80::10f0:590a:708:4ad7]) by MWHPR05MB3648.namprd05.prod.outlook.com
 ([fe80::10f0:590a:708:4ad7%2]) with mapi id 15.20.7025.021; Fri, 1 Dec 2023
 23:25:08 +0000
From: Alexey Makhalov <amakhalov@vmware.com>
To: linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
 hpa@zytor.com, dave.hansen@linux.intel.co, bp@alien8.d, mingo@redhat.com,
 tglx@linutronix.de
Subject: [PATCH v2 3/6] ptp/vmware: Use vmware_hypercall API
Date: Fri,  1 Dec 2023 15:24:49 -0800
Message-Id: <20231201232452.220355-4-amakhalov@vmware.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231201232452.220355-1-amakhalov@vmware.com>
References: <20231122233058.185601-8-amakhalov@vmware.com>
 <20231201232452.220355-1-amakhalov@vmware.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2PR07CA0017.namprd07.prod.outlook.com
 (2603:10b6:a03:505::17) To MWHPR05MB3648.namprd05.prod.outlook.com
 (2603:10b6:301:45::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR05MB3648:EE_|SJ0PR05MB7787:EE_
X-MS-Office365-Filtering-Correlation-Id: 18e50ccc-7eba-4e90-37f3-08dbf2c4c202
X-LD-Processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtFwd,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jvNaZEq4Qok8L6voJiYOFPKpJzd+4r9/WqWqhvsh5/9XbEHUKtruasq/0N12+rhx1LKFzPhL0tH6oFuyWPFZD44zHMIEdVOvImX8spN01tFJ/6KchWsmuWv7Q4Bt9AACtBGvyhVwi3wLa0+A98xkdTzpI12dpzJznrlZATpTHg9Buc1kLNRaKPZXruP6zgEgsQFbt5EGThFvqYn5fc5efSQ3sX3svKcP1gm8Bnum1Z+saoHS3IE3RzG35BAzdrGDWC10Z5xHxJfil6JmsZNuOFXg5rm/XVOsLyTvW6AVANEKHvY17gDHNNZpqQFeaeXuAakJHyujRK5FcY2pTcX9s9SybCqxxR4NnkQGFwC1KjrBkkiV12BWY/6JbyBbv1PHFYA7wa8l7jCjBCu8tlN6hqByakufFrq2AgYkQBWaUrngph4rRchcpycBzyYJYYwilF4b42JzlXktglHllf1i/2YhU8UNXqmdkK+W6bj98j2+xcVq66xIKmEL5Gly+A2CXUZQWvj5IgaGMfLy0y7jTOhIIk1yT1Xm5TfLKtCNPvtcgeBcdru0zty8UWo+lXutwOz0a1BHBE7U/XO16Qd+S9+15YrZzezya88KGT89S1KoxnenEyOns+HIXY+Y8iEN71IK8T0iwnRQVoRjdx49nOSm9JaO5MGXmS8y/C+bQok=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR05MB3648.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(366004)(376002)(396003)(136003)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(36756003)(8936002)(316002)(66556008)(66946007)(66476007)(8676002)(4326008)(478600001)(6486002)(41300700001)(2906002)(7416002)(86362001)(5660300002)(38350700005)(38100700002)(2616005)(26005)(1076003)(6666004)(6506007)(52116002)(83380400001)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TcQiiocl86W2OYPwgwwXFlHZclGMaWjx6ns+NfwwLbb8ROt+tJMEXoMBXGEn?=
 =?us-ascii?Q?+9FgNGv/RgkkwdGJ3S7PgdzwXGK5JwlifxYmM+uuadjxSs8TeMWWS21tLkXg?=
 =?us-ascii?Q?YwvAk8diIKO+xnNmqvqqojJRI100QwB68IodWWhWy6EKW45ZYUg/vwOc/2qC?=
 =?us-ascii?Q?MZt1rWDKhD3u33CVx86hoD3a3OUi96VixDOGTgEdiawtzAODn9RKcwAsnTZm?=
 =?us-ascii?Q?hvP5BjMg3SEQ6J/Ov+etH3uLj51e/hiDs77HfISHtpoY1n/1BwGdy4z+4DEq?=
 =?us-ascii?Q?+fIVyGiXLSSqcIuQGcHtVlw4URcftk0hgjnJ7m1D0JTtL/zmNQToNH7ysQLA?=
 =?us-ascii?Q?YsOFvqlbnY01XBoCNSdcmB7/rRi6pLWiLLKj3hKi/FLcmN7sZuAhdtTW0MxG?=
 =?us-ascii?Q?Z7ScuxhnrY/cpMifhLOgn+PAny58on3L3ErxgzlaA6M6LLNWeo32snVim5o+?=
 =?us-ascii?Q?lQNIkct362i8jiVQbLBv2/k1xnxU05+1OiGSyUywmYKeK/8G0e5AbhNUNmy9?=
 =?us-ascii?Q?0S3iQ45zgYnV3zUCVWjvsvhQz8lrZ+CbnAF/J2JUxZyEk9BpwR9M7ss+pdTX?=
 =?us-ascii?Q?3J/eIxtPiKM48XtB5mgo2xDbcZhDb7hfVn5csVZVVQC/t3vWfkr3HAUKDj3h?=
 =?us-ascii?Q?Wxn7sWcH/tcEoFnVK9bGcDy6yfIbRkuiR51HPCUB6SQHW+QjZMyuarJ23DYJ?=
 =?us-ascii?Q?PwsS/DmPhTyk9lrVFgBTM3OAYr8vdMJHhhydo3h1vbT0aYyVLQYAN4Z6vUno?=
 =?us-ascii?Q?S4SWMwHktGfndDhTSPVRbysABe2giMgmvhfknTDtCEzp+s6RGkcm7pxlc4wR?=
 =?us-ascii?Q?DK3RWy4nX6ovarJLrjwiXDb4Lz4rOzuenMEXByI03XmkM9Rzflo1h4BGgkrJ?=
 =?us-ascii?Q?lsajQvBHusaNP497X73T+pcT0yw6LBSJEtr5CDzMr+txiNM/gKYwdOpclott?=
 =?us-ascii?Q?zpWN4j3DeR/tgxgxB8irvGaFxLkrOKY2NaWQDSXKgVMApnZZ865PwKYVQnEw?=
 =?us-ascii?Q?kob0o+GrUhCtVqXXClMkw2iKmJq16+ifaySg0Ggq7oF+cJW7IbE864eDq29H?=
 =?us-ascii?Q?VSRZbnmoY6MMiyeNxnW0Pdk57+tx7momPTcujHxzrpRiqfuzauY4InMYJBwT?=
 =?us-ascii?Q?R5vXuI+qmipacs5haY2kS2jq0C9osT4dnonPR7OfwcLIlvIOWDWp/3Vxr8mQ?=
 =?us-ascii?Q?KvdPjXEt/MUAv2EQJ1EaTRZRewHbs+HKhYTmDrsNw5ocrdl6BqlTK5e/DlRd?=
 =?us-ascii?Q?MQCpmB6ZstnyPRGn38qfvmlG2NB9fZ2JIMlGIQ3JFd6bU962RlKe4Q0fUtGO?=
 =?us-ascii?Q?rwMTLDylPXRTd4Ji02u01bAhWsvGH6ipP/gjwtmtJzpLWc172mdnCIXScowj?=
 =?us-ascii?Q?nc/iAGM4okUQ/Ex+7SotO8ufSz1hJKYzjBpehsFQ5Gq4nROaLCI3mnW/4ZYF?=
 =?us-ascii?Q?Y32XvQxkpteQl0+9UecGTLSke6Zd9JT8MdUe1F9XsHUvlfYcXntnHEqF3k1/?=
 =?us-ascii?Q?I2Rf9LbpLuDlkJQ1EMUSuB/U/Pm0v5s/yFAkcE+RxUHAZY7+buu/2TVNAoLA?=
 =?us-ascii?Q?E1/xQfhaa11BAyJctoJlfOB/2Egai/cInIp6AfES?=
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18e50ccc-7eba-4e90-37f3-08dbf2c4c202
X-MS-Exchange-CrossTenant-AuthSource: MWHPR05MB3648.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2023 23:25:08.9204 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FVGT8+3/V/8HueJczbwYKpejP21NGaBGlwdZKNXx0Z2z5N8M7mRlU7zpGssDxenwzv+XbTS0RKx6JAomxWgNdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR05MB7787
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
Cc: dmitry.torokhov@gmail.com, tzimmermann@suse.de, pv-drivers@vmware.com,
 netdev@vger.kernel.org, richardcochran@gmail.com, x86@kernel.org,
 dri-devel@lists.freedesktop.org, horms@kernel.org, akaher@vmware.com,
 timothym@vmware.com, linux-graphics-maintainer@vmware.com, mripard@kernel.org,
 jsipek@vmware.com, linux-input@vger.kernel.org, namit@vmware.com,
 zackr@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Switch from VMWARE_HYPERCALL macro to vmware_hypercall API.
Eliminate arch specific code. No functional changes intended.

Signed-off-by: Alexey Makhalov <amakhalov@vmware.com>
Reviewed-by: Nadav Amit <namit@vmware.com>
Reviewed-by: Jeff Sipek <jsipek@vmware.com>
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


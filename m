Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA16F80A847
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 17:09:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DF9810EAB9;
	Fri,  8 Dec 2023 16:09:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9290810EAB8
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 16:09:50 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3B8FCaBu016280; Fri, 8 Dec 2023 16:08:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:content-transfer-encoding
 :content-type:mime-version; s=dk201812; bh=/7F7ce360aZxFvc7l164Z
 +IqsHGXLg+mnKLYoXjxy5s=; b=RzSpOsTBHIP+D4ua7h0IATNgJO4a4UWkODVCq
 WBbKJhbNNUluuPMqEJX8PpLQXYKDLg4glSgoblCxiQ7wUhiaie/pEClFjYDVNiuP
 cDYPVKRHbnEWrlk30MaT8jlSCgShsXmr9Sko37z61dgyg56RMOnRcs9rQ+JETcZj
 eWG7Apv/h2cGrUaly25zxesOs46Y4zJJ3IUfCIvJbNUiw5bdjcpU37oHi/nMT+p1
 VjrzQARrkGte5BNhzL1sTIVo5ltSo9552R3guIR0pLA5RS6CMeXyqidGWU0Pfojd
 ipSOQ8i5AJBdrugVTrYWqeIvFHeVEHdTETZCNScTnAcVCmnFQ==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 3utd11a5y6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 08 Dec 2023 16:08:47 +0000 (GMT)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Dec 2023 16:08:47 +0000
Received: from GBR01-LO4-obe.outbound.protection.outlook.com (104.47.85.104)
 by email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 8 Dec 2023 16:08:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wt/9zigxYPXFRPvaLG4vfudpd348XszWPLsd1aYj7ia/gIKHjZRGxITVKfMtOXR1EHsncw9rHgGnGgaMQX3v0svJOxCn4MqpIkcpueJRrl9qu7GtFa44DmGniQphCeqxfuqfjkSOL7qMzoTiSuhecHywLNQJMtRioLJOkXkZVc2kODNvMwqGIruGFZ/a8nOLDlUoJHOzmBesQvM8ZggRRRCbWNEfQ/MwzRE4ZzeklZ06nHM1b/oTXHywxeQkot094d81/+VYOTNSSIuqyyjJpzqWVgIqi/PfpI3a2EyaDG8xWYqQfNGC174SPb2nFHOdC8pdoFmO601rANPH09+QaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/7F7ce360aZxFvc7l164Z+IqsHGXLg+mnKLYoXjxy5s=;
 b=OlQqSPSP2vNA5KMbgHwHKQKo8uKt7g6qCgK/Fig5Dgv1o2eifkKI0LaSab+Aj9UGKtqmHoR8i/SYjC3mJXcoqgIVhl7Wx4JK61x0A3FLhATXCcMo7XbtJ5Ze9bmvkDb6ClEFFZVe6pemXqHxewQCFxLBMbwKe6/f7wXZTznn3QBjPTCyUQTtD14XxR5QbbqXBWEd4J8OiDbycdpcx7AeDi2kCU6lFT91Mq3WYfVY45Caioy4XnVxYG/zuYRMFjAEHtI/LnHQnfF8zw/LYTB5v9li/phx2bJqp/DgN5tzTl7Fpqdpi0X0mxsTQVEORMhc5ao5owMSvpCs+MmBEcBY2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/7F7ce360aZxFvc7l164Z+IqsHGXLg+mnKLYoXjxy5s=;
 b=OmiFRIusYzu8P59QYG5IG0eww2w2i6gGQ7mUoYtIPKNKLpYSr1wlFAQ9NCuZRWupYYYoAK3gwObnF3CZ6oFvjzjIzeFgASCz14o+WnKsJHRPMnZWKtyoRaOQOICivxiZFOxI/D3I0/0IIw9Ddfoac3cJPVGAp89XoxRu8BDZGJA=
Received: from LO2P265MB4600.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:23c::11)
 by LO0P265MB6228.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:24e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.28; Fri, 8 Dec
 2023 16:08:40 +0000
Received: from LO2P265MB4600.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a3f5:aa1a:ff75:79a2]) by LO2P265MB4600.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a3f5:aa1a:ff75:79a2%4]) with mapi id 15.20.7068.025; Fri, 8 Dec 2023
 16:08:40 +0000
From: Donald Robson <donald.robson@imgtec.com>
To: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/imagination: Fixed infinite loop in pvr_vm_mips_map()
Date: Fri,  8 Dec 2023 16:08:25 +0000
Message-Id: <20231208160825.92933-1-donald.robson@imgtec.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0242.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::13) To LO2P265MB4600.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:23c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB4600:EE_|LO0P265MB6228:EE_
X-MS-Office365-Filtering-Correlation-Id: aa37c0bf-e381-462b-c6e0-08dbf807f18f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9QpRKBGhmZffcJPn7Hj7ZLs5ohVeLjJCe3sLwyiy25sxvHsBPjJDbjcBS0PqLh+Fh2pE3bML3ieLip41b9VioH2+kmFioGqumf97KO9rgoPkONf5GSwt/0aMilfzZjzRe7pcg3UDXLgWadB1RJ2O7Fk1RKiZd70Hk62V8rDG/yG8gnVL9FQkqrm80Pdk5Gzry8yJhYytTjZe5rpMiKpgJLHWmduisRJNPBX4aPFye/iSRj3UdyOJPQG3RhEBS7/BU5/KQfb68iNM6VipnMUsOErlawD/ZbE6nOFLTxJZAxdnFWO6bYkO6pPIUDZMZWzW4xhEeeJDaF1Gko/5NJ8Nw7LLTh73To/zphGCj1bvnY3qhA0vwDgsx70VLV1CCjFrCO2u6UYhZFzgX4YyZe3yvHlZMXqCt38lJLAUziGRz0h0hQ6ZRvcsAHXjAGSN2EjKGs4IjvyZy1vmmDj0/rkfzNREmh9cervWtFhUFnz/W8wC8NFMwq3JeYmUjhYUtQt8IYvuT731KvkHbu+qXZ1VcTwZ6u+egJjyi1MJYY/VQsw2d1MoS40QYQnMbj3bdMGcmQ+tVy4tc+RxFXUOhEAcK1JY3RwibJT8PqewN8XDIOkb8tQvrGS+K1shIena3hG2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LO2P265MB4600.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(136003)(376002)(39850400004)(396003)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(5660300002)(66556008)(66946007)(66476007)(316002)(83380400001)(2906002)(478600001)(44832011)(6666004)(6486002)(8936002)(8676002)(4326008)(86362001)(38100700002)(52116002)(41300700001)(6506007)(36756003)(6512007)(1076003)(2616005)(26005)(38350700005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?13WQxwHcFeeBaF3CSjBbrfJOah947NNsqpInR3BTV+iCLq2okek9d3YiioTM?=
 =?us-ascii?Q?Et1FeyEWXrFas5hF9BOszFJ+qc4G2vKa61yLfuMD8Nc+ujzQ5wk9hyZoR/2a?=
 =?us-ascii?Q?oGLXNvVz8mLRCzcK9Y50uXIA72kckTUWrE6Dy2JrYI2eOVwZ7DpMu+xRTMhn?=
 =?us-ascii?Q?oUXwUkmIV9ITWQQ9mFGa5aHIHxVAkikORI8fOMg04sW+AJTvL4gxWSBbxNvr?=
 =?us-ascii?Q?Fluu8dO999N2FrGqSfVshdtq4KKx9VuSACoavo8aKvfd0A3ZKKL7HqXNU0Ub?=
 =?us-ascii?Q?XSBBmnemhODCKIUW8HHjtCU5vLaHnNkVkzb72EyEyL13Lqt8BOzUg81jYPtV?=
 =?us-ascii?Q?G4QKWNCEojlb3wa8C9wvsJK2jEXP13g1EQtOj10Odv0LmLZcgKuUzHX4NAem?=
 =?us-ascii?Q?I/sI8g5bgQ8abwW1/KSJlENiVCDmwztdL0/pHQQ2/1f658imwrVtH83ErpEz?=
 =?us-ascii?Q?PWdb/djLNvyev0AgPxNq0C2xSHUvJErAREMtFAIGf5YDOJejvqPENLMUnFhE?=
 =?us-ascii?Q?pGN8Xsp3V4ijalNcBA89ZYnIdld3aLxFEgpmf2jV9v4x5NUZogYuW5Flzs8s?=
 =?us-ascii?Q?okZKgmxmVgJaGOJFerYFo9Xi23hmzP1YIbC8zIxef56PUpyoVjfe51gR23/y?=
 =?us-ascii?Q?W+BsgGgRbrqiPEoCkklpW7+TWUfNpMBqgm1K8zfs/st4KD8B68f6ppKkSamy?=
 =?us-ascii?Q?RdRBPTzKzl9XTP3rqH1okTuSNtIN6ZO2TEP6Y7BsGBmUFWCAxoBE2BZiKxNd?=
 =?us-ascii?Q?EI1qNN1A06yJNt3Qbgwea161+2dJB/gjNT1HpD1ScTExf37GGHTe6FWopeSY?=
 =?us-ascii?Q?sU1+nINbx2JaR9tbj2QW+kUPwV6B8tNwPEZfzkuRK+KnGjhpqjZkuKo86fd5?=
 =?us-ascii?Q?OOGqCtait6WFR9LE1IPeAy21LCyCTzvvK1l92gtvIXMmNBco0mRofhfgDvSp?=
 =?us-ascii?Q?D1WohcJao0EULRyiSwbtPhzh1bMNmKf3J8yGn80Byzj+7qUnxaQzdUhiqcTT?=
 =?us-ascii?Q?s/VnV9keXabqolYsmTFriz8ui5RCNIzkhYpyqPIKekOEgNe9NxZUdqaP1xFn?=
 =?us-ascii?Q?J8d1NjAvlJ2NU7AQE6o0zGmBS6qoGpKUaZ3AtJfeLF3Db/S9rgpqzHVYYG0W?=
 =?us-ascii?Q?O8J9Ele+z3fSG8uMaYqOoh5rjHIvYbxZWpMoCKz4/O1WTzM4fckm7cWBokBo?=
 =?us-ascii?Q?90cUrFfiGk5izLBTN3x5a30T6RvZdJaJexQAlZ6mKLY2ZyRlp3uEQm1j8IKJ?=
 =?us-ascii?Q?1C0CPZlQkV5DlXExdCf4yWR8OyYmjgBtfzHRtKZvu8cddKQ2SKdUsLVsafEa?=
 =?us-ascii?Q?IfdiEKm8Ep+180ZCozbhMs3Q2ysGpgp8AWZitKTM6zOytEps0NNBCwWpv8hP?=
 =?us-ascii?Q?QrCHO+kcD487zEUcmIYAE9uWZCvpe+A9vVP9bxDa4Chs65GBPac/BNrO/IiO?=
 =?us-ascii?Q?r9Qjy6CoYcfoSg3I90jJvq4ITDX36/1vl+9wkMomjmrexDplELeUT7ckCPTr?=
 =?us-ascii?Q?ZnFOFwu46w5QB6Lnfi+eCK+XJhEIG/e0j9h6Vncs6bvRBAKl5ar5Q127i18R?=
 =?us-ascii?Q?Lrb900bJBso1A4rpbiKEH7k3WMm+CY0DMWf4cpzDPWfjGuD/xVIu0XuWyN63?=
 =?us-ascii?Q?qw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aa37c0bf-e381-462b-c6e0-08dbf807f18f
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB4600.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 16:08:40.5463 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pRDTk/aWDcHKG0PBnRUyFBRC3QrPuHg7VBhK0ygv1uERSozM3QDOqvQ93woprpudDjRhWLhxLEmAC0cXAChawJv9rAww5KblA7qAfXHgyXs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB6228
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: 0xZeGb7dLckUgYh16dTydqZzT57u3B1u
X-Proofpoint-ORIG-GUID: 0xZeGb7dLckUgYh16dTydqZzT57u3B1u
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
Cc: mripard@kernel.org, matt.coster@imgtec.com, donald.robson@imgtec.com,
 tzimmermann@suse.de, Dan Carpenter <dan.carpenter@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Unwinding loop in error path for this function uses unsigned limit
variable, causing the promotion of the signed counter variable.

--> 204         for (; pfn >= start_pfn; pfn--)
                       ^^^^^^^^^^^^^^^^
If start_pfn can be zero then this is an endless loop.  I've seen this
code in other places as well.  This loop is slightly off as well.  It
should decrement pfn on the first iteration.

Fix by making the loop limit variables signed. Also fix missing
predecrement by modifying to while loop.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Donald Robson <donald.robson@imgtec.com>
---
 drivers/gpu/drm/imagination/pvr_vm_mips.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_vm_mips.c b/drivers/gpu/drm/imagination/pvr_vm_mips.c
index 2bc7181a4c3e..b7fef3c797e6 100644
--- a/drivers/gpu/drm/imagination/pvr_vm_mips.c
+++ b/drivers/gpu/drm/imagination/pvr_vm_mips.c
@@ -152,8 +152,8 @@ pvr_vm_mips_map(struct pvr_device *pvr_dev, struct pvr_fw_object *fw_obj)
 	u64 end;
 	u32 cache_policy;
 	u32 pte_flags;
-	u32 start_pfn;
-	u32 end_pfn;
+	s32 start_pfn;
+	s32 end_pfn;
 	s32 pfn;
 	int err;
 
@@ -201,7 +201,7 @@ pvr_vm_mips_map(struct pvr_device *pvr_dev, struct pvr_fw_object *fw_obj)
 	return 0;
 
 err_unmap_pages:
-	for (; pfn >= start_pfn; pfn--)
+	while (--pfn >= start_pfn)
 		WRITE_ONCE(mips_data->pt[pfn], 0);
 
 	pvr_mmu_flush_request_all(pvr_dev);
-- 
2.25.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C935263953
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 00:54:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF30B6F575;
	Wed,  9 Sep 2020 22:54:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750083.outbound.protection.outlook.com [40.107.75.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E4D96F56A;
 Wed,  9 Sep 2020 22:54:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ei/kEyBq1efU6aSN/jGPOs5edxSrky408DmqCVss3UY7u0A7kk/jdFlglCQO2e8Y0ADIzi80FZEVDGrDeYZ0ywBOy+69lXlN7MDneBbWzAJJunKuyA9eNU24MSd3xjiOEp8i5ihzznKApm3JKWqZK7ZWWgYzofnf1KCD0D52WVG6HbXQZ6XSJUTHtL76JNY0D617Fk6y7/G8CG9Zm9mz9BC8wcHlsWcSc7yD8ZfIxVkc4JnLI1aXAV3RviV/hLahvLSCxZ4J9YqJdXZjNx0g6f9YN1SXw6mJuopJk0sMibKbbsFITh3eB0lEL2N9En39bvHCwZt5jiefTbv4cvb85g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LsGkSND//QMcm6QNMK9AopcnDe5fv9Dj0RZojN/pOUQ=;
 b=bKBhiAfCABXXdSk8wPTzN+s78kssWS4R9nCeT/uU6EjvEZicIHUADxpTyxzXzZ/Pj+onVzK5FHvq+jObf6NH1OMNwD+njwrWqz7Rmgm9NbYxHAWH4MQ1jeFb9Tb77U+1+53D5PJDjdIl278M0Rfr7pPxl7W1PHChig1OxNoS71eeLFk2HwVE6DWM1abgbYbQ+yJy0hHzbITpMAtWIZRM9ABpKQDc1Kn5NW1/1irV0tHmliDOgi8uBMozCUemv5Sw6Qefzhe2C7wD5PR8huytKcTF7TAmHnkyOdWi3r9q0HYLoius2ntTIzzabcCKOu5+OU/DyppSkHIfJYC1AP31Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LsGkSND//QMcm6QNMK9AopcnDe5fv9Dj0RZojN/pOUQ=;
 b=tSbbd0LYNHKpsDGps6SqbkO2B0Il00Os71DIixFLhLhiuhKDkDHiE6WYw7/eGHRV21VhwRF/FEGC4xqJVgGzqOKYokQJFtTOh7NElXy9ITibE/Akk1fiEcywP5E5a8nGyd/gJatRcNBe0Mlo6sWOkya6Yd7jO9wsSCzSzAxN6eY=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4124.namprd12.prod.outlook.com (2603:10b6:5:221::20)
 by DM6PR12MB2986.namprd12.prod.outlook.com (2603:10b6:5:39::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.18; Wed, 9 Sep
 2020 22:54:35 +0000
Received: from DM6PR12MB4124.namprd12.prod.outlook.com
 ([fe80::25a1:ace4:4ca8:167e]) by DM6PR12MB4124.namprd12.prod.outlook.com
 ([fe80::25a1:ace4:4ca8:167e%8]) with mapi id 15.20.3370.016; Wed, 9 Sep 2020
 22:54:35 +0000
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] drm/amd/display: Rework registers tracepoint
Date: Wed,  9 Sep 2020 18:53:50 -0400
Message-Id: <20200909225352.4072030-2-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200909225352.4072030-1-Rodrigo.Siqueira@amd.com>
References: <20200909225352.4072030-1-Rodrigo.Siqueira@amd.com>
X-ClientProxiedBy: YT1PR01CA0143.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::22) To DM6PR12MB4124.namprd12.prod.outlook.com
 (2603:10b6:5:221::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from atma2.hitronhub.home (2607:fea8:56e0:6d60::10ec) by
 YT1PR01CA0143.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3370.16 via Frontend Transport; Wed, 9 Sep 2020 22:54:34 +0000
X-Mailer: git-send-email 2.28.0
X-Originating-IP: [2607:fea8:56e0:6d60::10ec]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 74fca6f5-655d-4d6b-cf00-08d85513529f
X-MS-TrafficTypeDiagnostic: DM6PR12MB2986:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB29863232C11AC798A012BB1E98260@DM6PR12MB2986.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sVvX2uDJN0MjymvzlVcDMoQLydpOu+/mTCp51QqKvXiq/XFzTJos30E2pqb63QOi3oKyM2hOMADraQYCoAuPGef/PWcc96dho4Z2ji4IvbbmOZ7DT1DDncd3MzKKECRQyyZyabG05S23QvGOWIxLLqJKnQh23g59uWxEvch1CkEoVmQVyxAhwPWQqNOorTZwTX7Z8tnCJ6VHPP82hSjuf8sdywH5q3AChqZT44ZBQolcijymHwjt7MJqigHTdMmGkGUCDnrFBze3veQReWgA5YFk5Fb++abRHkUxD3fhD4c6I4IrI1frMONbWkJWRlMhTQb13h2+bWSDaZ1cWjCwng==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4124.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(136003)(376002)(346002)(39860400002)(2906002)(8936002)(6486002)(6512007)(5660300002)(16526019)(186003)(478600001)(83380400001)(4326008)(8676002)(52116002)(316002)(1076003)(66476007)(6506007)(6666004)(86362001)(2616005)(66556008)(54906003)(36756003)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: uCMS0QiZrmtwwYiUzHZylOadFnNajiTnNgfdznwwOuptXq9FY2l1P9lgeBS3/6D3jO5t5ljV+Quxr7N6Qtt9s/0jYME18BZyeo/AWQyEF5FyuqVKqdsvJE3LzhXtpmsUrM6ff9AgEhxjfRPuIIJ/c2vXsrhe62VWt6/5Yp/TpNXzrgduO3J6VColidDwNnwoEDQ2QFhZ98XQ20yfbRWGKBTMwvACfpIryX36ddNMtiK4nCrEqiZJK6z3/dKvA4HH+OLeJHqY0hxB2Sc2yri6l43d8tiLSOsWRalEJUKNWOWuHjekwU9wUKztr+MtZx2onUUTS3VSRVXhm6gcMAqlwhwplwquRtCt3YQ+ifa26+Bpt8syVEkO+x72ceOdCmARsqpL/uV36GohFBRAkb2bWJlGKJXRicuY0JuzEyG4LqLXWRWPDFgGB07rHOsnjSXdG9kBfyq2JqP8OX8oN2xFonw1irDysgRe/4UBi4ON95sS4YMGf8tjbkB+lcIsrNWbkwRq7xu0/nCAsDYGivIqCpHH3aYTZuFv9XLVHOBvukWMdkJicTr9nhrQ2QPh2kngSd4HaRsZ74XPACpnenRlhsbXn2XDUwUhSvdq+DR6tU9rga+iDgiIhodG1hD6h4nv/Kf2pf9Lh2CoBYYT9Dm2mRdY/LMP0nOfI6ck4M0Nt00Ub+sJ1+kptTKAXSrZGIYy
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74fca6f5-655d-4d6b-cf00-08d85513529f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4124.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2020 22:54:35.3900 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O4ycvR4NZDNEYtGMVVREsRpgL1i1y26Dotw3yqCyidvk7q+fDGlXI+u0ZRBa0PHybf/GSdP4DWZeDPkyqwWeJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2986
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
Cc: Leo Li <sunpeng.li@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 David Airlie <airlied@linux.ie>, hersenxs.wu@amd.com,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

amdgpu_dc_rreg and amdgpu_dc_wreg are very similar, for this reason,
this commits abstract these two events by using DECLARE_EVENT_CLASS and
create an instance of it for each one of these events.

Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_trace.h   | 55 ++++++++-----------
 1 file changed, 24 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
index d898981684d5..dd34e11b1079 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
@@ -31,40 +31,33 @@
 
 #include <linux/tracepoint.h>
 
-TRACE_EVENT(amdgpu_dc_rreg,
-	TP_PROTO(unsigned long *read_count, uint32_t reg, uint32_t value),
-	TP_ARGS(read_count, reg, value),
-	TP_STRUCT__entry(
-			__field(uint32_t, reg)
-			__field(uint32_t, value)
-		),
-	TP_fast_assign(
-			__entry->reg = reg;
-			__entry->value = value;
-			*read_count = *read_count + 1;
-		),
-	TP_printk("reg=0x%08lx, value=0x%08lx",
-			(unsigned long)__entry->reg,
-			(unsigned long)__entry->value)
-);
+DECLARE_EVENT_CLASS(amdgpu_dc_reg_template,
+		    TP_PROTO(unsigned long *count, uint32_t reg, uint32_t value),
+		    TP_ARGS(count, reg, value),
 
-TRACE_EVENT(amdgpu_dc_wreg,
-	TP_PROTO(unsigned long *write_count, uint32_t reg, uint32_t value),
-	TP_ARGS(write_count, reg, value),
-	TP_STRUCT__entry(
-			__field(uint32_t, reg)
-			__field(uint32_t, value)
-		),
-	TP_fast_assign(
-			__entry->reg = reg;
-			__entry->value = value;
-			*write_count = *write_count + 1;
-		),
-	TP_printk("reg=0x%08lx, value=0x%08lx",
-			(unsigned long)__entry->reg,
-			(unsigned long)__entry->value)
+		    TP_STRUCT__entry(
+				     __field(uint32_t, reg)
+				     __field(uint32_t, value)
+		    ),
+
+		    TP_fast_assign(
+				   __entry->reg = reg;
+				   __entry->value = value;
+				   *count = *count + 1;
+		    ),
+
+		    TP_printk("reg=0x%08lx, value=0x%08lx",
+			      (unsigned long)__entry->reg,
+			      (unsigned long)__entry->value)
 );
 
+DEFINE_EVENT(amdgpu_dc_reg_template, amdgpu_dc_rreg,
+	     TP_PROTO(unsigned long *count, uint32_t reg, uint32_t value),
+	     TP_ARGS(count, reg, value));
+
+DEFINE_EVENT(amdgpu_dc_reg_template, amdgpu_dc_wreg,
+	     TP_PROTO(unsigned long *count, uint32_t reg, uint32_t value),
+	     TP_ARGS(count, reg, value));
 
 TRACE_EVENT(amdgpu_dc_performance,
 	TP_PROTO(unsigned long read_count, unsigned long write_count,
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

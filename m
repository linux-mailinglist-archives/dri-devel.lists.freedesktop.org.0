Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 485F32661B6
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 17:00:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9813B6EA81;
	Fri, 11 Sep 2020 15:00:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2042.outbound.protection.outlook.com [40.107.223.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C9966EA7D;
 Fri, 11 Sep 2020 15:00:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K5AkThR47vQDMsP7+lHlTfRDiFQGgsQ2AoC5G6y/VUN/AJsFWlKqH489UNvECk3zGLaR2hfwisFrP5xx93ByARR6rPx5FrXOUaeKI4Emy26gkGDMaTiIkR5cy1xTx66Wv1lTuOIjKCcFsCHW2PiRrxxYgXXkQoi1ZKFMw1pv9w+y9U6pq0z7UTS+YIZBIisPSE0+U6Bl0GHIMItAutRJZY1SdyDIDTwUiNWlV+4y9PSAC30fO+hwLmw51j1QVtMZkf5jqhQpDPDynLU7q5PG0pUfleU8Fxgpekc2ic4hHxTOBMGI4uqRMHcacFToIFHuO+f7o/p7I+Qihz9/9qxGcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LsGkSND//QMcm6QNMK9AopcnDe5fv9Dj0RZojN/pOUQ=;
 b=hCxzhNsCfjH9SvuXKQ958yIWBsLZB+1XbmPQ1k6norNICqD+kGkkimkWkxRQYhLM1yOS590ODJzkgxrmmZv9nJgBym1Nf/zW0pETAYtsj3sIbs61c+wjL4ekAdzDcjG3RTymjBE0x/b0rH+U0fhFbRIPJCX0MhqHb8HfK+YHOzNhFCCm6WQpL55sriywxFYznoP1JutmlbrzGwWIZ8YNuwxf4ZsgehSj8buLGICFWjiFNexiKX4agfr0K+JE/zPVjW70BMfU6u5CUXlIqGK+QCxfU1rhWCVX2Xs8psh8cydKaJw+xXRJeQPh7vGOwqyzui5B+hK+04LaHtBUTuK0jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LsGkSND//QMcm6QNMK9AopcnDe5fv9Dj0RZojN/pOUQ=;
 b=1S1/frMi7cewx0TBssehdFMlinqIyBCP6MPpRUuDe13Zo6s+US5YC5TWjFw52+G1y1a4RgX3ZLf92FuAPK3WqhOpBhvtjcKQtsts+dGlELUkuGhCPnyO/rmjKLsfNaO5Ss0IdHhImq7ZAUFNOdup8muLObxjWCi4FfjP9h1H0uI=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4124.namprd12.prod.outlook.com (2603:10b6:5:221::20)
 by DM6PR12MB3082.namprd12.prod.outlook.com (2603:10b6:5:11b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16; Fri, 11 Sep
 2020 14:59:59 +0000
Received: from DM6PR12MB4124.namprd12.prod.outlook.com
 ([fe80::25a1:ace4:4ca8:167e]) by DM6PR12MB4124.namprd12.prod.outlook.com
 ([fe80::25a1:ace4:4ca8:167e%8]) with mapi id 15.20.3370.017; Fri, 11 Sep 2020
 14:59:59 +0000
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] drm/amd/display: Rework registers tracepoint
Date: Fri, 11 Sep 2020 10:59:24 -0400
Message-Id: <20200911145927.401322-2-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200911145927.401322-1-Rodrigo.Siqueira@amd.com>
References: <20200911145927.401322-1-Rodrigo.Siqueira@amd.com>
X-ClientProxiedBy: YTOPR0101CA0060.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::37) To DM6PR12MB4124.namprd12.prod.outlook.com
 (2603:10b6:5:221::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from atma2.hitronhub.home (2607:fea8:56e0:6d60::e9a1) by
 YTOPR0101CA0060.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::37) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16 via Frontend
 Transport; Fri, 11 Sep 2020 14:59:58 +0000
X-Mailer: git-send-email 2.28.0
X-Originating-IP: [2607:fea8:56e0:6d60::e9a1]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2a1aa29e-35b5-4dc2-78f2-08d856635a28
X-MS-TrafficTypeDiagnostic: DM6PR12MB3082:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB3082A7D6BA6C142D73E334DB98240@DM6PR12MB3082.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AnTW7oXkB+ewr0F4S6WDs2uiYtT45Y0iDOsN9ty627i908u3GWBrH9v8cRjPauiqf89aBBm37YJ8C4UQr7YLNwMTSrHdcu0a+45NHAms2FaYNZckhtBWKoFU5N7CI6BqMYjcXovp9c4wEGRWZuKqMqSsmHuhffbrut85oFauPB2LWnq2/DfYEn2SoTjturglFlDCR3UjrcsYhEqQ+sy51V5bBhlTOTjo0PlMR0kkbYVTtFLucf3CJpoHrRkdHrLG8o9lJpVJNF0UTLqk/IMf2UWkVChYZR2aojz8TxCh5HhX1pRnzphA6UjWLPqkI0daIiVuhSUYFGLdddVe8wuJ6Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4124.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(136003)(366004)(376002)(396003)(66476007)(86362001)(1076003)(52116002)(83380400001)(2906002)(6506007)(8676002)(316002)(66556008)(5660300002)(186003)(6666004)(478600001)(8936002)(4326008)(6486002)(36756003)(66946007)(6512007)(16526019)(54906003)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: NH3rJmQwu5YUJsNPKEvwcd6O03OxiGZRSSmkaFvrlCg1j9plpsCoQE/KeuxsK2icGu4lZAJpGB6nxUQE/dM3Z6+A4+wW/MTcMtj/kYYPkgUyzhaZ8loPufiSSZExncMnOzDUCdc5CyEMxTNvu01L8LcKRWz7aJwqgubg5qTI0/T65Wv47YaoaHU06CT0d5nFD0ftHdwX+wXEohm6YVdIle3OTM38rFT9rTx+gI2uH1Xl/qLe/XXbt0clptjhVEi6iF5e6qJKwpqc9OlsiCcpGp5xu4blLA+u55PZWVBzuZf6VLWr+fbv/SEBdOL2HGCs6id9mCwV/8OurD6ScJgx3fN5sIN6ykA8dKHwphKUPuwDNVx+DzZ2OWSgBk4rBFy69J0PqvC0RHAdA2jUc9HzmRquN/i8KLWNCvAArqIpqOV6NdDJYBRZf48a2R08Xo7Z6tHl7W5BpOFXmm2sR++BwObBv6AQAzbXQO2mGm/dFQOn0T1NrDIZPhlAL9yVFiZxmnZ+NaLHsPGlvpzMjuG93+kfVbTv4lIxCt9frgGXeBqD+oAyf9pW+43f/ESIZz8QIk3XFpeFvvgb7QN/SvQMjjxedqVnGzn6+SCKOxLuP9R4bp8GPmD6wnfu0sD6SJCOXJkr9bRQxpm44AT+O4GKtmmx9rdt4Dmi3mferYHt38XeLxB900Knt2ZIkr9qwY+F
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a1aa29e-35b5-4dc2-78f2-08d856635a28
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4124.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2020 14:59:58.8871 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s4MsoXuaDfPY55iXvYXWKBeUnUUYnFlubEt/m39snECW6yyCt92jc5uU2q+A4eAQFEcIDx0oizMNlJRypmvIJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3082
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

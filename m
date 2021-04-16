Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 812D4361A4F
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 09:11:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBF3C6EB27;
	Fri, 16 Apr 2021 07:11:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2080.outbound.protection.outlook.com [40.107.94.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25B676EB27;
 Fri, 16 Apr 2021 07:11:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iVRzzW1se3s9oUtZL+YCXkdOWnpr0Fjg9vEopkKiSJbXTi+mYy3SLg8O6N3Uq18m9c7+sNJ7keeVWowpTzq6faxtNapl7KngB6/z1WaL1vPi+3K7F9HKprheiG7kd0dgjZYrwC3Z0O6HchopENFM8jmAXPbHqv425BCdR/Oml8skFHQKXk1PZhweQKTFd/KIScZJfio6629MEqmfusQSZxcj/w4MYQrLdJc+CQC5qtsCv2VO/5GDYUl8NBA7KQRohSNU59pHXV29zCOc8OAuM2mZLe4nhoNJDLkGEFMZ+crKSHczguXvipqRflu3kdrJ6NllNHmTdFpPruXMREFXIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qV3JhAA59pJ8l/QX7Z7I2pjbxjvklA7EZx7Czq3MuE8=;
 b=Kuh2uC+zx9v8lqxbLClABgsHUEDAopCAP6qWegPIwWP0Bv9pCphsQbfpdrSkKnJ/xPBMCi6EqrnuzP5UNUPq64zcWv1snagIbX9NeYybQcQ5V5kXvxUwCRI+zEEjt1LpQxfvNs944uqylFndGO1g6usOp0Kvea32e6W7sZe7KEuZMIK+D10sazvS9jzdjZdwZNqkgCcyGKvOD4HnrKQCZh4rJCE8ATa2wDXfSqntwyl4p7Ab+MEMS/hSk6Tk1QknYx8SahF12txD+fqXZY8KKEpac14okCeaXuBM1ufoeZ0at29Iw8Fog5LtFkNfxaztACRa4kISIy0Yo5qT+irICQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qV3JhAA59pJ8l/QX7Z7I2pjbxjvklA7EZx7Czq3MuE8=;
 b=UeGUj+aKJmDSK6VN/CLJdGFnqoW9CFSxgE/bnRD+LRcJtdfIyZ9Hi2s8h6r7PK0HgE8bV8NtVufJErWfzvs+6+G9JxAJqqQF2I7J90+6XDKNYsF+a0BYkJRSyiq2S2kx4s2OTSq8Ev4SRAzAxNyxTcuX042bmgyrgoKxG1WLGGY=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none
 header.from=synaptics.com;
Received: from BY5PR03MB5345.namprd03.prod.outlook.com (2603:10b6:a03:219::16)
 by BYAPR03MB3429.namprd03.prod.outlook.com (2603:10b6:a02:b2::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16; Fri, 16 Apr
 2021 07:11:30 +0000
Received: from BY5PR03MB5345.namprd03.prod.outlook.com
 ([fe80::8569:341f:4bc6:5b72]) by BY5PR03MB5345.namprd03.prod.outlook.com
 ([fe80::8569:341f:4bc6:5b72%9]) with mapi id 15.20.4042.019; Fri, 16 Apr 2021
 07:11:30 +0000
Date: Fri, 16 Apr 2021 15:11:22 +0800
From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Chris
 Wilson <chris@chris-wilson.co.uk>, Jon Bloomfield
 <jon.bloomfield@intel.com>, Ville =?UTF-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>
Subject: [PATCH v3] drm/i915: Fix "mitigations" parsing if i915 is builtin
Message-ID: <20210416151122.593610e2@xhacker.debian>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Originating-IP: [192.147.44.204]
X-ClientProxiedBy: BYAPR06CA0028.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::41) To BY5PR03MB5345.namprd03.prod.outlook.com
 (2603:10b6:a03:219::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from xhacker.debian (192.147.44.204) by
 BYAPR06CA0028.namprd06.prod.outlook.com (2603:10b6:a03:d4::41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Fri, 16 Apr 2021 07:11:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 46658c9c-9a86-4167-7b26-08d900a6db9c
X-MS-TrafficTypeDiagnostic: BYAPR03MB3429:
X-Microsoft-Antispam-PRVS: <BYAPR03MB34294B024B408279609EDA29ED4C9@BYAPR03MB3429.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9mwCXVQ+cLUld1TBSkbEipjQOKYQUP8wIBrc9s609SuTqZ2SKSE9wMehBpvP+jtOdB85Z+ZJzoibHwjb8nXl+reVnM6AyryHsNZoydZ1eF8dXuYYDrWHtaYQGsE/BDgW2HX/8+lSUjr8FKAiwJPv9h7K4qgRhQ48JUR+1HCk1qf4KKdjQzlzWX3UIyFn8EAup4ZYVgv9rMnqSB9WPJ707Ayz5yOHtQw9I8jWsVN/+4p3ZCZxTWQeGRA7QE3R7V+pwCrNKn9GbKPMtdPyfHD+DI6ZmFdsaIklaDmORN0xfT7StEBihyLgzsZwVEG7UcpdIvVWsFN+AR2ifwBYlr3QJA+dZqrwz7jbSDK8yBfAtxiGs/g0n5lahUlGNdp0ve0sXM2rfumJKMCf1LK1lKs/mQgwayaSeTs3FZTZmXryYL+aYFtU+vo5O4etz7PqL3gq/c2EyBtAxcM5riqLQ9bcp8+TnIwgtGF2kpehXHHelgw4Eu82wxUzID5o0NDt1ra5YO9sPq89eK2yr5XrxF3A4Gu+kXvW2d8EDc+MpCeWJIzYKvHBTXixBLCkpTKBMyapuSlUEcZVcTsUFhg1ihc5N7TzKIK92I+Lqhe0L5jWn+rtq2k0BdUigXp59MNxagQZG4Z5ZWudmu+gXTDE/iJjudgCMoYpVoOPfYc9WKst/+8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR03MB5345.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(39850400004)(366004)(376002)(396003)(346002)(7696005)(956004)(5660300002)(55016002)(316002)(9686003)(66556008)(4326008)(6506007)(38100700002)(52116002)(38350700002)(8936002)(26005)(2906002)(8676002)(1076003)(86362001)(66476007)(110136005)(478600001)(83380400001)(6666004)(16526019)(66946007)(7416002)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?40Jl4P4CRLneBArd0PGcBFNbqAc95paw45Rp80OZuOllS5Co/4EMM1e/GgCq?=
 =?us-ascii?Q?yQ7G/5YE+z8MszNYeyJUUn8k2SELrSaDlt8vPu56reFzVbEYOqk50Sug6sd/?=
 =?us-ascii?Q?jythuAKiFWozGKERSTYRd7haiZcidUKOeTuQct7QfCBTd/TvNUTdPXGXp9pM?=
 =?us-ascii?Q?jXC6YZMXTRudbCoPwL3ILsBOctmt9PG/bq6evZ0bL4uC2e5EFD1DRRdBMqhc?=
 =?us-ascii?Q?RQj9Ny4ZON8+rhMJPk+R/EN48W7vf/XPIiiJnaGCLk8qOQy0WX+RfjjXS3Hc?=
 =?us-ascii?Q?wX4C1VKfDg4IyRgrxAjYBRj7Xcq2Uz04rqNYiHwKYj+XWzBATW4cR3c48bDs?=
 =?us-ascii?Q?3RMU03al5TbKlDluhoN0qTNkWLPEdCU3PQLUry0Sq4pknJasTtiZ8c+PS0SO?=
 =?us-ascii?Q?GMOuR1lIDkrOUKo4zAMFUsJFwFsWht9agJ1z4BwAeXlL4W2N/GElGv3ZFW/D?=
 =?us-ascii?Q?cVLopU6SFLlGWw+bGuC6ndHDn5ifnDMhb7FuCSyHySfwY7y8DV9uKk6RkKd7?=
 =?us-ascii?Q?yOE1nLsNu1pDeAUMbauW52357ttrAOXEtZ3LCMQnvs9PU6UsmBBnIrDI2IFM?=
 =?us-ascii?Q?bZwAHLuP90vW2mHyLqWqmibHVgYeNQA4ayP9DWAWAyDzrn4pMpR5lp7txTH9?=
 =?us-ascii?Q?IAzLf95qQVVrH5OCqXqm5PoI2W9SAufP1ySv6qzTE3VSGUXw8pMNHrkMYlTM?=
 =?us-ascii?Q?cyZdbBNxw93lelUOnc+n9sRNaDU1JZiFhGmqNaDFNjxwq3x+cU4wtwRhqd+w?=
 =?us-ascii?Q?rC6rXYaUYMGAbantg7QYiMn67E21FTCq5pmxj87DtjyWYyh9i6oiEtMqf46T?=
 =?us-ascii?Q?xDy1OwpGJCoHMGUwBs8m8GcCq8NIY8oF6Sp/XYwDYD38qsRF/WAUG4MDGEPP?=
 =?us-ascii?Q?ejYSBhl1JpK7/YexSagdpivrK1M0Sq37f1ME20Cok/RQilOX6RP8+bjofznT?=
 =?us-ascii?Q?lG7q4IqdbrI3/ogFUb+GOxVXGKYl9r2zfIZE1cK5arfX9zuzutOMkTUaPElx?=
 =?us-ascii?Q?WfmRJRyacXY0Juz/+sUdmlR0HTTEgtiS0fuSCi3iYJk2Q7t7a/oCvMWL+BWX?=
 =?us-ascii?Q?G1TL8Dgk2HWCJdTYOnK5bFJObrVEixb7vRW0mvAm2moHRMMwNVDsrMlxmvtW?=
 =?us-ascii?Q?q/UcE+ArxPClcN4dVvI2jfIhkHiRUEMo82EcLexlvfzHhZ3izL5p7tjPaXkj?=
 =?us-ascii?Q?PlgUQ1VL+FbCuYsJRJIm634ZTg4ERjIXfdNe6sVSR7QdwUJAe2M9Fe0fsnGv?=
 =?us-ascii?Q?DT/R+bzzlXQCLzbAcl2qbXq5nBCdxGppi+MunGA/7F2Puf8iDVtfkvhyJVpg?=
 =?us-ascii?Q?fBMlQn2dDlyXnz+DFctE4Y1T?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46658c9c-9a86-4167-7b26-08d900a6db9c
X-MS-Exchange-CrossTenant-AuthSource: BY5PR03MB5345.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 07:11:29.9787 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HziZDd6HBzsNMo3nrz1rjkntAqnBOzmRwXY0CrW0H9Lg3U1Vnn3styGhY843I6OL/0DjTPnX1itAZYJtRj7gRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3429
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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
  - Use strscpy() per Ville's suggestion.

 Since v1:
  - Ensure "str" is properly terminated. Thanks Ville for pointing this out.


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

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 322EC7D8A3B
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 23:26:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B300410E8B3;
	Thu, 26 Oct 2023 21:26:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03olkn2064.outbound.protection.outlook.com [40.92.58.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CD4710E8B3;
 Thu, 26 Oct 2023 21:26:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F4857gl0ZOIfwkYRGg/8E0G52L0KNWjT2dduxYHnsd/pMT6j3WvinU4Vh1tA49WOxF7Mmne3qvz+rSOtzLFoYhhEhE2d/WvsY/PnHBlbcWs28UKMHox9uNOLvLaH+MgFgxJu6PdJxvarauCvjMn+q6k6d1mmKnGR6SK7U93jqJzUYYw1SszbwJhS4ACrOW6kg6E20jeLVqJYmLEhNlVBRRDAPgVsRVvN1V53a03Onbd/FqQtXN7WZxMQ/q1l1S3DY30oZP8H8fAhuQUZCKG91f34SpuOcIld6OW43TK67W8xiskePRhXu30iqs2InVszGMaE7tPPfJ/4pC88Bt+zdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vvTDWnP6BP4i0z4ePFmSjQRmIPt/0p278Jda4TnVk8U=;
 b=OXrG4lrrSKe9bXW+Y40j6XaDvLPzG+h9By8aR2KrpMnVe80/gstYJI8IhlZCPAoe64o2ujK2G6apwu+0LgINfvjMAUECHchPPXmS1UeNnSfgZG75mPs84b+k0kWIW35rCqJ7CiRBujDdMhi+C/uCbWdJD2YxD/3qwhYo65EbE2+FJvqDVZPhEf9iPWjCy1XFr9aAGOruwcApubm454Gc+Aog28ZhQg7faPfRFgwiAZYVa5YUn7Y8ngK2e37vIO75VhYRVDVxMQSmcbCge2TtXXpVtzl2hcpJmlR9l1qDprGnFVrL6ralwvp0UaCRdR8Jb7dSBs/j1OeE3EU3iVZZ0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vvTDWnP6BP4i0z4ePFmSjQRmIPt/0p278Jda4TnVk8U=;
 b=uHekLsnVB2Bp8+epGTB6sLSLdXJ4h2xxj6JvuTmrGeAN3WDlzRf1Jn0KoLdnv9VIzHWDDMWxv1BZeSPFxYBn6WLG+S/bJiY591TqcsuO3xVlu2/jWspzQOFjHDdLJTXetLjSyo1SmwrFEZm3KQ8LSFkuFoGUIsmyWwANGfqQrsGKq47KYupvH0ysRvivOXSJ81pERfdxlJ3W53EB5lQgMcxnxFexI07i7qaHf+5uiY4n7HgtppCMsH7T7sNVJZnKB7o3iLpuqXdWxYEM3Oc6DLIi5L9+8MHMYSOBo2gkxLULsX+ej3u97OcN31FsDPV5fBDAifZQVosvrzkAAKEMaQ==
Received: from DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:42a::7)
 by DB4PR10MB7470.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3ce::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.23; Thu, 26 Oct
 2023 21:25:57 +0000
Received: from DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e2b0:8d7e:e293:bd97]) by DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e2b0:8d7e:e293:bd97%6]) with mapi id 15.20.6907.032; Thu, 26 Oct 2023
 21:25:57 +0000
From: Yuran Pereira <yuran.pereira@hotmail.com>
To: airlied@gmail.com
Subject: [PATCH] drm/amdgpu: Fixes uninitialized variable usage in
 amdgpu_dm_setup_replay
Date: Fri, 27 Oct 2023 02:55:22 +0530
Message-ID: <DB3PR10MB683590457246A6625BAA6102E8DDA@DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [utdfQUfuOHrvZaYQtSo/S7KqlpK/7k6M]
X-ClientProxiedBy: JN2P275CA0038.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:2::26)
 To DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:42a::7)
X-Microsoft-Original-Message-ID: <20231026212522.1242103-1-yuran.pereira@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PR10MB6835:EE_|DB4PR10MB7470:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ea3fef4-86f0-4657-ede0-08dbd66a2474
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UrAQx8wOGD9DqIlXaZ2UI/Ax4EQiw34khcm/17TVVi9IcsTr3Cd6GCI0kJoNjpGqRyN+VI3nmOQid9ezvgkVs9y8nbFE8h9RQnME3JqSTgCBBept4fdbNpXfFQdCtR/xr2jq31Q1Bvt40kPUmleu9j2Q1UoXylIMeE/LYbR9eZsnHa1J4ObjMrJRnTFp/RML2wPF6JKrP3MmxDHJTuqAI5xTr6tqB3LTb0bLvRDzxpbc89O+8rUhDd7VLAWc2RARgwK3ByXU6UcJ8rIY6WmEjaQ9Jm5rscWfiqUxYxZL5rk9cTZYwYqcOBeUlhOBlHMK+jA561uRJPB3xh8T57s/7k48bEh+vx2sdLQ3VlM4B+Su7Lr24sCJ8ReC3JBJCaf0ovygpQPu8J0EUlUMuKyt8XIBf2GNfnrjukB7SHXus2gRHUIBmz10F9xAOsv+NeB1B91QVYuWHaKAMzOh4aumbDNwEA52UmLRU+HAEEdeC/F7diQSPdKuA2jUbu5hXGgTb1E16ZD5C6pBCtwqPvvntKBhuO3ba8wY3Lqa3S7fsnwsWK+AaxRVbug1xXFKgEv//7aSGYRxkVhePyxrinkUxfiWaGWeSNa5nWQtaswSraM8sWr7HriajIjKSAnVvCHZ
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PFJvyyvt0T9qQRR5QyMFKcL7dZqC+CGMSS8JxDOFICdLjm2+77000u6u1711?=
 =?us-ascii?Q?7C/0GzloFIGQN41Mc8NKqkwVAfhLVAyEsSIo8dSOsijOSKje3ZAgHy+1PSDG?=
 =?us-ascii?Q?uGcvTj6XNuLajAFxuB6B/sRAQOovouEZMt/GV3Ba0Qjkz5aTkEKXqVW8htT1?=
 =?us-ascii?Q?Z1bubkVKhTXmGaLE1zeHk+mbpV+LxcpY8DrHIjST4WvAdS6Zlp3uGx/XrGni?=
 =?us-ascii?Q?/qZVpPfkVFAzxopR5AAkK/YSRdu/9TjD+O2m1NgQcm68jPxf0kiR+8ipRobW?=
 =?us-ascii?Q?hhDGQ7zTIenALSLtXkS7niiQM3ipchgWilOywLq1Bhh6LpLgFUyZ9YDw9Q8L?=
 =?us-ascii?Q?MpwEfeJdESRQxal5oxjO/aAe8cQuwJdoINBjV4O8B2Yth/eWwoCkwVXKHI/g?=
 =?us-ascii?Q?vOdbt654oQC+k4TZ0ge+Mux4hL74uiqUZyAqYShtpLdkoGtFBfSmlpP9Cjqr?=
 =?us-ascii?Q?HOOvmRItn5QT1QtK3usJPI8lRDQ5ipoZeUhSiQRgfw0WZaDj+lectLGWq6Kc?=
 =?us-ascii?Q?TrYt51fYXFypxSNk+w5dhIm0UJ7g2yMrkQzDxsm7rcEnsfZtfYPQldw4ntC4?=
 =?us-ascii?Q?OWTflb5a3GxwALDBZpMg4ngWOWGp2miGjZ+uqd1IBDZb3N6x7TVF+P5oVp/E?=
 =?us-ascii?Q?mAMOMbIBHgQnsCLn9ZSdr/Zby2W+rSWSPBxGE+QGRUc3ejS0rAuY7Se3ILn3?=
 =?us-ascii?Q?G5ihgcjL2iXr1AgNUC8D91H2f+7I3DKzP60Uqimh9brPpR/bVy33T/WMTuY2?=
 =?us-ascii?Q?5l8bvzmAerbSjEpKz5KzI6n79wmOX+Uk5uGx1k8hcsO4IG5x2TH+avqzvWG6?=
 =?us-ascii?Q?/K8130J10SsKjYtvk27FtdSrRNk6YG/sOBQyFKoKuYo0s/M4wG2KK4EA9neq?=
 =?us-ascii?Q?Bf088RvEx9r2ubs+8FHt4W6iJV+p8nYak0z5Qoc3zL7T3TV6CT9QqXkM8UU8?=
 =?us-ascii?Q?qHBrEJLobFz1UUCcZgbgSfw4TAhLGZoADWT3jd/EvMPjiZeQgbawIlxc9F4u?=
 =?us-ascii?Q?lIfbZW0ekVqhm3nsTV4NCQOGMOhxXL1s6TyM6FnA3NvgbyoExyFVvZ04Q3wh?=
 =?us-ascii?Q?cZGl1C62/elCv7uX+/pgj+ywZHymxGjBZQYQkmCWTlNhzaHCu+reOH5BzO1r?=
 =?us-ascii?Q?lM3cuYI/5KPrxBSuOY1W5Ri4zE09iEU5jwBSZu9mWu8twAorVLpE1c/vRgsD?=
 =?us-ascii?Q?4RIRHFd0zfk/ADlyIvxeMBCgAAR26aZiDpehQkF3gQsoxAeNruyubFAQWbQ?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-6b909.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ea3fef4-86f0-4657-ede0-08dbd66a2474
X-MS-Exchange-CrossTenant-AuthSource: DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 21:25:57.4774 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR10MB7470
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
Cc: sunpeng.li@amd.com, Bhawanpreet.Lakha@amd.com, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, Yuran Pereira <yuran.pereira@hotmail.com>,
 christian.koenig@amd.com, linux-kernel-mentees@lists.linuxfoundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since `pr_config` is not initialized after its declaration, the
following operations with `replay_enable_option` may be performed
when `replay_enable_option` is holding junk values which could
possibly lead to undefined behaviour

```
    ...
    pr_config.replay_enable_option |= pr_enable_option_static_screen;
    ...

    if (!pr_config.replay_timing_sync_supported)
        pr_config.replay_enable_option &= ~pr_enable_option_general_ui;
    ...
```

This patch initializes `pr_config` after its declaration to ensure that
it doesn't contain junk data, and prevent any undefined behaviour

Addresses-Coverity-ID: 1544428 ("Uninitialized scalar variable")
Fixes: dede1fea4460 ("drm/amd/display: Add Freesync Panel DM code")
Signed-off-by: Yuran Pereira <yuran.pereira@hotmail.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c
index 32d3086c4cb7..40526507f50b 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c
@@ -23,6 +23,7 @@
  *
  */
 
+#include <linux/string.h>
 #include "amdgpu_dm_replay.h"
 #include "dc.h"
 #include "dm_helpers.h"
@@ -74,6 +75,8 @@ bool amdgpu_dm_setup_replay(struct dc_link *link, struct amdgpu_dm_connector *ac
 	struct replay_config pr_config;
 	union replay_debug_flags *debug_flags = NULL;
 
+	memset(&pr_config, 0, sizeof(pr_config));
+
 	// For eDP, if Replay is supported, return true to skip checks
 	if (link->replay_settings.config.replay_supported)
 		return true;
-- 
2.25.1


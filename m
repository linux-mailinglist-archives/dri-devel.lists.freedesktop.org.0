Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83AB88C4361
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 16:40:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F26510E23C;
	Mon, 13 May 2024 14:40:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.b="Qfc5NQnl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12olkn2081.outbound.protection.outlook.com [40.92.22.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C633610E23C;
 Mon, 13 May 2024 14:40:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NdnrUkacYe4gbJCc5i0dXIPtzviV2/8EDR+4flrVn07BTIz/ipprpf22vu08Uw7E/DMNDUln64IXslmBXz+vKNKA2v7suQExqMjs69nRB6amxNlBveKMWSd7bRKKdMKQTBQrCli0DnoWl3P8MJgjUGOSSZ0kl/gtMTquaLrIsYddhMFTU0/XL77SkY6tQZqAEvf2KbWM6X+u7NcM2egYR+F8fELETFoqFrH9j6f2pqnh9AK1wzXyvm4C5bae/h3ZvVG9ThMSBeHapjMo/poQYv5iIT2h2DzPtmWAuZNb5Ab4zXZWBD70bBif4z7XYN/CUbeB+9c+pLbO/Z42sNdjfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VvRl+StmkHaFehd/MMBoYOKyiCNtvpmt/HupBTAVANQ=;
 b=RCBJWke18tk5Dr3cZSY/fAx7WPKOKuad5pB4dXf224iCvLEL+cssI7vPSlXYBeZE6o1d23KAToLCuwLXLs7sx+VOPq2TpYCmyHfRzSCm0KxNZe6sMDacMqXv22KMK4YwRL6rVKkTROD9UL/CpTEsqCyx7AReHfljd02lZ+Wq8fCyuhNxbjlgacQ0BGBKExCSXQC6bGREvyq5Os98mmlpEGkXMHbnGOrDqyMUAAqF44Y9jAq6yFjwcmbYzJZRB3a+XKT6gXGrqEHDHYobWytUnaJX6UaT4PgbZMTI7v5Vhxz7Bnp8pLpOFecPt3ZFkLwt/ZTQSHDv2G4wcO48hH18Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VvRl+StmkHaFehd/MMBoYOKyiCNtvpmt/HupBTAVANQ=;
 b=Qfc5NQnlrhwl7fAEnWO7lu/LytKcVQrVjzTxJp864KTd9HRIvBBKq14dP4olDJ6/EW8Ahj8/thU4HOhhNfW/uRdefyINVlY8rPxgQd4N6EY+S9M7dC8jBL1M165PH2ZlO7tY0+dx+sXH8KBBUBXKCaAdi3JpsyfZCwjnDKDIaXrqnnKo1cV/txyZOfINb2lzTL5Fy2Q7ChYJ8H529GjkIxoOqFpLKzji87l1xaXxYqppHJVCKilYYo8YiCWS0dNzPmspjsupUVm2cOPDkn3BU+YTjFwmy2NIe62wHLuBBYihWoikliHrdaHYs4+otbEZ91GbYUNC9MO6CF9FGx48WQ==
Received: from BYAPR03MB4168.namprd03.prod.outlook.com (2603:10b6:a03:78::23)
 by DS7PR03MB5464.namprd03.prod.outlook.com (2603:10b6:5:2cf::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Mon, 13 May
 2024 14:40:02 +0000
Received: from BYAPR03MB4168.namprd03.prod.outlook.com
 ([fe80::b8b1:7fdc:95d4:238a]) by BYAPR03MB4168.namprd03.prod.outlook.com
 ([fe80::b8b1:7fdc:95d4:238a%6]) with mapi id 15.20.7544.052; Mon, 13 May 2024
 14:40:01 +0000
From: Jiasheng Jiang <jiashengjiangcool@outlook.com>
To: nirmoy.das@linux.intel.com, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 tursulin@ursulin.net, airlied@gmail.com, daniel@ffwll.ch,
 chris@chris-wilson.co.uk
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Jiasheng Jiang <jiashengjiangcool@outlook.com>, stable@vger.kernel.org,
 Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH v2] drm/i915: Fix memory leak by correcting cache object name
 in error handler
Date: Mon, 13 May 2024 14:39:52 +0000
Message-ID: <BYAPR03MB41688E0CA5B01A0017EFD33DADE22@BYAPR03MB4168.namprd03.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [YuiExJdkI2YO9YxmnzQ6r7s/D/uYf1uM]
X-ClientProxiedBy: CH2PR04CA0030.namprd04.prod.outlook.com
 (2603:10b6:610:52::40) To BYAPR03MB4168.namprd03.prod.outlook.com
 (2603:10b6:a03:78::23)
X-Microsoft-Original-Message-ID: <20240513143952.2787-1-jiashengjiangcool@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB4168:EE_|DS7PR03MB5464:EE_
X-MS-Office365-Filtering-Correlation-Id: 18790f6b-f555-47c9-b37a-08dc735a91a1
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|461199019|440099019|3412199016|3420499023|3430499023|1710799017; 
X-Microsoft-Antispam-Message-Info: KZBjxWvI7IapnUpF9KyEYplQ69EZ8ULju/pTcijD8dnWJbV7lBjz7zcR2FdAp4aY5ZQJYKwklwCXekYeI+eUy7CSpayiWDke4eMadpBAnKfkucykz9rtPKkle1cNpUBK0sLKw2XMUTeP4tbqxw0sAe5X2GHCenKY0A+5ffu3Bb5djhFy/L5/kn2R2qb864RXN9uFR58RzMAFqc6zHmwj7F0hxOIQWXwHjnqIDCdVB6kBZ/5MjpWYfSPjuetMe1ZtKau/N7pJFM8nBvZ336n2PAN4CKV/yb/TWHuUaJGJMIrejbAP+R96A8yxp6HxLoGTmB7OigxgvAO5NvEMiuDYiPpdU6GzbdgJkOWTTOwDlXyUbOxyPXtsk+eUDHTeiTIb20DijNe+d0qkR38z7euGBoLVfofyhg2AODvD3hEgRcv4yFQoKccckIx7jqtRll+hUxynSDJ9tRfezlND9nXYbBfCASVaqI4GWgnXYf+Y2Y8DvQHreqw4mRqeBO6AumO7l7OHGwC3taSFJhGvfFcVmbJdNPzuPxmrgSqdphK5cX2PNVxQzaS6XF0Xzz0VSoih24c/sLRQHbonFgYI8a6yunatjg0NC7LSHlHLNFO5TAXkwOVtqtArwmWKI8UaAqS+
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AFZA6nTJq/gNXLHUft3z1j9rADPDiVAEApf80d1742s4DpJq4qSuKR5XZT/V?=
 =?us-ascii?Q?jwaC9feCyiXJ9g46VSyKi6/lBEbp+Jl94yLTyT5AhlRef9jse7zVFveLJZHR?=
 =?us-ascii?Q?eFPxxq60/eFq3YJvYd8y3ZjiuGghoF7PHHaMVDIIq87Gnuc+5Y5KIXf0zneJ?=
 =?us-ascii?Q?rcqJjqpnr9jaFEgYIonZTixFqAcqGQcslkS5+1L39MJsWULIWmzbBiJus5+D?=
 =?us-ascii?Q?3S+nHOOxdR4k+vboCViR7SzTEZL7q9KBWlVfHb2WJlL/2xktnCEL0lkpF/qw?=
 =?us-ascii?Q?YQMAhZnkzZ+tP+NhFcNaKxWDhpGqZKfNJVBJJBGpZtHD2hKH+VzVbGv+YcIz?=
 =?us-ascii?Q?P/nXMy1fKQHLkYBWnEUKom4MpYNj7fPTZNOo3/8HIG036FEpfXMaMG7vt5Ep?=
 =?us-ascii?Q?kFBAc3bl3MaO1f5i3Jb6pLNHIqrQx3zfr5JjZcGKnhU9IpWyHDKnxKVdnDMi?=
 =?us-ascii?Q?q0nVL6Ec4WeSC74mOH6oLYYRhQkW5xeDMyjfSvwJBDOgpF5L7h7C2UWrxOzW?=
 =?us-ascii?Q?QbTQOOQq0znT8YS7x5BVbPjUiGZs6GURmyoK3EWQ+q0+plE4EmYh7Y4ZzIJM?=
 =?us-ascii?Q?AyCTU7BpmMuVNB/y/xHU725wbCZEUM8CT+yfdTg3y2zon6RpJkWoiH92e35v?=
 =?us-ascii?Q?FULbkLRdtHRGRuvSDVXBDUgJDAYcSKx2YRXDAeCHKc2TCu2MrT+Re2NlvsE0?=
 =?us-ascii?Q?2TNdcmm/MpxyQTUxekl9imPeXxWe11qmnLXKH25NqL0yBCwpzGXeDGL4yZtL?=
 =?us-ascii?Q?AYrkqgj9+9RhLWkkudDkmd2zEdRePyM2t650Pkz5xcpaBSjAparkSXkYZzrc?=
 =?us-ascii?Q?7/Hn+oQfA0zkWeIfDNsOsDdc0fRLoyeLYctF8MvMgnOeDuiBJ+Qsy8QuXYz0?=
 =?us-ascii?Q?TdaQo4QIcaS4B7mr5u795rijKIpW9DW94ASNJ9NKoW1mYPuCsdUbPE3ZuB5C?=
 =?us-ascii?Q?UaQBUdfhQb75DuzLmkhuEwDbubifT/ytbUKX039qNzHRNk/Jwt7P9masiKhG?=
 =?us-ascii?Q?NY2w788zpF+THUIUKF8tGo8Z44lYpI5K9PCsXCUAKKgDMRBquoSCUXDFlXEC?=
 =?us-ascii?Q?2CPenVtjPENAsRCpOS8pMub++oHI4rgtgitanaLlzgjLuCanVwKnkaFJwFpq?=
 =?us-ascii?Q?oWXRJPePTydqW0eZ1+JEHiYCshjIGe2CL15BJ/OhdkrjggK3LLGeYpjEjoMC?=
 =?us-ascii?Q?GVXEkEg6yNmh7AbMFyewg6QAqJhhpA8wGwX2CxPmZWSkCLVF1DD/3cG5qbhC?=
 =?us-ascii?Q?jVzvVjiL6T0eIyCNCdIE?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18790f6b-f555-47c9-b37a-08dc735a91a1
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4168.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2024 14:40:00.9407 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5464
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

Replace "slab_priorities" with "slab_dependencies" in the error handler
to avoid memory leak.

Fixes: 32eb6bcfdda9 ("drm/i915: Make request allocation caches global")
Cc: <stable@vger.kernel.org> # v5.2+
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
Signed-off-by: Jiasheng Jiang <jiashengjiangcool@outlook.com>
---
Changelog:

v1 -> v2:

1. Alter the subject.
---
 drivers/gpu/drm/i915/i915_scheduler.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_scheduler.c b/drivers/gpu/drm/i915/i915_scheduler.c
index 762127dd56c5..70a854557e6e 100644
--- a/drivers/gpu/drm/i915/i915_scheduler.c
+++ b/drivers/gpu/drm/i915/i915_scheduler.c
@@ -506,6 +506,6 @@ int __init i915_scheduler_module_init(void)
 	return 0;
 
 err_priorities:
-	kmem_cache_destroy(slab_priorities);
+	kmem_cache_destroy(slab_dependencies);
 	return -ENOMEM;
 }
-- 
2.25.1


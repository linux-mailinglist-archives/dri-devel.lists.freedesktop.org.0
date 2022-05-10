Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34EB2520B76
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 04:50:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E845E10EC40;
	Tue, 10 May 2022 02:50:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2137.outbound.protection.outlook.com [40.107.117.137])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA19310EC40;
 Tue, 10 May 2022 02:50:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Iza5JQ3O/YkGwbWnIkNJfffea1DLNQXDHmKZUjQEkh4VrwhOohyTBLYYtaaG06cItWliHb+NXZsvgeLdSPFxmvogqLEKldC0E0uI9sEbvZ1Zv0lLpJg+jCV+kiPSf5+qiiYwIbBJLKtDcFu3qv1qyr2iGw6T1nW8WMUi7XcI8HQHP6IjSrDItqJccHj2r2CEpRpCBQ+MaO1q21cat46GQ3XV3deTr3Re9xJKiwCvmR/VYNa2eDa/PKrwFN2DqcackWJroahrHnD0V2uSsSkda2yTlFhFjhQIezC6+hnwuAs7Dn4XkEFkWFmUPLWlQTu9V7NtRqiy5rjwUyE2/KXe1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yoHxogDxYDxX+S/2+YUINxLLcj07DwfUBIqUUdKXpjQ=;
 b=eTVQ62px5I62dSXlINyuoza8KcdocveFNnkEh82NhkrcaxkRrpx447b9ZHuKcGhuIp/+tjl/lwu2xjfg1InMD7LzX93lT4jVJoZRPkOCNgs+yuYSgH/bp5Q1zyWcFaf/dalRkzZlUECE/n+54P1gID3kFkRycj75HHPUBMKeAyIHFQdxPLeEzplwSKahC2fJ9gQLYwR0FRJek2eIZeHOaPgBRl7CxIi/oY1ZzMO2UWKCWK2zRkfmQK6+R8GpOPXzsW3zf8x0uDck3vCLFgPurEo/DnK1DplnlNbwPZNEnPJSzOi6wP+/Blg8SFteNGwWUUAtQkLcrXJfTvHGGF8AWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yoHxogDxYDxX+S/2+YUINxLLcj07DwfUBIqUUdKXpjQ=;
 b=lyjRlzXKX76Mnp2BRiUVl+mwfBFJ5hhuQ42efYE8rWzSS1OVhwvYzK/F9nEKaIZE3aicJIIQLQ9TFSqHvFFPDoDtwnkrnrKO122OP/wCtvvMxR8uyX6Bj9SzM7ODSAEunLWFuV1wmmgdiLF+BsejYVGUEdnRx0UeZCV7Ntgaml8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SG2PR06MB3367.apcprd06.prod.outlook.com (2603:1096:4:78::19) by
 SG2PR06MB5382.apcprd06.prod.outlook.com (2603:1096:4:1d5::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.21; Tue, 10 May 2022 02:50:41 +0000
Received: from SG2PR06MB3367.apcprd06.prod.outlook.com
 ([fe80::4591:4f3e:f951:6c8c]) by SG2PR06MB3367.apcprd06.prod.outlook.com
 ([fe80::4591:4f3e:f951:6c8c%7]) with mapi id 15.20.5227.022; Tue, 10 May 2022
 02:50:41 +0000
From: Wan Jiabing <wanjiabing@vivo.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, James Zhu <James.Zhu@amd.com>,
 Wan Jiabing <wanjiabing@vivo.com>, Leo Liu <leo.liu@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amdgpu: Remove duplicated argument in vcn_v4_0
Date: Tue, 10 May 2022 10:49:58 +0800
Message-Id: <20220510025004.2561532-1-wanjiabing@vivo.com>
X-Mailer: git-send-email 2.36.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR0302CA0014.apcprd03.prod.outlook.com
 (2603:1096:202::24) To SG2PR06MB3367.apcprd06.prod.outlook.com
 (2603:1096:4:78::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f19191a2-2404-4e2b-d953-08da322fde84
X-MS-TrafficTypeDiagnostic: SG2PR06MB5382:EE_
X-Microsoft-Antispam-PRVS: <SG2PR06MB53825AA248FF72DC5A683BB5ABC99@SG2PR06MB5382.apcprd06.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JU/iN1b16pKnc1pCkiARy1MNPQs9+CIief7nlIW9Jq3JwzmgRQ+wcU504ZyAmRgLPyGFAMjYVbSrAOsTtr8L29Sw73X7a9mII63Em6FLVqs8NwDWpeu+3gdQzsqzovKHu4SkfASs9csf5DSyz9akJRfCVyh949DW2fhIFTXwQthUg1yx/CIV8qYyalH68I4NYcgBM3Bse9sd5aLRZ9RMBFyETVJ1bOu8lorlTPt1dluQLrCos3lvqvgy8mAHi3Q42RKwH7SD9KW+ufd16LVvS7oj0AMt3EucXAU1PjzY9y6xGO5IIS/xmQ6aC3ceNqpTI4irbkaBdcvEGDmNRUoitOv1dfQcpFwc73awdjbrzs7nbQE7F5PmKxzMokmFqmmId5d87BrEeLvpO23TUtwjrqeA/Q3SNKpameQrWztRmqoCE8fFzSTzazVH/IRKT5UsBMr47BBZuGIp/tLcLoDgVIggrBPjSZuSmMc6IbpkDgyuK25Xy7eoG69kB+8U3VJzJT6GoOuKWbNo4gQOv9l6yRlA4oVeuq0Gr/S1n0zdyNHmFoZfxfJoSjbuboLBhCqx4t3ybITjSaYKOZEzArZraFCBU/70+UvDAQZW3LbMmwyiLEBJVjiYtC15rCC6qBowWFXpRCyx63W1+wTkx8Twv22DIqTtjMysFVmZN3Zkn8/LVja2bQHbcTIwL73b1+eqPwQxQkWMSUqgE2dstckqu3m3YR9Qb3QW/6TrEf+iuDs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR06MB3367.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(186003)(8676002)(66946007)(2616005)(66556008)(66476007)(83380400001)(508600001)(1076003)(86362001)(8936002)(6666004)(26005)(6512007)(6486002)(6506007)(316002)(110136005)(52116002)(921005)(7416002)(36756003)(4744005)(2906002)(5660300002)(38100700002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?E0MLYQMyH9KlOK4KbjTuO9KMcuwropvm3pKW71r2XSqKWIWiHw9eUr2GUgVU?=
 =?us-ascii?Q?/cs2F4Xgc7G7/nNuzLZTbB2kKvxK3YVCMmy2K0PDgCx4TM60dLGVktHNnAXn?=
 =?us-ascii?Q?PDRLV7WEk2dBQh/klf7SaOmNBV4cejgsGZea7Xn2ek5fFjkeOmgNkTV60TVF?=
 =?us-ascii?Q?F8PciT2dffXV/0pPsN2hv2E9XNPe+dpJWhISMMadb2lLlL+ob/LHRMPim1By?=
 =?us-ascii?Q?01s1qw2dplaOZ7UnP/3fPlFgaS4QK7JbHZJ08TCwAwObnsKDemroBdVU/LP0?=
 =?us-ascii?Q?lXZUqEwTVsWrKK+qnTO2Fc2286aV7msZGpmvx0Fykxg4XVHz0jvPuSkorPX2?=
 =?us-ascii?Q?9FRV1FOPo8rW7jmCBQFGLoV5XaPXiqlOxyIN1fUuvGHdAhSTXCnLf6Ar0Vy6?=
 =?us-ascii?Q?OgyTLfLNc3s2xM7BrWJu9/8nx3ce2xtP2F6GsDLZ2R247p14Ty0UUMqMha3f?=
 =?us-ascii?Q?gGi2oPscfW7jCEKg2IstXP9kMNkLCKOEY+4oEYza6jmmGe6VVvc/1Zm01wJ4?=
 =?us-ascii?Q?dksImG1shMf/QFWLSaIb3nTvt10CW1qKUV3R0m5GgBxaVhcBrjNvFt0B100Z?=
 =?us-ascii?Q?0127gvYrGGfL6LSY/H73LT5SLA/VuoRlk/bwvQ/39z4ipRPHXcTMyCMGBS/z?=
 =?us-ascii?Q?Q0AsSoNq9z3HqfKHjuhT4QJu5sbGE5KxmgrdIjj3dioV9UtjJYLbok9eAuT6?=
 =?us-ascii?Q?dgwfaaROWrkmmivQbiGmg2chLR1ZxfIdHcW/tsS7i3LyOVLPTlkWQqTQVp41?=
 =?us-ascii?Q?P1p5DuCyFti7LW0Oo6X9Nt/dygwFZBMo2TYZTqniBcwJ2bUayOxa6s2dDW7O?=
 =?us-ascii?Q?RkOT1hekLr2i+GvEnz/qNEXpCKzMf8IbFmJGMZZMFIIS36lE9hT3PyKoiU5b?=
 =?us-ascii?Q?oCFhrlzzrbZwZEY3PgIsXXhkYmdjV91nBHjq4EE6dTd1FncK4jsQM+mbpEZz?=
 =?us-ascii?Q?r2avGaOpS1OXFkrt1FfPbyNxhQ6kMQt5ihvzfvWEGpkrKvGNpHUw2EoC6Ptq?=
 =?us-ascii?Q?tbhSRJAfuWc7uzFivD3qksY/QugyW34wKbKDxAxY0ys1IuIbe/MymfM46IWy?=
 =?us-ascii?Q?7PB1dkXC4ojb8191cSUcJcieEEPNxs0firDL9x6McRdUL+FgOaTdeY1cGH4+?=
 =?us-ascii?Q?2KYvVe9I6f+lpRHE4CgriKJQhtvHqvyKIwUKM/dEwNrkmQo2PATSh79I5Vq/?=
 =?us-ascii?Q?0mH5bYm5FWn2LSbr5MucmgZP8tyNh2gpju1zq0kl3erS960SLqvSK0GflY4N?=
 =?us-ascii?Q?p5FH8tdQR6gaAa1mjS5/YZTEhCmSl5dmYGMYh/e6cnNWiMdZn/lZs4FyTQVQ?=
 =?us-ascii?Q?gzqPxoylIwh+/aWXpUurAV31nd0F7wedlqJcQxLIlcNY+GoSJl9ZfMxAbwry?=
 =?us-ascii?Q?COsqydxCKZ8tyn9YDjdNYzqHgDs2551Otz00BwK7ukNVMPx0zEOq0/aiDqhA?=
 =?us-ascii?Q?NAFhEGNiBEX8LldBetokbXzo9rdVRVyAG7leTMgn40DelOZxfTXGIFTNmjgM?=
 =?us-ascii?Q?afIh7mohbYOsQtwMMdVn8kkCdpOfCnmPzsJgZn6R4Tt9OlcBo24KPZVCO8E3?=
 =?us-ascii?Q?Jlcrx9x14JGd/E2rkeIMf6eSLpARHx6GFi+zWjLG3YCEiMHb/EMWxE/sbMY7?=
 =?us-ascii?Q?9ySm8bWnxLv+rWye94tMIJumKUkU2Gf5WlTABbd7PgZ5A0P9zId6bTC/rWZT?=
 =?us-ascii?Q?HLf3YBLj9DUuWx1NHg/9u0AauUQNCA7d0BibpNP95nNphrVLlZTsM1/g+zoz?=
 =?us-ascii?Q?CQB26Ahv5w=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f19191a2-2404-4e2b-d953-08da322fde84
X-MS-Exchange-CrossTenant-AuthSource: SG2PR06MB3367.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2022 02:50:40.8665 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V8MtbE7QTy00xeMXyWQMtVKzg24SEqB07hc8fj0cAQwcIEJrvrjWdJ2kqspcWPFg++c2U2G91i83rnWdpJ9BEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB5382
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

Fix following coccicheck warning:
./drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c:724:4-36: duplicated argument to & or |

Remove duplicated UVD_SUVD_CGC_GATE__SRE_H264_MASK.

Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
---
 drivers/Gap/drm/amd/amdgpu/vcn_v4_0.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
index c37dbac9d96b..9119e966ffff 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
@@ -722,7 +722,6 @@ static void vcn_v4_0_disable_clock_gating(struct amdgpu_device *adev, int inst)
 		| UVD_SUVD_CGC_GATE__SCM_MASK
 		| UVD_SUVD_CGC_GATE__SDB_MASK
 		| UVD_SUVD_CGC_GATE__SRE_H264_MASK
-		| UVD_SUVD_CGC_GATE__SRE_H264_MASK
 		| UVD_SUVD_CGC_GATE__SRE_HEVC_MASK
 		| UVD_SUVD_CGC_GATE__SIT_H264_MASK
 		| UVD_SUVD_CGC_GATE__SIT_HEVC_MASK
-- 
2.36.0


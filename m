Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E523702EA
	for <lists+dri-devel@lfdr.de>; Fri, 30 Apr 2021 23:22:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 972736F5DF;
	Fri, 30 Apr 2021 21:22:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2089.outbound.protection.outlook.com [40.107.94.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 250DA6F5DA;
 Fri, 30 Apr 2021 21:22:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jMXKlqcsP5l4jDnWHFkJCqcBrbnff0VTEA1HOBmxf1BSwG/2vNxs86ck6uFZtrmZ4r8OFD5QOtDgUanyJjPsUNNr4OfX8NPMn7K71WKMAqGgkg6vXKGauhKtfXqs3qXa4avklh6XOeLx7ibjf6hSOrbtwyKU3Yaosek0/F6ElnI7hLfSlmly/k3RLTBHOjPXhabhAuwrZtWrAUVTAymt/72JgTGAP/WOSyhIzIizsVbzsU/GrscPQnX9HFpWV4Khg7yxZIa8DWsy4wMVY4XpT7bkf/opvu0Bb6kqiFJVNn0d0w0/Q5lMftsCdv+acOpwhhJXO68dZ7g+6vSDwiSKow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Znp+x1XwznkGNja8h2S8hP3pSRywVBDGu514/waqk9U=;
 b=Dw1zlCsNZ0djbMgP/6jsvn5QXP4yBNdE8nE2bzKJTgjNjBh40bb7lqcVXD71YDpHm7S624c+3lJAw/r14qQbB6GBQFELzK/RMsfLAYw9R8ZphciyKi+9a/3tln1NiKdwx/7nFEsdYxCYz5OI0CV7kWmdErGoMXkz1q4O2xIl4u6XdwJ5/uHekIVyWIN7V3UDMrhJcYOY+pma5Sqk54iKfZkmECB7QtA71L0KoGRbdGOFzyMxoU7p6O0/0egt/JuzTT0dZsZSNAs4K3GMT/FYXsHdWaBmsGlPKDbqHrft2zT3ATHafe+i1Xo2en7YyeEpbXq16xB+oFb3Zt87+Xc6mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Znp+x1XwznkGNja8h2S8hP3pSRywVBDGu514/waqk9U=;
 b=s/34HGCoO5YXAp2h4LCj4DyKomb/nJN2hXKyZru8fK4G7gETpWL9wz7tFevt3kOuNXtH1/dsbK+Kd+5bboPOQRTi3cc+lzpH8U8GnygaZ1oikz/vQC8ODbC2hKwVQPZ4NhPRLMJ0LdnYKBigMFIeqZcda3+syvgEIbrG1T+Hby8=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB4679.namprd12.prod.outlook.com (2603:10b6:4:a2::37) by
 DM5PR1201MB0122.namprd12.prod.outlook.com (2603:10b6:4:57::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.23; Fri, 30 Apr 2021 21:22:40 +0000
Received: from DM5PR12MB4679.namprd12.prod.outlook.com
 ([fe80::595e:20a2:f658:a7a5]) by DM5PR12MB4679.namprd12.prod.outlook.com
 ([fe80::595e:20a2:f658:a7a5%5]) with mapi id 15.20.4065.034; Fri, 30 Apr 2021
 21:22:40 +0000
From: Nikola Cornij <nikola.cornij@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH v1 1/1] drm/dp_mst: Use the correct max source link rate for
 i915
Date: Fri, 30 Apr 2021 17:22:24 -0400
Message-Id: <20210430212224.21588-2-nikola.cornij@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430212224.21588-1-nikola.cornij@amd.com>
References: <20210430212224.21588-1-nikola.cornij@amd.com>
X-Originating-IP: [165.204.55.250]
X-ClientProxiedBy: YT1PR01CA0151.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::30) To DM5PR12MB4679.namprd12.prod.outlook.com
 (2603:10b6:4:a2::37)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ubuntu.localdomain (165.204.55.250) by
 YT1PR01CA0151.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.25 via Frontend Transport; Fri, 30 Apr 2021 21:22:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4eed57d4-06aa-48e4-b792-08d90c1e15dd
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0122:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR1201MB012279B3FBA72388B7A6E261EE5E9@DM5PR1201MB0122.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rEr3s+Q1vAl9JnCCAjtbmBoHN0OrfIOkTz6LtnJSwA4AKKRosh07VVRkydWFeI3qINjnXTf5NThMqjLeTSaYGxvV1D6OeYLHxlqVNYsxC7LZ41ujXLGrmn2n7lAfJyHAqrevzjeyPcro50J+RLGjBnrfIjVTCcVa6siF4hoJaMzr5I1Fp6tp9tCkD5NmQ/X8A5nRW5VqcXkzwdjRafOh/XXb5wfCNiD4CqCfDZZqkDNganSW4vGyLlWremHEqFY5Bzye/du2ui9SrSmdjKzc1Gds4mkrSJ69jbZmOU43FUAdt0dXkSC0FerqRZQJ5R/zgZ7/1p7c4FpnLHloKovbkX2UOM3Plh8eOffDdIphT/LwzzNH/ktkmpSCYi5CFOYu2mHfGX3nOP1COxvnEWC18Aoo1jfOBObAe29C78RccL/3GRV00Qq9m9rr9zFJLBNaEgpI4LJLWQ0rKNriMFaEnBIhVWpafo3qb86Tr9fJNp7DghgZciPviERAmm2JA7huTO8BrigfNoSeHahscnPZFupZNz7BfvM9EmcCJ7TOtn6oUYwhWBAC5kyniJpbXWXxllhPZoaYkucnKpV5xeDJo9EL1KN5vTM5wcUYszKGZibtJEWSiJmo8psEDDrLJXib4v1ZtN7JX8KtaQLzgc97/9Ym+4QQhHiwua6XtHt5K44=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB4679.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(396003)(39860400002)(136003)(956004)(6486002)(44832011)(52116002)(38100700002)(6506007)(2906002)(36756003)(316002)(86362001)(5660300002)(66946007)(8936002)(4326008)(83380400001)(66476007)(66556008)(1076003)(6916009)(16526019)(8676002)(26005)(2616005)(6666004)(186003)(478600001)(6512007)(38350700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?dyvDs6RZId5H42QC6OzmhcoRfZgUg08f9ohTm0No8cLgjRg5JBFeBGpt8p41?=
 =?us-ascii?Q?X/QpU3nzHRRa3//EuRcO6oVoNmmRh7TWhaP6ABhT28dlCqwYTC8YfJG5gEIk?=
 =?us-ascii?Q?xU5aERjRvcEsdq25IVo4rjNLcWxs7gU0ZPiLhK1q0dvHDLP3FdGBIZ4P9qgb?=
 =?us-ascii?Q?SfWRsyX7ei/Xh+fPqZCf6oPXbqpG2uP+e8WFnus0lp+04o+3dxnqDRevOlKO?=
 =?us-ascii?Q?+LM8VPygA5P0TKf+KVj16wXVGwQtjPyBySq0G4l/j2MNIeWlh5YkvJFLku8Q?=
 =?us-ascii?Q?MRSqU2sUbNBdpqVKy0hkbJGoSrFxBulUFNSYO5mENsPqGEMtpikfvrMzSIp9?=
 =?us-ascii?Q?0evbONuTmlv+seFXHSDRk8C1AOSkD6yMFenDR9wSFFgftQKZJUu3AVamitjo?=
 =?us-ascii?Q?0BIdVRCnk+CiWwATqddVz8qLZmSqYLP/4UmtjrPImo9mJ9FIcFfbmMtry2C/?=
 =?us-ascii?Q?DHz8x3X8GikYYa1lIX6yA/Pv5aZ2sLNrT6KNH77G7VwciAwWvIPDtdqkYaLb?=
 =?us-ascii?Q?vhkfjm88AUf1YIkvRpVtGK/SXXcSgoTQZD3GrbXWv1lsqq6TUFARt65VOvEl?=
 =?us-ascii?Q?fs3Vmj0LKgqR3eES8zR8PKKOP78C8MpqfMAyMDYqna3uMfV0S5/rT6gzEboR?=
 =?us-ascii?Q?EXyyaRSqf4r9o36kWfnhZ4J6SuybQK2J/9l35l+LtJjUQmWz3fZy79yBYwcJ?=
 =?us-ascii?Q?NwsB6pK7KtPuflJaSvqSwRLhLpanPeQR/saGW+dYlEXWMvkCnTrEH1DXEg2E?=
 =?us-ascii?Q?VuRydnm1NMH7UJzczA++MGWXRMpI89kkss+M9BN+D8Oea12mwEOjGjnZ1hGr?=
 =?us-ascii?Q?M6Z/M381PXbQ+SPcLTfE5Cfs22ApI1PH+FTO2Zk7VI1TLS0kM+Ej9Cxw+Vjy?=
 =?us-ascii?Q?O2KzJoXrk2E0nxPWQN/uX5ZT6R74244vvW1YmAyL7BDKaIHx4yETXoJqegbb?=
 =?us-ascii?Q?tdfE/0nOB+Nel09rAWZ5h7BpTePgWOBYliIbdaEqnCvzWttMtjroOrIGFrGf?=
 =?us-ascii?Q?3ys2ugfuYf4sfjR4f2WwmkU5PhLbYPFvk88mkq11WxmETIdKs57ZOucZhwFz?=
 =?us-ascii?Q?870Nzb5NcsrYO4ikce4SumjIW9wZFQxdlYuOs9XQ/PxysnyaDgFIbouQaEGp?=
 =?us-ascii?Q?prguzeDcEqwH1nwU7XP+3pA2Mr10LZql3bRUQdXD5+2krmA/WEWxt4ipqL/n?=
 =?us-ascii?Q?vkidyAk7kX/OjsdgBG1IHKkZZBEhdhC5HmVhPWzEOtfWdg9dFqLkx55FJvNS?=
 =?us-ascii?Q?ty7o1NEJ+k2U1t8bz6Eiof96YL284wWYCNZHXp4/aIWzdi/kUBLtCoJpQaCr?=
 =?us-ascii?Q?fPa3NnjMg9JCruV7IMVqEx8M?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4eed57d4-06aa-48e4-b792-08d90c1e15dd
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB4679.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2021 21:22:40.5949 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VFwDmY6iEkFNohp+/ygNeRizpw0WksufjqJ2tAgX4ulnQNhSqzm4vm5LFgHFMTjMw3SCrx8ZFKcDRIVdGX00PQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0122
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Nikola Cornij <nikola.cornij@amd.com>, koba.ko@canonical.com,
 aurabindo.pillai@amd.com, mikita.lipski@amd.com, bskeggs@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[why]
Previously used value was not safe to provide the correct value, i.e. it
could be 0 if not not configured, leading to no MST on this platform.

[how]
Do not use the value from BIOS, but from the structure populated at
encoder initialization time.

Fixes: 98025a62cb00 ("drm/dp_mst: Use Extended Base Receiver Capability DPCD space")
Signed-off-by: Nikola Cornij <nikola.cornij@amd.com>
---
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index bf7f8487945c..01a0ed99988f 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -942,7 +942,6 @@ intel_dp_mst_encoder_init(struct intel_digital_port *dig_port, int conn_base_id)
 	struct intel_dp *intel_dp = &dig_port->dp;
 	enum port port = dig_port->base.port;
 	int ret;
-	int bios_max_link_rate;
 
 	if (!HAS_DP_MST(i915) || intel_dp_is_edp(intel_dp))
 		return 0;
@@ -957,11 +956,11 @@ intel_dp_mst_encoder_init(struct intel_digital_port *dig_port, int conn_base_id)
 
 	/* create encoders */
 	intel_dp_create_fake_mst_encoders(dig_port);
-	bios_max_link_rate = intel_bios_dp_max_link_rate(&dig_port->base);
 	ret = drm_dp_mst_topology_mgr_init(&intel_dp->mst_mgr, &i915->drm,
 					   &intel_dp->aux, 16, 3,
 					   (u8)dig_port->max_lanes,
-					   (u8)(bios_max_link_rate / 27000), conn_base_id);
+					   (u8)(intel_dp->source_rates[intel_dp->num_source_rates - 1] / 27000),
+					   conn_base_id);
 	if (ret)
 		return ret;
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

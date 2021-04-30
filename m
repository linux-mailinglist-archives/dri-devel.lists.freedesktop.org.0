Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44696370326
	for <lists+dri-devel@lfdr.de>; Fri, 30 Apr 2021 23:46:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D52556F5F3;
	Fri, 30 Apr 2021 21:45:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2068.outbound.protection.outlook.com [40.107.93.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2862F6F5EC;
 Fri, 30 Apr 2021 21:45:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f5/fQpGQ1Ed2HjBEJ2sxleCpNSbgglLmpw6BhArJdl1Diajzr1o7+DkGtDPykCUKphJg4tUSgffbbGJ4kPqUVKdeRjU1BhzKwv9pEyGLboyWq8ZtpE/qwo7f7Gyv1IZWGpezJ83l6W7GMeI4hXdiI+8NAr6Id1BJZqNDxbrVkAx1dePbZ6s3V/7pIS+XF5SVqYi3an/hvXAbd5ZE30bjLAYWO52HGxuQKJnu47GM+JoXlxWgs1vP9g4n+/8CM56YIXkUU6uNIiZHesjaAwkrIdaxP11YiERzRKv9q3FZDikW5cGtw4/kbMfUi2YCReRLkk0ks3TmUSLHsJFOUyL9VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zQGkvYY4wvL4p6RRD+4huiyKQIbAXGSyayWb3XM7dl0=;
 b=G17KPa68SXkRVYJI1uGIy7v0c5+QABmeagEljpLL/l0zyUJOzkQ4QoFxSMAK1UVuOuwT+Oft2d+gj85ofXS18egN/UvRx1S6XkRdXjkc7Eq7n8P3mAsisqlmEeE7FA99xkJAdfNkgFaNi1PZL/ah1JU/sndOnXLCxfveMeDmpZ315Q+PInCjFFUo3CIjvmFaKebuP7L77D6vZiDRT4Y5o32pw9ApRJSwxzJPn47gLBQqspIu4ilCq/Blw25fw3jlLJiUkPDM1Fm6Xhla6JP3M4WXVG8jrfC2TTfkPySIYosWfbnPlqV/AkQvzGtSU6a8iczGJoIJiUH7NVJzEUpEaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zQGkvYY4wvL4p6RRD+4huiyKQIbAXGSyayWb3XM7dl0=;
 b=FYlL1JIJvLft8BNT1LS6t9G2oDUN4ISZ4q+6Y9IQKubI5eStQ5g6rmYRVbjm3Q+m/REQ+XrrjEW40FRJK/3LR8yA0QEy48EAWclOIyXj5BB/H6VlBjKCg99/udDmAznKrNRItuRrt62m2WH0EvaT72HMI/ZXZ9CLVcNurTQyLMM=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB4679.namprd12.prod.outlook.com (2603:10b6:4:a2::37) by
 DM6PR12MB4218.namprd12.prod.outlook.com (2603:10b6:5:21b::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.21; Fri, 30 Apr 2021 21:45:48 +0000
Received: from DM5PR12MB4679.namprd12.prod.outlook.com
 ([fe80::595e:20a2:f658:a7a5]) by DM5PR12MB4679.namprd12.prod.outlook.com
 ([fe80::595e:20a2:f658:a7a5%5]) with mapi id 15.20.4065.034; Fri, 30 Apr 2021
 21:45:48 +0000
From: Nikola Cornij <nikola.cornij@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH v2 1/1] drm/i915: Use the correct max source link rate for MST
Date: Fri, 30 Apr 2021 17:45:31 -0400
Message-Id: <20210430214531.24565-2-nikola.cornij@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430214531.24565-1-nikola.cornij@amd.com>
References: <20210430214531.24565-1-nikola.cornij@amd.com>
X-Originating-IP: [165.204.55.250]
X-ClientProxiedBy: YTXPR0101CA0066.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::43) To DM5PR12MB4679.namprd12.prod.outlook.com
 (2603:10b6:4:a2::37)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ubuntu.localdomain (165.204.55.250) by
 YTXPR0101CA0066.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::43) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.25 via Frontend
 Transport; Fri, 30 Apr 2021 21:45:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 31067448-f223-4d6f-0e72-08d90c21513a
X-MS-TrafficTypeDiagnostic: DM6PR12MB4218:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB4218C674EA207215CC81B9D4EE5E9@DM6PR12MB4218.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CUhhRhloWRXa4/+8p64lZgvAiud/4dvfrYiOgbvVsuEAtZLg79ynC7c7+On0TICtlrhE0lfraezjBXPDPKX9OtFTZWZGXDTC1I6rMzR7N5YJ8rP2eG6FU/veQ2j9vOskyTeyYgFrLJchpBITigEevq1y+vzTjZTAVsPaMFQ/jdF7gRn9rUjz4aOyVkdBMP/hC1CKI4DiO5+fvccnl2QYarKoukmLbvz2HyEalRR9PAgrORKpRs4jRa8PCXLg20E5QDrz9sN+zyapwgad1ZKlF7pTjP7yN3ynif59aTTNwmnaJJz4yuH1S8idun5u26z7Q3PxiWkTUavfJA1Ssg1+KlEkdgTJ2oFGTu+Zss6upOebCikTouqhZWNuoQnRTHMTOqg4vcNy5b6ri6Rf9pCOczDSWwORTr/rF7FiUUCYUHkczZW9kbjpOxyB7XLCu6XY9qohYY2vLqiY7kO8dCXvT33DHfyrvI9GB8ZAXCWy6s1rUFoz7SdNs62vlF4kPjOtOOnCp6IlnWEbWWXOekkQ1PeVfX6I1eXTVvS5oDGj07fLwqp4WGFwep1FzUkUcj1kLuJKaW7FbL/c9o0LH1C2KLC/LCVnpO5c77vbvKx+9HE1eOfeA0eHVIZd1BiVKUKwF+2Yy55iOQnnyU6C1Hha7SKJRnM/0RohpWU45mpl4uw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB4679.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(366004)(346002)(396003)(39860400002)(52116002)(6506007)(36756003)(8676002)(66476007)(66946007)(38350700002)(38100700002)(6916009)(5660300002)(316002)(44832011)(66556008)(6486002)(26005)(6512007)(1076003)(2616005)(4326008)(2906002)(478600001)(16526019)(8936002)(6666004)(83380400001)(956004)(86362001)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?0gfPJYN6PSXtY2/daTKTuHT9tA2XW5tzItAHNn6DfDrGf9xJ36A+mQcMJL1E?=
 =?us-ascii?Q?beZ22E+uqnwgNLyalXWa5LTaKS/pYZUG0J7xPiQoBiFXKKE21fHGnwg3Nghn?=
 =?us-ascii?Q?PKGPSCD8fVInmCiMw1Mdz11ZwbUnw3x/KSbyNEOwXIJ6GVsIQtcGlRHjKARm?=
 =?us-ascii?Q?nP0LfH187XvScXNQxGPrltxEdgDsJexVEW6+Ol01qRQR94dhkDdODNLoyHb6?=
 =?us-ascii?Q?eja88ZcoQzmoXCRAogxiUN/VA3QN+nmOofD9ViaLQpezfbXt3RZ7PFGVzOeE?=
 =?us-ascii?Q?CTokM/z7wxO+jKB5DwValjIFZ8nAyAJbWdWmbasf4Yz5S12syalXdeK+Pzkp?=
 =?us-ascii?Q?NJT6rb7tKKBhROH0UplmIrTZ+huPBbt+ZY+uMt9WeYgEQ2A2nc44n0rISB15?=
 =?us-ascii?Q?KLmGU7o/gUMpVcsG7L5OUXeKZt0oxzQ5WKq2HJiEy0xE6v81ZBw7IeYEK9V8?=
 =?us-ascii?Q?kEJ/DbTsEajd2usiMGMYrMOmw3fgV7/kBV86kV6g8qoN+VqfyLYNe/7/2uSy?=
 =?us-ascii?Q?HhE+px+qf1hlJub4bdYEAaDe4z1mymWE3WMJiTk4573QeUFRydZtQRjyxvAl?=
 =?us-ascii?Q?SGyyNlQmfX2unPER/58Lx5vbS+eTeShXAEA0N4Gc1bF9ww9Xv6nk50ZugVU0?=
 =?us-ascii?Q?S6V1AopwXxi969HpEiXlDAbCBZQywKVqvhXmNjc6DdpjI7WJs27Vkgf4v3il?=
 =?us-ascii?Q?CLQxLnN0+DMI/0BhbneQZzZRmd/0I7sicEbiRWd/6TI/zqdAS2gqk2uwUKXA?=
 =?us-ascii?Q?DOFX70zLAexJvV9hqoR13ogSSAJ1FThikgrWivvBFmI748P9MIfo6eBybXJl?=
 =?us-ascii?Q?yOPX0ksPe9QLr9S6XbtYd0ds96ecYMJRBCJNZbjhACxRpf0oWP4HpsZs17lM?=
 =?us-ascii?Q?Sab8GfKzRnpOdyPbjMCRahxf6v3FW1GHm7K2kdYTKXIUIL23MBnqBXS6Yh+d?=
 =?us-ascii?Q?eK0Z2/MUmUHepQWlYh6527p11IJGLVuhtY8iFyKAs0NVWiOwZygmlgocwDdC?=
 =?us-ascii?Q?V7X5xHi35lo19Dg4L5VLLTFqGgkfYs6W5uJdRMOnwXyU5Xc4Zoc+0WgtidN+?=
 =?us-ascii?Q?508zY39LmwCIuQUfNsacIUmhX1lzpDL4ps/4UeJT2ufuhg2+u06gkFtYFshJ?=
 =?us-ascii?Q?aEqiYr7YH98GiFl5XPriTvwFzM1XvrtYuSnTU898TKhGifLAQdbRqXRZwUGV?=
 =?us-ascii?Q?UFe7i7Sn3i8DXr2bkw8vsTRVJAgHM22lSnhKl4ETmixUsJHuGLcdKfWy9cyX?=
 =?us-ascii?Q?+JKlqYIBvjcgjmjPdH8tyj5RA7uU/51J9xRcQgMaLSWkWL+Pi09ubpyqMpk6?=
 =?us-ascii?Q?VSRvPZLh+Jq/bYClbtMSXyhf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31067448-f223-4d6f-0e72-08d90c21513a
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB4679.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2021 21:45:48.7178 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tCEt5HdunHq6XE2ByRpo2hUq7/siNVo3jxIM4+ZrvytVcjeoJ+qWpIyLkz7mj84Wf5ckIQ1P0CCYWEydZE+14A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4218
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
Reviewed-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index bf7f8487945c..3642d7578658 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -942,7 +942,7 @@ intel_dp_mst_encoder_init(struct intel_digital_port *dig_port, int conn_base_id)
 	struct intel_dp *intel_dp = &dig_port->dp;
 	enum port port = dig_port->base.port;
 	int ret;
-	int bios_max_link_rate;
+	int max_source_rate = intel_dp->source_rates[intel_dp->num_source_rates - 1];
 
 	if (!HAS_DP_MST(i915) || intel_dp_is_edp(intel_dp))
 		return 0;
@@ -957,11 +957,11 @@ intel_dp_mst_encoder_init(struct intel_digital_port *dig_port, int conn_base_id)
 
 	/* create encoders */
 	intel_dp_create_fake_mst_encoders(dig_port);
-	bios_max_link_rate = intel_bios_dp_max_link_rate(&dig_port->base);
 	ret = drm_dp_mst_topology_mgr_init(&intel_dp->mst_mgr, &i915->drm,
 					   &intel_dp->aux, 16, 3,
 					   (u8)dig_port->max_lanes,
-					   (u8)(bios_max_link_rate / 27000), conn_base_id);
+					   (u8)(max_source_rate / 27000),
+					   conn_base_id);
 	if (ret)
 		return ret;
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

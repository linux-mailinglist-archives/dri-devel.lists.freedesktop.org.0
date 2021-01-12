Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD042F3351
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 15:56:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F53A6E2C7;
	Tue, 12 Jan 2021 14:56:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2045.outbound.protection.outlook.com [40.107.244.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EFD56E29D;
 Tue, 12 Jan 2021 14:55:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R4EvzTrfm+U5wV+0FXM9dzvOYgFBHax+XvhjlP4HYkxlYy9/DrP6m4ho+mCKWWPu3W+wGwnlN8K/WaAbfPR7vT9akuT2dgAfo5FpYJOMvp1dyft68nZZ00xpF4uOdRGhPpwq0ojRjrF7b96otRsHaxMTsOVJAkcXO+nJ66DL3grpeUcYUyBOyOVUFsqSZSDlor8M1PVBgCdqggkAbyupa6EvuIRd1Ojnz5vAvIP2RzujKSFBch1ufUIGhjw1V1uM19HWWOkKV/ebGFrKo0XF82zjLQ3NILGDwDTv8YO8bIdhZmm00U0crHfKAD4IAgsoDcoo6CodG4IXF3cYs1OFXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N7Xl0Tw/H21ojFBvnOx7TqiJF/N1NxVha6E18Pm2PPo=;
 b=aOvwLzCo4FfGNLWI2Uu6DhCoFkoxCUgA2TX/2B4cmFwpjPFmXXgHZOzK8tFMv/rVphCxZ8y2k6Q0JBVetWqOQk33WV+cbbBKouipdp/SSn4FFryxal9hvuG0fchh7QFPGj6k+rDg0IfFkmvAii/kbj7WlXMH+SuehaRl6ekY58NKYQGgH0QCH1k4huER7QylJE6wscDZXcI9s2fOVhxkzuQq3guTsKHaxcBVuyfPVlhHj7QIzvhfuKeEqc5f1ZdrqKtKuypKv4rl2+/HdigFQW4DMjPohYcHalRfkXBetXRBx9ng9ytCl1VhLyWe3HMJ5A4olwLAiCWJozMejS3ywA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N7Xl0Tw/H21ojFBvnOx7TqiJF/N1NxVha6E18Pm2PPo=;
 b=ihBbNQkQvptKY313ki8nlY159sIhLhO1CuMu1xn1jYUZ+PHvUFJtCTZAyPs9aRkAWm23q5M55Epv74UgbHcvRiV7WDs5HYHNvOnEBqxHY1cO9K9JeEIYGtsT3wPFnETtL5Z4BfsjQOG2ISl4S7Zj/hxqcatATfUqd+2GwMFzpWs=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1753.namprd12.prod.outlook.com (2603:10b6:3:10d::16)
 by DM5PR1201MB2490.namprd12.prod.outlook.com (2603:10b6:3:e3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Tue, 12 Jan
 2021 14:55:56 +0000
Received: from DM5PR12MB1753.namprd12.prod.outlook.com
 ([fe80::1cf5:9c9e:7374:4540]) by DM5PR12MB1753.namprd12.prod.outlook.com
 ([fe80::1cf5:9c9e:7374:4540%12]) with mapi id 15.20.3742.012; Tue, 12 Jan
 2021 14:55:56 +0000
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 4/4] drm/amd/display: Fix to be able to stop crc calculation
Date: Tue, 12 Jan 2021 09:55:08 -0500
Message-Id: <20210112145508.1564863-5-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210112145508.1564863-1-Rodrigo.Siqueira@amd.com>
References: <20210112145508.1564863-1-Rodrigo.Siqueira@amd.com>
X-Originating-IP: [2607:fea8:56e0:6d60:24ef:ec9:b88:9a22]
X-ClientProxiedBy: BN8PR16CA0011.namprd16.prod.outlook.com
 (2603:10b6:408:4c::24) To DM5PR12MB1753.namprd12.prod.outlook.com
 (2603:10b6:3:10d::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from atma2.hitronhub.home (2607:fea8:56e0:6d60:24ef:ec9:b88:9a22) by
 BN8PR16CA0011.namprd16.prod.outlook.com (2603:10b6:408:4c::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.9 via Frontend Transport; Tue, 12 Jan 2021 14:55:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a82ad742-d5e2-45e5-a7ae-08d8b70a2a81
X-MS-TrafficTypeDiagnostic: DM5PR1201MB2490:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR1201MB249016B511748FCB14CE11B398AA0@DM5PR1201MB2490.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oK0Fsh/JxVAXkehV59dV0AHjLv0t44fkzcnPQYOY4qnyzisY+WRMhP0H9z13+soqYGLCRoRXIdMkM4Npjp7TBeuNb0yC2kZcTa+0DhBX3zCGloDMG5Q0/X3ddS4MOvkoOIQItMAecAE3lq2NBRl/jpBzVoGRPauWQPx/UqeG3zeT+Roj1vYF6AaNa53vO5k7nzlQ99fwuCXG84GEz2EaZJgbWAestVCAPmFLV0/8N/tECkA8Q1WpvCG6vyus722ZA0FnTH/ntechoOotKQoBsiYxxdZp1PNwwUR5J7/Lbm/BSB6DvTEaW8GJhRL38isT0CA1bl4qF0gz67sEthL5yXCjRaVyzwHg0bR+mA8F+PhDiGVKqP9s6CC25RtoFVkv/OlaiLNZHgO9VMrPnol77w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1753.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(346002)(39860400002)(136003)(376002)(54906003)(186003)(6666004)(6506007)(6512007)(8936002)(86362001)(52116002)(66946007)(83380400001)(16526019)(8676002)(5660300002)(6486002)(2906002)(316002)(4326008)(1076003)(478600001)(66476007)(66556008)(36756003)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?YALokEVMJTnepLXXvpq838il6LMYbNxcK7/CAv6MqSsH/TdSnLPcMfuTU1lf?=
 =?us-ascii?Q?IyjgSqf7q36vC9vKeMIQbpn9nx5iFy/XLH5Jo6MmEm+asMBsSh2xu0DvLjGy?=
 =?us-ascii?Q?eZRFcbNnFouYC4OvjVWJIEnYqGKTTCKzRHIEig4CXdo0YGi1Dr283jy9UWbb?=
 =?us-ascii?Q?EwwuO+J2Go2+tjzzRrf+LdV8kB208dBrkOB5AADUnqSakXhf2H47YXORs88x?=
 =?us-ascii?Q?32tMo93YA5yMkeBRy0B+kPaU0Fn2COK/pFgNBzuwthAWFULpBKrPpOH9zFzq?=
 =?us-ascii?Q?8Bc1I2v33i+kZZJP7glTfJel+VEUXFVM+EMFt+jidH7rRVe5CdAT5Ff2t/6A?=
 =?us-ascii?Q?jTdhR2UFFuS2NrCEn3RCVFQqdcxMmvG9Nt3l0PBmKbDnPL2S0e4uwPtjgb/m?=
 =?us-ascii?Q?TvJIvyenITt78v009cxd56MKIpSDhlF60XE3x0Ehh0RZYHHeIRffE5/rjSR9?=
 =?us-ascii?Q?A5zWj1K54YSKuIMHHcaPNidPe7p7JSuTTupsgmSGNRvzqCricGGCbkrPtutI?=
 =?us-ascii?Q?nJCV7WEyE2FlcpSUac6O3D3OI5vT4H9iF/bvp1ZFvfgFOiuh+X6CiVmI2dkO?=
 =?us-ascii?Q?m908jKLx1h+c87ahPOh+tLYTzvzst/X16ccEBKNsKt1yKto6cE13fG1cU/Tr?=
 =?us-ascii?Q?SzvK7xdjOtG38FL22tCPHrhYEi9Qm5cHnwBHncGv7iJNiqWiGWLIrhmfjWyK?=
 =?us-ascii?Q?ET0W5e8Nc9BAQn6CyUjckZLm8AxUWaS6gdp3MkVFlGP02PsKmfh6ktG7lMw0?=
 =?us-ascii?Q?Ie34Sun+SHeP6gtCyCUrHEVOUXkV7MyXj+TvBkuDTJHRVBE+gMpb0E9Kl3ek?=
 =?us-ascii?Q?BQ7XWeLvBHCbSxKDpJRioP5wPkrV3e+3P1KRwwjqKe+M5gu69zFqv35wA1Ff?=
 =?us-ascii?Q?C4S5ES37D8IcyVc0kT4yXVN+Ebd+PMgxxqgZZu0HhB46vEYx2sdvuvNamrqB?=
 =?us-ascii?Q?mbRDfpg5O4ZOnop31ceeANxKr20sRdZ2XvkFevzc+xI+vd16qNARkgCWuxiE?=
 =?us-ascii?Q?KFdYJ49VH24EuYQP90LS6xBkgU1atwdfBO9003Ko3OmxaqgND3ESxkFWogG4?=
 =?us-ascii?Q?RVaRksUM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1753.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2021 14:55:56.2012 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: a82ad742-d5e2-45e5-a7ae-08d8b70a2a81
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4s0Sd2sJPL0+7TQ7kckRR6Tgohi2MsL5M+6jd1KNOSAUwx0RnDTPMjpzi+8KOJTZexFqK59PPCG238tmai1xrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB2490
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
Cc: Roman Li <Roman.Li@amd.com>, Wayne Lin <Wayne.Lin@amd.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>, Bindu R <Bindu.R@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Wayne Lin <Wayne.Lin@amd.com>

[Why]
Find out when we try to disable CRC calculation, crc generation is still
enabled. Main reason is that dc_stream_configure_crc() will never get
called when the source is AMDGPU_DM_PIPE_CRC_SOURCE_NONE.

[How]
Add checking condition that when source is
AMDGPU_DM_PIPE_CRC_SOURCE_NONE, we should also call
dc_stream_configure_crc() to disable crc calculation.

Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c
index c29dc11619f7..66cb8730586b 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c
@@ -113,7 +113,7 @@ int amdgpu_dm_crtc_configure_crc_source(struct drm_crtc *crtc,
 	mutex_lock(&adev->dm.dc_lock);
 
 	/* Enable CRTC CRC generation if necessary. */
-	if (dm_is_crc_source_crtc(source)) {
+	if (dm_is_crc_source_crtc(source) || source == AMDGPU_DM_PIPE_CRC_SOURCE_NONE) {
 		if (!dc_stream_configure_crc(stream_state->ctx->dc,
 					     stream_state, NULL, enable, enable)) {
 			ret = -EINVAL;
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

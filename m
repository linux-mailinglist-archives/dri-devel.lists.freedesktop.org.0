Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E959636D1A4
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 07:34:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8906C6EA9C;
	Wed, 28 Apr 2021 05:34:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2077.outbound.protection.outlook.com [40.107.244.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A8106EA9C;
 Wed, 28 Apr 2021 05:34:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RR+F2xZVZjy7/qJS616QS+agIPROBfa/3gSI/5EbjRPtwaRaPJQ+leY5lSJvEfFbyNg4d1KS3cZDNMMkpNmTgtN23sRT8bCJgBrc/1Oyve5wCAih2+E7GXCN+kQ8I4ajkVCv1qNw2l0DBD+EqTZE+0WtkXTbBV/crCoudtN+EQN8/cLx9yZQfREr+vqigcVWqNCiZIwlKJIdv5B1YGeimsqQ5ehYQuZI7pYtM5pOIIkhirvrkT3uNCqcgC1pYo0CkjpiOiNWZDdv2Xye7IgP664mEvtuSnOLA8AU5X6vqHGx7jJFjafdvB4KsbA1nISX2RZ88h6er9zpoTVt20icQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UAc6+8fNR1J9OMnFgPjI2aeW3K0qXH1tUl24SAG5vQ8=;
 b=g0IAbaVicYy6P3Dy/F34ahuB/34NHWntYIBpBJRrdwd4e6Reg1DRXONX0m48KJ1xr85KovkuP62I/kZiN6eELsZLX2wO3J7gGet6kOEvnxkMsPBVwDCM7VL35xWmUZTvUkRvYbUfaqqHxd3jBEaS1zaLAdmCr2qjs2mKVsNOFZwzsCsbxHHTpOSdu3cF4VubOMtLzWOcbdTtemRTdspVkKnu4MElBT1OEFFfdLrMKoCxFyBcV1Ys6si5Y9WCEvcLbu7dMtWx8k5SbHrKOxFwbn/qqD1sZUzAbs0C727yUcEL/ivo1IjPMNZnGHpx00uZMHmn11l/wLFHFfoZB03xBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UAc6+8fNR1J9OMnFgPjI2aeW3K0qXH1tUl24SAG5vQ8=;
 b=SO3Qi3A+ql6FxJ8CioAueB0p2KpFmSWpha/QyC5HMC2NxkPLIjxU5mi4LBBpbtVW6l74ZKJfaCzws5BwvwIp9dJUqXQEaTnmQpb7609FeQFR2hUVQjGXP4bRvRj/0BIIgWspmSB097XTW730Gliaah653AW10PYYntp4sA2PQco=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by BL0PR12MB4916.namprd12.prod.outlook.com (2603:10b6:208:1ce::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.23; Wed, 28 Apr
 2021 05:34:03 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.040; Wed, 28 Apr 2021
 05:34:03 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm/ttm: Fix swapout in ttm_tt_populate
Date: Wed, 28 Apr 2021 01:33:38 -0400
Message-Id: <20210428053338.11560-2-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210428053338.11560-1-Felix.Kuehling@amd.com>
References: <20210428053338.11560-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YTXPR0101CA0040.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::17) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YTXPR0101CA0040.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.24 via Frontend
 Transport; Wed, 28 Apr 2021 05:34:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 65895508-7b2c-48cb-e9b0-08d90a073b45
X-MS-TrafficTypeDiagnostic: BL0PR12MB4916:
X-Microsoft-Antispam-PRVS: <BL0PR12MB4916E98C77C30289BA6D360592409@BL0PR12MB4916.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:962;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2e4pFtgqOEOM0HvtJxXlzrLXepXYuFDAvGbCSAf1DxDlRE4VYy+V91+tgEunVRRHlbpx04gs5CMRgrzfQLh4LYI8gjpXXf5uU8LBzgMlB0GJ3pKt+aAAZ8K5baYwCaqdlhzdVjaDhxQhsrjyfdA2gy4Iscb3ieIwtfEshOem8fRVcTWeGUXF4w4hxt0XyH4PvEE6lTSs+GjQlgF9+OQwEo5VOg4whISHEEGB06dA9DhnvAVO20NBTqfdpEKjmYBv0zefz9zoV3Teu4Mnp2oY+XMmMpPdebmBH+xc3O5dquk288XBeMMYEAWpwym3xqtV4owqJ+zAMghdicCWjplkmp7lm96abwlsPrCAktLHjI9FR3OvjGvnEecvG5kfR8pOj3sQyL/3Cd3MT8yVb1jkJAkVLMIKoKCAmhGlt+FKA1jVy6mVHcYfeCsV8Ht71hFEde/nuCo4cFHRpkiLYlFUdwye/tIRQQIyPJ3+7S5SFQRHLxMvmWTkTPZE2YlwZ72j9OLlGkeSjfAc1K/RzV0EMITDixYFEGVdtEe7U/NDNYfVOAOcwkJXwMG0U9noOOjS482po78CYGBN5o55pAY93BNAN+Y/pQMtF0HVWeaJzWEzum3j69/TaoF5iiN15MdH3pT4ysGCt81yoT2sLWV9wyrToxSNZwZT0ZQeeRuCJVU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(366004)(346002)(376002)(39860400002)(83380400001)(66946007)(66476007)(66556008)(16526019)(316002)(36756003)(6666004)(8676002)(478600001)(2616005)(4744005)(86362001)(1076003)(5660300002)(8936002)(38100700002)(956004)(26005)(6486002)(38350700002)(7696005)(2906002)(186003)(52116002)(450100002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?zCe4tlYwj9AMcLtbZA/GsP1014K4XFaG6wi9F2OdDgA/WxO7z52NaO07WWMJ?=
 =?us-ascii?Q?6hn0CZshc3BhDtABfLPCwgXETD5mgGsp/zcWyXrQmkCum17c2wXWwao+5tt1?=
 =?us-ascii?Q?ApEy9t6Fn2l5vD90Um2XL72Kcaz6f7+a4LRiwx3X8PdspgV99ylwtB+oiE1X?=
 =?us-ascii?Q?F15snlCs9qPU7CSdXAm99w+3r2oOgAoBPqC0YnDlnAny1DGBwF34uNRk7vQ4?=
 =?us-ascii?Q?lOM4ElrGGYnEY27kyDEVY7gCX2Rlyz6ye3j3VV2zrb9mEdz0VXS7oIuAE5/8?=
 =?us-ascii?Q?Rf0Mnnmiuejj6Dfg4bPfyV1iKk7wjgnInRuiueV9iqpbeooy+ZkdLEgFCoUV?=
 =?us-ascii?Q?lxxu6cytVr9tLGfpQ4GxqIPhFZe5fRht5g2I22xJYL+6bH/f1qOnpeb0C2IJ?=
 =?us-ascii?Q?jaUtDSx0yAwtm0YS4h3lmKjVlGTcas7mRE7s++Zt5GGGeTsqzfT7X0f5y813?=
 =?us-ascii?Q?/KPKVsRIjLG6pbv0B7eJ+pcb5EIL83rFy6xAHrXSt92SlbVmtCsRczSpcPG1?=
 =?us-ascii?Q?3KYXTxyMbOkmZkL/lJtv97CPVR8PLrGMtFFFunD7oeFZDtV0jRfsIffhH72L?=
 =?us-ascii?Q?h5pMqNPBjkikTokkSrWvbZfiAilCLykj2Fq4S45X/NeeOzAKqF70oXB/BLgL?=
 =?us-ascii?Q?8d5GiRO+YTG1v8ZemhbxCouGUtCbQ62gWRNHqhcpd6a1opWUzQ+abz901cPX?=
 =?us-ascii?Q?Fq3OMFV8IdqGg1D9a0btGBLug6CvJIpKtH+//67UCFPMcfWAFN/A9hdj0uvd?=
 =?us-ascii?Q?koUgyPMQP/Wd1A/0qGGWG9QfQPyMCkmF0cOEjyYWKJl9wIM3A2Ez051Ib9pN?=
 =?us-ascii?Q?W8smubOSx/lvg55DOU56e80oOk/h8UTJomEnfuYWk3YLs3I1adsu62mFFWI+?=
 =?us-ascii?Q?Xoks+sYUW/nIyM1lYOgPONDffVW9L5xwUZPW5H1/evob598P2VYXTmHeVkoC?=
 =?us-ascii?Q?uB42kIMfyzlcjh3giBYhW7ncfrgWkT43d6qgAw2Q6vAzdy0TO0KwfUiQ5x0U?=
 =?us-ascii?Q?t7+M9YH5/1kzggAnjFAwOJ0+K1hi37u29mzXxBry8fe3CR2pWt5UkmHZ87uF?=
 =?us-ascii?Q?qPYVwNEoELr/GVUqv53jTDe+HvmdJoTI6zrKY7ax2vvVDIIxWvxRfxkSgmG0?=
 =?us-ascii?Q?8coDL4Deg0HFZnW+iofcFqK+/+TZf6rtR4IXhkhOSHlRaN91q/KeZDepc9Yh?=
 =?us-ascii?Q?KXBoiSqVP12+v06N3YIqBeJlQoav1LzthYLa6o+MvS89dEk1ixILJvI6UXke?=
 =?us-ascii?Q?jBJcNeEWXwSgYuCMMv0C/YT/sPo7sBtm16zbqVVlUqZ3qBT1JbQetZjty02U?=
 =?us-ascii?Q?YF8CpfIB79HcsCCzYyZUc9z3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65895508-7b2c-48cb-e9b0-08d90a073b45
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 05:34:02.8985 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nS8PeVo82Dr/OFDIwVLeHHhmwkqYwF2CZY6ETTmXlrgYJbRLorVV3PzUU17W2DhLzW2C3fF6ypW5dvAbb1TDXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4916
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ttm_bo_swapout returns a non-0 value on success. Don't treat that as an
error in ttm_tt_populate.

Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/ttm/ttm_tt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index 5d8820725b75..1858a7fb9169 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -326,7 +326,7 @@ int ttm_tt_populate(struct ttm_device *bdev,
 	       ttm_dma32_pages_limit) {
 
 		ret = ttm_bo_swapout(ctx, GFP_KERNEL);
-		if (ret)
+		if (ret < 0)
 			goto error;
 	}
 
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

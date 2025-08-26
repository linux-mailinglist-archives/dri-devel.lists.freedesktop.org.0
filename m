Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB78B358A7
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 11:21:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA22710E281;
	Tue, 26 Aug 2025 09:21:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="QTmj8FnN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYPPR03CU001.outbound.protection.outlook.com
 (mail-japaneastazon11012051.outbound.protection.outlook.com [52.101.126.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F4E110E281;
 Tue, 26 Aug 2025 09:21:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BO8HFj5ODanStRxJYZrnDoaa/D702bGbHzjP2URvVSpqPMxuyN2kCLiZ+Um5vNS3Ck/zoSb9MPhESWrrT1ev3xt9w7Z4W4IDV7w5fXfbtN8ea8L+xKGZEj8nGkXxauZKelkGeUSTEq+LaSiNS2no/W5lxFTLag5zhhSq91TmAfSd72E1Mb0ugkRwJQX7YoWPrtALhIfZ/Blzzco97CvyR9w9R5dx8T555AYbi82mFL1vMTo7BDbD0zhKikN78uLfNGyM7okGKLHF0kpH/dQye8hZDiTckx9KBcBNHuN+IYSgK01VANLAZ9nCs7cQkKgIUEVKF6SByr/wucMwxZs9WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+L6FYFevGF7eCTXQKy0xB9cveS3tCdm/HhKqKIZPDX0=;
 b=ywybc5HQuumH5yFN6rg+eFVJ7bcotb3HYke5xyqVbSk1nIAGJiG54/hrceZu6JCIz/zYkyJv/sGtyxKQipcPufJSMNqE6E6wqqG+2s5fCTuYVLK5oEqD1KmEdz8Q4i2XERxVsAIo6FWEZlzhUSRiaw1s50rZ6cXcxWghTQOwqwjeEBdHWlqIzaO9dKkMGD5Q1Vioyj2yZD0F6YR/1iOhzohAAQ53iK3l8snCvOiXIT615rE7zJkb3MAVYV0HPlPJoK5Hhftv5tVY0UUekutppXwubrsMIsG61bcCPDXZPdKT4CAJxqaL8rRF9ceO+Nh8ZkMaxaxdr8Cc7rRszCkXfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+L6FYFevGF7eCTXQKy0xB9cveS3tCdm/HhKqKIZPDX0=;
 b=QTmj8FnNMC+1mGLfAnMFUGl1PhHO4sF3SqVVd685QMVgfTO30b/3h1wjXqfs8R8Ll7aezZko/2HcBZKRn5gFnG6gQQj9wgQ8CtnHxuEvz6bXwaLQJ50kbEVDRqCEQocTOOlij2Dox9DdZvs2gv0oLZZWVWX8ZByoHyE82c726OV77xR7heJG2EhIjtdeuAuJrtvXic8cu/JNDUh43oeogf4E497E7e4jelF1ZxFMsnkG9SDMHWc2iP3jB1GEYlFVlZE4C76cKFOsrPKDwtF/Vdrx/nWnndd683LWAFWijVhpqUbPYentGwFoO+1Yzw9uu9IXxKNKj70G4oPLYDccKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 JH0PR06MB7150.apcprd06.prod.outlook.com (2603:1096:990:90::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.20; Tue, 26 Aug 2025 09:21:00 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%5]) with mapi id 15.20.9052.019; Tue, 26 Aug 2025
 09:21:00 +0000
From: Qianfeng Rong <rongqianfeng@vivo.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Antonino Maniscalco <antomani103@gmail.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Qianfeng Rong <rongqianfeng@vivo.com>
Subject: [PATCH] drm/msm/dpu: fix incorrect type for ret
Date: Tue, 26 Aug 2025 17:20:45 +0800
Message-Id: <20250826092047.224341-1-rongqianfeng@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0059.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::19) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|JH0PR06MB7150:EE_
X-MS-Office365-Filtering-Correlation-Id: 95536ee4-1daa-47ff-a9c6-08dde481df4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|52116014|376014|1800799024|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3lM9xdsSn2wjz4cKWb2MECsJEPxKJUoP77WnWSph1E+hJoQCCmcBEQJATj7z?=
 =?us-ascii?Q?/gg2lfJpF0ysc3cDZsNmZdfcx9z8MtzO7SVMq4VKUPccYa89eK4HyYO7yTCH?=
 =?us-ascii?Q?1SgusS2VbMAr59/ey+CpbNt2FkF8KGVayuJq43UVBKsuZcjnD503XEhI8SYc?=
 =?us-ascii?Q?DsAZynK+u1z4xz+zLFH4CmftSUMrdf0i1qpcn9KgGtEx6icb9D309NLv/YMf?=
 =?us-ascii?Q?fmNUjM0MskbTlVu8M7gVM9x97jC2yQaiVh21gHrqjGQw+8tEVtxCLm7z9DG6?=
 =?us-ascii?Q?9cfmheGUTV0DGD4SUV0JtSmCd0LkVTydSGg01Uhhzme8XOBPvhx4TNra97R3?=
 =?us-ascii?Q?jBJkWXYcfkR97+1ZRpDPhgCtMHfPYpjIn5EHpVf7zOkTBAHJD80YoPl3uLTi?=
 =?us-ascii?Q?azekuhviuK6/OCHf7PElSzKv/yUGnoKbq880CajRpjrHlcEJC5kuN1dqJ1Pg?=
 =?us-ascii?Q?qCc/Jr+3bna99QTwqhhfe7IoLB8XUbJXEz9tzpljJM0lf45UK4J/98/lGnOH?=
 =?us-ascii?Q?seYqqtjnwRRS73cGS1q44Vki835dLtBx9LOdg7qGgSAmMVjoAGMK8fzC5Q2b?=
 =?us-ascii?Q?GXHT8cB+SAHD7JY5kZizGCsHhhMYxO1PjzRYzg1YYLrcYKuGbzIuxS10z6hV?=
 =?us-ascii?Q?NQTmFzCuOwFYcmfj1GuiNzV4cgGgyBV6gSX4Uwni/l+bRuSt6NaHA2skNlGS?=
 =?us-ascii?Q?ZY3YNbPv4gdEt2ziobGcIn4Qa745j0QP1/ob4JXpZAwGMJvh3P2BEP7Pd6H3?=
 =?us-ascii?Q?UdKUvzHsNKYDgu2kieSvgmMu3OE2/SDuhN44qOyUj5fZZVCSJ4x135B1yR+S?=
 =?us-ascii?Q?jcjICXk3ntdAPpif5App3M8bVSuR/bQbTj0ZmRISWR07R8HUPLsqde3paffz?=
 =?us-ascii?Q?1NGOY1bw6JgqEGga9E15y6jFU9TCbnNgNYGcy4huhudNXL9cunLvPfVhIME0?=
 =?us-ascii?Q?yc7ZPzuZ0OMymWsKSVD8fR0gXk9hW9aiUcfGHnWLA1uc8ZGlem3uYR8OmEOA?=
 =?us-ascii?Q?f8qQ5L815Xb+cvPLKQV6iLfZ00BBz/rj4QjTerw6Naa+DwhjdlLEIKl/04w5?=
 =?us-ascii?Q?IyoTJAJ8QwGRFlk4S/u8gcg+ZEEqCKDfEAsPO76dtc/FQy5P4kle/6DV64EK?=
 =?us-ascii?Q?R/Q/UJkx67elA4eIUucXRks607Zbdxw2eBOWBpQwe+n7jCVL6vAbfKg+DGZF?=
 =?us-ascii?Q?b5zkdFAhyv5flFN9PLpOCKEmQss0tUxiPX5MwGV6giidL4U+cHC6GdVAk4PN?=
 =?us-ascii?Q?8jCqVbf4rr08Yd1aVS/TwoJ0ayJRObM40jnBzaVHa46dGWaJ7X68aNW2bpwc?=
 =?us-ascii?Q?c6BiDMKJVjVTmnnEYB2+OhLf3bcsJuY2kAuZ/5I1weHKJgQLiUlnTmVLoOeh?=
 =?us-ascii?Q?czJ8MiZVEMnJ/AQ823z2ySHVe/e9Ez0piZkEjFOkIV0+TI8uzFJXTey4R1dk?=
 =?us-ascii?Q?y2zOV575U4HKcpESkLyt49M+7tFkZ4VW9JQ1Ls52xAR4HDxmlKep7sR14B3K?=
 =?us-ascii?Q?JZTCBRqh385dnCE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR06MB5140.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZHkCbgbve6gJdX5IHKmtxqXBEe8x/yNeAhXFgU8GyB9l6024oczLNmBTQoOG?=
 =?us-ascii?Q?YTLu77URZrnQjaOizUCjdSZOXBFWSxciSdDFtFNaBRNGFhJSHEtQXnvOwVGg?=
 =?us-ascii?Q?62qZRSN3GrVs6BatAwv0qia6rUs7wtqVVccv1J7tPrf7D7iwCiM+yoSlrwS5?=
 =?us-ascii?Q?GqQkXMGogkZTQAKk3PPlEztXOIm6A8M2n7ugQ0RKIKlT8KvWwIyE90ew5cK3?=
 =?us-ascii?Q?3vKF9JKSFOOf/vni4y9MsVH43MOptBCaBIgeT2h5Tqgx5WeADQRi7C9wcwU7?=
 =?us-ascii?Q?axqIakWy4Oe69kupqDv0MKRYTPVrP9D1XSAhnxJrZrw0akm+H41Lxwlf6u6r?=
 =?us-ascii?Q?wTlzJbpRxZ0LTdtWH3owQyR9mJ3Fh2CnciRKfLm2zoMu1Iv6EP82J4AHoPkT?=
 =?us-ascii?Q?ZDS8J30I49Ew4u8z7/+MOTBo/85sDWJTMBDwkNxmKsAtalMgpEK1p5Mv+P0t?=
 =?us-ascii?Q?yKlOjKmntH0AnUnmA4UlEtBzHYUfDsBL+TApidjMaSCIXVOilprwuDaZTsFZ?=
 =?us-ascii?Q?ydDL0i6WKhFsNe07SlQLrARtx8cQO+XMteHxtYjah+u4Lk2VBY5TT+Bt2O9T?=
 =?us-ascii?Q?bb5S0mCDSE1Y46znO6ODZY6JUUb3PTQNtKOe1TczM+rUMqBhnR5l7yYg03Fa?=
 =?us-ascii?Q?T1USYeiPod+cju8trFesmlVMOJ0yNEG11aHS5YBgT32CkSsxNISs0owukQ48?=
 =?us-ascii?Q?KDu03l9PyfMlATN9n1ZrC9b/GWjOtLxg0Aggb2G5t276eOkgG4NymqfX4Sy0?=
 =?us-ascii?Q?nxbgsh4E4xODwSZnDuAti+oiklhEgYI91rrtGhU4FGkiSBN2wTPy67WufF2o?=
 =?us-ascii?Q?JMQTI7EUNCQVqcnOJtNaKxh3ujZk1AP7cgMqPCxpczQojaGb/wPXITYF61UX?=
 =?us-ascii?Q?iqIHptPG12TUExUeoLo/zhatc349QbS63PetppM0dO5dHP9QkLehzLOfhIVB?=
 =?us-ascii?Q?w9lKSyx8BQ3ElAIrKsis5dMRtpEqxJRDK09QPUiXMvFkG+z2VlrJ+wCkpDOn?=
 =?us-ascii?Q?/c9tYCbAjb5itH3f3za2SdE/bJNRH1YXX4kMZUFQSxtogrNDbGPKM7Reo9+6?=
 =?us-ascii?Q?ss2TEn+OaIeXiLDysK+GGeQqq205R8hHl5CyotcneuFRgTCFjLTgNLOpArjo?=
 =?us-ascii?Q?DFA8xN41rXCMxU3Z/T/j/tlAAxxbW4xyKMmqO18Jves9PvMGk1/gXhVsFd5U?=
 =?us-ascii?Q?JOao4reACeOMJtMxGPNqxUOaHOeKJ1lIxLm5VS9Wg3ApzD2A/WEDgub/lQ9t?=
 =?us-ascii?Q?xd+mK+CC3JHS86tLQLlD3plOuajnlH2l1bqjjqKp17r416AUc/efiu0xCBz6?=
 =?us-ascii?Q?s1Jt0budkO63N0LLEigujKKnPDtZy2ZHV075197VIEcKsBo5sgIsekPU61ER?=
 =?us-ascii?Q?cxwWeAims11x9XlkX8H6oNTlg1E30TRRlHkR4AWieMcxlGHVRm80AJ4j4eJn?=
 =?us-ascii?Q?Fmx+Cucxk4m7jxXPwNvREmVpFVIBXqnO85cA3op6HmWFGw7eEeO7JDglXijY?=
 =?us-ascii?Q?U3wOx/ZkG7DaSOnJG6Gu3nHP2OnNe/REXoGe6zY5XUUkeRns12gKXHcRogWE?=
 =?us-ascii?Q?xgAa25A9GoNRY1iM/s5gHwhMS3OXrx8UZgfkUb6v?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95536ee4-1daa-47ff-a9c6-08dde481df4a
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 09:21:00.7495 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lP7A3UOvFseP+OQ3LewUlQlPjy1WVEaBXWDsh3+CCnvw4Kcy40aDOfDudTSRaqibis4YOomomsruzG9FdGRoRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB7150
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

Change 'ret' from unsigned long to int, as storing negative error codes
in an unsigned long makes it never equal to -ETIMEDOUT, causing logical
errors.

Fixes: d7d0e73f7de3 ("drm/msm/dpu: introduce the dpu_encoder_phys_* for writeback")
Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index 56a5b596554d..46f348972a97 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -446,7 +446,7 @@ static void _dpu_encoder_phys_wb_handle_wbdone_timeout(
 static int dpu_encoder_phys_wb_wait_for_commit_done(
 		struct dpu_encoder_phys *phys_enc)
 {
-	unsigned long ret;
+	int ret;
 	struct dpu_encoder_wait_info wait_info;
 	struct dpu_encoder_phys_wb *wb_enc = to_dpu_encoder_phys_wb(phys_enc);
 
-- 
2.34.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF2E95AD86
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 08:31:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C56E10E749;
	Thu, 22 Aug 2024 06:31:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="YoPRiOYY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2088.outbound.protection.outlook.com [40.107.215.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C39D210E749;
 Thu, 22 Aug 2024 06:31:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vv/ttxtk2di8k0Ry+wHbOIvS5W+kPhdiD6aCPOWP+4C2KbiNyWzo7GpHOuZ7YEr0Pizzxvfi/l5RAHK1R12qd0XDRXOvu1ku7sfaWws9GyUadJCdvt3MhW1cbjBjPJV0jX6izcZgvZNtIPx/H9cetU0pbHt1dPbqR5vAxO40+k5gmO21m/uz+GeFb3U1G0PMSEr/nnFfAcCkd7LkQRT82SIr7SWgQBc/KqUEIOQBblWHqqlqRwRhJAHiT9PvavnLjptD2k2iyRFgD+19LdXKAIn4+FRfQdtfO5qban2HLkdVxG3VokU8Iq9WyjqcHer3YyBXEj139dx3Ui5IBsFdJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WPHFiCX2D8HefJU2ksWv8ccMuI1S9KxOQ2E/bdwcOTg=;
 b=u6D0vxGZ9HzkNFejbPwfM1VLXCItNLtXrek97h+eMoQadWEEgrYjpuJihHlYx1eIpq3OGN8NNSlskmdzHml2kfWNvyBD6GBCgZ/pe7wnNFSHqYfSgQAVPDd77WlRXgTs4nBSn/ahHiJ5RSLyr3wVKwbtSNHMpRkrzcxIA8TgGOS5lhWhH/Z7jaNR8PwZapN7WRhIfbTJ2eLh2QIiYASr8Ccyst4aERxwP07azvdWzYYpJ3nYBz17xNiiH3h0CnoMKiJ/AktUv/v9WBOQKLXh/JgKVeiC8ohDo2phUB9LAYNfcfgTwY889SAK+HkauaPbYwz9h1nbdzff9R84Pvhj3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WPHFiCX2D8HefJU2ksWv8ccMuI1S9KxOQ2E/bdwcOTg=;
 b=YoPRiOYYE3tnaYYrd6yRHqIiSOqV/rvzzqhGOEGKfOznqXL4mj4jzxCSThnTjPZzVlP/i/RqJSK/DKuBVLDCZcTKsn424x6Xu+MiuGxDpfmDpOVRRB23Oc51ZamQHkSaYHO0Z8urg5NfQ1lR0zWI25Zd/qP4AuZ3El1FNBbFuVCY5nErawFEfWQxOk0Orpo8MVEUySouvOmGfP/0qW+WaoPxh5NR5PbInht1s9T6WDbineBYUtaM4sF8CwQT7Smi6i2GSHsAv35cwUMswP3aRkw4MEscxVS8nSBVl8W9T7Xcp6Ot2rwLnZxKYow+xKUB3RZtM2sDeUSbE/NnHAcmDA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com (2603:1096:400:82::8)
 by JH0PR06MB6344.apcprd06.prod.outlook.com (2603:1096:990:17::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Thu, 22 Aug
 2024 06:31:01 +0000
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70]) by TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70%7]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 06:31:00 +0000
From: Yu Jiaoliang <yujiaoliang@vivo.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Hung <alex.hung@amd.com>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>, Hersen Wu <hersenxs.wu@amd.com>,
 Dillon Varone <dillon.varone@amd.com>, Wenjing Liu <wenjing.liu@amd.com>,
 Alvin Lee <alvin.lee2@amd.com>, George Shen <george.shen@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com
Subject: [PATCH v1 3/6] drm/amd/display: Use max/min macro
Date: Thu, 22 Aug 2024 14:29:29 +0800
Message-Id: <20240822062947.1318340-4-yujiaoliang@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240822062947.1318340-1-yujiaoliang@vivo.com>
References: <20240822062947.1318340-1-yujiaoliang@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0040.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::7) To TYZPR06MB4461.apcprd06.prod.outlook.com
 (2603:1096:400:82::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB4461:EE_|JH0PR06MB6344:EE_
X-MS-Office365-Filtering-Correlation-Id: 69a8ccc7-9cde-4a90-1426-08dcc273fd59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|7416014|1800799024|376014|366016|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AeXGn4tS0gACzgjnWtBzHiB7Kf1TYk07OhDkR/kTgM5FWSRewPlQupoBRXfT?=
 =?us-ascii?Q?TbRrEvXIE8SNEIt/1W90UT+F7EC77B8TBGqwMpJxgakBASrC3Gut06x/O8yB?=
 =?us-ascii?Q?RJBGGtwdued3lWxms1tws+vb87wjgjbbX9Ms8kt6zMtbzPSG37+zSHhgfZJq?=
 =?us-ascii?Q?oUWzh3+aVtJmUQHUpMb2gv3n3kkQfktknfyxhJVA252/mZlzED8yGXKy0Z+w?=
 =?us-ascii?Q?zx3c5Mw0m6YUJ7IFIWwaQTQlIBA7qbyilc3nqFJHk7cVfKQI/Amaq/Ya4wK+?=
 =?us-ascii?Q?vG7BwHEBzUYJ3aWViK9VGt1C1/yyW4Oew4OB0y8t2oWU40AB0syGfAT57UL0?=
 =?us-ascii?Q?Pa8E7n3XEZpo0Bnx5fTIb/ecAal1sMWaUZVrgLBRym8D2/YKNBfey4zfaOwj?=
 =?us-ascii?Q?VIJfp+ed9qk5p+u0gOmVmrAmNC159Baho7e0ofikcobtt1JYTUMQgqBr44kB?=
 =?us-ascii?Q?7SsVkyHgH1hdrcdagVs73EoMM9H3wCjoXCyitUWUnZTQcatMgwM6Zep3pd5a?=
 =?us-ascii?Q?XCQ3KyR663YhwIRRof43PUM4sS2Trs3QFCUc8VdEtsMOsbXsLDWY3IGbb5l1?=
 =?us-ascii?Q?rH5jRTJEkD6AUi98R9k7uiiH9Ag927omTwWEZj/QqIIkvQV2fUkdWIJw6dxe?=
 =?us-ascii?Q?8FVNYjh+6YmBOmdKlyINxLmxgyn5mWDMpCcSByWPptajrdVbeIvFGEPfbhin?=
 =?us-ascii?Q?bE7G7hdGRi4zremlg1sl+iybKQTWR1e64HUSqLD+LuDZELD+YQ+Wi+Nh5HAQ?=
 =?us-ascii?Q?pMusQMSQ9h3xIq1HxCqEyy6KZwgU+IVR+FggjQT+O9NXBD9KL7vt9hEanmLI?=
 =?us-ascii?Q?Te6cHoaUWJp+kjNqru5XBe1kxYdxN0/1EIqmr4KBfqYpk8eBYd8NNuHLQuo7?=
 =?us-ascii?Q?AjW2qymGAY17rYESPDkEtcm4n6lL2PBBb3xvqC5gVJFNPblTArSODI/c4xIO?=
 =?us-ascii?Q?GWFbnKzuCaqP+jV44iu8w0UMFgcU4dk5UwMZJYhXueZSNJua1FKhnLglyduH?=
 =?us-ascii?Q?XIs/E5lOtHxZgDiKr0XKbzRGjaB2O4QbbdXsBbLZ8j3KOdA1kgPM2VC4o8PB?=
 =?us-ascii?Q?wchCGvPiRUuIkuOh83jBcyrz8RfJgtfg7q5BilnV4LIEGt8mYyCiNANahXp+?=
 =?us-ascii?Q?Y/MstRx1jOi50F9n6GzHxsDfdj3yGvYS9Y7Ki6QXdEhKTbJC3t2CKK8pIVr+?=
 =?us-ascii?Q?rSlerGaeBs4VWze7w5Q0XyG1CsP1d/d/K9+nPsQHeSr0tyDprGGAx/Aa3ciU?=
 =?us-ascii?Q?r1MB4xGNoEudEAROhd/Xi3OEh66ymcy9OJotIJAxHtM5C4rTBipIV4IpNbcC?=
 =?us-ascii?Q?87rTVkZHGjuPd889SaKeIOSOUIYg5xcRMnGjv3DczHEGQ/59jqzhjvTjYDV5?=
 =?us-ascii?Q?JsvxuvOGtVnVeic6NZ6MO4IYdPRup316akmyhVFTxqhCdoIcnRqUwqAcx3fJ?=
 =?us-ascii?Q?a8h/ZXAqEHU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB4461.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(7416014)(1800799024)(376014)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?w8PAf/KI2X2m6e8IF/syfTJroZUMVhDAY6bZYjdcVxfSpaO8XEopxVjxaZ+L?=
 =?us-ascii?Q?iFhmlLF4KVoocIRFZvmveW1NZc86r4Tv+B+EMtaPnr0LK+cauHvW+mlQEHEd?=
 =?us-ascii?Q?KZZ3z68vfamU/V+52b1D4K9gK0jz4MSW5m2O8WvDXcngEQu++ic1ohA4sNUb?=
 =?us-ascii?Q?HOJgMjvR2HeBqeSZgX45BKkHICc9ij3iGi7PpZ9HnGwOYgm3YrnyNizovDTM?=
 =?us-ascii?Q?6kI/mCTcMhFZJoZRmQHYk3CooiVhjn528oJlZMUqHlEMjEsKfCwtEmNFb782?=
 =?us-ascii?Q?d5YKCwRoJtWsoUBJ2gja3cq5apcDw7+qDk3542j2wuIK6uPTAanE3ENPQoxi?=
 =?us-ascii?Q?ywKFxBEG9gIs3QS4J88T7u/t5ZwOTmoZbueZfDDZGGMEv//9KOQW4p+LvMZb?=
 =?us-ascii?Q?awXIiVL7LOjKUrAHw28WPEwbgbPQsnnJjOzzD8hrqgHndRyBqBHiedzhWpug?=
 =?us-ascii?Q?qJykqsMdCLz4ApqAWO9w8MVD5KDdTklErvSnce2Dke0TqZW2MIVDvlqj2Wlj?=
 =?us-ascii?Q?wD5L8TGoPGpR+oSk1njgaR3Az5FWJ6GrKwNP4Sfz1F9X/xlo7/7Q+JgFPNyd?=
 =?us-ascii?Q?Oicc+8jZXdkZ1PUZynHaaqddjdHDgkqBl1GlJDhnU7+lGlvPCh4oTPEH+xJR?=
 =?us-ascii?Q?V7YRP/CqcNw9DPX7D5JTlyTCJNHXWfjQtW97kbVNsEOcWu2DdEQ9w0HVNEL5?=
 =?us-ascii?Q?Vlz//DlvLffP0RU5oZjQ01HR0WVzrlY68mXzdQVjohsQbbduoTEFMgypyZ88?=
 =?us-ascii?Q?BTK8E6XZ++ZtH3nBCCqmHXjoSG1oSPaMPXrgsgaeTXmBIWvepctxJAOk5eVq?=
 =?us-ascii?Q?nxxSiCXbNkOUacGn9t1/bCFqvc4KoPW1ChXhrNnIJyQIA1xpuJHHNTH6HV7L?=
 =?us-ascii?Q?OCg1sv25yGTIslJrmZ1LjzQpCU1uYfYb+RftUTNZaXFHCjtvm/OXyjLUZAPi?=
 =?us-ascii?Q?zZLytwawPzio9xFmfFbhIo313pQ8bERpCIQOImsb51VZz0a0/ugYB897/bsK?=
 =?us-ascii?Q?a1P0Yi9upl9+kUPf/wJ+AMK5iciHVwDdkFMOXHMHDb9GKc8jLPSrDXMxC8lN?=
 =?us-ascii?Q?QAdR8V4vShZqOXzv1hJ1f1mPSkHUEI/0uLQB0HDabF3Zy0WANSBMFuBoqtiR?=
 =?us-ascii?Q?/KXfb8oYo4DXUKWGtcuCzFNIgvY6QK62o1s1gRAP404OHyGI6/EUK3jAj2TJ?=
 =?us-ascii?Q?aGiZLXTuRfBHPYuO699MYGobjwM89tNCin4AQmkctAUMRVrKksr1tS9NvMNW?=
 =?us-ascii?Q?c7SQtUSVtIengQEBOy88GFuCYwrCqucNudcHQ5ypMtqs9qJ6LkXJke/42lrn?=
 =?us-ascii?Q?GGIeHoZ56VwpFPoNAtEJdx4N1COEMjN5aWrWCtxwz7u+pTNZufloeZc439sI?=
 =?us-ascii?Q?vst3i7H3HyIohlT3i64CafdwOPLeQtUhR/HKKZm1ISbEbutHzY4DQRVtzF03?=
 =?us-ascii?Q?kTAS7Kyb/Qq7UspyTwY92J15rPKPk9yJcl9ZpFTt2Ksm5Hd04JHuHTUTz8LU?=
 =?us-ascii?Q?pReIaFx6T+sMPJ+sQ7b9y0ShOO9WF2uTn34+Fbox1Lxn+uJJ/8EmJiqCzx0s?=
 =?us-ascii?Q?T0zb6DBDM2qOaxLuqFOco4LWU/sPzux8zN0qfaku?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69a8ccc7-9cde-4a90-1426-08dcc273fd59
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4461.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 06:31:00.9032 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: loXKKdR14urBzbqbEwGaMEAWVsGRI30OPya7keNca40ktnwH5l0lS9IKnZA/x4Z67rhti3erYxNfRzyCCMciAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6344
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

 Use the macro instead of ternary operator.

Signed-off-by: Yu Jiaoliang <yujiaoliang@vivo.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
index b38340c690c6..5d40f61261ad 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
@@ -797,9 +797,9 @@ static struct rect intersect_rec(const struct rect *r0, const struct rect *r1)
 	int r0_y_end = r0->y + r0->height;
 	int r1_y_end = r1->y + r1->height;
 
-	rec.x = r0->x > r1->x ? r0->x : r1->x;
+	rec.x = max(r0->x, r1->x);
 	rec.width = r0_x_end > r1_x_end ? r1_x_end - rec.x : r0_x_end - rec.x;
-	rec.y = r0->y > r1->y ? r0->y : r1->y;
+	rec.y = max(r0->y, r1->y);
 	rec.height = r0_y_end > r1_y_end ? r1_y_end - rec.y : r0_y_end - rec.y;
 
 	/* in case that there is no intersection */
-- 
2.34.1


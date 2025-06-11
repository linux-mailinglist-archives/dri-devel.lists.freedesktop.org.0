Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F24E0AD535F
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 13:13:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B61E210E61D;
	Wed, 11 Jun 2025 11:13:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=inmusicbrands.com header.i=@inmusicbrands.com header.b="LGMCOdnk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11022098.outbound.protection.outlook.com [52.101.43.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C85DB10E61B
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 11:13:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XMYPjQ0RoY00dOylmWcFehLhfZWVxIUvyRhMrk/tKCSXsB+Tb9xBJv6fqFlJu75yzpBx8lORvbNZzPptKT26dcV70/QaeItfh7cIKIFqx5SNTXaRF1uD7xP2QTX+w2SF0NsdOrEmBFyKXdrnrQ2detUDggcFt48ThU1OjeRa8fOp/jI0v4cXWOmBTf1PygaBLLYjwGUjsvd2DJm1Ihg1JUAnjOhErAupLe2YIlLKfjr43khSLU/LGRzk3/DtM6wRiKL9s08goywtVbb48AcVBPm2NwEDLcQSKJC7MfNj87xTfmD/3JphEAJ1ZZUn59CxolUZXrxDo4sT2rNAwx5SwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8wfYE70336bv3aCdUFpUIxvE3MP6r1HCDaIgfGZx2bs=;
 b=MK5a2ZqAnRDoWVv2rPokpPmYI+FnuY0SiaoOdgEQ9B3UfvxGueOB8gIhw95tNYVNKvcjWecpSvnVqFpEMAXtN4NG5TrJfqJ2Qx515ZOij/RW4BEKqNlshDfqJ+ezD4tlaQ5kGEBOuchNHDY2hnqIvb0hhDq2Xc7t6FFI6DNC7qm9n+uS/haM+PoKebXDsPbDgg35ozpfVPl8W9XEursEEcYKcFL02pD88BIOTdrN9LYS7plB9XbfQPI7IuxJ0Dffw2A3vs72zSKAcIqcHrCWFeKBOxwMIUtPBEsmHf2lXHusjOQO0Eszzomt3Xm3FKA6QRBmvf3d3XQstVr4N+wZ3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=inmusicbrands.com; dmarc=pass action=none
 header.from=inmusicbrands.com; dkim=pass header.d=inmusicbrands.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inmusicbrands.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8wfYE70336bv3aCdUFpUIxvE3MP6r1HCDaIgfGZx2bs=;
 b=LGMCOdnk5vUhVHwnv1XqwlpAqh9uB13+GauC5jshI5dToq24nyGjTpqX3e1xhy8kk+YCiYI6Hn0v5WBy0mLA06eAF2Qg1Ur2odqXW7lQyQr8loFYO8WUqIiJMyR+3SzDlmMsHn55jBxx93XNAGCzcZrP8/NET7mp0MbPedc5Pi0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=inmusicbrands.com;
Received: from MW4PR08MB8282.namprd08.prod.outlook.com (2603:10b6:303:1bd::18)
 by BN0PR08MB6949.namprd08.prod.outlook.com (2603:10b6:408:124::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Wed, 11 Jun
 2025 11:13:22 +0000
Received: from MW4PR08MB8282.namprd08.prod.outlook.com
 ([fe80::55b3:31f1:11c0:4401]) by MW4PR08MB8282.namprd08.prod.outlook.com
 ([fe80::55b3:31f1:11c0:4401%6]) with mapi id 15.20.8835.018; Wed, 11 Jun 2025
 11:13:22 +0000
From: John Keeping <jkeeping@inmusicbrands.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: John Keeping <jkeeping@inmusicbrands.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/ssd130x: fix ssd132x_clear_screen() columns
Date: Wed, 11 Jun 2025 12:13:06 +0100
Message-ID: <20250611111307.1814876-1-jkeeping@inmusicbrands.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0418.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::22) To MW4PR08MB8282.namprd08.prod.outlook.com
 (2603:10b6:303:1bd::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR08MB8282:EE_|BN0PR08MB6949:EE_
X-MS-Office365-Filtering-Correlation-Id: d9eeb574-312b-4727-f98b-08dda8d8f9e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|52116014|376014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RJVIwo+XYkqkaabVlPefk05ZnrLYeKOkCGQgZSUtix9Oefb7lu/vh7zYyU+u?=
 =?us-ascii?Q?tBzi/IMXrA7geyg+yfxxxJoeUIQkUz+ll7YSrAt4uUp2J8Sr9ahy8Cep8xaH?=
 =?us-ascii?Q?ifeMzUZQC06NRgL+/EWaHWz1yIQMWbT/oC65JLov+RLRSSqb8DUOeqBNS8iL?=
 =?us-ascii?Q?zsfSIo2MN7F43xE+Tn10R37aAOpr0MtrrfTgfZpz1CsZoYT/Sjy/E1bmKczX?=
 =?us-ascii?Q?l/qoBrVwc4kyzqkwDPbw8ERprNOrAIbyICf4qkHjsCO/HHP7FKfAm1wfUdMi?=
 =?us-ascii?Q?WudJjcePvXKpl/xas3sF/wTDGyzAb05V9AvS5+zZ+sVNwWL9UuE81VkXK+/d?=
 =?us-ascii?Q?nWPTxAKlAsIzqpyzi3mpXM2CJcLe3gamyzZeRWrAJdxSKDQG1NGei9CPt5Wq?=
 =?us-ascii?Q?IA1Vi/Nf8z/TiqWMEpI8sah0T6DxT6JNQi6OIIeFzuZrglD94RBAJJz4d+4O?=
 =?us-ascii?Q?+tZMGD90iJpN7TLkD8RS76wYlmzWk5c5GsdbG6NNob4UZPVdMOGbeaJMb43I?=
 =?us-ascii?Q?xPa/0bwToQuUqDJCx1eobfmXGaHv/ZcZdHYZVLBjtwljZt9E4nF54sjzF8MS?=
 =?us-ascii?Q?pGto/KLDD+1EfCNnMFbsy3BeI1vCaJWS2FqCmJiOjNL3Pspjbc/c11ARO3ux?=
 =?us-ascii?Q?1NscZlRoZITQysXhh3D7Kywd4Oez7aGbVwJADtLi8cJ2RfNDB5rDec8DgQng?=
 =?us-ascii?Q?nj4ODYkEiRtHpXKTnC31ZDY/vpQnnoqTu7VRz+LAh1FLKPMfY9QVuDuTrNG6?=
 =?us-ascii?Q?VVt96gvixFBBgX/m77TDx63RoPvSN0By48j+Tkqg8EOvnSPd6IluxSA1KqN+?=
 =?us-ascii?Q?jLc0lOMNKJJbzU1pJM4UPkGtKDlyhAVsV+5FvTwnXMbpp/L+l6ESp6skTR23?=
 =?us-ascii?Q?GlevErxCPWC2Ni6PXT99JtVK+PJRtOP2h3RAgxML5/8P+Ozq9UFJZHfJI7FR?=
 =?us-ascii?Q?jZPoMOwQpHuIHWJZAS2ZYOk8TplwyG65RHn6SM69oJKYdnLTJxufaL6gNQbc?=
 =?us-ascii?Q?dJncE0t0b0HW20v/Q4rUQcF5cDJ//yQ8N5sEkg0Qp88/F/rafdVSSh2sRNeJ?=
 =?us-ascii?Q?p2UHdKL6w3vdteDpm549D3i5kc29ato1NYJOr5+EkpyV+p+75QtCPlJXPCc8?=
 =?us-ascii?Q?TGTBLNslGFymyoNFe6VaJK26ZPU+QtWI+F+MB2sgtvdM2Kx5IEQMTo6edKD6?=
 =?us-ascii?Q?sHqmj3jHhoQT5no1+olDdg/lYfkp6iBtdXhyxNc13+lPPdjtX7civfJkfUcZ?=
 =?us-ascii?Q?uFxt4fPj9tb5685jppMwlOoUZFQlXuivVyopkQyQo7pdHMZpanwt6Ivhyl4m?=
 =?us-ascii?Q?ELkFkKQnULOIxrOCZWsXIG/gooeizXLoMlG84ki8neAyiVVkNe8bd9zkPvJM?=
 =?us-ascii?Q?ztDXbqf7H0Gaq+03kYz7YPaBm8kO8t2tQSBYdXUUfcioXT2hnhAQMPVIbl65?=
 =?us-ascii?Q?L6rs3Pn9Sa7iwtN4lKgA4ZNriiJLEbcWw1oSkAMySGtqy/YRNBTNFQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR08MB8282.namprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pRkLf3Z9vTrGWN/EdKBVkL4d1yalhrKKLbOJ6BIdbmwb+QXpyI/YzRrYiRzh?=
 =?us-ascii?Q?G4Xh1v6CG9+s4+o4WRjU5ykHmI0kZuurGWP3VpH7YX+uUiTIGiURG7WTovnO?=
 =?us-ascii?Q?sSo+hYUC9GkBcrjINJpKkC96EASgID6zvQGCIgvDgRQ1DPwkJL++pUSS5YcZ?=
 =?us-ascii?Q?78xCp2NmpYmZTCTiM2l+HeJF4IArWzFKcWr45Jd3oS2hboaEIHtaIzW1YGDt?=
 =?us-ascii?Q?10EGXr/LGV5JNlWYdSjL3XTk84YuRHxDAwLj5QSnr6sdU//f8o6GMQYWylGb?=
 =?us-ascii?Q?FQuuWbQhNN0A5wQN5C9bYH+SssBTqsCBEIGnNqcmtwD1/g67pkYGWrYg1dbA?=
 =?us-ascii?Q?T0Tn97XI55LH3AQswC0OPfMLzDOKBfZuNv2wavGRVHD/5WqYD6iyj1D8DYo1?=
 =?us-ascii?Q?RZRUNL22jCfNTlXY0kRKqh1VMabTTcrwvMu5tt3vj8ppN6WsEY9/AWLl9kLt?=
 =?us-ascii?Q?U+sPdvaKrZnq1q4vQWXtRfPCr3W5gJAHLh7kEosvY6AjVVJxdVbDni6hajFt?=
 =?us-ascii?Q?XfA7AgHag6uz5GFsp+EOTWhhdwUZBjIompWShoVRsJJMOdKzR1POf/quBWEK?=
 =?us-ascii?Q?DAZv0tbFk1gcp2Bu2PtSidMeWw5Cv+h9CIJQIcrgyeeCwEwpWM+bX2+EfIOw?=
 =?us-ascii?Q?6jWR+022esofsBwEFbHdlkFep//PAUkPnXuqqwAGcxGi02pa/e76grtQ9hAL?=
 =?us-ascii?Q?312PBHTS9Vapnc/5e/dtAy3jYKgKTPpkQHVWCORiA/pMJ6nhQEuFZzwx+zi4?=
 =?us-ascii?Q?0ftVlfqc3gGOd7y5V76gDUnj+aSd15vGB8iWv9WceYRCpDCrQWQqZPKRe0hY?=
 =?us-ascii?Q?fxpC4dwpJR0M0apiqInXroRROAZ5/NNDjgcIfuL2eIlDleDRij9OJFqAjtZv?=
 =?us-ascii?Q?pDhFUmP8z7PxVx3FQyvcmbgkdPjxTsezUDuz+9KLIjf6Ixs0xnF1Kcllki3x?=
 =?us-ascii?Q?V5mG5HcO9rzjrCQmGEyLZqaMZJ3fuvHrn5TcUrKpFOzrm62u86c153kbktdu?=
 =?us-ascii?Q?j2n76wvUljF45AxEsu+nq2k4+Mac4/drTjljrPVkLFQRoDPhZ4qiCxzoUJQ8?=
 =?us-ascii?Q?N3maPqdYZLazqzTP0q7AbLMnlSM0i3Rf4HaEc1JPpsMSSDZ3+AHuh9y+8bwY?=
 =?us-ascii?Q?N2fVOOUwPZZouFk91DxjmbdHjacRAxklGwTYGAVkI8s6VbejFEBBZclT2sSN?=
 =?us-ascii?Q?P0xe8RQ4DGb+yXMF5ej0TfWsb1V9Ie61j/2HP50PcnQJYRQTIE1yLG9skgdO?=
 =?us-ascii?Q?XJELUfcG02ojbPcF/+eI7QZoB4RIFbSIbsBDwWLR/jw+VzFsNrUGHXI1MTyD?=
 =?us-ascii?Q?s/XV+cum5vuqDu67226cm6XlwiZ/L3Y5DnDl2mIadHCPoxZbRe3mc+pnD8I7?=
 =?us-ascii?Q?SoQaSSFS6zknH04vjNLEx1aNlk0Ld4ix0Rb9oyPE5DAcv/7hiOXZDGiWk0r0?=
 =?us-ascii?Q?buJz9mqeKWEqEcj7UcAGOrDGiDPTpy7uIIoJV0QskqDfxBz/ouOALaSUZM1B?=
 =?us-ascii?Q?JDt7BbPzjnWYONAC9yzQ2hZbNZWAOWXHKX4CtCe8TM1pTzptsOp65tGQJ1xR?=
 =?us-ascii?Q?vSGcaLxOj12kjzetbmrI2r+Ik3sKeF0uwgHWKkcb5WNO5+TbNaOaa52ffXQX?=
 =?us-ascii?Q?rw=3D=3D?=
X-OriginatorOrg: inmusicbrands.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9eeb574-312b-4727-f98b-08dda8d8f9e3
X-MS-Exchange-CrossTenant-AuthSource: MW4PR08MB8282.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 11:13:21.9495 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 24507e43-fb7c-4b60-ab03-f78fafaf0a65
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: shP/Yi2LpyToz36y54rzJ5Vh5mTceoZzJbJVOAXOuw8fLfcgzXxrBoQ0q19g58JFlkuTBr0e392/pSVOEMQ6y0Qx0biGQFImfELkIn5Fq7k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR08MB6949
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

The number of columns relates to the width, not the height.  Use the
correct variable.

Signed-off-by: John Keeping <jkeeping@inmusicbrands.com>
---
 drivers/gpu/drm/solomon/ssd130x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index dd2006d51c7a2..eec43d1a55951 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -974,7 +974,7 @@ static void ssd130x_clear_screen(struct ssd130x_device *ssd130x, u8 *data_array)
 
 static void ssd132x_clear_screen(struct ssd130x_device *ssd130x, u8 *data_array)
 {
-	unsigned int columns = DIV_ROUND_UP(ssd130x->height, SSD132X_SEGMENT_WIDTH);
+	unsigned int columns = DIV_ROUND_UP(ssd130x->width, SSD132X_SEGMENT_WIDTH);
 	unsigned int height = ssd130x->height;
 
 	memset(data_array, 0, columns * height);
-- 
2.49.0


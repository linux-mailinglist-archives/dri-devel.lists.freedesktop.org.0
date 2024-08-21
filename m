Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 544539596F0
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 10:58:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7EC410E05F;
	Wed, 21 Aug 2024 08:58:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="MMJ574o7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2054.outbound.protection.outlook.com [40.107.117.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DA8210E05F
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2024 08:58:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nkD9X1NKE6dLuCbc14sMels14Ukytd4rMbY2q0+RZ1DjMCng4f5A1TFLs92MuR7vMZzUFuQjuh7onnQrfUzyWnbwXfSXYlrSj+bW/WzmPsjG9sfIHcwOGZtcs0RP2eySbT+hieRv2n6snsGTnqjFURYg7hhFR78nt85ax9RnO1ED24Pv9O1yVf7wBoTJxYA4cKlLLc/nQtMn5msYb5M/qK+nA8+bpXqM2RdgTFF/pxWBWEpFzsyzOqEn7H49s0utuRhQ6UMt4MOfgD/YBoXi6M1L45ocXyPkWnDANbs3Fyzvs831QSrrPSZRMsRFWR1nNZZlkTZyJ86yGAs1Kd+avg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vWl98m3JxtKb/Pdzto1oN0prlIUjsqyjB1U8AUqYhDA=;
 b=V/a+zosyEtgAalWKU8jRwOM7907R6CH7oeps2qQ0z2sbw38rfZmoyL/SI3ITsxBH7BHd9EseUueDksn/W2WqSvx8vzS/IdHk/P59mNLFh6gLETjvvawmoxRF4/hg6AY8gU5CWtAyZrSXNdtZLAddJ5nAyCM45wvkQxea2rmLRkhqKNvqMMpGpFQaJfPGGcWg0Qc2fgVcUkD2yEKl9QZ6wQeGH6G+4OTbXMju4LMooTKwajMBWpGmQhCUm1Xb0QmOBA9lcTGfwQ1b3tJmaNcHqeRjFMY3TBpP2unt5rmN9Y9iFK7c9or815zED3dgbvaY2uulO3RIqAqd7FVZ1kPxVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vWl98m3JxtKb/Pdzto1oN0prlIUjsqyjB1U8AUqYhDA=;
 b=MMJ574o7RvqAKT0PgKK8Op4ry8OQscRj6Jlrm0J1gKyd6orTuti3G+kwrPBZ2E3nUR2KHZC80WxCGB9TFcXc2hVD+Rm/51dO6khxCHlpLefb34DTHpulXBULZHFcU/ssXI8SiiAI29TXRdKyX/58LGRCPDF3wE+7AtX4aqBIaan458rXAOUUV8St3qdZJ8brzvBxR3TLZgj5aQtpAtr/tb4FzgsCPav7ajKd1CqT5KZ89hqP/b16k0Nz483mxhO0vyg56YTwdUbXOYNi0+UYgrPJgzHzgcHFdCiseMvOhPVeDtVUISo1xWwzPK6cvlXtAJr3vS7xAW+Hjbz+5Nr8CA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com (2603:1096:400:82::8)
 by PUZPR06MB5819.apcprd06.prod.outlook.com (2603:1096:301:f0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.25; Wed, 21 Aug
 2024 08:57:58 +0000
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70]) by TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70%6]) with mapi id 15.20.7875.023; Wed, 21 Aug 2024
 08:57:58 +0000
From: Yu Jiaoliang <yujiaoliang@vivo.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com
Subject: [PATCH v1] drm/connector: Use kmemdup_array instead of kmemdup for
 multiple allocation
Date: Wed, 21 Aug 2024 16:57:28 +0800
Message-Id: <20240821085728.25909-1-yujiaoliang@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0032.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::19)
 To TYZPR06MB4461.apcprd06.prod.outlook.com
 (2603:1096:400:82::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB4461:EE_|PUZPR06MB5819:EE_
X-MS-Office365-Filtering-Correlation-Id: fad7d9f2-0d64-47e8-1f45-08dcc1bf5aca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|52116014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?18vl3fdSokSG0W3gQFbkttDJwWs71GEKxywHOPhvTcT2T0nLt9d5v+FE7IS+?=
 =?us-ascii?Q?3IRqIZvDGA2WA8qRbyn+bXVMbFl55DZdcjtObr0E4ZEq9iDAoUzV5GXbD1vF?=
 =?us-ascii?Q?J6gM8Kf4BzptW1M9+gMrQJ+Q5F4ULtr01YtPV62Du9X8k2i5Mc15sKxohguc?=
 =?us-ascii?Q?31ahqbL06ZZJAIsFRwT92aRrKSTe5uLEKt+mRAyyTqF+OXHFthwbWjSwMvSO?=
 =?us-ascii?Q?PT9Lvg9IvWKlwH7UiGMyWMhUUYMA0PrGUaxJN+ZUyPXdFK3XnfKybxeojiry?=
 =?us-ascii?Q?9MIFhj8FMtzHCx3B/1YiaNdynmmkeAX4TaF7cgyMgRHQQQgSnqacLCrRHzKz?=
 =?us-ascii?Q?vmUp51DS8jGwmMmumh9qiNiDwIrGvhMmcK2Md+IYJokROXdttbo61jDZxWQO?=
 =?us-ascii?Q?40U25cPJRQn6Err6dq993uymGvLG+flR4Eo2lUgN7LGECNPkEFZXFqWQTeby?=
 =?us-ascii?Q?Lb1Xoh8RrzGGCL09Ju2KYB4Xnw7GPPiBbg0hIhxll7xwYFyOH2Zpq1iLc8o5?=
 =?us-ascii?Q?pNEkjQQMVLV3NoEtbEbkhGisB88JQmsan7Tm29+ghmZoyCqCTLEwdVoOfGcs?=
 =?us-ascii?Q?Hl0grrEJCXOYOh0nLpb7QTrNINOlhHUJRyD7KIk7VC38qocj9n3w6eP5OJd/?=
 =?us-ascii?Q?IqTiq3UEaRwFgIpYrapDDnbquo59dbf12/0qLRvyACrNJvHhgB3EaP4bugnf?=
 =?us-ascii?Q?WmL4rvoU5jYTySpQdaHVDm8e4aFLhgCw4z2NI3WqZ+4IvQ3TSUVsbd60t+me?=
 =?us-ascii?Q?4JVZCURN/k39goClVeziMXcGCSoSqUcszB7w/Hte4tZYWq4WcUjHmEQ0C91R?=
 =?us-ascii?Q?LMb4WXG8GshH02KjkGSHUStN5eyGBOJ8PlQOGlQmXXZub117WSz0ury1k6MI?=
 =?us-ascii?Q?yuDf/n/oSK2jiXPG4OH8y8LtaVrebnpmYnjrBheP8V89c8SLt8bqnw9rpBAH?=
 =?us-ascii?Q?52HnVGKx6EH8EsIQMOvBPBTgSuPg3mA2PQa0ql5llanbDkiH129ZrTdWMsbM?=
 =?us-ascii?Q?1Gxs0RZMtaGevlJqlFfMm5OM35ufNx/Pdyxjzf5RwKxhxVwKf/h39Oc51KGS?=
 =?us-ascii?Q?BbYp4WTuhzqGzlV+rUu41wRFXv59X/BMwG0ryGtxaFyp3Kstpg79dQVglb/F?=
 =?us-ascii?Q?hApnlXZOlIJV+o5lBuL404GisIB0NVG3f6e4UGoogxCDTtaBy50G/F4lvvUD?=
 =?us-ascii?Q?eGOf0VBs/DH6T4hpLY+PYUBv1g81j+g+jQUahkGerQ5bnPF+Zn0NhBdKjQET?=
 =?us-ascii?Q?oUwQ5yJsm7mhIc/+w4rpcfEChh337MY1uTR/zBFZ7tg62dtPh6pWdZ2aL4px?=
 =?us-ascii?Q?Ml4DuajlgaSq2n18SpyBNjBMsKhxVPtbxWIZYHkNYq5JXxlSdZc7xzxBUyHi?=
 =?us-ascii?Q?XDLa0S3+FvYkHrJoQ01Ts9ufNM3GMNk2v1q7AETOmIbpRYA7/w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB4461.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lTe5wDPp5eBkERFW+WxiCTFOKTy03BmWwxoKKs/HCDUdzHwFUhNl5eRvoXs3?=
 =?us-ascii?Q?5G6O9z4EJkGIRvV9vwXYMb6gg3Eiqe7Bk6ZCK1HkmJ++Hjrxv4hqGxXkR1rM?=
 =?us-ascii?Q?0mAUFqXurIvUkZ4823STozt4lNPOXfLfCd17s9AQ7YY6n2QyfuJJ6bt0erR4?=
 =?us-ascii?Q?QQ9+X1AGCibWEPzuGpy9foDvylnKLQ85S5UZDXpAem3OuzRlNr8Wb6JFgcke?=
 =?us-ascii?Q?eGFvMz1qWH6iMbBl0P8R4epUYhK/GlYcHYjtymSzbuYDicqpY6xfox2I65va?=
 =?us-ascii?Q?qY5riR/+kHuU5mzr2yP5W8k9uUqqj2SgZzNeFiXM0hlqb2QynvpHWSuXEaA1?=
 =?us-ascii?Q?VSfQTPYNFr5iY456U3u59/6GjqeMITxPWlJd5xWEoiMRaRhLOxtLEYcDvzQ4?=
 =?us-ascii?Q?pPsTAW4nwrHo6IxnGcF4/ugSK5g5yJWG9V3a0VAc2dRYidkAYuvIpfGKi+Pe?=
 =?us-ascii?Q?9j5tCG50DI9Yz5TgINVjE56N9YkLqMUdcCvx7bL5gRYFJFX3qJ4WBniLqkzs?=
 =?us-ascii?Q?ZM+uTuQxbjiFyWe+ZVUdGuWudJEYlUKuJ+WO0yoD39IrhkBoNFBY74UerObR?=
 =?us-ascii?Q?X2rBteXUx4vsPVEesGV/qZDZgCSVIGg7lE28hs5SF6V0CgtlQYyRr8w6Ucnw?=
 =?us-ascii?Q?3xRzpo3u/cO5NQIl8xsztjkBOzEG/8DX3eBbAYxtxic4rrBX6qi57jcihPb1?=
 =?us-ascii?Q?2s7OzEv7yWK9ZnpgVZHj3E1gtWrPw+1pP6LNu2kwFwTwQZZDVaEJUZLG8yWl?=
 =?us-ascii?Q?X6d6jTluTtTArb4yocqnwKJCGVqg8IXKDcglOXBGIsEaS1tJoHukVzfUHU7e?=
 =?us-ascii?Q?k2UAl1O/RlVSFXLwzmWTHOsJbK1/dGxIqEof0aHyPcMUSDap9ZEshwY2+lhd?=
 =?us-ascii?Q?br8RdIBRJ5aPUxf22EeaVyblpfO6caYT5mSOtR+eTDFqMM7ojLDKLU4pWI6B?=
 =?us-ascii?Q?rt8F2iTti8QNFtl7epUYhcOSCGJGAte27lfNRLaUlOc8fdmm1N48A21a9Bmr?=
 =?us-ascii?Q?ygqYLJbCXub4tWtuds/Fk+5z6/AbLBdUfPBuywL2zIijGF7e3G2I+IUGMJvH?=
 =?us-ascii?Q?FOxvnNiDndw8Cr93IE0b1C1B5aVuVPOWn08A6T20cnzEJUgLar9dfQM8bnhx?=
 =?us-ascii?Q?0KCRQu8I0UsnlXmVFZG8bYVspVoRxQQ9hukJYxlxApGGjAPlJtek3kAveBRb?=
 =?us-ascii?Q?GJf+zBN3zwXUisofPljXLUmtAexY7Z/L96Wru62oFL8ync6lNqamMK2TTdHw?=
 =?us-ascii?Q?Ei8DYU8TzOhY0HjLHkR3y83ocwvT+UJPf4XrGteVBTL3XCDuTuXBEmzrvqgY?=
 =?us-ascii?Q?csdqWhPY+4GwIaWfv/BxJgBsYJg2nZFn2wBM1BguwW2ch/CnqGx7Gz/sgGRA?=
 =?us-ascii?Q?8RZDHao0ZsabTxLEHrkRMYKgWcC/Z9N/rqgdN5tF3xF+wqmLzZjTsvsJZe2l?=
 =?us-ascii?Q?6b9YGbmypOV2O3+ufgm04BMvzG2UNIh6z82xX9L7lL62h4IhTMI1GLa8KG79?=
 =?us-ascii?Q?yM/Ku+wNY0dWZkdBQs92Ui1MENOVAXCQEL7y0FJAuIfz0hMcZJrWMgMl+LBK?=
 =?us-ascii?Q?yPudL3gDT333NpXjY+X+2tdiC2q0W+azNSYCalf5?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fad7d9f2-0d64-47e8-1f45-08dcc1bf5aca
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4461.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 08:57:58.7859 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qlL3sAoAwjFBXGGwEhrAilpzWbZxjXIyXcEPW69HAUeQopau/iKoTocjrsaCbrFShHy9oeQZLhGZNfJT3gggnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB5819
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

Let the kememdup_array() take care about multiplication and possible
overflows.

Signed-off-by: Yu Jiaoliang <yujiaoliang@vivo.com>
---
 drivers/gpu/drm/drm_connector.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index fc35f47e2849..dc1a5243dc90 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -1025,8 +1025,8 @@ int drm_display_info_set_bus_formats(struct drm_display_info *info,
 		return -EINVAL;
 
 	if (formats && num_formats) {
-		fmts = kmemdup(formats, sizeof(*formats) * num_formats,
-			       GFP_KERNEL);
+		fmts = kmemdup_array(formats, num_formats, sizeof(*formats),
+				     GFP_KERNEL);
 		if (!fmts)
 			return -ENOMEM;
 	}
-- 
2.34.1


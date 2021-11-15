Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A3944FF22
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 08:14:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E2C489CE2;
	Mon, 15 Nov 2021 07:14:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300114.outbound.protection.outlook.com [40.107.130.114])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B512E89CE2;
 Mon, 15 Nov 2021 07:14:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UYnrQC3FO6T6JPCbRGILnUnzG/rObhx4XtJcO1dzyV/sruXd3lkIBytbCfnIcAZeV4q5YI6VMdCArCEx7nSrXPu/ikvKNFzBHhNzrvAG0gjriGl0nzjY8gJ1pFWRpJJyGjqEAp0UtF47p3f06Uwbego3A1SOilPO1s/JQJ1SVgumjWTknfiSXTDOlxKYQjgfTymmFuchmSqv4YH/TBGK7DHNywXbHtcZTkKbYb04O9nZ8+9SLDCt5SLITdsCMejRGErnQOidO+Lx7lP9aTvqOUXK7WXqTWIZnh7pj//j46WG/AYYFd3mRKIyxDL6gXygHUeqfIUL5CLat16VUDdYWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sppHG05MMRXWD7VUCjy78PeGd1Qa0CRwQMNMtsCmvzs=;
 b=YikGppW2X+9aQC3wbHxpsSkgY5tHMaSEaB5EI8TyTlfIy3bzzc0PYbScLREaeP0Jxi8U5HhUyDvv1SzBAoCwUZmbbToTxa3vdIYGYg2i/wKy8aLJpbIbCZL02rx5KXZJUz/ke2EnbB462QeP5NDvFTtSUv7ffMBJldhvDQ0vQrKB5xxjAPsWju9uDBZZwbuTmf5TAX3GlWlFfHsPG/W9nIwdEyDskjP+gnU5593UhmyL+ORgdAO3w7RCG8YBReisJbgslU+SVQ68p2IVGWDZqKHRbFWtrYDObvoqUUVgTWnrPdf0NsjyFxioSrVOoO9HI9aQIpPlw9MP+34CHtt+iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sppHG05MMRXWD7VUCjy78PeGd1Qa0CRwQMNMtsCmvzs=;
 b=g7dPYpb2w7D03aTLztsGotDYiWJLJgFMEb40z7p0Yu2hLjuOnjwsHtUUk66VmEQ6hQVup+nt8G3TAfjpfXRk2wXyK3xFdnB/VqXWdgEHnuj1TtwLH7flj5dG3bz0lu2KaHlsiN0JYLfGN3SFQadzpqH13GgDEq8JG9p4syMHNeQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PSAPR06MB4021.apcprd06.prod.outlook.com (2603:1096:301:37::11)
 by PS1PR0601MB3659.apcprd06.prod.outlook.com (2603:1096:300:85::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Mon, 15 Nov
 2021 07:14:40 +0000
Received: from PSAPR06MB4021.apcprd06.prod.outlook.com
 ([fe80::395a:f2d7:d67f:b385]) by PSAPR06MB4021.apcprd06.prod.outlook.com
 ([fe80::395a:f2d7:d67f:b385%5]) with mapi id 15.20.4690.027; Mon, 15 Nov 2021
 07:14:40 +0000
From: Bernard Zhao <bernard@vivo.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Evan Quan <evan.quan@amd.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>, Bernard Zhao <bernard@vivo.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amd/amdgpu: remove useless break after return
Date: Sun, 14 Nov 2021 23:14:27 -0800
Message-Id: <20211115071429.7314-1-bernard@vivo.com>
X-Mailer: git-send-email 2.33.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0158.apcprd02.prod.outlook.com
 (2603:1096:201:1f::18) To PSAPR06MB4021.apcprd06.prod.outlook.com
 (2603:1096:301:37::11)
MIME-Version: 1.0
Received: from ubuntu.localdomain (203.90.234.87) by
 HK2PR02CA0158.apcprd02.prod.outlook.com (2603:1096:201:1f::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.26 via Frontend Transport; Mon, 15 Nov 2021 07:14:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 763b9c93-8665-46e4-756b-08d9a807970a
X-MS-TrafficTypeDiagnostic: PS1PR0601MB3659:
X-Microsoft-Antispam-PRVS: <PS1PR0601MB3659056ED4FFDBD3A09BF20ADF989@PS1PR0601MB3659.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:126;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uFJDfS1I4byUk/YBq6UpxXsdAilGmwUAl6lKwYYPiF10gA7C4c3ElUXwYommsGtDjAEsiHuogXyjJePjG4GQKeDSFedD8jKRW0S08NNSrnIRNYphIXGLmS/OeO2qtozZfezGXDIBg1dhH1MpuJ2VrnoegouMi2YCiW2KUGYcP/GEDqxppkeuDiQ5FN66cpTAeA3nFHflJ29lcPsjLErnBUEsQszTfzz4nwBD0eJ5D2D1x56lqD71DNslyfl/BtQNn3DsD73vUAc7z4+YJBQfPV9qp4/NwoYQdozz4qaa89PvqR3pTVcTUM0JsMlI+EoTT1l9Ylm00mpuZXPu9LlXm1ezWps+nK1GOHfDGyK8n1wyOOqaNb9gvNesr/EcgSqg/aEOcrWoI2rm4eXFcXedq8ZItcNuYpn4UhaRzBbdp6wFpnMqgI66aiPVdGPbKC69rmO12MjcxpJ2W0mFg8XRSqSmQDjWmiV5sg+wK1h5KzmDDeL62/260Un+7aj8TjQLbFysPnA/3fixxYm8GXYBlSQNlBX9UdMGGP53HJncndR3KC+hHLzfdk69kZYyKTp7dk4KgViBLkBG6ACuoyfzAZZQprJ2uB1vIA4X1S3B9BddDUn67JFbDQKpZ+7GasA1jSLixAlnhnURuQewhKpjlNuqS5/HyDVRIhzCfebvB1Rp8dKCcYLhnHGbX5RI27RJD9RxakPPfhBI7tpARYUFpBarEKthHo88x/D9Hu8gJ3s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSAPR06MB4021.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(86362001)(8676002)(6486002)(316002)(921005)(110136005)(8936002)(66556008)(66946007)(66476007)(38350700002)(2906002)(38100700002)(5660300002)(508600001)(4744005)(1076003)(6512007)(83380400001)(6506007)(2616005)(26005)(7416002)(956004)(52116002)(36756003)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TUZZZXiknWddON8xgWfAxzAPnxG4aX9ZLkCXVXdSI2d5Qr2WqoD1CppQYMdm?=
 =?us-ascii?Q?H2dMijxmGRZimYMqyfw+jgJ+HteQ6RmqgQa6vVtg+8pTQRZ7SzFkpeOnQPTn?=
 =?us-ascii?Q?MQvDW+C85DIkrNC1K/6dLmWZat2D3aNnQd0QEEVENUW4m5UNk7p4pEtsYDtL?=
 =?us-ascii?Q?qsbVceJPyEIIrf56MnAQVII+RGCPRr0lwSw1U63COHHyHTlOfWYGoQhnWCJ0?=
 =?us-ascii?Q?FwKrHfj0MeFFH/EJzruwkUyyk6V1I8WMbWkUdXZdv2O6f1b8a6f7Fjs5ZuIn?=
 =?us-ascii?Q?vLqzgvmJ0EF4SjvY/6uBtztnMg7b3Go4OoMLM4ewy9WlUfm5NkI8VyeqNiuk?=
 =?us-ascii?Q?YxtAp6JW2EkaYLexVNAksPWLLoDwC1Fg3kEQkzf9y0DDGaiStXr5synu4dJe?=
 =?us-ascii?Q?UKB+hB1b1ElcoWvFB4TYVpK+OQpwO3j5Y2DmSFQuRlGrYZNmBrEZFgE7eCgu?=
 =?us-ascii?Q?iwj9DsfyJeu+CikUYkaIY5rDmfSfzHDdA9PyNuxmbzrN7qIOGpqLRvd7N1gJ?=
 =?us-ascii?Q?VlICUPELorAsGgykfAKaAlg68xkb2K1SRVZHSMwsngzhhUqjMiz3K+zbaIPD?=
 =?us-ascii?Q?hPnS4ZcRqIajPu/EQu0YvJjQm7d1X9ts0KsYOhezEo4sAv0lLt9XU8jU3ry9?=
 =?us-ascii?Q?f7w7H4/COYzJ6efbaBT8GXUQtSSsr5PhNcum7Jki9fHiw08XUi6CPXAOoony?=
 =?us-ascii?Q?GOMFPhHozD4FlrDqVgxw2l2unuJwRroiZ+NfQ5FOkoBQ+BzMoM3C1XSYSHTz?=
 =?us-ascii?Q?AXf8+HR8UVou8dS4cP9vSzCELVzY96vTygtklePyq5oUTyP7ooXOwZLtTeTa?=
 =?us-ascii?Q?6++1blEvFtm7uJ5UHz4Tt0OtaFyPCDar9XGCPNtkR0gMeKJAF0febA3NiLYs?=
 =?us-ascii?Q?v0RBdqDZkJTQPDgm1hOpPBxNMYhYfCjJf2sJBiWwJbmZFgt1xnioTiIwmooH?=
 =?us-ascii?Q?LmbIlhlZmbbjj80+rcVTABCXL8nIugIVkWjTnkZiN+Eltnzv/pu2eVkUeWPr?=
 =?us-ascii?Q?S8ZUabWAE04gEV2UJHYo5L1ymbErfNptxZ7/ymJXWB6iPEeOTEuWlJE+0+UT?=
 =?us-ascii?Q?x8wYwmnGz5GTyvQwMQHk2x3odQx3dRjRj8fLI4QC94sYLDVABLrha5ovivhP?=
 =?us-ascii?Q?MF8pq+tZHg8vJT0JYgSg/3VrRSFEKzbp8QSaSbEn5ltrxgKsdIIuSeVV32DO?=
 =?us-ascii?Q?9dDIKoFhIDDk734RjfCcyebCcekV/i84SIAcmU5uBqxJSG97gP8umA//lNqp?=
 =?us-ascii?Q?O7frZvb6+E36FwlJ6cxiiyKZPCl9+u0n6F61MGUup/ea3eTPq0Ld6stzYmww?=
 =?us-ascii?Q?yzlE0s0NsS+MC/FgdQtl0mQkO3F7k7KZ35OY7EjdOXkX79Lml88NNJvDXkO6?=
 =?us-ascii?Q?WKSGBz8lPx+iJrL145WJa8+O9zDVPBOCKtUUJiodmlo3S/vfSVPWaLJTLirY?=
 =?us-ascii?Q?7CqlPEF5rdn3ZLB4EYGeid1cpktZqwm0kCSGXdGe97+5VhqkAv0IthxsqXr3?=
 =?us-ascii?Q?fXqgROCtVZR9JO+gjodK2GhAfcIxVZ7urDv+HoavNZHWECdRQ5n3x18oaiYh?=
 =?us-ascii?Q?l6oIgoS4PJjl8ZWvYlNYMijlopuChD/ODHuwjBZApz2GiYKrm8lxHpL6KQHL?=
 =?us-ascii?Q?MI/PLk+IRJx4F7SRbULhrSk=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 763b9c93-8665-46e4-756b-08d9a807970a
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4021.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 07:14:40.3471 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VaLlmCAUch2xEqxN0+0gR/iNPx8b8ddi40/J9EYimdl2VtAOXfUU+tIIGENqJXRYvdeqMBWOO9kucliWQWDyGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS1PR0601MB3659
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

This change is to remove useless break after return.

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
index b200b9e722d9..8318ee8339f1 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
@@ -2092,22 +2092,18 @@ static int dce_v8_0_pick_dig_encoder(struct drm_encoder *encoder)
 			return 1;
 		else
 			return 0;
-		break;
 	case ENCODER_OBJECT_ID_INTERNAL_UNIPHY1:
 		if (dig->linkb)
 			return 3;
 		else
 			return 2;
-		break;
 	case ENCODER_OBJECT_ID_INTERNAL_UNIPHY2:
 		if (dig->linkb)
 			return 5;
 		else
 			return 4;
-		break;
 	case ENCODER_OBJECT_ID_INTERNAL_UNIPHY3:
 		return 6;
-		break;
 	default:
 		DRM_ERROR("invalid encoder_id: 0x%x\n", amdgpu_encoder->encoder_id);
 		return 0;
-- 
2.33.1


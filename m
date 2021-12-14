Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0366B474236
	for <lists+dri-devel@lfdr.de>; Tue, 14 Dec 2021 13:18:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F160110E415;
	Tue, 14 Dec 2021 12:18:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2127.outbound.protection.outlook.com [40.107.255.127])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F20310E11B;
 Tue, 14 Dec 2021 12:17:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LasE+oqznoT5jt+xcSp6JKoSjNSkXXGVwgLicD3mMbqMMxNwIesviJhIre9Bicqs1rNqugMycyLVHE7pdfDr6O0cnQXTV/PEaVwV6Y4BJIX/6MAQSRv8IlXC5biFP3jvve9tLnxlWP6aq1Q94WXi4VdFKsGTEKF/s1kFWiuDlSWDLnWJvTI//eNFSNF3sCYabmQYXtCCWI2WnOUXLl3UiaMNuWHUiUirvhxE6yH1ZtPxtcVhgC8RK2rh6vyr3PMWM9jLrbgB3FbOC4PAF8Hz8Tg0HBHZ0Bu11qsMAb1DOgfdqLbIUluKWJLTTTiBMtd9vft2gxxAZGiYpWQO7f+kMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xQyUAeNmR9V6bBSafpPoqLBv5GH1Jbb9nBqTuk4fTBo=;
 b=PD+8IVKiWKGNTqgpd1m0jaxnZhRuAUb2VXkRAe4aiA2Vps3q3MQx65UqltBNXb5MO9gH8bfDB6Qmmnj0R6Qc8on+p1ZimZQl6E3KW7tuJIExpYmpeh8my9sNOdFc6ZMHMpcUwtpUAMGfe8hmYI7Pz/Jv671ld2gR4og8WNU8x2wIQCYglJBKPQN2v/6ERb02nkZais/O+SHr5ylqTnpIB43C5vI3nT/G8EG7pylOKz5SU+IKI1KNC5bBO/siFQGhVFJplb/nONX6bnX0E4VuZpzqB845tYwYjg86DtzibFNZwz5UHNEIRsH30yJ2X9ia/ztYDAJEIGW7R9DvIVtH2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xQyUAeNmR9V6bBSafpPoqLBv5GH1Jbb9nBqTuk4fTBo=;
 b=gezmqE8WfOzj2YW21jKclbnsVhm1cihgoscbyBDjopA3ePem3PUWBOW8IRS75rDHvemrsY7+4itjSOYfS9PN1oPzRqhjOwEttAeUuWksbn7R49kbzqcR1YtK8pW8b2DTWuATx1GevPr72Piikg8SQ/v54enZZliqx9lhhAgi3Fo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com (2603:1096:100:37::17)
 by SL2PR06MB3003.apcprd06.prod.outlook.com (2603:1096:100:33::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.25; Tue, 14 Dec
 2021 12:17:58 +0000
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::a0cf:a0e2:ee48:a396]) by SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::a0cf:a0e2:ee48:a396%4]) with mapi id 15.20.4778.018; Tue, 14 Dec 2021
 12:17:58 +0000
From: Qing Wang <wangqing@vivo.com>
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm: nouveau: use vmemdup_user instead of kvmalloc and
 copy_from_user
Date: Tue, 14 Dec 2021 04:17:46 -0800
Message-Id: <1639484266-75733-1-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: HK2P15301CA0006.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::16) To SL2PR06MB3082.apcprd06.prod.outlook.com
 (2603:1096:100:37::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f9b4b4d-59a2-499d-6789-08d9befbc395
X-MS-TrafficTypeDiagnostic: SL2PR06MB3003:EE_
X-Microsoft-Antispam-PRVS: <SL2PR06MB30033EDA76B3B9AD5E68ABD9BD759@SL2PR06MB3003.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:269;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m66WH7EhxAF/XeezuvDQNpHBQrcnUH+d+fCqbcJFIPtq4CgBNBJ25RlBYwrrLSmoXiphevUlHjQ1fad1SQwKIzmCh1kcCs3kGOgkkDOyPFj3NzW6GApZcVj2UZYqbJBnNVR5ai+tgQeyuEgUOXWP8f7rymgpsxjK8z7TxHWykhcDrOxLAr9++/1hBFDYPMo+RuqOa9N4b4Tzsp4QLC/Q5SGtQvjls+5+G50pPe/p89RHlGi8eYALJf3yjU/PxG+uAB2tHauFrzQT2hAfp9O4/CAP+QeCXN22gCTI9DNFnNVaKr6vyqi5t71dfY/eBGRvX48OuuILkA3oUIPRuf97Qqygc4D+HaMoBDnyQEXaHoBRXqvjrzwPcY7EMsvBK7+1vQ0KOz+uWbXKw4edOaQUC9wDgNm1CDOR14E38RIhCoCZaon0uOnkMYzRRgm2wX6R1FmAEUSr2gvS04nS9pdd0iwuozuDoH3aT1MuJzEoYxyJpUESScVUZ2O9f4F3PxK23C79Qydthv0G96IWcpkJhj8si1Pryv1shFMQQX7m6ucT3UnvBUMlX6NFMd/LNpH4zX+oZjzhFCGAr4HZj7LRlkwzsBW7M43uciIf8yeeHdsf++FHcnDBQXu3w8+QXt2U1H9g5i19OnA0390hG/xnvPZvui1l1fBnK28VCRpWZhu7evkAa1taURZe8XvBn8urCobVQSd93nEs3yJ+Mv4LTw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SL2PR06MB3082.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38350700002)(38100700002)(186003)(6506007)(83380400001)(6666004)(66946007)(6486002)(2616005)(4744005)(66556008)(66476007)(316002)(110136005)(8676002)(86362001)(5660300002)(8936002)(508600001)(6512007)(4326008)(2906002)(36756003)(52116002)(26005)(107886003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GY6VsZGKZZ34F+t5jP922//uE1tKASzsBUX6mOEqO6QtJE0xosr7olPZNF8U?=
 =?us-ascii?Q?0YFYw2z4rVMymFtMiWiEQhE9P5yVAgbI0vIFS9G+wTV50iZjF7qIVatzjkt5?=
 =?us-ascii?Q?5tSDH6kZ+PkkRVveizU65FSZvs6C8OJNTOP0SHhU2UtpwHR1exfjAjZv3Iu/?=
 =?us-ascii?Q?X+y9wGmsQUbixiAv/VakNE7z3nUXTnqgHlkhlE7ZgEHLu69bJ7MzSiP3uMHg?=
 =?us-ascii?Q?J0aKG/VwVrOBWHaE791AMtbFi72kWK9DCWJd6eNm0J127WQDL4a6sw3whYCE?=
 =?us-ascii?Q?63wrSubW7kMMWs6t84dYfZ+r48ANRwkd3ISL3w2ltBPcqNs0O1c7IPQ+bLoG?=
 =?us-ascii?Q?SiE+BnEf253YZ70Eq0kWrGi9qByhB+TnRzMdkosbw3r4xXwlrfjI00ikM5QV?=
 =?us-ascii?Q?ZoMNO0fKAYOjmLli6viXVT9l5YUNMAHhKDXpIo+QAqiTYDL8bchihVo7vrat?=
 =?us-ascii?Q?N5zkJJjaPA0jaPChrdtmiZE+5Kbi4feR6QhqB0+Ta+NX4TPfXFxnoCprZWA5?=
 =?us-ascii?Q?NCSvBbIzi5CbXm9YhHhSopLaXyPqzA9WkvYfWllhxW06IxzXvDg9TdaOxra0?=
 =?us-ascii?Q?OyL60J3veHwjZVCeUfSWtCd5Q8F00fH9siAzWS98vjVeXEDyhlREirqYK0WC?=
 =?us-ascii?Q?8Tvsv1nC1WffE2+imc7qRVFBt3+XTvfG86CkgPhonGfaltRzbEsOtVjg6NMa?=
 =?us-ascii?Q?JfvhioJWifwKVWi46TnrbE7VWxf5NGm3yEGpyMm8u0xmvrpBlI7flk61tMjG?=
 =?us-ascii?Q?JdNtoCymMK1hSW+cox6anrbb16l7U8MOgyxDbByINdWTTenuRG5A7ic1+IGx?=
 =?us-ascii?Q?84dviUOyfixNjvivLR5RxgA1lf2zSY5+QdpCEv/W8DkOHpZwvsTA0YTpkqSV?=
 =?us-ascii?Q?lbmlQO0JUsqM7o+/5TsrdOSz4sZTHHkXtMBjZZRGAHozY0AyWyxIw5CtQwyu?=
 =?us-ascii?Q?4vn3HEyx70Ei4CwkQA7T8F9BX412isoFy4AUNJClZg8t+HQ8YjG+HiqFs9rC?=
 =?us-ascii?Q?DaXKbNRH6kxeBr1IWBfET12+kbAMSf+E/mPEtJ5whaXlHVK1uIi6AVEXQ0c3?=
 =?us-ascii?Q?IYWQjfY6uzft6ZL1m/PUiSEQatys2qzwWGzqmUwUZrBswX3+SZVBqokjPQM/?=
 =?us-ascii?Q?Wiyvf7ShHQ0qo/GB0aa+rTfvzGDO/NiivzvAp73/GxQdjlRcZMmiN9/Y2ZLU?=
 =?us-ascii?Q?oKNhw0LqZcTmO0UKwUbW3K4d27gNsOqbaN2WUcOQdfaNA4fqzWV97QHfOWZK?=
 =?us-ascii?Q?VqiK0feFXw92v3cL33qWPvqqV5/A1i7GZ3KUz9y+PdMb777xwmu27zoUVeEE?=
 =?us-ascii?Q?qnJmx7IiRuDtP5pu3Vphg1GmC6PJ8qPIJFsj74nNTVUi8P3n9zuBoyjuO0/r?=
 =?us-ascii?Q?4bb2eRWtQ0VVsFOsXLU7fw8cEh12NQxOChWUAh1Qmsv4lHXQRSz3Ut8VJ+1V?=
 =?us-ascii?Q?EaOORwYV8Fe/wzVs9TRf3RcNCgNzqwW0uDu5Z4/cZbFc1XCbrWsVbDMqcsLq?=
 =?us-ascii?Q?rxO+cTkaJ6MLM/c8Ad51y1gyNEdvEm00miM2Tkqm8CjL3H9aZEQHEg/x8cQQ?=
 =?us-ascii?Q?vpgCCrmsYOdeiR7LKZRkACHM1my3kGxsNrycCZfVIpcv9XH8C+jZWtXCikAp?=
 =?us-ascii?Q?AkxKt4UFo4aRexpjLFn/bYo=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f9b4b4d-59a2-499d-6789-08d9befbc395
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3082.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2021 12:17:57.9071 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HGwfuOayKouWhKTz2TNRIIAiY7DmzAz8MqumcI/vxfajQkPQlmz+LRg1BXP6gv+mpSEt0fzPk8rxEvCoTJ8b1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2PR06MB3003
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
Cc: Wang Qing <wangqing@vivo.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Wang Qing <wangqing@vivo.com>

fix memdup_user.cocci warning:
nouveau_gem.c:630:7-15: WARNING opportunity for vmemdup_user

Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 drivers/gpu/drm/nouveau/nouveau_gem.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index 9416bee..befb864
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -627,16 +627,7 @@ u_memcpya(uint64_t user, unsigned nmemb, unsigned size)
 
 	size *= nmemb;
 
-	mem = kvmalloc(size, GFP_KERNEL);
-	if (!mem)
-		return ERR_PTR(-ENOMEM);
-
-	if (copy_from_user(mem, userptr, size)) {
-		u_free(mem);
-		return ERR_PTR(-EFAULT);
-	}
-
-	return mem;
+	return vmemdup_user(userptr, size);
 }
 
 static int
-- 
2.7.4


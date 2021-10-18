Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9AF74311B9
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 10:00:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1523F6E986;
	Mon, 18 Oct 2021 08:00:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310097.outbound.protection.outlook.com [40.107.131.97])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0E7B6E987;
 Mon, 18 Oct 2021 08:00:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b3uJ3PuUClO83/6R3hAwzd8kzs7Gc9rriwtE37reAy2EESUzQYOmc/oAicVIAPfnVhv3FevVct+NJoq7OkvxIAowNz2GhKiC8Ijc9YQ8rnhOLKb2tQS2JJcAIPbq5cuYD6aHFrUbwJt9ymcaOc1MDxKj9HNBlMhZrN/vwDSWyYP/hQw0IhPvN8dxGq8cJSB9eaG63pT06mOjmV8STGDqFz8qoKy/9Fv2CH6efPQ9tIuQxHarut4PN/ujtYFQhyx6MSnwTEke9U6C6KUrWnByUy8WqpTUiRlFU+JYs3xhxVAlYT/R9VmGcfrXk4yzAeVMPKMRX0l8p384R4Le7DL6yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F2EkW+63JYeyx3zevyvE6aX4tfO69Qqdd+W7kjP6JYY=;
 b=Fyxuuoqyq4FYer5DuTi69sV9TsDOHdNxQt9QyPO7+PL03cBgA1aVvZqV5BcmldHd6xlxF3MZ6AEI+m1Jjg48riGOwm/rEZx5CzmODwPP2ZTD3dFZmoW41SHOCbBqn0U0k6lHhyLm1ieYzW4JKDByMbICaFDzWtdkGkMo4+WEQ9zA3kacWsxkSZwlyXdFUVDaFJ6fkyFxR0EPc6d4yywmu2CXsDGLbCTcUELEGV+t0cpuPKCwfDyICwh6fW1LiVRYobPD2lryXysLmYgftEsLIG4/oWzwJreRrgJqJaiuG/MTggc0VyAkAd/OIi420cBxFaR3tETrGALxZvkNzGhJWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F2EkW+63JYeyx3zevyvE6aX4tfO69Qqdd+W7kjP6JYY=;
 b=U2wDU0HspjLIR/CBJ0IWhVBCmiZuswItnODddJpdULPjDp2PaeDe5K3GQ5658sIMUPhLgPELa12gceQ7Kaw2SSY04UEVa1PVYsmM95CHbysojhxFDzXZO8+YyZ288Jj+6tA0P/rOL2bQJk/8avFd72q+ykifAhiwdZyzvQ7iVos=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=vivo.com;
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com (2603:1096:100:37::17)
 by SL2PR06MB3387.apcprd06.prod.outlook.com (2603:1096:100:3d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.14; Mon, 18 Oct
 2021 08:00:13 +0000
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::4c9b:b71f:fb67:6414]) by SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::4c9b:b71f:fb67:6414%6]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 08:00:13 +0000
From: Qing Wang <wangqing@vivo.com>
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Qing Wang <wangqing@vivo.com>
Subject: [PATCH] gpu: drm: nouveau: switch over to vmemdup_user()
Date: Mon, 18 Oct 2021 01:00:03 -0700
Message-Id: <1634544003-36775-1-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: HK0PR03CA0098.apcprd03.prod.outlook.com
 (2603:1096:203:b0::14) To SL2PR06MB3082.apcprd06.prod.outlook.com
 (2603:1096:100:37::17)
MIME-Version: 1.0
Received: from ubuntu.localdomain (218.213.202.189) by
 HK0PR03CA0098.apcprd03.prod.outlook.com (2603:1096:203:b0::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.4608.17 via Frontend Transport; Mon, 18 Oct 2021 08:00:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d81d5a4-9cd8-4aac-259c-08d9920d5038
X-MS-TrafficTypeDiagnostic: SL2PR06MB3387:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SL2PR06MB3387B65C6FF33E66815B9862BDBC9@SL2PR06MB3387.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jUcR6QomI6Il2pQ7/xkZEiKy8HsTpDSnhqWzCT0KzjrytVzbn2VuIUdpzEbfOGb7YC3+UC4NA3Fb8iZBwIsdEm8lseJTMKpgEwZ+FaDfsbhDuzjjRzdt1hGVaiXaCNHFlyFCGa4uDQUhmaUaszmO7b/MxFPKVhqC/enJ+YLulJ2UklU4cKoVRz1/pBFK1llwZorTeDxTzRQee9luE9/byPMWG1CfdJJo9Numr741SjK6Ture88rQcp8+yT2Del2guLqNb5/n/Fb2nZVnoYAMtr9LFMlV60eVbXsa/w/xKsHuLPOEdPiaQZGY4oFHJkML2WRaCnbeU3qHS9oGpe95nHjTbiOjxXv1VgQ5nlNPxk0wSh6OLEkJ01sYlwSZpaNYPL0/LAeAyKK6Xp7lfJdNd0lxp+mASsfDGqmKacpfbxTU7US/jkUFgneQqxaArsK7DwH1dphW18MvyQjTtp8fn2zoEqH2aI1TTr5VC9TyBU7z7qKFZIHEEucikePT3cH7/jVlPjq1YfOwiGjK7UrozLWir99awQLb/yNVryNr+xIpLDJG8BklouzY+CXnvhfGSHEAmjJR3RV2dx12Mn7J9s335aK3k64JVZC85JuFjmjiBW4ie5mL10NroCxhSCWaCRxbBE0Mn6fHAmWN2O5tGT5aJ088+mYLglSvtKGrhNZZemFX+TW9y0TIkAHQ9GTEwoBbntdY+ZODHsNF10osPw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SL2PR06MB3082.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(508600001)(6512007)(6506007)(26005)(6486002)(86362001)(8936002)(66556008)(66476007)(66946007)(107886003)(2616005)(956004)(6666004)(316002)(5660300002)(110136005)(2906002)(4744005)(36756003)(83380400001)(52116002)(38100700002)(4326008)(38350700002)(8676002)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UpVlTf9UpGypa9ug3Is+plfiN6tC9dmyGtgg9T++yQSQ9+EUFFgtPBIIZ3aI?=
 =?us-ascii?Q?0HshldXvpl2sZ4NM/jn6czuaxtFQCqB7vF5HYQVEFe3s8AakgbLsQUfYhIEk?=
 =?us-ascii?Q?kazUCuK8XBkrnMGMGNa7f8GmjLWPYUgQdZTotn605BKB09TRZ+uEXpCikVoX?=
 =?us-ascii?Q?AYyERLdmRruxILyvCPBYMC50i6vzWnfYUntI6digrF0AYUK8awZ0HTkMHcym?=
 =?us-ascii?Q?3oRkG2eqvA25+umBOVRozboqw5YqH+Aa9lvqEpzsfqWzc61/HjI7HnRuyH1Q?=
 =?us-ascii?Q?fOCe2HYj7snyEoJzdRsxUbS3k0q7OVV1DtiGBloDkygI+vkXWC0zx+RN9hMH?=
 =?us-ascii?Q?kgbyaFtXnZhp0F5IAE6nCZcpXGbqkB26pKtwUyQcKddPmXYDlPEMP6BTwzPS?=
 =?us-ascii?Q?P76TSfYlqTTrCYd5tXVs/kMwobTXNMAlEi6cWfU3/5Fxmbz3m9r+uwIbz/I6?=
 =?us-ascii?Q?20BUU/0NZq0l9KuFj1C/l6ogdNuW8kskeUfZUCO8pFy6lsBLY7fVg5n/HS2s?=
 =?us-ascii?Q?BefACw4k9H+kx5isz9R9HWGuAtSJAmOhHu4m+/99J9oW9tS3HxXoAwlRLya0?=
 =?us-ascii?Q?d5+N4c5dOkCiCxltVfh96cfXmhXKQ5Tavutej0sBIKepOpv+ZKq1tezq8AFH?=
 =?us-ascii?Q?GW3Qs0tYet2obYiDFkVi3Pz0itZgDaghkQ2W70XUpWWcsoaFjqaudxR9XQ85?=
 =?us-ascii?Q?PwRLlMY7YFTdbgvd3YWgmM/8pJu66DbakfSVKNfq78XSevzt/hQOl7zdAsZD?=
 =?us-ascii?Q?4M+hSuz987lvu4iT6Gauos/zz2oYoI461RM1Qd2K/64qJGFfUb/81JMpqNe6?=
 =?us-ascii?Q?ZGY74aRsJE+LXxuzHjDGtPixo6O9G3VT6o0Zm8mEKzXs8E9f+lo9MpPYCfQk?=
 =?us-ascii?Q?sSDYoSKJDRcYzh9Zejvq1SI/WMv+R6hXhSkWEayiP5s86RoQnlqyRXlSwmSw?=
 =?us-ascii?Q?kT8Z9K1j2BiNNZKxS1U8tLm661Go7yD3r+CPFibA/a4LiP6gbrzUzIAVM7C2?=
 =?us-ascii?Q?XAsotGNrHjjnus3wbP05rrxw4QQ4WxwYJ/MtqouQ9hQnrOLurGyIoRjRXhCD?=
 =?us-ascii?Q?ikRGTOXIj/8Q8nyGyHF2Vx6WxCRJQzrlASLc1kOdkxLikS5H3s953iRFASAf?=
 =?us-ascii?Q?Rsr9pjkiBfack95ZLqEEic0wlegCUqJuTUJ4Uko9x2FZGki/6FnN52bgteyx?=
 =?us-ascii?Q?/X0Z5/5EQ4/uquAxs5z6I+DW2v5aVRiFb1HeQZHI/o4pHqNVBRT8CYZQBzuJ?=
 =?us-ascii?Q?mt0MriNWLwjj4rxl814aD+BGdzZ/kglPgdZ4bkxooM8zu1SafZ4x+FRBhnWD?=
 =?us-ascii?Q?xkyP1/dr6MVKQTcjBeU+mGFA?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d81d5a4-9cd8-4aac-259c-08d9920d5038
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3082.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 08:00:12.9671 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RvTP0ZHPTYq95moqmL5kxLa26v6C9gC7CW3/sNhVHQfVfTvl8n26daHjHrzBqVd+pzMyHC/UI+PoDnq1CO0rqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2PR06MB3387
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

This patch fixes the following Coccinelle warning:

drivers/gpu/drm/nouveau/nouveau_gem.c:630: WARNING opportunity for vmemdup_user

Use vmemdup_user rather than duplicating its implementation
This is a little bit restricted to reduce false positives

Signed-off-by: Qing Wang <wangqing@vivo.com>
---
 drivers/gpu/drm/nouveau/nouveau_gem.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index 8c2ecc2..3fc6959
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -627,14 +627,9 @@ u_memcpya(uint64_t user, unsigned nmemb, unsigned size)
 
 	size *= nmemb;
 
-	mem = kvmalloc(size, GFP_KERNEL);
-	if (!mem)
-		return ERR_PTR(-ENOMEM);
-
-	if (copy_from_user(mem, userptr, size)) {
-		u_free(mem);
-		return ERR_PTR(-EFAULT);
-	}
+	mem = vmemdup_user(userptr, size);
+	if (IS_ERR(mem))
+		return ERR_PTR(PTR_ERR(mem));
 
 	return mem;
 }
-- 
2.7.4


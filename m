Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6621B47DDB3
	for <lists+dri-devel@lfdr.de>; Thu, 23 Dec 2021 03:24:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2303010E256;
	Thu, 23 Dec 2021 02:24:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300108.outbound.protection.outlook.com [40.107.130.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 827C510E256;
 Thu, 23 Dec 2021 02:24:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IE77Gj5vT41PrEFnli1t6GkKd5gdExbxKtoC6n+cnuQTkD5O2mk8B2llSGCjIhQklyMt2jHnMQvbUyTU6/isQRZJcAnvUm8RySsoal694Jv9pgxd0jIZhsoj5gSVj1xwbkyfuvAVRwcED+4yN42IFRkoiVOdgWpEdb11xHFMxoo/bxzPNJ4qocDUf4umEBxlSUQiTdtUZyJ9KR51LBpMy0c3RjQ89ORyn2YwOUbwGT1Ew/c1V0x+RKgwrtoOS6QqY0+mGmFDo0sBIfUq/RTnt1QEqA2UHTZgXLTw8VTh8dH/UWBr/nEZ8hLlR9LygKkCKXmkqk1JflmIyEcBuNDxbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QJ7h6+8kAUk2S8BR5jqjnp/2xQ336H/XiVV9DZAeNS0=;
 b=WslS7lcH2ZnTvTe3Fzi6dzocCwKRToM19WsYejgRTkaBx6Sn9tQPUOzIDs/NtpU4RmP9Ak8K9cFRs6ppsEFFcWtNKLnwQZHHueoijFqzJF8h5lMHzvFfRucsX5irTU3XOKUrPxJsj9u0MQ8YctA0/LcMoK2P8ybk+t9QU3a7rCvQOJ6+omdoNdGo8ulSUuqCJ7mHL7aJl1uz2tT3sh3jCtCPYwYr/i5MLgMxmxLX4ER9mm98Asx59KXfcL26fL0TiqS+0kS0P5hAuavSssLnR0TL2HGdGOIVCHWq3A+azUAIkRhvvfReATvKiotsmcF6sTu0fFAoZ4MK3zFkWfDK9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QJ7h6+8kAUk2S8BR5jqjnp/2xQ336H/XiVV9DZAeNS0=;
 b=V70t8/3HTISfs/YGA/dIUwPd9kA2GMub0bWBofoDVA66/4dABZyfSC/nMkAsSwZliZ/2Lb/ce/c99U+mPMopm4LFVXbrXAcOYbsdDnUGfo2hSKjgkkZj2e9P9V8wb0XmlQFY6r7tV+WLGmTl8uMuFcl9oqoZWjo3UWLdiWc01gA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com (2603:1096:100:37::17)
 by SL2PR06MB3388.apcprd06.prod.outlook.com (2603:1096:100:3c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19; Thu, 23 Dec
 2021 02:24:31 +0000
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::4d34:9df8:fabe:fdb2]) by SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::4d34:9df8:fabe:fdb2%6]) with mapi id 15.20.4823.019; Thu, 23 Dec 2021
 02:24:30 +0000
From: Qing Wang <wangqing@vivo.com>
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH V2] drm: nouveau: lsfw: cleanup coccinelle warning
Date: Wed, 22 Dec 2021 18:24:22 -0800
Message-Id: <1640226263-32739-1-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: HK2PR06CA0019.apcprd06.prod.outlook.com
 (2603:1096:202:2e::31) To SL2PR06MB3082.apcprd06.prod.outlook.com
 (2603:1096:100:37::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 867e5b19-6d35-48de-225c-08d9c5bb59d9
X-MS-TrafficTypeDiagnostic: SL2PR06MB3388:EE_
X-Microsoft-Antispam-PRVS: <SL2PR06MB3388CFF609567AA6CA969150BD7E9@SL2PR06MB3388.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:935;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5W2S96thZl5uo4tDrmc9jvoa4xICXIt3Q/9fztnxlT5NYk3tmMjbH+MjKDYklIXY5Xtg4MdX8MsvbmNcK6NJ54dNpB+L8iKg+iirjuxne+9tS1Nk2xgu8iCfGDTehQ0j+lGpf1WGpXpBzDAWhvq2vOdElOZ3vqOQKb08D5e8YvKn43sCB5oaZ0l+NTEFS2TS28aFYfEirWg4zFpyrEtkdumrIdvmLh7JmtO9Pwj0xUDXaK05zvsJBHeAhpBLE4WA/7jpV3ImNy7zjBgnfb96eOLjztkNjxdsWlLh9+eKlaqg7coA8Pd3ww2NcuklzFELmKhefBUhG1TBtGBdb8+/BzftKKLTZrF4Dsuj2soZgMDlWCPZztlQUMFv3uIGdPdVe3Z9Q45JxGktoUHVquFLZtfpD8POShQ0lwXy6t5O1u7eIhM2/UpcrmRp9wSSydeGNrSZcV8o2HS5sduQ7dA9Jc291EEHAgsaD9y+rEJ5Ycnk/EjahKG11KnjTSoTnMF68b9ofn0jrvI8F3vgzVKdC5PcHxCc3dZgN0A9WObFGIlWW9Oxb2/YSfztByh88jm7VMWwmm7O6fZyrw0Cc1n/OGcA9GIwyh0QWmy/I13xlBiV6MpgExxVwKtmKy7qqrTwU7xZ6eLsaOA1Pf63mSh7Y2kkyBD7687+gfFqR1DaASw3jGWcVeaG0bMVMfQWIlMniuQ18w0WadAMV7CpcbL3sg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SL2PR06MB3082.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66556008)(8676002)(4326008)(36756003)(52116002)(6512007)(26005)(2616005)(66946007)(66476007)(6666004)(8936002)(508600001)(6506007)(86362001)(83380400001)(107886003)(110136005)(2906002)(38100700002)(38350700002)(5660300002)(316002)(186003)(6486002)(4744005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tFwlHNS8Ilsg9W1ZUHapf5MPswoPl1gZNVlhu6jg9ig96I4/kRt9sVHtgulL?=
 =?us-ascii?Q?xVhvx4nmwxoCrP3Irxs+VFE2Mq2E7vDuwwaQ+F5Vv8RudSJN6wV3gg1z+qyy?=
 =?us-ascii?Q?BNiqHN7RnXj5ygs0kRGblfqFjD/U2X+VDmj6mNtk+Sfq1l3v7IppGMUoFQd9?=
 =?us-ascii?Q?I3PUGwRyFkC+wvefnRPna77+W7MJ/NjGZOWJOGidNmVYhxETsTVekg4sahhE?=
 =?us-ascii?Q?n5fKaR6+ySstzR2/aNORAv4hB6/+KzlMUBr4tMLJEFIUyAARpP4MgBnGbWDL?=
 =?us-ascii?Q?cnH2gyEwqENY+0L235CcjospcGI4RiPTvJ4Yp7fGqC57eCtXOgDs0pishZuw?=
 =?us-ascii?Q?qaQKfMP1eEYFnjFN7VZBdT3IGhd9GoZTtnji2yXoyT7OHKUhWakEwO2PpHjJ?=
 =?us-ascii?Q?+VSfFh+2afT77TVW2r0lv1e99u3AjaEJtsgGA9G+t22ezsSMirNXP8B0u1VL?=
 =?us-ascii?Q?ChGN2XUK/bwi3CVLv27N4e8kf5qGUJJFiHr8egjjpmhyUPUvi1b75X6O3u2W?=
 =?us-ascii?Q?bVstgeDV/latTmCnmJfrkVBm5AMnB9yckC5e2rchsevpTRVUUwvyCqILvmP1?=
 =?us-ascii?Q?9WiaSny/D2HADtbp47Wc3DgRbLaQMBnNK7NCMqSS5SEVCqJoSRChiveUEJDi?=
 =?us-ascii?Q?+KEOFBl72Fzshnh6EMjRC+T8zR6KjUp7Jd1s5WMnZaFN7dyEJdddofFOmfgj?=
 =?us-ascii?Q?8rg++ygDyVPxDeloQuJ3IWSRxNPEZbVrJg9YpUJHg70usQSCNfOWI7H3ORMk?=
 =?us-ascii?Q?ffPHnW4BhLVgx6VhGaKx2dBZ2u9bcE1tpUkoKU/x1fNOdGg9dgh/hgYDbQhw?=
 =?us-ascii?Q?EFtfDN1W09gOMBjYHK4vlDWzR+83rllYkI5SVS7NxrweGiprE5ilGRKN1HR/?=
 =?us-ascii?Q?tnOlHFgGxTedcrUhRDmxdt60u+/7iIXhZEJeRUjsFDaMoEia5ToZfCnL28yD?=
 =?us-ascii?Q?qt0xrC4YQBgFU8713jM+u4K9dhp3WqlVZS9ceN+ZDTxp2K5c3tRgG88AB4Nd?=
 =?us-ascii?Q?6OJWzSfeva/LKEOPaUN8g1JirHdEqMOVYcZGl5ztZtZaPk270J6DoaxQcSCW?=
 =?us-ascii?Q?dOyBh8x8+Vdf1Ozq6H/eIRVy1QpaMfnIPawhnsLn8ns7ze99dJGSk050hZEB?=
 =?us-ascii?Q?rZyfUu5PfGh86y/l0OsriXkq2qCElYWy5PJLuM4C7Mk9byL32zhdrERjEVoA?=
 =?us-ascii?Q?4PiHQUHJU+0hORUZs/NL5k5sBTeGgWGy0beUf3aJ6nrZLBXiXwlLREu0QML2?=
 =?us-ascii?Q?++wSROrkKGdI90nsOMgYQbYC9kezUxVdtBukZExOGPf4N32hdtNfk5FG3e+C?=
 =?us-ascii?Q?j8Z4r+OhnCU4mzbOasAJ4H0PJw569qk+zmDNLH7WVH0Tak2D09Lm9BEy9kS/?=
 =?us-ascii?Q?NAG+e/VRzZbjKwX1zWiF9C3zjasc0WH9GeJmRIPTHkRhcizAOqitcUEN4IgR?=
 =?us-ascii?Q?/R6ObkxdbD56dT7wMbM1PWuOg+gbA6UTJVpiRcE7UuK0b0GboFing1egnu0G?=
 =?us-ascii?Q?x4DaWVMynVFxCibOIQcy48CYqjen6ILHzFgb27fREOVAEc50tyF6IHFydvOQ?=
 =?us-ascii?Q?EOQ86VN/uxpnVzjnY9Rpf7BkqiPzo+hjkJi2BqWV+ivoINvpjvYE3hBd997Q?=
 =?us-ascii?Q?G0C7bj3VzLmEZWc72nGbfTA=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 867e5b19-6d35-48de-225c-08d9c5bb59d9
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3082.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 02:24:30.8781 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HAdvmmxpN8B/hgZbcX/U1q0HqZZdvfFi/fWP0PZlW1aVhthu5lnjYuhalfyzc0pOMZEusewg2ODyZzDExyMkmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2PR06MB3388
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

odd_ptr_err.cocci has complained about this warning for a long time:
lsfw.c:194:5-11: inconsistent IS_ERR and PTR_ERR on line 195.

Although there is no actual impact, it can improve scanning efficiency.

Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c
index 9b1cf67..0f70d14
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c
@@ -191,7 +191,8 @@ nvkm_acr_lsfw_load_bl_inst_data_sig(struct nvkm_subdev *subdev,
 	u32 *bldata;
 	int ret;
 
-	if (IS_ERR((lsfw = nvkm_acr_lsfw_add(func, acr, falcon, id))))
+	lsfw = nvkm_acr_lsfw_add(func, acr, falcon, id);
+	if (IS_ERR(lsfw))
 		return PTR_ERR(lsfw);
 
 	ret = nvkm_firmware_load_name(subdev, path, "bl", ver, &bl);
-- 
2.7.4


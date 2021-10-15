Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F5042E945
	for <lists+dri-devel@lfdr.de>; Fri, 15 Oct 2021 08:48:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFA5C6ECE0;
	Fri, 15 Oct 2021 06:48:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300105.outbound.protection.outlook.com [40.107.130.105])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A7CF6ECDC;
 Fri, 15 Oct 2021 06:48:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ApZ1pnZgSG/rEEiD7e2WuSIFnQ5dMAF6Qc419Hfl0cFzr8pLMyFvzj2mqemqnJK1RVCh+lKvjsve/rpHq5h13laXGmKGmOI2ehItc3U7tWSDqip2cOBAu4GAt+lYlc1iKwbg70WdX/y5No9AMrpBSR+JESNc5XSCaPYSgMVu8Ehf1T5W9hltiB6ANY7pWqrDYBqISq7EkVzjonpw/YsZEUFtEaOvYr8sIiEX0E7xoIMSn+knIhJyXU4CuSn8pwoUN67b+c/UdJEx7B0NTrTUJUkaUKO7q0V+nPPgdFym3cgbzR0Lc0FLYinSC8RPbYSwlokGYRJF9XTbE5MzRLhGQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oy2W58NY8usioKtcniUFaGwtpEo6B4NFwxdMg0/8/qU=;
 b=Xf4wcLwZ+Xcy0TZAaNbgDZsMMMBwNeRvQGP1z6Aqm809bUK6mWdlVrSlFDy3H/1Z7gNdLf+ACw49K1Lmx6dIwNzQqNoVXsuUDVwyq+HGL/MtxOf4Isd8ZpRPoDiWMcSUmVqyzeOVyIY3NKXw/g2i9KyszVKAvR+Rk1zo/EOV2jsJ4JXsIhSI7bUkU2k/ZnW2lWSJmsmOAKsG/8rvH3NnF6fRp4JUjPbu3/3GonXrsKl/+iXbgzMLeEtwRe8NFEm+GyzuT1e18Rc4S+iilab2jue0QSVwa1kvcjJc43C/MOvsPJcaHhPkIQUVmmByfXl/Wdrjrb4yH+zEiEEX7UEp1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oy2W58NY8usioKtcniUFaGwtpEo6B4NFwxdMg0/8/qU=;
 b=NgOb5jU7Hlxt4HvgF060Brk9D/vNIPLb7bsScI8aoPV5sBsiMxEAEPBIbJzcoE9IArZU/6AoKzaliBZnqnzTbLFvW4iENi/HcAQx7NTxps0f2O+d60D88RnqbivkkcH7SkB4edm8arPPqEb6lIcmhjl2hHQ5LGsc8H+lb4Ttt24=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=vivo.com;
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com (2603:1096:100:37::17)
 by SL2PR06MB3388.apcprd06.prod.outlook.com (2603:1096:100:3c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Fri, 15 Oct
 2021 06:47:57 +0000
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::4c9b:b71f:fb67:6414]) by SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::4c9b:b71f:fb67:6414%6]) with mapi id 15.20.4608.017; Fri, 15 Oct 2021
 06:47:57 +0000
From: Qing Wang <wangqing@vivo.com>
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Qing Wang <wangqing@vivo.com>
Subject: [PATCH] drm: nouveau: replace snprintf in show functions with
 sysfs_emit
Date: Thu, 14 Oct 2021 23:47:49 -0700
Message-Id: <1634280469-4342-1-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0177.apcprd02.prod.outlook.com
 (2603:1096:201:21::13) To SL2PR06MB3082.apcprd06.prod.outlook.com
 (2603:1096:100:37::17)
MIME-Version: 1.0
Received: from ubuntu.localdomain (218.213.202.189) by
 HK2PR02CA0177.apcprd02.prod.outlook.com (2603:1096:201:21::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.4608.15 via Frontend Transport; Fri, 15 Oct 2021 06:47:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 697421b4-b800-4d7d-9761-08d98fa7b8f8
X-MS-TrafficTypeDiagnostic: SL2PR06MB3388:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SL2PR06MB3388A80238A82C9B03E8B782BDB99@SL2PR06MB3388.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YZ4y6vgmXIse++J+BQNX3VjntejBu6/oPxSB6N17dm+RzSPRvrW2HV7Z+p+5WW5y45uM/gr25Kh1zfNsxHsmw7Q3qOxjIOIj73NE9hNh+vZb3w1vwQKi0Wu5G/bL0AASrX1l6Na6RsR27GhIKJs25IPMwtB1DcDCKlXTAwRtDsaN4vPp0mOli7Qy8VvKvEQdnA/49uWU2ZuaSL7UyeNXc42oclZNBSjhKCqlpAwBHilJ4cNzSu7nGdXMmUfMwZQEGPkKJsxejzh0uRtQ8PQdKtUBTKVF8T8DpYFcUXpeQ2FqlXFLBEeoHvIH2GwXnChZqbIEtSJCwZVISKBc8KSITbhzv41bmoA57AvvEx5/bEXRtKCWCgtt0iN0hd2eIyxD2pFfpDYQ38CfILgEd5xmjBobZP5YTgZGcaSMDOFjfZdJ2hwTT3GZFdHX/ivsH0m/LdqQkDpcVFRyiJWcjM4tipiV/FDBZXhQdtnjpE6fL3DqG8UVT2XzzZOXFg46BuKD7iVMh8avk/alJkhP7HrX/m3XnNdUYIAxuxcc5y7yaXhad9XUKiGHu3EAcjWCXjTCCQLEsV5vmPJ6ad3tBr8RI0Ij+9hTtoHJANRrVj4Lo48GgPotfw9EjJT0IcQHKY6FZDU971vK8jwsf7W5SF4QoNVtbXIwJ1tVhxE7h0ZjeywBB5Hubn0AoQnQshnA0aAJjmf5ClXqLOqOPlRUS/xJpw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SL2PR06MB3082.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38350700002)(38100700002)(2616005)(316002)(2906002)(26005)(107886003)(8676002)(66556008)(83380400001)(186003)(66946007)(6486002)(956004)(508600001)(36756003)(4326008)(66476007)(6666004)(6506007)(8936002)(110136005)(5660300002)(86362001)(6512007)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SCH81e1wi8kEUwtBhGDYPSDYWJvXF7wI72ji7R4c63vAIALi9aZ6DXrAl6el?=
 =?us-ascii?Q?WfXDSsjbUlejBEnJIe/DzhPfx9MQ8wfJnlm5Jcvt+ciePM5ZmKpoUbYytyuN?=
 =?us-ascii?Q?MOOEAq4HS57D+Sv9bR9JkbfKRp1dRfZAqwXzZdf0x3Ytwa99doYLyCzHfHoW?=
 =?us-ascii?Q?BNL5wQINk0WFviTIyH28wLKUwYxYYJQBb2GqN4CZd8/M//1hL3TzTE1nbQdN?=
 =?us-ascii?Q?OdLk9niuJtWXSzFE5eSfTpgYaCbLIFpdt9ntHLZlDSz9Z9U4zZKxMbelgqqL?=
 =?us-ascii?Q?QpdKao7vygAG1U87+qxpB2GPOfhqeOY7m4pWVY/SDUSL3OPk8sxpC/1S9X+n?=
 =?us-ascii?Q?pJsTFCdiCoTqwZAumPdL8cg1VQ5J20gv1MjjLII82v3+TQBoB8BrxhTXojG4?=
 =?us-ascii?Q?Ywl7PvU/n6o+UtTIJTeqixpRE6ti6KS/T/uRfyo0VUfRI9ifYgaTxQ0WoBvV?=
 =?us-ascii?Q?aMAf5rgJEfj5yvlYWhpeb3fjZCjLqjIAVzCcjVBv7DbJTxN69gAS4vlarv6y?=
 =?us-ascii?Q?5x4IViOVfKEy6tf5UIxJuhKc90Aw6CtFA/KS0FVfMrsOx7w9GpfbRHx27m7/?=
 =?us-ascii?Q?MN/t6aOpspYWXlxOpC8ynevRtja3z84aOpZAac/KsPOKvsUjgAwoxdVv7U17?=
 =?us-ascii?Q?sF+iCICQoCwBDmAOPaym/qfFZ0Ocvx4xZ1Kzgv0Gf0xtNdGfgOrM2N57TKGh?=
 =?us-ascii?Q?0hwbjwsnk7s/2BUHBuUwUosdrn5Hmsokj0ihhMSISXcd+3Qc69x9UerJmnBG?=
 =?us-ascii?Q?G0tEUbQOH4IkmGrL5q7hlG6NZb1S+Shnu/R+dsxsXSP68AYVIS13FHkMU2Q0?=
 =?us-ascii?Q?ntAVCTLsLv4RHNVqDFDj3ymFHHr9m/0pQNjZklT8I4eKCnhkR40I87pCK49E?=
 =?us-ascii?Q?uckBlLCh+8kdxg2X8zT7jQiaAhAWYsLtin6zDXwcKO9bV4rtg8+MaiFwNfzh?=
 =?us-ascii?Q?p4CpG2ovKsFindIN6k1/BJLrj2ZyEA07gdzfm2TYZqWtBo2n/cYZyzlW4kKa?=
 =?us-ascii?Q?2sFzPMvGOCIG4pymfb9YqyxCs+GzjrPwq3H54DRJiGd33erNHh/qnp2Mz0Y8?=
 =?us-ascii?Q?26isFkuNHEx2/AMKkDWGy+OkadjGlDIHFgEanWnkIEIiSu/rDmoFnXSiKXIe?=
 =?us-ascii?Q?FJxHZow4o7G+06ab2Mh84He4XuVBq62taa/W+pFMZsdxJnYROLKoErNATOL6?=
 =?us-ascii?Q?aJLlu9JEA/R/JYN2xRVQ6Qzv08XtUoO6FQEa9MNKvN+fl7vVkeZH7IpsHJrj?=
 =?us-ascii?Q?2JUSn1RNJ5F0WsL6PEy1IlrVxBe8QTINIc73R2mrnKXP70fiKFBSRHNHxnX/?=
 =?us-ascii?Q?D5nrcqfTwDGKciS2XL/1H3yi?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 697421b4-b800-4d7d-9761-08d98fa7b8f8
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3082.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 06:47:57.6115 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TvnPBBJ5SeDBCWwVdXdIyavwd3Gbass1wNCLBHLjs913QsoIp0l3stSlm1xtwZMM9YDKMSmz06oxrWJ3ob9aFA==
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

show() must not use snprintf() when formatting the value to be
returned to user space.

Fix the following coccicheck warning:
drivers/gpu/drm/nouveau/nouveau_hwmon.c:43:8-16: WARNING: use scnprintf or sprintf.
drivers/gpu/drm/nouveau/nouveau_hwmon.c:57:8-16: WARNING: use scnprintf or sprintf.
drivers/gpu/drm/nouveau/nouveau_hwmon.c:90:8-16: WARNING: use scnprintf or sprintf.

Use sysfs_emit instead of scnprintf or sprintf makes more sense.

Signed-off-by: Qing Wang <wangqing@vivo.com>
---
 drivers/gpu/drm/nouveau/nouveau_hwmon.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_hwmon.c b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
index 1c3104d..c6e5ee9 100644
--- a/drivers/gpu/drm/nouveau/nouveau_hwmon.c
+++ b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
@@ -41,7 +41,7 @@ static ssize_t
 nouveau_hwmon_show_temp1_auto_point1_pwm(struct device *d,
 					 struct device_attribute *a, char *buf)
 {
-	return snprintf(buf, PAGE_SIZE, "%d\n", 100);
+	return sysfs_emit(buf, "%d\n", 100);
 }
 static SENSOR_DEVICE_ATTR(temp1_auto_point1_pwm, 0444,
 			  nouveau_hwmon_show_temp1_auto_point1_pwm, NULL, 0);
@@ -54,7 +54,7 @@ nouveau_hwmon_temp1_auto_point1_temp(struct device *d,
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
 
-	return snprintf(buf, PAGE_SIZE, "%d\n",
+	return sysfs_emit(buf, "%d\n",
 	      therm->attr_get(therm, NVKM_THERM_ATTR_THRS_FAN_BOOST) * 1000);
 }
 static ssize_t
@@ -87,7 +87,7 @@ nouveau_hwmon_temp1_auto_point1_temp_hyst(struct device *d,
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
 
-	return snprintf(buf, PAGE_SIZE, "%d\n",
+	return sysfs_emit(buf, "%d\n",
 	 therm->attr_get(therm, NVKM_THERM_ATTR_THRS_FAN_BOOST_HYST) * 1000);
 }
 static ssize_t
-- 
2.7.4


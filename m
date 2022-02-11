Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6494B1C59
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 03:31:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB88710E9C7;
	Fri, 11 Feb 2022 02:31:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2137.outbound.protection.outlook.com [40.107.255.137])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD86310E9C6;
 Fri, 11 Feb 2022 02:31:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kyskZmsLwwe3yXU0vUC+lHOfL0dRzpC4TyCbqMmckF5KhF3EP9mS3F2ipzOMQBtTLghBbIV8oaluK7TmoKLAbNYvCvoyDDujMMeIrqnA5B1QKicPMk2FGOKWS1MuUgo2zR3buvo9L7tO7NAG0BZlnIcuOBWk0kPmJIDiQSBLumQJdnd/0Zfr0sdlm37SaVNwpqvB1xc3kWyrJn0EAiP7qeRODdykqTY5SNjrExCJcJn/x5Wc7lGiof8Il5pjS8U0HdgSfOt4xgiQkZ0EYhDDn9uxFzMdY9UD963ik114Zy/QIeNr+1yBvV+EFiQAAe+ebLJTIxzEl0aa4Bflw6ckgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1AyKPt1GvYb2+QH9UAVuYC9O8m2sX8En2sKfKVIJO08=;
 b=bsVLxekEN5UYBzvk9SC5nxWJ+NA4k+xfyOHMIlDov3O5kd3zgwdvAlvUrR3CDVuLC6mZC1YDeGjwy9S2SbCoxGXKzxmiCffG0toK1ZMcqUC18i+BGVKoEZc8T19lN91GKgErWSbr+LgArhNk3XKLzGcz6wggUYCr/TXH3DlXCPuHiiif1joa5kLwHWABVw6D8K6PIKgXVnqT4MdjDUvi9fHZdmNNMMiNtLaI7fFTKR+/hf+EZ0QuFJYHQ8ZUoMVepSqMS2VXXqkaEO7Y+kAQKTDHLWHN4VgZFo4DD1P7gBhM0GM2W0vi9Eg3c18Im1wAGH86Ie39LM/2Sx7ZVZBMQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1AyKPt1GvYb2+QH9UAVuYC9O8m2sX8En2sKfKVIJO08=;
 b=W8VxLlpcr6wKuJKowz6iapKBV/3h1SHoUp52BqZsBv1yvnuoCuiJ2ic3GDtH7E7IcniT/PXsd9IWCVoGIiBBE5M7cKIfU07EkAdhuNLJhNRWBBFyozjwhXr4+SJ4sHL3GKDW4aRnx/sXHlRe6Y99eEH4l8vFiWclTqYBJ06TI9g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com (2603:1096:100:37::17)
 by PS1PR0601MB3705.apcprd06.prod.outlook.com (2603:1096:300:80::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Fri, 11 Feb
 2022 02:31:53 +0000
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::80b4:e787:47a9:41bb]) by SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::80b4:e787:47a9:41bb%4]) with mapi id 15.20.4975.014; Fri, 11 Feb 2022
 02:31:53 +0000
From: Qing Wang <wangqing@vivo.com>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
 Jens Axboe <axboe@kernel.dk>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>,
 dm-devel@redhat.com, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, xen-devel@lists.xenproject.org,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH V2 5/13] hid: use time_is_after_jiffies() instead of jiffies
 judgment
Date: Thu, 10 Feb 2022 18:30:28 -0800
Message-Id: <1644546640-23283-6-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1644546640-23283-1-git-send-email-wangqing@vivo.com>
References: <1644546640-23283-1-git-send-email-wangqing@vivo.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0178.apcprd02.prod.outlook.com
 (2603:1096:201:21::14) To SL2PR06MB3082.apcprd06.prod.outlook.com
 (2603:1096:100:37::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1d70cf59-bb08-44c9-d8b4-08d9ed06aa1d
X-MS-TrafficTypeDiagnostic: PS1PR0601MB3705:EE_
X-Microsoft-Antispam-PRVS: <PS1PR0601MB3705F1BCDE9A160C732742B7BD309@PS1PR0601MB3705.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kfbibTSneam9oWVKH3DJ3QOmFnh1mxRPRDBXU5LWmu2QQPbyKOmkjNUUjHmIAV9oT+FH5R7EvNcx+TizTs0YPsdXg96FAf+MOM0q0XWfBFTqb0zMhLoqf+zH0Ulk7GqEFfxbhmPxPy06oS5nPVqv1VFFSrZ3TXJDYb/sMLZ94ev8c0c+G2/Bn7r8pzjjHr5LbeCTw21M8+fnytSNLajBvg7BpsMj/GMhL/MTyrqmtQ+H9+Om58JtZchdluGQ8PveT99QYc8D2BE5HnapXVgo7BUQYxDAm7tcmTe9M+1AassFREhfHKVOL5zi12RksfC29ozoSPf/hgFBDhiM7a/CMyB05W/U8tV+F+JnK9GBFHXvOImkabeBzWgZpVwm+P7AwTjPM24J/8Cdtfg4c4UBWbylIMjqzMJREciO8BV73AoM8folGHGIIXDe5CzWAbu0rhouhlltDpbkbezfUECpu7nQG5XGVu570OuqBGRlADPLib2pzOKzGJmH42lBSyPSqEcz8tpWDmg8pzXZNkLETWMR4dOj2aedfY6/LOT2IQr+knBwX26/Z7P2jyYHB3WqSpAfl8kXuw1cplmxseQRgj4Usv+EuKEY32jinmrVtUryMXjj/aiMeLu2DN5MgJwqCP6qhoIiKYR6R3hygd5Qe0NSTahaRaiqQT5DsEvMfBebkML+ADjUYtGKj5w7U6Zu5Jo+Eb7J/KzsLiZt/RESM0GoeKyXO5nOSYX7VgTCTg1l5eBX2YAyZkrE1XLl286L
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SL2PR06MB3082.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(186003)(2906002)(7416002)(66946007)(4744005)(316002)(36756003)(2616005)(107886003)(26005)(921005)(7406005)(110136005)(5660300002)(83380400001)(6486002)(6512007)(6506007)(66556008)(86362001)(6666004)(508600001)(4326008)(52116002)(8676002)(8936002)(66476007)(38100700002)(38350700002)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BBfZ+O1Kxqh21loJeQRlANfu0QekBm26HVPA7GyNiNYfAo4+Um03Vc3uJq2w?=
 =?us-ascii?Q?JJgjUFV/xR3uMWvKcFI3tTiNy/upkQ090Zy8abBi0tIs7V6ScpzGgv2UR8sj?=
 =?us-ascii?Q?YCtDKIX8nXAeGQBI191G5ARvLsxC4+Elfr3w19dfnnSZru82GZUeH3ySaveh?=
 =?us-ascii?Q?g4ZpeeVonCgHFm84185SCy+4C5pIAI7s8kLNZ4+4d/1E7ZxLt1dWtMqUu9AZ?=
 =?us-ascii?Q?fUvHd0nbVuQx3wG5XbxbFuDvtB5Uyp3riuzT29pfWHj9o++CxNUHtQj8wGnm?=
 =?us-ascii?Q?fN7vgffFbifDbWNICqUrIYx2RRljjKB6aVtnpcsvUSFdk36xOeFDjcFkX4Hg?=
 =?us-ascii?Q?W0Tfa7wAKMkt37by333t3+cq9urgxkK3Z1yqgd0f8Oii/Q8C4NhE32rcA/o+?=
 =?us-ascii?Q?IwspIUdC7W8RhDigWSnjrbbH1p7KwTVk1EZiuuB/k02l6WJI2+x6ZLYhLF+v?=
 =?us-ascii?Q?xqwFg1ZSdvdTDGQnH7XnR3Ufati+nzTrp+SNgnJdrzK5DGjOQr1INoiSkiHF?=
 =?us-ascii?Q?9qWVnKBwo3E7tOU4b5n42g2nOOzzeBJ/qapVobWALiWPzsmK9hnxzb2wq8vk?=
 =?us-ascii?Q?+53gw83z0/2QGglEllV5UBWnP77rKVB8XnAORTGcwWAhr/9jdUw33WslorzQ?=
 =?us-ascii?Q?BNL/U5+2amc2hNL0V/4MhgGDrFcQzoCZSqB871xZFrSueByvP/15adpou0MW?=
 =?us-ascii?Q?iuL+xx9xoYVHxW0CJdna2gsC8qSn+MrCQSTiV8wnDiyw379AS5u80+tnNDdc?=
 =?us-ascii?Q?wUaz0xElVWdafxDXoBduBj9f2P1RQ5cb2EmrGYZeLP8x0DYsgbc/9EH+/sPo?=
 =?us-ascii?Q?tmyFrpjAQy2O8eQskqnOFdVmIvjmfzBiFa1tO6XTX5u49+NRItYisUu88z4e?=
 =?us-ascii?Q?mUMvimxuXxD8VgL9ZaI7xnwSXrk4eaHDai0h7BXG9wJaMZ5LhgFsjjYJqm+n?=
 =?us-ascii?Q?11e6sxy0tWvxw0LYwm7xJx3lgh2jqishlwaklTMkt2EbWgn5jVgA8Qjok8SV?=
 =?us-ascii?Q?GPmEIkLb3LEHnaAqhpzz0uwH88qCk8TUnU40rz0/pC0kagWiMGGUbEHZ5pm2?=
 =?us-ascii?Q?2RIniCO1iKMlmnilOuJE+8eRhLCZaJQl26sMTUikZdcbxovBOoohFbQV/MlO?=
 =?us-ascii?Q?BJBV4mPOvBQnKyDE8kZ1t3GQ4dkohKclpgk7VlQKWnRwxV5jED6bdzjSfM5v?=
 =?us-ascii?Q?ZEX8A1xMZbbXIF/TrnoonkmQ+kfOvRUJue0PMCFoo9gCaSXN1USoaxgYPjmM?=
 =?us-ascii?Q?TLYYB3UBE1ICle3hk9qB8IkDWyhrKdws7iw2yk7wjB9rLGjxTi4igzlad+b+?=
 =?us-ascii?Q?2n4Q7ZW0d0VJ2Ztq+vQHKZCaCsxr7jEm0OiDBIxe0eqTt3Bv7m4FyMVmKWrt?=
 =?us-ascii?Q?HsORE7URlTNn6yx/R8E/yaB97QPwS9Cvmmx6f7LYEqxh8dzkgSCy8O18+xXN?=
 =?us-ascii?Q?nbdOHAhQK2vqtoTuzghVXMHztLsmHN+jvKq4WOyl0Qu9bcMYMsHmOvNNSpmf?=
 =?us-ascii?Q?T0tMrhGgQVavp6BU3RU+VZQZou95lS3L6bPIrFLiG43CbdvDLQbMm5DtN+8x?=
 =?us-ascii?Q?HCOzkPZyJsZYhuWU1gq/VtpU874+C3AAzhEvMUxqHQU0HFNNj9ksI3ISeftA?=
 =?us-ascii?Q?OrZU3fHBQYef6Wd3ZzS7Srg=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d70cf59-bb08-44c9-d8b4-08d9ed06aa1d
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3082.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 02:31:53.2742 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7TylgQ8NLxtwkXjCtK6xwJY9XXGkueBEZNf2tBbnWictxmcg+fs+mPezSy7kFaW8Y6nxMhs/TlXtqAL4sUD76g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS1PR0601MB3705
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

It is better to use time_xxx() directly instead of jiffies judgment
for understanding.

Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 drivers/hid/intel-ish-hid/ipc/ipc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/intel-ish-hid/ipc/ipc.c b/drivers/hid/intel-ish-hid/ipc/ipc.c
index 8ccb246..15e1423
--- a/drivers/hid/intel-ish-hid/ipc/ipc.c
+++ b/drivers/hid/intel-ish-hid/ipc/ipc.c
@@ -578,7 +578,7 @@ static void _ish_sync_fw_clock(struct ishtp_device *dev)
 	static unsigned long	prev_sync;
 	uint64_t	usec;
 
-	if (prev_sync && jiffies - prev_sync < 20 * HZ)
+	if (prev_sync && time_is_after_jiffies(prev_sync + 20 * HZ))
 		return;
 
 	prev_sync = jiffies;
-- 
2.7.4


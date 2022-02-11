Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7AE4B1C70
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 03:32:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95DD410E9CC;
	Fri, 11 Feb 2022 02:32:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2131.outbound.protection.outlook.com [40.107.255.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EE6710E9CD;
 Fri, 11 Feb 2022 02:32:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KMY85Oezy39t4/iipe61T3TiK9LC97hCT6SulGzMiNhdI1xnMCb8giG/3xYFXvzz0xviCnVmOHs2AasWvWXuOpoBp56LyJdGlJv8LUTuDKjcQ+vXJD07SbKoNRaI+ixoamBnHSPC/nrcRgO5nKq+wL5zAJEOuZB+ocrbW2WVpGRYd3KWmhC851a0jOBxGbJj7vBjtZ1o463I3VwCZtVv+45GG3bxwyRElcLmjywZadja8L3tO5oHmAmyjoEJpKl7/nUMt0SvojuqoNXT/TvKuUbAJg0yuO/iSkF/SUmxFmUSPFPtpyoGtDUtF1TgIkqgS4c+rJ+K+nhRyIsa936KkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t7/9rdhQphdB3bx+s6LccgI1BFHodYWqZAZuQWlnsMM=;
 b=aI3PMlZO2JTzDQS2h/nbkoY6k2NAGLwnWrDxAG7YKHkxmMwj8l1VKbSWnpV+55dToGn8okRz2iEYJzaYzDT309yaFzBMwn2v/MCyQ7q2JK+NNPso5ocExEkI8Rh6DELzSJ3yJzmQxkMOhm0lM2k9AOqq+kSFxfygQKbm4jwAP1wZevt98v5SYAX2bwhP42t+llMqC2TJ3WMUykrcL3U6yfOq5gZrSvOh3Y0HCaSE68bj1+qi5nIwDOiWlN0H2BZNn6wsaIqkiD8t6eY3EF5/SRg0boR/O/Z7yelLQ6krmaWZCr5BWLjf+xgJyFrMTv3TQgJ8MwCMD2W65bVewMGW2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t7/9rdhQphdB3bx+s6LccgI1BFHodYWqZAZuQWlnsMM=;
 b=IX4h9oioCVX3TIXpAL1XitiNuweRJMuWvRcukNNzPA8mrPCDoVEmi6VRkDjxG3Sk3a5zsOZnTOOMnxROEzj/cvKdjvBM39+/c8gxKXP7ncqKD2XCFoHEDnS1X4KZbIg5tuATlyxs7PyyHMhPiX0VaXYFI87ew3dXgrmhOD5ZxLY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com (2603:1096:100:37::17)
 by TY2PR06MB2895.apcprd06.prod.outlook.com (2603:1096:404:31::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Fri, 11 Feb
 2022 02:32:33 +0000
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::80b4:e787:47a9:41bb]) by SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::80b4:e787:47a9:41bb%4]) with mapi id 15.20.4975.014; Fri, 11 Feb 2022
 02:32:33 +0000
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
Subject: [PATCH V2 9/13] media: si21xx: use time_is_before_jiffies() instead
 of jiffies judgment
Date: Thu, 10 Feb 2022 18:30:32 -0800
Message-Id: <1644546640-23283-10-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1644546640-23283-1-git-send-email-wangqing@vivo.com>
References: <1644546640-23283-1-git-send-email-wangqing@vivo.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0178.apcprd02.prod.outlook.com
 (2603:1096:201:21::14) To SL2PR06MB3082.apcprd06.prod.outlook.com
 (2603:1096:100:37::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 35545403-9cfb-4fdc-3fc0-08d9ed06c1f0
X-MS-TrafficTypeDiagnostic: TY2PR06MB2895:EE_
X-Microsoft-Antispam-PRVS: <TY2PR06MB2895E2E05F1120726288BFDCBD309@TY2PR06MB2895.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:231;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /syyc21+a3wCMBduHjjEZXphPVqYJ5p1/XojM3IKXP2n2wOF88FCk+axsSaSjzQu5euDJ/910sMON3XxFgzdvGNFSzJmvVNaVyxCFH87g2Zx3g7fZzKolbIa2Qf4v+NnaAhstPPGxNeKx+oCcqDLr1EmEWVZHSjAZxDn2j+zYE2VThN45BuJ11BOD3SI5DfavEJ8mO/wqzSIHeONhxZsXwKT5N2EeKjejdLpqmH39b+4msBOxJRWmpWQfmj168630vLfpPwWl1IcP87OWfhJlOJ9nF/2WjiZ9useg6hjRoXnDuFXY2QJHx5W/hnJnkBo1KR/YoLspn8ycO3L6E07598prptEnsZGU2J4ROEhdfJlRCNqNNrHwZCPu3+msPYi78QGIn/qroKsB9v2ZGSZipgjR2u2lVNyL9jpKVYH/h81s1OJWYtzwJQt078AZy+KG81QnwPqQKZzpJ2X/lNWtMklGIRCIvmjkW1cI1N3lADH2FByTsZBYssmEFJhIRPuNcFrOkSypFVC/srlQvi9q4o/n8aieWP4CdrHkGLroz37ZL0/2NQbkMm0wZQA3s7NoJcCElfSQg5NdmyQ/O/Nz5rwba8gjUJhjnMaa0/UI4sWTzp4RckpqFQiodDUVD/QM87bMwJvwFvlh2WyXdPq2b3a+tDN0IGXBAed0+tal1a5ypZxjJX0/84wP7kdj2KCQk1apHZyVnLcBSIzOcp6h1eJJshDQTLeOyjWQAS8Wa7gy/+g8F9f7ifgNPQ3kCte
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SL2PR06MB3082.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38100700002)(2906002)(316002)(110136005)(86362001)(6486002)(38350700002)(6506007)(26005)(186003)(2616005)(6512007)(5660300002)(8676002)(4744005)(7406005)(508600001)(36756003)(4326008)(8936002)(83380400001)(107886003)(921005)(52116002)(66556008)(66476007)(7416002)(66946007)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6LZ5k4ZdbVAaRXz3OQZIHKFg/WeYI3JTBc0emq7qjkfMJK3D7aE3ya+Z6tnf?=
 =?us-ascii?Q?hYyHNf9imAKQBo6+yaVfZ6vGQdMqT5dVB15ayZ0IqGbO+/D9CfPG5Z0lQotT?=
 =?us-ascii?Q?z/58+OXEhhohl4bzdo5zlTGFltOUGGhHnx86p+T773hnHW/arhP5m6U4GDbZ?=
 =?us-ascii?Q?ltsUkIBFjP1yAVYrDokULtmdaQEiuQ1F+okHG4dtENf+9uCwhm/o0uipxBb4?=
 =?us-ascii?Q?bHpoWgfpNI1GyCa527LuxoVruNTtT6739CTA0Z7++GpyqN+E/B3aL+WXZrGh?=
 =?us-ascii?Q?Cp7ViC/18kuakFZdAZfF3RFg/EOwWkQZjJtBRGYqkbZtIeJJwqEjivQWX3Zp?=
 =?us-ascii?Q?CLmmC9upyaiU9MaLBfPjAZOKsqW92iTKX7cWvPBxwcLrtlPw0GAjV8ZBvqAm?=
 =?us-ascii?Q?AzYMu275Aig7wWaPUKSi4pgOiebj+w2ac/K2CGS1oqTEd++3EX1BeuXkLsHt?=
 =?us-ascii?Q?/UQeoRRZuMSqNl8DikxVGmnG2hdC9oWj18rAiPKWt/UYT1BM6b5ptEKCf9Ne?=
 =?us-ascii?Q?4vIwru9a4iofqsCvtbJmaQw2fF30mlABfCNCOq29ZN2CFnm2a5qcCSG0FBeq?=
 =?us-ascii?Q?tPPdUhDG/MGdmUboYhnZjWNf2rHypUcnmdRIZ35nz23IUvzEecgz2rrDC/V0?=
 =?us-ascii?Q?rAY+UFIqIlzB23gFCgj43CoW/91w8PZmb6D8AC+qd2pMfi1mYU4yLyoV3KGL?=
 =?us-ascii?Q?3AwlTgXplrTrOIfrhbSreBuZY2/TAGJ478mTbEQQ0ybzgQi/eJUc2xuOjmzM?=
 =?us-ascii?Q?OsOSGGvDuilFoJwrG8/tJgPOGIW2ebAGYgG+0+1X5I0sOTDdy+2QMYUu+uGC?=
 =?us-ascii?Q?TYFQCoHZAuBQB68Q6eCqHX4KIPWy+loVQFlVOaxaV3naJv3XcLy/OY+m92Lk?=
 =?us-ascii?Q?DzxSUwz6EEtcUYIMn35KeqA4uOnppXxzGVj9Cdci/bl8T0fAJHC8XFfecI04?=
 =?us-ascii?Q?pX+L3YGSMA2w0cdw8CShirsHbc+fGGs0/0KwACjfa0HrZlaIeziGqPUV74mi?=
 =?us-ascii?Q?WJlnXtsM4EFYMiVELBl17c/xm1aPuOrG/pvNyQvcAcG9V8vINCwe8S/ePjzi?=
 =?us-ascii?Q?KzicIiC4AYdS9eliedPxsb9io9V4SFETUL9nR/M93iEVGawZ7aezA+MmrUnM?=
 =?us-ascii?Q?uMWM4eEDMijHvfEKEuL32NCMz7qAm8+1m5LHLIDwALA35S5Yy+jRQo/YEY7o?=
 =?us-ascii?Q?sc/1RTRz0CDjs8D78RfJCqq0Ah+9xHfGfW70IwOJrEBWJHkQojskFc+NAc9r?=
 =?us-ascii?Q?wvr4bETYhnjjd2kpVA0jy+4t66TbQlAetCv8pDrljjwxAEDDBdjJgOHM7x/r?=
 =?us-ascii?Q?jvhwYJ43P/MVkCQ7jokjV+cvcuQDZcYnMCCx9qt9SP+Q/jXL7IJzFvLS0MLX?=
 =?us-ascii?Q?nusiAg+AuGVTP5PtL9SYJOriYFv2AAs/rEJnCtiyxWJUdnaCvU4kCAS2jgDq?=
 =?us-ascii?Q?AWZX2sGc75lZ9Y+l1nmCANRMQrSg6X7dBlBC+5id80Yf/UQIGjd+LkKHiwEQ?=
 =?us-ascii?Q?qpacT7w77TjoL4//eT3Nkkk8lXX7yRt5a0JgN1LOnp1hrayYfP9sCRn0OvCJ?=
 =?us-ascii?Q?/gRVV3aK+lrqRcgJwW2hFhSQucmLGX47pW2IahbtLp8oDQ5C0DY/GY1nGl2w?=
 =?us-ascii?Q?qlheW/aQz1YbuqyBGwCHDZE=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35545403-9cfb-4fdc-3fc0-08d9ed06c1f0
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3082.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 02:32:33.1470 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MVEDRXjkHcVBveXA8LcBcEgx0EK2+lRNap1RgZbICtzB7qCPM4wfM0+HMyKZlgP2NMC4+l4/JaD/4qaIh19kOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR06MB2895
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
 drivers/media/dvb-frontends/si21xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/si21xx.c b/drivers/media/dvb-frontends/si21xx.c
index 001b235..1c6cf76
--- a/drivers/media/dvb-frontends/si21xx.c
+++ b/drivers/media/dvb-frontends/si21xx.c
@@ -336,7 +336,7 @@ static int si21xx_wait_diseqc_idle(struct si21xx_state *state, int timeout)
 	dprintk("%s\n", __func__);
 
 	while ((si21_readreg(state, LNB_CTRL_REG_1) & 0x8) == 8) {
-		if (jiffies - start > timeout) {
+		if (time_is_before_jiffies(start + timeout)) {
 			dprintk("%s: timeout!!\n", __func__);
 			return -ETIMEDOUT;
 		}
-- 
2.7.4


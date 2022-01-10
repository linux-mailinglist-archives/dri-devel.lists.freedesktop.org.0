Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BACD1489311
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jan 2022 09:10:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DD7311BEB6;
	Mon, 10 Jan 2022 08:10:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2042.outbound.protection.outlook.com [40.107.20.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ECE311BF9C
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jan 2022 08:10:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TGLJPZf4kb87Cb4htbCs4hG2/qGSMWyLTIrRbPE9lXo8+zdi9nF+ArmhzppwtKBWqDdrTgF7QTADPPiHmnIqcL8KdsxD6UTRcbYr6vBano0SYUnr9tgxwMDoPKn/x7TCI6XZSzL8W3nOeVpq0gV1p+YggC4PmN5Dgzbvkmagynvu3tigksngH66dy5nK65dbTu9OOcHrZqxV71tYqRVprsgZQcYrQJQXAl2UYexUFcFicr/vpkI5lhdjBtGX6CvrxiJFGb0pBKRAk+JEHzCCpOPMciUE63yaz5R8HrD88v+rNRrQkF5vshHBcKUdNmObHxqAneWSt1VijO1tPTVLsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hB5atL2VuGp3Qf6sMCeO5bZAGkMi3ZnjjV7jIvHF4Jg=;
 b=VQ4rdi0Q9QebFYc+hZpLR+rxnZv1PxlMVmHSgkKimXp1mTtfkaUMpCbfNn95oSvj1D7erifwtq3g06PhbIgHv09b1UZ0AQyG5UXCbN/+HsbHRdQEKlvBQsAgx4RbslA/dYPM2N/XZXcmLkSn86sobRWU7YZa3e1QLy7TlJfspw5pnWcPEzir6A2y1Thh+engKp49Je8veV7/Gq3HKmFHXqpyqDjN9jAEtf0CZUlk8Re9ijjrEjJMWy65yTZ1rALvqLmcKY94ZxCTW0De1c/T6NdwDFBjB1WZNWgQ7TKdRm7kA5b3dkXiMBz2F9Oylp6qtVYOQ+nrjgYZzU18IyWLwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hB5atL2VuGp3Qf6sMCeO5bZAGkMi3ZnjjV7jIvHF4Jg=;
 b=fS73nLappEBht36O4Z9fOFvaXaw5pR1xhZbpwJbWuIlIgDKVf+NQA2pHqigjKtBhPwLwyKDuOymT/9xYcVJOgr2YNHVaC7PWCrzqzxVixrKcj1oCVVHAqbxHKU31SEyqtSj9wxhinsXKAKlUAo0hdfdxQn0lonxEHkUHYyzsa+A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM6PR04MB5512.eurprd04.prod.outlook.com (2603:10a6:20b:99::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Mon, 10 Jan
 2022 08:10:51 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::a5b3:9e5:366:a3fc]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::a5b3:9e5:366:a3fc%3]) with mapi id 15.20.4867.012; Mon, 10 Jan 2022
 08:10:51 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/self_refresh: Don't trigger the entry timer for self
 refresh work if CRTC state is inactive
Date: Mon, 10 Jan 2022 16:09:52 +0800
Message-Id: <20220110080952.3345674-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0008.apcprd04.prod.outlook.com
 (2603:1096:4:197::20) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 71fd7f19-8837-4054-7d88-08d9d410b738
X-MS-TrafficTypeDiagnostic: AM6PR04MB5512:EE_
X-Microsoft-Antispam-PRVS: <AM6PR04MB5512BE2A21CEEB62E62580DD98509@AM6PR04MB5512.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:758;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gU8Nq0i4m2QzA1ch8L44Q033FywQpIm+9HJS755Cc5vvZx4bFDwY6QB07DT0lhDiK3P5czM+2feuON807RE2a12wPEkaFzvsVc7VeIboCwRnJxxe2ZoVUabMU20uTSFMx9A7+BByYeh6WqvVtLqqMxuMeCc0xKm12ai/zzRdLdnAOLW7P9SlEWVjbSbAzKUXInUB2QKfyQldA4bYLlbXdZq7wx+wOmPOpF6OIziVOpZbbIWl89FXRxoZNEUw/s8HSUb8nvmTRu2/1S2HkBqgdmbWOL+4ajmJ6coEJEuzh60zv9u2vFec+vZJ7g+Uk4Jv+NVK5CxQzdzM2ifz+L1QtngpCKsoJLKLeMdtUFF4gnF1wlei5a4zSaIoW8PGzyEmIJNvszu9f0T2bTnJRMwIDSGlyo/lI2BKGIOTa7xpU0gzfTYsJmL/8QS9elremjkmT2zLQ8zMym7AWpvwBLjdIFf/sBSAdJN26dDeT2HfQrR6xPJnR5neszIGnVir/1/a3kmVo05QYNEjama8cu0hXcZoh7l/AkgitrI5T9fhdtQ+NhxXmn4jksoCX51X7jIk3E7aR1+nrodij25jUcy0mey/nBriq7OAYuPykU3H3qmZWuUUg79A6eq0CSz7wPoGnOcaVDkW2/fwm2KMfUTcZ07o+R0JeohkN1Sb5OzbIni74PdpIrlIZ7rvp7+UjVatnnIFwEBCpxxIYbAkDu+SLQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(7416002)(6512007)(54906003)(6506007)(4326008)(36756003)(38100700002)(2616005)(38350700002)(66476007)(66556008)(6486002)(66946007)(2906002)(8676002)(1076003)(52116002)(86362001)(8936002)(26005)(83380400001)(186003)(5660300002)(508600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MbxTH8iTDYJ1Z2bu2TnG9l5hpTZdapbh8j8eN9+rhemtYwS3uiTWE1KSfZV3?=
 =?us-ascii?Q?/kE+2cYbqAw49/HvLqzApfrw6f2iMKShYLVhCvOwoEGJOjsNeb0BWhaVKzwq?=
 =?us-ascii?Q?g2P0YiuDMwvZ1kYgIkNkgle5Lz2u+iQgTg60FluT0MtKoxdLWtPoulyhvAIJ?=
 =?us-ascii?Q?7mseIwBm8giMzAgO51DsQRCdJshuhcfnZuiVvHn0rrukZAZxpwbn0ugZD7Mu?=
 =?us-ascii?Q?VWUS7OGhu+DZp8lYPNKacDXGPYkkRpObL9MWm7h4WJDl5CwVuuDEv4+cMWLT?=
 =?us-ascii?Q?K1FAeOqQXyoG25vGNRxtjHGFPi6OK0eMGX9yPYh3zG7Z3kgX5Eh+koYpRWbh?=
 =?us-ascii?Q?DIX4glXfklFsR1nU10vl0ze1pMVNABSvRWvyaIADgPTOKe7lLL1NsmaZ8LgC?=
 =?us-ascii?Q?NxEoHfHq7/Rnjl64vwRlTmIYXJzksF3YqIzNKXoIY0kmKMI7JGvsN3a9Tf34?=
 =?us-ascii?Q?tcpbNw9xmAXE5Qn6Dozl88dBb4wZQiCiUfJu1JOfiLJq7IPUPxytKVm6eI+7?=
 =?us-ascii?Q?+oIw1YzskzC76X4ayf8YDfe77ioPSuZ8YRIRaJYSZ6yxIhPJ1p5Bh6GIj6PH?=
 =?us-ascii?Q?QORkFeDVGIZ7w3r0eQSi7kpWS/VTuGZJ02ffrtKzoEg+MyVWC8YQR5CzuIFb?=
 =?us-ascii?Q?OgG6rwX4ajAFP9RDHnImsV0bVh70UXpji+Slc3M5Yf7bFRvbdGqqyt3N0YqJ?=
 =?us-ascii?Q?5bByNEj5Dth0fAQp15HTRU5e6Uq+dOlHWhUu7ibaZJa1QdFQujaMJeIx4uLN?=
 =?us-ascii?Q?2Ioh2qe/Za1vR13X56hDeX4t6KwntThQmFw3LjMo85ax5lQvYhPfP1iuGk//?=
 =?us-ascii?Q?DxoybNJg6d2YcSF4/b7O8B4O9HUzJHplqmxXM1k6g6RBn05gglG8IqdSaVaS?=
 =?us-ascii?Q?7dLvqO96u+8TY9icTjiaXiRmaz6GiA8diwAD/6n0vgq4acUKP2fHX9uGsAnt?=
 =?us-ascii?Q?iWriXASX7G0OVW1X8gsqSfrAJT8vNB/HYXSCpBSZu2Wo2SqXOyk19qeF2SuR?=
 =?us-ascii?Q?1g4zp9V7yg6fuzBW3m0Oyr+3kaLoh/Hq7ACMXd68st0OO92SIi/W35iJghm6?=
 =?us-ascii?Q?JOXX5gTTjiNgDgvQeOmpI7+Gybby+Q+0lmp0lQYvRf13fxwhH6xC1xb49ZeM?=
 =?us-ascii?Q?/gzhJUTvUKb+7Vf8CZfqVLCIP3hQlrwiPkTMFwZcF3oXkHsvaqzyX2GcqsG0?=
 =?us-ascii?Q?dNyZXzVaR9eOZDf7CSfOSkX2Bi9fMKOUvHpLLky0AKfLCVBy1ayoYaZShQED?=
 =?us-ascii?Q?4lkzdlqioRXIwNipnVJpLDnAH2KEWelHrfCRsZhr1+vt67u0RjWue1V4ckZu?=
 =?us-ascii?Q?Fa0nWZZAynrB58zi7t3QpTcoomfa5KLI4WkjKqc3SzJxPqDRutXkXevJrWu1?=
 =?us-ascii?Q?WEKi/H2ZbMcpSEaoPHhjiDjHyoBpG5AGTDDJQHiLtERrfZiGazwUyypnI51s?=
 =?us-ascii?Q?bIvmI+8Swuw1xG5vNq+Q6+Pq25YApMPsVUyGHPNsnOCoRiq4nl136zvbsV8P?=
 =?us-ascii?Q?4Z9293HNpZCqZyTU/s9ENIlTRF0KzmsGaOAYZ7I/wEHAPLH3oJ/+kfqNx346?=
 =?us-ascii?Q?8Y2QZMwFoUZ0chr5PNi+3Coel3El4S48ZYTZpIA3wgkPx6SEaT/LEDt1/XVb?=
 =?us-ascii?Q?6Iegz3WR7R098/pT0FfOi44=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71fd7f19-8837-4054-7d88-08d9d410b738
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 08:10:51.1101 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rZeLbfLDyhUNGfmgTu52xqZO94kBvqErfng1DdIEBbJtDz95hbOFmqtspo/2i3tKYmnpJNmc3gp0wK9ZcP77lA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5512
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
Cc: Rob Clark <robdclark@chromium.org>, Zain Wang <wzz@rock-chips.com>,
 David Airlie <airlied@linux.ie>, Sean Paul <seanpaul@chromium.org>,
 linux-imx@nxp.com, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If the CRTC state is already inactive, it doesn't make sense to trigger
the entry timer for self refresh work to make the display enter self
refresh mode, because the disabled CRTC hints that either the entire
display pipeline is disabled or the previous atomic commit is triggered
by the self refresh work(the CRTC is disabled, while the relevant encoder
and bridges could be disabled or not depending on the drivers).

Cc: Rob Clark <robdclark@chromium.org>
Cc: Sean Paul <seanpaul@chromium.org>
Cc: Zain Wang <wzz@rock-chips.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 drivers/gpu/drm/drm_self_refresh_helper.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_self_refresh_helper.c b/drivers/gpu/drm/drm_self_refresh_helper.c
index dd33fec5aabd..e76eb3cd22c7 100644
--- a/drivers/gpu/drm/drm_self_refresh_helper.c
+++ b/drivers/gpu/drm/drm_self_refresh_helper.c
@@ -204,8 +204,12 @@ void drm_self_refresh_helper_alter_state(struct drm_atomic_state *state)
 		struct drm_self_refresh_data *sr_data;
 		unsigned int delay;
 
-		/* Don't trigger the entry timer when we're already in SR */
-		if (crtc_state->self_refresh_active)
+		/*
+		 * Don't trigger the entry timer when we're already inactive.
+		 * Note that the inactive state hints that either we're already
+		 * in SR or the entire display pipeline is already disabled.
+		 */
+		if (!crtc_state->active)
 			continue;
 
 		sr_data = crtc->self_refresh_data;
-- 
2.25.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA764B1C71
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 03:32:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37A3A10E9CD;
	Fri, 11 Feb 2022 02:32:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2120.outbound.protection.outlook.com [40.107.255.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EC8410E9CD;
 Fri, 11 Feb 2022 02:32:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VQbjczXdhaoVW1RrNxUAwUh0RBhMZ07rt6JXYUyE0OqfkutGE7c5UULLs7U+W+3dBnMZtpjkRiZMpNGm3kGAENQSQyppc4WOgd/wqJK3LaXOVEbZ0j62bLNT3uLYoB1isDh275y+rv2xVIABa0vyiS1DmLAQImu8lFEST52INyA5JjgH3UHaOevUiqawfPPGJ2I7Uiq/WIQ3WcOhOTcl4HwQ/P1i1Z04wXE+eABpIwmocyD/aJXGcrYEYsUOxEzVf9z5mQLFtoMQowFdYrrMcrC29uB2vK9zWRUIelEamPc3akRlZXn57FQ8QbXEfY5KJsK88UQ682fzN11s0VciPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9X2g4kpYY8KJuotznJ81Z41K5vV88bf/Mlcbscv2oJM=;
 b=AQpOit8RV0dmM4IrGOhQ2YuSs9HQocL14th0vYjUA7DOX0Hg3nm0W2ClzAen1Kz8Q93bS9McBIsz7r/ZM7cq6BH50K2ysnTsjovANmNoJhP6qyJ3DA1Eoy5Q8HRLZN3dsYYB/N5Kd3Az7jZO5aBYgVfmYXvg+mbbccm5+EdAxTMoqXbN5vMMq2SrAvtiN5AWQleyP8rFavs84MhhG43Nr16Wrur2Ia/YM+dkPrIolDJjt139a1kcWMNYEgRXfpCJvhilxa3UAOrYDfNFiCicRRZzYvdBzXT9IDrhZPg9lFB9NerHalLOGoek7l3glUWfN7f/05kCzdh+t0Hm6MnggQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9X2g4kpYY8KJuotznJ81Z41K5vV88bf/Mlcbscv2oJM=;
 b=ddtX6aYJs8VtO41HYv/sLTHRTEi8M6HIr4B2zlmqPBa2cfxRDL3R1lGxaH3F/m0cDV07bOzXkOfdbJqYV/PHeHy70KeilD5aqV7HqGizuYAk3TNJ4vHV1I4De597ZzVvholVj/lF90opapMiei7IVocxYq9Qj+6vqXf9lqFZkao=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com (2603:1096:100:37::17)
 by PS1PR0601MB3705.apcprd06.prod.outlook.com (2603:1096:300:80::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Fri, 11 Feb
 2022 02:32:42 +0000
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::80b4:e787:47a9:41bb]) by SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::80b4:e787:47a9:41bb%4]) with mapi id 15.20.4975.014; Fri, 11 Feb 2022
 02:32:42 +0000
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
Subject: [PATCH V2 10/13] media: stv0299: use time_is_before_jiffies() instead
 of jiffies judgment
Date: Thu, 10 Feb 2022 18:30:33 -0800
Message-Id: <1644546640-23283-11-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1644546640-23283-1-git-send-email-wangqing@vivo.com>
References: <1644546640-23283-1-git-send-email-wangqing@vivo.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0178.apcprd02.prod.outlook.com
 (2603:1096:201:21::14) To SL2PR06MB3082.apcprd06.prod.outlook.com
 (2603:1096:100:37::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 22c30a67-df4e-474b-1402-08d9ed06c74b
X-MS-TrafficTypeDiagnostic: PS1PR0601MB3705:EE_
X-Microsoft-Antispam-PRVS: <PS1PR0601MB37052B4353CB4B49C0147A56BD309@PS1PR0601MB3705.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:231;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xtNha4o4kxbbrNfFe7wfuqRCh3dUaMbzGNVcM1pOyR1Ba9j+igCFK5RNDPEDQhqmeAZHtUncJLkvOilM4zuyfKw2ygJ8Rk+7F/6WWneaoX33RAZUOTmBEoN7gU/psJapDQYaFEFUx4TIr/Sb8MiEaEA/1c+5DEj2VrK9Yq6epeFoKRUTzo/IxRDPW7jq1l4TFO6W3xaWOzrhpfRhtfv9zz09Ps1m6mo09DtHvTGkJVuLaNRFVfact1zdKKyiTlaHHKaIuxKxTxKYOzwwjGfRwSxSq9LbnuFWQlHzY++fQH0/3A9Jp//T1l47+BFpD4BHolz4kbmuZQ0fUvlXn8r0TrfIWK8XNFBJq35R/4MIfVpW3UFsVaQSo3pLNu0A22hjoUKuCKrP+URcqtkXw/dX4MynAtOk1Ux4B/FE6tfoqd7st7rneCelFFtx3oIUH8GViSicF5K7Gjw2N31QU3LSzgHguH1re+wL4BL8UQdYXn7x/Ep3Svd+NeRbZJ6GGOVnLnG4GmxQfaaVRS0rwFfQEoFLQYGTHyRNR9LiSpMNKYdjTP5GOVT3FCdRTGnus1p8evxG49bMC/BxOX4i2vLZsil1atJq5iUGUULcUBGhBe++jVw+7l6ni6yRdUKMLGiC623zIMxI1Iatqj2WjYDm9OSX/zyqep8uXe0H9nNLR3vuHT3cVrOk3d36dJYsPiuiO8BfFOQqJwMcaYlsDIfzOPAR9NtUPkiWgkRsIiFD7m036gHipCO6xrm80rDK/ZT/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SL2PR06MB3082.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(186003)(2906002)(7416002)(66946007)(316002)(36756003)(2616005)(107886003)(26005)(921005)(7406005)(110136005)(5660300002)(83380400001)(6486002)(6512007)(6506007)(66556008)(86362001)(6666004)(508600001)(4326008)(52116002)(8676002)(8936002)(66476007)(38100700002)(38350700002)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pjaWTw4CSxN8GS9UnFX7sA3l+GWwXMpUq/KEesRwKL/GoHXIOjBizWdywU2i?=
 =?us-ascii?Q?g5ozpuQuAfq6Ma2m3azzfAG4n+rBWIHHUCrMNlgbBIi4cFezPOuMlMm7StBT?=
 =?us-ascii?Q?vGbQ4xDR9W04WLXbdFu65s179EveD5um6ffW6Tw11e+MosB1LLEadPsLcaA4?=
 =?us-ascii?Q?1NkxRLkA6HDxqNYEgFzn8Hy3t16Fkx8Es6y1hLk4+l+CQHERU5eAkpaFqvRp?=
 =?us-ascii?Q?Ptupdmt5qsjoxg11zvP2048fHPqvG7EngtIO/8I2xC3DU4shQY7HmjbO1beV?=
 =?us-ascii?Q?bG/9A+eGma864Q4br1ZKC3w7FUWXtWH3hBs82f3Sbu28B/0efjlgYJkNxaeV?=
 =?us-ascii?Q?idYJIKox+0dtnNtTNIjPh8a4Wo7SqnosOZbb1unI5kJfUpg+oNvOv4lLEGqE?=
 =?us-ascii?Q?jQMUuvz+IdztIGFoRaju5Rjo4IIZfYKdZ7bSAulf95n7dWjhA/zoWTaQ2wVp?=
 =?us-ascii?Q?jdjrZ354MmURz8ySDEzgYlCwg1OPGNPRsPLXsei4+k2PX2ToU+QtL2rTg5w0?=
 =?us-ascii?Q?gfnEls+wcSnkVFeJjYP3FZWFev4wrIn/jP31cLj1FIC5htyPJwnst0oSKc9D?=
 =?us-ascii?Q?ZZSixxWF3QhYpWMKsdIGQYnRpGLRS8BUnibB7OQ4KCv6cjFXOgugR4gao31M?=
 =?us-ascii?Q?PGZpn3w5jTexCHxvguyzc68rsdEw2lxURxIctGHR7We5LkSwXSWU9bgznzfV?=
 =?us-ascii?Q?/VO174WxxGYr/C/oLhzcCuh3MX2we2SV+KgkCq8nXo16jIAavT38z1icxBOB?=
 =?us-ascii?Q?fBpAq3FmfF9wz0Y+Sw/E7aAPWokjeCTQcvFaOy8TCEuwgiRJh8XLLv7ootST?=
 =?us-ascii?Q?u2hicKODZZTxC6h+9pEW+7NkKSe4QRWjJeTqWteAF6zHzpcufum9aeKxbtUg?=
 =?us-ascii?Q?H2s5jPbPqlzwdgrLezCzbdgHs5h+o2bFe17M+v4CdZyof1T6TpbzQruW5L7Q?=
 =?us-ascii?Q?9r0AggtqIuU/NBivDidqK+TKNyql33WcIga/TvBA57x2Ia2JWTTQtnMzJmvg?=
 =?us-ascii?Q?23gIhw2wu2TJTYzFvShjKIQPXENdwKlxM4u3HHnttdjU+bIySaSYsYaCRAXb?=
 =?us-ascii?Q?GX06/LNA4dCPL0A+01JT2RuBwR77V6uCGygcRPC00s2ooTcV7xXWN6TwbwpI?=
 =?us-ascii?Q?d9HMd8eKYq/3eQWMefDxsb9sNuOC4JSL6WvQY7cmsbivRpHpYSUweDhDr+FQ?=
 =?us-ascii?Q?K5aOBgZtPwwttP08+muDswpOB8Wdkb8/7/pe7ZT6dKilYvZWaLGwjCpF8nxZ?=
 =?us-ascii?Q?uObl0XpQgrVGl8pV2t0W7vjR9xL2EZLWSBiKoHL8tgPoduCvizuWxxPxxeMn?=
 =?us-ascii?Q?eYFAgul1/wweR7scvTUBRR4UkeKhaFphYXcXwjRPvByGSmDKqfiOB9SVluuK?=
 =?us-ascii?Q?RWDbKliEzkTr4W7a6Ke3qTYjrLhsrrdcBC5OKjFpI6LzwrVyqijvc8DHe5HV?=
 =?us-ascii?Q?X6zWze1fyFnfk0k8Vx4I/acFDIuFPt31QFIs5dzefZgYi07IU9BRFyXG+7fJ?=
 =?us-ascii?Q?bM2MiNKB//O0FSLkEsgQDKv1Oh+Tt4rin8XGjcXMoBnoZViFFUsO/qEDB7YC?=
 =?us-ascii?Q?LBYDqMoWLXcCNaF4G7r649xf471DAe95bx9OHdmo3Zs0dYqqq4KaWyDCXI4l?=
 =?us-ascii?Q?m3bcmxIaxaonDqM3EvgVrjY=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22c30a67-df4e-474b-1402-08d9ed06c74b
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3082.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 02:32:42.1464 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xdyf1Z3lDKOyxrOoZ86n1eQZmt4qPNjV9K2+wx3x+3JYTq7UQ2ub4KQHKR/GkbvOQn9kNhZLzU4kryauyQi1QQ==
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
 drivers/media/dvb-frontends/stv0299.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/dvb-frontends/stv0299.c b/drivers/media/dvb-frontends/stv0299.c
index 421395e..867ae04
--- a/drivers/media/dvb-frontends/stv0299.c
+++ b/drivers/media/dvb-frontends/stv0299.c
@@ -183,7 +183,7 @@ static int stv0299_wait_diseqc_fifo (struct stv0299_state* state, int timeout)
 	dprintk ("%s\n", __func__);
 
 	while (stv0299_readreg(state, 0x0a) & 1) {
-		if (jiffies - start > timeout) {
+		if (time_is_before_jiffies(start + timeout)) {
 			dprintk ("%s: timeout!!\n", __func__);
 			return -ETIMEDOUT;
 		}
@@ -200,7 +200,7 @@ static int stv0299_wait_diseqc_idle (struct stv0299_state* state, int timeout)
 	dprintk ("%s\n", __func__);
 
 	while ((stv0299_readreg(state, 0x0a) & 3) != 2 ) {
-		if (jiffies - start > timeout) {
+		if (time_is_before_jiffies(start + timeout)) {
 			dprintk ("%s: timeout!!\n", __func__);
 			return -ETIMEDOUT;
 		}
-- 
2.7.4


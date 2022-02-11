Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33CC34B1C73
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 03:32:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E79510E9D1;
	Fri, 11 Feb 2022 02:32:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2094.outbound.protection.outlook.com [40.107.215.94])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FD4410E9D0;
 Fri, 11 Feb 2022 02:32:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UiQJFTEih73bBALf1QoZYNGQZxJYPwuTMlBHnrxtrv5yt/xNU/2LFRfWOEKHWfXCwiyw5P+O9U2JHHxSJQMc9sisSnt9BdwOiKiv/0SMZOJDHWK8YKEg+WD8TrMt9Hi/RlKL2RlOx8cpoLimvxH0vJe3JLHIOkWpUl6AuIRdr0fsT9brcay5C5xKS7Bdfrx3YJ/ZwUwQW1F6hwWUefkMjwshlri4k3gLtohnKsDmdfPh8+Jf6bMtCB/rJ+wqnyWwchKhAuQrll7eKxc624ohexL53U7JYIVY0dYhY7bNL2VJb96zKYgcIB1LSWoZBu+9jwTEl+tN+Gu0in66AqRDmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+UreqemZWhtM2swqJ+H17H399YlhMiGbGC0zkfmGrrc=;
 b=FbK5GvEtTCAJ0klEeE5j/lafBCC7jMN2X5OA+3J+kP1lyJgJTyxyBkgOA5aLBZT0yjqxB146ibxH4ZZuqQf7zpzsc4FvwUUdQFgbZuIBrh7tg4bTfUiVmW5XYXiAluqAn9/Zg5ThGk0VHs9m7U/5RMaZi1beDPXN1l4mAgThREW9DOWDqGAnPM6+Y88mM67NpIrXvaFiOWpLGfxXBJyPSW6T0f9t/2ROGNwK3tvTA3L5+N25Ha4qV1vbaeRYKkMF+Ij0lR4nmMDSNq4WVFsEobnN2t1gf/IE1dUlU60xq7zfB5+JAVYSmdoHtj3lklt/8+SfrHgHMgmcxa5uYog+Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+UreqemZWhtM2swqJ+H17H399YlhMiGbGC0zkfmGrrc=;
 b=ep4/6Byvp6rmc1SWOOXXbvra047BBmWb/rK+CWh3V2GHkhNJsRqncB0kn8KolGU/VweyBYhtXm4596m6gxVgWzs2RByboAqmk8aLsgFS0EVqxOOTwxUESvCFN8laKFmkruLPA0SYcZdU1a/gGSUXxnC7spA63ob1ujffM8wsRdc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com (2603:1096:100:37::17)
 by PS1PR0601MB3705.apcprd06.prod.outlook.com (2603:1096:300:80::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Fri, 11 Feb
 2022 02:32:51 +0000
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::80b4:e787:47a9:41bb]) by SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::80b4:e787:47a9:41bb%4]) with mapi id 15.20.4975.014; Fri, 11 Feb 2022
 02:32:51 +0000
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
Subject: [PATCH V2 11/13] media: tda8083: use time_is_after_jiffies() instead
 of jiffies judgment
Date: Thu, 10 Feb 2022 18:30:34 -0800
Message-Id: <1644546640-23283-12-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1644546640-23283-1-git-send-email-wangqing@vivo.com>
References: <1644546640-23283-1-git-send-email-wangqing@vivo.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0178.apcprd02.prod.outlook.com
 (2603:1096:201:21::14) To SL2PR06MB3082.apcprd06.prod.outlook.com
 (2603:1096:100:37::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cd8769e6-d363-4ee5-4a94-08d9ed06cca8
X-MS-TrafficTypeDiagnostic: PS1PR0601MB3705:EE_
X-Microsoft-Antispam-PRVS: <PS1PR0601MB370540B185341396776FBE22BD309@PS1PR0601MB3705.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1751;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ap7cwPaUAtNcN60g89R7HvJFIlY8DkMtY273D4LMkoqQfd0JkwOfeTniOqvhhDmdcgQDoqcPA+4JIUnqYVEvpMY3Dxu5BQDVnVr29loaChOH8HquGgiN1QPnQIDczyyXWE+CPfDW7TkI7i128MAOkSuUSSqTCXm+nek7xImLdHJ1WlMuRK3ZPGskZkhIPdWvW7rIj9hRhyc/4ogsBY02mA7uayw9Ze1gS0Y0YGohY6F56oj7+4rht1taKTFtkFIlyhMFvkPYKUBiSRTveuXc5oIkoDQb38aVSRX1xcLekMs/78YNm2G4OjKFBSOjIlxtBzWkFMELHPNddvn6u65fz/cIsOFhAbPX/QXrBV2KkyczwiR/nvSOLhN+DdFDO1iW7QndGPyE3OMKrRgz6QwvRo3hjL68myq0ILZl3t2QfovI7mikeVch4tNe+YdyuwxuwA/aJTmB+UpBrZVSVjUCQutrMZZP9ZXNBd+57npHdia7GeKv55Yc9y1mTjgeOSnfTd+Ep9SIGtS+Q7Y5Pi1CtTMuTHmF0RL6vIOC9Qm5jY8Gexnsm0e1N4feg9BhxixDxt5E4F1FNiZdlTVA/giIVU8zoBYOM0XTQ+1b8p3CYvzx2wD3W48B3GiuMjwoD6kWJgwYyLgkfqIKArNTlIYdxQRbS9ctwuFMRoxVoyPee0ztOPefN5M1kF/IBa4pwCrMKtlEmRs2DhWxgQQhI0obSfd/E2yhZVh++W0NA9LKTgUqz2Fpe/rDcgwfQDzGpg6j
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SL2PR06MB3082.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(186003)(2906002)(7416002)(66946007)(4744005)(316002)(36756003)(2616005)(107886003)(26005)(921005)(7406005)(110136005)(5660300002)(83380400001)(6486002)(6512007)(6506007)(66556008)(86362001)(6666004)(508600001)(4326008)(52116002)(8676002)(8936002)(66476007)(38100700002)(38350700002)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XvPcCmrYkA7Du7Opc3xsGLAaIokoQ7W1OShKVIydnA+J7YAcXUPMplhB79ad?=
 =?us-ascii?Q?BS1jV2QoRFBmYSqZQgElNmIAUjkiAxOKdm/qa4lVPqW2DdOZvKVWQ0cGw9xY?=
 =?us-ascii?Q?0CAMD2rtEg4e9h8GgWiOH02JP69rahWcYtbq/ikqxOtMql0i1T7GazuXXFjK?=
 =?us-ascii?Q?HABeZfp4WEdy6FhduNh60ZJMfd3ynm2QnV7BJSBWsyeriCUJZ7ZLwAZFn89I?=
 =?us-ascii?Q?ny1flmH1D0EUlGAXmDdIdFcf+okHQKWXY70+Kfkw5n1d9uE0pYXcNSalyEYJ?=
 =?us-ascii?Q?KY4ZxjEaWZANn9DfPu07IcKp+x/ycvKGA5WkYsr6G3zeE4yT8gCyusBQXEmY?=
 =?us-ascii?Q?kR2HnTHczSgnWg5GV+NOToEuJ/x2HkqvWNn6PLjRprHjacRyGHVWPQ+1UClM?=
 =?us-ascii?Q?6ADzqlB0gLDiaedxuLYKler9/eozVLtqOBDW48G2Usp1ZDAmCCl8RUjsSnv6?=
 =?us-ascii?Q?Pq8PapRcBTAuRnGEQVBKmV+8V3yyl25Obo9lT/q044qh+5DrS1HZEq5PNPb5?=
 =?us-ascii?Q?i4sfY5LZGhvDZoGyJTmvPssqm4JzfBsdZGgrYunCMdi1oPCnQ7mJuaAl9FWI?=
 =?us-ascii?Q?pPkn/3DqYYVt+MQ4Z1ZkNXMJreHXOHpxILcCKOjfiBUKsr2QWyQPGd6lafpV?=
 =?us-ascii?Q?YpAPACIvar7lNhGei3TkMwYX8nIfonqCyU++KJVxYnBiavQgpB82cqpPEGID?=
 =?us-ascii?Q?10fzmPpFAXyw0/o+sYDe6Hd7vhNpGaBQ35pyWyprLZoE4gDfCOHX2S3SF9/r?=
 =?us-ascii?Q?/jYsy0Wz4r4p89rH2aliKggG5OzOyBb3JEKB9JkJTJDMZYzfQM5ffQ9tJkbC?=
 =?us-ascii?Q?1YrB7xfaf5QO2LDsra6rhgkfPvUJ8+YYf3FadrvifDHGZ2ChrAUUckkWTqgb?=
 =?us-ascii?Q?d1yPZayI6nq2LTy70KM7y0II7Ah/f+sF/MpfD7KOonHNKT7HDuYSD/TMI77C?=
 =?us-ascii?Q?x1uftmRAxkEZ/S7oKeZh6kUeYA/Enw/exb4hFxz/9PNrBpL+DcYgLFTSIXwn?=
 =?us-ascii?Q?cCG8oj+0rv87jJsNnjdGzx8neujGdRtM+WPFdWsYcQfRYBzBzLjxu/jsLEIB?=
 =?us-ascii?Q?mmdyfXhh79+bLkmtL/suJKl7O6by4z6r/yGen3lxMxX2rhneaeX9SFdAh8aS?=
 =?us-ascii?Q?pAxvQJW3zTGlEAXkSnZJWy5tzgWb4gEiCtJR59EMPl1GjZVlwX061IKIDjew?=
 =?us-ascii?Q?dpXoTnIZncRRuZjeuNoga5f/8bVBcOJuYckD33D5dYsky8erptryBYosZcjf?=
 =?us-ascii?Q?4DzxdHpPOxqErz8MILaTs4zqqjAM1YSrq+5lIKktfVOaEOmH9o0D9GohmtWr?=
 =?us-ascii?Q?HUK9REILIRNJlnIRS0X/VNO8hO4fn88pnY5DQKLCr/L11xTyhxLot/gGGWqP?=
 =?us-ascii?Q?75R/t9t6s6bqCxdyCdzGoJJaxs+qOY9pc4KF7YbKAoj67h0XLyO4NLQThd66?=
 =?us-ascii?Q?hq2NWJVXU7senmUKbKsKi68dyNG2oh1+XuKBYSE77hdLG27BFnWSEVAI4PmZ?=
 =?us-ascii?Q?DASJsafXRxMJrG/rEXeTS8s23Y5aMjwrvGfgwz1EgAXNGxzdmc3BI26eI8FT?=
 =?us-ascii?Q?IEjVHGUQQVrlePgOMkzaCSDEcT0x17+/68J6deTXkvrOUs5rmIao4MTx5mBr?=
 =?us-ascii?Q?NOr2LJNZoFcItflcG2P7krg=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd8769e6-d363-4ee5-4a94-08d9ed06cca8
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3082.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 02:32:51.1459 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FIOV+VJxkJuy36z1KAD455OyGjtcPWPNha6WYplMGJurR2u+NV8i5/TONQWOZGXQcVf1YatOzY/HvVtoXP9poQ==
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
 drivers/media/dvb-frontends/tda8083.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/tda8083.c b/drivers/media/dvb-frontends/tda8083.c
index 5be11fd..49c4fe1
--- a/drivers/media/dvb-frontends/tda8083.c
+++ b/drivers/media/dvb-frontends/tda8083.c
@@ -162,7 +162,7 @@ static void tda8083_wait_diseqc_fifo (struct tda8083_state* state, int timeout)
 {
 	unsigned long start = jiffies;
 
-	while (jiffies - start < timeout &&
+	while (time_is_after_jiffies(start + timeout) &&
 	       !(tda8083_readreg(state, 0x02) & 0x80))
 	{
 		msleep(50);
-- 
2.7.4


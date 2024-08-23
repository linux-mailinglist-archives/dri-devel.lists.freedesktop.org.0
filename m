Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E87195C351
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 04:36:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9223510E2DE;
	Fri, 23 Aug 2024 02:36:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="Ojl5+3gA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2085.outbound.protection.outlook.com [40.107.255.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10BE810E2DE;
 Fri, 23 Aug 2024 02:36:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w3+ZygNVWTTq5naniBqCUkFKY+opW2S/FuPuj9ogQ6Neq1uZKSaX0mZFM5EZqA1mjFP/FyD98omz/4SJl/XNEb/a35diFQMVg3c3oabbmXjKnfnF6bqSwFWW/QgWzlBn3O3RItpvDf/OeAS/GcVg2amH3taJMOigb6E0egFUafxEZPJ0GhZmcXCnNIVTlzku1X1+BZlZPyyxJ0VL929L1tZgyQJ2hpXkpnWL8kHuh+GnUSqNl/OvWzhV8X6KlBALXStOXxQ3SuVoutnq5HYW1oVpQt44rWQzmcpA/dHGUZKDrrdNeZvHMaDIBhi1kaxVA/a8S2/RbT/kxPPdBI3cjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b+fefF8yYEUR+3HhQK3Lqk+6TZXvM0Q/BP9K/p3yjBk=;
 b=hCTkWWkvax1f2hn3KcVeHa+eJac6rudq7Dq4X7mBjKFIKltrcqCRaBEmY9pr4onlcugzefT0iNzdNTAcugb3GkrRAR1+O5MDq+YhgYSoZlHjxF6HN5PwGMcu/g6YeYoAROUffRppQB0CB+IZeWm8dWlIx5/M7EPFF+Dvpbi5CJkhwGJB1PBLbm77ihTJtgyORr6Rt4w46lOUz0QBg/jMREWXGa1H2g7tEMu8NaSWiVoqTsRezIXYgbZqx/oijH+eMy69dkDO+8rPWikWYSkVKkBKE3mVyKRINgdq1UQTqCAqjWNrFdcwYYAwKeZtAKAKzRwHVaUPl9zKkJinKU7W+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b+fefF8yYEUR+3HhQK3Lqk+6TZXvM0Q/BP9K/p3yjBk=;
 b=Ojl5+3gAh4Ct0CE69WYHR4NawhZ3j7+yHWtAf36DhaU4xXgBiyO8v9Oe73gqwIyMSWQULMNz7ngO5RPvEhtCuSdRZl2D0ae93ymFMwP8iVz7tTcQH8qbTyca1yKzLpGnLjwLXTVoTTrxttYr451ffuU6Gguel3y02b+n3m8vmg5Tjk8XnliIpLoZSbRyzvRQgrX8KLzS/q/pF8vaWcJojCFd6ySEfsY+EWHor5DLquWbi87zBWlOFsbddK+njUDeIIUmVwLzFKzqiYSuJGP5ISTOV0m0PbWcpQQs8GA4vXRbixqzydenqX+dpupNbcpNW2G1dwD3K0J3p0npyzOHyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5724.apcprd06.prod.outlook.com (2603:1096:301:f4::9)
 by SG2PR06MB5309.apcprd06.prod.outlook.com (2603:1096:4:1df::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Fri, 23 Aug
 2024 02:36:23 +0000
Received: from PUZPR06MB5724.apcprd06.prod.outlook.com
 ([fe80::459b:70d3:1f01:e1d6]) by PUZPR06MB5724.apcprd06.prod.outlook.com
 ([fe80::459b:70d3:1f01:e1d6%3]) with mapi id 15.20.7897.014; Fri, 23 Aug 2024
 02:36:23 +0000
From: Yuesong Li <liyuesong@vivo.com>
To: jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net, airlied@gmail.com,
 daniel@ffwll.ch
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 opensource.kernel@vivo.com, Yuesong Li <liyuesong@vivo.com>
Subject: [PATCH v1] drm/i915/dp: Remove double assignment in
 intel_dp_compute_as_sdp()
Date: Fri, 23 Aug 2024 10:36:12 +0800
Message-Id: <20240823023612.3027849-1-liyuesong@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0053.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::12) To PUZPR06MB5724.apcprd06.prod.outlook.com
 (2603:1096:301:f4::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5724:EE_|SG2PR06MB5309:EE_
X-MS-Office365-Filtering-Correlation-Id: 5206b79f-c266-408d-aa00-08dcc31c60e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MwGdoKY9bU33Ag8lLKL9xeNpuGGMb8TYJf5PArPM50yvhGHxuyT7MPOM8p4i?=
 =?us-ascii?Q?kSZrtHMFEk6ft1v5uKR9HUCvqYo+qu9Nbg9mKkJCo5ISMSP61zx6KqKApqFi?=
 =?us-ascii?Q?3w+w75v5HqvnGavKv2XfDPXy3aA2JZELyrtRt9GjfBLjZaKBoxN6n9wLBu5O?=
 =?us-ascii?Q?/YjwMbmSx4ehpCyvHLPJ/5kYBGG8gSso13bmjgDsZly3TgEtbMQ8bs8WR5MZ?=
 =?us-ascii?Q?UPDJOvC/RsTDX7joWetTK1Lf6v+wHfuXoGe+x4/OeZPKH/+XNzQ/Mg4I3++Y?=
 =?us-ascii?Q?FQ7TWd/mg/4PQ9Rjzgd+5mdpH/m1qllUe7wzbrW1W9MozJ9wqC9jlFJTPJR3?=
 =?us-ascii?Q?AXf/pGZxwYB/65EIa7NFpcV96AO5WI340/4BtC76NGs1SrgrG2PemZYoOf1o?=
 =?us-ascii?Q?EvHNppGXBpsxb7Zn4UXRvxASnVZohefcdzj9SoTKJxeZKLNw82OnwFwwxHw5?=
 =?us-ascii?Q?NKkYeyPTeiCT7TZErvO3gN6LDcLXrF6Vae6Zw0NvcSwdUjnfUGu2y2JdN+hy?=
 =?us-ascii?Q?s87lbcRCmquzw1SvgxcsFnN97CAMN4qvi5jTu9UYGoKanYtO4KzcjM17gzSV?=
 =?us-ascii?Q?0NN6ElaccbgGm8GRw3Jf3Z175BCeICkO+JYMFdHw4gf/vwvl21tOeaR90VI2?=
 =?us-ascii?Q?N+WxZlR9AYJV8ABRP6/xPWbj0sX3F6muFJnurm3dQkQbq/ZDz9foGlyyBSzo?=
 =?us-ascii?Q?VoVLlAVI4UqWr6wkmmjKmm1JROPlfXMXCypYPnMt+Xlb3PiwacxxHNJ2S48a?=
 =?us-ascii?Q?cmBJ/pWrIXFxE6pc+C0mw5kD8Lu9ebNhekXQVixV0+0Rz8jwEDiySamk5KvZ?=
 =?us-ascii?Q?xIw9CqNfMRY150WpqG+8htyqabS/oM/RlwBk6SINQlJqHBZ+04YVGg/oOX/+?=
 =?us-ascii?Q?eRPCZCCjPX4Mv8lRVU+PvebmGRhkkcym9psQSy4a6ykn5aq36Bk9eLTUi5IV?=
 =?us-ascii?Q?rMTTVqk2Il6TWSSMZhvJXQZF6Dcr1x1Mvp+4t5XCBwvm22sjQf9789V/0RKu?=
 =?us-ascii?Q?lXrhlnsvKm+RCLdbiOZk+ItFyAtCcjhFgH75V1x29a0eO/SKfmMy9M2E5PBL?=
 =?us-ascii?Q?tLSmB83iZs0+PNJM0EUocUzChvQeN0Sbmvw26C7WRbm5FiIdGrymkl9WN73+?=
 =?us-ascii?Q?6fzziGncEQ7uaCRnPdGzsJtADcR2uEV6ZkbomdJ13Z8TRazexezmID8Bu8Oa?=
 =?us-ascii?Q?gTZK1cywm6yjsPoVviTBPQs903na9BEADkmk2Jc1eQuePXvK0tHTl9VFoB1Q?=
 =?us-ascii?Q?uuHmMR8Kg/rMwgPEwV2j6L8Q5vitkJq2zPiUX+uW4u8522dfOoJBS8M4/ct2?=
 =?us-ascii?Q?oRFELIapc8CQF8u2krHBGkQJ4ISu4Rs0pe/e1sQxkBNdH1DzSXqTASbEElTb?=
 =?us-ascii?Q?nJAvck9NM7JTYAdv4B23NB1LQGvn+AyVrrkk3J1HOOPUNEMq0g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5724.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IPUOIgEGjXYFx9bzpEDlRozdHRdhc4iekt72sX+tm7WKD3mhSgeyKHZEPm8b?=
 =?us-ascii?Q?uZxZhz4Qo9Ubc7nWmAmRmG+FR43/64iJwFuxBvNYRYAMUGMdXA5iHya4WlHW?=
 =?us-ascii?Q?TTfYr5HdJd8/wZ17gLj2ueCa/ij4hsLetlCe6ozM94BfwKUZQi9FoU+mz+aW?=
 =?us-ascii?Q?+o4TMzWa+mBCyqEBkKMHMki3PAYfn4ebsFVyM4kN6dm9u5KVkWKhbDsOsd5K?=
 =?us-ascii?Q?skFJL01Jd0xBmI9d9ykws7oKqoXVV58xyHfrp3dz7TvLOyRaEiBpXHHog0Fo?=
 =?us-ascii?Q?qHZSGl8uB5Ripbb4fu384yw3X8glrLQScc+OZoG5gQcRbOYKnuFkvOFAOTix?=
 =?us-ascii?Q?EOdinJmsXAcTatrJLp4ZQKfC3ciaHievA5UtjM3RcEevFovQfVDJW8Qpz9W1?=
 =?us-ascii?Q?CCab4w/JdwfTpoSXg7nddM1f2Y/UL4sNTXXibjmOORj83elBSfth/sl/riwa?=
 =?us-ascii?Q?ypC/wcpwTddPpy91X/FyEfDlnR3HyaIq27uNY/LSDZ0rpseSt2O+V55TgELN?=
 =?us-ascii?Q?TkPu4JzRtoqV8UJFJhGRXsiNkeHyhlOd7JOZwgF7c77MLI1AQliiiAVk+3jv?=
 =?us-ascii?Q?jukMIhKQ7QIkjJF0D7/Jf5vjJz6U8Rbr1e0IhniSKYyVRwGMzF1UlzBFEvsj?=
 =?us-ascii?Q?cIXvMANRUNIUzZAPv9dFWo2u8b6/cZp58dpo6pKOgVMFS3FveT83Q7Sb25VB?=
 =?us-ascii?Q?3XTVCw8n0cMzRVILp+RYjD4DMm90aH54PLtN9xy8B/koLGexLc6SW17T/CCc?=
 =?us-ascii?Q?2t9b37jsC7ukk/5ugs6sqDZF6PpCicJsxZFdQA93pZgLMd94lKFRZ8cqzDJn?=
 =?us-ascii?Q?9ukqg8vR9JJyz684JVaDK7RGjf2k2QAN3Sl9G1H6HDtps3/EhL0Hrx0/ub6t?=
 =?us-ascii?Q?Iv468p5BhsklFNfv+CWuFq6OlmfK4MYoMrGlc/B8PmqZWfmMnA0+00WSrMFE?=
 =?us-ascii?Q?E2+Q2rAEDHJRkJLwk18qeEAnezSN6znnSMfU76REF75yTPR0/aUJKILTSLYU?=
 =?us-ascii?Q?OOrZWdytZdpJenfP8/NiCxVPMPVbUNGsjY496t3i7z3ZdV9Z2vdft6weaCx4?=
 =?us-ascii?Q?G3QZaMMSnKaoq0Kx7JOrBdJvqbpMs1AT63VeJGCKHgzHMgyMcm9Zm4XPGl/Q?=
 =?us-ascii?Q?IFYGDqdofKso+GyPTLKZGy9y4jrTw14q+fdM9xKQBUAliAst/jzujHJP8E8g?=
 =?us-ascii?Q?/0LjdjYW6Ep0Agft5Hk5IDhv+FnRuFz5DpNCYnSDExoFXcGzs+P7dOoKKGsd?=
 =?us-ascii?Q?840rdpEsSiaEqj94f1KnHTa/2UJnH2kcliCKPzqUMiG429w+bKuSnYSGm6OC?=
 =?us-ascii?Q?A+Vw1W4aifWYjVsbRys9HaNnj1VJognFnOKIlnP9IEIcs6Nri9pne2DEuVtr?=
 =?us-ascii?Q?RV4n+MFocXPTQn13oy8tHPIU+DUhDE2jEgX1KVtqi4OmB9YqKIAxciCtI9zh?=
 =?us-ascii?Q?gedmkO3Fk5Ib0TobJlO5a7DllImDpeoBqOhHoclBL1JZSIK8AVo2WNdeAkQB?=
 =?us-ascii?Q?iBRAN48a+GzJBRav8KXFcYVKa6VBoUWRR6PJgYBz2Bscg9BMsOFqwsiD7iCU?=
 =?us-ascii?Q?QPPbmjEuVzJNoTPDzczcum+7emKyiEK9/Qnqiyjs?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5206b79f-c266-408d-aa00-08dcc31c60e9
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5724.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 02:36:23.4506 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UGibiekkkGH5JRc6hJs+JH+n1oQdClL5LyeqonrxepCo4oDWILCwgZRK2MzJMydcoXMe3qTx7dT/Gw4GNV82Jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB5309
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

cocci report a double assignment warning. 'as_sdp->duration_incr_ms'
was assigned twice in intel_dp_compute_as_sdp().

Signed-off-by: Yuesong Li <liyuesong@vivo.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 6a0c7ae654f4..229c87be4402 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -2730,7 +2730,6 @@ static void intel_dp_compute_as_sdp(struct intel_dp *intel_dp,
 	as_sdp->sdp_type = DP_SDP_ADAPTIVE_SYNC;
 	as_sdp->length = 0x9;
 	as_sdp->duration_incr_ms = 0;
-	as_sdp->duration_incr_ms = 0;
 
 	if (crtc_state->cmrr.enable) {
 		as_sdp->mode = DP_AS_SDP_FAVT_TRR_REACHED;
-- 
2.34.1


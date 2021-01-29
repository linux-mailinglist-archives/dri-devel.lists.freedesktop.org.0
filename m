Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 221013086DD
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jan 2021 09:12:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B19E6EA99;
	Fri, 29 Jan 2021 08:11:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2046.outbound.protection.outlook.com [40.107.220.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CAC96E3F2
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 05:59:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZqWx2KZiOnl1l3IpCyx0pABm5pIMXc+qeIIfNBA2Nn8DTaRgRYNrLiy+vzpu4T3oY3cElsA7J8IdIfXdDvPuAwk3+iZgAxn8wjg+ufM9R3ZHRFSsruel5YyaBT2V5Z5kvO4KoALLrmNjL2glPcV00kI9X+TJeW9mx5PbX4E6q0Wmo0DJ0Pj5wgl9ipaUbv25s7nzJXDwUOhEb36C5kLMZvzA8LcIx9KHPgOAQmzi+eboViM6gugtsBoDPSC5nLHzWZHEXY8yiyq7hjY18FwoKyEeZ3ZX0mpBynTWvobx6xZoeO9UQwzjucZhstzHT3ZXvFH3xNIUzddOwcYb+zoe4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PgAwdFPlQcgy+hFUXRHYAY2i6Ns7EUHizDk/+otmgZE=;
 b=hvc1iApIt7iUaqOKT2vhBuJcVvaTrz9DAY5vDCmTeUukwyYKvLObNKK5aNXLD29pIIxDxw45gohd4gDNWuhU8ffPSt+yCzZ6+hC+wxqoUB2YcUDeYK2U9JdthJUYxHnbsm3AicFM7xTucgFT9OBW0ce4298Sk9lJjz9WWsOdNrCR9b7CVSrYokOyBJn1G4+kcxyJW+pdQVQT1m7M69G7TIaPoP6WT8B0FacV+m9y1UAIiV9Lw+WMWDXi4tVS7NGiy6TzBuR4H0lje69LOgmYak3bHh+WkW6opl4vHurrM4yfbArwPNYZ/1qauKQUYuO9EcurOd5TpK6esimxle5jBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PgAwdFPlQcgy+hFUXRHYAY2i6Ns7EUHizDk/+otmgZE=;
 b=RkJySc2XEo/JgML9c74fN/x/aIuNDTH1qHDWUWBiRlQrY59VGVvHo5HhvMRJB9rBP5vMhd9mLk85CV6jldCsTkXWC/BWylwtjgiUfm9yMkBbkJctNlh5BIuYrHe5LvRyGsQiQVekHS+M2OXPgIrZ8vsepuLQY5v7VVWs4FfJtDo=
Authentication-Results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=windriver.com;
Received: from CY4PR11MB0071.namprd11.prod.outlook.com (2603:10b6:910:7a::30)
 by CY4PR11MB1768.namprd11.prod.outlook.com (2603:10b6:903:11b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16; Fri, 29 Jan
 2021 05:59:17 +0000
Received: from CY4PR11MB0071.namprd11.prod.outlook.com
 ([fe80::5003:3066:e469:80a0]) by CY4PR11MB0071.namprd11.prod.outlook.com
 ([fe80::5003:3066:e469:80a0%7]) with mapi id 15.20.3784.019; Fri, 29 Jan 2021
 05:59:17 +0000
From: quanyang.wang@windriver.com
To: Jyri Sarha <jsarha@ti.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH] drm/tilcdc: send vblank event when disabling crtc
Date: Fri, 29 Jan 2021 13:58:31 +0800
Message-Id: <20210129055831.1702862-1-quanyang.wang@windriver.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR04CA0081.apcprd04.prod.outlook.com
 (2603:1096:202:15::25) To CY4PR11MB0071.namprd11.prod.outlook.com
 (2603:10b6:910:7a::30)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-qwang2-d1.wrs.com (60.247.85.82) by
 HK2PR04CA0081.apcprd04.prod.outlook.com (2603:1096:202:15::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.16 via Frontend Transport; Fri, 29 Jan 2021 05:59:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 96e6c747-9e9f-46fa-67bc-08d8c41b02eb
X-MS-TrafficTypeDiagnostic: CY4PR11MB1768:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CY4PR11MB17689345E27B8313303CEA9EF0B99@CY4PR11MB1768.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:411;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /OWcYSgJM9Av30YmqQlpCVL2fRuLcxBZIgr9z+tUkzLrIH9KVgC/yAqPNHl0p/Iw6D56r9N9ArCb2noWlxjRHftZgu8NarHATcksWB/ejxttJ/CZNN+auLRS61NgUAihsNlqHg9rWdKD0mQmNO3rdGtC3o6FstZrcIz2PoPCdT1jPNL+GbsSvScAwfC9stxlflv+03cLuFzIvTRh7inoTBSASs8DM/mJD6dFNMn8IQwahqM+2bartoiCJHz8HjIzDSpZbmNqWGcIW0Re6Ql+UY6vNxuVYJb3r3KQpY06JB2zlnJMrUBeeN1D+UsPqtP3PPpfGq0y+6hbG94Bz6U5ofG6EKjsCLbNfEjUNoAOrI3ZeC2evOtHHjn7pUTGDjRec7cO040iTciluwTdO1IdYiKI2iC0xWQIFQ2HH9KhFhTcE23VMcAWUzvYtU8L3/jRmbWRqcYTq8ZNM1W5czcbUJH5F1u6wwrhreLpDs858bLRmwxMUpbrB5tx6qKorinjvYR3JB7Fp9c3Fq1hE9n4bw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR11MB0071.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(39850400004)(346002)(396003)(366004)(83380400001)(26005)(6636002)(86362001)(316002)(107886003)(8676002)(52116002)(9686003)(6512007)(6486002)(8936002)(110136005)(36756003)(478600001)(5660300002)(66476007)(1076003)(66556008)(4326008)(66946007)(2616005)(6666004)(2906002)(16526019)(956004)(6506007)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?PowIyUwtD4A6JRwAOLYHcCLufJgv6MvUYhsT7gVT8NduXE7G9iCFT6xW0DhU?=
 =?us-ascii?Q?n6MUliU13x/2NcXr6ef5xizTJf05rnVuZZ9Z9IVYan/XIbH8viyHHNC0DmPX?=
 =?us-ascii?Q?i+tAieh9NBQ4lUOs2n72Zml1E2Fx4pxf5mUGzDOPq8lAE8TJ8daYAI5PdnpC?=
 =?us-ascii?Q?QtZwMXzBH6sFUEz/0L4gcbGqZpCPdpRBjKQLe8ckn5VM8YUEGKii88P7CLv3?=
 =?us-ascii?Q?OEo9JjB1NzEQ0xWZG1GSgRDuvdts9Fbqv8ArHgyxjABFGwxwAHKxPT/oWFBP?=
 =?us-ascii?Q?zAa5ch1jdv0wCd/DDPOhrC1IxYnTz/G9oON3MsQtkH7fmP5jnOdg9I/3r60Q?=
 =?us-ascii?Q?hmfxS2ayaLZ9vV+gosvMdPzOh0pcWs4epWU1ubrGI3HnVVqYiH61UB+h+PQ5?=
 =?us-ascii?Q?+vUKzuHVBCjdA9NvjEB2lsmuKXWl/5lkntxTw+spWPfQNViFne8xz4Xgdq/n?=
 =?us-ascii?Q?pT9wYGW4DKab7FgyM/IImaSYinPe3WEi9Q35odmTFr7WgXwUT80Q1YUdFwM2?=
 =?us-ascii?Q?HnCELNpe+uSTG5qHo9JEF885Oy8IX8K5ec72ulA7LqyK3eqQKSqc1z5026QH?=
 =?us-ascii?Q?Ef8ojusa52CoZEYvq3VXUXzd12HgoXHAXckiF0JPH1oGZ3xQvt1QaHUdYANX?=
 =?us-ascii?Q?LAcu6X5202wtimpaahkc2EK5Hk2mDAd2jazjYYfsxKDMTwfHDVbxqxKigxdu?=
 =?us-ascii?Q?qFqqMB0n1jl20syjGL3eEgDQiYbHhCPLGwg6OAKoWJxqzODixUBsJBJIYDXb?=
 =?us-ascii?Q?D0CFWtCd8xVXj/CAKhSZ78aSpWFC8ARurVKXf4xMV2x3/BG2hvWgmyKm9yGb?=
 =?us-ascii?Q?XjS0KMd50G/uHjOF4hQgUbJ+dAugnwy4USLA4OBodsx41dZ1vF2VF+w3RgEx?=
 =?us-ascii?Q?0gru/AimthDmuAdkSR0RHYBzXso9Mi4DNtTqq1PueySoZL0HWgzmfTkoXrk3?=
 =?us-ascii?Q?eEdKg5ewBxwp2RrIEjl5CwGGmCe97wRkGATa0xXA8aojSFL5M9yuqrUrej+D?=
 =?us-ascii?Q?Z0dK43owogZzS75LpSUmGqLYZvyszriAx8mvYGxMu5FNVzfInDKL2ary0Lmy?=
 =?us-ascii?Q?3MrvByje?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96e6c747-9e9f-46fa-67bc-08d8c41b02eb
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB0071.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2021 05:59:16.9775 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mV81YCFEEsvN/P67gU8rOmShQD3rAnoWQvYAAXockGXq43oTywXAQFOLJYPIVoA0oOoeoaGVm7Lbj8k9394QHQ69aVeQ3+yUAC6NKJDQnsI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1768
X-Mailman-Approved-At: Fri, 29 Jan 2021 08:11:32 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quanyang.wang@windriver.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Quanyang Wang <quanyang.wang@windriver.com>

When run xrandr to change resolution on Beaglebone Black board, it will
print the error information:

root@beaglebone:~# xrandr -display :0 --output HDMI-1 --mode 720x400
[drm:drm_crtc_commit_wait] *ERROR* flip_done timed out
[drm:drm_atomic_helper_wait_for_dependencies] *ERROR* [CRTC:32:tilcdc crtc] commit wait timed out
[drm:drm_crtc_commit_wait] *ERROR* flip_done timed out
[drm:drm_atomic_helper_wait_for_dependencies] *ERROR* [CONNECTOR:34:HDMI-A-1] commit wait timed out
[drm:drm_crtc_commit_wait] *ERROR* flip_done timed out
[drm:drm_atomic_helper_wait_for_dependencies] *ERROR* [PLANE:31:plane-0] commit wait timed out
tilcdc 4830e000.lcdc: already pending page flip!

This is because there is operation sequence as below:

drm_atomic_connector_commit_dpms(mode is DRM_MODE_DPMS_OFF):
    ...
    drm_atomic_helper_setup_commit <- init_completion(commit_A->flip_done)
    drm_atomic_helper_commit_tail
        tilcdc_crtc_atomic_disable
        tilcdc_plane_atomic_update <- drm_crtc_send_vblank_event in tilcdc_crtc_irq
                                      is skipped since tilcdc_crtc->enabled is 0
        tilcdc_crtc_atomic_flush   <- drm_crtc_send_vblank_event is skipped since
                                      crtc->state->event is set to be NULL in
                                      tilcdc_plane_atomic_update
drm_mode_setcrtc:
    ...
    drm_atomic_helper_setup_commit <- init_completion(commit_B->flip_done)
    drm_atomic_helper_wait_for_dependencies
        drm_crtc_commit_wait   <- wait for commit_A->flip_done completing

Just as shown above, the steps which could complete commit_A->flip_done
are all skipped and commit_A->flip_done will never be completed. This will
result a time-out ERROR when drm_crtc_commit_wait check the commit_A->flip_done.
So add drm_crtc_send_vblank_event in tilcdc_crtc_atomic_disable to
complete commit_A->flip_done.

Fixes: cb345decb4d2 ("drm/tilcdc: Use standard drm_atomic_helper_commit")
Signed-off-by: Quanyang Wang <quanyang.wang@windriver.com>
---
 drivers/gpu/drm/tilcdc/tilcdc_crtc.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
index 30213708fc99..d99afd19ca08 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
@@ -515,6 +515,15 @@ static void tilcdc_crtc_off(struct drm_crtc *crtc, bool shutdown)
 
 	drm_crtc_vblank_off(crtc);
 
+	spin_lock_irq(&crtc->dev->event_lock);
+
+	if (crtc->state->event) {
+		drm_crtc_send_vblank_event(crtc, crtc->state->event);
+		crtc->state->event = NULL;
+	}
+
+	spin_unlock_irq(&crtc->dev->event_lock);
+
 	tilcdc_crtc_disable_irqs(dev);
 
 	pm_runtime_put_sync(dev->dev);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

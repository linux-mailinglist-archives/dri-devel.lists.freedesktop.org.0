Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA4530B9C9
	for <lists+dri-devel@lfdr.de>; Tue,  2 Feb 2021 09:28:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F36F6E95D;
	Tue,  2 Feb 2021 08:27:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690058.outbound.protection.outlook.com [40.107.69.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C5E189FDE
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Feb 2021 06:42:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b55yO02fANSqTl7h3nleViJNvLXe3r/EN+Z5zKvvv+3cf9qW2MQaUukBGfVty0q+nRhyt392EXAwnKm4DGYZmnSCDyQ6VX+jYUwXE+sQ3wypSgmUaQBLVdhLOxySAIx/wkst7d6eqzQlfvXbNqiwhyN+r8kWHHKDWNNkh3NLHLLUnaJgLEtAuON2GcnRc7U9KX5/EgxroWhLOfjyTL/eriOYOryByuT2xUjv8917/ag/5ySvLg44e70BH4Cf/cyaDeBgY0AJb0fzc15hI5CLuXosVEDXT5+2dPjn6FU/ieJAa+G5cF1NTQJRqFFLF0sAYtfpp4j2iM8UnbxnPhtRtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/eknxQdHXVBaLRUCRr0DRI88kFmvJ4bqif6oOE1eqK0=;
 b=ceooyOZoqBz+/cklMsOK7PiLl07148cKVtkGzBtS7mZ/X7oTm0txlFBShYDQ+Mo/yyMKdgCu9aVzpcw6soKv8hWViE6C1aBAgQKwUX3fltdjC5zzU70dGHmbKXzuc6jI9nFyn8hmKTJO/7JLvxpt2apb7+sZ+jq2mWBxmBB/w3cv22eG0+82CWhKTSNA6LcRfa/j4iOkJylhMtPPqb2hC9byKwFEz9ndVTjnnZsVHZA9yf5l2o0lKGU6m5e1OU4cNiOpHw9ZqDPm57T1jW3Q1GSpFR0koeT0ndXv+j+/Yfj+lvIYYcBzLSA24D+XIfQuJy6NYko3Nq0/wzusBftz+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/eknxQdHXVBaLRUCRr0DRI88kFmvJ4bqif6oOE1eqK0=;
 b=L4uh3r3L+bB4RmHwmzLFneULLe/+yH4D3JU+9eIT8x8Xi8NFNpO9IaZ8SPpkIgTgoMnwn8w5Dimaf+vdsrkCOE5b2HxDrgQIj7P9yVQRJ3eCtJ1KvZlYKm97q04wL5dinm6Uic+85iPbDAw4IvHhNmdGPSNka3WzGLE9ppx4IyE=
Authentication-Results: xilinx.com; dkim=none (message not signed)
 header.d=none;xilinx.com; dmarc=none action=none header.from=windriver.com;
Received: from CY4PR11MB0071.namprd11.prod.outlook.com (2603:10b6:910:7a::30)
 by CY4PR1101MB2150.namprd11.prod.outlook.com (2603:10b6:910:18::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.24; Tue, 2 Feb
 2021 06:42:00 +0000
Received: from CY4PR11MB0071.namprd11.prod.outlook.com
 ([fe80::5003:3066:e469:80a0]) by CY4PR11MB0071.namprd11.prod.outlook.com
 ([fe80::5003:3066:e469:80a0%7]) with mapi id 15.20.3784.019; Tue, 2 Feb 2021
 06:42:00 +0000
From: quanyang.wang@windriver.com
To: Hyun Kwon <hyun.kwon@xilinx.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/xlnx: fix kmemleak by sending vblank_event in
 atomic_disable
Date: Tue,  2 Feb 2021 14:41:21 +0800
Message-Id: <20210202064121.173362-1-quanyang.wang@windriver.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR02CA0222.apcprd02.prod.outlook.com
 (2603:1096:201:20::34) To CY4PR11MB0071.namprd11.prod.outlook.com
 (2603:10b6:910:7a::30)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-qwang2-d1.wrs.com (60.247.85.82) by
 HK2PR02CA0222.apcprd02.prod.outlook.com (2603:1096:201:20::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.17 via Frontend Transport; Tue, 2 Feb 2021 06:41:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 57db7822-321b-4bc9-59a0-08d8c745a4b3
X-MS-TrafficTypeDiagnostic: CY4PR1101MB2150:
X-Microsoft-Antispam-PRVS: <CY4PR1101MB2150CDA0EFC671D2FECB6D4EF0B59@CY4PR1101MB2150.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Dejbf8Oi5NFs9I5b8JHm9q8bgxVR7qrBKiGHcXRMLi2VuHsORrzKLyvkye6rn4b8A8K/uMfvM7A83iCxgcXTYxyhoQVsHqbJjbox2qVB1sNtNt3xAasEpGNAIGa9ldVvXwNfaoXDr2mLv31MEEg5juVL+AP4xp7XfjPP5/IqmQ/wNlw5plBneYII9Sx/tpgps99M4HJLfYu7tUI7Cx4KBZ9pnfMNj5SKcvK54GbweGr5ECpeg7Qb1fGgBDJMR9m8I03lK3D1w6NYP1H29+0sKrW6NxELiR1S0Wm+6QoSKiy8c4LRDwANj4vVPZ3z26CmBvRu9/ekD8UEMdDNyovaLxyRB1YQJeQVpr2qNZ2rgeu6uy8RmZEqCCPuCnq5PDkFR/anmzijzhwX6dliahHnw65GNP5+8icO7Cu8zNXrBxXyqBWHzorz2Y6ZNZ4I6MIxBOuT3KmTRZ1nl1vCUNHHzEPDxrSY0mbW8pNYlkArwxQFLEJfGfhcLEo4FxBQ7miod02pyrozujBX24YQCRYzyqua4HYborKKLMsy4fsw2Oagv9l+hn8bFkLMvdZ2N2Y+w5NrpBoNLaLFIGQlB0DFSQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR11MB0071.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(136003)(366004)(346002)(396003)(376002)(16526019)(83380400001)(66946007)(2616005)(478600001)(26005)(36756003)(8676002)(186003)(956004)(5660300002)(86362001)(9686003)(66556008)(6506007)(6486002)(6666004)(52116002)(4326008)(2906002)(66476007)(6512007)(8936002)(110136005)(1076003)(316002)(505234006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?TcL5aZRkfwEUIjWljXpUiZinwZOTBKC5KZ89f1uDFGTAgb/q48cL5ZhG895y?=
 =?us-ascii?Q?Kyoq/qdEbyyP+XPNDsrK2b0q6NcYE8s0rbQTgt2mRn8JPaNgpaOVZDNILOBl?=
 =?us-ascii?Q?KHQwCUoWnZIsxW4EqvV7oM+/yWGum3ke2AE0K7urEfuf0wsdG09FZkWG95d0?=
 =?us-ascii?Q?fbn17zRUPGhYOylAu4znmIMQVKG5WgOVLuMW24RG6p54G2UTnBmrePrPT94t?=
 =?us-ascii?Q?Bjn2UFS4oHyNSn/82Nu3meDPnyJC5+a5T09hEr9gv0exeNOCosSI8o+JO8s8?=
 =?us-ascii?Q?1e8A++wxq8jCrEr6qowdAnLU7E6vhyi9dIL4ZhG+hteus3TwQTUWJqON8DeA?=
 =?us-ascii?Q?I0Tltkp43uEsU/15i0klUQqT34V57GtzB264wZJnusA8yketM8HgjBW6kdj2?=
 =?us-ascii?Q?1BwSzVrDo4v0U+iEVhm3nrInxj02gGmqb8hhp8MIo0isfYkg/UwtcO5G4R0F?=
 =?us-ascii?Q?aMGHr769QphRbX+A3gRvjE4io4MWmefbgk3JWkiA18HiSMRP0lNC1TabDS9O?=
 =?us-ascii?Q?OYcv0TwLqN/nMFKQMgT+o2zmepPbahJICTbCMIBWOVSH/FHZw4HpTa0jMEQh?=
 =?us-ascii?Q?7O9oEvnDEYtEsCxygHxK1CLnTmeF0e8YOl8AM/6KXtGCqXVqiFqG4eEZHIXo?=
 =?us-ascii?Q?xORjfIaJ1aqEQUz71SA3Xvnh7TgLo9EQIuHGDXrFf3stRx+Tdh9VRVV94FCn?=
 =?us-ascii?Q?a8T1EYhGQjbq8HhlaUCguPJYbdH5HPfWpP7GpflTSKr2Ne7n8wpoeoXSGgg4?=
 =?us-ascii?Q?5IlXRa6LOFUh4Q5E6zKnx1lmPAWeFlQ3V2deUxVa59Lakf0jf3hRp7ArgHAC?=
 =?us-ascii?Q?Jd+8Vij6Rj5c8Gw80iXCSRhxJt8Ro7qH+6qk47KuD6DFFaPFrAaGSD05b5Sk?=
 =?us-ascii?Q?WdP1v4B2XhKJaGxaaRnWygwPrQmZ7u9UPJPmPg4ngmroBer/wGbAAjycmczr?=
 =?us-ascii?Q?Ri434xwbsrL0QS4LpszJnSQr7fIwnLouBbR3AZQiWRjp/aIVAWcS9n9fWodC?=
 =?us-ascii?Q?T8c3cKtIp+XdSKFlfmWPlJ+fjyYDTngKKHNPX+oH+BG6xbgpdAYhMQUVznaa?=
 =?us-ascii?Q?oOtUmHQ6?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57db7822-321b-4bc9-59a0-08d8c745a4b3
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB0071.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2021 06:42:00.7450 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z/NvevJXemrFLsA7VjOUG+IEF6VZkgAqjoXf3rCu3UmhbmXBm1fr1bnjtkmQsux74UwqL7kN7T6pO96FCOsKGC1qZORTj6QUavlJTKnveX8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1101MB2150
X-Mailman-Approved-At: Tue, 02 Feb 2021 08:27:00 +0000
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
Cc: linux-arm-kernel@lists.infradead.org,
 Michal Simek <michal.simek@xilinx.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Quanyang Wang <quanyang.wang@windriver.com>

When running xrandr to change resolution of DP, the kmemleak as below
can be observed:

unreferenced object 0xffff00080a351000 (size 256):
  comm "Xorg", pid 248, jiffies 4294899614 (age 19.960s)
  hex dump (first 32 bytes):
    98 a0 bc 01 08 00 ff ff 01 00 00 00 00 00 00 00  ................
    ff ff ff ff 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<00000000e0bd0f69>] kmemleak_alloc+0x30/0x40
    [<00000000cde2f318>] kmem_cache_alloc+0x3d4/0x588
    [<0000000088ea9bd7>] drm_atomic_helper_setup_commit+0x84/0x5f8
    [<000000002290a264>] drm_atomic_helper_commit+0x58/0x388
    [<00000000f6ea78c3>] drm_atomic_commit+0x4c/0x60
    [<00000000c8e0725e>] drm_atomic_connector_commit_dpms+0xe8/0x110
    [<0000000020ade187>] drm_mode_obj_set_property_ioctl+0x1b0/0x450
    [<00000000918206d6>] drm_connector_property_set_ioctl+0x3c/0x68
    [<000000008d51e7a5>] drm_ioctl_kernel+0xc4/0x118
    [<000000002a819b75>] drm_ioctl+0x214/0x448
    [<000000008ca4e588>] __arm64_sys_ioctl+0xa8/0xf0
    [<0000000034e15a35>] el0_svc_common.constprop.0+0x74/0x190
    [<000000001b93d916>] do_el0_svc+0x24/0x90
    [<00000000ce9230e0>] el0_svc+0x14/0x20
    [<00000000e3607d82>] el0_sync_handler+0xb0/0xb8
    [<000000003e79c15f>] el0_sync+0x174/0x180

This is because there is a scenario that a drm_crtc_commit commit is
allocated but not freed. The drm subsystem require/release references
to a CRTC commit by calling drm_crtc_commit_get/put, and when
drm_crtc_commit_put find that commit.ref.refcount is zero, it will
call __drm_crtc_commit_free to free this CRTC commit. Among these
drm_crtc_commit_get/put pairs, there is a drm_crtc_commit_get in
drm_atomic_helper_setup_commit as below:

...
new_crtc_state->event->base.completion = &commit->flip_done;
new_crtc_state->event->base.completion_release = release_crtc_commit;
drm_crtc_commit_get(commit);
...

This reference to the CRTC commit should be released at the function
release_crtc_commit by calling e->completion_release(e->completion) in
drm_send_event_locked. So we need to call drm_send_event_locked at
two places: handling vblank event in the irq handler and the crtc disable
helper. But in zynqmp_disp_crtc_atomic_disable, it only marks the flip
is done and not call drm_crtc_commit_put. This result that the refcount
of this commit is always non-zero and this commit will never be freed.

Since the function drm_crtc_send_vblank_event has operations both sending
a flip_done signal and releasing reference to the CRTC commit, let's use
it instead.

Signed-off-by: Quanyang Wang <quanyang.wang@windriver.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index 68cc4ffff969..ee7657a48e6a 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -1396,19 +1396,11 @@ static void zynqmp_disp_enable(struct zynqmp_disp *disp)
  */
 static void zynqmp_disp_disable(struct zynqmp_disp *disp)
 {
-	struct drm_crtc *crtc = &disp->crtc;
-
 	zynqmp_disp_audio_disable(&disp->audio);
 
 	zynqmp_disp_avbuf_disable_audio(&disp->avbuf);
 	zynqmp_disp_avbuf_disable_channels(&disp->avbuf);
 	zynqmp_disp_avbuf_disable(&disp->avbuf);
-
-	/* Mark the flip is done as crtc is disabled anyway */
-	if (crtc->state->event) {
-		complete_all(crtc->state->event->base.completion);
-		crtc->state->event = NULL;
-	}
 }
 
 static inline struct zynqmp_disp *crtc_to_disp(struct drm_crtc *crtc)
@@ -1499,6 +1491,13 @@ zynqmp_disp_crtc_atomic_disable(struct drm_crtc *crtc,
 
 	drm_crtc_vblank_off(&disp->crtc);
 
+	spin_lock_irq(&crtc->dev->event_lock);
+	if (crtc->state->event) {
+		drm_crtc_send_vblank_event(crtc, crtc->state->event);
+		crtc->state->event = NULL;
+	}
+	spin_unlock_irq(&crtc->dev->event_lock);
+
 	clk_disable_unprepare(disp->pclk);
 	pm_runtime_put_sync(disp->dev);
 }
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

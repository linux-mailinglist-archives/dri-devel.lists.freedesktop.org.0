Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9875D314BDB
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 10:39:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96A566EAE2;
	Tue,  9 Feb 2021 09:39:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2064.outbound.protection.outlook.com [40.107.223.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B00E6EB5A
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 08:25:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gRE9A+E2m+dKE6Uvtn4RytAw1i9Djv1kkZMw33zP8M0ncYduAL5nBMeZDphmn/9l4YRXLE1bDmjB4F3NIL2PhMCHbjWDNKswhTGlYhzl+FaYZyLnyJcaJ/qlXjlxfqgQ4EBrSHGTgMpL3W1utt11A2zO6VTGtzu/u2CUB1APq+BxJC5C3l4P5F+hjHft+QwE/9DeVPIv5QVwgV61eyUcWj+H3nyhJS8aXsQqELh9QxoSDg2WjUtzvh9EbSnDJ6gNSl9YMp43b6gv5C6X8dO0jn6iBIvUdmt440Se5DIrroc4Mw+EsRY5V9plESr0r71XBG8GnISIveqxxF4TZbc/gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PgAwdFPlQcgy+hFUXRHYAY2i6Ns7EUHizDk/+otmgZE=;
 b=mmaDA0t9C+DTBdTbUJeKkkY6+Wk6CD5Rt5cCw3j839IaqmWErKi3YcE94bkQxj+PD+xtStlpvY2JAp0+xWyYf2A+L1MlsrgX5ruz2DaWCvJzAP+fndb3ePGud35B3DyvYoWxl7hwQTnKE1gq/p2epqi+C2iM2oUq9QF4zzbv22BZ//DPS7mgvYSfiuHIrh89dc8y3L8hO2wPyuCesNAeyX3/XXuGuQL0loOqXEbtLGaWQXbVm4bxYU1blmgNvkaGf7hXKCHMNyh3+ab70VApEvxfdaWnG5tHray8fLD36vw8/6kfzl+VkvXOp2EivIkgRM8/g0UyMVZPWJEo8wkilg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PgAwdFPlQcgy+hFUXRHYAY2i6Ns7EUHizDk/+otmgZE=;
 b=EsXqZRgz5a3k/0ZNdvRvvwReKLITEGqptalJskfcbYxr2gbYUp+lpZ4Ern63Jh8FzxDTdq9HnkRpRU2u74VzBNbhk2jnBNvYadVF/6+sl178cVcSdkLC8FcDzyk0jNtMFpsJ+BNhBTojR1ZkPQpGCyfPO7N6HMPFuXSwEC/TmbM=
Authentication-Results: iki.fi; dkim=none (message not signed)
 header.d=none;iki.fi; dmarc=none action=none header.from=windriver.com;
Received: from CY4PR11MB0071.namprd11.prod.outlook.com (2603:10b6:910:7a::30)
 by CY4PR11MB2040.namprd11.prod.outlook.com (2603:10b6:903:29::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20; Tue, 9 Feb
 2021 08:24:58 +0000
Received: from CY4PR11MB0071.namprd11.prod.outlook.com
 ([fe80::5003:3066:e469:80a0]) by CY4PR11MB0071.namprd11.prod.outlook.com
 ([fe80::5003:3066:e469:80a0%7]) with mapi id 15.20.3784.027; Tue, 9 Feb 2021
 08:24:58 +0000
From: quanyang.wang@windriver.com
To: Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [RESEND][PATCH] drm/tilcdc: send vblank event when disabling crtc
Date: Tue,  9 Feb 2021 16:24:15 +0800
Message-Id: <20210209082415.382602-1-quanyang.wang@windriver.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR02CA0150.apcprd02.prod.outlook.com
 (2603:1096:202:16::34) To CY4PR11MB0071.namprd11.prod.outlook.com
 (2603:10b6:910:7a::30)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-qwang2-d1.wrs.com (60.247.85.82) by
 HK2PR02CA0150.apcprd02.prod.outlook.com (2603:1096:202:16::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.19 via Frontend Transport; Tue, 9 Feb 2021 08:24:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c50f1c29-3424-49cd-cc7c-08d8ccd42ff3
X-MS-TrafficTypeDiagnostic: CY4PR11MB2040:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CY4PR11MB2040D20FD968B50295B98529F08E9@CY4PR11MB2040.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:411;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IX+MKrm9vp0+SyAVn1afzDq8w3mgMuZIMcDr/EI3Lh9ox+CB7oIS453NlwvrSvAZTkehYuVafq5/dNl73tqSvA1JvH4gokgFRDdVh1mD/zQTUNzn9LAtkR61y4tp02proLm4UW3FTy8PxO5PVXF/S4CpDSQwA4oqcdR72S8GjdPiCC/78F7RXFMPaLfwcOGfDOeyKHbyT5VKluwsSpo9zsrWs2KOB/vvJ+InY0JeUlWMJepPFmPKslu1T5PFJ4FyzxBqqJsp0MubXzD9sOlb2B2J8ynFk/28Z/71N+Yv4KJJOh9J7EyFaiKrjrbtS8lDFDgASt6QzFdBQWJXcHtW3RekJBGOhqkqK8YrVpaM8AwJ2PUEmKAoStG//7GP47mpEzk2AoSRscuUxwsq9IAx2xS8kz/y7Y+alxQ6qLScSJ1GLZaqBAVPB8I5PDtQ4/ekuObxTtaCRIvWRh7Np3+z0G9gdsLmUV2kprSl1oGSW/7YLcla4xb8pUalW5yJ3qoj7gxCWX7n3U5ibwLaYVfkcg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR11MB0071.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(376002)(346002)(39850400004)(136003)(2906002)(5660300002)(16526019)(66476007)(2616005)(66946007)(83380400001)(956004)(4326008)(8936002)(186003)(26005)(6666004)(6506007)(1076003)(6512007)(8676002)(36756003)(6486002)(316002)(107886003)(478600001)(9686003)(52116002)(110136005)(86362001)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?98ds53WBfDnC+RE94AJbk7lq+H7ZciRiDjaOopPob3LAwSCQRVRl8ugVZtpW?=
 =?us-ascii?Q?ce+eE9oSqQAetxsskE3++VbL36a1vV7auhCU6tdjbA5msmHmrdmISyGP7qkc?=
 =?us-ascii?Q?K1URky7bS5HYbjs+2CjwxOjsbjntGkVES+Gz01BFEyR5WpcNe5j46OrHi8Nz?=
 =?us-ascii?Q?UCZLqq+W7gVx+wmV14qF5K1R2fZZQi1QE8/a6oSajiosMVKd4wGA/YxI3e2B?=
 =?us-ascii?Q?akmoUoGD8AhsD0VZSgmtAZdBNJ/FDTAz70UcjbY101mddXe0x+cHVKaWV9hQ?=
 =?us-ascii?Q?1XoGRr91SCwkcmm3fSe2IUDnwKmtUhflTUqMaAictbzVIsAhuI/YB5PW0STK?=
 =?us-ascii?Q?9NkbHd5BSnt1Pr2bYhup1MhdKh6FiL1yhJRapRzQXkN/FzfKGjn998MrnyOO?=
 =?us-ascii?Q?C9n6WnJh6f61mzSDaQ2Uji2c6So9IoWOOcCebvY7o/U4XNtpc/cP5BPgdWsx?=
 =?us-ascii?Q?iMAnQ9LRU5kP0m5UReH6ypZCfZ9SkADwksvoCpUYUJbGz4fBclm4Tu4ElX20?=
 =?us-ascii?Q?kyzFlBf7Gz9gXKCKHKJ/VSzt99SKBSv3m3rYglIEUEWOpOJDA8b1IpG3THNC?=
 =?us-ascii?Q?ChHlzEbyCq2+WUujl4vgaZNgq4l+ms2VCxgncPJjdBn4UXmdxgX/0cdOmNMs?=
 =?us-ascii?Q?u/WBCVpc9mgV64jLfE7RZocxDf6zyOsmwxy8ri2NXaG3Vn5sYfSBlFVOK8ae?=
 =?us-ascii?Q?RTsNwI3uKG8nlZ8cFKlTKdTOa2m8Zkpl/dZETfqbtnKfsfoI12Iv8YCRUsXR?=
 =?us-ascii?Q?ST3bKYz9XtiIM0PmcdWoqxh6zAGHhTyn/Fj2hby9MsAkmtkHS4vleEJAypQj?=
 =?us-ascii?Q?I1kGTaK2h1hs/j76cclbSRvJtB+d9y0NDF+WHZ1CFtZ7B+XgN36tTdP7TEOl?=
 =?us-ascii?Q?d1vv5ITS7h+r1P+91Fbx9eOw6QFHTjjjfwDgB3XwYqmh52FKXB1PUVKWgCzj?=
 =?us-ascii?Q?py8qGK4DAOzXQoqDbkTlvGvWcub1Eqbx5JK20aJzHApv5hu24rMAIfS2Pv+H?=
 =?us-ascii?Q?kqOZr8FYuLmfSL2jqmAzyTv+Y0t/MrexfKsmt0R41+zMFzSVNLhFUpHTjJNM?=
 =?us-ascii?Q?WVHt3weff8Fgq6vayM4N7S0TAu5Qrac6GHcsaO822oOV3b64nP+5vZ/RvG/x?=
 =?us-ascii?Q?bTx8SytsDAT1vAH+c0lPlmw1UG+6pBmgxrc8yhxdB31I64E0qz3OI7tdofW1?=
 =?us-ascii?Q?6uOJf1T9hd2Ea7+/KVtOuUPUp4oo07n9yLXhD/WRwNhRF5o+xK9h7vIIzgFW?=
 =?us-ascii?Q?acta7aCDwIi36AIHpRD3Dr5lYIApg0XglpDTS7/4IKBjt+YjrvdVrHC9wfAb?=
 =?us-ascii?Q?fpp1p8rx0qGL2qkTwkB9GBaK?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c50f1c29-3424-49cd-cc7c-08d8ccd42ff3
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB0071.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2021 08:24:58.4353 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xo9uqi5KoxxNRzm9YvVochWKs0zR01NI8cVPsx+wMKTleSEVJdEwMnliu6GxcfV3IPjnhHf3O2ktxWk51cL51Zd6l9l7pGUEEJqGHz1XoGo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB2040
X-Mailman-Approved-At: Tue, 09 Feb 2021 09:39:45 +0000
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

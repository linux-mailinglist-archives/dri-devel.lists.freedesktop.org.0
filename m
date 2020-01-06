Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FCA1320F0
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 09:05:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51C0289C1B;
	Tue,  7 Jan 2020 08:05:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2136.outbound.protection.outlook.com [40.107.93.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84A5C6E4FE
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2020 22:42:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZEsmFxNUbGsC4mYWYN9VPvuGqTDTUjwTny3j8IC1s+nStTwUelpuLKLaAmKzzGbUINRwhtS1yU5QFpaUFgF3Bn7SErl7euT4qkEKtjYPr6jkdXVn2o+l88W1UA9tA/fOMtRHz7qbBKTMBeVv9myMJI5cEKuvOcrksTJXlT7VJmTRYQSY6f6D6l/lREd8JrkabCjalzVmHQ48+HqtJPvsSwLt8inmltpx592CpTd23TUKj0045ZTfPkGqwMdqoP3D5t94RDo0COhkoOVLrd9f8XiCf98oLMhnYjDMDM2K0c/fnTNWb395nvxDKQbcVEeUrjOrYuKDwxAEh12Rer1Aow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XqihmGT/Ddp4syLmaV/6WjXKlZHIPoBWdnCGUQwsibw=;
 b=P7TI1LlHEtdn4XB1XL2bTj1q9Bi0sQk71Vjj6UoUWRCKMoFbQ+2QNUdhbR2h6qsC0C1COwr7mPSoaQnlIssYmZ0DHSCVNjeCzwfDMbAf4pvYd3Rn484ctfoVNHLfyEdilRVurV8r4FpIxclREslKF4/bVrlJYUoX3//73RYBEmWUV2gyC65cAhTpv5j9ctgIvB+5iGlT5OHJCWnSMrY9qzJtuHbOFUIDQfGTWh4+SLYzQuuX1J1apr5u1rOUugm7ArMEri4qtxE+bWC1KrMXGO9AlKVzd1J1s9vW6tq5oB51Zxd0xSodip75LpH+IiN3NRCrAOlIR07y1LrUof4LeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XqihmGT/Ddp4syLmaV/6WjXKlZHIPoBWdnCGUQwsibw=;
 b=g6DF9IEQTgco9i68jdCuRcrtpOk6y22OBKrInKYObPUIe8ekBPuv4pSPOg5g4YJqWLIiK1wla63eOeyKyac8Jjl2PUyOBeKF+MjIt69+Rz8yVx7gJ6OmirQtVxFzhY6J5d2VBgvn2qyp652mIcV0Y6HhRNZzei5xKL6iUKYaKMw=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=decui@microsoft.com; 
Received: from CY4PR21MB0775.namprd21.prod.outlook.com (10.173.192.21) by
 CY4PR21MB0182.namprd21.prod.outlook.com (10.173.193.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.4; Mon, 6 Jan 2020 22:41:59 +0000
Received: from CY4PR21MB0775.namprd21.prod.outlook.com
 ([fe80::6155:bc1d:1d39:977b]) by CY4PR21MB0775.namprd21.prod.outlook.com
 ([fe80::6155:bc1d:1d39:977b%8]) with mapi id 15.20.2644.002; Mon, 6 Jan 2020
 22:41:59 +0000
From: Dexuan Cui <decui@microsoft.com>
To: kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com,
 sashal@kernel.org, b.zolnierkie@samsung.com, linux-hyperv@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, mikelley@microsoft.com,
 Alexander.Levin@microsoft.co
Subject: [PATCH][RESEND] video: hyperv_fb: Fix hibernation for the deferred IO
 feature
Date: Mon,  6 Jan 2020 14:41:51 -0800
Message-Id: <1578350511-130150-1-git-send-email-decui@microsoft.com>
X-Mailer: git-send-email 1.8.3.1
X-ClientProxiedBy: MWHPR01CA0037.prod.exchangelabs.com (2603:10b6:300:101::23)
 To CY4PR21MB0775.namprd21.prod.outlook.com
 (2603:10b6:903:b8::21)
MIME-Version: 1.0
Received: from
 linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net
 (13.77.154.182) by MWHPR01CA0037.prod.exchangelabs.com
 (2603:10b6:300:101::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2602.10 via Frontend
 Transport; Mon, 6 Jan 2020 22:41:58 +0000
X-Mailer: git-send-email 1.8.3.1
X-Originating-IP: [13.77.154.182]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 77e1d7a6-04bc-443f-2410-08d792f9a3e3
X-MS-TrafficTypeDiagnostic: CY4PR21MB0182:|CY4PR21MB0182:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CY4PR21MB01827FB5E7A8BEEF2CF0828FBF3C0@CY4PR21MB0182.namprd21.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 0274272F87
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10019020)(366004)(39860400002)(376002)(346002)(396003)(136003)(189003)(199004)(5660300002)(966005)(107886003)(10290500003)(2906002)(3450700001)(478600001)(4326008)(6512007)(316002)(186003)(6486002)(16526019)(26005)(6666004)(956004)(81166006)(81156014)(8676002)(2616005)(8936002)(6506007)(86362001)(66946007)(66476007)(66556008)(52116002)(36756003)(921003)(1121003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR21MB0182;
 H:CY4PR21MB0775.namprd21.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EsU4YkYSehZH0EZKeOkrGwlSwmTRhSgAgnNaTJBorr+q4B/IhiTd7JDVoKjgIvacmBI+epUs4y5IAo4B6BiLC2+NXvb67vKJDdtcDDzbOHkMf3NoLHT0FlGr0wVZ7c9zR8eRMOmYhMXcb7h3bCDLA9wkuOEY0b1jD0CCE7VpgeENQZSag96jXDRKYm6JpSlecYiKxxsipAFEj/nWgrcfxySDUKlBIXjDGldZZW7hMVDueDT1JptVFa4bDqeKICz95Q8aBzy5R8V6fuM0c//7Kkw9hshIiWa9pDtqp2mTdal5Dmtuubct2MENq5im2u207JDw1kXvMUQpz6LI4eIy0cLgBafgdztFObmt+K169ZowsfmsL9oocJ360Y4Uj7Q/hHGyisgCh7GVOUYtiTBWGfAIi2A6DlPTha0Uiz7aXatvRbQZHCrdiG/d+CeArK/xdfrDi94kag5zeEIhHOlozJq5NXV8+RtoWvZ2FOh2GkAUXNxXLl510bZ0isMVfeemvrc1h8pcCuSpZ3XPs9VYjGYpZduwIgPagFId4LC+c/jIMIh8hDeZE4alqHN5A+/3XkN2oFtsXAExAbbz9wRBOg==
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77e1d7a6-04bc-443f-2410-08d792f9a3e3
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2020 22:41:59.2797 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f9tuIkEfQY3XjOdu7cOW0lgxs8B4xXSgL8wtNuamY73Q9bVgfk7ihUA8LfDM+xT0XEl+TiBB9Ogwd9LHITgQRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR21MB0182
X-Mailman-Approved-At: Tue, 07 Jan 2020 08:05:10 +0000
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
Reply-To: decui@microsoft.com
Cc: Dexuan Cui <decui@microsoft.com>, weh@microsoft.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

fb_deferred_io_work() can access the vmbus ringbuffer by calling
fbdefio->deferred_io() -> synthvid_deferred_io() -> synthvid_update().

Because the vmbus ringbuffer is inaccessible between hvfb_suspend()
and hvfb_resume(), we must cancel info->deferred_work before calling
vmbus_close() and then reschedule it after we reopen the channel
in hvfb_resume().

Fixes: a4ddb11d297e ("video: hyperv: hyperv_fb: Support deferred IO for Hyper-V frame buffer driver")
Fixes: 824946a8b6fb ("video: hyperv_fb: Add the support of hibernation")
Signed-off-by: Dexuan Cui <decui@microsoft.com>
Reviewed-by: Wei Hu <weh@microsoft.com>
---

This is a RESEND of https://lkml.org/lkml/2019/11/20/73 .

The only change is the addition of Wei's Review-ed-by.

Please review.

If it looks good, Sasha Levin, can you please pick it up via the
hyperv/linux.git tree, as you did last time for this driver?


 drivers/video/fbdev/hyperv_fb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/video/fbdev/hyperv_fb.c b/drivers/video/fbdev/hyperv_fb.c
index 4cd27e5172a1..08bc0dfb5ce7 100644
--- a/drivers/video/fbdev/hyperv_fb.c
+++ b/drivers/video/fbdev/hyperv_fb.c
@@ -1194,6 +1194,7 @@ static int hvfb_suspend(struct hv_device *hdev)
 	fb_set_suspend(info, 1);
 
 	cancel_delayed_work_sync(&par->dwork);
+	cancel_delayed_work_sync(&info->deferred_work);
 
 	par->update_saved = par->update;
 	par->update = false;
@@ -1227,6 +1228,7 @@ static int hvfb_resume(struct hv_device *hdev)
 	par->fb_ready = true;
 	par->update = par->update_saved;
 
+	schedule_delayed_work(&info->deferred_work, info->fbdefio->delay);
 	schedule_delayed_work(&par->dwork, HVFB_UPDATE_DELAY);
 
 	/* 0 means do resume */
-- 
2.19.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

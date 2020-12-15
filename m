Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E97652DA8F5
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 09:07:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0FF189C6E;
	Tue, 15 Dec 2020 08:06:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2088.outbound.protection.outlook.com [40.107.92.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 074006E0D8
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 06:30:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tk15uduuC35kn2GeV1SFwu2JMLO5TiUnGxNzvcTsl1Cp1Jvd78Rn/9CZ2qn3k5Rln30SDu9dMB/1SLLd9eSZ2kdANCoos+nOqUFP1xhTWlNJJ/ENVnQMOBJfBcQUq7FLcZcDNfd803in0NVLNX6Un6dJDPPMQsARh00qw7alAZSjAwy1UG3tINXFLH/03pMGdB85XIuNpNX2yfjB+ykXeEomfP298+ao5psg/AtCX7oXpatQNi62eiAUjDEtFTc9UwcTP5s2vBMyBKCJEmKydwhDpcYyd04Bd/m9hrGUEqxgXzqI3jqEgF6GMMavRoz6Nq1KqfSS8Ire5KutQ3/FQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VReHqTbmu11ldRC7J0cleeD3SNqlSuwvqh1RcpX4UBY=;
 b=EU9amwoPHeHH4+G26wal7Rhhnj/+0Qwd1z+ofDsqWvtS2nnH8RDwcdaoMEcWDI2yFAv+unJO4TkAH+PAZNbg1Zu7SikcXY00dUY7cqFshyBypiJAd6+kMU2ZKRmGuQkhF1lDh0M0pFxD0Mh29SFrABrn3fSTJPyMMOx7yoIoT5QU5Y6ZxzXkaCXQs0M5TobHGybt7UslA+ZSj3UvE/nhtovncg9A7Uru0Tm8ZHMNWWSRUWguTCJ4N/cfplOeOCZd22IV3jfID0u52jV0SW5orWTrMPoPrWPRYgl6MRn8/8LTYqSBRCYJY76DyH/icMygxxeWCk9OBkVDT/Vyrm1fkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VReHqTbmu11ldRC7J0cleeD3SNqlSuwvqh1RcpX4UBY=;
 b=Q6hNXdIssRYhgMG7NVavyfOQVVjwxykhNPwEWXUuSmoKkmnXNnISLIFo1QdTrNXOudRAZID/oF5G0PJgIJNgGwXHfeapwHqLG0xWO1uK7O+4itHMn2FP3GHeOrXke/03DdJL2mE1WTHdENyGLTSXCyQp7qRvT2OYyDA0ypYTT34=
Authentication-Results: samsung.com; dkim=none (message not signed)
 header.d=none;samsung.com; dmarc=none action=none header.from=windriver.com;
Received: from BYAPR11MB2632.namprd11.prod.outlook.com (2603:10b6:a02:c4::17)
 by SJ0PR11MB4877.namprd11.prod.outlook.com (2603:10b6:a03:2d9::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Tue, 15 Dec
 2020 06:30:38 +0000
Received: from BYAPR11MB2632.namprd11.prod.outlook.com
 ([fe80::94a4:4e15:ab64:5006]) by BYAPR11MB2632.namprd11.prod.outlook.com
 ([fe80::94a4:4e15:ab64:5006%5]) with mapi id 15.20.3654.020; Tue, 15 Dec 2020
 06:30:37 +0000
From: qiang.zhang@windriver.com
To: b.zolnierkie@samsung.com
Subject: [PATCH] udlfb: Fix memory leak in dlfb_usb_probe
Date: Tue, 15 Dec 2020 14:30:22 +0800
Message-Id: <20201215063022.16746-1-qiang.zhang@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: YT1PR01CA0059.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::28) To BYAPR11MB2632.namprd11.prod.outlook.com
 (2603:10b6:a02:c4::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-qzhang2-d1.wrs.com (60.247.85.82) by
 YT1PR01CA0059.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Tue, 15 Dec 2020 06:30:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a7322126-73a4-49d7-6c85-08d8a0c2efb5
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4877:
X-Microsoft-Antispam-PRVS: <SJ0PR11MB487736055E6C84E89BD3D1FAFFC60@SJ0PR11MB4877.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1751;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fsw4ddmWOGeLnVoE44YOnvpUQZwNKI8q/eRM7crf9aG0EbgRuhb5YUapqMoejnVfDfKq42xt2u/pGNNgvW+Kg3XY+qTwfXun7j+EKn+FNWv9lPmMhV0nJ3MzZmFRABm4FZf8otUcvzedgym7nP9x3reNmVdInW+HGR2wzuZjjjSYYQ5THsdeg4mHsHC6tAJ9tUH9ZP5FOBkVQJDTPfVPPL6S2LMCGuykvTiIuFJnN78p20lQiuqfN4FYh+YesE1C6SWufdd71GN5Q7hHnfrM1BZ4MaqJQBg00koFwH7gArqg2TLubYlBEKR06t+3JwD8zN88/N/cHqEz38vkX5EBQgWH45/nlW0jG/wcaYYVEgywMy+Ly6k6sj/e4POFrlyl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2632.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(346002)(136003)(86362001)(508600001)(66556008)(66946007)(8676002)(66476007)(83380400001)(6916009)(5660300002)(52116002)(8936002)(4326008)(956004)(6512007)(2906002)(26005)(6666004)(6506007)(2616005)(186003)(6486002)(1076003)(36756003)(16526019)(9686003)(34490700003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?i0J0QdyCQWNxQVMo/qkQ7dTyZgHhVh4LhYq5vViVL1SNya27TkU2aCB0COI1?=
 =?us-ascii?Q?6CMUTFGMMRDk6oQOHKmh3e74gvDx6whxDLIhkOm03tM7eFmxf2LkqW/9IUXT?=
 =?us-ascii?Q?KY6zaKkDJHhznhqChIIsI3bxU0eg90YnKTAgx+e4IDyVh2t2EZmGJGGtnxMu?=
 =?us-ascii?Q?m6zMy8EhyLkU7JGtp7sQPoIjXNYlGn4fu3IMwNbqHSFBsduwWgnSrNF1G3gS?=
 =?us-ascii?Q?7unUtjp+PTdGcWGPQ3GzROViqNuHkFQbDFdIwvtRBdjr6kr/OkcgzewcTHz7?=
 =?us-ascii?Q?i0GJsd6EUOoUTQwWLc0BOVaEWwIGFv3i4k7z2bYcY0WUfJFqTxss0OXL6MoQ?=
 =?us-ascii?Q?1sxkj/OL+xHp15iT+vvmkrTjk4t3M/he7e0RSt7Aqdsngmli49KKY+ku1YFy?=
 =?us-ascii?Q?6n/AATezIMBob4xvyaEwP9KDtsRNxsTSU4v/BlZapYQCN+FPcjpnfQ4y0bMB?=
 =?us-ascii?Q?4UaU4jmqoBdSTAmpSXW54QwFYJfDd53qPZPPw9iUeBxxjb63xyOQtA80mX+e?=
 =?us-ascii?Q?cnQ9qC9M/roeoxLHH4DA/58//T4lxPJt4P+Ye4mgiYq/eD+t8VnCjDZsgMi0?=
 =?us-ascii?Q?ULgtddkSq1EU8fn20luedPgS5/t4UPK/Z+IsaME0V7ucfazNCpx90Vvuu+Hi?=
 =?us-ascii?Q?PHp1KwxdDTWPUTZ8zWfdp7ODlARHtcvwNJYoy9MZlaFGxx/0fvNxZOZmiqti?=
 =?us-ascii?Q?zhESsQbyrTpS40aU/3bBhthy1ukCx5bT6/bIXdinDuHF7BN+AmQ8IXUgyXPs?=
 =?us-ascii?Q?fzL5y7cjOdRn1Rg5BkzwLLfPA1z2V8VqIDYlRsIlK2SJXkVlENonzR07qhGY?=
 =?us-ascii?Q?BYOPpARXgiv0m7uvUGt+K9yE2miZUwFjdBKxkgycA0o/6QFvD+8LBYNVo+pA?=
 =?us-ascii?Q?JjRiZXWgUkgr7uWZaHYjyQdtPhOT9DCJ0ukvTL3tgvxoljEb+I/d1QOJdVzZ?=
 =?us-ascii?Q?Prc071dIJ28jgszYOdcuW20CH2oI2r6sFzeQDnmrn6s=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2020 06:30:37.6410 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: a7322126-73a4-49d7-6c85-08d8a0c2efb5
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a6vSLZGU7PGYZkaUR/CbkBghohhI687RmiFhnmi0Glz1EIt2VclpzMx9ji342Sf62mUN2h0fMOEUW0PzmpACK27hqgNn0mTy4yWf0HqP8O8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4877
X-Mailman-Approved-At: Tue, 15 Dec 2020 08:06:55 +0000
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
Cc: linux-fbdev@vger.kernel.org, mpatocka@redhat.com, bernie@plugable.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zqiang <qiang.zhang@windriver.com>

The dlfb_alloc_urb_list function is called in dlfb_usb_probe function,
after that if an error occurs, the dlfb_free_urb_list function need to
be called.

BUG: memory leak
unreferenced object 0xffff88810adde100 (size 32):
  comm "kworker/1:0", pid 17, jiffies 4294947788 (age 19.520s)
  hex dump (first 32 bytes):
    10 30 c3 0d 81 88 ff ff c0 fa 63 12 81 88 ff ff  .0........c.....
    00 30 c3 0d 81 88 ff ff 80 d1 3a 08 81 88 ff ff  .0........:.....
  backtrace:
    [<0000000019512953>] kmalloc include/linux/slab.h:552 [inline]
    [<0000000019512953>] kzalloc include/linux/slab.h:664 [inline]
    [<0000000019512953>] dlfb_alloc_urb_list drivers/video/fbdev/udlfb.c:1892 [inline]
    [<0000000019512953>] dlfb_usb_probe.cold+0x289/0x988 drivers/video/fbdev/udlfb.c:1704
    [<0000000072160152>] usb_probe_interface+0x177/0x370 drivers/usb/core/driver.c:396
    [<00000000a8d6726f>] really_probe+0x159/0x480 drivers/base/dd.c:554
    [<00000000c3ce4b0e>] driver_probe_device+0x84/0x100 drivers/base/dd.c:738
    [<00000000e942e01c>] __device_attach_driver+0xee/0x110 drivers/base/dd.c:844
    [<00000000de0a5a5c>] bus_for_each_drv+0xb7/0x100 drivers/base/bus.c:431
    [<00000000463fbcb4>] __device_attach+0x122/0x250 drivers/base/dd.c:912
    [<00000000b881a711>] bus_probe_device+0xc6/0xe0 drivers/base/bus.c:491
    [<00000000364bbda5>] device_add+0x5ac/0xc30 drivers/base/core.c:2936
    [<00000000eecca418>] usb_set_configuration+0x9de/0xb90 drivers/usb/core/message.c:2159
    [<00000000edfeca2d>] usb_generic_driver_probe+0x8c/0xc0 drivers/usb/core/generic.c:238
    [<000000001830872b>] usb_probe_device+0x5c/0x140 drivers/usb/core/driver.c:293
    [<00000000a8d6726f>] really_probe+0x159/0x480 drivers/base/dd.c:554
    [<00000000c3ce4b0e>] driver_probe_device+0x84/0x100 drivers/base/dd.c:738
    [<00000000e942e01c>] __device_attach_driver+0xee/0x110 drivers/base/dd.c:844
    [<00000000de0a5a5c>] bus_for_each_drv+0xb7/0x100 drivers/base/bus.c:431

Reported-by: syzbot+c9e365d7f450e8aa615d@syzkaller.appspotmail.com
Signed-off-by: Zqiang <qiang.zhang@windriver.com>
---
 drivers/video/fbdev/udlfb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/fbdev/udlfb.c b/drivers/video/fbdev/udlfb.c
index f9b3c1cb9530..b9cdd02c1000 100644
--- a/drivers/video/fbdev/udlfb.c
+++ b/drivers/video/fbdev/udlfb.c
@@ -1017,6 +1017,7 @@ static void dlfb_ops_destroy(struct fb_info *info)
 	}
 	vfree(dlfb->backing_buffer);
 	kfree(dlfb->edid);
+	dlfb_free_urb_list(dlfb);
 	usb_put_dev(dlfb->udev);
 	kfree(dlfb);
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

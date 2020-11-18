Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 606902B77EE
	for <lists+dri-devel@lfdr.de>; Wed, 18 Nov 2020 09:02:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C66BD6E408;
	Wed, 18 Nov 2020 08:02:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2097.outbound.protection.outlook.com [40.107.237.97])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D1BC6E0AD
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 00:03:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HgOdD8zDe8PBzI5GvwFj3IRYB0Zl1W6JdFvAlELH6CVGO/vWRXa4+pQhxxVu23myfpDSwv/Qk7/dk//W/g1ea1VzsZpr4DNWrd7fJAL5LUpVcti3DpYcDGtHKKUpbUdAEMpUD+MKT8jxvgnf6mQB4tY/5GJ84orieTmTXe5+gmo9meGFErLirpOtl0eDD0nMPEnrPXjh25GHcf/D1QpteEtXKN34CwIQ8ma7Axyelk/2B4yg0D1qzX5T+liPNbCdputDnAVIL/yRX5wixGZkYrbvcn5h4B1QbeHejB1p88fEkYBpeZZhRCVnuaOsg5yu4PmEUSYm4N/+idN41up8aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jvMW6wzYI/FmyuFgP9Gc3MpmJdQI5xD3g9VMtlRwDkM=;
 b=jFmLUQm4agPS56hjkXP3kNeVSryr8S+VDpq09hm3LDVuVe+BzuoyPLyXu5JRwsp+RlWRpZxZfTGzXWfPFlQkXAid2JEzHrOKY8xovgfyoJN92uj+8ngili6h+fbgHx2yWMFKPCSG2/ySzVUk6+c1fbevIhN/F2adTSBbBbHloQDxEuRtgoNrfx+3EyyUMqf5CEHnZpUoHfljRTC0Wc3TY862o/HqgAG+hA7iFkG9mqovGZkn06rmvBocX3ouKOl9+lImt1emOVTd7iArBOp0xnPPvhbShethe0gAiP5YhW+KOPpxQ+zN744HJf9GKZPVPY3U6QRRBmrUl8LjxGi4Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jvMW6wzYI/FmyuFgP9Gc3MpmJdQI5xD3g9VMtlRwDkM=;
 b=DmdOfL322i/5v5PjdsmPVXqGBm5oQUxS4LN6AikNpRV1dWvnj2GIhqT0+RnG4jUyN4Hr8kz1unX8sRyDZgVmfQURB53NlzXqI2M3iTS0BinENSkv4oLewg2Yj9c/GRp+GZsHA3o0hgm3ovFL8N0QcK2XJKgE+xbWnt/SrxqhZJ4=
Authentication-Results: microsoft.com; dkim=none (message not signed)
 header.d=none;microsoft.com; dmarc=none action=none
 header.from=microsoft.com;
Received: from BN6PR21MB0162.namprd21.prod.outlook.com (2603:10b6:404:94::8)
 by BN7PR21MB1714.namprd21.prod.outlook.com (2603:10b6:406:b9::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.4; Wed, 18 Nov
 2020 00:03:49 +0000
Received: from BN6PR21MB0162.namprd21.prod.outlook.com
 ([fe80::1557:a785:28fe:ea8e]) by BN6PR21MB0162.namprd21.prod.outlook.com
 ([fe80::1557:a785:28fe:ea8e%8]) with mapi id 15.20.3611.004; Wed, 18 Nov 2020
 00:03:48 +0000
From: Dexuan Cui <decui@microsoft.com>
To: kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com,
 wei.liu@kernel.org, b.zolnierkie@samsung.com, linux-hyperv@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, mikelley@microsoft.com
Subject: [PATCH] video: hyperv_fb: Fix the cache type when mapping the VRAM
Date: Tue, 17 Nov 2020 16:03:05 -0800
Message-Id: <20201118000305.24797-1-decui@microsoft.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [2001:4898:80e8:3:15de:d019:8771:286b]
X-ClientProxiedBy: CO2PR04CA0169.namprd04.prod.outlook.com
 (2603:10b6:104:4::23) To BN6PR21MB0162.namprd21.prod.outlook.com
 (2603:10b6:404:94::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from decui-u1804.corp.microsoft.com
 (2001:4898:80e8:3:15de:d019:8771:286b) by
 CO2PR04CA0169.namprd04.prod.outlook.com (2603:10b6:104:4::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Wed, 18 Nov 2020 00:03:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7e371bb6-f79f-41aa-e122-08d88b556c85
X-MS-TrafficTypeDiagnostic: BN7PR21MB1714:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN7PR21MB1714326024BC0592B9560E5BBFE10@BN7PR21MB1714.namprd21.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kEJ9UR8OP8RX0Vc2Gk8lf3cmYLApOlj2sOULfjprGyB+x2AeLhdBhEETRUWbqzb9nD0rGFuxW9xZZ3w01hlbf4Ivg2ZTaxDPptFTxnbWtcc9ijJup0tR09arx2Ely++QzUcJMF2ClQdwNwUFBkcMKWVKxFK9lEjTyqGuCqRRz7JU0QLqbO2Th3hKsUDkOuIcyrT9uVtdO78UmZJpIk9M9T2n4Nt6S22xksxCKtJPsikUVDCpKTz45P2pob4j6nKaM6UPNMZ8Pi+K6WyEaFZoUaPGDwmBDCMnqexhLx8EDNtZx1ymgIcu/BUtyc5z75z07wRxJht4sVBZKZAw3dpuIDdi7ap/colWlFP+PfoHW/VMahQ/ig2yjzS0IIM8XiSfXVVV5d38DPZ+u2FClH0fUTP3QbyrlgQCuFFMUai58q/ybRUqtiGD+STshff+CwXi
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR21MB0162.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(396003)(136003)(39860400002)(346002)(6486002)(107886003)(66556008)(6636002)(6666004)(8676002)(3450700001)(478600001)(966005)(66946007)(2906002)(10290500003)(86362001)(8936002)(921005)(1076003)(4326008)(36756003)(66476007)(186003)(5660300002)(7696005)(52116002)(83380400001)(316002)(82950400001)(2616005)(16526019)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?YpTrJCre+ouu/Md+jUex6ywBerP8x4EmpIrn59vEvucCDqTSYjJdbEndQc6d?=
 =?us-ascii?Q?9A5kXKbS6MjKY6sJMETmznaZcuejumfC7EipXJnGzzYGfx2BE3WGDVBhHPuW?=
 =?us-ascii?Q?kurW3YpWayvEG0IjTyHKu4srqU3kGu3jF8UdO2J1XpQ7x/Wq9c+rgm9sLlZ5?=
 =?us-ascii?Q?QzUlnFFWJvMZHjY4WtG/Gi5GbB+Mtq/O48WGMzLw2TAxZ+/OivQ0PtjmZgS8?=
 =?us-ascii?Q?Q7zY8Xa7DtQSX8iy42E02Tn7fyc86xhruSPpmHH0Y4GJxx11XqsVuoXDaNQ9?=
 =?us-ascii?Q?55g6LygRKR1HrvBmpdbH1+7RYrGm4fhNUM0njr1SGzRRnjjowWQZgotcX6tq?=
 =?us-ascii?Q?4eqOgRwnoaB7wOmBKHiplZnsU46/F9oy2I0BhyI3hBaw/ZRQAKGt3kEkJZep?=
 =?us-ascii?Q?qbvksTAjjhibt09OoybNhJN3D3UjwHhsqLB6V7ndjSlDk5SToEoOe3QvLpst?=
 =?us-ascii?Q?1IMpKRRQLoBRc3bcX406ptmceRACmz26oMwKr6/PvCamv5HBdK1XKMdH+hI0?=
 =?us-ascii?Q?dUJuFVe0PR9NlMDtDkYlxApfGG3gYz8m0PJOOLpd9iUZk2Z+SFW4KCm3nzYs?=
 =?us-ascii?Q?hAPHQyvfYRFFoNL95NiG12aCVbUWBdclZJiVMQ5Fo6iwyI7AC6SfGn+WYeZe?=
 =?us-ascii?Q?tqghh42aCH6MuovvVnC6fpanaE3mIn7+IUAgiKpHq6+IjMK0cFWz8ctZFxoj?=
 =?us-ascii?Q?DsF3Up9rrybBaOz63pGgLLmOBf/SgOGYfS7oO7NQytvKAe++aPEVe/B4SrYP?=
 =?us-ascii?Q?JUzzxkEw/nGpJVbcK9oDjSAvQxlGNVD+GS7nX+iWq7RezNYS7U1zzyPyK6yD?=
 =?us-ascii?Q?3hzrnru5BY4sU2p6U1fhTC+wx8Im4WYpZo98MOtNDH3n35avqLIP6SDkzJUx?=
 =?us-ascii?Q?pIFLdrtz+F3bn7u+bLUki7/YUmmGdWQWZs/Fr/rWiyYmJBJ2j+kyflNFurvp?=
 =?us-ascii?Q?tBbCVEvlXLZJwHzAdFUojQ=3D=3D?=
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e371bb6-f79f-41aa-e122-08d88b556c85
X-MS-Exchange-CrossTenant-AuthSource: BN6PR21MB0162.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2020 00:03:48.7357 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 90YuURWSG5nB45V91ekecQyuYcHaSFphkl4Bp3X0+VRMQFUepJkT5J9AAjvFkQuh5tkQk9uD+yBQ8/TAtft4Hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR21MB1714
X-Mailman-Approved-At: Wed, 18 Nov 2020 08:01:05 +0000
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

x86 Hyper-V used to essentially always overwrite the effective cache type
of guest memory accesses to WB. This was problematic in cases where there
is a physical device assigned to the VM, since that often requires that
the VM should have control over cache types. Thus, on newer Hyper-V since
2018, Hyper-V always honors the VM's cache type, but unexpectedly Linux VM
users start to complain that Linux VM's VRAM becomes very slow, and it
turns out that Linux VM should not map the VRAM uncacheable by ioremap().
Fix this slowness issue by using ioremap_cache().

On ARM64, ioremap_cache() is also required as the host also maps the VRAM
cacheable, otherwise VM Connect can't display properly with ioremap() or
ioremap_wc().

With this change, the VRAM on new Hyper-V is as fast as regular RAM, so
it's no longer necessary to use the hacks we added to mitigate the
slowness, i.e. we no longer need to allocate physical memory and use
it to back up the VRAM in Generation-1 VM, and we also no longer need to
allocate physical memory to back up the framebuffer in a Generation-2 VM
and copy the framebuffer to the real VRAM. A further big change will
address these for v5.11.

Fixes: 68a2d20b79b1 ("drivers/video: add Hyper-V Synthetic Video Frame Buffer Driver")
Tested-by: Boqun Feng <boqun.feng@gmail.com>
Signed-off-by: Dexuan Cui <decui@microsoft.com>
---

Hi Wei Liu, can you please pick this up into the hyperv/linux.git tree's
hyperv-fixes branch? I really hope this patch can be in v5.10 since it
fixes a longstanding issue: https://github.com/LIS/lis-next/issues/655

 drivers/video/fbdev/hyperv_fb.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/hyperv_fb.c b/drivers/video/fbdev/hyperv_fb.c
index 5bc86f481a78..c8b0ae676809 100644
--- a/drivers/video/fbdev/hyperv_fb.c
+++ b/drivers/video/fbdev/hyperv_fb.c
@@ -1093,7 +1093,12 @@ static int hvfb_getmem(struct hv_device *hdev, struct fb_info *info)
 		goto err1;
 	}
 
-	fb_virt = ioremap(par->mem->start, screen_fb_size);
+	/*
+	 * Map the VRAM cacheable for performance. This is also required for
+	 * VM Connect to display properly for ARM64 Linux VM, as the host also
+	 * maps the VRAM cacheable.
+	 */
+	fb_virt = ioremap_cache(par->mem->start, screen_fb_size);
 	if (!fb_virt)
 		goto err2;
 
-- 
2.19.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

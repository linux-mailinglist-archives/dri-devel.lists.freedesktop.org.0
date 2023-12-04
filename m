Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BA380386D
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 16:14:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D248C10E1D0;
	Mon,  4 Dec 2023 15:14:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 105B010E1E8
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 15:14:13 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3B4CVdxb002904; Mon, 4 Dec 2023 15:14:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:content-transfer-encoding
 :content-type:mime-version; s=dk201812; bh=I7bGQIm5CVXfDI/YejAY4
 qETZDC23MLl6vYwVDhYLgc=; b=uKVPhxxlJa68DakiiOLVI/mjvhGWBh7Oeru9J
 AZC/dDuiWgOuGEcFJ+txk9CDwjBt4GH2yUhhJKBZPTVIk8xi9UAsRJ3Wee3GXy0P
 YJeLqpJNTxJE7EpIo4q4WpR+CFRPbQPwivSrQKUZoMNUIIvjqoGhj4l1nPaX2M8B
 J2SbUFvifCLwrRNKwcdNVf+Ra9prI42G8y97dJoiMt9dGz/x/7dU6N6a1EF8akCr
 DKxAgzWnYaPmXqR7mdKoRuRfOVG5neEr9scMR8a3oc6WuRE6nJzMFMNz4RV0dluS
 XRebvJfRcM8FGlszKocHlfqIx+ydyrIzq5k0R96lPZUINQR2Q==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 3uqwhw9ja0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 04 Dec 2023 15:13:59 +0000 (GMT)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Dec 2023 15:13:59 +0000
Received: from GBR01-CWX-obe.outbound.protection.outlook.com (104.47.85.41) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Mon, 4 Dec 2023 15:13:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CmCgN8se91dFtALHve586D0sV7BCXY3eKNUiusZqb0e+AKeeFQmSua3DWsPn+fVD84DCBBYAQjBCTLmMkX5LB67yuixzEgXzz6lnpPedtnGySKps8SBB3vtTcg0KgNH1DdNMpaV1hdAhEmF6fOy1hAQLpqfeg3tg2ef4+rtatYGoz2UE0DqqLZpX6+TdWdJq/k/JA7vWm0CWftC/m299bLB9zE+IeRJm4GoOUZCQk3uwQGEOeIXJOz4um8P/8iGRkyI0qFqwdHAPOTxvZCBxyxbhSpdRr7xD83Rosweu80BeMKCb9E7k+238mgfMMjutakpgm3F2KX7fKonjUlwOmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I7bGQIm5CVXfDI/YejAY4qETZDC23MLl6vYwVDhYLgc=;
 b=D7kpYkiC/Yy/GwvD0jv7BYNzKbgfj8Y78OgciGLxMC/hWeoTqs7j5CixOp+OnC/oEwyfvwQW4PxjQyQBjZtJxvAkM3e/ERq+T4YAU5CiilF/7MlzRopzy84OVP84k2roKSRelOuYXgdRxZw+fJaqJeW1F1NulAi7qUkihqRoQUCC6tx4Fy9duFC+4UfX1LAQFZM2rmOUi34CWQOmxIwH+VqrBgt8E2rAajD0E535BCIuX7Fi0rUwJEqvSe8AX1LgfO632oD7mAQf0Z733Vzx2GmbdBTXsowsLEXx7VxJ5ZUMcYWgHpDeRMlanlXg/y9vPi1WROoUDkDUBpe+uZr7lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I7bGQIm5CVXfDI/YejAY4qETZDC23MLl6vYwVDhYLgc=;
 b=i2xZ4H61cfoouDU3hgNqBqojcj500VMXGwtFOCe3MpLNQXPYuuBrJaCiPrCl+B15SQIrLIiJuTNMzxgorx9iu9JgIbktyP8g8jb0suhhEIyKMZUfD7ZbSLI3hIbY5VEtBx/Gg07mC//k9nFKS01H261rG7JzNQoLAJA/HMkPCKE=
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1a0::8)
 by LO2P265MB2608.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:143::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Mon, 4 Dec
 2023 15:13:57 +0000
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a85a:76f7:c085:2b34]) by CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a85a:76f7:c085:2b34%3]) with mapi id 15.20.7046.033; Mon, 4 Dec 2023
 15:13:57 +0000
From: Donald Robson <donald.robson@imgtec.com>
To: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] drm/imagination: Removed unused functions in pvr_fw_trace
Date: Mon,  4 Dec 2023 15:13:37 +0000
Message-Id: <20231204151337.60930-1-donald.robson@imgtec.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P123CA0032.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::20)
 To CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:1a0::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB5770:EE_|LO2P265MB2608:EE_
X-MS-Office365-Filtering-Correlation-Id: a435fa6e-8af4-48fb-2489-08dbf4dba2f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3jm/wWyANElYGZIWtAmnMB9/DOMKZUo18FiJY/QqshY923o0pGSW+OdQIM6Mo9BRK+4+RIdjWb8Azd0ZKStQ4c52SySlcZkzJhB6F4eCLzZOdx1bF/BXrp9TKLpitfoqqMZ4E4aXqWTy6fYHgSraUR8qm8hm/jfyTncg8K+BdwmKr4nD5uHH5z0D2fsyv3lQ+IXk8TNuwYVZC5Cnb370Aej4ANrh46T8ROyN/OHTKTiEeSp2G5sDSqIAf3J/AbrlX36dxcePbinz5DbaLDRVY/ewNfUVioLJYCKp8wgQg+H1tdqa1fSohtwNy1LHdO2WfnQAHm+1r/BX2dF3kjNrvz4UvS2AQBw13EdWzU/+q45SJN45CpLbQSw1XpwJei29yd8FqhutG2YyJezxYpA8R0KCs4MxxnNUhzqyosw5i7wB+ZXdDQfuaKDqnXVVzDV7SSRT8r7XVxX+YrBIB24RBd7KYi8XQi7uOhhUbRKpzncEsuSEsUm0a8jjPP80y9uvtNF2F0231YuoIWm1+2R5C8Miu3hPYV/bm51nQEXEDbdetw8OnM9OsmWDz8q1kAZ5J8zJSEFtBn2HNbzKwvIXc0Rn/9aHsczBZcBKUk0MZwQDaiSMIlG0dwqbJOnjYW2uYFoa11Jc05XHkQezJylNVw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(39850400004)(376002)(366004)(136003)(230922051799003)(230273577357003)(230173577357003)(64100799003)(1800799012)(451199024)(186009)(2616005)(44832011)(8936002)(8676002)(86362001)(83380400001)(38100700002)(52116002)(6506007)(6512007)(26005)(1076003)(6666004)(478600001)(966005)(6486002)(316002)(66556008)(66946007)(66476007)(2906002)(38350700005)(36756003)(41300700001)(4326008)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/690LToo1Lw7vdRLDM3pwsKmAhTZhc2dQ6FFDKhaemT1L5y9MLCrWR+2gwn1?=
 =?us-ascii?Q?Z+x6T2knpznA0BYRmWMFtdRXlkdGe0KapglMdlvUC9irMWR1W+hxXeDlxdZC?=
 =?us-ascii?Q?2n1sc4NubaoSH/Xl7GiRCjARB9VlXT4+cKTKT4qx2Mlf5WdeXM6NRvmC2zA4?=
 =?us-ascii?Q?q7O0CUMWxhkcMVdK7JqvtuqxFrUYY6Mk4+0dlChN0zBTF5Qh/PiMObCvZr/b?=
 =?us-ascii?Q?FCRsukU8OqBSPVVLeA8qddqov97GZuFt3cX+wBhOeBqvfqSweVjcGashiuHN?=
 =?us-ascii?Q?V9wNEvvKUqvI7Pwh6xd2fhuUoboxEpHNFqCB8276gy7NqFvU3e8dX7b2T5yq?=
 =?us-ascii?Q?EchPBdtz9y9s8DtO6QkD6f73zZFY4frOEHUA0vSmggiW5G3N6QO9d45otF+p?=
 =?us-ascii?Q?eubq5LMslBAj9KUm8Yi24n4RxaUobqCGB5PkXryVhV6B+kfBPqXGMxLNhMv5?=
 =?us-ascii?Q?oa+evU88vOkCc3BDPkSjy7hnLYE6GqfdflcGWOHiw0XY+1+R9GmY3nywg3z4?=
 =?us-ascii?Q?35Fbd5QYPhCFvFTDrK5YeMdm7ZfMdW96/EWIQpkTqLojodGe0eIxwWFXjGij?=
 =?us-ascii?Q?CZwHLcd6ase7ROkLxvtsslLJ2vk+4bVBPvtzrtLQK2NtYKhU9kErMpp6pva2?=
 =?us-ascii?Q?M3DLFWzJvNagC5uZPQuN0YhyFGWBqxyXdAl55hWgrePyMDCiGGq9hJsu5P46?=
 =?us-ascii?Q?2pzIPw4qshFkHoa2aOGTPT11bw3MNBZV38Rdv35AoRUXvIXi5tgyyRAngFzj?=
 =?us-ascii?Q?ZYCSCNIr59BzhI7IkdIlRh/B7bpln/5GIDWHt6ILofe0qy8AK90hB5rHimmF?=
 =?us-ascii?Q?zHisVbl/UcL5gS8QfprKkZKRK+fl0SurIkVveEC9h0PdbcqqrBLLyT+LOTg0?=
 =?us-ascii?Q?5ISt5EeypYcOzxyk1McyTnJ45iifRr5xM4N+fI2MpT42S2omx9rFew7QqH2D?=
 =?us-ascii?Q?tKa5oeiCV1X8Gp23M+SZ3BrHN95+iE3J0Q729qqM8C9weyBl7NJOAD2744gQ?=
 =?us-ascii?Q?X7ux6voJs/sSkVWqzDzsNhdSO9Vn/dCvl8cBB+viT/rj0h3Jwn1HHqwZnjmw?=
 =?us-ascii?Q?9ckvHcJPhYtm9NgEgSsA6BekE2NF5pgGy5Nghn5tbBtZhVOGKZ3474yobtqW?=
 =?us-ascii?Q?nX4VOAPKI0+D6hZ03Iw6ZUZMCWEjBITRo9ZTemO+xaW1qxqdO+Xdlw8ArDxq?=
 =?us-ascii?Q?dSRPz/B7Lkg4voGTpIeAGQAd6Y0MYO+QC6zRpKzRpWj9ro5PC9ssJaa3IZ4v?=
 =?us-ascii?Q?3WbP4MSCYBIAqNp3H+9tTwffHXYHFn1MfUPZB1R/hsScWC0O2n9QXqV+QqF+?=
 =?us-ascii?Q?wDCV+WJW0rbsD8SGhkNh6VjnXiv9J5tk7O4KzClWrhPrT3PSxXJPzjowIkhJ?=
 =?us-ascii?Q?H7sjI3cNSWfGF+NUiTYhpdigCvKwzJQNu8tnzwkrlUG2enVKjaMYbWDJ1xpr?=
 =?us-ascii?Q?49/9SL9eeiX/UV4QOkEBwmon6VOAEpMeYoOYtXPwJgDeFP7aBIyW+mZGHHFV?=
 =?us-ascii?Q?3581YxaISz2IdDR910/0B3VQJ2JcUMx4XD1rgUVqW29EgImEZlwPm/ZIrIEB?=
 =?us-ascii?Q?Jx74OA4+U10lp+afZQCAER9KZLQyhiU6VG2emSYxo2ZbXmKdzYoIemFnZKyy?=
 =?us-ascii?Q?nw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a435fa6e-8af4-48fb-2489-08dbf4dba2f4
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 15:13:57.3287 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i5/07CLrGB8pULOzt7SSZ+HzMoKk5QPR4/YuLxDhbid3YZdQx2LvJ+UshD2EjHwl6sQ9j5QvaJtObWf6BCkTUbB4BmzApUnV6gun5CHdPTs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB2608
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: 9c3CLMFPJ51CC12F8vMsdi_OFi_SJwVS
X-Proofpoint-ORIG-GUID: 9c3CLMFPJ51CC12F8vMsdi_OFi_SJwVS
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
Cc: mripard@kernel.org, matt.coster@imgtec.com, donald.robson@imgtec.com,
 tzimmermann@suse.de, kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixing the warning below due to an unused file level vtable. Removing
only this causes additional warnings for the now unused functions, so
I've removed those too.

>> drivers/gpu/drm/imagination/pvr_fw_trace.c:205:37: warning: 'pvr_fw_trace_group_mask_fops' defined but not used [-Wunused-const-variable=]
     205 | static const struct file_operations pvr_fw_trace_group_mask_fops = {
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~

Changes since v1:
- Corrected hash in Fixes tag.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202311302054.MVYPxFCE-lkp@intel.com/
Fixes: cb56cd610866 ("drm/imagination: Add firmware trace to debugfs")
Signed-off-by: Donald Robson <donald.robson@imgtec.com>
---
 drivers/gpu/drm/imagination/pvr_fw_trace.c | 44 ----------------------
 1 file changed, 44 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_fw_trace.c b/drivers/gpu/drm/imagination/pvr_fw_trace.c
index 87a42fb6ace6..30f41a10a0cf 100644
--- a/drivers/gpu/drm/imagination/pvr_fw_trace.c
+++ b/drivers/gpu/drm/imagination/pvr_fw_trace.c
@@ -167,50 +167,6 @@ update_logtype(struct pvr_device *pvr_dev, u32 group_mask)
 
 #if defined(CONFIG_DEBUG_FS)
 
-static int fw_trace_group_mask_show(struct seq_file *m, void *data)
-{
-	struct pvr_device *pvr_dev = m->private;
-
-	seq_printf(m, "%08x\n", pvr_dev->fw_dev.fw_trace.group_mask);
-
-	return 0;
-}
-
-static int fw_trace_group_mask_open(struct inode *inode, struct file *file)
-{
-	return single_open(file, fw_trace_group_mask_show, inode->i_private);
-}
-
-static ssize_t fw_trace_group_mask_write(struct file *file, const char __user *ubuf, size_t len,
-					 loff_t *offp)
-{
-	struct seq_file *m = file->private_data;
-	struct pvr_device *pvr_dev = m->private;
-	u32 new_group_mask;
-	int err;
-
-	err = kstrtouint_from_user(ubuf, len, 0, &new_group_mask);
-	if (err)
-		return err;
-
-	err = update_logtype(pvr_dev, new_group_mask);
-	if (err)
-		return err;
-
-	pvr_dev->fw_dev.fw_trace.group_mask = new_group_mask;
-
-	return (ssize_t)len;
-}
-
-static const struct file_operations pvr_fw_trace_group_mask_fops = {
-	.owner = THIS_MODULE,
-	.open = fw_trace_group_mask_open,
-	.read = seq_read,
-	.write = fw_trace_group_mask_write,
-	.llseek = default_llseek,
-	.release = single_release,
-};
-
 struct pvr_fw_trace_seq_data {
 	/** @buffer: Pointer to copy of trace data. */
 	u32 *buffer;
-- 
2.25.1


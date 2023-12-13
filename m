Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6463E811523
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 15:45:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9715B10E7C1;
	Wed, 13 Dec 2023 14:45:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 831E610E7C1
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 14:45:43 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BDDU2F1028726; Wed, 13 Dec 2023 14:45:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:content-transfer-encoding
 :content-type:mime-version; s=dk201812; bh=xe+Q2qT/LElBZ3QiCEJzN
 WVEjwfWZNyL75k1pWTxnOU=; b=jR6Rs9mc3SRbI24QxSCxeYv1KJGzkPdWQ7PdL
 9L0iOswrzHlW6B8ZClZyhbQ1NYi+Hfav4gcEsi7e5d96oNlI0D0Lkg2ZdTEb0URp
 0Fre+kmP/k/YuTcKbZUmDxiTeF8s3nLDWhAN/VWTtvwuWwLXX7ojARA/Z7jIcB02
 vAbM8ExySM0gDtDYfJH8hi4TjamBURyAamAjRnsBtjPfRqbZ1KhGAQrPXrVds3F3
 iz0dokGdlO0fm0sap/YN3fmoSHaA/K7k6OQsthzE+QkZHLzk71qMttt87wx//eam
 rkcP0iUNWmieBdDv5+XhEw1Kqp+vGejy/JID3qF163jz/6NsA==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3uvfcsan3m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 13 Dec 2023 14:45:00 +0000 (GMT)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Dec 2023 14:44:59 +0000
Received: from GBR01-LO4-obe.outbound.protection.outlook.com (104.47.85.105)
 by email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 13 Dec 2023 14:44:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HiZIlQxWhM55NObmLmXvdwt7LNphr1Zy+pwE+uCQISJnmxbqfERDZM0zMKcuGhYL2U1HxJ1r+60DeHg5FfX7Udti79NZUFzEkJkamuugbEdhB8b9vcigEiMW+zjcfAUDZQHNgDsEFjFv43Baq5taa6r08i3wBKpjtI1TGvgK+Bn8M9fC9d6Q3QHOaExFRzeTYhauR0Clltj21/cEf28B0mpgEKd7OsGzhdg3tCKKQwYDHR2sp0AB9RnndIdF0jdhs5gf/Nna2peYOuHrroMhnNkO/F1EYT2J8tBEB6sJJhy5afi/aT2u6UfuchRqMlGRxPsp+au/xqtjzLXLhlDhfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xe+Q2qT/LElBZ3QiCEJzNWVEjwfWZNyL75k1pWTxnOU=;
 b=bBxuLhOQZH0Iv9Jryqn3Nb5oCxN6xuWlUcn/eiJTZDF8YSuWBnr1X48nXAoqTryigBI0SYgD5yn4tw52eEnW7swguWVtws5oURpyJHvYNHqACw7N5/Er7u5nziczTeCZRGiWTr6AJnPV8wha/y4rK561tFRZKBBKS+/M+XkG50bI8OSKXqSI89HdDDl0QBowlfoTW1z/KEU+cmfwAl5oXzRxBjhkNY8l9hJT7+KmXSqyfS155URxALeqEkY8SELL9zQsfU78Z6ArdkrAs1ecPmGtv+17k8ikBBCs+zW3WqmJYUFYK6Cff0YcjCDVwX26yptZ7eMOgR8mscwI7rIikg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xe+Q2qT/LElBZ3QiCEJzNWVEjwfWZNyL75k1pWTxnOU=;
 b=DoovGiJkj0fRwMLy+36HCW6Q2MgG+xzAG1I3fPT/AUTk8I3TZ329Gd0f7+dKQGG2WI2ksrCjigjkzEFfYs9LSvKJgb4Mb3qQokOxnpqvvMSJ/3/2v22YRex8ZDllMZosalbU06EgSrR1i6GhWYzUJF+1WdWZQDftS3HbdhJKyOo=
Received: from LO2P265MB4600.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:23c::11)
 by LO0P265MB6535.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2d0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26; Wed, 13 Dec
 2023 14:44:57 +0000
Received: from LO2P265MB4600.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a3f5:aa1a:ff75:79a2]) by LO2P265MB4600.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a3f5:aa1a:ff75:79a2%4]) with mapi id 15.20.7091.022; Wed, 13 Dec 2023
 14:44:57 +0000
From: Donald Robson <donald.robson@imgtec.com>
To: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/2] drm/imagination: Fix ERR_PTR test on pointer to pointer.
Date: Wed, 13 Dec 2023 14:44:30 +0000
Message-Id: <20231213144431.94956-1-donald.robson@imgtec.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0332.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::13) To LO2P265MB4600.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:23c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB4600:EE_|LO0P265MB6535:EE_
X-MS-Office365-Filtering-Correlation-Id: 14bec3e5-e4f5-4fe5-f009-08dbfbea13b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zKihb9obl/cBYooLge5mcK0urWDFlp7OeQptzXpWwrVd5WTqHurT4xkG8v2Ex2SzgpI5EKaOKnKKdrv9AVUSWdsdrCvq0PgpVgBmd2qH7UYbmGRA7DxGWwI7cmBHC70DMdEedrfGcerffUf6+ONv21WEuAz6Ba7jDsWsNcPG8pEZTmoQL8MloWVl9kHWtXL8wV7JARmgcZTRkgCy4fz5zOMXK1QhODaLe3QdiWjh+HMcCJXo0bB7LIQBSKtdVIVqkEej4JNUpTkOydOyaHUSiTRfPjgCjR4qd79qSyepd1A7t8piR3ng3kXGyPYIaceJVoy9BeAN1VO1ZpU0uaXbKQB7JuGYFopfEok87bwOWi/eOyodVlxb9j7stutLa0QsBKUhVY8O04BV2pywj9ROLU3xpIDLDJME69hihxMlNvr5vG5KQhruFOdRJbKy9PctROpNZbRQ9P3Cx7V+nVruNudW3aDiEkZKzJa52SKnTpVxdHhVeB2LD44DLZ03+xWCbDQcAJL39ZpsB2mgrrSWNye+owkR6KO6rkoY9gS/eVxKjmgDPX/18FwqxWRSSKWvW68rRGVLPuyeEGin2BOq2JwaD15RUt3VfR0k5NdzcYQ8UWVMNdao1eq7zlicA7f4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LO2P265MB4600.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(346002)(366004)(39850400004)(396003)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(2616005)(6486002)(26005)(6512007)(1076003)(478600001)(6506007)(6666004)(52116002)(83380400001)(44832011)(66946007)(5660300002)(2906002)(66556008)(66476007)(4326008)(8676002)(316002)(8936002)(38100700002)(41300700001)(38350700005)(86362001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rP4kByhkqLUIzzVZDPkiQRXxFWXXK9cPMYgY2ejedpxQD9rEN2qbCnA3FZhP?=
 =?us-ascii?Q?q8tTfsPOHGBElpCAaU8c7/eFnTUeHLhiAW5sa/a7l64NIIKtXUkrcZsrZEtu?=
 =?us-ascii?Q?5unTiqDNgP1jU3EuUdnq/4J4KYfKLdbcHrlHNzv0Nvu86cdSHaVrXT1vMaQ8?=
 =?us-ascii?Q?j35p5wxvYf3yGwVWBqUx7km0KWkQZwKhzoDIOONOPj9AC7pMlSuxI/SFf63+?=
 =?us-ascii?Q?OG5d2g0c8iHpEegEQktPnsgnkzK+AMbvhJpQDLkS0PgKtf3ElZevegrxPVff?=
 =?us-ascii?Q?Xh42ByM1dSVwN/4e/3096YQrEtbEMxiPRvMEFxBzAsyoNSrunW1+pGTDDQ1c?=
 =?us-ascii?Q?hLMHr7Sm/pUcMwtvotWnAWYPzGvQnO0dooeobnFFuUTuo/ORPjx4pzZNKg/A?=
 =?us-ascii?Q?Lrn8XJUrUmXc8jnhftRE6eEGYjW6r/my/7QTclxsVTh49jiy7IkW8u/57n0P?=
 =?us-ascii?Q?/Fzzr/nG8AibDH2v7VXUcuy7gmTDIgvWglerhRLRgu/EknUOBNpDM92Ir5TZ?=
 =?us-ascii?Q?7gFR/RM5nkJln13mEiTdWmDfMTntnD4/0Dn/kzmSfwTI/WqOig4UP5sy6/rl?=
 =?us-ascii?Q?pztdw0OWr2Fdb4H3s6Ixi0UZXEbRwgGWPZ9lEHt2h80G3DOww2/MSQ+CkCpo?=
 =?us-ascii?Q?Tm8b4UI/IKho328C3NTeqPjw2XtDO3iN9eV3fSF1xGnKIS5Gh2FIZtJNhmRV?=
 =?us-ascii?Q?ClloMhwS8SX+a/c+FB4Bm5JB8Lmq+DK3gGlsYwQDaeLtj9Bu/bs/9HdSgYIi?=
 =?us-ascii?Q?meSptnpf5flBYa1VID7KOtH1tVauBlMP+ANx9jLIekiyWCVmu/pKbrNom2Kr?=
 =?us-ascii?Q?/rVk1kBz9rG02A4vbUCS4sBx1LZIjDTJ3pfJBR2hr+Rf5mGiIkLZjxzkvtkl?=
 =?us-ascii?Q?HZAlusRbs1ygjUulRTXyXhHca2BiPrR1vBzIjuNlrSUKIfHFdtFS+secfOr1?=
 =?us-ascii?Q?PWZrMVtK0Nm5cM41Zz5LF72yf5Xon2BkkCfmWXOftCZIrXvzw4TNWPSjrcIU?=
 =?us-ascii?Q?5DBhUXJEhdvZCZ9YNlx7/yzg5npxNmadBu9X7YGZ4cj5x77PUiVbur9pJrHu?=
 =?us-ascii?Q?iIy/FyxpXRp3UERm3nc4Ggk40ZEpvlJndZMkX+sAo5z7jX5/O5113cCGc6ZZ?=
 =?us-ascii?Q?N02GBkVZQrAZP2wXSGsAwSwQ7SxaIUAzkFtNXQ2/8CstIbq+H1vFHff3YtHa?=
 =?us-ascii?Q?nqwL+1zAr/bIlZJUudfI0x4jOruFUmWLFTyfTQWOf9/o9BSvFT1TEhEdjxoW?=
 =?us-ascii?Q?7ELKshTQvT/Lguzpp86zcDKoCJprsgCNkFqNLUPJHPMbzX0ywFV92l0WjSRE?=
 =?us-ascii?Q?M4OC9YCvr8YQSp93OQMGWVJFmWHnIpi/P4L5VHor7ALwY5PlnIKUOnTOCqcq?=
 =?us-ascii?Q?r7IYB6vrgtD8/FyFmvmCAXVOryM8owu4h5m+IJmHynH67djLh/nCWzlNyXjW?=
 =?us-ascii?Q?FHfaqiybp0KlF6py/SsZgo3fGmllYrtKxAAefVX+tkrjr8+btlwdWnYYVbtg?=
 =?us-ascii?Q?Ea+QYsVQ66kLVtMC3Yaqc5WcBh6VAT90aqkjIyjIHwhTJL6Jw31ZWqKiKYLc?=
 =?us-ascii?Q?/oJ5+Fdxe2OJg2fTQhxq+RGxFedzbtQrZrBaRHaYkM6G/ie6p04jg3cAKOWK?=
 =?us-ascii?Q?+w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 14bec3e5-e4f5-4fe5-f009-08dbfbea13b0
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB4600.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2023 14:44:57.5736 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JRDBhwdoHk+ek3S9gCN2e3nMzvxXxl47kimshv9aPJqz+3WwLOLXj1wawnpzP551tKQH085I/sJECA+qiBgEIzjAompPhFvT1hwiNXYzlrQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB6535
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: 3HXvXT85QxRE-DqSrgYe6VeyxavqQjTW
X-Proofpoint-ORIG-GUID: 3HXvXT85QxRE-DqSrgYe6VeyxavqQjTW
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
 tzimmermann@suse.de, Dan Carpenter <dan.carpenter@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drivers/gpu/drm/imagination/pvr_vm.c:631 pvr_vm_create_context()
  error: 'vm_ctx->mmu_ctx' dereferencing possible ERR_PTR()

612         vm_ctx->mmu_ctx = pvr_mmu_context_create(pvr_dev);
613         err = PTR_ERR_OR_ZERO(&vm_ctx->mmu_ctx);
                                      ^
The address is never an error pointer so this will always return 0.
Remove the ampersand.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Donald Robson <donald.robson@imgtec.com>
---
 drivers/gpu/drm/imagination/pvr_vm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imagination/pvr_vm.c b/drivers/gpu/drm/imagination/pvr_vm.c
index 6f4e07effad2..432168aba577 100644
--- a/drivers/gpu/drm/imagination/pvr_vm.c
+++ b/drivers/gpu/drm/imagination/pvr_vm.c
@@ -610,7 +610,7 @@ pvr_vm_create_context(struct pvr_device *pvr_dev, bool is_userspace_context)
 		       0, 1ULL << device_addr_bits, 0, 0, &pvr_vm_gpuva_ops);
 
 	vm_ctx->mmu_ctx = pvr_mmu_context_create(pvr_dev);
-	err = PTR_ERR_OR_ZERO(&vm_ctx->mmu_ctx);
+	err = PTR_ERR_OR_ZERO(vm_ctx->mmu_ctx);
 	if (err) {
 		vm_ctx->mmu_ctx = NULL;
 		goto err_put_ctx;
-- 
2.25.1


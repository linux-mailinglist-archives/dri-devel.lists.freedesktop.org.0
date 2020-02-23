Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7362F16976F
	for <lists+dri-devel@lfdr.de>; Sun, 23 Feb 2020 13:04:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7CF26E174;
	Sun, 23 Feb 2020 12:04:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2080.outbound.protection.outlook.com [40.107.220.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 946AF6E174
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2020 12:04:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UCbEZ7vhVP1E8Fpt/kHCSJ8h/rHhY3U5KTusirp3EWHaGrLIDH5/Ep7p/yqO0IVdETj7iyJkQ5y8vTQT5LibFj3heIXRGV4xGRXnEGhrYMszGSOpfKp9WQfr1ZTF9jmxBtTMukEggT4cFxTnOt5Z9r+1OUD8jkyAYEQmMpulOM36TShAo2X2I5AkjtYkuDxOYjM7SnClYQrsMDqKVESINcqnIXuh3hmtjO4U6/gzmiI0Ec7zFp1JhZQQrn1PqApuhDUna6OnXLw3Jsf4zSs/Pg0xUgIbShUqKTHjsiCgl9Zf4jd+dybafMKkpu90Ixc+37C8dyxjJ+7PJr7aB/YW8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=myzTVAMnfHFcSfeGZuRFGS0qhQFzrk+C22AbvGcWkG4=;
 b=I+P8y3HOa2epw3FN3GePmXYwnZxdUyPLmqzwUHVb/o5f1sOuZNvh6v6ItTjPyzguaII3TOq/6YeoNOclQE+M1MKnsiM68NgDVCSItlE0iDGDfslT34W6jKUzli86wOMOpj1WbIB9FCfHZ6lEO4n2InRiKnnSY9ZhvhDb1ifnxf76YuAZZLeQRW9Vh5GTj+3PJW/rRZG170b3bUkKC5//3biufrAvIRr7UjFgzdJVZ9XvLWmJJEqkB0y8Uq4jfAjBT4stduDxRi+kqnnLFVWClYjPSTvoOAkbOM36bZivd35ZgFA8DVhozSiButmNwJfuLH775vJWw94Lpj22KLkltA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=myzTVAMnfHFcSfeGZuRFGS0qhQFzrk+C22AbvGcWkG4=;
 b=Bbog8U0ohIZvAVufoLzZPhd+CVrN/pjX8tJgqLHEFa/Bm3aph2vfm72+L0R41A5XiMKpHWt2jzVff4JK4QPTgJaTaWTpNu63lA9OTXZxSnI+gEij2ihDjIx6bSgU4+cnEXz2x2ezcGGxxvew0vbpxuIL41KCmMUiV5BNgnFZjXE=
Received: from SN6PR12MB2800.namprd12.prod.outlook.com (2603:10b6:805:6c::10)
 by SN6PR12MB2701.namprd12.prod.outlook.com (2603:10b6:805:6f::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.24; Sun, 23 Feb
 2020 12:04:10 +0000
Received: from SN6PR12MB2800.namprd12.prod.outlook.com
 ([fe80::b99c:18c0:8685:1c10]) by SN6PR12MB2800.namprd12.prod.outlook.com
 ([fe80::b99c:18c0:8685:1c10%5]) with mapi id 15.20.2729.033; Sun, 23 Feb 2020
 12:04:10 +0000
From: "Pan, Xinhui" <Xinhui.Pan@amd.com>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: [PATCH V2] dma-buf: Fix missing excl fence waiting 
Thread-Topic: [PATCH V2] dma-buf: Fix missing excl fence waiting 
Thread-Index: AQHV6kFbeON5CQEqZEOBmcFpDvVdEA==
Date: Sun, 23 Feb 2020 12:04:10 +0000
Message-ID: <18BF034E-CF71-402E-82D9-2B60C83791D3@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Xinhui.Pan@amd.com; 
x-originating-ip: [101.88.215.164]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 785d48c3-1fa0-46cd-76db-08d7b8587e19
x-ms-traffictypediagnostic: SN6PR12MB2701:|SN6PR12MB2701:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR12MB2701ACD73574D571C3462B7487EF0@SN6PR12MB2701.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-forefront-prvs: 0322B4EDE1
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39850400004)(376002)(136003)(396003)(366004)(346002)(199004)(189003)(66556008)(8676002)(2616005)(5660300002)(81156014)(66476007)(64756008)(66446008)(36756003)(478600001)(54906003)(86362001)(6486002)(91956017)(4743002)(26005)(6506007)(2906002)(81166006)(6512007)(4326008)(110136005)(33656002)(186003)(71200400001)(66946007)(316002)(76116006)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR12MB2701;
 H:SN6PR12MB2800.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: p5CimdbHj/BsSVDSnbDiB42nGnLYZ7VfsqfmBGCEozUFOFQnaWeZey5qgJiwS+JB9onxHtUr7dI4wE04JkcLQQNlej7GZLAl6x10fO0ZAcZEcjJsBCvoa0a0yv4Pt9Cymsb52KakRBr1SZ0RkJ/t+rwlrZn0GNdZhBZVt+bw+SwLiTTU0c1kSLRNyQU2RlalXv/s13v09ZbP7NjnNdblnFT0esgsR/WmiTMjPDEHn9xzFuTKHXcAUshkptyHSvKolWl5L3uc+y6Gfndal94nlyajJEHIENdpJIzG++v9PotEKUwP+YFva3Rfgu+eVYTbTmM1+WZA41WRMIyML8BNgaauiQxvDi7oRLd4SjxnNroFEXPMhb6YIg1iYC0Aqgged/Wj+HgbGdZ5/UOA+VCXCQTOUCRcjMHbxCRqR5r+5CphfifXTngb/QuUDMfVpBee
x-ms-exchange-antispam-messagedata: N5EDQxpWcZysvHFxCgDeA+Ow4Kr6j0bssHzAq8IZUXrUoNSIq79phRmYqsupA7xXUfFjjZSz+KODXVdXEwZXYgjf6L6fTMhmEzIRv4NkWa/tlkoE0XMJrw2X3wgW+v/dTFSxQWVKnn0ynEDLIFy4lA==
Content-ID: <BD278AB0E9904C4A9B8F3778BB63FEB2@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 785d48c3-1fa0-46cd-76db-08d7b8587e19
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2020 12:04:10.7695 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mlvKcYV+3bqxVNl2/LnUQF05JcJ2sxbJhbpQvRCVyvr7ej+jb6eDE+niDO9BpRR3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2701
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
Cc: "Koenig, Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If shared fence list is not empty, even we want to test all fences, excl fence is ignored.
That is abviously wrong, so fix it.

Signed-off-by: xinhui pan <xinhui.pan@amd.com>
---
change from v1:
init left correctly
---
 drivers/dma-buf/dma-resv.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 4264e64788c4..82e4b4f63bef 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -632,13 +632,13 @@ static inline int dma_resv_test_signaled_single(struct dma_fence *passed_fence)
  */
 bool dma_resv_test_signaled_rcu(struct dma_resv *obj, bool test_all)
 {
-	unsigned seq, shared_count;
+	unsigned int seq, shared_count, left;
 	int ret;
 
 	rcu_read_lock();
 retry:
 	ret = true;
-	shared_count = 0;
+	left = shared_count = 0;
 	seq = read_seqcount_begin(&obj->seq);
 
 	if (test_all) {
@@ -647,7 +647,7 @@ bool dma_resv_test_signaled_rcu(struct dma_resv *obj, bool test_all)
 		struct dma_resv_list *fobj = rcu_dereference(obj->fence);
 
 		if (fobj)
-			shared_count = fobj->shared_count;
+			left = shared_count = fobj->shared_count;
 
 		for (i = 0; i < shared_count; ++i) {
 			struct dma_fence *fence = rcu_dereference(fobj->shared[i]);
@@ -657,13 +657,14 @@ bool dma_resv_test_signaled_rcu(struct dma_resv *obj, bool test_all)
 				goto retry;
 			else if (!ret)
 				break;
+			left--;
 		}
 
 		if (read_seqcount_retry(&obj->seq, seq))
 			goto retry;
 	}
 
-	if (!shared_count) {
+	if (!left) {
 		struct dma_fence *fence_excl = rcu_dereference(obj->fence_excl);
 
 		if (fence_excl) {
-- 
2.21.0 (Apple Git-122)


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

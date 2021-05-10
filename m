Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D002C3799B2
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 00:08:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E980F89DE5;
	Mon, 10 May 2021 22:08:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2085.outbound.protection.outlook.com [40.107.95.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07C2A89DE5;
 Mon, 10 May 2021 22:08:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ge0/pZAFeResi1IkHcz8AlkbPzsVML4gb+XiSrXzT3yZ8Aq/w4kQyTKQv1MGXs6qNQkK+Krltsj1QwkFtU0133rEChPOZYTOwbJIfbWJTdHVctaLSiyCkoaKo5XZveKgVImFTgJpaBZX3hf8bq9uIcVjZA481PCmysHSBvGZkQQ7sr8EtZ/y3dt4wnibC1+xcTXIKYMVNu+JqUwc7I70mfMq5mdbnT3YTXzXgcOc3snYtMWPSPtuX0OzW+j3puMxJ1hlb1Filg/BP+csWrNYQZZ+Vrsog6snI3t5idPN1YZW5bJHd9r1Pm/gQ8/AGatVW0SHqEF/D98J/cDdVCaRxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k+YE7VbHooqeaJWIVi6NBw1em88V+vewt7MUaanKCJ4=;
 b=UZRWnjzObNxvOi2funhxhqXwatEuDg8+UtRoQ5FpTHRGGZuwAEqJkjKvOYMYZbrsvMxa0yKEmnzGanRWFlzB+XKqQrfF6U88hxCYUYmaL30GnbfAhOi6eCKEZlqg/b33O0JBjCgLjt8WzikRldb6oNfPtq2nS0vXGfJHCbQcx2wrn+MIeFHxMwOguTiHahvU8yibLsKCcq/mNS1i4KHZe/gowXfppAqebrkJ4yTu4NSUFevWkeKShPLr4o+voghMQgVjxxYHIncOu2PvxB4iKLe0GIw8qyFUcyNqHBJ7HkINZOAThMBOzivWjVomviiqqDcV9ElH0Jv8gkAB+Xl+Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k+YE7VbHooqeaJWIVi6NBw1em88V+vewt7MUaanKCJ4=;
 b=pNbHQtuR7sZzBhyuK63j7pfM/R87bXf5vT1VAIPSYo8G45WedQNWf7pM69JNJfJffTPeObdj4Tm/B/YOISK8W6j+BRpcF1+V3F92hLCl3c0zVMpJ+sObZdb/3w66uMlvQSGqJbiF1KWArBgbgFAgBAc7pl3RtbPf6Y/TcwzLycU=
Received: from SN6PR12MB2672.namprd12.prod.outlook.com (2603:10b6:805:6f::25)
 by SN6PR12MB2734.namprd12.prod.outlook.com (2603:10b6:805:76::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.30; Mon, 10 May
 2021 22:08:33 +0000
Received: from SN6PR12MB2672.namprd12.prod.outlook.com
 ([fe80::9c8a:73d6:9a07:d021]) by SN6PR12MB2672.namprd12.prod.outlook.com
 ([fe80::9c8a:73d6:9a07:d021%7]) with mapi id 15.20.4108.031; Mon, 10 May 2021
 22:08:33 +0000
From: "Errabolu, Ramesh" <Ramesh.Errabolu@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v2 09/10] drm/ttm: Don't count pages in SG BOs against
 pages_limit
Thread-Topic: [PATCH v2 09/10] drm/ttm: Don't count pages in SG BOs against
 pages_limit
Thread-Index: AQHXPU8CkU4lswWHm0CI9uu1OV+trardV0zg
Date: Mon, 10 May 2021 22:08:33 +0000
Message-ID: <SN6PR12MB26727A85F54914FC6D104BAAE3549@SN6PR12MB2672.namprd12.prod.outlook.com>
References: <20210422013058.6305-1-Felix.Kuehling@amd.com>
 <20210422013058.6305-10-Felix.Kuehling@amd.com>
In-Reply-To: <20210422013058.6305-10-Felix.Kuehling@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=true;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2021-05-10T22:08:25Z; 
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal Use Only -
 Unrestricted;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ActionId=c0053f8d-9111-4b23-bf50-106208977520;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=1
msip_justification: Review of amdgpu code  
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [70.114.142.194]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f1bf71da-c3d7-412d-071d-08d9140026bb
x-ms-traffictypediagnostic: SN6PR12MB2734:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR12MB27347AFA631ED9D2A1964B8DE3549@SN6PR12MB2734.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: R6by7YKB+uyPBAi6XYJdqYYXesyiVHcFkZg00sXlrwydZ9UfstDrAk90XBG+vZRV6/yHbUBdGiVvHltRR0sVKxd7KJDZsyx1143aI9VMbhcZsyEZaWuUztk1Lc5brY8Gk01UQwH+Gq97YGa7CAkf4mcTMAAUf7VMnWSPYt+tY5eumPaSgCGSQkT2G0BJFxBC7LcY1xodY2MI7pC1zlurS6mO8zGMxQNrhkUUtxR2MeFGUl9d5Rvw9D++SPBCHh7gJKcpLFX8I0JG74b3tk8Z7hmj7fWN1gAmlp0Mr2hS6BntTW9txW1cgXlc5ttfDWev+99jTb5j4Drf2Mq603MRvHG5mTAXd2nAHfMY/d5I3fT//iD77OQRlNdzdGSj4yOHxGNzMbZN2IWY11thFtWKolbM9lJW6nRmCZf11HSTh8I9Wtv9ZVZ6vEaK8RCb9PmvK+mompGPOqtVcdYWxG0/o9HyS4QABFzKDv5lejE27ZPE3kSWs4F0Fl4nHraSadp7EtmaCEfJGl9uBUeKcPYoPo6EDLgx8Ra/6YoxO+gZYzVVKJ1RtOmTtInCgPN+vxcH76CF79lUX3ddFEvoI+/hTYXnhFQaF47URuZhXx1KkAM8LJMysogYdy+IXTTF5OUMi/uK6Rs+uejp8rd14F9vYw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB2672.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(39860400002)(346002)(366004)(136003)(5660300002)(38100700002)(8676002)(122000001)(52536014)(966005)(53546011)(76116006)(6506007)(45080400002)(478600001)(450100002)(110136005)(316002)(2906002)(83380400001)(26005)(186003)(86362001)(8936002)(7696005)(55016002)(33656002)(71200400001)(66476007)(66446008)(66556008)(64756008)(66946007)(9686003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?5JLUTXTiyWrRMxi2SsFcsJyxlumA3SMt/lbNIMSo+zFK6vmDJwxRGBd5h//K?=
 =?us-ascii?Q?9ZOH2ioaiByoAvqfgY/nPZRz9aBTnOBYCzYt+eVPWbdR4KFTXUfue2FaDGVD?=
 =?us-ascii?Q?8XPjea4kaj0Nebn4rA6/AP7XdPeY1KaAW32VYwYYl+1/OBD8WByONo+tXGBp?=
 =?us-ascii?Q?WqONR9SIsxYi+1AnxyKyXBVeRhPX+zLwMDnvQMeMUqhnEO+gKPx0a19SHnBi?=
 =?us-ascii?Q?bMkUyyCichdMbb8lHJE0n8Cd6BCWwlRsCs3lv8x7Ad2xvhO1MF8QWvcliIv2?=
 =?us-ascii?Q?pl40/jQ6XPH0Kf3gzNXLdtoHLA/A4YqrNXRze9OiX6kT4EijGG9WC2hJGmKf?=
 =?us-ascii?Q?vLHj3UkYAOzfoEG32TM9CetaNoiuqn1N/Gq1LO5KrbZ/ccktsC2lEDRWYKx7?=
 =?us-ascii?Q?wTej0q/P6gguWHo3JB5COML2KHUX197lL8Dss9IIdVKKXqSMMJMm8IWxO2Bp?=
 =?us-ascii?Q?VKcUtWm+Vt87diMZpS6twEItBBt4208Qc7xhfDGlVlTibnAfrnZWXgVBprOL?=
 =?us-ascii?Q?Q8NqYbO1NKcgJPepR5A/ZCN2XoIRokKugqWeIKEXGhCUZeGehziHHE0kXpYE?=
 =?us-ascii?Q?PTxgn6TwE6BBVJE9DNEucXNdY51O2QJ08WUCoEDFqP+Qe/I0IjiBqU8zIcgM?=
 =?us-ascii?Q?MBxz51K8vzbvEhntVeksC657oH6X0vlc0taRFb6HwN9pvOKlOVrCNpInbeeQ?=
 =?us-ascii?Q?DGNZKKtLr+UmmtaA36Lyr08ORovMIxZYqt+Ry3TlYtd2teQavt388Z4pzpbd?=
 =?us-ascii?Q?8I9HncWuunxIjwPrN6iPSoCCL1jj3j+iww6T9xYBtg4BrTSP4WKVLLtNqAO7?=
 =?us-ascii?Q?kKVMyR03FMb2bVW8WZZaTD4zBOMt/Q8ZaiSh1o4s8V2YGk+vVPJMhogW3oAz?=
 =?us-ascii?Q?DZnKbvZCZydauRLNIlfVM7wBakbDM2tDX1cNFy2j7yOVdA4RneEVDbijwkbh?=
 =?us-ascii?Q?Ye6A3WlXEIdiMywjzO5vwcM5B1NdOoS93k9HOdftIz95vMZLt/SI97G0LBQi?=
 =?us-ascii?Q?xISwlPTzEaVqUObZeVILpJ6KguLltdBOEuz9hR/v+AvTtcjMQH/VMjXvvUQ4?=
 =?us-ascii?Q?HO+Bmallm/cUTSWzcceNE0HHCELpuKiNbnUnvbYsC+K0Prq2VVextV9qgw/j?=
 =?us-ascii?Q?SKCe4rCTDCgzRl8iothvwtp9PzZMsQJI/5QQFX8chmwXqjhubp3HeovSDyEx?=
 =?us-ascii?Q?RgE8de9X6sq4Nr/0Zr2UDcvi98QrJdsy4rPzzzpU5PAkMdWKIOnKYRNB07wj?=
 =?us-ascii?Q?zVedXVDoYU9NvP5R+jErVXzJLmOoMtgySfoU9LFtOfamFvhOuOHD4Mnh77vn?=
 =?us-ascii?Q?d8yAm+2C1I/GPPMcHjEutstM?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2672.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1bf71da-c3d7-412d-071d-08d9140026bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2021 22:08:33.0543 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F3yZ4XxYcWzJ1KvTUDmAj5UQ9DCIrwFyjSeyz4kl7FVq6ejOYwsG6Qje4vy9uYZ59wE2qUTrPtPfAtv8rmShPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2734
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

[AMD Official Use Only - Internal Distribution Only]

Acked-by: Ramesh Errabolu <ramesh.errabolu@amd.com>

-----Original Message-----
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Kuehling=
, Felix
Sent: Wednesday, April 21, 2021 8:31 PM
To: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
Subject: [PATCH v2 09/10] drm/ttm: Don't count pages in SG BOs against page=
s_limit

Pages in SG BOs were not allocated by TTM. So don't count them against TTM'=
s pages limit.

Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/ttm/ttm_tt.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c in=
dex 5d8820725b75..e8b8c3257392 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -317,9 +317,12 @@ int ttm_tt_populate(struct ttm_device *bdev,
 	if (ttm_tt_is_populated(ttm))
 		return 0;
=20
-	atomic_long_add(ttm->num_pages, &ttm_pages_allocated);
-	if (bdev->pool.use_dma32)
-		atomic_long_add(ttm->num_pages, &ttm_dma32_pages_allocated);
+	if (!(ttm->page_flags & TTM_PAGE_FLAG_SG)) {
+		atomic_long_add(ttm->num_pages, &ttm_pages_allocated);
+		if (bdev->pool.use_dma32)
+			atomic_long_add(ttm->num_pages,
+					&ttm_dma32_pages_allocated);
+	}
=20
 	while (atomic_long_read(&ttm_pages_allocated) > ttm_pages_limit ||
 	       atomic_long_read(&ttm_dma32_pages_allocated) > @@ -350,9 +353,12 @=
@ int ttm_tt_populate(struct ttm_device *bdev,
 	return 0;
=20
 error:
-	atomic_long_sub(ttm->num_pages, &ttm_pages_allocated);
-	if (bdev->pool.use_dma32)
-		atomic_long_sub(ttm->num_pages, &ttm_dma32_pages_allocated);
+	if (!(ttm->page_flags & TTM_PAGE_FLAG_SG)) {
+		atomic_long_sub(ttm->num_pages, &ttm_pages_allocated);
+		if (bdev->pool.use_dma32)
+			atomic_long_sub(ttm->num_pages,
+					&ttm_dma32_pages_allocated);
+	}
 	return ret;
 }
 EXPORT_SYMBOL(ttm_tt_populate);
@@ -382,9 +388,12 @@ void ttm_tt_unpopulate(struct ttm_device *bdev, struct=
 ttm_tt *ttm)
 	else
 		ttm_pool_free(&bdev->pool, ttm);
=20
-	atomic_long_sub(ttm->num_pages, &ttm_pages_allocated);
-	if (bdev->pool.use_dma32)
-		atomic_long_sub(ttm->num_pages, &ttm_dma32_pages_allocated);
+	if (!(ttm->page_flags & TTM_PAGE_FLAG_SG)) {
+		atomic_long_sub(ttm->num_pages, &ttm_pages_allocated);
+		if (bdev->pool.use_dma32)
+			atomic_long_sub(ttm->num_pages,
+					&ttm_dma32_pages_allocated);
+	}
=20
 	ttm->page_flags &=3D ~TTM_PAGE_FLAG_PRIV_POPULATED;  }
--
2.31.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.f=
reedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=3D04%7C01%7Cphilip.y=
ang%40amd.com%7C2c56b6451f56454af1ed08d9052e6395%7C3dd8961fe4884e608e11a82d=
994e183d%7C0%7C0%7C637546519067581184%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wL=
jAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DeM=
VIddYdHMgr4TKyeS1fsjQbYVKvzg5D2EgzreknCEI%3D&amp;reserved=3D0

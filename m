Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 833261A4570
	for <lists+dri-devel@lfdr.de>; Fri, 10 Apr 2020 12:58:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 491CA6E17E;
	Fri, 10 Apr 2020 10:58:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2075.outbound.protection.outlook.com [40.107.92.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DB816E0D4;
 Fri, 10 Apr 2020 10:58:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EoErLRbiKq80DcyhNatMF6ow3K8AvzfpAm7uK9KveXcP96pN8Rs7MBWd3jPRCSVuZBJ8REDnnqa16Zgqig+8DthlORfHqwHYWuWFkWlwZEgh5AZXbY1duSwN91kPOTGx3Yg1IJFmqy5HUfpLPqs7M6XqoEwLW2Gqh3WTfNSnISQPegRGqlKx4vsfeUvXwBs/TeOYYoc+GVvP2Lhdvhp6SHv9/AnRud0AqfsGnD9ZqgNxFiVMGZsncHmeDkrqibUMXLmhSRbSL5i1kaMY8neQHf0q5NZnzboKf0067mZPfJs+fI9ZLkk7ElOTl+j4NWzWppN+u950CbewIk794GrEjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/UKeaRx36gcdW60QkZkz5GonuXTLlhTv/hWNtApQtXk=;
 b=c6xsZhV7Z9o5rLPxnjaFw32giWuQTDgsQ+olzIMHQdsdnYdSWYvzHKGzflS+IGhys6PTvanan9v9h+awe5QKCg1ULEeg5ZXXo/iulEEF8/8fayEOnL+UoDAY/pSaXRwDTPXdL+gOTfZhsNRsbLvPnTEBSE3w6Sxuly+rNOqXTH+z3KFWz2fmafVu1mijr/SmXAEHy17b/t4GdMFnPmFfGaJ6sYNyzoqdJn3Y2aSiMe/mt23m11GVf7r2VS/Zahz1tCmPLd5wJO0Yankn+FvWBe9mGxAdkj8SYo+S7Ewnie8UvKq98s5NyE1+E+wVLEcdt9Jv1wxnoNtknvWEtBxVBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/UKeaRx36gcdW60QkZkz5GonuXTLlhTv/hWNtApQtXk=;
 b=cXBs9ADXyppCE8ifaNKMryNvnG3svYwLCUNVOJkm8iZAzqDNSzcrBuEQxL6Uq9Bllo3pPmNGv6Bgj3F6tPX/kkGd5dACkThU6IDakxRW2oAt0oKKMMsQ3EFK4UQ2oORXbibUn7iZHWAXgbTw2oTsLjPow8qilJUXDZGaDyCWQ8g=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Xinhui.Pan@amd.com; 
Received: from SN1PR12MB2558.namprd12.prod.outlook.com (2603:10b6:802:2b::18)
 by SN1PR12MB2366.namprd12.prod.outlook.com (2603:10b6:802:25::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.15; Fri, 10 Apr
 2020 10:58:45 +0000
Received: from SN1PR12MB2558.namprd12.prod.outlook.com
 ([fe80::ec5f:a26:8530:3b9f]) by SN1PR12MB2558.namprd12.prod.outlook.com
 ([fe80::ec5f:a26:8530:3b9f%6]) with mapi id 15.20.2900.015; Fri, 10 Apr 2020
 10:58:45 +0000
From: xinhui pan <xinhui.pan@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/ttm: Break out the loops if need_resched in bo delayed
 delete worker
Date: Fri, 10 Apr 2020 18:58:25 +0800
Message-Id: <20200410105825.2492-1-xinhui.pan@amd.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: HK2PR02CA0155.apcprd02.prod.outlook.com
 (2603:1096:201:1f::15) To SN1PR12MB2558.namprd12.prod.outlook.com
 (2603:10b6:802:2b::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pp-server-two.amd.com (180.167.199.189) by
 HK2PR02CA0155.apcprd02.prod.outlook.com (2603:1096:201:1f::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2900.15 via Frontend Transport; Fri, 10 Apr 2020 10:58:43 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [180.167.199.189]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 02d2641e-eb97-478c-845e-08d7dd3e2366
X-MS-TrafficTypeDiagnostic: SN1PR12MB2366:|SN1PR12MB2366:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN1PR12MB2366DD50432D40CAFB83C6C887DE0@SN1PR12MB2366.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-Forefront-PRVS: 0369E8196C
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN1PR12MB2558.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(376002)(136003)(366004)(396003)(39860400002)(346002)(66946007)(86362001)(6486002)(450100002)(316002)(4744005)(4326008)(6666004)(5660300002)(2906002)(2616005)(52116002)(7696005)(956004)(81156014)(1076003)(186003)(8936002)(66556008)(66476007)(6916009)(16526019)(478600001)(8676002)(36756003)(26005);
 DIR:OUT; SFP:1101; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F8E562K3Po4Ab4nDWT+c1K7I5lXdkvJ4XBaHvSW8AftNERs8auyr00kMjUjDMjNh52duFIVQ3v+hXc+M6XcuHQOhjaJGP4Vb5w62uhrkhTNZWn/0i1sUxiORZzw9zX5Z7BG3RIgzMeHCn4qVJKV4In8bIabF9xDHr8FXqTA1tJfb+aXNmG0wzGtcEDGIMDLlMZ00Lp9nb8f4QuHPTFOVTJ0S3mY/Q7WUJHPUBpvmdTHa4wGBJyFxy33AohyhY2o6SaSRsR/D/0jlWZtrLMKLDwYHDvX6IS9peZWYa4UVIqebSAO1Vew5Q7DcrR4ud4mPLDld1JT+QB84OqumeeExVSkaMg2FgNfWL8lgOHExfe9uNLBFbaCbqSicekEDYFMRmHpyNLUrp3YvDtt5GfGWkGcFug8sl8r7cGfmNYJ2ehDldUVtZ0MU3NnomwIFZoaw
X-MS-Exchange-AntiSpam-MessageData: av2xQJZnwn57n6Trm/14VLMsCeefAUapg4fCclXlq0w/jDm9kL6HvOti8upuGVhCp88oeuJmx+eIRPzfUPPxvngXYdm7cVyS21/UFLHYB0PwlpTCBEo6uCLtb4Zh5xPmqyS/ZRisEg7yK9R2UuHfWw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02d2641e-eb97-478c-845e-08d7dd3e2366
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2020 10:58:45.2793 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2hEz91cGBu5G+g6abquMwch9/lSU0CT4AYxTvqtcb/1K77VuUhgFSH6ZWQzbx+5I
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2366
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
Cc: xinhui pan <xinhui.pan@amd.com>, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The delayed delete list is per device which might be very huge. And in
a heavy workload test, the list might always not be empty. That will
trigger any RCU stall warnings or softlockups in non-preemptible kernels
Lets do break out the loops in that case.

Signed-off-by: xinhui pan <xinhui.pan@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 9e07c3f75156..c5b516fa4eae 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -518,7 +518,7 @@ static bool ttm_bo_delayed_delete(struct ttm_bo_device *bdev, bool remove_all)
 	INIT_LIST_HEAD(&removed);
 
 	spin_lock(&glob->lru_lock);
-	while (!list_empty(&bdev->ddestroy)) {
+	while (!list_empty(&bdev->ddestroy) && !need_resched()) {
 		struct ttm_buffer_object *bo;
 
 		bo = list_first_entry(&bdev->ddestroy, struct ttm_buffer_object,
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0542C37C01D
	for <lists+dri-devel@lfdr.de>; Wed, 12 May 2021 16:27:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A791A6EC25;
	Wed, 12 May 2021 14:27:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2051.outbound.protection.outlook.com [40.107.223.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 033DA6EC21;
 Wed, 12 May 2021 14:27:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iKmbXIVIz740lvjNIQ0mLeWN2GULnqI0leMhUy8lsRkI/LG/26YZhEWHdN2ZoUIBsdS/MA1W4OqrSR4sKfuclcJZTe1NG0Dj1aLjK9QLnIFmcC8Su1+QBDLh7FWQvW2fjILOu8UjasOnMORDE9hs+thKEfLF24OV/TKxG1+foJNRycudfcjp856Rzx7Stnl+hhk1Gx4gdDMRRyGqOKDT6c006kkVHMOFJVVfc+SJops7mdBuBlAe60lcNXlmvFK8pEFvuRJDC9m/aDFBw1u0iNIEh/5jGMFSNV4oKMHviqPbsjghh00oyH7WiR+xg0lW8zzzvgc0KAQTlF9Xd0cPsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y9T0dd+0o5MpTwVzYXgN4zXaKXsjwhA7tqNN2ODWw44=;
 b=fidbEuDx4TBBgumRdkQyuJ39qIL9bYt/jWC9R2WPoLxEdAHcSYlkBzWFjogHpVG9Cy6t0JemHnsQnXn9oCpqK28n2xs5Y3fAThM56eifh2PqfuQb/k3lGOf879nzVsafWr4HnSE0+GP3YssCLLcWFV0VGxM0lCWURCYLyowJiOCTvdQs8JEo7CeNWXGtbOLgEBwikrDw9c4K4d1avCJwp8ISCIMH85fT0DuwFJz/8K3hGuCo6NBD0xFcG7adZ+b1GlDa6W5d325rb5n0bNaIIM8dXw9UQqhv8IjAkjVhyWDA/pl3RmNhmeG3cVpcSbEr4o1YzrvKLfxMa2hqkML34Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y9T0dd+0o5MpTwVzYXgN4zXaKXsjwhA7tqNN2ODWw44=;
 b=GGGmrT9MA/Y1PBzi6advQiXfPOBzUgweUmn4Og6SbED6EiBSslkjNOJk24TFn0Dg8qOg7afWcfJv9VQsSj85ftKiFxsP8dSIGdnCfUj+SfmHYWZkUJUmiogKogztbIL/JBYUO807hBltX5U4FQnjeuyZSPE5Hw6VqFd14Q3ZuMk=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB2655.namprd12.prod.outlook.com (2603:10b6:805:72::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.27; Wed, 12 May
 2021 14:27:42 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4129.026; Wed, 12 May 2021
 14:27:42 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, ckoenig.leichtzumerken@gmail.com,
 daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
Subject: [PATCH v7 15/16] drm/amdgpu: Verify DMA opearations from device are
 done
Date: Wed, 12 May 2021 10:26:47 -0400
Message-Id: <20210512142648.666476-16-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210512142648.666476-1-andrey.grodzovsky@amd.com>
References: <20210512142648.666476-1-andrey.grodzovsky@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2607:fea8:3edf:49b0:7576:4f76:97d8:1487]
X-ClientProxiedBy: YTOPR0101CA0032.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::45) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from agrodzovsky-All-Series.hitronhub.home
 (2607:fea8:3edf:49b0:7576:4f76:97d8:1487) by
 YTOPR0101CA0032.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::45) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.30 via Frontend
 Transport; Wed, 12 May 2021 14:27:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e7fc7ee3-4694-4272-4a18-08d915521a45
X-MS-TrafficTypeDiagnostic: SN6PR12MB2655:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB26555D1675A633DC813BB726EA529@SN6PR12MB2655.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 35aEVVycR3xugV1itAF2X1WDzwEQWf2grfqI+lMSpat1x1SJJa0NeWGgPlWyCPWIqTwiUzOyWQSEcqHLzcgmOcxZiqi9aqn7KM5lG71hpDt0ET6KWCEYVYnKu8hwgpgzfM3N6qWmPoBYhCD6q7SoTMfATg+Xq7w4JbRFMMLbeoKbB6EikH57yej6wkVIbbV3rNjJKjVjiKArMJjmE5veMO8TsBFwg43GkqKOqofvULv6gymvR/NGV0a6k0XOrZjeTHuEZG6rwv17TI1snI4P8J9IMRUWvAlLQ3pGOJ78dlyL4vaQW3qs7YXYPRN7tQLp/WJBwReWQCd3zaSqM3xaqJRqI3ZtDpWnfsTtcUrw94dRtdHuEYy09E9L6Sb9UMm7gdrTEqXkLVo/LN99MstQnnkn/BC6lCxUS8Bzoxxtd+1e6DKnpwPzfi5yVgEWmA6YwdyJEMr3ongdEmzK2R+WJzkQYHiBRHFMDd92/PGhjkQb1wrl3N/fihS91se4ngcPb1U4WfGiZbbthHP/XSiACDAQZWi47Q3ULLxWzmRQYbgJqQsSuzrU2jA10UX9zzznjhJm1/jSJF7f2TrQzRs2Q9LMESJPtYm2FIZPXaWfeJs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(366004)(39860400002)(136003)(86362001)(316002)(186003)(16526019)(66476007)(1076003)(4744005)(6486002)(36756003)(52116002)(2906002)(5660300002)(8676002)(6636002)(478600001)(6512007)(38100700002)(54906003)(66556008)(66946007)(66574015)(4326008)(8936002)(6506007)(44832011)(15650500001)(2616005)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Y0VFbUQ2d096ZTFLZ24wTml0ODhzTzZiSnJta1Zsd2pXb3A4MnZZWHBXUXgv?=
 =?utf-8?B?cjdMZ0p5Q1pERWcvNnhBME1SUlRkcExJcERUN3dQVjBkc0JDcjRsd0Z6TFg5?=
 =?utf-8?B?NTlET3VyNisySXZLdEd2c0FIVTlZMm8xRFVaa2MwNnZJWW9rbWpoNHNIVVU1?=
 =?utf-8?B?RFBFSHFqL1dDK3dIa1ZJWG1EN2VxYjJ1WXl4QVQwNitCMi9wcHlQR1htYTRi?=
 =?utf-8?B?aExRd0pTeGZsZHQzL2hiZFo1RERyRmxOU3RqRkZQUmRIUm9oRkluYmNRdnA2?=
 =?utf-8?B?eE9mMFhCMnAzN0RscWc2U2VtTTYrT1FDd0p1c3JGa1l2UHlheGVFTFRoeWw3?=
 =?utf-8?B?dElWSGRSdkdiZU4xZENGV2U4OTFBZGRWNGdJdXNUL2luM3hraDdaR2hxUFZT?=
 =?utf-8?B?TitCSW0xd2RXcVFjZXN2UEFONENuRWJWYnZTRVR0WDVmSThUdG9BTzZxSnQ5?=
 =?utf-8?B?WXc1UkNCc0hjaDJJOFFzbHJCb3NOaU9IOXVoeTRzcnI3b1ZJb1VGNm9HNEpm?=
 =?utf-8?B?YmtscjNGa3dKQmNJbnZvWFZ3MEF6dFdUQ1FKb0ZQVkQ2eFZMVHZ2c09SODV0?=
 =?utf-8?B?TEZlZ0g3V0ZKVWtyR0U2blNYTUwvbk5iT2szVEQwek9zMm96L2Nyb3NKam4r?=
 =?utf-8?B?emlTZGhNSktBV3haWjRHa3JSaXVHSTRCdSt5N1FBSXpJa0V3V2RLaGlNK3lZ?=
 =?utf-8?B?cHlhelBtT09FTkU4TVVtaTVTUGF5VWgrNFJJQ1VUcHVENnJZa0dCVXNNQlZy?=
 =?utf-8?B?Qk5yZWltdkRMVXJiYlhHeU5QS1FDdG5qSW5maFZ0M3R6Qm5kQ3RiL3RBS3Qy?=
 =?utf-8?B?YWF5OHVvaXppWFpKbzNXNnhwck1NYWFpNThSMjR4elZJTzZydEFyQXdlSTB6?=
 =?utf-8?B?OTkvbzY4aFNhdEljR0I5THpIeXJpZ3dCenppR3U1VTFRb2VEUlRUQjlBNU44?=
 =?utf-8?B?V1JsWURPcXRBWEppZDc1bmttZ2E5ZEgwcE90ZTRZSzV2b3VSdUhGWmFTVVEz?=
 =?utf-8?B?WlBhbTEveERKMTBKTzBjOHdZcnI4MVJMc25nbWUyOEZrd3JZR2xJVzZYQTNt?=
 =?utf-8?B?Ni9JYkZZNzNOYlByVkdmRDVMRmNVMWk3ZnJXWmZMWm9aRUc0cXRUc2JpMC9Y?=
 =?utf-8?B?U0FaRCtrTlg2Rlkzd1VMMnh2SWNVVVFxa0FCWFdTNSthRUpsZ0thQjZYRHVa?=
 =?utf-8?B?UlUzelpuWXFUN0lOTnVoOGxNMHk0MlMyVDFaWmhpWnhCZC9WaTIxQml6WTBT?=
 =?utf-8?B?OGkxb3dZWkVZUDRrbVhEbExLZERvOGRuZ0Z3cy9oUUtBaUZ0eFVSK0UyUHcv?=
 =?utf-8?B?YzljanJaOERmZ1lmWHo4Q21STFJ2bUEwZ1lQWWlBNTl6K3FDWUROM0hpMWVH?=
 =?utf-8?B?ZnBFK2NGRkVpcC84Sy9yK1gyMkx3T3ppeTZFS2FNMEdjb0pJdk5rc1RsZDhl?=
 =?utf-8?B?bXpIZFVuQjB0cGwyM203RC9pNzE3VHJLY0cySGxDV1BLYld5NmNraGs1QWVF?=
 =?utf-8?B?OUkxRTlWeEF3dFpWVW52dEVLazErODZWYTg4T0lKd05BUWo4K0FrTklqUnB6?=
 =?utf-8?B?dVBuMFZUUFBNeUZTdG9wUkp1aTR0MDd0eHZXRUlUY0pSRWM0V1ZETVNDK3dD?=
 =?utf-8?B?dUh4QXdKUkhxeDFZNUd6dFVKdVNGb3NQT1pLQmVLdERpcUVLZExLU0JXRlBI?=
 =?utf-8?B?UVc4VUhSVllObUpOajlpOWJ2SHpTbWpCWVRIMWJSallaeFkwdm9jL1llcnNx?=
 =?utf-8?B?ZlFRWVRzd25ySzM0NlBUTmM0OHJtNlhCeGR2TytBSVRWQzBMdlBFT3V5eStX?=
 =?utf-8?B?eGQxbnNnTUJvcTZDL2FwSzVRN3g0L0lscjBvbjlHdW9JRmdYa29MZzI0SDJV?=
 =?utf-8?Q?/JD4XCtEoF5AC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7fc7ee3-4694-4272-4a18-08d915521a45
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2021 14:27:42.3854 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rsEIMopaMfYvp77SD6zSyECvOmb5s2/E/sryRK/pm2DIsy0hFkRp+WyHowgklbJw5i8h5WhZm5+P2SilLXQq5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2655
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
Cc: gregkh@linuxfoundation.org, Felix.Kuehling@amd.com, helgaas@kernel.org,
 Alexander.Deucher@amd.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In case device remove is just simualted by sysfs then verify
device doesn't keep doing DMA to the released memory after
pci_remove is done.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Acked-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 83006f45b10b..5e6af9e0b7bf 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1314,7 +1314,13 @@ amdgpu_pci_remove(struct pci_dev *pdev)
 	drm_dev_unplug(dev);
 	amdgpu_driver_unload_kms(dev);
 
+	/*
+	 * Flush any in flight DMA operations from device.
+	 * Clear the Bus Master Enable bit and then wait on the PCIe Device
+	 * StatusTransactions Pending bit.
+	 */
 	pci_disable_device(pdev);
+	pci_wait_for_pending_transaction(pdev);
 }
 
 static void
-- 
2.25.1


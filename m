Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C05FD811526
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 15:45:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6696110E7C2;
	Wed, 13 Dec 2023 14:45:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99D3010E7C2
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 14:45:43 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BDDU2F2028726; Wed, 13 Dec 2023 14:45:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :content-type:content-transfer-encoding:mime-version; s=
 dk201812; bh=mKqL3hGSVWIOEB+LEXIpZX/b9JJN6fAwNwZP7XgmFz8=; b=pIv
 6Ydm7jKiU5S2FQu7KmI2FE0DrfGJoz4lkpcXrXFQqa/DaWgiYzEbq3HvjpamZTJR
 fe2WV5jaWu0xraaxjLntkCn2e9By3eDRH49KIbJAJ+RmR/jM9m/5nujwjIj6EWbR
 mbo1ce/M0PUPze0K/RXMDMW1mvMZmaLpbYv58L0BI6XrtXNW+u2zKBm5DAzxSCwk
 E5116Z+9l4IEXRVK7Xs1ptMQddHg4S4SCrGsXOxGtmWH0bgnFXDEXVfPkGKBnwQi
 2MMofM7UK30kVoqyh/3yC8X+gFBLK9TnL1gNgT3+REDIG6avw6oi3Jemxh7swf+J
 UsuxT5Hv+oCAwVyfusg==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3uvfcsan3m-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 13 Dec 2023 14:45:00 +0000 (GMT)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Dec 2023 14:45:00 +0000
Received: from GBR01-LO4-obe.outbound.protection.outlook.com (104.47.85.105)
 by email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 13 Dec 2023 14:45:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kLeCJP9l10EBtJLtmlSlNDltIaVFkOIISGG4cLLbK/uevRsv2Qb8J7k2fWKywxw9e3ESgZpHulyaQ/E046elrnpDiUpOp6yKFwQc8vVuMexfy4TI/UhixdDR8CVLBndXI1auymxDSOYPyW0Xzr/ifS6tzP2yE4jRnDpCWv0dztrc17/0gLhpvxvqZW7Y64MztOiZqljUriEdhSe+SZvtC7lbrxw0USsab3SQlSuakgR9LjWUf5UTVEwBxRigB0jp44iumevoK2NP0Dn4UjIQsP4H0JUPq5EGm0cQA/0yEXcEQXx4JHdZ/Mi81+hZdK5M3hXdDrt15ywo4t8gbDePCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mKqL3hGSVWIOEB+LEXIpZX/b9JJN6fAwNwZP7XgmFz8=;
 b=NhcpnpCSymnamNhhWcUZnGYXK5kpOMqElOYvqYXeQVjsWc/8A8g32czs0oPrzOJd4BjV5C0cYv19mHBT7TkjuGb0mrj9k/r2zDfZspvy3J5yQnHJF+1wB87xEkJGmE8/7Z4+b+DJp0/Z74oYzdPtjJ1qfz00tOv9hYEFx3SH9tLfRFI3NiWkwDRMXFckVIe0oRZ7gdoIOei2Mt+zJT+NJAnTUWlsLJe1p4o919DKbuJH/EtiebkXHY2sS5yVahV4736vw8Q5ol/sHiKbN9jNt3EpfhXuW+PYhYtRvQJAtH+3IS8eSPh5vB6haALMg8eMkLjR1bS86F/Q/IOU7diObA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mKqL3hGSVWIOEB+LEXIpZX/b9JJN6fAwNwZP7XgmFz8=;
 b=fNwNtvw9PULy9FDAarQMmVbjuZ8qFErQ2ic0PdsQ7EFQtRO3rAl59Hz5fiyQ8CBUPCA/gLLDUD9LhyTA69580qNyBRdNx2hLDat3btdSFnAR6hWUMlqVEWGf29whVe5SR1Zor6sCkYjI1MPLKwh4HHsbeLrKDgTVM+o+SAJHB5s=
Received: from LO2P265MB4600.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:23c::11)
 by LO0P265MB6535.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2d0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26; Wed, 13 Dec
 2023 14:44:58 +0000
Received: from LO2P265MB4600.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a3f5:aa1a:ff75:79a2]) by LO2P265MB4600.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a3f5:aa1a:ff75:79a2%4]) with mapi id 15.20.7091.022; Wed, 13 Dec 2023
 14:44:58 +0000
From: Donald Robson <donald.robson@imgtec.com>
To: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/2] drm/imagination: Fix error path in pvr_vm_create_context
Date: Wed, 13 Dec 2023 14:44:31 +0000
Message-Id: <20231213144431.94956-2-donald.robson@imgtec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231213144431.94956-1-donald.robson@imgtec.com>
References: <20231213144431.94956-1-donald.robson@imgtec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0332.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::13) To LO2P265MB4600.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:23c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB4600:EE_|LO0P265MB6535:EE_
X-MS-Office365-Filtering-Correlation-Id: a2d9e9ce-fd66-4151-ea94-08dbfbea144b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tq2er1L7UFHfA5+FhSj91AtFNeIFbeOBwWgv2t4FxQibLHAxkQte5sa2CerZFpLNydgGMRTCCua4zi0pA4Nk2NvawyLERnXqXOUUY2NCGPCdfD2/jv+X5Xo9RVAq3BUI/Y82zmjw1GaqAP9apzY2+t57ctPZU0VWvoXoTciSUx0ZWnmIQsn8aEWznCwiWSyq7ydido9o9maNRBEmGimodZXt5bQQzaY/D7jSyO8CvFNfGRNhQOhvxToz3Dn1p7AIftbKK5r3ttQPS9GtdXWi+IKD3JJUar7SIU66sNMSDG0yzD6sA4bvXpeEqdmxNuwVR6bS5fqLvQoylBW3o3DbyVSx8CFb0RUOjmfInz8uz0PoNCVZvyv2zN5kilos6ib4VdQqRPZq/kQPABFjvRr/I1ZyGQkJdvld+O540COgLtFXrShNW7IkGtqsbFz9DWamqJ37+BP/jCCBtsrIY/pPm2pTrMxEPPSJP24DqUIWqnigxZtEJypbyFNEcGxtcAt5z4Ise0Nwy0H/pKL2NLddmGsSjVS/pUa8cyCbXerSZk4r7uf/POyfTrdwKo2lAyN+wNRfmlKHguboKJZacKXY7b1EPp33cN+7KSNxu75y0gYDH2txLYIIOVFgUO+3wtZm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LO2P265MB4600.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(346002)(366004)(39850400004)(396003)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(2616005)(6486002)(26005)(6512007)(1076003)(478600001)(6506007)(6666004)(52116002)(83380400001)(44832011)(66946007)(5660300002)(2906002)(66556008)(66476007)(4326008)(8676002)(316002)(8936002)(38100700002)(41300700001)(38350700005)(86362001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0pnYTU0WWd4ZWpRS2NrMVkvN2JOblRrTURQeUZIdTFVV2NLVUhSRHdWd1dp?=
 =?utf-8?B?RnBGc203NENDcTYwazFmZCtZbDhJYUdBQU9GdFgxRUtHUjVvcCtxLzFKRmhp?=
 =?utf-8?B?N0owVmxEN0Y3Q3B5ZnIrZHk1bStnYkxTbTBXUTNNcGhrMjdCRlpYN2NlWXI1?=
 =?utf-8?B?K2lFUW9WeTRlV1FQc3lMZ3IvdnJkKytYcGdpTDc0UVFOc1draEMza24rQ1BF?=
 =?utf-8?B?dHptWCtMeEt5MGtRWEtVSk9GcXJBa0RGMjRteEhEQVV5U01Vc1ZwZEpSd1Rz?=
 =?utf-8?B?ZGNXVEEwa05ndXRYaGNxaVJrRTBFYUJNcjFlbEh6R2owalB1SEI2TWM0Wm82?=
 =?utf-8?B?V0lzQSt6c0lPVE4xNlZjQ2NTbGhwekIrRGIrWHZ1Um9mSXR1OWN1bERHUDJ4?=
 =?utf-8?B?K2VnbUhjcGIxUU9YL214UmpCbEdRV3FBcWxNMXZOZVdWd0FFMFRIZC85UkJz?=
 =?utf-8?B?WldMUEcvdzN5RHZERkpERUVHbGJ2ZGRxTlBPQnhPVXUvcTdGNVBkTXBrd3Zo?=
 =?utf-8?B?UTNMeVhUbTdhSTIvcCtVUHJlZkxpOUhLMmRyMTdqZXMyS1Z1ZmdLSDdnSFUr?=
 =?utf-8?B?ZmxIRk9rOVhVLzVnYkdpRjdtSVRLcTZpdW4yNklhbGpsY1gwSU5GN3dHTC95?=
 =?utf-8?B?bEg4Q085QkZSYkZDbjdWM2x2OEx5U1dBR0NkWTN5YkZacDdXdHloRisyUm9V?=
 =?utf-8?B?Uzl2ZXhoa0ZTM3dhYkc5OU4vUERWV21KbCtCWjR1eC9QaUUzM1drWERqQXJN?=
 =?utf-8?B?L2R2U2pTU1ZXRUxlM09wUEZ1WjQrUWl0cmFLc1o3NFVKcUtNazk2a3MvTWFH?=
 =?utf-8?B?bDkwVGNIRDFOUCtUWkFoWnZyK1pRTTdPNGV0YVRod3VpZDVxRk1lcCtnR214?=
 =?utf-8?B?MDBxQ0pick1aY1JXeXYwSDRpam1EeXErYkdPbnFSYlpzSUM0TGRxN0lWeGor?=
 =?utf-8?B?bDJ5VEdXSEpDWXhiTjhyeHBCUUYwbjhMdTFFd3ZQQW1CbGZSM0tSN1RrcjZr?=
 =?utf-8?B?R2RQOUUzajlhZkhXa2M3UGhDREFLeUxCV2sxaTRTRlNRMEI4TmNYUVFXWjN1?=
 =?utf-8?B?N2NRMERLWStkNjNYdWlibWhOWE9rMDdtVXFSNTNvejZCRVFOV1JFL2ptUjVu?=
 =?utf-8?B?SlpaMVJ0aWhYZHRmZ3Q5NU9DbVB3TGhrQUtUN3lUeWVVOWVYV2FZdW1yYVQz?=
 =?utf-8?B?M3hBcFo5dEdyOWVoa21YQmxoR3Z2NE9Lb2FzQzZuckM5OENaZEI4djJRTk1L?=
 =?utf-8?B?aGRVVTA4REpLeE5OMmg2WGdzQ1Z3OEVjMzIzankxSU9SQ2ZDREJPR0lUVHNp?=
 =?utf-8?B?TjNlZ0hTcStSRFhLRDhxbmY5ZmpsbnZERStjOEl5SXpKbUErUWRLZC9MbWVu?=
 =?utf-8?B?TFFNMXBpSVJVUDd5NFE4ZlV3RHdLSjllV0kvTnRNNS94UFBrRUYrU0ZmSE5i?=
 =?utf-8?B?VzU3KzBMQVVkMEFXQk5JSzRtSjdOZGFJZGJLM0puRHpBWHgyUVBQclNCWU14?=
 =?utf-8?B?UTV2bmhCMGJnbGR1VzNMYVQ4WVRpV2xKcnYzTTFaeFlGdEJ5dzlQVHJneHVK?=
 =?utf-8?B?amRKTnRBck5CMjNDc29DbzltWldPdllEeGhZdlA2Tm9OcDdUMzMxTlRRU1ly?=
 =?utf-8?B?alVBbGxhdUZ1eWNsMXFHNjg4VWE2c1Nzdzd2Ykx5ekhJRHpPMWJBSDFSMU42?=
 =?utf-8?B?Wm9oeEVEOXovNGFZc1RWaDRXOTNYQXgvUEFJbFd6UDJQL3RVKzhvUldUaEtD?=
 =?utf-8?B?a1k1TlF2LzhWOUNNQjcrdFNJdjZZUXJVYWhTems5U2E4ZERZdGsrczBpZUhB?=
 =?utf-8?B?ZVI5aG83SGswMUxQazAwcGNvL1l6dmVwWWR2eTVYNFlXTUdoZG0yNGpaVm1a?=
 =?utf-8?B?RzFjZEF1a00xajV4aWs4WEd3UU1rdWhOVGtPUUEvUkFsYmQ1dWpLeVVuVnBK?=
 =?utf-8?B?ZW13TW5tSFJIeWxKRnQ0WVAzTUdrQUF0U2poS2hvKzQrcjZKbWRQYTlQQTIx?=
 =?utf-8?B?NDczeEREYTNZdHhqSGZTZHZHZnpLUVNmUURRcnF3elZKelRrYk5Nb1BqeWli?=
 =?utf-8?B?b0FGODZZVXIxOC9UKzZPZXZvOWowTnh1TC9TQjlQQ1pvQUFYWGh6Q2U0cU13?=
 =?utf-8?B?c3grOFVBaStZVitiQ29vVG9kQUtmSjM2bVh4cGpJenBBMHczN0tSazJySXc0?=
 =?utf-8?B?QXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a2d9e9ce-fd66-4151-ea94-08dbfbea144b
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB4600.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2023 14:44:58.5801 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C4hHqb50eZMuPwBIgybp32iXdFDNXsX0kGTRXOPsyJNuRkeBNL/46y73CwQIP1r4g+hERyx1lRkLQcUgBph62Go3Wr3m5DmmwFrb+kVG3A8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB6535
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: VisxgRGilwb-l1GAxT7Qt03AVJ-pD4pi
X-Proofpoint-ORIG-GUID: VisxgRGilwb-l1GAxT7Qt03AVJ-pD4pi
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

It is possible to double free the vm_ctx->mmu_ctx object in this
function.

    630 err_page_table_destroy:
--> 631         pvr_mmu_context_destroy(vm_ctx->mmu_ctx);

The pvr_vm_context_put() function does:

        kref_put(&vm_ctx->ref_count, pvr_vm_context_release);

Here the pvr_vm_context_release() will call:

        pvr_mmu_context_destroy(vm_ctx->mmu_ctx);

Refactor to an unwind style.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Donald Robson <donald.robson@imgtec.com>
---
 drivers/gpu/drm/imagination/pvr_vm.c | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_vm.c b/drivers/gpu/drm/imagination/pvr_vm.c
index 432168aba577..93155eccc50d 100644
--- a/drivers/gpu/drm/imagination/pvr_vm.c
+++ b/drivers/gpu/drm/imagination/pvr_vm.c
@@ -598,23 +598,12 @@ pvr_vm_create_context(struct pvr_device *pvr_dev, bool is_userspace_context)
 	if (!vm_ctx)
 		return ERR_PTR(-ENOMEM);
 
-	drm_gem_private_object_init(&pvr_dev->base, &vm_ctx->dummy_gem, 0);
-
 	vm_ctx->pvr_dev = pvr_dev;
-	kref_init(&vm_ctx->ref_count);
-	mutex_init(&vm_ctx->lock);
-
-	drm_gpuvm_init(&vm_ctx->gpuvm_mgr,
-		       is_userspace_context ? "PowerVR-user-VM" : "PowerVR-FW-VM",
-		       0, &pvr_dev->base, &vm_ctx->dummy_gem,
-		       0, 1ULL << device_addr_bits, 0, 0, &pvr_vm_gpuva_ops);
 
 	vm_ctx->mmu_ctx = pvr_mmu_context_create(pvr_dev);
 	err = PTR_ERR_OR_ZERO(vm_ctx->mmu_ctx);
-	if (err) {
-		vm_ctx->mmu_ctx = NULL;
-		goto err_put_ctx;
-	}
+	if (err)
+		goto err_free;
 
 	if (is_userspace_context) {
 		err = pvr_fw_object_create(pvr_dev, sizeof(struct rogue_fwif_fwmemcontext),
@@ -625,13 +614,22 @@ pvr_vm_create_context(struct pvr_device *pvr_dev, bool is_userspace_context)
 			goto err_page_table_destroy;
 	}
 
+	drm_gem_private_object_init(&pvr_dev->base, &vm_ctx->dummy_gem, 0);
+	drm_gpuvm_init(&vm_ctx->gpuvm_mgr,
+		       is_userspace_context ? "PowerVR-user-VM" : "PowerVR-FW-VM",
+		       0, &pvr_dev->base, &vm_ctx->dummy_gem,
+		       0, 1ULL << device_addr_bits, 0, 0, &pvr_vm_gpuva_ops);
+
+	mutex_init(&vm_ctx->lock);
+	kref_init(&vm_ctx->ref_count);
+
 	return vm_ctx;
 
 err_page_table_destroy:
 	pvr_mmu_context_destroy(vm_ctx->mmu_ctx);
 
-err_put_ctx:
-	pvr_vm_context_put(vm_ctx);
+err_free:
+	kfree(vm_ctx);
 
 	return ERR_PTR(err);
 }
-- 
2.25.1


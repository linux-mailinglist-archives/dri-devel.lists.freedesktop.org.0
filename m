Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 300254854CE
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jan 2022 15:43:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AC2610F86A;
	Wed,  5 Jan 2022 14:43:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2079.outbound.protection.outlook.com [40.107.92.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F7C110F864;
 Wed,  5 Jan 2022 14:43:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DFI8I+dS9saoKCEnzcosrhw2cV036/2ckHi0zbG2lXf/xssjtibxCUwlVa8ZUhgNhnA9GkEilLIIReUeyD2Z+c/Vh8orplQd7kvVQxBrUR3fLhu2q57MsT5VqT6PF2a+EMqhnKDW5f+jBIP3aNVsVsA4pyXPMORAglYjtIRBBS4ApWo1u5L3pjZ0T1FxlaYpYQC76ivnZamUbvLgFyAd+KxQ1GybipidNSNrYQzy0Zc64LgYF6hG3joMjBS02UPpMFy8Kvn5FzieRD8SzCJbypLPom/uAuIm178+39GAzmAPMQGEPIqCGKQAU/k/mgfOvjyJRNh1nqr/op2aAAurbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l7wYAgceRDfR1/FsZ7jS2b6dKfRfCI5Y5KTrWfuArCw=;
 b=mS74nhoB3mkmXutfaguPzmPKYkhlRDjdrX3bJhzLacx4KA91Dmhj3axUr6OVETMhDjYTXUPQctpHHzpcXaNzpQSeWmg1NKJEfTLC6MH9inSnefe0HNLRdhhPImfklUWYYjDOZk1WCh6FSrJpCPJxwCuFEB0lw5qA1v4B7euV9WPNjy8dENLhDGWYTsuCSZSaVpE8ACJ9eIVoFZF5iDYdM/80uOk17wupSFDhexdKT7nc7lGHZtHaVtzD7GZCaYVlYXWNLtzg0T4Y/i8JOiGrfeedOemC0lMR+uxLutVagX2WJbqgpNpPbNYAN2EdpHOa7tVgrl76Po74OgLYLkLCag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l7wYAgceRDfR1/FsZ7jS2b6dKfRfCI5Y5KTrWfuArCw=;
 b=P16J3FyL/oPQ8HVAiH71jPXWIw/bYjH/ViHNXZ3M5dbBvqibA849SgObaQmE5xydKEPjNRV0BtZdWyDP4//lTGyfbJW75wjUvW6LZVUojYMEuv6NToiyZjLAYfc52ObndqMmSHWlmR/OEaCO6iCCsWLvsAp0p7BaZFiNPlFulSU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5149.namprd12.prod.outlook.com (2603:10b6:5:390::14)
 by DM4PR12MB5216.namprd12.prod.outlook.com (2603:10b6:5:398::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.14; Wed, 5 Jan
 2022 14:43:44 +0000
Received: from DM4PR12MB5149.namprd12.prod.outlook.com
 ([fe80::14cd:f56f:bac0:a862]) by DM4PR12MB5149.namprd12.prod.outlook.com
 ([fe80::14cd:f56f:bac0:a862%5]) with mapi id 15.20.4844.016; Wed, 5 Jan 2022
 14:43:44 +0000
Subject: Re: [Patch v4 23/24] drm/amdkfd: CRIU prepare for svm resume
To: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20211223003711.13064-1-rajneesh.bhardwaj@amd.com>
 <20211223003711.13064-24-rajneesh.bhardwaj@amd.com>
From: philip yang <yangp@amd.com>
Message-ID: <8ac68ab1-b9e6-0000-6415-2b6666ae1c4c@amd.com>
Date: Wed, 5 Jan 2022 09:43:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20211223003711.13064-24-rajneesh.bhardwaj@amd.com>
Content-Type: text/html; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR04CA0025.namprd04.prod.outlook.com
 (2603:10b6:610:76::30) To DM4PR12MB5149.namprd12.prod.outlook.com
 (2603:10b6:5:390::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dc288970-a30d-4c19-1d28-08d9d059c602
X-MS-TrafficTypeDiagnostic: DM4PR12MB5216:EE_
X-Microsoft-Antispam-PRVS: <DM4PR12MB5216A837E289A3B1B1C26597E64B9@DM4PR12MB5216.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Pzl7KRdR5wqGAS86+gwPbOtNw1sMFCXzm3kn4rxWtWC1pcELNumZ4PW5Hg+DPLTqP5L+7t2c6bJVphZC80KBTW6gHJtULm5lG5PhyatkZGAXDL7Zli+wKc+jfteiV82ogR5dIqGlH6O8vl+LJ6/RaZcgkdPp5CDZrfbJivv6vvvngQmlwuYWHBIvcw+EfeuKeC+SiTMq0puBQgpqJ9A32woFOcFcv+TlQijkYgJZSO9VrDGoJigSnEB8vJgAZRVm6BCo92n8omzUl4yJac3VzN/+L5hfXs0KqqCeBT4LLTrOGIXtlTV68ylqHgYBROsBvmx7GXMYevvKPvidzKeRxl7q23xMXZjPVykcDeHAhHn8Ru2Yw2X46N2fNdr/Faf69WaHDEwLeDDaOrZSD2a6uzuntn9mWYIWWTQEroB8ofDkF8cyItBa8tv1bcb1bTJ8v/yho5G3JtwqHMrfmZiBeYKbJI2y/t3Wce1qCPtnryfSO5pf/LvkNWrW1p8/nOEXBkPN+lFHTnzu1cND9rGbb6BwmMW7Cfjeqa5Ft8DVtO4EAJTmuWUu+dZatenXXb4V1MvN0I+1p0KnB7ZUFPOYKsG6G0HqQi2ACnTGjNFTXI8TkXiYHxNOXdhKwafsmTyRcH/cvqvxFQv6WciNebqViozzkeJ63d9PHxTWDrPiKLKDfHtzsXlF1WDq8Z4DSO3uIqIAVzj+DPEaFd6t2X/RCu1/0tn1NAxGl9EZbFdehbA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5149.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(31686004)(66556008)(5660300002)(66476007)(66946007)(83380400001)(31696002)(6486002)(38100700002)(8936002)(6506007)(4326008)(186003)(53546011)(8676002)(316002)(4001150100001)(36756003)(2906002)(508600001)(2616005)(26005)(6512007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZEJCaTNCOTc3aTlnc28ydlpmMmZrQ0NSUlFvUW9wMittUm1LdHdDMFgxSkNV?=
 =?utf-8?B?UGZ1cGRQUzRyVzN3Ykp3Rk1FZ294amhUbWx3ZFV3Y0JtSlhueEZId3FUanB5?=
 =?utf-8?B?dXk1cjJmQm9UK3E0eldrQUZlaGJQSVgyRUFncEhNSG5CRVpXRDFTaDNnKzNa?=
 =?utf-8?B?VzJQc00yYXh0ZG12bDg3SE45VmNwalM0OEZrRzF2SUJEVVdPalFNUHBydWRT?=
 =?utf-8?B?RzBvR1pqTnNqNHlSMVVZVW9adk05TitRb2tLVE80c3VLSUFDcS9DYWNLalFU?=
 =?utf-8?B?YXdiRVRvRll5eHRJU0VwY25zUVZkVEZEVjRVWjZqWGJ6OUNHZlEvNVFuMHZT?=
 =?utf-8?B?WUwzWEdkTmtlUzJoR1lzRSt1K2x0OTYzczRLVVB2Q3A2NjVvV3hNdDZtcWE0?=
 =?utf-8?B?VjRYeTE0dHFMZVBBY3Zqb3lIYlo3TXNlUXkrRE1IT09zb1hjZ3Q0RGQ4OUlK?=
 =?utf-8?B?N1hCWWg5WWpVY3lNa0s3WXdSazFCR0V2NXhPZHgwQ2tJanlaUGFxRFd1L1Q2?=
 =?utf-8?B?WlRac0xpNlA1dWYzOGkyR3VOdWIzNkVCL2NPbGZZTUhHV3J2b2V2OXFMQ1lV?=
 =?utf-8?B?UmhtQmxnbVZXaG56RTFaa3hJY290QVNEbjVQOWZjK1V4L2VkWUlFeUw4WmNR?=
 =?utf-8?B?YmR6Y2JKZ3pvREVCR294UXpPZUIwMDhhZGFpWTdJejJxNE5idktTMno2a1VG?=
 =?utf-8?B?Y1NDbTBvOVdmY0pJSTRjSUsxS3JlTTZiYjlqV2srQ1BobHI5bFNoZGxnN2Ra?=
 =?utf-8?B?RnZDR2ZEeFk1cDRUOUNwUmc2OGRXMk0rRHRFN2dtTHltNWhGb0tCRDU3R3Rm?=
 =?utf-8?B?ZHBrUWRzM0VmWG1XdG96NVlpRUdZVEs2WjF6dy9KQk1DNytUbTRLNFNPbmh5?=
 =?utf-8?B?UlRHMTl2SWN0WVBDMWUwZ250OWtaaDZxdWh3UGRpc25sUHQ1QUtlN2JVSm5W?=
 =?utf-8?B?MGRKYStrWU40TE5GVnBYZ0NpM3V3OEdhS0lBSXdBaDMrcHU3bzhzSGpYNVFt?=
 =?utf-8?B?bTYwbjkyekZ5TDlKZmlTWkVoazJBWjZPUEpSQjZUZStZbWpuMk43UnhNVml1?=
 =?utf-8?B?UTFWUmhBeWFVNFJjanpuV1BOTnJXWE5IallGTkdBeEprd05NUnJQanl2T1Ez?=
 =?utf-8?B?b1lpSGI5SlpRQ21VT2NhRm9TMkt5VUZZVk9CUENKK1FuNmFaRUpSeTcwZkov?=
 =?utf-8?B?eTE0Nk90QnRaeDZYOC9QTWxacDdNQW1pQjAyNnpEeTlUb2Frc0pDZGdzMEx4?=
 =?utf-8?B?ZHE0V3lMc1NNNC9lbU4vS1dTUEdNNGtzRldxR3ArdHRVVFBVdlZmczh1UGtH?=
 =?utf-8?B?MlFlNGVMZUlabXlUNTZNbVZoNlN6NG03bDRUbXRzMGJldW9WRnBRY0VnVjQv?=
 =?utf-8?B?aXM3V2RKM1ZCWWk2b1l4Q0ZNaGE2eTFMVDNmNFdjb01RcU5NdkovdEI4Q3N5?=
 =?utf-8?B?TzdwcmNGd0IwZVpOTmZ1YXAzSWNxQVZSRk5rS1pCSHJaOFhMOFBvYkxoWlJG?=
 =?utf-8?B?TU9CWFdBdTE0ZytvQjlvbitYUDI0QmJUQ2ViMGFvN0YzbUF6dlQ3MmZjS3lx?=
 =?utf-8?B?S0dsd09naHJsVlR2cVlac3BhSG5CSFEzNHdIU3IvRGxCb0ZYdXh1WkMwbmJ1?=
 =?utf-8?B?MlIxQWhjVUdXcE50MDJ3aDVTcDNhVWdMSTg0d2IrcGZlZWpZVFVKVzFtMTFl?=
 =?utf-8?B?Ykp4akx4bjFjUWl6K29SQzBpMmFoVGM4dzg4Y0tMMjEzTlZPWlNrRSt0YXRl?=
 =?utf-8?B?cDBLRG9MdURxTGc3SmpuSW8zaWhIZGdQTWNiYnNZNkFibE5zcEJzaUNsOGhj?=
 =?utf-8?B?ODBxSHg4Y05MZ254eU9LRHNUMEZMZ1R4YjlKRm8xUVJiNHhGNk9YSlEyVm9p?=
 =?utf-8?B?c0J5WklFcmZYejAvTVloRUlWM1krbkpqZ2VnalY4L1crUHgvdjdoWktIUmFV?=
 =?utf-8?B?eTBBeEpqOHFIZi9aVnY0WitBVk8yUzR6WEFvYkNiMGpHekpuNlRrYWw4aFRu?=
 =?utf-8?B?RDZ1Mk5FZ1AwSU5BNzJmazVTOVRUNUY3bkVaWmtoUUVYbU02ZVlFZWIwTkZi?=
 =?utf-8?B?U0JyK3pkNmNhMWd0VlErdlNMSHp0aGcvQjhYbTI5WWVUQkdDMXJCN0cwWUxM?=
 =?utf-8?Q?Q6Xs=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc288970-a30d-4c19-1d28-08d9d059c602
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5149.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2022 14:43:44.4360 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /D0DsV7pYlBPyAlm1NVCVK/ic0lRF6c8apyyzyGANMy7p0Ke6tdFsAV0cdMVsedz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5216
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
Cc: alexander.deucher@amd.com, daniel.vetter@ffwll.ch, felix.kuehling@amd.com,
 christian.koenig@amd.com, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-12-22 7:37 p.m., Rajneesh
      Bhardwaj wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20211223003711.13064-24-rajneesh.bhardwaj@amd.com">
      <pre class="moz-quote-pre" wrap="">During CRIU restore phase, the VMAs for the virtual address ranges are
not at their final location yet so in this stage, only cache the data
required to successfully resume the svm ranges during an imminent CRIU
resume phase.

Signed-off-by: Rajneesh Bhardwaj <a class="moz-txt-link-rfc2396E" href="mailto:rajneesh.bhardwaj@amd.com">&lt;rajneesh.bhardwaj@amd.com&gt;</a>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c |  4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h    |  5 ++
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c     | 99 ++++++++++++++++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h     | 12 +++
 4 files changed, 118 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 916b8d000317..f7aa15b18f95 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -2638,8 +2638,8 @@ static int criu_restore_objects(struct file *filep,
 				goto exit;
 			break;
 		case KFD_CRIU_OBJECT_TYPE_SVM_RANGE:
-			/* TODO: Implement SVM range */
-			*priv_offset += sizeof(struct kfd_criu_svm_range_priv_data);
+			ret = kfd_criu_restore_svm(p, (uint8_t __user *)args-&gt;priv_data,
+						     priv_offset, max_priv_data_size);
 			if (ret)
 				goto exit;
 			break;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index 87eb6739a78e..92191c541c29 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -790,6 +790,7 @@ struct svm_range_list {
 	struct list_head		list;
 	struct work_struct		deferred_list_work;
 	struct list_head		deferred_range_list;
+	struct list_head                criu_svm_metadata_list;
 	spinlock_t			deferred_list_lock;
 	atomic_t			evicted_ranges;
 	bool				drain_pagefaults;
@@ -1148,6 +1149,10 @@ int kfd_criu_restore_event(struct file *devkfd,
 			   uint8_t __user *user_priv_data,
 			   uint64_t *priv_data_offset,
 			   uint64_t max_priv_data_size);
+int kfd_criu_restore_svm(struct kfd_process *p,
+			 uint8_t __user *user_priv_data,
+			 uint64_t *priv_data_offset,
+			 uint64_t max_priv_data_size);
 /* CRIU - End */
 
 /* Queue Context Management */
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 6d59f1bedcf2..e9f6c63c2a26 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -45,6 +45,14 @@
  */
 #define AMDGPU_SVM_RANGE_RETRY_FAULT_PENDING	2000
 
+struct criu_svm_metadata {
+	struct list_head list;
+	__u64 start_addr;
+	__u64 size;
+	/* Variable length array of attributes */
+	struct kfd_ioctl_svm_attribute attrs[0];
+};</pre>
    </blockquote>
    This data structure is struct kfd_criu_svm_range_priv_data plus
    list_head, maybe you can add list_head to struct
    kfd_criu_svm_range_priv_data and remove this new data structure,
    then you can remove extra kzalloc, kfree for each svm object resume
    and function svm_criu_prepare_for_resume could be removed.
    <blockquote type="cite" cite="mid:20211223003711.13064-24-rajneesh.bhardwaj@amd.com">
      <pre class="moz-quote-pre" wrap="">
+
 static void svm_range_evict_svm_bo_worker(struct work_struct *work);
 static bool
 svm_range_cpu_invalidate_pagetables(struct mmu_interval_notifier *mni,
@@ -2753,6 +2761,7 @@ int svm_range_list_init(struct kfd_process *p)
 	INIT_DELAYED_WORK(&amp;svms-&gt;restore_work, svm_range_restore_work);
 	INIT_WORK(&amp;svms-&gt;deferred_list_work, svm_range_deferred_list_work);
 	INIT_LIST_HEAD(&amp;svms-&gt;deferred_range_list);
+	INIT_LIST_HEAD(&amp;svms-&gt;criu_svm_metadata_list);
 	spin_lock_init(&amp;svms-&gt;deferred_list_lock);
 
 	for (i = 0; i &lt; p-&gt;n_pdds; i++)
@@ -3418,6 +3427,96 @@ svm_range_get_attr(struct kfd_process *p, struct mm_struct *mm,
 	return 0;
 }
 
+int svm_criu_prepare_for_resume(struct kfd_process *p,
+				struct kfd_criu_svm_range_priv_data *svm_priv)
+{
+	int nattr_common = 4, nattr_accessibility = 1;
+	struct criu_svm_metadata *criu_svm_md = NULL;
+	uint64_t svm_attrs_size, svm_object_md_size;
+	struct svm_range_list *svms = &amp;p-&gt;svms;
+	int num_devices = p-&gt;n_pdds;
+	int i, ret = 0;
+
+	svm_attrs_size = sizeof(struct kfd_ioctl_svm_attribute) *
+		(nattr_common + nattr_accessibility * num_devices);
+	svm_object_md_size = sizeof(struct criu_svm_metadata) + svm_attrs_size;
+
+	criu_svm_md = kzalloc(svm_object_md_size, GFP_KERNEL);
+	if (!criu_svm_md) {
+		pr_err(&quot;failed to allocate memory to store svm metadata\n&quot;);
+		ret = -ENOMEM;
+		goto exit;
+	}
+
+	criu_svm_md-&gt;start_addr = svm_priv-&gt;start_addr;
+	criu_svm_md-&gt;size = svm_priv-&gt;size;
+	for (i = 0; i &lt; svm_attrs_size; i++)</pre>
    </blockquote>
    <p>for (i = 0; i &lt; nattr_common + nattr_accessibility *
      num_devices
      ; i++) <br>
    </p>
    <p>This function and for loop is not needed if you remove struct
      criu_svm_metadata.</p>
    <p>Regards,</p>
    <p>Philip<br>
    </p>
    <blockquote type="cite" cite="mid:20211223003711.13064-24-rajneesh.bhardwaj@amd.com">
      <pre class="moz-quote-pre" wrap="">
+	{
+		criu_svm_md-&gt;attrs[i].type = svm_priv-&gt;attrs[i].type;
+		criu_svm_md-&gt;attrs[i].value = svm_priv-&gt;attrs[i].value;
+	}
+
+	list_add_tail(&amp;criu_svm_md-&gt;list, &amp;svms-&gt;criu_svm_metadata_list);
+
+
+exit:
+	return ret;
+}
+
+int kfd_criu_restore_svm(struct kfd_process *p,
+			 uint8_t __user *user_priv_ptr,
+			 uint64_t *priv_data_offset,
+			 uint64_t max_priv_data_size)
+{
+	uint64_t total_size, accessibility_size, common_attr_size;
+	struct kfd_criu_svm_range_priv_data *svm_priv = NULL;
+	int nattr_common = 4, naatr_accessibility = 1;
+	uint32_t num_devices;
+	int ret = 0;
+
+	num_devices = p-&gt;n_pdds;
+	/* Handle one SVM range object at a time, also the number of gpus are
+	 * assumed to be same on the restore node, checking must be done while
+	 * evaluating the topology earlier */
+	common_attr_size = sizeof(struct kfd_ioctl_svm_attribute) *
+		nattr_common;
+	accessibility_size = sizeof(struct kfd_ioctl_svm_attribute) *
+		naatr_accessibility * num_devices;
+	total_size = sizeof(struct kfd_criu_svm_range_priv_data) +
+		common_attr_size + accessibility_size;
+
+	svm_priv = kvzalloc(total_size, GFP_KERNEL);
+	if (!svm_priv)
+		return -ENOMEM;
+
+	if (*priv_data_offset + total_size &gt; max_priv_data_size) {
+		ret = -EINVAL;
+		goto exit;
+	}
+
+	ret = copy_from_user(svm_priv, user_priv_ptr + *priv_data_offset,
+			     total_size);
+	if (ret) {
+		ret = -EFAULT;
+		goto exit;
+	}
+	*priv_data_offset += total_size;
+
+	ret = svm_criu_prepare_for_resume(p, svm_priv);
+	if (ret) {
+		ret = -EFAULT;
+		pr_err(&quot;svm_criu_prepare_for_resume failed\n&quot;);
+		goto exit;
+	}
+
+
+exit:
+
+	kvfree(svm_priv);
+
+	return ret;
+}
+
 int svm_range_get_info(struct kfd_process *p, uint32_t *num_svm_ranges,
 		       uint64_t *svm_priv_data_size)
 {
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
index b00576db5baa..e0c0853f085c 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
@@ -191,6 +191,10 @@ int svm_range_get_info(struct kfd_process *p, uint32_t *num_svm_ranges,
 int kfd_criu_checkpoint_svm(struct kfd_process *p,
 			    uint8_t __user *user_priv_data,
 			    uint64_t *priv_offset);
+int kfd_criu_restore_svm(struct kfd_process *p,
+			 uint8_t __user *user_priv_ptr,
+			 uint64_t *priv_data_offset,
+			 uint64_t max_priv_data_size);
 struct kfd_process_device *
 svm_range_get_pdd_by_adev(struct svm_range *prange, struct amdgpu_device *adev);
 void svm_range_list_lock_and_flush_work(struct svm_range_list *svms, struct mm_struct *mm);
@@ -244,6 +248,14 @@ static inline int kfd_criu_checkpoint_svm(struct kfd_process *p,
 	return 0;
 }
 
+static inline int kfd_criu_restore_svm(struct kfd_process *p,
+				       uint8_t __user *user_priv_ptr,
+				       uint64_t *priv_data_offset,
+				       uint64_t max_priv_data_size)
+{
+	return -EINVAL;
+}
+
 #define KFD_IS_SVM_API_SUPPORTED(dev) false
 
 #endif /* IS_ENABLED(CONFIG_HSA_AMD_SVM) */
</pre>
    </blockquote>
  </body>
</html>

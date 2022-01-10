Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF7848A372
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 00:12:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4222410E414;
	Mon, 10 Jan 2022 23:11:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2047.outbound.protection.outlook.com [40.107.237.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9498510E3D4;
 Mon, 10 Jan 2022 23:11:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VRcnWtpfUuo4G6ByEIqLYWpG1PWf17echvDfDSdaLMnoxxF7DaJ6ZkXkzul6kGrSvY4I776T6og3+nlq5126JSQcJTpC9pIviU5f8jhSoLlWVGVpk+ndg5hxZf7bBmDOCo1dFb/alYV18/tD5Ccxqe4YJdZO2G4ZJeWWN6Fwqs+5aOfOpl0a1N9THGm3rtn5++pcUtW4Cc4NYHcwt/EmfASvQchFKRCJxns8ED1iG4YXZzMiwI8ZOXoCkVVBze8g+N3I84xWVq0O8wkIoKIs4KBZqWVn7RrWlz61Bb1LJ2BdOA62vDwmYQuzblwPRlCaJCDkuCj4XtzJq4ZQSvzaVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5F6y3TLG+C1o3Nk8KaHMZ3Rwl4IElM+NNRUoPyvJIOg=;
 b=WEkpesJD2dOwEgM1ejXO7bCawSqpwEDkRktjopWHaDyxtAn/bTRmwGiBeGANX6XTr6q8XQD6LBk/fRRBc7iTJSnNcpTD56ifGbUcl1d6TamlNtNeDDD+LaO1370nbrTunWxPPey9QvyVwtip98p1SOCKhy4qwm/Zm18DTug14Cp0GLGoxsdBqZt1/Y6Zl/YsaJwlLkQ8zdPInrigBcHW4Z3ahpvJhz71gsv/9G69/eyk4v9klctA2cTFwSMXSfqnUVYR4GilVXDuUx/7ylvT072z0EM2xdP0uR1U5ZOXYIH0bSMTyFGTkp7bYC4PBErwurOpcWpycL+OE8UUdCWETw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5F6y3TLG+C1o3Nk8KaHMZ3Rwl4IElM+NNRUoPyvJIOg=;
 b=M8AXa8pOKggV0Zs7Vz73xeDe2uqv7OuTjrFUKVSP3hwJ9dpk1P7cMMnrZhGqkm0XHZi2MdOLdNNb8yW0tKSndCcdgI2jwLMTWhs+HO8iDvCAZRXl4xI3myWjgCnxwrs7VFpd/3kPz3F2GgcvROy6Egr0560Yeb05tG38JphXnB8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5149.namprd12.prod.outlook.com (2603:10b6:5:390::14)
 by DM4PR12MB5296.namprd12.prod.outlook.com (2603:10b6:5:39d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Mon, 10 Jan
 2022 23:11:55 +0000
Received: from DM4PR12MB5149.namprd12.prod.outlook.com
 ([fe80::14cd:f56f:bac0:a862]) by DM4PR12MB5149.namprd12.prod.outlook.com
 ([fe80::14cd:f56f:bac0:a862%7]) with mapi id 15.20.4867.012; Mon, 10 Jan 2022
 23:11:55 +0000
Subject: Re: [Patch v4 21/24] drm/amdkfd: CRIU Discover svm ranges
To: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20211223003711.13064-1-rajneesh.bhardwaj@amd.com>
 <20211223003711.13064-22-rajneesh.bhardwaj@amd.com>
From: philip yang <yangp@amd.com>
Message-ID: <b508b661-44c0-d1c7-221c-745746e2dc29@amd.com>
Date: Mon, 10 Jan 2022 18:11:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211223003711.13064-22-rajneesh.bhardwaj@amd.com>
Content-Type: text/html; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR16CA0028.namprd16.prod.outlook.com
 (2603:10b6:610:50::38) To DM4PR12MB5149.namprd12.prod.outlook.com
 (2603:10b6:5:390::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1ec0261a-b21f-47bc-6ef8-08d9d48e97d8
X-MS-TrafficTypeDiagnostic: DM4PR12MB5296:EE_
X-Microsoft-Antispam-PRVS: <DM4PR12MB5296B1EE715C51E624D1ED4CE6509@DM4PR12MB5296.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xx38+VjID7Rxv5EtGXLmKziRy4KICi4IRxzqUcbAr3TAY2imiBd50AWaHMbjk+al6iBxO5l6fHLRagZSZbT4Ig9ioIpfPpUKlwDPtl24lQkE6jsr+ykjvVkhlGFHTM5lA8hhPvhBGD1kIjVuYi4Dbg79C4QO7uU98UiNVu+xE8gjjDmI4zhA+sY8OeLrvEK5lrXRWpPon0Fpnib29H+Gysf2DI8ksLqKyrFsOMRp8BfoDQGhPWHDs3KpYyDhoDAgtoMzE+6nq+G1YTfIFGmHiINUNFOZazdHnPxNqlQbqsnMDGp0M4wz5lTOOajqxvuK7epL4PZZG3R3dHwdZCkt3w9SJo+iY3j2hnKbtKK6rpxmp/pbyJgWGgIChop7nVxafxvfW+fTSRWQTS75YOEyXUYJ6Uvhhzo+Un2bzGpLmQfYOkel8+A8Jq+LMIS4tb9dQK0LGN42MevxPUwJpr2M4jstQFimZR3Dck6bVbqLUIJLh4sS6Tp/OxNwwzGsbElMWqEgQTEXzuNVeSHlYGmBynH95TbaNpPy0z2WLRUF3k19xucC5Oeq8tpAHpukYrkNZ+zgvaZl/xByReNEBkcRonxq52PN/An5cGEZKSmiEQNkrU6UKGhQtMVMtxzyo7O4ixnf/W3NlryWzC5Ad0F/Gc9Sd8+KC1eRB+3LAmBD/Kk7GKgR9XFE8c+IJ1/dc+nwSNN7L843WU0ASi5QkviFWno6tBLAwudb6xAygoUMIw0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5149.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6486002)(31696002)(66946007)(186003)(8936002)(83380400001)(316002)(66476007)(36756003)(2616005)(31686004)(508600001)(4326008)(4001150100001)(5660300002)(38100700002)(6512007)(26005)(2906002)(6666004)(6506007)(53546011)(66556008)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmF4Yk03bTczN2NJWjIzTlRiTGtvVExxSmRhR0Y0Vk00RHhzZnpSSkZUQThl?=
 =?utf-8?B?c0ZaNnhmbDRwNUVJQjJvR2RYR0VLWHRyNFgvVFJmb0dtWmtOSVVJRDBBMjB5?=
 =?utf-8?B?SmVIUUk0UEh3aTV4Nzc1aWJzdHVFRHdqQW1GbzFwTXN2TUl6K2haQ29kbzVv?=
 =?utf-8?B?N1piYnRjTU9IVDNTTXluSUNtV1MyWnNDbnZGODN1S0E1NXlyOWFIMTBxbzBU?=
 =?utf-8?B?blcreWp4VTEyQ21WTXpoY3dvYktOTDVzQ3BUc3hmc2FtckRlckpER3dXVGVL?=
 =?utf-8?B?VEs2ZXJ4QldrVER1SXNneXhzeFN4d3hPVS9wUjZsbENGYklJcTJGbDcxbzNW?=
 =?utf-8?B?aWxjbXlZOTNVZDl3aUprNnhZOUpBMlNkRmhsTGtCQ0RLdFB2T0JzUng4disw?=
 =?utf-8?B?RU5VRVlhNHZOMmVGck95aTV2LzlkRFkwdDhrcElENklaQmZ1L01xRStxemEz?=
 =?utf-8?B?KzVRQ1ZLbUZOWVlQSEJrYW9UQnN2ZGFNWFowRm9sTTRpVjBHbW16VDFKRTVR?=
 =?utf-8?B?bUdBUU9rQksveW16NHhXdW5WWDJzbU13aHVmUFdYcHhXaSt4ZTN0Y0RFemxL?=
 =?utf-8?B?VWNuUlZnM0NKdXJEL0RRS1kxV2dxTjErRHZaUjR5cy81MEdEY0xJSjVkWW83?=
 =?utf-8?B?d3IzQmQxeWZtUHZLZFJ6VDR2Qk1LK3M1R3BYOS96Um9WZlpWSzNETjBpK0JD?=
 =?utf-8?B?Q1FOUnM2c1JEYjBLT01jVkphU3NuYXBKTUFqYnhVV0tkVWlrZk5LZU1LL0RE?=
 =?utf-8?B?MTRvRGVIRkNycVZicjU5ODB3TnU4SmxHYTFTTlhBMy9DSU9oZXBrQWRvZGxn?=
 =?utf-8?B?dkZYWmltTG94RjNJVGtKdXF1cUVkMHp3VFlzM2YxVUJ0aVIyQ0ZUTGhYTCtP?=
 =?utf-8?B?NXpMSTgyTFh3TmhrNDVvazBFOE9UN0hTeVlIMytlRnp1NTg2dnRZcUk2ZnNR?=
 =?utf-8?B?RktpMnRFd0lxWlI1VTl5dE1hbkZmelBLelVMSk8wRUNxMURTWms1SGFJdmpl?=
 =?utf-8?B?VHI2d29zNVJyRWhUWGhpb0hlMHdrV2I1ZGpGZEpiV2JWRnlIbzVuLzZGbHY2?=
 =?utf-8?B?U3UwbzV4bjlFcE91Smt6N2R3VEh0ektGczJyTU9hNUg1ek0zVnBhdzkrTHZx?=
 =?utf-8?B?OHkyZnJXV3dxUHlOWDY1bVVBTjVOZ1J6OTBKWS85VVVRUXZrVllwSE9DSCtI?=
 =?utf-8?B?bzBqVE5ZbjdibkswWXNmR054K1FtR3pUVU1LQTUxYzNKOTMybGoxaklPVWdk?=
 =?utf-8?B?dmo4T1ZYdTdGdEM1c3VxZC9hQnhlbFBseE5BVFVTUi9yZnEzdHdwQ0plVXE5?=
 =?utf-8?B?Vkp0SzFvOTQvRzBzeWxBYkZUYzBrQnhOcnFDNlVPUmg0NlJDTW1SSVFvUXNt?=
 =?utf-8?B?WHdnTmEvMGFjdk1Fd1lSN3hxK2ZFaDFxdnhPZHdGcEtJMXRMOGJYMGl0Mm02?=
 =?utf-8?B?RWVHZkpCSWdoaXhTSnQrbEZVZHg5SVYzNm9JWmlaSjVSMXdxZVFmeGpwZU1p?=
 =?utf-8?B?OWRTOTlxMjRVRFk3WW9TKzdENTkrRysyRGN6SWZjYlk2UEZBMjI5Y3hocG9Y?=
 =?utf-8?B?QlBjN2dnWWR5K3VzTW9sUG1RMmgwNWYyTjluWTFycVNEUTg3WDQ4QXE3Y2dP?=
 =?utf-8?B?R3hrMFQya0dzTHQyS3lybXpBcFR5V2lhamJaRXlnNjRJVFpWc0JyVUo1R2JJ?=
 =?utf-8?B?QW5MQzY3TlFabVZCOGlRODdVMitabWdrZWRndCtUdjRmbDdudGY2RDV1MHZv?=
 =?utf-8?B?aXNPSWlLNENiUXJ6ZURYK0p5eXkzays5NWFZeE4wbzhJbk41cEo0REJZeVVM?=
 =?utf-8?B?aTMxbHYrTVgxYWl6azVlQnhVZjk1TVlaL1ZHbkpxaGxZKytGTGV6MUlVcG9D?=
 =?utf-8?B?K0QwQis5ZXZYdDlhY1hKZ3piWWErWER0NUdJRURrVkVDUWtac0Z5K0JMWVZL?=
 =?utf-8?B?ZjA3cDdHQnVkb3JzVldib3Q0RkxzblY5bURRcDEvVmJKQVlram5pclNER2FC?=
 =?utf-8?B?Yy9PV3R1MDA2dFo2RlNlLzIwUTRpSXJrRkZHb1dNQ1gxZ0RhMTlvRVA5czF5?=
 =?utf-8?B?a3hLcEZmVVdVeUdoZEN1cjlWelNPMWVQNENRdzFuYWcrNGxZR1ZkczNDNjNV?=
 =?utf-8?Q?Ttjw=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ec0261a-b21f-47bc-6ef8-08d9d48e97d8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5149.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 23:11:55.0269 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tYWkhxsBNc2+xeiQJhGMyh7O2G1NLT/JXf29V5W2akxpgl5If3Q2jiYK1W0Zc0aP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5296
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
    <blockquote type="cite" cite="mid:20211223003711.13064-22-rajneesh.bhardwaj@amd.com">
      <pre class="moz-quote-pre" wrap="">A KFD process may contain a number of virtual address ranges for shared
virtual memory management and each such range can have many SVM
attributes spanning across various nodes within the process boundary.
This change reports the total number of such SVM ranges and
their total private data size by extending the PROCESS_INFO op of the the
CRIU IOCTL to discover the svm ranges in the target process and a future
patches brings in the required support for checkpoint and restore for
SVM ranges.


Signed-off-by: Rajneesh Bhardwaj <a class="moz-txt-link-rfc2396E" href="mailto:rajneesh.bhardwaj@amd.com">&lt;rajneesh.bhardwaj@amd.com&gt;</a>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 12 +++--
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h    |  5 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c     | 60 ++++++++++++++++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h     | 11 +++++
 4 files changed, 82 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 446eb9310915..1c25d5e9067c 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -2089,10 +2089,9 @@ static int criu_get_process_object_info(struct kfd_process *p,
 					uint32_t *num_objects,
 					uint64_t *objs_priv_size)
 {
-	int ret;
-	uint64_t priv_size;
+	uint64_t queues_priv_data_size, svm_priv_data_size, priv_size;
 	uint32_t num_queues, num_events, num_svm_ranges;
-	uint64_t queues_priv_data_size;
+	int ret;
 
 	*num_devices = p-&gt;n_pdds;
 	*num_bos = get_process_num_bos(p);
@@ -2102,7 +2101,10 @@ static int criu_get_process_object_info(struct kfd_process *p,
 		return ret;
 
 	num_events = kfd_get_num_events(p);
-	num_svm_ranges = 0; /* TODO: Implement SVM-Ranges */
+
+	ret = svm_range_get_info(p, &amp;num_svm_ranges, &amp;svm_priv_data_size);
+	if (ret)
+		return ret;
 
 	*num_objects = num_queues + num_events + num_svm_ranges;
 
@@ -2112,7 +2114,7 @@ static int criu_get_process_object_info(struct kfd_process *p,
 		priv_size += *num_bos * sizeof(struct kfd_criu_bo_priv_data);
 		priv_size += queues_priv_data_size;
 		priv_size += num_events * sizeof(struct kfd_criu_event_priv_data);
-		/* TODO: Add SVM ranges priv size */
+		priv_size += svm_priv_data_size;
 		*objs_priv_size = priv_size;
 	}
 	return 0;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index d72dda84c18c..87eb6739a78e 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -1082,7 +1082,10 @@ enum kfd_criu_object_type {
 
 struct kfd_criu_svm_range_priv_data {
 	uint32_t object_type;
-	uint64_t reserved;
+	uint64_t start_addr;
+	uint64_t size;
+	/* Variable length array of attributes */
+	struct kfd_ioctl_svm_attribute attrs[0];
 };
 
 struct kfd_criu_queue_priv_data {
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 7c92116153fe..49e05fb5c898 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -3418,6 +3418,66 @@ svm_range_get_attr(struct kfd_process *p, struct mm_struct *mm,
 	return 0;
 }
 
+int svm_range_get_info(struct kfd_process *p, uint32_t *num_svm_ranges,
+		       uint64_t *svm_priv_data_size)
+{
+	uint64_t total_size, accessibility_size, common_attr_size;
+	int nattr_common = 4, naatr_accessibility = 1;
+	int num_devices = p-&gt;n_pdds;
+	struct svm_range_list *svms;
+	struct svm_range *prange;
+	uint32_t count = 0;
+
+	*svm_priv_data_size = 0;
+
+	svms = &amp;p-&gt;svms;</pre>
    </blockquote>
    svms is defined as structure inside kfd_process, not pointer, so
    &amp;p-&gt;svms will never be NULL. <br>
    <blockquote type="cite" cite="mid:20211223003711.13064-22-rajneesh.bhardwaj@amd.com">
      <pre class="moz-quote-pre" wrap="">
+	if (!svms)
+		return -EINVAL;
+
+	mutex_lock(&amp;svms-&gt;lock);
+	list_for_each_entry(prange, &amp;svms-&gt;list, list) {
+		pr_debug(&quot;prange: 0x%p start: 0x%lx\t npages: 0x%llx\t end: 0x%llx\n&quot;,
+			 prange, prange-&gt;start, prange-&gt;npages,
+			 prange-&gt;start + prange-&gt;npages - 1);
+		count++;
+	}
+	mutex_unlock(&amp;svms-&gt;lock);
+
+	*num_svm_ranges = count;
+	/* Only the accessbility attributes need to be queried for all the gpus
+	 * individually, remaining ones are spanned across the entire process
+	 * regardless of the various gpu nodes. Of the remaining attributes,
+	 * KFD_IOCTL_SVM_ATTR_CLR_FLAGS need not be saved.
+	 *
+	 * KFD_IOCTL_SVM_ATTR_PREFERRED_LOC
+	 * KFD_IOCTL_SVM_ATTR_PREFETCH_LOC
+	 * KFD_IOCTL_SVM_ATTR_SET_FLAGS
+	 * KFD_IOCTL_SVM_ATTR_GRANULARITY
+	 *
+	 * ** ACCESSBILITY ATTRIBUTES **
+	 * (Considered as one, type is altered during query, value is gpuid)
+	 * KFD_IOCTL_SVM_ATTR_ACCESS
+	 * KFD_IOCTL_SVM_ATTR_ACCESS_IN_PLACE
+	 * KFD_IOCTL_SVM_ATTR_NO_ACCESS
+	 */
+	if (*num_svm_ranges &gt; 0)
+	{
+		common_attr_size = sizeof(struct kfd_ioctl_svm_attribute) *
+			nattr_common;
+		accessibility_size = sizeof(struct kfd_ioctl_svm_attribute) *
+			naatr_accessibility * num_devices;
+
+		total_size = sizeof(struct kfd_criu_svm_range_priv_data) +
+			common_attr_size + accessibility_size;
+
+		*svm_priv_data_size = *num_svm_ranges * total_size;
+	}
+
+	pr_debug(&quot;num_svm_ranges %u total_priv_size %llu\n&quot;, *num_svm_ranges,
+		 *svm_priv_data_size);
+	return 0;
+}
+
 int
 svm_ioctl(struct kfd_process *p, enum kfd_ioctl_svm_op op, uint64_t start,
 	  uint64_t size, uint32_t nattrs, struct kfd_ioctl_svm_attribute *attrs)
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
index 6dc91c33e80f..c8c1251920d4 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
@@ -186,6 +186,8 @@ void svm_range_dma_unmap(struct device *dev, dma_addr_t *dma_addr,
 void svm_range_free_dma_mappings(struct svm_range *prange);
 void svm_range_prefault(struct svm_range *prange, struct mm_struct *mm,
 			void *owner);
+int svm_range_get_info(struct kfd_process *p, uint32_t *num_svm_ranges,
+		       uint64_t *svm_priv_data_size);
 struct kfd_process_device *
 svm_range_get_pdd_by_adev(struct svm_range *prange, struct amdgpu_device *adev);
 void svm_range_list_lock_and_flush_work(struct svm_range_list *svms, struct mm_struct *mm);
@@ -223,6 +225,15 @@ static inline int svm_range_schedule_evict_svm_bo(
 	return -EINVAL;
 }
 
+static inline int svm_range_get_info(struct kfd_process *p,
+				     uint32_t *num_svm_ranges,
+				     uint64_t *svm_priv_data_size)
+{
+	*num_svm_ranges = 0;
+	*svm_priv_data_size = 0;
+	return 0;
+}
+
 #define KFD_IS_SVM_API_SUPPORTED(dev) false
 
 #endif /* IS_ENABLED(CONFIG_HSA_AMD_SVM) */
</pre>
    </blockquote>
  </body>
</html>

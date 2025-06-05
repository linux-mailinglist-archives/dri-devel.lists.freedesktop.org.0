Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2A7ACEC5D
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 10:52:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72B3810E86D;
	Thu,  5 Jun 2025 08:52:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="XijAoQBR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060.outbound.protection.outlook.com [40.107.223.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AF5310E833
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 08:52:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SJVrHt6O2P5oNKsFPYqRuXeSRO9h1ZP6ct82XTd3KVnp0+qzBNetEXIL4kybTHIXUMTj2Es+IzHnNvBlRFQ0fpcZr19+r9bAd807VgeOWIjZJjRB8YWcRhOOafbD1UJuEvMagatQWWB5905bKtXPJmc0/USRvTBsDmT4hQCZ5TVbJj7Er9jH6M1EC9oE75UKP8PjDDiKkROmusX8wRqc5K8VOyP9ynjLtSfwzRCNHpLiMRK7Q7l1LWStRtVtDHa+VjtDqAJF0ShkCQjaFsjrZ8vRzMxJxfXZFfOjqH2ubnKILUnmeUbd/uU9TDbJI9MfYxkBEabvcCs7nnXJsQlJbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fdfLiKyOTfywxAuexRqQwMc1UT0SSR1TBlaE072Sllc=;
 b=TZoHfX3n3b6u9FRAaBNiQZSORhcjYmkWVqJ9VbmSXksf/ayAhD4V28uHUfwsOVtSzyhzfKLH8GP2OfWesDktg5v9l7eb48QCgycq3czQdr0yAfeCrGDhvBFizE69su3qPP4f7mHfrFdMOqrKa4FM+7tspuQnP4oCWVej6GI1qjSQLWF8CrTaLOXhRRBUip5KT5CI7WRDImKa5ooaXyXref8vuPUmNdf3ChLhi0g1IVrkXuNxXHzrf+mf4cCnzo2OuX3hBWhuH7OjoDdhe/oxBm05QKmMHnu4uZwUv3yQ7hKZrUqAfn+US0Ht6WjyvWJ/Ofh4mRrzNWsAJUbxCeDvRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fdfLiKyOTfywxAuexRqQwMc1UT0SSR1TBlaE072Sllc=;
 b=XijAoQBRWmKDUZwrzO0lJ1i350aIyjrlrGUBOeDHu+2O2tldqMQbdDGsqbLeqHcgwkQZF99IoorkEg843AJsl+mOjPdC/oIEi+vx3GcFpywVnv7Qh9t9rYHk7iDaZpCb80/YChQSZCYjBEzs9nPeBYTeJcBluZ8NbDVqmc/d2Ko=
Received: from BL1PR13CA0244.namprd13.prod.outlook.com (2603:10b6:208:2ba::9)
 by PH8PR12MB7352.namprd12.prod.outlook.com (2603:10b6:510:214::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.29; Thu, 5 Jun
 2025 08:51:55 +0000
Received: from BN3PEPF0000B073.namprd04.prod.outlook.com
 (2603:10b6:208:2ba:cafe::d7) by BL1PR13CA0244.outlook.office365.com
 (2603:10b6:208:2ba::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.8 via Frontend Transport; Thu, 5
 Jun 2025 08:51:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B073.mail.protection.outlook.com (10.167.243.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Thu, 5 Jun 2025 08:51:53 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 5 Jun
 2025 03:51:53 -0500
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 5 Jun 2025 03:51:52 -0500
Message-ID: <94095b1d-cb72-ae2f-034a-e9fb2745bba0@amd.com>
Date: Thu, 5 Jun 2025 01:51:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] accel/ivpu: Trigger device recovery on engine
 reset/resume failure
Content-Language: en-US
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: <jeff.hugo@oss.qualcomm.com>, Karol Wachowski <karol.wachowski@intel.com>, 
 <stable@vger.kernel.org>
References: <20250528154253.500556-1-jacek.lawrynowicz@linux.intel.com>
 <5b8763f2-3c1c-3621-912f-995af0076d91@amd.com>
 <861208c3-3505-4386-848f-a7c7a9508604@linux.intel.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <861208c3-3505-4386-848f-a7c7a9508604@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B073:EE_|PH8PR12MB7352:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c4a5801-8cc4-4877-829d-08dda40e383b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TzZ2VlJsUzg2eFZjNk51Ky82dDVoalhzLzR2MVhMMDJQMGE5TStDblBYYnAz?=
 =?utf-8?B?WWhBL1hTVGtjZURNQVF0UFNtTm9kWndQcTlOMFZhQTVHaXlGb3FHd1NLNmYr?=
 =?utf-8?B?UG9ocTVZbURwdEJaREdnaHpiZSs1cjZBZHhPaE1sUnN6aC9GTjMxc3JyQm9j?=
 =?utf-8?B?bXdnVFQwUHEyc0hkSWZkVEVhNmNjR3FiUldOeUd3TzU1NWZrUGJ0RDcrRGVM?=
 =?utf-8?B?MkZ0ZkpEOXVpTDNnTE1UMFk3ZGdkTG8zRHRFVkNDTDRpcVFSb3B1c25QeUJ6?=
 =?utf-8?B?KzZRNkN1R2lGOUNFUUhiL0o3MXN6VGg4aStpQ01PRW1yVlI1Q1ppbEVINDZO?=
 =?utf-8?B?dWhjRDhWZW9xOE4yTmpMbUtNVU13SHFERlduUU9sMVNSQm5lM1JiRFluWTJa?=
 =?utf-8?B?YTlrbWhKQWM5OThaVGFDVG9HaENwMGFYZzh2RE1GMFV0N01ReXJYSUU0OXgr?=
 =?utf-8?B?OU8ySUtHL0doS1I0NVQvSVJ3azdiWXdHa1k0a1g2aE8xYXBNSkc4cFlDa0lF?=
 =?utf-8?B?aUQ5WTJDbWluREJsL3N2TUltVllRU1BxYmphdDl6Qi9NNmJqMVZReTNBVXdU?=
 =?utf-8?B?NjNwNmlKV3dSMUJuR2w2bm5aT01lbHhrV1RlMWUxTGZIYkhqTXJzVzdNMUJC?=
 =?utf-8?B?dzJ4ME5lWkFTcGFaYXpmZ2RhMVVxT09EVU1sU203MExCQ0JXUmh2WmRzdzIz?=
 =?utf-8?B?Rm9CaUVRMEdRS2JyL3FvcEpvUUhzSE1TZThZOC9lN21xYStwSk4zYk92eXk2?=
 =?utf-8?B?MnpJNlhHY3F6bWVZL3JTdFZZc0FnMlZNODRTajhPUW5kbEk5OE1xaW1jRjVB?=
 =?utf-8?B?N0RCcklWaDg5a0JveDhYUUExSjBDU1lXa3hFTVNsUTZsb2dUTlcwc2lUTUtY?=
 =?utf-8?B?eXJ5WkN5U0g5dlRkK1dkSnN2VThDa09Za3ArMTNIUzVNaEZMY2QvOXhKTWVq?=
 =?utf-8?B?d3BVbldNSnE4ME5wS0ZEcDZaS3l4VHNRQXRBR2EyRTk4TVhlWUgxbE4wc1c0?=
 =?utf-8?B?Sk9SV3MyTi9vOXVmZXgxM3Y3aExWUU9rQm5HdW9rRlZndWJrMEpkQ29Iakl1?=
 =?utf-8?B?N29XTlI3Qmh5QlRjY1IxcFhYZWlPV3U4V2dpTDVIMXU1anZtblJUd01sVXRG?=
 =?utf-8?B?ZzJMVFJBMWZlU1RFa2hmdDNIbEoraDRQSGF6aHplclZBc0l2QThTOVp6eEtl?=
 =?utf-8?B?bzlsSXBEU3JmZHNwVkVxVkV4U2lwcmp6R0lSR01ON0E3b0NoeHIwMHVXcnk2?=
 =?utf-8?B?NWVjcUxrSnZyQWczYXpUYTRUamx0cjZMSzJSOGE4czRwT0RGQUVCcHhvd1ha?=
 =?utf-8?B?SVpDRnNGZGFPZVZ5K0lrbndpa1hrU1pFQUR2dVlrU1lEN1FSRi91ZUg3ZU9l?=
 =?utf-8?B?KzY0cDB3R0QxNzlVaDVXODZ5T2pOcUxNbjVCUUJmWjZTZVBlbDNnMXBZVWln?=
 =?utf-8?B?TVJSWEZ6NG5rZlFPQWdBQmtDQTBDaEV0aG9Hc2NscW1NY1czVDZFVXYycTZ2?=
 =?utf-8?B?V0hSUStBUDVpalRCQVRhekVET0tQMGc0Y2FRVG9ZemltTHEvSjFCVGNROGtY?=
 =?utf-8?B?VHZ5cUxWMGdzUC92am1PNDZWQW52cUh3SE90MEFmaG4rOExCVERjTjNUR0dv?=
 =?utf-8?B?R1h0aXc1Z2FWN1NuSzZwRkJOWlFMZ0JaL09aZ2pLN1YwOERuQS8xZkRGVnJj?=
 =?utf-8?B?eFRxT2l4b3FhdjNpY2lDUGdoTlFMN0IvMFl6OERSRmIwdUZHY0RlSnl6c2pn?=
 =?utf-8?B?NklPc2swNW9ZeVVLRGdWMExDTEtMQmR2d3FrZ2dmWU4vd0k3R1BTaFZtZ0Fu?=
 =?utf-8?B?N2RPb04yRmF3djFVTGYzWGFUbGpjc0tKZllSRlVmQmpoR1Y0MElvU3pzQmxP?=
 =?utf-8?B?bitZU1ZqZFJ3N3Y5QU43bksxOU1NV1YyNVgvM3pBRkNLejVlZHdkTW9MSHFX?=
 =?utf-8?B?bUtJcEpxT0hJUkRVa0xDN1VDbXQ5TUxRK2NucXBIeHEvS3VTVzJDeXZRMS9w?=
 =?utf-8?B?Tm1LTW5XcXJXcXpOV2ZMdFNnSzUvZStXM1JpRUk3YXdHcFI2ZXRjMGxvVnNM?=
 =?utf-8?Q?zWCPYv?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 08:51:53.5979 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c4a5801-8cc4-4877-829d-08dda40e383b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B073.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7352
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


On 6/2/25 06:05, Jacek Lawrynowicz wrote:
> Hi,
>
> On 5/28/2025 7:53 PM, Lizhi Hou wrote:
>> On 5/28/25 08:42, Jacek Lawrynowicz wrote:
>>> From: Karol Wachowski <karol.wachowski@intel.com>
>>>
>>> Trigger full device recovery when the driver fails to restore device state
>>> via engine reset and resume operations. This is necessary because, even if
>>> submissions from a faulty context are blocked, the NPU may still process
>>> previously submitted faulty jobs if the engine reset fails to abort them.
>>> Such jobs can continue to generate faults and occupy device resources.
>>> When engine reset is ineffective, the only way to recover is to perform
>>> a full device recovery.
>>>
>>> Fixes: dad945c27a42 ("accel/ivpu: Add handling of VPU_JSM_STATUS_MVNCI_CONTEXT_VIOLATION_HW")
>>> Cc: <stable@vger.kernel.org> # v6.15+
>>> Signed-off-by: Karol Wachowski <karol.wachowski@intel.com>
>>> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>>> ---
>>>    drivers/accel/ivpu/ivpu_job.c     | 6 ++++--
>>>    drivers/accel/ivpu/ivpu_jsm_msg.c | 9 +++++++--
>>>    2 files changed, 11 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
>>> index 1c8e283ad9854..fae8351aa3309 100644
>>> --- a/drivers/accel/ivpu/ivpu_job.c
>>> +++ b/drivers/accel/ivpu/ivpu_job.c
>>> @@ -986,7 +986,8 @@ void ivpu_context_abort_work_fn(struct work_struct *work)
>>>            return;
>>>          if (vdev->fw->sched_mode == VPU_SCHEDULING_MODE_HW)
>>> -        ivpu_jsm_reset_engine(vdev, 0);
>>> +        if (ivpu_jsm_reset_engine(vdev, 0))
>>> +            return;
>> Is it possible the context aborting is entered again before the full device recovery work is executed?
> This is a good point but ivpu_context_abort_work_fn() is triggered by an IRQ and the first thing we do when triggering recovery is disabling IRQs.
> The recovery work also flushes context_abort_work before staring to tear down everything, so we should be safe.
Reviewed-by: Lizhi Hou <lizhi.hou@amd.com>
>
> Regards,
> Jacek
>

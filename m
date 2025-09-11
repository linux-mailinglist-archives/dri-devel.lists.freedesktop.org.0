Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 917E7B53B93
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 20:35:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B050910E0C4;
	Thu, 11 Sep 2025 18:35:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="1oSltVIu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2040.outbound.protection.outlook.com [40.107.243.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE7DE10E0C4
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 18:35:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Asi0tFGiclOMjEHM04hLpPEj/2kMsMDOB27mnuN+laZdUkSwMD0nqj2unlivPcb5NtmUX6WxCysIYUcfrUMT7esieXt9X3v9dQYZxOveUvLvlfY4qk7UhfiMjJ9lzOGQqz591ZPnxMp7AXhgjjeKOcmX6+LOXOKH8OuaL2o6QQPEhHYDsu6WDcSBx5MVStGHj+2Km5n/2hjEPcoeLwd9dnUVD1ZaZo38zGzLK7RBQ45CM9zG2ACEGdT1GkeZgmWuO2btdiDcTf9dSdeTTkUSo9a/vy6OV6PmFr2PUm6gRMdJBBL502KK1HJlJnO1rZl6H6SDZUtS/x2FBz2DE3rD2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bXxfeTCSMfRANrP62QTPPvE1URq5VT9WOOwir4G74nw=;
 b=pz0htxXXFmv1Tj8/iEJAW5ggCvvCQgE1v9oTRWQPwiofcX8PQvfzM+2QYKSIHmats47D2O/+Z7LEmiPbwqmR0KAR4xnCSrGMOmw9rasb3xUyfKE7LBP4mV5cAbw5WPRUtc9OCu2qvHj9WlJ83Bj3AvrIcfCukzrIsXKcx8X+AlLV35lEWVneSrLA0SGWupQAGijGlhQdQsqVZXR1rDpsCb5yhlvuVxth/qIPghjwXGLFyklmVsvm2uomLqCb6Rk1+b8EgKFuHH/UeprW8DJTKV2yElPsMILJDbp0yPk0WihyeUGev4zYMHodznW9a9CvwVzCkDkvk/dRD7XzlPHcJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bXxfeTCSMfRANrP62QTPPvE1URq5VT9WOOwir4G74nw=;
 b=1oSltVIuCTkK85QlQ6MhdON3wXiJrKpQ4Gri8LqJelo06KtswQAFDXzxnVqYUx19YAKEAvvmPl6asGZkFLZomcziykfxPl6mF9XTlZ/9GBMiSEa09hrsMAXmNIhDj3Xf28eRg2v4cwO+pKsdmmc+OYO8H6LDtG6j2qmfk86RAt8=
Received: from BLAPR03CA0122.namprd03.prod.outlook.com (2603:10b6:208:32e::7)
 by CH1PR12MB9576.namprd12.prod.outlook.com (2603:10b6:610:2ad::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 18:35:08 +0000
Received: from BL6PEPF0001AB57.namprd02.prod.outlook.com
 (2603:10b6:208:32e:cafe::3e) by BLAPR03CA0122.outlook.office365.com
 (2603:10b6:208:32e::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.18 via Frontend Transport; Thu,
 11 Sep 2025 18:35:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL6PEPF0001AB57.mail.protection.outlook.com (10.167.241.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Thu, 11 Sep 2025 18:35:08 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 11 Sep
 2025 11:35:04 -0700
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 11 Sep
 2025 11:35:04 -0700
Received: from [172.19.71.207] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 11 Sep 2025 11:35:03 -0700
Message-ID: <d3545d96-c463-f4b9-6b4b-7a8360cf9e2c@amd.com>
Date: Thu, 11 Sep 2025 11:34:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V1] accel/amdxdna: Fix an integer overflow in
 aie2_query_ctx_status_array()
Content-Language: en-US
To: "Falkowski, Maciej" <maciej.falkowski@linux.intel.com>,
 <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <jacek.lawrynowicz@linux.intel.com>, <dri-devel@lists.freedesktop.org>,
 <dan.carpenter@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <max.zhen@amd.com>,
 <sonal.santan@amd.com>, <mario.limonciello@amd.com>
References: <20250909154531.3469979-1-lizhi.hou@amd.com>
 <1d049b9b-e2aa-41f8-9785-9795524b56ef@linux.intel.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <1d049b9b-e2aa-41f8-9785-9795524b56ef@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB57:EE_|CH1PR12MB9576:EE_
X-MS-Office365-Filtering-Correlation-Id: 102ee806-ab66-4a88-c6cd-08ddf161ef19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bG8xTlh2UHVwcjdWSlpDN2hGalVHYjZGTGtlcE1JZFdCVi9henZpTmkyeDBh?=
 =?utf-8?B?SWs0SnpobVEvc0tWSFAxSVhwbjZDanZ3THpHT1g3MkttZDFwMXh4QlRJMDJ2?=
 =?utf-8?B?UmkvTWtvVXdwMEVvU3A4bjZJK1FzV0t1WHl5SCtrWktmTFoyQ0k5aHpJbTN4?=
 =?utf-8?B?VFE1alY5OWVxSm1DNVdXTzZJeXNMZkFNY0hJMFR0eGlsaThZYVRwUmZna0N3?=
 =?utf-8?B?eHJiUVJuWHBNdnkzWHU0Smx3QTVRa0pkRFNudUkrcGtKNFFNdnBVQWlEeXhP?=
 =?utf-8?B?Q1BDVS8ybFF4aVd5MXI1VjJHdmR1N2pSSmQ3c1VqUWhWQ1VKVFdrcXI4K2JK?=
 =?utf-8?B?MldZZ3NpSytna0hmazlvUHFBaDNWYUFQL3NnLzhEbjlxYVhYMXFsSEZMNDJE?=
 =?utf-8?B?dkREUm1ML3Y5NU1RRGJhaFdTamNXak5hRXp1WXBNTnJUSDVUdjYzaSs3L1B4?=
 =?utf-8?B?SFdLOEdidjVaTHppUFNiK0JFc2FXTnd6RlZWR0dhc3NjY2IvWG8ybmJMd2Z0?=
 =?utf-8?B?ekhvNkpwU2w3d2wwcnlDZ0RkbWQ2cHE4N3ZxTHo2UjFENUJYMmZJYTBNUHB5?=
 =?utf-8?B?citvV05seUlQQWJJcDJWaWtmYnJET0tHZ3IrcC9mN1FuYk51YU9rR3BoVjly?=
 =?utf-8?B?Wk9lR1hXYzJBK0lyNkFVWVh5cVVUckVMZnhXRkVCTzVUcVpBVHI2cGkrWUxB?=
 =?utf-8?B?R2IrWUxMV2l3T3g3cVlRc280bk9DdXBFbVh2UHl6dmljNmYxMWtQZ25EeUZl?=
 =?utf-8?B?SGhYZEthL1NRcEpydkNpRGNvbTVOQjZma045VVZXQys0SldVOHBtT1g3ZTlX?=
 =?utf-8?B?bURwOTdDL0VocFRncXl1cUxWQTE2clZFaHFJVHZiRnBYdVducnhYWFpCQTZn?=
 =?utf-8?B?S2JHeFZaWHBZVm4yS2huT3RrajhTRFNtU3JFYjRaODFPaUhxbXFBZGF0Vzd4?=
 =?utf-8?B?d1l4aVArQkRCSFZlalBkWnFIRTRrS2tlNlFQZS9OVmxrWmhLdS94VWdwR1Fo?=
 =?utf-8?B?WG0vcUE5SlFHTlBBUmlWTTdGZVJLa2hXTG84MFJXZmRuSm5aaFZYcXBQc1FO?=
 =?utf-8?B?MHRVYVMwQXNOTlNMcytUdmw2SjhNTlVnVFdWUjVHZ0ZibDdhTjFoR3Q4QkJE?=
 =?utf-8?B?cTJBQ2V3RnJNRDFFN2ZrMHdYYnRlVkFuVklhNnRvNjVwTmxjNG1qSkNvOHZO?=
 =?utf-8?B?a29sdXAyK1Y0Tm4vL0hrZStvK09SN3dFY1NISm55bWV4TTlhazhPUjFFT2dG?=
 =?utf-8?B?Z2czbEo3aG44dkprRXcrRjdQSlVxY0NzY3ZzWDBTTElZUWVSVW9IYmNhbGlr?=
 =?utf-8?B?NnNnZktSMktuWVZyUklLc3VHS0ZCMCs0OTJ2eDFUYmNLZGEvN0pMck5zdi9W?=
 =?utf-8?B?dXJQWHRYbEIwQUJHcG54dzZqWktNWW4wM2tveGF3bHBQck5NbHc1NTd4VFlx?=
 =?utf-8?B?Y285eUg2YmE0T3UyakZTbnZVd0hhQjZjYnNMbEwrb0orU0dJRE5pQ2IwS2FL?=
 =?utf-8?B?TUZ3aVdjNUN6aU1jbm5PRmNrNTJGeVNqcVdOd3Z0U0JHVHBSUUFqNnZvdmx6?=
 =?utf-8?B?d2lBdGZNQWVCOUxiUmZSUDhXd0wyNmhDdHYwWkx6eDc3NW9JTDZtV2Jhb2M3?=
 =?utf-8?B?ano1TnZSbFRnaTJGWGNGS2c1aGZxeVVKWWhZNVVPNzdKdVpDZUROTUsrekRS?=
 =?utf-8?B?a0tUZHdheW1YenU0bUk1U1JkcHliYlRoMDFFUzlsd0FKemxiRU5DTm5Kc2Jj?=
 =?utf-8?B?NTdDeFpQRHNrd3pDMTAyZ0dSZlBoTklJMEpHVE1ZQi9qdlMveDdyK2huNlYv?=
 =?utf-8?B?MzEzS1JLN0ZsMFJGSEhOeTQ0YXpNN0huRzByaXZHekZ2NjRMMTRvWThKQkcz?=
 =?utf-8?B?dHZSakJydWdvT202c1UvZjM3OGpHRGNleUZiemVubHB3SkllRHV1bHMzbXpP?=
 =?utf-8?B?cjA0UDdOT3FRaWlGUlJuNkNXMk1yem1tVitRVmRGUkNiTFhVcFJZaUJqb3ph?=
 =?utf-8?B?Ujh6eVlBT3RsVHhjZDhaN2FoYTc1VzJhb1VzMG9tR29qRW5LaXlNd3JDcVBJ?=
 =?utf-8?B?R0hZdi9hcFFmVU40WUZDQ3ZnT3phVkNIMHoydz09?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 18:35:08.1586 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 102ee806-ab66-4a88-c6cd-08ddf161ef19
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB57.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9576
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

Applied to drm-misc-next

On 9/11/25 07:56, Falkowski, Maciej wrote:
> Reviewed-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
>
> On 9/9/2025 5:45 PM, Lizhi Hou wrote:
>> The unpublished smatch static checker reported a warning.
>>
>> drivers/accel/amdxdna/aie2_pci.c:904 aie2_query_ctx_status_array()
>> warn: potential user controlled sizeof overflow
>> 'args->num_element * args->element_size' '1-u32max(user) * 
>> 1-u32max(user)'
>>
>> Even this will not cause a real issue, it is better to put a reasonable
>> limitation for element_size and num_element. Add condition to make sure
>> the input element_size <= 4K and num_element <= 1K.
>>
>> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
>> Closes: 
>> https://lore.kernel.org/dri-devel/aL56ZCLyl3tLQM1e@stanley.mountain/
>> Fixes: 2f509fe6a42c ("accel/amdxdna: Add ioctl 
>> DRM_IOCTL_AMDXDNA_GET_ARRAY")
>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>> ---
>>   drivers/accel/amdxdna/aie2_pci.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/accel/amdxdna/aie2_pci.c 
>> b/drivers/accel/amdxdna/aie2_pci.c
>> index 87c425e3d2b9..6e39c769bb6d 100644
>> --- a/drivers/accel/amdxdna/aie2_pci.c
>> +++ b/drivers/accel/amdxdna/aie2_pci.c
>> @@ -898,6 +898,12 @@ static int aie2_query_ctx_status_array(struct 
>> amdxdna_client *client,
>>         drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
>>   +    if (args->element_size > SZ_4K || args->num_element > SZ_1K) {
>> +        XDNA_DBG(xdna, "Invalid element size %d or number of element 
>> %d",
>> +             args->element_size, args->num_element);
>> +        return -EINVAL;
>> +    }
>> +
>>       array_args.element_size = min(args->element_size,
>>                         sizeof(struct amdxdna_drm_hwctx_entry));
>>       array_args.buffer = args->buffer;

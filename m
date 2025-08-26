Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A79B371D2
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 19:56:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53BDD10E6B1;
	Tue, 26 Aug 2025 17:56:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="PC5LJAlj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2069.outbound.protection.outlook.com [40.107.236.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F88C10E6B1
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 17:56:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZU23p5VZ8Mb6x/LPbi94pZOe8QkcHb1sMPfMOVMrH1bUI6nfK3DSFe6jiQNNTJYNh9P+uZ+r39hCBFew/XPWbd1fR3I+BP1dCzJwfPXIIOeW7UX2ctwoSqRYb5kI9LnfKZup+6sqYSKL8cuybeMD8XyjUeyWeZ942si2+sGEIf9R2B6kZoF1x2ZWALoJ+1tADyhy4eQ/P7Eziu+9W0ye3OxRoR5qZL6RFsT/L5QvDBaZWagigLaD2SoaFxNKIlNTrEQAQDyhJFLrsmT53TU0rqm+YhUpfJqNY3CkB8ajugdBW0bNWI/X7nt0tz3QG75yFWMbybp0kIS5ZogWSO4J+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gyV5BfqZ3eM+x9tC2G3pur8bGABDL8d6iJW4BHnPogs=;
 b=YU/2z5/vH9HY+aZLRyqRfPmd48S3Y5DEsNOPIa0KWTCH8PKnfmZpAfpH7oc7JSUg/gWLv7P0WVObVR0uGsBJe37qcgnTtlx0m0dOOBkAvvey9h4puhpJdGNStqUblm+oFKlbmwUJk4bhZgjoySe1qvQuyXkla421EIZSA12SoOceJJfhF8L/b42jje1f4qqKyZ21BpJa5quHX6UxhgJRc6zmjtn/iJsipM/bqDxOMz6khyPJXbIa+bslVRQMza3/vYrQaB6nw576V8dAJVbe9/EmnRU5irG1t/jIqzDPfZDahnR+C0LawW1JjgbesRmVSBKnuPTsOcNFkfhrQLZy7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gyV5BfqZ3eM+x9tC2G3pur8bGABDL8d6iJW4BHnPogs=;
 b=PC5LJAlj0ENETx28cIGVhAt0hPN7xno6dw2dKAieBkl6t4LvI1eqluNxfsez6zSeXVswO3Z75N3BojZ0aKOq7Mv44HRtqsLWcJ+9NG1XiOLhLD25QRN40w6qEPZ3sEWI10NqM6wUAXntwk8mKvfN3NT1uG0OsJ8YS/V51ahw/ek=
Received: from SJ0PR13CA0056.namprd13.prod.outlook.com (2603:10b6:a03:2c2::31)
 by SJ0PR12MB5611.namprd12.prod.outlook.com (2603:10b6:a03:426::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 26 Aug
 2025 17:55:57 +0000
Received: from SJ1PEPF00002319.namprd03.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::2) by SJ0PR13CA0056.outlook.office365.com
 (2603:10b6:a03:2c2::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.11 via Frontend Transport; Tue,
 26 Aug 2025 17:55:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00002319.mail.protection.outlook.com (10.167.242.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Tue, 26 Aug 2025 17:55:57 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 26 Aug
 2025 12:55:56 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Tue, 26 Aug
 2025 10:55:56 -0700
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 26 Aug 2025 12:55:55 -0500
Message-ID: <2a21100b-2078-a166-0b47-9db6b4446b5a@amd.com>
Date: Tue, 26 Aug 2025 10:55:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V1] accel/amdxdna: Add ioctl DRM_IOCTL_AMDXDNA_GET_ARRAY
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>, <ogabbay@kernel.org>,
 <quic_jhugo@quicinc.com>, <jacek.lawrynowicz@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <max.zhen@amd.com>, <sonal.santan@amd.com>
References: <20250822172319.377848-1-lizhi.hou@amd.com>
 <2bec1429-4f8c-472c-99a1-420a33a3d316@amd.com>
 <d6a02baa-3b05-73e6-9c2a-66c257efecc3@amd.com>
 <a9814644-96e3-456f-90b7-8705a102c938@amd.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <a9814644-96e3-456f-90b7-8705a102c938@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002319:EE_|SJ0PR12MB5611:EE_
X-MS-Office365-Filtering-Correlation-Id: 35393b74-b13f-442c-fa2f-08dde4c9cf41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?THBhL09zNGIrWGYveldxRUVVZHloR1ZYSmp1U0RPL0Jua1NZRG9xd0VjbFJ3?=
 =?utf-8?B?UVhzcVNJKzNaUEo1a2YyY1RycHBUdmRHNkMyS1hLZzJzZFNqMm4wSVEzWUdM?=
 =?utf-8?B?aStKV1M3K1JSOGwwQ0VXSlN5d1B4STh3L2hTdDRWRWp6QTNjUWhSaWsrcE1j?=
 =?utf-8?B?aFVIMXQyQ3JMcFJKdkN5WVExVUFYempkckRnZm9IUGJITDZOVzZxMm0xbkZT?=
 =?utf-8?B?cHFIYXptTjJCanJqMWcraXVzVHltYnRPTUhvazlqYjVsWFRQeUdLWGJCaVBW?=
 =?utf-8?B?cHl6eUh2VkUxSkNidm9ZdjY4bnp2dzJ6WXNsN010Z0QvbUluVm0xZ0pBTlpr?=
 =?utf-8?B?RGZsaWVIQ3NHM2drSXBobWpFbFhUY1liSVNNVExqUmhaZ2lmNk5NTmhjVGJs?=
 =?utf-8?B?ampXdUt5OVFUWTN2ejlvbUw0TW50ZjJpWEFnUWxzTGttZXptMW1iTk95VTZo?=
 =?utf-8?B?UU4vWkVYbUlCS3VuQWVsNXU2elY2M3dSZmFiUUxZUmFDWlpTR0kvNnBmMG9v?=
 =?utf-8?B?dGJVOHZYa1dNWU5HRVBRM0dSTWhlT1hHeGJyODJNWjVOZHA2THBsUFJvZ3c5?=
 =?utf-8?B?ZDI4Tm1JY1pJT0dMK1pHVm8zZUo0MTZEOFBFMjZGYk5hRXpvZWJ0VXAwUG80?=
 =?utf-8?B?VzVSeFVQQno0NjJTaElGdElxMkVkTGphdHBydm5Lc1RGejNjUXlvTEEzd3BX?=
 =?utf-8?B?RTVtOTRlWXM3bFF4dWVBTGhmQmRvTlRQNCtlanZmUEtoYlNXTmtyQ0FvNzJr?=
 =?utf-8?B?dzBqWDYzcDlIV3gxQ3dseDRBblBNODhaQ296ais4NjdoanlBNGJyYWtZQXdM?=
 =?utf-8?B?ZmEvNlMwMFZ2QmpIUG5pMFBUYUVGMEszeGUyMzljazNaekFWck9jaXU2YmJU?=
 =?utf-8?B?YmhwSVB0WWdXREhyR243Vnl2UTBvaGFBTFRmMnUwdTF0TWY4Zkt2ZDdZNEEz?=
 =?utf-8?B?aWFxMFNsdUs2Uzh1c0VaekZ6Z2lqbzhmOFdaN0RKS3F4TkQ3dlpIaEc3UHE3?=
 =?utf-8?B?dTF2VTErWEhXMlZTaXlxZzFFNGxPMEUxVmtlVG1ZVlFueGVxc0UrbHdiR0Zq?=
 =?utf-8?B?N3dEKzZTK2JmbnNJdy9OV01JMS9pYVR0K0F2OUVzMHpkempRTW00RXNzL0p6?=
 =?utf-8?B?ODVqNmZsMGUycEZ4L2FjNWx3Yy9qbHpabTlia2RrcDUxZ2xOVk4yeWIzeWpR?=
 =?utf-8?B?QUJjSTR5bmJnajdOR0poSExZTnc5K2JoZDg3NTVFM3g1bkNsQ2o0cWliNXZF?=
 =?utf-8?B?YTdMQVdPZ2J6VnF2bjJRTkdYYnp0L1hFZEZscWpnRkZkUjV4OGFuNm5zQWcv?=
 =?utf-8?B?TGYzUmlVQUExTU5hN1ZvZnhOeHdrNkJNZEYrL0pOcmJDcE9xNFBPRHh6aHo2?=
 =?utf-8?B?QTc3aWd6MkNQK0JqeUZwYkJ6UnYzNVMxQTI1Tm8wR09EK2ZaUkVPbWp1NlN3?=
 =?utf-8?B?dGp2WnovL1REcEQ5cUU2Z1c4NlNnVFpaLzRQTGpVRjBDTXQ4NXhqUmdQaDQ5?=
 =?utf-8?B?NkNLYzZEa3UzZXV3WXBITUV3U0xYYVFSSDJDQ09iVGdhSmFtTjdOYkZON1dM?=
 =?utf-8?B?bFVDN01tdUhvNlUwUmt0Ny8rdXVBR1JyMDU5eklKWVZtSW8yKzh5YzlHRVU3?=
 =?utf-8?B?WTlha05xYzhKMFhrOG81SDlDR3J6RUIvQm4rUVZlMmYzUDVsSGlic0NrRzU4?=
 =?utf-8?B?N1ZWeEdRTk1ickNaa2RCNmxxSXRxVlU2Qnp0Y3Q4dEpTNUV4NlNXbHAyeVdu?=
 =?utf-8?B?ck01WVdVOTFFK2hvL0xKSCtZcjJ5MjRocHRCa2JJMElObS9NKy80OTR4Q2xL?=
 =?utf-8?B?dVZhUENWQU9kQnFIRjhIdXZZZ3RVNVNNeS8xWTJQbithcm5Kd2RTcjZibG5q?=
 =?utf-8?B?QUl6ckJmZWZkdmVLOEU3UEFOdUdlMnp1N3J0clZmazZIYko5T2RQTVU5S1VJ?=
 =?utf-8?B?SzliQXZ2aVVxVUl0U0taTzhYV0xMVU9rWmN3dlpDSGM4OGR2VmU0R0pWbEVW?=
 =?utf-8?B?bjlYNy8xYXN3PT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 17:55:57.1898 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35393b74-b13f-442c-fa2f-08dde4c9cf41
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002319.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5611
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


On 8/26/25 10:18, Mario Limonciello wrote:
> On 8/25/2025 11:48 PM, Lizhi Hou wrote:
>>
>> On 8/25/25 14:28, Mario Limonciello wrote:
>>> On 8/22/2025 12:23 PM, Lizhi Hou wrote:
>>>> Add interface for applications to get information array. The 
>>>> application
>>>> provides a buffer pointer along with information type, maximum 
>>>> number of
>>>> entries and maximum size of each entry. The buffer may also contain 
>>>> match
>>>> conditions based on the information type. After the ioctl 
>>>> completes, the
>>>> actual number of entries and entry size are returned.
>>>>
>>>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>>>
>>> How does userspace discover whether or not the new IOCTL call is 
>>> supported?  Just a test call?
>> The kernel header version will be used to determine whether the 
>> application which uses new IOCTL will be compiled or not.
>>
>
> But it's not actually an application compile time decision, it's a 
> runtime decision.  IE I can compile an application with the headers on 
> kernel 6.18 that has this, but if I try to run it on 6.15 it's going 
> to barf.
>
> To some extent that comes with the territory, but I'm wondering if a 
> better solution going forward would be for there to be a dedicated 
> version command that you bump.

For in-tree driver, I did not aware a common way for this other than 
checking the kernel version.

And here is qaic patch of adding a new IOCTL.

https://github.com/torvalds/linux/commit/217b812364d360e1933d8485f063400e5dda7d66


I know there is major, minor, patchlevel in struct drm_driver. And I 
think that is not required for in-tree driver.

Please let me know if I missed anything.

Thanks,

Lizhi

>
> That way applications can call the version command and if it fails you 
> know it's an old version pre-version command (and likely pre-this 
> command).  If it responds with a valid number you can know what 
> commands went with what number.
>
>> Thanks,
>>
>> Lizhi
>>
>>>
>>>> ---
>>>>   drivers/accel/amdxdna/aie2_pci.c        | 114 
>>>> ++++++++++++++++++------
>>>>   drivers/accel/amdxdna/amdxdna_pci_drv.c |  21 +++++
>>>>   drivers/accel/amdxdna/amdxdna_pci_drv.h |   1 +
>>>>   include/uapi/drm/amdxdna_accel.h        | 109 ++++++++++++++++++++++
>>>>   4 files changed, 220 insertions(+), 25 deletions(-)
>>>>
>>>> diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/ 
>>>> amdxdna/aie2_pci.c
>>>> index 16ac0cab4f44..b8bfc0700798 100644
>>>> --- a/drivers/accel/amdxdna/aie2_pci.c
>>>> +++ b/drivers/accel/amdxdna/aie2_pci.c
>>>> @@ -785,10 +785,11 @@ static int aie2_get_clock_metadata(struct 
>>>> amdxdna_client *client,
>>>>     static int aie2_hwctx_status_cb(struct amdxdna_hwctx *hwctx, 
>>>> void *arg)
>>>>   {
>>>> -    struct amdxdna_drm_query_hwctx __user *buf, *tmp __free(kfree) 
>>>> = NULL;
>>>> -    struct amdxdna_drm_get_info *get_info_args = arg;
>>>> +    struct amdxdna_drm_hwctx_entry __user *buf, *tmp __free(kfree) 
>>>> = NULL;
>>>> +    struct amdxdna_drm_get_array *array_args = arg;
>>>> +    u32 size;
>>>>   -    if (get_info_args->buffer_size < sizeof(*tmp))
>>>> +    if (!array_args->num_element)
>>>>           return -EINVAL;
>>>>         tmp = kzalloc(sizeof(*tmp), GFP_KERNEL);
>>>> @@ -801,14 +802,23 @@ static int aie2_hwctx_status_cb(struct 
>>>> amdxdna_hwctx *hwctx, void *arg)
>>>>       tmp->num_col = hwctx->num_col;
>>>>       tmp->command_submissions = hwctx->priv->seq;
>>>>       tmp->command_completions = hwctx->priv->completed;
>>>> -
>>>> -    buf = u64_to_user_ptr(get_info_args->buffer);
>>>> -
>>>> -    if (copy_to_user(buf, tmp, sizeof(*tmp)))
>>>> +    tmp->pasid = hwctx->client->pasid;
>>>> +    tmp->priority = hwctx->qos.priority;
>>>> +    tmp->gops = hwctx->qos.gops;
>>>> +    tmp->fps = hwctx->qos.fps;
>>>> +    tmp->dma_bandwidth = hwctx->qos.dma_bandwidth;
>>>> +    tmp->latency = hwctx->qos.latency;
>>>> +    tmp->frame_exec_time = hwctx->qos.frame_exec_time;
>>>> +    tmp->state = AMDXDNA_HWCTX_STATE_ACTIVE;
>>>> +
>>>> +    buf = u64_to_user_ptr(array_args->buffer);
>>>> +    size = min(sizeof(*tmp), array_args->element_size);
>>>> +
>>>> +    if (copy_to_user(buf, tmp, size))
>>>>           return -EFAULT;
>>>>   -    get_info_args->buffer += sizeof(*tmp);
>>>> -    get_info_args->buffer_size -= sizeof(*tmp);
>>>> +    array_args->buffer += size;
>>>> +    array_args->num_element--;
>>>>         return 0;
>>>>   }
>>>> @@ -816,23 +826,24 @@ static int aie2_hwctx_status_cb(struct 
>>>> amdxdna_hwctx *hwctx, void *arg)
>>>>   static int aie2_get_hwctx_status(struct amdxdna_client *client,
>>>>                    struct amdxdna_drm_get_info *args)
>>>>   {
>>>> +    struct amdxdna_drm_get_array array_args;
>>>>       struct amdxdna_dev *xdna = client->xdna;
>>>> -    struct amdxdna_drm_get_info info_args;
>>>>       struct amdxdna_client *tmp_client;
>>>>       int ret;
>>>>         drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
>>>>   -    info_args.buffer = args->buffer;
>>>> -    info_args.buffer_size = args->buffer_size;
>>>> -
>>>> +    array_args.element_size = sizeof(struct amdxdna_drm_query_hwctx);
>>>> +    array_args.buffer = args->buffer;
>>>> +    array_args.num_element = args->buffer_size / 
>>>> array_args.element_size;
>>>>       list_for_each_entry(tmp_client, &xdna->client_list, node) {
>>>> -        ret = amdxdna_hwctx_walk(tmp_client, &info_args, 
>>>> aie2_hwctx_status_cb);
>>>> +        ret = amdxdna_hwctx_walk(tmp_client, &array_args,
>>>> +                     aie2_hwctx_status_cb);
>>>>           if (ret)
>>>>               break;
>>>>       }
>>>>   -    args->buffer_size = (u32)(info_args.buffer - args->buffer);
>>>> +    args->buffer_size -= (u32)(array_args.buffer - args->buffer);
>>>>       return ret;
>>>>   }
>>>>   @@ -876,6 +887,58 @@ static int aie2_get_info(struct 
>>>> amdxdna_client *client, struct amdxdna_drm_get_i
>>>>       return ret;
>>>>   }
>>>>   +static int aie2_query_ctx_status_array(struct amdxdna_client 
>>>> *client,
>>>> +                       struct amdxdna_drm_get_array *args)
>>>> +{
>>>> +    struct amdxdna_drm_get_array array_args;
>>>> +    struct amdxdna_dev *xdna = client->xdna;
>>>> +    struct amdxdna_client *tmp_client;
>>>> +    int ret;
>>>> +
>>>> +    drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
>>>> +
>>>> +    array_args.element_size = min(args->element_size,
>>>> +                      sizeof(struct amdxdna_drm_hwctx_entry));
>>>> +    array_args.buffer = args->buffer;
>>>> +    array_args.num_element = args->num_element * args->element_size /
>>>> +                array_args.element_size;
>>>> +    list_for_each_entry(tmp_client, &xdna->client_list, node) {
>>>> +        ret = amdxdna_hwctx_walk(tmp_client, &array_args,
>>>> +                     aie2_hwctx_status_cb);
>>>> +        if (ret)
>>>> +            break;
>>>> +    }
>>>> +
>>>> +    args->element_size = array_args.element_size;
>>>> +    args->num_element = (u32)((array_args.buffer - args->buffer) /
>>>> +                  args->element_size);
>>>> +
>>>> +    return ret;
>>>> +}
>>>> +
>>>> +static int aie2_get_array(struct amdxdna_client *client,
>>>> +              struct amdxdna_drm_get_array *args)
>>>> +{
>>>> +    struct amdxdna_dev *xdna = client->xdna;
>>>> +    int ret, idx;
>>>> +
>>>> +    if (!drm_dev_enter(&xdna->ddev, &idx))
>>>> +        return -ENODEV;
>>>> +
>>>> +    switch (args->param) {
>>>> +    case DRM_AMDXDNA_HW_CONTEXT_ALL:
>>>> +        ret = aie2_query_ctx_status_array(client, args);
>>>> +        break;
>>>> +    default:
>>>> +        XDNA_ERR(xdna, "Not supported request parameter %u", args- 
>>>> >param);
>>>> +        ret = -EOPNOTSUPP;
>>>> +    }
>>>> +    XDNA_DBG(xdna, "Got param %d", args->param);
>>>> +
>>>> +    drm_dev_exit(idx);
>>>> +    return ret;
>>>> +}
>>>> +
>>>>   static int aie2_set_power_mode(struct amdxdna_client *client,
>>>>                      struct amdxdna_drm_set_state *args)
>>>>   {
>>>> @@ -925,15 +988,16 @@ static int aie2_set_state(struct 
>>>> amdxdna_client *client,
>>>>   }
>>>>     const struct amdxdna_dev_ops aie2_ops = {
>>>> -    .init           = aie2_init,
>>>> -    .fini           = aie2_fini,
>>>> -    .resume         = aie2_hw_resume,
>>>> -    .suspend        = aie2_hw_suspend,
>>>> -    .get_aie_info   = aie2_get_info,
>>>> -    .set_aie_state    = aie2_set_state,
>>>> -    .hwctx_init     = aie2_hwctx_init,
>>>> -    .hwctx_fini     = aie2_hwctx_fini,
>>>> -    .hwctx_config   = aie2_hwctx_config,
>>>> -    .cmd_submit     = aie2_cmd_submit,
>>>> +    .init = aie2_init,
>>>> +    .fini = aie2_fini,
>>>> +    .resume = aie2_hw_resume,
>>>> +    .suspend = aie2_hw_suspend,
>>>> +    .get_aie_info = aie2_get_info,
>>>> +    .set_aie_state = aie2_set_state,
>>>> +    .hwctx_init = aie2_hwctx_init,
>>>> +    .hwctx_fini = aie2_hwctx_fini,
>>>> +    .hwctx_config = aie2_hwctx_config,
>>>> +    .cmd_submit = aie2_cmd_submit,
>>>>       .hmm_invalidate = aie2_hmm_invalidate,
>>>> +    .get_array = aie2_get_array,
>>>>   };
>>>> diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c 
>>>> b/drivers/accel/ amdxdna/amdxdna_pci_drv.c
>>>> index 8ef5e4f27f5e..ee89485299bc 100644
>>>> --- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
>>>> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
>>>> @@ -164,6 +164,26 @@ static int amdxdna_drm_get_info_ioctl(struct 
>>>> drm_device *dev, void *data, struct
>>>>       return ret;
>>>>   }
>>>>   +static int amdxdna_drm_get_array_ioctl(struct drm_device *dev, 
>>>> void *data,
>>>> +                       struct drm_file *filp)
>>>> +{
>>>> +    struct amdxdna_client *client = filp->driver_priv;
>>>> +    struct amdxdna_dev *xdna = to_xdna_dev(dev);
>>>> +    struct amdxdna_drm_get_array *args = data;
>>>> +    int ret;
>>>> +
>>>> +    if (!xdna->dev_info->ops->get_array)
>>>> +        return -EOPNOTSUPP;
>>>> +
>>>> +    if (args->pad || !args->num_element)
>>>> +        return -EINVAL;
>>>> +
>>>> +    mutex_lock(&xdna->dev_lock);
>>>> +    ret = xdna->dev_info->ops->get_array(client, args);
>>>> +    mutex_unlock(&xdna->dev_lock);
>>>> +    return ret;
>>>> +}
>>>> +
>>>>   static int amdxdna_drm_set_state_ioctl(struct drm_device *dev, 
>>>> void *data, struct drm_file *filp)
>>>>   {
>>>>       struct amdxdna_client *client = filp->driver_priv;
>>>> @@ -195,6 +215,7 @@ static const struct drm_ioctl_desc 
>>>> amdxdna_drm_ioctls[] = {
>>>>       DRM_IOCTL_DEF_DRV(AMDXDNA_EXEC_CMD, 
>>>> amdxdna_drm_submit_cmd_ioctl, 0),
>>>>       /* AIE hardware */
>>>>       DRM_IOCTL_DEF_DRV(AMDXDNA_GET_INFO, 
>>>> amdxdna_drm_get_info_ioctl, 0),
>>>> +    DRM_IOCTL_DEF_DRV(AMDXDNA_GET_ARRAY, 
>>>> amdxdna_drm_get_array_ioctl, 0),
>>>>       DRM_IOCTL_DEF_DRV(AMDXDNA_SET_STATE, 
>>>> amdxdna_drm_set_state_ioctl, DRM_ROOT_ONLY),
>>>>   };
>>>>   diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.h b/drivers/ 
>>>> accel/amdxdna/amdxdna_pci_drv.h
>>>> index b6b3b424d1d5..72d6696d49da 100644
>>>> --- a/drivers/accel/amdxdna/amdxdna_pci_drv.h
>>>> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.h
>>>> @@ -58,6 +58,7 @@ struct amdxdna_dev_ops {
>>>>       int (*cmd_submit)(struct amdxdna_hwctx *hwctx, struct 
>>>> amdxdna_sched_job *job, u64 *seq);
>>>>       int (*get_aie_info)(struct amdxdna_client *client, struct 
>>>> amdxdna_drm_get_info *args);
>>>>       int (*set_aie_state)(struct amdxdna_client *client, struct 
>>>> amdxdna_drm_set_state *args);
>>>> +    int (*get_array)(struct amdxdna_client *client, struct 
>>>> amdxdna_drm_get_array *args);
>>>>   };
>>>>     /*
>>>> diff --git a/include/uapi/drm/amdxdna_accel.h b/include/uapi/drm/ 
>>>> amdxdna_accel.h
>>>> index ce523e9ccc52..e19e4cd04ffa 100644
>>>> --- a/include/uapi/drm/amdxdna_accel.h
>>>> +++ b/include/uapi/drm/amdxdna_accel.h
>>>> @@ -34,6 +34,7 @@ enum amdxdna_drm_ioctl_id {
>>>>       DRM_AMDXDNA_EXEC_CMD,
>>>>       DRM_AMDXDNA_GET_INFO,
>>>>       DRM_AMDXDNA_SET_STATE,
>>>> +    DRM_AMDXDNA_GET_ARRAY = 10,
>>>>   };
>>>>     /**
>>>> @@ -455,6 +456,110 @@ struct amdxdna_drm_get_info {
>>>>       __u64 buffer; /* in/out */
>>>>   };
>>>>   +#define AMDXDNA_HWCTX_STATE_IDLE    0
>>>> +#define AMDXDNA_HWCTX_STATE_ACTIVE    1
>>>> +
>>>> +/**
>>>> + * struct amdxdna_drm_hwctx_entry - The hardware context array entry
>>>> + */
>>>> +struct amdxdna_drm_hwctx_entry {
>>>> +    /** @context_id: Context ID. */
>>>> +    __u32 context_id;
>>>> +    /** @start_col: Start AIE array column assigned to context. */
>>>> +    __u32 start_col;
>>>> +    /** @num_col: Number of AIE array columns assigned to context. */
>>>> +    __u32 num_col;
>>>> +    /** @hwctx_id: The real hardware context id. */
>>>> +    __u32 hwctx_id;
>>>> +    /** @pid: ID of process which created this context. */
>>>> +    __s64 pid;
>>>> +    /** @command_submissions: Number of commands submitted. */
>>>> +    __u64 command_submissions;
>>>> +    /** @command_completions: Number of commands completed. */
>>>> +    __u64 command_completions;
>>>> +    /** @migrations: Number of times been migrated. */
>>>> +    __u64 migrations;
>>>> +    /** @preemptions: Number of times been preempted. */
>>>> +    __u64 preemptions;
>>>> +    /** @errors: Number of errors happened. */
>>>> +    __u64 errors;
>>>> +    /** @priority: Context priority. */
>>>> +    __u64 priority;
>>>> +    /** @heap_usage: Usage of device heap buffer. */
>>>> +    __u64 heap_usage;
>>>> +    /** @suspensions: Number of times been suspended. */
>>>> +    __u64 suspensions;
>>>> +    /**
>>>> +     * @state: Context state.
>>>> +     * %AMDXDNA_HWCTX_STATE_IDLE
>>>> +     * %AMDXDNA_HWCTX_STATE_ACTIVE
>>>> +     */
>>>> +    __u32 state;
>>>> +    /** @pasid: PASID been bound. */
>>>> +    __u32 pasid;
>>>> +    /** @gops: Giga operations per second. */
>>>> +    __u32 gops;
>>>> +    /** @fps: Frames per second. */
>>>> +    __u32 fps;
>>>> +    /** @dma_bandwidth: DMA bandwidth. */
>>>> +    __u32 dma_bandwidth;
>>>> +    /** @latency: Frame response latency. */
>>>> +    __u32 latency;
>>>> +    /** @frame_exec_time: Frame execution time. */
>>>> +    __u32 frame_exec_time;
>>>> +    /** @txn_op_idx: Index of last control code executed. */
>>>> +    __u32 txn_op_idx;
>>>> +    /** @ctx_pc: Program counter. */
>>>> +    __u32 ctx_pc;
>>>> +    /** @fatal_error_type: Fatal error type if context crashes. */
>>>> +    __u32 fatal_error_type;
>>>> +    /** @fatal_error_exception_type: Firmware exception type. */
>>>> +    __u32 fatal_error_exception_type;
>>>> +    /** @fatal_error_exception_pc: Firmware exception program 
>>>> counter. */
>>>> +    __u32 fatal_error_exception_pc;
>>>> +    /** @fatal_error_app_module: Exception module name. */
>>>> +    __u32 fatal_error_app_module;
>>>> +};
>>>> +
>>>> +#define DRM_AMDXDNA_HW_CONTEXT_ALL    0
>>>> +
>>>> +/**
>>>> + * struct amdxdna_drm_get_array - Get information array.
>>>> + */
>>>> +struct amdxdna_drm_get_array {
>>>> +    /**
>>>> +     * @param:
>>>> +     *
>>>> +     * Supported params:
>>>> +     *
>>>> +     * %DRM_AMDXDNA_HW_CONTEXT_ALL:
>>>> +     * Returns all created hardware contexts.
>>>> +     */
>>>> +    __u32 param;
>>>> +    /**
>>>> +     * @element_size:
>>>> +     *
>>>> +     * Specifies maximum element size and returns the actual 
>>>> element size.
>>>> +     */
>>>> +    __u32 element_size;
>>>> +    /**
>>>> +     * @num_element:
>>>> +     *
>>>> +     * Specifies maximum number of elements and returns the actual 
>>>> number
>>>> +     * of elements.
>>>> +     */
>>>> +    __u32 num_element; /* in/out */
>>>> +    /** @pad: MBZ */
>>>> +    __u32 pad;
>>>> +    /**
>>>> +     * @buffer:
>>>> +     *
>>>> +     * Specifies the match conditions and returns the matched 
>>>> information
>>>> +     * array.
>>>> +     */
>>>> +    __u64 buffer;
>>>> +};
>>>> +
>>>>   enum amdxdna_drm_set_param {
>>>>       DRM_AMDXDNA_SET_POWER_MODE,
>>>>       DRM_AMDXDNA_WRITE_AIE_MEM,
>>>> @@ -519,6 +624,10 @@ struct amdxdna_drm_set_power_mode {
>>>>       DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDXDNA_SET_STATE, \
>>>>            struct amdxdna_drm_set_state)
>>>>   +#define DRM_IOCTL_AMDXDNA_GET_ARRAY \
>>>> +    DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDXDNA_GET_ARRAY, \
>>>> +         struct amdxdna_drm_get_array)
>>>> +
>>>>   #if defined(__cplusplus)
>>>>   } /* extern c end */
>>>>   #endif
>>>
>

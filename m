Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7111CC8CEA
	for <lists+dri-devel@lfdr.de>; Wed, 17 Dec 2025 17:36:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C624810E760;
	Wed, 17 Dec 2025 16:36:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ME/fatkc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012008.outbound.protection.outlook.com [52.101.48.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 620B110E760
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 16:36:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M41bfTIbpOp7BxZ7BXhFgOKTo0W8E3SO3dmJF3Cv79UiqfSLp/Ijjkn8EsfKVR/H8rBCu1hrUtae3xU8DfansLhbcmz2d/50uqmXBvIbCrTcUFNalRaLh9H12mRbCw8QFSsHCkdvlr61MlaRUx8CkNwx5x0GkR7xMlsTa5HjnPZOZL0qQ9I8TOYhKndawSerG7rD0hCQGTValPzLFVNIuPlCyUTz/M27DplCN3QmY5cdH6F2xMFtYEWtrI3FNm+LCIUS/uamR1vzqVm1yvx5F3bdCnmEW6wKdTdJVmVFQyXky6asUYCI+4DFmBiN/g1e146qGVB79hul9C76E8ublg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e3YbxYFNFs9L9jRmyyMaMrSNhenLhUl1JpXAjOQyPtw=;
 b=aEp1HcxFwbWeB58elwIHaH1s+WmJeckgVV0aKwiltn45QUViOO//cNshiTRLvkubJSQNht3hHDCMwrMRoa1/lTxLwturkGOsw2NM1Al2guGNvGJBrmjTj+0L+XaTW+7/Dfpcu1HftRFIolZwiOcG1gwI9ZMqDfIF9DmF18wepxRNwJZtf7JtHwS8y6xcnk7sHjgq+8e4AOtiS4dRNwGwxKckbJAt5C9XPKJeC12c/J4Y86vW67B0/OOMmFxe1CGBOpmKkO9yyBQOah/XY+UAhJoX5drFr8s/DTfL/Hk1meKb2e+w119KsXTyfHBI7jKieSsBy2shXX+zBIACX1z9rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e3YbxYFNFs9L9jRmyyMaMrSNhenLhUl1JpXAjOQyPtw=;
 b=ME/fatkcPN4Zuu2V5I7nlZKo+z5A2boLNihl5DtkX39Tn3Z3RelosEUeJLVq70yg/fQnpflR5mfZjHLsjSRULsUhdA+e8As9cX7pz1W5YOMZFtsNEJLTYSr2raM7KEcEVPPzr75Z5XNOkeOBanZq+KkvTkjif6pZTtHI4ZmGUlE=
Received: from MW4PR03CA0142.namprd03.prod.outlook.com (2603:10b6:303:8c::27)
 by LV9PR12MB9759.namprd12.prod.outlook.com (2603:10b6:408:2ea::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 16:36:05 +0000
Received: from SJ1PEPF00001CDC.namprd05.prod.outlook.com
 (2603:10b6:303:8c:cafe::14) by MW4PR03CA0142.outlook.office365.com
 (2603:10b6:303:8c::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6 via Frontend Transport; Wed,
 17 Dec 2025 16:36:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF00001CDC.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Wed, 17 Dec 2025 16:36:04 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 17 Dec
 2025 10:36:03 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 17 Dec
 2025 10:36:03 -0600
Received: from [172.19.71.207] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 17 Dec 2025 08:36:02 -0800
Message-ID: <233e4166-07f5-0397-653f-a21fe9bc9ac7@amd.com>
Date: Wed, 17 Dec 2025 08:35:57 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V1] accel/amdxdna: Remove amdxdna_flush()
Content-Language: en-US
To: Mario Limonciello <superm1@kernel.org>, <ogabbay@kernel.org>,
 <quic_jhugo@quicinc.com>, <dri-devel@lists.freedesktop.org>,
 <maciej.falkowski@linux.intel.com>
CC: <linux-kernel@vger.kernel.org>, <max.zhen@amd.com>, <sonal.santan@amd.com>
References: <20251216031311.2033399-1-lizhi.hou@amd.com>
 <7371981b-2220-4441-b349-57038a6320b7@kernel.org>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <7371981b-2220-4441-b349-57038a6320b7@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDC:EE_|LV9PR12MB9759:EE_
X-MS-Office365-Filtering-Correlation-Id: e3eea25f-0835-4fd1-842a-08de3d8a5f41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MHZMcmxIc3VoYlFBUCt1dVIweE00Smc1akJXdVMxNHRaNUF2cFpteTkxeTRE?=
 =?utf-8?B?QzZqbUVqaUJMb09rcWRvWlQ1dXBkM0hxeWQ5RjZGSHFJRUNaNG1OSUJVUGhI?=
 =?utf-8?B?K3FDZ1B2dEZMU3B3U1pxWWtUaitBL21LZGJReG9vOHRFTHFZc3RWMnBRWVZY?=
 =?utf-8?B?S1hpZTFZcjFDeGVldE4rckJzT0h3eTFMOHFPd05ta2IvcHpMRHZ2c3dXU2sz?=
 =?utf-8?B?OE9CRlo5NzlwZ1k4Qmx2bjhmeFB2ZWpIRjFKZmxrSHBML1ZnNGlxVGRaL1BN?=
 =?utf-8?B?WmJ2dGlQaUp6eitTR0M0M1JhWGxmckRhYnY0NzcxTUJ0L1B3bnpmeE1ucFhR?=
 =?utf-8?B?c29HQ3AxblIyanlvZ2MxdFZLM2N6TjAxU2wyV3h6YXJJaTJ0cEo5dFJRbnRp?=
 =?utf-8?B?b1BGaUIyT1RWNkYxR2x1c0lGallKL1NwSzdBZG9jZThsTzVyS05TS3QwUDM3?=
 =?utf-8?B?Y2NiRktKUzlCYW1OaUhxWldOb29hYXM3VndNOVVxTlZvTXRZTDdHRVRJTUpF?=
 =?utf-8?B?VmlUV1hhTVRreUNFSnJsMHF4V3RmSm5aZlE0a1dmYW1xMFFsUnZ0WXpnaXpV?=
 =?utf-8?B?Y0JOKzJQWHFKazZXTk1zamVnSXVzUXh3aldtZVZjRmdIZzlXc05oR29Vekp3?=
 =?utf-8?B?a0VxKzRkd1NGUkNRY0VPK1lGeGpNNjVZUHk2cW1UUHRxd2tRaDMrUGtyMFFm?=
 =?utf-8?B?KzAxVWFEM3FqU1Zud0lieGtGWm9meGZNeDJrNXRvMHdxRDVycXZoZkFZM2lR?=
 =?utf-8?B?Z2dLaUNYYm5NUW9SNlJ4bXFnTDd2djJ4TjRCTWdla1V4WU5SOVZrRkNXY1N6?=
 =?utf-8?B?dldvU2tqd0tKOEdwZ3pkNThyRzdWemtjTjA4c09TbGcyMDFpTGxLWDJ0OVc2?=
 =?utf-8?B?NXNqWngxVnRxdUJvbmk2a0E2SXpkUXI1bjQrdmxDMmE0OGMvZTc2bUMvaDYy?=
 =?utf-8?B?dXpqSFJXV3hIc1ZrSkd4NVdNQUZZdlBRamZ6ZkFxQXZaZjBvdmpDeTRWU2xZ?=
 =?utf-8?B?dHZ6WkgvYXQ0ekR5bEVMSHpHM2h4QkU1YXpVZjUzTUlIMXdaRTlRME9nL2Jr?=
 =?utf-8?B?ZkZVRDQ0STNNeDFRd2xVaXhjOEpjSStuSlAvb20xUUZmMVR1aENWWDZlV2dK?=
 =?utf-8?B?ZUR4OElHNng1aUFJTCsyZnhpc1lBckxnbnd6dXdwM2lWS3RDZXY1dnJsTExE?=
 =?utf-8?B?NHlvNVlXejdvYlA2QkJlbk5FUjdWdWtVeFhiUlNtUUJvTXFaK1E1VEd5MVQz?=
 =?utf-8?B?UmJDV2EvelJza0xJamk4OUIzRWFKSmlIdUE4R3lST051TXg5TlBEd2JFQVBU?=
 =?utf-8?B?dGh3dStOSzNSR1k5M0Jxa2FobWRKRkEvNmRiNjlpWnhETnVlSUZWbm9JMmZm?=
 =?utf-8?B?R1R6eDFrSTNuNTlTdW1BcllzU3A3MmRualVXZHRoTmlVNHA0SjlrWENJN1Fs?=
 =?utf-8?B?MFUvZkZIVG9nSE9VZEl0NlM4T2Z2YnU0THViczYrdHRISnB3RHNNYXVueFB4?=
 =?utf-8?B?K0JOSENhVHhGY2ZHRG13cXI5Y0lVWTEvTXBqd2VjNU9DZTZFQjh2Z1Y4Z2JB?=
 =?utf-8?B?eHdBT3R4K1hHamZqZ1ppVXh6eVQyY1JzeGM1Y09HdXNLSHhBNXlXU25iQkw5?=
 =?utf-8?B?dmNPSVJwKzRoTS9IV1F3ak1jV2l2SUkycXZjY0diRFJzZENNZ0UrWHdwK0xE?=
 =?utf-8?B?c2dRSWpqNEYzWUNIVUpEVjlUdG03aElRaW9Qdk5HaW8yaFk2eE9IZjA3Qis5?=
 =?utf-8?B?M2VoeUlJUlRWMTFuRStEOFdtZ1FhdFMvVWQ4OXlCNk02b2djZW95Qi9Ld2dr?=
 =?utf-8?B?ZVpXWXZheDdiVEthVHpFWmJRczR1TXZTc2Y0Lys3dmdtZ0QvK05RWjB2MmdQ?=
 =?utf-8?B?ZFBZMVFZT0ZXV0QxU3QrQXJnZnFqbjBzd3g0ZDdHekQyazc4bDBUVEc5anp0?=
 =?utf-8?B?THZROE1Pd2NQZ3NoaFg1cFNJSWxxOS9RMWxPS01aS3ZnMFIrUHluSWlwM1Ax?=
 =?utf-8?B?MDZEWmU2YkJNQ045M1Boam5qUFc1R0N4N1g4MHltdzcxbElPSkFPazkxaU5a?=
 =?utf-8?B?eW55cFBOQ2xDbFZ0VVhWUmZzbnN4YlkyZFpQMmd2OU5zWER6SzV1ODRhN0VY?=
 =?utf-8?Q?qdCs=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 16:36:04.4747 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3eea25f-0835-4fd1-842a-08de3d8a5f41
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CDC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR12MB9759
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

Applied to drm-misc-next.

On 12/16/25 07:16, Mario Limonciello wrote:
> On 12/15/25 9:13 PM, Lizhi Hou wrote:
>> amdxdna_flush() was introduced to ensure that the device does not access
>> a process address space after it has been freed. However, this is no
>> longer necessary because the driver now increments the mm reference 
>> count
>> when a command is submitted and decrements it only after the command has
>> completed. This guarantees that the process address space remains valid
>> for the entire duration of command execution. Remove amdxdna_flush to
>> simplify the teardown path.
>>
>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>> ---
>>   drivers/accel/amdxdna/amdxdna_pci_drv.c | 29 ++++++++++---------------
>>   1 file changed, 11 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c 
>> b/drivers/accel/amdxdna/amdxdna_pci_drv.c
>> index 1973ab67721b..fcf7e7869007 100644
>> --- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
>> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
>> @@ -105,43 +105,38 @@ static int amdxdna_drm_open(struct drm_device 
>> *ddev, struct drm_file *filp)
>>       return ret;
>>   }
>>   -static void amdxdna_drm_close(struct drm_device *ddev, struct 
>> drm_file *filp)
>> +static void amdxdna_client_cleanup(struct amdxdna_client *client)
>>   {
>> -    struct amdxdna_client *client = filp->driver_priv;
>> -    struct amdxdna_dev *xdna = to_xdna_dev(ddev);
>> -
>> -    XDNA_DBG(xdna, "closing pid %d", client->pid);
>> -
>> +    list_del(&client->node);
>> +    amdxdna_hwctx_remove_all(client);
>>       xa_destroy(&client->hwctx_xa);
>>       cleanup_srcu_struct(&client->hwctx_srcu);
>>       mutex_destroy(&client->mm_lock);
>> +
>>       if (client->dev_heap)
>>           drm_gem_object_put(to_gobj(client->dev_heap));
>>         iommu_sva_unbind_device(client->sva);
>>   -    XDNA_DBG(xdna, "pid %d closed", client->pid);
>>       kfree(client);
>>   }
>>   -static int amdxdna_flush(struct file *f, fl_owner_t id)
>> +static void amdxdna_drm_close(struct drm_device *ddev, struct 
>> drm_file *filp)
>>   {
>> -    struct drm_file *filp = f->private_data;
>>       struct amdxdna_client *client = filp->driver_priv;
>> -    struct amdxdna_dev *xdna = client->xdna;
>> +    struct amdxdna_dev *xdna = to_xdna_dev(ddev);
>>       int idx;
>>   -    XDNA_DBG(xdna, "PID %d flushing...", client->pid);
>> +    XDNA_DBG(xdna, "closing pid %d", client->pid);
>> +
>>       if (!drm_dev_enter(&xdna->ddev, &idx))
>> -        return 0;
>> +        return;
>>         mutex_lock(&xdna->dev_lock);
>> -    list_del_init(&client->node);
>> -    amdxdna_hwctx_remove_all(client);
>> +    amdxdna_client_cleanup(client);
>>       mutex_unlock(&xdna->dev_lock);
>>         drm_dev_exit(idx);
>> -    return 0;
>>   }
>>     static int amdxdna_drm_get_info_ioctl(struct drm_device *dev, 
>> void *data, struct drm_file *filp)
>> @@ -217,7 +212,6 @@ static const struct file_operations amdxdna_fops = {
>>       .owner        = THIS_MODULE,
>>       .open        = accel_open,
>>       .release    = drm_release,
>> -    .flush        = amdxdna_flush,
>>       .unlocked_ioctl    = drm_ioctl,
>>       .compat_ioctl    = drm_compat_ioctl,
>>       .poll        = drm_poll,
>> @@ -333,8 +327,7 @@ static void amdxdna_remove(struct pci_dev *pdev)
>>       client = list_first_entry_or_null(&xdna->client_list,
>>                         struct amdxdna_client, node);
>>       while (client) {
>> -        list_del_init(&client->node);
>> -        amdxdna_hwctx_remove_all(client);
>> +        amdxdna_client_cleanup(client);
>>             client = list_first_entry_or_null(&xdna->client_list,
>>                             struct amdxdna_client, node);
>

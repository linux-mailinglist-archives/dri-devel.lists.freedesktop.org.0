Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BBD9F3C0D
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 22:04:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C55CF10E19F;
	Mon, 16 Dec 2024 21:04:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vBtvgqQ+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20616.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::616])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F376B10E19F
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 21:03:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jQnQ7amHkhX7Gax2l/IQApiWWeh2fOHSjq1/1NBNSBrDv/2LOjY1XsJUuJ/Gm97psp0UgX6a0yFbr5J6RSDt8fQl9Zh0LE2c3q/+6p6N2yCFoczUNpy8R9jK513J67ujtYmRqjxUhzYXiQSUuvHRefqIG0632uKkKaNFe1T8hRJHIAX6O9qg33iCGTIqL3vyOdScH0sU8BLT+mFBeognegMpRDYNruetK2HnAWW+1fQ8bYfSTpuf4mWgA5qe9lwhvj+h5cyGkrD7jUAsfHhzuo4zo6TjFO0UtNUpp9R3nqZgOxIgvbngCm8a74dlgrkaBSfL1C+jJvutD6lFicSxsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rhzmVqviZ7lKUu2c51XbZrcDvzUHm4QTfaETkYBVhgg=;
 b=tI0bDwXidVVfU6NjAWRgP5IguFty00jNUHC48WS+ZRIIxJts1hNPdNhtnOmv8ifCXb4sTlr+xNFTCpH10NqRQ52qWrc6cBob1Jd+KgRmvABlWmR5r0YOZXCIPO9Wu+muegKdfyN+kHm/FvIkPqrKHdPZvS7dJEJSdz0mYLeFcWg/WwgaBTrRLOdupDcHZXqnpqErNL/kGEwkAQvdnXOQ2/DbV5/LPWjs5u9UHQsDZxqt3AYXHDqacDfNsB+ZwvRgmAe+YNzZjQp3SQw3YWUeftDfXqn3rWDIKeAYkkIg5FOdOAvW7tHUHr6Fa1lVXAdHkf24r+IU9SU0BKMBlnsg+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rhzmVqviZ7lKUu2c51XbZrcDvzUHm4QTfaETkYBVhgg=;
 b=vBtvgqQ+Ttaf+nq4v6AcAH4wuKa8g6XPjWWkmYggC904ADmxSw9NdIfNN2tX3Q5MLk0d2VGVjHNuJrO5dIK01iSIX5DN+4lFlsBRMVb85FKUhqTs9XbUEKRgwGcKI/ws1vyb1YjfwYo41B7p7p4kSdMJc1A8FQNORsxZvgTL634=
Received: from SJ0PR13CA0037.namprd13.prod.outlook.com (2603:10b6:a03:2c2::12)
 by DS0PR12MB8504.namprd12.prod.outlook.com (2603:10b6:8:155::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Mon, 16 Dec
 2024 21:03:55 +0000
Received: from CO1PEPF000044FD.namprd21.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::98) by SJ0PR13CA0037.outlook.office365.com
 (2603:10b6:a03:2c2::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8272.8 via Frontend Transport; Mon,
 16 Dec 2024 21:03:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044FD.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8272.0 via Frontend Transport; Mon, 16 Dec 2024 21:03:55 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Dec
 2024 15:03:54 -0600
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 16 Dec 2024 15:03:53 -0600
Message-ID: <cf132e81-524b-3b13-aa18-4f542f7ca480@amd.com>
Date: Mon, 16 Dec 2024 13:03:53 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V3 5/5] accel/amdxdna: Add zero check for pad in ioctl
 input structures
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>, <ogabbay@kernel.org>,
 <quic_jhugo@quicinc.com>, <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <min.ma@amd.com>, <max.zhen@amd.com>,
 <sonal.santan@amd.com>, <king.tam@amd.com>
References: <20241213232933.1545388-1-lizhi.hou@amd.com>
 <20241213232933.1545388-6-lizhi.hou@amd.com>
 <050b7fac-1ebd-46a0-840e-2df8c82136ae@amd.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <050b7fac-1ebd-46a0-840e-2df8c82136ae@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FD:EE_|DS0PR12MB8504:EE_
X-MS-Office365-Filtering-Correlation-Id: b44b90e6-415d-419a-d031-08dd1e1526f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z3ZVQ3ZKK2wreW1zNkR2djQ0bExYREJ3U3dYeXNOMHE1Nmk3RndCbGlyTTB0?=
 =?utf-8?B?R3AwT3liOHBEOEZlMlZ2cEh3UFlmT1lJZ0d5alJTckpRZ0Y3aWRIbFVCZE8z?=
 =?utf-8?B?dlpjTzNxdkVpcG1BbnRSNnhyR1EvQkhyS1lTMGtFelNUV0x3Z1o4aG1vODIx?=
 =?utf-8?B?NVF0Mkk0ZFN4aTg5SjY4RWVyQjBpQVZmdmhKMm5mWEpKRCt2TmtWcm1zVkl4?=
 =?utf-8?B?NGVBa09VZzAyaUQwV0sraGtvb0JPczR5bVFFRGM0dkt3ejlOU2RrdG9yVHg4?=
 =?utf-8?B?a2NaRjFPMGtQUUNObzNWdjkrVVAwSjc2MGtzMnU4Snh5WDhYaXd4NEhEM0Yr?=
 =?utf-8?B?cDNrMmplQUlWOXhLOStheHBsVVE1WElHRFdJSi9KMnc5VDVVdVVpSkl2VzJ3?=
 =?utf-8?B?YmVDSGI2WlhHeFh5WHBHbk1ESFpDWWtRZVhnMG41b0h2a0hvYmlJbVlSeGkz?=
 =?utf-8?B?bGZQSU9rOXVIZ1BBUE85SHJId0hWZi9oK3FpdHYwMzRCVlJ0TUxCNU8yUTVs?=
 =?utf-8?B?ajRZam84MlkxRWhWY3U0cW9hbCt3NVVLQkFEQmFESUpaVE5qU0VET3hoTGlz?=
 =?utf-8?B?clo3aVdCdVREbXEyTVZ6SFlyZkhSS3k4TVZpOWRza2dqSHd2SUh3RUFiL3RV?=
 =?utf-8?B?RmUxbEw4M2YvS3VTM0ttZElKb1FKaTFmUGFIbU5ZbGJYQ1c1R3lleWxNU094?=
 =?utf-8?B?K3pnYlI3Zjd4cW5SVll3M1lWVkdkWTUyaXlNKzNRS0wrWXdMc0dySzcwRkkw?=
 =?utf-8?B?K05KbDJaVDRKWmt2bUYzQU5DWE5rUkJLb0dXYXhTRlF0RUVuaDQvamRpMCs1?=
 =?utf-8?B?c0ovTnJzU3ZBM0NKd1M2VC94bG1yYlFNTWQzbko1dDBvVWNBd25ocVIrcjl6?=
 =?utf-8?B?QWlFdmVTVU1XUGFIVENJTWJWVUZTUk9UeVNOc1lrbkdpVHdXVnpLeThka0hR?=
 =?utf-8?B?d3pDN2pmbFhJN3VVcVo4aFphakdIUWtKNEg5WmtWS0lFNDMrUStENmtURG9v?=
 =?utf-8?B?ZFRlQmdrOGJ4RThaYWFyVi9mUFpMK0d6Wk9FdHZGYXNVaTRxOHdYdTFhL1Ri?=
 =?utf-8?B?Z0RQVlZkTXlkZ1F2K0ZXa041NzdRMllnbTZlN1JFVDRQdzBNM1BuZ1dsbFlN?=
 =?utf-8?B?djhWZ3ViZHd3UC8vQThuaW1LcVdDVVFIZGRET2hHcXJ4bGNiWlhPWlhlYm9y?=
 =?utf-8?B?MXdmOUFkUysrV3RKSG9kTXBJdVptdTEzdzJmWVF2Qlp4WDJrcWRBQVJxcHRy?=
 =?utf-8?B?dFduTnMzUHgrVmJaQXAwM3Y1bENDMm41SHRLVzBRczFNV3BmY0FtbTZZOEZR?=
 =?utf-8?B?RWh0VlhBbHFJSE9LNnd6TlU2UGM4Q2tUc3FJaHRJNUtTVEhMT0NSQWR3cWJn?=
 =?utf-8?B?eUVJNFczT09wS3JXS1V0d0NmZHBWQzQzNkwvQnZQYlZ0SzZ3bnpyS3hvWFdJ?=
 =?utf-8?B?c2xibEZZSEdaampPY1RkcGhaa3hqNkR5d0N4MlBZN1BrQ0V2UDdLalRES0tv?=
 =?utf-8?B?UUg2UUVQVkZjR1h6d3E2NlJZS3l3MklVUWdlb1pnZVhWQ003R290RjlTTTBp?=
 =?utf-8?B?dk92bjhzRFYrbHhFNElheGlhSjVhVFZzbXlDZmRZV1RpMFYzN1ZKMmlKTWp5?=
 =?utf-8?B?UE1aZVQrbTFUVnkrTkM3SWNJT3p2R0V4QjFnWm5NbXpudkVrWHlCQUl5akNV?=
 =?utf-8?B?TEVvcFNWZWxlOGZOdExlZjE4R0Jzb1FuNnRHNmlmNjUzM0l6VkhDaVg2S3ha?=
 =?utf-8?B?a2tHRHBxcWZCeFZuRUxzMUhHaXFFdFdVeVlHVGFnMmYwM2tuam4rRnNjbTFD?=
 =?utf-8?B?Z0xRMktlbUZINDdjSzJsVkVlUFZHSnlpRHhHUFJKNXE1a1UweHcwdWtxeUNV?=
 =?utf-8?B?R0lKbnl3aUw3T1RvVlJucmk3a1FERTVWOWg5RGtPYmZ1bGE5MXhTcGNFam1z?=
 =?utf-8?B?OXBaR0s3Y2Q3OTNsQzQzMFRwVlMwZjEzRktodit3S0d6S3pySUNRV2RBdjdl?=
 =?utf-8?B?STBHUUdmZDJRPT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2024 21:03:55.1287 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b44b90e6-415d-419a-d031-08dd1e1526f1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044FD.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8504
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


On 12/16/24 12:38, Mario Limonciello wrote:
> On 12/13/2024 17:29, Lizhi Hou wrote:
>> For input structures, it is better to check if the pad is zero.
>> Thus, the pad bytes might be usable in the future.
>>
>
> IIRC you should pick up:
> Suggested-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Sure. Will add it.
>
>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>> ---
>>   drivers/accel/amdxdna/aie2_ctx.c     |  3 +++
>>   drivers/accel/amdxdna/aie2_message.c |  3 +++
>>   drivers/accel/amdxdna/amdxdna_ctx.c  |  6 ++++++
>>   drivers/accel/amdxdna/amdxdna_gem.c  |  2 +-
>>   include/uapi/drm/amdxdna_accel.h     | 11 +++++------
>>   5 files changed, 18 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/accel/amdxdna/aie2_ctx.c 
>> b/drivers/accel/amdxdna/aie2_ctx.c
>> index cdeead75c6f5..9facf45818f9 100644
>> --- a/drivers/accel/amdxdna/aie2_ctx.c
>> +++ b/drivers/accel/amdxdna/aie2_ctx.c
>> @@ -690,6 +690,9 @@ static int aie2_hwctx_cu_config(struct 
>> amdxdna_hwctx *hwctx, void *buf, u32 size
>>       int ret;
>>         XDNA_DBG(xdna, "Config %d CU to %s", config->num_cus, 
>> hwctx->name);
>> +    if (XDNA_MBZ_DBG(xdna, config->pad, sizeof(config->pad)))
>> +        return -EINVAL;
>> +
>>       if (hwctx->status != HWCTX_STAT_INIT) {
>>           XDNA_ERR(xdna, "Not support re-config CU");
>>           return -EINVAL;
>> diff --git a/drivers/accel/amdxdna/aie2_message.c 
>> b/drivers/accel/amdxdna/aie2_message.c
>> index b2ca78cfd0a7..9e2c9a44f76a 100644
>> --- a/drivers/accel/amdxdna/aie2_message.c
>> +++ b/drivers/accel/amdxdna/aie2_message.c
>> @@ -395,6 +395,9 @@ int aie2_config_cu(struct amdxdna_hwctx *hwctx)
>>       for (i = 0; i < hwctx->cus->num_cus; i++) {
>>           struct amdxdna_cu_config *cu = &hwctx->cus->cu_configs[i];
>>   +        if (XDNA_MBZ_DBG(xdna, cu->pad, sizeof(cu->pad)))
>> +            return -EINVAL;
>> +
>>           gobj = drm_gem_object_lookup(hwctx->client->filp, cu->cu_bo);
>>           if (!gobj) {
>>               XDNA_ERR(xdna, "Lookup GEM object failed");
>> diff --git a/drivers/accel/amdxdna/amdxdna_ctx.c 
>> b/drivers/accel/amdxdna/amdxdna_ctx.c
>> index 324f35c43f6c..d11b1c83d9c3 100644
>> --- a/drivers/accel/amdxdna/amdxdna_ctx.c
>> +++ b/drivers/accel/amdxdna/amdxdna_ctx.c
>> @@ -243,6 +243,9 @@ int amdxdna_drm_destroy_hwctx_ioctl(struct 
>> drm_device *dev, void *data, struct d
>>       struct amdxdna_hwctx *hwctx;
>>       int ret = 0, idx;
>>   +    if (XDNA_MBZ_DBG(xdna, &args->pad, sizeof(args->pad)))
>> +        return -EINVAL;
>> +
>>       if (!drm_dev_enter(dev, &idx))
>>           return -ENODEV;
>>   @@ -277,6 +280,9 @@ int amdxdna_drm_config_hwctx_ioctl(struct 
>> drm_device *dev, void *data, struct dr
>>       void *buf;
>>       u64 val;
>>   +    if (XDNA_MBZ_DBG(xdna, &args->pad, sizeof(args->pad)))
>> +        return -EINVAL;
>> +
>>       if (!xdna->dev_info->ops->hwctx_config)
>>           return -EOPNOTSUPP;
>>   diff --git a/drivers/accel/amdxdna/amdxdna_gem.c 
>> b/drivers/accel/amdxdna/amdxdna_gem.c
>> index 4dfeca306d98..606433d73236 100644
>> --- a/drivers/accel/amdxdna/amdxdna_gem.c
>> +++ b/drivers/accel/amdxdna/amdxdna_gem.c
>> @@ -552,7 +552,7 @@ int amdxdna_drm_get_bo_info_ioctl(struct 
>> drm_device *dev, void *data, struct drm
>>       struct drm_gem_object *gobj;
>>       int ret = 0;
>>   -    if (args->ext || args->ext_flags)
>> +    if (args->ext || args->ext_flags || args->pad)
>>           return -EINVAL;
>>         gobj = drm_gem_object_lookup(filp, args->handle);
>> diff --git a/include/uapi/drm/amdxdna_accel.h 
>> b/include/uapi/drm/amdxdna_accel.h
>> index e4edb52bc27b..a706ead39082 100644
>> --- a/include/uapi/drm/amdxdna_accel.h
>> +++ b/include/uapi/drm/amdxdna_accel.h
>> @@ -87,7 +87,7 @@ struct amdxdna_drm_create_hwctx {
>>   /**
>>    * struct amdxdna_drm_destroy_hwctx - Destroy hardware context.
>>    * @handle: Hardware context handle.
>> - * @pad: Structure padding.
>> + * @pad: MBZ.
>>    */
>>   struct amdxdna_drm_destroy_hwctx {
>>       __u32 handle;
>> @@ -98,7 +98,7 @@ struct amdxdna_drm_destroy_hwctx {
>>    * struct amdxdna_cu_config - configuration for one CU
>>    * @cu_bo: CU configuration buffer bo handle.
>>    * @cu_func: Function of a CU.
>> - * @pad: Structure padding.
>> + * @pad: MBZ.
>>    */
>>   struct amdxdna_cu_config {
>>       __u32 cu_bo;
>> @@ -109,7 +109,7 @@ struct amdxdna_cu_config {
>>   /**
>>    * struct amdxdna_hwctx_param_config_cu - configuration for CUs in 
>> hardware context
>>    * @num_cus: Number of CUs to configure.
>> - * @pad: Structure padding.
>> + * @pad: MBZ.
>>    * @cu_configs: Array of CU configurations of struct 
>> amdxdna_cu_config.
>>    */
>>   struct amdxdna_hwctx_param_config_cu {
>> @@ -122,7 +122,6 @@ enum amdxdna_drm_config_hwctx_param {
>>       DRM_AMDXDNA_HWCTX_CONFIG_CU,
>>       DRM_AMDXDNA_HWCTX_ASSIGN_DBG_BUF,
>>       DRM_AMDXDNA_HWCTX_REMOVE_DBG_BUF,
>> -    DRM_AMDXDNA_HWCTX_CONFIG_NUM
>
> This change actually meant here?  It seems like it should be it's own 
> change.

Agree. Hopefully, the patch 1 - 4 are good to go and I do not need to 
resend them. :)


Thanks,

Lizhi

>
>>   };
>>     /**
>> @@ -133,7 +132,7 @@ enum amdxdna_drm_config_hwctx_param {
>>    * @param_val: A structure specified by the param_type struct member.
>>    * @param_val_size: Size of the parameter buffer pointed to by the 
>> param_val.
>>    *            If param_val is not a pointer, driver can ignore this.
>> - * @pad: Structure padding.
>> + * @pad: MBZ.
>>    *
>>    * Note: if the param_val is a pointer pointing to a buffer, the 
>> maximum size
>>    * of the buffer is 4KiB(PAGE_SIZE).
>> @@ -175,7 +174,7 @@ struct amdxdna_drm_create_bo {
>>    * @ext: MBZ.
>>    * @ext_flags: MBZ.
>>    * @handle: DRM buffer object handle.
>> - * @pad: Structure padding.
>> + * @pad: MBZ.
>>    * @map_offset: Returned DRM fake offset for mmap().
>>    * @vaddr: Returned user VA of buffer. 0 in case user needs mmap().
>>    * @xdna_addr: Returned XDNA device virtual address.
>

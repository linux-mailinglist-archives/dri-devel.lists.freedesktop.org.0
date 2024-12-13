Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E03EF9F13AB
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 18:31:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 685BF10E26F;
	Fri, 13 Dec 2024 17:31:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="OgrW17Mg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2075.outbound.protection.outlook.com [40.107.236.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC21C10E26F
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 17:31:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CI5qayJkB9O9x+UmAWZqkbg7nzXDGPbtUUPlEKnHhQy216EcpNBdjKTSkXzDSzdk+I1rq52EKyH8US5bt7YdxEtnyhjnW+p2++/5DHVCk6aUxNAZGJDkEQghrQJLW7CnUcjPpuJxRNExeletxZAKXgA5Q0cZSegIIHWyRqM3axt18k7mVH4Y3MaQn3Ghrdfuf01cht4ekbUmShTC25ihK+Y09d5J9aNPbZ5ghA+UodT4TqIkOL+RUfeu9d/sKdfq1iWRwIf6GGpJWY7EZ8W85o4Lw6CtjnHwWn5w9H46tEE5wrdyqPNGyyHgdGbl2tmdenHidyXuSxu5MCbd1uP7Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HPgzRKb7RFAZDEWeuNZVhohAp+XTvQ4WvcoaVVuVHZw=;
 b=g1jnWDujdkT0A7XjBgAlTD3LqbNW8JEQdCbmKTry7q7I9frl/81guZ90p1H2OgzE9Ut0oJNvwcAZrMwjxmhvjUICqN0GJ6J+7Yaj6IFn2//E5zmOpr5Le9pfwZdzx7iGlzl499kaHqoHAJYg4jlem/y/MlyVuBtbG0Q2FgLAkKN7IIwcGL4XRUf1B7hzNXdJ4SKwB+lBHSwiiNPjpuLVIoCdMWIaWkOd5ko+L4qxA+4IOv+5lL2ASmyM6fBboyNzLPcjYI/6NOBGWhPagTRc0E7mrwNQkL0HmZ0e07syNFQ7LiX1OUCzmqwWiqggHnXefQiZPux5rQ45f0pLL00Zww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=quicinc.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HPgzRKb7RFAZDEWeuNZVhohAp+XTvQ4WvcoaVVuVHZw=;
 b=OgrW17MgEVFqMF86tezIHVEjSNfy47TbZAm6g3uGY3jzikfutnGcRu4wv6yFs9Xgj/QWAnCHJwfM6bnS8OZBHV1Bd12OsuvBRW7oFHsZXK1Zabdlp+KmVwi7RPgY4Mf+mgsjVPhPzUp6iOG9oiwOoEkfzdU84qHiQLEBM5hsWno=
Received: from SN7PR04CA0043.namprd04.prod.outlook.com (2603:10b6:806:120::18)
 by CY8PR12MB8195.namprd12.prod.outlook.com (2603:10b6:930:77::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Fri, 13 Dec
 2024 17:31:43 +0000
Received: from SA2PEPF00001509.namprd04.prod.outlook.com
 (2603:10b6:806:120:cafe::4e) by SN7PR04CA0043.outlook.office365.com
 (2603:10b6:806:120::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.17 via Frontend Transport; Fri,
 13 Dec 2024 17:31:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00001509.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Fri, 13 Dec 2024 17:31:43 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Dec
 2024 11:31:42 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Dec
 2024 11:31:42 -0600
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 13 Dec 2024 11:31:41 -0600
Message-ID: <13381637-486b-fe43-06f0-b6fe80b8ae6d@amd.com>
Date: Fri, 13 Dec 2024 09:31:41 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V2 6/8] accel/amdxdna: Enhance power management settings
Content-Language: en-US
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, <ogabbay@kernel.org>,
 <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <min.ma@amd.com>, <max.zhen@amd.com>,
 <sonal.santan@amd.com>, <king.tam@amd.com>, <mario.limonciello@amd.com>,
 Narendra Gutta <VenkataNarendraKumar.Gutta@amd.com>, George Yang
 <George.Yang@amd.com>
References: <20241206220001.164049-1-lizhi.hou@amd.com>
 <20241206220001.164049-7-lizhi.hou@amd.com>
 <58715579-1dc4-acc7-0cd4-870f1cd1f579@quicinc.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <58715579-1dc4-acc7-0cd4-870f1cd1f579@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001509:EE_|CY8PR12MB8195:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fbebd23-6636-4812-8f1b-08dd1b9c02eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T2lhM2pLekJ5MTdyczdLSmRoWWNBbnR1cG9VbkQ1SWxEdm1NaCtMTzFLYVZl?=
 =?utf-8?B?ZHFvbTNUdFYwdElvUVFrVFJaUkEvWmdSNURISXYzMG5ibGw1ZHI0dk1GNnIr?=
 =?utf-8?B?NEkwWGFmWFVqY2Y3WVJHZDlmZXBxeis5Mis3ZHdMb0lwQkNEOGpnTTZGK0ZR?=
 =?utf-8?B?QTdhTkhIWDR3M1ltY2ZEcFdoUi93MHBmeTByRmZmVUE3YXhsa3pJNThaMVNs?=
 =?utf-8?B?a1d5RFFXdTlmajg5bDhJNDRCTWozWFVRQjRNSGoxVmUvSmJCY2tsb2cyM1ZX?=
 =?utf-8?B?QUdtWkZVVFRsWENHeFRqR3hodWorUGhEK3puYjVIblAxbjB2TG1ZcVpHL2l3?=
 =?utf-8?B?cXNBZlY0UWRlMXd4ZnFieTVvMFdXWFloYXU5UUJLWXBGUkYvLzFEUUFWcXV5?=
 =?utf-8?B?T0M4OVRyNmxHY2lucUhXT2FITWpSY1d5VkZvcnNzS2trQUNucTVRTDI0d1gv?=
 =?utf-8?B?ekJ6VVAyUnB3OE5GUUxEbUFtbDdaY00rMzlsbjNQRzlucVQwbzlpSWxGVTdZ?=
 =?utf-8?B?amNKUjVEVW9LL3B4TlRSK25wL3FiK1NBSHB1M3FxL3ZnNGJ4dHppZ1BKZEZF?=
 =?utf-8?B?NmZ6UkJvb2tVeHVDSmJTaHd0cFdmL0E3ZXYwVzF5OWdpN3dneEMrSVRWZmp2?=
 =?utf-8?B?b240VnpSK2k1YUE0ZDRwRGFZQis5OGJOQVBScHV5TUlWR1RTTUtCNTNmS3M1?=
 =?utf-8?B?L0RkOFVjWlZWVGtEcFp0N25JTEx2ZTlXbjVnY0h6MjhWTzdoVVNQLytHRGZN?=
 =?utf-8?B?aUhZYmFJZS9sZWIzbGZZYmZweCtuaEM5QVcxY3kyQ0djZGt4a3pDV2lxZGMy?=
 =?utf-8?B?SFpuM2NUNlovOU12dEcrQWVZb01jc2wwYXpvTEEyQmJnUFRSM3ovSWwyWFI2?=
 =?utf-8?B?SmxrdzNsZFh0R2VFd2FBVjUyWXJHdXRrbHlEV081dTVMUFVEWG1RM2t0VS9S?=
 =?utf-8?B?dEt1YVY2ay9lWWIwc3V2OWtDdngyTmkyWVV1TFRzcEkzQ0l3bU5GbWplWHFk?=
 =?utf-8?B?V1pXZXNEQVBBaHI2ZmlUMkhwNnZ0K09SRmVjRE9PaUZ6MG5zckI2ZlJ0d1kv?=
 =?utf-8?B?dVFxOGErcW82azhSWlVSQVdJeHdBa0RONEJ0NDJWNlorcVZuUXRpejg2MC85?=
 =?utf-8?B?YjU3K3dNWDhPbUhFSVdZOUhqWkd6VmJpKzBCaUxHREJJcHd2Rm03NURwOWM5?=
 =?utf-8?B?MXNSUWdFSE5Ga0JaU1YzWHpzbzR0WHoxV1FUME1zeVR3MHVRRWxSV2tsVExM?=
 =?utf-8?B?WGZzNk9BUzVzTnFHczI0eWpOVjlIYjQxc2RjdmlIVHYwT0k2dzUyVTg1V1FY?=
 =?utf-8?B?SjBaZFZtUUExazhWVzdRRHl5MGlxbVFqcUFydi8yMU92dUJHV09kQkhSWkV6?=
 =?utf-8?B?VEtnSDFqam5Td0VpTlhIdmFPeUtOZjJvYnVFZ20rK1NOME92bEpQcEE5NjlN?=
 =?utf-8?B?RmpBSkh4a1hWSCttQmk1bDIyMHE3YjhZVFRpNmcyaUh1OUliaTNIbmliWFR1?=
 =?utf-8?B?TGFMQ1B2K3EvVitKd3lBR25VZUVxN09OMktLZmhDRkh5c3R0SHZBdngxY3RH?=
 =?utf-8?B?RTI3VmtFYnFQbGhwZERjZU9Va0t5WHNIK3ZLNHY4ajhEeFB0OEJNMnU5d0Jz?=
 =?utf-8?B?ZWZyaUpBR0xLaU9lS3JzdmhYRWRZQzduWitBSkxCRU5HSFpkbEt5SUw1SFBF?=
 =?utf-8?B?dC9KUGNGWXFIejNzRDVzT1UwMDlkN0xXWEM0bVk5ME5BRjdEMVZKNW9CVUdT?=
 =?utf-8?B?Q1VVTE1MU0U1Y2MxSkp6azFxT2dRS1Zzc0V5MXRtaWN0L2xUcjVPVG5xbWtw?=
 =?utf-8?B?VmhmN0x1S0lWSHNxOE40YzdVd0psb25Va3NiU2VxcldTZlpXSjdwNXFLMzBT?=
 =?utf-8?B?V3NnN052TjYveXU1RjJ6SEwxUWRNSm9HRTAvWG04RE8vc1kwU095dkNyc1FD?=
 =?utf-8?Q?Ia6sgILjuHZSgUFQgMnOsYHESLpbA/kh?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2024 17:31:43.3381 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fbebd23-6636-4812-8f1b-08dd1b9c02eb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001509.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8195
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


On 12/13/24 08:55, Jeffrey Hugo wrote:
> On 12/6/2024 2:59 PM, Lizhi Hou wrote:
>> +/**
>> + * struct amdxdna_drm_get_power_mode - Get the configured power mode
>> + * @power_mode: The mode type from enum amdxdna_power_mode_type
>> + * @pad: MBZ.
>
> I don't see a check for zero in the implementation
We discussed the 'pad' field in uapi structures. Because the driver is 
not released yet, we would create a patch to change all 'pad' to MBZ and 
check them in the ioctl.
>
>> + */
>> +struct amdxdna_drm_get_power_mode {
>> +    __u8 power_mode;
>> +    __u8 pad[7];
>> +};
>> +
>>   /**
>>    * struct amdxdna_drm_query_firmware_version - Query the firmware 
>> version
>>    * @major: The major version number
>> @@ -397,6 +416,7 @@ enum amdxdna_drm_get_param {
>>       DRM_AMDXDNA_QUERY_SENSORS,
>>       DRM_AMDXDNA_QUERY_HW_CONTEXTS,
>>       DRM_AMDXDNA_QUERY_FIRMWARE_VERSION = 8,
>> +    DRM_AMDXDNA_GET_POWER_MODE,
>>   };
>>     /**
>> @@ -411,6 +431,34 @@ struct amdxdna_drm_get_info {
>>       __u64 buffer; /* in/out */
>>   };
>>   +enum amdxdna_drm_set_param {
>> +    DRM_AMDXDNA_SET_POWER_MODE,
>> +    DRM_AMDXDNA_WRITE_AIE_MEM,
>> +    DRM_AMDXDNA_WRITE_AIE_REG,
>> +};
>> +
>> +/**
>> + * struct amdxdna_drm_set_state - Set the state of the AIE hardware.
>> + * @param: Value in enum amdxdna_drm_set_param.
>> + * @buffer_size: Size of the input param.
>> + * @buffer: Input param.
>
> Is this a pointer address?  Maybe clarify that?

Yes, it is. I will add comment for it.


Thanks,

Lizhi

>
>> + */
>> +struct amdxdna_drm_set_state {
>> +    __u32 param; /* in */
>> +    __u32 buffer_size; /* in */
>> +    __u64 buffer; /* in */
>> +};
>> +
>> +/**
>> + * struct amdxdna_drm_set_power_mode - Set the power mode of the AIE 
>> hardware
>> + * @power_mode: The sensor type from enum amdxdna_power_mode_type
>> + * @pad: MBZ.
>
> I don't see a check for zero in the implementation.
>

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDD0B371F4
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 20:10:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B740710E389;
	Tue, 26 Aug 2025 18:10:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yLeAQO3T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2069.outbound.protection.outlook.com [40.107.95.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A229310E389
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 18:10:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AcP1G0dyY+Rgb1OLYMxciZqkliogG5THCZzVwWv5jtpKnz3nqu74s/0kx7/XS9Tha/NnpGMqeQUL7laG0VtSTaIPXyS9IVaouHbgpinCczv9HEbtaSsRUcybxJcv1+9CmCjsrKNCAezTAUgiBLmnd7ksiFpZLfrBGVUdlzW48Ed2KumIYyxvxUSTtSxQMlMwBp4UqZAoTGdqls9VO0diQsxcXofLKpvThvgnL6YYIS2hXtNJRFW5xNSmvYHVHReLHCacU5hEWHtyH1u9n155G3QgEVtcz4GAHDiv+Pue+obXesPFms42uzeW+2wGHJQOwKx6LeRyoc/9nNLqZTdZIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bc7sJfxf6CzhWOZY7rqUBIEsNvU8VP0vQE5cBDOt8So=;
 b=nPvEK8/6pOs2jIH6UYrnoGveOHQh7eiiZxLOFijmR/2sOFJVY1ArQpk7bQ55mJJu2r4/JwFAASM9Xj4DloElQptMDfGJekLbD2dtUPASdOceKK9ZCgs++Q4yb9vaPGsjGTRck1sFOXmME8y0BeWo8uvfqXUPDebF2JgZsJD3S8g4McusARIzqHIWYjwlJpvF/mrCdt9uroa5yEV6kJX0Jv5DrUhUEVDR6WsQJGhw+m+1g7BNnnfBkku0yDE7ZA520CPAmw404OnGrWKSsM0+RxlWlIEFtsFdU4f7lhKDHEaqk/0NBVRD3au+EGIDi6dr1Oi/dROTnNUiY9PNNZfwbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 165.204.84.17) smtp.rcpttodomain=kernel.org
 smtp.mailfrom=amd.com; 
 dmarc=temperror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bc7sJfxf6CzhWOZY7rqUBIEsNvU8VP0vQE5cBDOt8So=;
 b=yLeAQO3TVVwqHlWrp9r4LR5Cmhgx4qGE9yCZPJZ1Yo21uK3UjbLjji5Pk3+ksrh2IuMrrgwiUxMizKFWWjLjlBy39l7/Oqyj3efhbJQKyk9t+0YJsgRncHF32QCSaD5gtowtl3xIaEj8DyRxxRKSyc+u6zNpSBdn8nXEFdFpRts=
Received: from BY3PR05CA0040.namprd05.prod.outlook.com (2603:10b6:a03:39b::15)
 by LV5PR12MB9804.namprd12.prod.outlook.com (2603:10b6:408:303::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 26 Aug
 2025 18:10:28 +0000
Received: from CO1PEPF000044F3.namprd05.prod.outlook.com
 (2603:10b6:a03:39b:cafe::7b) by BY3PR05CA0040.outlook.office365.com
 (2603:10b6:a03:39b::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.13 via Frontend Transport; Tue,
 26 Aug 2025 18:10:27 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=amd.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of amd.com: DNS Timeout)
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044F3.mail.protection.outlook.com (10.167.241.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Tue, 26 Aug 2025 18:10:26 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 26 Aug
 2025 13:10:26 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Tue, 26 Aug
 2025 11:10:26 -0700
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 26 Aug 2025 13:10:25 -0500
Message-ID: <b3874221-5b4f-9625-de8a-4e54dc6884a2@amd.com>
Date: Tue, 26 Aug 2025 11:10:25 -0700
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
 <2a21100b-2078-a166-0b47-9db6b4446b5a@amd.com>
 <b758a72f-e30e-42f9-a6aa-6f6297b8cce3@amd.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <b758a72f-e30e-42f9-a6aa-6f6297b8cce3@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F3:EE_|LV5PR12MB9804:EE_
X-MS-Office365-Filtering-Correlation-Id: 81d78357-5a17-42f9-4edf-08dde4cbd56c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WlV0cXU5S2VnS1NOWDR6YUVsWlhJVkNCaU55czUxdUhtOXZYZk4yTXlyN1FX?=
 =?utf-8?B?RFJpdXBXMkdDVlJzZjcyQlhvNEQ4Q202R3M3WGRJSTd0SWN5SklCMW9wVU9h?=
 =?utf-8?B?VVRoaTdZME5ab3YyQXVMK2JCcFNBbFJaUUNXNVVDSkxrdU9pVnNoRGtLSjhE?=
 =?utf-8?B?V2d0Mm04VjIwQW5ENzhzbFpueDBTc1MwZjNONlc3dWpMZEkybnc2NVNFZEI1?=
 =?utf-8?B?WVhCNmxVYmd2b1hhMVFiM2M2UWpEZTBQTHpDZTF4cjdEY2p5cGVPN2JqREFT?=
 =?utf-8?B?RGVZOVZsZlFaOWtaZVhBMDY3dWtYeklnTjRoWDlXbXRSOHVqZlhzV0RhRVZO?=
 =?utf-8?B?TERWYjVsRDE5TGxGOUwxZzMvSVJKYUFhWVZ2MzkvVTB1SzZFOU9xOVlDdHBV?=
 =?utf-8?B?RG9sTEJJMmJYWWQrOWtjYUZ4bWRFeFNJSjlJZ0ZyU2FLMnNETWUwMmRBRHlD?=
 =?utf-8?B?YTJDLzNCK2VrdEdiZlNUT2dieTJ5M25JNTcvUDRrRkx6bzdNMnE2dWwzK3pa?=
 =?utf-8?B?S1dOcmpPeGpLcXVoZ1BYWW9zTWl6UHF2bzNsbVByK3EzaVFqakQ2cStxTFJH?=
 =?utf-8?B?S3VyZTBIVktibVRRNDUyRzFSODd5eithcVBkbHhEaGsrWXpvZnRBOWpWMnhF?=
 =?utf-8?B?c1c5N1Nabmt6dDl5M1VpY2FnUlJhUlVZN3U5M0tPWVNIMEZ6UGtaQlpnRDh2?=
 =?utf-8?B?a2hYTE9XUTlIaHQ5ckVMSXQ5T0laSk5EcTdzTVpuVlFlQjBWV2ZPclNzbXdR?=
 =?utf-8?B?UmNUcjQrbStWek1oeExRSVF2RldGTW5PNW1FcWF1Q0g0eWtiWHZ5LzlOb1F3?=
 =?utf-8?B?dmZFVnB5MndDZGRiZVJhdWUvMHllNjZ0WjlkSDhvMEhEVTZ5UTExQnR5NGlm?=
 =?utf-8?B?TExPNHRZcWU1NW45QWI4ZExXeFNvTXo2UjlrYXArcXJ3SFZRZHF0ZFhCOUdE?=
 =?utf-8?B?MlRDNzNsbjF6ODgyS3VENTQvc28vS3YvREpWdWE4STBnZWVRMkcwVEpDMlhC?=
 =?utf-8?B?MU5yTDliYVJRbzNWd1RuUm0zQXJoTG16S0NsbG92bUl4K09kdjE0NTdqSzhV?=
 =?utf-8?B?L0JQWStEc3FHRjVXaFdjY1dGYTlIU2h1UFZOeU1LeU5CMmRITm03dENIcC9B?=
 =?utf-8?B?VlUzM0FjOHlYc1E0Y0s5Zm5XcnFyOW1QZmxBYytaNHJMRFBiOUlYRTkzLzJh?=
 =?utf-8?B?UWMvVFp4MFZzNTd2c293N2pOWVE0NCtOOU4rU0hqNENubkkxVExkUkVWUTg5?=
 =?utf-8?B?TXIrRHJhWlE0SVJxcWxma1g1NjBhVVZlYUJzbnZ6aU02b0xEQWVobDI5dUd6?=
 =?utf-8?B?UnB4MVVpNXlLN0YyTUY3d0NjcXltUi9FUG9qOS9YalQ0dFJrMkNkQnlHVTNJ?=
 =?utf-8?B?TmwyMUhiT29tbFpFSm51b3RrR2p6TGIvaVFiOVl2ZnN2K1FFT0JiVkJEbGt5?=
 =?utf-8?B?VnA3a0Y4bENHZXh4Z1pDcVhxTUpERFdhbjVwNkFPNllLR1JKa3JFS0lsVUt3?=
 =?utf-8?B?TUN1MEhKRzZ1YTFxdkJ2WExaMmt3Yi9ybE1seEdrc0pPemlNWTE2Ri9Nd0Ro?=
 =?utf-8?B?M25vd0lHTHRqZWNrSjF5M0toSnJqajdBQm1ISDUrN1F2Ry8rV0czaWZta0ZT?=
 =?utf-8?B?VjltbUxscXJYYUJPVzMxY1RTM05KZC8wbXZ2dDg4OStpOXRHUTdWTkhyTFVN?=
 =?utf-8?B?OWUwSllvdlpnR2ExTFdDL2pTeUl2c0tBYS9pVzhXTGRFTC8wVVV6TDM4VkF5?=
 =?utf-8?B?K1hJVnI1VG5lNVhJZ3ZObWFobEExLzBjRjFoZUlERmpMS3Ixajg0cmJEalZS?=
 =?utf-8?B?RVYxT0dIY00zQmZmdlptTW1Cd1pUSVVicE1jbnZzRHNmanhsN3FnbGYxNWYw?=
 =?utf-8?B?SGpXWEhjd085RUFUUExqbWhpb09naFlHUGdQVG96RFBPZ1RWMXN4TDRnTUZj?=
 =?utf-8?B?YXVxRy9mQWJDVFpZOGd0cVp4a0hBbmxya1NjdjIza0NWQTM0R2RGd0pYRmdt?=
 =?utf-8?B?N2hGeS85Mk5NTlI4bzRtZGJvaXVHbnNpQnZFWmpMTXJSdEJoU3pOdjdxazZ4?=
 =?utf-8?Q?CgSZAr?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 18:10:26.5269 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81d78357-5a17-42f9-4edf-08dde4cbd56c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR12MB9804
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


On 8/26/25 10:58, Mario Limonciello wrote:
> On 8/26/2025 12:55 PM, Lizhi Hou wrote:
>>
>> On 8/26/25 10:18, Mario Limonciello wrote:
>>> On 8/25/2025 11:48 PM, Lizhi Hou wrote:
>>>>
>>>> On 8/25/25 14:28, Mario Limonciello wrote:
>>>>> On 8/22/2025 12:23 PM, Lizhi Hou wrote:
>>>>>> Add interface for applications to get information array. The 
>>>>>> application
>>>>>> provides a buffer pointer along with information type, maximum 
>>>>>> number of
>>>>>> entries and maximum size of each entry. The buffer may also 
>>>>>> contain match
>>>>>> conditions based on the information type. After the ioctl 
>>>>>> completes, the
>>>>>> actual number of entries and entry size are returned.
>>>>>>
>>>>>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>>>>>
>>>>> How does userspace discover whether or not the new IOCTL call is 
>>>>> supported?  Just a test call?
>>>> The kernel header version will be used to determine whether the 
>>>> application which uses new IOCTL will be compiled or not.
>>>>
>>>
>>> But it's not actually an application compile time decision, it's a 
>>> runtime decision.  IE I can compile an application with the headers 
>>> on kernel 6.18 that has this, but if I try to run it on 6.15 it's 
>>> going to barf.
>>>
>>> To some extent that comes with the territory, but I'm wondering if a 
>>> better solution going forward would be for there to be a dedicated 
>>> version command that you bump.
>>
>> For in-tree driver, I did not aware a common way for this other than 
>> checking the kernel version.
>>
>> And here is qaic patch of adding a new IOCTL.
>>
>> https://github.com/torvalds/linux/ 
>> commit/217b812364d360e1933d8485f063400e5dda7d66
>>
>>
>> I know there is major, minor, patchlevel in struct drm_driver. And I 
>> think that is not required for in-tree driver.
>>
>> Please let me know if I missed anything.
>>
>> Thanks,
>
> Right; so bump up one of those so that userspace can check it. Maybe 
> "minor"?

I meant for in-tree driver, is it good enough for userspace to just 
check kernel version?  E.g. The drm driver versions are not used by ivpu 
or qaic.

Thanks,

Lizhi


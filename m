Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F092CA8A188
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 16:48:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DB8410E11D;
	Tue, 15 Apr 2025 14:48:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="GJk5nQCz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2058.outbound.protection.outlook.com [40.107.95.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14FBA10E11D;
 Tue, 15 Apr 2025 14:48:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xRfnmE/6BCShi+8uObk/Pad4poQvpgk/zXd38JRsI6cs6iSC0mkOxXmncytnxGrH0foXoxElHt+kLU+kEVGsweQSSznDYcf2+svJM8fy0WI6yzD4cZMl7OnCKLoSlDcoN29Tg/mUNUv6IAETied/zZnynET9HnnkUllnwfxlAKDCBIOQcghjLemq5j670LoAZX7EVYF/fGJ/D/O81Wypz3ZIb53PIWKGvvaRXJ8eZsnzGjOaOoyQR6qm5aklYAnYQtr1HG0xYfBmqFJ5E0lSWYpcJS++/GOeBNiC0qRBzbmiOUQuIFP98A+CtoipSQyGKug5NHs/G5+QMXuc1HFISA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XvSjT2AiOqQ5C1O2UK1HoD7O6xs6EPqZIwRHDjUetOY=;
 b=OvK0ggEetJ17eYtCADC5ziVSiizduIAWqBDs3p0QZceHBOWoYhAdhQRRipLjo30Ltc8xi3isRnJzZ5i90RJQXzNusPA/C/8LRNWCLbhEy0qLP8ap4VxMkmTYsyFaIhf0PPa//xsxuL9xRi630JInHuEceAsFSEwOeTETd7GssbOD6C4yhACjfag97SZ6ZJQxZWpVrkFosuBI9WTlNZeD4HjSr40k5UBJjfdBokJJUn/O4ckwbzMmz6Kjcz6iX2eLeDo4/kjf6mu798jTt5I7DYj+eQz0Qvc6wOvT/9U/kfu1tqTwfMjFxTvauCS/53ZlkZTMviaURCM3TBVjEsmLwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XvSjT2AiOqQ5C1O2UK1HoD7O6xs6EPqZIwRHDjUetOY=;
 b=GJk5nQCzi5a8hsZ0LZePhjobCPV8k9yt2LDNL5XNWGwAoqWLOdp9naaFd0y9ZZlPhRupqMCE0gofXcy39KQI/mehi29LP+eqB+UToXp9/DSr34ZFfzDYqiXIv2k2xUYWvoP96f/YJYL3g01R9R4hW0VjuoDxCgN8RUKCcqXNPLk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV2PR12MB5776.namprd12.prod.outlook.com (2603:10b6:408:178::10)
 by DM4PR12MB5865.namprd12.prod.outlook.com (2603:10b6:8:64::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Tue, 15 Apr
 2025 14:48:28 +0000
Received: from LV2PR12MB5776.namprd12.prod.outlook.com
 ([fe80::6628:31a5:4bbe:ffec]) by LV2PR12MB5776.namprd12.prod.outlook.com
 ([fe80::6628:31a5:4bbe:ffec%3]) with mapi id 15.20.8632.035; Tue, 15 Apr 2025
 14:48:28 +0000
Message-ID: <0b0b9473-9459-47da-9fc2-e2395ece49a9@amd.com>
Date: Tue, 15 Apr 2025 20:18:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] drm: function to get process name and pid
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Sunil Khatri <sunil.khatri@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
References: <20250415112550.297292-1-sunil.khatri@amd.com>
 <c7bb4a85-dce7-410a-a2f0-16fe7b5c0c3a@igalia.com>
Content-Language: en-US
From: "Khatri, Sunil" <sukhatri@amd.com>
In-Reply-To: <c7bb4a85-dce7-410a-a2f0-16fe7b5c0c3a@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PEPF00000183.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c04::49) To LV2PR12MB5776.namprd12.prod.outlook.com
 (2603:10b6:408:178::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5776:EE_|DM4PR12MB5865:EE_
X-MS-Office365-Filtering-Correlation-Id: cdcdf543-a542-4610-16d9-08dd7c2c94f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aGtwdUJmTDJGWEtpZnlSajhJanVQNG9KR2VjZDdTcE53dVE5OG5YSkJ2RUMv?=
 =?utf-8?B?eG54dkN2VUhFYmFJajEwMzR4eWZKRGMzWTJSdlo2azQyS29zcXMzeWM4OTJ0?=
 =?utf-8?B?WXFKbHlmZ0dDbDRxNDFjWFo2SDZwTVNXQzRMY1JOaWxjYWZldUJ5UWt6eXVS?=
 =?utf-8?B?VlVKKzdLN0ZlWVhDWHpCZXE5ZlkrUjBTUWRYK21kdENLQk5VRFZBNnlJOFN1?=
 =?utf-8?B?ZFd6VnZKczI0OGwvOGVFbStURHByL2xiODBuZkpNSkpZcnBQaG5rZ0JQTW5o?=
 =?utf-8?B?T2ZWL1RSZlIwRDcyajgyRGtRME5tc2xCSnZiK3E3Y3FlZlBQMTlycFFIZmZK?=
 =?utf-8?B?YlNUT0pwS1hBS3VPU2thMGVyMWpRNUhHaEJ1S0dWMnRKSnI1ei85Z1hnRCs3?=
 =?utf-8?B?cE95QkJqdzd2bzRSY291cng4WHJqdURBTmFHQW85eFRoTS8vdSt4cHRjN1c5?=
 =?utf-8?B?L2dPTk1OVUQxVmhFOVY3YmtQdmtPRDZVWjFLdENTM3RtK3plTU9XZDVvL0V2?=
 =?utf-8?B?ejhFM08rMHRjUVpicmtEVGdSTzVnTXVHbmtZYVYxdTRnMnArcmtVc3FiY05w?=
 =?utf-8?B?VUhTSld6YS9FRjY3VjZiTDMzZFRBL0V6dkxybk9CYjY1ZERsMWRqdzdzUTJl?=
 =?utf-8?B?YzVHekNFYWhCMENYdFB1Q0dsM2lVckg1R1lMOTlTaWY3cFlxa3JGMzllcWpI?=
 =?utf-8?B?a1h4Zm1Va0s2dWNKZGlJSkhBcTdCdi9IOXB4NElpNmp6UWQzWlBkWm5QYlVF?=
 =?utf-8?B?Z1dDT1dEWXkyREJidFVhMGJITjZSRk1GRHRxQzdmY09MT29LZDlwV2FKME5V?=
 =?utf-8?B?TGFSRCtyN2N3MlZ3YTZiek5qeFcrOG9hMFZSUUkzRW9iaW1QYTNIbmFlWEJM?=
 =?utf-8?B?SUZxYTVabE11ajd0V2xLdlpQRjlSMUV0ZEtrbXA2T3lXYlhIVXFjYzJmSjhp?=
 =?utf-8?B?ZWdBWnFuWjhSNWFTWU9nSlBTUkRlYkFFdEozYXFaRnNUZ2ZvY2tjL3pGd2F2?=
 =?utf-8?B?QTAyTjNiYVc1U2NvZ1pBektEeVhYK0FiUGcydVpmZjkvTUo5YnBpR3ltTjdJ?=
 =?utf-8?B?Ym9xNEVvelFsWFVkbGNBQ3UzTFUxa3JDc0dPOVB6WXJMRVRGQjZub1BVYytU?=
 =?utf-8?B?d1c5NlhVQmVhMW5hYWZ0MWYxR3dpdzdyUzRhdlpjUVFqOEUwbmxjbWY1VVlo?=
 =?utf-8?B?YXJtZUpUaWdlT3c2cGltdmkyZWpKK1Z3aVk3K1NzNGpDSW5pUmdJY1Y2anFp?=
 =?utf-8?B?VkZVMUIyVk1NV2JFK0h3Z2pnRHorWnp6bzhxelRGQ3R4aGJTN1QwMU9Gb09v?=
 =?utf-8?B?QVZpYlB1MFNkL3N0OW9yVGpLMjBxZXYvUHRtWkttQlc1REo1OVFoQlVEbXpF?=
 =?utf-8?B?eFZXVTNYTGowMXpyZjV1YTBnZE9wQmVrclVqdzVkakNrQXE3Vi9hRFVXM2ZD?=
 =?utf-8?B?MUpmTjlrSGpKSmg2UnNWenVTUURRbHhqanNKNDh6TnhkYmd4TXp5MVdNSS94?=
 =?utf-8?B?Y3ZCYm96M3FHOXlYdDcwNGhoTkd4QlhDSWlSazNxZ2MyVjZEZ2c3YnVKc0ZS?=
 =?utf-8?B?UExpTkxDQitsY2kweGtKNXBJUUh3QUxKMWVXeDIyRXhocWJwd25nTzBiYkRr?=
 =?utf-8?B?L2NRRFZHckw2aG4yYWdvelFHTndtd2pvRUowVm9kbG9oQWFUSzlkMGYxN0Vm?=
 =?utf-8?B?ZUxUall4MWhLdkg2dlJxUlp1NGNScHBHdG1pdGc3RjFqYmlJT1FzZDdhSFFZ?=
 =?utf-8?B?czMrNWtuZGY1a2V0eDlQK2hHQ2MzYWJ4bzZTOFRkQ1hNWWhkUE5RZVlwbUJ1?=
 =?utf-8?B?MHJSSExyY3RDcHVuR0Jxa2tjQzMwTWpVaEhHNTJPRnBiNnFoWFdQaWtGZEE1?=
 =?utf-8?B?OG1VUkJkZ2ZZY3ljZXdBMEl5UFNTSjU3a2Q5YW9FZlY5YmdIWkV5UDJQQU9Y?=
 =?utf-8?Q?EDk28/X0BzE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5776.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wk1vZzJZZmZMcEpyZmZCY1FpNnpqMzJ3M2pmb2lMcXl3UUVsakRpcGdRT0lW?=
 =?utf-8?B?Z2oyNU9ucVhGOUhHcDZiSUd0ZTdzdkx5SEhnQ1gzY21sQU15b2JuQitCYjJ6?=
 =?utf-8?B?d0pxUGNka3E4U2JsSG5ncWVyUS9RVnFZYXQ5ZVBKbzZHY1BCTGwwOTlvdkZU?=
 =?utf-8?B?TC9vdUtnZWlVWENLZ0VHT29rN1k5K1d6WHpOTlJjMG9KWVppUVFiNjlqazJq?=
 =?utf-8?B?WWN6RDN1MXFOanVKV0M4YnRMNkpmQ3AvZUx3MG5FazdFelVOM1hiS1NUczNG?=
 =?utf-8?B?d1hxLzhOSi9CL3N6OUNab2NnbklGcGJmck52ZURxb1VnRGFNL05lTXdEclcw?=
 =?utf-8?B?dklCV3UvTS9pSXRidkpFTGFlVGp0Mk54a3VnMlRYOGJ2T1o3RzBqL2VCMFgw?=
 =?utf-8?B?UUNybXdCdHJEbExtckw4TVBHQTNGVzVNUmdlckJ3QWhPUm12TjlVS3JINDhE?=
 =?utf-8?B?eVk1QWlkYlNqZ1lMN1RabCsvUVhYVVZOYmNtVGpDaDZtQWxubFZPamNON3NQ?=
 =?utf-8?B?amVnM3RHdHFpOEVSWW1aWFJaUzZRZ1hRaktIMnJoWVhMVFN5djVRRExXckRn?=
 =?utf-8?B?c1J6RHFPUWJGSDV1Z2wrMGJEQml3NXlEZUEycnhHV3o0aHBjVEI3MzViZWpy?=
 =?utf-8?B?OEo5SkNUd25kU1I3aUV0VEtDQTBNdGROcmNLY2N4dEMyTzJNMEZNZ0RFaGpE?=
 =?utf-8?B?UXlZdTV3ditJUit6ZE9JV1haOGRHaEtyWkxiK2JjYXVYN1FOQmVtWGhUN21C?=
 =?utf-8?B?S2pRcE1WdlJVOSsvRGVNdVhucEdJMDhENWRmRkZ6bVQ4dXJUMS8xSWNpRzNH?=
 =?utf-8?B?YWZ6VG1nNjNLVHlMcEpLM25VKzJqSzE1NVBUYlhjRTlMMG5BUktoSWxuaGVW?=
 =?utf-8?B?ZVF2cG1kc0JFaGdmdjhoUUdTanlaWGc1NnZ6dGZMRjVvZXF1SlRuVGw3N0tU?=
 =?utf-8?B?NDk0cFJQbmwvcUdZVmpGb29scWxXK3pGclRrRjRZL2VITGVublEwMDVzOTJK?=
 =?utf-8?B?bFIzSWMxVzc3bmZObyt0U0pGYUtMZzdZQU51RXVxdnR3T282WlNKbmtCUmJC?=
 =?utf-8?B?TUZsNHBOZ3RwajYzS3poVWJEL2VUazQ1Y05FTmlxMi9yMVVTQmQxSnhYU3NZ?=
 =?utf-8?B?eU0vY0FaL0RlQzJxV0REbFU4NkZyTFJJOW9ybDdhRFc0YWc3YjFrMEFHVkM0?=
 =?utf-8?B?c1c0bmJpNk4yNzVoWlhLRzl2bytzY2NBWVhOUmV1SWw1dTRwUWV3WFBpTHc0?=
 =?utf-8?B?UEJpMFN6b1cvb0dKQzFJODIzQkhIOXBBWkJFQk5BbE9OWXAraGF5Zy8xWUFV?=
 =?utf-8?B?d0VodW5iV3hCMkpxclhsRE5jK2ZrdEpzZHhLdXpJU2lPQ1R2MWdxVlVPZ3JW?=
 =?utf-8?B?QjVXUTBEVEF6dnJTb1BOa0cwb2Q0cThEVTg1NTU4STFla0Q5Q2FKOVV0UGZR?=
 =?utf-8?B?WWhiTjRQRE5Fd1VnU2c5eDdoQm9YbmprTm1vZnZhQkdLU2NkcW4vOU11Ni9Z?=
 =?utf-8?B?TXNnbW1PZ1pPR0lTM3d1WU56VWxLbzhEcnJqRThtWnRUR0pqaW5mMW8rdGZD?=
 =?utf-8?B?TVJyRVhKTFIwRWxVSVZDSWFKMzU1Qi9rNGJiN05BWnBWQ1NWc0hUZTdvb2Fy?=
 =?utf-8?B?WjNleEN5V2V3djJrb1V0bEU1MjBMekVjK1U2QVIyS2NYSGFuc2cxUDZqWFNj?=
 =?utf-8?B?S09YaUtRSDQzdGpNRk52a1d3cytWQXJpT1N0ZVowV29ZMHRib2MrYzdrWEN4?=
 =?utf-8?B?WHIrS0ZvbFJ0cHg4RC9RVitsTUpPNFVSUUlCY1pOakVSZ0s1b3hxSUNFcXYx?=
 =?utf-8?B?V0QzOCtpeGVBaStrZnRlV0hlTUJCNzc0SVpTYS9KanlUQitCQVY3ZStOUkd2?=
 =?utf-8?B?UG5SN1VWNHNDeW9wSDlPb0Y2ekp0ZXJYSHMxZ1VTZ3djajRvM25RNDVTZEtP?=
 =?utf-8?B?L0JIYzZpQTRMUytzVmZpdlowNWREckYzaWUyU2RMWmprL0pLYnc4MmZPMjB3?=
 =?utf-8?B?RzlBWGxoNE9HMW5RMk0vT0dpRHRNTDJxUnFJT0djMXFJVXNjcnV0eDV0emZ5?=
 =?utf-8?B?L2RPbVVZdlF6Uyt4eE45MUdWQ0F3a1dkT2JtQWlVZFFiNUJiOU9ZNUlkOUM2?=
 =?utf-8?Q?u0IZVk1WG+bIpdOIH7ffTYIx3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdcdf543-a542-4610-16d9-08dd7c2c94f9
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5776.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 14:48:28.0365 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6pcABKE+XCQfWra+4GmBi5RnhBzwzJo+iSJ9Q7roiS+9KUcrN1xLr6mlsRMV/BewBBBi+i32NRp5hr4u9EG2iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5865
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


On 4/15/2025 5:10 PM, Tvrtko Ursulin wrote:
>
> On 15/04/2025 12:25, Sunil Khatri wrote:
>> Add helper function which get the process information for
>> the drm_file and updates the user provided character buffer
>> with the information of process name and pid as a string.
>>
>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
>> ---
>>   drivers/gpu/drm/drm_file.c | 34 ++++++++++++++++++++++++++++++++++
>>   include/drm/drm_file.h     |  1 +
>>   2 files changed, 35 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
>> index c299cd94d3f7..728a60975f5e 100644
>> --- a/drivers/gpu/drm/drm_file.c
>> +++ b/drivers/gpu/drm/drm_file.c
>> @@ -986,6 +986,40 @@ void drm_show_fdinfo(struct seq_file *m, struct 
>> file *f)
>>   }
>>   EXPORT_SYMBOL(drm_show_fdinfo);
>>   +/**
>> + * drm_process_info - Fill info string with process name and pid
>> + * @file_priv: context of interest for process name and pid
>> + * @proc_info: user char ptr to write the string to
>> + * @buff_size: size of the buffer passed for the string
>> + *
>> + * This update the user provided buffer with process
>> + * name and pid information for @file_priv
>> + */
>> +void drm_process_info(struct drm_file *file_priv, char *proc_info, 
>> size_t buff_size)
>> +{
>> +    struct task_struct *task;
>> +    struct pid *pid;
>> +    struct drm_device *dev = file_priv->minor->dev;
>> +
>> +    if (!proc_info) {
>> +        drm_WARN_ON_ONCE(dev, "Invalid user buffer\n");
>> +        return;
>> +    }
>
> I think this should be:
>
> if (drm_WARN_ON_ONCE(dev, !proc_info))
>     return;
>
>> +
>> +    mutex_lock(&file_priv->client_name_lock);
>> +    rcu_read_lock();
>> +    pid = rcu_dereference(file_priv->pid);
>> +    task = pid_task(pid, PIDTYPE_TGID);
>> +    if (task)
>> +        snprintf(proc_info, buff_size, "client_name:%s proc:%s pid:%d",
>> +             file_priv->client_name ? file_priv->client_name : "Unset",
>> +             task->comm, task->pid);
>
> Probably bad to return uninitialised string for the !task case.
>
> Also, now that you added client name the case to move towards the 
> helper which does not need a temporary buffer, like I was suggesting 
> drm_file_err(drm_file *, const char *, ...), is IMO even stronger. 
> Consider if nothing else DRM_CLIENT_NAME_MAX_LEN plus the length of 
> other fields you will be adding (the series as is can truncate). And 
> it would be a bit unsightly to require relatively huge stack buffers 
> in the later patches when it can all be easily avoided.
>
> Sure let me try adding a new drm_file_err which handles it without 
> user input buffer. let me work on this and get back with a new patch 
> set for this.
>
> Regards,
>
> Tvrtko
>
>> +
>> +    rcu_read_unlock();
>> +    mutex_unlock(&file_priv->client_name_lock);
>> +}
>> +EXPORT_SYMBOL(drm_process_info);
>> +
>>   /**
>>    * mock_drm_getfile - Create a new struct file for the drm device
>>    * @minor: drm minor to wrap (e.g. #drm_device.primary)
>> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
>> index 94d365b22505..a972be73a615 100644
>> --- a/include/drm/drm_file.h
>> +++ b/include/drm/drm_file.h
>> @@ -507,6 +507,7 @@ void drm_print_memory_stats(struct drm_printer *p,
>>     void drm_show_memory_stats(struct drm_printer *p, struct drm_file 
>> *file);
>>   void drm_show_fdinfo(struct seq_file *m, struct file *f);
>> +void drm_process_info(struct drm_file *file_priv, char *proc_info, 
>> size_t buff_size);
>>     struct file *mock_drm_getfile(struct drm_minor *minor, unsigned 
>> int flags);
>

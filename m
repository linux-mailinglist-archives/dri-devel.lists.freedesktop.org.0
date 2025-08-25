Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E0CB33E14
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 13:32:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF13E10E442;
	Mon, 25 Aug 2025 11:32:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="C8W75YBH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2047.outbound.protection.outlook.com [40.107.220.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A51A10E442;
 Mon, 25 Aug 2025 11:32:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xmC5Tos9SVATQsK6Xtg8wq1VIr5iqc2oyq91c7mAeoAVDts/xkgdgFMXb3q18B2eVWoXyOKcwC7ab2WK5ADagkblHOfJ/gmSbgWtzTCcDzYbhmG1Un2G1qfpfR2A3we10hWBMA3sIqYiGwYZI635AxCzKqDU833BlPzfOOYsb6ohspchhd/jLmHVuW0+5FWpSCTlB0q7axeaeEUo2DqVuvwW2VX0KlzwOdQrScCD84e+OtwGFajw6H0tLSGZXzcOZYc3Y/ugl8GYLSHTbG2u+N4KNIn6A6VGfZA52Iav6H944pq3E5me73C9D2a7WM2gNK/717ZLT6uZ6wWYdtDr8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=La1oc8P2oI7lSFagKkwRKrBFGzv28Bm+oN8wb+uKzlU=;
 b=tF72VT0s9s1d6IPsOwmeYylzgEFt9TXswBv0tDAB5SwgNIGDBQWsiOxVzL3DZnkklEARBKyNhh953I5/XkhtP5I40ZEXmPtcQgKu3lknorXJ07fuEwr1wIGeNOc5EGpXSEw6gm5Ol0SPtof5wJvNh2f3WtEwnCWSNmtslnTALpKlIbCUKXcvNL0fS4NFEennAw5wzm/lXk9gi0TVrp+3ErEQM9ihtnNRx6OjzuBc/1tivrLUzxUOxrppTmzLb+OCVzTkB2CTnFe1ZyUFLmWSpnIIGdnJDD1F6wPel5XpIwbKTz475aEvz71HnvczZIRD6Kl5v9PiyK6qzxmXwcAClg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=La1oc8P2oI7lSFagKkwRKrBFGzv28Bm+oN8wb+uKzlU=;
 b=C8W75YBHHMlyHygwJAfsjZJOXS5JU1pD1tC/hoZbzGVXDwpguQB7FPIYRUZoPwe+RxAla7DnmN6JfFL2shNIjDo4ijMUIjbAq9MmWU6uN9nN05wB+S2QwHtoT4hG0hKWhD2M5nC/fhAtGPb/TVTerzj4y4lKm8QXOzm2ubJoqg4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7301.namprd12.prod.outlook.com (2603:10b6:510:222::12)
 by DS7PR12MB8290.namprd12.prod.outlook.com (2603:10b6:8:d8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Mon, 25 Aug
 2025 11:31:57 +0000
Received: from PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::a929:e8eb:ef22:6350]) by PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::a929:e8eb:ef22:6350%6]) with mapi id 15.20.9052.019; Mon, 25 Aug 2025
 11:31:57 +0000
Message-ID: <0f2992f6-3124-47db-9ab4-c09fe5e2fba5@amd.com>
Date: Mon, 25 Aug 2025 17:01:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/buddy: Separate clear and dirty free block
 trees
To: Matthew Auld <matthew.auld@intel.com>, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: alexander.deucher@amd.com
References: <20250821150641.2720-1-Arunpravin.PaneerSelvam@amd.com>
 <20250821150641.2720-2-Arunpravin.PaneerSelvam@amd.com>
 <feae67f7-288e-4783-a059-b48dfea6e4e1@intel.com>
Content-Language: en-US
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <feae67f7-288e-4783-a059-b48dfea6e4e1@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4P287CA0091.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:268::8) To PH8PR12MB7301.namprd12.prod.outlook.com
 (2603:10b6:510:222::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7301:EE_|DS7PR12MB8290:EE_
X-MS-Office365-Filtering-Correlation-Id: 1becf050-e760-4b43-b37e-08dde3caffa2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S0NNYXZidGpXS0prTkhJUFBObG5UZ2tUR1p3WHh6a3hIdGFHaFR2bjErZmo1?=
 =?utf-8?B?YlZoNWxEZmZrM1VTbktWaXJMUHptNE9LS1c5eGhYUGJQWWUrRkI2Q2Z6c3FF?=
 =?utf-8?B?K3pTUVhFTG41bU1mSzVHenhBNmQrdkJIZkd1MzBlY3A5T1FySis4TEhqVStQ?=
 =?utf-8?B?K0NJRWhPM0hRM2R5aTJqVml2VjFIbDdjWEE0aGdMd1d0WVJLaFpzbmhVL2hJ?=
 =?utf-8?B?QkwzWkQ0RFZyMkt1azFIOEg4OFdWZlIrdWxEa25FQ2dXL3B0Ym9WTkNjRHNu?=
 =?utf-8?B?SUxJa1dINWdIdDAvNWxYU3gxaVlxNktHS3hsN2FoZGN2RkJxMlJOaGNqc1lC?=
 =?utf-8?B?dEVFQ3pnVEUyTnVmSExCME83NmJ3NU5KdUlzMEdwalVrVEtKNFdmUkpJM3Q4?=
 =?utf-8?B?SUxQTXF1OVBnQWk3SnVMMktBTDJhR3NkNmUwOHAxWWNmaVRBMXVqeSt5MDFM?=
 =?utf-8?B?NXhpVm8xUXZiSGhBbGdkRVFXSEpCZ2lBUVJjWXhEVGFiVTJlaUp6MjR4VVRJ?=
 =?utf-8?B?bkR5aFRDSy9WaktMRFppV05lNzFCVW83NitYMk5NNE1NNm5aV05oYS9VRURa?=
 =?utf-8?B?WXJmVHJJTnBDNTU3aWJPMy9zSHJHSzAyTER4ODJKdTZ0RWNVQ2svc0JRV1ZS?=
 =?utf-8?B?VjAwOUtYelgwc0FDV2NvUHdhQms3dHcrS2U5OFFrOGkwQVlsdlMvMll5dEZG?=
 =?utf-8?B?alpqV2QyMi9WeFNRNWlDL3VKaTVwNDJpUzIzU2dQNWNNT0tXYndNTjhTbDcy?=
 =?utf-8?B?Wk9EMVFTTmJtT2RUTGNPR2E4eUM4cEgxRlZmRU5lWnZpZURIcmg1TTA3Q1F4?=
 =?utf-8?B?NzhRRy9NdmRxVlBSRk10YllIeXBRR3hYWkJhU1F3SlVCYlBqNjVwMWZEZGxF?=
 =?utf-8?B?UGFndXREZytIOE5VenRMZ1RPblpMVVZvanp2aGFYK05nK0o0aStKTFI4RDM4?=
 =?utf-8?B?Yjhva2FMYURrWnQyTXFqcGZ6dEsxUGtFWVRWdkxVUlZSSjdPR1ZYUjhWNFcx?=
 =?utf-8?B?TWRnWnpwQkE0K0ZzR0JMdUtIblFLVER1UTFmRmo2Z3ZpcWNFc1VMWjVvMzNh?=
 =?utf-8?B?ZFgrNDBua051bSt6dVdvaGpUcGhnUTNwbGltU1VrMldKYnR0YTAvWTRNREVN?=
 =?utf-8?B?dVZrQWo5NW1xK1ZEbnBWOHo4YktKRzNRR0JUSi9qcWszR3NZRnRhN09aeDJj?=
 =?utf-8?B?TXlKSENwQkxpeVBKd2JmMzB2WkxIcjNMM0hOd3lMcHB4Q0NhVzcwSTVXUFBL?=
 =?utf-8?B?NStXUUxkdWR4N3M3Q3laM09RalVyaG11ank4U1ZBV3I5Y2pOU3dxKzlxakNi?=
 =?utf-8?B?UnNJR3hBQU55enRZbHFIMWh4Z25SMURtSXprVVVqa3kyOXM3OERwckYrQTdt?=
 =?utf-8?B?M3hnWWlCRFVVRlA2NkJObjgzZjhmNnNSaHJ5M0IzRFd5WTgwMExTUWVacHpJ?=
 =?utf-8?B?YVl0UU1raGFKMXlGMEJsWFcxSWZLMVkxeWhpWTcrZklKZ1lYd1VPNlVIQ1hS?=
 =?utf-8?B?WjBuUG9Ib0dBekxKaGJ5UnI1T1pjaGxFaEkrRkRjTmZQZzhLbjNiOTZKN293?=
 =?utf-8?B?UlFPb2tMY1RmNDhKclVEN0hWbnJTdmpleHhWTnVMeTNCTG1NVms1dEJUMGp0?=
 =?utf-8?B?R1FNeXQ1VmFKZ3F0dEZCeXdxeGJmQXo0TllvY0g2cDB4L3lhc2tBZ25YR3dB?=
 =?utf-8?B?TE5FQ0g0RzBrU3l3VGFmVlhrc3MvN293ZzE1LzlNWDAxN3JnV0R6M0VWdk0y?=
 =?utf-8?B?MUxiZXh5bXhHWmpzbFdFb2ZtNWpDUCt6aVpWV0ZYSUZtdTFBV0M5ZU1Vcnl5?=
 =?utf-8?Q?2zFOix3SrnECkgft48rQZKN1gUVVKqrgjtAIY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7301.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UkFhS1NhLy9lVHdaMEFGUDF0bUJwUC91RS9FRk0yY0tqbTUyMjYySUh1aWt1?=
 =?utf-8?B?UEpIYi80VDB3SmdXY1dOTm5yZXFWNExhY1U3WWE2R3h6dS91dlpDYTVETE5J?=
 =?utf-8?B?bUxYU1ppNTI0MStwNDJSZng1TGJvQmpxZWdCWjFxYXordTRMMmJ1eDVwdmxB?=
 =?utf-8?B?WlNKQ2x2YmdWZHo4M3QzWkFWSCtHaVgveG00dktWYm8rbUlyRUlPbDFvMFNI?=
 =?utf-8?B?TnpzVC96dzYzeDE5WmFVSlZLRWJneTNsQlBuWlhnVEsxTXZvM3JPOTVtRlho?=
 =?utf-8?B?MGVjUGJ5TkYwQkhQV0U4SjNiTThEY054TERwSng4aXgwY3N0T0xtTW5Rb2hH?=
 =?utf-8?B?KzVaMlFWUHl4U2ovWWwzMldLekI4MGFObzEzSkw3SG1WUktaOFIvNTV5R0FQ?=
 =?utf-8?B?Mkl2M2lCcGpwRWtOUzE5R2Uzc0FIcnZuRkhLZEJRTStNY0MwdXI4K1RVUWlj?=
 =?utf-8?B?UXlwd0FqWjZPNDk3L1l1WVFYL1VDY3RlVHRBTm9zTEJMNnBpNkFuVTVQR2Vs?=
 =?utf-8?B?bnZkVkhUYkxsNEpaRWJtTGdONm1vcTNqNlh6T0cwVzV4ak1mY3p6dmp0RDhG?=
 =?utf-8?B?OSs2Q0EwU0Z0NTFIT3ZIOVdLeWUzbXpDc1RrMnRXSTkzQ1M3SGQ4ZDBDQ05u?=
 =?utf-8?B?MHZzWWFKemxsaS9mZ0FQTzVNQ09qamFtN0NzSndacVg1T0pUN2pwNll5cXh1?=
 =?utf-8?B?NjBYT1c2VHBLQUNLcDc3VW9ETENtVWVyWUEzcW41UTREKzdyS01hbllUWkJo?=
 =?utf-8?B?UmlCc05tNHVlY2tSRnpiRVVJZlRzZmxlTTdQMnN1Zlk5djFieE05NGFSd2ZL?=
 =?utf-8?B?bXMrZ2J3eUY4OHMwN0FYMVI0TW5iS3hRK0dMNzMvamNZSHI5TzBvSTJJRE1L?=
 =?utf-8?B?cFY4UlRJRjVJclRQaCt1SnpJMi9uMFlhd2FzZEJRVXFJTXZJKzVUZEwwLzV2?=
 =?utf-8?B?Uk51ZXA3a2JGM0Zha0tKSXJ5Q0xlKzNENEVUdFoyR3FRNWJ2SUJiNW9WemtP?=
 =?utf-8?B?V3RHNEYzb0g4SmNBVmxYNC9ISUtaTkRLQkVlQXc4Q1lUM3ZtL0FOOFZkTUpT?=
 =?utf-8?B?cTVlYXY3N2hweGhBL055ZVRCTE5XTnB4dWJPakxvRSs5Y3RaU1pSWXRLQzFL?=
 =?utf-8?B?cEdNdi9xMXFnY25ISUh3Q21kOTRVd3duZkpiR0JxQ1hwcGF3bzhOQzRVODg3?=
 =?utf-8?B?VTV0c1BlcFRwUlJPdGh1VkVkNEE2MzIxeUJMYUt5VkVsUTk5THZ4UmlIaVJv?=
 =?utf-8?B?eXZMVHF1c1YwSWp2UDlxNldrcTRBNW5Fbi8rRkd6S2trclpqckxSL1RFQi96?=
 =?utf-8?B?ekxpbys2cXlGbzlXYUVBNGEzbiswUzJuUXRsQUVBejh1cnZYaW4vTHN6VFhO?=
 =?utf-8?B?cGRNYzExeUFidFZZRTkrNDlPeXprNWNRQjhKQUNqNnJXTm0rVmM1d1paN3Y2?=
 =?utf-8?B?bE50dmZGYkRFTGFlbkY0a0d0TE1DeHdUbFZrYVFudUlTNFBMaFFnNjFsRmZC?=
 =?utf-8?B?ZE0yYU8ycURrcmVKcFZFeUlqS2t2NzExV0FzZDVGeTdkWTVFYlBwM0cwV2V5?=
 =?utf-8?B?UVVoWk9LT05tYVpaZUVsUzd5WGpSY21LZG4zZmFaR1ZiSHpNVlZRbmo2NFVT?=
 =?utf-8?B?c3VRRHlvZlpnVDVpaTRjNmpDaDVSRFBhelF5V3VTcTJKQnZ3RkJhZFN6SUZv?=
 =?utf-8?B?M1UwQThyZUFDbWtJWXFaM3hMMlJtY3dmdVJwMlY1bm1YcDFKbEhHNGRBTlha?=
 =?utf-8?B?YzNKUDRaYUUyWFdEbk41ckxHc0Y5bjF0M0VEdmQ4dXF2c2FlSTNybFNRQlhL?=
 =?utf-8?B?SExEYm1tZG9NRk1QZEVSSFA1R3FOSC9TY290aVFCa2huSHlycy82cDJyN2dJ?=
 =?utf-8?B?ZVRVSUt5bm9TUStiYnRmS0YyUDQ1T01nYjNUY3ZNNFMvd296cEJteEk1SnlR?=
 =?utf-8?B?MFdVU1ozSXF5WmdVamhFWG14b3hNM0htbHE1eTRlUDNwWEppOW1FS2J0aXJW?=
 =?utf-8?B?N2NJMXlRMjB6Nm5IUEp4MVR1QmRKeEgvVkFXUDByTjZycXhMd2JPcmhHeEtG?=
 =?utf-8?B?N3JURWh5MXhRV0IzWVhuUi96djlzR1VyQjE2eUN6UVFEcUUzYjl1Rkl2ZnBO?=
 =?utf-8?Q?mLwyGbxwRrZXw5wAwXKkux5qa?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1becf050-e760-4b43-b37e-08dde3caffa2
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7301.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2025 11:31:57.2470 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IXg0aWs06TqQkWuWzYOW3SAAxCagcvXgRfpu7cgatag00Xlh867uSaw+jDTk7i0xIBu9LSzf9Sn7L5T5w/i3gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8290
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


On 8/22/2025 5:32 PM, Matthew Auld wrote:
> On 21/08/2025 16:06, Arunpravin Paneer Selvam wrote:
>> Maintain two separate RB trees per order - one for clear (zeroed) blocks
>> and another for dirty (uncleared) blocks. This separation improves
>> code clarity and makes it more obvious which tree is being searched
>> during allocation. It also improves scalability and efficiency when
>> searching for a specific type of block, avoiding unnecessary checks
>> and making the allocator more predictable under fragmentation.
>>
>> The changes have been validated using the existing drm_buddy_test
>> KUnit test cases, along with selected graphics workloads,
>> to ensure correctness and avoid regressions.
>>
>> v2: Missed adding the suggested-by tag. Added it in v2.
>> v3(Matthew):
>>    - Remove the double underscores from the internal functions.
>>    - Rename the internal functions to have less generic names.
>>    - Fix the error handling code.
>>    - Pass tree argument for the tree macro.
>>    - Use the existing dirty/free bit instead of new tree field.
>>    - Make free_trees[] instead of clear_tree and dirty_tree for
>>      more cleaner approach.
>>
>> Signed-off-by: Arunpravin Paneer Selvam 
>> <Arunpravin.PaneerSelvam@amd.com>
>> Suggested-by: Matthew Auld <matthew.auld@intel.com>
>> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4260
>> ---
>>   drivers/gpu/drm/drm_buddy.c | 342 ++++++++++++++++++++++--------------
>>   include/drm/drm_buddy.h     |   8 +-
>>   2 files changed, 215 insertions(+), 135 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>> index 92226a46cc2c..f57c384889a9 100644
>> --- a/drivers/gpu/drm/drm_buddy.c
>> +++ b/drivers/gpu/drm/drm_buddy.c
>> @@ -14,6 +14,9 @@
>>     static struct kmem_cache *slab_blocks;
>>   +#define for_each_free_tree(tree) \
>> +    for ((tree) = CLEAR_TREE; (tree) < MAX_FREE_TREES; (tree)++)
>> +
>>   /*
>>    * for_each_rb_free_block() - iterate over an RB tree in order
>>    * @pos:    the struct type * to use as a loop cursor
>> @@ -78,22 +81,77 @@ static void drm_block_free(struct drm_buddy *mm,
>>       kmem_cache_free(slab_blocks, block);
>>   }
>>   +static inline struct rb_root *
>> +get_root(struct drm_buddy *mm,
>> +     unsigned int order,
>> +     enum free_tree tree)
>> +{
>> +    if (tree == CLEAR_TREE)
>> +        return &mm->free_trees[CLEAR_TREE][order];
>> +    else
>> +        return &mm->free_trees[DIRTY_TREE][order];
>
> I think we can replace this with something like:
>
> return &mm->free_trees[tree][order];
yes. we can replace with the above.
>
>> +}
>> +
>> +static inline enum free_tree
>> +get_tree_for_block(struct drm_buddy_block *block)
>> +{
>> +    return drm_buddy_block_is_clear(block) ? CLEAR_TREE : DIRTY_TREE;
>> +}
>> +
>> +static inline enum free_tree
>> +get_tree_for_flags(unsigned long flags)
>> +{
>> +    return (flags & DRM_BUDDY_CLEAR_ALLOCATION) ? CLEAR_TREE : 
>> DIRTY_TREE;
>> +}
>> +
>> +static inline struct drm_buddy_block *
>> +rbtree_get_free_block(struct rb_node *node)
>> +{
>> +    return node ? rb_entry(node, struct drm_buddy_block, rb) : NULL;
>> +}
>> +
>> +static inline struct drm_buddy_block *
>> +rbtree_prev_free_block(struct rb_node *node)
>> +{
>> +    return rbtree_get_free_block(rb_prev(node));
>> +}
>> +
>> +static inline struct drm_buddy_block *
>> +rbtree_first_free_block(struct rb_root *root)
>> +{
>> +    return rbtree_get_free_block(rb_first(root));
>> +}
>> +
>> +static inline struct drm_buddy_block *
>> +rbtree_last_free_block(struct rb_root *root)
>> +{
>> +    return rbtree_get_free_block(rb_last(root));
>> +}
>> +
>> +static inline bool rbtree_is_empty(struct rb_root *root)
>> +{
>> +    return RB_EMPTY_ROOT(root);
>> +}
>> +
>>   static void rbtree_insert(struct drm_buddy *mm,
>> -              struct drm_buddy_block *block)
>> +              struct drm_buddy_block *block,
>> +              enum free_tree tree)
>>   {
>> -    struct rb_root *root = 
>> &mm->free_tree[drm_buddy_block_order(block)];
>> -    struct rb_node **link = &root->rb_node;
>> -    struct rb_node *parent = NULL;
>> +    struct rb_node **link, *parent = NULL;
>>       struct drm_buddy_block *node;
>> -    u64 offset;
>> +    struct rb_root *root;
>> +    unsigned int order;
>> +
>> +    order = drm_buddy_block_order(block);
>>   -    offset = drm_buddy_block_offset(block);
>> +    root = get_root(mm, order, tree);
>> +    link = &root->rb_node;
>>         while (*link) {
>>           parent = *link;
>> -        node = rb_entry(parent, struct drm_buddy_block, rb);
>> +        node = rbtree_get_free_block(parent);
>>   -        if (offset < drm_buddy_block_offset(node))
>> +        if (drm_buddy_block_offset(block) < 
>> drm_buddy_block_offset(node))
>>               link = &parent->rb_left;
>>           else
>>               link = &parent->rb_right;
>> @@ -106,27 +164,19 @@ static void rbtree_insert(struct drm_buddy *mm,
>>   static void rbtree_remove(struct drm_buddy *mm,
>>                 struct drm_buddy_block *block)
>>   {
>> +    unsigned int order = drm_buddy_block_order(block);
>> +    enum free_tree tree;
>>       struct rb_root *root;
>>   -    root = &mm->free_tree[drm_buddy_block_order(block)];
>> +    tree = drm_buddy_block_is_clear(block) ?
>> +           CLEAR_TREE : DIRTY_TREE;
>> +
>> +    root = get_root(mm, order, tree);
>>       rb_erase(&block->rb, root);
>>         RB_CLEAR_NODE(&block->rb);
>>   }
>>   -static inline struct drm_buddy_block *
>> -rbtree_last_entry(struct drm_buddy *mm, unsigned int order)
>> -{
>> -    struct rb_node *node = rb_last(&mm->free_tree[order]);
>> -
>> -    return node ? rb_entry(node, struct drm_buddy_block, rb) : NULL;
>> -}
>> -
>> -static bool rbtree_is_empty(struct drm_buddy *mm, unsigned int order)
>> -{
>> -    return RB_EMPTY_ROOT(&mm->free_tree[order]);
>> -}
>> -
>>   static void clear_reset(struct drm_buddy_block *block)
>>   {
>>       block->header &= ~DRM_BUDDY_HEADER_CLEAR;
>> @@ -149,10 +199,14 @@ static void mark_allocated(struct drm_buddy *mm,
>>   static void mark_free(struct drm_buddy *mm,
>>                 struct drm_buddy_block *block)
>>   {
>> +    enum free_tree tree;
>> +
>>       block->header &= ~DRM_BUDDY_HEADER_STATE;
>>       block->header |= DRM_BUDDY_FREE;
>>   -    rbtree_insert(mm, block);
>> +    tree = get_tree_for_block(block);
>> +
>> +    rbtree_insert(mm, block, tree);
>>   }
>>     static void mark_split(struct drm_buddy *mm,
>> @@ -238,6 +292,7 @@ static int __force_merge(struct drm_buddy *mm,
>>                u64 end,
>>                unsigned int min_order)
>>   {
>> +    enum free_tree tree;
>>       unsigned int order;
>>       int i;
>>   @@ -247,50 +302,49 @@ static int __force_merge(struct drm_buddy *mm,
>>       if (min_order > mm->max_order)
>>           return -EINVAL;
>>   -    for (i = min_order - 1; i >= 0; i--) {
>> -        struct drm_buddy_block *block, *prev_block, *first_block;
>> -
>> -        first_block = rb_entry(rb_first(&mm->free_tree[i]), struct 
>> drm_buddy_block, rb);
>> +    for_each_free_tree(tree) {
>> +        for (i = min_order - 1; i >= 0; i--) {
>> +            struct rb_root *root = get_root(mm, i, tree);
>> +            struct drm_buddy_block *block, *prev_block;
>>   -        for_each_rb_free_block_reverse_safe(block, prev_block, 
>> &mm->free_tree[i], rb) {
>> -            struct drm_buddy_block *buddy;
>> -            u64 block_start, block_end;
>> +            for_each_rb_free_block_reverse_safe(block, prev_block, 
>> root, rb) {
>> +                struct drm_buddy_block *buddy;
>> +                u64 block_start, block_end;
>>   -            if (!block->parent)
>> -                continue;
>> +                if (!block->parent)
>> +                    continue;
>>   -            block_start = drm_buddy_block_offset(block);
>> -            block_end = block_start + drm_buddy_block_size(mm, 
>> block) - 1;
>> +                block_start = drm_buddy_block_offset(block);
>> +                block_end = block_start + drm_buddy_block_size(mm, 
>> block) - 1;
>>   -            if (!contains(start, end, block_start, block_end))
>> -                continue;
>> +                if (!contains(start, end, block_start, block_end))
>> +                    continue;
>>   -            buddy = __get_buddy(block);
>> -            if (!drm_buddy_block_is_free(buddy))
>> -                continue;
>> +                buddy = __get_buddy(block);
>> +                if (!drm_buddy_block_is_free(buddy))
>> +                    continue;
>>   -            WARN_ON(drm_buddy_block_is_clear(block) ==
>> -                drm_buddy_block_is_clear(buddy));
>> +                WARN_ON(drm_buddy_block_is_clear(block) ==
>> +                    drm_buddy_block_is_clear(buddy));
>>   -            /*
>> -             * If the prev block is same as buddy, don't access the
>> -             * block in the next iteration as we would free the
>> -             * buddy block as part of the free function.
>> -             */
>> -            if (prev_block && prev_block == buddy) {
>> -                if (prev_block != first_block)
>> -                    prev_block = rb_entry(rb_prev(&prev_block->rb),
>> -                                  struct drm_buddy_block,
>> -                                  rb);
>> -            }
>> +                /*
>> +                 * If the prev block is same as buddy, don't access the
>> +                 * block in the next iteration as we would free the
>> +                 * buddy block as part of the free function.
>> +                 */
>> +                if (prev_block && prev_block == buddy) {
>> +                    if (prev_block != rbtree_first_free_block(root))
>> +                        prev_block = 
>> rbtree_prev_free_block(&prev_block->rb);
>> +                }
>>   -            rbtree_remove(mm, block);
>> -            if (drm_buddy_block_is_clear(block))
>> -                mm->clear_avail -= drm_buddy_block_size(mm, block);
>> +                rbtree_remove(mm, block);
>> +                if (drm_buddy_block_is_clear(block))
>> +                    mm->clear_avail -= drm_buddy_block_size(mm, block);
>>   -            order = __drm_buddy_free(mm, block, true);
>> -            if (order >= min_order)
>> -                return 0;
>> +                order = __drm_buddy_free(mm, block, true);
>> +                if (order >= min_order)
>> +                    return 0;
>> +            }
>>           }
>>       }
>>   @@ -311,7 +365,7 @@ static int __force_merge(struct drm_buddy *mm,
>>    */
>>   int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size)
>>   {
>> -    unsigned int i;
>> +    unsigned int i, j;
>>       u64 offset;
>>         if (size < chunk_size)
>> @@ -333,14 +387,16 @@ int drm_buddy_init(struct drm_buddy *mm, u64 
>> size, u64 chunk_size)
>>         BUG_ON(mm->max_order > DRM_BUDDY_MAX_ORDER);
>>   -    mm->free_tree = kmalloc_array(mm->max_order + 1,
>> -                      sizeof(struct rb_root),
>> -                      GFP_KERNEL);
>> -    if (!mm->free_tree)
>> -        return -ENOMEM;
>> +    for (i = 0; i < MAX_FREE_TREES; i++) {
>> +        mm->free_trees[i] = kmalloc_array(mm->max_order + 1,
>> +                          sizeof(struct rb_root),
>> +                          GFP_KERNEL);
>> +        if (!mm->free_trees[i])
>> +            goto out_free_tree;
>>   -    for (i = 0; i <= mm->max_order; ++i)
>> -        mm->free_tree[i] = RB_ROOT;
>> +        for (j = 0; j <= mm->max_order; ++j)
>> +            mm->free_trees[i][j] = RB_ROOT;
>> +    }
>>         mm->n_roots = hweight64(size);
>>   @@ -388,7 +444,8 @@ int drm_buddy_init(struct drm_buddy *mm, u64 
>> size, u64 chunk_size)
>>           drm_block_free(mm, mm->roots[i]);
>>       kfree(mm->roots);
>>   out_free_tree:
>> -    kfree(mm->free_tree);
>> +    while (i--)
>> +        kfree(mm->free_trees[i]);
>>       return -ENOMEM;
>>   }
>>   EXPORT_SYMBOL(drm_buddy_init);
>> @@ -424,8 +481,9 @@ void drm_buddy_fini(struct drm_buddy *mm)
>>         WARN_ON(mm->avail != mm->size);
>>   +    for (i = 0; i < MAX_FREE_TREES; i++)
>> +        kfree(mm->free_trees[i]);
>>       kfree(mm->roots);
>> -    kfree(mm->free_tree);
>>   }
>>   EXPORT_SYMBOL(drm_buddy_fini);
>>   @@ -449,15 +507,15 @@ static int split_block(struct drm_buddy *mm,
>>           return -ENOMEM;
>>       }
>>   -    mark_free(mm, block->left);
>> -    mark_free(mm, block->right);
>> -
>>       if (drm_buddy_block_is_clear(block)) {
>>           mark_cleared(block->left);
>>           mark_cleared(block->right);
>>           clear_reset(block);
>>       }
>>   +    mark_free(mm, block->left);
>> +    mark_free(mm, block->right);
>> +
>>       mark_split(mm, block);
>>         return 0;
>> @@ -491,6 +549,7 @@ EXPORT_SYMBOL(drm_get_buddy);
>>    */
>>   void drm_buddy_reset_clear(struct drm_buddy *mm, bool is_clear)
>>   {
>> +    enum free_tree src_tree, dst_tree;
>>       u64 root_size, size, start;
>>       unsigned int order;
>>       int i;
>> @@ -505,19 +564,24 @@ void drm_buddy_reset_clear(struct drm_buddy 
>> *mm, bool is_clear)
>>           size -= root_size;
>>       }
>>   +    src_tree = is_clear ? DIRTY_TREE : CLEAR_TREE;
>> +    dst_tree = is_clear ? CLEAR_TREE : DIRTY_TREE;
>> +
>>       for (i = 0; i <= mm->max_order; ++i) {
>> +        struct rb_root *root = get_root(mm, order, src_tree);
>>           struct drm_buddy_block *block;
>>   -        for_each_rb_free_block_reverse(block, &mm->free_tree[i], 
>> rb) {
>> -            if (is_clear != drm_buddy_block_is_clear(block)) {
>> -                if (is_clear) {
>> -                    mark_cleared(block);
>> -                    mm->clear_avail += drm_buddy_block_size(mm, block);
>> -                } else {
>> -                    clear_reset(block);
>> -                    mm->clear_avail -= drm_buddy_block_size(mm, block);
>> -                }
>> +        for_each_rb_free_block_reverse(block, root, rb) {
>> +            rbtree_remove(mm, block);
>> +            if (is_clear) {
>> +                mark_cleared(block);
>> +                mm->clear_avail += drm_buddy_block_size(mm, block);
>> +            } else {
>> +                clear_reset(block);
>> +                mm->clear_avail -= drm_buddy_block_size(mm, block);
>>               }
>> +
>> +            rbtree_insert(mm, block, dst_tree);
>>           }
>>       }
>>   }
>> @@ -707,26 +771,22 @@ __drm_buddy_alloc_range_bias(struct drm_buddy *mm,
>>   }
>>     static struct drm_buddy_block *
>> -get_maxblock(struct drm_buddy *mm, unsigned int order,
>> -         unsigned long flags)
>> +get_maxblock(struct drm_buddy *mm,
>> +         unsigned int order,
>> +         enum free_tree tree)
>>   {
>>       struct drm_buddy_block *max_block = NULL, *block = NULL;
>> +    struct rb_root *root;
>>       unsigned int i;
>>         for (i = order; i <= mm->max_order; ++i) {
>> -        struct drm_buddy_block *tmp_block;
>> -
>> -        for_each_rb_free_block_reverse(tmp_block, &mm->free_tree[i], 
>> rb) {
>> -            if (block_incompatible(tmp_block, flags))
>> +        root = get_root(mm, i, tree);
>> +        if (!rbtree_is_empty(root)) {
>> +            block = rbtree_last_free_block(root);
>> +            if (!block)
>>                   continue;
>> -
>> -            block = tmp_block;
>> -            break;
>>           }
>>   -        if (!block)
>> -            continue;
>> -
>>           if (!max_block) {
>>               max_block = block;
>>               continue;
>> @@ -747,36 +807,38 @@ alloc_from_freetree(struct drm_buddy *mm,
>>               unsigned long flags)
>>   {
>>       struct drm_buddy_block *block = NULL;
>> +    struct rb_root *root;
>> +    enum free_tree tree;
>>       unsigned int tmp;
>>       int err;
>>   +    tree = get_tree_for_flags(flags);
>> +
>>       if (flags & DRM_BUDDY_TOPDOWN_ALLOCATION) {
>> -        block = get_maxblock(mm, order, flags);
>> +        block = get_maxblock(mm, order, tree);
>>           if (block)
>>               /* Store the obtained block order */
>>               tmp = drm_buddy_block_order(block);
>>       } else {
>>           for (tmp = order; tmp <= mm->max_order; ++tmp) {
>> -            struct drm_buddy_block *tmp_block;
>> -
>> -            for_each_rb_free_block_reverse(tmp_block, 
>> &mm->free_tree[tmp], rb) {
>> -                if (block_incompatible(tmp_block, flags))
>> -                    continue;
>> -
>> -                block = tmp_block;
>> -                break;
>> +            /* Get RB tree root for this order and tree */
>> +            root = get_root(mm, tmp, tree);
>> +            if (!rbtree_is_empty(root)) {
>
> Do we need this check? last_free_block should just return NULL? Or if 
> this is somehow a cheaper check, maybe we should move it into the 
> helper instead?
Not required. last_free_block will return NULL. I will remove this check.
>
>> +                block = rbtree_last_free_block(root);
>> +                if (block)
>> +                    break;
>>               }
>> -
>> -            if (block)
>> -                break;
>>           }
>>       }
>>         if (!block) {
>> -        /* Fallback method */
>> +        /* Try allocating from the other tree */
>> +        tree = (tree == CLEAR_TREE) ? DIRTY_TREE : CLEAR_TREE;
>> +
>>           for (tmp = order; tmp <= mm->max_order; ++tmp) {
>> -            if (!rbtree_is_empty(mm, tmp)) {
>> -                block = rbtree_last_entry(mm, tmp);
>> +            root = get_root(mm, tmp, tree);
>> +            if (!rbtree_is_empty(root)) {
>
> Here also.
>
>> +                block = rbtree_last_free_block(root);
>>                   if (block)
>>                       break;
>>               }
>> @@ -923,6 +985,7 @@ static int __alloc_contig_try_harder(struct 
>> drm_buddy *mm,
>>       u64 rhs_offset, lhs_offset, lhs_size, filled;
>>       struct drm_buddy_block *block;
>>       LIST_HEAD(blocks_lhs);
>> +    enum free_tree tree;
>>       unsigned long pages;
>>       unsigned int order;
>>       u64 modify_size;
>> @@ -934,34 +997,39 @@ static int __alloc_contig_try_harder(struct 
>> drm_buddy *mm,
>>       if (order == 0)
>>           return -ENOSPC;
>>   -    if (rbtree_is_empty(mm, order))
>> +    if (rbtree_is_empty(get_root(mm, order, CLEAR_TREE)) &&
>> +        rbtree_is_empty(get_root(mm, order, DIRTY_TREE)))
>>           return -ENOSPC;
>>   -    for_each_rb_free_block_reverse(block, &mm->free_tree[order], 
>> rb) {
>> -        /* Allocate blocks traversing RHS */
>> -        rhs_offset = drm_buddy_block_offset(block);
>> -        err =  __drm_buddy_alloc_range(mm, rhs_offset, size,
>> -                           &filled, blocks);
>> -        if (!err || err != -ENOSPC)
>> -            return err;
>> -
>> -        lhs_size = max((size - filled), min_block_size);
>> -        if (!IS_ALIGNED(lhs_size, min_block_size))
>> -            lhs_size = round_up(lhs_size, min_block_size);
>> -
>> -        /* Allocate blocks traversing LHS */
>> -        lhs_offset = drm_buddy_block_offset(block) - lhs_size;
>> -        err =  __drm_buddy_alloc_range(mm, lhs_offset, lhs_size,
>> -                           NULL, &blocks_lhs);
>> -        if (!err) {
>> -            list_splice(&blocks_lhs, blocks);
>> -            return 0;
>> -        } else if (err != -ENOSPC) {
>> +    for_each_free_tree(tree) {
>> +        struct rb_root *root = get_root(mm, order, tree);
>> +
>> +        for_each_rb_free_block_reverse(block, root, rb) {
>> +            /* Allocate blocks traversing RHS */
>> +            rhs_offset = drm_buddy_block_offset(block);
>> +            err =  __drm_buddy_alloc_range(mm, rhs_offset, size,
>> +                               &filled, blocks);
>> +            if (!err || err != -ENOSPC)
>> +                return err;
>> +
>> +            lhs_size = max((size - filled), min_block_size);
>> +            if (!IS_ALIGNED(lhs_size, min_block_size))
>> +                lhs_size = round_up(lhs_size, min_block_size);
>> +
>> +            /* Allocate blocks traversing LHS */
>> +            lhs_offset = drm_buddy_block_offset(block) - lhs_size;
>> +            err =  __drm_buddy_alloc_range(mm, lhs_offset, lhs_size,
>> +                               NULL, &blocks_lhs);
>> +            if (!err) {
>> +                list_splice(&blocks_lhs, blocks);
>> +                return 0;
>> +            } else if (err != -ENOSPC) {
>> +                drm_buddy_free_list_internal(mm, blocks);
>> +                return err;
>> +            }
>> +            /* Free blocks for the next iteration */
>>               drm_buddy_free_list_internal(mm, blocks);
>> -            return err;
>>           }
>> -        /* Free blocks for the next iteration */
>> -        drm_buddy_free_list_internal(mm, blocks);
>>       }
>>         return -ENOSPC;
>> @@ -1266,6 +1334,7 @@ EXPORT_SYMBOL(drm_buddy_block_print);
>>    */
>>   void drm_buddy_print(struct drm_buddy *mm, struct drm_printer *p)
>>   {
>> +    enum free_tree tree;
>>       int order;
>>         drm_printf(p, "chunk_size: %lluKiB, total: %lluMiB, free: 
>> %lluMiB, clear_free: %lluMiB\n",
>> @@ -1273,11 +1342,16 @@ void drm_buddy_print(struct drm_buddy *mm, 
>> struct drm_printer *p)
>>         for (order = mm->max_order; order >= 0; order--) {
>>           struct drm_buddy_block *block;
>> +        struct rb_root *root;
>>           u64 count = 0, free;
>>   -        for_each_rb_free_block(block, &mm->free_tree[order], rb) {
>> -            BUG_ON(!drm_buddy_block_is_free(block));
>> -            count++;
>> +        for_each_free_tree(tree) {
>> +            root = get_root(mm, order, tree);
>
> Hmm, actually maybe this helper should just give the root (or both)? 
> Seems to be what all users want anyway?

Most of the time, we just need to root and the functionality determines 
the tree (for example : rbtree_insert() or rbtree_remove()).

May be we can remove the get_root() and use &mm->free_trees[tree][order] 
directly in all the places ?

Regards,

Arun.

>
>> +
>> +            for_each_rb_free_block(block, root, rb) {
>> +                BUG_ON(!drm_buddy_block_is_free(block));
>> +                count++;
>> +            }
>>           }
>>             drm_printf(p, "order-%2d ", order);
>> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
>> index 091823592034..2fc1cc7b78bf 100644
>> --- a/include/drm/drm_buddy.h
>> +++ b/include/drm/drm_buddy.h
>> @@ -14,6 +14,12 @@
>>     #include <drm/drm_print.h>
>>   +enum free_tree {
>> +    CLEAR_TREE = 0,
>> +    DIRTY_TREE,
>> +    MAX_FREE_TREES,
>> +};
>> +
>>   #define range_overflows(start, size, max) ({ \
>>       typeof(start) start__ = (start); \
>>       typeof(size) size__ = (size); \
>> @@ -73,7 +79,7 @@ struct drm_buddy_block {
>>    */
>>   struct drm_buddy {
>>       /* Maintain a free list for each order. */
>> -    struct rb_root *free_tree;
>> +    struct rb_root *free_trees[MAX_FREE_TREES];
>>         /*
>>        * Maintain explicit binary tree(s) to track the allocation of the
>

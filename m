Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B80AFA9A3
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 04:28:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4245D10E3EA;
	Mon,  7 Jul 2025 02:28:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yR2z0hMC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2058.outbound.protection.outlook.com [40.107.95.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83B2510E154;
 Mon,  7 Jul 2025 02:28:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tuhgcr3yvrXc/91H6hKl3GFb4g++vNJjpS/GIUIo/82NPAM9rYycvsndHYOHgrWynqVNV/z6jGciq9sZl/H/c8I0b1hTURsCoszdzShu5qa5m2VNqVfzZOAYDzHzMyFCE1+s3pgTnvbAPcwRUk5BhQjWJmtrK2DCNEhDWrWSaluedOruf5K9x3MNG4gII7GmKi6RYYQxvZOWTWXwoik9WV65CWjAy3n4UC0hFi3rKWzfnRj7ZgNL/BiR2NxahS+og/4wp9KQrfiVc0V+MgIXvV5DrdcOUFZofH+IThqbAB4N/iUkPRo41SGdFJKL9qCR47SqYavXuzTY/fUfEUJYsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qDE8LFKVAfKfPAqWBQc3X/4uzMOgnwRtrk+os29f62Q=;
 b=L1KEAJHS5SdqEUUHH4lo6Ex4FcX9mxF4qwm1/6FTnieHyIVBcuPTIdlQOgaq74asOgngy0qS/zEO25JNLCs9AAtQq57NBXDv7Pwqp5sMCuIxmg7SGuCskRju7UaymTnIFLN5tXijlIleSpRWXhqq3NLP6cHnGuvAlboCgiojM90NsmBH20MrHOcWsX9jQio6IS1a7NLD/rTi/g6rngyJ7VhQ/v+KrCmW1Qrb2TfBvDGFGsuh6Ne1fze4t45r6ynpyIDwAGzRG6sfQLzxxkTySSXOAiNZ90/bvEeZ4Qhv205xb6fEvNNbIEHlyXnvy8cKql9GKQCVBVqXXx8YuIoKgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qDE8LFKVAfKfPAqWBQc3X/4uzMOgnwRtrk+os29f62Q=;
 b=yR2z0hMCZVbCopmHHKNVjCwsilL6PLVEgPEN5LiNUuR1aSio2UtpmaoSn/l0TKBKBnZnDyC+NPRBP9iTWR+e7nVfpkISehxGYnUW4nrlEcqLTUnY67hHqIHCJoMMvFEz2t5ed5WnMmV3leU3752aqTtshzf8E7j8wTkKXKX3BOw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS0PR12MB7804.namprd12.prod.outlook.com (2603:10b6:8:142::5) by
 IA1PR12MB8496.namprd12.prod.outlook.com (2603:10b6:208:446::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Mon, 7 Jul
 2025 02:28:40 +0000
Received: from DS0PR12MB7804.namprd12.prod.outlook.com
 ([fe80::8327:d71a:ce21:a290]) by DS0PR12MB7804.namprd12.prod.outlook.com
 ([fe80::8327:d71a:ce21:a290%4]) with mapi id 15.20.8880.023; Mon, 7 Jul 2025
 02:28:40 +0000
Message-ID: <5f944f42-d631-4435-985f-c47944f770bd@amd.com>
Date: Mon, 7 Jul 2025 07:58:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] drm/amdgpu: do not resume device in thaw for
 normal hibernation
To: Mario Limonciello <mario.limonciello@amd.com>,
 Samuel Zhang <guoqing.zhang@amd.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, rafael@kernel.org, len.brown@intel.com,
 pavel@kernel.org, gregkh@linuxfoundation.org, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, ray.huang@amd.com,
 matthew.auld@intel.com, matthew.brost@intel.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de
Cc: victor.zhao@amd.com, haijun.chang@amd.com, Qing.Ma@amd.com,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20250704101233.347506-1-guoqing.zhang@amd.com>
 <20250704101233.347506-6-guoqing.zhang@amd.com>
 <c847783d-eb92-49aa-919c-447cbc34baed@amd.com>
Content-Language: en-US
From: "Lazar, Lijo" <lijo.lazar@amd.com>
In-Reply-To: <c847783d-eb92-49aa-919c-447cbc34baed@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0199.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e9::9) To DS0PR12MB7804.namprd12.prod.outlook.com
 (2603:10b6:8:142::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7804:EE_|IA1PR12MB8496:EE_
X-MS-Office365-Filtering-Correlation-Id: fe366193-8fcb-444b-2976-08ddbcfdfb65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|1800799024|366016|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MGp6cmVPcEQ3MG9PNERRenlkNVRnam9JcmdTaDZYSk96azBhSkdmMHdhaFVG?=
 =?utf-8?B?NGNhS3NHZFhwdU52VE1KNzh4aDZPWGhhTHhoNmlJcXlCdGJJYXd0ejFIZ0hl?=
 =?utf-8?B?a3BOeEdXYW5hVUsyRXY3UFRqWHUvOS91QmhpL1lXRHA5ZnRNOU1FeXpQUS9S?=
 =?utf-8?B?TXJpd1laaytJL0M4dTBraXRqSmpUTkdkZVB4Z0lLOXJOVGU2L3FITlB6VXli?=
 =?utf-8?B?aXkvUkN2Z2Z0QS9yeklaMnFDTElXMENsZ1J5WnlmQ0pzWFJaSGJhWDd4Umd4?=
 =?utf-8?B?aS90b0UvR3Bja2tmSExSZmR5R2lqS2VkSDYwelZ1QzU2MmkzTTJxdkE0VHZO?=
 =?utf-8?B?MUcwWlJFZTBqR3UrK2FBbEJrbm5IZHptNzEyM25uQ0psWUlGWGRCTURwaXJC?=
 =?utf-8?B?MVU2TEUvVGNaajI1ZUNLRE1yTU1aYUNneWR6eTVPZm1wVTJFTmc3MWQrdlI3?=
 =?utf-8?B?V3EyZkl6ZStscXhua05POERLL0R2bmI0b1ZWYWZVTVFIQlZ0WlhhWm5hSU9n?=
 =?utf-8?B?VHFNY1BqcnJuZnNNdERtNnRxemNPZC83anJqZXlTWEpCdFUyQys3ZUVPZEht?=
 =?utf-8?B?V0EzbTFUcCt2bG9PQStvSDBkSjYveHRNWGpsaTVxOGpQTVB5VDIzb1dzLzRN?=
 =?utf-8?B?aE04L0JxMFQyc0hLcEZlQnRsQUtHNkZxZE13OGxHQnpnM2lHdXZkMUU2Qmxj?=
 =?utf-8?B?V3J2dUVBOHFCTUdZbkMrVklYRkd0azJPWFV6Q3NkN2dTM1A1NEdONXZhK0lT?=
 =?utf-8?B?NUVqenFOMys2a3RLVjV6THBnN3oxK2VkVG44YXEyRHN5RjBSMnFiYXpJVGRy?=
 =?utf-8?B?dGp5Vnk5bDR0L3M5YjlMdTh2eHBybXE5OXl5YlkxdjBYN1ZxSlExRVJoZ2tS?=
 =?utf-8?B?RDZ4V0lVTU1PS2ZSZ1NzTEM3Sjk4cHNxdkRLZ1gyaktYVGNRM09iL2NmNnJR?=
 =?utf-8?B?U1g4UjZHMEd5a3RiWE9SM0hQUFVzbE44b29kQ2pReDEraVZjZ3JhL25MeWx5?=
 =?utf-8?B?SCtIQzFvTjc3NHFPUHVOak9lc0VhbUQvUGw2ZzF3STFEVkFaUWJjbW96ODM1?=
 =?utf-8?B?ekdOdlA2ZzNqK1g0SmxzOFFSUGtVMGw3Z09HYTFGeHYxTGMvWnFSYk1PK3Jy?=
 =?utf-8?B?UHkrNURlbDd2dTRqYTJqaVcvNkNjOTJHK2oxUWRSZW9VQTNBU2doRy92alNr?=
 =?utf-8?B?L3IzaGZxZExYUktDOEYvaVBneTdROG1mamhyNjZaTnZhcFZWb05FQXNyTWN3?=
 =?utf-8?B?TEExT3pvOWMwblVqRkE3NTViNmpWdGd5d0h2ZnNMTWZmakdYMkJxRjJxNUY3?=
 =?utf-8?B?YTFQVGFGWjRUUVlFdEJPVUJyUFgweWZseWtKZHJkUzFHVUhVUDBuS3RGN1JL?=
 =?utf-8?B?R1lOTmlMeitnbHpKYzJRK0pSVXZhNXBqcjdhVExRRmlUSjE3S1hFNHdEdXZH?=
 =?utf-8?B?OUhLZ2NnZ3ZmNHpDc0ZsSml0a2ZiU3JPNXhMeUo0bkthSFFKSXpsZUJiTy9G?=
 =?utf-8?B?alQ5cGk5amwxM081dWlFQU9ielkyd2k4MXJzcXZkRzFTakRUUU4wZXkrNmxD?=
 =?utf-8?B?Sjl2dysxaWE0R0xZMER2VThmdUZ1K2tOTytDNWRCQXRWV2hBU1RwN3JrNWhD?=
 =?utf-8?B?WGpFeUZqZXdUZUs4TGtZZFdRRnQrSDRwVFNSN3BFRG1nNXl0VGdRN2Z1RkJj?=
 =?utf-8?B?WkF3L002c3NjQlM2N3BmdXZIS3pSTXlGNkVsMnVmMmxUazFDOUlwZmZzWHhU?=
 =?utf-8?B?RHFiSGlmcjg0ckRBSmNpdFR0RlZTbG5KT0tKNnZJZkNpMVY2czJpK1NkYlR4?=
 =?utf-8?B?U2dITzVjcFc2d2Y5NlZ1Vzk1TXllQld3YngzYy9mYW5pUEM4K2tKL2pqQkQr?=
 =?utf-8?B?TFJldzRnVHBjL2srRzM5R2NYQkUzcEdxc21uWjlTTUdMNWNrMDJ1SVNmWXRV?=
 =?utf-8?B?bFk5K1ZaNFgxNjE0M3NYVE5QRThZTXRVY2pSRGoxMUlJUHIwR0tmOGpxenFT?=
 =?utf-8?B?Q01CWXRTQ1RBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7804.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(366016)(376014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TTd6dHhWV3dBOUhhV3VyRy9CU0NYUUdZTU1oWmVTcTJyZjgxTUM3aFFERTgw?=
 =?utf-8?B?empzaGFIa25iWVU3Z1AzcVp1dnJ2ZUtMSzc0b2hRb2J4eHNSTFVGdEpra09K?=
 =?utf-8?B?Qit2YXR5aWorbERyZ2RnTmx0Z3NLSVdhQTRqcFlDZzZTUHhSQWkvOFo3V1dE?=
 =?utf-8?B?SEw1djVjbGFXK1cwSHZYczJ3aFp5V0ZoYndUelNtT0F6aFMvblZ5VTJqTTFv?=
 =?utf-8?B?cit6M1o3bk9GYjNEMjZlMzBkbHQ1bGxENzUrcTV0ellGaW1PVnFQMHpGOE1S?=
 =?utf-8?B?Mi9oUEZCd0Y4MWFNT2JDeFRrSG9ETDYwdVlzbndDS1NRbDAyQ0JhMGRZSllQ?=
 =?utf-8?B?Sk1XNXpnMmtzV3BCU0g5NzkwOGpDYWxNK0ZsTkkxUWF0UzRvWjduejI1UGpI?=
 =?utf-8?B?V3E4aStKYTRGRThZUDlCemFhWVZSdGRIYTF5WUlOVkp1emtxREZjZG50dGl6?=
 =?utf-8?B?aThLVGI4Um9PU29VQTR5c2dGSkNnbldjeURiMUdmd0V1eThRVlBIYnQxeUw2?=
 =?utf-8?B?a3RkemVPc0dMbmw5eEJJYlFvUFZmQ2ZValpZS1VLTlQ5Wjd0UVQ0R1UrSjl1?=
 =?utf-8?B?SysrdlRLeUZWbkhqVjdYSFRJZ2M3OU50TlljcUp1VFNock53L2tJbnpjd1RD?=
 =?utf-8?B?ZG9XckZqNEFDWEkxMmFGYnZJdDBrdk9JT0tON0N0TjJ3THNlbTRCUSt5bWtz?=
 =?utf-8?B?dGdTd2dUZjVUVVB1MUNEZ2Vsai9YYlVKVldUQ0hvc3A3K1lDakVHQWtNMlA5?=
 =?utf-8?B?LzRwbDZKaytVbVI3WGNVaEtsRy9ibEpxb1pVNklRc0diTEZ2WjBxTkNyNm43?=
 =?utf-8?B?bVM5cTRXbFFEK0I0VmN2UWZHQW5wUy9DekRUb3NtRVBrMVR5THdaa3luL1ph?=
 =?utf-8?B?ODJIZ1NHbUp4OGxJYnRGSENSeXdvS09Hc2xodUY0YWY1SDRIMXZHQS9xQlpJ?=
 =?utf-8?B?YkkzbCtlci9jM0lpK1lVNFFONnFaeDZuTENTQjhyQmV2cmhVY2VlNzZpV1dy?=
 =?utf-8?B?N2g1S2E0QlNFVHdtVjA5ODhlbTNTM1VETGdlMGFEelVCdkRwaVpsRHdsUGY1?=
 =?utf-8?B?OURHdVlaNUd5Uk5SaVVYdzl3bzA5cEE0RFdwWWV4TmdWUDRHWHhVQVFxZi9V?=
 =?utf-8?B?YjhDbVl2WVdERG8vQis3aHBqVWtUcE1rcnU1UTJzYW13eklSVzE3blhhcnc1?=
 =?utf-8?B?RzIvaUVBWjNhc2FQdkVleE5rQU1CcExZblY5czB4QjJQQnBIRXJiUXY1bkFj?=
 =?utf-8?B?NHJ3bDBMNGxDYjl5TG12anlFd3dDUWhSaDRxUk1rbllCclFmb2NVSDFYb00x?=
 =?utf-8?B?OXBBcnRudisrSUpBT0I1czg0NUlZOHhsRXRqL3Uzelh2WjVkNnVxVEcrMDdG?=
 =?utf-8?B?STRkSzBrTXo1M2hzNkJCamdsYnFEcXRKQ2tXRFFqdThHSmZMN1NDdXlTUUJj?=
 =?utf-8?B?aVZMbS9udFZsVDgrY3ZwZ0JuaGI3anhMai93N2c1bUVUam9nUG8wRzh0N3U2?=
 =?utf-8?B?amladGE1WlNHQnlFcTh1dWsxdGZMTjN1WU10ODhDbXk0V2JvWWtlUmh1a09w?=
 =?utf-8?B?T1lBNFNUQi9KNkNTYzZsa3Y0RkJGN2V2UnJrU3lrbC9XcmFCRVhZU1hLbEpu?=
 =?utf-8?B?WjR5YXdNU0p2R3NXZXpLSWdERGFUL2ZRalkzNWFlRGlNRGhDTWFUdU52alhE?=
 =?utf-8?B?ejhJZHpMZ3NOcDljRE9YMDNUT0wwUVV4Sjg5cGp5RmxBSS9GYmI1dC9KSTZ1?=
 =?utf-8?B?UHh0K1hPNzA1NmFUekEzaVN4RE1aV1p5aXBRb0gyaUJJdzdhYWlWL051a3M5?=
 =?utf-8?B?ZGFEc091clVHTWlkUUFyNzc1aENnVVhYTUhoTk5idlRPcXk3Yy9KVWcxTXo4?=
 =?utf-8?B?T1dvOWxaVlI1dXA2bHNQSzBoV29lelBGdEkyTVJmMWFDdEpRQUFIalI4OFg4?=
 =?utf-8?B?d2tRM0VNY1FNVjNXWWRJT0dkRVFGL3FsblpaWndnK2FDdWtWbFE2Tlc0eVNV?=
 =?utf-8?B?S0g5VkFTZVBNTXBORWM1Y1RUTTduUENwOERBTy9Sc3lWN1laaENNYkIxTTgr?=
 =?utf-8?B?dU0xQmtHa3NqSUhNNityMDc5N01nMHRyUVBSa016NE1uTjhEWW94VCttcjcz?=
 =?utf-8?Q?qaejgI+D9BWxXOlzh0X0v6Ko6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe366193-8fcb-444b-2976-08ddbcfdfb65
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7804.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 02:28:39.9431 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sS2nV8xVl8nh8P4tLvgzuerkxjvvfPrtjvwpnP7hLsQkVlWIT5hTyKzlk/IURMLK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8496
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



On 7/7/2025 2:04 AM, Mario Limonciello wrote:
> On 7/4/2025 6:12 AM, Samuel Zhang wrote:
>> For normal hibernation, GPU do not need to be resumed in thaw since it
>> is not involved in writing the hibernation image. Skip resume in this
>> case can reduce the hibernation time.
> 
> Since you have the measurements would you mind including them in the
> commit message for reference?
> 
>>
>> For cancelled hibernation, GPU need to be resumed.
> 
> If I'm following right you are actually handling two different things in
> this patch aren't you?
> 
> 1) A change in thaw() to only resume on aborted hibernation
> 2) A change in shutdown() to skip running if the in s4 when shutdown()
> is called.
> 
> So I think it would be more logical to split this into two patches.
> 

This is doing only one thing - Keep the device in suspended state for
thaw() operation during a successful hibernation. Splitting into two
could break hibernation during integration of the first part - it will
attempt another suspend during shutdown. I think we don't take care of
consecutive suspend calls.

Thanks,
Lijo

>>
>> Signed-off-by: Samuel Zhang <guoqing.zhang@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/
>> drm/amd/amdgpu/amdgpu_drv.c
>> index 4f8632737574..e064816aae4d 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> @@ -2541,6 +2541,10 @@ amdgpu_pci_shutdown(struct pci_dev *pdev)
>>       if (amdgpu_ras_intr_triggered())
>>           return;
>>   +    /* device maybe not resumed here, return immediately in this
>> case */
>> +    if (adev->in_s4 && adev->in_suspend)
>> +        return;
>> +
>>       /* if we are running in a VM, make sure the device
>>        * torn down properly on reboot/shutdown.
>>        * unfortunately we can't detect certain
>> @@ -2655,6 +2659,10 @@ static int amdgpu_pmops_thaw(struct device *dev)
>>   {
>>       struct drm_device *drm_dev = dev_get_drvdata(dev);
>>   +    /* do not resume device for normal hibernation */
>> +    if (pm_transition.event == PM_EVENT_THAW)
>> +        return 0;
>> +
> 
> Without digging into pm.h documentation I think it's not going to be
> very obvious next time we look at this code that amdgpu_device_resume()
> is only intended for the aborted case.
> 
> How would you feel about a switch/case?
> 
> Something like this:
> 
> switch (pm_transition.event) {
> /* normal hibernation */
> case PM_EVENT_THAW:
>     return 0;
> /* for aborted hibernation */
> case PM_EVENT_RECOVER:
>     return amdgpu_device_resume(drm_dev, true);
> default:
>     return -EOPNOTSUP;
> }
> 
> 
>>       return amdgpu_device_resume(drm_dev, true);
>>   }
>>   
> 


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA97B90D9E
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 13:56:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84D0C10E448;
	Mon, 22 Sep 2025 11:56:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="aU2hi4q4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011055.outbound.protection.outlook.com [40.107.208.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC44710E448;
 Mon, 22 Sep 2025 11:56:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fwKv4AxQkMDaoVn0HvM3Fy6ygCWo8Lw178iJ9c3HEJBY9fThEZvci54GwI8Pm3RzP4WqF8TlEgwx8bwE52UuNY7qBdvEsbQoZTaqvwhg+rEsAu/K8OuvaDY7f+aIsN0XMGtNmx0knDQFb9zK+c63rlP2Q56cGUdoOTN82XPqqp3Ot+SRr39hAVJmbjWa5/c60Rg1ejC1FTuPXmBnDno6l3KcHLXM08l3ANr9uQTGIPLF/d4bxgZ5p/tumGStUx2U/OLs5nTfkPzbgumiThOaQ94eQjw/7sqzRoOVxu+wli9jvzayj7mP/x9AWDFyCvMc7t4duOUZC+h8V3AN6GlIsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Bi9g/mCte7yNZmAEFtnzMI7huOa8TEB7rfA8C0eQdk=;
 b=lI7LWrnah2mwQ+moYHlgwRagNah1tW6stBX1SHro7iYy5GYnyemhUa0hS3Ivpqq8Ps1D9JNWxlLY7GLTLdwy9kK2UIN9efomHbpH2OGjem9lfL0IyMuQyh3EkhgAlR4UVz+E5s5nKJsxdVM6Y9kKrUvOd177z1oAemYu5nLQANb/sscT+3vEsFoLYk1nofH8a+T9TBUV15o6rf7tUAVU7XQtT7Fg1I98LIkE21mb5oIrn14tMuz/Qm1wcuTfaDyoz1zLotl/gKTeNgAPBRpBQLinYhdtxzNxqoNwcrwZ4MVfMe0ShMfhjj9Y6HH8gAASjNZ8t3VCxzEdqCg0Hhks+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Bi9g/mCte7yNZmAEFtnzMI7huOa8TEB7rfA8C0eQdk=;
 b=aU2hi4q4BeoApjoigubiGUozj3UjJ4kCGPs7wrsRMtxAPHNM5kN8Dvls9afDFFiUmTEW1ijgPphwzA+iprvbiwSKp1H6u9CSa/QQzhMxobPvLOOVzhfyfR0aYMhTVJb19gbfFQmR6SsvsuwZbq70/PG3npS1WAueI9bk/JvapTY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY3PR12MB9678.namprd12.prod.outlook.com (2603:10b6:930:101::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 11:56:05 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 11:56:05 +0000
Message-ID: <9ebc8b23-1724-4566-a774-117d735b86b3@amd.com>
Date: Mon, 22 Sep 2025 13:55:58 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] drm: revert the remaining commits about dma_buf
 handling
To: Thomas Zimmermann <tzimmermann@suse.de>, Melissa Wen <mwen@igalia.com>,
 airlied@gmail.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20250919155519.1104256-1-mwen@igalia.com>
 <6da0bdd3-0b93-45d8-a178-1fc202bd49c7@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <6da0bdd3-0b93-45d8-a178-1fc202bd49c7@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0170.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::11) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY3PR12MB9678:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d61961c-fc3f-41da-8ca3-08ddf9cf028a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TzNrTC9hcHNodVY5bk9HM1Ivb2JtZDFocGhwVUpRNkpjR3lKa1BmajVRNU9u?=
 =?utf-8?B?S2pObXFvc3NBWjRSRGdKMGRjTUxxSlhscDNmNnlsN2k5bEIyNFZEYWdGYUJC?=
 =?utf-8?B?Z2d5TlhZcXBzQyt6bVI0NHJVOFVtZzVvSEw4Nk0ya1NKaVZ6aHdVdnFyejhV?=
 =?utf-8?B?ajNBbUFSOG9URTh2dE5QTUtVY1FwMGc3NWhXM1BsekZyMmgrWWdncUxEWWYz?=
 =?utf-8?B?WVgzaE43MXZ4Y3o0U090YllSQW1wRFljYWhVeXFWbUtNNkJnT2RMT3V4cW1i?=
 =?utf-8?B?N1hMdWVsa0kwYlZhc3I3Vk96Y0tjK25HdW5Dc3psOElBMlBJOGcxcDJURHlQ?=
 =?utf-8?B?eEVZUVgrWllnZTBDY2NRVUNNYllYQjVhU3M5bzVIZjRYWDNWbDhDOU00b0lv?=
 =?utf-8?B?WnpMMkxTSEVZcmpqbTg4L0Z2bmJVd21BRjlRQ0NoNlZiSUtrUWdsVThjZnJE?=
 =?utf-8?B?N1E1c05YNEkrZVdNaU9ETUcxS0JkKys0TDJjandMOUMyUUZUS2ZRYnBONlhG?=
 =?utf-8?B?TkQ3TTJUQUhYVFRHM2hJd1RPTXFIeXBmOWNaSTh1SG8vV2xNU2h5ck90R090?=
 =?utf-8?B?NkN5Tm1LanhFc1BDZzRXVTdQaXE4czRDYnY1K1E5SnpzaEFZalI1dTlsbmZI?=
 =?utf-8?B?R1g2NzdvZkdUYU9WUUxDSnRVbWlqcGhMaVp1K0wyUVQ3WTVSOFRNSFhwWTVN?=
 =?utf-8?B?RFROeGRXZnh2UGc1VGpTRXZ1bnhUSXhiTjJNVlUwUDZoM0xWT1VRQ3l5U0Fs?=
 =?utf-8?B?Y1BXTnpCb09QZk8rWkZRSEdjN1JjVElwQlpBOHBYWiszeVAxRVltRGxPd2h4?=
 =?utf-8?B?WGliOVRmVW9ITFVaTHlvazNjODBqQ3JjemxLM0czc1kzdE1tVm5uTlVDdFdQ?=
 =?utf-8?B?NFVzMElLazFUMlF2YmZLYU9pbHBjbzF6K08yZGRSZTcxandEV3owZytRUWt4?=
 =?utf-8?B?MGxuY1h4bklvbG5YVk13YkI1dER5bDlJa1N3KzR5Zm94NFhhQm5KbUV6KzN1?=
 =?utf-8?B?UjNnWkJ2Tjd4UFljTXBaRzB1RUFyRVkwNTZVVFZPaFZBbDEwOXJIQ2ttdzFM?=
 =?utf-8?B?Z29JRlBPVjlydkZhODQxTVpUQU1HK1lWNW9UMTc4R3VSdjgxSWdVS0h4TDRP?=
 =?utf-8?B?d1dXanNpMnNMSFdRdDBFQkpWZy9xOTNHa2M5RVYybmxWM1RFZmNPQ09wNS8v?=
 =?utf-8?B?WVRsaVVza2tsb0svM1F4T3NwNWh6TlJUcUorUVZ0QWliUnE0UzhLUnUrM1Ay?=
 =?utf-8?B?WVMxNkRmd0J0TnRONW51TEc5ZnpUZmNQSmJEcXBSYWY4Q0ZWOE1jZ1NpZnFN?=
 =?utf-8?B?SmZ0SU55bGZBQ0dXallHdE1EOUFZeTcwREZaSmZtTm96YjAzTzlrTmp6WHNm?=
 =?utf-8?B?dVZpdkJDdUFEdjNub0tkU2xGM3RBVUpGSE9oWTVVZ2NjdUZUVkptUTdPbldm?=
 =?utf-8?B?MmhMOVpTM3hraVJFNnN2dWhBWlhNV2xnaE1HWTdkYjR4WnA1Z0RGRlZsbWNk?=
 =?utf-8?B?R2xiQ1Q4M1pOUFpXbkttSThVc1FTQTR1ejhIRytSVE5UdGtxVlJqTE1yaXJs?=
 =?utf-8?B?eXIvdTNrbG1MdDYzUDRMRTlvRlpJdXArMFB1ejJhbWFpbzl1d0VTU1YyYWQ0?=
 =?utf-8?B?TDRyN2M0a0srRUpjOFVBTXJhM3MvRTQvU2xYUHdEcTVVNU9WTDBiODJ2bDNI?=
 =?utf-8?B?T09IVmJ2UFdOT1VqN1hSRE5aZndPOVBQanVUM1lhb0x1aU16UVRBTmtkSldy?=
 =?utf-8?B?SVZ6M2R3d3dhT3RuTEozY1lFSkVBbzg5MjNKcDRGVkc3WHVrT0w3ZlcvQmpa?=
 =?utf-8?B?bEFxZ2FhNXZaY1RaaTd6RmMvSUljUzY1VXNwYlRGWlVWajJTMmJFbm92eVNM?=
 =?utf-8?B?eDFuOVJVUS9COVRKcEVBdTF5RHVUakZ1VXpJRytwaDYvRkpmMlpQNXY4MVM0?=
 =?utf-8?Q?pyIZUZvLNrE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ME9tYmIrQTN6bGdTeW5ES042VjY2ZXdpbHV3a1Y4UW54Z0lnY0dOM29Zc2dZ?=
 =?utf-8?B?UFhGNHBOd25NVFcyOWc2WHZBaEEvUU15RHU0VjBZd2QxbUQ1TFRrWUxFeU1P?=
 =?utf-8?B?SHBHVjRadUlwMmE1ZytTa25mUVZnYmVqL1BZcXY1TnJTbm1KVnFZWGloaWp3?=
 =?utf-8?B?c3QreHBGdVhSUTkzWVgrc0w0WEgyenEzaElNSGR3c2ZSSVpUdjc5SHhpUEFD?=
 =?utf-8?B?djZ5TTQvWUJEdCt3dzR2U2NZYUxFbVlCZGorS2F6M0loM1BudTBEbzN6OHRx?=
 =?utf-8?B?TVZQc3l3SzQ5M1poSXI0TEdabGNaT3QxME9uWkJRM1hCUFJQcytscTFZd2xJ?=
 =?utf-8?B?cWF5bk1iMmFDVGNzdWVoK1hLRXNCQ3I1dWRBWmZWOGRtYWltSDRLQXAxT05P?=
 =?utf-8?B?VGJwRXV1eDZHcnNRUEI0NTdGcG5DUkZpaHJCWU1ySkh6MEhQNTNDN0YrUXRm?=
 =?utf-8?B?dlJCYkMraHR1K2o0eUtXb29LMFhYT2thYmJiM0h4bGI4RzRBR2dvSXdiOW9m?=
 =?utf-8?B?Y2VOOUFaWVkway85YXM3TUErOFlUZlN6bzJNL1NSTG40a3pyeUM4TzhDV2Y2?=
 =?utf-8?B?U2l1WVZiRkp2Qk1sdGhDN0J1dlJXSFlpOWtnb0NSTi8vRjI3eitqQ0FkTFhZ?=
 =?utf-8?B?RzRrSUFaM1N6K2huaHVWN2tFcEdWbG12czZjamdqQzRndFhMc1QvS3ljVXlT?=
 =?utf-8?B?SEVWQnVDcHVzVXFOMXpNeW8xZzBNREpoMWFreWw1VWJLTWVJeHFMOXlRakZm?=
 =?utf-8?B?ZmJtQU8raHJieHQ1REJqWE1BTWRYVFZVVUFyaUFHMGpablBqTWc3MUxXelIr?=
 =?utf-8?B?RDBNTWxNRHZCd1RBTGM1S3lOM2ptaHdBNzJHUkxaTitPSlBkMFR5K0N6Sll1?=
 =?utf-8?B?QnZwM04zRzRXdlhORUljWFArdy85bGgrR2JlUk1iWlVrRlpxb3lMY2JleTgw?=
 =?utf-8?B?L3FITWg3RllUS2dRekQ2dW1CNTlPZmN1Snc3ekNmRW56dDFEcXZjMVdZWHIv?=
 =?utf-8?B?VGc5c3NtU0FJaENhWFpTclJFRlgrSWZXWlhubWtFOUZJcE1xMk5xZ1ZaYlZj?=
 =?utf-8?B?L1FDalZ2ZDRtVDBEdzhrWlJxQndFN0RnT2gvWHhzU2UvajR3bEJ5QWZrQTc3?=
 =?utf-8?B?WVo3NlAraWVUbU9FNjRUQlYyaW1MN2RzNElFK2RKR1cycmMvUGtLNHdPS2ty?=
 =?utf-8?B?bDU1MUswWGZvSHlidWhSdGtWbGw4Y2pkTmthQm1MTDNNU1pGMzhhUm85dW1D?=
 =?utf-8?B?cFZFYURJSi9kMVZsYTV6Y3pRN29oNkJseHVzd1RRYzkwMVEvYUp4NktWUTY5?=
 =?utf-8?B?NFo2MVNEbC9VY1BuTUoxRE9EVlJESmxBZUlmcjVxeFZocC8yeXM1VGdSeldW?=
 =?utf-8?B?VVhHY2JiUzJZbEpqSndqeStYUVp4ZU9zU0hsdjBWaE95Vkxab3RITWp5MVVa?=
 =?utf-8?B?Q2tRWDBrOHR5TkNhS3lMK08rQU5XTW4yL05JT2RyUHdRZVB4WitNSXNwOG9v?=
 =?utf-8?B?WGxIZkFka0lNTnI0bkNJZ0JTSFdVb2piZ1lxd0pKNzBTVkkwcWdmUnZIekdO?=
 =?utf-8?B?b2tJV2pxZU5KV1ZSRXE5QXZmOGFRRUVGM0QzL1N2VnI0TUFHbDZGVlFtdjR0?=
 =?utf-8?B?RHVkWnBrYkw5WUFrQWhpY2h4aGJrcUlzanBqeTB5aHFRK0hKNEJaSUFmMUZF?=
 =?utf-8?B?UEFXVWI1NmNZU09qbHFiYXRKSDZOS3ZQc2FmV1BVTEppbTBnZklXTFI2cFN1?=
 =?utf-8?B?aUxhaUo0aWNoY0QxQitrTkFsdENKNmY1UGhvRHhSeWhpUEsvVFFtREtFQTdL?=
 =?utf-8?B?aGREdFFjMmNieENtVCtGZ29zbGhLUHI4Vzhoa3llK3RrZGJCa3JSc3RmQjdy?=
 =?utf-8?B?TXhTK3VQRUhQejBBZGxzc2VLbzNHYUhlTkNqcFJpTzJSSzdGMTgwUkl0Rllp?=
 =?utf-8?B?eE1pcDRHaEx3QmlNYmZGL3MvMFlob2E4SXpTUUtPU0NKKzhUNUR6MHREbzZy?=
 =?utf-8?B?cXRVRWZzdlJSdEcza3A4UTRKbmxxUEFLQU1lNEJYT0NvWUlteGJvclFjRlp3?=
 =?utf-8?B?UkFXQ1YrZklPeEpncXBMQmxDRURsVFNncVdvQ2JhM2ZIYUR6YnR3enpGcWV4?=
 =?utf-8?Q?7anx+XcFuUkYHcXjl30B7NhK7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d61961c-fc3f-41da-8ca3-08ddf9cf028a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 11:56:05.5240 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BH6NlZYJ1umS7kXPShJdNeGikPBTE5+/CoTglUkKTN8MjXNbSIRuJdKBqriAOfv/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9678
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

On 22.09.25 13:54, Thomas Zimmermann wrote:
> Hi Melissa
> 
> Am 19.09.25 um 17:54 schrieb Melissa Wen:
>> Hi all,
>>
>> I just talked with Thomas that these two patches are preventing amdgpu
>> driver to be unloaded:
>>
>> `modprobe: FATAL: Module amdgpu is in use.`
>>
>> and there is no process using the driver.

Melissa could it be that you have a console loaded?

Regards,
Christian.

> 
> What's the exact STR for this problem? After Christian's comments, I tried to reproduce the issue, but it works on my system. I do
> 
> - boot up with amdgpu in text mode (multiuser.target)
> - login by serial console
> - 'rmmod amdgpu'
> 
> That last step turns my test system's display off and unloads amdgpu. The kernel is a recent drm-tip at v6.17-rc6.
> 
> Best regards
> Thomas
> 
>>
>> We agreed that the best approach now is to completely revert the work
>> done for improving DMA bug handling to avoid any loose ends. With these
>> reverts we are just back to the old behavior and amdgpu loading and
>> unloading will return to normal.
>>
>> Best Regards,
>>
>> Melissa
>>
>> Melissa Wen (2):
>>    Revert "drm/framebuffer: Acquire internal references on GEM handles"
>>    Revert "drm/gem: Acquire references on GEM handles for framebuffers"
>>
>>   drivers/gpu/drm/drm_framebuffer.c | 31 +--------------
>>   drivers/gpu/drm/drm_gem.c         | 64 +++++--------------------------
>>   drivers/gpu/drm/drm_internal.h    |  2 -
>>   include/drm/drm_framebuffer.h     |  7 ----
>>   4 files changed, 11 insertions(+), 93 deletions(-)
>>
> 


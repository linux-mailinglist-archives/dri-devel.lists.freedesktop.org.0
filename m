Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GC5uD/nciWmBCwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 14:11:21 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E01F510F761
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 14:11:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39CB410E3E3;
	Mon,  9 Feb 2026 13:11:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="DcMoc0Sl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011033.outbound.protection.outlook.com [40.107.208.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3CEA10E0D4;
 Mon,  9 Feb 2026 13:11:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E+KW2+0FhhFgQMCA+SRtvCsMPnc/3fUHiSvv2zmNuefN9ypOLb9le7KrP5foc9RasdjaSaxeITBfliD7lgd6ihroFWOF+u4apWmTYeYnwOVhFQoQuoCgIdP4BnZq/UO1P+eKPyp5JFD710QSK/hSk/ZMN0VKSpynh+2v95YYrbO5WaOHB75jel2akSFNKQ8x7kKl2hQzPyQST6QqSmC0ywFufNUd9uMUTRo6cl0Wgh1WfyYEaqJht9qECTtGVXW1Kwezcv7Vp7HYZ24RDFyvxC4fXT+2jHRJKU1X87RO8w4XDliSXQD84Qg9ZQb3BmMLC1IPjeoENSlknZVgUJBRjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6xvVEz0ZiJ0zNnSTrWh4AI6Q+SzeXgH5vNmqrsgZFxk=;
 b=VH1mP+jk1FQrlJ0XI8Uxj8GOi8jawiUXm7G/mz1nWRgeUzhbwu2h2S90pMcZrJ1YFUtIWYYwJWPiHbE1GaC++JgFtLSfpgQSLOVlWxCmAio4GlBadMPD3QXat88pnmEUqvFp+eV3LjQNK5SchtsUUmGSF2V+9wU4qjxFAYUoyyDVkkhmke7ja6+ETD4ebOC7hcUqvsNgw8Q+FNv/FhsN3MnvT7Rnib+lDydximXNmv4GjZM9AbsJQI+MfezSkMuq+bq6QRM1CkosxE0ZyNZ5XdhXbyrLQsSo/W1l8/R6X+aBjRcYqzIJjwZlm5zyvvlLTVNVsJZtaFchbhBQYchlSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6xvVEz0ZiJ0zNnSTrWh4AI6Q+SzeXgH5vNmqrsgZFxk=;
 b=DcMoc0SldWEz8J2eEAf0P29Qmdutv6RqorQNFLOxvMLWDONUe3mS6gcv5fjhzG/o1I0/6WtEnI5a2LF2QWlbm79LhlLy8eYFw+43GjBs34KmZh2FjHCYImhRjSkIBeDMKOPC9n7Y8FCAqNUxITQbVUofoddAcxxfY8cMVptsdkc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB6435.namprd12.prod.outlook.com (2603:10b6:208:3ad::10)
 by PH7PR12MB6610.namprd12.prod.outlook.com (2603:10b6:510:212::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 13:11:09 +0000
Received: from IA1PR12MB6435.namprd12.prod.outlook.com
 ([fe80::8b77:7cdb:b17a:a8e2]) by IA1PR12MB6435.namprd12.prod.outlook.com
 ([fe80::8b77:7cdb:b17a:a8e2%5]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 13:11:08 +0000
Message-ID: <0eaf1785-0f84-45e5-b960-c995c1b1cf1e@amd.com>
Date: Mon, 9 Feb 2026 21:11:00 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/8] drm/amdkfd: Add batch userptr allocation support
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Felix.Kuehling@amd.com, Philip.Yang@amd.com, Ray.Huang@amd.com,
 alexander.deucher@amd.com, dmitry.osipenko@collabora.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, akpm@linux-foundation.org
References: <20260206062557.3718801-1-honglei1.huang@amd.com>
 <da75eadd-865e-41fe-a86b-ed9d9aa45e5a@amd.com>
 <8ba8e4f2-89f2-4968-a291-e36e6fc8ab9b@amd.com>
 <f296a928-1ef6-4201-9326-eab43da79a84@amd.com>
 <38264429-a256-4c2f-bcfd-8a021d9603b2@amd.com>
 <451400e6-bbe0-4186-bae6-1bf64181c378@amd.com>
Content-Language: en-US
From: Honglei Huang <honghuan@amd.com>
In-Reply-To: <451400e6-bbe0-4186-bae6-1bf64181c378@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2P153CA0009.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::18) To IA1PR12MB6435.namprd12.prod.outlook.com
 (2603:10b6:208:3ad::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6435:EE_|PH7PR12MB6610:EE_
X-MS-Office365-Filtering-Correlation-Id: 180f3adf-100f-49f9-0714-08de67dcb03c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|366016|1800799024|14052099004;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aWJwdWwrQytTY3VPZ2N2L2hJNnhoa0hyVDJUdUhsemVVRUhrVHZVUlFZUERu?=
 =?utf-8?B?amtUaERsV1ZYdkdBK3NLTVNBSCtqekNrdkdIM3owR25xWWZUV2dVRG5UeDBU?=
 =?utf-8?B?YkNvNG9EVm1lN1VsdlY3bkVhOVBPWnBaSjRQZWJZSnF4MmdMREFwVC9xWFg3?=
 =?utf-8?B?ckRUa3JHUzBzWDJOajNyZ2RCWWhhWnJ1N1pMWC9rVGloTjdONUloN0RjUFBj?=
 =?utf-8?B?QzBkVjJvMmlGUDg4M1RPSVRIRW9vZVNZM2JFMWVKaWdlV21OdGhRUXRWNlhQ?=
 =?utf-8?B?T0lCWGRHTm1ONno1NDBUMit0T0dMZXF2cGUvSE1OM0lvN0lNcVRZMmw2RkFk?=
 =?utf-8?B?dUVMMTNyWGlEWGQ2M3l5cFAwOTBHYkU4RkQ4dXZydm8rejB1dGJGOEhZL1VW?=
 =?utf-8?B?YXlRemZUa3R0M0MxOGpPSkVnSTRHQ2hVRzhGUis3OGFQV1ZFajRTUTRrTjF4?=
 =?utf-8?B?NHd6WHFjWXh1anJzdU1FU2hpbGxXZUFUSW54S2p4eERVOXVpZGpyL0piVVVW?=
 =?utf-8?B?ck1obmljd2d5a0RHYjFXNGFnS29mdFdLNGx5Q2Y0QkNVbVBmNDUvV0N0aE5k?=
 =?utf-8?B?c2RoYVFYTGtESEE5ODE2U0RUNkM5NVE1NDMvTGFzSUgwY3grVXhFcG81bGwz?=
 =?utf-8?B?WGRJU3pHd1Z4RXh0djh6dmhjTGZZQ0lySGlvdzNYaWtMQXBWdVNjZDM1T21M?=
 =?utf-8?B?MThPSytIb3hoeW0rVVNhQURYNEQ0UXptWVpZbGxab3hqcUROcGtoQU11a1VS?=
 =?utf-8?B?czQwTDY3cGVSdTZFVzY1YVpUU3FJdVhKZ0R0ZDQ3WFgxbmpHUCtIQk9iOW1t?=
 =?utf-8?B?eDZHVXJtYUN2SExKMWgwaUk2SnV3dHQ5WGpuY010UkFJWUx4NTNFVVU2alV2?=
 =?utf-8?B?N1ZkN0pqZC9BRWxNNlNrT3liV0JpZzhaRzNRaWRDVm1DZnZRY2VTWmxMNGFu?=
 =?utf-8?B?Y0dnN3Z1K2RINC9YWHVXeGRXZ3cvUmhqS2pEZUNlRkUreWtEQm9CWk5kM2R5?=
 =?utf-8?B?WXBrTlgrdVlOR1JLeXE0UXhDSXJodnJBWWs0UUFJWW5PTEJFdmxoZWQ2M3g1?=
 =?utf-8?B?SGRScTcvQTNzNHl3TlNrUCtFVy9ST1lqdjJxeUpFVk02NU9Fck9xd3FtMCtQ?=
 =?utf-8?B?Y1ZsR3kvdHpMQnJDWDJ4MjNIWHc2S2tMZkZTcTNTL1lPakVCd1Mwb0doRnhy?=
 =?utf-8?B?bWxLa0xXWHg5M29LOFpKUFJlbExYRm1saXdXTXN3di9kWkVXZTZ0djh2RitX?=
 =?utf-8?B?NnJlajNTL1pFMnArbUt5OHJDTitOK0VCUGNNL2g3VGlDNFFkVFVpaTEzSEdu?=
 =?utf-8?B?Mkc5bkFSOFFQSXVCdjRxdVRDYk1KUG1xNDl6Rk55QTRTZExMcUdUb0lXUER2?=
 =?utf-8?B?MnhWVVhMT05ZQjlIenBDRWo5eE16NE5kQ1Q2MGZyRnpPSDErVkJCenhpekJF?=
 =?utf-8?B?OXRLLytrdFZIYXVOWWppQVdIUTgwNlIwZGpjblRxYThMU2R2Z2xRS2VQYUw2?=
 =?utf-8?B?R2FOWXkvcEtKQ2UvSDFlN25Dek9uR3pGQWpOaG9HRDdNSGU3a0tld01BZFZF?=
 =?utf-8?B?MS9KOVhocmgvSlRYSURaRVdDUFQ4bzNpNmJmSURLNXgrM1lTaXZ1L2hvZnA5?=
 =?utf-8?B?YlptTW1mNjEzVUk3Nmx5K2ZtaEdpR2t4cW9RV2JEMS9naFUvN1haN1QyQURC?=
 =?utf-8?B?MEFNNVZ3WmxRd3VjTVk4a1dnR0NncWVSZlNjcjlPcWZVdEowTkgzZFo3SC9N?=
 =?utf-8?B?NnhLVzBZWlN4bGVVMEZFczkyY1l1YVhnMW90WGtUS1RQTkJoS1c4RVVMT1da?=
 =?utf-8?B?WEtFZ2FsczJLeHY0b3U3TkRYS254dUlYSnBqSnAySDlzcjdONmRvczc0ZEwr?=
 =?utf-8?B?b1M2VHNId3hGQXYvQnZFZUk4ZlJvUTNpRzBqamhOUWV4RGZqd0lzQnRkTkJ0?=
 =?utf-8?B?UVR6MWViOUUwUE9xZEtlRmN5ZncxVGdqMjNuQjA1YUtqUHdRUll0Qkw4TlpK?=
 =?utf-8?B?QTRrbUwvTUJ4ZVZMR216aVdScjdldERFRE1ZODkwVlpVcURTaFdKOWlabVZ4?=
 =?utf-8?B?b0UweXJaTEJ5UHp0eHNmandrMU9UT0czOGhGb3FxQm5LQ25ReEdabGJGY1VD?=
 =?utf-8?Q?Pwa4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB6435.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(14052099004); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0I1bkxoT0FubHdDUmM1OC9nejQvWHM1RGtueGdDTm9zMVFwUkZqNnJUVGk5?=
 =?utf-8?B?Rk5MUnhFUy9YakdzZ21aRGpvWEpBS3VpcEl3eGQrVTNNK0ZZRTBmMm9oblBx?=
 =?utf-8?B?aCt0dnR2MEo3VnlqTy9RdnJnM3pYaERLak1JQmJUMGVRRmh6MkN2S3lBbU1M?=
 =?utf-8?B?ekpYRzRua2NYV3pqV3U4OEl5T1NTTDJmZXZPcTdsVGZuOWhreXBNazkrUlhw?=
 =?utf-8?B?OTBVS3dyeThweEIxTTgycGZ1T1VYOWJJZzdVejN0SE9lbFI2QWF1VFgvTW9D?=
 =?utf-8?B?VkE2SCtWRVd6aHRXZHNibkNnc0pSaE82VWZjblBtOVdZb05FVjVOeGQ5Nmdn?=
 =?utf-8?B?bVJrQjJMZU1ieG5Ick5BRXNLMHpiVnBpV2RlZjBxRHpvR0hyWFVkeXZsRmxJ?=
 =?utf-8?B?WFUvZDh0OXlmNTFGUHJscXROZVFDclZLdGZ2clFMaDhHZytuVW9rRXVjUS9j?=
 =?utf-8?B?OFZzMTU1WEs0dWVsNWk0bHN2RnJrYnBjMHF3WFdrdWgyMUFOZU1iR1RrdWF3?=
 =?utf-8?B?Q2dYb2VHQU50NzYzWXNOR0Y1bEVtcy9zSzdpSnZGVS9BdjBIbHIvdEwxcG1G?=
 =?utf-8?B?TkdYSVZzTlhuZVdEeHp4SEIwR3VxWEJORDVEUk55U1I0eVVHMnZ1RTdNZlhO?=
 =?utf-8?B?eWtiUjJrSVRUODJTK1lEYW9NenFzeFMrdWJZcHJCTUlnRjdXU2hISlVpeGYr?=
 =?utf-8?B?TnNqeTkzZzhGbmFvMTcya2s0OExiay9KTzVWdS82M3NkOUFWUk5IZkFvWDJF?=
 =?utf-8?B?RlpMTjhtMk1Sb2ZUY3luazZyeVlDdktja0ZUdzNsZUNNSmhUNXJUaUJ4RCt4?=
 =?utf-8?B?UTR1TnRrU1NSODVjZGw4QXdyN0t3dU56RHZlcUV0N3lSRVVlOHE4aHZvTFJl?=
 =?utf-8?B?eklSSHpBQ2wvYVh5VkR4U2ttTk1hY1V0andNS2w2Rjkyb1Q3eVZjcjRJbWFo?=
 =?utf-8?B?YjVhZUlDc3NreGd4K05reUl3ZDJURitsdFBicDhwT05LckR3bXd3Z21ueUhv?=
 =?utf-8?B?TDlKUU5vM2VHU0ZONTlEVlJnUzErQjByNkNESVAyMTdpdWlueFdsRzJDZ244?=
 =?utf-8?B?cytJWE1uRTZ1a2x5cVJJejFGbkx5ZFYrNGxFVngrWGFpc0ZuU0Nsd2g0SENG?=
 =?utf-8?B?SUQ3STVZbFBXSnJ4dUUvUnd3VlBoRXZ3a3lXZ3Z2QWNLeUpvKzVJK1crWXM4?=
 =?utf-8?B?SnI1ZXdYKzMyL1gxc2dyZEo0UVZIT2lkWkJudDJJbTNySVhyMzErR3lLNlk2?=
 =?utf-8?B?ODMwVWlYMXFpaVpiWUNzMjhEYjdvV0FzbzhSV2w5bWx3MzhuVmNDQWtOdytS?=
 =?utf-8?B?MjdSU2MrN1hoVmRwR2JWMDkweENPbk5tWTNXU1RRZXB1UGZ1eWVSVFBqSXgr?=
 =?utf-8?B?c1pNenMvNjJ4blk5WEg5d0VCSXVSdmRwWTROM0pMVFZqZ3lDQmthdlZyWm1I?=
 =?utf-8?B?VlpBK2xSZjBqRTJjdFV3Lyt0VENveUoweTUrdXZyVUpxeStuK0FIZWFvWWxy?=
 =?utf-8?B?SGpIMEhDd1FiMVVkb09HTENnMmN2UE9lOEx1TUpZUzRmQXczeEdjT3AwRmhh?=
 =?utf-8?B?cVVLamQzeGthY0x4aFJaMVhFRy90RGg2Nzl4NWFucnNyN1VyaUpQdFgwWWN3?=
 =?utf-8?B?S3lVRXJxcGxzK1FLSG1NYXY0Y05SYkoyQ2tlbDBoU2lHVXJ2cEZCVXN0b2Rh?=
 =?utf-8?B?eUM1ZWZUVnU5MkFyeFY4V1NIV216WEZaNHY2TE9sQ0RPeTNub1VaeUYxMGxz?=
 =?utf-8?B?YkVycnI5VnZUclB4TDh0QStEeFZzSXFCUFRzWTIveWhmckJteVBxbTBPT2RZ?=
 =?utf-8?B?eE9WZGxaUzd0aWRPT04rUmJndDF3TUsrRzlabWRnY1dycUR5ODUzdFZSMW81?=
 =?utf-8?B?Z055LzVkUDZnM0hORWtneVBQdW45TmdQbGQ1TjVPUTBnemcxb09sUTg4TWhT?=
 =?utf-8?B?c1BiVE5Na29udHFiYmdyUkVHR1d3M2VmOXlhNU5kcmtWa2RwNWlKbHlzYjJw?=
 =?utf-8?B?NGxLWSs2bkNYUHRXNGVwUEdTTkwzOCtaWTFNTWFJSy9WcDZnMTE2bDJNYnR4?=
 =?utf-8?B?d2trM0Jyelk2NnU4eDQvbTNobGRjZ2dwa0Y1RU5pdy9MTWtmc2M5UFFORW9X?=
 =?utf-8?B?Q2Rnd2U4U3VCNnRRNGRiR0ZDME9wMWtZVlNTenpDcXJtK3BUWnBLbTJaVnBU?=
 =?utf-8?B?Y0NCQjEraWZmR1ZKaHRHaitHQTlDS0RSdjNxYjJJbzdYV2c4Umx4bGxiUkpj?=
 =?utf-8?B?U1FMWkZMb1NxUkZweGZxSGpRM3A2MjB5U2N0N2VDWityeEt4OUJTd3Mwc1N5?=
 =?utf-8?B?Qm1yT3EvUGxZb1dIcXZ1S2VZcFliUzQzd2VVVWtLTWFaZ2h0Sk5Xdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 180f3adf-100f-49f9-0714-08de67dcb03c
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6435.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 13:11:08.3695 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GxS9qLV7PWIWZs1L8nyUoq62YBhZPHXzqqnS9HK1og91jqiijd+O5FUVULvicddYJXq5Ob7bxlNrQJc/GSL/0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6610
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,collabora.com,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org,kvack.org,linux-foundation.org];
	FROM_NEQ_ENVFROM(0.00)[honghuan@amd.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+]
X-Rspamd-Queue-Id: E01F510F761
X-Rspamd-Action: no action


So the drm svm is also a NAK?

These codes have passed local testing, opencl and rocr， I also provided 
a detailed code path and analysis.
You only said the conclusion without providing any reasons or evidence. 
Your statement has no justifiable reasons and is difficult to convince
so far.

On 2026/2/9 20:59, Christian König wrote:
> On 2/9/26 13:52, Honglei Huang wrote:
>> DRM GPU SVM does use hmm_range_fault(), see drm_gpusvm_get_pages()
> 
> I'm not sure what you are talking about, drm_gpusvm_get_pages() only supports a single range as well and not scatter gather of VA addresses.
> 
> As far as I can see that doesn't help the slightest.
> 
>> My implementation follows the same pattern. The detailed comparison
>> of invalidation path was provided in the second half of my previous mail.
> 
> Yeah and as I said that is not very valuable because it doesn't solves the sequence problem.
> 
> As far as I can see the approach you try here is a clear NAK from my side.
> 
> Regards,
> Christian.
> 
>>
>> On 2026/2/9 18:16, Christian König wrote:
>>> On 2/9/26 07:14, Honglei Huang wrote:
>>>>
>>>> I've reworked the implementation in v4. The fix is actually inspired
>>>> by the DRM GPU SVM framework (drivers/gpu/drm/drm_gpusvm.c).
>>>>
>>>> DRM GPU SVM uses wide notifiers (recommended 512M or larger) to track
>>>> multiple user virtual address ranges under a single mmu_interval_notifier,
>>>> and these ranges can be non-contiguous which is essentially the same
>>>> problem that batch userptr needs to solve: one BO backed by multiple
>>>> non-contiguous CPU VA ranges sharing one notifier.
>>>
>>> That still doesn't solve the sequencing problem.
>>>
>>> As far as I can see you can't use hmm_range_fault with this approach or it would just not be very valuable.
>>>
>>> So how should that work with your patch set?
>>>
>>> Regards,
>>> Christian.
>>>
>>>>
>>>> The wide notifier is created in drm_gpusvm_notifier_alloc:
>>>>     notifier->itree.start = ALIGN_DOWN(fault_addr, gpusvm->notifier_size);
>>>>     notifier->itree.last = ALIGN(fault_addr + 1, gpusvm->notifier_size) - 1;
>>>> The Xe driver passes
>>>>     xe_modparam.svm_notifier_size * SZ_1M in xe_svm_init
>>>> as the notifier_size, so one notifier can cover many of MB of VA space
>>>> containing multiple non-contiguous ranges.
>>>>
>>>> And DRM GPU SVM solves the per-range validity problem with flag-based
>>>> validation instead of seq-based validation in:
>>>>     - drm_gpusvm_pages_valid() checks
>>>>         flags.has_dma_mapping
>>>>       not notifier_seq. The comment explicitly states:
>>>>         "This is akin to a notifier seqno check in the HMM documentation
>>>>          but due to wider notifiers (i.e., notifiers which span multiple
>>>>          ranges) this function is required for finer grained checking"
>>>>     - __drm_gpusvm_unmap_pages() clears
>>>>         flags.has_dma_mapping = false  under notifier_lock
>>>>     - drm_gpusvm_get_pages() sets
>>>>         flags.has_dma_mapping = true  under notifier_lock
>>>> I adopted the same approach.
>>>>
>>>> DRM GPU SVM:
>>>>     drm_gpusvm_notifier_invalidate()
>>>>       down_write(&gpusvm->notifier_lock);
>>>>       mmu_interval_set_seq(mni, cur_seq);
>>>>       gpusvm->ops->invalidate()
>>>>         -> xe_svm_invalidate()
>>>>            drm_gpusvm_for_each_range()
>>>>              -> __drm_gpusvm_unmap_pages()
>>>>                 WRITE_ONCE(flags.has_dma_mapping = false);  // clear flag
>>>>       up_write(&gpusvm->notifier_lock);
>>>>
>>>> KFD batch userptr:
>>>>     amdgpu_amdkfd_evict_userptr_batch()
>>>>       mutex_lock(&process_info->notifier_lock);
>>>>       mmu_interval_set_seq(mni, cur_seq);
>>>>       discard_invalid_ranges()
>>>>         interval_tree_iter_first/next()
>>>>           range_info->valid = false;          // clear flag
>>>>       mutex_unlock(&process_info->notifier_lock);
>>>>
>>>> Both implementations:
>>>>     - Acquire notifier_lock FIRST, before any flag changes
>>>>     - Call mmu_interval_set_seq() under the lock
>>>>     - Use interval tree to find affected ranges within the wide notifier
>>>>     - Mark per-range flag as invalid/valid under the lock
>>>>
>>>> The page fault path and final validation path also follow the same
>>>> pattern as DRM GPU SVM: fault outside the lock, set/check per-range
>>>> flag under the lock.
>>>>
>>>> Regards,
>>>> Honglei
>>>>
>>>>
>>>> On 2026/2/6 21:56, Christian König wrote:
>>>>> On 2/6/26 07:25, Honglei Huang wrote:
>>>>>> From: Honglei Huang <honghuan@amd.com>
>>>>>>
>>>>>> Hi all,
>>>>>>
>>>>>> This is v3 of the patch series to support allocating multiple non-contiguous
>>>>>> CPU virtual address ranges that map to a single contiguous GPU virtual address.
>>>>>>
>>>>>> v3:
>>>>>> 1. No new ioctl: Reuses existing AMDKFD_IOC_ALLOC_MEMORY_OF_GPU
>>>>>>       - Adds only one flag: KFD_IOC_ALLOC_MEM_FLAGS_USERPTR_BATCH
>>>>>
>>>>> That is most likely not the best approach, but Felix or Philip need to comment here since I don't know such IOCTLs well either.
>>>>>
>>>>>>       - When flag is set, mmap_offset field points to range array
>>>>>>       - Minimal API surface change
>>>>>
>>>>> Why range of VA space for each entry?
>>>>>
>>>>>> 2. Improved MMU notifier handling:
>>>>>>       - Single mmu_interval_notifier covering the VA span [va_min, va_max]
>>>>>>       - Interval tree for efficient lookup of affected ranges during invalidation
>>>>>>       - Avoids per-range notifier overhead mentioned in v2 review
>>>>>
>>>>> That won't work unless you also modify hmm_range_fault() to take multiple VA addresses (or ranges) at the same time.
>>>>>
>>>>> The problem is that we must rely on hmm_range.notifier_seq to detect changes to the page tables in question, but that in turn works only if you have one hmm_range structure and not multiple.
>>>>>
>>>>> What might work is doing an XOR or CRC over all hmm_range.notifier_seq you have, but that is a bit flaky.
>>>>>
>>>>> Regards,
>>>>> Christian.
>>>>>
>>>>>>
>>>>>> 3. Better code organization: Split into 8 focused patches for easier review
>>>>>>
>>>>>> v2:
>>>>>>       - Each CPU VA range gets its own mmu_interval_notifier for invalidation
>>>>>>       - All ranges validated together and mapped to contiguous GPU VA
>>>>>>       - Single kgd_mem object with array of user_range_info structures
>>>>>>       - Unified eviction/restore path for all ranges in a batch
>>>>>>
>>>>>> Current Implementation Approach
>>>>>> ===============================
>>>>>>
>>>>>> This series implements a practical solution within existing kernel constraints:
>>>>>>
>>>>>> 1. Single MMU notifier for VA span: Register one notifier covering the
>>>>>>       entire range from lowest to highest address in the batch
>>>>>>
>>>>>> 2. Interval tree filtering: Use interval tree to efficiently identify
>>>>>>       which specific ranges are affected during invalidation callbacks,
>>>>>>       avoiding unnecessary processing for unrelated address changes
>>>>>>
>>>>>> 3. Unified eviction/restore: All ranges in a batch share eviction and
>>>>>>       restore paths, maintaining consistency with existing userptr handling
>>>>>>
>>>>>> Patch Series Overview
>>>>>> =====================
>>>>>>
>>>>>> Patch 1/8: Add userptr batch allocation UAPI structures
>>>>>>        - KFD_IOC_ALLOC_MEM_FLAGS_USERPTR_BATCH flag
>>>>>>        - kfd_ioctl_userptr_range and kfd_ioctl_userptr_ranges_data structures
>>>>>>
>>>>>> Patch 2/8: Add user_range_info infrastructure to kgd_mem
>>>>>>        - user_range_info structure for per-range tracking
>>>>>>        - Fields for batch allocation in kgd_mem
>>>>>>
>>>>>> Patch 3/8: Implement interval tree for userptr ranges
>>>>>>        - Interval tree for efficient range lookup during invalidation
>>>>>>        - mark_invalid_ranges() function
>>>>>>
>>>>>> Patch 4/8: Add batch MMU notifier support
>>>>>>        - Single notifier for entire VA span
>>>>>>        - Invalidation callback using interval tree filtering
>>>>>>
>>>>>> Patch 5/8: Implement batch userptr page management
>>>>>>        - get_user_pages_batch() and set_user_pages_batch()
>>>>>>        - Per-range page array management
>>>>>>
>>>>>> Patch 6/8: Add batch allocation function and export API
>>>>>>        - init_user_pages_batch() main initialization
>>>>>>        - amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu_batch() entry point
>>>>>>
>>>>>> Patch 7/8: Unify userptr cleanup and update paths
>>>>>>        - Shared eviction/restore handling for batch allocations
>>>>>>        - Integration with existing userptr validation flows
>>>>>>
>>>>>> Patch 8/8: Wire up batch allocation in ioctl handler
>>>>>>        - Input validation and range array parsing
>>>>>>        - Integration with existing alloc_memory_of_gpu path
>>>>>>
>>>>>> Testing
>>>>>> =======
>>>>>>
>>>>>> - Multiple scattered malloc() allocations (2-4000+ ranges)
>>>>>> - Various allocation sizes (4KB to 1G+ per range)
>>>>>> - Memory pressure scenarios and eviction/restore cycles
>>>>>> - OpenCL CTS and HIP catch tests in KVM guest environment
>>>>>> - AI workloads: Stable Diffusion, ComfyUI in virtualized environments
>>>>>> - Small LLM inference (3B-7B models)
>>>>>> - Benchmark score: 160,000 - 190,000 (80%-95% of bare metal)
>>>>>> - Performance improvement: 2x-2.4x faster than userspace approach
>>>>>>
>>>>>> Thank you for your review and feedback.
>>>>>>
>>>>>> Best regards,
>>>>>> Honglei Huang
>>>>>>
>>>>>> Honglei Huang (8):
>>>>>>      drm/amdkfd: Add userptr batch allocation UAPI structures
>>>>>>      drm/amdkfd: Add user_range_info infrastructure to kgd_mem
>>>>>>      drm/amdkfd: Implement interval tree for userptr ranges
>>>>>>      drm/amdkfd: Add batch MMU notifier support
>>>>>>      drm/amdkfd: Implement batch userptr page management
>>>>>>      drm/amdkfd: Add batch allocation function and export API
>>>>>>      drm/amdkfd: Unify userptr cleanup and update paths
>>>>>>      drm/amdkfd: Wire up batch allocation in ioctl handler
>>>>>>
>>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |  23 +
>>>>>>     .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 539 +++++++++++++++++-
>>>>>>     drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      | 128 ++++-
>>>>>>     include/uapi/linux/kfd_ioctl.h                |  31 +-
>>>>>>     4 files changed, 697 insertions(+), 24 deletions(-)
>>>>>>
>>>>>
>>>>
>>>
>>
> 


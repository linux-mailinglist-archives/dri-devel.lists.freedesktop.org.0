Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8823DB3EE47
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 21:04:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C131610E507;
	Mon,  1 Sep 2025 19:04:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="N7nAkBV1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2047.outbound.protection.outlook.com [40.107.220.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 445B610E500;
 Mon,  1 Sep 2025 19:04:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W3jNSBLDR8HHXkAdjouZi/OVVbxaJH1GrbOHAkS+z7lrbLd9e2jGw0NBJk8TbvH/X177DQUK8siDl6HWYNSL9DfS78oy0SA+lmUyWF858a/VnncTuz2J+2abS2xJ7OO1XpfF8jN8LrxU0Ftwq+X+XdFhgAno7zuYHdctFIopjF7OZ0012795RlCKCaByOoJkTiI5stq1JeI8p5U1K/TL9QwK6Sx43rbgWcETjbFFFkDHjYGecYWuZDHdjzVx4/SChW46FoEY1pRiJeht8XMR334BYN1HwJEbr7Gc/BhAIosFSnOZG74xkRItj/+2fb+1cahKCckjtr4yGD6Zs+ku3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jgq0TlHoKLYXL1cuB/e1Hbubru07rCXeP23PMaG7rCE=;
 b=YWCcusTyS3oGUPFf7AIf/WnNlsvQWEBF1bG3GPPmX+DawoRWpTfToHvc0piAj+sYaarUeUOJS2L1xcw/x+GQMivwedVcsJj9dZX7Z7FVUwFmiR6kXsC6C6qBmuvVVreSi01aVkDVChTuR4WD7HQLYep+H7AEqVQDMKnyeC5mO7Vst+QYaM+TXnTAoUjopRX5CZJpyk51k9MC+z7jjvd2swtSHwNeTwTX8XYz5lPMv4BkufmBewXK28BRCAq7kxsHAfdD1SKDY75HYUTKEMkR1UNbXgxs6rjFgybkpM5WgRt/JAb4rYBhd+C8eJuYdadS/Xd4wqVbI0ZSsvX/mM4W8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jgq0TlHoKLYXL1cuB/e1Hbubru07rCXeP23PMaG7rCE=;
 b=N7nAkBV1cYBaxl2ErPfFTdWlzmpWB7BpcI7E4Wz2f4M6FFvig41R3fnRA/FEpzXMnsMGgPwhYT3MaA2wC9knNIsU88hrcsiAv7FpWFw/9EyEaiftE2+G6AeJtUJ2K2scD9FcRUygmBDVht68d2JnTUbEDhLh2+Kc/NzjU0+2i2Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7301.namprd12.prod.outlook.com (2603:10b6:510:222::12)
 by SJ2PR12MB9164.namprd12.prod.outlook.com (2603:10b6:a03:556::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Mon, 1 Sep
 2025 19:04:06 +0000
Received: from PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::a929:e8eb:ef22:6350]) by PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::a929:e8eb:ef22:6350%6]) with mapi id 15.20.9073.026; Mon, 1 Sep 2025
 19:04:06 +0000
Message-ID: <ef85a612-041b-40c9-a12f-4f40692b9395@amd.com>
Date: Tue, 2 Sep 2025 00:33:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] drm/buddy: Separate clear and dirty free block
 trees
To: Jani Nikula <jani.nikula@linux.intel.com>, christian.koenig@amd.com,
 matthew.auld@intel.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: alexander.deucher@amd.com
References: <20250828105646.2280-1-Arunpravin.PaneerSelvam@amd.com>
 <20250828105646.2280-2-Arunpravin.PaneerSelvam@amd.com>
 <a717b90a04fdaf16d0d95d2941f1c82dcfa8fd8c@intel.com>
Content-Language: en-US
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <a717b90a04fdaf16d0d95d2941f1c82dcfa8fd8c@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4P287CA0110.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2ad::11) To PH8PR12MB7301.namprd12.prod.outlook.com
 (2603:10b6:510:222::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7301:EE_|SJ2PR12MB9164:EE_
X-MS-Office365-Filtering-Correlation-Id: a6f92be3-1abf-451b-b077-08dde98a52c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SGFHMnFPQjBQaVV2UTFhNXJnZTdZUXdZV1EwdklkYlU4V0hpT0Q2QUVqaGZx?=
 =?utf-8?B?ZkozQlZQQmFITm1tYTBIVzMzblRpUk9HdkdweGgwb0ZGS2FObDdkTWJESVA4?=
 =?utf-8?B?Qk9ZNWMyVHVFQ2QzUFM0VlBRZ0NxamVjbUc1NlA5VitMNVBSTk1BYTM5UnJC?=
 =?utf-8?B?blpZMEhNVG5JNXlxVEUrclpKWUt4UE1SRGl4MmVaOC9mQm5EL2ZMQ05hdW1G?=
 =?utf-8?B?OUhrb3liZ3JkV01UdTRBbFdudW8xL1l3MnpTYTlhU1JnNUNvZ2dIaFl5Ris0?=
 =?utf-8?B?ZlBRSkt4emsxZ0p5K0oxMGw4alhyVVdHV3owazRMa3dKUmZtNFVFaGZGdjRX?=
 =?utf-8?B?NDVpS0svWXdIZWFHUnEzUy9lVDJxRW9OS0hNYzJUUFBZdnllNFhSTk16Ym9K?=
 =?utf-8?B?aFhWcTJsV012aWdwN0dOYzdBdVhOWTlWNXZOTTNYZVhFTy8xcUwzbWNvTDhI?=
 =?utf-8?B?bHgyS05PaUFoSXVmYndCVTRsRGtmME9aZUc2cDR0QXZrUXc3Z3ZDZXdtOHpO?=
 =?utf-8?B?NWVqWmlQUitlSnVjZHF4VEhrYitINGNDdzdYR2k4eGhtdlFPaDltbXFtR213?=
 =?utf-8?B?c0tLSi8vbXJiV1p0cGRiNUk3ZnhCSkpkTHpWa0s3TC92ZW9ZV1ZqUE1iQjd3?=
 =?utf-8?B?L3hRRG9NN2dWb0Z5djArMEJTWS9jRE0vNzQzdmZseEZYeWp2U1RBb2k4V1Jv?=
 =?utf-8?B?czhIU3l0NFltN25waXB4YUVxOG80TGhWQUxONFhJS2J0RmdFRkp3WWIxb2Y1?=
 =?utf-8?B?T2tWeXZHblJndXdUbXcwVmVwOUxJZWc4QVNFNUhoVG1iMlZvZ0hYdi9ZSFV1?=
 =?utf-8?B?YU5yYTRRangxbDVRemNzaDI3OHRha1Q4dGlUaTJwb3djMldzKzU3MkJjWmxU?=
 =?utf-8?B?QVhXYjd0RjZJUyt4aFlNbElWMWtZblpQYVhqV3BGNHQ5M245R1AxNmovb2E5?=
 =?utf-8?B?VHNhRG9jSTVaTWNGUjZya21aS241ZVRwMlNpQ09DUnVxWE1FN2hzMDR3OUo5?=
 =?utf-8?B?ZHBYUlFKL2NoUlZTU0NFcks1L1d2bkRqU3p4SzdlMkloYWVXUFBPSDFBQXov?=
 =?utf-8?B?L1VxQ25CeStYUmN6cjJWYmFtVUJGcENvU21QNEdyNFo1aDBvNEdRVnQ4MGV4?=
 =?utf-8?B?VlErdWpaRmR0ZWhWVGM1cWVvSzNVYXBlZlhNWlZITkpaUHpPZENwbWZPRDdL?=
 =?utf-8?B?MjRUa0w3bXh3ZXovSFZRczVZNmVhSEw2WVR1cktjVUFEZU1zMmhkbmJsaSs2?=
 =?utf-8?B?K294ZlVYTFc2bWQ1ckg2YnQ1Mi8rbnZHZVpxUzRYWGRpMkpzM1dIUGM0RTRM?=
 =?utf-8?B?RC8zZFA5MHYrTjdVMDV4N3Z6aWJCclUvRTNGOVhtMmMvbGQveVBFaDUvZXVo?=
 =?utf-8?B?NFY0SG1NSmhCb0VuMlhVZVBNaGZwdGxPV2ppR0prNDd0UTk3WjVzbTRYejBS?=
 =?utf-8?B?YUVEY1EvbzJOSzBzVFFUK0dCK1VNTFA3K2ovWGFFenFCWWpkejd2bStITERV?=
 =?utf-8?B?bGdwajhmNFF2a29jbWhvbVpmUUtSSFEyT1B5Z2Z6NWRNR2wybVF4cHJOcTRO?=
 =?utf-8?B?S0Nac1A2bzVJcWJoNFNQQlN6RlMvZHoxYVhFVTZOalErMlp1Mis2U1RKTTRG?=
 =?utf-8?B?Nkx3WmU1VVQ2UzNlUXJMT0YxRDlPcExITThzVkh4U29NZWM3TjVQT09XSWl4?=
 =?utf-8?B?ZENqbzd2RTZVaFBreG5VSG9BcEhVeC9TZ3gzV3ppdC90RkU1b25relVUWjRr?=
 =?utf-8?B?Q0lKam16UjhmTjlsOCs5NzNhM0ZNNVhCUStvRlUrUUdzSWFaVkYybFh3dkt0?=
 =?utf-8?Q?SA1f98Pzg43itSmd/DgMa49pRestM+XQ6Ej/M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7301.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WlN6dXVaaDNqSzdwV1dZek1iRlRVei8vZlljcCtzeHIxQ3B5dUlENmNhbTF0?=
 =?utf-8?B?bWUxbVZsai9yRW1zc3FvT2pCTUNjSTNYQ0pFKzlkQjNvV01UZUpLd1FtMjFB?=
 =?utf-8?B?aEgrb1MrL1dvT05ndWwzZXEweFdybVdyK2JPQm5IdkNXREJEZkR6RFNOSnp5?=
 =?utf-8?B?ejB1bWczYWRvc3U3UExUSUdlb3JIQWtDMkVZYW5wa2QzSFBFeU5iL2FSTkdI?=
 =?utf-8?B?WFFVcmZnYlVtZ2kyTThaYzZrSXYzYXZJbitwTmpHblFvTFdKTkZCQzdUY0hG?=
 =?utf-8?B?SjZxdk10Q3doTFp2eXBuRHo0cjROaVdnd1VPd3Q1Vnl0MU9vRUxncHJUWVY3?=
 =?utf-8?B?L2lRU3g5ZnlVQWJhbUd6VXFBdGQvbGVUdFhCS05QWGllRXIxUjNib2ZhVnNk?=
 =?utf-8?B?L25CYkFBZnlrbTJNTU9EZ3I4ODluemhpaE1YT3BjUWJnYW5vUGtEYnp4dTE4?=
 =?utf-8?B?bCtLRUVObjI5N01DeDZHNHRYWUNoN1huaWpIS1Q1VmlsZDFSSU51MElhMWtx?=
 =?utf-8?B?OUxiVDlMa0NNY3h4SzJSTUJSSVM3ZGN6VXZQQ1pSLzJlWWJLbytxOXhuSElY?=
 =?utf-8?B?UlVsWG1lem5nYmFQN2duTUlPMFYvNEc2Tk9QOS9iMFhtdkdUV1gweTN1Wnlk?=
 =?utf-8?B?ZmlVVWdlb1h6bHBjMXg3TmhBdEJoL29sQTZFK2ptcDEwNjJpNjNsTTZjM0N6?=
 =?utf-8?B?amZwWTZwSFl0K0lVbUNLZThWNk8rNmF2djhhTG5Qc3Q3MWJoOXQyNHBDZ2Nx?=
 =?utf-8?B?M2cyL29xcm56eGJ3UjRLWDBMWWN6RGJxMkowTVZDNy8wczUvQTBJdXB3aFRQ?=
 =?utf-8?B?Nk1xTnpiVlNyK2hrVVFpdlVzSTZXdWFmRWs5cVEyVUxLMHMwQ08wREFWRk9o?=
 =?utf-8?B?WjMzQVNTWDhmV3dlZVMvcE9zTGpoQ1V5VUNReDF6ZkozY2NDTHZqWFI0a3pM?=
 =?utf-8?B?bVlMUHZ3WGVBUW9GSVdCK0c0NTZUYkczQjZYZWtxWmM3a0pkZzFwZkMwSjQ2?=
 =?utf-8?B?WGhOazg3c2Z6cDhWS3pja3lEc3hudUIyT1dEQk9HUkNsckhGM3VTUG8yZVlF?=
 =?utf-8?B?NEVjZ25tNGZtVEJhLy9abHR5Q1NEMW11YUVlT1h1anlnSURoTU55T1c1eEEr?=
 =?utf-8?B?Rnh4REMwMW1sVXNMWkNpV1Y2NURxNk53QjV2dUovajlGTHd4cXhrREtURUkv?=
 =?utf-8?B?K0pRQWtuM0gzd2hHeXE2b2tPWDZqd0IreGk0bWZBQ0VnN0ZaR0FIVUJHTEoz?=
 =?utf-8?B?RjVYOW8vWktiMjFrdUN2UWxoNDdxZWswMzdxdE8xYWdaMlV3R1oxdDFMcFlt?=
 =?utf-8?B?ejJJd1k5YmJ1Ynlnd2dvSG52aGJQN3c0dHo0MEpmdGNOSlQ4dDdCbUM3ckM1?=
 =?utf-8?B?Wkp0RFpGVmh0bmhxcXB5WUM4YWdiY2IvTkxUSU1WanR5WlIzbFFxdzFZR1VT?=
 =?utf-8?B?R25sOXZyYmwzMGsxdy8xU0t2K2sxcEFHdUQ4eDRYbEcwM2VOVWxMcjU2UTRM?=
 =?utf-8?B?UTBpQ3BaQVZSMk5DSFFucmVZZVhmaTBzRE9NN1hXc0dqNEU0bVN0bkI5VmpU?=
 =?utf-8?B?dWRDNXBpU2x3Mnk1WW4weCswQnFwcytvR3VNT0U1amhXdHNQd1NqZUlFaENp?=
 =?utf-8?B?WFpiSmkwNkxnUUZoU1JNUkR5dTZxcU0wb0hwdUFxRXhnQzR5TFlieXdmWVlD?=
 =?utf-8?B?ZXVVYlBGQzUrbmVxZzdhRG50ekNYUVp5TmcwdWordHdrT3pJM0VZdGtRcnNh?=
 =?utf-8?B?b25Ec1YwdFdkTHEzVFplOXZmZXZ6eTFTcnRVOFd1T2djKzExbzZ5RVRoSTZ2?=
 =?utf-8?B?cGVzSStIMXRGeXlUbFp1b3M5UWRSc0VuWE42OWwwTTZDcjVYamVzdksrRTBO?=
 =?utf-8?B?LzlMemVHcGVydWtTRkJPS2VCbkFZam5QSXhWTzltT21XS2Qya05KT1ZoY1Zh?=
 =?utf-8?B?N3BYdkEzM0dxVnJMUTd5MDd3bmtWUFdXaHpiTkJleU9rUUdudUNpaSsxS0tw?=
 =?utf-8?B?aXU0ZGlHVVkvazdZVmppVEtZMGhkL2U5TU9TZGpmRHN4czdtM3NmYkFGTHBG?=
 =?utf-8?B?TXg5SjhDTlV1MmlMSGlrOXk0dUtWbXRxNUtGS2R0ellKNmFBYW5DSFJsYjJD?=
 =?utf-8?Q?9JhCeiSR7xWbimGUn70p+iRFV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6f92be3-1abf-451b-b077-08dde98a52c9
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7301.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2025 19:04:06.2600 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7bj7bkHdeii66t/qNDhj5nc250vkGZnspTy5fnN311hRghka62b5HbsyZ7Q5h03vEsZb/EeyeW9951Wu3+1WYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9164
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

Hi Jani,

On 8/28/2025 4:43 PM, Jani Nikula wrote:
> On Thu, 28 Aug 2025, Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com> wrote:
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
>>
>> v3(Matthew):
>>    - Remove the double underscores from the internal functions.
>>    - Rename the internal functions to have less generic names.
>>    - Fix the error handling code.
>>    - Pass tree argument for the tree macro.
>>    - Use the existing dirty/free bit instead of new tree field.
>>    - Make free_trees[] instead of clear_tree and dirty_tree for
>>      more cleaner approach.
>>
>> v4:
>>    - A bug was reported by Intel CI and it is fixed by
>>      Matthew Auld.
>>    - Replace the get_root function with
>>      &mm->free_trees[tree][order] (Matthew)
>>    - Remove the unnecessary rbtree_is_empty() check (Matthew)
>>    - Remove the unnecessary get_tree_for_flags() function.
>>    - Rename get_tree_for_block() name with get_block_tree() for more
>>      clarity.
>>
>> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
>> Suggested-by: Matthew Auld <matthew.auld@intel.com>
>> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4260
>> ---
>>   drivers/gpu/drm/drm_buddy.c | 322 +++++++++++++++++++++---------------
>>   include/drm/drm_buddy.h     |   8 +-
>>   2 files changed, 192 insertions(+), 138 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>> index 01ae984340cc..06e90020177f 100644
>> --- a/drivers/gpu/drm/drm_buddy.c
>> +++ b/drivers/gpu/drm/drm_buddy.c
>> @@ -14,6 +14,9 @@
>>   
>>   static struct kmem_cache *slab_blocks;
>>   
>> +#define for_each_free_tree(tree) \
>> +	for ((tree) = CLEAR_TREE; (tree) < MAX_FREE_TREES; (tree)++)
> IMO better to just use 0 and ARRAY_SIZE() for the limits, here and
> everywhere. It's just that there's no connection between the enum and
> how its used anyway.

I moved the enum free_tree in the .h file to .c file and changed the

struct rb_root *free_trees[MAX_FREE_TREES] to struct rb_root 
**free_trees. Since now

the array is a dynamic one, we can't use the ARRAY_SIZE(). Please check 
the v5 version.

Thanks,

Arun.

>
>> +
>>   /*
>>    * for_each_rb_free_block() - iterate over an RB tree in order
>>    * @pos:	the struct type * to use as a loop cursor
>> @@ -78,22 +81,60 @@ static void drm_block_free(struct drm_buddy *mm,
>>   	kmem_cache_free(slab_blocks, block);
>>   }
>>   
>> +static inline enum free_tree
> Please don't use static inline in .c files. Just let the compiler do
> what it deems best.
>
>> +get_block_tree(struct drm_buddy_block *block)
>> +{
>> +	return drm_buddy_block_is_clear(block) ? CLEAR_TREE : DIRTY_TREE;
>> +}
>> +
>> +static inline struct drm_buddy_block *
>> +rbtree_get_free_block(struct rb_node *node)
>> +{
>> +	return node ? rb_entry(node, struct drm_buddy_block, rb) : NULL;
>> +}
>> +
>> +static inline struct drm_buddy_block *
>> +rbtree_prev_free_block(struct rb_node *node)
>> +{
>> +	return rbtree_get_free_block(rb_prev(node));
>> +}
>> +
>> +static inline struct drm_buddy_block *
>> +rbtree_first_free_block(struct rb_root *root)
>> +{
>> +	return rbtree_get_free_block(rb_first(root));
>> +}
>> +
>> +static inline struct drm_buddy_block *
>> +rbtree_last_free_block(struct rb_root *root)
>> +{
>> +	return rbtree_get_free_block(rb_last(root));
>> +}
>> +
>> +static inline bool rbtree_is_empty(struct rb_root *root)
>> +{
>> +	return RB_EMPTY_ROOT(root);
>> +}
>> +
>>   static void rbtree_insert(struct drm_buddy *mm,
>> -			  struct drm_buddy_block *block)
>> +			  struct drm_buddy_block *block,
>> +			  enum free_tree tree)
>>   {
>> -	struct rb_root *root = &mm->free_tree[drm_buddy_block_order(block)];
>> -	struct rb_node **link = &root->rb_node;
>> -	struct rb_node *parent = NULL;
>> +	struct rb_node **link, *parent = NULL;
>>   	struct drm_buddy_block *node;
>> -	u64 offset;
>> +	struct rb_root *root;
>> +	unsigned int order;
>> +
>> +	order = drm_buddy_block_order(block);
>>   
>> -	offset = drm_buddy_block_offset(block);
>> +	root = &mm->free_trees[tree][order];
>> +	link = &root->rb_node;
>>   
>>   	while (*link) {
>>   		parent = *link;
>> -		node = rb_entry(parent, struct drm_buddy_block, rb);
>> +		node = rbtree_get_free_block(parent);
>>   
>> -		if (offset < drm_buddy_block_offset(node))
>> +		if (drm_buddy_block_offset(block) < drm_buddy_block_offset(node))
>>   			link = &parent->rb_left;
>>   		else
>>   			link = &parent->rb_right;
>> @@ -106,27 +147,17 @@ static void rbtree_insert(struct drm_buddy *mm,
>>   static void rbtree_remove(struct drm_buddy *mm,
>>   			  struct drm_buddy_block *block)
>>   {
>> +	unsigned int order = drm_buddy_block_order(block);
>>   	struct rb_root *root;
>> +	enum free_tree tree;
>>   
>> -	root = &mm->free_tree[drm_buddy_block_order(block)];
>> -	rb_erase(&block->rb, root);
>> +	tree = get_block_tree(block);
>> +	root = &mm->free_trees[tree][order];
>>   
>> +	rb_erase(&block->rb, root);
>>   	RB_CLEAR_NODE(&block->rb);
>>   }
>>   
>> -static inline struct drm_buddy_block *
>> -rbtree_last_entry(struct drm_buddy *mm, unsigned int order)
>> -{
>> -	struct rb_node *node = rb_last(&mm->free_tree[order]);
>> -
>> -	return node ? rb_entry(node, struct drm_buddy_block, rb) : NULL;
>> -}
>> -
>> -static bool rbtree_is_empty(struct drm_buddy *mm, unsigned int order)
>> -{
>> -	return RB_EMPTY_ROOT(&mm->free_tree[order]);
>> -}
>> -
>>   static void clear_reset(struct drm_buddy_block *block)
>>   {
>>   	block->header &= ~DRM_BUDDY_HEADER_CLEAR;
>> @@ -149,10 +180,13 @@ static void mark_allocated(struct drm_buddy *mm,
>>   static void mark_free(struct drm_buddy *mm,
>>   		      struct drm_buddy_block *block)
>>   {
>> +	enum free_tree tree;
>> +
>>   	block->header &= ~DRM_BUDDY_HEADER_STATE;
>>   	block->header |= DRM_BUDDY_FREE;
>>   
>> -	rbtree_insert(mm, block);
>> +	tree = get_block_tree(block);
>> +	rbtree_insert(mm, block, tree);
>>   }
>>   
>>   static void mark_split(struct drm_buddy *mm,
>> @@ -238,6 +272,7 @@ static int __force_merge(struct drm_buddy *mm,
>>   			 u64 end,
>>   			 unsigned int min_order)
>>   {
>> +	enum free_tree tree;
>>   	unsigned int order;
>>   	int i;
>>   
>> @@ -247,50 +282,49 @@ static int __force_merge(struct drm_buddy *mm,
>>   	if (min_order > mm->max_order)
>>   		return -EINVAL;
>>   
>> -	for (i = min_order - 1; i >= 0; i--) {
>> -		struct drm_buddy_block *block, *prev_block, *first_block;
>> +	for_each_free_tree(tree) {
>> +		for (i = min_order - 1; i >= 0; i--) {
>> +			struct rb_root *root = &mm->free_trees[tree][i];
>> +			struct drm_buddy_block *block, *prev_block;
>>   
>> -		first_block = rb_entry(rb_first(&mm->free_tree[i]), struct drm_buddy_block, rb);
>> +			for_each_rb_free_block_reverse_safe(block, prev_block, root, rb) {
>> +				struct drm_buddy_block *buddy;
>> +				u64 block_start, block_end;
>>   
>> -		for_each_rb_free_block_reverse_safe(block, prev_block, &mm->free_tree[i], rb) {
>> -			struct drm_buddy_block *buddy;
>> -			u64 block_start, block_end;
>> -
>> -			if (!block->parent)
>> -				continue;
>> +				if (!block->parent)
>> +					continue;
>>   
>> -			block_start = drm_buddy_block_offset(block);
>> -			block_end = block_start + drm_buddy_block_size(mm, block) - 1;
>> +				block_start = drm_buddy_block_offset(block);
>> +				block_end = block_start + drm_buddy_block_size(mm, block) - 1;
>>   
>> -			if (!contains(start, end, block_start, block_end))
>> -				continue;
>> +				if (!contains(start, end, block_start, block_end))
>> +					continue;
>>   
>> -			buddy = __get_buddy(block);
>> -			if (!drm_buddy_block_is_free(buddy))
>> -				continue;
>> +				buddy = __get_buddy(block);
>> +				if (!drm_buddy_block_is_free(buddy))
>> +					continue;
>>   
>> -			WARN_ON(drm_buddy_block_is_clear(block) ==
>> -				drm_buddy_block_is_clear(buddy));
>> +				WARN_ON(drm_buddy_block_is_clear(block) ==
>> +					drm_buddy_block_is_clear(buddy));
>>   
>> -			/*
>> -			 * If the prev block is same as buddy, don't access the
>> -			 * block in the next iteration as we would free the
>> -			 * buddy block as part of the free function.
>> -			 */
>> -			if (prev_block && prev_block == buddy) {
>> -				if (prev_block != first_block)
>> -					prev_block = rb_entry(rb_prev(&prev_block->rb),
>> -							      struct drm_buddy_block,
>> -							      rb);
>> -			}
>> +				/*
>> +				 * If the prev block is same as buddy, don't access the
>> +				 * block in the next iteration as we would free the
>> +				 * buddy block as part of the free function.
>> +				 */
>> +				if (prev_block && prev_block == buddy) {
>> +					if (prev_block != rbtree_first_free_block(root))
>> +						prev_block = rbtree_prev_free_block(&prev_block->rb);
>> +				}
>>   
>> -			rbtree_remove(mm, block);
>> -			if (drm_buddy_block_is_clear(block))
>> -				mm->clear_avail -= drm_buddy_block_size(mm, block);
>> +				rbtree_remove(mm, block);
>> +				if (drm_buddy_block_is_clear(block))
>> +					mm->clear_avail -= drm_buddy_block_size(mm, block);
>>   
>> -			order = __drm_buddy_free(mm, block, true);
>> -			if (order >= min_order)
>> -				return 0;
>> +				order = __drm_buddy_free(mm, block, true);
>> +				if (order >= min_order)
>> +					return 0;
>> +			}
>>   		}
>>   	}
>>   
>> @@ -311,7 +345,7 @@ static int __force_merge(struct drm_buddy *mm,
>>    */
>>   int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size)
>>   {
>> -	unsigned int i;
>> +	unsigned int i, j;
>>   	u64 offset;
>>   
>>   	if (size < chunk_size)
>> @@ -333,14 +367,16 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size)
>>   
>>   	BUG_ON(mm->max_order > DRM_BUDDY_MAX_ORDER);
>>   
>> -	mm->free_tree = kmalloc_array(mm->max_order + 1,
>> -				      sizeof(struct rb_root),
>> -				      GFP_KERNEL);
>> -	if (!mm->free_tree)
>> -		return -ENOMEM;
>> +	for (i = 0; i < MAX_FREE_TREES; i++) {
>> +		mm->free_trees[i] = kmalloc_array(mm->max_order + 1,
>> +						  sizeof(struct rb_root),
>> +						  GFP_KERNEL);
>> +		if (!mm->free_trees[i])
>> +			goto out_free_tree;
>>   
>> -	for (i = 0; i <= mm->max_order; ++i)
>> -		mm->free_tree[i] = RB_ROOT;
>> +		for (j = 0; j <= mm->max_order; ++j)
>> +			mm->free_trees[i][j] = RB_ROOT;
>> +	}
>>   
>>   	mm->n_roots = hweight64(size);
>>   
>> @@ -388,7 +424,8 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size)
>>   		drm_block_free(mm, mm->roots[i]);
>>   	kfree(mm->roots);
>>   out_free_tree:
>> -	kfree(mm->free_tree);
>> +	while (i--)
>> +		kfree(mm->free_trees[i]);
>>   	return -ENOMEM;
>>   }
>>   EXPORT_SYMBOL(drm_buddy_init);
>> @@ -424,8 +461,9 @@ void drm_buddy_fini(struct drm_buddy *mm)
>>   
>>   	WARN_ON(mm->avail != mm->size);
>>   
>> +	for (i = 0; i < MAX_FREE_TREES; i++)
>> +		kfree(mm->free_trees[i]);
>>   	kfree(mm->roots);
>> -	kfree(mm->free_tree);
>>   }
>>   EXPORT_SYMBOL(drm_buddy_fini);
>>   
>> @@ -449,8 +487,7 @@ static int split_block(struct drm_buddy *mm,
>>   		return -ENOMEM;
>>   	}
>>   
>> -	mark_free(mm, block->left);
>> -	mark_free(mm, block->right);
>> +	mark_split(mm, block);
>>   
>>   	if (drm_buddy_block_is_clear(block)) {
>>   		mark_cleared(block->left);
>> @@ -458,7 +495,8 @@ static int split_block(struct drm_buddy *mm,
>>   		clear_reset(block);
>>   	}
>>   
>> -	mark_split(mm, block);
>> +	mark_free(mm, block->left);
>> +	mark_free(mm, block->right);
>>   
>>   	return 0;
>>   }
>> @@ -491,6 +529,7 @@ EXPORT_SYMBOL(drm_get_buddy);
>>    */
>>   void drm_buddy_reset_clear(struct drm_buddy *mm, bool is_clear)
>>   {
>> +	enum free_tree src_tree, dst_tree;
>>   	u64 root_size, size, start;
>>   	unsigned int order;
>>   	int i;
>> @@ -505,19 +544,24 @@ void drm_buddy_reset_clear(struct drm_buddy *mm, bool is_clear)
>>   		size -= root_size;
>>   	}
>>   
>> +	src_tree = is_clear ? DIRTY_TREE : CLEAR_TREE;
>> +	dst_tree = is_clear ? CLEAR_TREE : DIRTY_TREE;
>> +
>>   	for (i = 0; i <= mm->max_order; ++i) {
>> +		struct rb_root *root = &mm->free_trees[src_tree][i];
>>   		struct drm_buddy_block *block;
>>   
>> -		for_each_rb_free_block_reverse(block, &mm->free_tree[i], rb) {
>> -			if (is_clear != drm_buddy_block_is_clear(block)) {
>> -				if (is_clear) {
>> -					mark_cleared(block);
>> -					mm->clear_avail += drm_buddy_block_size(mm, block);
>> -				} else {
>> -					clear_reset(block);
>> -					mm->clear_avail -= drm_buddy_block_size(mm, block);
>> -				}
>> +		for_each_rb_free_block_reverse(block, root, rb) {
>> +			rbtree_remove(mm, block);
>> +			if (is_clear) {
>> +				mark_cleared(block);
>> +				mm->clear_avail += drm_buddy_block_size(mm, block);
>> +			} else {
>> +				clear_reset(block);
>> +				mm->clear_avail -= drm_buddy_block_size(mm, block);
>>   			}
>> +
>> +			rbtree_insert(mm, block, dst_tree);
>>   		}
>>   	}
>>   }
>> @@ -707,23 +751,17 @@ __drm_buddy_alloc_range_bias(struct drm_buddy *mm,
>>   }
>>   
>>   static struct drm_buddy_block *
>> -get_maxblock(struct drm_buddy *mm, unsigned int order,
>> -	     unsigned long flags)
>> +get_maxblock(struct drm_buddy *mm,
>> +	     unsigned int order,
>> +	     enum free_tree tree)
>>   {
>>   	struct drm_buddy_block *max_block = NULL, *block = NULL;
>> +	struct rb_root *root;
>>   	unsigned int i;
>>   
>>   	for (i = order; i <= mm->max_order; ++i) {
>> -		struct drm_buddy_block *tmp_block;
>> -
>> -		for_each_rb_free_block_reverse(tmp_block, &mm->free_tree[i], rb) {
>> -			if (block_incompatible(tmp_block, flags))
>> -				continue;
>> -
>> -			block = tmp_block;
>> -			break;
>> -		}
>> -
>> +		root = &mm->free_trees[tree][i];
>> +		block = rbtree_last_free_block(root);
>>   		if (!block)
>>   			continue;
>>   
>> @@ -747,39 +785,37 @@ alloc_from_freetree(struct drm_buddy *mm,
>>   		    unsigned long flags)
>>   {
>>   	struct drm_buddy_block *block = NULL;
>> +	struct rb_root *root;
>> +	enum free_tree tree;
>>   	unsigned int tmp;
>>   	int err;
>>   
>> +	tree = (flags & DRM_BUDDY_CLEAR_ALLOCATION) ? CLEAR_TREE : DIRTY_TREE;
>> +
>>   	if (flags & DRM_BUDDY_TOPDOWN_ALLOCATION) {
>> -		block = get_maxblock(mm, order, flags);
>> +		block = get_maxblock(mm, order, tree);
>>   		if (block)
>>   			/* Store the obtained block order */
>>   			tmp = drm_buddy_block_order(block);
>>   	} else {
>>   		for (tmp = order; tmp <= mm->max_order; ++tmp) {
>> -			struct drm_buddy_block *tmp_block;
>> -
>> -			for_each_rb_free_block_reverse(tmp_block, &mm->free_tree[tmp], rb) {
>> -				if (block_incompatible(tmp_block, flags))
>> -					continue;
>> -
>> -				block = tmp_block;
>> -				break;
>> -			}
>> -
>> +			/* Get RB tree root for this order and tree */
>> +			root = &mm->free_trees[tree][tmp];
>> +			block = rbtree_last_free_block(root);
>>   			if (block)
>>   				break;
>>   		}
>>   	}
>>   
>>   	if (!block) {
>> -		/* Fallback method */
>> +		/* Try allocating from the other tree */
>> +		tree = (tree == CLEAR_TREE) ? DIRTY_TREE : CLEAR_TREE;
>> +
>>   		for (tmp = order; tmp <= mm->max_order; ++tmp) {
>> -			if (!rbtree_is_empty(mm, tmp)) {
>> -				block = rbtree_last_entry(mm, tmp);
>> -				if (block)
>> -					break;
>> -			}
>> +			root = &mm->free_trees[tree][tmp];
>> +			block = rbtree_last_free_block(root);
>> +			if (block)
>> +				break;
>>   		}
>>   
>>   		if (!block)
>> @@ -923,6 +959,7 @@ static int __alloc_contig_try_harder(struct drm_buddy *mm,
>>   	u64 rhs_offset, lhs_offset, lhs_size, filled;
>>   	struct drm_buddy_block *block;
>>   	LIST_HEAD(blocks_lhs);
>> +	enum free_tree tree;
>>   	unsigned long pages;
>>   	unsigned int order;
>>   	u64 modify_size;
>> @@ -934,34 +971,39 @@ static int __alloc_contig_try_harder(struct drm_buddy *mm,
>>   	if (order == 0)
>>   		return -ENOSPC;
>>   
>> -	if (rbtree_is_empty(mm, order))
>> +	if (rbtree_is_empty(&mm->free_trees[CLEAR_TREE][order]) &&
>> +	    rbtree_is_empty(&mm->free_trees[DIRTY_TREE][order]))
>>   		return -ENOSPC;
>>   
>> -	for_each_rb_free_block_reverse(block, &mm->free_tree[order], rb) {
>> -		/* Allocate blocks traversing RHS */
>> -		rhs_offset = drm_buddy_block_offset(block);
>> -		err =  __drm_buddy_alloc_range(mm, rhs_offset, size,
>> -					       &filled, blocks);
>> -		if (!err || err != -ENOSPC)
>> -			return err;
>> -
>> -		lhs_size = max((size - filled), min_block_size);
>> -		if (!IS_ALIGNED(lhs_size, min_block_size))
>> -			lhs_size = round_up(lhs_size, min_block_size);
>> -
>> -		/* Allocate blocks traversing LHS */
>> -		lhs_offset = drm_buddy_block_offset(block) - lhs_size;
>> -		err =  __drm_buddy_alloc_range(mm, lhs_offset, lhs_size,
>> -					       NULL, &blocks_lhs);
>> -		if (!err) {
>> -			list_splice(&blocks_lhs, blocks);
>> -			return 0;
>> -		} else if (err != -ENOSPC) {
>> +	for_each_free_tree(tree) {
>> +		struct rb_root *root = &mm->free_trees[tree][order];
>> +
>> +		for_each_rb_free_block_reverse(block, root, rb) {
>> +			/* Allocate blocks traversing RHS */
>> +			rhs_offset = drm_buddy_block_offset(block);
>> +			err =  __drm_buddy_alloc_range(mm, rhs_offset, size,
>> +						       &filled, blocks);
>> +			if (!err || err != -ENOSPC)
>> +				return err;
>> +
>> +			lhs_size = max((size - filled), min_block_size);
>> +			if (!IS_ALIGNED(lhs_size, min_block_size))
>> +				lhs_size = round_up(lhs_size, min_block_size);
>> +
>> +			/* Allocate blocks traversing LHS */
>> +			lhs_offset = drm_buddy_block_offset(block) - lhs_size;
>> +			err =  __drm_buddy_alloc_range(mm, lhs_offset, lhs_size,
>> +						       NULL, &blocks_lhs);
>> +			if (!err) {
>> +				list_splice(&blocks_lhs, blocks);
>> +				return 0;
>> +			} else if (err != -ENOSPC) {
>> +				drm_buddy_free_list_internal(mm, blocks);
>> +				return err;
>> +			}
>> +			/* Free blocks for the next iteration */
>>   			drm_buddy_free_list_internal(mm, blocks);
>> -			return err;
>>   		}
>> -		/* Free blocks for the next iteration */
>> -		drm_buddy_free_list_internal(mm, blocks);
>>   	}
>>   
>>   	return -ENOSPC;
>> @@ -1266,6 +1308,7 @@ EXPORT_SYMBOL(drm_buddy_block_print);
>>    */
>>   void drm_buddy_print(struct drm_buddy *mm, struct drm_printer *p)
>>   {
>> +	enum free_tree tree;
>>   	int order;
>>   
>>   	drm_printf(p, "chunk_size: %lluKiB, total: %lluMiB, free: %lluMiB, clear_free: %lluMiB\n",
>> @@ -1273,11 +1316,16 @@ void drm_buddy_print(struct drm_buddy *mm, struct drm_printer *p)
>>   
>>   	for (order = mm->max_order; order >= 0; order--) {
>>   		struct drm_buddy_block *block;
>> +		struct rb_root *root;
>>   		u64 count = 0, free;
>>   
>> -		for_each_rb_free_block(block, &mm->free_tree[order], rb) {
>> -			BUG_ON(!drm_buddy_block_is_free(block));
>> -			count++;
>> +		for_each_free_tree(tree) {
>> +			root = &mm->free_trees[tree][order];
>> +
>> +			for_each_rb_free_block(block, root, rb) {
>> +				BUG_ON(!drm_buddy_block_is_free(block));
>> +				count++;
>> +			}
>>   		}
>>   
>>   		drm_printf(p, "order-%2d ", order);
>> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
>> index 091823592034..2fc1cc7b78bf 100644
>> --- a/include/drm/drm_buddy.h
>> +++ b/include/drm/drm_buddy.h
>> @@ -14,6 +14,12 @@
>>   
>>   #include <drm/drm_print.h>
>>   
>> +enum free_tree {
>> +	CLEAR_TREE = 0,
>> +	DIRTY_TREE,
>> +	MAX_FREE_TREES,
> Those are quite generic enum and enumerator names for a very specific
> header and usage.
>
> And really this whole enum should be an implementation detail.
>
>> +};
>> +
>>   #define range_overflows(start, size, max) ({ \
>>   	typeof(start) start__ = (start); \
>>   	typeof(size) size__ = (size); \
>> @@ -73,7 +79,7 @@ struct drm_buddy_block {
>>    */
>>   struct drm_buddy {
>>   	/* Maintain a free list for each order. */
>> -	struct rb_root *free_tree;
>> +	struct rb_root *free_trees[MAX_FREE_TREES];
>>   
>>   	/*
>>   	 * Maintain explicit binary tree(s) to track the allocation of the

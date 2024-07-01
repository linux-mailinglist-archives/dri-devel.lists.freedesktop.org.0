Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEAA791DE39
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2024 13:40:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B995B10E3BD;
	Mon,  1 Jul 2024 11:40:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vFg05ca7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2043.outbound.protection.outlook.com [40.107.244.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B428610E3BD
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2024 11:40:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AhVlyfkk/i9hfR5cwWH9ZaoSoAwel3Lur4HJsKefisNGhv95xlE3vt8AL176RYJR+wLuyr9ktcjaqaVeaqssdPcgMWgTlpg/J3zzuOSG0gkYixj/fkuKYbnTtAGJw8HDampm9HBJohzD9vLktbKs1f7VIZCWWbjtSGP32pUNRKU229+wmkYD70kcUsf1s+myNjiukyEEGTULabXTJoircpvqYU2LFinqEdSz2lmpNbsV2tLNiHMxhYFpA/P4DDVkF0qoPQ2VBsVIjhWkHyBXGFh/CE/YxZp2fUA8h7moTAyBpA7Ofoh8RBdUJ4P/nI0V4IE01RALfxCyILwKDbxaPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C2NIjUXwX5jSTe+Ffjd86emPikaNnxEXMZyVyowURIw=;
 b=Ne89dxNQinhexxe63q16muySLQgki31dd0G3xaAY7LCEWFKcrkTZ37YgSQQ8lhkdEeicBd7qTUy7TU1z4pBb5VTjUysKHaMWOqaamidv3ZMCeZrsCxvcfzG6vtr5ZTtc20oNjN7OhJgyKLuI0mEPIUHRb0g8pl8LAztBDvnUPs6PbaWwdku22hxts/RFda2/fY3wTTb6iCSP3BKhYnv9OjXXGLLsEWYbZ2HqhDHnHHo1I6IfTkJ89cQCU9r65yn0nDxrOE6gROUDrCYyUbhE2DHFVPciVrwDQ6jThd4RCaaUiJYRyVqv4EBvaJ3RbbHA/VMFSlxV8cRHNhC9mCaYhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C2NIjUXwX5jSTe+Ffjd86emPikaNnxEXMZyVyowURIw=;
 b=vFg05ca72598x4ptDT3KDEe2hTHkYNkdahwfiYNFaMEivfDBZahWn3CcCo92+uw2lDnPygsCNuiUVIrKjFRdkp1+CEBd12NLjUfUW2FJiwwHxXVmFyiM/ecNDITuW329M6Kl2FHwc0inWZZ7DAVvcSAM6llrqNUAa7uL9T6k/Tw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA1PR12MB6306.namprd12.prod.outlook.com (2603:10b6:208:3e6::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.32; Mon, 1 Jul
 2024 11:40:40 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%6]) with mapi id 15.20.7719.028; Mon, 1 Jul 2024
 11:40:40 +0000
Message-ID: <7e30177b-ff13-4fed-aa51-47a9cbd5d572@amd.com>
Date: Mon, 1 Jul 2024 13:40:34 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/2] drm/ttm: downgrade cached to write_combined when
 snooping not available
To: Icenowy Zheng <uwu@icenowy.me>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Huang Rui <ray.huang@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240629052247.2653363-1-uwu@icenowy.me>
 <20240629052247.2653363-3-uwu@icenowy.me>
 <a143a2c3-c6f0-4537-acc6-94f229f14639@app.fastmail.com>
 <2760BA02-8FF8-4B29-BFE2-1322B5BFB6EC@icenowy.me>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <2760BA02-8FF8-4B29-BFE2-1322B5BFB6EC@icenowy.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0223.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA1PR12MB6306:EE_
X-MS-Office365-Filtering-Correlation-Id: 699725c7-8991-4e3b-1a79-08dc99c2a20c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UW12QnZKQlRHNUZrZXhLblVkZ3JrR3g3L3FsSUlIWGJiYjQ2Yk5SSTd1aWtm?=
 =?utf-8?B?Vkx3T3k3WUcyUVVIQ01OS0pkQjdMeGFLblM0cGRmYm1HczVDUm0xdnhXSStE?=
 =?utf-8?B?aWYzdmFrQ0ZuRkExZzlPclNUalUwaXl3azFheDczUklWekJ2cGpqSER4L2g1?=
 =?utf-8?B?ZUhJUm5Eb2V1VDYzNWxjUTRNcHRCcFlEY1l5aHA3ZXRJY0hmUFkwTmlSaEFw?=
 =?utf-8?B?Vm1na0hHOXhlMHNqeHd3Z3hTRUl2RWI5MktiaFFGVGdOSUlQa2ZJc25vbmpp?=
 =?utf-8?B?b1VjZnczRG8yc1lRTElwVmlpWlRFQlpIMXVFZU1tUWhvemswWCtZVlVSOWU4?=
 =?utf-8?B?M2c5am5YY0YyTG53MWdacHBxNEVLVmxISk5CUS9pWUd6d0V4NkhFd0kzaC9V?=
 =?utf-8?B?ZlB1Vko4UERZWnZjTGZZVExOYWN2dFAzMmtvSW8vd0pqOSswMThObGw4dHhI?=
 =?utf-8?B?OXd5TTF3TER6L0xhaWJocTdycUdoMHdlb0VwRTdjenMyczVpVTkrdVhvMnl2?=
 =?utf-8?B?MWpkOEJEQTlIbEhmc1g4enB0czU5aFJzQmtTTGNNdW14QitQVDVjQW5ISTg1?=
 =?utf-8?B?Sm1EMHBFQzJUZnREK1MzV3R4TnZMZ0RrcDRaaThhaDRlRnpKTzJrTWc2YzA5?=
 =?utf-8?B?R3N4N2tPUS9NUmpJZTdueDlDWEIrVFUzRXA5aS9oNUZ0TjdCYkZJd1dUSXVR?=
 =?utf-8?B?clU3Vm45bG9ubkhaL1pDcFdXbWVEdTJOazErLzZPTUxrNFpBQ21TbTZmcU1M?=
 =?utf-8?B?UDBQTjQ1cjNFM3AwUXJSSktibEFqUjljMnJhWU1ndUNpZk1FT0pIY2tMVkN0?=
 =?utf-8?B?Q3ZlNE1XSXVQTW1Cem1pVmdKOGNXZzd0alI0bUYrTzNMcXpLSWZOT0tNSUpB?=
 =?utf-8?B?U3JZSWVlbDFkdTZ6cGgxNkFUTmVhZHJqOXEwK3o0aEU3V3VsUUh1NXpSdmZC?=
 =?utf-8?B?N2c5bzlKaHJnU2ZCNUU0eGc1SXhJeU95eGJrS3N5LzlxZHNkU3FkVGoxWTFJ?=
 =?utf-8?B?a3RNcTNOMitseXBiR1BVcnd1Y25OUkFNTXp0MTJRYVBOSTRZblp2OG1NektN?=
 =?utf-8?B?NncwaVFWVFZkMnc5dEdwN1NpbWhoMzlxUlFWbVRxMWJ2bnN6YXRNcTVCQnZo?=
 =?utf-8?B?RGE2NW5pYnN3Smw2by9HamNkSURqZjIrbHVuTzBMcHlFUmtuYnZ0NmhVSGov?=
 =?utf-8?B?MGpoNlQ5VTIwRlhPZmRLdEtjQVhnK2UwV2RMeGplOTZsTk12YnZucHBKMzVW?=
 =?utf-8?B?VUNBcmFjV0l0bkZqbkNvbWRMbDlJcHFBL2ZIaUV3SDREdDIxelU3ZUxiQmpD?=
 =?utf-8?B?TC9mc2dJaGw4ZFlLM1V2UEh1MVcrWFltTWNic1RWZk9CNk0yNC9hbS9yOW1P?=
 =?utf-8?B?OEpxYTJNR2c5N3FwTHZNcG96WDA4TXRUNktCNjQ1cGNEMzJ6WUJQVlV5SFVW?=
 =?utf-8?B?K1lhaWhRWnRTYlBFK3BTOUMveVllZytlT2lYYmdpRWVidFc5MkhvTGxEUURC?=
 =?utf-8?B?OCtLKy9ob0tVM1ZVamlFTWZGRklpUDI3bTdkYi9Xb2hhcXZjb29TUncySFNi?=
 =?utf-8?B?RzJiczR1NDVncTRNWmJYU2JNRHJZZ3ZoNGc4NmpPdmVoMFU0WkR0TFdBK0l0?=
 =?utf-8?B?VHFKY3dwS3Q1MVV4SytPd2tCekJKS2RBNzkyZ3BFOTNRU29FdnBvSUYrSStk?=
 =?utf-8?B?Tmo3aHIwamtPekZBUmFFWndZb0c3Ni9VbWJnc0hRSnpGeGJFU3p2M1F0dExG?=
 =?utf-8?B?VHFuZ2NXRWlTL2xlZ1N0ZmFPRGxSMGFpTWN6V2x2WVhsQXNyTnJTSjZaTHE0?=
 =?utf-8?B?bUdsblpBWTE0T3F2OEhkQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OHh6RnV0WXdBVWJzbHUyeEpBZjBVek51cWlmTXYxUFpiSUt2dTk0Nk9CYzNn?=
 =?utf-8?B?dWtDT09JbEtPeCtQdEY0NnYwYVVkbG9SZXJhSVQycDh4WlRUUTZ1cHJNVk1j?=
 =?utf-8?B?emtvWW8xRmgyQTlQUGZZVWlHMlVLR09nV25sN2loQitDTHJIUkNUZTQ1UlZX?=
 =?utf-8?B?VGpueHNPS2ZLNjR5YTdWS3dNNzNxWG1ZVmFjanJwRkorMHI0RTRTbDBoUHF3?=
 =?utf-8?B?QlRwa1pmdjVLR1BzNTUvSVdHT2hxbXpaV3pjajFYcDVqc3FHR2Frcmo3Z3RJ?=
 =?utf-8?B?RmNaRVVRNjgvVWQyT3gvaXVIbEM3S2ZWbUVvRkdRdWJqTmZnbGFNQmZnK1JZ?=
 =?utf-8?B?VlpwcVBzRjlvY2Nhem51NEMyeTBobkZGSkIxaEhXcUQzK0lLRnhtSTdSSU9k?=
 =?utf-8?B?RVVkUHVWMTFZY3YzSnFhQkZqZjZUOHpUZkdFODZubVZWWWRZdlIzNWhrdzBV?=
 =?utf-8?B?VHkzL2ZFMGRINWgreldVOGJsTG9BTk12MFdZcjNyT25pZVV0VzdQWUhWL3lw?=
 =?utf-8?B?V0lra2pQTmxVY3VVSXgwSkJiWWhKSGNuc0xjbUVtR2lvOExTVEJtV010SVZY?=
 =?utf-8?B?WHV0VjFQUjZTcEZMMHNCdThRRVdJcGtaUzVqMzNicHhjUk8rOTk0UXdnQzE5?=
 =?utf-8?B?VGJ0alUvQ2YzY2VkcU1GUFdNdmZRV1Q4cVk2bFBCN2NTQjkyemV1a1NuQUpa?=
 =?utf-8?B?ZmF2MjBpQ1BMMlE1dFU1NW51aWl3QjdlUmJzMHVDUmRJUkpkVzY0ZDZNcHpD?=
 =?utf-8?B?YzZ0Sm95RUdlSnFFeUk5TjZSRUNTWXRqMVpOclVUSGhOY0M2eVlCeE83U2cz?=
 =?utf-8?B?Y3JHYlZSUFlYOTdxY3VTVS9Hc2loTDY5MEVRbjkrcXlPM25GZ01XSndTV1Z6?=
 =?utf-8?B?Q05DR1M0c3ZsOWFHZW4vNXBQSVNJWGRreXR5S3hHSklGaU1yTkRPdForY2ZB?=
 =?utf-8?B?Zmd2eGY1a2syYXZIblRETm5GVGFOOGVNQm9HOE1PSU9BMy9vTXlaL09SMmtz?=
 =?utf-8?B?ajVYcmc2ZzZsdGRJbDV1WjRBMkZSUEpUOTlYL2c2dGNYWkpRMURBMjRDdzhx?=
 =?utf-8?B?V3U1UnFaYWJMaG5jRkxSN1NvdzJXUERUa2xUNUxPeHJFYW5WZ24vMnVNcmdI?=
 =?utf-8?B?WHlzOXQwSGhqb3I4QlBOd2MyTEwzTGJGNXhaVVg0WjYveUl6UkNKUThRaS9Z?=
 =?utf-8?B?TEtCUGRaaEZTd010a3FXT0V2VVJTd3hjMnBVeS93T0xudjlic2VPTjM5OTU0?=
 =?utf-8?B?aWRwYVVtSWdvUDZYTWxPS0ZLcUx6SDNsRGJxQmZEdGVVUXY4akxiWkpXRkxW?=
 =?utf-8?B?WWxwT25EYkxqamlsdk9TeWZyc2lSend1N2QrODFWMkFPbUhxM1VwbVd5V3JL?=
 =?utf-8?B?M29XZ0xUbFZsWDk0S1hEaUZCbkRKY0ZYYUQyU0U4NWZsUU44cmh1TUNnWGhG?=
 =?utf-8?B?NC9ERlQ4V01MNnBoLzZMeDYrSXRFN0ZNOTJEajdHblVKWjdhM29UQWRNakdn?=
 =?utf-8?B?eHY2OUQzTFFjaTh0bE5vV3dwZUhyckhFK3NQcDlybmE1S052OUswb2pmQnd1?=
 =?utf-8?B?bGQxQW16QUVRbVhNYVpCZDZiNlluQ2ZjcFZ6SG83MFlHYTBPRTZrdTUwNkE3?=
 =?utf-8?B?Zy83SkhyMGt6ZWxlTW1wQldRNHkydzdrbWtyV3REaTZOVXRzWWtONnJKQ1J1?=
 =?utf-8?B?SjZjVStMc21TZVV6czhwcTIrdk9PNHJzSEFhcENSZEdSOElpMm9jdHQybFVZ?=
 =?utf-8?B?bmwxV3ZxSlc5YUh4UmRmcldzVkZqVmpWV2lTRmx6a0lFQXFKZXgwM21COFBO?=
 =?utf-8?B?MzljVHliN241S0VPNjlsV3ZyZ2UyUUh3bUhJU2Y2RkN5RU5uRUd2QmEzQU1V?=
 =?utf-8?B?akR2YnZXeE5vSG4xdndxUGNIa25Ca0R6N0NWbnA3b1NBYzJoaE9ZcFdUaHNO?=
 =?utf-8?B?VVFIeGEwM2hkdWFIUjlwaEhNam1VZHpYQ1FoZi9BSzJpTkZHTi9hdHBmR0NW?=
 =?utf-8?B?eHhKZkZnUXU2dTJIWW5qaWdyd0luTTRnbGV1cXZ3WDFRSTNoa3UxU3JqbVJN?=
 =?utf-8?B?ajlNdzhsanIvNkFUWXFNUXczNkNRUmsyUXZxZFYvT2FCRk1lamZOZjJLeisx?=
 =?utf-8?Q?FvmCttu7XmLY5OVv7Vlr57n8x?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 699725c7-8991-4e3b-1a79-08dc99c2a20c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2024 11:40:40.2735 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YlOqD3aZH9KGUUNw5sa0JFmdHj8+orPHuaNOshMClc3UiT1sMAEXBuErxSlg5Ogu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6306
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

Am 29.06.24 um 22:51 schrieb Icenowy Zheng:
>
> 于 2024年6月30日 GMT+08:00 03:57:47，Jiaxun Yang <jiaxun.yang@flygoat.com> 写道：
>>
>> 在2024年6月29日六月 上午6:22，Icenowy Zheng写道：
>> [...]
>>> @@ -302,6 +302,10 @@ pgprot_t ttm_io_prot(struct ttm_buffer_object *bo,
>>> struct ttm_resource *res,
>>>   		caching = res->bus.caching;
>>>   	}
>>>
>>> +	/* Downgrade cached mapping for non-snooping devices */
>>> +	if (!bo->bdev->dma_coherent && caching == ttm_cached)
>>> +		caching = ttm_write_combined;
>> Hi Icenowy,
>>
>> Thanks for your patch! You saved many non-coh PCIe host implementations a day!.

Ah, wait a second.

Such a thing as non-coherent PCIe implementation doesn't exist. The PCIe 
specification makes it mandatory for memory access to be cache coherent.

There are a bunch of non-compliant PCIe implementations which have 
broken cache coherency, but those explicitly violate the specification 
and because of that are not supported.

Regards,
Christian.

>>
>> Unfortunately I don't think we can safely ttm_cached to ttm_write_comnined, we've
>> had enough drama with write combine behaviour on all different platforms.
>>
>> See drm_arch_can_wc_memory in drm_cache.h.
>>
> Yes this really sounds like an issue.
>
> Maybe the behavior of ttm_write_combined should furtherly be decided
> by drm_arch_can_wc_memory() in case of quirks?
>
>> Thanks
>>
>>> +
>>>   	return ttm_prot_from_caching(caching, tmp);
>>>   }
>>>   EXPORT_SYMBOL(ttm_io_prot);
>>> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
>>> index 7b00ddf0ce49f..3335df45fba5e 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_tt.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
>>> @@ -152,6 +152,10 @@ static void ttm_tt_init_fields(struct ttm_tt *ttm,
>>>   			       enum ttm_caching caching,
>>>   			       unsigned long extra_pages)
>>>   {
>>> +	/* Downgrade cached mapping for non-snooping devices */
>>> +	if (!bo->bdev->dma_coherent && caching == ttm_cached)
>>> +		caching = ttm_write_combined;
>>> +
>>>   	ttm->num_pages = (PAGE_ALIGN(bo->base.size) >> PAGE_SHIFT) + extra_pages;
>>>   	ttm->page_flags = page_flags;
>>>   	ttm->dma_address = NULL;
>>> diff --git a/include/drm/ttm/ttm_caching.h b/include/drm/ttm/ttm_caching.h
>>> index a18f43e93abab..f92d7911f50e4 100644
>>> --- a/include/drm/ttm/ttm_caching.h
>>> +++ b/include/drm/ttm/ttm_caching.h
>>> @@ -47,7 +47,8 @@ enum ttm_caching {
>>>
>>>   	/**
>>>   	 * @ttm_cached: Fully cached like normal system memory, requires that
>>> -	 * devices snoop the CPU cache on accesses.
>>> +	 * devices snoop the CPU cache on accesses. Downgraded to
>>> +	 * ttm_write_combined when the snooping capaiblity is missing.
>>>   	 */
>>>   	ttm_cached
>>>   };
>>> -- 
>>> 2.45.2


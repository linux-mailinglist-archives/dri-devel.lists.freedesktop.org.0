Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DAC5946020
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2024 17:19:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18D4110E164;
	Fri,  2 Aug 2024 15:18:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="FzAmJ0bS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2065.outbound.protection.outlook.com [40.107.95.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1C5C10E164;
 Fri,  2 Aug 2024 15:18:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pi8QEx8rW5Iy/JUtIJn3snNW2kMGwnMhADWTPFeCqcgdNBef/n9pgdzzOXYoqUEy4EK+U1A5Z+Q4PpKl1umfTQnkyD9QoQ51cXv/txOJyAygzKuqUYuir66qGGt+8vLNpKgfXF9CDMfJZQRjIlGD2ODHa3Yu1DVCOUZ1rmzaWGMH1dfFN631nZMrFFtZsNL7S+P4gLvECeeGnc/y518CWvpvfiZXcKibfPFrz7cFQUKSpMuv0Lgqdk/akbt0A0uyjmJe8EWfNV6bren06m0ujGIbQtwtCXoyj5BuSZoCALEIIoYLgKxbvkxFa6zje8NM+jv/MuHudbqY93Pk2cvXiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rDIqfXloUYyFYePGngylALsNkN8Gw6dc+UJqaaa5fYI=;
 b=CpTJE5f2RQ7BcKGlcsGjMKYRpISYCShKlbMRHxmW9CnfirYNtbz44glPBqb5rXtp8kNz6YzSEwx8C4CAH0xfKzvkKLBzxOwhDNtfYeleeSLcr+kKgiSHGhK2y6ozESFuGKNHvi0C6rd6UIkxgSPCIFPzwfjBUEu1ykmqGtUtNAjzCbnGzPlOoHVGYCdDYAqMHOO1J6Uq56VLujbIMQHs/HrqkvFIz0BMxMeuLr8fUUrZ/+a7fhwA+65IjtwbBJYGdHeHnt/7RBRdXrPeTIGAvY5g9aWv0HNTpy0N9fHCMCOanZE8vfzmQY8eLqSax2BhV0oCC4ESJ5xAAIQ+0JM/hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rDIqfXloUYyFYePGngylALsNkN8Gw6dc+UJqaaa5fYI=;
 b=FzAmJ0bSDCw3JfXVydvRyE0daPuY1JlfpuvNfnMRRKetFBu5fVfwhpCiBT9x1IzUPNVDDJSlk6QMYaRz3ijp+LIzdMOARcCF1V6/ssU75oiZZKYKwm5BsHXhpVWw7b0sYRajkMZL82PMa4HkmnrijfM5ZcYk3Gg6efPlscYTRKg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB6839.namprd12.prod.outlook.com (2603:10b6:806:265::21)
 by CH3PR12MB7641.namprd12.prod.outlook.com (2603:10b6:610:150::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.33; Fri, 2 Aug
 2024 15:18:51 +0000
Received: from SN7PR12MB6839.namprd12.prod.outlook.com
 ([fe80::eaf3:6d41:3ac0:b5f4]) by SN7PR12MB6839.namprd12.prod.outlook.com
 ([fe80::eaf3:6d41:3ac0:b5f4%6]) with mapi id 15.20.7807.026; Fri, 2 Aug 2024
 15:18:51 +0000
Message-ID: <7699dc60-89b7-4387-84e9-50974c345c9e@amd.com>
Date: Fri, 2 Aug 2024 11:18:48 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] Brightness at max level after waking up from sleep
 on AMD Laptop
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: alexander.deucher@amd.com, serg.partizan@gmail.com,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 mario.limonciello@amd.com, ML dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
References: <77KAHS.13UUH2XVHQQF1@gmail.com>
 <245f2c54-6d06-4b71-a9f8-a6fc0dbcceb3@leemhuis.info>
Content-Language: en-US
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <245f2c54-6d06-4b71-a9f8-a6fc0dbcceb3@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0110.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d7::6) To SN7PR12MB6839.namprd12.prod.outlook.com
 (2603:10b6:806:265::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB6839:EE_|CH3PR12MB7641:EE_
X-MS-Office365-Filtering-Correlation-Id: 08d1a9b5-63d0-4bf2-d489-08dcb30669f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a2l6d1grU3JKdStPNEtadXBuNVNhNHRhRlg4QlhyRHBrWkw4Zm9PckpDQlhp?=
 =?utf-8?B?Z2pZTUpISVNwcmE2UTNDU20zdkMycGpPZzh3Umd4VHdZR21zaGE5d1NONEFk?=
 =?utf-8?B?LzVzSGIwekV2WDloREkxY2VlL0hlT1I4emJPTHVqbXNHR3JlNElKdzRlS3ox?=
 =?utf-8?B?TlBtRFRkNEZremY1WDlNZkliQ0svZGZlLzZNN25NTlFtbG0vNFJpRHErNmhp?=
 =?utf-8?B?bDhleU9VaHNjNWV3YS94VnRrUTQvNjlLRUNON2dRQ3VPY0plYnZUOHp0clFB?=
 =?utf-8?B?OUkvWHVIN3o1RmtHVUVJSWZvelE2T1ZWQzlyRHNEUitNWEJRRUVXRE1LNitU?=
 =?utf-8?B?TE51VEdvMDQzaHdGSWpYNVZ6SUQ4MmxKK0VrNmNiY3ZBSWI2ZDN4Nk1TTlo0?=
 =?utf-8?B?cXlOOXpJRWJ5Ymw1dG80akEwVlM2dmxLY0RvZVhnRFRhbk5vSGZMdSthZHRk?=
 =?utf-8?B?S1dRa1l5azZVS2luRDRWb080Tm9HK2NTdXBKS0hGbGt1VXhkRFIzV3RaNzZG?=
 =?utf-8?B?bFpteXhsd2xRZm5Bb1FjY0pEbkszcEpYL3k4UEVTazJPSDNjQjB6U1MrYkR5?=
 =?utf-8?B?Qnc2L2V0cjIwd0tJZUp0anZvQVRDR3Z6ZmJ3c3JINTJHRDRWbTdzVU9lbU9I?=
 =?utf-8?B?c3J6V2hSR09SV05jOXhJdi9sMTliZjZmK3hFWXlrNEdZR0c1a2tKaXZpWFk0?=
 =?utf-8?B?TGRPQkYzdU1QRVdubXhwdFY0ZksxZ1I2dXZlMG4yUkZ2TGQ4VFBlaTJsY2F6?=
 =?utf-8?B?M2VKTXkwa24wSk5xay9QNW1IZkQrM3BEUDlta1FubGk2NGJPZW5SVDByWEo5?=
 =?utf-8?B?V3l4YVJVTmsvQUd1WFIzTFJZbW9GWm5DNzZPZlhHUmU2RzBzaFdZSDBOZkVS?=
 =?utf-8?B?THVJdHlYQ2xJVzVGUURMRVB2Z2daWHhrbzdJWDVTa0lRZU1IVTRIYytOV1kx?=
 =?utf-8?B?enJYZUxOTTNaOFdsWnA3K3NkNllOYS9uKyt0aTBxSFVhdllMNldxRUZsOW15?=
 =?utf-8?B?MjhPb3kzb0FFUkwzM0xCb1h0QzV4L254WE5CSC9xc284NnRTb1pBdzBzaElz?=
 =?utf-8?B?ZUVUVTNYK0I4cVpZR0dnSUV5R1lsYXRlNUlrOHBEMlBGZGJZQmExcVc0YmZX?=
 =?utf-8?B?K1RVTElrbHE2YUljNk4rSlFLRUdTNnlUVzJQNml0VU8yeVBnZ0M1QVdiVS85?=
 =?utf-8?B?RDNnVDQyS1ppbytuM0RYWDJWYWJDWFVPd2gxclVrRjZqbXNQaFNFSm9VM04w?=
 =?utf-8?B?UnE0cDhVUTlBK3I3WGVFQkpTRDArQjJHMDUyVDZJZUdUM1RtVWhIeHFrckdh?=
 =?utf-8?B?SExweXNxank3QjRpY1JBdE1SR3Q3Y2Z3RVdwRWdxcU5uVWdycHo5dEVIZEJB?=
 =?utf-8?B?bVRyTnFDZTJ3ZnplZDVrV2pEVVMxbEk2dWQ1M0hlTUpTaUh5YjBMU3BhVGVM?=
 =?utf-8?B?NWxMYjlyS2tQOXNPRkZMZC9xWkovdGFxZG1qYWJER3h4U2Z6M01VR094aHg5?=
 =?utf-8?B?WXhVdktMVjBuaUFtRnNSQVRpVzRKU2NSZmNSQnZzOUhkYXBXdERPT2lIOG15?=
 =?utf-8?B?clZISmpLSC9TTTNHMGxsYUxZZ0tndHNSaVlBN21uZk8vZ2xwUGpiV0ZQb081?=
 =?utf-8?B?aUJrQTEzRjBJU0hlYXlCQURsemZUYUhXQ1JNOTdLWXBSakkvNk9zSDZBMUhj?=
 =?utf-8?B?d3F5VnRHMzV6SG13Yy9ienZlb09hb2YySGw5Ym9IdEQya0xxNEV6OG16bzFI?=
 =?utf-8?Q?Pkw8YuX9wGytNxs4iw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB6839.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zk5EL0REL1JxdEFEUnRtYWdTYXVBbU1DelUxeHBBUUtPaUhQQzZHajhJV01O?=
 =?utf-8?B?ektpajcwR2QxUVRBSmx3Q2N1akdjMitNOVNXOUNjTFJxbEVRblNyVWJBdHdD?=
 =?utf-8?B?aTVzTjgvYWFLalpOQ2hOWThFWVhKSEd2NnlpdGx0NWhNU0xzSGJEdGNreFln?=
 =?utf-8?B?Um1rb0t0QWpFWE5nNzRmZkF6ZStsc2srQ3VSUDRXMGVFazRCZzRzR2ZYRkNu?=
 =?utf-8?B?MTU0MlR1aWxjY282c1dKQS9MK2dYRENuUmdRUEZtQlVpbmpZemJGVktpS1Zl?=
 =?utf-8?B?bHBGcGZzSnhobEVGbFB6MVZFaFBnU1kxU2xSa3FVZ2ZuS3lRQkVxdnVYakMv?=
 =?utf-8?B?KytDbS94UE5mRjVDUlRyNktmcUUvNzQyU3NEY2VXVjVDeDNUT0IrdkZ6cG1j?=
 =?utf-8?B?WndkazBkeGNCSE5QTGdwOWF0c1AzeThOaER5ZWJ1QmEvNkQ3Z2x6amttbzJC?=
 =?utf-8?B?NnpBdDIyQ1VqS0lSOHdkdURUVURIZUtzcEhId1hYbkEveTFYT0ZFMG9CSW55?=
 =?utf-8?B?bW9POXVXcnR3aXFBMk0yTUgwaHYwK0lzU1VyVm1pUC90RW1FYWZHdUQ3aGJm?=
 =?utf-8?B?b2ROdWI3b1BpSzE1a2RLcngxa2ZIT09EN0Zzc0EvRHA0MXgvOG9GZERWNzYz?=
 =?utf-8?B?anlGNmNMejVtYnVyZCtTeHF0RHJBNlR6eFlXQWJqZzJhRHVBc2w4YS9Rc0Vx?=
 =?utf-8?B?UWFQNjFyMFhFUGFlMldMVE9ZemNpeGNOWDBwNWVaWExKME5WUHRGQUt4alNr?=
 =?utf-8?B?cjlxUlAzZHh6SUs0TTV4cHhvaEM3WVZxNWo3ZmdpbGtjMFM3LzlqUzFBS29M?=
 =?utf-8?B?QUdka1BPVFBmbXJGS0lKU0hUVm5DbFNaR09vQUplS2dpajh5Mkc3OTdXUm1L?=
 =?utf-8?B?UVFrWmkvNkJkYWlsVzgyU28wUTNJdlY4R2gvVFRHNjJlbld1MjRmUHVCMnRL?=
 =?utf-8?B?NitiZVdPTkVPa09OSjBMbmVrbVJUUnp1SXFrcVVtcXppZGpnbi94ZnoyVlBX?=
 =?utf-8?B?R3RSeEY0LzJaSWNkUGlsY3hpZDNiNUNMRmcwb3FMUktETVVaTnhESEhJeFdQ?=
 =?utf-8?B?U0lLd2tVb2c2TXhMV0cvKzI0TWNCc0h0N3hnVE1wMUZhWVpwMmlxWERoVHR6?=
 =?utf-8?B?YzRRQUlxNW5NSHcyTVV5eWU3cXhVdWd1bWJYVWNBR0Z4TzRqdVgvTnZjYm9x?=
 =?utf-8?B?ajV4UkFmQmhVWWNrTjVUZnhMSk9Nc0FIcG93cjlSRW5USGhoQUViZ0N4ZURZ?=
 =?utf-8?B?NjhORkJDTk10aFA2aElteWxDTDhDMlRPeUVxd1RIL21seEdQU0N5aE96a0Ex?=
 =?utf-8?B?VitCQWU1ZXIwenYyQzR5cUtjSjVndEpRVUwxUnJRK25DNjJ1bUorOWJXYVMw?=
 =?utf-8?B?b3MycXlaNVpYSm95MXZBTTJ0bktBRUh6b0VYYWJpNXEzK1FwRkl3eUU0TjlZ?=
 =?utf-8?B?b0ZGVVN2OVRmcUF5WHBJNW41M2NGZTVyNmZHelMrRHZDRGdWZnNONGFQNmV3?=
 =?utf-8?B?VktVTEN3QWFzUkx6bHNMMjBQeSsxdk8zdFlaczVYSmhYSVJZVlc4RkFqTU0r?=
 =?utf-8?B?K3VnbW1DSVlFbzZZV2JVczlyQUVtRWlDQU5UZUxZTzRPb3hOOHZ4VDR5MXlT?=
 =?utf-8?B?NEFlOEVzVnVlTDJtTHpRSW10dnZjWEZ4M2pGREw2TDJQeEI0OFpGL1BwZ1Np?=
 =?utf-8?B?MG9Ic01TYXBWd3NYbk5zdVQ0bUpUY0JadVBQQk1PbUhCSFAwSXVTV1ppNTZX?=
 =?utf-8?B?K3h1MXdDUW03Z1JaS0ZkVlZrSmc5WHozbVpaRk8xVG9zTXF3d1pTNWRVb2dI?=
 =?utf-8?B?Vk0vMmNvbEVOcG9qeTRRQkRrWk53cjJ4dHVtZkRFYlZDcE8vOE5PWDRrUHVC?=
 =?utf-8?B?aDNFa29kQnk4VHJjZUFpTTJrZEtUWWVEOUExMThvSVN0MUN5bS8wWEdPT3Z6?=
 =?utf-8?B?dTdSeDBvZzA5L25yRkNacUZlN2JESEQ5YmNSSGlDRkxJL3BjaWRWZ1Z4aWhh?=
 =?utf-8?B?VE14QldSYitJQmZaYlBIY3pRV3BMMktzZ0hUbWtoQTFUU2Zlc25ZSXdUUnov?=
 =?utf-8?B?M2kvMStYckhxUGdHb3FBeGVMQWlKNlB4UVRVdHNKVEl0Slp6K2V0b3UzUXBr?=
 =?utf-8?Q?2suSW5RA93onXKDqceLryxW+a?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08d1a9b5-63d0-4bf2-d489-08dcb30669f9
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB6839.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 15:18:51.0808 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /yh22VgFKse+K0NQ5OJ6TldoAvKpfOFScI49ZKuLEtctV/L3CXnoNm9Bu/EexjfLh1OWLAQCkgSvDZ+71Y2V4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7641
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

On 7/31/24 02:38, Linux regression tracking (Thorsten Leemhuis) wrote:
> [+amd-glx, +lkml, +dri-devel]
> 
> On 27.07.24 18:52, serg.partizan@gmail.com wrote:
>>
>> After updating from 6.8.9 to 6.9.1 I noticed a bug on my HP Envy x360
>> with AMD Ryzen 5 4500U.
>>
>> [...]
>> After waking up from sleep brightness is set to max level, ignoring
>> previous value.
>>
>> With the help of Arch Linux team, we was able to track bad commit to
>> this:
>> https://gitlab.freedesktop.org/agd5f/linux/-/commit/63d0b87213a0ba241b3fcfba3fe7b0aed0cd1cc5
> 
> Hamza Mahfooz, in case you missed it, that is a patch of yours:
> 63d0b87213a0ba ("drm/amd/display: add panel_power_savings sysfs entry to
> eDP connectors") [v6.9-rc1].

Um, for the time being you should be able to set `amdgpu.abmlevel=0` in
the kernel's cmdline to avoid the issue.

> 
>> I have tested this on latest mainline kernel:
>>
>> Results after waking up:
>>
>>> cat /sys/class/backlight/amdgpu_bl1/{brightness,actual_brightness}
>> 12
>> 252
>>
>> Then, on exact this commit (63d0b87213a0ba241b3fcfba3fe7b0aed0cd1cc5),
>> result is the same.
>>
>> Then, on commit just before this one (aeaf3e6cf842):
>>
>>> cat /sys/class/backlight/amdgpu_bl1/{brightness,actual_brightness}
>> 12
>> 12
>>
>> I hope I included all relevant information, more info can be found here:
>>
>> https://gitlab.archlinux.org/archlinux/packaging/packages/linux/-/issues/52
> 
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> --
> Everything you wanna know about Linux kernel regression tracking:
> https://linux-regtracking.leemhuis.info/about/#tldr
> If I did something stupid, please tell me, as explained on that page.
> 
> P.S.:
> 
> #regzbot introduced: 63d0b87213a0ba241
-- 
Hamza


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBDEA12307
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 12:50:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CDB910E4F4;
	Wed, 15 Jan 2025 11:49:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="mhWd/74B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2413::61d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF98410E4F3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 11:49:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UqkPGUeS1JrjnnCTrAKPLOv8XKdzvmOwUXkpFD2pon7KuIxhI16ro4kQGMSQV1UDXdR5O6boH3vySDYLPUpueiq9ELd1XPB39/hwz349pjY47NAnVKz2WR0PR0vamHOep2zZgP5S/eNqwD1NkQHgOHQdfL15RzEaNZ7D+2iWBHvJK2sKqg9KRiTV2egpuHZI4M2AFXjasBJBTtWFyuRUDF4nGu5iR0TCw3vm0eQZrR1yInpmY8leVhzHYsnF9rOyigbxCZctuVxl321qlnymhlQtnf40ycEPNA2YJ74td5aCOB6zpxTpH+42KbbM5rYStT7WCw4hRWjqzsieWvl7qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g4Ayrrl6vZyHKovxsMwlg8hxyb09bVKOBqgHmF/1tTA=;
 b=MKrE9/+gAoOpLGSowV4OMFzuhksBLJo0U7HgNhvrRMe590gyZGmLcxBCz8dHBc5PQvHSOWT5CuPloC2aE6qwmo8eWuavmjvA+ESyIpSgiSAUA1WR9M39QF0XDMxSDf6eZr0BEizq6eEgX4mZcZGsa/DuZ4knxy2eES5mCQ+ffaTYtQvRranrRWxu30B11EwuzlYAG0A0iiEBCLVAup31JVu5v0u7S/QWJIAo5wRz6U48JT5S84GCqnfAzEKtFbCJ+QFDb/ex5eS1vxRjUFahh69CTAy4B54ZLpnFf2e6lJoaj++EcvNbyoir0tyuL78d8qVYG6cPkKIYBB/Xhr8I4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g4Ayrrl6vZyHKovxsMwlg8hxyb09bVKOBqgHmF/1tTA=;
 b=mhWd/74BkttMFSuaqzK3gUwLzGbQcj/cchya8M+zw8noCqZolh6XlEHZ7nhrsg3gaEp6qD7VCp9jgxPQEvQL8VXQRRFlQ8QrvjNbxBxBCnqUWucIWW9MDNfKgi8A7Lk7fHG9vKCI1WSj4auA+cKizd0ikIJs5xh3h4JEkvMkabc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB8413.namprd12.prod.outlook.com (2603:10b6:8:f9::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8335.18; Wed, 15 Jan 2025 11:49:45 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8356.010; Wed, 15 Jan 2025
 11:49:45 +0000
Message-ID: <bfd19718-e7dc-45c4-8f86-34205e733916@amd.com>
Date: Wed, 15 Jan 2025 12:49:38 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] driver: dma-buf: use vmf_insert_page for
 cma_heap_vm_fault
To: "zhaoyang.huang" <zhaoyang.huang@unisoc.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T . J . Mercier" <tjmercier@google.com>,
 "open list:DMA-BUF HEAPS FRAMEWORK" <linux-media@vger.kernel.org>,
 "open list:DMA-BUF HEAPS FRAMEWORK" <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA-BUF HEAPS FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 linux-kernel@vger.kernel.org, Zhaoyang Huang <huangzhaoyang@gmail.com>,
 steve.kang@unisoc.com
References: <20250115061805.3495048-1-zhaoyang.huang@unisoc.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250115061805.3495048-1-zhaoyang.huang@unisoc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0191.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::14) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB8413:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fd577e4-5221-44ad-6a3e-08dd355ab47a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b1JaelFoZUhKTDFzTVQ2ZVFsOU5zWnZUUWF1SDlhMzU5enhaMUk1cm13NldS?=
 =?utf-8?B?bDRoQ2RkdGZkamhTUnN5UkFobFpvcjRDVEVpS0owRXlndVhRSUY1WjAxMTVC?=
 =?utf-8?B?N2p3bEUycmRJK094eXVxK1hVZnArL1JyMHNMS0ltV2UzbDRBUHZhdm9XUEhy?=
 =?utf-8?B?TmgzSXVwVStMS3lWNkczNEhxUVRtNU9jTGp1Uk9qNGl1WVF2cjh0WWZmYzI5?=
 =?utf-8?B?d2V6NHpzN2lyTXBKczhYMTkxMXZJQ084eHhXVjhSKzZBYnFSV2RLNmtBL0Ux?=
 =?utf-8?B?S1lxWWppRWZUYWhsYUp1MDFOUGRsWlFSbXoxMzVhbkgxcXVibXB1Tlg3a1RB?=
 =?utf-8?B?a3FnZmE5MGNlY1pjY2VHL2tYNU51Rmk2bjU1dDNEMFFMTUNNZlpLS1BaZXIx?=
 =?utf-8?B?NGtSSHNzcnNXTFh5VGxub2FMNjFGQkgxTzBvVUora2hySWlENmZsbW15aUpu?=
 =?utf-8?B?ODJkRjEwNnpDTmNXdnQwNFBQSTNCK2FvM0FBN0ROak94M2pqK080dVhNOTF3?=
 =?utf-8?B?U1JpV2RNeCtVWXlZN3phSkczZFNKNGh6L0llNmdFVVVnclpEZm5FYVgzMWpv?=
 =?utf-8?B?Q3doeFBabUFTY2NVejBrYTNXbWF5cmkwL3U1bDJmU2puMVpKaUhvYmdwdDhG?=
 =?utf-8?B?VUZIamZZcUxzbW84R1I1MWJHV2ZNMEJSaDlSTmpacW1Ca0NabmhJZXJpajln?=
 =?utf-8?B?RWxDcmlSR1k2MkhhTlU1Z2ZMNjNxUkhESDhRRElWcU1XVlN2cGZDSTliQUJo?=
 =?utf-8?B?UTNOQkNZSkZqM1pvNG1laVRpd3FjRTJSL0ZmV1N5RmtZNitHQjl5VDRtQjF3?=
 =?utf-8?B?SUFTZG8xall3cmYwUTBMem41dUQxOXNkVlhSbTF0ZzFWMmdMNDV2Z0J0ck80?=
 =?utf-8?B?N0V2WUMzWUZoKzdMc1VlOHpqSSs5eDhocCtLS0FWRHRkMGMvSkxoVkQvRVNL?=
 =?utf-8?B?S1N1enY2U090U081cUFOSGkyRnZMdGV3SGhsYUY4WGJZcHN6T1VCekRWTVhW?=
 =?utf-8?B?R3BUa1QyMWpkYS91V01uTks1MTYyVkxCdzVUZHR0NEVJMXBRSDQwQk0zaFkv?=
 =?utf-8?B?TzFDSytmOXBUWFE2MEpFZEhvNFpyU25rSmFOR0hIc0JkVWx1TEZ5VCt1SGtE?=
 =?utf-8?B?clpXTmk1RXRlbXZnaTZ5S3VrVHU5VHZ1RFNEK2MyR2svTXBuN0F6bDhCdzRX?=
 =?utf-8?B?alUrTFIwQ0RpZkNvK3NqNjdpZ0orc1N0azhBQW9kVDFOWEtQVzlxY2JoRW56?=
 =?utf-8?B?NTZubVUyV0hvYXY4bExjTFVZTGdEbVkwR0MvTjFHQ3Y2YkFYSW5BT0g5K3VB?=
 =?utf-8?B?ZE5JV2wrbWQvRDA5dy9xaDlsVGtSK1pPdXZiWjlXQmZoa0V5aVlreUMxK1ph?=
 =?utf-8?B?aEVFbWM5cE54VUdFU0lJODliQ0l3STFkYmJsY2l0TkNnV2Z2SVhFbjdMWmlt?=
 =?utf-8?B?b1ltYmQ1eTg5M0U5VEdPL1h6MVRIcVJnMmZLeVhjcXRsUU9pSGNUc0Z6SlZv?=
 =?utf-8?B?bURTVnkyWUplUGI5ZUE4VzgvWHlIUk5EMmJ5K08ya3VLRS85YlFKWCtmYmdS?=
 =?utf-8?B?SmZWbzUwdHdsVVNseHFDd2lKYnJvcDI1N3BWREg1cG5FL0E3RWx5aklZbFhr?=
 =?utf-8?B?NzlnY3MxeWVvSzVFMjl5N08zSjNVQzZQNmUzazZodlJ5c0IyVlVmVUVqRUxq?=
 =?utf-8?B?ekliRlZYTElWMS9Dei9uUXRHcWp2dnQ4Y09FMGhEamJMN0pwUDFTQWRxZE5l?=
 =?utf-8?B?UVBTbFREMHNtM2dQTm9UUlZOYWZxZHBOMlRDRU1nRzRjZmU3bHBSeGtpNURS?=
 =?utf-8?B?RFRtSGttS3dEYS9iQ3BYZWhBWWdCRDF0S1I2TXhJNnJ3bTExOFNheDN2WWFw?=
 =?utf-8?B?YWFiaUcvTFUvZ2dOUHJMZFJVQW55Y0IxZGF6ZDc4VHlHbDdrMTlPSWNpenN0?=
 =?utf-8?Q?44VFAeYjtfg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QU1waUQ1Q0VOUlZSRWJHOWhHVXhERDNRM1VzanVtVmtWUlVUa01lVkZCaGJw?=
 =?utf-8?B?SHRITjdlMEZWdC9ML2U0OURySnJubktHekVoL0dvNVMwbklNN0JyS0RCZENM?=
 =?utf-8?B?eGc0RmZBc1hSRzRVcDIwVjlUU2ExOGFKYXNqU0VYN29kQlFtOHNwdEVPOCtl?=
 =?utf-8?B?c1dmM2NRY2ZGMDZWYmhING83elBoNDFnWEFMSENURGpyS05uTnFtLzRRWXo1?=
 =?utf-8?B?cEFqVWYzWm5HcHJZMzZ1Z2FFak1NWGU1VkZxV3YvOFBrZHd4SzlKYXQwK3la?=
 =?utf-8?B?Um1Vc2FqYW1pdVVpQlQzbXMvai9PMVNrUWk1dGJHSTQwd21xTW1lK0tJOHNP?=
 =?utf-8?B?WkFHSDFrZDFZRWY2UWVvdEpJdW5vSlU3ektXcXczT0R1R2RPNGhUaEtIM29k?=
 =?utf-8?B?TytYSU9CdEFLSE5HLys2b1R0VDdQZFlqTkkwbTZnSkd3cC9LcmZsREhrdGk2?=
 =?utf-8?B?amgwYVlJK0hYd0lkV0N0Q1ZpN0R5VGQ2YlplL29XN21NWUFGSy9iZkFScUU5?=
 =?utf-8?B?T1hKM1RvRklUS0NXZXFXeGQ1NFg2a1Y4a2w4YmNxbW1kTU5ibGx6YVBDWldv?=
 =?utf-8?B?ei9IcG1KbTNFeWx2V3c1cnJBRC9sWUZyOUVTNCtZM25CY1l5SDRTM2E2V2ZN?=
 =?utf-8?B?QkJBSnBSZExPQTZ6WHk3SWxOZmNhd3NIOWFQNEd4RHBhYmlGTE0rNFpCVk8z?=
 =?utf-8?B?eDk2TzBUVkg3SVN4SDdtTmpyWi9PaGJGdTNyRmVaOTlzWEYxWmxrY3N0Zjc2?=
 =?utf-8?B?QnYycUJOTHlLYzFwbXlrU0RyRnhFVkVVdXZsZTN0VlN0SktaNmIzOS90dHNr?=
 =?utf-8?B?V1ZNbW5uRndpRVVLcmF0UEUzTGpVTmx0NVFqTlJ0V3ZTTXV1MExreE1uTEFM?=
 =?utf-8?B?RitDMHZEcnplYmgzQ3NEU0dXT3FzbWlSeVpldCs3LzRKMVBYaytPbkFpWEtC?=
 =?utf-8?B?STJ4SjUxZ1NHV1ZYN01BZ1M2cWQyWE9MTDNPRk8wZjU1bUZxWXc4eXVrcnFV?=
 =?utf-8?B?V20zcXlYQWQ5Qm5hdTVWZjhHUkhPMkF2dXRuYWVWaDBDK1NtNndVN21EWkt3?=
 =?utf-8?B?WGF5RHA1ZFE1c2lWNUFFdmllSGRUTFhySkpFTTFPRVlyalN0NlllNEpwT2Zn?=
 =?utf-8?B?YlE3ejFVV0lhMytPSGlGQzh3VXJ5andVUW9LOXFwMk1XTGFhV01HSTZtbVRs?=
 =?utf-8?B?eUJtTjc1b3BleVRTc3hoMGNGVXRlWHBZN1hEeFA5WGhMRTQvNGpFbEdjUWtH?=
 =?utf-8?B?NHJoZ3NLS2s2cG9haS82REtmVDlnRVhOeUdjVzVRVDRsOHNRL0V0bzRqMG9i?=
 =?utf-8?B?YnVCMDZRY3NLSXUxMUZUY21KeHVFUzhyeTdwTS8xRlByTUhnWXhtSkplaURl?=
 =?utf-8?B?ZHBQQWJVckVmSFJyd3I1a2YxYTlBZ0JYNmJ2ZjZoZ1R3aStLVEVKc0dtaVdK?=
 =?utf-8?B?d3VaQ2tLVUpndU9lb2pDaWo5N256M29VOTNMKzBSMHY5b1VVeVZHMFRqb3N3?=
 =?utf-8?B?cThVWEkxQmVxUjJ3YTJFcGxUaGlpcGRvN2NRbExjaVZ2UWhxUXVlQ3hGVWNk?=
 =?utf-8?B?TXJzOEZuNGRER2JZanNtK1lmWEFzL0xwV1VhQTVOOGVOMEpuaytmeFBld1F0?=
 =?utf-8?B?d0RkZjZ2QVEvdE8rcVhrTzNkMTlleGZvNWtWdnFtanZocE5YbE1WNElBeGJy?=
 =?utf-8?B?bHdKNlRLYXV4b3lUbVRMT2RkV1B4Z0JqaGtjeGREQnhOazlqbVVUMFpJYzRE?=
 =?utf-8?B?ekhna2tYT0ZNRFI3L3hLQkhPNWV3Zm1kNXEra2RPNm96aGVUb3d0Z0F6ZEEv?=
 =?utf-8?B?M0dLYkJvOGJMVlVqMkVmTWhlaForRmV4eFJSTVVwL2c2elRyZHcvYnJOUFBW?=
 =?utf-8?B?SXZIUEdWNHB5SmcxejJoY3AybkxkbEVyM2pleUtnWDVoNERGcTZhVTNHZVhP?=
 =?utf-8?B?UXNWblJlV1BzTkVVZk1kUnFoSjIyaVVGbjA5alpmTjJieWtHakdMSy84UVNs?=
 =?utf-8?B?eDNqWksyYmZJOGJmMW5sd1M4ZVk5NEpkY3VxbFBSR2FMMlBRWGZnSnBqamhY?=
 =?utf-8?B?WTJsYTlnVG9yZUo4MHQ4dFZMLzNEYzJBVGd6ZFcvMHlYcnFwbEVvdkpVeGVJ?=
 =?utf-8?Q?522L8UkIc8Su9ZTRhY9emn8ae?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fd577e4-5221-44ad-6a3e-08dd355ab47a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 11:49:45.0133 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ye8/fcIOVN919ZswXpgC1KGl1XuWAO6L38F4k90yk1SR/9bcXPhsECtJCC/+7qhH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8413
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

Am 15.01.25 um 07:18 schrieb zhaoyang.huang:
> From: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
>
> When using dma-buf as memory pool for VMM. The vmf_insert_pfn will
> apply PTE_SPECIAL on pte which have vm_normal_page report bad_pte and
> return NULL. This commit would like to suggest to replace
> vmf_insert_pfn by vmf_insert_page.

Setting PTE_SPECIAL is completely intentional here to prevent 
get_user_pages() from working on DMA-buf mappings.

So absolutely clear NAK to this patch here.

What exactly are you trying to do?

Regards,
Christian.

>
> [  103.402787] kvm [5276]: gfn(ipa)=0x80000 hva=0x7d4a400000 write_fault=0
> [  103.403822] BUG: Bad page map in process crosvm_vcpu0  pte:168000140000f43 pmd:8000000c1ca0003
> [  103.405144] addr:0000007d4a400000 vm_flags:040400fb anon_vma:0000000000000000 mapping:ffffff8085163df0 index:0
> [  103.406536] file:dmabuf fault:cma_heap_vm_fault [cma_heap] mmap:dma_buf_mmap_internal read_folio:0x0
> [  103.407877] CPU: 3 PID: 5276 Comm: crosvm_vcpu0 Tainted: G        W  OE      6.6.46-android15-8-g8bab72b63c20-dirty-4k #1 1e474a12dac4553a3ebba3a911f3b744176a5d2d
> [  103.409818] Hardware name: Unisoc UMS9632-base Board (DT)
> [  103.410613] Call trace:
> [  103.411038] dump_backtrace+0xf4/0x140
> [  103.411641] show_stack+0x20/0x30
> [  103.412184] dump_stack_lvl+0x60/0x84
> [  103.412766] dump_stack+0x18/0x24
> [  103.413304] print_bad_pte+0x1b8/0x1cc
> [  103.413909] vm_normal_page+0xc8/0xd0
> [  103.414491] follow_page_pte+0xb0/0x304
> [  103.415096] follow_page_mask+0x108/0x240
> [  103.415721] __get_user_pages+0x168/0x4ac
> [  103.416342] __gup_longterm_locked+0x15c/0x864
> [  103.417023] pin_user_pages+0x70/0xcc
> [  103.417609] pkvm_mem_abort+0xf8/0x5c0
> [  103.418207] kvm_handle_guest_abort+0x3e0/0x3e4
> [  103.418906] handle_exit+0xac/0x33c
> [  103.419472] kvm_arch_vcpu_ioctl_run+0x48c/0x8d8
> [  103.420176] kvm_vcpu_ioctl+0x504/0x5bc
> [  103.420785] __arm64_sys_ioctl+0xb0/0xec
> [  103.421401] invoke_syscall+0x60/0x11c
> [  103.422000] el0_svc_common+0xb4/0xe8
> [  103.422590] do_el0_svc+0x24/0x30
> [  103.423131] el0_svc+0x3c/0x70
> [  103.423640] el0t_64_sync_handler+0x68/0xbc
> [  103.424288] el0t_64_sync+0x1a8/0x1ac
>
> Signed-off-by: Xiwei Wang <xiwei.wang1@unisoc.com>
> Signed-off-by: Aijun Sun <aijun.sun@unisoc.com>
> Signed-off-by: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
> ---
>   drivers/dma-buf/heaps/cma_heap.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
> index c384004b918e..b301fb63f16b 100644
> --- a/drivers/dma-buf/heaps/cma_heap.c
> +++ b/drivers/dma-buf/heaps/cma_heap.c
> @@ -168,7 +168,7 @@ static vm_fault_t cma_heap_vm_fault(struct vm_fault *vmf)
>   	if (vmf->pgoff > buffer->pagecount)
>   		return VM_FAULT_SIGBUS;
>   
> -	return vmf_insert_pfn(vma, vmf->address, page_to_pfn(buffer->pages[vmf->pgoff]));
> +	return vmf_insert_page(vma, vmf->address, buffer->pages[vmf->pgoff]);
>   }
>   
>   static const struct vm_operations_struct dma_heap_vm_ops = {


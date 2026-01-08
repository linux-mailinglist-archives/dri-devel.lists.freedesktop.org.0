Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B86ADD0680A
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 00:02:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F12D10E197;
	Thu,  8 Jan 2026 23:02:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="beeMRd7J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010022.outbound.protection.outlook.com [52.101.85.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38F6510E197;
 Thu,  8 Jan 2026 23:02:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a984aFkPILJNElM0L4QtYYji2qflgTdcw+dLT8DucGcARvSAbKEwx3wWTHGs+v3zoMktx0D9a4ARqC1cOB5CQq93s4hW3UQK3317NIGVZjMRZELgkA4O01jwshcy+0L0p2GkAwscebgCs6NW4mxCPLCQQXQhUFkb24qFA+NwCbx8Rue+gL2S8R0q81xZNSPjjD+i06OihHrGOepxTZbsJ1QPZIERgEWKae3Vdlyo8Ts1rTV2swXFrjDmIf+DZIb+bTwvZq+YJVnz/eWCoW2vu/hE/bs5h4oa/peDe16TndhcKNxHoyVMxJhrIstjWC1x+Jy60G/MFo33zQfxbseG7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5fUWKdMdcm0Oxo/nlaemBqHin5sKNBv7guG63OrvzD0=;
 b=OMz4/wuZ6tRWaM+3LJq4tQCSEeev65U0UX6ktWdphYLWLeu+cLH+/n5y/jG684HRTgkvz9uQ1EIRSWOpe5s5cQkgHbo9kKh8NhTmKNZPzN3LZ7sFI1NzQdqi6OE2RnfUPmrpSqVNRRjCudZwsfhcPTuCKMDNYeBmxe26fwrla+E1JQZ0npofjUIK0iS1mSVdFreKmksxZzgHQXun+s9iEkOrvk3nsPUubsbxaTstGcmNdCKeOAdgUfpXB75ECwyCUHwycKTNFGEUZPKQ8h01bsp8KrlM10YvMw9osGFoPCq0lWV2XfBSq8ACYc2KYJQDiogqEVwcmuGAvbyk9L+K/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5fUWKdMdcm0Oxo/nlaemBqHin5sKNBv7guG63OrvzD0=;
 b=beeMRd7JcIciKNSzgAPFnIcx38FgGw60JK/61p1fYBIO4MU9Ou8eSE8vA5Js+VwbzWHaUh1KJiEDdHHKFNJO/mvbONNh/ZwnL8y0j6Ak78AWecPxoHIiWi61Q8PfoWwIhxmB93pFrWUwjxWsSbkJybMpoC0cTuYeaAVu/YZDVg0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by PH7PR12MB9103.namprd12.prod.outlook.com (2603:10b6:510:2f5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Thu, 8 Jan
 2026 23:02:06 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81%7]) with mapi id 15.20.9499.003; Thu, 8 Jan 2026
 23:02:05 +0000
Message-ID: <cc24a955-f5b2-43e6-a4fd-ff446d699fce@amd.com>
Date: Thu, 8 Jan 2026 18:02:04 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/amdkfd: fix a memory leak in
 device_queue_manager_init()
To: Markus Elfring <Markus.Elfring@web.de>,
 Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Oak Zeng <ozeng@amd.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20260106015731.1906738-1-lihaoxiang@isrc.iscas.ac.cn>
 <57a9f219-2612-4a64-a9fb-44b04e09ec15@web.de>
Content-Language: en-US
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <57a9f219-2612-4a64-a9fb-44b04e09ec15@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4P288CA0015.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d4::15) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|PH7PR12MB9103:EE_
X-MS-Office365-Filtering-Correlation-Id: 327e0b50-e92c-4cbc-6156-08de4f09f175
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UllMMS8yclhXQkZwR3lNQ3dqZmE0NTB2UXRZc3lJV2E0UXdqbFQ1WHM0aWJx?=
 =?utf-8?B?dld4RFoxRGp3YnQ5T2FBVVZFUmFRdmk5NDZreDRYSDg0Q3lCL1VUd1hGeUU0?=
 =?utf-8?B?aFExbTlwWEphYm1iZFE0TmRXM1RLOXJsU25CYlRwaDh0ZGxkOHc2RW9mUzAz?=
 =?utf-8?B?OTh5RW5jbVpmbHhMbnFZaENiNHBXeVNwUUdmUUZOcmhraXU1Yy92Z1M0VkFP?=
 =?utf-8?B?UmJKMmkvSG5iYTRudDVKR3FMTDRiWlhWNnRZUTNTaEdIQS9sWHRyVERvS0RQ?=
 =?utf-8?B?RG81V0JMZklOaVdDclBuVHBML2hFZnFsenhVby83Tytra3U5aXdTUnlhc2VZ?=
 =?utf-8?B?aXE5NTcvQUY3d1l4Z2VRbituQzRPcEYrYlZUNnpieTdNdTZGTFFwa2NzdjUx?=
 =?utf-8?B?dktBNFpra3ZPMFFaaXZBQUZlSmQzVGdCZWRWZG5vY2loUlFIYi9USGVsZFhY?=
 =?utf-8?B?eTV6aDBoVm1BRHhFMDdoNnNUNTdlVlJmQ0lKWDJZSlVUbis0NFUzSG9yc2dn?=
 =?utf-8?B?VlVkSnRZSndkTFdwKzUxeWY0bkViNnhLS2ZQZFBNZ0RDTGZ3RmtVcWxCR3dX?=
 =?utf-8?B?KytGeTlNN2JXV2V0WTV4TFFqZnZXdWVJcmd6ZHpzR2laOWVYekV1c3dVS2Z1?=
 =?utf-8?B?ZWlEQ2dJeDZkTm9TVThQaUV0S09xM2FzVVNrcmFDVEcwZkkvV0hkZ0JMZDlC?=
 =?utf-8?B?T0ZKQmxCRXY2OGMwYnpsT24vWVM3N3JYOXEzb3MzS2w1TndzamJIVHRWZzh3?=
 =?utf-8?B?OTh2SlBvczUxU2NxK1cwbjVQRm9KQ0ZVcjNtMkVoRDFTN2JXdTlXQ0ZweTZa?=
 =?utf-8?B?blYvS2dySEZ6bEtacnE1d21COFFjRU14RGNuYlluWEk3Y01Od1laSVdRbjRK?=
 =?utf-8?B?eTgzcDNqdDB4c3JCcDZSNWZzQ2Q3NU9kTHBPNVVRK0hUQWNSUGJjc2MyMG1M?=
 =?utf-8?B?blc1ZHBWbzB4M25Ha0lxVE1JUy9NN2hVcjlVQmFmSWc5YVg5YXZORzBLS08z?=
 =?utf-8?B?d2NYVm9GZ3Y1U1hweVZDUEVjS2VLY0dNVitVaFhMNnkxTEU4bm5naVBjQ1NS?=
 =?utf-8?B?NmQrQVNNN0RpOWVIQ1FSRFYvQ2xueDZscmxGSUlweXdnZXIzN2M3Z3BYS3ow?=
 =?utf-8?B?Zk9XcVJjajZrcEtpb3l6SXFTOFExYk1vNnlNZTN2VXlKZmxTUnFibHVBQ0xL?=
 =?utf-8?B?YlBTaDAxbGtZcjEyS0ZZb2hSK0VyQWhkTkZrajA3eEROTUpTMTg4MkNwUHFa?=
 =?utf-8?B?ZVdtTnp5Q1pHQS91KzQzVTNCMHlJYTMzcCtKMUdEREo5VGRFcFNIeS9rb3dD?=
 =?utf-8?B?andHNFVuZGFJZjY5QUVER21zNmhzbmFqOWFqQzI5UjBZUGQxOU4xMjBpb1Bx?=
 =?utf-8?B?ckd3cXpKN3dNUWtPWHRxNTNDdVhRZ2FsTnNkVlMwcGcyYjhTNUFsQ3pjYXcz?=
 =?utf-8?B?WEJMdjJLeUhMSitmdlpKcUtqUUFrWmwvYmo5YUlIMGlFZnhGbmVRS0FMSFli?=
 =?utf-8?B?STBHZjJhbWpxSUxubjk1ZVljb21KTFRPK2NUWE5uUlZrOW5CZm5WV04vRC9R?=
 =?utf-8?B?UThQcDlNMlN0aDNQcWpxK2d0ei85MWdPQzcyMFlSakVTdlJzbDdHM0k1NXhJ?=
 =?utf-8?B?YmxCOUFEMVNsa1I3TzNMRUo3TWorVEp6eUVMejZrOGFjbjI5RW91T1M2WU1j?=
 =?utf-8?B?a1ZzdlBtTE55R1dRVUNHL21Ea0RsdmMrOHNDeGprbTNCOExNT0lCeGgwUXBB?=
 =?utf-8?B?VmxLUUxKMlRrRmtZM0sxMW4wcmw0aWpCL01rRmhSMDFrcFZ0RGxqVHFBekEy?=
 =?utf-8?B?dmJCNXVwUzlSd0MwbGFRenk3N0ZjcEduQVRtTGF4UnVTbWwycytpbWNpQVRL?=
 =?utf-8?B?V0E4ck9mbEdETTdldzZ6WWNUN08vT05ETEFac2diK2hEaWhPclMzL2dLbjc0?=
 =?utf-8?Q?SDH1IH7R3kPlgPz24MaX0g264I/ovoCZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFphSlRPVi9ET0JtdlJYSXczUFBabWFmb29aZkdxR0o3L2srRC9FUlk4RjRR?=
 =?utf-8?B?dkFqVmRVdzZYaTdqeSt1VWcycmF6THlYSTA5MnQzNU9ITk8wR2lZcHovK2M0?=
 =?utf-8?B?a05nTXdrYTRNN0hXZXB2VmRjclhTVXBZZ1drUW5odFdnN2FpbjUwcjQwY0Q4?=
 =?utf-8?B?YzJJK3ljbWZ3V0dWc0tpWGNGekVuSFBlMU9jcHcyVmNKWXU1VTRqa0V1bzAv?=
 =?utf-8?B?N0h6KzN2RDhiYUZtcWpRd214YXdSVFo4blhoczZ6Z3hOS2ZjSUJtZ2ZhaTdS?=
 =?utf-8?B?R0dpT2xKaThTS0pLREZWV25NZmFkUncwcjlBSzZaaXpWaDVZSGVBMmw1cFFy?=
 =?utf-8?B?N0gvalpxWHpUdVdDNTdwT043WHV4WHlzT1FDWVNTeUN3d3hDb1hNalFTc3o1?=
 =?utf-8?B?Q2oreTVmcVJ0aGE2UHY1RmN4Y1JUbjJLejIrUExvL3NqMXQ1OFFjVjNOSXAw?=
 =?utf-8?B?Nmx2cStkd2xVT3lpNy9ya1ZSYmVOcHFIZEZybXBGTXNNZkRIMzYyQzYvK2JH?=
 =?utf-8?B?NlE2cGdPYUZyc3crUjFid1A2eW11cFhKZGJuRnNVOXdrcU1Rb3RjQWlhQjRE?=
 =?utf-8?B?L1kxR0xnRWl0c0sxK29BU0U4a3p4NkUxdmtjdk8rZllDTVlTTzZNZy9ZR0Qv?=
 =?utf-8?B?bTEwZDhKS0wrSnE5dGpnTVh6Snh5YVFObEI5RmEyYk9vZ1p5alIzeVd5M0dy?=
 =?utf-8?B?NVBrQlFIR04yb2hXREVsWUIzdWhXQlcxNjM2VmxUeFl1T0N3cTFTMCt2M0JE?=
 =?utf-8?B?WkxndVAwRVBQZEc2blF4MldlZndLc1ZjeGpST3g3UUM2TW8yeEdhbmtsUUQw?=
 =?utf-8?B?aGF4aVg2K0JuaG1FK01XbmZ1OGdNa2JTZUljak9sM1paeFoxcTF4azFjdjVz?=
 =?utf-8?B?Zk9ic2VjUkw3N0Jrb1l2bVJoQ281OE14bkJiUTQ4eGRYQVpPYVpoLzV3cjFB?=
 =?utf-8?B?OFVYdzdUNitHclovZm81UUtvSXROZmt3aTZDeXczT1FOZmNOVTF6dnYzV09Y?=
 =?utf-8?B?TlZXTjc1NDV4WFJtdG01WjBQZG1kOUJ0THlIRzVOMjRNR3RDTTMyZVpsekJn?=
 =?utf-8?B?VVFISEVldHAwVkk4WFlxUURvdnNoY253SEFTYXltVXg5ZXVhaDI5SHNSeHM4?=
 =?utf-8?B?eU4vVEVBRHJBZWlpYmJ2R080R0RiVnRzeHU2d2FJN3JGdmYxZFU0SG5LNWZL?=
 =?utf-8?B?djFaYlZyZEhZdHFqNDgwaGlhMUJrb3p5YXRVczdaQ1pNK25FNzNUazNRamov?=
 =?utf-8?B?S3lzWG1hUStkNzlkVkZwNTVCSmR1cHRnTjZQWTYzR0xEVTlGUzBMVHJDZS9V?=
 =?utf-8?B?UzFpVE9WME9SZ0dFeGdvTFlSbkVGVlpSNWZWY3d1eHhvbngzL2J1WGxRYmkr?=
 =?utf-8?B?SzM4ZlhtLzlVcE1tVExwTE5PbWhMeFN3bW1NYVdQcHBXMWpYTHdrc0hXckoz?=
 =?utf-8?B?VzNDQmFRTTJWSmxYSmpiaHRQdkxwV3pyMWJ5Z1VlMnd4OVl6Z1E0WTFPM2NP?=
 =?utf-8?B?Q0dBQXh2Y0xXdlV5cFI4SXRiWmpaTmJUTmNWYVAyNFhyaFVEZWRxNTVVZHZm?=
 =?utf-8?B?QnArRzNyckl2NHBiVlpYa2dWNVpWQUtramkrNTdkVElJbHFCcHhtcFZWQ1Ay?=
 =?utf-8?B?YVpMSWJJaGlNZWRpMFVtamhhRVJNWWNmOFpSaE9weUZIMm44ZTBWbkpMQysx?=
 =?utf-8?B?MlNsUjU2NFBjR0h6b0pmeXRGNzg1RWttL09BWDJBSjVUS1dUZ25HWGtaRUND?=
 =?utf-8?B?b2ttVUhoVm9vZnN3cndkdy9WOXpxVGxqZ1Zpcm9VUTMxd2ZYMWs4Qm54TEhT?=
 =?utf-8?B?cDA4ekdPZk1wRk80Wm9VVTZFTmF0WHNvdHBiZG5CMDRYdGw3bDF6cytzWUY3?=
 =?utf-8?B?OWE4c3MvR3R1OXlRL0owdk9FRUxsaTBNeGZzWFpCR1Y0NWZ3ejc2b0NEbVZp?=
 =?utf-8?B?SVNMaVZlUm11UVp6QTVXbTdPdkZZZ3F4MUxOMFBWM1cxN2xwRHNTdmZSWTkv?=
 =?utf-8?B?YkpUZVNSaktRR29ZVyt2Ym5KQWpvenJOUk1hcDR0Vmh3Z045VFFONGJIZHBL?=
 =?utf-8?B?UTBzbWg2TFhCZWJLNlBRRFZXN0Vrakowc281VkwxU01zUHZ0TmFUeUdNMHZH?=
 =?utf-8?B?UHVxbmVFa3R4VllPdFFiSzdRL1BBNFB0WGZiU2N5SFBhNmhYY0FRemRHd3N4?=
 =?utf-8?B?SUtpVXhmU0RGMk5mRHN2UkdabEZ4K1k4RUVIV1JkNnFTcTNUZlBBUi9KeTQ2?=
 =?utf-8?B?SVZrNXZLaEJ4U05UbmJSSjV5UHc5b2hRVS9QNlFWTHQvOE9pVWxSSEo1Mk13?=
 =?utf-8?B?NGJ5VXlaUmw2eHBWL0ZUL080S1dkUzhjWFJrd0RiKzg0VUhlWWhaQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 327e0b50-e92c-4cbc-6156-08de4f09f175
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 23:02:05.8804 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q0QlFV0n/kdCWCU5GSTu75cSD2HFKUunkkpcc1tuqxojPNUT9OSv9OgS2PEJxCGWMDjeXjGx0Ga5/vlZIvpa0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9103
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


On 2026-01-06 04:30, Markus Elfring wrote:
> …
>> Move deallocate_hiq_sdma_mqd() up to ensure proper function
>> visibility at the point of use.
> …
>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
>> @@ -2919,6 +2919,14 @@ static int allocate_hiq_sdma_mqd(struct device_queue_manager *dqm)
>>   	return retval;
>>   }
>>   
>> +static void deallocate_hiq_sdma_mqd(struct kfd_node *dev,
>> +				    struct kfd_mem_obj *mqd)
>> +{
>> +	WARN(!mqd, "No hiq sdma mqd trunk to free");
>> +
>> +	amdgpu_amdkfd_free_gtt_mem(dev->adev, &mqd->gtt_mem);
>> +}
> Is there also a need to reconsider the implementation of the applied
> null pointer check here?

Yeah, we have a WARN if mqd is NULL but then we still call 
amdgpu_amdkfd_free_gtt_mem. There is a NULL pointer check in 
amdgpu_amdkfd_free_gtt_mem, but &mqd->gtt_mem won't be NULL because it's 
not at the start of struct kfd_mem_obj. So you'd get a kernel oops if 
mqd is ever NULL here.

That said, I've never seen anyone complain about this WARN and a 
subsequent kernel oops.

The only other place that calls deallocate_hiq_sdma_mqd is 
device_queue_manager_uninit (only if not using MES). It can only be 
called with a valid dqm if device_queue_manager_init succeeded, which 
always ends with a valid dqm->hiq_sdma_mqd if not using MES.

My conclusion is that this WARN is just unnecessary. But it's also harmless.

Regards,
   Felix


>
> Regards,
> Markus

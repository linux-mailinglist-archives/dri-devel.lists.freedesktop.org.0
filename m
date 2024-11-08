Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B23BC9C1F4B
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2024 15:32:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7EF310E9D3;
	Fri,  8 Nov 2024 14:32:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4GgaqQlc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2081.outbound.protection.outlook.com [40.107.93.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE2C110E9D3;
 Fri,  8 Nov 2024 14:32:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=og54ILuOF0+kMAZiz3As1s+15StjqB0Jx9AF/tcBbEQzjGXNCSA7c3ITycb/1CqHTUxpn9rCqMdpLAwIFwWJjvzmEc4O+Ds6qA5whhf+IFGD6LtE+opXRnb///gRLLcq0uObi28xal+unGTFzlo7Q982MtgAvVY8rKGLmPWW6CZPJ++jYFyaX/DKld3i2xHGkdT+jBP9IEmjgQe01jD01VbeR+WtrnFqgbvNfzyelAL1khdPosC3sEDfikMx1hiH0U3VhLM6tvIvKFfLBG76wwTq+1HdGmLVF2Wpvxmj1WvQHmGwNEoALL2mKEqE9JLDa6XNbgtosPByWn1+nU7Yhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TuAkmv4dbet51DtLfksbkBa0lGhhPTbPs2jLOglConk=;
 b=B32EVHL9KWbFjI/hkEKdCiKtSXfWM72BOXb/8B//qYAqm4Hy66+4XT5z6f3+tjsPvNyd8Db0OGMoMAkJeXJ6QqiT6d40Q92WgwEFhTyWQ+dOElYMWCwsESLwsrktzUI9NVkP+gjt3hs6u9e80HrShzpHQ5ffoChDMEBSfuSBPQn9FadNXaQ+ZiHCcCfr3hNF7WnZVRecxJ12vlXRmuB5UldehWwKBPxVYOEddHn9fl0QZpgkwOUUNkM++V7lSdP8xjNEV4v6tDlhc1sgBsDp1WJJIXEsGZg35lOiCpZSbul2zhBHJe6zX40KzG6dkKOvv9vP2JN0hC00AL8hAL8ebA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TuAkmv4dbet51DtLfksbkBa0lGhhPTbPs2jLOglConk=;
 b=4GgaqQlcwlHT9OmJ3uIuvYqwecQQOUi8DQrm/niaLls0fo0Ry2g4K4KqOKaTsLVIoSfUoZen6BXOjG9ulOb/k5VjPKLjcVXXx3cExBALbz7Klcd+TsB/8m60xBux9frtFgnKfoHIewZRWb6xgl2aOWBXF0nBVLEecjvnMwEhyoQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ0PR12MB8116.namprd12.prod.outlook.com (2603:10b6:a03:4ec::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.21; Fri, 8 Nov
 2024 14:32:14 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.8137.018; Fri, 8 Nov 2024
 14:32:14 +0000
Message-ID: <5b424798-832b-4489-b4b4-8dc53ad487cf@amd.com>
Date: Fri, 8 Nov 2024 15:32:08 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 2/8] drm/ttm: Add a virtual base class for graphics
 memory backup
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org,
 Paulo Zanoni <paulo.r.zanoni@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>
References: <20241016085559.11840-1-thomas.hellstrom@linux.intel.com>
 <20241016085559.11840-3-thomas.hellstrom@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20241016085559.11840-3-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0081.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ0PR12MB8116:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fc7592e-031c-4bb3-d019-08dd00022346
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M1FKRW9uMW5YVlJ6QjZkVlM5T1RQRGlSKzk1VUZtTEpOZmtWQ2s4bmNTRjR6?=
 =?utf-8?B?ZGtGR2wzY0E0VEE4Q0NNUEoyOThtUUt5bFBOVzdQdFppRUpwYStWcjl3ek9z?=
 =?utf-8?B?UVJNaTMyRWNDY000ZzdlM3IzMDdrS0xhRXBWUFkvYXNZZSttcjdZaXRWRk1i?=
 =?utf-8?B?Mk9IUlRkOHhoSHpmbkZRWHExeEJtRHdKQ1VsamlIdzA5VWl3Ymh0ZlAyM0dw?=
 =?utf-8?B?VkhCclZtTDgvL1RDc3BKc1RUT05rOHRZK0NESEQvZm93bDBWeWVZWG5OZWk3?=
 =?utf-8?B?aGtKMmpFOTNaZE1FY3gzWlRoVm5DbmhXZUI2QUo2cXErSVlFY1A5b0FjT0R0?=
 =?utf-8?B?bW00QTdhNURSaVJrMDk5VUszNlhBa29yMUtub0ptNmQ2TVVEeFE4RmVvYVhY?=
 =?utf-8?B?c3plMjFhdmIzU2xLT25zdkJRSEVlb1h3L2NPS3IvSVEvbm41S2xPZ0JOYW1B?=
 =?utf-8?B?YjN5TmZkNXlhellwNVQ3MHJxRG5SMVlCT1E0Ky9haWNrQXRqNlJnaW9BbHpj?=
 =?utf-8?B?eWxBRHZocUtKODI0RllJQ2xpMkZWVTdwSDZxTjdhc2w5dXVSM1orSmdzZGto?=
 =?utf-8?B?aW80aUNpdUIreHkxN3N0OUNWM3JKS2h2My9RRHhFM3pTaGNRUk5hdFdQVUdM?=
 =?utf-8?B?RFVuRGkvTzhSUHdiWG1VYlI0UnFVWW5URTh6SkhKNWxBQ01LVHkxQ0N2TmVU?=
 =?utf-8?B?UVZJN0hUOHo4d2EwbWxNOTd4UG1jMHVnVUZYYXVyNkE5QmNqZVpNU3Bic1l2?=
 =?utf-8?B?NWhaL0h1M0svZ244MW9YbGoxVFVRMEM4dzFyVU8ybmVSMzJBMnR0QlFVSUtT?=
 =?utf-8?B?Nmo0Tkt1YzNSbzVUVjIxaXVQOEp6ZXIrVG9ITzhVTStiVWx6SjRPRFNyZ2R3?=
 =?utf-8?B?TDI1Nml0dThxajl3ZTNZZXZaWXdHd3UwTlRlUXVUVkdwRk5Pc1VXU1hHY0ZI?=
 =?utf-8?B?T1RKOXZxWWtpcGFHWWpHV2F4VHhpYlZXY3BrMEMxa0cyOGFVNHJzUmx0Y1R3?=
 =?utf-8?B?T09FV2NBSktxMk4xczBUclROdUVmL3dQRFV6eVJpdnBWQWNKNDlsbTRjbzVP?=
 =?utf-8?B?Q3N3cU5vRzBhRHZ5TWgyVHJ5M0lPSlZDU01yOFoxL04wMzJ0cUVaL1dWNWUw?=
 =?utf-8?B?aE9JWG9mTndvZS9OdjJJb0NzK3NoTnFIcVRnVEJtUVVjTjgwUGovQWJrRUdk?=
 =?utf-8?B?VElhNmVyQ3JpeUFiTXFIc0RiMHNDZndqYzliRUw1Z3pKbkd0UldhalR5dW5r?=
 =?utf-8?B?VFBndkQ4ZzdXYWFDZlFlZlIwVHJJaE44c0Q2MUhNL1JRSmFtMERacGtNdXRa?=
 =?utf-8?B?M3RZalBqeWUwcExTSU5PUTh6REdha3dVc2RPdTJ3eEtHeEpJQStQMkZZTktH?=
 =?utf-8?B?MFQrMlI2bjhxM21WN2ZsYkpuYzhacUI0TWlRbnJJWG1PYnBYcDNZZ0FwRVdl?=
 =?utf-8?B?N3R6eUNmdVprV1pCbVpvV0hKSXJrV2N2cW5jR08xb1Uwc2crU3lrQlYzaXYx?=
 =?utf-8?B?QUdzbWhlL3FWQzNKRkRrRnlGU3dlenc5aE5wZi9TVXFpSU1oVUR2blJKQnhM?=
 =?utf-8?B?V3pHeUdxN2ZINEVHTTBheXJ0YlJ1bUlLcG9zTlYwYU1UOVpONkdVK2JINk0r?=
 =?utf-8?B?SE5pRXBBK21aVW90NWdqVVhucmtUVDkyL2Y5cDNRb0hDR0c3OXV3aG1wa01W?=
 =?utf-8?B?SzZGeVJ5OU9JUFk5UDRETVpVVHE5SklVYkRkNUtoRFN0TWhUMDJXZWZoSnBy?=
 =?utf-8?Q?Jm8qIistxsb1rhiRo3exb8FaQ+qT2Q7lhxw5ahN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WitTVUc5a2hYamZwb2pzTmdhejNoN043UmdrYkROY3k4Zm5USDdIeFRISVlO?=
 =?utf-8?B?akxnank2SnNQNXdYQTBVMmtRRXVJQURjOVRoSUNMUllBTlVyVmVZVm53cEla?=
 =?utf-8?B?UXA2V04zemtLU1kweFFwQTdWaWV5dmwvcS9MdmQyV3ZnbFp0NjArejYyWE5F?=
 =?utf-8?B?QlA5YXhHVkY1UnBZSkpLeHFSWjlvVkIxQ2UvQkNqZ2dodVN4Ung1THAvcW5T?=
 =?utf-8?B?QmF0akRtNkh1K1lIem1EUVBNaVZObVRPWDNBdk5TREY5V01LWEZ3N1RwVEtF?=
 =?utf-8?B?d1Z1ZSt3V2QrK1lnaTJ6TW9oQlJRNWw1azFYQ01UVGJRYXZuTDhlMkYwRmtr?=
 =?utf-8?B?SDQ4ZmdhVnBJeXBmVWFYZ1JJUGJBbmlSUTl2RzVEQThXNi9YUk5RVVdCcUtK?=
 =?utf-8?B?U1lLL2NudTZlbjByeHgyRTdXdmR0OHNKMGRvRGZRMjMrZExVakhBdEZFSWRq?=
 =?utf-8?B?UE13aHNpSGxkYVowcmVNNVZPZkcxRFcvNjFGYTBDbzNwOVgyZWVqSk1GNzJw?=
 =?utf-8?B?c0pNT3NLWjE3KzV1a3hQc1BEN3oraHpFRTFqWjlqWkVqUVNvWU03Y0ZLZzd6?=
 =?utf-8?B?ODNoMDF1NlJPV3MvVVBPenU0dzkrWUUxblZmWm1BRExuVnA3THdNT0tRL25G?=
 =?utf-8?B?TnI3VFNmRjJjNXJOQlRCTFcvbWZFZjF6VkVCUC9iOEp1WGk4aW0rTHRtelFw?=
 =?utf-8?B?MlNLVE5QNVVsMXp2b0lvUEp5OW1EQ0srdDdLQlNialN3STg4TmxIVnRZWlF1?=
 =?utf-8?B?WGVPZWhTVzA0SFhhT3B4ZmZxTEpKeC83dStqRVRJVDh3dWsxR21xZkVOMzhG?=
 =?utf-8?B?TDUxUUFiRVNuMDlmeTE0T2RDNi9rdnNFSVdEYWpHMHV6OTJVSTdtdWRidktE?=
 =?utf-8?B?REdoSDRQNHJlSXlrMDZuK2FpRko2VmVkWU9ybzY3TmxlRTdzYXdZbzdiMVlo?=
 =?utf-8?B?Y1d1L3hoYnZkY1FmTDA0dWgzSnNiSmsrSGtjM3RsT2ZRS1V5Y25UMVZXS0pZ?=
 =?utf-8?B?eXlvWnJ6ODlxM0E2bmhjWkJrZHhmK2NjUG9mM25XZGJvd05BUlN0K3Jvd3dU?=
 =?utf-8?B?UmlhS0VHMHJHL3hscWRtRzlONVhUZDRKclQ4LytHYXRoUUlnTy9mUTlKWGpz?=
 =?utf-8?B?V1gxNFByalpEclNpMmZuVEgyR1Y4RnErcTMxekN3ZDlSK2tQaTRTcDJDZXcr?=
 =?utf-8?B?U0t2OWFBRnpuSlM4dHgrUnJVVW9ZWGZqYlFLNGJRTnBVTWVzb2ZiaVpRUklt?=
 =?utf-8?B?TjhYSGtZMGdPREpTaWNTMHZBRllVZUNIb1pXSFFjMVord3kxTUd2bThONjJS?=
 =?utf-8?B?YmxNb0JFcGcrRXljSjdLMURPaGsxaURGamRrY0czN1l6QjNuWE9BeGdlczZ4?=
 =?utf-8?B?bzhXSmkwLzAwRXZUUmVSNnNWSy9JZEVyN3VZVEFuZmlTeXNoUWVuRmxHOGRN?=
 =?utf-8?B?RXVld2xUQVBwdGlmUWZicS9PVjM5TmNNaHdPajFEak1YQWJENGJPTCtpRlVx?=
 =?utf-8?B?VTQ1dmowTnlieUZTVEcrZUhVQmVjRkx0S0lZd0FOdWo3TVo2cHFGak1wa3dI?=
 =?utf-8?B?M3ovcWUvM0w5N0VTdVVSOWtFMkVzbzAzLytlVTBLWFRSVTRqQTFlUStWZmxZ?=
 =?utf-8?B?dEQ2L2ZyTi9sVFR4RzlEK3NqckxvQ2ZNYUw3VkJiS1hjWklHU0NncDlhZzZ1?=
 =?utf-8?B?d0gyYmpzNGZnNmRGSm5wVE94RGE2ZFN3R0JUVnAva1hJZUdUdGtBMkJDeGVl?=
 =?utf-8?B?R2dlWWMzY2xMaW1hOUZZclByeU5wS3MwQmsraElhb0xNblM3UGVCTXNkT2Jn?=
 =?utf-8?B?QkNHZUhUdk5Ta0UyRUpXalFHL25aQnpNYksvdmVXM2J6em5hWnJ2NzU2Wnpz?=
 =?utf-8?B?UDIvUms0S2JXeG50Z2dNUnJKVG5zOGZ4Y1NjUzI1S2hFcE9tWW9HYlZOUGR0?=
 =?utf-8?B?TzBsSkJXZ0puWS93M3pKS21YZFZoY3hielpjdExNcjNrTzlONlpPQm0vYlRX?=
 =?utf-8?B?cklmVVlrL0xvWS93eG51Sm50T0RZS3UvbUovcEFlQWdTK2pnZXluNGxiVWFs?=
 =?utf-8?B?bzB3WjRqM1hkVmpWS2dkTjNLa1gxN2NoOVJkalBPTkVFK0EvWE5qWFFnZ2Vy?=
 =?utf-8?Q?0DRSN0fpGyKXn9tEzPPkARwFe?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fc7592e-031c-4bb3-d019-08dd00022346
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 14:32:13.9417 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e0jELz/gz2mI2h1B0LQw9LB31vgWHVprwIUwxtNxm7z/U3ZlVgRNKsYFhDl5qsvX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8116
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

Am 16.10.24 um 10:55 schrieb Thomas Hellström:
> Initially intended for experimenting with different backup
> solutions (shmem vs direct swap cache insertion), abstract
> the backup destination using a virtual base class.
>
> Also provide a sample implementation for shmem.

It feels a bit like overkill to have that abstraction.

> While when settling on a preferred backup solution, one could
> perhaps skip the abstraction, this functionality may actually
> come in handy for configurable dedicated graphics memory
> backup to fast nvme files or similar, whithout affecting
> swap-space. Could indeed be useful for VRAM backup on S4 and
> other cases.

Why would we want to have the flexibility to use different backends?

I mean that just sounds like one more thing which can break.

On the other hand it's really nice that we now use folios instead of pages.

> v5:
> - Fix a UAF. (kernel test robot, Dan Carptenter)
> v6:
> - Rename ttm_backup_shmem_copy_page() function argument
>    (Matthew Brost)
> - Add some missing documentation
> v8:
> - Use folio_file_page to get to the page we want to writeback
>    instead of using the first page of the folio.
>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: <dri-devel@lists.freedesktop.org>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com> #v7
> ---
>   drivers/gpu/drm/ttm/Makefile           |   2 +-
>   drivers/gpu/drm/ttm/ttm_backup_shmem.c | 139 +++++++++++++++++++++++++
>   include/drm/ttm/ttm_backup.h           | 137 ++++++++++++++++++++++++
>   3 files changed, 277 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/gpu/drm/ttm/ttm_backup_shmem.c
>   create mode 100644 include/drm/ttm/ttm_backup.h
>
> diff --git a/drivers/gpu/drm/ttm/Makefile b/drivers/gpu/drm/ttm/Makefile
> index dad298127226..5e980dd90e41 100644
> --- a/drivers/gpu/drm/ttm/Makefile
> +++ b/drivers/gpu/drm/ttm/Makefile
> @@ -4,7 +4,7 @@
>   
>   ttm-y := ttm_tt.o ttm_bo.o ttm_bo_util.o ttm_bo_vm.o ttm_module.o \
>   	ttm_execbuf_util.o ttm_range_manager.o ttm_resource.o ttm_pool.o \
> -	ttm_device.o ttm_sys_manager.o
> +	ttm_device.o ttm_sys_manager.o ttm_backup_shmem.o
>   ttm-$(CONFIG_AGP) += ttm_agp_backend.o
>   
>   obj-$(CONFIG_DRM_TTM) += ttm.o
> diff --git a/drivers/gpu/drm/ttm/ttm_backup_shmem.c b/drivers/gpu/drm/ttm/ttm_backup_shmem.c
> new file mode 100644
> index 000000000000..cfe4140cc59d
> --- /dev/null
> +++ b/drivers/gpu/drm/ttm/ttm_backup_shmem.c
> @@ -0,0 +1,139 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#include <drm/ttm/ttm_backup.h>
> +#include <linux/page-flags.h>
> +
> +/**
> + * struct ttm_backup_shmem - A shmem based ttm_backup subclass.
> + * @backup: The base struct ttm_backup
> + * @filp: The associated shmem object
> + */
> +struct ttm_backup_shmem {
> +	struct ttm_backup backup;
> +	struct file *filp;
> +};
> +
> +static struct ttm_backup_shmem *to_backup_shmem(struct ttm_backup *backup)
> +{
> +	return container_of(backup, struct ttm_backup_shmem, backup);
> +}
> +
> +static void ttm_backup_shmem_drop(struct ttm_backup *backup, unsigned long handle)
> +{
> +	handle -= 1;

Why that? I've seen that multiple times in this patch but can't find a 
good explanation for it.

Regards,
Christian.

> +	shmem_truncate_range(file_inode(to_backup_shmem(backup)->filp), handle,
> +			     handle + 1);


> +}
> +
> +static int ttm_backup_shmem_copy_page(struct ttm_backup *backup, struct page *dst,
> +				      unsigned long handle, bool intr)
> +{
> +	struct file *filp = to_backup_shmem(backup)->filp;
> +	struct address_space *mapping = filp->f_mapping;
> +	struct folio *from_folio;
> +
> +	handle -= 1;
> +	from_folio = shmem_read_folio(mapping, handle);
> +	if (IS_ERR(from_folio))
> +		return PTR_ERR(from_folio);
> +
> +	/* Note: Use drm_memcpy_from_wc? */
> +	copy_highpage(dst, folio_file_page(from_folio, handle));
> +	folio_put(from_folio);
> +
> +	return 0;
> +}
> +
> +static unsigned long
> +ttm_backup_shmem_backup_page(struct ttm_backup *backup, struct page *page,
> +			     bool writeback, pgoff_t i, gfp_t page_gfp,
> +			     gfp_t alloc_gfp)
> +{
> +	struct file *filp = to_backup_shmem(backup)->filp;
> +	struct address_space *mapping = filp->f_mapping;
> +	unsigned long handle = 0;
> +	struct folio *to_folio;
> +	int ret;
> +
> +	to_folio = shmem_read_folio_gfp(mapping, i, alloc_gfp);
> +	if (IS_ERR(to_folio))
> +		return handle;
> +
> +	folio_mark_accessed(to_folio);
> +	folio_lock(to_folio);
> +	folio_mark_dirty(to_folio);
> +	copy_highpage(folio_file_page(to_folio, i), page);
> +	handle = i + 1;
> +
> +	if (writeback && !folio_mapped(to_folio) && folio_clear_dirty_for_io(to_folio)) {
> +		struct writeback_control wbc = {
> +			.sync_mode = WB_SYNC_NONE,
> +			.nr_to_write = SWAP_CLUSTER_MAX,
> +			.range_start = 0,
> +			.range_end = LLONG_MAX,
> +			.for_reclaim = 1,
> +		};
> +		folio_set_reclaim(to_folio);
> +		ret = mapping->a_ops->writepage(folio_file_page(to_folio, i), &wbc);
> +		if (!folio_test_writeback(to_folio))
> +			folio_clear_reclaim(to_folio);
> +		/* If writepage succeeds, it unlocks the folio */
> +		if (ret)
> +			folio_unlock(to_folio);
> +	} else {
> +		folio_unlock(to_folio);
> +	}
> +
> +	folio_put(to_folio);
> +
> +	return handle;
> +}
> +
> +static void ttm_backup_shmem_fini(struct ttm_backup *backup)
> +{
> +	struct ttm_backup_shmem *sbackup = to_backup_shmem(backup);
> +
> +	fput(sbackup->filp);
> +	kfree(sbackup);
> +}
> +
> +static const struct ttm_backup_ops ttm_backup_shmem_ops = {
> +	.drop = ttm_backup_shmem_drop,
> +	.copy_backed_up_page = ttm_backup_shmem_copy_page,
> +	.backup_page = ttm_backup_shmem_backup_page,
> +	.fini = ttm_backup_shmem_fini,
> +};
> +
> +/**
> + * ttm_backup_shmem_create() - Create a shmem-based struct backup.
> + * @size: The maximum size (in bytes) to back up.
> + *
> + * Create a backup utilizing shmem objects.
> + *
> + * Return: A pointer to a struct ttm_backup on success,
> + * an error pointer on error.
> + */
> +struct ttm_backup *ttm_backup_shmem_create(loff_t size)
> +{
> +	struct ttm_backup_shmem *sbackup =
> +		kzalloc(sizeof(*sbackup), GFP_KERNEL | __GFP_ACCOUNT);
> +	struct file *filp;
> +
> +	if (!sbackup)
> +		return ERR_PTR(-ENOMEM);
> +
> +	filp = shmem_file_setup("ttm shmem backup", size, 0);
> +	if (IS_ERR(filp)) {
> +		kfree(sbackup);
> +		return ERR_CAST(filp);
> +	}
> +
> +	sbackup->filp = filp;
> +	sbackup->backup.ops = &ttm_backup_shmem_ops;
> +
> +	return &sbackup->backup;
> +}
> +EXPORT_SYMBOL_GPL(ttm_backup_shmem_create);
> diff --git a/include/drm/ttm/ttm_backup.h b/include/drm/ttm/ttm_backup.h
> new file mode 100644
> index 000000000000..5f8c7d3069ef
> --- /dev/null
> +++ b/include/drm/ttm/ttm_backup.h
> @@ -0,0 +1,137 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#ifndef _TTM_BACKUP_H_
> +#define _TTM_BACKUP_H_
> +
> +#include <linux/mm_types.h>
> +#include <linux/shmem_fs.h>
> +
> +struct ttm_backup;
> +
> +/**
> + * ttm_backup_handle_to_page_ptr() - Convert handle to struct page pointer
> + * @handle: The handle to convert.
> + *
> + * Converts an opaque handle received from the
> + * struct ttm_backoup_ops::backup_page() function to an (invalid)
> + * struct page pointer suitable for a struct page array.
> + *
> + * Return: An (invalid) struct page pointer.
> + */
> +static inline struct page *
> +ttm_backup_handle_to_page_ptr(unsigned long handle)
> +{
> +	return (struct page *)(handle << 1 | 1);
> +}
> +
> +/**
> + * ttm_backup_page_ptr_is_handle() - Whether a struct page pointer is a handle
> + * @page: The struct page pointer to check.
> + *
> + * Return: true if the struct page pointer is a handld returned from
> + * ttm_backup_handle_to_page_ptr(). False otherwise.
> + */
> +static inline bool ttm_backup_page_ptr_is_handle(const struct page *page)
> +{
> +	return (unsigned long)page & 1;
> +}
> +
> +/**
> + * ttm_backup_page_ptr_to_handle() - Convert a struct page pointer to a handle
> + * @page: The struct page pointer to convert
> + *
> + * Return: The handle that was previously used in
> + * ttm_backup_handle_to_page_ptr() to obtain a struct page pointer, suitable
> + * for use as argument in the struct ttm_backup_ops drop() or
> + * copy_backed_up_page() functions.
> + */
> +static inline unsigned long
> +ttm_backup_page_ptr_to_handle(const struct page *page)
> +{
> +	WARN_ON(!ttm_backup_page_ptr_is_handle(page));
> +	return (unsigned long)page >> 1;
> +}
> +
> +/** struct ttm_backup_ops - A struct ttm_backup backend operations */
> +struct ttm_backup_ops {
> +	/**
> +	 * drop - release memory associated with a handle
> +	 * @backup: The struct backup pointer used to obtain the handle
> +	 * @handle: The handle obtained from the @backup_page function.
> +	 */
> +	void (*drop)(struct ttm_backup *backup, unsigned long handle);
> +
> +	/**
> +	 * copy_backed_up_page - Copy the contents of a previously backed
> +	 * up page
> +	 * @backup: The struct backup pointer used to back up the page.
> +	 * @dst: The struct page to copy into.
> +	 * @handle: The handle returned when the page was backed up.
> +	 * @intr: Try to perform waits interruptable or at least killable.
> +	 *
> +	 * Return: 0 on success, Negative error code on failure, notably
> +	 * -EINTR if @intr was set to true and a signal is pending.
> +	 */
> +	int (*copy_backed_up_page)(struct ttm_backup *backup, struct page *dst,
> +				   unsigned long handle, bool intr);
> +
> +	/**
> +	 * backup_page - Backup a page
> +	 * @backup: The struct backup pointer to use.
> +	 * @page: The page to back up.
> +	 * @writeback: Whether to perform immediate writeback of the page.
> +	 * This may have performance implications.
> +	 * @i: A unique integer for each page and each struct backup.
> +	 * This is a hint allowing the backup backend to avoid managing
> +	 * its address space separately.
> +	 * @page_gfp: The gfp value used when the page was allocated.
> +	 * This is used for accounting purposes.
> +	 * @alloc_gfp: The gpf to be used when the backend needs to allocaete
> +	 * memory.
> +	 *
> +	 * Return: A handle on success. 0 on failure.
> +	 * (This is following the swp_entry_t convention).
> +	 *
> +	 * Note: This function could be extended to back up a folio and
> +	 * backends would then split the folio internally if needed.
> +	 * Drawback is that the caller would then have to keep track of
> +	 * the folio size- and usage.
> +	 */
> +	unsigned long (*backup_page)(struct ttm_backup *backup, struct page *page,
> +				     bool writeback, pgoff_t i, gfp_t page_gfp,
> +				     gfp_t alloc_gfp);
> +	/**
> +	 * fini - Free the struct backup resources after last use.
> +	 * @backup: Pointer to the struct backup whose resources to free.
> +	 *
> +	 * After a call to @fini, it's illegal to use the @backup pointer.
> +	 */
> +	void (*fini)(struct ttm_backup *backup);
> +};
> +
> +/**
> + * struct ttm_backup - Abstract a backup backend.
> + * @ops: The operations as described above.
> + *
> + * The struct ttm_backup is intended to be subclassed by the
> + * backend implementation.
> + */
> +struct ttm_backup {
> +	const struct ttm_backup_ops *ops;
> +};
> +
> +/**
> + * ttm_backup_shmem_create() - Create a shmem-based struct backup.
> + * @size: The maximum size (in bytes) to back up.
> + *
> + * Create a backup utilizing shmem objects.
> + *
> + * Return: A pointer to a struct ttm_backup on success,
> + * an error pointer on error.
> + */
> +struct ttm_backup *ttm_backup_shmem_create(loff_t size);
> +
> +#endif


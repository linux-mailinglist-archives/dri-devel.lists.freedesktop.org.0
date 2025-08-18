Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E4AB29FD3
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 12:58:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BAB910E1D2;
	Mon, 18 Aug 2025 10:58:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="G7Ui0MD9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2050.outbound.protection.outlook.com [40.107.212.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88D0D10E1D2
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 10:58:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kxG5puxiJpCS9Jf6MIhHV5B7rYZ6f1NqZ4BOEwJCN5mmg86zz5WY7F+/WHBTalqaRHtqK460zPiUVULI2jRo3CWT24YW+9IuQJoexxOxeMEoHA3oyCGeVDkO+GidioUtM1bYE5umfFaxsMgB63XwUUcKZK2BIdfy6YLxGJ0nd7F4q6edy9MSTYGculsI4L8w9yY5cUwbbYll9oVfjhsCFmxtGuWbV/ySj+o8l5XpN138nnGYhSY9oZWt0/6qE2wDzWxitO03ncwRqQlxEOzgOjRrUYt/4kzvq1gcUjPB21Nh7MERLbg3K7Bn9/lF600/Y+N2CQGDRRPI70ThMEyCaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3UBeIyqiYvy11aiqkpO//j7RfrMksCf+LqFH8+B5Wgs=;
 b=Tn9+BvURsmsO2hd+ucUrbxgulc1w1h0WOHct5wC+aJWPogxkDAE4wUZLreWh9d0Zxse9DJTAPRy1dSeIxzZmFyU7qPPHlZcLlgfQ1hGj33KG0APsT/GrSWsA93qWWmntPIm4gy7sXfbkyHX1ilcYyXkrY5+A4e7gfC+gEtEpER32VM5x5Qa1wfRJ+qRsahT9l4VK5rYzwZmHr2ruzopo9KUtHD/k9YaaStBsrxGB0bJWBjIOYXLAldUz1EBnBqyNdXLCrfiXQTJpTxapsFrRcJ0Hk+StSfAokGQDoURPvkpf3Su1vYMQusRVADIuwkBbMeEyKar0ZFBf5w18spALEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3UBeIyqiYvy11aiqkpO//j7RfrMksCf+LqFH8+B5Wgs=;
 b=G7Ui0MD9GBuRQ+J3L7Qpx+TmZIa2JyDOezrz80W7kjVVStSq+tYLWS3072oCLjb50qrUhHDMKiUxv/3XiluVyjcVs/8iCqc7wX3+CVMd0eH6u7Tm6bWp9ERFcMp/oLprYgxrPCYxCmcXrfks7keM4w969hO/6p/q/Ep6KIIOtY8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA1PR12MB7592.namprd12.prod.outlook.com (2603:10b6:208:428::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Mon, 18 Aug
 2025 10:58:48 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.9031.023; Mon, 18 Aug 2025
 10:58:48 +0000
Message-ID: <19c6c5da-575f-4908-8f2e-23ca8e5bffd6@amd.com>
Date: Mon, 18 Aug 2025 12:58:44 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] udmabuf: Sync to attached devices
To: Andrew Davis <afd@ti.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Paul Cercueil
 <paul@crapouillou.net>, Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20250814161049.678672-1-afd@ti.com>
 <0b963b02-dec0-4bf5-aea9-dbe3050716ee@amd.com>
 <008f6004-dcf0-42e8-b2df-f97c0ee5ba66@ti.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <008f6004-dcf0-42e8-b2df-f97c0ee5ba66@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0162.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ba::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA1PR12MB7592:EE_
X-MS-Office365-Filtering-Correlation-Id: f7784a05-9658-42c9-6c58-08ddde46359d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TlFsM2V4N0h4TWFsbXoyQ01yNDBHRkZnc1ZnZzdnaFVIcytMci9jTm5qWXYr?=
 =?utf-8?B?cVlhQmp4K2NsR3BWWmUyazdCV1ROMktmSGU4MXF3c3I3OHc2eW5Odmx5OWEz?=
 =?utf-8?B?Nm5vRUE4VDA1dzJ4eFpLbStTUkRjcmQzWmxVZ1pObTlGYVJoNmFBZlhFclZk?=
 =?utf-8?B?M2JPRy9CaHdxa1Z2K0hzejl4eTkxclJOWTlJMVFFRTVYRTRJaUV6bWxQL2Nu?=
 =?utf-8?B?N2RzQVlEdWI0a1JsRVAzamt1eFFFRGw0cWRmMlJtVkhVbGhXUThGdmRSZUdz?=
 =?utf-8?B?MXV2YkMzbkorUXM4YWNuTUJBUkF3bTdMTG9BYmpaMVFEQVRIdUVSWHVQL3FG?=
 =?utf-8?B?UnEvTkFIakR4emFZUXNCcHJHZmhvcmFQeW1vZmR0NjY5QXJ5VFNGYTl1V2JK?=
 =?utf-8?B?R3JWNjN2amQydlJ6L0VOMm90QkM1c2V2NXVoYTVCamVYeGhxeTBRb1VBR0JZ?=
 =?utf-8?B?ZjFJcDhnclBHTDdzZ2N2cG5ZYTBkMGV6dno2QTdhRjRnRjZ2YXhPczNmbzFi?=
 =?utf-8?B?Z3o5K1l5U1l6VVYwajhYZTZuSEd3MGt5Q0F6bE5mYUZWVDBpa3c4OXE4T3kz?=
 =?utf-8?B?N29nYXVwbURNb3pBMVcyR2hhbGxOZFNNZmxVc1VDakc1QlVHeWhUSE02N1I1?=
 =?utf-8?B?TEtWOVBHdnh6c1NlSXhqK3ZSUmdiSkFkMzdWdjc2N2h2US9jU1lmT3FqaWlq?=
 =?utf-8?B?MzA4Nm0vSnJQbzhzK1FqZEVQOFgxL01vZEM4bHBZaWgzU2d1YUwzUlZHUjlm?=
 =?utf-8?B?di9zWjcwUjlSNldrTU9pSWRKWjRYK0lPTTBZT0YveVhYcDcvTWN3aGdoS0NZ?=
 =?utf-8?B?NHhMUWxlbFFJdFBlRktUeDExT0ZkU09NR2NBeVcva0pGUlZucFVJVkR4SFV3?=
 =?utf-8?B?dHRwL2VydzVsTzNDcVVqWVNORzBqT1dFVG8yWDVEUTlyYTJSQ1B1UmVEbFlU?=
 =?utf-8?B?Skg4alk4TkduMCt2RHNWWk5uRE5kdk9aKy9mOHp0d1l3WlA0NjZtQXlsc050?=
 =?utf-8?B?WVYwRXNIM3ZocURYNHdTa08rYXZzaVFlc0tQNUtrVUp2T05KRDFwS0ZFdWxG?=
 =?utf-8?B?Qk9kN3VibzhHakNHT3VkZUFVbUo0TUhFTlRhc1VYUFlxQ2pzVW45MGMwZmNN?=
 =?utf-8?B?MzhVcmo4UStTMit6bjE3QnVyTnlRNHJ0Tktnb0Z2aXhzbmplazhyWlViRG54?=
 =?utf-8?B?Rk9oNGpqOEp3ckt3cmVhakJBQTI2ZGZzK2FXMTI3UjZKTk1SNHlqUzNFdmQv?=
 =?utf-8?B?U08yd1BMRENSY1VvVkxaYkd1U2Z1bVhQcHhUNUFQSXhPNDVTdXRqOWJRUFlr?=
 =?utf-8?B?MkJqWG1mN3A0Vm5MME0ydURBRzFJUDMwNkI1QkhuVnRjZlZYVlJzeEx4WmEv?=
 =?utf-8?B?MFZpc2NXbjNUd1VoeEhJUllGQUNQQTRQTDVVbEFQNWtPRjlZMEY3THVnSm55?=
 =?utf-8?B?RTVaRW5Zb291bEJIWmZSbCtjZzV0UFFpckYzTUJPWWR4MHpwdVg4SkM0K0Mr?=
 =?utf-8?B?SWtMeC9wZVVmR1NPOHk1NGZRc1Fob0pmMmttc00wd2d5NFY1SUFKb0N1cEVZ?=
 =?utf-8?B?UGdmVEdmNDJsOUswZVRLUVBmZGdUNXNGS2xvOExobHdkenpXQjFaY0FteUp2?=
 =?utf-8?B?SGhNeHQzdGs5eEthbkxZNXBWY2wrTVJuWENudFVEMjJ6M3RIMmd4dXhoYlFk?=
 =?utf-8?B?aUVUei9jMkk0NjJ4Y1lGNS95K0NpUzRSRTQ1VEVudllhNWpQMmhuMU9mTmFH?=
 =?utf-8?B?ZmZ6NFBOQlIwdjFTMmlSSHJnTi94Q1ptZ3IrcStybEUzYk52cDA5MEFkNk9J?=
 =?utf-8?B?VFZHMy9sQThDT1pJcTVvN3U4MnUveGNqcWtzSldXY0ppWTkyNTlTVmVmT0lI?=
 =?utf-8?Q?Xp/KAJdXs+9Jw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1IvMURtbnlQeFNMdmJkb0d5TGQ4bzBHYVRhNHZzVzNtNUVxWVlPZG9kVCs2?=
 =?utf-8?B?S1AwTGFIbUtQWXJqN3h1WUhOcXFIMndzYnFXSnhadytTQ3dLMVNGSGtQOTNw?=
 =?utf-8?B?TEFOd2padjdna0krS1RrQzM1b3VhbjhJYzYyWG9BbDQrWlgzRkNHS0xpTXU2?=
 =?utf-8?B?eFpXSFMzZ3htakIwZmlTZElZR0Q4b3VnbWM5dGo2SUxLSzFMeGdyeVlsRnhB?=
 =?utf-8?B?c1RFSG1PYW92NU52R3lFbnN2VWJxZS9zLzFaSnp3MEV0TTJzMy9aMUZmcjYw?=
 =?utf-8?B?MTRBZGlqL0hGc1BPbzIzWS93TVVXVFF4K3gwTlMrS0UxQ1o2VS9aVkNwRVc5?=
 =?utf-8?B?WFgxYjFBck1ZT2IvY0FJK2JDQm9McE5hTXFWZ3J3aTgrQUpTWnJxM1dUTDZV?=
 =?utf-8?B?QlgrSStkTTZ1bldlemYweWQxZG9HYUlla1RvMUN3MG1mMWVpMlFnRHNOQyt4?=
 =?utf-8?B?SHE3Rk5kY1NPUndKMEpCeGxRKzB6bW9ZdHZvWlY4ekM4MFhlV3ZKY1I0VzF2?=
 =?utf-8?B?VUpKaXdsWWlZQUhyQjFDWnBsVUcxNTdYZWVsYngzR1ZkcndzQjAwZG1JT3Nr?=
 =?utf-8?B?dDM4d252dEJaUlM1U2Z4OFYyYnEwMzhpRUV2b29oMU1wK3BCYkdHdzczbTZ3?=
 =?utf-8?B?UGgyR0tZc2I4aTVqZUhMMktsT2lIQXpuMEZXYU12NW5lUGR4Nzl1ZmhMWXMz?=
 =?utf-8?B?YVBwRUZKWlJNVFljbzNkOXVJKy9XUHlIV0VoYnhSdFlVTjFBSHExcWZRWXR0?=
 =?utf-8?B?M1E4OWsxSm4rOWNZbG13ZE9iTnpvOVFFWFBrTFp3aEZIOEc3a0NuZEJpQUVB?=
 =?utf-8?B?ZHMzUC9MMVUzcUx5K1lpYW9JZGNLWEw4Rmt0bTQ2SmlwY1cxdCtCejllNXd6?=
 =?utf-8?B?TC9qWkt4QzA4WXFwbFJFbW5yQkNhZTh4cFZ5V1UvYkFacXRQQS9tQkFwaGl1?=
 =?utf-8?B?clBmZFFQUFZPaU0yZXN1M3dUK2k1UHBSY1gyNlZ6N3RRbFVVV3EvRlRvZnFq?=
 =?utf-8?B?T21xYmN3Wng3TURQU09iZ0hDSnVVWnpkUnhjOGtsOFR4cUNJNDFieHdHazli?=
 =?utf-8?B?Rm1kOUlKLytaaC8yVU5DMVlDbGRlSVBSY0R1TFNWL1VKVFpWbkxWOG1oRTdu?=
 =?utf-8?B?SFhqWEVnQUxNNEo3UkYxNEJNOFlRUWlYYkRnT0JxelBPUHpZMlhKZEJwb2Zl?=
 =?utf-8?B?bkIxTmswaXoyK1l4MzVCM0xzSkQrdDZQVGJlbExzRWp5dVdmUWtMa284K0Ri?=
 =?utf-8?B?UUNaOXU1YmN5NUNHNG1RajVHdXFSY3ovYTQvMkZJSHNjU3pEZ3Ywbi8yQzh0?=
 =?utf-8?B?elBxb3ZJSzNKVCtxa21qbWhhV3JJS3BkSFl1KzlvNDdBbUVZdGl6Mm51Mkwz?=
 =?utf-8?B?RzVtTGpQUzRJMEdzejJhU0gzY2NxUi9XY0hxVUdFQlRXTjAwcUJzT0lGbDc1?=
 =?utf-8?B?THdhQ1l4akx5UmU4M0FYZFlaTUpWYlNZZk1LT2llVlFxSTdrWUw1ME1MY2ta?=
 =?utf-8?B?Y0s0NnRSaW9lQmtrdXZCUHBjYVFaaHNSWnkzWjhtRVJ4NzdmandWQ25OMFBB?=
 =?utf-8?B?V2hSYUxkMHYySWZ0RlRRLzZOK3hVMVN6ZjhnTEpkeFkxU05wQS9wYWR6d2gz?=
 =?utf-8?B?djZmSWRDRHlCbFFHdTg2NkZNU2p6NkVHR3E5SmJHejNVNk5tQ0pMa3U5S2xW?=
 =?utf-8?B?b0hxdzJoK2VFQ0ZLcndOSnYvNmRGSG00MW0vZENxdC9Rbkw0TGM2bzVRd29p?=
 =?utf-8?B?Y0pyL0tVR282TkJNZzdvcXMvSnRSY0hpUXdXdEszMVpNZXlPdGp0WmNtaWNr?=
 =?utf-8?B?OVVMNGZzOW9yNnBaUldYNE5pS1UxQlFlNGJyTDNGMzhMcC83RFBQZ0VCaUtR?=
 =?utf-8?B?OHlzQ2FyTXZQL25BWEVxelU2TnVPS1dBTmt5cXZHa0pCeTl5NTBJWUtuRmJm?=
 =?utf-8?B?YTRDOWhsVjAxNm9kazIrK3ZVWkFHZXdKV0M0WWtqM0dqUTcxQ2dxbUVLM0p4?=
 =?utf-8?B?Vm9ESlFmcmQ5MmdvZXFzbXprYWNwRVozaVc3NkI2eHVwcFNjaWxUb3MwSVor?=
 =?utf-8?B?MmNVOWthQXJVWFZXUzNydU5jVGsrd1p5cVREZk9ISDZEVXVNQlh0cHAyck8r?=
 =?utf-8?Q?j2wYwUrq7DjzfzLjZoXeK/xLf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7784a05-9658-42c9-6c58-08ddde46359d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 10:58:48.6500 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zCrFCGQL8ZZu+uXR4/uTm6vkhK55fTDgCmcCyde5XEjvhp6eUWA/HW+IF7o+TICs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7592
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

On 15.08.25 21:40, Andrew Davis wrote:
> On 8/15/25 4:41 AM, Christian König wrote:
>> On 14.08.25 18:10, Andrew Davis wrote:
>>> Hello all,
>>>
>>> This series makes it so the udmabuf will sync the backing buffer
>>> with the set of attached devices as required for DMA-BUFs when
>>> doing {begin,end}_cpu_access.
>>
>> Yeah the reason why we didn't do that is that this doesn't even work 100% reliable in theory. So this patchset here might make your use case work but is a bit questionable in general.
>>
>> udmabuf is about turning a file descriptor created by memfd_create() into a DMA-buf. Mapping that memory can happen through the memfd as well and so it is perfectly valid to skip the DMA-buf begin_access and end_access callbacks.
>>
> 
> If someone maps the memory backed by the DMA-buf outside of the DMA-APIs then we cannot really
> control that, but in this case if they do map with the DMA-API then it is *not* valid to skip
> these begin_access and end_access callbacks. And that is the case I am addressing here.

Good argument, but that needs quite some documentation then. udmabuf.c could use some general documentation anyway.

> 
> Right now we are not syncing the mapping for any attached device, we just zap it from
> the CPU caches using some hacky loopback and hope that is enough for the devices :/

Yeah that is just pretty horrible.

> 
>> Additional to that when CONFIG_DMABUF_DEBUG is enabled the DMA-buf code mangles the page addresses in the sg table to prevent importers from abusing it. That makes dma_sync_sgtable_for_cpu() and dma_sync_sgtable_for_device() on the exporter side crash.
>>
> 
> I was not aware of this mangle_sg_table() hack, must have been added while I was not looking :)
> 
> Seems very broken TBH, taking a quick look, I see on this line[0] you call it, then
> just a couple lines later you use that same mangled page_link to walk the SG table[1]..

sg_next() is skipping over the chain entries, only page entries are mangled, but I completely agree that this is as hackish as it can get.

We just had quite a number of harsh problems and even CVEs because importers didn't got that they absolutely shouldn't touch the underlying page of a mapping.

Allowing userspace to R/W to freed up memory or messing up the page count is not funny at all. 

> If anyone enables DMA_API_DEBUG and tried to attach/map a non-contiguous DMA-BUF with
> a chained sg I don't see how that doesn't crash out.
> 
>> That's the reason why DMA-buf heaps uses a copy of the sg table for calling dma_sync_sgtable_for_cpu()/dma_sync_sgtable_for_device().
>>
> 
> Could you point me to where Heaps uses a copy of the SG table? I see it using the
> exact same SG table for dma_sync_sgtable_for_*() that we created when mapping the
> device attachments.

See dup_sg_table() in system_heap.c.

Apart from stopping using sg_table in DMA-buf at all what we could potentially do is to improve the mangling. E.g. just allocate a new sg_table, copy over all the DMA addresses and keep the page_link pointing to the original one.

Regards,
Christian.

> 
> Thanks,
> Andrew
> 
> [0] https://github.com/torvalds/linux/blob/master/drivers/dma-buf/dma-buf.c#L1142
> [1] https://github.com/torvalds/linux/blob/master/drivers/dma-buf/dma-buf.c#L1151
> 
>> It's basically a hack and should be removed, but for this we need to change all clients which is tons of work.
>>
>> Regards,
>> Christian.
>>
>>>
>>> Thanks
>>> Andrew
>>>
>>> Changes for v2:
>>>   - fix attachment table use-after-free
>>>   - rebased on v6.17-rc1
>>>
>>> Andrew Davis (3):
>>>    udmabuf: Keep track current device mappings
>>>    udmabuf: Sync buffer mappings for attached devices
>>>    udmabuf: Use module_misc_device() to register this device
>>>
>>>   drivers/dma-buf/udmabuf.c | 133 +++++++++++++++++++-------------------
>>>   1 file changed, 67 insertions(+), 66 deletions(-)
>>>
>>
> 


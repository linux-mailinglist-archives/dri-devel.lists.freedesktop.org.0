Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82ED096FC30
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 21:36:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF18010E1AB;
	Fri,  6 Sep 2024 19:36:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="jWpKVXhs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2050.outbound.protection.outlook.com [40.107.92.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88CE610E1AB;
 Fri,  6 Sep 2024 19:36:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JnyX9kWC91bFaDMqsvyuoa+znGck1X07h/ohcUEkqy0To6f3a9VLplGhUrQzcl0A7Qclpu1YYheS60asKoO1+KAFzFITHZh9C8SjfxjjYa6MixXO3r83TZGJghirpbFOSdOrBw86hSZrII8wukk/9BW0ph983rxlmAan5OB4Eaqe1ABX5fNFW6n2DaSVhYxWeXxUHrrx3P+bqy4l2CoK6NWl9ud9mT1UUo8hISjiO3XaZxrka9TfSrTAjlW5WBvoZpX1tYYH1U65WnIVE6coy/GySKHwkJ6JLh7Z0bQCxLvsehABr4/YrEMvZGlCtcIUSlAridbZ3AgWn2kpxpR7TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vhZNxr8P3BHds85EWDv/H3Hh+dTO10+1ivkxHErM5OU=;
 b=wiHkCHfGvsmc0tRILehze15cw5+mxYBgvl4mKszboSrxtM3LoFXUZF2LRePugFxcKhmX0pOBhayQLQq8+WdKKvgaWJfDTTKu0A4PcyEwVZp3djAIM9qVT+XF57eqDyr2CQ1HbVsSSvYzcFV+IJc3CZCooX6v1AqrUqYot/qPmS13a5Su+yJq2xam+6o/Iw4CixmK4u68wu08bTjm6/Q8WULzdjsv7Q8lIvg9TQRfe4KElQd3f4bGIalWT6RcsqbgqVqTXUXG474QKt3hiwfYG5hA1aVOtBqRbUAXBXvhfJnPxkEFRiH/AmrJImlQ2hIBVliMbxiZmblymXmJOadAWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vhZNxr8P3BHds85EWDv/H3Hh+dTO10+1ivkxHErM5OU=;
 b=jWpKVXhsMQNPKDlq+NbZgxtR+yaPyJRQJUWJdhgfLWSAOasQSHPDnBexSpPIc+3K11lV37KLcOaF+iamEA5U83di2GCMistI2wCnR7j7S9NBwbY2XzQ4wSxWPsSFcPsAQ7F+H5a/psQSbC5PcHdkdMhOrFIIUhzxJTVz3OIDz4lbnLGvqet0NoqRRNG61pxvW/Jc3edTYx5KbjMZxTEOWf27q2YgNYXAbm46/sZD23vkN2SMjLCxnRzn9KuUvAYFhfyBr8dWfQc+wALC23KqbkOggYrhzKuYr5McgW89Xh6GmIijy6ZAd0R8Mkff11L0978ec7ptVc83ZDT0kJg0ww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8652.namprd12.prod.outlook.com (2603:10b6:a03:53a::18)
 by MW5PR12MB5649.namprd12.prod.outlook.com (2603:10b6:303:19d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.23; Fri, 6 Sep
 2024 19:36:34 +0000
Received: from SJ2PR12MB8652.namprd12.prod.outlook.com
 ([fe80::8d16:b805:76f2:fdf4]) by SJ2PR12MB8652.namprd12.prod.outlook.com
 ([fe80::8d16:b805:76f2:fdf4%7]) with mapi id 15.20.7918.020; Fri, 6 Sep 2024
 19:36:34 +0000
Message-ID: <21e44532-7989-43a9-99dd-04461c346be6@nvidia.com>
Date: Fri, 6 Sep 2024 12:36:27 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] drm/nouveau: Add drm_panic support for nv50+
To: Ilia Mirkin <imirkin@alum.mit.edu>, Jocelyn Falempe <jfalempe@redhat.com>
Cc: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
References: <20240906100434.1171093-1-jfalempe@redhat.com>
 <20240906100434.1171093-4-jfalempe@redhat.com>
 <CAKb7UviZ_SZyuEV3apP80oEHZZKm4mAY1pSGueSOEswvzwgdkQ@mail.gmail.com>
Content-Language: en-US
From: James Jones <jajones@nvidia.com>
In-Reply-To: <CAKb7UviZ_SZyuEV3apP80oEHZZKm4mAY1pSGueSOEswvzwgdkQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0052.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::27) To SJ2PR12MB8652.namprd12.prod.outlook.com
 (2603:10b6:a03:53a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8652:EE_|MW5PR12MB5649:EE_
X-MS-Office365-Filtering-Correlation-Id: ae470ab1-9566-42ea-eedb-08dcceab3718
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SGJtdG9VZVNOSWwvMERqeC8vZlJxU0ZEUHpEOVlhL2NIMVFiVjhYL3Q1czFl?=
 =?utf-8?B?Ny83K2NsdUkzcDZ5Ti9yYTVPNlVmaE95clMrMjlTZnhBMUtIcVd2eGFzOFNq?=
 =?utf-8?B?NEVqT3c0bUpIVWE1czhmN2VRSTFZUjk5bE1YUHBrN2ZaeU03NVg3TW1SK2FR?=
 =?utf-8?B?SWV2YjM4eEJBL0p0dXU4anlTSTFBWERRUjNxcVhJcUljMXBERG1LVlBzcHpr?=
 =?utf-8?B?WVNTL0c0NkpmaS9hdEIzYzdVQWxRSWhhMGt0SUFGbjFnd2tlbUtNNEFBWnIy?=
 =?utf-8?B?NVhKUTE3Zzg0MnhveGlGSG02OHFxWjBwa3ZpWTRSZmVpU05qZWovYkN6TnE3?=
 =?utf-8?B?cGo4MGNTKzVUUEwwUDZRaDMva1hGbGszSmszVUxIMDdLZzFQWHFUMDNQQzF3?=
 =?utf-8?B?ekVPWDdEN2s5d1Z2VGFmYjBxSDVUc08xeGhBMzVLM052bzV2Nng4VlhGZitz?=
 =?utf-8?B?SDZqVm9ueTg4MTRONGtmMmNrZVQvNk4zejNCVnFwRXJaRnZ6dy92QnorOFVF?=
 =?utf-8?B?YkhyT0JPMnNka2Y4WFZNYTJPOFpDcFljamhZZ0FCSFBBTXlWMVByUzdjWHla?=
 =?utf-8?B?a010Skp6N2g3M2tGWUlCZVNvbUUzZ1Z5c2U5NnZmaGE1c1M1aVNCWU1NdDlv?=
 =?utf-8?B?Zm1mMmVlTHVud3RQMEdMZ0pRUVB2bzcwNUdlWkhId0tXRGhBdHl2RmJIY2lj?=
 =?utf-8?B?bE5zVnB6Z3RJTnBJRy9yc0hidUVHd0NlMHhFS1BCSldYWFVDT0hBSFFOZkVJ?=
 =?utf-8?B?SVpDNmhGTEN1OGlzZmlHTXhRTDFmbE14MDN3a3ZYMTZxTTFiSXVuVnF4cFpD?=
 =?utf-8?B?SDJOUW02dkdzaDFvUFkwVTVXRU03Q1BTYnY1QWVLWk5mK0Rpc1hiV3pGSHFi?=
 =?utf-8?B?bS9SbEcrSFY2eEh4OFdYcTE4NTBIZEdLUWZwRm00UDcwK0VxSkVpUHlFcGhW?=
 =?utf-8?B?OUttVVhvRndKRDhxQkdjRm5MaEZGTUtCbFZHTzF1U3JJRk4yc3FkUGhTMEw5?=
 =?utf-8?B?Y3ZWYW9CbFJ5dkVQd3RiZndscUlMUzYySVdnMHdJOW1NaHhmSGJrK2JhVGVQ?=
 =?utf-8?B?Yk9tV1pzZE9TcmdoTHlza0VSdEUzZmx0VGZhSS9BdGFrQXgzaGhodW9IT212?=
 =?utf-8?B?c1U3TlZTSkIxVjNFbkR3b1N1dHlFRzZydmJTTE9PSzFYamsraURvbk5uMTNW?=
 =?utf-8?B?RWRRV0tVaTJpZmF3bmFFbC8wbXo2RlVFWW1iMUlZOStDMEtvenczNGwwNkp4?=
 =?utf-8?B?WkJpbWhyang1VUpraTNNU0VqRzEwY1IzNWF4dUpVNmFHc0ZDeXA1MFBjbko4?=
 =?utf-8?B?bDZUcTBOL2RwNlVsRWQ3SWJ6NGVmU2J2ZExjUnlWTXQzYUxkbUxFK29tbmpn?=
 =?utf-8?B?NXBmVmc2RzRxK3YxMG5KMFYzbVgrVFhMUXF0NXJWVk5QRkZxQjA5OVE5YlBE?=
 =?utf-8?B?L2IyaTBvRnNkZ0NvV21yeHc5WjkvT3M3Ym8vRXVnYWtCMjE4akVmNHM2blAw?=
 =?utf-8?B?cUlGN2NFQUdYbFQ0S1BTM2pDNkJTWDhDVW4raTl6akN6ZDBSWndtazd6ZUlk?=
 =?utf-8?B?T2dYYjFCb2I2UmV6Si9JaUtRTWZyL1I0RytLeTA1MnRScHh1eUY1ZDNURlFJ?=
 =?utf-8?B?Ry90QzZzc1BZbDdyQXRKM1k3YWN3S0V2dmxGamliL1poQnpxc1Nyb2crTXk5?=
 =?utf-8?B?aDhZTDEvUEZZVHZiS1UrQnRYRHA2VEluTnZmV3lBeVpoaDhEQmtHL1c5QTNI?=
 =?utf-8?B?UWgrWXBDTHlla1N1QzRRT1A4aE91RUdEeEUvYTIxRE5qU29BeGI3UTZ2TzhR?=
 =?utf-8?B?cnJxVVdSK1hVUWpFSVVYZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR12MB8652.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1d5Q2ZFUXpuK09IeEFhd2tMam9OcnpZdjdILzhLbXgrMFNFbWJWbDZqK2Nw?=
 =?utf-8?B?WTAwTWVNMktZU0o0N0lmZXVyQlBpUlBTNTBYSFVqNDdGbHQyUUNpNmZoa0g4?=
 =?utf-8?B?dnhldTkzSXlnRERpYlYzdmpCYytMNkI1bUM1OVpKOTNoN1JxWkJnTnkwSFJR?=
 =?utf-8?B?Nmo0V0VaV1B4ZDFsK2wvTm9nNGowcWZSdFJlUDVUU1dETEtjbS9DckpFaUdn?=
 =?utf-8?B?ZTJmc1VlWWFHNFg4NmF2OENGck1VbWFRVWhIMmdFWlJwWlU2WjBUbzN4REww?=
 =?utf-8?B?RGNXNEVua3pyMjhuYk5kQi9rN3ZaVnVkQ1oycEQ4azZzOHBaeWNKbWY3aXB3?=
 =?utf-8?B?bC80aUVHWEpHSENLMExmSlZlRWJtVUxyZFI2S1pZeUZlREFnZ3c1ZDBYYWU4?=
 =?utf-8?B?UTZqeStxR0E3ejJDQXdsaDBKYlM1emlwdG5MaktDT0Y2Ny9PdUJjK2k1N0Zr?=
 =?utf-8?B?WUpJVHNJeDQ4RTBjREljQ3VQeWdXdk9zem84YXpvOWxjTXpiczY1c2xObGhO?=
 =?utf-8?B?YUJpaktCSURaMU93OHpBVlRkS1FvVEtNUHl4ajBvQ3VvcnllY3dydmRUbjY1?=
 =?utf-8?B?VjFKbnU5MDFLeEoyUENRRW82TVBWRU9LWUUyVW82M3dvZi9oYjRKZ0paRTRx?=
 =?utf-8?B?cXNUcGZDSm1UL2VPU21JbmZNd1h0cHg2SWhjYkY2Z3JtYWpCTzFvT1BJblF6?=
 =?utf-8?B?NjdMZWxkZTNreEdDcktkSmZhbXgvVzZCL0taSFBiRjkvRys3d3dGanh3VHNj?=
 =?utf-8?B?OUtUYmYrTVNaMFhyN2hoVHRBVWx3c0h2VlVFUGdXS0orZUR1MEMvbndIcElR?=
 =?utf-8?B?VGdnb0dlVFE1Mk5qQjMzb1JyelNOUGMvZ3JtWnhDbDQyT01zTWV2aHVXMUxE?=
 =?utf-8?B?ajdOcHhaNmpYSFhjYkZyUnZOUCs4eEF5b3UwaUFxUmJkUmcrVDhUbFdSOWF2?=
 =?utf-8?B?QWhzSFc1cG1PWk5MdUhWdWdTaDFJQkR6bnFZTFp6S3dWb2FTUDEycTNSZ3dX?=
 =?utf-8?B?ckZDSUNQTkNZWmJDUkRhelE2dmMzbTlpM2JKK3ZkcmlGV3F4aC95cHcyM3lC?=
 =?utf-8?B?RERodkZlMWpKRk0rV2Voc2Nla1dMZWZFQkhtTDlaRk1ILzZyUGdJbTdpY3Rw?=
 =?utf-8?B?Y0JRREFRc0FhWjJtSXFSTnFzMWtiLzRLc2NCK3JHeGZIWWg2RjJ4VWx3QzVr?=
 =?utf-8?B?dERKckNUUDEzNUZEbUlaSGxLL3hmQVVsR1R1SUZKc1AwNjlMRUJqbm9MUU5Q?=
 =?utf-8?B?NmdqSnJuSVdtRnNJNzh3OGlKSS81S1BjalZrRUpqSHU5Tzgxd0VTc0Q2Q0Zj?=
 =?utf-8?B?SHM5TGlLTENCZHczU1pXYW5FWGJmM1hkTS83RmFTbW5xaThGWitIWVlnUndH?=
 =?utf-8?B?YzFscmdsd21NUzVKdFRGeWk0RlVXV3RReXN2TXN2UEozVDIvU0Ntc2Y4MUNk?=
 =?utf-8?B?VHJJcGpybUYwM29wL1BRYzFLTmNkZGNqc0xMWHJFRUhGNWlwOGJpZXRzK09h?=
 =?utf-8?B?WUVkeXhWYzNsWTUrTEZQbER6eWJrV3JCRHFOTnNuNkYyVGpyUmdXTXE2SS9Y?=
 =?utf-8?B?N0dUd2xMT1Flb3FxY01IRjVKVUYwbTdyR09tcExOUGRZWUFpc1QzVGs2ZENW?=
 =?utf-8?B?clUwYXhUWld2RDdYbzhtcUlDSVpBcDRUNXdZdklMK3pqdm5QQUtMd211K29T?=
 =?utf-8?B?bk1vaTlzeFZlc0pHWW5BZ0UzQjBTTDhYNjFlVzhjZExWbzhaalBGaVAyZ2Nk?=
 =?utf-8?B?OU9Tci9RR0lweFJ3eVl2RXdxYlZxaTFJL2lwbXk2MGNnN1kzQXpGN0JpOU5l?=
 =?utf-8?B?UThmSjhmTFBqSSszQjFONlkzZXlROXVrVFJTTFdhNmlsZm1VNURlTXlYL3I2?=
 =?utf-8?B?aDZVSmVmbU01QkRUR3V3UkM5QlYxTThyYm12ZGdZTFlwUUc5aTQrSCtSNVdu?=
 =?utf-8?B?MDg1VGNJaHdqQ1BVRGJlelFkeW1PRGRTdk9IMUpNNDJlMlZVdkVJTkk1WWNq?=
 =?utf-8?B?b3UxYWJnOExkMUFIRjFpblJpK0RhRld3V2VzbFNISis1K01VWmpQSEJMVkJN?=
 =?utf-8?B?WVhZZEV3d2xxQ0JRcGs2S1VPeWFqcEJheHMvNEUxTE90aUxEUTFBYWhjYnNY?=
 =?utf-8?Q?o/eLPwg+I+V0d5PyLHbaNxAVy?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae470ab1-9566-42ea-eedb-08dcceab3718
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8652.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 19:36:33.9820 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EYUeoF5oCv+KZu6i84iRIVC+yr0SkuXE1qYHgZsv+pK0BAx7lSyQIwqUqMV8d0ulxIRf1c6MxdbD427Dz5wv7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5649
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

Right, there are 3 iterations of block linear tiling actually. NV50 does 
support scanout of block linear surfaces. All block-linear-capable GPUs 
do. The 3 generations are:

NV5x/G8x/GTXXX line: Original block size.
GFXXX(nvc0 I believe in nouveau terms)-GV100: double the block height I 
believe.
GTXXX+: Same block size, but the layout within a block is subtly 
different, at least as visible in CPU mappings.

If there isn't enough info on the layouts in the reverse engineered 
documentation, believe this is somewhat documented in drm_fourcc.h, and 
it has a link to a technical reference manual describing the details of 
the 2nd-gen layout (Pre-turing), though I believe it's behind a 
developer account login wall that's free to sign up for but may require 
agreeing to a EULA of some sort regarding the content. Once you get the 
pre-turing layout working, just halve the block height to get it working 
on NV5x. If that isn't sufficient, reach out and we'll see what we can 
do to improve documentation or answer specific questions.

Thanks,
-James

On 9/6/24 05:53, Ilia Mirkin wrote:
> On Fri, Sep 6, 2024 at 6:05 AM Jocelyn Falempe <jfalempe@redhat.com 
> <mailto:jfalempe@redhat.com>> wrote:
> 
>     Add drm_panic support, for nv50+ cards.
>     It's enough to get the panic screen while running Gnome/Wayland on a
>     GTX 1650.
>     It doesn't support multi-plane or compressed format.
>     Support for other formats and older cards will come later.
>     Tiling is only tested on GTX1650, and might be wrong for other cards.
> 
> 
> I'm moderately sure that nv50 and nvc0 tile differently (the general 
> algo is the same, but height is different):
> 
> https://envytools.readthedocs.io/en/latest/hw/memory/g80-surface.html?highlight=tiling#blocklinear-surfaces <https://envytools.readthedocs.io/en/latest/hw/memory/g80-surface.html?highlight=tiling#blocklinear-surfaces>
> 
> That said, I don't know that nv50 supports scanout of tiled surfaces 
> (nor was I aware that nvc0+ did, perhaps it's a recent feature, or 
> perhaps I'm just forgetful).
> 
> Cheers,
> 
>    -ilia
> 
> 
>     Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com
>     <mailto:jfalempe@redhat.com>>
>     ---
>     v2:
>       * Rebase and drop already merged patches.
>       * Rework the tiling algorithm, using "swizzle" to compute the offset
>         inside the block.
> 
>       drivers/gpu/drm/nouveau/dispnv50/wndw.c | 107 +++++++++++++++++++++++-
>       1 file changed, 105 insertions(+), 2 deletions(-)
> 
>     diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
>     b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
>     index 7a2cceaee6e9..50ecf6f12b81 100644
>     --- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
>     +++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
>     @@ -30,11 +30,16 @@
>       #include <nvhw/class/cl507e.h>
>       #include <nvhw/class/clc37e.h>
> 
>     +#include <linux/iosys-map.h>
>     +
>       #include <drm/drm_atomic.h>
>       #include <drm/drm_atomic_helper.h>
>       #include <drm/drm_blend.h>
>     -#include <drm/drm_gem_atomic_helper.h>
>       #include <drm/drm_fourcc.h>
>     +#include <drm/drm_framebuffer.h>
>     +#include <drm/drm_gem_atomic_helper.h>
>     +#include <drm/drm_panic.h>
>     +#include <drm/ttm/ttm_bo.h>
> 
>       #include "nouveau_bo.h"
>       #include "nouveau_gem.h"
>     @@ -577,6 +582,93 @@ nv50_wndw_prepare_fb(struct drm_plane *plane,
>     struct drm_plane_state *state)
>              return 0;
>       }
> 
>     +#define NV_TILE_BLK_BASE_HEIGHT 8      /* In pixel */
>     +#define NV_TILE_GOB_SIZE 64    /* In bytes */
>     +#define NV_TILE_BLK_WIDTH (NV_TILE_GOB_SIZE / 4) /* For 32 bits
>     pixel */
>     +
>     +/* get the offset in bytes inside the framebuffer, after taking
>     tiling into account */
>     +static unsigned int nv50_get_tiled_offset(struct drm_scanout_buffer
>     *sb, unsigned int blk_h,
>     +                                         unsigned int x, unsigned
>     int y)
>     +{
>     +       u32 blk_x, blk_y, blk_sz, blk_off, pitch;
>     +       u32 swizzle;
>     +
>     +       blk_sz = NV_TILE_GOB_SIZE * blk_h;
>     +       pitch = DIV_ROUND_UP(sb->width, NV_TILE_BLK_WIDTH);
>     +
>     +       /* block coordinate */
>     +       blk_x = x / NV_TILE_BLK_WIDTH;
>     +       blk_y = y / blk_h;
>     +
>     +       blk_off = ((blk_y * pitch) + blk_x) * blk_sz;
>     +
>     +       y = y % blk_h;
>     +
>     +       /* Inside the block, use the fast address swizzle to compute
>     the offset
>     +        * For nvidia blocklinear, bit order is yn..y3 x3 y2 x2 y1
>     y0 x1 x0
>     +        */
>     +       swizzle = (x & 3) | (y & 3) << 2 | (x & 4) << 2 | (y & 4) << 3;
>     +       swizzle |= (x & 8) << 3 | (y >> 3) << 7;
>     +
>     +       return blk_off + swizzle * 4;
>     +}
>     +
>     +static void nv50_set_pixel(struct drm_scanout_buffer *sb, unsigned
>     int x, unsigned int y, u32 color)
>     +{
>     +       struct drm_framebuffer *fb = sb->private;
>     +       unsigned int off;
>     +       /* According to DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D
>     documentation,
>     +        * the last 4 bits of the modifier is log2(blk_height /
>     NV_TILE_BLK_BASE_HEIGHT)
>     +        */
>     +       unsigned int blk_h = NV_TILE_BLK_BASE_HEIGHT * (1 <<
>     (fb->modifier & 0xf));
>     +
>     +       off = nv50_get_tiled_offset(sb, blk_h, x, y);
>     +       iosys_map_wr(&sb->map[0], off, u32, color);
>     +}
>     +
>     +static int
>     +nv50_wndw_get_scanout_buffer(struct drm_plane *plane, struct
>     drm_scanout_buffer *sb)
>     +{
>     +       struct drm_framebuffer *fb;
>     +       struct nouveau_bo *nvbo;
>     +
>     +       if (!plane->state || !plane->state->fb)
>     +               return -EINVAL;
>     +
>     +       fb = plane->state->fb;
>     +       nvbo = nouveau_gem_object(fb->obj[0]);
>     +
>     +       /* Don't support compressed format, or multiplane yet. */
>     +       if (nvbo->comp || fb->format->num_planes != 1)
>     +               return -EOPNOTSUPP;
>     +
>     +       if (nouveau_bo_map(nvbo)) {
>     +               pr_warn("nouveau bo map failed, panic won't be
>     displayed\n");
>     +               return -ENOMEM;
>     +       }
>     +
>     +       if (nvbo->kmap.bo_kmap_type & TTM_BO_MAP_IOMEM_MASK)
>     +               iosys_map_set_vaddr_iomem(&sb->map[0],
>     nvbo->kmap.virtual);
>     +       else
>     +               iosys_map_set_vaddr(&sb->map[0], nvbo->kmap.virtual);
>     +
>     +       sb->height = fb->height;
>     +       sb->width = fb->width;
>     +       sb->pitch[0] = fb->pitches[0];
>     +       sb->format = fb->format;
>     +
>     +       /* If tiling is enabled, use the set_pixel() to display
>     correctly.
>     +        * Only handle 32bits format for now.
>     +        */
>     +       if (fb->modifier & 0xf) {
>     +               if (fb->format->cpp[0] != 4)
>     +                       return -EOPNOTSUPP;
>     +               sb->private = (void *) fb;
>     +               sb->set_pixel = nv50_set_pixel;
>     +       }
>     +       return 0;
>     +}
>     +
>       static const struct drm_plane_helper_funcs
>       nv50_wndw_helper = {
>              .prepare_fb = nv50_wndw_prepare_fb,
>     @@ -584,6 +676,14 @@ nv50_wndw_helper = {
>              .atomic_check = nv50_wndw_atomic_check,
>       };
> 
>     +static const struct drm_plane_helper_funcs
>     +nv50_wndw_primary_helper = {
>     +       .prepare_fb = nv50_wndw_prepare_fb,
>     +       .cleanup_fb = nv50_wndw_cleanup_fb,
>     +       .atomic_check = nv50_wndw_atomic_check,
>     +       .get_scanout_buffer = nv50_wndw_get_scanout_buffer,
>     +};
>     +
>       static void
>       nv50_wndw_atomic_destroy_state(struct drm_plane *plane,
>                                     struct drm_plane_state *state)
>     @@ -732,7 +832,10 @@ nv50_wndw_new_(const struct nv50_wndw_func
>     *func, struct drm_device *dev,
>                      return ret;
>              }
> 
>     -       drm_plane_helper_add(&wndw->plane, &nv50_wndw_helper);
>     +       if (type == DRM_PLANE_TYPE_PRIMARY)
>     +               drm_plane_helper_add(&wndw->plane,
>     &nv50_wndw_primary_helper);
>     +       else
>     +               drm_plane_helper_add(&wndw->plane, &nv50_wndw_helper);
> 
>              if (wndw->func->ilut) {
>                      ret = nv50_lut_init(disp, mmu, &wndw->ilut);
>     -- 
>     2.46.0
> 


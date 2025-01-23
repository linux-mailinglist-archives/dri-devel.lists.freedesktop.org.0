Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C68A1AB0A
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 21:16:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63D3310E894;
	Thu, 23 Jan 2025 20:16:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="CLa/wSVC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2069.outbound.protection.outlook.com [40.107.237.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 427DC10E897;
 Thu, 23 Jan 2025 20:16:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sAPWEKOCnA+QBu536nz31wkvuyuMcbILP3bUXo4nAXJQgwDoyVsjgTBrJUfFHbY5lR3SMUs16u3ifJy8kp+YNNKshfG0zT+cpz5YTP4YiJ3nkaVWNk8fZpS0JjhPAge97GBxVbG/d/xwuwG64OMF1EnpSIwXo77pcYnyKI3FmYKfC9IFMpE4ZAvFbL1WIGmisC0fR6/XuRgo+fVk4Szfb/iSC4fzAxctLCoxxN92mS8WUiXAncyGLTcAQrYrGxrn0bl5bzVKve6V9QhiH+syZNO0JakxpNtbgGxNlTO86uKSQf0JtrxUHGUxjo0fG+x+Sa91cPyktUAPoBmHzhvQmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1k27dYj6yMMwu4Dn57uA4hI7Tz56XkpAWji5s48xCoY=;
 b=xb9FKAe6hN3gU/4ctQH/46XHq2ZF0brOfnuPo6uR1W2mQ50l6TFPiGNZEPFmtfhgyAibmHsMa3HRPyq5CXJRGeVrlA69tELpAbQo3sRxRQw+5v49vFcXorUxpiJQks4O/RDNR/Um48SXAaqwSLIaXWr0qDOC3xBEYoN0BHsCPekJ5xQ+KD+3jrvtQEzwBjAWh87JjpnQyUeZrK3pqoPD38M/a92KuVyb548XNiEZ0PNC00jV1SwV0TEy/6pDBoHhsUf/AntH3t+W8+dmj+PBz5jc0v9Peh+Dmtlx4NTMCqS7piARF4etAJOdB0ufU0sBHhaoR0w7a7s7SIqbsEHfAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1k27dYj6yMMwu4Dn57uA4hI7Tz56XkpAWji5s48xCoY=;
 b=CLa/wSVC1UDP+8D+oejmnISGxLlAWWslNUTeCWroWNBQQL6BYRrmw/x3WaKhKoALbikTxQnXxKGNcGs/b3bJyfP6T/eFjzU7PfYp/VNppvq74VlXN+aYU5vii3kiubYH15KoBgPyo3fJOaUEMmGfhMviTfJ5B9U8B9N/bAR6vc0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by SA1PR12MB7104.namprd12.prod.outlook.com (2603:10b6:806:29e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Thu, 23 Jan
 2025 20:16:32 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062%4]) with mapi id 15.20.8356.020; Thu, 23 Jan 2025
 20:16:32 +0000
Message-ID: <9cc07dc9-ce0d-40cc-ae70-55a1b3f176e2@amd.com>
Date: Thu, 23 Jan 2025 15:16:29 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [V7 31/45] drm/colorop: add BT2020/BT709 OETF and Inverse OETF
To: Pekka Paalanen <pekka.paalanen@haloniitty.fi>,
 Alex Hung <alex.hung@amd.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org
References: <20241220043410.416867-1-alex.hung@amd.com>
 <20241220043410.416867-32-alex.hung@amd.com> <20250116105622.577533fc@tisha>
 <20250117110641.7040f712@eldfell>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20250117110641.7040f712@eldfell>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0307.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10e::11) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|SA1PR12MB7104:EE_
X-MS-Office365-Filtering-Correlation-Id: 96b5db00-da3e-4aa9-03db-08dd3bead415
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YmxxRURDcEpDeWVSM0cxZThFQjk4WUxodmhSOHczRlJHckNWSVVIaVlUaXY5?=
 =?utf-8?B?RlRRS3lqVUJEVXRUN1FrT2QrdjBpcUxZNDBhTVF3dmVBU3AyM2k4NFVmeXpI?=
 =?utf-8?B?NnhJcWhZSEV0cWFsL2NHUGIxeXBMQ1ZTUm9LTE9HZW82aStoZyswR05TRVVp?=
 =?utf-8?B?V2ZFamR0cU9JU241NnprVUlOQ2NTNTczY0RZRlcrV1dhSXhPNEE3RGlHV1NM?=
 =?utf-8?B?dVFOeHlxWUNzLzIrc0ZDNXlBRnhiRkJzMjhaT25lYS9BTkpRczQyOHZraUND?=
 =?utf-8?B?VzFFb2R3R0d0Wmt0UnZLNjBmQkpYQ09rdGJEcXVPOWRzdE1sWXczVTRJQ0dS?=
 =?utf-8?B?ZVNraXM0eEtUMnJkRTkrSjN0THFkSythTWpKWHFxbGszOHN6cEZCZGxPMlRz?=
 =?utf-8?B?bzVqN3c0MmFYSXJxRXhaMUJsK3BzSmdINGRlVjkzRDR5SjZPSDVEclcxRXZo?=
 =?utf-8?B?SU1KNWJ1VmJ5TkFYVjBXR3ljOWdtZXoxcEFlMHgyZXorUFZ5TzJ4ZnZRaThZ?=
 =?utf-8?B?eVB4dTU1ZnhzUkk3bmw3VjV0UEh0TzVyNHl5bTBJM1JoZWtpMndGdlZwOUtp?=
 =?utf-8?B?enNlWk9OdmpsdnJOVEs1RFVNWTVvMTgxV3hMN0N5enhzL2FhaFQrWXNIcmNP?=
 =?utf-8?B?SDJnSFdDZjFBKytFeGF5WHJCUUVBSXdMcm9sM25RbTcvV0pKeWNnem9UeWZE?=
 =?utf-8?B?TjMxSmxqbHZ6dTY2REpLaVpNT2phTXVSbkRDWGFuUitmeDN0TVVCL2M5SVp4?=
 =?utf-8?B?ekRLRzl5cUVyWWVuM3dvR2E2dnhYY1A1K1NKTnhHbFViN2VLVHZUMTdnRHVR?=
 =?utf-8?B?OTYrUmg3bUp6WStNQ0xqZ244ejI2N0F4d3VIMDBmU0d0VXNFNStISUgwQjFz?=
 =?utf-8?B?aTlJOFpsK25EZDhLMTVYaWZzblZ3NlVLQzlXc1BWcm0wQVh1Nm93czhsSHlT?=
 =?utf-8?B?Smpid3RHN3d6L2hoUHFGOS8vNVR1V2UrMlZiU0N3TjFocFlJS2VXRTc0eHpt?=
 =?utf-8?B?NlNXNU1FbmU0VVBuMWtLME0wRnkvQWlHbE04WWhLVTNmMW90SCtPbU8xcWd2?=
 =?utf-8?B?Y1JBMFZuZG1uL0crYVBCTmVlRmRzZGpnWE1iVGlMQy9TMDFqRDlETVFkbjl0?=
 =?utf-8?B?MlNIalFzazB2RTZiK3orMU9NV3hOLzBmcm1kUUg0bmlUZEZLdStMcmkwMXhh?=
 =?utf-8?B?Mi9mVWJlV2dBNjdOWnRRQkpHaWh6dE5RYWl0eVRPd1dPZnRXNGJnNlplSTdO?=
 =?utf-8?B?M0FjdHA5aG5tQTdha09ZNjdTV2VPTHlPKzJ4UlkybG9nZlNJUFQzOVRNaDc0?=
 =?utf-8?B?WXRQZkRNdWhCL2M3eUlTR3RFU2pKZ2JBRlBWZXpDT09lT0lIWHV2TlRicmxp?=
 =?utf-8?B?aWZLUnRaNHFhUVRtbkV3OUhwdDBLRjVHMnJLazRiVlc5K1JVdzVpMDlkcnRn?=
 =?utf-8?B?WXdvOENMYmU0ZzJUd2xUK1hOaGpsejVuOTl1NDE2eklob1RWQTVUcStaemN6?=
 =?utf-8?B?ZXdIaE0vV3VWY2k2UmUvWXV4ZzZEdDFsQlBmWnR2d1JPWmxhZTdTbUhHbHhB?=
 =?utf-8?B?L3lQa2VpTlBXRXZNdk1vOUpzeXhENkJaMC94NkZTYk9KeWh5WHVSa2lFaTdi?=
 =?utf-8?B?c04xdWpaSEV0dWlSV25ISHRmR2lxMzR1OVFvdCtCSUw1SDE5U05Oelo3Wlhy?=
 =?utf-8?B?S3orZTFEbHZIbHk5ajl4NnlremMrTk1nQnFhbGkwQjNMT0M2WjRvUGFCSksz?=
 =?utf-8?B?MU81WWs1RVd0WU9zL0Z5RnZ6K1pUVEpNdllWaytDOHpmbjdyQXF5YzQ2ZCs2?=
 =?utf-8?B?UHd4ckdObml2SytyYjlUQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0xieVFrSHFsWEttRFNpQThLc2hSWWFXSzl6c2pPcWxtamdSVFplZW1xcWEw?=
 =?utf-8?B?Qk9PT0p2M0RsM2hWMGZXQmFaVkFtUmYzOTZLTXVpZnZhcmdwdE1IMlVuNjdt?=
 =?utf-8?B?b21CTmFtWlRvSHVEeElUS3BkWUpZWVZpMGx0bW00WHIxYSsyTHdkdUVVcEJH?=
 =?utf-8?B?ZllXT1V6R3hEZ1M0UTRaSzdBb0RyTHJmWTlUVnN6RDNKREhLeU9wQWUxNVlx?=
 =?utf-8?B?cVA1dVZ1V1dVenlMVDJJRnh4eGppTEJ2TXE3eWVyOE10VWVGWUdHKzhnT0Yv?=
 =?utf-8?B?Q0dTK3E2bWZhSzhLRzFSSjNOblEvcWJNWHZwTHZidlhvT1BNVFVNTnplZ20x?=
 =?utf-8?B?RVVNSFFYVnp2UWE5cEs1QkNZakdvZU5jV1lGc0VPYThneEgwcmROam03R0V0?=
 =?utf-8?B?SFkyZSsvS21Qd093RjFWU0hHTEJWeFdQT0crZlJoZ3pXVXg4WVFIc0xjckVR?=
 =?utf-8?B?ODlFRWpRMTJmalZma3Z5aVQ0YnhhdFUwN1JOYjg1Vkpwd1VCNTVNdWVrd0ty?=
 =?utf-8?B?VHpsbE5HRUFDRFAvYTBPeUJkQk5jTnJPUXlHdTdDZS9XRW85K2huN004QlRn?=
 =?utf-8?B?MGh1dnMrT3VZQU1rbXJzdzg4N1IyUDdsY1ZnTHNvbGpMTGMrdWQ2dmx0SW5u?=
 =?utf-8?B?b0UySmZ5ckk3U2JqditZZnV2WnNxQ1hsU016dmZONnJSTldLNlI3MnUyVThB?=
 =?utf-8?B?djB2c2VRWXRPaFUxSHFPenp4V0MzUEhjZEJJc1JJdWVBSE1aajk5OUg5UnVm?=
 =?utf-8?B?UnVLcHd1TktPaVdYb1lKS0czTDJqaE1MbllFZXU0TjlIVlZETnVnVVp0eU84?=
 =?utf-8?B?RTM3QnJFSmlvbXVLdGFDOE5DRTdnZ1duQTdROEVzRGRGdkhqckpiM3pKQzJ1?=
 =?utf-8?B?MDZFZmduVnBORDNyOVc4Y0pMam9zTlEvQlpaMGxLcm15ZFBuSWF4NTNnenZH?=
 =?utf-8?B?eTdpSzVCWU9INitpYUZ6WTVvL0FmUmhXL2Z0Vk8vSzdlTkNvVkFVdmZNRkl1?=
 =?utf-8?B?b2IrRGVjYzRMNGNZMmUram9vM3RxZjhma1dYaXFjODFzMS9YKzNmYXJKVXJy?=
 =?utf-8?B?cEMwb2l2M1hvYTh0YVNLMU5SZ3dLcWQ4UXFQeE9FT1pEUHgzNTR0aVN4dWJr?=
 =?utf-8?B?ZklGbStDaXVOYkNGOWU1RnJMMlkwMTkxMmtLSFYrelg3S2VvcWRyYmZRVEdB?=
 =?utf-8?B?eTRIY2ZJWXpYUWdFQnB6clZzY2RhWlM3NWVnY1pQTmM4eEltQ1JUdnhlTUEy?=
 =?utf-8?B?K0N1T0hqcy9LSExVRWJCVVZiVC9LWVFSOVVuL1c5eWZyRDZUM3lBL1BqL0Rt?=
 =?utf-8?B?QWF3dXlENVk0VVNXMWowTUl2clFQQnFxd3dHdit6MTVYOUttNk93NHlqdFEx?=
 =?utf-8?B?L0hBU3p1TnArNlp3UkRvSndmVFBvbWFlNmJKUEtQNEFFeVU5UEpZU2pjVkQw?=
 =?utf-8?B?cmgyd1AxMkpPdkVyNWVWazUyMXVzcE5Cck9ReTBnMmRVNytXZTgrSE1qL1VZ?=
 =?utf-8?B?bVFpQ2JHV3dvZ2d5RHVRdHZoVVY5SnpFYXlWeENuNUJ2MUh6K0pxYzRybXZP?=
 =?utf-8?B?VE4vclVsbXl6VDdmVlZ1QXUwby9PVFNaZHFMZWVOdHNPaWNCeFZVYzJlaWk5?=
 =?utf-8?B?TUhETnpUQ01FamVpZDVsblRWcStKUWpLMlJyaFdobThwYWIvWDBvUmV3ZXJ4?=
 =?utf-8?B?cCtINmdpbVJXNEpUcHlmZC9FeHJMOVNLTW9MZGRxWEdqQ1JQcFZGdS9Rb1VV?=
 =?utf-8?B?ZUpWM0pZbVRCd1ZTakx4OTdCc0xhS1EwNGk3MUtaTjVZMjhiTTNBOHlwVWpG?=
 =?utf-8?B?ejNGbHU2VHhRQm9lczlVRkp0T1dOaEZlUG5uRjJwQTRxUkFrOFV0WGpxeXZC?=
 =?utf-8?B?WXlacjdVKzBhbHptSHRqTVBHZEhMYkhpOVpsS1NGa21oZUg1SkRnempMdkhD?=
 =?utf-8?B?WmdCQ21DYVFPc2RLQmdWcjZ0bUlRazFQNWEvS3BVRE1KWVF6N1NJVncyVmR6?=
 =?utf-8?B?anpubmZPaXJDYkh3UC9zRjNxTGM4RU5uaUJuUmw2czNYRCtKZ3dZWWswSkdH?=
 =?utf-8?B?cUVvMXVWQ0toNFoxU2htVEwrRjJ2Y1Y2UlA0RkxseStiR2ZhZGgzbndIWHFI?=
 =?utf-8?Q?GBbiv7ZEm5xFKy5kS/WdtEZmq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96b5db00-da3e-4aa9-03db-08dd3bead415
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2025 20:16:32.4933 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AEl4Drab6ebcVvcFg1IVTZkT2mxCpvY1S/q39oSANdF0aNiYUNEj0nrQbnz4N0nVpseo0Umf4C68mjKJg/QUcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7104
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



On 2025-01-17 04:06, Pekka Paalanen wrote:
> On Thu, 16 Jan 2025 10:56:22 +0200
> Pekka Paalanen <pekka.paalanen@haloniitty.fi> wrote:
> 
>> On Thu, 19 Dec 2024 21:33:37 -0700
>> Alex Hung <alex.hung@amd.com> wrote:
>>
>>> From: Harry Wentland <harry.wentland@amd.com>
>>>
>>> The BT.709 and BT.2020 OETFs are the same, the only difference
>>> being that the BT.2020 variant is defined with more precision
>>> for 10 and 12-bit per color encodings.
>>>
>>> Both are used as encoding functions for video content, and are
>>> therefore defined as OETF (opto-electronic transfer function)
>>> instead of as EOTF (electro-optical transfer function).
>>>
>>> Signed-off-by: Alex Hung <alex.hung@amd.com>
>>> Signed-off-by: Harry Wentland <harry.wentland@amd.com>  
>>
>> Hi,
>>
>> why would a display system ever use BT.2020 or BT.709 OETF or its
>> inverse?
> 
> Sorry, this is more for my own curiosity, not an argument against the
> patch. Since hardware designers decided to incorporate these curves
> explicitly, what use was in mind? It's likely something I have
> overlooked.
> 

I'm not entirely sure myself, but gamescope does use it for displaying
game streaming content.

https://github.com/ValveSoftware/gamescope/blob/2f88849ac9dc7da5c678d5d7d3e9b58f38add1bf/src/Backends/DRMBackend.cpp#L2509

Harry

> 
> Thanks,
> pq


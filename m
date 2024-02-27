Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BAD86954A
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 15:00:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 998DE10E4CE;
	Tue, 27 Feb 2024 14:00:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ckvjPHG2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2055.outbound.protection.outlook.com [40.107.220.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5463D10E3C9;
 Tue, 27 Feb 2024 14:00:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JPX06HSXi47H4Mr9Sw1mneq8bHOaNlk3vBG1253lHFnk3mzUnwahrZZBsuvSQUUnhm4uy3sEsrnwmjXEjOADU9ZQuTCO/dohMVLhm1OFdT7KDIuc65SLUXjCvcIz8x8hi/wTkrjnP0JUb6LfRo3zifWH6XWN/3MQav2vz9BqR0vCYBqVv6bLSbm228QQ7nhZ1VvqVUnOP0Ztr6z8WH7g++yMb9UVwcuiaKvjE+qx3+5y7xIrF3Xaf0Qs+jjdpWKjasClGxqYp/tzupw6/0w7D813VrQgk1MyAB/fcwy0rhDHmnvKutjvIK1IOcLIGAmGYVg19TRkMg8Zxs0LwxT8Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dUCJT2SwY47zgvARCiRodsEI7pn/fJam8xzeROw3XFQ=;
 b=SEEKkuydoft4pWuq31HAYiPtk9zh26sYQMAoLQln8eHtZMa0f70Rvibw5hMQ/3SxR8tdq/0Apz9/h05SpvbTy8H63K7kUOQ0tXBjfiIiQRYADuG7dqD7xy+iHrcALbVSHru3tAvNYjztVrH7rJlW0HzJZ2LUuBIZwm4iQ1DbyZz01NQS9OgFXAzu8W3UkyG2Vtz2sEVXl2PU1BEHz21/FJUL6GBQ129jde8NgaP38Q9lG/1+Pl8EzlqmO6EG5xfYlzCbyBVgD/tEpiNP/TpV6P7qHwtUV8bk8hZcy+ukv96bU56/dVvDl0V+7p8+Xw2Hzre0+7Ywql4SbmxT40VC+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dUCJT2SwY47zgvARCiRodsEI7pn/fJam8xzeROw3XFQ=;
 b=ckvjPHG2kCen/OSsiqY6OhzSftwZBKka17ptT412WsRLJSx/6DbuTnPzJ6MZhhtWFJSFI/XFd+8L3D0vOvt5S6pY9HII0uhjjSlgSDfWQrGzSIMcEfPY+ZpqAXgeVyNG+U7NBXspxTgquAJvnOC1yAIlk8vSDyRQhCzE9Lt6by8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by SA3PR12MB9132.namprd12.prod.outlook.com (2603:10b6:806:394::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.34; Tue, 27 Feb
 2024 14:00:36 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::6c3b:75a3:6af2:8bf4]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::6c3b:75a3:6af2:8bf4%5]) with mapi id 15.20.7316.035; Tue, 27 Feb 2024
 14:00:36 +0000
Message-ID: <805913f1-b243-49ae-9dac-886748b8f2aa@amd.com>
Date: Tue, 27 Feb 2024 09:00:20 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4 00/42] Color Pipeline API w/ VKMS
To: Joshua Ashton <joshua@froggi.es>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: wayland-devel@lists.freedesktop.org,
 Ville Syrjala <ville.syrjala@linux.intel.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Simon Ser <contact@emersion.fr>, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Jonas_=C3=85dahl?= <jadahl@redhat.com>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 Shashank Sharma <shashank.sharma@amd.com>,
 Alexander Goins <agoins@nvidia.com>, =?UTF-8?Q?Michel_D=C3=A4nzer?=
 <mdaenzer@redhat.com>, Aleix Pol <aleixpol@kde.org>,
 Xaver Hugl <xaver.hugl@gmail.com>,
 Victoria Brekenfeld <victoria@system76.com>, Sima <daniel@ffwll.ch>,
 Uma Shankar <uma.shankar@intel.com>, Naseer Ahmed <quic_naseer@quicinc.com>,
 Christopher Braga <quic_cbraga@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Arthur Grillo <arthurgrillo@riseup.net>, Hector Martin <marcan@marcan.st>,
 Liviu Dudau <Liviu.Dudau@arm.com>, Sasha McIntosh
 <sashamcintosh@google.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
References: <20240226211100.100108-1-harry.wentland@amd.com>
 <f4839262-493c-495d-9fd0-bb9eb81ac430@froggi.es>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <f4839262-493c-495d-9fd0-bb9eb81ac430@froggi.es>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR01CA0159.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:7e::19) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|SA3PR12MB9132:EE_
X-MS-Office365-Filtering-Correlation-Id: 480d390f-cd68-4e79-5103-08dc379c7902
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QTnEbyKP+H+pJHhj3EzZWg+TdAjTW4PFijLKRyJi5j5CTSuHuB2sXHQSUDuaMS+kOf1KQ7zwiSeph02nAJiwsqPjU8cae6ZviUKCnaOP89sie8t0VpbIRecNzXtXNoNzzV7QxHbZZ+5oUNdmHC7X/tU/Wahy92U5dvGKZC8nxrCMldCSzFDNVX6yCk9mSi8zWcraqj0gjepgUzfLSlnL1Xmo6LVi+T7GgUutF0tSF+9YjJ9txa2MH+Eg+1WEw/nYu3siC9szC13fZm3BV0XlGlHJnAhZsttwAcEVL7oUx7ppbi9JmlcdN+X06hMdWHUsmzjsGx9b4+t32Pw4hNamqQGqkHC5yud/4i0uHCAwZy1qD7+YqBd1A1+aY5YjhZS82+YWj/hlbvDS2HT4vpKQT+FbHVmar8k33ld6xnr3OqP8vpvbY7stGK8Y+yWYKSu4N9om3NViwc6Ktgn2qhDuvXkEWjYnFizyCBCc9XqFhEj9uCpfG10rmbT/qKoGjcBdUEKisAm/t6qK55BkgyCT4369bm/RCSzsNcr6frm32BHfD/AYAYuEAfwepF1Zx/p4qJh/OKcrvb/w3aRAPuv7NRt5wcJ1m8nmWCiKVrXXe+tLC0pFSEYhCYQNtsed95YT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXIzUnNkWnpQZzZJTWhvVGNrSDR4ZTI2V3pRSkNwUkZoUmtuUGs0RlliUmdC?=
 =?utf-8?B?bEpEcGZjWUROclo1dStXdFJ1YXA4cFN5RXBUNTBmUFczWlloR0l3cERkZUxR?=
 =?utf-8?B?TFE1bVJHYytVWkxIL2pSYnB0TDV5RzFHNktHZXppanhRUitSTDlCbkF3Tzkv?=
 =?utf-8?B?WEgvcmNMZCt4MTU4UWtHM2FvNnl2eHRDcGM2azF5S0FBM2liY21KbnN0d090?=
 =?utf-8?B?L0RmRWhLZ3EwTm83SzRSTTh6TlRoUXRXZkZtMGtQd3NIcDYzZVhiRFZycnNq?=
 =?utf-8?B?WHVncmNGdllIb3pqeUlzTGRvaUFFMDQ5WFpWZGc4ckQzaDBJVGpnTS9McWpZ?=
 =?utf-8?B?V0xtOWhNeHRkY3o2aW1sWDJjR0hNM21uM1VwK3czVXlzKys2MEVCMjRoSVdv?=
 =?utf-8?B?YUxMQUljTUVGYVphbXdUcDE1K0c3TXJNWldQWGM3YU1JMGtiWGx6cHVoOXNo?=
 =?utf-8?B?TEdRdjBTYk41Q2tCU2RVSkhubFNQcVVzNXlqbWhHSTJSOE1pQ1l4T0xNcUht?=
 =?utf-8?B?S1ROV1k5Z095S0ovSENxd0VkYUxkWnZ3ZHJTb21UbnB3cWdLMTcvOGE4S1po?=
 =?utf-8?B?NG1KZGx6alVyM3dKci96MkxjMXpsRzZXQm1VbVZTNjJFRmFvampDc0tyN0d4?=
 =?utf-8?B?ZmtUVVJQSXJ1QkpqNG44ZExrTCtQOGtaV2lvWFF6R1RmYUx4TDA3NjB4TU1s?=
 =?utf-8?B?ZGxURUx0K1ZnU04wK0p0UGFlcVpkaG9OaEFuRUxGSlEzZTRuQkczTXU2emR1?=
 =?utf-8?B?VVdtQzZJelljaEFOazlMK09RbXowZ3JRTlFHQnFLUUhYbVN3SCtKYTVWbkpn?=
 =?utf-8?B?L1hocnk4bTRGQzd5Nnh5TTRiS1EwN2JVUFhJODIyZVNqOGxvNjlnS0xvMjJL?=
 =?utf-8?B?eEpZRDVyWFhVcFB5ejN4eVFqRFpPWkxDeHNxdWJKTzJJaDVxZzdheWZmTnMy?=
 =?utf-8?B?WlBGNWpQc0dDVmJlblQxYXp1bmtDWVBpd1Z1OGVuRnE2LzNRbjJ5ODR3U3l3?=
 =?utf-8?B?RjEyYUY4dnhkV3ZUc3hxQzA0RTNGK1ZwZWNUdmJPdWQ1YnJwNUpvUTVKa1Zj?=
 =?utf-8?B?MUxURHVqUkF1UCsvN1NlU1BraXBZZlBCQTdWaDRmQXliUmFCZU4rRjkvdVNJ?=
 =?utf-8?B?RnZDWVBNQ1hPa3FSVm5FZXp6TTQyOFB3MmhtWWZqY3VMSWxIeDBsWVBIVjhl?=
 =?utf-8?B?OGUvUDJ5MW8wdGpyck9kTkhzQnhDZGY0cU8zbE1KbUZ6bDYxZmxDUUx0cngv?=
 =?utf-8?B?SFVhdUQ2RHZnUmJtM2VkNHhSeDQrY0t0ZE5UNnBDblRPekJEYVhHVnBjREtD?=
 =?utf-8?B?azh6YWtOZlQ3cU9MbEFKKzlQZFNrajYrRFZXazRnU1Vub2dyT0tLRmV0RGRO?=
 =?utf-8?B?VWlnTWJDUXhqQ2ZxTFVZZk00Nmk2b0d6UFluNVZ1M2N2UHhRQlVQc3V0MDV5?=
 =?utf-8?B?Y1R2RkJ1bHVLL2JNZmYyWVo5QWZmM0ZrSmY4bEhBN2E0dFNIdjUrVUdkdHhp?=
 =?utf-8?B?Nlh2d0luWS8xNDdxdGkwbG1POWRrVEFjeFhPOEZGODBuZEd5c1Y4Q21rMUV6?=
 =?utf-8?B?OFB1c21FNHhwTXRVNjlhQkdrYXh1OTNBVklsS1JVbk1qNDJCLzh0QXdBdGxZ?=
 =?utf-8?B?akZiYWFxNm9mRTF3dEQ1RS83TUVjQlhqVHZYRnNHZE5MK0tnZFZUbm5HbTJF?=
 =?utf-8?B?amJxRG80NVdwbU1UdG11eGVEL3RTaGVqQ2dhUjhiVVdHVlVvSGtIQWR4L1lD?=
 =?utf-8?B?bWlVeWNXbUI0YjVIbTlnRU40NXV1TURGZDl5bytCQjdDN2NYa09sQWRqL0ls?=
 =?utf-8?B?QTgzNVRVQnFWSXhObU92R05VSDFYQ01Qa1BPVWJPb1ZWSmx5NWhhYnpWd1Fk?=
 =?utf-8?B?OHRGcGpNOFpXcHJVUU40d1N0TkJiQ3EvdEl0aEpyS1dqbTFjbzlGcUhNZ1RZ?=
 =?utf-8?B?bitXakI4SG1aV2FMK3dDMXJNejJIYThoVGE1b0tDYmU3Y2VLTFJrQmlTRmlP?=
 =?utf-8?B?cEt5QldoZ0IyNkZSNDE2NmlmYnFCQmRyWmZOV1ZNeXZWTGlOdXdoaXBJS24z?=
 =?utf-8?B?cDdiS3gwQlNwODB0eklkUll0VmFjejlnUXJ3VUI3aWtPcjZQNFhQY3BVN2V4?=
 =?utf-8?Q?jbx9WHxtMyREu0EYRcFGmHRLt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 480d390f-cd68-4e79-5103-08dc379c7902
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2024 14:00:36.5554 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w/5J715OdLvvCJIY46JURFYdpT7mi42NdWFg/0jNbGmFpJJGxd/Bz94e2J1Qd91SthfqbYMOfHu0/Y05D3za9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9132
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



On 2024-02-27 05:26, Joshua Ashton wrote:
> 
> 
> On 2/26/24 21:10, Harry Wentland wrote:
>> This is an RFC set for a color pipeline API, along with a sample
>> implementation in VKMS. All the key API bits are here. VKMS now
>> supports two named transfer function colorops and two matrix
>> colorops. We have IGT tests that check all four of these colorops
>> with a pixel-by-pixel comparison that checks that these colorops
>> do what we expect them to do with a +/- 1 8 bpc code point margin.
>>
>> The big new change with v4 is the addition of an amdgpu color
>> pipeline, for all AMD GPUs with DCN 3 and newer. Amdgpu now support
>> the following:
>>
>> 1. 1D Curve EOTF
>> 2. 3x4 CTM
>> 3. Multiplier
>> 4. 1D Curve Inverse EOTF
>> 5. 1D LUT
>> 6. 1D Curve EOTF
>> 7. 1D LUT
>>
>> The supported curves for the 1D Curve type are:
>> - sRGB EOTF and its inverse
>> - PQ EOTF, scaled to [0.0, 125.0] and its inverse
>> - BT.2020/BT.709 OETF and its inverse
>>
>> Note that the 1st and 5th colorops take the EOTF or Inverse
>> OETF while the 3rd colorop takes the Inverse EOTF or OETF.
>>
>> We are working on two more ops for amdgpu, the HDR multiplier
>> and the 3DLUT, which will give us this:
>>
>> 1. 1D Curve EOTF
>> 2. 3x4 CTM
>> 3. HDR Multiplier
>> 4. 1D Curve Inverse EOTF
>> 5. 1D LUT
>> 6. 3D LUT
>> 7. 1D Curve EOTF
>> 8. 1D LUT
>>
>> This, essentially mirrors the color pipeline used by gamescope
>> and presented by Melissa Wen, with the exception of the DEGAM
>> LUT, which is not currently used. See
>> [1] https://indico.freedesktop.org/event/4/contributions/186/attachments/138/218/xdc2023-TheRainbowTreasureMap-MelissaWen.pdf
>>
>> After this we'd like to also add the following ops:
>> - Scaler (Informational only)
> 
> Why informational only? Having NEAREST and in general custom taps should be possible on AMDGPU right?
> 
> We don't have to solve this now, but I just want to make sure that we aren't locking this to info only.
> 

No, this isn't locking it to information only. We could allow for NEAREST or
even custom taps in the future. Just don't want to open that debate now if
we don't have a good reason to.

Harry

> Thanks
> 
> - Joshie 🐸✨
> 
>> - Color Encoding, to replace drm_plane's COLOR_ENCODING
>> - Color Range, to replace drm_plane's COLOR_RANGE
>>
>> This patchset is grouped as follows:
>>   - Patches 1-3: couple general patches/fixes
>>   - Patches 4-7: introduce kunit to VKMS
>>   - Patch 7: description of motivation and details behind the
>>              Color Pipeline API. If you're reading nothing else
>>              but are interested in the topic I highly recommend
>>              you take a look at this.
>>   - Patches 7-27: DRM core and VKMS changes for color pipeline API
>>   - Patches 28-40: DRM core and amdgpu changes for color pipeline API
>>
>> VKMS patches could still be improved in a few ways, though the
>> payoff might be limited and I would rather focus on other work
>> at the moment. The most obvious thing to improve would be to
>> eliminate the hard-coded LUTs for identity, and sRGB, and replace
>> them with fixed-point math instead.
>>
>> There are plenty of things that I would like to see here but
>> haven't had a chance to look at. These will (hopefully) be
>> addressed in future iterations, either in VKMS or amdgpu:
>>   - Clear documentation for each drm_colorop_type
>>   - Add custom LUT colorops to VKMS
>>   - Add pre-blending 3DLUT
>>   - How to support HW which can't bypass entire pipeline?
>>   - Add ability to create colorops that don't have BYPASS
>>   - Can we do a LOAD / COMMIT model for LUTs (and other properties)?
>>   - read-only scaling colorop which defines scaling taps and position
>>   - read-only color format colorop to define supported color formats
>>     for a pipeline
>>   - named matrices, for things like converting YUV to RGB
>>
>> IGT tests can be found at
>> https://gitlab.freedesktop.org/hwentland/igt-gpu-tools/-/merge_requests/1
>>
>> IGT patches are also being sent to the igt-dev mailing list.
>>
>> If you prefer a gitlab MR for review you can find it at
>> https://gitlab.freedesktop.org/hwentland/linux/-/merge_requests/5
>>
>> v4:
>>   - Add amdgpu color pipeline (WIP)
>>   - Don't block setting of deprecated properties, instead pass client cap
>>     to atomic check so drivers can ignore these props
>>   - Drop IOCTL definitions (Pekka)
>>   - Use enum property for colorop TYPE (Pekka)
>>   - A few cleanups to the docs (Pekka)
>>   - Rework the TYPE enum to name relation to avoid code duplication (Pekka)
>>   - Add missing function declarations (Chaitanya Kumar Borah)
>>   - Allow setting of NEXT property to NULL in _set_ function (Chaitanya Kumar Borah)
>>   - Add helper for creation of pipeline drm_plane property (Pekka)
>>   - Always create Bypass pipeline (Pekka)
>>   - A bunch of changes to VKMS kunit tests (Pekka)
>>   - Fix index in CTM doc (Pekka)
>>
>> v3:
>>   - Abandon IOCTLs and discover colorops as clients iterate the pipeline
>>   - Remove need for libdrm
>>   - Add color_pipeline client cap and make mutually exclusive with
>>     COLOR_RANGE and COLOR_ENCODING properties
>>   - add CTM colorop to VKMS
>>   - Use include way for kunit testing static functions (Arthur)
>>   - Make TYPE a range property
>>   - Move enum drm_colorop_type to uapi header
>>   - and a bunch of smaller bits that are highlighted in the relevant commit
>>     description
>>
>> v2:
>>   - Rebased on drm-misc-next
>>   - Introduce a VKMS Kunit so we can test LUT functionality in vkms_composer
>>   - Incorporate feedback in color_pipeline.rst doc
>>   - Add support for sRGB inverse EOTF
>>   - Add 2nd enumerated TF colorop to VKMS
>>   - Fix LUTs and some issues with applying LUTs in VKMS
>>
>> Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
>> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
>> Cc: Simon Ser <contact@emersion.fr>
>> Cc: Harry Wentland <harry.wentland@amd.com>
>> Cc: Melissa Wen <mwen@igalia.com>
>> Cc: Jonas Ådahl <jadahl@redhat.com>
>> Cc: Sebastian Wick <sebastian.wick@redhat.com>
>> Cc: Shashank Sharma <shashank.sharma@amd.com>
>> Cc: Alexander Goins <agoins@nvidia.com>
>> Cc: Joshua Ashton <joshua@froggi.es>
>> Cc: Michel Dänzer <mdaenzer@redhat.com>
>> Cc: Aleix Pol <aleixpol@kde.org>
>> Cc: Xaver Hugl <xaver.hugl@gmail.com>
>> Cc: Victoria Brekenfeld <victoria@system76.com>
>> Cc: Sima <daniel@ffwll.ch>
>> Cc: Uma Shankar <uma.shankar@intel.com>
>> Cc: Naseer Ahmed <quic_naseer@quicinc.com>
>> Cc: Christopher Braga <quic_cbraga@quicinc.com>
>> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Cc: Arthur Grillo <arthurgrillo@riseup.net>
>> Cc: Hector Martin <marcan@marcan.st>
>> Cc: Liviu Dudau <Liviu.Dudau@arm.com>
>> Cc: Sasha McIntosh <sashamcintosh@google.com>
>> Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>>
>> Alex Hung (10):
>>    drm/colorop: define a new macro for_each_new_colorop_in_state
>>    drm/amd/display: Skip color pipeline initialization for cursor plane
>>    drm/amd/display: Add support for sRGB EOTF in DEGAM block
>>    drm/amd/display: Add support for sRGB Inverse EOTF in SHAPER block
>>    drm/amd/display: Add support for sRGB EOTF in BLND block
>>    drm/colorop: Add 1D Curve Custom LUT type
>>    drm/amd/display: add shaper and blend colorops for 1D Curve Custom LUT
>>    drm/amd/display: add 3x4 matrix colorop
>>    drm/colorop: Add mutliplier type
>>    drm/amd/display: add multiplier colorop
>>
>> Harry Wentland (32):
>>    drm: Don't treat 0 as -1 in drm_fixp2int_ceil
>>    drm: Add helper for conversion from signed-magnitude
>>    drm: Correctly round for fixp2int_round
>>    drm/vkms: Round fixp2int conversion in lerp_u16
>>    drm/vkms: Create separate Kconfig file for VKMS
>>    drm/vkms: Add kunit tests for VKMS LUT handling
>>    drm/vkms: Avoid reading beyond LUT array
>>    drm/doc/rfc: Describe why prescriptive color pipeline is needed
>>    drm/colorop: Introduce new drm_colorop mode object
>>    drm/colorop: Add TYPE property
>>    drm/colorop: Add 1D Curve subtype
>>    drm/colorop: Add BYPASS property
>>    drm/colorop: Add NEXT property
>>    drm/colorop: Add atomic state print for drm_colorop
>>    drm/plane: Add COLOR PIPELINE property
>>    drm/colorop: Add NEXT to colorop state print
>>    drm/vkms: Add enumerated 1D curve colorop
>>    drm/vkms: Add kunit tests for linear and sRGB LUTs
>>    drm/colorop: Introduce DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
>>    drm/colorop: Add 3x4 CTM type
>>    drm/vkms: Pull apply_colorop out of pre_blend_color_transform
>>    drm/vkms: Use s32 for internal color pipeline precision
>>    drm/vkms: add 3x4 matrix in color pipeline
>>    drm/tests: Add a few tests around drm_fixed.h
>>    drm/vkms: Add tests for CTM handling
>>    drm/colorop: pass plane_color_pipeline client cap to atomic check
>>    drm/amd/display: Ignore deprecated props when plane_color_pipeline set
>>    drm/amd/display: Add bypass COLOR PIPELINE
>>    drm/colorop: Add PQ 125 EOTF and its inverse
>>    drm/amd/display: Enable support for PQ 125 EOTF and Inverse
>>    drm/colorop: add BT2020/BT709 OETF and Inverse OETF
>>    drm/amd/display: Add support for BT.709 and BT.2020 TFs
>>
>>   Documentation/gpu/rfc/color_pipeline.rst      | 360 ++++++++
>>   drivers/gpu/drm/Kconfig                       |  14 +-
>>   drivers/gpu/drm/Makefile                      |   1 +
>>   .../gpu/drm/amd/display/amdgpu_dm/Makefile    |   3 +-
>>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   4 +
>>   .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 352 ++++++++
>>   .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 160 ++++
>>   .../amd/display/amdgpu_dm/amdgpu_dm_colorop.h |  36 +
>>   .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   |  32 +
>>   drivers/gpu/drm/drm_atomic.c                  | 161 +++-
>>   drivers/gpu/drm/drm_atomic_helper.c           |  12 +
>>   drivers/gpu/drm/drm_atomic_state_helper.c     |   5 +
>>   drivers/gpu/drm/drm_atomic_uapi.c             | 158 ++++
>>   drivers/gpu/drm/drm_colorop.c                 | 411 +++++++++
>>   drivers/gpu/drm/drm_ioctl.c                   |   7 +
>>   drivers/gpu/drm/drm_mode_config.c             |   7 +
>>   drivers/gpu/drm/drm_plane.c                   |  52 ++
>>   drivers/gpu/drm/tests/Makefile                |   3 +-
>>   drivers/gpu/drm/tests/drm_fixp_test.c         |  69 ++
>>   drivers/gpu/drm/vkms/Kconfig                  |  20 +
>>   drivers/gpu/drm/vkms/Makefile                 |   4 +-
>>   drivers/gpu/drm/vkms/tests/.kunitconfig       |   4 +
>>   drivers/gpu/drm/vkms/tests/vkms_color_tests.c | 449 ++++++++++
>>   drivers/gpu/drm/vkms/vkms_colorop.c           | 100 +++
>>   drivers/gpu/drm/vkms/vkms_composer.c          | 135 ++-
>>   drivers/gpu/drm/vkms/vkms_drv.h               |   8 +
>>   drivers/gpu/drm/vkms/vkms_luts.c              | 802 ++++++++++++++++++
>>   drivers/gpu/drm/vkms/vkms_luts.h              |  12 +
>>   drivers/gpu/drm/vkms/vkms_plane.c             |   2 +
>>   include/drm/drm_atomic.h                      | 122 +++
>>   include/drm/drm_atomic_uapi.h                 |   3 +
>>   include/drm/drm_colorop.h                     | 301 +++++++
>>   include/drm/drm_file.h                        |   7 +
>>   include/drm/drm_fixed.h                       |  35 +-
>>   include/drm/drm_mode_config.h                 |  18 +
>>   include/drm/drm_plane.h                       |  13 +
>>   include/uapi/drm/drm.h                        |  16 +
>>   include/uapi/drm/drm_mode.h                   |  14 +
>>   38 files changed, 3882 insertions(+), 30 deletions(-)
>>   create mode 100644 Documentation/gpu/rfc/color_pipeline.rst
>>   create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
>>   create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h
>>   create mode 100644 drivers/gpu/drm/drm_colorop.c
>>   create mode 100644 drivers/gpu/drm/tests/drm_fixp_test.c
>>   create mode 100644 drivers/gpu/drm/vkms/Kconfig
>>   create mode 100644 drivers/gpu/drm/vkms/tests/.kunitconfig
>>   create mode 100644 drivers/gpu/drm/vkms/tests/vkms_color_tests.c
>>   create mode 100644 drivers/gpu/drm/vkms/vkms_colorop.c
>>   create mode 100644 drivers/gpu/drm/vkms/vkms_luts.c
>>   create mode 100644 drivers/gpu/drm/vkms/vkms_luts.h
>>   create mode 100644 include/drm/drm_colorop.h
>>
>> -- 
>> 2.44.0
>>
> 


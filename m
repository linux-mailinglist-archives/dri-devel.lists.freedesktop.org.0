Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A79C205F8
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 14:53:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 353E710E981;
	Thu, 30 Oct 2025 13:53:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="QRvtadUG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010029.outbound.protection.outlook.com [52.101.61.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A03510E0A1;
 Thu, 30 Oct 2025 13:53:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CH2WhB6NNQnIFxVxvnPY616cjFagTKQahNQ8OVn1CXPnLt34bUZATjLChXniE4F/Mg+xjb/shLXxtvgW8u1CUDPOSwRwn8CV42R1+T0FmNPPJ/m+VO/JPUUv1FmTuuU9TrjwrLAeHTEeI2jLK/9AQ7/kdqN67juimbIeM4lPMNir3tHCTZAZNaFvkFT31IRno8Q3zAy+S1k12dCHsl9LstMG5lrw3eEC8MGqnjnk2NlVIcAc0/4b1/v3qO8cnq3XzbDPcitpewPCvuno1sB3PfvxC4seh8ACDXruvLFAoAe47/gYLqJ9llqWpi1tu3BW4muEEmqltWaP3eDf6pp4Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JSP/8peCfwvtHdFuMORuCNsxAgFydnTAYBoHacZ2WbU=;
 b=mXR0bPXfZ4COyyfTw4P+qoh22BNIhLiPVeHrIeaZXKbTuE8qL3Bt3iN8K7ZmrDVIFQZ+D/XmyOvxtV6oZvANMYrLZ+yiVy4PlubOO6YzSygx21QR04SvOKRcvl/HBBgJC9T4JUlPKKVURbIDvtCGH4UsD2ACzKhfta95SJv5s1bYN8/GuBZGaC+LlvMms7py3VqR/6l1+H24xXh44iT5dvSXWtre75BMe8Ngp/K3+u+yzuVNNcB6i8w9WmKrLYD02hPa0QDxNOoCphcSnoKy9phJMFEEBbtgMa+r74vkmViROPlKSZdizfQQWrNgJmJ6ZS2Ju46DpwRKTRx/7D++vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JSP/8peCfwvtHdFuMORuCNsxAgFydnTAYBoHacZ2WbU=;
 b=QRvtadUGhBPsgT9LdXPLT70PllnHvXTFwshaIKzKWYocOKusQwm/mnv3or1umh8o7r4ccLdy1ImaMLxnUtAhmV3T2ztQ0wD0YJTxnjYXIZm1vJA+YuTIKvqStbV6vqzZRM5IB5GAxY07IICZRgTSqqYwyByekCJmmG4wNeZZFi8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SN7PR12MB7273.namprd12.prod.outlook.com (2603:10b6:806:2ac::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Thu, 30 Oct
 2025 13:53:04 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 13:53:04 +0000
Message-ID: <b723d1b8-1634-4c2a-a752-90ce75566890@amd.com>
Date: Thu, 30 Oct 2025 14:52:58 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/15] dma-buf: detach fence ops on signal
To: Tvrtko Ursulin <tursulin@ursulin.net>, phasta@mailbox.org,
 alexdeucher@gmail.com, simona.vetter@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20251013143502.1655-1-christian.koenig@amd.com>
 <20251013143502.1655-5-christian.koenig@amd.com>
 <d5ea9ed0-d599-4b9f-92c8-a2e711371017@ursulin.net>
 <23bafbad-fcc9-4baa-9bd5-d4ea37c397f3@ursulin.net>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <23bafbad-fcc9-4baa-9bd5-d4ea37c397f3@ursulin.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0247.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10f::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SN7PR12MB7273:EE_
X-MS-Office365-Filtering-Correlation-Id: 81bf7329-acea-4c69-5736-08de17bba5c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K1Y0WXRGc3N4VlgxZkJIWWQxNHBXS2Y3RlJaUXhKS3lhRjlnMk9pMUFMQ1Nv?=
 =?utf-8?B?NUhLbFQ1dHMybXNubzhRTnFOYUlBQVgxWlVYa2dBTHBZVTJIRnB3TU1zNElL?=
 =?utf-8?B?WkNZQUUremdVTTEvMmlOVktLYVNjSkl6dXN5R24wQ29BUTFZQjRhUlZhZmth?=
 =?utf-8?B?M2cxWHVOTUJ6Z0k3SHhsQ08zL0xmWlZuSmNGSkFKdTBpVldudmRzbWY3dEdz?=
 =?utf-8?B?N3FpNks2WHRRY256Tm5TSHRsQ0dwVVlMZDEySGtFYlVxVmIxYUo4M2QrWERZ?=
 =?utf-8?B?anVDRDRaNUFzQjZ1TFc2eW9PUTZPeXk5aEdYQmxhbUYvQjAzbkhQS2E1NVZ5?=
 =?utf-8?B?ZEFWTDVvN3RuSUpJejAxcmFhcEJRZ0wyRTdIQnpKMGkyejhmZWtOVWY1TFlV?=
 =?utf-8?B?Zi9TeWNuM3RCZlVFTFFvazcySHNvQnBvUTFrbUZCUmRFVDBJWW03VjJWQ3I4?=
 =?utf-8?B?aXZUUFFla3RJb255bm5HczIwdDV4NUVkOFhuVnQwSmNTYzBQcmo1NWpuSklE?=
 =?utf-8?B?d2JVOUJUY2lYL0h4K2NnbDdKYjEwWXhJcTdleE1KeklaVHh4VXpJRjVNNk9m?=
 =?utf-8?B?eThUbHBtWmd1NzN1Z25LSGlMZWxjeEtmWEJIK2QwZHUvRG5pS3BZYTJwZ1NW?=
 =?utf-8?B?WSttSGhWQmx2dzErdnU5RVE3MGdIZitlaisxVE55d1phUzRWd0hObnZFLzhU?=
 =?utf-8?B?VjJld2JsNUZsZ2NFV1BxWFFVcm1hVjBZaDc3Nnk5SU1ja3F3UHpCb1E5RnV6?=
 =?utf-8?B?TzNQdHRXRFBCN2dQNmEwM1VESkJNV0htWmVQQksyNjhmQ0gvK1pLYzhKMWJJ?=
 =?utf-8?B?NzFGR3JIcGh4Z2laRmRRa1JKTTd3VGsrUFhZQ3F5TUY3UDRteFZkZ1lOeGtw?=
 =?utf-8?B?NmJ0aTdFY1RWK2dwTGlKTm1UaUxYeHlZQ1VadmpjRWhNT29qejZtVnEzdVlH?=
 =?utf-8?B?NmZ3b1ZpbVNzSUJsOElhd3pLWFlDQ25NZzJPTUtWUlVMZFh1MkR2NjhEdTlP?=
 =?utf-8?B?czdSaVRaODZyOC96dk9lNmNqOVExdTlNN3p0ZmU1eTY1V1hnMFNGMzJTbzNV?=
 =?utf-8?B?WkNCNHZ4RXZYRlcwMDcvVW5uQVZqejduWTZST2V6RkJHUHJSL0ZnMm5pTnNY?=
 =?utf-8?B?OUp4a2wwa0lETWdIb2YrbzVpZUsrWWl2MHduaEJWK0M2U0FZdFZEVXl2OGdQ?=
 =?utf-8?B?c2NsdjdLc1hTUWw0TUVGeC8rV0wwWk9JSjgwNWk5Z0gxbEJ3R2hpREJKaWtE?=
 =?utf-8?B?Nm5ES1VyOEhJWFZjOEh0ZGd2aElrZDBuUFFvU3laQWhFLzdFM3VBLzBlMHlR?=
 =?utf-8?B?MFVkdlpieWNKRlZxN0d5a05nNXhrdks1RlFoZEJKV2tpQ2w3U2JaaGt2WlRM?=
 =?utf-8?B?Q2JvWmdxMk1oSnR3TmJ0RVRMTjFvVnN5TXNqZ01ORXBYdWNuQTN0anQ5NEs1?=
 =?utf-8?B?V2dBTEdieDFwTHY2cHdSMTdZSm0walBaNlA0dWpEbVlIQ1hCNHNhQlFFTmV6?=
 =?utf-8?B?c25nTCtTSXpHNHdCdTNrWWNOS0U2cTlRdzZJUHdTS1B1bFZuNlRHbjFIS1Ir?=
 =?utf-8?B?bTJTUUxpVEJubitRZHFRcmVlVmdIaUU3WFIwdkc0bGRDK1MwNjlENlBFWXZF?=
 =?utf-8?B?RjlOK0FldHY1bTJGUDkrdDYveFdjRTd4VXFDU2VmNHdUd3hGbmdWOWpHT1ky?=
 =?utf-8?B?MEpkUVB5UEQyNnJOMVNaTjNGQUtuaTc2MmtTdUpmeE1JcGRHOTk0d2xFRnN4?=
 =?utf-8?B?ZVhXa09zWkpscHdwbjNReUQrRUg2UlFYaVBOZkRaeEJOaTRZaXNjcXd1K0g5?=
 =?utf-8?B?QTJOMG5kMVpWanowSDNzeHJucmcrbjRIelVrSXpqdWhxbXMzckpXT0VnRFc2?=
 =?utf-8?B?K045NlVqSFJrSER2bk5lVEF6bGs0c052azJQTGcrWVIwUXhDWEJyMlorbEpX?=
 =?utf-8?Q?7cRa+WAaB61yLLvRkE6Yp810Q7zK59FC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eXRVRUF1elMyYi9EbTQrTnVhbXdGR2pma2JaS3oxOG5seStzQ2tCRXRUcWow?=
 =?utf-8?B?UjdKMEJxMUc5bXFLYWFGdVcyTVlUTEVsbnJVczF3RHBDVmxzUCtFZy91NjVx?=
 =?utf-8?B?UE9TKzdJY05LM1J2ZklZTUlrRU8wTVJLTnhVczBJMW1HU2I1UnNnNDJpZTJ6?=
 =?utf-8?B?OE5ua1FWa050MnlKRlRHQUgwNXlnRXF5WCtiWm0vc1Z5ckZhb3lkTTJxQ1JO?=
 =?utf-8?B?TXNIa1pZOFR6UmRraEpDWmJyTWhpN3pvRGxUV21SNGxvd0dHc0JUcVZES0xq?=
 =?utf-8?B?OEY4ZjFkdW1Rb0tDZWt1bjloK0xLanQzYjFQVjVLb0xFVVdBZDA0bVMvNVcw?=
 =?utf-8?B?a2NydHlmaDRWaVcvRFdZc2orbTFoZE5DQU9FalErTG0rQWlBbUNBZmpFejlh?=
 =?utf-8?B?ZXl6MGZtdVA5azVPVjg5UXc4ZUVFT2lSZWJrYUlwU0xuQ0R2dWR3ZnVwL2x2?=
 =?utf-8?B?aFFSclR3R2NZdVdtNVdXRzluMHBIT0tzbVhBWkdZVE9aK3hQY0s0Vi9MUXA4?=
 =?utf-8?B?ZGhOTFRkRUUrYVYxWktSRzZJU2Z1L0Y4b2FEU2xnTGh0Q05CY0R1UXBxKzlo?=
 =?utf-8?B?c2RJWlcreVRrRXFZakc5b3hCRGlTcjRrbUJPNmtNWVMyUzJEemJVYmNoWXBE?=
 =?utf-8?B?djdmQkl4bTg0aWZSWGZuVFRyUmVhOFYvOVI0TXBKY3ZXVWhvbnBUUFlINXBF?=
 =?utf-8?B?S1I4Y3dKelNCUDFQbDZ1QXN4RmdNdUNTeU8wNWxLZjlFbHhCbmJPNCtkYis4?=
 =?utf-8?B?RS8vT251UzFQNWp6eC9Fd2tWc1ZEK2JYYVJPYWpRbWwvV1lDdlcwcnFabUZn?=
 =?utf-8?B?RjZLbUFCL1lRWTdJWGlYUFE3cTlvYTNzd3czNW90dzNaRHdnZWNnYlZob1RH?=
 =?utf-8?B?WVB2SWwwN1pYdEZEQzNlRXFVcmhCSUNrSmFRL2pMNFdHeHBoY0ZsQyt5VDV6?=
 =?utf-8?B?K3QrS0Jqd1JlM0I1ekhjM3lOaE5NcFY2V2MrMUU1bEdpaE5zTFluck9ReEZT?=
 =?utf-8?B?aUdMOTdrNUI3dzAvNXBUZ1NBelNWWktvMmNVZ2dPU3NvSHFYektSV3VPUGlZ?=
 =?utf-8?B?S0lzMG1ERGhDdVZpRS9rVGJ3am1yOTFpY0xLcWZqdkltV0NrL0Y3ZHZzUkRs?=
 =?utf-8?B?ZVBuUkZZdXBnM2toV3dMSENpczdxTElnVzg2ZTBwSmdYM0dva3NoeHVNeTUy?=
 =?utf-8?B?RC8yREcyMWMrZzIzL3IxYlpCT0FLcC9SWGFMN3VtaW85Z20rQVpZTjgybE9Z?=
 =?utf-8?B?SEdPV3pQVENmcFUyTVlITTdQNm5QUWlQZGVyQXZ3NmtWVkx3SWwraXk0WXdR?=
 =?utf-8?B?Y3IyR3FkbHNFNDhGZDZQVkYzTFAyN2ZiMXNNbXpxUlQrZzhYUkMvb0hzSmpq?=
 =?utf-8?B?Z2lOeXI1MENWV2dpM1ZvVTdkSEhtRWZnYzBNOUx6N25zTmUvUFhvUlo3WEo2?=
 =?utf-8?B?aE9hZ0MvWFZGRDZHSjBPTXlSZGtxNytQeE96SExPSDJ1dWFoSzFBMC9ESk5N?=
 =?utf-8?B?WVcrVS9Ub0luMjk0UGl2QTdJOTlheGFzbHVGS1NYTmhJY3RQVVd4ZWpqVGRP?=
 =?utf-8?B?aUovVWVWODVMN2hEUWwwbE40cXlac2Y1YlViV2Vzdm9mSlRuVnRvMXR2Q1c1?=
 =?utf-8?B?TXRhbGt4Vko5SnFPNnA0YnplUFdwckdlNmtjOEFVVW5RSGUyRXgveXpoWXdD?=
 =?utf-8?B?cXE1Mm1VUXUxR3BxMFY1bmJHRUN2ckdTTnJhQURyTC8vTEkvOGdCZ1plcWRL?=
 =?utf-8?B?eVduNFBiYmlxU1NvUjBjYWlxREZJZ0JJazIvR0taaUR2MjV0NDBaZXNzaTNI?=
 =?utf-8?B?WmpHUlFCb2NCSVp1Vyt2SFpnVXlpRXJpeUpnYVlVSjhoNWoxckRlVXVPRjJh?=
 =?utf-8?B?ekp3cFJleklydFk5NHZycHZ1ZlArOFgwQTRET3o3T01sMjlPMmZKbnYrMWxk?=
 =?utf-8?B?bCtuaWZsU1hNWXhyUlhuQURCaDRYRjVhaU5Da1dCTkRsc2ttaHd0dmM5eEYy?=
 =?utf-8?B?WVEzUDltOGNnbWkzNnZleVBxVTdxM1IxV2dzSVl1UTJENnllYUc4Z25ZeUFk?=
 =?utf-8?B?UllGVFB2djV0VWpPdW00d2g1SFpYQmF3ejRkL0pQWVZxL2NBL01CeUorQ2sw?=
 =?utf-8?Q?5cDavm80EbgB9Llp/oVNJI+JL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81bf7329-acea-4c69-5736-08de17bba5c9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 13:53:04.3477 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PbCMqDbQ8g12Z69qQj7pdy3SzCpibEKccG+EbgJCEIbL+Q0//Og6Ud2+Z/xVRHAk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7273
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

Hi Tvrtko,

On 10/16/25 17:57, Tvrtko Ursulin wrote:
> On 16/10/2025 09:56, Tvrtko Ursulin wrote:
>>
>> On 13/10/2025 14:48, Christian König wrote:
>>> When neither a release nor a wait operation is specified it is possible
>>> to let the dma_fence live on independent of the module who issued it.
>>>
>>> This makes it possible to unload drivers and only wait for all their
>>> fences to signal.
>>
>> Have you looked at whether the requirement to not have the release and wait callbacks will exclude some drivers from being able to benefit from this?
> 
> I had a browse and this seems to be the situation:

Oh, thanks a lot for doing that!

> 
> Custom .wait:
>  - radeon, qxl, nouveau, i915
> 
> Those would therefore still be vulnerable to the unbind->unload sequence. Actually not sure about qxl, but other three are PCI so in theory at least. I915 at least supports unbind and unload.

radeon, yeah I know that is because of the reset handling there. Not going to change and as maintainer I honestly don't care.

qxl, pretty outdated as well and probably not worth fixing it.

nouveau, no idea why that is there in the first place. Philip?

i915, that is really surprising. What is the reason for that?

> Custom .release:
>  - vgem, nouveau, lima, pvr, i915, usb-gadget, industrialio, etnaviv, xe
> 
> Out of those there do not actually need a custom release and could probably be weaned off it:
>  - usb-gadget, industrialio, etnaviv, xe
> 
> (Xe would lose a debug assert and some would have their kfrees replaced with kfree_rcu. Plus build time asserts added the struct dma-fence remains first in the respective driver structs. It sounds feasible.)

Oh, crap! Using kfree_rcu for dma_fences is an absolutely must have!

Where have you seen that? This is obviously a bug in the drivers doing that.
> That would leave us with .release in:
>  - vgem, nouveau, lima, pvr, i915
> 
> Combined list of custom .wait + .release:
>  - radeon, qxl, nouveau, i915, lima, pvr, vgem
> 
> From those the ones which support unbind and module unload would remain potentially vulnerable to use after free.
> 
> It doesn't sound great to only solve it partially but maybe it is a reasonable next step. Where could we go from there to solve it for everyone?
Well I only see the way of getting rid of the legacy stuff (like ->wait callbacks) for everybody who cares about their module unload.

But I'm pretty sure that for things like radeon and qxl we don't care.

Regards,
Christian.


> 
> Regards,
> 
> Tvrtko
> 
>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>> ---
>>>   drivers/dma-buf/dma-fence.c | 16 ++++++++++++----
>>>   include/linux/dma-fence.h   |  4 ++--
>>>   2 files changed, 14 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
>>> index 982f2b2a62c0..39f73edf3a33 100644
>>> --- a/drivers/dma-buf/dma-fence.c
>>> +++ b/drivers/dma-buf/dma-fence.c
>>> @@ -374,6 +374,14 @@ int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
>>>                         &fence->flags)))
>>>           return -EINVAL;
>>> +    /*
>>> +     * When neither a release nor a wait operation is specified set the ops
>>> +     * pointer to NULL to allow the fence structure to become independent
>>> +     * who originally issued it.
>>> +     */
>>> +    if (!fence->ops->release && !fence->ops->wait)
>>> +        RCU_INIT_POINTER(fence->ops, NULL);
>>> +
>>>       /* Stash the cb_list before replacing it with the timestamp */
>>>       list_replace(&fence->cb_list, &cb_list);
>>> @@ -513,7 +521,7 @@ dma_fence_wait_timeout(struct dma_fence *fence, bool intr, signed long timeout)
>>>       rcu_read_lock();
>>>       ops = rcu_dereference(fence->ops);
>>>       trace_dma_fence_wait_start(fence);
>>> -    if (ops->wait) {
>>> +    if (ops && ops->wait) {
>>>           /*
>>>            * Implementing the wait ops is deprecated and not supported for
>>>            * issuer independent fences, so it is ok to use the ops outside
>>> @@ -578,7 +586,7 @@ void dma_fence_release(struct kref *kref)
>>>       }
>>>       ops = rcu_dereference(fence->ops);
>>> -    if (ops->release)
>>> +    if (ops && ops->release)
>>>           ops->release(fence);
>>>       else
>>>           dma_fence_free(fence);
>>> @@ -614,7 +622,7 @@ static bool __dma_fence_enable_signaling(struct dma_fence *fence)
>>>       rcu_read_lock();
>>>       ops = rcu_dereference(fence->ops);
>>> -    if (!was_set && ops->enable_signaling) {
>>> +    if (!was_set && ops && ops->enable_signaling) {
>>>           trace_dma_fence_enable_signal(fence);
>>>           if (!ops->enable_signaling(fence)) {
>>> @@ -1000,7 +1008,7 @@ void dma_fence_set_deadline(struct dma_fence *fence, ktime_t deadline)
>>>       rcu_read_lock();
>>>       ops = rcu_dereference(fence->ops);
>>> -    if (ops->set_deadline && !dma_fence_is_signaled(fence))
>>> +    if (ops && ops->set_deadline && !dma_fence_is_signaled(fence))
>>>           ops->set_deadline(fence, deadline);
>>>       rcu_read_unlock();
>>>   }
>>> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
>>> index 38421a0c7c5b..e1ba1d53de88 100644
>>> --- a/include/linux/dma-fence.h
>>> +++ b/include/linux/dma-fence.h
>>> @@ -425,7 +425,7 @@ dma_fence_is_signaled_locked(struct dma_fence *fence)
>>>       rcu_read_lock();
>>>       ops = rcu_dereference(fence->ops);
>>> -    if (ops->signaled && ops->signaled(fence)) {
>>> +    if (ops && ops->signaled && ops->signaled(fence)) {
>>>           rcu_read_unlock();
>>>           dma_fence_signal_locked(fence);
>>>           return true;
>>> @@ -461,7 +461,7 @@ dma_fence_is_signaled(struct dma_fence *fence)
>>>       rcu_read_lock();
>>>       ops = rcu_dereference(fence->ops);
>>> -    if (ops->signaled && ops->signaled(fence)) {
>>> +    if (ops && ops->signaled && ops->signaled(fence)) {
>>>           rcu_read_unlock();
>>>           dma_fence_signal(fence);
>>>           return true;
>>
> 


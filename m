Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3299C8C16
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2024 14:49:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30FAE10E030;
	Thu, 14 Nov 2024 13:48:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="lX4hV3sq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2073.outbound.protection.outlook.com [40.107.220.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE9E910E030
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2024 13:48:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yx9PUHdjTJTUra3LPP9ESIHSRJBzFPbS2zBUiSASnzuMQjlmo8F50tqQ47/75tKv9PlFQF2OD5l5B3rrc6CEcrwFrpogn61N9mWj/TbULnFbi4lNF9WgtIZWJA+VpiR057lAHPEItWEtSRycYWEUHz2G83j/TjrYDRD2Bs6cJqeb7ws2hl8G0Jemn00LgsvWXFhit1RuotGAU1BRDyBuIgFGhKP7+QughO7vvHmU0953NXInOgVD5wXuw+PdChdaulo54LHws9lI/jHMLv4a9eERLKornsddUplJS9Gw9fRzV3MEkq9i2kXheLW/AHT3M8ZYBpAayHOxgibjlAKokw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CVT3XEIFQ/La17qyd1q4isRKyl9xya4prtMrlVrIn44=;
 b=wNJNkJWK7ZRzXa2MjzIp+vwDtcxpitawUe47WMjLzI2HrU1N7N6Y+LUfQBEIJRaYFrxxqExBbWyo7R06f6n5dkyAEpXDr2d0Z2BMGDKSiFMDgHXS86/aEsbKw6DaCTaZxvyn6dSLibrlOJzf+wRcc6QKj9kK8R41dCoRkFzZQApbk0tTQDsMrPZsby3tyJiMteO53L2HjUkG70clFyjb14rnojaxvzOcj2ozNBgFHQxZph3oze+q/+1r4DcuSkG3laVk8evsc/YAG8W6gej3Zd8KBfPH07WaxEsaCLa9z8E/3qwMJ5oHfr2rgV1Nt7FEK5cX9euTlhTGEvl175p8Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CVT3XEIFQ/La17qyd1q4isRKyl9xya4prtMrlVrIn44=;
 b=lX4hV3sq4F1dmgw6p1tm/FCj/RiUgkMwJPmCH3az8wIVUOaYUbkwdurc3XQnrqKKzv+zF9TJusT3WANdEizgY/SKt5XxU0zCTfLOXsh0XZEfLy2qZTu51ELsAWdEz3RAZ01QVaXNhGADTqkf5QCb3Cb4J0rgiIhargFCFFjwgMw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA1PR12MB6188.namprd12.prod.outlook.com (2603:10b6:208:3e4::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29; Thu, 14 Nov
 2024 13:48:52 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.8137.027; Thu, 14 Nov 2024
 13:48:52 +0000
Message-ID: <757d59ec-2735-477e-9648-a2b82a52659c@amd.com>
Date: Thu, 14 Nov 2024 14:48:45 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dma-fence: Use kernel's sort for merging fences
To: Tvrtko Ursulin <tursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>, Gustavo Padovan
 <gustavo@padovan.org>, Friedrich Vock <friedrich.vock@gmx.de>,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 stable@vger.kernel.org
References: <20241114111500.77358-1-tursulin@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20241114111500.77358-1-tursulin@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0173.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::20) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA1PR12MB6188:EE_
X-MS-Office365-Filtering-Correlation-Id: b9cfece8-214d-4cd7-55ba-08dd04b312e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eTlDblBXZUdxT2plVm9GQjFnU0xMZzRKTklLejlIQnFaZXEzUmN2ZWdsUVBT?=
 =?utf-8?B?cFdrSWdxaElIVmJLMExoRzNjaHBxTlFRWDdRVEZSNjNPUGlBdTJQU3dPd2F5?=
 =?utf-8?B?SEtiZUN1dzloVFdTTXAyRmR1R0VUUEhYbXQ2TGZwRHVXY1pvckFjU2VOTWx3?=
 =?utf-8?B?YlpSOWFabHIyUzlEOXA2cWlnYml0ZGljRkJhZFptZXl4Z3IydWJhaU8wVnQ0?=
 =?utf-8?B?V2FneFNlNWtGR1d4dnE0TnBpZWRoZnlzN0VPR1VrakljcWJUSWVscDM0TVBm?=
 =?utf-8?B?emtjS0RkWk0rYzBPOGZmaGtvdFVsUmhjbHBpVVJrem1HajgwOGt0YlhiZDVm?=
 =?utf-8?B?MWZSSDNzUkgrVGtYNm56WnFsb29ra295NlNqb1ozUFNtSHFuUU1IeDJYZk1G?=
 =?utf-8?B?ekFGUVcyQjd6R2x1OVR3dnUyanQ4NklxV1prV3ZDckxMNFZLcTRTeldjWEpV?=
 =?utf-8?B?MXl0TmR4VW5tUnh2RUxZRWFIaHY2MG5DZ1RXVEc0ajhWZE1lbzJrMXR5TnND?=
 =?utf-8?B?WnBiZ2JCV0FYZXdBVnBvMWtGWUV2ajdOZnhQd2tUN1FnZUYrenhGR0d4cTJQ?=
 =?utf-8?B?V0psWWxlZTNPRDY0RVhGQyt2NTNvSmdZV045NnBBVkV5QXdjS3F6OUZxZUVL?=
 =?utf-8?B?VVRXZzFVYjhmR2JBZ2x6VncyVDNiRHRqKzhqUlRyM1U0cWVVenFLWUFaS0ly?=
 =?utf-8?B?Z2dGV052TFQ5Vm1uMkJPeFdwTTFFdVN3MEtBKzBaY0pjTU1WQUFpUDQ5ZGZL?=
 =?utf-8?B?RlBvcXRMbmdQY21pRk9LK2xtWGEwSFZxWWxEQlF5enlTalBMMUxhVXZzVTZk?=
 =?utf-8?B?dzd5WFpjM2RCaXN2R1Y2K3E3VzFOcXllTEltcVdXU3hBT2lYWXdqQUlUeG9o?=
 =?utf-8?B?NWkraGNEbTZFRFo1VXkwNHlTNm9mVVp4OGh5MkZaQXUwTWZ3Mk52Mll5K1BL?=
 =?utf-8?B?b3lZWkMvbHBvQ3pqaFhZZzlydWo4bnpwL3BDZ2lkK0xwUUtiOSs2dWNFaW53?=
 =?utf-8?B?OWdkOHpFTmhwKzhiRWRvM2x2YjVIdDdVejFiV2RHSlltdjlYN2I3Tk1IdFJx?=
 =?utf-8?B?V25qUzdQWWNnanpkK09sS3AwQmlwazRRRHhBNTNwWHczSU9ZbDFPL3czMGJZ?=
 =?utf-8?B?VjgxRG5ZKzFIcng2bjU1MFRCL3pjdEU4N2ZqcWhPVWEwdEN5Vkc0TzBRVUZt?=
 =?utf-8?B?NkVyZXBTcXRwTmVtc0g4NVV5eXJoTThFZVpuQ0xLa0dvTW1qV0c5eHJIRUlB?=
 =?utf-8?B?UHlkSlFtT2s1aWJmV1Via3dWRTFlQi8ra2M2bXBySFZ6Q3Y1aHM1Y1J0MWhI?=
 =?utf-8?B?N2VZOUo4S2NKSmN3cUdKcXo3UVQ1NXlCbTdlcCtCZWdvbUQvd3FVWE9iVHBI?=
 =?utf-8?B?Q0I2TmlCOWE4L0hyRzVDSS9STjY0K01zM0FCNVg0MDY2UWlyZjRNVDZNa1lz?=
 =?utf-8?B?UnJZWituRFhpTjIxZnlKSHBFVy81L2VsUmpuZDRIV3JyaVNvRW96d2xtUUZj?=
 =?utf-8?B?dm9NUGtmK0JOWVpENWJ3Qmxpb0NGZXYycklNNVFkVzRQc2dhejMyTHhFbG5C?=
 =?utf-8?B?ejR5NDZ6Tm9YSEx6NDg2akxMNThzaEk0aHk2WUI2Rjh4QVRHS2VtUDhTMy94?=
 =?utf-8?B?czFzSlRkVnc0Y1gyNzFRbFBzOXpMcGZ4NS80SEd1TGxrTWp4Rk5vRS9jbElF?=
 =?utf-8?B?Y0xncjlGb2FnL1I4cUxpR3o5SlAzMElKcC9Ja1lXTUkxMmRHc21vbFZnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXdWdnlJdjArc01EWUFRWml6QmhPTmVaci8vMVFMMFREblAxSC82UlJzeEFn?=
 =?utf-8?B?YTBDSm4wUUZBTEQyVit2TGZ4UjdZckp3eE5QQ0tEQktYTEpYTmZmQUhLMkNt?=
 =?utf-8?B?QUsxc1NhYnRIRGNsUGJhWHIxanFuZjNYbXpOcXBlRDh0aW1LRnZOcVlqODNE?=
 =?utf-8?B?MGxzNkVudEh4RklESUV4bmd0TTJNYWhHK2g5OC9NbDZwUVlLUi9XYmsxaW1k?=
 =?utf-8?B?NXVaRVNpYVY5UWoxdWpNdjcwMUFoWWI0M3kzdUlwYUNPMWlkK3JCdSt4UGZK?=
 =?utf-8?B?NG5UdnFEcGVOV0cxSnM4Yzlzb3lPejZxQ3RhcnlJa1VHT2I1cExRd1JVT21k?=
 =?utf-8?B?MStaQk1MNFhyM0FuSG5GMEFJMnBEUi9NVVRXSXhlRnFMQ3RPT1kyTGZBcEEw?=
 =?utf-8?B?aWhlb0FpRFJRNUptWkk3NTRjdlVIWGxVU01SNUNERjgrR2swU0cwazNyY280?=
 =?utf-8?B?MU52SEVOV1FleDdQS251SjliQUh4cm5jSEVCVHZkUndJV2hPbDZQRWVLRjF2?=
 =?utf-8?B?MkJNQjA2Y01ONlRPZy9CWm14N1NOa3pLNGEzMlY5bjVLa01oc25lcW96Nlhv?=
 =?utf-8?B?ajNlMGVEdTZTOCtOVklmdXRzdW9NVkh5WlhOK255OXk1dkU5bnFmWWRtVVFP?=
 =?utf-8?B?dXAwWkx1c0R4dEpzNVQ2bXRZcStOZytCZElkVERiRm5HajJBNVY1UUtKUzV2?=
 =?utf-8?B?ckdXcm9KVDV1b1NYdEtsV2RzMk00VlJRT1o0c01hcThmcXA3b1RzZ2ppbVoz?=
 =?utf-8?B?Qmw5T2pQeDF5MDRtQWR1cXl5eTZkeityQ1VjSERxY3U5NXNjblc1dkJtV01Q?=
 =?utf-8?B?aUlRUkQyQ3l2Wm5aQmlaNHJQVUtqNmxoK0wxVjloVmZBckcwR0hIV2x1TENy?=
 =?utf-8?B?RHhFTmllQWE2MGd3Z21QTjNDcFBQZEJ2ZS9sUHZQQUNJNFcvcVJ5ZktqZjRV?=
 =?utf-8?B?NzVOZ3dLRllNQWxXUm1lNytENlBXczMyNXVEcjYvNDBCMHRjZ1lUcC9yR000?=
 =?utf-8?B?NGFoQU5QT2ZxZzlDVGFrdzB6K0NXMXFqdWErbE13ZkhKa2t5bTNzRGt3ZUFj?=
 =?utf-8?B?RnBKenhIbnB2bHYrNWxwR0o1VXA1K1JwZ0FBRGZCMFZ4aUlJYnNHeTFjMWNW?=
 =?utf-8?B?TEtaQ1NGTW1RVGlNb1RrNC8rL0JZMkcvMHRpQTBzamhhbUVVZ1F1RTUwQ0p6?=
 =?utf-8?B?YU1EeGY3U01KR2VwNitxUjNVUjllQWxjcHF2VG0rcHY4SVc0V1VRdTRRQUY5?=
 =?utf-8?B?akpncFZsUFdxZkgyNEphazBheHV2T05aTTVUalpISHR1TURaRmZBUzVpNmUy?=
 =?utf-8?B?QWw1QlFEZjk3RXFCWlgvUUo4MU5TbkpIcmkyVHVTd0JoYVVHZjRqZFV2bkJI?=
 =?utf-8?B?RngvNUxZbkVjQU1lb2JxaUpIWHRnZTk5VktSUmJUZlR1R0RpQTFUWFdDVWlS?=
 =?utf-8?B?Wjd6dkliM0IyL3p4NmEvTkNNQzV3TDZlRGY0V2lTWEtENDA2R1djRjFpdVJo?=
 =?utf-8?B?RHdrU1lwZ3hTODhnbVIzVy9XY01IemNYWG5Femx6andHLzMvaXlLencyeHZJ?=
 =?utf-8?B?bmpMMXpUUzMzQXBXSXpHYWNHcFN4ZDI5TWFtV05xdm9FUVozWTBiRmVIRmtp?=
 =?utf-8?B?TnpHSmpyNE9QRmhDTkdPWXpmWFpHby9wMjBPbVoxODY1elp0MzhWRmpIc3A5?=
 =?utf-8?B?MHZMS2RnOXVJc2tZM3BWNDd4QlRwKzAyUk9XR0NNbnI4SWpGM0p4ZUJHbW85?=
 =?utf-8?B?YmRBODQxdWRxaU9BMDZHazVodW4ybnQvUEFOV2FiSEU0VjM3Nm5Gb3RFTWdj?=
 =?utf-8?B?aXVVeUdWZ1gwQWJNQ3pYZ1EwZTN1Zmd5RitkbmRsZHUrWGx6U2VaL3drZ24y?=
 =?utf-8?B?Mkw3alEzZHNldlN1eFlFTnJUVVFFUG1palVVYWlGcUVyemJSUFpUUUdvQ3FW?=
 =?utf-8?B?WS9sUVFaVmRMdUc1TmpZM3pTQm41SU9zR1hEeWVEdThUbm05cThrQ09vMFlW?=
 =?utf-8?B?clhQNU1xU3pWOHNiRG5FQmxMT1ZON0drdkRiRmdqVWhPNG16ay9vYkNZVlhQ?=
 =?utf-8?B?bjNNWVdCS3RzcFk5QU9qNUJTWEVyVFJCU1ljVi9aVHVuVVI2VFg0UVVNMnNH?=
 =?utf-8?Q?8XA0=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9cfece8-214d-4cd7-55ba-08dd04b312e1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 13:48:52.0033 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qVWDJyK3VgloeJS7e8UvnlWxYgnFFfxwU6zfm68nZvo7jlE440kDKBimbJxJZ0Eb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6188
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

Am 14.11.24 um 12:14 schrieb Tvrtko Ursulin:
> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>
> One alternative to the fix Christian proposed in
> https://lore.kernel.org/dri-devel/20241024124159.4519-3-christian.koenig@amd.com/
> is to replace the rather complex open coded sorting loops with the kernel
> standard sort followed by a context squashing pass.
>
> Proposed advantage of this would be readability but one concern Christian
> raised was that there could be many fences, that they are typically mostly
> sorted, and so the kernel's heap sort would be much worse by the proposed
> algorithm.
>
> I had a look running some games and vkcube to see what are the typical
> number of input fences. Tested scenarios:
>
> 1) Hogwarts Legacy under Gamescope
>
> 450 calls per second to __dma_fence_unwrap_merge.
>
> Percentages per number of fences buckets, before and after checking for
> signalled status, sorting and flattening:
>
>     N       Before      After
>     0       0.91%
>     1      69.40%
>    2-3     28.72%       9.4%  (90.6% resolved to one fence)
>    4-5      0.93%
>    6-9      0.03%
>    10+
>
> 2) Cyberpunk 2077 under Gamescope
>
> 1050 calls per second, amounting to 0.01% CPU time according to perf top.
>
>     N       Before      After
>     0       1.13%
>     1      52.30%
>    2-3     40.34%       55.57%
>    4-5      1.46%        0.50%
>    6-9      2.44%
>    10+      2.34%
>
> 3) vkcube under Plasma
>
> 90 calls per second.
>
>     N       Before      After
>     0
>     1
>    2-3      100%         0%   (Ie. all resolved to a single fence)
>    4-5
>    6-9
>    10+
>
> In the case of vkcube all invocations in the 2-3 bucket were actually
> just two input fences.
>
>  From these numbers it looks like the heap sort should not be a
> disadvantage, given how the dominant case is <= 2 input fences which heap
> sort solves with just one compare and swap. (And for the case of one input
> fence we have a fast path in the previous patch.)
>
> A complementary possibility is to implement a different sorting algorithm
> under the same API as the kernel's sort() and so keep the simplicity,
> potentially moving the new sort under lib/ if it would be found more
> widely useful.
>
> v2:
>   * Hold on to fence references and reduce commentary. (Christian)
>   * Record and use latest signaled timestamp in the 2nd loop too.
>   * Consolidate zero or one fences fast paths.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Fixes: 245a4a7b531c ("dma-buf: generalize dma_fence unwrap & merging v3")
> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3617
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Gustavo Padovan <gustavo@padovan.org>
> Cc: Friedrich Vock <friedrich.vock@gmx.de>
> Cc: linux-media@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linaro-mm-sig@lists.linaro.org
> Cc: <stable@vger.kernel.org> # v6.0+
> ---
>   drivers/dma-buf/dma-fence-unwrap.c | 129 ++++++++++++++---------------
>   1 file changed, 64 insertions(+), 65 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-fence-unwrap.c b/drivers/dma-buf/dma-fence-unwrap.c
> index 628af51c81af..26cad03340ce 100644
> --- a/drivers/dma-buf/dma-fence-unwrap.c
> +++ b/drivers/dma-buf/dma-fence-unwrap.c
> @@ -12,6 +12,7 @@
>   #include <linux/dma-fence-chain.h>
>   #include <linux/dma-fence-unwrap.h>
>   #include <linux/slab.h>
> +#include <linux/sort.h>
>   
>   /* Internal helper to start new array iteration, don't use directly */
>   static struct dma_fence *
> @@ -59,6 +60,25 @@ struct dma_fence *dma_fence_unwrap_next(struct dma_fence_unwrap *cursor)
>   }
>   EXPORT_SYMBOL_GPL(dma_fence_unwrap_next);
>   
> +
> +static int fence_cmp(const void *_a, const void *_b)
> +{
> +	struct dma_fence *a = *(struct dma_fence **)_a;
> +	struct dma_fence *b = *(struct dma_fence **)_b;
> +
> +	if (a->context < b->context)
> +		return -1;
> +	else if (a->context > b->context)
> +		return 1;
> +
> +	if (dma_fence_is_later(b, a))
> +		return -1;
> +	else if (dma_fence_is_later(a, b))
> +		return 1;
> +
> +	return 0;
> +}
> +
>   /* Implementation for the dma_fence_merge() marco, don't use directly */
>   struct dma_fence *__dma_fence_unwrap_merge(unsigned int num_fences,
>   					   struct dma_fence **fences,
> @@ -67,8 +87,7 @@ struct dma_fence *__dma_fence_unwrap_merge(unsigned int num_fences,
>   	struct dma_fence_array *result;
>   	struct dma_fence *tmp, **array;
>   	ktime_t timestamp;
> -	unsigned int i;
> -	size_t count;
> +	int i, j, count;
>   
>   	count = 0;
>   	timestamp = ns_to_ktime(0);
> @@ -96,78 +115,58 @@ struct dma_fence *__dma_fence_unwrap_merge(unsigned int num_fences,
>   	if (!array)
>   		return NULL;
>   
> -	/*
> -	 * This trashes the input fence array and uses it as position for the
> -	 * following merge loop. This works because the dma_fence_merge()
> -	 * wrapper macro is creating this temporary array on the stack together
> -	 * with the iterators.
> -	 */
> -	for (i = 0; i < num_fences; ++i)
> -		fences[i] = dma_fence_unwrap_first(fences[i], &iter[i]);
> -
>   	count = 0;
> -	do {
> -		unsigned int sel;
> -
> -restart:
> -		tmp = NULL;
> -		for (i = 0; i < num_fences; ++i) {
> -			struct dma_fence *next;
> -
> -			while (fences[i] && dma_fence_is_signaled(fences[i]))
> -				fences[i] = dma_fence_unwrap_next(&iter[i]);
> -
> -			next = fences[i];
> -			if (!next)
> -				continue;
> -
> -			/*
> -			 * We can't guarantee that inpute fences are ordered by
> -			 * context, but it is still quite likely when this
> -			 * function is used multiple times. So attempt to order
> -			 * the fences by context as we pass over them and merge
> -			 * fences with the same context.
> -			 */
> -			if (!tmp || tmp->context > next->context) {
> -				tmp = next;
> -				sel = i;
> -
> -			} else if (tmp->context < next->context) {
> -				continue;
> -
> -			} else if (dma_fence_is_later(tmp, next)) {
> -				fences[i] = dma_fence_unwrap_next(&iter[i]);
> -				goto restart;
> +	for (i = 0; i < num_fences; ++i) {
> +		dma_fence_unwrap_for_each(tmp, &iter[i], fences[i]) {
> +			if (!dma_fence_is_signaled(tmp)) {
> +				array[count++] = dma_fence_get(tmp);
>   			} else {
> -				fences[sel] = dma_fence_unwrap_next(&iter[sel]);
> -				goto restart;
> +				ktime_t t = dma_fence_timestamp(tmp);
> +
> +				if (ktime_after(t, timestamp))
> +					timestamp = t;
>   			}
>   		}
> +	}
>   
> -		if (tmp) {
> -			array[count++] = dma_fence_get(tmp);
> -			fences[sel] = dma_fence_unwrap_next(&iter[sel]);
> +	if (count == 0 || count == 1)
> +		goto return_fastpath;
> +
> +	sort(array, count, sizeof(*array), fence_cmp, NULL);
> +
> +	/*
> +	 * Only keep the most recent fence for each context.
> +	 */
> +	j = 0;
> +	tmp = array[0];
> +	for (i = 1; i < count; i++) {
> +		if (array[i]->context != tmp->context)
> +			array[j++] = tmp;
> +		else
> +			dma_fence_put(tmp);

If I'm not completely mistaken that can result in dropping the first 
element but not assigning it again.

E.g. array[0] is potentially invalid after the loop.

> +		tmp = array[i];
> +	}
> +	if (j == 0 || tmp->context != array[j - 1]->context) {
> +		array[j++] = tmp;
> +	}

Maybe adjust the sort criteria so that the highest seqno comes first.

This reduces the whole loop to something like this:

j = 0;
for (i = 1; i < count; i++) {
     if (array[i]->context == array[j]->context)
         dma_fence_put(array[i]);
     else
         array[++j] = array[i];
}
count = ++j;

Regards,
Christian.

> +	count = j;
> +
> +	if (count > 1) {
> +		result = dma_fence_array_create(count, array,
> +						dma_fence_context_alloc(1),
> +						1, false);
> +		if (!result) {
> +			tmp = NULL;
> +			goto return_tmp;
>   		}
> -	} while (tmp);
> -
> -	if (count == 0) {
> -		tmp = dma_fence_allocate_private_stub(ktime_get());
> -		goto return_tmp;
> +		return &result->base;
>   	}
>   
> -	if (count == 1) {
> +return_fastpath:
> +	if (count == 0)
> +		tmp = dma_fence_allocate_private_stub(timestamp);
> +	else
>   		tmp = array[0];
> -		goto return_tmp;
> -	}
> -
> -	result = dma_fence_array_create(count, array,
> -					dma_fence_context_alloc(1),
> -					1, false);
> -	if (!result) {
> -		tmp = NULL;
> -		goto return_tmp;
> -	}
> -	return &result->base;
>   
>   return_tmp:
>   	kfree(array);


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3A993ACE5
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 09:03:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 188C910E18E;
	Wed, 24 Jul 2024 07:03:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="x+f6zt9G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2066.outbound.protection.outlook.com [40.107.93.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7736B10E18E
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 07:03:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pAKlAjN9nXny7NYyBzGSy8XeELnqB9G4aGTE0JBRDHj1yHwxeE5/rOfAjR+g+OJstUw530+SvurE0+50xWaZ4TYGmWtcDpphj2vU+vd9q3fOeRHWxLhZIqqpOTSCQ7vlaYZrlouI+LT2gRosBlX5PvFrn7zfj4KbPVmdygxTvMkbFNq9ihm1+BsyyJEOFmpK3vGEHOOCKdBA0nC5D8ET9/xgt8tMvlpDZS2J7heHL1wtAVL5HiN9ZarUZBzdPNzkD3llUfacwZnU/aD2i3ZQC0eB/4cfzj/QEf3bOS3O3vUSvTX5Np/I1FtyRB+nY8nQpl9n0TEiGP8KFnua7iFQig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IiHXo+AAfcM/in08tAs6bWqnJrLz0Lifpk34arsIZFs=;
 b=x+hoUuK78rj12j0fQNoXAsBJr7/935Y1WhS3vG2pMzJ7n+5X0NSqfB4wRY2aMvplUSw9I99nB0U56qSK+gS941N3bHvRNnzCIrL6l4KdJmWRXgq72X4JhfPE78iEGE9zZrPSMO9lqGqJQwIMHdCVmDy+agA80U3kYfybzBIA7ZXWa1kalerangN6dieqm+SGM1MSPLtl2gMJBC4X8/9LcxL2NC4t9pKBkBQ7EBWh7+AdoYmcUjcrApLWRqXtJsVQtOieG2Yrzep9GY0D8XIzbHgqLFZ12b2yBETnEJzvERC1JEZ0bYxrOTiwGT/L9bCwj/91cbiXQa3Rx76L5VmMew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IiHXo+AAfcM/in08tAs6bWqnJrLz0Lifpk34arsIZFs=;
 b=x+f6zt9Gp0sfO7+S9OpswEB/kOd2kgMhPESG8nKO5Ml6WqiWOQIQv2fsv5w0sxdLmibrgJzqquaMZyx3z98HdMgjuUYNutxNplcEBrX6tGIMSu5Pw7vmUh4IeoAWEmCzEoyenZo+cacovsT/xtYsRUSEJhJ9gIhw0SX9j5VPw24=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ2PR12MB8717.namprd12.prod.outlook.com (2603:10b6:a03:53d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.15; Wed, 24 Jul
 2024 07:02:57 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7784.017; Wed, 24 Jul 2024
 07:02:57 +0000
Message-ID: <a7dc49b7-0da2-4fbf-a045-1bcd72ebaa8c@amd.com>
Date: Wed, 24 Jul 2024 09:02:50 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: bisected/regression: choopy youtube video on Ryzen IGP -
 0ddd2ae586d2 drm/ttm: increase ttm pre-fault value to PMD size
To: Yanko Kaneti <yaneti@declera.com>, "Zhu, Lingshan" <Lingshan.Zhu@amd.com>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Li Jingxiang <jingxiang.li@ecarxgroup.com>
References: <20240604084934.225738-1-lingshan.zhu@amd.com>
 <26c01e3b726812979846710afcaab81e92da6a40.camel@declera.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <26c01e3b726812979846710afcaab81e92da6a40.camel@declera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0273.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e6::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ2PR12MB8717:EE_
X-MS-Office365-Filtering-Correlation-Id: b5805b74-669b-4cb9-97ab-08dcabaea5ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eUhTdytLZnludmk1QlZvMnJaZTFyaGt4Ri9QR3Q0cElWK0JGUmpWRkQ0Q2o2?=
 =?utf-8?B?bzNXbm8ra0xwSVZVcTVjaDE3dzZzWXdlSU9WV1J4L2YzLzhkVTBFU2hHSmU5?=
 =?utf-8?B?VEtYcUxYT1hGSjV2L3VJZERzNWdvNFFIRmh4dUFLaEtaRTF2ek4yRWNyY3lE?=
 =?utf-8?B?amhGU1dkNitPSWJVNkdJcXVkd05udFJ1VmJFaURiZVphNHpVM2VGN2lENWVh?=
 =?utf-8?B?aHJOUGgwSkdjYTlsNXh6cWhKZFpEcDVaZjl1K3djODQ0TUsvZ1lpQ2V0Umg4?=
 =?utf-8?B?S1ZKQmFzNmZ5YTFwVHlZOGc1MmoyZW9xWmZueFhXNXQxT2dMbHZCWXh2ZkFC?=
 =?utf-8?B?cEtNblNUUS92MkM0WFBLZkFORUFqTjFEdXZ5YjNuTlNBN0FIdGVjb2VteEhk?=
 =?utf-8?B?VXh4U2VCZDRTaGlsODNZOTlBMCtBZjQ5WXBJOFRoZ0xkV2hyNzJPVHVUUjg4?=
 =?utf-8?B?VU1Sb0tSeS9YTktnZFBLRmhQdUhUbzBMZUdhaEJ5STRiNW5BUnpVeFAyczk4?=
 =?utf-8?B?b1pwUngyM1JZZEE2YkYxUU42WTUvWllZMlJ0b1BEWGpDRG9WVUJ3NG8vYWhj?=
 =?utf-8?B?emJCeGFyOGMwRkl1SWswbkxUVXdVckhBUExjMmljeWIyZ1FiTG5HOTUyUzNX?=
 =?utf-8?B?eTdPN0U1clkrbVAxMHBrQjAxd2FDZlYzdU85eTF6ZzBuOWtZd2FoUTlVblN6?=
 =?utf-8?B?ZkZZSndRR1IwbWo5Z2VlRE1qSDFscEllWlZBUnRnbEsvQ3dodmdHYXpsOWE5?=
 =?utf-8?B?N05jd2hwQks1cVRXMVJhYjRzOG93cC8xTmZ0NXROMVJEbU1nSVY0SXYya2lw?=
 =?utf-8?B?L0FnUS9YK2U4U3dtTmwwL00ybDBERzRzOTJ3MndUZ0RrNXNFcFVNTTI2ZjI2?=
 =?utf-8?B?eTBtQnJyUlZveW90VzlYUllYRTA5NHhzaGYyWXpsVERHNmo0OUlTaHQreE0z?=
 =?utf-8?B?ejZMVTA2Tk9SNVZzUVVBVjhmdVU0WlF6KzF3eGhDbVZ3MEN4cjBzQ2Q1cjIw?=
 =?utf-8?B?ZG9CMkI3QzFTZUdvYlIxYUY3aXVvNnNldFJ1VWdSR3ptMFhYUE9GV0RSaDgr?=
 =?utf-8?B?RUk1TTZIc2tSaHFodEdkU3pKUk9xVHRFWUJRdE16a3FYNGdxYWRBdWErZG13?=
 =?utf-8?B?c1N2RnFZWktYa0F4d3ZLTmhlb3pUQkFjTmd0Nms5ZENKZ3dFcWFlZS9abEpP?=
 =?utf-8?B?VkRWdWx5VlJZdFcrN1lUMDZad3ZCQ05pWUlLOXkwdVBBZnlTZU1uQzlPUkJK?=
 =?utf-8?B?TzNYZnBQMHFKOFhiVk92N2RIV083SXZGM0QwcWF1QUlkdmFTTVBSYmp6LzA0?=
 =?utf-8?B?VFk4OFBSMUtoYUZWQ3lsNGNIb0p6NzlwdVlrTldCTTdYZmozb0FsQzhNR0Jo?=
 =?utf-8?B?SjMyeUZ3NGQxNmxhdGlkV0tyYVNyWlQzSVJ4andtYVFNUXh4LzZVR2pHVzJi?=
 =?utf-8?B?Sy8wanBSSHFhL2dSOUY1SVhFYkRKY0o5ejNidnE0UEEyYmFyUkwyRWZmcHUz?=
 =?utf-8?B?dWpMZGxXUnZaZ2tIRXNzUUkvMmtEdU03dXZXYVNhNE4yRTRhZ1JMR09venJD?=
 =?utf-8?B?S0hxU3VTcDhFTEhmV2dZbkNxLzRxeEMwaWViR0V0a0kvNllmdVNyQjBTSW5T?=
 =?utf-8?B?RGdRRWdVTW5UK2VhTXZWc3l5dWFVWnhicEE2VzJSTG96QWsrcm14WHFsVFMr?=
 =?utf-8?B?aUxHWUxHdEdITzFJWEpoVWxGZE9RNGJ3cTRTMW1DdVcyTkRNUzBjOFE0dzQ2?=
 =?utf-8?Q?ll3+N12X+sU1j5NZ+w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SXJVM2JGMUI1TUVWeHBiL01kVDFud1I3YURKMmhwcmt4ZktYUlZ4cU45UHJU?=
 =?utf-8?B?SWxRaTgzRWRPYnIvdjVXUU9QWFoyeGx2MjR0bXVZMXBzMTZVSnJrenhqSGJG?=
 =?utf-8?B?c3VZR2xPdWhLSi9ZWXNlWENrVUJnMjFjaWx1ekxOdXpUY1dUSVFpWjBJcUhl?=
 =?utf-8?B?eXlVK2FlOS92d296N0NzRUxKSXVLbUlZcGRYd3VSbjcyNUNWZjlsT1YxNmRN?=
 =?utf-8?B?bXJlTVM3cUVwSDYwY29XakgvUFpZaFhjTzBHWEg4VWgwZ1ZlZEpwYWw3VUFs?=
 =?utf-8?B?d21oYUd3S3l3cDdNdmM0MkFreFY4VXdsT3NkV09DdnlKUVNCSVN4cjRDQzhk?=
 =?utf-8?B?bmtXbGRsZmJjVXdZK3hwaDZDNWhnbjR5bjFVVnpGM1FxYWRSOERkaWZhcTI1?=
 =?utf-8?B?T0xKcW9FYnVrSDRzeU1ML1BrL2xMbUY5ZTlrY204S1l1RmRlRE96TlZBLzFW?=
 =?utf-8?B?SElUK2JrR3ZpNlpTU0R5VVlyeE1HYXp1TW5JeGpDZzRiU2h5S0JEeHVGYXNo?=
 =?utf-8?B?dHZOMWNlTWFpNVppMEcwN1dsK1ZxMDl4bGYrOTRTeW16Z2M1RzRJaitkN2lM?=
 =?utf-8?B?YzdhV0d3cjRtZXhoanhudEZwa0FSVkRJanVQZkliWFk5bGJDQ3hpMVNSQ3Bu?=
 =?utf-8?B?clVyb0p0MjREWjZXVkZFdDZsY05aWTZCbEZRSHd2M2xHWTZmU1ZqNGt5YUlP?=
 =?utf-8?B?L0dVUkFFUWIwNTRqRkR0MnMzR0Y4NlBDMTh5Kzlmc0Rtd213SllMSkE2cStI?=
 =?utf-8?B?TWxTeUo3TEEwcm54Z0hVTVNGVHRMRzR3VWIwc2cyRWFvczRMbWp5aW1UaXZT?=
 =?utf-8?B?cEt2ZUs0NXFPTFBscEVJeGRRZzFVRVVGNWJnK1hWYWJQemJBMUgvaDFnRlpl?=
 =?utf-8?B?MVRRK0dnRWczZFJiYkU4ZXJYcGNLR2pMUDFxMkRhajJ5UEk5UGcweENUWTNM?=
 =?utf-8?B?b2tPWmZRdGhGaVVJcDVDMFNLRWZWTHV0QlllTGsrRnYybHhMbjBiOE93YUdH?=
 =?utf-8?B?a1c0TTIvUytuaHVnV2ZZUTJWdStDbE8rQm5ZdjJnS1JaSDIrdm9oNnVtZGw2?=
 =?utf-8?B?TElKNzROSmh1dW50em1aWFpCc0E4S25WVWRzREVEMTRoK1FRdk1tSGZHcUpW?=
 =?utf-8?B?NU56aUxCSkNQTmhzL0F0d1NaOVVpY1Rvdk1HMGxZcHgwR0ladTA0SmVTVTJ0?=
 =?utf-8?B?cnYxaWQrTHZZd1ZabVVwenpodFJkQXp4RmJPdmFDRVRUbFNrZWQ5OGxHeEkv?=
 =?utf-8?B?bU05d0E4YU1KT285cTc5V2txL254MHpxNlF6MjJwSjF3UlZuMld4MzBaMjMr?=
 =?utf-8?B?aFgxMHR6SDNhakVQa3pERDVwbWxSWmcwMnp6dnViUVZtUHFUVGVnQ0xsUlJO?=
 =?utf-8?B?SWtaU0xtMGEvNDQ4MzlZNE5wQWgvbExvd2ZqcDZqekJUWm44cmxHKytDWkdr?=
 =?utf-8?B?SlJQSXc3OFhSRFVhVm1DV1hwajFHbGNqZGRORkxyYmt5RHNKbnJHYjF0ZkEw?=
 =?utf-8?B?VmV5aDhEOFVhaVlwTUJFSXA1TlAwUmFNdDlCQ2tSclRyYlRXRFh1VXpXTHY4?=
 =?utf-8?B?VExyTkkwZHpaSnpQUjF1bVEyalpDZ3VxdDJGeXhtSXptN3RsM1hUWENoUGtW?=
 =?utf-8?B?UDJZUlljSWVGRFRYdHBNSzl6clFGbE9wYy9oNHcxNDcwQ0ZzODJzb0owLzlh?=
 =?utf-8?B?SkZTdkZwNDhUK0w5VVQ5VWNncy9LdjBTam9WNmNHQ2x4dmNDa2g5M0tyRlli?=
 =?utf-8?B?ZXg0eE5VK1hDTjk5ZnZCSHZMajhuNm9qUFIzY3hLbkZscFZuTzkra2JxQ3Nn?=
 =?utf-8?B?QUhISENKVlBHN0t2dWRRK3IzSzRaR2VnT2NXRE4wOFZBZTQ4cEgxYWhYeXRD?=
 =?utf-8?B?aklzRXNha0p4Y0dhYktCS1k0Vi9lWmNiQjYwSHY0UVZmTjN2bWVGTXZMMmVS?=
 =?utf-8?B?L3VyaFh4UVNsNUtkalFrc0xuTmRneEFqTXFlVmhUell5dDY4aWpzRjgrc3lv?=
 =?utf-8?B?S2tSMWJLd3Bmb3BDQVRESG9lRWtsWUhwSnFMUm1mQ3htMmxoWFdvT0xUcFJK?=
 =?utf-8?B?UzhXajNkVlNqNU16aHErQUlqRnVJcFlyNGw0RzJVYmpnTWJ4N1hCNWVOQVJt?=
 =?utf-8?Q?ENWi8abHmTg66AbC90dWMqPlV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5805b74-669b-4cb9-97ab-08dcabaea5ac
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2024 07:02:57.4327 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wBjv+AXQHyaWOSq01FhMePu38Vfr+6qR3pXKSKsxlHJ+Sn2UoYgv8vbkIhhFl5bT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8717
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

Hi Yanko,

interesting. What do you mean with "choppy"? E.g. lag on startup?

Regards,
Christian.

Am 23.07.24 um 21:42 schrieb Yanko Kaneti:
> Hello,
>
> Noticed and bisected a rawhide (with the new 6.11-rc0 snapshots) regression to this commit:
>
>    0ddd2ae586d2 drm/ttm: increase ttm pre-fault value to PMD size
>
> The regression manifests in choppy youtube video playback in google-chrome-stable.
>   https://www.youtube.com/watch?v=uOpl2XNOgMA
>   google-chrome-stable-126.0.6478.182-1.x86_64
>   VP9 video,
>   Chrome -> Override software rendering list -> on
>   Chrome -> Hardware-accelerated video decode - default enabled
>
> No other visible graphics issues.
>
> Its a desktop system with Ryzen 7 5700GRyzen 7 5700G  IGP
> [AMD/ATI] Cezanne [Radeon Vega Series / Radeon Vega Mobile Series] [1002:1638]
>
> Tested with linus tip and just reverting the commit fixes the issue.
>
> Sorry for the brevity, not sure what other details might be relevant.
>
> - Yanko
>
>


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F34878ACD9B
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 15:00:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6336110F5E0;
	Mon, 22 Apr 2024 12:59:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="VrG9amHW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2084.outbound.protection.outlook.com [40.107.223.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1D7D10F5E0;
 Mon, 22 Apr 2024 12:59:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HmQd+JG1cfNA2Sta1e6cdsPU+ivHYst5iJzul93OIjiuMRoLHdpqh/RpIcKPmxZtoQxiZRnBGjwfecLoXSMFfpP38sGIvD1uHSA8LaTfZORu8u7hB2M9gRZqQdVFclQGRZF6USeOAqsncamAUJCOFcwnJV8AmnwSvkXD77N0g/KRe6B6XLu99nhD9GfIv+Jn87z9pOXR+zFwnTW/3pAuVGC10PGdtt5d5nfD1xkW/ay80QOnAvGIh8ZQ9IOrkNH6827E2l108uEmqPS/baipLs/NnW7fg+SheoS/4zFf6sOOv4stENh6mjYYo6gk917dgoqGxNRM9QE9DEx1migrxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L8jgRiAYAd1BsPB6QpTsacuss6Jx1qChFCNYuIK215I=;
 b=G3D/R4iWy0jyorEA83la6N/NBHshh2uTwrXL34z9VZK37XcENICVK7ygbxDexO5kPwjThbuUszbgeiGmXJPmg1isiunMWeOSdQv4tJHy0t84U4FONghLah//sew8Sl07nQYmi5savrBEsGo20G/6+DCZ5THgJZ7SJVGzd0UAi2dLb5aoRZzt/eLSbO0SvH14s14TNggN4zl0k9o5oWzeJmEcSryCIvlG4NfGSLOSXCASx3C0ISai9JYEMF2gZzq+IZuTG0eoajfNJFWD/IpKLYJgnPn5Ek4WscFyIEJ8umJmLtJBGA1QWpuieh1xgdHfl31iZsUdnZlBBfH0yEXIog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L8jgRiAYAd1BsPB6QpTsacuss6Jx1qChFCNYuIK215I=;
 b=VrG9amHWqzPkBcKsU6fPuCmvcRrj3iFRPN5ta1O4w8IWSKInCMGqOulhI/lTYRNYV7VOLJp9U1kzKisNOCdx3EB1FZ4+tTLy8iFo5LAoTJ33iHBnryFxoc0fbWtWW3FQiKmOTbF1dly4xJLXZ7Qy7mrRGTj1Gjx/neLw2uYtJfQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA0PR12MB7478.namprd12.prod.outlook.com (2603:10b6:806:24b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Mon, 22 Apr
 2024 12:59:54 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7472.044; Mon, 22 Apr 2024
 12:59:54 +0000
Message-ID: <bde48eef-4d8a-4cfa-b824-6de88c0f87fd@amd.com>
Date: Mon, 22 Apr 2024 14:59:36 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: Fixup bad vram size on gmc v6 and v7
To: Qiang Ma <maqianga@uniontech.com>
Cc: alexander.deucher@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, srinivasan.shanmugam@amd.com,
 Arunpravin.PaneerSelvam@amd.com, le.ma@amd.com, Felix.Kuehling@amd.com,
 mukul.joshi@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240422052608.5297-1-maqianga@uniontech.com>
 <68f02c5c-5591-4d6f-9926-b0fc6f9f6287@amd.com>
 <D94775003178862D+20240422203329.49844e71@john-PC>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <D94775003178862D+20240422203329.49844e71@john-PC>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9PR13CA0173.namprd13.prod.outlook.com
 (2603:10b6:806:28::28) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA0PR12MB7478:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cb35cd7-65a1-4eb6-601e-08dc62cc1ad2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dTN3M1I2aG1qTkJETDJwMVFjN1hiUlNuTlRRcy96MWszQzBTcWRLVVVOZTlO?=
 =?utf-8?B?ei9Ga1ZjSU4zUmkwVjNXb21jYlBJa0dKeW9GeDh2V0lTRW5za1h0cHM0bGd5?=
 =?utf-8?B?R005V2wvUjRCcUtqRk1uS1FFczh1WDB2TUtuM1VzMlNtZ0cwdWMxSFFqMGV0?=
 =?utf-8?B?YUQrZE5wOERSdUhjQ01BeTByc3F5MUNnMXBJVklsS2FlVE9WbjdObGx2Umpy?=
 =?utf-8?B?M2hDOHgwemhTZ29tWkMrcDhrdndvMTZ4VWwwWDRXM0VRb0NCNi9pYTUxQ2xW?=
 =?utf-8?B?MElPK0dLL3AvNDNVNVdFcnd3bXdsRlIyOXd4aklmb1VSMW5pNUwyV0JKZXMy?=
 =?utf-8?B?OUxxT1JUa05lSUE4SWFsayt1QUhvMmN3ZE1BYmdNQUZHdHNOY3pyRkc4ajVN?=
 =?utf-8?B?cUdKdmZrTWF1Um1Mb2xEZm9teHc0RGd0K3F5amlMdStmZXo0ZGwvYWhMOHRS?=
 =?utf-8?B?RVc0UlFRVEhvYjVpSUgrWUl3Z1BCYm9HZWt6TnROTHpKcVB5aUhXSjlZL29K?=
 =?utf-8?B?L2RoVElQSlRGUHZOZXdpaTVydTlIeVgxTjlOdXNkSFcyN1kybkl1anBWUUFh?=
 =?utf-8?B?OHpDU25EYTBkUkRKUmlLTEhOUlZyb1JrendsRXZ6NGcyVVJFV1N5TkV2b0ow?=
 =?utf-8?B?dDlDTkVGY3hQY1ZDMEMvL2Jpdkp1YlVIZldEeFVaeFkzd3hsT0R2Y0RxYWRR?=
 =?utf-8?B?Qmg0TVl5cTEzZk55RVpWWmN3RHJNZkdxNDFQUDFsUmxYOWJpeEpkRFVMa05l?=
 =?utf-8?B?aC9mWFV1S0xNZGZ6L2VzT1RtRXg2V2NYWDZrQ0tNUVNYRnZ3QUpOS1ArSzJY?=
 =?utf-8?B?cmdaOU9yZDlMNHZmQndqSGFEZHJTeGRFSHpJeDFlR2djbHFpbEZTQXBaaTFY?=
 =?utf-8?B?L21mRVlSK2I2Qk9iMHhaVVk2MHJTdjhsSUpkTUpQV3pKazQxRGVDZ2pjdFpP?=
 =?utf-8?B?U3RsOUFoWVYyaUZrUEZ3N3l6ZUxLV0hMM1dHUXVFb3VrVDJXcS9lYzZ0V1RZ?=
 =?utf-8?B?ZzA4TWF4dm5aa0xFUkJRVWJ2OEY0WGNvSEMwMitCRVRGZllzbEZVczB4eTBL?=
 =?utf-8?B?REx5YkVvZWxBcWVYdzl2cHdhWnFyY2h1aWYzY2oxRy9wN3lXRk43c3IzY1py?=
 =?utf-8?B?S3ZLditBT3B5NzEra1ZKUEl0RWV0YVI5YTdxL1hRdWl1d2N5TFV4MDU0ODhV?=
 =?utf-8?B?MTIyKzN5OXUxeEw0K2Vmbk9BckFYTmp5WTFrenZvRmVzQkZMKytvQVFhSSt4?=
 =?utf-8?B?bExkbk5qd0NXKzQwNWV2SUFhbk01TEYrQmhLTXBwelc4WEkvMEU4LzJUWVZp?=
 =?utf-8?B?cTErakFCbnFJR0Ruei91dGowdVErVXZ6RkdWMzJrNWZPV3JlcGpDa3dPTk1L?=
 =?utf-8?B?eVRiOUVLSmFCZis0VWtZZnJhNDdnckhIbDN5dTJBR1pqWTZ4d0JXWUtvTFhr?=
 =?utf-8?B?UStTZlk3a0NNd1h6QVJTeDcxYmhUS1M0QjJmREw3eWNBaFJhOUw5ZW00UlNL?=
 =?utf-8?B?dS9OS0UwY0FPbnZRMVF6ajFHZHlGdVJUNWdCWFVSMGoxMkk0cENnVjZDRUgy?=
 =?utf-8?B?dDdnOTNYUjJJNXBGUVlWUmQ4UFJ2Z0xIR3Yyd1RoV1pWWEhkWlVMYzFVNXZa?=
 =?utf-8?B?OVY5NjZ2ODdTK3lyYjFQVlM0UFFKYlk5K3NXeG5yazJUejRiSERWWVVVV0V1?=
 =?utf-8?B?YVMxenJzb2M1L3FENi9wZ3c3M0x4VUl5UFQvNXl2TVN2aFpFU2pxTit3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWxVcmF3VnNZT2VBSVZORGV1QUhXSks5Um1xMFIxT29ib3N1L1RySStsUThF?=
 =?utf-8?B?TWNiS1FKa1FTWmlraWhFNDM0WmhZU2xhYzJvcWhsR1lkUXNWNmhuWlpsS1ly?=
 =?utf-8?B?Qkk3NkRCWkxlcysvRjVVWGdqTzdPUENMbVBScE5oVTFrR3VSM0wrdUx5dGp0?=
 =?utf-8?B?Q0VkQmd4VHhOVkFRbVFmYnRsYW1VclBVTnlTUG9EdU14Y0s2Y05WSmlvS3M1?=
 =?utf-8?B?YmFML0NGZHpJRlNFL3BTV05IcDRvSkoxOUZrYVFDRFd5WjJ2Y0pjTUVLNU9m?=
 =?utf-8?B?M29uUWtnMndtMERMUnBqNVBJRFk5c1hXY0VKZWJlbjZlVnY5NXNuL2VzTCtk?=
 =?utf-8?B?OVJBVlhpMFNHQmFDNGNtVmY5bm5jeElnQ1JJMHMrVDBvY1NldFhxYjIxc1Bt?=
 =?utf-8?B?U25maFFXUVp6MkRUZzM4cDFMODN1MmpGZlpGZUVWK3YxL1U1U1Q0RTd5c3pG?=
 =?utf-8?B?Ny92RTNRSmtpNG51TWhuQ05yQVhXZU9tcm90OVRwbUdRVkZCcVVodXhZaWVv?=
 =?utf-8?B?dmRYQUtzUVprS21UOE9YUVZja0hVZnY5SE9YeU9BVk5aaWl5bEVyU3REc0pY?=
 =?utf-8?B?M2t0bE9ZUnlQRHNYVUZLQkkvQ3llTEExN1NhSVE3TjBSU3JZdnlOVmptakZx?=
 =?utf-8?B?WUFBOXdkS3k0L1JRejUrcDZXZ1YxZEN5MndkZDB0aVdJUkZmV2srOFBrZ1RY?=
 =?utf-8?B?NWMza2pYN0JPNmxLTm1QR3dhT1d4VkRzTi9xa0FZaFVxdm5CR3lHWmNBWTVZ?=
 =?utf-8?B?UXEzb29tWFFVbmhFQ0p3cGY5eitKSldCZ2l1L2NlQjc1aDgvdmlncmlmVXE3?=
 =?utf-8?B?bWpGaWwvajhXbnVpQ3ZsT21oazRtbWh1NWhGamIxTEhidXJhU2thSENCYWQ2?=
 =?utf-8?B?U29BNWNFcTJWZTFOZ0sySWs0cXdBQitUc3BhZzVTbnhKRnc0SUhNVjQzNVFQ?=
 =?utf-8?B?UmtnSTZia0YrbmdaMG84NWVWT00wNEhTK2d2bGZzajU1S3dEYW5uYU9qM0tH?=
 =?utf-8?B?bGYyS3N6VGI2ZDM0RzBWeERpRmoxNEx5MG9xdnVrOXRTbno3OWpXWEt3aGo0?=
 =?utf-8?B?TCt1bktPbEtrRVVpZzV5bFF0N1lENDFlNC9GdCswRGZMb1R3M05nNlp1OTZv?=
 =?utf-8?B?OVU0cXpTWlYxNjVzdWRsSlI3dkNCU0MwdWppQWt2TDRtVEpTdzN6UTRXam5t?=
 =?utf-8?B?Nld2K2JDWkNyWld4bmErSWIvemJUTlByZ2Zpd1VIdXg3ZVVKMnJ5MTNSTUlz?=
 =?utf-8?B?Y2FGcGNsbDJDUVB2TFZ6ODkwSFJKZUY1UWh4bDF1cm5zUzlEYXZBUjFodTFZ?=
 =?utf-8?B?Y2tOVXZ5VjJxUDBxZVQvcEp6L2NYcGxtR09VYTZRS0pxMHpJTGRoT0l0ei9l?=
 =?utf-8?B?TzBFek8wREY2RnRVNmhESlB4dmVzRG55Y2l6S2ExNmRxM0pVNjMzM1IvSTQr?=
 =?utf-8?B?LzBuQ1ArTG5RN2lST042aW5DcUVkMUVFWVJlMllvWW9LczArOFQyYzRVK2l6?=
 =?utf-8?B?K09YaXNGdWNlNGdDV2U5Z294Q1lRYmZ6Z09iUmVBcWxmaENkN3hOZkd4anZV?=
 =?utf-8?B?bTFwTTk0OXBldlVVdm9RdFltUFI1S0h1RnpCUU51SW9Pa0hFTTcvRlU0cXhr?=
 =?utf-8?B?NlFrVEk5dGJQbmhNam1idEdDUzdvTHZ2b2kxSEwrSm5zbHhrYUZPOERYdlg3?=
 =?utf-8?B?NUs4SUdZejJURGNZYkZGbzJoSFV6eEdmdjBOK1prTEJyQXBHVnlPbDZuQWht?=
 =?utf-8?B?ZzZyTEV4eTZidTJCYkF4ZFk2UzdhRDNYZ1M0SEtrMnFBTmx2aFRrb2VGV012?=
 =?utf-8?B?dFJtdEpDTTg5NnNKMGppdktwemFCVkliaDRmRUVRdlZVZndjUEx1VWhXWGoz?=
 =?utf-8?B?UkZsckQxOXR2NjJENXQwUDdOdVJLNTJ6NnNFQ3pSeGtibVBzdS90eGRVdFoy?=
 =?utf-8?B?MnpSZk1CaHRTWjJLc00zRVVNWHg2blpGNUxwNE9vdXhMT0QvMTROblQyS1Nq?=
 =?utf-8?B?eElMdGhCdVU3ZTdxaHBQZlRkS283V3FmRkNVR0FRVU9pL2diZURoRlBJZzBp?=
 =?utf-8?B?d0ZkNWZ5VGw2SlkrTzM1TlNvcDdsUTB4ZTgyZ3RvZVppRWsrVjV5ajd1Y1cz?=
 =?utf-8?Q?4Mi8=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cb35cd7-65a1-4eb6-601e-08dc62cc1ad2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2024 12:59:54.4206 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iPuy+/5XAhyCCUqu40EEp+IM/iQqRMqkJ+6BhvAiiEf+0N91B3W2rvw/C0U0VgxV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7478
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

Am 22.04.24 um 14:33 schrieb Qiang Ma:
> On Mon, 22 Apr 2024 11:40:26 +0200
> Christian König <christian.koenig@amd.com> wrote:
>
>> Am 22.04.24 um 07:26 schrieb Qiang Ma:
>>> Some boards(like Oland PRO: 0x1002:0x6613) seem to have
>>> garbage in the upper 16 bits of the vram size register,
>>> kern log as follows:
>>>
>>> [    6.000000] [drm] Detected VRAM RAM=2256537600M, BAR=256M
>>> [    6.007812] [drm] RAM width 64bits GDDR5
>>> [    6.031250] [drm] amdgpu: 2256537600M of VRAM memory ready
>>>
>>> This is obviously not true, check for this and clamp the size
>>> properly. Fixes boards reporting bogus amounts of vram,
>>> kern log as follows:
>>>
>>> [    2.789062] [drm] Probable bad vram size: 0x86800800
>>> [    2.789062] [drm] Detected VRAM RAM=2048M, BAR=256M
>>> [    2.789062] [drm] RAM width 64bits GDDR5
>>> [    2.789062] [drm] amdgpu: 2048M of VRAM memory ready
>> Well we had patches like this one here before and so far we always
>> rejected them.
>>
>> When the mmCONFIG_MEMSIZE register isn't properly initialized then
>> there is something wrong with your hardware.
>>
>> Working around that in the software driver is not going to fly.
>>
>> Regards,
>> Christian.
>>
> Hi Christian:
> I see that two patches for this issue have been merged, and the
> patches are as follows:
>
> 11544d77e397 drm/amdgpu: fixup bad vram size on gmc v8
> 0ca223b029a2 drm/radeon: fixup bad vram size on SI

Mhm, I remember that we discussed reverting those but it looks like that 
never happened. I need to ask around internally.

Question is do you see any other problems with the board? E.g. incorrect 
connector or harvesting configuration?

Regards,
Christian.

>
> Qiang Ma
>
>>> Signed-off-by: Qiang Ma <maqianga@uniontech.com>
>>> ---
>>>    drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c | 11 +++++++++--
>>>    drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c | 13 ++++++++++---
>>>    2 files changed, 19 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c index
>>> 23b478639921..3703695f7789 100644 ---
>>> a/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c +++
>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c @@ -309,8 +309,15 @@ static
>>> int gmc_v6_0_mc_init(struct amdgpu_device *adev) }
>>>    	adev->gmc.vram_width = numchan * chansize;
>>>    	/* size in MB on si */
>>> -	adev->gmc.mc_vram_size = RREG32(mmCONFIG_MEMSIZE) *
>>> 1024ULL * 1024ULL;
>>> -	adev->gmc.real_vram_size = RREG32(mmCONFIG_MEMSIZE) *
>>> 1024ULL * 1024ULL;
>>> +	tmp = RREG32(mmCONFIG_MEMSIZE);
>>> +	/* some boards may have garbage in the upper 16 bits */
>>> +	if (tmp & 0xffff0000) {
>>> +		DRM_INFO("Probable bad vram size: 0x%08x\n", tmp);
>>> +		if (tmp & 0xffff)
>>> +			tmp &= 0xffff;
>>> +	}
>>> +	adev->gmc.mc_vram_size = tmp * 1024ULL * 1024ULL;
>>> +	adev->gmc.real_vram_size = adev->gmc.mc_vram_size;
>>>    
>>>    	if (!(adev->flags & AMD_IS_APU)) {
>>>    		r = amdgpu_device_resize_fb_bar(adev);
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c index
>>> 3da7b6a2b00d..1df1fc578ff6 100644 ---
>>> a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c +++
>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c @@ -316,10 +316,10 @@
>>> static void gmc_v7_0_mc_program(struct amdgpu_device *adev) static
>>> int gmc_v7_0_mc_init(struct amdgpu_device *adev) {
>>>    	int r;
>>> +	u32 tmp;
>>>    
>>>    	adev->gmc.vram_width =
>>> amdgpu_atombios_get_vram_width(adev); if (!adev->gmc.vram_width) {
>>> -		u32 tmp;
>>>    		int chansize, numchan;
>>>    
>>>    		/* Get VRAM informations */
>>> @@ -363,8 +363,15 @@ static int gmc_v7_0_mc_init(struct
>>> amdgpu_device *adev) adev->gmc.vram_width = numchan * chansize;
>>>    	}
>>>    	/* size in MB on si */
>>> -	adev->gmc.mc_vram_size = RREG32(mmCONFIG_MEMSIZE) *
>>> 1024ULL * 1024ULL;
>>> -	adev->gmc.real_vram_size = RREG32(mmCONFIG_MEMSIZE) *
>>> 1024ULL * 1024ULL;
>>> +	tmp = RREG32(mmCONFIG_MEMSIZE);
>>> +	/* some boards may have garbage in the upper 16 bits */
>>> +	if (tmp & 0xffff0000) {
>>> +		DRM_INFO("Probable bad vram size: 0x%08x\n", tmp);
>>> +		if (tmp & 0xffff)
>>> +			tmp &= 0xffff;
>>> +	}
>>> +	adev->gmc.mc_vram_size = tmp * 1024ULL * 1024ULL;
>>> +	adev->gmc.real_vram_size = adev->gmc.mc_vram_size;
>>>    
>>>    	if (!(adev->flags & AMD_IS_APU)) {
>>>    		r = amdgpu_device_resize_fb_bar(adev);
>>


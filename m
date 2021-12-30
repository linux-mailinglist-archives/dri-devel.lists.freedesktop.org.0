Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B3B481F4F
	for <lists+dri-devel@lfdr.de>; Thu, 30 Dec 2021 19:45:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C035810E8B2;
	Thu, 30 Dec 2021 18:45:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061.outbound.protection.outlook.com [40.107.92.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2384310E8AD;
 Thu, 30 Dec 2021 18:45:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gW3hR93WP2q+4ddL1Cy1BPGCyakV0+mBpaa+urFhDge0PsbFE5trJc2bnbzG3T7gijr2mdvaGzNf7hr6Pg1M2LZUVMH3LRSlQmEb6HCj1f2G8Ugp8EpdeOCE2UXqYeR2CI9acrzV9O997xnt359Wn0PWaHrdUn64JLJDlfAZGMOSDcmWQMGOJanA1QhYJu2yLaPdJ7CuOubbhHf1U9Mjz/8MdQgjoxpgNEp1H2oHrEcyPKrGY254V3G9lCjeFtsiJIEqs0VmRUiqCMYbYGtY8OSPytWB9GeqFhRsgPbIlxO+2Bsf7XSSUWn3quQExaQam+4dtgjSy20CuUwMqEy5tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qOt1kfBhMLKjRLFoLfdtyBfO1dU5khZT8u9BU/APQx4=;
 b=NSigwKF8oj6TMWd9SfjhgigrjFizPgMPkAmy7o5Tz1dV66UUpFwxm24ioFBnOt7maI3teu/lBSdPEhZAd+fnHwFkEwdQEpHj20xbqkZU/K6+4HYvriXNA4Zo/ZhyIv+IDq7wKNGqRiv8W1hZ/ZJj/9wIGWANl0V7pxGHzZJHQbkwoApK9U8axFzaHXE+c/+4Oi3EISxdD0LEetV4jidOXK9JJ4RTD8dKIieL9SGugGvG2WRlQB2ouQX/O531R6RBgI1gVnajrFeTl+p+gjNLlYDwSBPTHrnbWxZoUFubRoROvZ8n+Qx78Gt+S0x0wb2YiUVUA2kUBGNKvljwh8qp7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qOt1kfBhMLKjRLFoLfdtyBfO1dU5khZT8u9BU/APQx4=;
 b=nqI38z51t17wMKRwwrlyiSLr95klOHRDhRyXY8C8k2flXQyfhTmgGDw/49Mjjs4gO/K5QuG9ZOfG4MWyE9LuGxbvxcnVkm7OscYLTWJM1qUIYudo+PrnG/qaqdQmBZHX2bDQYnQrgPONpb9ABnoUnvyqBWIN83w6QGsbVa6foFk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by DM5PR12MB1945.namprd12.prod.outlook.com (2603:10b6:3:10f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.21; Thu, 30 Dec
 2021 18:45:07 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::5573:3d0a:9cfd:f13c]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::5573:3d0a:9cfd:f13c%7]) with mapi id 15.20.4823.024; Thu, 30 Dec 2021
 18:45:07 +0000
Subject: Re: [RFC v2 8/8] drm/amd/virt: Drop concurrent GPU reset protection
 for SRIOV
To: JingWen Chen <jingwech@amd.com>, "Deng, Emily" <Emily.Deng@amd.com>,
 "Liu, Monk" <Monk.Liu@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "Chen, Horace" <Horace.Chen@amd.com>, "Chen, JingWen" <JingWen.Chen2@amd.com>
References: <20211222220506.789133-1-andrey.grodzovsky@amd.com>
 <20211222221400.790842-1-andrey.grodzovsky@amd.com>
 <20211222221400.790842-4-andrey.grodzovsky@amd.com>
 <9125ac3a-e578-6b34-1533-7622ec0274f1@amd.com>
 <BL1PR12MB5269AE1B82F1D07433B95B59847E9@BL1PR12MB5269.namprd12.prod.outlook.com>
 <PH0PR12MB5417F12B403B8181D5CD03988F7F9@PH0PR12MB5417.namprd12.prod.outlook.com>
 <cc8e296d-360d-9a2f-85cd-f47d55581e99@amd.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <f5ba0a69-1cae-7d8b-bfe7-4e4400e9c32a@amd.com>
Date: Thu, 30 Dec 2021 13:45:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <cc8e296d-360d-9a2f-85cd-f47d55581e99@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YTXPR0101CA0066.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::43) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c4179271-fae8-4f5a-4f03-08d9cbc47fec
X-MS-TrafficTypeDiagnostic: DM5PR12MB1945:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB1945F0F7FE31F4FDEDA01016EA459@DM5PR12MB1945.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EVbMv4fAY+ESf/ribvFMy9tyFJTp1IawN3sGWZL5HPfAw1dsVzQdE+V08Rj1PlgF9Jzd8zzuO/0GarEhgWrchmXDxw/AWW25AjBLfIpDO0Qrr0G2smUJ0qz35l6zwv16pu/CNSEiFp2K3QqNf9uKMRjUZ19c/6hiikhHFtnFHGZD/q09xY1yk+lyIYLTYBeJRqTkL1Wb1AM8bp0Fn8rl75ppaHo9EH7MiShnty3VsxMCxfwOL0j0VQk7ahgFXaP9N9QQlMH5nosx0EqexbOczweGAc0p2/1dlw0fY9tkzW2l2PNEfbsTuuMwVpUYxIIDcnxetV0Tyo59/UVZdYGdZGpnZivFNvbaUY6k4zY4IwJyl5Z03vPI7NV68xK5ihXgWmShSWd6XmYauChpUSR1QpOL0LjJ3UlF0dQj2gF4vYCxJ0R8yV+jIxXo9qL3Wg0xtK1Ysc3sZwPd+Q8wXxKZ5rNbEPTIVBKboTMvIpFwQjyeUj3y6C+N/9r+aS7/uVvPw+/Mts+0cAG4C9vKaMzAThq369SwfhlMNaauV4h+jwezYVq/sNGLmBQwcRQIWCW/DaC7228Pmdznpdbl3Ei//plYe6hlooYPQ76FboNd3UPuG9IGw+2rTW+b6132VzvM66Haw/2LykoYhbfxVklAdALMovwkx92CY4cHmPvro1cnQmnpunfdBuL9qnhaSpRvfKOh+dxE9mpwpMAabp0UqozhhIj36lKK0zEDlH5HogRx+dEO0L8j1/DiBNWMmKsM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(2906002)(921005)(6666004)(36756003)(6486002)(31686004)(110136005)(86362001)(186003)(8936002)(31696002)(6512007)(2616005)(5660300002)(66946007)(4001150100001)(53546011)(4326008)(6506007)(6636002)(8676002)(83380400001)(66556008)(508600001)(66476007)(38100700002)(44832011)(66574015)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGRZSVNiU3ZuT0N1TVFrSUVHbGxkbmZTRjlZSk4rYXA0UFdRK3ZuN1JTUkNO?=
 =?utf-8?B?bGtaYy9EdlFIWHlvTDdjQ2xDSTlYd3UxUFBnVWtITWVabDlySHRMRERaUE5L?=
 =?utf-8?B?Y1FrTko0QUYzUDFRd0QwSHR2b0M1a2lySG5QdE91YndrVTFyZ2N4L0xLNExH?=
 =?utf-8?B?Y1VNeldEYSttclRhTEdGelJwR1YxL084Vm5JZWJVNWlhR0hHdUxQMjUzVXVL?=
 =?utf-8?B?SFliUTZSTXlOK2NSTXpKZy95WHN4QnhrSFZpd0dpYnMvMjMrRHQwZDJDMmtG?=
 =?utf-8?B?YSs1ZnpyTWtUUzAwYzJpUmVJTlVRTzlicUl1REVJS1hjMzVTUno0R3ErbTdr?=
 =?utf-8?B?NzVxL2V2Si9MQmViU3kySzFtd0FFMERTMnZEeWxDUXpsUHJjeGFCamdKZ3BF?=
 =?utf-8?B?SFZ4TVpYWDZXbG9NaVRxdEh5K2pyY1NoSm5lMnRVMWlTa3Z2WXNxMG5RSXJK?=
 =?utf-8?B?ZmZzdXVuRmdjM2hXK2RTSmlTQ1B0a3JIeTNJVFVIcktRTXdVazg3NGx5eHdE?=
 =?utf-8?B?RnA1OG54c0ZmY1BuS25EYXZtempzZGZEc09uUUJsUFdBZ0REYmUxYnVTdHFB?=
 =?utf-8?B?UE5DUlgzdmJ1SVd2VDIwNURUYm5RQ2RFY1JjeTJTdFhocHNPYmJUMWN0UDEy?=
 =?utf-8?B?T0hMYlJBWFF1R0swK2R2RENXbThJWmo0WFQ2L2c0UXN3ZDBmV2NOekZZTGJj?=
 =?utf-8?B?VTlLa0lHc2RuYnRUT29rUWJvb3VqbUlqRG9QT2V3SzgzRjFTRGJGeGw5cU1L?=
 =?utf-8?B?YkxLQVc3bHNZQldCLzliWjU2RkY3NXlVeW42OVl2dDJ5aEZ3LzVHU01pUW9Z?=
 =?utf-8?B?WDEweDlUdUoyREpPeHkxbjg4WStqUFZuV2ZuRmRqWHNZS2JlRmVUOXZJSlhT?=
 =?utf-8?B?S3M1ZDJzbTlpc0wrUnRIZWNySW51OEkrdFljanhHMkh6RWVqazRwTXJ1VnZ2?=
 =?utf-8?B?bjZDeUJQVUF1c3pBUTg4NW44ZEw3ckh5RTBQbXh1NlBHYU5JTGpiTTZ1MStz?=
 =?utf-8?B?SU5KZmlKSVRUcFYyS2lqTmNteDN4MmdFNDRZR1R6eGYwMGpZR0NVbUtpQTlv?=
 =?utf-8?B?dWFLQStVZzRvVG1sZVlvL213bkdUSFJyS3hCOFUzT204azlKZnFualR3U1NB?=
 =?utf-8?B?ek9SU0pMU05MdXdZZnFXYURTZ1VxWlc4WWdJZkpkeTlmbXo2YktBRXY2VTJl?=
 =?utf-8?B?V1hWK1lydWQ1WVJ4Wk1KRGpCOU9BMENwZVZsV0ZIcEoxVElrV1VZWlRzdXVh?=
 =?utf-8?B?TzdXdFBHQVNTeWs5R2UzdllVcVF3Yi96N3N4bzgzTXJtbU1mSXpBL2JHdDgx?=
 =?utf-8?B?OFJPTTJhKzhkTEdzY1RVYmxFaHd4bHEyRXJVOGVYK0VmSmw4Vjhzc0lwMkpv?=
 =?utf-8?B?Tmg5TEdHY3dMNHVGVjBldWZEcVNmWXp6cld2QWk0Y1NGSTNkWndWUk5zbHpN?=
 =?utf-8?B?Y1VidzZzUHAzODdNcDBaQjcvamFHWVJucUpPWjRyd0hOZVAxTnFPeVMrdkxR?=
 =?utf-8?B?Sk1aSGJGVWxVcEE5T290TXdlUVdyWmd6d09FanErbjJzV0NqenNKUjVITmVh?=
 =?utf-8?B?MlphdnlTTVRDa1llcHdZMy80cHdnS3A2UngwTlhQekZoSFcrdXAzbDdldnRI?=
 =?utf-8?B?MEQwYVdOVnhTcnpPTGF2dGN0d2dRYmhMOE1odERCUHFHb0RGdlE0U3dUU0hG?=
 =?utf-8?B?VTlRTTdveXV2OEFwQWlnK0IwMFNUSGlDekFtQmt1WGJlS29IYnVUZXVsVGU4?=
 =?utf-8?B?emEyOWhkSTdnVENDeXMzeEtxdGN5bjNHQlpjS1lFaGtnVy9pTUlQdUpmemVL?=
 =?utf-8?B?eHBVRG5ma0p1SjREd2hVZWt0K3AwQ3NpSTRMNjhTWnVod3Z0NVdUWGNURis3?=
 =?utf-8?B?SjlNZ0sreEFmV0prL0paZFpYdzJVcmZhTHBqcTlRWWJTRE5vN0szRHFzTEdk?=
 =?utf-8?B?MUpUZCtRWG5zZzBmdUVxZzY3Yzc1S0ZCSEVYSEw5VHE1eGpsS25ScUM5M2I1?=
 =?utf-8?B?eWVSUGlnRjhLZ01mQ1FiNWIwVDJhV05ybmhpM1hVN2hLbFdWSjA1d1NQQjJz?=
 =?utf-8?B?WmVmYTdHUUpFN2NHKy9uVkVacW9NS2p3ZGhyS2hoL3FsdCs2YjROYXFmU1Ar?=
 =?utf-8?B?Y0dObDZ1dGlocVRlTEtVZmd5SGlxT2hDRmxNcmpVckVEM1NCeHk1Z1lkS3J3?=
 =?utf-8?B?K3BndnZvaGpBQ1dSQmQ3Qy9vODlORDlGOG5hTXZuY1RqTXk3TFlZaTFsdmEv?=
 =?utf-8?Q?TXA08go+83jqS7nyG4kE+A5qH4iiZ1rkZB0TjOE9Y8=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4179271-fae8-4f5a-4f03-08d9cbc47fec
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2021 18:45:07.1888 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZVRHlq9C8YODPx09FzF8nNxuuRoligHmkxXVsJpap5elJ2K1FJvuFnQfVJnJ76L+KseibRrRAhg6zQ2tNQ790g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1945
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

Sure, I guess i can drop this patch then.

Andrey

On 2021-12-24 4:57 a.m., JingWen Chen wrote:
> I do agree with shaoyun, if the host find the gpu engine hangs first, and do the flr, guest side thread may not know this and still try to access HW(e.g. kfd is using a lot of amdgpu_in_reset and reset_sem to identify the reset status). And this may lead to very bad result.
>
> On 2021/12/24 下午4:58, Deng, Emily wrote:
>> These patches look good to me. JingWen will pull these patches and do some basic TDR test on sriov environment, and give feedback.
>>
>> Best wishes
>> Emily Deng
>>
>>
>>
>>> -----Original Message-----
>>> From: Liu, Monk <Monk.Liu@amd.com>
>>> Sent: Thursday, December 23, 2021 6:14 PM
>>> To: Koenig, Christian <Christian.Koenig@amd.com>; Grodzovsky, Andrey
>>> <Andrey.Grodzovsky@amd.com>; dri-devel@lists.freedesktop.org; amd-
>>> gfx@lists.freedesktop.org; Chen, Horace <Horace.Chen@amd.com>; Chen,
>>> JingWen <JingWen.Chen2@amd.com>; Deng, Emily <Emily.Deng@amd.com>
>>> Cc: daniel@ffwll.ch
>>> Subject: RE: [RFC v2 8/8] drm/amd/virt: Drop concurrent GPU reset protection
>>> for SRIOV
>>>
>>> [AMD Official Use Only]
>>>
>>> @Chen, Horace @Chen, JingWen @Deng, Emily
>>>
>>> Please take a review on Andrey's patch
>>>
>>> Thanks
>>> -------------------------------------------------------------------
>>> Monk Liu | Cloud GPU & Virtualization Solution | AMD
>>> -------------------------------------------------------------------
>>> we are hiring software manager for CVS core team
>>> -------------------------------------------------------------------
>>>
>>> -----Original Message-----
>>> From: Koenig, Christian <Christian.Koenig@amd.com>
>>> Sent: Thursday, December 23, 2021 4:42 PM
>>> To: Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>; dri-
>>> devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org
>>> Cc: daniel@ffwll.ch; Liu, Monk <Monk.Liu@amd.com>; Chen, Horace
>>> <Horace.Chen@amd.com>
>>> Subject: Re: [RFC v2 8/8] drm/amd/virt: Drop concurrent GPU reset protection
>>> for SRIOV
>>>
>>> Am 22.12.21 um 23:14 schrieb Andrey Grodzovsky:
>>>> Since now flr work is serialized against  GPU resets there is no need
>>>> for this.
>>>>
>>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>> Acked-by: Christian König <christian.koenig@amd.com>
>>>
>>>> ---
>>>>    drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c | 11 -----------
>>>>    drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c | 11 -----------
>>>>    2 files changed, 22 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
>>>> b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
>>>> index 487cd654b69e..7d59a66e3988 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
>>>> @@ -248,15 +248,7 @@ static void xgpu_ai_mailbox_flr_work(struct
>>> work_struct *work)
>>>>    	struct amdgpu_device *adev = container_of(virt, struct
>>> amdgpu_device, virt);
>>>>    	int timeout = AI_MAILBOX_POLL_FLR_TIMEDOUT;
>>>>
>>>> -	/* block amdgpu_gpu_recover till msg FLR COMPLETE received,
>>>> -	 * otherwise the mailbox msg will be ruined/reseted by
>>>> -	 * the VF FLR.
>>>> -	 */
>>>> -	if (!down_write_trylock(&adev->reset_sem))
>>>> -		return;
>>>> -
>>>>    	amdgpu_virt_fini_data_exchange(adev);
>>>> -	atomic_set(&adev->in_gpu_reset, 1);
>>>>
>>>>    	xgpu_ai_mailbox_trans_msg(adev, IDH_READY_TO_RESET, 0, 0, 0);
>>>>
>>>> @@ -269,9 +261,6 @@ static void xgpu_ai_mailbox_flr_work(struct
>>> work_struct *work)
>>>>    	} while (timeout > 1);
>>>>
>>>>    flr_done:
>>>> -	atomic_set(&adev->in_gpu_reset, 0);
>>>> -	up_write(&adev->reset_sem);
>>>> -
>>>>    	/* Trigger recovery for world switch failure if no TDR */
>>>>    	if (amdgpu_device_should_recover_gpu(adev)
>>>>    		&& (!amdgpu_device_has_job_running(adev) || diff --git
>>>> a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
>>>> b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
>>>> index e3869067a31d..f82c066c8e8d 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
>>>> @@ -277,15 +277,7 @@ static void xgpu_nv_mailbox_flr_work(struct
>>> work_struct *work)
>>>>    	struct amdgpu_device *adev = container_of(virt, struct
>>> amdgpu_device, virt);
>>>>    	int timeout = NV_MAILBOX_POLL_FLR_TIMEDOUT;
>>>>
>>>> -	/* block amdgpu_gpu_recover till msg FLR COMPLETE received,
>>>> -	 * otherwise the mailbox msg will be ruined/reseted by
>>>> -	 * the VF FLR.
>>>> -	 */
>>>> -	if (!down_write_trylock(&adev->reset_sem))
>>>> -		return;
>>>> -
>>>>    	amdgpu_virt_fini_data_exchange(adev);
>>>> -	atomic_set(&adev->in_gpu_reset, 1);
>>>>
>>>>    	xgpu_nv_mailbox_trans_msg(adev, IDH_READY_TO_RESET, 0, 0, 0);
>>>>
>>>> @@ -298,9 +290,6 @@ static void xgpu_nv_mailbox_flr_work(struct
>>> work_struct *work)
>>>>    	} while (timeout > 1);
>>>>
>>>>    flr_done:
>>>> -	atomic_set(&adev->in_gpu_reset, 0);
>>>> -	up_write(&adev->reset_sem);
>>>> -
>>>>    	/* Trigger recovery for world switch failure if no TDR */
>>>>    	if (amdgpu_device_should_recover_gpu(adev)
>>>>    		&& (!amdgpu_device_has_job_running(adev) ||

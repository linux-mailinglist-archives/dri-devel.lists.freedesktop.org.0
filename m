Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 153697A0F6B
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 23:04:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCE7A10E586;
	Thu, 14 Sep 2023 21:04:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2068.outbound.protection.outlook.com [40.107.223.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EB8F10E586;
 Thu, 14 Sep 2023 21:04:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EJV/lFRHDjetRX1fv2Oc5h2hEQj8SBkpkgIROioEKqkjwIYm5ihxMXa78x/LFd/7hKD2Jg/WQjnu1O8FMd6+PMmImkLY/ILAb3O3CgEZ0jULMuBUNl+A51SsGwtXKoOsEgQHH8VZ61t2LDwsAONaBYSwyOvqXjxHXaxO0hJe4/0J2tBn8kEWbZ4xUr8k4ussc3nV6T3ZXw3pw2eE0S2KFMZNfKLeKmy/wZNEs5NjOea2SlxiIWL3PszHH/tIZ5led6nYxkzUxZyLkT+C/8OFh1OkEWjuVjHXlFirZkJSPjNQeFFjcxC2lGo9m40Xy1Ap3duyvlU76z6XGL6PhJuIjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gQiaT2cL+mY4v3QsOnP2GHhIR4Hwbh4zC7IUcJ2MNss=;
 b=fJlPplry6dbNejdufzwV0vD7EXPXicXS8DdHZAtTp+zmqtcWH/I+qV5580RHnVzx7mixL4i5svsSYKF9lXcHt6/+jRACN3KnnQ+tq7+zPL8uXpOcUXfygito2lifFZ5CGsgBOVHz7oUSe/0ETISiEnChnwOYADiinwjQ4CRRHdPGmkDQUzVHwZNMsW577We4NsV0dmjdAJ4NbAahfR47JwsYRVEDxf09+pZAE9+nlwuSpZiwRTjZAuhhN9HAnOhiCW2XnzAQq/W2PmMigjGpK7xv18KBBrGZpu0Vlmjz4LDH/TeV9J922UmcVQTyN9DO+qJn2ByS8mGhSuI+U88o0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gQiaT2cL+mY4v3QsOnP2GHhIR4Hwbh4zC7IUcJ2MNss=;
 b=GjIzbB6QTAc/Y7Luo6+L+OW2q7OvFGDYZie6GzM8t7rBg5SeGuoYe15OIfEzOZ40SXGIIu/bE4XuFtQZoBsL++lIR/P6uwp08sUR7IF8VEt3IjNhAZ2OYjLVH9mwodltK9vC8cEy/Y9f0lMyrFi6mmygaEX4IhY0zQMtHrwTWOI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6270.namprd12.prod.outlook.com (2603:10b6:208:3c2::20)
 by BN9PR12MB5129.namprd12.prod.outlook.com (2603:10b6:408:136::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.19; Thu, 14 Sep
 2023 21:04:22 +0000
Received: from MN0PR12MB6270.namprd12.prod.outlook.com
 ([fe80::dfbb:d644:5eda:83f8]) by MN0PR12MB6270.namprd12.prod.outlook.com
 ([fe80::dfbb:d644:5eda:83f8%4]) with mapi id 15.20.6768.029; Thu, 14 Sep 2023
 21:04:22 +0000
Message-ID: <290648a9-4882-4228-bdbd-1045e20b71f7@amd.com>
Date: Thu, 14 Sep 2023 17:04:18 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: fix the ability to use lower resolution
 modes on eDP
To: Harry Wentland <harry.wentland@amd.com>, amd-gfx@lists.freedesktop.org
References: <20230914175354.102709-1-hamza.mahfooz@amd.com>
 <3630bc42-c04c-4c22-99f2-5dc6bd5d8e2f@amd.com>
Content-Language: en-US
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <3630bc42-c04c-4c22-99f2-5dc6bd5d8e2f@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQXP288CA0020.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c00:41::49) To MN0PR12MB6270.namprd12.prod.outlook.com
 (2603:10b6:208:3c2::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6270:EE_|BN9PR12MB5129:EE_
X-MS-Office365-Filtering-Correlation-Id: b357ab35-cf29-45e5-954c-08dbb5662b08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0IPNRAGOzkwDmrypjXPQM4pToLlSY8mGNq8eeBHMDX4wqfO4cMb6ow9U0CWsoiKoTX43Lid01TwlXdVmUsMtSiGpyUqupiD09RNiY/czwffL3Wcf/C+6nSy32NV7VB/tYKOyNoIxTWutbSYFiYkxrE97Nyf3aeit36pJVwj3hEt+UnAcGhKciw7Etjd8DaKq8GKdmtUP+NvvhvrKwvY3Ilxj8KREPU04hNNW13OafAjxDTME4i712vBiJ6bDn8VY1wj35H6H/UpIZrok/UVjgwoo1IReN1hujBT02DDwy+fiZeYM8g+Lo/i8AoEsm74YGN7quERRMIEGHVgzNIwo7hpk/XaxXvwEVaiVjgemzhr07RUJWrhxXsvsEEWUGpfCSKUofbX/3HhfSTmSJbTIrGoIczs3EdOGQd82fMa2hlfbJC5XUXXQkddzT7EfUb3MLiEjpwJc8IuHZuNJgZDwWlkNyu2zHoqpDZ1iF+Y+zI5wD9ppoU6UzfEEkf0ASHkF6QRIl7g8C+D8sXrC/BWxdBvevHIchmZzRtgT8b4b43OGoLlJjEeKPQnZyjTEyNwxfDyeoAmhx32OTPB6yHr6OPiRw1C60xZti/WYJzIBVhb5HO+X63ht2zPZKlsgdnkJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6270.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(376002)(346002)(366004)(396003)(1800799009)(451199024)(186009)(31686004)(6506007)(6486002)(6666004)(53546011)(478600001)(86362001)(36756003)(31696002)(966005)(38100700002)(83380400001)(2906002)(44832011)(2616005)(6512007)(26005)(4326008)(5660300002)(8676002)(41300700001)(8936002)(66556008)(316002)(66946007)(66476007)(54906003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZDNRdzJYbzZVNkZmb2lNbFpQeFVYRkNtS3BCTWgxSU1aMmZIRFJRKzVaakNp?=
 =?utf-8?B?OHBtQ2pEZ2JWbFFUdjA2eThrcG5ORUxnSFBzUnNKTGNVQi93TG50MzZxOXBQ?=
 =?utf-8?B?ZElwdGt5QkNWN01jSlNETVZHK2pQbnZrU2pvcmp4RGtJalZKeU02bUxjemwr?=
 =?utf-8?B?c1FmYm5uRWVQeEk5Nk81Y0JVa09raDd3RGtmRXJuOC93dEY4cWJkV0tGenF6?=
 =?utf-8?B?bmJacGRJRWhnKzlaS0FPQkdaaVM5RU1pVVBjSjJaTllQVUVLVFRxMTdxSzFR?=
 =?utf-8?B?OW0rQzhQYUMzYUMvMVdDQjlSczBmMXllY0kxN3NuMElzZXV4NnFnaTdqNjNY?=
 =?utf-8?B?ZXNGV1B5RTllY0VuK2lldWZkaTNEUnFNMjgzckVsWlNBVEpPR054dFhkclpQ?=
 =?utf-8?B?NjBsdE13R0lNZ0x6R0U2cnFPMHFUaUtZWGdmeHdzOWhlWC9LaHZuQ054eXdv?=
 =?utf-8?B?V3NaelRhNitYZitvRldndktFYXNVVER2ZVVEOTNyS0xhNVdaMEVJdlovdVk4?=
 =?utf-8?B?Tkg2eWx6cjMwNWExcUN2VUp3R3VzaHYvRUNFdzF6dXJUMTdpREtPZzZrVVdy?=
 =?utf-8?B?NTM4eWxZY2JsWUhKNXVLRkhsaThidWNIK1VJU1pDZmJyQkRzdUxFRU8yei83?=
 =?utf-8?B?Vzc5R3cyd1VPck1TbnZjYU1yYWx1cUs1UDV3cDF4SmFHbTdyTFVRZExTbFB5?=
 =?utf-8?B?bytwNkU5OG04aWRJSHhuSzcrSmx5Q3Q4RzdXejV0SkJETTBZVVBUTmsxWll3?=
 =?utf-8?B?dE5uNmZ2NC8reWZWeis1L2FRaGM4b3lXbThSR0hLSXIxUG10WTFhbEt0UmNO?=
 =?utf-8?B?bkh6Ylc3VTdWNk1pMkN0VGhUR3VrNnVwR0M2T1BSekFaUUl2ZU9oMU5xUXNq?=
 =?utf-8?B?SUlmLy9DbUxMbHBYbDhBTHVPU0FJQThYbElNOTN0NDBtMUhqUFE3N0xzSmMx?=
 =?utf-8?B?THl5bFNvWUFHVGJwM1FtKzhGVFY1cEtVZVcrc2RnTG1VOWFENVNGazRkV1px?=
 =?utf-8?B?aDFRcDlXcjJCTDFnT3NXWWwwV1Q2UGR3b05HSmhHVWgyMEVCNktFTjN6QWhm?=
 =?utf-8?B?U0JYQTlXZ1E2cElZa2pITkgrNEt2cmc3VFozb1puQUlpSEdJRTZ3c1VyMWFr?=
 =?utf-8?B?M2wxZzlTNWx4MjR6bmNOWGsrZWF2UVFxalB0SE1XaHhJV1p2a3l1TUxadGcz?=
 =?utf-8?B?Q21idXV0SHVKblQrR0dMblhIbXlibDQwZXd4b3BEQWRSZ1NUT3FhODBzMGtR?=
 =?utf-8?B?UEsybEIrZUhPa0FOSmwyOXV1UGRJZVJCRkFpVXp2RlVUUjVscmZqNjJMb0py?=
 =?utf-8?B?MVVUQjJzT1JBM01xR09UTC9CdVdQdGNPNTczVzV4RVNBdWVpQmx2T3BGNmVj?=
 =?utf-8?B?eUFqa3ZhOWtxZlQyTUpQUktxVEFMc0hiS083Q3pKTkdRclVQR0Y2MkxLOVR0?=
 =?utf-8?B?djJLaTBtS0hWZythYXZSbkp2MDRHWGdnMzVoakNzanVzd2hzZnFjWVM2UFVJ?=
 =?utf-8?B?bHJkeXloTzRXZ0hOMTg3djVyTUEwclhoTCtLUTVUQTV0ZXJ0bTVXRkxINGJG?=
 =?utf-8?B?MUVaOU5ZZmdnMVdHc1MxUXpTWXFMczhpLzFGZS9sNW5sOVNPZzN2Vk9mODRz?=
 =?utf-8?B?ZjJGNTVBL2wyY3AwMVk4ZjhsaldYQ0gvMWM2dVdqMldHTTdWc3NhY1JNYk5Q?=
 =?utf-8?B?L1ZoTVp5WnIyZ1dGOW1PZGg3alRlN3ZQcFlYbitwangrU2I4WW44bHNpUEFa?=
 =?utf-8?B?djdwRXF3T3k3MFgxOVZtRkxFS1E1Z1pkTVhEQmw2UllhcUxZNkQvaFp4L2lD?=
 =?utf-8?B?b0lZblYxa0d3V3BDUEQ5MFZsdm1ISEpQUFpKNk1zYXliSlJudGVKUG11YUx4?=
 =?utf-8?B?MTZkcGprVWpuUjAva2krVEpOaWRleG1JcHhudDJkcXNCTjErL1QrMzdYUGw4?=
 =?utf-8?B?SjhUekJ5b1JCbGVBczFwVGhtMTVNSTJFVHBPYzVsR1RVbkltVHkwSFVBOThP?=
 =?utf-8?B?RWtjaTB6bXRIN20yNDgyMVBaQms4WHMwUTdjZDZjdFFWOXVlLysvbWp5Z0h5?=
 =?utf-8?B?THpySjc2UFFVSVZ2U3VvUUVsUjB3VlBaRDlGTWZwa0FIMUVQdFVhc2NSZXdp?=
 =?utf-8?Q?lQKI6KZg6go+3QHVQeDnpNuDN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b357ab35-cf29-45e5-954c-08dbb5662b08
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6270.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2023 21:04:21.8436 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qIcoPyBmw6EXsECzzXu1ekpMw71wNla6PPqzZVWO/h77oOKMHsdhY9rEp0KPIbv9ZW8fbNGLzy22gwwWfkeRpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5129
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
Cc: Stylon Wang <stylon.wang@amd.com>, Alan Liu <haoping.liu@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Qingqing Zhuo <Qingqing.Zhuo@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Hersen Wu <hersenxs.wu@amd.com>,
 dri-devel@lists.freedesktop.org, Wayne Lin <wayne.lin@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 9/14/23 16:40, Harry Wentland wrote:
> On 2023-09-14 13:53, Hamza Mahfooz wrote:
>> On eDP we can receive invalid modes from dm_update_crtc_state() for
>> entirely new streams for which drm_mode_set_crtcinfo() shouldn't be
>> called on. So, instead of calling drm_mode_set_crtcinfo() from within
>> create_stream_for_sink() we can instead call it from
>> amdgpu_dm_connector_mode_valid(). Since, we are guaranteed to only call
>> drm_mode_set_crtcinfo() for valid modes from that function (invalid
>> modes are rejected by that callback) and that is the only user
>> of create_validate_stream_for_sink() that we need to call
>> drm_mode_set_crtcinfo() for (as before commit cb841d27b876
>> ("drm/amd/display: Always pass connector_state to stream validation"),
>> that is the only place where create_validate_stream_for_sink()'s
>> dm_state was NULL).
>>
> 
> I don't seem to see how a NULL dm_state in
> create_validate_stream_for_sink() (or create_stream_for_sink() for that
> matter) has an impact on the drm_mode_set_crtcinfo() call. That one depends
> on !old_stream and &mode.

If we look back to commit 4a2df0d1f28e ("drm/amd/display: Fixed
non-native modes not lighting up") it seems like the intent was to only
have drm_mode_set_crtcinfo() called for
amdgpu_dm_connector_mode_valid(). Since, even if we go that far back
create_stream_for_sink()'s dm_state was only NULL when it was called
from amdgpu_dm_connector_mode_valid().

> 
> It does look like &mode is an empty mode if we can't find a preferred_mode,
> though. Not sure if that can cause an issue.

I don't think it should be an issue, since before commit 4a2df0d1f28e
("drm/amd/display: Fixed non-native modes not lighting up") we always
called drm_mode_set_crtcinfo() in the aforementioned case (and only for 
that case).

> 
> Harry
> 
>> Cc: stable@vger.kernel.org
>> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2693
>> Fixes: cb841d27b876 ("drm/amd/display: Always pass connector_state to stream validation")
>> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
>> ---
>>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> index 933c9b5d5252..beef4fef7338 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> @@ -6128,8 +6128,6 @@ create_stream_for_sink(struct amdgpu_dm_connector *aconnector,
>>   
>>   	if (recalculate_timing)
>>   		drm_mode_set_crtcinfo(&saved_mode, 0);
>> -	else if (!old_stream)
>> -		drm_mode_set_crtcinfo(&mode, 0);
>>   
>>   	/*
>>   	 * If scaling is enabled and refresh rate didn't change
>> @@ -6691,6 +6689,8 @@ enum drm_mode_status amdgpu_dm_connector_mode_valid(struct drm_connector *connec
>>   		goto fail;
>>   	}
>>   
>> +	drm_mode_set_crtcinfo(mode, 0);
>> +
>>   	stream = create_validate_stream_for_sink(aconnector, mode,
>>   						 to_dm_connector_state(connector->state),
>>   						 NULL);
> 
-- 
Hamza


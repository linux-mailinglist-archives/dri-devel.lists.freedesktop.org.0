Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7AD79F279
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 21:57:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7894289F49;
	Wed, 13 Sep 2023 19:57:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2054.outbound.protection.outlook.com [40.107.244.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ED2E89F49;
 Wed, 13 Sep 2023 19:57:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZvygFFc7+89h6Y5Mae5DephDZukP7hVu4riTLOA6DGetgJH/kG0RUxID4d+BAu5D8HAI12mzqeiorrkCr/vX+eFVk3nyNW0RGl791ETkt8sSEvuh/SO0ZMR7xmSe6nikXqZWQ6QMiJC3SIOBS4phepYruu9Ew+lv7+OgY4gC78bSMh1I8TFqsZz2/OUsMeTqeezJfRfXA+uwgqN438Qtxwupw5q8UrzO0V6j8qZNksr/6VDOavntQYPeMl9XJhJXPjZuW1JSvqeL9eec3B6tKlijJgbiKnMoFGVF+ScwNw9mebZgb6WD++hSUT8UmO2ctdZENDl4jkG4zSgn+IP/Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OuAhs/w6TdwUmQ9nJOTt3iLGG6oeRmxxAq9qeaAWZl8=;
 b=fMnU7Ng/vxlxAgvLeBIJCAv+2kgh32asrHy3O6UJwlhVhdJZS7Q8NGeqcgfA4fWOJ/y1OV21AkBfWHn1x5vVtioPHQPLWUs3UkF9W5qKttR2sKlRwM7MSHBb7SWbcIbc5AKLxZjZsYmxXdHg4bDpZnadIInDKYCfpLDmh3uMoG7qWs3LKK+jalqOAeM6N+I/Q/EDUpJuRocqsYfYXIxxVBnbBDK/KZUgu5ENe35qgo+YC1hANsSOwachrQGiF3uZ7TnPr5S43AxvadotGfa/iOLGaWT7mVsnCUOGuzi8VwEB3HujeLIQuDxexA6/FT22MVUmgYR7Gj7NpcsZ3fo2nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OuAhs/w6TdwUmQ9nJOTt3iLGG6oeRmxxAq9qeaAWZl8=;
 b=o8if93fIxctD4atbnPscb5WcAYGpcFpKR9OLtA/T6muIBVh7PnAK5MmqkogwPN5NPMWq+us2Cj1/mya69JZapL3t40Yz2jf7iNpsBhAwGix4gL8N1yugaH5ToLdWBQ2T7wWVlV78yVB0IuDcdaH9iq5WtGelUaxWYCB8N6YWG9c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 MW6PR12MB8950.namprd12.prod.outlook.com (2603:10b6:303:24a::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6768.34; Wed, 13 Sep 2023 19:57:25 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::4196:c9c9:dfe9:8079]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::4196:c9c9:dfe9:8079%3]) with mapi id 15.20.6768.029; Wed, 13 Sep 2023
 19:57:25 +0000
Message-ID: <b1396feb-9bd5-4aa4-97b1-9d743fffe5ef@amd.com>
Date: Wed, 13 Sep 2023 15:57:21 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: Fix -Wuninitialized in
 dm_helpers_dp_mst_send_payload_allocation()
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>
References: <20230913-fix-wuninitialized-dm_helpers_dp_mst_send_payload_allocation-v1-1-2d1b0a3ef16c@kernel.org>
 <b11cce07-7e13-49b5-aed3-88517356281b@amd.com>
 <CADnq5_MsHwC94F_2SdyUM39FRoeVZMNa-8quxB4TVOVqM05=zQ@mail.gmail.com>
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <CADnq5_MsHwC94F_2SdyUM39FRoeVZMNa-8quxB4TVOVqM05=zQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0067.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:88::14) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|MW6PR12MB8950:EE_
X-MS-Office365-Filtering-Correlation-Id: fa28e832-d350-4199-3490-08dbb493a6b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VjsK4752gmDmR5RtdELDhSXgVMtU9SaIEyXX0+3geVzG8m4FRxaZyuXq8iUiZ686YcIb0Lc9N9jymMoCVItJr0DVZvD8ZLzUM7mO76cN24hgmFgSg8trvOV3MYidzkBdlhFRo3wuU27BXfND6g+nNZLxgzd26Fhw2zyCe2JEimErRvB9cHcKPUxrp/fxk8fAKdUkHw/SSLO4R2SqXBJmzWZDbgMsHnUglN1RgXul/HIy4Y/zdYiCAroAkf63dpLTP7v2MHbMZOnVO2kvAB1lpEuT0I3hC826ViwhyTaN4r152bC/RDAjLluOQnr4xMcWwiF3uIWOKcOmC2L7XIA2WYWOWI+xaI5RCmgPW0gqyH+1TJoLeV4OMNXpaypLShnG2qRTUjF2kMCSQaaL+qL0BBMJUxhhsBgv6Ew6VwaT61cTT+3QGEEWWhCRbwirg/8LcJQeYfjBgXV1x/KIXhzhsKcom6DmK5Q6ORXzox+GX3x7KHpVxC2QeGR3q1K6zsZvKmolHvW1YSAHf3JfkncFwhzfOAoMbO1tederXdGja9hP/hxA32jqJ5ayN/g2dZhPwGQRoTohjWfutmKUWj/pshvZEPnfjZB8qond3It0ZVQqtZk1SWG0CzKJ0SEg8lNVTAL0mvxdOYXNEtRfutd2ww==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(136003)(39860400002)(396003)(376002)(186009)(1800799009)(451199024)(6506007)(6486002)(53546011)(6512007)(6666004)(38100700002)(83380400001)(86362001)(31696002)(36756003)(2616005)(966005)(26005)(31686004)(6916009)(41300700001)(316002)(66476007)(4326008)(8676002)(44832011)(478600001)(5660300002)(66946007)(2906002)(8936002)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MU9GUVlacDltRVVYZENON0ZoK25scWwzTGhnWFFscXNpdDR0dGJOcVZlb1pY?=
 =?utf-8?B?TjhtM2tlR3c5ZmRmTWJNeVdMY3FQeE9rQWNsQjl4amJESmlaT3R1ajdkK0xy?=
 =?utf-8?B?MmJBcXB2aVJkMzJtZy9YYW9lOEl3blVucFhBeTlkUkV5VzdpZXg3T3VZZEh5?=
 =?utf-8?B?OWttbXpRTUlwZEpXZm1GNGtIa290VzdieFg3UmJmaGRrREE0NTh5bHQ5aW1P?=
 =?utf-8?B?V1A1a1hkSlI0dmxQYVJ1bUZhcG1ldC9kUmYrcCtMVnRxYUxBTkNhMnRvUFVM?=
 =?utf-8?B?K2dpQUhMM0FvQWY4cWJkWlpvYXgwYUczSnYvc3F0RklPNUlaWGNLcndhbUFs?=
 =?utf-8?B?ckJuaGR1MitId1ZVbUNjSGIvdVdTT0s5T3c3bDgyaGZkYWtWaExYa1Z5ZU56?=
 =?utf-8?B?L3ZCTUpualJNUWNaQ2owUnpGbWk1aUwwajlJU1RSKytuMTBlaVRkRGVoUmdv?=
 =?utf-8?B?akZacDBkZWJ4cXQrTFFYSVJpNjZoL2JETkwzL2hXZ0tpZSt3ZndodmJyVUxw?=
 =?utf-8?B?em9KWlNmWWg1N3lRb0l3NzRYVXk0YlpFRi9mWnE5UFBHR0NPZnlCd3pId1ZS?=
 =?utf-8?B?N1Z6Q3ZGcVFESTltYm9lNmlwcjg1dVZ6LzFjdW5UV2twWGhOYndHbkhKVHl0?=
 =?utf-8?B?RHpuOVVnd1o5dml4cEFvempyUHB5bTFyOTlwSmF5bE9remZLTEFzeDV0Ky9B?=
 =?utf-8?B?ZWdnNTJOZ21KNmZDSU9DYm5IcHBkakxEbjdJOWRubXJRMzA4T3VpSENQMnhY?=
 =?utf-8?B?WGFlUUUyZjJ3Z2NsMDBCaFBUamh5cWNKMVVMY2JjLzRaRXJmanhqU1FtZlJ0?=
 =?utf-8?B?aHFoQjhMbno0SU0xNGN1aHNQbGJENlNnaXliZ0RxdFh4ZWVXcVFwNXFobkxH?=
 =?utf-8?B?QlFuM2k4cllqSk8xYW10amRYSFM4bitHSVc2WHlkWFZXekhvZHBHek5uSjE0?=
 =?utf-8?B?M2xOS0ZRdlI4U0pyU1dGSlBkeGUzQ1hLdDdnREFFQy9zQVVRS1JObU5icWlC?=
 =?utf-8?B?R1dKVGJYMnR2ODBhd3ZFT2NsRHRLeEo4NTVrY1NCNkxwSlZyeXBZL09uYUNH?=
 =?utf-8?B?WkQwRGg0TXp0Z21vdVhZMm1YZ2p3ajFKZ1FvQ0xYOXhiMjN3eE16R09GU1p2?=
 =?utf-8?B?a0E1RGdpcCtMVzhSamVVZG0zdUpsV0RyUHdxbkNzNlVLazNzL25GTkdVVjNs?=
 =?utf-8?B?ZGVnQ3o1aVJZalpndVNKVTZyelBXUlZTOE9oc0RQRGxmT1IzTXE1UWdLK1VP?=
 =?utf-8?B?SFJ1TThOQ3dvOEJJT0VPT1dnSHRLZ2FFY2FrdWF4QmpJREExdGdIa0J5bDg4?=
 =?utf-8?B?cWsrRHZmd2ZibUZyUlNjZmVjSlYxcVVhZ0FKTVlhQWpQZ3paR01lOXRudHQv?=
 =?utf-8?B?RVEveHhUczFFdEVPQXpNWk83NWMyNG9saVZSenI1WVFiUVc1SWlNYjFSNWFy?=
 =?utf-8?B?T1J4dWhqWVlNcm84WnMrYUk1WlBGTnBjSHpTNkQ3cDM2cklnMmxYZERkYWFC?=
 =?utf-8?B?Vm1Jb0I5RG5YeCtoSjBiUWZPdEx0TjM1ajN4RU01b2VYQW11MmtIZ0ZTeEJJ?=
 =?utf-8?B?elVXVUJRWGVGREVxU21RWWs3NnZJbUNmMTlEOTVCSjFhNU41Tndxc1BlcTZz?=
 =?utf-8?B?czRVckpxY0k2enpVcHo0cHJTdTV2R3hwNFdQdkQrRWZlVUE0bmhWUm1tekY1?=
 =?utf-8?B?UDRJbmI0bFNsYmJxMGtPU0lrSHdyUFFBVERmWHp3ckh6TVkzSnhFSzZEQmk0?=
 =?utf-8?B?Y2JJcFRUVkVnVmRRVWNCT254ZStNOXlmbkhnME5qYjBkRjk3NEtqN2pUUjAy?=
 =?utf-8?B?aEErK0djaXgyWTBxY2p5MnpiVUtTb0FrdXFIU2NMcy8xUVA3bllXWkFDamQr?=
 =?utf-8?B?a25pL3d0RkFPdy9WYU1UbHFGcjYwbVNrWU1Eb3RMQWxSWk12MTY2ZEtIWUhP?=
 =?utf-8?B?cmI2aUFheEZIUlFaVytNVmJ2Szk5QzlsNHlSdnlZV1c2a1c0R0RwTEg1WTR5?=
 =?utf-8?B?VldNRkxMQ2EzLzgzanNQRmIycmhiZFg2RTdxYXRRYmEzTW40ck02TmM4QXRC?=
 =?utf-8?B?dzlvRnNKUEE2RDZ5QjJjNURvMDdTNXpRMXNJSjhrMjU1eHUzT2JIR1FMb2tk?=
 =?utf-8?Q?U+ikLrDlarPFYEtptV29Bla3Y?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa28e832-d350-4199-3490-08dbb493a6b8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 19:57:25.5113 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b6vIesWc5Egs30iQfDcOddCNy8YE3izGyS2sFHi/NIhGEqkdZzILEo+rvsi8tgFg1YJucWqSd2hmtfxkcRGswA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8950
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
Cc: ndesaulniers@google.com, llvm@lists.linux.dev, sunpeng.li@amd.com,
 trix@redhat.com, Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com,
 patches@lists.linux.dev, amd-gfx@lists.freedesktop.org,
 Nathan Chancellor <nathan@kernel.org>, dri-devel@lists.freedesktop.org,
 Wayne.Lin@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 9/13/23 15:54, Alex Deucher wrote:
> On Wed, Sep 13, 2023 at 12:17 PM Hamza Mahfooz <hamza.mahfooz@amd.com> wrote:
>>
>>
>> On 9/13/23 12:10, Nathan Chancellor wrote:
>>> When building with clang, there is a warning (or error when
>>> CONFIG_WERROR is set):
>>>
>>>     drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.c:368:21: error: variable 'old_payload' is uninitialized when used here [-Werror,-Wuninitialized]
>>>       368 |                                                  new_payload, old_payload);
>>>           |                                                               ^~~~~~~~~~~
>>>     drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.c:344:61: note: initialize the variable 'old_payload' to silence this warning
>>>       344 |         struct drm_dp_mst_atomic_payload *new_payload, *old_payload;
>>>           |                                                                    ^
>>>           |                                                                     = NULL
>>>     1 error generated.
>>>
>>> This variable is not required outside of this function so allocate
>>> old_payload on the stack and pass it by reference to
>>> dm_helpers_construct_old_payload(), resolving the warning.
>>>
>>> Closes: https://github.com/ClangBuiltLinux/linux/issues/1931
>>> Fixes: 5aa1dfcdf0a4 ("drm/mst: Refactor the flow for payload allocation/removement")
>>> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
>>
>> Reviewed-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
>>
>> Hm, seems like this was pushed through drm-misc-next and as such our CI
>> didn't get a chance to test it.
> 
> Can you push this to drm-misc?  That is where Wayne's patches landed.
> If not, I can push it.

No need, I cherry-picked Wayne's patches to amd-staging-drm-next and
applied Nathan's fix.

> 
> Alex
> 
> 
>>
>>
>>> ---
>>>    drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 6 +++---
>>>    1 file changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
>>> index 9ad509279b0a..c4c35f6844f4 100644
>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
>>> @@ -341,7 +341,7 @@ bool dm_helpers_dp_mst_send_payload_allocation(
>>>        struct amdgpu_dm_connector *aconnector;
>>>        struct drm_dp_mst_topology_state *mst_state;
>>>        struct drm_dp_mst_topology_mgr *mst_mgr;
>>> -     struct drm_dp_mst_atomic_payload *new_payload, *old_payload;
>>> +     struct drm_dp_mst_atomic_payload *new_payload, old_payload;
>>>        enum mst_progress_status set_flag = MST_ALLOCATE_NEW_PAYLOAD;
>>>        enum mst_progress_status clr_flag = MST_CLEAR_ALLOCATED_PAYLOAD;
>>>        int ret = 0;
>>> @@ -365,8 +365,8 @@ bool dm_helpers_dp_mst_send_payload_allocation(
>>>                ret = drm_dp_add_payload_part2(mst_mgr, mst_state->base.state, new_payload);
>>>        } else {
>>>                dm_helpers_construct_old_payload(stream->link, mst_state->pbn_div,
>>> -                                              new_payload, old_payload);
>>> -             drm_dp_remove_payload_part2(mst_mgr, mst_state, old_payload, new_payload);
>>> +                                              new_payload, &old_payload);
>>> +             drm_dp_remove_payload_part2(mst_mgr, mst_state, &old_payload, new_payload);
>>>        }
>>>
>>>        if (ret) {
>>>
>>> ---
>>> base-commit: 8569c31545385195bdb0c021124e68336e91c693
>>> change-id: 20230913-fix-wuninitialized-dm_helpers_dp_mst_send_payload_allocation-c37b33aaad18
>>>
>>> Best regards,
>> --
>> Hamza
>>
-- 
Hamza


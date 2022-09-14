Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6895B8F7C
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 22:09:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 023D910E02F;
	Wed, 14 Sep 2022 20:08:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2049.outbound.protection.outlook.com [40.107.101.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED51C10E9FC;
 Wed, 14 Sep 2022 20:08:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OFzdzpxx7+65aWdCB8cGVahc5yigl6dALmtxomfcP0ceU+OW13xkgtxNxvVn5KRDW+yN//UorY4qUnzl4zFvau2T9VtIb7YwHz1QdDLRYr+QaLOyPVMmbM8BAk8FP1o0SjTjXjTHjc6O+A3qc+rr65UVwPtI6cT/VLEv38pvggrOWkkVqanEeLWV2B54gtoZVEiwRSsbJwJHktJmkiy8LLYNkTeSF3D+Fgvx1IAeMjRPJOAG2UY3cPUA+OMXM+90H6O8sff4Ly/xgOeOy5Jw0+O/mUUKfBHq8cwVx06NVSDqcu2wAAV3iovxEywJ2E9aYlsqKMmsebm9wCnq4+mSKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VV0g5t8YVgEyxd4ms6yBp8AWHlkMZyiDLSCjGM7TV0c=;
 b=WjcIz+LzxZGR7z5P55jnteCZdZilo9t3ozcNqZ1UG+Ya39U+idNMLhdaBWkpiSLUjX5rQzuJvapZ1PbijyOLZvJsDuJtTafZ42vUD8NOxwgtcJp7JZP78SsbDHA8JffIBjntnOB/fUIMXvZhdUbYqv3A+jmRQNgrIj705kgQ6VoFa5TPx1hbbGq+me4A607flhABogL1M6G4OX0WIQ1Nl/gxVkjT4eW5ITPco0DgEtbEe0iJGw13yd7Ahmifp11DgXfhXlZPb3NVsBR84cUUl8xRA7E2Mgm5UE6zirBKPoBOmCETjN6Ifj7fDjirYej77RnrK+BP5kXPixucr404Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VV0g5t8YVgEyxd4ms6yBp8AWHlkMZyiDLSCjGM7TV0c=;
 b=P/xvDbLJqTl4pwwNJ4c6bJAacLLcRuYcD/VJIMzPhqh3hNKfWJ1aw+cPyPiZHbadk/xvkBriTZVYBXWnWRUoEo2qchuXirO1Gx0XE9tf93Rw7hJZ6zJygR2gW7KTWdlQqK3DdjKA/T2m1FuxQWZbWsWdnMmV1nFoAN44F9fSWbY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3048.namprd12.prod.outlook.com (2603:10b6:a03:ad::33)
 by SA1PR12MB7149.namprd12.prod.outlook.com (2603:10b6:806:29c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Wed, 14 Sep
 2022 20:08:53 +0000
Received: from BYAPR12MB3048.namprd12.prod.outlook.com
 ([fe80::a833:7969:1f8c:df6f]) by BYAPR12MB3048.namprd12.prod.outlook.com
 ([fe80::a833:7969:1f8c:df6f%7]) with mapi id 15.20.5612.019; Wed, 14 Sep 2022
 20:08:53 +0000
Message-ID: <d94e5504-41b2-3546-24cb-6db2877d277c@amd.com>
Date: Wed, 14 Sep 2022 14:08:49 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V3 46/47] drm/amd/display: Fix failures of disabling
 primary plans
Content-Language: en-US
To: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>,
 Wayne Lin <Wayne.Lin@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20220914051046.1131186-1-Wayne.Lin@amd.com>
 <20220914051046.1131186-47-Wayne.Lin@amd.com>
 <604a1d7e-1cd9-ad27-6d37-2e8535ce253b@mailbox.org>
 <40e970ca-c0ac-98b3-0549-2d7b1a812f81@mailbox.org>
 <c429010f-30ea-7abf-a67a-e730c7a6728d@amd.com>
 <65bbb8fb-92ae-774c-72ab-d22195851828@mailbox.org>
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <65bbb8fb-92ae-774c-72ab-d22195851828@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0174.namprd03.prod.outlook.com
 (2603:10b6:303:8d::29) To BYAPR12MB3048.namprd12.prod.outlook.com
 (2603:10b6:a03:ad::33)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3048:EE_|SA1PR12MB7149:EE_
X-MS-Office365-Filtering-Correlation-Id: c9c7252d-d352-4413-6f4b-08da968cf251
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eB1C6IgYRl9H5rnLddMypzGZI/LjWWpFgXOqUF1SL2nt+18a3D2sdYvKFSFW4HfY2ezcVmwzgFBGXazbSRHtf7VuJXE6AgDPjaq65fOnXGwqPsyC06wrYUNUJlQLnEFeCSQWjxUsUT6kHG4jCmnlGCFz5OsujoODkmTNRRM2NTOR+yigzK7GYHHh29IYUZbQn9ZbaU2hQvFKZTbf9v6a7CWbOGMmpT8QbMAe7SF8bDGdE98zkcqsRxZaAWuoxPeYBYgn25kQDmeKWLTfB+GjJQIunfF2paMniCy2KtU+/3VPA37PDOc3OjsW5DdRGWkGCD8hIiO2JlL/kdQyX/d1jsFQeUmlvdpe/IIbxrm5DFzQ9nkX1j4SkckPqJAybZ8GUNAmagBhbR0Ni3tL9BeHDgCKBv/NaHxqis/IN3t8sDITq+butpq1puGj9DhSMio5KnaAUE32/HTOLQwcud58LFvvywKKqt199OibB7Bgr7XJ9RRR6sA2gRvezoAW9NUW54nA3k3Srx7g9UKh3vrXrrS8Tta8ZewvCOR/wvMX/QGdp+Ywr/rGnrFsCS+zi37NUUQIwQowLJ+T/5bTXuDvcm4C6ur41thv8zTynu3rHPTjeaET3B3yZG4t7OiVGSUvtkeTL83fWpqtLd2eXZHMYy7o01kErCrTk4FYFua/AJyjomgi43LSTetfIFPACiYzA7MgZ7sVfiW5a5mfh7GyuyZ0DJ8pOGvlPFZcHxFGIPM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3048.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(376002)(346002)(396003)(366004)(136003)(451199015)(5660300002)(6486002)(966005)(110136005)(31686004)(45080400002)(316002)(36756003)(186003)(38100700002)(8936002)(8676002)(31696002)(86362001)(66574015)(2616005)(83380400001)(2906002)(6666004)(6506007)(53546011)(66556008)(478600001)(6512007)(4326008)(66946007)(44832011)(41300700001)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWRlSUcxNGsxZmpLWm1uY3NiOEU5RXdSc3h0RFJrWlZUaEZRVE1IcVRrcG51?=
 =?utf-8?B?bWtTMCticHJTeU93SUhNdlMvb0hkc1NUTEJOVi8xN0JSb0owanNkTlpraHNZ?=
 =?utf-8?B?YkMxQWs0b1picGhvU3lReXEveVI1em9RVzh0UXZDQzRUanlqTU5uS3lMbmdz?=
 =?utf-8?B?ZUZwUG5ndzRDb2hpUU1pWC80dFFOUExRMUwvOXhISjFzRHg3aWxJdjF1MEND?=
 =?utf-8?B?bXYxS1NiWkUvanlJLzl3N2VmakJpbitJcVNSbld2TjVJeUhhaGJYTnV2bUlJ?=
 =?utf-8?B?c280NVRpd1VFQWhXUWg5VXcxRXJiMU1xWkt1NGk3UDV0Z3B4ME0yZ3h5Q21v?=
 =?utf-8?B?N3B4c3JnVkVsais0amZENDd1c3ZsaTlZalIyTTNwTm1vZlZpRTduUXgrbmRC?=
 =?utf-8?B?R29ha0tEOHBSTm9idGxHd0s0SDY5QXhvaUVqb1BrYkdBbyt6djZqNVQ5UHZI?=
 =?utf-8?B?TWltUUl5Y0dXdGJtQmZHWGRoRWFVSUhud1J5a29GcWx2WTE0OEJ4ZGU5Z0hH?=
 =?utf-8?B?Vnh0bTB3QWVCU25SWXRpNHp3NUc4OUp5VVdvSG9WWDFMSU9pc1NSVTlaU1kr?=
 =?utf-8?B?eVJCc1d5dEhSZUgxWXd5d3paM3lFNUVZamRYTkpualdSZW11ckhXWkFpTG1u?=
 =?utf-8?B?ZmVrVEdRVHZ6clpyVDRQL29WNTlGZzljK2VsdmdCQ1M4QWt1c3hxNnJVYVB5?=
 =?utf-8?B?NEVBTk9hVmZiZ2lpVW5ZNWEvWEJZRjZnRDBsSWN6U2NxNTdkRkJSQ0pvTDBH?=
 =?utf-8?B?R3dzZ2F6MTRLV1p3cUtFMjlOV1dTc3RXcHp2cU9CSlprR1lLaXZOUjFqNll1?=
 =?utf-8?B?WXV4ZE5oOFFXVGpGWUxWbEUvbjU5TitmS3grS2dzRzhXaEw2bzdYclRWTUVL?=
 =?utf-8?B?aTY3NytkbVU5SjRtNnRLSlhPR0ZzQmNORUd4elRrUWFiSGZETVo1MEUwbXly?=
 =?utf-8?B?ZjFsTnAxai94VDluaGVPa2QrYWZlYXIzRm5yNmdLZjBXNWgvc1pINnh5RWda?=
 =?utf-8?B?bjBuK0FpQnRlcnpma0YrZVBVWjhKYUd2Wi8yNkZKVFZSRjVIR0c5bitMTmUz?=
 =?utf-8?B?YWxIbHc2aTdhQlRoTjdhOGxrLzI3a1pFTzBBNXRVeEMzUTBQVklNd2x5Z29T?=
 =?utf-8?B?dFNRcExHNGlTdWlhZ25nZTExSTFRVnlENENBZjI1UmRVK3ppWUpSOTZlUytT?=
 =?utf-8?B?cnl0OEdsYlJVSEdBYTYxQnVoZ01YT29aSGlualpyUHFwdWpNN0k5NW1EVHhJ?=
 =?utf-8?B?QldPRXZIenp3cE1PazlUYTNqZGtKU3FyanVNNkwreHMyYUZDd1BMMUUvV013?=
 =?utf-8?B?OG91LzV6RkZWakZ1K0JVS1NpOFh6cjlJSm0yRmlBdE9TSXAzblpXUkhDT0c4?=
 =?utf-8?B?eGZBWUYraENGWEw0dXBMb3pGVkNwSHBhWHVidEhlaVk5cWhRQXJaSFJJdGdX?=
 =?utf-8?B?bW9WUExoL1plN0pXQ2lzN2ZTQVNOWUI0RXYxTjRLT1g5eWZWYmlUYllsMW5q?=
 =?utf-8?B?OU1wazBHNDRocVVQK2tobW4zR0VoNTF0NHJxSzMxVmFyb21MYWoyMmJJTFdY?=
 =?utf-8?B?U2luUEhGSE5MdTRVTTJoS1pRZUZFTW05RWFHWTh3Q0x5d01YOUJCcVUyRTcx?=
 =?utf-8?B?bVR6ZXBscVQxcTJvV25xOHFNVXMyeE0yQjR2RXlUUEwrMjIxSFFlb0R4WVlr?=
 =?utf-8?B?MU4rL0dhRnRNd29BQURxK25ZbHQyZnFZWkZlTnJpTEtWYlBsbWp0YmpsQW82?=
 =?utf-8?B?cTM0dCtjaEhmWnd2eitSYnV2R2UzdnRKeGFBUkpLVWNpN01oRGxoMkxHVENS?=
 =?utf-8?B?MkZxbHJpMUZGYkZrOVh4L2pjRkZobVg5aVJHUVlzSkZZYkowb1NaOFJDNXZm?=
 =?utf-8?B?VlYwUmU0TGZFWkZYVXZkdmVrVTAraXFod25rRURhL2NPVW5aNlpJVEhmUlRW?=
 =?utf-8?B?dmc0NjdielhraFNzZFYrTW54eUM5NGpIWWR4Nk9kYnVuaFp2d1pUc3g3cFFT?=
 =?utf-8?B?a2RqeVVOczlBY25BS3pMbW0rUWZIc3RHVlRsMnJiVDNIUTZXdFEyVjVUVTBq?=
 =?utf-8?B?TStaZ0hWZG4vUWZ1aDZ0MU15cEhnanBTbStmdzhLVmRZdnc1bVNyL0xGWXV5?=
 =?utf-8?B?d2gvaHVhWi9yWHZGeVRJRUdqV01MOUVrM0pPU0V0T2FETmQyOU9vVzFlVDJF?=
 =?utf-8?Q?QQ4f5YtErOmfvybJS9H4MRLZwj008alyF9PsLzDwNn25?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9c7252d-d352-4413-6f4b-08da968cf251
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3048.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2022 20:08:53.3388 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HWyUuF8ABAMmand/INlBOwk94CRvXWMad1aJDkZUPynjxTSIaiZeYRYQ+rtA79WQ6KXQ/OqrWpS3dy+Z6PHwgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7149
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
Cc: stylon.wang@amd.com, Sunpeng.Li@amd.com, Bhawanpreet.Lakha@amd.com,
 qingqing.zhuo@amd.com, Rodrigo.Siqueira@amd.com, roman.li@amd.com,
 solomon.chiu@amd.com, Aurabindo.Pillai@amd.com, agustin.gutierrez@amd.com,
 pavle.kotarac@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2022-09-14 10:55, Michel Dänzer wrote:
> 
> [ Adding the dri-devel list ]
> 
> On 2022-09-14 18:30, Alex Hung wrote:
>> On 2022-09-14 07:40, Michel Dänzer wrote:
>>> On 2022-09-14 15:31, Michel Dänzer wrote:
>>>> On 2022-09-14 07:10, Wayne Lin wrote:
>>>>> From: Alex Hung <alex.hung@amd.com>
>>>>>
>>>>> [Why & How]
>>>>> This fixes kernel errors when IGT disables primary planes during the
>>>>> tests kms_universal_plane::functional_test_pipe/pageflip_test_pipe.
>>>>
>>>> NAK.
>>>>
>>>> This essentially reverts commit b836a274b797 ("drm/amdgpu/dc: Require primary plane to be enabled whenever the CRTC is") (except that it goes even further and completely removes the requirement for any HW plane to be enabled when the HW cursor is), so it would reintroduce the issues described in that commit log.
>>>
>>> Actually not exactly the same issues, due to going even further than reverting my fix.
>>>
>>> Instead, the driver will claim that an atomic commit which enables the CRTC and the cursor plane, while leaving all other KMS planes disabled, succeeds. But the HW cursor will not actually be visible.
>>
>> I did not observe problems with cursors (GNOME 42.4 - desktop and youtube/mpv video playback: windowed/fullscreen). Are there steps to reproduce cursor problems?
> 
> As described in my last follow-up e-mail: An atomic KMS commit which enables the CRTC and the cursor plane, but disables all other KMS planes for the CRTC. The commit will succeed, but will not result in the HW cursor being actually visible. (I don't know of any specific application or test which exercises this)

Did you mean cursor plane depends on primary plane (i.e. no primary 
plane = no visible HW cursor)? If there is no primary plane, what 
scenario would it be required to draw a cursor?

If this is a rare case, would it still be a concern?

> 
> Also see the commit log of bc92c06525e5 ("drm/amd/display: Allow commits with no planes active").

Does it mean dm_crtc_helper_atomic_check does not need to return -EINVAL 
if there is no active cursor because there are no cursors to be shown 
anyways, as shown in the below diff:

+static bool does_crtc_have_active_cursor(struct drm_crtc_state 
*new_crtc_state)
+{
+       struct drm_device *dev = new_crtc_state->crtc->dev;
+       struct drm_plane *plane;
+
+       drm_for_each_plane_mask(plane, dev, new_crtc_state->plane_mask) {
+               if (plane->type == DRM_PLANE_TYPE_CURSOR)
+                       return true;
+       }
+
+       return false;
+}
+
  static int dm_crtc_helper_atomic_check(struct drm_crtc *crtc,
                                       struct drm_atomic_state *state)
  {
@@ -383,7 +396,8 @@ static int dm_crtc_helper_atomic_check(struct 
drm_crtc *crtc,
          * userspace which stops using the HW cursor altogether in 
response to the resulting EINVAL.
          */
         if (crtc_state->enable &&
-           !(crtc_state->plane_mask & drm_plane_mask(crtc->primary))) {
+           !(crtc_state->plane_mask & drm_plane_mask(crtc->primary)) &&
+               does_crtc_have_active_cursor(crtc_state)) {

Note: This would fix kms_universal_plane but not kms_cursor_legacy.

> 
> 
>>>> If IGT tests disable the primary plane while leaving the CRTC enabled, those tests are broken and need to be fixed instead.
>>
>> There are IGT cursor tests fixed by this:
>>
>>    igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions
>>    igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size
>>
>> It also reduces amdgpu workaround in IGT's kms_concurrent:
>>    https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.freedesktop.org%2Fpatch%2F499382%2F%3Fseries%3D107734%26rev%3D1&amp;data=05%7C01%7Calex.hung%40amd.com%7Cc757c9e4fbda4f8474a308da9671f920%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637987713521806985%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=XRRvilVZMBALIWHAOLArxjiAcgqQ%2FwNRnuUUJCTOYzY%3D&amp;reserved=0
>>
>> The change affect multiple IGT tests. Adding amdgpu-specific workarounds to each of the IGT tests is not an ideal solution.
> 
> It's not amdgpu specific, other atomic KMS drivers have the same restriction. IGT tests need to be able to handle this. See e.g. 88e379cef970 ("kms_cursor_legacy: Keep primary plane enabled for XRGB overlay fallback").


Commit 88e379cef970 adds the following change to keep primary plane enabled:

+               igt_plane_set_fb(primary, prim_fb)

but kms_universal_plane fails at testing disabling primary plane, ex.

tests/kms_universal_plane.c:

192         /* Step 5: Universal API's, disable primary plane (CRC 5) */
193         igt_plane_set_fb(primary, NULL);
194         igt_display_commit2(display, COMMIT_UNIVERSAL);
195         igt_pipe_crc_collect_crc(test.pipe_crc, &test.crc_5);

...

230         /* Step 11: Disable primary plane */
231         igt_plane_set_fb(primary, NULL);
232         igt_display_commit2(display, COMMIT_UNIVERSAL);

and so on.


> 
> 
>>>> P.S. Per above, this patch should never have made it this far without getting in touch with me directly.
>>>>
>>>>
>>>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
>>>>> index c89594f3a5cb..099a226407a3 100644
>>>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
>>>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
>>>>> @@ -376,18 +376,6 @@ static int dm_crtc_helper_atomic_check(struct drm_crtc *crtc,
>>>>>            return ret;
>>>>>        }
>>>>>    -    /*
>>>>> -     * We require the primary plane to be enabled whenever the CRTC is, otherwise
>>>>> -     * drm_mode_cursor_universal may end up trying to enable the cursor plane while all other
>>>>> -     * planes are disabled, which is not supported by the hardware. And there is legacy
>>>>> -     * userspace which stops using the HW cursor altogether in response to the resulting EINVAL.
>>>>> -     */
>>>>> -    if (crtc_state->enable &&
>>>>> -        !(crtc_state->plane_mask & drm_plane_mask(crtc->primary))) {
>>>>> -        DRM_DEBUG_ATOMIC("Can't enable a CRTC without enabling the primary plane\n");
>>>>> -        return -EINVAL;
>>>>> -    }
>>>>> -
>>>>>        /* In some use cases, like reset, no stream is attached */
>>>>>        if (!dm_crtc_state->stream)
>>>>>            return 0;
>>>>
>>>
> 

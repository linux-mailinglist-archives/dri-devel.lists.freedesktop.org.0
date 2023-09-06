Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4A37942D2
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 20:10:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35CEE10E6DF;
	Wed,  6 Sep 2023 18:10:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2089.outbound.protection.outlook.com [40.107.93.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AED5810E6DF;
 Wed,  6 Sep 2023 18:10:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MedP0RltOfg4fMp4YRk2q8koK9J8B4SSbODs3pmR5+M1TZcS3gnB7Ia+vmcqmxDKRAFyygQOgRMDhzM4MOu0+Pw7rfUbctUMWFL/dSdQza/5xOYXYri7UIHeLBc22v8hjwVaWQSwMeZvuGgGDCbXVOtcrG5PQOv0ewsDL+w2McNpW4cP0fEMR4/NVJHknI7U2AV5taGhVj4b/Iz4hlzzKPLyneAkAb6hOhBQ+htTco3B39l7T8hWya52p3hF06eTsOXwt3V3ZkSPY8P0nF9+0lAndTKg7bm/2isdrEzKsvLucCzuVpxN6Yu1f0Rgfw/3x/2vYmWTM5RuuDHZCj02HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZxCgLcpwDaZC2bmAMhzuc21Ykf0FzFzC14sOpt5DAhM=;
 b=fb0yUv5D6HZKEnske4C1YWeobX4xKTYpQR2+dQ8/TF6YpyntQxbY00fYQHgdoZyD8v2ZNSAEo+I/uv9Q86GJF2uHrLoehUAaoouCsSbtYtmdh4cYdwGSC3aBneYhLZ5hgQx4Xg++QGu2/DNWj/kq0VCA9OxdMlZ4V4aDoUU0HYCX7I7KE/oAeSLHqTERpMtwMRX+t7S0yIAwXdjtZkhn01LrDD3qwOaCVv085ynazeh+51TZBttvII7wo2xPe4KKmarjnvMb2EVIuCDIUIkqrBmcIpv9pXMyyqYskHGN4n9s542GdIOX9zLSDW2YvVn8qwgVfkq1exUk6b4iO1hRIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZxCgLcpwDaZC2bmAMhzuc21Ykf0FzFzC14sOpt5DAhM=;
 b=TBMTC3YfS2yZShIaj8vHbrr1fNFf/1jKX/IMGsHuabEpjaVqVoeb/UvJMzv8ZGiYTuzI8Z7pUxfB8m5TepiCo2swEikIb+i87osEIzbnX6tSml0Qi0s2wChgseA2nAFwmxS0jx2rTKpTZVb1Ktij6tTCC8o5ImWjacIcdCwFvGU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by IA1PR12MB6482.namprd12.prod.outlook.com (2603:10b6:208:3a9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Wed, 6 Sep
 2023 18:10:37 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f%3]) with mapi id 15.20.6745.030; Wed, 6 Sep 2023
 18:10:37 +0000
Message-ID: <e2c371a3-216f-4f7a-998c-92002de10378@amd.com>
Date: Wed, 6 Sep 2023 14:10:32 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 31/34] drm/amd/display: set stream gamut remap matrix
 to MPC for DCN301
Content-Language: en-US
To: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Melissa Wen <mwen@igalia.com>
References: <20230810160314.48225-1-mwen@igalia.com>
 <20230810160314.48225-32-mwen@igalia.com>
 <20230822153030.4d410ff9.pekka.paalanen@collabora.com>
 <20230825143708.hpndb5gmrdj3sjpp@mail.igalia.com>
 <20230828112041.16eb5827.pekka.paalanen@collabora.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230828112041.16eb5827.pekka.paalanen@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0002.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01::10)
 To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|IA1PR12MB6482:EE_
X-MS-Office365-Filtering-Correlation-Id: d89c9df3-2b3e-472e-cebe-08dbaf049271
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ep/SaHLK/sqSItTP/WaeV5pj8WamS/v5EXkYbu3hqriY/8jHnK3bEQc4JzZp0Ml8XBdMdH5FZHrYgWt2+XhvGmdI13BSHjNW7UYYcDAzaN7PiWhgXBMTUk3Kvlxn4efaBN6zTQTa/gBL7Yy0l/H23IG6kEE1Hi3kPVYknGlQV8DJnb4se6QB4KEY+RoH3RBma5qS9Y5jjHYbV5wBtkmQnolGRXmBEjmLh/wgqSKzpAfr/ygPhIyI99qYhrpea7NsKNqqtdCqzQHVMcXkDKvdWoK38o8+tROkJPqccbTgz+mAaagfwvV9G+4eyr+iBRneROGAhm1//Kms4hgDzVsosAUkgu6P3Kl0Fb/JqX/MmN6Gjq4IejzgXxqQX9nbdJIqMHDd+kkhArq8sBH+dhH/gXJwmaSyec2eEfo1MWcKomRHYWD4xooe5ifTD8/Q5LojEKTNOJ4ZkJf5+Q3PjYLC5uwfnUlpFrC7S5FTpVtzSQPQGzjFmO46wonj3mIVnMf4Oa/72lRAFon0dlUyOT82vBcwrz2w8NioR/a7q3TtoTDeO8HrHXZDPTsIOOE+9dyabGMejXhe5iU2+TEjljS5Ia89gbeIP2L8IcM0TKib6mvTJQmrsyBcl0ug1S6Xzhrgwi0x1LXwCjrqBye0YjCy6Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(39860400002)(376002)(346002)(136003)(451199024)(186009)(1800799009)(31686004)(53546011)(6486002)(6506007)(6666004)(36756003)(31696002)(86362001)(38100700002)(2616005)(2906002)(26005)(83380400001)(6512007)(478600001)(110136005)(66946007)(316002)(8676002)(8936002)(5660300002)(4326008)(41300700001)(54906003)(7416002)(66556008)(66476007)(44832011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHRadW1qT2RaUkFGNlpFV3NwQVdXZmQ0aEZNZGRHQ0Eza0NzRjdWWFJDcGRs?=
 =?utf-8?B?Q25ldnlFTDhvR3U0OXV2ZlhIQTRtWUFDNXptMDd0SklKbzJpYlVQd09Ua1lq?=
 =?utf-8?B?aG12bGpUZklnTUZxRDdEVWJnbTlCYklKeUJRSGZPTWxQY2NTOHhCdFpzaUox?=
 =?utf-8?B?N3g0TGJtRmtLd2VHMFVGZTVtWG5laEVMNW8venZmOWg2VElGUmRUNzdzaEJl?=
 =?utf-8?B?TnpvQ1lWVHROSzdHT2kwbkcwdTVabTlPaEYzK05tZ3pLWUM1c2orWjNXWWkr?=
 =?utf-8?B?MW1mYkNMdUxjOHlFUEF6THJEanBwaW1XSjhKWDJ3ZmFQR3BMWGZXRVhQaU15?=
 =?utf-8?B?eVIxK2tPZEd3ZHRkNGFYUUNmZ01reEFiMmVzeHp3cFdTWnlkNUdIdFNvY2NM?=
 =?utf-8?B?aC9HcWhwem1Jemtnb1BPYy83dmo4TzVVMWQ5cm5FM2d6eFlkL05qRVYvdE9R?=
 =?utf-8?B?SWhMUTlmdTRxMnIxakUxQ2xNQU8yVXdaUHlYMXd4L2o1Smt3OUhSYXhSa1ZO?=
 =?utf-8?B?SFpOTERZQk1pcjhSOFRIQW0ycjdOc3F3WjlIazNXYXZONnlyTWFMcksvbmRH?=
 =?utf-8?B?bHJUYzBnemRBQmRaOHgvSCtMUmo1dFhGZ1gxRDVOVGV4dE5oV2hMdXdHcWg0?=
 =?utf-8?B?aVNrVkQvMWRtQnJLWSt3RE11U1h5YURMRjNqNWRWQmkrL0J0WEJEcXBFVHBQ?=
 =?utf-8?B?OGJBS2dnem1RTHBHUkR2bklEbWJyUnlVWVF1MjhaWEdyU1hBL3Y1SmNkOTNk?=
 =?utf-8?B?MGJnKzJNd3g0ci9wbklwN3JMK0RzSlMwYWRhV2J0VEw5MHJiSmVaNUJtL0Fy?=
 =?utf-8?B?TGo4Q3l3K3BXZUlzLzlVM2dObkZ2VjNjeXRQc01KMlFrcUpjck1GeXJaYzlB?=
 =?utf-8?B?S2lVVU9Ick81cHQrK1JCcmp0YUEvL0lRQ2VsVExuOTBPdHcvbmtHNzltaWRV?=
 =?utf-8?B?OENDRVd0UndwcUNGV05tS0dyK2UxbU9uWnVIZEZCNUFvem9TNzdDWFlLR1Qy?=
 =?utf-8?B?bWRBaE5UYnc2eUtCOUpvbWpGQkpqYjZDeUd4NkpEa1NZN3pwUGFiTXVNQXJX?=
 =?utf-8?B?emdIaHViRUUvNFhGODZMY09WNjlabTJURVZlck9IUTkydVJxZERIYUJVZWR1?=
 =?utf-8?B?cWI1UmptNEJ2Tks3aU5idG9yMlk1RERkd2ZzYTJaVGZ2Q0tGUCswc1RxOEZi?=
 =?utf-8?B?dHFkYlZ6UWx2Q3pDeU1DaGx2WkhkQ205ZGh2Z01SenNNcTU2aXBxU1VZVWVl?=
 =?utf-8?B?Rnd3VEdsOS9JWFgxYmtyZjNwYlZvRnNOOW1meDl2WWFxVDFlUEZRZFBQMjZ0?=
 =?utf-8?B?cC9FYXYwLy8yR0FkS0xXTzUvcGNreW9YcDc1TjlnT1Q3d0hxSHVvQnZuYVlD?=
 =?utf-8?B?anYvVVNhUTd4YWxPZVlKMHpVSnd6RmtWZ0o2bVk4SFZid0V5M0lobHV6cnA4?=
 =?utf-8?B?U21FbkFwaC82WFRTb3l5NGJ6Z1dZVWtCRVZWbG50S1V0aVR2SW12QUVoV2tB?=
 =?utf-8?B?a3c3MVhjQzlYclJRdVlSY3JiQlNkUkowNkg4UUtFbDRCOEZIcjUwSkR3SXIy?=
 =?utf-8?B?RUV6bFBGWnQxUkJDSDFJZFZFZ0Y0YmZlcTI5VGc2WTZEUDhkeGNCWm8xR1U1?=
 =?utf-8?B?YnowSjM0RkYyU2tHek1rWHljTU5zSlo3Z09jMTZsSlNZTWI4c2daV2dpSGNo?=
 =?utf-8?B?SkNaQTFsWnB0b2wyWlFsb1FFV21kOGtJSUJNdHJORmhEamZFanhsSys4a0VE?=
 =?utf-8?B?WjdMcVA5QjZhRTRmZGF2V3JETi9obHhBYkkzem15dE1mMVVKNE00UTRUditM?=
 =?utf-8?B?MVlDb0dSc0U3YmlSbWlNZ3JXd2pEcmYzMytoWHROOE1LWDJRZUtuMUl4TWJo?=
 =?utf-8?B?SklyL0JDWEpzTDgrYVZPV3pFbFBzUVcraE10aUd6amlhRVJIaVZBVTJMc3RY?=
 =?utf-8?B?cGh1ZkEwbWwyU0x1bmlFMW9oZjNsdXdWbVQxdE5LdFg2VnhMZDJEVFpEd3lK?=
 =?utf-8?B?dU9tVDZyemI5RHhqQ0QzNVB3ZFBuTENGdzkwQXdkSXMxVHhlMzlqWUhpL0J6?=
 =?utf-8?B?bnNhcmEyUU5IM1pLOThvYWE5eHZ2NzVTNVRkVHFrNWFPSkVxZmg2TElaUEVx?=
 =?utf-8?Q?XwAQNxSXg1TkKv2RD6mQxrvui?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d89c9df3-2b3e-472e-cebe-08dbaf049271
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 18:10:37.6661 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bj92bsdR9xEPP4s6i4I3O973Ygf1XqzFdP+nCTFqMrmT7LGAATq6QcY+EO1iv381qU//4V3ma+dWbAWt4XPHaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6482
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, Shashank Sharma <Shashank.Sharma@amd.com>,
 sunpeng.li@amd.com, Xinhui.Pan@amd.com,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Xaver Hugl <xaver.hugl@gmail.com>,
 dri-devel@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Alex Hung <alex.hung@amd.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023-08-28 04:20, Pekka Paalanen wrote:
> On Fri, 25 Aug 2023 13:37:08 -0100
> Melissa Wen <mwen@igalia.com> wrote:
> 
>> On 08/22, Pekka Paalanen wrote:
>>> On Thu, 10 Aug 2023 15:03:11 -0100
>>> Melissa Wen <mwen@igalia.com> wrote:
>>>   
>>>> dc->caps.color.mpc.gamut_remap says there is a post-blending color block
>>>> for gamut remap matrix for DCN3 HW family and newer versions. However,
>>>> those drivers still follow DCN10 programming that remap stream
>>>> gamut_remap_matrix to DPP (pre-blending).  
>>>
>>> That's ok only as long as CRTC degamma is pass-through. Blending itself
>>> is a linear operation, so it doesn't matter if a matrix is applied to
>>> the blending result or to all blending inputs. But you cannot move a
>>> matrix operation to the other side of a non-linear operation, and you
>>> cannot move a non-linear operation across blending.  
>>
>> Oh, I'm not moving it, what I'm doing here is the opposite and fixing
>> it. This patch puts each pre- and post-blending CTM in their right
>> place, since we have the HW caps for it on DCN3+... Or are you just
>> pointing out the implementation mistake on old driver versions?
> 
> It's just the old mistake.
> 
> I hope no-one complains, forcing you to revert this fix as a regression.
> 

I'm worried this will break other OSes since its in DC and shared. I'll
check with Kruno when he's back from vacation. But most likely this will
be problematic.

Worst case we can add a new "program_gamut_remap_actually_post_blending"
(with a better name) function to HWSS, expose it in DC, and make sure
amdgpu_dm never calls the old "program_gamut_remap".

I hope nobody relies on the current (IMO broken) behavior on Linux.

Harry

> 
> Thanks,
> pq
> 
> 
>>>> To enable pre-blending and post-blending gamut_remap matrix supports at
>>>> the same time, set stream gamut_remap to MPC and plane gamut_remap to
>>>> DPP for DCN301 that support both.
>>>>
>>>> It was tested using IGT KMS color tests for DRM CRTC CTM property and it
>>>> preserves test results.
>>>>
>>>> Signed-off-by: Melissa Wen <mwen@igalia.com>
>>>> ---
>>>>  .../drm/amd/display/dc/dcn30/dcn30_hwseq.c    | 37 +++++++++++++++++++
>>>>  .../drm/amd/display/dc/dcn30/dcn30_hwseq.h    |  3 ++
>>>>  .../drm/amd/display/dc/dcn301/dcn301_init.c   |  2 +-
>>>>  3 files changed, 41 insertions(+), 1 deletion(-)


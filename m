Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F5970FEDA
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 21:57:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16FD110E611;
	Wed, 24 May 2023 19:57:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2080.outbound.protection.outlook.com [40.107.100.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85C6910E489;
 Wed, 24 May 2023 19:57:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cg2Y5lYMegd7QhVpZ4yBjjXINZWQujiZQctMbatcB4PvJtIuZSkOO9fhEujOViyNjWzPuW6hU6XSxDG6drdQ3dW+mixf+dgJ370kuP6Kjp5JxBQGmgiNCOwQuP3F0V44lJTIGaEuh58qp+dX1i+b75Jy0Fvt4Zwv7gmN32m0sUV4+SGGXTWneROOLCueExU625kDSMTRtxalKqz6G5W1dKRRLOjX9QZSI5wtFM6th8KoOMR5WwWpWUhWgEwTZgN6gnn3cYGbT/LkXDjViYTtNpxLoz+9pdzdcDTqHL1r21og2+QE8Bot/MoF49CLpVtZNKnH6SaItnWgQWm8zCrRYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mWgyyIQHzgoD8orLpkVvl9GE7eHFz+bwp9tEVU9imY8=;
 b=Og0Gal+MDyY0WKQtRORTlZr375+bwibPRGXbLWresapZbzNyh/Es1HruHUMNY1gw3/6lnofiyY9C+CFsjbsWU1iyoCLvkWHow7x95JGj9lfYvebDZpXV0WLPidb9u3DQUrR8tcFTMYkggP96IlDi2gw/N60kImvc8Grorc/8IC8aaFEn5JSQ2dkqcGqTrMmWZ883P0WnovO3EAlh8+msHnRtXkB9E28mGqzSaf4fIPEliKwKWfsalTe8WLPUJith0e0T1jN9hP9bYGNXTVXZ2ZHnKI5lNqSomRtqovwnoz0w8q1xo+jMHCR9IBxOjla5BMqKTBMZ786bHe9PN6IhWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mWgyyIQHzgoD8orLpkVvl9GE7eHFz+bwp9tEVU9imY8=;
 b=4aVS7/z9C1+6WW06/FhcXeB4bzJr7oSECJjm4y37zRBYgH0/VRfDoO01ruEOsIpVYWhiB90qJjNrEtlx66XdUQtGZMahEKj6wwWpz9nA79A4f/a8m16V8xl8/2pwF7cUxI1/+sM6iI8R5lB+HTFK4MhppfNuKFwxp1utAWyDxqg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 SA3PR12MB8764.namprd12.prod.outlook.com (2603:10b6:806:31f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Wed, 24 May
 2023 19:57:17 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::fe53:2742:10f9:b8f1]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::fe53:2742:10f9:b8f1%7]) with mapi id 15.20.6411.028; Wed, 24 May 2023
 19:57:16 +0000
Message-ID: <0774d3f5-6c8a-9737-ee58-4c0bd1ada9cb@amd.com>
Date: Wed, 24 May 2023 15:57:12 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] drm/amd/display: enable more strict compile checks
Content-Language: en-US
To: Harry Wentland <harry.wentland@amd.com>,
 Alex Deucher <alexdeucher@gmail.com>
References: <20230524191955.252212-1-hamza.mahfooz@amd.com>
 <CADnq5_Mz6aPFYGnr8J8C8UeTpbo7JDg+uvjqAxo7o4vmTGej2A@mail.gmail.com>
 <cede79cd-4986-ce3c-ab74-a4497e9e1230@amd.com>
 <f8cd7bc5-86c7-f113-f7a1-aec4bbf4aeb3@amd.com>
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <f8cd7bc5-86c7-f113-f7a1-aec4bbf4aeb3@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0123.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:87::28) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|SA3PR12MB8764:EE_
X-MS-Office365-Filtering-Correlation-Id: 633df9f6-4b39-43ad-98a4-08db5c911342
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZbLDKzz9TrmIWHkkqwYE3NJqxGfHl9295k5zmaZLa7IQXUyn5Ns+7xp0/+B7zy/Vg24UeEZx1mCjiNSk7w6dp/ohzwRjxYD9fPIXfGEhOxzAMgMgpN/IsJ9fLZfZy8hE/WRltZpFdpzdFwmS91jAuZZpGMVPk7bPIojxhpBBGMjQpX/ZJRrioLinjRLT1xFQdO3ohE6R0G9bzlEv8sCW1qd6ytF4m3eJ5JZUqlSopZ39Mr9Wcv3e73tIR0P9QQhZnFmg+k7BD3rezM3m1zTWa+QxF1t/GguTXO62z7krlSHsa4TxHZMwJ8uJyf/GeT8ucQRCdMRjViPGjvY0DH++x+LJTYG27ZRCgZd0VR02JduYKxoP3l/gVUz8qUzXQRhX2wJHJqAfasYVD/fVsInU4bYjDAWpZPiWLckV/c6NyWcMb4l/bHyb6gp7gTpN9cTC693PVcA5sksUd6PY/V2m5Th67/bqg+zvbQhKpAL9G4Gxpg5t9cOTwb1RfkwH0NvHc/yp25eNHJrzP5G8uUqWLcaTc55GjC/P00xQow1OKvZchJF+DTO7RC3mWGj55AK8hrWdDUENft3mRb9y4wMLcXieHHgq6U9HgXZJcRpCNnz6Fmu09mBr2xUtPmg7dxN05JPEjY/Wlh1w2oAdxa6H6g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(396003)(39860400002)(376002)(366004)(346002)(451199021)(26005)(38100700002)(83380400001)(6486002)(31696002)(6666004)(53546011)(6506007)(6512007)(186003)(86362001)(478600001)(110136005)(54906003)(31686004)(2616005)(4326008)(66556008)(66946007)(66476007)(316002)(44832011)(5660300002)(8936002)(8676002)(2906002)(41300700001)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1BaY3RHLzBOS1Rlakc0Kzk4NE56QS9NdFhiWkZtU3hpN3lDbHBFS2lsSmY1?=
 =?utf-8?B?c2ZQQzdaVVhaUnhSWnovSHNjbkxxdlBPUnNBdlZIN1lvTFN4V2Y0Z1pjTi9O?=
 =?utf-8?B?UWxPazVmdXJmV0xvZnRqd1doajdkVmR5U041VngyeDd5ZmNYYlhXTDV0L3pV?=
 =?utf-8?B?S2lwbWwwWVNvd1FZc0hmUTJhM01vT1dmcFNtUzBVS3BjZzdMdlo0Y1YwOThr?=
 =?utf-8?B?SDJpa1pSME1TZzdxVHlMVUUreVprOG5JK1pxWEVGeGNPVjBvTGxkbHppdjhl?=
 =?utf-8?B?THRJdnAwQjdhUFVqOHpUSFUrSXFIUlk1RVRJTjFHZnVXbzVISFVjTzJaYlo4?=
 =?utf-8?B?WllkbGY3VVlIZEFLL3JGMnFZRlluVlJUVTF6KzBNb0N4YkhUZDdSRjdDZHBD?=
 =?utf-8?B?Rm1LRG9uQnNhZkdhMm14TDc3UVo3NHpKRGlEUUIxcTdNUlY1WCtzSzZvek5l?=
 =?utf-8?B?M2JoWmtsTkFNc29nWmtscGNXOVI0NDUvUURSUlVRVjVTYnVzUWRoNjllajZn?=
 =?utf-8?B?Z0hic2h1SldDVVcyNUswMzcxYytxUGNtRWhzNHdtSERJckNyVjdFQ2ppZ1d2?=
 =?utf-8?B?YS9FeVRuSUNheThPRDEybGxaNE5kSG10ZEVwRENqMWloS2xXQlpIYjVPRTVR?=
 =?utf-8?B?TzcwYXVWdFFFWG9hOU8wdE1iaVp4RzEyQVNYV2F2S1ovV2NiN2JVTjF4dWVI?=
 =?utf-8?B?Zmgwb2pzZEtnWWdJME9iT2xYYTFqUi9NUm1aTzMvMytQdS90NVBNZ2RXaDhw?=
 =?utf-8?B?QnoyOStnVGFkTHEvYlJUTG82Ym50T3BwRXNiNkZ2WVM1UjArc01Hbmpaam1E?=
 =?utf-8?B?dUI1OStuZUUrdlhNQlUvVk5VdTBNcG9qM21yL1I0b2pVZlZsR2h5azhMQk9B?=
 =?utf-8?B?Wkk3T1kvemtTODRBL0JpeTFHdUk2eTVLNG1ZaTdOeEhDWS9BZDJYNWQxWncz?=
 =?utf-8?B?d0ppOHJCTHA0STBqVmNWY1pranNmcmt4cXlEZzJJY3lPWVg3MVVVUmc0akZT?=
 =?utf-8?B?NkVQZVhpRy9idjZBQ2hieTlFK2psV3dEbEg1MkV4MjNGMGFqZUs2NndaaVJP?=
 =?utf-8?B?ZHBkS3QxblJiQXR0NEpVZEpHSngvckVycHA2RS9oU21HdUF3bzh0Sm1lcnYx?=
 =?utf-8?B?ZTV3c2kxTGltVUlUaG83Ymp0VzNDcnJ2RnA0SThkUkdoUFBzeUpOVSs4SURk?=
 =?utf-8?B?WGJNbWYza3ZON3EyTUkxYnhrV1NyeFdMTUFLd09PTXJ2Wkg1WFF4MCt2eXBH?=
 =?utf-8?B?UFhUWmJBMHhLVzgraG1wL0J0anY2YVhBRVFJRWg1OEh5U284Z3FvUTIvYVhC?=
 =?utf-8?B?ZTNmS01MZTVsNGZqb25TcnVJMEMwbjVCdVhzbjhxVTBZalB5S2R5RFpxWklr?=
 =?utf-8?B?SDlycFI3MkZKSkV1TWcxUlljdk9Va01LaEZxVlVuaWhrcDN3RWxrOEt1bEwz?=
 =?utf-8?B?Mm9vM213M2JVejlpZDBsU0tna1J0WEpXbWZBMXZLZzVBbFlNcjZ0bXFFckg5?=
 =?utf-8?B?dW05dHN6ZGcxekUzd0Q1NnptdTFpUERGNjNTNzlhR3pYTkwyOTlRdkliV2Ru?=
 =?utf-8?B?WFJPSnJWeGhqRjFyRThsTDNRSzh3SEJzZlJwd2U5OHc5YWZYT2F1N1I2dGNC?=
 =?utf-8?B?WTNZU0V0QzdpR0ZBcElianRLSkJ4N3MrbHFDSEhNNjgwb05wY3pJVTEwK3VT?=
 =?utf-8?B?QnNHYXRzWVpCUktMemFvTWloaGdWckp2bkZhMmVVREg4cUJ1cERaOUcwcS81?=
 =?utf-8?B?VUJOS1NTZWZWVWpkdUlsc0piYTNjb3dENjN4NDE1T0JwbFdPUDdYdEpYRWdv?=
 =?utf-8?B?RWxmcEJVa0JrZkdPSVA0MzcwVXFkTjU5M1FvYzBESFFjTEtCNGlDYmU2Nmtu?=
 =?utf-8?B?dWFmZ08rRGFzUXBEZXV0NXY2dGJ5NWhqTXRackhSRGVyT3E4Sm1XakpRbTMw?=
 =?utf-8?B?aGkzR1lsdjk5bUFaRnNOMjR0dUJvUE5TUUZ4WFdMYnI1Nk5EeEpXQ21lbnpn?=
 =?utf-8?B?OFZHU1preWcrUUFRUmZZc3IyOGU3dzhrSWE1RUxsUERzS0QrTW54amhSclk5?=
 =?utf-8?B?Zjk5WWhuZGliVmdXdENOYzVTcnZkS0RtU01ORUpuVGRDYkdoalFqZ1c4Zk9F?=
 =?utf-8?Q?brk1Mku3kEZEmvbDF+XX4XWlX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 633df9f6-4b39-43ad-98a4-08db5c911342
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 19:57:16.7971 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nhq9bjKI76o6GLYmkuGdYKHuVv+e2c5GiJaZqlfqqaMvHnOyKDIRaMO7y4EGP7Ek9mSYChtLCNDQvKYOemqKRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8764
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
Cc: Leo Li <sunpeng.li@amd.com>, Kenny Ho <kenny.ho@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/24/23 15:54, Harry Wentland wrote:
> 
> 
> On 5/24/23 15:27, Hamza Mahfooz wrote:
>> On 5/24/23 15:22, Alex Deucher wrote:
>>> On Wed, May 24, 2023 at 3:20 PM Hamza Mahfooz <hamza.mahfooz@amd.com> wrote:
>>>>
>>>> Currently, there are quite a number of issues that are quite easy for
>>>> the CI to catch, that slip through the cracks. Among them, there are
>>>> unused variable and indentation issues. Also, we should consider all
>>>> warnings to be compile errors, since the community will eventually end
>>>> up complaining about them. So, enable -Werror, -Wunused and
>>>> -Wmisleading-indentation for all kernel builds.
>>>>
>>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>>> Cc: Harry Wentland <harry.wentland@amd.com>
>>>> Cc: Kenny Ho <kenny.ho@amd.com>
>>>> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
>>>> ---
>>>> v2: fix grammatical error
>>>> ---
>>>>    drivers/gpu/drm/amd/display/Makefile | 2 ++
>>>>    1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/display/Makefile b/drivers/gpu/drm/amd/display/Makefile
>>>> index 0d610cb376bb..3c44162ebe21 100644
>>>> --- a/drivers/gpu/drm/amd/display/Makefile
>>>> +++ b/drivers/gpu/drm/amd/display/Makefile
>>>> @@ -26,6 +26,8 @@
>>>>
>>>>    AMDDALPATH = $(RELATIVE_AMD_DISPLAY_PATH)
>>>>
>>>> +subdir-ccflags-y += -Werror -Wunused -Wmisleading-indentation
>>>> +
>>>
>>> Care to enable this for the rest of amdgpu as well?  Or send out an
>>> additional patch to do that?  Either way:
>>> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
>>
>> As far as I can tell, if `CONFIG_DRM_AMD_DC` is set it will run these
>> checks on at least the base driver code.
>>
> 
> It's probable best to put that into amdgpu/Makefile in that case.

I tried the following, but it doesn't seem to work:

diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile 
b/drivers/gpu/drm/amd/amdgpu/Makefile
index 74a9aa6fe18c..d97bde0796dc 100644
--- a/drivers/gpu/drm/amd/amdgpu/Makefile
+++ b/drivers/gpu/drm/amd/amdgpu/Makefile
@@ -39,6 +39,8 @@ ccflags-y := -I$(FULL_AMD_PATH)/include/asic_reg \
         -I$(FULL_AMD_DISPLAY_PATH)/amdgpu_dm \
         -I$(FULL_AMD_PATH)/amdkfd

+ccflags-y += -Werror -Wunused -Wmisleading-indentation
+
  amdgpu-y := amdgpu_drv.o

  # add KMS driver

> 
> Harry
> 
>>>
>>> Alex
>>>
>>>>    subdir-ccflags-y += -I$(FULL_AMD_DISPLAY_PATH)/dc/inc/
>>>>    subdir-ccflags-y += -I$(FULL_AMD_DISPLAY_PATH)/dc/inc/hw
>>>>    subdir-ccflags-y += -I$(FULL_AMD_DISPLAY_PATH)/dc/clk_mgr
>>>> -- 
>>>> 2.40.1
>>>>
> 
-- 
Hamza


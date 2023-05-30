Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2D3716BBB
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 19:58:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B08DC10E1A9;
	Tue, 30 May 2023 17:58:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E321710E0C5;
 Tue, 30 May 2023 17:58:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lg0NBF9k/4j+QW07cK/0+tZ6hrwoVbqTfANzoHKQZAolAJChau28wP8e1dI6LXItCBuzNWw9mYwCBzrblGWRvlnl7xr4HOBW4Ny1Iey8kjagM5HR0eXU1uVmRkJxzxp6XO6g5CGsI1gHubGKEcmEzQ8WLLTWm5cn4hFcPojRuAfEaqo9yceYwJMzmYz9bYZvGWqTCrR1X7Xoqj5J8GXtgMVyroWAVon5io2ZyHt4KnJrd9SAFFTJJpSSrtmSESFZo1OjtBenn9nTsgQeOGK9GFvyM7508/q1XDxYSdAZ4ZMu337liS16mLDgKJvBwrTnmRmnwPGNus5dJn58YU+Tlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EJPPqb/FpwB87psi7guXkkw/uzgYwrPq3QqcWSj4wS8=;
 b=NUuAAqyWCNXm2eOJcf3IxI5oThsjI7EzeBsB7j+yWkQJI4wIX2uBiO2U1h2qU/3YbhD6SybKWkjmHM4OLQq9pJTfItI8WjdiWY6TmxQFddkSFVISuhmeXbmG27YCl6azrPkrP/fwR0dJqxhX5E1pKnXfauUdhNYZFxrP2vNJ/y0PLAwpgBenwqHTEawk2N6seYTAphzLrvtcE5GdR86AeoEIqmxM9KPTg+vnBprok8NlrhQDdyyus6pO9wsQyWwy77MmmU/ZvWfu9BtZ48cVUv8GSRZ+O+ym8RPJV/ywOxHxpA1R9JM1BlZbj/RXGdcl6e9qlhls/vqupFk3A6NoQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EJPPqb/FpwB87psi7guXkkw/uzgYwrPq3QqcWSj4wS8=;
 b=NwT4sN2DkWT35FewzHbYwBi9gyWe6jjT2kVxqAoFApodpZOP6dTxF8OLo76Ca7zguNZo0oMVLCPqAe+R+UboA8QTJi6clNtRooxeSR/pmyQM7rYrxs1Ii3bPv2vFPQ9do1TBdi6GGm0V43ykfraXCLTfoF4Tn0FmC16jvLD3JcI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DS0PR12MB8788.namprd12.prod.outlook.com (2603:10b6:8:14f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 17:58:47 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e566:9ca5:28e0:a42b]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e566:9ca5:28e0:a42b%4]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 17:58:47 +0000
Message-ID: <eeddfcd6-c331-de38-8862-d6be997974c5@amd.com>
Date: Tue, 30 May 2023 19:58:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/2] drm/scheduler: avoid infinite loop if entity's
 dependency is a scheduled error fence
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>, ZhenGuo Yin <zhenguo.yin@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
References: <20230509102239.2935744-1-zhenguo.yin@amd.com>
 <20230509102239.2935744-2-zhenguo.yin@amd.com>
 <CADnq5_NbpWOhUWcKB8_4xdzs5gjMONQMYyuX7sfwvXjb=5TRyg@mail.gmail.com>
 <CADnq5_Nxqki-mCwp8SCuZmUDDFT-4YX_fsVSw1J=w0t=bKbjmQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CADnq5_Nxqki-mCwp8SCuZmUDDFT-4YX_fsVSw1J=w0t=bKbjmQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0171.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::16) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DS0PR12MB8788:EE_
X-MS-Office365-Filtering-Correlation-Id: d232ea03-9ba3-44db-0f2a-08db613783eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /xwJZguK6eicmzGO2x7SGMvl1hEjz03S+uHD7Sgj1Q7muD1XEttWCCBLBotuml1cTbHLylEaYpgyUQtitVdNzGBk4ENPg2hzyLhTzAGkKX0/lY9+Ux+aYBX4XQN8n+X3G2Cfm0xgiiZqVdsHXyPb5glC9RUz0QbxAwA+RA01hP0aKCAuAx8CU6ZbtLH5RrrqwWg4xb1UqdlRwL/hrKLmeCLb7BLlSA20wSDiQyQM74iGKoxmv3Ketpns0pqrs7aLIdeMx4rON/xhikaTiLe5Go7UoDqaP4Pu5/BOCU07SlkU81z0rCgAT6F1ttrau2Svfif+hUdm4YUur2FdoUJ8DLwUNbvB0gkZrr6B3/O1XNE973CkVFJf7kN+FQ8XNh1n55VA1cnGpnp68orUWG1jA+/k0WjYXfdhWPg8RKTBF23B5rLdIopAIUMHAIvREvfl55tTutzVlcV0yvXJG3pYw3j9FU4jXY7m2X/U7c2q0r+/bsoOOG/n6o3J3Ud1cZDyWr8AuWafqrQO9mi/Xz50lUZFndnuhXK+3DSYWVer7nduYSprVUhy3wvXXwsBLnKqAwHYEeMUrt0obEv7jW/0j6tQQHsicgne+A0o3bA3mJK65wPGQ1yrI+37wjGDzuRW03WDtA/IzeSUDVAyz95Z2g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(346002)(396003)(366004)(376002)(39860400002)(451199021)(478600001)(83380400001)(66574015)(5660300002)(186003)(4326008)(86362001)(6486002)(8936002)(2906002)(8676002)(316002)(31686004)(38100700002)(41300700001)(31696002)(6512007)(6666004)(6506007)(66946007)(110136005)(2616005)(66556008)(66476007)(53546011)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b1FuZXU2Y2dra2NVUDVHemRqMGt0TE1sNmZBeVZRNlV1SFp1TzZvZElpWUgz?=
 =?utf-8?B?a0tFVzd6RlFMU1d6NjhDZDZZZExQa0VxUi93MWhLRnZwMXh1QkVqL2NNcC9p?=
 =?utf-8?B?VlRrbTFNbVd4NHBrWjRlN245dEJHdjhaK3RxSUs0VXZzeTVrY3N5UUc3bzhH?=
 =?utf-8?B?Y0dLN08yVDU3bGNsWFRSQWx4UXRDSmpMSXNkKzBVdnRWbml2dHZoUDBSNlI4?=
 =?utf-8?B?TjdiUHNUdHJ6c3UvWWxHUzRJbDNlWmowTzlLRmJ4WFY5ZWpBRGROM3dpZjlu?=
 =?utf-8?B?ZmNIMC9uNGFoU05QNGdxNkdhZi9zaUpNa1lmcmN6OFhiT0VRWlRyZTQwUnYy?=
 =?utf-8?B?OVA4eWJPNWVDdG1uZjF3OVpNeTVCUkJzdnNNUDNEaXJ2dXh1T3lBQzIrbXU0?=
 =?utf-8?B?MmRVM1JxcUU3S1lWTzdQWk9ObjBRcHZ4VWxOUEczY0h3WkhzMEowMUZNOFJu?=
 =?utf-8?B?bXEvWUNib25Jam84SnRTVE5GMWQ0d01NMlYyUEZ1ZDBPVVFFSERocW0xbVF5?=
 =?utf-8?B?dytuM0JwM3ZISmdNbTVxT1J5c29XZDhTbTRQeHVpQnVZYmtRbllBbU93TjNS?=
 =?utf-8?B?UDBTeVFNelgzMmhCMDlJa1ZnMktaYlcveGptT09VUWU4OUN5QWJaT0dtV2t3?=
 =?utf-8?B?MEw5WFYvNkVSTlRyQlZObnJEdURubFdhRXVnT3lhK1FNd0orVHlrZDA4OTll?=
 =?utf-8?B?SjNkaGQ4MHQ4RE00Q0wrYmY2SjNRQzBIVWlUQ1ZCdVBUWjBYaTlPekJoa2tv?=
 =?utf-8?B?RHdQaS8yYXFYOEZRTXNxUVhrbGZHMjRyQjJhMVFDY0w5ZGNNaVZCUmoxdmc5?=
 =?utf-8?B?cEdhc0tLSjljQlcxMW1NTzY1SmpCb2Q3MkZhM3krR3hEUFlBdFBvSE1BU1pJ?=
 =?utf-8?B?UitIenhuaFgzRVVucFdtTU5ORllmUGJ4Vnh4OWFCTnJjUGQ1YWZld2xudTZI?=
 =?utf-8?B?bTZYdVlzaG1HdDlKblF1clhsa0JkNWFZTEJZeTBITThES3lWcDBwdXFWYU5i?=
 =?utf-8?B?bjduNGh3QzRZR05mbFJrUmdIT0QyNVFTK0cxSkNudUJyaWlzeXdMUkI5MW5M?=
 =?utf-8?B?U0JjanFKamdFeWtpL1M1NVRWSlh4WU1wbWVmdVNvWTcwb0VtVkF3aHVVQlV1?=
 =?utf-8?B?VmRqNWRubXoxMVI5S1FNVGcxQ3IzaHVGdEtqSmtQT1J0L2xlQTlDOS9SMGZi?=
 =?utf-8?B?RFdORmlWQ1NQakFPOTVnVmZ5OGtXUkFvWjdZVk9RcW9iRGxpYXZlaXMybito?=
 =?utf-8?B?dXUyZE1lak04MlZLSjgrdFpuV1A5dXZjR1BuOGdJOVNpRlBTYVRaSFZvTDZT?=
 =?utf-8?B?V21PVDRYNU1qNkJwaHZ5UHpaSGhYUDhFR3NQTzRxbGlXTXp4bERsVzVMclZr?=
 =?utf-8?B?UWJ1dHBmWk9MRzFKdStWblh5YWIzUS82MFpPV3F3cmQxRDllK2JhbzBwQ1V6?=
 =?utf-8?B?SEFkdk9IZEtHcmc3Zys0TVp4WFNqQy9VQkVyc0x2S3dUMCt3V3RNdFZCb1RV?=
 =?utf-8?B?UVJtaFkrdUdRY09WaW5xdEZtdWp3cVN2K3dVNWpDb0xjV1RZUWl1WlJkU2o0?=
 =?utf-8?B?WkFxUVM2S2I3b3BDS0tBNDJ4NVcyY3J4TjlHSzN1L0ZSV3F1MTF6MzNVZ3Qx?=
 =?utf-8?B?cU9NSU1lNFY0RHZUck1UazZiK3dmSU9KckdQUG5XTWluL1NrZjR0THR2V1dY?=
 =?utf-8?B?OGJVOHg0ZE5ML1JvaWpUVXk1QTI0KzhQejJyUG00UVJPTmlRUjVnQmEyZStD?=
 =?utf-8?B?UCsxcjJzSThYeHFnN01oU2ZWQTVNRnpMbjRobzEzN054dVZLU0MwRnUyZ09x?=
 =?utf-8?B?RDZmNGRURFJrRGxVM21QSFFUWUduUStZekZ5dG9ISHpRS1RTeHlZK093d1dw?=
 =?utf-8?B?ODFNeUZ0SkVLNWVhRUFoQ0pXbkExL3FaTm9kaDlWSFlsOFRhOExQZG1hT0x4?=
 =?utf-8?B?Q0tMNVF4NzdIWWlmeEZHRUY0L3B1bU1sUTlneW5zN3AvL24wYWdmQ09sSlVB?=
 =?utf-8?B?WmxpdmFkNUNQKzhtVXdOZzljNS91WGxqL3R5TjdwY1I3K1UyQjJRbEV6VDUw?=
 =?utf-8?B?dkdIWWVJTGhzaHhtdHhxWGpGQ29NVmRHZldLRFltSFRTVmpoS1dXeUpqYzQx?=
 =?utf-8?B?ajFScE1pK212NmZHMzVEY1h3T21ybnphMzVMTVoxVXNPWXJZdXBUY2ZXaDZJ?=
 =?utf-8?Q?7G9epmPxTb3f9eJRAhVAPy+zKX3G1yIbDHk/zo3oNgRh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d232ea03-9ba3-44db-0f2a-08db613783eb
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 17:58:47.0308 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nhPmngUuCpF7gTEbUiOQJlEmvtrJ9izDL5wn0PB3AvdJrOF8BkQUta9iWB/SpqV5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8788
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
Cc: monk.liu@amd.com, jingwen.chen@amd.com, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 17.05.23 um 23:01 schrieb Alex Deucher:
> On Wed, May 17, 2023 at 11:02 AM Alex Deucher <alexdeucher@gmail.com> wrote:
>> + dri-devel for scheduler
>>
>> On Tue, May 9, 2023 at 6:23 AM ZhenGuo Yin <zhenguo.yin@amd.com> wrote:
>>> [Why]
>>> drm_sched_entity_add_dependency_cb ignores the scheduled fence and return false.
>>> If entity's dependency is a schedulerd error fence and drm_sched_stop is called
> typo: schedulerd -> scheduler
>
>>> due to TDR, drm_sched_entity_pop_job will wait for the dependency infinitely.
>>>
>>> [How]
>>> Do not wait or ignore the scheduled error fence, add drm_sched_entity_wakeup
>>> callback for the dependency with scheduled error fence.
>>>
>>> Signed-off-by: ZhenGuo Yin <zhenguo.yin@amd.com>
> The series looks good to me, but it would be good to have Christian
> take a look as well.  Series is:
> Acked-by: Alex Deucher <alexander.deucher@amd.com>

With Alex comments fixes Reviewed-by: Christian König 
<christian.koenig@amd.com>.

But Luben should probably push the patches upstream through drm-misc-next.

Christian.

>
>>> ---
>>>   drivers/gpu/drm/scheduler/sched_entity.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
>>> index d3f4ada6a68e..96e173b0a6c6 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>> @@ -384,7 +384,7 @@ static bool drm_sched_entity_add_dependency_cb(struct drm_sched_entity *entity)
>>>          }
>>>
>>>          s_fence = to_drm_sched_fence(fence);
>>> -       if (s_fence && s_fence->sched == sched &&
>>> +       if (!fence->error && s_fence && s_fence->sched == sched &&
>>>              !test_bit(DRM_SCHED_FENCE_DONT_PIPELINE, &fence->flags)) {
>>>
>>>                  /*
>>> --
>>> 2.35.1
>>>


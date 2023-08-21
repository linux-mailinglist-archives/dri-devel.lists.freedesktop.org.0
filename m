Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D384782BBF
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 16:28:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D91710E277;
	Mon, 21 Aug 2023 14:27:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2070.outbound.protection.outlook.com [40.107.93.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8330110E26F;
 Mon, 21 Aug 2023 14:27:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g0xa3eeiWmX7cIx4LiXIwa/T3kVizMaMUTI8HrVYANgjWCWk8pifZxjMtf1+8eHBi4EObl/GxMomcF4dOBpsl5Z0FYN/G00QOavlBqdb97TuYk9ZL0oIK/4unF3SPuSnG77g/6G2pCP1aLnK9KcxND0Z1FQk5mkNa05Lr860Re15dFc5qMvtvuwNEemgLZT3NnS8tXL0aSVHAfCVN/jxi9l1znn54yCF4kmxAdRg2eXSMElKq12UevhhIonbvQnDsVlG0jtfQxLMeP6ytgJ4J4P6F2VBy5PgqPWtU0IVT5XLWQfIPHyHoNZKRLkNnOL8ETo6MLOwlW5emOLcA/By/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G1+P7ma9q7NSHXmUeO0hY7zPF5hXccPZ/Vl45KIZuio=;
 b=Qz1qGkZ7mgRQMHq7VuKFZnXK9xx/OJ1yIpXe6Ktt5LRQDba2b+tkZOWdjJreaOgQlt/bRzq8BCRFx04KrbFEP5E0KW6clsVO4Qdj0G9KFjXeDAq9yHE5wLeKVVLBC0wADQP1Z5b7GYD6hZ0zs5g8xNPDvaqgcPvRQ4qdWkNxn9aLtmMoJMQM0VOAgq0kfgb+mUDHKA/KgUpbW8g8lQ7CphcoVwgSo9s9VZX+Zcam0u17CoqEtZmkp2Q5KnnU4ncQIehzV64DBlkxkcq3vsG4CWsXo8Upp4FSbV8NaRdInhpfA6jYeWexcN46H8u+LfuL9BFVfVtib2hiaoq0fPAv0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G1+P7ma9q7NSHXmUeO0hY7zPF5hXccPZ/Vl45KIZuio=;
 b=SP90TZKV0Af1RRU/idw14zclRaU2MbGcrMVuiGrVNqxEgYwz55msauxn1+XJ2xyUkjxMOVXBkgL7KUZcqg3cqXjycwMlkb6fQ55Lw3CviEDOQjBS6Ux2XxsHz0PtC1Ev8sctrYp7gbeg1RKNqySmPa7k8Qibt6W0LPw4BSqf55Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW4PR12MB5667.namprd12.prod.outlook.com (2603:10b6:303:18a::10)
 by DM4PR12MB5294.namprd12.prod.outlook.com (2603:10b6:5:39e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Mon, 21 Aug
 2023 14:27:55 +0000
Received: from MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::dc06:ffb3:46ec:6b86]) by MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::dc06:ffb3:46ec:6b86%3]) with mapi id 15.20.6699.022; Mon, 21 Aug 2023
 14:27:54 +0000
Message-ID: <ce6fa70b-63e8-507e-f404-3d40675e9e74@amd.com>
Date: Mon, 21 Aug 2023 16:27:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 1/7] drm/amdgpu: Added init/fini functions for workload
Content-Language: en-US
To: "Yadav, Arvind" <arvyadav@amd.com>, Arvind Yadav <Arvind.Yadav@amd.com>,
 Christian.Koenig@amd.com, alexander.deucher@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, Felix.Kuehling@amd.com,
 amd-gfx@lists.freedesktop.org
References: <20230821064759.94223-1-Arvind.Yadav@amd.com>
 <20230821064759.94223-2-Arvind.Yadav@amd.com>
 <3e20b067-c02a-1911-cac9-3e547a14b565@amd.com>
 <90f7c142-3372-536f-accc-a04baaf9f666@amd.com>
 <2d5e672a-aebc-0972-1f7d-2668e26e7198@amd.com>
 <c3de920a-9630-c26a-e418-f42d3572509b@amd.com>
From: Shashank Sharma <shashank.sharma@amd.com>
In-Reply-To: <c3de920a-9630-c26a-e418-f42d3572509b@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0224.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:88::10) To MW4PR12MB5667.namprd12.prod.outlook.com
 (2603:10b6:303:18a::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB5667:EE_|DM4PR12MB5294:EE_
X-MS-Office365-Filtering-Correlation-Id: 37be26aa-b7fa-4d30-14bd-08dba252cee5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: evJLRKYtM7cFgJraJfiPtIRghL6Am0Ff2XKb3blvhs0jtVVUOemp2yW/ToKaMlLwMUnoYhT1GXatBFBm/BX/YaA0sP1kAU+BSg4d00S08QpQpRlS5U039y5dfUK7CoOErVo+K9XY+U4RNr6WXEbOqVHBHq4SDk+xxGJkNM5cZ8ABfB/6xaQEJ1+L6gabyIqfNj4a4J9AauCrKwHjeR6bU9mbyX0aYnNRetXQtmj+YAgsUorxI4mcD1RA0HNzvamhj4Br1p9XR9mfx1+RPjOpw4PoInSJZL/cRfweKv30yrd+acDNKEgafrmN/rMdlN0HsETLzKlaY3dNWCqWhyiDngAeCvloyv+WB4rIIKqrmIrSztXIUOpHfRo4PlxOLRtjssC9mFbIg2Hq5gTkQ+OUmW4A56Xk6uEZ6GIeVynGvVA0Wm9GjL+enO9znlLQ20MRxc4TeyOrB3oSQ2xObgmwAYSs2ilueN5bXeuFhZsgoo2zpqJdk+vSXtKR79p5LV0BUcp1sKeZO+UJzAJTr3y10k+/asURzTPVvE5YI2RLYtIssm4tY0MFSHl3Wueqio65hoKUc5+3DMxXAMVQBuFRnnfRhKUfG338OnaBn9CBPmyrYKbXWSW22ROoKFPBPF4hu8O+Kq51/YW73Voy1nF1SfiehL3OSLElt3kLzE/FSzg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR12MB5667.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(39860400002)(376002)(136003)(396003)(451199024)(186009)(1800799009)(2906002)(30864003)(45080400002)(53546011)(38100700002)(6506007)(6486002)(83380400001)(5660300002)(44832011)(26005)(86362001)(31686004)(31696002)(8676002)(2616005)(8936002)(4326008)(316002)(66946007)(6512007)(66556008)(66476007)(110136005)(66899024)(478600001)(921005)(6666004)(36756003)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1pLdStJaTU2UG9IZ0FndlNKbTRPVmg1VFdteXhndDV0bmUyQTd2bnFxQktS?=
 =?utf-8?B?SzE5cjNtMG9LVCthRjFFcVE1OFN5WkphUzRXYkRmd0doT0lIcExRbWE3c3FN?=
 =?utf-8?B?QTZQc0tQdGllcDJoWFZrZzcrZWU0dmtrenB1SUpVeXN2RzIrMEU2SkFQNmd0?=
 =?utf-8?B?ZEpEaUt0N2c1cEd4MCtUZlBHbTU2WE53THc4ZnROTG9iSmJqVFQ2NkgvU2FJ?=
 =?utf-8?B?KzE4RDRQY21UOUVWRUJUcm9ncC82dWJUYVJrUXVMQkJBYW5IcVkwTG5MZlov?=
 =?utf-8?B?WGQwTXpPTzFjZWIrMjFUYWlsT0szenpkaDZRMExsVUttV0NIWXBFVnVpNStq?=
 =?utf-8?B?dFdsWkU4bUVuVit4cnh2L054clNkUC9DeUFOT1BKcGJiVlo3VnR2QkVUM3kz?=
 =?utf-8?B?UW0ydzcwSUNWUUk0NVRaRjFrMUxTV2tVbHdKWWdwc0cxa0NRV2hNU25SZkFx?=
 =?utf-8?B?Qzc4NzVYWTdzbmtTd3RGeW9LaFBZMzVhMEUyTHRta2NLQmJsbUZiRElNZkpv?=
 =?utf-8?B?aFBmU2NnUGYzSDdkbUdPekNKVUFVMmpxQ2o4OXpWL2Voam5ST2dtTWlSMlJv?=
 =?utf-8?B?Z3I0a3RlcTUwdE0zaE9QSG5uRXZkWC9VeXpqMXBENUM1RVF5TFZHSnhaWkd4?=
 =?utf-8?B?Zm5ORG1CemxDMVo1d2thSXZUTDFuZ01tL2NIUHVDVzhsVjZraThrTFVIT0xy?=
 =?utf-8?B?QVVZaVdxSXhrbHROU0J6dmJJVUcyMU1hS050K1NtY1ZJcFA0ZVhaSWxJM2JD?=
 =?utf-8?B?VFRUQ0t3dGo3S3VhSjM0MzVCUnlTbW4xOHJNK3hwcmRWRjhJR3E1Y2JEQ2NS?=
 =?utf-8?B?SHlPSGRzSmR4M1g5dkdCNkh3ZXJrZnlsNnhaa3VSQXRRVnJzVjVXdWphSVp2?=
 =?utf-8?B?R2VldnlVSkNBWHNHdXlLMzMvL1ljWW5pVEp4WTUwMUUzSWd3K0lmejNjTUlP?=
 =?utf-8?B?VzJhYWhncXVzZ2kyNFBrZFdKam1MMFpTRENhcUdKNmN0NFhmT0QxWlFrY09x?=
 =?utf-8?B?Ky9KQU1BNnFIemF2UjFXNURWNjlReEM3OUhDQlBlNVExK09XbEpUcWliZEtG?=
 =?utf-8?B?azNyRjI3RCt0Sjd5ckxvYVh4eXN3bkM1VnZzODBmTlhYamt6Z01XMjZ3RmFn?=
 =?utf-8?B?aXgwdENmUEVRN0VkclRNalU5alBmOXFWS0JkTlN1NDNLWFJxdHNHV3JUNENa?=
 =?utf-8?B?QXNEUzlhdGM0a3QxNDB2T0w2QTJFcmZRbE5FNkhIOHZrYUNCMGxqZ3dsa0Fn?=
 =?utf-8?B?czZGTGJtUnl6L1diT1FOV3B4TzM0MFFzaU1xLzJzTEVCTTVDaVRFUVJyWllE?=
 =?utf-8?B?SFRPbWI4NldTMjJPOGh6aGVJMzVKY2I5UnY4L1pRMGx3eDJZZVR0V2FVRmxP?=
 =?utf-8?B?R0dQNHcrQmQvM2UwYVZCak9nbTFndW9Jd0M5YU84SllITS93S3NkZ0EvT2cw?=
 =?utf-8?B?NGNCR1BrQmVIVG5meEhxM096ZkJRMTVUOTZVQXc0cm5vOWE2YlpTcnZGUUNE?=
 =?utf-8?B?QjNUb0hTUm9hQWVYajdwRnRnUUUyd2U2c1VzMmpKYTZId1V4RXNOSVRlc2tJ?=
 =?utf-8?B?S2hMeFRaM0FnQ3JlT0Y4eFlsOTZ2VHQ1L1NQMFgxeU5lcjVxUlUvRXRjZm9h?=
 =?utf-8?B?elJUeW1rcHo2VEpNSkxvbzZVdVhVdlY2UmlsUDlNOFlXZjRUNXVPdm83MG5E?=
 =?utf-8?B?dHFiOXNHci91c2swSE5JS1dPZ0dGc1dldkViQnYrMGR5TW1VR2RXdkhKRzJi?=
 =?utf-8?B?aXpMMTFudGhJQXB1OHdEVW50OGY0ZlRYeDJSWVQyM2FWK1lxSERQSjAyTjNl?=
 =?utf-8?B?S2dBY0p0eHZKaFQ5cm5XSGdkeHptUEdpYTNIQkpXKzFmNFhRblB0alVwSW1V?=
 =?utf-8?B?SnRBV3RwWk5hWEtDQ2dyUnBNdmZqbjNoQUNZT1kvWWJ1U1ZoY2ttakt3OHBi?=
 =?utf-8?B?bTFudWVzMmppSGorYWNFMk1obWdMMlZEZng4ajk0ZE8vb3lOSDVtM3RWV0l3?=
 =?utf-8?B?bnpnZTlSam1rbnZuYlZYNysvNXUvQ3VlMnVqRWZtaVAzS21uT0dNSDFyUmZ1?=
 =?utf-8?B?UFZZUHBhNll4NzJyQit5d0I1d20wai9MOVgxT2NNa3dlenRNR3QyL29YdDEx?=
 =?utf-8?Q?VrZSeheWVG+dNkZfKW3cruJUE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37be26aa-b7fa-4d30-14bd-08dba252cee5
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB5667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 14:27:54.8423 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jWExaTMhzZ67acJbekeBdLrL+BzYUtIB0MW44F7hU9Dqf2RDCCBYKdr7nbMTwyQ6LtBp1dqXpBo5CfJPVs5Wew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5294
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 21/08/2023 16:12, Yadav, Arvind wrote:
>
> On 8/21/2023 7:24 PM, Shashank Sharma wrote:
>>
>> On 21/08/2023 15:35, Yadav, Arvind wrote:
>>>
>>> On 8/21/2023 6:36 PM, Shashank Sharma wrote:
>>>> Hey Arvind,
>>>>
>>>> On 21/08/2023 08:47, Arvind Yadav wrote:
>>>>> The'struct amdgpu_smu_workload' initialization/cleanup
>>>>> functions is added by this patch.
>>>>>
>>>>> v2:
>>>>> - Splitting big patch into separate patches.
>>>>> - Added new fini function.
>>>>>
>>>>> Cc: Shashank Sharma <shashank.sharma@amd.com>
>>>>> Cc: Christian Koenig <christian.koenig@amd.com>
>>>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>>>> Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
>>>>> ---
>>>>>   drivers/gpu/drm/amd/amdgpu/Makefile           |  2 +-
>>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu.h           |  3 ++
>>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  4 ++
>>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c  | 44 +++++++++++++++
>>>>>   drivers/gpu/drm/amd/include/amdgpu_workload.h | 53 
>>>>> +++++++++++++++++++
>>>>>   5 files changed, 105 insertions(+), 1 deletion(-)
>>>>>   create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
>>>>>   create mode 100644 drivers/gpu/drm/amd/include/amdgpu_workload.h
>>>>>
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile 
>>>>> b/drivers/gpu/drm/amd/amdgpu/Makefile
>>>>> index 415a7fa395c4..6a9e187d61e1 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/Makefile
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/Makefile
>>>>> @@ -60,7 +60,7 @@ amdgpu-y += amdgpu_device.o amdgpu_kms.o \
>>>>>       amdgpu_umc.o smu_v11_0_i2c.o amdgpu_fru_eeprom.o amdgpu_rap.o \
>>>>>       amdgpu_fw_attestation.o amdgpu_securedisplay.o \
>>>>>       amdgpu_eeprom.o amdgpu_mca.o amdgpu_psp_ta.o amdgpu_lsdma.o \
>>>>> -    amdgpu_ring_mux.o
>>>>> +    amdgpu_ring_mux.o amdgpu_workload.o
>>>>>     amdgpu-$(CONFIG_PROC_FS) += amdgpu_fdinfo.o
>>>>>   diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h 
>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>>>> index 02b827785e39..1939fa1af8a6 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>>>> @@ -107,6 +107,7 @@
>>>>>   #include "amdgpu_fdinfo.h"
>>>>>   #include "amdgpu_mca.h"
>>>>>   #include "amdgpu_ras.h"
>>>>> +#include "amdgpu_workload.h"
>>>>>     #define MAX_GPU_INSTANCE        16
>>>>>   @@ -1050,6 +1051,8 @@ struct amdgpu_device {
>>>>>         bool                            job_hang;
>>>>>       bool                            dc_enabled;
>>>>> +
>>>>> +    struct amdgpu_smu_workload    smu_workload;
>>>>>   };
>>>>>     static inline struct amdgpu_device *drm_to_adev(struct 
>>>>> drm_device *ddev)
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c 
>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>> index 5c7d40873ee2..cd3bf641b630 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>> @@ -2243,6 +2243,8 @@ static int 
>>>>> amdgpu_device_ip_early_init(struct amdgpu_device *adev)
>>>>>       adev->cg_flags &= amdgpu_cg_mask;
>>>>>       adev->pg_flags &= amdgpu_pg_mask;
>>>>>   +    amdgpu_workload_profile_init(adev);
>>>>> +
>>>>>       return 0;
>>>>>   }
>>>>>   @@ -2890,6 +2892,8 @@ static int amdgpu_device_ip_fini(struct 
>>>>> amdgpu_device *adev)
>>>>>   {
>>>>>       int i, r;
>>>>>   +    amdgpu_workload_profile_fini(adev);
>>>>> +
>>>>>       if (amdgpu_sriov_vf(adev) && adev->virt.ras_init_done)
>>>>>           amdgpu_virt_release_ras_err_handler_data(adev);
>>>>>   diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c 
>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
>>>>> new file mode 100644
>>>>> index 000000000000..32166f482f77
>>>>> --- /dev/null
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
>>>>> @@ -0,0 +1,44 @@
>>>>> +// SPDX-License-Identifier: MIT
>>>>> +/*
>>>>> + * Copyright 2023 Advanced Micro Devices, Inc.
>>>>> + *
>>>>> + * Permission is hereby granted, free of charge, to any person 
>>>>> obtaining a
>>>>> + * copy of this software and associated documentation files (the 
>>>>> "Software"),
>>>>> + * to deal in the Software without restriction, including without 
>>>>> limitation
>>>>> + * the rights to use, copy, modify, merge, publish, distribute, 
>>>>> sublicense,
>>>>> + * and/or sell copies of the Software, and to permit persons to 
>>>>> whom the
>>>>> + * Software is furnished to do so, subject to the following 
>>>>> conditions:
>>>>> + *
>>>>> + * The above copyright notice and this permission notice shall be 
>>>>> included in
>>>>> + * all copies or substantial portions of the Software.
>>>>> + *
>>>>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY 
>>>>> KIND, EXPRESS OR
>>>>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
>>>>> MERCHANTABILITY,
>>>>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO 
>>>>> EVENT SHALL
>>>>> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, 
>>>>> DAMAGES OR
>>>>> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR 
>>>>> OTHERWISE,
>>>>> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE 
>>>>> USE OR
>>>>> + * OTHER DEALINGS IN THE SOFTWARE.
>>>>> + *
>>>>> + */
>>>>> +
>>>>> +#include "amdgpu.h"
>>>>> +
>>>>> +void amdgpu_workload_profile_init(struct amdgpu_device *adev)
>>>>> +{
>>>>> +    adev->smu_workload.adev = adev;
>>>>> +    adev->smu_workload.submit_workload_status = 0;
>>>>> +    adev->smu_workload.initialized = true;
>>>> why do we need this variable ?
>>>
>>> Hi Shashank,
>>>
>>> If any error comes while the device is booting then amdgpu will 
>>> start unloading everything.
>>> So I am using 'initialized' for unloading a driver successfully. 
>>> This variable is to identify that the driver is loaded or not.
>>
>> I am not sure if I am getting this right. This variable is only 
>> getting used in this patch here, just being set and reset.
>>
>> How does this flag help us ? I guess if AMDGPU driver is getting 
>> unloaded we already know that we can't set power profile.
>>
> We are setting "initialized = true" and checking in 
> amdgpu_workload_profile_fini() that 'initialized' is set or not set 
> because
> amdgpu_workload_profile_fini() is destroying mutex and same for 
> delayed work which I have implemented in patch 0003.
>
> In the below error case where amdgpu_workload_profile_init() was not 
> called because psp firmware failed to load but amdgpu driver is
> calling all unload function as well amdgpu_workload_profile_fini().

Ah, makes sense.

With the minor comments fixed below, please feel free to use:

Reviewed-by: Shashank Sharma <shashank.sharma@amd.com>

- Shashank

>
> ThankYou
> ~Arvind
>
>> - Shashank
>>
>>>
>>> This is the below error for which the amdgpu driver is unloading 
>>> when it is not getting firmware.
>>>
>>> [   12.421609] amdgpu 0000:08:00.0: Direct firmware load for 
>>> amdgpu/renoir_ta.bin failed with error -2
>>> [   12.421618] [drm:amdgpu_device_init [amdgpu]] *ERROR* early_init 
>>> of IP block <psp> failed -19
>>> [   12.428207] [drm] VCN decode is enabled in VM mode
>>> [   12.428212] [drm] VCN encode is enabled in VM mode
>>> [   12.430925] [drm] JPEG decode is enabled in VM mode
>>> [   12.430931] amdgpu 0000:08:00.0: amdgpu: Fatal error during GPU init
>>> [   12.431184] amdgpu 0000:08:00.0: amdgpu: amdgpu: finishing device.
>>> [   12.431296] ------------[ cut here ]------------
>>> [   12.431297] WARNING: CPU: 3 PID: 438 at kernel/workqueue.c:3379 
>>> __flush_work+0x22f/0x240
>>> [   12.431305] Modules linked in: ledtrig_audio snd_hda_codec_hdmi 
>>> snd_hda_intel snd_intel_dspcfg snd_intel_sdw_acpi snd_hda_codec 
>>> snd_hda_core amdgpu(OE+) snd_hwdep snd_pcm kvm snd_seq_midi 
>>> snd_seq_midi_event drm_exec amdxcp snd_rawmidi iommu_v2 
>>> crct10dif_pclmul drm_buddy gpu_sched ghash_clmulni_intel 
>>> sha512_ssse3 snd_seq drm_suballoc_helper aesni_intel drm_ttm_helper 
>>> binfmt_misc crypto_simd snd_seq_device ttm cryptd snd_timer 
>>> drm_display_helper input_leds rapl joydev cec wmi_bmof rc_core snd 
>>> drm_kms_helper k10temp ccp soundcore mac_hid sch_fq_codel msr 
>>> parport_pc ppdev lp parport ramoops reed_solomon drm pstore_blk 
>>> pstore_zone efi_pstore ip_tables x_tables autofs4 hid_generic usbhid 
>>> hid crc32_pclmul nvme igb ahci i2c_piix4 xhci_pci i2c_algo_bit 
>>> nvme_core libahci xhci_pci_renesas dca video wmi
>>> [   12.431360] CPU: 3 PID: 438 Comm: systemd-udevd Tainted: G        
>>> W  OE      6.5.0-rc2-custom #1
>>> [   12.431362] Hardware name: Gigabyte Technology Co., Ltd. X570 
>>> AORUS ELITE/X570 AORUS ELITE, BIOS F34 06/10/2021
>>> [   12.431364] RIP: 0010:__flush_work+0x22f/0x240
>>> [   12.431367] Code: 8b 43 30 48 8b 53 40 89 c1 e9 f9 fe ff ff 4c 89 
>>> f7 e8 45 0b db 00 e8 90 f5 08 00 45 31 ff e9 11 ff ff ff 0f 0b e9 0a 
>>> ff ff ff <0f> 0b 45 31 ff e9 00 ff ff ff e8 02 a0 d9 00 66 90 90 90 
>>> 90 90 90
>>> [   12.431368] RSP: 0018:ffffb0668156f818 EFLAGS: 00010246
>>> [   12.431370] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 
>>> 0000000000000000
>>> [   12.431371] RDX: 0000000000000001 RSI: 0000000000000001 RDI: 
>>> ffff9cea492c7840
>>> [   12.431372] RBP: ffffb0668156f890 R08: 0000000000000000 R09: 
>>> ffffb0668156f7a0
>>> [   12.431372] R10: 0000000000000001 R11: 0000000000000001 R12: 
>>> ffff9cea492c7840
>>> [   12.431373] R13: 0000000000000001 R14: ffff9cea43839940 R15: 
>>> 0000000000000001
>>> [   12.431374] FS:  00007fde83c18880(0000) GS:ffff9cf15e2c0000(0000) 
>>> knlGS:0000000000000000
>>> [   12.431375] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>> [   12.431376] CR2: 00007f2648000010 CR3: 00000001059e2000 CR4: 
>>> 0000000000350ee0
>>> [   12.431377] Call Trace:
>>> [   12.431379]  <TASK>
>>> [   12.431384]  ? show_regs+0x68/0x70
>>> [   12.431388]  ? __flush_work+0x22f/0x240
>>> [   12.431389]  ? __warn+0x8f/0x150
>>> [   12.431392]  ? __flush_work+0x22f/0x240
>>> [   12.431394]  ? report_bug+0x1f5/0x200
>>> [   12.431399]  ? handle_bug+0x46/0x80
>>> [   12.431402]  ? exc_invalid_op+0x19/0x70
>>> [   12.431404]  ? asm_exc_invalid_op+0x1b/0x20
>>> [   12.431408]  ? __flush_work+0x22f/0x240
>>> [   12.431410]  ? irq_work_queue+0x10/0x60
>>> [   12.431414]  ? __wake_up_klogd.part.0+0x5a/0x80
>>> [   12.431419]  __cancel_work_timer+0x124/0x1b0
>>> [   12.431421]  ? _printk+0x58/0x80
>>> [   12.431423]  cancel_delayed_work_sync+0x13/0x20
>>> [   12.431427]  amdgpu_workload_profile_fini+0x25/0x40 [amdgpu]
>>> [   12.431854]  amdgpu_device_fini_sw+0x33/0x550 [amdgpu]
>>> [   12.432035]  amdgpu_driver_release_kms+0x16/0x30 [amdgpu]
>>> [   12.432213]  drm_dev_release+0x28/0x50 [drm]
>>> [   12.432256]  devm_drm_dev_init_release+0x38/0x60 [drm]
>>> [   12.432278]  devm_action_release+0x15/0x20
>>> [   12.432283]  release_nodes+0x40/0xc0
>>> [   12.432285]  devres_release_all+0x9e/0xe0
>>> [   12.432286]  device_unbind_cleanup+0x12/0x80
>>> [   12.432289]  really_probe+0x116/0x3e0
>>> [   12.432291]  __driver_probe_device+0x7e/0x170
>>> [   12.432293]  driver_probe_device+0x23/0xa0
>>> [   12.432295]  __driver_attach+0xc5/0x190
>>> [   12.432297]  ? __pfx___driver_attach+0x10/0x10
>>> [   12.432299]  bus_for_each_dev+0x7c/0xd0
>>> [   12.432302]  driver_attach+0x1e/0x30
>>> [   12.432304]  bus_add_driver+0x11c/0x220
>>> [   12.432306]  driver_register+0x64/0x130
>>> [   12.432309]  ? __pfx_amdgpu_init+0x10/0x10 [amdgpu]
>>> [   12.432491]  __pci_register_driver+0x68/0x70
>>> [   12.432494]  amdgpu_init+0x63/0xff0 [amdgpu]
>>> [   12.432667]  do_one_initcall+0x48/0x310
>>> [   12.432671]  ? kmalloc_trace+0x2a/0xa0
>>> [   12.432675]  do_init_module+0x6a/0x260
>>> [   12.432677]  load_module+0x1db3/0x2050
>>> [   12.432681]  init_module_from_file+0x9c/0xe0
>>> [   12.432682]  ? init_module_from_file+0x9c/0xe0
>>> [   12.432685]  idempotent_init_module+0x179/0x230
>>> [   12.432687]  __x64_sys_finit_module+0x5d/0xb0
>>> [   12.432689]  do_syscall_64+0x3b/0x90
>>> [   12.432691]  entry_SYSCALL_64_after_hwframe+0x6e/0xd8
>>>
>>>>> +
>>>>> +    mutex_init(&adev->smu_workload.workload_lock);
>>>>> +}
>>>>> +
>>>>> +void amdgpu_workload_profile_fini(struct amdgpu_device *adev)
>>>>> +{
>>>>> +    if (!adev->smu_workload.initialized)
>>>>> +        return;
>>>>> +
>>>>> +    adev->smu_workload.submit_workload_status = 0;
>>>>> +    adev->smu_workload.initialized = false;
>>>>> + mutex_destroy(&adev->smu_workload.workload_lock);
>>>>> +}
>>>>> diff --git a/drivers/gpu/drm/amd/include/amdgpu_workload.h 
>>>>> b/drivers/gpu/drm/amd/include/amdgpu_workload.h
>>>>> new file mode 100644
>>>>> index 000000000000..5d0f068422d4
>>>>> --- /dev/null
>>>>> +++ b/drivers/gpu/drm/amd/include/amdgpu_workload.h
>>>>> @@ -0,0 +1,53 @@
>>>>> +/* SPDX-License-Identifier: MIT */
>>>>> +/*
>>>>> + * Copyright 2023 Advanced Micro Devices, Inc.
>>>>> + *
>>>>> + * Permission is hereby granted, free of charge, to any person 
>>>>> obtaining a
>>>>> + * copy of this software and associated documentation files (the 
>>>>> "Software"),
>>>>> + * to deal in the Software without restriction, including without 
>>>>> limitation
>>>>> + * the rights to use, copy, modify, merge, publish, distribute, 
>>>>> sublicense,
>>>>> + * and/or sell copies of the Software, and to permit persons to 
>>>>> whom the
>>>>> + * Software is furnished to do so, subject to the following 
>>>>> conditions:
>>>>> + *
>>>>> + * The above copyright notice and this permission notice shall be 
>>>>> included in
>>>>> + * all copies or substantial portions of the Software.
>>>>> + *
>>>>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY 
>>>>> KIND, EXPRESS OR
>>>>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
>>>>> MERCHANTABILITY,
>>>>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO 
>>>>> EVENT SHALL
>>>>> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, 
>>>>> DAMAGES OR
>>>>> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR 
>>>>> OTHERWISE,
>>>>> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE 
>>>>> USE OR
>>>>> + * OTHER DEALINGS IN THE SOFTWARE.
>>>>> + *
>>>>> + */
>>>>> +
>>>>> +#ifndef _AMDGPU_WORKLOAD_H_
>>>>> +#define _AMDGPU_WORKLOAD_H_
>>>>> +
>>>>> +struct amdgpu_smu_workload {
>>>>> +    struct amdgpu_device    *adev;
>>>>> +    struct mutex        workload_lock;
>>>>> +    struct delayed_work    smu_delayed_work;
>>>>
>>>> call it power_profile_work instead ? Looks good otherwise.
>>>>
>>> Noted.
>>>
>>> Thank you
>>>
>>> ~Arvind
>>>
>>>> - Shashank
>>>>
>>>>> +    uint32_t submit_workload_status;
>>>>> +    bool            initialized;
>>>>> +    atomic_t power_profile_ref[PP_SMC_POWER_PROFILE_COUNT];
>>>>> +};
>>>>> +
>>>>> +/* Workload mode names */
>>>>> +static const char * const amdgpu_workload_mode_name[] = {
>>>>> +    "Default",
>>>>> +    "3D",
>>>>> +    "Powersaving",
>>>>> +    "Video",
>>>>> +    "VR",
>>>>> +    "Compute",
>>>>> +    "Custom",
>>>>> +    "Window3D"
>>>>> +};
>>>>> +
>>>>> +void amdgpu_workload_profile_init(struct amdgpu_device *adev);
>>>>> +
>>>>> +void amdgpu_workload_profile_fini(struct amdgpu_device *adev);
>>>>> +
>>>>> +#endif

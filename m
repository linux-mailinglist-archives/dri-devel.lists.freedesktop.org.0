Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2512A3EEB14
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 12:37:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 366766E160;
	Tue, 17 Aug 2021 10:37:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2086.outbound.protection.outlook.com [40.107.223.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E06536E057;
 Tue, 17 Aug 2021 10:37:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qbi3ySCsdmwGjIi28aNZ7T9F3ek6e4enhhLMBybyqhUxdX7Lb8l9lHFyL52EDxb0NtW08FTx4XIRoT3Kg4SXHm6s9RZMm4IC3F71Dlwk/tDqAQeLYFmrEmotKdgdvDYZWvXfiPTqqktcQS5HkMvdAjpDLl8VN2Y/8+Q5SM54JHpiYLs1gx7oeQ4AnUhf48/NVMZmErDoTGdNaXH4gjjz98Hjaj73tkCg4PekrrdBS5WULR7KWwL9bAdk8ZpBruUTW053sQg45pAsjsLcSmFXY/+7wPrVmhFUJOADr2fLWnO/fpyC1NPHsrhxIrkbsaUmJbKy39HKFmPyqpyjKHL5Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7o10gB5R4deFZHwPutpbJCX6zDG3VrrxIDwCaVJDNUk=;
 b=F9ST130jcaAGpFgxgqYxsWQEjLQuhNHnM65u/j2hNPT/IGDOk0qxmhiUrj/8ir1a8hDXkKocmW6V3WZxAzvErgXUUE3vFxNg6IN8rteiYAnCok0efjF+gBAKHUSq0yShia7rfREuTVBwG8HcxGyVqID7dH2IfOFI79PNGHQ5DdeqZwvBsQSqqfj0fy5ilyBEtcD9gUA5fFBCHS5XN6YKTkD6rHYGtPaDb6mxFYHk0VOZq5Fg2AM0OYcgkyQ3668PGOHf6Flu57pZlkstoEWz1zhVfGdoG/DTBzz2nYdSEIdLPMUmlCENrmpS8Ouv/bKk+bSq1e3VTgODUHZWUdbJRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7o10gB5R4deFZHwPutpbJCX6zDG3VrrxIDwCaVJDNUk=;
 b=DocZaZfZdwYOF06GvRKPhfFs7ZLU692ASKczHhMNBeVSKVcF7buzTCoJs6RtdRTwiuaEoMJJxws99D6hf0GwxnG8onmmVWCYOug/3aEvZWZGkAwWrRdQLjEpLFLekqNIEj0unNG1Pvpi4W/Psco8kAhZLSUnpueabSKwL740ORc=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5349.namprd12.prod.outlook.com (2603:10b6:208:31f::7)
 by BL1PR12MB5224.namprd12.prod.outlook.com (2603:10b6:208:319::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.18; Tue, 17 Aug
 2021 10:37:43 +0000
Received: from BL1PR12MB5349.namprd12.prod.outlook.com
 ([fe80::152:9dd3:45a4:eeb6]) by BL1PR12MB5349.namprd12.prod.outlook.com
 ([fe80::152:9dd3:45a4:eeb6%4]) with mapi id 15.20.4415.024; Tue, 17 Aug 2021
 10:37:43 +0000
Subject: Re: [PATCH] drm/amdgpu: Cancel delayed work when GFXOFF is disabled
To: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Cc: Leo Liu <leo.liu@amd.com>, James Zhu <James.Zhu@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210816103506.2671-1-michel@daenzer.net>
 <20210817082325.2579-1-michel@daenzer.net>
 <ceaa02c9-26ef-e1e5-3f35-3cc202961670@amd.com>
 <8461fba5-662e-85f7-b712-472232ed12ba@daenzer.net>
 <c294f4c7-7919-7b7f-4de7-ab4def8c90a3@amd.com>
 <e9aa759e-1692-b8c5-3f23-2c55af0151bc@daenzer.net>
From: "Lazar, Lijo" <lijo.lazar@amd.com>
Message-ID: <c8b52f3a-f431-3dc5-b08c-b6af5f8d1d7a@amd.com>
Date: Tue, 17 Aug 2021 16:07:30 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <e9aa759e-1692-b8c5-3f23-2c55af0151bc@daenzer.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0126.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::11) To BL1PR12MB5349.namprd12.prod.outlook.com
 (2603:10b6:208:31f::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.157.114] (165.204.158.249) by
 PN2PR01CA0126.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:6::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.17 via Frontend Transport; Tue, 17 Aug 2021 10:37:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 23135bde-d360-4702-7d9e-08d9616b0b3e
X-MS-TrafficTypeDiagnostic: BL1PR12MB5224:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB5224FDA432C00A74BB16846697FE9@BL1PR12MB5224.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i2U62zHHPY4Hp4qbrIbggvk7K9TehNmzsgfo3meJFazTqgGoRapRXxk34FinISR2IdbrXQIMnf4f7xEa1saVwliziT628rWokyV1hJGzvLxegMMw4If5DaqA8cM3vWyJxw4CJA/FIzWK+5G89lcgcDMtGTAI2nAu3cRB+owCgbKwgf6u+B4/ayV93fmucOhFo21qIhQ4VWSvJG5H/Xi4ORnzN2hhBV7qA4FXZHv8K3XmRwcN40rS6u5GCv0lWMmrfehQfxIxo0qwVljbUTfQSgdD8V4g3FtxvL/3aHCtM6aohdyy7NJ6MU2jHW9WNUclxwmVWRuBDJ0ZyjVYym1doIUXawXCGs0y7qrXmRRygK4iCMTg8cVPOhUrJUe7RBVS2q90hJ3TJLGnryzDfy59JkzNYUurToQtNS3CSoJEcNvT/CJSGRnU5cx7a4PE3koxUNaVnvboJgoK+vOubveK3khy+suuMovIGTuWQ0GMu+ZtospUmXS+a62yHcOtCpkNtjbKI4HydAaqXTjCrc5G2l6XvYerR+2n4DPm5yGtEEx1WPqkF/yKxB/JidIrJz+lp53dIYrBufkbvP8Hphg7LFVoTAJlpWIxBsFSyxOUUNsr3fWzYXh/F6LSSDntHvg6LJiO/ALF4QGRw15+xlRqQZv3d1LG4cb3m/uB/Pu/uSFj7WcJoVYcluQzyTxNAgTZ/e1jKxOPxk1Qo3/1iqv/UMdqhIHLj67f7roKWvV2wlU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5349.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(39860400002)(366004)(346002)(396003)(6636002)(5660300002)(478600001)(4326008)(110136005)(16576012)(66556008)(54906003)(956004)(2616005)(186003)(316002)(26005)(53546011)(6486002)(31696002)(66476007)(66946007)(31686004)(36756003)(8936002)(2906002)(8676002)(38100700002)(86362001)(66574015)(83380400001)(6666004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U1RsUms5SkhKUkd0LzEreDlNZUNUbUl3UlgrcWZ6RC9HNkx3ZkQxVkkveVBO?=
 =?utf-8?B?aHhZUHVzSE4rK2t4bE1CQUg2U2VIRTZFMlJneklDZEk5Vm80bFF4ZlVNM0Qz?=
 =?utf-8?B?VWlsRVRjZkRNMzRKZUVScG5jSC9hRmpEekdsekY3bkZNK3pOQzVwSlY1a1BG?=
 =?utf-8?B?SzdEbnhscUdIcG5maENLNlpLWXhVZVlkNXVrSythWitOVElJa0lPbkdrU25O?=
 =?utf-8?B?WFVBVGtLQUJrVjNGTjhYWkVqVFBCSGh6dm83ellNRnJweFg0TWVpT3NVU3Fi?=
 =?utf-8?B?UXZ3aGRMNTZ4RzBUZUNyNS9sTnpTNEQ3MFBjM0pvT0JVTkRQZC9vcUVValdm?=
 =?utf-8?B?QW5zZW1QcERyRGlsa21BdVRBZmZML1FkY2RZbVYrbFdtak1KeWNWang1QnlT?=
 =?utf-8?B?ZXI2QWh2eitMQjRBdWhBWnVMd3ZPNlM0WGpZZjdBZytEM0pHem55OVc3OWJw?=
 =?utf-8?B?NjZsNjB4N0lKdGh6ckJBZFdZOGx6Rm5oN2EzM1hFWVBWQjJTTXh6R3FQb3RC?=
 =?utf-8?B?ODVZamZrM2ttcXAxdzF2YlFiQ3YxeXpjZTVtbWNFZmw0RHNVNWkrSzZyNXZw?=
 =?utf-8?B?TDZKSTlwajF1UGhRV1NDR1lNcnVCTU9pUFNINC91TU1zUGNVbjZwQmZuaGNS?=
 =?utf-8?B?Z0NtY0xwamVKMlYrellXMzB2dlI0Y3JySFZjY2prYk0vd3pjL3pZamQ0S2NC?=
 =?utf-8?B?UVVVMVhmL3ZpNlhXTU03b1VKNktPK0RTWnhvdW56bTRvSEQ1ZDYyVm5hd3Fr?=
 =?utf-8?B?TXBGYnNOQkUxSzh1VTVGbzlzenBURWlmMW9LdVQxVnhEUjRtOWJCZWw0SHN0?=
 =?utf-8?B?amVENEhzT0pNcVYyTkczZFcyV1hPZEpFUDJzRUI5bEJwelZ4VU0rV3F6c3do?=
 =?utf-8?B?NlBvNXNtUkh0SFdCR2V5aFFCNC9mb3k2U25VbVJkSXRwanprUjBWcFBiNkRH?=
 =?utf-8?B?ZE55Z3BXdWkzQUJEb0RkcTdvUDI2OHZRcFJyREFzN0hCV3N0cDNlY2JZemQ0?=
 =?utf-8?B?cEdZOHo2WlFQZTZuUjVwcE9vY25GajFqaTV2aW9FcWFLSDBtU3N6KzJncjJG?=
 =?utf-8?B?OWNGcFR3dDF0YjFDQ0o4M1B0RmV2RWcyaTNYUThxSXhKMHQwTzVEZ1dhY0NJ?=
 =?utf-8?B?WUwrQmh1ZnZySWhVQ01GdUZmT01idDFYVGFGSDhSdnF0d3crMEUxUHRjeDZv?=
 =?utf-8?B?NkFENzNidlZLRHQwZXhOck8vclJnY0Ztblo2WXZJaElxaE1OeERubFo2Ukxk?=
 =?utf-8?B?Z2VBU2JRcDluNzZJMlVtY0FZZnhJUlZLU2c4MzlDNW1zNU9LQy9vdHRmczVx?=
 =?utf-8?B?VithUFJ2TmkyMU8zUUM2NlAzSHdkTEdUZkx3QWc2WHNaZTQwWTBhUzR0ZUFS?=
 =?utf-8?B?UVJ3NmdvdDY4Wi8wd3pIcm5sZy9vSWxzRHZsWldneVdTSkZiTU1WelZySlJI?=
 =?utf-8?B?T0tZY3l2akpwT0RWRWNXUTcrQnZJMDNFQU1SSldoUW1RVjBKOFJpQXIzVVpv?=
 =?utf-8?B?YXp0b1NqaENld3g0anN1S29FcUpxQUYwdktJVmNab0NjUmhHTzBvRERuYlht?=
 =?utf-8?B?ZExFVnpRNFc3R1pwcXdWR2pWbmtIVE5na1BnNW01ZnE2VGZpRGFqYjNMNjVr?=
 =?utf-8?B?S1orUGhKa0pIbkh4OS9ZT25CRWRvd2dHbHNWUk9zem9GUkhhSDhEUGE4MktN?=
 =?utf-8?B?ZnBQSk1RUHJtV0FSZ3c1UmYxelJnaWtkRlM0N0xqZGExeXEraDEyUUZUSFlP?=
 =?utf-8?Q?9dZ90ZtXXAzI/cNOAFBdUX8IbAcAUIs1HsniTiS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23135bde-d360-4702-7d9e-08d9616b0b3e
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5349.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2021 10:37:43.1329 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fhxTPyJMaVVa7McM0XY2g2HJoM8uFG4s0PnhhrPetCO8VLHquzSW8aVhhYSusW8S
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5224
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



On 8/17/2021 3:29 PM, Michel Dänzer wrote:
> On 2021-08-17 11:37 a.m., Lazar, Lijo wrote:
>>
>>
>> On 8/17/2021 2:56 PM, Michel Dänzer wrote:
>>> On 2021-08-17 11:12 a.m., Lazar, Lijo wrote:
>>>>
>>>>
>>>> On 8/17/2021 1:53 PM, Michel Dänzer wrote:
>>>>> From: Michel Dänzer <mdaenzer@redhat.com>
>>>>>
>>>>> schedule_delayed_work does not push back the work if it was already
>>>>> scheduled before, so amdgpu_device_delay_enable_gfx_off ran ~100 ms
>>>>> after the first time GFXOFF was disabled and re-enabled, even if GFXOFF
>>>>> was disabled and re-enabled again during those 100 ms.
>>>>>
>>>>> This resulted in frame drops / stutter with the upcoming mutter 41
>>>>> release on Navi 14, due to constantly enabling GFXOFF in the HW and
>>>>> disabling it again (for getting the GPU clock counter).
>>>>>
>>>>> To fix this, call cancel_delayed_work_sync when the disable count
>>>>> transitions from 0 to 1, and only schedule the delayed work on the
>>>>> reverse transition, not if the disable count was already 0. This makes
>>>>> sure the delayed work doesn't run at unexpected times, and allows it to
>>>>> be lock-free.
>>>>>
>>>>> v2:
>>>>> * Use cancel_delayed_work_sync & mutex_trylock instead of
>>>>>      mod_delayed_work.
>>>>> v3:
>>>>> * Make amdgpu_device_delay_enable_gfx_off lock-free (Christian König)
>>>>> v4:
>>>>> * Fix race condition between amdgpu_gfx_off_ctrl incrementing
>>>>>      adev->gfx.gfx_off_req_count and amdgpu_device_delay_enable_gfx_off
>>>>>      checking for it to be 0 (Evan Quan)
>>>>>
>>>>> Cc: stable@vger.kernel.org
>>>>> Reviewed-by: Lijo Lazar <lijo.lazar@amd.com> # v3
>>>>> Acked-by: Christian König <christian.koenig@amd.com> # v3
>>>>> Signed-off-by: Michel Dänzer <mdaenzer@redhat.com>
>>>>> ---
>>>>>
>>>>> Alex, probably best to wait a bit longer before picking this up. :)
>>>>>
>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 11 +++----
>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c    | 36 +++++++++++++++-------
>>>>>     2 files changed, 30 insertions(+), 17 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>> index f3fd5ec710b6..f944ed858f3e 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>> @@ -2777,12 +2777,11 @@ static void amdgpu_device_delay_enable_gfx_off(struct work_struct *work)
>>>>>         struct amdgpu_device *adev =
>>>>>             container_of(work, struct amdgpu_device, gfx.gfx_off_delay_work.work);
>>>>>     -    mutex_lock(&adev->gfx.gfx_off_mutex);
>>>>> -    if (!adev->gfx.gfx_off_state && !adev->gfx.gfx_off_req_count) {
>>>>> -        if (!amdgpu_dpm_set_powergating_by_smu(adev, AMD_IP_BLOCK_TYPE_GFX, true))
>>>>> -            adev->gfx.gfx_off_state = true;
>>>>> -    }
>>>>> -    mutex_unlock(&adev->gfx.gfx_off_mutex);
>>>>> +    WARN_ON_ONCE(adev->gfx.gfx_off_state);
>>>>> +    WARN_ON_ONCE(adev->gfx.gfx_off_req_count);
>>>>> +
>>>>> +    if (!amdgpu_dpm_set_powergating_by_smu(adev, AMD_IP_BLOCK_TYPE_GFX, true))
>>>>> +        adev->gfx.gfx_off_state = true;
>>>>>     }
>>>>>       /**
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
>>>>> index a0be0772c8b3..b4ced45301be 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
>>>>> @@ -563,24 +563,38 @@ void amdgpu_gfx_off_ctrl(struct amdgpu_device *adev, bool enable)
>>>>>           mutex_lock(&adev->gfx.gfx_off_mutex);
>>>>>     -    if (!enable)
>>>>> -        adev->gfx.gfx_off_req_count++;
>>>>> -    else if (adev->gfx.gfx_off_req_count > 0)
>>>>> +    if (enable) {
>>>>> +        /* If the count is already 0, it means there's an imbalance bug somewhere.
>>>>> +         * Note that the bug may be in a different caller than the one which triggers the
>>>>> +         * WARN_ON_ONCE.
>>>>> +         */
>>>>> +        if (WARN_ON_ONCE(adev->gfx.gfx_off_req_count == 0))
>>>>> +            goto unlock;
>>>>> +
>>>>>             adev->gfx.gfx_off_req_count--;
>>>>>     -    if (enable && !adev->gfx.gfx_off_state && !adev->gfx.gfx_off_req_count) {
>>>>> -        schedule_delayed_work(&adev->gfx.gfx_off_delay_work, GFX_OFF_DELAY_ENABLE);
>>>>> -    } else if (!enable && adev->gfx.gfx_off_state) {
>>>>> -        if (!amdgpu_dpm_set_powergating_by_smu(adev, AMD_IP_BLOCK_TYPE_GFX, false)) {
>>>>> -            adev->gfx.gfx_off_state = false;
>>>>> +        if (adev->gfx.gfx_off_req_count == 0 && !adev->gfx.gfx_off_state)
>>>>> +            schedule_delayed_work(&adev->gfx.gfx_off_delay_work, GFX_OFF_DELAY_ENABLE);
>>>>> +    } else {
>>>>> +        if (adev->gfx.gfx_off_req_count == 0) {
>>>>> +            cancel_delayed_work_sync(&adev->gfx.gfx_off_delay_work);
>>>>> +
>>>>> +            if (adev->gfx.gfx_off_state &&
>>>>
>>>> More of a question which I didn't check last time - Is this expected to be true when the disable call comes in first?
>>>
>>> My assumption is that cancel_delayed_work_sync guarantees amdgpu_device_delay_enable_gfx_off's assignment is visible here.
>>>
>>
>> To clarify - when nothing is scheduled. If enable() is called when the count is 0, it goes to unlock. Now the expectation is someone to call Disable first.
> 
> Yes, the very first amdgpu_gfx_off_ctrl call must pass enable=false, or it's a bug, which
> 
>          if (WARN_ON_ONCE(adev->gfx.gfx_off_req_count == 0))
> 
> will catch.
> 
> 
>> Let's say  Disable() is called first, then the variable will be false, right?
> 
> Ohh, I see what you mean. The first time amdgpu_gfx_off_ctrl is called with enable=false, adev->gfx.gfx_off_state == false (what it was initialized to), so it doesn't actually disable GFXOFF in HW.

Exactly.
> 
> Note that this is a separate pre-existing bug, not a regression of my patch.
> 
> I wonder what's the best solution for that, move the adev->gfx.gfx_off_state assignments into amdgpu_dpm_set_powergating_by_smu?

Should be an existing one, never bothered about that condition before.

One hack would be

is_pending = cancel_delayed_work_sync(&adev->gfx.gfx_off_delay_work);

	if ((adev->gfx.gfx_off_state || !is_pending) &&

If work was never scheduled or pending, is_pending should be false OR if 
it got executed, gfx_off_state should be set.

Thanks,
Lijo

> 
> 

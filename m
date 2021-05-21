Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA97038CF27
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 22:37:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 859BD6F8FE;
	Fri, 21 May 2021 20:37:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2069.outbound.protection.outlook.com [40.107.102.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 559496E0BA;
 Fri, 21 May 2021 20:37:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dCAAH7cka1IjQoPxd3X2xs//BzOYZUyu1LeI4KECJyC/5KLY9NypuTBgN3bmsJtAAc/H/RAS+/1EtXlY0K94UmrqRN9jHU2uiGD+YJChjsFZ66vgBq6AbbJgrTUOutPKjjuC2h9kvn6OJ7zJC9x3Mr2EpScZWwEh62Zjfr4MUSFVKV59QVtEulAW3REAoc2El7yGLoFebvnEZ4ZgKQ/M2IycHR0OSsfAJrYutpIjaTk9DFsbst/wMzcMOld4ApZWa4pyc5Y2KIzQbDko+/wxEsNjJENAtpKW2ENUAGDyALgytCTOmF75m3QW8bRLsLE73E7GWpNA5y+NZC7AnGL3rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kpZF8R1p3nAY4l0ZmwqbHZK8K/E3700hfL2c+ZZXtwI=;
 b=lmP4BbZmhxnnGfxyyzTyz7TfxGerfhWWm4/s1CAzXeyZeNHxzK0M9rmHd49RiNqTXLFg4RYprRkxDJtoskPFqpt95PV8/mtyRbsrliuznZEE6kHuzjAM9Jp0uHHp9cWjKt+KYqBFkd021fQ5q+otoSX0nsHYWbFtdqaxhfYFpTdwHCS6lTwU7X926qhyRqrhIVPMDJisCYRhB5hxTOQ71p8eXhBIs7KsdjP4CxUhiTVWUllpIw6olSGodX7T/K0gPyjOLKtrAy2aViNvXKywiWWh/DwypQ4f3y2C7P6zmJZTotzoDvbIkAq8/LP4+2eHKCOd0r/pIF3h78UnvNVMig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kpZF8R1p3nAY4l0ZmwqbHZK8K/E3700hfL2c+ZZXtwI=;
 b=urrj6zee7Eqk7B+YikQNAfdiHPws9hhu/SS5q5aljK9GPlblAEtvUrjOZOMLpVs72MEjaqM0AEvYAHk67imi8V1UwL2aNpi3YzjdaYEls5VnpzA1xucoiWGlQR3I/np7+8Vt/TmOi/LVPM/WJifvg8wK3xpy3r/cqx0RJCqkZ2w=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB4615.namprd12.prod.outlook.com (2603:10b6:a03:96::21)
 by BY5PR12MB4950.namprd12.prod.outlook.com (2603:10b6:a03:1d9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.26; Fri, 21 May
 2021 20:37:13 +0000
Received: from BYAPR12MB4615.namprd12.prod.outlook.com
 ([fe80::58e2:2ca1:afbc:5122]) by BYAPR12MB4615.namprd12.prod.outlook.com
 ([fe80::58e2:2ca1:afbc:5122%7]) with mapi id 15.20.4129.035; Fri, 21 May 2021
 20:37:13 +0000
Subject: Re: [PATCH] drm/amdgpu: Fix crash when hot unplug in BACO.
To: Alex Deucher <alexdeucher@gmail.com>
References: <20210521201412.746745-1-andrey.grodzovsky@amd.com>
 <CADnq5_OVAVet7b614cDc0rS5fzwarjFtyP3nc9Ute3k5Hnbz1g@mail.gmail.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <3ef2da30-fa95-ac63-4161-54fb23691045@amd.com>
Date: Fri, 21 May 2021 16:37:09 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <CADnq5_OVAVet7b614cDc0rS5fzwarjFtyP3nc9Ute3k5Hnbz1g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:b74b:1af9:3eb:e31d]
X-ClientProxiedBy: YTXPR0101CA0049.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::26) To BYAPR12MB4615.namprd12.prod.outlook.com
 (2603:10b6:a03:96::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:b74b:1af9:3eb:e31d]
 (2607:fea8:3edf:49b0:b74b:1af9:3eb:e31d) by
 YTXPR0101CA0049.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.33 via Frontend
 Transport; Fri, 21 May 2021 20:37:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 84cf21f8-ea62-4737-6fd8-08d91c9836a3
X-MS-TrafficTypeDiagnostic: BY5PR12MB4950:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR12MB4950B13F1FFD3934CD909187EA299@BY5PR12MB4950.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tJ/AYqn9Znhhn0GdmymIog+vPAtx7dGONu8xWVKrgKmWOBw1DcHITQ0NQKzlmEh7CXhriZKmUlctXnd8AudhEFQimKozyebS5iC/APi3z6t/vXUJ9SSHYIY+dcdKV+ONCS6jdcyHmiuvCfy6T2RSVFtONWi8bjAeXCiWWMtwfAqWb50zEztUktYvKWkkuPJtMRlIA4Pzw7YFadwhAj/rRc2IHtl+5ERAXPq9qwYIyJmGQvmlLDqt6dHJpkGhnJ9BTWlBxCHcel79WinM4w4uHAZcugOJZEj4G6h6wrTXQWLMDpupb/xiWQtUSxIb2OXKWl7NUjPHHPZ6OCrwAqqOzrcauI+ug8DGNSGsjhSoefS+VMCKJZWzLBabSWCNx4XNT7hebBDLINnmFPloeb28OANYd0/ctUSSQAiIRtdk5U1Dx0yunB2I9S4XPl1gjNX9uLYIDwAqv6YGTP+r7JwpSdKcwqQ7enw6UK1XY5Ngpd/GiG0ir8EpGBlQ5aP4SMu+fnnXXbNugVreAe+Uv/fKuDsVpJLoR5kOc3hYsOiio2iJnWt8N3c+Q8M+wj/RHXRvwpPAtvkfS21HFtWOx1Bw3qrqD/8/d97xVUKaod2rOdWk8SDh8GQbt0QIpjs01tZ1O2deffn3VXxtkPHiVUm4o6axZGhS0xpp08jQKickVP20cgF8vZytBTgFVZtrFp/JgI1zM/nr3verqNyS6GI2F0srJ4ctg6fQzTtBtgPx8js=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB4615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(396003)(366004)(376002)(346002)(966005)(54906003)(6916009)(4326008)(16526019)(5660300002)(8936002)(478600001)(36756003)(45080400002)(186003)(2906002)(6486002)(2616005)(83380400001)(86362001)(31696002)(66946007)(66476007)(53546011)(31686004)(8676002)(316002)(66556008)(52116002)(44832011)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?eGc2RGhCRlNGbzBNdXBkN3FoSXVoSFdDY1NTZitZNk42YWdVWDhPY1gzbXNY?=
 =?utf-8?B?UE50anoyenBFQnkzc3dqNjdoVHZHYkwveUVBbnltRzQzclAyTTk0cGpDUFlk?=
 =?utf-8?B?RkFQVWE4R2gzcmNPTXd0cU13VUpCL3ZZYjJuYkRHRmp5alBGa0VhQUN6SDdq?=
 =?utf-8?B?WkpHY0NuVitQTlZCTWYvUkVnYWF0c0hZQ3lGYTU4dXdWSTMwcUE5ZS91Z01v?=
 =?utf-8?B?ZC9ZMDJPR0dqdVNWVEdpK2w2V0tqcFZtTTNYcVRTb0lJQmNYSUZSamV5SFZt?=
 =?utf-8?B?ZWpETU1RZkREQnpqc0VWVjUwMHRjMVErV0pVdnpOUXBZSElUdFBRbStSWlYr?=
 =?utf-8?B?elZ3MU0yTmd1S0pEdTBuNTRCRGUrUEpaaGE4cG9CWUk2Y3AyVkx5TmphT0dS?=
 =?utf-8?B?R3pJSHZHSWVsV01aMnk5VGpZZy9jdC84UkZmL2tQSjMwRkkzMkZWSmU4WVJZ?=
 =?utf-8?B?RzBpVnBlc2pQTUNERUdTT1hPdkVUdlAzbTRiRUtiUFh1NmtWZWtwTkZaOWxH?=
 =?utf-8?B?eWQ2bkpkejh2NmQ3UVhDNEQ3MDVRNjV1aDkwZ25LdHFwU2J2ZmNkd2lpRjd0?=
 =?utf-8?B?WEVWY0g4Z0JIeHMzVzBiUTBrNjFkVHlFbkJrYUNMWm51eHROd29uRjdTNnNO?=
 =?utf-8?B?K1pnRTVKZ2lWR0hPaGVodjJiVUovd0V3VGNlT1RpTGg2aHdhczM1dDhsTk1T?=
 =?utf-8?B?R3lXdlkwTTFlNlVXK1B4d1FrRnlubm1FTUZzRTdUTytyUlB5aUx2WkE3dnU4?=
 =?utf-8?B?YnM1MlFWQitaNnVvNEVIelZhR0d0Z1VOV2djM21pMkFqcUpXQ2FhZUtJWS9V?=
 =?utf-8?B?UXNlbU8rMEJNZzdia2xPOWJad2wwazNSb2pYZTA4QjhabTU5dEtGYUxOalFr?=
 =?utf-8?B?QXJueUZNY1ZyRE9Scm9yV1BHTzhFeXVzUTlyNEtudEx6cEhHcVg3UEJGMjBt?=
 =?utf-8?B?bm0xbkFhQXptenFJekRzMENLSWh2UU96RHFXYVFhU3pmRGplZ1NvVVNHekpY?=
 =?utf-8?B?SkQ1aUN6dExRWGhTalRMaVdEYTljSGFYTXRYRVdJU1RPc0ZSaHVwekJBYWVR?=
 =?utf-8?B?bnV5cmN4ZzdpOUwwdWpxcVNRR09INDZyS3RrNXpacmFMckMyc0VmY3RPQUpT?=
 =?utf-8?B?M2tjUm5JV05Nd3pHYzd4UnIyNEtqVVJJMEkxc09icndpVW9pOWRITGJGeGh3?=
 =?utf-8?B?cENRSEtMSUhrei9UZnVUS1JHNGJlSjZDNVdHeWpuWkNDY3FLRnR4bFhDS0hY?=
 =?utf-8?B?MEtOSk9yZC95c2dadVJDSmI5cktDM3U2MzE1WERGanIwMDZHQ0dDTzJVdGRO?=
 =?utf-8?B?eDZCb0xGYks3WFZEd3V5NDhFQzBOd1o2S0JTN2NGKzNINC9Ya3I4TTdWalhP?=
 =?utf-8?B?aXBsdVdERkN6bmRFSlBhbzNyMWU1aXo5OHpRQkFXWHM3S3lKZVFLTVpwVitu?=
 =?utf-8?B?WnQ2cGxPUjRudFBxNVdaRFYvY1BOL1JMSnVySXFzVTVhYU0rV0JKUEE5a0Nn?=
 =?utf-8?B?MGNTTmFJa2VVYTJyMDZuVkZnRmYxc3VwZVdrRFlDbDJYS2ltS1lIS3lseitB?=
 =?utf-8?B?VjR2TmdzaUw5SzNCK1ZjaTBsMUdnQUFJeCsyZHFXd0JDZkhtSnJRMW91RFhW?=
 =?utf-8?B?VXMxclNwVWY3b1F2UDFCYjRsazAxVVBISW10YithN1lpWlFibitNQ21WZXBy?=
 =?utf-8?B?YkhwUTZQWG9yUklQQU9kem94bnR4TTNCWEJVYUQrb3AyQUFkcjNURnkrNnBT?=
 =?utf-8?B?eDRacVRHQjFUTnZCRVJuaGhJd2tZSlNRQTY0UHl5anJaRUx3THdMOXRZSTNp?=
 =?utf-8?B?VWtuc3pzSDdiUjc1ZjNYNld1TVIxdEJvN3RNaUVueS9FL1RIUmttcHN3OTB2?=
 =?utf-8?Q?Q+MIoe3yRShff?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84cf21f8-ea62-4737-6fd8-08d91c9836a3
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2021 20:37:13.1610 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vCe70k1RdMDp6/smP0Ngg6ZVxzNYHZitbgthtCt2RcdLoJt0D0X4VkscDtT0WZAjmScYxhp2Eej5dj1ikCh3yQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4950
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Will do.

Andrey

On 2021-05-21 4:18 p.m., Alex Deucher wrote:
> On Fri, May 21, 2021 at 4:14 PM Andrey Grodzovsky
> <andrey.grodzovsky@amd.com> wrote:
>> Problem:
>> When device goes into sleep state due to prolonged
>> innactivity (e.g. BACO sleep) and then hot unplugged,
>> PCI core will try to wake up the device as part of
>> unplug process. Since the device is gone all HW
>> programming during rpm resume fails leading
>> to a bad SW state later during pci remove handling.
>>
>> Fix:
>> Use a flag we use for PCIe error recovery to avoid
>> accessing registres. This allows to succefully complete
>> rpm resume sequence and finish pci remove.
> Might make sense to create a preliminary patch to change the name of
> this flag to something like no_hw_access since it's not specific to
> pci error handling.
>
> Alex
>
>> P.S Must use pci_device_is_present and not drm_dev_enter/exit
>> here since rpm resume happens before PCI remove and so the
>> unplug flag is not set yet.
>>
>> Link: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fdrm%2Famd%2F-%2Fissues%2F1081&amp;data=04%7C01%7Candrey.grodzovsky%40amd.com%7C2a0ec02245b64de0139808d91c959987%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637572251118922092%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=egcYBxBU%2BkIqbEdypVueXQcWb%2Bqe%2BKCC30Mw%2FjgR6ag%3D&amp;reserved=0
>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> index d8db5929cdd9..ab95ebf56636 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> @@ -1555,6 +1555,11 @@ static int amdgpu_pmops_runtime_resume(struct device *dev)
>>          if (!adev->runpm)
>>                  return -EINVAL;
>>
>> +       /* Avoids registers access if device is physically gone */
>> +       if (!pci_device_is_present(adev->pdev))
>> +               adev->in_pci_err_recovery = true;
>> +
>> +
>>          if (amdgpu_device_supports_px(drm_dev)) {
>>                  drm_dev->switch_power_state = DRM_SWITCH_POWER_CHANGING;
>>
>> --
>> 2.25.1
>>

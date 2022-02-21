Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 357314BD787
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 09:25:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8757F11236D;
	Mon, 21 Feb 2022 08:25:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2085.outbound.protection.outlook.com [40.107.236.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F57211236E;
 Mon, 21 Feb 2022 08:25:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kcUb4351a4Ud51brDMuhbsmnlF/KBnIAVI2jpqiT67Vngzoz75ASuLL6INf3VzvfGOG8horivleZx6W8AV8duXs5qHykWHgkVMUHOyY6hP6o7grY6h9OUtkb2TDNSFhKk9i52BzHy7PCcuhCd4gRPXHPpGCpJV/+Apa4jjHbTV7ULZBnxGB+4UcZinx9reUDSJvzorCPi04qQwOnnl6DyNuY/4pMqCe5z7MMChCAy9Uc5zWTiK6lNdUQy19DFZEAZ1u8IGrGEJAug7PIMICGDqjb3Rh5wwTiSqhrJVcfLX6/BeOa1T84r9x2mcEoSoVnFdsrMahdKn4Srpw/tEzF5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5OEVVJ/IdAuoLTgcNxL7S4kTR12vJyAKLaqR1j1/plQ=;
 b=aDN4K5JDc2QXTeSv/XnPLLo3HfFbVlBs9cEN8yLUNahUGE2btGrO0Z8cU82LknALaXz6gqYjI4zKH400YTgputPha7bgqaGNrhHsbaOw2dM9HY4LoWyhwfE0n8UjF2f72ofLWJAa4r6PWR7NuA5lDWro/A6GvNeqRBEW5ehPwP2IxQJ/P/Y+c/IOycEc1H9dq1+Feu9VPl/pzehRZt2Mr9zihkoSZqwnJk/yOjAtMwPda+jAdyTjWLVmzmTeTRNlytuPZrNQyh5sbixYpxPjjQDydZLbzWNStJ04eVKyTCPdvM1/fLZ2xmG5GFpc/Q4C3Sbg9Pgr+Gxd4H7mzJ60Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5OEVVJ/IdAuoLTgcNxL7S4kTR12vJyAKLaqR1j1/plQ=;
 b=LdmzQHXB3/hhySCNVR8oy5jQVPpRgY88kd099lAfzqjGXLxVQON8i++8hGV4uQlcHUaQOhm1msrVo4akOynDU6AwJlVdiiB5mHkM6vdx28Qg4OnWypQHKxwWgP/NtT9pq9AslT1MBWJXXYfHCgV5aIYdrBeDdUbZiogvUls23RQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BYAPR12MB4709.namprd12.prod.outlook.com (2603:10b6:a03:98::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.26; Mon, 21 Feb
 2022 08:24:58 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e03f:901a:be6c:b581]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e03f:901a:be6c:b581%6]) with mapi id 15.20.4995.027; Mon, 21 Feb 2022
 08:24:58 +0000
Message-ID: <25ffdb03-b767-9e64-a636-55df2edc0d4c@amd.com>
Date: Mon, 21 Feb 2022 09:24:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/amdgpu: check vm bo eviction valuable at last
Content-Language: en-US
To: Qiang Yu <yuq825@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20220217090440.4468-1-qiang.yu@amd.com>
 <5d3fdd2c-e74a-49f4-2b28-32c06483236f@amd.com>
 <CAKGbVbtLTBJPF5eTu4rABUTBa8eqjQvqjo1AEUrzgPgYgCREuA@mail.gmail.com>
 <dac70c05-e712-d2e3-2267-278380895f1e@amd.com>
 <CAKGbVbvtLbDiKrX80-dMnipdLkTE+FP=g_mx37e12fuMtA1Y4Q@mail.gmail.com>
 <ca27a9c6-f390-a938-dd66-ac23f3b44dc4@amd.com>
 <CAKGbVbv4UFCybS_OFj5UkDgevbrB5qe3pv+0nHv9WdefYhy6Ww@mail.gmail.com>
 <6711073b-8771-5750-33f7-b72333b411c6@amd.com>
 <CAKGbVbvR+msXjrsXmDM8QTmsCP03hL5-q5CTJBYu4mm=NQd01A@mail.gmail.com>
 <a11b7073-6597-8e87-b724-33acab32e791@gmail.com>
 <CAKGbVbuJ-QdeoMTg=_O=1x5A5tbqZftsjt8aCCoVkAekci0USA@mail.gmail.com>
 <d830bb82-63ea-2de6-6d10-3a401ac0dcf0@amd.com>
 <CAKGbVbtorRius+Sq1_3SPUF3JzA00U747noSGhx7eP8Vn1rSDg@mail.gmail.com>
 <47c3a681-379e-18d4-86da-c48721081911@gmail.com>
 <CAKGbVbvmxOCZWYvB+ZSL7oHJmbm8vPgM-NJzadrEG1E=2c2Eyg@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAKGbVbvmxOCZWYvB+ZSL7oHJmbm8vPgM-NJzadrEG1E=2c2Eyg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P193CA0051.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:8e::28) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f0cad0cb-c090-42f7-7e9e-08d9f513a566
X-MS-TrafficTypeDiagnostic: BYAPR12MB4709:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB4709DCDF98EFD8D093F9E10E833A9@BYAPR12MB4709.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E1QNRDcBeZdKyzaalbgy5hH/yE0o6xnI8JeIhwiTqHipE+QX4vp9152u53N5yaLxyegIqBKHoT+OWQXfFjUNzllgtfz7OcJ+0AabZSrq14UR59nAaPbvr0DPD27vW+WJ5vx1iWBM9HZsYxeQfCgw7PPIBV/zMdOxbPk2wwQRCfmBPBBQm5kRcyp9uK60VD1cB3hVwc4CKPl6qg7BGnvf7Vv/QXUNhhy4zjRH3Vv/TummcrbCyvxYFHQduaTrKXaScr32NtYH+t8GIANhJbWcgzZQvMwNAQx8PWwvCJ5mbbIw/eN5Mrjw9SqLAnTKQDm+KFj3S9ie/DR1gLsB2D9/qK2YimxuZrVmIFBxTtERaYIoF2FnE1QrjzWnpOwuBAHmMJ1ccbmvWiDaU6Wq4VZWJYzKwVRbfkZXkqOL/nATnYHcq0TMs3yooRE0bgIf4ums0N8UTXzoTWJ4RIg2bkdZTOxEATrXxZWi3veSVVdfJRNsyiSTI6Q5KKi8X1fRL1dEgRcWod+ZBtddoH/TzkYa89TpGZSuVygwf7icrw6bnHstG4D7GaxX2t89hOaftkgq1inpQ2Lxk9jFC3HuO27z/KumdIeQ3Qjre8hKAddRVeGIOBqlqgoPKYPh5J9sJXYZ7enqGwIl5ErNcgucXbCbxPAXkpiNve01VTiFQZbdl7SMeoko2xJRvAISK6SkK8O6aG8nmGyMkRp5wQ+Y1N3zDJpPDarIgFeWlblYO0figSPexW2NVwMz5/f06vlp9xfe
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6666004)(6512007)(31696002)(6486002)(508600001)(6506007)(86362001)(66574015)(83380400001)(38100700002)(53546011)(186003)(26005)(2616005)(5660300002)(7416002)(8936002)(30864003)(8676002)(66946007)(66476007)(66556008)(4326008)(36756003)(31686004)(54906003)(2906002)(316002)(110136005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dm9IaDRjbys4b3UvNmxYYkkvVmZQbUFERUs1TWNjbFlWdlRXOWprME1sL0lE?=
 =?utf-8?B?QkhNZ0c2eXJMa1Z1UXN6LzJBakc3cnJtVjVTbXBPSE1Mcjk0Z1lHemo4TmJN?=
 =?utf-8?B?MjdQeDRPMXBnczBYZE5UbnlHVUllN3RFZHd2bk1PSG1VN2JVVXZWVHNXY042?=
 =?utf-8?B?T1l5MlNqalo1YkwwaEtFeTRYb2g2b1h4bWU1TFBVZHBOTUptMDBleVNGQVBX?=
 =?utf-8?B?bzE3RUl3ek41d0c3dHMzU3RwaS9FMWhUNmdjSVFjNlZxT2k4L2MvbDRLazR6?=
 =?utf-8?B?Q3RvamMxSUFNU2VpU2x6QStJWGxDZWU1NzlKdDdPQk00N2pNNDI5dmRKSDc4?=
 =?utf-8?B?S1RlSHY3cmFvMUhwVVBxVUJwQTl4V05UQlNOM2dRRGV0NVptUGxwdW5vQU1D?=
 =?utf-8?B?MW00KzhGU3hFa3lCYmhrWW1ITTlkb2lGQUN4VmlKZTVPOUlHcmRsL2Zyajc3?=
 =?utf-8?B?RzlFdzlSYmdUM3BLb3RacGhUS013a1pFUkJwNW50SlRrZnBMOUVVWGZmdlB4?=
 =?utf-8?B?VXdpQzhtS2dwVGNRZWpldmdCeHpTTFkxTlRGY1dmYi9ZOWUzMnlBMms1U0tt?=
 =?utf-8?B?T1d2UnI3bnAvaGlyaUIwSXczbHhmZU9WaWhob2ZUdGUxY0pXSjcxS0ZIajg2?=
 =?utf-8?B?NUlBN0Fqc0I5elFpdEo2N2hBanp3RzNqZHVNOUhIZmtIN0VTZG0xSzRiV0NW?=
 =?utf-8?B?MnRMRnJKckN1YkJNd2JDOFlIYXRZYXhjaTFET2dvenNNM3lPRlpiVzBranJh?=
 =?utf-8?B?OHpGTU9pWDA1dlpaUWh3OU1ub3cvemtKTTA3bUw0Q3loNnY1dmtFYUNwSUhR?=
 =?utf-8?B?eVpncFpKankrSEdzcTZPVmluc1NiQXprbnJuYXNPWVV1TGdHeGU5eTFqc21D?=
 =?utf-8?B?WHozUW9KNU5kTzIwblNWcGpvQnFRb1dkaWhMNjlSNGdneFZBWjJ0dkF6dWxI?=
 =?utf-8?B?RXVaYTZINU5uVVI0d3lNK1RuUW5nRUt2RVdVSjEwallNdFlDc0Q4R2xYaTBD?=
 =?utf-8?B?L2w1bi9wZHVIQlpxVmNDeGVJd25xcDBDTjN3d0lLeTQycEhoT0kxdnVTaG11?=
 =?utf-8?B?ZTVkOXZXY0VoU0YxbFpreDJjeU9WNkZGdllZODRKNXJaTTNJdmVpWFg2YWRz?=
 =?utf-8?B?MmJqYmxJOEVCdjc2eFZVUzBSQ2kwRGNsS2RyY2pod1VUTHo4YnpmM0N0TDB1?=
 =?utf-8?B?QUsrTE5RNTV6S213VVBQRzAxNDFMLzJSWmFVdVp4clo2eFdpWlo0Z3dwMGxD?=
 =?utf-8?B?WDQzVGFKOFU0OG5RS3VEUHRwNjd6RVNoaTBTdExHaGxaYU5hZ0dsWGdpR01V?=
 =?utf-8?B?OXlZaDZoSlpWRVNteXU2bmVVWHRBU2IrMExHVVR2YzdSWnJ1RkswVHZxWDZn?=
 =?utf-8?B?TEhMNEVRamhuQmhEaXRaZUdZZGcwbTUwekZQNEd4NkhkYlJQQWU1QmZwaDAr?=
 =?utf-8?B?YURXOXRjV2d3a2c4Vi8rVGhTYXJzNzVQcnlzTncwSnRJQ0o3cnhtcEZaR2x0?=
 =?utf-8?B?Mng5MzFSVXhXR1FFSmxzN3hHdzcxbThmRHg4SDZWeGcyYnNmRHNrOGl5WlNw?=
 =?utf-8?B?NnZGYm9ISlh5QThUWGlsQTBkQ2YvR0V4TFhjKzdnZ2c4YWloSU1QdkdrM094?=
 =?utf-8?B?UUZtYm5vTnlHQ1RNWlNJaERVN01oSXcvdll5SFJaOFp3UC9hTG83NEJRdXdi?=
 =?utf-8?B?RjZyNlJZdFN3bTdaWm9UMFVQVjN6WXJERTA4eXBSWEMzNGRheUNTOTFFbGM4?=
 =?utf-8?B?Tmtia1ZiMWVVN3NxSDR1cndYOHJvTDQ3UWw5QytIMmQ3aEZVRTIwNjBYbEdY?=
 =?utf-8?B?UUUyNGZsRkE3NkxXRkRLOU41TnQxZ0Ftdnh1bE1PaTdaYnpiTGZ3cjdZOGhw?=
 =?utf-8?B?cHFPZVBjdWM4dzFGeE05cktZVlRSK005b29HbVBlT3BLUmNWakFHNDZOZklJ?=
 =?utf-8?B?eFM3VFQwVXBDQWdKSDRVaDVKL0VoTnRPL2FpdlhKZkFOVFhwa09UWVpPUWJu?=
 =?utf-8?B?N1Rjb3MrWEdKQm55a2JMamJKMnpuOGpWOFRlckdNQUFLUm54VnovdEN4Zmpi?=
 =?utf-8?B?WEt5ZFhIWkdkcG5nVCt4aWgzWHgra0ZHNFMzTWx1cU9VdzdVbHhBd1hMakxi?=
 =?utf-8?Q?6ve8=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0cad0cb-c090-42f7-7e9e-08d9f513a566
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2022 08:24:58.0589 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I3FeNYtehwlqtVQCeb8WZTmeMR1Pcgxmynx+qu99BYLwe/sQgq73hPjGm4J5M7vR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB4709
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
Cc: David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, linaro-mm-sig@lists.linaro.org,
 Qiang Yu <qiang.yu@amd.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 21.02.22 um 04:28 schrieb Qiang Yu:
> On Fri, Feb 18, 2022 at 6:24 PM Christian König
> <ckoenig.leichtzumerken@gmail.com> wrote:
>> Am 18.02.22 um 11:16 schrieb Qiang Yu:
>>> [SNIP]
>>>>> If amdgpu_vm_ready() use evicting flag, it's still not equivalent to check
>>>>> vm idle: true -> vm idle, false -> vm may be idle or busy.
>>>> Yeah, but why should that be relevant?
>>>>
>>>> The amdgpu_vm_ready() return if we can do page table updates or not. If
>>>> the VM is idle or not is only relevant for eviction.
>>>>
>>>> In other words any CS or page table update makes the VM busy, but that
>>>> only affects if the VM can be evicted or not.
>>>>
>>> My point is: we can't use amdgpu_vm_ready() to replace vm_is_busy(), so
>>> currently we update vm even when vm is busy. So why not use:
> Sorry, should be "vm is idle".
>
>>> if (!amdgpu_vm_ready() || vm_is_busy()) return;
>>> in amdgpu_gem_va_update_vm(), as you mentioned we prefer to not
>>> update vm when it's idle.
>> Because updating the VM while it is busy is perfectly fine, we do it all
>> the time.
>>
> Yeah, as above, my typo.
>
>> We should just not update it when it is already idle and was considered
>> for eviction.
> "and", not "or"?
>
>> In this situation it makes most of the time sense to keep
>> it idle and postpone the update till the next command submission.
>>
>>>>>>> Then we can keep the evicting flag accurate (after solving your
>>>>>>> concern for this patch that eviction may fail latter by further delay
>>>>>>> the flag update after eviction success).
>>>>>> That won't work. See we need to mark the VM as evicted before we
>>>>>> actually evict them because otherwise somebody could use the VM in
>>>>>> parallel and add another fence to it.
>>>>>>
>>>>> I see, make this too accurate should cost too much like holding the
>>>>> eviction_lock when eviction. But just delay it in
>>>>> amdgpu_ttm_bo_eviction_valuable()
>>>>> could avoid most false positive case.
>>>> Partially correct. Another fundamental problem is that we can't hold the
>>>> eviction lock because that would result in lock inversion and potential
>>>> deadlock.
>>>>
>>>> We could set the flag later on, but as I said before that when we set
>>>> the evicted flag when the VM is already idle is a desired effect.
>>>>
>>> As above, this confuse me as we can explicitly check vm idle when
>>> user update vm, why bother to embed it in evicting flag implicitly?
>> Well as I said it's irrelevant for the update if the VM is idle or not.
>>
>> To summarize the rules once more:
>> 1. When VM page tables are used by CS or page tables updates it is
>> considered busy, e.g. not idle.
>>
>> 2. When we want to evict a VM it must be idle. As soon as we considered
>> this we should set the evicted flag to make sure to keep it idle as much
>> as possible.
>>
>> 3. When we want to update the page tables we just need to check if the
>> VM is idle or not.
>>
> But now we does not check vm idle directly in amdgpu_gem_va_update_vm().
> If VM bo has not been considered for eviction, it could be either idle or busy.
>
> Just want to confirm if the fix should be only change amdgpu_vm_ready()
> to use evicting flag or besides using evicting flag, also check vm_idle() in
> amdgpu_gem_va_update_vm().

Only changing the amdgpu_vm_ready() should be enough. It can be that 
this then bubbles up more issue, but those need to be taken care of 
separately then.

Regards,
Christian.

>
> Regards,
> Qiang
>
>> 4. When a CS happens we don't have another chance and make the VM busy
>> again. And do all postponed page table updates.
>>
> Anyway,
>
>> Regards,
>> Christian.
>>
>>> Check vm idle need to hold resv lock. Read your patch for adding
>>> evicting flag is to update vm without resv lock. But user vm ops in
>>> amdgpu_gem_va_update_vm() do hold the resv lock, so the difference
>>> happens when calling amdgpu_vm_bo_update_mapping() from
>>> svm_range_(un)map_to_gpu(). So embed vm idle in evicting flag
>>> is for svm_range_(un)map_to_gpu() also do nothing when vm idle?
>>
>>
>>> Regards,
>>> Qiang
>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>> Regards,
>>>>> Qiang
>>>>>
>>>>>> Regards,
>>>>>> Christian.
>>>>>>
>>>>>>> Regards,
>>>>>>> Qiang
>>>>>>>
>>>>>>>
>>>>>>>> Regards,
>>>>>>>> Christian.
>>>>>>>>
>>>>>>>>> Regards,
>>>>>>>>> Qiang
>>>>>>>>>
>>>>>>>>>> Regards,
>>>>>>>>>> Christian.
>>>>>>>>>>
>>>>>>>>>>> Regards,
>>>>>>>>>>> Qiang
>>>>>>>>>>>
>>>>>>>>>>>> Regards,
>>>>>>>>>>>> Christian.
>>>>>>>>>>>>
>>>>>>>>>>>>> Regards,
>>>>>>>>>>>>> Qiang
>>>>>>>>>>>>>
>>>>>>>>>>>>>> What we should rather do is to fix amdgpu_vm_ready() to take a look at
>>>>>>>>>>>>>> the flag instead of the linked list.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Regards,
>>>>>>>>>>>>>> Christian.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> Signed-off-by: Qiang Yu <qiang.yu@amd.com>
>>>>>>>>>>>>>>> ---
>>>>>>>>>>>>>>>          drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 85 ++++++++++++++-----------
>>>>>>>>>>>>>>>          1 file changed, 47 insertions(+), 38 deletions(-)
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>>>>>>>>>>>>>> index 5a32ee66d8c8..88a27911054f 100644
>>>>>>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>>>>>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>>>>>>>>>>>>>> @@ -1306,45 +1306,11 @@ uint64_t amdgpu_ttm_tt_pte_flags(struct amdgpu_device *adev, struct ttm_tt *ttm,
>>>>>>>>>>>>>>>              return flags;
>>>>>>>>>>>>>>>          }
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> -/*
>>>>>>>>>>>>>>> - * amdgpu_ttm_bo_eviction_valuable - Check to see if we can evict a buffer
>>>>>>>>>>>>>>> - * object.
>>>>>>>>>>>>>>> - *
>>>>>>>>>>>>>>> - * Return true if eviction is sensible. Called by ttm_mem_evict_first() on
>>>>>>>>>>>>>>> - * behalf of ttm_bo_mem_force_space() which tries to evict buffer objects until
>>>>>>>>>>>>>>> - * it can find space for a new object and by ttm_bo_force_list_clean() which is
>>>>>>>>>>>>>>> - * used to clean out a memory space.
>>>>>>>>>>>>>>> - */
>>>>>>>>>>>>>>> -static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
>>>>>>>>>>>>>>> -                                         const struct ttm_place *place)
>>>>>>>>>>>>>>> +static bool amdgpu_ttm_mem_eviction_valuable(struct ttm_buffer_object *bo,
>>>>>>>>>>>>>>> +                                          const struct ttm_place *place)
>>>>>>>>>>>>>>>          {
>>>>>>>>>>>>>>>              unsigned long num_pages = bo->resource->num_pages;
>>>>>>>>>>>>>>>              struct amdgpu_res_cursor cursor;
>>>>>>>>>>>>>>> -     struct dma_resv_list *flist;
>>>>>>>>>>>>>>> -     struct dma_fence *f;
>>>>>>>>>>>>>>> -     int i;
>>>>>>>>>>>>>>> -
>>>>>>>>>>>>>>> -     /* Swapout? */
>>>>>>>>>>>>>>> -     if (bo->resource->mem_type == TTM_PL_SYSTEM)
>>>>>>>>>>>>>>> -             return true;
>>>>>>>>>>>>>>> -
>>>>>>>>>>>>>>> -     if (bo->type == ttm_bo_type_kernel &&
>>>>>>>>>>>>>>> -         !amdgpu_vm_evictable(ttm_to_amdgpu_bo(bo)))
>>>>>>>>>>>>>>> -             return false;
>>>>>>>>>>>>>>> -
>>>>>>>>>>>>>>> -     /* If bo is a KFD BO, check if the bo belongs to the current process.
>>>>>>>>>>>>>>> -      * If true, then return false as any KFD process needs all its BOs to
>>>>>>>>>>>>>>> -      * be resident to run successfully
>>>>>>>>>>>>>>> -      */
>>>>>>>>>>>>>>> -     flist = dma_resv_shared_list(bo->base.resv);
>>>>>>>>>>>>>>> -     if (flist) {
>>>>>>>>>>>>>>> -             for (i = 0; i < flist->shared_count; ++i) {
>>>>>>>>>>>>>>> -                     f = rcu_dereference_protected(flist->shared[i],
>>>>>>>>>>>>>>> -                             dma_resv_held(bo->base.resv));
>>>>>>>>>>>>>>> -                     if (amdkfd_fence_check_mm(f, current->mm))
>>>>>>>>>>>>>>> -                             return false;
>>>>>>>>>>>>>>> -             }
>>>>>>>>>>>>>>> -     }
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>              switch (bo->resource->mem_type) {
>>>>>>>>>>>>>>>              case AMDGPU_PL_PREEMPT:
>>>>>>>>>>>>>>> @@ -1377,10 +1343,53 @@ static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
>>>>>>>>>>>>>>>                      return false;
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>              default:
>>>>>>>>>>>>>>> -             break;
>>>>>>>>>>>>>>> +             return ttm_bo_eviction_valuable(bo, place);
>>>>>>>>>>>>>>>              }
>>>>>>>>>>>>>>> +}
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> -     return ttm_bo_eviction_valuable(bo, place);
>>>>>>>>>>>>>>> +/*
>>>>>>>>>>>>>>> + * amdgpu_ttm_bo_eviction_valuable - Check to see if we can evict a buffer
>>>>>>>>>>>>>>> + * object.
>>>>>>>>>>>>>>> + *
>>>>>>>>>>>>>>> + * Return true if eviction is sensible. Called by ttm_mem_evict_first() on
>>>>>>>>>>>>>>> + * behalf of ttm_bo_mem_force_space() which tries to evict buffer objects until
>>>>>>>>>>>>>>> + * it can find space for a new object and by ttm_bo_force_list_clean() which is
>>>>>>>>>>>>>>> + * used to clean out a memory space.
>>>>>>>>>>>>>>> + */
>>>>>>>>>>>>>>> +static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
>>>>>>>>>>>>>>> +                                         const struct ttm_place *place)
>>>>>>>>>>>>>>> +{
>>>>>>>>>>>>>>> +     struct dma_resv_list *flist;
>>>>>>>>>>>>>>> +     struct dma_fence *f;
>>>>>>>>>>>>>>> +     int i;
>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>> +     /* Swapout? */
>>>>>>>>>>>>>>> +     if (bo->resource->mem_type == TTM_PL_SYSTEM)
>>>>>>>>>>>>>>> +             return true;
>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>> +     /* If bo is a KFD BO, check if the bo belongs to the current process.
>>>>>>>>>>>>>>> +      * If true, then return false as any KFD process needs all its BOs to
>>>>>>>>>>>>>>> +      * be resident to run successfully
>>>>>>>>>>>>>>> +      */
>>>>>>>>>>>>>>> +     flist = dma_resv_shared_list(bo->base.resv);
>>>>>>>>>>>>>>> +     if (flist) {
>>>>>>>>>>>>>>> +             for (i = 0; i < flist->shared_count; ++i) {
>>>>>>>>>>>>>>> +                     f = rcu_dereference_protected(flist->shared[i],
>>>>>>>>>>>>>>> +                             dma_resv_held(bo->base.resv));
>>>>>>>>>>>>>>> +                     if (amdkfd_fence_check_mm(f, current->mm))
>>>>>>>>>>>>>>> +                             return false;
>>>>>>>>>>>>>>> +             }
>>>>>>>>>>>>>>> +     }
>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>> +     /* Check by different mem type. */
>>>>>>>>>>>>>>> +     if (!amdgpu_ttm_mem_eviction_valuable(bo, place))
>>>>>>>>>>>>>>> +             return false;
>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>> +     /* VM bo should be checked at last because it will mark VM evicting. */
>>>>>>>>>>>>>>> +     if (bo->type == ttm_bo_type_kernel)
>>>>>>>>>>>>>>> +             return amdgpu_vm_evictable(ttm_to_amdgpu_bo(bo));
>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>> +     return true;
>>>>>>>>>>>>>>>          }
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>          static void amdgpu_ttm_vram_mm_access(struct amdgpu_device *adev, loff_t pos,


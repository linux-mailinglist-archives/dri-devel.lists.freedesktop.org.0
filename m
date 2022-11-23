Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A52636311
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 16:15:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0784D10E574;
	Wed, 23 Nov 2022 15:15:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2084.outbound.protection.outlook.com [40.107.93.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFC2B10E570;
 Wed, 23 Nov 2022 15:15:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W4U3EthDStDyP5R3lgHOW6+IaaN+sbsjX1+3RFWqEROJ6VdqCC4VWKTmnFqAv/i9LU7nkLqqRci2uVM2gFqV0ci+Ii7YP/aepCIM2MFqDF03zJmA/xByshrp1kyQDQQecEseYVfT3d6SozbTW9Ju2piCvgQbvcox8n7x6FU9ruGiYiYR4ur6LqSosu15RUIt/zZzUY9+Xp7aGcHv1f4TEY7j092dclMNY3+wO+AMMOlPsIr0SsnazJLLTjDwmZvlxJQabmM9Esekmp5qgBJZaLyNSO0ef0uS6ZykrAF+xMSuhLhF4yoJZcl5x+nqSp13TttLIHON5zWNQEe8dC+Izw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wKTVsOCxfb0T9lrZNGy66XsnGztNm3F5bVbRBCgXcxI=;
 b=K7jtU7KF6Q3DeqDbXyTSPqGIBhhEm8GvA4/nX1e4Na+IFX12Ir+WtyCGmgkdepOOOBYk04I1olTpipfClc940sxLVQIO1/01XebAcC5r+xL09RKKViu7CGZclvWcZy5WCo9P9iJzFquue7+XoHsfb9afCEkiBKKj87dqCBFtMPltILvmmCVR4Wlk9VuTcyzM3zvgc2w6HRkKec6q49x0mIBJ2eUAddeSuKpU3vL7PweCvp5mN1YnLMsXWZXuqUWeTD2a+aQ9lRu9n775NWSiY9Gkko+7q1UQoiZmjg5SO2TBmkI7JPaU67ECNW7s8sCoU1+TTmaWji8l3mgSQ8FJRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wKTVsOCxfb0T9lrZNGy66XsnGztNm3F5bVbRBCgXcxI=;
 b=JzBLwm+w6g+w/aI3wf+UKNsQFWmh1rcVPyQqtR4ymVmWmBw3OoGAiiQOLHRuvMNq910Xl9OR1EjTzmHCZSXyLZ2GqbVqBgbU15BUCo1SbPxG/4yI2RxllCW3+UYskcBCdna238pkVtbEdqWwCOzRL4ZBhA9OmHjujWMkqNwmdgg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DS0PR12MB7748.namprd12.prod.outlook.com (2603:10b6:8:130::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.8; Wed, 23 Nov
 2022 15:15:11 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421%7]) with mapi id 15.20.5834.015; Wed, 23 Nov 2022
 15:15:11 +0000
Message-ID: <dcb88724-c68e-6f2a-03d5-0641d2e68ec6@amd.com>
Date: Wed, 23 Nov 2022 16:15:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [Linaro-mm-sig] Re: [PATCH] dma-buf: Require VM_PFNMAP vma for
 mmap
Content-Language: en-US
To: Jason Gunthorpe <jgg@ziepe.ca>, Daniel Vetter <daniel.vetter@ffwll.ch>
References: <3d8607b4-973d-945d-c184-260157ade7c3@amd.com>
 <CAKMK7uHVGgGHTiXYOfseXXda2Ug992nYvhPsL+4z18ssqeHXHQ@mail.gmail.com>
 <b05e6091-4e07-1e32-773d-f603ac9ac98b@gmail.com>
 <CAKMK7uFjmzewqv3r4hL9hvLADwV536n2n6xbAWaUvmAcStr5KQ@mail.gmail.com>
 <Y34WI9SZdiH/p1tA@ziepe.ca> <f8f844a5-0910-d19a-5aea-df7a1d83b1d3@gmail.com>
 <Y34XvmtHfb4ZwopN@ziepe.ca> <dc2a9d7f-192b-e9d8-b1d1-3b868cb1fd44@gmail.com>
 <Y34gBUl0m+j1JdFk@ziepe.ca>
 <CAKMK7uEzaUjroODbWe4DtxHQ+gmr7_DVK+fUJjAgMsgP61uGSQ@mail.gmail.com>
 <Y343ijGoqyf73d+I@ziepe.ca>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <Y343ijGoqyf73d+I@ziepe.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0186.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::13) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DS0PR12MB7748:EE_
X-MS-Office365-Filtering-Correlation-Id: 46590196-1c59-45a3-2e74-08dacd6583a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Oz1A8FIRpS09GuvpCsMrYyZfB2dAfQsFIsluNVW/pVT2yav2jAof6fP+HrPdunD2Rcq9NjtFQCHJadcENXvE8w5R85kuTfFgigDSQHecCha+XAXPg/wt3kj1FNEr8CEItDD3QT3rG2M/K6rO2upvAyK8J5rE5QQstaiJjjpW6nMnr+N6VMzNIDy3s4C7uwaw3OmFKgLAiVs77TPPnbmLMNDhEvBr87g8Rm0clljCAsB/l6B5UNlM+sXRHmf+YkIx3z/rY0wg0s/IDIW8SzHz7ZxyFAhFZumrZj4BeoBQHmRpgOAO1DxG1pSDny3+ab4sHijlsI5ZNuE1okG/eMd4ykWeIXiRXkuNgXNVbeFP7h03rvjXDyRzuuFXrCIE1mKEEE8cu2sJ8DRLkI8T5d+JUWKDRcop8qxn+MxBOyaEH2qdkniYZJpwrQvzZoSndcFLHbYQn9qERB892pM629kGspWWcuINR5U4LCweTZIJg7nkLSrAnMedonGFiV2TP8AYVf0W+kJ7dsSUO2nD1JrGpJHJ6+6Fgd4N/6hh+B2JO3y6cz/eDgbizo0L/rW0RdGWgHbxaqYqM2zMZQoG9YBCJwprWnxQT+XQsSBcbBX0PaVTqyAp5Y3tV5LQX7LxmWJycpYTkTLR+0U29SLsLECZ5w4ClHJZWlkFi3ayFpo85K9/ofEzAjTl42rlljWo6ze8nn+U38ElgCeAtVppjAPx/X4F6S+R3yNeinOJaXpgmn4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(346002)(376002)(136003)(396003)(366004)(451199015)(31686004)(8936002)(7416002)(4326008)(8676002)(5660300002)(54906003)(316002)(41300700001)(66476007)(66946007)(66556008)(2906002)(36756003)(6512007)(2616005)(6506007)(478600001)(6666004)(110136005)(186003)(86362001)(38100700002)(31696002)(6486002)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SFh3UmZRU3NGMVozRkhsMnNibW5mV21qNHdUK3d4eVdXcElzQ3R1ZFhRbGtW?=
 =?utf-8?B?RWtVWVR6d3NmdWpCYkRSMnI0QU9RR3B1V2NBdDBYWUdVaFgwZVlTaUNuOTA0?=
 =?utf-8?B?YnMxQmU0Uit0bHdIb0ZxM1hjaDdMclR3RnRoR2dhNVEzay9YWTZFNERRV2RY?=
 =?utf-8?B?QkNZbUxGUDFtaW5HK1R1UVlLVkdGb1hLMjJWaDU2Q1pEa2trMThRQjYwbXow?=
 =?utf-8?B?K1BhQ21Ba1h3QlJmamxvQWVBa2FRUXdqVUZXL1dDc0gvZVJPVmQzZlBEd2wx?=
 =?utf-8?B?UnVkMk1hWnBjNG85QWZ0c3RNTk5SREZpVHd3Tlp6MXBKZmFzd3p6bEtiTWho?=
 =?utf-8?B?KytJeG1OSjgwZmp2TVVsaW42dE5zcmVJbVR5WVlFZVNNd1REbW5BcHQvaThW?=
 =?utf-8?B?a3dGVFhCaGx5eE1XYTNzOEdzV2IrbHJ0dXNyblBUenMxQmZKZ0lnNS8rK1lu?=
 =?utf-8?B?RUlIc0FuQjNuRXFIcnlOVXQ1WkRnMUR3RmNnQ1BHTHVjdlVwMWpCMmVndm9p?=
 =?utf-8?B?SjBnaFBIRSs5WDhyaytlWXZha3BBNzdWRFo4dFkvOFRPZ0tBS0dPUGgxVXVH?=
 =?utf-8?B?STVYZ2tWTkxVRktuSFlwNWtjcWRKZ1c5QWl5TUorN1JwU1NlNkFObVYzWFNO?=
 =?utf-8?B?TXBDTkVja052MjNDQ0RhVVovdjZLR3ZNTnl3eGJQZEhPWGZvdnE3bnVjYTNl?=
 =?utf-8?B?OVdCOHFNMmFKYUd5V1FYM3cyZlI1S0lueVlJUXRteGRLUVpYb3BKSmk0QjJq?=
 =?utf-8?B?SG5aejV0a3lURU9kbXJnZFpNVTAxam1KT2pMZjE3NlQwcUNPa3NNUE03YlFl?=
 =?utf-8?B?K2FRYmdkQm55dElrUlVqVEU3RksrYU1oVm8vRUdGc2tibmFtTHV5NURDK0k1?=
 =?utf-8?B?a05wUnNjYzZrQjdMSTRkb0ZIb3JQUHpudDFKSHhPSzhzVmJTeC9hZDAxTEFJ?=
 =?utf-8?B?SHc5MW9jbXpzVVNUa2FEcWxUQ09IV203bkU5aWZEOHhwUWRwMzNRTGdKOGhl?=
 =?utf-8?B?M0pvSzgvdis1c25Rc2RXOHNIQm9QR0ZVN0VLU0hDWU52ZWpSNS8rTVJ3amVR?=
 =?utf-8?B?Qk96aDRGaU9LT1FqaWRhMzBZRXBxSFJvQlBzc3FBczNUM0NiNWlLM3ZWbGZJ?=
 =?utf-8?B?dmtBWjQ0N05pcDBnRHIxMDlSUlJoaE1qWmlpYjJ2d0JxRjBiNUtFdlY5cm5U?=
 =?utf-8?B?YUpPTGZidlpzdjE4TzRLRTZFSU92WGdGNk1IZDRHMk92THNGMHBnc0NUUjI0?=
 =?utf-8?B?eGxoV0NwSHQ5ckdUVExpNGpFOVpEQTlpd1A0WGtIRDVxeHZDTEdzelVLNThS?=
 =?utf-8?B?U2VGMk0rdnkzajdKZ0tjT040YTh1V2lTcWhIM3VMbE0waERpMlBoOTN6ZzNU?=
 =?utf-8?B?dUlRQ0dqNHpHNUZHNlprTmIrSzZSc0RhRGV6ZTdOQWZuMzF6anV4K24zQjVt?=
 =?utf-8?B?bC9TZEYxcW9EQUVzdTlNbXZNaGo0cFoxNDB1ckgwVmh3WHcvN0R3aUh3Kzl2?=
 =?utf-8?B?dHRaM09abkdEVGU3Z3ArNEFhcllYN0dBYkJPV2VuaC9QU3RnMUQ5U0JUaXgy?=
 =?utf-8?B?dGpqOHNoSG1KbFBHa052NHNyUkh4OGhZc29iL0s1ZXJSQnduRFVrYUN4dExX?=
 =?utf-8?B?ZzlzSUpiLzIzbDVvV1doeFk0QkNiV0FEWlp3K0ZhS3llSVhCb3dOUnFxZmgz?=
 =?utf-8?B?d3ZQdGRERlpBTjd1a2RQTVNhWEcrSXEwbkI3cG1weDlOLzNyZ1hHRlk3SU95?=
 =?utf-8?B?Ykp3VWZuL2pHekVZZDY4VDlOZmYrMXFIc0dnYWdYYUJrcFF6ZjRydGo3SVFB?=
 =?utf-8?B?SEdLVU8va1g3SEJCUXdEUVBGeTNCZHJTUUFGbUhjREtOTlI4Wjl0N1FVRUIw?=
 =?utf-8?B?MC9QTzBwM2xkbjI0OFpJUTk2QnVKOTNBaDRiSjlsSllsejJZZEkxdEUvSnJ4?=
 =?utf-8?B?TG1jbDhYWTdhN1dLMjBGMmpqT1BoTTFmSG9GR2RxZ1BwU1lteVJxT2FSZ3kv?=
 =?utf-8?B?NFQrK0I3d3pMK1hGTzZGUlhJc3JPTzkvUUUwVmkyZGpmSnU1YW9JTEowUkIz?=
 =?utf-8?B?YVpPWVFsZVNsZWI0SFYzTFhETUdFTEhpZlgvZnFtOVRzNUIxRThNVFE2QUlO?=
 =?utf-8?B?RkxUTzFqZ0VqTDRlQk5XWkRNU3BUUDFWZWhHV2xFQ1g1c1ZubGZ2d0VidVBI?=
 =?utf-8?Q?65xnkd/kAydxkzm3nXMOYhyILfVzG82uvvC0T2QHM22Z?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46590196-1c59-45a3-2e74-08dacd6583a6
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2022 15:15:11.2787 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f3kHoREcOQahquNHsiHZbXlPeplWeY9y8faoUo8Qgh2+78vkXtJD4Sg77zshlGef
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7748
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Wilcox <willy@infradead.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 linaro-mm-sig@lists.linaro.org, John Stultz <john.stultz@linaro.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Suren Baghdasaryan <surenb@google.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 23.11.22 um 16:08 schrieb Jason Gunthorpe:
> On Wed, Nov 23, 2022 at 03:34:54PM +0100, Daniel Vetter wrote:
>>> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
>>> index 1376a47fedeedb..4161241fc3228c 100644
>>> --- a/virt/kvm/kvm_main.c
>>> +++ b/virt/kvm/kvm_main.c
>>> @@ -2598,6 +2598,19 @@ static int hva_to_pfn_remapped(struct vm_area_struct *vma,
>>>                          return r;
>>>          }
>>>
>>> +       /*
>>> +        * Special PTEs are never convertible into a struct page, even if the
>>> +        * driver that owns them might have put a PFN with a struct page into
>>> +        * the PFNMAP. If the arch doesn't support special then we cannot
>>> +        * safely process these pages.
>>> +        */
>>> +#ifdef CONFIG_ARCH_HAS_PTE_SPECIAL
>>> +       if (pte_special(*ptep))
>>> +               return -EINVAL;
>> On second thought this wont work, because it completely defeats the
>> point of why this code here exists. remap_pfn_range() (which is what
>> the various dma_mmap functions and the ioremap functions are built on
>> top of too) sets VM_PFNMAP too, so this check would even catch the
>> static mappings.
> The problem with the way this code is designed is how it allows
> returning the pfn without taking any reference based on things like
> !pfn_valid or page_reserved. This allows it to then conditionally put
> back the reference based on the same reasoning. It is impossible to
> thread pte special into that since it is a PTE flag, not a property of
> the PFN.
>
> I don't entirely understand why it needs the page reference at all,

That's exactly what I've pointed out in the previous discussion about 
that code as well.

As far as I can see it this is just another case where people assumed 
that grabbing a page reference somehow magically prevents the pte from 
changing.

I have not the slightest idea how people got this impression, but I have 
heard it so many time from so many different sources that there must be 
some common cause to this. Is the maybe some book or tutorial how to 
sophisticate break the kernel or something like this?

Anyway as far as I can see only correct approach would be to use an MMU 
notifier or more high level hmm_range_fault()+seq number.

Regards,
Christian.

> even if it is available - so I can't guess why it is OK to ignore the
> page reference in other cases, or why it is OK to be racy..
>
> Eg hmm_range_fault() does not obtain page references and implements a
> very similar algorithm to kvm.
>
>> Plus these static mappings aren't all that static either, e.g. pci
>> access also can revoke bar mappings nowadays.
> And there are already mmu notifiers to handle that, AFAIK.
>
> Jason


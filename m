Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 841FA4DBD76
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 04:20:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38C238984F;
	Thu, 17 Mar 2022 03:20:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2065.outbound.protection.outlook.com [40.107.244.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0B4F8984F;
 Thu, 17 Mar 2022 03:20:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VD8ChS86ql8I3EHi6a2cD1bMNKBzKSsFoHvNwy1KYR5YN+nzleYEAQn3vf/3Q69vfqGj4ZcHrYpDRyBTejn/Fg8BYyphIf8JZSYYGfMBizmXkdGFWEA5pJMBmMGgBSKIuQU5AiclqjhVa/vt+iguO8SxVPgQJ9O8ukkg5+WgUSD+zaXe1FDSwFCSB+dT6wKooa+YNwUkIAWDUv4kSMSW9qz/bbubCdtkEBu7l3AuA5/KXgV8JQ1yQBdcILvEcJF9FFOC3rmr364XKCHfohi+QmFWH5a5G1TDsVpLhejjuA0R6Mkh1jO7Fx6sDs+41BlSVOAQIZK/DtsG1TS3C0n42Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2hZXs5614Ry23AFr3tQIw/LDAHUOvFd4D9TAbEVNAl0=;
 b=n6Ay1j9//1uv9ytHJ/yLXCRSuE+zyZ+x2mBETyM2NW9qzCrHJBGSGY2AVGRhKCO3fnMHRtFOUrHv1wtvO2a7PRFxsigmRR5vojlR+KLhj8PEt1iZzJRrDtEh7Vfhl32Uzuv6JbkRUpM5h+eQJS+H1+sXp4fVbDFEEHDbZ3UuQa/4c2UTU6TH86PXdztYBUopSfEQc/mroZEIvB+sayvt0eWduXTWZ2WL17qMzPZisCt7VaUp+EMp+gBe/XVXv+eB2wEVGIN0ONAebsHAdfGrz5JVZwVE0zITNNGy0F0a1eYaFCMxudMSXvPSXdq8M7i02AaXXo/HQ2b4u78yzlNVpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2hZXs5614Ry23AFr3tQIw/LDAHUOvFd4D9TAbEVNAl0=;
 b=MuEDe15Q8bkZSxlfW6Ek8ftvvS23YlgypiuOhIBVXm122+ge7Yy6GqHsOl60Bgt/+BD9ZEfu4aQXo3PO3so6I1TT8Buo7e5stYH9IyOHRhUAN337FuIjqmxYmxecjeZ00uRqfSUIay/7rlIfe3B43lPEKkAoZvAI4Nh4MT+lwGd2djA5+3qMOZL9XwXBekltKHBf1qVYSKcORa3KW7h+PnD7/tVFRPfzFrmcI+Il4JxUEuZwoprCiY+zBaMQo6EjSqXTXATvUipe9JBXeWp/6Czpqtv+DmZUXRCF8oONN9nUSb6Z24vmJYH4et3nCr88legVF9ggZPwZFeHQdYGDDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by CY4PR12MB1750.namprd12.prod.outlook.com (2603:10b6:903:11c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Thu, 17 Mar
 2022 03:20:48 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::152f:613b:7041:68d6]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::152f:613b:7041:68d6%7]) with mapi id 15.20.5061.030; Thu, 17 Mar 2022
 03:20:48 +0000
From: Alistair Popple <apopple@nvidia.com>
To: Felix Kuehling <felix.kuehling@amd.com>
Subject: Re: [PATCH v1 1/3] mm: split vm_normal_pages for LRU and non-LRU
 handling
Date: Thu, 17 Mar 2022 13:54:32 +1100
References: <20220310172633.9151-1-alex.sierra@amd.com>
 <20220310172633.9151-2-alex.sierra@amd.com>
 <07401a0a-6878-6af2-f663-9f0c3c1d88e5@redhat.com>
 <1747447c-202d-9195-9d44-57f299be48c4@amd.com>
User-agent: mu4e 1.6.9; emacs 27.1
In-reply-to: <1747447c-202d-9195-9d44-57f299be48c4@amd.com>
Message-ID: <87lex98dtg.fsf@nvdebian.thelocal>
Content-Type: multipart/mixed; boundary="=-=-="
X-ClientProxiedBy: BY5PR20CA0004.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::17) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 792d664f-dca3-4051-ca5f-08da07c52196
X-MS-TrafficTypeDiagnostic: CY4PR12MB1750:EE_
X-Microsoft-Antispam-PRVS: <CY4PR12MB17508FC1392C4CCA02FE65B3DF129@CY4PR12MB1750.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ObGGRxDpTibUGN0gK4MzABNcJ/qiRhdOUe0ZdMOg5KwsVGf2KZC5E06Q/tSFeYNVl9FNh1R50SB47jVs05p2nCpVr+C3Eh4sr0AV2yUXJJjFX26UaVehVtrIOdqLd+R4uencBUX5UCpoFUYGlCIrtiULECikuEKKu8k49muulmFJ3s0xLIeneMU3z8XfLDRFhgUhZC27Em053hhpymIzaVeDD0IDUtr8K5nlI83pD1xxgQSGLgwmSfGze2ECEnNjgU+ReLUZCv+g3bjSP1Ae2P/iDPhpWpCa2im1A4NFdY8MDjGQoLWVH22HWGJaO25hEm7MV4hT9G3Sk74cA84jk3AmQ3RV0I6lbuS5VgQEubWeF+oy8ERbxncbCSNZSq1UxR09s6Wzkt6sInCGiM/bZmOwqBgCKWB/6TpHYNm0ZLPa4+XOLUNLMaCHRicSVADY54df9YMeCAEpnC93RZ4Eg63o07EXckKKkE9wKygzyUK4gPxqvlgJqUPOnX1zp2yaVRdGqogG6dMTHAS2HFNpT6S+fJQ977NT56dS+ml/HdJXbCv3/Kv4ZwZ6DWci3QnN+yYvGkkLIhKKbDg/9IrfPesoiwBw4HyfQWxPHTUE+id4Oh+NTXYgKAfxeX17ttoK7HUlX7Y9Z2olrgZQa9O+4Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6666004)(6486002)(508600001)(7416002)(5660300002)(316002)(26005)(186003)(6916009)(66946007)(54906003)(66556008)(2906002)(8676002)(4326008)(66476007)(9686003)(6512007)(8936002)(6506007)(44144004)(53546011)(33964004)(86362001)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bU1HL1I3dzRzSCtJQkpIU1F6Q3pDRWJ0Q0ttZDZ2em0ya20wM2R5MU41bzNS?=
 =?utf-8?B?TTUrNnZvS3BFSjNuTFF2STNnL1hkZ2ZuOXB1eVppckxTN3lDWGY5VCttQ1BW?=
 =?utf-8?B?Z3dBMVVRRWdqRzRPeUIzOElISUc4QU5SVUpLOTdxRkltRDlndmQvcVB0OURM?=
 =?utf-8?B?Y0lCeS9jU2NEYXNZQm5LaHNMZnVGQmQ5QTkzMHhTZnNhNk8vSzdyUHhXNjZZ?=
 =?utf-8?B?Wi9OdFd5QVdTZ3RaWXk1dVVWRVlSVEN3SzJBemNmMVhNWDlCbk9hWjg5QS81?=
 =?utf-8?B?WGhYM04yR2tOK2o4RUxwZTBFVFdQakVnTWtsMmZUTyt1R3pzNlVvUmJSdEsx?=
 =?utf-8?B?WkYyeDlVTU82a2tDWVM2Q2NDN1pvbGlxVkZxaXpkYzRvY2MwazFjd2hseHNq?=
 =?utf-8?B?QjF3V2g5ZGNUTkRmMm1FcGM4V25DQjhpaUxXcTgzd3ViVTUxaE82bVlvRmRO?=
 =?utf-8?B?Z2Y5K1d3bE9pRGJlam9sMDFKcUEvdHNscjN1WVlCdFpoM0FQVEljMEx2RkVW?=
 =?utf-8?B?SXcxaXVPUVRUSE1hQlZPM0tvTkQ3VUtrN2FQT1BGS3VEc0Fwc1BET2dsQkRm?=
 =?utf-8?B?ZXN0eVJNTFNnWDRWL0xxVmVqY25QQlM4Z0hCS01XOTNnNzV6dkVUdUlwOFhL?=
 =?utf-8?B?TlM3bUtLWlZwR0o5WlpmSmZsU0FSNUYyenBoMDRVTytCZC9kR0FGc2pJU0sy?=
 =?utf-8?B?N21WOExhMVJVWWNQYjVmZDFJSkJGQWdZbWFXSjBxb0hydmZ5L0plMDRGZVN2?=
 =?utf-8?B?OEw5dWN0dUVBNWUraHlmZ1hQcGxlRVNMUTVnRnlJcnhpamNMMkhWS1NaVytJ?=
 =?utf-8?B?QTZUbEp1UnlYbVNEZldIMytBdi9mVG45WVhVQ3pieW9UUTZEejNqSk5ha3ZJ?=
 =?utf-8?B?K3pFa1pGQm9rbnkzbGJYMzViOHBXdUhZYVR3ekxFc0JSK0ZCY0lyS1hoNS9a?=
 =?utf-8?B?cjBsM1ZzWmw4ekJCL3BXUGMvZ3hCK1R0MWxSR3JZTzBEalg4WmNXWUEzSHB2?=
 =?utf-8?B?a09UVnBXbjlpVGVrcEhnQ0k4dTdSdEJTeGkxQ0preDRtaU04WUNMbmUrcWFh?=
 =?utf-8?B?Z3RCUkhyNk8wWGVJTnVJeVRXSE9ZVUp0cHVOSnNuditxYnBzNVZhWUNZTm11?=
 =?utf-8?B?cS9JeW95ZVRSTERhNWowWCs3Zi94SmtGNVg5bUZYZmUwc3hnUGpUMVBDY05h?=
 =?utf-8?B?SEVOUThvanZoU3VIZVFmNTY0bXBmZDBjWkZRR2gvQUpSekt1VXYvOFQ0N253?=
 =?utf-8?B?ckwrZ1JTb3prWmtValN4MnRYcERZYXJMRXIvQThGWEFvNDhDUkxvUk52a3NB?=
 =?utf-8?B?dWZydWt1N0FkWnU0VVM4WTFITE1FdzlqbjJGOFI2ck1oZWcvcmZuZXA5T3dB?=
 =?utf-8?B?Wjl2TlRzeGtaM0xzN21ULzdhNTJRSG9IUTJ4bEJJRVZZWWRac3lUMmZ6bzJW?=
 =?utf-8?B?S095REk1OXVVd20rN3BXc3RWTUtGbTlqMFkzM3dlTVNkMjhrbFR6ZTVGb1FC?=
 =?utf-8?B?N2pTYkFKVFJQM0dOenBMUm9wRERwL2dJZzFkZ3daY0dKWXJGeTZXQUZWRnFp?=
 =?utf-8?B?T2dRamFCQnJQMG5CMFRmOTV6Y1A5aTJYa0N3KzhGK0VTbGMrREx5dkJzVUpx?=
 =?utf-8?B?WEpPbmFJaitjUVl6bE1kcWJVZHpQMkliZEJycWZua2tlNlVKQmg5QjdlWUdD?=
 =?utf-8?B?anVIeWF3a1Z2cW1BMjJKTktQUDJ5bTV2TFdCWUo1cmtoOGFzKzBxYm1lK2h2?=
 =?utf-8?B?bEpkak8zcnBlNUhnb0prMnk5bE5oeHZaQkxMM0xMa0lQanFuU0xsdW5TaFR5?=
 =?utf-8?B?OUlxemdVMTBZSzk5NmV2aTFrVEJzeHJaYmFZczRHemljWVlNY3l5azBWUUVG?=
 =?utf-8?B?MHJ1UjJselNOUE4vN2pXNTdpNy84N2hYdUkyZDhxK2VvRit2WGUzdG9LZmFB?=
 =?utf-8?Q?XTlAofVH35o3jxAcI42aUAceoHbvAuGR?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 792d664f-dca3-4051-ca5f-08da07c52196
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 03:20:48.1234 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dqU/RXm16+RQUo3Xt06yKA5nAmBiBb3CrcZCjOk/Sjz79bMK5C2XjjQCl0Q/00JU7WG5VrZZ2iFO3hjRDF86Tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1750
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
Cc: Alex Sierra <alex.sierra@amd.com>, rcampbell@nvidia.com,
 willy@infradead.org, David Hildenbrand <david@redhat.com>,
 amd-gfx@lists.freedesktop.org, linux-xfs@vger.kernel.org, linux-mm@kvack.org,
 jglisse@redhat.com, dri-devel@lists.freedesktop.org, jgg@nvidia.com,
 akpm@linux-foundation.org, linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Felix Kuehling <felix.kuehling@amd.com> writes:

> On 2022-03-11 04:16, David Hildenbrand wrote:
>> On 10.03.22 18:26, Alex Sierra wrote:
>>> DEVICE_COHERENT pages introduce a subtle distinction in the way
>>> "normal" pages can be used by various callers throughout the kernel.
>>> They behave like normal pages for purposes of mapping in CPU page
>>> tables, and for COW. But they do not support LRU lists, NUMA
>>> migration or THP. Therefore we split vm_normal_page into two
>>> functions vm_normal_any_page and vm_normal_lru_page. The latter will
>>> only return pages that can be put on an LRU list and that support
>>> NUMA migration, KSM and THP.
>>>
>>> We also introduced a FOLL_LRU flag that adds the same behaviour to
>>> follow_page and related APIs, to allow callers to specify that they
>>> expect to put pages on an LRU list.
>>>
>> I still don't see the need for s/vm_normal_page/vm_normal_any_page/. And
>> as this patch is dominated by that change, I'd suggest (again) to just
>> drop it as I don't see any value of that renaming. No specifier implies =
any.
>
> OK. If nobody objects, we can adopts that naming convention.

I'd prefer we avoid the churn too, but I don't think we should make
vm_normal_page() the equivalent of vm_normal_any_page(). It would mean
vm_normal_page() would return non-LRU device coherent pages, but to me at l=
east
device coherent pages seem special and not what I'd expect from a function =
with
"normal" in the name.

So I think it would be better to s/vm_normal_lru_page/vm_normal_page/ and k=
eep
vm_normal_any_page() (or perhaps call it vm_any_page?). This is basically w=
hat
the previous incarnation of this feature did:

struct page *_vm_normal_page(struct vm_area_struct *vma, unsigned long addr=
,
                            pte_t pte, bool with_public_device);
#define vm_normal_page(vma, addr, pte) _vm_normal_page(vma, addr, pte, fals=
e)

Except we should add:

#define vm_normal_any_page(vma, addr, pte) _vm_normal_page(vma, addr, pte, =
true)

>> The general idea of this change LGTM.
>>
>>
>> I wonder how this interacts with the actual DEVICE_COHERENT coherent
>> series. Is this a preparation? Should it be part of the DEVICE_COHERENT
>> series?
>
> Yes, it should be part of that series. Alex developed it on top of the se=
ries
> for now. But I think eventually it would need to be spliced into it.

Agreed, this needs to go at the start of the DEVICE_COHERENT series.

Thanks.

Alistair

> Patch1 would need to go somewhere before the other DEVICE_COHERENT patche=
s (with
> minor modifications). Patch 2 could be squashed into "tools: add hmm gup =
test
> for long term pinned device pages" or go next to it. Patch 3 doesn't have=
 a
> direct dependency on device-coherent pages. It only mentions them in comm=
ents.
>
>
>>
>> IOW, should this patch start with
>>
>> "With DEVICE_COHERENT, we'll soon have vm_normal_pages() return
>> device-managed anonymous pages that are not LRU pages. Although they
>> behave like normal pages for purposes of mapping in CPU page, and for
>> COW, they do not support LRU lists, NUMA migration or THP. [...]"
>
> Yes, that makes sense.
>
> Regards,
> =C2=A0 Felix
>
>
>>
>> But then, I'm confused by patch 2 and 3, because it feels more like we'd
>> already have DEVICE_COHERENT then ("hmm_is_coherent_type").
>>
>>

--=-=-=--

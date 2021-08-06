Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3ABA3E2C0C
	for <lists+dri-devel@lfdr.de>; Fri,  6 Aug 2021 16:00:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A2E96E0DB;
	Fri,  6 Aug 2021 14:00:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2065.outbound.protection.outlook.com [40.107.102.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8875F6E0DB
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Aug 2021 14:00:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bwt+X5gOz1NIKb/F/7l/GW14/31ErlZSyQ9XsvP8MN0g7XrXrZTXdTuEl07FsfdCbwQG3D2szGHMFmY43w25gxsZToI1r+uW1LxYCidFS9nedL+GTZqWofKUBhSYV96riSl1pWDoaks38Sd+AHrEZnoZNkTKk7hwTY+CcRKQ81YIp34NJnwR1VnZqii9zPY0AxUQrbERr7eD6pqwga1eYFC4ExOGcjUGjAz//RQjx9BroNqIfIQm3RSuYolWZg8+PTyH6z04QpAi8GqWWM74lb2hvuLA/4EZDgg9sFa28rfDPjTjAcUnMhT0+cV77COmxfjH8gtbukP6DE0g2BwGLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u6hEdKYR902HW3qwZzYZA000Z25QpCZzYBMnbV/1/Jc=;
 b=GZI5vUlfMZ0SXFwiwsMUQgZOv0CfeFeMHIEZ4PzRu7P1nNVPus0CPuiVe9OgpOrWeHY6atM2JfCdpWpJyw/lU5TqH8mXMjVeOg0N79y3Df6HlkmhbVb/emBoIgGeM7eLpSVbFqcQEEO4M3R6WBW6UL1IYWbv1GlEAjNnWM8dpSFteuaEoSzVt93lmVu0knPO42usMn4evVrayZ/fbt2Phb7wcMnz88WGqX1Gd660eC4ipxTrQHFwcOG0IIutWLrvoOUxVUKEhBeKv7D7gdCMrRnUfBz4xRV4i5bT9QrC9ol0J+IKkYHxgcgACTykvkugywsYPWEenw72VYAST9gJkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u6hEdKYR902HW3qwZzYZA000Z25QpCZzYBMnbV/1/Jc=;
 b=Zv3b6rzJ5peSUhsrFC6N2AQdW8jzQ885ehTeHUw0wcGPqD946itLcz89PD1+fURf7GVF8biY9lxX28OSQ97xJ0cBz43a8HoqF7HiTGQVkia8trUG3EZkRFkIkBvbGpnXXBgTr7PbU9ecl98yKhb4/Jdwx/54eWRpPl//cdkF1cG6asF3Tgv2PFyPrSHdR/2GtB8FSHpUyQxJrUntTypDaPAM75VnFGLQM/ad/9Au20uJ8QjjiPu4pomXm7SStBEB1w3gOoGb5a8xKqRqx4hbh4fLD+EkZtmClNinb3dlrz8rgTtYCkIQBV2hyaqL6jxATKkdrEQ0hmuX4yd28hZOJw==
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3823.namprd12.prod.outlook.com (2603:10b6:208:168::26)
 by MN2PR12MB3742.namprd12.prod.outlook.com (2603:10b6:208:16a::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.19; Fri, 6 Aug
 2021 14:00:36 +0000
Received: from MN2PR12MB3823.namprd12.prod.outlook.com
 ([fe80::dcee:535c:30e:95f4]) by MN2PR12MB3823.namprd12.prod.outlook.com
 ([fe80::dcee:535c:30e:95f4%6]) with mapi id 15.20.4394.017; Fri, 6 Aug 2021
 14:00:35 +0000
From: Zi Yan <ziy@nvidia.com>
To: Christian =?utf-8?q?K=C3=B6nig?= <christian.koenig@amd.com>
Cc: David Hildenbrand <david@redhat.com>, linux-mm@kvack.org,
 Matthew Wilcox <willy@infradead.org>, Vlastimil Babka <vbabka@suse.cz>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>, Michal Hocko <mhocko@kernel.org>,
 John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org,
 Dave Young <dyoung@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>, kexec@lists.infradead.org,
 linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [RFC PATCH 13/15] mm: convert MAX_ORDER sized static arrays to
 dynamic ones.
Date: Fri, 06 Aug 2021 10:00:29 -0400
X-Mailer: MailMate (1.14r5812)
Message-ID: <81C3245C-6A47-4C1B-B392-CC08FBF15712@nvidia.com>
In-Reply-To: <bdec12bd-9188-9f3e-c442-aa33e25303a6@amd.com>
References: <20210805190253.2795604-1-zi.yan@sent.com>
 <20210805190253.2795604-14-zi.yan@sent.com>
 <586dda97-dc64-ade2-6736-a531e225acbc@amd.com>
 <0D3441BA-2A11-4BCA-BFD5-CAB8EB915B8F@nvidia.com>
 <bdec12bd-9188-9f3e-c442-aa33e25303a6@amd.com>
Content-Type: multipart/signed;
 boundary="=_MailMate_2E952574-2F4B-48D5-8D2F-9B32358DA400_=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
X-ClientProxiedBy: BL0PR0102CA0046.prod.exchangelabs.com
 (2603:10b6:208:25::23) To MN2PR12MB3823.namprd12.prod.outlook.com
 (2603:10b6:208:168::26)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.2.50.235] (216.228.112.22) by
 BL0PR0102CA0046.prod.exchangelabs.com (2603:10b6:208:25::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Fri, 6 Aug 2021 14:00:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 72216c0d-52ce-484e-cf28-08d958e29023
X-MS-TrafficTypeDiagnostic: MN2PR12MB3742:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3742D2CD45E42AB15A6FFC19C2F39@MN2PR12MB3742.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uCWmBl48gZ6sqZVS4Wy5GKcCXLVTFPskcmgxB1g4doEu5WwwJXl9iJdCYa73gD0YbHdvadCqTMnyu3GHAiMhQbjR8g/dOSnV1UVAgW7w8U6kZsrqJXRMHAkN2ZHnWEAP490aHLwWdB9bR/WrXw6g6tydYqvIpfp9BDUxfWGUZzjKBvt9vxkFGAEN9X1zV+hsa/Rfwh6CKqVgJxnpo6gTpMqUgWJDFlGg3/eWWSBTBNZsQduh7hPQEVQFjMCYgWjFC3zffJgRhRx870d98cKC/ArX3VoiFWsGjD73gux69ldIfMYTwpr1ihyRcqfJSlV8gmfo1T/Du1aAJtI1UUqDCjdYtUemuuvoIEY64q8tVzhZqLA+iNQWnwV5crauD/GCdlldf+ciIwDwoI8wKO+4YYSGan/6iwRW8mCChv8j90IyAcMd4ifbPP87F8Ktd0VTJtULqMuDIMggtKiFZOf3Oe6LDBRydpg+4R4i+5Tkb0I76pmdLzywTCe5wIFHsHhZn17QzoAHGtU/0bQh/uYV3VhF/0kzZJiaauw4OQ6/Y2TLEYt6QDasSnYvG4oCwfwTqcZaeVonFdTFa+UeAFCxWSGVF0PBSuBqaZX0GOC8fLnzTzNoORAeN37erIQAeFNUd+sH6jwcdT0xSKMn1v+MbocZTNjFDBejDQM2EUaCZvIV1Q7vr4qNOilz8BFxjfuJVroSm5YdFIT2iCx1NWAj56yisZSMhP73Fb5T7cguioZ0W+DCTWDMXKcKBeyzoqd1JJ5SqHAcYSbPwVyfs5I9Rg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3823.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(346002)(376002)(39860400002)(136003)(66946007)(2616005)(956004)(66476007)(66556008)(83380400001)(8676002)(8936002)(54906003)(33656002)(16576012)(316002)(2906002)(21480400003)(6666004)(966005)(86362001)(6486002)(186003)(66574015)(5660300002)(235185007)(38100700002)(6916009)(53546011)(26005)(36756003)(7416002)(33964004)(4326008)(478600001)(72826004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0xvaFJTMmxORU9SSHhlNi9adXJKT2xUcHFTT05nRzJkVkRyZ3gzbUJiNDMy?=
 =?utf-8?B?NGZGL3JvNm5SeE5ZbGx6QitlUHdXb2kxSjNNYXdQZ1h1cVpRVDNORFk0eExX?=
 =?utf-8?B?VDJCNjdESXdUblNtWUZRcTBFaktSY3hrRVk0OEc3Ni95ejZHcUUxZjJacXNS?=
 =?utf-8?B?NkRubG5rcHJmdHJxTmJRV3RuZEp2VjhDemtKa1poWndqYk1vZzB3anFhYTZU?=
 =?utf-8?B?K1J3NE0zSXJCUDI2MFRXMnQyT2hzOS9TSU5XNGdTWkthVTJwUU5QZDNZVFc0?=
 =?utf-8?B?ak5zbmRNa0MxaEFGakZ0eElMb1dpWnFZNzc3NGx4SEJYQjQ5aERUdWkzaXRp?=
 =?utf-8?B?d3VOaWg0Ump2NSs4YmIxeGhKdXk2SDA2V3dWQ1FkdE5VNzByQVUzb0RyUmZ0?=
 =?utf-8?B?VFVJZDFIRVVyWXV4L2dQL0NidGJJQWVzcGNZTG9BMUVucmVROTBRVFVzODJZ?=
 =?utf-8?B?amt0YVFDOUNZb1p3Q01NY0p0MHppbHNSWHRPbnZsZFNjRU1yQzRHUmxIU3hD?=
 =?utf-8?B?dDNJTGhOQUpTL0pPaWNobXZYNUNsU0tKVlRFVlpORU1CdUwxYmQ3d2k5MUJy?=
 =?utf-8?B?U29ON1Y3MFZqQkhqdHRIL2dTM0E2MnZIOWlyUjFRbmMrUG1SWDhHNGgwc05H?=
 =?utf-8?B?OUdDa0VPZzZYMmNVSjJ2MDhKcUhOVG1jZUh2bzFtWElZeUlYRDA2Y3J2UEwz?=
 =?utf-8?B?QmlHK0ZzcDhMU3UxZnUwaDAySXZheWFPT3dNZ0NqM2hSbUN1RUZuMFA2NDg0?=
 =?utf-8?B?UmV5VXBUN2Q0eVdmUVhiQktXeGh2NkkrRW5KYitNTzd4SWpDa25KeUYwbkJ3?=
 =?utf-8?B?SklWR1BkRlVCTnNOVFE0U3FWWkFuVlBsU253WDZ4NFNnc2daZUtmQXQxZ1g2?=
 =?utf-8?B?UGJGQ2tpOXU0NkprRVZFSGJmelhNdllkQ2ZpTU1hSkpMcGo2RkV3SzZ4WjF0?=
 =?utf-8?B?Qllhc0FiYXQwZTUzWVBoTHp5Vy9XYlhzYldzeWRNb2lpNFpxTFlsRUxtOFM4?=
 =?utf-8?B?cFhwQWs3cmVpMTlkNVhuemxDV3hpVFZXOTlnSHc5V09VY0RlejlJWUVOa3ZE?=
 =?utf-8?B?TC8zeDFPRzdWeExrMWNDK2FkYmVER1lrQzdDU0FYWU1JbzZjTkp4SnlpZlhy?=
 =?utf-8?B?Y1FhZ1lKOGc2di8yTndCaVhRZHRiR3NQcUZBMCtzMmROOWpOWGVtOEhFVEFl?=
 =?utf-8?B?Y2EyWk9UdnFBRDhsbEpOdk5GUXdzWEhmclAyb1l1dHNBU3B1YlpZclZ5TGZU?=
 =?utf-8?B?MjhFMUV0SVZHdC9mbmJibVVPYnBvaCtCN0ZGZFZlZHZvRUxuMDRha01HMzFl?=
 =?utf-8?B?YlR0Yi9Ubitwb2dVMUdUbnlXeGRMRXFHdnF2RVU2QnBLamdrN1VUdTYwczhW?=
 =?utf-8?B?TXk5T1FrUXN3d1laM3pob1ByZ3VReXc4RlR4dXpiRE1sOVY0UzhYYlJnMmtj?=
 =?utf-8?B?Z3VtY2hldWdjenRqcnd6RFo4U25GRllYZkpNWFBVVTAwR0pZUE1Sd2ZEVUNL?=
 =?utf-8?B?QkpNZ0tPZTVZQWJqYnN3QXl6L1RNRFcvMTdKQUFtVXppWFlYYUMzVTVlT2li?=
 =?utf-8?B?c0ZuWDQzYlBWeU0zTXYzeUNJY3YyWmw0eDlzOGxFdDhLM2FBNlZ1UG44ZE9q?=
 =?utf-8?B?K0VEVXdIS3Rtb3k1ZUNxNUtFQ1RxT0NDU3FDUDJ0aUJmQmF1aUp4TXVWaG1D?=
 =?utf-8?B?VjhJT3FZcG4wdXRQend6c1JLOHo3K0ZheDFINWV1SW8zZm51cnA2MGVLcFE4?=
 =?utf-8?Q?EqKA8MjDF7TEfAWtcVJF5RY38ZdufkKrbChgK3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72216c0d-52ce-484e-cf28-08d958e29023
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3823.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2021 14:00:35.6543 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bjZ73TH0xIRbPSitOCNjOOFN1FwRvyQP90rNpLvSMmB9i7Oa5Deo3ALfVqZYA4gB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3742
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

--=_MailMate_2E952574-2F4B-48D5-8D2F-9B32358DA400_=
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 6 Aug 2021, at 5:37, Christian K=C3=B6nig wrote:

> Am 05.08.21 um 21:58 schrieb Zi Yan:
>> On 5 Aug 2021, at 15:16, Christian K=C3=B6nig wrote:
>>
>>> Am 05.08.21 um 21:02 schrieb Zi Yan:
>>>> From: Zi Yan <ziy@nvidia.com>
>>>>
>>>> This prepares for the upcoming changes to make MAX_ORDER a boot time=

>>>> parameter instead of compilation time constant. All static arrays wi=
th
>>>> MAX_ORDER size are converted to pointers and their memory is allocat=
ed
>>>> at runtime.
>>> Well in general I strongly suggest to not use the patter kmalloc(size=
of(some struct) * MAX_ORDER,...) instead use kmalloc_array, kcalloc etc..=

>>>
>>> Then when a array is embedded at the end of a structure you can use a=
 trailing array and the struct_size() macro to determine the allocation s=
ize.
>> Sure. Will fix it.
>>
>>> Additional to that separating the patch into changes for TTM to make =
the maximum allocation order independent from MAX_ORDER would be rather g=
ood to have I think.
>> Can you elaborate a little bit more on =E2=80=9Cmake the maximum alloc=
ation order independent from MAX_ORDER=E2=80=9D?
>
> My idea was that you have a single patch to give the maximum order as p=
arameter to the TTM pool.

Got it. No problem.
>
>>  From what I understand of ttm_pool_alloc(), it tries to get num_pages=
 pages by allocating as large pages as possible, starting from MAX_ORDER.=
 What is the rationale behind this algorithm? Why not just call alloc_pag=
e(order=3D0) num_pages times?
>
> What we do here is essentially transparent huge pages for GPUs.
>
> In opposite to CPU which can usually only use fixed sizes like 4KiB, 2M=
iB, 1GiB at least AMD GPUs can use any power of two.

FYI, Matthew Wilcox=E2=80=99s memory folio patchset adds support for arbi=
trary THP sizes[1]. You might want to check it out. :)

>
> So it makes sense to allocate big pages as much as possible and only fa=
llback to 4KiB pages when necessary.
>
> Down side is that we potentially exhaust larger orders for other use ca=
ses.
>
>> Is it mean to reduce the number of calls to alloc_page?
>
> That is a nice to have side effect, but the performance improvement for=
 the TLB is the main reason here.
>
>> The allocated pages do not need to get as high as MAX_ORDER, is that t=
he case?
>
> Actually we would really like to have pages as large as 1GiB for best T=
LB utilization :)
>
>> If yes, I probably can keep ttm pool as static arrays with length of M=
IN_MAX_ORDER, which I introduce in Patch 14 as the lower bound of boot ti=
me parameter MAX_ORDER. Let me know your thoughts.
>
> Well you could do something like MAX_MAX_ORDER with a value of at least=
 19 (1GiB with 4KiB pages IIRC). And then limit to the real available max=
_order when you make that a run time option.
>
> Since the array elements consists only of a linked list and a few extra=
 parameters / pointers we probably won't need more than a page or two for=
 those.

Thanks for you explanation. Now I understand that ttm_pool does want page=
s as large as possible for performance reasons. I will keep the existing =
code, so that ttm_pool can get the largest pages from buddy allocator. I =
will separate the changes to TTM to a single patch like you suggested.


[1] https://lore.kernel.org/linux-mm/20210715033704.692967-1-willy@infrad=
ead.org

=E2=80=94
Best Regards,
Yan, Zi

--=_MailMate_2E952574-2F4B-48D5-8D2F-9B32358DA400_=
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJDBAEBCgAtFiEEh7yFAW3gwjwQ4C9anbJR82th+ooFAmENQH0PHHppeUBudmlk
aWEuY29tAAoJEJ2yUfNrYfqKllQQAK5Nu3fHcUsKBNa9pN7Da8p7vJYw/Dx6wKn4
ZA15nANRcXpPUfNnT/8EweDsgKv/PCTRpJcmqvbOjV9NjusmgB4un3KA0jqVnP7E
5YVHfa2b+WgIThYOrsD/hkspLqxjPIqfwcYAtPNNplOtjfvneQcbKaTM4YhhrIVI
dH+KyXeGt3HqGUk8Xv/Rhr2p3bOkJSpXF7c3k3clohjgTAAT3pXyDC4rcCMBUwvn
D06JKXaabr8yRk4nIAQtYyUVAVS2b6nts3NdSUlC+Rr6+HyHJB9NpX2OgTq8AKRg
8I8LFAbwUjVW1rr1GD5dPvghmeZgqziknh/W9PKbcC7ydA11ofqwib6vy9WlQr5r
qvN/zWjWyTRzI9+owG+sa0iXr5ji2CqNpUTm3glqLyDmJW7orlyUjjVlHdLKqDBL
PhK8IMjnpcjlFjyv5dKE5GgMe3kffJG1IJgCtCse58IJTKF5vK3liqq0HK8UIHD3
UnGKTL45O7rCuLP7CEFmzS6EL9vtTdEq3n6/sllLZGIQQ3rRwiwkjKXykLL7f831
8Ptm9q/Jzy0zn1rdYeMppoO9cBJq5QTpNlu+pasXwHJhVqGBRY3jk7x7q3p/XQrB
aLcGMG0QaN90F/UA2yl/0dHRmCoV3eaSNrXz82xjDw+vEPQ4BEQXh4GREEUcP+Zx
rZTvuv95
=R4Zs
-----END PGP SIGNATURE-----

--=_MailMate_2E952574-2F4B-48D5-8D2F-9B32358DA400_=--

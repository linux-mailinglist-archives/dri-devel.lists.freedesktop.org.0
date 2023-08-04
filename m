Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2EE476F67D
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 02:21:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51EC610E145;
	Fri,  4 Aug 2023 00:21:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2071.outbound.protection.outlook.com [40.107.96.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1FEB10E145
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 00:20:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OsrSfusBoV15tkkGzRDAZATLtsREYn/XHjykCIf9ApgPuqk9fJZ2Uy8FJ9zkRrxbD3XlNap28KSgBRHNPga1dkBynPGCCTUevFSvxcLjXZCl35vxCkpm5ACQ9Ib+M3BetDC49/0RHMLu8A5YP7lItrFhgUlyxIXg7u/IPSI5ZADSaRU2M5fOEqbioGnTfqFaGxNqLSlLK6+OIPIBiBcurefnXLGEDmMDaSYLx40kAXNuiI/ZLMM0M7TyGuXlVXIuAgSYoKmxKqQXs1W5mZNRZ6+ncnxxGYafJrLZUClLOboKG/n83QQnqKYQj9dwjPDAe0r5qUO2b9ev0QhbmlD2Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I8mPJuURVIwf2O2gklELyfSKX+n38151IhyCcBaeEmw=;
 b=BxgNAwcQeDTpVakMJIjFLfsg4WblPA5M44aqdcWPfm+N56MVAhWgmqs4ABqTM7Wid2ZfgsTkINnDhvJ7vQcQejYmtdHfB0uQg5KLN7mlwZyL/j76Sdv/r3pyBE46qsFQSh5/fXkkI6Ca6dlx8DjuyIiG5bSqYVMda1nkFsN/5dRLlfUsvpB9kuEuKEW50Z7ApMTXeucumSnpoNUcn5+7XiRHegvmIDNLmBQrupNkQfBnE8gdAIzgdlnKMxv3oOVZpDNSyi/3BxcVVynRVZ6IphUazNV/uxmdeG44MhLDYQ+gj2gCasbFP2cNQ7WoHEexFBqfStaoPXtOC02iBLjfQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I8mPJuURVIwf2O2gklELyfSKX+n38151IhyCcBaeEmw=;
 b=E9WuZ01uS1sCuH4T4EOSOvdmr5ZY1S278ienYV5/EsYpU8Qboz7/c26zepuDNYuyzP+uPRj4uryDouLnZElVGDmORCE9rTLt9o98Ogr2K7qc0HOLVWSiQ4B/yOh9kV37qhFqRi0PYQyBLvwZV4h3ynRXC1y9oHso0elhuXATVUuatWqdRb854gZT4sNS/E8ynxPwZqymKlX/qPdMLu2O8Y0E535H4lQY8rraSyU/Dro00iXJxUfBb4oqcmeWXbhM+x+WQ1FgKa9jZo/1Jsfwybf2xQ/zo9JxSkWFjUWAvUIGZhUX54LarXJsslsyAmBj4pEskjiZCchJnbQJH8E92w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by MN2PR12MB4567.namprd12.prod.outlook.com (2603:10b6:208:263::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Fri, 4 Aug
 2023 00:20:37 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::6edb:265e:a2a2:eb04]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::6edb:265e:a2a2:eb04%3]) with mapi id 15.20.6652.020; Fri, 4 Aug 2023
 00:20:37 +0000
References: <IA0PR11MB71857E9D6C3AD311CF698D13F80AA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZMj4Og063T6T/okI@nvidia.com>
 <d4bae5e4-ff92-bee9-d585-9f30e34ef646@redhat.com>
 <ZMj5MvQGk2PQiJn+@nvidia.com>
 <48f22686-2c1b-fd9d-91ba-da6105d410db@redhat.com>
 <ZMj5+7sgkPqHT5Vt@nvidia.com>
 <3427735b-2a73-2df7-ebd9-0d1066a55771@redhat.com>
 <IA0PR11MB7185CF1FDFA5D5EDE3B6AF08F80AA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZMlMoRIkPoO0gG3B@nvidia.com>
 <IA0PR11MB7185304345516521FA3005C2F808A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZMuaQ4vpv03GTPbF@nvidia.com>
 <2aee6681-f756-9ace-74d8-2f1e1e7b3ae6@redhat.com>
User-agent: mu4e 1.8.13; emacs 28.2
From: Alistair Popple <apopple@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [RFC v1 1/3] mm/mmu_notifier: Add a new notifier for mapping
 updates (new pages)
Date: Fri, 04 Aug 2023 10:14:59 +1000
In-reply-to: <2aee6681-f756-9ace-74d8-2f1e1e7b3ae6@redhat.com>
Message-ID: <87cz0364kx.fsf@nvdebian.thelocal>
Content-Type: text/plain
X-ClientProxiedBy: SY6PR01CA0155.ausprd01.prod.outlook.com
 (2603:10c6:10:1ba::9) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3176:EE_|MN2PR12MB4567:EE_
X-MS-Office365-Filtering-Correlation-Id: c7c5b595-3216-4fa1-fc88-08db9480a081
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y0TvfGEwlFoS59Jb4hHd5jE/sHaslq6bVE8fHB3hATrJwocqrrMhvcvvQPwTBKfe8ZscxemD3YKaQU8zNQeGcu61Wk+xs737B5UjrFVGyp4JIO1FIV/dBHWqIBnLk9fR+DPUbRJxu64Q56qGO3kVH3NlTKc8nUHwm8S1L+OItoY+3sHl/97I7An/sR2P9XkYWI74TSr1UhETqAatMjHrH/w9itSSJdhDDY+TElTBqp89oyPyLm7Ai7qRUiAQ89VJpLG4i9uQLfmK04vbfyueIJq4DQErQAuUfeE5a0l0c7fPMl+vxuWDF1NsDq2UMVAz8DfuNq8jjLbb+fxWWX+qRvQVidUaqqm3VFiff2Xx+7Bwx6rM8ozl6+7oyIDZ+GQQEN7ENLlCBK+fSrJbezTP5iQhTaINTUdYwRezPlJZddQaiD3ZKuRNn+8ZPlM3IThPgBmmVACk3WSwWvaae6s39n0gqRrmw6inLJZGNktYY9Q5F3d07r01nlRvBaB8lJZTOBq4wKQPHxz6a1fThlhfiP/4/2suX3kmbpnMPpIV9btHCxu2KlmvOFWnDksUwYFabbYkBtlQDQH5HHBtxUuNPJW7B1LbQh6VvUd+gPKk03o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(136003)(396003)(39860400002)(376002)(346002)(186006)(1800799003)(451199021)(83380400001)(53546011)(6506007)(26005)(6916009)(4326008)(66476007)(66556008)(66946007)(2906002)(316002)(7416002)(5660300002)(8936002)(8676002)(15650500001)(9686003)(41300700001)(6666004)(6486002)(966005)(6512007)(54906003)(478600001)(38100700002)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?U8UWb4KpnceqaAdIzw1wCjKOZl2zUv3kk+TPTMyGpuT+w7ar+EZk1b26xrg8?=
 =?us-ascii?Q?ZbLdQU2Sv6XDmdZvElR4cvBzpzGzXfnESnhwB7+Dp9TeGzzSrteoCLu2eqPi?=
 =?us-ascii?Q?y8MeAhxZc3oGDI1azX4s2DEkqlekyGp8pVR8vtsxXkZdFHa72pXm9VbLRaAa?=
 =?us-ascii?Q?llozwhbcwrTClRFnqBMYhmPC9iyK4a7hpSFAt/FHPLX0yLcQi0ajT8Cc/KVg?=
 =?us-ascii?Q?s5dXKYUEWTkGKB+aBHwPIha6JDRCL+gbiGHoaL7JGxl0UeB6Ycgc6TonDfGI?=
 =?us-ascii?Q?d4F9mtP18z2W5sTnaIRi49Dmyflfuz9pTqmZ8wwMVRU4YHQ2efroCKIrjybW?=
 =?us-ascii?Q?rQ8E304rq2eQP+sm/y1ULVeEpkjk4aJYdl3BWQeGEfbXJy+9zh0F0BwwDVom?=
 =?us-ascii?Q?wBXpaPgYGKioBU6V8zmIDQMqa2x5POtHMuWaNUzmCuUo17lEw8pe6QPAKB9M?=
 =?us-ascii?Q?ueHG1OJAIKJZhq3TZgzlpPwzlbeHUfp2RDaEaai+lT358PEFfKRG/H1g6PU1?=
 =?us-ascii?Q?TSxd2qehYgPzUHf1O9DU4fDmRiNZGBaVR0rlj9O2UZ6PiN/w5rKMR/v9kAQq?=
 =?us-ascii?Q?NzDLfFm1qZnP9mImzQS4/Kk4A+d1HBU6THemRrmZLoJ6B36n3dMARnpQ9KSZ?=
 =?us-ascii?Q?zXBBJnA/iNZUDw+OSWRspyLAo/Us7wpPBXjuPIUFp2co5QjIeCRcuqZkx4C0?=
 =?us-ascii?Q?GEl1bgLYJj/tUgXd91HEtuy7oRaCZRK1Lphtiv2TEm9UvQJP30eS2uBji/rR?=
 =?us-ascii?Q?3Mkm5zkuluMufycvP+fihIe5leVsIMLbtig19ZC4TvUeiuQSk8GSAuBfXgCv?=
 =?us-ascii?Q?bYbIMwm3m5GBXw5WrH0nP+xePsEGtM8CMtebGnRMAo1RY1MeglJzvOPFbjKJ?=
 =?us-ascii?Q?M3k/xINnMWv2MneIckjTsztVwu80jc6RpZc9eJxgU8XrW7NAGNG+VTQoOG9L?=
 =?us-ascii?Q?f6c5+nRI6yu8TLmL9bZy29i24KnZwqrrH4/916NvOXc7VppP+IFrg80xqngR?=
 =?us-ascii?Q?yq9FL5NDfnZ6zzXBNodwizWcY5YyIE20IrqaFp3tiCUdmnL4T5EZCsGlf1K7?=
 =?us-ascii?Q?4nhU0UVWfcG0oTQ/NdtvYVIIMhJt9IpTZ3EmM4tyoVgoHeQyMtISpGRo/rk/?=
 =?us-ascii?Q?0F2xRSjAGZFaL9FWUcvz9z8fMR/pZngm+oSTVQC9ikz67AkB58s9ZvyzV5bK?=
 =?us-ascii?Q?bScyh05ljZP5fshW2ZNs0HONOetNeplCWnUY700In0Rn5Ql5XTLv9Yn3oJr+?=
 =?us-ascii?Q?qL2H5iAPuIWnhOKPGqaFgmNiAX1EAat1UW417vM76Az1gHxpL5xm07S9dVxi?=
 =?us-ascii?Q?TAAXOpV7dFWM0LQGgF1NcJcMtLVzL6bsFJyj04Z46WxNpLMP70JsdIRQUUdS?=
 =?us-ascii?Q?9LrtV1rP6yuYF+xGshbV3CvaCEel1BDssfUcZtzPVc6JUP8oZUsihPbxPNMh?=
 =?us-ascii?Q?RJcTbsOV3+dShfxLRxJGGVDmkTK3SfVOMDc8VxL2gyV7NxVaZKxHRef5TdY+?=
 =?us-ascii?Q?CZrIc1KN1fW2rHUazh8LOmV8OIkmjG2E0KgOncY8iuK8y3MDyG8wiNUDKYrf?=
 =?us-ascii?Q?zTLe7Mq/eFoKU+cS6e+iWYaqqYv17SQUmeS4NtfL?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7c5b595-3216-4fa1-fc88-08db9480a081
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 00:20:37.4699 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zi2l/yFlNQf807rgtJT9QQZhkxU+TIZFmETkMxXhKPNEHDAMjwHAcpRlcQ4v7Bgmhkk/JfHbCDg+KhPOAw6nFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4567
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
Cc: "Kim, Dongwon" <dongwon.kim@intel.com>, "Chang,
 Junxiao" <junxiao.chang@intel.com>, Hugh Dickins <hughd@google.com>,
 "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Peter Xu <peterx@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Mike Kravetz <mike.kravetz@oracle.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


David Hildenbrand <david@redhat.com> writes:

> On 03.08.23 14:14, Jason Gunthorpe wrote:
>> On Thu, Aug 03, 2023 at 07:35:51AM +0000, Kasireddy, Vivek wrote:
>>> Hi Jason,
>>>
>>>>>> Right, the "the zero pages are changed into writable pages" in your
>>>>>> above comment just might not apply, because there won't be any page
>>>>>> replacement (hopefully :) ).
>>>>
>>>>> If the page replacement does not happen when there are new writes to the
>>>>> area where the hole previously existed, then would we still get an
>>>> invalidate
>>>>> when this happens? Is there any other way to get notified when the zeroed
>>>>> page is written to if the invalidate does not get triggered?
>>>>
>>>> What David is saying is that memfd does not use the zero page
>>>> optimization for hole punches. Any access to the memory, including
>>>> read-only access through hmm_range_fault() will allocate unique
>>>> pages. Since there is no zero page and no zero-page replacement there
>>>> is no issue with invalidations.
>> 
>>> It looks like even with hmm_range_fault(), the invalidate does not get
>>> triggered when the hole is refilled with new pages because of writes.
>>> This is probably because hmm_range_fault() does not fault in any pages
>>> that get invalidated later when writes occur.
>> hmm_range_fault() returns the current content of the VMAs, or it
>> faults. If it returns pages then it came from one of these two places.
>> If your VMA is incoherent with what you are doing then you have
>> bigger
>> problems, or maybe you found a bug.

Note it will only fault in pages if HMM_PFN_REQ_FAULT is specified. You
are setting that however you aren't setting HMM_PFN_REQ_WRITE which is
what would trigger a fault to bring in the new pages. Does setting that
fix the issue you are seeing?

>>> The above log messages are seen immediately after the hole is punched. As
>>> you can see, hmm_range_fault() returns the pfns of old pages and not zero
>>> pages. And, I see the below messages (with patch #2 in this series applied)
>>> as the hole is refilled after writes:
>> I don't know what you are doing, but it is something wrong or you've
>> found a bug in the memfds.
>
>
> Maybe THP is involved? I recently had to dig that out for an internal
> discussion:
>
> "Currently when truncating shmem file, if the range is partial of THP
> (start or end is in the middle of THP), the pages actually will just get
> cleared rather than being freed unless the range cover the whole THP.
> Even though all the subpages are truncated (randomly or sequentially),
> the THP may still be kept in page cache.  This might be fine for some
> usecases which prefer preserving THP."
>
> My recollection is that this behavior was never changed.
>
> https://lore.kernel.org/all/1575420174-19171-1-git-send-email-yang.shi@linux.alibaba.com/


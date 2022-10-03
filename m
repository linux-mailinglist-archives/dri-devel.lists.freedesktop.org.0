Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD53D5F2784
	for <lists+dri-devel@lfdr.de>; Mon,  3 Oct 2022 03:29:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 498C010E1BF;
	Mon,  3 Oct 2022 01:29:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2043.outbound.protection.outlook.com [40.107.244.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C885810E1BC;
 Mon,  3 Oct 2022 01:29:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i/UNs6SS5iLB4NQdWwesyDY67HyBojtY3CPIuXpW9TZ7AKwlihy3XFlAaPeXa6qSPGW4Oa/T+TXhXmSF+x95lONNObq0X9wX9ZM8zIrswj1VNsUyX1mEqzUIhUcSwSXB5oFzEpSnK8Pn06BbvwllTNgoGFeWoDNB8eOJjR4JQCjJANmFdM3Qy6GafOkyb2VAeP9f/lYlD99DmjCLcS5RzlN6TJordaKYSFf3HBkNeVz6CLfOWut4scEzq/nVCfoXehsbMaJUrc1IhlpM5eu/rQ+1qVBKGHWLKMGihS7rYmvqY0gkNHyFTzHFgtbVimzmWm+CzR4UtUvRI50llQX4yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G8YlhMDkSYp/ekREi3Vopx+GhocaQmWRkgW4duq44MI=;
 b=a11ipkwaSLKWBj1hUgzWeWH5r7wBo6eT2h31HApQOHxf6uQHNt32HFjMItfBYsY+ouYtNeTYEnjZ7sPZsPkjStzbzWJHWbwHIi1sNTSdCkVaXABYAQ+uLsuEHJ4OIRLQ3/DpyD0zrkfX8BYRX3c2d2tlFN4+4r+px5Hq6jiQ0K8OUUu1+4lxKNjb0A2TqHt2O0MrYpz2gPOpU+uYYGUQi2A4RD54BlGrsBwye60sA1W9I3HP9gjRSyDnaFwFZCLcAjoHpEom4X3DtDDf/QuaT1SDUVqG25LTf8wAckuzSwlkExe51od/sh8dqDpkS6JdzeTHZ8KQk7unur+h9cd4gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G8YlhMDkSYp/ekREi3Vopx+GhocaQmWRkgW4duq44MI=;
 b=BU3JK7pV6yI23gt3vMAe3TEDFWvYhsg9XdJk7sVb9c91LcWQy0g/LYXenO1gqs4rSJNyz+aM1zw7vkn28nNA+xdtWVVowBjZlVOADzQaV6YJYFJlw4I7p+SKJygd5P6vVDTpCwcJebsA/teTsCgLb9wYKlUe1C1l+eNkV8hjBW0YhCP0eQOVF6w2wMDFXziuZO9dovtTm5MpV7IpfL91Pc+uko26zfq9NFuglKBWKeJ93yXQxO+ldGmqIPngfX3Kz/S0XH8O9Oj1LeynROXcn5F7DyTVAzjJ6/8zyto8WFthB1vQoC4rNfgKrEHY27E0AfjE/Pb2xYP6WzE9lC0MJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by DS7PR12MB6312.namprd12.prod.outlook.com (2603:10b6:8:93::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.28; Mon, 3 Oct 2022 01:29:09 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::4064:6c13:72e5:a936]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::4064:6c13:72e5:a936%5]) with mapi id 15.20.5676.023; Mon, 3 Oct 2022
 01:29:09 +0000
References: <cover.60659b549d8509ddecafad4f498ee7f03bb23c69.1664366292.git-series.apopple@nvidia.com>
 <d3e813178a59e565e8d78d9b9a4e2562f6494f90.1664366292.git-series.apopple@nvidia.com>
 <2193303e-84b9-d0a1-b121-d2a145fcc43a@amd.com>
User-agent: mu4e 1.8.10; emacs 27.1
From: Alistair Popple <apopple@nvidia.com>
To: Felix Kuehling <felix.kuehling@amd.com>
Subject: Re: [PATCH v2 1/8] mm/memory.c: Fix race when faulting a device
 private page
Date: Mon, 03 Oct 2022 11:53:35 +1100
In-reply-to: <2193303e-84b9-d0a1-b121-d2a145fcc43a@amd.com>
Message-ID: <87pmf9y9st.fsf@nvdebian.thelocal>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BYAPR07CA0021.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::34) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3176:EE_|DS7PR12MB6312:EE_
X-MS-Office365-Filtering-Correlation-Id: a9b73e31-b61b-4da7-e522-08daa4deab77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Rs//oO1OjSDIl13C++zaS7d6z/w1RiRsIAZfnSJ8nmUUfPrbeHXzqkjwau74bZEzovL4XYWMYdqomQcVksAZ3vdxlSKJ7xUJu0EyRYanqWpA8iDUmRl4Tob9B2GaGvBy/NEi7QWusRijm6uu/oNoBnVgbP9kLXwltOlH9uH8XEMiyz1kbe2Sd4vKkH31+cP0k3bzO8K83AaixCzch5zlgLMqMgH8dPbrnOw37j2//mZW2wDL4dv63W3Hig95sWLkXUY3PHCNk9fCa79ZIGv9uQyq3+OxoJumHN4tOb5GH7G/JEUsijn3hj4+eWc/zRbPm3Bsjxt9EHAJECoWEaC8h4zivUOVY6rCWB6sFBnODdcYDiepN3qELUdZ+G11XOcthHPW8LpRK/TB+7EaCQsXtGR3AUxdZTdvjicsDOaNIMlQJC/O/3crt+1Vy18SHzQXhxYLdlwxWL3AQsPB/InkmEtNbyOcwMRUMNCfhAdK6HGlsDqfvGaYQF3hEVgb933tZXeamWPvxWCsv7p2Kb7Ve2P0oUcpFPxkE4rvDmMc8nZ1P9vOBUwFH8l/lrv21IpXxV4YnH2H0ALs4VnFqzbZG6LOcKrvyQ3eVIrmicgL8n+FSiPV/mVlRiUZSV2RrXHvNvJ3qOruL5eEWu6w6dD5OZw5+rmlE8x1eRYrSE6b6GJHz6iwlv6je91P4ckDb+TuqMoa9FPe2hfjMF8c2CJ6Tw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(39860400002)(346002)(366004)(396003)(376002)(451199015)(6506007)(66556008)(8676002)(9686003)(6512007)(4326008)(26005)(66476007)(54906003)(53546011)(6916009)(86362001)(316002)(478600001)(6486002)(66946007)(38100700002)(6666004)(83380400001)(186003)(66899015)(8936002)(41300700001)(2906002)(5660300002)(30864003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NzREbFNIckNWdEU4SVFuRFlXeE9nT0hjL1lPZ0t2ZFRtMEJoUjEvVmJoUFhx?=
 =?utf-8?B?UDN1TEErSTFnbDdSSFZzcHFnNWd4UDhyY2FmUmFQSDV3OVlPTElNSkt4UnRD?=
 =?utf-8?B?T1J6YjdQWTRpbFdGdk85V1dOeXloMXc2b3lYbENIbWladVR3Q0dkaUFvbmRr?=
 =?utf-8?B?am55cE5USWY3blJwbjg3OXRoT0dZMENUWHRQWHY5T1pHQTVHSnZUZGxXWTYz?=
 =?utf-8?B?eGRETnQxMGdZTGtHODNIZFgxWEdKdGF6UWRBZWx0M1lqWnE5WDl0aElvNWRK?=
 =?utf-8?B?clF0VUcwWGMvSjJQNERGK3FndGVpOGQ2S1dYSGptTVUyVUdRcDFnTWlBczNI?=
 =?utf-8?B?cFBjK2s3Nm05U3RPeThLL1RXaTdYSzRnMDhLSG02aEZMMWkvVU5yNzVKMU1K?=
 =?utf-8?B?bjMwVkFPdktpMkxMa1ZOZFNrOERMWUtLSVY1OWpoRThUZGdjTncxS1I1RExl?=
 =?utf-8?B?bmJPMzVDUXJNdWpGWGp3SU1MdDBxN0FDMjVmdVpveXUxUS96bkw4K2FsYUNO?=
 =?utf-8?B?cWdqcmJPb1VxdWRmMjhpT243dXJLN2JQU2hpdlhsRzZ0QjY0SFVoUGxNWWQw?=
 =?utf-8?B?TlVLbDdOYSt3cGFuU3YrNFhjNDFNWHBRK0pFOTVmSTF3WWJkc05FV0lqRGho?=
 =?utf-8?B?M2YyUHFXVXZJZm81Lzd0RjhqRmMwS3I0Z29meTZHU2UrWHB6dUJyRjRYY3RK?=
 =?utf-8?B?NkpEL0xDSjFYTjVvTGZkWkNSaXdEL3BzakV2YnE3czgxNDN6eC8rWldubmtI?=
 =?utf-8?B?M1lDaHp3R1ZySmozRGxSYXY4UmFxaG9VL2tDbnp5Q2VqQTd5L1dFTHZjb2py?=
 =?utf-8?B?czJ2a1EvYTc2UkR2TXZFdDFOVk4wY1UvWXQ1aVdMQU11dlJIQXBwOGl0cHRY?=
 =?utf-8?B?VSt2cmFUdVRmZ25QM0NQanFHM1J4VXBIL00xQzRueGEzOE1xWXU0WkhWRm1U?=
 =?utf-8?B?LzlZVXhXWHF0cjgxb2ZSaSs2S08xR0JienNTRU13eXFscUo3VmpLdWE2N3Z5?=
 =?utf-8?B?WTYvek1nQ3ZYa0x1M1daWmp2M0wyZWQwbjFiYzdOblJsR0ROZHZBVCtpY3NR?=
 =?utf-8?B?U215S2ZIamVGSTVHTTNOZ25JR0ZzbU9mb1YyYzE0L3hXYzdGTVdPeFFJcXBh?=
 =?utf-8?B?U0grSnE1UEs2TnI4c1FiN3RqU2hVdGRSeHhENDVaQmNOdndZaGpKbDJsTjdw?=
 =?utf-8?B?OWMwOW14MU9obWEvQnFSVjhJRHNaK1BLMWVrcHBkVytoU1ZrTTRwQlZYVWlL?=
 =?utf-8?B?VkNZdTVwcjNGZVNmbHF1Q0ErK0p5MnIyYVdyeHVMNkYrNDBQNmt5MTJodWNu?=
 =?utf-8?B?QXg1d1cxZUU5b1FzRVFWZ05vYkc0SW84cE1pMEV6enVwVGc4V1RWQWk2bVlz?=
 =?utf-8?B?dnI0QUpzZnRrdXVCVjhuZGp0ZThHRE42SFU5REt4Nk9IVzQxUTF3eFdhcVFa?=
 =?utf-8?B?eHR2bUtQbEhwMldCOSs1QUcySWJQUWlKenVyN0JCcWplVnJTZDNLYUo1ZEpH?=
 =?utf-8?B?d2VUbnJ5cHkzbEd6WFF2Qm5kVVRyZEJiMS9mbXNwTUZlUE12Q040Njc2aHhU?=
 =?utf-8?B?MEFib2RNb1FOK3hRK0pLemNnWkorYVhqWjhKZ3ZFMThkbUgxeWliS2NwKzMz?=
 =?utf-8?B?a2V5a3JkTVgrQk1CTWZRYXhubWdOcGd6Um1YRHFKa25Ea2hmMzQ5QzZCYzQw?=
 =?utf-8?B?M1A3VnZlNTRhU1NoelozQXg0b2gvb2drcHhQWWF5WWlKVGpFTWhoclc0MEQv?=
 =?utf-8?B?TzhLZlRTMDQxWTFCeE9OZ1NRZG9CK0RDaW55VUl3MnJpQXJUU3Q3Mmp4MEpG?=
 =?utf-8?B?bklKRUhibU9OR2lKUmJYaGN6cVhJbkRrNFRiOWlJcllCQ0IxbjFtZEU1azJY?=
 =?utf-8?B?U0I4SGFlSjAvellHTS9GOFlEbkxydFl2WHJzcS85K2VzdmFZekpaRkh6eFRk?=
 =?utf-8?B?eVlsYzdLdVdpWjZ5WC9HTzA3M0tOTmdHUUlBdlpsVDdRODdMRjVIZVIzQVhl?=
 =?utf-8?B?NEdRY2hZWXcrVEFRR0ozak5lUDIyanZkZWdUT01RaTRkUllQak1NOEZjQkpT?=
 =?utf-8?B?MkJ3ZGxEK29mVVA3djVVZDhVSWtiR1pIRTFDcUpsVldWT29wb3dQN3J0Q3d0?=
 =?utf-8?Q?PxRixXEAD0pixyCsNf0rUwwQ4?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9b73e31-b61b-4da7-e522-08daa4deab77
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2022 01:29:09.4521 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Sp3mpCvzZfsJuS13AbCG/8AnoJBEwwnZzAm+GnWqWrzkk4fZLN/ZSbFEGe/Wf4ORXOk49awm4S6twg9liuviw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6312
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
Cc: Ralph Campbell <rcampbell@nvidia.com>,
 Michael Ellerman <mpe@ellerman.id.au>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, amd-gfx@lists.freedesktop.org,
 Jason Gunthorpe <jgg@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Felix Kuehling <felix.kuehling@amd.com> writes:

> On 2022-09-28 08:01, Alistair Popple wrote:
>> When the CPU tries to access a device private page the migrate_to_ram()
>> callback associated with the pgmap for the page is called. However no
>> reference is taken on the faulting page. Therefore a concurrent
>> migration of the device private page can free the page and possibly the
>> underlying pgmap. This results in a race which can crash the kernel due
>> to the migrate_to_ram() function pointer becoming invalid. It also means
>> drivers can't reliably read the zone_device_data field because the page
>> may have been freed with memunmap_pages().
>>
>> Close the race by getting a reference on the page while holding the ptl
>> to ensure it has not been freed. Unfortunately the elevated reference
>> count will cause the migration required to handle the fault to fail. To
>> avoid this failure pass the faulting page into the migrate_vma functions
>> so that if an elevated reference count is found it can be checked to see
>> if it's expected or not.
>
> Do we really have to drag the fault_page all the way into the migrate str=
ucture?
> Is the elevated refcount still needed at that time? Maybe it would be eas=
ier to
> drop the refcount early in the ops->migrage_to_ram callbacks, so we won't=
 have
> to deal with it in all the migration code.

That would also work. Honestly I don't really like either solution :-)

I didn't like having to plumb it all through the migration code
but I ended up going this way because I felt it was easier to explain
the life time of vmf->page for the migrate_to_ram() callback. This way
vmf->page is guaranteed to be valid for the duration of the
migrate_to_ram() callbak.

As you suggest we could instead have drivers call put_page(vmf->page)
somewhere in migrate_to_ram() before calling migrate_vma_setup(). The
reason I didn't go this way is IMHO it's more subtle because in general
the page will remain valid after that put_page() anyway. So it would be
easy for drivers to introduce a bug assuming the vmf->page is still
valid and not notice because most of the time it is.

Let me know if you disagree with my reasoning though - would appreciate
any review here.

> Regards,
> =C2=A0 Felix
>
>
>>
>> Signed-off-by: Alistair Popple <apopple@nvidia.com>
>> Cc: Jason Gunthorpe <jgg@nvidia.com>
>> Cc: John Hubbard <jhubbard@nvidia.com>
>> Cc: Ralph Campbell <rcampbell@nvidia.com>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: Felix Kuehling <Felix.Kuehling@amd.com>
>> Cc: Lyude Paul <lyude@redhat.com>
>> ---
>>   arch/powerpc/kvm/book3s_hv_uvmem.c       | 15 ++++++-----
>>   drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 17 +++++++------
>>   drivers/gpu/drm/amd/amdkfd/kfd_migrate.h |  2 +-
>>   drivers/gpu/drm/amd/amdkfd/kfd_svm.c     | 11 +++++---
>>   include/linux/migrate.h                  |  8 ++++++-
>>   lib/test_hmm.c                           |  7 ++---
>>   mm/memory.c                              | 16 +++++++++++-
>>   mm/migrate.c                             | 34 ++++++++++++++----------=
-
>>   mm/migrate_device.c                      | 18 +++++++++----
>>   9 files changed, 87 insertions(+), 41 deletions(-)
>>
>> diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3=
s_hv_uvmem.c
>> index 5980063..d4eacf4 100644
>> --- a/arch/powerpc/kvm/book3s_hv_uvmem.c
>> +++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
>> @@ -508,10 +508,10 @@ unsigned long kvmppc_h_svm_init_start(struct kvm *=
kvm)
>>   static int __kvmppc_svm_page_out(struct vm_area_struct *vma,
>>   		unsigned long start,
>>   		unsigned long end, unsigned long page_shift,
>> -		struct kvm *kvm, unsigned long gpa)
>> +		struct kvm *kvm, unsigned long gpa, struct page *fault_page)
>>   {
>>   	unsigned long src_pfn, dst_pfn =3D 0;
>> -	struct migrate_vma mig;
>> +	struct migrate_vma mig =3D { 0 };
>>   	struct page *dpage, *spage;
>>   	struct kvmppc_uvmem_page_pvt *pvt;
>>   	unsigned long pfn;
>> @@ -525,6 +525,7 @@ static int __kvmppc_svm_page_out(struct vm_area_stru=
ct *vma,
>>   	mig.dst =3D &dst_pfn;
>>   	mig.pgmap_owner =3D &kvmppc_uvmem_pgmap;
>>   	mig.flags =3D MIGRATE_VMA_SELECT_DEVICE_PRIVATE;
>> +	mig.fault_page =3D fault_page;
>>     	/* The requested page is already paged-out, nothing to do */
>>   	if (!kvmppc_gfn_is_uvmem_pfn(gpa >> page_shift, kvm, NULL))
>> @@ -580,12 +581,14 @@ static int __kvmppc_svm_page_out(struct vm_area_st=
ruct *vma,
>>   static inline int kvmppc_svm_page_out(struct vm_area_struct *vma,
>>   				      unsigned long start, unsigned long end,
>>   				      unsigned long page_shift,
>> -				      struct kvm *kvm, unsigned long gpa)
>> +				      struct kvm *kvm, unsigned long gpa,
>> +				      struct page *fault_page)
>>   {
>>   	int ret;
>>     	mutex_lock(&kvm->arch.uvmem_lock);
>> -	ret =3D __kvmppc_svm_page_out(vma, start, end, page_shift, kvm, gpa);
>> +	ret =3D __kvmppc_svm_page_out(vma, start, end, page_shift, kvm, gpa,
>> +				fault_page);
>>   	mutex_unlock(&kvm->arch.uvmem_lock);
>>     	return ret;
>> @@ -736,7 +739,7 @@ static int kvmppc_svm_page_in(struct vm_area_struct =
*vma,
>>   		bool pagein)
>>   {
>>   	unsigned long src_pfn, dst_pfn =3D 0;
>> -	struct migrate_vma mig;
>> +	struct migrate_vma mig =3D { 0 };
>>   	struct page *spage;
>>   	unsigned long pfn;
>>   	struct page *dpage;
>> @@ -994,7 +997,7 @@ static vm_fault_t kvmppc_uvmem_migrate_to_ram(struct=
 vm_fault *vmf)
>>     	if (kvmppc_svm_page_out(vmf->vma, vmf->address,
>>   				vmf->address + PAGE_SIZE, PAGE_SHIFT,
>> -				pvt->kvm, pvt->gpa))
>> +				pvt->kvm, pvt->gpa, vmf->page))
>>   		return VM_FAULT_SIGBUS;
>>   	else
>>   		return 0;
>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/=
amd/amdkfd/kfd_migrate.c
>> index b059a77..776448b 100644
>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
>> @@ -409,7 +409,7 @@ svm_migrate_vma_to_vram(struct amdgpu_device *adev, =
struct svm_range *prange,
>>   	uint64_t npages =3D (end - start) >> PAGE_SHIFT;
>>   	struct kfd_process_device *pdd;
>>   	struct dma_fence *mfence =3D NULL;
>> -	struct migrate_vma migrate;
>> +	struct migrate_vma migrate =3D { 0 };
>>   	unsigned long cpages =3D 0;
>>   	dma_addr_t *scratch;
>>   	void *buf;
>> @@ -668,7 +668,7 @@ svm_migrate_copy_to_ram(struct amdgpu_device *adev, =
struct svm_range *prange,
>>   static long
>>   svm_migrate_vma_to_ram(struct amdgpu_device *adev, struct svm_range *p=
range,
>>   		       struct vm_area_struct *vma, uint64_t start, uint64_t end,
>> -		       uint32_t trigger)
>> +		       uint32_t trigger, struct page *fault_page)
>>   {
>>   	struct kfd_process *p =3D container_of(prange->svms, struct kfd_proce=
ss, svms);
>>   	uint64_t npages =3D (end - start) >> PAGE_SHIFT;
>> @@ -676,7 +676,7 @@ svm_migrate_vma_to_ram(struct amdgpu_device *adev, s=
truct svm_range *prange,
>>   	unsigned long cpages =3D 0;
>>   	struct kfd_process_device *pdd;
>>   	struct dma_fence *mfence =3D NULL;
>> -	struct migrate_vma migrate;
>> +	struct migrate_vma migrate =3D { 0 };
>>   	dma_addr_t *scratch;
>>   	void *buf;
>>   	int r =3D -ENOMEM;
>> @@ -699,6 +699,7 @@ svm_migrate_vma_to_ram(struct amdgpu_device *adev, s=
truct svm_range *prange,
>>     	migrate.src =3D buf;
>>   	migrate.dst =3D migrate.src + npages;
>> +	migrate.fault_page =3D fault_page;
>>   	scratch =3D (dma_addr_t *)(migrate.dst + npages);
>>     	kfd_smi_event_migration_start(adev->kfd.dev, p->lead_thread->pid,
>> @@ -766,7 +767,7 @@ svm_migrate_vma_to_ram(struct amdgpu_device *adev, s=
truct svm_range *prange,
>>    * 0 - OK, otherwise error code
>>    */
>>   int svm_migrate_vram_to_ram(struct svm_range *prange, struct mm_struct=
 *mm,
>> -			    uint32_t trigger)
>> +			    uint32_t trigger, struct page *fault_page)
>>   {
>>   	struct amdgpu_device *adev;
>>   	struct vm_area_struct *vma;
>> @@ -807,7 +808,8 @@ int svm_migrate_vram_to_ram(struct svm_range *prange=
, struct mm_struct *mm,
>>   		}
>>     		next =3D min(vma->vm_end, end);
>> -		r =3D svm_migrate_vma_to_ram(adev, prange, vma, addr, next, trigger);
>> +		r =3D svm_migrate_vma_to_ram(adev, prange, vma, addr, next, trigger,
>> +			fault_page);
>>   		if (r < 0) {
>>   			pr_debug("failed %ld to migrate prange %p\n", r, prange);
>>   			break;
>> @@ -851,7 +853,7 @@ svm_migrate_vram_to_vram(struct svm_range *prange, u=
int32_t best_loc,
>>   	pr_debug("from gpu 0x%x to gpu 0x%x\n", prange->actual_loc, best_loc)=
;
>>     	do {
>> -		r =3D svm_migrate_vram_to_ram(prange, mm, trigger);
>> +		r =3D svm_migrate_vram_to_ram(prange, mm, trigger, NULL);
>>   		if (r)
>>   			return r;
>>   	} while (prange->actual_loc && --retries);
>> @@ -938,7 +940,8 @@ static vm_fault_t svm_migrate_to_ram(struct vm_fault=
 *vmf)
>>   		goto out_unlock_prange;
>>   	}
>>   -	r =3D svm_migrate_vram_to_ram(prange, mm,
>> KFD_MIGRATE_TRIGGER_PAGEFAULT_CPU);
>> +	r =3D svm_migrate_vram_to_ram(prange, mm, KFD_MIGRATE_TRIGGER_PAGEFAUL=
T_CPU,
>> +				vmf->page);
>>   	if (r)
>>   		pr_debug("failed %d migrate 0x%p [0x%lx 0x%lx] to ram\n", r,
>>   			 prange, prange->start, prange->last);
>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h b/drivers/gpu/drm/=
amd/amdkfd/kfd_migrate.h
>> index b3f0754..a5d7e6d 100644
>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
>> @@ -43,7 +43,7 @@ enum MIGRATION_COPY_DIR {
>>   int svm_migrate_to_vram(struct svm_range *prange,  uint32_t best_loc,
>>   			struct mm_struct *mm, uint32_t trigger);
>>   int svm_migrate_vram_to_ram(struct svm_range *prange, struct mm_struct=
 *mm,
>> -			    uint32_t trigger);
>> +			    uint32_t trigger, struct page *fault_page);
>>   unsigned long
>>   svm_migrate_addr_to_pfn(struct amdgpu_device *adev, unsigned long addr=
);
>>   diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
>> b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
>> index 11074cc..9139e5a 100644
>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
>> @@ -2913,13 +2913,15 @@ svm_range_restore_pages(struct amdgpu_device *ad=
ev, unsigned int pasid,
>>   				 */
>>   				if (prange->actual_loc)
>>   					r =3D svm_migrate_vram_to_ram(prange, mm,
>> -					   KFD_MIGRATE_TRIGGER_PAGEFAULT_GPU);
>> +					   KFD_MIGRATE_TRIGGER_PAGEFAULT_GPU,
>> +					   NULL);
>>   				else
>>   					r =3D 0;
>>   			}
>>   		} else {
>>   			r =3D svm_migrate_vram_to_ram(prange, mm,
>> -					KFD_MIGRATE_TRIGGER_PAGEFAULT_GPU);
>> +					KFD_MIGRATE_TRIGGER_PAGEFAULT_GPU,
>> +					NULL);
>>   		}
>>   		if (r) {
>>   			pr_debug("failed %d to migrate svms %p [0x%lx 0x%lx]\n",
>> @@ -3242,7 +3244,8 @@ svm_range_trigger_migration(struct mm_struct *mm, =
struct svm_range *prange,
>>   		return 0;
>>     	if (!best_loc) {
>> -		r =3D svm_migrate_vram_to_ram(prange, mm, KFD_MIGRATE_TRIGGER_PREFETC=
H);
>> +		r =3D svm_migrate_vram_to_ram(prange, mm,
>> +					KFD_MIGRATE_TRIGGER_PREFETCH, NULL);
>>   		*migrated =3D !r;
>>   		return r;
>>   	}
>> @@ -3303,7 +3306,7 @@ static void svm_range_evict_svm_bo_worker(struct w=
ork_struct *work)
>>   		mutex_lock(&prange->migrate_mutex);
>>   		do {
>>   			r =3D svm_migrate_vram_to_ram(prange, mm,
>> -						KFD_MIGRATE_TRIGGER_TTM_EVICTION);
>> +					KFD_MIGRATE_TRIGGER_TTM_EVICTION, NULL);
>>   		} while (!r && prange->actual_loc && --retries);
>>     		if (!r && prange->actual_loc)
>> diff --git a/include/linux/migrate.h b/include/linux/migrate.h
>> index 22c0a0c..82ffa47 100644
>> --- a/include/linux/migrate.h
>> +++ b/include/linux/migrate.h
>> @@ -62,6 +62,8 @@ extern const char *migrate_reason_names[MR_TYPES];
>>   #ifdef CONFIG_MIGRATION
>>     extern void putback_movable_pages(struct list_head *l);
>> +int migrate_folio_extra(struct address_space *mapping, struct folio *ds=
t,
>> +		struct folio *src, enum migrate_mode mode, int extra_count);
>>   int migrate_folio(struct address_space *mapping, struct folio *dst,
>>   		struct folio *src, enum migrate_mode mode);
>>   extern int migrate_pages(struct list_head *l, new_page_t new, free_pag=
e_t free,
>> @@ -212,6 +214,12 @@ struct migrate_vma {
>>   	 */
>>   	void			*pgmap_owner;
>>   	unsigned long		flags;
>> +
>> +	/*
>> +	 * Set to vmf->page if this is being called to migrate a page as part =
of
>> +	 * a migrate_to_ram() callback.
>> +	 */
>> +	struct page		*fault_page;
>>   };
>>     int migrate_vma_setup(struct migrate_vma *args);
>> diff --git a/lib/test_hmm.c b/lib/test_hmm.c
>> index e3965ca..89463ff 100644
>> --- a/lib/test_hmm.c
>> +++ b/lib/test_hmm.c
>> @@ -907,7 +907,7 @@ static int dmirror_migrate_to_system(struct dmirror =
*dmirror,
>>   	struct vm_area_struct *vma;
>>   	unsigned long src_pfns[64] =3D { 0 };
>>   	unsigned long dst_pfns[64] =3D { 0 };
>> -	struct migrate_vma args;
>> +	struct migrate_vma args =3D { 0 };
>>   	unsigned long next;
>>   	int ret;
>>   @@ -968,7 +968,7 @@ static int dmirror_migrate_to_device(struct dmirro=
r
>> *dmirror,
>>   	unsigned long src_pfns[64] =3D { 0 };
>>   	unsigned long dst_pfns[64] =3D { 0 };
>>   	struct dmirror_bounce bounce;
>> -	struct migrate_vma args;
>> +	struct migrate_vma args =3D { 0 };
>>   	unsigned long next;
>>   	int ret;
>>   @@ -1334,7 +1334,7 @@ static void dmirror_devmem_free(struct page *pag=
e)
>>     static vm_fault_t dmirror_devmem_fault(struct vm_fault *vmf)
>>   {
>> -	struct migrate_vma args;
>> +	struct migrate_vma args =3D { 0 };
>>   	unsigned long src_pfns =3D 0;
>>   	unsigned long dst_pfns =3D 0;
>>   	struct page *rpage;
>> @@ -1357,6 +1357,7 @@ static vm_fault_t dmirror_devmem_fault(struct vm_f=
ault *vmf)
>>   	args.dst =3D &dst_pfns;
>>   	args.pgmap_owner =3D dmirror->mdevice;
>>   	args.flags =3D dmirror_select_device(dmirror);
>> +	args.fault_page =3D vmf->page;
>>     	if (migrate_vma_setup(&args))
>>   		return VM_FAULT_SIGBUS;
>> diff --git a/mm/memory.c b/mm/memory.c
>> index b994784..65d3977 100644
>> --- a/mm/memory.c
>> +++ b/mm/memory.c
>> @@ -3742,7 +3742,21 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
>>   			ret =3D remove_device_exclusive_entry(vmf);
>>   		} else if (is_device_private_entry(entry)) {
>>   			vmf->page =3D pfn_swap_entry_to_page(entry);
>> -			ret =3D vmf->page->pgmap->ops->migrate_to_ram(vmf);
>> +			vmf->pte =3D pte_offset_map_lock(vma->vm_mm, vmf->pmd,
>> +					vmf->address, &vmf->ptl);
>> +			if (unlikely(!pte_same(*vmf->pte, vmf->orig_pte))) {
>> +				spin_unlock(vmf->ptl);
>> +				goto out;
>> +			}
>> +
>> +			/*
>> +			 * Get a page reference while we know the page can't be
>> +			 * freed.
>> +			 */
>> +			get_page(vmf->page);
>> +			pte_unmap_unlock(vmf->pte, vmf->ptl);
>> +			vmf->page->pgmap->ops->migrate_to_ram(vmf);
>> +			put_page(vmf->page);
>>   		} else if (is_hwpoison_entry(entry)) {
>>   			ret =3D VM_FAULT_HWPOISON;
>>   		} else if (is_swapin_error_entry(entry)) {
>> diff --git a/mm/migrate.c b/mm/migrate.c
>> index ce6a58f..e3f78a7 100644
>> --- a/mm/migrate.c
>> +++ b/mm/migrate.c
>> @@ -620,6 +620,25 @@ EXPORT_SYMBOL(folio_migrate_copy);
>>    *                    Migration functions
>>    ***********************************************************/
>>   +int migrate_folio_extra(struct address_space *mapping, struct folio *=
dst,
>> +		struct folio *src, enum migrate_mode mode, int extra_count)
>> +{
>> +	int rc;
>> +
>> +	BUG_ON(folio_test_writeback(src));	/* Writeback must be complete */
>> +
>> +	rc =3D folio_migrate_mapping(mapping, dst, src, extra_count);
>> +
>> +	if (rc !=3D MIGRATEPAGE_SUCCESS)
>> +		return rc;
>> +
>> +	if (mode !=3D MIGRATE_SYNC_NO_COPY)
>> +		folio_migrate_copy(dst, src);
>> +	else
>> +		folio_migrate_flags(dst, src);
>> +	return MIGRATEPAGE_SUCCESS;
>> +}
>> +
>>   /**
>>    * migrate_folio() - Simple folio migration.
>>    * @mapping: The address_space containing the folio.
>> @@ -635,20 +654,7 @@ EXPORT_SYMBOL(folio_migrate_copy);
>>   int migrate_folio(struct address_space *mapping, struct folio *dst,
>>   		struct folio *src, enum migrate_mode mode)
>>   {
>> -	int rc;
>> -
>> -	BUG_ON(folio_test_writeback(src));	/* Writeback must be complete */
>> -
>> -	rc =3D folio_migrate_mapping(mapping, dst, src, 0);
>> -
>> -	if (rc !=3D MIGRATEPAGE_SUCCESS)
>> -		return rc;
>> -
>> -	if (mode !=3D MIGRATE_SYNC_NO_COPY)
>> -		folio_migrate_copy(dst, src);
>> -	else
>> -		folio_migrate_flags(dst, src);
>> -	return MIGRATEPAGE_SUCCESS;
>> +	return migrate_folio_extra(mapping, dst, src, mode, 0);
>>   }
>>   EXPORT_SYMBOL(migrate_folio);
>>   diff --git a/mm/migrate_device.c b/mm/migrate_device.c
>> index 7235424..f756c00 100644
>> --- a/mm/migrate_device.c
>> +++ b/mm/migrate_device.c
>> @@ -313,14 +313,14 @@ static void migrate_vma_collect(struct migrate_vma=
 *migrate)
>>    * folio_migrate_mapping(), except that here we allow migration of a
>>    * ZONE_DEVICE page.
>>    */
>> -static bool migrate_vma_check_page(struct page *page)
>> +static bool migrate_vma_check_page(struct page *page, struct page *faul=
t_page)
>>   {
>>   	/*
>>   	 * One extra ref because caller holds an extra reference, either from
>>   	 * isolate_lru_page() for a regular page, or migrate_vma_collect() fo=
r
>>   	 * a device page.
>>   	 */
>> -	int extra =3D 1;
>> +	int extra =3D 1 + (page =3D=3D fault_page);
>>     	/*
>>   	 * FIXME support THP (transparent huge page), it is bit more complex =
to
>> @@ -393,7 +393,8 @@ static void migrate_vma_unmap(struct migrate_vma *mi=
grate)
>>   		if (folio_mapped(folio))
>>   			try_to_migrate(folio, 0);
>>   -		if (page_mapped(page) || !migrate_vma_check_page(page)) {
>> +		if (page_mapped(page) ||
>> +		    !migrate_vma_check_page(page, migrate->fault_page)) {
>>   			if (!is_zone_device_page(page)) {
>>   				get_page(page);
>>   				putback_lru_page(page);
>> @@ -505,6 +506,8 @@ int migrate_vma_setup(struct migrate_vma *args)
>>   		return -EINVAL;
>>   	if (!args->src || !args->dst)
>>   		return -EINVAL;
>> +	if (args->fault_page && !is_device_private_page(args->fault_page))
>> +		return -EINVAL;
>>     	memset(args->src, 0, sizeof(*args->src) * nr_pages);
>>   	args->cpages =3D 0;
>> @@ -735,8 +738,13 @@ void migrate_vma_pages(struct migrate_vma *migrate)
>>   			continue;
>>   		}
>>   -		r =3D migrate_folio(mapping, page_folio(newpage),
>> -				page_folio(page), MIGRATE_SYNC_NO_COPY);
>> +		if (migrate->fault_page =3D=3D page)
>> +			r =3D migrate_folio_extra(mapping, page_folio(newpage),
>> +						page_folio(page),
>> +						MIGRATE_SYNC_NO_COPY, 1);
>> +		else
>> +			r =3D migrate_folio(mapping, page_folio(newpage),
>> +					page_folio(page), MIGRATE_SYNC_NO_COPY);
>>   		if (r !=3D MIGRATEPAGE_SUCCESS)
>>   			migrate->src[i] &=3D ~MIGRATE_PFN_MIGRATE;
>>   	}

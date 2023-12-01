Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 839E080037C
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 07:03:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 582CB10E7EB;
	Fri,  1 Dec 2023 06:02:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2081.outbound.protection.outlook.com [40.107.220.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A4EF10E7EA;
 Fri,  1 Dec 2023 06:02:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FlZARq6aCUXdEBXGXg2UahQGx/XYUNi2JZvqixwhS/kk0foK48ugdLLDJPyHT8BMZ0qYPpS+z2dsmtT/a84VyAboWv9odCn5m4uS2R7r0vgjM27fFbNAdYkFtZTneiJ0M9zXHcr5i+1hlR2B2ITWAkbOjPxOub1rsS2n2gwaPEKhLr4U8iZ5Jyy9ouJ7ulZBrJ9l3SYc5p+Jnjoy57nMrQf5r/+UTrR7oPLz+ydy2wXkuQiY1KfMUzXs0dFaRl8UJN2sRutNyiga+YHbe0qbFOaRXWzhTKAzIavcKAHqFB+D2QLQ58LZklS7mYRPUcjY17b3+HYybOfxPVer84Mmlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2SAZsCDKA1N8s4AoXwgOQJeGsTGqfdnptqnh/oaQWVo=;
 b=QSGbeln9VVkTiAIdDSqZDuM3rjuEDMr5VTRx4Z0BHuAcfpg6EYzsJqEiwX8pkCIfiA1kLbaJpmkfiA1BxK6Jk5VzTH5pGB/JRLcOcr1CcevQvfbSahfQDYCFn1NmPYC/caVFUWqk9FMSvFeRE7kuKieqWR2b71zxzFSssY5shvMbLyP0I7TIf/gv/pIKXEm2g5SjC0O+C4KnHoHIQnXwQLQbbZLQldfFHSoiRKnZeNbWYKOgrF5ohr5zFQPWiwDXLADxnJhIxMA8ZJaLKASF0Yg6lC3guEsVtlzOuSrXesOGowTzfRkCrBfNGC4ThXS3EBm1MfI4lkVonXKXGE84Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2SAZsCDKA1N8s4AoXwgOQJeGsTGqfdnptqnh/oaQWVo=;
 b=TwVM5HkrhtElEFRkdeR3CYAR1+T+nPyKnsxs2uan6opeKofE8bWe8RdrjGL2qbARulY0xL/a1KjwHJYWvSEMQwjGxLnOClPtS/fi49MJZvmLssKK/UYSjtWmRvNpTsr1GEkF4YBKBacBFqEDTspMl1bytXh7l6zGPBd63gv1aMC1ehFGzaZiv6KCJoaARYqPDnpqlT5Ul9LquZxUy6yvMkYo//KiBsRxBXJ63+KsdjQXDIicJFpYxMt/Dq6Z5vbXy9chDzYunhat3AvGR6rDHJlO2pvKqWj4nHbpi6Z8f7ybzAFWBLr+aB48h+Byii/ve0jzUaHfCNLPLZuTYQkc8A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by BN9PR12MB5051.namprd12.prod.outlook.com (2603:10b6:408:134::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.24; Fri, 1 Dec
 2023 06:02:48 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::b8a:1b58:1edf:90e6]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::b8a:1b58:1edf:90e6%7]) with mapi id 15.20.7046.027; Fri, 1 Dec 2023
 06:02:46 +0000
References: <20231128125025.4449-1-weixi.zhu@huawei.com>
 <56ec69e0-fee1-4edf-8839-62ba6a2f0183@amd.com>
 <SA1PR11MB69918A97B03BC578CFD15EBA9283A@SA1PR11MB6991.namprd11.prod.outlook.com>
 <65c01257-b96d-4365-a86a-4d0758a8ec65@gmail.com>
 <cee6e5ba46f84557b0cd9122eaa8ae17@huawei.com>
User-agent: mu4e 1.8.13; emacs 29.1
From: Alistair Popple <apopple@nvidia.com>
To: zhuweixi <weixi.zhu@huawei.com>
Subject: Re: [RFC PATCH 0/6] Supporting GMEM (generalized memory management)
 for external memory devices
Date: Fri, 01 Dec 2023 17:01:07 +1100
In-reply-to: <cee6e5ba46f84557b0cd9122eaa8ae17@huawei.com>
Message-ID: <87edg6o3y5.fsf@nvdebian.thelocal>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SYBPR01CA0175.ausprd01.prod.outlook.com
 (2603:10c6:10:52::19) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3176:EE_|BN9PR12MB5051:EE_
X-MS-Office365-Filtering-Correlation-Id: 79ae513b-b133-466f-e236-08dbf23323e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zFfLPVbuZFtpel5fXDmz8HtSg+zfAMTPByKPXsXZFGKli2NNV4wVW1Q0AnwUNVyMuJ6UTDQXid+siuExEPYps/Sfas5AZ9rF6NZYZxIcJSpaerrtlW+Dc2+nbUs03jyP7xejr40LFNO+nNQjrxkMF67A1+QhCg2nAlJ61MpCaH3QHUs1QMQAdroHHxZL2mfyQ1kKSqI91HXUYDkn20Mq8pirqlBJa2MGVxxQ6lw6LpaOPiaT4BzG2rY2Ct0Heba7l6FEO9avf4RDGa/qmmg4Ftt9gGtORYKDibTsrBdi65UqCTc2K3G556sXm1Y30OIxS8q24LnC855iZb68OE6gqutaaCFo6lOtqbNgUZ+ep0RZ5IjtiKBhI1LgJa+bKo2zCTlOfCtHi7subjGkiBRdkZ3xHNOpKgccY+FVOBcCdgd1wpI6GEjgS8TaSAF9fK7CZquRF1+pLQqJZlUWBEmw+C9aHsz3XVZWtSabyKK1fQUXKbFFMY/kCZQ9dUkYUKJvuTG5mH0ke2PcCY0xguaA1MzKG4tU8MCFyghiktWbIzSNsbmIeOWhE9o8ztpkIgBbAtewLIeUxPaF2/+fmv5qanDZWvnZSORqBVskh/QJpMQ9e85Gs7EdXF6AxclS8grSfYqSuABXHe8+nJDZNdmun8pQmZXINsDOik2IH2LzsWU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(136003)(376002)(396003)(346002)(230273577357003)(230922051799003)(230173577357003)(64100799003)(1800799012)(451199024)(186009)(83380400001)(26005)(41300700001)(38100700002)(66574015)(53546011)(6512007)(9686003)(6506007)(6666004)(45080400002)(30864003)(6486002)(966005)(66899024)(2906002)(5660300002)(7416002)(316002)(6916009)(66556008)(54906003)(66476007)(66946007)(478600001)(8676002)(86362001)(8936002)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dDEzWHRFcElYdkRMUXYwbXByL2RRVnFkQWlGL25ITUplem1RSWw5bjZDbzNi?=
 =?utf-8?B?S05BbTVIbUVZYzM3ZVlhdHRhMUQ3dERRODJqZmt5VmoyTWV0U1ltMW1QemI2?=
 =?utf-8?B?QWkxSUU3a1VPUlNETW1pK3BaekFkQ3RkWUxUVWx2UVpMWE1HSkZGMjZ1UFJm?=
 =?utf-8?B?Z3BnUDFHazlIYWIrQUxlZXlJcW82cTlxdGhBTk5VcVU5REIwbFgzVzFJQUFs?=
 =?utf-8?B?Y1UzeFhseWxHbzlHT0ZIbVZlZTVNcnpWd1d2WDhyVUJlN3dlWGF2am1nUWM5?=
 =?utf-8?B?WVBWTmdnUW1PKzBtaHk1aERkWUZJbkpiRUp2a21oeXk3bnkxeHZwVlBWV0gx?=
 =?utf-8?B?T28zVU5FRDZTMEdudXpHVGN6RUp1UWNQMFAxNVhsbWN5S1B1WUJkb2RkbXh2?=
 =?utf-8?B?OWQrbzFkaEwrRm11QXhXVkcrOW1rS3pGQVp4alJ2SCtPMmFVa2Rwa1ZEdkFT?=
 =?utf-8?B?SHlPem1nb3RGamFGNk1KMUFHcXRYc2V4YXhUaVB4aWRaaWlFV0hqS3o3cytX?=
 =?utf-8?B?L2ZkR3JWOEZaTHB6eXhEbFA1VlArNHpoYUppRXE3Z3BsVXBJNDRhMFRNZXNq?=
 =?utf-8?B?eGhXSFVsTEVUZVJHTGJhcThVdmtHT1FjdHFmSldqMG9Cb2drK0xlRzZFK21l?=
 =?utf-8?B?dk5oUEFtdnB6cGk5QzNpMkkwSWFuZWdRWXlmSkh0WFNzUDc3dDNGZFNmS3U0?=
 =?utf-8?B?eVpqT3YvVVVlV29qSUNzd0d2cmF5cG81UGt0bG1vR2hSVlZJN0Jwck5tV2la?=
 =?utf-8?B?V0ZZazc4YVJRN2JGcTBaUUdHczNuUmg2R2JNQlRmUXNiNUZJTG1CY3NETGF3?=
 =?utf-8?B?THpiYUQ5WFhkUWR5cDJzMWsyREdPVkY4TjFXZTEyNTdOUmg5aS94WEFOSXd2?=
 =?utf-8?B?d2l4MFVVRmdsUGhpWWVmei8zRlZGTHJvblNHYWZYV0dsMytSOWhXc0xmb1VM?=
 =?utf-8?B?QWt4Zkc0dFljQXRBYzM5YmxPSzlIcURnVDJtN3NMbjRGdzYrWjZsbVNjeFNr?=
 =?utf-8?B?N3VYOStKK2ptN2ZCSXlOY0x5MGpmUnREK241dmdkMTYxMUI1M2lSUkhLUTBx?=
 =?utf-8?B?SDNwTUc0V1dvTWVXRUZOYmJPVkh0b2Z5eVNoT3FtajhZaHR2RGxDeExLV09F?=
 =?utf-8?B?VEpBZVZUdGJKRVp4ZkVaSG5LYUROeFdpY0dwK09tWmRQZXV6Mno1MzdlckxO?=
 =?utf-8?B?SVhmRkhFK2c1NGFkTndJZFJrM01lT0N3U01KQXJyandRSVMvaVVFcnhNMm1F?=
 =?utf-8?B?Ukh5UGRVMjRHamRibmFmeVk1RWhKYXRHV0VrdjRRampKeDIrb0s4NENNeU5Y?=
 =?utf-8?B?STNtS2V5Q1FTdkZLbUtIbysvSi9JZ0wrVmU0YXlBSzhWNjRoTzFQeE1MUnBY?=
 =?utf-8?B?bjhyZEpQWDA0Nm42Z2xiZ0lpUkxMaU1SaGdybGlqWHY5NE9TUWF2b0xXVVRk?=
 =?utf-8?B?ZHhGSTkySnlZdUI2WmpxQndkWGUwSmtiaHB4b25JT2xwUi84UUphU2lRSFJx?=
 =?utf-8?B?bmFhMUxqNG5VYUNKRlBxQnBYYS9pZnZtYmxlbU9LRmJyZUV4MG0zVlh6NTB4?=
 =?utf-8?B?cGs2dVR3dWJBcUtrS1lrV0k3bVRucTZHckZ6NXMxVExXMDVQS0ROOEV5aHJy?=
 =?utf-8?B?ZStxY1pBZjh4bkhnVWpOY3FEeGtFQy9tTmJETHlpYVZQcWVkUDBKMEx6QWZu?=
 =?utf-8?B?emRFRWpBazJ6Z2l2SFAzeExqQXFUeXpTYWNNRElpbXdJZ2hNU3ptRHAyWXBr?=
 =?utf-8?B?SzgzcWZ4OGZwb2U4OGJyT25HYlhQL2hXOFo3UGEyMmkvbjUyMlNYNXlJcFZB?=
 =?utf-8?B?dEhFaGNHRGZvS0NwdGZhTnk0MlF5aUMwV05XKzMrUmVNUVlBVkRoelFGQ2Jy?=
 =?utf-8?B?SUpxMmo1Y24rZ1pEa201Z3VTcmhmWkIvczMyelpFZWdyVWg5bnZSTGo4QlI0?=
 =?utf-8?B?QmRRMThhYW9OM0JvdkhNdUZRTkVKNmJCWEpBTERSWld5WFFEakZRSkp4UDJ1?=
 =?utf-8?B?QXVsNTV3TWlHcTRpc1JBYU1WZHg4VnlldUFpeW1qTFU4YmNWODNVVnl3alZ5?=
 =?utf-8?B?VFZhU3FUbmN6UDRmdXJQcm12VitzdUxVZ09PdlR2UUsyQzA4c3RGQnJ4V3RP?=
 =?utf-8?Q?2KCU62t1StwMrfIfeq7pNRjGE?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79ae513b-b133-466f-e236-08dbf23323e1
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2023 06:02:46.5698 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cbsvi0Je34pJvdcsJaMmGJMM62iYZBgvcvAv0d+Cce3UVhiQDkdenmaR12VUMeceCXgvjnotVN0p4K+LJ7j5KQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5051
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "Felix.Kuehling@amd.com" <Felix.Kuehling@amd.com>,
 "leonro@nvidia.com" <leonro@nvidia.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Danilo Krummrich <dakr@redhat.com>, "mgorman@suse.de" <mgorman@suse.de>,
 "jgg@nvidia.com" <jgg@nvidia.com>, "jhubbard@nvidia.com" <jhubbard@nvidia.com>,
 Dave Airlie <airlied@redhat.com>, "Wang, Zhi A" <zhi.a.wang@intel.com>,
 "rcampbell@nvidia.com" <rcampbell@nvidia.com>,
 "ziy@nvidia.com" <ziy@nvidia.com>,
 "weixi.zhu@openeuler.sh" <weixi.zhu@openeuler.sh>,
 Christian =?utf-8?Q?K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "mhairgrove@nvidia.com" <mhairgrove@nvidia.com>, "Zeng,
 Oak" <oak.zeng@intel.com>, "jglisse@redhat.com" <jglisse@redhat.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>,
 "ogabbay@kernel.org" <ogabbay@kernel.org>,
 "Xinhui.Pan@amd.com" <Xinhui.Pan@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


zhuweixi <weixi.zhu@huawei.com> writes:

> Glad to know that there is a common demand for a new syscall like
> hmadvise(). I expect it would also be useful for homogeneous NUMA
> cases. Credits to cudaMemAdvise() API which brought this idea to
> GMEM's design.

It's not clear to me that this would need to be a new syscall. Scanning
the patches it looks like your adding a NUMA node anyway, so the
existing interfaces (eg. madvise) with its various options
(MPOL_PREFERRED/PREFERRED_MANY) and
set_mempolicy/set_mempolicy_home_node() could potentially cover this for
both NUMA and hNUMA nodes. The main advantage here would be providing a
common userspace interface for setting these kind of hints.

> To answer @Oak's questions about GMEM vs. HMM,
>
> Here is the major difference:
>   GMEM's main target is to stop drivers from reinventing MM code,
> while HMM/MMU notifiers provide a compatible struct page solution and
> a coordination mechanism for existing device driver MMs that requires
> adding extra code to interact with CPU MM.
>
> A straightforward qualitative result for the main target: after
> integrating Huawei's Ascend NPU driver with GMEM's interface, 30,000
> lines of MM code were cut, leaving <100 lines invoking GMEM interface
> and 3,700 lines implementing vendor-specific functions. Some code from
> the 3,700 lines should be further moved to GMEM as a generalized
> feature like device memory oversubscription, but not included in this
> RFC patch yet.

I think it would be helpful if you could be a bit more specific on what
functionality the current HMM/migrate_vma/MMU notifier interfaces are
missing that every driver has to implement in a common way. Because I'm
not convinced we can't either improve those interfaces to provide what's
needed or add specific components (eg. a physical page allocator)
instead of a whole new framework.

> A list of high-level differences:=20
>   1. With HMM/MMU notifiers, drivers need to first implement a full MM su=
bsystem. With GMEM, drivers can reuse Linux's core MM.

What do the common bits of this full MM subsystem look like?
Fundamentally the existing HMM functionality can already make use of
Linux core MM to manage page tables and migrate pages and everything
else seems pretty device specific (ie. actual copying of data,
programming of MMUs, TLBs, etc.)

I can see that there would be scope to have say a generic memory
allocator, which I vaguely recall discussing in relation to
DEIVCE_PRIVATE pages in the past but @Oak suggests something close
already exists (drm/buddy).

Potentially I suppose there is VA allocation that might be common across
devices. However I have not had any experience working with devices with
VA requirements different enough from the CPU to matter. If they are so
different I'm not convinced it would be easy to have a common
implementation anyway.

>   2. HMM encodes device mapping information in the CPU arch-dependent
> PTEs, while GMEM proposes an abstraction layer in vm_object. Since
> GMEM's approach further decouples the arch-related stuff, drivers do
> not need to implement separate code for X86/ARM and etc.

I'm not following this. At present all HMM encodes in CPU PTEs is the
fact a page has been migrated to the device and what permissions it
has. I'm not aware of needing to treat X86 and ARM differently for
example here. Are you saying you want somewhere to store other bits
attached to a particular VA?

>   3. MMU notifiers register hooks at certain core MM events, while
> GMEM declares basic functions and internally invokes them. GMEM
> requires less from the driver side -- no need to understand what core
> MM behaves at certain MMU events. GMEM also expects fewer bugs than
> MMU notifiers: implementing basic operations with standard
> declarations vs. implementing whatever random device MM logic in MMU
> notifiers.

How is this proposal any different though? From what I can see it
replaces MMU notifier callbacks with TLB invalidation callbacks, but
that is essentially what MMU notifier callbacks are anyway. The "random
device MM logic" should just be clearing device TLBs. What other MM
logic has to be implemented in the MMU notifier callbacks that is the
same between devices?

>   4. GMEM plans to support a more lightweight physical memory
> management. The discussion about this part can be found in my cover
> letter. The question is whether struct page should be compatible
> (directly use HMM's ZONE_DEVICE solution) or a trimmed, smaller struct
> page that satisfies generalized demands from accelerators is more
> preferrable?

What is wrong with the current ZONE_DEVICE solution? You mention size of
struct page, but that is already being worked on through the conversion
to folios. Admittedly higher order HMM ZONE_DEVICE folios are not
currently supported, but that is something I'm actively working on at
the moment.

>   5. GMEM has been demonstrated to allow device memory
> oversubscription (a GMEM-based 32GB NPU card can run a GPT model
> oversubscribing 500GB host DDR), while drivers using HMM/MMU notifier
> must implement this logic one by one. I will submit this part in a
> future RFC patch.

I guess that would need to be part of the physical page allocator right?

> I want to reiterate that GMEM's shared address space support is a
> bonus result, not a main contribution... It was done because it was
> not difficult to implement internal CPU-device coordination mechanism
> when core MM is extended by GMEM to support devices.
>
> -Weixi
>
> -----Original Message-----
> From: Christian K=C3=B6nig <ckoenig.leichtzumerken@gmail.com>=20
> Sent: Thursday, November 30, 2023 4:28 PM
> To: Zeng, Oak <oak.zeng@intel.com>; Christian K=C3=B6nig
> <christian.koenig@amd.com>; zhuweixi <weixi.zhu@huawei.com>;
> linux-mm@kvack.org; linux-kernel@vger.kernel.org;
> akpm@linux-foundation.org; Danilo Krummrich <dakr@redhat.com>; Dave
> Airlie <airlied@redhat.com>; Daniel Vetter <daniel@ffwll.ch>
> Cc: intel-gvt-dev@lists.freedesktop.org; rcampbell@nvidia.com;
> mhairgrove@nvidia.com; jgg@nvidia.com; weixi.zhu@openeuler.sh;
> jhubbard@nvidia.com; intel-gfx@lists.freedesktop.org;
> apopple@nvidia.com; Xinhui.Pan@amd.com; amd-gfx@lists.freedesktop.org;
> tvrtko.ursulin@linux.intel.com; ogabbay@kernel.org;
> jglisse@redhat.com; dri-devel@lists.freedesktop.org; ziy@nvidia.com;
> Vivi, Rodrigo <rodrigo.vivi@intel.com>; alexander.deucher@amd.com;
> leonro@nvidia.com; Felix.Kuehling@amd.com; Wang, Zhi A
> <zhi.a.wang@intel.com>; mgorman@suse.de
> Subject: Re: [RFC PATCH 0/6] Supporting GMEM (generalized memory manageme=
nt) for external memory devices
>
> Hi Oak,
>
> yeah, #4 is indeed a really good point and I think Felix will agree to th=
at as well.
>
> HMM is basically still missing a way to advise device attributes for
> the CPU address space. Both migration strategy as well as device
> specific information (like cache preferences) fall into this category.
>
> Since there is a device specific component in those attributes as well
> I think device specific IOCTLs still make sense to update them, but
> HMM should offer the functionality to manage and store those
> information.
>
> Split and merge of VMAs only become a problem if you attach those
> information to VMAs, if you keep them completely separate than that
> doesn't become an issue either. The down side of this approach is that
> you don't get automatically extending attribute ranges for growing
> VMAs for example.
>
> Regards,
> Christian.
>
> Am 29.11.23 um 23:23 schrieb Zeng, Oak:
>> Hi Weixi,
>>
>> Even though Christian has listed reasons rejecting this proposal
> (yes they are very reasonable to me), I would open my mind and further
> explore the possibility here. Since the current GPU driver uses a hmm
> based implementation (AMD and NV has done this; At Intel we are
> catching up), I want to explore how much we can benefit from the
> proposed approach and how your approach can solve some pain points of
> our development. So basically what I am questioning here is: what is
> the advantage of your approach against hmm.
>>
>> To implement a UVM (unified virtual address space b/t cpu and gpu device=
), with hmm, driver essentially need to implement below functions:
>>
>> 1. device page table update. Your approach requires the same because=20
>> this is device specific codes
>>
>> 2. Some migration functions to migrate memory b/t system memory and
> GPU local memory. My understanding is, even though you generalized
> this a bit, such as modified cpu page fault path, provided "general"
> gm_dev_fault handler... but device driver still need to provide
> migration functions because migration functions have to be device
> specific (i.e., using device dma/copy engine for performance
> purpose). Right?
>>
>> 3. GPU physical memory management, this part is now in drm/buddy,
> shared by all drivers. I think with your approach, driver still need
> to provide callback functions to allocate/free physical pages. Right?
> Or do you let linux core mm buddy manage device memory directly?
>>
>> 4. madvise/hints/virtual address range management. This has been
> pain point for us. Right now device driver has to maintain certain
> virtual address range data structure to maintain hints and other
> virtual address range based memory attributes. Driver need to sync
> with linux vma. Driver need to explicitly deal with range
> split/merging... HMM doesn't provide support in this area. Your
> approach seems cleaner/simpler to me...
>>
>>
>> So in above, I have examined the some key factors of a gpu UVM
> memory manager. I think for #1 and #2, hmm has provide pretty good
> abstraction/tools for address space mirroring and migration
> helpers. For #3, since we have a common drm/buddy layer, I don't think
> it is a big problem for driver writer now.
>>
>> I do see #4 is something you solved more beautifully, requires new syste=
m call though.
>>
>> Oak
>>
>>
>>> -----Original Message-----
>>> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf=20
>>> Of Christian K=C3=B6nig
>>> Sent: Tuesday, November 28, 2023 8:09 AM
>>> To: Weixi Zhu <weixi.zhu@huawei.com>; linux-mm@kvack.org; linux-=20
>>> kernel@vger.kernel.org; akpm@linux-foundation.org; Danilo Krummrich=20
>>> <dakr@redhat.com>; Dave Airlie <airlied@redhat.com>; Daniel Vetter=20
>>> <daniel@ffwll.ch>
>>> Cc: dri-devel@lists.freedesktop.org; leonro@nvidia.com;=20
>>> apopple@nvidia.com; amd-gfx@lists.freedesktop.org; mgorman@suse.de;=20
>>> ziy@nvidia.com; Wang, Zhi A <zhi.a.wang@intel.com>;=20
>>> rcampbell@nvidia.com; jgg@nvidia.com; weixi.zhu@openeuler.sh;=20
>>> jhubbard@nvidia.com; intel-gfx@lists.freedesktop.org;=20
>>> mhairgrove@nvidia.com; jglisse@redhat.com; Vivi, Rodrigo=20
>>> <rodrigo.vivi@intel.com>; intel-gvt-dev@lists.freedesktop.org;
>>> tvrtko.ursulin@linux.intel.com; Felix.Kuehling@amd.com;=20
>>> Xinhui.Pan@amd.com; alexander.deucher@amd.com; ogabbay@kernel.org
>>> Subject: Re: [RFC PATCH 0/6] Supporting GMEM (generalized memory
>>> management) for external memory devices
>>>
>>> Adding a few missing important people to the explicit to list.
>>>
>>> Am 28.11.23 um 13:50 schrieb Weixi Zhu:
>>>> The problem:
>>>>
>>>> Accelerator driver developers are forced to reinvent external MM=20
>>>> subsystems case by case, because Linux core MM only considers host mem=
ory resources.
>>>> These reinvented MM subsystems have similar orders of magnitude of=20
>>>> LoC as Linux MM (80K), e.g. Nvidia-UVM has 70K, AMD GPU has 14K and=20
>>>> Huawei NPU
>>> has
>>>> 30K. Meanwhile, more and more vendors are implementing their own=20
>>>> accelerators, e.g. Microsoft's Maia 100. At the same time,=20
>>>> application-level developers suffer from poor programmability --=20
>>>> they must consider parallel address spaces and be careful about the=20
>>>> limited device DRAM capacity. This can be alleviated if a=20
>>>> malloc()-ed virtual address can be shared by the accelerator, or the=20
>>>> abundant host DRAM can further transparently backup the device local m=
emory.
>>>>
>>>> These external MM systems share similar mechanisms except for the=20
>>>> hardware-dependent part, so reinventing them is effectively=20
>>>> introducing redundant code (14K~70K for each case). Such=20
>>>> developing/maintaining is not cheap. Furthermore, to share a=20
>>>> malloc()-ed virtual address, device drivers need to deeply interact=20
>>>> with Linux MM via low-level MM APIs, e.g. MMU notifiers/HMM. This=20
>>>> raises the bar for driver development, since developers must=20
>>>> understand how Linux MM works. Further, it creates code maintenance=20
>>>> problems -- any changes to Linux MM potentially require coordinated ch=
anges to accelerator drivers using low-level MM APIs.
>>>>
>>>> Putting a cache-coherent bus between host and device will not make=20
>>>> these external MM subsystems disappear. For example, a=20
>>>> throughput-oriented accelerator will not tolerate executing heavy=20
>>>> memory access workload with a host MMU/IOMMU via a remote bus.=20
>>>> Therefore, devices will still have their own MMU and pick a simpler=20
>>>> page table format for lower address translation overhead, requiring ex=
ternal MM subsystems.
>>>>
>>>> --------------------
>>>>
>>>> What GMEM (Generalized Memory Management [1]) does:
>>>>
>>>> GMEM extends Linux MM to share its machine-independent MM code. Only=20
>>>> high-level interface is provided for device drivers. This prevents=20
>>>> accelerator drivers from reinventing the wheel, but relies on=20
>>>> drivers to implement their hardware-dependent functions declared by=20
>>>> GMEM. GMEM's
>>> key
>>>> interface include gm_dev_create(), gm_as_create(), gm_as_attach()=20
>>>> and gm_dev_register_physmem(). Here briefly describe how a device=20
>>>> driver utilizes them:
>>>> 1. At boot time, call gm_dev_create() and registers the implementation=
 of
>>>>      hardware-dependent functions as declared in struct gm_mmu.
>>>>        - If the device has local DRAM, call gm_dev_register_physmem() =
to
>>>>          register available physical addresses.
>>>> 2. When a device context is initialized (e.g. triggered by ioctl), che=
ck if
>>>>      the current CPU process has been attached to a gmem address space
>>>>      (struct gm_as). If not, call gm_as_create() and point current->mm=
->gm_as
>>>>      to it.
>>>> 3. Call gm_as_attach() to attach the device context to a gmem address =
space.
>>>> 4. Invoke gm_dev_fault() to resolve a page fault or prepare data befor=
e
>>>>      device computation happens.
>>>>
>>>> GMEM has changed the following assumptions in Linux MM:
>>>>     1. An mm_struct not only handle a single CPU context, but may also=
 handle
>>>>        external memory contexts encapsulated as gm_context listed in
>>>>        mm->gm_as. An external memory context can include a few or all =
of the
>>>>        following parts: an external MMU (that requires TLB invalidatio=
n), an
>>>>        external page table (that requires PTE manipulation) and extern=
al DRAM
>>>>        (that requires physical memory management).
>>>>     2. Faulting a MAP_PRIVATE VMA with no CPU PTE found does not neces=
sarily
>>>>        mean that a zero-filled physical page should be mapped. The vir=
tual
>>>>        page may have been mapped to an external memory device.
>>>>     3. Unmapping a page may include sending device TLB invalidation (e=
ven if
>>>>        its MMU shares CPU page table) and manipulating device PTEs.
>>>>
>>>> --------------------
>>>>
>>>> Semantics of new syscalls:
>>>>
>>>> 1. mmap(..., MAP_PRIVATE | MAP_PEER_SHARED)
>>>>       Allocate virtual address that is shared between the CPU and all
>>>>       attached devices. Data is guaranteed to be coherent whenever the
>>>>       address is accessed by either CPU or any attached device. If the=
 device
>>>>       does not support page fault, then device driver is responsible f=
or
>>>>       faulting memory before data gets accessed. By default, the CPU D=
RAM is
>>>>       can be used as a swap backup for the device local memory.
>>>> 2. hmadvise(NUMA_id, va_start, size, memory_hint)
>>>>       Issuing memory hint for a given VMA. This extends traditional ma=
dvise()
>>>>       syscall with an extra argument so that programmers have better c=
ontrol
>>>>       with heterogeneous devices registered as NUMA nodes. One=20
>>>> useful
>>> memory
>>>>       hint could be MADV_PREFETCH, which guarantees that the physical =
data of
>>>>       the given VMA [VA, VA+size) is migrated to NUMA node #id. Anothe=
r
>>>>       useful memory hint is MADV_DONTNEED. This is helpful to increase=
 device
>>>>       memory utilization. It is worth considering extending the existi=
ng
>>>>       madvise() syscall with one additional argument.
>>>>
>>>> --------------------
>>>>
>>>> Implementation details
>>>>
>>>> 1. New VMA flag: MAP_PEER_SHARED
>>>>
>>>> This new flag helps isolate GMEM feature, so that common processes=20
>>>> with no device attached does not need to maintain any logical page=20
>>>> table. It can be deleted if the extra overhead from GMEM is acceptable=
.
>>>>
>>>> 2. MMU functions
>>>> The device driver must implement the MMU functions declared in=20
>>>> struct gm_mmu.
>>>>
>>>> VA functions: peer_va_alloc_fixed(), peer_va_free()
>>>>
>>>> They are used to negotiate a common available VMA between a host=20
>>>> process and a device process at the mmap() time. This is because=20
>>>> some accelerators like Intel Xeon Phi or Huawei's Ascend NPU have=20
>>>> their acceleration tasks executed within a device CPU process=20
>>>> context. Some accelerators may also choose a different format of=20
>>>> virtual address space.
>>>>
>>>> PA functions: alloc_page(), free_page(), prepare_page()
>>>>
>>>> Alloc_page() and free_page() are used to allocate and free device=20
>>>> physical pages. Prepare_page() is used to zero-fill or DMA the data=20
>>>> of a physical page. These functions were removed from the submitted=20
>>>> patch, since GMEM does not need to invoke them when testing Huawei's=20
>>>> NPU accelerator. The
>>> NPU
>>>> accelerator has an OS running in the device that manages the device=20
>>>> physical memory. However, even for such a device it is better for=20
>>>> the host to directly manage device physical memory, which saves=20
>>>> device HBM and avoids synchronizing management status between the host=
 and device.
>>>>
>>>> Page-table functions:=20
>>>> pmap_create()/destroy()/enter()/release()/protect()
>>>>
>>>> They are used to create and destroy device page tables, install and=20
>>>> uninstall page table entries and to change the protection of page=20
>>>> table entries.
>>>>
>>>> TLB-invalidation functions: tlb_invl(), tlb_invl_coalesced()
>>>>
>>>> They are used to invalidate the TLB entries of a given range of VA=20
>>>> or invalidate a given list of VMAs.
>>>>
>>>> Wrapper functions: peer_map() and peer_unmap()
>>>>
>>>> These two functions are used to create or destroy a device mapping=20
>>>> which could include allocating physical memory and copying data.=20
>>>> They effectively wraps the PA functions, Page-table functions and=20
>>>> TLB-invalidation functions. Implementing these steps together allows=20
>>>> devices to optimize the communication cost between host and device.=20
>>>> However, it requires the device driver to correctly order these steps.
>>>>
>>>> 3. Tracking logical mappings:
>>>>
>>>> Each process starts maintaining an xarray in=20
>>>> mm->vm_obj->logical_page_table at the first time a host process=20
>>>> calls mmap(MAP_PRIVATE |
>>> MAP_PEER_SHARED).
>>>> When a virtual page gets touched, its mapping status is created and=20
>>>> stored in struct gm_mapping. The logical page table is utilized to=20
>>>> query the struct gm_mapping given a virtual address. GMEM extends=20
>>>> Linux MM to
>>> update
>>>> and lookup these logical mappings. For example, in the patch set we=20
>>>> modify the page fault path of to additionally check the logical=20
>>>> mapping of MAP_PEER_SHARED VMAs and identify if a device page should b=
e migrated.
>>>> Similarly, if the device driver wants to resolve a device page fault=20
>>>> or prefetch data, the driver should call gm_dev_fault(). This=20
>>>> function examines the mapping status and determines whether the=20
>>>> device driver should migrate a CPU page to device or install a zero-fi=
lled device page.
>>>>
>>>> The logical mapping abstraction enhances the extensibility of Linux=20
>>>> core MM (a virtual page may be mapped to a device physical page=20
>>>> without any CPU PTE installed). The current implementation is not=20
>>>> complete, since it only focused on anonymous VMAs with=20
>>>> MAP_PEER_SHARED flag. The future plan of logical page table is to=20
>>>> provide a generic abstraction layer that support common anonymous=20
>>>> memory (I am looking at you, transparent huge pages)
>>> and
>>>> file-backed memory.
>>>>
>>>> --------------------
>>>>
>>>> Use cases
>>>>
>>>> GMEM has been tested over Huawei's NPU (neural process unit) device dr=
iver.
>>>> The original NPU device driver has approximately 30,000 lines of=20
>>>> code for memory management. On the contrary, the GMEM-based one has=20
>>>> less than 30 lines of code calling GMEM API, with approximately=20
>>>> 3,700 lines of code implementing the MMU functions. This effectively=20
>>>> saves over 26,200 lines of MM code for one driver. Therefore,=20
>>>> developers from accelerator vendors, including Nvidia, AMD, Intel=20
>>>> and other companies are welcome to discuss if GMEM could be helpful.
>>>>
>>>> Using GMEM-based driver, it is possible to write a C-style=20
>>>> accelerator code with malloc(), whose underlying mmap() syscall=20
>>>> should include MAP_PEER_SHARED according to current GMEM=20
>>>> implementation. Importantly,
>>> GMEM
>>>> guarantees a coherent view of memory between the host and all=20
>>>> attached devices. This means that any data written by the CPU or any=20
>>>> attached accelerator can be seen by the next memory load instruction=20
>>>> issued by any attached accelerator or the CPU. Furthermore, the NPU=20
>>>> device was able to oversubscribe memory by swapping memory to host=20
>>>> DDR. Note that this
>>> memory
>>>> oversubscription mechanism can be universal if the physical memory=20
>>>> management is provided by GMEM. Other potential use cases of GMEM=20
>>>> could include the IOMMU driver, KVM and RDMA drivers, as long as the=20
>>>> device needs to manage external memory resources like VMAs, MMUs or lo=
cal DRAMs.
>>>>
>>>> --------------------
>>>>
>>>> Discussion
>>>>
>>>> Physical memory management
>>>> Most accelerators require the host OS to manage device DRAM. Even=20
>>>> accelerators capable of running an OS inside the driver can benefit=20
>>>> from it, since it helps avoid synchronizing management status=20
>>>> between the host and device. In Linux OSS EU summit 2023, Hannes=20
>>>> Reinecke from SUSE Labs suggested that people are concerned with the=20
>>>> memory consumption of struct page (which considers all generic=20
>>>> scenarios for the kernel). This leads to a possible solution that,=20
>>>> instead of reusing Linux struct page and ZONE_DEVICE mechanism, GMEM=20
>>>> can implement an isolated buddy allocator
>>> for
>>>> the device to instantiate and register. The isolation is useful=20
>>>> because device DRAM physical address space is independent.=20
>>>> Furthermore, the isolated buddy allocator can utilize a customized=20
>>>> struct page that consumes less memory. It is worth discussing if=20
>>>> accelerator vendors desire this solution.
>>>>
>>>> MMU functions
>>>> The MMU functions peer_map() and peer_unmap() overlap other=20
>>>> functions, leaving a question if the MMU functions should be=20
>>>> decoupled as more basic operations. Decoupling them could=20
>>>> potentially prevent device drivers coalescing these basic steps=20
>>>> within a single host-device communication operation, while coupling=20
>>>> them makes it more difficult for device drivers to utilize GMEM interf=
ace.
>>>>
>>>> The idea of GMEM was originated from Weixi's PhD study with Prof.=20
>>>> Scott Rixner and Prof. Alan L. Cox at Rice University.
>>>>
>>>> [1] https://arxiv.org/abs/2310.12554.
>>>>
>>>> Weixi Zhu (6):
>>>>     mm/gmem: add heterogeneous NUMA node
>>>>     mm/gmem: add arch-independent abstraction to track address mapping
>>>>       status
>>>>     mm/gmem: add GMEM (Generalized Memory Management) interface for
>>>>       external accelerators
>>>>     mm/gmem: add new syscall hmadvise() to issue memory hints for
>>>>       heterogeneous NUMA nodes
>>>>     mm/gmem: resolve VMA conflicts for attached peer devices
>>>>     mm/gmem: extending Linux core MM to support unified virtual addres=
s
>>>>       space
>>>>
>>>>    arch/arm64/include/asm/unistd.h         |   2 +-
>>>>    arch/arm64/include/asm/unistd32.h       |   2 +
>>>>    drivers/base/node.c                     |   6 +
>>>>    fs/proc/task_mmu.c                      |   3 +
>>>>    include/linux/gmem.h                    | 368 ++++++++++++
>>>>    include/linux/mm.h                      |   8 +
>>>>    include/linux/mm_types.h                |   5 +
>>>>    include/linux/nodemask.h                |  10 +
>>>>    include/uapi/asm-generic/mman-common.h  |   4 +
>>>>    include/uapi/asm-generic/unistd.h       |   5 +-
>>>>    init/main.c                             |   2 +
>>>>    kernel/fork.c                           |   5 +
>>>>    kernel/sys_ni.c                         |   2 +
>>>>    mm/Kconfig                              |  14 +
>>>>    mm/Makefile                             |   1 +
>>>>    mm/gmem.c                               | 746 +++++++++++++++++++++=
+++
>>>>    mm/huge_memory.c                        |  85 ++-
>>>>    mm/memory.c                             |  42 +-
>>>>    mm/mempolicy.c                          |   4 +
>>>>    mm/mmap.c                               |  40 +-
>>>>    mm/oom_kill.c                           |   2 +
>>>>    mm/page_alloc.c                         |   3 +
>>>>    mm/vm_object.c                          | 309 ++++++++++
>>>>    tools/include/uapi/asm-generic/unistd.h |   5 +-
>>>>    24 files changed, 1654 insertions(+), 19 deletions(-)
>>>>    create mode 100644 include/linux/gmem.h
>>>>    create mode 100644 mm/gmem.c
>>>>    create mode 100644 mm/vm_object.c
>>>>


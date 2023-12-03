Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1DC802907
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 00:36:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA26B10E0D9;
	Sun,  3 Dec 2023 23:36:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::60e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4B5710E0D9;
 Sun,  3 Dec 2023 23:35:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ivlmmcpuZMISMs6jcYuVpI5rn/GJE15pJLF/gmFKgofi7ndBAlv4CwXvFnUFOs1wuXkXjIGSPJORZwfmtavJQtt1iZT/ZqLVdortsxdjQ2PtY1IWOXQLbnaMlTPnaYM8IIC5wPoAP3QftLOm5x4cWqSmVXbOGCtb9eFWhHD6VutjVRxl9dzJ7F91XCowr3d7u3rdK0nflmU4bFuhz7jbGB+5aGrLqEHPtPglH/fCSVNnhOCyPf7Mr3ZrF3oI2xgp6efpLGX49SO7lU1JtmdkiPElMkTmBVS1er5QQH1b4ONdJkf5Zjcf9KRjyVT91JNsqotq1xapz+ufKHRETgjpSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=12ZM0oZ6x9Z+o0eoOLeuSEvaipHnjLXGk/gPO0cbBBc=;
 b=QQ013kPe5wIvM6F8z3FX1O3xe/cvnDANAOHcdLe6YSo5MtKZklJFE0Scaz2Hc70PeE4piLgZotL8UFZswtCbhvu9ZwbxNfsmpgBF+w9W+nwjw4OaVPJgtLI7WSkNXmfaCkPFFn8mWLXJBIP1HOnMs3ok3d4tTbZdgn2A9ABySPHwvnM1yQDFRh4BqEhwvFSMfhkC8QPpIUAdZXa0MPMqEEHIZFvQZCqinpxqlLv/vMc0ujAN76PJcahaEhRqz6wxYcCKeM6FDuihAnuwSlM3AXHxLEKClWJZb3WYAzu0BZs/mCSjxLkvqze0R18isWai2xRO6Xuht3GkSP9dGHI6Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=12ZM0oZ6x9Z+o0eoOLeuSEvaipHnjLXGk/gPO0cbBBc=;
 b=IaWgTd5+T6/O5RTYTb1eByPdADZkDEyuFmAlx6TCIAl+4sHJ7CwZ0HCnxDoZ4+jAagYGolNObMwYVU4Ny1d5E/Sk4X9D7YlzYBx0h+ZZANdnh0/yH9/E8CWlwf7DSGPjo08oO2yEg88fCDpDRcAct5E3pZ8N/QIf2siBSBdXiVw105fOYyml2vwg5YYWDUPon4DWcS/Zo+mQ8Jkrq5F259gNLprZAtsDXAMFqliWjHQ6IQJRovNR+qEW5+VVEhYkwRNYiWjZhCmjNtu/6+JTEHWpcJkEAsum63BMBgn3pvTA/ISMANr/tHSBeaOSUJ8RbSaAhL0TnUjB/H1pWKalfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by CH2PR12MB4150.namprd12.prod.outlook.com (2603:10b6:610:a6::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Sun, 3 Dec
 2023 23:35:41 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::b8a:1b58:1edf:90e6]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::b8a:1b58:1edf:90e6%7]) with mapi id 15.20.7046.033; Sun, 3 Dec 2023
 23:35:41 +0000
References: <20231128125025.4449-1-weixi.zhu@huawei.com>
 <56ec69e0-fee1-4edf-8839-62ba6a2f0183@amd.com>
 <SA1PR11MB69918A97B03BC578CFD15EBA9283A@SA1PR11MB6991.namprd11.prod.outlook.com>
 <65c01257-b96d-4365-a86a-4d0758a8ec65@gmail.com>
 <cee6e5ba46f84557b0cd9122eaa8ae17@huawei.com>
 <SA1PR11MB6991E67DA37DAC8EDA9929CB9281A@SA1PR11MB6991.namprd11.prod.outlook.com>
 <6d6a9084-c385-4df0-848b-2425c306b32e@amd.com>
User-agent: mu4e 1.8.13; emacs 29.1
From: Alistair Popple <apopple@nvidia.com>
To: Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>
Subject: Re: [RFC PATCH 0/6] Supporting GMEM (generalized memory management)
 for external memory devices
Date: Mon, 04 Dec 2023 10:32:32 +1100
In-reply-to: <6d6a9084-c385-4df0-848b-2425c306b32e@amd.com>
Message-ID: <8734wic113.fsf@nvdebian.thelocal>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SY6PR01CA0139.ausprd01.prod.outlook.com
 (2603:10c6:10:1b9::6) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3176:EE_|CH2PR12MB4150:EE_
X-MS-Office365-Filtering-Correlation-Id: 496b7b66-d71e-429f-046b-08dbf4588f7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ouENPXVLwEO0ZvuIeVLtHQypnkYsNGYgDk8Uj+Ca20T3KiiQj+RYdnYBwRj2Xi6A9yODowTCCZF1d1Aon+GOTF4KvEPL3SGDK1ndg7WAWc8nGHxgXp3+UKWLJwwQpI2gMddOgEFqc48ghXiS8izcYB04zmc70ffZVRys3QsepAiLuL28+RdG08oQEwBnNlj+4boUrfiHiNGUdBvPcwJy0PWN/R3bZy7K7dLtdoyOmvS3/XeV46IYukGjpiFQ03chmurP/QFTJABYnedZR8xloPwcJkmnRZjroeHJ89wenwx1EloruXT4ShCOCl7YqsRDrAAgD7rRzm6bZF6tog9RKT4Qmz8zsZsqXA4wboK5hirAg7sOSTdKbiLhFdbjPlE8IUnRqegK6IHHC08u575GWVeOxFRf3TzP+ICz+QtIqz2nWbDmZkbJZ6oBtrLFPQ/UnKwi1LSg5hG47B+6c4H+sVSUIQJWStWyWLUd1fAkJh5x3jDSX1d2L2P4T6V46VTTMgh5HR7iBHdwwKiW/PbcGZntZNDBGmWV78vlESnHFCJZa70IkIx0upQRoukPl3vYiOwgFl7wisggHOafaVW0elhhGyD+cvKDpc2NAgxbyoZZOLN149CO3OWkXt0faO3KqoKiuz5x6G2OlyUyUhWBcdSQs2Il5KZn0C98rynUVo8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(346002)(39860400002)(396003)(136003)(230273577357003)(230173577357003)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(66946007)(54906003)(66476007)(66556008)(66899024)(316002)(6916009)(478600001)(45080400002)(6486002)(6666004)(7416002)(30864003)(5660300002)(41300700001)(38100700002)(2906002)(86362001)(4326008)(8676002)(8936002)(83380400001)(26005)(66574015)(6512007)(9686003)(53546011)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aWpUbU56WE9VTHlMdWl3TzJ4Qk5XekF2RFA4Nk1wV293a1c2czNKNDVZbmh1?=
 =?utf-8?B?bCs2NDNZSHFPRGQrL1hWRG44a3pJRGxCY3cxRzBUMzNiUEFIRmdac3VQM0t2?=
 =?utf-8?B?Zm4zQWZwcWdCNVQ4cVg3QlMycUowbHMwY0hXTWVuT0cvNk1Hc2EzMTBPMER3?=
 =?utf-8?B?ZmN4OGo5UVg5ak0zb1ZvSFMxY2xGMWRBZzBNeXRWdldJSEFjakIwQlh6dnl6?=
 =?utf-8?B?VWRQdFlZRFAvTm9SNTNRbGVhM1RUdE9mRmFmbFBxVFVpVkhVMUdGWk9zZlgw?=
 =?utf-8?B?MFNBMS9aZHdnVVRJUW1jdXVwT2lOMmhvWmdTWjZmaHFjaG9GQVNtTlEybVRG?=
 =?utf-8?B?SW1rQVF6S21SMGpoNnBXZEw5T0NtNU1IWjdLcGUxYTl1c0VhRnB6L2tVbkI5?=
 =?utf-8?B?VGZKTXRveFlHaFdKL1dKbjBFR0JNT3hWVzdIUmIrUkRLVkVsUkFZTWtlS1Zj?=
 =?utf-8?B?SThZUUZyZ1J0dHhDWDJaVXVtVVBDUE85L1l2MEtpY3Z0RUkrT0tDelF4UWNJ?=
 =?utf-8?B?bmkwNmh3ZWg5ajB6ZjlZQWI1NDBHRW5QUnUxOS8zYzd1QjNjdEFwY3htSm0x?=
 =?utf-8?B?WVpINTdwb1JidHdVMklneVZNa3Y5bXBlKzkySGxjeWhMRWl4T3RhcVl1VVlT?=
 =?utf-8?B?bEZTZlp6VWRPRmRZN09DcERRdDV4Uy9BdGJxZDl5bmVDeWVubHBWQ1p6bzl5?=
 =?utf-8?B?ckdEd3U3RjhJK29ObGwza1pVTWN6OGI1RkNjcFZkTlFJKzVVSUZXVGd6OENU?=
 =?utf-8?B?SkYvRzEyajNCbXB2NXpkRHVRellSOFM1anhtU2RIMUM0eUN6cmtsckJDVGda?=
 =?utf-8?B?UXBTYTFuQXJhZis4dy84SitxYXdyMU5BUlpDZGNSbDV5TjRxVEZiMDNRTGR1?=
 =?utf-8?B?N0hGR0ZvWVpkMUlVdnhKWkpLVnhPRSs2Qllhb0x2aU5VanM3Rm9mQUxsbUJ5?=
 =?utf-8?B?dy9Bc25Fd3RzSE1BelIzOWVXbjl6MTRHRUF1djJCVDUyRXNTU3VPaXNFQktG?=
 =?utf-8?B?M1ZKbWhIN002L3YvYjNnd3NjZStpZlNQdEUwMkRoVTJwRFdFYytjNFlVTloz?=
 =?utf-8?B?ZmFrcW9mbVhCM2RYdDBsOWVORXVGUEZQZHJ6MXdad1ZwTGZEbC9pK2FqeE91?=
 =?utf-8?B?Wmd1QmJDWlJNMjQzcTNsNys4VmlITjhDc3pvVlZ2am5sR0ptWmR4OHQzZS9D?=
 =?utf-8?B?cWpzQUh2K29uUTdIY1JuZTdWOFdmQkVxOWtrTDNlMXZvQnRxL0o1MFoyN3Jr?=
 =?utf-8?B?QUgyU0NuNDNERUEzd0Q2b2laV2tLUmVxV0FMcDhQM3N1SExTNEZBSjJJbHJo?=
 =?utf-8?B?dVRCQU1wZFluZStYaVNNZnRHa2NOTkVDZ2lPRnpadVlQMHh6a2RxTklnV0hB?=
 =?utf-8?B?SVRIaDJFeVJUbXJ1c0taZHdyOTcvYzBQNUNuQWNUTERoRVhDSVQvUlJreXIy?=
 =?utf-8?B?cVBKeUlMNlAySkNUbCsvNnF0MUZac0dMQm5NVVpYbmp1ekduZnZqL3o1UG80?=
 =?utf-8?B?ZTVHd2xXcS9zQjc5YlFCS0R1M1VTdmxUMFpldVMwTFI0RmpiK3MzMzlKNW95?=
 =?utf-8?B?cXp4WGYxVUNiZGhUL3NrMzdXWk80ZVVzenhsYTh1OHNuK2NHNEt1Q3Nkak5k?=
 =?utf-8?B?bVMvdDNza1dDc2N3Z0t6bDF5SkwyelE1elAxMU1mSEU1bGJmMTNHcWZjOGhT?=
 =?utf-8?B?bVo3TFk5QzNBb1JneFU4WFp3UkpBWHBmR09FQWxGK0xURjRCTjRnQTlaWERW?=
 =?utf-8?B?eTY4OU1Hak9YMzBIbEtFTGt6ZFJnVnpDSjZmK3hhV0xSMWdsaWpZL25lWS9X?=
 =?utf-8?B?Q0gwOEdiOE93aGhDOEJoYW9qM1pONUlqbXpLelhUT1FkTEZKRHhNRlE4VkpS?=
 =?utf-8?B?enZ0ckVkdTRJRStmNFhXeWU3OWtiMHBCb0YxQmpxRnZUVWVZMnFOQlJNcHYv?=
 =?utf-8?B?WlBTU0tZaXNvdHBUT0crSEhFRHhBNmxNVkh3SG0rNUJadHkrZDkrU3hiczdk?=
 =?utf-8?B?R3Q3Mm5VcDhITzZQdVpsTng4Tk1rVkszd1ZtYTZFUTlTaWlOYTZkdVJ5Y1dO?=
 =?utf-8?B?OUpNQ1NFdUxYcE4yVkVBejdzVkNzcnU5bUR4SDJ4QUJPSDZzVklFc3MzSUNH?=
 =?utf-8?Q?WUWPAc0aP4HGlXJQhU+64Dla4?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 496b7b66-d71e-429f-046b-08dbf4588f7d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2023 23:35:41.1325 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ProhGdGQXAj8DBlRxKax03fzetCKJlq3mAsY61vJ8+aKmcYsTZzu3rJ7yCBBUvVstzZEvlgqGzzm2wz6AC/seQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4150
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
 "leonro@nvidia.com" <leonro@nvidia.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Danilo Krummrich <dakr@redhat.com>, "mgorman@suse.de" <mgorman@suse.de>,
 "ziy@nvidia.com" <ziy@nvidia.com>, "jhubbard@nvidia.com" <jhubbard@nvidia.com>,
 Dave Airlie <airlied@redhat.com>, "Wang, Zhi A" <zhi.a.wang@intel.com>,
 "rcampbell@nvidia.com" <rcampbell@nvidia.com>,
 "jgg@nvidia.com" <jgg@nvidia.com>,
 "weixi.zhu@openeuler.sh" <weixi.zhu@openeuler.sh>,
 Christian =?utf-8?Q?K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "mhairgrove@nvidia.com" <mhairgrove@nvidia.com>, "Zeng,
 Oak" <oak.zeng@intel.com>, "jglisse@redhat.com" <jglisse@redhat.com>,
 zhuweixi <weixi.zhu@huawei.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>,
 "Felix.Kuehling@amd.com" <Felix.Kuehling@amd.com>,
 "Xinhui.Pan@amd.com" <Xinhui.Pan@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "ogabbay@kernel.org" <ogabbay@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Christian K=C3=B6nig <christian.koenig@amd.com> writes:

> Am 01.12.23 um 06:48 schrieb Zeng, Oak:
>> [SNIP]

>> Besides memory eviction/oversubscription, there are a few other pain poi=
nts when I use hmm:
>>
>> 1) hmm doesn't support file-back memory, so it is hard to share
> memory b/t process in a gpu environment. You mentioned you have a
> plan... How hard is it to support file-backed in your approach?
>
> As hard as it is to support it through HMM. That's what I meant that
> this approach doesn't integrate well, as far as I know the problem
> isn't inside HMM or any other solution but rather in the file system
> layer.

In what way does HMM not support file-backed memory? I was under the
impression that at least hmm_range_fault() does.

 - Alistair

> Regards,
> Christian.
>
>> 2)virtual address range based memory attribute/hint: with hmadvise,
> where do you save the memory attribute of a virtual address range? Do
> you need to extend vm_area_struct to save it? With hmm, we have to
> maintain such information at driver. This ends up with pretty
> complicated logic to split/merge those address range. I know core mm
> has similar logic to split/merge vma...
>>
>> Oak
>>
>>
>>> -Weixi
>>>
>>> -----Original Message-----
>>> From: Christian K=C3=B6nig<ckoenig.leichtzumerken@gmail.com>
>>> Sent: Thursday, November 30, 2023 4:28 PM
>>> To: Zeng, Oak<oak.zeng@intel.com>; Christian K=C3=B6nig
>>> <christian.koenig@amd.com>; zhuweixi<weixi.zhu@huawei.com>; linux-
>>> mm@kvack.org;linux-kernel@vger.kernel.org;akpm@linux-foundation.org;
>>> Danilo Krummrich<dakr@redhat.com>; Dave Airlie<airlied@redhat.com>; Dan=
iel
>>> Vetter<daniel@ffwll.ch>
>>> Cc:intel-gvt-dev@lists.freedesktop.org;rcampbell@nvidia.com;
>>> mhairgrove@nvidia.com;jgg@nvidia.com;weixi.zhu@openeuler.sh;
>>> jhubbard@nvidia.com;intel-gfx@lists.freedesktop.org;apopple@nvidia.com;
>>> Xinhui.Pan@amd.com;amd-gfx@lists.freedesktop.org;
>>> tvrtko.ursulin@linux.intel.com;ogabbay@kernel.org;jglisse@redhat.com; d=
ri-
>>> devel@lists.freedesktop.org;ziy@nvidia.com; Vivi, Rodrigo
>>> <rodrigo.vivi@intel.com>;alexander.deucher@amd.com;leonro@nvidia.com;
>>> Felix.Kuehling@amd.com; Wang, Zhi A<zhi.a.wang@intel.com>;
>>> mgorman@suse.de
>>> Subject: Re: [RFC PATCH 0/6] Supporting GMEM (generalized memory
>>> management) for external memory devices
>>>
>>> Hi Oak,
>>>
>>> yeah, #4 is indeed a really good point and I think Felix will agree to =
that as well.
>>>
>>> HMM is basically still missing a way to advise device attributes for th=
e CPU
>>> address space. Both migration strategy as well as device specific infor=
mation (like
>>> cache preferences) fall into this category.
>>>
>>> Since there is a device specific component in those attributes as well =
I think
>>> device specific IOCTLs still make sense to update them, but HMM should =
offer
>>> the functionality to manage and store those information.
>>>
>>> Split and merge of VMAs only become a problem if you attach those infor=
mation
>>> to VMAs, if you keep them completely separate than that doesn't become =
an
>>> issue either. The down side of this approach is that you don't get auto=
matically
>>> extending attribute ranges for growing VMAs for example.
>>>
>>> Regards,
>>> Christian.
>>>
>>> Am 29.11.23 um 23:23 schrieb Zeng, Oak:
>>>> Hi Weixi,
>>>>
>>>> Even though Christian has listed reasons rejecting this proposal (yes =
they are
>>> very reasonable to me), I would open my mind and further explore the po=
ssibility
>>> here. Since the current GPU driver uses a hmm based implementation (AMD=
 and
>>> NV has done this; At Intel we are catching up), I want to explore how m=
uch we
>>> can benefit from the proposed approach and how your approach can solve =
some
>>> pain points of our development. So basically what I am questioning here=
 is: what
>>> is the advantage of your approach against hmm.
>>>> To implement a UVM (unified virtual address space b/t cpu and gpu devi=
ce),
>>> with hmm, driver essentially need to implement below functions:
>>>> 1. device page table update. Your approach requires the same because
>>>> this is device specific codes
>>>>
>>>> 2. Some migration functions to migrate memory b/t system memory and GP=
U
>>> local memory. My understanding is, even though you generalized this a b=
it, such
>>> as modified cpu page fault path, provided "general" gm_dev_fault handle=
r... but
>>> device driver still need to provide migration functions because migrati=
on
>>> functions have to be device specific (i.e., using device dma/copy engin=
e for
>>> performance purpose). Right?
>>>> 3. GPU physical memory management, this part is now in drm/buddy, shar=
ed
>>> by all drivers. I think with your approach, driver still need to provid=
e callback
>>> functions to allocate/free physical pages. Right? Or do you let linux c=
ore mm
>>> buddy manage device memory directly?
>>>> 4. madvise/hints/virtual address range management. This has been pain =
point
>>> for us. Right now device driver has to maintain certain virtual address=
 range data
>>> structure to maintain hints and other virtual address range based memor=
y
>>> attributes. Driver need to sync with linux vma. Driver need to explicit=
ly deal with
>>> range split/merging... HMM doesn't provide support in this area. Your a=
pproach
>>> seems cleaner/simpler to me...
>>>>
>>>> So in above, I have examined the some key factors of a gpu UVM memory
>>> manager. I think for #1 and #2, hmm has provide pretty good abstraction=
/tools
>>> for address space mirroring and migration helpers. For #3, since we hav=
e a
>>> common drm/buddy layer, I don't think it is a big problem for driver wr=
iter now.
>>>> I do see #4 is something you solved more beautifully, requires new sys=
tem call
>>> though.
>>>> Oak
>>>>
>>>>
>>>>> -----Original Message-----
>>>>> From: dri-devel<dri-devel-bounces@lists.freedesktop.org>  On Behalf
>>>>> Of Christian K=C3=B6nig
>>>>> Sent: Tuesday, November 28, 2023 8:09 AM
>>>>> To: Weixi Zhu<weixi.zhu@huawei.com>;linux-mm@kvack.org; linux-
>>>>> kernel@vger.kernel.org;akpm@linux-foundation.org; Danilo Krummrich
>>>>> <dakr@redhat.com>; Dave Airlie<airlied@redhat.com>; Daniel Vetter
>>>>> <daniel@ffwll.ch>
>>>>> Cc:dri-devel@lists.freedesktop.org;leonro@nvidia.com;
>>>>> apopple@nvidia.com;amd-gfx@lists.freedesktop.org;mgorman@suse.de;
>>>>> ziy@nvidia.com; Wang, Zhi A<zhi.a.wang@intel.com>;
>>>>> rcampbell@nvidia.com;jgg@nvidia.com;weixi.zhu@openeuler.sh;
>>>>> jhubbard@nvidia.com;intel-gfx@lists.freedesktop.org;
>>>>> mhairgrove@nvidia.com;jglisse@redhat.com; Vivi, Rodrigo
>>>>> <rodrigo.vivi@intel.com>;intel-gvt-dev@lists.freedesktop.org;
>>>>> tvrtko.ursulin@linux.intel.com;Felix.Kuehling@amd.com;
>>>>> Xinhui.Pan@amd.com;alexander.deucher@amd.com;ogabbay@kernel.org
>>>>> Subject: Re: [RFC PATCH 0/6] Supporting GMEM (generalized memory
>>>>> management) for external memory devices
>>>>>
>>>>> Adding a few missing important people to the explicit to list.
>>>>>
>>>>> Am 28.11.23 um 13:50 schrieb Weixi Zhu:
>>>>>> The problem:
>>>>>>
>>>>>> Accelerator driver developers are forced to reinvent external MM
>>>>>> subsystems case by case, because Linux core MM only considers host
>>> memory resources.
>>>>>> These reinvented MM subsystems have similar orders of magnitude of
>>>>>> LoC as Linux MM (80K), e.g. Nvidia-UVM has 70K, AMD GPU has 14K and
>>>>>> Huawei NPU
>>>>> has
>>>>>> 30K. Meanwhile, more and more vendors are implementing their own
>>>>>> accelerators, e.g. Microsoft's Maia 100. At the same time,
>>>>>> application-level developers suffer from poor programmability --
>>>>>> they must consider parallel address spaces and be careful about the
>>>>>> limited device DRAM capacity. This can be alleviated if a
>>>>>> malloc()-ed virtual address can be shared by the accelerator, or the
>>>>>> abundant host DRAM can further transparently backup the device local
>>> memory.
>>>>>> These external MM systems share similar mechanisms except for the
>>>>>> hardware-dependent part, so reinventing them is effectively
>>>>>> introducing redundant code (14K~70K for each case). Such
>>>>>> developing/maintaining is not cheap. Furthermore, to share a
>>>>>> malloc()-ed virtual address, device drivers need to deeply interact
>>>>>> with Linux MM via low-level MM APIs, e.g. MMU notifiers/HMM. This
>>>>>> raises the bar for driver development, since developers must
>>>>>> understand how Linux MM works. Further, it creates code maintenance
>>>>>> problems -- any changes to Linux MM potentially require coordinated
>>> changes to accelerator drivers using low-level MM APIs.
>>>>>> Putting a cache-coherent bus between host and device will not make
>>>>>> these external MM subsystems disappear. For example, a
>>>>>> throughput-oriented accelerator will not tolerate executing heavy
>>>>>> memory access workload with a host MMU/IOMMU via a remote bus.
>>>>>> Therefore, devices will still have their own MMU and pick a simpler
>>>>>> page table format for lower address translation overhead, requiring =
external
>>> MM subsystems.
>>>>>> --------------------
>>>>>>
>>>>>> What GMEM (Generalized Memory Management [1]) does:
>>>>>>
>>>>>> GMEM extends Linux MM to share its machine-independent MM code. Only
>>>>>> high-level interface is provided for device drivers. This prevents
>>>>>> accelerator drivers from reinventing the wheel, but relies on
>>>>>> drivers to implement their hardware-dependent functions declared by
>>>>>> GMEM. GMEM's
>>>>> key
>>>>>> interface include gm_dev_create(), gm_as_create(), gm_as_attach()
>>>>>> and gm_dev_register_physmem(). Here briefly describe how a device
>>>>>> driver utilizes them:
>>>>>> 1. At boot time, call gm_dev_create() and registers the implementati=
on of
>>>>>>       hardware-dependent functions as declared in struct gm_mmu.
>>>>>>         - If the device has local DRAM, call gm_dev_register_physmem=
() to
>>>>>>           register available physical addresses.
>>>>>> 2. When a device context is initialized (e.g. triggered by ioctl), c=
heck if
>>>>>>       the current CPU process has been attached to a gmem address sp=
ace
>>>>>>       (struct gm_as). If not, call gm_as_create() and point current-=
>mm->gm_as
>>>>>>       to it.
>>>>>> 3. Call gm_as_attach() to attach the device context to a gmem addres=
s space.
>>>>>> 4. Invoke gm_dev_fault() to resolve a page fault or prepare data bef=
ore
>>>>>>       device computation happens.
>>>>>>
>>>>>> GMEM has changed the following assumptions in Linux MM:
>>>>>>      1. An mm_struct not only handle a single CPU context, but may a=
lso handle
>>>>>>         external memory contexts encapsulated as gm_context listed i=
n
>>>>>>         mm->gm_as. An external memory context can include a few or a=
ll of the
>>>>>>         following parts: an external MMU (that requires TLB invalida=
tion), an
>>>>>>         external page table (that requires PTE manipulation) and ext=
ernal DRAM
>>>>>>         (that requires physical memory management).
>>>>>>      2. Faulting a MAP_PRIVATE VMA with no CPU PTE found does not
>>> necessarily
>>>>>>         mean that a zero-filled physical page should be mapped. The =
virtual
>>>>>>         page may have been mapped to an external memory device.
>>>>>>      3. Unmapping a page may include sending device TLB invalidation=
 (even if
>>>>>>         its MMU shares CPU page table) and manipulating device PTEs.
>>>>>>
>>>>>> --------------------
>>>>>>
>>>>>> Semantics of new syscalls:
>>>>>>
>>>>>> 1. mmap(..., MAP_PRIVATE | MAP_PEER_SHARED)
>>>>>>        Allocate virtual address that is shared between the CPU and a=
ll
>>>>>>        attached devices. Data is guaranteed to be coherent whenever =
the
>>>>>>        address is accessed by either CPU or any attached device. If =
the device
>>>>>>        does not support page fault, then device driver is responsibl=
e for
>>>>>>        faulting memory before data gets accessed. By default, the CP=
U DRAM is
>>>>>>        can be used as a swap backup for the device local memory.
>>>>>> 2. hmadvise(NUMA_id, va_start, size, memory_hint)
>>>>>>        Issuing memory hint for a given VMA. This extends traditional=
 madvise()
>>>>>>        syscall with an extra argument so that programmers have bette=
r control
>>>>>>        with heterogeneous devices registered as NUMA nodes. One
>>>>>> useful
>>>>> memory
>>>>>>        hint could be MADV_PREFETCH, which guarantees that the physic=
al data
>>> of
>>>>>>        the given VMA [VA, VA+size) is migrated to NUMA node #id. Ano=
ther
>>>>>>        useful memory hint is MADV_DONTNEED. This is helpful to incre=
ase
>>> device
>>>>>>        memory utilization. It is worth considering extending the exi=
sting
>>>>>>        madvise() syscall with one additional argument.
>>>>>>
>>>>>> --------------------
>>>>>>
>>>>>> Implementation details
>>>>>>
>>>>>> 1. New VMA flag: MAP_PEER_SHARED
>>>>>>
>>>>>> This new flag helps isolate GMEM feature, so that common processes
>>>>>> with no device attached does not need to maintain any logical page
>>>>>> table. It can be deleted if the extra overhead from GMEM is acceptab=
le.
>>>>>>
>>>>>> 2. MMU functions
>>>>>> The device driver must implement the MMU functions declared in
>>>>>> struct gm_mmu.
>>>>>>
>>>>>> VA functions: peer_va_alloc_fixed(), peer_va_free()
>>>>>>
>>>>>> They are used to negotiate a common available VMA between a host
>>>>>> process and a device process at the mmap() time. This is because
>>>>>> some accelerators like Intel Xeon Phi or Huawei's Ascend NPU have
>>>>>> their acceleration tasks executed within a device CPU process
>>>>>> context. Some accelerators may also choose a different format of
>>>>>> virtual address space.
>>>>>>
>>>>>> PA functions: alloc_page(), free_page(), prepare_page()
>>>>>>
>>>>>> Alloc_page() and free_page() are used to allocate and free device
>>>>>> physical pages. Prepare_page() is used to zero-fill or DMA the data
>>>>>> of a physical page. These functions were removed from the submitted
>>>>>> patch, since GMEM does not need to invoke them when testing Huawei's
>>>>>> NPU accelerator. The
>>>>> NPU
>>>>>> accelerator has an OS running in the device that manages the device
>>>>>> physical memory. However, even for such a device it is better for
>>>>>> the host to directly manage device physical memory, which saves
>>>>>> device HBM and avoids synchronizing management status between the ho=
st
>>> and device.
>>>>>> Page-table functions:
>>>>>> pmap_create()/destroy()/enter()/release()/protect()
>>>>>>
>>>>>> They are used to create and destroy device page tables, install and
>>>>>> uninstall page table entries and to change the protection of page
>>>>>> table entries.
>>>>>>
>>>>>> TLB-invalidation functions: tlb_invl(), tlb_invl_coalesced()
>>>>>>
>>>>>> They are used to invalidate the TLB entries of a given range of VA
>>>>>> or invalidate a given list of VMAs.
>>>>>>
>>>>>> Wrapper functions: peer_map() and peer_unmap()
>>>>>>
>>>>>> These two functions are used to create or destroy a device mapping
>>>>>> which could include allocating physical memory and copying data.
>>>>>> They effectively wraps the PA functions, Page-table functions and
>>>>>> TLB-invalidation functions. Implementing these steps together allows
>>>>>> devices to optimize the communication cost between host and device.
>>>>>> However, it requires the device driver to correctly order these step=
s.
>>>>>>
>>>>>> 3. Tracking logical mappings:
>>>>>>
>>>>>> Each process starts maintaining an xarray in
>>>>>> mm->vm_obj->logical_page_table at the first time a host process
>>>>>> calls mmap(MAP_PRIVATE |
>>>>> MAP_PEER_SHARED).
>>>>>> When a virtual page gets touched, its mapping status is created and
>>>>>> stored in struct gm_mapping. The logical page table is utilized to
>>>>>> query the struct gm_mapping given a virtual address. GMEM extends
>>>>>> Linux MM to
>>>>> update
>>>>>> and lookup these logical mappings. For example, in the patch set we
>>>>>> modify the page fault path of to additionally check the logical
>>>>>> mapping of MAP_PEER_SHARED VMAs and identify if a device page should
>>> be migrated.
>>>>>> Similarly, if the device driver wants to resolve a device page fault
>>>>>> or prefetch data, the driver should call gm_dev_fault(). This
>>>>>> function examines the mapping status and determines whether the
>>>>>> device driver should migrate a CPU page to device or install a zero-=
filled
>>> device page.
>>>>>> The logical mapping abstraction enhances the extensibility of Linux
>>>>>> core MM (a virtual page may be mapped to a device physical page
>>>>>> without any CPU PTE installed). The current implementation is not
>>>>>> complete, since it only focused on anonymous VMAs with
>>>>>> MAP_PEER_SHARED flag. The future plan of logical page table is to
>>>>>> provide a generic abstraction layer that support common anonymous
>>>>>> memory (I am looking at you, transparent huge pages)
>>>>> and
>>>>>> file-backed memory.
>>>>>>
>>>>>> --------------------
>>>>>>
>>>>>> Use cases
>>>>>>
>>>>>> GMEM has been tested over Huawei's NPU (neural process unit) device
>>> driver.
>>>>>> The original NPU device driver has approximately 30,000 lines of
>>>>>> code for memory management. On the contrary, the GMEM-based one has
>>>>>> less than 30 lines of code calling GMEM API, with approximately
>>>>>> 3,700 lines of code implementing the MMU functions. This effectively
>>>>>> saves over 26,200 lines of MM code for one driver. Therefore,
>>>>>> developers from accelerator vendors, including Nvidia, AMD, Intel
>>>>>> and other companies are welcome to discuss if GMEM could be helpful.
>>>>>>
>>>>>> Using GMEM-based driver, it is possible to write a C-style
>>>>>> accelerator code with malloc(), whose underlying mmap() syscall
>>>>>> should include MAP_PEER_SHARED according to current GMEM
>>>>>> implementation. Importantly,
>>>>> GMEM
>>>>>> guarantees a coherent view of memory between the host and all
>>>>>> attached devices. This means that any data written by the CPU or any
>>>>>> attached accelerator can be seen by the next memory load instruction
>>>>>> issued by any attached accelerator or the CPU. Furthermore, the NPU
>>>>>> device was able to oversubscribe memory by swapping memory to host
>>>>>> DDR. Note that this
>>>>> memory
>>>>>> oversubscription mechanism can be universal if the physical memory
>>>>>> management is provided by GMEM. Other potential use cases of GMEM
>>>>>> could include the IOMMU driver, KVM and RDMA drivers, as long as the
>>>>>> device needs to manage external memory resources like VMAs, MMUs or
>>> local DRAMs.
>>>>>> --------------------
>>>>>>
>>>>>> Discussion
>>>>>>
>>>>>> Physical memory management
>>>>>> Most accelerators require the host OS to manage device DRAM. Even
>>>>>> accelerators capable of running an OS inside the driver can benefit
>>>>>> from it, since it helps avoid synchronizing management status
>>>>>> between the host and device. In Linux OSS EU summit 2023, Hannes
>>>>>> Reinecke from SUSE Labs suggested that people are concerned with the
>>>>>> memory consumption of struct page (which considers all generic
>>>>>> scenarios for the kernel). This leads to a possible solution that,
>>>>>> instead of reusing Linux struct page and ZONE_DEVICE mechanism, GMEM
>>>>>> can implement an isolated buddy allocator
>>>>> for
>>>>>> the device to instantiate and register. The isolation is useful
>>>>>> because device DRAM physical address space is independent.
>>>>>> Furthermore, the isolated buddy allocator can utilize a customized
>>>>>> struct page that consumes less memory. It is worth discussing if
>>>>>> accelerator vendors desire this solution.
>>>>>>
>>>>>> MMU functions
>>>>>> The MMU functions peer_map() and peer_unmap() overlap other
>>>>>> functions, leaving a question if the MMU functions should be
>>>>>> decoupled as more basic operations. Decoupling them could
>>>>>> potentially prevent device drivers coalescing these basic steps
>>>>>> within a single host-device communication operation, while coupling
>>>>>> them makes it more difficult for device drivers to utilize GMEM inte=
rface.
>>>>>>
>>>>>> The idea of GMEM was originated from Weixi's PhD study with Prof.
>>>>>> Scott Rixner and Prof. Alan L. Cox at Rice University.
>>>>>>
>>>>>> [1]https://arxiv.org/abs/2310.12554.
>>>>>>
>>>>>> Weixi Zhu (6):
>>>>>>      mm/gmem: add heterogeneous NUMA node
>>>>>>      mm/gmem: add arch-independent abstraction to track address mapp=
ing
>>>>>>        status
>>>>>>      mm/gmem: add GMEM (Generalized Memory Management) interface for
>>>>>>        external accelerators
>>>>>>      mm/gmem: add new syscall hmadvise() to issue memory hints for
>>>>>>        heterogeneous NUMA nodes
>>>>>>      mm/gmem: resolve VMA conflicts for attached peer devices
>>>>>>      mm/gmem: extending Linux core MM to support unified virtual add=
ress
>>>>>>        space
>>>>>>
>>>>>>     arch/arm64/include/asm/unistd.h         |   2 +-
>>>>>>     arch/arm64/include/asm/unistd32.h       |   2 +
>>>>>>     drivers/base/node.c                     |   6 +
>>>>>>     fs/proc/task_mmu.c                      |   3 +
>>>>>>     include/linux/gmem.h                    | 368 ++++++++++++
>>>>>>     include/linux/mm.h                      |   8 +
>>>>>>     include/linux/mm_types.h                |   5 +
>>>>>>     include/linux/nodemask.h                |  10 +
>>>>>>     include/uapi/asm-generic/mman-common.h  |   4 +
>>>>>>     include/uapi/asm-generic/unistd.h       |   5 +-
>>>>>>     init/main.c                             |   2 +
>>>>>>     kernel/fork.c                           |   5 +
>>>>>>     kernel/sys_ni.c                         |   2 +
>>>>>>     mm/Kconfig                              |  14 +
>>>>>>     mm/Makefile                             |   1 +
>>>>>>     mm/gmem.c                               | 746 ++++++++++++++++++=
++++++
>>>>>>     mm/huge_memory.c                        |  85 ++-
>>>>>>     mm/memory.c                             |  42 +-
>>>>>>     mm/mempolicy.c                          |   4 +
>>>>>>     mm/mmap.c                               |  40 +-
>>>>>>     mm/oom_kill.c                           |   2 +
>>>>>>     mm/page_alloc.c                         |   3 +
>>>>>>     mm/vm_object.c                          | 309 ++++++++++
>>>>>>     tools/include/uapi/asm-generic/unistd.h |   5 +-
>>>>>>     24 files changed, 1654 insertions(+), 19 deletions(-)
>>>>>>     create mode 100644 include/linux/gmem.h
>>>>>>     create mode 100644 mm/gmem.c
>>>>>>     create mode 100644 mm/vm_object.c
>>>>>>


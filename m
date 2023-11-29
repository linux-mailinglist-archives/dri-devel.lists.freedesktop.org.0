Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B065E7FDB15
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 16:22:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C63710E60D;
	Wed, 29 Nov 2023 15:22:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20604.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::604])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F46310E0EB;
 Wed, 29 Nov 2023 15:22:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JsYuxzT8y+jQvNv72drPgmgZDF2HHpsyZiBKpNPpoNd0ackZGZfSMGD2HOwcfVHLTjyyWU6b1vYoWaRXHZKqCHfIvY2H873Kysz++t9Wmve26JH1TA8lexiAirut8xJOYo1WLLRFdiEWzx5hWLT1TFVMs3eGee8TBrswssslAfBxdvtWu0UL5BHpAAFLv/CmrLOYTj5EFr3YIhY4MXz+TQquv+rPCGfcj3/4ytEGBEEAfAz440RrbqsMGF5i7U1c6hynCEqc6FgqG2HkMf/OF70oN9+At+MTRtD5E6P/SDq7TyBwU39/V4lTh9XHJAMPO0hkSbP1OQFpCYrGSHg2Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u9hI5wzlt8RtMxbOUEDOOJ/Zv47K1k2imlQrCGPnJnU=;
 b=Mb7jz178O0zNaQVKIHUT0XsaGukjJQJSlgZ3v6/AaVuNT56VGta1zmIyhbiZW4rAFbPOL1+JAJZV+MGdTsT9SxTgr0Vmw1MJqXalbxnuAiyZN7mmYr8cBBbOfu/sdtalcjHd/Qzx2Aj6iRAqmWTur244WM9Y5gvW+DNKZ994fuOKdhPdFm6Xsw4FxiuJnA2nf9F9IiLnWPCJuU8tziyVs0ABkvLWd+chWar4JEzAv0hFOzWTLcoL350hwOT55p2JcTQxrGYCPWeo3aYsbQr4KYpeJvVyQ6VWU9VQHAwxVott0D6Cc31p229eEzkd0oOm7SZJkMYyuCg290tEPLauNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u9hI5wzlt8RtMxbOUEDOOJ/Zv47K1k2imlQrCGPnJnU=;
 b=Jz6GZzXMtfv3ovg37bb6AXJAKuosy9fZkj0Xv43FE2LJIVMt2jyBP3aD0HxCzHrb4UpXxxbzJU69tYEZ0bT9TlZVPezfVZe8sEasDnGLAD7Db63S06+vHivqE0ZFygKtRwsr6w1bW75mgDOpXpzch+s9sMUH/e4pLtnV9JqKfBY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DS7PR12MB6216.namprd12.prod.outlook.com (2603:10b6:8:94::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7046.22; Wed, 29 Nov 2023 15:22:32 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3%7]) with mapi id 15.20.7046.023; Wed, 29 Nov 2023
 15:22:32 +0000
Message-ID: <8b3673c7-d0b9-4509-938f-eb8d4f158367@amd.com>
Date: Wed, 29 Nov 2023 16:22:23 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/6] Supporting GMEM (generalized memory management)
 for external memory devices
Content-Language: en-US
To: zhuweixi <weixi.zhu@huawei.com>, Dave Airlie <airlied@gmail.com>
References: <20231128125025.4449-1-weixi.zhu@huawei.com>
 <9308a79d-e312-4e6d-98fe-75dc6d0fbeda@amd.com>
 <CAPM=9tx-d-Au_bjX0vYxv6OwqiSjmbbMC7ebWpTsQgFNddWDuw@mail.gmail.com>
 <a07fd33c6f9e44418c528de06f89707e@huawei.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <a07fd33c6f9e44418c528de06f89707e@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0092.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cb::13) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DS7PR12MB6216:EE_
X-MS-Office365-Filtering-Correlation-Id: 606c82fd-92c4-48d0-11fc-08dbf0ef01a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ygm7cqlvPDqzOG5oFyWjt5lUF8wxuSTM1QOoc5kha8jdq2BTJEQc23ViAxTtw5EaZkHwOhcutfw0J+atHhOy8+uS7spTelXxVcL6DfQUT6eDVvi25Km0pz+daQlgk8FhP4C2fWCzwXgjBUrHVem9labUbGauevLTa9DaVpzEap4YPTfO1A/gZYivZczHdOakgI5OUiJxvk4+5H/J7imX6UevpQitSdGK5T7/qzpLLr1r44jtR62fFG6H+lPbZ/o9q6MNr4GdzCDA7W0rHO2VE5NecdpmGkvbiH6anYwtCydPRDgtn4jCOsr/SNs7z93hASMZD8hdXCsUpmnmceeszAz9SFhgB+jIHIRa11hEYpyaVkLHsZVtriW7VSwKVJcxyHtvR/tNmGWeKh8gl1SUZ9kHPJ/S5uTJXr/rE3dPy4QRhsccCJmROxhqLqS1zlZTQ1Gi1MIL/S6bkKwBuchO9Jjkpcc5dpOiPcE9NFtUsPtjb0gMaP/iaaK4zYTPA7qrKSfsgMuaeG5kPG1j4v2kSSfWRTfnF6nGSY7tH7umTP8dLtkcy1/oVGs26fB0lWw3LpEFnZ01KhnRqxrkJq4erL0h3DFVo4AQeWXijeeTUqwqPtH1ONOZwl/xwlm1B2uDf8plKcXSFEUwxXSTaxtowCxgdVyK7EzBShnbx3IUsdPgB1U5v+bR9ATFvyIbd0pc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(396003)(346002)(136003)(366004)(230922051799003)(230173577357003)(230273577357003)(186009)(1800799012)(64100799003)(451199024)(5660300002)(30864003)(7416002)(41300700001)(4326008)(8936002)(8676002)(31686004)(2906002)(110136005)(66946007)(316002)(66556008)(66476007)(54906003)(2616005)(45080400002)(6486002)(478600001)(6506007)(6512007)(83380400001)(53546011)(66574015)(26005)(36756003)(6666004)(86362001)(38100700002)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2hUaTNibW9XQ0lSUFJocEpYaUw4b2V1ZDRsRW1QeC9ORjRtRW56ckRST0dF?=
 =?utf-8?B?RjB4Q2tlSUJuVVVFYnB0V3NBUlJLRWR0WmwySWNxT1NDSW9uY01naE1Da0Z1?=
 =?utf-8?B?VUppOE1Zd2FucjdqM2RvTHRTVnd1d1FxM0dFRXpncEF3QkZPa0ZpQ2VWRG42?=
 =?utf-8?B?SC9BUUtYRlY4ZTdHb284aCtlb1ppYjJEVDFuMDhmcE1uR2U1OXMwOG1rZ0Zv?=
 =?utf-8?B?ZGhrcFBaU2JPZWMxZG5uaWhnV3RvN0pVNFA4MFk0ZlVsNkRZMVVzZTdQVVE5?=
 =?utf-8?B?Y2MxUmRaQ05IYW5pNHBjU2dxZkVnSVMzNnlSTlRTd3I3MDVRY0RYdDRvNTZ4?=
 =?utf-8?B?VjlYem5UL3pNT2FWRG85enJkeWRJMGVoWFo1MndjWWF5WEZkemx5dkhUd0FL?=
 =?utf-8?B?ZmcxM2RYeit3MGxTNVBESzRGOG9WeDRzdlBtMTM2TlFhWGQwQStxeXpxNnda?=
 =?utf-8?B?UFBvaXZhOXIxQjJ2d3ZTTkdDOXdtUTRlZzY3R3Rka0lVdkpzajFFTFd4REVp?=
 =?utf-8?B?UEtGbkF5WTN4ME9GVyt3WkJWZWNUR2UrazgwbE9RY2srRk9TdGxVMElkb2tL?=
 =?utf-8?B?c2xFdDlWdnJWVkFxVUZOSDBKVCtQaDd0YzIwN0hBL3dXN04yNll0enZsS3pr?=
 =?utf-8?B?UTF5aWJIQXBKWGhNRk9iU2ZrMWpuQnQ2YVZFMzZYd3NwUmNpd3ZtaTRUVXQ1?=
 =?utf-8?B?azdBWVN6OExiWWoxL1B1MnhXbU9mWFlUQjhScEJyRHNJZGFUd3JScUJ0RmZ3?=
 =?utf-8?B?NEt5L3ZBRW5JYW53cWNOc3g3dm5vcStxU0ZHamFMSkUzVDRvMHBQakZWTDNQ?=
 =?utf-8?B?N3NGbE9nQlA3dmNsbHZwSERKMFYwN1YxUkN3Y0drTzhhNGlxVSszZmR6NGho?=
 =?utf-8?B?RytrbU5VMkMzZ1BJWUhPc3phODkyai90T2V1VmxDbkdOKzAzUDA1VG4wZnZX?=
 =?utf-8?B?OFFBZFl3b2hFZmU4MUd6OHpOMlFORE4ySEZ3YjFiWUc4R2hFSVlBVzVrMmFp?=
 =?utf-8?B?Wm9JdWZFWWVKY3V2Z0RZVHFHMS9UTnBEQ3Y4TUxaTDFaRTgwdURMZ1BvcEs2?=
 =?utf-8?B?bDd5YTB4MmtrcE9sQ05RYzdKN3hUeStWMDFLM3V6YjNwMGZUTklWQlE3eEYy?=
 =?utf-8?B?TDR4NG9jS21YWUt3MEpmSjdyQTZBTDV3dFRnSmFUZk1GZkVKV0xLODQ2RXNH?=
 =?utf-8?B?MEpYb25TcTRVSi9BRDlESlNKOVY0a2gyYXhwODJuTllyTzdldGZ6aFg1ZUxV?=
 =?utf-8?B?VmVzNXZUOENDY29oYWp3TEJTalY2ZjlmWWNjMCtMV0tSKzh0UitNNTNJM0Rn?=
 =?utf-8?B?OXlqSFpTS1lkbXdvb0czL21uUVE0U3NvUnZtMWE5MEJvQjFGcll4NzlqUHAy?=
 =?utf-8?B?MlIwN1pMMjlueDJOa2ZRLy84cDJWM09PMGMreWRUQjdwcFRlT3E2d2wrYnBL?=
 =?utf-8?B?RnJOeTlVWWsyaEZmbCtFZ0VMMmtlVUVsK3VnSnF1WjJCZVhodG81VEdoYndO?=
 =?utf-8?B?a2pteWxWTWpiUjRNRWtTVE81NlR3cGlWT1RDUFZYUWtzNlVSdnlnTW5xMXZU?=
 =?utf-8?B?SFU4UGYyOEVNQ2JkVzdlT3J6L0hudzR5a25Rb0JOMEs2dDEySlVWM3ZpU205?=
 =?utf-8?B?YTl5MTFKeEFRdVY1TW16YzdwdlR0SlR1VHVOZDRaTTdqRjlGSTNETlRlZWJi?=
 =?utf-8?B?T3hrTVdyeFRvb2UzR3VRK3ZXR3kvVUtiTTdvUHhzUnEzZUhwRTdydkowTU82?=
 =?utf-8?B?VWNzb0RSalhneHhKVDVhQk9wZmtBM1JwVGF4T3FxK1JaWFVlMU5BMDJ4Z2ww?=
 =?utf-8?B?aDA2anlqY3hGN0JvcVNCWHUxOFdwMFY0ejY1Wk9xRFp0cGNPS2dSZjVjS2Ja?=
 =?utf-8?B?V3NyTmxWQjJPanpzODhxakxnaUdIaU1UalZqODFoZkNOTDloRWJoT2FScElU?=
 =?utf-8?B?RnNiZ3VFaHpyWGhqbi9NNXhUNVUvSmNueGVNTXhHS0R3cGZmaXFrOWphQ2R6?=
 =?utf-8?B?bGtKakdXemtlTnRWKzBteURWSWtUTGFGcXRiek9zalF3cjlkYktqRFgwTTIw?=
 =?utf-8?B?RDFaSzdEdUZ0dnhNMXlveERJY2pEWWVmZzRITmpBMHpobGVqQnBrT2VXUkcx?=
 =?utf-8?Q?dItA=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 606c82fd-92c4-48d0-11fc-08dbf0ef01a4
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 15:22:31.9968 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SPm/KlALRZWVZXBakz9AMoedk1eOIng8YN9K0b/nkuHGe1q/mHnRx77I18vIGsTi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6216
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
 "apopple@nvidia.com" <apopple@nvidia.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "mgorman@suse.de" <mgorman@suse.de>, "ziy@nvidia.com" <ziy@nvidia.com>,
 "zhi.a.wang@intel.com" <zhi.a.wang@intel.com>,
 "rcampbell@nvidia.com" <rcampbell@nvidia.com>,
 "jgg@nvidia.com" <jgg@nvidia.com>,
 "weixi.zhu@openeuler.sh" <weixi.zhu@openeuler.sh>,
 "jhubbard@nvidia.com" <jhubbard@nvidia.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "mhairgrove@nvidia.com" <mhairgrove@nvidia.com>,
 "jglisse@redhat.com" <jglisse@redhat.com>,
 "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>,
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

Am 29.11.23 um 09:27 schrieb zhuweixi:
> Glad to hear that more sharable code is desirable.
> IMHO, for a common MM subsystem, it is more beneficial for
> GMEM to extend core MM instead of building a separate one.
>
> As stated in the beginning of my RFC letter, MM systems are
> large and similar. Even a sophisticated one like Linux MM
> that has evolved over decades still suffers from an increasing
> number of bugs[1]. So, directly extending core MM to support
> devices not only avoids opening a new box of bugs, but also
> allows the community to concentrate on maintaining one single
> MM system. On the other side, GMEM does no hurt to core MM
> If a CPU process is not attached with device contexts.
>
> @Christian, could you provide more information on what AMD
> proposed with KFD and why it was rejected?

Well, this is going to be a longer explanation.

The combination of KFD and HMM is based on essentially on the same idea 
as this code here. Even the initial KFD implementation was very similar 
in the sense that it added device contexts to mm_struct and tried to 
manage GPU/acceleration MM the same way as CPU MM. On other words it was 
basically identical to your gm_dev_create() and gm_mmu approach.

As mentioned before this initial proposal was rejected, for more 
background see the discussion around "amdkfd: Add amdkfd skeleton 
driver" on the dri-devel mailing list between 2013 and 2014. You need to 
dig up the whole discussion from the mailing list, but summarizing it 
the general feeling was that it would be a mistake to tie device drivers 
to close to CPU memory management (and stable UAPI) without validating 
that this is really the right thing to do.

So instead of the original implementation KFD has gone upstream with a 
much less invasive approach where a device contexts are just on demand 
looked up for each mm_struct. Felix can probably provide some pointers 
to the implementation.

On the initially supported hardware the KFD used the PCIe ATC feature to 
allow routing of memory accesses directly into the associated CPU 
process address space, later on we switched to an MMU notifier/HMM based 
approach to give similar functionality to the userspace stack on top of 
it for devices which doesn't support the ATC path was just recently 
completely removed and we are now only using MMU notifiers/HMM.

HMM tried to add similar functionality like you propose with the mmap() 
flag and hmadvise() call. The hmadvise() extension actually looks so 
familiar to the HMM proposal that I would expect that this is actually 
based on that code.

All this turned out to have some major design issues.

First of all you have a rather large group of use cases where you don't 
want your device to mirror the address space of your process. Just think 
of thinks like QEMU, KVM, XEN, in general virtualization and container 
handling. Linux has the mantra that everything is a file and if it's not 
a file it should be a file and when you tie device memory management 
into CPU memory management you are pretty much violating exactly that.

Second this doesn't integrate well with the filesystem layer in Linux. 
For example we do have struct pages for HMM exposed device memory, but 
for I/O we still migrate this back to system memory because of (for 
example) the page lock requirements around writeback.

Then third it turned out that the requirements to CPU address space 
management and device address space management are just massively 
different. For example huge and giant pages are a must have for modern 
devices, on the CPU side we are barely switching over to folios now to 
add similar functionality.

The argument that a shared memory management leads to less bugs has also 
absolutely not be proven true. Instead we literally spend month if not 
years hunting down bugs which resulted from interaction between CPU and 
devices.
...

There are a couple of more things on this contra side to that approach, 
but I think that would just make this mail unnecessary long.

To sum it up from over a decade of experience working in this area I can 
just say that CPU and device memory management should absolutely *NOT* 
be mixed. We had those ideas multiple times before, but they either 
failed because they didn't integrated well with the core OS or the 
hardware support is just lagging behind the actual requirements.

What can be done and where I completely agree with Dave is that having 
common components which provides device drivers with the necessary 
functionality to manage their device address space is really good idea. 
Danilo is for example working on a GPUVM component to have common 
virtual address space management and I'm at least sometimes working on 
MMU notifier/HMM improvements.

Providing SVM functionality to your userspace stack is still a really 
good idea, but it should be done with MMU notifiers and components which 
are separate to your CPU memory management instead of tying it directly 
to the CPU address space.

Regards,
Christian.

>
> [1] Huang, Jian, Moinuddin K. Qureshi, and Karsten Schwan. "An evolutionary study of linux memory management for fun and profit." 2016 USENIX Annual Technical Conference (USENIX ATC 16). 2016.
>
> Thanks,
> Weixi
>
> -----Original Message-----
> From: Dave Airlie <airlied@gmail.com>
> Sent: Wednesday, November 29, 2023 1:15 PM
> To: Christian König <christian.koenig@amd.com>
> Cc: zhuweixi <weixi.zhu@huawei.com>; linux-mm@kvack.org; linux-kernel@vger.kernel.org; akpm@linux-foundation.org; weixi.zhu@openeuler.sh; mgorman@suse.de; jglisse@redhat.com; rcampbell@nvidia.com; jhubbard@nvidia.com; apopple@nvidia.com; mhairgrove@nvidia.com; ziy@nvidia.com; alexander.deucher@amd.com; Xinhui.Pan@amd.com; amd-gfx@lists.freedesktop.org; Felix.Kuehling@amd.com; ogabbay@kernel.org; dri-devel@lists.freedesktop.org; jgg@nvidia.com; leonro@nvidia.com; zhenyuw@linux.intel.com; zhi.a.wang@intel.com; intel-gvt-dev@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; jani.nikula@linux.intel.com; joonas.lahtinen@linux.intel.com; rodrigo.vivi@intel.com; tvrtko.ursulin@linux.intel.com
> Subject: Re: [RFC PATCH 0/6] Supporting GMEM (generalized memory management) for external memory devices
>
> On Tue, 28 Nov 2023 at 23:07, Christian König <christian.koenig@amd.com> wrote:
>> Am 28.11.23 um 13:50 schrieb Weixi Zhu:
>>> The problem:
>>>
>>> Accelerator driver developers are forced to reinvent external MM subsystems
>>> case by case, because Linux core MM only considers host memory resources.
>>> These reinvented MM subsystems have similar orders of magnitude of LoC as
>>> Linux MM (80K), e.g. Nvidia-UVM has 70K, AMD GPU has 14K and Huawei NPU has
>>> 30K. Meanwhile, more and more vendors are implementing their own
>>> accelerators, e.g. Microsoft's Maia 100. At the same time,
>>> application-level developers suffer from poor programmability -- they must
>>> consider parallel address spaces and be careful about the limited device
>>> DRAM capacity. This can be alleviated if a malloc()-ed virtual address can
>>> be shared by the accelerator, or the abundant host DRAM can further
>>> transparently backup the device local memory.
>>>
>>> These external MM systems share similar mechanisms except for the
>>> hardware-dependent part, so reinventing them is effectively introducing
>>> redundant code (14K~70K for each case). Such developing/maintaining is not
>>> cheap. Furthermore, to share a malloc()-ed virtual address, device drivers
>>> need to deeply interact with Linux MM via low-level MM APIs, e.g. MMU
>>> notifiers/HMM. This raises the bar for driver development, since developers
>>> must understand how Linux MM works. Further, it creates code maintenance
>>> problems -- any changes to Linux MM potentially require coordinated changes
>>> to accelerator drivers using low-level MM APIs.
>>>
>>> Putting a cache-coherent bus between host and device will not make these
>>> external MM subsystems disappear. For example, a throughput-oriented
>>> accelerator will not tolerate executing heavy memory access workload with
>>> a host MMU/IOMMU via a remote bus. Therefore, devices will still have
>>> their own MMU and pick a simpler page table format for lower address
>>> translation overhead, requiring external MM subsystems.
>>>
>>> --------------------
>>>
>>> What GMEM (Generalized Memory Management [1]) does:
>>>
>>> GMEM extends Linux MM to share its machine-independent MM code. Only
>>> high-level interface is provided for device drivers. This prevents
>>> accelerator drivers from reinventing the wheel, but relies on drivers to
>>> implement their hardware-dependent functions declared by GMEM. GMEM's key
>>> interface include gm_dev_create(), gm_as_create(), gm_as_attach() and
>>> gm_dev_register_physmem(). Here briefly describe how a device driver
>>> utilizes them:
>>> 1. At boot time, call gm_dev_create() and registers the implementation of
>>>      hardware-dependent functions as declared in struct gm_mmu.
>>>        - If the device has local DRAM, call gm_dev_register_physmem() to
>>>          register available physical addresses.
>>> 2. When a device context is initialized (e.g. triggered by ioctl), check if
>>>      the current CPU process has been attached to a gmem address space
>>>      (struct gm_as). If not, call gm_as_create() and point current->mm->gm_as
>>>      to it.
>>> 3. Call gm_as_attach() to attach the device context to a gmem address space.
>>> 4. Invoke gm_dev_fault() to resolve a page fault or prepare data before
>>>      device computation happens.
>>>
>>> GMEM has changed the following assumptions in Linux MM:
>>>     1. An mm_struct not only handle a single CPU context, but may also handle
>>>        external memory contexts encapsulated as gm_context listed in
>>>        mm->gm_as. An external memory context can include a few or all of the
>>>        following parts: an external MMU (that requires TLB invalidation), an
>>>        external page table (that requires PTE manipulation) and external DRAM
>>>        (that requires physical memory management).
>> Well that is pretty much exactly what AMD has already proposed with KFD
>> and was rejected for rather good reasons.
>>> MMU functions
>>> The MMU functions peer_map() and peer_unmap() overlap other functions,
>>> leaving a question if the MMU functions should be decoupled as more basic
>>> operations. Decoupling them could potentially prevent device drivers
>>> coalescing these basic steps within a single host-device communication
>>> operation, while coupling them makes it more difficult for device drivers
>>> to utilize GMEM interface.
>> Well to be honest all of this sounds like history to me. We have already
>> seen the same basic approach in KFD, HMM and to some extend in TTM as well.
>>
>> And all of them more or less failed. Why should this here be different?
>
> Any info we have on why this has failed to work in the past would be
> useful to provide. This is one of those cases where we may not have
> documented the bad ideas to stop future developers from thinking they
> are bad.
>
> I do think we would want more common code in this area, but I would
> think we'd have it more on the driver infrastructure side, than in the
> core mm.
>
> Dave.


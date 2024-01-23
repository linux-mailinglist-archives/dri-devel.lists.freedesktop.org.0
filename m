Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DEF3838D1B
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 12:14:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3F6C10E0CA;
	Tue, 23 Jan 2024 11:13:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2075.outbound.protection.outlook.com [40.107.94.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BFB110E0CA;
 Tue, 23 Jan 2024 11:13:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QTGosBJM9h2m1QKIwDy71+cE+ysUkO6o0rwAGYPmyIlV118VBo51ke4ZrS4JbZvrqb55Dr26PQGDKXYycLTeVr2xzSvWqywcRbx8N7z3RGFPJZqmQG+UKxgEOv/6kSBycFDmQ06vtUENgze5eWWS6mIHwX8HR22Qr8fDfdtNzfovTUYEjiuxzhvN5GCKbzPrbklmzPdg/35D3nnoDDpVDNtWPCtdvwvo7bqFvSz+ztoxuFbudy7uZEmK4du7XiyrBFHgwAwAa9tEsdSzNT9DBsBujBO/rp1Tr8nl06xCKapfVkKEWiYCc84lN2mhsyMzBPn97pJVYkx5dskXB0xyEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XphMka/t+7imLGaznHcHwt8rbJ5SkosXTcvC5bGf+d4=;
 b=WEFBsQCfH00HzSFYKIPPe74Xda8gzWCrq4iYqsnY7wW2xCaKJrro4D54kfY3EUGKmt7lpTdz3JfMGz/5TbUiMvXsLc6yzXZ5zeFAmY/tYSp8IpBh78neaL3SS6hGHINB2j7OYrA22lVIeJ7N+L1FN3kKVJ6JRBzkMAgqpNEj22eAY9KE5pfpZ0oG9ujouAfvC9Vq8JXbf5xRn/e4dctoE4IaGr5IDeo/o5oJkC3IM3usFHi+x9jSKd8AZxxT+tBhHQ8r6T+b2lbhYbcFgwZSUVoZJWqaPmN6yB2lmiRsKq0tsTSLZ0A9c7yBEMU2DY6L9h4PoLhiE8Ri6scF4cHOHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XphMka/t+7imLGaznHcHwt8rbJ5SkosXTcvC5bGf+d4=;
 b=NJGs4jCmXQ8FUoPz8IMc0XOJJavCss8EbxR8B9VZlMkqOBCGMTqrNfkNx1rTltj4ivlF0CXsT21ui4CzJXjtmz6ep2aCnXNzu2P+Sfhfkn4hH3UHaQsrZ+4g5vyi3Lr0GwU6SIAQSNZE18GAhTW5myuGC+UJuhmFxtqvLpzboY0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM6PR12MB5022.namprd12.prod.outlook.com (2603:10b6:5:20e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.32; Tue, 23 Jan
 2024 11:13:30 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7202.031; Tue, 23 Jan 2024
 11:13:30 +0000
Message-ID: <2928ce36-06a6-4bee-b115-8dd61cc41dca@amd.com>
Date: Tue, 23 Jan 2024 12:13:12 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: Making drm_gpuvm work across gpu devices
Content-Language: en-US
To: "Zeng, Oak" <oak.zeng@intel.com>, Danilo Krummrich <dakr@redhat.com>,
 Dave Airlie <airlied@redhat.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20240117221223.18540-1-oak.zeng@intel.com>
 <20240117221223.18540-22-oak.zeng@intel.com>
 <ad21ec11-a9cb-4fb2-b9fd-00a4fa11525f@intel.com>
 <PH7PR11MB70049E7E6A2F40BF6282ECC292742@PH7PR11MB7004.namprd11.prod.outlook.com>
 <PH7PR11MB700440CE88BC0A94CFF8499792742@PH7PR11MB7004.namprd11.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <PH7PR11MB700440CE88BC0A94CFF8499792742@PH7PR11MB7004.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0112.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::11) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM6PR12MB5022:EE_
X-MS-Office365-Filtering-Correlation-Id: e2f191ba-331d-4985-4653-08dc1c04549c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Znl+lhe/y2pVjp8Z3xE6ukaehAaQ9XHbX0Z5IEK5PHS2qYGKgMojhS+aXKuk3ncVcihYcfZsNsMsgXeVqWeccnt08A/NH/XzplwrmCUm5uDWdjobpknT6+nRXPuyc11+yb16DGtViClxbMcFqW+KcX/Bbaf124X/6TOUdfvQlvxSyHXGs+QyhDDrlskrAowyZev3s+WlBW7GH7Iq/siy6pGIHE/1coQ5nj9p2i6ki+eg/xC42cDoyhi/g+2v/u4RJA3JwWcnsaQXouUMRvYHA5iexXq5Ba5WfpOrSlhuvqGa0nDIYTY1/9ZlCXFdrB3Cg/OlC8jPPGM5h3mpiSEOjSdwi8fekhk3pTpgo4iyjRA9WxAQR8pR/tUpAmZw9gTD8I8v+0kFL3QilcbeLx66pWo3L02i0UzzeDHTjkNfTa+HElnupQp5rlsul10wrjsQoH7Hcg7wCF0szIocAgLvlbG3uyjjPXQxORaQXdCcPcLwzhptIE6zyf3jYXDV3rq8pXg5dsJwVU8eNwi2LZWb4j4ffLoR7oACW94mUFXmMw00XHI0gmr0dhsJa2LPXVKIGhrRiN7L8yIY4yPyiRtt9FIcrwIfXZfAom03ulyN4xeKTWlAvTt7rW1A6CcS1VmZ1Fo/qu91bp4vJySykwxdxT4FLKahQYX3ZIR3Hnyv+GcFECdOpWHQoJOOKeHRnZTF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(396003)(376002)(366004)(136003)(230922051799003)(230173577357003)(230273577357003)(1800799012)(186009)(451199024)(64100799003)(31686004)(66899024)(7416002)(6512007)(6486002)(5660300002)(66476007)(2906002)(66946007)(54906003)(966005)(110136005)(26005)(8676002)(45080400002)(6666004)(478600001)(316002)(4326008)(8936002)(6506007)(66556008)(2616005)(83380400001)(38100700002)(36756003)(31696002)(86362001)(41300700001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?djg0RFcvZnZ0bG1tNzQwMXlLekJnNnhSWjBpS0RtZ0JMNFBjdEhaRWI0UWVW?=
 =?utf-8?B?eFE2RWlTU2tTVklDNldMS09sYi9WWFd2VjFGUjIyZ2poVUs5MW90bTVaTFRs?=
 =?utf-8?B?VUwvTERQMGcxbW5hV2hXU21Ebm9KVTd3ZzVCRGVEL2xySTJMaFFjSjFkN1Nv?=
 =?utf-8?B?RHd6RDNQR1ZHRVl6eWUxM0Z0bms1Mnp2ZXFSeTdNUHJINkVkL3Q5Z3RmVGE4?=
 =?utf-8?B?dDFFM0JHSDhkSGhIM3BuTDhZS3hoNGYxNUJmRHJLRmdubC9WeHdCQzVPWSt1?=
 =?utf-8?B?UndkY3hQTlRuT0xkNXBiUFRyWjlPdll2MTI5V1Q1b3Fja2ZucGhNWW9mK3pa?=
 =?utf-8?B?TGFudEZXZ1gwOVVQR2lmUTNNdlk5VXB6TVYvY3ZFemtVMk5sQjkvbnJqR0Zk?=
 =?utf-8?B?b1c4SjV3b0JCMlFYYjBGYkh2a2NKaXNEUU5ocndOc2JCTlpDblJTa1NZNFdU?=
 =?utf-8?B?Nk41cDFhWis5M0NDUFJYTTlONDl6RStCaVN3aXdRK1NhUG1sc08wR2g0OE5S?=
 =?utf-8?B?UHg5emhEckxLbW5vb0QycFpBdm5LTjBPd2RFL1J1Qm1vdXlaamx4RUpQM0hI?=
 =?utf-8?B?dERIRytMQXA1b2RpMkRyTitiZmZDVzhXSGY4TWNvRFBlc3IxSlVCclpzalBS?=
 =?utf-8?B?MUxXTG83WFhMTGpHRStYQnc5L1FQdDdLUTBtWjlsQmhwMVlIbFgxM3lrbUxM?=
 =?utf-8?B?WDJBWUtOZ043UWRLSXIwYkYyZUlYaVY4TmZNRytlMTFLQ1UyVWdCdGg3bWRJ?=
 =?utf-8?B?UUs2a2szS0hEbStVMUVaQzlYZ1VtVTRkNGpydHJDQ2krYkFlbGxjMngzUzhP?=
 =?utf-8?B?VHpIV2YybUJLQ0xvdkdGaFQvVzRCWFQ0anRoUzdHL2VZRk0xb0pSYVFmdHlk?=
 =?utf-8?B?NndINHZvTU8zUk1sL3d1ZW9vRUozSFVmQnFLQ2JZS3ROOWhSbFpGbVRRall1?=
 =?utf-8?B?YmdZVUdqLzFzSnhYeXFLWVJKZXQvQzg4Y1lhZzJ4YldLamo5dkVKa1dIb1pr?=
 =?utf-8?B?UU9SZFR3T3BPdWpDL3RXcGdnVmc4a2VQN1Z4emdyU0lUTmg4Vk5MSysraEYz?=
 =?utf-8?B?cWhySHZHd0xKQjU3alZRZHJTeUR2OWFVbVBQRnMyTjkzWklpcjc0aTgxa2hS?=
 =?utf-8?B?dHVKNEg4RUVyZjJZNTkwUzhRc2UwSFNuT282ZW1KVStHUUxScnhzOWw2YlA0?=
 =?utf-8?B?QzN5MHozWENCSjE1WWlzNW9zZkpZRUdrUDZTNmdmT3cxN2E3clBDVTBta3Nn?=
 =?utf-8?B?c01NRFJkT1dwMFFvZlNsOFI5RHFWdC9iZVRQeFpuaFZ0amo3bXBFQlZxUkhk?=
 =?utf-8?B?ZEZMQy93ZklJdzYrdjNMOUNoYUFlUHdIbW5wK0dQVUNjeTlOK2ZEb2M3OWxr?=
 =?utf-8?B?Y0xxWG13TTJOKzdYeDhRTEJQaTN4Y1RNblpkVFJ1QktsMUsxNkNienpTbkR1?=
 =?utf-8?B?Vlkvd0RuVVQ5dE9XdTJFYlo5RXJCR2I3VzNWS3oxQmtJMlZpTEpQUm5ZYVJT?=
 =?utf-8?B?QURmTFFmMW82Zi9PSndqajA1YWVqTnlsOXdocTZpa2RGaWh1b1VFbThYK05x?=
 =?utf-8?B?ZVdmUUJ4R0Y5NFJ1NFRIbUxDZnZUdU00ejh0c1NJakV1WTFvTzAvanhzRWJw?=
 =?utf-8?B?cWpqY1MwNTdxMDlHU0tIZXlzUVNkOU9nODhNZ1RjUjRSbDBVN2Y5ZGZlMGZZ?=
 =?utf-8?B?L2gwSlJkU3N3WXBQU3drRDN4azRhOVM3RXhPbE12bWt5Zi9vMjgrTHYyYWlB?=
 =?utf-8?B?eHdUUXozQUxOZzd2MSsxZUV5TW04SGFMaExwVWp0NUNOamcvNDVKNWpLV2V2?=
 =?utf-8?B?ZVJYdFNjQ1FURWg3MzhFQzVObGhDdXdpc0JjZzlVS2hqRzM4QTZXUXNPVmZ3?=
 =?utf-8?B?b3JMWEYweVFQYkpRdjl6RUxwYnJFYTJDYTcvTU81MGQxSnpFZVlaWFhMVGVI?=
 =?utf-8?B?WDhpWGhyYlgxUHRVOS9pZFQvR1JRVlAzQjRDOGpJeTNOckxiZDFXWG9CTVFB?=
 =?utf-8?B?SVB0c1pLRCtMV3VtL3ViYUY3djE4eFBmRXhWT1FSazFsY1FocVRGNFlPVWRG?=
 =?utf-8?B?YmZ6UlhkNkZZOVEyOGhVZTlVV0txbUt3aXk4eFNZOGthSTNBS2R2QS9PcEx4?=
 =?utf-8?Q?4SGGtgSSSZpWPoW1JB3tOtDtC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2f191ba-331d-4985-4653-08dc1c04549c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 11:13:30.7087 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TEAiVOzE533sfiRhSRcyJmh8xwb/YImiDfc/xhAu7hZukfXXbtpaWSJFFW16VWVn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB5022
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
Cc: "Brost, Matthew" <matthew.brost@intel.com>,
 "Thomas.Hellstrom@linux.intel.com" <Thomas.Hellstrom@linux.intel.com>, "Welty,
 Brian" <brian.welty@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Ghimiray,
 Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Bommu,
 Krishnaiah" <krishnaiah.bommu@intel.com>, "Vishwanathapura,
 Niranjana" <niranjana.vishwanathapura@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Oak,

Am 23.01.24 um 04:21 schrieb Zeng, Oak:
> Hi Danilo and all,
>
> During the work of Intel's SVM code, we came up the idea of making drm_gpuvm to work across multiple gpu devices. See some discussion here: https://lore.kernel.org/dri-devel/PH7PR11MB70049E7E6A2F40BF6282ECC292742@PH7PR11MB7004.namprd11.prod.outlook.com/
>
> The reason we try to do this is, for a SVM (shared virtual memory across cpu program and all gpu program on all gpu devices) process, the address space has to be across all gpu devices. So if we make drm_gpuvm to work across devices, then our SVM code can leverage drm_gpuvm as well.
>
> At a first look, it seems feasible because drm_gpuvm doesn't really use the drm_device *drm pointer a lot. This param is used only for printing/warning. So I think maybe we can delete this drm field from drm_gpuvm.
>
> This way, on a multiple gpu device system, for one process, we can have only one drm_gpuvm instance, instead of multiple drm_gpuvm instances (one for each gpu device).
>
> What do you think?

Well from the GPUVM side I don't think it would make much difference if 
we have the drm device or not.

But the experience we had with the KFD I think I should mention that we 
should absolutely *not* deal with multiple devices at the same time in 
the UAPI or VM objects inside the driver.

The background is that all the APIs inside the Linux kernel are build 
around the idea that they work with only one device at a time. This 
accounts for both low level APIs like the DMA API as well as pretty high 
level things like for example file system address space etc...

So when you have multiple GPUs you either have an inseparable cluster of 
them which case you would also only have one drm_device. Or you have 
separated drm_device which also results in separate drm render nodes and 
separate virtual address spaces and also eventually separate IOMMU 
domains which gives you separate dma_addresses for the same page and so 
separate GPUVM page tables....

It's up to you how to implement it, but I think it's pretty clear that 
you need separate drm_gpuvm objects to manage those.

That you map the same thing in all those virtual address spaces at the 
same address is a completely different optimization problem I think. 
What we could certainly do is to optimize hmm_range_fault by making 
hmm_range a reference counted object and using it for multiple devices 
at the same time if those devices request the same range of an mm_struct.

I think if you start using the same drm_gpuvm for multiple devices you 
will sooner or later start to run into the same mess we have seen with 
KFD, where we moved more and more functionality from the KFD to the DRM 
render node because we found that a lot of the stuff simply doesn't work 
correctly with a single object to maintain the state.

Just one more point to your original discussion on the xe list: I think 
it's perfectly valid for an application to map something at the same 
address you already have something else.

Cheers,
Christian.

>
> Thanks,
> Oak


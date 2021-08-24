Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C12453F678A
	for <lists+dri-devel@lfdr.de>; Tue, 24 Aug 2021 19:36:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D5616E09E;
	Tue, 24 Aug 2021 17:36:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2054.outbound.protection.outlook.com [40.107.243.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B5A16E09C
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Aug 2021 17:36:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C65z136P1B1bguvEokk0B5JWd7Pf7LjymwOGq9zQxqHODeKgCVnlosdaH2Zm5oLmYGHNAHbyK91/Xt7E777GKWUmeLPmv9aslhqms/7WSDAb9IEROlB4yZN5VvgutpaEsLlsw1MJOYZ33Du4qkXcYZbkRq+YhMyMQl8cDg+Ocn8ME9XLxzsryuGslnJk8jQ34z85evqaS2Kfi/bSI40V99qBpujePpEnFmzRd5rCdl8XSXhYeHMrrCjd/oZcHiRv7YIi9m8viY2v2tlRtpQibuJsxF6NIAVIKi/Tol8fyXjVnZSnW7McsJZODRIzlaEhsylilqY8616Jg5JTvsTH6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JqrMqXGW3k7lyXx6xxiJ85q4YgI6iQzpgxpkx54miu4=;
 b=PeIphueFRq6aM9G4R1R9hySpxpBwrl9zrZRskWFH6ixZ4bsy6T9LR1lCmyqGKRY4iAtRCncG8KR5RIY6wS3VpcqrdKIqGIFmoh4P24rx8zkPaylQK4Ob3a6X1lquo9rO5qtIzBl/EcIeBFhYOnsMv0G4Mr1M9fKuA2taAliwgI9zRxFNK7UQbx8da0RBGE/CXzd5gB19qQKtKGvrHzcNulnSZXIP+YpsXcqCoeeti7TpnI25UCNgNB+WOW+wWxo0mTdRFt12VydrYGQzcFfVC2+JCG9cjr2CtFyzMOw3pw7m9rVSSU12DvLsybTqoW53ehO+b9MQDQRp4dwAac5Hvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JqrMqXGW3k7lyXx6xxiJ85q4YgI6iQzpgxpkx54miu4=;
 b=XeEPR+DHNY8zUOPJrKxOTbot7z8cgr8lIP7waifOqP/21sJDlMyxq721cPkCeUtH3gGc7zonT7wpsf44a9WEwkZT2SGulYSuJW+B9CUej5KQWznR3spzhc0Z6E8M1q+DJ9s8vlqxTnVFOYoLomabDml4e7DB9CgQe2bDIRw/Y6s222Uqr1WT9jUA5MbH8fnjHzWvlkNh15/vEC8ZJuQzYAAb+DePXM8xMWj1TMfdgtk1+XUGizjAHQ3L/O3zCkPnjWnT8ODF7eY4ez79F7IUOnfSfbu8v4TNW71yKLqxyY5jA9cIcbnqfE8W+ACYwdXfWBTyxYytga5Z/jY5n47pwQ==
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4130.namprd12.prod.outlook.com (2603:10b6:a03:20b::16)
 by BYAPR12MB2678.namprd12.prod.outlook.com (2603:10b6:a03:71::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Tue, 24 Aug
 2021 17:35:59 +0000
Received: from BY5PR12MB4130.namprd12.prod.outlook.com
 ([fe80::c557:5e37:2390:beb8]) by BY5PR12MB4130.namprd12.prod.outlook.com
 ([fe80::c557:5e37:2390:beb8%7]) with mapi id 15.20.4436.019; Tue, 24 Aug 2021
 17:35:59 +0000
Subject: Re: [RFC] Make use of non-dynamic dmabuf in RDMA
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Gal Pressman <galpress@amazon.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>, Doug Ledford <dledford@redhat.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-rdma <linux-rdma@vger.kernel.org>, Oded Gabbay <ogabbay@habana.ai>,
 Tomer Tayar <ttayar@habana.ai>, Yossi Leybovich <sleybo@amazon.com>,
 Alexander Matushevsky <matua@amazon.com>, Leon Romanovsky
 <leonro@nvidia.com>, Jianxin Xiong <jianxin.xiong@intel.com>
References: <20210819230602.GU543798@ziepe.ca>
 <CAKMK7uGgQWcs4Va6TGN9akHSSkmTs1i0Kx+6WpeiXWhJKpasLA@mail.gmail.com>
 <20210820123316.GV543798@ziepe.ca>
 <0fc94ac0-2bb9-4835-62b8-ea14f85fe512@amazon.com>
 <20210820143248.GX543798@ziepe.ca>
 <da6364b7-9621-a384-23b0-9aa88ae232e5@amazon.com>
 <fa124990-ee0c-7401-019e-08109e338042@amd.com>
 <e2c47256-de89-7eaa-e5c2-5b96efcec834@amazon.com>
 <6b819064-feda-b70b-ea69-eb0a4fca6c0c@amd.com>
 <a9604a39-d08f-6263-4c5b-a2bc9a70583d@nvidia.com>
 <20210824173228.GE543798@ziepe.ca>
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <1d1bd2d0-f467-4808-632b-1cca1174cfd9@nvidia.com>
Date: Tue, 24 Aug 2021 10:35:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210824173228.GE543798@ziepe.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR03CA0010.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::20) To BY5PR12MB4130.namprd12.prod.outlook.com
 (2603:10b6:a03:20b::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.2.54.195] (216.228.112.22) by
 BY5PR03CA0010.namprd03.prod.outlook.com (2603:10b6:a03:1e0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Tue, 24 Aug 2021 17:35:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e3e4ddb9-719b-4edb-c304-08d96725a292
X-MS-TrafficTypeDiagnostic: BYAPR12MB2678:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR12MB2678E79325D07CE7D5F8112BA8C59@BYAPR12MB2678.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: byf9b2XDry4nSzz637gTsG0ynJtigJKad0ldPUIDcRBhLDkxov9jF/Oic1/FGl00o23qCkcfdCt4csQYC/uXu7ygCrLBrVNbrrlNwFjRPXmoC2Wrj4NY4IRqat0rU6pd0VyVUyTTWKCB4DPLA9OYXD4qgSpZWqMnOoQDk39QM6BpG6IUbpYatBNTt1DS8ZxFLwq38yVjzViPx6E888PgnTBfhrb4S2f60ktRDGwrl/2TuhdlDR4QL0rBEH7KEqs473br+T549hSFaTSnsjro4ZsVdCqUuaNv65oZjD7CtBu4ItNbzfQavg33R7qiYJnCZwRiTZ4M/osOcnT/UXx16qrK6ntPyilDhE72+WehsUiV2+mFfVVOEXUz292AF7VGzbH8FYng+8WTbC+H6eE0AFJ5Phv1eNg/9336wCIgZIJe9Pi5uDdQxj+kMzxymhaEGHBNV5PgdTK08qOEoSTCd1k8yeLeNAOOCh1bfNL3dztVqdFbXnOyJxaxI/oOS+3NcedXxBKGqWTthjo7sR5SdTWDNX0T1NnMdRjF7Q/E1WtTzoJfyGr25pTosXf6be+usVBAHEQLcXDO+aOML1/UEs1UdMBYPUT8qNjW6z0MR5e+waogMrodZ+NomugOVBDEd8d+GbS2TfT/oBY4duCtxI+1PONPSwcqsRelXXFHB8DH+tBTFFq1sw1fsH//LdHqBU216BxRbwp1kOnm8GMEc2WXgML+VRbNjjJV1n5HdU4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4130.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(376002)(366004)(136003)(346002)(16576012)(7416002)(6916009)(316002)(478600001)(54906003)(2906002)(4326008)(66476007)(38100700002)(8676002)(5660300002)(53546011)(31696002)(86362001)(31686004)(36756003)(26005)(2616005)(956004)(6486002)(8936002)(66946007)(83380400001)(66556008)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YmwwL0VBU245SXRkU0RWSFB0SWdkRW5GV3pUNXdWenJLNnI4dzRlM0V0WFRD?=
 =?utf-8?B?Y0V1YTVlWGNSTkFnWGlQejBHYUppVnBUelFla0JzYkUxWXRTMWJ2SEcxdk9n?=
 =?utf-8?B?aktYVDIrT0dUczYwdEticGhpQ25obklpeTJ2R0V1bC9LM1NBUUZZcjJrcDds?=
 =?utf-8?B?TVkxbGRQT1pUbmFCVHpIdzhyMkllZ2lqWjNGYzFoUzQrcU1CNHJYZnpNczRi?=
 =?utf-8?B?NHE4NTc0OGdXam9pWGhrTWlTVk0wMWhvOUVCaTY2YXFOdTQ3M3pWTzljM2cw?=
 =?utf-8?B?eE1lK2l6SUdjSmwweVZDeTViYXhxdnJzMjZIVUd4V1BQM25GcEM3RlJiWGNs?=
 =?utf-8?B?NkVSQ1J2VVM4b3RqR01VK2Zqd3NBeHozeThsWHpzZ1BmNDhGaGNzQUJyWFA3?=
 =?utf-8?B?eEFSa2M4MTg0bTkvWlRocHZnYnZHcnl4YTFlWXhIZTJ2bjUwdlB0bzh6SHlX?=
 =?utf-8?B?N2FPS3ZhcjVJa1lOUXh4ei9ZeHMralZHYkZ5bi9PaTJOWml6M1IrMUhmNmsr?=
 =?utf-8?B?cjM1RlFaSEJXQ1pscFJoUVd4b3ZKOUgyNy9KNndsZlFMbitCdFNnV0hvWXht?=
 =?utf-8?B?b25kVzllelVUWnI3aGwwcnRkYWNycS9vMmdNVHJFcSsrVzY0S0JlTCtEcTkr?=
 =?utf-8?B?QlBsZHhZVkNzRVJVZjdzNVErRlFuRUh1NU9relVISUl4S2VoU1dKQTRSOGNY?=
 =?utf-8?B?MUxQWG9mU0EzUFo5UFpOTkN0VnBQUDBUSWg2S3lmbzBnMTFCT1R3WTMxNGY2?=
 =?utf-8?B?bld2TVFxdnlyc3RZRi9uVFNtUmZQZENZdkVlMVpuNklSbDJZYktwUFAvY2NM?=
 =?utf-8?B?ZDlSZ05YQWVhQkx5L0hYcjBtWTNDME1iMWNad0VIUC9tV1AyUEg4MjdsZ3Vr?=
 =?utf-8?B?MjI0eHJRUzhzOFlqbEdCSGVBVWlPVEpUQzlQc0hqd0x0THFnY3N1N3hSakJi?=
 =?utf-8?B?YzJvSDNKQ2tOdmh6WExWY3dIbU56OGNyUXU0RVk5RVRIRjhDbFlKY0JZYjB2?=
 =?utf-8?B?R3BiMkxuK0hGUi9xT0dodE82djJWMHcvZHhlTE9YNzBSWmRDU1lmOE45ZDBw?=
 =?utf-8?B?Njd1VlRXOHdZUUNNZmQ4S0FITHZRaDhpS0owTENSN2ZkMFlObWl2TUNER2t3?=
 =?utf-8?B?eWVNaW9NWVBYNmozUU5vZ3h1TUNvNkZ4Wi9ia3Jxc1JiZ2hnMlBGTXMrYjJl?=
 =?utf-8?B?dGVGdjBxUmZNb3BGb09VL2FUNEpweklMV1pFTVAwLzJ3ZU00TUZKVXZlQmNJ?=
 =?utf-8?B?MzZKcVpNTUJJZWh6YUJzR3B2SmlCU2dFWC9lWFNpL2YzWWZwekQxWHcwYjdY?=
 =?utf-8?B?di8vZ1VTUVpRRDgvbVRlQmc1cGozdHBaVEt0WC91YWVTZmdMcktVUkh4YlFW?=
 =?utf-8?B?NzIxRlh2YWdsalE0cmUrVEhFbFVWVG5BaUhjOU53R1FlQlR4L3BDWXZxT3Nz?=
 =?utf-8?B?UHBNdXdrZTFmVVV4MGY2SFdQS0dZa3NXQlFQdUNOSGFVQ21XTlRlQy8rWXlY?=
 =?utf-8?B?bmJiNjZvZmxuM215SHdvdHRJeWJXbTRDNlQzNlJFaGNhUmJMUW9Gem5XWDJn?=
 =?utf-8?B?NVhmUWM2c0xjT2MreWM1YWgwMEt5MjgxTm1vTUtLbzFtZFlUeURDTlFKNEhi?=
 =?utf-8?B?bDJGU2p0L0N0Nkw2eGppeWM0cjVVZm0xcm9pcmVyMmE5WWNma0ZsbkdlamhI?=
 =?utf-8?B?NXNkVVRkMmNCenNzRVRlQjc1SlFZcEtwVlpJa3ZORTJQeitHeEpyUzF4RktC?=
 =?utf-8?Q?ewHAjzIOLuPH3YBaFbcIc0g9f66MmOqBD+L2PRs?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3e4ddb9-719b-4edb-c304-08d96725a292
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4130.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 17:35:59.0804 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zFwjtVyEbOPxYB2D6GEXYLWQ+4s8B8+m14hMJqCVoLUtwbSyghO0u0IZjAJYqIJywBhvNSO+0U+CvPXwUlTZpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2678
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

On 8/24/21 10:32 AM, Jason Gunthorpe wrote:
...
>>> And yes at least for the amdgpu driver we migrate the memory to host
>>> memory as soon as it is pinned and I would expect that other GPU drivers
>>> do something similar.
>>
>> Well...for many topologies, migrating to host memory will result in a
>> dramatically slower p2p setup. For that reason, some GPU drivers may
>> want to allow pinning of video memory in some situations.
>>
>> Ideally, you've got modern ODP devices and you don't even need to pin.
>> But if not, and you still hope to do high performance p2p between a GPU
>> and a non-ODP Infiniband device, then you would need to leave the pinned
>> memory in vidmem.
>>
>> So I think we don't want to rule out that behavior, right? Or is the
>> thinking more like, "you're lucky that this old non-ODP setup works at
>> all, and we'll make it work by routing through host/cpu memory, but it
>> will be slow"?
> 
> I think it depends on the user, if the user creates memory which is
> permanently located on the GPU then it should be pinnable in this way
> without force migration. But if the memory is inherently migratable
> then it just cannot be pinned in the GPU at all as we can't
> indefinately block migration from happening eg if the CPU touches it
> later or something.
> 

OK. I just want to avoid creating any API-level assumptions that dma_buf_pin()
necessarily implies or requires migrating to host memory.

thanks,
-- 
John Hubbard
NVIDIA

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20BF63F48D3
	for <lists+dri-devel@lfdr.de>; Mon, 23 Aug 2021 12:43:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A04F89BA5;
	Mon, 23 Aug 2021 10:43:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2059.outbound.protection.outlook.com [40.107.92.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DC6589BA5
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Aug 2021 10:43:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cqgFNr/bZX4SiKes6zbGB7/THYKNmNkCNaAMM+r6saZA5QpcXMayvfN910mXldoAx8uNWZBiMuQWDoP9TQHgZm/Ea4Xj5JuMnr2KpxXmjbJQVjhrpuhOFIvxpGTDjmDmNzyEbVvZNjTMsABiDYtsNtNs1A3AxfPUVSJoYN4jLdVoNtSYrfERkmTbXEjbss7NBri0P0pjfN2xYChzlGo/S5RnJi9TQ65Fe3ESr+Ztt0HXhi4BzpbR/tAsBx+5zyPpr49uBbSvHR6jcq6xN38Z8QEmRsm7wD+2eeUdnhO6XXZr8WeqKf4eo1YpoRPv2pVfb1whkhyJRfR9i1UYbQxZZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l9S4l15mVr5rUvsKt+b+6yxc9h8iYJDpmesZTkVI7B8=;
 b=M+newe5oKanAWVhcpD22DHhPsxippLqzGn/hHibPfO0lf4nKxbZGf8xXnG+ovx+b1aXymkNp3ZPJaIOayHrnWYndWaN/WlUwfLfMrQYDupoA0r/CSdVada3QfthphGLsr+Z6d5SPyN6vkPryhcfau/Ue+YSXhO4yjfJS6YKyvBMARaU3eysYFlthNbePGYb8HImocl67pO2zDrBGbQMzHGw0aH7Qc1y/+zma2DPLVGgEwkewj97xJPJBbjCVC9xCDNbBYfr9q5gq0oVqtXWa7TSxaqNmdyy+rV8fsWAmu7w7wdlUWVoNQ4cDsJJFTO/ZpfleUp0F3fTWxz6KQbu22w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l9S4l15mVr5rUvsKt+b+6yxc9h8iYJDpmesZTkVI7B8=;
 b=FzA0J5IOo5DXnTaw4EPhPacIb2NOcd1Fr1m/iXI6t92L4hKoCSPCFilVhsBh2Y0x88gkap0JmcSUJny6witfmmOHMmv1fhfm/HsITyWGBUYch0RjcPKcmHy/6WaWxASnpWfwvMkY3miiAnnpqWEavindFro8DuGdCrbaJxs1r1c=
Authentication-Results: nvidia.com; dkim=none (message not signed)
 header.d=none;nvidia.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4239.namprd12.prod.outlook.com (2603:10b6:208:1d2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Mon, 23 Aug
 2021 10:43:17 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4436.024; Mon, 23 Aug 2021
 10:43:16 +0000
Subject: Re: [RFC] Make use of non-dynamic dmabuf in RDMA
To: Gal Pressman <galpress@amazon.com>, Jason Gunthorpe <jgg@ziepe.ca>
Cc: Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 Doug Ledford <dledford@redhat.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-rdma <linux-rdma@vger.kernel.org>, Oded Gabbay <ogabbay@habana.ai>,
 Tomer Tayar <ttayar@habana.ai>, Yossi Leybovich <sleybo@amazon.com>,
 Alexander Matushevsky <matua@amazon.com>, Leon Romanovsky
 <leonro@nvidia.com>, Jianxin Xiong <jianxin.xiong@intel.com>,
 John Hubbard <jhubbard@nvidia.com>
References: <20210818074352.29950-1-galpress@amazon.com>
 <CAKMK7uGZ_eX+XfYJU6EkKEOVrHz3q6QMxaEbyyD3_1iqj9YSjw@mail.gmail.com>
 <20210819230602.GU543798@ziepe.ca>
 <CAKMK7uGgQWcs4Va6TGN9akHSSkmTs1i0Kx+6WpeiXWhJKpasLA@mail.gmail.com>
 <20210820123316.GV543798@ziepe.ca>
 <0fc94ac0-2bb9-4835-62b8-ea14f85fe512@amazon.com>
 <20210820143248.GX543798@ziepe.ca>
 <da6364b7-9621-a384-23b0-9aa88ae232e5@amazon.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <fa124990-ee0c-7401-019e-08109e338042@amd.com>
Date: Mon, 23 Aug 2021 12:43:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <da6364b7-9621-a384-23b0-9aa88ae232e5@amazon.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR04CA0017.eurprd04.prod.outlook.com
 (2603:10a6:208:122::30) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.178.21] (91.14.161.181) by
 AM0PR04CA0017.eurprd04.prod.outlook.com (2603:10a6:208:122::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Mon, 23 Aug 2021 10:43:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ffbc018c-619b-4572-2441-08d96622d0b3
X-MS-TrafficTypeDiagnostic: MN2PR12MB4239:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4239D4E00E5BF89B42E176CB83C49@MN2PR12MB4239.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YVC+pNkg7VJxv6v4k01z12k9Naq8qgBfG64JEVQFtko4+rdt8eLZ4RHShtmE5bggSNjp2E2dblBvqj3cinrhgAp4tprdwYoUzLgK8ASVHsvJHwmzgJ/rqh+2i/tdt9KhkVEuE59/djcIvcZof6gaoRU8Tqg6gkIgCRbT2gP5PT4pCr9J2yjuEVUTGxXWiRNsiNGpecxludEYbYKAyYXFOi6qelhoDyT3rDj05LyQDpI2GsJj21vVVBosKm88KEixmMhSExz2jEgFx7BQD6IDtaOCppPcTN6f1vzuSS+MBjWNKGvUP9BAe9aT5MJUZTRgK5iROQCLOcVFybTrxhW+Q8ncfYGgGTPvpYr7WFa2Ozv28b+HyMoCuYIMugx9x+jDLdvsVHLmlDpx53ZSXgVWiaK2wqAXm4aEQxlE3e1qyqqkkbWRerJchRTvvF/2owpZ37c7DPWX6xy3wNm+tm/Y5bYMN2iFtS3i9sahGtzU4f65sv3drObi+TCk8cx5ni0dWwA07WHBiIRKI8jwYEp3g1fglK47GWdl1fpQvENSa5BQsExppX6XF5+eCgXJqUkv3BIvGG0xy1Skv94/0/k//qi2AnpOW48EwIRYKP1cIrtYYBrtqrYPg83QB72syjX3uzIuVSIn/HYbMJCzw54Hq/UTvvwkHd0MD7+CKn8ZBitvaM60twjJIm3hRRrvHZSVFebL75E0Dz9BrpVYva++xPdHp668lgV35uYcIrxili4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(366004)(396003)(136003)(346002)(8936002)(478600001)(36756003)(26005)(53546011)(6486002)(110136005)(86362001)(186003)(83380400001)(6666004)(316002)(956004)(16576012)(31686004)(2616005)(2906002)(38100700002)(8676002)(4326008)(66476007)(66946007)(66556008)(7416002)(5660300002)(54906003)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVczUEd3ejZ3a3o3Y1hsNzVxeHBQSk9idzNkcm5FMkd1VHZ6ZkhvMjZ2dllI?=
 =?utf-8?B?VElHUG1Kb1Nxd2ZjQ1FUNjVOQzlpbklDRHlRWXdPSWtHb0dxbjBhZ0U0eldR?=
 =?utf-8?B?NXpuZjI3T2o4WnNSbVFIdXd0VEtrcHpCeTk0NWJnR0gzTWJMaTU2UzVmVTN1?=
 =?utf-8?B?d203WjVZbHdLSDRUUndqUjdqWWlBOW9MaVM4eTJpN3AxR1RxV2xDQWJpanVq?=
 =?utf-8?B?S01NRUhXU0RpVzNuK05DeVI5b2FKQUVXMHhHNFY4WG5ZdFRWNW9zNCt6MVVK?=
 =?utf-8?B?ajNpOEdWK1M0NXFvRkg3elFTbXp1WUR3dFZhRkNoQ3FWRmoxcGMwaERydW5M?=
 =?utf-8?B?YW4rZk5ONnYrbFpSUDFyMjJpOGtXOEYzeDMvWWpHTDgyTThaLzFQTm8rVU5X?=
 =?utf-8?B?cGNDMENrNDdJV2NabzJOOFE3RnZORThWaVUzMEZzYTErSEdZbndDdzFPblVZ?=
 =?utf-8?B?NDNOTnRTT3ZPOGtZNFVHNmhoY1J1NTFQV0doTXBxSG1OSWhHQ1ltRHVBazdl?=
 =?utf-8?B?NWY2RnF0WUJJTnp5TzN6Z3U1MENscWtwTzM2cXd5OHlyRDcrN01UUlNOdmVN?=
 =?utf-8?B?MS9TVjdZcy94TXVpWjhhNVEwZW9GdDVta2hWRzBNcUx4eEs0bEcrWm91eXJ1?=
 =?utf-8?B?UE40dW1ob3dIMEp6MUN4RkpKQ2JkUmUxelo5dWFDd29acGhETUFvYXRINWZZ?=
 =?utf-8?B?bkxYdE1EWUk2TVZQQSsreTdHRnBYVnFQVlUrUVBob2dlM2JEcFU3cVlHTDVt?=
 =?utf-8?B?cnZtSzEwTlZGMkxGblFYME84Nm50NHRWNGtDd0M3Y0JpUnRqVUZiQkVzVEdP?=
 =?utf-8?B?VnJZczFBME91ZXh3S2dsVnZNVSt4RjBOb0NTWjd2MkVCWGR2T0ZRTXlpUXdx?=
 =?utf-8?B?c201MmNyQ1U0MFNlTmV1Q2szZEVvN2JiMDVPbDBnWlhqcHhqalZ3WFRzWElk?=
 =?utf-8?B?RFAzT3NPQ291Z0RuVndCM1ZDZEwyU3BtL28vWUtrUGRQYzNzd2ZMNFh5Qmxr?=
 =?utf-8?B?VnBpaFhFYUVaWTcrenh3UWliTTZ3S1Q1VXBQcS9JRGZHNGpIdmFnZFlRRU1x?=
 =?utf-8?B?M1JFeS93ZzdscFVCN280RTk1SWhSTVRPKzY3NWFOaGR5b2hBK0NlSTJaZlBh?=
 =?utf-8?B?Z09rbU1iQ1JkeVRFd3VLeHRzY282SmpwSGUzb3c5eXRlcmczYnUxWGV4MDBq?=
 =?utf-8?B?UEwyUWMyNzkzMFl0MlBSUmx3SVl2ZkJ0ZDZpVm1Id0VHaklrNFJ5ZnhLcDIv?=
 =?utf-8?B?MVlwREJtU05uMEI4em91VFBRalVpQnJOZHIvcGRVV0lQSU83SWNXUnZGSmxY?=
 =?utf-8?B?dTNQVjhLZkEwN3lDUm10cGdGMFlYSzRSMkk5bnR2SHIvRjdTbVZrcXJQNEdL?=
 =?utf-8?B?c3VzV0JuNW5vK3JqVnFrTUFDajN3NnFKZm1oUTRmVEVKQTQwOFhDaWV6MWVE?=
 =?utf-8?B?ejY4REZaVkpxV1Z2bkU3THFwUzVUZ2l0UVc5d29rZnJqRCt2YUNRZTA3QnJn?=
 =?utf-8?B?RTEwZGN5RUd1dkw3Zm5NUnNFVzVicHl1WmYrNlZMekNRZEtlWE9HYkczT1Uy?=
 =?utf-8?B?T2k5WjQxalVsRDgrcmZyLzF6Vm1HazdSVzQ0dzF0ZDBWZGhpL1hROVQ3SFJz?=
 =?utf-8?B?UHJCNXJxc2d1YzgwZXNnMDIrRk9YKzk4cnFyaE5BQkpNenFxaXg5K3QvWVZJ?=
 =?utf-8?B?a1k4SFhibUZLc2F6R2NjZExhaDVjenJ0Ym1sMUZydnNIcXk5UmVNZmFwM0lO?=
 =?utf-8?Q?GSEaQuvkj7ZG3lrj7bT899stx0g9RX5vsx+rf5y?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffbc018c-619b-4572-2441-08d96622d0b3
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2021 10:43:16.8706 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bk0iPlq5mXEdhxGPktLItuIIgVFg4/5SL0IHHT2yP+7j/TSbIQ+SOf+HT2fSEhC/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4239
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

Am 21.08.21 um 11:16 schrieb Gal Pressman:
> On 20/08/2021 17:32, Jason Gunthorpe wrote:
>> On Fri, Aug 20, 2021 at 03:58:33PM +0300, Gal Pressman wrote:
>>
>>> Though it would've been nicer if we could agree on a solution that could work
>>> for more than 1-2 RDMA devices, using the existing tools the RDMA subsystem has.
>> I don't think it can really be done, revoke is necessary, and isn't a
>> primitive we have today.
>>
>> Revoke is sort of like rereg MR, but with a guaranteed no-change to
>> the lkey/rkey
>>
>> Then there is the locking complexity of linking the mr creation and
>> destruction to the lifecycle of the pages, which is messy and maybe
>> not general. For instance mlx5 would call its revoke_mr, disconnect
>> the dmabuf then destroy the mkey - but this is only safe because mlx5
>> HW can handle concurrent revokes.
> Thanks, that makes sense.
>
>>> That's why I tried to approach this by denying such attachments for non-ODP
>>> importers instead of exposing a "limited" dynamic importer.
>> That is fine if there is no revoke - once revoke exists we must have
>> driver and HW support.
> Agree.
> IIUC, we're talking about three different exporter "types":
> - Dynamic with move_notify (requires ODP)
> - Dynamic with revoke_notify
> - Static
>
> Which changes do we need to make the third one work?

Basically none at all in the framework.

You just need to properly use the dma_buf_pin() function when you start 
using a buffer (e.g. before you create an attachment) and the 
dma_buf_unpin() function after you are done with the DMA-buf.

Regards,
Christian.

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42AFF3B29EF
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 10:07:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34FBB6EA82;
	Thu, 24 Jun 2021 08:07:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2087.outbound.protection.outlook.com [40.107.236.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D71136EA7A;
 Thu, 24 Jun 2021 08:07:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BnOP+jQy9dy7FIgivJJ4n6KpfRXBwEEVF43JnZ4ej48lujMR58M/e2twb7TDMc4tvCBGn/xt2tXAOdyFNkalK5dy/5KiwCAJTg7Q5msX8/d5a7Xqkk6d4iZuW0jGqSYRtesl7G/UjBV1Z+gUbNmUU5cwFPV0Wl7d/if2EhjjsivY09j2SxNkz7cxyu49FZ8qLUhe293VyFo0tAZvi5paUtiYJLWgnwHJFqOObnVNbF9LNEvtBbre63YEwTSyO0oiPVKlt2x+goeorFfzfALCTH9Ql2yYp+251YwhJc3Owvag2HjGJW4nNcGoH+YFJWs2ycM4dIn7tIODFjBr//pQEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OhJqH2abA9qTGVg5SxYOTWaKX6zki15ii/wQjieEd74=;
 b=Dbw4PeGX3NYYktRp3ijCN9ItJ3AANu2ra2VJr2rqgDouE2zsD0J5d/FywPEf6ye2kAvi8VTQ4k1JeKZ0eB9jniPTjrh71oLBf8XLB2CLlvldrv0UhZ4ooeF6ZAZyqedvH8oRo7shde/51H3FZP0PWG/czsx0eSAL86cmEnQ7X45p/WPDmJqhKRoXAJhyPChbLugzVv3ULHOH/VvsTGaKpyUsZJcEInXrn9xtyqDZ+xE/8JZAA50VU5nCi25nJ7AMDbJQjd5ZIG9qHIwwc8mx2UDX3LU5DKNGn6fq7XnLKta2BO13h1bupL6vN4dRqvaLoR6hP9ri4c2BDe1CkWqrLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OhJqH2abA9qTGVg5SxYOTWaKX6zki15ii/wQjieEd74=;
 b=tdbnu6fzJhQg0lqV3nmedkFpGViJMurzvCS41SLzr7aieFt94T2+r7bT+8TOY4iUAWNzocXcUJZTVT4Q+xyNyaqH92JMjCwNQPj9ZhnK15jXL/mJQVXrcWjRF9hsoLf3UFjRGYQ5lEstbV3zq0Lzn5Tfrcv4b3QBI7hux/Mo+20=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4096.namprd12.prod.outlook.com (2603:10b6:208:1dc::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Thu, 24 Jun
 2021 08:07:22 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4264.020; Thu, 24 Jun 2021
 08:07:21 +0000
Subject: Re: [Linaro-mm-sig] [PATCH v3 1/2] habanalabs: define uAPI to export
 FD for DMA-BUF
To: Christoph Hellwig <hch@lst.de>, Oded Gabbay <oded.gabbay@gmail.com>
References: <20210622152343.GO1096940@ziepe.ca>
 <3fabe8b7-7174-bf49-5ffe-26db30968a27@amd.com>
 <20210622154027.GS1096940@ziepe.ca>
 <09df4a03-d99c-3949-05b2-8b49c71a109e@amd.com>
 <20210622160538.GT1096940@ziepe.ca>
 <d600a638-9e55-6249-b574-0986cd5cea1e@gmail.com>
 <20210623182435.GX1096940@ziepe.ca>
 <CAFCwf111O0_YB_tixzEUmaKpGAHMNvMaOes2AfMD4x68Am4Yyg@mail.gmail.com>
 <20210623185045.GY1096940@ziepe.ca>
 <CAFCwf12tW_WawFfAfrC8bgVhTRnDA7DuM+0V8w3JsUZpA2j84w@mail.gmail.com>
 <20210624053421.GA25165@lst.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <9571ac7c-3a58-b013-b849-e26c3727e9b2@amd.com>
Date: Thu, 24 Jun 2021 10:07:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210624053421.GA25165@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:83f4:4f13:66e5:37ec]
X-ClientProxiedBy: PR3P193CA0009.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:50::14) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:83f4:4f13:66e5:37ec]
 (2a02:908:1252:fb60:83f4:4f13:66e5:37ec) by
 PR3P193CA0009.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:50::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.19 via Frontend Transport; Thu, 24 Jun 2021 08:07:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ac9701a0-8410-45de-dfbd-08d936e717a8
X-MS-TrafficTypeDiagnostic: MN2PR12MB4096:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4096DCDC929B99B62ECF511083079@MN2PR12MB4096.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V8j5v4DgvIVtzvUCPRplb5rr7bvyZx7lJswQz0yTLpRQidWbb4c1WUi6eqe3FA/W0vbVDaouocgSA8rHQ1J3gH5ThwXOb4XLn7x3QfAuFnUUHy5fYp1o54xRRYlcvI/FDYD3MbUetPvQZGC1am4iVCzTg+1QK0mwloJQr7c+8lWkCvugW/51nPVPKkDTkwS8TCiivrPW/JfcwfJdrTwYGMpMwFct0u5bZwkZ65LmFrH7754CPwH9WvoKW8AEIlhaL6APKFeCvrH0clb6Fp9bdHrhgENEPs0d3QR0K8yd63N8t6Y6SXQiSMxiAv0gHWsyN/dThBcmkx6Yfrsmctypv2zBgQD+7MTTA1ez58Mg4IP6zpzNBw1uD8mCGpk14avHwyK7yy8JWi5aZX2rj+hKpaa4G9l9ADYLPAiEx0nCx/DzD3FjIviWP6Zkr/YPl3ncDuq1EYmg3j01zHXaJIh6uR/9e826vpONCHW0C3GcB2754aZdC0qL6/5YtmgL0nxeCeSZQhaXkk8xoHrNu04inLfjuma8AgmIWy54rR+rqo8ymyF7hpX+YpM8xe2CblRjwt0xv6ZNvK2J5xmd2CMyvDo2ZTET/BGI1f2ublV697RWX/8JC5ibWBqyw5U9SCyjVHaavWhvnspZg4mySXVmCKbDoNEVyiTyTlNAD+A/1NWqQPUZgtb6A59ysn5tQK7D
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(396003)(376002)(136003)(39860400002)(31696002)(31686004)(8676002)(66476007)(66556008)(36756003)(478600001)(66946007)(16526019)(186003)(5660300002)(8936002)(6666004)(2616005)(86362001)(316002)(38100700002)(54906003)(7416002)(83380400001)(110136005)(2906002)(6486002)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eCtxZGgxU3FGdlVUK0ZmODlxaFhRV1RZWk9hdlBuYmZjcEVobHlUOWhNQkdn?=
 =?utf-8?B?OVF1TjlSdGg5MjU0dXBPQ0RxcjVHa0d5MUR6aFdOM2c1WXNJM3J4NU1uWFEw?=
 =?utf-8?B?TTUxeXEzNktUS0s0WjV4RXA5YWgxaG12S0F2eGJ2N3V2RDYzbStCSzh5MXhO?=
 =?utf-8?B?dHpGMGtvY09rWG00ME9tNlAvdDA4ek9FUk9CV0QvN1ZyMWxIZnM4eFZiMHpT?=
 =?utf-8?B?VkM0M0xXQTE5WS9KMTkwbU1RQXpERVR0eXJsYnZ6L2JMcCt1OGxXdjg0SmVE?=
 =?utf-8?B?Rzk3SHNFNWdvb3Y1OGZjaHQxc2I5ZkpPVml2YVhHdVZBTjFBTEZCV1JVV2hW?=
 =?utf-8?B?ZWNobm1PaWxmVldSVHROZUlKZWliNzJ2K1dYbWJhT2QrOVEwVlQvUnAxR2cw?=
 =?utf-8?B?elA3S1B4aktTQWh6NDVMeVhIZmNWUjcwL0FrVHQxTVdURWhKanNZakJRTkxl?=
 =?utf-8?B?OVRVQWg2amNkSVhWMDkwRlBWZHFWemJoSEJzSFY0bDJDbVM3c05vT3RvRlRY?=
 =?utf-8?B?NzNQNzlNcTFodWwzZGxrSGtFVm1zSGxVWXBENWN0a1FQcUswN2toSlhib0Fq?=
 =?utf-8?B?aDRES09qbzFiYXVXbzdzcnB2QTNXeWo1ai9peU4vY1MzT05abnczR0VKYU9K?=
 =?utf-8?B?bkN6RU1Hbis2YnNqRDdYdHkwbW1ZeWlObnNWa1BhWlRDQmNXbmxBOHpaV3pO?=
 =?utf-8?B?QXhmOUFjSkRIRVZvcHZLM3BReWl2YzdnSHRYZW9iZXpGZStTVDhRVkQwbzlj?=
 =?utf-8?B?RUx1d1hSVERzT2JkRE5tb283WEZ5ekN5ZVlZaTN5WTFaSFBZODZyQThNdFJy?=
 =?utf-8?B?Y3I2NzdwWUdvckRwaC8rNUhIcTczcExLeXNsYTA5emhBQ2trR3NCRE9ZU3lK?=
 =?utf-8?B?NUlMd1o5Qng3SjBnSkg1b2V0eEpxTnBIVERZMWNXYlZmNjMrOXVVczQ0WEpG?=
 =?utf-8?B?YnhOdTY3Z2FtMTNyOU9YZU9pSHlqL3pFMDk3TWplSC9iWGUyKzk3MHNNNXNq?=
 =?utf-8?B?N1ZXMEI5Rm8rK0hJODYwQ2FTOFZrUFpSb2ljcmVvR2k0MVNrYzlHUzhQWkl6?=
 =?utf-8?B?dWNoN3lYRUJKblg0bytjZFJsRjdJNDhOWVY1QjlGMHFnaEV1MUcwNnBQN3Jk?=
 =?utf-8?B?K3BLUWtIMzhkM2RHeFpVdnd1ZXc5V3pDZ2dpeXJRRlA1b09TSGhXdml3QTMx?=
 =?utf-8?B?SWFnWVQxc3dBRkw4LzFsc29BREpFdlo1Z2Z2U1FteldDV0ZhaEdXcXpybXly?=
 =?utf-8?B?NERnWXl0UHdhanY4aEJJRTVEd2dDbU1tRTRyOUNkK1I5aG5iMkwzZUkrN2Ir?=
 =?utf-8?B?TkZNY0Z6OE5hNkdDbjNzT0Y0dmhwS1MxWjYvVnJuOVJlQURueU9xNmQzSlIw?=
 =?utf-8?B?dUVCcFZrRzhud3kwMnVKdGczQjg1dUJkckx4WEM0YTYwY0J3aWlhQTY4N2Vn?=
 =?utf-8?B?TytaSUJ3WUhMK2RjSHYxSVRBQ2tsMGJ3clBtOCtabmxraERpK2dDNW5xUGwy?=
 =?utf-8?B?R0R6UzdSSVcydDZFR1F0UnpQcUNHU3NCc3FQdmFKQk85MXYyN3BHejI0Tkhv?=
 =?utf-8?B?SXNxY3NzZVArSlhMV0ZNTHlQd3FXck0zRnJqdE51RzljNjErR1VqK3J5TzIz?=
 =?utf-8?B?L01VenQvMWl1M0JocEtuY1pLZkJ5cytSZ3I5RXlCL3pIdW1XVXBxL2IvQzhK?=
 =?utf-8?B?a0wvZDlOa01xMGRxanJzOWU5RGVjRlNJVml1Rm55Y1VNeXdscm9SQkgyZ3cz?=
 =?utf-8?B?OXYwWC9VNFJNRHhsWTlSOEtGNm94K2VkNFpnbXVYOC9JcVViMEFaYUZZbkwv?=
 =?utf-8?B?TXplaDZYOXVmb2luWnlkZnZzMUE4UUtVKy80TXczRmcxdGt6L25hcmlhSHlm?=
 =?utf-8?Q?9R6wMLy2Bk073?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac9701a0-8410-45de-dfbd-08d936e717a8
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2021 08:07:21.6861 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j4u0bTUPKCI2BBDMf/ZIZtS0ootv5VMf2m1AV+j9R+fRLv5abb8pQPGj4lis9qmc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4096
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
Cc: linux-rdma <linux-rdma@vger.kernel.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 sleybo@amazon.com, Gal Pressman <galpress@amazon.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Doug Ledford <dledford@redhat.com>,
 Tomer Tayar <ttayar@habana.ai>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Greg KH <gregkh@linuxfoundation.org>, Alex Deucher <alexander.deucher@amd.com>,
 Leon Romanovsky <leonro@nvidia.com>, Oded Gabbay <ogabbay@kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 24.06.21 um 07:34 schrieb Christoph Hellwig:
> On Wed, Jun 23, 2021 at 10:00:29PM +0300, Oded Gabbay wrote:
>> I understand the argument and I agree that for the generic case, the
>> top of the stack can't assume anything.
>> Having said that, in this case the SGL is encapsulated inside a dma-buf object.
> But the scatterlist is defined to have a valid page.  If in dma-bufs you
> can't do that dmabufs are completely broken.  Apparently the gpu folks
> can somehow live with that and deal with the pitfals, but for dma-buf
> users outside of their little fiefdom were they arbitrarily break rules
> it simply is not acceptable.

The key point is that accessing the underlying pages even when DMA-bufs 
are backed by system memory is illegal. Daniel even created a patch 
which mangles the page pointers in sg_tables used by DMA-buf to make 
sure that people don't try to use them.

So the conclusion is that using sg_table in the DMA-buf framework was 
just the wrong data structure and we should have invented a new one.

But then people would have complained that we have a duplicated 
infrastructure (which is essentially true).

My best plan to get out of this mess is that we change the DMA-buf 
interface to use an array of dma_addresses instead of the sg_table 
object and I have already been working on this actively the last few month.

Regards,
Christian.

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 252DD3F5B23
	for <lists+dri-devel@lfdr.de>; Tue, 24 Aug 2021 11:32:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCFB26E061;
	Tue, 24 Aug 2021 09:32:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2077.outbound.protection.outlook.com [40.107.101.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DF916E061
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Aug 2021 09:32:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FFaGpzWNbSvt0KivUzhnD9OL33IpVt1f89M+/PSm0O6NoLKyj5g/mZyCwWAZPLMWqAyDw2C2yCdt5M5YJEkhaelFzs8+upgd61Zk2QZlY54i3sqMdzVGQ6bQ4HqT7liqCRLBIEry2hfUqRP/icuO4oZ9Nv2xHnAChfoEPL32pZ1M3ok1TdD2bFRBhYhTKn+H5YR7ln1mH5UWzMm/4YfDzdqHN41R+qF1UnUkpF0S8NslitdodeiDVEyI3C6ySjeITbwmLyuO9r0lNyg8+4nIDLwul9rOdMlS+/m/wM7ju4ywhym+Uc03kaLjVl6KVCwvNvN9/RL3qxRe1ugM0OzRXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bOeiYRBCzBxyNhuqTb9CBYv+aKewpdS1QI0NTSg0mAE=;
 b=d0eJXmlvpspnrTi/tV0VMH7cwYnt8BANsF7lCRUutVZTSNO7vZFukvFo7UemhGRs2nobfO8aYnIs683nw1VsZK5ELbnMXkwzVTs9luLKvuA5EdDBA1t7CTpNIcCPtGeGbkmwI3hVPVeuE8Be/b1GyA1WAm2/4fbDG6wNTPKJLh5i5i4LYKIf3gPvxO+p+AB+OJ4iRLJ0NfYLCxY947aXsV2JW3wEIF0nw9mJE+/blp/FTzln3pv3QlHROPVnR5cGMnrZm4sc8TArfiuAlr42mZ9QKH+SRxW+xUWsI/FyGQOJykIb9p3lMfigoXMbVED2DWQOBj4jUOA8S22aMW4bVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bOeiYRBCzBxyNhuqTb9CBYv+aKewpdS1QI0NTSg0mAE=;
 b=UhZ2TOZR+orzz9Satg8/sdV5GwLueWlEUJ+KZk8Pm8PtyMo8SppeGbHg/6vA6MHFl0gTMAclEctwtDcPTV85Drs0/kqj+/iGCNBtU4BuQnKKA2t7BURQ/Kpu4XarWtz5gDGsvd1HGmEN4/GS51BH2hqIIL2lMHqBP++BHuU0ABQ=
Authentication-Results: nvidia.com; dkim=none (message not signed)
 header.d=none;nvidia.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4705.namprd12.prod.outlook.com (2603:10b6:208:88::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.21; Tue, 24 Aug
 2021 09:32:17 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4436.024; Tue, 24 Aug 2021
 09:32:17 +0000
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
 <fa124990-ee0c-7401-019e-08109e338042@amd.com>
 <e2c47256-de89-7eaa-e5c2-5b96efcec834@amazon.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <6b819064-feda-b70b-ea69-eb0a4fca6c0c@amd.com>
Date: Tue, 24 Aug 2021 11:32:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <e2c47256-de89-7eaa-e5c2-5b96efcec834@amazon.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM4PR0501CA0064.eurprd05.prod.outlook.com
 (2603:10a6:200:68::32) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.178.21] (91.14.161.181) by
 AM4PR0501CA0064.eurprd05.prod.outlook.com (2603:10a6:200:68::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Tue, 24 Aug 2021 09:32:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ef97a955-ab73-405b-c26e-08d966e2104b
X-MS-TrafficTypeDiagnostic: BL0PR12MB4705:
X-Microsoft-Antispam-PRVS: <BL0PR12MB4705DC1A49021423A51FCBDC83C59@BL0PR12MB4705.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Pnovsyteir3JGeJstel5HlFyx2FUozMOfYXYmWyB/joQYcI/JOfkSoshE0IQY3PNxtB3CVDQjkD3EX59FRtUbNhncvDKFvRqd+6R96eWTg1AFtAdbuVixAaqDZssNI0zs9u0fixehC9b/ytMwRCh+UQ1dUk7ngmg9Imdj0/6gU/PG5dp7gXeZxosjFnqQl+rUC3riGLsIyfDreK7rXz369FNXZgmIvWmTgweJPzcZ1tD0cD3e9h94B2XDnHR9iUL3GBJEtrI3DVhU5Ko9wIy2RsQjhfP46G+tuwGsQzlOb59FgfsLng6yJnCuhYq+SWF5HCsEyPhw3MZmT4oXlSMBeKiqzd3XiRooHpSGUyXjQ9SqfBf0YgnQ0V/BDNm12TVAlj7aaRzRf+SHDMYgDjJ9PNb1ZS/or1SaeQqj5NXonHJcF1/Vj73ZmkIh88gjQ6BE93RaIR4+vBKGetlm1hDvp+s3ZsyhZa7GtDmmTdqB+e5GybMYfX/K6zNkZSjX9w9YInwS8hk9j+Ab4yKkeEwVcNhGLi9LoBmD1cyZ8xndIhOKS2KTX37MAdFdM0eXM0cI8p8ufy0857e/OAvCdgNR7IIbp3y47QTlCLbjkOwaQ6ak3Cd1nNZ5bPpUzOZVso4cPibQ7wrbstn32NVAZrx1DUACnUqGEaJYXRvWTb0cGgO1w6BPlTviaF5lc+wnMcfw3exvBlhfWyNj4Yrg3LQ9zoDn5+1bqoEDKFatPsY5P4MblHhn6NKqWG6NN6RpyT0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(376002)(366004)(39860400002)(136003)(16576012)(31696002)(316002)(66556008)(26005)(6666004)(83380400001)(8676002)(956004)(66946007)(66476007)(186003)(4326008)(31686004)(2616005)(7416002)(66574015)(86362001)(36756003)(8936002)(6486002)(2906002)(5660300002)(53546011)(54906003)(110136005)(38100700002)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3NlTmZtQ3grWHBySSsrUFAwOHZCMysrcVRvSllYLy85WUlWb0xkVCsrNWR0?=
 =?utf-8?B?WVZUKzBjU1dhUEpMVERPM2hLWkVvNzZOeHlmMG5mVS9qbWlKa1VEdDVBOUoy?=
 =?utf-8?B?VlZJWHh4ZkwybHFNZkJJTHR6cVI3bkFWUGZPcy85K1RiSSsyTmdCamxGdWFo?=
 =?utf-8?B?bmNiTnN0REJ6RFg3aXBFbTNJWHFxM3ZqazhqdFJkNWtURkdVY1pVMHBVNjNK?=
 =?utf-8?B?WXFUeEN1UkdTd0FGMVpOVVJZeGdteG5FSXRvaWkrMEkyUHlDdTJtVThvOGVQ?=
 =?utf-8?B?YkpWZVdvaTNWSjZ2OEdOekZLR0FqZEh3Rk1ZTmY3OFJUdjNHTWg3enhiVXQx?=
 =?utf-8?B?M3R1THhBKzR3MTRPUXFwTHFxcVFuM1JqM3dOWURNZzBxTTlwTllVMG5qZCs4?=
 =?utf-8?B?ekt5b1l5WHJOcis2UnY1RHoyUVVlVHZMZC9lMzFoa01ORUUvUXdhU2VwUC85?=
 =?utf-8?B?djZxVVJpQ25NdFRHTXF4QUZGN3lELzZqeVhoTWozdjI4d053UUw4Q0hLNWxP?=
 =?utf-8?B?RFhWSGlkWW9BU1ZBMjU0MzMzaGRHVHM4QXdnVENrYTJqWW9hZnl0NmVUM3py?=
 =?utf-8?B?K1FlL0lkOGdMYW9RVzBmcm9yUWcxcDgxTjQvaktWTG1XTCtFQmdpb1pTcStw?=
 =?utf-8?B?dEdCOVJSYWwrQVlqYUN3bGQxaFRDSFNiOWdjMTB6QjQzNEV2M29vZEQvakJD?=
 =?utf-8?B?R0pFNW1yYVRUaG4xR04vbGlyRjBLazZGR1VGNTBab3JMV3lKT0ZoNEZpM0V0?=
 =?utf-8?B?Z1VoOHRJMzgxUzdOL3A5Z01ZUFE5UDRIanRMaXFyV0NVNGlXWFd1QktQS09R?=
 =?utf-8?B?TUZqU1ZjcWhGYndrZFRaR01lcTc2aGlOWDRGd3I5QWg0Zmw4YjFXSUJoM1M4?=
 =?utf-8?B?K0g2YTR2YlJLYk9ReHFKL0QvWUR2Q0pRcXpBQmZVTjkyaURrdW05b2Rjc2NX?=
 =?utf-8?B?cUgyNmY0T3BCUDN5RXhKR3JEb2RPKy9abHVhY3gxQjJWOFdHVUczR3JQS25T?=
 =?utf-8?B?blRKbnBNQ3RYb1lZMU5yZWtDVUNZSVpYemhwMzF6WkxFY3h1WTlyQXoxOXlC?=
 =?utf-8?B?KzBIbjU2bC9SMHgzRld2QjNpb0VuVVlPdFFrM0hFRVNWVE5sLyt4dVV6MUlJ?=
 =?utf-8?B?Qk01UkJDVUlOV2dqVll3OGtCcmQ4dW5WdVVxS0VpUDF1c2hYeDVsSzMraHpm?=
 =?utf-8?B?aWpuVjM1UTZwT1l6dUtGdGZySEY1c3FzMXhPa29ZZUdMWHlkOWZDYURZL2g2?=
 =?utf-8?B?ODhHZWJmOG8xQi9BSWZuVUhPcS92eStIVzltbkhrOEVXTi80R2MvZ0d6SnRE?=
 =?utf-8?B?OHEwUlcxSmUwUzVGWUJFK2dxWjdXeWk3UFV5ZHcyU2VzMWZXa2l4b3hsTWpV?=
 =?utf-8?B?b1hydmw3WWVpeFlqOGhLZXZ4RWY2bkE3T3lTRjloOEt4aDZaYkY0d3o3bGxu?=
 =?utf-8?B?WmZPWkIvUFlKUnRVUmVoTStta2ZFK2l0TWE4eFpUeVN4K0I2Q1gvcjJXUHVG?=
 =?utf-8?B?bXplWGJteVVONVFuTmFVMjFrTm1JMmhoVFV6Y2ZHcnllZUVCVmIvcWdOakcz?=
 =?utf-8?B?bGRmODZBbkJUeDZnVGdIZkNHcGxRL3J0K3BKUEFlYmpYZGRZVW5NYzJiODNm?=
 =?utf-8?B?NWJoY3BXRkprYUMxVUtLbXRqdjl2Nzc4YytsWXdpU2tDeGRObXNnMzZIS1dr?=
 =?utf-8?B?aER3TWpvWHA1eGx3M3Zta2ZydVQxVUlDWGpGL1JJcnlTd3lzSTJOSHNGNjMx?=
 =?utf-8?Q?RT1O6bkIPDGAJKmglSA4PrswnXE3g6KA5G4AP0s?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef97a955-ab73-405b-c26e-08d966e2104b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 09:32:17.3897 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x2DCVbFID/JtYo4NuOICEc7aqFc0uMyedsy6XpkNdHVFMfgddq0wCAuxYfant4Cx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4705
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

Am 24.08.21 um 11:06 schrieb Gal Pressman:
> On 23/08/2021 13:43, Christian König wrote:
>> Am 21.08.21 um 11:16 schrieb Gal Pressman:
>>> On 20/08/2021 17:32, Jason Gunthorpe wrote:
>>>> On Fri, Aug 20, 2021 at 03:58:33PM +0300, Gal Pressman wrote:
>>>>
>>>>> Though it would've been nicer if we could agree on a solution that could work
>>>>> for more than 1-2 RDMA devices, using the existing tools the RDMA subsystem
>>>>> has.
>>>> I don't think it can really be done, revoke is necessary, and isn't a
>>>> primitive we have today.
>>>>
>>>> Revoke is sort of like rereg MR, but with a guaranteed no-change to
>>>> the lkey/rkey
>>>>
>>>> Then there is the locking complexity of linking the mr creation and
>>>> destruction to the lifecycle of the pages, which is messy and maybe
>>>> not general. For instance mlx5 would call its revoke_mr, disconnect
>>>> the dmabuf then destroy the mkey - but this is only safe because mlx5
>>>> HW can handle concurrent revokes.
>>> Thanks, that makes sense.
>>>
>>>>> That's why I tried to approach this by denying such attachments for non-ODP
>>>>> importers instead of exposing a "limited" dynamic importer.
>>>> That is fine if there is no revoke - once revoke exists we must have
>>>> driver and HW support.
>>> Agree.
>>> IIUC, we're talking about three different exporter "types":
>>> - Dynamic with move_notify (requires ODP)
>>> - Dynamic with revoke_notify
>>> - Static
>>>
>>> Which changes do we need to make the third one work?
>> Basically none at all in the framework.
>>
>> You just need to properly use the dma_buf_pin() function when you start using a
>> buffer (e.g. before you create an attachment) and the dma_buf_unpin() function
>> after you are done with the DMA-buf.
> I replied to your previous mail, but I'll ask again.
> Doesn't the pin operation migrate the memory to host memory?

Sorry missed your previous reply.

And yes at least for the amdgpu driver we migrate the memory to host 
memory as soon as it is pinned and I would expect that other GPU drivers 
do something similar.

This is intentional since we don't want any P2P to video memory with 
pinned objects and want to avoid to run into a situation where one 
device is doing P2P to video memory while another device needs the 
DMA-buf in host memory.

You can still do P2P with pinned object, it's just up to the exporting 
driver if it is allowed or not.

The other option is what Daniel suggested that we have some kind of 
revoke. This is essentially what our KFD is doing as well when doing 
interop with 3D GFX, but from Jasons responses I have a bit of doubt 
that this will actually work on the hardware level for RDMA.

Regards,
Christian.

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A952E5B080D
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 17:09:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8BF210E7A6;
	Wed,  7 Sep 2022 15:09:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2087.outbound.protection.outlook.com [40.107.237.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FDE310E7A6
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Sep 2022 15:08:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LTfjjxeuMuvLV+RDG4x/1PjRODP3tfgOSDQJ+uJYaWDBeYX/3lQVvgG8pOMqpqdCLT8JV7giFCSTpFZ3hHUKibxTW7u4OcDMixd/iYPsO9nKQkyyWOUGyRce+IM8lnt4ui13G2riBmU6VA26f6baJWKEI1T6yzdQyB5SMhiJgf/PZRaOHzl1JYo5OPBWiov+0XEWRl53DauH1i1fM4PuFEUDUZvfM2viJeeHd01OJYOaNoT1KAT9a5ozN1jDrsaHnDLNYVEyggg73a/RiogMesfuJGrl1ezCN5ryBdHqtuFOBQ33AFc+D2MI8WgRMP4A9LT9NvWO9Di1erOcclvH8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+GJ0NrNS7IWfMOgArniTiYOZGgGBWzBOv7k9ZKNKP7Y=;
 b=Yn7aa8bqGBwxnuIpnJR8QtmmHGisNfWPiBSU39/n+NQcegRjl5t0oflRZn7o1s0VFSdIaKFMCQ6i+Qiverad/W2OtK8MX2FVpjjevVpesljlm86bysX3rkZ9sJALv2AC0aaSxQzq61zn4novahjO+68Cbb8Ehn2gVV8/utscaqFrd2yIN+0apSlJHCY44tG9EbCtUWL71Wwz12jgcGs1C1SL1TeUrsTtUw29cuOwsXTzXBlCRH9YubS8n2NU6pESV0hGL5852Dj1UEevHxnPgXGv9JerdVqH/zBRyfgRa7dK7d1qT9fIHiS3fvl1Vn+e/yk7TWs71gZFMOnjc1pAwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+GJ0NrNS7IWfMOgArniTiYOZGgGBWzBOv7k9ZKNKP7Y=;
 b=o+acLCaksTuufk18931PdXED00Jbu/DRYwEOCesp2mjtmPh+bytr7hpXVGKwKpt9cJEH9VHEMa8fgH3Ngf6eAOz1CENjHvGnVtU1XBsTb21OezdR5KeXahtefpEDERSL7llGqqhWNrBW/79Po7POVOClqCC9BUTPfByGqPUtGEY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CH2PR12MB4149.namprd12.prod.outlook.com (2603:10b6:610:7c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Wed, 7 Sep
 2022 15:08:49 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::653f:e59b:3f40:8fed]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::653f:e59b:3f40:8fed%6]) with mapi id 15.20.5612.015; Wed, 7 Sep 2022
 15:08:46 +0000
Message-ID: <58d6e892-82df-7aa7-4798-9e5da7c634ad@amd.com>
Date: Wed, 7 Sep 2022 17:08:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 4/4] vfio/pci: Allow MMIO regions to be exported
 through dma-buf
Content-Language: en-US
To: Christoph Hellwig <hch@infradead.org>
References: <0-v2-472615b3877e+28f7-vfio_dma_buf_jgg@nvidia.com>
 <4-v2-472615b3877e+28f7-vfio_dma_buf_jgg@nvidia.com>
 <YxcYGzPv022G2vLm@infradead.org>
 <b6b5d236-c089-7428-4cc9-a08fe4f6b4a3@amd.com>
 <YxiIkh/yeWQkZ54x@infradead.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <YxiIkh/yeWQkZ54x@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P193CA0128.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:85::33) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CH2PR12MB4149:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e0fed92-ab80-40b5-6879-08da90e2dc7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NajZBkGm6v6sLe+mQl1Z6QgpYQDh/94sNQjDTGN2dW33ll6EmunsAOpKAcJqOUejUg/LSpMiMZYxsifAB8H453vtnPPpAHL2cedsiCdlMsg/mKpPb7HXpzgupKHy24mm7z2oiZfjns1ZoiXJWejowHoLHkBrBywJHXCuX6fkt0Xwo4QxDVGOCYHwSrsGrH7cNLA/v/JxNL6v1qmf2+XEeSmkfU9dusrWZVJLd6e+jzxKMB98yv0UrdAAnsdsQBKUouoKi2o4Rq2uO3OTHJ2DitQiQmU6NFOlfx1dGzy9VMexxmau0G+I9+B2ETfUebKeN7WFc1aOhlNwA/wOvlbzrqqyu/zuP2AhIrPG7IaQ3TppuM5IqsZUgQZVewGlxhdcTT1xzZwyC8dB9H7lNLU6fofe1xKHlHU9uToxX+gYrP8mEdtGJPlpOkPDoefm7ic5Uw95F6LjhPrXaRg6rfwxUPxHE7P9nEclkBhuSlLomMb2x/lr62mUJBl6+IOiZSmWUiWMJvtOevC2PDX600WvWodUjCJ6RaXnAwkKvYgFSi5Ltp8AttQzJBsavLq8ialb2I5ZB4kL2nTsgcWvkvy9GDpAWEe5O6qXchyij4WFTVQVFne1UIdijlthz53VdKqf2S2Wv5Hc671ZIcAADpsRZ8Z9VSU/Z7mv013NdX0Tb0+PCxhyw8yg2Js3jI5Z+zj+7NXIgrIk7p9SK8fH2wnwxi2H/NZNMyoxiFMV+ZRTRrWA2+E8o2s3EawuljXE4gxjMTOOb9JHA+1QZw+u3PdtPfLpJTG/rWz2Fd7oaM34rLI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(396003)(376002)(39860400002)(366004)(136003)(36756003)(31686004)(6916009)(316002)(31696002)(38100700002)(86362001)(2906002)(6512007)(5660300002)(7416002)(83380400001)(66556008)(8936002)(54906003)(8676002)(66946007)(66574015)(6486002)(4326008)(2616005)(41300700001)(186003)(6666004)(6506007)(66476007)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGlPZncyOEJqbklCRkdvQkRWZnFORFdJUWxZV2RvYzFOYlBlQnpDb2FqQTNG?=
 =?utf-8?B?QUVyRWNmRjlsSjQ0U2QxdjNUQTViUnRBRHVJbzZKUDZub0dHaVpkSkhLS3VE?=
 =?utf-8?B?dkdEVjNXZ05ENTNvRHFPWWhXRkdzR1NNaHRkQVNWNzBlQldyT1g5VFY0S21B?=
 =?utf-8?B?SGRod21yN0RQcjRBcXAvM3o2Zm1GSUJFd2NZOUQwM0tlbGhYVFQ3Vld0U1lm?=
 =?utf-8?B?ZWxBRm8vR1BXd1UvaVBWNmZRVGlSa2hxV1pYNWNYMjJ0REp6bnNhS0FHeno1?=
 =?utf-8?B?a1pycjVySXA4Tk5MazFTTXdmSmIzWWdGTjFXa2M3V25oY2hxcGN0OWJRMFpH?=
 =?utf-8?B?STd5N3ZaZEphcDY1VFdXbHFaZ2FtUFh4RnNaVndFcEkvcUp5YWVPdXQyUDFO?=
 =?utf-8?B?SUl5ZDhPV2cwZ0pjNVZmZkxVUkN0Z0d3cEVzdnc5ZzZERGxZUmxOS0lkTjcz?=
 =?utf-8?B?NzJ5dWhYNEpMRndWRzgvZ21uMWpzVWRHTjZ6M09PYmNLZEV2UU9YdnJDN3RR?=
 =?utf-8?B?ekdnakN1d29BVUNpY2pnYW5sdHdRQjFlUGVYWndzdVpVV0pqTGQyU1pmaFYx?=
 =?utf-8?B?cGZZWkRac3Y1dUt4c2hSc2x6dVpneEQ5c1oySWlDTU9ZMWtRM0V3dk9sK1A2?=
 =?utf-8?B?eWNBcmNGYmtySUxEK3FmNTdLZjVhOEZkRkhndVNXQndnOS9uSHVoYU1oVElY?=
 =?utf-8?B?T0JMMTZZdXpvbVhZMndqWDUxV09vcTV4ak03bk81WTFyS1ErRU4rMU5qWjlO?=
 =?utf-8?B?VkZ3NU1ZdEdXcjYzVXpaREtKZlI0Mk1sUWJLQkRLK3lrUnU5dWkwWEFUYXFU?=
 =?utf-8?B?YlE0Z2REbVZXVTdUUnBJUHpxQTdDN3g2UkRDdXJpOHBRNys0YlFrVjg3enRa?=
 =?utf-8?B?NmQxODVCbDBZckZObDhZUXRDcTkyQlplOXNLSTVOdWovaEZvTW5tL1hrd1Mw?=
 =?utf-8?B?bzc3M0E3d0h4U2hoRENMdFJUODZKVElPcFR0RFNDNVBMeWlLZ1RmV1cxRjE4?=
 =?utf-8?B?NlBFZmphRW9xUEI1VlllSUVCb0tHS3FWRlVHenNzSmhVYkxOR0VWK1lhOHZ5?=
 =?utf-8?B?ZVlacWttWlRGdUNQT2E3VzBuUWhxSVdkdC95UWVTL0ZZd0Z4eGVWdkpTNWtV?=
 =?utf-8?B?WjB2M1NvK2dvb2NPMVVvaFE3eE5FZlR2cVdoY0tiRklSYVQ4NEw1L3BZZFJm?=
 =?utf-8?B?dmlIMisvMjk3b1NXRDhMREVBSGtuZGFyMC9EN2RqbkpnZ2dkTGY5b0VCNnRK?=
 =?utf-8?B?em56aHFZUFA0UnZjVitZdUFiL2h0RjFGTEppd0p2azlJb095bWtPYkZnY2ZV?=
 =?utf-8?B?K01OWFhGSHhpZVFhZ0RmNTY5cDJaajE1b2V0d096VkwwcHIwb084UlUwZ3FX?=
 =?utf-8?B?b2pURnFtV3NNdVNKekJRMFlEbU1Za21zTTVOQWticzNRZ2JockZwVnF4b3BW?=
 =?utf-8?B?S2VXeGRNOVlSM29qODFQeDlFeGdOc1Jqa2FBcExVK2pMNmxJSGlDWFN3ekRh?=
 =?utf-8?B?NnJ0OXMvNHp2a0ErWU5RSHRENjhmRnBIUWl2dVB1eUVnbStYU0FWNjYwMEdq?=
 =?utf-8?B?YkJ2cUI4Tk9ydzBWczJGSytOVy9SRmEvRlJJZzlOaVNTSE5xcEgrSGYwdFVE?=
 =?utf-8?B?M2J5S2dWdWZSMTkxUXZvSElvNVVteCtabXFsSUJ6dnlON0RKdlBFUEZDSDhO?=
 =?utf-8?B?NzJnL2s4by93d3VTWnBmL2piT2FXQ0l0bTcvSWZuTVoxNmYzUTFTWGpOR0xq?=
 =?utf-8?B?bzlJdytTWllvZWUzcUxWTEFkQ05YZGVlNWJGWkcrUmlFY3U4U2k1QkJLTlN1?=
 =?utf-8?B?aEowenpMQm5vUVU5UStLSmI1ZWNHcUU0VkErM2tUZEFKN3VnNFFsRGtEdFdQ?=
 =?utf-8?B?VGMzYUg1bHBZUFd0R2lFZFhMekQzTXprYmZmWVhQTkk1NzY4QStHT1p5ZDli?=
 =?utf-8?B?djcxakVZTXJsRkhHQkJwcjhlOWdrZGZXa2dPcDJPekJxdmJLVkF5MXpBeno2?=
 =?utf-8?B?bXBxbWhvUjU2VHZHdko5Mm9keXl5Um9kcHkxUUt0amtRdVY0WG1SSlRtU0xw?=
 =?utf-8?B?TGFRNEdQenk2Z21OL3NkU1QwcHNMQ0JLWkcrRkhYQzNlSlNZQUMrQTNFeXhn?=
 =?utf-8?B?ZzI2c2U0ak9veXAvMHNVOXNmOGVDV1RzcVpkVlVOWlB1L1NTQXNFK1gwVE0z?=
 =?utf-8?Q?AioUMDh+hrjVg9J08oTxpZ7jzfkc9ba1fW8s1fjU6CYI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e0fed92-ab80-40b5-6879-08da90e2dc7c
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 15:08:46.3902 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QV47T9OAiJtw7mQ7JzddFVQeTdQ2eFxwWDwSg2+es0YbMK7V2BC76R7aPRiGO4eZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4149
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
Cc: Leon Romanovsky <leon@kernel.org>, kvm@vger.kernel.org,
 linux-rdma@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Oded Gabbay <ogabbay@kernel.org>, Cornelia Huck <cohuck@redhat.com>,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Alex Williamson <alex.williamson@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 07.09.22 um 14:03 schrieb Christoph Hellwig:
> On Tue, Sep 06, 2022 at 12:38:44PM +0200, Christian König wrote:
>> The problem is once more that this is MMIO space, in other words register
>> BARs which needs to be exported/imported.
> Everything used for P2P is bar space.
>
>> Adding struct pages for it generally sounds like the wrong approach here.
>> You can't even access this with the CPU or would trigger potentially
>> unwanted hardware actions.
> How would an access from the CPU vs anther device make any difference?

The key point is that you can't do any CPU fallback with this as long as 
the CPU wouldn't do exactly the same thing as the original hardware 
device. E.g. not write combine nor do any fully page copies etc...

See what happens here is not really P2P DMA transfer, but rather P2P 
signaling of events.

For a simple example think of a camera and a video codec. The camera is 
pumping video data into system memory the video codec should encode into 
an H264 stream.

So after every frame the camera hardware issues a P2P write into the BAR 
of the video codec to signal that the frame is completed and it can 
start decoding.

This is not even a memory write, but rather just some trigger event. 
That's essentially the background why I think having struct pages and 
sg_tables doesn't make any sense at all for this use case.

>> Would you mind if I start to tackle this problem?
> Yes, I've been waiting forever for someone to tacke how the scatterlist
> is abused in dma-buf..

How about we separate the scatterlist into page and DMA address container?

Regards,
Christian.

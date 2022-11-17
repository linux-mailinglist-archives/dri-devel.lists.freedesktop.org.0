Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8872F62E3AA
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 19:01:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F17FF10E660;
	Thu, 17 Nov 2022 18:01:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2085.outbound.protection.outlook.com [40.107.93.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B45B910E660
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 18:01:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BexqwPq4PMKFW5+4YsJwtqkZ4b4osxKZoE7ZbfZsfX2SL1DQ9J8UGKHd4eR5b2JNT9EKgSM9xq2XKk9SE6fRjHpbmyRpg1vahKzruy3YbKMH8MCkWJCxeeD4HVH3ZyisYVsxevb0ClF9jQwMNJ1UvaPrZO471x29ib9kW1fUsXYhRoBj5o7hdXrndWprycidsPdymbVxtehi9PN+V++oDzWwDdTj58y0786Dqh+CBvZm95PJQXXjm3A2THyiIjNgYMsWlKNjZKEqqb1EACTcuon0vyYGbDXFJCv7wN/3nktVNTnnES4DSEhiBGt5sHb8NX0OJh+FU4tcukiCUO8K9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=McizwaE73KQSm3spEN4c5sg8PKXcEjPOBzqaS4bcPvk=;
 b=kAHWMU6GnD2moJg3XBZRJe2g6ACFkDYmzycZfK3Sj0Kg4Moqu2FodB0R4SWoZqsL1SUSm5TulYfinF4ycgQgcDzVR9t4J4a4Zjr/KPf1SEdBzPP/NlKFICmWS86k9L2ffUd0gS8S4M/avJtHGC153tvDOnriJELn52riWUQ+97z2MVlffnNjIpw8wIzp9XR3gR5biP1cG5RUYUD1OLvJv83+eycpK/WK0VxMSTdKMcM0OJ36fBgsQX2J4YDesAqIASeuneDZW0dcZHSrR26MZYnQOzpe8SR1RVChHWCegY32XjqWdzv8sJ9zrn8PHpHDnBhQ1S14EuFEmwTMZ1kuIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=McizwaE73KQSm3spEN4c5sg8PKXcEjPOBzqaS4bcPvk=;
 b=b7A1NBm0+dxllMA9cSuTLLtuUrsF39Ct1x4hYKmfrkmcF+hdC+ocaesFKnnew08D+LOaIcCQ4d93uVS76faaUeM+WZolLDQoBRnFChjT2lLLS91U9RMbP8Db/Jzb1EiQ/ltCy6RZMY+yVOS3McMBiCQyYQVBuHi/J+vLwQOXGRM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BL1PR12MB5143.namprd12.prod.outlook.com (2603:10b6:208:31b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.19; Thu, 17 Nov
 2022 18:01:09 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421%7]) with mapi id 15.20.5813.017; Thu, 17 Nov 2022
 18:01:09 +0000
Message-ID: <6ecae1e3-16cb-f5fb-05ce-a98fcf145069@amd.com>
Date: Thu, 17 Nov 2022 19:01:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4] udmabuf: add vmap and vunmap methods to udmabuf_ops
Content-Language: en-US
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Lukasz Wiecaszek <lukasz.wiecaszek@googlemail.com>
References: <20221117045842.27161-1-lukasz.wiecaszek@gmail.com>
 <970e798d-ea26-5e1e-ace8-7915a866f7c7@collabora.com>
 <20221117170838.GA74987@thinkpad-p72>
 <cd382f43-1995-12a6-840b-32450e62f9f4@collabora.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <cd382f43-1995-12a6-840b-32450e62f9f4@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0128.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::10) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|BL1PR12MB5143:EE_
X-MS-Office365-Filtering-Correlation-Id: 3252fe27-e091-41be-722e-08dac8c5b4d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9QjUY7wo5+3k2bG0Glk3YiRVWJHp4rWA8nix9KxDDWKQZ4Tf/Gb55n6xa5Lw2U895ixBq+pJLy4dRptUKwHY9Eruz/vyz9i+WYY8bUPcv0rh+tsMUmXE2xVfgt0X/M1+aItbIX8Q7tb3MhkJHUYFoqelzUVHy07z/SqYe/VvFpGExDGnWb7Efwa+aM++dxeroyUsW0t/P3W9ArFR2TqFe8zCX7PcQj3B3VxIBs9plosxVmwJRkvDI0ba7NSEYZsfmq3Ts0onFT/2ttvEUVmoR7qG4It+snteVspm84WDdmZ2MuL2uI/FWqA86EK9xqhZSWmtVfr4sOIP0P1jh3oYWl8/DI81qamwH7CYOn5mG8OILvEYUrVaVwnZRrTxfYg6F+gKelr5olVpX/zXxWyhbtRwFE+lPTgr4NzrFiZ0NyxmTgU1HMT6LD6AB6xlU+90ptyclrHD97pseyKxJzbAPqTFxWdlA7AjBAG05l7B640CVFclt53M5ptonxWiAuQLELs79xVMoFT5YHJ8/xqh9vArvZ6gtYbEZgGvrpuQ30eXyJhgcj0fQxlDv0OyNUFSDejwTOcNpVpXKuS/KF+Sbqkn+xfcNGxECzJGXnRjYstg1OFOlzIrcflxmc1i1uEzXNkVc8HrxiWdw6usWDfgTVSYdqZazk1FMb5i9Q+mA6eDrMYLjt8ZC4vCVABvzE93keFQoTD5vo8sVLCfiGlMf76kex//IFER0lkOcatrTy0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(346002)(376002)(39860400002)(396003)(366004)(451199015)(6506007)(4326008)(38100700002)(6666004)(2616005)(186003)(86362001)(8676002)(66556008)(66476007)(66946007)(53546011)(31696002)(36756003)(6512007)(41300700001)(478600001)(6486002)(316002)(83380400001)(54906003)(110136005)(2906002)(66899015)(5660300002)(31686004)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QVZhNmh0YWVlbTdpankwZS9CUE1jb3BEZFVCSUNHakxYai8rS0ZLLzV6a2Zp?=
 =?utf-8?B?ODdmalFudnl5NlRUVGlDek9YQ0IrOUVLTnI5QWdLY3V4T0RkaTZXanBnUFAw?=
 =?utf-8?B?U2JIeWdNbmhSbks1Q0djdDFCQTdRazgrQUhCbUtNZW04MHRDZzNNYVVUYU83?=
 =?utf-8?B?aTFubGtheTFSNG1SaHlkM0dNcmxCZWJYV04vOG01MFVHU1dUUjYxcmQzQm92?=
 =?utf-8?B?bGpoTmVTVUZCRFVieTNwRWJ1ZTU2aDdRSEE5dWdQd1kxRlAxMVpCditJTWgz?=
 =?utf-8?B?SDVQTEJGcUovVEpZVitpcWRQbXhHdkxKd1JFdjU3ZGNpQXlFcWN0RzZ0eFJk?=
 =?utf-8?B?L1RtNWVkUUdDVXkxT0hrS211Z2grdnFUL3M3R3BEckkwdUNuYWh5bHlaYzRC?=
 =?utf-8?B?YW5pclZ4VUt4dXNQQVRVamZUak05dlRvQXl6TjdvQlU4T3ExU2VUNzdxdzI0?=
 =?utf-8?B?ck94M2ZnUWphd3VzZjV4Sjc3MWtPVThDcjZmYUltUm9xcXRLa1hpbjFoRml4?=
 =?utf-8?B?aUtqQTFuL2tZTUR1cDd6bzRzOCtkcE41ZktzS3pWUTVpSXV0MG9meWExR3Q4?=
 =?utf-8?B?dGNhcnJFTWtXajd6cytDQWhLdzVZVnZLcjdmRXFKYmNiTWhhZjNZTTNKT0ZY?=
 =?utf-8?B?c2pJcUwxREdmT3hMMjlLMWpDSGgyZjFidjFqMi94YlVLQVJuVDBFWHVCTDFq?=
 =?utf-8?B?c0FxK29URE5GeHBBTTQzR0pvSFUzN2FuV2RXNjgrdC80dm9mdU5aODRFdmVY?=
 =?utf-8?B?ME8yUm9jVExZK1l3NHZvYWRYMGg5MVM0RlhVUDlNZ2xwS2lUTjJTSG02cFNV?=
 =?utf-8?B?MndsS1AvOWFRRlRXREhVTWRndGNTTDVGbTlFdDhoRzFXSDBtWU9lTDJucW0v?=
 =?utf-8?B?Yng4OExDSnBKQ0JmU01QNzc2NWUrb3RjbEtCV1RwL01DYW1ocUJtNG5zdVJT?=
 =?utf-8?B?TlRONFpyMzlkZGg2QVRvSDZSTEhMNzlseFFmcW9PZ0JsNTQ3MkFTbjBRTzha?=
 =?utf-8?B?Nk1TdUVRc0ovYTVYYW00OXBHTFRkaGRUdnhpUlYwWTIxYU81eWJiY2Z1Vm9S?=
 =?utf-8?B?Z1BqR3J5cTltOHFHM1JJT2hNVEJXZDRzeldNTHlKUmhaSGlXd253alFVZUVR?=
 =?utf-8?B?QjB5NFNLZHNLZjBZckhycEZNRHBvdnRZVmVqN1d2WXNMNmE1TjA2SmZ1c2lO?=
 =?utf-8?B?MFNvYXBLT2RQWUI4Sm5mRVdGVDZqVEZMRjVvakd1dUVMTFRBNzZJcEFpUFVZ?=
 =?utf-8?B?bVU3NHpyb0NGc09iYVNKNXBtRVF5TXRuclFnWVpuSUFoZTlJS3NJeE54V2FX?=
 =?utf-8?B?c2hVOFVpcGlEdmp6Rnc4YjVVb3g5NGRtNUdkSGdyL2sxbnZETHZZbHZOR1ds?=
 =?utf-8?B?ZFZrQWgwbm9HZzYwL252N3ovekVTc29wZVhnYWMxQXZqK1RiblVFR1M5Z2Fn?=
 =?utf-8?B?aVl6ZkF6a2xLVkRLK3V6U2txQUVzaWxncXZ2WDAzZFhDUzRXNjFGQmVtMDJm?=
 =?utf-8?B?RFpPVWhScUtYbjZjSUY5QlhLN2Y2RWtLZjN5UE45Mkh2bnZOeGMwSkM5ZEow?=
 =?utf-8?B?UXFoQytra2Q4aGlNTkNXUzNVYWtVY2hvM1BzSFVDZ0dRdFRRRHZQQzZaa0lP?=
 =?utf-8?B?TFhrYndKVXIrTDRrUmtoM0Q2UnZNaVgwSTFXanlpeW52UG1oemNWUExZVHRN?=
 =?utf-8?B?UVlNd0IzQnd3YzA4VGZiRnhwYjNMQ1kvMi80dUxIY040aExjdW8zckh1NGdE?=
 =?utf-8?B?VEZqRzkxVnRjQ1J3RDYyS2h1T2RmeDJXYmRsLzBrUnVKQ04rZGcyZkk4NkYx?=
 =?utf-8?B?WDJvU2p3MlphdjdhemhaNXVmSEZ1S1BRc3JkOXNoTlRLcWtJTnBBbTBuU0tp?=
 =?utf-8?B?aVhZSWZjaUo2QjlCV0ZkZ3lyVXJDZkpvcFczMHFrWG5GR1pvRlh2eWNkVWlO?=
 =?utf-8?B?aEdiSXgyMHUycWVXNlFpdVpmbmZpNFRNUWdmZ2FIMU9NRXZXejZEYVk5b3pz?=
 =?utf-8?B?K0UrMVVYMHNSNWFta3BqZndkNTQzMm5TVUVCWXp3UDl2aHFQUmhIdE5xUS82?=
 =?utf-8?B?OGhiTWZYRm1PSzRDTUtuMGlLeWxZaXFyRFFnb3RqSjZNOGNyUXBvRCtoQ2Nw?=
 =?utf-8?B?SXZwV0NkWWpxZzJ2M1ZydTNJdTZKeFZWR3pPVFFsTE9iY1B0ZUp6VmJkdDYz?=
 =?utf-8?Q?efxxy50UpqJ7087u4IatPLocFU+ZC6JNm2oo2GpYwfIG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3252fe27-e091-41be-722e-08dac8c5b4d1
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2022 18:01:09.6427 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pRrGHYmEiVIvNnlQH/JsLkETFpNcQ+8NtebAX7Sy0h/ZzIAecd4DylctHb1W71+x
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5143
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Gerd Hoffmann <kraxel@redhat.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 17.11.22 um 18:32 schrieb Dmitry Osipenko:
> On 11/17/22 20:08, Lukasz Wiecaszek wrote:
>> On Thu, Nov 17, 2022 at 12:04:35PM +0300, Dmitry Osipenko wrote:
>>> Hi,
>>>
>>> On 11/17/22 07:58, Lukasz Wiecaszek wrote:
>>>> The reason behind that patch is associated with videobuf2 subsystem
>>>> (or more genrally with v4l2 framework) and user created
>>>> dma buffers (udmabuf). In some circumstances
>>>> when dealing with V4L2_MEMORY_DMABUF buffers videobuf2 subsystem
>>>> wants to use dma_buf_vmap() method on the attached dma buffer.
>>>> As udmabuf does not have .vmap operation implemented,
>>>> such dma_buf_vmap() natually fails.
>>>>
>>>> videobuf2_common: __vb2_queue_alloc: allocated 3 buffers, 1 plane(s) each
>>>> videobuf2_common: __prepare_dmabuf: buffer for plane 0 changed
>>>> videobuf2_common: __prepare_dmabuf: failed to map dmabuf for plane 0
>>>> videobuf2_common: __buf_prepare: buffer preparation failed: -14
>>>>
>>>> The patch itself seems to be strighforward.
>>>> It adds implementation of .vmap and .vunmap methods
>>>> to 'struct dma_buf_ops udmabuf_ops'.
>>>> .vmap method itself uses vm_map_ram() to map pages linearly
>>>> into the kernel virtual address space.
>>>> .vunmap removes mapping created earlier by .vmap.
>>>> All locking and 'vmapping counting' is done in dma_buf.c
>>>> so it seems to be redundant/unnecessary in .vmap/.vunmap.
>>>>
>>>> Signed-off-by: Lukasz Wiecaszek <lukasz.wiecaszek@gmail.com>
>>> If new patch version doesn't contain significant changes and you got
>>> acks/reviews for the previous version, then you should add the given
>>> acked-by and reviewed-by tags to the commit message by yourself.
>>>
>>> -- 
>>> Best regards,
>>> Dmitry
>>>
>> I would like to thank you all for your patience and on the same time say
>> sorry that I still cannot follow the process (although I have read
>> 'submitting patches' chapter).
> If you'll continue to contribute actively, you'll find things that
> aren't documented at all. Don't worry about it, usually somebody will
> tell you about what's missing. Just apply the new knowledge next time ;)

Yeah, it's more learning by doing. Especially I suspect you don't have 
commit rights to drm-misc-next (or do you want to upstream it through 
some other branch?), so as soon as nobody has any more objections ping 
Dmitry or me to push this.

Cheers,
Christian

PS: The Signed-of-by, Reviewed-by, Acked-by etc... lines are usually 
added in chronological order, e.g. your Signed-of-by line should always 
come first.



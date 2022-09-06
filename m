Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7FA5AF323
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 19:52:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FEBC10E0C6;
	Tue,  6 Sep 2022 17:52:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2046.outbound.protection.outlook.com [40.107.100.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 462C510E722
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 17:52:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B3JR84OI0nyKYJSMQEmQjKGxJowwXsOpE6OdQkTP45uoxUJdaKHF0DKqxfJvDKrZ92rlrmAYU9eRA3MekB6OfVvZxNi4/U7pzWBjvh+BTzsCrDz/hPzaMJHzlRrYLO08JEx7K1rvphA9kGP1kt9/cBIKqIG2+/hwHyqQVZhzZimHDBqgKESyTVBU9sQl77VgNO8F6SNr4ALueh2HiPfKDbc7+haFcQdF0GPr5XMNtmt9SvlvpsiPbPvEsKqb6Pbt2BIxUTVENpZYW6RK61eckHNZPjouJwh7elpXUgLts8FvMOUN/rczVUWman4Zzujyn2SKV6IsspfGv7xJZi+W6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dw/ZtvChJNfBcOxE8GjM/WXySKf5NjRI8gX73oWCScE=;
 b=j2Su9MWHKGLZ0w5vBhEudRFhJiq2We4iTfUT9nXtssvXzum5DmyN3AfesYOFwi4aNUTt73Ww3VAi+p9gtFDsYm5yZivF5BxrKOqBeKgEwgVECqzsBXw8XoWOm5x+RByMTbxMvOpEWqNtefzvduGnctyvnvc8c7jGB1XfHi1YLI0/jDn+wovCv1hKvxk/hi5VGPccAXgN1IzqvnwudunuKizdIR+XCUrW06y2JWyYUgsUo9ngapRl/cFY+43QZuLoiqJ1b2wcKxRWJY4ALdFqyH88F5xRhaZwmT0sfbkDT8plsgp8DCmuSzr/FxlF1mOutSFqXRJxoOMCCXXbxdKk6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dw/ZtvChJNfBcOxE8GjM/WXySKf5NjRI8gX73oWCScE=;
 b=xm+6URIMlgOyLlj/PEwUCyPN9lV6cbKojc8PLBL+bVK/pT6zXgOBGbB6Yf2mv493Ak8XtiDWD6fv4kLmKnTo180lf8wzwo6U1wuAbp1mKY1L7svWId1afzYc/hDdPljVY/2zdXy+zTJdzlAhwY3GEJt1SjPPda2ContEdCUExhs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3589.namprd12.prod.outlook.com (2603:10b6:a03:df::29)
 by BY5PR12MB4081.namprd12.prod.outlook.com (2603:10b6:a03:20e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Tue, 6 Sep
 2022 17:52:12 +0000
Received: from BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::a997:c7f:aea0:764a]) by BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::a997:c7f:aea0:764a%4]) with mapi id 15.20.5588.018; Tue, 6 Sep 2022
 17:52:12 +0000
Message-ID: <cfbea503-10a3-5cf2-1657-e0c849d194a0@amd.com>
Date: Tue, 6 Sep 2022 19:52:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 1/4] dma-buf: Add dma_buf_try_get()
Content-Language: en-US
To: Jason Gunthorpe <jgg@nvidia.com>
References: <1-v2-472615b3877e+28f7-vfio_dma_buf_jgg@nvidia.com>
 <18b3dd75-7995-a2a8-372b-1fd5838dfe1d@amd.com> <Yxd42anepRnmFJwe@nvidia.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <Yxd42anepRnmFJwe@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0045.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::16) To BYAPR12MB3589.namprd12.prod.outlook.com
 (2603:10b6:a03:df::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 348a38bd-beb7-47ba-dbb4-08da903086dc
X-MS-TrafficTypeDiagnostic: BY5PR12MB4081:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7Smbmm05fINUdZzYr01IVIwaAaoSwbXsMEITm5uV8LS2KgEeyMrrBup7DGM5Q2sBVxnLbr8uhqKBs5ZNq75P77kgJp2TPHt6DwBQ4PgdEvPzY2Jz3h1YUZ6wdi9jJ7vaECgm63p6LGTB6++Sh/0ia9UNvpwuZXPxiBTtjYKvGxNu4YMzAU33LJ/NF9th3bxCRaD0d+VRkN5spMyO7EbS4TJrYR+YR4bzIBAn3sadUzsvmIYBCoONvB5hX2o3dVaYKipu3UiDBYV0NxUlyE/FSUP1KejUsPErQwQU381xPpYfwjACkT2uOGTU+CerssFFzfBnGVp3/uS2V7WjiPsuvg+7/CetQoAT1sINTkwxh2kB1pIYTvJBNrMtxKzthCkBrIEW/+B5Gl2DtPtUDexGq5KRvzRcYP7RoCK44XYnCf0WWJeE8zu0qm8UqN896qdssQMKVNnJtLKcoEYhphZVivyH3kc1w1o3P3nd1hTXLk1NDqb3RP0WjCBoBLR1mGlqTgJkP1pmcpAx9Tab5sZK+FMC20XzzdU8t7axxy3JxolMC45SI0e5WeKCpxPXLtG06BV3XV1zefBkXtB0cAA8qzPFR6z+6eZyIusla+HLQ6R655cvAWMe7X4nxQQDSGnO1WfaUk7AM4TDtaNbOlqSywK9Et1tJRqAHtcJU/LXOglMDldrPAEJmVM779ZPAszo3204RFogaudQKnGufoKbQP/AXfjF9z5PcoXmAjgEIDfbH8zTIbC18FgmvZDDHrurFfXJhYlXBwXyKKJlFvx8G7W5fsD3h3IJw0ufufs3XP8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3589.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(366004)(376002)(396003)(39860400002)(346002)(83380400001)(6512007)(6506007)(66574015)(2906002)(31696002)(86362001)(186003)(2616005)(38100700002)(66556008)(5660300002)(66476007)(8676002)(66946007)(4326008)(31686004)(6486002)(36756003)(41300700001)(316002)(478600001)(6916009)(54906003)(8936002)(7416002)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2RTTEpsVmNhSmdLK2RMVlRqcDlUVGF2THFxaEp2dnY5TUYyZFFJY2E5T1p4?=
 =?utf-8?B?UWNYUnRYZXdiRnVHR2RNSGJCT0hFeVBZcTZHd3h6cHp5RnFiNUlxUlJJWFV1?=
 =?utf-8?B?ZWNmNnJodGVUdzhwMTNkUFNvMml5WjhXbEZCQ0h1YVVmeHpjZXdwbFdSbDUy?=
 =?utf-8?B?cHBlc083WVVlQW1yaDFNREx5cGRLZDBsdFRxSUl0aXlvWUc4eHNraFVlVlhh?=
 =?utf-8?B?NnRpM3U1WnZzeit6cUt5V2h6U3J2cVVnRkIvK29jS0d2bTNCbTVhU29Hb3V4?=
 =?utf-8?B?WkFHVlhaSE1JS0dJRGthSVVvUzdQVTdRU2RMWURGd1htV3RwUzNTcWsrNU5X?=
 =?utf-8?B?SlNzc1U1WlVoMkdyQklyVDhWVVlwNklZMDNWQW5PdTVlNjFKVXBheG9KTUJ4?=
 =?utf-8?B?OXQ4T3NBVTdSNWpvbXYxVnhqYjUwYlFmWG8zbUEveXBUeUxjdFRodGIvNDBQ?=
 =?utf-8?B?bmx3bStpR1JFSkNHY1M2K3FoL2xEdUp1eFhhaHJiWVpPRW4yZm92ci9jemgw?=
 =?utf-8?B?TFJZT0NJVnNSTGQvZHlwSFRwZ1d1aFR5UGR3NDFQZTJ0MzJIRXNVZjY2bXk1?=
 =?utf-8?B?L3FPMDd3RklKaFEwT01xenlWRUFKMFQvOVQ5bmVVZWxQN2xSSWhuYWhrdVFm?=
 =?utf-8?B?cWx0UzlGY1I0K2YwTHdsZnRJRGtXSzkvREJUcnhFanhxb2k0RHJSamhWRVpC?=
 =?utf-8?B?T2Iwbk04andaQ1IvQUFJd0Y0UWNIbDRSYVUzRDZMM1BEZ3Jtc1k2QUFSTDc0?=
 =?utf-8?B?LzRUdEVSK2F2SWNEV0pHVC83VmFKTDZsMWk1dkxpaGg5QmdoOFZxNlB4dm9r?=
 =?utf-8?B?Qll2VVd5ZXNSdzdFU2llVzRJTmFLVmhkWVdqMms2QnFiVDVsNUsyUk5zSHBZ?=
 =?utf-8?B?ZTN5aUNTd0QyNEFzaGpUd0NBeUxwYXJ4TGxxY2NuYnk5QzZiRUNpbTRlSm04?=
 =?utf-8?B?VXp5OVA3SnNoVFlkU2lsZ1VLaDkxaEQrUUJFelFFMXFydGNQK29ialorM3JY?=
 =?utf-8?B?SUM0M3Q4RWhpUGpMcWdZSWNoRXVDSDhGY0tSSDdDb1ZITkhpZVVvWmZaT1Fv?=
 =?utf-8?B?S3lleFZhNE5uOFNSMHVKZkRiV3Zoei9xZkJRQkpGV0c1VXVDMDFkS1A3SVp5?=
 =?utf-8?B?ek9sa3g2cnNMb1dEdEJ2NUlJcG4wWk50ZUdIbkFiZGFEYWJSVWhPRXI2QWRL?=
 =?utf-8?B?ejRaQTF3Z2h3dU9pNVJGRElPaG9lNmVpai9sUks2bndjMDgySURnS1kxdkhj?=
 =?utf-8?B?b3h2cUYvTUZPbnZHbFJkaVh6dGJGOEdOK0N0S0c3MmFOY2l3V3c0Y0IzZnJs?=
 =?utf-8?B?ck9pbERwVThTM3NqL0lOb1M5VjhSMkYyVkQ5UnBwNk9QS0NiKzVGTE4wcEMw?=
 =?utf-8?B?bHdLc3BaWkRwZUc5Uk8rcUNuaDBPdlQ1YTZVdlZVZjBFY1JkMVpWR0ttUlJj?=
 =?utf-8?B?MlFDUTlqdDVCbVI0MlJ0d0ZEYXZ0cGhGNy94U3hjd2tRSitiQjVZc2t3bnBr?=
 =?utf-8?B?dEF2cVFVUXVlMjNHanlsejNrUFQ5UytJVkEvY2Zsa2dZMU51VTlGM0pkTy95?=
 =?utf-8?B?aHllKzhsaXk1OGdFZUJFNTNLckZKNm9DZkxyYSttRFN6eVRhb0dVemp1cEQy?=
 =?utf-8?B?ZG9ib3R3TFJ2dTUzRFVaQllNcmxLZ3h4MXF3UlVLQUpubjdxNnNEUVVCY2Vo?=
 =?utf-8?B?VFlnazYzSG53N0M0Z2M5RUttY3B5dXdCSzAvSWFMM3NLL1R4TXhDdlIxNVQx?=
 =?utf-8?B?QWJZc1M5VStJbVVxcEFJZVUzQnpTbjVDZVk1OC9PWkxSU1Z1Q3JYVENuMUUy?=
 =?utf-8?B?MmpveFFVZksyUFo2T05GY3B1eGxJTnVldFUvMUh1bVhuQTFFOTZuQ2dtUm1Q?=
 =?utf-8?B?SnUxcWNFM1NncXFzL2NGTzdjQTh1c21hK0R0VTRJZ3d3THhqamVseDhSM0pH?=
 =?utf-8?B?N2t0MWhmNkdWVDl3NCtKdlR0UWhDM2dQVTRYTkQ4RWhzVXJrM2NSRFNQV3pq?=
 =?utf-8?B?YURkQW12UVFRdzZuL2kwc09JQkwxa0Q2M1hSQ0V0cVZYWHVxYk9WNlhMbDJ2?=
 =?utf-8?B?aHV6SHFHZldnTGRSR0pDMGM3c25RQklyVUNyNk82NzN6YkE4T0xZeTI0T0cy?=
 =?utf-8?B?WFNTMDBkT3IvaUhwREg1V0dhcmQzOTNaNDRyOEdRcng3ZDZXVWlxSTVzNHNq?=
 =?utf-8?Q?qwmAcdRZEiihD6HfN6xLFPPUDlTF485JDQvbiB074682?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 348a38bd-beb7-47ba-dbb4-08da903086dc
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3589.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 17:52:12.3516 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kWjaQMdeiXC7jj2FhGgAHfraWi5CxZBBrfRRx3C8RmEHwObONlkI/4gk+hzxAXz/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4081
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
 Alex Williamson <alex.williamson@redhat.com>, Maor Gottlieb <maorg@nvidia.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 06.09.22 um 18:44 schrieb Jason Gunthorpe:
> On Thu, Sep 01, 2022 at 09:55:08AM +0200, Christian König wrote:
>> Am 01.09.22 um 01:12 schrieb Jason Gunthorpe:
>>> Used to increment the refcount of the dma buf's struct file, only if the
>>> refcount is not zero. Useful to allow the struct file's lifetime to
>>> control the lifetime of the dmabuf while still letting the driver to keep
>>> track of created dmabufs.
>>>
>>> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
>>> ---
>>>    include/linux/dma-buf.h | 13 +++++++++++++
>>>    1 file changed, 13 insertions(+)
>>>
>>> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
>>> index 71731796c8c3a8..a35f1554f2fb36 100644
>>> --- a/include/linux/dma-buf.h
>>> +++ b/include/linux/dma-buf.h
>>> @@ -618,6 +618,19 @@ int dma_buf_fd(struct dma_buf *dmabuf, int flags);
>>>    struct dma_buf *dma_buf_get(int fd);
>>>    void dma_buf_put(struct dma_buf *dmabuf);
>>> +/**
>>> + * dma_buf_try_get - try to get a reference on a dmabuf
>>> + * @dmabuf - the dmabuf to get
>>> + *
>>> + * Returns true if a reference was successfully obtained. The caller must
>>> + * interlock with the dmabuf's release function in some way, such as RCU, to
>>> + * ensure that this is not called on freed memory.
>> I still have a bad feeling about this, but I also see that we can only
>> choose between evils here.
>>
>> Could you just call get_file_rcu() from the exporter with a comment
>> explaining why this works instead?
> I guess, are you sure? It seems very hacky.

Yes, it's still better than exposing a dma_buf_try_get() interface to 
everyone.

Keep in mind that those functions here are mostly supposed to be used by 
the importer and not the exporter.

Christian.

>
> Jason


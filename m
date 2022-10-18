Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1663602A47
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 13:34:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF8FF10EF0A;
	Tue, 18 Oct 2022 11:34:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2048.outbound.protection.outlook.com [40.107.93.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E26510ED44;
 Tue, 18 Oct 2022 11:34:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=btgfvf4PypcK6USPCAngPmntT74fJASLccN/II8MNLlv6kFBYIsBsFsYMiM0qMrTqH8WlFpjWlQnPy/bwz3Rs0Swj/FYG1VRhCKaLSYkFYcEwKHn32Mwn4PtVkMz0Tvge8jH2oGTQuYIVwroyMcZDi7SrWyrWDv21nOSIivyH6FuO2UDoB+bwWI/mXKePpqqRJ8m0urJcYBzJdHESPUu4U7tHZ7IRv9kujUWfpOvKpm9McgXRawm65IR3sW1OYK0MmURHxtPDbcKbfq+PgucSL6SlYAhtHbQwdZ6WDUsGhdKElrsgrxGawntLlW34vmBq2Og4eI8F4043tlO6Dq66Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=13uRgY/D7XlDTKeQPSz4XAAFNNCKoGyW++2oyD1gRQs=;
 b=hPctN/UsSFmphzQE+L/3lCqWQNRQMlUsu2ZNCqimJLhT27WwYjhBmKHpXLCR/TH1QY/EqoTdAaNw/IjQDxcz+WuUD06YKsepWelQBzhiNg+BOGbuzITS3dHWcuEWqUelI22OVPTTHuLunNatAYYRYCB6JJF8uKtZy873FXBEa7CSR5LlOIb8jWACgSJXlH8Zpma/YvgLfHE82oLqzqbsv6h2h4YDrUr7hHKjkejaiz1mciH4rYNIdnTycEyb+xuSrFv9m0j635BxgVZJ0ao2t3pqhO6b0UdbcMr5gBAAKKSpM3RQcqsVbP93NiG+vmkGZ00z+8RfY5T33no80haazQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=13uRgY/D7XlDTKeQPSz4XAAFNNCKoGyW++2oyD1gRQs=;
 b=wLNK0lzU9Fo4DAcivArOtiIoqnmRCQP1RSDXZ8t/erdLu9Y7/CAtBs4Pfi1oW9Ak5NeNG9xlbRF/cY4CYGvZJm3F8koFcE48sdhL4S6jl+UfEGcF467MKrDgbLR56ewkE1JQsBz+STl6NvkZ5oRoZMrlErKvpz3MolQ4Us3s8GA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SA1PR12MB7245.namprd12.prod.outlook.com (2603:10b6:806:2bf::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.33; Tue, 18 Oct
 2022 11:34:25 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::805b:58b6:1f27:d644]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::805b:58b6:1f27:d644%6]) with mapi id 15.20.5723.033; Tue, 18 Oct 2022
 11:34:25 +0000
Message-ID: <ce1927b4-d6c5-0649-5ae4-270045aa319f@amd.com>
Date: Tue, 18 Oct 2022 13:34:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v7 00/21] Move all drivers to a common dma-buf locking
 convention
Content-Language: en-US
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Clark <robdclark@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, Thierry Reding
 <thierry.reding@gmail.com>, Tomasz Figa <tfiga@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas_os@shipmail.org>,
 Qiang Yu <yuq825@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Amol Maheshwari <amahesh@qti.qualcomm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Leon Romanovsky <leon@kernel.org>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Tomi Valkeinen <tomba@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Lucas Stach <l.stach@pengutronix.de>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Ruhl Michael J <michael.j.ruhl@intel.com>
References: <20221017172229.42269-1-dmitry.osipenko@collabora.com>
 <d943fec8-a1ef-faa5-4132-c7618acb891f@collabora.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <d943fec8-a1ef-faa5-4132-c7618acb891f@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0172.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::10) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SA1PR12MB7245:EE_
X-MS-Office365-Filtering-Correlation-Id: 4682a26f-30b3-4504-4dd2-08dab0fcb558
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: smren2V6AYejFy4U2PmVkpNNRLm+h1yS/f9r4JXcVfxfqGCm/FDGdTugxtvaDDiQzl0qTJXxZz63NCIecZkyeCVJa+kGW0Im4orNOXzolOI4qNuu3ZZKENXzNIHRMC0wOwxgdB2Wa7B6cEavCL25/DHZbzwCA9og88YKKUQyCbI8nCPKMN6PzUC/XlnSysQzOCtqMpAxdTmYFToRHXEh+piGUtnPVBmngP9ntqpHjBEKQ6skq8a+/gBB6MwWlsFEQuAxwOSRcvI6DfWZaWo9CajT/r6QYlVTA0urfhi6OwtaghJOEjbmL8RzgwBXSNIUBFXGxu1vJQ5tJMs11Uv2etcw82f3EdCzcEdBhSlzGu/EUX2aOdrsPavIx6MWJMzCtKY+qYugtL2bxenjy2jBt7d9Lnj65UkUtfBP2noQEYD7YIQh29p3yLVaIlIYS/mZx5Dq5AaxESo4nP6Xr6XZVSbeS847GPtweQ5USPfje+RZCXISxiOmDSt35tj5MitEQOvZHpUTL0HKz40XYue+zpKN3Dggw6uradIg1cqJ9xiZe6DD8702kL5FNoibu8XuKOjP1NyT7fg/UPu7KFn4/Y/ooE+YQGjjebqIrY5LMoUdVkRafXnq2zD0o6mMEWf+C5WxP4xD/LJcNSzZfaI52pxLzuMPhKeE18+B1U8lzYhAB1iattsVxTgGr0arADO+ShzDGCx5dStdGqSMxkkNBzPkPJ+o6zahUDIW1air+tIUPFepOHJyg+CKRiM4PEoqHpAQl9zfBiGLn3Hcp3LWYQZONzb4jZ5qOBX4JmEhimIfC508OrzfP6FHwMDfiw9s
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(39860400002)(346002)(136003)(366004)(396003)(451199015)(110136005)(31696002)(921005)(83380400001)(38100700002)(19627235002)(86362001)(316002)(41300700001)(8936002)(53546011)(6486002)(6512007)(6506007)(2906002)(6666004)(186003)(66574015)(478600001)(7406005)(2616005)(5660300002)(36756003)(7416002)(31686004)(66946007)(66476007)(66556008)(8676002)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VG9nVGFtaEExRnkvV09FVVZlQ3QyQktKZTNieHlYSkJ6aHdTdkxhS2ZYeksv?=
 =?utf-8?B?VXp2cmxzZUN0TXRDeEFQUmE4ZE8zWnBtcm9zMFN6dUhBUW9YTWlQR3FLUG01?=
 =?utf-8?B?anF1SFJSSnJ3VGdTdTZ3aVJPUDE4MC8reFNieGk3aVBScThtTjVibG5maTRm?=
 =?utf-8?B?THowYnBoM2s4aEIxZGVacEZ0UlZOdzA4YXpwdDdhVEk5eFZxblBya2FVUjFB?=
 =?utf-8?B?YkVPMjBVVGNXWW45Zno4T2R6Y3FwT1JZZjgwNXFsT1ZXZ2dnSUUvSnFBdHB4?=
 =?utf-8?B?bWp2bzBkc3NFTlRmUTBNSGpSeno4Rjlnd3Q5L1VpZVdlaFg3b29KT2xZMkhh?=
 =?utf-8?B?K1dCME5aQlZTZUJPQnZnOFFrVGVOVlVheVZwOEo1aUxnU3kwTGRDSFZnVFVH?=
 =?utf-8?B?KytQb3p3bGxOajlmd3I4Qk9NTG9FSFhOYzVmM2hBRGVqTUhFSlYxVWhxc2wx?=
 =?utf-8?B?NzJ4ZUZ4Z2VLRk5lWUhRSXF6STJXRjlNb3IzV3hWazgrSGphaUZ3YkhqMUVJ?=
 =?utf-8?B?OFBaSEloS1JLZjVDWXlYN2FJSFEzRXZFUTFwenliMDdsYWFORE0zVEpuMUZl?=
 =?utf-8?B?cGprSkZhMm5veitQc1J5OGJyUk5vZzdHdjM5ZlB1VkdFdk9kWnBkVTVVQmYz?=
 =?utf-8?B?NEI1Q2lXRFZ3cGRGV2pTcnVzN3ZXMFNmbUxxdFBSRGduNnFWRXJuZ3VURXRz?=
 =?utf-8?B?RzVxR1AzYXdBMWlDZ0hDUGlYcTAxR2ZpMkoxck1RRU5wbGg0cFNxWmFuSXBm?=
 =?utf-8?B?QW96QTg4SnVhcnJ3NGxjMFBvVWVUeXNvMmpvam8rdHV6S1JSSiszVUVQOGcv?=
 =?utf-8?B?VEpaTEUwa1hDSDhZaVhtYStiMVYvRlBZTW1pdk5mVXluM1Btc3pKd0wrNXBq?=
 =?utf-8?B?WlVTM2VKZnJhL3VPQXJRT1BPQ0p1WnFmQkR3VHRTVlZpSzh3RCs1OWo0U1FV?=
 =?utf-8?B?eDJ1VE5tRFd3VjUrY00xamVNak1wTkRyaFlrcGhnZ3lNcDFLR2hwWHN1VDJh?=
 =?utf-8?B?Z3puQUR6RksweVpPZGE4dTZBd1QzNVIyYld0dDFQdmZCSlJCNWYwVDBSR25r?=
 =?utf-8?B?c29uaWtrZHlhKzJ3cmNDd3QrUTdoOEJMN2NlQ2dTTkdrN3N2M21scGxpc2Nn?=
 =?utf-8?B?WURITjhKQlMxSGpzNkUwTmV4dWtYQ3VnMzVYVURBSUVDZHo1RXc2NXNJa1Vj?=
 =?utf-8?B?MXhMd1FTUTMvUFNDODZURGdhVWNqZktkSk9CdS83U2Q0RWNRYW4xb3hRN2Fh?=
 =?utf-8?B?NTdTVUUveW10UVVRUVZmc0FJaytNRWxDOExub2hzMkxtcG9MQ3NNZFpVNzNB?=
 =?utf-8?B?dnZhSEUxRmhLbE5mWW1MM256WG9xZkgwZXpIMUFxTk1sNHhhcFJGTFVMT3Y0?=
 =?utf-8?B?eDV0U1Q1bExKVzRiRnI3MG5NR0U3MEtCZ0kzcXJaOWJpUWRVaDEzSEdqMWZZ?=
 =?utf-8?B?bEJnTk90cHBsREJISmZ5RHpBRStaYkplSjkzeCs3T1hEVW5qZjR2a0NDSkIw?=
 =?utf-8?B?cTJHYmtyMUlVM3JTNU9ZV0VVODY1akRvTXRvYy9oemdEejZaK0pRUjV4ZFQx?=
 =?utf-8?B?b1hIMzVDVzdiU1hjV0FEK2JxK0tYTjVxbURTSUx4cnhEYzVialB3STJodjND?=
 =?utf-8?B?RmN1WWNkRXYrNWpscXBqWWE3eHR0RXNrZ3cyTkRDczVnSnp1Y2M3eTVsK3ZX?=
 =?utf-8?B?ZWJ5WE5sbkhXVnlWKzh5dXg2L2JvTVhYVWlrdHJZZnlSVHdlVGIvVDh3V1Nn?=
 =?utf-8?B?NFRjME1jZFMwREE3RzZ6U2FvcXhOcWVZY2h4YjltQmFvL1ZhWnJmRkh2eElF?=
 =?utf-8?B?cUtMNHVLd2xDcVBLTmZEdXRoWjcwdDdvZlgwd2c0YkJndGpoOWxOeVZTTkVR?=
 =?utf-8?B?Z3VPSUxSWlNjNmIwaGtRaWt5MWMyVnJjR1IrK3J0VzJjQVY2Q2d6a3JHbFU2?=
 =?utf-8?B?RDhEUzdwRDdRbEcrRVRxSlVmWC9MeG9xQndNdGE5bGVOS2F6TldwOEpGY0Yx?=
 =?utf-8?B?bGFMaUJjRWdZNnI3MEtFTnI4YUR1dXJaWHJJRTV4MmlHaFdpM2dvd0twVFJp?=
 =?utf-8?B?d3dGaWRyWE5mSFJyS1BJWHpzNTFLTUdQV3B0UGRNV2l5RTk3L2JkN1cyb0hr?=
 =?utf-8?B?ekxsN3cxREsrZ09nbzR5YnhzZWtwNVNnK1BFZ2FsaW9iTjRWMC9xVEs5QzND?=
 =?utf-8?Q?1cDTCla2z5g/T+Bzuj5SzCK9R+0BkXnWKjtT65qrqwgw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4682a26f-30b3-4504-4dd2-08dab0fcb558
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2022 11:34:24.9244 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jOYxdd3sJc9dkMTMTHC2+G6cGYD0shaYm1rJBGNooWitS8/2n3QnPL0azmwwnsvq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7245
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
Cc: linux-rdma@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Dmitry Osipenko <digetx@gmail.com>, kernel@collabora.com,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 18.10.22 um 01:07 schrieb Dmitry Osipenko:
> On 10/17/22 20:22, Dmitry Osipenko wrote:
>> Hello,
>>
>> This series moves all drivers to a dynamic dma-buf locking specification.
>>  From now on all dma-buf importers are made responsible for holding
>> dma-buf's reservation lock around all operations performed over dma-bufs
>> in accordance to the locking specification. This allows us to utilize
>> reservation lock more broadly around kernel without fearing of a potential
>> deadlocks.
>>
>> This patchset passes all i915 selftests. It was also tested using VirtIO,
>> Panfrost, Lima, Tegra, udmabuf, AMDGPU and Nouveau drivers. I tested cases
>> of display+GPU, display+V4L and GPU+V4L dma-buf sharing (where appropriate),
>> which covers majority of kernel drivers since rest of the drivers share
>> same or similar code paths.
>>
>> Changelog:
>>
>> v7: - Rebased on top of recent drm-misc-next.
>>
>>      - Added ack from Jason Gunthorpe to the RDMA patch.
>>
>>      - Added iosys_map_clear() to dma_buf_vmap_unlocked(), making it fully
>>        consistent with dma_buf_vmap().
>>
>> v6: - Added r-b from Michael Ruhl to the i915 patch.
>>
>>      - Added acks from Sumit Semwal and updated commit message of the
>>        "Move dma_buf_vmap() to dynamic locking specification" patch like
>>        was suggested by Sumit.
>>
>>      - Added "!dmabuf" check to dma_buf_vmap_unlocked() to match the locked
>>        variant of the function, for consistency.
>>
>> v5: - Added acks and r-bs that were given to v4.
>>
>>      - Changed i915 preparation patch like was suggested by Michael Ruhl.
>>        The scope of reservation locking is smaller now.
>>
>> v4: - Added dma_buf_mmap() to the "locking convention" documentation,
>>        which was missed by accident in v3.
>>
>>      - Added acks from Christian König, Tomasz Figa and Hans Verkuil that
>>        they gave to couple v3 patches.
>>
>>      - Dropped the "_unlocked" postfix from function names that don't have
>>        the locked variant, as was requested by Christian König.
>>
>>      - Factored out the per-driver preparations into separate patches
>>        to ease reviewing of the changes, which is now doable without the
>>        global dma-buf functions renaming.
>>
>>      - Factored out the dynamic locking convention enforcements into separate
>>        patches which add the final dma_resv_assert_held(dmabuf->resv) to the
>>        dma-buf API functions.
>>
>> v3: - Factored out dma_buf_mmap_unlocked() and attachment functions
>>        into aseparate patches, like was suggested by Christian König.
>>
>>      - Corrected and factored out dma-buf locking documentation into
>>        a separate patch, like was suggested by Christian König.
>>
>>      - Intel driver dropped the reservation locking fews days ago from
>>        its BO-release code path, but we need that locking for the imported
>>        GEMs because in the end that code path unmaps the imported GEM.
>>        So I added back the locking needed by the imported GEMs, updating
>>        the "dma-buf attachment locking specification" patch appropriately.
>>
>>      - Tested Nouveau+Intel dma-buf import/export combo.
>>
>>      - Tested udmabuf import to i915/Nouveau/AMDGPU.
>>
>>      - Fixed few places in Etnaviv, Panfrost and Lima drivers that I missed
>>        to switch to locked dma-buf vmapping in the drm/gem: Take reservation
>>        lock for vmap/vunmap operations" patch. In a result invalidated the
>>        Christian's r-b that he gave to v2.
>>
>>      - Added locked dma-buf vmap/vunmap functions that are needed for fixing
>>        vmappping of Etnaviv, Panfrost and Lima drivers mentioned above.
>>        I actually had this change stashed for the drm-shmem shrinker patchset,
>>        but then realized that it's already needed by the dma-buf patches.
>>        Also improved my tests to better cover these code paths.
>>
>> v2: - Changed locking specification to avoid problems with a cross-driver
>>        ww locking, like was suggested by Christian König. Now the attach/detach
>>        callbacks are invoked without the held lock and exporter should take the
>>        lock.
>>
>>      - Added "locking convention" documentation that explains which dma-buf
>>        functions and callbacks are locked/unlocked for importers and exporters,
>>        which was requested by Christian König.
>>
>>      - Added ack from Tomasz Figa to the V4L patches that he gave to v1.
>>
>> Dmitry Osipenko (21):
>>    dma-buf: Add unlocked variant of vmapping functions
>>    dma-buf: Add unlocked variant of attachment-mapping functions
>>    drm/gem: Take reservation lock for vmap/vunmap operations
>>    drm/prime: Prepare to dynamic dma-buf locking specification
>>    drm/armada: Prepare to dynamic dma-buf locking specification
>>    drm/i915: Prepare to dynamic dma-buf locking specification
>>    drm/omapdrm: Prepare to dynamic dma-buf locking specification
>>    drm/tegra: Prepare to dynamic dma-buf locking specification
>>    drm/etnaviv: Prepare to dynamic dma-buf locking specification
>>    RDMA/umem: Prepare to dynamic dma-buf locking specification
>>    misc: fastrpc: Prepare to dynamic dma-buf locking specification
>>    xen/gntdev: Prepare to dynamic dma-buf locking specification
>>    media: videobuf2: Prepare to dynamic dma-buf locking specification
>>    media: tegra-vde: Prepare to dynamic dma-buf locking specification
>>    dma-buf: Move dma_buf_vmap() to dynamic locking specification
>>    dma-buf: Move dma_buf_attach() to dynamic locking specification
>>    dma-buf: Move dma_buf_map_attachment() to dynamic locking
>>      specification
>>    dma-buf: Move dma_buf_mmap() to dynamic locking specification
>>    dma-buf: Document dynamic locking convention
>>    media: videobuf2: Stop using internal dma-buf lock
>>    dma-buf: Remove obsoleted internal lock
>>
>>   Documentation/driver-api/dma-buf.rst          |   6 +
>>   drivers/dma-buf/dma-buf.c                     | 216 +++++++++++++++---
>>   drivers/gpu/drm/armada/armada_gem.c           |   8 +-
>>   drivers/gpu/drm/drm_client.c                  |   4 +-
>>   drivers/gpu/drm/drm_gem.c                     |  24 ++
>>   drivers/gpu/drm/drm_gem_dma_helper.c          |   6 +-
>>   drivers/gpu/drm/drm_gem_framebuffer_helper.c  |   6 +-
>>   drivers/gpu/drm/drm_gem_ttm_helper.c          |   9 +-
>>   drivers/gpu/drm/drm_prime.c                   |   6 +-
>>   drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c   |   2 +-
>>   drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |   2 +-
>>   drivers/gpu/drm/i915/gem/i915_gem_object.c    |  14 ++
>>   .../drm/i915/gem/selftests/i915_gem_dmabuf.c  |  16 +-
>>   drivers/gpu/drm/lima/lima_sched.c             |   4 +-
>>   drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c     |   4 +-
>>   drivers/gpu/drm/panfrost/panfrost_dump.c      |   4 +-
>>   drivers/gpu/drm/panfrost/panfrost_perfcnt.c   |   6 +-
>>   drivers/gpu/drm/qxl/qxl_object.c              |  17 +-
>>   drivers/gpu/drm/qxl/qxl_prime.c               |   4 +-
>>   drivers/gpu/drm/tegra/gem.c                   |  17 +-
>>   drivers/infiniband/core/umem_dmabuf.c         |   7 +-
>>   .../common/videobuf2/videobuf2-dma-contig.c   |  22 +-
>>   .../media/common/videobuf2/videobuf2-dma-sg.c |  19 +-
>>   .../common/videobuf2/videobuf2-vmalloc.c      |  17 +-
>>   .../platform/nvidia/tegra-vde/dmabuf-cache.c  |   6 +-
>>   drivers/misc/fastrpc.c                        |   6 +-
>>   drivers/xen/gntdev-dmabuf.c                   |   8 +-
>>   include/drm/drm_gem.h                         |   3 +
>>   include/linux/dma-buf.h                       |  17 +-
>>   29 files changed, 325 insertions(+), 155 deletions(-)
>>
> Applied to drm-misc-next

Finally! Fingers crossed that all corner cases where fixed during the 
review.

But if anything shows up feel free to loop me in to help fixing things.

Thanks a lot for doing this,
Christian.



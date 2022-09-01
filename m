Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3C25A911C
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 09:49:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2585E10E63C;
	Thu,  1 Sep 2022 07:49:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2088.outbound.protection.outlook.com [40.107.93.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E37FC10E62A;
 Thu,  1 Sep 2022 07:49:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D6JcXWnbGcUV2tzOh02yaq+PpastHX6FWdcvbwfoYBG+teR6Avq6Z1a5k+Vl2kguWEcEwN+kefUVrtNNkLKpGfhazyY5wwCv3cnZtoyAL6hIvEiKVuG7gqfKX5n/8nvTMj/hnI5pEVlP54z/tnpXP3xUuVEhS9XkaSNgLR5ul4iMoEgODRZ5fMV7wZKmo51Aymqx8c31uzg38/ueOflCbvK/b/MqamrYB2aqDb8L8ssGugecxAjuuGLOOjdkS+nRc80prYmXRxk1L2jtYvvU+WS2tSm1eMVP1qRAmETLVEeqiIuWm9I2U20F4ljIL7xVoBj1W74gAvP2mk3MFfbluA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LtnNjOm3mfbaiA9g0xWDk6iOkoPpekf7mz/0krVpSHQ=;
 b=jG2DrXRoYfNarpFU0rSnFXcF49dEgMU0W54ayM1EjF9HIJ0ZAd1wfPWDFW7H9+MNWkc81NB8q7mg6fiXGwGb7k4hFE+kyx9XbQ9lSZz6x4syXYAPFAJVF2S5t4rAsjbcflccw+x9YmotTTA9FzNZKW1BHORU57MNRFVICrMFthp6mpd6yfqO1EGl5IVkCvWb+9X7mBQsU4FkK4vZOJlLu+xOWr7LhoS1iQx8LRXuORJ+h9mSKI8SwJQtV25odWlB0sw+xaMHkGS/dDXO27mtDFhPFbXiHglp/PmnzgyB7g5xjOWavKuAPkqJInO3fgAKjI3FiuBIbGz3ty7gkNIJnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LtnNjOm3mfbaiA9g0xWDk6iOkoPpekf7mz/0krVpSHQ=;
 b=JpvwNnlYSclwm1qz74VZOGVpWJj0A6yEoWOVbr2bjn/KfYd+G5xdDXdyJsygWmNgnUQG7nvnKPdctmFNUnQZndAL4uovfGXeYclVaIgREfgpIVR/NoiQ4I35M1XShi+mNwfdrMNi/0A0FXeAqDJTs3qsSTHBxJwTydavEqWti/w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SJ0PR12MB7068.namprd12.prod.outlook.com (2603:10b6:a03:4ae::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Thu, 1 Sep
 2022 07:49:13 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4524:eda6:873a:8f94]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4524:eda6:873a:8f94%7]) with mapi id 15.20.5588.012; Thu, 1 Sep 2022
 07:49:12 +0000
Message-ID: <8322099f-4ef3-6a5d-4a66-27c4b3329884@amd.com>
Date: Thu, 1 Sep 2022 09:49:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4 00/21] Move all drivers to a common dma-buf locking
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
 Christian Gmeiner <christian.gmeiner@gmail.com>
References: <20220831153757.97381-1-dmitry.osipenko@collabora.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220831153757.97381-1-dmitry.osipenko@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0124.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::15) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ec68044d-d5ac-46a5-b018-08da8bee75f0
X-MS-TrafficTypeDiagnostic: SJ0PR12MB7068:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xra6RWrU/TtLGcRNSFqSDQBWFPWpp3n3wVOyxPvqdFNDD7V1/8H5/RqXg/iNjBv/N6HO9FjiGowqgcUMl/TWIKw/L2Js7ZlTELrNg0boaFEk2RRXS2r7isBn9tWaON7GpfYKV4bK7zV7itoJgLtymLiZuyRDd8ebvHKKz0trrWjYiqO0f3YBsYzZoQgRmia9XsoN6R1pQcr4OtNKHGiWQvs0fzhb1MEyArgAuDTdIjIHjacW0YHtqXo/FJt6x048oiW0E1PXV42v2a0e5rOy5+ua7QX+lnu8HWu3RwoUII70ew00rhXLeJ7DkewRo8KchMhDpuTtGnUYmRr+OfjbVv6XAlIVgSCb1pcMqD3XIZ+jnyz0W+i1emqEJjnNm8MhgcHwB61AAi98Sc/6h1pTPNHzzaltMWATP3fGNJ9e+c27epZIY5uc+K10TF3N0zbNcR2BCSSIcEj1Wcd0HJhK/yqPyi/no6otGFe3fLr+k48rwOn1m4PFKYzbquIwECa+uMiZHD3VD7pzNGe75WtD6FDxY0cxaMWHFhrD4pJ6GHpiyK3GeJMWi4khHQuytpkt3XSbKqfZ5upzHpK7KW7SngTLJpz1qLk1pVKTlsz2NJ0nJkrXm+HqHRvOf4MdLu/yHD1S9f+KyaoBIUil2dW7j1NzooSs/kA9dTI3H0or1+heYyeaP++yFxmA6L0PGrFhExmproWq+pvjeaZR3BDT5NgclUYR5WTyg1H3ae9APfksFx7Y4nQvR3MtTTg5y7/Z7Z6fxf28fghWoIvpJUbd5mCMk6Uk+zN+Xo0HBog8QnoB+igUT788SeQeQ1OMaPNn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(376002)(136003)(396003)(346002)(366004)(31686004)(316002)(19627235002)(110136005)(38100700002)(186003)(86362001)(921005)(31696002)(36756003)(2616005)(2906002)(83380400001)(6486002)(41300700001)(8676002)(66556008)(66476007)(66946007)(4326008)(478600001)(7416002)(6666004)(8936002)(7406005)(5660300002)(6506007)(66574015)(6512007)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aWFzMG5TeE1PaEJRYTBvL2lGclFMRlh2alhUYlpNNUF3VytWNVBuN1lzQ2N5?=
 =?utf-8?B?UVNZOFdjRUV4SVYxa2xZTU1IQTBhTGkveGRkT29mZU9Mb1ZGNXZHK2NESXJL?=
 =?utf-8?B?QjFqbjlUK0UrMlhQVWFGajVRTkt0UVRIZTdXZXY1dFdKekJKOWdxQUQyU1M2?=
 =?utf-8?B?QmNDYW5UazJpTXFVT1RZUmlYaTZZazFwTmNpSWtUajlvTlhtT0QxU1JKVjFF?=
 =?utf-8?B?eGFnempJU09EU3JHdUswdllWcGdzejFtTmJYbzk1YjFVNFdSYkVHT3dnWkoz?=
 =?utf-8?B?MkVhYnBaaGd1TkFOamlYaXNVNGlnbU9mRUhrU2drTk1yZkVrRGFiaGJSM1Qz?=
 =?utf-8?B?SjVxZytlZ1Vwa3FCUTdlWkFQSk5TeGdPU0RHWk9GNTJzOGRua1lhNXpvUnF0?=
 =?utf-8?B?Rm1lUXMwbUJXcHV0U3BySURkNFc5RlE0Q2c0MVZiK3BzS2dUcE1ONmVMRDlv?=
 =?utf-8?B?b0FocEEwZmJ3WnhpQlkxVHVDSVNIdUp5bCs3ditIamtweHM0dDFzUEZMK1k3?=
 =?utf-8?B?cHltWS94ODFhd3VVbm9hd0xudjR0ZUwxNG9OcmxtcWZ3cVlVcW5veW9mZDlP?=
 =?utf-8?B?eURwUnY1RTJMNDA2ZGJkakduU01OYWhNRytoMTg2WGF3R090VDdZUVd6c2Mz?=
 =?utf-8?B?ZEt3M1BTREdJWWlna20xK0NNQllJODF3ODFFSlhXS3FxRkVWSU95aVFqUG5W?=
 =?utf-8?B?OHYyYzRad0hXbmRKZFduNzJCUHNwYW9IV3djNVVPVHBsdzBrUERRZ3F2bTBB?=
 =?utf-8?B?VzdscVVKb0pmNmJRbkgyOGJNUWZrSldvdFJmY2VoYmFpeWswK09sQUpUSEJ3?=
 =?utf-8?B?TTBzWTRJcVdoa3lCR3lzN2U0V1MyZXNIV29weC9pZW9hQ3Zjc0lucTU2SU5B?=
 =?utf-8?B?Mi9hcEcyYUswN1dBSHIzdUtpSXZSMDB3a3Q4QXRqZEZzOGsrZ0tQekU2OWxv?=
 =?utf-8?B?d3ErbTloNVZnNkJ6TnNYZjh6UVRjME8waXlxMWN1RTVsb05yZWg2QXlHdTZF?=
 =?utf-8?B?R2dJSnNOVnlrRGEwc2N1Q1Z1RHl5K1FPcndpcUgvVCtlczU0eHlscUdOMTBO?=
 =?utf-8?B?M0l3VExOMG0rOERGVjhIR1N6cDIzYlFLMlN2ODBFemdldHZlNTM5V2pNOHBK?=
 =?utf-8?B?dXB0MkQyeXBLeGVYVjFKRUdSbjVOMjIwT2JvQnNydnA5bE83UnVFYTF3WmIz?=
 =?utf-8?B?aVlqcXdBV0E1M3lVbmJvbzBzbCtNYWR3ekwxVmJEaU43ek5uOWhxTjY0MWdk?=
 =?utf-8?B?WlRSL0tOR1VTMmt3UlFOZkdFbExFREFiK1hHdUZZTmJqQ2N6QWtaa0x5WjI0?=
 =?utf-8?B?L293YzRpZ0RnbXpsallFcmliakc1MjNCRmZKa0lxbTdScC9FU0RaZG8rSlhu?=
 =?utf-8?B?WUhQYWRtNjhIOUJjU09uY3VRUldHTy9JS3k2MVZBaEZnNEcrMHFpQlg2a0x3?=
 =?utf-8?B?VE1jKzZqNWJLSmcvQTR2aEtIenVmWXpqVFVrZ01RVVlkcXlZRVJXK2JSbmRN?=
 =?utf-8?B?Nnpyem9RenY1Z1BOc1pLQTJ4RWErZkJ5V2xCdno3V3ZHQ011SWJpU3UycWs4?=
 =?utf-8?B?ZDhST3g5Q1l4cUhEcnRGOWFBZUpGRkRjOXRUaGxQc0hUTmtjYlVubFlrTlZF?=
 =?utf-8?B?VmNQZ0Jva3RKSjhvUEl1ZVBwc0p1akpOUWxUUDFxcEc1RGxZWlJ2MXphcUI5?=
 =?utf-8?B?dTBheFFkR3l0M05qVFNGZ2h2R3hzTmtiNUMxck1RM3ZkTXZnUW5vWEFBcXMx?=
 =?utf-8?B?akVYSnJEcGlaS2ppSnc2QnNSNmRJWVhmckFXKzllNUQ5YndPSURkVEtxZXM1?=
 =?utf-8?B?WkV6Z3ZsSjdjOTVDVXNka0pvTFozcy93bVpGTE5lRkhwam9RaDFWQ3RiMHkv?=
 =?utf-8?B?a3JEb0ZOS1U3WXIwVWcvZnByZ1Y2bS9Udnh3KzBxb3ltQU1EMGdrZFc1NHVI?=
 =?utf-8?B?T3JQOTFsWm0vbE80Y2drUW1VUmNFUkkycVlmY2orRnBDUzJXcmR6WHRtajhH?=
 =?utf-8?B?cUxBWER0Rlk1NWlaeHlPMHkwU1VPNWFIdEROZ0Npc3hVYnQ3VWRlV0toRkpO?=
 =?utf-8?B?YVJvd2s4WG04ZDUvOEQzUldEWVg3dE40T01ESlN1cFRzOTBnV1ZRclNBOU5a?=
 =?utf-8?Q?P1Bd2NE+krw2THlgpDn2L75VF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec68044d-d5ac-46a5-b018-08da8bee75f0
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2022 07:49:12.6969 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M7mIQ3DPsgp3GbxAECBPA+RECrU4HO+7G2JkVAVnnWnwED0IZ6eYSrrfTkk24JZV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7068
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

Hi Dmitry,

I've gone over this multiple times now and while it is still possible 
that we missed something I think that this should land now.

The whole topic is just to complicated that we can 100% sure guarantee 
that there isn't anything wrong with the locking, but lockdep and driver 
testing should allow us to quickly find remaining issues.

Do you have commit rights to drm-misc-next or should I push it?

Thanks,
Christian.

Am 31.08.22 um 17:37 schrieb Dmitry Osipenko:
> Hello,
>
> This series moves all drivers to a dynamic dma-buf locking specification.
>  From now on all dma-buf importers are made responsible for holding
> dma-buf's reservation lock around all operations performed over dma-bufs
> in accordance to the locking specification. This allows us to utilize
> reservation lock more broadly around kernel without fearing of a potential
> deadlocks.
>
> This patchset passes all i915 selftests. It was also tested using VirtIO,
> Panfrost, Lima, Tegra, udmabuf, AMDGPU and Nouveau drivers. I tested cases
> of display+GPU, display+V4L and GPU+V4L dma-buf sharing (where appropriate),
> which covers majority of kernel drivers since rest of the drivers share
> same or similar code paths.
>
> Changelog:
>
> v4: - Added dma_buf_mmap() to the "locking convention" documentation,
>        which was missed by accident in v3.
>
>      - Added acks from Christian König, Tomasz Figa and Hans Verkuil that
>        they gave to couple v3 patches.
>
>      - Dropped the "_unlocked" postfix from function names that don't have
>        the locked variant, as was requested by Christian König.
>
>      - Factored out the per-driver preparations into separate patches
>        to ease reviewing of the changes, which is now doable without the
>        global dma-buf functions renaming.
>
>      - Factored out the dynamic locking convention enforcements into separate
>        patches which add the final dma_resv_assert_held(dmabuf->resv) to the
>        dma-buf API functions.
>
> v3: - Factored out dma_buf_mmap_unlocked() and attachment functions
>        into aseparate patches, like was suggested by Christian König.
>
>      - Corrected and factored out dma-buf locking documentation into
>        a separate patch, like was suggested by Christian König.
>
>      - Intel driver dropped the reservation locking fews days ago from
>        its BO-release code path, but we need that locking for the imported
>        GEMs because in the end that code path unmaps the imported GEM.
>        So I added back the locking needed by the imported GEMs, updating
>        the "dma-buf attachment locking specification" patch appropriately.
>
>      - Tested Nouveau+Intel dma-buf import/export combo.
>
>      - Tested udmabuf import to i915/Nouveau/AMDGPU.
>
>      - Fixed few places in Etnaviv, Panfrost and Lima drivers that I missed
>        to switch to locked dma-buf vmapping in the drm/gem: Take reservation
>        lock for vmap/vunmap operations" patch. In a result invalidated the
>        Christian's r-b that he gave to v2.
>
>      - Added locked dma-buf vmap/vunmap functions that are needed for fixing
>        vmappping of Etnaviv, Panfrost and Lima drivers mentioned above.
>        I actually had this change stashed for the drm-shmem shrinker patchset,
>        but then realized that it's already needed by the dma-buf patches.
>        Also improved my tests to better cover these code paths.
>
> v2: - Changed locking specification to avoid problems with a cross-driver
>        ww locking, like was suggested by Christian König. Now the attach/detach
>        callbacks are invoked without the held lock and exporter should take the
>        lock.
>
>      - Added "locking convention" documentation that explains which dma-buf
>        functions and callbacks are locked/unlocked for importers and exporters,
>        which was requested by Christian König.
>
>      - Added ack from Tomasz Figa to the V4L patches that he gave to v1.
>
> Dmitry Osipenko (21):
>    dma-buf: Add unlocked variant of vmapping functions
>    dma-buf: Add unlocked variant of attachment-mapping functions
>    drm/gem: Take reservation lock for vmap/vunmap operations
>    drm/prime: Prepare to dynamic dma-buf locking specification
>    drm/armada: Prepare to dynamic dma-buf locking specification
>    drm/i915: Prepare to dynamic dma-buf locking specification
>    drm/omapdrm: Prepare to dynamic dma-buf locking specification
>    drm/tegra: Prepare to dynamic dma-buf locking specification
>    drm/etnaviv: Prepare to dynamic dma-buf locking specification
>    RDMA/umem: Prepare to dynamic dma-buf locking specification
>    misc: fastrpc: Prepare to dynamic dma-buf locking specification
>    xen/gntdev: Prepare to dynamic dma-buf locking specification
>    media: videobuf2: Prepare to dynamic dma-buf locking specification
>    media: tegra-vde: Prepare to dynamic dma-buf locking specification
>    dma-buf: Move dma_buf_vmap() to dynamic locking specification
>    dma-buf: Move dma_buf_attach() to dynamic locking specification
>    dma-buf: Move dma_buf_map_attachment() to dynamic locking
>      specification
>    dma-buf: Move dma_buf_mmap() to dynamic locking specification
>    dma-buf: Document dynamic locking convention
>    media: videobuf2: Stop using internal dma-buf lock
>    dma-buf: Remove obsoleted internal lock
>
>   Documentation/driver-api/dma-buf.rst          |   6 +
>   drivers/dma-buf/dma-buf.c                     | 211 +++++++++++++++---
>   drivers/gpu/drm/armada/armada_gem.c           |   8 +-
>   drivers/gpu/drm/drm_client.c                  |   4 +-
>   drivers/gpu/drm/drm_gem.c                     |  24 ++
>   drivers/gpu/drm/drm_gem_dma_helper.c          |   6 +-
>   drivers/gpu/drm/drm_gem_framebuffer_helper.c  |   6 +-
>   drivers/gpu/drm/drm_gem_ttm_helper.c          |   9 +-
>   drivers/gpu/drm/drm_prime.c                   |   6 +-
>   drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c   |   2 +-
>   drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |   2 +-
>   drivers/gpu/drm/i915/gem/i915_gem_object.c    |  12 +
>   .../drm/i915/gem/selftests/i915_gem_dmabuf.c  |  16 +-
>   drivers/gpu/drm/lima/lima_sched.c             |   4 +-
>   drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c     |   4 +-
>   drivers/gpu/drm/panfrost/panfrost_dump.c      |   4 +-
>   drivers/gpu/drm/panfrost/panfrost_perfcnt.c   |   6 +-
>   drivers/gpu/drm/qxl/qxl_object.c              |  17 +-
>   drivers/gpu/drm/qxl/qxl_prime.c               |   4 +-
>   drivers/gpu/drm/tegra/gem.c                   |  17 +-
>   drivers/infiniband/core/umem_dmabuf.c         |   7 +-
>   .../common/videobuf2/videobuf2-dma-contig.c   |  22 +-
>   .../media/common/videobuf2/videobuf2-dma-sg.c |  19 +-
>   .../common/videobuf2/videobuf2-vmalloc.c      |  17 +-
>   .../platform/nvidia/tegra-vde/dmabuf-cache.c  |   6 +-
>   drivers/misc/fastrpc.c                        |   6 +-
>   drivers/xen/gntdev-dmabuf.c                   |   8 +-
>   include/drm/drm_gem.h                         |   3 +
>   include/linux/dma-buf.h                       |  17 +-
>   29 files changed, 318 insertions(+), 155 deletions(-)
>


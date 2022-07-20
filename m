Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A314D57B2EB
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 10:29:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8746211B14F;
	Wed, 20 Jul 2022 08:29:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2086.outbound.protection.outlook.com [40.107.102.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF67B11B0C5;
 Wed, 20 Jul 2022 08:29:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N2Qfr7yrz4ZNI4Tv/Vm9Yoet+KTUlfiZ7vB/3n5izmvXi1PMw4tPohUlNr5rdIhqa7beNUBfr6rUv+9CYCuRVLfKMunZvVTIgVN0BMCw2ePP9klYiXREbU4xQeC9yn9Rg2XQeNURFQ+4yfQN8aYr5os1Z282ppLQSikcOg9eSh8mw7JKDjvtlOUtqvv4guF4iou4KPFrImNIDYS5BILp+Ir95wqfD1tnJc11uXLmzDiGAXtgbStl0Jg7MWHXa9Zcu63oOjiwffkI9myJGh1J2ADXizzA2TjO/nwcoUnZD2w8RFgdzTtUiVlDPg26Y3zw1D7GYZyHIYfdkieX7EupcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R+ZOJLZtqxPg1pMKZukdF3e/qzybtcdNG02Xi0IndsA=;
 b=Rdp3sREUzHQhdbqiADy25PQ15CbljVab9atASFDilskxVKSv7J5dzqWmJraSFWpJaLxGeNu0c+WvUiV6mDoYqvGAZg5HuyXT3BYLiZ4l2ToZ/uJWjoP+w6Y93W3RLwZ65LgEsSAFuEKrJf8mu1hJ0mSp0711N2GijrXjcWkXStDKKveUdAldBzGG/UxsaFJaEBhEK5zys/Mz0BGvq6XBCBGCW+WAd/Ii3EnEp3OL02p+PgSM1o/ls2fIj5mGzVE6Nys2+5nScsMMPGjJmNaTZYtfOoLqoxOWXuBr9oxPHjRleMkO/P9PehlxZHfLgQGkmNBVV7O/loWZRVovsJu0EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R+ZOJLZtqxPg1pMKZukdF3e/qzybtcdNG02Xi0IndsA=;
 b=ADuMcQCg9r8K0Kayf42S4fpPCiMvBRE3UQSLwC6J7+6+pNCAd/8NyRw+ANofQYVmiFepVq2s2wKiPM4WJGgnIkIJhNtQHbZp5yuuMwFcfNJxENbI8UcVxBIPxymAFUoJX0xs9X+zhJQcD6BraMHxFCg/lfkaDzSAHuzVb29j2X0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN2PR12MB3198.namprd12.prod.outlook.com (2603:10b6:208:101::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.21; Wed, 20 Jul
 2022 08:29:52 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5458.018; Wed, 20 Jul 2022
 08:29:52 +0000
Message-ID: <163d3271-e1e9-c325-185d-adb4391023e1@amd.com>
Date: Wed, 20 Jul 2022 10:29:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 4/6] dma-buf: Acquire wait-wound context on attachment
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
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas_os@shipmail.org>
References: <20220715005244.42198-1-dmitry.osipenko@collabora.com>
 <20220715005244.42198-5-dmitry.osipenko@collabora.com>
 <5ec9313e-8498-2838-0320-331c347ce905@amd.com>
 <1ce233a2-36c9-3698-59f0-c4ff902bec60@collabora.com>
 <43446124-b99a-32d8-f797-7ec0cdca9ee4@collabora.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <43446124-b99a-32d8-f797-7ec0cdca9ee4@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0476.eurprd06.prod.outlook.com
 (2603:10a6:20b:49a::35) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1e2450bb-1041-4e85-d769-08da6a2a0467
X-MS-TrafficTypeDiagnostic: MN2PR12MB3198:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WLvv5dP8RX2F4lqe+h5iJ3G2SHZCHO6d7SRIuKh4MEqbRbRxkjSsj56o/ajbJm4mD/8EZrB140gYOBXfgxn98IuXinhvonVCLVNpreHygwKho9I78XHN4SS1qsM3/1Ynfcvlyqt3LrKJKoLlez9KJ1YsURf7wPA0oq1X/Kv1qH8QNdPlkyGq9mzcpEV1WEAj64xqyyeNkbOnQByl/AvR0dGt8Dd+uViv6gJCpip4I9zl39uJzmMWkhyzL3LEYFG16ecL1CQqAYSOoJVyb6aVThGIvSyvY2pH2Ki2V1X3BlfhX3mR5xRohhmOONsRRCtaeUVoonGqBRbivWdMLs7fbHNwRyOF2iiyMoS8PQcPxuLjRXjQXMRiHHVAzOHZvrCxGfG2vI/rRSlenip4lWuV26v1txCIsQP+9O9mrueomS92c9yfiJ5YJtf8bQOUKJJ4hQnXUVrN4UnTgc0myIT6qpS5YjWElsX9zOEluYUTB1fI0Bhhae0CUVzVzObunps21ixHkgJjSGDjbwhrNbALRo0fG4tsU2RGKidgezn3Ea6g1qtlVxgOqgq9YElF18IJrhu1bCKPYGpV3HHUkcY8yGJgqX5JdAfKdopdeFYID1Fan6YvOh3EcVLu6j5fr5dhFH1IuEq98/nW4yrizSOyGVN/xKfoAVrMhRkqQn+f4KxpK6w+M0dpZSpjOZQ5Gg+knFbzw7qW+xJROnZQS5/0ssQXVZg7w9ZQ7F+/PsJ8JL42nSvxSRROzuM2FM0Rk/NzVxhPy9/jX3hQ3ju/aAamqMZoW+1xj1E6msOSMEbyV2ONPITKagnZ4swDiFJrvJjNqXTlygzxq1sYXye6g5GUa+mC81kuS3MqwZ4n+4xiKOQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(366004)(376002)(396003)(136003)(39860400002)(6506007)(53546011)(83380400001)(2906002)(41300700001)(8936002)(66574015)(5660300002)(7416002)(7406005)(6666004)(6486002)(478600001)(2616005)(316002)(6512007)(186003)(36756003)(38100700002)(31686004)(66476007)(66556008)(66946007)(4326008)(8676002)(110136005)(31696002)(86362001)(921005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QkZMNmhVd01WQU5sd1hKeVBJcFhMTzFPbS85dVVwR3BBZTBFaWtNeXhyUFNw?=
 =?utf-8?B?cEZnYTE2VTJPWExJaXJHZ0YzU1lzeFdOc1F5VTZWbnluV1c4VllEblNwVXlh?=
 =?utf-8?B?OW1taEs1a3BEWU5KTXgwSU9lSjVVdkNsVmx4OXdnQldERDVZZEsySmFqaTlx?=
 =?utf-8?B?dlFRbDg3RzlCMFNmYmJ1VHRheGFTYVo1T2NTL3hieHBteStVeE15cHUxaTBS?=
 =?utf-8?B?RnBrT1R4VWc4NzVZOHgvbGxLNkZRempwQjFIYmZ2Kzk5TnVsNTZLYXdQR0VD?=
 =?utf-8?B?cExpZ01LTHl3SDlkQ0FWcjZ5RUx4LzhlU282TkQxY2l1NDl3NVlLdkVlQmtK?=
 =?utf-8?B?dWFXMEJhRFJBVS8zdnkzZmhnb1RVRlhhOVhJeGJBZXBvNTdzM0RmZ3Y2WU5H?=
 =?utf-8?B?TDA5QWVTWFo0S0JsM09GeUdJNU11UGFNNnlDVjlaRTB1NmpXbTlBYWpGaHA3?=
 =?utf-8?B?MklQYVRZSXpaZnkzeFQwcmxOOXlSTk56WlFaaFhzN0Ezd0VkNzFpN1pHeDVN?=
 =?utf-8?B?SFdGQ2hhckJtNXFqbEVBRWMzSGlaWUJXMzZjZldLZnRob2k2OWZ5Yjd2K2hQ?=
 =?utf-8?B?OHhUTTlia1lrdllMSnNaVGlJUGVuMWtMK041MVRaaExYREttcE4xQzhSNnNK?=
 =?utf-8?B?UXVpTE9iTys5OWZRK1RmeHhTbDNBQVBrVnlVczdIZmEvY0dJUVJGaHR3Q2w1?=
 =?utf-8?B?Uk5lZC9wQzZwUGJLNW93bEt4Tm9nZS9zdkVhUEx3RXU5NFdOdnBOaklQQlpv?=
 =?utf-8?B?SHIvZy84Ylc4U2ZuVzlyVjhxeFo1MCtoUm9EbU1zd2Q2cmx0S3FmWlZXTzFr?=
 =?utf-8?B?MEFoS1RkcHcwZVBpVTVSeDdlTFdkaGNYVVdCd0NRS3ZiVHY4UVZ1dWpZSWlB?=
 =?utf-8?B?REQ2M3BvblRXK2xCa0xGc0xvM2Q0YnQzL0pkdmVHOUUwZHJDSEtxZUMzSnd2?=
 =?utf-8?B?dDdnb2I4Q0hJaXdPa2hzSHZ5b24zdmpCU2UwS1UvTlE3Nk96bXlKZFZsQytz?=
 =?utf-8?B?ZEhUWlgwdk1VVVNDY2JtUUxndDYrSXhWc0VmK3E3eUVnWnlNaENFV0VRSmZG?=
 =?utf-8?B?NU9qanNleGxrbmRxTFB5Y29NWklSZHBiQ01uQk1HNmQ3NUJud293S0NuOW02?=
 =?utf-8?B?R21nY2diWUZUNTFmVFZoYTNvMDVWVjN3TWVsQ0J4YVB3VWVacUtRV3kwWjk0?=
 =?utf-8?B?RUZTSGlLeE02ZUVoVnJPTFl1Y211aUY2ZG9JSS9qNTYxOFJudTNuZFpPcEwz?=
 =?utf-8?B?MnZjWG5MY2kwQzhwSnpIaExnL0RDcXhLRm5rUXpncGJsQ0NuQWUxK3dRbzYy?=
 =?utf-8?B?c1Yyc1NKT2w3VmxIWXVRS0xzYVk4cUYwN0s4c0ZJdnlkVm0yVGZFay9kL0dT?=
 =?utf-8?B?azV5MThJdnkwVmMyQ3NXNlpiNHlYZ2cxOTh4Y2pMdFlPMVN1Z2JDK3N5eHNK?=
 =?utf-8?B?ZVlubTNhSW5aMmdXTDFnVGphQ2JXNHE3VExHUXVpcEMzVGhKL1Z3bVB0QXpW?=
 =?utf-8?B?a0h2NlAycnJZN1pXWWtEWitBTlBFdlQ1Vzc3MEk3OWRTZWZ5Snd4b2dVR0Ft?=
 =?utf-8?B?UDY1RlhUa3Rmb3FmRmo3ZjdCbTBHVlJrUXpRcGhUZStaNzFibkhldjhoaXN5?=
 =?utf-8?B?Nis4RDJpbEVUbE9maUMrY3FLRFdkb21CV1Q5Uy94eUZwWjNoRURpS1EvRkwr?=
 =?utf-8?B?MSsrOG1uNmZqaHl5VUhCTXdFM2Z6YXk4NWsyZHY3QTFoRlRTaVdKT0UxOUU1?=
 =?utf-8?B?QURDUkVvS21RZmpZS0h4dG9HUXRFT1Z6UG1VV01VNlFhZi82L2VHS3htOExq?=
 =?utf-8?B?cVhGVTNlWUNyZUtXNFJ3T3IvaGowdFBkeHlOMzlKTFYycWQ3bTE2S0w4U2lU?=
 =?utf-8?B?Q0ZRbHM1VlB3cUNEZTNDNXZvZ0xXTU45a1N2Z1QyQW9Qdk5ieHhRRXRETFln?=
 =?utf-8?B?VEVNQzdMbit1Y2RZQnFIRnJrT3RBQmI4NGo3WlFhTzFRaGV2d2dGTkRtMGZY?=
 =?utf-8?B?QzhNUWV0NDJIelJpNHNmdDZKNEJhYVg4ZmlnNTlQaVZ5WGs5N2EzSngrSEVj?=
 =?utf-8?B?QkV6cGZ5ZGc1d0pHaGxxbk5QMmR5Rm1MdzIrSGpTQjU1d051TXpVeVFIaml3?=
 =?utf-8?B?RHRRRkgwZEVhdEJVMkpNNmoxMUJPUEtQc1ZaYXRrRTVHR25sQndkT1pIeEdv?=
 =?utf-8?Q?PuNHWYQ8aDFAsTw+mMIzPtFioocfS0aCF6/g2yMs33Nn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e2450bb-1041-4e85-d769-08da6a2a0467
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2022 08:29:52.3462 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wda2XqT0St5yc2qZ9a2h3AeB9JVXAmOHLXJDcCOg7+F1X68iVqAMI68HcQ0xlQBO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3198
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
 spice-devel@lists.freedesktop.org, Dmitry Osipenko <digetx@gmail.com>,
 kernel@collabora.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 19.07.22 um 22:05 schrieb Dmitry Osipenko:
> On 7/15/22 09:59, Dmitry Osipenko wrote:
>> On 7/15/22 09:50, Christian König wrote:
>>> Am 15.07.22 um 02:52 schrieb Dmitry Osipenko:
>>>> Intel i915 GPU driver uses wait-wound mutex to lock multiple GEMs on the
>>>> attachment to the i915 dma-buf. In order to let all drivers utilize
>>>> shared
>>>> wait-wound context during attachment in a general way, make dma-buf
>>>> core to
>>>> acquire the ww context internally for the attachment operation and update
>>>> i915 driver to use the importer's ww context instead of the internal one.
>>>>
>>>>   From now on all dma-buf exporters shall use the importer's ww context
>>>> for
>>>> the attachment operation.
>>>>
>>>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>>>> ---
>>>>    drivers/dma-buf/dma-buf.c                     |  8 +++++-
>>>>    drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |  2 +-
>>>>    .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  2 +-
>>>>    drivers/gpu/drm/i915/gem/i915_gem_object.h    |  6 ++---
>>>>    drivers/gpu/drm/i915/i915_gem_evict.c         |  2 +-
>>>>    drivers/gpu/drm/i915/i915_gem_ww.c            | 26 +++++++++++++++----
>>>>    drivers/gpu/drm/i915/i915_gem_ww.h            | 15 +++++++++--
>>>>    7 files changed, 47 insertions(+), 14 deletions(-)
>>>>
>>>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
>>>> index 0ee588276534..37545ecb845a 100644
>>>> --- a/drivers/dma-buf/dma-buf.c
>>>> +++ b/drivers/dma-buf/dma-buf.c
>>>> @@ -807,6 +807,8 @@ static struct sg_table * __map_dma_buf(struct
>>>> dma_buf_attachment *attach,
>>>>     * Optionally this calls &dma_buf_ops.attach to allow
>>>> device-specific attach
>>>>     * functionality.
>>>>     *
>>>> + * Exporters shall use ww_ctx acquired by this function.
>>>> + *
>>>>     * Returns:
>>>>     *
>>>>     * A pointer to newly created &dma_buf_attachment on success, or a
>>>> negative
>>>> @@ -822,6 +824,7 @@ dma_buf_dynamic_attach_unlocked(struct dma_buf
>>>> *dmabuf, struct device *dev,
>>>>                    void *importer_priv)
>>>>    {
>>>>        struct dma_buf_attachment *attach;
>>>> +    struct ww_acquire_ctx ww_ctx;
>>>>        int ret;
>>>>          if (WARN_ON(!dmabuf || !dev))
>>>> @@ -841,7 +844,8 @@ dma_buf_dynamic_attach_unlocked(struct dma_buf
>>>> *dmabuf, struct device *dev,
>>>>        attach->importer_ops = importer_ops;
>>>>        attach->importer_priv = importer_priv;
>>>>    -    dma_resv_lock(dmabuf->resv, NULL);
>>>> +    ww_acquire_init(&ww_ctx, &reservation_ww_class);
>>>> +    dma_resv_lock(dmabuf->resv, &ww_ctx);
>>> That won't work like this. The core property of a WW context is that you
>>> need to unwind all the locks and re-quire them with the contended one
>>> first.
>>>
>>> When you statically lock the imported one here you can't do that any more.
>> You're right. I felt that something is missing here, but couldn't
>> notice. I'll think more about this and enable
>> CONFIG_DEBUG_WW_MUTEX_SLOWPATH. Thank you!
>>
> Christian, do you think we could make an excuse for the attach()
> callback and make the exporter responsible for taking the resv lock? It
> will be inconsistent with the rest of the callbacks, where importer
> takes the lock, but it will be the simplest and least invasive solution.
> It's very messy to do a cross-driver ww locking, I don't think it's the
> right approach.

So to summarize the following calls will require that the caller hold 
the resv lock:
1. dma_buf_pin()/dma_buf_unpin()
2. dma_buf_map_attachment()/dma_buf_unmap_attachment()
3. dma_buf_vmap()/dma_buf_vunmap()
4. dma_buf_move_notify()

The following calls require that caller does not held the resv lock:
1. dma_buf_attach()/dma_buf_dynamic_attach()/dma_buf_detach()
2. dma_buf_export()/dma_buf_fd()
3. dma_buf_get()/dma_buf_put()
4. dma_buf_begin_cpu_access()/dma_buf_end_cpu_access()

If that's correct than that would work for me as well, but we should 
probably document this.

Or let me ask the other way around: What calls exactly do you need to 
change to solve your original issue? That was vmap/vunmap, wasn't it? If 
yes then let's concentrate on those for the moment.

Regards,
Christian.

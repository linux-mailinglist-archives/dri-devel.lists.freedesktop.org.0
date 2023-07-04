Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 837D8746A26
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 08:54:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C259B10E291;
	Tue,  4 Jul 2023 06:54:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2072.outbound.protection.outlook.com [40.107.93.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8E0710E291;
 Tue,  4 Jul 2023 06:54:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dvj1fwn2u1tHesNpp6W9ESBiAdtQ0zxemXtBjr7QJIoKicd/TshZbuYgHJjdiBpF7PzsH8SmjBNgQEPc3tCIpugCgt2KwGolHE4vy6dh7k7pV5gBGQhtFs/ib0fFvPaUF1ezjGfIzoSPm4CnF31/GuqFzn0LyqqJH4zU60su1nTe7DaYHa7ocM2KQ2B4FEJ4SHyB03o61FHrekO6dtcn5ufQA0lUK7zA9rlgCJXcZUtGZyp9m8GQO1K9xL5NBUvD8GztDRsHiD9YOYJ4taSh1IsDuLXcZ8ahafIeDNTpE3blVoOaWwMHA5hWWh9owGBKMAHPAG4dh5eEcJt4msbX2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9r+IcG9vMgkU43kV8nJK+/dmCKW2He5VnYhF+YcYv/I=;
 b=WjtMJpucL3m2ROfYGoNtRl08v8aaS78gHAm7jOuevYGTV0aTu/rZjipo5GtYDPbF8v6sA1jKI22RTP1DMc7bp3HmEyeu6JklB1GEBq9RRqIHFJ3RrT8iKvizjqhuQNrXDDMNTD4lqSnwlXox7JBr1haVpWYSGhGWgKfIR73ehib7WygkocK+lKFpRJ7bMR53ih+f37s4yDxseNgQTey3c3TK09561WBGxy7PQRvoZuzAm5DeMoVP5TrTvH/BdbPv4IUGc4kFlUT/VuP9N/CmG+7zDpOv1njat/DWnzTmvyUNwQ5t+UchKQzOU85Ojiwasx9kWL8lAttEXptA+MirKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9r+IcG9vMgkU43kV8nJK+/dmCKW2He5VnYhF+YcYv/I=;
 b=CvPhj5xX/klzoQzKPp77t4eNqlpTMXcA3LIJNtoADz1eam1wW4rfgA8bz9/HO7JTZqJHRi5q3hlyZzaR6WYvicJq6GJ/RfHWq91alOGBcWeZEXpJjJ7ODzNl/fzw+PfnHto34NeTWw8TYwKznrfXXauz56sbvWAqcRIsRcpa3gI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SA1PR12MB5671.namprd12.prod.outlook.com (2603:10b6:806:23b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 06:54:09 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::384a:95a4:8819:ee84]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::384a:95a4:8819:ee84%7]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 06:54:08 +0000
Message-ID: <f4bc3739-3ff1-6fa7-5d7d-890f451315bf@amd.com>
Date: Tue, 4 Jul 2023 08:54:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/amdgpu: avoid integer overflow warning in
 amdgpu_device_resize_fb_bar()
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, Alex Deucher
 <alexander.deucher@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230703123557.3355657-1-arnd@kernel.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230703123557.3355657-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0175.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::12) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SA1PR12MB5671:EE_
X-MS-Office365-Filtering-Correlation-Id: 534ba420-5c21-439c-89d5-08db7c5b76f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1FGdCCLtjMHfA7tO+khS/86HIeXPce12PftD+7xGoobf/W4f/oNqIM1WVgDyrxRf5+fOObQq8zDa+25uSIME3wsv3OqvWNS25FFBl9XgHk1qkU2n68h6KyPrsNvFnFIiRmLO83VF1NM5//ODx+0aBFy400gS3kIKk7bitW4EF50kaqOXgt2JsUIhqmYxTvJ5MYxDlysvds6FrIHcoTfICRG0m58fCsCLLEzwo3doGOL1JUnSF5Lild3CTgpIItjY94O8djPu+frxvDIp39jzPvVha8HMZ+Z8z1cabQX0PQMPVHAEb7qMwZTAp2bukZU6ACI/Raw3oRfEBak0LV/U5vxVBGvCBP/XC9ToMM37nX5C8m6oAwWJzZlpVUHum6/xulk51k4xW9y1LYo/YevoGRugucT5dVy+hCkiwxXN8ylSWoOJIlqbRTEKzSje9KM+d9ZJXqy9t5QmYC5nu4beH97dSTraZp54U1sIWCAcvz1GCa3H7f75n1AqoEvhnhpxVKWDCorw1XSJ50FGR0+rDaH50nIFYGjCsrQLD9n7YI9m6Z+SCmFaX8UM37X9qp86YYel+jVXV5nO8yTD3GCvt68ea6EkdMQwFjNUYwaNmNvFp17rW6DoGAjoP6K6rj/dpJsm9tR6XrNVm6DafbHM/Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(39860400002)(366004)(346002)(376002)(451199021)(31686004)(4326008)(66556008)(66946007)(66476007)(36756003)(316002)(478600001)(2906002)(8936002)(8676002)(5660300002)(86362001)(41300700001)(31696002)(6512007)(110136005)(54906003)(6666004)(38100700002)(6486002)(6506007)(186003)(2616005)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mk11Z051Zjcxd2VUd1QrT0ZodEdjdEFFWks2cnQ2eDBLbUl0ZzM2WDdqZGYw?=
 =?utf-8?B?Z0c1cUl5UFFCZlNrYXBRRUMrc244eVNhZDJyTXczeGpDZ1c1c3dOR3VoRjBN?=
 =?utf-8?B?UHpmdlNEMUdKM1JFeGhNSUQzTG5pcmFncXM1cjFuTkJWcUdPWjhuZ2UrcTY1?=
 =?utf-8?B?eEFTRzBHaHhod0xqUXlUaWpOU25meU9ZQXFZN1JRalNmMXRHcWxJYTFGUDc1?=
 =?utf-8?B?Y1ZNQkhheDluaDAyeFdqY1A5V0NPVTdiY3R4RGhqb3pCVWRiZDdCUzltaU1w?=
 =?utf-8?B?QklURm95cGVZVVpEZmRUV00wbldhZU9peFVjdGJRallPeXM3ZVZpVnhxUVhh?=
 =?utf-8?B?K1d6N3JKaXJuWHFENno3OXNIS0hqRW1Ga0lrRjNKRjd3NlZuN0kweDRUcEtG?=
 =?utf-8?B?cFhHQjNPdG9tUjRWUTcvcmoxeEZYdzB3MWpUQTFidGY0Ymc4ZGVzMzdibCs2?=
 =?utf-8?B?YVNkSHhUemQ0bnI4M1NuN2dPTUFjbHQyRU5NVzQ0Y1VqaUdGa2p0eTdValpv?=
 =?utf-8?B?OUZLZ1M5bVNlNnFyMDNlWS9TVCtNNFFGK05vQVVaSGhuNWQ4cjJMRXdTaVhH?=
 =?utf-8?B?MG05U2RoaXRCVDlYOEVnM29BTCtBTUNvY1QyMG9Vdmo2bXhXeDNoTytmK2E1?=
 =?utf-8?B?VXpjQ0RqazhjZXcyUFhJWWZuV2d2TEpaaEg0Skg0bE5YTDdqaGpoQldJTm1s?=
 =?utf-8?B?Wk1kcnNvY01iUmN6QjVMYzUyeG9SSHBLUHlYRW1yRm9mMnRvd1VjNW9waldX?=
 =?utf-8?B?bzYwOGE2VVB1bXFXZzFOOWhBWTdHQ2c3eFFWS1hTL3hzV0ZDeERMd0lDQnhW?=
 =?utf-8?B?ZHl1UW56T3c0VnZLS1p3MGc3VVlqMFAwYk5WYmRTZlpOb2s0aGROdHNDa1Vz?=
 =?utf-8?B?Ry9hYnNSQmRpUmZBNTNSQVFHUHYvTHRnYjBIUUNLM0F2aVNkWlVIbjc2Nlcy?=
 =?utf-8?B?SEF2ZVhPM055aGNxbmxnRGo2MHpTTkNGS3R0Z2RXelVydXNYYjQ5bS9DSllC?=
 =?utf-8?B?WGR2NjM2Q1IyNHhWcVFRdFVDUkI1YW8va24ycWxZRzhhNjN3NWlwQVRZY05v?=
 =?utf-8?B?ZW5rdmJTRHBocEtpaXAySHJndEpCaFZNbjI0L0tQWnBVTlgySkpzYVE4bTAv?=
 =?utf-8?B?N2FDUDFrL3U2aFMwZjMvdDJOaWxqNDdqS2tPL3VOc3hOTlFqU25nRGdoQXk3?=
 =?utf-8?B?SytoUzg3a0JPVklOZThXbGF5dVNtVVUxN0tkRmpZNThnOGZyYkwwQ3VBLzI0?=
 =?utf-8?B?TzlOM3p6SkNma1FBSG5lSjl3eUVhN2RZUFByd2dJNFRDbFRORFp6WGxiK1Qr?=
 =?utf-8?B?S3oyVktzVERIakkzaFJVWkRTWWZubnZPc01EZ0dTZ2poRUNib3ViM0FuNTQv?=
 =?utf-8?B?b2pxN25BVVBMWVNGNkNnUUtjQ1ZqZllBK2dsaHh5cGhLd2pVenNOay9BVWlh?=
 =?utf-8?B?YXpIa3NsZm1XZTdheFFtUHFaanBabEpBWHJZbkx3Ti9tYk9iSVRTL256dXJs?=
 =?utf-8?B?Q3M5L201L0FmY2xubFZRRngwbUFJTTRYRFQySndOeHF5VXJkb0Fad2ZHeXZJ?=
 =?utf-8?B?Q01peHBBSE8xYmRLbU9FNU1CbGpYY2E5akNjU3RZTm50Qm1pUWJpSTVIb0FE?=
 =?utf-8?B?N2VTU0tFRWlCYXREU2ZVQ1NLTURYUkE5ZkRGVHpoWU02cUhnVjdxUFhiUG8y?=
 =?utf-8?B?Q3FLd1BJaVRuNi9nZUxuNFdIRTRPd0JpUFNjeUEvbGl3TGhlakswcjRaWk1E?=
 =?utf-8?B?MEtsbitIeXR1YnlVOGdPTlFKNVhkWWtVemtWQkovZ2FiL0p3cm5OQjFuWUYv?=
 =?utf-8?B?VWd1ZVc5UzIycGNZVmNZeTlPTUFlMFh3L1FrNHFPb0FKSWpCaUYrRXUzbmgz?=
 =?utf-8?B?a0FCWFYrMTlmVEdZa05lckRyKzdndnZUdjFPb2ZJeURNd3g3TXlRYmpENVFD?=
 =?utf-8?B?VUdrNlI5TEZlZ3VoWFp2UVBObEVhOXBvY1N3MUpsQmE3VVdzNDhBelRhbmNW?=
 =?utf-8?B?YmdPVWc3bXFWbXVsRnVDbFRzWkNzOFllNG9PZG5CT0YwYmVIQTAyeGNTQ0Jx?=
 =?utf-8?B?V0ZnZHluanlEM21pSnM5TlRGNjRneEdIQi9TYWNsdnJJQ3dQMzcwK0xHdkcy?=
 =?utf-8?B?V1ordiszNzBzbTNHVmE0SjREd3h6MVRRRmRSd2UzczFSMWJmaDIvZnhQWXhF?=
 =?utf-8?Q?94PDmeq6LoJ3orLwme+wiFON6mESOSqeSyqkZ19n5bn2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 534ba420-5c21-439c-89d5-08db7c5b76f7
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2023 06:54:08.6309 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0yXJ86TZafMjfu5Qmc0NHpRJtbx8sqGyGBAA2+dBqhQW8hv3oBAuXgQM1i7NZkJb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5671
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
Cc: amd-gfx@lists.freedesktop.org,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Arnd Bergmann <arnd@arndb.de>, Bokun Zhang <Bokun.Zhang@amd.com>,
 dri-devel@lists.freedesktop.org, Lijo Lazar <lijo.lazar@amd.com>,
 linux-kernel@vger.kernel.org, Shiwu Zhang <shiwu.zhang@amd.com>,
 Le Ma <le.ma@amd.com>, YiPeng Chai <YiPeng.Chai@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 03.07.23 um 14:35 schrieb Arnd Bergmann:
> From: Arnd Bergmann <arnd@arndb.de>
>
> On 32-bit architectures comparing a resource against a value larger than
> U32_MAX can cause a warning:
>
> drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:1344:18: error: result of comparison of constant 4294967296 with expression of type 'resource_size_t' (aka 'unsigned int') is always false [-Werror,-Wtautological-constant-out-of-range-compare]
>                      res->start > 0x100000000ull)
>                      ~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
>
> The compiler is right that this cannot happen in this configuration, which
> is ok, so just add a cast to shut up the warning.

Well it doesn't make sense to compile that driver on systems with only 
32bit phys_addr_t in the first place.

It might be cleaner to just not build the whole driver on such systems 
or at least leave out this function.

Regards,
Christian

>
> Fixes: 31b8adab3247e ("drm/amdgpu: require a root bus window above 4GB for BAR resize")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 7f069e1731fee..abd13942aac5d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -1341,7 +1341,7 @@ int amdgpu_device_resize_fb_bar(struct amdgpu_device *adev)
>   
>   	pci_bus_for_each_resource(root, res, i) {
>   		if (res && res->flags & (IORESOURCE_MEM | IORESOURCE_MEM_64) &&
> -		    res->start > 0x100000000ull)
> +		    (u64)res->start > 0x100000000ull)
>   			break;
>   	}
>   


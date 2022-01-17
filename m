Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE9E490316
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 08:46:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 658CC10E396;
	Mon, 17 Jan 2022 07:46:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2066.outbound.protection.outlook.com [40.107.220.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 450F210E396
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 07:46:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a7jG1HRxHHpYOncw8HnDqruyd3karrfC/ZsBKb8BSbyQv1iYPXQDqIGm+tQEw0kaku0QaXU7nF75FC1Ah9iKzlm54a9nGc0Qh42k87pbgoOfQrg5GuRIg07QxBXIsqCEgullsGhD+X7ibLr/v99lotz0XOzSEizvHlxLrZ/QLQ7Hi2ctkM4ITaH9eiLG+9rLX/LiW1dlKJaFSK3HcCNn7aE1E6BDTrVQNSWGsgfKy3AvXANk5BTRnqpUCh/UVhEyyNFhn+tblFyhm2Meq4UUY2d5sjmPLxc9xTcj/VVNy/I6dRGMKzLFYH0/+esgyir/E9NcQhg6uSsIU7WqETFGiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WabEuyZOpi6hrDKYblBKZo897m2mA5zex7rqbD8ZYyg=;
 b=Fz77dL6BMDOWM+rqitE09tkgzeznwDteNzKhAMRuUIcDuOKEE3S7Wmp6oZoDuM3x0dgfPLO5lWKAO6hMuhCt3Cwv+C2TujX3KJgWuqtM8SkYiPza6eiKKfclx3Ad0DQCYpsQCC6Ge+WqGbzUpbnBtguIWBBwv7WTK+qenKgKJ/netqJSE1CO7RjyAl6ojGPZRsucf+YhFpALcgLRowQAS3DO4JQq+e1Af4+X2yAVabLjI8WAcUerdIg1gksYp51Fb5mheUu1DWy3md9lLJ2OD5IEB+QkF/VDKXX5juRtCPSjNCXe47yQsXibugOZeMD9ea3eUbsw1a61oHOIGseJbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WabEuyZOpi6hrDKYblBKZo897m2mA5zex7rqbD8ZYyg=;
 b=fANnBJY54iPRC/9/VrZ/FrSVF54Km99fnS5QRZEPZuz7WUdhpwc7JcqI3s4MaWuz8SvZwQaoLzFb5SyHOwcQNK1RaESv/7SjBiD0GI7D3Hd2LScLV9ifHhis9lOFeW2Ct507o/ozw9EsjKx6zLxYkiJQ5uLaSojuKEB6orWlB4E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by CH2PR12MB4214.namprd12.prod.outlook.com
 (2603:10b6:610:aa::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10; Mon, 17 Jan
 2022 07:46:33 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::b4d6:f148:3798:6246]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::b4d6:f148:3798:6246%7]) with mapi id 15.20.4888.013; Mon, 17 Jan 2022
 07:46:33 +0000
Subject: Re: [RFC 4/6] dma-buf: Add DMA-BUF exporter op to charge a DMA-BUF to
 a cgroup.
To: Hridya Valsaraju <hridya@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Arve_Hj=c3=b8nnev=c3=a5g?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 Christian Brauner <christian@brauner.io>,
 Suren Baghdasaryan <surenb@google.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Liam Mark <lmark@codeaurora.org>, Laura Abbott <labbott@redhat.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <john.stultz@linaro.org>,
 Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Dave Airlie <airlied@redhat.com>,
 Jason Ekstrand <jason@jlekstrand.net>, Matthew Auld
 <matthew.auld@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Li Li <dualli@google.com>, Marco Ballesio <balejs@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Hang Lu <hangl@codeaurora.org>,
 Wedson Almeida Filho <wedsonaf@google.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Nathan Chancellor <nathan@kernel.org>, Kees Cook <keescook@chromium.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Chris Down
 <chris@chrisdown.name>, Vipin Sharma <vipinsh@google.com>,
 Daniel Borkmann <daniel@iogearbox.net>, Vlastimil Babka <vbabka@suse.cz>,
 Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 cgroups@vger.kernel.org
References: <20220115010622.3185921-1-hridya@google.com>
 <20220115010622.3185921-5-hridya@google.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <f8c8b196-7d12-6242-97ac-38149f3a3ba3@amd.com>
Date: Mon, 17 Jan 2022 08:46:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20220115010622.3185921-5-hridya@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: AM9P193CA0027.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::32) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 30a93f9b-6168-47dc-0a3d-08d9d98d7b15
X-MS-TrafficTypeDiagnostic: CH2PR12MB4214:EE_
X-Microsoft-Antispam-PRVS: <CH2PR12MB421444557DA99F0910E9432383579@CH2PR12MB4214.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9gTzjZfAEr0M0ETpn4qCAuqyrhnfJ6Seo0O8IRNmYRR0kl+/up2s94b9joewJnjplglZBdvXHcU9xXF3WN0UpkjHfuScmDvDVMfJFehc7MmtTglUIhyMQU0Tcmcf5/++wNqG0vb6lnL8mMYOB50OS2NS2/YQHJvcHFcsvpDEx0j6JRv0VSjib1nsypYIJHKfw9Llfagv+3P1ufImTvLojLhaRP/iY7KksDabqzRlewh6Q0y2WBugeGzhC8DlJh7QhA71Jo1OtbpLUSg5vNz0f0uF2WbNtXqlAfhTb4kSRnorL7TwUYyQJlQoZUm0GAMiFp6pbqKeh7x74bD7gQoA9AqK7hau+m1Qhf5FerzlKyrF83vi2LFXbUvOAt/5/25jUXWsJsA71MctP814isEeNvQ9g2tXgVpr5p/t13+UX4VrUz4UmtLxoTrit5OhomhGNDrVQS2rR4eSrfOcz8+1pT7lV6ysimnFjB7OgztwMCOYB+vKjiDg5sB6fCY1O3OSiCfCSet8qQMbyfMVhoV2ENcZC8LPBkgqEE6boKOPr9NuEmROWtGSnpBEK8uJogwBfbple2xR4L5tIjWz+a9pwb3GiUv2G3fs5eoviLmdOSZ3JH9J2rviio2VTFNUidXOR07uQdq7wrF2AESy+T88a8DBgzW71bUpd2QIhvPcSkQ1UW6Lsd6ppxPoIgPquwKiOPiFOoLQkDyYDHcu6rx8rxq5GzTZ6wYCDESni6uU836rGXwALLxwyQRRz0ptL0N4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66476007)(36756003)(508600001)(66946007)(110136005)(2616005)(7366002)(7406005)(7416002)(6506007)(26005)(186003)(66556008)(8936002)(6512007)(83380400001)(2906002)(6486002)(31686004)(316002)(5660300002)(8676002)(31696002)(86362001)(4326008)(6666004)(38100700002)(921005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eW9rYmtjbDcyTzZ3eUIxYmxhM3c1MlJKc1dvK1l3MFJVN3FGNldvVWFrT3dO?=
 =?utf-8?B?S3Z2eDVuR2pWMUNETnpTQTJ3WGw3SWpBbk5ZVFN4d2xxVU9MeG11cjZaZ3M3?=
 =?utf-8?B?aUdJUXgrdEFlbUwzNWFXTlhsQjVjVm5BZUVPdlFDVlBjRmlDNzFyYXgxdFE3?=
 =?utf-8?B?SVJKQW1wU0NudjhRRVhNVTdEeW16a1lGcGo2ekswTlhDMnRsbjJiNlhDOGhq?=
 =?utf-8?B?SDdEVnVRMndEcFZnS1NjYWNYcFJSSnFZcmMyKzhsUk51Z3hGN1dvdjBEOG5X?=
 =?utf-8?B?S1MvdEFidjgyR1N2OEwyQlVUSEduSU9RSGhXaEFKMkxBTVh6bGwyZGEwdld6?=
 =?utf-8?B?ODlCdEp1SWZsdGVUQUVVTWw5NTg2QlZwU0ZhbXZIRkpIREJPUGZkRzRDNzc4?=
 =?utf-8?B?aVdYQ1I5ZEI3ZXBHcE9KYlk2OGNkbExMUnpTczFLbExzdlNtb0R2eUMyVEQy?=
 =?utf-8?B?MkhSVDFXUkYvMEFNa2hFWWg0VVZESnhWb0o1UlpPSXczYUl1T0djSmZjYVNl?=
 =?utf-8?B?SmVIZ2dPN2tsdm02eG9XUEI4Nk4vQmlpN2p6TGV4OHdpMXp2NkVmbVptZWlZ?=
 =?utf-8?B?RU5pdGR5Rkp6VFRYaEN5eEZxWkRUM2JXSzB2ME11M0V4YmtCbnBrUHk3Vm5Q?=
 =?utf-8?B?aGlGOXFoN1p6cjE5d0xoK3NvRStrbGhObEdLZkdBeVJEVG56M2RpME5UNldi?=
 =?utf-8?B?VzN4dG5nblVkRjhPaGN2VzNoQ012cTkzczdKYzc5RS82VmYwanF5WFlnM2pU?=
 =?utf-8?B?bTNTOEo4NXVlS1N3dk9iWFM2c2ZhOUFRbExHdTdNSGp1cmdET0NDb1VrRVpS?=
 =?utf-8?B?aWR5MUYybFllbUs3eTNmWllrOXF1Z2pPVmFjdGFPR1ZNMVFLQVgyTGE4SzVS?=
 =?utf-8?B?VFMvZGtCY0U5UWg1YzlTemxpejQxRWhUdktqQ0gxUFM4dm9JbG5RUHBLSito?=
 =?utf-8?B?U2JyQThqb2RFdjVrOGE3NUFRY0M3dFFhY0NWUVJHL2dZbi9wYndjMjBTcUJn?=
 =?utf-8?B?MjdkbThIT0RyQWdyZkU2VlJsOFF6ZlEyMm9ocWZKQ2pOVVlWOEt2dlJoTDhT?=
 =?utf-8?B?cU9ZdWJlZW9zOW4walRhQWUyZnRRQVRXTDRSMnd2enhxY1lYSEhJRjhKamRR?=
 =?utf-8?B?aVkxeWtSMDFLK0pkODBYMStieWo4dXJVU1RubW0vVXIvZlcxMk54aDl6K2t4?=
 =?utf-8?B?c1BrUm5FcjZCVlhtaFRGc0kwUE1DNThMQTBqa29mK2c3SmNIa3lGWTUrUDUw?=
 =?utf-8?B?TmJzeXFGMndPUXRLVHZqMkVzRjdNcC9maW5SQVNmQ2Nnd25xbFIxSWQ4dGNL?=
 =?utf-8?B?ZDNXNlBDOFJkR0xMMXN5RXIxVEhhVzdOMWVTQlFXcy93OE1mL2s3L0VKWlM3?=
 =?utf-8?B?Z0UzeEhadXZRMG9yYXpZWTlSRzRDcU1IYmxHVEpxdjY3aDVEY3hycFloaUh1?=
 =?utf-8?B?L0RteUR4UDRRck4rMDRBdjNRcmpWbll6WTdEOEVqUjZBZVpZMzBEMi9ka2ZZ?=
 =?utf-8?B?a3FRVzFHVDloWkY5eGdLY2oyNHhIeGxpbUJrY1FLQ0lKSmpsLzNVL0Z5L1hZ?=
 =?utf-8?B?UmtyNytyNFozS0tQT0l6ditnclpqajZqYXRRd2d0SUNCY2dnNmhWeVpsNlNO?=
 =?utf-8?B?ZEJZNzB2dklKRGh2UzFtVDdid1FXSllCdklUcklhay9WbGp6c21VYXhxbVkw?=
 =?utf-8?B?cCtudHBMNVlhVGdIMjRPYzErOHpMSEFaWXFRU1ZGbTZTRHV0eDg5R3g5cTlB?=
 =?utf-8?B?ZTlUbzhVaUlGV1J1RlM4NWdieno1VE1yVEYrUzBXb0VFZTg2dTVXN0tuOHpK?=
 =?utf-8?B?amFCQit1T1c3dnlnenk1VjNuZXRWa093YnNKdVMxd2ZCNU82SWswMFUzQ2Vn?=
 =?utf-8?B?Zy9hb25Ub3VwYjB1ZG45WCszWk9TOGFXNE9yWlJGc0VWelFMeFRlRHFteGx0?=
 =?utf-8?B?UXZnQVd3MGZ1Mm9iVEpaOUxuUEUrYjk0R2tPTWpXNE1IeFlMaithQ1VlTnh1?=
 =?utf-8?B?Z1BPN1dPL2J3bE5VWnVrdkVYcU8ybXdxMmhSdUdhTW8razFzRFFkd0Nvby9s?=
 =?utf-8?B?aWw3eXJNMmlBZjhKbkpGbVlaYUJKTmdsUkJ1dDBoVk9SRmJZWHFGQkpyTSto?=
 =?utf-8?Q?mOR8=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30a93f9b-6168-47dc-0a3d-08d9d98d7b15
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2022 07:46:33.3696 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ef7Fy2O0uzbAOR/7TNs4Oyo2ulncgn00dWcGKFIclAvbq3AuH/qzVLQthR6Ta1BF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4214
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
Cc: Kenny.Ho@amd.com, daniels@collabora.com, tjmercier@google.com,
 kaleshsingh@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 15.01.22 um 02:06 schrieb Hridya Valsaraju:
> The optional exporter op provides a way for processes to transfer
> charge of a buffer to a different process. This is essential for the
> cases where a central allocator process does allocations for various
> subsystems, hands over the fd to the client who
> requested the memory and drops all references to the allocated memory.
>
> Signed-off-by: Hridya Valsaraju <hridya@google.com>
> ---
>   include/linux/dma-buf.h | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
>
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index 7ab50076e7a6..d5e52f81cc6f 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -13,6 +13,7 @@
>   #ifndef __DMA_BUF_H__
>   #define __DMA_BUF_H__
>   
> +#include <linux/cgroup_gpu.h>
>   #include <linux/dma-buf-map.h>
>   #include <linux/file.h>
>   #include <linux/err.h>
> @@ -285,6 +286,23 @@ struct dma_buf_ops {
>   
>   	int (*vmap)(struct dma_buf *dmabuf, struct dma_buf_map *map);
>   	void (*vunmap)(struct dma_buf *dmabuf, struct dma_buf_map *map);
> +
> +	/**
> +	 * @charge_to_cgroup:
> +	 *
> +	 * This is called by an exporter to charge a buffer to the specified
> +	 * cgroup.

Well that sentence makes absolutely no sense at all.

The dma_buf_ops are supposed to be called by the DMA-buf subsystem on 
behalves of the importer and never by the exporter itself.

I hope that this is just a documentation mixup.

Regards,
Christian.

>   The caller must hold a reference to @gpucg obtained via
> +	 * gpucg_get(). The DMA-BUF will be uncharged from the cgroup it is
> +	 * currently charged to before being charged to @gpucg. The caller must
> +	 * belong to the cgroup the buffer is currently charged to.
> +	 *
> +	 * This callback is optional.
> +	 *
> +	 * Returns:
> +	 *
> +	 * 0 on success or negative error code on failure.
> +	 */
> +	int (*charge_to_cgroup)(struct dma_buf *dmabuf, struct gpucg *gpucg);
>   };
>   
>   /**


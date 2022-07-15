Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26350575FB3
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jul 2022 13:04:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB94314BA31;
	Fri, 15 Jul 2022 11:04:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2083.outbound.protection.outlook.com [40.107.237.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16C0F14BA1B;
 Fri, 15 Jul 2022 11:04:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JAaFaLPZsF/vPwiHDX3dYoY0O7lwOazI8mFAwEJ9D/tYkiM5Xrz4MKlF3gpLeJY0YwNwrj64tVn8x/faEi+rmLtxQpem8dbswzqcaQmJGD/1j06gcTpzfuNWNOCedlkvK2VlAVr7D2Jh5r9YIjm5rC+nWwujwP8vEv+lukDRTBoTuU7FXyISyOWfcwO4jTRvdW/6WOpT8PBSnZKhVXz6X5hueN8KnggeGrYryLl+vMzO5uo3zGgXDZXxqjZiS7YH147FSHljeKxidZt2TXuBiZ+MSH11zG/UMmiSvIKkE20yNhQdgRsG6+Lnbt+JEUVQZk+DmsTXJhUe04EM8W5+uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x6nwuZk6jxCDh5cJ3kvuPX4Ekl6Mq2DMQkBCuVkfDGw=;
 b=mGiwZC2SHJLNUX8F6K0JwbiLII7mBk40S1auc9jb9jCu6HEB5TMwS8riId1N/Y83RPOeflfal4lH0oM7EPYxOdhzL3Gse1fCskWJRh6V+pPiCfbJ1Frhf0iFJcp3kPoBBpPRjdo2v0MbA2YbozY3lUJGPlh68MifY5I8kAAfjsPPeTcQSnvch0emAh8/VK3FY8H4gEY+eNt+I5woguAgBJ9cjW7YDXTRO/vMCe13LIuvlOHDv+oqNrIJVQIuAc6jYiJ+/Piy2KJJR6GudvpbQ1ZIwDO7V34W3xnitaONzqcXNYOmc397OZ0p23iI/ZAIGlUPmCJhZ61baa/YOsAuzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x6nwuZk6jxCDh5cJ3kvuPX4Ekl6Mq2DMQkBCuVkfDGw=;
 b=Zchzez7v9oX/JvKQOPe0idy21fo84o0VffIT8B+g0Rp1cgXPlJG1CdYYERUueoyVJSUh1jfw9bzkisacu/mTeWu6VylAihCl92XCebzmMWHC0vQebpJaORnxcU0ecOua3uAoi4IBNd1uKN/2Nnmxhm4JqxEsD9q7cBZsbH2owDI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM6PR12MB4187.namprd12.prod.outlook.com (2603:10b6:5:212::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.23; Fri, 15 Jul
 2022 11:04:31 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5438.013; Fri, 15 Jul 2022
 11:04:31 +0000
Message-ID: <c6024ebb-4b3d-60c8-f0e7-006f994c9fae@amd.com>
Date: Fri, 15 Jul 2022 13:04:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v1 1/6] dma-buf: Add _unlocked postfix to function names
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
 <20220715005244.42198-2-dmitry.osipenko@collabora.com>
 <43c06f53-bad8-af99-0b57-781dbf716768@amd.com>
 <5c98385b-f154-0128-6f4b-5fac89529201@collabora.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <5c98385b-f154-0128-6f4b-5fac89529201@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR07CA0009.eurprd07.prod.outlook.com
 (2603:10a6:20b:46c::9) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 03ca3e4b-87ad-47c4-1e3a-08da6651cb0d
X-MS-TrafficTypeDiagnostic: DM6PR12MB4187:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hwu9HL1s/vpEK9NNLUhFqEEFCwwT70yFJas+vVnygSr4WcdgQzdpStTtgLb1JrNKmLg9YO/hpENuI58uOiWv4vOVfLml04yEZFOX0CoScjqEqWtHVvDTToBBxQ5IWgcWXhcV89ErwmP6+YlJmfvnc5+ckUwywNdZ1NMcgjDgpBFq2+6nBSVJ3c3CW9Soo9yUGVGNtyF24TIoHEAm0LwuiLnd7CCilm2C0GcAQ4EkiBckt5Z/v7i80R4zeiv7XfPuH0lAoeonRufwfbmtePUQhmbiNrusR/Wt1xN90thdj29JbUXBQZjKiPk4Las8q+t45Z3zidJHYvdQdGAbb2X2pXsdAT5EC94HaqXuMWADzYeeNuMafjiSWvFleiwegUTckXVitA0GvkBERs3IxBLSj4VwjW7QtsoR6DJnPEPoQyOuYTDe4/u5oiyHMuTyQzPJd+1hIfLbxB53o7Wrb8LdupY8u6ncPUC2SotNIXmNL1HUcciB/UNnJsIWfCUQJEJO780bTU4I+YgzeY7FRCkEe+A7zJoAELbVhqVnirroiVLOrzoESUzHfJgyjADk40Nrsu7MQTmY9v6mkgxfHLbVbbL4tZZPvuBPXW2UI1yGrkIOSZBb3pVsQOH9apkG5PDfYpNMqIVKQXiLPzUBA3MTp+WZzafAwfz34Zeb3GZBQlhyC2WlXNlgoR1KvwMbcRQStnR/u7SQz7QmIMJZRGjoqJymidjsXIF1EYH2WEO6QJR0fs2pncZArPbOeQtrnhl+FISOTxwRVJqok7xUY1ZK9FcVroWUnpRZZ0NYnXJNI5aldEzVZBj7VxUvEpxRHd5aBv7w7zUjIu1WBJ+p9LZQow6x2aEXiK9bDq4SCOuw3p8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(39860400002)(396003)(376002)(346002)(136003)(66556008)(316002)(66476007)(7416002)(4326008)(38100700002)(41300700001)(31696002)(5660300002)(2906002)(7406005)(186003)(6486002)(8676002)(6666004)(921005)(36756003)(66574015)(83380400001)(110136005)(66946007)(6512007)(8936002)(6506007)(31686004)(2616005)(478600001)(53546011)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UTFtR1A5a0NlWEI0R3pudjErN3hvWGxHbGdZYlUzU2tYUy9uY1ZOeHVxZGw2?=
 =?utf-8?B?eHlRWk9GKzZGRm9BVk85Q3h0aWFaY2VzVVo0anNXTzNEVmpGcXBVa01vZUFk?=
 =?utf-8?B?Q2V4K1NSNlM3ZFlkMjdkeUJHeHY4b0ZDWGdDVFZqb0JheGVPZjMvUnhCeHNp?=
 =?utf-8?B?K3dJMDU5Z2ozcFFrdVp3L1RWNS9ESzVLRjFzTXR1R2J2R2xLVTA5SHBGVVA2?=
 =?utf-8?B?OGZDcnc5dEl6a1JPOVZLMFpKdXRGYjQ3S3pxMlRRVDJWeUQ0M0ZjNkVQOGFh?=
 =?utf-8?B?RDVFUTM5SmNhVVhFcERUNjZITjQyRWNWbGpYODUySm9RdE9Ub2hyQU1FU0Rh?=
 =?utf-8?B?NDhTbWxQWmo2ZVJrNFYrMEpEOHFEaE1WTXJvaUtxd3hKYzlNVnVJMy9ieWQ0?=
 =?utf-8?B?Y2l2T216Zmx3cEY5SWhNdCtyNFBhejFRZ2kwazhabTNud1A3RisxTWJaaXVE?=
 =?utf-8?B?OEplQVExMHhpY2ZYc1g4bU9sYUdDYU5rU3RkcGxVRi96dXNXOUNQWXpmQUwx?=
 =?utf-8?B?TnBBcXZ2UGp3KzBxRWxuak1hZzNDd2N2eitINzIwTWdiU3F5Wmp3d2RadDFM?=
 =?utf-8?B?YzJsZ2xZdHFQUUpCK1RmanMrUWlyWXNCRzJlWU5obmxNY2hGdEhaUjRuelhi?=
 =?utf-8?B?M0xOdTRMQ2JWS3RQRHZxTlYxeUdNek9jUFZMM1Q2S0o3K3BFRUtITTlCdXp2?=
 =?utf-8?B?aWJzaElEYjhKbVhzWUllUWVTeTkrNit4STlhRzVGa1dnOWxxVDdKTkpKRGNP?=
 =?utf-8?B?ZHJ5L0c4M05iYkZzTTArUWVleFUyU2xYMXhHd0Jyank5eEJHcnpyYVhBU21R?=
 =?utf-8?B?enE5ZkxISm9IaXNMaUZVWC9CVk1GZFJha1l3YnVTQ1VZQ0RhT0ZkSm9hVzlH?=
 =?utf-8?B?akg1Y1JvUms3aHUrczdzQU52YmkzWnNsSmZuWmhIcnBla0JTN1JiaVpsVGRr?=
 =?utf-8?B?Z3c4S0V6d0xVTnl2Q2tUK1hqUU9pNVU3WGEwZ1BGN0FXSEx0aXRBUC9meksv?=
 =?utf-8?B?TkRUU3JHR09HeFRXYVRuMUtVakpwRFhNdFBvcmtCaGFzb2pNc0JHMDBKd3Ft?=
 =?utf-8?B?OWdvT0NEMUphdC9leEVqa1Brbk9qRmJFM3hCNUNDSDN0YURTdnVTMlM2elFG?=
 =?utf-8?B?RUd3ZU1JWldEaWh6aDAwT2pwamFQYU8xVHo5aWwwR0xvbUQvUEtudWxxcVRF?=
 =?utf-8?B?Z0dEc1RDZDdMMzZ2NzV5SEpaeHFsOVpiWjg2Y3pzS0RreDJCYUdIcVpqOWh1?=
 =?utf-8?B?TWFIQVB1MExOOGdIaXVNRk9Sa1pRKy9ZNHpBYkpRVDhyUUZNNSsrTVpsMGVG?=
 =?utf-8?B?TXM0NDg1QUhTU1J1anRaeFRLU1dtNVdneXQ4Q09GbWlUWTBFbDYzOWxKVHkr?=
 =?utf-8?B?eWxTWG5ZT1ZjNzJhb1Z6MGd4Q1FhWExweXdabzdhYjl0WmpNZzY2d1dkR2Iv?=
 =?utf-8?B?ZkxiTmpXWFI0ZU5OL2NVU24yNnpVT0VTODRTS3J0aUU5U2hLSE5QVmF6VTE3?=
 =?utf-8?B?U1Exd2FHVGJkT0p0eWlRQ21VK1VHQU9Ta3VzUGFxcGwxWmdPVFp1emd0RGRE?=
 =?utf-8?B?S0M1VU1sVHpITXhFd3YzbXFaMk9lNmZpZ3V4WjZrYjRuY2gyTXhlWG9rSVBZ?=
 =?utf-8?B?N2Jzazl4a1hha3FMZlZpTEFKS3NFQlpqYmh0SG5YWmN3bUtuWS9HekpWeGcr?=
 =?utf-8?B?L2JkTjRlTEJSTDN2NGhsblgzQys3cXNiWnJ1MGNXRmNoT0tCR3pQRVJESnEr?=
 =?utf-8?B?Rjhwd1NNK3FpZndMT0JpVlZTL2liQ0cxaEdHNUc0aGU5UVdPaWlJdmNQd01n?=
 =?utf-8?B?QjJzcit0elZoYmJFUitBMDFaQVU1NVNqcTE3bUpIajFSR2MzYmdzc3hhMmVN?=
 =?utf-8?B?UXZDYWhDd1N5aklWREV3ZUt3SzdWMW1sdEZQY3lnTk9pcmpxQTJYQjViTnMw?=
 =?utf-8?B?QnY1ZURxL0krUUYyYjh2OU9zMi9YWk5sVjdFbU9lUXNnczRMa05xS25EQmNM?=
 =?utf-8?B?ekJjU2tQQTViMWxrNno5ZERDaGlHb0hHcnZoRFZTZXkzM3JsaS80SFVROEFh?=
 =?utf-8?B?WkVXeE9vdHorWTFPWHE0ZUF4RUZqZmdjNTFxQml1ajl4aHcxZnpVWHlJRFBO?=
 =?utf-8?B?M0hjUkdsdW8zelR4UEpLTUlSM051bTVmRDVnbW1iWmJUVTFOcmtIa2hsQ2xJ?=
 =?utf-8?Q?LWO7z7gqcMc42JltizS1LALtTgwy7F4gZqPlkLSw+xqP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03ca3e4b-87ad-47c4-1e3a-08da6651cb0d
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2022 11:04:31.3083 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SWxf0JIvQSgFVOsGvL1oEJcveYBkNOLQpZ8Rst9LCvm3O7Qk5VVgUud1oOBUuQWa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4187
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

Am 15.07.22 um 11:31 schrieb Dmitry Osipenko:
> On 7/15/22 10:19, Christian König wrote:
>>> -struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment
>>> *attach,
>>> -                    enum dma_data_direction direction)
>>> +struct sg_table *
>>> +dma_buf_map_attachment_unlocked(struct dma_buf_attachment *attach,
>>> +                enum dma_data_direction direction)
>> The locking state of mapping and unmapping operations depend on if the
>> attachment is dynamic or not.
>>
>> So this here is not a good idea at all since it suggests that the
>> function is always called without holding the lock.
> I had the same thought while was working on this patch and initially was
> thinking about adding an "unlocked" alias to dma_buf_map_attachment().
> In the end I decided that it will create even more confusion and it's
> simpler just to rename this func here since there are only two drivers
> using the dynamic mapping.
>
> Do you have suggestions how to improve it?

Just keep it as it is. The ultimative goal is to switch all drivers over 
to the dynamic mapping or at least over to assume that the map/unmap 
callbacks are called with the lock held.

Regards,
Christian.

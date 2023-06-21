Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7145C737AA6
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 07:43:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FA6710E3B0;
	Wed, 21 Jun 2023 05:42:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2047.outbound.protection.outlook.com [40.107.223.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50AE010E3AF;
 Wed, 21 Jun 2023 05:42:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Az4ZBOegOTttbfbuk7eCeQOndgN+zKYk8XOxUNT54w69bUcS/hnXdQ9QzxJzwgb4O0eg9mcQt+QXv9tndbXAuoLfKGZGno/K7c6fwwGPTtueHllDXV+jkcgJYD4HtspRpRHUCrHi80JUJJYD93Q6mSmbrzV+uU3jzUEp1jwdm+pji/pOlWqqzVR9dFiDuWR0RHhVOVqgxOwPHwGEvLfihJrxXo7YHamd/+1Jhwfgyj0gjIdSj5V6dHqF9NGbjbyL+b8QJRIHjYf81PIQE8l+IiA9EBKZeYWSJc4eSwkYQuIe0LvUFx9NvkYQKHp9dSBZ4Sw5XWaM5o63KaqWWMgAiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zgZv+2gMHxu/0E0CpazjgZ4//rCP4La54AbpwNfO1aA=;
 b=EHTfjOBnsoYbfpUfNHvz9ip4KR2tXsy5bqOa+NCN3NCixAEYWqBX9RZEzm2TP4lLjzjNP821BTDWS4oWe2hQcTS/+4rqxPAI0jCtkG3/FHpdpbfU6dILZwyDxbiKUlVJm3O7SIAmzuTfXXx8vNNev+C8CsUusWBppaOuqEtZnuklheonGwL3xYof6pJq/OSgTgsJWI095Vqr3SBPAHNghBbdQc6evcS+RhhUQ4KY6zKdt5JQ2aqYKxet6x5KsX3GEplvU3WyQGHUdyqQHVNuIvPUOtmQsmOjVkUdKDHADLAYzdigH5CyFwtM+2Lby+Kta5Cq/I/ZdsfTMOFTt+i/uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zgZv+2gMHxu/0E0CpazjgZ4//rCP4La54AbpwNfO1aA=;
 b=q3IuvTgm83UzLvZGvlOf70xUbbpwTAcGa9k2sAlrgERSUvcHX0dNoO/XXdPR6TqbAQyhqbH+nLdxCVQMxm2rf3FTItKEcaUqUwMmXmusQxYPzIIGHnyE1ywIbDEYykhEs1WflxvxfWqRIKVps418EWx59OTww4ZQp2xeoK6/gBI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN0PR12MB5978.namprd12.prod.outlook.com (2603:10b6:208:37d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.21; Wed, 21 Jun
 2023 05:42:51 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::384a:95a4:8819:ee84]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::384a:95a4:8819:ee84%7]) with mapi id 15.20.6521.023; Wed, 21 Jun 2023
 05:42:51 +0000
Message-ID: <3ddf2152-392f-095d-3db6-c0c5c56e0cbf@amd.com>
Date: Wed, 21 Jun 2023 07:42:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 5/6] dma-buf: Change locking policy for mmap()
Content-Language: en-US
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Sumit Semwal <sumit.semwal@linaro.org>
References: <20230529223935.2672495-1-dmitry.osipenko@collabora.com>
 <20230529223935.2672495-6-dmitry.osipenko@collabora.com>
 <91466907-d4e1-1619-27a8-a49a01cbc8f1@collabora.com>
 <1a04706a-caee-114c-6b6e-e4fdb815e619@collabora.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <1a04706a-caee-114c-6b6e-e4fdb815e619@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0033.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::12) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|MN0PR12MB5978:EE_
X-MS-Office365-Filtering-Correlation-Id: bc5f793a-2ffb-487b-0b25-08db721a5a4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a+JD2ksYGqEZti4V8zVY0Yafmri8LuNsqeK+BWJ8R8zNRgGvBks0aZuLl/SXpoT1yQP2COmWB1TeYodpca+n0yAfBma2C9phFykp15DtrKpz+rbCgpd5CTZoVtDFu8GHdR/sEdAEvsbjacc8PyWGmSKHA2FT4xgkfwP9hYLI1JdtFQ6c7G73Ojdzzm6oSa0xgqHgn2IJmXWLyTytzn88joggKPtRWfAI0eCJF9/CT0A1XO6zC+950YSm4Tu13yfgiibIulDg2KUrO7DPOeMOxa4Rg9NMLlj24LGK4AaY00xziEXXkc2N39TwLlnk02NZx1FcTgyJhJIl744P4YMkVNoiruyFpN+Awa5/IsUdgX0YdPYJ6bhwPXLvT81UdbHXnY6lVb/DNosKjuc1/A3W2KrBFvgPXQUu3BJwVAUVcdwHeInJ7twUcXhr3gkx0Z87xdgE4fuNTw6yqc6R5YJyiALNq3J10EELsbMiK4pttNABAagCgJE84tn/K8PDnKISwZMFwCdobFk1Uy7l8P8DRoCKQQ2nQZfvx1QXT3JkhkEOoCWdPmzIeNKQmYFvDkajMxnoAoT2vWfcCFCi6i7obGd4uFU2pmXSJVoJ9BkqTJLoCq2tNx1GG6KmfDGBeCF+U0m1UydFhZZCop0JA+C01A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(39860400002)(136003)(396003)(376002)(366004)(451199021)(31696002)(36756003)(86362001)(31686004)(38100700002)(8676002)(8936002)(83380400001)(66476007)(186003)(6512007)(54906003)(41300700001)(6506007)(53546011)(316002)(2616005)(6666004)(478600001)(6486002)(66946007)(4326008)(66556008)(110136005)(7416002)(2906002)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHVqT2lFdGZ1NDFLVUF0Nm4ySFBmb1ozNEJ4T1pSMmVVdGpWaTNRMGpqNmtZ?=
 =?utf-8?B?WFgwOHdaNEtHWm9oNG41ZFBXOTBweTJQbXlOVm04eDdCMXJ4U0NnZUQxMGFO?=
 =?utf-8?B?Y1VoUWtpTGtSK2w4a3VaQWVDcmxzRUlkV2hma0FHdUhnWDNOYTNFSHYyekNP?=
 =?utf-8?B?R3YySFcyeGU3akxSUllnSEgwSGhBVmtTY3R0Q3Z3b25BSUIxVnJ0RXhjTC92?=
 =?utf-8?B?NDkyeEtPdVNvd3ZybXhJSDFBUXJQejJGWDNCdGpoeFQrM0Y0VzBLTTlkL3pV?=
 =?utf-8?B?Mkp5cE1rZ001c2FMd0NxQ254SGZmMTM5T0N3V2xHVjNxaU5HU1luNkpCWWg5?=
 =?utf-8?B?aXF1bG1jNVkvcmdueTlnRk1yNHBlZFJnN2FYcTcvWGFvc2xyMXNKUDRDUVVH?=
 =?utf-8?B?bkx2QnUzMkJJNDF1aHE2cjkzYkVUTWpwQ3JRZVRmVWFiM2JYRUtRZ3MydGlu?=
 =?utf-8?B?VktKWlh1RkpxRGVZQnBld2ZPS0lmK0U3S095d2dvN3JiQTY2Mnpaak1vVlgx?=
 =?utf-8?B?NlhMNUwrWjJ4YVRDdjA4MHhZQU1IOUVBbDV4Vy9qSHVIWGFGa1JKTWdzbW9q?=
 =?utf-8?B?TkVwdUJzdkV6NkZ6UUZ6L2ZyUmZ3TEpWOUE5dXA0T0NzaE9CRWttcHdjOUxx?=
 =?utf-8?B?WWNMSndxMTlvdjhWeUx4VVVMdnhzM1FwQnZJQzZDSWFxZDlJWlVIOVY1WSt5?=
 =?utf-8?B?eVpnbnVPL2k2TGJBeXNEZkRCWnYzV1JQS20wVlhaK3hXL01Ua0lvbEtrcFFv?=
 =?utf-8?B?cE9NUXl5aytxWDVvT2g2ZURUTXVqbUxHOFZ1Vm0wcGF2RUZOYUlEUTcxUXQ0?=
 =?utf-8?B?SEMrN2R0dVRmekpiOWJXQlN6TnpFSXZvazR4blZKdjVXY2x2TEQyLzFwSXlx?=
 =?utf-8?B?OUJCcTNxVTFESTc4aWllNitoYlNZbkNKZi9IUVp3a0gxdy9oRzc0Rkxvazhw?=
 =?utf-8?B?SldXYnVucTBGZi9XeFl0VXY5blp3ektCMTlCRGxiTHplTW81a2R6WGZpTi9Z?=
 =?utf-8?B?ZXU3RmQxQ3d5MlRVWEtORUNBc1kzY3hEc0MxamhlbDA0aUpCZ0JCakVrUlox?=
 =?utf-8?B?c0xWL29hS0RxTTRTbThqb2VTeDJHWmtyYklTUHBaS29HOEc3cXFrcVZGWFBv?=
 =?utf-8?B?WllQMGszVzI1Ym5JSkNHVjJVdFF1bDJibmNHZXFxY25Oc09ZS2laK1hJWHRE?=
 =?utf-8?B?czBwQXA1WW9UcVdMR0Rxc3M5NE5ranl1SFFUMmNwQk9UNmdGd0h3L2tVN0FJ?=
 =?utf-8?B?RFBBTHQrZlpPU1pzK0FXUGtFaE9aMmxUYWJNemRkcmJTR2t3amZGTVF6WFFQ?=
 =?utf-8?B?QU5paEFuZWpjMEU1bWhuYzFvZmpuQ21wVDRXUjExZWVxOWN6djRuU050TXNT?=
 =?utf-8?B?SXg2aG1VekxKa2tMTFJnZ0IraWtIZnEyaEpnL2dTVTRkRjJkTzRMSjF3RnJs?=
 =?utf-8?B?RHovQzYrWU9RYWEzNjRGMXJSUGN6NVBOd3BSVysxNDlGcFlrZ29HcERsaDE1?=
 =?utf-8?B?TGIwWHlKeG14WGwzMG8yL2U0UVZSUmt6SS9PUE90ankzT1RQdEZxWmhEMUtv?=
 =?utf-8?B?OWZad2dpdS9xUVhnSldFbGNHQXhERURnRnhURk02YTY4UlNtT3h6Y25QT1l1?=
 =?utf-8?B?emdkMFdwcnYxTmN2cjRYcmZPR2tnR3ZFOHV3SXNtbFZzdzE5b3paTllobm9q?=
 =?utf-8?B?aHdPUnlpTEJxS0FWT2NYNlFIcW9JNUpNVHRXZGFHbkEyeXBiby9vYnYxNW1t?=
 =?utf-8?B?elRiMTY5ckIzS3g5VFRtS0ErVzBNMzJQVGxKeGxJZHliSnQxRUI3Z2tCa0p3?=
 =?utf-8?B?MVVNSmNyNkI0T2ZZSGxwLzhnUWF0Y0pnWXlsb1NON2hiM3R0VWJ3Y1l1OWJH?=
 =?utf-8?B?eVlZdy9IQ2hxSmQzSGc3SVZYSWhvd0ZtK3p0OSs5OStlMnNXYmhVSUQrLzE0?=
 =?utf-8?B?U3BFY1d2RkNjWC9NN1VwZWQzOFMxZXpkaDFkbC83NmpWcllraDZtN21qNWRL?=
 =?utf-8?B?MXR2c3BBVXYxZ2V3dUxjdDhJcVNVMExYcjhnTW9aNmtHa0R5MEF1djR0NU5K?=
 =?utf-8?B?QnV1RDNwSGRTWWwyNEp4NlBOQ0J1cjhrUDJyc1JlWTNTWk9JUVF2VE95eHFZ?=
 =?utf-8?B?R05sK1F1SjloUi9jeXpOaDNQd2d4ZldvZ3l5em5XVjkvY1M4N1A1eTd3TTdX?=
 =?utf-8?Q?Gq8TtZtAEcr7Q8ghDZT5pmnCUon30ZL/HwIAY0NbKlvA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc5f793a-2ffb-487b-0b25-08db721a5a4e
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 05:42:51.6345 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fVD5WqFgVauW4MlRepXYjDI9Zj/QWnTDo41v5J6n/IWZ8YvKmIux9c7pz/utnb9b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5978
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
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 Emil Velikov <emil.l.velikov@gmail.com>, intel-gfx@lists.freedesktop.org,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tomasz Figa <tfiga@chromium.org>,
 Tomi Valkeinen <tomba@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 John Stultz <jstultz@google.com>, Gerd Hoffmann <kraxel@redhat.com>,
 linux-tegra@vger.kernel.org, kernel@collabora.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 20.06.23 um 17:58 schrieb Dmitry Osipenko:
> On 5/31/23 22:58, Dmitry Osipenko wrote:
>> On 5/30/23 01:39, Dmitry Osipenko wrote:
>>> Change locking policy of mmap() callback, making exporters responsible
>>> for handling dma-buf reservation locking. Previous locking policy stated
>>> that dma-buf is locked for both importers and exporters by the dma-buf
>>> core, which caused a deadlock problem for DRM drivers in a case of
>>> self-imported dma-bufs which required to take the lock from the DRM
>>> exporter side.
>>>
>>> Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
>>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>>> ---
>>>   drivers/dma-buf/dma-buf.c | 17 +++--------------
>>>   1 file changed, 3 insertions(+), 14 deletions(-)
>> Christian, you acked the drm patch of this series sometime ago, perhaps
>> it also implies implicit ack to this patch, but I'd prefer to have the
>> explicit ack. I'll apply this series to drm-misc later this week if
>> you'll approve this dma-buf change. Thanks in advance!
> I'll merge the patches tomorrow. If there are any additional comments,
> then please don't hesitate to post them.

Sorry for not responding earlier, I have been moving both my office as 
well as my household and still catching up.

I don't have time for an in-deep review, but my ack stands for the whole 
series.

Regards,
Christian.

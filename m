Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B9387902F
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 09:59:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8589210EF2F;
	Tue, 12 Mar 2024 08:59:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="cCit8WhV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2058.outbound.protection.outlook.com [40.107.220.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2F4B10EF2F
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 08:59:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ieMBDkBF6IRcRMdzvvqd70VU3/jlO7SgYWc8gZUqzoG8aYR0thbpoF/SK8axXpi1PHdOEaZ7AKb2zHbwxOA3xNsWHlp0OeOZjRP1R3FQLAATy7HHB1lqDNR0TSTHtBwf0oB21cy38EtG/VX+Euagg6btpj77CTaADiirIlVh8ZRM+hRY57WSvDdt/zN1r0HrCwETJEsJu3XKSzjcr47UmeqiuNzUjZxuRCU+3anMVK8P6SfjXog6CStTdqcTN8Qd1Dq9VeGQB+XJjS4NMmKQGQ4VueNK4YnAEIvOtZ5T0gnG5V/96VGhnqMwjW7NvxWf7ekoG2+VhBCye0PeKPLSKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x1rq101jTDJaa05mviYSgQWccVr67H/IaFXLb9wPiT8=;
 b=Aff3YRKiYbsq2uzPkx59bCJug2QaGDNHLTvcfydylWnPLUYxHaxP7p4NW8DftVwBSL28QxQH86XjIqm0sibWaPtOwrEFbBisE/txdY8nLYOOMXQDlcFDb8OWMDeVL8kExSMgI7eGAuhD6qX27/Hu4DZn//AXppDPtHDHejcYlJ3KWf84McjYtGSlcXpX1/tdkyUcizZBb30IDTy4Wq/dssYk7X+1oVJZkOhmOwQHTVvWnqx8B1uskZUgYzIYwMpHGfwZuGyBhvjai7TKfCslXZOZOldH+/QgWDqeDXipPLAhZ1jZNtWfJXp7DaiBa05dunAPpb10SfVlBafv3+Zr/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x1rq101jTDJaa05mviYSgQWccVr67H/IaFXLb9wPiT8=;
 b=cCit8WhVGSEbdXfyDtk5jgsLRmWRjs9b4FdD6ys8YpOTFHOywY+eFoSs6eM5AwiQmfM0qy2h18EMPw1iS4LexBJhIkdTcbQpYdmdjc1l8R+uH8PcGZP28ruDmDP019LHOLjPvd3Mggn9uJiPpzYM2fjsZu9sDHwK6THWnqJoJ64=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ0PR12MB7082.namprd12.prod.outlook.com (2603:10b6:a03:4ae::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.35; Tue, 12 Mar
 2024 08:59:42 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7362.031; Tue, 12 Mar 2024
 08:59:42 +0000
Message-ID: <3a5d07c0-120f-47f9-a35a-31f3bfcc9330@amd.com>
Date: Tue, 12 Mar 2024 09:59:26 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] drm/gem: Add a mountpoint parameter to
 drm_gem_object_init()
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 Russell King <linux@armlinux.org.uk>, Lucas Stach <l.stach@pengutronix.de>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Sui Jingfeng <suijingfeng@loongson.cn>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Thierry Reding
 <thierry.reding@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Huang Rui <ray.huang@amd.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Karolina Stolarek <karolina.stolarek@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
References: <20240311100959.205545-1-mcanal@igalia.com>
 <20240311100959.205545-3-mcanal@igalia.com>
 <30a7f20b-1f2c-41cb-b193-03429c160b63@igalia.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <30a7f20b-1f2c-41cb-b193-03429c160b63@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0148.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ0PR12MB7082:EE_
X-MS-Office365-Filtering-Correlation-Id: a55de3c9-a734-46e6-bce1-08dc4272c172
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WPU/joUqgn2zcUhMTUA9n9oGgpp5ujOsw4lGBD74TWEYjuM2BW/mjYianu9vxVvQCrqyCdBOy6RBBBZDjes31iZfXgg7abmfNhcOLD31c6Z9rf6P9lm9Qs4/O6ARd7n1OBvhMH5xl95jLZKfZ50SAGDNBEeFOn0oN1qiJssoN2OX/NpA0DpnW0IXL+P3c/CuSSpfaMdPJex9A6hV45a8w+IyeMTJemdoCQoR8G2lhP4+LYsRldNluePt5XT87Qit7oixe79grW79QvjP2pO/aqkd9Mzf7pWn+xd96wjYpCi7P9nI4lxRM0pQhFNrtgHdFzfo13SIz6bhqTc0ty+T6P+mWXXQ3iv9G7GuCmUkB1SxlFr93qwmDv63mr8OwmRX71ZpTU0BNFoqm+/ABulRi/LB7rylLd31BIxYVgS/IDMr7tCN0RTzYVShmepoueT0b+05QCgSVHyEtJxE5WmqyOIwwJqCPSQhvOK0y8DJE7cPXunMuJcksC59gEnzaRVphGUhv9DrU5soQG5WDbnloI/KA2pM5AEc/AiiHV1Ec59BA2K3bReoKo/C9J8XoCDRapVZ15VTooPfuJZDIg2aRJr+VtapvuCuQsq8R7An/JQGIi7bQa9r0zzrQrCfSAYNzFYdDIZVqOn7C20E9RG38WV4EZLsqkjYMZB7IowgoPc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7416005)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFRldzVQOUo5N0NkZ1A4TllWTW1ick9WcGdDckNPbXhrNTMvREpvekFCVExq?=
 =?utf-8?B?S3pibE5zS2FaWGJnUFhkQ3VDN1NYcXd1YXAycitoYTNkRDlVUWFvRnlWeitR?=
 =?utf-8?B?OUZOdzhKNUtsdVY2ME95WDcvRyswMmRyYjZxT2pibnFiNkdLRmJwN3BOaWRH?=
 =?utf-8?B?cXgwSGUyWTlWWjdlb05XYTFLeWYva0JxRVh5VkJqVXVpZ01tN0pPS3FraFpP?=
 =?utf-8?B?YWwrRzg5L0ZGakdsR0t4L2hUN1JSdVJGSmxlTEN5YjFEaHBlVnZpNjBTa2hZ?=
 =?utf-8?B?eDc0U016d2RjZE1WM0VSdUIwc3dTL3VoY2VLOTk2ODhEQ0x5QzlXRHQ1cUR2?=
 =?utf-8?B?aUZFZXRDMVNXZTRRa3dGdVlVcC92LzMzc1hsd0Rtbk54S3FlZE9NeU9TSzMz?=
 =?utf-8?B?YXhvSFp2TkNYTTFocy9nOXFCT2xRZ05GOHRaOTYyK1J2WE11SEh4N1dSYTUz?=
 =?utf-8?B?eGJ2M0h4dldsSHU4KzgvNHEvdk4xaUxFSW9PRVFDbHR5TnlNOFVQYmRBM3FY?=
 =?utf-8?B?ZzdCMEpIUXhhVFA4MER4MzBBYzJTNUlndFJua1BhZ3BacWxLa2NtQUZoNlFF?=
 =?utf-8?B?ZDVwSzZnK3ZhTnQ3VmZicW0wQnpTRCtwV2NZL0Z0N25sZEVScTB5WG5RUG1U?=
 =?utf-8?B?TkpTaHcwK0N1QTdCSVIrTXh6VU9ZOHMvZW5OK0xjZTNQeUo5cWZhOTQ0eVpm?=
 =?utf-8?B?Q2N5eXg2STNvMmxxOGI2VXBPaEQrczYyUDNXSUFGdGVZeDc4U0x4ZUlvSUtr?=
 =?utf-8?B?eVhwMXYzdDk1VmFhYkhhZVh3Q25FOHpwVFpGaHJRUUxaRDRyQlJMTWMzVnpL?=
 =?utf-8?B?M3h6V0JyaHdtTERCSm1weEhXcVI1VkhHOEliOUhkbDNpajdHU1N5ZTFwci9C?=
 =?utf-8?B?UVcxL3p3OVFDMHRIbEdHZy94Sm9zTVFvV0tLU0Q4VVQ3aFJZUy9TdnZpb1pP?=
 =?utf-8?B?R2I5cUVVbitlRWh0M0V5bEpmdFdSZCtmbFVZcStORlBMMG9ubXBPak5nc1lT?=
 =?utf-8?B?WlkvWVo2TmJIenRQUVk3STJzT1lCaFBlV2xHSFJ1YVVLNWpYVG93RVJnWFBv?=
 =?utf-8?B?VHFZazM0aXJaeXg4MEs2T0UxYVM3c2JGYURmVkxGYnZYMEptek9vb25ZakFl?=
 =?utf-8?B?MnZKZzN0YUE5c0kxM3hhRTFFY0V0MW5BRkwzUWZRSlpVV0gvS3lNNXZzR3RD?=
 =?utf-8?B?UXpjNXI5TVZOdndkaVZxUHB1NTNYOUh0VDk0QzhXM3F1OHAxQWRzYTViRkh2?=
 =?utf-8?B?MGwxaGpKekdiamlFY1N5MGNxWVU2T3pBc0pkQVRwdStuTXZhdDNSTGNVTTl1?=
 =?utf-8?B?R2poMkR5RG1LUWkzeXJJWWcwTE85eWFpcnJ0bmNJS1FtaHY0a0w3b0x0RldY?=
 =?utf-8?B?NkI0aDhuN0ZTanlpTW0rb1JoRGNRbnZ1Znh6SFZaNjBFVHNsUkZaRWltazJz?=
 =?utf-8?B?a1lZY3kweGZSOVJhdVFTY3RpQnhGdzlHWnczRm50RE4xSHp6L3luNFhLQmRI?=
 =?utf-8?B?SVFXb1RyYjlveEc3NnhaeXhuOTRDdGVrcC94NDdJdzhSOHc4QVh2TkMzVXU0?=
 =?utf-8?B?eWdoRnJmYXVYNGdYekZjZzJqSDBCYktoc2FqZUR6THAwR1pTbEt6dGw0S1M0?=
 =?utf-8?B?ajkvN2h5aUphbCtKNWRjQnBJUTlFUUN6MFFldll1eXhkSFJmSWhRSUNYam5k?=
 =?utf-8?B?OGt4TzllQXBDVzBmU3JQU1hJVlpSTWtURnN3NW9pK3JvYVZ3MGJ6ZlZBQUlF?=
 =?utf-8?B?Y2Y2bUNGY2JhbHpKdGkyMTd3VHVZZlNJbEs5cjV2dTVOOEF0eVNRMEdxdFNJ?=
 =?utf-8?B?aHNzV2EyM2o2dXdXelArbVNSUzVNZmlna3pEd1FnZFQvYVhBS2hUb1RkUjVD?=
 =?utf-8?B?cTArVzFiUkFncFJkTlphRC9HaitXc2xFSXpDVk9od0FMRXlrcUdmRVB0a2NE?=
 =?utf-8?B?cWN1TDRMRXdiaGNxZVo1cHlHdFU2MzdXUHp1cUhubWJBVkxsQ1FvcG9GWG9r?=
 =?utf-8?B?UHZHV3NkcmFySVB4L2xsV0hFbDRQU1Q3Tkg2ZzhmcjV2UFczYVJIcldna2ZU?=
 =?utf-8?B?dTJxb0NZd0VPM2xXQndKbjdLRG1ERmNrSXJLZDlYZTJNeVFCb0huZjIyTWpv?=
 =?utf-8?Q?mBli8ZnTbGQ7SQAtcvpbvT2AZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a55de3c9-a734-46e6-bce1-08dc4272c172
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2024 08:59:42.0357 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xMnOXaG8hd9pwG7BJijduq1fmeBQQd+SPrYVCCgmarnR5SKL2Vy7syFfytaMXAB5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7082
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 12.03.24 um 09:51 schrieb Tvrtko Ursulin:
>
> Hi Maira,
>
> On 11/03/2024 10:05, Maíra Canal wrote:
>> For some applications, such as using huge pages, we might want to have a
>> different mountpoint, for which we pass in mount flags that better match
>> our usecase.
>>
>> Therefore, add a new parameter to drm_gem_object_init() that allow us to
>> define the tmpfs mountpoint where the GEM object will be created. If
>> this parameter is NULL, then we fallback to shmem_file_setup().
>
> One strategy for reducing churn, and so the number of drivers this 
> patch touches, could be to add a lower level drm_gem_object_init() 
> (which takes vfsmount, call it __drm_gem_object_init(), or 
> drm__gem_object_init_mnt(), and make drm_gem_object_init() call that 
> one with a NULL argument.

I would even go a step further into the other direction. The shmem 
backed GEM object is just some special handling as far as I can see.

So I would rather suggest to rename all drm_gem_* function which only 
deal with the shmem backed GEM object into drm_gem_shmem_*.

Also the explanation why a different mount point helps with something 
isn't very satisfying.

Regards,
Christian.

>
> Regards,
>
> Tvrtko
>
>>
>> Cc: Russell King <linux@armlinux.org.uk>
>> Cc: Lucas Stach <l.stach@pengutronix.de>
>> Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
>> Cc: Inki Dae <inki.dae@samsung.com>
>> Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
>> Cc: Kyungmin Park <kyungmin.park@samsung.com>
>> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Cc: Alim Akhtar <alim.akhtar@samsung.com>
>> Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
>> Cc: Sui Jingfeng <suijingfeng@loongson.cn>
>> Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
>> Cc: Philipp Zabel <p.zabel@pengutronix.de>
>> Cc: Matthias Brugger <matthias.bgg@gmail.com>
>> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> Cc: Rob Clark <robdclark@gmail.com>
>> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Cc: Sean Paul <sean@poorly.run>
>> Cc: Marijn Suijten <marijn.suijten@somainline.org>
>> Cc: Karol Herbst <kherbst@redhat.com>
>> Cc: Lyude Paul <lyude@redhat.com>
>> Cc: Danilo Krummrich <dakr@redhat.com>
>> Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> Cc: Gerd Hoffmann <kraxel@redhat.com>
>> Cc: Sandy Huang <hjc@rock-chips.com>
>> Cc: "Heiko Stübner" <heiko@sntech.de>
>> Cc: Andy Yan <andy.yan@rock-chips.com>
>> Cc: Thierry Reding <thierry.reding@gmail.com>
>> Cc: Mikko Perttunen <mperttunen@nvidia.com>
>> Cc: Jonathan Hunter <jonathanh@nvidia.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Huang Rui <ray.huang@amd.com>
>> Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>> Cc: Karolina Stolarek <karolina.stolarek@intel.com>
>> Cc: Andi Shyti <andi.shyti@linux.intel.com>
>> Signed-off-by: Maíra Canal <mcanal@igalia.com>
>> ---
>>   drivers/gpu/drm/armada/armada_gem.c           |  2 +-
>>   drivers/gpu/drm/drm_gem.c                     | 12 ++++++++++--
>>   drivers/gpu/drm/drm_gem_dma_helper.c          |  2 +-
>>   drivers/gpu/drm/drm_gem_shmem_helper.c        |  2 +-
>>   drivers/gpu/drm/drm_gem_vram_helper.c         |  2 +-
>>   drivers/gpu/drm/etnaviv/etnaviv_gem.c         |  2 +-
>>   drivers/gpu/drm/exynos/exynos_drm_gem.c       |  2 +-
>>   drivers/gpu/drm/gma500/gem.c                  |  2 +-
>>   drivers/gpu/drm/loongson/lsdc_ttm.c           |  2 +-
>>   drivers/gpu/drm/mediatek/mtk_drm_gem.c        |  2 +-
>>   drivers/gpu/drm/msm/msm_gem.c                 |  2 +-
>>   drivers/gpu/drm/nouveau/nouveau_gem.c         |  2 +-
>>   drivers/gpu/drm/nouveau/nouveau_prime.c       |  2 +-
>>   drivers/gpu/drm/omapdrm/omap_gem.c            |  2 +-
>>   drivers/gpu/drm/qxl/qxl_object.c              |  2 +-
>>   drivers/gpu/drm/rockchip/rockchip_drm_gem.c   |  2 +-
>>   drivers/gpu/drm/tegra/gem.c                   |  2 +-
>>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c |  2 +-
>>   drivers/gpu/drm/xen/xen_drm_front_gem.c       |  2 +-
>>   include/drm/drm_gem.h                         |  3 ++-
>>   20 files changed, 30 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/armada/armada_gem.c 
>> b/drivers/gpu/drm/armada/armada_gem.c
>> index 26d10065d534..36a25e667341 100644
>> --- a/drivers/gpu/drm/armada/armada_gem.c
>> +++ b/drivers/gpu/drm/armada/armada_gem.c
>> @@ -226,7 +226,7 @@ static struct armada_gem_object 
>> *armada_gem_alloc_object(struct drm_device *dev,
>>
>>       obj->obj.funcs = &armada_gem_object_funcs;
>>
>> -    if (drm_gem_object_init(dev, &obj->obj, size)) {
>> +    if (drm_gem_object_init(dev, &obj->obj, size, NULL)) {
>>           kfree(obj);
>>           return NULL;
>>       }
>> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
>> index 44a948b80ee1..ddd8777fcda5 100644
>> --- a/drivers/gpu/drm/drm_gem.c
>> +++ b/drivers/gpu/drm/drm_gem.c
>> @@ -118,18 +118,26 @@ drm_gem_init(struct drm_device *dev)
>>    * @dev: drm_device the object should be initialized for
>>    * @obj: drm_gem_object to initialize
>>    * @size: object size
>> + * @gemfs: tmpfs mount where the GEM object will be created. If 
>> NULL, use
>> + * the usual tmpfs mountpoint (`shm_mnt`).
>>    *
>>    * Initialize an already allocated GEM object of the specified size 
>> with
>>    * shmfs backing store.
>>    */
>>   int drm_gem_object_init(struct drm_device *dev,
>> -            struct drm_gem_object *obj, size_t size)
>> +            struct drm_gem_object *obj, size_t size,
>> +            struct vfsmount *gemfs)
>>   {
>>       struct file *filp;
>>
>>       drm_gem_private_object_init(dev, obj, size);
>>
>> -    filp = shmem_file_setup("drm mm object", size, VM_NORESERVE);
>> +    if (gemfs)
>> +        filp = shmem_file_setup_with_mnt(gemfs, "drm mm object", size,
>> +                         VM_NORESERVE);
>> +    else
>> +        filp = shmem_file_setup("drm mm object", size, VM_NORESERVE);
>> +
>>       if (IS_ERR(filp))
>>           return PTR_ERR(filp);
>>
>> diff --git a/drivers/gpu/drm/drm_gem_dma_helper.c 
>> b/drivers/gpu/drm/drm_gem_dma_helper.c
>> index 870b90b78bc4..9ada5ac85dd6 100644
>> --- a/drivers/gpu/drm/drm_gem_dma_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_dma_helper.c
>> @@ -95,7 +95,7 @@ __drm_gem_dma_create(struct drm_device *drm, size_t 
>> size, bool private)
>>           /* Always use writecombine for dma-buf mappings */
>>           dma_obj->map_noncoherent = false;
>>       } else {
>> -        ret = drm_gem_object_init(drm, gem_obj, size);
>> +        ret = drm_gem_object_init(drm, gem_obj, size, NULL);
>>       }
>>       if (ret)
>>           goto error;
>> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c 
>> b/drivers/gpu/drm/drm_gem_shmem_helper.c
>> index e435f986cd13..15635b330ca8 100644
>> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
>> @@ -77,7 +77,7 @@ __drm_gem_shmem_create(struct drm_device *dev, 
>> size_t size, bool private)
>>           drm_gem_private_object_init(dev, obj, size);
>>           shmem->map_wc = false; /* dma-buf mappings use always 
>> writecombine */
>>       } else {
>> -        ret = drm_gem_object_init(dev, obj, size);
>> +        ret = drm_gem_object_init(dev, obj, size, NULL);
>>       }
>>       if (ret) {
>>           drm_gem_private_object_fini(obj);
>> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c 
>> b/drivers/gpu/drm/drm_gem_vram_helper.c
>> index 75f2eaf0d5b6..90649899dbef 100644
>> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
>> @@ -210,7 +210,7 @@ struct drm_gem_vram_object 
>> *drm_gem_vram_create(struct drm_device *dev,
>>       if (!gem->funcs)
>>           gem->funcs = &drm_gem_vram_object_funcs;
>>
>> -    ret = drm_gem_object_init(dev, gem, size);
>> +    ret = drm_gem_object_init(dev, gem, size, NULL);
>>       if (ret) {
>>           kfree(gbo);
>>           return ERR_PTR(ret);
>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c 
>> b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
>> index 71a6d2b1c80f..aa4b61c48b7f 100644
>> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
>> @@ -596,7 +596,7 @@ int etnaviv_gem_new_handle(struct drm_device 
>> *dev, struct drm_file *file,
>>
>>       lockdep_set_class(&to_etnaviv_bo(obj)->lock, 
>> &etnaviv_shm_lock_class);
>>
>> -    ret = drm_gem_object_init(dev, obj, size);
>> +    ret = drm_gem_object_init(dev, obj, size, NULL);
>>       if (ret)
>>           goto fail;
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c 
>> b/drivers/gpu/drm/exynos/exynos_drm_gem.c
>> index 638ca96830e9..c50c0d12246e 100644
>> --- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
>> +++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
>> @@ -160,7 +160,7 @@ static struct exynos_drm_gem 
>> *exynos_drm_gem_init(struct drm_device *dev,
>>
>>       obj->funcs = &exynos_drm_gem_object_funcs;
>>
>> -    ret = drm_gem_object_init(dev, obj, size);
>> +    ret = drm_gem_object_init(dev, obj, size, NULL);
>>       if (ret < 0) {
>>           DRM_DEV_ERROR(dev->dev, "failed to initialize gem object\n");
>>           kfree(exynos_gem);
>> diff --git a/drivers/gpu/drm/gma500/gem.c b/drivers/gpu/drm/gma500/gem.c
>> index 4b7627a72637..315e085dc9ee 100644
>> --- a/drivers/gpu/drm/gma500/gem.c
>> +++ b/drivers/gpu/drm/gma500/gem.c
>> @@ -169,7 +169,7 @@ psb_gem_create(struct drm_device *dev, u64 size, 
>> const char *name, bool stolen,
>>       if (stolen) {
>>           drm_gem_private_object_init(dev, obj, size);
>>       } else {
>> -        ret = drm_gem_object_init(dev, obj, size);
>> +        ret = drm_gem_object_init(dev, obj, size, NULL);
>>           if (ret)
>>               goto err_release_resource;
>>
>> diff --git a/drivers/gpu/drm/loongson/lsdc_ttm.c 
>> b/drivers/gpu/drm/loongson/lsdc_ttm.c
>> index 465f622ac05d..d392ea66d72e 100644
>> --- a/drivers/gpu/drm/loongson/lsdc_ttm.c
>> +++ b/drivers/gpu/drm/loongson/lsdc_ttm.c
>> @@ -458,7 +458,7 @@ struct lsdc_bo *lsdc_bo_create(struct drm_device 
>> *ddev,
>>
>>       size = ALIGN(size, PAGE_SIZE);
>>
>> -    ret = drm_gem_object_init(ddev, &tbo->base, size);
>> +    ret = drm_gem_object_init(ddev, &tbo->base, size, NULL);
>>       if (ret) {
>>           kfree(lbo);
>>           return ERR_PTR(ret);
>> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c 
>> b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
>> index 4f2e3feabc0f..261d386921dc 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
>> @@ -44,7 +44,7 @@ static struct mtk_drm_gem_obj 
>> *mtk_drm_gem_init(struct drm_device *dev,
>>
>>       mtk_gem_obj->base.funcs = &mtk_drm_gem_object_funcs;
>>
>> -    ret = drm_gem_object_init(dev, &mtk_gem_obj->base, size);
>> +    ret = drm_gem_object_init(dev, &mtk_gem_obj->base, size, NULL);
>>       if (ret < 0) {
>>           DRM_ERROR("failed to initialize gem object\n");
>>           kfree(mtk_gem_obj);
>> diff --git a/drivers/gpu/drm/msm/msm_gem.c 
>> b/drivers/gpu/drm/msm/msm_gem.c
>> index 175ee4ab8a6f..6fe17cf28ef6 100644
>> --- a/drivers/gpu/drm/msm/msm_gem.c
>> +++ b/drivers/gpu/drm/msm/msm_gem.c
>> @@ -1222,7 +1222,7 @@ struct drm_gem_object *msm_gem_new(struct 
>> drm_device *dev, uint32_t size, uint32
>>
>>           vma->iova = physaddr(obj);
>>       } else {
>> -        ret = drm_gem_object_init(dev, obj, size);
>> +        ret = drm_gem_object_init(dev, obj, size, NULL);
>>           if (ret)
>>               goto fail;
>>           /*
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c 
>> b/drivers/gpu/drm/nouveau/nouveau_gem.c
>> index 49c2bcbef129..434325fa8752 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
>> @@ -262,7 +262,7 @@ nouveau_gem_new(struct nouveau_cli *cli, u64 
>> size, int align, uint32_t domain,
>>
>>       /* Initialize the embedded gem-object. We return a single 
>> gem-reference
>>        * to the caller, instead of a normal nouveau_bo ttm reference. */
>> -    ret = drm_gem_object_init(drm->dev, &nvbo->bo.base, size);
>> +    ret = drm_gem_object_init(drm->dev, &nvbo->bo.base, size, NULL);
>>       if (ret) {
>>           drm_gem_object_release(&nvbo->bo.base);
>>           kfree(nvbo);
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_prime.c 
>> b/drivers/gpu/drm/nouveau/nouveau_prime.c
>> index 1b2ff0c40fc1..c9b3572df555 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_prime.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_prime.c
>> @@ -62,7 +62,7 @@ struct drm_gem_object 
>> *nouveau_gem_prime_import_sg_table(struct drm_device *dev,
>>
>>       /* Initialize the embedded gem-object. We return a single 
>> gem-reference
>>        * to the caller, instead of a normal nouveau_bo ttm reference. */
>> -    ret = drm_gem_object_init(dev, &nvbo->bo.base, size);
>> +    ret = drm_gem_object_init(dev, &nvbo->bo.base, size, NULL);
>>       if (ret) {
>>           nouveau_bo_ref(NULL, &nvbo);
>>           obj = ERR_PTR(-ENOMEM);
>> diff --git a/drivers/gpu/drm/omapdrm/omap_gem.c 
>> b/drivers/gpu/drm/omapdrm/omap_gem.c
>> index 3421e8389222..53b4ec64c7b0 100644
>> --- a/drivers/gpu/drm/omapdrm/omap_gem.c
>> +++ b/drivers/gpu/drm/omapdrm/omap_gem.c
>> @@ -1352,7 +1352,7 @@ struct drm_gem_object *omap_gem_new(struct 
>> drm_device *dev,
>>       if (!(flags & OMAP_BO_MEM_SHMEM)) {
>>           drm_gem_private_object_init(dev, obj, size);
>>       } else {
>> -        ret = drm_gem_object_init(dev, obj, size);
>> +        ret = drm_gem_object_init(dev, obj, size, NULL);
>>           if (ret)
>>               goto err_free;
>>
>> diff --git a/drivers/gpu/drm/qxl/qxl_object.c 
>> b/drivers/gpu/drm/qxl/qxl_object.c
>> index 1e46b0a6e478..45d7abe26ebd 100644
>> --- a/drivers/gpu/drm/qxl/qxl_object.c
>> +++ b/drivers/gpu/drm/qxl/qxl_object.c
>> @@ -123,7 +123,7 @@ int qxl_bo_create(struct qxl_device *qdev, 
>> unsigned long size,
>>       if (bo == NULL)
>>           return -ENOMEM;
>>       size = roundup(size, PAGE_SIZE);
>> -    r = drm_gem_object_init(&qdev->ddev, &bo->tbo.base, size);
>> +    r = drm_gem_object_init(&qdev->ddev, &bo->tbo.base, size, NULL);
>>       if (unlikely(r)) {
>>           kfree(bo);
>>           return r;
>> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c 
>> b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
>> index 93ed841f5dce..daba285bd78f 100644
>> --- a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
>> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
>> @@ -295,7 +295,7 @@ static struct rockchip_gem_object *
>>
>>       obj->funcs = &rockchip_gem_object_funcs;
>>
>> -    drm_gem_object_init(drm, obj, size);
>> +    drm_gem_object_init(drm, obj, size, NULL);
>>
>>       return rk_obj;
>>   }
>> diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
>> index b4eb030ea961..63f10d5a57ba 100644
>> --- a/drivers/gpu/drm/tegra/gem.c
>> +++ b/drivers/gpu/drm/tegra/gem.c
>> @@ -311,7 +311,7 @@ static struct tegra_bo 
>> *tegra_bo_alloc_object(struct drm_device *drm,
>>       host1x_bo_init(&bo->base, &tegra_bo_ops);
>>       size = round_up(size, PAGE_SIZE);
>>
>> -    err = drm_gem_object_init(drm, &bo->gem, size);
>> +    err = drm_gem_object_init(drm, &bo->gem, size, NULL);
>>       if (err < 0)
>>           goto free;
>>
>> diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c 
>> b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
>> index 7b7c1fa805fc..a9bf7d5a887c 100644
>> --- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
>> +++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
>> @@ -61,7 +61,7 @@ struct ttm_buffer_object *ttm_bo_kunit_init(struct 
>> kunit *test,
>>       KUNIT_ASSERT_NOT_NULL(test, bo);
>>
>>       bo->base = gem_obj;
>> -    err = drm_gem_object_init(devs->drm, &bo->base, size);
>> +    err = drm_gem_object_init(devs->drm, &bo->base, size, NULL);
>>       KUNIT_ASSERT_EQ(test, err, 0);
>>
>>       bo->bdev = devs->ttm_dev;
>> diff --git a/drivers/gpu/drm/xen/xen_drm_front_gem.c 
>> b/drivers/gpu/drm/xen/xen_drm_front_gem.c
>> index 3ad2b4cfd1f0..1b36c958340b 100644
>> --- a/drivers/gpu/drm/xen/xen_drm_front_gem.c
>> +++ b/drivers/gpu/drm/xen/xen_drm_front_gem.c
>> @@ -122,7 +122,7 @@ static struct xen_gem_object 
>> *gem_create_obj(struct drm_device *dev,
>>
>>       xen_obj->base.funcs = &xen_drm_front_gem_object_funcs;
>>
>> -    ret = drm_gem_object_init(dev, &xen_obj->base, size);
>> +    ret = drm_gem_object_init(dev, &xen_obj->base, size, NULL);
>>       if (ret < 0) {
>>           kfree(xen_obj);
>>           return ERR_PTR(ret);
>> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
>> index 2ebec3984cd4..c75611ae8f93 100644
>> --- a/include/drm/drm_gem.h
>> +++ b/include/drm/drm_gem.h
>> @@ -471,7 +471,8 @@ struct drm_gem_object {
>>   void drm_gem_object_release(struct drm_gem_object *obj);
>>   void drm_gem_object_free(struct kref *kref);
>>   int drm_gem_object_init(struct drm_device *dev,
>> -            struct drm_gem_object *obj, size_t size);
>> +            struct drm_gem_object *obj, size_t size,
>> +            struct vfsmount *gemfs);
>>   void drm_gem_private_object_init(struct drm_device *dev,
>>                    struct drm_gem_object *obj, size_t size);
>>   void drm_gem_private_object_fini(struct drm_gem_object *obj);
>> -- 
>> 2.43.0
>>
>>


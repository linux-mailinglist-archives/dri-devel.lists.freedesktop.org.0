Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5511CCB0ED9
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 20:24:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A66410E2BF;
	Tue,  9 Dec 2025 19:24:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="lwC85Zwi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010022.outbound.protection.outlook.com
 [40.93.198.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BEDE10E2BF;
 Tue,  9 Dec 2025 19:24:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hIS3pz1tsTyuGunMGAWaN1F6AN1EhQMlJXUX11AalLzYAV+ak/LuPW560RrB3UD54gJYBnVf/a5/HQieuygDEosvM7Jslc8lf1Gznfx8Adb+laK8NV9HcxabgpJb4DsovabGELq2OjKe/Itps/6d+4nFw+1UdcHcQqFBiEOw2fQFyipX0R7T1NFLCg8wQj26OPBjKNzR5GT76ThdMlD/8AARpAvRDDnEySwttIA+AaQ8AX7fGVJGEtac1A9BD0RRBdfRPkQXh43zgpO6wQcGJvCtnUv82eOhippcZzOyyxt0fZ69ZyE0WotFIufIz8faK+FkGERQJiw0Vpd+udPH6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Me64AP/eclEGKhxqgC5btNR2NVdJYh8FxL2R9D8wKxc=;
 b=THn4q307YZtQ7dyGVtSUJTQkCadPdK8HIn+ZlL7NcxaeC6snhw4YWxRSXuocmWytSJoTEYPuPUWfXL2lbJFw4DpjLaKpQqF6NDk2H+QIZJldGxRXZu3IJI7s9N3M36nnpTaeO9Erxc7qJdzZvWDZq2cfBg9z7w+8fBSVArt7HggZ/tyhvqzh23NN3MPwnYzPUGuhbnOPSYXUk7KkCbDRqCrAmGsSX/6CzrWm8UII6E30/nDaVSjbY/0Bn0Mi8ogxJvJzhyCX7fzpE0VkIq1m1E/kilcgN57ED1QinkSwNRtQsn5l/WYbEdy9FUMnXbk1SnEL4eyQsh0jqveeTJVSyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Me64AP/eclEGKhxqgC5btNR2NVdJYh8FxL2R9D8wKxc=;
 b=lwC85Zwi9SWUlglzn9CT1opy5SoCgFjgMi+TCRcpxOdC1vDFs4s9HT/2zY/OCi6MpAr7+PwIrfCGPyNetg/qKCGZm7BPDsHqBLcvv9t5Y1kror3naEJZXaxh54EzoiwnPb9pHrqu1jH8OJLKhmCtBIP/prRyvulr5+XhbTgy/nM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by DS0PR12MB7607.namprd12.prod.outlook.com (2603:10b6:8:13f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.6; Tue, 9 Dec
 2025 19:23:56 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81%6]) with mapi id 15.20.9412.005; Tue, 9 Dec 2025
 19:23:56 +0000
Message-ID: <8bf372ab-2625-4f87-a8e8-7a1bc9debcc5@amd.com>
Date: Tue, 9 Dec 2025 14:23:53 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] drm/amd: kill the outdated "Only the pthreads
 threading model is supported" checks
To: Oleg Nesterov <oleg@redhat.com>, Todd Kjos <tkjos@android.com>,
 Martijn Coenen <maco@android.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>,
 Suren Baghdasaryan <surenb@google.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Liviu Dudau <liviu.dudau@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Leon Romanovsky <leon@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 netdev@vger.kernel.org
References: <aTV1jTmYK3Bjh4k6@redhat.com>
Content-Language: en-US
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <aTV1jTmYK3Bjh4k6@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0027.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:86::13) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|DS0PR12MB7607:EE_
X-MS-Office365-Filtering-Correlation-Id: 18081901-f6a7-4af6-58ba-08de37587f2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cXl0b1NUVlZGZ0Fqeng2OFNXYXV3dXlvRTNrVlpYd0VQK1dvSU5MZnVKTEE3?=
 =?utf-8?B?ZnpLTkZwdFFvNDVHMTA4VG4vTkUvSjBPdkQxay9NWUgzdWNEL2U1bDd1Rm4r?=
 =?utf-8?B?MWJ2YWhyOTZkYWdUcXlTZGJMZDNjWk5NUVFTdmF5QUVJdjZ0SCtUUi9vS1I0?=
 =?utf-8?B?V3pnYndTMG50L041NUdKbEp4L21MVVFTUFpCeHN0MkZERzh3VEJnZHlrWjg1?=
 =?utf-8?B?WUJRQzZURXQ1YzRyajgxTEEvNWV5d3RORXZneEtIUDN1a092dWd2UHc0RCtT?=
 =?utf-8?B?djM2eHRnMk9zQjczUStkcFdZUkNubmJjRjM2UncxbnhWK01OdTFsWW00ZS9X?=
 =?utf-8?B?NFVnVjNXeWRyVVVzU3MvdHdSZHlQNzVqMk1NR3FJREZDaXhyNjkyRTJIdWwx?=
 =?utf-8?B?d2ZyT0JxWDVpa2t3eDV2QUE5WWtycHZxVUQvK1BRLzA1a2Y2ZDdCUHEzUkNQ?=
 =?utf-8?B?bUNUM2l3OFZPTnRkZGEvNjFubkNmaXlVOU9qTlhqN0N5MC9jY25mQ2ovS2Jp?=
 =?utf-8?B?QjJ2REVjUFkzMnBsNGFBTkZscExUdDNaTzV4YkJwWjA3cjRLZW9XcFF0Z2Jq?=
 =?utf-8?B?QXU2aEJoaWhwZVJDYVAvSDBqU053WXhLd2h2eS8rSHFyMERGSTU3VDZDR2Jk?=
 =?utf-8?B?ZDBxeG5XMWpuZHV4Nk1XeVJqTkJCblFqa2lBcXdUbUdxWDI4V1VRZXF3UDBC?=
 =?utf-8?B?R29YNUJJZTh0N2xtUFk1RVl4ZEx3a3pzaXpOZlU2RmZ3UFZZemV3aWlTWnJE?=
 =?utf-8?B?Q1pEUUt1eVZRY01DcTM5RnM2NVNPSjlmK0Vhc1VidFBHR0xWVlBwQytKc014?=
 =?utf-8?B?KzlkNDd3eld5L212L211UFY0K29mbnIyMWpJWmYxcXU0L040bWYwMnpEcjhw?=
 =?utf-8?B?WUhIRUlBSVpEUGEyb084SGliczlLT01zWTVLRlRISDlYdExYdTRaR3pVRzZh?=
 =?utf-8?B?UFk2SXhzWHQ3Q1FuZUlmRW92WEdwZVRmN2dvRGhyUXpyRkxyZkRkZ3diNVRh?=
 =?utf-8?B?ZXl3WTcwZ1RBbklXcFZ2YnVqbmpJME80cEZWMklXSmt2Q0ZCczgxampjdkxF?=
 =?utf-8?B?eXVuRmd5RW14WFdoUWhjOE9OQ2FnTVBMRjBGdzdCbWtyZU14TndWdFFUZ1Q0?=
 =?utf-8?B?bHdzTkRFYzFzY1RRRXRjdG9NR2tRVXJ1WWlpQUdXdEVjWXFadVVRd2RZWUc4?=
 =?utf-8?B?eVFPM1NSNXRYU2IxMmtJa1V3Rm9pZGNTK1FCZWh2d2JacFNCZi9mTUNCMWNU?=
 =?utf-8?B?QWJHSXh6MG94ek5aQjhkcEkvcnFDeElJTjFMRDF0UVVtMGMyaEJ1Nkdtem1J?=
 =?utf-8?B?VHMrSzVVTVhjK0JIMlg3dnA1TWRPTEpyaTNSY2RBSHAvYVVaUGJqZTlOZHFW?=
 =?utf-8?B?eXNsbEpVUnBqOUQwZVBBaFJ6Y0toQVpXcU5GZkhHVjBaM1ZpQnRlQytkRllj?=
 =?utf-8?B?eEdscTNYQndiSDJxd2pTU1h0YmNjZ1pSRVFOVy95aUxGZ29KSllHeC8zLzZS?=
 =?utf-8?B?dkdZakU2empTZTJLbHZnVnF0T2ZjeXcvOG1wcUdrU09xWFlIVFpCRy93WEQ4?=
 =?utf-8?B?bnYwVmV2ZmR2RkhEYzY5RktYc1U4ZWVDMVZ5Ni9KWTcxdlJhSnlvWExQMTFx?=
 =?utf-8?B?OXRjMkE4c0FXRzdyQXB6TFFPeDcvU2tUM0xRVWNkVmtwVEphTFl6VmxJUkVy?=
 =?utf-8?B?Q2pMZnVnTklOamNaNXNMVEVkSUt3MGJFWGVZNkY4eXZLU1ZJVzVUTWJaSmZ5?=
 =?utf-8?B?bXBkRUg2WUNoMmZwcmJzVWxYMFJVOXVpcGxuMjZYWlJZTWpaR0NQU0NocWg1?=
 =?utf-8?B?dDR2amEzR2hOMkQ1clU1aEI0YW1iSXNyQkJjOFBOckFVR0c5ZFRFbUw2bmky?=
 =?utf-8?B?TEtPaFlTQnlST0ZPZTBWY2NNTFBtUEFJNDJXVEdpdXd1WXlUS2hVVmVDSHFS?=
 =?utf-8?B?ZGNQMkZMbEFCelhoa05tZjk1SVJWcXdwR3I1MXhRN3o2NUVSN3IxYWJZSmd6?=
 =?utf-8?Q?qSrMZRQxAKGOv2XkdAYubtuCIGR9fc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dDFrMm45RWZYZlBQODZGcVlDQ3d6bXAxM25UeUFtRGcyb2lIMmNxUVgyZmFO?=
 =?utf-8?B?ZW1ZeEQ4eWJVT0RoYkZvTHlaWFBLdFgrZUEwV1F4eWN3VVNjOEM1cVgzRENa?=
 =?utf-8?B?cHM3ZGI3U2xzM01SSFJFb3pWU1FaWVd6NlR0VEZiK1A5aGIvOUtabzNlQnJ4?=
 =?utf-8?B?aGJTZTFENGF1dnJ5bzRCUE9ndzhQYXR4Q21rQm9tY3ozQ1N1TFI3a0pkRHhE?=
 =?utf-8?B?NU9GdUNURENOUndEbU9SL3hYRDllOGFKb0NVS0ttZ0FkWFFkWU9laEZUOERH?=
 =?utf-8?B?Q3BrSWZ2OXUzdTFuc2w5M0ROcTBDaU8wb2wwRzNOWUxRa2YyV0dKbmJNNVp1?=
 =?utf-8?B?SmNHeTU1THkvZWxFTkI3Y0txemM1ZmdhM0lkKzluWHI3UzBQV2lrT3RCR01u?=
 =?utf-8?B?NERCL0NwTTczdHQ0Vy9rVzVzdWFWaFNzOHM3WmRoNnFHOGJJTm9EbGk0amFS?=
 =?utf-8?B?cGJ5dWoxdDB4YkEwMkF2TGZaQ2xoWTRnWFp1aC9ZZkhUVTMzWFA3bVpEVlVV?=
 =?utf-8?B?citZTDRRcGhPQWgzb2R0clVqUlJxU0d1RERBRUVHOG5pQ0pkell0bkFhUlJL?=
 =?utf-8?B?U0ZMRmJUT3JvTHJHUnl1aFczbnhJeUxONXh2czc2V0xMYzFjVG83NE9NRGdB?=
 =?utf-8?B?OUFIVHNrUTZ4REcxeXRCMXFGUklnbXBpQ2RsZjZWallpQklRWFYrQkw0WXF0?=
 =?utf-8?B?Y1NFeGs4Y205UkFQeGdwNnVpK2lka1VpRWlQVWdhbkROKzUyeVZhemJhSzU1?=
 =?utf-8?B?eXczUmlDcTI0OVJvR05JNlhNNjlzSzB2eHNmY1VUQUV0UGdtaGN5UDgzYWJR?=
 =?utf-8?B?MWRqYjhiZE43elhEYTZNcWdaNEtLY3RidFpjTng2NWtrZlNJVjR2YzRIL0Nz?=
 =?utf-8?B?am5UZUUwZkZhbnVtZStMRXN5OEw2T08yTytZZFk3VTdpaXdFZ2ZTUFJCOVkv?=
 =?utf-8?B?UG82ZlZMc3dLdGNrQUJxSHVac2RTVU1BU2JabGNocTNCUnErV3ArMjN2ekM3?=
 =?utf-8?B?YjB6QUhvYnVDNStkQjlYQmhxSVkrM2U4VWh5eGpLT3dQTGVVemJEdU0zcjN4?=
 =?utf-8?B?dFJZc0J5SkRiNW1XS1pEdEhzb1h6YVlwdWllaEFDNFI0ckZSeGVjN1ZuTHpu?=
 =?utf-8?B?RHI4WFNGNjd6dkE5UW9uMmJVdVphZUFGbkVBOGJJLyttaGY5SmcwRXVEMGJE?=
 =?utf-8?B?bnRnV2JSanpmall0Wjhsem9wMUh3MXBhb0tCNGdqQ0syS3d2SDRneTh0Y2pl?=
 =?utf-8?B?cm1DaHl4bnVQVWJRdzFmUzFqdUZqNGN6YWJOZTZvNEsvYXAvSFJwRWM2Nkx5?=
 =?utf-8?B?SE9velY1RzE1WFd5OWVudExGUUZWeVppSVk5L1JCU05FTlMzVkdzcUI1aEpi?=
 =?utf-8?B?aXRNY3N6cnRlT1l6OWd0WUxjbmlkcnE2b0dKN04vdmZPZ2FYR3JqQ3hZMDBZ?=
 =?utf-8?B?ZWZISWJhSHlTa1p2c3BlRW1JSlBicWl2a1RESWRkcWRlbll6TnBwZk1lT3ZH?=
 =?utf-8?B?dFhIU1JySHJhbVhUK2FqRkJVcUJZaDUraGxITWJTOThqU3dwejVVT2NvWHJH?=
 =?utf-8?B?SHljd0doUkRaUGxobkhxeG9QYmJjOWRMWWxvdEZQN0FLNlJ5d2dOZEkrMWxY?=
 =?utf-8?B?d0k3WUVRTXVIcmhPUEducTRZS1RMQ29jYVdIZUdUWVYwZEFNOXV2T3BtTnpF?=
 =?utf-8?B?SDlBYU9PNjNYM1ZJbnplM1V4MTZFVmRPWTRwWnNjT2lnaEVTWms5WXdaajJ3?=
 =?utf-8?B?aFRqa1FVWW15RjVUM2R3SWNicVV3Z004enFXKy9KbElQN3dUaDlCS0NmcU8w?=
 =?utf-8?B?L2xHMmxuZHJBeEoyeGJKTVRVd01rZm80ckFIdjM5ZzJEenZUdnEzSkZxODM0?=
 =?utf-8?B?aGFJQ1Y1cGM2MGRyNm1sNU5HZG9UT1hEdnFjNjFOZ2g1c0dKcEtmOG16SWVM?=
 =?utf-8?B?end2YnhzbFF1c2NQOC9OWnRZZzJrYXlaZzdGcTRaMGd1OFlNVUtsNXlMN3kr?=
 =?utf-8?B?d3JESVFpalM1UE9senlhcTYvTU1FcTNvTmtEZ2gzeUpzVzBCbDc5N3BwNTh3?=
 =?utf-8?B?UW9HVTFHTE95eTIvMlg1N1FvaXFEQTF1WFhYMDJnSUl1RFdaMnRoZzlTQngy?=
 =?utf-8?Q?8HXjXe8SA4DhDSbLiUDYoHIje?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18081901-f6a7-4af6-58ba-08de37587f2b
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 19:23:56.4515 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hnLDoaRzZYrXWhypHZDAaEIbi9I+6kdqCC8+3tQLYwMd/os/bC7coetGb7yGofyQa2COxrs/ivJU4HEqmGrIhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7607
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


On 2025-12-07 07:39, Oleg Nesterov wrote:
> Nowaday task->group_leader->mm != task->mm is only possible if
> a) task is not a group leader and b) task->group_leader->mm == NULL
> because task->group_leader has already exited using sys_exit().
>
> I don't think that drm/amd tries to detect/nack this case.
>
> Signed-off-by: Oleg Nesterov <oleg@redhat.com>

Acked-by: Felix Kuehling <felix.kuehling@amd.com>


> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c   |  3 ---
>   drivers/gpu/drm/amd/amdkfd/kfd_process.c | 10 ----------
>   2 files changed, 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index a0f8ba382b9e..e44f158a11f0 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -2551,9 +2551,6 @@ void amdgpu_vm_set_task_info(struct amdgpu_vm *vm)
>   	vm->task_info->task.pid = current->pid;
>   	get_task_comm(vm->task_info->task.comm, current);
>   
> -	if (current->group_leader->mm != current->mm)
> -		return;
> -
>   	vm->task_info->tgid = current->tgid;
>   	get_task_comm(vm->task_info->process_name, current->group_leader);
>   }
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> index a085faac9fe1..f8ef18a3aa71 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> @@ -833,12 +833,6 @@ struct kfd_process *kfd_create_process(struct task_struct *thread)
>   	if (!(thread->mm && mmget_not_zero(thread->mm)))
>   		return ERR_PTR(-EINVAL);
>   
> -	/* Only the pthreads threading model is supported. */
> -	if (thread->group_leader->mm != thread->mm) {
> -		mmput(thread->mm);
> -		return ERR_PTR(-EINVAL);
> -	}
> -
>   	/* If the process just called exec(3), it is possible that the
>   	 * cleanup of the kfd_process (following the release of the mm
>   	 * of the old process image) is still in the cleanup work queue.
> @@ -918,10 +912,6 @@ struct kfd_process *kfd_get_process(const struct task_struct *thread)
>   	if (!thread->mm)
>   		return ERR_PTR(-EINVAL);
>   
> -	/* Only the pthreads threading model is supported. */
> -	if (thread->group_leader->mm != thread->mm)
> -		return ERR_PTR(-EINVAL);
> -
>   	process = find_process(thread, false);
>   	if (!process)
>   		return ERR_PTR(-EINVAL);

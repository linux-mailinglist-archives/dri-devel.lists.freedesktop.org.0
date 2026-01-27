Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ePIyIdSEeGmqqgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 10:26:44 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0516F91AEC
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 10:26:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F08B510E4F5;
	Tue, 27 Jan 2026 09:26:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="n8/FhjIa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013021.outbound.protection.outlook.com
 [40.93.201.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E220010E4F4;
 Tue, 27 Jan 2026 09:26:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oC0dVV3ZuKcHbA8J1lFkc0A5FApHmnqDXpwg9nVmvSCjfZ0KXdd7SqO5kE77CXColKG9v6BobzcbGb3HzlKWXLdBOyDupCu7vSngkD0N0TdIVWvHENjpZ6zysl4+yX+J5G+eQzLsn5LrCYP23MpHoKc9N77VEJ7fNijd4v84TutqlqhKWblrk+ETFqAW09SpjZL9ms5pnbpfIPj/Hnw3GHrPeZSYJzSRR/rhG7IqWStT+m4O5qIul1up2PPu6Ah8huq8i4t6fDmxjoQVAvQuSfAEeZ7DCqyIuHOGmKcXSNKxh/+g9HNURHxsz09qru2KlYq7Ln7QQ6t7IRxPP3Lcpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f7s1uet97cal53aA0QUeHLNdzOzhnXhWbWNZMBla6qU=;
 b=YOoj0yIgD4kiZjRYqZcmq+ezo7Sn0+4JngmLVMWHpmUAnwfXxImdlWlXBYj5LBRtOeLPVxOW6wltXo8xKTmb+BlxlGNzdh0yL8Mc+huXMh83g4cYZiEoAaJtZoFTbXwlQRUBBpWHbX6mF4frU7fGfiGAEKlqd5VOLaBtYh6q2IrdUeiwjG1JXKNvr1T15DqfTQdBKJGKNJlIyYZzNM6COc1Tn1e+8m9J+ePrvl3YaLuduDfOUISIeRwCDGYQ0QvZK07+XhDz4FbyBtzrC1Bp5UskDaccFj5ZShCbFMZ7gkO8KX/3hR2T2TkwqCXsN9uV1Q7xv8GewuYRSmQF7MR3sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f7s1uet97cal53aA0QUeHLNdzOzhnXhWbWNZMBla6qU=;
 b=n8/FhjIadZ1EABruZ3LnubRlmK8zWzfsEHyWkq2FOEdH7ycix+L8F1+a3KKq+47+hUoqgE+o9tIPjkwj3M6QZ8Xny3PrTVRBoJCT7rO+vq36J+o/0QX7vunSmH0Bbj6y+VMQ6peIt+9Wddjf575VLSNWf0EPtAFc8rgMOmV9RP4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA1PR12MB6749.namprd12.prod.outlook.com (2603:10b6:806:255::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 09:26:36 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9542.009; Tue, 27 Jan 2026
 09:26:36 +0000
Message-ID: <0d2ec2d6-c999-45d8-a2bd-b5b21883db47@amd.com>
Date: Tue, 27 Jan 2026 10:26:26 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/8] dma-buf: Always build with DMABUF_MOVE_NOTIFY
To: Leon Romanovsky <leon@kernel.org>, Sumit Semwal
 <sumit.semwal@linaro.org>, Alex Deucher <alexander.deucher@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Kevin Tian <kevin.tian@intel.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, Alex Williamson <alex@shazbot.org>,
 Ankit Agrawal <ankita@nvidia.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
 intel-xe@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 iommu@lists.linux.dev, kvm@vger.kernel.org
References: <20260124-dmabuf-revoke-v5-0-f98fca917e96@nvidia.com>
 <20260124-dmabuf-revoke-v5-3-f98fca917e96@nvidia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260124-dmabuf-revoke-v5-3-f98fca917e96@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0041.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c7::11) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA1PR12MB6749:EE_
X-MS-Office365-Filtering-Correlation-Id: e2b48e6b-6314-4c24-08c3-08de5d862ad7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eUlSb3YrZkM2V3ZNand3b3FsM0RhSjJWay85cVdkVGxrUHJlT0pHVzBsYW1I?=
 =?utf-8?B?ZmUyOCttYTBlYWFpYjFSbTBvQWhEOWllQ3l2bmprTDZmd0ZYc0xleDJXSHZW?=
 =?utf-8?B?SVVUYUJzK1ZyUFdOVHNyRmw2dTZRMzIyZ2VWeFo0ang4RzRrVldoeWdZSUJP?=
 =?utf-8?B?eHB1azdEUENhN1NmdTJZaXhDQkZtMGpicHhpQlZwNGkrcWRGNTF2UnFyd3ZB?=
 =?utf-8?B?ejlRTk40QWVGVko2VlA0a0djUTZQN2ozQWdRcUIyMmVrUllhZ3V1NUJNRmtT?=
 =?utf-8?B?VkJSY3BIenZ0c1VOTkdYcmJPNjZQOWdUaFE3YzZWWFZzQXBVRXJQTXNEZFNm?=
 =?utf-8?B?L0p6d2dGMndqUENua29SN05MNURMZXA2Qnh0TGRQVFJoVGYzdG9iQUs3c1Vl?=
 =?utf-8?B?T0xMNTQ2Q2RVcCtFNDBNR0NIa0dybjdSUk5Ib1NrMTlKZTJqUkRwRkJwbE9v?=
 =?utf-8?B?WFFSVmJ5blhRMEFXNXl5OUtYd2Y0SEVYTWFmRGltTm9LeCs3V0VtcGdJVHE4?=
 =?utf-8?B?Q1BlclRzK3pMNVA4azFvVnVWSjc1TWNpVjFjK01oMVNMbWpMU3hFcFF1OXVN?=
 =?utf-8?B?eGR3dEIwRnNWZ2xRM21md1V1ZThkMlphZzF4YS9CVmpSQk55Um1PeDltOURh?=
 =?utf-8?B?ckR5eTVxTDFRVmtXM3lsaFJ6SGxSQXEzNHFVRWNmWkRWNGlFVjJHTG00Yit1?=
 =?utf-8?B?MHBkQlJrdU9VVE5SWGd6SFlCa3FCSEVjQXJZQS9FZk5iRUJmeGhIZmVUWnhv?=
 =?utf-8?B?L2VQTkFDbU95QzF2aFhUWlE3UHR5MWM3TU1Zbm5QcHhGVllFbXIzRVZuWkxG?=
 =?utf-8?B?WW82RVM0VG5mU0Y5U3VZV0U4Z0c3R2ovVXlPaWo2RzJ6dThxZUdQZVVGSXJy?=
 =?utf-8?B?U1I1R3J0L0tlYlRsK0QxRjFlZFZ4RGNKaHMyR1d0WFFNcFo3Y1FCOVAwYXFr?=
 =?utf-8?B?c1FUQlhtVDVZMnhpQ3VnM3VYSS9zRlNPRnNnOXR1emVONzRQRnJWcXBKNVBW?=
 =?utf-8?B?UVhzVUJyVEpEQnUzcDlUakdOQ2wrdEpMSTNtQytxSFZrR1hsNDc4V0J2OEFU?=
 =?utf-8?B?SitjSm1LaEFLSnkvMDZna0QrejY3eWZFQkpmRmIxaXBjaHhoWXJGcTZkaWda?=
 =?utf-8?B?Y29DdFpRc2c1SWpvRGlTaEZCVkxSNUI3QmxRZHlweThxZGJ5YllzMHFjZ3Nj?=
 =?utf-8?B?d3l6Z0VPcW9PVjBpdHpPL2tSYlJBTzMvRFpzV3VtdFRoQU10Q1o2LzhldTJ2?=
 =?utf-8?B?czlLbDNTRUk1cEFneDJHOTBKV2U4bDIzaXdmMFV1SmUvbGtWRnMyRFN4cUdK?=
 =?utf-8?B?TDBtYkZ6aHJtallzYk9LQWxRdVAvZ1BKZVY1NUc1ZlFqeXRUaUROeW5WRm9D?=
 =?utf-8?B?Tm9QekVxMXFjV2ZNUFFsZERHWHhUdU5oL0VLMDBDTTl4dFJGMU0xSTh5Mm9C?=
 =?utf-8?B?cFNsSzhhL0VMZjk2bjZGSmVrc1UzcFF1OHNCRUFWVTE4YVp2RW1paS9YaXFE?=
 =?utf-8?B?Q3FaSlZiQUwzN1RTUUZock9lcmlUcDdXcnh6VUY3dE1Ed1RrUHBLNS9rSXBj?=
 =?utf-8?B?N0N4NWZIT0thQjQrS21TYm43VlVEYjltclkvaGxBQXZaSjVodG96L0ZZaDNZ?=
 =?utf-8?B?WjZ1SThmSzFGd1JYT3lmRDIwbThRRWZWU0J3OSthbm1Nc1pTMVpHQVdPT1cx?=
 =?utf-8?B?bzkxb05zZVAzNGtzTkJSUUpIL3RhNThjV2JIN1dNQ0RGNnhWbEgycVg3dEFN?=
 =?utf-8?B?bU13OWg2L2tNc2Y5aUFrTjFZZDJEcWdSdnhydnhxdnhMaExodUpsOWt6R0Iz?=
 =?utf-8?B?TFVwbXN2QVBoc0xqSGlpRk4xbUdOTWxQN2IrWHBNclNlNXpaRk8vUTJjT1BC?=
 =?utf-8?B?WnZFM0VBbE1wdUVhdE9OWW90dFRQeGpBcHFnMzJWMnBpY2ZXTSt3WmVtZjd3?=
 =?utf-8?B?NEV3QkdDRG5lRUhHQUJkU1FnenVjTEtIK0JiVFN1bGpld283c29WelFWZU5B?=
 =?utf-8?B?T0lIY0pkcGRJbmswUW9sbGZxSzdIbWRmSVMvYXJnaEZWcllFRUhFMEpKd3B4?=
 =?utf-8?B?UmpJdjQrWS81eHJmSkx1ODlOLzRYbjI5a3dUend5bUNDS3A3VmduRE4rZVFx?=
 =?utf-8?B?UEtwdlhXYUx0UTk1Z0FzZTdFSXhHZmNVVnpuOTBGNVRKNTF0a3drWG5URUkw?=
 =?utf-8?B?TWc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZXhFMzdOeDQydzVUZUcwMFcwN0FDZjl6RmVneXFvUzczVG03WU5HOFpsOXRO?=
 =?utf-8?B?bTZmdzg3YUhlSEh4VXk1SDlXUTVqOFlkdHRyR2xhU0FVSHNrOXB6NnNueEQx?=
 =?utf-8?B?WE4xMjlIN2JoWW91V0FCb3huenBxclkwN0tvQndEUXFEbDlycmhZZXJqck1Q?=
 =?utf-8?B?bHJaUkhZcHArdDdWVGpRT1JvMm9zZ0JHcHZEM3Y5Vk44QTQ3RzJudks0Z2ZT?=
 =?utf-8?B?eitLQWEzT1oxWnc0ZlV2Uy9Hb2JwbnNRbWF4NEk5NzNoMWxXU0w1aVB2STFN?=
 =?utf-8?B?TkxvR3hRdmFYNE5IV1FLTzVTL1JPRTJvakc0bGF0Y1REY2Z4MVk1U1pwVDM0?=
 =?utf-8?B?ZTFDemlLTW5BZnBZVEY2RGx6aVBBeFAxeDIzSFltU1IyKzVkUyt4bFRtNWVB?=
 =?utf-8?B?WHlMWlRRYUpoTXdoTU9pUk5ha00yb3BPWjk5a0ZlVWdYUFdkdVh1YVF0ZGNw?=
 =?utf-8?B?d1FoZVVJdXl0N0JkQkhsampaZHJwaGY0UkV6cUhNS0FremUrbmNXelgrb0FY?=
 =?utf-8?B?UElMSHFyUjhEbkhnRXo3K2lZb3BYOEFoTUx2TTgzY00zb1FkcFJUdlY5LzJU?=
 =?utf-8?B?ME9ZZUVPYjMvU1VyUml3bFRxTGw5RklmWGg4TFA2d0ZzTHpoazVqMHBuRTZ1?=
 =?utf-8?B?RmhiTm9rYkFBMUtTbURXTzBzRytNbVEwREdFMUpOT3JUWTVyV3BNMVlPRGh5?=
 =?utf-8?B?Y0hjNE1HRGxCNCsrdEh4UzZTK01TaS8yZlllZURpYjI0ZmFkOXArUERBbVhi?=
 =?utf-8?B?T2RMMEZYQWlYT2pKMTkyOHNDTk5pN0x6T3JCOFBjZHVEaGJuckgvWWdGN2tT?=
 =?utf-8?B?THNTN2I2LzQvL2NycC9pMmw3UmNET0dJb1dEMzRGV3B4TFRSdmVrUXM2UVlY?=
 =?utf-8?B?eU42Y25zWkJsR3hINHZqbzc5SS8zZEQ0QWRBUzByeFJrZVVNL2FuY3BIS2xW?=
 =?utf-8?B?bkZyUHpxSGZlSDZ5cFFkVjZBQ05YWVFXd3daV1hFOFZJYXpLMEZ3MTY4WGVa?=
 =?utf-8?B?MTU3YUZ1bGJPaG5MZUlDOEZYQ2Q1dDJNT3BaczVXcUo4RVJRSWtKSHYxQ3Jq?=
 =?utf-8?B?Tm8rSHZsZjlISU5lRU5BbmlDUTAyVlFsNTVyRUdZR081b09GcEV5NGNwYllM?=
 =?utf-8?B?UnlUQURUZmFSdE1lVW9IRmk5ejhad3A4SG9GOFdLSE1sTmxoL1Qrd3RsSENi?=
 =?utf-8?B?YUtxSlk0eGRvU3JWK0F6TkVsZ0hubVYzU0ZPazFoQk5oQlNwbWk2WVJSRFds?=
 =?utf-8?B?WHpHUGpWbGhRdTUwaklKSVcybzQyL2JVbEl2K1ZOQ1p1aTFVa25Ja2tzT0ND?=
 =?utf-8?B?R3BxaUVjemhrK2k5dGlDTE0zendIT1pyUHlzNDlLU1FnNkl4a05ZbVNHYkZx?=
 =?utf-8?B?Wno4dStKcWsyc2VGTjYxa05BVmc2WmlZMkF3a3Y3d21pdnRSWmNWWUlPb2xI?=
 =?utf-8?B?MXFxRWpJc2tSQnA2clBEN2pvUUQzOXBXVk9IUGVQbzZ5SlpwRWN6ZnpidWFD?=
 =?utf-8?B?QkFXZTY5QU40QjZzOW4yeStUc2pWTUhJSTgvYU9IU0lBWFZtUXpxM1lqQm5B?=
 =?utf-8?B?TzA0TWpwUXJ4aVFObGlPM2ZlUHczc0ozWWhTUlkwUldsUHRoWDJ5ZFlUYWxl?=
 =?utf-8?B?Yy9qV2hwMVFzQmUzQjg3NENrditBdUNJSGNiWnU4S0NIRVVLdUd5TFJCU2tS?=
 =?utf-8?B?Si9MYkhodkdpWE5paU0yU2NJRHBDMVlkdkhSdVplTytWTU83ZTBnYjZtWGVO?=
 =?utf-8?B?bC9HWU8rSmgwK1p4MGJpTWZnYUtXQTlQczR1ZmRWS1pxUW5aZTBzY2ZhMm9o?=
 =?utf-8?B?M0VIcitFRlpIZW1RWVJSR3dZb1ZpbnRKa0N4bVMvcGRRY2JXQ2Z6aG9BdnQy?=
 =?utf-8?B?MzRiYzViSldObEFwRGpocXRWUHRCdGkwZXJUS2dMR1VJeGZIa3NjWFNMRWRh?=
 =?utf-8?B?czFaeTkrZDFQY2xLbDd3cUdVb3FBaDZzcm5CcjBoN0hkK2c3VFFYWStEVjV0?=
 =?utf-8?B?eHlYaU9rVjQ3eHZHN2k4RXpac013RC9OMEpkSXhvN1NDZVlYS2NialdjR3ky?=
 =?utf-8?B?Y1NCTWlRVnJ4Rjg3T0VNNTF4bXc2dHJEcXBnTW1UbXE3bWw4b0J0V041UGJK?=
 =?utf-8?B?Mjl4Y1MzZHFuajcrcDBXVWpoUEkzSkxBUENtd2xYTUpIM3dBaVhXL0FXN1A0?=
 =?utf-8?B?eDJZb01ZWjFUQXV2YlNBZmVYZWhaUW9ldzZCTTF1S2w0VGVRM0RZUVFqVXhi?=
 =?utf-8?B?aVAwSGN3R1cxYndaZUlRZHJ1MlIzQW8zYUJGLzF1S0llL21oWVgveGZxNGY2?=
 =?utf-8?Q?+9bK8fcO28Nid422dV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2b48e6b-6314-4c24-08c3-08de5d862ad7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 09:26:36.2861 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 38PGNWXDWAJfdT4YYLgQfGQEl2J85crSbd3TCDqcxBl2EY8KPEQOg/UOf8c18xD0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6749
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,amd.com,gmail.com,ffwll.ch,redhat.com,collabora.com,chromium.org,linux.intel.com,suse.de,intel.com,ziepe.ca,8bytes.org,arm.com,shazbot.org,nvidia.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[34];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,amd.com:email,amd.com:dkim,amd.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 0516F91AEC
X-Rspamd-Action: no action

On 1/24/26 20:14, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> DMABUF_MOVE_NOTIFY was introduced in 2018 and has been marked as
> experimental and disabled by default ever since. Six years later,
> all new importers implement this callback.
> 
> It is therefore reasonable to drop CONFIG_DMABUF_MOVE_NOTIFY and
> always build DMABUF with support for it enabled.
> 
> Suggested-by: Christian König <christian.koenig@amd.com>
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

As long as nobody starts screaming in the last second or I encounter some other problem I'm going to push the first three patches to drm-misc-next now.

They are basically just cleanups we should have done a long time ago.

Regards,
Christian.

> ---
>  drivers/dma-buf/Kconfig                     | 12 ------------
>  drivers/dma-buf/dma-buf.c                   |  3 +--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 10 +++-------
>  drivers/gpu/drm/amd/amdkfd/Kconfig          |  2 +-
>  drivers/gpu/drm/xe/tests/xe_dma_buf.c       |  3 +--
>  drivers/gpu/drm/xe/xe_dma_buf.c             | 12 ++++--------
>  6 files changed, 10 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
> index b46eb8a552d7..84d5e9b24e20 100644
> --- a/drivers/dma-buf/Kconfig
> +++ b/drivers/dma-buf/Kconfig
> @@ -40,18 +40,6 @@ config UDMABUF
>  	  A driver to let userspace turn memfd regions into dma-bufs.
>  	  Qemu can use this to create host dmabufs for guest framebuffers.
>  
> -config DMABUF_MOVE_NOTIFY
> -	bool "Move notify between drivers (EXPERIMENTAL)"
> -	default n
> -	depends on DMA_SHARED_BUFFER
> -	help
> -	  Don't pin buffers if the dynamic DMA-buf interface is available on
> -	  both the exporter as well as the importer. This fixes a security
> -	  problem where userspace is able to pin unrestricted amounts of memory
> -	  through DMA-buf.
> -	  This is marked experimental because we don't yet have a consistent
> -	  execution context and memory management between drivers.
> -
>  config DMABUF_DEBUG
>  	bool "DMA-BUF debug checks"
>  	depends on DMA_SHARED_BUFFER
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index e12db540c413..cd68c1c0bfd7 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -847,8 +847,7 @@ static bool
>  dma_buf_pin_on_map(struct dma_buf_attachment *attach)
>  {
>  	return attach->dmabuf->ops->pin &&
> -		(!dma_buf_attachment_is_dynamic(attach) ||
> -		 !IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY));
> +	       !dma_buf_attachment_is_dynamic(attach);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> index cd4944ceb047..b7f85b8653cf 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> @@ -133,13 +133,9 @@ static int amdgpu_dma_buf_pin(struct dma_buf_attachment *attach)
>  	 * notifiers are disabled, only allow pinning in VRAM when move
>  	 * notiers are enabled.
>  	 */
> -	if (!IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY)) {
> -		domains &= ~AMDGPU_GEM_DOMAIN_VRAM;
> -	} else {
> -		list_for_each_entry(attach, &dmabuf->attachments, node)
> -			if (!attach->peer2peer)
> -				domains &= ~AMDGPU_GEM_DOMAIN_VRAM;
> -	}
> +	list_for_each_entry(attach, &dmabuf->attachments, node)
> +		if (!attach->peer2peer)
> +			domains &= ~AMDGPU_GEM_DOMAIN_VRAM;
>  
>  	if (domains & AMDGPU_GEM_DOMAIN_VRAM)
>  		bo->flags |= AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED;
> diff --git a/drivers/gpu/drm/amd/amdkfd/Kconfig b/drivers/gpu/drm/amd/amdkfd/Kconfig
> index 16e12c9913f9..a5d7467c2f34 100644
> --- a/drivers/gpu/drm/amd/amdkfd/Kconfig
> +++ b/drivers/gpu/drm/amd/amdkfd/Kconfig
> @@ -27,7 +27,7 @@ config HSA_AMD_SVM
>  
>  config HSA_AMD_P2P
>  	bool "HSA kernel driver support for peer-to-peer for AMD GPU devices"
> -	depends on HSA_AMD && PCI_P2PDMA && DMABUF_MOVE_NOTIFY
> +	depends on HSA_AMD && PCI_P2PDMA
>  	help
>  	  Enable peer-to-peer (P2P) communication between AMD GPUs over
>  	  the PCIe bus. This can improve performance of multi-GPU compute
> diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> index 1f2cca5c2f81..c107687ef3c0 100644
> --- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> +++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> @@ -22,8 +22,7 @@ static bool p2p_enabled(struct dma_buf_test_params *params)
>  
>  static bool is_dynamic(struct dma_buf_test_params *params)
>  {
> -	return IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY) && params->attach_ops &&
> -		params->attach_ops->invalidate_mappings;
> +	return params->attach_ops && params->attach_ops->invalidate_mappings;
>  }
>  
>  static void check_residency(struct kunit *test, struct xe_bo *exported,
> diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
> index 1b9cd043e517..ea370cd373e9 100644
> --- a/drivers/gpu/drm/xe/xe_dma_buf.c
> +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
> @@ -56,14 +56,10 @@ static int xe_dma_buf_pin(struct dma_buf_attachment *attach)
>  	bool allow_vram = true;
>  	int ret;
>  
> -	if (!IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY)) {
> -		allow_vram = false;
> -	} else {
> -		list_for_each_entry(attach, &dmabuf->attachments, node) {
> -			if (!attach->peer2peer) {
> -				allow_vram = false;
> -				break;
> -			}
> +	list_for_each_entry(attach, &dmabuf->attachments, node) {
> +		if (!attach->peer2peer) {
> +			allow_vram = false;
> +			break;
>  		}
>  	}
>  
> 


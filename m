Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F449A98D19
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 16:30:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 473AE10E20E;
	Wed, 23 Apr 2025 14:29:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Rn7jg2Rr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2077.outbound.protection.outlook.com [40.107.102.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 087D910E6C5;
 Wed, 23 Apr 2025 14:29:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PIDThVvvEZK++HeALIsFQFlnyEIf+ZHibc4PcxpDsiPyzKFjH76D1bFsHJbWXeqW7XurnPBXVwJ5foUROcVmvHc2dM7nM+JlSlSKAgSR23+1cptbRT6trjL+Edgu7SMCoNKU7PcqZiI+UbrnAB1B1aaBmpdK1TBkOrMc6QlVLycX0+zljaHIJITpw8/hx3YfW119qfgEvj0wBCdkP/+5pjoBPLF3ZF7yzOJdR4s2hcdHusPMjq1EcXvgQ3/MNROuoASsQAUGStO/VqqZN6a/fFDmUjfF4Q3zzsO40C3anl5+TwCB5v99cnLWtuJcUA6rE3Vk3HFxO2/0wbV1XMt0Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AYYofm8dCZlEH5b/dSY18LZEwy5AIhGhj+xqREc6Aps=;
 b=qIMSDkAcsxY5MqRFDYQkKd7s/4WZEPNMxTnZHDoabywMjvfVnHTNmu+NOHTXdGtRqPJ3EgnNCQpQe6z4wdItZkCv2lg+WcVW977thNlI/WoQTBScaOpLBBAZWJCH2a4EqzecHYzzPgz2vXnZYjBPHyajKfc+C3v0nV90aTDjEJMcA3Ykw1HBksXagBYoDZYEnay67BXY4buH0GkNnaET/QXPrl4myVIhOZjN8sUNsklGToB1aIt4dIsc/A+uwzUmG7zNkTtYD43XXRXSvtikYu7ZTebN2VTWfES/4vXdaxRazX7lZTNaUReAGcjKfjDONAFSibqrrrF9Cw8rJDXL6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AYYofm8dCZlEH5b/dSY18LZEwy5AIhGhj+xqREc6Aps=;
 b=Rn7jg2RrA11O0Qa3GKPoTMch0pEV8brfQvnYze0qKFMytj1/iRxsnCMrMr/c5aTezwMk45DNaJ/SNDme3X6BSZPUkEZCKY+tVHODrTfV0ANZIpT5k7zLTI9Q5HStmbdQajUts7aOUnKVAIg0+OOec+oHnxRJha38ZkUR1+aGjIk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN2PR12MB4205.namprd12.prod.outlook.com (2603:10b6:208:198::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Wed, 23 Apr
 2025 14:29:51 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8678.021; Wed, 23 Apr 2025
 14:29:50 +0000
Message-ID: <9e4700f6-df58-4685-b4fe-6b53fc1c5222@amd.com>
Date: Wed, 23 Apr 2025 16:29:46 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/amdgpu: check a user-provided number of BOs in list
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 Alex Deucher <alexdeucher@gmail.com>
Cc: Denis Arefev <arefev@swemel.ru>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Chunming Zhou <david1.zhou@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "lvc-project@linuxtesting.org" <lvc-project@linuxtesting.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
References: <20250418083129.9739-1-arefev@swemel.ru>
 <PH7PR12MB56852EECD78C11BD15157AF383BB2@PH7PR12MB5685.namprd12.prod.outlook.com>
 <CADnq5_NLEUZget2naQm9bYH1EsrvbhJCGd7yPN+=9Z_kKmUOCw@mail.gmail.com>
 <BL1PR12MB5144467CB7C017E030A4C3E3F7BB2@BL1PR12MB5144.namprd12.prod.outlook.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <BL1PR12MB5144467CB7C017E030A4C3E3F7BB2@BL1PR12MB5144.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0014.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::24) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN2PR12MB4205:EE_
X-MS-Office365-Filtering-Correlation-Id: f0f662bd-36ec-42ea-113c-08dd82734e7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a1F3aVZPNmhVZG9xa0FEdzJaSGNIOVZWY29XbzRuck9qMUtIWTRRbXU3cDBW?=
 =?utf-8?B?VWpzL1p5VkMzc2VzM2VyL2xnWjNoaHlXa2xnTUlSaHkxaE5YL2ZRVC9xUE94?=
 =?utf-8?B?a2JISVVCODZxcWFxd1Jwc09vQ01sVXkxaUJ2WXhLMlVpbGJOZ2gxb2xDejZB?=
 =?utf-8?B?aDZXMlpXS2hBdkRwUlJmWWJUVDA0OU1nSjF2dExiTGI3bVhNUjhxZzEyS1Bo?=
 =?utf-8?B?UzNLQjdhNkJDSXd3aEp5MFF4UUhnZkVZQ25kVk9SemFQM0RmdVFGQ2J3ZnBx?=
 =?utf-8?B?aTcxall6RC82RFk2M2VqZzlmeG9sQTZPNHprZTR6ZTlHb0JPUmVQSklmVS95?=
 =?utf-8?B?QkZtNTNueDFaSlh6d3JkNXl3b3RYb0FhRjg2RGtUQlVrMmZCNUV4TzFGdHNh?=
 =?utf-8?B?NHU0dENzY3hKUmZlY0J2NkJXYStOclBEUjA2Tk5SYnhIOG5RWW41cVZBdnNo?=
 =?utf-8?B?NTZGNlNEcENkWjBRRmNkYlJjNFZkZmp3bXRjL2JOUlpRN2ZKTmtCL3BNL0Vr?=
 =?utf-8?B?UzVvOVV6MmJlN1lpYkFnL3NWVkNRcTFuaEZrWlpRRGxoUWFvSFFKS1FENFVa?=
 =?utf-8?B?eWYwWWZBcmxFeG9hc1krd0pjMUtCRjJVYmZaMzZDKzBReW1BRjYzcnZ6WXZk?=
 =?utf-8?B?czc2c1FONHpmUHYwaFB2WWZGVWEydFlBa092a0E5QVMxVDRtZ0VDNVR0TmVB?=
 =?utf-8?B?UXNmVlcwQWNpUTdjb0l3SzVuc3FPd2Qra1hBd1I5MFZXWm5xN0lCbjJJUGx2?=
 =?utf-8?B?TUFwcjlNQUFMcUpvN1cvWHh1djBickhkc3ZyZ3ppNFYrQyswZU5NMXExUHkx?=
 =?utf-8?B?SU1wMEtNSlpscEViNVl6cDlqN1Y1WERIU0RzY09yOVd0SytOT3pBaDlydWgv?=
 =?utf-8?B?M1MrT0pDSUtIcmh0dHNrYVhxYjc1RS9PNDdwQk9qbnUyakNwVHJhYjNoR3BL?=
 =?utf-8?B?c2NtMW9QVSt5bThKMlBqT05JM0I5SnNSZE4vbDUyTjRKL2wxS014cTE0bFhB?=
 =?utf-8?B?TGF0WHhydTlNRDViKzVOcVAxa016RjI5UC9uNVhXeG5YLzM5K2pCRWRHUERn?=
 =?utf-8?B?N0ZFcFZxbVlPQ1RTdlBhOGh6Q3o2Y3V0eDJRR1NSZmlOWTUzU2hzK3VuL3Ay?=
 =?utf-8?B?dDczT2UyZmdQbm9XWGJsR2dkcE44SHlKL2w5d1JoWllRTEJXeFFHVUFwMW9M?=
 =?utf-8?B?NnJkRFhxRjZtOURNaUFWQ0EvZlFtV1dZdEhya0lEcER2NnpWcm1RdHBBQlBn?=
 =?utf-8?B?YnB4Qi9Ya1hJOXdpNEZrcm1UUUxrTDhHOU52OXhkdEd0ZzFCNG9qN3E4RHd3?=
 =?utf-8?B?RktzbFk1K2w0UjlzaDZ5RkNYT3ZTS1FTa2RSRnYvYWxFU1FJeGd0dXVWTks4?=
 =?utf-8?B?U0d2UWFkczVleVVEV1RON2xHNjNFMmRvN09kNG1jamVsK3graGF5eHR4OXV1?=
 =?utf-8?B?bTB2Z0xIcmVseEVhVDNSY0NDZkpGMEFzTDIzL0RYT1dBWDlLeSt3OTNsWVRV?=
 =?utf-8?B?aXR0WWZHeVRtODJEUGFhN3NZSWNMUThWYVVmOE1Hd0g2MGxmaTgyTXZGWTBu?=
 =?utf-8?B?a1plbTlYZ3VXdmx0M2xFeGM2Q0t6VHYwMThDTWVObnorS3k5Z0sycGNMTjVC?=
 =?utf-8?B?clh6WC8zdlNNN2ZOb1c4TmQ2TDFCSlpHVWRZVkVKV2FXN2t0eHhLeUZLWGQr?=
 =?utf-8?B?ODd4dlUzM0hCZklQajIybWtWQi9xdFJiK2NSbHQrSktuWGg5UWU5SkU1TFQx?=
 =?utf-8?B?aWk3TFA1VGw4eTVCSnpyZTdwMlQrWDN0a2l0SWhFT1JtQmJkdGlTZHNsM3B1?=
 =?utf-8?B?eUVnNEk0eklpdE1ONXYvaHJGN0xocjFWMllXekZkY3pzQXZqdzhYeVBQWVJG?=
 =?utf-8?B?djN3eUtyNHR1dUQ4SUVjdHBlWVRDY2NuYmo2c3dJWEMrZjhiWlZUOWFXaDhD?=
 =?utf-8?Q?jbqP3RkuYPA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2l1TWJraXBvRS9hZStMd0RCMXFTREZYSUZWMHF5TndFNWdCc3Vqamg3MDVm?=
 =?utf-8?B?S0pxckRUSmRnNXhsb0hCYWhNdm9GMVlhcjIwcWZsNTNiS1VlcS96M3plRW1O?=
 =?utf-8?B?cHZvL1BsVnVpU1Rib1RVSnE1R0duY3NkWmNtREdJaFpadldxdnJsNE5EQndl?=
 =?utf-8?B?QWlRM1Y4U21HTzdxbVFuZ0NrdlcrUDRaK2Rsd3RzU205NzVia1hvdlNRbi85?=
 =?utf-8?B?QkZiWHNpUVhPZ1doaGZYTXpSdnpmOVRVRGJMK3BKK0dzQ1k3M2RFS0U1cnFJ?=
 =?utf-8?B?YnVQK0NOYXV5MVFmNWJVK2k1bis1RmNONDcvYWxqNXQxZWxLM0RCU3F6T1M2?=
 =?utf-8?B?NDZ2QjRpMUlydWprQk5wOXhrclVRM2ZaR3pUZDBOemRNZnFqZnF3U241Qkw2?=
 =?utf-8?B?dytsdUZKMG5wOXZyZHBZME5meFV3NDNkQjF6OVVhVFByalVwd1JEeHBaUFVz?=
 =?utf-8?B?SDl6dU05K1JxY1RmQUVwd29CSld1RzRhQzloMklwVnY5MU9Sa0Z4VmZ6dnVL?=
 =?utf-8?B?NlE1eVcrcGVaT0Q2ZlA1cjhCSmNZQTQ5QmY2UFNCL2xkTkNrcktvb1B1TGhn?=
 =?utf-8?B?S0tKbU1WMGtZd1M2Um9ZdGRNK3M2WTBUbk1sQnpxcktHNVV2TDdjMzREekVw?=
 =?utf-8?B?ZW8rVjU0RGNPelVsQzFzaVc3bTJLbGhuaWdGSmNQeStKNmNIQWJnaTJtcEhO?=
 =?utf-8?B?azdaeUdVcC9vUVpQYmQ0TXZqTmxZdE1FQUcvSkJLU2tsallhazVtOHVtUlov?=
 =?utf-8?B?d1JFSlFqbEMycjVPOCtmdjVNZURNU3BuT2dSamNzNmErbzBTOXZOYjJqbEYv?=
 =?utf-8?B?aVEzL2cxeFg1V01lZ05VMHh3d0ZTd2owbjdwN3dwZFMrS2VXdXZaMkU3VFBi?=
 =?utf-8?B?bVI0R2NzdUVVOXY0bnNQZUNVd3JlYkpoNFUxSW9VMm5QRVhCai9tV0FxZkRh?=
 =?utf-8?B?MGgvZXQwdStoams1WTJYQ01FTmVXR25CaTZrSVlSZmVJMVNqMXVlNzdjNkNW?=
 =?utf-8?B?Q2JYU3I0ZGtOVG92TC9vUThBSWNTK3BJbHlIOWJua1lFRGRoNVEvYnFOTlNH?=
 =?utf-8?B?RnRZVFJQZ0RJTlFGck9yQk91M2lkaHAvd0c3TkhnYmxPQkFZbXFsMER5M1d3?=
 =?utf-8?B?TkZYWGhjNXFiamxJTDhFOWNYVlp5SGUvV01tYm8rWnRlbmQ0NEJUT09JeHFn?=
 =?utf-8?B?QkMyRVJEQVl1TngvRnAzSHRlYzdjR3BNNzVyZXpEL3A4ODJGQUNpb1BCS1Vr?=
 =?utf-8?B?SkFtUHY2MkY3VTRVS1hkS2FYaXVnc09adkVsT2NwelgveGY0UnM3Qld0YzYr?=
 =?utf-8?B?VHVtajFZbjNBQ0VLVGRBa0RoNTlBU2o2MmxMaVpueDhlS295Y0x6TzBmMzZ1?=
 =?utf-8?B?VmlqQXpaMUxtMit1TGNmSjF3cWZaSDYrbTlYbUs2NkdRM2FNUzhHZlJ1dmdM?=
 =?utf-8?B?T1ZMa0s3dDVPYzdOaVA5ZjNFTnd1aXJIeW85aVgyMWY5ek92dzZDU25rS0hG?=
 =?utf-8?B?SmN6eXNNNGgxeFp0ZlFDYXpRRUF1anR4MWlvcmN0ajFBSHRxMDZVY04zR2hw?=
 =?utf-8?B?UEl1UXg4OXo5SWFLbDJtNng3TWN5K0NaUG92MW5uTXpXTEhWL082QnlGa2VK?=
 =?utf-8?B?bHd0WFlVS25UeFJLMTdXWGtzRlMvTEZvMUFyZm5GTjV6VDRhWHVPUElsZXQy?=
 =?utf-8?B?dTlTV1pVU2VSZkxLSmNZTXEwZ1lNaCtadHlOcXFRNjJqWHhpMFFxTEtJcmUw?=
 =?utf-8?B?RGdIb2xRWExQdVF4Sk81MHo0VUErbUFtUlhvaUtONVlqcjArcDIxaCtMc3VV?=
 =?utf-8?B?QXNDMTE0YjdOSXpSZmdkelY0WTkwYTAwbnI2c2ZWOHpuVzRXT0xhRVhIV2pS?=
 =?utf-8?B?elppRjU3MS9nMVNqeHV1SWxlWVNTV2tCb0ZNenJ6WE8yOHJPOUV1d2hKWERC?=
 =?utf-8?B?bWRJNkVqSURtUmxUeEtaNkUvNTMvVzMwVVNzdWlkQ244bmo4K2lsVTB6aWRS?=
 =?utf-8?B?RTRwV09VU2p5Sjc4VFF3K0szTjdSbG9TY2F6UnVSSER2aVN1Y1hmaWJZSFNy?=
 =?utf-8?B?UUc0RmhKOGs4c1dXZXRxb3B5VkdULzNFeGNoWDcxUXhWeVNFbDdlQ1R2S0cy?=
 =?utf-8?Q?pzUkAZjL9p3roc8UbOqgM0YB7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0f662bd-36ec-42ea-113c-08dd82734e7d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 14:29:50.7933 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sikwRIhxFpzGDoUExU92gRMZKZp1oXoVbQruNZj0Z7OcdRZjyXn8L/qfOocEg0U2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4205
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

On 4/22/25 18:26, Deucher, Alexander wrote:
> [Public]
> 
>> -----Original Message-----
>> From: Alex Deucher <alexdeucher@gmail.com>
>> Sent: Tuesday, April 22, 2025 9:46 AM
>> To: Koenig, Christian <Christian.Koenig@amd.com>
>> Cc: Denis Arefev <arefev@swemel.ru>; Deucher, Alexander
>> <Alexander.Deucher@amd.com>; David Airlie <airlied@gmail.com>; Simona Vetter
>> <simona@ffwll.ch>; Andrey Grodzovsky <andrey.grodzovsky@amd.com>;
>> Chunming Zhou <david1.zhou@amd.com>; amd-gfx@lists.freedesktop.org; dri-
>> devel@lists.freedesktop.org; linux-kernel@vger.kernel.org; lvc-
>> project@linuxtesting.org; stable@vger.kernel.org
>> Subject: Re: [PATCH v2] drm/amdgpu: check a user-provided number of BOs in list
>>
>> Applied.  Thanks!
> 
> This change beaks the following IGT tests:
> 
> igt@amdgpu/amd_vcn@vcn-decoder-create-decode-destroy@vcn-decoder-create
> igt@amdgpu/amd_vcn@vcn-decoder-create-decode-destroy@vcn-decoder-decode
> igt@amdgpu/amd_vcn@vcn-decoder-create-decode-destroy@vcn-decoder-destroy
> igt@amdgpu/amd_jpeg_dec@amdgpu_cs_jpeg_decode
> igt@amdgpu/amd_cs_nop@cs-nops-with-nop-compute0@cs-nop-with-nop-compute0
> igt@amdgpu/amd_cs_nop@cs-nops-with-sync-compute0@cs-nop-with-sync-compute0
> igt@amdgpu/amd_cs_nop@cs-nops-with-fork-compute0@cs-nop-with-fork-compute0
> igt@amdgpu/amd_cs_nop@cs-nops-with-sync-fork-compute0@cs-nop-with-sync-fork-compute0
> igt@amdgpu/amd_basic@userptr-with-ip-dma@userptr
> igt@amdgpu/amd_basic@cs-compute-with-ip-compute@cs-compute
> igt@amdgpu/amd_basic@cs-sdma-with-ip-dma@cs-sdma
> igt@amdgpu/amd_basic@eviction-test-with-ip-dma@eviction_test
> igt@amdgpu/amd_cp_dma_misc@gtt_to_vram-amdgpu_hw_ip_compute0
> igt@amdgpu/amd_cp_dma_misc@vram_to_gtt-amdgpu_hw_ip_compute0
> igt@amdgpu/amd_cp_dma_misc@vram_to_vram-amdgpu_hw_ip_compute0


Could it be that we used BO list with zero entries for those?

Christian.

> 
> Alex
> 
>>
>> On Tue, Apr 22, 2025 at 5:13 AM Koenig, Christian <Christian.Koenig@amd.com>
>> wrote:
>>>
>>> [AMD Official Use Only - AMD Internal Distribution Only]
>>>
>>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>>
>>> ________________________________________
>>> Von: Denis Arefev <arefev@swemel.ru>
>>> Gesendet: Freitag, 18. April 2025 10:31
>>> An: Deucher, Alexander
>>> Cc: Koenig, Christian; David Airlie; Simona Vetter; Andrey Grodzovsky;
>>> Chunming Zhou; amd-gfx@lists.freedesktop.org;
>>> dri-devel@lists.freedesktop.org; linux-kernel@vger.kernel.org;
>>> lvc-project@linuxtesting.org; stable@vger.kernel.org
>>> Betreff: [PATCH v2] drm/amdgpu: check a user-provided number of BOs in
>>> list
>>>
>>> The user can set any value to the variable ‘bo_number’, via the ioctl
>>> command DRM_IOCTL_AMDGPU_BO_LIST. This will affect the arithmetic
>>> expression ‘in->bo_number * in->bo_info_size’, which is prone to
>>> overflow. Add a valid value check.
>>>
>>> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>>>
>>> Fixes: 964d0fbf6301 ("drm/amdgpu: Allow to create BO lists in CS ioctl
>>> v3")
>>> Cc: stable@vger.kernel.org
>>> Signed-off-by: Denis Arefev <arefev@swemel.ru>
>>> ---
>>> V1 -> V2:
>>> Set a reasonable limit 'USHRT_MAX' for 'bo_number' it as Christian
>>> König <christian.koenig@amd.com> suggested
>>>
>>>  drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c | 3 +++
>>>  1 file changed, 3 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
>>> index 702f6610d024..85f7ee1e085d 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
>>> @@ -189,6 +189,9 @@ int amdgpu_bo_create_list_entry_array(struct
>> drm_amdgpu_bo_list_in *in,
>>>         struct drm_amdgpu_bo_list_entry *info;
>>>         int r;
>>>
>>> +       if (!in->bo_number || in->bo_number > USHRT_MAX)
>>> +               return -EINVAL;
>>> +
>>>         info = kvmalloc_array(in->bo_number, info_size, GFP_KERNEL);
>>>         if (!info)
>>>                 return -ENOMEM;
>>> --
>>> 2.43.0
>>>


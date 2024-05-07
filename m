Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A387E8BE51C
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 16:04:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D02B10EC8B;
	Tue,  7 May 2024 14:04:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4vH887Zu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2058.outbound.protection.outlook.com [40.107.92.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFC6F10EC8B
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 14:04:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hmmkbw3iBXW25YXgyndBO+CQcv5afIIlLShcQlMUQMSkdAW6y8mj5IC93MgOKJbMpeiF8F1ZIo+kxhbBQFlW03D+1NTd+35y9bYFfQvHeNI3R6fU2+DcViJ+c4KCMG9TqZerzEYghCgc3cO2iA7Cd73cbHl9TPD+64rVuZcDNyXpYq40kIDjTCSog6PgybaE4nUoDzxogFmdvkkAoYCI9qu0bbgdzvrRY1CrkzcVFo3i0DnVRsYSYID2C/UdRmXWY4FTGliwIaMoEbs8LscxfjKankMlRKa9yBmc/X5MefJSwRsCrzuDJcvHx9kaS9gjU/aNfmE1IdwgbJ6TzPrDDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X90qCJWxjQS9HCRtm3K99keskZEFkbPEufIUCKHY90U=;
 b=CTVR76EptxF871WCeAJN6UujD1MKwElLNopeUrZdSgObLvzLooPvPqdY6zOR51GScOh4Udxizcq5gjNg74MJmg3BeClVhE9QVmSXJWVR3QMqCcSo6eg6SBnyHh/QDbxqavRYOmyRP5cuBSwyE9z1mDxIHKXdhSnC4MSJpBalyZnmPVpqNDZtyILEs6IMyZ7gjA+7e0X5KU4IeSCi9iCSsi7AciVAvXoyrYuIliinAO0KTrfMDm8M6lQ6H2P2LHsgaEQ9B9xrkRDR7zpMWcug2rwLiKQgmtvipuzqrDdrt0Ulhw79YgOiUyRPpQHxU8KsITQLQVhxBN8QNsnonucxoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X90qCJWxjQS9HCRtm3K99keskZEFkbPEufIUCKHY90U=;
 b=4vH887Zuu71Nq2kieT0yZiL1HOEa92aqlyvoc8gGn1apKPqxbTBoAOrHMeP9vXN4XvWlc/2mgga1EG/jqHmdFOFcauiJtY0OwU6NdxktF2sI0oYJMhpNuR2ntggh6Z+jYavcI661g7fYCWRAg6II2jWDVqJABu1tPvu7Tseu9tM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SN7PR12MB8004.namprd12.prod.outlook.com (2603:10b6:806:341::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Tue, 7 May
 2024 14:04:47 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.7544.041; Tue, 7 May 2024
 14:04:47 +0000
Message-ID: <44b08793-cf44-4cbd-a3bb-583af351ab9e@amd.com>
Date: Tue, 7 May 2024 16:04:41 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dmabuf: fix dmabuf file poll uaf issue
To: "T.J. Mercier" <tjmercier@google.com>,
 Charan Teja Kalla <quic_charante@quicinc.com>,
 zhiguojiang <justinjiang@vivo.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 opensource.kernel@vivo.com
References: <4fedd80c-d5b6-4478-bfd3-02d1ee1a26e5@vivo.com>
 <aab5ec51-fcff-44f2-a4f5-2979bd776a03@amd.com>
 <2ebca2fd-9465-4e64-b3cc-ffb88ef87800@vivo.com>
 <d4209754-5f26-422d-aca0-45cccbc44ad0@amd.com>
 <289b9ad6-58a3-aa39-48ae-a244fe108354@quicinc.com>
 <CABdmKX3Zu8LihAFjMuUHx4xzZoqgmY7OKdyVz-D26gM-LECn6A@mail.gmail.com>
 <8ca45837-cbed-28da-4a6f-0dcec8294f51@quicinc.com>
 <83605228-92ee-b666-d894-1c145af2e5ab@quicinc.com>
 <CABdmKX2MWU9-9YN46PXx-Jy-O9CHMv8hCkvArd7BbWUBs=GPnw@mail.gmail.com>
 <8915fcc1-d8f1-48c2-9e51-65159aaa5a3b@amd.com>
 <ZjovD5WaWjknd-qv@phenom.ffwll.local>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <ZjovD5WaWjknd-qv@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0034.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::20) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SN7PR12MB8004:EE_
X-MS-Office365-Filtering-Correlation-Id: 8608fa8f-002e-4791-9728-08dc6e9ea79d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b05OUkZMK0lDZlpTVFN4d2ZVc3NMSkxyTVhnck9nVlhtQkE4dHg1WUJTelV4?=
 =?utf-8?B?Wno4a3AxcGJLa0Y2Y3cwK2hjR0xWaVk2azVwd3N1a05OclRvZmhrdk1WdDBV?=
 =?utf-8?B?Rkp6RVZUZFdXRXdoaHo5VHJBb0o4c2xOUXZ1MFFpSThxZVV2ZUhQYjl1WjlV?=
 =?utf-8?B?RmZ6dURNTklRWTE3STVSOTFKcVRZSzRUTSs2SGIyb0V5M2VDTjlKODhXaXgy?=
 =?utf-8?B?QmJUMmYwQ0kxOHBxTmJub241ZFBOM3A2NC9WUnFlNFNzQU12bjlQQjA5dHdS?=
 =?utf-8?B?cXVmYmllNjd3ZW15b2RsN2pDME8xdVlKQXdGWER6NzlFYnVTWGNqbFBMaFBa?=
 =?utf-8?B?UFZkRFlRL2JNcDcwNktxMUY5UlBBN2p0L0hDY1pJTWp6K3Y5RlFlak9YelZ0?=
 =?utf-8?B?VTRaR3FrcEVzdzduVUFsWDQzUGhCRHdFcFBPenY2Y1YxUWdnS0ZXNFF3N0F4?=
 =?utf-8?B?SS9GZGNWN0lsQ2xkOUxqanQwL1RBVXg4S2lZbXU3Q2FHUXFmY0FQQm45cUwr?=
 =?utf-8?B?VHlKdFk4V2hkR0E3SlRUMkR4cG85MGZXdkJaMDNpSzRIaWZzWSt3VEtwdGtu?=
 =?utf-8?B?UU9Uc1NQVlowM0Rsd0dRSCtXUXYvTzZsME5LbVB2UU44QVRybmhrb012SlBn?=
 =?utf-8?B?bXZST1lpWGRnRWUrTC8zUnZscUVHZUliZ3NwTWNudGprZzBON1BPZ3ZnUGta?=
 =?utf-8?B?M0xmRmljTTBTQ0NDMU85RjN5ZWRxamxBUDQwUWhpVUM5MldEbEFCSzRvWExD?=
 =?utf-8?B?VUFWcGJ3RHFIemdidUZ2cVVYN29oaDVlcUhzcmZaTGVUQ2tSSm1BbmxqS3Rh?=
 =?utf-8?B?YmxIamE3M2YwUHA1Y1gyZm1mR2s3Qm1zOXBta2FKQ1lwZTJMdjVESlJkQ2RZ?=
 =?utf-8?B?Rk95akk0SlNYTFVFa2pxTXZFRmZTNWhTWGpiQ3V4eWhtSkFrWER3R29GU2Ux?=
 =?utf-8?B?WFFPRXJDR2s2aFZOV0tOckNNcXdVNURFaDhGZ1hPQ3d4MXU2ck5OUDhOTFVw?=
 =?utf-8?B?QjlHNmhQcVoreGtxYXJ1eS9lZW1mamxyUWZ0OWV5MHBXak1GaWdaVlhkMnJF?=
 =?utf-8?B?eHh4aElERXluYU9tTmYwSU9LQXhrRENIZlVWTUg1bjhpQ3NhNzBjUnBNUGtl?=
 =?utf-8?B?UXVtYy9Yd2hMR2VJa0NUV0owZXZlQ1RsTTV2b0ZlWE1ObnBCOHNQU2tPV3o5?=
 =?utf-8?B?M1J0VnhLNktmTWwrTC9xWUVJUzVWL3FJUkdaWVQxTXdaRStKaVFMRHd3NmU0?=
 =?utf-8?B?TnRvZ05pVkZXalJDWTZoaDF6dTRHNHM5Qk1WcFJoeWZMOHBlSlRIZXlwRmxF?=
 =?utf-8?B?V09mYVdrRkp5UU96YmV2cWZFWEJSOWVaQ1hwcHNGZUVsMjlHUU1ZSU90Ny9Y?=
 =?utf-8?B?YnNsK0tzNzdLVDQybjFEcjJEdWtsVHhoV3VLTG1LUGhUSzc4dVc2QS9GQ0Iw?=
 =?utf-8?B?bm1ITEFWdWRQT0JtKzdwbUtrR2x4NTcybmlKb1BhSE9JZ2cxQ0hsTWZueS9M?=
 =?utf-8?B?ZlFOWVpUZ25odGx0VmFUREdJQU1IZ1ZSeUJ4T0RXMzhhcGpQV1RlZEYvQVNO?=
 =?utf-8?B?OTRDNG5HQlA1bjJHWW92WGtMZG9RdXhoSlNXT2djd3owN1VhMTBsWjJPQ1gv?=
 =?utf-8?Q?WkW8VzFvUW0C4ICID8YEiE95E4UAPFD6h2QCiduBmRy4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2Y3Qzl4R1JESTZUVDB1U0FrMTRLYlJXWGV6OWpsK2lzR3VZVTd1a1d1UzU5?=
 =?utf-8?B?ZkpkaGVFcHVEUlpOK1A2MzBEd0tSYitKY0xxZnp4SWh2Z01MMzhYZ1AvV1Fw?=
 =?utf-8?B?aEgyejZ1MENEaUpqb3VwV3VUYmVtNk10Zzk0b1lxandXeFZGZUZUbWZnamNK?=
 =?utf-8?B?NWN1RFhIMjJ6K0VBdnhzS3IrYUphMHVmbHBWcjRtaFp4Q05YVmJ6dzEvRXIy?=
 =?utf-8?B?WUk1RmRNR1YyaUUrRmo5cHdXZllySG1CeFJZTFk4VWFVNWtoYVpPbXRJdWk1?=
 =?utf-8?B?cm9ZS0pqaFk1MVVZenRrdmxMM0g2cGRyY2Y1d0lEclZ1dkFnTzZORFRmQVd1?=
 =?utf-8?B?ZmxMQUJBYmJ1SitkdmZvM1ZFcnQzTlBqRGgxelFyK2hwSytISFpOMGhOa0tL?=
 =?utf-8?B?ejBzcXJYaG1tM095WHZDRUxCd3BOUFV4U3B2Y0FXb2tQYThqWlI0M3FZb0Z6?=
 =?utf-8?B?Umx1azVyUUxKd2c3SHdLM08vSmh4RzVlb2pFaW9OWU5hWnNQb21XZDBHaWpK?=
 =?utf-8?B?ZGkyQS9RbzV1M3ByaG9sMVZhMktpNDI3cEhLWlJiek9wV0dMT0dDZXRxcWhT?=
 =?utf-8?B?QWRKS3NWWEZmcFAwNEZPOTV6VWl0Tkg1b05GMWlCSHNZWDVCQU5rU3dyMkUv?=
 =?utf-8?B?cXIxVzNLSVpRZG9zS3ZIV0NuSi9jVWg3T1pwam1SV0tWMlNWQmk5NnU4Rk9q?=
 =?utf-8?B?VmlNcGhFNlF3aTdaTWtEZVB3RytlREFDeU1BNkkzeDBSMUEzaEttWTd6Yndm?=
 =?utf-8?B?eXUvMFlwTWx5cXc2RFdZM0h1NE9LdDZlTzVyeDBsdXhxdWtqbFdXcTNRbVB3?=
 =?utf-8?B?QkJwOUxISTVuYjk3T2lKS0ZiSHZyWmJ5UHZ1MTJ4dVJpTlZFZUwwd0U2dFYz?=
 =?utf-8?B?TWs1bEx4UVNuV0psc3BkZHRvcnZXN08yaVBJSy9TUmNpdUN4bnNBSE4xc2lk?=
 =?utf-8?B?VzVSV243amNPNVJtNTZaaEdBUmZxL2QraERVeHhnS2pnZHEwT0QxR0dUR0hs?=
 =?utf-8?B?enVPRmdHVmRYSU1yWW8wY3pSQWZiZTZGRy9GM2NNZVpFeEpoZUc5cmtoakI2?=
 =?utf-8?B?Y0ZYQmhDMjZOL3E1cjBtUUZFOU1CUzhVNFV6cWZ4c2s0dGVPUE9WRzBDTzJI?=
 =?utf-8?B?OEszUjJPM2lBY1JZOGoyTG5zMDVPQVdJT2dHMFozNkJVQ1dCYkkrTmxzY2hn?=
 =?utf-8?B?Y0hQZXB0ZmU4S0ZjdEZmQlJsVXlCZEU1UHppM0JUTUQ5dW03akRjdXhtN3RM?=
 =?utf-8?B?NHU4S0kxS1Z6ZytnRWRqQkNlMDdtT2VVYTJ5eTZ3aVhBNS8xRHZlSzFyZlY5?=
 =?utf-8?B?NFJKQUZabXRzTHM4ckExeVdyY0diemgyWnhLR3dTYUdXOVE5T0NEckxha0ZT?=
 =?utf-8?B?L1V6bUdWeEZiS2RzRlE4UVA1bUV0aExHOExxRStWRndVazJhczZYSGNFMjUw?=
 =?utf-8?B?cE8xd0dkbjc4SkZSNS9xbHdxYTJyZlJoTHYyMktNQUE1cTNQM3BxTTMrVzE3?=
 =?utf-8?B?YThXNllKSGMxdDNJMXBmWXZyK0xPNUtuRjUrZGdvT20xK0dkQW1aOG04OXlD?=
 =?utf-8?B?dEs0UElGU0FJQThjdi91d0VuUm1HMUh6eUM2cHBLeVNQNHVsUTV6MTMreHdE?=
 =?utf-8?B?T1grRmxQQ3lxd1Vmbm9SWVY0dVNqVkVoODFzWHFTNjNRLzhtayttSFFDYzRV?=
 =?utf-8?B?MWo5RG12WkwyM2l1bWNJbXV0Y1l2Yk5oZGZRRE4xN3JBYnBOWDVHRnpGUVlT?=
 =?utf-8?B?QzlOKytBYXR4Z0N3TGJMNjVyWThhbjhqZ3VJZWVwNFJTYktEamE4elVYYkJQ?=
 =?utf-8?B?RzRVQWwxRmp6RmdXeUNiWERKNlNneklMTlpBUUZIM2lUY25WQVB4ZWNBZ3ZI?=
 =?utf-8?B?cHE4ZXNkTjFSWHQ4WUNzRXFXRVhOK1JjTE9FOHhJVVlKNVZVekF1UGVvVlNk?=
 =?utf-8?B?UTFydXljZUhvUDE4cnJONFBBM01TMDJnYjd6OFpia1hZaFhmb2hrVzVhajBI?=
 =?utf-8?B?T3RkRE5aaG0rbnA1RFVWREJtQmhXd1Axb09INGUwaThQbGRNS3BTblFheFZp?=
 =?utf-8?B?U01IR3kxYU9RbmdtZkFxeDh0TFE0OU43R0FiZXA1UGF3aklOYy9rNXNlbkU5?=
 =?utf-8?Q?f1/dX7naIW1DEjdrCseVg783t?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8608fa8f-002e-4791-9728-08dc6e9ea79d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2024 14:04:47.6947 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8RKJfiC1PojGimgTWwauNQYI403kO+QbuIlLsiXuGs+QxtBbqGIcPynoc2E7qX2d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8004
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

Am 07.05.24 um 15:39 schrieb Daniel Vetter:
> On Tue, May 07, 2024 at 12:10:07PM +0200, Christian König wrote:
>> Am 06.05.24 um 21:04 schrieb T.J. Mercier:
>>> On Mon, May 6, 2024 at 2:30 AM Charan Teja Kalla
>>> <quic_charante@quicinc.com> wrote:
>>>> Hi TJ,
>>>>
>>>> Seems I have got answers from [1], where it is agreed upon epoll() is
>>>> the source of issue.
>>>>
>>>> Thanks a lot for the discussion.
>>>>
>>>> [1] https://lore.kernel.org/lkml/0000000000002d631f0615918f1e@google.com/
>>>>
>>>> Thanks
>>>> Charan
>>> Oh man, quite a set of threads on this over the weekend. Thanks for the link.
>> Yeah and it also has some interesting side conclusion: We should probably
>> tell people to stop using DMA-buf with epoll.
>>
>> The background is that the mutex approach epoll uses to make files disappear
>> from the interest list on close results in the fact that each file can only
>> be part of a single epoll at a time.
>>
>> Now since DMA-buf is build around the idea that we share the buffer
>> representation as file between processes it means that only one process at a
>> time can use epoll with each DMA-buf.
>>
>> So for example if a window manager uses epoll everything is fine. If a
>> client is using epoll everything is fine as well. But if *both* use epoll at
>> the same time it won't work.
>>
>> This can lead to rather funny and hard to debug combinations of failures and
>> I think we need to document this limitation and explicitly point it out.
> Ok, I tested this with a small C program, and you're mixing things up.
> Here's what I got
>
> - You cannot add a file twice to the same epoll file/fd. So that part is
>    correct, and also my understanding from reading the kernel code.
>
> - You can add the same file to two different epoll file instaces. Which
>    means it's totally fine to use epoll on a dma_buf in different processes
>    like both in the compositor and in clients.

Ah! Than I misunderstood that comment in the discussion. Thanks for 
clarifying that.

>
> - Substantially more entertaining, you can nest epoll instances, and e.g.
>    add a 2nd epoll file as an event to the first one. That way you can add
>    the same file to both epoll fds, and so end up with the same file
>    essentially being added twice to the top-level epoll file. So even
>    within one application there's no real issue when e.g. different
>    userspace drivers all want to use epoll on the same fd, because you can
>    just throw in another level of epoll and it's fine again and you won't
>    get an EEXISTS on EPOLL_CTL_ADD.
>
>    But I also don't think we have this issue right now anywhere, since it's
>    kinda a general epoll issue that happens with any duplicated file.

I actually have been telling people to (ab)use the epoll behavior to 
check if two file descriptors point to the same underlying file when 
KCMP isn't available.

Some environments (Android?) disable KCMP because they see it as 
security problem.

> So I don't think there's any reasons to recommend against using epoll on
> dma-buf fd (or sync_file or drm_syncobj or any of the sharing primitives
> we have really).

No, that indeed seems to be fine then.

Thanks,
Christian.

>
> Cheers, Sima


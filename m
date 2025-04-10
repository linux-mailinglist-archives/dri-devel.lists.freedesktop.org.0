Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48712A849A8
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 18:29:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A3F610EA0C;
	Thu, 10 Apr 2025 16:29:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="k8QtCJqz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2078.outbound.protection.outlook.com [40.107.92.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C8A410EA0B
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 16:29:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tOKnEOH52x6UXkS6TfqMEBs8ghMTDo49jE9fdiSGZ0xTELrIDnt4sYJebGz50dl060QMzMjL7IwCi/IyMztPF/G8vKGZVk55S7rmWQeafDPZqt/uJwcCupqX/WXenHQ9VX1Ao50egzOiJHfkIaW1dMapL24X3T/Nnwv9n4R+zsDU5GVCakPUv3SDqZJrJ9NX/P8wI7FgyRFzAl7hG26hk3BiA5VHgqpjGavUX6iGsXYmdAFuoAjrhYFYaRY6r0nuJ9dEUm4AWV/PMLepwCJI3GlVcpqn/dXkZRPvrhH1VFDmTvaqHHutvuSBv7m9FZQC23+pnyavfJKWgI/L4DAD4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r+wVqng9/9DHPVF4XKLpCChEK6dReYnV79fBkCEfYOM=;
 b=WDaKn+2WkaNPdKcb4/aNtyf2ydx0D//55qDuy3gc/U5HpZ7JtPWl4RnS5f3yNZw2qELgeA5mAWsHbc31WUleXK+A3IRGR7ci8at20u72h/K1Fu2NnHmuxF8cssvLpXCItMzaZgoGQj9V+JDtWIdOUi/NXZ8j8oEEPwldIyB2vzegXMIcrLpi7OUdwsemOMk+Lpd2FJb3LR/6nrB6rtP93zcFEHj4YYiEFyzzYXYTq1A01izwLR+x8m23BvfYt5ZMELkmegZbe6YELd2RfJQoiztMpkY4F2rM+aksMf5uBua2epDm+RcFifCNaRPKIO0GnTgE9zW9ed5tR4yPo9Z+TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r+wVqng9/9DHPVF4XKLpCChEK6dReYnV79fBkCEfYOM=;
 b=k8QtCJqzLHvPv0BnGRyKm/dYiLOh/QdekqvBD3/peQSaCsQzDFf4Smor4T1LzMjYvTs+CoiXnHiU24tZ5DAd+pGOKSxzfs7rFpmPGd7UV0J2GuQfu0gwAp9FexDeak0L/pIkzvwsJFJW8dYhi0AVw2HX8+ODbKc84urKmiZEpWY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH0PR12MB8797.namprd12.prod.outlook.com (2603:10b6:510:28d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.23; Thu, 10 Apr
 2025 16:29:17 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8632.021; Thu, 10 Apr 2025
 16:29:16 +0000
Message-ID: <09a5beeb-bae3-4a00-9aff-66adf68064e6@amd.com>
Date: Thu, 10 Apr 2025 18:29:12 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] uio/dma-buf: Give UIO users access to DMA addresses.
To: Bastien Curutchet <bastien.curutchet@bootlin.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20250410-uio-dma-v1-0-6468ace2c786@bootlin.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250410-uio-dma-v1-0-6468ace2c786@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0172.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH0PR12MB8797:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b28c717-130e-4601-bf28-08dd784cd678
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RHlYbDVTS1piVEI2YklhTHBHc3RsdHAvVnlhZFlZemMrTmVVQjI4VWlhanZK?=
 =?utf-8?B?d3U5U0NFNEJMczJwMGMzeDZkOTlqWGNWV0tPVnpuL05yNFRMTDN3U01yV1RM?=
 =?utf-8?B?ckloQXhrc2FGMGxFNEtxc0JYa0lWRDVtY3B0UzQvQWJ3amU0WloyU3FtSlRt?=
 =?utf-8?B?Nlp1b0pQT2F1S3VVZW9VeGNhYW0yNGg3S0VDSklnSyttcGtLdGVHZnBWU3pX?=
 =?utf-8?B?MDZ2dURyU3JKeHBrK0w5L0JxeGppMUhvVUs4cWE3WmRHQzFoVTNDUkhlOWhD?=
 =?utf-8?B?cmp4R0I3NDB6dk1CY3hLeWg0TlM1VHRDTzN1bnAzWVRORlJPZGVudGhCMHFD?=
 =?utf-8?B?d2tsNEdEczRtdkdxSk5uSTc5SXNqZEExaG1zaHR2RDBqM0w3bkdoSHArUGlG?=
 =?utf-8?B?TDBxZlRiSndFTkJydk9hRVpaVTlFNXBBbk84cFUxYWtERUZVSHF5Uy9ycXM4?=
 =?utf-8?B?M3E4Z3dweWhDNE54bUlQY0RKdEsrSWg3dEJqWHFOSzcxeEhHdDF5Y20vcVdB?=
 =?utf-8?B?QlV3dTZKMjZjYytpdy9aQnZ6OC9LcC85ckVINll0Q3Y0Q3V0L2w1K2tiV25n?=
 =?utf-8?B?eXNpQTdZcXpZcHNoc2FWc0Flc1p0WkpjSEduUUlyWSs3YUFYMDl4MkN1T2Za?=
 =?utf-8?B?N3czTnoyNi9rVjdtTFBOZ0d6UHBZbStGc1J0SDlvSGhhSUl5K1UrdERMU1M1?=
 =?utf-8?B?TTlUaHRQTUFibEptQ2E2S2tzVEtGTFBsWXdDcElhWVFISFZScUUvdUx6bGtv?=
 =?utf-8?B?cDNVWUk2WndpOFF5VlVGMlAyQW9QVmVidHQzcys4Uk9qTlhnN2ZjMHN5YWhj?=
 =?utf-8?B?MUI0Z0dQUCthMFo0VmRwd3pXendaZWRrWVBGK2FXR04xRjdzcFNnTFVkTjZN?=
 =?utf-8?B?YWdxQWZOZTFiMmJvRHdmcWNOOGpGM1Y0akhFYkJFaUtOODF2N1F6b1pxZFhS?=
 =?utf-8?B?Q0tDaHZCeFlJWUk3K3dTVnh6dStXRGphM1dLR0dUS1FQa1VWUS9sZ1J1K0J2?=
 =?utf-8?B?RmViQ05iYkNPRkl4OG1EU3ZRMlhYb3NKUHl0Qit5QmhxOFQwN1V1R0t6ekRR?=
 =?utf-8?B?dGJzRCsyaG1XY3QyekloNlRMMUpyemh5K0dyTlB1cCtmdkRUb3UwTWhTd2R3?=
 =?utf-8?B?c0x2d2Job2F6SDFEdXJvcThvcitwSFRzWFU5V0tZZkxOQUlkTHlTRFAxU1o0?=
 =?utf-8?B?ZHBQckhGTFd3bFhGUzRMMDB0Vk9XWjM1NDFzMzV4dW5MU2Y0QzdvaUtrWWFR?=
 =?utf-8?B?NFFxVm1QWGxFam5XZW14UndCaVdsdXBMVVJtckx1R1VRTFFVZGIwSllsZkpy?=
 =?utf-8?B?ZFZzNkNMKzc5TXNoaGZLZE81djJtVlQzODJ6MEwyeVh6Myt0UnBvSm5HQTY5?=
 =?utf-8?B?dEYxdHg1a3lqUytPOGgxaEthQmkwcktsZldScTA3QUgyOTNoVnBsUWRjVTBs?=
 =?utf-8?B?SkZsa01VZXcyWllJQnFVUVBicTdhaU1Yb21lZEt1R0hnaDdXR2lYVkczWWVF?=
 =?utf-8?B?MWRXbWZPVnBpeXd0d0MrVFNLM0c5ZmQyUGNNenh5ckUxcXltTnB5MWRoanpI?=
 =?utf-8?B?ZjFWRFhZOVpQUExXVU9PMHV4SVAxaWlKMGRCdkEyK1ZMWFkvRnVKRG9OdGJn?=
 =?utf-8?B?b1RKdWc3OXZ1Y0lNSTAvSDVCRkhTVHBjUHN5ai9MWE04L21hbEpiajlFRFg5?=
 =?utf-8?B?Z3ZSanZMSjFodE9WbTA0MXJWWGMrRmJtMk4yVkljbEVud1h3Z1F5MVRRRm1a?=
 =?utf-8?B?WGw0YWdEQnRqeWUrZllRY2oyTkFMS2YvRW0xZjcrcmFVcWRUSVc5RzZvWFpM?=
 =?utf-8?B?M015QzFmTko0RG44R2pwSnRMZEFteEdwbFRPUmxNd1A4Q2x3ZHJSTVlsTjk4?=
 =?utf-8?Q?w6JM+oQCWqOln?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVdHUUVhK2xWY3hVY1dYTnpIbWx0T0hSNlNsM0Z4aTJ3LzRMVTBMQ081UUYw?=
 =?utf-8?B?RFJqQWRtT0VlTUVWRk5Ic1hLWDRpVHkxK1d2R0pYZzZhMzlweExaSGhFZ2J6?=
 =?utf-8?B?dzBLM1FrMU4zQm1zUUx4ZlJMdFRndkR2WUJ0UjdoMVdjQXM3VVo5a2RnSjl4?=
 =?utf-8?B?WkxrcEs4UG9iWVNwaDBUVmJaS3Vta0FLS0ZxQ2h1U212S3NkNWxNNEdjMUVT?=
 =?utf-8?B?NlFnL051Q1dOdklYQTd6b1hGdVpTV2luN2dFeWVnc0xDT2pPVXBSaDA5MEhI?=
 =?utf-8?B?Z2tyUm1MOTI1b0puWU5nZVRyeHpGSjZ1ZTlBaHI5U3RYbW55WnRjY3U5VXhp?=
 =?utf-8?B?dTJ3QXlQR3l1WUx2dXIwS2lGcVhiRktoWTlwRFhBVzBDVHhJS1MwYllOS1NK?=
 =?utf-8?B?WUltbDhlSE8xdFd6OSt2cDMycEFzelBFQ2J3d3RPQldqNnVSS2VQSVZ3QkFX?=
 =?utf-8?B?RFpDOHJQNmh1eCtLSklsa3JpWS9seUdwR1NRUm1aUlRVMDU0dy9GejM3UWw4?=
 =?utf-8?B?ZUZ6WEF6WWNlRjJhNGJoaFF6dG83N0FjZWZBb25DSytnK296UUYwbUZ1WjNl?=
 =?utf-8?B?b2pXSHBJc01INXZsVzFzcjlDNXllRXAvSXhuR2NIaTlJZTZjZUdGRlRmUGNp?=
 =?utf-8?B?NCszU0U5anB0WFZpOG04UXVBam12RmhacWZiTTJhdVdrT2l1b2dhKzRldjI0?=
 =?utf-8?B?OGJsd3h0cFhnN3BjbDkxcnBCajd5c0dkb01MTDVVaTVzU0gvUmIreFFlOENJ?=
 =?utf-8?B?OEZjSnEyT3NhdDJhdFpyUVcyYmV6cENDb01XMHBtcUY1b1I2VFI4Vm93UGI4?=
 =?utf-8?B?ZG0xNE1KOFdhdHNjTDd2TjdoOHlqcDUweXdvL0JRdHliWXJsV081eE1GUTdH?=
 =?utf-8?B?MVRiSU1tR3ZycG82ZmNTOW9WNlZtZjdheVhQSm0zeEdyUVV4cVh1Ny94OXd2?=
 =?utf-8?B?MythS0t2ZXBNR1VSS053Z0x0SXhZMitTODdSZEo3cmxXeTN1Y2R5TUFyclBw?=
 =?utf-8?B?Q1NpenJqaTRQVzVObDdRcVBkZGNZblo1VFFjQ2FSY1d3VDkydVhDZnd2eTZF?=
 =?utf-8?B?THpwMHdtUlJuN2FsS1FHbFdYbmZ5dHhPbkJuK054eW5TRFpGdXBQRHZ3SktV?=
 =?utf-8?B?cDIyQ1ZCOFhvaGhQalRBa0lsVWF3M1NlR1BkNWRRQVpoSmJMeDBORCt4akVU?=
 =?utf-8?B?SFBsSmgxbGNiNk1Rbm9WMTY4bkN1bGlLODk2MW1OaWgzTHlZVCs3YnhHM21H?=
 =?utf-8?B?M3VqUDFmemVGYmFsRkpBYXVvclplcnRzdGhPbUQzazU2d3dFZkc0UUZJOTlx?=
 =?utf-8?B?UDJyc2wzdmtUVXhnT3B5MTRPOVVlVFcwNVpwVFBUa3U1K0U1dnBoUXJNOUJV?=
 =?utf-8?B?MG9STm1BT2VpSEJLMnlYUXhJVXFGWkJsQjQvcFZzYUM3dHNLeW42N0t3YU1Z?=
 =?utf-8?B?bWFmRkIvWkFRay9pVm80TEkyRDVnQTRoajZPSjN3UU9KKyt3eU5HaEFDVjdv?=
 =?utf-8?B?TktqblFVT0xqSWMvNldvN2x4UEF5NWN5RmtXMFA5R2IzdElJOGJyMFkvclJr?=
 =?utf-8?B?d0hTbGRIaVMwVERSWW5Ha0M2UUlxNUdJZ0diUlJLeDh6ZmRzYTBtbHJ2am9H?=
 =?utf-8?B?dUxBd2RENExaS0p5bzdXYk1DSzE5ZzhiUFl1cDFrdi83anRzdldnR3hlMFMy?=
 =?utf-8?B?S0IrOGwvNnNDMk84dFh2WVcvNEFreWswT0JYOXBtVCtHS3Rqa1o0SE5xNUk5?=
 =?utf-8?B?NFlQLzhRSzN5T0hjc1dYNmkvZ2pGTlJDWHJhK1A3WEltb0I3Z2MrTm5jWVVp?=
 =?utf-8?B?MEFnUXVRTHU0aGtqWDVXczg1aEQrWGxxKzdPQ3Brd0hGSnFkR0RscENUZXkv?=
 =?utf-8?B?RjBaTkRvQXRPTExSMk5tSXozV0NKdWxmYVM1WTNuY2JXUlZ6L200OVRsZUtQ?=
 =?utf-8?B?YWYvSWNzaWlLWmhpRnYyQkJaWVpiemljVlI1bkw3RjJJaW9VWTU0dzdRSGVu?=
 =?utf-8?B?d2RacURRajRlOGRjWEROcW5LSHRXWUFkdkFvQXptamdNZTJMZjBiamVZL3Qy?=
 =?utf-8?B?TWxaN0p6MVNVNFNMbFh3TVVVS2ZyL0tETFJrWmRYa0R4V0czbm03VjJiempn?=
 =?utf-8?Q?RuPG89N7qTVNjiQQ9EXeMUqN9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b28c717-130e-4601-bf28-08dd784cd678
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 16:29:16.9174 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7pJmA6WNTBzysnJbVxZ4/a36RvqOPV5NeBUvSjBzkNb9SnlbOz1XcbggVHyHaEP2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8797
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

Am 10.04.25 um 16:53 schrieb Bastien Curutchet:
> Hi all,
>
> Many UIO users performing DMA from their UIO device need to access the
> DMA addresses of the allocated buffers. There are out-of-tree drivers
> that allow to do it but nothing in the mainline.

Well that basically disqualifies this patch set in the first paragraph.

To justify some kernel change we always need an in kernel user of the interface, since this is purely for out-of-tree drivers this is a no-go to begin with.

> I know DMA shouldn't be handled by userspace but, IMHO, since UIO
> drivers exist, it would be better if they offered a way of doing this.

Leaking DMA addresses to userspace is usually seen as quite some security hole, but on the other hand with UIO you don't have much other choice.

> This patch series use the dma-heap framework which already allows
> userspace to allocate DMA buffers. I tried to avoid 'polluting' the
> existing heaps to prevent inappropriate uses of this new feature by
> introducing a new UIO heap, which is the only one implementing this
> behavior.

Yeah, that won't fly at all.

What you could potentially do is to create an UIO driver which imports DMA-bufs, pins them and then provide the DMA addresses to userspace.

But please be aware that DMA-fences are fundamentally incompatible with UIO. So you won't be able to do any form of synchronization which probably makes the implementation pretty limited.

Regards,
Christian.

>
> PATCH 1 allows the creation of heaps that don't implement map/unmap_buf
> operations as UIO heap doesn't use them.
> PATCH 2 adds the DMA_BUF_IOCTL_GET_DMA_ADDR which transmits the DMA
> addresses to userspace.
> PATCH 3 implements the UIO heap.
>
> It has been tested with the uio_pci_generic driver on a PowerPC.
>
> Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
> ---
> Bastien Curutchet (3):
>       dma-buf: Allow heap that doesn't provide map_buf/unmap_buf
>       dma-buf: Add DMA_BUF_IOCTL_GET_DMA_ADDR
>       uio: Add UIO_DMABUF_HEAP
>
>  drivers/dma-buf/dma-buf.c    |  29 +++++++++--
>  drivers/uio/Kconfig          |   9 ++++
>  drivers/uio/Makefile         |   1 +
>  drivers/uio/uio.c            |   4 ++
>  drivers/uio/uio_heap.c       | 120 +++++++++++++++++++++++++++++++++++++++++++
>  include/linux/dma-buf.h      |   1 +
>  include/linux/uio_driver.h   |   2 +
>  include/uapi/linux/dma-buf.h |   1 +
>  8 files changed, 164 insertions(+), 3 deletions(-)
> ---
> base-commit: 5f13fa25acaa4f586aaed12efcf7436e004eeaf2
> change-id: 20250408-uio-dma-9b011e9e7f0b
>
> Best regards,


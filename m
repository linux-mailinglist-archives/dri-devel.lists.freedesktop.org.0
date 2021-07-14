Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0C13C869C
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 17:06:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 712956E3EB;
	Wed, 14 Jul 2021 15:06:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2080.outbound.protection.outlook.com [40.107.94.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC3836E3EB
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 15:06:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NSsvjS21ESZOA99OniGs5U5g0T00gT6qb7Rso+BTNEudDjPpcWS645ChYTQfA6t7rw+HvJtdbBkWoUgjv3ksMeIQxa9mY/jmhA9JlABJQN7Oi/NzmBfPpfa0n4NhXCTf4Rme8PkpBPiTMiPjnELlvXGOSJe/BdX2N/5f7sUlZIpKIo4+PoGBAkJEgAfv7010uLMRgi6poe4S52UphQYhjjvk4VONXO+PCshqwiQ0cNYVCPzjPGiIPHTzi1WQkRYgaAJNnieh4/GK/QTVfTs74bfKXzdMe7pG39sBfgYA2XE+ZUE1f2bdrgAWQ+tDjdGnoGwS87WLJicqWAUnHyB9qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=23oYlosouXRySRrbuK/hPx35w0aXy5s3dmVjZhxPKVU=;
 b=h6Cl1NyR+8Y2tvNNfatJcxDFuh/7f+MDsoR37pEOIq9OLZclQmcykdMCB43Er+PsomF7ztKBZNL/tEQxAuoj/bitx/OVRKVzT723B6qDwaO7DOdxcfNL7PU4Sa0ifp24yLr3Il9V7Hh+mgcvHJwUXsUqPW+ZMVbnlCHIU+JOT3fBxGOT+ki6lCNIJSaxUdFGTspfOWYY8+pdR/x6TXAJJvb7rql/GHASKFDhQXmhhyEaSABn8t7vTJ3YUahGFs1vUnTHB8stBAixXUjc7wSaGlslN7hs1Ve0GI2Bi9xRDYUJ6/DlBZVyc20vh1n1CtO/6YMidgkUY0RL9EpMLR2iRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=23oYlosouXRySRrbuK/hPx35w0aXy5s3dmVjZhxPKVU=;
 b=CRUr4dnDogRRIuOo2D+yrvm8SRMzjzvoJ9sftGJevjR0T+VZgkYa3kDtbG77uMIxr1gcYvGt8wMeXjMkjOSsIXJ1n1yxXbknkLT3E9bkCEp5nIxdPBLGvKlpLfbj5lVRFtfwy2m2Y+iNfUZwQHv3/3unknTHCEzsGqCZyKdJ9Xk=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4815.namprd12.prod.outlook.com (2603:10b6:208:1bf::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Wed, 14 Jul
 2021 15:06:39 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4308.027; Wed, 14 Jul 2021
 15:06:39 +0000
Subject: Re: [PATCH] drm/ttm: add a check against null pointer dereference
To: Zheyu Ma <zheyuma97@gmail.com>, ray.huang@amd.com, airlied@linux.ie,
 daniel@ffwll.ch
References: <1626274459-8148-1-git-send-email-zheyuma97@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <e3232983-895d-b24c-2e25-bf874d8007b1@amd.com>
Date: Wed, 14 Jul 2021 17:06:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <1626274459-8148-1-git-send-email-zheyuma97@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR01CA0168.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:aa::37) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:36d5:a331:b1c9:384b]
 (2a02:908:1252:fb60:36d5:a331:b1c9:384b) by
 AM0PR01CA0168.eurprd01.prod.exchangelabs.com (2603:10a6:208:aa::37) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22 via Frontend
 Transport; Wed, 14 Jul 2021 15:06:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 22046fb9-ecf5-4993-31c1-08d946d8fb60
X-MS-TrafficTypeDiagnostic: MN2PR12MB4815:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4815B0620C73409631D58D6983139@MN2PR12MB4815.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Pavygty1II8YogIdJ8ZoZE7P4qGoB1wQdIZGz/hHkV3XkOLOSXmwdezsDCK1wWTJwq6T/SAGy7tcCPnwYBgXjHIGPi5vMyWsYDC4byVcUZbQ3PfraVVHKpi8xnU5SVqD/N6lAhSKmu4Ccssq18KNnEZkXsL60sT/d2SlI5VGqkYL2C1zvlX5ofL869FbvFlrypnzeNludfbauXd8IOoTcC9LJr3ZM7pSs/Y87lysyq27bLeUkki3XDuuBszR34e8SEv7ch3Px+KCza1Wz3EBdj2JHFZ2mmLBonKvp8uETGbm3pUhazEd/tKa9qxf1U1UVJ4SvyDIf55Rddy3ML4C+XeDDFe2Rs4CSHIIvNxvD0nvAJjAPXdq0Jci/5pqaLpZlL5b5pSR2866bcXgu5fr+T2FnzHB6YAcU4s+PuDxSlZiNirzL9sj9zxSJxe6q2PYj2fAnpOQju6vuzqAD62DtE3VQpC8gVR8z8gwRiGaZzquL4bXswqTds5m7KIX3hzPE7KMiZzlJYEVbHVe5tR/NmbLsx+KhcyslUNr77cOqeQNOYhGU8gTgVSjS0jMEgGMci7O9UwjQWPxMt9tK5xXtcYHB3a49D9WJ/nJyPeITU3wvB6/mKZzRCFy7TWOiHIG8bw5E90rmzPiYzgyq9yl82Cj18G0A9/M0pVjCPpLWaiPgRpGGLqJ0ad+kGDbB6gNnDm0O7dYCflaki1PLMmdGA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(396003)(366004)(39860400002)(376002)(316002)(6666004)(8676002)(31696002)(6486002)(86362001)(31686004)(2906002)(186003)(66946007)(36756003)(4326008)(38100700002)(66476007)(2616005)(478600001)(66556008)(5660300002)(8936002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1BjZXJKbTYvcWFKVGFkcnByQlVJK3EydmRMUFlza28xdnNJSm9iSy9XOFNa?=
 =?utf-8?B?aTlOUEdFUk1TRVEyckVFTEg3T3lFLzR5M3diSFpqUFlaUFlkcDRZU3JFczlR?=
 =?utf-8?B?WVVvamFabjV4RU1tOWRTMTBXZHQwYjVYd2pHaStQL0RNNnRaWGhIbjJOaWo1?=
 =?utf-8?B?SWE1RjZTQzAvM1MvMUdkMURONWtBbmluSXd6RlcwM0NzSWw1cFh0MHpET29J?=
 =?utf-8?B?T2o5Uk9QdVhyaHNBVDExNE9LTk5WTExrSDh2QjcydXRlZmlScFM5OFo0K2Np?=
 =?utf-8?B?Sjhkb0YzRHNXT0MrYlJJbGJ0OXJEVnVuamR0a25lb3RTd1lSYS93RmE3QWVo?=
 =?utf-8?B?c2p1WUNmSVgzbllwTlNjMXVuT0QweFhadmMrS2xHV1BUd1pjS2xoUTh6ZkRB?=
 =?utf-8?B?M1NWR09VOTRhODZUa3lMVzBNWCszdmwxM3p4R3A0MVF6QkovdkZuZkVsRlFL?=
 =?utf-8?B?aEplUlVDV3UxbTRzZXk0VWV2OWliQklEd25QaGhWV2FDV2svR3poRFliTzdo?=
 =?utf-8?B?dlUxUENpNmFLZDFlSlRXdFNMZkRKRXZrUmFYOFVkUG1SSldNb3lLWm5lbitB?=
 =?utf-8?B?T0pydTBpT1BrcWVUTnpPa0wvZzVCcnlrMk1TMVJ5YlFCSWd5eHliOVBqNTlx?=
 =?utf-8?B?eG4zVEdzc3Q1dkpERUlheUYxMExzemNFMlVKR0VaRVh3Q1FseUYxSGxNekN0?=
 =?utf-8?B?RUhJbkNIL2dETVJFTVFsdVM0c2tFMCtkM1lTVU1jT0pRZ0ZZWUpuNmlqK0dx?=
 =?utf-8?B?L3kydEFuZmlqSzQzZUZqVkxEWDA0T3NtUW5lLzFCRGpmVEhrdFZsRzEySkda?=
 =?utf-8?B?Q2l2MTFlbmdqR0hiMmljMjB1dUJqWjJJV0ViMTI0andoRVcyZkhCZEMraHRJ?=
 =?utf-8?B?Ymx4LzVwUTRiNWV0QnFYSFhZRXZzZHUweCtFR3VLcTZyS3BINWFxcFlkdE9j?=
 =?utf-8?B?WXcwSGlJbndoRlpLODZjaUY2NkpVd2s4aDZGakFPSlluOXVYNlI5VTlISHoz?=
 =?utf-8?B?Y0xVRXF0Z2JMaC9pVEVMWnhXeE9TWFViS2R5Y3NFbUFVZlJadmkrUVdndGZx?=
 =?utf-8?B?ZlZHcHZZd2o2UzdNc1VhSmpRbWdrNmRXc1hDUUY0R2hWUERqNFlaV1Rqc1Nw?=
 =?utf-8?B?TldCdGtjcXlVSnAwZW1YeG45U3duWEJYWWZqdUhqbS85UFZudGxxN2NES0ZR?=
 =?utf-8?B?YlVIRzZ3MUZ1WHYxVHJSZnV3d0kyUkY0a1NBbEFJUGlYdWxaQU5DZEgySXpY?=
 =?utf-8?B?bG9nL21KU214RW51QUtJMkhWdWswZkt3VTFaUWplTGRKUmRoeTJXdWNZejl6?=
 =?utf-8?B?dklMK09TVC9tVEp6U2hVZXpnQTljTnFFWTkrOUw4MjUweTJaajZJQnFSN0oz?=
 =?utf-8?B?SHFOUE9aUU9sOFF4MVRtNjYvSnJkUUJuUWpkdmZqTHVpTmRRckRpblRHZHFa?=
 =?utf-8?B?bldDT0taSDNKdnFRMmdXV3l1YXNHL0ZwNksyRjBjN3RvTHlndUJyaUF6MWFl?=
 =?utf-8?B?cDNzVHMzQ0FURHNMZit1MWNUVFNHME1XeEYwbWdWY0x2TXdabmlCTHFESkpa?=
 =?utf-8?B?NTRBVnc0ajRVM3JOR0VRWGtZZXZURzBGcWxJQW9mQ1pYRkdsQ3BUMGFTOS9v?=
 =?utf-8?B?bEhuTkhkc1J3ZWVYTjFRMVR1MWZGbG5qS3c2eVFOWVkrMGRhbVZEUlF4YWkw?=
 =?utf-8?B?RzRTREVKMUdFSk9ldERiQ3BvbDQrempVa1ZuYVdyOGdSdEx2dUpTOFgvTDQv?=
 =?utf-8?B?TitMZnYrcXJFVjBkemZGRGFKQnNGajN0N21sN2M4YTNGNzh3TW13Z3pKVzBE?=
 =?utf-8?B?aTZrenhra3RvbHRJMkN6ZFlxSWorQ2VFQjF3WlQ0R2s4cUxtT0tBN2YrM09B?=
 =?utf-8?Q?9wATZxHjPRHoY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22046fb9-ecf5-4993-31c1-08d946d8fb60
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2021 15:06:39.5370 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JKyEtV61KtAri7hOKJPIqC7n4if2mBvjUDOFlgGJCXCYKBTTpIyN+hQuQqhUqiju
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4815
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 14.07.21 um 16:54 schrieb Zheyu Ma:
> When calling ttm_range_man_fini(), 'man' may be uninitialized, which may
> cause a null pointer dereference bug.
>
> Fix this by checking if it is a null pointer.

It would be better if the driver doesn't try to fini a manager which was 
never initialized, but for now that should work.

>
> This log reveals it:
>
> [    7.902580 ] BUG: kernel NULL pointer dereference, address: 0000000000000058
> [    7.905721 ] RIP: 0010:ttm_range_man_fini+0x40/0x160
> [    7.911826 ] Call Trace:
> [    7.911826 ]  radeon_ttm_fini+0x167/0x210
> [    7.911826 ]  radeon_bo_fini+0x15/0x40
> [    7.913767 ]  rs400_fini+0x55/0x80
> [    7.914358 ]  radeon_device_fini+0x3c/0x140
> [    7.914358 ]  radeon_driver_unload_kms+0x5c/0xe0
> [    7.914358 ]  radeon_driver_load_kms+0x13a/0x200
> [    7.914358 ]  ? radeon_driver_unload_kms+0xe0/0xe0
> [    7.914358 ]  drm_dev_register+0x1db/0x290
> [    7.914358 ]  radeon_pci_probe+0x16a/0x230
> [    7.914358 ]  local_pci_probe+0x4a/0xb0
>
> Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

Going to push it later.

Thanks,
Christian.

> ---
>   drivers/gpu/drm/ttm/ttm_range_manager.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c b/drivers/gpu/drm/ttm/ttm_range_manager.c
> index 03395386e8a7..f4b08a8705b3 100644
> --- a/drivers/gpu/drm/ttm/ttm_range_manager.c
> +++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
> @@ -181,6 +181,9 @@ int ttm_range_man_fini(struct ttm_device *bdev,
>   	struct drm_mm *mm = &rman->mm;
>   	int ret;
>   
> +	if (!man)
> +		return 0;
> +
>   	ttm_resource_manager_set_used(man, false);
>   
>   	ret = ttm_resource_manager_evict_all(bdev, man);


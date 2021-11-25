Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD6345E29B
	for <lists+dri-devel@lfdr.de>; Thu, 25 Nov 2021 22:37:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A0BF6E85C;
	Thu, 25 Nov 2021 21:37:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2041.outbound.protection.outlook.com [40.107.93.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D0FE6E820;
 Thu, 25 Nov 2021 21:37:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ocSsFrPxzU37e7+gje9i4/tcEykoW188O2F+Uhk53NAMayUClFDYv7MKQwNGr2puBnJr40JalWqDNs6eFa9WloONDoNACFhbOPW3+Av6mCLIiDo9DaZ2hrfXed+ZmnOHQ9nZTKWHdmN+v8RDuBHciyvTpwLwUwNYHgyBWVXsOxDH96K4vD5VfhzMwYutI/9C61ZJEe4Oc0HHI+SuMhEmO/jHDNdWtukpPnJF2bAY7RmYDpwK6BWCo6FOXvChxp+peQiekLXXP/UG2XJB5jhZ6XX9o/+Fvi4JKsXhymG6ekt/UrKKW+0OfJc8En5ZiemLKFBTnv1yDXMmH4uZ6Fy7UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wb+CAMCK7x04yN2s3N9Go+Ugx3iEY4/u/AIZBD3X3XQ=;
 b=YuKokgTIuvAE9dnti/178T6JFkQq1v+1N3YdDG6OeeI+d3qFv/1TVbeaGETXXF3AWe51JFJ5wlROmHaP4LxAE0r4TRaPS9xIM/m3SfzjyYqiUNzARHoXh0DuK2HAd0XcrtY+w24+3B4rk0+cdd2ctbbb2dyvrR6CsY3KKQZrNez3z/ck3sh488qBZaGuivM8uhcqV7k6EtNz9QGYSxH91Q0yg21QsFCwsv4nYEq2bIv3jZHqyLN26R+wY2LIfeotNVGilYBfYAgAWvhAvqYZHGCTnZUHGCLD0wVf2aGt6f4NRIzIsG8qp6AvIR7cs3l9Iht9o7+bU84SOBUm4Fj8+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wb+CAMCK7x04yN2s3N9Go+Ugx3iEY4/u/AIZBD3X3XQ=;
 b=gsKllM1AAg6/Y9v8QUUouhr/nax+NV1tP4HU6ScmuSUm7tmNe/PSJMGwePktEyQtc4okfMfn6DLxtTq03C3VKSCoqTLNAjmwI5XQVNl7Iipm4YxzJFxU2eXmp4D7D+gEBNpHt3zj5hPR59QpRzL3oNK5AHuRznltqcq68fwUxL4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by BN9PR12MB5338.namprd12.prod.outlook.com (2603:10b6:408:103::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.24; Thu, 25 Nov
 2021 21:37:10 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9dfe:ccc6:102c:5300]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9dfe:ccc6:102c:5300%8]) with mapi id 15.20.4713.025; Thu, 25 Nov 2021
 21:37:10 +0000
Subject: Re: [PATCH v2 2/2] drm/amdkfd: Slighly optimize
 'init_doorbell_bitmap()'
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch
References: <cebaed4e892db804eece363e07a3ddd04af0f7be.1637700315.git.christophe.jaillet@wanadoo.fr>
 <72ac7967f07e0794a8a06793407cf03f6a34e9fa.1637700315.git.christophe.jaillet@wanadoo.fr>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <549df417-2aee-55f4-78f4-d6dec478ffa7@amd.com>
Date: Thu, 25 Nov 2021 16:37:08 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <72ac7967f07e0794a8a06793407cf03f6a34e9fa.1637700315.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YT3PR01CA0002.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:86::10) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
Received: from [192.168.2.100] (142.127.191.123) by
 YT3PR01CA0002.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:86::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.22 via Frontend Transport; Thu, 25 Nov 2021 21:37:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b84fb395-534c-4776-8b70-08d9b05bbc5f
X-MS-TrafficTypeDiagnostic: BN9PR12MB5338:
X-Microsoft-Antispam-PRVS: <BN9PR12MB533842604ABD2610EEF4742492629@BN9PR12MB5338.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ljS+CkhQsFWoUsLQ/bRpvLAulVntwi54gxSMuHfzCfg8hb8td8r5lFnnvp6hzJAoctaVVbrexr3Xttg9y89mTXxbNRJ6eDs3uFQDj70HIEr/jAJgod728gaSxH733x2/DWsowga31IQPWcLxEOZwgOd+lUDAqrIFOwORGDno2oYZbhJkyQIYIZGbX6WMLRXhv2eUaoxhRHjaD+L8eGt1EjGu3JgLlsOb8LecBbRemySCC+NtBnq2sr3o7Gl9g4FesERTfjui/xl+yUzZIsfT7XppjCFs5VP0h+5yc1wTL4nkQwTjmKWDfBiGRTQZ81/O3+GDpMe5nIcKEElb86ruRyCy4bZIpd5Xkx3bSqhsG8XwoSfPDimEgLJjhDBuXWCc4AE/12Tktk1S0vAWCJ77fsyuqRiD5AmXw0It9FqHb65Fp/5qqSusj8l+ATCnmQVqhC8AmU8ObjmTmZKGUvEI8Rv8UL/mTzecJLNpKYizYQU5XdfoQhhO4e2Fr55A1mMXK7Ygq3MQu8VJLHVU3Tu6ukyU+7X5fOvm/HiI89G6TaHMxr3SHeOJnymTBbVDYh7KDMJqF96o83r3/knERxDgYoYxxW63lA8zuSY3O8EKCRoiM7XRcrDPPCEqiMVXdPaVgNIsOga6ymQ4XuYs9W0RJ7jWvDV59QOd1t4mO6ov7sXRBkkOGirn8lyyIC34IbcCSmiGGxoQShD+aQ7U1kt0aHXJbChWflc2ov8X58GjRWYLCcKuiNfBkaKik8AbiCSm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66946007)(66476007)(66556008)(16576012)(2616005)(86362001)(186003)(4326008)(83380400001)(8936002)(6486002)(31696002)(26005)(508600001)(4001150100001)(31686004)(2906002)(8676002)(316002)(36756003)(44832011)(956004)(38100700002)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1ZsRDEyVFNtZW1YUDBhNlhibjZnT3lHTTZ0Rm55WURrSjhOUUpzRGVOdXJk?=
 =?utf-8?B?MVZRL1FtMmRYOEdlNTdOQUhBWksyM2tNUjMwczZNQTV0RExRM1JPVzRpQUQx?=
 =?utf-8?B?OCswSFVhaDNLY09rb0w5QldzNzVMM01rU2RsV0ZhZVZodzlPc3FMeGFWRUF2?=
 =?utf-8?B?ZXR2dUp1YkwwWDBGcXludDQzL2lUdEM0T0t3UTZuNU0yaC9XZXR4OEg2RTAz?=
 =?utf-8?B?MUEwMG1Bd3lORHQxazRscEEzbWtPc24rTHo2Nk9ENzVMRTBCTDc4OVNHSGgy?=
 =?utf-8?B?THRiMjYyUzJNeTJLWktFU1lmZE5GUkJxbjNEQnhOem54K0ZKRlg5OVRyTHlZ?=
 =?utf-8?B?Ymw1R2hNTlJBTFI5VE5ERVZ4RzlZb3BNWGI3d1JTU0QyZURVenZ3U1JwOUM2?=
 =?utf-8?B?dGpQNEdFSERKOFE5OTdobkRZWUpZakRpRXhvbFVzZExqaVlieHlhS1Rzc2FK?=
 =?utf-8?B?aHhwbkIvN0o0TjNBR092Y1IyMVJpVE9OS0xJVCtwS1ZIK0szb3NBeUxKa1A3?=
 =?utf-8?B?WTBNOHhsTk5UTXBBVklDMDhhZlk3VGJmUUx2WmhXNmllN1EyeHF1MjF4OWJT?=
 =?utf-8?B?ZVJsTkdnaG5IdlIxdTRRWVdSUnlzY0VqUzhIR1lCSWJJU1FNbEE0Z1ZIV3F2?=
 =?utf-8?B?UjRvS0NIS0lJbHc1clZVTlorTm5PanYzNEZoOC9tRVQxUUpSSThqeG1SWGFz?=
 =?utf-8?B?S042emxQOG1KRjJCNXBVVGJTaEk5bEsxTFZoK0ZrbkE5YnJ0MUVKQStHZkVR?=
 =?utf-8?B?a0l1bDJjVDc3eHpITlJEc3BmMGE5NWNuOUo5YmcxVVlZSnNLVXNab3JnZXJm?=
 =?utf-8?B?d3I3U0Z1aUkzQkUvRVZkMlJhdHk4aWtYOW1UNEhUdU84VTVSaGpISXVqc3hU?=
 =?utf-8?B?bS84RjVDdXVkTXphcjdYZDZMUXNhT1dhNWNkZnhydk1lQnEwRnc1bEpkNWRU?=
 =?utf-8?B?SFM5cTA5NmZ2d2tUN0NIVzNoeng2YVlWQnVyZFFMLzEvMi9xWnBxYkQ3NENj?=
 =?utf-8?B?OXN3Mm1vLzdqK0w5RE0ySTFYWDNyR2JFd2hNUVBBYXdKZ1RMcFJYS044dE1j?=
 =?utf-8?B?T0FSSnZzRHdYL29DT09OR21jb3VuLzFNVnNvRkZVYVlHRmk1WGovUHZUZ2pZ?=
 =?utf-8?B?YWZmVHpKKzlEekFuOHdBZGlJVTBrd25MeFZXMkI4MmZlOUllNnRuTm8zVzRK?=
 =?utf-8?B?U1g2NXJlOVA3QUttK3E3SHBtSWNCbXFJRUFORjdFUy9KYXROK0pCSEpYR0hM?=
 =?utf-8?B?UzJ5V2NSVnBObG5XTk55Njk2VEZYRzRKWS9TS3hJblpBNWh2enJiOFRvWFhB?=
 =?utf-8?B?RUFHamFnbFpiMXNPNndGQmlabVdlcTk3K1c4cDlpRlV2dTZDbWJKbjdMdkF2?=
 =?utf-8?B?Y3VYajRWZHZ0NmU1S3pOWXVMdng1cHB0SkFDUnZ3M0w3WStQMm9MUE56Q0dk?=
 =?utf-8?B?RFBTc3hXRTAvL0c4T3hxaEJMeHQvTkRPbElFcnFjbEZjZVFVeUhVZmJlWmp5?=
 =?utf-8?B?QjRsTU9saGdDN1VDSHc0ejU2a3g2Qlh6WW5lR0drWXBtYjdRb25YTUVlNzh3?=
 =?utf-8?B?dWZlc2lMZUpjL1diMDUzck10RGs2eHJ5TFlDa2ViTnNuWVozUFNmWnBsbG9m?=
 =?utf-8?B?b3IvR1N1S0xPWlZSd0dvU1NlSGs2MkhmRUlwNGVxelJWdXVOamJOcUlxeE9r?=
 =?utf-8?B?YitmcVdMWVhyOXh5dGV3MTFSNjFhc2pxMVE1Qlhndm9kQncrbTh3ME1nMGFT?=
 =?utf-8?B?eStXVHNaS3J0R3VNd3kvdGhFbm14QkY3L1ZUYWFycld2cHUwWk80NGlGeGtN?=
 =?utf-8?B?UWJ5RXNOZkhLdEo1OStlTW1NdFdsTVZvbGRzWkNkRit3TGowQTRYdEdIck1N?=
 =?utf-8?B?Zkx0MisyZHJ6K1g5TTJFbkpPZHpuRUV1R083UERVNXE1MGFLaGUwUFcrYnBK?=
 =?utf-8?B?R2dTSDZhbDB4U3dHdDZ6OWRqTjJWc2FZY3NNb2NLZGdaUFRKNFB1VVNXSE9F?=
 =?utf-8?B?emJERDFxSnVvTXlwNElkWjFhSDRSUHZqU2J0aGdaN1RpQjZLUExBTnlDMlo3?=
 =?utf-8?B?Tm5sNEdvKzBoby9leGdWUzA1VExmZENpbjVJcGdyMHBTT004Z2NhTkVTTENs?=
 =?utf-8?B?V2U4c2cybkhOVmQ0V1k2S0IrSTlIeWRwQ0dVamNkeHgxM0ZyZ3FyMHdJdEts?=
 =?utf-8?Q?Qa/GyBHJj7ES19u6Bx2EJYA=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b84fb395-534c-4776-8b70-08d9b05bbc5f
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2021 21:37:10.4385 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /8oN8PF1usGnuggEfzbjnA080809AMyLMvbbQUtE0ZcCNnv02OTkeS1n32rYn6vEbSvPn9PP9Os3fKgXODSM/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5338
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
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 2021-11-23 um 3:46 p.m. schrieb Christophe JAILLET:
> The 'doorbell_bitmap' bitmap has just been allocated. So we can use the
> non-atomic '__set_bit()' function to save a few cycles as no concurrent
> access can happen.
>
> Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Thank you! I applied the series to amd-staging-drm-next.

Regards,
  Felix


> ---
> bitmap_set() could certainly also be use, but range checking would be
> tricky.
>
> v1 --> v2: No change
> ---
>  drivers/gpu/drm/amd/amdkfd/kfd_process.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> index 67bb1654becc..9158f9754a24 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> @@ -1446,9 +1446,9 @@ static int init_doorbell_bitmap(struct qcm_process_device *qpd,
>  
>  	for (i = 0; i < KFD_MAX_NUM_OF_QUEUES_PER_PROCESS / 2; i++) {
>  		if (i >= range_start && i <= range_end) {
> -			set_bit(i, qpd->doorbell_bitmap);
> -			set_bit(i + KFD_QUEUE_DOORBELL_MIRROR_OFFSET,
> -				qpd->doorbell_bitmap);
> +			__set_bit(i, qpd->doorbell_bitmap);
> +			__set_bit(i + KFD_QUEUE_DOORBELL_MIRROR_OFFSET,
> +				  qpd->doorbell_bitmap);
>  		}
>  	}
>  

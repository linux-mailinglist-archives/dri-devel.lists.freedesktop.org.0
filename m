Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E872B39DC67
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 14:30:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 088D06E3EE;
	Mon,  7 Jun 2021 12:30:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2073.outbound.protection.outlook.com [40.107.243.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FBF96E3EE;
 Mon,  7 Jun 2021 12:30:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WaOR4QnfBhxTgRkad6CeTOYYso4ov2FLd2K1f+UK0cWIzp4hySZUL9U8EMRUaBAmxm52Esxy3gptaew4GuAwoIZez0jShcS+lMyPNvUnQsJD78ADAvEeQxjl4d2Z7gzFSVB2gsqv3YICP0MtWWUwxcKTyYcv/TFrb2XbEVW6lJ+MTfb3Vy73kZc2zD92PkF4YRxaqfgBrUXUAj0jA/CDOaBf4Y39kzC2ZOFFW4gpxFH2Ec8PJOkxPTJkgI9Cs/jgre8qBgxILa3ulkSaA496yUTBjXAb3+ihDL01G76fUWp/UlsoS0KIg06EcEJxPQVzLXm2EDsHapb7x9/XMYdeNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+LHaEp6FgdjCtVQQ64Jpdk00DtkzC2sh0TaX1Iq1K5Q=;
 b=O+TPNylp/ggmlaw0w8yPyR3yZtNE3hlQRUUNx8eYvy+qykdnccnoNTyOpNhaxV/nnwPFS8it1GgQLgJ8oLPeVU0DHMM7jK7/3rmTohIrGXh9a3BbcV5H1BdWtqw7pn13LKDfsTKbxc2tCrjfbklijfVzjS8np8/rWDVZyU5AsygvC59C93ZebyhXz1894moPKUzWx9xVDZs06SE6jEQP+SlTICUQO5xA8hdCddDMiPguo5J+scy0PxlwTBGMtnHB0QAARxz0uBlm9aNguUvfXet9RAjjHVSriR7k13cqsid5+wkeqBZwpb6bPNZBNhWNwdBX1Nu4L28+ISUfETdc7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+LHaEp6FgdjCtVQQ64Jpdk00DtkzC2sh0TaX1Iq1K5Q=;
 b=bC482w5bqc0HjYDn6hQAddUh44Ph1UEb1K2vbOj3pV0vynrfA7RNwLIqRWK2L0FoA7DVXv+TWDgKLtoj3YGGPGPp9LSKRAxxQEc4F8B+xnCcptJED/8xrAk80GkEyQrJ2Ts+TnRWSS8J9d4v2w/oYf4GYIArV4ZeP0Lh7fJDlc0=
Authentication-Results: loongson.cn; dkim=none (message not signed)
 header.d=none;loongson.cn; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4359.namprd12.prod.outlook.com (2603:10b6:208:265::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.23; Mon, 7 Jun
 2021 12:30:20 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4195.030; Mon, 7 Jun 2021
 12:30:20 +0000
Subject: Re: [PATCH] drm/radeon: Always call radeon_suspend_kms() in
 radeon_pci_shutdown()
To: Tiezhu Yang <yangtiezhu@loongson.cn>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
References: <1623068820-2479-1-git-send-email-yangtiezhu@loongson.cn>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <0d1b517f-797f-e87d-4edd-8474b16993ed@amd.com>
Date: Mon, 7 Jun 2021 14:30:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <1623068820-2479-1-git-send-email-yangtiezhu@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:ce67:4e4d:875d:ffeb]
X-ClientProxiedBy: PR3P189CA0059.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:53::34) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:ce67:4e4d:875d:ffeb]
 (2a02:908:1252:fb60:ce67:4e4d:875d:ffeb) by
 PR3P189CA0059.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:53::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.22 via Frontend Transport; Mon, 7 Jun 2021 12:30:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a8c78cfb-a448-472a-5a29-08d929b003b7
X-MS-TrafficTypeDiagnostic: MN2PR12MB4359:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4359159D43BDACF13A47083C83389@MN2PR12MB4359.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: orJp0z0dh8M2DNQQ95K/2gEMq2odakADuyxUITB43FiVhdihVipl3RfI5cWSSwkO/yZ8j6+zbR2ELrVLVp2QcWx4pgfyk7Vph02F3yHKGdJr5nh8e6kQe7cJsjKT/Lg30IQrSS4FQiP/24afiebKadun6BnJrqPV2zusXRGcHRmyPSFbW5TULyQiHoMSW3k6B5Y9q1LUcIa3ASmGjGy+bzYD+Uebl8OdxivTRGzr0sxu3AptbK5VEDzl+9mjYhxhI2hbNJv2o2CXnTcpgpiF6T1CdiA7zFx8Alli7H+cKkbpvn9yBXJ/VxGKw2jbz62jHoPKH2qFEjGW+iSVYV5a7dxoUW0pTmILOqigsraSkxgjONMAj6hgoX6JoxkqzDGHrubFDZvC5Fjn8pVpXDrFvRN9a+7/OAOeHkVdF5jWYdoFiSQQVP8CZMxJQV9VZmlPLQ8mvs0Mqmxc0B2ppnqpP06QWd6vl0SGcXTiouQG0BPqJ3w5m78ex3toEKMUJBnGXlSrPx9uJPZsgdm3khTn09QBnDBT65O9nVjyPueClz4lV5T812MvKguTU8xfLTcX+jg4Hp3dOIb4R0PP+xc4N4DdSZdfoYlmPgPe/rCvC0guaqM5n6ruKt1dRS56wl+v7TNwJyXdGtvSY2SBzi/e2ApHNpi8kNVwVtYmPag0xpUFhnVOyJsMTIwPjjqOP3Ne
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(346002)(39860400002)(376002)(6666004)(110136005)(4326008)(6486002)(5660300002)(66946007)(54906003)(83380400001)(16526019)(186003)(38100700002)(478600001)(66476007)(8676002)(66556008)(2616005)(31696002)(36756003)(2906002)(316002)(31686004)(8936002)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aU5paGNabDJZS3lUdHppZzJlVDdVSkNGamVRUU9jSUFaWkZMWHhxVVhRNVh3?=
 =?utf-8?B?TG55aTVOUU80SGM4UE9lTlRXM3dPQkYxa1IrMExvQnczSGo4d0M3SVNvSEtm?=
 =?utf-8?B?S3lYUEk0NkhXK1hiNHI5cTV4QmJkdEYyZitvYmRYRW5qazhQRXZ0NDlreXRS?=
 =?utf-8?B?WWw5QURKbTdkT1pxaE1SZ0F6TG5LVmNqVGUvc2JBTlRMNUJtZGJJT29VRVd6?=
 =?utf-8?B?NEJPWTFtREJHUUJ3M0Q3VmFsSWY3TXBxTEVoTjRiSXk2cytia3FxRzlLcUxL?=
 =?utf-8?B?cHdhYU1PRUZ3NnNyZ1hCZ1V4eWljWHBPQ2ExSFBxUTJoSGpqeXNXMThQelJS?=
 =?utf-8?B?Qy9xSTRnUENsdU44ZUYxdlhaVXh1b2FSVFNhemM0Ukl1Tkx6ZVQ0ZFhWd2dt?=
 =?utf-8?B?UmpBMUVESGVmeHNBL2hrOG8xazBzZjFaZjBZdzdRcVF2VjFUdTQ2QUNWSW96?=
 =?utf-8?B?cUxzWE5tODhRbUxIQmZvYTNrWEswN0FTcUREUjJKeFlLWjBXV3ZVMVdvOW1M?=
 =?utf-8?B?Z2NYdkFyaGFweE1UQndDcXh1N3lYSW13Nk5qclA2OTRONU1PckY2ZDJwM0tw?=
 =?utf-8?B?N1lOczhWeTBsUHZvUlgwanQ2NUxoSDlqTWZrL0NKbFN6UWhTVThxc2dUcERr?=
 =?utf-8?B?Q1RkbEtEd0IxTjZJYk9ibmIrZU9odzc4Yit3L3ZNQmt3b1RQb0lTb0xhMDNj?=
 =?utf-8?B?bVZjRHpHUWx6dlBrR2wvaVIxdkZDbWdCTUZBWE11ZDlKS3RoVGRBVXg1aTd2?=
 =?utf-8?B?V0pyL0dJajdHVy92SllhRUxwaS9JdjF6T1ljYVRaREh0ZlB5NmtOSHhvdEUv?=
 =?utf-8?B?Z01waXVZL1ZLa2gyc3FjYXJXdm1sWXBYR3VONW45eWk3YnIzMmVUSXhBWHhT?=
 =?utf-8?B?eEJHWU5aWWxYUEJ1TWM3Q2YzS2Z4eDd5TCtIcWEzVnQ0R1lNV0JyVlR4bTFr?=
 =?utf-8?B?TlhyMVF4WEpxU0xEV2pCL3pMbEhWTEdyY0ltS0VwWVB0Y3EzTnIrS3ArbWhG?=
 =?utf-8?B?QXFCL0psNFhuTW5NczRWaFpZUlNmYm9XNzR3Qm13L2cwb2JDMUIvWEZKNFc5?=
 =?utf-8?B?cy9vYWJac0NsbXNOUU5MQzk0dm5pL0xnWlNjUjNieDljYy9GMDlqYzFpRUtU?=
 =?utf-8?B?eFNxNWc3TVFQVUZBaVpWMzAxTkozV3pFVktIazZMSFg4UzlqWVFKalc1U0N5?=
 =?utf-8?B?S24rNnJFeG50aGI1Y29QMmdEUDhESVFvdnZFSEM3ZTJMTDFEdHRYaVQ3RURn?=
 =?utf-8?B?UlZFaUtyQ0xnSGxUYkpGWlhNZFVuNFhzMFgyeG1XdDFBQUhvM0dhQ3pUc2NZ?=
 =?utf-8?B?SHkvejFlNk8ybmhQZUp3TmJscHRPTEY0RkZPR1RJbTRIdUUwZENDT0lZT1Zz?=
 =?utf-8?B?YWIyYm9KRlZmdzdNdkMvZDVYN3gyemV2QUEzcFpnWlgxMFNJb2ZSWHFrRmlE?=
 =?utf-8?B?Nlp2UjZxcTZiaDBGNmU0d1JBWXpNUUNLaHMvQ2tNa3AxTitQV2lic1RPSFRx?=
 =?utf-8?B?UE1tZWQ0NHl0T2dzTUc3WWRzU2xmTnpPM2d4Qk9JNEd3K3hxalY2OHZtU2dK?=
 =?utf-8?B?Q3BwRFZTT211MHVsVzR1KzZQSHVhWU5vUFVPeFl0Y2ZMQVljeVBNK240Mmxn?=
 =?utf-8?B?UTBGcG1CemRwUGgyMjBKby9BbTBUYTBnWDNlcjgxbC81TWJXMGQ5dVJQWWVL?=
 =?utf-8?B?RllRQTRJNkRtRUxhTml3Y3lQU2IyYWN0SzdML1BuRVhHQ3dNaGNIZDYxTTRt?=
 =?utf-8?B?VVNLQ0ZVMktVbk9veHJNekM3QTVZS1BXRG5aZy9MemdJYTZqMWV3VEY1bmVh?=
 =?utf-8?B?bUVJMGp0akpuTzZlRWUwN1JBb05rbncwd0dXQ0NOb2phM0tzRnVpQmZxRDR3?=
 =?utf-8?Q?oR43IG2LRKbSc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8c78cfb-a448-472a-5a29-08d929b003b7
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2021 12:30:20.6274 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZrsnwA5A92nWjAtYv+WccAyKzEh8U33sxrStHo57G4Rwr9eKDuZ8YR6UijFGmsMR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4359
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
Cc: Jianmin Lv <lvjianmin@loongson.cn>, Xuefeng Li <lixuefeng@loongson.cn>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 07.06.21 um 14:27 schrieb Tiezhu Yang:
> radeon_suspend_kms() puts the hw in the suspend state (all asics),
> it should always call radeon_suspend_kms() in radeon_pci_shutdown(),
> this is a normal cleanup process to avoid more operations on radeon,
> just remove #ifdef CONFIG_PPC64 and the related comments.

Well NAK.

Alex knows more about the details but suspending should not be part of 
the pci shotdown process at all.

We just add that here to enforce a GPU reset on PPC64 boards for some 
reason.

Regards,
Christian.

>
> Co-developed-by: Jianmin Lv <lvjianmin@loongson.cn>
> Signed-off-by: Jianmin Lv <lvjianmin@loongson.cn>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>   drivers/gpu/drm/radeon/radeon_drv.c | 9 ---------
>   1 file changed, 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
> index efeb115..0b1f43d 100644
> --- a/drivers/gpu/drm/radeon/radeon_drv.c
> +++ b/drivers/gpu/drm/radeon/radeon_drv.c
> @@ -386,16 +386,7 @@ radeon_pci_shutdown(struct pci_dev *pdev)
>   	if (radeon_device_is_virtual())
>   		radeon_pci_remove(pdev);
>   
> -#ifdef CONFIG_PPC64
> -	/*
> -	 * Some adapters need to be suspended before a
> -	 * shutdown occurs in order to prevent an error
> -	 * during kexec.
> -	 * Make this power specific becauase it breaks
> -	 * some non-power boards.
> -	 */
>   	radeon_suspend_kms(pci_get_drvdata(pdev), true, true, false);
> -#endif
>   }
>   
>   static int radeon_pmops_suspend(struct device *dev)


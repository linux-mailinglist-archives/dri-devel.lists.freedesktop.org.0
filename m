Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7CA39B531
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 10:50:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A8126F5D8;
	Fri,  4 Jun 2021 08:50:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2055.outbound.protection.outlook.com [40.107.243.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65C096F5D7;
 Fri,  4 Jun 2021 08:50:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TjtyFOyCOi4QwA4v73HH5rO4ytSp+dzIPrzFqTXU15MDkWecXh05eliS+djoRsg6+pTC1joa0KaWrFdcwmpn6ssbIGyYGv9yZOwJl1j/lRYc4devhfpZtqm4wHOpBmvoa5MjgAqiKBsckLAnJECwBoANMgr+olmQwTi6zVejKJDY1ePp/Zl9oHVhwZT3EjKPiSqx0Z9ijIEiLCXqx8yiM6X3mMzHdv2WKPipqkENR3ua6HMECyf6NQP7CulyKQjf7sqVeCvLxspMYxRheCW9UJqBAlpLd3aCPnpalCbHHmS6NfxpEKb0D3UJXipz0oH+ybCAuTb1IgcHnAGL7ZG0PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0IgNDYs4uXXJzPAdy9Tu8IKkssLChz0Yb+eqPV1UdGY=;
 b=ag4l6E9FfbL0Z0CjBdiIcHX3FHhXZgxa5hWxBbHHPl6x45/p+2FDrPa7etNpDsrpTsUeQKbLs+jpbTObHwKJ+ML95Fv61i5+e5LLyFbacfteITraaTI6+YtA/D4GdW3o2Z1QyvFk0p/3jcuCamFwfbsvhGpIxPZF0qT7WymUPKryv/vjUleAQEFrqj4Fb24264QRY1uIyJFp12WzIlmeeKEZaYn8TViOTKAddTdhcZwsyWX71tsxT+euPd/1i8cerfX4cYSRVQwEFpUjiokz6LcCIm1WZ55tHYrlmR0kCSRLTjiHOty9GexHlo72TfmMPLba7rT15qA5eYhZ2eK/HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0IgNDYs4uXXJzPAdy9Tu8IKkssLChz0Yb+eqPV1UdGY=;
 b=MIRnHeoVYFBCwqGHrVcfryQUR3yxJ9rut9W+TP2RxuSMgVUnx6fnrsl2H/emmOR7EYqZUg+Qn8VLDcsGLQGfxIEX/p9mMSBMu2ePSu4YGdTSrD/QHWhXhagguvUbZ7TR2vmayeFQN4zzp+fycymth9aDt965JgtkDBZimiU351I=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3949.namprd12.prod.outlook.com (2603:10b6:208:167::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.26; Fri, 4 Jun
 2021 08:50:02 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4195.024; Fri, 4 Jun 2021
 08:50:02 +0000
Subject: Re: [PATCH v4 2/2] radeon: use memcpy_to/fromio for UVD fw upload
To: Chen Li <chenli@uniontech.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <87o8cnfr3s.wl-chenli@uniontech.com>
 <87im2ufhyz.wl-chenli@uniontech.com>
 <0689a006-a0a2-698a-12d8-cb11156e469a@gmail.com>
 <877djacbfx.wl-chenli@uniontech.com>
 <c4941cb6-8c40-aad1-e61a-2786ba1ab225@gmail.com>
 <87zgw6aull.wl-chenli@uniontech.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <36d0b0e1-12d5-6795-82da-38f188499486@amd.com>
Date: Fri, 4 Jun 2021 10:47:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <87zgw6aull.wl-chenli@uniontech.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [178.202.40.45]
X-ClientProxiedBy: PR1PR01CA0005.eurprd01.prod.exchangelabs.com
 (2603:10a6:102::18) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.137.54] (178.202.40.45) by
 PR1PR01CA0005.eurprd01.prod.exchangelabs.com (2603:10a6:102::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.15 via Frontend
 Transport; Fri, 4 Jun 2021 08:50:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 26608ba5-bb0d-4cb2-5139-08d92735bdbc
X-MS-TrafficTypeDiagnostic: MN2PR12MB3949:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB39491FF6A3DF8D5927D23719833B9@MN2PR12MB3949.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1060;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v1B9QmJ2n0ARssPUvLHRRPsrOLn7j9YA7N2FsoCE083Nsaw2KtbijBHbHGXOhHbxzlHzqekH1KrVZS7G+JPn6aDd7MOMVjrDtViPPMcq5yT2nFRVl7PDnebe+BF51g+c6lfPY9IqtP4FSeM3FIOgY2F/f60orELbb9WA/wI2E2U1ovQIr+WAHcSSpBFFcSwes7VsmN3f1ISxn0z8im9M9AAMVOqAZ0l+uGrlA2iVcM6qjIPPCC4bGyHuQoI4x4GJ7QVho1jXfwo3GrTV7kejarux8Mw0NxYyXyRmfbFrwlrRCNVMRzGcum71cbRGR7CXBN1vU9y1UMlxwlir/yPxzcSRN18TFcmRBdqrYn5QhIKJBJRq5UTEMO9gvGy7Kuq3yrEuYlQFrnkIy+XKCAogxfY6lH6nkregX7q97WvbokjjNVEIDEuKypgk/QdFci0Fpu9e21AcQzRJlHEp4jFjj3Kga8UNSJJFz7mQFFRDZfAZNuCfjWGjbP6XfsvqGa+RXvFkne604ZM4w8+4QaObk3Xq5sJ2UYT5OzrvyyhqyauTrQOFryHAHAzqPc+su/4JSpULZOBTHt3pHJROwXAJMSfFOLbbGGACIc7MzA6376sa+zNkY3VSzFKvmMiBl51SRymacTz16O8h+lgad7wkhGnLysjDHnweN60i7anqMtw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(39860400002)(136003)(376002)(346002)(26005)(186003)(8936002)(8676002)(16526019)(6486002)(66476007)(83380400001)(956004)(2616005)(38100700002)(4326008)(31696002)(110136005)(16576012)(86362001)(478600001)(6666004)(36756003)(31686004)(316002)(66556008)(2906002)(66946007)(5660300002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?eC9sSnJjVEZjMVNjVXdGWmZqaE02bjNwT3E5cXpTaXNIOFVucDlPbGhLVkxY?=
 =?utf-8?B?L2lyTUQvdWdnMXUvTSszM1BsbDhTVGkvajV3TC9XOFBMcUUwcU9KcGdERDRO?=
 =?utf-8?B?d1Y1MlBDbmczeHh6Z004U3RHTDd1d0xwOWtseGFvMG13c3k4bEZxS0JkQjJ3?=
 =?utf-8?B?UHVyM3dEMFR3ZTA1a0xPS1dUT0ZLSmNqb0xoTlhRa09Qc3JYeWNlNmQ4a1kz?=
 =?utf-8?B?akJVaC80QWEwQjB1TmU4WnJtRWlmaXZFejIyelBhUmNvQmlKdDJ6cHA2Kzdy?=
 =?utf-8?B?cVdzMU1JZysxbmVwaFRNNmc4Z2I3emlzZHlJYXVPWnRLZDEwMFoxdFQxRUZ5?=
 =?utf-8?B?ZzdkQzRuYnpaL01xbTRkN0lCbWFKM0dER2xuN3JPY2w2TDgyejFGSmY5VWgv?=
 =?utf-8?B?elhndGNmeHg3VkNDam5wZ1FmcnhpS0hrVktPbkdHTDlPMDNqU0dxRkdybkRx?=
 =?utf-8?B?RThMQ2Y3K3NUNVNGK0owNjErVlRmbFNMUFA2Q3NFa0FOSHkwUlRGbXF6d1hm?=
 =?utf-8?B?a01vZkJ4UitqcDQrM1E4bktic2RYV0krL3dDaGxoRUZTRFlZbVVGdi9aS1ZV?=
 =?utf-8?B?Z0YxK2d6d2JkYzhBcU5BaDROTjRzcURQMWdqaVVzQVQ2U2luWXFRYUlnUEgz?=
 =?utf-8?B?TklBNUxWQlRNWHNyZU1VakZwclNoajBQVEx1cTJINzNHQW41eEJYcEhrdklu?=
 =?utf-8?B?ODdWeEI1eWUyendIZHFYV1RnZ1BCUmovQ2pBSXBOWG1jWjgzcm9xdmNLMko3?=
 =?utf-8?B?NjE2VURFR2tJcThmdjJTU1NXYjNyL2RYRmllQXZhRW9kTlJST1ZFcGROSXJH?=
 =?utf-8?B?bzBtUWZhd0NyMmNmODNVbG1ZL25MQVVmdE1GMkpOZjM5NmNrTXN5MUFOeDRs?=
 =?utf-8?B?S3JpZmdqSkNhS0ZnTDlpWU56ZjhqbzR4SDlzcGhKK09CTGV2UzdTbVdRWWRK?=
 =?utf-8?B?M2llRllEM2V4R2hFeEMyOWZBcTVsWTdiK0dncStrSTZJN3BhZkNYQ1M4NjZP?=
 =?utf-8?B?Y0Uwb1I5QXVwczNFT2YwRkR5WnNzbWpGbVMyNmhNMWFCbm8wOUw0bHYzbWFO?=
 =?utf-8?B?N3BYZWNJelVHQnJ3TjdscDRLWTVzb29TTXFwUGY0RGtPd0hWazY4QURncmRR?=
 =?utf-8?B?S3Vsc3BjSnFRYXNxa2pFdUh0N2VTeWVkWC9RdlRoL2J0V0ZXd2lQRkRGL08w?=
 =?utf-8?B?WnIyUVhENmJsMDFLaUZhNVVSMmt4cktKK2RTZTg1emkvUExFRGNwWldQZkJp?=
 =?utf-8?B?RVpXb01zemoyNHhNc2FTTW5KZGlCKzdIMEgva1BKVm44cHlON0VXcXF2MUJu?=
 =?utf-8?B?YWZ0YmFDc2E4ZTU4Y1JqNGF1Ylh0SVlJaHdlMXAzaWh4cmlHSjdVd2l2NFdS?=
 =?utf-8?B?WWFQcXc1eUN0alpKeWlaY3h3bXh3WlpFWmRjM3dDTVRmM1g3K2Y3ZTRWd1Jq?=
 =?utf-8?B?U0M3d2RoaFZuSzJGYnlGN3QyWnRsbm9KZ0VDU1dFQlB5OXcwRDhMYUhrMGdj?=
 =?utf-8?B?Q1crVGlhTFJSRG5ESTFrVUNxRGZieFZOK2ZRZU05NUhQNERvNXVSY1U0aUgz?=
 =?utf-8?B?U0FyOCs4ZExNMjRmY2pFZXJ4TVkzY3FWb3dHWEhoMkVjWXJ2VmVyRkNyOCtr?=
 =?utf-8?B?b3p4OG5XRlllcHlidHdPOFpReVRBajkzeGQzdzVZdUFMeEV4V2xUR3VLSWhH?=
 =?utf-8?B?alhiVThncmw5d3lSK2JTME1oY2ZhNkREOUhUN3lEOG1VMGtTR1c1OFNpYTV5?=
 =?utf-8?Q?sEXGCaUXpYyop3y+DTptVcswXynUN1RLmFhI6aD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26608ba5-bb0d-4cb2-5139-08d92735bdbc
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2021 08:50:02.0960 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: seonLPez32NbCfFB77S7IdOoKcsBj5INEhBdYNg17uN0pVTL3rI6TnN6r1FOUiXi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3949
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
Cc: Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 04.06.21 um 10:43 schrieb Chen Li:
> I met a gpu addr bug recently and the kernel log
> tells me the pc is memcpy/memset and link register is
> radeon_uvd_resume.
>
> As we know, in some architectures, optimized memcpy/memset
> may not work well on device memory. Trival memcpy_toio/memset_io
> can fix this problem.
>
> BTW, amdgpu has already done it in:
> commit ba0b2275a678 ("drm/amdgpu: use memcpy_to/fromio for UVD fw upload"),
> that's why it has no this issue on the same gpu and platform.
>
> Signed-off-by: Chen Li <chenli@uniontech.com>
> Reviewed-by: Christian König

Reviewed-by: Christian König <christian.koenig@amd.com>

Alex will probably now pick them up for upstreaming.

Christian.

> ---
>   drivers/gpu/drm/radeon/radeon_uvd.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_uvd.c b/drivers/gpu/drm/radeon/radeon_uvd.c
> index 85a1f2c31749..753da95e6abb 100644
> --- a/drivers/gpu/drm/radeon/radeon_uvd.c
> +++ b/drivers/gpu/drm/radeon/radeon_uvd.c
> @@ -288,7 +288,7 @@ int radeon_uvd_resume(struct radeon_device *rdev)
>   	if (rdev->uvd.vcpu_bo == NULL)
>   		return -EINVAL;
>   
> -	memcpy(rdev->uvd.cpu_addr, rdev->uvd_fw->data, rdev->uvd_fw->size);
> +	memcpy_toio((void __iomem *)rdev->uvd.cpu_addr, rdev->uvd_fw->data, rdev->uvd_fw->size);
>   
>   	size = radeon_bo_size(rdev->uvd.vcpu_bo);
>   	size -= rdev->uvd_fw->size;
> @@ -296,7 +296,7 @@ int radeon_uvd_resume(struct radeon_device *rdev)
>   	ptr = rdev->uvd.cpu_addr;
>   	ptr += rdev->uvd_fw->size;
>   
> -	memset(ptr, 0, size);
> +	memset_io((void __iomem *)ptr, 0, size);
>   
>   	return 0;
>   }


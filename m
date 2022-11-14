Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD58C627A6E
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 11:26:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A212E10E031;
	Mon, 14 Nov 2022 10:26:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2059.outbound.protection.outlook.com [40.107.244.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAFF310E028;
 Mon, 14 Nov 2022 10:26:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eFJhiiLNAYUcZqqIlqO4DAWKts6GnZ4WdebbTsizcUVxse6J/fAUn4Y1kjHz2tXyIh9hBjW7ki7Vr5OAnRIaE2p+xkROGhvusbqgC48+ywph4NbrtAhpSwNxosLWlLY0ngDIkXtD8PLlSKTMxqZWFbPk+E8ya8IQ4/0ZcFZIIN92CTr6aJ4y/y5Wgl1b+nEWpI7gvDlM1KIpFP102W9YB+apsmDuGpC+WvVdGV0ZMEyCEjBnpTl8Czum1NbsOwNXmbwwN1icJL/5BpE7+N4YGrG6WvNxszYNzhyMSRdlv9z4xAIHIHs0O53x2/g6gYmBKcrtOoaw5e64gaMBj+1Jdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KnSN8s4reMCh2tTlls3OzoN32l9QfEpgoEAc/cYfFs4=;
 b=dG3iCTA4Fe3hAJxqZRaTfcOHctz5Chf7Mkzdn0w27prCep6wIAQj3WU4M6dNh0fW8vJrBJyar293EcKaISObt0nqHutO+JZ5yo3MJ43qMFeBDp7UUYHVsn0DWAPfAFXq7zlKyICVw2JJ3GOwWsCyM4IIsOhdoCJ/adibTp9sys6CRqWwnhTRgOAljS+RiSsfXpPLCfVSbWunfio68cfXR8mXdL6WlBOwQWf1fD0LTNkd6Rb0qBuoK1NjRtf2cZzeSq4zG/0ZT2IPQCsJWcPbVf/Ysn4TbADUwZ3j/Aq4fCeuKgJ2/0lm78YitPul3/AcB2agb0nYm4rUS48dahd07g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KnSN8s4reMCh2tTlls3OzoN32l9QfEpgoEAc/cYfFs4=;
 b=M7K6YYdK6j7ULQvmvoD7HVwwXYncDNxz/et72Qb60sgtu+d2dDxOXBLGeye5n40zdOAkWCbTGnAicECvMy1BxPHmqXD7uhxduPiEK0vtm3lxjyrDfL+DWq9HsdftODEn37JwBGner/nOPuzxiulmIeW6/ZhW+Y+aWeiEYiGORPM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BL3PR12MB6571.namprd12.prod.outlook.com (2603:10b6:208:38e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Mon, 14 Nov
 2022 10:26:42 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421%7]) with mapi id 15.20.5813.017; Mon, 14 Nov 2022
 10:26:42 +0000
Message-ID: <45eee340-8806-f0cc-9a93-02f2b776b284@amd.com>
Date: Mon, 14 Nov 2022 11:26:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] drm/radeon: fix potential racing issue due to mmap_lock
Content-Language: en-US
To: Dawei Li <set_pte_at@outlook.com>, alexander.deucher@amd.com,
 Xinhui.Pan@amd.com
References: <TYCP286MB232339970F7009B962E2F1BECA029@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <TYCP286MB232339970F7009B962E2F1BECA029@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0063.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::11) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|BL3PR12MB6571:EE_
X-MS-Office365-Filtering-Correlation-Id: dde5a3e3-592a-4099-aa37-08dac62ab92e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0IXeSCAdHa1UgT0EctwuXYRmMjiO1EiZnDOMAYK6cEywE54DLx6/BOtPQwbJxy3Vo/4hNlqNKnrMPO+oSmAPT31FccCIkho6ofPhvDCQwQL+BlV5gEEDpKX+lkzIwT9j0T5eZm6acTCLNz04hTG+382BJI2Sm8zKdJ32QaFp9W58xSWnRuhsgqGp7R9CY5D3XH54E6tnmOdGPgp3fFovKFCvEBb21+FEY+W4RASlVXc4d6IGjG6YUiJf4EfPLoW2JownuL6X/Oy+a/Ef7eHT602X6LmMgWs9SlpqG2PMpIhhNyhIQMpsI/LdIMc+OyNBsOg8RetsMvSkQcQJ7dJt321qnC9rsFwoIroTqZvMYeLrnmx7t75fvcHmzLAJ4d7CxtA8jBPEkZ1/WVw/6SJAPllKiCbdRFKQCItCNieybVZnz5qHEAp/RY3fqLdIuuZifG7OCxA+IRVQpDrHQwpCjSZU3g0vz/u6lpOtl9PEskQxqkWaTZ1JOKCMJheoKTD8MDCUQyEcDUzGFQyxVWgYuTLLzv3qPv+ZfEzqJiAmnqP0yOF2pLcyIyZ1HcOg6n2L9tth6k1QpFanUTOQJMEomUtVmrFi0440O8vEef99AIWzpsOSWB/jBZy1Hjaqg+MPlst3lLD/bVTCXo5fjT+sJrEKTKJsHj77MXjy1jeewEGsNx5Deo5UbGOpXfqnpVHBWzZPvf+WbnpCSB+tzvb+0h2hf1CBlioyEQwp5UgR2mK23wMmRoF4UfcMzdj2K6MLkS7hnlJBtVUl4IukaIB26dS9VDc+jfWaFOri6TUHxH0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(39860400002)(366004)(396003)(136003)(451199015)(6512007)(26005)(66556008)(66946007)(86362001)(31696002)(316002)(66476007)(83380400001)(2906002)(41300700001)(8676002)(4326008)(38100700002)(186003)(5660300002)(36756003)(8936002)(2616005)(6486002)(478600001)(31686004)(6506007)(6636002)(6666004)(45080400002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OUZsOVlRUVpWNHZyUkRmUlYxZm0yVHY4ckpGWGs3bS9hamJZdVlZbDJmUUJP?=
 =?utf-8?B?NzdPMzc4cVl6SitUOXh4ZlkxbkVUN2JkWjIvZ0hPQ3dxV1ZvOTdpaTNIcDE3?=
 =?utf-8?B?MFR4OXhzd1Naa3BTSFVJK3B5cHdQKzd6cERqa21rOVBCZGV3MzI2MHRrK0pa?=
 =?utf-8?B?dGhGQWc1QjZ0TmVHbVpyeG9lTXUvT0NqRUsyclRxbmIyTEhFdy84bjVLbU9Y?=
 =?utf-8?B?N3l4MlVPZjNPSlpjU3NwRDh1YWJLRVcrZzlpUmFvTjcrQUJqZDFyc2crN1k0?=
 =?utf-8?B?MTgxa2xpWlhLVDk2RzR1a1VmQVF5RkkxTmNOWGpNY3dzWkkxVG9lWlhVY0Zx?=
 =?utf-8?B?NGVSbFl6QXhkUGJwSkZyRjRDMHV4NlpjQ1pWcFNDYklxVGhnVGhJbVp5dnBY?=
 =?utf-8?B?OGMwSVA1UnIrRnY0QkdxY0taVEhoNHRzdk95MHVQUk8wcStGaGxFNTZzZFFC?=
 =?utf-8?B?Wkt4TmltaTN5em00YzlCeW9WMnhBVU5YelNuNG5vUGNuQnd6Wm55M2Y5WHdl?=
 =?utf-8?B?d2RnUzdRSEswR1ZBQUFnZ1V1cHV3L1RxanptVDhJNkFsZTd3UGI5eG9qcERh?=
 =?utf-8?B?QmVJeGIrYVFOeXRpU3pUOVRxeVRPMUh6dlhoSktzb0RqNERBamE0Y05JaGI2?=
 =?utf-8?B?c2JZT25hY1B0TzRHWW1ySHpUT3pQWmtCMkNVNm5QQThDbndnRzR4V1JLNGNU?=
 =?utf-8?B?eWRwS2VpS2VhQWVZdTdxaE04am1VRWNweVlDMlczTWl1VkFiZmZDUG93dFJY?=
 =?utf-8?B?MlowbTdVaW5jdVA0bTB4dnZ3KzJmY0RnV2F0TzVyaFVKWXlEN3FCY09GSTkz?=
 =?utf-8?B?bUxhTU9zODVvWE81aFhncjVicXl4bXdyc2oxeHJ2a1JWUE92SVQ0aEdmZDl0?=
 =?utf-8?B?L2lobld0QVc5dm5VNUhPSnNwVnVMQ0huTG8wSVlNRE1yZkU1MVhidXY2ckV2?=
 =?utf-8?B?bGdiLzFHejZjV0VXbm5Fa2EzekVFOTNFWi9Ka3k4akRXMjV2TGtVV25wSDVY?=
 =?utf-8?B?VC9oRGhkbEhmaDB4OU4xeC9lanNCblBmSUZoQ1IycWdWS0lhanpHY0FYUmxS?=
 =?utf-8?B?K0cxWmJERzd4SnZ4eG9nWmdpb3hpeFMwbktNdnNqWUQrNmFQdklnbm1iUlA1?=
 =?utf-8?B?T0o4R2p0WUZkTStLS3Z2K3E1SnhWZGZTMjVGQ2RnMXJMSVIyRnRIbW8vdXFi?=
 =?utf-8?B?K0UyYUQ2dW45RFR2dDcxYnBvZzFiUlhFZ0YrN2JQVmhYYU4reXBUVzlTN0kw?=
 =?utf-8?B?MFpJR3R1QmVKMkw2OHUyRkYwT1FpR05RTVdVN2p6dTdHaUhrMGJpRG9xQTlJ?=
 =?utf-8?B?QkZveERqYmp1YXRDQlNQTUpwQXdWbG5ZWGhxNWx3dlROQ3lNa0JRdjJCZEds?=
 =?utf-8?B?ZThmT1pIYy92dVB2SUd4eFFnVFlWWWthYVptWk83S2pKbXNzaVhnRkYwSHpL?=
 =?utf-8?B?T0cvZ2dHcGVSUnR5alp0K0hqajk4UEVlblVkTWVmK29vTmhyUWVKeEhER3U4?=
 =?utf-8?B?SE9iemlaNDExRE9CM3NiWGtCYlVXeGtZU042Yy95UVE4S2xnV3pHUTMzb0Nx?=
 =?utf-8?B?Qnk2M1lPUWdJRnN1dEJtUDVxRzV1ZzQvNkpia211OERBYWlBM3RkRlFBSk1u?=
 =?utf-8?B?TjErLzIwRE5kUWhCcmpWUi9neVpFUU1xS21Tc01INUFJbzQrSDNTU3BOUmR5?=
 =?utf-8?B?TVFIMDJBNHh6RXhuVGJRQWVFWVlSMldxTHhhTjVtdUdGVmxKK0FUMEh1blJZ?=
 =?utf-8?B?RW8xTDY2bXdMeVY5WWdjUy9zSU1DSlNDZXpqYkJHUlFUemdaS2s5Zm03MlNp?=
 =?utf-8?B?a2pRWTN4OHJSemxETFQ4M1pTejV4R01CeE9ZOStkdjl3NXFmR1NFV3RaNFUz?=
 =?utf-8?B?NFNCcHYrUkt0YzdmY3Y0S0dMbFdVc2sxbjdMd25GM0FlUmhCUEpqRWpOd0Rl?=
 =?utf-8?B?S2kxYXhkMWdDeDhFdWdYTmpnUGtWRm5XenY0dnBPcjlmV3J5WEdsYVlwUGNS?=
 =?utf-8?B?cWxLaVdra3d1TURaaWliOGtmdXhXWHdsYjFDdWpwWjFPTVE5NUlsYmhVQW5s?=
 =?utf-8?B?NGgybnNtVUErbnFpL0VlSDRqN0NuZ05nekhDSGwwemFWVlE1QnNONFdMNmpB?=
 =?utf-8?Q?i/noB3Kf2LKJv3dPQadq1GBeX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dde5a3e3-592a-4099-aa37-08dac62ab92e
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2022 10:26:42.6615 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X2Y/RqfJZE6/sTBp7/xLDZz0l48X9AOuSdPZvnKZIhlKn58eIo5UaS4dxR3Y1ph+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6571
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 jglisse@redhat.com, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 13.11.22 um 13:42 schrieb Dawei Li:
> Both find_vma() and get_user_pages() need explicit protection of
> mmap lock, fix them by mmap_lock and get_user_pages_fast().

NAK, the MM read lock should already be taken when we reach this function.

Could be that this is buggy and the function is called without holding 
the lock, but trying to grab it while holding the reservation lock is 
also forbidden.

Christian.

>
> Fixes: ddd00e33e17a ("drm/radeon: add userptr flag to limit it to anonymous memory v2")
> Fixes: f72a113a71ab ("drm/radeon: add userptr support v8")
> Signed-off-by: Dawei Li <set_pte_at@outlook.com>
> ---
>   drivers/gpu/drm/radeon/radeon_ttm.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
> index d33fec488713..741ea64b9402 100644
> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> @@ -351,7 +351,10 @@ static int radeon_ttm_tt_pin_userptr(struct ttm_device *bdev, struct ttm_tt *ttm
>   		   to prevent problems with writeback */
>   		unsigned long end = gtt->userptr + (u64)ttm->num_pages * PAGE_SIZE;
>   		struct vm_area_struct *vma;
> +
> +		mmap_read_lock(gtt->usermm);
>   		vma = find_vma(gtt->usermm, gtt->userptr);
> +		mmap_read_unlock(gtt->usermm);
>   		if (!vma || vma->vm_file || vma->vm_end < end)
>   			return -EPERM;
>   	}
> @@ -361,8 +364,7 @@ static int radeon_ttm_tt_pin_userptr(struct ttm_device *bdev, struct ttm_tt *ttm
>   		uint64_t userptr = gtt->userptr + pinned * PAGE_SIZE;
>   		struct page **pages = ttm->pages + pinned;
>   
> -		r = get_user_pages(userptr, num_pages, write ? FOLL_WRITE : 0,
> -				   pages, NULL);
> +		r = get_user_pages_fast(userptr, num_pages, write ? FOLL_WRITE : 0, pages);
>   		if (r < 0)
>   			goto release_pages;
>   


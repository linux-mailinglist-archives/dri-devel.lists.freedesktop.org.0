Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC4C3ECF8A
	for <lists+dri-devel@lfdr.de>; Mon, 16 Aug 2021 09:40:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C770D89C9C;
	Mon, 16 Aug 2021 07:40:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2088.outbound.protection.outlook.com [40.107.236.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 212D589C9C
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Aug 2021 07:40:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k+o1JEfzseaIN0hTpyUkpV+IFOBV8KBcNWwvIpfRymMqs8a43b+h0Ld3+xRcycowc/tRMXfGuTcOA0Z/1yU2mRQ68F6Ja27Z83wdb5izCMzEPJpyNSEAbUmgshR0j2wTy+WuULiuTowzXrZYie7UP3dhnQSdBe/nZ/bsDmSCmxg5T+7IMG6oBQGrrKsT2/CFktVe8sFWEakUuqoqegOjRqJfpJ0Z2VwRXNp81lhXUnBCgniFHV3Jf0uwfiaU47fP2wQ7dLH6L/W0ITSV4e43Fwsk4wo7320me5ajzAlhyXVKqXzOPpvdmS+1R6EkTZRxciqpMB3bSq7y/Ril56uXNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3WOfcHwsCXmhpxr/b1xaD56BgNld/pFOtnL2SAMd8ho=;
 b=YYWdxt+YzK4pXJLWXCEQuv1Ye4GlgTT8U5TKpCje3srw3f0n2Fb0UfIaswJkwX56M9jrKzMgnvd8sfRqc9WxLZMMam8S9dN0r+pH3xKrUwySmL5cuZZPtWi5Tm43HBLI9KSQMfEBrS2r9PySgmRTr2Z/eCgNZtShbt0xTyfK6Uj3mqqYel+QgNpin6qwLp+Q546/hOpLe7LREG0NGKsP3WaJePSjMxD2w4vuYQ+ibgE8uVgwEDSUD+P6o93gfyzLPFdCNwbl5arEfDFpc5poldI7VQhpr4Rr+pby6TflurvHkcqtfCCWh7KcCG1MM0vlp4fasZEYM9Fu0/bsjXqxBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3WOfcHwsCXmhpxr/b1xaD56BgNld/pFOtnL2SAMd8ho=;
 b=13VPrVcdEgjNAaNm65K/bzcArytl9qk0mcQ7D3n4mryierg8HwTXZFgv3XoTAobNa0Y9TxGcSK8BRBXXKuF9afdt8vZtkBhJajh596JIN33JQpjlKOjlqphAsCZWlcNJkx0O2p0XkNpn4amS61CXrY0mZQZDmjLbnHeKCLejob4=
Authentication-Results: jlekstrand.net; dkim=none (message not signed)
 header.d=none;jlekstrand.net; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3885.namprd12.prod.outlook.com (2603:10b6:208:16c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Mon, 16 Aug
 2021 07:40:38 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4415.023; Mon, 16 Aug 2021
 07:40:38 +0000
Subject: Re: [PATCH 1/1] drm: ttm: Don't bail from ttm_global_init if
 debugfs_create_dir fails
To: Dan Moulding <dmoulding@me.com>, dri-devel@lists.freedesktop.org
Cc: ray.huang@amd.com, jason@jlekstrand.net
References: <20210810195906.22220-1-dmoulding@me.com>
 <20210810195906.22220-2-dmoulding@me.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <9df167c7-2985-5b0a-9d54-70ec9d5d2eca@amd.com>
Date: Mon, 16 Aug 2021 09:40:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210810195906.22220-2-dmoulding@me.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: FR3P281CA0003.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::22) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:7d83:fd8:eb16:8605]
 (2a02:908:1252:fb60:7d83:fd8:eb16:8605) by
 FR3P281CA0003.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1d::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.11 via Frontend Transport; Mon, 16 Aug 2021 07:40:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a4d3b020-8521-4d63-3d4d-08d9608923fa
X-MS-TrafficTypeDiagnostic: MN2PR12MB3885:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB38859FD43A57F87A68A6838083FD9@MN2PR12MB3885.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OYYhedf2trE52iZl8TZqCEUZ89WpsNNSsnJk1/smWipyi8+9sxqP1YF5+JqKsUi9j5txNB0Xs4mjvB41lq4wNHN0HlUf4pL6myxq0E2uiEurC7fxVjkUOB8dBG8AmFP/hKuIut73LG7xij08kNV+RhyKVgAvPk5fw/JVmsjwi8DJNohcp3zA+aynrjPHifjY0mUn0XZGv4cnvUyaHuhTY6JbcRljL/LAbXL4OjYKax+PmH2quZSBy7jtjsp+rZufDq5/sMLBzA6W/m+DYrzgmlx/vHIHgxLIXjnYEUJ5oMjJS4ZUVsLZ0hcVeQRTL7+2HTxrvIeK8EbowcYfkLb9+zXFFteICUJgpI5lCUnSewLx6Mt0DDrS3uUWCmvtoeRJ+B8JTFu4FWWpL0jvhdBYUVNYeV3Sdpu7Y4RIDmZf5R+JFYbJHNw9QMU9XKhJM+2m87o0PT5K/v522BHMgtTTVJarMQYOYBOq4Gsw31vbXZXlKpyqHEyId8Nal56LibEqFZMDgbblwHL4rRNXZ1fw8pzyhLI/OGCzWI48+7kb1Sq6pB37SVFa6d0trYxSdkmecXtlARIeP4MaS4s1W1kcOg5/ICiaOjbonXic01wlUJaYPvBJB/OPPMf816oDPuOIW5doPUoJKM/Otct+9GK+ObYEej/hOHCz26ygRhjhJ7wvhk3jgAYUtoP2RF9+/zNDt8WDqKjBntuR+/D8xhIlMQqXLJsRL0R21Kg6dn4Msxs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38100700002)(6486002)(508600001)(8936002)(36756003)(8676002)(2906002)(5660300002)(86362001)(31686004)(66946007)(66476007)(6666004)(316002)(4326008)(83380400001)(2616005)(66574015)(186003)(66556008)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SFdwbzhySk1iU1RqT1MzdlNGaDE0bGNlekpIbUNnS2laaXZBblpOMGFMVWx2?=
 =?utf-8?B?Q2ZoUmQ0bElHdmplSGpTaE90YURqR1pRNGpTaVQxYlB0eEI0ZEFBSjJNU2NK?=
 =?utf-8?B?Y01oNkxGWmI2bHNNNks2amVQS05vamxOZVkwcmlxd2xkZVRhYzdBSlAralBh?=
 =?utf-8?B?SUdjdHhCZ1kxeGZwd3BzUytZNmNtUjJMODRHcHVxU1A3V0Y4Y1dQMXpQY0N1?=
 =?utf-8?B?REpwRHNMVVRwZWwvYzYwWnJrQ0lVWmZhSUtUOG9tdzBmNWRVUk9XMkwyQWRH?=
 =?utf-8?B?bnNUVUpSSks0SWY4dVpuM0ViYURwbnlZSU9PU2s1cUQxbUNOQk0wQm5pd0tq?=
 =?utf-8?B?eFFrQ1JheGNKdTc2MmxYMzhxTlR2YlJzeGlId3RYNzVXYUR4VVUvSXNnSDlG?=
 =?utf-8?B?djJiSVR0M2hqYVJaL1BEbHBvVTdzT0JNTlQxSmZnSkMreGU3Q3F0MTk5SHhp?=
 =?utf-8?B?MGg5VERRb3UzYUh3MWw5QnA0YTdzV0xTNjdFVStSbjZNWlFMME1nSmJBcnVU?=
 =?utf-8?B?T1JoVGdiM2Z0K0czK0xsU0NGWFYxS0dFaGNvZm8xcVJ6RDBjMUJQcDYwMDU0?=
 =?utf-8?B?TWxHMU8zb1dQTFNsb3BOMmNJRkJvL2RhZDJzSDIydUdCZEVnVlNHU0hJa0Fz?=
 =?utf-8?B?WE5yMktraFl0MFBHNW55aTZOL0JrVUZBaEF2TkRYakNjZVE1VGtDdkc2SmU0?=
 =?utf-8?B?a1NGN210bUtmVGVDdUJ3YWlMbzNXNFRyT0pxbjdyZDV4Z3VMaXJjWFczRnN2?=
 =?utf-8?B?Q0xsVmViVmRlK0JZaS9ralovcnZkcEcyeWg2NTB5Q3FZanQzZFZYZEhBdlFO?=
 =?utf-8?B?K0tqRlRlZndmeVgwMHdGMVZQNU5iOWNOaEJ5Y1doSm1WVW1BZDh4SHVKeWlR?=
 =?utf-8?B?aGpXZ2oybDUzVjYrUVhyb0cwVlVvbGZKaXdaaWg5Smp4M0VEUXpaRUtKcVNN?=
 =?utf-8?B?Vm1MenovU3ZtSCtRMHU3MjlpaVlWSFM5ZFMxdklseGN4NHQ5MDNZRFZmRnQv?=
 =?utf-8?B?S0EyTTZ5ekIwQWxoazJKUzlLWFRyNTFHbS9YZ3RRckNNNXY4bXBucm9WUVRk?=
 =?utf-8?B?T3N4YnNGdHJDWFVKMDdXZmxpYkJpc1MvUW1VZi83NG5ISk80UGNnVnJTZ1FZ?=
 =?utf-8?B?WXMrNlorTkExTDh0RmpGQ1Rka2t4dmUrMWpnOWRjaG5vcGUxN04vQ1dBMnkw?=
 =?utf-8?B?QktQaTR6OXpaREl2MTk3b0ZLdC9rTUVCNm51Mk91a0RuRk91TExJSFpGMmZx?=
 =?utf-8?B?ekhqQ2IrNkJialRwelQyU29BbEtWYjY3bkhiYmtGd0tCQ3hIREpsZVBBKzVP?=
 =?utf-8?B?QUJKUExRSkVPOVlwV2l1UEVmSnUyaE5JdWNaeW9FdlZmTFg5dW0zN1hDVTJo?=
 =?utf-8?B?OHVJUDZFUzlML2ZZWjRzN004YnNZVmRWWkNFNWUzUkF1VWxzeXIvbjBwRnVI?=
 =?utf-8?B?YVhBVnE4N2MybFpWSGc2K2hsaVZhVWY3TDJFS085TVczdGMzbjhkQ2ZQWXdK?=
 =?utf-8?B?amQ0d2wyK3pOVWk0b3o0YnF2UGlOT2dlY1lSK2VIRzJSaE5JMUJybm5yVVpq?=
 =?utf-8?B?akNuWXRVcFhNTG85ZThSUVVHM2pUSTNXRHdvVXBZVmlpbzJzTy8yV0J6eS9k?=
 =?utf-8?B?Z1BNZmZsbmpZdFJWZGN2QStHb2pZRjhyejkwK0NlckF0aFE5eGN5TEp2M0lw?=
 =?utf-8?B?bVZ4OWMrNGIxWVYrdHRJa0ZKUkFSZlJqZDZjT1BzNi9rRGRvMElQczBTZ0to?=
 =?utf-8?B?a2hUNzRoS2hxZGJCZDllZFA0NmdWYzNEajBnb1ZJMjl6QitKRWo4NExpYmox?=
 =?utf-8?B?OEx4TUNTTDVFRjlSa1ZkNHdRbUtmOG9pNFowVk5SZ05LU1VLcWYvYmRhbk13?=
 =?utf-8?Q?csBW+Vi99Z0fl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4d3b020-8521-4d63-3d4d-08d9608923fa
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 07:40:38.2252 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aMgNT7WtDdQ4fSKWO5tsO2X3IlN1ZJytGFL2cw3Of2qR/XIKl3n/nO8hM4Fyy3WQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3885
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

Am 10.08.21 um 21:59 schrieb Dan Moulding:
> In 69de4421bb4c ("drm/ttm: Initialize debugfs from
> ttm_global_init()"), ttm_global_init was changed so that if creation
> of the debugfs global root directory fails, ttm_global_init will bail
> out early and return an error, leading to initialization failure of
> DRM drivers. However, not every system will be using debugfs. On such
> a system, debugfs directory creation can be expected to fail, but DRM
> drivers must still be usable. This changes it so that if creation of
> TTM's debugfs root directory fails, then no biggie: keep calm and
> carry on.
>
> Fixes: 69de4421bb4c ("drm/ttm: Initialize debugfs from ttm_global_init()")
> Signed-off-by: Dan Moulding <dmoulding@me.com>

Good point, patch is Reviewed-by: Christian König 
<christian.koenig@amd.com>.

Going to pick that up later today.

Regards,
Christian.

> ---
>   drivers/gpu/drm/ttm/ttm_device.c | 2 --
>   1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
> index 74e3b460132b..2df59b3c2ea1 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -78,9 +78,7 @@ static int ttm_global_init(void)
>   
>   	ttm_debugfs_root = debugfs_create_dir("ttm", NULL);
>   	if (IS_ERR(ttm_debugfs_root)) {
> -		ret = PTR_ERR(ttm_debugfs_root);
>   		ttm_debugfs_root = NULL;
> -		goto out;
>   	}
>   
>   	/* Limit the number of pages in the pool to about 50% of the total


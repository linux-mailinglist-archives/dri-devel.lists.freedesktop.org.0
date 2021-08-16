Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37FB03ED43A
	for <lists+dri-devel@lfdr.de>; Mon, 16 Aug 2021 14:44:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1E1F89E47;
	Mon, 16 Aug 2021 12:44:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2086.outbound.protection.outlook.com [40.107.100.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4031089E47
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Aug 2021 12:44:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KtA7AU0kucbkmyCuqdGYAgb6uSKbGdGkDl97rz/2ogRm8rPK8wwygOZJkavImBwS7pAacDap2LbGYcUKjmBXMN4A7YjPUaI8sys13dKbgGq5IP+XkvB8FaAtHr3vCBy/wUPJMxWjPhnP56fMhnVmL4qxaB6o3s2aeGVvTlO1awhrtZhP+3GqKNZMQF+vN8xTHQy/2vaB4qJ2SJeXfjcGq9jHcPXbzbv2+I60d9Sq0PyV+lzEuAH6+cRE2vv0ff2oQSW+2JKe5Ga1/4F6aBc8P+uszFl2MRv0F6cpq2Tnofwxx/OSNueVBUCuL5wLix/QGAYAVXkqkoucLiqD0wCmuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PF7bPZINc9RwO+JIxjeNEZE7k12ivEUACQTfDNlqOLI=;
 b=noKZqN6CB7h5ydg5/awCVVZ8NzAGHYwk/BsgGZy0cyUcGQIDEet/ldd6CTKnAX7IP7VAldlqZFaieYIH3sSTfPQpI32gMsRBu2vkbK0URtJzygtx3Sptz4z52oprUC58XcdzQj/VJyOb/1tps4+axBxBepo151ucb2/8HH1rEgscLJ8q2idVM3UvP6d9B628wwMJ6B9ZNJMQ3wq2bBZhJ4zTlD49IdMH8CjVyjHs2T8r1QBcao0e+WobvLhxHNpeK+MOir8PjJX1GZb7K5NaKJDZDR0XI/BQe0YRCP9ddzXxexxbu67zptHvSp9O3Tml9tsTr7wvDZYjXTEIEaajlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PF7bPZINc9RwO+JIxjeNEZE7k12ivEUACQTfDNlqOLI=;
 b=O4lFBN1aqM+we2V1CwGbO1/Rw5zJ2JBMjSahdIKdCWflfihDKjFcjWf4ygrMfk2aUOv701yvGseOoPHWmF6VQpFVfqbhs18HwlRLpBi9tAYAg3KFNOX92s5+U/1Yl9jhD9PYBV2kPVHe+Q+0QxJYtvL9Ncs3QgV1RnX+WdxnQ9s=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2514.namprd12.prod.outlook.com (2603:10b6:207:43::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Mon, 16 Aug
 2021 12:44:39 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4415.023; Mon, 16 Aug 2021
 12:44:38 +0000
Subject: Re: [PATCH 1/2] drm/ttm: ttm_bo_device is now ttm_device
To: Jason Ekstrand <jason@jlekstrand.net>, dri-devel@lists.freedesktop.org
References: <20210812203443.1725307-1-jason@jlekstrand.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <90a76b41-841d-170a-f663-bd069bbe3709@amd.com>
Date: Mon, 16 Aug 2021 14:44:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210812203443.1725307-1-jason@jlekstrand.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: PR0P264CA0247.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::19)
 To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:f9:c3d:bbad:9698]
 (2a02:908:1252:fb60:f9:c3d:bbad:9698) by
 PR0P264CA0247.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.13 via Frontend Transport; Mon, 16 Aug 2021 12:44:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 856ef92e-3537-4369-c01e-08d960b39c2a
X-MS-TrafficTypeDiagnostic: BL0PR12MB2514:
X-Microsoft-Antispam-PRVS: <BL0PR12MB251419BDD7B7537E1768056383FD9@BL0PR12MB2514.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:635;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1RbCnNM1G4EnkR1jeua2Hdvjz7qZP6eWlbURwWy88EMApgMZxRfszWvYowrYCQIu2isLkJ0JoSmNGZV9/XGNepgM8HmlEYPzi9htkS5TMuEurpaqAmis+CU2xbv9F9VQiWfxJGUNmz44guIqzOGkTzeWdj7OK5ilSC17Hh/K1Itr0LBUTMZqmJLk/91zk3AGgD74Ua7m0BT7VWsoNkq8i9/AaQCO370+jfguZCxXzVDMAXe8yWoByeQLHHnPzHGQaTEn3F/bbxvVAehek4hOjfQkFzvP6+123es8fKcU+NsnzW5dUAu0YXuVByXK9fRs2TJY1RMwiAXziIr8RTSbth/yqTo/sSgyd3FD1GmJMSwbqyohlP9wNI4p+dPUNI/9mBKkryRIi17JHCjYti/weuXKQtcF7PZq4m4UC/dDuRF0Ut/eyah939UaaGyzWtXko8zUSMTKFTwr5fvj2OdMQUgEnQjaRYyP2dLqz8eyEyq+AUDBFtc0P3LcrQR3DCaL95KQoBG78oztu5MpCtj2xjI7fjbpSG1lmfOowr/EuUbS3y9/kUgCUQT/8q0hNRsBa4L4FiPbYxb7kFwIYLVdXLovCenpBDsmWj0NT0voTJb2xtUpNmh/t0+ah4kOMkvrCRLaf0SlMbOr4CQFI8+FZ5Y0VsVuZF++Pw/sZUYf6CpVWFmMcPoHE+zEm0RHxSTsxUK//B09Y0lZTyeUm31dbFy3BLzmCsdNN2UU+moetPCoYkFvF9bKYOhUBt/X2ybM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(376002)(346002)(366004)(136003)(86362001)(31686004)(2906002)(5660300002)(6486002)(66556008)(66476007)(2616005)(66946007)(31696002)(316002)(478600001)(36756003)(6666004)(38100700002)(186003)(83380400001)(8936002)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2JONjBaQXFXdC9jbnNzRWNOZEJ4SUhmcFVRT05ydWk4eGJUazEvYWh6eWNy?=
 =?utf-8?B?cWdBcE55dnBVem5TQ0RYaERXajB6aFZhZGI4am90L3pSd2xIRUFiZ1I4cEto?=
 =?utf-8?B?K3dxL1R1MlNZY3Q1VGM1WDFWeVBGL3VRWGpxazExelJ6LzI1THZDNVpZbHdX?=
 =?utf-8?B?b3hsTS82dW5maTVkOUIrc0N3c0RxakxhdkxTUys2NVU4TGoyLyt4TWpIN3dx?=
 =?utf-8?B?akhCcjVrbWFpVlBBTEQ2bkg3QW9yeW1ubkV5ZkVhZzB2RktzVHBqa2ZrN3Z3?=
 =?utf-8?B?MnFuVmJrOWJwTmhpbTluWlo2dk1EektHSlhxUlV1TGFtWjdrZnZZRk82WmJP?=
 =?utf-8?B?WDlMQlFUZ0o2YnFKd3RMTGZZSEVOMFBXTnpKOEdZazByNFJvVkhUeXJvSUFo?=
 =?utf-8?B?YnQ2eUR0NmZ2aFZyN1B1aDgrUksyR1hUUlhzdjZ0RThkSVVZTmg3Wjhab0lF?=
 =?utf-8?B?VFNJYUFTU3FvdC9tWHJBTzB4bTF6R0pNYnZPTk9GQ05MTXdtQ3lQdzI3QWdz?=
 =?utf-8?B?OHRqakVyVnk4QW9jU0NUMFBlZG92d1NWRFZrbEM2eXAycXpPWDJXc3BGakx4?=
 =?utf-8?B?NjVnYTZmMCtlMGZYU0dPS2wxWHVBWVB6bXBvWVNwT1RRdkxsRWhHWGVKdHU4?=
 =?utf-8?B?OThtbDV6VkR6MWhRL21Qdkx2cUFSdm9aM1QxTmM2K0RJcE1jUFRpa3Y4WjMw?=
 =?utf-8?B?OTRoeWRyM012K0hFRGV0RjN1RS9KM01NczhBQnJLaXQ0ODA2NjRhSmRWVlBQ?=
 =?utf-8?B?cWFJMzRybkZ1UTZIVndYblZzdDNKRmVuT0xKNkgyZkdIRzRSYWxWak04SjFp?=
 =?utf-8?B?bEtwTURPYVlqaE0wSjJGeFpyR2dtZUFaQTVhU2VPTmROR2ZnSGdrcHpnZkV2?=
 =?utf-8?B?MlltWTZyTytDcmpWMCtydURpcHdKVzczS3hXOXV1cVBEaTk4UTQ5dFd5YXp6?=
 =?utf-8?B?L3hMQzZQZVZFV1lPditYYTVsREZSOVR3cGZISWJpNmYyZkZVK2ViKzVZUlM2?=
 =?utf-8?B?Y2hEUmdtZkdsbnMxYkRXeVpLeUtkQ3FLQnpWaGpkWXNqL0Rta2llRFhnRWlC?=
 =?utf-8?B?NlVZdTJCS0VnSnQxOXV3U1VRUHZVQlBVc3ZmZUFXS0Y5SEY0dUdXa0pSaWJF?=
 =?utf-8?B?TXJudTVvbUlNRFJkZU1VYWd0SGNJdm1oM2Y1RkEzQTAyYnNwWWVrV2dYMUlG?=
 =?utf-8?B?Z1B6d2ZLTnBFK2s3UzNiM1lEWDFPRHNmRExNaGNNdHlVcndVZVFVZTd0cjlm?=
 =?utf-8?B?cEx4ZGV0ZjV3SEF1NENKWHliVmJBUU5JN3hPSWllbys5cW1jeGZyY2tldThU?=
 =?utf-8?B?WEpmNFNtOWY3SWZRdENLQ3owd1ZScGN0RERQdW44M3hiMmNCem0vT2ZmbkRH?=
 =?utf-8?B?N2UyYVFmNVVyb05jc1R6ZHpsTWhGTnZjekFVSXRxY1VpVE5uMVNRRkV6cmxz?=
 =?utf-8?B?TXZ0MndldzhTK3lQNFgrWXEvR2FSRWh3QTN3WmRvWEQzMFAvOUgxeFcyZzIr?=
 =?utf-8?B?a3V2dXZRNlFHMldpQy9HMzIvdmMyMzNRVUMxcDNkbkw1U3lINTgreEJTalhn?=
 =?utf-8?B?bVdPUmZHYjJkbVhGVW1Nc2JCWFlGY1RHU24rNzhmeFpZOC9wd0hJRjRKNTQv?=
 =?utf-8?B?TEFvTmtVWWhkZ28xM2RJYlY4dkZqRkhFVERQQ1lscEJRRzFSL3NZUnpGRGY0?=
 =?utf-8?B?ZGNCdjJNZWpvby8waG9xZ1hCTE9pR3E3RDhXMnBJNUN0cHg5SHl5Sng2OFh5?=
 =?utf-8?B?Q2tHblpVM2U1bC9oTC82VGl0ZzlNRTZQeTRIZ0tHZTNSb0NpamtIZGJHNE9C?=
 =?utf-8?B?VWlHRS9GQUNtMFlZK0RBQ3VTQkR2M25hRTEyQWNpb1BKWTlVckNZVVZDWVNq?=
 =?utf-8?Q?v+rxThRWP7yS9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 856ef92e-3537-4369-c01e-08d960b39c2a
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 12:44:38.6754 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SM+RlZS6OLW4PDEzRPV1cMcGaYr7rZ4PUQH+jzhEBHluBu0P+LXuFaARRTkmZYlL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2514
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

Reviewed and pushed to drm-misc-next-fixes.

Thanks,
Christian.

Am 12.08.21 um 22:34 schrieb Jason Ekstrand:
> These names were changed in
>
> commit 8af8a109b34fa88b8b91f25d11485b37d37549c3
> Author: Christian König <christian.koenig@amd.com>
> Date:   Thu Oct 1 14:51:40 2020 +0200
>
>      drm/ttm: device naming cleanup
>
> But he missed a couple of them.
>
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> Cc: Christian König <christian.koenig@amd.com>
> Fixes: 8af8a109b34f ("drm/ttm: device naming cleanup")
> ---
>   Documentation/gpu/drm-mm.rst | 2 +-
>   include/drm/ttm/ttm_tt.h     | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
> index d5a73fa2c9ef..8126beadc7df 100644
> --- a/Documentation/gpu/drm-mm.rst
> +++ b/Documentation/gpu/drm-mm.rst
> @@ -37,7 +37,7 @@ TTM initialization
>       This section is outdated.
>   
>   Drivers wishing to support TTM must pass a filled :c:type:`ttm_bo_driver
> -<ttm_bo_driver>` structure to ttm_bo_device_init, together with an
> +<ttm_bo_driver>` structure to ttm_device_init, together with an
>   initialized global reference to the memory manager.  The ttm_bo_driver
>   structure contains several fields with function pointers for
>   initializing the TTM, allocating and freeing memory, waiting for command
> diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
> index 818680c6a8ed..0d97967bf955 100644
> --- a/include/drm/ttm/ttm_tt.h
> +++ b/include/drm/ttm/ttm_tt.h
> @@ -31,7 +31,7 @@
>   #include <drm/ttm/ttm_caching.h>
>   #include <drm/ttm/ttm_kmap_iter.h>
>   
> -struct ttm_bo_device;
> +struct ttm_device;
>   struct ttm_tt;
>   struct ttm_resource;
>   struct ttm_buffer_object;


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 869931A340A
	for <lists+dri-devel@lfdr.de>; Thu,  9 Apr 2020 14:35:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CB4C6E11B;
	Thu,  9 Apr 2020 12:35:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2068.outbound.protection.outlook.com [40.107.94.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7638C6E11B;
 Thu,  9 Apr 2020 12:35:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cMLnyHqEnxeZ30zVB9eDGxteKKIEq8WVaBmICI+Sz9YSFA/o0qpHXODX0KFvftaPWFGMWviiz4ISqLbtYCk72ojN8zgP/WC4ha9B/ntU0xjOJRfOWnoGgRPvxjg6vfRbRcmgOcavx3NAQQ92p0XmAEoyyJLmlBhabZnGTajVcXSRJ9cEHZpf8Z3/LQNmtqL2tfx4nxaNKa29ItMf8daRPftj33rclpAAC2ZS5qGBqjqtQA57RTXro+eC2jnOAc9dKOCzBV1SVdhjzDtE/tq5+ZnovzPuUqlTv8Gxa2h8c4dg1xU1RzlxhvQlVRypkDjjTJxS21AXx6u/rAmXMTkslQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qd8GzBbWJiNlqDOZ9seDpLDBtekFkAr0r7he9xTGxLw=;
 b=UNl/i9btSUZywHiINOEeeWYBCKtUVBkoawetHQdM1Ux2D0Lug827sdbaIVzBzJzgKsWrhsKtbS8ISR0UcpYi6+hCZDE2skDVQuNBwdhTAI62IJz4kZ0EW73/FV1Lez3x1f2wgiMGr94srI0qu+Q57vWj0yjWTPjnb2DT2jgqJMXeYSl0tHRg9SWJFQcBBwgKrwHT6kxEfluvEtrONxZVr8KfFkMgCpxW17qVhdVFGi9VBihm4ku38P5jLl4doK2i/NX2KMlQjbpAGVCTyM++yT7a5hSOXh+gwznLt+i7ilqAaC4fK5y9MIuk0/s68HsgRDCee5wMeJQXLSrjomIG6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qd8GzBbWJiNlqDOZ9seDpLDBtekFkAr0r7he9xTGxLw=;
 b=SbETqPnuZxJ3qJ0B4wNCJQec9knTCIegcRbDqf1SZiOo/b0N+s84IC2uR/2UfqMU1YZJAP19EGqtpn70fM7VM4TTUSD952ri+zQqP4JfEdXHTkcK8yJlspP5PBQq3l3k5ziCg7/ATCoaSbEkj0Wuq77LyPQiIaoXyoCerP+0U8k=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM6PR12MB4401.namprd12.prod.outlook.com (2603:10b6:5:2a9::15)
 by DM6PR12MB4044.namprd12.prod.outlook.com (2603:10b6:5:21d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.16; Thu, 9 Apr
 2020 12:35:16 +0000
Received: from DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::f164:85c4:1b51:14d2]) by DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::f164:85c4:1b51:14d2%4]) with mapi id 15.20.2878.022; Thu, 9 Apr 2020
 12:35:16 +0000
Subject: Re: [PATCH] drm/ttm: Schedule out if possibe in bo delayed delete
 worker
To: xinhui pan <xinhui.pan@amd.com>, amd-gfx@lists.freedesktop.org
References: <20200409013148.4219-1-xinhui.pan@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <7ebd6025-a563-30d1-8c84-cb031bfef0c1@amd.com>
Date: Thu, 9 Apr 2020 14:35:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20200409013148.4219-1-xinhui.pan@amd.com>
Content-Language: en-US
X-ClientProxiedBy: ZR0P278CA0036.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::23) To DM6PR12MB4401.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 ZR0P278CA0036.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:1c::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2900.16 via Frontend Transport; Thu, 9 Apr 2020 12:35:15 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 09d84872-36ab-435d-0daf-08d7dc8274a7
X-MS-TrafficTypeDiagnostic: DM6PR12MB4044:|DM6PR12MB4044:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB404463F82FC282B196929BA483C10@DM6PR12MB4044.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 0368E78B5B
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4401.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(396003)(39860400002)(376002)(366004)(346002)(136003)(6666004)(86362001)(31686004)(4326008)(31696002)(450100002)(8936002)(81166007)(8676002)(5660300002)(6486002)(316002)(2906002)(16526019)(52116002)(2616005)(66946007)(478600001)(186003)(66556008)(36756003)(66476007)(81156014);
 DIR:OUT; SFP:1101; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q5zyNJUwkP/txMzKSftwd20DcehWc7HY71Fs1vil/dTm0ws/J7zFTRxyfQeaq5ZhZ0/0cWYi9BOw27l4xvJ4IwewvStfO6zzLU1Oh29L5Thw3i19svk5EtuNmOs7DQERerO+Xkyqf8los8iUucOqJo5NkPwNK0RR6HTlsG9Q9U/nWoYdFSa8J8LJvFuDXoPxz4del4MmCB1KD/tOS/i9uUf130Y6zCxB96n8qtv9FFVJJBKy9WcBhKJBR+QnG9yF6dnfnVMgk3N74DZP8JZfQDH1eDzp4imX3HF4qGFHteq1zmB/Ua3iGvCDor8jP617Bl7e6xjNRI2AFyRWs4MLwAHm6hty5KZk6KAUdq1gSu2LqxD2cFQpAIrQ7TFIhoWVLkbSoSLkWb2am8L+ZQjNHPHRiDjR4m+tG4TpyRRK/4kfqsUj9wypUp1A6XAlSrgd
X-MS-Exchange-AntiSpam-MessageData: bE5Y+Y/UdH2F5vwIzQVmYLANdPxJLLf1SqrwOH2/RK0IKaNogf9Vj4afuEBj3q+62FVnWw9pS1MQYLjr5IsOjAzyT2VfLmI82pUaMOBoOAty6nOgdzCdVTvzatbfn1t7g8YJ+SOM1jSIsTUoX1NVhHnNFyAOhmuNXftLDauzNBhLRkl9dyRy7FRF8HAj22qC4QaEgzDLTyvTIUzRfc9UNA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09d84872-36ab-435d-0daf-08d7dc8274a7
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2020 12:35:15.8443 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iDTjrrz8ENyLauhiJD1Z4op7Zwmv0oEvAYnscoLAk7ZpAJA5S4+aBAcaM4ZSJaxs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4044
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
Cc: dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 09.04.20 um 03:31 schrieb xinhui pan:
> The delayed delete list is per device which might be very huge. And in
> a heavy workload test, the list might always not be empty. That will
> trigger any RCU stall warnings or softlockups in non-preemptible kernels
> Lets do schedule out if possible in that case.

Mhm, I'm not sure if that is actually allowed. This is called from a 
work item and those are not really supposed to be scheduled away.

Maybe rather change the while into while (!list_empty(&bdev->ddestroy) 
&& !should_reschedule(0)).

Christian.

>
> Signed-off-by: xinhui pan <xinhui.pan@amd.com>
> ---
>   drivers/gpu/drm/ttm/ttm_bo.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 9e07c3f75156..b8d853cab33b 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -541,6 +541,7 @@ static bool ttm_bo_delayed_delete(struct ttm_bo_device *bdev, bool remove_all)
>   		}
>   
>   		ttm_bo_put(bo);
> +		cond_resched();
>   		spin_lock(&glob->lru_lock);
>   	}
>   	list_splice_tail(&removed, &bdev->ddestroy);

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

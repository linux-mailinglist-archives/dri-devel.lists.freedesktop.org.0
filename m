Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FE91A07EC
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 09:06:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4B176E52F;
	Tue,  7 Apr 2020 07:06:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2071.outbound.protection.outlook.com [40.107.244.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1E856E526;
 Tue,  7 Apr 2020 07:06:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WAR8aNhUmzGHT6qrG6h+w2fHbAdpLjjn72uua4ve1S/qCLtV+W19wIz7Gl6kHAMnI6CIuAU2FzFBTzI6wrIklWyH83t7HB7kvtKAAgdn3FUi4vy6ro4SdAIOjlX5UTUjygDLhscdEdMG3xpcc0NUQvsR6kRF9vccikfwK+3kiUEUMbhvDrHqd84gvgaEm+ZxlxPhHLlP7+wU+ck57goMTlJoU5ASZZge36ZebMaxY4lSKfwB/PuqKcxit+BhWE70NmlhUnWimQUHx58O3DuVMM+0cekbMmQThfAYoPOSnqZ2x2UCzhMKyg8PXC7LtkUQW04+DtaaWdo3XmS2n9WOpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DrQf7W/r/0YUl0MQvWQsaYEDD7EjjIiSIxtvPdsYnNA=;
 b=Ut8+cCwA1oPx4zsIU5ev6YJWhClPid0eP6PbtUfK7cxs08c+YnaQzlavfHG30WbUXo9MM61gHSk3+RSLZWVTyzrYXA0tag4svJ3bE50k3jzMMvzd7oTCGXwaNbnF7FIDUBE2rx7XCFoa8HGkleTISHqGFmtrIn83zUYtp61A+TfhEdjvTVm2SPNAmAicOJ4TJnIPTa5vJMAr7PIaJ5b3iLHVoQOxKqdd9b3L+jl9/aUq4rSmmuAbxhFje6TUtq1XZwgwfBUoKwogNnh02oFq0afp6wxXiyjo7qUlj7KWw4ZBnq+G7kamwxWPW8Fyz78TKtwg1RyggKYU2s8uBM0P+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DrQf7W/r/0YUl0MQvWQsaYEDD7EjjIiSIxtvPdsYnNA=;
 b=ffgN9gk2+YFd7We5t/LfWW4CCHSS2HHm9fKOgBuc8RZmR3q6+KrMo4rtwmGNxxhq3tI2chxSxawplyZAcyIdU3kppgvV9WvqzGdAjcDZvH+0u8tXpTR6/C8kH8QKBiMAPJwlErfEIwZ/NEN/rp1bTXgtMQCmJQCyEv2QJ5Va/Lk=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM6PR12MB4401.namprd12.prod.outlook.com (2603:10b6:5:2a9::15)
 by DM6PR12MB3691.namprd12.prod.outlook.com (2603:10b6:5:1c5::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.15; Tue, 7 Apr
 2020 07:06:07 +0000
Received: from DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::f164:85c4:1b51:14d2]) by DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::f164:85c4:1b51:14d2%4]) with mapi id 15.20.2878.018; Tue, 7 Apr 2020
 07:06:07 +0000
Subject: Re: [PATCH 1/2] drm/ttm: clean up
 ttm_trace_dma_map/ttm_trace_dma_unmap
To: Huang Rui <ray.huang@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <1586241885-25422-1-git-send-email-ray.huang@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <19af654b-ca0b-3077-01bb-939c56b440b6@amd.com>
Date: Tue, 7 Apr 2020 09:06:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <1586241885-25422-1-git-send-email-ray.huang@amd.com>
Content-Language: en-US
X-ClientProxiedBy: AM5PR06CA0024.eurprd06.prod.outlook.com
 (2603:10a6:206:2::37) To DM6PR12MB4401.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM5PR06CA0024.eurprd06.prod.outlook.com (2603:10a6:206:2::37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2878.16 via Frontend Transport; Tue, 7 Apr 2020 07:06:06 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9b855bf4-b8d9-4dbd-27c9-08d7dac224f1
X-MS-TrafficTypeDiagnostic: DM6PR12MB3691:|DM6PR12MB3691:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB3691115CD4C25D4F0B051CCF83C30@DM6PR12MB3691.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 036614DD9C
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4401.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(376002)(136003)(366004)(396003)(346002)(39860400002)(2616005)(66556008)(52116002)(86362001)(36756003)(66476007)(31686004)(2906002)(66946007)(316002)(5660300002)(4744005)(478600001)(81166006)(186003)(16526019)(81156014)(6666004)(6486002)(31696002)(8676002)(450100002)(8936002);
 DIR:OUT; SFP:1101; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XTuzJK8g6BazLjunduuk98+JdL3zHHbM3dAE+p0G96H/UjvNP5DGzomAe86d/NiN5MLXFt1LuTuQsrwRDF9sDqV/6upmtsOyHAJoHER7kT2By7YKSq/SiCwI/5HgU/X4+pwuTw1wNjiPPW+Fng5TC6DywnqtI8rR4cd8I0/mTzHG4GURCG/+egkJvT167L5y4m4yoQZV1JNTWgweONUO0CpYq9IC0pthCZkvbPyVRTpsBa15OypDgShLS4Rog7GOvI1WU6F9Rpq48FGGanJ0E1hdIudt1h0yBipNTG+M969FAoy/oF28bpd2ymcsz7mbv7bf+7gM9pZvun2xAj3ZREDVmt7Uo2tPzYxKoXLwqXOz9Z4Jr0iE5gh0azQQZZSV8TuxrxzC73BVjOYiAMqxMJxC95G8H7si/ul3eaCE82TjUERR2Vtrmoi4csp9VRnV
X-MS-Exchange-AntiSpam-MessageData: XLEvx+U/yIgHhuCRog5uz/wrm04F506XlIX0+kqFfAZ3Lov+16rKF4i2/s9uJPIDUO3+Z2t3AmJoKfidYwCB/RV2hSySxXgX3MOEQjNtXG7jYiOU0+DUz6Tm/udmzB/n+0Uf62IIDCgL84sBBfdoKTffODGjkejYFxqdmw/STOQ5Nad3VP6xt/VRr1NvNT8Ez8KhiqxGjp1PmGS/A8Ldyg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b855bf4-b8d9-4dbd-27c9-08d7dac224f1
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2020 07:06:07.7058 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6W4fLFm6ashmZyFn+rN71Cnisb63J8B+5AwDfbtUnsu8KWicQbJYqXBmDssAx2jn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3691
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 07.04.20 um 08:44 schrieb Huang Rui:
> ttm_trace_dma_map/ttm_trace_dma_unmap is never used anymore. Move the pr_fmt
> prefix into this header.
>
> Signed-off-by: Huang Rui <ray.huang@amd.com>
> ---
>   include/drm/ttm/ttm_debug.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/include/drm/ttm/ttm_debug.h b/include/drm/ttm/ttm_debug.h
> index b5e460f..bd7cf37 100644
> --- a/include/drm/ttm/ttm_debug.h
> +++ b/include/drm/ttm/ttm_debug.h
> @@ -27,5 +27,5 @@
>   /*
>    * Authors: Tom St Denis <tom.stdenis@amd.com>
>    */
> -extern void ttm_trace_dma_map(struct device *dev, struct ttm_dma_tt *tt);
> -extern void ttm_trace_dma_unmap(struct device *dev, struct ttm_dma_tt *tt);

I would just completely remove the file since it isn't used any more.

> +
> +#define pr_fmt(fmt) "[TTM] " fmt

Oh, that is most likely not a good idea. The pr_fmt define should be set 
for each file individually or otherwise we could accidentally include 
the file in a driver.

Regards,
Christian.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

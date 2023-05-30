Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D4A715941
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 10:59:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7715B10E150;
	Tue, 30 May 2023 08:59:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2067.outbound.protection.outlook.com [40.107.243.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 174F010E157;
 Tue, 30 May 2023 08:59:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FddRnXPNJUdJxCXJK3VX/wnVTUf2HwUdVyGdZtFoDHa7YPLaCUyxu5iDJ1qg/jZfbw7Fw5XBEi26GtRZHVM9MBlCU48istb/59Y+QmiKxKmmtyble9NoGR5q63y3jzcAPZI4SMJRT+Eg7oXEqZDlbLj/bTIdu44UMB+Cgs5eyvMeul4sjHsuGmBaPkbbEd/2ZFZSY/3F2x3eYXIuAWDjxKHj/hg3vz1rK3bW7r+eX58ksrEA2lDHnZZJgoWh1AgLp85qA7xngCxDocogCQf5yBNlEOy8leo2zkMxFuz+pdfAAwgNFcgrh2XiXN60pimdiFP1ADUF08nW3cvvU3Kn/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b25KfUk/DsqTkJzDqMqMlenntGjd87g+Uswx5l1lHmY=;
 b=IUUzUA1K6hEhMCDu3zMOmEp/AV1S8+NI1lKMlV+McxeEfOwxfiaytE1Rqq4XKWP26CimcRWvs3ZiwQsHVCmoZfylMDH2OOY361LficRWwnLObs1U/0/n5GgTJf9hUiMxelIho66jCuzG98wRr1r5j9zYCkFdsey83VeLjdIUVlehlHp/VN5Msg6NhmozcNgxiVYd8wQsqEwGz/sGs9OEY4WhKRpf9wziInnXD4iyoHMUFKN6kr7DIY9WFhX0xtOnfgEgsapNv0it/kjVP//ol0Mk6eDLXGRZCmyrOi1oDIAJCvScj+OaLpToqKnaQpKcYKtiDEfW2GKSU49K6AQi+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b25KfUk/DsqTkJzDqMqMlenntGjd87g+Uswx5l1lHmY=;
 b=RPkPwe8QU7p5b64Ic13v/1QZwgGHicEha6VC3FjHUTTyMsehSl7ZxkTFjA3MambfGRO8sRv01yIhrwgoMgY9F3MAKXVBYx4M8DplVdWtSR7Y8WahN0vKWiZb5DFzBJDNFxoUehff4/0D7Ld87wyJGE78yas3Fy8xGxXo/Uj8wmk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MW3PR12MB4443.namprd12.prod.outlook.com (2603:10b6:303:2d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 08:59:18 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e566:9ca5:28e0:a42b]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e566:9ca5:28e0:a42b%4]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 08:59:18 +0000
Message-ID: <420e2658-37e8-3f1c-84a5-ca24e9d104ff@amd.com>
Date: Tue, 30 May 2023 10:59:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/ttm: Remove redundant code in ttm_tt_init_fields
Content-Language: en-US
To: Ma Jun <Jun.Ma2@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20230529092853.3430546-1-Jun.Ma2@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230529092853.3430546-1-Jun.Ma2@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0091.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::10) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|MW3PR12MB4443:EE_
X-MS-Office365-Filtering-Correlation-Id: e8607bfb-1865-4372-6241-08db60ec2695
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ldkbqjG8XEeZcAP9wZp9/CNMo8DCuwgdW2AVasjSdEj4WZjyoBYhAL+NwLZf86PcFUpn37etiGhaTEODBGK07HuD10H7eCU2//mjnu3a0CfqnyyN9zilsKAK639NSA+NBv+LNNakpBEnELmd1AwvGyMOyYxNNjqAMF8e2vVl4Io2eN2hJN9o/BgalR0sEVEgmt3XE+JRzEhW1N1l3jNWziZVU+sB1uHlX0PK3Ytps0ysN2Z7JAMMyFonQ5YIVrrkqvkXCyoGsvaa8KTSEDg+q6RiHF3FhpGV71xQ1mTXBO3cBY45JDmTF9XDRAmYeL9BDKEAZsKFCTSgWbsraVXi47vdjEQ/swJO2sclRMcXfhtu8dfl/vSrJN51iYRlzXG8Ll5W7vpRz2iAl3B8n7TT1KY5weBz/WKCtSqxMV8mhkFauQ51lXy0fiq54KGv/ukUvTkimbKO1o0Ex+t6qgXr1fGzUq8W0N8bVq0LHWePs6JdPBFOMN5SmKXK3JibggdtIO52Akb2pRrWMO+LLbb366EPJwzDJ2Lj70RGxEyTuDFepeShjxD+pc4Hadl0tBBPx/tK1iEqfraCCdl2IhkEfBWzIGHEso2ivAevRtA0anPUpnuDONIwU9v0imkmfaevGtCofreuvJZ9JhX1IHvJPg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(346002)(376002)(396003)(39860400002)(366004)(451199021)(4326008)(66946007)(450100002)(66556008)(66476007)(86362001)(478600001)(5660300002)(41300700001)(6486002)(31686004)(8676002)(8936002)(31696002)(6512007)(316002)(6666004)(6506007)(186003)(2616005)(83380400001)(2906002)(4744005)(36756003)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aFVsRUkvOWMxaHZNNC9OUm9OOEpaK2c3NmR0MisyeGFsQzZVYVdDMWdrR0J4?=
 =?utf-8?B?VnJLekFGemFNMTRxNVVQczZuMTM5cUNiRWQzQnJERE1Rd1BTKzZNbDhDc1p6?=
 =?utf-8?B?YlBPNWNKSnVTejNRaUtNN3prU0srRUw4NGNRMHdPaEFBcmJzOUhsN0NhNTBD?=
 =?utf-8?B?ZjMzV3lkaFByRkVuK0VHZEtYTGw1ei9UM21ORHR3dis1MVBKNWI0QzlrNU1Z?=
 =?utf-8?B?SjNjbHkwbUx5T2UwK3lGVUVHYk11VDdFb1loODMzTzlqMGozZm9YK25hRW1m?=
 =?utf-8?B?bndsQVVyRmpVTC9qbjUzZWFvMnBrR3d0NXp1MDhKQ0ppOWZFeU5wOUdqVW4v?=
 =?utf-8?B?c1ZINDNjRThNeldrSDdUdDRGeHFHcmZCNGt5QTFtUnFiODVmanpaRmJUTmRN?=
 =?utf-8?B?VWhIejFUSXcyZTRlMWhmTnN6d01aazFGRUhkTVA0SytZLzZ2OURQNDZmNDVv?=
 =?utf-8?B?Mkt5Uk9JTXhCL0t0QUZvdDQvRFZBbloxZ2pMWE80dTY2alBrS1VHVDNncm1v?=
 =?utf-8?B?ZjlkT1ZJV2h2WTNML3NlTG5wd0M3OFZEZW4xWjhndDZHalovN2RWVVJvVkpS?=
 =?utf-8?B?bnVBazlvdzE5L1ozSTIwWHpqWm9KS0l2d2VQc1l5RTNvMnUxbiswOWZWcFVv?=
 =?utf-8?B?b0cxUTVBWGRCMGNzMEFETmdwdC9PeUlkMDIya3QzS0NGM1pwY0xKKzZ6QmFO?=
 =?utf-8?B?eGx3RkpjQnRuM0N4Nm9MZlRVejkxcmV4aXpkQ1BxZGZraWh5eUFtSW9qc0pF?=
 =?utf-8?B?VUZaZXE0UmxMYzZob2xKQnROVDFZSGdqbUxYb2xoNUFqeDk5Smt4eXlrelpC?=
 =?utf-8?B?VDBUZGFaWUluOC9obEpYNlZSU1NDTzd3YWJWeGd2YlVBc1ZsNkRHdWVGcThE?=
 =?utf-8?B?aDJNZDhrYm4rSDExbG5OVzFCVzk2MU5YbVV0T2ZnU0ZYL0dGcmV6NkYwb2Ir?=
 =?utf-8?B?WnJ0djIwZndoY05YQmJudy9OcGtvTEY3cmZjNTJHZktIdkZVZEJDT05WcVpR?=
 =?utf-8?B?RWx1ak00dDA4KytnUFF5WFI0SzByMTdiSGFaTWRDd25SeVZXcmM2cDcvWXdZ?=
 =?utf-8?B?aHpuQmdlaWpGbGZxaXFXMCs5aTNZc0V0Q1Vya1V5VHZoY0pWcWpGRkRrL0Jx?=
 =?utf-8?B?YjBKNHlWdWxZNVNrVkVCRmIzODRUYTBncmVTR2c5M0xoQnM2NVdsbmxkNXFx?=
 =?utf-8?B?aEUwM1JhbDkzQWxtMzZXcTdzWkhnVTVoSGFTemFjWXU0LytoT0xIU3MyaGJo?=
 =?utf-8?B?bjJXTWgvU1MzQVZlWHRlL2xWa2hjL3A4MkhHMlkxVFQxYm9KRHZMODlpWTVy?=
 =?utf-8?B?dlJ6eFJLWXNjVkFtZVQ3QUd6MUJpandXMVM3MzJTVWZOSkoxSlVQRFQ1Nlpm?=
 =?utf-8?B?N1hVQ2psWW1MN2J2N1YyR052WU5mcVA0V0NSYXJqQ2ZYTVVISHJkOEVlTG40?=
 =?utf-8?B?TlE1bUgxYXc3SlVDQkUwNzQrVCtleWdGN2tKbnNVaktsajJ3eGpvWW1kSEtQ?=
 =?utf-8?B?QXdvaEJ1NlNGMzFHZ3U3RmQvRVBmNGlzQjJGNHJyV3lEakIxbjJRaXE4RjhE?=
 =?utf-8?B?WENBMGpKYUZ0ejNJTFRha2d3a1p4Y1hyRk9IQlRZMEhqb3MvWDNCVXFMOHlX?=
 =?utf-8?B?UXVnRHJUb3RLNDB0ZTVNem51U1g3YVcxWW9wRHAzT2VhR3drRGRQUkxyQ2RF?=
 =?utf-8?B?dzJQVDZFa2hmODNyM2Y5NXNYNk54ZzN2MVV2T2IxeHVML3FoSnNXY1FNZEpl?=
 =?utf-8?B?eHlxQXhoZG5HYTYxd1N5REZ2cjBTcnVQOWRSMm1aRmM2K3ZzNEVzR0Z3Tk1P?=
 =?utf-8?B?bzNCbnlFQzc3SjRUcEc1cEZoV0pUb2c4aHRONEwwMm5Lek01OXUvUm14MGVD?=
 =?utf-8?B?R01EZkFveWhySnNvcU5HUnpiRnZNTE45RlpVblFSRWhnZThzKzJEZ2F2b2Y3?=
 =?utf-8?B?dFFDaVVqV3UxUTZ2Wkw0MmtVUkZmTm1lek0wWTg2dzA2aENaS25DNTkvQWlp?=
 =?utf-8?B?YjlHMmFTWnNPNk9rU1pBTjFNMFIydEgvL1VVWS9xaW9RQ2dtd1E1RWVJNnI2?=
 =?utf-8?B?enNNcXl1RXI2UFlwMWRZTjcvaTFwZTROS0Nvd3Q4a2RBTnhXTlZPZHgrQkV0?=
 =?utf-8?B?MmtJcWF6V1dDc05NS2FwNmNiM2dBNHo0d3ZnZExQRDErTWVSS0RVYUliRDhU?=
 =?utf-8?Q?Yw1+k5Y2AhXknnoKwAhnJbuMXPl2wkn8krLckapyvspB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8607bfb-1865-4372-6241-08db60ec2695
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 08:59:18.1830 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OfKnnAhncdQyYEC8gQwG8A9oJcfrJDRxHcWHFkIF6axLLjhw7dsr978CYrJkPRpa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4443
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
Cc: majun@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 29.05.23 um 11:28 schrieb Ma Jun:
> Remove redundant assignment code for ttm->caching

The explanation is missing why this is redundant, e.g. something like 
"this is overwritten just a few lines later"..

Apart from that looks good to me,
Christian.,

>
> Signed-off-by: Ma Jun <Jun.Ma2@amd.com>
> ---
>   drivers/gpu/drm/ttm/ttm_tt.c | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
> index 02b812dacc5d..45a44544b656 100644
> --- a/drivers/gpu/drm/ttm/ttm_tt.c
> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> @@ -143,7 +143,6 @@ static void ttm_tt_init_fields(struct ttm_tt *ttm,
>   			       unsigned long extra_pages)
>   {
>   	ttm->num_pages = (PAGE_ALIGN(bo->base.size) >> PAGE_SHIFT) + extra_pages;
> -	ttm->caching = ttm_cached;
>   	ttm->page_flags = page_flags;
>   	ttm->dma_address = NULL;
>   	ttm->swap_storage = NULL;


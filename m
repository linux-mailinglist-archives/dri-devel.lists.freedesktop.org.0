Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75CFD7D7FA6
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 11:36:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AA8610E124;
	Thu, 26 Oct 2023 09:36:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2084.outbound.protection.outlook.com [40.107.243.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB89110E124;
 Thu, 26 Oct 2023 09:36:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l8/5RdSowbUdXYwjTt6j65vm2vCptvUxgglFup0nbsMTlpYeTTJCk5Bcu4k2v/X+Om0akOjGSX3hCA1387uEYZ/8pWdb2F29UiSqi0REoAOndW9lDtrxCa8Hrr8HKEuChD0x9x8hVyJym3Nm+jUCgLvSlDyZiZj4HJgIv5ImITj6Izcnh2bju08SgQ4bEWnTpR6Vu+3wBvHU0ntnt5gdw1ZRFdetS+uct9drtDRqzn7PkYuRCtpi0Z8SxMgVj1B1emiS+mOYHh3CdDWkqua0ba99ehqCHuInndQR7IN62UH9WAiVEIHlXRJDlpVcFX2txXxCxHIzew5XeaOBuet47A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VRQpeu2gGFIsMH708uTTbhf+l1I/CdKxnaHtaETlLeg=;
 b=bcuwO9pXk4+BvTMUbKUQMQ7JbeUTM7uZK4tyE75rT67bH3CnS7PraHbXL6Efht8+7r2SMEOJNw/9NBJDUtLsz0X0sln9bkayI5fB/nNof6kbobpUcbzQzXZUiA6qR+j3KBjov0ZoZyWlYMYm0afKKBP2Ea3QggaWkBDzDy12xG0AuuoHAXMC5KKZJvzvgm0S3hVhjKorUOHal4h/WGVCR6DZSc7xMhQWmkuYVEUgsAcjiFpMLSjk4T+Ff9wzvfMtkzy5CXvqMG/F/h6KYS1rSfSLo/n+HD9JbHuzChdWFaqR4B+DxRLYrboqyftTWiJbXJvssZDwnzqjw1ArDdrx7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VRQpeu2gGFIsMH708uTTbhf+l1I/CdKxnaHtaETlLeg=;
 b=j4hsn1c0rBH48uheKRzDHYZQfSAbIUENPUJk9Ys+gIgcUf4YLTM3Pc8Dww8bEH/fmolxT+xZQrtUCRrjdEbkXebNslXTD7oaMEm9Q7ZmeYFwiWIOlrNPa7p7jvdy8NVYMIoqtzPhLKsYY5En8rMUloVWKS5H/HoO6Nfizj5JoAE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 MW4PR12MB7312.namprd12.prod.outlook.com (2603:10b6:303:21a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.31; Thu, 26 Oct
 2023 09:36:28 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b80b:7138:6ceb:9aef]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b80b:7138:6ceb:9aef%6]) with mapi id 15.20.6907.025; Thu, 26 Oct 2023
 09:36:28 +0000
Message-ID: <56160837-12df-4a02-8180-dbee6d6d5a0f@amd.com>
Date: Thu, 26 Oct 2023 05:36:24 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.3.3
Subject: Re: [PATCH v7 3/6] drm/sched: Convert the GPU scheduler to variable
 number of run-queues
Content-Language: en-CA, en-US
To: kernel test robot <lkp@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, ltuikov@yahoo.com
References: <20231026041236.1273694-4-matthew.brost@intel.com>
 <202310261439.3rbAtEoB-lkp@intel.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Autocrypt: addr=luben.tuikov@amd.com; keydata=
 xjMEY1i6jxYJKwYBBAHaRw8BAQdAhfD+Cc+P5t/fiF08Vw25EMLiwUuxULYRiDQAP6H50MTN
 I0x1YmVuIFR1aWtvdiA8bHViZW4udHVpa292QGFtZC5jb20+wpkEExYKAEEWIQQyyR05VSHw
 x45E/SoppxulNG8HhgUCY1i6jwIbAwUJCWYBgAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIX
 gAAKCRAppxulNG8Hhk53AP4k4UY5xfcje0c5OF1k22pNv8tErxtVpgKKZgvfetA4xwD+OoAh
 vesLIYumBDxP0BoLiLN84udxdT15HwPFUGiDmwDOOARjWLqPEgorBgEEAZdVAQUBAQdAzSxY
 a2EtvvIwd09NckBLSTarSLNDkUthmqPnwolwiDYDAQgHwn4EGBYKACYWIQQyyR05VSHwx45E
 /SoppxulNG8HhgUCY1i6jwIbDAUJCWYBgAAKCRAppxulNG8HhnBLAP4yjSGpK6PE1mapKhrq
 8bSl9reo+F6EqdhE8X2TTHPycAEAt8EkTEstSiaOpM66gneU7r+xxzOYULo1b1XjXayGvwM=
In-Reply-To: <202310261439.3rbAtEoB-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0150.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:8c::9) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|MW4PR12MB7312:EE_
X-MS-Office365-Filtering-Correlation-Id: adb580c0-fddd-44f4-14de-08dbd6070763
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: An0kFKoO9qjbQI/L7vPgYaBLtWc1gjtn8k+UyQrhfUUYpdlx7FVgxKKGRTEEuwR1AUEKFWeMK7kD36/c2/Ak1pNiUSy3TlEWtl19Vt7ReYTWVWyVlUR5OhepkpGZb86IWuXZPmRA6vqdFZO1zbsxTFkCNXoRBqC1xtUFIaNLcilsP0fcyWrUyeEoFesPV9wlTvtzWVseEnoZzb24dG8UddXYX17COWsodgpa0p0C0FKABnJiql66/++dIbHyg+hRnTrT8gQ9ZyI8a7NQtVmjaWXJBcl2uHJcqnO1hk/gmefxm2Sx5WlRDFXF6sjLfUdtk9p+c2PPjMafqQMRIJWJM0kyYfIIg0iXyPADiJRnF0p1EtxQqZmrP+cL2QhR9bE729r5j3U0G6YnAaHgB/IkNOkDV5d/c/OLlK1k84YBSzmxVFA0dg7Z1r7z8fGHHFxzOI1IhQbgw5HIdKGDC/4skJt5Hf/5hGCvQGQr7dnaPXEWRuP//eHx4QX1qmlgJrAD89iYuLLjwo1h/VHogR9QNTSLXpnodmWJ5+WaI77vl6oxw0Hly2AAUrDISkxFCsEvNZ6unh4oJoArpe+1LtuG/4o6XN+zTnpiHzJPkh6vFIwPIJQZsxF4FMd5HYmRmaMtNVFbDggwBGlTQzxcsNraRDTrVTwPdm9+/6yTC4A2514=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(396003)(346002)(376002)(136003)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(30864003)(54906003)(2906002)(41300700001)(38100700002)(478600001)(66556008)(66946007)(6506007)(2616005)(316002)(110136005)(53546011)(6486002)(966005)(6512007)(66476007)(83380400001)(86362001)(4326008)(31696002)(7416002)(5660300002)(36756003)(6666004)(8676002)(44832011)(8936002)(26005)(31686004)(4001150100001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NmFoV2NiVHRicTdyVTFjYjdtVGJZZC9CSTFmcFBMQWJDVFZPdThRMHBkeG4v?=
 =?utf-8?B?YnVqQ0FYalBJQjlGa3ZlTXltdGRtQXFNSElxUnI4QUpUK1lvNzNFQnZWbk5q?=
 =?utf-8?B?MjFJWHFDNEFXN3JvSGEwQ2UyK3kvMm8yVzVMRDg3QXpLTzNRNEhMMVFiSWVr?=
 =?utf-8?B?QVpqZjlhOXBRTzR5ek5Mc3VYbWdCOG1zOTVBK29sajMwVHBLNXhTdjdCamtj?=
 =?utf-8?B?VjkyZ0tPd0I1WXhwOTd5QzJhWXBmMkl1MlVac3FUSTZlWXlIcGduZVNaWkJv?=
 =?utf-8?B?ejcxYnJWZ2tFb1l1TmtpdjVmMmJwUisvZ0pzN2lwODQxN3pSN3RxYldGSVlG?=
 =?utf-8?B?czNDbFRTMEdHS1FCVmo1OWZnaUtkMldjelVWSzc3alFGZ1ZtbEdTemo1Z2xC?=
 =?utf-8?B?VTZZMjBLbngwQkNJOTlYb0l0Njg4Z2Q3Y0hMK0E2ZVIwQUNKbU52dmNNMnVY?=
 =?utf-8?B?Y1hlb2tLVzVVakl3V0FsUmJ2SWhEc09TOGlFN3NVVVhyWHlxc0Z6aDhZQkZV?=
 =?utf-8?B?OEVoYWQxbUVCWEw2L1lQZzJwNzV0ME9vQWpNeVBtZWJRa1dieHlVdEV5U3lY?=
 =?utf-8?B?a0VaZDFUQm4renFTNytna3ljVE5ud2dmOGlTelczYnN1c1dFeEVvV25RdlhT?=
 =?utf-8?B?cDRRZmNUNmdPMU5UbHd3TkNkQm5HU0Rvak9UMVVPNkluN1pnaFFkcGdHVVFa?=
 =?utf-8?B?OU1GbmlJYjJJcis1TWEzWExoeWRRNGl0K1JHM3ZMa1hoaWRpNEpCMHpTQ1FO?=
 =?utf-8?B?cDhlZjlUUnpNZ3ZJbEp6NkY5Tit0MFpjeWxMR1RCc0hYQkJ3T1hnMWpmYWFz?=
 =?utf-8?B?NEtSUjZnVUpqMm9DU1NURFp3bTUzVWNRL25SNTJOcWlrbGJwTmU5ZWUyRXJX?=
 =?utf-8?B?bHlIMzI3aWk1ZFR5bksxWExvNERUVk56RTExTndLZjQ3K3JIdUhjOEl2THMy?=
 =?utf-8?B?VHlSeDQxMXdaY0MrRUxBN2xGNHVIcGNhVnZ5c3dRS2M3aFBHWVQ0V0Y0K2lI?=
 =?utf-8?B?ZDdqWXFUazQ3eVJYQVBwR3dPSFltRHI2YjFyRUY3OFQ5WjczZ1VnZklpU3hs?=
 =?utf-8?B?MEpHaUZMc0I1d1JkR2w3NWhmTFA0eERNU1AzbEpDblJOdUt6cGllSU5Oa1Jw?=
 =?utf-8?B?OFNkOG9VZ0svK0R5SHppalQvbm5qRksxZ3V6cFBvMkZFaWt4aXNjamt3Wk5z?=
 =?utf-8?B?QXBHOVN0T1U1NTV6ZXBBNmg2V21jeXNrZWFrNnZ4UzFUeG5meVhjQUc5Zmxh?=
 =?utf-8?B?bDNuaTlUdDNMSVV0YUtKMFNZbU1tUXZCUm5QT2lpMlIwT2hkdzlKTnZpalo3?=
 =?utf-8?B?V3NaRERGVDNMTmFjdUY0ZWVMRW9nOUk3TXVuU0RJWTNHVWw5NnFXR0czZCtW?=
 =?utf-8?B?aWFyRDJ4SnlhWlpiNDVmbWVSMjFPWHZBcmNja1ljU25UK21GSVZzNU1Fb0VG?=
 =?utf-8?B?b25PQVFkU1RkYXJlV2JtSGJUdzIrZ05QL1BXUXNoS0tuQ1RhK2pWT2pRNGo4?=
 =?utf-8?B?SWFna3hmS1lKVm10cnNERDBWVEZIOWlPN2tGZzBSOGoxeksxSFpwcXlmOC9u?=
 =?utf-8?B?YW1rRVc5THZJd0hhb3NxM0ZCOXc4dlEwSFVFS0hzeGNHVzN4c0dZdlZoakxy?=
 =?utf-8?B?a0prS2Q2dFF2dDNQNEZUTjM2QWkxMmpEZW5hZkczZFBsY2l3NmV2NW9IKzBO?=
 =?utf-8?B?S0ZEczVDZDVjcFlIUVp0c2VkdkUwYVRXempJNjVXSkpsZHlyYlhUSnlNOEJn?=
 =?utf-8?B?SWNmOHFicWtoeWRrQndFWGtXNmNDNjNUeCtsTG9SQisybmFIMldnb24zUzdV?=
 =?utf-8?B?NDVjU2s1NDZ0c1RYR2dDRThZRlVoemd1Z1BRbFdiK1B3UXdpRlRKUWZGcmlT?=
 =?utf-8?B?UjNaWlRyT3VtcEZscHVId1U5c1NBSUVGTVhNTm5OWkFKOFA3SjBRRzRuc0Rl?=
 =?utf-8?B?bUxLWTBtWU5hQjhVMndlaDJGYlNoWVVyak1UeSs0SUhTazh0bFU5WDg5cGlq?=
 =?utf-8?B?cXVWM0lDdHBqeUhLUDNOc0dYQUpCWk9tc3hhOHVuK1FmTS9iYXhVdk1DUnY5?=
 =?utf-8?B?WlNzMFdidE85ZHA2a0lRTm51TVVyWlExKzZBR3gyU2JqcEdmUkxCMDFNc0xx?=
 =?utf-8?Q?j2+HDvJtVvukAWN5B0+erqfuw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adb580c0-fddd-44f4-14de-08dbd6070763
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 09:36:28.1572 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tjj8Iak9+YvUX1MMr7bhQjuYBEj7ay96lSzITgRfJUVeoEwX/fbUOMaBNp78WX4A
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7312
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
Cc: Emma Anholt <emma@anholt.net>, nouveau@lists.freedesktop.org,
 Liviu.Dudau@arm.com, robdclark@chromium.org, lima@lists.freedesktop.org,
 mcanal@igalia.com, dakr@redhat.com, donald.robson@imgtec.com,
 lina@asahilina.net, thomas.hellstrom@linux.intel.com, sarah.walker@imgtec.com,
 ketil.johnsen@arm.com, linux-arm-msm@vger.kernel.org,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, etnaviv@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, oe-kbuild-all@lists.linux.dev,
 faith.ekstrand@collabora.com, boris.brezillon@collabora.com,
 Qiang Yu <yuq825@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2023-10-26 02:33, kernel test robot wrote:
> Hi Matthew,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on 201c8a7bd1f3f415920a2df4b8a8817e973f42fe]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Brost/drm-sched-Add-drm_sched_wqueue_-helpers/20231026-121313
> base:   201c8a7bd1f3f415920a2df4b8a8817e973f42fe
> patch link:    https://lore.kernel.org/r/20231026041236.1273694-4-matthew.brost%40intel.com
> patch subject: [PATCH v7 3/6] drm/sched: Convert the GPU scheduler to variable number of run-queues
> config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231026/202310261439.3rbAtEoB-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231026/202310261439.3rbAtEoB-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202310261439.3rbAtEoB-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    drivers/gpu/drm/etnaviv/etnaviv_sched.c: In function 'etnaviv_sched_init':
>>> drivers/gpu/drm/etnaviv/etnaviv_sched.c:138:30: warning: passing argument 3 of 'drm_sched_init' makes pointer from integer without a cast [-Wint-conversion]
>      138 |                              DRM_SCHED_PRIORITY_COUNT, NULL,
>          |                              ^~~~~~~~~~~~~~~~~~~~~~~~
>          |                              |
>          |                              int
>    In file included from drivers/gpu/drm/etnaviv/etnaviv_drv.h:20,
>                     from drivers/gpu/drm/etnaviv/etnaviv_sched.c:8:
>    include/drm/gpu_scheduler.h:530:45: note: expected 'struct workqueue_struct *' but argument is of type 'int'
>      530 |                    struct workqueue_struct *submit_wq,
>          |                    ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~
>    In file included from include/uapi/linux/posix_types.h:5,
>                     from include/uapi/linux/types.h:14,
>                     from include/linux/types.h:6,
>                     from include/linux/kasan-checks.h:5,
>                     from include/asm-generic/rwonce.h:26,
>                     from ./arch/m68k/include/generated/asm/rwonce.h:1,
>                     from include/linux/compiler.h:246,
>                     from include/linux/build_bug.h:5,
>                     from include/linux/init.h:5,
>                     from include/linux/moduleparam.h:5,
>                     from drivers/gpu/drm/etnaviv/etnaviv_sched.c:6:

The reason for this compilation failure is that this patch is completely mangled and nothing like the patch I posted.

My patch is: https://lore.kernel.org/all/20231023032251.164775-1-luben.tuikov@amd.com/

Save it raw to your disk from this link: https://lore.kernel.org/all/20231023032251.164775-1-luben.tuikov@amd.com/raw

And apply it with "git am <file-name>" on top of your clean tree, e.g. drm-misc-next. THEN, after that,
apply your patches.

It should then compile without any problems.

Just looking at the first hunk in my patch:

> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 2b8356699f235d..251995a90bbe69 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -2280,6 +2280,7 @@ static int amdgpu_device_init_schedulers(struct amdgpu_device *adev)
>                 }
>  
>                 r = drm_sched_init(&ring->sched, &amdgpu_sched_ops,
> +                                  DRM_SCHED_PRIORITY_COUNT,
>                                    ring->num_hw_submission, 0,
>                                    timeout, adev->reset_domain->wq,
>                                    ring->sched_score, ring->name,

While this looks like this in the version you posted of my patch:

> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index b54c4d771104..94d073bfbd13 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -2280,6 +2280,7 @@ static int amdgpu_device_init_schedulers(struct amdgpu_device *adev)
>  		}
>  
>  		r = drm_sched_init(&ring->sched, &amdgpu_sched_ops, NULL,
> +				   DRM_SCHED_PRIORITY_COUNT,
>  				   ring->num_hw_submission, 0,
>  				   timeout, adev->reset_domain->wq,
>  				   ring->sched_score, ring->name,

What's that "NULL" doing as the 3rd argument???

And the rest is similarly mangled as well.

Please apply my patch AS IS, no local changes, and then apply your patches on top. That should ensure compilation is correct for all,
and a more precise review can be had.

FWIW, we should've had dynamic sched_rq from the outset as opposed to having to have my patch that now. So imagine that you already
have a branch which has dynamic sched_rq, and then you apply your patches--should be a more straightforward and clean application.

Regards,
Luben

>>> include/linux/stddef.h:8:14: warning: passing argument 4 of 'drm_sched_init' makes integer from pointer without a cast [-Wint-conversion]
>        8 | #define NULL ((void *)0)
>          |              ^~~~~~~~~~~
>          |              |
>          |              void *
>    drivers/gpu/drm/etnaviv/etnaviv_sched.c:138:56: note: in expansion of macro 'NULL'
>      138 |                              DRM_SCHED_PRIORITY_COUNT, NULL,
>          |                                                        ^~~~
>    include/drm/gpu_scheduler.h:531:24: note: expected 'u32' {aka 'unsigned int'} but argument is of type 'void *'
>      531 |                    u32 num_rqs, uint32_t hw_submission, unsigned hang_limit,
>          |                    ~~~~^~~~~~~
> --
>    drivers/gpu/drm/lima/lima_sched.c: In function 'lima_sched_pipe_init':
>>> drivers/gpu/drm/lima/lima_sched.c:492:31: warning: passing argument 3 of 'drm_sched_init' makes pointer from integer without a cast [-Wint-conversion]
>      492 |                               DRM_SCHED_PRIORITY_COUNT, NULL, 1,
>          |                               ^~~~~~~~~~~~~~~~~~~~~~~~
>          |                               |
>          |                               int
>    In file included from drivers/gpu/drm/lima/lima_sched.h:7,
>                     from drivers/gpu/drm/lima/lima_device.h:12,
>                     from drivers/gpu/drm/lima/lima_ctx.h:10,
>                     from drivers/gpu/drm/lima/lima_drv.h:9,
>                     from drivers/gpu/drm/lima/lima_sched.c:11:
>    include/drm/gpu_scheduler.h:530:45: note: expected 'struct workqueue_struct *' but argument is of type 'int'
>      530 |                    struct workqueue_struct *submit_wq,
>          |                    ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~
>    In file included from include/uapi/linux/posix_types.h:5,
>                     from include/uapi/linux/types.h:14,
>                     from include/linux/types.h:6,
>                     from include/linux/io.h:9,
>                     from include/linux/iosys-map.h:10,
>                     from drivers/gpu/drm/lima/lima_sched.c:4:
>>> include/linux/stddef.h:8:14: warning: passing argument 4 of 'drm_sched_init' makes integer from pointer without a cast [-Wint-conversion]
>        8 | #define NULL ((void *)0)
>          |              ^~~~~~~~~~~
>          |              |
>          |              void *
>    drivers/gpu/drm/lima/lima_sched.c:492:57: note: in expansion of macro 'NULL'
>      492 |                               DRM_SCHED_PRIORITY_COUNT, NULL, 1,
>          |                                                         ^~~~
>    include/drm/gpu_scheduler.h:531:24: note: expected 'u32' {aka 'unsigned int'} but argument is of type 'void *'
>      531 |                    u32 num_rqs, uint32_t hw_submission, unsigned hang_limit,
>          |                    ~~~~^~~~~~~
> --
>    drivers/gpu/drm/v3d/v3d_sched.c: In function 'v3d_sched_init':
>>> drivers/gpu/drm/v3d/v3d_sched.c:391:50: warning: passing argument 3 of 'drm_sched_init' makes pointer from integer without a cast [-Wint-conversion]
>      391 |                              &v3d_bin_sched_ops, DRM_SCHED_PRIORITY_COUNT, NULL,
>          |                                                  ^~~~~~~~~~~~~~~~~~~~~~~~
>          |                                                  |
>          |                                                  int
>    In file included from drivers/gpu/drm/v3d/v3d_drv.h:12,
>                     from drivers/gpu/drm/v3d/v3d_sched.c:23:
>    include/drm/gpu_scheduler.h:530:45: note: expected 'struct workqueue_struct *' but argument is of type 'int'
>      530 |                    struct workqueue_struct *submit_wq,
>          |                    ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~
>    In file included from include/uapi/linux/posix_types.h:5,
>                     from include/uapi/linux/types.h:14,
>                     from include/linux/types.h:6,
>                     from include/linux/kasan-checks.h:5,
>                     from include/asm-generic/rwonce.h:26,
>                     from ./arch/m68k/include/generated/asm/rwonce.h:1,
>                     from include/linux/compiler.h:246,
>                     from include/linux/err.h:5,
>                     from include/linux/kthread.h:5,
>                     from drivers/gpu/drm/v3d/v3d_sched.c:21:
>>> include/linux/stddef.h:8:14: warning: passing argument 4 of 'drm_sched_init' makes integer from pointer without a cast [-Wint-conversion]
>        8 | #define NULL ((void *)0)
>          |              ^~~~~~~~~~~
>          |              |
>          |              void *
>    drivers/gpu/drm/v3d/v3d_sched.c:391:76: note: in expansion of macro 'NULL'
>      391 |                              &v3d_bin_sched_ops, DRM_SCHED_PRIORITY_COUNT, NULL,
>          |                                                                            ^~~~
>    include/drm/gpu_scheduler.h:531:24: note: expected 'u32' {aka 'unsigned int'} but argument is of type 'void *'
>      531 |                    u32 num_rqs, uint32_t hw_submission, unsigned hang_limit,
>          |                    ~~~~^~~~~~~
>    drivers/gpu/drm/v3d/v3d_sched.c:399:53: warning: passing argument 3 of 'drm_sched_init' makes pointer from integer without a cast [-Wint-conversion]
>      399 |                              &v3d_render_sched_ops, DRM_SCHED_PRIORITY_COUNT,
>          |                                                     ^~~~~~~~~~~~~~~~~~~~~~~~
>          |                                                     |
>          |                                                     int
>    include/drm/gpu_scheduler.h:530:45: note: expected 'struct workqueue_struct *' but argument is of type 'int'
>      530 |                    struct workqueue_struct *submit_wq,
>          |                    ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~
>>> include/linux/stddef.h:8:14: warning: passing argument 4 of 'drm_sched_init' makes integer from pointer without a cast [-Wint-conversion]
>        8 | #define NULL ((void *)0)
>          |              ^~~~~~~~~~~
>          |              |
>          |              void *
>    drivers/gpu/drm/v3d/v3d_sched.c:400:30: note: in expansion of macro 'NULL'
>      400 |                              NULL, hw_jobs_limit, job_hang_limit,
>          |                              ^~~~
>    include/drm/gpu_scheduler.h:531:24: note: expected 'u32' {aka 'unsigned int'} but argument is of type 'void *'
>      531 |                    u32 num_rqs, uint32_t hw_submission, unsigned hang_limit,
>          |                    ~~~~^~~~~~~
>    drivers/gpu/drm/v3d/v3d_sched.c:407:50: warning: passing argument 3 of 'drm_sched_init' makes pointer from integer without a cast [-Wint-conversion]
>      407 |                              &v3d_tfu_sched_ops, DRM_SCHED_PRIORITY_COUNT, NULL,
>          |                                                  ^~~~~~~~~~~~~~~~~~~~~~~~
>          |                                                  |
>          |                                                  int
>    include/drm/gpu_scheduler.h:530:45: note: expected 'struct workqueue_struct *' but argument is of type 'int'
>      530 |                    struct workqueue_struct *submit_wq,
>          |                    ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~
>>> include/linux/stddef.h:8:14: warning: passing argument 4 of 'drm_sched_init' makes integer from pointer without a cast [-Wint-conversion]
>        8 | #define NULL ((void *)0)
>          |              ^~~~~~~~~~~
>          |              |
>          |              void *
>    drivers/gpu/drm/v3d/v3d_sched.c:407:76: note: in expansion of macro 'NULL'
>      407 |                              &v3d_tfu_sched_ops, DRM_SCHED_PRIORITY_COUNT, NULL,
>          |                                                                            ^~~~
>    include/drm/gpu_scheduler.h:531:24: note: expected 'u32' {aka 'unsigned int'} but argument is of type 'void *'
>      531 |                    u32 num_rqs, uint32_t hw_submission, unsigned hang_limit,
>          |                    ~~~~^~~~~~~
>    drivers/gpu/drm/v3d/v3d_sched.c:417:38: warning: passing argument 3 of 'drm_sched_init' makes pointer from integer without a cast [-Wint-conversion]
>      417 |                                      DRM_SCHED_PRIORITY_COUNT, NULL,
>          |                                      ^~~~~~~~~~~~~~~~~~~~~~~~
>          |                                      |
>          |                                      int
>    include/drm/gpu_scheduler.h:530:45: note: expected 'struct workqueue_struct *' but argument is of type 'int'
>      530 |                    struct workqueue_struct *submit_wq,
>          |                    ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~
>>> include/linux/stddef.h:8:14: warning: passing argument 4 of 'drm_sched_init' makes integer from pointer without a cast [-Wint-conversion]
>        8 | #define NULL ((void *)0)
>          |              ^~~~~~~~~~~
>          |              |
>          |              void *
>    drivers/gpu/drm/v3d/v3d_sched.c:417:64: note: in expansion of macro 'NULL'
>      417 |                                      DRM_SCHED_PRIORITY_COUNT, NULL,
>          |                                                                ^~~~
>    include/drm/gpu_scheduler.h:531:24: note: expected 'u32' {aka 'unsigned int'} but argument is of type 'void *'
>      531 |                    u32 num_rqs, uint32_t hw_submission, unsigned hang_limit,
>          |                    ~~~~^~~~~~~
>    drivers/gpu/drm/v3d/v3d_sched.c:426:38: warning: passing argument 3 of 'drm_sched_init' makes pointer from integer without a cast [-Wint-conversion]
>      426 |                                      DRM_SCHED_PRIORITY_COUNT, NULL,
>          |                                      ^~~~~~~~~~~~~~~~~~~~~~~~
>          |                                      |
>          |                                      int
>    include/drm/gpu_scheduler.h:530:45: note: expected 'struct workqueue_struct *' but argument is of type 'int'
>      530 |                    struct workqueue_struct *submit_wq,
>          |                    ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~
>>> include/linux/stddef.h:8:14: warning: passing argument 4 of 'drm_sched_init' makes integer from pointer without a cast [-Wint-conversion]
>        8 | #define NULL ((void *)0)
>          |              ^~~~~~~~~~~
>          |              |
>          |              void *
>    drivers/gpu/drm/v3d/v3d_sched.c:426:64: note: in expansion of macro 'NULL'
>      426 |                                      DRM_SCHED_PRIORITY_COUNT, NULL,
>          |                                                                ^~~~
>    include/drm/gpu_scheduler.h:531:24: note: expected 'u32' {aka 'unsigned int'} but argument is of type 'void *'
>      531 |                    u32 num_rqs, uint32_t hw_submission, unsigned hang_limit,
>          |                    ~~~~^~~~~~~
> 
> 
> vim +/drm_sched_init +138 drivers/gpu/drm/etnaviv/etnaviv_sched.c
> 
>    132	
>    133	int etnaviv_sched_init(struct etnaviv_gpu *gpu)
>    134	{
>    135		int ret;
>    136	
>    137		ret = drm_sched_init(&gpu->sched, &etnaviv_sched_ops,
>  > 138				     DRM_SCHED_PRIORITY_COUNT, NULL,
>    139				     etnaviv_hw_jobs_limit, etnaviv_job_hang_limit,
>    140				     msecs_to_jiffies(500), NULL, NULL,
>    141				     dev_name(gpu->dev), gpu->dev);
>    142		if (ret)
>    143			return ret;
>    144	
>    145		return 0;
>    146	}
>    147	
> 

-- 
Regards,
Luben


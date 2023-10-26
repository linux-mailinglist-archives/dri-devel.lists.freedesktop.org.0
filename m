Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA387D7FB8
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 11:40:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B0EE10E794;
	Thu, 26 Oct 2023 09:40:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2062a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e83::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3640810E793;
 Thu, 26 Oct 2023 09:40:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SCpH2v1LifCsnO3L3YD/e3MgYTXWmPg+bCIr19vxvEPYiiddGhLK8e5Xh72kmYklifTWPb4Lrr7uNhglA1JmUwOTs06n0gxQgsCW56mQi4znqLGqXUKPIGeGHlFgMIMfBud4sQw6H9GxwF8yqygsvvm2yrPCMIC/6FXSgTsJJu50dss+1c70udS/hQ/HJteKO5kKFUy2E5YkU9/IqS2FgBqBKgl8+Damwr+MUUrh26pQQvIzx10X92m69RUfgGaM5nxzIi7+gqhKfvrMIn+auf1hL9u2zrIDu1TGfmoyW9je+mVOk9OVC2eZTzznf6v7OiE1lv94Bw4njCNx+znGHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ffDRTMYYsctuAZbHQ5WdRjlH9ElinYmdyogmDgo0HQ=;
 b=dDZmaqpRP6L58pSfZ3WcxLJVezCDYwMy8TBuo9CPg5hQfbgNPj2H90RDMiS1j3jAmH/2+Nxp5zZaiJsTgSBgnkjf8QC1YI+/6tXqbrwthdgFAsYLfEQxe8nS8H5oyKBzq8ctOA1i+T76zorIZf2pPV1GBEj24UNldiw5IhjuBKSTkdz+s/MVxf7CHYbpaM+vE9ianPkHaf4OV4wxZ2NpFB0srWexpA8MHX8E+OzxdHNZSO2sXKrzlYqYktZwYU0yEcdcmXfVKM0QcItdl8sqM21Y6wRzVPKttk1pQcUjGB1W3KFqsSPJT9n1D1yqsv/c/oW7+mOtHYlJbDe0dtSmOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ffDRTMYYsctuAZbHQ5WdRjlH9ElinYmdyogmDgo0HQ=;
 b=OZeO8Mxtlh3ItTbYrbPFK/ahZZ0rTEKmykLf3a2gG4hJxSoOMGu+TzZGxG8wkntaEybkNJIOZtmLjsZ+nfIwqdL8Nannq2rKXkFkya9SjIXcxmus1Ipaen2KApGnSYA8dZEtPcnmFZJtokL7zI/O/iodtaoZV1Vj3j0TQUVpMCA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 MW4PR12MB7312.namprd12.prod.outlook.com (2603:10b6:303:21a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.31; Thu, 26 Oct
 2023 09:39:59 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b80b:7138:6ceb:9aef]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b80b:7138:6ceb:9aef%6]) with mapi id 15.20.6907.025; Thu, 26 Oct 2023
 09:39:59 +0000
Message-ID: <f97c9e75-0a9f-4960-90d7-7f5c2bc6d92e@amd.com>
Date: Thu, 26 Oct 2023 05:39:56 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.3.3
Subject: Re: [PATCH v7 3/6] drm/sched: Convert the GPU scheduler to variable
 number of run-queues
Content-Language: en-CA, en-US
From: Luben Tuikov <luben.tuikov@amd.com>
To: kernel test robot <lkp@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, ltuikov@yahoo.com
References: <20231026041236.1273694-4-matthew.brost@intel.com>
 <202310261439.3rbAtEoB-lkp@intel.com>
 <56160837-12df-4a02-8180-dbee6d6d5a0f@amd.com>
Autocrypt: addr=luben.tuikov@amd.com; keydata=
 xjMEY1i6jxYJKwYBBAHaRw8BAQdAhfD+Cc+P5t/fiF08Vw25EMLiwUuxULYRiDQAP6H50MTN
 I0x1YmVuIFR1aWtvdiA8bHViZW4udHVpa292QGFtZC5jb20+wpkEExYKAEEWIQQyyR05VSHw
 x45E/SoppxulNG8HhgUCY1i6jwIbAwUJCWYBgAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIX
 gAAKCRAppxulNG8Hhk53AP4k4UY5xfcje0c5OF1k22pNv8tErxtVpgKKZgvfetA4xwD+OoAh
 vesLIYumBDxP0BoLiLN84udxdT15HwPFUGiDmwDOOARjWLqPEgorBgEEAZdVAQUBAQdAzSxY
 a2EtvvIwd09NckBLSTarSLNDkUthmqPnwolwiDYDAQgHwn4EGBYKACYWIQQyyR05VSHwx45E
 /SoppxulNG8HhgUCY1i6jwIbDAUJCWYBgAAKCRAppxulNG8HhnBLAP4yjSGpK6PE1mapKhrq
 8bSl9reo+F6EqdhE8X2TTHPycAEAt8EkTEstSiaOpM66gneU7r+xxzOYULo1b1XjXayGvwM=
In-Reply-To: <56160837-12df-4a02-8180-dbee6d6d5a0f@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0084.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:84::21) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|MW4PR12MB7312:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bac1a19-bf2b-4a1e-e42c-08dbd6078532
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QYmL43HWRN1cnfW+Q1m5hy+iBb2yYJ4g02SwqAC7WC4ZRDC0xibR4tyCMDLij0sKOmdNC10NhsMQcpBx8m51SSK4mPQiB/1K4+SKaM7ihNnd0Kpwz3038I+ySMsE4C9a7NdxMK+frot9VErwt/aipKGkKQqhi0TOXUss4BhDsUGb1z57uG0SIylHB1FDtU8NFw7GyBkTF8qW8CKN6A1cUngF2RQ+XYl8PVAwe7c8u97R/UK1yyQYedlWva2TCSPifUl4Lz+cgFczeYOfKUu7yAob8aCzD2NOP9hg9EG1Rd8NzNNR8t9+1RfnHVs0O8E8UZwi92HOHeKQgTpzBph+B7ISNGNP9GRkk0317ldICR97WfwWnTnaiWxgPN+85C1qU99kffornj42ac7dFw+NUefTnAxnBokcm9ocMHDSZrpnvHKXEYE2qObtts1z02JQoO53MAASyCKqx5VmPK3hAIjtnFI+LUSlgSunDsQEHP2K3N+Z4dx2rk4jBuapYiiIdlxgvEC9NCQzTNK3bXmQtxDXLBzLLKRzOBx0j2dzubzrhMAn/Iufyc5CahVZI5Qhg101tCat4UZBsV+zAeq1tOSGv/qySkn6DTYyjIkVtEn+cu/2iNKB3DZrsahczSvS0lrlLfa2bzxj8QLnrbLwd68Uzxf/9AjN+vCIoSzO04k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(396003)(346002)(376002)(136003)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(30864003)(54906003)(2906002)(41300700001)(38100700002)(478600001)(66556008)(66946007)(6506007)(2616005)(316002)(110136005)(53546011)(6486002)(966005)(6512007)(66476007)(83380400001)(86362001)(4326008)(31696002)(7416002)(5660300002)(36756003)(6666004)(8676002)(44832011)(8936002)(26005)(31686004)(4001150100001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ODZ2bTdIaE1sS0Q1Z3pTWkxxMFJzdnlCc0s5NUxKUGx5ZmNROUlBVktzTU5T?=
 =?utf-8?B?aFdiUHE4NVEyZFdySkQrOWZvOXRmbnAzclQ1NG5yd0ZOb3ovd25oRWdJNXpj?=
 =?utf-8?B?aCsrY2xYUENFRDBQUVJqbi84UmxrNEFscjdtays2ZUJqYzUvdVg2dXZGeFhF?=
 =?utf-8?B?WHFPdGpyQWc3a1JxUWhxUzZncVpGdmlOY1d2cWVML2NXUTRBU2FscmRzL3Z1?=
 =?utf-8?B?bHRoTjkwL1Z1V0pSWWMvUVBYZTlpNm9RbWRVc0o5a2dFTEJ4cGhIRk1WNmEy?=
 =?utf-8?B?UW1qSENUNENyM2trREl1bnJpQ1R2dGNVQnhxeXFralNaUjFHa1ZTWGxHZnBa?=
 =?utf-8?B?WFJIZkgwZlFmRlpxa2kzRldLckdYRVZGblJDZ3YwRHFOV0gybGdiSXRhU1Jt?=
 =?utf-8?B?QUovckQ5ZHhUaGd5ZUdsSHV5N1NSTjNCL1MvU29JT1l6ZVRPTkFWUkNVNUZX?=
 =?utf-8?B?NUc1S01YbWFmajd5ZGFIVVVUVENQRFFpb3dWRlVRYi9wcVE4R3VvSE5oYlRB?=
 =?utf-8?B?cGYrczM3Q2txUG9qREY3L0hqU1pyRENXUGp1UXlOcll5eGRuVC9yakdEZWJp?=
 =?utf-8?B?OEhCQWE5NloyZjdYY2NoeEtyVnFCdHo4SXNRbmpRR3d3ZjhoaXV0Y0NPbUND?=
 =?utf-8?B?cHIrQ0RpVmFkNUkyQjhodDhxZzdIbnVheDVIblJQWFk0RFZBTklxeFhna2JB?=
 =?utf-8?B?YlhQc1VsOHBNTVVWN29jbk9qemNFaFlCYjd4UFUrM1lNbDJWWU40d2Ixc05V?=
 =?utf-8?B?Um40VGlFUzRkcUhBVjU5d0ZuekFKbTBzSEdxUzRMamU3VjcwbysrREpta0ZV?=
 =?utf-8?B?THliQUZzVElpYjJhcVEyUWNXMWk1a3FMMVY5dVpDa2xvSytJYUpyMDFxVnB3?=
 =?utf-8?B?aDBweEVqVHRNNW5OcDBCYWo5MXpEbXIzd2JRZnJMaysxbGx6aUVXMFZIWTNI?=
 =?utf-8?B?bUcxdjBkWXUyVExwRHJXdXptQmIvTkw1UjllQnU5dE1Oa2dnUlY2VkkzUUQr?=
 =?utf-8?B?Njl2WjEvRXNmaHdsbTFCTUVOMmVVWG1odE1nUU0wUVovQi80R2FYN2l3Uk9R?=
 =?utf-8?B?ZFRJaDFBRjlPYytDbWRMRDF2TjJhVVAzYzM4c09yeWkxelp2ZENzUkxaM2Ux?=
 =?utf-8?B?U1NRZUp2V1J3T3VWQk1FUHovMm5Wd1VlN05HRmJqNXNVQ2NqV25yZ0cveW5X?=
 =?utf-8?B?WVNweVhORVROeWlXaURDREVsaXRVTndsTURsTFNpdFZJYllLOGs3ZVI1SDJx?=
 =?utf-8?B?OGlBSjJvMEVnYTRMWkx6WnVRYjh4c2RmTmVySmF3QXlvdmFTUzBCRXJYMnJZ?=
 =?utf-8?B?VTBjV1dPMVZ6cWFFYXhlZ3ZHTkdzc2t3Q1RTT013QTdXa2lJdmtFUXAzV1RX?=
 =?utf-8?B?MjBVVlhFSG56TzJjTGI1RUx3Ukw5SVFwaWFBYVpNV1JSMFFTTE9SWXNaUWgy?=
 =?utf-8?B?Vytvb1luT3d3bjU3SDdoWjZKQnNjeElQSGZCVkJySHM0OWF6TEV5bUhDZGIv?=
 =?utf-8?B?czlLb0VaL3hCajFpUzNNVEpGREFCQTJaRmo0MTdFRmNITTd4eU9ib0hkRllG?=
 =?utf-8?B?MXBzRDV0bHgxS0E3TnpOWDRrVDZEemhvaStBMHJVVDN2WkJSb3NnekNUQnJL?=
 =?utf-8?B?NjBpNmNYclZqVFoyQlEyYkljSEFXTVhUQ1F2Vm5SdW5Yb2ZyMUhlYlV1WmZn?=
 =?utf-8?B?bWRSR2JtSXI2Z2NrcGFMWUZNSG1Tc1NZY1hoblliZmdFczR3S1FWZ01Pd080?=
 =?utf-8?B?KytBcVFtM3dMZmo0TDVQVWQ2MXZpSWR4ZmtEZDdnNUdTeCs0VUdpa1Q3U2Qz?=
 =?utf-8?B?anR2T203cjlQSUhyUlVRbGxqRW1TbVlWNE5pOW1CeW8rbm0rQW9LcHhzRXNm?=
 =?utf-8?B?ZmVNamR0QW54VTVpLzk5VmJaRlhwZVM5VnJJRFh1RlNScVJjSTUzYm5tUU1M?=
 =?utf-8?B?UDQ3elQxK25KZHVzTGwxNmtSdnRualJOZFlpYytNbmdTTU0yVktGSkI4N0dB?=
 =?utf-8?B?aWVXNkE0Y1h0VmllMmRDV2VHcUw4S1p6aytGRXBjSDBkRUgzWCtwL2JmZHNJ?=
 =?utf-8?B?RHZsK25RZW1LbElERGh0SkpNVU9aVDdvcmdwbmxJVlpwSkxNL1J3SXQySHpp?=
 =?utf-8?Q?qBuhDMUapRKNpevXBrx7UGmZB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bac1a19-bf2b-4a1e-e42c-08dbd6078532
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 09:39:59.2277 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Exnd0zZM17YdjuTfexOOiiUG8sH+iTXgP2F4MZF8nzuyPzQOJAzHGyV/iMQGIhZA
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

Also note that there were no complaints from "kernel test robot <lkp@intel.com>"
when I posted my patch (this patch), but there is now, which further shows
that there's unwarranted changes. Just follow the steps I outlined below,
and we should all be good.

Thanks!

Regards,
Luben

On 2023-10-26 05:36, Luben Tuikov wrote:
> Hi,
> 
> On 2023-10-26 02:33, kernel test robot wrote:
>> Hi Matthew,
>>
>> kernel test robot noticed the following build warnings:
>>
>> [auto build test WARNING on 201c8a7bd1f3f415920a2df4b8a8817e973f42fe]
>>
>> url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Brost/drm-sched-Add-drm_sched_wqueue_-helpers/20231026-121313
>> base:   201c8a7bd1f3f415920a2df4b8a8817e973f42fe
>> patch link:    https://lore.kernel.org/r/20231026041236.1273694-4-matthew.brost%40intel.com
>> patch subject: [PATCH v7 3/6] drm/sched: Convert the GPU scheduler to variable number of run-queues
>> config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231026/202310261439.3rbAtEoB-lkp@intel.com/config)
>> compiler: m68k-linux-gcc (GCC) 13.2.0
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231026/202310261439.3rbAtEoB-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202310261439.3rbAtEoB-lkp@intel.com/
>>
>> All warnings (new ones prefixed by >>):
>>
>>    drivers/gpu/drm/etnaviv/etnaviv_sched.c: In function 'etnaviv_sched_init':
>>>> drivers/gpu/drm/etnaviv/etnaviv_sched.c:138:30: warning: passing argument 3 of 'drm_sched_init' makes pointer from integer without a cast [-Wint-conversion]
>>      138 |                              DRM_SCHED_PRIORITY_COUNT, NULL,
>>          |                              ^~~~~~~~~~~~~~~~~~~~~~~~
>>          |                              |
>>          |                              int
>>    In file included from drivers/gpu/drm/etnaviv/etnaviv_drv.h:20,
>>                     from drivers/gpu/drm/etnaviv/etnaviv_sched.c:8:
>>    include/drm/gpu_scheduler.h:530:45: note: expected 'struct workqueue_struct *' but argument is of type 'int'
>>      530 |                    struct workqueue_struct *submit_wq,
>>          |                    ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~
>>    In file included from include/uapi/linux/posix_types.h:5,
>>                     from include/uapi/linux/types.h:14,
>>                     from include/linux/types.h:6,
>>                     from include/linux/kasan-checks.h:5,
>>                     from include/asm-generic/rwonce.h:26,
>>                     from ./arch/m68k/include/generated/asm/rwonce.h:1,
>>                     from include/linux/compiler.h:246,
>>                     from include/linux/build_bug.h:5,
>>                     from include/linux/init.h:5,
>>                     from include/linux/moduleparam.h:5,
>>                     from drivers/gpu/drm/etnaviv/etnaviv_sched.c:6:
> 
> The reason for this compilation failure is that this patch is completely mangled and nothing like the patch I posted.
> 
> My patch is: https://lore.kernel.org/all/20231023032251.164775-1-luben.tuikov@amd.com/
> 
> Save it raw to your disk from this link: https://lore.kernel.org/all/20231023032251.164775-1-luben.tuikov@amd.com/raw
> 
> And apply it with "git am <file-name>" on top of your clean tree, e.g. drm-misc-next. THEN, after that,
> apply your patches.
> 
> It should then compile without any problems.
> 
> Just looking at the first hunk in my patch:
> 
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> index 2b8356699f235d..251995a90bbe69 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> @@ -2280,6 +2280,7 @@ static int amdgpu_device_init_schedulers(struct amdgpu_device *adev)
>>                 }
>>  
>>                 r = drm_sched_init(&ring->sched, &amdgpu_sched_ops,
>> +                                  DRM_SCHED_PRIORITY_COUNT,
>>                                    ring->num_hw_submission, 0,
>>                                    timeout, adev->reset_domain->wq,
>>                                    ring->sched_score, ring->name,
> 
> While this looks like this in the version you posted of my patch:
> 
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> index b54c4d771104..94d073bfbd13 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> @@ -2280,6 +2280,7 @@ static int amdgpu_device_init_schedulers(struct amdgpu_device *adev)
>>  		}
>>  
>>  		r = drm_sched_init(&ring->sched, &amdgpu_sched_ops, NULL,
>> +				   DRM_SCHED_PRIORITY_COUNT,
>>  				   ring->num_hw_submission, 0,
>>  				   timeout, adev->reset_domain->wq,
>>  				   ring->sched_score, ring->name,
> 
> What's that "NULL" doing as the 3rd argument???
> 
> And the rest is similarly mangled as well.
> 
> Please apply my patch AS IS, no local changes, and then apply your patches on top. That should ensure compilation is correct for all,
> and a more precise review can be had.
> 
> FWIW, we should've had dynamic sched_rq from the outset as opposed to having to have my patch that now. So imagine that you already
> have a branch which has dynamic sched_rq, and then you apply your patches--should be a more straightforward and clean application.
> 
> Regards,
> Luben
> 
>>>> include/linux/stddef.h:8:14: warning: passing argument 4 of 'drm_sched_init' makes integer from pointer without a cast [-Wint-conversion]
>>        8 | #define NULL ((void *)0)
>>          |              ^~~~~~~~~~~
>>          |              |
>>          |              void *
>>    drivers/gpu/drm/etnaviv/etnaviv_sched.c:138:56: note: in expansion of macro 'NULL'
>>      138 |                              DRM_SCHED_PRIORITY_COUNT, NULL,
>>          |                                                        ^~~~
>>    include/drm/gpu_scheduler.h:531:24: note: expected 'u32' {aka 'unsigned int'} but argument is of type 'void *'
>>      531 |                    u32 num_rqs, uint32_t hw_submission, unsigned hang_limit,
>>          |                    ~~~~^~~~~~~
>> --
>>    drivers/gpu/drm/lima/lima_sched.c: In function 'lima_sched_pipe_init':
>>>> drivers/gpu/drm/lima/lima_sched.c:492:31: warning: passing argument 3 of 'drm_sched_init' makes pointer from integer without a cast [-Wint-conversion]
>>      492 |                               DRM_SCHED_PRIORITY_COUNT, NULL, 1,
>>          |                               ^~~~~~~~~~~~~~~~~~~~~~~~
>>          |                               |
>>          |                               int
>>    In file included from drivers/gpu/drm/lima/lima_sched.h:7,
>>                     from drivers/gpu/drm/lima/lima_device.h:12,
>>                     from drivers/gpu/drm/lima/lima_ctx.h:10,
>>                     from drivers/gpu/drm/lima/lima_drv.h:9,
>>                     from drivers/gpu/drm/lima/lima_sched.c:11:
>>    include/drm/gpu_scheduler.h:530:45: note: expected 'struct workqueue_struct *' but argument is of type 'int'
>>      530 |                    struct workqueue_struct *submit_wq,
>>          |                    ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~
>>    In file included from include/uapi/linux/posix_types.h:5,
>>                     from include/uapi/linux/types.h:14,
>>                     from include/linux/types.h:6,
>>                     from include/linux/io.h:9,
>>                     from include/linux/iosys-map.h:10,
>>                     from drivers/gpu/drm/lima/lima_sched.c:4:
>>>> include/linux/stddef.h:8:14: warning: passing argument 4 of 'drm_sched_init' makes integer from pointer without a cast [-Wint-conversion]
>>        8 | #define NULL ((void *)0)
>>          |              ^~~~~~~~~~~
>>          |              |
>>          |              void *
>>    drivers/gpu/drm/lima/lima_sched.c:492:57: note: in expansion of macro 'NULL'
>>      492 |                               DRM_SCHED_PRIORITY_COUNT, NULL, 1,
>>          |                                                         ^~~~
>>    include/drm/gpu_scheduler.h:531:24: note: expected 'u32' {aka 'unsigned int'} but argument is of type 'void *'
>>      531 |                    u32 num_rqs, uint32_t hw_submission, unsigned hang_limit,
>>          |                    ~~~~^~~~~~~
>> --
>>    drivers/gpu/drm/v3d/v3d_sched.c: In function 'v3d_sched_init':
>>>> drivers/gpu/drm/v3d/v3d_sched.c:391:50: warning: passing argument 3 of 'drm_sched_init' makes pointer from integer without a cast [-Wint-conversion]
>>      391 |                              &v3d_bin_sched_ops, DRM_SCHED_PRIORITY_COUNT, NULL,
>>          |                                                  ^~~~~~~~~~~~~~~~~~~~~~~~
>>          |                                                  |
>>          |                                                  int
>>    In file included from drivers/gpu/drm/v3d/v3d_drv.h:12,
>>                     from drivers/gpu/drm/v3d/v3d_sched.c:23:
>>    include/drm/gpu_scheduler.h:530:45: note: expected 'struct workqueue_struct *' but argument is of type 'int'
>>      530 |                    struct workqueue_struct *submit_wq,
>>          |                    ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~
>>    In file included from include/uapi/linux/posix_types.h:5,
>>                     from include/uapi/linux/types.h:14,
>>                     from include/linux/types.h:6,
>>                     from include/linux/kasan-checks.h:5,
>>                     from include/asm-generic/rwonce.h:26,
>>                     from ./arch/m68k/include/generated/asm/rwonce.h:1,
>>                     from include/linux/compiler.h:246,
>>                     from include/linux/err.h:5,
>>                     from include/linux/kthread.h:5,
>>                     from drivers/gpu/drm/v3d/v3d_sched.c:21:
>>>> include/linux/stddef.h:8:14: warning: passing argument 4 of 'drm_sched_init' makes integer from pointer without a cast [-Wint-conversion]
>>        8 | #define NULL ((void *)0)
>>          |              ^~~~~~~~~~~
>>          |              |
>>          |              void *
>>    drivers/gpu/drm/v3d/v3d_sched.c:391:76: note: in expansion of macro 'NULL'
>>      391 |                              &v3d_bin_sched_ops, DRM_SCHED_PRIORITY_COUNT, NULL,
>>          |                                                                            ^~~~
>>    include/drm/gpu_scheduler.h:531:24: note: expected 'u32' {aka 'unsigned int'} but argument is of type 'void *'
>>      531 |                    u32 num_rqs, uint32_t hw_submission, unsigned hang_limit,
>>          |                    ~~~~^~~~~~~
>>    drivers/gpu/drm/v3d/v3d_sched.c:399:53: warning: passing argument 3 of 'drm_sched_init' makes pointer from integer without a cast [-Wint-conversion]
>>      399 |                              &v3d_render_sched_ops, DRM_SCHED_PRIORITY_COUNT,
>>          |                                                     ^~~~~~~~~~~~~~~~~~~~~~~~
>>          |                                                     |
>>          |                                                     int
>>    include/drm/gpu_scheduler.h:530:45: note: expected 'struct workqueue_struct *' but argument is of type 'int'
>>      530 |                    struct workqueue_struct *submit_wq,
>>          |                    ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~
>>>> include/linux/stddef.h:8:14: warning: passing argument 4 of 'drm_sched_init' makes integer from pointer without a cast [-Wint-conversion]
>>        8 | #define NULL ((void *)0)
>>          |              ^~~~~~~~~~~
>>          |              |
>>          |              void *
>>    drivers/gpu/drm/v3d/v3d_sched.c:400:30: note: in expansion of macro 'NULL'
>>      400 |                              NULL, hw_jobs_limit, job_hang_limit,
>>          |                              ^~~~
>>    include/drm/gpu_scheduler.h:531:24: note: expected 'u32' {aka 'unsigned int'} but argument is of type 'void *'
>>      531 |                    u32 num_rqs, uint32_t hw_submission, unsigned hang_limit,
>>          |                    ~~~~^~~~~~~
>>    drivers/gpu/drm/v3d/v3d_sched.c:407:50: warning: passing argument 3 of 'drm_sched_init' makes pointer from integer without a cast [-Wint-conversion]
>>      407 |                              &v3d_tfu_sched_ops, DRM_SCHED_PRIORITY_COUNT, NULL,
>>          |                                                  ^~~~~~~~~~~~~~~~~~~~~~~~
>>          |                                                  |
>>          |                                                  int
>>    include/drm/gpu_scheduler.h:530:45: note: expected 'struct workqueue_struct *' but argument is of type 'int'
>>      530 |                    struct workqueue_struct *submit_wq,
>>          |                    ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~
>>>> include/linux/stddef.h:8:14: warning: passing argument 4 of 'drm_sched_init' makes integer from pointer without a cast [-Wint-conversion]
>>        8 | #define NULL ((void *)0)
>>          |              ^~~~~~~~~~~
>>          |              |
>>          |              void *
>>    drivers/gpu/drm/v3d/v3d_sched.c:407:76: note: in expansion of macro 'NULL'
>>      407 |                              &v3d_tfu_sched_ops, DRM_SCHED_PRIORITY_COUNT, NULL,
>>          |                                                                            ^~~~
>>    include/drm/gpu_scheduler.h:531:24: note: expected 'u32' {aka 'unsigned int'} but argument is of type 'void *'
>>      531 |                    u32 num_rqs, uint32_t hw_submission, unsigned hang_limit,
>>          |                    ~~~~^~~~~~~
>>    drivers/gpu/drm/v3d/v3d_sched.c:417:38: warning: passing argument 3 of 'drm_sched_init' makes pointer from integer without a cast [-Wint-conversion]
>>      417 |                                      DRM_SCHED_PRIORITY_COUNT, NULL,
>>          |                                      ^~~~~~~~~~~~~~~~~~~~~~~~
>>          |                                      |
>>          |                                      int
>>    include/drm/gpu_scheduler.h:530:45: note: expected 'struct workqueue_struct *' but argument is of type 'int'
>>      530 |                    struct workqueue_struct *submit_wq,
>>          |                    ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~
>>>> include/linux/stddef.h:8:14: warning: passing argument 4 of 'drm_sched_init' makes integer from pointer without a cast [-Wint-conversion]
>>        8 | #define NULL ((void *)0)
>>          |              ^~~~~~~~~~~
>>          |              |
>>          |              void *
>>    drivers/gpu/drm/v3d/v3d_sched.c:417:64: note: in expansion of macro 'NULL'
>>      417 |                                      DRM_SCHED_PRIORITY_COUNT, NULL,
>>          |                                                                ^~~~
>>    include/drm/gpu_scheduler.h:531:24: note: expected 'u32' {aka 'unsigned int'} but argument is of type 'void *'
>>      531 |                    u32 num_rqs, uint32_t hw_submission, unsigned hang_limit,
>>          |                    ~~~~^~~~~~~
>>    drivers/gpu/drm/v3d/v3d_sched.c:426:38: warning: passing argument 3 of 'drm_sched_init' makes pointer from integer without a cast [-Wint-conversion]
>>      426 |                                      DRM_SCHED_PRIORITY_COUNT, NULL,
>>          |                                      ^~~~~~~~~~~~~~~~~~~~~~~~
>>          |                                      |
>>          |                                      int
>>    include/drm/gpu_scheduler.h:530:45: note: expected 'struct workqueue_struct *' but argument is of type 'int'
>>      530 |                    struct workqueue_struct *submit_wq,
>>          |                    ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~
>>>> include/linux/stddef.h:8:14: warning: passing argument 4 of 'drm_sched_init' makes integer from pointer without a cast [-Wint-conversion]
>>        8 | #define NULL ((void *)0)
>>          |              ^~~~~~~~~~~
>>          |              |
>>          |              void *
>>    drivers/gpu/drm/v3d/v3d_sched.c:426:64: note: in expansion of macro 'NULL'
>>      426 |                                      DRM_SCHED_PRIORITY_COUNT, NULL,
>>          |                                                                ^~~~
>>    include/drm/gpu_scheduler.h:531:24: note: expected 'u32' {aka 'unsigned int'} but argument is of type 'void *'
>>      531 |                    u32 num_rqs, uint32_t hw_submission, unsigned hang_limit,
>>          |                    ~~~~^~~~~~~
>>
>>
>> vim +/drm_sched_init +138 drivers/gpu/drm/etnaviv/etnaviv_sched.c
>>
>>    132	
>>    133	int etnaviv_sched_init(struct etnaviv_gpu *gpu)
>>    134	{
>>    135		int ret;
>>    136	
>>    137		ret = drm_sched_init(&gpu->sched, &etnaviv_sched_ops,
>>  > 138				     DRM_SCHED_PRIORITY_COUNT, NULL,
>>    139				     etnaviv_hw_jobs_limit, etnaviv_job_hang_limit,
>>    140				     msecs_to_jiffies(500), NULL, NULL,
>>    141				     dev_name(gpu->dev), gpu->dev);
>>    142		if (ret)
>>    143			return ret;
>>    144	
>>    145		return 0;
>>    146	}
>>    147	
>>
> 

-- 
Regards,
Luben


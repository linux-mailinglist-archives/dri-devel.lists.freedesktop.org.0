Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A1F7B3BE8
	for <lists+dri-devel@lfdr.de>; Fri, 29 Sep 2023 23:23:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B64510E0F1;
	Fri, 29 Sep 2023 21:23:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::61b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 505AB10E0F1;
 Fri, 29 Sep 2023 21:23:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dn36K032VCiMrA/WUKBQE8aeCGcgebh12aetndxKmXvyXpyp8e9T3tROWcvhRvch+9dXe6Etug7Co+4LolWEk05R2Y3oXPCK61QmrzXMBARLGeIX5ei1PiNldZ0+t5kOnGGK/4PBU6iRtkLdkM53vHOXWjI+IZSvclJhS7klQhPM36JDbdQ3N2skqLBdwJGDec2ZdN6AP2Gy4avzs9TsqEj+OEVzelDjKp37HCwAx5XQwE+Yj/w57gonOrnKl3IFda3XimFBk2mqKHgyFK5NByKzSKWbyGkKKYZCfXifh1STrW1d6fkioqq1mpn76zrgfxJoOLfPkQEM0CT/GG1f0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z/sG7DDF+NqZPXgBpFIqsL01t3b3/sYhld5Pn7uRiE4=;
 b=EUNJUtZDLZyK0KKdf6xn5307jrS+5H48lV2i8zn5d/TREClClYBzu+Q3Pwcx0Rj2CxDuTFJDu25jMHrB1AAQB5rnNmsj3jYIb4c9ejs4NPlSGNBRiN+Op8p/tfzHRikcs0a0rg1SzKxYPB6ehgvnN7MpBor1mVJwNHuyojpZI5HWNvjrjsHMVKKB/Uqe74+YJ3jhZ4i2EVnRn2hzgLQ5u7vun0LOQ/3hd6YMOUZkyM4c7B5eAbe8CZ+2vlbS8EmjLqst00vg5BZkbRTauQMCFUboo6ruWVYBK9/w0E+Ia6EIsYOuF6ss+PEof7RoL862LPzLTP3Lp7inESX3Ix7D9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z/sG7DDF+NqZPXgBpFIqsL01t3b3/sYhld5Pn7uRiE4=;
 b=YGe4ByIFTcZyU/O8oNuDjI4mTn7kZIFRg+MthlSS/FAKz/uqtwN5k6P6Z0OYcLXA49HpTc4JSLwZyhQpaiP03tjB6UGFOrFAjsseAaE+Ige0v0groU58A+DklyavyT/9NsTSkSTWTxlFlfb4eVOFzrYLwXwP3YQrtzJVySd6AH0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 BL0PR12MB4961.namprd12.prod.outlook.com (2603:10b6:208:1c9::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Fri, 29 Sep
 2023 21:23:26 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8a67:3bbe:8309:4f87]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8a67:3bbe:8309:4f87%3]) with mapi id 15.20.6768.029; Fri, 29 Sep 2023
 21:23:26 +0000
Message-ID: <e8c7d8b9-f6fe-407b-9b61-e7ced8390997@amd.com>
Date: Fri, 29 Sep 2023 17:23:23 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.3.0
Subject: Re: [PATCH v4 06/10] drm/sched: Add drm_sched_start_timeout_unlocked
 helper
Content-Language: en-CA, en-US
To: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
References: <20230919050155.2647172-1-matthew.brost@intel.com>
 <20230919050155.2647172-7-matthew.brost@intel.com>
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
In-Reply-To: <20230919050155.2647172-7-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0059.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:2::31) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|BL0PR12MB4961:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ef067eb-0038-462b-268b-08dbc1325197
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bw/VszZ8NxVJTbtKcVgesnm1N/g84ijxd3zeRRqYlt+Xp/chd2mHxJMAk8YL3j04hCe6OdAEwwzzIC9KEuYMnZvAtaWOwdThtOTlsGhDDKDssKAZvKK7tfny5KKvlsdK92CR+PNvsQxqddhFxrMvflhEzSG4Th71+C7TyL7MInHy3TqGlQT4yjXcKStryLxW4rews+GzqBgyEc3kK+q74Mau837NdORTi9VN7hSii7cDjDfdE0Cd9TdbNUkA1mOHiK5vL+VlT5vRWcdSY9Y61UqqbYj0hihwv+wPXXw5lztlP6I97OOYiHC337u42NqBNBAwToyGkGRqpD9CsxzI7sx2oyQVmAHayjL9krieOiIYa3eZPZOER379WQx/ivmAkKXQWnyI1StV9MxMvdntHvbGSkX0kKL1rVrY5HfTpBJGDZOr48aWB7e2/i/1vTBtY2SYS8h28+8Tynu3yhQ6y/F97sPEsk/vt7+asSbwRC+tOmHw/y9BaNMTQRnCGfPHWqg+vHsa16pjckZKxQWshWKltlv+qU+icAO2XuErUrU/Ny1nmZe7hcVqg5CrkA+GwpB1kngSeS2bY6E8e0qd/XGMWPCgviXxb7F8DtEeMccZGgMT0AkBTPd1YIz9bqK7cxZOr+mIf/J8SRGB1z4s/A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(39860400002)(376002)(366004)(136003)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(66476007)(6506007)(6512007)(6666004)(2906002)(2616005)(53546011)(6486002)(478600001)(26005)(83380400001)(8676002)(44832011)(4326008)(5660300002)(8936002)(7416002)(316002)(41300700001)(66556008)(66946007)(38100700002)(31696002)(86362001)(36756003)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXJGWkVOQzY4WENwSVh4SDBONmVacnBuZ2pMQXM4WnFWcGNrakNmbEdRVWhD?=
 =?utf-8?B?MFRIMFdFWVprY2hpOWlsMENPYjVQMTFLcWxHZ1YraXVlc1NpSTBKcjdFTkRC?=
 =?utf-8?B?V0RKOG9OaldocFZVNVdOZm9LRDBXalhxZy9iVUJxN1JpNURZcVhXbTdxQmwy?=
 =?utf-8?B?OEZiZkw5NXFpTDh1MytwdjVxRVFSOWZKaGF3aFZSUzkzVFdPQTAwM0ZzdFVM?=
 =?utf-8?B?VzdycnRYSHRhT051ci9Zd1MzSWdndjVwNG93NmdZN096N3N6OUc5WTJqMGln?=
 =?utf-8?B?RmFGQUFFbE0yVGgyMW1XQm0xOXRXRklBZU40M1NrREdZaXhLWVptTWJnOHRp?=
 =?utf-8?B?ZXhianlKU3g1WnBXcU1NUWk1MHNUVW12Rm9PNTBPUVgvdm80cFJLYWhnSzQx?=
 =?utf-8?B?Sm4wckNBSHNweWFOdlhMZ2UxTFRPSGV5eWlOOVdqTG5qbEN2ZVRCeTloVTZF?=
 =?utf-8?B?TFFWRGkzSGtUek5UemtFcVFyQzhJZTg1WFp1YVBkVlBWMWhQMjNxdFgycGh5?=
 =?utf-8?B?d0MzVFRiZjRBUkVhcW5BUnprMWYyK21hSCszUjlDZnNMMkRKamF4SlQzKzY5?=
 =?utf-8?B?VVAvTHZwMVN6cDM3Vmc0ODkyWDBtaEFZN2xqUUdBNjUvR0cvd3lZRFZhT0FB?=
 =?utf-8?B?K3I3L2hVQU9hUmtzcURITzllaUJaeG1wLzFUZm1iZEg1a3FYeFdVbUlTT2RL?=
 =?utf-8?B?ck1TeVlvemNtN0RocjBGT2FqODVyNDBqMWFTQjhJVXhBamNid21qYlhSSFAz?=
 =?utf-8?B?YW1zSnYwNU1uaGl3VG1VcXRUdDdaaDZsQytKTTkwV2QzeGk2WmNUeHRQSXh0?=
 =?utf-8?B?NUlhME1peFVVNW13emozbWxabjZydm4vTlBQbC9OeGZBZTFyamgrMmczb2JC?=
 =?utf-8?B?SURrbTZtc2U0dFpjanpmSUJuTlcyVkpUR3A5Z1pKeDlnOUY2d2V3NThiN3Fx?=
 =?utf-8?B?WTk3WExvKysxTE9PZm1LREZmdUs5OW11c252TjdsL0xndXpNbjFFZlZ6ZG5Q?=
 =?utf-8?B?R2lVVE5qenBGQjRKRjkwYnpsVmdLYVAwbmpvdlB6NGIrZ21DM01oUm0yQ3NF?=
 =?utf-8?B?d2dnVEc1aHRaNElqVHg0WlRZUVJGYkw2MjdLRUtuYllEMHliUGZiNU5GY0cy?=
 =?utf-8?B?N2lDNS9ORURJN2I5V3UrTi9qODZGVFlzZlRVd20vTGN1SHdyczVvVmZUUkov?=
 =?utf-8?B?cGRaR2Qya1ZJb1Y3ZGFOaEJXYkREV3pUaU9TcEJNbmxFWGlvSzVCNXNKeGtU?=
 =?utf-8?B?VjRkTGJhT0tGTXM3TGgzUEd0dWhxODdGRzB3MXlpU2VUaDd3aXRHV3NtQUkr?=
 =?utf-8?B?TUkzSElNM1FnUnJJYVdha1ViZGdrNjBtVTVnMks0N3dUaDZpYnZQWFZ6RjNY?=
 =?utf-8?B?RGtnR0dGMHVxV0UvUUdHdlhCalc2KzR1bGlhOEQ3T3p5cUpUNGdwOWFhNkRu?=
 =?utf-8?B?c08rbkgyYXpwZjY1S010S2h4QTZxdkxLcUhqYVcrOEl1L2NYdEhpK0h4YUtQ?=
 =?utf-8?B?cG5NYXMxcXlsMkpOSGtaNHQwdWVsL1NFWUxSeW9SbkFtdnI2T1VyTzNtcE5l?=
 =?utf-8?B?U2dERXd2Rk5ZYmxPajA5NTA4UzMraTNsS1lMNkdtMkNkUUN5a0VCQUZEM0lO?=
 =?utf-8?B?YzNzZlFILzh2QnUyQTNVYjY5bjRUTDNPbkJKVkFzM0FablBvUEd3NkZ5S1lB?=
 =?utf-8?B?R0Y3eGdPNlZkSnBzc05aeGM5cGdHY2V2VG1Wb1pEQlFlY0dYMk5oYkNLMHgz?=
 =?utf-8?B?OEMxS0RzNlNpRm1BS3cycUtCdUNXZnVJZVEvNWlkWkNZRk9qeS9qNk1HMFZ1?=
 =?utf-8?B?RjZLVGJBNDRma1dGQ1RmZE9GUzFjUnQyd0pKUnhESFcrbzJUTm1PSjlwTWRN?=
 =?utf-8?B?TCtKK1QzWXNRQjRYZFF6a0FPZ0RKZU1TbVVRSzhqVW85Q1hvS1lKbGlPTHlT?=
 =?utf-8?B?UlE1b01uZ2k4eE42Q0dqdGR5RlFhZDcwaVlmOTU1Wk5NQi9NU3lHbFJoUjZV?=
 =?utf-8?B?TXF0ME5KWmpYNXRVV3VBQ1NhTVpaVUg5MGZOaWVKN1pWcWV3Q1NMRWRwMTk5?=
 =?utf-8?B?b2Nndmd6b0twTzhJSi9JZTB0aVlRbTJjWWJuMExCRzBDaDNIMUl2MXFHYkc4?=
 =?utf-8?Q?iBgs8hYT0GyxJlLxIT+PMAv6C?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ef067eb-0038-462b-268b-08dbc1325197
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2023 21:23:26.6462 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8E9Pt5++K6ot2Ym8/hF2lsmBzb6M8tiq9XtvKXzYwk16dQ2yO1e2lzH4yjFVOzEj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4961
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, Liviu.Dudau@arm.com,
 mcanal@igalia.com, boris.brezillon@collabora.com, dakr@redhat.com,
 donald.robson@imgtec.com, lina@asahilina.net, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2023-09-19 01:01, Matthew Brost wrote:
> Also add a lockdep assert to drm_sched_start_timeout.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Luben Tuikov <luben.tuikov@amd.com>

Thanks for this patch!

> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 23 +++++++++++++----------
>  1 file changed, 13 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 1e21d234fb5c..09ef07b9e9d5 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -431,11 +431,20 @@ static void drm_sched_job_done_cb(struct dma_fence *f, struct dma_fence_cb *cb)
>   */
>  static void drm_sched_start_timeout(struct drm_gpu_scheduler *sched)
>  {
> +	lockdep_assert_held(&sched->job_list_lock);
> +
>  	if (sched->timeout != MAX_SCHEDULE_TIMEOUT &&
>  	    !list_empty(&sched->pending_list))
>  		queue_delayed_work(sched->timeout_wq, &sched->work_tdr, sched->timeout);
>  }
>  
> +static void drm_sched_start_timeout_unlocked(struct drm_gpu_scheduler *sched)
> +{
> +	spin_lock(&sched->job_list_lock);
> +	drm_sched_start_timeout(sched);
> +	spin_unlock(&sched->job_list_lock);
> +}
> +
>  /**
>   * drm_sched_fault - immediately start timeout handler
>   *
> @@ -548,11 +557,8 @@ static void drm_sched_job_timedout(struct work_struct *work)
>  		spin_unlock(&sched->job_list_lock);
>  	}
>  
> -	if (status != DRM_GPU_SCHED_STAT_ENODEV) {
> -		spin_lock(&sched->job_list_lock);
> -		drm_sched_start_timeout(sched);
> -		spin_unlock(&sched->job_list_lock);
> -	}
> +	if (status != DRM_GPU_SCHED_STAT_ENODEV)
> +		drm_sched_start_timeout_unlocked(sched);
>  }
>  
>  /**
> @@ -678,11 +684,8 @@ void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
>  			drm_sched_job_done(s_job, -ECANCELED);
>  	}
>  
> -	if (full_recovery) {
> -		spin_lock(&sched->job_list_lock);
> -		drm_sched_start_timeout(sched);
> -		spin_unlock(&sched->job_list_lock);
> -	}
> +	if (full_recovery)
> +		drm_sched_start_timeout_unlocked(sched);
>  
>  	drm_sched_submit_start(sched);
>  }

-- 
Regards,
Luben


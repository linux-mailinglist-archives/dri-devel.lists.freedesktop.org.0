Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5154F7C925B
	for <lists+dri-devel@lfdr.de>; Sat, 14 Oct 2023 04:52:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA28B10E0AE;
	Sat, 14 Oct 2023 02:52:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2054.outbound.protection.outlook.com [40.107.92.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E1B610E008;
 Sat, 14 Oct 2023 02:52:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mwq5lr+5kDiFgg+GyK5NodPsZuGJkTrMR9IcZf/qLaVY+4nkkVP0rx5ryWLqhgH+b86aOLITJUlSGVKcpXLe62CxHeppg+NL8ZSy52omKnueOE0ZfupjVwIX/CSSDWB+sTxNbE4GCMowlzLvmuS2HmX8uxbT5/OFMqNgkLftKAYGyJclso4zlaVP9CCM1FiBTbv8ISDQ96mNWxTKxYA2AKyvxMbLeA+LA72TXhBNCqGkw6D5FELct8P0HacPtIIiJGu1IAxe/Zc4VRYXWLf4k6yM/QkQevxhyVKRLTzeXZaoJatRdK1VHLTIZuKY0FsOpCrfQl+gqUf70hfW0a+jMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gwIbAQtSkRz0mb+694XMuOnzIZNu3+Ybo38aSQ1VX/M=;
 b=mzeppOog/whW6DqUyCDPTniWyakkTaAfUXL0F8LZkEwEWH0xV5iuAs5MY7KaLJUH7yN1KwPCYtcgHK7FlmGw6xf1lYcZHO8Yi9mRnjo2QP+tGi3l00vXrUAD+0mrby7ju/7/WbUtzy8hnfEmyGowGBmRRCSz7NqbkyUN3PbWdEMNV18sMT9djBkeVQTnAETE3BD1CjnM71xvCVkK04qTMNB8nK3bt3DcXeSUteCIvWb0Q0pUDckvGZV5vs9WAV1uNrsVnSD99K/hwJbpMslnq+zuG6e8woigvD3oUlxUvtHbl4RSPKdJiT0UyPLkKs7pwN5tlue12tRAMOyCk5YFjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gwIbAQtSkRz0mb+694XMuOnzIZNu3+Ybo38aSQ1VX/M=;
 b=thiaWqLNwd8rFe+IvD25FRuSkPM7COkEWd7mZc7tkNHf7ENqWmP+yWlkdxdtMH2eUnGYFpm8E9HAKx2sNbjpEexzfBCPcVuzsCkH+XnmXv/+dhvhkd+6tWqypphY9ho6MzTqy/o+nhgjweEf9C2R1lWlhzT9uP8e36iMIJbxr/M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 IA1PR12MB7592.namprd12.prod.outlook.com (2603:10b6:208:428::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.45; Sat, 14 Oct 2023 02:52:26 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b80b:7138:6ceb:9aef]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b80b:7138:6ceb:9aef%5]) with mapi id 15.20.6863.047; Sat, 14 Oct 2023
 02:52:25 +0000
Message-ID: <89fe70c0-5fc1-4023-ba41-32ad130b72e4@amd.com>
Date: Fri, 13 Oct 2023 22:52:22 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.3.2
Subject: Re: [PATCH v5 6/7] drm/sched: Add drm_sched_start_timeout_unlocked
 helper
Content-Language: en-CA, en-US
To: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
References: <20231011235826.585624-1-matthew.brost@intel.com>
 <20231011235826.585624-7-matthew.brost@intel.com>
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
In-Reply-To: <20231011235826.585624-7-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0170.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:8b::9) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|IA1PR12MB7592:EE_
X-MS-Office365-Filtering-Correlation-Id: 35cc0a8e-89f5-4940-680f-08dbcc6098d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 69taKHh08BKINlPgjF8GifTYEhl75Goq+/1+I0SKXQ6u6HNXexJzvB+3b5sgGm2ags5XlNrHxB1L1O5KtoUPhGLRtvI1hcs+Q8H/diAfL4mLf58jPZWRO/W4wFWB371s8ELTdIHzZcr3UQes3opplP4Ve8kSIxmpq4EnZH3Jxgj38VPugC6vRiwOHEIBhLy8nduh7lEKoaV11D76HkkjaB+SCC+NCjOJLHxF4j3Ubwd4BqdXD6VO3vCCY6O6mkH3jIiaS4pfB2iJrJ7t8OCSdnj/Wl5KUzp2uyN1RXHxLbDH9mH0mylW2bNPcd4zphGLEGSixWmVYvcB+DmfSjqquvubtFRRuJno4NxyTdataPuIPQPEHVX8yO6ZEJkyNKK31krwUS9wDv2zTaqLte1lekxYd6n5sMk8Gjnbj7J1WChJ/1WYSc6Dk8lHGlVie7ax6inszJwBpy8ayq88Hv8GoIK165jzO/8S5vKxaMT4utOSgG/CixtIzCBbrPOaBrffYyOJE1jSPDMXKQXr29k2A0OswguR+9+h9Cb9bRKqao8iNPUQI7+mF87BF5KDj2lpljyaCXruBEJr0AqBIrUt09vt97aAjAki8Id997+/gQ2FPbvoMM9VWyrAJEIC6TwDF8W73u2FzkIOekSJ5Qf9iw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(396003)(346002)(376002)(366004)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(83380400001)(316002)(8936002)(38100700002)(8676002)(31696002)(86362001)(66556008)(36756003)(4326008)(66476007)(66946007)(2906002)(31686004)(44832011)(41300700001)(53546011)(6506007)(6666004)(7416002)(2616005)(4001150100001)(6512007)(6486002)(478600001)(26005)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SmFMZEt5ODhsS2hEVmlnVENPak5SYUJqVEo1M0djN3owQUpkZHpzZGJWSWdt?=
 =?utf-8?B?NUN5Vlh3UnNVSmlyaXlFMG1nWlJYcVRqOXpicHJnRitlYldMN2xjV3VnNjJt?=
 =?utf-8?B?bUk5ZElnUnYzZ2g0SS9yOFpWK1hiN2lxWGJwemFEZTJWNmJLeDBncDd3UjFs?=
 =?utf-8?B?TWRoR0t3NXBncnNBRUhJcFRlNWJRbHNFVHQ5WWxUb05qNnBQQ2JITW1UWU5S?=
 =?utf-8?B?OTdNRERGK3BXNmlyN2w2UHJ5WVRBZzZDREJRQnFhOVNUd0IrRG9xTjlRSE9L?=
 =?utf-8?B?OVJNRStZZTBFZHBETGVveUZwcmhSWXJJUUZ3N3ZUQVJ2RkdnOG5DRE9sV2Qz?=
 =?utf-8?B?b2pZVmloVVgrbG5LYWdOb1pEcDRvMi9wNzZLSlFudWFtVS8xdzMxQTMreC8z?=
 =?utf-8?B?KzVxcEkzR2twNC92b3ZkdHdtSTVDdVgyRFlLVCtURVZrRUp6WktRQ3I2OUY4?=
 =?utf-8?B?RHB1a20rd0ZYNUlmbGJHL2tXQXpOdERZMXRCaUtBTkRzak1sK3AxLzlMaEsx?=
 =?utf-8?B?NC9nVUo4dTdFZnBYNzNDcmZ3dGppeVZpQlJaTWswTWVWb3dXd3dxMmVIUVdv?=
 =?utf-8?B?V1lCNW1ObFQzWUEzYjhycDZaVTkxMUVyRWdpNlZja1UzaWRsQmEwb3QxdjZN?=
 =?utf-8?B?VlR3YkVWQTRnVkFoaE1FSWlwelNteHRlOU5xeUJCMUdRREx2UTdUbGxMSTgw?=
 =?utf-8?B?U25xQkRrU0pOdldJR1cvRnZFdisydUFNRkF4Q1F5RlV6ZjhXd205bm1EVFhm?=
 =?utf-8?B?ZzVxcDViMFZhOCtlLzdQVmQ3Q2RsWEQrYWIrWjF3MjBsM1FHUmtaWGpjcGta?=
 =?utf-8?B?UjB0Q3NrY3UrUXcwVEEvU0FDUGtKeWZWcGFCTjRnODRjSWU4OHd5SzQ0SmRp?=
 =?utf-8?B?bTVuOEwzOVlSL2tFcVpuZnRGbUtwTTMvRW9BZzNheVhqWU5jZzdwVVhmNTAv?=
 =?utf-8?B?SjNCQXVkbm9JaXlmdFNKQlpGWW1MTUZGa1p5SFhsVVpuS3ZFbTFOclRIMG1t?=
 =?utf-8?B?UkhyWU1hcHVQbXNVcmRCS004TDBJa3cyY1RlV3puWkF3MDgwM3orYzNQMzhF?=
 =?utf-8?B?dTRWdXNGUng4S2tuMkg0UFdOV2hqN1hDdXNZRUtLSU1KdFd2SW9VVmVpOUN4?=
 =?utf-8?B?amxSeTJBaUxsenMrNk9KVkIvc0k0ZEdHWGJHalRpaVcza0VNdFFmaXVMcldS?=
 =?utf-8?B?NjJOek92NUNKb093d1VOMHpqeFlQM1RJbXNmYjhlYy8xdTN5YjRFUHBicE1h?=
 =?utf-8?B?cmRHNGc2eXBMTnIxWm51NDBWVVpKV3ZSYVdQNDBBOVVKanJyMEErRElnamhC?=
 =?utf-8?B?Rm5UdHc3QVRRemFNQVAyd2lldTRBMkdMOUMrbzJ6R1dLczRkUXA5VlpNYWk1?=
 =?utf-8?B?RGcyakZPdmRBT29uQjQyR2xxcjhhQTdwczZlZU44S2FXM1ZjUklHS1JQdHNl?=
 =?utf-8?B?TUtzT0xyTXgxU3lJSlUyUGo0VDk0WG1IM3dIWWJwa0RjbjBhTDlMOXAyL0Qr?=
 =?utf-8?B?NEN5K2NHQ29xYm5HUDJNTkJzb3pLMkpxR1lMaE03ZzN4L29zQ2s2Tzd4Z0dn?=
 =?utf-8?B?aW9zeVcybUU2Vk9YSi9oaER1NFRZSURnZCt4Vi93WWpWemJ6dUlRWW5obmNs?=
 =?utf-8?B?Tmd1eEdOYWtKcEZ4aTdFT3RsS0VOc21OeHNhblppSDV2QWVPeGVnb1BMaFZ1?=
 =?utf-8?B?LzRpdWFWTWRvUWdpZ3o4NGVoYlhscGI0L1NKV3IxMzRqTlcxNlNPeUsza1E4?=
 =?utf-8?B?UlpFeXZ4VUNVWGhlKzNpWS9GRm03NS9pU0NFNldSejRUbnhuZlo0ZnJBUWMr?=
 =?utf-8?B?ckttYnBtNzY2LzR3d05xa3pKNmJHaHE1eXlvYWJmdm1ZSkRIeEREVkFueHQv?=
 =?utf-8?B?RG1GZG5vV24wckl2NmNuVEo3L2FtNVIyY0gxZ0MwTlpyR3haWk9oU2YyS3li?=
 =?utf-8?B?K0FYRnQ3T0kwSWNmdHA0WU9jVnVsSER3cDN1TU1zYllJS01FNVRFRGZHWnZy?=
 =?utf-8?B?enU0Y0E0UXZjTVB4REg0ZnN5NTB1enlabEJtUEFpdGtBWk5NNHRON0d5REo2?=
 =?utf-8?B?RVg4ZEJDZDBoaE1kemdRbUJWME5kY2M1SGFlMzJ4QmxOZlI3QVY1c2Q3bUFw?=
 =?utf-8?Q?YA8MPeWDglSyyYo5E0uvICSic?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35cc0a8e-89f5-4940-680f-08dbcc6098d3
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2023 02:52:25.7402 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1saThTjGzCziMr/yMkr46AQQE5ETuQvkpxepxvdnDuVbnQK0X/Mcf6cs0oOA2JrV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7592
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

On 2023-10-11 19:58, Matthew Brost wrote:
> Also add a lockdep assert to drm_sched_start_timeout.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Luben Tuikov <luben.tuikov@amd.com>

I don't remember sending a Reviewed-by email to this patch.

I'll add the R-V to the commit when I apply and push this patch,
after replying with a R-V email.

Regards,
Luben

> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 23 +++++++++++++----------
>  1 file changed, 13 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index cf4c23db7547..c4d5c3d265a8 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -427,11 +427,20 @@ static void drm_sched_job_done_cb(struct dma_fence *f, struct dma_fence_cb *cb)
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
> @@ -544,11 +553,8 @@ static void drm_sched_job_timedout(struct work_struct *work)
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
> @@ -674,11 +680,8 @@ void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
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
>  	drm_sched_wqueue_start(sched);
>  }


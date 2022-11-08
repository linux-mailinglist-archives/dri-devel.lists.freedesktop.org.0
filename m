Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2912D6219C6
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 17:50:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E05410E257;
	Tue,  8 Nov 2022 16:50:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2043.outbound.protection.outlook.com [40.107.96.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D7F810E257;
 Tue,  8 Nov 2022 16:50:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KGwKQOjDxIEMEAoLwb6tONF3vcJ48w360fFLz22M7re+ddx2WEqywJDlQoiURAoZjsX3p89E3BIhzfjVMAJOZnjGtdkyXLOlFwoOxD8zC0ulCOcfNTDWlfXHbveKkjeLmThXAsX0s7O7cLE6zU8Pzw344rvHb7rPl+dDYxPG6YKtSIeyl0LGcGYJPp9EHsDbbY7YyjAmlYLHa3MDF3n8r76zPscC8K+VzgxajbXzIqF73MKE/rQSDyOCb0RRsrHUq/mpMNvC92RZqV0NGAP/mHxSn/2umcQyqkjWt8O0cYgEawq/jzivu4Hrjc9uEwLA7M7rhtG8Kk/Oh4i5SwRQ/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JoZJEca0U4FOjbOpTZSH815qxrz1fL8B93IBdV5MJr4=;
 b=IZfwNVI83BS1aTYFeXhWS3UoywVk0hX5DbYidD61K9npcG6Kr7lRwR3bH/3Yqyx4RT9UUF3+Bp78EpRbzyuXaJJXexqg9fX4bASVn8Wy7qtFKzZPnjyOqSWcQoTodtyVLA9bKmiJFEu20NWYGSfeeAkP5GiX2qFoGxxykdswdsWPV3eXbeoAj7+78HqlRiJljY0cZrJ6j5ZkBeW+vF/9OTXn56nz5DVX7+krohZn686/fcwfEZCtEvccuW0kr7s2xf6yDCNCbS2lL0FGfAEHVuu9I+jbpMKmY7fhwB3FHGv+qqkL0LX2Tkdp4pdeXDDYF3KqernP+uVw5Mv57zTXGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JoZJEca0U4FOjbOpTZSH815qxrz1fL8B93IBdV5MJr4=;
 b=oY1xVc72RZd/BqDP+ZyWTB31U+NE5sLWN8SbZqiaCXpF2pc9l9syHTX1J0dR5ah6lk0sPoC9Smev3tnrXqdEGqHLJFUP0YBaDT46DqDMMghd0joxYHaZ1Ty+4/HYLg/5UCEOEETOjnQVpq8fO9H1ti9MNcLv6LfBoGULoYJCAkc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by CH2PR12MB4261.namprd12.prod.outlook.com (2603:10b6:610:a9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Tue, 8 Nov
 2022 16:50:06 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::5d8:f3f2:d940:5350]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::5d8:f3f2:d940:5350%3]) with mapi id 15.20.5791.026; Tue, 8 Nov 2022
 16:50:06 +0000
Message-ID: <6e237301-9c30-a463-0f28-5279e655646a@amd.com>
Date: Tue, 8 Nov 2022 11:50:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 1/2] drm/amdgpu: Move racy global PMU list into device
To: Brian Norris <briannorris@chromium.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Xinhui <Xinhui.Pan@amd.com>
References: <20221028224813.1466450-1-briannorris@chromium.org>
Content-Language: en-US
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <20221028224813.1466450-1-briannorris@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0PR04CA0080.namprd04.prod.outlook.com
 (2603:10b6:610:74::25) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|CH2PR12MB4261:EE_
X-MS-Office365-Filtering-Correlation-Id: cd6c4fb4-d2dc-4e09-e353-08dac1a94a26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H7bPqXlkzarIeCtJe4i30iY/Mum8BKXuaEYHryEwwViZphFRqkXlc3Mz8CvpZCckrfviDN0MjHhx9TPnP7JKHWTxJuNdPZNGTvAviaxoDvrXIcRK1c8fAo5A9+/oW/F8Kl+lAlYxRP3savLkMsIIZX9bXKl1ojrNMFoAgZPKcihwTR/b3ECsiu5lMNSliXwnQwbkzpMjvdQCy65Gjgyrg3Yra1FSGJTWn6RGZnssF5RMkxGAYVjIBf+etNJvjpNRjC9GPhtWg1BWM1Lf3qvhePOE4nYwkGD5DA/9Q4EJ5VDEqPq7G2r14zbKbfbq8ruq7/BacZY6ZKj7hE2cBH2Hgj9i/gFfCyhCDKHdP2JO0aWgNObzMF1vlfYGRytd4faTwGqesOEIOz94zpfHAIIvumsPiPyPD0zf8/YtvxO6x2DPy87QJSOuHftL7343/oNnn8yAMLi0ts0UeZh+BYR55hU7taN4Ftk1udsOfUecioECamKuI96cxwb5AgiWipjZAcN4uJLsl2MgpZVZCeKTvmUidG9kAYPSX3ExXiHTzHE7rrFCKO+4dnzCv2SYtKrsqqIWnddvH7yTaTKY/Nbg2gS2yuhu6lcJyX4uUTJUJqFPUbigRQEGAcDLUs3r7mH1JiF8htWvAazozxYzsXcHQDDbaGh95vn0rWqE6VcUVzs/dU/r0224HCKTcZp100fQOY22jXAhrqXhkFG5y0QSrBMitU4N0yohoP2VrYmqnwC6DIrdRAxT084dlmUoth5pY9z9oJV10VcpYsNTP+FCizDPfxwfGSssRxVyLp1oO4E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(346002)(136003)(39860400002)(376002)(396003)(451199015)(86362001)(31696002)(36756003)(4326008)(186003)(44832011)(5660300002)(4001150100001)(2906002)(2616005)(53546011)(6512007)(36916002)(83380400001)(26005)(6506007)(38100700002)(66476007)(66556008)(66946007)(316002)(31686004)(6486002)(41300700001)(478600001)(110136005)(8936002)(8676002)(6636002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXE3RkUwQkRhcDNsaWFpalFGSzdoY0lQS202b3MzdU9XaWxyZGxIYXVaY2Nw?=
 =?utf-8?B?a1dGaXVkWGIrT0YweVBkSFVJR1FNQlpBZElLaFVQck11Z0VYQjZSS1BZTGw1?=
 =?utf-8?B?RHpjdFJHUU90Zlc2SzhlTm52TWx1aVNOM1hSNFhpWTlyQTZSOXZOMXJpN2hl?=
 =?utf-8?B?N1VkU2FHRFhqWVRMb3RobmxFekl3Vk1GcGk1dmVITkloNU5CSE0xaU5iUGtQ?=
 =?utf-8?B?cG53eVhxSEhWY05HOXNGWUFIbjVxM1g4ZSs5WE1Fb0w3dk5TMkVQNGRweWJF?=
 =?utf-8?B?UldIczg1bkx0RHZyeEhEOGdxbE5ZSmR2NDZ4cWJyeFNrRy9lNFEzenJXWkhI?=
 =?utf-8?B?cjZ6b0k4ZTM4T3BTbWZwVVBIN1hlSGxVZXZRejR1N0RFSFRTRHlnM3BLL1Nl?=
 =?utf-8?B?aWRDTHlDa3lvSTFrVUZHMzRkOUpYdVA3Qi9xbE5XMUtpU29NQXZNVEs2UnhQ?=
 =?utf-8?B?S2pVRk1SRVNmMHJzUWRydGV0WGx3QmhCWG04SDVoSWJtY0dZaS9hcVFrREF0?=
 =?utf-8?B?cHV2alI4STcrWS8zMUJhSlZYQ2VraTVBQ0h5ckttaTJHRnlxcHczNGJYWkhw?=
 =?utf-8?B?OHNhUEN0eEoyVW1sQUNjZERDcm9EK2d6YWk3bGJ3WWlFaDhoWUJSWmVwbGIv?=
 =?utf-8?B?eTZ6bnNYcWhKb0dUemhhYzdUenNJd2xmeGlWZC9UcXVaYWNEc2tCWjZRWE1y?=
 =?utf-8?B?bzg0Rk0wY2RMMDdOUmNZZnh2ZmVRdG11cHVnOCt3SDJSNngzaUxzT3VUcEhR?=
 =?utf-8?B?aXc3ekp5QXVqdEpFQmJNQmJsaGhudkVRa3NPS3UzNEduamd4aUpTRkVQdS9t?=
 =?utf-8?B?Z0EzZjJxMWQ2MU9zWWs0ZTBNekRwemZWVXlrZTE5elBzV1EzYU9RV3M3dkJ1?=
 =?utf-8?B?WTJmbk43UU1oeU96aG84dlloZXRrU3NpTTZtV0FNK2liVm9wbktsd3VWRE1T?=
 =?utf-8?B?em1Pa3Q2VEtDRnhadkFkd1JjNURlNUZmaXM2OUxPZFJVVndmS1JZd2NDNys2?=
 =?utf-8?B?NkRVeVc1Y3lOclhZOW1adzdmSjBzYzE0Y3BiYXRLOGJmUWRoa3FWWUNYNVU3?=
 =?utf-8?B?R0tuSzcyMkJPNW1KZTk4M25ZZ2lJaDNTNElaK2lmMENnWkdCVzhOUHEvSkhY?=
 =?utf-8?B?S0loY3A5K0JXdkNndDNsMUV2S1BaZUdIcDhHbzhYMkhoMGtRTDVZUmxjMDZU?=
 =?utf-8?B?c04yRUVyVC9VaHpvQVN0R083elpHdmNSQTRTUDVkdVpBZTk4QTd2QllSM1pD?=
 =?utf-8?B?TjIrN2FTRjg4eFJ3YjJuZDBHUTRNdzladUZVMi9Dekl1QTBsdnRTR2pKdEtq?=
 =?utf-8?B?TnYrZ24xRjFIL2Y3YUxGd0wzUUp6WGpMVm00eEloSmFraDBvMGVaZHU5RjZY?=
 =?utf-8?B?bHZxbUJsTjNGMEgwRGR6Zk5Ua3FPaStQV1AyckZseSsyQkZtT3g5SEVaNGJX?=
 =?utf-8?B?TWZHdGt3MENPSDlNaXhpam5mRWFUUWthV1ArU3ZIOUI5U3ZSZWhxd20vNGg5?=
 =?utf-8?B?RGd4VzNvTGZaV0I5Y1JsYUxDVXVndWJXamQzL0FFNmlqU3RCSEhDS1dYbHZj?=
 =?utf-8?B?b2tLdTkvTGJkMk5TYmE3aHhUUnhua3FoZ1N4ZkErVnI2eEhUenlwQ2pueVhu?=
 =?utf-8?B?dW1YK3JtZ1VwQysrYTBEdlh2OCtNUDJyZTVEOHFSNVFYS25JU3NBSStsV2U4?=
 =?utf-8?B?WTRZazNSVTROT2tQL01aOE1OODdsVnVkRGM1a2Y4dkJxaUk3RkNjMERvQU9W?=
 =?utf-8?B?NHdGREJMbkhPRCs1MGh2UVNKcjhmaEE1bURYZG50ZmIwSGVpbVlTY0QzMlhI?=
 =?utf-8?B?VytKdTUzWnJVOFBvVDJJQktYbDdjdE9HODlFM0hsZjJnQzA3UkJDcUtRMFh2?=
 =?utf-8?B?aHpuUjc5Z0tJc1VRbFViZURzamlXOHY0d0dNaUQyblVRQjVxaURpU01kWGU5?=
 =?utf-8?B?MWM0ampyQkpCdzM2WXlyWHJxZUsyMEUwejlmazRoUmZFNnpXWk5pRUgxZmlH?=
 =?utf-8?B?Y1ZQMlNMNHlWNmtVOTljQ2V4V1NXa240bHNBWUl2cG1tZTdWQXpNd0tLTkJx?=
 =?utf-8?B?WWc2blpKbnpreUc2cHFWZVhXcVJXdnhzbUZhcGVQbXB5endIMysvMTBkcWtj?=
 =?utf-8?Q?P2ATXDEMaB4m8HVkMoplQmH2P?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd6c4fb4-d2dc-4e09-e353-08dac1a94a26
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 16:50:06.6073 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M18qU6Ml9yv3bKkKGTk3m6S3j8Q0LlkOZIa6GhbiLnqmtVRbluyrREjbvi3a0q190XMOFIRwRYD/nu96DNdXWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4261
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-10-28 18:48, Brian Norris wrote:
> If there are multiple amdgpu devices, this list processing can be racy.
>
> We're really treating this like a per-device list, so make that explicit
> and remove the global list.

I agree with the problem and the solution. See one comment inline.


>
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> ---
>
>   drivers/gpu/drm/amd/amdgpu/amdgpu.h     |  4 ++++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c | 12 +++++-------
>   2 files changed, 9 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index 0e6ddf05c23c..e968b7f2417c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -1063,6 +1063,10 @@ struct amdgpu_device {
>   	struct work_struct		reset_work;
>   
>   	bool                            job_hang;
> +
> +#if IS_ENABLED(CONFIG_PERF_EVENTS)
> +	struct list_head pmu_list;
> +#endif
>   };
>   
>   static inline struct amdgpu_device *drm_to_adev(struct drm_device *ddev)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c
> index 71ee361d0972..24f2055a2f23 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c
> @@ -23,6 +23,7 @@
>   
>   #include <linux/perf_event.h>
>   #include <linux/init.h>
> +#include <linux/list.h>
>   #include "amdgpu.h"
>   #include "amdgpu_pmu.h"
>   
> @@ -72,9 +73,6 @@ static ssize_t amdgpu_pmu_event_show(struct device *dev,
>   			amdgpu_pmu_attr->event_str, amdgpu_pmu_attr->type);
>   }
>   
> -static LIST_HEAD(amdgpu_pmu_list);
> -
> -
>   struct amdgpu_pmu_attr {
>   	const char *name;
>   	const char *config;
> @@ -558,7 +556,7 @@ static int init_pmu_entry_by_type_and_add(struct amdgpu_pmu_entry *pmu_entry,
>   		pr_info("Detected AMDGPU %d Perf Events.\n", total_num_events);
>   
>   
> -	list_add_tail(&pmu_entry->entry, &amdgpu_pmu_list);
> +	list_add_tail(&pmu_entry->entry, &pmu_entry->adev->pmu_list);

While you're making the pmu list per-device, I'd suggest removing adev 
from the pmu entry because it is now redundant. The device is implied by 
the list that the entry is on. Instead, add an adev parameter to 
init_pmu_entry_by_type_and_add. Or you could move the list_add_tail to 
amdgpu_pmu_init and remove "_and_add" from the function name.

Other than that, the patch looks good to me.

Regards,
   Felix


>   
>   	return 0;
>   err_register:
> @@ -579,9 +577,7 @@ void amdgpu_pmu_fini(struct amdgpu_device *adev)
>   {
>   	struct amdgpu_pmu_entry *pe, *temp;
>   
> -	list_for_each_entry_safe(pe, temp, &amdgpu_pmu_list, entry) {
> -		if (pe->adev != adev)
> -			continue;
> +	list_for_each_entry_safe(pe, temp, &adev->pmu_list, entry) {
>   		list_del(&pe->entry);
>   		perf_pmu_unregister(&pe->pmu);
>   		kfree(pe->pmu.attr_groups);
> @@ -623,6 +619,8 @@ int amdgpu_pmu_init(struct amdgpu_device *adev)
>   	int ret = 0;
>   	struct amdgpu_pmu_entry *pmu_entry, *pmu_entry_df;
>   
> +	INIT_LIST_HEAD(&adev->pmu_list);
> +
>   	switch (adev->asic_type) {
>   	case CHIP_VEGA20:
>   		pmu_entry_df = create_pmu_entry(adev, AMDGPU_PMU_PERF_TYPE_DF,

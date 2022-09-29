Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8785EFD22
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 20:37:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD8A410EC03;
	Thu, 29 Sep 2022 18:36:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2043.outbound.protection.outlook.com [40.107.102.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B52EC10EC01
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 18:36:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ndNOZARBMkD96rGl5WZf7zG+dOASBwQzfSFlyxn/YNwQRSIVGIL800h1MGHkwdPw7NP27T1Mnowfc1nDFwQ34/RlMBJoKo3+sXHGWaCHsKug7gS5+rnxa4M1hdXK63pTB8y0VrQPjVZMCC+EgGLWck2G57yq962JIKzdiGBkOp0P07q+8mpMl33V9lb7oSLAyk4tBMjrEeAzCCSmfMqa263tMYYwuKfpAoyggC22NhZGRgm6cOs5LaXcmWDd5xLyas+LKNv4zhRe2jUPUtqtClh9ZtDnIB0ShCw03yUy7XpnD26kma+V8recXCsF0RwY/LmlFKUzv/3NYxkupXKHVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IkunYOGHaGJz9N2qnNt6QW3lvGZe4t9JsDwSycDhLZA=;
 b=C+jbI+DutfV6mY8Tpm/3l5d/zbKk7q8h74JlXFMM5y5cJqqwjGQ0vEzm+3VmH4babXGj2Hh5wfhsFoBOQqG0p86QMBI5dJP2twkRWHVCMQwbjIsFop/c3h29TPwgG1v2JkcWg8Y8+y8dw4lhDAiLFiY5P6Gej0Vfuu98uJxwEGG6hmJik02hFsJYCv6gaN7c8CvvwA6iM5uv/FmCts3AvRHApJyu/qEel9r2tmWlw13MtatajrJO7a+c3ARFQVEXiyY8nJ7F90p9fVTRR3sID92TL+8W5Uy/EkTP2UttTd3mC1LmyRc9fbm04PQWDp946HZqX4Z1pkA2kmemQNG1Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IkunYOGHaGJz9N2qnNt6QW3lvGZe4t9JsDwSycDhLZA=;
 b=NQSFQriEYpn61E2qfIg5Su08Ww7C6Xt5+ETDp4iq8rN8u5Z+6uSREeQNALNqhLrLQhtTWfdXtR7Jwi79nO/oisGmeWK+GJGJz0jNzXeDNioF8P71Q+F3pCvFZs9GCBBK+jtKqqOrt9wpYeonRptYhTNi6DtVAB7Zv9zeG47x8rU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by SJ0PR12MB6942.namprd12.prod.outlook.com (2603:10b6:a03:449::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.20; Thu, 29 Sep
 2022 18:36:51 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::5c7:e934:c098:f2ac]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::5c7:e934:c098:f2ac%8]) with mapi id 15.20.5676.017; Thu, 29 Sep 2022
 18:36:51 +0000
Message-ID: <a7407ad6-5d1d-c4ba-0254-0d283dd869f7@amd.com>
Date: Thu, 29 Sep 2022 14:36:49 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/2] drm/scheduler: fix fence ref counting
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 steven.price@arm.com, Arunpravin.PaneerSelvam@amd.com, luben.tuikov@amd.com,
 dri-devel@lists.freedesktop.org
References: <20220929180151.139751-1-christian.koenig@amd.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
In-Reply-To: <20220929180151.139751-1-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0114.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:85::31) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR12MB1947:EE_|SJ0PR12MB6942:EE_
X-MS-Office365-Filtering-Correlation-Id: 51a56da9-48ce-4690-df04-08daa2499354
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lWA0LA0+o+iuaRaMlFnKz0qR/BxelWVZwUMBSCTzma8uCM35j87B8eji2IZIEElO6lVR+Ldwx4+Qi42/uBgGnkn+uKv0/Uis4HfYyMCPNrcAR5lq6I5EkUMZHN3/mOotWEskWPlOKd9rW2r22h4w+1Zx9XriuifIsXtpFDtE9NYOEEX1yHt8ACTiJ4qVKI1TIsctmm6kZfpxJKWsL4Mfun2RY/9kW6IcPNkO64BmdF4tWu+9aVzb83xd2+3+hlFGqwZ0FSyTbVQf2KK43ac1JUMhN6gIPi+PxQakdWrgT4PSTzb9K+qJxyP2sZT1Nd/T1Z5WOG70QDSv8E8nPPdBMsnrUGGssrHPgDc1ejkmaYOwcSgNGzu85fKkNdOKowIoND6yIv54i5mKiBu+dv1aQQR2moDEPtIiTRGi0siRk2gOIfSpOgSWeGuDwW1LMHMCyCxN5ShILpTuke9JRmivCSFnAx10tbgU46ButKtQnQKKXI3Emjpm06zltuLt53RKEMrvvuZbvTXwxtpJsgzR8iHJ2ddp7PuLuBrcYHXBSo3QsBaEgY1ItJ2XkXyLQU19xrR+IUNP9cytV6LrG4/K8OTSzOJVXkA1HNaQvSaLNi8aAf0wDEPYs0F3RKhuMOPNFnQtMi9kXxVTLwwjdRnxKf3ttb578wdctnhPcTNLJ1pwqCrV+X8g3bS0Rtj1Z6xWx0qtrhCPgxc1oiM18jN772AT/I2dYxhR/ZYtWB3FXgZScjA9DpHO2xIHAumzNTZY0lQ5BI2+4933TqM3LzoyeDqMh+FurrIdxPaUS+89Tb0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(366004)(396003)(136003)(39860400002)(451199015)(31696002)(86362001)(36756003)(38100700002)(4326008)(316002)(8676002)(66476007)(66946007)(2906002)(5660300002)(66556008)(8936002)(41300700001)(66574015)(44832011)(186003)(83380400001)(478600001)(53546011)(6506007)(2616005)(6512007)(6486002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OXBiMXdibHZNbzdXT1lCeWgrdjBUOXduSDh4enFpVXc2MWcvZmpzc1J3TW8r?=
 =?utf-8?B?ajRFaytOYlV4NE9tQUdXV3JvNkkzUzM3VVIxYXVVNzVmSWtCdDBCVlQ2Z3BH?=
 =?utf-8?B?Nk8zVnBDem1pTkxxTEUrell6bFZPZEl3Y3BwTXlSdVM2cVVKK2ZWR002UW9a?=
 =?utf-8?B?RlpUYjJ4K2prRTNPbkdoYkdQbXkzb1FRSEVLS3FwQ3FLNVdDSldPRERzTkYz?=
 =?utf-8?B?MW1lVHdRZGJ1NU5wbVl4dFpTTnVZanJLWDVtV0w0ck1nRVZ6eU5Ma3h0SFpQ?=
 =?utf-8?B?ZHR1R1pBVWpJYkZqbGl0NFExSTNJVDhXQVFrbXk3N3BDWXVJcXFZOGFybWdW?=
 =?utf-8?B?K0xwcDU1c2Nhb2RSRXo5YW1zUnNPTzZRU25OdE5uNTlmTkVNVkluMzFLOVNB?=
 =?utf-8?B?TFVRQUxUWW1hNjBucllUVFlWNjZqM0NHYTNJNFVkdnZyczJCM2x4SFJ3djJh?=
 =?utf-8?B?SWhSbThYWkRCOWVTYm83eHJiSkN1ZERxa1AyNmZ6N1ZDSWtweEl6bGR5N3Q0?=
 =?utf-8?B?eWtDN0ZuRHp0MndPelg0Y1JGUG50RmZTdHNnamR4OU11WVh0MkpQeTlSOG1T?=
 =?utf-8?B?WkZtd2xFVTNnOUd3RWdrL050aFdhSUJHWVlrYnVqRExOaUY1OGZHU3lNaGg1?=
 =?utf-8?B?ay9rakIrOXNkeDZlT1YwSEp2YzgvMHdUZnpFdk9XSFZqSW5QNitBaEJ5cDl4?=
 =?utf-8?B?R2VLeVlHL0xOZXJJRVEyQjFyTlp4Q3YxOE05U3FLRENDVk9aYjdBU1k3T1pj?=
 =?utf-8?B?NDUyanFOdjdlZThDUThxSmJMelIvVG1CNnlyV3htY0dCbk9ZTCtYUFhBYnN2?=
 =?utf-8?B?UFFaNTJ0YlJEQ0VxRy9wclVWL2hDbWpzeWZIemx5SFNHYmxKN0xMVU8zQ0x4?=
 =?utf-8?B?QkNIRDdrWlZ6cXd4SWxPMDhoVEh4dWplMjd5c2MvV2VCYm13SVA0NUljbTMr?=
 =?utf-8?B?MVVPbkF4SFdvZ3RwRVJnUkxKN3AvbmJJQXVFaUgyeFRjM0t3MGxyaGZFSGJv?=
 =?utf-8?B?K2ZQUWVCTFRBK1o0MDlzbVdGSVB3T3dWUE4wUm1NdEV4Ty9RcHZRN1lSVEFR?=
 =?utf-8?B?QlpLYUprNVE4VHVERnlFVDVPOWhzL2xBUXpGaVNsUFdBek40dy9Dd0N5NWVI?=
 =?utf-8?B?QVJEZHh0U2JXVjZKMXVvR0s2MjU1dWRuejRsbkFCbXR3czc5QStuRkM1Y09q?=
 =?utf-8?B?STlENEk3cVVWSXlxV1JsSUVkOEYxNGI2RlJHZ2h2amcveHpLSmJldUdDbWlK?=
 =?utf-8?B?dzZaaUtSRU0wS1BUZFRTYVV5eWxMNjFjTlBUdFd0TWE4R3d1Yk5FSTd3WFly?=
 =?utf-8?B?bnFDemgyUHg3Nk1qR0xKUHRERHJnT29EK3lEaEUvWkFhTnpEeEVqU2R0QXY5?=
 =?utf-8?B?dTFBdVQ5MEcyaGE0UUYzR29BZ0JGLzBFaWVpL0tqd2IrRjNXbVNMK0lrMEt3?=
 =?utf-8?B?VW93SUdKU3NJL2VINnV0RHQyRXQ3c3JwMlUwdDdMYkdtSlQyTGFmWWs1Y2Z5?=
 =?utf-8?B?NFBoUmlRZ1NWMTZXMGxBQTNTQ2xwWDlzYk0xOWh3TE01ZXZmR0ZPejFEbFg3?=
 =?utf-8?B?OFpaeEh2RkVNWjZvbFdKK2lGNFlZaStjd2JzdmVtektxZ2RGSXd3alBuMys1?=
 =?utf-8?B?N1lzczZNcFJVZ29wUEprMVlLWk5rMVEyVVFnYiszOEk1QXkyVElubDdhcDZ1?=
 =?utf-8?B?RzdMcUFOeWJZMExycjlMVXJLZEJJUUlaaXU4TXJXeTB5MXVON3VxS1NobEFR?=
 =?utf-8?B?MCttYmliaGhuYUY1VnF4NGNhYkRXR1VyT3hGS0hncWhDc3M5dUdJNzk2bVFD?=
 =?utf-8?B?bnpWM0pwVFY1ZHU2UGdLS1YxeW5MZlE3b1ZBSE1pamlMemtVZldzSFVXZTl3?=
 =?utf-8?B?akxrcmJlcUp4aVVNM2VhY2JnY2IxUVJDQ2lVdTZoMDh4NVRWMG5rZTVtbnpk?=
 =?utf-8?B?c3Y4THQ5cTI0b3VZQVpvS0VYWEJDWGVvWFZHRnVpNklPNjE4Z3h4VE9wZ1ow?=
 =?utf-8?B?eTByVHQ3UjVXdmhTcTlLdUNFTDFaUDd5NnZJdk95TEkxRkEvT0JkYUg2akkr?=
 =?utf-8?B?RXVLTCtRdEN4R0ZDTy8wWk80MkVKSnl2bUtrNHZoeWFLSDBzS3VvV09ka0VU?=
 =?utf-8?B?eUJwZDRhNVJJNnd5THl1aUhpRDNnQzJ3ZVE0NVM4eHVxSXNuTngwR0Nsemxh?=
 =?utf-8?Q?96N+jtho9idSl3mWC45cMsAEt9xU1nuNmamgQiZjJ+BA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51a56da9-48ce-4690-df04-08daa2499354
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 18:36:51.5721 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YFYs6FGW0oPuK08Eprdi59kdSX8YZosPRKfVzf+Tn6TR6sCAZurkQGTKuVeos8lbGkrgE6XLhoYqY53ciMIo+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6942
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
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Series is Reviewed-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>

Andrey

On 2022-09-29 14:01, Christian König wrote:
> We leaked dependency fences when processes were beeing killed.
>
> Additional to that grab a reference to the last scheduled fence.
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/scheduler/sched_entity.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index 6b25b2f4f5a3..7ef1a086a6fb 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -207,6 +207,7 @@ static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
>   	struct drm_sched_job *job = container_of(cb, struct drm_sched_job,
>   						 finish_cb);
>   
> +	dma_fence_put(f);
>   	INIT_WORK(&job->work, drm_sched_entity_kill_jobs_work);
>   	schedule_work(&job->work);
>   }
> @@ -234,8 +235,10 @@ static void drm_sched_entity_kill_jobs(struct drm_sched_entity *entity)
>   		struct drm_sched_fence *s_fence = job->s_fence;
>   
>   		/* Wait for all dependencies to avoid data corruptions */
> -		while ((f = drm_sched_job_dependency(job, entity)))
> +		while ((f = drm_sched_job_dependency(job, entity))) {
>   			dma_fence_wait(f, false);
> +			dma_fence_put(f);
> +		}
>   
>   		drm_sched_fence_scheduled(s_fence);
>   		dma_fence_set_error(&s_fence->finished, -ESRCH);
> @@ -250,6 +253,7 @@ static void drm_sched_entity_kill_jobs(struct drm_sched_entity *entity)
>   			continue;
>   		}
>   
> +		dma_fence_get(entity->last_scheduled);
>   		r = dma_fence_add_callback(entity->last_scheduled,
>   					   &job->finish_cb,
>   					   drm_sched_entity_kill_jobs_cb);

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6486038AB
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 05:38:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D61E10E28C;
	Wed, 19 Oct 2022 03:38:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2049.outbound.protection.outlook.com [40.107.101.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BE7510E28C;
 Wed, 19 Oct 2022 03:38:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jU6iQ2vx38oGh6euxh/VeqjHXD6dEgTjGGryQyPkxE8xrw9V1vySzfC3+JT3HGC3jpHnsFdE6FPhQ3lZjOU8vJ2gf1bRYBb/g+8nrB24J5sxdD9Uhw4qVmdY8A8yjnrt9ilVs4WrvycpPgZRoWt2GCtB6RpSZZCiRC3bFkOkX/gifz4IFTccOO0xrMfdMgFvPyq0g5ZM1LnweUMB7W8a2OhN5D7Kavaoc19eiZr5OKDoxGPW6BjXT3PbFUT3/aSirO7ZLXyY0o1l5OkLQaZlOQGc44ioglk708HCcUED6G2gnlm07KbnbSZpml6ZbN5uFFWfkMCH+PeMpd82OKhESg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q+s0TKZGInByxS5eLtq/x0LH71FkHiXezINEXv+eU0I=;
 b=PZGrUIyl27IIo3+/2LWJlBWnsFzksdYiR3DhCYvyCBvjgivQ5eFtAePfkzjbqLEmbOdxKeHz0PmCnbce6F269e5l1s2IE+ubY27oYK1JLYExq/vKSAJ92t/FcsZ54+TuxkVJE+TDyxjHavoUFiA0ZtfHBj+YmMsA5j3ZPof1PAQGaUMcDdBiVBrYezqwzeekmkvww3WrFaQ+V3jSB326kapocd5E7atjcJ/mQ+T/jUQX0NMVUM4vlI6q2ZqqwBLBsgeS+57BZWIjN4MNdz374jXaMIETUNyMt8XRrEbRnRb6Us8zfA1Hlutl3/MxSWjPTiPTsmRhGCzbCOI3ZFKSOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q+s0TKZGInByxS5eLtq/x0LH71FkHiXezINEXv+eU0I=;
 b=ev/2DOPw5dMjeDOZ8gwV4W2KxAw6wCfnlYez0Cd4KNl/11orc4BoZysEKWODCZh/kyr+nZcTX35zL3KbXVXK6oYvC9WK49WEK3MBSCEoqYymVrlSIci+vD3KwjroxrNvBJeTWX6OZlFM5kQupszbM0wu02vf5xMvSwFjlZst/zI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 CY5PR12MB6250.namprd12.prod.outlook.com (2603:10b6:930:22::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.33; Wed, 19 Oct 2022 03:38:01 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::d309:77d2:93d8:2425]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::d309:77d2:93d8:2425%7]) with mapi id 15.20.5723.033; Wed, 19 Oct 2022
 03:38:00 +0000
Message-ID: <a14b4921-2cc2-3812-5514-e6573388451c@amd.com>
Date: Tue, 18 Oct 2022 23:37:57 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH] drm/amdgpu/discovery: fix possible memory leak
Content-Language: en-CA
To: Yang Yingliang <yangyingliang@huawei.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20221018080557.765786-1-yangyingliang@huawei.com>
From: Luben Tuikov <luben.tuikov@amd.com>
In-Reply-To: <20221018080557.765786-1-yangyingliang@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0063.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:84::28) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|CY5PR12MB6250:EE_
X-MS-Office365-Filtering-Correlation-Id: f2cf51c6-fcd4-46fe-f76a-08dab1835235
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZJKQcU+kR8D+Wfrw+bj0d/ly6DhPTCBxcx5qG1sNiGD4Bw5siRbARzEYgTxihgn3UhlF1KP+ztPUiXfQXHlhcGnVVoh5MqGVlOprXkaeiUJ1r53ERJI9qXK2O4s53kZsYaIualall66MEBuD7tiVegW9gY7EqzWaosivjJsiUQXPcAJ3CYCBONd3dkzUnXa3+ZYEcbnN+CVMNK0blmrksouiLN0JJcjNVXnypvhYgKET5aJQPzWLfv9abWpRzn5EUv5jz4tVIvHOWQI89tepdyLQsgp2Pch7G70AxNVQ9V2Am24HdmYZ1Mw34RsANgkmEYuaPRJw++A/sN0g4HYQeCs8WSsMXzcCMR2SG3IVNT/3FYrs7pe1iau93oroisXF/xL+aV0+Bs+NJzGXXyDZmLB/tdFlWykrxNICADpVfQAkuH3TAf3Ir1fZGt69z5bsiSjYQX6GGqcTwWHlvaih02rkOgs5JtiVp81KqiTjYZ/8YqCLfx5yPWEHxLmcS8m0MyktM4RUClfV7ompWVMiDUXoPYhqditFBKc9hLDfk1yrfOUzumay9EiJ4AMMaqQ+l7uBVAnZBZcr/QcrO9/f8PF5o2AUyakZBaw3yfbXPP+Wr+GfflUbLNiYHYKxeM8ed4BcBMGmCd4GIMwfV1W8pFn3W10AhWcQqd8UsKNK6S97Ud6SI4TeihCMZcVTo2hMaTVdqkr8UZwMiTFUGy8FyauADJodmIsm9wos5ctpacqsiYCCHSRAwUSLiaGKbUq/GAYpoRxK3MQYtaahuyHAQUocrciSon1FyFWz0M7DjDY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(376002)(346002)(396003)(136003)(39860400002)(451199015)(478600001)(66556008)(6486002)(66476007)(8676002)(66946007)(4326008)(86362001)(316002)(31696002)(4001150100001)(8936002)(5660300002)(186003)(2616005)(6666004)(6506007)(2906002)(26005)(6512007)(41300700001)(83380400001)(44832011)(36756003)(53546011)(31686004)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVpGc2lvRitFenl5eDdxeTBNQVZSeHZEWjM2NUZ6NFBhYlFMbjR1N2NwTGpj?=
 =?utf-8?B?bkVyeEllZzhRUE9nclZSOW5ZTU9XRElaZGl3NzBXZkN1ZXQ5Nzg3b2RFbDYv?=
 =?utf-8?B?Rm0yODZ1bmRlbU1hOXc0MzR2VHJ1NDlGSStJcGx4RkcrVC9ZN0lBaHA1TTBH?=
 =?utf-8?B?K0c4QVMzQWQ1ZE9MQi9OT0VWbGo1bnJJbWFZc2NiNE5sNzkzUktxNnlzQVhI?=
 =?utf-8?B?UUsva0VDdlBYR3FzdXVLOVk5Ui9NRUxVWnZHemtqbHRlNGlsY2VOaDcxMm04?=
 =?utf-8?B?cktlTnhnYlJmV3VueFF3NFpDUjVEeTVoWjlkalpycnNwYWcwdlFNNlYvcFFE?=
 =?utf-8?B?cnQ1R09TNVF6akIwRkU4bGJzeGl4MHZQdHRsVUMvQ2hEZkFEdWUvWjRkTHVp?=
 =?utf-8?B?eW9JRE5VWmhpQ3lDWFpubjVYVGkxbUUzVGYxYXR5b1dxVEU2QXBoZ0dYdWd4?=
 =?utf-8?B?SDQ2RGc4VjAyaTdQSmpza2VtcytlOUNSdEwzRWNMVVZHa25wUU9HUlprN0Iz?=
 =?utf-8?B?MzZhUzBQd2wvam9TQzI1NWtwQTBSVk45a05VQml3MCtEZ0RxMWZVTHkybERI?=
 =?utf-8?B?akxTNnljNTNJQnUxcVJaK3dyZmh5Z3VybnpSLzRqMGVrVXNCNUNxSDh2TEtM?=
 =?utf-8?B?Q3ZVK3FSVjFSKzVNM1A5eTQ4NTRYeHp1UVNVMWxUY1hjSmJDSGw0VEZkcEZQ?=
 =?utf-8?B?MGtnaUhBZFhSK2VuWjljVWxnMi94MjU3YkRwZVRZczA3cDJHcmdrQ1NjQkRs?=
 =?utf-8?B?QXRlVzJCVktHWDV5bDQwaGlaazBaYkxVVTcraHdzaWxwZEFPekJLc0NMRVk5?=
 =?utf-8?B?Nmc0TjBqQlFTSXI4bGlXb1lVdGhRVDB6MHBybm1iYm40V0VENm9MYTg1T2dI?=
 =?utf-8?B?bzUrbExTTU9yWStGL0Vabjd5UEtpR0prZ2M1WmtJRWtzRk5XZ3l0eHRDNnVl?=
 =?utf-8?B?UzVRbWxFS0VQaFY1M1RVMEtnb3ovbzdzYTBtakdLeCt4ZS84WkUxL21Qa0My?=
 =?utf-8?B?MC9wWmVvVFdXSE4rRTA0MjVNd3Z1RUhtUlJUUlpjN2t6b3RMbStNY0dORDQ3?=
 =?utf-8?B?L0RMNGZsblZvRjdNVXd5QStJOHNady9FL04vTzFNWHdyV05FWGxPaWg1U2kx?=
 =?utf-8?B?dmRGM2tLOVpJbC9QQTlMUS9EWDhjbnFJV0RnR2dpSm9NTGpDVU1Kdm16OXlY?=
 =?utf-8?B?YjFzY2YzQ2tLN3dHbitIZ2lDT2FzWjRDeHI3a2JaZE1Jc0ZwTXJLUVp6akMr?=
 =?utf-8?B?M1B5citFci9OaFRCYWhLOUF5NngrbmMvV2lQRStwckxZaXVmT1Y1SENEbzJB?=
 =?utf-8?B?ZFBxTjhhZ3VuUmptWUNxYitjcWFrTVJZRnRPNFp1T1ZlM0JMSlI5UW1SS1Nh?=
 =?utf-8?B?Z1psREUrNUFJVGNIYk1oWHAxZjVqWVpWdVM1bG55MWwxRHNNQjVoL1VaclEw?=
 =?utf-8?B?V3UrVXcrT29kUFYrQzcxM2M3Q01KV1dwR29xVFJNL3JHcTAxL25oRXhNVnht?=
 =?utf-8?B?Y3RqcXlLaElYc2YwOEpwVk55aGo1T3NVL1dlRGNSOUdoSXRtdVRiSVhSZzZS?=
 =?utf-8?B?Q1ZJSVVmVFRhaDc4cmd0TlR1WFFaQloyd2FNYlNMb243c3FZWXErM29ORkNm?=
 =?utf-8?B?ZHQ4K20wdEtNYkRBR3VZdXM3dEwzK1lNdWRFa2FSM2xZR1dXTjY5VW1qblF5?=
 =?utf-8?B?Rng0VDJTU2ZNSnZHbFVBbUZwdUJkSEVzNjVuSUJlTGs2bHpiSm9RV09WRDhJ?=
 =?utf-8?B?TGtGSTlLZldJZnAwOHdFVGJFZFVVTmc0V2QvQW9IQ1BHQ3JndjREWUYvcVBw?=
 =?utf-8?B?VzhoenZDRDRvbDMvQ3JWWGFVSG92UUNkZ0R3d2FUSGJsb3E4QmljS09pMHNX?=
 =?utf-8?B?MzJ4V1pnZ3RUM1hSQkZFNUN0bm5XbExIWG5qQjZNNkNvSzY2c25SdTBXYko4?=
 =?utf-8?B?NVFFQWsxMG56Ny91enVlb0tEOENBRWtPV0dwVHlxQXhXRFQ5SXRQdDlwd1cy?=
 =?utf-8?B?dnRoZFdENk81S1NyamtQZm12SVhmWWhGazhaQ3F6QTVJZ2dMNDd1a1V5dWxp?=
 =?utf-8?B?aHRGbWhTa01RTTY1Zk5XQkJXMW1wdHlOTzhPTU9VMy91V1FBY0FCY2JJMUox?=
 =?utf-8?Q?peyJargHF8mK4p0ojs6hbACUW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2cf51c6-fcd4-46fe-f76a-08dab1835235
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 03:38:00.6009 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r8qn1PzuyxORyFu85Jec5nm9Ge64hO5ajxVQjAPOjjIkbtAXehMG2fn+l0pYdPjj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6250
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
Cc: alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-10-18 04:05, Yang Yingliang wrote:
> If kset_register() fails, the refcount of device is not 0, the name allocated
> in dev_set_name() is leaked. Fix this by calling kset_put(), so that it will
> be freed in callback function kobject_cleanup().
> 

Good catch, but looking at the code it seems that what is being
leaked is the memory pointed to by kset.kobj.name which is allocated
in kobject_set_name(&kset.kobj, ...), which is called right
before the call to kset_register().

Modify the description with this explanation and repost the patch and I'll R-B it then.
Something like:

> If kset_register() fails, the refcount of the device is not 0, and the name allocated
> in kobject_set_name(&kset.kobj, ...) is leaked. Fix this by calling kset_put(),
> so that kset.kobj.name is freed in the callback function kobject_cleanup().

Now, if there's a leak of dev_set_name(), then that would be something
else/another patch.

The rest below looks good.

Since this patch touches only files under drm/amd/amdgpu/ and for a highly AMD-specific
feature, you didn't need to spam the dri-dev ML--amdgfx ML should be plenty enough.

Regards,
Luben

> Fixes: a6c40b178092 ("drm/amdgpu: Show IP discovery in sysfs")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
> index 3993e6134914..638edcf70227 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
> @@ -863,7 +863,7 @@ static int amdgpu_discovery_sysfs_ips(struct amdgpu_device *adev,
>  				res = kset_register(&ip_hw_id->hw_id_kset);
>  				if (res) {
>  					DRM_ERROR("Couldn't register ip_hw_id kset");
> -					kfree(ip_hw_id);
> +					kset_put(&ip_hw_id->hw_id_kset);
>  					return res;
>  				}
>  				if (hw_id_names[ii]) {
> @@ -954,7 +954,7 @@ static int amdgpu_discovery_sysfs_recurse(struct amdgpu_device *adev)
>  		res = kset_register(&ip_die_entry->ip_kset);
>  		if (res) {
>  			DRM_ERROR("Couldn't register ip_die_entry kset");
> -			kfree(ip_die_entry);
> +			kset_put(&ip_die_entry->ip_kset);
>  			return res;
>  		}
>  
> @@ -989,6 +989,7 @@ static int amdgpu_discovery_sysfs_init(struct amdgpu_device *adev)
>  	res = kset_register(&adev->ip_top->die_kset);
>  	if (res) {
>  		DRM_ERROR("Couldn't register die_kset");
> +		kset_put(&adev->ip_top->die_kset);
>  		goto Err;
>  	}
>  

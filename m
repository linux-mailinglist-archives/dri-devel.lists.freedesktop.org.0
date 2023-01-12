Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39657667A27
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 17:01:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A91910E1B3;
	Thu, 12 Jan 2023 16:01:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2067.outbound.protection.outlook.com [40.107.100.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E72D10E1A1;
 Thu, 12 Jan 2023 16:01:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RGLJip6d7IWk+y03NfZm72rIg0NLkJ2O0IF/LeElNdu+GaGQEP37S61Rz/msZOGdXGSkBddml2pgyqir03vYzoGk+Fv0TeNlnH/PQeXq0UBmiW9/lMpaWn6c3p56hWmNiqdfsxPxrwNUmPucGMvS++Ixqc3yUlX8Gfv2LdoP8iB35wZJpNl8592BiK4Rxj2x03ZEp4z1WwfNgfeAda6ow1Rir/rWTTUOEuGsMQVrxsm8SDgu13hLG6PuLquuK/8IYopn963idRKZ3FACM5RTotxrpeuquDGv7msVFwLheL2Ze61Vakl1QNGQ90jY2V5Wp/UqXSB0nklf0ZyHDnUtXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ztiSKMgxa+T+eapAdVy6VYzZ/9aghF+4CFkV1QE9l9g=;
 b=L1b0/QCVoSe9AIa48dloepoSF08v6ZWFs8uD+PzAceS1Bo8SeWLTAQ6nbJ8fjo7sX/5un3P7ON+CGDJ0uK/EawD7mw67bWK0hlS4+KrbDrx7pMq6IXGLjxj2bnhBwWh/XfdorTBZS7faoqY+OSo7oTEWFIqhiBmSdqiitTkejNCaR9O3B6Qo2iR68ACr/1d0C8W8Ye6RY4u0JDd4YP/sMYKVzl9RmJvNndM3P9CHPnkDuA5FBY0lZLbJL73JfvNWJ6TT5ZK7FBaO5wxsFvUJwhX5036MmL796Ytt56kkwLCCAjncFsqoq3dB52mWZaqR5YlqLo+OXZsYvqRwoD8Tbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ztiSKMgxa+T+eapAdVy6VYzZ/9aghF+4CFkV1QE9l9g=;
 b=HMIqD0P+4ZQwEinGIJFH/pUhmSPOUFXj4vqTUMGRnmMQiWEWFHcHcjXkFBf+4MjOXGEaSihCCxbGXE1PcFSZVhD6Bu/M2EUdAuz/la3n0bYhUZxer1ETST+Vw4/gIMQXElu1g0JyH/C/8HxySOE5RFmipV+jh0H2bLsW6F/5kPM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB2941.namprd12.prod.outlook.com (2603:10b6:208:a9::12)
 by PH7PR12MB7425.namprd12.prod.outlook.com (2603:10b6:510:200::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Thu, 12 Jan
 2023 16:00:52 +0000
Received: from MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::756d:ff13:d7bd:d590]) by MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::756d:ff13:d7bd:d590%7]) with mapi id 15.20.5986.018; Thu, 12 Jan 2023
 16:00:52 +0000
Message-ID: <b93c319e-b1c9-7488-7f0e-d96a6f98ad79@amd.com>
Date: Thu, 12 Jan 2023 11:00:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] drm: amd: display: Fix memory leakage
To: Konstantin Meskhidze <konstantin.meskhidze@huawei.com>,
 harry.wentland@amd.com
References: <20221130025046.2667372-1-konstantin.meskhidze@huawei.com>
Content-Language: en-US
From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
In-Reply-To: <20221130025046.2667372-1-konstantin.meskhidze@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YTBP288CA0033.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::46) To MN2PR12MB2941.namprd12.prod.outlook.com
 (2603:10b6:208:a9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB2941:EE_|PH7PR12MB7425:EE_
X-MS-Office365-Filtering-Correlation-Id: e3e20839-87a7-4297-7837-08daf4b62e2f
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +lMUfdiq5ES6YDbSn/pIu38vb+KbGi49CGwobO2c4qF/j3ZGYSeJF0veBpn+rFtu2hmn5X0goPLJBJke6hh00OuhrkqQHle/rFMpmw6zhQal3r9O7HriA4gMK6SRYgg5Yg+20yD6zfwcG2VcOIOB4yuHMUJDVwJ6flwdZC+NG48ERmpdOgX7MJWbAcuvLK7fT4ODfUJFtWeSxO0Bnhrj1gE55EfeWaCaWXueczGWddCO9Mudsq9W0+9ryG9JJkOJRsGE1neGYb9aSw5JfQHG6Sbu+635n2LHUEzFspMgrS406qglSvZy1eIs6s26Jh8IwXdr+qoSD3vyXVXt83cUgp7W3mAly1ZWQiFRGR3jeiPebbRQvFqQpQPbyu1Z9dABKdkmgfT9sgITPrhgwQhrYakT0YlmX6/OcnlLdY2hFeYgxPmk/fz7gEEH67vPxJxMWIBTCCULJH3Z5G5emo4/ho48eGpn/eAqbWIL9kSEdQeRxuBBaT3hCQTGALFS9xRVKWV1T7e3H6XGe5Puuo8rgf0LuSTy+N5eKsOy5Hom4QvlbCfRzj3VL56DIj2OWXfAW253tJfLpBZvzqgIL8jweF608lCpj1Ubt04HP/um8FJ/LZQB62DKhDe4qm0t6vRkiWxB7cvBomYQobEoIEQCK0ntyAIlAMCGvSa9/T2lUMzsjpMy58NdG6+S+Sp0oKY744MaMywlggoNLuYBb8YV+O/dXrTl9X2pidNRDkao89A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB2941.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(366004)(39860400002)(346002)(136003)(376002)(451199015)(8936002)(5660300002)(41300700001)(38100700002)(36756003)(2906002)(31696002)(4744005)(86362001)(186003)(31686004)(6486002)(478600001)(26005)(6512007)(6506007)(8676002)(4326008)(66946007)(66556008)(316002)(53546011)(66476007)(2616005)(6636002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eXgxV0g5dDdNcER0dXJZcjRmQSt4MVZiTFIweUt1TXp5SXRaeDJlRW9hN1VM?=
 =?utf-8?B?VGlDbXdpWlVaZWpQYUFFWHhvUVJtelhseHJqY3R0UVJzT1lHWWEvaDM0SzB0?=
 =?utf-8?B?ZnBKaWZGVXIxQXNoTytld0VMcEVJYmMwNlRteUhPLy83WW9QTjJCcm1MUk1x?=
 =?utf-8?B?SCtCY2hEUDh2MkNhZVJnQ1R1WUVVVllSRC9KaHpzQXoyVm5aek96Tmh4UWds?=
 =?utf-8?B?WmJaQnRGSngySjNHL1I1S0tQbVp2WEhGdVVHVVM0Y2VXRmtlMGpRS0NPdkw2?=
 =?utf-8?B?eHJoZEJPUUVKaXlTN29OYmlwZ3lOZWtER2tSY01hdDhqV3ljNmxDTkUrN1R2?=
 =?utf-8?B?dnljZk14dmc1ekp3Sm9mZ0NLWEJacThjYTJDbHBBSFl5MkM3NmJtL0YwcHRt?=
 =?utf-8?B?MXRCcnBFNnorNUJTd1NNNVl2dmR2UGRWSk1hb3VZZTFBWWdaS0wrVkc5UUpM?=
 =?utf-8?B?UFkyZkxmdUplMUpSanl0ckVrMW1FcmF1aWZOU0xuRXJHUllKOXlXYzBqaG1E?=
 =?utf-8?B?aTdlc0dERTVqSEp4UENPWEUwQTc1YTc4UEFDUnlYUVpaWU1yVDlYeURKUjVJ?=
 =?utf-8?B?VkVEWVNZVyt6Vy9TZEcwSkpqMTRjSDEvZ3pldVBXQlovSGVuMkcwU3A2dzJk?=
 =?utf-8?B?NWpFclVxamxadWFJT1BGOWhDMEZaMk9jWGkzdXJVejV2OEVSbkdIK2ZTamMr?=
 =?utf-8?B?NFZHK2ZlZFFsMGNPSGlsZldkcysxa2kxdTAyTG9EZ3diVjU1TElCdU1KWEhr?=
 =?utf-8?B?Y3V6WUdPRHFvOUdmR2QvUldaL3I2a2lzL0JpUDFHV2NYVGIzb3BqcTNJQURx?=
 =?utf-8?B?RlhzbngwYWkyWW9YUHIwR0NrUGZOYnVnYWdPK1RXSFBzY0Z0RFMvY2NtTUxk?=
 =?utf-8?B?a0ljNFVCT0d1UC9hMEdRbW16cExwYllXKzVyMStqL3o4bm50YXVzZHVoQVNP?=
 =?utf-8?B?TjlzV0tFTkVRM3g4MFlLMEgwVXpuTDFQb3p0ZGk1YnJJaSt6QzhMSmpwZEVB?=
 =?utf-8?B?M013VjdmWk9OOWVmeksvZGsyMHJrQld6WFpqbGkwK1VDcm01Ym1JOWd0djNn?=
 =?utf-8?B?WWN6aWU4YXozaWN5Q0VmLzhCK0pWK05xT2tVQ3VSRGlybERQTlhqcG8yRUQr?=
 =?utf-8?B?N0NLajUvVHFqazUvSFlocG1tcWdPNmlOOS9jS1dURUozN3RhM0RQdEhWa1p1?=
 =?utf-8?B?L1o2ZVNaWWVYdjZxN09mdi9UOXVmQnYrSUxYT2trYzQ3Y0phc3U1NUtkc1hD?=
 =?utf-8?B?NitKMHM4ZG15Z04ybTF3RFNacmQ4RnIyTzNoVWlRUWhhZytVc3ZGeFVacWZB?=
 =?utf-8?B?empwWkJjQ2tkMDJ6aW9rNHY3aEt5S1ByQjlnS1lhb2t6WUtvSUZkSnF3NTRZ?=
 =?utf-8?B?WmE4c005WStHT3BMckdxd2N1L0trQ08vbm1MSnh5U0M5VnJCMTRRUVJQZm8w?=
 =?utf-8?B?alQ3elo4cEV2WXBRYlR5TXk1eHNmTlh1Z1BGWDBBU1NCbnYyU094MXd2Vm5S?=
 =?utf-8?B?Q2RCY3J6dnhyWVBteTFhNUt2QVdHZi9yU2dvdjBjeTVLOWljYmRTcnBVSTVj?=
 =?utf-8?B?Vkcvdlc5d3duakN3SDluNmVSdytxdVJ0OWlCR1BqTGh3Y3pXbkQxOWtkYTRH?=
 =?utf-8?B?K091QnlzOGh5TTFxbi9OZnB1M09sUEVlWlFFWU16ZUs0WjFvT09FQ3RGZkFn?=
 =?utf-8?B?bklQWmdLdEFLYXNCa1N5a0Z1aFQzcTduVHVhL3ZtOGt5YjRxYUl5dDFNMERP?=
 =?utf-8?B?cjBFTXZYUXZiREx5TjNLaGkzcGxyRStmcGQyMjRWdXYzcDc1N3JyZ2haL0Y3?=
 =?utf-8?B?MG1NQ04xZERFeW43UFhXdnRoMGtrZE5IMDdVRWR6U0ErQkNOcWNmY3pySEN2?=
 =?utf-8?B?TVFpczJ1ZnlrMmx6UUpmVVZsRXo4Z0NQU1F6Z1U1WjVvaXFaalgwb2xraGNV?=
 =?utf-8?B?dVJNTlZKa1dNRFIxYkl6bkhRcDQxZlVIb0g4dDRpRytMVzh3WXZXdThkWlJx?=
 =?utf-8?B?ZUhlNkF0Y0RqNy9xZXJ2bGxtV1BLWnZDNEtGV0RBRm5qbFg2RGorRlFlemZa?=
 =?utf-8?B?dmFNK0swMytZeXROTUVXekIybmpsMUpPaG5WWDd2VnljTFdCVHNjSHB2N0VX?=
 =?utf-8?Q?wmSRrN4S+nCNY80d/zXkTB8/R?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3e20839-87a7-4297-7837-08daf4b62e2f
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB2941.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 16:00:52.5715 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wMGsj4/+vBwPQeZha5hWFp0qyC7+xMJD7SQNINhov0NsPB761h6wz29FW418MbY/KV6Eb+LkTfZTfL9p7zIzzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7425
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
Cc: Dillon.Varone@amd.com, yusongping@huawei.com, sunpeng.li@amd.com,
 artem.kuzin@huawei.com, dri-devel@lists.freedesktop.org, Xinhui.Pan@amd.com,
 wenjing.liu@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, meenakshikumar.somasundaram@amd.com,
 alex.hung@amd.com, hukeping@huawei.com, Alvin.Lee2@amd.com,
 martin.leung@amd.com, alexander.deucher@amd.com, Jun.Lei@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/29/22 21:50, Konstantin Meskhidze wrote:
> This commit fixes memory leakage in dc_construct_ctx() function.
> 
> Signed-off-by: Konstantin Meskhidze <konstantin.meskhidze@huawei.com>
> ---
>   drivers/gpu/drm/amd/display/dc/core/dc.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
> index 997ab031f816..359e28d3567e 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
> @@ -878,6 +878,7 @@ static bool dc_construct_ctx(struct dc *dc,
>   
>   	dc_ctx->perf_trace = dc_perf_trace_create();
>   	if (!dc_ctx->perf_trace) {
> +		kfree(dc_ctx);
>   		ASSERT_CRITICAL(false);
>   		return false;
>   	}

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

And applied to amd-staging-drm-next.

Thanks
Siqueira

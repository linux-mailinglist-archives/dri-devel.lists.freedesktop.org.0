Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B28C26ED27A
	for <lists+dri-devel@lfdr.de>; Mon, 24 Apr 2023 18:30:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6629210E1BC;
	Mon, 24 Apr 2023 16:30:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2058.outbound.protection.outlook.com [40.107.101.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA6DB10E052;
 Mon, 24 Apr 2023 16:30:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bG1moTpbGFSE0C+R8lxnkYE5MbntjfK4hZhTL8sUAW7daeU4fD6hkkRueB+cGrKbUE+ujTSM9wsjN7shhnQGL/IYlxk1KsK+slJEcejKCnx3urJu+j9kDm5i1OACRE4bNAIYD1w9PW5RAguO0jn1amAfjynNC9JN/rl5emlArdHIPMcPRTy61gZnZyZmHn54K+m8Tp7Ks7cWEn4gt/YregruCuL3Fzjjz6yxkofnUXXlqnN++GItHeMD1hdYJjw6wV7KzqZFlm/tldUpG/vqwo55iPt8OPgI6csODzQN+tvCSOterWjVZ5nyMH/5glqtwJNtLoaGa5foHw4YnqrGyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LWWoMTJjFzvycKYu4bF4v39mniQ64a+5yTQoeYMd2uA=;
 b=iKCBhvGTnjbuL7PLRhC+rd5utJP/y+FUuJ6SjregVUApUBQ6oE0rPSsbjREa4xDbQuyN4R6/q/u2e2RkA95Hk+WmG0cBLAZzpvT0/6xgjw/0Y17RNjcZchdn/+NhP+hilhgjLO6qxrxQ3mEaIqY1iVy7Wp7F84IifkhUPrDi1NhbdlPxiMpZun2XJpoH19QdaEFq78O4NsI9ZNyl17gMXcjs2nEZMCGvZ/96p0gzG2yu7qeh9y+RxsS7tUJB9DI4H8rqPUCWj55/7mRFmWJi5ScbPJWk0PL8jPa2gV1qXYVyqDzlvZ9jWLRYMjJ91ASDnmuiLMZUDE1QeWsrWqCGuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LWWoMTJjFzvycKYu4bF4v39mniQ64a+5yTQoeYMd2uA=;
 b=IjkafUTwJqB1lwhtvwzeEU/ktCjflKkE39zg6nL2excxZL7Kw0JBoA1onviIcXCGTy1NrH47yT6LEu297xWsF5nB8gJ9rMYByRVl/AuNcthdGEobW7nXS0YIJhQ9ysXHpYuJdsxcGuGtKRnVXm3WpeflK5LD9O711akTcuDZvsk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 PH8PR12MB6795.namprd12.prod.outlook.com (2603:10b6:510:1c6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 16:30:14 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::fe53:2742:10f9:b8f1]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::fe53:2742:10f9:b8f1%9]) with mapi id 15.20.6319.022; Mon, 24 Apr 2023
 16:30:14 +0000
Message-ID: <d8f2fd5b-26ce-5b17-60f3-449b10e2b281@amd.com>
Date: Mon, 24 Apr 2023 12:31:38 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] drm/amd/display: return status of abm_feature_support
Content-Language: en-US
To: Tom Rix <trix@redhat.com>, harry.wentland@amd.com, sunpeng.li@amd.com,
 Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, Leon.Huang1@amd.com, wenjing.liu@amd.com,
 qingqing.zhuo@amd.com
References: <20230420132129.3888917-1-trix@redhat.com>
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <20230420132129.3888917-1-trix@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0042.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:86::27) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|PH8PR12MB6795:EE_
X-MS-Office365-Filtering-Correlation-Id: ea75b61d-a288-4b37-fc18-08db44e12e4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yOP7U4Ey2863A1GVW5ieRtjBed+6kA3gEPyl4pdXdK27ymhSAVjQ6iSzsnhhpxSs+g54raHS0LsUMMWZh8h6Zh7kOP3KnmznyWsOpdZpk4q36iPc29WKEvIdpsXlLnHqoIglLBlbgeVNMoWzVl4IU3FO3gE3cmKtpxuau3bYBEtmBSRW5oZ5azw/YwmYlRfSTOuvH3fcX8e6tVUWftsxf4EFGY+4UbAUhR7grcvGc/a+9n5e7YTucAeD2b6fPWF+UoGIKan8h2aX6Xbjjrl3CsI1oGhh5BTEulrirp3xJcmalWSRoWs45q5sgMotimoKrMQzYQn+VBLWENPySOoxRt6rJNh9fEMBl/hz4nEQU0yErf707s6GD3UYu3EOCFZu6bDwY3OOkTN1HmbMkV8XsWODdvj56AulctUKYPZbtskN1sJW9n3pkt7INYu0aED8Nh3XaTF81iQFiwX10Nkj8u+HNPB8w+8JOE2HKMCiwsdEBoA135SmKIl60ZDlleU7AKYgYDDPVFxJZEVU9sG3PWI0xLoaS4pVhhe9auOjKt8+esnn0CwQ2kzFakAHUMP+zaPf9dGNZ5VgEh/vuoz7gA/b+o804uSPOQD2F02uOMYtSdbsy/7Fk6TpK7wcaKdPUEmCM/StBku06Foecf/SNaRAlZIu40a04/a85S1nypQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(376002)(346002)(39860400002)(136003)(396003)(451199021)(478600001)(31696002)(6636002)(86362001)(36756003)(186003)(53546011)(6486002)(26005)(6506007)(6512007)(6666004)(4326008)(66476007)(66556008)(316002)(44832011)(83380400001)(66946007)(2906002)(38100700002)(921005)(41300700001)(8676002)(8936002)(31686004)(5660300002)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T2ZhazlvbGRYSEFhc0RyRzVvcUpOWXRKdVhVOHlsQ1UxTFJJRGJ1RTVDOWpP?=
 =?utf-8?B?ajZxeWdRY0dHVGRMUXRRSzlNUEZiRFg1bkVTa2lVeUFkM1Rza1ZENGczWXVi?=
 =?utf-8?B?b05mVkw0VVEwUEJ1THVEWElaaytrUzU2T21hQ0c1MnRCUUI4WWUxY3J1eXps?=
 =?utf-8?B?bytHL29GOHBsV3VhYXNUaWlOL29kVnhWZDR5eGpOcU91Ulg3ODNIR01pbk55?=
 =?utf-8?B?b1luYmlvUGI4NERyL084Q3dGdXY5aEtKZmMyVUU3dzZGR1dxYnRpODRVTzBL?=
 =?utf-8?B?S3Myd2ZRa2doRExubU1XdVNudkU2RnMxZ1BzWjVnZVJpb3RVTkY4OHFoUmI5?=
 =?utf-8?B?a1VFZkswWlZvWk9DNVlFUGpidXlJeFpLUFZFU2VXcUl2clpyZUZyNGZSMDBi?=
 =?utf-8?B?TUZyTVZQcEJOOVBSMGVOZ0oxM2k3b09oUTY2di85MWNLNGFXYzRFVEZxQW5p?=
 =?utf-8?B?VXZFekI1U3NHTGlQVzZFSEFhQWxuZmNIOWlGNCtiQjVjOEUwczh6bmxOalVs?=
 =?utf-8?B?R1VXaytjc1grSnhlMWhkU3N5N3RyL0xraDFZRVJGKzRCZklJLzZGSHJ3b0lp?=
 =?utf-8?B?c2QzYUhsY21OV0VPUFR2WGh0MER1Wlp4Zmk0Mi9lL3kvUFhTQmJabEg3enND?=
 =?utf-8?B?S3ozNUNicjI3aHplTTFrM2dLWlFmNnNoYnhDT2JUSUNJc29lOVRBNGF5S1d3?=
 =?utf-8?B?QVZHY1NlMm1xWFBoSzlqLzdRVzlhYXRzSG56QXkwV2c3aU8vczd4QmhacHBY?=
 =?utf-8?B?WW4ydlB2YWtKcWE1Y1dtbUhiQ1dmaDV0UGw3THFvZU9WOGYvdVpKYkdVaVNW?=
 =?utf-8?B?MTloaFBJOURwUFVZWHBKNnRpam1FbkhIa0hYR0tIc0NlN24xWHRFWDFoeXI1?=
 =?utf-8?B?QkxNUUwrcjZoQmVGUWJhckJNc1NXM0N4anJ1TnNLZTREN1NhYnlKN3NUSjJp?=
 =?utf-8?B?ZERLdmVUTVZJcTR3NkVOS1dZM3ducGprVFRRSVppL0RJVGF5M3Qva091UlRY?=
 =?utf-8?B?ZDNid3NLL3RGZXJpMFZ6ZHBBemNMaXBqZFhZVkwzZjE5QVRjeHphYVN2ZXFj?=
 =?utf-8?B?WHV2WTlqYlB2NlNkc3dvVXFXbE5rdnordXNCVUFCVEVLdldWSzVWRU5oeC9y?=
 =?utf-8?B?bU9vMzd0R2hEdFJUbmFsZnBhR3ZPWUhjMVhxR1pNSE1hMGRpMjFRVFd4SVpY?=
 =?utf-8?B?dmsvLzNVRVVIR1NpOE02b0M2Rzd3bFd0aEd6UkswbDJNRXp0dzVNRitYaG5G?=
 =?utf-8?B?eHZxSGVMUzdRN0Q1ZXpvZjhZTm1SdmxRNnY4c2lUM24zWDMva0h5YkhiMlEz?=
 =?utf-8?B?cG5kNTIvVW9KeDEyZ0w2VjhIMXlremxHQUZQWUZwVitZYmFwWGhtYmwrMGgr?=
 =?utf-8?B?SEJ3M0d0RG1WYUpwMzBNbFVJSHc1WTFHYmcyOTFyWDBnM2dQQndOU2djb2cw?=
 =?utf-8?B?cGVBYWdBVFFBRW1hSDlkVGhjN2liTVlScEIxbjFOUEZPK0Y4T2hDMEF6bmtl?=
 =?utf-8?B?UnlQSnZjd3E0UStEbzhLRU9BaXdzRzBEQTlNcDJNV0Rzcys3bEI2ZzFwVFNl?=
 =?utf-8?B?Rmh1bHQycmhSM09aVkNLalEzRUtrSGhTK0VGSWEvc3ZCclF5Wmc2M3ZKeUdx?=
 =?utf-8?B?R2wraDVGTllyQ0NnZTJUSWxHdFpuN0pBL0VqL3dhd1BFdWVYclBrM3hScjdC?=
 =?utf-8?B?MUljTkRkNW1UcFJkQm9aUnlJd2RZYjVoVERVRWZGKzhIOHVFTzljWk1BOWlB?=
 =?utf-8?B?UnIvREErUmd3VGNaR2hTUmNQSHhlWUhLVk1KcHI4OTFIRVg3bmI2Vm5mK0tJ?=
 =?utf-8?B?aVcvK1BScVphYlpQcko0N0dGa012V0pITmsyQ0xtOTc1OCtjS2phdUxScEc2?=
 =?utf-8?B?eG02VnEwUWlIdWRNdXg0bUI4elo3TndBT3FpYUN2S2xKT3FhZkZYZ0RJMDh0?=
 =?utf-8?B?UTNjOENTMEdXTmo4VzdMeTUyTURkd3VzY29kaklBVDlPdHc3Q0VrcElZclNJ?=
 =?utf-8?B?dWZMMktNcGcyN3pZUit2RUpuWThTZzZYTzc4M1VNZ0tzMXpIdnNoRXc5eEdB?=
 =?utf-8?B?em8zVEZuYkl1Uy9SVzVEMGFEMkJxOGM2eG5ta3pkMTVlK0dvVnFLd1VkYnJx?=
 =?utf-8?Q?kwS+FM3Gq8C0Y7nEY0eiZ3Fq2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea75b61d-a288-4b37-fc18-08db44e12e4f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 16:30:14.1229 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7d18Zj59d/oQHHwKKKSvfyjg5vhms5/KNv75ARlHPUQIcIdDYekgpPXKGHLuLtt9dlRU77QeKFA4/YhYeOxMiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6795
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 4/20/23 09:21, Tom Rix wrote:
> gcc with W=1 reports
> drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_abm.c:
>    In function ‘dmub_abm_set_event_ex’:
> drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_abm.c:138:22: error: variable
>    ‘feature_support’ set but not used [-Werror=unused-but-set-variable]
>    138 |         unsigned int feature_support;
>        |                      ^~~~~~~~~~~~~~~
> 
> This variable is not used so remove it.
> The status of amb_feature_support should have been returned, so
> set ret and return it.
> 
> Fixes: b8fe56375f78 ("drm/amd/display: Refactor ABM feature")
> Signed-off-by: Tom Rix <trix@redhat.com>

Since set_abm_event() is never used. I would prefer if it was dropped
entirely.

> ---
>   drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c b/drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c
> index a66f83a61402..8f285c3be4c6 100644
> --- a/drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c
> +++ b/drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c
> @@ -134,10 +134,9 @@ static bool dmub_abm_set_pipe_ex(struct abm *abm, uint32_t otg_inst, uint32_t op
>   static bool dmub_abm_set_event_ex(struct abm *abm, unsigned int full_screen, unsigned int video_mode,
>   		unsigned int hdr_mode, unsigned int panel_inst)
>   {
> -	bool ret = false;
> -	unsigned int feature_support;
> +	bool ret;
>   
> -	feature_support = abm_feature_support(abm, panel_inst);
> +	ret = abm_feature_support(abm, panel_inst);
>   
>   	return ret;
>   }
-- 
Hamza


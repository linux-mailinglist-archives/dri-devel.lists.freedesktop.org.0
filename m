Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2016F600FDF
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 15:06:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93A5C10E461;
	Mon, 17 Oct 2022 13:06:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061.outbound.protection.outlook.com [40.107.92.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABA6510E441;
 Mon, 17 Oct 2022 13:06:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S4Jr2Qi8ggEbcSS+p3z/a8e5BXPDUbR/2o6TeQsHBs50j9AKNeqbXxB71Cw5GgbV5LyL5zhhugqjPfHABSL/Z0CYrs7/Cutuo4G5ju1uIqOu5cpNIIAfLYgD4S0sXUAdz6RSCZ12U4KOJlfTd4qih6bPT+LA7X4ePV3DNYip0T6iL4qCLks8GwnS0RMS83vWlXyfaONK+f/f35Di38I29+M4NTVg8493GQo+c+lt84IF5pJDo+Oog7Z9MkhmMsZECYZP3br08rlIp7nfIEg0vdAuEn3NeZ3nd2okBLlcBmGWM3ZXNN8ncf0DxB8qN+cPRLziFKnOam1ptUK6YjkfjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6WQvRS5tMawQoAmXjk5s8z76judWUZaq970XQP+P9e0=;
 b=Sgl1FwUFtYvePHqv+D7UMyK7sc4GuPLqfSptwph8i2nQj83gkDYCKquPYy/I2Tj6+dVDtc3OI0jY6dfyvdOPQE8/uJp3Nbz/c6mUkBQvnpIierli975hGMS9R7SqYCYKVkaQEnWGCLPMFfbh5IW0RcAYwP/Nth0WT28ifU67xrMJt1B3xmxt6Ph0ChCbGMZ4qyvYWEx0Tu/XB6tOs/o14zvZuh5M7LAyKzTVxM5WKHgxb7isGg61slEMDQa+YLXCTLPJzjVJWOvupeLgc4dodIzBqW4oj7ctX0aWw23xXDHIgDIJgwv0SUCbBmzbDidBt+BfaXPyCFD5RtER/g8BKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6WQvRS5tMawQoAmXjk5s8z76judWUZaq970XQP+P9e0=;
 b=nnNoTC6MZ8jStQkaalMpyhwdlcSN8jnyLP14YM8Npvq+oJPF+Rj7MaEt4lEZI6u0jzsqDEse5SICPaj8MPcNZUMwiwPft73p/xIlhT6EfCUQVNscD1RFFysa889Z185Hhlz53WSE/OClXDBKxbaizfsd4JjL0FV4Rhldhe6ffdQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB2941.namprd12.prod.outlook.com (2603:10b6:208:a9::12)
 by CH0PR12MB5204.namprd12.prod.outlook.com (2603:10b6:610:bb::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.33; Mon, 17 Oct
 2022 13:06:01 +0000
Received: from MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::588f:c941:4f62:9d89]) by MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::588f:c941:4f62:9d89%3]) with mapi id 15.20.5723.026; Mon, 17 Oct 2022
 13:06:00 +0000
Message-ID: <ec75ba21-97e0-9479-8d87-46cc8032d44c@amd.com>
Date: Mon, 17 Oct 2022 09:06:38 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH] drm/amd/display: add a WARN() to irq service functions
Content-Language: en-US
To: Hamza Mahfooz <hamza.mahfooz@amd.com>
References: <20221014153129.68674-1-hamza.mahfooz@amd.com>
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
In-Reply-To: <20221014153129.68674-1-hamza.mahfooz@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR07CA0036.namprd07.prod.outlook.com
 (2603:10b6:610:20::49) To MN2PR12MB2941.namprd12.prod.outlook.com
 (2603:10b6:208:a9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB2941:EE_|CH0PR12MB5204:EE_
X-MS-Office365-Filtering-Correlation-Id: bbcc47e8-f251-4aa0-b97a-08dab0405649
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fNXQmkjSB47WGHRQ80tbsLNiB340goyCvkl29KCzDVX9hQfyFCrFTGQ2A+P9CxAMZnqGLY229CBE6eogb+cdADegQuDUe9G6/6cgeAFVIGWdjDNuwWCBrX0NWQHMfnRCeRE4cBloppy6QKSuQgz9QfhPGZWLvuv+lY5BAFBITwyvhR6IKsvyuDxW78bRCrcSmEfO+sq9VSc8+L5byhid6TXt+ezCG9eq0A7LU4oirKIFGJ9EkYrto0tgLmCF8ltC7nDfx+WZLli/FuPva5g3kdkvoDn9LdqKRdXxjI4BiG1Asdefc8ZdhPkarf5oPGyqpuJO3SkE3t9K79jBjpxBFCGIFaMpU5PX8gMF2Xn3HSAva15dPHfR7xak6fFwZkdOEBQt0tGsb2iVRyhC4/gbdQh8VIRyezN1eXqNx2zwBIQXh+fkKMZbAlvCKx0ldHliBJnQXkYX6WkC68J0a7YARCGy5UhxRFaDhl2jus5e7QAPk40wg/mpVVQPE06pj3S0AkAGvSnNiKA8v9RGnqv4umnQgATPN6l9ZankbG2EWro/Kx8wzYHoOqlq7RPv0r0W579q3tX0yBplUHa4aifCVggOSNAN6sL522dJx5b4PJ84g7DaW0INmYgyCY4gxRYF+jqn7MC2NQ25pG01IXFIGGDBkVfJGMwP85K+TeenrebL5gdGBG2aLu4rta9Jr4S61ez4M3jenmjPORrjvVkzuQSzbLpKswYjMnEVVCds7QgP0u4h1La9yccKCaOwyFpQ8PIy88LhjP7fvzcpu3HDS3VWtq8zdsH++hSz6voQ1VQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB2941.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(396003)(39860400002)(366004)(376002)(136003)(451199015)(31686004)(6506007)(2906002)(36756003)(6862004)(8936002)(5660300002)(31696002)(86362001)(53546011)(6666004)(6512007)(186003)(41300700001)(2616005)(478600001)(4326008)(8676002)(6486002)(66946007)(83380400001)(66476007)(66556008)(38100700002)(6636002)(37006003)(54906003)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eHBMZzRmVHRiaE5SNlE0YUhrdWRrSFNEcUxzbVk5bVdSRHNEbWpOYUd3Y0Ra?=
 =?utf-8?B?cnZKMTZDM2dTSE14VEhLcUV0czNSSndqako5WXY4SEdBZEZPZDQ4azdwcWJO?=
 =?utf-8?B?UjlGUGZWSGRIenY3aUtGcnJtK2tqb1I0NjhQenFFY3RmZUcvV1g2YXBpZmFY?=
 =?utf-8?B?MkZ3STFMQ2xuRHlzdzJCS2dvMU4ybFVrQXVkV090Ris2VWRVYUN1UzRUWU04?=
 =?utf-8?B?VHdqSitjK1BUM0xNUVpDQ2NmZThMK2NZM0E3emxuQ3l3M1laWGFnOEthZy9v?=
 =?utf-8?B?S2ptU0g1aFl6U3NzbDJDb2tjNFdlY1FpSnJJK2NNTWJRa0RmaDd1SzVWZ3NO?=
 =?utf-8?B?aVIrWUN3bHhlV2szd3FYMG53QVMvOG1YVFhrRU95NmMwSkpjbTZZWjcvUlNP?=
 =?utf-8?B?WXcxUTNNeHgwcVh3cWZLSGYxK2UzMmR1MVRLR2pEVnBPU3VsME5NWTR2dEs5?=
 =?utf-8?B?S0RZQ3Z0NGc5ajdHR0Ywd2gzeW45L2xreXJ4Rk9CaWx1TG5maXJyVG5NRDEr?=
 =?utf-8?B?QUROcEtrVWRGdXR0eUhWYU5IclF5NlloMldON0pXWS9KekNvLzBhU0pUa082?=
 =?utf-8?B?SW1VcjRqWnZBMTR0TDZidFM5MGFBTlFrSTRpd1FidVpTdDZxRytFNFpVK25R?=
 =?utf-8?B?ZGVPWEdqM083b1lPZFVFVXV6d2VteVZBamtxVEZqaHFITHc1aHphcnAvaElM?=
 =?utf-8?B?OHVBYnpyM0JzdWpKRFVWbmZQTmU1N3NCc2ZDdU1xQ01aTUEwa1FnYmUzZHR0?=
 =?utf-8?B?eWVsR21nd2c0M1dnd0xXbG9IVExGYWI0SHFyWU1vSEl3Ym5iNEt6TzBPc3BH?=
 =?utf-8?B?VFpoSGRyMWxScHRKQW5LT2J5VXVTU2VuTXh1Wm1laC9ENGtCZkcxMWVoL2FX?=
 =?utf-8?B?QzJOaE8xUGNVRWQyOVJQZlV4NE9VMWtnaS83T2JPeG5IdVpJQ2FOSXpta2dv?=
 =?utf-8?B?a0gxYUFJTGxjODZ3dXh2bndHWW94MnNkYlJVQjZSd3pJZE5NNmxuRTJ1dCtn?=
 =?utf-8?B?N1N4WVZDR3FWR3hpeGExaVNlSC9LNFYvSk4xd0RFSVhUeWFVd0JIN2NSc3Zk?=
 =?utf-8?B?NTZkM3JxSGcyLzMrcVVkeXpFZ1dFWXd2REY4QSt5RnRjUFZoMlltS2V5OVMw?=
 =?utf-8?B?R2phNXFDOTVRcUlPRGFSenU4bXJVNUlCdEs1WTRSYWVxdFB4QVJRaWZha3NG?=
 =?utf-8?B?algvRWU4UTNNME42c2JGVjZtSmR0SHRzOGxob2ZqS2lyTmlBN2R0VldDdngv?=
 =?utf-8?B?SE9maXRFU2N5b2lZaEdNaUdxbWtMYVNLWDdnZGx0NGhYTkRyaEpyT21aY2Z3?=
 =?utf-8?B?QnpIYkpoYmJLNitoTmlqdEN2dG5wNUpHSDhqTVdFdkJkKzQxemVxWE1sNzU4?=
 =?utf-8?B?Wlo2V0pVaUIxcDA4K0U4d2J4MXZwaFFGeXhxaDZ2VXF6K0Z3ejlTL012YkRI?=
 =?utf-8?B?YldmUHErR0VNbjJod1J1VktOYWhobiszMU9ha2hjRjJ0S29KbGY0SEYxRm9R?=
 =?utf-8?B?ajBRZmx5NWk0a3FMN3FzSWs4Q0xsUUJFeXN3YVFwWXR6S1JVV25HQzNXazhE?=
 =?utf-8?B?T0pvOU84bUpHRWt0emxPRnpUN3c2cnkvcXdudE1hcHQ4T2lmVUtCQ3dzYys1?=
 =?utf-8?B?V1NVcGlIUVU1Ny82enZoUG9mZS9yU05tdE9FbjFTa1VCdmMvZHJnLzMxVlhF?=
 =?utf-8?B?Q0psVk5Yd044YnM1YWw5QW1rQVdrVm40T3F1NWVBTUwzWFV1cStqTytsQmRW?=
 =?utf-8?B?VU9nYy9QcHJDVUVDeVVseHFMMVRFZnErNi9OTjdwNEM0Qm5FU05nR1pnSzRi?=
 =?utf-8?B?MVM1UCswckw5OE1LV25ldG1BdGxqU25jSVNtdGZCaXZIeDh4MjF5VFFNcW5T?=
 =?utf-8?B?akpkaGgrUnYzRUYzaExmeFRBOEVxR1V0ancvUE5xN2ZaT01YVlBhZ0JRNzYw?=
 =?utf-8?B?SW9hNktKR3hYNkp5L0NTakxVRFhvQlNjeGIrNjVCdU43WGx2a29nUzFzTkk0?=
 =?utf-8?B?ZUhTRjkyaGdNWkFHUjdqSEJJZnJQUXlIaGxtL0FOMGtibWt0aG5kSVZXT21k?=
 =?utf-8?B?VzlwQnB4d2ZPRUc2MVUweDJ5ajRFUkdtcnVoZEU3S0QyZmFNYUtzVk1TVXBq?=
 =?utf-8?B?ZmxSaFB6bGxuVGRHWEw1TUtva2lTTjZ0Tm9xU25ZZEkxQ1VTcmNEaDE2Q3VI?=
 =?utf-8?B?c1E9PQ==?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbcc47e8-f251-4aa0-b97a-08dab0405649
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB2941.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 13:06:00.8257 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T80/RfXVh6C9z0UaooJVDjqxWWQd8kGlf5RPk7lNGYGYpl3/WmQdXuVpjlLHGKla62+uXFyzkl60iLpHVLv+Mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5204
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
Cc: amd-gfx@lists.freedesktop.org, Leo Li <sunpeng.li@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 David Airlie <airlied@linux.ie>, Alex Hung <alex.hung@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Hamza,

On 10/14/22 11:31, Hamza Mahfooz wrote:
> Currently, if we encounter unimplemented functions, it is difficult to
> tell what caused them just by looking at dmesg and that is compounded by
> the fact that it is often hard to reproduce said issues. So, to have
> access to more detailed debugging information, add a WARN() to
> dal_irq_service_ack() and dal_irq_service_set() that only triggers when
> we encounter an unimplemented function.

Do you know the specific issue that triggered this unimplemented 
function? It might be useful to describe the situation in the commit 
message where you see this problem.

> 
> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
> ---
>   drivers/gpu/drm/amd/display/dc/irq/irq_service.c | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/irq/irq_service.c b/drivers/gpu/drm/amd/display/dc/irq/irq_service.c
> index 7bad39bba86b..b895bdd8dc55 100644
> --- a/drivers/gpu/drm/amd/display/dc/irq/irq_service.c
> +++ b/drivers/gpu/drm/amd/display/dc/irq/irq_service.c
> @@ -112,8 +112,11 @@ bool dal_irq_service_set(
>   
>   	dal_irq_service_ack(irq_service, source);
>   
> -	if (info->funcs && info->funcs->set)
> +	if (info->funcs && info->funcs->set) {
> +		WARN(info->funcs->set == dal_irq_service_dummy_set,
> +		     "%s: src: %d, st: %d\n", __func__, source, enable);
>   		return info->funcs->set(irq_service, info, enable);

Do you know if we may hit this condition multiple times?

> +	}
>   
>   	dal_irq_service_set_generic(irq_service, info, enable);
>   
> @@ -146,8 +149,11 @@ bool dal_irq_service_ack(
>   		return false;
>   	}
>   
> -	if (info->funcs && info->funcs->ack)
> +	if (info->funcs && info->funcs->ack) {
> +		WARN(info->funcs->ack == dal_irq_service_dummy_ack,
> +		     "%s: src: %d\n", __func__, source);
>   		return info->funcs->ack(irq_service, info);
> +	}
>   
>   	dal_irq_service_ack_generic(irq_service, info);
>   

Just for curiosity, did you run some IGT tests?

Thanks
Siqueira


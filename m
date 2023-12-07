Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D921D808DAF
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 17:42:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 590A210E1EC;
	Thu,  7 Dec 2023 16:42:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2109.outbound.protection.outlook.com [40.107.8.109])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AD4D10E1EC
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 16:42:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OJfe16NHYwqiJVmykGfDrNruAW5HGy0TPLr4AaNKOXA2XdJlMhqR/ENtC4qkVexSTU3PnsHSxdz5sTdrC26W3S47dQXNSPu4E/d7yE9jkHzynaxNwSWKZyCA/BlXAJWS4/tRElNWEND+mGaODcuJVRBIkUoweoSkf6W6mQlR6mXzmbcOSrZL0hNA1A/gjRi97wGSzm3HHCs3k0ZG9nDNwvi/2BS5+8VdDwES0ryOCBmvpQSWrpkAVl1E+2aXfgCuN+khtLQZ0rl7GyOeX+6tz5NiM4vhiM6Ql/INW6tpJTtscgFoYrnO3+f5ngPucLcWBIY/HL+kAuk+q063NA05Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ov8K7h+3jWlY2h9GGyRghqz7j3x1HPg2JfqLj3bkmDQ=;
 b=MLQL4Yeq6stw9GzzyWLHHXvn1xw7eMoI56H7g7CPvtnq0sGNiyrw6mR0DT96dR7G/kLai+9t0OXlZxrbOmZ7+Xv7gns8R6dxXoDKY9zX66jLm0LSmvkesWh9JT7j2j/RnRapk7BVpmQUea1U0xjhU0TGQuUQnc8AaJVJ3sSFkKplaz0DRUI1gnt2j0rkuh66GQiDDbGDBhlP+F6RVp3avmjM1XRBouv6EieHTTaVToXrkCyCcUTOxbMsq1mNzETPGyHWj+L1cooOwLtAprSNlUFHdO/n4pZ1QUE5qdry02RUYsHXraaWAkSEN1ToTso7FwwV66y54JzCmo5I5uBrwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ov8K7h+3jWlY2h9GGyRghqz7j3x1HPg2JfqLj3bkmDQ=;
 b=f5OE255YNQ9x0FbRbrE6bAcKyqQGXlYgLnFxg9JjYUXhq40jc0g0hQgdWiJs4r4+6qjwQ7XbBvGvdnEDHdE4nmAq/tVtTF6Dzi1gXpcGK8XFa+HAv9xybdCcPySjXlt6ppN3m9d0hZICGFRklhzgdx9jN3Jo2lDFbIqNmL4B1wE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by AM8PR10MB4100.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1eb::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Thu, 7 Dec
 2023 16:42:46 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::27ba:9922:8d12:7b3d]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::27ba:9922:8d12:7b3d%5]) with mapi id 15.20.7068.025; Thu, 7 Dec 2023
 16:42:46 +0000
Message-ID: <77ee045d-e5e0-4157-ae0d-cd8320a33eb3@kontron.de>
Date: Thu, 7 Dec 2023 17:42:43 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/bridge: samsung-dsim: check the return value only if
 necessary
Content-Language: en-US, de-DE
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-kernel@vger.kernel.org
References: <20231207161056.183442-1-dario.binacchi@amarulasolutions.com>
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20231207161056.183442-1-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0235.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e9::6) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|AM8PR10MB4100:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d32a8ff-a28a-4509-6b42-08dbf7438ab6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 40S+mBsmjynW5dIosW/Bj88t75rI9aMZK2y60W2kgbpYRnrBkFTftZiDR4TV0Xkis8UdlHK/LDAIZYUfLn5J1bo4o1WCT6q7q4C8lK1JRQ8edGQ2UZl0kn5Vat7XOXJJ7TsvhrPZxnRGuL49jFRJ3KPKF1YhVVSiFdXzvF0YYMunlEzTXDsKO2/DyD9F2/AiHI/ayKLSzkqpsueUchZV/bks+6pguAgI7maBCfN49ro4yiXAOSk+nuY+NgJr4IRxu9PgR9TOi6O8hiaaJBfgbS7lKirBxMXdVOJqkJgjEIUKGZd31aMYUPCdGL/GYDkUbUPeA/Q8q4DA8psbtJtOXsqaziHD68t6FZtTJT94HZZItFassnBYJL/Sfli28RhqUXRvQdWoAV1n+rIKdiMJMZcuxav0rYEXGAp66A5dHnKdcMGIhs4dMLGLK298Pt/Y4k9aDB9GPz7XRvf2OSEgX3+RRIYhRbgotTu5Ck9VQ1f9T7EQHOS+alBIS5MwKTP4Kq8qOtZ5OI7ZnTiv9JGiY0tN/2/0eN7L1Pr+QsQ7ekXN50caho2tuv03Vrtw7IHFfYG0/Q0UXOWux65H102g+hzV/xbSCBW9BJS3rTHEZymTC17zfzZmtiUA8T1+U1BT8NB97Z0ITFl7+RuBCgpphQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(39860400002)(396003)(346002)(136003)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(2616005)(6512007)(83380400001)(26005)(478600001)(66556008)(66946007)(66476007)(316002)(54906003)(6486002)(6506007)(53546011)(5660300002)(6666004)(44832011)(38100700002)(7416002)(2906002)(31686004)(36756003)(41300700001)(8936002)(4326008)(8676002)(31696002)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGNzQS9TQlZTbmZEbEh3WVM4dHJvbnZDQVkzOFZlazZmeHMyZDdib005L25h?=
 =?utf-8?B?RmF6czVmMXpUT2FhcmdhOVhGT2hIQnBuZXh6VUpvcGR1N3F4eVFxcEI4WVN5?=
 =?utf-8?B?Sm10UEl3cCs3NldEV2I5RTkrcEhDOFdLVHdwcnBhNlJKc0s0QiszVXFhbisv?=
 =?utf-8?B?WlVqdXJjalJpcUpKblNYTGtRQ2dqM25neEswY1BiWXhaa3Z2N1dVMTR3T1lO?=
 =?utf-8?B?aEQ0VE5VQ1hYUTYxeXdVenlXZVBUZ0VOV21hVTAwdldWYkYzNzJwQll2UVVs?=
 =?utf-8?B?QnB1cjgrdEdJOGE3VE42VTFmeDhZNVkranR0UmdKNUpMWnNEN1JQU3I2T2l1?=
 =?utf-8?B?dlVEOUlXY3d2dnFMNmx3Y0VZUVo0Z3lPUndVRlpiMVlCMDJQV1d1cVhvN1Q5?=
 =?utf-8?B?ZUhjcU9JellNUmFWR0hGblVySWZvYmRwYVhjYTdab2JCSFc5SzJGaVJPdUdr?=
 =?utf-8?B?UzJXZUpLc2RVM1JYdW1sOVhrN0Nta2UyN0hHMEJYV2VqQTBuRktPNDVPZFRK?=
 =?utf-8?B?clhjR29oQjJ3QlRLOXp3TVhVMzR4RytyVG02K3paWW9CcVRqNWxUeHdJQnJ6?=
 =?utf-8?B?ZlEwR0pZdjJxSGNLcFM3dWRGOGlDenlOVUNmelhuZG40cjhUUUk4OXZWSkV2?=
 =?utf-8?B?aWJUZHdjSjdHeExaYWVjVTkva0lXQlUyR09xSEh0Y2ZHNHY5ZWZZVCtFTTFj?=
 =?utf-8?B?QjFnZHFTQVdBWldGWTJlaFdPeFgySmEvR21VcUhydVZYRnlZZGpRZjdUSWdz?=
 =?utf-8?B?Qm9PeGFIKy93WG45bzN5VzZsQ2dGRzlJTVVKcXZmSWdqVzFWNXV2NWlyZkIw?=
 =?utf-8?B?OWNnU0tGbzlzaWp6aERydWNtOXd1Slg3aGRCUTNReHRNYnhXL0RQcm5pUm5U?=
 =?utf-8?B?bVVBWURtaURsS3I4Yi94ZHdLUWM1QVhtdmhwZSttN3pSMDZrd1M1MVN6YlRy?=
 =?utf-8?B?Q0EvbDR2V1d2WURxck1BM3U4N3FHWE9HbXp1WFVpOWUwdG5UWjQ0dlNmdXVt?=
 =?utf-8?B?OC93dFdhQXVFeFp2bkphczBKTDZQUWtHSlI0SW84N1lETGNRamV3M2tUMmda?=
 =?utf-8?B?akh3dU41Nld1RytMT3NCT3Zwd1VWK3N1YVZqUktPSTlERlZVeHB6REdxd1lT?=
 =?utf-8?B?SE9JaE9lMjBwa3pGSWhzV3VtUUw3WCt3azRDZzVBWFowTml6a1BmdmhRNmgv?=
 =?utf-8?B?Z0JUc2Q1SE1tcEpSY0ZaRjVaemplY3RyczRnWGFQWThBYWs1SDJFL0JxYTMy?=
 =?utf-8?B?cnVLMmZYS0trQzY0Y2Q3bDJMNGRCVmJENnBYYXdwYmlMRWxYYzhMSCtsQWRW?=
 =?utf-8?B?RWZYTk9FRzBPVW5WeDNIc05BSCtLOUVrc1lPUDF0T0ZQVDI1ZXNVcGlMQmg2?=
 =?utf-8?B?UEhMTmpKREpLdGN2R3ZsLytST0JqY1F3OEVQa1ZiQnZPZE9NK08vMjVQRE9h?=
 =?utf-8?B?UFVNYWYyV1VtQ1Nta1dqZWFBN3ZzdDBQUVd3U1M4WEozK2VQWVl5UFNXUU5P?=
 =?utf-8?B?M2NvSUo1b3F5dVI4djdoTmR0ZEJBY1dwUUJRVkNkUkNrb2VIeCtReUQvV1RE?=
 =?utf-8?B?L1owVnJhTERHellhMTBJdmVueUlRRk51YVdaSmhBb0tXbDZnMTI0Q2NneVcv?=
 =?utf-8?B?TzNkdmFTSkpubGxFMUFvbmR3Z25aaW9BSjBjNEloREFrVWNGLzd1TkpHQXB4?=
 =?utf-8?B?YlJFZi8wV3BMYWFub1ozT0pRaDlsdUJjVmZiQzluVE44SkpQSEZFVE9DUktL?=
 =?utf-8?B?ajhCd2I4RjBWbkhPeXdlSWUzb3JDanV0d2xSMFhON3NOS3VUajNlVnp3a09T?=
 =?utf-8?B?Tk4zaFJpK3VIak9MNnd4RHNUZzA0Mzl5d1BNRFVhc3hrTnNhWXZUOFFYY3Bn?=
 =?utf-8?B?YThiblc1ckVKOVhGR0pqMU5rR1o0Y3pqaWlEOWFLVzZMYTU5UGZpQWQyVy9t?=
 =?utf-8?B?TFBiREwzeC9sQmhJWlVybVo0QmdmNXdyb3JGTXFaaDEzNndyek5PY2JBVzlV?=
 =?utf-8?B?bEFLZ3dXMStmNWh3c1JaVVl4M25hZnB2bSt3WnBzVFRiSG44bDlaTW9Jc1lF?=
 =?utf-8?B?Q040cU82MnlXYjZ0Rk44VFVLcEZVV2h5K2VYbVJ6TEdKQ1pkT3UwczIrS2dV?=
 =?utf-8?B?ZUV0bjd5ZlZ1bUdxZGhMOXF2VHc0bERrS3cvV1ArZVhEK1hOdmRweXlGa3hZ?=
 =?utf-8?B?a0E9PQ==?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d32a8ff-a28a-4509-6b42-08dbf7438ab6
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2023 16:42:46.6310 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ad1cJH3Zi3AwZpdgQzva2bKRRpgnJnkMkftXd39wTmiOIoAwPvoE1XGtynGCCVoWTJy5dQ/aoUqY0ZuN/58tvIpym7gtPUJ13cWkHjshiD8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR10MB4100
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07.12.23 17:10, Dario Binacchi wrote:
> It was useless to check again the "ret" variable if the function
> register_host() was not called.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>

> ---
> 
>  drivers/gpu/drm/bridge/samsung-dsim.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> index be5914caa17d..98cd589e4427 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -2020,11 +2020,11 @@ int samsung_dsim_probe(struct platform_device *pdev)
>  	else
>  		dsi->bridge.timings = &samsung_dsim_bridge_timings_de_high;
>  
> -	if (dsi->plat_data->host_ops && dsi->plat_data->host_ops->register_host)
> +	if (dsi->plat_data->host_ops && dsi->plat_data->host_ops->register_host) {
>  		ret = dsi->plat_data->host_ops->register_host(dsi);
> -
> -	if (ret)
> -		goto err_disable_runtime;
> +		if (ret)
> +			goto err_disable_runtime;
> +	}
>  
>  	return 0;
>  

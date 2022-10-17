Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64031601314
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 17:58:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 258E110E51A;
	Mon, 17 Oct 2022 15:57:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E84410E51A;
 Mon, 17 Oct 2022 15:57:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kl3MDRwTACBaC0dxH8DKHxkmKwzj0UFTXWI7Wc0wMaxTU9ejz8Y3D8mXb5wo9SXTwCa+8XhFurvl8xlTVoFSia3VjWhBluQq+0lMxlQpaVF00o6muWIwYVV+Xaowx2+ZG4RkDNFDRXYEOflNHHjpjr+2UNfG9RgOKum4z07ku6ak6C+R5FcODe7Joqr8UrqZpP0/SWRf+zKyJmxiv23aO1rvprft/FMF/gozKNVu2ak8yOjGva9lwQ6lIoobm4VJ2JHkq4NB+WJ12Cy0oHEvsJ/hYzMszMMxvn+XzqvBHG/PX6f2i7ie2NfJ17SivNUNu8Vch3IdHlOz6lUIe2We/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uQWijAdneR7nXrP7ZAHxs2XhN+f9b6KiRq2oQX0FGm0=;
 b=aJoj7o+wj+VBX1iSFB4dWCh6zujcf1ofHz3ykRw92MlU96R5aDQ7W9/Hw2qncHlUW4PfjOnvlqlVz7qBCzZvL7n/sgrLTDPWKNOtILaG0udZwCStrA5XUUp01572emytDMFdPYPjFAiRX7KK28qcmRVf/y6XuENujdzOIkB/VTXhocteWGD64WjPwevouZnM72jjhv1+brTmGltC2ZRhwXVQ73YmaPDITLMFAEHs9zSR8Din8jaXu2mN7jvLWe6Zlsy+pf9A4uUWBy5PLzKc0/zCGmAdlQhJNG08GbYQHnR2pLnI8CdEK2nyYBaGDYlyNZGjN6yzxCBhiyY/lfpfbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uQWijAdneR7nXrP7ZAHxs2XhN+f9b6KiRq2oQX0FGm0=;
 b=LUS2DzxMvmYjpIxpmwHBsnn03tabYzMwikH4nb3O+g52R4MTXEY/+DBJgHSFs3pXjx8u5psvQyHG9+pebUfjFcvutufWq/8BWApOLtRC+7+xTodzJcIBfQcpQ6CU+BzKqmRrNr2RMtvyK7R6YfjqhDID/Yiz3KHuJKJgKzy8TQw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by PH7PR12MB6563.namprd12.prod.outlook.com (2603:10b6:510:211::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Mon, 17 Oct
 2022 15:57:48 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::aef3:6aae:b904:e395]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::aef3:6aae:b904:e395%6]) with mapi id 15.20.5723.033; Mon, 17 Oct 2022
 15:57:48 +0000
Message-ID: <ea5d5e75-9c63-b4c4-40f1-dea42b121223@amd.com>
Date: Mon, 17 Oct 2022 11:57:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v2] drm/amd/display: add an ASSERT() to irq service
 functions
To: Hamza Mahfooz <hamza.mahfooz@amd.com>, amd-gfx@lists.freedesktop.org
References: <20221017153836.65515-1-hamza.mahfooz@amd.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20221017153836.65515-1-hamza.mahfooz@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0018.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d1::26) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|PH7PR12MB6563:EE_
X-MS-Office365-Filtering-Correlation-Id: ee035020-ad1a-4f33-8d55-08dab058564c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vvCm75zFwNj9N0jgobWSAyX49Mm1HV8l3T4TqSueRHmz0Vj40pMrdekN6rIaJgvt3Aa9V6NRV8Ej5+PA1Roq2oqg2HYWh9UvAezW8e9hSYmrOkAqjetCQVudm8I/JhukpwcqUYC9mEwRxyXH4IWWJEwNNRCQ+XVg6u1veHYQQH9HRY4ukqZTWvT0CvulCeW1rVSS2BTNnXjlZdF6Lzt0iRGYMgf8GB9iTHqM/nrx7rb162+hUyZGQsL3GYemTew7b8cJvA5pd6Lou47v98cUSCnWsaLyS5b8eS+9R5lXmtUb55ZgJYadrXtb+uG8ZGXoX92/39rjKeZ4ahzAYo9hn9loG0uBGAui7uYh+3y5zdpaflDnSBilNoWJtBE2RbXn2RFVnImpm9f7/8XITPKaUiQ0KGr697w9VBRue2nOhot81+2sUW/QPY4LLtmfCeiUP/NiGo0KpicG18X4udJXtLydhC/oVG4YRZQf0R4O6KMjR5dQDGYNdPz7q3h6zLq1JymkpI4BMRVdQab2HxoqDMuXBOMjSa4ITqMFNzGxamFSODLGqCK0tgWiNSoMs2s0i+cv/BqFVhpJNaBqlwZ86NFUJ9difow4w8HmrgjZ3qYTWOEfW6OSAJz9G4fYsSUtCAi34PAXEtxDeUnIqtSNY0M8L28+D71RA6hr70jSDyQe3C2f0QpDBKE48eggc3y1ldmouXJTJhAfEXu/LDPIfzOBMUsyFxKnbD1WTWz/I/bBZLrBStYXL6l5lhDVm1hVvWMPWjNqOhqk4EXn4hEIMM0Ds/1GgyhlfHBgm7oZO50=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(39860400002)(346002)(366004)(136003)(376002)(451199015)(4001150100001)(2906002)(31686004)(41300700001)(36756003)(8676002)(4326008)(44832011)(316002)(66946007)(66476007)(5660300002)(6486002)(54906003)(478600001)(8936002)(66556008)(6666004)(86362001)(6506007)(31696002)(26005)(53546011)(186003)(83380400001)(2616005)(6512007)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a0wvdXRwQ21hbkNmS3NYN1Uxeno3alloYzJndDlidURGZi93UFh6cS9MdnM1?=
 =?utf-8?B?bXRkMVJHVitOWjBLMlNFMFplZ0l0VVRkSGpiUzhrdmlWTXNmMDZjNjBnZUVj?=
 =?utf-8?B?WXFBMVJHOVdlaXlmeDUwdGcxR211Qks2Q3pXQ25YVm90ZExTd01kUlB1OFA5?=
 =?utf-8?B?YkVjYXVGQXhtNE95VVhOZGFlaC9HWXYwUHZ0ckNlZ3BkY2RzcDh1S21wNnkx?=
 =?utf-8?B?SGdabVFNNk9WcG5tTnZRLzBpd1RCaG5vejVTUVNGL2pxcnVweVlPSWp5LzVa?=
 =?utf-8?B?L1RTZWVZSnhYN29adHIraXZuaGpUYk5pWlpEZkJWczVsM3FHU1lCWDQwUFdo?=
 =?utf-8?B?enZuWFNITGtLTU53NkE4WjErRFZGSTVBZlduM3Rwbk1yT3JlSXE2dklXbFRF?=
 =?utf-8?B?K21HNm5HS2hxYmxOSlhhbFU0Zkp4NWZxcUFZNCtkYWVJalVjLzRtSlYwZk85?=
 =?utf-8?B?STNDSG0xeTkxSnVOMjZHNVFiUGNudzUzRmxuN0s4OXlQa3M1QVBNZ3EybUw0?=
 =?utf-8?B?VFVCZGJJWUZZMm5xWmpwS3F1YVdmdVZNWTd6NHdSc0NUZWh4MWJoZDF1YkNy?=
 =?utf-8?B?aCsyNmpVT1EvaS9tZ29RNnBYU3NyM2d6YmtkWFFScU9PUEV1YkRqdVRqcjEv?=
 =?utf-8?B?TGVuLzdCWFhwMS9KcmFCbUNDODNRRmROSE1mSzZlYnpGTE9PdlExSTBXajdB?=
 =?utf-8?B?OHh5dTdBdTR1c09LNzVxdVhKb3oxbktBYTFPQ1hxY2tXRnJpQm4rMnpITkw5?=
 =?utf-8?B?VzdBM2o5QndXclhEeGdWempLV2xoUXdqelB5OS8yN0cvTmxtcG5HNFRCWU10?=
 =?utf-8?B?NXN4SC9DRUcwVHc3Zjk4a3U5MWIxWEFpeEpQOEVGRCtReTZtRkdUVGR4RGhB?=
 =?utf-8?B?NFBRY21DTXZiVzBzVUtobzI4amgwRERNUWFLZDk1dkpucWhxK2k0a0N5a3o4?=
 =?utf-8?B?cHBxdU5MSXoxRGhzdkY4Tnk4SjkvaEZ1S0tES2dKMzlSdkNZY1NTczRxaVNX?=
 =?utf-8?B?aEdKcG1Sc2MyeUhmUFg1cG5XNU5UcEJqTUk5L2crU1RRT0dxTHFZdCtKYjVE?=
 =?utf-8?B?S01VSzRWTEZtNDZXZkhmSVM1cStWV1hsVHF3bFJyY2lKUmVVNWc1SG9QQ0F1?=
 =?utf-8?B?OXdxYmNjZUVXb1N2OEg0aWpKZ0YxMXhWS0dBNDlMZHFBZU9vbml2T0JvZlpL?=
 =?utf-8?B?TmxEVktwQlZZcE55WUhFZGRnQ3cvcXFXa01UMWx5cEgvUXBBaFJkdU9hK3Jz?=
 =?utf-8?B?ZDBNUXlnUloxZ2gxMWNJaWNsdGZTekFVS0YxekpaWVNNcGZJZ29BU0lGbDRN?=
 =?utf-8?B?bk9nTkxiS0E0ZHZqVndQajZaamJEcUJkUEorODlWekJkQ0RTWEtpTG5QUHJG?=
 =?utf-8?B?VnN4RnZRM1lkUWtUWi9KRmRhaGwzdk1pNENBZE4zNTNIbnRzT1dPc041aDJv?=
 =?utf-8?B?M0xUNWJVRVJQRTlab3ZTaTcxaGRWTWsxNS9ELzI1UzFaU3FTZ2Rra3ZIVk5L?=
 =?utf-8?B?dHNqMkRhWC9qMUZnN1ZxMXExc1NxT0FGZ3VCT3YrNkFkYThweXlxcTBSaTF1?=
 =?utf-8?B?YUZVWXhBN3Y3dGplSjdJU3VFUS9qNWxNbms0bjlpeEo2R2E4QkE0U0dRZzMx?=
 =?utf-8?B?NXQ3bkVaVEd1WjgzbGpUM245Q0dKTGZXRm96UXRUd0RQM2IrSVRJVWJBL0Qv?=
 =?utf-8?B?dnE5UmVnWEtTR0MzQ1E3SmRXaGVLNE5hOHRtRmY2WFgzay9nTVc4Z0pMaERB?=
 =?utf-8?B?bTNSRU1zU3hiRG8rZHMyVVRHUDIrQ2JXZ3o5ZFNXQmVhSnlSWjBITG9QaFRQ?=
 =?utf-8?B?QzArbHdwZitqQ2hQOStTWW5VUnZIZkRNM3Q3N1grbC9vL0wrVGorK3lCeXJN?=
 =?utf-8?B?S0xNeHNvMlBoSm9PNU9qcUl2ZndIYWxtN29MWFc5YVBPZlE1VHdKWUVBZG0r?=
 =?utf-8?B?eDhRYWNLbTh6NFFlQ2UxUmZLOGpLbENxQmVKQ0FtTEpvNXloMWkzaGhuZG1u?=
 =?utf-8?B?MXhsbXhOYjlsdWdRa2RvQjRtemlIWC9ody9QMGl3MElkcVFCeld0OHdGK1Nr?=
 =?utf-8?B?ekdlcDR1QUJMYk5xb2lLVHR5ZDZ0cDVTVXlrYVY0ZDdnaU9mY1NoVTdNSisx?=
 =?utf-8?Q?bo5+8gnLMOacG2y4Mk7MOoGwv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee035020-ad1a-4f33-8d55-08dab058564c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 15:57:47.9220 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fs79cwl3DoZMOmzQ1aI9YFSUBlmo3guLlsCLEZZlOeN7Dcya3uR3RUE311XDP7n/Udlzh6ljGk+Qs16FJ42LLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6563
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
Cc: Alan Liu <HaoPing.Liu@amd.com>, Leo Li <sunpeng.li@amd.com>,
 linux-kernel@vger.kernel.org, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Roman Li <roman.li@amd.com>,
 dri-devel@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 David Airlie <airlied@linux.ie>, Alex Hung <alex.hung@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2022-10-17 11:38, Hamza Mahfooz wrote:
> Currently, if we encounter unimplemented functions, it is difficult to
> tell what caused them just by looking at dmesg and that is compounded by
> the fact that it is often hard to reproduce said issues, for instance we
> have had reports of this condition being triggered when removing a
> secondary display that is setup in mirror mode and is connected using
> usb-c. So, to have access to more detailed debugging information, add an
> ASSERT() to dal_irq_service_ack() and dal_irq_service_set() that only
> triggers when we encounter an unimplemented function.
> 
> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
> ---
> v2: detail specific instance that I'm interested in and use ASSERT()
>     instead of WARN().
> ---
>  .../gpu/drm/amd/display/dc/irq/irq_service.c    | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/irq/irq_service.c b/drivers/gpu/drm/amd/display/dc/irq/irq_service.c
> index 7bad39bba86b..3d6ab4fd25cb 100644
> --- a/drivers/gpu/drm/amd/display/dc/irq/irq_service.c
> +++ b/drivers/gpu/drm/amd/display/dc/irq/irq_service.c
> @@ -112,8 +112,15 @@ bool dal_irq_service_set(
>  
>  	dal_irq_service_ack(irq_service, source);
>  
> -	if (info->funcs && info->funcs->set)
> +	if (info->funcs && info->funcs->set) {
> +		if (info->funcs->set == dal_irq_service_dummy_set)
> +			DC_LOG_WARNING("%s: src: %d, st: %d\n", __func__,
> +				       source, enable);
> +
> +		ASSERT(info->funcs->set != dal_irq_service_dummy_set);

I think you'll want the ASSERT inside the if block.

Harry

> +
>  		return info->funcs->set(irq_service, info, enable);
> +	}
>  
>  	dal_irq_service_set_generic(irq_service, info, enable);
>  
> @@ -146,8 +153,14 @@ bool dal_irq_service_ack(
>  		return false;
>  	}
>  
> -	if (info->funcs && info->funcs->ack)
> +	if (info->funcs && info->funcs->ack) {
> +		if (info->funcs->ack == dal_irq_service_dummy_ack)
> +			DC_LOG_WARNING("%s: src: %d\n", __func__, source);
> +
> +		ASSERT(info->funcs->ack != dal_irq_service_dummy_ack);
> +
>  		return info->funcs->ack(irq_service, info);
> +	}
>  
>  	dal_irq_service_ack_generic(irq_service, info);
>  


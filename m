Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 940C557D3A4
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jul 2022 20:56:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2633110EC5E;
	Thu, 21 Jul 2022 18:55:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2064.outbound.protection.outlook.com [40.107.220.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0F7A113B3B;
 Thu, 21 Jul 2022 18:55:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J2LF2oqfuzdlJaW5jdOnV+Q9Hco2BPWZ2PqvXW0z4VcCE94Ll/g95aEYSJ8x7QxN/uXpoVeW/y+e2d8n1qvhaRwbZFLUgBftlRD2oC1bl6i+mpF/QhTMlvPwtuyPhFe0tQjeEqD/AYVuLFpjLYOer8XBU/Zu/k8q/7natmCiJGXT6IMK9F+09DUJIfpbh2CZIg4Hvtx6C6gO/12eN3as72nhoUWllpJnSu1eWo3DuEzNhBj5Ffog0IP3LxG6yhoKtLklEVndLpkHMvkrIZXfFPb/s8oJUlpyQr3lrBO61ag7/MpkeUttrg4sshRPWut4jTN/HrNtp9EcTgHLyAUoTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1cwQUQgexe2GlRUrR56+YfPqZwuM+apJn1WXKKuzXx0=;
 b=Zcty1bgDzlgoqTVqCRU2V0/+AC6H7BrkgeD2FaHF4jzS5/r9bPJwPi9kgX7cm3AdK9egTgPtDHLLFNpvRD7jjxsMfr3JhbwylcKfxQqE3DpGZl28C+du3G5Olknn1vEY1GDhrJTAWDBlMqTzC07zFX46QCZGwMQgyT7YfLHOP3y65HlQ3jRZWRVvumHre+SB7tQA/a6A6YY9ApDoIZKXqHGDs2M7JZboTEaTNo3xXiiDLjOGW5HcsW1srLxR/wF+YPkz5F9xpDdX1axOWEOJTRGGsjdZ9M5lUpPnB5XMBQuPnOXkevSqikE8243cKXQgS3I+II0adRFcWC4Qrdxneg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1cwQUQgexe2GlRUrR56+YfPqZwuM+apJn1WXKKuzXx0=;
 b=1q3VbfWNJ86I90jGdYcEDwmE7KOQD0SzvqRLZjPouJ1CQ6kzf87nqzMv+DWkSqtVysxezCw//BjFyyt3rHS/I+wr4ilrrNEzCsXRwQr5JUkUnsZ17Die+bFTB/cImd6xjGo5cCXOv10V2Lo0/eWmtJoTOhQg9UjQLxJjneRWAKU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB2941.namprd12.prod.outlook.com (2603:10b6:208:a9::12)
 by BY5PR12MB3940.namprd12.prod.outlook.com (2603:10b6:a03:1a8::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.20; Thu, 21 Jul
 2022 18:55:48 +0000
Received: from MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::d122:1dae:8445:2e43]) by MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::d122:1dae:8445:2e43%7]) with mapi id 15.20.5438.023; Thu, 21 Jul 2022
 18:55:48 +0000
Message-ID: <d57bf8b6-f4f9-dda5-72e9-e5cc55081eb9@amd.com>
Date: Thu, 21 Jul 2022 14:55:46 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/5] drm/amd/display: remove useless FPU protection
 wrapper from dcn31_resource file
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, airlied@linux.ie, daniel@ffwll.ch
References: <20220720193208.1131493-1-mwen@igalia.com>
 <20220720193208.1131493-3-mwen@igalia.com>
From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
In-Reply-To: <20220720193208.1131493-3-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR07CA0015.namprd07.prod.outlook.com
 (2603:10b6:610:20::28) To MN2PR12MB2941.namprd12.prod.outlook.com
 (2603:10b6:208:a9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b94aa84-597c-4c09-de2c-08da6b4a9fde
X-MS-TrafficTypeDiagnostic: BY5PR12MB3940:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A+AEqCYjX3glJ07ROQ7G/NC2WjAiyjhYU7gCb4TwB/dzitN67lUIk+5iMmriq9cZ/FT0FFuR5P93bLJlL+zTt4URnQ3EK4QNkpJswEamLCFBFjVpmQVvxJ7AwY8jQPs6KCCeD0kuGGLE/5qG0fJFuWrum8QspHITZBRx2mxPrIhrsjHwidFXgXkw2es1UrKbElIQ9nLgF8tk06TVt0VAVaR0QQZhL1oH/smIS90u9Fi0EwmIKDDhsEHdUaBVmekSrLGblpD5LFwCACuQTjwTqpl17VNWFBk84Pp7c+g0vay9NKJxjJLj1qcb1iaehc/AnfCQ+h7AML4EmaItcS+VJ/b6pXmlOiYyyJtLMxvJBsHTAnxworGoKiOWj0JHOQOka04KzH05/aHMxv+XCPHCUu5SIq9dY8SenAbQQdRwkBE8yTega2GOd39mwAMkA8ltroGLxvvrEfQp+31Vh9MX7D9fZtf7wU8IrdB+ItVfLkcYIg04whE9av+etrydgiO5l81K6saeMwT1tUmeKwm5YUUTJjdYvI3/ieTTQ4OgvkaW8xqK4NF1D+kGDdiPQKlaFzsYD8oKG9CKW56N0RnZWpohoRgUlJXS8S8LMca/KWO+Wxvu+T7rwwPyp4aG35Q7rtcxKbQ4y0LF/4V36waBKHFoWDSN+QsfOs3ktoefUFPln8oFS3sF4M6y28LIcREXuQT1JHj9Lgu1a9p69sb+m84sMWJbsHldJVWmGZ5C4Qkccfcb8cIxcyUkqj/w+ccwtx5T+TLXM51PCXGuEAMN8aRAXLzsFWiHR5UIv6i6jrpwZjAt3iPGjXkKLeCQueWBCwCxPS3ILtQD+AjHNF5fYg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB2941.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(376002)(346002)(39860400002)(396003)(366004)(8936002)(66946007)(4326008)(54906003)(26005)(5660300002)(2906002)(66556008)(316002)(83380400001)(8676002)(66476007)(31686004)(86362001)(6512007)(53546011)(31696002)(41300700001)(36756003)(38100700002)(6506007)(2616005)(478600001)(6486002)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SU9yUjg2Q3d1RCtBTzFQa2pIUkJCTmxrRGZ0dE9wQVpCbUtyQ2FyNitjNlAz?=
 =?utf-8?B?QXdWNllzamROT1d2RmxidThvRjF6MDdyZWdiRFdMUE5WYkpxV2NwWTlSZTNX?=
 =?utf-8?B?YlF4OFRzSy93Y1puaGdOazFlNlBaZXVBOVhzb1c1QVJrZFhmdEtpY1hoQloy?=
 =?utf-8?B?dEk5ZUdWeGRkN0dSN1RIdWdSUHYzaGpUYXhoRWtyU3ptUnowQmNzVW5KOWJl?=
 =?utf-8?B?SnZJdWRBTEtpemJOUXdodzh4Y09KMXJjalZkUTZMTkNtWGhtT3llYjN4QXZt?=
 =?utf-8?B?enR5N052RHN4SHpVa05DckNJb21nVlJuUEoreFRZMmtGdHNKdFdmRTVsMFk0?=
 =?utf-8?B?bWhadkZ3T2J6RUJxV1FtN0F3bS9aVlo0NExvOWZXNEFyT1VjSEhVakdGWnNY?=
 =?utf-8?B?RnNhQVJnY3c5SS9sSXJBTG0zem9RY0xBSnVQbHl0NS9YZ203aUt1cFcvQ3pS?=
 =?utf-8?B?d21aT1pXNnNzN005TnpZd0hVVXhFdFJYN2JzMkhoZjg0cWwvWHExd2pUVGhz?=
 =?utf-8?B?c1A5bHNtSE9qTlRsMXhvdEJveXdJMGY1YzRCbDVyTGVCRTl2citISG1iSGpD?=
 =?utf-8?B?NE1EMkpSTkdpSWtQdkxHTkpMaTY4VmRqMEdLY0JKZFh3UDYraW1WTG1YbXU1?=
 =?utf-8?B?d09VR1Zob0ZwaG4xeWhDeUdtbzdwc2MvSldUNzJlaklGUlJYdXZPSnBGeHNC?=
 =?utf-8?B?OFBicEUramR4cWc5UkhQQTY2VE1WZ05TV1BwZkQwVzR0WEVlWmNFdGhaOHIv?=
 =?utf-8?B?UVR4YjRtbDdJVEQrV0xVSkhYbCtacXZFbE9oTnpvbVowODN5NGlpckdNUFpi?=
 =?utf-8?B?VkRUVjQvN2NyeUpjV29xeUZEU3BncGJqQ05zay90NWVraGRvdmxPRExvajc5?=
 =?utf-8?B?V3RkODFHVEJHRmxQZHd4bi93S3RTaXpXM2dXdzJySVJBSTdWcE9aVDJuNkJC?=
 =?utf-8?B?R3NUK1BSeVdDU0JBcERtbUxIQVp0OFZzdTRQS2p5S3JxcnlWUVFIYWNidDg0?=
 =?utf-8?B?SVpxQ0NsaFB1VzhXRjZ6UWNqWlRrVEI2UW9SMFhpTUZSZkd6OElVbnNwaVBD?=
 =?utf-8?B?STlLL0tBS1NLMThOY2RORlhzLzYvYzg5aElLajBjdlFyb3NkVTg3VVdocjJx?=
 =?utf-8?B?aVBiWXIvWTZwL3VlR0NvaCtacVdjdXlNekJ3YVBCOGN0WUdJbXFjNDBLQmdI?=
 =?utf-8?B?bFVENEVTSkhsOGQ0c0RKVUhMcU54OUxheWlKKzZiOXl2a21xNGNHdC9iRW1u?=
 =?utf-8?B?TDkzTklOektmU09YZWFTczh0YTcvTllBRlVpOHRsL2p4RTZVSStnblByZHln?=
 =?utf-8?B?MzVqNk9Pc1YxM2ZzRW9vdDk2UTZOSlNRZ0hxRG1yYnIySkFxV3JiZDFxMzla?=
 =?utf-8?B?TGcvM25ycE9QcFBKUWxEa2FaMGVta2FTZGswQk9id1Z1ZmtxdWpHY2JDblNL?=
 =?utf-8?B?c29xUzdGVDFBT0haRUZtTGF0MDZWcDBnczR6bHRkK0V6MFJReHR3WDZtRzlD?=
 =?utf-8?B?VVpad3hSVFM1Z0ZrNk0xOEQwZm1WZWlTcm1oUjYvY1RUN3JjcVBzdDhOYWlx?=
 =?utf-8?B?UFcwYXZyNE5YWkpKbE1PYVQ2cXN3dHNibVFNZHhKRnIxRDhyUFR6ZDB1N0Er?=
 =?utf-8?B?NmlJQm5pdmRhRTVOVEVNMVpFT3pjWUFsOHlvWUxScUtjSUo4NlVqVUFBMnRC?=
 =?utf-8?B?eE9CM2lTVEc3L215U0J5UnNQNFdRTDBVc0JiZVNsOVNjYm4yYVIxVTQ4MVlH?=
 =?utf-8?B?WkdwMit2cGFMQTJ2WEJHMmxpVVIvQkFwVUtvNkxyYzVNWGFLUkRwTjlUeXN2?=
 =?utf-8?B?ZG9haDNneEYreFlsWnR4MnRTcGFYMXdMbk9kbm95VHpOci9BampuYlB5MVpq?=
 =?utf-8?B?TkxZTEhaV0xsQXRlWGhWMlJvL0thUGpvTzVkNVBNNjlhVDk2eENYMzZqRGlM?=
 =?utf-8?B?Z1h5N0N1cDM1QjlUWUR1bm5LQ1N3YWJzWTFHeDhxNzFKTXZ6bHNSbkVzYXd4?=
 =?utf-8?B?cDlrY3RPWGFvR05Wbk14TVVMb09jaE1SOWR4QnQ2OVN2SU5rWFJBVWFlaTQ0?=
 =?utf-8?B?Y3JhaUtoWklyTmlWMUx2Y1FZWmxZK1ZrM3V0V2JNZXNFb25SRGtIc1dieWxY?=
 =?utf-8?Q?XKTpW1AQjhivuttEUshSNS1jh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b94aa84-597c-4c09-de2c-08da6b4a9fde
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB2941.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2022 18:55:48.2000 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eNT2QOA9Src3giIv1HcUEluOiyRrOBYQhzryIRBGAtBkOmJirAR1wJUmtuUFuInW0PyoWjJ1/GdNFIRCcnIbzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3940
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2022-07-20 15:32, Melissa Wen wrote:
> Many lines of code in dcn31_resource_construct are wrapped by DC_FP
> macro to protect FPU operations; however, there is no FPU in this
> region. Therefore, just remove the wrapper for clarity.
> 
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>   drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c | 6 ------
>   1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c
> index 929b712cbada..6d25fcf865bf 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c
> @@ -1863,8 +1863,6 @@ static bool dcn31_resource_construct(
>   	struct dc_context *ctx = dc->ctx;
>   	struct irq_service_init_data init_data;
>   
> -	DC_FP_START();
> -
>   	ctx->dc_bios->regs = &bios_regs;
>   
>   	pool->base.res_cap = &res_cap_dcn31;
> @@ -2175,13 +2173,9 @@ static bool dcn31_resource_construct(
>   
>   	dc->dcn_ip->max_num_dpp = dcn3_1_ip.max_num_dpp;
>   
> -	DC_FP_END();
> -
>   	return true;
>   
>   create_fail:
> -
> -	DC_FP_END();
>   	dcn31_resource_destruct(pool);
>   
>   	return false;

Very nice catch!

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>


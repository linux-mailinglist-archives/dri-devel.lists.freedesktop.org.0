Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C5846F6B9
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 23:21:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6685D10E225;
	Thu,  9 Dec 2021 22:21:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2043.outbound.protection.outlook.com [40.107.236.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4424410E225
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Dec 2021 22:21:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=liZm2YCTD2dxZtrc5bVoxrBLu35OLKX8jfcOwyWf70vQoAvZCPE+0obCdss1Z8+1/DQ88iHjjX+/Fl1BTlQmLTx1odEi9AN0mnmsxejRUM6DxRbBoQZd2fB00V3JcUkO2GgBPI/0N5nbtbsNBvaUHQiI/ki17YIP4pnDAlzkoZiE0AoNXK4ta1it3XFhWaKSD0B72QrLMD2VlRsq/EB2wkJBd7KDorOLOUQv0nBUNiUOByyFpQ6ENQoFymdXpMLy46FLLyAhoj8Kt51/lkAtshT6R+Hr/eKrlv3mY8AYHGChRmTmFqAC6DDa0dfcHzvmC9qoRRFoA6qYCL75vluP7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NtTQs97RmCSpmRdf/9qF42c26kwaIt6hF6s4q00NLSI=;
 b=ganF7A0l13pxDeLXYXCnNiyIlmuUX75jloyTeiqxEzzHfBkxeJDuHbyynIrMI8rPuCRO/Z75rO2xNnecw6rNsNbYbfVo7Jgk/5nksik2cpRsRbFKwc1/+g0MmvBgNehXYuqYpIXYBjifFNMNxvAlySkIBdkkgQtwdMr4u57DTRYL28iPgNl/82trbZvRowC+ZBuBwO7U0Pn20pW8uKgSiZj0+g4ldA0n7+ENxLI1d4zLTeUbyLnBzd7B9E9zIreLsJF2LpAU5NU8eKIDBWHiNCDnjxojsZuoXWLJk3jyS5OcUaK2hl+XmK0JJqZe3w4gTJ//bk57ZF7V7q3NORZK/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NtTQs97RmCSpmRdf/9qF42c26kwaIt6hF6s4q00NLSI=;
 b=wVBX29/cNgH1pLxX8aYhlKoxfA0iFvgaitHKv2hPQL/JYHUsBT9RXjfNlGwTP9FJF0HuqZIqybarPs5VpkWdhkc1DZFA6YO0xjEJPXOB6NJBl9MOyDhy1/5OQO9Upt6J26uY/g8HMOfnGcuViDySbgRbMpQinKsoHd1xAUoi7Pc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CO6PR12MB5410.namprd12.prod.outlook.com (2603:10b6:5:35b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Thu, 9 Dec
 2021 22:20:59 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::e492:c86b:9906:1b46]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::e492:c86b:9906:1b46%6]) with mapi id 15.20.4755.021; Thu, 9 Dec 2021
 22:20:59 +0000
Message-ID: <2b7d760c-9ab8-b607-efc6-1ed276d67668@amd.com>
Date: Thu, 9 Dec 2021 17:20:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] drm/dp: Actually read Adjust Request Post Cursor2 register
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>,
 Jani Nikula <jani.nikula@linux.intel.com>
References: <20211203084354.3105253-1-keescook@chromium.org>
 <87o85r4a4f.fsf@intel.com> <202112082220.81ECDC63D@keescook>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <202112082220.81ECDC63D@keescook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YTOPR0101CA0012.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::25) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
Received: from [192.168.50.4] (198.200.67.104) by
 YTOPR0101CA0012.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::25) with
 Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Thu, 9 Dec 2021 22:20:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6558d442-f28e-456f-b271-08d9bb622d17
X-MS-TrafficTypeDiagnostic: CO6PR12MB5410:EE_
X-Microsoft-Antispam-PRVS: <CO6PR12MB541064A5D5DEC4A981001D6F8C709@CO6PR12MB5410.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h98iodY0183eHdUMlqtCTYDf7yuIi6TISJJs4/JW/o4EWcU8gkXJdRG25Bcw3YXZRTLQWaMaFlqFYC+y8QvVK4CFjMSwwmhFv//aoB3iyaF19blMkIwecHiXaEcoS320U2JXSKWLdBYVZFWVRBy6KjfDyJgSGhq5R1bIjVvIF4WCgREOqhk+oKSSuMYzcAacONnE7Jb5W+KFskuSHH9URppOr18p92xhsJFUGX3SKTQlW3Sk3XJcanihA6x6xkE5lYFy7N59uqJw9GzOO5TpnyWoolUA7K6M3TvITG4UGy06avNf02HaCkXZznNT3LMk8sMAqT5FpxgfqSrzuDYCDM/pQNaW9nrR+bnx/vMR3F9G0G3sgLQpFKJE4w3E3cWxuLTlqoMuZt7UrI4HRR0FWuD28e4xG6DiWIM6DSJzE3I50xlxBW5EvGvn2SwoyyfQbPha/nt3ohm3KNLeLK9OxiEJMDCPn4zPqM2cbf5/0Bw1L7zp9fgrg4tD5wY8G3hctOfCHh33YArJdcQQuD14fPQqqnltF6CXs7M5fT96IFeo63KecGGlkgaVDa+7BgLHyWEyPfAjC38T8zhU9JDZe/efRY/jeTlMAPMldbYu/06+Lvlng+lQSmhc41NSj6VFIrK51+YonJYft/ZnEdnB67QmyE0DOGEotg49Q/72CFujCf5gOQLOwHeszRw8DZ/N1bl70LYcdUWdwPVWpJBTQ5e86qfLTaaYr1W25ktrgDg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(5660300002)(31696002)(316002)(110136005)(6486002)(66556008)(66476007)(36756003)(8676002)(8936002)(86362001)(66946007)(6666004)(186003)(53546011)(54906003)(83380400001)(2906002)(31686004)(956004)(26005)(16576012)(44832011)(4326008)(2616005)(508600001)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHYzQnduTjBSMXcxWnBZUEZ2R3lBTXdETE1rOWhLWStBcWlmd3Vua3UvSGZ6?=
 =?utf-8?B?Zlp3OWMyT3ZwMUVjK0o2bHA2WE5FNk9tcWtpdDhnQ1REWTVHc3VpUTY5RnVq?=
 =?utf-8?B?WGpQdHRJR1ZYZGFHL1dRK3A1anpCQXU5bFZlTnBqQ3lweFR6aHNTTytUdDJ0?=
 =?utf-8?B?TFJ2Z3ZWeld5Um1PUGFuM2pRNUgzOGdpNHJwcGFDTGFka0NUU1g3NWw5R1VU?=
 =?utf-8?B?Q2diZTArNXYwVFhJL2tPOGlVTFlycmF3d2pSWWJkcDdZSmxGbUU2L1hFS29z?=
 =?utf-8?B?K1Z5UUVHR3pYMjdCOVdpS1pXZVNsOVlQaVpvNlJhcnptci9yek53cVJlSnBB?=
 =?utf-8?B?RktrazJIQ3owT3hYZDhkc2FIaUtTcjdQSUJtb1RNbnM2OFhHUjlvRW5QN0gz?=
 =?utf-8?B?Zyt4UkRpUnRhbVNWbmRub2JWaEcrdGVzWnZTNnFZNFV5VUduMUkvNDVDL291?=
 =?utf-8?B?dWl1dmtmR0RibFlydlhzWHNCeWVVOEZUanlBVzBSaDM5WjZDYktwa0pWSm1F?=
 =?utf-8?B?VW5WUTFZMjg5RGd1c1JqZ1hEaEVmOWVnZnBqdmdRZWwzMzg0d2h6bzBhZDNJ?=
 =?utf-8?B?UHBLU1ZCS0hmU3hrM2dyTG12TzNmOFVqd2ZYT2pYZW1ac1k4TG1ZbzJ0bHdV?=
 =?utf-8?B?dUV3TzhWQ3FtOXNieTYvYlZuTXRtMGRLeXozbUsyWE5wdDVsK1NLc0lXbVp0?=
 =?utf-8?B?S1BEWU9Ibk0yR0RhSmZBQytDZ0hSK3ZKc2llcE5YQkM0NlBJMGFLb0FhOGNl?=
 =?utf-8?B?VVhOKzJ6WnZ6c2owem9ob3RGdzhkRXhBSU02cmVoYk5FbXhOZnl1dEw0bkpE?=
 =?utf-8?B?Sm1kWlJMYTd4WXc0NDF2SllMNFIxdjY3N00rbXluRHpSK1NteW5INHdSQVJ5?=
 =?utf-8?B?Nmt0K05GT0UxVTdtT2xoSzFMS2VBQzYzNEtHbVlIbTZCQnR3QlcvMnBLWlI3?=
 =?utf-8?B?a1NjL3BPQUFxdC9mNGVUL3ZmdTI5bVRBTEMrellab1U1VTdJK3lqNStmbEtv?=
 =?utf-8?B?aFc4UU5TeFZETkNnZU1nR1NnWjdHS3RCUVo2TndrbjJoTUR5T0VVb1kyUkR1?=
 =?utf-8?B?aFZBQUtuZnVEL0hTWTZNQTdsbHdwNGpUYk9laW41cG9OemxINnFVL3plbTdK?=
 =?utf-8?B?cmV0bW13U3Y1SFc0dDQrWXg3QksyS0VHNkNjT1k5OG5HSHkvWWp0TTF6RlFo?=
 =?utf-8?B?SnpyYjVZeC9NckdTMWxpZDFWb1lWYTlkOG9SU0paY042aUovMDMrb3JKZUJO?=
 =?utf-8?B?MGgvUU9WbFc5a2FMRFlZMEtCQWI3MjBQWXhGeG9KZ2ZQOUVjSDM0MGc2dStz?=
 =?utf-8?B?ekh4UzZwcWZvYTFtWDNQSFdETEhrd3ByNmp4MmZNSVVoYW5Na3dSM2ZOb1A4?=
 =?utf-8?B?aUhzajhWMUYwMEdoMjdnbVB1anJIUFBOd3J1bE9TMkZHalg1U2YvK3pVV3ZP?=
 =?utf-8?B?N1VPZjNiRHhtNTU3Z0RxMWx3VUFzdFhmSnhFMDRyNmJHeklhL0lGZDAyK3li?=
 =?utf-8?B?Zm9xZitFRDBBR1pDRlRQQ0RyYWIvWDd0Qm84c0s1aW5HYk1sR0d1ckVveHlF?=
 =?utf-8?B?Z2k4Nlo5bmxzY2VES0JuMitKSjBZcHgwNlFXWFRrNHJRc2x2M0oxL1V2WTB0?=
 =?utf-8?B?UStiYmNJVHA5SVdoWEs2cWdSdi9NVHlUd0JNcWh6aEhVM0Y0RkRpZzlnWVYz?=
 =?utf-8?B?a0Rqb3M1MzRsNmE4QVVCT0E2YWdMN0lKZTlFSk51WGRzM2Y2Wjh4WEtlZitJ?=
 =?utf-8?B?NGZMSHllci9yQk9KOXFhLy9oRGZ0NkcvWUhuVmhWbFplNHRZMnJhWHBHTnFm?=
 =?utf-8?B?OG5JYVlnNDZqNEFJbHo0cU5VdmhaN0R3c3VJWVkrcFhyZHdRenJQNTFLMGtW?=
 =?utf-8?B?ZEthVzBTcXYyaDd4Q1RmelR5cHNHRG83QU5ZWTZqUURsWjJLdU8xd0xQS3M4?=
 =?utf-8?B?dXZSby92Zm1lQk5OSmc3WE5nWkx6MFdORkxITytmRXFUYWNDU2luc1RaOWRk?=
 =?utf-8?B?d2lKNitSTGpXUlFQQjR4L2pxRXUyenJpc3Q0WldLRk5zdk1BN1doOFdrdjcr?=
 =?utf-8?B?TWx6a1RHaElTOEJJdThyQWJZTGY2VC9QS0FOSUFZSCs4NmNPb1duWWtPcUZp?=
 =?utf-8?B?ZDl2VDhqVEVBSzlMR29HMUV2U2hGcmV4V0dxc1d6NUx0bGpFSHpDdmRlSnNP?=
 =?utf-8?Q?TJgJ40dehJIKplnd366q1JU=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6558d442-f28e-456f-b271-08d9bb622d17
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 22:20:58.9523 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tBqNMvKpehxsawnMLdmO84WPYA9vUg2pfMCIviKlPUJxFojJGJ08M9g72fzY1epNgXxyc5sVEnSLyoevajpvSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5410
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-hardening@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Thierry Reding <treding@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2021-12-09 01:23, Kees Cook wrote:
> On Wed, Dec 08, 2021 at 01:19:28PM +0200, Jani Nikula wrote:
>> On Fri, 03 Dec 2021, Kees Cook <keescook@chromium.org> wrote:
>>> The link_status array was not large enough to read the Adjust Request
>>> Post Cursor2 register. Adjust the size to include it. Found with a
>>> -Warray-bounds build:
>>>
>>> drivers/gpu/drm/drm_dp_helper.c: In function 'drm_dp_get_adjust_request_post_cursor':
>>> drivers/gpu/drm/drm_dp_helper.c:59:27: error: array subscript 10 is outside array bounds of 'const u8[6]' {aka 'const unsigned char[6]'} [-Werror=array-bounds]
>>>    59 |         return link_status[r - DP_LANE0_1_STATUS];
>>>       |                ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~
>>> drivers/gpu/drm/drm_dp_helper.c:147:51: note: while referencing 'link_status'
>>>   147 | u8 drm_dp_get_adjust_request_post_cursor(const u8 link_status[DP_LINK_STATUS_SIZE],
>>>       |                                          ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>
>>> Fixes: 79465e0ffeb9 ("drm/dp: Add helper to get post-cursor adjustments")
>>> Signed-off-by: Kees Cook <keescook@chromium.org>
>>
>> Using DP_ADJUST_REQUEST_POST_CURSOR2 has been deprecated since DP 1.3
>> published in 2014, and Tegra is the only user of
>> drm_dp_get_adjust_request_post_cursor().
> 
> I see POST_CURSOR2 is used here too:
> 
> drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> 

Looks like we read and parse that in the admgpu driver without
using drm_dp_get_adjust_request_post_cursor.

I don't have a strong feeling but I liked your original
patch a bit better. I'm not sure what it means when part
of a spec is deprecated. Once a spec is written display
vendors might implement it. We should make sure that
displays like that are always handled in a sane manner.

Harry

> Here's a version of that for tegra (untested):
> 
> 
> diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
> index 23f9073bc473..c9528aa62c9c 100644
> --- a/drivers/gpu/drm/drm_dp_helper.c
> +++ b/drivers/gpu/drm/drm_dp_helper.c
> @@ -144,16 +144,6 @@ u8 drm_dp_get_adjust_tx_ffe_preset(const u8 link_status[DP_LINK_STATUS_SIZE],
>  }
>  EXPORT_SYMBOL(drm_dp_get_adjust_tx_ffe_preset);
>  
> -u8 drm_dp_get_adjust_request_post_cursor(const u8 link_status[DP_LINK_STATUS_SIZE],
> -					 unsigned int lane)
> -{
> -	unsigned int offset = DP_ADJUST_REQUEST_POST_CURSOR2;
> -	u8 value = dp_link_status(link_status, offset);
> -
> -	return (value >> (lane << 1)) & 0x3;
> -}
> -EXPORT_SYMBOL(drm_dp_get_adjust_request_post_cursor);
> -
>  static int __8b10b_clock_recovery_delay_us(const struct drm_dp_aux *aux, u8 rd_interval)
>  {
>  	if (rd_interval > 4)
> diff --git a/drivers/gpu/drm/tegra/dp.c b/drivers/gpu/drm/tegra/dp.c
> index 70dfb7d1dec5..f5535eb04c6b 100644
> --- a/drivers/gpu/drm/tegra/dp.c
> +++ b/drivers/gpu/drm/tegra/dp.c
> @@ -549,6 +549,15 @@ static void drm_dp_link_get_adjustments(struct drm_dp_link *link,
>  {
>  	struct drm_dp_link_train_set *adjust = &link->train.adjust;
>  	unsigned int i;
> +	u8 post_cursor;
> +	int err;
> +
> +	err = drm_dp_dpcd_read(link->aux, DP_ADJUST_REQUEST_POST_CURSOR2,
> +			       &post_cursor, sizeof(post_cursor));
> +	if (err < 0) {
> +		DRM_ERROR("failed to read post_cursor2: %d\n", err);
> +		post_cursor = 0;
> +	}
>  
>  	for (i = 0; i < link->lanes; i++) {
>  		adjust->voltage_swing[i] =
> @@ -560,7 +569,7 @@ static void drm_dp_link_get_adjustments(struct drm_dp_link *link,
>  				DP_TRAIN_PRE_EMPHASIS_SHIFT;
>  
>  		adjust->post_cursor[i] =
> -			drm_dp_get_adjust_request_post_cursor(status, i);
> +			(post_cursor >> (i << 1)) & 0x3;
>  	}
>  }
>  
> diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
> index 30359e434c3f..28378db676c8 100644
> --- a/include/drm/drm_dp_helper.h
> +++ b/include/drm/drm_dp_helper.h
> @@ -1528,8 +1528,6 @@ u8 drm_dp_get_adjust_request_pre_emphasis(const u8 link_status[DP_LINK_STATUS_SI
>  					  int lane);
>  u8 drm_dp_get_adjust_tx_ffe_preset(const u8 link_status[DP_LINK_STATUS_SIZE],
>  				   int lane);
> -u8 drm_dp_get_adjust_request_post_cursor(const u8 link_status[DP_LINK_STATUS_SIZE],
> -					 unsigned int lane);
>  
>  #define DP_BRANCH_OUI_HEADER_SIZE	0xc
>  #define DP_RECEIVER_CAP_SIZE		0xf
> 
> 
> Is that the right way to go?
> 


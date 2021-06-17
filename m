Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2584F3ABC8D
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 21:20:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 445EE6E98D;
	Thu, 17 Jun 2021 19:20:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2044.outbound.protection.outlook.com [40.107.92.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BD196E98D;
 Thu, 17 Jun 2021 19:20:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JUMViC3o1H7K0035ynZzt7e0winApUbpIqx3hoiTT8bLgpq+d7hfYhDSwoJKgaK3hM+3QYghP4Ol/HRhPPqeOBQ5vmcmHuaBME7dzhy9fLeT70bopueiIGX6+m7VkZLECanYKY8eMMjaZUjKf9W6mes6l7V1+GUELxa5vz1QQVxlts20BXPYcGvqPRSlPoj62Tqj5SS4kUfOIzfr2prqprh2i4ROx5Cvx//5eA2xg+hIjx+QWwU1LM9yvvH3aYw18sT4rU3HCyJNWZ3e30hf3UM9sRisEdYj2PU9jJAEQe6en1AFNIE1DkdT9uxtb9a7S+B7+Kmf4QKStkykFRmzDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u2ObTEGTsilruZ17kZmsZJ7zKfBIc8BCnqo9sOiAX/0=;
 b=lcq+4w9ZyEPV7z+De5cfjQBfyd/P9x6C7qERMxPv37DmMDkoyZhQQUhYRySZoeyV442PAnHNOv/sZhYLRhiKMuLkAIbpU0L6UycREynP/E3VQRydyG3LXEZp3fhHY7O/Js8wc4Q4nK4Igg5Fj6PyFX7FGWzCWygZazXOIwOrpDCp/9y4ix92QwJFbCzo4TqTMZ4VU5FgBNK63swlotc8ja819oURCxbhTIsZfsZMVHbmtLxvejd9lrW0X72a4ooZN9wVcEwuJO/g1qhZ3DZQwbZNL8eB9eb3U8bxk8bfVe+UJkADbv78vVHzF+4Ue5b0RMMcAK/AFUTMLGYLQKAAYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u2ObTEGTsilruZ17kZmsZJ7zKfBIc8BCnqo9sOiAX/0=;
 b=vfNe2iTIvFpu0eNNpUokGK9G5nsAqJ+67H1k7xSNv4aoAtX8zLx1XL8APRgvq1cHyA5B/3ZG80n3W1PJoFqyYj7eMlG5Ss6Nl1q7xW2llPrLL+jEZ245/IyJk8MHlVhHg3CJvyXOsaVzqPFBXVw8+7NDLE0B7zHQ453g20BUUqw=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CO6PR12MB5412.namprd12.prod.outlook.com (2603:10b6:5:35e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Thu, 17 Jun
 2021 19:20:21 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::401d:c7a2:6495:650b]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::401d:c7a2:6495:650b%3]) with mapi id 15.20.4242.021; Thu, 17 Jun 2021
 19:20:21 +0000
Subject: Re: [PATCH][next] drm/amd/display: Fix fall-through warning for Clang
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>, Leo Li
 <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20210616205206.GA17547@embeddedor>
From: Harry Wentland <harry.wentland@amd.com>
Message-ID: <3e68b60f-a9af-1f58-076d-1d348e3bf892@amd.com>
Date: Thu, 17 Jun 2021 15:20:17 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <20210616205206.GA17547@embeddedor>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [198.200.67.154]
X-ClientProxiedBy: YQBPR01CA0060.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:2::32) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.50.3] (198.200.67.154) by
 YQBPR01CA0060.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:2::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.16 via Frontend Transport; Thu, 17 Jun 2021 19:20:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 04c560a6-b5d8-4297-3594-08d931c4f345
X-MS-TrafficTypeDiagnostic: CO6PR12MB5412:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR12MB54128C174CECE6FD88E04E7A8C0E9@CO6PR12MB5412.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YFUudafZVgDRuyTkmI83wNo5EfWeI5JVpO1epUnl0dpcddAHFRPtXMyOH9uskJryk0frIpwe3Rueq4khDeno+UWHCz9XqA4fD0RbLxJkNGMBkTHDtDm4uSxCX9d3/1589qvdiXaexwvB2724dToJafT4FvMsR4ktdnE2ZGgbAdTVpjUerXjy9433/ZCSfjw87VD0MVaEpi3XYS8XA6kQm4QiFjgFvs6cMWYno8xV5vYEqUK76f8MKy0j5FMItDXx/g58ZOBT2hJkfWHJ3Q4xbALcMmF5nDDIquUt35q5bMH0BS8ZSUrPj0a/T0YrQe+3DpSxYfatuOr7utKNqhw+nUd5FsZoSj0lQAlX6CaPe0Q7vzjovJxB6ieTzrVupPrvB4cjrMEBGDnijFuiOwUbrRqlw1esP/1eNIVTcmpqdUY4ijh6VZLUBCOVSqVck0RgSv8Y6ncKlPV1RSBfzwtrXHEn3RWXr236gYFW8Za2zGVHEfBwfwGNSliS/yeH60Dn9P0FUvKs6yjq58SyxP/PVEHmaGPtZBJzYLEPlrAWDyKPKuvOcgEl+D29o2vy2yoj3GurPaNaTVwq0Vjk25c2PTQql/M0tjVf96++OBFIUpsQ/dwmk4EkWQVHjAjJmcTkeaHIghPwiMwePMehBIFrql77rpE/BF2YB9tv3UZAZFEjbfcAI84lEX+Vzn9O7VfiVXHuG4qqXafj37GeMzEuZmZGGNtc4K7K6urYBeKXCAfRqKzca6jgOAKUaQxyvgtJhBJlOQthnBbUrHouWtQm2BYeTHeMUGyO0tffyTiPVivxG42E0xECiEwLVV3pF1/p
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(396003)(136003)(366004)(39860400002)(2616005)(956004)(26005)(66946007)(36756003)(53546011)(478600001)(44832011)(38100700002)(8676002)(6486002)(66556008)(31686004)(86362001)(6666004)(2906002)(186003)(16576012)(4326008)(5660300002)(83380400001)(31696002)(316002)(110136005)(966005)(8936002)(66476007)(16526019)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VnJyUTB6bHpvSnQ2RExPSE4wbWVscDU4ak5hazBCUUs3VnlQUXM4MmZnVkpY?=
 =?utf-8?B?TGV0T3pmTlMvQnkzdFgvdDhzVHh2QXRJTWNtdFp5THIvVWhyRXZvMEZxelNl?=
 =?utf-8?B?elk1dGlYNzJkSWZpU25PMUh2TVJod1lJQkh0WUx1dGFXcjRkMTNxUDU2R3NF?=
 =?utf-8?B?WEI5ZEhEQk9BYWdZdmthQzhzZG1QaFc4UFpPZnlieG5YUUhDZisva1ZvOUYw?=
 =?utf-8?B?TlJMY0ZOMnZBNUEzZnNYZDRob1RqaVlvclNIYWVsdms0UkNIeVRxQ21TOW1H?=
 =?utf-8?B?UEZxS3NKM0tNKzdFNmRaMFAzVTZKWStqb0p0NWpyMEhPNDkzeUF2aTkzeUxG?=
 =?utf-8?B?MVJXTTN2Njk4Z09GelArcGlxdktLQmpLeDBFQTBOcmNWOHBIODZvUFI3cG41?=
 =?utf-8?B?N0YrQzNjaEtuM2NJSVA2dlp2anJiR1EwUGFVZDNmcjU5LzVrT0p1cE9QZVpz?=
 =?utf-8?B?RW9xMXlVZGwwWmRDMUNaaVFlQ3VLMGRGSTJZMnZDVXlEczRmUU1oQXBxUWxK?=
 =?utf-8?B?bEFYcUxoWGJrS21SWEQzT3VoS0pmUlJLQmNMbGxuNGNXTG9ITXJtVXdXZWdz?=
 =?utf-8?B?dHlETU5RTUV6dkJpbzk5M0FlN0k0TXNSY1FtR2RXallCWFNtS0NOeEFrMnpy?=
 =?utf-8?B?RHM4YndYQXZWbGNPS1hyR2EzZVc0c0V3V1NTd0pUR2V4aGtGeFRPVDhrRFA1?=
 =?utf-8?B?dnlKVGM2NytIc0xheURJb2RiQzgvK3A2R01yQm9rU25pYnl6Tjg3aHdZaXhE?=
 =?utf-8?B?cFcvWlYwdEtXcVRsTmsyeFpQN1hpVW5OTGlJWWVId09Na3JPVGJzYVYyYkd6?=
 =?utf-8?B?RXJkS0ZJa0N5NmZXYTFFdGN2SVhtbFhjTEhXTDB1am12V2hEZS9DdUJqcFdr?=
 =?utf-8?B?QTFGOEZxZzgyYThPSk81eW9IRFBwbVJvN2I5OUFLb0JxTjdXWVZVakZ2YWts?=
 =?utf-8?B?R1BHRTV5WDVGSGVldHVOUHhMUmpOVnYwa01RSVlraFBjbGxTV3YyTmZDN2F0?=
 =?utf-8?B?cTNqSmZjN2xVQ2dVT25CQjVnSjJLVnR3c2R3Y2ZKdTgrRis0dUFENTljbVR2?=
 =?utf-8?B?b0tGVWlHQmtZMm05ZEdkYUhSZWNUdkFEU1RoMkxnWkhnOUxhRk40TnN4T1dO?=
 =?utf-8?B?M3dnalRpOW9CMW41MVlWQVp0NEFxZ0FSVHJwdlFPMDlmRjV0TDFBdmNRYUhZ?=
 =?utf-8?B?ZTZsbUJTWVFPNTM0WXVpOWwyTG5GMU9Nc2w2N2dqWU83RlNJcDh1dUdwRGVE?=
 =?utf-8?B?Q3JHandGRVlwZ0JFai9RZ0UzUStVckhkRlNtTllrSGZYeXg2MGsxWWFZZFlC?=
 =?utf-8?B?WXJxN0VJNWRZZGR3SDdvOHpLaXlnbXhKbit2dnQva1owNUdjNmFtdmxWQjNE?=
 =?utf-8?B?T25hS3NZeHZBR3NKQXYraFRhSHQvcVdLdVZ1aDlKUEJudCtNUis2cloya2Zo?=
 =?utf-8?B?d3FKNnlCZmVjanptV3lZZnkwOUtVZ3orQVc2ekdPdFJkd3g1a00xTWFKVHNU?=
 =?utf-8?B?anJtTkljYXg3bk9DMlZPVXNhckhUUnZxbnhRanplaDdpZHJFMk1RVFpVRVFa?=
 =?utf-8?B?K3RNUjJmUHhiTHBHMFF0QURyMHJNUWlxMk1tMmszbkpzS01LaHUzUjBkN3R4?=
 =?utf-8?B?ampWWE5UWU40cEJGNVNtc0xOc1RaL3lXYTVwTjBoUmRyQms3UW1jdGFWeGpw?=
 =?utf-8?B?YnU3V2lYZ0FONG9BWFdmcXlaM0RtY3RwNkVWTHBJd09jb2I2VjRhcFZmejFJ?=
 =?utf-8?Q?Yk7t09/rxKIHP2gfp0nc8WKIDQiegifcGBZ/N5x?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04c560a6-b5d8-4297-3594-08d931c4f345
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2021 19:20:21.6725 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YHksQ1Ck01/mk6aZe12MF4EgaS+eZCXYcFMUIPdYNbDV/tOQja/G/pzJQ2rvtu3HM8Eou9ohykW4+YInBsR1YA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5412
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
Cc: linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2021-06-16 4:52 p.m., Gustavo A. R. Silva wrote:
> In preparation to enable -Wimplicit-fallthrough for Clang, fix
> the following warning by replacing a /* fall through */ comment
> with the new pseudo-keyword macro fallthrough:
> 
> rivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_aux.c:672:4: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
>                         case AUX_TRANSACTION_REPLY_I2C_OVER_AUX_DEFER:
>                         ^
> 
> Notice that Clang doesn't recognize /* fall through */ comments as
> implicit fall-through markings, so in order to globally enable
> -Wimplicit-fallthrough for Clang, these comments need to be
> replaced with fallthrough; in the whole codebase.
> 
> Link: https://github.com/KSPP/linux/issues/115
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
> JFYI: We had thousands of these sorts of warnings and now we are down
>       to just 15 in linux-next. This is one of those last remaining
>       warnings.
> 
>  drivers/gpu/drm/amd/display/dc/dce/dce_aux.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_aux.c b/drivers/gpu/drm/amd/display/dc/dce/dce_aux.c
> index 28631714f697..2fb88e54a4bf 100644
> --- a/drivers/gpu/drm/amd/display/dc/dce/dce_aux.c
> +++ b/drivers/gpu/drm/amd/display/dc/dce/dce_aux.c
> @@ -668,7 +668,7 @@ bool dce_aux_transfer_with_retries(struct ddc_service *ddc,
>  				/* polling_timeout_period is in us */
>  				defer_time_in_ms += aux110->polling_timeout_period / 1000;
>  				++aux_defer_retries;
> -				/* fall through */
> +				fallthrough;
>  			case AUX_TRANSACTION_REPLY_I2C_OVER_AUX_DEFER:
>  				retry_on_defer = true;
>  				fallthrough;
> 


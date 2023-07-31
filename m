Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B77A7699FD
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jul 2023 16:47:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA99B10E2AA;
	Mon, 31 Jul 2023 14:47:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2067.outbound.protection.outlook.com [40.107.243.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A27610E088;
 Mon, 31 Jul 2023 14:47:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eZvaMkSfkcR9GZHkQOZZkeG/9giqPvHCiiB/U+mPg2CGLgv7eKatjOVPweToAhT7tL8VbvQ+i2HwBWvZC9ne35jnDc+XseVsycuw3WqltZNnKfo8ZSBKuR3GG2AgwTH1+Rgq1Mk2MG99GEBuRMapbRMsoCsNZQHR9XYs1QhV6RNEaRuICwq8s7BIZaiqumFHRpaWLlHdSKJ9mF90SVmBZuIZxmpAZPdYMHGBvMzng7SEpjBVLs8/H8Hveng0K7nMT6rBXpAfOZaqh5ecXXAYdG76TOxOqcjnjuEwgR31p/t6VebpkrU2KyyTSJMMGerM6Ho5CXZQ+/NBe1zskMlgDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OPWCFzesULuyH/0Zl+eQEhp0v9fDnvycuBXLFIiMP6U=;
 b=ZutwfWfl7EEvv3v83aSvNJEyG2CuX2WnIJUeM9+yqgMoXsr/XMtzVTmBlzPYiIDGXbmM03tNj8ckD/fXXvfCQqB9bQ2e5mPr7rY/IBvqOohxC0bUpmC7SS86Sa7LSXnkTC65hUl5S6uXFqbCKL1dOD4My5C8sSB4dzwuVKZ6KJ+/7Vm13MG2UELDED0PkKnZq/lGgqaYvTRBI4UsS38YKf0/fDDhjF8NA8G0JJyw66Yg8Iqn5dUCl7ea4z3EEnZQ1GNI70lmK6j/WYAE3srzwoS1yUBEgPFNwbqPJz7ivwQUsquuhEyVRp09JPx7uN5xl1cWcKGsqsE/y7uTiRu47g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OPWCFzesULuyH/0Zl+eQEhp0v9fDnvycuBXLFIiMP6U=;
 b=rkGmGbe3Wvszbpne3MTy39mIaa+11pNY/Cch+zwcU94U75aGVnZ93yNA7KGAtTOmSxbXcO50mXE8ELIkNRkrVkmHt210CIY74x/9nCAf/QikQCNkZCho0J8oECyXwXJlNSqXnenYak9XTl5w+HYEYb0bwUP6Uh3pKBcdPafCBGw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by MN0PR12MB6029.namprd12.prod.outlook.com (2603:10b6:208:3cf::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.42; Mon, 31 Jul
 2023 14:47:18 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::236b:d4e2:6fbf:6c2b]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::236b:d4e2:6fbf:6c2b%4]) with mapi id 15.20.6631.042; Mon, 31 Jul 2023
 14:47:18 +0000
Message-ID: <4d633371-4505-4f13-bf5d-a2a3e56576cc@amd.com>
Date: Mon, 31 Jul 2023 10:47:12 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: check attr flag before set cursor
 degamma on DCN3+
To: Melissa Wen <mwen@igalia.com>, sunpeng.li@amd.com,
 Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, Bhawanpreet.Lakha@amd.com
References: <20230731083505.1500965-1-mwen@igalia.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230731083505.1500965-1-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0234.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:66::10) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|MN0PR12MB6029:EE_
X-MS-Office365-Filtering-Correlation-Id: 8483c2f7-d5fd-48e9-a84a-08db91d509a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H3h0f+sa4Zh5dp9l0ucEiVRG+5u+PCC3kbplww6A08QdtP1THLuu1vfgE/Q/+j08bwlmlJ1qNx4uuzLUR2kZ7OaCl+vr99Nk663KufEl8ivslFhybLzTgK0co1c1eDgyWt6T4ukLuoX1xqF0A1zEXslSO1iv/TbOdYy2cHJfxJtfwAq3YCtTZkjgY+68bQ2W9me1+3n4G45m64pJxahSUVEUnZ+VtJhSf6fvQSkyaOOXIgHw+8R5SXD0azPqeKV9rB80czsCWonWZ84IIe7tqk46+WxS7j5bsD6LERIaqGqA9/EZAKWDtwae7Q8dXnypIxe3qUEjgWVNLDEcJBwcQTtpcBRXQhi7cakGJMVKkaYC8PXAJEJ8RJWZwQf4CFUstUrMPBU/+4vnDaOkTWe09WTctrvOPrRn61BWy5NKbTbg1ZEBK79zPQgROFO70gKwlJ5fsg1o/nyqqVsgDNdkL7/0LrdcO2GK8blTp5m4VrAsQxxFVv9TSXsTlGZTW6TI+kkI0PKyrZU69mbgWGq6RtWpmKMLn4iWUKCoxyfzEpuk17MufvaCxj2Bl3sYKl8IWcLZ231Ye+lQfKfj446XYtGgaAEcls6lE//OCmX1qV4/lLVBTKAa8S3SrE8DD9W/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(39860400002)(346002)(366004)(136003)(376002)(451199021)(38100700002)(31696002)(86362001)(36756003)(6512007)(966005)(478600001)(6486002)(6666004)(2616005)(53546011)(186003)(26005)(8676002)(8936002)(6506007)(44832011)(7416002)(5660300002)(6636002)(4326008)(2906002)(66476007)(66946007)(66556008)(54906003)(41300700001)(31686004)(316002)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UzFNM1gxZktBRktNeHFyS3VkdVdxNUdRZHQrSHA4M3NYYWhIaWlINDZ2SXUv?=
 =?utf-8?B?WkUreFpyRlVxMloxQ09EN0lmcmRDZGpDbkhGakpKMndWZlVUTzJrMXFpS1VX?=
 =?utf-8?B?b1RJQ1MyNnZnc3g1Y09GQ3RaSXV6TS9aQTh6YzBTUlZia3BRYTdtbThXQll5?=
 =?utf-8?B?ZHRoYlRjcWduMkNocDA3ZjlqZFFIWlYrdGVleDQ1eDh1aDc5NlBYNXJYWDJW?=
 =?utf-8?B?Vmp2SXk4TThRdXphRUM1LzNzc2h3SzJET2d4dDhUcWFaVDdONlJCVDFicSs2?=
 =?utf-8?B?M2syaWk5Yzl2RUZGVWxFNUpreHRvWTdJNzVNU054NXVvRlJPNXNZQ2NFcjcw?=
 =?utf-8?B?Q0tzTGpYd0JLZk41ZnZVd3BzTnlGcnFWT1B5L3Y4S1Q1Qk5MbUpmRUN3bk1Q?=
 =?utf-8?B?NEVnbGt4RkFFMmVmK3RCSGo3TzNBWVBGcHQ3U1U3ODFqUm5zdkFrZGcvNGRN?=
 =?utf-8?B?QktFdDZuakMxTVlxZ3ZLWGFtYkFQL3N5SGRjb2dpMTZFL0kvVzNxdnhCR3BD?=
 =?utf-8?B?ZG1PK3F1akk4T1psd2JJU2pyWFhTVGhyTVBBSmpzWHcvZ0JTWlB6Nk5MTklV?=
 =?utf-8?B?ZWJ4dk02MHpzWXl4TGREc295NEI2NWl0U3hlbnBGWWdicDh2VlFzckZBRWdJ?=
 =?utf-8?B?RUZ3OSszZngrWFBsRStveVR3NzdtY0tKaVZBdU9uY0xHYitTWU9OWHc5dGdz?=
 =?utf-8?B?cFpOb0dHU2twRW5jQUFoMll2OE52SzlJWlBqZUhpY0xvNmZvR21oWG1ON25Z?=
 =?utf-8?B?aXg4eVZZWTJicnRRUk1QRW44cndUZ2Zpc3RRMEgrT3VCeUgxbStBV2hkaVls?=
 =?utf-8?B?Y3V4MWphZ04zcHM0TnF1NWQ4RkdhNmQ0T244SzE5cTVsM21FaW8zUVNYQkUx?=
 =?utf-8?B?SSt3ckdKMDdRSHB0L1BPQmZoYmxaZDIwaGcreDhzSGxqSXZtTUJpbmRmSnIy?=
 =?utf-8?B?aHVVS3A4RUhuQkJUd1pLZURQZGJMZHM0cVdCQmR0cUJjQjUwbVJnWm9xdnVG?=
 =?utf-8?B?ek0vN3F0a0hzUTUvK3JGOXhkWDZMQ3JjQ1RrZVMvRzhaL0I4YzdoY1lXSFN1?=
 =?utf-8?B?U1JzSUpGVmovUFpOWjFYVjUzN3NLQ3Z3bmZRbVdUT0FLUDhGYXZXellaWkpJ?=
 =?utf-8?B?SzUxbkJuamYxU2VEb3QvQ3B1alFIenRKTzlvVlBTRml4SEJXdk9Xby9zN3B4?=
 =?utf-8?B?UEV1UjJDTmFXNXFYSFA0VkdmS3piZlVZeVZLeFFTVmEwbVVnQzRyL1QvcnRh?=
 =?utf-8?B?U3I3cUp2Rmp4TWdadDI1cXVFY0srV3M2dWlSWnlEdEdwZXBCVlRjK1BMRDJD?=
 =?utf-8?B?RTJ0d2hOQ1FzTUFpekhGZXIrUnE3YzZyVDM5RGxLUGhqSmZ5YXM3TVFpclQ5?=
 =?utf-8?B?NVh3aENlaG9MVVNxNDh1RHdGeEhzRjlpZmx0MitOZ1VubGViaTZkT3dIbjgw?=
 =?utf-8?B?dTdIM1lhK3JlM3NDT2pHR0NtNjZiUmNxaDNRbTBzSHMzSy94UlNvWEZxQmh0?=
 =?utf-8?B?eXJva3NrU21sZWh2SHZGNzhJaHVIKzBiNFRkY05OYU1rNUtKbWlBTDV1bTVP?=
 =?utf-8?B?Mk5iUWhsUXo1eDJTU1hYT0NGYWVtU3pRV3FOVVlITDM1clJ5aXZSTzJWZFhr?=
 =?utf-8?B?UTZVWEVDK1RjM29QY2piU0V4dkUrUis2VmZCMU1sQ1E1blF5djRpYUVEVEFr?=
 =?utf-8?B?ZEwwazFYa3pWMnF5aUQzUWlJTVd5Y1Y2QjZ3SnVBVDdIUXp5N3VjSmVqcU5C?=
 =?utf-8?B?cXJvcmNPVitZNVhwdFl3YnRWWmxwNFdkaVEvZiszeGxabE9kM2kzZlRwcXdh?=
 =?utf-8?B?MmRtMElHZEMxL2Z4U2ZUTVV6OFE2cnNxcUd6Y1RlQ1dhNnBUbkpUUGNLcUxi?=
 =?utf-8?B?SklBNC95VlJ3QkRJblVnWkdHL1dlTGd4VWFaWng0YjlON2RtaG83N0JydUN4?=
 =?utf-8?B?ellJT0w2OXh6clE4MTFhRTdMaXg5UDFjemVnK2lXcHY0THFIQTlPaWZiaDFJ?=
 =?utf-8?B?TktkWUhCS29tdEFaQW43UzdyRHBuazNqRjQ2M2pXVEFLYnlTVEE4cGU5KzNF?=
 =?utf-8?B?NUVGVVJHK2tiNmt3elhjVUNiUm9odTZJZG9CVlFTNzdMUWxxUFZzeE9TU2Z6?=
 =?utf-8?Q?Rl6Mf/QJmFD+IQFngbA2SDrRX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8483c2f7-d5fd-48e9-a84a-08db91d509a5
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 14:47:18.1669 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E3z5IFTMgAQ46XDP74U0l7aUuyWYrEwZJ67m2csIv9oPsDK09EVthCo/Vr9LcyCmBQf5qUsYUpQGP2bmCmHtXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6029
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
Cc: Krunoslav Kovac <krunoslav.kovac@amd.com>, Alex Hung <alex.hung@amd.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, amd-gfx@lists.freedesktop.org,
 Michel Danzer <mdaenzer@redhat.com>, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com, Nicholas.Kazlauskas@amd.com,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023-07-31 04:35, Melissa Wen wrote:
> Don't set predefined degamma curve to cursor plane if the cursor
> attribute flag is not set. Applying a degamma curve to the cursor by
> default breaks userspace expectation. Checking the flag before
> performing any color transformation prevents too dark cursor gamma in
> DCN3+ on many Linux desktop environment (KDE Plasma, GNOME,
> wlroots-based, etc.) as reported at:
> - https://gitlab.freedesktop.org/drm/amd/-/issues/1513
> 
> This is the same approach followed by DCN2 drivers where the issue is
> not present.
> 
> Fixes: 03f54d7d3448 ("drm/amd/display: Add DCN3 DPP")
> Signed-off-by: Melissa Wen <mwen@igalia.com>

Thanks. Good find.

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c
> index e5b7ef7422b8..50dc83404644 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c
> @@ -357,8 +357,11 @@ void dpp3_set_cursor_attributes(
>  	int cur_rom_en = 0;
>  
>  	if (color_format == CURSOR_MODE_COLOR_PRE_MULTIPLIED_ALPHA ||
> -		color_format == CURSOR_MODE_COLOR_UN_PRE_MULTIPLIED_ALPHA)
> -		cur_rom_en = 1;
> +		color_format == CURSOR_MODE_COLOR_UN_PRE_MULTIPLIED_ALPHA) {
> +		if (cursor_attributes->attribute_flags.bits.ENABLE_CURSOR_DEGAMMA) {
> +			cur_rom_en = 1;
> +		}
> +	}
>  
>  	REG_UPDATE_3(CURSOR0_CONTROL,
>  			CUR0_MODE, color_format,


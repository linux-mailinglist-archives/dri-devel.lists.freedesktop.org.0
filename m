Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD0797CBF8
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2024 18:03:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CCC610E0E6;
	Thu, 19 Sep 2024 16:03:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xrgoDIHi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2071.outbound.protection.outlook.com [40.107.94.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76B2110E0E6;
 Thu, 19 Sep 2024 16:03:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sNqUCgqw5tpoI3pXNCv64XgFRFWUWb3m7pmGednujWep0NkRmD908NgGSBPZ9qgtOjgr7/4HcZV/BpscAjJSwWR5dsiPV9P/GGpN1acuMQLj8MYInzZPaIBrnXpK+PDF7JBFzpkmIdrQZgwlxgpQsuLuLsypouTgGF3viTem33Ys0Oai3Thy/J8yETaNWjm8mCPzry04KzVB4FRvLPgKX4KYHzH6ZAIu+5JDRMy+8y5Iy+qOvgGOcBQCfxjuZ23SY0mx3Yc5y7zFmHNxwdAcNW9QafuZgHXs8QlYtI3F9rx5HmptBTzlxAPVeP7MvhxBpQowBXenMhS8onUwzXdrHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hZZqdo1AmTHZECkvY+ed3KGk5o9ZPhBMd9hoPSAgLGs=;
 b=J4nAAV2Jv774PYLMDWMotmMH6+UCG4RYtA6a9WgWwzabF9BWmfcYA77NrAheYwnxpoBDPr9wZMeiGQyelE+rSjRdqU2ye8KijiggyoFujCQEjVQa8qhq+Zk4TJn4xua8O1qpDUiIuE1kUNu0EJsJPSkg09GwQyZ+equnMClCdKKHhGTyD4yAIUtaqTm46vtuPzHPCohwrUB9gEiHkQXxai60L4lhN85PQaNs9mmnZGMAESsag2fV41pUhfBjpxvv12+B7M96q1ge12uXhmRJxteuDF8r4hUrXZzwPkp0M/lpu4/2KPi+AvzorPcgQh9/9vvb4oGTkWERemRI8uJ+Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hZZqdo1AmTHZECkvY+ed3KGk5o9ZPhBMd9hoPSAgLGs=;
 b=xrgoDIHibymtATfOysxcpcQaO/pbRqrSVS7hH3JaIHd+kvxcMcvC1cbKvuh1MCoRr1YrugOI9WYuni/hm+vrzbpcTsuNGcK4OcP7P5SdS2ckWybut9fp+j6VTU4kxpNGa+L4k6uLF7LcRjkJ0+GCp9Ty/pzq1Yab28ybLX5uYXg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH0PR12MB8486.namprd12.prod.outlook.com (2603:10b6:610:18a::10)
 by LV3PR12MB9142.namprd12.prod.outlook.com (2603:10b6:408:198::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.17; Thu, 19 Sep
 2024 16:03:48 +0000
Received: from CH0PR12MB8486.namprd12.prod.outlook.com
 ([fe80::cfe7:2803:1f0b:a8b4]) by CH0PR12MB8486.namprd12.prod.outlook.com
 ([fe80::cfe7:2803:1f0b:a8b4%4]) with mapi id 15.20.7982.016; Thu, 19 Sep 2024
 16:03:47 +0000
Message-ID: <77b34bd2-3727-42bf-aa0a-4f24ad7232cd@amd.com>
Date: Thu, 19 Sep 2024 10:03:43 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 10/10] drm/amd/display: Fetch the EDID from _DDC if
 available for eDP
To: Mario Limonciello <mario.limonciello@amd.com>,
 Alexander Deucher <alexander.deucher@amd.com>, Melissa Wen <mwen@igalia.com>
Cc: kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, harry.wentland@amd.com, sunpeng.li@amd.com,
 Mark Pearson <mpearson-lenovo@squebb.ca>
References: <20240918213845.158293-1-mario.limonciello@amd.com>
 <20240918213845.158293-11-mario.limonciello@amd.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20240918213845.158293-11-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQ1P288CA0021.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c01:9e::27) To CH0PR12MB8486.namprd12.prod.outlook.com
 (2603:10b6:610:18a::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR12MB8486:EE_|LV3PR12MB9142:EE_
X-MS-Office365-Filtering-Correlation-Id: 465f8945-1f0b-4037-bf7d-08dcd8c4a4ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MnUxYnI3dHhZSUtCNllPRXF0ZEFPOXVZVmxBbkN1UytWTDNtM2lXUThGYVdp?=
 =?utf-8?B?N0x2YTBEYUFVRnVka29PR1ZXc1RCMGRLa3JsaFk1OEd2UW9tcjdXc2Zrc1JM?=
 =?utf-8?B?UUFuOVluT1ZzZlBGaWx1REJlL1Y1ajFKMXJyUm04bEdsR3paWkluMkdYRllS?=
 =?utf-8?B?RjdGekhWKzRoVk1kSjA5Zk1ic2VzZngzM3dzdW4vc0s3emFzbW9VK1JBTWw3?=
 =?utf-8?B?clBxaHgwOVhVSTFRTllTbDdCTTg1YTZ3Zi93ajljRm9lQTIvbGJXcjRndWVk?=
 =?utf-8?B?L29HWmZPeTQxcXNkOVE4Zi8yWW93b0VpOVpvb2lrSDVlRTRTVEplc2hXbWcw?=
 =?utf-8?B?OTJETE5CS3g4MzFycTA0QmVscERZc21WMWRSZWQ5N05pTnZhRUlFKzZ5cm1r?=
 =?utf-8?B?ZGRpTmtORXJkWXRpMW9mTHhkNkFBTWZYYzVjVExiMTVHTzB6cGIzOEp6NHVr?=
 =?utf-8?B?alFLMEN0eE5XTzlCVVJKaHQ1M1Jpc2NDK29NSzM1ck5NYkxNYjRJdlFZalZF?=
 =?utf-8?B?cHY2SEwweEFDdXpzdEIyWThCTTgvajQzeUEvM3hwcm8vcHN4cFI3eXRlekgy?=
 =?utf-8?B?MkdXMW1KS2N5NXBvYkY5akF4RFdrb2ZBeDJ0NHN2b29DV0hWcE5GOWdaSGlr?=
 =?utf-8?B?Q2NmYnpOUUpaQ2dFYk9JOEpZN0xHUDdhdmRIUnhZRHZ0V1dXelR5MDFveSty?=
 =?utf-8?B?NFJlTUpmT1pGVFBNSkcxaHlELzRMSzRuUXBZMk05WG1LYUxIcjNyY08xNVRO?=
 =?utf-8?B?bGJ4OUp4Q1o0MGF0WWlienhjRHpUWk1QWmd0ejBld0dhZm5xWXRQYXhRWm9x?=
 =?utf-8?B?U0xoYUMrY2ZIbG93cUQ2ZlJkZndlbmhPRy9MbTh6SWZsK0FrS2FFUVdFS3dZ?=
 =?utf-8?B?bWUxNGtjdUhtTWVZbXByZ25JTUFkY3prY2NaQzB6SG42cFZqbUIwZCtYVGJC?=
 =?utf-8?B?TmhUVjBmNTRvK3MzMFM4UGJVdUZIRElBZnBUdUFxSndBZXg2bjM3N1FrUUNI?=
 =?utf-8?B?MzFwSGFDcGRCRWErTnVhbFpCcEdISnVJWGovU29qdTN4aExqdTNFOVFKODYx?=
 =?utf-8?B?UUhjTnZuN3FySVVuMnVsSjdRSytkQXpIazJQQjV0Mi9McElJZ2M4ODV2c3VU?=
 =?utf-8?B?NU1XUEJmUDI4cGFRSUhuVUJpVktlSG5CeEUxNTZEb2lhQ05DZTFxdWVScTRw?=
 =?utf-8?B?cDV0YWVXQ3hwdHJMeUpqa2hLbHhmcEVCZE9EcnpCemlobjk5QTJCMlRPVUVB?=
 =?utf-8?B?bzZYTlJ4ekhIUWNCVWJQMzdsM2NQMkxPc09iM1NVYkNQRDlJSkRCVnQ4Mnln?=
 =?utf-8?B?ODlYN2pEWG9XN3pMQ09WVlBRa2JKbGlxK3NSOE1KUUt3ekRGYjNteDNsQW1G?=
 =?utf-8?B?QzZpTzgyQ1c3aXd5eFdDUUtCV0RBdmRnNUxnVTlzR2k2WGtNODNVQzJJa3dO?=
 =?utf-8?B?N21vRndlcEVTQkwrdWFvZnBuQ2JmanpaUWMzVFFnSnVRZmcrcHhHZE1HemRN?=
 =?utf-8?B?U2RkeVZORHUwQWk1cnlHMXNjL3o1eHo5MzlITlRydmhMMENWRmpkemVmZHR5?=
 =?utf-8?B?cFBaTmc3NzNTdmt6UTQrb0VOUTVScDNqNDVzYkhneWo5ckZsc0VqUFE0OTdZ?=
 =?utf-8?B?emhnQ1J0RVlxUENKbXZkVThIWjhpZVJMWldZODJ4ZXpwSUhaN3Q2ak0yODg0?=
 =?utf-8?B?cnJjV3RYR1lVQVplMUhLbG84QzVaWTliN1lrVjRrSkdUYWhmK2hORnJnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB8486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VUN3Q0FIYjRzYXQvNzF6MmYxTWkzQnh5YXlyVGlYRXIyTitQbEVQdTNwSUcz?=
 =?utf-8?B?WmRTRGxXZVpBMG9aNGhKWW4vamQ3U1VlT0VuV1BabmtacEhaRjZLMVdwc2po?=
 =?utf-8?B?Q2l0TUxWRC9TS0ZrTVE0NGpCSkYxSHErQmFnZGZYOWFaUmF5QVhTVk9EK3VO?=
 =?utf-8?B?S0pUckJ6Sm8vcDd2cXExdDB1SmVBbXJhNEUzejJPRmx1dWVRc3VJTUV5N1lS?=
 =?utf-8?B?SFFWMDVYK3Q2MkpvWTk1NGVlRnpjM1FpTVA5T1k5TnhKb2xBWmRFd29vSmFJ?=
 =?utf-8?B?dmJUZy8yaWptemorSDVKbUp4d2NrYlA5SDJnWXYwaU1xaTYxci9yY0xpeU1w?=
 =?utf-8?B?N1ltWEtjVktDejJ0NzcveGhxK0V1YzJHV3NaNW5UcmlUeGlMUzZIeG1KaTI1?=
 =?utf-8?B?VmhYM0kzYlcwTzVDTDZreHdlVWQwazJsYVRxVDhkYThySmphR2E5RGpEQldW?=
 =?utf-8?B?YU5DZFFFY2ljVUhKVHpQWW5hbXprT3pYdzBvVEVEQ1cwVnVIdGl6eUd3bTIy?=
 =?utf-8?B?RUJxNVEyT0RBV2FlWDZyaG90WTNRMVJ6OVBSWXQyOXNGbCswVFVEVFRybk8v?=
 =?utf-8?B?ZElUOU52YUV5N0YrOHVmcmdjNTczMkZHVGZYTWZHYXEyekZ2VVBSdENXMEp4?=
 =?utf-8?B?ZnNHUzFoZkRBSXBkOHhuOG4ycEFQc3J1Z0JsZnB3THlVVmVaVzZBYm55Tjl1?=
 =?utf-8?B?VzRSdE9SYkFKYXpXSmcyaGhIMU5HNzZPb2RCNk94ekYzUVRjZDUzMmx1dFV2?=
 =?utf-8?B?RGFHUk0zMUxENlhFcXFvdllQbmlYazRUK2hrQno0UXl5MEpmam42dFRnMjg3?=
 =?utf-8?B?eDIrdFR6Q3BPUVkrRWlITVlsdHZEL0ZXWG1xWk5oaDN3MWVLcTN1YzNtb1Yz?=
 =?utf-8?B?UTgrOXRBUFpOYnZBWjI0dFdmUDFyUU1OdWord05GYnpBVGNuaGo2Y0dkYjRD?=
 =?utf-8?B?Rm5FWENxU2V3amFoeVRvOEdTQzJXN1BwQ010TTFCWjc4T3hEcXQ0bE4yOWNv?=
 =?utf-8?B?MTVjSXA2M083cjhvTzNhUWFkVnYvYlFFYjU1V1hJSnhVd1ZHUFRTWXNFSWUz?=
 =?utf-8?B?VUZzclYxL2RqYjZPaERYaDBqL29ZRnkwZEdGZ3FKWlZreEZpZThuSjNvbE1i?=
 =?utf-8?B?Q1JiT2ozTFk3Q2Q1MVdra2NubVNoRGp2WFFTV2VQdkpJMDVuNFlyUlhPU0F4?=
 =?utf-8?B?RjdBaUNjZ2Z2QVM4bzRjc2xXNW0wZXRvdWpJRnk0MjBvcDRuMXdsS1plTGl6?=
 =?utf-8?B?UUhQcEwxbklma0FJek5STmRYTWhQTzRRWXF2a2gzOEF6aG9IWG5IQkNkMzIy?=
 =?utf-8?B?d0dXbFhVVjNxcjQ1Uk55ZXl4RThpWUVsYVhxY2hUWlVacjZDRXVyMXBRbFVk?=
 =?utf-8?B?K0tvQmwyUnZGbzFJMkNPSnk1clhpTnNybktKNkM1VE1LS1pNY2dacGxNRExr?=
 =?utf-8?B?cmFZTjVIUWtMcE1Hdm5LbndBU3IwcXhPSnJ0TjdHT1V1aEJqUkNOU3kvZjZG?=
 =?utf-8?B?V3Z4N2Q2RVI4VGpKRkUyRW0zL25Wa0lWNE1yK2xjREpjczdSWEJFNUFuM2E1?=
 =?utf-8?B?WnlMMVR5UVZtcEU3Ni91NFJaOXo4dG43RTVLclhNKy9Sd0JTejFPREJ5clhv?=
 =?utf-8?B?eXZyT0NsUGczSXBiTlJ2aVMycjdVbnBDOGtxbWVxR3QyMzFLeHBIV044YjUv?=
 =?utf-8?B?Y00rSk1YRU1ST2NkRzlDZnZUc3ZLRlM2WXpDQzZhaTNMc3JjK0lJNDhFdHFZ?=
 =?utf-8?B?ay9mS2hzd2RPdHRMc2FXM2xiUEJOdlhvY2F3ODVlTzE1eCtBeitYTEFhSHQ0?=
 =?utf-8?B?anRESTVGWEVxOHZGaG1sRmJFbHBma1F2WDBFTmFDQlhQOFRhdzdBTHNLQlhT?=
 =?utf-8?B?NERpOGxFWWhNQkRRMXdhNlFXOUd5Z0FPYVcwK1l3bHR5eStUYk9MTEltbVI4?=
 =?utf-8?B?c0tKQjN3MDEwVmRqUHd5bURsZkgvNkFScHI3NFlBWHpwcWI5RHB2bW9CZ2lW?=
 =?utf-8?B?dVF4SmlxazVxZnF6dHNUdFlDTUJGS0FDTmZjamdiUlBEL1pTZmNkTWsraUJl?=
 =?utf-8?B?WWd1VHhqV0xRa01Vdm9YNDk5WXV4Tm9rTzZvZ3lCdEhxNEUwMWN1SHZTdE5Z?=
 =?utf-8?Q?yq7Jys9Y8KITGh5TnN2z59HES?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 465f8945-1f0b-4037-bf7d-08dcd8c4a4ef
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB8486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 16:03:47.6973 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w37J2l8JuxC7YEL0ligdOn3+wvDiw2vvTinZSjMSaRnMIGBSJUi3OGKMu7re0/gXaS2mhZ+G1kUFYZSOk41NWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9142
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A minor comment (see inline below).

Otherwise

Reviewed-by: Alex Hung <alex.hung@amd.com>

On 2024-09-18 15:38, Mario Limonciello wrote:
> Some manufacturers have intentionally put an EDID that differs from
> the EDID on the internal panel on laptops.
> 
> Attempt to fetch this EDID if it exists and prefer it over the EDID
> that is provided by the panel. If a user prefers to use the EDID from
> the panel, offer a DC debugging parameter that would disable this.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>   .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 62 ++++++++++++++++++-
>   drivers/gpu/drm/amd/include/amd_shared.h      |  5 ++
>   2 files changed, 66 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> index 8f4be7a1ec45..05d3e00ecce0 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> @@ -23,6 +23,8 @@
>    *
>    */
>   
> +#include <acpi/video.h>
> +
>   #include <linux/string.h>
>   #include <linux/acpi.h>
>   #include <linux/i2c.h>
> @@ -874,6 +876,60 @@ bool dm_helpers_is_dp_sink_present(struct dc_link *link)
>   	return dp_sink_present;
>   }
>   
> +static int
> +dm_helpers_probe_acpi_edid(void *data, u8 *buf, unsigned int block, size_t len)
> +{
> +	struct drm_connector *connector = data;
> +	struct acpi_device *acpidev = ACPI_COMPANION(connector->dev->dev);
> +	unsigned char start = block * EDID_LENGTH;
> +	void *edid;
> +	int r;
> +
> +	if (!acpidev)
> +		return -ENODEV;
> +
> +	/* fetch the entire edid from BIOS */
> +	r = acpi_video_get_edid(acpidev, ACPI_VIDEO_DISPLAY_LCD, -1, &edid);
> +	if (r < 0) {
> +		DRM_DEBUG_KMS("Failed to get EDID from ACPI: %d\n", r);
> +		return r;
> +	}
> +	if (len > r || start > r || start + len > r) {
> +		r = -EINVAL;
> +		goto cleanup;
> +	}
> +
> +	memcpy(buf, edid + start, len);
> +	r = 0;
> +
> +cleanup:
> +	kfree(edid);
> +
> +	return r;
> +}
> +
> +static const struct drm_edid *
> +dm_helpers_read_acpi_edid(struct amdgpu_dm_connector *aconnector)
> +{
> +	struct drm_connector *connector = &aconnector->base;
> +
> +	if (amdgpu_dc_debug_mask & DC_DISABLE_ACPI_EDID)
> +		return NULL;
> +
> +	switch (connector->connector_type) {
> +	case DRM_MODE_CONNECTOR_LVDS:
> +	case DRM_MODE_CONNECTOR_eDP:
> +		break;
> +	default:
> +		return NULL;
> +	}
> +
> +	if (connector->force == DRM_FORCE_OFF)
> +		return NULL;
> +
> +	return drm_edid_read_custom(connector, dm_helpers_probe_acpi_edid, connector);
> +}
> +
>   enum dc_edid_status dm_helpers_read_local_edid(
>   		struct dc_context *ctx,
>   		struct dc_link *link,
> @@ -896,7 +952,11 @@ enum dc_edid_status dm_helpers_read_local_edid(
>   	 * do check sum and retry to make sure read correct edid.
>   	 */
>   	do {
> -		drm_edid = drm_edid_read_ddc(connector, ddc);
> +		drm_edid = dm_helpers_read_acpi_edid(aconnector);
> +		if (drm_edid)
> +			DRM_DEBUG_KMS("Using ACPI provided EDID for %s\n", connector->name);

It is better to always output a message when ACPI's EDID is used without 
enabling any debug options. How about DRM_INFO?

> +		else
> +			drm_edid = drm_edid_read_ddc(connector, ddc);
>   		drm_edid_connector_update(connector, drm_edid);
>   		aconnector->drm_edid = drm_edid;
>   
> diff --git a/drivers/gpu/drm/amd/include/amd_shared.h b/drivers/gpu/drm/amd/include/amd_shared.h
> index 3f91926a50e9..1ec7c5e5249e 100644
> --- a/drivers/gpu/drm/amd/include/amd_shared.h
> +++ b/drivers/gpu/drm/amd/include/amd_shared.h
> @@ -337,6 +337,11 @@ enum DC_DEBUG_MASK {
>   	 * @DC_FORCE_IPS_ENABLE: If set, force enable all IPS, all the time.
>   	 */
>   	DC_FORCE_IPS_ENABLE = 0x4000,
> +	/**
> +	 * @DC_DISABLE_ACPI_EDID: If set, don't attempt to fetch EDID for
> +	 * eDP display from ACPI _DDC method.
> +	 */
> +	DC_DISABLE_ACPI_EDID = 0x8000,
>   };
>   
>   enum amd_dpm_forced_level;

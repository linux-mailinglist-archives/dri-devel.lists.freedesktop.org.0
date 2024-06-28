Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E986091C8A5
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 23:56:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C77310E110;
	Fri, 28 Jun 2024 21:56:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="PKCKbYDs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2050.outbound.protection.outlook.com [40.107.236.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D464F10E110
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 21:56:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aiMqCqjpr9bpNxTSjx3DkyTHHfDjNlZ1+furZT/hPT2C1jJFtwYkmG3L4ctb+hGC6vnL37n7FsDBugeRbhJ0vfMjDxvp28GFJJh8OcX7/aA24Lc5Qgi/nbh78viYNd508RY3Tq9+3iwO0ShmhYmiXZ5pBMZD1ljoCs/oRCZP8RZP1Z4JpoXuYk+DnKj8lyc5ZLGUBP0lBPIu1G5Tig01/VYkF4Y+1jyUbVEipsS6oj6YRCUrHvf+Vd5P9hRpVMORqpBF0pBLg+v1em5B1OQe/wIpf9dPrXl/25KrPq7Ry3q3NEnf9Lekrcn1yQVaQ/SRNIH2Lvy3mN2DqtoddUNr1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dke86N6k33qBDo0pR7lYMDfDKJM0swKDJ2evpn7/dZA=;
 b=n19jNY940pfoFVi2O/wQLJqVgV+GBQpJ6OqcOP6WxrG9l434cgFqQkSp11MmV+0wXwtVFL+y1V4976M+TtstpAgM69EfURQRL/AI+n96be+16BZkuSkfGH/lPFnxS5xq3Qinnz8xphKYN+8HdRsuPUdjBJVQ2A+kQ45goYtHwFZUjKYDhgQpbbM7hU1YVsJKk7yqnIZph7uuD2U2JSEIo4U6n894IOf617G3yVOwEe4LawjkiO5At1qXiZO6K8dZPx+h9ZijuWMAO/1LPnTrPyC4nUsskTvm7q980UuI6Z+THPwrlPWOSgeJuEPDH1zXWWsxz3h9m40EKirYHI8R4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dke86N6k33qBDo0pR7lYMDfDKJM0swKDJ2evpn7/dZA=;
 b=PKCKbYDsOE8SbKBoaiFecMrpbnm7gDLAHixeA0W7yzpm9ozbzrstv3QTzolpoGD94w0mz88mMvGLsSSLh0qmeXSjBDCfzhYeEP+4/kwDASdU9CzvZd+YHBFwWdEEyrS51F6XuzJeFO6tjrkkRbMO7evCxN/zRIeEyp26ej8lMiI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS7PR12MB6095.namprd12.prod.outlook.com (2603:10b6:8:9c::19) by
 SJ0PR12MB8091.namprd12.prod.outlook.com (2603:10b6:a03:4d5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.29; Fri, 28 Jun
 2024 21:56:41 +0000
Received: from DS7PR12MB6095.namprd12.prod.outlook.com
 ([fe80::c48a:6eaf:96b0:8405]) by DS7PR12MB6095.namprd12.prod.outlook.com
 ([fe80::c48a:6eaf:96b0:8405%4]) with mapi id 15.20.7698.033; Fri, 28 Jun 2024
 21:56:41 +0000
Message-ID: <0265787a-617f-43bb-9cde-3b178ba24779@amd.com>
Date: Fri, 28 Jun 2024 16:56:37 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] drm: panel-orientation-quirks: Add quirk for Valve
 Galileo
To: Matthew Schwartz <mattschwartz@gwmail.gwu.edu>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Kyle Gospodnetich <me@kylegospodneti.ch>,
 Hans de Goede <hdegoede@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, John Schoenick <johns@valvesoftware.com>,
 Matthew Schwartz <mattschwartz@gwu.edu>
References: <20240628205822.348402-1-mattschwartz@gwu.edu>
 <20240628205822.348402-2-mattschwartz@gwu.edu>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20240628205822.348402-2-mattschwartz@gwu.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL0PR01CA0007.prod.exchangelabs.com (2603:10b6:208:71::20)
 To DS7PR12MB6095.namprd12.prod.outlook.com
 (2603:10b6:8:9c::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB6095:EE_|SJ0PR12MB8091:EE_
X-MS-Office365-Filtering-Correlation-Id: 4faa488e-ca3e-4f63-54e5-08dc97bd3197
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZzUvcGlGckVDQWpEK3lwTm9FZC9sa0VrRTliQVJIUVIzVFJWSTJrQWhiek1E?=
 =?utf-8?B?cTVCZ3RwN1VONzk1NmRnWERIaVAvaGZrU0xZWVNmK25qTUNlMGdCM1NRd09Q?=
 =?utf-8?B?NitlL2VTN1FQblJmclFMcmwzV21ORXVWbHc4NU54UUFlYTF0YVluckhzN2E0?=
 =?utf-8?B?NFJXZVJyM1E1aFdwQTR5b2ZtVDhIUWRnVldmQ1pHUDBMYTNpUlQrYWNLV0JC?=
 =?utf-8?B?eGsyb1ZYKzlEeVhkSEtNVFU5c0kxZHJGbnlaVXh5YmkxSG1HSXRtbHN1VUNN?=
 =?utf-8?B?Z2Nla2lIYndsVWR1M29XcWMveTZVai9KcUpUSGwrNmFLNEtVOUQ5VWVZWlg1?=
 =?utf-8?B?YkZUTXdhU1ErYWdjZUc0S3UzSmcxekpSS0hCUDZkV1JHRkZLNU9vd052L3Fi?=
 =?utf-8?B?dXJvYUs4Z1BHY3RpNVhnNlhHRjdQUDVvbmROV1pKenVDSEppRXN2WHc1V3Bo?=
 =?utf-8?B?VC9CM1NRc3VDWlVJM3draGdzSk9TdGw4dXlzaTVlUk1jdUxDVWp0RkI5ZWk5?=
 =?utf-8?B?eHlMMTB0VXpPZmJ1bjVna3JOMWNRZFA4YVU1UHdLanRRTEhNSWZWVlg0M0xp?=
 =?utf-8?B?YW1rTWVCR1llVW04aCtKajVzZjNlQ0Q1TW9qbUxWZFJzS1kwbS9McXFMd3RZ?=
 =?utf-8?B?aVZ6aGlmTGNleUI0SHkyUGxyWVN3UVNQY1UvSXIrR3ZCZXBNSk1oYXNhK0NS?=
 =?utf-8?B?KzlKeUYrdGw0STJoaWhOcDEwNWdKblRXelJPNTZMZmFpL3BKeWxMd1JBeEZK?=
 =?utf-8?B?UkY0Y3ovaTNqS3hQYzZwWUplbFJBVVBidDdESEhwNlJVOGFKY29EU1dPbDB4?=
 =?utf-8?B?OVo3TUI2NkhjbkZQakRGcUVjakk4Wk5DZ2hVL2xjMnJVREJ4ZzZGK1NpbHZE?=
 =?utf-8?B?NWlXODVPb0JqWjhBcjdHODVRTENXem82ZWZaWnNKMnZ4U3A2L3ZHV3FZZFA4?=
 =?utf-8?B?U2NmY1ZTOHlQdUNyR1RFb3FNV3BrVjRkTnUxTHJFMXVkR3hyZFUyQ3BlQ0o3?=
 =?utf-8?B?MVE5NTRGWUFRb0Z2MU9rZ2hkelJ0OFgyNFVhYlJKdHdHL2JaemI5cnRzeVh3?=
 =?utf-8?B?bDlwd1g0YjBjRDE4OElPVjB0RWVKcWlvdHE4aHE1MGtvM0lNLzJxWDdxcEJx?=
 =?utf-8?B?SC9ZRGJBM0N5VWYzWmJiaE81VUc2VzBHbVlKbFZ5aWlidHBFakQzdTUxTjZm?=
 =?utf-8?B?UzdnODRERmpBOFdkU1VVZWxaalZHTVlGQm1FSTVrVithdlN3Y3psVmUzL1BI?=
 =?utf-8?B?dkJTeGk3Y0xORk84VEZkbjQ4NWw0VWFmbkVmMDNkTjFVRWY5T2RJeW92MEMy?=
 =?utf-8?B?ekpoSXdiZ1E5NU03bE1wN1FjMFkzb1RQZEMrZ0Ivblc4U2MxQmJINE1nZmZt?=
 =?utf-8?B?WExxWFNZMkxxUUFtMVliZFVHaXBCMnRaQWZldlJpbW9vTHAzYnZreUlEOUsy?=
 =?utf-8?B?V1pkNkh2LzNoZlhXQ24xRDJkMTR2cDRPcTlRMWtqQ2ZOT0Nzc1lGcXNRRDRH?=
 =?utf-8?B?TytWTHVVKy9zM05kK0l5Sm9PWEpvYVNRSUpaSzRweE1FUFRXRS9LUHdFaUdi?=
 =?utf-8?B?TzljVG9FUHY0c0szNVNBMUVhQUxDRzFDRG13alBjL1QrQStuWndYdTJKQWNt?=
 =?utf-8?B?TnpoQzRGdUlkMmRiaXd2TmtUNnBPeFVudTFleVlndHhCTDFYSjJhYlhoNXhP?=
 =?utf-8?B?SVMxZ3pPRlpsc1hrNkFZc1dHbm9WWWI1Mi9LdzdpYTlVV29LZ1BXOWh4UzQ2?=
 =?utf-8?B?eFFXR1E2U0Z4dHZTbENsZ3AwVlRIbmlwRngyejJPajhQM1Y0dlZTSFRId3Ny?=
 =?utf-8?B?YTRXZ0pRbGFsQnFHVC8vUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB6095.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VXZRT3o0QXhEWkk1WEE1UUkwMVUvRS93QjNPcEJUZ1JJMndsQ3p2VlQ5UVNY?=
 =?utf-8?B?UjlEM09saEI5TUVVZEdTMlVBRTBvek4wM0pQWTFDUHZJUXpOVnhma1NKT1ZL?=
 =?utf-8?B?bU5MK2oxUHJKSXRWUEZ6ZE0xQWphTUx6TkZsdVRJbFZpaUF5YjZJd2hQdzAr?=
 =?utf-8?B?bTNqOHBiTmNCNjRUdFo3aEo3b0V6SzF6OTA4ZUVwY3NiMForREtQK3FVS0xK?=
 =?utf-8?B?emFBRE5jNm1IdEk0ZVluK2FnZ3d6RHg1SmtpaGtRZEs4ZFJiNnBaYlRGM0hP?=
 =?utf-8?B?TURBbHhuQXdZVFhPbjA1MzY1ZGFoMDBZMnlsSE4ra0s1SkRpMnQrQmdXSEt3?=
 =?utf-8?B?NWswNEFOMmJZQXNyYWNHUFFZWEF6RXhzUDhLUHhYR2o4ZGhNU2FGUFJvZ0Zm?=
 =?utf-8?B?SW5YU09kSmNyV3JLUGZHd0xIdm9LYlFTakVhOXZHN1AveXk2eGR5M1pUU1ZT?=
 =?utf-8?B?Zkc5TFJBQThCUVRqcjdBZlhBNEMwZWkzTERtbjhRMGJNdEJMdStrVEZLSTdO?=
 =?utf-8?B?ajRyZjBhb2hWdzBKclZwZHEwT09Eb0YrYW92N3FiVDRpSDlxUng5S0xlRVo5?=
 =?utf-8?B?Q3RGRUdUaXc0RW9XdWp3Rnc1a0Rzd0V6UW1DL2t6T2x2RUUwMkxoWGxYeVUz?=
 =?utf-8?B?V0J2aVloTnpXNDJFQ1ZZMWNmbG5Oc3RUVzAzZTBWNFpJNTR0OE9aMTFTQlEw?=
 =?utf-8?B?ZDFWQVhFZnl6ZW8yNVFjWTd4Q1hyY3IzZEYwYUdROHZtOGtYTTJ1NWtqVVRI?=
 =?utf-8?B?aEdzS0dOTHBtaHVtcDJmNXR6WHlpUG9oUWNMQjZqYk92UHMrMytJL3ljOXBH?=
 =?utf-8?B?UExweE5RSitvcjdwakhwR0VyL1VhRTRLVjNTWUxzRFNYOVdCRjZjQU1Sdmtr?=
 =?utf-8?B?QTNaL1VCZFN6cFd1WmhvNGUwNWJJY0JmQUs3UG9jaTZaZ1U0ckJTRHBaVTYr?=
 =?utf-8?B?MmhkbWxZWkxpbE9ZZUJjVnR5Slh0aXlMOWlUMEhib1c3Q1dNNGIzN1hHSHVI?=
 =?utf-8?B?ODNYdCtZYS9wUWFIQzF4cWlQZHhZYnRzcEVuZkcrTzVzemdubU1mM2ZmLzMx?=
 =?utf-8?B?UnM1empDY2dSSE0yNUU0NzBpUUY5RGF3MXhwajlkZWVpSnFPRnVuZjllVmFD?=
 =?utf-8?B?TWkzTGM1UUxvWi85cWIySGowNmE2clRjcndlS1Q2R3Fwb2kzejJrVTNmUTIz?=
 =?utf-8?B?QUxIRmZaNG55M1Y3MmU1ZGpmaExTazMrV0VLN2Y4M2RPa2NEMkZjenBCa0VZ?=
 =?utf-8?B?SlF6eWdJcXQzekhGZFd3MHNDQ0xHTmZJS0tMaU1UWmlnckV1azhDOXF1Q255?=
 =?utf-8?B?OVR4VXRzaU5NMmRmRmkrZStzS3UrK2wzbWJVV2pSMmszZjFEN092OGdNajFr?=
 =?utf-8?B?QTg2c0s1akR5NWNzalEydGIvZTY4NTlKZ0IxZnplaE5HWEZqcXY0VFd3TlMx?=
 =?utf-8?B?RXdnRUxJckk2ZVVFNjhpNnJma2ptc0tUczN5UFFXeUlUZ1J2enF6VGFodHFJ?=
 =?utf-8?B?ZVBzUURtZW00M0ZiNitnTkEyTTBrdkJWMUhnYWI3T0xDUVE0M05Pd1VrVjlV?=
 =?utf-8?B?NVBHaWVTUzFHL08vZlIyWGZNby9CRk82MHU1RUFqVEZvTmtmZ1pXR1hjUXlE?=
 =?utf-8?B?aFgyQWNQOGtJWmpDV204STJoVmR1RzRaZGt2VXJ1YWpHdWlqNEFoTmFZUG5k?=
 =?utf-8?B?b1gzK2diYXFRWEpaMnNvdysxMk1MN0xCR0tRaVoraGxrMWFzVTRZb2tuYmdT?=
 =?utf-8?B?N2dYcThBN0kwNkpTc2M3bzZrVGxFc0NYdnFOaHdDSHRNbUlvaG5QbGU2MExi?=
 =?utf-8?B?Yno4VkhBcitsejRIcmtYYTdST092bTVrSDJEN1hZWm5jaHF5SUZpd05TbFRq?=
 =?utf-8?B?VnJBZjdtbTNSL1orampOUlhwOTBMem5saitNZWhqbUl4b3Q3ZHJENXdocmpi?=
 =?utf-8?B?SUNWZmZIU0RKbE5PTFFFV211RGkrc1czcnBPK2VGZEZVWU9IZjBPUHdBZ2pJ?=
 =?utf-8?B?VlprL2tmem8xSUFtSzFSRTFWMFB3YmFWWUJEc3dKNk1KdlhleG5PMHYzUVRX?=
 =?utf-8?B?RGdrbiswQjdXaGlaNy9mTEpuL2xIUDd0ZW93bFhNSDJqMnlRUFFmT0Zic0Vn?=
 =?utf-8?Q?sU5HLRNZLLoRj9ND8o9vHYTpv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4faa488e-ca3e-4f63-54e5-08dc97bd3197
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB6095.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 21:56:41.7545 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 541uBv/WbkxaXadcIeWJ9GowkOI8NsDjExgLxVFs/V/aR/uWPjdjIoww4gZjK/m2X3923YwtYhl3zczoIHcXSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8091
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

On 6/28/2024 15:58, Matthew Schwartz wrote:
> From: John Schoenick <johns@valvesoftware.com>
> 
> Valve's Steam Deck Galileo revision has a 800x1280 OLED panel
> 
> Signed-off-by: John Schoenick <johns@valvesoftware.com>
> Signed-off-by: Matthew Schwartz <mattschwartz@gwu.edu>

Thanks!

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

> ---
>   drivers/gpu/drm/drm_panel_orientation_quirks.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> index 3d127127e7cb..ac8319d38e37 100644
> --- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
> +++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> @@ -427,6 +427,13 @@ static const struct dmi_system_id orientation_data[] = {
>   		  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "1"),
>   		},
>   		.driver_data = (void *)&lcd800x1280_rightside_up,
> +	}, {	/* Valve Steam Deck */
> +		.matches = {
> +		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Valve"),
> +		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Galileo"),
> +		  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "1"),
> +		},
> +		.driver_data = (void *)&lcd800x1280_rightside_up,
>   	}, {	/* VIOS LTH17 */
>   		.matches = {
>   		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "VIOS"),


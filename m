Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1BBA89DB9
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 14:21:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0654210E75F;
	Tue, 15 Apr 2025 12:21:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="gQtiAoog";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2041.outbound.protection.outlook.com [40.107.92.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBD8610E75F;
 Tue, 15 Apr 2025 12:21:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y/g1ErNaU4SkWWkxe3BJiV6/UJQPGCiYkJjel1imog3dSY3Xui7r9tcWHQpzIJ7whae4EMd+NhlBvGhCt/ugauYOAaAD2QA8fjrL8ABlcV4Avpyu7+2OKJ+m8JZhQC4qtrADg3dIy1nu5OuobCAoVFSp39S+W9t2S+60fsZg430sxHsyr03NtldnWKsPkSK1MPCAvvTC5jIwEIhZmfke4NcoAtJeck/1Xdr1SFfP2nmZeOukFyiQrQZ/d9cxsBXalQqrquIEOqC0jQPKRliKaKZ4qk9gYS/VVunZO/F6Wl68oaPO/Xg0a7ZnMT6RwfnNV1Gf4//0G0FMi9X2YPKZkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1UTPn9s04fok2EbkhKoF119VU+H1iuDzKCfIUG0/RQE=;
 b=pEvfKIWjS8IzjRKaennNBUqEXfBGnBwlIB4hXa4c6nQ50gVe7G7PfFG39ajzuxAfHLlIBoEa5I6xB1KkUm63FoyPgp/q8P0Xqzqa/ySPLkqrhs6Q0gHuf+9l7rHbLnmn12PAhs1mzZwo2j0Fp7XKTKxx/+Sisyr/xob6T5DGi/RQ+TD2IidkF9VwWcx7GuVdkQZqyD3iVrvwFSIL3WS7n3fFPDELw9gOfDhS1k6/bdREK9RvsJLHlKEN6WMuik5lbLyFhG5llt4syYSsLW4RAdS6S32e7F61q3IJtF4Xs4sX2u0jjVHtaCeokST61A9Dik7zVUS+Lk7Nz3uxGrnJWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1UTPn9s04fok2EbkhKoF119VU+H1iuDzKCfIUG0/RQE=;
 b=gQtiAoogPL8IZKXjn6seCOHAMYkmZhu6p9hliBT1JOSoip9/31hj6m0ZGPaSCbiNa9MsOQRODpwFO7bTxXT7UPZGMFihblqIYSFXiQAtpoFygu8eNYoPCeVWsXFxmiJse8K0t4jhevXNhoOQHHI+Xic9JkzqJ7NmKxlyhapCgcQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA0PR12MB7553.namprd12.prod.outlook.com (2603:10b6:208:43f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Tue, 15 Apr
 2025 12:21:10 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8632.025; Tue, 15 Apr 2025
 12:21:09 +0000
Message-ID: <c4c03523-15b4-435b-9c01-28a256d47f34@amd.com>
Date: Tue, 15 Apr 2025 14:21:01 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] drm: function to get process name and pid
To: Sunil Khatri <sunil.khatri@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
References: <20250415112550.297292-1-sunil.khatri@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250415112550.297292-1-sunil.khatri@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0259.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA0PR12MB7553:EE_
X-MS-Office365-Filtering-Correlation-Id: 17650a76-d50a-4eea-176e-08dd7c1800f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z1pWb2xKYnd6L0JGNUlvb2NLMm8zQ3dJK1JiYU53bFhQUytMWnJtRzFmZmlW?=
 =?utf-8?B?czE4L09TTmZhNFpDQVBXTGw4akpSWCs2TkgzdXpzLzVCUXBVdnd3V250YkVv?=
 =?utf-8?B?RU1sajJRQlBEV0czeTlPNWJraXYrajd6dE5NSisyTHhCUEFNbDI1VWR3WVdo?=
 =?utf-8?B?OEs2aklOc1hObHpKY1lhajlLOE5wVWlNSmZEbHdZODdQbGN0OUlZV2RzSmxR?=
 =?utf-8?B?Y2Z0LzA3VzlvazdTMzBNL09neStnZTFVeS9nVjIzWVJUQWRIZkI1dG1INDJW?=
 =?utf-8?B?cGIyeFFKMk83VzhMdHc0cmk5NWV5eHptd2x5RGF1ck5hQlpTVklvbk1HQS83?=
 =?utf-8?B?SldmZWR1Z2tDZnFCUkRTZU9GZ2N2U1hOa0RQNzBGRHVlMjFrVUd4ZXhxbDg4?=
 =?utf-8?B?VnFkcUtJSnlvYjRPb1pVV0hpczlBM1Y1RS9TYldvalYwN2h2L2xLNklCelY4?=
 =?utf-8?B?TzBZbVo0eEpkOXFScnVGUG91aWFBTFJTOGdTU2E4ZUZnamxnaDZ4UDEyNlBE?=
 =?utf-8?B?QmoxVDg3eHI0bUJPOEtxM3ppN1JPTHBlVjluQ28yajl4RFZBdE4xMnpYRFds?=
 =?utf-8?B?STQ5OHkxMVluUDhhRXhRNVhvMm1hV2tTMWJnQ3ZlU2NzT2xZNFZFcmM3QVRJ?=
 =?utf-8?B?VUVOSzkrVGxXL1RDdituZnlmVmIzTXN2VlVGeGM4M0dZenNqRXVSR2ZUYU1M?=
 =?utf-8?B?cEVPWUxMTVMvUWxpTEZPQVl6ZDBJelU3ZkZST0duYzAxK3UrbXFMTnd0b0JZ?=
 =?utf-8?B?MG9iNGJvR3hKQ3dmU0RuL2JBUlVVcjcrU1B0Qy9EcGFEdUltUHlzVmVGWXc5?=
 =?utf-8?B?U1RlTWs0WlF1aUFEU3RxSitORXJ0RTJPSGJyQUtyb2hwTzVMRHlPdzJJV3Uv?=
 =?utf-8?B?dFRJaDN3OEVTRHZkbXZ3VHJJenhGNHNkVUp6d1VlcXQ3N0NuYUJPR2lxTlRZ?=
 =?utf-8?B?c3pLbFFxc1A2SFozQjk0SFBzZjZqUVVtV254VXdSSG4rNHRmb0V6K3JNc1d0?=
 =?utf-8?B?LzlFdmduTXpnSVBMdXpFZG9DNzJnTm4wUXpsSjRJREt6bjc1LzJXMnYxMEtz?=
 =?utf-8?B?Z1NWTm50Skh5ck1FUTA3dXJBRnZVdkloUG1RQnA4QWZHb0daWmFmTStHR011?=
 =?utf-8?B?TVpsTmtmdG84TU56Q0VpbVdJSDM2cTVkdWZENXA0L3phNjlQTjZvR3BaVEhm?=
 =?utf-8?B?cUFVWGcyZUJjdXNEUmJoTFRUOThHOHNQWkd3VjFKc1F1Z0Jpb1d5YnN1Z2k2?=
 =?utf-8?B?QTdiMUFnQUR3R2dmbmxMelpIcmIreUFkNURjUDZlclFJQVU0bmlucS81b0h1?=
 =?utf-8?B?V01INy9GOExjYnVhLzdIeVlOU0NmRHZqN1NJYndkRE8vb2xvSm1iUEZRRlNj?=
 =?utf-8?B?Zkp4KzFtd1dTeThGcTQ3aW55T3EwQWNSbkZPNnJRRVFNbVVGSlVuVUpSUUpn?=
 =?utf-8?B?dVUzRXF3aElVS3l6M01QS1E0WnVUOEJ4NjBCS2lyaWw1RC9TTFRPMk96anV5?=
 =?utf-8?B?S0s4aWYyTUFaV21WUFVPOEovK2JKdGpOS0l2ZnVSVXU1QklLSmgvWXVMVW1p?=
 =?utf-8?B?ZlJjeTBQYVVuNmNacFRxbzFKNysySnR2VUE4dzludWUvVlp5cnpJQmdkRzRZ?=
 =?utf-8?B?eU51WnlTUmJHTTRrUFFuR0dYQUV5a3g4bFpVQ1NkMGdwb0MwQWlRTzZkWDk3?=
 =?utf-8?B?b0syLzUvOFNONmZucEtDWnEwK2U3dFdYZG5nd3o5RmUrWDNTcUFBbTBUZWpk?=
 =?utf-8?B?VmR1bVpPNjJIVG03OFAwblkxeTA3ZFdYMENwL3drSXNTU2hwOW9OaE14STVY?=
 =?utf-8?B?QVJaSEJqcWVNcjFxZ25TU1EvbnVIcWJOejBkMG85OTEwNzkxaHAwNFNIY29q?=
 =?utf-8?B?L1ZvMEoyQ05NWGlYRlYxNWJ0NElsaXhNWUh0ZXFHUzJrZzBYaEF5bEt6SmFB?=
 =?utf-8?Q?Ja3UiHDQZFI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WnpCSEFreU13U2xiVGNkaE5keXNKcXVpejM3OGltZXdHUTU3cUtOQ0NqNjZR?=
 =?utf-8?B?Qll5WUhtSXg5dHpYdUR5MXRGeXF5YXlHNEZTTGc1S0sycWYwRzVEZlJmYjhK?=
 =?utf-8?B?aEV2cFVsSzl2Q0ZHRmZUTHlnTkdQZ1VDWjdGNnFNY3dhclp1RFFnUHZGUGtz?=
 =?utf-8?B?bVZsS0JiYytMU0sxempjQVFZNnBqRThDVUpEUlNCTVlmaUVYWTRrWEdCSTU1?=
 =?utf-8?B?RXUwV05GMXplVlRmcXFIVVd0Z2hwUEdJWVBQVkRKVmlBdG5ubHJWaFFVd3k0?=
 =?utf-8?B?OWNyWERURVlpN0ladytJTE4vbHI1dm5JNXVEeFVBaVFFeThGKzF0eGxQZGJT?=
 =?utf-8?B?NGw4TUh2V1Jrc1l4WFRTYjRnM0tMNkhiTW14NFdWbTFwN2s5OHpSNy9RY1ZL?=
 =?utf-8?B?cm4zSENFbzRUODQvbHBjNzZha1BxS3lXYVJvY0wyQlF4RWk1dVp3QktITHNU?=
 =?utf-8?B?NXJXeWdBdzdiL3lxS1hrekVKTzJTbEtvR2lQN2NnSzZQRGw4U3RYQ0pESS9J?=
 =?utf-8?B?SEZRN3J5ekFDRXVZaWEvekdDbzdpQURtSWhYaklIWXlNclZ5aVk3TThDM01x?=
 =?utf-8?B?cnVUZFJOS0ZrcFRtNUJFZ05uY2kvbEZSdHFMejhqRDlrdEEvUmhqdXhPcDYr?=
 =?utf-8?B?K3VsMnpob1pOeE1FcWg2UWNRRzVQTllDd1dWTnBHeTZQaTFhZ0l0RnRsRWxM?=
 =?utf-8?B?bXJlRFVLUVdwNVNqZTMrRW5rVkMxN2FhV1NuUkpPYzhoUXFYeFA4TVlVN2hF?=
 =?utf-8?B?OHUzZlI3cjhWKzlJQnZFbzNxMmZpcDUzRUg1QnY2RTVpaWNIM2VqUm4xdm4x?=
 =?utf-8?B?Z0I3U0ZNL3dFdHV5c3JrZGFZTk95WTgrc3pWSHFZQktpT2FQRW9wOEpxdEJh?=
 =?utf-8?B?dDlscEpSUnk2T0czdEd4aFlocFFsMFdKdS81U3QzSW5mTFhwV2tUNXJPb2JX?=
 =?utf-8?B?Q1VaVFplTk41ajNWME4yWUhVdEdWbmtLYTFwUE0xSGtQNVM4LzdlY0VlRkFo?=
 =?utf-8?B?ZGFTWENZd043d0ZxR2loVDRJK1VGSXZBSDhvVWNVWG0xSU0vMUx0SVd5Vncv?=
 =?utf-8?B?My8vRzdzYWNFZ285cVl4ZUl6YW1OYm9oMmpjTlZNaUV5aFNKdzdwUnFKZnNJ?=
 =?utf-8?B?NFlPWjVVSjAxa1Q5dnBpL0F5L3Z6cjQwYXNLdWFYNmlnc2NlOGJMbk9aaXBn?=
 =?utf-8?B?R0t6c0w0M2s0OFFQNDJkWGNEMENqalB0L0VTb1RvaGdLb0pJM3Y1cmVBVDRm?=
 =?utf-8?B?Y2xXUGpJcDZ3cVZBaEtIUHdzeDlCTjRBbXRPZk5uR2h6UkI2ZXN2Nkpsb3di?=
 =?utf-8?B?QzR5OUNjTEpDUkU2akVnYW9NQUtsZWdvV0JsckxHa0trS2x6QXE4ZG5rU1pi?=
 =?utf-8?B?UzdpUWQrRDIrOWEyV29RaDVpTFJJUnRFMW9HRy9aaXNSYWZVUUlPSXVDN3BQ?=
 =?utf-8?B?UDBNblBRRVUvQ1RscVp1cVFrNXNIZ1pSSmdDWEU3YlpoREI1TURHREwrVHhr?=
 =?utf-8?B?VkxRbkNOaGdKSDNrT0UzUzZ3cVVvNHZrRVM3N2MrcGVQNmxsNjZXY0hzZ3FX?=
 =?utf-8?B?aFh0MjM2K3FuV25CRVNRMlkxbnR3T2NzNVByR0NhNnNOY3hRdzhpUzZZQ1A1?=
 =?utf-8?B?Y2tnL1ZuZVJsQ3pnZmJRNjlsK2JxRTZSYTV1OFJFd1JmdUNJa0NQNXdmR29a?=
 =?utf-8?B?bll2cVV4SWhHaGtSL0pFYkxVZTJNUmlPeDg4Zk9GWE9wKzh2RGJmbFNwWmll?=
 =?utf-8?B?RGFZNUUzNlVIZFJjRG1IYit3bzlwY0JSL0RDS3RINnprVFpBMU1kTUkvVHlx?=
 =?utf-8?B?Vm41NWJZVnZqOXVGbHNVbHN4R2NBMGJZMzZNRStidU90NW9aNlpBSndMOVoy?=
 =?utf-8?B?ZUswSHF0Nk1ZNDdMWXhEYkk3dlBIRldtbTJXY2RtSWF3V3NmMkhHUFZtbTdj?=
 =?utf-8?B?RzdIZEE3blZLZWQ3QXExM1hwVmxYOFNrR1pMSmlZMGlINWtaL2w5SjR5bkJQ?=
 =?utf-8?B?c25zZkxlM0czSG8wdFdOMlpET3l0T0w5NmcrbzlNTmlKUG5wQlRUSHlubnVE?=
 =?utf-8?B?b1dGRm9JVTlUTUFnbGpLN2grbVBCdEhqei9vUk04VmdWV0lIWXJ3UVdGVk9t?=
 =?utf-8?Q?tGqskkI5hHVVosjSczgwspSvT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17650a76-d50a-4eea-176e-08dd7c1800f6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 12:21:09.6291 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Wy7Hfr0ix2Rq6ld6fMFgu/8x02Bfzj4XfS3Ncrki/cNi4eBIbRbeh8FCIg+053U
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7553
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

Am 15.04.25 um 13:25 schrieb Sunil Khatri:
> Add helper function which get the process information for
> the drm_file and updates the user provided character buffer
> with the information of process name and pid as a string.
>
> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
> ---
>  drivers/gpu/drm/drm_file.c | 34 ++++++++++++++++++++++++++++++++++
>  include/drm/drm_file.h     |  1 +
>  2 files changed, 35 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index c299cd94d3f7..728a60975f5e 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -986,6 +986,40 @@ void drm_show_fdinfo(struct seq_file *m, struct file *f)
>  }
>  EXPORT_SYMBOL(drm_show_fdinfo);
>  
> +/**
> + * drm_process_info - Fill info string with process name and pid
> + * @file_priv: context of interest for process name and pid
> + * @proc_info: user char ptr to write the string to
> + * @buff_size: size of the buffer passed for the string
> + *
> + * This update the user provided buffer with process
> + * name and pid information for @file_priv
> + */
> +void drm_process_info(struct drm_file *file_priv, char *proc_info, size_t buff_size)
> +{
> +	struct task_struct *task;
> +	struct pid *pid;
> +	struct drm_device *dev = file_priv->minor->dev;
> +
> +	if (!proc_info) {
> +		drm_WARN_ON_ONCE(dev, "Invalid user buffer\n");
> +		return;
> +	}
> +
> +	mutex_lock(&file_priv->client_name_lock);
> +	rcu_read_lock();
> +	pid = rcu_dereference(file_priv->pid);
> +	task = pid_task(pid, PIDTYPE_TGID);
> +	if (task)
> +		snprintf(proc_info, buff_size, "client_name:%s proc:%s pid:%d",
> +			 file_priv->client_name ? file_priv->client_name : "Unset",
> +			 task->comm, task->pid);

Client name should probably come after the others. And you can reduce file_priv->client_name ? file_priv->client_name : "Unset" to just file_priv->client_name ?: "Unset".

Regards,
Christian.

> +
> +	rcu_read_unlock();
> +	mutex_unlock(&file_priv->client_name_lock);
> +}
> +EXPORT_SYMBOL(drm_process_info);
> +
>  /**
>   * mock_drm_getfile - Create a new struct file for the drm device
>   * @minor: drm minor to wrap (e.g. #drm_device.primary)
> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> index 94d365b22505..a972be73a615 100644
> --- a/include/drm/drm_file.h
> +++ b/include/drm/drm_file.h
> @@ -507,6 +507,7 @@ void drm_print_memory_stats(struct drm_printer *p,
>  
>  void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file);
>  void drm_show_fdinfo(struct seq_file *m, struct file *f);
> +void drm_process_info(struct drm_file *file_priv, char *proc_info, size_t buff_size);
>  
>  struct file *mock_drm_getfile(struct drm_minor *minor, unsigned int flags);
>  


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0183AEDB66
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 13:42:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 986BB10E41B;
	Mon, 30 Jun 2025 11:42:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="l2xK/MU+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2074.outbound.protection.outlook.com [40.107.94.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14DE510E20A;
 Mon, 30 Jun 2025 11:42:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r14ty17ZTIhpZaOswHqsl3mu/V9TRPCMEwR7ayfLMpzlqAZ/QRrZ82du5Ks4uB5nJ8GZevw11I0AvuHz8c8g6lTgaAnW0+KeiejF/tRL1oMG8qYkfQTRD7dDrPcqHoz4less1Iq81+P56GZzzm3Rdi9vi9n22pcjR9ehKUsKt7afLreeXvZDDwib6WIs0/2XGCoQ0HIUZE4GPlr5DI1hunwO/+puA2emxs2l+xkH4w0m/d50jMB3kRwxE2lDyxapj4PPGPBDJpaui1iR19tlgM2a94KV1C9XvSmlLu61m+dmSEvvPIKQPBz11yFT5/wYkzLjFfRnlC5QlmOURP9KKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/KOVO4ofXRYaahKr+RhX68CW2gEBsw1DAfjNBLdhCAY=;
 b=ZMGGFctJ9+YyEt29M0bEuGUwRR8MQ25/fl6laaF9vmE1MCcm2+2GacWp24E59I0ZL1JUzuApp9fwJvGo07pmDHZ2mhCma5DGYntO8bStLitw/AuuBgPpT5HSna443vRK8dg5/INDmo3uCZ5G1TTXHY35351okyRY0tewOkOuM02/rTlAZNd4NGaW/99lZPSExFDRqM2RS0Q+690TEqyIjGYuiwzFydU+kl5GWbStX1HwgHJmfPwFyl9Jtzu216ZPArsevyKsvIg1aFRkhbjiSMGHvHf8YLR8mbZP61yJrDLbJ8K41g/nIaRqahYo/pEwpKUvWjDd6E8bBynRtqOTTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/KOVO4ofXRYaahKr+RhX68CW2gEBsw1DAfjNBLdhCAY=;
 b=l2xK/MU+V8yVTfnhXevsU8YmvsX2tAwT9sY7yhdFVbiw6wTkxQo2faZxBzSjKR+/yegWDqiMEkDdXUe7AaDi7aJtR1FleJ0FWOlaHYtB2uVJVx9cAnezYUCo8ztC5wT5eCaJTIO1HU2sUHPuVLeaT7Y8GT8ZH1MR6tUUvWRCPGI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB6614.namprd12.prod.outlook.com (2603:10b6:8:bb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.29; Mon, 30 Jun
 2025 11:42:03 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8880.027; Mon, 30 Jun 2025
 11:42:03 +0000
Message-ID: <d94574be-4054-40d0-98e7-36c32c1ca556@amd.com>
Date: Mon, 30 Jun 2025 13:41:59 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/5] drm: move debugfs functionality from drm_drv.c to
 drm_debugfs.c
To: Sunil Khatri <sunil.khatri@amd.com>, dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, simona@ffwll.ch, tzimmermann@suse.de,
 tursulin@ursulin.net, phasta@kernel.org, dakr@kernel.org
References: <20250627094921.911009-1-sunil.khatri@amd.com>
 <20250627094921.911009-2-sunil.khatri@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250627094921.911009-2-sunil.khatri@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0053.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cc::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB6614:EE_
X-MS-Office365-Filtering-Correlation-Id: d5a2b7dc-4bd8-4646-1445-08ddb7cb21b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q1VGR2k2akJPV1NSL2JLQzBmeXNXa3R1NTh5czZ5ays1cWFKbWVtZmF4QWRm?=
 =?utf-8?B?bEpZYk9mRG0yNk1SQ25VYTQyOWhMeEFvSmV2dVN2ZXQ3eXc5cVEyR3Nwekli?=
 =?utf-8?B?SGRlUG5CWVBIdWtTZ0prdkNDcUlHUTZJTUhnRlBLOEZqZHhtbTZEWWttY1NQ?=
 =?utf-8?B?eFlWRmVOd2dTK1lIQlRBMnpvVjNhMVcvZE9TeFgwOTJlQ1FqRVExbXhkNVhZ?=
 =?utf-8?B?b096YjkvRFIxQ29HcG5KeEwyUnI3SXpHUHMxZWZsYTlaR1JVNTFYMzVhV3pG?=
 =?utf-8?B?VWtlQVFsTVovWVlQTWx2ZnlYYnRRSW80Wk5MY3VxbzlmajU4alNKcHdaS2p4?=
 =?utf-8?B?SU1jNVdBYnpSVHE5Z1VVTjRwUDRjNnZvaDRSaHh3Ky9OQUQ5OGZISUlrL3k3?=
 =?utf-8?B?alR1WVdaSnB4TFpMNDF1RFJPUWxwcnNxRHYzRmllY1E4R3owZTFQenlnYVgy?=
 =?utf-8?B?aVEzWTRIdTI4YTA2eDQ4SllxL1N6SGo5RGp2L2h5NEsxWHJVbTlKdVlicm9l?=
 =?utf-8?B?KzB6anhrWEkxVURPem9LUVovcG94N0VVRzNjc2M1bFhHRzQvQitvT3hqZFk4?=
 =?utf-8?B?L29nL0xrMUxKclo2UG9rMmJsUU5GMG1hR0ZETGFoaCs4RmM1QmZmcWwzeFFx?=
 =?utf-8?B?WXpqalVReklSM1FhcnVBR0YvT3d2YjFreG1kZk84UWdXUnBIeGRRQmltZmNV?=
 =?utf-8?B?bGhicGo2OFV4czN0VFE2dFZ1dGJqMi9aM1VyYmgralRsZDk4MXhaSWhVbkhH?=
 =?utf-8?B?cmVleE9jNlJUSkJBdGdhWVA0bE1KRGtpRTROU2VLR1hKSUx0VmZ1SWVRTmZP?=
 =?utf-8?B?dDJDMjQ1b1EydWNEM3kzdkhuWEs4c0dxWS9YZ3Z6aXVaRFFtbUpYaVhOU0xk?=
 =?utf-8?B?cnorUStSMUNXNUZQeVNwdXNxV25QNzdHTVVhaThod0ExQ1VuUTk3SXU1Qm54?=
 =?utf-8?B?TmtmRE9qckJqRGRIdE9IZDFTTk5KeFdEeUYzOTdYVEpmYml1UXBzOXJCRWlr?=
 =?utf-8?B?Q2V3Y1hlNlVoNEQ4bVNCL2RXMG9WZEQzZk5CUk5GMFNRTTROd2JIVWhyclVo?=
 =?utf-8?B?dmpxMmhpUDhCSnRWUmR2WlJ1RUhQOGRXR2N6TzJlSE02NWJaVkptL3dBakV5?=
 =?utf-8?B?RVpkcS9IdlUybytKaDlrYWJudlA5Rk9XaG1NTlRYTDBEVW9mZ0lUbEhMdTg5?=
 =?utf-8?B?UEkyRnZkNFQvcWpscHpyVkpLYUhVZEhVYTVPN295dVBQODJzYk9sMHAvMGhn?=
 =?utf-8?B?a3RYeGdqTFppcUY3WWxmSEhzZFZjQ1UwZ0dTbFdERE5ud1R3d1I2dTFFV01t?=
 =?utf-8?B?V09va0FEaFFqQzFabm82VjNTTC9ONUM3K0lSM0JqRHJ5LzRhdTFUQ1pHOGRG?=
 =?utf-8?B?WGpUdkorZ3dkd05YL0h3VXNXL1NlRTIvVkNwaTRRTWdmRTNmanJoU3NYTUVn?=
 =?utf-8?B?bm9OT3BQcjBKNDEwSGFnVWtGVXNlQUtLWDAzWGdzK0Zib2oyTlBhM2F2OGEz?=
 =?utf-8?B?TlNaeGtpUy9NK1U3K0o5R0duQy9nYXdPNmFJTFAyZGpFTlZwbTNaUUNoU2NZ?=
 =?utf-8?B?S09ya0pubkc2VWZLRFBnYkxVMHFTbjA3U3JwYlJZaFVHS0VmVUtZMXM3SWIy?=
 =?utf-8?B?amo1WlhFNmRCQTNxMEp6eUJuVUllTktYUERrN1M1SXBMUkpVMFVtY2x0RnZ6?=
 =?utf-8?B?bW5qZ1h5SzZRd3NQNmpQbFNTVGl6cHZNMzJ2Vm1xUnV3UHFGWWRMUHM3SlBW?=
 =?utf-8?B?cXBMdGx6ak50RU5pRVRLd2pOcFVGOU5TOFJuRHRFZlJqYjVWZXRxeU5MaHNM?=
 =?utf-8?B?QXRsbVJSMU12R2tNcTdMVHJEY2JueDVib0pjSm8vQ2NHNVpBODcrRzh2WklK?=
 =?utf-8?B?b05RRDhsZlVCWXFkWGJjczEveFBaN3J3NGtmWHNONHY1YkdPdUFmakRRQ09U?=
 =?utf-8?Q?qRa8e4gXd5w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWVuU0VJT3VmR0tzeUxDN0NGM2w5SlpKYWkrd0lQaHRvREtUUHNxMlZyY2ZO?=
 =?utf-8?B?OXhGTWk1ZWZzRkpWcldMeXNaQmV3RU85RENhekxuNzJvVU1tSVI0ekVDQm9S?=
 =?utf-8?B?ZnB2N2VoQWdVRjB2NU5EL2dleVR2N3VqYmk4ZHg3RnA2SGlOc0o0UVcvNmJV?=
 =?utf-8?B?OWIzaVAyZVdRaWZFYjZpcGpXTWdoZ2ZDZWRMbVFqUG44dUczNXRyNE4rdTV2?=
 =?utf-8?B?Ykh1cXdLbjIzdHVoMU5NcTIrZFZlb1c1bHVxc0N1UnA5VGIzSm83OUpNdHJw?=
 =?utf-8?B?a2FBaGd4OGhiUUZZWUxONXhYRE1UT3BUQlNFbjBsV2Q3K0FyU0lESW9uekxi?=
 =?utf-8?B?aHpjWTdhcysyK0grSEx0MmwxZzd3MmJZemR3SW9ZNTY4SnBMTDZCLzBuV0RW?=
 =?utf-8?B?N0hDK1VhUjJsUm4zTnVhemkvM1NMR0kvWEVlRnUxTW9Wb3UzSE93RDRMZGxI?=
 =?utf-8?B?cyt0Q2hIdkhnUEQvQklhcGFtRVF0cmY5S0d2Tjdkb3QwN1pSOGFwbEE1TDFh?=
 =?utf-8?B?bmJ3Sk1EL0xjd0x2S2NZTE9wa3QyRm5tbkRZUkNiUHBuVkhidjBzNGs4MWxV?=
 =?utf-8?B?VWl5MVN0bWhQOUpHOXlyVFJhRzJCTFVyb1NQVGI5dTdVR1pDY201cHZxYVlh?=
 =?utf-8?B?RGRkZ2o3WDJ5UU1XNjlBSmVFazNRQjJHcVNjNEFqWmNDU0ZoNGRnL3ZOMUht?=
 =?utf-8?B?dG1XdDVRT3RSbWFvQ0ZiTUg2eU1GVS82VHVSM2xpdGJ6N1k5VTBaNzdrK1Bk?=
 =?utf-8?B?RHVjOHpmSzZMREtYSnFpemFwN1BIcUlEQmtIZ21yY1FxQnhhQStOblQwK3F6?=
 =?utf-8?B?cnZnRmk0NDN6djZyN0RKdTM5dHlDem5BZ3N5c3BRWVNNNVMvNFJhRXZGWHpj?=
 =?utf-8?B?WWF6UmhTT3hEbGJ0VVBMdnEzUytvZmFzdkltQWhteWJUYTBQRkpMK212SzVK?=
 =?utf-8?B?M0tCb0k5WG9Ndy9QSjg0SWUzRHVlU1BhNFhVSktrV1h5WWZ2aThzejFNbjRS?=
 =?utf-8?B?SVQrOTllS3VENm5TQldqVUprcTJkbngrMjZrT29MMG1Gb3VDMy9GTUFEZ092?=
 =?utf-8?B?TzVKZWplT2t3d1dMRkIyRGw5ZCtwQ3oyRUZGaU1UeW40RGhkTEw2YzZsamd4?=
 =?utf-8?B?NmhLR0FJY3ZySDRKeWYwelgrbjhVdWd6dkJOeFc1ajVGUmZXTEdSaU5wOTVL?=
 =?utf-8?B?ZE9lNnlRVHJuZEIwWnRtblZXSWJIbVJOYll6OXBOSHk4eHBLbHQyeStPdGs2?=
 =?utf-8?B?LzF2S245d2dkUXNXdWsrbi9WTjFERWcxamhmVnlIdXdoaHdDdTVZelhaQXlo?=
 =?utf-8?B?WlNyaVRFazBXTWU4ZStCZW5GdGM3bTVBR2tQRVNXTHMxUkE4YmlIa3U5cDZZ?=
 =?utf-8?B?NlVZTk5DRElHeDBuSnZzK1IyZk53SlVXallLZnFHTCtMa09xbGRaY1ovY1d2?=
 =?utf-8?B?TEN5aTdtTEViem1xbGFXUFBPWEhUZDh0Smg5dENLRDIwWS9IdUZDZ1laZDlv?=
 =?utf-8?B?VTFEcEpmNE1GdmFrRlZxVjVaNk54TnQ5cGhPMlhjajNhaXpGeTFJaUNwVEU5?=
 =?utf-8?B?d2hsTlJnMGRwOVV4Nk83OVF6YVZsZlVXcEMwYmxuTzZPZHFMY3RTa2FaNnFN?=
 =?utf-8?B?dDNpMFAzUEtTOW5pd08yVWtUQWN2K0dIUmVqSzlXazJacFpFR0ZxWUx3NVRn?=
 =?utf-8?B?WkVvSTFwQUVQT2daaVpHbXU0cVN1REVnQWFJamR3MWMrTnFyNWNoVkhqRGov?=
 =?utf-8?B?WEF2cHJSaE1WOGtCUEJhbnFoYVpieGM5MWlTV0tsbXBzaW5oOUpneE1UaEFh?=
 =?utf-8?B?VC9QZFlEanlBOFdncGFVVDd2eEUyWEZ0ejlTQ0ZYekZ6NVNoN2JXZ0o4WjZh?=
 =?utf-8?B?c1pibVFkMUZWeis2cXJOUW5oZ1U3dERVQ2dOK3NKcWVGQ09SN2EvTmVYSHBs?=
 =?utf-8?B?dnhuK3ROeVllMjZ6aUhlWmFsbUg5T1R2MWQ2L2VZRU9rTG96eFFFczJxbFZO?=
 =?utf-8?B?dXdWNDF0aGxMbW9EZ09WN2w1NmNURVZqVjBwL2NuYVRLdFRneW9PRURWTUpS?=
 =?utf-8?B?MFpTNy93eW9MWitPSWZCMklRVVNJejBLQVZuN2ZQMW14Y2VaREgyd3p3bmcz?=
 =?utf-8?Q?ZkxGHaYsNpcFH6Usdox5vikxB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5a2b7dc-4bd8-4646-1445-08ddb7cb21b4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 11:42:03.1708 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IYkEbGQQggE2STJIM3TxYJPtNriYSSGdIwb6gzEqcXwdC3PjFBoWstiAzKR6ulSW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6614
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



On 27.06.25 11:49, Sunil Khatri wrote:
> move the debugfs functions from drm_drv.c to drm_debugfs.c
> 
> move this root node to the debugfs for easily handling
> of future requirements to add more information in the
> root directory and one of which is planned to have
> directories for each client in the root directory
> which is dri.
> 
> Suggested-by: Christian König <christian.koenig@amd.com>
> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
> ---
>  drivers/gpu/drm/drm_debugfs.c  | 33 +++++++++++++++++++++++++++------
>  drivers/gpu/drm/drm_drv.c      | 19 +++++--------------
>  drivers/gpu/drm/drm_internal.h |  6 ++----
>  include/drm/drm_drv.h          | 19 +++++++++++++++++--
>  4 files changed, 51 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
> index 2d43bda82887..5807dd64d28a 100644
> --- a/drivers/gpu/drm/drm_debugfs.c
> +++ b/drivers/gpu/drm/drm_debugfs.c
> @@ -44,6 +44,9 @@
>  #include "drm_crtc_internal.h"
>  #include "drm_internal.h"
>  
> +static struct dentry *accel_debugfs_root;
> +static struct dentry *drm_debugfs_root;
> +
>  /***************************************************
>   * Initialization, etc.
>   **************************************************/
> @@ -286,16 +289,35 @@ int drm_debugfs_remove_files(const struct drm_info_list *files, int count,
>  }
>  EXPORT_SYMBOL(drm_debugfs_remove_files);
>  
> +void drm_debugfs_init_root(void)
> +{
> +	drm_debugfs_root = debugfs_create_dir("dri", NULL);
> +	accel_debugfs_root = debugfs_create_dir("accel", NULL);
> +}
> +
> +void drm_debugfs_remove_root(void)
> +{
> +	debugfs_remove(drm_debugfs_root);
> +}
> +
> +void drm_debugfs_remove_accel_root(void)
> +{
> +	debugfs_remove(accel_debugfs_root);
> +}

Those two can be removed together as well I think, apart from that the patch looks good to me.

Regards,
Christian. 

> +
> +
>  /**
>   * drm_debugfs_dev_init - create debugfs directory for the device
>   * @dev: the device which we want to create the directory for
> - * @root: the parent directory depending on the device type
>   *
>   * Creates the debugfs directory for the device under the given root directory.
>   */
> -void drm_debugfs_dev_init(struct drm_device *dev, struct dentry *root)
> +void drm_debugfs_dev_init(struct drm_device *dev)
>  {
> -	dev->debugfs_root = debugfs_create_dir(dev->unique, root);
> +	if (drm_core_check_feature(dev, DRIVER_COMPUTE_ACCEL))
> +		dev->debugfs_root = debugfs_create_dir(dev->unique, accel_debugfs_root);
> +	else
> +		dev->debugfs_root = debugfs_create_dir(dev->unique, drm_debugfs_root);
>  }
>  
>  /**
> @@ -322,14 +344,13 @@ void drm_debugfs_dev_register(struct drm_device *dev)
>  		drm_atomic_debugfs_init(dev);
>  }
>  
> -int drm_debugfs_register(struct drm_minor *minor, int minor_id,
> -			 struct dentry *root)
> +int drm_debugfs_register(struct drm_minor *minor, int minor_id)
>  {
>  	struct drm_device *dev = minor->dev;
>  	char name[64];
>  
>  	sprintf(name, "%d", minor_id);
> -	minor->debugfs_symlink = debugfs_create_symlink(name, root,
> +	minor->debugfs_symlink = debugfs_create_symlink(name, drm_debugfs_root,
>  							dev->unique);
>  
>  	/* TODO: Only for compatibility with drivers */
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 5d57b622f9aa..68f50d915153 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -69,9 +69,6 @@ DEFINE_XARRAY_ALLOC(drm_minors_xa);
>   */
>  static bool drm_core_init_complete;
>  
> -static struct dentry *drm_debugfs_root;
> -static struct dentry *accel_debugfs_root;
> -
>  DEFINE_STATIC_SRCU(drm_unplug_srcu);
>  
>  /*
> @@ -184,8 +181,7 @@ static int drm_minor_register(struct drm_device *dev, enum drm_minor_type type)
>  		return 0;
>  
>  	if (minor->type != DRM_MINOR_ACCEL) {
> -		ret = drm_debugfs_register(minor, minor->index,
> -					   drm_debugfs_root);
> +		ret = drm_debugfs_register(minor, minor->index);
>  		if (ret) {
>  			DRM_ERROR("DRM: Failed to initialize /sys/kernel/debug/dri.\n");
>  			goto err_debugfs;
> @@ -752,10 +748,7 @@ static int drm_dev_init(struct drm_device *dev,
>  		goto err;
>  	}
>  
> -	if (drm_core_check_feature(dev, DRIVER_COMPUTE_ACCEL))
> -		drm_debugfs_dev_init(dev, accel_debugfs_root);
> -	else
> -		drm_debugfs_dev_init(dev, drm_debugfs_root);
> +	drm_debugfs_dev_init(dev);
>  
>  	return 0;
>  
> @@ -1167,10 +1160,10 @@ static void drm_core_exit(void)
>  {
>  	drm_privacy_screen_lookup_exit();
>  	drm_panic_exit();
> -	debugfs_remove(accel_debugfs_root);
> +	drm_debugfs_remove_accel_root();
>  	accel_core_exit();
>  	unregister_chrdev(DRM_MAJOR, "drm");
> -	debugfs_remove(drm_debugfs_root);
> +	drm_debugfs_remove_root();
>  	drm_sysfs_destroy();
>  	WARN_ON(!xa_empty(&drm_minors_xa));
>  	drm_connector_ida_destroy();
> @@ -1189,14 +1182,12 @@ static int __init drm_core_init(void)
>  		goto error;
>  	}
>  
> -	drm_debugfs_root = debugfs_create_dir("dri", NULL);
> +	drm_debugfs_init_root();
>  
>  	ret = register_chrdev(DRM_MAJOR, "drm", &drm_stub_fops);
>  	if (ret < 0)
>  		goto error;
>  
> -	accel_debugfs_root = debugfs_create_dir("accel", NULL);
> -
>  	ret = accel_core_init();
>  	if (ret < 0)
>  		goto error;
> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
> index b2b6a8e49dda..d2d8e72f32d9 100644
> --- a/drivers/gpu/drm/drm_internal.h
> +++ b/drivers/gpu/drm/drm_internal.h
> @@ -186,8 +186,7 @@ void drm_gem_vunmap(struct drm_gem_object *obj, struct iosys_map *map);
>  #if defined(CONFIG_DEBUG_FS)
>  void drm_debugfs_dev_fini(struct drm_device *dev);
>  void drm_debugfs_dev_register(struct drm_device *dev);
> -int drm_debugfs_register(struct drm_minor *minor, int minor_id,
> -			 struct dentry *root);
> +int drm_debugfs_register(struct drm_minor *minor, int minor_id);
>  void drm_debugfs_unregister(struct drm_minor *minor);
>  void drm_debugfs_connector_add(struct drm_connector *connector);
>  void drm_debugfs_connector_remove(struct drm_connector *connector);
> @@ -205,8 +204,7 @@ static inline void drm_debugfs_dev_register(struct drm_device *dev)
>  {
>  }
>  
> -static inline int drm_debugfs_register(struct drm_minor *minor, int minor_id,
> -				       struct dentry *root)
> +static inline int drm_debugfs_register(struct drm_minor *minor, int minor_id)
>  {
>  	return 0;
>  }
> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index a43d707b5f36..a02bf4885b79 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -566,9 +566,24 @@ static inline bool drm_firmware_drivers_only(void)
>  }
>  
>  #if defined(CONFIG_DEBUG_FS)
> -void drm_debugfs_dev_init(struct drm_device *dev, struct dentry *root);
> +void drm_debugfs_dev_init(struct drm_device *dev);
> +void drm_debugfs_init_root(void);
> +void drm_debugfs_remove_root(void);
> +void drm_debugfs_remove_accel_root(void);
>  #else
> -static inline void drm_debugfs_dev_init(struct drm_device *dev, struct dentry *root)
> +static inline void drm_debugfs_dev_init(struct drm_device *dev)
> +{
> +}
> +
> +static inline void drm_debugfs_init_root(void)
> +{
> +}
> +
> +static inline void drm_debugfs_remove_root(void)
> +{
> +}
> +
> +static inline void drm_debugfs_remove_accel_root(void)
>  {
>  }
>  #endif


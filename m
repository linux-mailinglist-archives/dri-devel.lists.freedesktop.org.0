Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 001D293C73C
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2024 18:38:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 645E410E2FE;
	Thu, 25 Jul 2024 16:38:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="hYde+nV1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2076.outbound.protection.outlook.com [40.107.244.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B94A10E2F6;
 Thu, 25 Jul 2024 16:38:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m6Xc+evGD4xLdUezDD2gTMJbCqvSc0EowaNjqzTqeH5jUpwDiQbHNSL5Wa2eDOWJt9lw+FG4B1DZgaesbHaFFcetERX7l+XExIfoZPvPtBiq+IGsSfcwNn8Y6c6/RbM4OcexDoxuytOg5HMIAL9CfXi71O63nmTY/F/jMRhjEjo/N9Zzs6KFf3agfIBFeH9jSNs5qPXK70jugb/jCKKZfXKunDkcVPTEbU8gTVE/XPNXObcJJoSkJwbKgjVFj3E095VgSvohnmNWydCFrv9TkiqHiTOkSgH00S2RIfuKqUmvIKTp3oC2sit2JP8kVR/yQp7ad6l09ruUD3bFPZn9Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ERbTumf57iz7e76DO5MxWDmrL+Mi43OBAQOTN3jWqY=;
 b=V8UVgadNe7r/atHreNT2iQchK1kXApTq9AOeuj2p5RSzTLb39P2+DMbpRYSVA4zsDBzHckeI8oK4+ggmnbMtotKsxsOO6RNLc5rwEOGmHUex6cmrbE+6TISKyTSRhX5BO10pxFaz9JdNikLO5oEloC2qWGd8w2H//uXfHGbxJ8hwpr60GPzWYZeJDZCpCXr7Sxvkfy/Mg963Je1Y26QO/Nve48pwMJ0AdFRej6ao/CiimU33GDINt1pTAluW/HooiJWkER5id77J3mXVJIr8lf5afxffAiCyQIgDwFlAzRJHJYWOCIJR0s04ifI3gGexbgdLqtJ4jagis02Jy017ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ERbTumf57iz7e76DO5MxWDmrL+Mi43OBAQOTN3jWqY=;
 b=hYde+nV1kWaB50dIUI7fVPzjJBIJeZ/Q/GJ6p+l2hWENQ/Ds2hNxm+DsiXI7ZiLTgWtxRhv9MTH2ZyJVXb9hl+zRWkFqRnstEnUIIhYGVcI4MBRA7RFetgjOM2NClz5kRAGGo+x0PvtN1PqBpXVW3+vQRGZzbs8Ot+re1sLdItU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB8495.namprd12.prod.outlook.com (2603:10b6:208:44d::9)
 by BL3PR12MB6475.namprd12.prod.outlook.com (2603:10b6:208:3bb::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Thu, 25 Jul
 2024 16:38:30 +0000
Received: from IA1PR12MB8495.namprd12.prod.outlook.com
 ([fe80::97d3:87e9:1c4c:c692]) by IA1PR12MB8495.namprd12.prod.outlook.com
 ([fe80::97d3:87e9:1c4c:c692%4]) with mapi id 15.20.7784.017; Thu, 25 Jul 2024
 16:38:30 +0000
Message-ID: <2ba30e17-609f-4a74-8482-15281dbbfdc8@amd.com>
Date: Thu, 25 Jul 2024 10:38:27 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/11] drm/amd/display: don't give initial values for
 sad/b_count
To: Melissa Wen <mwen@igalia.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20240706034004.801329-1-mwen@igalia.com>
 <20240706034004.801329-8-mwen@igalia.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20240706034004.801329-8-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0185.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:110::29) To IA1PR12MB8495.namprd12.prod.outlook.com
 (2603:10b6:208:44d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB8495:EE_|BL3PR12MB6475:EE_
X-MS-Office365-Filtering-Correlation-Id: a20a0ef7-956c-4e73-56ff-08dcacc8376e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d1ZGZW1jMTFrVlhDTGJiUU5HQmdRa21zQ2lOb1JuSU9xT3BRdVB4U0tXVUc3?=
 =?utf-8?B?dG5mSFV3ZVZ5VGprNkZMQkZHNnpKWHFKRXRoUVZiNlFwT2Q3VHZLeWdGWU5W?=
 =?utf-8?B?cXNwQ2RsaGhZcWovK1ZBSVhRai9EVUJoWXJhOW1kWmJDVUtWMW5rK1dtZ1hB?=
 =?utf-8?B?NkZKeXNKTktIL1djakp2SnNTUWtZeElLQTd3VnM2UVJ5eEtLemlDRUI3OGNt?=
 =?utf-8?B?MStoWUtNa1JHR1JrT3JtUGh3elEyMUtZL3hGOXlxNlJRUTlObXVZZUdGckd6?=
 =?utf-8?B?WGVMREsrUDYzcG1xYWNTRDJqZkl0Z2VRWmcvamNPVEFSSEpHY2Nad1BCZWNN?=
 =?utf-8?B?akl6SEdFZytRZ3pjS3hEMkVkZWtNdEp2OURGMkF0T2xXTDM5b1pzdW9WSmhW?=
 =?utf-8?B?cm5LZFNDS3FsVmJ3QTR6c1BqcnRTWWFtUVoza2wyMkVmOFhESXV0YllENzNL?=
 =?utf-8?B?YW5ZOEFnSFlqeFhvZEJqYzQ0d3BDQXg4NTNmNlBINUtMWGZITFJ2eGhiUmNX?=
 =?utf-8?B?dGZZU0dSNWVLQVovWVBXSzUxaW9BMlU3ekxPODBRZ3hORktoKzFZS2wrWDBY?=
 =?utf-8?B?dFZBSHZLM3NVRVlIZEIraWJVbDBURzRBOGxoc0loYkJDZTlkamp4MG8zT2Rv?=
 =?utf-8?B?dEZJdHNSYXI2Y0NmUjVoTHRUckkvajN4b1ZDTWY1d0xqTU9VcEt4WGVQd1BK?=
 =?utf-8?B?dmNVZGg2eUk2ZENJV3V0TzVTcEhVN0tWeHBWZXNmWjRUYzFmVFlwRWEyWU9I?=
 =?utf-8?B?TGJDQkx3N1RUWUNvOXphMytFWUNwOTFiWDBWKzN1VDdXckRRYVRFNlkxcTV6?=
 =?utf-8?B?VEc3SjlGYm9SQ3Zpek5nU25Memx5YjFrd083cTk1Ym5yaU84dFZlekFJcERT?=
 =?utf-8?B?Szlhd3cybWhOMUd3NVoxS3VpcnV2YXdBV1AxbXZpR1AvMlhlVUxrY0MyRWwz?=
 =?utf-8?B?L1ZMVC8rRG5IWVBBQk9CK2k0YVk5WGg1cHdEelFzWTZZZ2FacVJpKzJZNWJY?=
 =?utf-8?B?OVYwMVd6SGdFUnAzdGtidXoxMDZPdEl2a2hLSGx0SWdjWFJmNjVvRjdhemNy?=
 =?utf-8?B?TmxSb0xXSFJyTmVnSTZmU3FTNDcwRFhiNmNrdnVqVWcvWElJY0tocnY3UG01?=
 =?utf-8?B?NlF4RTRrOVJJbXhHbFEzOW9LdGs5TmtTYk5HZWpadHpkOFJKb284cE14bWRx?=
 =?utf-8?B?NVluL2NvdUtjdVdTdWpDZzJJbFhVeUxyb0dYRDMwT1BvUzZVMkVTWldiamli?=
 =?utf-8?B?UFllOS9WNG5scGVCTWwxSUdQcy9jajBoNVdTS0FTbHRmWmYvZ0NVa05wSlBG?=
 =?utf-8?B?Z21mUGpnaVpzV1Eyd1dNR2UvR0l0VDI0c3pqYkVQSURvVGtuZjZuZkdrVExj?=
 =?utf-8?B?aStza1pkTkkrVlZockh2ZGVBWjZpaXBBeDFuallSY3htbWsrWUcxTHYwdnRT?=
 =?utf-8?B?WXBBN2crczZWU1dYdXpmNnZYcHVsNHNUemxXNVNJRmlpQ1l6Z1ZOVVU4Y2lJ?=
 =?utf-8?B?VXFUd2dxTld3VzN2VDBTOEpKZFZLQm9UbWt4SnFtYlpIS1NUbVV0R0Ezcm9w?=
 =?utf-8?B?b1FiYUQzVTE5cXRUdnJOS3Y1SHM3bEhwbXZkTHY0MDBrKzdYV1ZGKytQTzZG?=
 =?utf-8?B?ODlablhkbXZoNWd6TURYbHhlZ3ROTk43Rm85QUdtVkx5dnRQNmcyQXB4UVBP?=
 =?utf-8?B?eWVnSFVKSXl2WFhGRmoyTitPNU5Yb0gzR3BkMkxGUEUyNzVaektMdE1xUTlS?=
 =?utf-8?B?UnQ4ZTh1YnEvVDVnYUFCT1A0NVh4Z0gvZUFzMXhPZHdoR3I5dWdJSXVtQitn?=
 =?utf-8?B?N3I3RUROcVdwdm53b0czdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB8495.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVlKLzU3V2JJbWFZRURaR3g5N1ZLWTBNMURSTGY5N0dUU1N0bEFEbkNETHhC?=
 =?utf-8?B?WHBFVEZoTGhWQjJZWm5KejNOZWRTNlNQVk1ZYW5yTUdvMHpTUEg3bDBkUFB4?=
 =?utf-8?B?WWNjNC9sNnNydnE0eVVvbm1FVVZrV2ViQTV2RUlrMjdVVnFKMVVJWnBVUUhx?=
 =?utf-8?B?clZ5Sk1uRFdwVFpwaHV0VTJjOGJ5Q096cmZzbDhPUWdXOWVlN0hvVTdydmhE?=
 =?utf-8?B?MjNvcDd6dEVkdHhjZVZVZ3VoL1JJTCtVTmQ1NlJSNUowaWc1bVphNXUya2ts?=
 =?utf-8?B?TWVvclYyQTlVZUsxY1NlK1pFRHRpRXJtRUNobGpBaU5mRmhiUi9VSTBEWk9M?=
 =?utf-8?B?ZEN1WmllZFJDbzA3ZlUrY0dVNkYxWlI1ZzE2bXdWeDRia24rQ3lBaU5KOHlR?=
 =?utf-8?B?SHRaVWIzTHEydTZGc3ZneUxlMW92NmhvbkVVN3VxcXJsOHo4cWNBVmp5blJY?=
 =?utf-8?B?K1lnTGNpazJDLzFqa2ZsdFphdVBUWW9QcDYydGJzaW04UVprZGlqYWZUWnpa?=
 =?utf-8?B?RVJDd3U0UHcrRml5TTZKMUY0TEdXUjVkMFZ2cEVRM3BIUVgvWFJ2VElRZ3Ir?=
 =?utf-8?B?cWlacUlVdjFud0haenAyQ0VuVDFjbjZwUE9xeWlORHZ4dm1taU1VZUNXRTcx?=
 =?utf-8?B?ZlcweWdvL3NKVitRMHNHN01sclpJbktla0RkTHJZZjc3K1lMQ3d6K2RUb3NO?=
 =?utf-8?B?aHhQZXc2TEtIVlZEZkc4azN6dlVseDlTUllLOG5pb0tlNjc0OXlqZ1pqS1VD?=
 =?utf-8?B?NDltVXFyQ0tkZUlBNS9lcklZZmZOaXNVcjJVNEhXVTNvZEliNG1vTnVHclRY?=
 =?utf-8?B?dml0Znptb3c1cTllbmJWZk5TOHp6clpiSnl2S0VCZmlLU0YyUmV4MEE5bXJ2?=
 =?utf-8?B?U3Nnc2xxbVdYUzVoMnJTQzZMRVhxWE5XQm5YN1RBaE15ZkVldVlmM2d2bFUv?=
 =?utf-8?B?TDZseit2V3pzNlZITHYraENjSnFGRGQwS0JObEc0ZVkwUlNuc1IrczFBYnZ4?=
 =?utf-8?B?bE9xeS9iQ0tTdFZjWFFsTDh2ZXJqUlFaakVqeHR5aFBEVTFRUVVQaEhpZDB5?=
 =?utf-8?B?V1A0THdZTStnMkRMODU3SWpNZ0FTTTdST2hLdHllSzViVXA1S3AzOEJURUx1?=
 =?utf-8?B?ai9qdytUNHFBaDJBZWZkY2d5NE9BY0RJREZCQi84Zm1QYTh0ZUFrK2QrTkZZ?=
 =?utf-8?B?ZVR1Y3lFTk84SXE1Sy9tcW9aclhPbEE3alA4OHM3UmlBQ0lBaEJ0V0RnRm0r?=
 =?utf-8?B?VWZjckhhZkpNMXVmd1RTNEFNSFR6eXRXcXgrTkg2OHk4NW9UTzF5WE9kYi95?=
 =?utf-8?B?RDZaZ1JZaHdOajFiUXRxMnhYd2ZFaHBXZTJwcnNiTkx0RkZna1AzT3FXbm9L?=
 =?utf-8?B?L2tOdUtENnVNcTRKQ2l4cytseUlTejkwOGtIanQ3cnRYWHdRNGR2Ynk1MUZM?=
 =?utf-8?B?RnRKZ1poeXJRbm9mOThjQldXbnFyUWIxRWhVb0RCOVZtTTR3YjlEcllicnl0?=
 =?utf-8?B?RmNDV2MwQ3JiYlFjdWRhUVFpZzBNYzU2dXFLTDRXTmV0aTFaSXRyZVJjcGsx?=
 =?utf-8?B?RUFscG9MMzQ1akY2SS9TbWRXTWxQb2FFb2F6YkVvbSsrMWd4akVZZzdjd0Rx?=
 =?utf-8?B?WkxoRllSWW9TYmZMRlIyY1d2TG93Z0Fta0FJSFlRaUdTWGRuOVlJcXIzdmpr?=
 =?utf-8?B?ckJiQ3MyTWdKNzBvck1MWW1KVVNrdmtrdUlVaWtXaGp4c3QrUHdKc09iSHU4?=
 =?utf-8?B?bWpNVzFUSlRhRm5ZdG5DS2Y4cE5TVWsxZnBmMHNKSHRpSDJlY3FsVGY0QUky?=
 =?utf-8?B?QjdPQmhPdnlDSnpmRkxXb2c0YnZTc0Z6Zmk3WDhUL0FHMFlnSUdDWDVYT2cy?=
 =?utf-8?B?b3FjK1pSaThvZkFQYWQrU0FCb0NLVmVxUGdYMEhuNWlXQ20vNzV4Tyt2bERM?=
 =?utf-8?B?QmdaeDNQOEFBQ3hsRHE1V0hMSmlVSXEwUGhqdTU2dzArWkdpOVQ1cW1qTXlS?=
 =?utf-8?B?d0U5akFBcnA3MnJvL0xGdFovZmRiRXlnZi9XU3dUSHpRN094UVpiczMvaFYz?=
 =?utf-8?B?akdrcFRNYllOS3JrYlF0N1Y4c24zdDZqazZzdWp3bisvMUUzbkc4Y2p1anRF?=
 =?utf-8?Q?v4Eqtr7WJg8b35FP5mayqKvEK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a20a0ef7-956c-4e73-56ff-08dcacc8376e
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB8495.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2024 16:38:30.4243 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IFsy+iZqXv/98q/E44UDaFTG6cXklWWknc4hGe3hu/K4PV5hNMYtdfx+yRWtKWvx6PySb/MfRPOLexjyBP20Rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6475
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

Can this be merged with [PATCH 10/11] drm/amd/display: get SADB from 
drm_eld when parsing EDID caps

On 2024-07-05 21:35, Melissa Wen wrote:
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> index 85704fd75ee4..6df55161d6df 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> @@ -97,8 +97,7 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
>   	struct drm_edid_product_id product_id;
>   	struct edid *edid_buf = edid ? (struct edid *) edid->raw_edid : NULL;
>   	struct cea_sad *sads;
> -	int sad_count = -1;
> -	int sadb_count = -1;
> +	int sad_count, sadb_count;
>   	int i = 0;
>   	uint8_t *sadb = NULL;
>   

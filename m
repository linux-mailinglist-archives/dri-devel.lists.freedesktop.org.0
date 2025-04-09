Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 418C8A82A43
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 17:27:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEB1210E93E;
	Wed,  9 Apr 2025 15:27:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="n+WxmvY/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2074.outbound.protection.outlook.com [40.107.94.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35A8110E93E;
 Wed,  9 Apr 2025 15:27:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Walu8BtX7zwz2w5Nz46whhd/bf5tIEpxq/LnuA4rfmMdjrXN6s9pISq/kPwx5jXEC3CtO2Krq6bhgTYeJJZLvA86BwaK+TRYaDX8HPCtjLaFY87meNkcxFHKY0ISI/hMzVA8CPqdomUjQj00KGXHJ7XjuSePAXZymkMGcIF7JWEYJ4nTdGsOGQT3uDRAWchCLo/a0exNV/vdWrW9AsASC4KnLJR7hBXmNgCddj9f/7mfmVEHeWDxCKzFjE3cGYcFOEz/08+1mHWP/8ocwkDuGFAODlGCP5Wx/biwJxU5Qbngiu2etZFNz4ZL/Ja71yDY1l9p6P/zCTxaaWdqVQ14qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v8LlD0HenC+LjojCWHuqqgvnLrwkdABYnFATE4MmHDY=;
 b=k9mbkaB02aTghsKvJMoopkVf3cC81yFyUDXNKJOMpwvloOUTSpgvbIwZvws1ttUs1yI9SQohq43RKaobd6W53SbL4gsjZsnqRIxNTHTWbzVU6Vo+U+O/NesEwkcWJfaboMq9xgsOC/Ke4HX7b6DdXbpUFb6ra6wlQ3GByFdh1zFWkngKi4baEdGK47hSvGwLyl00WpBX5Kq3pzuUdzAd+JcTx6eNx9QvNLKzjBy003Nak/RZ2Pgy4MtlKG5Wgrb3rKB8CeM+xi9aRgLzUZxATCFcftnsnsqxLXN0ipsU7XVtTH1NObQmJBQgpYjnUzOBZByD3A9x8dCqHy/dcY2vEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v8LlD0HenC+LjojCWHuqqgvnLrwkdABYnFATE4MmHDY=;
 b=n+WxmvY/svggGPgC+b5s0WMDKy5+djRMaMBGv7LQ+B9JqNJODcsGOpdYK5slM4aCyOTUN/V2THWR/LdBFqoyW3ZFWZhH/LePrS70JgBnU52I6t45W8gRkPWWZDZBNexE8mToXs0Cy4u3Q8yEkFFDn10d9TJDHTwymlM/vuK8CBs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by PH7PR12MB8037.namprd12.prod.outlook.com (2603:10b6:510:27d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.22; Wed, 9 Apr
 2025 15:27:46 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%4]) with mapi id 15.20.8632.017; Wed, 9 Apr 2025
 15:27:46 +0000
Message-ID: <ffe208f5-ced0-40bb-aa3f-d4caa3796095@amd.com>
Date: Wed, 9 Apr 2025 09:27:42 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/amd/display: Add error check for avi and vendor
 infoframe setup function
To: Wentao Liang <vulab@iscas.ac.cn>, harry.wentland@amd.com,
 sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 simona@ffwll.ch
Cc: hamza.mahfooz@amd.com, chiahsuan.chung@amd.com, sunil.khatri@amd.com,
 aurabindo.pillai@amd.com, hersenxs.wu@amd.com, mario.limonciello@amd.com,
 mwen@igalia.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250408022018.2786-1-vulab@iscas.ac.cn>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20250408022018.2786-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0070.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:88::24) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|PH7PR12MB8037:EE_
X-MS-Office365-Filtering-Correlation-Id: f2be1e7e-54f8-4723-3bf1-08dd777b1447
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Wm42TjkyY2RpNStWdFR1U3o4MTdtU2htVFV1U0pHL0h0UzVUSUdIWGZueGlO?=
 =?utf-8?B?WTNUeEZqbkVEdW9CQi93SlBFeGh5Q1RyVzMxVGxQRUZqVG1OWGc0VUFzSUgw?=
 =?utf-8?B?MTFTRWkrdW12U25oTThjWUh5WlEvcnAyT0dnbkV4S2Q3YmdUMFlNQVpnTWJG?=
 =?utf-8?B?Z1luTXdjeDBhclJuQzlnZ1BLRTcxRTFVazh3bVM5dHBSWXplZjFIRG9qWDVP?=
 =?utf-8?B?YXJXL0hmY1luMGlLZkV4QThFVW16L0xSdHNwc2ZLaTFuUks5RmYxZFJsQmhL?=
 =?utf-8?B?NmN2a2tOam4yTmhnQlEvMlhvS2dxMzd3L0p5enVnUkVwVkNVcnY2MHY4TzhU?=
 =?utf-8?B?bHB0aXZXUjJDUGV3c2lvNFZFbUZqZzdSTmxwb0d3YjJmOEZPWk54YVJXTGNJ?=
 =?utf-8?B?bkQyOE9jc3dkSGlZSTN4QkdIOHB2SzQ1SldBMkFPNXBOZ3BsVFZPbmV2b3NP?=
 =?utf-8?B?Qm5kdDhHa0o1MWNuekJ4TFl3T0t2bVd2VnVmdVlIbDlHNjVMQnZhd29scHph?=
 =?utf-8?B?Z0laSS9ibHBxZXBreURiNERxWXRLRndpU2FySjcvMml1YUVRY09CWXRHV0JM?=
 =?utf-8?B?NWlNUzgwa2RCWHlmTHJXMVArYUhpMjh4SG91NmJJcm5DZGFyMmlXUy83VzN1?=
 =?utf-8?B?QzNtV2tZK3h1czRJeWgvajNhYzVaeVF4VjYvQS9TNCtYb3NTbUFPY3BhZHkw?=
 =?utf-8?B?ODRZL1ZVRW1jK0ZGNkxlVjAzSGt2eFNHR1NxVUV2WmVnSlgrUXpSZWNZYVYz?=
 =?utf-8?B?RE1BWTNSZFMyaTVOVkRBSUlIYSs0VHRoa2N6L0FBZUg5aDBvT1ZmTjFNVVlF?=
 =?utf-8?B?ajBIbUYrSGxqaXJ1Wk4vQ1VBUG1sWFpRRGlwMExPMHpFeVJuanZrSTRnUHg5?=
 =?utf-8?B?R3lEckticWNnWkUrU2tpSHVQNTJEWkhqY0MwNzZQTnc5UXV2cWc2Q1ZFbmF1?=
 =?utf-8?B?c3pWYm5KL2NreXk2YnFvYzZETkZkTWxFSTMyM3cwOG9UN3NNUEdma3dqd0hr?=
 =?utf-8?B?aXBSNFM5WlZidzYzMlNPQTZEcloxVHF0SGxTUE9vSVpCRDcwZnNKNm5IWHZW?=
 =?utf-8?B?SlFIYUpLZHJ0Tkg2dXBFTU0vcTdpT2I1T2dqQUhDelp4OTJCUmVJZVpLdEZr?=
 =?utf-8?B?azBHSXNNQVlMVWVFQVJaUEZlNGNqTW01cWJiMTlZTUpCYTgwdkRwdjMxNVQ1?=
 =?utf-8?B?c2RBNmNkUGphYnpwS2paVHJVTkYzZEh3UldlZlFDZDgxNnpXcFkyMWhBd2pC?=
 =?utf-8?B?UWIrNUNCWTlVei9JVFJtZlo0NDdEMDRiMkoxc1lWZU9PblVlSWhxbHI1U0Q3?=
 =?utf-8?B?Zkt0eHJwemZDRU1qNGVlaW9DYlZmcjRlc2xNMDJpWnk0NTRFaWdRVU1obVNS?=
 =?utf-8?B?b1NSdGlnMnMxeG5mZDgxTDhJSnpualRodU5VZ2hrSkhYeDFaTkRITWVScjN0?=
 =?utf-8?B?eEwxa3U4MDJUaENNcDdEaUQ0QzZDSVoyQW9BNmt5UzR5aDVLMTBpWCtCM2lB?=
 =?utf-8?B?M1pTQTkyaXRNY3liTUQ0N21BbFBYem9ua1NvdW9ZalBkeWxIYXYzQ1FXMWdq?=
 =?utf-8?B?YjRjMGR5V2RzNmI0OHlNdWJLeEc4TGZqLzdnVTUyVW52Sm00akw5SmtvaHZp?=
 =?utf-8?B?Z29TUkx5ZVZmUENyNW5UQ0lMYnFhdW5VQ1d1WW1ubFdJWGJWdnhhZ3hZTUYr?=
 =?utf-8?B?MnNDR0k4Y0JnZnlUVlZ4Z0hLSXAvMzBzWVVhTVlhREs3YnM4cUp4UitJNnl3?=
 =?utf-8?B?a2dGVzJSL2hhVTJJV2dIQ3dTRXJSdU03aEZWOWliMS9jQnRXRDNkME1XSVA0?=
 =?utf-8?B?VUI4czhETUVTekdNTVJtT1FXRHJCMktWTXhUMkdSZWxuZzNUVnF6OEg2U0kr?=
 =?utf-8?Q?RrskEzXln872N?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZXpYeHYwY3poUEQ2TVF6MUlSdWxabmtocWJIeVpmZEhnVWxEaHd6WTVpYk9n?=
 =?utf-8?B?MjFMMlVKaS9ZWDBFUCsxdFV5NEhaRVc5c3JKTjR6ZnJwSEFBQ3htNTR5VFF6?=
 =?utf-8?B?eUQyODBFREJMcXNqb1d2TTltS01RTlJPV3JiMlNqOXZWSWt0aXhFQ1VGS2dT?=
 =?utf-8?B?dXBqT3A5V1FmenZZdTFkWUF3bFZiQWJoSFBYaVJRQ2ozNnZNRUdUd1JPS3FF?=
 =?utf-8?B?YzkvSDl0bjJ3Ui90dktMS2txSG5FRXBvTUhWLzlEdkpOcDdXQW9zYnd6RFZ4?=
 =?utf-8?B?OGo1cjJiSmJ2ZmRFNXpiSCtYZFVrYzdFb2xjVWM4Q3MyU094bUtDc2I1ck0x?=
 =?utf-8?B?QmdqYlB4Q280MXVYVTFySXBsWXhMa1VzaXF2WE4zWVFPUmFwcGJVL24wWS9Z?=
 =?utf-8?B?NVJKTnF6bUFZc0NETEordDJjTWRJenR1SWVOYUlHUnNUN3pENDg4OEw2UUhy?=
 =?utf-8?B?ajdBcTJkNU9pMkJCb0o1anJqZmNjNmgxanJZUWNpMTFURjJPcXdCdXJLcnMz?=
 =?utf-8?B?NFZhakFvaVZidU44TjlUaG9ReHhHdnkzdEY3TWFrQ1QvMEQ1THliRFJsY1J1?=
 =?utf-8?B?NzA2NUV2Z0pwVEdVbTMyNHAzdVBjeWV4SzRRemlncDV1OFpiaCtzUHNCZGlh?=
 =?utf-8?B?OVVSUzRaYjBkNVdwdUlLaXpDY0lzemYvczJ2UndIRUpaQ0FFc1hzSjdHQTA0?=
 =?utf-8?B?d2U4Y3E3VzdUTVdnQnl6RUMwVThjVFhycDQ3YlY2Tm9UTlBuMlNhZnMwWDdD?=
 =?utf-8?B?Yks3TW9tRCs0eHVzUDlhNWF4Q0ZjSWlrWHhodWVEbGtIZGl1RnlYd1QwZlVl?=
 =?utf-8?B?dUljY2JFRVlGT0VXUEdhaHNBTWJVbVNyYXVqamYrazFHZkR2T2g1ZXpINEtX?=
 =?utf-8?B?aXEzVTBDcjRmbHdqcThWRW5sdWtjS0FWaCtkdE44YWEzV2NidGI3MEE2djht?=
 =?utf-8?B?cDdMU3g5Y2dMb1NCc1B6SElMaFRCVzFFdy9VZ0tFU2ptK3l5MThwUVBZNnpE?=
 =?utf-8?B?ZXY3Z29FRkxrTGNLNVFoVDZxaTZnRVBTME9seUJ3dENhSWpUSmxNWUpnRGE3?=
 =?utf-8?B?U3VqaHlaSHE0VFprZGx6L0xhc2RZNlYvK0k3OXp0cXowbkdTOThCek5zeHhy?=
 =?utf-8?B?YnJVREhVeHg1ZXpKMmFWOVdJeUU1M1BiNXpXOU5jYWJmRzVnTkJpL0NZNlZR?=
 =?utf-8?B?Ky92MmRvMFdmamFEMTdoUVRmckVibE5VdFVVaUIxVzY4OFhrYjN4Tys2b0hk?=
 =?utf-8?B?ZTVzOVFvU2NOSGpNb3h3VGtCZEk2eTlOek1BdWV0dFVIMHFYNlZZM0dNdGhJ?=
 =?utf-8?B?b05semViK0xyVVBmMDZIT2R3aG9BcnFmWm8rWE9jYktiNmhHOEV0RXBWTkZY?=
 =?utf-8?B?eGZFRDNFZXJFbm5TTnBuQ2ZVV2lpdEpyUmd2RDhYR3l6Rk1xb0VpQUhWTmFu?=
 =?utf-8?B?QWE5RDZQWUZGMGtZdXB6bTN2cTluT09sTjBkL0dwdXRkZVNvMkNBWlpDclFy?=
 =?utf-8?B?U0hDUnY0bmx6RHF3TXdoWjdlU01DL1N5a1BGVU1MbVBIcy9nR1QyNWRrVm5O?=
 =?utf-8?B?eS95SCtzcUs1MVFHUnpBdkxBbjBpVjZDamQvQnNJWHFLN21NZlRMSnNGOERE?=
 =?utf-8?B?YjFLWExqZTFCbk4zWnpvTHFnMU82eWozcERJbzRhbU9NbE5KU0t3L0d3Kytq?=
 =?utf-8?B?NkRMRndZM2dJeThIc1dLbVN5QlE4QkpDb2JyUG0rT0NBS3k4dy9keTRZWDNv?=
 =?utf-8?B?blBxVE1Bd2w5SGttdStQZE1PM1QvellVUWxCMm8yaFhQWEtsOFdsNjk5VG1Z?=
 =?utf-8?B?eXRDQ1ByOUV2cVpmYTZVUW5OMUpNTDNqbnpEZkl3cEEwSkxaWVNzZzVQWDBv?=
 =?utf-8?B?eldhb1Vhd0twM3Y3V21XTkxCbklCV2NhSW1XMnV5WlhTakt4MVhMK1F5dllI?=
 =?utf-8?B?ejdvdVJ4OTljZHZCRjVsWXZTcVlyR0oxOUhxZkEzc2NLRzZudE82MXZia21P?=
 =?utf-8?B?YmdTTS8vLy9UMHdmYjQ0OXprblV2K09MaUZDUzFoLzkySTJycEhUaEhMNEdY?=
 =?utf-8?B?cTY4Y1N3OTRCbzhpZStnM3M3WVVkREFnczlmZHpZM1hmNUdwcUNYL2h2SEN0?=
 =?utf-8?Q?kQ0qBCpJxfCmnh0xr660GVCzo?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2be1e7e-54f8-4723-3bf1-08dd777b1447
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 15:27:46.3379 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fFadfVzHRU1QsjlgmhsSsrRDRopfcDD1yRP8wotHVQ3x0l3xl4xlQeUn+85yRFDP+wOPzefocp+XWQrVZbnZTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8037
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



On 4/7/25 20:20, Wentao Liang wrote:
> The function fill_stream_properties_from_drm_display_mode() calls the
> function drm_hdmi_avi_infoframe_from_display_mode() and the
> function drm_hdmi_vendor_infoframe_from_display_mode(), but does
> not check its return value. Log the error messages to prevent silent
> failure if either function fails.
> 
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
> v2: Fix code diff error
> 
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 13 +++++++++++--
>   1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 5f216d626cbb..8fc6ba12c82d 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -6104,6 +6104,7 @@ static void fill_stream_properties_from_drm_display_mode(
>   	struct amdgpu_dm_connector *aconnector = NULL;
>   	struct hdmi_vendor_infoframe hv_frame;
>   	struct hdmi_avi_infoframe avi_frame;
> +	ssize_t err;
>   
>   	if (connector->connector_type != DRM_MODE_CONNECTOR_WRITEBACK)
>   		aconnector = to_amdgpu_dm_connector(connector);
> @@ -6150,9 +6151,17 @@ static void fill_stream_properties_from_drm_display_mode(
>   	}
>   
>   	if (stream->signal == SIGNAL_TYPE_HDMI_TYPE_A) {
> -		drm_hdmi_avi_infoframe_from_display_mode(&avi_frame, (struct drm_connector *)connector, mode_in);
> +		err = drm_hdmi_avi_infoframe_from_display_mode(&avi_frame,
> +							       (struct drm_connector *)connector,
> +							       mode_in);
> +		if (err < 0)
> +			dev_err(connector->dev, "Failed to setup avi infoframe: %zd\n", err);

Please use drm_err

>   		timing_out->vic = avi_frame.video_code;
> -		drm_hdmi_vendor_infoframe_from_display_mode(&hv_frame, (struct drm_connector *)connector, mode_in);
> +		err = drm_hdmi_vendor_infoframe_from_display_mode(&hv_frame,
> +								  (struct drm_connector *)connector,
> +								  mode_in);
> +		if (err < 0)
> +			dev_err(connector->dev, "Failed to setup vendor infoframe: %zd\n", err);
Please use drm_err

>   		timing_out->hdmi_vic = hv_frame.vic;
>   	}
>   


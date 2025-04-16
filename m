Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 645FCA90EA2
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 00:32:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F33510E9DA;
	Wed, 16 Apr 2025 22:32:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Sy2ywE//";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2085.outbound.protection.outlook.com [40.107.100.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FFB410E9D6;
 Wed, 16 Apr 2025 22:31:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wdjLa+x5n/vlLa8/Vcpul2ul7ffrzQBl90mJmJwUX6x81ijnfY6XpDyXmkF8lnFwQtaIs57EPdeC/2xpSouRQ+zqo9G97bYYA5OmBOEVxBLFuSFqcLQkbZAMP23cpvEYCjkxnfQnUcxHUakMmWUaa9FNSCAxvNF/Wwt8SrhP9ITlZRfNRRPtThiaPtqvBDbFBS7xF8lwBsCRfh5vSodyU7bfuc5Zdv70CQ1EtSKHvPD9HApUHQAMPN0DD4EogwIzAPrE+a/Y2Q6vZob0vE1F16m1t3lPEsJi2Vtw88wKx8icyc9iVcNAF/svW0YbXrlzSLgPfWEaBOxe69WzrWORBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=90uIpUm9QxHF/8zcaJNx3U0fp9qWpaBX9GKE+N+89bE=;
 b=l/lAJiE4wuAJb7v8u4VlFg31R/N3NXNE8R+a5ESWpQC6m18G0RL5N+VdgZk7YW7xN+sTjxjZgg/ovp+By6FtxSMiJmFSyytYIdBqbOqL1rAYUwxnpOmXiTcL4KfRVfBSza18ZLT1y1tzrWNwlfYlx/JzFT8RUiGY7+slIuzXQRI4lcczYhCqSF0B9NIpmfYiLIpSAw9mmy7HIrBi9BqtTHgO5CFW/xq7O0Nd5pm4tsNDQRJh6xUyA+kKJPWJ06if5tX+HZtrDZhuD9UTQ1E+xu+D74gt5rxSb84mQve/DA7dO0D0jZpTDvAluSbamZULy5prDb3SR7Wy83xQoqE7Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=90uIpUm9QxHF/8zcaJNx3U0fp9qWpaBX9GKE+N+89bE=;
 b=Sy2ywE//yZGuX8p+rlpcFiyw90UUdci62oYc1m6boPowFp/oeuD+6X6QVoIG/cTOz8WVUlm7/+CKuAUGJjctbmZqWerBdUh+VkHvXGq1eBy4qNJ6AJm5T3+jRIsyEFCVS/ZG0y5jBrCF+u4jTcddND8D3UW44TgLMRanlIKkeEc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by CY5PR12MB6034.namprd12.prod.outlook.com (2603:10b6:930:2e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Wed, 16 Apr
 2025 22:31:56 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%4]) with mapi id 15.20.8632.030; Wed, 16 Apr 2025
 22:31:55 +0000
Message-ID: <6809f10c-010d-4953-8133-a0293a317b5c@amd.com>
Date: Wed, 16 Apr 2025 16:31:53 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/amd/display: Add error check for avi and vendor
 infoframe setup function
To: Wentao Liang <vulab@iscas.ac.cn>, harry.wentland@amd.com,
 sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 simona@ffwll.ch
Cc: chiahsuan.chung@amd.com, hamza.mahfooz@amd.com, sunil.khatri@amd.com,
 aurabindo.pillai@amd.com, hersenxs.wu@amd.com, mario.limonciello@amd.com,
 mwen@igalia.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250414031439.1895-1-vulab@iscas.ac.cn>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20250414031439.1895-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0111.namprd03.prod.outlook.com
 (2603:10b6:303:b7::26) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|CY5PR12MB6034:EE_
X-MS-Office365-Filtering-Correlation-Id: 11cbd63b-3597-4aeb-add8-08dd7d367e3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dmNwa3NjaGhnMThVUmcrdldKaWxQWVVFU29XNFhxMXo1alJEblQ5dXpLNytO?=
 =?utf-8?B?QUExZ1A2S28ycytVWU1YSUp3b1NIbkxsVGFTVFU4VnN1cXhyZzRYZXVySmNK?=
 =?utf-8?B?RHlmVloycE1nbjBUUzVEVVViMk5ibXdWc0gzQ1ltalF1R3lzN2VMR29aYklU?=
 =?utf-8?B?WFJVSkJQTFpBZWlhM1dBQmk2T1k3bnc2OVRON3ZyeUM2SmVpNUJJYnBpblFJ?=
 =?utf-8?B?cCtocmFQMUVjZGFkcFB6dWN2KzZaWE5SVFFPcEdrUWcxemRXNWpKa3laS0hh?=
 =?utf-8?B?N3p3RUxBTGVPOTloQXQ4MUZkYTlmc2trMUY3RmhLdjlGQUZPZSs4KzhTNFFx?=
 =?utf-8?B?aGtvTURVRnU2TlN0d3krTG1DTXN6clNXblkwYUh0WmNnN0lQYTFYdUlvK0pi?=
 =?utf-8?B?ZzUvTkwvb1JEeWR6TTlGZEFrN20vejFnbnU3cUh0dlRJczdpSTlXSTllalZh?=
 =?utf-8?B?U0dPQVduQkw2N3FwN0Z1c2VpTkdHU1dWeC85R2VYajNXUDk0OUp0NnpRWGpE?=
 =?utf-8?B?WjcrU1hkNzZXNUtGd2R2OEswUEJXSG5ja0U0bVdhTWRoN1ZDNmpkb2xuZnpI?=
 =?utf-8?B?cWpQN0pBRE5zaFVXZEd6Sjc4aDdCaU9sODcxWmlTaENBNmlpbWVENWY2VnA4?=
 =?utf-8?B?L1NpRGMvcGoraGlHL2htd1NwbzVZbzJaejZNN2J2aFNIZ3NnS1YySStiSVdV?=
 =?utf-8?B?cGFFaE93SEg5ZlkxNmc0ZGFrM2lrNW50WW04bW5GaTNvdmRNVWVORllvMU44?=
 =?utf-8?B?RWNVblZ3THk5eTdsNUV5OXU2TUFNQk1Zd3FIM2ZQMlVweVZiRnFHdFc2S0o2?=
 =?utf-8?B?M3dyYXZJMFNQZUhsNCtHWlZQNU8rSE9JNGRiWU9VNWloelVHL3AxdlpnQjdN?=
 =?utf-8?B?RUVVV2hKRDlyR0VsaDkyU1lockdmdGFCdkNaMUI4U2hic1lrY2RHMDc2cVlB?=
 =?utf-8?B?YTQ1cHdkOHVaWFpLWjdES2pWSExyanV4Um5rT216VHhJMkc1aUR1SXNjZFl6?=
 =?utf-8?B?SXlBWE41VUZLOUl5MmxvUmlrRlo1ZDJocVlvWWQzeFdMNkZ6eXArNGZOS0xr?=
 =?utf-8?B?Tk9wOXZwTEk5NEEvS1F3MmFTUFdyTTBwS010dDNBVVUzNnQyczVhZTdBdndh?=
 =?utf-8?B?d09HODIwNnhzbzFlOTNZZm5UY01EUTh4QWRxemVzeGhuaDVSbVZ4NG9SNW9U?=
 =?utf-8?B?R1FCUm8xN1BlOXZGTkRCb0grb2w3Wnh1azhLSGpYdGRFcGZQbUliVUs0YzFR?=
 =?utf-8?B?UWN4TW5WVzJwejVYWm5PZ2tVK1pOd0xTVTlGNld4SlFSb2drUm9XUzhVdkds?=
 =?utf-8?B?WWJWZXZENUpRYk9rdzBzOWhxNWhFQllNUlRETUpCQkJXT1Y1TzkxenFwS3NM?=
 =?utf-8?B?QkU3WTFEWWRGRE5jRGx0Tml4Q1Y4dDRzaFJJVmNPQ3VRNVQxS3l0bGNvdnBD?=
 =?utf-8?B?anFhMU9leVBmSGE1enpjR3lLQVBHUTllM2JGOGRiVERjK3dzd3lqbXM4bXBy?=
 =?utf-8?B?bmJRZCtKUkM2elM0OUkvQ1I2ZlVXd2t5U0tJT3NMaFlqb3MyV1pOcVV3OXg0?=
 =?utf-8?B?WGlCZFBIUElsUDhIUjlOU2NQNXFLclh0SStrTWFuU2Y1L0phbXNoSG9xZmlW?=
 =?utf-8?B?MzlTNjR6M281ZTlJQjlWb0FXMW05ckhoaDgwMVpTcVVmVTgyNHJCUHBaNHhC?=
 =?utf-8?B?NkZMbGo5SGREb0RnbDVkMHQ1Nk5ENjc5Wk1Cai9JYjBsbUlmTVc4NDl3eTZR?=
 =?utf-8?B?M3l4Q2gwbkFjN2ZVMHIxanZralQxZStlaThPS0U4ZDcxaVYvLysyd3NueGlU?=
 =?utf-8?B?MXIzRVJUbDNQcm90djRqQ0dibUo2SjRTRGZvT2srODExZitFUlZWVHc0ZXdY?=
 =?utf-8?B?NHBIQTM1T3BGU2hlZXFrN0paNVNZQ2tkYktHTFJPWWp2MmY3SmtXMXlJT1Fo?=
 =?utf-8?Q?OtjegvR3FtE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VFowQ2w1WWg1Y2h6bGdZU0EyMUN6b1NtUFN2R0xnQ3ZnZ1BBekE1QytwaXVO?=
 =?utf-8?B?ZEtCNllYcFJielRlUWoyLy9OUzY5N09BdnhOZEVVV1o4UlAvRmUwaWVaRWNW?=
 =?utf-8?B?cWNPRWI3cXVtTmVYNGJScTdmMDJGeTdTOFYxSXR4K0p5bzJRcHRUM3JCMDF0?=
 =?utf-8?B?b0ZGOUNTTzdud0hrb2NuTVYwSGtBL2JSSyt0a1FTWkZ2aWpXdU1kQzlva3Rz?=
 =?utf-8?B?djZZVm9rZmhBa1BwR0pHQkJTZDhxSlRIOWpSZFhwak8wUnE5YjFQcWp5QzNn?=
 =?utf-8?B?WWREamVyc1dRV2dRWXIzVXVqR1R4NXFSRVYzcmt5RjBDNGxBUG9XaXJjbHdF?=
 =?utf-8?B?cmZoK0Q3SC9WQTJld2ptWkxNTHc5QmlrdHRhL3FRM1p0THl4clhqSlh6MWVm?=
 =?utf-8?B?dzNBM3lHS1VsRlYyU211OEttSW9BU1RXVUkwZFNDcnB2cGpVZU9hNW8zN005?=
 =?utf-8?B?Z0ovU2tXRG1WYnQ5NmtvWjMzTWJ3VVVlMTJZVGFWd0FGRmE2VEcyRmdNZElu?=
 =?utf-8?B?bmhzR2xqK0dqQ1E1SnJpYWxjemVqYUlIdTlTeitjQm9xWHB3Mm9ab2ttckg4?=
 =?utf-8?B?bURWNzZYdW05dENuT3dKbVRoVGFNMVhBSnU2RURodFFQcC8wclNlNGlWNzNs?=
 =?utf-8?B?VmhUak9tTWNVdXdjd280UHRCeSsrUlg2ekR1Rit5SlpMTmN1bEY0Ym9IcHBB?=
 =?utf-8?B?V2E3NE5pZkEvenJWZ1E4cXRIdktiNHg0eDRxUEdXWGFGcHZmSjFSSFVDdlNV?=
 =?utf-8?B?MHR4bTBjUWYybTNtUm9POVppMTBiNCtRZXFpbTJzZ1VUNG4yeWliWkxEV2xK?=
 =?utf-8?B?c1NEUllUZ0V3bGZ4aGJlUDlFclFtSnBmYSt5eVRiampOVzRIZXdwSUV2SGVo?=
 =?utf-8?B?N2hndDRYNU9SR2tEdi9XaHY5dlN4YnpYQkxlVWxjQm5QcGQ4SWNKYUdIWmFK?=
 =?utf-8?B?KzIrWWxrY2JVYkRiSnY2MVRsVzdFWlgvVFlvSjdNaHRuNUJsZUllVHh4WjhF?=
 =?utf-8?B?NHpVNmNmMVM4cVF1Ti9HekRZemxZSkhUMDFvWmF5bTk3L3RRUFZHQ0RGbHZ6?=
 =?utf-8?B?d0d4ZHkveHV5VUtqT0hLWG9sSkFlR0RSM3dpRzUvU1ZnRjJGcnZJRHhicENj?=
 =?utf-8?B?UkJhbnZKV0JGUzJLQkpYNHFwZ1NRbUpzQm45SVdJR0MzUWNrRWpPZys3ODh1?=
 =?utf-8?B?YUZISmFya3ZLZ0lNVmhUNmNha0pQMVlPOVgwWmtzQTROelJzSFZlYmdRWEFF?=
 =?utf-8?B?Nk1LZVFsTXRxT0hjN3JWNkVEZzlFME5Ma21iNXFkdEJZVjAvT3grZ1hRZm84?=
 =?utf-8?B?bUdtcVZoK2w0dEQ0RXQ0L3cyemRKckt0V3NXZWVYbzR1VkdIMUczWkZPZ01l?=
 =?utf-8?B?b0ZDMVlYVU9kazQwMms2SXZEU1NxQlBKcGxSTy94aFh2eWt5Um0zRmM4dndU?=
 =?utf-8?B?d09GblBJeU0vbGFzR1V6Nlh4TUE4eVpnQzVuYkpYcUV6L3FqalUyaXVCK3ds?=
 =?utf-8?B?MCtYTXVPMDl6Y1ZuSFVTSHFZYWl1OEE5MlB5cnF3Ky9FQm4vS3E2YlZuMDg3?=
 =?utf-8?B?WklScGplMTdpQ0kzVzJKTDRXWXU2T0RUNFFvZHYxMXl5WVFINzQ0Nkc4bTZZ?=
 =?utf-8?B?SXAwSXQyaFpwZGJyODJoSU9hdldUWFl3VitoZE9XUTRDOUNzUms5QVdVSzRx?=
 =?utf-8?B?bFEvVXVMbURHRlVwLzN2ZDg2R1NKaktLV1A2OXBRRHNNOVkvUUxONXVKcjlV?=
 =?utf-8?B?Q2FRVjBoYU5GeTB1VERuWUp2NmRkdFpjQ3BQZGQyNm9YODduQWMzYiszeFE2?=
 =?utf-8?B?azFRdUJyYnBaTnFORUs4b2tzQmM1YVUxcGk4R0pmejNaMTAzUDlrY2VneFVY?=
 =?utf-8?B?QnRSK0FkY0wwcEEydWE0NklTYldxZXFKZEU1djB3QU1abFZsNXBtNFpxbUJR?=
 =?utf-8?B?Rkl5Mm1UcS9IcVk3U0xJVEY4aGNDMWw5TEZadW9IOVZtYXdRNkVuTlhNb1N6?=
 =?utf-8?B?b0Y2NFJ2RjdFK2ZVM3RiTmpjMGFpOWZtRHprN3BXUFBYcWk5bER4RlcvMy9R?=
 =?utf-8?B?dzh6OCtldlI5TW5CTW1SYlF1eUNmemtGV3hsbDFVckRvejRlSVZnZWpBNGNI?=
 =?utf-8?Q?N8rX3xMVra0AqYTljGqbN5Tdj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11cbd63b-3597-4aeb-add8-08dd7d367e3c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 22:31:55.7980 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6O22M3M5uS7FTXuc1+wqiTbdypeeZ0orRDnsgaEabC2gDHZ2Ej7n5VbwrbO1hy4TiIOhsK9Yqs1qRnF+OWlUyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6034
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

Reviewed-by: Alex Hung <alex.hung@amd.com>

On 4/13/25 21:14, Wentao Liang wrote:
> The function fill_stream_properties_from_drm_display_mode() calls the
> function drm_hdmi_avi_infoframe_from_display_mode() and the
> function drm_hdmi_vendor_infoframe_from_display_mode(), but does
> not check its return value. Log the error messages to prevent silent
> failure if either function fails.
> 
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
> v3: Fix error-logging function error
> v2: Fix code diff error
> 
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 13 +++++++++++--
>   1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 5f216d626cbb..cdf1a07aa8af 100644
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
> +			drm_err(connector->dev, "Failed to setup avi infoframe: %zd\n", err);
>   		timing_out->vic = avi_frame.video_code;
> -		drm_hdmi_vendor_infoframe_from_display_mode(&hv_frame, (struct drm_connector *)connector, mode_in);
> +		err = drm_hdmi_vendor_infoframe_from_display_mode(&hv_frame,
> +								  (struct drm_connector *)connector,
> +								  mode_in);
> +		if (err < 0)
> +			drm_err(connector->dev, "Failed to setup vendor infoframe: %zd\n", err);
>   		timing_out->hdmi_vic = hv_frame.vic;
>   	}
>   


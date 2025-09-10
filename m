Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA71B52174
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 21:52:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD3B310E9C6;
	Wed, 10 Sep 2025 19:52:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="C2Hck5aW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2081.outbound.protection.outlook.com [40.107.102.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AD1A10E049;
 Wed, 10 Sep 2025 19:52:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uHFDY25tj0FSgBKgEPb09+hoMg7mBJItmhsGyxCrzTPYFOZwbpNaW1Dc9nE9JRZzaobo2cGDf3MraJlzAtVQY43n84dCud2GkjcQwEcmJsH7JILvovblzqtJgY10iO4JynHl97ZiNciUag6z8XKZ1eK8gc4ECBVwGHXtA/gTiJ72rjlN3Wje+ijb+Uh1OyXII3S6X7+SlGBp3AcGpRox8btrmj2C2isIQXN/Dg5YLCbpPzJDlYu7ZD/YKmd9jyPfarwBc7jxDzb4lDsoIjzEOvFMW23UqxZ/7u4h9tKvQCFN5h0lX9XzJa/Zzq/iw+uiSa+jD2TgfiM0LMUp+HFQjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8rE+FJpP3aY/AGXJQDjp2L212AeFR9Y1QvLj8pTCOoA=;
 b=eD3pccewhmk+GmC2WdHREn/42G5X6ueDTqRrNc+L2chKeLGmK3t2emg8W5qZgiPXxHuiJSHpd8HXX2uGRi/4MQYl/ibCwQAvCBDQb+xlSIEeD7Cx4IcqNmh0lhj478r1Q8ZQ/tNZsMpHMIa1CryTbHOC95sQs92JzXw3bx6kS27tqqgFmmckATkYJHemHLQ2X+pTRUISyzF5BqMTjO6ibhaEJo+Ligk+vL9uOmPg1+9zSP+iK6kGkSLkyXrSm+YcN/fvrzhtV/Tm2AP2b5pyTtL7Tn5sWVwJ7xIj6Ft5r3ppccaXwAx8/MTQDgkZGLjYXTWK3Y5KTiCTsY3CKz+tbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8rE+FJpP3aY/AGXJQDjp2L212AeFR9Y1QvLj8pTCOoA=;
 b=C2Hck5aWhq3bFqX8pbRrpF2UKVKxay9dhquQXiDfQ8mIDAwC3kHEhbPVr/zLG4tGWfn10qiYNsUBOpaf2O4Gp2uzfMhAFF8BSQIU9h4h+Ahcq5sHL7XKiPUyy2ZXXtx9QyfF6VqNIwjzPZxhRFisFYW7fsYOkaiLvvBflpO705k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by DS7PR12MB6312.namprd12.prod.outlook.com (2603:10b6:8:93::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.22; Wed, 10 Sep 2025 19:52:32 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062%4]) with mapi id 15.20.9073.026; Wed, 10 Sep 2025
 19:52:32 +0000
Message-ID: <8b589737-6db5-4ca6-a54c-e3e88442b01d@amd.com>
Date: Wed, 10 Sep 2025 15:52:29 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/14] drm/amd/display: add a mid-layer file to handle
 EDID in DC
To: Melissa Wen <mwen@igalia.com>, Alex Hung <alex.hung@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, sunpeng.li@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Michel Daenzer <michel.daenzer@mailbox.org>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20250618152216.948406-1-mwen@igalia.com>
 <20250618152216.948406-11-mwen@igalia.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20250618152216.948406-11-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0309.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10e::27) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|DS7PR12MB6312:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a41d0c2-4aa0-426f-c54a-08ddf0a394b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WUNHY3ZNdWQrMFlaT1ZTUk1vanhYOTBGMVcrVnp2UFduSEUxSVhWWXU1dGlP?=
 =?utf-8?B?NEtmblIxcitxd21aVWY2ZGpYUFBoRUE4SnNTVUhINnkwOEdqekR2dGFUYXpu?=
 =?utf-8?B?a3lhZktmckdxY2h6eXNqNldxNk9lNVU4eDZMazVrdVo1RlBpWmMyNDlnb2x2?=
 =?utf-8?B?SmVodUNDV21MYnVRMUlHaWhrOHJYcVIxMkRkM2trSmZBUnB2WE5WODB0NTlE?=
 =?utf-8?B?ak4rUklvNS9mSmtSNmEyMlNLZU9jK3dScHRDZDFuMU9LT0d5V3cvbUkvK3Vu?=
 =?utf-8?B?K0ZyY2pjcFVsQmUyNTdoQVJvUFJFb0YvdHdvZ2J3S2FYWm5ucFZpTiszd2Nh?=
 =?utf-8?B?YUR6bGNVS2sxVXRYeDU4QStIdWNkNHFidmM1TTNUTjAzNHFReGc4bnFFcndO?=
 =?utf-8?B?dEFHaWZDSEdJSzB2cDNKc0VHMlR0YmF6V09DZDB0M3J3NDlkdkNMVnRNczZz?=
 =?utf-8?B?bXlydDBYKzR3bHFWRDZFSnBpN1Y4QTgxZ3huQWJlWkJ3NHBGaFlSbExNZk1W?=
 =?utf-8?B?R0c1b01sQXZhUnlEYWQxUmR5emduRkZOS1M4bEF6djFPVzBCalBnenNuMEtH?=
 =?utf-8?B?RUg1eFpicHVXdjVRQXVTWWs1UVowajJaME52bjlYVHhHZnlOdXllNXVFZXNY?=
 =?utf-8?B?QmwxRU9JZTdGZW5FamdzMXVXamFDWld5V1g3Qm1pNldHVUFSYzVxeDVSYkhS?=
 =?utf-8?B?TUdlSmJ5dUZ0SXBMU1YxN1I4S0EvZ3NMbHVEQlZnMGUyVzBKNXh5cnFid3Vs?=
 =?utf-8?B?L0Z3REtEL3dHZHVzUDNaNC9PYjEvalBTZXFFQWs3UjlvSlBrb3ZMZ0JSSjJ3?=
 =?utf-8?B?dGJDeno1UkI3QVBOaEE0bmwwWTdjdlhxRjAyMzRHNkhSajZuU0JoYzBUQjdC?=
 =?utf-8?B?VmF0MVBNbVhwdlRwVjN1aDl6Z2Z2TWh4NTE3elhsTnJSOFJMQ09IcXNXTGFY?=
 =?utf-8?B?d1plMmwzTkFKTEUrWUxPUGc2SHVyZy9HNkZvTDJjRVNXL0tXMStWcFhGQXhP?=
 =?utf-8?B?cU53aTRPdnlCTXh1S2k2NmQrN3BPL2VPNHZCdkZraEpMb3F5TjJib0VjWEx3?=
 =?utf-8?B?ZU9rZk1tTUI2SVZWZjVYL0VWRjBndGpmR0kwNHk3YStTM2wrcHBYM3ZtdUJX?=
 =?utf-8?B?SStrSnh6QUIxQzJYVVR6V0VOTVRCcU0xYmdLQWkvSlNFQ01FRUxML1llaHdl?=
 =?utf-8?B?VURURGFPZXdJc0JHSk16VWpraWFDaGtTSENzSzRwQWhvakJ4dm1FMzhxWjQ4?=
 =?utf-8?B?eWZKczRGMURZT09mTC80dFkxTC9qcUdocU1VZ0dmTS9FVjFLWXdkdTlxU2xx?=
 =?utf-8?B?UytDMVB3NjdpbWowdjMweVl0SklLK1JEVDVwN2t6NnRGZ0JGc1FMRXhsOXlU?=
 =?utf-8?B?WTEweHVrZmlKZ3FVbXF6MWpnakZrbU9FYkc5QjMzSzArRnYrNUxaLzV4cnRB?=
 =?utf-8?B?RnIybWlTY25JVjZOVFNtR3ByN2RVQ3p3TjdhVlhuNStwRGRsR25wdG5kcith?=
 =?utf-8?B?cGJwVnJiTlhDR0hqSzFKUmQxU3YwN0ptUG9IWEZsMXVwRkRmbWt0aUVXYXQ1?=
 =?utf-8?B?OEdBSThUSy9NUTVHdmpSUm9uRCtGWWx0ODcxMGZaaHZuU2J3NE9iZFoxaDN1?=
 =?utf-8?B?ak04ak5ndXVQUDBtbnIvMC9rYXNIL1hFTHNNdW41aTZ0cis5eGFtUnBIazFu?=
 =?utf-8?B?T0hXeS9YNWE4ZjJRK2JqbERmVkwwN1VJWFFrMFNubko0ZENlSDM1Z2I1VkJ3?=
 =?utf-8?B?U2FpWmV2UUpuMjlDODRWYWcrWDFmTWdVVFcrOXVBOWtqdmVtV0VhdUZxOGNw?=
 =?utf-8?B?cjl1UlVzYW5xcktxSW16WjZVejZJVnF1dVNIaWlBZnlHUkVKS0I0OWdPeTVn?=
 =?utf-8?B?K2xTcC9DaHNlUGdlWTBsZ29tTUtwcFNOOC9sQUZrZWhENFBiSmNCcmJsVmVQ?=
 =?utf-8?Q?VTh0vq1olTs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?anhNMTFxUjlIN0NHM0ljN2VaOWdqWHg0K05VRWlPSTl6dHVZTkk2cnoyUzY5?=
 =?utf-8?B?dTg2a3BnVzJMSkpFUHhTM3dMN055R2JXZ0Y1UlFQRFUvWC9BZzBLc0pOVy84?=
 =?utf-8?B?TVdZZ2pJaGdTMmJiaTVFa3RsSE50bm1vWUI2T0RNbEMrRS8yVTNRUVZFY1I4?=
 =?utf-8?B?OFpDbkh3NTlXTXduejQwcWlTSkRWSWowSk9Ec09lbHhBZmt2alRCcGh2ejc2?=
 =?utf-8?B?SnBCVk9kL2Urb2IvNXRDVW5WTkQ1aGFRekdyNUY2bytDelpVRUk5a3VzbWlL?=
 =?utf-8?B?V1lBMXpLYVR6bkd2MWxlWmFDanp1alNmN2EvSVBBK2hQWDBlK0M2RHJBR0xH?=
 =?utf-8?B?UU94VnRsZE54MmVpbXNxWWE0NS9nMlRneTRBTlFseDJNazEweWV3ZXZvWjho?=
 =?utf-8?B?MktFaGNORkdVZHl4YXZGR1FaQVJXVW1ncEN2RHNkb21DMDc0c3BiWmVLamd4?=
 =?utf-8?B?a2ltRm1jV09DWjBuTE1rMndBU3FTTWFnTnNUZTRwYytGOGRYQTBpN25iamd3?=
 =?utf-8?B?NEU1TzRyUmgxTlJJSjJ2L21LQy81alAzaDMyOU1pUmdNSVBYVW9qa2hNcERn?=
 =?utf-8?B?OFAydWMvOTA5eVJkdDNkeFJtOWVpNFNId0M3dnQxK3d6MWlWMTNjd2hVRlNt?=
 =?utf-8?B?NDZUYXB2M0hwSE9EQWRVVVFjUlZ5ZXpLOEhYaitaR2NaN3BzSTNwUHJQYmhl?=
 =?utf-8?B?TmdxVE5JUHl6cSt4N2tCRGRzaXR2aS9lWDNraUhyR2dwTVNtdHV3MXI0dFVh?=
 =?utf-8?B?cHJnajRlazBWN0k2ajFacm5ZTWRwNDlFTCszZ2JKaVFFZkJUZjJzbXAvdTBR?=
 =?utf-8?B?WXNPT042Y3lBZmRNaDk4T1c1NnNlYkhVcXB4aUs0Tm9qd1BlTlh5c2lVbitw?=
 =?utf-8?B?U01xMDRndEtJRXpJQjJQamRUc3BWdWdmcGg0aEVNVkJ6enJHYUc1b0ZZaS9O?=
 =?utf-8?B?TEFnSXRkOUtVSDJRc3V4TitxcFBkR3pVNFVMVGdTTTJMeDdrbkZxQjRqdW92?=
 =?utf-8?B?MUcwNzA4QjRMNG9kc1ptUWVGLzVkOEpBOVFTeExnazRwaTViZGtEWkpKaXZB?=
 =?utf-8?B?VWo2VFZjSnRyTWVucFVmRDdSYjl3bnNXZXVoWTR3TkE4TkFibzB4MitKQzI0?=
 =?utf-8?B?NGFYUXRsU3NyUkJZbFdicjlEaVNFSHdnMGVBQUNyQ3Uxam5nWGtudlhWUjR5?=
 =?utf-8?B?QnRaRUVhck9tekFsODB4QzYvZTVwUTVBbWhSamFoNDdMVDFqUDlKdVRaVHo1?=
 =?utf-8?B?eFNmRWd4NmhKcy9yZFozWGhsK3RKRlA5WjNrWGlFaVFCUSt2bTFjYlZPKzdk?=
 =?utf-8?B?aWlKUzVIRTNlMVdSaVJaMFgyWmdJYUJQbHY5SEtnOHBmUzhIbmRpYlJvUjBD?=
 =?utf-8?B?SjJqdCtXZ1pDYXVNeHJFUmlJYWdicVBYYkM2TEtUZEhuZmE2WjVMWExjelU5?=
 =?utf-8?B?eXU1T1d3TGlLVHBoSWxuMnhmOFdWcW9VM0FuT0FKZVUwVjBCVzMzLzh0YTFp?=
 =?utf-8?B?L2g1dXAxdFYrd2gzR1RYdVYvdFpHYUE5T2sxZlhOdWhRTDdzekJ0ZUVRSEZk?=
 =?utf-8?B?WjhxQVFFbytmZUdTWklKdGFCdGRsMHVLSkNMV1pSVFFnTGhMVHh2NFNSSnFp?=
 =?utf-8?B?L2xmMlZRVUhZSExyalVqaTI0UDhrOTJqU1NLY1E2anZqOFp4RGRnempsSU96?=
 =?utf-8?B?K1plZUVNYW9TdTE5M1ppaGRPemtNRlJHbzRiODZzMEFzU1ltcVBXVUNLS0Mx?=
 =?utf-8?B?VkwxSlpRMEFzUHRtdFQ2TS85MnlBeDVNcHE4MnNlWW4ydmo4cmkxbFFrcEZG?=
 =?utf-8?B?RVpGSTFVRFd1Y0ZMZm4reDM1cE5oYWlKZ3NOKzhyK3hteHhSbFJ4Y1FrS2lB?=
 =?utf-8?B?L1ppd0hFSG1BQ0RqWHNIWG1tSXBZaDFlSG5CS3gwNHFieHpTWGZucHYzWldy?=
 =?utf-8?B?R28vRmY3c2U1TUh6RUptTFVzU25sZ2ZGTkxnRHlyWk1VWmRKRENId3NkMDc0?=
 =?utf-8?B?bTV4Rzh5VGVkK0RwY3RhdDl1VlZZY2NYWmNxYmtSdHFCVmFWVk9RZHJqbER4?=
 =?utf-8?B?ajVhU1dwaXAwMEc0eVZJMGtULzhMTDlGY3NyWjlYd1BpeTV4b2djWXdZbmlB?=
 =?utf-8?Q?Y/9UUkxVGymSwOSMLCjagrGSV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a41d0c2-4aa0-426f-c54a-08ddf0a394b6
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 19:52:32.4824 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2WaMaNVrXbWu+LXH8af/2mcjawvO/0+Ea7YsdcN6LG68d4eqkfgVc6zF0RzR1B3aXYL/phOiSWjIRw4Tm14L9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6312
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



On 2025-06-18 11:19, Melissa Wen wrote:
> From: Rodrigo Siqueira <siqueira@igalia.com>
> 
> Since DC is a shared code, this commit introduces a new file to work as
> a mid-layer in DC for the edid manipulation.
> 
> Signed-off-by: Rodrigo Siqueira <siqueira@igalia.com>
> Co-developed-by: Melissa Wen <mwen@igalia.com>
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> 
> ---
> 
> v3:
> - rebase on top of asdn
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/Makefile    |  1 +
>  .../gpu/drm/amd/display/amdgpu_dm/dc_edid.c   | 19 +++++++++++++++++++
>  .../gpu/drm/amd/display/amdgpu_dm/dc_edid.h   | 11 +++++++++++
>  .../drm/amd/display/dc/link/link_detection.c  | 17 +++--------------
>  4 files changed, 34 insertions(+), 14 deletions(-)
>  create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c
>  create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h

It'd be better to name this amdgpu_dm_edid.h/c. Otherwise reviewers
like me will think we're looking at DC code.

It looks like dc_fpu.h/c set a precedent. Maybe we should rename that
as well.

> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile b/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile
> index 7329b8cc2576..09cb94d8e0e4 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile
> @@ -39,6 +39,7 @@ AMDGPUDM = \
>  	amdgpu_dm_psr.o \
>  	amdgpu_dm_replay.o \
>  	amdgpu_dm_quirks.o \
> +	dc_edid.o \
>  	amdgpu_dm_wb.o
>  
>  ifdef CONFIG_DRM_AMD_DC_FP
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c
> new file mode 100644
> index 000000000000..3f8295a68a72
> --- /dev/null
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c
> @@ -0,0 +1,19 @@
> +// SPDX-License-Identifier: MIT
> +#include "dc.h"
> +#include "dc_edid.h"
> +
> +bool dc_edid_is_same_edid(struct dc_sink *prev_sink,
> +			  struct dc_sink *current_sink)

Please avoid dc_ prefix in amdgpu_dm. Use dm_ prefix instead,
or dm_helpers_.

Harry

> +{
> +	struct dc_edid *old_edid = &prev_sink->dc_edid;
> +	struct dc_edid *new_edid = &current_sink->dc_edid;
> +
> +       if (old_edid->length != new_edid->length)
> +               return false;
> +
> +       if (new_edid->length == 0)
> +               return false;
> +
> +       return (memcmp(old_edid->raw_edid,
> +                      new_edid->raw_edid, new_edid->length) == 0);
> +}
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h
> new file mode 100644
> index 000000000000..7e3b1177bc8a
> --- /dev/null
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h
> @@ -0,0 +1,11 @@
> +/* SPDX-License-Identifier: MIT */
> +
> +#ifndef __DC_EDID_H__
> +#define __DC_EDID_H__
> +
> +#include "dc.h"
> +
> +bool dc_edid_is_same_edid(struct dc_sink *prev_sink,
> +			  struct dc_sink *current_sink);
> +
> +#endif /* __DC_EDID_H__ */
> diff --git a/drivers/gpu/drm/amd/display/dc/link/link_detection.c b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
> index 863c24fe1117..957d74ff1294 100644
> --- a/drivers/gpu/drm/amd/display/dc/link/link_detection.c
> +++ b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
> @@ -48,6 +48,8 @@
>  #include "dm_helpers.h"
>  #include "clk_mgr.h"
>  
> +#include "amdgpu_dm/dc_edid.h"

DC should be stand-alone from amdgpu_dm. Please put the function
definition into dm_helpers.h. That way each OS can implement their
own version.

Harry

> +
>   // Offset DPCD 050Eh == 0x5A
>  #define MST_HUB_ID_0x5A  0x5A
>  
> @@ -617,18 +619,6 @@ static bool detect_dp(struct dc_link *link,
>  	return true;
>  }
>  
> -static bool is_same_edid(struct dc_edid *old_edid, struct dc_edid *new_edid)
> -{
> -	if (old_edid->length != new_edid->length)
> -		return false;
> -
> -	if (new_edid->length == 0)
> -		return false;
> -
> -	return (memcmp(old_edid->raw_edid,
> -		       new_edid->raw_edid, new_edid->length) == 0);
> -}
> -
>  static bool wait_for_entering_dp_alt_mode(struct dc_link *link)
>  {
>  
> @@ -1105,8 +1095,7 @@ static bool detect_link_and_local_sink(struct dc_link *link,
>  		// Check if edid is the same
>  		if ((prev_sink) &&
>  		    (edid_status == EDID_THE_SAME || edid_status == EDID_OK))
> -			same_edid = is_same_edid(&prev_sink->dc_edid,
> -						 &sink->dc_edid);
> +			same_edid = dc_edid_is_same_edid(prev_sink, sink);
>  
>  		if (sink->edid_caps.panel_patch.skip_scdc_overwrite)
>  			link->ctx->dc->debug.hdmi20_disable = true;


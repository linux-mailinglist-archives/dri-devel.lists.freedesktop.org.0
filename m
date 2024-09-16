Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6428597A7E3
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2024 21:43:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0B1110E3D2;
	Mon, 16 Sep 2024 19:43:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="UyoVTS2X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2067.outbound.protection.outlook.com [40.107.236.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1711010E3CE;
 Mon, 16 Sep 2024 19:43:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fejGTHb57uylAcRlldPYLnBcgpLyDcChdfgnDAWBsRiaqsgDhW7ZpcqmiEpp/6C/tNRIzzSYJXODXnWh87lO3kWykyquFCTj9dr09SpFF33nh6BadxGjCnZpdt1xKFycXAEV0lUPaIAy8/LQyJOFs79A9ALWzug92aAd9yHlDEtKUH7xI2POl0zLuPrq7BYd7moPdtYkE0WCbHGlLrBEEutm9CH+lxN0fmgiIguwwu3gEEGhm7KpEf5dxKO4Y+oql7Cn/59UG81NogMiQptx9lm5vcOyGK87N/Bej3hG0tZnZoQDVNuwlscMUm4ToFvazfNvWmJE/UlAqELiApSCdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rtw3U32u2DBwFpkULi3j1q13stFY0tFVYwgqB471veU=;
 b=ecnWKfcymHKSV8NpYIAXT9SltCpuEF2N5af0uX14g9oqOwFWuBpSNjTmNIqUy+gBmElK2I+icLQvYixeIv8ayDpcQiTCHcEiY3mAbZQ/vFAr09bS6SSIwmaL9AaK8JcVKfSr2npt5G4x+BRUJtyxBPPpRSNGG8wwmxU7iI7/ugM1vIBuSfUADoHa/MJIKgbf9BdEw71FEzFGfiPEtGyiuHIqbnKu/JODG/lR0HW8XN3L8MyVZMeQti2BR15hjAy59xtv4a3wTpN3C3qm91+06xZ16xEFF0lnmkaFsLaua36uaBceAJ2RDDolB+51+6Lb3Apq1Y7iI+MtNafD4Mql4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rtw3U32u2DBwFpkULi3j1q13stFY0tFVYwgqB471veU=;
 b=UyoVTS2XHKiCrAXDMRkoQjHAxt/a2WGBxhUWNim1GPdFw7Dqg8djpxQBc1r+1VjW5wZKDtrOiaxTVGATuBAcW2Nce+Y8ZVJij8e4vhx63FXzZrcyN4xuoERKpwstO8ANJRhljAawfvaEZ64MHbHbs+pQtCkhViH0hVGYxIzZtvM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by PH8PR12MB7349.namprd12.prod.outlook.com (2603:10b6:510:217::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.23; Mon, 16 Sep
 2024 19:43:41 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062%5]) with mapi id 15.20.7962.022; Mon, 16 Sep 2024
 19:43:41 +0000
Message-ID: <9dfc1548-7e11-44c3-ba7d-4e5ff7965a66@amd.com>
Date: Mon, 16 Sep 2024 15:43:35 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/4] drm/amd/display: Add support for minimum backlight
 quirk
To: Mario Limonciello <mario.limonciello@amd.com>, Leo Li <sunpeng.li@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Dustin Howett <dustin@howett.net>,
 linux-doc@vger.kernel.org, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?=
 <linux@weissschuh.net>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Matt Hartley <matt.hartley@gmail.com>, Kieran Levin <ktl@framework.net>,
 Hans de Goede <hdegoede@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Xinhui Pan <Xinhui.Pan@amd.com>,
 Jonathan Corbet <corbet@lwn.net>
References: <20240824-amdgpu-min-backlight-quirk-v6-0-1ed776a17fb3@weissschuh.net>
 <20240824-amdgpu-min-backlight-quirk-v6-2-1ed776a17fb3@weissschuh.net>
 <1396eead-b584-4b36-b9b2-18ef783cfdbf@amd.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <1396eead-b584-4b36-b9b2-18ef783cfdbf@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0119.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:5::22) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|PH8PR12MB7349:EE_
X-MS-Office365-Filtering-Correlation-Id: 129cb719-e9e9-4904-993a-08dcd687ddc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SWJTM2xGVXBZb0hKUjlWdUkxdnFCbjhva3VXeTgxT0VPLzhXVXVJUmpKYXRh?=
 =?utf-8?B?MnpuUy9ZSG5zUE5PeFBzQUx1cUt3eWJhNzlyRDd6dVJ5SjlzL1ZqaEFmZGMw?=
 =?utf-8?B?elpocWc2NHU5ZStBT3pNS0pWMnNYdzgyU3dXTkVFMFQyU2JDZ3ZOZzdoUlB0?=
 =?utf-8?B?MlNYdjNxME5UY2hwMVdjOHp4VGc2c3huTHNRMEZwRHV4MS9MVjJnY1JhMklB?=
 =?utf-8?B?eFpBdFJmT2RoVFVET3FUYXM5b3lRVjlZUmFWVUlFQlFrWGdZU0VCQ2M0dnBI?=
 =?utf-8?B?aDlIVnQ5SW9zTUM3V09jSHpSaVFkSDcwNDdCZ21HbjNqUjZTTFVwZTJHZU8v?=
 =?utf-8?B?MytnZ09BMDJweWhJQ2JBQzVXQk9EZ3V3NW82ajRmSTQ2cG1BZDZhZDJxSlpK?=
 =?utf-8?B?MS9LTk1DMDBoU2xJSGRVVFRKYkMxaTI0ZXpWdEpjWFRFS1Fhd3orbnZMOFJu?=
 =?utf-8?B?VzFwdGJhVTRycjlFQ0t2b1ZYR0FqQkZKNFRyaC9pN1BSVjI0cnV5YURqNVhC?=
 =?utf-8?B?YTlpcll0UllWVzRGZEtPMHQzclJIdHQ1MVlHQUZVZlNUWktvRENkQUpFTHdm?=
 =?utf-8?B?WE81UkNIOUgrNGR3QmdvMkRoQnhOSmVEa1pVZ0NEZ3JSYzhLcEVoZFo2Wk1V?=
 =?utf-8?B?QVBiN2grZzVJZEVYL1lILzYxeGdCOXgvVEtrSTdqc0VXNFJhNTBQQVMxMXhZ?=
 =?utf-8?B?UkdnQ2h5MU9JLzB4L1hoMnZUYm1lQk1tNk0vVG1lWEhoTG5DS2hhL0EvZzZt?=
 =?utf-8?B?QU9ab2VtalBHUlZ5bGRQc3hsbkJHd1FFUVpNYUF2VVNPUXUzcEZIbmQwMllh?=
 =?utf-8?B?UkZVT0RlRDJTcGxGNjNwcEltSXo4dlJlcm4yKzJHZkRWc3FiU0xuNjlTNGpS?=
 =?utf-8?B?ZGFHSlVQQmNRVTd1NDdLTmR2VkRwd2kwdGNDd0ZvN3huVWpEa0NHRVJhbEtP?=
 =?utf-8?B?Sm1TS2trdGNhd21UV1FFWTVZVUZyM0N4QVpIQjRSWkVyT3RaR2tRWWF3SHQ5?=
 =?utf-8?B?V1QybmFoZHdlRDhWc1VFTXlHNlFVVURmTHB2MS9Cb1dvenFNdFlLQ2xFQmoy?=
 =?utf-8?B?TU5QY3BIeEs3MUNFMXRMVEwwL09EMTVhUk8rSnZhZFFRY0tGNktrWkhRRzJH?=
 =?utf-8?B?cDJPVnBqYnhwRXRkU29nM1Q3cmFTaFZOV1djTGwrYUlEYkI5VUc2cUtCY0gx?=
 =?utf-8?B?VGhlWjh3bUVmNUk0bEx1YXlDT0tLdk84OEtieHFnZnd4SzlvUmluN2lIaDVK?=
 =?utf-8?B?a2taTUFXTklMZm5tbGJFN0ZtVXpnU3pMVURjVisxa0VvbDgrZUVleUN3bDh3?=
 =?utf-8?B?K0J4TDAxUW1CQVp3QmpVb1VQc0g5TVdmRjJVQm8zc1BGUk5qOVhOVmRYd09Q?=
 =?utf-8?B?b1VzaE8yWEczazZxc3hkREtpdWRsYU1lZjAwb2h6Q21KRTdqVjlTZDZoUTRa?=
 =?utf-8?B?QzFWSURlazZTSEU5WGFzL3o5MGNPeWh0UW0vbVVHcThkdDVpb0xYV0JFNVBB?=
 =?utf-8?B?Mk1veHJaSmEyUGhNem9VdjRjWkNFWFBLWTVTVjJJTDV0VUxOK25DRmdNWUZL?=
 =?utf-8?B?VjdtOUpwSlJiRlhhbStxMWNXdkdoUmw1aDRmN2RVdm9tMjF4dDh3NTFySUJ6?=
 =?utf-8?B?T0JYZS96UXJ1MGRMZ0s2MzdqcFJrb2RaRTRNUHVXNHdTVTdHVSt5dU1VUVZo?=
 =?utf-8?B?SXE4Q2doY2VtS2RMaFVKalU4bzh3KytKT25wSjdRZGN4SFlGaThvN1ZGbnNT?=
 =?utf-8?B?dE5OLzhYRkdaUUNHUWo2a0k1Smo0cmkvOGpjbU5iaE9mbEV3aWZ1OEpXQnFJ?=
 =?utf-8?B?QmpKaWxkZDBDaXFZZnJkQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWdtZEsrOWZMTCtzWDRQeXA3NFJpbU9wektxaEg1bE9nVkFlSUtXL1Yyb2Ri?=
 =?utf-8?B?MVJyTEo1MXRKV2ViSTRHaG02Q3FkQytzTmVwVHhTVDRDc0tlVWtSRzJDUS8x?=
 =?utf-8?B?NU9LNElZMU9lenhPMGV5d1orcXFQYmVHK21nMzhsN2x0L1VzUks2TkRjalU4?=
 =?utf-8?B?STh0VStnSDAxV2N6K0tNMTFCZHYvK3AxbG5nMC9vNUhYcjhVVzNJeEsvV2VJ?=
 =?utf-8?B?VFc1UG1YOURQQ3NENFNsNnVYSFhtUlE0cWFZYW1zUE80dlBRMmU3L2xhM1pu?=
 =?utf-8?B?aGhiZDFMOW9sOW55dnV3dDJWQkZINkVSV2JjR1RwcVQwdGtLUFpXK3JxYi9Y?=
 =?utf-8?B?a2ZiWHN1NHY1VnU0UXREOEhTRE1rT0R6YW53N3lMemt5Qmt2ZDFJQjhUNmlD?=
 =?utf-8?B?OXZlUHNGbk0rd3dILy9ic0JwL09zZzFLeUN4bThwc0NUUUVYZGsyQkVQRlJX?=
 =?utf-8?B?NmJ6RzZEK2RGUlY4eUN4VHRQcnJkNk1vL09kSVVMazg3NkZCSkVQODhHWmp2?=
 =?utf-8?B?d08vUHJXRzluMTFWNFdUK0ZQakRRNndVRk5NNDZ2QzVhdzgrMDJ5QmIxNTZ1?=
 =?utf-8?B?S2tXT0puQ2FRVkZvd0pNbS81N0pQQktpdEEyd0l6UE5aU2NWVHFEZm82ekpO?=
 =?utf-8?B?eEtSN1N3bHF4QUlTQXNMZ2dhVjFrbHZ6SkswRmxNM2JSZHM1WXg3WVVwREZS?=
 =?utf-8?B?Z3U2bTQ1ZlJ4NlFacTVubGxWN2pMR080dEgzcXV0V2lyNVovUmxXLzVkN1pW?=
 =?utf-8?B?UUUwK2s5Z1o4QVFURUF4Q0dNb0UzMGVjNmV0WDdLWE55QStVVllIQWdvUFFL?=
 =?utf-8?B?UjVHL2RDVktMWjVmdVd2VHB3TUs1MWNrNlJNRVF5VUp3WnZ5SmR0UWUwVjN6?=
 =?utf-8?B?cGxwSDhaZDJESEhsaW9NNW9hYkM1KytDT3dnVDJFcmZZaWdjYnM5N3RvVzhQ?=
 =?utf-8?B?SjZoaHYwZmpUdHh2OVNqd2FCSkRZVys1YmhrREloZmNOQnpIOGxHOHZ0SFF6?=
 =?utf-8?B?TitUTHJsV3ZpcHpnU1pDUENSRWNvSTdQSHk4a2JtODkyUVJ1aitmb1dBQkha?=
 =?utf-8?B?RERBcUZFS2hNNUhETW9KVjk4b2l6T0JpSk8rc0pweERTL2pUZWlPQ3BVbFJw?=
 =?utf-8?B?eVpMQldJMG5nUU9rQ2RUOXZlSCtxZHJZQmsrSHA1OWYyMklRaUY1NDBPV3ZJ?=
 =?utf-8?B?MmJ5alNDeFJFVnVkVEVHejFZZnJydmhWUTR3NDF3TisxeWx1NitPaWUyMmZt?=
 =?utf-8?B?VDZUWmpMbEhsY2pPZndtcHoyQi84V0ZDamRPYnFBb2hHMDJ0ZEVUTTBZdkN5?=
 =?utf-8?B?RWlFNzVFaWhoUVdJcnI2aUJDQ3ZQUC9YaWVndUtKVGh5MFkwVnNuYXRiMG1B?=
 =?utf-8?B?VEZONVR4VkdmRlhLQ0hQYWdWd1BzVVdVeDUxeWRXMW1iK0VzdGxXOXNwU2l0?=
 =?utf-8?B?M0trMmlkcGNFQjR3ODRXREYyc2pqc1JUd3l5OGYxUFFmL3JMc2lQWmt3R0kr?=
 =?utf-8?B?b3lDeFE0TmhPT1JtWnpGTnB1R0YxWXJGUk8vREFWSGQrK2lsc0lNcVcxVFFv?=
 =?utf-8?B?QWVPKzZHdUdOdm5iTDRHZFREZGZPeFV2dEFIU0ppd2VqVnNtWnZkZWMyWEVZ?=
 =?utf-8?B?aHJGU0p6SG1VbEhDNHVpY21PekFabFJFaEFITFFCcUUvMUtDbDJ1WHlybWxm?=
 =?utf-8?B?bFU1QyswTWhHSGJEcjJ6YUxCTXpOUlJXSUZoUld2K3A0VU1HZTdWZ3R4VEZJ?=
 =?utf-8?B?OFBEWXdha2FTVU5FSXhheE45U1haV0FHU0tBcXJXbHo3S1lSNmF5YUJIOVZz?=
 =?utf-8?B?endYemRJemZDSXhPdnk0UXVETjRLU1JBREtWOFhNT3A2eE5LK09hU0hUaUpa?=
 =?utf-8?B?UjZ0aVUreC9NZFBIZEZ0ckYxUDMycDQvbVJWRWJqOUZWc2JuamVTSnkwWmJV?=
 =?utf-8?B?Qlk4NTFQaHlQVlV2SkZWcERtYXFLU28wVCtBVU1jSCs2OVlNaGl3Tk9vbEdx?=
 =?utf-8?B?SVhhdGM4N1J2WUNxbXI5OUZXTlU4eTc0bUNkVEZac0dyRFRWb1BLWjFOL3lL?=
 =?utf-8?B?cjFKYmFucnZ3NUcxa0NPa3ZnV0ZYbmZDeHBkZHdic3ptZ1lmVG5Vckdma09o?=
 =?utf-8?Q?fc7kF2DZKJ4m2PXKCKYj9hAOf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 129cb719-e9e9-4904-993a-08dcd687ddc3
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2024 19:43:41.1250 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ABvCROR19TPtSlTGnRTZZRzh7Z6496AnsUIjGmSlnCZZ4eRj2JPwSOyqhSEXfdzcamvLgXazbIqMaKDSl2nDWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7349
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



On 2024-08-26 12:57, Mario Limonciello wrote:
> On 8/24/2024 13:33, Thomas Weißschuh wrote:
>> Not all platforms provide the full range of PWM backlight capabilities
>> supported by the hardware through ATIF.
>> Use the generic drm panel minimum backlight quirk infrastructure to
>> override the capabilities where necessary.
>>
>> Testing the backlight quirk together with the "panel_power_savings"
>> sysfs file has not shown any negative impact.
>> One quirk seems to be that 0% at panel_power_savings=0 seems to be
>> slightly darker than at panel_power_savings=4.
> 
> Thanks; This is the kind of thing I was worried about.
> 
> Harry, Leo,
> 
> Is that expected?  I wonder if we need to internally turn off panel power savings in display code when brightness falls a threshold (12 IIRC was the real "minimum" advertised in the table?).

How much darker? Is it bothersome?

I wonder the FW and driver have different min backlight values now.

Leo, any thoughts?

Harry

> 
>>
>> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
>> Tested-by: Dustin L. Howett <dustin@howett.net>
>> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/Kconfig                |  1 +
>>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 10 ++++++++++
>>   2 files changed, 11 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/Kconfig b/drivers/gpu/drm/amd/amdgpu/Kconfig
>> index 0051fb1b437f..655c10aef2e3 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/Kconfig
>> +++ b/drivers/gpu/drm/amd/amdgpu/Kconfig
>> @@ -23,6 +23,7 @@ config DRM_AMDGPU
>>       select DRM_BUDDY
>>       select DRM_SUBALLOC_HELPER
>>       select DRM_EXEC
>> +    select DRM_PANEL_BACKLIGHT_QUIRKS
>>       # amdgpu depends on ACPI_VIDEO when ACPI is enabled, for select to work
>>       # ACPI_VIDEO's dependencies must also be selected.
>>       select INPUT if ACPI
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> index 983a977632ff..056960ea335c 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> @@ -93,6 +93,7 @@
>>   #include <drm/drm_fourcc.h>
>>   #include <drm/drm_edid.h>
>>   #include <drm/drm_eld.h>
>> +#include <drm/drm_utils.h>
>>   #include <drm/drm_vblank.h>
>>   #include <drm/drm_audio_component.h>
>>   #include <drm/drm_gem_atomic_helper.h>
>> @@ -3333,6 +3334,8 @@ static void update_connector_ext_caps(struct amdgpu_dm_connector *aconnector)
>>       struct drm_connector *conn_base;
>>       struct amdgpu_device *adev;
>>       struct drm_luminance_range_info *luminance_range;
>> +    const struct drm_edid *drm_edid;
>> +    int min_input_signal_override;
>>         if (aconnector->bl_idx == -1 ||
>>           aconnector->dc_link->connector_signal != SIGNAL_TYPE_EDP)
>> @@ -3367,6 +3370,13 @@ static void update_connector_ext_caps(struct amdgpu_dm_connector *aconnector)
>>           caps->aux_min_input_signal = 0;
>>           caps->aux_max_input_signal = 512;
>>       }
>> +
>> +    drm_edid = drm_edid_alloc(aconnector->edid,
>> +                  EDID_LENGTH * (aconnector->edid->extensions + 1));
>> +    min_input_signal_override = drm_get_panel_min_brightness_quirk(drm_edid);
>> +    drm_edid_free(drm_edid);
>> +    if (min_input_signal_override >= 0)
>> +        caps->min_input_signal = min_input_signal_override;
>>   }
>>     void amdgpu_dm_update_connector_after_detect(
>>
> 


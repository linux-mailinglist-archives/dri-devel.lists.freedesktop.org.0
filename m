Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aD1WGAv7m2l5+gMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 08:00:27 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 116651727BF
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 08:00:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29CEA10E250;
	Mon, 23 Feb 2026 07:00:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="x4qvGEjI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010037.outbound.protection.outlook.com
 [52.101.193.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E830610E24F;
 Mon, 23 Feb 2026 07:00:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GboFBA2x4mWpq0oTwnTEoY4g8hait+p40p2QtknPW6iewbClKuUj4ntOVMRWTTWFPXLrwlgrUl8i7pV53aumjE1tqs3Az86/E/RmZTr87fDzfXzTTSF1Vvmg71qOYeJno0uu6c0PEOxaVc2YUxN+JfOnQcbJnLV/aqjtcsoWF0Bv3bkASALXIEz5j5+3RvgvDxD6EU9bMjCHY3aCoDnSHwNkJaGN0Oq749Nu19/JEzUM75kSRHIUtWbFEVijrsIizGQwIZQqXUvaN/hcOi8DY4UAyhh2u7W40GWjzrB0S3P8p+mDjXW4Z9KBeN6PB9zkI6jCg8kXyOWEQaGupzYgFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u9U6P/D9+oqKd7zY8ZjtClcRqLrKtZfVuQ2vceUq37s=;
 b=PFG1wTeqb5VeGGyLnSsTk6j3d9HlbaGag/NfnNk9KTiRPwdgDXPG6zmaEgjgrIob3rJHDF22zb20zHTLxWOksIgzwEVsT+KYRMUCtubII/CXgIcW9Yh6l3oyrSrmVbW3KJu70WtbzAIhe80lA8NxY4eJ9gjxrMUG/fN0jXdAdayR2/lERAoIgCwzXvoCJ74uMoBQVK//koUqr+PSt0Blb2aVSK6eEc1kr+CXbsMfYY9hyNesAbWyPhm+WLj/z8ftXK8WbuVvbs+CLo5D7ZaPZuSY/mFMzW0tmfBVZzff1eYQh/UhK2GdjxviephixRKDl4I9kxjnHpalhQiMVZm1dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u9U6P/D9+oqKd7zY8ZjtClcRqLrKtZfVuQ2vceUq37s=;
 b=x4qvGEjICaVXF3jnUqs6SffAv4icrQnHKlS/+J5hGxznrNMD2y5WSB1G80wvcc4ASveIepVmHPRQtlRuZnoCC14fS4WPteXCRY2qdK531lUYTCSQwEBj0yOfz8P4D105OQj26+Q++3mbdyOQUlZqmm00DKVAOMA61m/P8zjXGEc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7301.namprd12.prod.outlook.com (2603:10b6:510:222::12)
 by PH8PR12MB7183.namprd12.prod.outlook.com (2603:10b6:510:228::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Mon, 23 Feb
 2026 07:00:19 +0000
Received: from PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::8434:dc50:a68d:7bdd]) by PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::8434:dc50:a68d:7bdd%4]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 07:00:19 +0000
Message-ID: <e360b60c-df02-402d-895d-f97a4ca38756@amd.com>
Date: Mon, 23 Feb 2026 12:30:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] drm/buddy: Improve offset-aligned allocation
 handling
To: matthew.auld@intel.com, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: alexander.deucher@amd.com
References: <20260217113900.10675-1-Arunpravin.PaneerSelvam@amd.com>
Content-Language: en-US
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <20260217113900.10675-1-Arunpravin.PaneerSelvam@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0117.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::21) To PH8PR12MB7301.namprd12.prod.outlook.com
 (2603:10b6:510:222::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7301:EE_|PH8PR12MB7183:EE_
X-MS-Office365-Filtering-Correlation-Id: fdd29139-c419-4e50-82e0-08de72a9346e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|366016|1800799024|19052099003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Wi9yN3BIK2F1WEhZRFRHaGZqVS9BZG9XNHAvU25ReUs0bzA1QjVnUkVxZmpv?=
 =?utf-8?B?endwY2VQZ0dLSWo0VjRlR0VRUGZiUFBWamIwdFBldTNVaGF3S3llUlRab0xT?=
 =?utf-8?B?Z1hEclA3OGpuRmNrZGlzZWVZd2hnNmNYaWwrbzEwMnZXWSthTWhqbHNnc0s2?=
 =?utf-8?B?UjBhOWIxbDZqWnZXTTdlS0hLc1lpb241SWJyWTVzK3J2TS9XNFhVc2QweG5O?=
 =?utf-8?B?clV3c3VqR0IxTzZyY2JJNFdKWFFESGJ2NE9tUDQyeTAxR3JQTVQ3SmVNRnZT?=
 =?utf-8?B?WEorTWpMRGhIc2Y3NHJlWk8wakN1MnhsOThhMXFmTHdHeVM3QVo4NTZYNWI2?=
 =?utf-8?B?RmdIZ3c3WllkYVovOFY2MWpLYi82RjhyM2hRM2pHa2lTSVM0Nnhid1M4UjdB?=
 =?utf-8?B?VThJR0VuMGVmUEg2MnNoTUcwcFNzckVYNTBicDhPWXRScW1CbUZ3OTdCQUdB?=
 =?utf-8?B?T3ZtNTZTS01HTkZWcC80clpjUWdRd3Qwbm9yRWpqQkc4cWtrNjZaSHdPM3lM?=
 =?utf-8?B?ZDVRSE1TZStSeGM3QXNvY29mbHgvRUswL2o2RmlBK05rN2lWRDZBUXVKRFd1?=
 =?utf-8?B?TVo3Vm5wM2w3QnpENFJHNm9FN3EyNU13QzBLQitubUptMWdsZUV5elJ2YTZQ?=
 =?utf-8?B?U0hQOGg2eVp3OGF5VTNTTTQ5UzQzL0xEWG9FcVFJRjFIOTZRYk9zYVYzcklQ?=
 =?utf-8?B?bFNhM1llTmwrTElyRUlKdHNVcXhla3NoaEsyTTVrQ3NUOUxtODZoRHZMK2I3?=
 =?utf-8?B?cHVsZ2lsMEVlM0c4RkNjSERhcmVrcVFtMkJGeW5sODlvRnZ1U1pGMmxMakdu?=
 =?utf-8?B?MTM1cW8vazFTeWt4NngxZFVZU0gvY3pMcFN1U0tEM0ZTR29XMzNRSVZKWmI1?=
 =?utf-8?B?VlpEUkVqejFaSERtaXowVGROOTFoY2FoWDhDMU51b1h2S0h5Wjl6dmp4eENt?=
 =?utf-8?B?YUR2SEVoeVBlbmJCWlJ0TnY0dnVqcURDazdlQ2xKbU9mczNUWGlGNlhrSHFD?=
 =?utf-8?B?L2hmLzc4Z0NVbEt2QnNwSGlqYmtiZkwvajEzZjNQclZwa1pHRjZmaDZOdTFa?=
 =?utf-8?B?czJkWmhPTjFyeWJvTHNqZHRTMGVRTzZSV09wOHV2ZFJJaHRsaFJRdFVkck5E?=
 =?utf-8?B?cDZxb3Vud1VLVzNKWER2ZDhNK3J2OE5yelFqd25oQWUwTFVyQ3psenZhK2Fy?=
 =?utf-8?B?ODZVblpmNnd6OXdudk5KbWlWWnVUTExKc2YrTEtSS3dUV1ZkQXNjZytMaUlv?=
 =?utf-8?B?TE4rT1BYT3kvY1N5Y1hPUUtVaDkwUVNsTUEzMTBocVB1ZlhKbnQ4R1BmYm81?=
 =?utf-8?B?L21ZRmMyTk05SWZnNGk2bEhxWG5OKzZTUmNNY3lBa2xCSHRsUGY0aXVYWXVk?=
 =?utf-8?B?bEMxeXZRZnNHbi8vK3YzenFIbkZyelEyR0p6RFRWK1FUMmc2TFhpeFdIc1Bv?=
 =?utf-8?B?ckxpcVdhM0NNK0ZiME1oaS81R0d5cFpwYkJHQmtZNmZGZEJCYWJ1cGJTMlls?=
 =?utf-8?B?ZUdMN0ZJWGYwdWdNOURRS3pyTVVzb0FaNGRlRVFsaTB3dnpxTzlWaCtKRzZH?=
 =?utf-8?B?WE9GQTNHdHpkc0Z5U1FxQkF4RG9LaGNjWVQwSEU5d08wU3JFUVMydTYza3hE?=
 =?utf-8?B?VnhaS21DRVNwVEhCZnRWZDNVNEdlbXFXelcvR2xDdCs3NDczTWsrQ3dIemR2?=
 =?utf-8?B?eUc4RklvVHE5TjI4WElmSVFUSHpTQ2puMWQycFB3NjBmcTNIYVRiakIxdUlO?=
 =?utf-8?B?TnBYRFNibHJEVGhwVkY4cTVLV21Lcm4wMEMwam1wL2lrU0xHd0xxZitrYnNB?=
 =?utf-8?B?eDQ5RzJUYy8vSWJOMk9hYnprUWJ2QlhuUEtGbUNGdVpHUGZVMkhqOHRpUThJ?=
 =?utf-8?B?NHMxZTBpbEZENmE1N0FQdUcvUWp0YXF5YWlabkRIZjJESWxJcWpPQ0tMNGxh?=
 =?utf-8?B?NXkzeU1NQm9HQUk4aSs1T3F6S0k2SElNamZMaDBaTDlmcXBvcnJhVVQ0bmFV?=
 =?utf-8?B?YW9FaWRKTWIyclBQQkQrWllnNVlzR2hNeE51bmRCUHFBd3hnYVdWQTdCb3VL?=
 =?utf-8?B?NlUyZTFubHhabUJlcG8ycGxNOWdnby9RNDRSeDBQclZHeW9zR1RRQlZwNExr?=
 =?utf-8?Q?pkE4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7301.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(19052099003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3hlWjA0eG0xNWZCaUZ3Zm1PNzk3MGFXOE5DQ1phYmcyYyt0MUwxYmpNZFc0?=
 =?utf-8?B?dzE0UDgzTUJVZUQ0Um1SWTNuZFlhVEswTzdEUHlpMmVLUDkyckI2WjJDd0Z4?=
 =?utf-8?B?VUM2OFJrSkFyMXlRMG5KQ1A5bGtrUkZuVm9mdUtoVG0yY0V6bFQ3SThBZ0Y1?=
 =?utf-8?B?UU53d2xzK2tkdzFya0piMEQ0NDdDbjE4aUNIaUVRbStna3pQVG5KMWp2TWJw?=
 =?utf-8?B?OWxKeEtoMitqY1NkbVJjMFpWUXZaNHFXNlpDbXNjR0xQV04wTGpKZFNSYzhU?=
 =?utf-8?B?RjAvNGVjb3c5WFY2S1Y2V255LzJ6WHBGLzFCcWJuc2JVQ0Nsc2d5b2syaUFC?=
 =?utf-8?B?NVV2MWQ2WDFueTRDZUZ3T1JwOHVKdnNaQkljS05QODFYVU1DSDFxM3NoaUFx?=
 =?utf-8?B?UVA1TTlkMEZCTFFWTTMwSjVPOFllNk54bUJxQlFHbDFzMmJ5eDY1dXg0cDdT?=
 =?utf-8?B?NUlYRVgwSFJJTW9oWnVUbURRYzRMeTFPU1Z4QTdycFM4eUltV3B5eE9VYVcr?=
 =?utf-8?B?NDZyRTNvMC9RTVV1N2J2aThuenFmK0poZVVFVjVJZTFTVGxSa3ZFeDVaSjVh?=
 =?utf-8?B?TjBrdnlNNmdBVEJIYjhvckdUM1A0eXJLOHlNSmphaExQb252K2JmbXRFaXpL?=
 =?utf-8?B?TVh6SWhIV01CMHNFemY1bzZMeElFbHZSSWF4VDhzRnc0ZkFnemIrQnBHOGpP?=
 =?utf-8?B?YnZOL284MzQwVEVIWkZWaEN2NWhqR1A5MjEwc3hVUERBZmVVQU4rWE8wYURR?=
 =?utf-8?B?bnltV0VUay9mYVpoYnVtWTZSMFhxSGc5dHMxTUhwem1pMU5hS2NLQldveit5?=
 =?utf-8?B?UTUvay96aUJEUDFVNGtDSTF5b1ZpcEkxaEpnTndPckxUcnJvUEo2VzRFNjR4?=
 =?utf-8?B?WGdHUHFZMk5VQTBFc1N1MHlYdVNqZkVrekpaMUtBSWxJWUxIL3Y3RW1yYjJ6?=
 =?utf-8?B?YmIzSE9wRXJoYmY5Q0N4NmVKSkZlamhCdlRWNWxoejVmaDBOWU9mUmhmTjha?=
 =?utf-8?B?NnZxN0NYc1Q0UHVEOHY4UndyMWVlWkI2a0pPVVV1dkxEcVYxSnZJSzZnbkFQ?=
 =?utf-8?B?bWdEa3VSNmtnNk11ODcyT1M3K1h3NmwxRTFUb2tCRnN2dnFjSVhzdUZaYUpx?=
 =?utf-8?B?SXk0clBPMDNBbUNjZmowY0lNQkRSbyt6R2xaWUxFR2l4OWxwYUpSK0N3a2Zm?=
 =?utf-8?B?UU9jVWp5RzVSZmZ2a3Urc0dLQ1lSSTVxZUkyTVI3N0pnV3lDQWVuMmVtVGhF?=
 =?utf-8?B?NFNJRkZLZlFVVGVldlpyMUt4NFhvbXVUVkt5VEtIVU83SHFjNk0wRk9DbFdT?=
 =?utf-8?B?eWdUTmRPby9qK1dBZGNkRzJvM1l4cTlXUFRDdG43bzIveGEwMTIvVlFxdlpl?=
 =?utf-8?B?T0w4d2l4WG1yMzRuNVFlU3h2WDJtVWdFV21PUzE1S0tGVUVNMDV4cHpQUnBn?=
 =?utf-8?B?dVArck5JQTMvaEFXaVNGaWIzUDU2dHVZd05BdGZmcHRUS0prM3pkMHhKRXNZ?=
 =?utf-8?B?dEx0Ly9EQm0wdXVBWEkzZENDaFhFUXd5ODZLdWxJb0lmUDlSWXZadXJTdFRq?=
 =?utf-8?B?WllSbWdLQlpIWkJWQUM3aVphODd6N1dxZGdFZWE3K0xxZ2Z1bWpKSzNFUjh3?=
 =?utf-8?B?VWFaM212cDZKMER2c3dBN2hmdm8vMThpLzBqbVVnR3p5bWsreFBEYWVQckVD?=
 =?utf-8?B?TmNKcDRtV29JYUlJcGlkeXdXYllnakY2eWFwek0vUmR1VGs1Q216YnR4RGla?=
 =?utf-8?B?ekx1S01KaWdlbEF5dUNSMVhrZzhKQW9PRlFQUUV1OHJyV0p1Vzl6T1NEdDVw?=
 =?utf-8?B?enpaOFp6bFBLUTZIUWp0ODYrVzU3YkI3Rit0ZGNubkV3emN0Rk15bXRYdUhX?=
 =?utf-8?B?ZUxENXh1eFF2czFvMnpodjc2K0ExU0lGcEt0UTNORk1nLzJLa2RzenlzdlpZ?=
 =?utf-8?B?VXNSTXR3QlNxZ1NwUjFNOXlveHJIMjhrNWYveGx1bHhsbjRkMEdwWlFZVTFD?=
 =?utf-8?B?dDNvV3NGQ2h0Nk0randJVng4RkNaVWVMZFViSk5XR3Z6Y0syMUZYU21vWGlJ?=
 =?utf-8?B?K0JlS3hKVVJVb2w4VHg0Y25nWW9XcEVEbDlJK2o1NjFEVStlWnJpdjdFUmI2?=
 =?utf-8?B?Uy80eStnUGdmVnNjZ0hCSkE5Tm9pSkZWZnlnYnc4V1lOOEs4bTliWkFweTNT?=
 =?utf-8?B?WnZRZ2lvZWlLQjdJa21obE80dktOY2RYM2NRRVdjVXIrc1dTZE05aGdaZWZ1?=
 =?utf-8?B?QTZJSk1ZemFFMmp1eWRkM0pObTNOajRFcGlvTXFCTU1YNGVLbW9NY0lzVUMz?=
 =?utf-8?B?bTd3bU1TZS9yT0NVcmRpVitzKzM3RHpIRE5YQUdkaTBIUzdSSDhFZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdd29139-c419-4e50-82e0-08de72a9346e
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7301.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 07:00:19.1606 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WLbN6MHi0eKBeqKnGBoBqEBtlY4ozjiEsFuXxhaZ1RNVqVMH7KlPAOuRDaa3IXLVtfV0a/GKV916rF/0z8A/0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7183
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:mid,amd.com:dkim,amd.com:email];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arunpravin.paneerselvam@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_TRACE(0.00)[amd.com:+]
X-Rspamd-Queue-Id: 116651727BF
X-Rspamd-Action: no action

Hi Matthew,

Ping ?

Regards,
Arun.

On 2/17/2026 5:08 PM, Arunpravin Paneer Selvam wrote:
> Large alignment requests previously forced the buddy allocator to search by
> alignment order, which often caused higher-order free blocks to be split even
> when a suitably aligned smaller region already existed within them. This led
> to excessive fragmentation, especially for workloads requesting small sizes
> with large alignment constraints.
>
> This change prioritizes the requested allocation size during the search and
> uses an augmented RB-tree field (subtree_max_alignment) to efficiently locate
> free blocks that satisfy both size and offset-alignment requirements. As a
> result, the allocator can directly select an aligned sub-region without
> splitting larger blocks unnecessarily.
>
> A practical example is the VKCTS test
> dEQP-VK.memory.allocation.basic.size_8KiB.reverse.count_4000, which repeatedly
> allocates 8 KiB buffers with a 256 KiB alignment. Previously, such allocations
> caused large blocks to be split aggressively, despite smaller aligned regions
> being sufficient. With this change, those aligned regions are reused directly,
> significantly reducing fragmentation.
>
> This improvement is visible in the amdgpu VRAM buddy allocator state
> (/sys/kernel/debug/dri/1/amdgpu_vram_mm). After the change, higher-order blocks
> are preserved and the number of low-order fragments is substantially reduced.
>
> Before:
>    order- 5 free: 1936 MiB, blocks: 15490
>    order- 4 free:  967 MiB, blocks: 15486
>    order- 3 free:  483 MiB, blocks: 15485
>    order- 2 free:  241 MiB, blocks: 15486
>    order- 1 free:  241 MiB, blocks: 30948
>
> After:
>    order- 5 free:  493 MiB, blocks:  3941
>    order- 4 free:  246 MiB, blocks:  3943
>    order- 3 free:  123 MiB, blocks:  4101
>    order- 2 free:   61 MiB, blocks:  4101
>    order- 1 free:   61 MiB, blocks:  8018
>
> By avoiding unnecessary splits, this change improves allocator efficiency and
> helps maintain larger contiguous free regions under heavy offset-aligned
> allocation workloads.
>
> v2:(Matthew)
>    - Update augmented information along the path to the inserted node.
>
> v3:
>    - Move the patch to gpu/buddy.c file.
>
> v4:(Matthew)
>    - Use the helper instead of calling _ffs directly
>    - Remove gpu_buddy_block_order(block) >= order check and drop order
>    - Drop !node check as all callers handle this already
>    - Return larger than any other possible alignment for __ffs64(0)
>    - Replace __ffs with __ffs64
>
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> Suggested-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/buddy.c       | 275 +++++++++++++++++++++++++++++++-------
>   include/linux/gpu_buddy.h |   2 +
>   2 files changed, 232 insertions(+), 45 deletions(-)
>
> diff --git a/drivers/gpu/buddy.c b/drivers/gpu/buddy.c
> index 603c59a2013a..542131992763 100644
> --- a/drivers/gpu/buddy.c
> +++ b/drivers/gpu/buddy.c
> @@ -14,6 +14,25 @@
>   
>   static struct kmem_cache *slab_blocks;
>   
> +static unsigned int gpu_buddy_block_offset_alignment(struct gpu_buddy_block *block)
> +{
> +	u64 offset = gpu_buddy_block_offset(block);
> +
> +	if (!offset)
> +		/*
> +		 * __ffs64(0) is undefined; offset 0 is maximally aligned, so return
> +		 * a value greater than any possible alignment.
> +		 */
> +		return 64 + 1;
> +
> +	return __ffs64(offset);
> +}
> +
> +RB_DECLARE_CALLBACKS_MAX(static, gpu_buddy_augment_cb,
> +			 struct gpu_buddy_block, rb,
> +			 unsigned int, subtree_max_alignment,
> +			 gpu_buddy_block_offset_alignment);
> +
>   static struct gpu_buddy_block *gpu_block_alloc(struct gpu_buddy *mm,
>   					       struct gpu_buddy_block *parent,
>   					       unsigned int order,
> @@ -31,6 +50,9 @@ static struct gpu_buddy_block *gpu_block_alloc(struct gpu_buddy *mm,
>   	block->header |= order;
>   	block->parent = parent;
>   
> +	block->subtree_max_alignment =
> +		gpu_buddy_block_offset_alignment(block);
> +
>   	RB_CLEAR_NODE(&block->rb);
>   
>   	BUG_ON(block->header & GPU_BUDDY_HEADER_UNUSED);
> @@ -67,26 +89,42 @@ static bool rbtree_is_empty(struct rb_root *root)
>   	return RB_EMPTY_ROOT(root);
>   }
>   
> -static bool gpu_buddy_block_offset_less(const struct gpu_buddy_block *block,
> -					const struct gpu_buddy_block *node)
> -{
> -	return gpu_buddy_block_offset(block) < gpu_buddy_block_offset(node);
> -}
> -
> -static bool rbtree_block_offset_less(struct rb_node *block,
> -				     const struct rb_node *node)
> -{
> -	return gpu_buddy_block_offset_less(rbtree_get_free_block(block),
> -					   rbtree_get_free_block(node));
> -}
> -
>   static void rbtree_insert(struct gpu_buddy *mm,
>   			  struct gpu_buddy_block *block,
>   			  enum gpu_buddy_free_tree tree)
>   {
> -	rb_add(&block->rb,
> -	       &mm->free_trees[tree][gpu_buddy_block_order(block)],
> -	       rbtree_block_offset_less);
> +	struct rb_node **link, *parent = NULL;
> +	unsigned int block_alignment, order;
> +	struct gpu_buddy_block *node;
> +	struct rb_root *root;
> +
> +	order = gpu_buddy_block_order(block);
> +	block_alignment = gpu_buddy_block_offset_alignment(block);
> +
> +	root = &mm->free_trees[tree][order];
> +	link = &root->rb_node;
> +
> +	while (*link) {
> +		parent = *link;
> +		node = rbtree_get_free_block(parent);
> +		/*
> +		 * Manual augmentation update during insertion traversal. Required
> +		 * because rb_insert_augmented() only calls rotate callback during
> +		 * rotations. This ensures all ancestors on the insertion path have
> +		 * correct subtree_max_alignment values.
> +		 */
> +		if (node->subtree_max_alignment < block_alignment)
> +			node->subtree_max_alignment = block_alignment;
> +
> +		if (gpu_buddy_block_offset(block) < gpu_buddy_block_offset(node))
> +			link = &parent->rb_left;
> +		else
> +			link = &parent->rb_right;
> +	}
> +
> +	block->subtree_max_alignment = block_alignment;
> +	rb_link_node(&block->rb, parent, link);
> +	rb_insert_augmented(&block->rb, root, &gpu_buddy_augment_cb);
>   }
>   
>   static void rbtree_remove(struct gpu_buddy *mm,
> @@ -99,7 +137,7 @@ static void rbtree_remove(struct gpu_buddy *mm,
>   	tree = get_block_tree(block);
>   	root = &mm->free_trees[tree][order];
>   
> -	rb_erase(&block->rb, root);
> +	rb_erase_augmented(&block->rb, root, &gpu_buddy_augment_cb);
>   	RB_CLEAR_NODE(&block->rb);
>   }
>   
> @@ -790,6 +828,127 @@ alloc_from_freetree(struct gpu_buddy *mm,
>   	return ERR_PTR(err);
>   }
>   
> +static bool
> +gpu_buddy_can_offset_align(u64 size, u64 min_block_size)
> +{
> +	return size < min_block_size && is_power_of_2(size);
> +}
> +
> +static bool gpu_buddy_subtree_can_satisfy(struct rb_node *node,
> +					  unsigned int alignment)
> +{
> +	struct gpu_buddy_block *block;
> +
> +	block = rbtree_get_free_block(node);
> +	return block->subtree_max_alignment >= alignment;
> +}
> +
> +static struct gpu_buddy_block *
> +gpu_buddy_find_block_aligned(struct gpu_buddy *mm,
> +			     enum gpu_buddy_free_tree tree,
> +			     unsigned int order,
> +			     unsigned int alignment,
> +			     unsigned long flags)
> +{
> +	struct rb_root *root = &mm->free_trees[tree][order];
> +	struct rb_node *rb = root->rb_node;
> +
> +	while (rb) {
> +		struct gpu_buddy_block *block = rbtree_get_free_block(rb);
> +		struct rb_node *left_node = rb->rb_left, *right_node = rb->rb_right;
> +
> +		if (right_node) {
> +			if (gpu_buddy_subtree_can_satisfy(right_node, alignment)) {
> +				rb = right_node;
> +				continue;
> +			}
> +		}
> +
> +		if (gpu_buddy_block_offset_alignment(block) >= alignment)
> +			return block;
> +
> +		if (left_node) {
> +			if (gpu_buddy_subtree_can_satisfy(left_node, alignment)) {
> +				rb = left_node;
> +				continue;
> +			}
> +		}
> +
> +		break;
> +	}
> +
> +	return NULL;
> +}
> +
> +static struct gpu_buddy_block *
> +gpu_buddy_offset_aligned_allocation(struct gpu_buddy *mm,
> +				    u64 size,
> +				    u64 min_block_size,
> +				    unsigned long flags)
> +{
> +	struct gpu_buddy_block *block = NULL;
> +	unsigned int order, tmp, alignment;
> +	struct gpu_buddy_block *buddy;
> +	enum gpu_buddy_free_tree tree;
> +	unsigned long pages;
> +	int err;
> +
> +	alignment = ilog2(min_block_size);
> +	pages = size >> ilog2(mm->chunk_size);
> +	order = fls(pages) - 1;
> +
> +	tree = (flags & GPU_BUDDY_CLEAR_ALLOCATION) ?
> +		GPU_BUDDY_CLEAR_TREE : GPU_BUDDY_DIRTY_TREE;
> +
> +	for (tmp = order; tmp <= mm->max_order; ++tmp) {
> +		block = gpu_buddy_find_block_aligned(mm, tree, tmp,
> +						     alignment, flags);
> +		if (!block) {
> +			tree = (tree == GPU_BUDDY_CLEAR_TREE) ?
> +				GPU_BUDDY_DIRTY_TREE : GPU_BUDDY_CLEAR_TREE;
> +			block = gpu_buddy_find_block_aligned(mm, tree, tmp,
> +							     alignment, flags);
> +		}
> +
> +		if (block)
> +			break;
> +	}
> +
> +	if (!block)
> +		return ERR_PTR(-ENOSPC);
> +
> +	while (gpu_buddy_block_order(block) > order) {
> +		struct gpu_buddy_block *left, *right;
> +
> +		err = split_block(mm, block);
> +		if (unlikely(err))
> +			goto err_undo;
> +
> +		left  = block->left;
> +		right = block->right;
> +
> +		if (gpu_buddy_block_offset_alignment(right) >= alignment)
> +			block = right;
> +		else
> +			block = left;
> +	}
> +
> +	return block;
> +
> +err_undo:
> +	/*
> +	 * We really don't want to leave around a bunch of split blocks, since
> +	 * bigger is better, so make sure we merge everything back before we
> +	 * free the allocated blocks.
> +	 */
> +	buddy = __get_buddy(block);
> +	if (buddy &&
> +	    (gpu_buddy_block_is_free(block) &&
> +	     gpu_buddy_block_is_free(buddy)))
> +		__gpu_buddy_free(mm, block, false);
> +	return ERR_PTR(err);
> +}
> +
>   static int __alloc_range(struct gpu_buddy *mm,
>   			 struct list_head *dfs,
>   			 u64 start, u64 size,
> @@ -1059,6 +1218,7 @@ EXPORT_SYMBOL(gpu_buddy_block_trim);
>   static struct gpu_buddy_block *
>   __gpu_buddy_alloc_blocks(struct gpu_buddy *mm,
>   			 u64 start, u64 end,
> +			 u64 size, u64 min_block_size,
>   			 unsigned int order,
>   			 unsigned long flags)
>   {
> @@ -1066,6 +1226,11 @@ __gpu_buddy_alloc_blocks(struct gpu_buddy *mm,
>   		/* Allocate traversing within the range */
>   		return  __gpu_buddy_alloc_range_bias(mm, start, end,
>   						     order, flags);
> +	else if (size < min_block_size)
> +		/* Allocate from an offset-aligned region without size rounding */
> +		return gpu_buddy_offset_aligned_allocation(mm, size,
> +							   min_block_size,
> +							   flags);
>   	else
>   		/* Allocate from freetree */
>   		return alloc_from_freetree(mm, order, flags);
> @@ -1137,8 +1302,11 @@ int gpu_buddy_alloc_blocks(struct gpu_buddy *mm,
>   	if (flags & GPU_BUDDY_CONTIGUOUS_ALLOCATION) {
>   		size = roundup_pow_of_two(size);
>   		min_block_size = size;
> -	/* Align size value to min_block_size */
> -	} else if (!IS_ALIGNED(size, min_block_size)) {
> +		/*
> +		 * Normalize the requested size to min_block_size for regular allocations.
> +		 * Offset-aligned allocations intentionally skip size rounding.
> +		 */
> +	} else if (!gpu_buddy_can_offset_align(size, min_block_size)) {
>   		size = round_up(size, min_block_size);
>   	}
>   
> @@ -1158,43 +1326,60 @@ int gpu_buddy_alloc_blocks(struct gpu_buddy *mm,
>   	do {
>   		order = min(order, (unsigned int)fls(pages) - 1);
>   		BUG_ON(order > mm->max_order);
> -		BUG_ON(order < min_order);
> +		/*
> +		 * Regular allocations must not allocate blocks smaller than min_block_size.
> +		 * Offset-aligned allocations deliberately bypass this constraint.
> +		 */
> +		BUG_ON(size >= min_block_size && order < min_order);
>   
>   		do {
> +			unsigned int fallback_order;
> +
>   			block = __gpu_buddy_alloc_blocks(mm, start,
>   							 end,
> +							 size,
> +							 min_block_size,
>   							 order,
>   							 flags);
>   			if (!IS_ERR(block))
>   				break;
>   
> -			if (order-- == min_order) {
> -				/* Try allocation through force merge method */
> -				if (mm->clear_avail &&
> -				    !__force_merge(mm, start, end, min_order)) {
> -					block = __gpu_buddy_alloc_blocks(mm, start,
> -									 end,
> -									 min_order,
> -									 flags);
> -					if (!IS_ERR(block)) {
> -						order = min_order;
> -						break;
> -					}
> -				}
> +			if (size < min_block_size) {
> +				fallback_order = order;
> +			} else if (order == min_order) {
> +				fallback_order = min_order;
> +			} else {
> +				order--;
> +				continue;
> +			}
>   
> -				/*
> -				 * Try contiguous block allocation through
> -				 * try harder method.
> -				 */
> -				if (flags & GPU_BUDDY_CONTIGUOUS_ALLOCATION &&
> -				    !(flags & GPU_BUDDY_RANGE_ALLOCATION))
> -					return __alloc_contig_try_harder(mm,
> -									 original_size,
> -									 original_min_size,
> -									 blocks);
> -				err = -ENOSPC;
> -				goto err_free;
> +			/* Try allocation through force merge method */
> +			if (mm->clear_avail &&
> +			    !__force_merge(mm, start, end, fallback_order)) {
> +				block = __gpu_buddy_alloc_blocks(mm, start,
> +								 end,
> +								 size,
> +								 min_block_size,
> +								 fallback_order,
> +								 flags);
> +				if (!IS_ERR(block)) {
> +					order = fallback_order;
> +					break;
> +				}
>   			}
> +
> +			/*
> +			 * Try contiguous block allocation through
> +			 * try harder method.
> +			 */
> +			if (flags & GPU_BUDDY_CONTIGUOUS_ALLOCATION &&
> +			    !(flags & GPU_BUDDY_RANGE_ALLOCATION))
> +				return __alloc_contig_try_harder(mm,
> +								 original_size,
> +								 original_min_size,
> +								 blocks);
> +			err = -ENOSPC;
> +			goto err_free;
>   		} while (1);
>   
>   		mark_allocated(mm, block);
> diff --git a/include/linux/gpu_buddy.h b/include/linux/gpu_buddy.h
> index 07ac65db6d2e..7ad817c69ec6 100644
> --- a/include/linux/gpu_buddy.h
> +++ b/include/linux/gpu_buddy.h
> @@ -11,6 +11,7 @@
>   #include <linux/slab.h>
>   #include <linux/sched.h>
>   #include <linux/rbtree.h>
> +#include <linux/rbtree_augmented.h>
>   
>   #define GPU_BUDDY_RANGE_ALLOCATION		BIT(0)
>   #define GPU_BUDDY_TOPDOWN_ALLOCATION		BIT(1)
> @@ -58,6 +59,7 @@ struct gpu_buddy_block {
>   	};
>   
>   	struct list_head tmp_link;
> +	unsigned int subtree_max_alignment;
>   };
>   
>   /* Order-zero must be at least SZ_4K */
>
> base-commit: 0ef1dcf4c16bb6d90e8fbf7b18f3d76b79fcde9d


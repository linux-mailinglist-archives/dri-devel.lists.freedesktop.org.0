Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DCFFB4A216
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 08:22:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E241910E61D;
	Tue,  9 Sep 2025 06:22:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3FDO3d86";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2069.outbound.protection.outlook.com [40.107.102.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F0F810E61D;
 Tue,  9 Sep 2025 06:22:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jFI6vym/4x4fUu2cjsAkYmwe9O7f9A0w7fr/oGgOEdN+1tyo4zj82uJEjJ3lmA2IrEzym5qLoL4ffHTzsJSdGAaR9mvMdbMflTm2szZJ/F4kIr5ekspXf1LH8b8yYIKLmWkwIVoG3xHv1B04MKX+3SpfiiggR+AedLefLttF5UHf1fmtvpgCdqctYtPrNLbdsv0uyWZsEEqUcYWpDJPFSSde/BCZ2nxLJqmXpI18xA55/BU+2rj1sRk2T5dHeImx7AQvy7gc9j8bDjy0EwsgEK3JRFzgT9xatcTS6vyq9iUNKYKAwYzkl7iLKpAh9V6jDumEXIWnKc4xwYW43cRPTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tVF2ZrFRm25jha5Xm3qlXVaAjZIDSkZjVbumTHoKOmg=;
 b=bAMLM6BHTLpQJF/I5ch/A7inXzBKacrpB2ikAQWwFJM8FNh1u+S0tRPTcFR4F1ordDTTqQvsCWolDovyCeC1ELCoUDcqxath9VXnx7CJnJ/1qIrMWJp6Vi0SnO8BMWHcTlVtbFWQvXF/F834Y67nHojnXCDAg9mT7KODekFiinUeIVdxak4fwCDloBOGINYnBmxeNSjN8Ew0V9P/9wA4qXUdXVYIlPi/29WeC2j6trWLyZNhcaucP6/P63WA/0vSrf0ohTbEXBMqpOV4KoIxRL4BetWD2r6+AHTimTYvRTmvSlpdNIssoV4Lz4X2TrTi7OeQOK2A+Md3m0WSYGZCiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tVF2ZrFRm25jha5Xm3qlXVaAjZIDSkZjVbumTHoKOmg=;
 b=3FDO3d86czlGJ9L4QKknmO3NgLZTVeba9PQhQoYDSBUeXqtdEElkgyC5biC/pqq5qppctIH0RSQQA8yrgKSvPSV9Bsv9HQDKB240gYFVuNBePFxtzQC3EV+g/Wrp7JPMSSqBv/xOX4/uzWW96C45ilKRklisbmwlhsps6ltB1Bw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7301.namprd12.prod.outlook.com (2603:10b6:510:222::12)
 by DM3PR12MB9352.namprd12.prod.outlook.com (2603:10b6:0:4a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 06:22:27 +0000
Received: from PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::a929:e8eb:ef22:6350]) by PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::a929:e8eb:ef22:6350%6]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 06:22:27 +0000
Message-ID: <a31fb1e1-517f-41e7-9a13-5518d66f971d@amd.com>
Date: Tue, 9 Sep 2025 11:52:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] drm/buddy: Optimize free block management with RB
 tree
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
To: Peter Zijlstra <peterz@infradead.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Cc: christian.koenig@amd.com, matthew.auld@intel.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 alexander.deucher@amd.com
References: <20250901185604.2222-1-Arunpravin.PaneerSelvam@amd.com>
 <20250901194151.GJ4067720@noisy.programming.kicks-ass.net>
 <5f999a32-db26-4964-8152-ac06da8beea4@amd.com>
Content-Language: en-US
In-Reply-To: <5f999a32-db26-4964-8152-ac06da8beea4@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4PR01CA0081.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26d::10) To PH8PR12MB7301.namprd12.prod.outlook.com
 (2603:10b6:510:222::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7301:EE_|DM3PR12MB9352:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a459037-a612-49fb-0b04-08ddef693f3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UGxLLzNiZE5Oc3gya0w2WWp5bE51MVpTc3ZEV0puU1Eyb2FQejVrUzUzREd3?=
 =?utf-8?B?Zng1TmZub2dZWHo4YXhCTXc1aGZudTdEVkF2VW1ObHRuaXRERFB2N2xZekFy?=
 =?utf-8?B?emhhSkFkZ3p0VWNXM2JkLzRLT205TzRvdHVHdk9jdWFGQ0sxQTRVKytJOEJo?=
 =?utf-8?B?K3VEeWgybnRvOFovUWRUckVpSmFpenljcUhsMmZ1cWhhNDBqVjhOclhxVU41?=
 =?utf-8?B?QzFVZkNxYnBYYzM2Zkl4eGxzMlZVaVVybkJWSHdZcHJCVTNhZ3J6bGY2RjRC?=
 =?utf-8?B?L2d5WCsvUDNHS2hUMng4OGhIanR2aHZiYzlaYXRxTmxSbDhNVm9lOVlYTFdD?=
 =?utf-8?B?QWx0c3FhaXJpMGJNdjZyNmZ3dTVMYS9yb2txYkxCL2RUSGpLZzhtZnNHbEpO?=
 =?utf-8?B?bjVvVUwzOXB0WjJRVTZEcGg3blVuWnNDMy9xTVRnTVhRTytiMXpwaitEbllC?=
 =?utf-8?B?MktDN3pTWk9tTE11STg5OUdZM3RSb0ZBdFFDd3RwNEUvdy9aUUxSb1pPckRs?=
 =?utf-8?B?RlNjNDBPZ3lkRHozclFMaWZUbk5EQitYWTBqc2c1aWRPMkdPaDVUUGJWRER5?=
 =?utf-8?B?QUk2TDc3UUpqZUZYNEVFbU95a0cwQlV1OGtOanMvYUpOUFBSUk9DNnFXYUND?=
 =?utf-8?B?dDdjTktreFRHdEpkVjhWQ1ZiR2NaMGJ6cEw4UkZjTUlOTHFRSUhoY0YxZ3VX?=
 =?utf-8?B?cDBNL2xpREhyODB3RjBQdUJLT0tKRlhDVXZrclMrYlp0NEY1a3MvcFlZN3Rz?=
 =?utf-8?B?ejJGWDBIRXRBUlRnRERsWTZ1ei9lcnAzYzhqQjJkc3BRN1dwUEpWQzIzME55?=
 =?utf-8?B?bWZRajBpR2QzQ05zNDREbXloZU90Zit2ZGNqQUtKb3djMU5GSmVPZ1E2bk9B?=
 =?utf-8?B?NWhPdEV4VVB4ampuT2laQTJFbEpwWDRtUm5CK1l4aHBVcGNyVHZzbFdJODRQ?=
 =?utf-8?B?bEdJcStYN0o5U1JaUXZRbVZKVEUxRlNSUXZkS1VMK3hqSFlIZCs3SWVvSi93?=
 =?utf-8?B?MXdtZEV4SEo3K3lVRDF2b2NJaS8vWEFYaXpZQ1o5dzJvMm9oTUJVa2FHN01Y?=
 =?utf-8?B?bW1VNFVmMExRV2RKZ09ROWpXQmpMeWR5TG92MjJYTjFXcC8wazJWYTVUM0Jh?=
 =?utf-8?B?T0FrR3M0eWVZVzUvcU9TUERwYkNkYkdldWVack9XaTM1bmQ3SmFySkNxY296?=
 =?utf-8?B?Y2dxZlhRNTJlcnZ2RjFEUTNFNEVMcHl6MWpBNmVWQktla2dvaGlnQ3p5bHZs?=
 =?utf-8?B?L21wb0F6dmo2QWt0dk0wL1p1dGk3aGtaSmpEeU9nMlBhRXMrcS93aHpJN0RV?=
 =?utf-8?B?czUxbE9rRGNjTC9xclIzQlI5d0ZOdmxzdVNYbUxzZW1KQkw2dlhvNk1ETDFN?=
 =?utf-8?B?MS8zMlp3aDNDTlFQekhobkNZbE1hbmo5WFBRazdKZCtnUURGdFllTjVtSkh0?=
 =?utf-8?B?RzlmVkpGWGJ4MHRpd2RjVTJ5ekNIUUhCTXV0YkRxY0RZNHJ2WGc4NkxJTjVl?=
 =?utf-8?B?TWxyRFVjN3VIVk5OUlQ3b1E5c3BXVWU2ZndmWW9uK0RVYzNVbjNCNlFqSlpu?=
 =?utf-8?B?ZTN4VWZ4M2ZpYy9CbCtQZXNKaDZoRTRCWHdzNnhxMEoyTU5ZNS9pbGsrWjBm?=
 =?utf-8?B?dUlTSWZNR2pDaU1zOTVtNDQ3TXpsMC9uZUNPMlJyMkRocG1mSy9udmluUjhz?=
 =?utf-8?B?Z0xaNjNjQjdRRGVod084RlJ5SEN5UjArNmUxa3RyWmNWaW82T1MxSWFDN25U?=
 =?utf-8?B?U0tydWszRFJDcGxoUk04L0pNKzdQemVhLzczc29uQzZOVVMzanZIaHBKYUZG?=
 =?utf-8?B?bXNqZ3VyY1VpSkF6YVU5ZzgvUk9YUy9RcnpvTk8vRitlbUxqRy9nT0ZhOTNp?=
 =?utf-8?B?anRCOWhiYmlpbks2ZmVvKzVZbFNIZGcyTzZlVGJGOVhyM21ZZXpPZitFZU1D?=
 =?utf-8?Q?sssKacIEZgk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7301.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cm1wY3NScXM5VVd4Z1ZyY0tXdCtNUjZyS1dPMjB0S2FUak5qMHlpUkJtVGha?=
 =?utf-8?B?MnQxUmFaUWFMRlpvT0x4TGx4WHRhUzFsYWNTTW5QVUtmNmF5ZEhZN3E1aHZT?=
 =?utf-8?B?QWVxWVY0eml2Ynh2elFPNVorOEtDQkd0Z2lWNlpxWndLQWt4b0YyQTNxNWl2?=
 =?utf-8?B?UU9zZmtIR2drUEpZbXZyQkpxVXBnUnVhVjBMZnVubFNsSkwxdWpNWDBaK3pX?=
 =?utf-8?B?eGlqWlVsbWNkQ2ZSNExDZG5yZDR1cmpUR1UzeWJHUWhQRWRxMi8yQ2s2Q3JV?=
 =?utf-8?B?UndHYVZmTGVORm9zc2xFcjB4KzR5cXBGWnhSU1FXTGlSblZ6Qy9Zd0ZVVmRz?=
 =?utf-8?B?S3pPcHZXaUV6WG9Ic0YxL0xyUWpJeFhMVWFyNnhVdThDYW82K1NyQVVaSDlU?=
 =?utf-8?B?MXdiZ3pMMFRzeXBITzNwV3YrN0k5MkpycVIxL0doVVhSdGV3WWFMV0Jna3FU?=
 =?utf-8?B?aXZDSExxT2gwY0pDSkpZSVRPMFhyb0hFaS9SSnhHOHV2bzE0VkEwbUdKV3V3?=
 =?utf-8?B?RFVpaDRXczYxNmQvbFNUeFhYRzlHNWcra0ZIbEtPbUZQcndWdVF5REJqM3FT?=
 =?utf-8?B?OXl0K1VqQm5jQWxjczY2QXVKK2Z2OGdUdlVyZk1YR3R5Y3h1RVZsMVhMT2N4?=
 =?utf-8?B?UlVVT2pST3NZMVc5REMrbFNOb3hSZFNNT3pORTE0R1lCOXR5amFQc25ONFd1?=
 =?utf-8?B?MC9KMmswcnFpWkRMbXpoaTlSYXZJSVNIWXl1Ty9iYlhHNmVmSzNKMTBzSnoy?=
 =?utf-8?B?cnB4SHNtL2RyaGlhZWtyTllGNjJUSmU2cUlBbTE4Mk9paW92SUtxVVNTWG1w?=
 =?utf-8?B?bkx5V29sK1p2QTBZWCszaVdjNzRmRlNRa2JUNHovK1pGNm5CQkI4RytqQnFN?=
 =?utf-8?B?ZUJoS2hXSFBZdG01OHNlcHJYK1A4WW0zTC9JaStiTjZXK1g4cjVDMDIxY1Az?=
 =?utf-8?B?ZDVJSU1GUHZRelZPR0xqaXBsNDNYRUJ6Nmg0ekFXZmpweWdTeHFZd1dvQi9j?=
 =?utf-8?B?TVg1VDNuZUhFRW5BZitncGJuTWpaVVNnNTgxQkp5L0U3OTh6NDArL01naWFS?=
 =?utf-8?B?L0NKVEpYVFQxaEd3SjVmWWJCb1N5ZTZ4U2RaU210TXdJNHAvcTZqK2V3VGN5?=
 =?utf-8?B?SE02WU1tWk1BL3ZqNnhOZHk0YjEvV0hnZEtlVkJVanNVSndJaWljdExMeHhH?=
 =?utf-8?B?SmZLb1RKTU1OZnlGelUvelR6Ykt0dE05eTVYRkdITnEramR0NDBCajBtUXV4?=
 =?utf-8?B?ZDRLRnJwWnp5VTVLK1RLNVZKdUNDM3piL2ZhVlAreVNxYjdyOExmNHREQnUr?=
 =?utf-8?B?YVNNVWxnL1RuVzkrSVdYOXQvUXZZNjRhQlFzWTU2enF2UUtuSjJwbDcvcXBB?=
 =?utf-8?B?TWhycjFiSVpLeVh4Y2VINVRUYVlEeFpVV3BGQ1BaSnFkOFlQL0VibldtejRn?=
 =?utf-8?B?dDB1c3dqYlhBUDdXUEhyNnpLRGhaUUNrZWVuMFRRc0NvRGlCSHRzRU1sTERK?=
 =?utf-8?B?RUcxQ2p4REhlaU9tVVVsWkc4MldrU0FpUDhjNUFTdlRiWEhTTEZybmRyMXpL?=
 =?utf-8?B?aTR2RDU1TXlab00xbi8zMXY1RGVwSDVQOGhXdGhRV0FCKzRIZ3U0VlFOYnlw?=
 =?utf-8?B?U3lBZ1UyV0Q5eENuOExWTFh1eVZlV2VCeG4vN2kxQk1nbkM2bGo1K2V5UTFB?=
 =?utf-8?B?M1IwT2hTK1VWWDdsVW1Qd2ZMOXFpZmJZbnJmcGpBalB5bGRLZVU0V1NJM01Z?=
 =?utf-8?B?UTlFVzk3OHJWK29qempHVWV3bWx0V25DOVU3Q01QYkF6d3RZRzc2bGF0bUZV?=
 =?utf-8?B?MmpJbnY1WVlIMWh5djNib3pQamhLaUJydituWFVzZ0lSaUVxQnNtajcrenlO?=
 =?utf-8?B?eFF0bHFLVDdSc1FiRllocXYyVHZxY0d6U3BBN2pvZmZhWStpVXovcWg5ZlBN?=
 =?utf-8?B?K0VjMzFuTFI0M1huU0M5Y0U0clVqREZxQUlpZEQxQWdscVBxNWlWdnA0eWhx?=
 =?utf-8?B?d2FDNTFaV25iYk9WK04xZEhaUEY0elpNM0d5UWlCUjdoblh2Wjc1QzFaM0tX?=
 =?utf-8?B?TDFhYWx1VDdsd0pPSGE1OTdMYjBHQllsaUVnM1psMUNPMHJoaHNlb1J4TG5j?=
 =?utf-8?Q?HUF5xkKq8R88SirkAo5s2OGx1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a459037-a612-49fb-0b04-08ddef693f3b
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7301.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 06:22:27.2583 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CkWll/XYKdBnndtwT9IrZi+tm2kmQAUqTUE1PxzxqEnnWUlBwO4Dn696r4wGit8CBZ9v8YaE5ctMMancAZAe4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9352
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

Hi Peter / Jani,

 From the measurements I have done, the difference between RBtree full 
iteration and list full iteration
is negligible, even under heavy fragmentation. Based on this, I think it 
would be reasonable to include
these macros in rbtree.h as a convenience for cases where a full walk is 
required, similar to the helper
macros that already exist in list.h. In situations where the tree is 
small or only modestly populated, the
overhead is insignificant, and the decision of whether to use them can 
be left to the user based on their
workload.

If that still is not acceptable, I can move the macros into drm_buddy.c 
instead. Please let me know your
suggestion.

Thanks,
Arun.
On 9/2/2025 11:39 AM, Arunpravin Paneer Selvam wrote:
>
> On 9/2/2025 1:11 AM, Peter Zijlstra wrote:
>> On Tue, Sep 02, 2025 at 12:26:04AM +0530, Arunpravin Paneer Selvam 
>> wrote:
>>> Replace the freelist (O(n)) used for free block management with a
>>> red-black tree, providing more efficient O(log n) search, insert,
>>> and delete operations. This improves scalability and performance
>>> when managing large numbers of free blocks per order (e.g., hundreds
>>> or thousands).
>> Did you consider the interval tree?
>
> In this allocator, free blocks are tracked individually by order and 
> not as arbitrary ranges. The
>
> operations are keyed insert/delete/lookup, for which an rbtree is 
> sufficient and simper, AFAIK.
>
>>
>>
>>> @@ -41,23 +43,53 @@ static void drm_block_free(struct drm_buddy *mm,
>>>       kmem_cache_free(slab_blocks, block);
>>>   }
>>>   -static void list_insert_sorted(struct drm_buddy *mm,
>>> -                   struct drm_buddy_block *block)
>>> +static void rbtree_insert(struct drm_buddy *mm,
>>> +              struct drm_buddy_block *block)
>>>   {
>>> +    struct rb_root *root = 
>>> &mm->free_tree[drm_buddy_block_order(block)];
>>> +    struct rb_node **link = &root->rb_node;
>>> +    struct rb_node *parent = NULL;
>>>       struct drm_buddy_block *node;
>>> -    struct list_head *head;
>>> +    u64 offset;
>>> +
>>> +    offset = drm_buddy_block_offset(block);
>>>   -    head = &mm->free_list[drm_buddy_block_order(block)];
>>> -    if (list_empty(head)) {
>>> -        list_add(&block->link, head);
>>> -        return;
>>> +    while (*link) {
>>> +        parent = *link;
>>> +        node = rb_entry(parent, struct drm_buddy_block, rb);
>>> +
>>> +        if (offset < drm_buddy_block_offset(node))
>>> +            link = &parent->rb_left;
>>> +        else
>>> +            link = &parent->rb_right;
>>>       }
>>>   -    list_for_each_entry(node, head, link)
>>> -        if (drm_buddy_block_offset(block) < 
>>> drm_buddy_block_offset(node))
>>> -            break;
>>> +    rb_link_node(&block->rb, parent, link);
>>> +    rb_insert_color(&block->rb, root);
>>> +}
>> static inline bool __drm_bb_less(const struct drm_buddy_block *a,
>>                  const struct drm_buddy_block *b)
>> {
>>     return drm_buddy_block_offset(a) < drm_buddy_block_offset(b);
>> }
>>
>> #define __node_2_drm_bb(node) rb_entry((node), struct 
>> drm_buddy_block, rb)
>>
>> static inline bool rb_drm_bb_less(struct rb_node *a, const struct 
>> rb_node *b)
>> {
>>     return __drm_bb_less(__node_2_drm_bb(a), __node_2_drm_bb(b));
>> }
>>
>> static void rbtree_insert(struct drm_buddy *mm, struct 
>> drm_buddy_block *block)
>> {
>>     rb_add(block->rb, &mm->free_tree[drm_buddy_block_order(block)], 
>> rb_drm_bb_less);
>> }
>>
>>> +
>>> +static void rbtree_remove(struct drm_buddy *mm,
>>> +              struct drm_buddy_block *block)
>>> +{
>>> +    struct rb_root *root;
>>> +
>>> +    root = &mm->free_tree[drm_buddy_block_order(block)];
>>> +    rb_erase(&block->rb, root);
>>>   -    __list_add(&block->link, node->link.prev, &node->link);
>>> +    RB_CLEAR_NODE(&block->rb);
>>> +}
>>> +
>>> +static inline struct drm_buddy_block *
>>> +rbtree_last_entry(struct drm_buddy *mm, unsigned int order)
>>> +{
>>> +    struct rb_node *node = rb_last(&mm->free_tree[order]);
>>> +
>>> +    return node ? rb_entry(node, struct drm_buddy_block, rb) : NULL;
>>> +}
>> rb_add_cached() caches the leftmost entry, if you invert the key, the
>> last is first.
>
> With inversion, the in-tree ordering changes from natural ascending 
> offsets to descending,
>
> which can break assumptions in existing buddy allocator code that 
> expects ascending order.
>
>>
>>> diff --git a/include/linux/rbtree.h b/include/linux/rbtree.h
>>> index 8d2ba3749866..17190bb4837c 100644
>>> --- a/include/linux/rbtree.h
>>> +++ b/include/linux/rbtree.h
>>> @@ -79,6 +79,62 @@ static inline void rb_link_node_rcu(struct 
>>> rb_node *node, struct rb_node *parent
>>>          ____ptr ? rb_entry(____ptr, type, member) : NULL; \
>>>       })
>>>   +/**
>>> + * rbtree_for_each_entry - iterate in-order over rb_root of given type
>>> + *
>>> + * @pos:    the 'type *' to use as a loop cursor.
>>> + * @root:    'rb_root *' of the rbtree.
>>> + * @member:    the name of the rb_node field within 'type'.
>>> + */
>>> +#define rbtree_for_each_entry(pos, root, member) \
>>> +    for ((pos) = rb_entry_safe(rb_first(root), typeof(*(pos)), 
>>> member); \
>>> +         (pos); \
>>> +         (pos) = rb_entry_safe(rb_next(&(pos)->member), 
>>> typeof(*(pos)), member))
>>> +
>>> +/**
>>> + * rbtree_reverse_for_each_entry - iterate in reverse in-order over 
>>> rb_root
>>> + * of given type
>>> + *
>>> + * @pos:    the 'type *' to use as a loop cursor.
>>> + * @root:    'rb_root *' of the rbtree.
>>> + * @member:    the name of the rb_node field within 'type'.
>>> + */
>>> +#define rbtree_reverse_for_each_entry(pos, root, member) \
>>> +    for ((pos) = rb_entry_safe(rb_last(root), typeof(*(pos)), 
>>> member); \
>>> +         (pos); \
>>> +         (pos) = rb_entry_safe(rb_prev(&(pos)->member), 
>>> typeof(*(pos)), member))
>>> +
>>> +/**
>>> + * rbtree_for_each_entry_safe - iterate in-order over rb_root safe 
>>> against removal
>>> + *
>>> + * @pos:    the 'type *' to use as a loop cursor
>>> + * @n:        another 'type *' to use as temporary storage
>>> + * @root:    'rb_root *' of the rbtree
>>> + * @member:    the name of the rb_node field within 'type'
>>> + */
>>> +#define rbtree_for_each_entry_safe(pos, n, root, member) \
>>> +    for ((pos) = rb_entry_safe(rb_first(root), typeof(*(pos)), 
>>> member), \
>>> +         (n) = (pos) ? rb_entry_safe(rb_next(&(pos)->member), 
>>> typeof(*(pos)), member) : NULL; \
>>> +         (pos); \
>>> +         (pos) = (n), \
>>> +         (n) = (pos) ? rb_entry_safe(rb_next(&(pos)->member), 
>>> typeof(*(pos)), member) : NULL)
>>> +
>>> +/**
>>> + * rbtree_reverse_for_each_entry_safe - iterate in reverse in-order 
>>> over rb_root
>>> + * safe against removal
>>> + *
>>> + * @pos:    the struct type * to use as a loop cursor.
>>> + * @n:        another struct type * to use as temporary storage.
>>> + * @root:    pointer to struct rb_root to iterate.
>>> + * @member:    name of the rb_node field within the struct.
>>> + */
>>> +#define rbtree_reverse_for_each_entry_safe(pos, n, root, member) \
>>> +    for ((pos) = rb_entry_safe(rb_last(root), typeof(*(pos)), 
>>> member), \
>>> +         (n) = (pos) ? rb_entry_safe(rb_prev(&(pos)->member), 
>>> typeof(*(pos)), member) : NULL; \
>>> +         (pos); \
>>> +         (pos) = (n), \
>>> +         (n) = (pos) ? rb_entry_safe(rb_prev(&(pos)->member), 
>>> typeof(*(pos)), member) : NULL)
>>> +
>> Not really a fan of these. That's typically a sign you're doing it
>> wrong. Full tree iteration is actually slower than linked list.
>
> I understand your concern about full-tree iteration being slower than 
> a list walk. In our current use cases, though,
>
> the cost is not on the hot path and performance is comparable or even 
> better to list traversal. We occasionally need
>
> to walk the full set of blocks to perform specific operations, and 
> these macros make that code simpler and
>
> less error-prone. They aren't meant to replace targeted lookups or 
> bounded walks, just to cover where a full
>
> traversal is necessary.
>
> Thanks,
>
> Arun.
>


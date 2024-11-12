Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 147F49C5D18
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2024 17:25:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2929D10E08B;
	Tue, 12 Nov 2024 16:25:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3VXWAVlV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2056.outbound.protection.outlook.com [40.107.220.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A239410E08B;
 Tue, 12 Nov 2024 16:25:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RJfAv1EzEFxeOjs3+rLKn7ZU04WEk2YT1Xeb2YyfpGdiW+P4oV2OeaEPod8eqyEZv4x5ckk+G9rnczkgt7e4mLigU08JRNT0S5n1DEgTA6vC8JBEiCpvgF0s0OAlS/T4D3WbfjGdgl6gv9uK8s03/Gu7EpikoMtxSIBV2DrM8ZYG6+TY98lD0oTpZKshy2spXWmiPxaYr/vhJaAeOkkFGCy7rmWJnqCMuFMSkI+97gU2vRF+HWVQPLX2q/MfFpip+g1wfmuL0Jqdt01KqTyQK5fLTsc7+x2mvve18CEL/17UlRG6pZNIUk8+7mz79Vn1IgLkrA/zNlGuuGLImT6uOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NEi9xUSVb6QRlJlx3mAItS0QoWPQw9WMn5tkqjik/5Y=;
 b=oOAR+pZjE/mh5JmC2ep5zFiG/hPuuqag8YbtqhdbyopAMdDSOcU9ZR0s2V2yM+z21OHRZi9WhKZjoiyxPcSgMOChycfyhgWzmsYpkzX/g5AqEiDJmv8fCUF1+2eL9mePnXGw26jWRSWYLiJ+XYmHCyiME0Kv0q2uDdLUEfc4gkXp0KQGcriC4/A2jCg5lPKZPuxBLaJo/9zy4lnUDZWalQEjxnVWkhedaTSTxq6f088LVsP5zz2DJKAoFy21U/qhGwtr+hJIQ5F5iojq3sOdW0DmYWJKkjop+l2q1ANBKqy/7mwYcyOTJ2jpqsI7HHF1Qqz+TyytOoLgmlz1NjOqDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NEi9xUSVb6QRlJlx3mAItS0QoWPQw9WMn5tkqjik/5Y=;
 b=3VXWAVlV4V0dtnK/wZZeg6MTHKCIGLpw19+wlTkleKlXdRNPteDe7461zf2qw4GLJYZgUhGt4RgheoitaR/AClgrkbHrvo2bJi4UlE3JbuxG7v9L79s9O/e3p2zRMngz13Asi0qQIQ0D3gxMZnBsFCrxRJTO3beQt7ciiJ3ZfRA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ2PR12MB7823.namprd12.prod.outlook.com (2603:10b6:a03:4c9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.16; Tue, 12 Nov
 2024 16:25:31 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.8137.027; Tue, 12 Nov 2024
 16:25:30 +0000
Message-ID: <c62e5298-1ca6-4cd0-a558-3d2a91175fa0@amd.com>
Date: Tue, 12 Nov 2024 17:25:24 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/8] drm/ttm: Add ttm_bo_access
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Huang Rui <ray.huang@amd.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 matthew.auld@intel.com, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
References: <88ceb558-89d1-4d10-be8a-9ce2f3178fa5@amd.com>
 <ZyugmXt7v+JeKuN9@lstrano-desk.jf.intel.com>
 <85859dc3-cca3-4396-8c75-a726437fb81e@amd.com>
 <173131201749.35893.6727423786823542880@jlahtine-mobl.ger.corp.intel.com>
 <ZzHYB4MBJmVjk-AR@phenom.ffwll.local>
 <a1ffb3f7-77bc-41ff-a98a-5cd889f081fa@amd.com>
 <173133360247.70529.14349388659124962988@jlahtine-mobl.ger.corp.intel.com>
 <8d181425-db3b-46b7-ae73-ae6ef149d185@amd.com>
 <ZzKJHxaMnWKQ5mzV@lstrano-desk.jf.intel.com>
 <31b16d78-708d-4f19-9b33-891e31be5480@gmail.com>
 <173141886970.132411.13400253861916730373@jlahtine-mobl.ger.corp.intel.com>
 <27f8bd540ac1f04daf8a7786f4ae7828017d061b.camel@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <27f8bd540ac1f04daf8a7786f4ae7828017d061b.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0142.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::8) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ2PR12MB7823:EE_
X-MS-Office365-Filtering-Correlation-Id: a2243df7-8a6e-425d-3cbd-08dd0336a00f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZTJDcEtzZC9uZVhUMUwrWURzU29tKzdLRTh1RmwyTi9vOHlIdFhEZm9KdS9Y?=
 =?utf-8?B?RVJqN3lTR0FReXpObVR2eUIyamRLdmdMSnRGU2xuWk5XWTVWeTN1YXNaTVkw?=
 =?utf-8?B?Zy9SbVV3b1BRbXJuWVFvc3k1RVllU0RMbUFqT01VNGxZWTVjY1JXOTFDTzJO?=
 =?utf-8?B?UzNQT3MvN0VwRXR1UFJMaGJJRzlLVkdpRDFZY1ZIc3ZlcXBVRkhFMnAzTjZi?=
 =?utf-8?B?eFpHVWFvdlVkdDIrL2g0bDJSMjFZWlBObFFKeGE2MU9RNUlBeFliYXp3T3Rq?=
 =?utf-8?B?ODdLMFdaREpUQ01vOWN0KzBMaCsxTmVxQVk4UzlvQ1IzQ3BNYTc2S0RITWt4?=
 =?utf-8?B?cjR2SnFoWnd2MXgvVk9DN3lTL3dvWlFnenhTaVVKSFZKKy96N1B5VnRtOURK?=
 =?utf-8?B?R1J3WVpoWnhKVTR5UVBPMGhvUXI5WEFnVUYzdFlIYS9pcnhLWXpVa1puSExU?=
 =?utf-8?B?djN0d3FmWU9rM3ZzM0p6dHNWSnpXcU5yQjBidFdYUDBnMVNya0pScTBCRW9p?=
 =?utf-8?B?bDNKWDlhRzB4aGZmM3dlTldOU3lqa3g2WlB3Q2VEZm9LeXJkaXZmMnVtTnlH?=
 =?utf-8?B?UmhrNEErejEyR1FUSzlIT2xORnZVS0gwcFA5L2hkSWl2aWswamNXZ1Y3aS9H?=
 =?utf-8?B?enZwaHl4Y1oxVGlOZTJmWlhibW5QcFZNdURCYTgwS05xRVd2eE01dUhZYmQ2?=
 =?utf-8?B?aUxUblBTMzN4TGxTVmRxYXRqWlZrOW8vT0NzZnZWRHRpNW55czI4ZllXVFFL?=
 =?utf-8?B?TlV6MDZma1BwN0w1Nld0bmhmTkV4dFFQdllEN2tabUF3SWlhelZ2emdpN1Nt?=
 =?utf-8?B?dkdianR2cEsvb3BCQU1XOHpKSkNORll3MlFJUEYxVTk2azNOUVV3V1c2UVFp?=
 =?utf-8?B?NnowTFhndTdWZGJtLzBoWUI2ZjdybWlCemlKcVg2V0IySytBRUJ2MVdKZ244?=
 =?utf-8?B?SEJ0M3h6b2tiOEJ4RXRTemFKdjFkTU5CcGRHZnMvNVBheE9rdjMyaGcrSzFE?=
 =?utf-8?B?WGErdHlLRytYSUFKaGI4QlhZVlVnSVBKNkUyWlV2Q1REcTdCV2tvd1U1U1Js?=
 =?utf-8?B?SlIvcEp5RVo2djhIbVVTRGNPRUpKOXNNYnh1TWtMZkNydkIrUmxLdHdyR0hj?=
 =?utf-8?B?ak16emVpdGIzQWxKbW4vSStSYm5hY21uMk1NSkJRdFJiblBTR1JCN3MxRW96?=
 =?utf-8?B?b2lYazF0NWkvTTF6N3FZV0FOK2pOSVRTUTFyUXJJQmhnOVU5dHNtNExzdDhB?=
 =?utf-8?B?U3lHVHB0YjhjNldJZFl2emlwTjMrRDQ4WFZ3ci9HM3RWdDJIOFNzRmsvdU5y?=
 =?utf-8?B?cmg2a29NWnkxeVZBa1RZZlpPT29QTWszYVIrK294N0ZOOEdCMSt5ZTkzNDFm?=
 =?utf-8?B?NkU0QTlMQVY2UnY1a25NOVNBQjE1SzFyV3BSdzA2eHVWbGtnVHdQemQvWEll?=
 =?utf-8?B?STJGNW41Z1hlekNqWkdleUZaazhYNE85OEsyNDdPdzU4elNKUHVldXhKQVM3?=
 =?utf-8?B?amZlL2JjSnRobEM2N0JVajN5TUM3eUw2MktYaC82bkVkNWdaOHUxdFdNblEw?=
 =?utf-8?B?UzNvdUl4Y3EyVFhYblFIR3dLLzRnaWJ5Z1k1bVd6K0tmRDIzbVBVSENQbEpB?=
 =?utf-8?B?ODkza1cxQ3U0Vy9pY0JzZFozM1lFbXFBbDBkNlVNZWcwT1ZjRHVrS0pXek5K?=
 =?utf-8?B?Y2RRSXBlRmNDSDdLVHdlMVhGb3ZOeTlFcmNtL2g5c0pxQ3RDMkVJMTBBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YXZmaW5HQmFhOFc3a0R2THhnS2hFMEhGRklYcmtXSEtFYTl1M3BhbEphUWdr?=
 =?utf-8?B?TjYzSlNSQW1RSnQ1enBPMDBNb2h2dWljL0tYTHg0ekhuN0thYTdzcEswY05Z?=
 =?utf-8?B?MG1Yc0RONE1pRmZEVEY5RWtzcDNiZjJabmFtaG1KYU8zbFN6Q2V1TnBiLzJ5?=
 =?utf-8?B?UE8vN1hUZ0FWci8zZTFhOWdrUGNUYTROOG5GbnBXVzQycWRmQWpyUjRWa3Ba?=
 =?utf-8?B?eVZtVjFiL1VIaWZUdWQ2OFJtYUcvMlQzQ3FLR21xQlgyZFMrWXpnb0dKdk1q?=
 =?utf-8?B?UFJSRVJoeUpSUld0TklFQkdxTnBXZExUVFFsQ00vL1NjRjlQd0R0eVIzUU15?=
 =?utf-8?B?MktXcUhJWUZnRUpibmwrRE4ySGVIYW5UbFFOUUF6ZmtvQ1VZTFVhRDBQY2V3?=
 =?utf-8?B?MTlsZVAxcDk3VEw1WXpaeWUxbHEwaWZrTmhJb3ZzbEJpRldZM3ptVnYzS2Y4?=
 =?utf-8?B?ZFVNTldmOU5XSnRYZFBFWVFOdUhjZllqVitGSUFRdGhGUDBCbXJjaEZIT2ZX?=
 =?utf-8?B?eU1WYlo3STlGQURuaGg5c3MzOEVxWVpWbWxwNnFFVk1uOTAvMS96cDRhcjhU?=
 =?utf-8?B?QWVZSDAxSjJObGtHUUNlQVdSZzU0Z0tNYkRFVm9FMGJWTlc1d094NnlaSTR4?=
 =?utf-8?B?VFpyaXgzVURLMklBdGpBSDhWZGloenBQZXpLZy9VeUFRaDZrZ0hsVHNDN0Vx?=
 =?utf-8?B?MXRoejJTSmF3S3ljcExiMFliRzdhMWdOemNRdGtzbU5JUmd1VWdGenpxZ2pr?=
 =?utf-8?B?RGljOVlCdHNaWUlHWmEvdEZ0a3lObnN3RjJmUGlBN21kenk5bkFINVpxRjFp?=
 =?utf-8?B?N0lTZDQ2djVsK0I4RHFnaC9xMmhEMWI0NTV1QnVFclp3cThuUmk1M0hFWW91?=
 =?utf-8?B?ejgwL3Q3NGhqZ0tzUWF0UmhnTHZNeWowM1pWSldEaEtOVDNrbWtJOGppZjRE?=
 =?utf-8?B?d29LcDJoRkUzMmVIZ2FtcU9zalNSNUVJVXhhelpCdUF2U0xjSEdWZWF4SDUw?=
 =?utf-8?B?MTF4dC9TRVV5MVBFZ1VKdFhVSFZLQmJhV1BoM1NzVHJiUVhNaGFOWWo0WWdn?=
 =?utf-8?B?QVQzUVhKZGU0M0tkczdUeDZMQ0FWWHJxVEU3a0JwVWUydzVGZGRqaG1RVGRj?=
 =?utf-8?B?VWtRc1A5dVVXU21QSngzOUdlRmJTcEVYVU1MMnBralBybUpKbVVGUEJUbHR2?=
 =?utf-8?B?RGFma1htMExqYUJONXh5M3Fzb2gyK3JXbEdOSFpQc296aFRrNG1mZU5tQ1hx?=
 =?utf-8?B?N3RoaElndlpRbVdhYUVuY3J6SHhRa0xMbHZpUEhVbXRlVGI0VE50VjFTeDN1?=
 =?utf-8?B?b2t6N0huNFNSaEtJRHFCMFBPcXl3aWZBMGJaVWdUM2F0OGNyb2VFV3Y1STNo?=
 =?utf-8?B?eEZSK0wvckJzU29sYm9qN3ZPa1F3UkZiL2FCTjRpem5NbUtwQ09ZRkdHcHpZ?=
 =?utf-8?B?ZnVjK2pZbnBzRzJlZnFXU3dDUDZ4TE9zK21DTFUzR0tONjRTVHpqcWc0aWht?=
 =?utf-8?B?NDcwMVhoT2dic1FlcTBVOEtiUWduV21rT2tyYitPaXhXZkkyRFFIK0FYVjNy?=
 =?utf-8?B?b05nZlFseHlBbmJOU3N6dllpMHIzSDJ6bjB6NTY5bk43M24vcXFuZ0FjNjBa?=
 =?utf-8?B?RnhYY0dCclhGMUtqUEhQSkxBZWlEUWhpaVhlT0hQenc5b2RYTXpRYm12cFFU?=
 =?utf-8?B?U2pBZE9QVGRoMTNlRzM4ME9heEVVSXBCR1J6aFFDNlhqYUJ2SXhMWk12UkhL?=
 =?utf-8?B?L3ovenpudUFZRWw1eWxVVndjdUVrb2NwOVJSYUtlZVBJTGJwblNCd3MybzBD?=
 =?utf-8?B?d3psck1YWmExUm1vYi90SHo5ZzhibmRRbG5sTHFhOURxaWRTK0FsWkhrY21s?=
 =?utf-8?B?YUFOUW16MnpaSmZ4V2VTNERSTGt3RGc5REdoR2p5THcvcllxUi9yS2o4Tjdo?=
 =?utf-8?B?QU53QVM4K1ovQ0VMeXo2akpSYjQ4MmxyOHMyTWxQeHpsa0lqODk2aENaVDJ0?=
 =?utf-8?B?dWZwK0g0ODRYaWpxZ3g4aWpCVmFKV0lKNEZETGF5WTAzZHFIQ3RVYWcwQ1p1?=
 =?utf-8?B?eTJ1QnZZeFgwMWV4R3lpUUxUaWhOM3Vudy85ZlkwbWVqUy9KWkNZdFZCUWRM?=
 =?utf-8?Q?swIob09f4u8DDMb6/IYbunmCQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2243df7-8a6e-425d-3cbd-08dd0336a00f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 16:25:30.7977 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ANuWBByLZSnpLqMOyBW8ZM/TSwShazVP/kZpC3CbmYj5kC4hgyPI2jK4NOlDaoGi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7823
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

Am 12.11.24 um 17:22 schrieb Thomas Hellström:
> On Tue, 2024-11-12 at 15:41 +0200, Joonas Lahtinen wrote:
>> (+ Thomas)
>>
>> Quoting Christian König (2024-11-12 11:23:36)
>>> Am 11.11.24 um 23:45 schrieb Matthew Brost:
>>>
>>>      [SNIP]
>>>
>>>              So I think only way to allow interactive debugging is
>>> to avoid the
>>>              dma_fences. Curious to hear if there are ideas for
>>> otherwise.
>>>
>>>          You need to guarantee somehow that the process is taken
>>> from the hardware so
>>>          that the preemption fence can signal.
>>>
>>>
>>>      Our preemption fences have this functionality.
>>>
>>>      A preemption fence issues a suspend execution command to the
>>> firmware. The
>>>      firmware, in turn, attempts to preempt the workload. If it
>>> doesn't respond
>>>      within a specified period, it resets the hardware queue, sends
>>> a message to KMD,
>>>      bans the software queue, and signals the preemption fence.
>>>
>>>      We provide even more protection than that. If, for some reason,
>>> the firmware
>>>      doesn't respond within a longer timeout period, the KMD
>>> performs a device reset,
>>>      ban the offending software queue(s), and will signal the
>>> preemption fences.
>>>
>>>      This flow remains the same whether a debugger is attached or,
>>> for example, a
>>>      user submits a 10-minute non-preemptable workload. In either
>>> case, other
>>>      processes are guaranteed to make forward progress.
>>>
>>>
>>> Yeah that is pretty much the same argumentation I have heard before
>>> and it
>>> turned out to not be working.
>>>
>>>
>>>      The example above illustrates the memory oversubscription case,
>>> where two
>>>      processes are using 51% of the memory.
>>>
>>>
>>> That isn't even necessary. We have seen applications dying just
>>> because the
>>> core memory management tried to join back small pages into huge
>>> pages in an
>>> userptr.
>>>
>>> That the core memory management jumps in and requests that the pre-
>>> emption
>>> fence signals can happen all the time.
>> Ouch. Does there happen to be a known reproducer for this behavior or
>> maybe
>> bug report?
>>
>>> You can mitigate that a bit, Fedora for example disables joining
>>> back small
>>> pages into huge pages by default for example and we even had people
>>> suggesting
>>> to use mprotect() so that userptrs VMAs don't fork() any more
>>> (which is of
>>> course completely illegal).
>>>
>>> But my long term take away is that you can't block all causes of
>>> sudden
>>> requests to let a pre-emption fence signal.
>> I think this problem equally applies to the LR-workloads like the EU
>> debugging ones.
>>
>>>      Another preemption scenario involves two processes sharing
>>> hardware resources.
>>>      Our firmware follows the same flow here. If an LR workload is
>>> using a hardware
>>>      resource and a DMA-fence workload is waiting, and if the LR
>>> workload doesn't
>>>      preempt the in a timely manner, the firmware issues a hardware
>>> reset, notifies
>>>      KMD, and bans the LR software queue. The DMA-fence workload
>>> then can make
>>>      forward progress
>>>
>>>      With the above in mind, this is why I say that if a user tries
>>> to run a game and
>>>      a non-preemptable LR workload, either oversubscribing memory or
>>> sharing hardware
>>>      resources, it is unlikely to work well. However, I don't think
>>> this is a common
>>>      use case. I would expect that when a debugger is open, it is
>>> typically by a
>>>      power user who knows how to disable other GPU tasks (e.g., by
>>> enabling software
>>>      rendering or using a machine without any display).
>>>
>>>      Given this, please to reconsider your position.
>>>
>>>
>>> The key point here is that this isn't stable, you can do that as a
>>> tech demo
>>> but it can always be that debugging an application just randomly
>>> dies. And
>>> believe me AMD has tried this to a rather extreme extend as well.
>> It's not really only limited to the debuggable applications at all,
>> the
>> normal LR workloads are equally impacted as far as I understand. Just
>> harder to catch the issue with LR-workloads if the pre-emption fence
>> signaling is sporadic.
>>
>>> What you could potentially work is to taint the kernel and make
>>> sure that this
>>> function is only available to user who absolutely know what they
>>> are doing.
>>>
>>> But I would say we can only allow that if all other options have
>>> been exercised
>>> and doing it like this is really the only option left.
>> It sounds like servicing the memory pre-empt fence by stealing the
>> pages from underneath the workload would be the way to resolve this
>> issue.
>>
>> This has been extensively discussed already, but was expected to
>> really
>> only be needed for low-on-memory scenarios. However it now seems like
>> the need is much earlier due to the random userptr page joining by
>> core
>> mm.
> Just to clarify here:
>   
> In Long-Running mode with recoverable pagefaults enabled we don't have
> any preempt-fences, but rather just zap the PTEs pointing to the
> affected memory and flush TLB. So from a memory resource POW a
> breakpoint should be safe, and no mmu notifier nor shrinker will be
> blocked.

That sounds like a HMM based approach which would clearly work.

But where is that? I don't see any HMM based approach anywhere in the XE 
driver.

Regards,
Christian.

>
> Nor will there be any jobs with published dma-fences depending on the
> job blocked either temporarily by a pagefault or long-term by a
> debugger breakpoint.
>
> /Thomas
>
>
>> If that is done and the memory pre-empt fence is serviced even for
>> debuggable contexts, do you have further concerns with the presented
>> approach
>> from dma-buf and drm/sched perspective?
>>
>> Regards, Joonas
>>
>>> Regards,
>>> Christian.
>>>
>>>
>>>          This means that a breakpoint or core dump doesn't halt GPU
>>> threads, but
>>>          rather suspends them. E.g. all running wave data is
>>> collected into a state
>>>          bag which can be restored later on.
>>>
>>>          I was under the impression that those long running compute
>>> threads do
>>>          exactly that, but when the hardware can't switch out the
>>> GPU thread/process
>>>          while in a break then that isn't the case.
>>>
>>>          As long as you don't find a way to avoid that this patch
>>> set is a pretty
>>>          clear NAK from my side as DMA-buf and TTM maintainer.
>>>
>>>
>>>      I believe this is addressed above.
>>>
>>>      Matt
>>>
>>>
>>>          What might work is to keep the submission on the hardware
>>> in the break state
>>>          but forbid any memory access. This way you can signal your
>>> preemption fence
>>>          even when the hardware isn't made available.
>>>
>>>          Before you continue XE setups a new pre-emption fence and
>>> makes sure that
>>>          all page tables etc... are up to date.
>>>
>>>          Could be tricky to get this right if completion fence based
>>> submissions are
>>>          mixed in as well, but that gives you at least a direction
>>> you could
>>>          potentially go.
>>>
>>>          Regards,
>>>          Christian.
>>>
>>>
>>>              Regards, Joonas
>>>
>>>
>>>                  Regards,
>>>                  Christian.
>>>
>>>
>>>                      Some wash-up thoughts from me below, but
>>> consider them fairly irrelevant
>>>                      since I think the main driver for these big
>>> questions here should be
>>>                      gdb/userspace.
>>>
>>>
>>>                          Quoting Christian König (2024-11-07
>>> 11:44:33)
>>>
>>>                              Am 06.11.24 um 18:00 schrieb Matthew
>>> Brost:
>>>
>>>                                    [SNIP]
>>>
>>>                                    This is not a generic interface
>>> that anyone can freely access. The same
>>>                                    permissions used by ptrace are
>>> checked when opening such an interface.
>>>                                    See [1] [2].
>>>
>>>                                   
>>> [1]https://patchwork.freedesktop.org/patch/617470/?series=136572&re
>>> v=2
>>>                                   
>>> [2]https://patchwork.freedesktop.org/patch/617471/?series=136572&re
>>> v=2
>>>
>>>
>>>                              Thanks a lot for those pointers, that
>>> is exactly what I was looking for.
>>>
>>>                              And yeah, it is what I feared. You are
>>> re-implementing existing functionality,
>>>                              but see below.
>>>
>>>                          Could you elaborate on what this "existing
>>> functionality" exactly is?
>>>                          I do not think this functionality exists at
>>> this time.
>>>
>>>                          The EU debugging architecture for Xe
>>> specifically avoids the need for GDB
>>>                          to attach with ptrace to the CPU process or
>>> interfere with the CPU process for
>>>                          the debugging via parasitic threads or so.
>>>
>>>                          Debugger connection is opened to the DRM
>>> driver for given PID (which uses the
>>>                          ptrace may access check for now) after
>>> which the all DRM client of that
>>>                          PID are exposed to the debugger process.
>>>
>>>                          What we want to expose via that debugger
>>> connection is the ability for GDB to
>>>                          read/write the different GPU VM address
>>> spaces (ppGTT for Intel GPUs) just like
>>>                          the EU threads would see them. Note that
>>> the layout of the ppGTT is
>>>                          completely up to the userspace driver to
>>> setup and is mostly only partially
>>>                          equal to the CPU address space.
>>>
>>>                          Specifically as part of reading/writing the
>>> ppGTT for debugging purposes,
>>>                          there are deep flushes needed: for example
>>> flushing instruction cache
>>>                          when adding/removing breakpoints.
>>>
>>>                          Maybe that will explain the background. I
>>> elaborate on this at the end some more.
>>>
>>>
>>>                                            kmap/vmap are used
>>> everywhere in the DRM subsystem to access BOs, so I’m
>>>                                            failing to see the
>>> problem with adding a simple helper based on existing
>>>                                            code.
>>>
>>>                                        What#s possible and often
>>> done is to do kmap/vmap if you need to implement a
>>>                                        CPU copy for scanout for
>>> example or for copying/validating command buffers.
>>>                                        But that usually requires
>>> accessing the whole BO and has separate security
>>>                                        checks.
>>>
>>>                                        When you want to access only
>>> a few bytes of a BO that sounds massively like
>>>                                        a peek/poke like interface
>>> and we have already rejected that more than once.
>>>                                        There even used to be
>>> standardized GEM IOCTLs for that which have been
>>>                                        removed by now.
>>>
>>>                          Referring to the explanation at top: These
>>> IOCTL are not for the debugging target
>>>                          process to issue. The peek/poke interface
>>> is specifically for GDB only
>>>                          to facilitate the emulation of memory
>>> reads/writes on the GPU address
>>>                          space as they were done by EUs themselves.
>>> And to recap: for modifying
>>>                          instructions for example (add/remove
>>> breakpoint), extra level of cache flushing is
>>>                          needed which is not available to regular
>>> userspace.
>>>
>>>                          I specifically discussed with Sima on the
>>> difference before moving forward with this
>>>                          design originally. If something has changed
>>> since then, I'm of course happy to rediscuss.
>>>
>>>                          However, if this code can't be added, not
>>> sure how we would ever be able
>>>                          to implement core dumps for GPU
>>> threads/memory?
>>>
>>>
>>>                                        If you need to access BOs
>>> which are placed in not CPU accessible memory then
>>>                                        implement the access callback
>>> for ptrace, see amdgpu_ttm_access_memory for
>>>                                        an example how to do this.
>>>
>>>                          As also mentioned above, we don't work via
>>> ptrace at all when it comes
>>>                          to debugging the EUs. The only thing used
>>> for now is the ptrace_may_access to
>>>                          implement similar access restrictions as
>>> ptrace has. This can be changed
>>>                          to something else if needed.
>>>
>>>
>>>                                    Ptrace access via
>>> vm_operations_struct.access → ttm_bo_vm_access.
>>>
>>>                                    This series renames
>>> ttm_bo_vm_access to ttm_bo_access, with no code changes.
>>>
>>>                                    The above function accesses a BO
>>> via kmap if it is in SYSTEM / TT,
>>>                                    which is existing code.
>>>
>>>                                    This function is only exposed to
>>> user space via ptrace permissions.
>>>
>>>                          Maybe this sentence is what caused the
>>> confusion.
>>>
>>>                          Userspace is never exposed with peek/poke
>>> interface, only the debugger
>>>                          connection which is its own FD.
>>>
>>>
>>>                                    In this series, we implement a
>>> function [3] similar to
>>>                                    amdgpu_ttm_access_memory for the
>>> TTM vfunc access_memory. What is
>>>                                    missing is non-visible CPU memory
>>> access, similar to
>>>                                    amdgpu_ttm_access_memory_sdma.
>>> This will be addressed in a follow-up and
>>>                                    was omitted in this series given
>>> its complexity.
>>>
>>>                                    So, this looks more or less
>>> identical to AMD's ptrace implementation,
>>>                                    but in GPU address space. Again,
>>> I fail to see what the problem is here.
>>>                                    What am I missing?
>>>
>>>
>>>                              The main question is why can't you use
>>> the existing interfaces directly?
>>>
>>>                          We're not working on the CPU address space
>>> or BOs. We're working
>>>                          strictly on the GPU address space as would
>>> be seen by an EU thread if it
>>>                          accessed address X.
>>>
>>>
>>>                              Additional to the peek/poke interface
>>> of ptrace Linux has the pidfd_getfd
>>>                              system call, see
>>> herehttps://man7.org/linux/man-pages/man2/pidfd_getfd.2.html.
>>>
>>>                              The pidfd_getfd() allows to dup() the
>>> render node file descriptor into your gdb
>>>                              process. That in turn gives you all the
>>> access you need from gdb, including
>>>                              mapping BOs and command submission on
>>> behalf of the application.
>>>
>>>                          We're not operating on the CPU address
>>> space nor are we operating on BOs
>>>                          (there is no concept of BO in the EU debug
>>> interface). Each VMA in the VM
>>>                          could come from anywhere, only the start
>>> address and size matter. And
>>>                          neither do we need to interfere with the
>>> command submission of the
>>>                          process under debug.
>>>
>>>
>>>                              As far as I can see that allows for the
>>> same functionality as the eudebug
>>>                              interface, just without any driver
>>> specific code messing with ptrace
>>>                              permissions and peek/poke interfaces.
>>>
>>>                              So the question is still why do you
>>> need the whole eudebug interface in the
>>>                              first place? I might be missing
>>> something, but that seems to be superfluous
>>>                              from a high level view.
>>>
>>>                          Recapping from above. It is to allow the
>>> debugging of EU threads per DRM
>>>                          client, completely independent of the CPU
>>> process. If ptrace_may_acces
>>>                          is the sore point, we could consider other
>>> permission checks, too. There
>>>                          is no other connection to ptrace in this
>>> architecture as single
>>>                          permission check to know if PID is fair
>>> game to access by debugger
>>>                          process.
>>>
>>>                          Why no parasitic thread or ptrace: Going
>>> forward, binding the EU debugging to
>>>                          the DRM client would also pave way for
>>> being able to extend core kernel generated
>>>                          core dump with each DRM client's EU
>>> thread/memory dump. We have similar
>>>                          feature called "Offline core dump" enabled
>>> in the downstream public
>>>                          trees for i915, where we currently attach
>>> the EU thread dump to i915 error state
>>>                          and then later combine i915 error state
>>> with CPU core dump file with a
>>>                          tool.
>>>
>>>                          This is relatively little amount of extra
>>> code, as this baseline series
>>>                          already introduces GDB the ability to
>>> perform the necessary actions.
>>>                          It's just the matter of kernel driver
>>> calling: "stop all threads", then
>>>                          copying the memory map and memory contents
>>> for GPU threads, just like is
>>>                          done for CPU threads.
>>>
>>>                          With parasitic thread injection, not sure
>>> if there is such way forward,
>>>                          as it would seem to require to inject quite
>>> abit more logic to core kernel?
>>>
>>>
>>>                              It's true that the AMD KFD part has
>>> still similar functionality, but that is
>>>                              because of the broken KFD design of
>>> tying driver state to the CPU process
>>>                              (which makes it inaccessible for gdb
>>> even with imported render node fd).
>>>
>>>                              Both Sima and I (and partially Dave as
>>> well) have pushed back on the KFD
>>>                              approach. And the long term plan is to
>>> get rid of such device driver specific
>>>                              interface which re-implement existing
>>> functionality just differently.
>>>
>>>                          Recapping, this series is not adding it
>>> back. The debugger connection
>>>                          is a separate FD from the DRM one, with
>>> separate IOCTL set. We don't allow
>>>                          the DRM FD any new operations based on
>>> ptrace is attached or not. We
>>>                          don't ever do that check even.
>>>
>>>                          We only restrict the opening of the
>>> debugger connection to given PID with
>>>                          ptrace_may_access check for now. That can
>>> be changed to something else,
>>>                          if necessary.
>>>
>>>                      Yeah I think unnecessarily tying gpu processes
>>> to cpu processes is a bad
>>>                      thing, least because even today all the svm
>>> discussions we have still hit
>>>                      clear use-cases, where a 1:1 match is not
>>> wanted (like multiple gpu svm
>>>                      sections with offsets). Not even speaking of
>>> all the gpu usecases where
>>>                      the gpu vm space is still entirely independent
>>> of the cpu side.
>>>
>>>                      So that's why I think this entirely separate
>>> approach looks like the right
>>>                      one, with ptrace_may_access as the access
>>> control check to make sure we
>>>                      match ptrace on the cpu side.
>>>
>>>                      But there's very obviously a bikeshed to be had
>>> on what the actual uapi
>>>                      should look like, especially how gdb opens up a
>>> gpu debug access fd. But I
>>>                      also think that's not much on drm to decide,
>>> but whatever gdb wants. And
>>>                      then we aim for some consistency on that
>>> lookup/access control part
>>>                      (ideally, I might be missing some reasons why
>>> this is a bad idea) across
>>>                      drm drivers.
>>>
>>>
>>>                              So you need to have a really really
>>> good explanation why the eudebug interface
>>>                              is actually necessary.
>>>
>>>                          TL;DR The main point is to decouple the
>>> debugging of the EU workloads from the
>>>                          debugging of the CPU process. This avoids
>>> the interference with the CPU process with
>>>                          parasitic thread injection. Further this
>>> also allows generating a core dump
>>>                          without any GDB connected. There are also
>>> many other smaller pros/cons
>>>                          which can be discussed but for the context
>>> of this patch, this is the
>>>                          main one.
>>>
>>>                          So unlike parasitic thread injection, we
>>> don't unlock any special IOCTL for
>>>                          the process under debug to be performed by
>>> the parasitic thread, but we
>>>                          allow the minimal set of operations to be
>>> performed by GDB as if those were
>>>                          done on the EUs themselves.
>>>
>>>                          One can think of it like the minimal subset
>>> of ptrace but for EU threads,
>>>                          not the CPU threads. And thus, building on
>>> this it's possible to extend
>>>                          the core kernel generated core dumps with
>>> DRM specific extension which
>>>                          would contain the EU thread/memory dump.
>>>
>>>                      It might be good to document (in that debugging
>>> doc patch probably) why
>>>                      thread injection is not a great option, and why
>>> the tradeoffs for
>>>                      debugging are different than for for
>>> checkpoint/restore, where with CRIU
>>>                      we landed on doing most of this in userspace,
>>> and often requiring
>>>                      injection threads to make it all work.
>>>
>>>                      Cheers, Sima
>>>
>>>
>>>                          Regards, Joonas
>>>
>>>
>>>                              Regards,
>>>                              Christian.
>>>
>>>
>>>
>>>                                    Matt
>>>
>>>                                   
>>> [3]https://patchwork.freedesktop.org/patch/622520/?series=140200&re
>>> v=6
>>>
>>>
>>>                                        Regards,
>>>                                        Christian.
>>>
>>>
>>>                                            Matt
>>>
>>>
>>>                                                Regards,
>>>                                                Christian.
>>>
>>>
>>>


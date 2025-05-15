Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 015C3AB8A66
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 17:16:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42A7E10E8F2;
	Thu, 15 May 2025 15:16:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="NEuviYea";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D000010E8F2
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 15:16:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lkxgBSYP6rI0hD4EExa6RxByxdedtzyPJfWHOai6sFiuZO2JymNcBpgPb3mNLs7UlEKrruzJ9b59bgVtbyzkq4cHL/h+Jvfyoc1+uBRDDeVaGLO0Xt9FxgwwMpQHDqlfTTnzIK5lArW1Gwv0FhmFgX44+nSzu5yZV3/IODjlA10OiX/SXK4KqfM79GQFF2qJb08bFPhh88vEB+Z02CNF7ZD3oMLkvsqTCkqk4CoF3kOOOJQijehRcly5Lw/IvJQ3j5f0LXLzWjmq+fH4XSAtSA9OlRTv330EqImOC/Cx3uzxj1N4HEBDwJ4PnAGPdMdMG2sKtFzYyNlt2Z5RPrQ7IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3v11kWqi3i8Qr10e11xOCDXMISrcnGx0y7C2sBKX8jY=;
 b=WA+LWVfdmi1vd0SZ8cm6wHEs85vxHNZTNpC1g79D1turRWpCRbwv/WsfX+QF/i7EmoDEpe2urlVvywiMlFR7xP3g9khXu6AgIeACrQDXlRIM/kpNnIvxiXbpq1a9ARFallblMHZGuUqI8wSH9RcYU+pxm3+ozxRn/TcU/BDRj0oNOrefI3ncb2O6ugdjqaSiKveusuqZFMc8NFF+oS8BR+Ay9Kb5PuvZnN5e/qtjeLt60Jd8dAmlztx1W52Wb2GzwGbunVg2tjKzQqwNo0w/1dyOezOg36wxWQ7DQrRxEWwu5RlHkahOrXSvj23i3ArnOeVT/KbCL6MjuK8/dGeSzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3v11kWqi3i8Qr10e11xOCDXMISrcnGx0y7C2sBKX8jY=;
 b=NEuviYeaWa5p/6W3b2zrOdt0xIL4t33n8oZlnJs55PiMhn3grVL2CmUDRfxyoWcO7LNsiGjzQC84QSP8FAb0P2ftTq9Qax8DSqHBzBfcmbm+q6xQxnZbgx1uQoBcHC8EjDAgPlAy4G7v/9cV+EdKz6K4fuhLphJlTZDckZBN16Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH0PR12MB5646.namprd12.prod.outlook.com (2603:10b6:510:143::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Thu, 15 May
 2025 15:16:51 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 15:16:51 +0000
Message-ID: <b5aabc46-6b83-4525-841e-64d1e7398f4c@amd.com>
Date: Thu, 15 May 2025 17:16:47 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [rfc] drm/ttm/memcg: simplest initial memcg/ttm integration (v2)
To: Waiman Long <llong@redhat.com>, Dave Airlie <airlied@gmail.com>,
 Johannes Weiner <hannes@cmpxchg.org>
Cc: dri-devel@lists.freedesktop.org, tj@kernel.org,
 Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>,
 cgroups@vger.kernel.org, simona@ffwll.ch
References: <20250502034046.1625896-1-airlied@gmail.com>
 <20250507175238.GB276050@cmpxchg.org>
 <CAPM=9tw0hn=doXVdH_hxQMvUhyAQvWOp+HT24RVGA7Hi=nhwRA@mail.gmail.com>
 <20250513075446.GA623911@cmpxchg.org>
 <CAPM=9txLcFNt-5hfHtmW5C=zhaC4pGukQJ=aOi1zq_bTCHq4zg@mail.gmail.com>
 <b0953201-8d04-49f3-a116-8ae1936c581c@amd.com>
 <4ec2dd5a-3cdb-48cf-a459-4d384a48c671@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <4ec2dd5a-3cdb-48cf-a459-4d384a48c671@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0306.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f6::17) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH0PR12MB5646:EE_
X-MS-Office365-Filtering-Correlation-Id: 7432733f-3bab-4c43-bd93-08dd93c384e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a21OUzlYN1lUZ2k3QnZKd3N4Uk9SbEhuSFNXMGxoYVphbmhjMUJITVNQd3hP?=
 =?utf-8?B?bjNCUGtQNy9oeVY0YTB2YzZrOVYwem5HYWM4NGZ3QzdWZkJ4Y0xST3ZONTJx?=
 =?utf-8?B?K2xqNmk3NlhIOGdvU0VKTmQzSGRNOEtCM202eWxQR3VDWm04emxoM3p0M09K?=
 =?utf-8?B?NFNzUHdhenNSb29BZkJPSVYzRW9HYmZjWW1rbFNOUVVpZ3A0OTRJeXJDQmlz?=
 =?utf-8?B?N01ZNCtKM0w3K1ZCRkUyUUVrZm5iMm1JNUFCVGJaL3dnc09qbnFmRFVNRnVt?=
 =?utf-8?B?K3l4Mkh3bFpVSUZHaFU2Y3BTVHBEYW5RVjU3S2ZSb0ZnMEZyOEE2VnhjT2kw?=
 =?utf-8?B?SEw2b2ltQlpIK1F6TisraFBEcXEvejhaUTE0a2k1MXRiSE5sd1VCS2FSUU5p?=
 =?utf-8?B?SWNRc0hkUlhQa3p6dFNSTDkrUzFVd3BsckhBc2U0M05rdUhJSG9iQ0VqQ1Fr?=
 =?utf-8?B?ZVVNd0tKd1A4eTlXdXVkSkV2b1pjdHpFOGE4czVIeEN6cjZBRW9QVTRnc0x5?=
 =?utf-8?B?WEdnYWZlVTQwUERhSjU1NG9FYzUvT01jc1JGS2RMOHJVQ0MyVzk1SkFzR01R?=
 =?utf-8?B?amxMZ2V4YjN5cmpsUzZZZ2ZxbTAyeDF5VW14Vi8zeEpGbTRrR3R2eEpBdXp3?=
 =?utf-8?B?TDRML2t6cVlkblF5TUdFU0UvTUNpTTE4eUp5cmhGdVozdGpIeG1oalV1NUtv?=
 =?utf-8?B?RHFua1p4Uk1tRkdvaUFNZS9XTHJWZzVvR3BXVFE5MWZHbXV3amlLRUc0dnlN?=
 =?utf-8?B?eHV1a2dia2ROdE9ERFV5Z2JpUHlQU1lNb2lUcjN3V2NZbWNFc3RYVVhvV3F5?=
 =?utf-8?B?anVML2JOWllFVG9OWGtMMWgxSThGWURSRFltaU1kQU8vTnRrVHc4WjVsWWdF?=
 =?utf-8?B?VDFlRmhta3pLVnpKT3FLR25yWklRNHowRWRKN2NQd29hVjl2b3ZLc2N1Tk1V?=
 =?utf-8?B?Q0k1bDhHL3NWcFFpVmsxK1Zvb0hCWnVtWGNnem1NbDlKUXhjRXh3Z0xzSnJT?=
 =?utf-8?B?bWJ1M0plaDZRZk85d2hyTE1Eak1uQmV5Qm40YWQwdDg1dUJFZHFsQ2F6OHVi?=
 =?utf-8?B?VnM2UmFCQTYvNmphMkwxYlFuMldQMHVNNVh1Q2JleHNiNGpEUWQ4d1lhMS9m?=
 =?utf-8?B?bVVSTTZwSUdGcWNNeVBtbWVGQlkrR3cwcEhtazhPNHlRSDZFV3VrMGhvRnJv?=
 =?utf-8?B?d3FpQU1xajhPYUkxWmxlQ1d6RkIvam1mN2d1aTRIMGNIMkpWRVN1eGtkR01O?=
 =?utf-8?B?UmYrL212ODJXWVVSRzZycjRmYW9BaXRjdDVUYXhyY2tJa21KenZFNmNYQXlH?=
 =?utf-8?B?SFIwdUJoSXR6bDY1ZjIvRVZBOWJBSlRKbnVaSU9ZeG9NTnNhQ0R0OXk0TGNz?=
 =?utf-8?B?Q3l4dWdWNzJYOTEveFltSjFtUXo1UkY3N2ZJLzJETG5wckpGUitFWmN4Uk1G?=
 =?utf-8?B?ajFrSFI2UGU0Wi9mMVI2Y3ZMTU83MHlqeHZIdU41L1JJT3Nyd1V6L08rRy9a?=
 =?utf-8?B?ZDhZbTZLNGdmM3pjL1A3TkpkSEFHT0FLRlVtdmFtdkJSZnpIRmlNclR4V1Fi?=
 =?utf-8?B?YzIvS2t2Z2tQWm1ITjlpd09MbjVucFgybFh6NTk3MVlGelBleWZZL3V1Tmcz?=
 =?utf-8?B?SllTNStOWWdJcnExTEtFYWVaRFdhdS94TVh4R1NvT0FROWpENEc2cXVUem96?=
 =?utf-8?B?NVo5RWF2c1NFaUdJOUllamd5TDFIcUR2UlBLWEFFamFLT0RjMXp2OUFwYkR4?=
 =?utf-8?B?dnJqTk1xRmVkY0ZOdGNrY2ZzR0J4b0FNRUVuYkxOWEZURjJBUVlpdmhUNGtk?=
 =?utf-8?B?Q3R1UHNTckIxRER0UHRRSXphdTdGZlBlY2srampWWThyR3Z0MERDcGVRNnFL?=
 =?utf-8?B?bWVyWlhXMm5Tay9xSUJobFV1TC9CRzhkMi91R3FxMWE3azQ3cUE1Y1BlbnF0?=
 =?utf-8?Q?gzWNS/8XxdQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vnh1bHZTeUtUZXU2Z3VRWlBBMVdySGVxcFBGdHV4ZVQrMiswNkZEODZBbzVw?=
 =?utf-8?B?N3hEVk92WGVMLzNzMlpxYzlJb2tVTkZiNUxyVTQ5UlZWeC9zQ016cXM1VWcr?=
 =?utf-8?B?NVphUWFiZkRmSWRxUFp4S1NLeGVxWVRSMW12Z3lZOFV6UE42bUtKS09lKzJB?=
 =?utf-8?B?NFZoa2JLQmFDRW8wZTg3SnE5QXh6cW5GcFcxR0hiVjFYSTF1VEttMnFyUnUz?=
 =?utf-8?B?aFJEdUJFdWZOU3pyWTY2TjZHcWliQ2U5US9nOUF5RDBPdkhlU0ZuNTBWaU5J?=
 =?utf-8?B?ajdFdW5ub25lOVNTRXVWWEhDTlQ1ZjI4TzRMU01oN1ZaTWJaOXgxUTdKWG9k?=
 =?utf-8?B?RTYxTnhLK202Mm0weEJkTWduWUdNOGxBa0VqVVRBWWtMWHdzWVgwbG4rWHQr?=
 =?utf-8?B?ZUlXZ0FUQnFQSHI1dEg5SHR0cWFuc3pvd3lqaW1Xd25XeWt5clFIRTJ4YmN1?=
 =?utf-8?B?ZTlNN3ZVSExVRDNJU3BQc0dRRGc4cWhGeVRIOEhlS3RTVW1iWVgxN2U1bUk0?=
 =?utf-8?B?VStKcFJncGNINFdST1JyWXpvOVFlYzhKeGwyTG03cVNrOHcwZDY0eFY2T2hn?=
 =?utf-8?B?U1VYSDVJSmV4M3ZUd2M0TUdKMXpHdXBGKzc4TGJ1dFIvZGVFK1Zob3plcURK?=
 =?utf-8?B?dEd1L01FT2krbFZRNkdlQVF4R1NoZmFhZFo5cUsyU1hueGNnejNxMnZOSWp6?=
 =?utf-8?B?dE1EMzd0cFlSQjkyaTAyRE5OVGY2d2hhanR2RmY1SmRWVlNTTTJiUWhYYitE?=
 =?utf-8?B?UWg2TUMrRlJidGFlOFk5SC8zQlZURzZselVkOWJsYWJYSG9iSHQ5RUc4VklI?=
 =?utf-8?B?Nk1xNm9rVlMrZ2NGZVU4Z1c0aU9yS1ZJVGYyam9rWWZCSlJqcW5JREdocWty?=
 =?utf-8?B?cHR6Q2dERWJZZExadnFRd0VLYkFqRTdXVFFxR21Wclo3d3d6NWxNNjZLTU0v?=
 =?utf-8?B?SU5xNXZEU3JYT0ZHeEhER29UMmpUR2JwY1ZLYXB4RHY4b3FDL3RjaFBranY1?=
 =?utf-8?B?UzZ4UzdWVGtlZ2RJdlczVGMwZTdUWTA4dXRRM2NBajJYRitPNGpJeFNxc1Mv?=
 =?utf-8?B?S3o5bTgyWmRmV0ltMHJqUWJRS0s1Y3U5R255ZjhZajNhRzlhQjlKOTNXK0Nn?=
 =?utf-8?B?eWJpclYvNzhPUE9GZzE2REN6clEzZTN6ZzUwMEMwVmVqMHNoZXhqWm9MTGox?=
 =?utf-8?B?NXJuMFQ5OE1abFZwb1NVZHg2MkZwRjFVSWI4MzArdjRnWktUMkNhdlVxcXdJ?=
 =?utf-8?B?R3BaaS9lQlM0b2lhemlrVUw2TXdBVm5NTkt3SkhKV25PUUNkOCthUkw5bjBD?=
 =?utf-8?B?RiszQzBwWUE2YW9sT3NFV1huYWZLcjBSSnBnU3E0a0IzOEFNb0JwanoxL1JC?=
 =?utf-8?B?TXk4VVNBeHNoMVE5WUJEd2xMbFUwWjZOQklwdFZwY3l0VTV3M0tBOGg2dDBM?=
 =?utf-8?B?eE9rTXVCb2JuTWwybTg0Y28zdm5LQlpqdXFVUUFzSkNOZktvZE05M1VnSFRO?=
 =?utf-8?B?bWxJUGo5RDRLSXQvQVZuM1RqWWI5NGRQMU5ZejhVeWwrWGVDY0hHcmYvV2Jo?=
 =?utf-8?B?aGJ5ZEdNTm94UGJnZEt2RmhIZXdWZFcvSXJVYURkWkp5Ykd5WU5PNkppRFVu?=
 =?utf-8?B?QW9MWGJxcElDUWRRUWxDUkFYYlIzS0NYMVB3TnhUckpBWDBsOCtabUNLMmk1?=
 =?utf-8?B?TzRKR3c5SDR1aVBDZGlxTlgzKzFyc0pwSUJnaHRqdG9EU3R3UHFncGJDRUxR?=
 =?utf-8?B?VnlxS29NUzV2ODhOZEFHd2JlVW5lTlpESzUwQTdZZTFIbS9qYnFOZ3BQZkYy?=
 =?utf-8?B?dmovM1prckloRENxcjJoYkFPL21qYmNiSUltU0pCVnNiODBtRXZPRDlNQ0xu?=
 =?utf-8?B?QmprSWZnOTlXR2thYVVlbkU1UGJMcmpiUWlwbjdWWjhneGR5cmxha1pKZ3I1?=
 =?utf-8?B?dC9JZHhBZEFNK3ZYcVNyNnJrNDAvTjA2SmkyK0NyV2E0Z1ZFMDY0YldjYTcr?=
 =?utf-8?B?anVRUjdlMlR1bTlhUkRyQ1NEZytFYlVwaS9uSVdoY2Z0UVR2WEdVS2htZXpk?=
 =?utf-8?B?NFVmZ1VjM0p5RDd2VWdPYmdqRnQ2Sk5qblhHRjB1MUdFbWFYZHJWMnJZOW5k?=
 =?utf-8?Q?lq3m3z77/sm8tptkGbRvbB4h3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7432733f-3bab-4c43-bd93-08dd93c384e8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 15:16:51.5840 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1GWr1/xalFXTwmXxx58d8Z+ABc22lJiDUeXPDDnN6uXI+Ccby2mi+7FJ/IbWFO4z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5646
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

On 5/15/25 17:04, Waiman Long wrote:
> On 5/15/25 4:55 AM, Christian König wrote:
>> On 5/15/25 05:02, Dave Airlie wrote:
>>>> I have to admit I'm pretty clueless about the gpu driver internals and
>>>> can't really judge how feasible this is. But from a cgroup POV, if you
>>>> want proper memory isolation between groups, it seems to me that's the
>>>> direction you'd have to take this in.
>>> Thanks for this insight, I think you have definitely shown me where
>>> things need to go here, and I agree that the goal should be to make
>>> the pools and the shrinker memcg aware is the proper answer,
>>> unfortunately I think we are long way from that at the moment, but
>>> I'll need to do a bit more research. I wonder if we can agree on some
>>> compromise points in order to move things forward from where they are
>>> now.
>>>
>>> Right now we have 0 accounting for any system memory allocations done
>>> via GPU APIs, never mind the case where we have pools and evictions.
>>>
>>> I think I sort of see 3 stages:
>>> 1. Land some sort of accounting so you can at least see the active GPU
>>> memory usage globally, per-node and per-cgroup - this series mostly
>>> covers that, modulo any other feedback I get.
>>> 2. Work on making the ttm subsystem cgroup aware and achieve the state
>>> where we can shrink inside the cgroup first.
>>> 3. Work on what to do with evicted memory for VRAM allocations, and
>>> how best to integrate with dmem to possibly allow userspace to define
>>> policy for this.
>>>
>>>> Ah, no need to worry about it. The name is just a historical memcgism,
>>>> from back when we first started charging "kernel" allocations, as
>>>> opposed to the conventional, pageable userspace memory. It's no longer
>>>> a super meaningful distinction, tbh.
>>>>
>>>> You can still add a separate counter for GPU memory.
>>> Okay that's interesting, so I guess the only question vs the bespoke
>>> ones is whether we use __GFP_ACCOUNT and whether there is benefit in
>>> having page->memcg set.
>>>
>>>> I agree this doesn't need to be a goal in itself. It would just be a
>>>> side effect of charging through __GFP_ACCOUNT and uncharging inside
>>>> __free_pages(). What's more important is that the charge lifetime is
>>>> correlated with the actual memory allocation.
>>> How much flexibility to do we have to evolve here, like if we start
>>> with where the latest series I posted gets us (maybe with a CONFIG
>>> option), then work on memcg aware shrinkers for the pools, then with
>>> that in place it might make more sense to account across the complete
>>> memory allocation. I think I'm also not sure if passing __GFP_ACCOUNT
>>> to the dma allocators is supported, which is also something we need to
>>> do, and having the bespoke API allows that to be possible.
>> Stop for a second.
>>
>> As far as I can see the shrinker for the TTM pool should *not* be memcg aware. Background is that pages who enter the pool are considered freed by the application.
>>
>> The only reason we have the pool is to speed up allocation of uncached and write combined pages as well as work around for performance problems of the coherent DMA API.
>>
>> The shrinker makes sure that the pages can be given back to the core memory management at any given time.
> 
> I think what Johannes is suggesting that we can have a separate cgroup just for the memory pool so that if the system is running into global memory pressure, the shrinker can force the uncached pool to release memory back into the system.

That's something we already have.

TTM already has a limit on the maximum size of the pool.

Additional to that the shrinker makes sure that the memory is given back to the system immediately when running into global memory pressure.

Regards,
Christian.


> 
> Cheers,
> Longman
> 


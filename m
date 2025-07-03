Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0CBEAF7CD5
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 17:49:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFD6D10E15C;
	Thu,  3 Jul 2025 15:49:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="PTs9lG7h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2043.outbound.protection.outlook.com [40.107.95.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1231810E15C;
 Thu,  3 Jul 2025 15:49:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q14WtDyRZNeTM1XoegYv+zEQySoqAGfCO9GKG+31cV8LQ44S3i2wNW/ch6Pz//cQi+RAThb/z9JefKtEsc4+LPnva0JlK1itXFkFavKMm0PYX9yQpYYMOywIFtDqMuW+TBjYoktFiorRAahahyycZ4E5tqHuz42sztQqe1zZ5+3fgQSN8/zaCYMdRjMIVIxKrneMV6LOag9QHnX2dJppgr9796U/4/iqM1ZXsEkVN06EL9fuxKcbSdOPQa9+b/obu1dSDG88t4ZS4r//rDdZfOxF31Ugo93AkdB1wDLb6Ca3A+HHwQZtEudWURAkuaEioPQiT3+j5iKwhbgRXC/r1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3M2dJTNhuaiVhZCxcKP6nOjeo/G4fww4mS2oThs6Bnk=;
 b=GVtdjxhpoCjm/XiXw+HXFv7yo3DZvtGD2PQ2kR8aSudE+fKb4YSJ6gCmI6TDEzpL+JkU3m8GokbEEOePyJ+QxNzWdViQAKtHXyQLfTp1tbyRirBmQ98SwvGEV96PLRBH4QUJWr8QtRIQFqq0HzvUfArMaeoIPxIEP38VqCzKc9mg64n5GxEeSgpoEy/wBqsKdPpvBobny5zcpXjMHONn9a45q0xNP88X+8XG0DWa+VAqiudW7J04EbHX0VMx1wBKHRC2B21zEK6bOA/yPfwb30KjvlVxuAx3oSIqM7mjB4DYcmCOltWx2T9YCwyD4NVmBT3h4JM3e2lEvoc1zJTfOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3M2dJTNhuaiVhZCxcKP6nOjeo/G4fww4mS2oThs6Bnk=;
 b=PTs9lG7hemfk1+ZL7U0Ffp5ANoSgtfcg/c9VqlLDfg+OarRtM9sMf7+SPkzrlfKZom89LSephyA/xryzT+czxfaiI75trFXDlzFNY9HCHtbB0ydMIpk3ZNuQdTATNSTVEBMR/MTsc0sWiP3ooofxQiJaXEl4aCbadrukHWvVq3l5XcqLcKGPyCaj6i+SYIQhXXF9aV7QoMkrfpI/85BVZTWfWyBJakqn/i3COiu1mU8t0XMsjLD+39I76wdgeVjqXQArstBRhZQYMq80z8t5Zv695h5VQ4tKZRdMD2n29eHjjBGwZuwLWzN5qT5KBHGT4v9YB5Xag5eSg6LW+Fm9Pw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by PH7PR12MB6588.namprd12.prod.outlook.com (2603:10b6:510:210::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Thu, 3 Jul
 2025 15:49:28 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%7]) with mapi id 15.20.8901.018; Thu, 3 Jul 2025
 15:49:28 +0000
Message-ID: <f6941c56-b096-4a5f-805e-c3b9b260850a@nvidia.com>
Date: Thu, 3 Jul 2025 11:49:23 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/7] Documentation: gpu: nova-core: Document vbios
 layout
To: Bagas Sanjaya <bagasdotme@gmail.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 rust-for-linux@vger.kernel.org
References: <20250702-nova-docs-v3-0-f362260813e2@nvidia.com>
 <20250702-nova-docs-v3-4-f362260813e2@nvidia.com>
 <aGXMtB7sN1FJOXAL@archie.me>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <aGXMtB7sN1FJOXAL@archie.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR01CA0061.prod.exchangelabs.com (2603:10b6:208:23f::30)
 To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|PH7PR12MB6588:EE_
X-MS-Office365-Filtering-Correlation-Id: f34aa086-8f63-4e51-2c0c-08ddba493189
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aUJoSHd4NThrMVAwRTh4dDJleXk5S1E3SlNoQk5qbENZZXpYalpvM0lmWGQ0?=
 =?utf-8?B?VFozNlBiQXJ2RHBGOEZpWUR3bzZiMDc0KzFMU21hVXMreFh6RWZONEhjUUpF?=
 =?utf-8?B?RUVrUU5MNEJrQXNKNm5lbmMrVkhaUnlsaWwwdUtzNURmQzZZU2hSWjBUa2po?=
 =?utf-8?B?cTNqRUdUZFJvaldGeU1RcTFDaitONmR6WmdiajNLOTFPLzIrVFJBTjB6STd0?=
 =?utf-8?B?ZzVKaFNEWVM3UU5RZ1F4eW5BSjRCSmJmYk1IVFQ2c055YU05ZzNSSkkwaXdU?=
 =?utf-8?B?Yjc3bzlFUUFuRHhBTnZoNy9tbmRTNUFHZkZkV2ZISmp5dmRydEo5djlKU3JX?=
 =?utf-8?B?MnlOS0FMNk9wYXE0azNZVG42TUJPaG4rV0R0eGgxZkhITUtRM1JUR09FL0pT?=
 =?utf-8?B?ZFJZMm5OelZYNWgyV0JzNEFYbkQ5YXVpU29Db25LQW93ekdHcjBNSG9uUnc3?=
 =?utf-8?B?QXI0Q1NZc2hKbjAxSTQ2M1NTN1RpQ2prYWpKeHNJclIxRmI1SkYwQnN4eHlX?=
 =?utf-8?B?dnRQMk55TGRTQTRsc0ptdzFtSWNOL0VlWmJvenZEQlovZzBNWHljSW53dGFv?=
 =?utf-8?B?eHpMSmFyRHZWeGdraHZFeXM5cXNYV3Q2TUxqeHhiTis1MkZ6OGhMMVVNV3pP?=
 =?utf-8?B?WTVpUHlzWFhsY0VxdFgwTkZlSlhwTFZRekM0RjRSQk5zVzZHRG9KckUrVi9F?=
 =?utf-8?B?K3NYOHZLeGwxamdEN1dyYWFBYXZwVE0vQUVtQkpvVzg2cWlRK1RBU1YxYW1H?=
 =?utf-8?B?NC9XczhuRTh1ZEsrZTNMOCtGclcvc0NlZjdlWlZENXRjcUJNSVlBSlhBeXFw?=
 =?utf-8?B?TVMvblMzWmpyZy82aDF0TURXS2c0M2lGMHFqN3IzZHRjS3k1YnNualNvNzli?=
 =?utf-8?B?OHh5WklGRk1XdEh5YzlqQzFIODF4R1pwNnFOVFljSnZGcjEvOWV1NFFHbjF3?=
 =?utf-8?B?TTExMTc4QU1pMjlDcnBxei9vTWljL1d0QzNOR3o5WkM5UkYwVGZsNXAySDJz?=
 =?utf-8?B?WktoRklGd1hlT0R5SjFBWkRwM1pmTUJtMGZHc1lOb2UySFNHY2FVQ2JpRWZo?=
 =?utf-8?B?djVHYmF4cVZmVEh1TDNqRlR0SEVTTUdYQUFSeVFEZE4yWmRvMVp0QStFTURp?=
 =?utf-8?B?aXp4NEozdVBYY1lMNHB5Q2pzR1B6bHg1WjJ1V1BqNmZLWlFENlZwa2lEenhW?=
 =?utf-8?B?cjk4VThQZGc4b0liRVN2WmhhK1l1Y0pvWWVPVm9CWHVsSnlJdmJQUmtZUzhK?=
 =?utf-8?B?aFFwbWJ2aGx4YXovK3ZvWjdZalErZTgvRlQwck1FNmgzTkk1NFRDeXcxQkd4?=
 =?utf-8?B?RDRDK1VsWWdURlNHaGlOQm96eURJampWSzBVazBwaFdjWTBPeGgwQ0ZKdURW?=
 =?utf-8?B?WXNGSjRBMFIzUnJBdUFuWDdXeUlUQnJqUUNKSmRGZjJUdE1wVFBZVmd1NXdP?=
 =?utf-8?B?V0lUR0FCL2c2TnlCRnM4eEQ1Qi9RNmdsajhHaWZUNFdmTmMzdllHVGpCdzRW?=
 =?utf-8?B?enBGK2U1TjJaRUFabDBRK2kxQU5LdGV4OU5sUHVEalhzWGE5VjR4SGhaV09B?=
 =?utf-8?B?ck5XbkFMOXp0dnJLVEY0WEhVY1F0anR6b0NVamlIdmQrMHZFT3R1YjU3U0hm?=
 =?utf-8?B?a2JDczk3dkJNeUx5TGhBN1c2WlBXSFQzblpPUzdGUEdGWkpxTytmYVUzT3ZJ?=
 =?utf-8?B?b3lsemVnQ2MvdkNwcWJJSHZvMkRCMVFPdmlvYS8rKzlVSGl5M3FINm00ZlpI?=
 =?utf-8?B?TXhWNWVIUWxuTEdLMm5aSk0rY2lpV2Z6K0dkdld0T2pEVnVmdEF0cTZTZG1C?=
 =?utf-8?B?eFNkeTdLWTRmbzJuYWEreVh5M1JiUHhuSEEyNm5wSXFPUW5CbnBBQUZTRlkw?=
 =?utf-8?B?Q1JYV2tRby85M3ZhaEtJOTZxSHo1aWxKS0hRWWZScmhURmZmZHVMeGJZRlVV?=
 =?utf-8?Q?KPQ+Y0Hh9gM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TlhmVGs2b25ySmhYSmxTR0JYMTNNOGdQZHowR1hpemhVd1pZa0dnOTRlQlJB?=
 =?utf-8?B?ZHlXN0hEd09DeFlLbDVDMWROZE9wcjBoRFBIU0wyN1M4NmNPT3IrQ3hoR1B2?=
 =?utf-8?B?RUQydTh1b29VRkVJRGlkTS9rSXFkaHdlRTQ5VzNRRHR1UnZLR2ZKMGVlMnd5?=
 =?utf-8?B?OTgrZFhwR00yeHg4OFF1a3lSSys0YitqUWdiY01xZWZmeHVXQ0Z2Y3ovYWJt?=
 =?utf-8?B?WlVFVWpLV1VydVBzL0dBL0gwM0Nqa0EyTEtUMFJzY1l4UjdLcmRhYm1Kbzk2?=
 =?utf-8?B?ZGFITitjclRvbG14Mk1TazhINGRMdU10MlNKdjZOWk1LVmtUMmdDL1IvK0FK?=
 =?utf-8?B?djVMeEdzMWg4UUlnaEhkUUhZZ2ljN2dXTFQ5aGlSYi8yR09BQnVvaU1nODFT?=
 =?utf-8?B?VGN4T1Q1bWxIZWhsQ240YmtTTUJXdFBqbHl3bjIrNDNNcWJTUC85RDViQmxI?=
 =?utf-8?B?YkdHQU1hVG9yV21vajFPWWtTTVVweHZNSCtFbFczYS9RQVZVbXIrNHg0Sjd1?=
 =?utf-8?B?WnF6YnlBWE1ZT1pITnBNdlY1NFlYOUZ6TDNTalJsTmhxQlVwRkprYlB3eWV1?=
 =?utf-8?B?MGxNQjM5VHVsd0tVWWFjN3pvVHBMTmxIMTF6K3dDRkl2R01RRVFiQ0d1VEND?=
 =?utf-8?B?Z01wWm5QVnU4Y2NEc2NzM3RWLzBpK0YzQnhONzRtZVBWVW9aNnlKRHlRUEox?=
 =?utf-8?B?MTgvNDYzcFk4dC9TWU1hVnlwck9FbC9TZWY3bTg5QjdsRDdKZnkvSTBuRGlw?=
 =?utf-8?B?RSsvVU4vUm5uYTlmcmZnTWFqbVhoUjc4cUdTai9EY1JOVWxQRGlGbnQ5elVX?=
 =?utf-8?B?akRsQmk4bmtMa1ZjYVR1VTRkUVJ1Tm5FK1o4V1RxdjJ0eVd4djNmN3o3MmxM?=
 =?utf-8?B?RWkvWmFXLzVDdjZaRTdYVCtwZW1taitzZ2VjNUtkWTRSYXBIMkVsaDhoWlZW?=
 =?utf-8?B?K2huZ2VxMXZqajdPWVE4Y25aa0w4SmFZMktBZVhHVXQ5SjdtQjE3NWoxRzM2?=
 =?utf-8?B?Qmt4S1graGtZYUgzcmRwTm5MZm15Q1U2M0FQcFNuMGNxMzZjQW5sV01BWTFJ?=
 =?utf-8?B?Y09DNGtnbnpJTk1mVmg4bUptTVRZZXJta2hlc0J4dHRNdWdrMm5XZkZwYVhU?=
 =?utf-8?B?aUYrUmlpWG9SMVdBSld5UTh5UW1JOFcrVHd5b2dpd2s2TkNydUQzQjk1Q1ZP?=
 =?utf-8?B?WnZhQTBXaWZxcmE5KzRsME5ZTnI1V01CZEczY01iVHdGa1Z6NlJRTThoS0I4?=
 =?utf-8?B?WTVCeUlRRVkzNHd1U2xpUGNGVG5NUnYyQTF2WVFyWmFPLzdyUDFCcTNjZUJn?=
 =?utf-8?B?RlcwT0VWalVEdm9PRjdCUElKRFJCK1kwN0gxdkFTVjYvVFg5VW5xbTlKS2ho?=
 =?utf-8?B?aHczNlVwT0cyTmo1QXVxeWdReTg1U1JlY1JtL0VBc1ZZdXdtZDhvaHZuUHdh?=
 =?utf-8?B?OUpiYTRxSGdhRnBOU01PbXFjWVhVUnlFZ1ZwUWNvd0YyMVBIR3VXNXRNUlNk?=
 =?utf-8?B?NFVKNWUrektweHlJQmZFY2oyU3NXc1lmSHhRRmVOMWpxcmVIWTczZHBwc0R6?=
 =?utf-8?B?ZWoyMTBjdVN5RnV5Z0tENnA5M3lGdTBsVmRCU1I5R1plNU5kaHVVTVlIYlJF?=
 =?utf-8?B?ZXFtNHpqVTdXTnR2WXJGbmM5NVh0UmF2dXVveUU0cW5NSXJ2N2Uwc3QzcmNm?=
 =?utf-8?B?SkExNkphYzNhSUV1KzdIRnJINU1OSDRaSkM5RXZXL0w2YzZyUHNjM3dDMC9H?=
 =?utf-8?B?ZU9NOGVnT2hMc2luZGx1eUJjZ29lQmZnN3VzRUJSZHJySG9GWDBTUEtNRm5G?=
 =?utf-8?B?OXdYWXpCWW51NWRPakJaeW85TkJQU2EvQkI3T1FlY1A3QjJqT3pFYlFtMHha?=
 =?utf-8?B?ZVFYaWp5MVZ2dUp1amNwb1VVNHJwTjFzZDlWTkhWYmZwUHBpaFBBMTVpVVZK?=
 =?utf-8?B?NGtOMnlzZFhZYVpSRnNTT3hJN3ZOSEUyNGxoQzNYYnBIMU5mQVRGOGY2ckc0?=
 =?utf-8?B?cjlUMzFBdEhDeGtNMHNtd1hrclhWZ3ZXZXRBMkZKVXRIUWRPTCtvZGVldWQw?=
 =?utf-8?B?RElCSHkzUnVQMng3cDdvcFBJQ3hiVTdIcWZIMUVjMHNoSmVBTnBoTjN6ejRa?=
 =?utf-8?B?N2IxeTdVRkNqTllUNFQyaTNzOXlwMGdlTktyREcvOGx5ZCtheVhOV2c4b2hM?=
 =?utf-8?B?b2c9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f34aa086-8f63-4e51-2c0c-08ddba493189
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 15:49:28.4598 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6gDMBLPh4j35TmhTUpbnzxxaRMWEEodOOms+sEAsmiUO9woEaATOKeyOC9A4DSvjkflabS5zulqRgCtXOK2S7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6588
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



On 7/2/2025 8:20 PM, Bagas Sanjaya wrote:
> On Wed, Jul 02, 2025 at 08:00:41PM +0900, Alexandre Courbot wrote:
>> diff --git a/Documentation/gpu/nova/core/vbios.rst b/Documentation/gpu/nova/core/vbios.rst
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..55d7dd4a6658c2a20cc5617f96b278bc4ec2ba17
>> --- /dev/null
>> +++ b/Documentation/gpu/nova/core/vbios.rst
>> @@ -0,0 +1,180 @@
>> +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>> +
>> +==========
>> +VBIOS
>> +==========
>> +This document describes the layout of the VBIOS image which is a series of concatenated
>> +images in the ROM of the GPU. The VBIOS is mirrored onto the BAR 0 space and is read
>> +by both Boot ROM firmware (also known as IFR or init-from-rom firmware) on the GPU to
>> +boot strap various microcontrollers (PMU, SEC, GSP) with critical initialization before
>
>    bootstrap
>
>> +the driver loads, as well as by the nova-core driver in the kernel to boot the GSP.
>> +
>> +The format of the images in the ROM follow the "BIOS Specification" part of the
>> +PCI specification, with Nvidia-specific extensions. The ROM images of type FwSec
>> +are the ones that contain Falcon ucode and what we are mainly looking for.
>> +
>> +As an example, the following are the different image types that can be found in the
>> +VBIOS of an Ampere GA102 GPU which is supported by the nova-core driver.
>> +
>> +- PciAt Image (Type 0x00) - This is the standard PCI BIOS image, whose name
>> +  likely comes from the "IBM PC/AT" architecture.
>> +
>> +- EFI Image (Type 0x03) - This is the EFI BIOS image. It contains the UEFI GOP
>> +  driver that is used to display UEFI graphics output.
>> +
>> +- First FwSec Image (Type 0xE0) - The first FwSec image (Secure Firmware)
>> +
>> +- Second FwSec Image (Type 0xE0) - The second FwSec image (Secure Firmware)
>> +  contains various different microcodes (also known as an applications) that do
>
>               various microcodes?

The above 2 fixups sounds good to me, I'm guessing Danilo if you're pulling this
then maybe apply the fixups directly to the patch since it is trivial?

> 
>> +
>> +.. note::
>> +   This diagram is created based on an GA-102 Ampere GPU as an example and could
>> +   vary for future or other GPUs.
>> +
>> +Here is a block diagram of the VBIOS layout::
> 
> Above sentence (but not the note directive) is redundant, though.

This suggestion I'd skip.

But thanks for all the review!

 - Joel


> 
>> +
>> +    +----------------------------------------------------------------------------+
>> +    | VBIOS (Starting at ROM_OFFSET: 0x300000)                                   |
>> +    +----------------------------------------------------------------------------+
>> +    | +-----------------------------------------------+                          |
>> +    | | PciAt Image (Type 0x00)                       |                          |
>> +    | +-----------------------------------------------+                          |
>> +    | | +-------------------+                         |                          |
>> +    | | | ROM Header        |                         |                          |
>> +    | | | (Signature 0xAA55)|                         |                          |
>> +    | | +-------------------+                         |                          |
>> +    | |         | rom header's pci_data_struct_offset |                          |
>> +    | |         | points to the PCIR structure        |                          |
>> +    | |         V                                     |                          |
>> +    | | +-------------------+                         |                          |
>> +    | | | PCIR Structure    |                         |                          |
>> +    | | | (Signature "PCIR")|                         |                          |
>> +    | | | last_image: 0x80  |                         |                          |
>> +    | | | image_len: size   |                         |                          |
>> +    | | | in 512-byte units |                         |                          |
>> +    | | +-------------------+                         |                          |
>> +    | |         |                                     |                          |
>> +    | |         | NPDE immediately follows PCIR       |                          |
>> +    | |         V                                     |                          |
>> +    | | +-------------------+                         |                          |
>> +    | | | NPDE Structure    |                         |                          |
>> +    | | | (Signature "NPDE")|                         |                          |
>> +    | | | last_image: 0x00  |                         |                          |
>> +    | | +-------------------+                         |                          |
>> +    | |                                               |                          |
>> +    | | +-------------------+                         |                          |
>> +    | | | BIT Header        | (Signature scanning     |                          |
>> +    | | | (Signature "BIT") |  provides the location  |                          |
>> +    | | +-------------------+  of the BIT table)      |                          |
>> +    | |         | header is                           |                          |
>> +    | |         | followed by a table of tokens       |                          |
>> +    | |         V one of which is for falcon data.    |                          |
>> +    | | +-------------------+                         |                          |
>> +    | | | BIT Tokens        |                         |                          |
>> +    | | |  ______________   |                         |                          |
>> +    | | | | Falcon Data |   |                         |                          |
>> +    | | | | Token (0x70)|---+------------>------------+--+                       |
>> +    | | | +-------------+   |  falcon_data_ptr()      |  |                       |
>> +    | | +-------------------+                         |  V                       |
>> +    | +-----------------------------------------------+  |                       |
>> +    |              (no gap between images)               |                       |
>> +    | +-----------------------------------------------+  |                       |
>> +    | | EFI Image (Type 0x03)                         |  |                       |
>> +    | +-----------------------------------------------+  |                       |
>> +    | | Contains the UEFI GOP driver (Graphics Output)|  |                       |
>> +    | | +-------------------+                         |  |                       |
>> +    | | | ROM Header        |                         |  |                       |
>> +    | | +-------------------+                         |  |                       |
>> +    | | | PCIR Structure    |                         |  |                       |
>> +    | | +-------------------+                         |  |                       |
>> +    | | | NPDE Structure    |                         |  |                       |
>> +    | | +-------------------+                         |  |                       |
>> +    | | | Image data        |                         |  |                       |
>> +    | | +-------------------+                         |  |                       |
>> +    | +-----------------------------------------------+  |                       |
>> +    |              (no gap between images)               |                       |
>> +    | +-----------------------------------------------+  |                       |
>> +    | | First FwSec Image (Type 0xE0)                 |  |                       |
>> +    | +-----------------------------------------------+  |                       |
>> +    | | +-------------------+                         |  |                       |
>> +    | | | ROM Header        |                         |  |                       |
>> +    | | +-------------------+                         |  |                       |
>> +    | | | PCIR Structure    |                         |  |                       |
>> +    | | +-------------------+                         |  |                       |
>> +    | | | NPDE Structure    |                         |  |                       |
>> +    | | +-------------------+                         |  |                       |
>> +    | | | Image data        |                         |  |                       |
>> +    | | +-------------------+                         |  |                       |
>> +    | +-----------------------------------------------+  |                       |
>> +    |              (no gap between images)               |                       |
>> +    | +-----------------------------------------------+  |                       |
>> +    | | Second FwSec Image (Type 0xE0)                |  |                       |
>> +    | +-----------------------------------------------+  |                       |
>> +    | | +-------------------+                         |  |                       |
>> +    | | | ROM Header        |                         |  |                       |
>> +    | | +-------------------+                         |  |                       |
>> +    | | | PCIR Structure    |                         |  |                       |
>> +    | | +-------------------+                         |  |                       |
>> +    | | | NPDE Structure    |                         |  |                       |
>> +    | | +-------------------+                         |  |                       |
>> +    | |                                               |  |                       |
>> +    | | +-------------------+                         |  |                       |
>> +    | | | PMU Lookup Table  | <- falcon_data_offset <----+                       |
>> +    | | | +-------------+   |    pmu_lookup_table     |                          |
>> +    | | | | Entry 0x85  |   |                         |                          |
>> +    | | | | FWSEC_PROD  |   |                         |                          |
>> +    | | | +-------------+   |                         |                          |
>> +    | | +-------------------+                         |                          |
>> +    | |         |                                     |                          |
>> +    | |         | points to                           |                          |
>> +    | |         V                                     |                          |
>> +    | | +-------------------+                         |                          |
>> +    | | | FalconUCodeDescV3 | <- falcon_ucode_offset  |                          |
>> +    | | | (FWSEC Firmware)  |    fwsec_header()       |                          |
>> +    | | +-------------------+                         |                          |
>> +    | |         |   immediately followed  by...       |                          |
>> +    | |         V                                     |                          |
>> +    | | +----------------------------+                |                          |
>> +    | | | Signatures + FWSEC Ucode   |                |                          |
>> +    | | | fwsec_sigs(), fwsec_ucode()|                |                          |
>> +    | | +----------------------------+                |                          |
>> +    | +-----------------------------------------------+                          |
>> +    |                                                                            |
>> +    +----------------------------------------------------------------------------+
>> +
>> +Falcon data Lookup
>> +------------------
>> +A key part of the VBIOS extraction code (vbios.rs) is to find the location of the
>> +Falcon data in the VBIOS which contains the PMU lookup table. This lookup table is
>> +used to find the required Falcon ucode based on an application ID.
>> +
>> +The location of the PMU lookup table is found by scanning the BIT (`BIOS Information Table`_)
>> +tokens for a token with the id `BIT_TOKEN_ID_FALCON_DATA` (0x70) which indicates the
>> +offset of the same from the start of the VBIOS image. Unfortunately, the offset
>> +does not account for the EFI image located between the PciAt and FwSec images.
>> +The `vbios.rs` code compensates for this with appropriate arithmetic.
>> +
>> +.. _`BIOS Information Table`: https://download.nvidia.com/open-gpu-doc/BIOS-Information-Table/1/BIOS-Information-Table.html
> 
> The rest looks good.
> 
> Thanks.
> 


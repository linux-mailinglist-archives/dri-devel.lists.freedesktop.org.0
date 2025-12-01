Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0689C98E01
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 20:36:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8C4310E472;
	Mon,  1 Dec 2025 19:35:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="hh/t/Pxn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011039.outbound.protection.outlook.com [40.107.208.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14CEA10E470;
 Mon,  1 Dec 2025 19:35:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FsdbDxPZOcZlkU86d24zULzsuokNk8DLsyBMGJW84hsGk2FaEzqgfwGb/IQ4mXx/U0lmW4KDvCYd6G+ATsoiiJzwnucwKvyeWrKEEAL4Q6NHY0n7jLOrHzR1wAqRMnJDO3T2YfuS+dHKAZ912ZcdgkoV7qDW+ASAcRBGxsPHOnBFGF6H+0G0uHyecA1vH/ihzhngGtIvmfh6UKSYRr6Okl6zUe57IpIoZIqQv6rVi+6chYvHk4c1MHhYRrExhsuuI7Y42Gr0GkwVCASMu9hP+Jo1k3Gm6/veivMwfn61LrRlJz4s2/W9h4Rd3ym8MOIL1JTkdBlH+yNK9UUtrX3lfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bFuM7Z/KGKIKbJt5CC5lI7MT25Uv9Mvtp4vyWvFLR/w=;
 b=CdpqMuFsX6imsNsbtVRKt+uUg0SuUIVjjnB+6tpq77D+zQ/3WX9FisZ0RY0RMiXPClMRpmQqsdgiU+Pitxt9xJ4EM80r6ShdvAITbxRCJvsBff0ioJSP5nQOyaNBeYGoHbXIrzvuExiopEtkh1SdsYPrpr2KCtLAKObjqxluDaqNwIMzhpUCumGZZzFkLuJY8djm+GoxRoMQKai/BaXYeENmI08eHRwzyqWVtIr7fykJPfXHcCasnSHXnahB/MDI0CBWANM0bW5t6rRL4nS0Hk2l3K+Zthk6ztnvtUA0mrgeVQsyYWSiXXJt7OVhv8lTPPdNlWU1qhE6epHwaS02Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bFuM7Z/KGKIKbJt5CC5lI7MT25Uv9Mvtp4vyWvFLR/w=;
 b=hh/t/PxnVTFCtQB+A+8IgBS4giZc0ktKvpAL9d/BQKqGR6PqZooX4CkHHOZn+jgyWRoNgvOvqhzz3q/BAjkCjTXgRKkshq6V4IgT3pydtALCOBbw+Jmci4chj4iCnPSMIFqtWA9VYQSzQ3HRTik/3i3NaxPqwlNkmigSDwm5XQgCGTViTdJ6D5T0jxa0FFcNAGctU8DUgyvzb8cibU4zz+v5PTMLfXXvHWBaxXQNhAZB/mW8RZ01awVgXcXbO7snbHCr+Jdd//XG6ATPMBh1zUfSTYVYxyCe9OpyeB4s2gPclAPA0CMTyUN9F3dszkBAAG7Jz+hF2UWzGwI1IwkPlg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 LV0PR12MB999091.namprd12.prod.outlook.com (2603:10b6:408:32c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 19:35:53 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 19:35:53 +0000
Message-ID: <87d2c2d5-12d2-4655-b070-872c909f7e0a@nvidia.com>
Date: Mon, 1 Dec 2025 11:35:49 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] rust: clist: Add support to interface with C linked
 lists
To: Daniel Almeida <daniel.almeida@collabora.com>,
 Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Danilo Krummrich <dakr@kernel.org>, Dave Airlie <airlied@gmail.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Alistair Popple
 <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Timur Tabi <ttabi@nvidia.com>, Joel Fernandes <joel@joelfernandes.org>,
 Lyude Paul <elle@weathered-steel.dev>, Andrea Righi <arighi@nvidia.com>,
 Philipp Stanner <phasta@kernel.org>
References: <20251129213056.4021375-1-joelagnelf@nvidia.com>
 <5B89D953-BB52-4E8F-AC40-1FA33C016780@collabora.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <5B89D953-BB52-4E8F-AC40-1FA33C016780@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR21CA0020.namprd21.prod.outlook.com
 (2603:10b6:a03:114::30) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|LV0PR12MB999091:EE_
X-MS-Office365-Filtering-Correlation-Id: d67fbb77-03c5-4e5a-7bc6-08de3110d70d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bWZ2S1hyTEpRUmJWUjJJMnJDdXhEcVRxa2ZDUlBjOEMyNXpPYnk1L3JQTXM4?=
 =?utf-8?B?bFJBOEswL0ZrZkYxQmZxQzZmOHUrMlBxTytzL1RxY3cwWE96YmdPS1FUTnFN?=
 =?utf-8?B?OVBSNWFpUGtWZ1N1ZzZnODJzSkxPZmIyT29iZ1dTODI4UzJiSExuY3F0cHlk?=
 =?utf-8?B?NlVtTmErRlA3UVJzRTl2amNZNVc3dGhTMVo4WFVpcGwrYnhwZDZmV0xGbHhD?=
 =?utf-8?B?RTJHS29mNEVhb01CZXB5dm4xZXIxRi9WczFzSWhrbGVQbWJIcmM1Q2p2bVZu?=
 =?utf-8?B?Uy9PV2JnQi82d3lGLzF0bDNsMVdRbmkvS1ZsRGhKT0JROGQxNkhjcmhPNXds?=
 =?utf-8?B?N3Z1K2RSbmFRaU82V2R3bXorOEE3UURnOWVvMXJOcXlFUk0wSFhPN1UxMFJX?=
 =?utf-8?B?WjJXU1JYOHRJUFhMYjZ6alpyVkpzOUc2akt5S0liczVoUmg0ZDJmL21YajB5?=
 =?utf-8?B?dFlWcWFRZGpwbk5tcWZwcTJWUndwYSsrWVROVHNKcXJVSFJ1STZ4ZndOQ3N5?=
 =?utf-8?B?T3R0bGZMTS9NVjIzZzFQakd1N3Q1TjV1MmsxOXUxMVhwV1k2RXZpR3owUEFr?=
 =?utf-8?B?MkJpbWt2V0l2b2RnK0RkN0MzQll4V0M3Q1M4L3VFSGxiVVJ2SWpBcTU5ODNK?=
 =?utf-8?B?aG1JVnpzeGhJblZUY3JlWjZlencwdGdhb0RDenpUcnllOHZmWVdMM0JRVmJJ?=
 =?utf-8?B?R1hmSzVqKzNoRGZxWTRyNXV2cGtaSDBnaGM1Q2lXR0hIWHpHRk1RcFRKVGZW?=
 =?utf-8?B?V1dPRG5wbWdkZll5T0UrbUZCc0krcGQySUtvTWVRcUxSQmRtMGVUQkNPQkEx?=
 =?utf-8?B?Q0E5WUdOR1hiVW5FR2MvV3RjZTZYZUpsTWpqRWlGc0sxQy80NUd3QVhDQ0Nz?=
 =?utf-8?B?WkFkMjR6VnE0VTFIS2R6R05ueVFSYkxGdnNOcEFON2ZzNjhORkx3d1pkWU1Q?=
 =?utf-8?B?RFc3MVpIdXMweDIvVmR1ODhSd2EzcFVzSnJPWFJ5Rk1DMzhHejdPdUlsWlBP?=
 =?utf-8?B?UnAwYnM4akxKME9LdW43anhyMG42bDM3cy9qWWpvMkFBQWFJUjY1YU1KMVQy?=
 =?utf-8?B?QmhjM3FCMldlWTYyOThKYnpmTEdFd2hra3k0eHVPcCtWWmNOQUE1K3BSWnBw?=
 =?utf-8?B?blYveDY2OGFWeFhGUU1NZ3lRZ01SV1VPTW9memNuc0kzU1RzbGJnenpjSHV2?=
 =?utf-8?B?VEFITVhTS2VXSzRmRTVxMWZNaGtyc0t5dzE3TEJyN01BNjZXa2JoVnJWK3Ay?=
 =?utf-8?B?SjdHaHZ1cWVrUUU4YmI5SjBRRDlRem5JcHduTURXRElHWGhqZnlmeTVJUmZu?=
 =?utf-8?B?Y2hSRmpFZlhtL0czQ2YxWmRsZ2g5QVp2SnNaT3BPTHpCKytYSXUvUHVrUlF0?=
 =?utf-8?B?R3lNVlBEU1Zpc01pckNLTFZ2TEdTS3FFY2ZwNWlGZU5hM2w1UlNkaWVvVU5V?=
 =?utf-8?B?eGYyZTNaL1FxTDdJdFRuVzZWWkw3ZXRvLzdPL0lLTkNLS2pPY2l0dnV6YVF4?=
 =?utf-8?B?dnNwTG5LbE1YWDdJeTB4VlVtdTBlamxVM2h3U3plWHVnVzFHV250MkNoYTJP?=
 =?utf-8?B?SGVuRDFNMVErWU0rbXhjNFlDU2JYT3dhUGtDME1LekNqMURxbFVDQlRnNDQx?=
 =?utf-8?B?QVRyR3hFb0lnUHd3bDFTdm9jZW0ycDNBcHJRMG80czJkSGxUellsRGo0U2o3?=
 =?utf-8?B?TGhBK25qYW9DRGVjcnJVa2ozZjFnaU5sYVU3ZXRVaUN0Zlp2T1cvdWE4Unpo?=
 =?utf-8?B?UDF1QnUvOW16VW9lcW02MmxzRnZXb0lGQWNDMlNRalJ0eElWMTYrUWxOZ0dr?=
 =?utf-8?B?aHZ2dm5vM2NxaG9lVUFtYVArSDlYUGxVMGYzRkhxZUJoTHdXdm5xaDZjdHVr?=
 =?utf-8?B?NU9iQ1FmWXBPa01sY0xkR0x2YnpteVhTL1VRTkVoWHRaYzkvc25rOHVFNzU2?=
 =?utf-8?Q?sl1pXhJnaFENy3qIAnDg1ZMPz/lvR5eM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZDI1elFmQTdsQW1NWFltb01QbzdwZHdRbnJqQVBYalhPK0lDZTJUblE2eng4?=
 =?utf-8?B?T3ZzSnpQaHdTNUY1UExRdXpjYzNCMHFTSXVqMlQvb2tXeENYVFdMWGhiTTZL?=
 =?utf-8?B?cTl1Z1F4UFNaSHpHMXdvUzA0OTdBamJhdTEwUk5XN0g3Q2l5N2Vjd2JUSVd2?=
 =?utf-8?B?MVZRNkJtMEVCME9zUmZaOHU2T0E4NTZsWThKNWszK1dGWGxRTTl2ckJRN0Jn?=
 =?utf-8?B?VGltWjB0R3U1V2FGN1dKSWtER1p0RkdrU3RXWC9ldDJQdGN0THpROUNGTVVM?=
 =?utf-8?B?ZXRaZVp3L3R2Uk4zTTk4WDhTcy9NRFhNcmVqV3Jadk1TSjQxOGM2MFhRSVFR?=
 =?utf-8?B?S1hWbXRNU24xWW9FZHNjdjV1Q3J3ZWl5cjRRWXJ0dVhFcm5kV2FRWUZLMmFz?=
 =?utf-8?B?Q3dBR1dHY051SHludmgweUdLbWZKTmlMWnFKdU96OFBVYkE1d0twOFNDNlZt?=
 =?utf-8?B?dFAwODc3ZUFweEttS1U5V0pSUFhjOEI5dTJWc003OVNrM3ZzU01QWFA1cm9k?=
 =?utf-8?B?blVqSTBNbDdDVEF4bGJiQWwvQjlDV2N3dXdJY3VZcnRyYTkva3BTVGR4R0NT?=
 =?utf-8?B?M3VKR051b2VQTjNmbnQ4clJ0VC9BNHI1Ti9vVEpUSUNHTWlCQ05xOHROeXhs?=
 =?utf-8?B?Wk9BVFEzMFBSa1dpUW96TFg4anVmWUsyaXF6R1FOQS8rblh4Qi9lQlA2NERC?=
 =?utf-8?B?UXVMMENSRmtoOWlsdzZGU3VyY0xvQW5DemNJMWRLTGRTczcwbVR2L3ByYkR2?=
 =?utf-8?B?QmR0SlZrN1Rwb2t3bForc1NHdmdnUGR0cmQwOFZXOVlxbzFJUGRZM0Q3UFAy?=
 =?utf-8?B?Z0U5bDA0WnFvNkczODZNQ3Vtdzd5SEVvWGh1dDM4TkhVUkhvNFJkZmtZcE9w?=
 =?utf-8?B?UTVSZHFwSzFPbVNyWGNQZGEvdHBmVkJLRzZJMDlGMlo0WVNhQ0dZVUEzWmJN?=
 =?utf-8?B?c0NQTi90bkNmZGIwam1oWjhhK0RvNm9RM2dPMm85Tm5jQmp2Wms1d2x4STkx?=
 =?utf-8?B?a3JxQ2RsWE8xcVNBRUJ5bEJmc24yT1g0MGMwZzhpVlRpZExzOHpMZHdpQlVv?=
 =?utf-8?B?UnNiRHJkTjdjcW01bnA1VWVkWGRPVGhtK01Jd0ExRk9RbHFKcTNFVUhvVWMv?=
 =?utf-8?B?UEVDcC9MRldZZ01nenVGY2hIRmVDS0d0OG1aU05KK3JGWklUNHliL0ZsS2xD?=
 =?utf-8?B?aWVrd0RjMUZLMHc2SlVVaTd6T2lTVkpJZmg4YUh5N25BRTB6bHN1SGVUb3k5?=
 =?utf-8?B?aDhXdENFSkJxRE0zUGJyWnprb3hTVEQ5SGFVaWgxZUVPVWRyMjFJamdDS04w?=
 =?utf-8?B?STZ5NldaVHRIZTdPcE9zZjNlTDF0b1B4bURNSWZJVVQ3TlVSME9qVEt2VVdT?=
 =?utf-8?B?ZzRraExzVkkxWjJxdlExRWFBSzU0QU0vT3pvUVAxN0FHWG1GL0JhQUwvVkNV?=
 =?utf-8?B?eVVZMDZ4bmRKdkRMQjE4a0VDdks3VHB4N2s5NVljdjdNcC9RamFXZWNCQ0FV?=
 =?utf-8?B?UWJYMGtZRnJLREJyUlphaVJsMmorbHZNOFF2eG1BYVBRbmMrMkpLVXVpY0I5?=
 =?utf-8?B?cC9EMFlTWlVmRWxlOTVqdjV0SThCdTRXSzVtYnJKaUQzMTFZNklPbkorb3Y2?=
 =?utf-8?B?Vm45Q3lNYVVwSnJVdjVUZkJkWEpudGs3dUh4STBoU2ljSDdUVUxuODV3WW93?=
 =?utf-8?B?YWRnbWZ3MlFMUk5OYnBRMVFLMlNPZFhoL21la2xvWEZ0MXNZZk5yK3crQmtq?=
 =?utf-8?B?eDZvekcyOGZtNnJucmFBQlYxcXhlZ1BLc2p0VTJpSTdOYXYvUHNOSmdkUGVI?=
 =?utf-8?B?N0YxQXVpVjNVTEo1djdsbTBsTEpNQ0Y1c3VVQjZ6MFRBbjVtWVJLMU5wMXlQ?=
 =?utf-8?B?alV0ZFg2UmFkancwOGlqWnFORlhsd3ZDWjZodmpIOE4vS1lwZE5BU2NvNVk5?=
 =?utf-8?B?b2htb2o5d0FwbklPMWpJTTdWa05CSVNUNG1wTzBydS9peENhcE1tNlJObElE?=
 =?utf-8?B?Q3JNam1pQi9FSncvQzFxeEZqeEI3ZVhCRGJwNmx2bXhEVmhtMm9HNzBHWllD?=
 =?utf-8?B?Vy9iR2VGSGd5Rk5XVUhmZ2ZDTFdBOTZwM1hqeWp5YWhJeXhJMm5RMDZZY09z?=
 =?utf-8?Q?4e0zexdmZNc9yPnyBWE2uUpxp?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d67fbb77-03c5-4e5a-7bc6-08de3110d70d
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 19:35:53.3163 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: awHaNA3X7ArF5LV83gij8EvpGtuoalRx8eSOFExnO02EFMJTty6yO2JCsTW+HT4aZs2+JebJiLrNGFqrN7kjNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR12MB999091
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

On 12/1/25 8:51 AM, Daniel Almeida wrote:
>> On 29 Nov 2025, at 18:30, Joel Fernandes <joelagnelf@nvidia.com> wrote:
...
>> +#[repr(transparent)]
>> +pub struct ClistHead(Opaque<bindings::list_head>);
> 
> I still think we should call this CList. IMHO, it does not make sense to have a

I am guessing you meant to place this comment after Clist, rather than here
(after ClistHead)? Otherwise I don't know what you are actually suggesting?

> Clist, and a ClistHead (notice the capitalization). CList and CListHead are
> easier to read and reason about.
> 
> Did anyone push back on this?
 
If you are simply recommending renaming:
    Clist     --> CList
    ClistHead --> CListHead

...then I'd say "+1" for that suggestion.

thanks,
-- 
John Hubbard


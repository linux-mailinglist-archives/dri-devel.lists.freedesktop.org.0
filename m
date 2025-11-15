Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC574C60B96
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 22:03:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E901E10E08A;
	Sat, 15 Nov 2025 21:03:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="fJdRidK6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012051.outbound.protection.outlook.com [52.101.48.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A70F210E08A;
 Sat, 15 Nov 2025 21:03:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mo3XrcxSn7JuZ8V2L19sECgq5E/hH1Isj3rgjpO7bs7FCWTcctcVnhVbUJkTeG+diQb9+v3hjzYFs2MvAvQFQGIbTSXtobgDlLfexNO5ryZ5+nzLcYC4qtLKsMjlmk1hTVa0CVQsqN4ku1CHUqEwrzhrwgEEwJNlC7F18WzJ9yOFig7eWoUX4qoV03VlcVtzsBGfcw33Rq60ibMSFes3zaTSpZCFSTG7jQW+4RN900Ofi+VnAyUGN+g4/KHjgCtTnYU9hSVzB6pwuT1v7S9Ez3w+zXajXO26Zf7DK8C9X4mBlPCS4SRtw586RjNUwNLEOlqtYuBDSbpxHONyBc3IuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FowFmOtyU6eCK63DROlXGspzXp+t2T0UuLwPCGt8sko=;
 b=lYGsQRpStL7LQboFJ8LOKKFlPMnAwLdoci/tjeDcfPPBLaYbmxf49DlrhkHXKWo+s2qOru1RTwbmzWTrRWUELdCyxTLCkMg3Wl8eS2D4u/eeG7YJfAbz6aLN8FkgxEYTtKSRkOXtjW0wlXIMlGeD57Qo11HEuYrGfFOuh5jgv+eYc972Xt1pkx5RyDSwxF9JVBUJ+EZksYxBRVlR6X34KgRRiPqHg7e5lJjPQEbPm1nMP1oqS1+MhI/07Xaynn3Giuel8zxT26vqpOYoyohgvKdk3vILn2I8VkXRkP/o+JrSpqNkBw9MUoPpqpq+LyGjoVmBADc8UqWIK6kCudIFlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FowFmOtyU6eCK63DROlXGspzXp+t2T0UuLwPCGt8sko=;
 b=fJdRidK6TNkl8nZT5YDQNX6IngQnvNRWtHEEqNij3loIkQypuu3vHsO7OVMBvdKYuwWI1c/hkztxU2vfqzeeQqSPxwnBSa9UHz8iTBLaJC+xo+RaCFSSuZ9laRWSsJPJPYMTIPE71t0F3Dck2d9Bf+9cWFRoBDeSfF9AlDLACg2dJFuDZYURVkGj2/TgwulMYOopVyrH/yfui0aZZ9KSQ/dybcq1snmuvkZzaMe8VUp2XwOpYwL/vu9kbsVo0Pd/iEyhUe8FA/zWumMu0o/GCYMyrrmeIJcNaBJisRMuN6aZ++YYwViYQnD6KbSHViFe3Y7aGY2S8Sa5jXi91DMdYA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MN0PR12MB6102.namprd12.prod.outlook.com (2603:10b6:208:3ca::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.17; Sat, 15 Nov 2025 21:03:35 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::d622:b3e9:bfe1:26bb]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::d622:b3e9:bfe1:26bb%7]) with mapi id 15.20.9320.018; Sat, 15 Nov 2025
 21:03:34 +0000
Message-ID: <59592581-b6de-4883-a6ef-06358d7b6606@nvidia.com>
Date: Sat, 15 Nov 2025 13:03:32 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 13/13] gpu: nova-core: gsp: Retrieve GSP static info to
 gather GPU information
To: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Danilo Krummrich <dakr@kernel.org>
Cc: Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Timur Tabi <ttabi@nvidia.com>, joel@joelfernandes.org,
 Daniel Almeida <daniel.almeida@collabora.com>,
 nouveau@lists.freedesktop.org,
 Nouveau <nouveau-bounces@lists.freedesktop.org>
References: <20251114195552.739371-1-joelagnelf@nvidia.com>
 <20251114195552.739371-14-joelagnelf@nvidia.com>
 <DE99VWCDFB64.1CXOJAOU0JC93@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DE99VWCDFB64.1CXOJAOU0JC93@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0098.namprd03.prod.outlook.com
 (2603:10b6:a03:333::13) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MN0PR12MB6102:EE_
X-MS-Office365-Filtering-Correlation-Id: 7576464e-276c-4cdb-b0c6-08de248a70a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|10070799003|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bkllRkxpZlpLdnlwalBBMXZDUU5VelJid0hLemtTelN3R3JpRnJaeTJuYWhN?=
 =?utf-8?B?dGtETEVCTzNFdXZlTU1mZ1V3VkVCSThvc2dGY3hwcTVGT25IQ0pZdDVYT1Js?=
 =?utf-8?B?ZWpQZXNPVElxRTg2U1NQUkcwck9mQU1XbkVlZGJCQU5ZbHloSUNMWHBXZGJU?=
 =?utf-8?B?MDdhZFhHSWR5bnN2QkE2Y3JvcW5vM0VPYitJc2hsWGRmdllLNTd3Qm1TZE5Q?=
 =?utf-8?B?b2hQMXpxcjRRVTJOWnZIMGU2MDMxWkNLUG00aDhwNUgyTzF5Ylc0R1dMY0to?=
 =?utf-8?B?bTdINi9XbGg1UTZTczJWWklzNk5ZUFBGZWRyamdFTk5PQkFwNGZxN1lTSGho?=
 =?utf-8?B?dXJsb3VDM09FSmg3TGZIQ2treTV3cTlNTlpFWFQ4R0pPVEh2dW1nb0ZEcFFw?=
 =?utf-8?B?Q1pkUVI0bkF2TE9icmhndEx6UXJrOUxYOWcxWmw4amNSUzFxUGdrMDk2QWZ4?=
 =?utf-8?B?KzZWbEdEeHZwNXZhZlA2dVBoS1VYMWF2MC8rV1VrSHY4bDRIUWhnNlVWeksz?=
 =?utf-8?B?cmFCSGdNMkxLSEJCaU5VY04ycUU5WHE2ZWl1MzBrMEp2cWF6aFo3RTBySlVZ?=
 =?utf-8?B?R0xhQjlxZGFpZ25Eay9JMjRlV040S29mNGtzK2RaaU95UElkNE9kM09VR3Va?=
 =?utf-8?B?UTNKTFg5NmNLMEZwZ1Z3dmJMRTZZY1VWZXIzQlRCa3ZodmlhbUt2aHYyNW92?=
 =?utf-8?B?ZjZlMWlrRDZKWmFoUW5lMC9KTTJ5MHVrUFlRQTFzaXlNeXRaQ29WWXVzeVZh?=
 =?utf-8?B?QmE1QzNYcW9jN1VWeldCTm9KRmFmTmpRZ3hERUE2UE40aFJMTUFOd3dkeEcw?=
 =?utf-8?B?bktWZG9LVGt2SGxWeng5dWovdldSSXhxYndiSDNpK29GZ25KSnBVbUcvOTIr?=
 =?utf-8?B?SU9OSmprRkNZY0s4VGcxSGQzYy9YOHkwLzlIdEg0a1NxQmlCOHpWWnUyRWxk?=
 =?utf-8?B?dExaRUlEc0UzN3dTUUFKODBGL28zZlQxcHFwQ1FEVVJ6T0hoTTNQM296WGp4?=
 =?utf-8?B?YU8yeWJCNEZoRWF2elBkb1ZlZHRXY2RUbzJldUZjaThtSFYxVm9SQ01tRFhx?=
 =?utf-8?B?TVBseitoQnhVbmZaN2UwZVdxNmdva0R4alJ3OVVMSW4wSC8rQUo1NjA5a1RS?=
 =?utf-8?B?MVFldUR6TVIwSmx3d2syNVRHRlEzR0kxZTQ5ZkJhRnBHcVVNbHFZeDVGT2t6?=
 =?utf-8?B?VFFDSkJkdG1SbDhDaStLQ3h1VGY1WFVCL0s3M3FBZ0xhUVk1VEhQN3JGclJa?=
 =?utf-8?B?cHk0bUZZV3VkUzFnRzVyU081Vi9kUS9LcExJL3hGbjEralBXUjVQMW5jcWVn?=
 =?utf-8?B?SGtNeE1VekgzU2JDSnZoanowci80TjNwd29Ka0ZySVpqMkI0a0xvMktCUFBQ?=
 =?utf-8?B?c0Q4WmZZR29sQlloOUl4K3pCMTdnVURURFgrVG5sNTduekRpMXhIZGRBZnM5?=
 =?utf-8?B?VnREc3NNdkROMVJDU0E2d0tmQWFxZjE1QjA4ZEdxVHlmN2RJWHhoakVSRXVV?=
 =?utf-8?B?T2dmM3d1NmVzb2hIWXFXVkpFSWg3alY0Vk55eEJnV0tDUEM3NjJNMTdaaFN4?=
 =?utf-8?B?cnQrSWJmWWIyVGlHUFV2R01Tb0FVdWUrakZQU2RIUEhQcHBrdHE2UElsSTlX?=
 =?utf-8?B?WFZFQXdpUFl1alF3SHB6dXRqMUpBanpWbHF4aFFhZzFhUWNOVkhwMTZ3WUty?=
 =?utf-8?B?WEYrc2tWWlFEc01TWEd4OUhiUzZqYWZBTzZxYllwTURXd08wT3JCZ1JHcUZz?=
 =?utf-8?B?UjBvUU84Rkc0WHdHSjNRTTVjdGFoSzBvRXFZTi9Tay9WWEw4NGdyb2NMN0NP?=
 =?utf-8?B?OWIxS3Q0dWZmeFMwbWlZcTU2STlwRUptYTY4UmpjalZzWVBFVHdyMDNmb2F1?=
 =?utf-8?B?a2lkRTJjNFA3cmd3Y0czbVFVOXl6MzFmLzlIdUZjbVEzWDc5bGxYcDZ1ZTli?=
 =?utf-8?Q?ezrUKDuJWnZv0p4e5kOB4uLme0fhGgy/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(10070799003)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U29uRERWRWxMWkk4TUNjZDRVVmY3UnYrS2Y3OXlUSWtFOWtzRnRVa1RWTFlB?=
 =?utf-8?B?Nk5jeDhXem1jOEplYmYxQXphaVJydFFYc0pFZkpGdUhxaHNRaXNGNk9FL3Bo?=
 =?utf-8?B?eUhzNDlqUW1GN202Wkpxd1RoWVZZYlE5U2NCS1BxZVFWbGxUT0kwUnJQblpu?=
 =?utf-8?B?MlVrVE42Q1NINHdndWppem8wcXZWc3dEbExmeStOd0tLdXJmVWI3SHdvT0ZS?=
 =?utf-8?B?azNHZ2h4VG1mdnJLVE5nNGkyR3ZVTnpEdm5tMTNNWjljTkpmdWhPSnhwbVM2?=
 =?utf-8?B?VFRyRHF2Unp0eDVXTUZpK1hYelZiTHdDV2NjQVhPeHYxTnZMOGRJYmFOcmkz?=
 =?utf-8?B?QWt1Z0o5NlpuNllOQ3lxY1BhTURwWEtHZTJuOFFMZFV0eGxHby9YdEFleHB1?=
 =?utf-8?B?VkpLRlhKd29OQlNRSUU3YStTdDlKbnhVNVk0K0xTQjFBM0hyOUxzYVI1M1Nn?=
 =?utf-8?B?OFVhU3d2aVYrRmJGRFQwTVduTFh5aEFFaXYvbHFoWGxYeHIzOVlUVmJwMHFl?=
 =?utf-8?B?MnZSdDNOVm1Cck9jdzhLSEV0K0RSZ2pPSlArVnBvaVdiNHJwVzFxZlp6Y0sy?=
 =?utf-8?B?WjZoNUgxSzQ3d1VMVlM5NWcxSmR3akNWT05RU0ZEdWF6cVE1NGxZektaZUZh?=
 =?utf-8?B?SFN1R3Z5YThLQmEwUGdubGxidWxjNk10WVVpb1FEQSs0cXJKUzZuN3BkZXhq?=
 =?utf-8?B?VVJSS05sdFdpdUJsUGJOMUxQK205eUUwTURlQ1hnWGFtYmFWUlVQbkhaWlpC?=
 =?utf-8?B?TUFEeWN1VXZJaTI3bGhHVktpelFBa3JGOGMwclpjdmUrVGswRWpOQ3FCTFJF?=
 =?utf-8?B?N2JMRlVrUFA2Y1pQb0sxRkVPSkhnSHU5NzZHaDQ1M0lHNVIvcGlEdVVTOEFQ?=
 =?utf-8?B?cUZOZlV4a0ltZGJCMWdwWHRmOU1CYnJHb3dDR1B4eExOa09aSThxZkJ3ak5i?=
 =?utf-8?B?VHh5MmFKak9RdmlwWC85OTlYS25NZm9HOXpJU2RUbGRoM3czT0FzSkJnWERB?=
 =?utf-8?B?U2I0aXNMRjRPdVBGMU04Ry9KZmFzUzI1Y3BxNFdEUk1LUTVmRytjb1pLM0VY?=
 =?utf-8?B?b2hlRHdxcSt5aVFnTmNZSFR0dGxjanptK0htbUtUSUx5dUJ6L1I1clQrMmpt?=
 =?utf-8?B?bDgxNlNrT1RCYVh0Uko2NDdWSEkzWVM0ZHI3OStkcDFvNlpTVDRPTVZiYVlm?=
 =?utf-8?B?eEZIZFJoU0xnUW5Jbkh6QktCbzB3VStvb3hVYTlGVi9rRUdrOHpQMWlmeGoz?=
 =?utf-8?B?cjFEbmhRZjZ3YUhBc0hSdWtBbzFiVkhZV2pGVWE1bUpYeURoMjRkeDR1M3FM?=
 =?utf-8?B?cExqYm1jZWtMOUhSRitQSzN5Vjc0eW9rbXgvYTBHL1g0TWhxZkJydDFrR3FN?=
 =?utf-8?B?YjJVYi8vV0ZiQXVmeVVLUE1MYzdwVEdEaUVLa3Z5UW5zQk5EZ3dtdFlOY2My?=
 =?utf-8?B?T2hDODFRYU1VNEZaUnVGUlR1VTQrczlJcnQ5ajhKdnB6dEhFNUZtM0x0Y2JS?=
 =?utf-8?B?eHQyYkxCc0l4THdwL1E0SGFiazNVOVJmalBCam1aRjJ4WC9wVm5VWVNocERw?=
 =?utf-8?B?U1ZxdzZIbm1nejFDM3hPU05IMzMyc2VUeTdpcGZLVWlrMDlQd3o4dzgwaW9h?=
 =?utf-8?B?MmJRSDFzeDVRR1p1ZTg3d0JlLytpRWM2QTNCNllWekw0QitDZHg5amZ3MzZm?=
 =?utf-8?B?RDUrYUdnZmtudk5DdmczNWlvTW81R0o0N1ltTTErOEovbnhPTkx5RzBGVHJF?=
 =?utf-8?B?ZjEyTUE5NlRIZWVSTjdBNnQ0NUlSYkVoUW9CWVNlcncycm9UZ084L3RIVDlI?=
 =?utf-8?B?ZkV6Nm9mSTFFaU83a1JjRGhQcmtxR3RkaFFGWlc3eHlpeGRtOVdIODNkcUNo?=
 =?utf-8?B?TTNrQmdDRE1DWjdWUFozR0VmU3RtTDN0T3ltajQ2L2U0aG5qNHR0R1ZBdE1Q?=
 =?utf-8?B?a2NBdDRkMXJLUmtiLzJqVkRHalhoWVQxZmNsOFZwcWxyZkF4UnEzZEZYNHo3?=
 =?utf-8?B?VTNwV1ZEVGV5VUdoOFVMeWJhbHNybEZuWmZtNnJvYkNocmxnSVFmS2lzL0lr?=
 =?utf-8?B?U3l0Tkt3bExTcjNUQTNmMDllM0VzT1B3b2lxKytOd0N0Z1lhWmprMFhkOTNY?=
 =?utf-8?B?SFJBT2hRSXJXWkFDdHJYVW9XZytGWnA3d2V5RUVuVmYwT3Q0MVhpZm1HOWlr?=
 =?utf-8?Q?wsy21Xh/2ZqY+t0tkTrNyfM=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7576464e-276c-4cdb-b0c6-08de248a70a8
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 21:03:34.8652 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V8HyrJaHd9YPAFXCDwWHXSdeH9DLh8fDRniegFeWdzJqPYQa8StFq2K738ml7Ha4atpqS8cgJnPHcK+9gLaMfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6102
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

On 11/15/25 4:38 AM, Alexandre Courbot wrote:
> This one needed some rework.
> 
> On Sat Nov 15, 2025 at 4:55 AM JST, Joel Fernandes wrote:
>> From: Alistair Popple <apopple@nvidia.com>
...
>> +pub(crate) struct GspStaticConfigInfo {
>> +    pub gpu_name: [u8; 40],
> 
> This is probably meant to be `0x40`, as the `gpuNameString` bindings
> member this is built from is 64-bytes long. Changing it to be 64-bytes
> long.

Oh yes. The 40 actually resurrects an old bug that I had fixed once,
because it truncates the very long and elaborate Blackwell GB200
card's name that I am testing with.

Good catch!


thanks,
-- 
John Hubbard


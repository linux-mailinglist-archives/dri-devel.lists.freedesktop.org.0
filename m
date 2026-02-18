Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mD6gAWRPlmnddgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 00:46:44 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 649D515B012
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 00:46:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22D1E10E15D;
	Wed, 18 Feb 2026 23:46:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="I/x6aNOu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013000.outbound.protection.outlook.com
 [40.107.201.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6E4710E07A;
 Wed, 18 Feb 2026 23:46:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ijljed1S2uFdPu8b5G0Dk2AU6Y9pxtfqdWT1QDf03oSEPfbZvoeWnmlHDQcMhO8iqDS7/zOA/MOA93Kjjg+6Vc9IevZMsMTisKhUpkLISdnHZz6olH06FUyoc91KppZTM7uM3X/zpsBIrCK0MZknaQX28CQ4xLmDkmjeR7RpMddDpbgUiIpLYdVqe5rmFU0buPj770w1IwsymNBIG+tBsNatV4Ly5dm/0/azDS0XUalZ4GKFM0LqvI7TPV2tzWSa4yKPM0CCukkcXR0M0e4KOVKMUaXe7HUug2WYH/HrwcsAkfnbMUKffobxIYwQCuRmh0U6zar0gwQBcUPR38FhgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WeekoWasfLMnY4Mb04ER/8U1G9z+G5sfwNuWOvzDyTI=;
 b=J2E2BoxWdegHl6tvhLYrUadI1YhcAvRvVEqi+JGHrnnD0xpCyGGD8aOVdAgkn3Z78IQto5WYmWy3ltHJ1janfQflfW192hnqcBx5+MilIMEOa6xKdpOpvVHFRG+QslJIqAOgmaBpPG4xEE/Ux5wLjQg2kVRA0aBJslp9+wOqaCRdwVnuECN1X4nqf02Q26ilTuidVjDoa+4SWEyTemQRYx4Ts03437NcFZkOrTz2L5G0UhQaQpitP6BUyUnfIlmgUg40viIuxn0JPNd2x7J1VS7+C3nbmZDOzv+eV0LA5IEaKaqUlNjY3K4dvwnYfGQ6E4PFzlJMrD/sXgLMDbYC5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WeekoWasfLMnY4Mb04ER/8U1G9z+G5sfwNuWOvzDyTI=;
 b=I/x6aNOuOEEVB4I/T9Uz2JP9KBg8KFkEtHP91JNz1js/WryCUex4z3RxmJ6H53r3JWRZxbUbzU8Y3+rkZJO8ma1PFgExJ64SHsR7GpNmx7rQKYU9Og7/Rt87yr17h2IbKISBmW81TFNnk9/BBRewb/Mvc6JHZv4ihknFfpTSO5IVomjQ6SRnVSnZpyqTRG3j4aQU/ZW9egWFPSx6bq6/rznbaDhvC+7fdMA2rWQVgZ3m8qvAkzb09/0vgILiTCWrb26ZIACwRp15hMG/JPAxF6xOJFMKG1s4XLylZhJfP86NUsNa66INcaERlzAbWgQZjG6KpbN+wO11dAUjZrkf8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 DM4PR12MB6565.namprd12.prod.outlook.com (2603:10b6:8:8c::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.13; Wed, 18 Feb 2026 23:46:32 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 23:46:32 +0000
Date: Wed, 18 Feb 2026 18:46:31 -0500
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Dave Airlie <airlied@redhat.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Koen Koning <koen.koning@linux.intel.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, Nikola Djukic <ndjukic@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>
Subject: Re: [PATCH v10 0/8] Preparatory patches for nova-core memory
 management
Message-ID: <3CB77723-96B9-45DC-844E-8674361560E6@nvidia.com>
References: <DGIFU4JV4U47.QNCVFND4EA40@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DGIFU4JV4U47.QNCVFND4EA40@kernel.org>
X-ClientProxiedBy: BL1P223CA0005.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:2c4::10) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|DM4PR12MB6565:EE_
X-MS-Office365-Filtering-Correlation-Id: b4fd78e3-9296-4f54-6ac0-08de6f47f1d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QVd5NWNPT01UTWJJMlQ3MDAyZ0FiVzMrcmV0UTJmbTM1VHlNSzF1UHpIME1s?=
 =?utf-8?B?WTZXelRNUXB2aXpCL2lwUksxbHlSaGQzM0ZWZGVkaG1uQjltOENWMVRzZ01s?=
 =?utf-8?B?TmQ3TDkyaG9yeHZiQWVFS0U1UnJkaXNOamtKcndhcGJxbnQ2U0NQWERRZWRp?=
 =?utf-8?B?ajZzZENST0lvTkpVcmFzaExNQjAwdHUxMG41YnJVVUs4RXgvdzcvcUNIN09R?=
 =?utf-8?B?KzlKOE4rU3NYclJQMm01eC9IQzVkdll1WWZYam90U3Q3Tkg2d0ticFFGWEFE?=
 =?utf-8?B?a2U2K0hBa1NCY29aTjNHOUtEWkRKTHBWdzV0ajVyWndjY1hFS1dLYkY5ajBh?=
 =?utf-8?B?UEMrU0pDTXkvZWk2NHBhVUg5UktVRStaYWdRUm93Q3JpaHpvSXY3NkdRUElo?=
 =?utf-8?B?RHlHSkFJdDk1K09XRU1YZEplUGI0eTVIemNNbFpTM0M0ZnBPSGdnNXBaK0lh?=
 =?utf-8?B?REN2SzVNZEg2cmNTOHlKcklaU0UyL0FQQ2dITjJGN0xBdHArT053YXZiZk94?=
 =?utf-8?B?UG1PYk9DSHFmc0dXbmM0akJhRGlueUlwTmRNc1RuSXA2QjZiaHc3ODE2ajNT?=
 =?utf-8?B?VmR5c0UvclNVVUtOT1FXK2lKODBuUzhaTDBOT1lsWFdhaUxVYmRLdTR6SklE?=
 =?utf-8?B?MHZBcEdJb3ZJMlNmdTU4MWkyVXJ4d2tqL1BDTW5mejRXdDgwdC8vR0JMbDNK?=
 =?utf-8?B?WTloYTQ1NG5LdDJJY21ESkhMTTcveTMzSmV3WTZxd3owb2ttbVIwc2hlakw2?=
 =?utf-8?B?YzdBTnpQUGdNczBlMmxmUlhwSnVkaFFhWVkvQ1EyS3NSV1VRRmd6V0pWaDQw?=
 =?utf-8?B?L2Q5SlEzdkRiY3F4MDM0aXFCdWlnMytHKzVQeWlXbXJRdThvYjFWMmxJUGV5?=
 =?utf-8?B?REpGQjdBS0RISk1XR0xyNWdmaUxCbGQ0WkZ5TGxJQ1VBSHlnWkc4NVdtYU9v?=
 =?utf-8?B?OG9USzU1aUlWd0oxMlg4NTdnN001VDU4NFNmSTk5T2dpdkFmMHQxdmRRb2I1?=
 =?utf-8?B?eWJzRFA5ellRRzZwNCtreGJEY3VlY0dpbTZwZ1RUR3FKcWpIbDlwWVkvYXdw?=
 =?utf-8?B?Tm1JSGhtTEZFMGFQcUtYTUJyQkQyQTBqanliSGgvdjQ1TXQ5Zk5ocHdFcW1a?=
 =?utf-8?B?T1FnMGQ1NGpsU2ZjRFBrdU05aitKMlpGeG1xRzVFUUtKUXk0bngzS2ErcEtQ?=
 =?utf-8?B?MUdUVWQwMUx3ZGxSNFFBMVd4VEZFQ1psN3lOMDVMWXFmZ1JBa0JiOWlrOVVG?=
 =?utf-8?B?MUJwcDdNVjIxRTR4WkxCWDRtYW9seTBEbjNpa3FHeExJSXB0elFpc1VnZnNH?=
 =?utf-8?B?enV2QlNFTkJzL3NraWFaZzA4aFZxM2hSUURGbGk1MFlBMUJ5MGZOTFpNUy9K?=
 =?utf-8?B?U2diL3lyRzl3SWVVejBUVy9pZHRVK1lRVWk1dzZMT0c5d0xkanF2a1pJRXB1?=
 =?utf-8?B?MVJHZElucUpQMytBbzdjbHlneGdvZUtHWXhYWXBvRTZkVjMwRWRyOXRTY1Ft?=
 =?utf-8?B?cTYxVHh6SWdrREV6THpwMjl2ZDRuam1jVFRzWTU2U1g1K2NzRlNQMG5Bai9C?=
 =?utf-8?B?QzJSaG5MbjhxVFVLank1b2ZEaUw3QmEzSThRSkdOUU5BTGpzTFE3RzNCeW1F?=
 =?utf-8?B?QmtsazZ2dU45WG4rWmFYV0ZQcWtMcUNka3ZUWUdiOFlZaXdOZXVSc0YvTmUr?=
 =?utf-8?B?SXowcTdWZnd5aVM0RzBhc2RVUUZ5YmtkUGJFaVhjbDRJZmtqMmFSWUpvQUs2?=
 =?utf-8?B?ZnJxSFYvbkJDUEpuL0Z0UWtLdERmVmNkMG14Y01FbDdtb20xSzR5bW9YaXlk?=
 =?utf-8?B?TDNxTGtPci9KZHpQbDJMRDY4dWE4QUhadDlGTlh0ODE3V2dXZHlaOUo0c0NV?=
 =?utf-8?B?N2IrVUNDOXloTHRiZW1QVzlpb2tNRzMwaThYd29SN3FiL1pvd1dVVW1vL1VP?=
 =?utf-8?B?dnRsaXJJQll1bFJIdW43V0tIWmN3SEUvZ2Jmb0RsQnV3UGd1anVqdVZ4c3FL?=
 =?utf-8?B?RXFrRy95a0dKT1gwZW95QmpUTzdYdVZTK0Q2VlEvNmxwVnRVSGl3d2djb09w?=
 =?utf-8?B?UXdHQnYwaEVjQWJvTnl0bHR6TitzZ3BBZzJQMFdDQUJyVXhBQ1JZeFpJMnZF?=
 =?utf-8?Q?pS2Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2xqSFdPaXdVOEJ6MjBjaGNMUGRvYzltc3RwWHc5TVBsRmoxQjNYZDFDeTF0?=
 =?utf-8?B?akNOR3M5YkVMZExIeWhoMDBYRy9GTUsveGo1aUpRRjFNeWZNMkFyQUEySGdw?=
 =?utf-8?B?KzRXVkE3R0xEaGU1dkYzOEZCL0o3RnNySDUvV2RuZ2I2YldKVGs0NHVWbGkw?=
 =?utf-8?B?eS9VN0ExMlQvVWg0cVF3eHZOMy92K1g1bzdkaFd3NFlhbllVcDh6QTZWdDF6?=
 =?utf-8?B?bGZwdUhYM01Qc0JkSDRqd2lpSmt3QVYxR3l3YTJ0cHpGRUYvVUI0eDdlN282?=
 =?utf-8?B?cE9uemtscTlMUU5hcUw2RjFoaUNNUXdmTlBneXNSTmxPQm0yWmxpY1JvQUpa?=
 =?utf-8?B?emVEakFPdU9iUWQzam1nUEhLeExObFB4aWhQWlViZnVTZkN5b1YzTE55bmRT?=
 =?utf-8?B?N1JVWmIxWlF3dDFZTk04VkJncDliek94NkFKbVc2K2JBY2V3NEc3cXUyTFpX?=
 =?utf-8?B?TkJYYUxmdXNWWTBSc3c3d2ZITmhLMnF0WmhzVktjOEhvdmhNOUU5VW9lS2dL?=
 =?utf-8?B?UnRMSGtINm00amIyV0VYbUpuQU16YWNuK01scm5ZMHZCNUpKemdMRktobVRt?=
 =?utf-8?B?RFhCM09CS0lXbDl1bnlvQXkzMGVVQ1VybXhOSzJjb0lZMi80SE9aYVY0a2Vp?=
 =?utf-8?B?SGsyTmwrODlza2ZmWmo2NDJML1ZqOUZzT09SUEZzRlhJVUtSYWNUZ0MxVkN1?=
 =?utf-8?B?bzNCVkR0OTBiZndCVDNKSnpoVWttb1ZpcUFveUoyK0Z1MGFXdW52RjBLMm56?=
 =?utf-8?B?YWhYSENjZGdxanNxbjJHalEvMnpkSUJ5K3pPOTA2c05qMzdXTm0vN3ZWMzFK?=
 =?utf-8?B?TGJTL1BZREMyY2ZMbzhHYTdjRnlWWEMzdElRckN4cTlHdmxTNVJ5Vjk5aE9K?=
 =?utf-8?B?QmM0YU5xbW1SS1VPaVBTRjNlYUJnOFB1Y3pNdGV1QlNUZXZCbUUvRmRYSzN4?=
 =?utf-8?B?d0V4Q05yZC9oNndjSHhpWk9LWVZnMjRObGRQdjlZQzBoQytxRzdvVndnUVlW?=
 =?utf-8?B?ODA1OXhhRWZFbXZXT2IrcENtSUJabGIwYWM1dUJ6VHdBUEJ4ZmlCZXNBZzBj?=
 =?utf-8?B?MkVQSFRvRHgxNGdEa3RNdUJlUS9QdlltRDBrQjltaSs0dzRqb0htcmpad2do?=
 =?utf-8?B?UkhLZU5HL2ZWSWJ4N0x1Z2p6MWtxQm5HaXR0elhMVXB4RW9FNEZ3enlpREV4?=
 =?utf-8?B?RVV3ck9pczQ0ajJjMHY1aTU0UUQ1eFR3My9sV3BjaWJEajUvQlpXdG9JVWxk?=
 =?utf-8?B?SzZNcFZOdC9SU0hxS2ZjbCtuNXNFNjRNQk9SUXpWQy9pcVJFVVR6VEpwNDcv?=
 =?utf-8?B?RWcvTnkrSEI1N3pzZDVrOUR5VWtVRTZVbUVlOXVNeFVGK2hreEdhR3BvVDBn?=
 =?utf-8?B?czBaZE03MnhLejM4WlRaM2tqRVdlN3ZwRW03bktDR0ZNNDVYRXI4R2pFZ3Ry?=
 =?utf-8?B?NEpaSStudlY4RDF5WUp1ZFYyL2JwSXloRFdTZldNTEpzakE3UHFpR3NOWUZo?=
 =?utf-8?B?UFBjNnZ2ODc3c1F3QTgrVkFUYkUySkxuY05rLzNLTDdPOHIveWpyQXZieUN0?=
 =?utf-8?B?aGdGZEtTZUplVXBNSTR2ZWFYK204a25wRkVCeEVDRFhFMkhaYnN6MHlINThH?=
 =?utf-8?B?MVFYcHhHMCt5TGZwUmhkYXRrS1J3ZGpYeFYySDhueEJqMW5Ec24vOTNRaHJo?=
 =?utf-8?B?ZW0xMnhnWW9FYzI3Vms4M2w2Nk9sME12U2ZWQ21oZG5JdElOV3p1bUNEKzcw?=
 =?utf-8?B?VDRzRFJBNGZyL29heXRtT2VJSWxRMFMySG9SeThxaFY1T1hDSHZiQ1lWcFZJ?=
 =?utf-8?B?eDBDMENEczJLUmQ4VitqWGlVM25xS1VHVUZyb0t1N1FYcFhGNXBSUE5PdU5i?=
 =?utf-8?B?VzlTNVBxbGhZSzMrN2c2MEhSNWNLUWs5Z2VEUDEvcEphazhLSllueDlpdVJm?=
 =?utf-8?B?ZFVqUklsUG9tbGpLRHQrQlBUbXBBOUh1RmRNVStsdnJRWTA4U012cDQzSVdo?=
 =?utf-8?B?eDhzY2Z5OS8zL25TelFYMVFMVnVwSzBld2FJTWhicFU0dVJlOGlzL3M5a1Mv?=
 =?utf-8?B?c3dRVlVkNU9aVHVScW5aUCtuVXdqak5BK0x2K2lYL1JEL2xJRktYQ09OajJn?=
 =?utf-8?B?YzhMS0VCRUVlQkM4WjFRQkdhT3E2TmlaOSs4dUdUOVZXcFR6bGRvc0EyUXdq?=
 =?utf-8?B?MTBMSWxnL2RSM2k5UTJTSWQvMk95OFFkT3BXekRScU1Cczkwa1VYNWhycmNU?=
 =?utf-8?B?b1QvTjltOTlIRWhNcURXMXA1VjNtcWtDcGFwQVpkU0JoaWRrb0o2UHJtRUtH?=
 =?utf-8?B?OXI4Rm1RUUpMSGlsV2tzYjdIdWFWK0tHOXdGT2lwdW5jMUVReWI3QT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4fd78e3-9296-4f54-6ac0-08de6f47f1d2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 23:46:32.5918 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QVLR6M2usDypxpkOlqLWoBRfXA4giDRI4t5Fz0/rBtTvbPTQNuXK142/tzsehgulKvWPfnbC6VoFhwJCPF0n9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6565
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
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,redhat.com,collabora.com,linux.intel.com,lists.freedesktop.org,nvidia.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_TWELVE(0.00)[18];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 649D515B012
X-Rspamd-Action: no action

Hi, Danilo,

> On Feb 18, 2026, at 5:24 PM, Danilo Krummrich <dakr@kernel.org> wrote:
> 
> On Wed Feb 18, 2026 at 9:54 PM CET, Joel Fernandes wrote:
>> The clist/ffi patches are ready, reviewed by Gary and Danilo. Miguel, can you
>> pull those via the rust tree?
> 
> I requested changes in the last version and have yet to go through this one. I
> also think that Alex still has some comments (Cc'd him).

Sure.

> 
> Please note that if this goes through the Rust tree, we have to wait for the
> full upcoming cycle before we can land the GPU buddy abstractions.
> 
> Alternatively, if it goes through the Rust tree, Miguel can provide a signed tag
> for me to merge or we can simply take it through the drm-rust tree in the first
> place, if Miguel agrees with that.

Ok.

> 
>> The non-Rust DRM buddy related patches are already being pulled into upstream
> 
> They are in drm-misc-next, I will merge into drm-rust-next once they hit
> drm-next and -rc1 is out.

Ok.

> 
>> I will post the nova-core memory management patches as a separate follow-up
>> series just after this one.
>> 
>> The git tree with all these patches can be found at:
>> git://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git (tag: nova/mm)
> 
> This is now (at least) the third time I have to ask for a patch changelog.
> 
>    "When sending a next version, add a patch changelog to the cover letter
>    or to individual patches explaining difference against previous
>    submission (see The canonical patch format)." [1, 2]
> 
> Please, add a patch changelog.

Ah, I think I did not understand what you meant because of my different
interpretation of the words changelog. I have used this term interchangeable in
the past to summarize what a set of patches do in the cover letter, not what
changed since the last revision.

Anyway here is a changelog:

1. Moving of the clist code to rust ffi
2. Some comment changes in clist and gpu buddy bindings
3. Inclusion of the movement of code on C drm buddy.

For the other series:
- the main change is only for DRM fence signaling related stuff and some test
related changes.

If you want I could provide a range diff if it makes it easier. But yeah I
did drop the ball a bit on the changelog stuff here. Perhaps buying you a
beer the next LPC could be penance?

> 
> (This also goes for the nova-core MM series, which is flagged as v7 despite
> actually being v2).

No, it was RFC v6, that is when I had included the full stack of these patches.
See:
https://lore.kernel.org/all/20260120204303.3229303-1-joelagnelf@nvidia.com/

I split it this way based on your request. I wanted to keep it all in one series
to reduce version number confusion.

Let me know if there’s something else I need to do to make it easier, I can
include a proper changelog in future respins.

Best,

-- 
Joel Fernandes


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38291AAE172
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 15:53:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83E2610E7E8;
	Wed,  7 May 2025 13:53:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="F1GPgGOm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2042.outbound.protection.outlook.com [40.107.244.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4595310E7E0;
 Wed,  7 May 2025 13:53:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vmk2eEuk5ED/Jzdr/Tk/QHKIwRcJfy1yngZ3KKS6l6LNUBqbdws60WxaoyGZBGPPmHa2i65PyUMhvYtlFvr+M0Uedlt+ZL82p+FRwgOhTmvW9V/0UUgSDqSjFpFkDU3pt2T3w2WbB2BtZAxS1AjZs1GJyFc/X1teYovlImyr/zlXGVuqizmk8tIXHNZx+IXk39beKxrfjN92x8lXH28RvgPckbkV/re10Bk/fvdE7VX1VFKwxFlrbH+Q2ZJc2YI7lcImN75VayD+/8nLoVJqnUMWdnR2FDksM8J77dhxtmxjaQ3vj9p4A08iAuDimbcIziTAaUwPF6Cob9JLLnwqlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jcl0MvNwuTqFDlW4bKC7SqXz388NXThs1q6yqgGGQr8=;
 b=cOm5zko0CIIF1UbeN1vpxFrzDLEk4lU/KWcdSEbwflhCkTUMj4+mSmuurN1/KtnpsSXYYIjCXEGsJKsGqG7g/gqnL3JMstDrazOonN/hLn5MnaomkDwDvKI24prI3mAhPQVvdVta9Lf4mze8W8/duFOvUt+s4g0C9N7F7g2FbHE8QmX6dyvXsyElekQA0B9KD8MeBfDModz9j7n4CYsw6pADOZymk8jep46tOdmlrxygYxCdzqFlvbuRoCM4pzDJSGH4Wu4ds1AkqVOczyQrzt/pba8zkLabJc/mvGbi6AaGdqElYIDkLm264K4Bqnz/vNH8s2r6LxdQA7jqY8mcMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jcl0MvNwuTqFDlW4bKC7SqXz388NXThs1q6yqgGGQr8=;
 b=F1GPgGOmL3XITdS6Ee+Psco5R5LyDfpF8yUKOdZOaSTtQh62LrT7EFm5nwmbSYdqjWWhWAnDLFOvMfDNA4IQh4G+5yumWsFjnmS4FD9F+NW0/4hFM11G5YNJlamBdHVEyI7QMV1SBzL8ENCY1ylIUbGFnrCOddRi1p0EtWD7XHemc36t5qrupxspaqJKgWJFbCfxyhOkCPCj7mBZQsjBoQrtIkQas8/RKXtqC95/m2ZvmgR6In0pQUh0wuUaPJ06n99puzp1OTWILPSqtQAOR61AvcANzMcVdY4AyMPrbrzpt+lssNo6xH++XgDjmf/qrCbr3TYd9+zJZ2G3Hdi9oQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB6761.namprd12.prod.outlook.com (2603:10b6:510:1ab::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 7 May
 2025 13:53:29 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8699.026; Wed, 7 May 2025
 13:53:29 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 07 May 2025 22:52:40 +0900
Subject: [PATCH v3 13/19] gpu: nova-core: add falcon register definitions
 and base code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250507-nova-frts-v3-13-fcb02749754d@nvidia.com>
References: <20250507-nova-frts-v3-0-fcb02749754d@nvidia.com>
In-Reply-To: <20250507-nova-frts-v3-0-fcb02749754d@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: OS7PR01CA0181.jpnprd01.prod.outlook.com
 (2603:1096:604:250::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB6761:EE_
X-MS-Office365-Filtering-Correlation-Id: f67df1b9-4d75-481a-b4a0-08dd8d6e8c18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|10070799003|376014|7416014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UW5HU1pHZGx2OFEycEZMMjNsbjdQNWNtVzVoYjZsOTFURWdZM0NramgwVDNU?=
 =?utf-8?B?cm9uTU5qNnFsOXg0VlJPbnJUKzZXeEI3dmQ3SmUyUG5VSFBRY1BLVWdkUG4r?=
 =?utf-8?B?NXlxTUJUMFgvcXJJYWZ4VDZpUlRkblJWSlJoR1lHWmw2U2ZhRGVneFIyaURt?=
 =?utf-8?B?Y3h5M3RqeDhwNTd1QjFaNWtOaDVTVDhsTDc3bFJVNk01c00vTkpLSjNSS1NP?=
 =?utf-8?B?czVvZVpFbVJIUEJzbW0yWEJiSWh5OXpCcGVOOXJ2WnRkMElISDh5dGdaQU1j?=
 =?utf-8?B?VHZCalorMEZXZUQxcUpGdS91bmdPNEVaNTF4b1pFWmZXeUhXbCthNk9iWkpW?=
 =?utf-8?B?TXppbTJyazkxdSsySG9nZGhCRHM0UHpIYWpucGNSTHQ5WjVCcTF4ZnVpMjQ3?=
 =?utf-8?B?T3JPT0diSW5rT1dRRnpURmtlU2J1eW4vSGZXK0xNYlJKYWo1dGt0aSszWWR1?=
 =?utf-8?B?Vng2NzVOSG53MHNsU1U3OUhvOFZRNU02cWF2VGFMTFdwMTR5YmFPdEtickRi?=
 =?utf-8?B?RzVCQkRQL2NSVy8xcEVaa01NQjBmamlkTHJhN2NZVXg1anN1Ky9NbHFkbm00?=
 =?utf-8?B?c1ZMZmY4S0V6UDJXSUJBUGg2a3Jnc2FaYVA1eWYrQXRKUVczTElHL2hHdis1?=
 =?utf-8?B?N0k2N2ZacmcrTVBrNUFJM2c0eGZmT2dBdERTOTlrbEtkUWRCSlk0ejhCTTdl?=
 =?utf-8?B?MTJsWmRKekRHZlBnL2RtOXlqbk5HVlhiYVA1dmpCSGR3OEx5elZrYW1kODF2?=
 =?utf-8?B?RHhqM1gvUWlDM1RsVkt1QTlpb2RGZGJLT05EZWdsTGdlRHZHYlhKUE1WTWdC?=
 =?utf-8?B?ZlBWQ0VJMFRMcjRVbVNCSFl3RHd1dXFwUkVlZkFFOGx5blM2VWZKVThqN0hM?=
 =?utf-8?B?QktuUW1qRnBIY0g3WDZWYjJURGhzZmFpNmNyZ09ZMWg0VlNMbkg2aWdvZk9x?=
 =?utf-8?B?aVhCTGNoZHJIWG5PK0lmYmJkemRaSzRRZ0RHSkJDalZSd0xBRVNLdnVVVEJQ?=
 =?utf-8?B?SWNKUTZub01Ia2FxWDRnNkhwN2RXOUM5TkxVQTVWa2x1dUFUZ0ppVk0rYUR5?=
 =?utf-8?B?Q3RrcVkvb2NSa2hlUHlvaTZYSGNPSldWbndnUk5mWTZXbktMSkdpRXpPOUk1?=
 =?utf-8?B?eFhQMC9yVXl5Y2VFQWdQWnFPYmVBY1hTVVR5L2FuTFh3QnFuWXpDVlNTamJF?=
 =?utf-8?B?QU1zczNCYThZSGhiUjV6ZzVUVWt2RDhFVTZIV1phaHZaazd6dHVKbW5Pd010?=
 =?utf-8?B?T2hWVWEyWmhZejIzWE5EUmdFVVphaGYvRnVYdytvaUxBamEzeWFhYXptbmRF?=
 =?utf-8?B?MThGZzlyUzZJamUyMkYvb2dxRnVVQng0ekI4MjUyVlAxaHVjcEdCaGdXVmhG?=
 =?utf-8?B?NEp1THNtdnVTV2FvT3p6SUdUbXB6MmJBM3R1TTNKZVQ1SmQyYzRDSllEN1dy?=
 =?utf-8?B?THhBV2RMSThCYVNrN3U2U1g3eGl5K0dyaDZNUGhFQWp6MzI4NEdodnJSUTc1?=
 =?utf-8?B?Wk1GelFmYXZZalBiS05hMVZ5TjFCbXRXNE5HRS9tRlY0WGhRWXczR2p3S2Ew?=
 =?utf-8?B?V0NvTnJGZk1ISWVjb2NuNldzK0NqRmdTcm9WQVJncnJQQzBodmlxclBZRWEy?=
 =?utf-8?B?VDdJRFoybnM4UHFxcFdqek4yK3ZFZHBLVVBCL3A2TFQxRFdBKzR5ZnFSN3ZG?=
 =?utf-8?B?cWZ4QUlvS0NPVkhVZnNqWVVQZnF5NVluM1RQdGRjZ1lWVE1lUW9kQ3lUUHdh?=
 =?utf-8?B?NzVMNTNOUk5XU0lRSVZnbVBPaFhVS2tMaFhZSTdla3kxQ1pXVGVjMDM2UjdV?=
 =?utf-8?B?cWtlREFDSXZBcW9VMjZzSHBBZjdOdVgzMnFKS3hSMVpIN2NZUW5NL3Vla2dG?=
 =?utf-8?B?ek0vbVh0VmgwNnN6MHMxTXloRVdaV1hkV1d1eVc1Y0xrQUhPTmlyaEE5TjR3?=
 =?utf-8?B?dXFVeHRWSk5LaWEzYkpCaTFTaXUzVzEyQ29WTXpQT244VG55eHlXa0JVbnZ2?=
 =?utf-8?B?YzdtWEx5UkFBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(376014)(7416014)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tk9NWlBndUxSTGlleStnQ2JQaUpkK0FaaTR6dXgyU0t1Vkt2YUczYk1GbVh6?=
 =?utf-8?B?T2w3MUo0UmcrcG92MGhzL2M3NXFhdkZOZzdNZnk0Y282Q0xuS3IvNDdTYTBz?=
 =?utf-8?B?NCtsaFVQN0dJdTNLYmRiZUNHdG82cDFaQURsQytsZ1RBZThudldWQzBuT1BL?=
 =?utf-8?B?YzZaWksrTjhUZUljV09wcU40YWVEM1d0Y1hXSSs5Q0lKdjVVMDdDNmZweVVa?=
 =?utf-8?B?bnNBSC91OENxM1hhRVZKOUdNWHVyR3ZxRUtLOUgvZDAzS2pmb1duUjRxRUZT?=
 =?utf-8?B?S1IwTmVJQ0I3L2dwSVYya0dmWCtycWlDWTlwd1AwcXFEQzJ3WWRkN3Rza1JB?=
 =?utf-8?B?eHJEM1hqSlZMTksrMGI4Yk1FUGpOREM2YllTL3dZb05QUWlCV3AwTDVWSDdD?=
 =?utf-8?B?UDRTdHI5NklZK081SURUVmdFellNV0dxZlhwSDBwNW85b0JXSi9Edm8zRk4v?=
 =?utf-8?B?SVZDSVRIcXFQM3pkWm1oaWVHbGRiMVJFQ1NxMjFJYStZVFJtUmVpblJ3dHFV?=
 =?utf-8?B?b1liYWptYTVtMFFIWmRXbTBNQWpXdVhLNVJzSDVNMEtUd3AyUCt2ZUtvcEUr?=
 =?utf-8?B?a0czckgrUVJqVFBPSWpwa2ZhK0NHellzUWk0Rm0wRnVOdTgrNFVEdkNCeWlC?=
 =?utf-8?B?K2hVMmFmOXJIc1NIYWxiMExRaXRHbkM3Nk1IeUFYQUVjVWNHei93L04zY1cv?=
 =?utf-8?B?RGxFRGJRZDU1QTVqYkduajF4dlV3ekFCdTBCK0ZoMUJqMWNqekhmd2xTNjJw?=
 =?utf-8?B?TWhnMFFuYjduZVBScFRCSXY4cS9WUTc1Y1VDM2k0RzRlL2l1WHhZalJnUHlO?=
 =?utf-8?B?NDNhdmR6WjNZMHVUZkJ0YWUyUTJTZTJTSUVkMDdwdi9qSE0zd0NLYlVxYWJT?=
 =?utf-8?B?Y1lmQzd5YTd3SUY0aWFKWHZ1Mmdid2hyZEFGT2ZLdTFpRmFXT2g2Yy83MFNz?=
 =?utf-8?B?U2g5WnI1RTRMNFR5Y0FQbncxalFPUW5vNHVuY0NFWFQybkRMeEpTVGpLeFRs?=
 =?utf-8?B?OUNUbHRtbmhPbGFaWU9DdDMzWk9MTTdJOGM5a1kvbnJ2bHBCYXpOQmJzbXlI?=
 =?utf-8?B?cEZ3OGVTYW1jMmpYVC84ampIMEYwUnRHRTdmeG42d0xMMFcwcnZib1VUVkpN?=
 =?utf-8?B?dVZ1RWV3OSt4N2Vlb3FDcGZqQlJ6Wk0wV0tqZUhLVUY1cFBIRlZyZFBsUVhM?=
 =?utf-8?B?NnlSSnBCUFRJcVYwUjZ4cTFrbnNmT0N1b3o5V1RkYmF5TzA1QzdIbjF1QVY2?=
 =?utf-8?B?SHR3TGRaYTlYNTRqdzZzZjVKSTEwNm5HRXAwQXFMY2VFUTEyR1F6RU9IQTBu?=
 =?utf-8?B?WEhPT2VVblZVdzJOaVd2V1FFQXk3ZmVmRktWb0lWZS9vOEF6b0E3QW8xU2VD?=
 =?utf-8?B?d2RWejBWZlB2UElla3BpSHN0U3pJWE1BaitBQUlIbU9Ccit6ZVhJZ3BxVHFq?=
 =?utf-8?B?eW12VXZlbFBiRlYwT21WNDkyQmJidU5GcFBPVENVUkM0TnNyK3BWSGlsTGx2?=
 =?utf-8?B?bWtDMVR2L2hkcTZXQTdBR1RpekltcWpsdDRqWWFHZnlGM251VDV5QjFoaEE1?=
 =?utf-8?B?Umc1Yk5YNytWS291REN5MWV5WDcyVXUvRVd5N1FySTlOZTNnVTh3NmhvM0Iv?=
 =?utf-8?B?VjFzcHZVZFMraXFSdFN3YW9xMzRYY0pmWlp6NTZjem9YczR5ODJVcHhXUkRT?=
 =?utf-8?B?K2ZMN3lrVGVnQ0xaUStQc1Z2Z0ZOWHdkNWh5Z0MwMVN1bnJETFhEdVhxeUtD?=
 =?utf-8?B?RmZHMFUyN2IxWk9oRXFTY0dHVUNuaVBtNUZpQnVEZWhWZXBsMXNTTENSQUcr?=
 =?utf-8?B?MEtkbmtyWFd5YjJZck9DSkY3Sk80OTNJNWo1cFB1My82c3NwWG9xOFVFWE8r?=
 =?utf-8?B?UnNHL2JCOG9lR0sxREwxTzNQcFZ1WTU2Qm5rc0NrWnJxb1lmUGdhYmtjSUxT?=
 =?utf-8?B?RGc1Sjc1NmN3R1lPVkdTU3kyZzZKWkExcVJLeGRTaW9ka3JDeDhoUnRGbU5E?=
 =?utf-8?B?MFEwbkJzMHlBOCtvNDJzREFhc2pzcjEzY2swV24vSGp0dnJxdFYxY3RMOFNk?=
 =?utf-8?B?K2FWdjcxVzNoOXVNeUdoeGNuNFhKS2ZrOGFjVFRuVEp5VE1Qc2RwdTJOditt?=
 =?utf-8?B?Q2dEYWlZdTAveFBSMDBIeDlnTWNYQkh0YlVDZEhDRDJ1ckhxS1NtamI0d0VC?=
 =?utf-8?Q?r8s/WAeoEuH4uNS4SLTcmruElpahevIe9T2CiSDHttRc?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f67df1b9-4d75-481a-b4a0-08dd8d6e8c18
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 13:53:29.6252 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tn9afk6Tii72pltLcbvgvt1YM4DKdXqv/21MDFDCuAsxK6RS58penK5XryyScbyCtggYk8otvhqxhyP1RkpIkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6761
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

Add the common Falcon code and HAL for Ampere GPUs, and instantiate the
GSP and SEC2 Falcons that will be required to boot the GSP.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs           | 540 ++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/falcon/gsp.rs       |  22 ++
 drivers/gpu/nova-core/falcon/hal.rs       |  56 ++++
 drivers/gpu/nova-core/falcon/hal/ga102.rs | 120 +++++++
 drivers/gpu/nova-core/falcon/sec2.rs      |   8 +
 drivers/gpu/nova-core/gpu.rs              |  11 +
 drivers/gpu/nova-core/nova_core.rs        |   1 +
 drivers/gpu/nova-core/regs.rs             | 125 +++++++
 drivers/gpu/nova-core/util.rs             |   1 -
 9 files changed, 883 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
new file mode 100644
index 0000000000000000000000000000000000000000..b6552496ad9c5f8eeda4beaa757c7393f495072b
--- /dev/null
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -0,0 +1,540 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Falcon microprocessor base support
+
+// To be removed when all code is used.
+#![expect(dead_code)]
+
+use core::time::Duration;
+use hal::FalconHal;
+use kernel::bindings;
+use kernel::device;
+use kernel::prelude::*;
+use kernel::sync::Arc;
+use kernel::types::ARef;
+
+use crate::driver::Bar0;
+use crate::gpu::Chipset;
+use crate::regs;
+use crate::util;
+
+pub(crate) mod gsp;
+mod hal;
+pub(crate) mod sec2;
+
+/// Revision number of a falcon core, used in the [`crate::regs::NV_PFALCON_FALCON_HWCFG1`]
+/// register.
+#[repr(u8)]
+#[derive(Debug, Default, Copy, Clone, PartialEq, Eq, PartialOrd, Ord)]
+pub(crate) enum FalconCoreRev {
+    #[default]
+    Rev1 = 1,
+    Rev2 = 2,
+    Rev3 = 3,
+    Rev4 = 4,
+    Rev5 = 5,
+    Rev6 = 6,
+    Rev7 = 7,
+}
+
+impl TryFrom<u8> for FalconCoreRev {
+    type Error = Error;
+
+    fn try_from(value: u8) -> core::result::Result<Self, Self::Error> {
+        use FalconCoreRev::*;
+
+        let rev = match value {
+            1 => Rev1,
+            2 => Rev2,
+            3 => Rev3,
+            4 => Rev4,
+            5 => Rev5,
+            6 => Rev6,
+            7 => Rev7,
+            _ => return Err(EINVAL),
+        };
+
+        Ok(rev)
+    }
+}
+
+/// Revision subversion number of a falcon core, used in the
+/// [`crate::regs::NV_PFALCON_FALCON_HWCFG1`] register.
+#[repr(u8)]
+#[derive(Debug, Default, Copy, Clone, PartialEq, Eq, PartialOrd, Ord)]
+pub(crate) enum FalconCoreRevSubversion {
+    #[default]
+    Subversion0 = 0,
+    Subversion1 = 1,
+    Subversion2 = 2,
+    Subversion3 = 3,
+}
+
+impl TryFrom<u8> for FalconCoreRevSubversion {
+    type Error = Error;
+
+    fn try_from(value: u8) -> Result<Self> {
+        use FalconCoreRevSubversion::*;
+
+        let sub_version = match value & 0b11 {
+            0 => Subversion0,
+            1 => Subversion1,
+            2 => Subversion2,
+            3 => Subversion3,
+            _ => return Err(EINVAL),
+        };
+
+        Ok(sub_version)
+    }
+}
+
+/// Security model of a falcon core, used in the [`crate::regs::NV_PFALCON_FALCON_HWCFG1`]
+/// register.
+#[repr(u8)]
+#[derive(Debug, Default, Copy, Clone)]
+pub(crate) enum FalconSecurityModel {
+    /// Non-Secure: runs unsigned code without privileges.
+    #[default]
+    None = 0,
+    /// Low-secure: runs unsigned code with some privileges. Can only be entered from `Heavy` mode.
+    Light = 2,
+    /// High-Secure: runs signed code with full privileges.
+    Heavy = 3,
+}
+
+impl TryFrom<u8> for FalconSecurityModel {
+    type Error = Error;
+
+    fn try_from(value: u8) -> core::result::Result<Self, Self::Error> {
+        use FalconSecurityModel::*;
+
+        let sec_model = match value {
+            0 => None,
+            2 => Light,
+            3 => Heavy,
+            _ => return Err(EINVAL),
+        };
+
+        Ok(sec_model)
+    }
+}
+
+/// Signing algorithm for a given firmware, used in the [`crate::regs::NV_PFALCON2_FALCON_MOD_SEL`]
+/// register.
+#[repr(u8)]
+#[derive(Debug, Default, Copy, Clone, PartialEq, Eq)]
+pub(crate) enum FalconModSelAlgo {
+    /// RSA3K.
+    #[default]
+    Rsa3k = 1,
+}
+
+impl TryFrom<u8> for FalconModSelAlgo {
+    type Error = Error;
+
+    fn try_from(value: u8) -> core::result::Result<Self, Self::Error> {
+        match value {
+            1 => Ok(FalconModSelAlgo::Rsa3k),
+            _ => Err(EINVAL),
+        }
+    }
+}
+
+/// Valid values for the `size` field of the [`crate::regs::NV_PFALCON_FALCON_DMATRFCMD`] register.
+#[repr(u8)]
+#[derive(Debug, Default, Copy, Clone, PartialEq, Eq)]
+pub(crate) enum DmaTrfCmdSize {
+    /// 256 bytes transfer.
+    #[default]
+    Size256B = 0x6,
+}
+
+impl TryFrom<u8> for DmaTrfCmdSize {
+    type Error = Error;
+
+    fn try_from(value: u8) -> Result<Self> {
+        match value {
+            0x6 => Ok(Self::Size256B),
+            _ => Err(EINVAL),
+        }
+    }
+}
+
+/// Currently active core on a dual falcon/riscv (Peregrine) controller.
+#[derive(Debug, Clone, Copy, PartialEq, Eq)]
+pub(crate) enum PeregrineCoreSelect {
+    /// Falcon core is active.
+    Falcon = 0,
+    /// RISC-V core is active.
+    Riscv = 1,
+}
+
+impl From<bool> for PeregrineCoreSelect {
+    fn from(value: bool) -> Self {
+        match value {
+            false => PeregrineCoreSelect::Falcon,
+            true => PeregrineCoreSelect::Riscv,
+        }
+    }
+}
+
+/// Different types of memory present in a falcon core.
+#[derive(Debug, Clone, Copy, PartialEq, Eq)]
+pub(crate) enum FalconMem {
+    /// Instruction Memory.
+    Imem,
+    /// Data Memory.
+    Dmem,
+}
+
+/// Target/source of a DMA transfer to/from falcon memory.
+#[derive(Debug, Clone, Default)]
+pub(crate) enum FalconFbifTarget {
+    /// VRAM.
+    #[default]
+    LocalFb = 0,
+    /// Coherent system memory.
+    CoherentSysmem = 1,
+    /// Non-coherent system memory.
+    NoncoherentSysmem = 2,
+}
+
+impl TryFrom<u8> for FalconFbifTarget {
+    type Error = Error;
+
+    fn try_from(value: u8) -> core::result::Result<Self, Self::Error> {
+        let res = match value {
+            0 => Self::LocalFb,
+            1 => Self::CoherentSysmem,
+            2 => Self::NoncoherentSysmem,
+            _ => return Err(EINVAL),
+        };
+
+        Ok(res)
+    }
+}
+
+/// Type of memory addresses to use.
+#[derive(Debug, Clone, Default)]
+pub(crate) enum FalconFbifMemType {
+    /// Physical memory addresses.
+    #[default]
+    Virtual = 0,
+    /// Virtual memory addresses.
+    Physical = 1,
+}
+
+impl From<bool> for FalconFbifMemType {
+    fn from(value: bool) -> Self {
+        match value {
+            false => Self::Virtual,
+            true => Self::Physical,
+        }
+    }
+}
+
+/// Trait defining the parameters of a given Falcon instance.
+pub(crate) trait FalconEngine: Sync {
+    /// Base I/O address for the falcon, relative from which its registers are accessed.
+    const BASE: usize;
+}
+
+/// Represents a portion of the firmware to be loaded into a particular memory (e.g. IMEM or DMEM).
+#[derive(Debug)]
+pub(crate) struct FalconLoadTarget {
+    /// Offset from the start of the source object to copy from.
+    pub(crate) src_start: u32,
+    /// Offset from the start of the destination memory to copy into.
+    pub(crate) dst_start: u32,
+    /// Number of bytes to copy.
+    pub(crate) len: u32,
+}
+
+/// Parameters for the falcon boot ROM.
+#[derive(Debug)]
+pub(crate) struct FalconBromParams {
+    /// Offset in `DMEM`` of the firmware's signature.
+    pub(crate) pkc_data_offset: u32,
+    /// Mask of engines valid for this firmware.
+    pub(crate) engine_id_mask: u16,
+    /// ID of the ucode used to infer a fuse register to validate the signature.
+    pub(crate) ucode_id: u8,
+}
+
+/// Trait for a falcon firmware.
+pub(crate) trait FalconFirmware {
+    /// Engine on which this firmware is to be loaded.
+    type Target: FalconEngine;
+
+    /// Returns the DMA handle of the object containing the firmware.
+    fn dma_handle(&self) -> bindings::dma_addr_t;
+
+    /// Returns the load parameters for `IMEM`.
+    fn imem_load(&self) -> FalconLoadTarget;
+
+    /// Returns the load parameters for `DMEM`.
+    fn dmem_load(&self) -> FalconLoadTarget;
+
+    /// Returns the parameters to write into the BROM registers.
+    fn brom_params(&self) -> FalconBromParams;
+
+    /// Returns the start address of the firmware.
+    fn boot_addr(&self) -> u32;
+}
+
+/// Contains the base parameters common to all Falcon instances.
+pub(crate) struct Falcon<E: FalconEngine> {
+    hal: Arc<dyn FalconHal<E>>,
+    dev: ARef<device::Device>,
+}
+
+impl<E: FalconEngine + 'static> Falcon<E> {
+    /// Create a new falcon instance.
+    ///
+    /// `need_riscv` is set to `true` if the caller expects the falcon to be a dual falcon/riscv
+    /// controller.
+    pub(crate) fn new(
+        dev: &device::Device,
+        chipset: Chipset,
+        bar: &Bar0,
+        need_riscv: bool,
+    ) -> Result<Self> {
+        let hwcfg1 = regs::NV_PFALCON_FALCON_HWCFG1::read(bar, E::BASE);
+        // Ensure that the revision and security model contain valid values.
+        let _rev = hwcfg1.core_rev()?;
+        let _sec_model = hwcfg1.security_model()?;
+
+        if need_riscv {
+            let hwcfg2 = regs::NV_PFALCON_FALCON_HWCFG2::read(bar, E::BASE);
+            if !hwcfg2.riscv() {
+                dev_err!(
+                    dev,
+                    "riscv support requested on a controller that does not support it\n"
+                );
+                return Err(EINVAL);
+            }
+        }
+
+        Ok(Self {
+            hal: hal::create_falcon_hal(chipset)?,
+            dev: dev.into(),
+        })
+    }
+
+    /// Wait for memory scrubbing to complete.
+    fn reset_wait_mem_scrubbing(&self, bar: &Bar0) -> Result<()> {
+        util::wait_on(Duration::from_millis(20), || {
+            let r = regs::NV_PFALCON_FALCON_HWCFG2::read(bar, E::BASE);
+            if r.mem_scrubbing() {
+                Some(())
+            } else {
+                None
+            }
+        })
+    }
+
+    /// Reset the falcon engine.
+    fn reset_eng(&self, bar: &Bar0) -> Result<()> {
+        let _ = regs::NV_PFALCON_FALCON_HWCFG2::read(bar, E::BASE);
+
+        // According to OpenRM's `kflcnPreResetWait_GA102` documentation, HW sometimes does not set
+        // RESET_READY so a non-failing timeout is used.
+        let _ = util::wait_on(Duration::from_micros(150), || {
+            let r = regs::NV_PFALCON_FALCON_HWCFG2::read(bar, E::BASE);
+            if r.reset_ready() {
+                Some(())
+            } else {
+                None
+            }
+        });
+
+        regs::NV_PFALCON_FALCON_ENGINE::alter(bar, E::BASE, |v| v.set_reset(true));
+
+        let _: Result<()> = util::wait_on(Duration::from_micros(10), || None);
+
+        regs::NV_PFALCON_FALCON_ENGINE::alter(bar, E::BASE, |v| v.set_reset(false));
+
+        self.reset_wait_mem_scrubbing(bar)?;
+
+        Ok(())
+    }
+
+    /// Reset the controller, select the falcon core, and wait for memory scrubbing to complete.
+    pub(crate) fn reset(&self, bar: &Bar0) -> Result<()> {
+        self.reset_eng(bar)?;
+        self.hal.select_core(self, bar)?;
+        self.reset_wait_mem_scrubbing(bar)?;
+
+        regs::NV_PFALCON_FALCON_RM::default()
+            .set_value(regs::NV_PMC_BOOT_0::read(bar).into())
+            .write(bar, E::BASE);
+
+        Ok(())
+    }
+
+    /// Perform a DMA write according to `load_offsets` from `dma_handle` into the falcon's
+    /// `target_mem`.
+    ///
+    /// `sec` is set if the loaded firmware is expected to run in secure mode.
+    fn dma_wr(
+        &self,
+        bar: &Bar0,
+        dma_handle: bindings::dma_addr_t,
+        target_mem: FalconMem,
+        load_offsets: FalconLoadTarget,
+        sec: bool,
+    ) -> Result<()> {
+        const DMA_LEN: u32 = 256;
+
+        // For IMEM, we want to use the start offset as a virtual address tag for each page, since
+        // code addresses in the firmware (and the boot vector) are virtual.
+        //
+        // For DMEM we can fold the start offset into the DMA handle.
+        let (src_start, dma_start) = match target_mem {
+            FalconMem::Imem => (load_offsets.src_start, dma_handle),
+            FalconMem::Dmem => (
+                0,
+                dma_handle + load_offsets.src_start as bindings::dma_addr_t,
+            ),
+        };
+        if dma_start % DMA_LEN as bindings::dma_addr_t > 0 {
+            dev_err!(
+                self.dev,
+                "DMA transfer start addresses must be a multiple of {}",
+                DMA_LEN
+            );
+            return Err(EINVAL);
+        }
+        if load_offsets.len % DMA_LEN > 0 {
+            dev_err!(
+                self.dev,
+                "DMA transfer length must be a multiple of {}",
+                DMA_LEN
+            );
+            return Err(EINVAL);
+        }
+
+        // Set up the base source DMA address.
+
+        regs::NV_PFALCON_FALCON_DMATRFBASE::default()
+            .set_base((dma_start >> 8) as u32)
+            .write(bar, E::BASE);
+        regs::NV_PFALCON_FALCON_DMATRFBASE1::default()
+            .set_base((dma_start >> 40) as u16)
+            .write(bar, E::BASE);
+
+        let cmd = regs::NV_PFALCON_FALCON_DMATRFCMD::default()
+            .set_size(DmaTrfCmdSize::Size256B)
+            .set_imem(target_mem == FalconMem::Imem)
+            .set_sec(if sec { 1 } else { 0 });
+
+        for pos in (0..load_offsets.len).step_by(DMA_LEN as usize) {
+            // Perform a transfer of size `DMA_LEN`.
+            regs::NV_PFALCON_FALCON_DMATRFMOFFS::default()
+                .set_offs(load_offsets.dst_start + pos)
+                .write(bar, E::BASE);
+            regs::NV_PFALCON_FALCON_DMATRFFBOFFS::default()
+                .set_offs(src_start + pos)
+                .write(bar, E::BASE);
+            cmd.write(bar, E::BASE);
+
+            // Wait for the transfer to complete.
+            util::wait_on(Duration::from_millis(2000), || {
+                let r = regs::NV_PFALCON_FALCON_DMATRFCMD::read(bar, E::BASE);
+                if r.idle() {
+                    Some(())
+                } else {
+                    None
+                }
+            })?;
+        }
+
+        Ok(())
+    }
+
+    /// Perform a DMA load into `IMEM` and `DMEM` of `fw`, and prepare the falcon to run it.
+    pub(crate) fn dma_load<F: FalconFirmware<Target = E>>(&self, bar: &Bar0, fw: &F) -> Result<()> {
+        let dma_handle = fw.dma_handle();
+
+        regs::NV_PFALCON_FBIF_CTL::alter(bar, E::BASE, |v| v.set_allow_phys_no_ctx(true));
+        regs::NV_PFALCON_FALCON_DMACTL::default().write(bar, E::BASE);
+        regs::NV_PFALCON_FBIF_TRANSCFG::alter(bar, E::BASE, |v| {
+            v.set_target(FalconFbifTarget::CoherentSysmem)
+                .set_mem_type(FalconFbifMemType::Physical)
+        });
+
+        self.dma_wr(bar, dma_handle, FalconMem::Imem, fw.imem_load(), true)?;
+        self.dma_wr(bar, dma_handle, FalconMem::Dmem, fw.dmem_load(), true)?;
+
+        self.hal.program_brom(self, bar, &fw.brom_params())?;
+
+        // Set `BootVec` to start of non-secure code.
+        regs::NV_PFALCON_FALCON_BOOTVEC::default()
+            .set_value(fw.boot_addr())
+            .write(bar, E::BASE);
+
+        Ok(())
+    }
+
+    /// Start running the loaded firmware.
+    ///
+    /// `mbox0` and `mbox1` are optional parameters to write into the `MBOX0` and `MBOX1` registers
+    /// prior to running.
+    ///
+    /// Returns `MBOX0` and `MBOX1` after the firmware has stopped running.
+    pub(crate) fn boot(
+        &self,
+        bar: &Bar0,
+        mbox0: Option<u32>,
+        mbox1: Option<u32>,
+    ) -> Result<(u32, u32)> {
+        if let Some(mbox0) = mbox0 {
+            regs::NV_PFALCON_FALCON_MAILBOX0::default()
+                .set_value(mbox0)
+                .write(bar, E::BASE);
+        }
+
+        if let Some(mbox1) = mbox1 {
+            regs::NV_PFALCON_FALCON_MAILBOX1::default()
+                .set_value(mbox1)
+                .write(bar, E::BASE);
+        }
+
+        match regs::NV_PFALCON_FALCON_CPUCTL::read(bar, E::BASE).alias_en() {
+            true => regs::NV_PFALCON_FALCON_CPUCTL_ALIAS::default()
+                .set_startcpu(true)
+                .write(bar, E::BASE),
+            false => regs::NV_PFALCON_FALCON_CPUCTL::default()
+                .set_startcpu(true)
+                .write(bar, E::BASE),
+        }
+
+        util::wait_on(Duration::from_secs(2), || {
+            let r = regs::NV_PFALCON_FALCON_CPUCTL::read(bar, E::BASE);
+            if r.halted() {
+                Some(())
+            } else {
+                None
+            }
+        })?;
+
+        let (mbox0, mbox1) = (
+            regs::NV_PFALCON_FALCON_MAILBOX0::read(bar, E::BASE).value(),
+            regs::NV_PFALCON_FALCON_MAILBOX1::read(bar, E::BASE).value(),
+        );
+
+        Ok((mbox0, mbox1))
+    }
+
+    /// Returns the fused version of the signature to use in order to run a HS firmware on this
+    /// falcon instance. `engine_id_mask` and `ucode_id` are obtained from the firmware header.
+    pub(crate) fn get_signature_reg_fuse_version(
+        &self,
+        bar: &Bar0,
+        engine_id_mask: u16,
+        ucode_id: u8,
+    ) -> Result<u32> {
+        self.hal
+            .get_signature_reg_fuse_version(self, bar, engine_id_mask, ucode_id)
+    }
+}
diff --git a/drivers/gpu/nova-core/falcon/gsp.rs b/drivers/gpu/nova-core/falcon/gsp.rs
new file mode 100644
index 0000000000000000000000000000000000000000..f74aeadaee9ae96bb1961d3c55b2cf1999943377
--- /dev/null
+++ b/drivers/gpu/nova-core/falcon/gsp.rs
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use crate::{
+    driver::Bar0,
+    falcon::{Falcon, FalconEngine},
+    regs,
+};
+
+pub(crate) struct Gsp;
+impl FalconEngine for Gsp {
+    const BASE: usize = 0x00110000;
+}
+
+impl Falcon<Gsp> {
+    /// Clears the SWGEN0 bit in the Falcon's IRQ status clear register to
+    /// allow GSP to signal CPU for processing new messages in message queue.
+    pub(crate) fn clear_swgen0_intr(&self, bar: &Bar0) {
+        regs::NV_PFALCON_FALCON_IRQSCLR::default()
+            .set_swgen0(true)
+            .write(bar, Gsp::BASE);
+    }
+}
diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/falcon/hal.rs
new file mode 100644
index 0000000000000000000000000000000000000000..0b0ab8174caafeec3a2a2ba8211a740b7feadb75
--- /dev/null
+++ b/drivers/gpu/nova-core/falcon/hal.rs
@@ -0,0 +1,56 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use kernel::prelude::*;
+use kernel::sync::Arc;
+
+use crate::driver::Bar0;
+use crate::falcon::{Falcon, FalconBromParams, FalconEngine};
+use crate::gpu::Chipset;
+
+mod ga102;
+
+/// Hardware Abstraction Layer for Falcon cores.
+///
+/// Implements chipset-specific low-level operations. The trait is generic against [`FalconEngine`]
+/// so its `BASE` parameter can be used in order to avoid runtime bound checks when accessing
+/// registers.
+pub(crate) trait FalconHal<E: FalconEngine>: Sync {
+    // Activates the Falcon core if the engine is a risvc/falcon dual engine.
+    fn select_core(&self, _falcon: &Falcon<E>, _bar: &Bar0) -> Result<()> {
+        Ok(())
+    }
+
+    /// Returns the fused version of the signature to use in order to run a HS firmware on this
+    /// falcon instance. `engine_id_mask` and `ucode_id` are obtained from the firmware header.
+    fn get_signature_reg_fuse_version(
+        &self,
+        falcon: &Falcon<E>,
+        bar: &Bar0,
+        engine_id_mask: u16,
+        ucode_id: u8,
+    ) -> Result<u32>;
+
+    // Program the boot ROM registers prior to starting a secure firmware.
+    fn program_brom(&self, falcon: &Falcon<E>, bar: &Bar0, params: &FalconBromParams)
+        -> Result<()>;
+}
+
+/// Returns a boxed falcon HAL adequate for the passed `chipset`.
+///
+/// We use this function and a heap-allocated trait object instead of statically defined trait
+/// objects because of the two-dimensional (Chipset, Engine) lookup required to return the
+/// requested HAL.
+///
+/// TODO: replace the return type with `KBox` once it gains the ability to host trait objects.
+pub(crate) fn create_falcon_hal<E: FalconEngine + 'static>(
+    chipset: Chipset,
+) -> Result<Arc<dyn FalconHal<E>>> {
+    let hal = match chipset {
+        Chipset::GA102 | Chipset::GA103 | Chipset::GA104 | Chipset::GA106 | Chipset::GA107 => {
+            Arc::new(ga102::Ga102::<E>::new(), GFP_KERNEL)? as Arc<dyn FalconHal<E>>
+        }
+        _ => return Err(ENOTSUPP),
+    };
+
+    Ok(hal)
+}
diff --git a/drivers/gpu/nova-core/falcon/hal/ga102.rs b/drivers/gpu/nova-core/falcon/hal/ga102.rs
new file mode 100644
index 0000000000000000000000000000000000000000..68d807c192a16a908f40b65f9b03d107f4042b63
--- /dev/null
+++ b/drivers/gpu/nova-core/falcon/hal/ga102.rs
@@ -0,0 +1,120 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use core::marker::PhantomData;
+use core::time::Duration;
+
+use kernel::{device, prelude::*};
+
+use crate::driver::Bar0;
+use crate::falcon::{
+    Falcon, FalconBromParams, FalconEngine, FalconModSelAlgo, PeregrineCoreSelect,
+};
+use crate::regs;
+use crate::util;
+
+use super::FalconHal;
+
+fn select_core_ga102<E: FalconEngine>(bar: &Bar0) -> Result<()> {
+    let bcr_ctrl = regs::NV_PRISCV_RISCV_BCR_CTRL::read(bar, E::BASE);
+    if bcr_ctrl.core_select() != PeregrineCoreSelect::Falcon {
+        regs::NV_PRISCV_RISCV_BCR_CTRL::default()
+            .set_core_select(PeregrineCoreSelect::Falcon)
+            .write(bar, E::BASE);
+
+        util::wait_on(Duration::from_millis(10), || {
+            let r = regs::NV_PRISCV_RISCV_BCR_CTRL::read(bar, E::BASE);
+            if r.valid() {
+                Some(())
+            } else {
+                None
+            }
+        })?;
+    }
+
+    Ok(())
+}
+
+fn get_signature_reg_fuse_version_ga102(
+    dev: &device::Device,
+    bar: &Bar0,
+    engine_id_mask: u16,
+    ucode_id: u8,
+) -> Result<u32> {
+    // The ucode fuse versions are contained in the FUSE_OPT_FPF_<ENGINE>_UCODE<X>_VERSION
+    // registers, which are an array. Our register definition macros do not allow us to manage them
+    // properly, so we need to hardcode their addresses for now.
+
+    // Each engine has 16 ucode version registers numbered from 1 to 16.
+    if ucode_id == 0 || ucode_id > 16 {
+        dev_warn!(dev, "invalid ucode id {:#x}", ucode_id);
+        return Err(EINVAL);
+    }
+    let reg_fuse = if engine_id_mask & 0x0001 != 0 {
+        // NV_FUSE_OPT_FPF_SEC2_UCODE1_VERSION
+        0x824140
+    } else if engine_id_mask & 0x0004 != 0 {
+        // NV_FUSE_OPT_FPF_NVDEC_UCODE1_VERSION
+        0x824100
+    } else if engine_id_mask & 0x0400 != 0 {
+        // NV_FUSE_OPT_FPF_GSP_UCODE1_VERSION
+        0x8241c0
+    } else {
+        dev_warn!(dev, "unexpected engine_id_mask {:#x}", engine_id_mask);
+        return Err(EINVAL);
+    } + ((ucode_id - 1) as usize * core::mem::size_of::<u32>());
+
+    let reg_fuse_version = bar.read32(reg_fuse);
+
+    // Equivalent of Find Last Set bit.
+    Ok(u32::BITS - reg_fuse_version.leading_zeros())
+}
+
+fn program_brom_ga102<E: FalconEngine>(bar: &Bar0, params: &FalconBromParams) -> Result<()> {
+    regs::NV_PFALCON2_FALCON_BROM_PARAADDR::default()
+        .set_value(params.pkc_data_offset)
+        .write(bar, E::BASE);
+    regs::NV_PFALCON2_FALCON_BROM_ENGIDMASK::default()
+        .set_value(params.engine_id_mask as u32)
+        .write(bar, E::BASE);
+    regs::NV_PFALCON2_FALCON_BROM_CURR_UCODE_ID::default()
+        .set_ucode_id(params.ucode_id)
+        .write(bar, E::BASE);
+    regs::NV_PFALCON2_FALCON_MOD_SEL::default()
+        .set_algo(FalconModSelAlgo::Rsa3k)
+        .write(bar, E::BASE);
+
+    Ok(())
+}
+
+pub(super) struct Ga102<E: FalconEngine>(PhantomData<E>);
+
+impl<E: FalconEngine> Ga102<E> {
+    pub(super) fn new() -> Self {
+        Self(PhantomData)
+    }
+}
+
+impl<E: FalconEngine> FalconHal<E> for Ga102<E> {
+    fn select_core(&self, _falcon: &Falcon<E>, bar: &Bar0) -> Result<()> {
+        select_core_ga102::<E>(bar)
+    }
+
+    fn get_signature_reg_fuse_version(
+        &self,
+        falcon: &Falcon<E>,
+        bar: &Bar0,
+        engine_id_mask: u16,
+        ucode_id: u8,
+    ) -> Result<u32> {
+        get_signature_reg_fuse_version_ga102(&falcon.dev, bar, engine_id_mask, ucode_id)
+    }
+
+    fn program_brom(
+        &self,
+        _falcon: &Falcon<E>,
+        bar: &Bar0,
+        params: &FalconBromParams,
+    ) -> Result<()> {
+        program_brom_ga102::<E>(bar, params)
+    }
+}
diff --git a/drivers/gpu/nova-core/falcon/sec2.rs b/drivers/gpu/nova-core/falcon/sec2.rs
new file mode 100644
index 0000000000000000000000000000000000000000..c1efdaa7c4e1b8c04c4e041aae3b61a8b65f656b
--- /dev/null
+++ b/drivers/gpu/nova-core/falcon/sec2.rs
@@ -0,0 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use crate::falcon::FalconEngine;
+
+pub(crate) struct Sec2;
+impl FalconEngine for Sec2 {
+    const BASE: usize = 0x00840000;
+}
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index c338da69ecbc2200f1ef3061a4d62971b021e3eb..ece13594fba687f3f714e255b5436e72d80dece3 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -5,6 +5,7 @@
 use crate::devinit;
 use crate::dma::DmaObject;
 use crate::driver::Bar0;
+use crate::falcon::{gsp::Gsp, sec2::Sec2, Falcon};
 use crate::firmware::Firmware;
 use crate::regs;
 use crate::util;
@@ -227,6 +228,16 @@ pub(crate) fn new(
             page
         };
 
+        let gsp_falcon = Falcon::<Gsp>::new(
+            pdev.as_ref(),
+            spec.chipset,
+            bar,
+            spec.chipset > Chipset::GA100,
+        )?;
+        gsp_falcon.clear_swgen0_intr(bar);
+
+        let _sec2_falcon = Falcon::<Sec2>::new(pdev.as_ref(), spec.chipset, bar, true)?;
+
         Ok(pin_init!(Self {
             spec,
             bar: devres_bar,
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index 1c7333e9fabe357f3ecbc6944ca98b66fa17c9a5..8342482a1aa16da2e69f7d99143c1549a82c969e 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -5,6 +5,7 @@
 mod devinit;
 mod dma;
 mod driver;
+mod falcon;
 mod firmware;
 mod gpu;
 mod regs;
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 218cb6441eb0e5c6e5b52eabba006163eec0c8b4..b5c6eeb6ed873a06b4aefcb375f4944eb0b20597 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -9,6 +9,10 @@
 #[macro_use]
 mod macros;
 
+use crate::falcon::{
+    DmaTrfCmdSize, FalconCoreRev, FalconCoreRevSubversion, FalconFbifMemType, FalconFbifTarget,
+    FalconModSelAlgo, FalconSecurityModel, PeregrineCoreSelect,
+};
 use crate::gpu::{Architecture, Chipset};
 
 /* PMC */
@@ -59,3 +63,124 @@ pub(crate) fn chipset(self) -> Result<Chipset, Error> {
 register!(NV_PGC6_AON_SECURE_SCRATCH_GROUP_05 @ 0x00118234 {
     31:0    value as u32;
 });
+
+/* PFALCON */
+
+register!(NV_PFALCON_FALCON_IRQSCLR @ +0x00000004 {
+    4:4     halt as bool;
+    6:6     swgen0 as bool;
+});
+
+register!(NV_PFALCON_FALCON_MAILBOX0 @ +0x00000040 {
+    31:0    value as u32;
+});
+
+register!(NV_PFALCON_FALCON_MAILBOX1 @ +0x00000044 {
+    31:0    value as u32;
+});
+
+register!(NV_PFALCON_FALCON_RM @ +0x00000084 {
+    31:0    value as u32;
+});
+
+register!(NV_PFALCON_FALCON_HWCFG2 @ +0x000000f4 {
+    10:10   riscv as bool;
+    12:12   mem_scrubbing as bool;
+    31:31   reset_ready as bool, "Signal indicating that reset is completed (GA102+)";
+});
+
+register!(NV_PFALCON_FALCON_CPUCTL @ +0x00000100 {
+    1:1     startcpu as bool;
+    4:4     halted as bool;
+    6:6     alias_en as bool;
+});
+
+register!(NV_PFALCON_FALCON_BOOTVEC @ +0x00000104 {
+    31:0    value as u32;
+});
+
+register!(NV_PFALCON_FALCON_DMACTL @ +0x0000010c {
+    0:0     require_ctx as bool;
+    1:1     dmem_scrubbing as bool;
+    2:2     imem_scrubbing as bool;
+    6:3     dmaq_num as u8;
+    7:7     secure_stat as bool;
+});
+
+register!(NV_PFALCON_FALCON_DMATRFBASE @ +0x00000110 {
+    31:0    base as u32;
+});
+
+register!(NV_PFALCON_FALCON_DMATRFMOFFS @ +0x00000114 {
+    23:0    offs as u32;
+});
+
+register!(NV_PFALCON_FALCON_DMATRFCMD @ +0x00000118 {
+    0:0     full as bool;
+    1:1     idle as bool;
+    3:2     sec as u8;
+    4:4     imem as bool;
+    5:5     is_write as bool;
+    10:8    size as u8 ?=> DmaTrfCmdSize;
+    14:12   ctxdma as u8;
+    16:16   set_dmtag as u8;
+});
+
+register!(NV_PFALCON_FALCON_DMATRFFBOFFS @ +0x0000011c {
+    31:0    offs as u32;
+});
+
+register!(NV_PFALCON_FALCON_DMATRFBASE1 @ +0x00000128 {
+    8:0     base as u16;
+});
+
+register!(NV_PFALCON_FALCON_HWCFG1 @ +0x0000012c {
+    3:0     core_rev as u8 ?=> FalconCoreRev, "Core revision";
+    5:4     security_model as u8 ?=> FalconSecurityModel, "Security model";
+    7:6     core_rev_subversion as u8 ?=> FalconCoreRevSubversion, "Core revision subversion";
+});
+
+register!(NV_PFALCON_FALCON_CPUCTL_ALIAS @ +0x00000130 {
+    1:1     startcpu as bool;
+});
+
+// Actually known as `NV_PSEC_FALCON_ENGINE` and `NV_PGSP_FALCON_ENGINE` depending on the falcon
+// instance.
+register!(NV_PFALCON_FALCON_ENGINE @ +0x000003c0 {
+    0:0     reset as bool;
+});
+
+// TODO: this is an array of registers.
+register!(NV_PFALCON_FBIF_TRANSCFG @ +0x00000600 {
+    1:0     target as u8 ?=> FalconFbifTarget;
+    2:2     mem_type as bool => FalconFbifMemType;
+});
+
+register!(NV_PFALCON_FBIF_CTL @ +0x00000624 {
+    7:7     allow_phys_no_ctx as bool;
+});
+
+register!(NV_PFALCON2_FALCON_MOD_SEL @ +0x00001180 {
+    7:0     algo as u8 ?=> FalconModSelAlgo;
+});
+
+register!(NV_PFALCON2_FALCON_BROM_CURR_UCODE_ID @ +0x00001198 {
+    7:0    ucode_id as u8;
+});
+
+register!(NV_PFALCON2_FALCON_BROM_ENGIDMASK @ +0x0000119c {
+    31:0    value as u32;
+});
+
+// TODO: this is an array of registers.
+register!(NV_PFALCON2_FALCON_BROM_PARAADDR @ +0x00001210 {
+    31:0    value as u32;
+});
+
+/* PRISCV */
+
+register!(NV_PRISCV_RISCV_BCR_CTRL @ +0x00001668 {
+    0:0     valid as bool;
+    4:4     core_select as bool => PeregrineCoreSelect;
+    8:8     br_fetch as bool;
+});
diff --git a/drivers/gpu/nova-core/util.rs b/drivers/gpu/nova-core/util.rs
index afb525228431a2645afe7bb34988e9537757b1d7..81fcfff1f6f437d2f6a2130ce2249fbf4c1501be 100644
--- a/drivers/gpu/nova-core/util.rs
+++ b/drivers/gpu/nova-core/util.rs
@@ -34,7 +34,6 @@ pub(crate) const fn const_bytes_to_str(bytes: &[u8]) -> &str {
 ///
 /// TODO: replace with `read_poll_timeout` once it is available.
 /// (https://lore.kernel.org/lkml/20250220070611.214262-8-fujita.tomonori@gmail.com/)
-#[expect(dead_code)]
 pub(crate) fn wait_on<R, F: Fn() -> Option<R>>(timeout: Duration, cond: F) -> Result<R> {
     let start_time = Ktime::ktime_get();
 

-- 
2.49.0


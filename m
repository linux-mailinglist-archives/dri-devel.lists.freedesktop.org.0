Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78041AA5EB8
	for <lists+dri-devel@lfdr.de>; Thu,  1 May 2025 14:59:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98FA710E822;
	Thu,  1 May 2025 12:59:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="hTmHjau3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2073.outbound.protection.outlook.com [40.107.236.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 235A510E35A;
 Thu,  1 May 2025 12:59:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dm7vUuJKwxI3tnIxwb1v1K5xtET381kt5x86H08/0GneA+N1Yen9la/MEbNAKwQhk4y5eNvbEtjV8R2jGeyBSXLp5ekRD79j5932lLFkSMd6IxpM4MegngYvojRo+/R/m5iWGc7jUXZbSlwan2xZE8CresWEnDpJMuNqpGktjQb0+Umt1RgRpwRs0BK3FHNCCO4JOZ2jA5WEEE1Xci+HX3+bYicFXViZGMm329C2toZI4G27S4vOi+ScmcBaHdA7uJ617ez9xuPWa93jf9Wo5TqxPF9Tw4BMGHBgkWoamQ4Z1GJo1m+iaPe/J7VAJBpCagwPc6c1SYpB8WPqXLNnjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XmWSj57R3v+UIceJhRruaNFfPcJL96GvOx+Ep5xc3PM=;
 b=xCm/327x8UpdSgxCG5G9XOOMcPkiTO6HhIffqVCttHrHLN/JG/yFRq6lUUYL4JmGsnJOfXD0LhHCY6ntr954glcvdUZAKi/VU7HenwqRRQXvhJNhr4N5ECa9GAPjJm9HKe60paERE9pDk4oitf+/+EVEeA8mJBIhpHXqVLmbSomiX/rWIOwtavMXWoz1KEhsXjnnz5D++I3iExI72pZlC0/WYJHVlCqa8UlzrwGV7BlklYeBAivbHerxvj2hQpbJnuTJR2ekt+04QesMTGoecztwgPR2xaVFA8KtCU3eyWYfkflRrOx0wgyAGEa8qWDI9irsvvY5vDDDQJPvfKpJFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XmWSj57R3v+UIceJhRruaNFfPcJL96GvOx+Ep5xc3PM=;
 b=hTmHjau3sf3nca0uqUYJT4AEu3DmBBc62yvy6QaZYSjnVrmIMIxRJZgRgiAeKy0JIpVhE3CCZvBdU2baOpSOocKRPRsdcrm9qiZo6Xf5cBWDe9fSpcKY0xktBd3O25ZvcYnvXgDQWDQ04xbYnZsCQwPZhje9jfzQ/ilI7jUj2nqg8NAeFNVgHym0PpJj0ERCxWVjOljleVEtBDGiP3ZnwpuB7TT97xAaBN03f7mfiALgTa04Sk3h3bc9eTZPYUSo9QGWUXi1FgUULDvOFZ7Xx9pVuDHARdPO8zgtd8iBrWtzK1CFYe2KLtnw+X/oMGm8Rshp4oAi6+VdYZ1ZkMVTRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB6442.namprd12.prod.outlook.com (2603:10b6:510:1fa::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.29; Thu, 1 May
 2025 12:59:02 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8699.012; Thu, 1 May 2025
 12:59:02 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 01 May 2025 21:58:22 +0900
Subject: [PATCH v2 04/21] gpu: nova-core: add missing GA100 definition
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250501-nova-frts-v2-4-b4a137175337@nvidia.com>
References: <20250501-nova-frts-v2-0-b4a137175337@nvidia.com>
In-Reply-To: <20250501-nova-frts-v2-0-b4a137175337@nvidia.com>
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
X-ClientProxiedBy: TYCP286CA0001.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB6442:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e7ebae4-08dd-47eb-a9f6-08dd88aff236
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7416014|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Tk4rbHUyVGZIK0RuOWNVNXdDbHpRV20rWGJZQ3g2bWhZaGtmY0cwTzhrNzJr?=
 =?utf-8?B?UjE4d2pEZ2c2eUwva21OQXB2MEJyUzk1a3hsRHllaEVVazBmc0JmZEFjRU12?=
 =?utf-8?B?V3BNdkZCNktSNTFUWkFmNU1JOExRVW5JRlVzNlBZZ1lYemxoNTNidEZHUHR3?=
 =?utf-8?B?NXhjQmJ4NmRkZGRxbGE4UDM0MmJta1R6THFpV2MvSnB0cmVaMkJvdUlpSmJv?=
 =?utf-8?B?aWQ2WUlUclJ5TlVlMjZOMTF4VlJMa1kvME1sUG95QWJGTGdpVTQ3amI2K1hR?=
 =?utf-8?B?NEdHV0xqQXdleDliRjBsS2RiRDdBL0FDKzg0M2Q4K2tKTVYyY0QzekhYRlVY?=
 =?utf-8?B?bmxIQ3FkRzhUei8yY1dPMUpCUDBHS1lrYmlpVVV5d00yQkpnVGFhVFBmRWpu?=
 =?utf-8?B?K0Q1RW9lRk5aRzJycXg5VWNlT0QxY0JwZi9RelRHMVNKcEVETDRYVi8wTHJQ?=
 =?utf-8?B?ZGV4U2Zzc3lLVW03ajEyV2IzTUxsVFoxeUkvOHo5ZCtMQ0tOV3BRR0dYSHly?=
 =?utf-8?B?ak05RmF4RWNTUm1VNEFTbWREcjdxaVlJMVlQQmxuMHF5L05Lc3dwQkszRFpx?=
 =?utf-8?B?dEZERlRyYlhKMmFMVWxiOVh5WlNXa3pDTm1lYlpUb0gvQmxCSW5UMms5U3pF?=
 =?utf-8?B?OWZHaXdmNStkYkd5akxrTW55WnE2akhxb0pYL1dCVEJ0RjM1R0RKK3NWdmV0?=
 =?utf-8?B?OXJKNGZyMXdIMnRoekV2Uy8xblpHY3hhSjdVS0NveHFFVHZKc1JRSFljd0Rp?=
 =?utf-8?B?M1BpbkJobVdsQzRGYTJoTUV2M2FnSlRTdGlkUzZUcXpTVFd2cFhMU2lnMU5H?=
 =?utf-8?B?amlpSGpLV0hZallKMkwzY0NVWktNa2R2MlJOZzYwcURwL0M2cEp2ZDFFWnBa?=
 =?utf-8?B?RE9wUnVOUE43OWlmd0puUW5TUlI0ZEtSRmRCT1F2YmprWnRvRVdLVzRNd01u?=
 =?utf-8?B?NDdpYTdwc29hTk1PQm1HdngrNkR3dzZzYjdMMFhNRGNrRkM4OHg0MjlJM3oz?=
 =?utf-8?B?SDdxb0tuenV5ZEVidFFGZ3ZnODZLVzhwUWRGL3BsVjEzVGRQT2tONzJkNlJX?=
 =?utf-8?B?UWE2aXRHZnB2L2wrcjJ1aDJpV0V5ajRHZnFIV0RjUWZ6ZzRCR2hEeWZWVXpq?=
 =?utf-8?B?TzNaRkFOaE5CaTl5WmdzUVR6VGx3T0paNHJSSHV0Sms1UWQzNllwSENaUVVl?=
 =?utf-8?B?UG93T1F4VEJEcmYvOTFyWm9pSjgwVXRvZ2hWcTNoWEJtV1F1UytyLzFmUXhK?=
 =?utf-8?B?M1BmcFpUR2xJOEthOStTdFAwVFRKckl5eVJndG9BUWhjQUI1ZUFVV0VWNGVz?=
 =?utf-8?B?UVNHOHlvMW44Z2ZSNk0zaWgya051NXlYVFZCRzcrWWJXK09jc21OSGh5ZHo2?=
 =?utf-8?B?UjcvbzNWZ2llQXZPZFRra3ViRVVoQ2dpNDQ4ME5CN3luV0FjdDE3MDA2THhh?=
 =?utf-8?B?ci9JOXIyS0tJT2pGa2RjWkYvVzFzNEFRMXd3MTdYaEtVbFBiQVljWnBkSjB6?=
 =?utf-8?B?M2JOSGpRR3lqOWVncFIzcjE1SzVTMHJMWVAzVjcvNU9pTllLRk9YZ0xjVnFy?=
 =?utf-8?B?N1orYTVncEk5eTg3eWhaVWJJZ3prbzlFNE5pQVEwUGloTXh3YkhhdFhQek9N?=
 =?utf-8?B?bERjbTBSaUJYY282VG9MblloTHAwaERoNlpEZmxLNUNmZXBFeTZzYm9FSHVm?=
 =?utf-8?B?MkxNK21UaXV6SkJVNjNkY21FeEZFOG1MOTRiR295bzNRS0RaU0orSFNMUHE0?=
 =?utf-8?B?d2QrN0hNV0lZbDh5TGNRUmFlQ0tJT0RZWXhva1AxN1FuVElhUDNFRnd2cEI1?=
 =?utf-8?B?alZvRUdBbndSaUJYVmxrZTJSZ0R0eVd6MDJOM013WHJaQUM0QW51SVk2elFl?=
 =?utf-8?B?eEFKdm1YWk9GZTB2MDNwTWlzVGhSVW1LZHc3aTVJckNlRWpLL3lzdlVUWlM2?=
 =?utf-8?B?YjZEQUVpNXhBN1dzTnlPQ21JTXVJOFJIRVpjZWROY1lCVXVRTkhNbWRzWWZq?=
 =?utf-8?B?SDZMNXM1aDFRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7416014)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OUU2YzFGWnpWZmVQRDV2dzlSbGJQNHZndUtLQU5aL3B2amFSU0FBbXN3d0hn?=
 =?utf-8?B?Z0FRVEN6bGlNVmZPaUh2eWgybm5LU1BwWWVHZjJQbTBaSVRna2s3aE1ZMkVa?=
 =?utf-8?B?QzVPczNFRGxHVjZDY3FLdU9kZktvbU1zSUJTUlE3QzViYlV4VEhyUWd4ZXZo?=
 =?utf-8?B?NnZ1bHNESU5TVGQ1UTdpT3BTbi9tTjBkbVFEcFN1TkxQUGtIYzJ4aHduZ1J1?=
 =?utf-8?B?ZGt3aW84SHVGN0Y3TjhPMXU0RVhiQk4xTzNZWkpDNmNPNklZaDNNUlVYa3V3?=
 =?utf-8?B?NVhKNXN3VVEvbWZWUjVYd3J1bHJKa0YyREZ6Y24yRjI0MkZ2dnNZMll6RHky?=
 =?utf-8?B?THZiUXc1WW03ZnVGYWpFMjhXK3NVc1hUcUp4MWZYOE5BNkRoYnI2MjJSQml4?=
 =?utf-8?B?a0NJOWRQTkVlRVJQekQvRDZiM1B2eHBseGsvcmNIRnViUnRRbXA2OXFiRmhG?=
 =?utf-8?B?T1VTaG5Jd1k1TWlXNU5wZDQ5TkhiTUJkYjNoQUxEaVlaSzBtbkc5dElVaytG?=
 =?utf-8?B?UXVZTUhTQmpvejA4dlRocW5mYlBDeFFvYzNlSXQ0UXVXb3NwanRHT3hEVWpz?=
 =?utf-8?B?Y0N1Y2JYN3FKaGE1T1VQUWtDSVR6ZEV4d1BmVmpDUUtHWVJuV1hjVXhHd2do?=
 =?utf-8?B?NzhNSkpzRkxjVlg2bDJJNUVYVGhUVlRXUXVOUW9pbEcvNkNxL0lrYkVya0FH?=
 =?utf-8?B?b1lXdW5pT29sQmRvZnRIYWpJdTlFWS81bmVwUWNNZDdDUUxodzl4dk9EUmVE?=
 =?utf-8?B?bGl1TXNrRlNLOHptK2s4SUJsaFRONWZoK3JIeFpib1pjZjJ1M24zblI1OWJI?=
 =?utf-8?B?b3NjUFV0YWc2ejVNQVBlV1cySDZyREdzMElIY1NSenFyMkMzRnh5Y1FlbmND?=
 =?utf-8?B?TERaTHNWdHlQRGwzcmRlVTA3R0JWQW5NQlUwdUoyRmJKd1VCenhOTmJpdm5o?=
 =?utf-8?B?djBkRHMzVDJGSElTeVQwanJjVzV1RzR3TzJvVVdlVG5qMkRoVkJZbUJlQUdn?=
 =?utf-8?B?VzduOGxXMWVyWDE2M01yT1dmK0UzN255RjNtU25kUFdhdUU2amdnN1dtR0VQ?=
 =?utf-8?B?SGdyaXJSQWY1VE8vWHRJR2VTMEVXL1p2c1h5R21lUWFiaGgvQzgzL01sVGVS?=
 =?utf-8?B?ZnpqSU9xRTRvbjJOMnkxeDBTakZVRS9CcnRUYTJ6S3c1ZVdXU0pZMW14WDd2?=
 =?utf-8?B?c1JMTDZ5aU54b01ad0NDRE5DUWYxM0UxQ2ZORFVnNmJJaGExUWtVbHJLM3VQ?=
 =?utf-8?B?YjVXNmJUa0t4eVFsR2VSbFZZdnJvMUhQc2RvTWNhdGo3SU5TSGhDekN5OFA4?=
 =?utf-8?B?YnZoMXZPZndtNElEaGZubzNoRlFuUkhJbDNvanFOcytha213RHBzVnB2YWxz?=
 =?utf-8?B?UnZSdURwa2wxRm9MRE9YbFQ4LzBjdmpPTTdGSmJwREVvakwwaDlTUDZPVzR3?=
 =?utf-8?B?aGxVYXlzMGNqdXlDRTVzYWM5cXc0U3hGc1hTK01nTU92TDhJVTdObzJSbmJ1?=
 =?utf-8?B?c3JaNFlnQXc1dE50RCtGU1RHRlNJci9UZWtvUEVxSzd6LzBZcFdkM1RsS1lk?=
 =?utf-8?B?WnlPbUwvdHdodHQyZDJ5TWdIZXI2cDRoUjVEdVIvVGZNeDZ2bG5OOWRnZjFK?=
 =?utf-8?B?YkYvS29NamovVHVCZER4QW1hcW1LeFdSQldTTk9QUFFxSkU0Y2o0a2FXMUlB?=
 =?utf-8?B?WXZMRE8yMGVQTFluckwvMlM3cXdwRjlaOEJYZmZBQU5sTmNzV1paWk9WZWQ4?=
 =?utf-8?B?Z2dDRzZHQXpEL01xTVBDUy9BVmYrODY1Z08wTFMvZ3NYdFNwc3NOWXlxTEhU?=
 =?utf-8?B?YUswR2hDRGJSMGNGUEQzY0txQk5hNGJqN2lUcUY5RjQxQ0F5cXpWNmVENFUz?=
 =?utf-8?B?SFBTSFUwR3JyRXVDMWk0RmgxMXRneHpmMU1zdVFmR3FHaWkxR2tCK3J2YjZ5?=
 =?utf-8?B?UUcwSDVBS29wSFE5T2pZUktTL3FDYWJEWGF1U0pSR0ZQSk9yNEE0VHZuUVJu?=
 =?utf-8?B?enJtMzRUWEorOWpuQ1ZVekVuTE9iNytwdHFid2trakl4ODliaGFOQ1BQSjlu?=
 =?utf-8?B?WnFySHgxK2ZRM0tqVFRkSU9CNUU1Q0Yrd3YwbERPblREZVNramdxNVh6d2Ro?=
 =?utf-8?B?RG1PalZVaTRITU1VdGRVNnJaS0grN2RabmJZenR6S2p4SFI4bFhyS0dJc1l3?=
 =?utf-8?Q?U1O5BSjzzSl2vitE2M9+bgCR6JNv4kAu1imIQJMueYB3?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e7ebae4-08dd-47eb-a9f6-08dd88aff236
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 12:59:02.7812 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dl9S5XWUCII23dgIAJ+fzIa7E6sJjipasALyv3EKWK+cMWYxG/YSDz0QlYexEYaq5cSfVvUOb8W4JqcVs+zv+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6442
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

linux-firmware contains a directory for GA100, and it is a defined
chipset in Nouveau.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 4de67a2dc16302c00530026156d7264cbc7e5b32..9fe6aedaa9563799c2624d461d4e37ee9b094909 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -54,6 +54,7 @@ fn try_from(value: u32) -> Result<Self, Self::Error> {
     TU117 = 0x167,
     TU116 = 0x168,
     // Ampere
+    GA100 = 0x170,
     GA102 = 0x172,
     GA103 = 0x173,
     GA104 = 0x174,
@@ -73,7 +74,7 @@ pub(crate) fn arch(&self) -> Architecture {
             Self::TU102 | Self::TU104 | Self::TU106 | Self::TU117 | Self::TU116 => {
                 Architecture::Turing
             }
-            Self::GA102 | Self::GA103 | Self::GA104 | Self::GA106 | Self::GA107 => {
+            Self::GA100 | Self::GA102 | Self::GA103 | Self::GA104 | Self::GA106 | Self::GA107 => {
                 Architecture::Ampere
             }
             Self::AD102 | Self::AD103 | Self::AD104 | Self::AD106 | Self::AD107 => {

-- 
2.49.0


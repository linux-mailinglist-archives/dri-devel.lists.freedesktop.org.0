Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D17C18F26
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 09:18:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D8F110E72A;
	Wed, 29 Oct 2025 08:18:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="miWi8ZnN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012003.outbound.protection.outlook.com [52.101.43.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46F3910E732;
 Wed, 29 Oct 2025 08:18:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bKMkoJj9DhJLLPSs/+TnJix7Pmh2/loSBH3UVzYKd8DXbzPYUQCd61vbhA1M531JEwjWL8yafi2he6RMfG2h16GP50SlBLdy757JQKLUs0LNFRk2rW30IAimZaqhiKBIog3UTlcprK/kn1PzgI2o0FqjdfwMkCvu3Ejg7Nqp2X2VaU7ZUxMPDyPH7dLSkDjPa8Wi9JYtdGaVTD2wdo3rsh56h+GvIa129rdwmJrqoYmEq98TODpLaciZwIBoS5eA7lakC/Y2sVcnWT7AztffG3gl4qcAeNHMcqvmC8nUfbDgmhifRYIWYInJN/aokVCGK5+HZltWhE5zK36Wz1OUAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DUU4iT8CaEihvHFyN1CGowifo4/rOdfiKT6VJDzrLEU=;
 b=PD4OoBXIMBldYUPfhAPgMOagkP/+cctBih2MMVninSo+YkXfzsrzr7lclc1RlJdINbojtHCwDO62M4hWb1mD9JWviSzgV3YGnSSN3Tzbxu2S91IC0h4pVKW9VXbYmLSyU8q270zzwc7wj0otUNSIyGIQtthSYsVlktcmHY66HnoPLqQzy0/dwkndSeKbXZoavPybYNGqGoJps5Z1CNSuWr8GZuuJIYcapf3tf1kEfAbhHTgRUlR7sgnNrUPqjbklpQKz/iyTWBFYzw087VZaS03V83luEtJSVHpGJKGN+1DsIelYgPssN8k8gQWEv3JoinjbcEOEi79jlxwvNi+2Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DUU4iT8CaEihvHFyN1CGowifo4/rOdfiKT6VJDzrLEU=;
 b=miWi8ZnN4lLbdhB558iReoD4/JtdIhgGkb6Y7L7jE8U7omzw4GlYIDJpUJDFZJeZpGyLIyA8cchCOQqHowd9IG3xyd9p2ys1IZWqFIIO+ZvYVQpkfMALB5LrsDcNOwn/H2Ac0JasInWJ2ZBx3GsH/O7A2XWsy3qGQD+JScKlXIvbPz+N98DIHdKI+xaSP4nkCcAdJ7wXcpvTyGJnCQcikVNmV1RnWraXtcVNaUOaFiLC5In3RRcANJWg3bOv3KlM+PW02smdHvRByctFjRNtc/+kjEE2WMDoZj/Piw9QNEtG46ntWwu7RHj77BShUuLqMbZQ2HybNdbvkw627bYNkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3997.namprd12.prod.outlook.com (2603:10b6:208:161::11)
 by SA3PR12MB8438.namprd12.prod.outlook.com (2603:10b6:806:2f6::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Wed, 29 Oct
 2025 08:18:12 +0000
Received: from MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316]) by MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316%4]) with mapi id 15.20.9275.011; Wed, 29 Oct 2025
 08:18:11 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 29 Oct 2025 17:16:37 +0900
Subject: [PATCH v7 10/14] gpu: nova-core: gsp: Create rmargs
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-gsp_boot-v7-10-34227afad347@nvidia.com>
References: <20251029-gsp_boot-v7-0-34227afad347@nvidia.com>
In-Reply-To: <20251029-gsp_boot-v7-0-34227afad347@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYWPR01CA0022.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::9) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3997:EE_|SA3PR12MB8438:EE_
X-MS-Office365-Filtering-Correlation-Id: 17feb56c-c25c-443e-3cd9-08de16c3b36b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|7416014|376014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZGZJRDJtWGsrSVZuMTFXR2szalFLbWthdVVJaUdKV2VicWdnOXVJRFFXQmNK?=
 =?utf-8?B?aHRFandhZC9zbGxkK1VzbmRlVTBIQzkwVEtKNXhKNTE3R0hYY2RzcnNJd21X?=
 =?utf-8?B?SmxTZmxISWY0UldUUHovMFFUYVJ4cHZJN3BYSHZjVENMSWVwd08wWjRjTHRa?=
 =?utf-8?B?aU5rd29QWkZOK2FzUXNmTVlDa3pwajlibHZVdjRoUFZ3elZCbFF1Q3BqK3pt?=
 =?utf-8?B?VUJFeHBvSUhLdGwzTUxSR0VkRWg1aTFNQitoanNLZzArVlBCMkN6SndDL0Q1?=
 =?utf-8?B?c1BnWGs4TGk1bi9QNUpob290ZUpoYS9DWUx0Z1pBUlAya0hVNS9UTFZzSXJv?=
 =?utf-8?B?cFpSeGZuZi8zYStVd3p3ODAxRzFjbkUwajhxY2MyeVNmTkE2TmtDSGM2U1Rh?=
 =?utf-8?B?NVpDQVRYbnMwZ3I2VlZGb0phUEhZV0VSKy9FNjhMc1BGUGtQcGdCSEphc0Vs?=
 =?utf-8?B?aTBJQkkvcXVWZzFFSGVEUC9hUVlGRWNPajVNWHMzdDdkQ2lGeE14TStyaGhD?=
 =?utf-8?B?U3hGL3pnWjUwcXBsODVzMGpnVktnQTdaOUZ1ZjBmaldYV1Rva3VxcjhQWDdI?=
 =?utf-8?B?azcvTWV0cmQzWVN2dVFBYWhmbjJJTlNBRkJQcFN6cHhnd1FIcWJMNzFEZmZK?=
 =?utf-8?B?QVV2czdodENrekdFaHV5UUtwc29TalhacG1QTjZJU0ZWZDJxeEkyYXc5OVcz?=
 =?utf-8?B?TE0vbGMrais4d1krV0dUVDkrUnFKeHdQUE1rYUY2K2hMUmxhR1lFUEZPOWRU?=
 =?utf-8?B?WStzQndDczZzN1JNZUNIakNoSUVKUktSa0MxSEMzWDg4TllwczY0dm91WTBT?=
 =?utf-8?B?dkQwV0hVaWt1Uys2L2ptREJtWm1yOU1JdkdHYkhodW1tZGVncFZ5Y2taR3Ew?=
 =?utf-8?B?OE5HOXlmRVFYMDBpZ2RWenl3b204WUwwYllRZTVEa2dKYWtHbWcwalh3ZlBP?=
 =?utf-8?B?enJvdnRNYnFWYm92Y1NpWWhpeGRXanJ1MWRHeHdsaC9kMThoTm9hQ3FhY0Q3?=
 =?utf-8?B?dy9IM21zWXJaTmRkck05Znk4NlI5VGlUUExLc3lWVDVJaDE5ZjcxaEVuOTRC?=
 =?utf-8?B?QTNabUdFKzg2NU5rY1JPV09LUGpTeEhSYkRnT3h6S3VRaVluNEFsazlsS2Zn?=
 =?utf-8?B?UFBESWh2VmVZSGtpUUppRmNGQmVYUFdvTjE1bERXeWpzRXpaWGRBcXhzNHhW?=
 =?utf-8?B?cWRGT0VHcDdTc3V4OGhzdmp6OTdmWjBkN1lUVkxWbUwvdjlYaDBMaWZXNXli?=
 =?utf-8?B?WmZwekNuVlpVWFZDVHdIWVJZVGxBaXdvRW1zVzNMWUlCUGJRMFRxSnF4Vm1a?=
 =?utf-8?B?T20zS2ZFUUZQSFBjRE5HMGpnUmRDZ1BjZXczZEd5RTA0RXhJRDdWekhDdHV0?=
 =?utf-8?B?TDIyNVplWnBweDhCZ2NWaFlEdlNwaVRXZk9zYVZDNHR4TXVsYXNYN3NuV290?=
 =?utf-8?B?QkE1QjRkSDFKdWJlMGt1TndwUWsyZUxNNXpRa3hlcTBENkxiSlFqRWQ0YlUv?=
 =?utf-8?B?Uzh5bXA4YUR0MWI5TWFCUU1pNG51elBQS250bDM3aXJuRTNDYkJ0YVVkai96?=
 =?utf-8?B?cHFwUFQ5NjBHbEZ3dlhBVDA1amZ2dTVvd2MwTDZwU1A2OGhBZGJPd0IwaE81?=
 =?utf-8?B?V0tBVU5zK0JEM2Y0ci9sbjlyYlkvZGZtL2NUcXBxSERRMjFUQTFUb09heDND?=
 =?utf-8?B?QzdDcGI4TnR3dmY0WG9lTkozRUg4VmwxU3paVVhXN2FidFN4emw2SzBoSkRB?=
 =?utf-8?B?dStOTGgxY3dIb3FuOGxHdmh2RXUxcnFnaFhvZzJJbzZOeHRHOHVJdXhsMTJX?=
 =?utf-8?B?UUZScmJLWjFNNDVFNUFxbkVmNFVjbCtmUlJMOUtNZW1TNW9seFhoaDBJcGxp?=
 =?utf-8?B?SmxrMzdQU1VUVnNkS0pZYnE0N1Q5dFZuQkRrcWpUU3ByN3JrRlUrRWJUOVFa?=
 =?utf-8?B?a3Z2ZXBIZE9ZbW5HUEowTER5cU5QbnhGSGVzcHBsY2M1a3ZhZmpoVHFmL0I3?=
 =?utf-8?Q?vW4IOgkz/H/hiPZYDdbNvAizatlOx0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3997.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(7416014)(376014)(366016)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3lnTXdFVmF0eFpCODJOZGRERk5sOHRrcUkvWmJ4T0dDdGhMZm4zMlRiWTZB?=
 =?utf-8?B?YlNYOW1ybUY5bGFzanE1eENrTFhtV1FhWURKdytIQk5Ud1VkdS84MnJWUlFV?=
 =?utf-8?B?NFdBb3BuSE9rOE0rN3R2OFVYQmpoV3RybGRZTVRqeTBuS1RPQy9yTjJXd2Jl?=
 =?utf-8?B?TU4vamJtK0pXUFhGRGxPYmhGWXpweTQrWDJURE9Vei9jOVh2aXdtN2JkUDZQ?=
 =?utf-8?B?dTk3WkdZaTUxTlV5ci9DdTlwOFJ3MFpTaUdyT0pWL2lIbm5rMFJhN1I3UjU4?=
 =?utf-8?B?c0htU2FLaDJrc3FOUDRMY1Mydm53Q2I5OXpDZ1M1OHk5M1RtM1cvYzZ3NHht?=
 =?utf-8?B?N25TdGxZVHpxUHF4aVdRRkpOVitKdWRaOGN1NVkxamdrL1Y4YWx2bnRwTHk1?=
 =?utf-8?B?dGdrSmVEeW9HaW4yMFNvTG4xbjRPdFBJN0sxRVI4TWt5ZEsrNW9GclJZaTdx?=
 =?utf-8?B?dWM2VUQvb2JZR25KaFBITHRWSStnSmFpdGVnaXloMFNYVXd3S29valloOEMx?=
 =?utf-8?B?N1BiVzFFMXEzQmg1Z0pTOStubWxmNzFJWW4zOTU3blZxZmJZck9EOCs5MjZs?=
 =?utf-8?B?cThXbkNXZklDUU54VVlyWG9FY2psS3pqcXp1T2xpc2ROQVpxYWpJUHRSeGdk?=
 =?utf-8?B?Qm8yTngyZkVNTDNuRG85RmYxclIzdE5JSlBCUEVmVSszWFdibTZiNzJjdUlU?=
 =?utf-8?B?elk0UzJ3YWt4V3FaVGpmemsyamZDY1NJdlFsZ3V1Rm9VQVc1OXdyR0Y0bGlN?=
 =?utf-8?B?TE0wblIzTGtEbUVzcVFVV3hFME1OZXFXNHlFMDNMaXd6bHNzZVM1djlHT28x?=
 =?utf-8?B?ZHMwRjZDK05WTXl6T1kwM0pyeWtHQ21lQURQbjYycmNtdlNiMENXZFd3b0Fh?=
 =?utf-8?B?cE11WVlNZnNjZnBNOTYvMzduSFd0aVdVUUd3SGJ5NExMZVFvS29rYVFkQWht?=
 =?utf-8?B?TklxeFk3eUkzQ0R0NUF6cmNLNGY4cjNWaGhDOFRQK2VRb0dVNkNhejRDbzhH?=
 =?utf-8?B?dk9TODJ4eXlOL1J1UEY1VGxSWjBkdkp2NDZ1amRDTWZKWGdwanErNDkxZk9n?=
 =?utf-8?B?enBsQVZNbTcvK0ZDSHQwZys4dTVQajR5N2tNekxEWUNadlUzUWs1ZmhTcXlp?=
 =?utf-8?B?a2VLbkF0OU9zS3QwOTJPZGpLKzgveGY2WkdocVN3NnhPZE5IelVUSmlkQWQz?=
 =?utf-8?B?V0ZjRjRoTVBKM1grU3hySVNZbWR5U3lzak1CTUhJOGdhTjBIbG90cDZNOWJB?=
 =?utf-8?B?SWhFZ2xHSVk4S3ozMFhVK0JkYTJyOW90d1pTTjVHS2xkMHVwcHk2K2xhQjBy?=
 =?utf-8?B?bGJrMjQzWEw0dUh0Zk5hK3ByakRxby9CQWtXK1c4SjBvNkdmYy92Zzh3b3VE?=
 =?utf-8?B?K2ZXT0oyY2JmZXl3c1p4bXFiZlFPcysxL3BRbTAwVjBGd1dXSGJ2dXdVWTFz?=
 =?utf-8?B?cXlvOUp5K1JHQ29KaGx1SDM5SjBaNWtTbUwrZmNiczNNM3JnTWlPVkZSMHNk?=
 =?utf-8?B?aElCWlRqa0JjVUxnZVVwbWYyc3RKVnRKdk1RRXpDVTBqTDZDbjZkME1kTkV4?=
 =?utf-8?B?c3ltR0YzSWFlSVdyMmJSaGZjeS9qODZ6S2RLUVV3Y3Q4SE1jWlV5bUZzV2ps?=
 =?utf-8?B?dGRYYUY5Q2pkbVVxaWJwY0huTmRSTXVHY3ZuVUUwR2ZqakNRV04zYXc0T21B?=
 =?utf-8?B?QXV4Y2w0Y25SMkFBWnpWZkRmWWo3bDArRlZRQkd0aDU3UktoTlErTW82WnVE?=
 =?utf-8?B?dGl5Y0U5bW9LQW1BQnJHWnBWbWtZaFUwVUkzNVRseGQ0eUluSm51aXp6RVRB?=
 =?utf-8?B?T2NTZmhZK0RGMGpjVFBCcUlQdVB3SnFlWXZ3K01tREkvUWlNQ2tCMi9qSGZE?=
 =?utf-8?B?ZVdsSmJHd253K3A3aTNQN2UzQjRkUlFMQUlmZDFSVnRrQ1g5OHhObnNsY0hQ?=
 =?utf-8?B?dUFHUDk0dnREeVBSOEZ3amNycnMyTWdpVXUrY3QvTExidWVoWUFLR2d0QjJB?=
 =?utf-8?B?YmFmODBHZkJlRW5lUHNiMlJ1Tk02SU1pbUg4TXlLb3pNRjNvaXlLT3FDU1Vl?=
 =?utf-8?B?WmRkV0xHc0ZkdEZjZDZrc0NDNGZRWWluSFBwZDJESXdnNUJITTJkKzBBbHNJ?=
 =?utf-8?B?eXNXRnNWaVc2dVB0eVptVVR4ZE9qeWJRTzFUMGNhTSt3U2tiWVJmRC9TYmkr?=
 =?utf-8?Q?d4cQLG6OvcOYYrIOsYBy+LCkgt9npBYqi5SIH4TALt0T?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17feb56c-c25c-443e-3cd9-08de16c3b36b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 08:18:11.8820 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f2nKBHwGIftBr8sshbSg4ssF4US/Ir3x19m/IJgI/k+wrdC1f5cpv6WaFPFNJU6J34z2lWVZ6FxyvMgWmXxnYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8438
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

From: Alistair Popple <apopple@nvidia.com>

Initialise the GSP resource manager arguments (rmargs) which provide
initialisation parameters to the GSP firmware during boot. The rmargs
structure contains arguments to configure the GSP message/command queue
location.

These are mapped for coherent DMA and added to the libos data structure
for access when booting GSP.

Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
 drivers/gpu/nova-core/gsp.rs      | 17 ++++++++++++
 drivers/gpu/nova-core/gsp/cmdq.rs | 22 +++++++++++++++-
 drivers/gpu/nova-core/gsp/fw.rs   | 54 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 92 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index bd251360c784..e3b7a6bbe004 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -16,6 +16,7 @@
 pub(crate) mod cmdq;
 mod fw;
 
+use fw::GspArgumentsCached;
 use fw::LibosMemoryRegionInitArgument;
 
 pub(crate) use fw::{GspFwWprMeta, LibosParams};
@@ -36,6 +37,7 @@ pub(crate) struct Gsp {
     logintr: LogBuffer,
     logrm: LogBuffer,
     pub(crate) cmdq: Cmdq,
+    rmargs: CoherentAllocation<GspArgumentsCached>,
 }
 
 #[repr(C)]
@@ -119,11 +121,26 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> Result<impl PinInit<Self
 
         let cmdq = Cmdq::new(dev)?;
 
+        let rmargs = CoherentAllocation::<GspArgumentsCached>::alloc_coherent(
+            dev,
+            1,
+            GFP_KERNEL | __GFP_ZERO,
+        )?;
+        dma_write!(libos[3] = LibosMemoryRegionInitArgument::new("RMARGS", &rmargs))?;
+
+        dma_write!(
+            rmargs[0] = fw::GspArgumentsCached::new(
+                fw::MessageQueueInitArguments::new(&cmdq),
+                fw::GspSrInitArguments::new()
+            )
+        )?;
+
         Ok(try_pin_init!(Self {
             libos,
             loginit,
             logintr,
             logrm,
+            rmargs,
             cmdq,
         }))
     }
diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index bd863a174081..df1633cba2a6 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -6,7 +6,7 @@
 use core::sync::atomic::Ordering;
 
 use kernel::device;
-use kernel::dma::CoherentAllocation;
+use kernel::dma::{CoherentAllocation, DmaAddress};
 use kernel::dma_write;
 use kernel::io::poll::read_poll_timeout;
 use kernel::prelude::*;
@@ -283,6 +283,22 @@ pub(crate) struct Cmdq {
 }
 
 impl Cmdq {
+    /// Offset of the data after the PTEs.
+    const POST_PTE_OFFSET: usize = core::mem::offset_of!(GspMem, cpuq);
+
+    /// Offset of command queue ring buffer.
+    pub(crate) const CMDQ_OFFSET: usize = core::mem::offset_of!(GspMem, cpuq)
+        + core::mem::offset_of!(Msgq, msgq)
+        - Self::POST_PTE_OFFSET;
+
+    /// Offset of message queue ring buffer.
+    pub(crate) const STATQ_OFFSET: usize = core::mem::offset_of!(GspMem, gspq)
+        + core::mem::offset_of!(Msgq, msgq)
+        - Self::POST_PTE_OFFSET;
+
+    /// Number of page table entries for the GSP shared region.
+    pub(crate) const NUM_PTES: usize = size_of::<GspMem>() >> GSP_PAGE_SHIFT;
+
     pub(crate) fn new(dev: &device::Device<device::Bound>) -> Result<Cmdq> {
         let gsp_mem = DmaGspMem::new(dev)?;
 
@@ -501,4 +517,8 @@ pub(crate) fn receive_msg_from_gsp<M: MessageFromGsp, R>(
             .advance_cpu_read_ptr(u32::try_from(msg_header.length().div_ceil(GSP_PAGE_SIZE))?);
         result
     }
+
+    pub(crate) fn dma_handle(&self) -> DmaAddress {
+        self.gsp_mem.0.dma_handle()
+    }
 }
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 5d984728428d..787cfc8a0ce6 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -16,6 +16,7 @@
 
 use crate::firmware::gsp::GspFirmware;
 use crate::gpu::Chipset;
+use crate::gsp::cmdq::Cmdq;
 use crate::gsp::FbLayout;
 use crate::gsp::GSP_PAGE_SIZE;
 use crate::num::{self, FromSafeCast};
@@ -547,3 +548,56 @@ unsafe impl AsBytes for GspMsgElement {}
 // SAFETY: This struct only contains integer types for which all bit patterns
 // are valid.
 unsafe impl FromBytes for GspMsgElement {}
+
+#[repr(transparent)]
+pub(crate) struct GspArgumentsCached(bindings::GSP_ARGUMENTS_CACHED);
+
+impl GspArgumentsCached {
+    pub(crate) fn new(
+        queue_arguments: MessageQueueInitArguments,
+        sr_arguments: GspSrInitArguments,
+    ) -> Self {
+        Self(bindings::GSP_ARGUMENTS_CACHED {
+            messageQueueInitArguments: queue_arguments.0,
+            srInitArguments: sr_arguments.0,
+            bDmemStack: 1,
+            ..Default::default()
+        })
+    }
+}
+
+// SAFETY: Padding is explicit and will not contain uninitialized data.
+unsafe impl AsBytes for GspArgumentsCached {}
+
+// SAFETY: This struct only contains integer types for which all bit patterns
+// are valid.
+unsafe impl FromBytes for GspArgumentsCached {}
+
+#[repr(transparent)]
+pub(crate) struct MessageQueueInitArguments(bindings::MESSAGE_QUEUE_INIT_ARGUMENTS);
+
+impl MessageQueueInitArguments {
+    pub(crate) fn new(cmdq: &Cmdq) -> Self {
+        Self(bindings::MESSAGE_QUEUE_INIT_ARGUMENTS {
+            sharedMemPhysAddr: cmdq.dma_handle(),
+            pageTableEntryCount: num::usize_into_u32::<{ Cmdq::NUM_PTES }>(),
+            cmdQueueOffset: num::usize_as_u64(Cmdq::CMDQ_OFFSET),
+            statQueueOffset: num::usize_as_u64(Cmdq::STATQ_OFFSET),
+            ..Default::default()
+        })
+    }
+}
+
+#[repr(transparent)]
+pub(crate) struct GspSrInitArguments(bindings::GSP_SR_INIT_ARGUMENTS);
+
+impl GspSrInitArguments {
+    pub(crate) fn new() -> Self {
+        Self(bindings::GSP_SR_INIT_ARGUMENTS {
+            oldLevel: 0,
+            flags: 0,
+            bInPMTransition: 0,
+            ..Default::default()
+        })
+    }
+}

-- 
2.51.0


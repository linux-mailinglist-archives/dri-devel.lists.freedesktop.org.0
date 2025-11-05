Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7915C34617
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 09:03:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 193FF10E6C4;
	Wed,  5 Nov 2025 08:03:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="mFeMFAGk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012035.outbound.protection.outlook.com
 [40.93.195.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5485C10E6C1;
 Wed,  5 Nov 2025 08:03:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h97K37QaQEhCTRzryrZF+ZsRMh7eBUQgeNiFyGwepmrE5d6J166fhok0DJQZxP9ykJRvUncK2F88kqzS4d85aXAZXRbzNlozxZqKlU0EIcAIohiiZ/d7F+BWqVohj9MaHm5BttabZ2IPGojdYot1t76BccP13MtnCUMGH2pG3Nh/7YM8AFMKTPvDkeXm5KSTIECL8PxzZbH1mo2Ki6NLy7Tyw1VTXGklLL0voV7UscfGDDUIeo2NtsUQkVVWrIRiKiYRaGzl2SRXYQtGjnSbo+qD5AMzhPoey2+vzcfBJZ6FfIJgQfYkPfbT4wC7Wf30LAbJ3JfIHotR4lUgSZa59Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9t9cSHq+XKG2CCw+8lYjHHnhDSK/YmvudJMf1XhPeFk=;
 b=tBOYns9Ksj0Iarn+gF/HuD2CIU5P5hdGLDFytQBEmBKdRRG5HctLynmymAx2LulYzn1hAgRhBkqrEqKVv85/VchBjD/5k4yt+dMQQF53nhGo1jf2uAy2/z6IWaryTyMfqOedjCCPjqR+AS4mMtwjrVV1ODdMm4jFL2NQmodoEcCjqBZOsVXZvZyg64WqviD5CBKy55TzFbM2k6rOyiPZTKza/Onnyx6RrmdtxyWk1YFLZFhHWEdhTlScpHYIPtkm72YJB2bMisHeNw03sYbB+uIswpX0be9nLnJaUQA5GsNkUtr+MsdKJSjgr9pmOSvSqc/G0wKFkTP3EAs8JcXJxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9t9cSHq+XKG2CCw+8lYjHHnhDSK/YmvudJMf1XhPeFk=;
 b=mFeMFAGkoENY/VCemmth/MpOkVsIrOZXLjD6J+2EFluHumDS1iqj2BBzFGrgvI5nOPpjHy/YerLArXLhChHb9mxoEv7QaGz56wT3iiJWd/mxKGc4xUzzdkqjnL+O2hdTIwPIZ9277gfjQLPhZlRDRvrgi7Z//RbKKHQ/mrM6yNZ21U7ehSSIvvUZK19ppSePGFGeQxEfJZgSF/3frZ3lLDAHq6vuZM/NL2+TBuwJTMb8vj+QJHgKVZAlhmRI7My2n+Q1dFADyQ1YxhjXPmQjMFaCxAZGTkQQNwd9jgWt3yDLRpukQEpAzp0MV3rn38obxMrn/7Xrw/ZwFVbvkEEfoA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM6PR12MB4450.namprd12.prod.outlook.com (2603:10b6:5:28e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.8; Wed, 5 Nov
 2025 08:03:27 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9275.015; Wed, 5 Nov 2025
 08:03:26 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 05 Nov 2025 17:03:15 +0900
Subject: [PATCH v2 1/3] firmware_loader: make RUST_FW_LOADER_ABSTRACTIONS
 select FW_LOADER
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251105-b4-select-rust-fw-v2-1-156d9014ed3b@nvidia.com>
References: <20251105-b4-select-rust-fw-v2-0-156d9014ed3b@nvidia.com>
In-Reply-To: <20251105-b4-select-rust-fw-v2-0-156d9014ed3b@nvidia.com>
To: Luis Chamberlain <mcgrof@kernel.org>, 
 Russ Weight <russ.weight@linux.dev>, Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4PR01CA0124.jpnprd01.prod.outlook.com
 (2603:1096:405:379::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM6PR12MB4450:EE_
X-MS-Office365-Filtering-Correlation-Id: 800f4845-37f3-4712-b98f-08de1c41ccb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|7416014|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OW1nTzNSZTl1RHovK2NLYjlYWlVTUVBSczFKa0cyR1pZRVViUTZ3WmFkbFJq?=
 =?utf-8?B?VThMNVlMa1dTa0NLSWRNVzdIRGlZbmYwTksweThQQURIOW9FWDNOZ0FmdWtF?=
 =?utf-8?B?aDluKy9OUU5zU21hbTMxcGlRT0hFd3FnMkNXT2R2OXhBaEdUOXhqV1RPNkZH?=
 =?utf-8?B?Q2dmQVFISi9BMkFvNllVNmlOVkRDUGR2b3ltdHZQNXNtTFprYnlaN1ZpYXNF?=
 =?utf-8?B?MXNEVko0R1NzZWVBVjZnSUZFNktJUndSWHZ1RHdOUnFHdTRaQTk5YUJsRHdK?=
 =?utf-8?B?Sis2QU9ha1A1MmtreWdKdGRDdm5kOHFYQzU5a3NMVzFOSEJKbGQ4SUxub1FK?=
 =?utf-8?B?U1NKOTIyZWMveXgzZ3FjRHc2ZnlKZ3dlek43TEdSeGw1MkMwalVqNm1ndm5Q?=
 =?utf-8?B?blpVbW96Um1iZDY0UHoyczdmUFRqaEFxQkg4QmhRV0JZR1l4cnJpWURGcmly?=
 =?utf-8?B?L2ZrOGZsNU1EZ3c5RXlMRTAyVkliTnZPZXduUnR2akNXc2tlZld3NXYzbHQ3?=
 =?utf-8?B?MXZLQWtHV1laSEZyNDZCekkyenJMVk5qV3pRQUVUQzJ6ektzemFRQkxtWm9G?=
 =?utf-8?B?cUk3Tkx2SnNtMUhRRWpOTm1zUmFIWE9mRFova0dCOTdiUm9KdnR1bnJnM3hu?=
 =?utf-8?B?R29SMHhkTDMvWTJIT05yT0xBeFhtTnVtNnVYd1Y2UWJMbndZWi9DR1MwQWh5?=
 =?utf-8?B?QVJYaVpZODYwMjVZamM0d3BJand3R25hZWpQeEYxR3JZbmhYRjBYSmNqcHVL?=
 =?utf-8?B?bGxtR2FjMW5mekZYZExqdXd3Ky9Oc0ozb1ZqYmxKL2o2MzhLS2g5aUY1T052?=
 =?utf-8?B?a2ZpaFd6b1Fqei9aU3N3dm4zTGUwWjgrNUcyQ1lRYmkvU0FvZWdSQ3pzU1ZR?=
 =?utf-8?B?OWs5N1BzWDFBeHkzYzVTUjNBZUUyYjFqMHdRWTBDK0szeWUrZjRDUHRkUGxz?=
 =?utf-8?B?alVyYklEQ3JZaWJxdnNQTVNhWVVTT2g3RnhmYWNkOUxldUtraHZuQ25GK0FL?=
 =?utf-8?B?d3VmcHFhbTh1Qm5Ic1BKejI1VitTelZ3ZEFCYjRGbWxkY3YranpnZDhIWnFL?=
 =?utf-8?B?UDZxeWYvNnc1bUpCS2FHczRzNDFTUitqMmZOUC9hSGFjbEdrbi9VdzhRSGYz?=
 =?utf-8?B?V2w3VkFQWHNjbXhvdThmVGgrZURpcXZkWC80Y1FIczRCU2pIRWNCS24vcXY2?=
 =?utf-8?B?aG91OVRqUGF2TzlxcGNwQzV0Q3prL1dVcGs4YWNEc3BuZStiUGtsMElLd1pq?=
 =?utf-8?B?VmpLcTl5WEtha2pOSW5xYkFYU2tRdjNRWml1MlUxQTByMzJkVnIzd1NIUmdv?=
 =?utf-8?B?YzFGWHVlRjJsUnUybyt4Nmo1VzVJRGpZWWpMSFJra0IzWE5WZmNJeStqR2Q4?=
 =?utf-8?B?dWJJM29FWGtTUFJwMmtNNzMxV00vSTNBd3kweGZnUm5jNXAvdVV3ZTlSSXdR?=
 =?utf-8?B?a0Ezc0JST3UvcmlXVmpsU0lydkVsTWhIZmhCaGcxZXp5V0NiaHlQNlBsV0g5?=
 =?utf-8?B?TG8xT0hUdjBjeTBtSjZBYkwvbWYyNXNUYzZzZ1ZDbmYwNFozVSs1dldMOWVy?=
 =?utf-8?B?SWMyalNLc3gvd3lUY2YxWnlaNWtHdzNDZFhjWXNTR1UxeXdsQ0prZVdyOEVi?=
 =?utf-8?B?SVNQQUx3SU1NT2JpRXJGcFZwWk5KM29DYTFzQlo1OVBLbDBvb1ozc2hDamNS?=
 =?utf-8?B?L1M5dC9kNWxJNUU3cXh3RkM0ZkJaQ0dkVVNLMzhvSkFpQzV6T1lsRnNFUys5?=
 =?utf-8?B?STVMT1RnRVpxOHpVOG1zZWRqUU13VnFWN3R1OU1WcjlZYmVkc1Y3TUpnV1Ja?=
 =?utf-8?B?Y2JBWEJqT3JjeHhROGQ0N3NTYkYyZ0U5a3pYaEYyZWpKMEd0UlJYcW4vclg3?=
 =?utf-8?B?dXdZaUtQckZvaFYwSU1hQmI4WU9QeE0yYzlWckRwbkZ6b09aVndaTjd2MWRy?=
 =?utf-8?B?ZWF2SHlOUDBCWHU4QXJYM2IvdVZjZ0hYdmhta2FYN21xU3NHV3hJc3gxVFY2?=
 =?utf-8?Q?gbycQXsf9Gk7Vfz2dpnQt7xcWLtnnw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(7416014)(376014)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dVplOFNzT1d3TTRnVWh3T0RjaWRBLzNWT0RzeE1qNG9ZNDErNWFIWUc1VmE3?=
 =?utf-8?B?cXZ4ckVScVZuTnNEQU9SQ3dpVVNucUc3aVFMQXBaN1RZS2VVUUVpTktDTlY3?=
 =?utf-8?B?Z2g3a0c5bXU2RVQ0di9wUkwrY2N6OGM4bjV6dW9UUXlTdW5xWkwyT2R4cS8z?=
 =?utf-8?B?NFZ0bHJFbUpCZWlZWG9nVnBZUGhnZUlyalRqOWZXVjZHeHFjaEF2K1d6ZE40?=
 =?utf-8?B?eDRNTnRQRXE2Ump6NkNBQ2RtYVNQTjhZS0RoMHBNWGU4ZFBJeTEzQVpKdW5Q?=
 =?utf-8?B?Lzkyb1VsQlJwbmNCY1Y1R0dqTzF2dTNudUlKaTcvcVRlcW9GUGJ1bllpZWpv?=
 =?utf-8?B?UElUSHY2K3htQkx0clZhRllxbU9DVEtEcGFzRTdrYnI3V2hhalhuT2xwcnVP?=
 =?utf-8?B?WlpQSk5XT0lYUkNmRm11K05uU0MzdSs4N0cwS3JyOWY4aldSaWhaY2JqdTZE?=
 =?utf-8?B?d3VyMEsvZUNvZW5qV0ZPbVBWS3JFdDlmVEhrTzZBL3ZKUnRmemM3Szl3ZWcy?=
 =?utf-8?B?NktxSFd2RnBZRFhBelp0TDhXblpXbnJPM3lVL25ZTmJseGtGTXR5eHNKSE5p?=
 =?utf-8?B?N2cwSUt2SkEyd3g5dTBxNTVzdit1cUpiamVyWkFWOWk4bGxJaml4ZFRVQ0hB?=
 =?utf-8?B?VVBuUDRtYTlBYUdJcjhYTGRKS3VUcHJvbHFJOFlUT1ZlN3BpWFY5YVl1T2pi?=
 =?utf-8?B?TkNGNmNBODNIRFpkeXQyWVBtTmtZMVR3eW9yUzlkQ3lvTlp2MDB6LzlXUjJT?=
 =?utf-8?B?dVQ4MDhOZkh1d2p4ck83cWtQZnRaY25Tc2dpMjJNOElOdnBwcmxlb0duSHdU?=
 =?utf-8?B?dVFiek9kdFNlTkF6VkFvV09ocjJCYk9nR0pEcnFxZ1hkd0pISCtCdXUzYzBK?=
 =?utf-8?B?cGJFL0xZQ3hhZC9wQ1R0bGgzREtQVkdoOEwxbXhMampYdXo2RE9EektWblgy?=
 =?utf-8?B?YndDc0VRelc5L2t2RE1SRFl3Sk5mcDhUc01Ia25pMWV5ejhBdVcwSHJCS0VI?=
 =?utf-8?B?b1V5QkxzVHZ2bkhGK1owcHh1S2haQVNtRm4yTjVLQktqRkZpOGpjeWVGYkI0?=
 =?utf-8?B?TkNYSmVWMUdWT21nMEFaWWR4VlRUNjVqME9URU8rUG1pS2V6NXZYTHpLdndk?=
 =?utf-8?B?aTk5ZlJQQzBoNkh5U095TEIxWG05TGFPd3VvR1kzZUF3MEMrQTJybXo3ei9F?=
 =?utf-8?B?ajBiQlc1MUJFUzdKY21pN2NWUDRlVE96YVpCaXJIS2hvK2QyUGZFQ2drRFdh?=
 =?utf-8?B?QkRYU2tzRG5xWDdlZ2kreWxIeTl1WEpsb3BqYWJkN2dHeHVjekFqNWh5T2w2?=
 =?utf-8?B?cHJhYU1MNEt1RnJRSmhEVDkzKzk0Vmc3SzVzL083VmtNM2wvaDhkZ04ySVd2?=
 =?utf-8?B?T0xoRkErcm5xSDRtV0tDWEt4QTk0R0JOcFNsd3JhU1R1OFpHVFJUaGZSRmoz?=
 =?utf-8?B?anE5YTJvVlFSNW9nWGZ0QjB2aHNVa2d3YnRINnN1QVc4MHErSHgzb2h2ZkRp?=
 =?utf-8?B?Z29SdmlIMHlxRHRuR0p3M2Fxc29HbHMwUHVmOFJzcDhRODN5djNYNlZIOGR0?=
 =?utf-8?B?N1p6cklDZmh6YzVLYlgzaGxEdVljc3NCSFZqcExBSXRtaTJIZ3pwNHdYcjV6?=
 =?utf-8?B?dThzM3NkdVR4YklIeUF2ZzF0NXRRKzlBamIrdk01KzRIWEFPMlVVbGtTRW9t?=
 =?utf-8?B?ZlY0a0NsbFJXNmFtR2x4VjFIUFVoRW82YndsQ2dhWmhKU3hhb1NXWm9rYmxZ?=
 =?utf-8?B?VUVWeWVZOGR1SDgzOXZEL0FTN2Vnb20wTFpVd0dzZW1lZ3BzYWVOYUJ3Znph?=
 =?utf-8?B?QzZhbkx2NjJLaEtYNTdDNCtldnZmZW5DSWxDaDZKOU9HMDJUbGJsbTBVM2Jk?=
 =?utf-8?B?RzdrU21MbUh2OW56WFpuNDcxWU50MHh3enpINEtGdHdDYTgrblVESkQ2SzZo?=
 =?utf-8?B?VmgxK2FRWlV5anFBOHdRV01iazg4WEtPMCtnMXlkQjBTZmh4am51N2w1dXRM?=
 =?utf-8?B?cGhPajVYdUlTQjVEQTg5MkZzTnh2MFRaTCtLSXhRWDU0U2VncU5FMmI0b0Jo?=
 =?utf-8?B?SFZ0RUkvQytJUnBSV3NBZ1dCR2NidkdRcnNNb3lseUI2RGZFTVo0OHhhS2t0?=
 =?utf-8?B?WmFzUW9CQ1NlVGRTMENaVWhLaWV3dkRrc09aSVNpL2JIakdHMVdRa0RWZGt4?=
 =?utf-8?Q?Vpm9d5DuB32njIuaF3DO/YWTgeq84tU/+76DDjZ9r9kJ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 800f4845-37f3-4712-b98f-08de1c41ccb5
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 08:03:26.9055 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YT43lW/FguA2wgqvSOOLS9PDbji357kC1jS0FGWEwooUdkvrl1aWF8I/Vb1GKJfSeNlMCaNmhzUyQw3p+gmLFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4450
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

The use of firmware_loader is an implementation detail of drivers rather
than a dependency. FW_LOADER is typically selected rather than depended
on; the Rust abstractions should do the same thing.

Fixes: de6582833db0 ("rust: add firmware abstractions")
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/base/firmware_loader/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/firmware_loader/Kconfig b/drivers/base/firmware_loader/Kconfig
index 752b9a9bea03..0e6c1343409e 100644
--- a/drivers/base/firmware_loader/Kconfig
+++ b/drivers/base/firmware_loader/Kconfig
@@ -38,7 +38,7 @@ config FW_LOADER_DEBUG
 config RUST_FW_LOADER_ABSTRACTIONS
 	bool "Rust Firmware Loader abstractions"
 	depends on RUST
-	depends on FW_LOADER=y
+	select FW_LOADER=y
 	help
 	  This enables the Rust abstractions for the firmware loader API.
 

-- 
2.51.2


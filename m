Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F22BBB750A
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 17:26:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B91310E13C;
	Fri,  3 Oct 2025 15:26:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="njI+ks5g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012060.outbound.protection.outlook.com [40.107.209.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0978910E13C;
 Fri,  3 Oct 2025 15:26:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PbXBbH0kTKizMgo5VPQBycHn9pfWl7kwHkvCR40tfkxU4fc4CHa69b4M2Zwuvir5GNS4YjKnEhtqgi2B52vaWFYi+Fbqvs/nY8kbl7GMADHPIY06h4N4reBiw4Jc7BpHDmIHVQMc1EDG4irjm7/EPJVCGZUJAnyCVpAEFsz8HQy3MI+qudYCZxQlvLlwPWlmBmGbenj5A24JSQQBxSArh4XD0asCBh4ncKS8A9MKTBgn+ZuZqolMmGudpOPsNLZjNIIme78hwajw6XmoRsUjZYpeXGBXMcMseBplcM4QHGM/HKFjKJTl13KYxZjevc6pZyHVkBLITj8b3P1EEINZ0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aqBNmR3gXDKJWzC0izE3dXrdiNpgf5zQQuca6jTJ82w=;
 b=vLDYON2508PpERoSGHl+/CCoBM2E77u0sRGm5vTlN8HkM0eO0kTy8fv4W348ocb01G6KCjqUOXX5tEIKonPYkq8ewFG2ufPhvEEKtn+y1DvxsqkppOGutnD+zlRUc580qidN07gaSMfU+huv3V+bZSVvtxPDdVIIP2gf+CLYIJ8nNrINsUOKI4nCTTj2SlvQGY5fAK96IQFtiuvvlvV5DUdN3f2f20lEjGH+oWrv/gxOCUDgooH5HgO+rE7QMR9plrFVfIIpfuw/9+pNVUuADWOPVmC2njCltrH4/OFVYnXvy1f0qDZ+2fe3ZnaWx6acFgDJkLZX6a/bmNYxtppeqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aqBNmR3gXDKJWzC0izE3dXrdiNpgf5zQQuca6jTJ82w=;
 b=njI+ks5g1J0OIZ1CTOUcZphg0GU1OmmKvbsWOQpOcVoMf5vL4eS5Mt+Nm3ZDxh9jkhR4OFgWihXYGahWcw9VgF2TERakm3paUSLst8boIEWWRaQc3uyi82wLn5b5OuC850WQqTEO4VU3nxnO+1zjuCbQ5wSY96ovy9JZMvK/ZFjc0nk/lGC6N5v48oIoL7aj+aMxTk4/i2hcIl8I3pkPvNFURpsWPJKtttXy4Be+mznmYvTdrVWrdGhhzPossLHfnPVg54W5Qy0hBTn527g0n/aMurc2ZDm3FQfGU9nlBBw/Dse7TeCtT+0ZhD124m6+U3Mup/s0JVPus3kokiCUCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DS2PR12MB9751.namprd12.prod.outlook.com (2603:10b6:8:2ad::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Fri, 3 Oct
 2025 15:26:32 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9160.017; Fri, 3 Oct 2025
 15:26:32 +0000
Message-ID: <4f6ac8e8-3dee-46c3-b3a6-992bdb0225f8@nvidia.com>
Date: Fri, 3 Oct 2025 11:26:30 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/9] Introduce bitfield and move register macro to
 rust/kernel/
To: Alexandre Courbot <acourbot@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org
Cc: Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>,
 Yury Norov <yury.norov@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Andrea Righi <arighi@nvidia.com>, nouveau@lists.freedesktop.org
References: <20250930144537.3559207-1-joelagnelf@nvidia.com>
 <DD7G0ERRKG3K.1AFE4FSLNBZCX@nvidia.com>
 <DD7G18DF6PJ2.2E1N4DXGT83KL@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <DD7G18DF6PJ2.2E1N4DXGT83KL@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN9PR03CA0283.namprd03.prod.outlook.com
 (2603:10b6:408:f5::18) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DS2PR12MB9751:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cb8a44b-43a6-42f5-73d8-08de02913b5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dXBGeE5Ld0RVdlQyMDZVVjByMUpCVDhMTHV2cnJLS1dNblZtTy80UGNCTTd0?=
 =?utf-8?B?Z1RieFI2UkdKd0REWXhvWjdJSUgrdk55VVM3MElaNEhWR0oxdXlEQy8yS0lU?=
 =?utf-8?B?dVRmYXIxcFlYOGxMc1N3SkhSc0xucW5sQXpUQ1M1SVhQYzNMS0poWHUxNGdB?=
 =?utf-8?B?ZnJ5aERWakxaT3Z3ZzY1U2g3bWVtcUlGazBlV0M4V0NFZlVZaUZ5R3JHQkhy?=
 =?utf-8?B?cnZBL3ZEWmplcWVyNkJxbWY4Ui8wK2ZzaHdoajNQeG8wYzIrdVNYK21hUTBX?=
 =?utf-8?B?T1VzSHNJRjd1RGI4Qmp5Z2N4NDJkT1VUQkFBNk9qNnViNjhvN3pNa0t6eEVY?=
 =?utf-8?B?T1QyWm1sc2JpYXZ5T0xzN0tmTnJ6V2ZDYXgvWEhKaGNBS01hNExkTEtLZXow?=
 =?utf-8?B?MFlEbjVCRXdQZmsyVDA0NjZBSlFKMnBZZ0hpczR5VFpVVERMcWxvR2J0SHUx?=
 =?utf-8?B?V3FmZ0NsMW4rNG91cy9iVjl4VTFGZ3pFNHNycXU2S3AyRXlKSktROUUrd3M5?=
 =?utf-8?B?ZjF0blQ5UnFYalVKYkVlcG5xbjI2YlpIOTU0ZWhkdmZGeDFURjVaZ1dCNGlZ?=
 =?utf-8?B?TysvYzhZNE1BcHJqMFVOSk5jOTNMNVdlSEpPYmhmNDRWZXBISFVKT0ZmeTdw?=
 =?utf-8?B?V2EwektvTFFFK1RJWmEyK3B2eXdYdS90RVhKL3lSZGY5SFVYYTVzQU5oZHgz?=
 =?utf-8?B?K3B6Mkx5dW5pYWZGOHpJbjBLaW4rUWNsZjVpWm9tcUFpempZL2tqVm1xT1hT?=
 =?utf-8?B?Z285TjdMdkRkK1l2RGtMRjRPb1p1MXVjOWdmQkY3Y0xjdUZhdDVjL2JMTTEv?=
 =?utf-8?B?aHRvU2phMUczVGdQT0g4U0lGUWh3ZnNzM1hocEQ4UlBHelIyeFp4bk9OTzNm?=
 =?utf-8?B?MSsrUHVjMTVmUHpEUGZEN1RhbFE4cFRrcDUxejBkNnB5TEFXakxyVjNhM2xS?=
 =?utf-8?B?dDdwc051VXFWcjFsY09QTmsraVozWnR5QmduUXFxWVE2d0U0ZFBhTXRWSGZO?=
 =?utf-8?B?MlVnZjJ6bmF0blBoU2JiU2tBRFFpdkZjOUdJallFWEFxSk9CRnRlb3Bzc0hE?=
 =?utf-8?B?VEp0c2k2djd3WC9SVzdsREE2SFdSenZ5djdWY1NaTStEWU4zeFpXV0xHUFF3?=
 =?utf-8?B?U3FBOUNBZkYwbTRvdHl0em5MRmczMkFlMUNpc1NFeUxJVDk0OHlGeVhub0x4?=
 =?utf-8?B?M1BLK2dNemwzcGRrU2c4OWQveFhvNFI1TGM5WWRHQVNNWU44TUVOdHE1OEQr?=
 =?utf-8?B?cUd5LzFWbm1OdzB5NTF4Z1VkQ09HbytWNWlBaHJvTnlNOHZEUUlnbWUwTXBn?=
 =?utf-8?B?YjZSeFpoZG1qbzJJQmM0OUNWalhpaTMwdmhMZXJHeWd2MEhUQythVGU2dW45?=
 =?utf-8?B?T2tCR0JKNXpZbjVEazNzSEQxT0MvRHZFeWVMSDJyK1NJdEttM0VWcm1Rblo1?=
 =?utf-8?B?eHBueXBXMzFNa2d4WGlxRlRUYldDamlrTGRVNlM4VkN6anMyTk1SdEt3bTBH?=
 =?utf-8?B?WjBmQzByc29RRk1PQlJ4S0ozVUZkQnp2MytVVk95Q09JSkJnNlY2dUZSVmh3?=
 =?utf-8?B?TEdUVjJnMEszUUFVdDNpR1E0VXpkcHhJelJ5ZzVodVBObCtOS0lQUzRDeG9v?=
 =?utf-8?B?Ly94bVNZbVFFdkloMnlqZFE0ejhJWjZzTjJOdFpUNnVZUXFJdm9zeWVBTk16?=
 =?utf-8?B?bjVFZ0FhUDB2TC92VStVUGJWbXEyRnRiMUtieXozVEFPRmVOTVptVEY4OUZQ?=
 =?utf-8?B?cjZGeHFMSjFxM085elpBWjRPZ2NKYTFQNjdQcGJxNDBlTnlQMGgxR1ZSeFdh?=
 =?utf-8?B?L1dGaE9VRjU0NFFsQlY4b1Z0bWFsQ0F6QUJxYU15WlNtZlRTcjRZYWtYaktz?=
 =?utf-8?B?Y2xyekpCM1ZQdzMrVVJUUlVza0k4OGcyV1IzVmVOcUo1dVl2RmRHWGJ1S2JY?=
 =?utf-8?Q?Yw3yKDVL4VmIHitT6ceuKGZLdY7ZWbV4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WTlYdlRvUVNRSE91ZlNIVnQ2Q05TWExIaVdCYU9HeWN3aCtLbHlHQkdlUzRk?=
 =?utf-8?B?eEJkZmMxTlBWYW5Wckd0a0U4S1BPTUVJYVV2RzBjWFg2MWJkWmc3dkxFWkNM?=
 =?utf-8?B?Z2lNTklHTko2ekpmVXZjbi82R2RkWkdGNjZJa1V2S0hSd0VTRVU4VDEyNlRP?=
 =?utf-8?B?KzMwWFFZZWtlQWN3bUcwOVExZDQ4ZkR6d0gyNFlLWmpNR3NERmdZMDQxNzVp?=
 =?utf-8?B?ZkJKM21hSk96RnUrc0pSYlY2WXArMW1nS2R3UTRQem1ZeWgwaHkyc3A4NTll?=
 =?utf-8?B?S1dycEw4a21aS1d1K3RSc0lRSjBMV2JUWTBnaUFsb252dys3M2UvbHNLK1BP?=
 =?utf-8?B?TjlabkNpdG5MSU0yV1prMEZKU0xRVkVZRFVmVGg5ZlY0c3RiYnN4LzBQeDg4?=
 =?utf-8?B?bzBLSGhORTFlb0IvUm13SzcxUTlaRytaSG9icGdBbWJ2aUVnVm1QRVBEZUpl?=
 =?utf-8?B?cVgwQU00VW9vY211QkZYQ29yYXNIT2lmajRCWVNOZllhNkNUMUxaN1lHN1F0?=
 =?utf-8?B?YlF6SWdnTEZWc3ZjNlM2dHBlbDUwanU2d3dBRWVQUVBDYUE1b01Fa25qZkF2?=
 =?utf-8?B?d0NQeldOSHRDbW9YUWFyaG9XNE9NSTVLL3ZUZy9Nbk9ycFAzN1h1cTNIVHl5?=
 =?utf-8?B?RDNCTDBQMTdmWkRuNU1kcVdYd3ZoVHkzeWVXMkNoS2JOZ0I4cXNqdFJtZ3lj?=
 =?utf-8?B?blNRZXNQV1FTd1lYd09QQW5TODJMRHpCTHMyTzRLQVArUmxyVEdxLytBMHRG?=
 =?utf-8?B?d1FMRm9SSnEwUG16WmYrR0puOE1GMTBoYUVoLzVLWDA3bFFSY2NpNjQ3SE1S?=
 =?utf-8?B?UEJzSnhpUG9VNEh3U2pqOS9aUGREZVFjUmN5TElBUnRwZGo3dmtCTmx2TGh3?=
 =?utf-8?B?YVg0QXFZRHRIMExrK0dCc0tjalh4ZEVxTW0waytwNnZrd0NLc3liMmVIRjdv?=
 =?utf-8?B?WEQyUm9xM1BGa0VFUSs0YlVIKzAwb1pVUTQvdTFGWCtIcUVzTE5RS3MyUGJG?=
 =?utf-8?B?THg5WGZrVm9oTW1xZzNWV2xnMTZCQVQ3UDR1WFpxeVdUYkxqTnlWZks5dHBG?=
 =?utf-8?B?NXBtSlNqem12NDJ0WU1qVkNwUjNtYUhRdmVZRC9TK1BJeVovZW4xVG1WeW9x?=
 =?utf-8?B?TlZ6aEE4bGZrM0tUNWwvcG5mdXJBMGhtYmlYcXFLd2ZqTFZkczJhZ2Y3QlNl?=
 =?utf-8?B?WkJlWXI1RUhUTkRQQzlKK0p1Q2FkaHJ2d2pYdVh0eHVkZmJMdVFMdGR5OU5s?=
 =?utf-8?B?T2hhS3Z6dFNZSDNqenY5eENjTHp5TlhUaWJ1bURSN25Va243aXpUODFVUGxF?=
 =?utf-8?B?eW1NelpEVUNzRFc4Nm9neHAxSTNxbDJCSi9LMmFwQzVMR1RaNng4NEZlZk90?=
 =?utf-8?B?VmpRQmZXZmxSL3JiSzVmdGhoK1dycDVsVW54TUNESEsraW1uR0ZhdS9YWDhI?=
 =?utf-8?B?TG9Ebkloc3NlREY1Risrdkk1akx3TytKeG43WTFiYVc0bjRyYnR2UmdNTEhL?=
 =?utf-8?B?Q0VEMi9PdnNUZWJYNEQrN09QTC9pYlJtZVRxSWhiTEZMQUtMNlo1RU1IME4z?=
 =?utf-8?B?UEtoaWJxYlFFdVNQK2RTeUpGbVJZWHpHOE1seTJxLzhLWlFiTDl6Q0JYNFhi?=
 =?utf-8?B?dE9wNlpJTUREV1VnVmU1OVliR3pOcitPbVl3L2tOOVQ4WE9oSGY1MFVrb1pL?=
 =?utf-8?B?VTJsVXNIWURzeTBkaE1SN2dFdWZNbWJWWUJUdjhRbVY5TU04ZmRPYkJtQTVE?=
 =?utf-8?B?N3lnZk95cXhPZ0V4YTk3a0hxRzM5bFJvdzlnNTIyS0NDeXF4SXQ4K3NRVGZu?=
 =?utf-8?B?QU1YNTcwZmhwYjJpamVwbjg3ZGRmdjNYa0VXOW1Td3pHcE5iYzloem1EWFZ4?=
 =?utf-8?B?cVduR0doVU5kRThuWjBDUEJTd1k0bUdHcC9jd3hkaUdRVDhUWDk3dTd6YWE4?=
 =?utf-8?B?ZlRKMHJBeGc4bHhaT0o1ZkxaRVlPQmh3MEZ2aU1zWnV6M0djSDlEeE9KaDhV?=
 =?utf-8?B?K0VNMzJSSmxvT0J2eGZvS0JhbTV6ZDU5ZVVnYnVMOFpKUE9ua2ptOUFZK2pi?=
 =?utf-8?B?aFhpRURNcFJZSFpvTi9XMk1oSU1NV1BHVm9yWWV0dnA3TnZuNyt0cG5XejZI?=
 =?utf-8?Q?grAAiKhos7F+bvxm06zA8fajv?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cb8a44b-43a6-42f5-73d8-08de02913b5c
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 15:26:32.4691 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2QIvFmN926Kpf44pDUePWY/FH/gg1olp02Z0mrF4zItd8e8T5tQ+E23EGt0Vro/GkPqwe0JhCgKf+DSLQJyZKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9751
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

On 10/1/2025 9:26 PM, Alexandre Courbot wrote:
> On Thu Oct 2, 2025 at 10:24 AM JST, Alexandre Courbot wrote:
>> On Tue Sep 30, 2025 at 11:45 PM JST, Joel Fernandes wrote:
>>> Hello!
>>>
>>> These patches extract and enhance the bitfield support in the register macro in
>>> nova to define Rust structures with bitfields. It then moves out the bitfield
>>> support into the kenrel crate and further enhances it. This is extremely useful
>>> as it allows clean Rust structure definitions without requiring explicit masks
>>> and shifts.
>>
>> The extraction and move in themselves (patches 1-4 and maybe the KUNIT
>> one) look good to me. For the remainder, it will depend on whether the
>> BoundedInt idea sticks or not as it changes the design in a way that
>> makes most of these patches unneeded. In any case I think this can be
>> worked on after the split and extraction.

Sure.

>>
>> Patch 5 should probably be dropped as it has the potential to clear
>> register fields that are useful to the hardware but have no entry in the
>> `register!` definition, making read-update-write updates of registers
>> unpredictable.
> 
> Ah, I forgot: please base the next revision on top of drm-rust-next as
> we are likely to apply it there.

Done, I rebased on top of drm-rust-next, commit: 299eb32863e5 ("gpu: nova-core:
Add base files for r570.144 firmware bindings")

I will send the v6 out shortly with just the patches to be included.

Thanks.

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F33BAA9B0
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 22:46:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4769910E257;
	Mon, 29 Sep 2025 20:46:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="kJUguQLi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012003.outbound.protection.outlook.com [52.101.48.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58B4310E257;
 Mon, 29 Sep 2025 20:46:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MqNb+Iu9Q0Y82Wijzqt6k4hHXT/2ZWFusVlrzEXcQWx9DiGrKA1QKftyGN8Gh5sLQoR/TjSRfcOoD+Oo1dehH+CthR/iIbasDHbcCzf9ga7h18yqXMYjF6ylARm1Xmx/fX1jifEBWqOkzi0GzGcBjbaeDF9EJoEHdopRoj0vgFLKa0v9deh+sIYURJiblfXiTZZltELPVZFzozpICEh5CDK1jR3Z/xiPsTXTcuWn4DvolVrdX8CFFtuQIiAQDmle8pvZx/jBDCKrGBt2fLxOf8RRTAU9B2pVkSou45cyuDkawSYx+r1bn086PxShzewGr8ZN/dUzdnF8zkPZl8SfmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wK8bnZ6y3spXs6nE7jsERiyZs4XN+eTxlTYvGvs3TR4=;
 b=R5tOY+KoNr3qxvpEeOsESkkUWrItE4B1lWoTHXJUVT0/A2V3palcZjjrQ89g0LcHnX7hPMVhmbqSCKa8kEBJRd3LmQb0am9/Kut05UN/FZssBx3C8tb5rjSjR/S29A+vHxjxXrn5JCAN5BkcljB+KK10aPo6RCws1Dbt2df3khQwV1BQJGzLedKZmfCa3ZGIEuUVnJA4B9260gpVM1/GCtkKTNfHKGiHO2FDkUt7LjPBa8VN7ttmSL6zYpJHNRgE6zCvdKUOxkhIGLBx0KB6MCOFRxAnZ/MGt9dpRy0cDds0vQmj4q+WrS7stzxwWNJzNRNa39SzFZcW6Nqvkbb18g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wK8bnZ6y3spXs6nE7jsERiyZs4XN+eTxlTYvGvs3TR4=;
 b=kJUguQLicXu7Br3wCsffpc8DtkLzRD+ew863OwBWtUX/b0t/iD6KWK0FWz4b3z0ypmO2YU9vJ70x4E/f/D6KqPh54d35T0NJ2pz2EiPkrUbGomADfUxgyu0jC9KxpNvosR7vEWho4tyzNj+bLrwetE3f+8Xj1cyey5DTkN/EDCk0dizQsI7pEZMkrBf5GukuCztFS+lU+bnJgRe2lHggLzedUM8QluDBIU02YV+mPvamU1NJQs7mviMbiRvjC4xE3mt/8ohWrprZ6i+W9uViUlQ9Z2/NEFhK3D0g6PUFdFSUUE0UoyBxupacosdGTH1Y4ZJeILFGem4OCDnsKUFpMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DM4PR12MB5818.namprd12.prod.outlook.com (2603:10b6:8:62::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.16; Mon, 29 Sep
 2025 20:46:43 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 20:46:43 +0000
Date: Mon, 29 Sep 2025 16:46:41 -0400
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dakr@kernel.org,
 acourbot@nvidia.com, Alistair Popple <apopple@nvidia.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 bjorn3_gh@protonmail.com, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>,
 Yury Norov <yury.norov@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 nouveau@lists.freedesktop.org
Subject: Re: [PATCH v4 6/6] rust: bitfield: Use 'as' operator for setter type
 conversion
Message-ID: <20250929204641.GA3056955@joelbox2>
References: <20250920182232.2095101-1-joelagnelf@nvidia.com>
 <20250920182232.2095101-7-joelagnelf@nvidia.com>
 <CANiq72k3kE-6KPkKwiDLgfkGHCQj4a2K7h9c4T13WMa5b4BAnQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72k3kE-6KPkKwiDLgfkGHCQj4a2K7h9c4T13WMa5b4BAnQ@mail.gmail.com>
X-ClientProxiedBy: MN2PR18CA0019.namprd18.prod.outlook.com
 (2603:10b6:208:23c::24) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DM4PR12MB5818:EE_
X-MS-Office365-Filtering-Correlation-Id: 097771da-34d6-404e-c918-08ddff994c69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T1hSSDZuRmFuVTA4blJvRGFvbkRvY0t2UXhoT3BzRU9ZcVZyWWhhYjdJRzh5?=
 =?utf-8?B?eFRJVWFWR0R5dnl4bGdvTFlnYVladlZIVk9OL09ZMEt5TGhnV0V4MWdLT01J?=
 =?utf-8?B?MzdwOExZdWNSbkdSOXoybmN5N3NnSG5uSy9wTkhObTI1NEJBMlJkUlpxWDBY?=
 =?utf-8?B?SGU3RmRSb0MvOFBLS3FQVkJuRXBlbFR0QXQ4U1pmT3U4YkZDZVgzSmtRMjVt?=
 =?utf-8?B?UHZGUW5JL0FuYlZGM3NKbmVBU0ZFMGdGMjVmSkllMzFvdENQcDE5QWRvMkI5?=
 =?utf-8?B?ZUpwdnZjVlY5ZGJ4WjV6SUxBbHZLSGd2cHpVaFcrY3NtWFVrSU1UMjJINjh3?=
 =?utf-8?B?MWk4NkhBNG1WVmh0azV0dUZuTmlLVi9iclhRdUJ0SFVncmhTWk45V0Q5Wm1T?=
 =?utf-8?B?Y3hkTTlqWTBJblJWODhOWWxWNm5vb1BjUGVPSGVLRVN0RTRURjFmM3p3WjhF?=
 =?utf-8?B?ZTFtNjdOQVNBNFh3d1JobEpZQjJNSm44K1VmcUlGU1NWcjhXTUdhMGNJQW9B?=
 =?utf-8?B?QWxnNnhmcjNrdC9ER1NNdy9wVHZnZUR1anhXbDl5OEJjb1I0cEl3Y0ViM2R6?=
 =?utf-8?B?Y2Zia1RSdE4wdFpBdkdEeEh2VjlNSm5FTHN6RHR1K3FQZVZlMUxwQjlVdmtE?=
 =?utf-8?B?S3FVd05nYlpGeGpFODFWNkJ3SVZZTm9qclFWbDZHWEs3QjAwOFRmejdsNHJ3?=
 =?utf-8?B?WFE0QlVKUGVnTWRqYXdtaU0yM2NWMWpVVXdoV1BkdEVTUk1jSTRnME1iMHYw?=
 =?utf-8?B?RWNleENwWG9wd1BVUmdDYUZ0UHRRS3M5RFZJVkNrUUNWMVlXSGpDOE5ObTNO?=
 =?utf-8?B?NUh2QWtKZ1ZWN3FHYy9EcnNqMEdJUWg5WUNCOW83Vk1JV1FUUy9SbG05NkNI?=
 =?utf-8?B?YUFxTlJJSTlscjN1ZEhIV2hnTzhoWDhWVE1lRnBjYXVqMERSODgzZzhzS0xk?=
 =?utf-8?B?SlZPZ0krLytEN2I2VG1UZHZickpwWGg0Y2xnM3FLLytKa01HZEEranNuV1Jt?=
 =?utf-8?B?OGFtYWNaank5V2w0RXRIc3pqSDdTcEd1TXIxLzNkKzgyMTUzdm11WHc2OG9q?=
 =?utf-8?B?bkRQTStCN1ppai9VZVZlS3pVNWI3M2lHZE9sYXlDRnNtVDFCa1JhTVVGc3pL?=
 =?utf-8?B?alFvcEdsTUxuREdWMUVjNEFPZTBIZ2tFdmJsZEplQjNUL1hQazdVUXViUy9w?=
 =?utf-8?B?bTJGQW1wQXIrd1VhanVjZGFMOWltcGlZaW81YnVKTGpzVHBGM1dlRUZ4ck5p?=
 =?utf-8?B?dy8rMkoxSi96YjV5Vm1SSjV4d0h2K0VINlhNZGhWYTUyamVlMlc0ZUlsaVBp?=
 =?utf-8?B?RHlXRGhybGl5UkgrYTFuS082R2dpQVVJaGhFQ0x2eWszQUYxYzFUdmpsSWFU?=
 =?utf-8?B?M090akFWdHBzbk55OEtROWtSQjRidENYeUd4eTFTaGprSlFGM011Q0FWY1VT?=
 =?utf-8?B?M3RoUWFtMVRoVi9laUhuWmlUTERnS21GVVlycWl1RVFmVEJwdXpXYjFhd1Rz?=
 =?utf-8?B?WHhsS0wwR0VRSmVUNjMyUTV6dVo4VElMTXJ3aVRVTXZxWWpNT3d5bUpwcE50?=
 =?utf-8?B?enNBd1IrdzRCcDI4V2lpaW0rcVpWaWpxY2NDcVVDUXgxYmEvdFcxOGNIQnhP?=
 =?utf-8?B?Vk1ZbFlwTEFFQzY2WG9EY01neVhPYTFCMDJxS2xmNTI1OGVESnFpdXh2Q0RX?=
 =?utf-8?B?aUFiWWRRb09VOUtOeVJ4QWxIYmRqWERGVDVOL2kranpqQkZQMThFbTBkbVRm?=
 =?utf-8?B?d3IrMTAvNldPOTVubGt3bmJXSDkvNlVlejd1LzJJWE1uNTNLWU5PeGRRYWxo?=
 =?utf-8?B?VWh2SmFnTjJzcWVQT2xpc1FjMXh6b2ttUXdtN2c0ZWhKelIxU1NXaFo0c2hv?=
 =?utf-8?B?NzlUWWZiNlY3V2tDT2JBeGRsUkFDdTVYemxkN3R5UytRR0tsN00xUEp0Zi9u?=
 =?utf-8?Q?spiS7qGOSgkL2jM12aqu+RJwHUBEDI8u?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RGFiWmZvTE5ZYUs4VmV5dkFTK2lkUVVGYjJLSGRlTEhlMGpxVWVpNERRMFFs?=
 =?utf-8?B?TlZQK2xjUFAxR0NIOW5jV3dRNUcrMTVBTW11b29FRTc5MjhwRVR5RnMxNFo4?=
 =?utf-8?B?NFk5aG1VNDhUc253Y2dpVmNQWjRJSWR3Y3lnN3ducEhPRklaeExTNG5pbFhJ?=
 =?utf-8?B?dE5YOFRsd3EyQ05LeXE5aElBeTFjTjFsbmRvYTdRQzhLd21JZnE4SGlaeFN4?=
 =?utf-8?B?MGx1TFlEUXI1K005V0RUVjYwT2FIUml4NXhNSXliZHo4SzNrZXJDdlc5enN2?=
 =?utf-8?B?VnluL2duemJPajZnUFNrUGk2WGQ5ekd5Rk4rcWpMbk9CSm5qM2Z5bjJmNHJD?=
 =?utf-8?B?aTJoakJKQ1lsckhDU2Nud2p4Ym8wU3Z1REhDRWZzcGlGRnVLd3NtYVNzU1NQ?=
 =?utf-8?B?WGR4d2lrTmIvbUtMeHZMenNXZDlzeTg0NEhkVnMyZ1BPekhyNU1ORmtLZTdS?=
 =?utf-8?B?ZXRGbzNPSHlLR1JxdDdVN3BDM2RHMFEvNUU2dHJFc1ZxMldLcWgrQ1NDR05z?=
 =?utf-8?B?N0ZsbnZzSGRmOGVMd3VacDlkdHJPUllKU1lZME9XcVZjdm5zVHJ4bnNhZ0dt?=
 =?utf-8?B?S29ZdkR3aGdDWlAxMDRjYmFxckpXcXRrZDJRUW1mWFZLZmhOdU56akcxVHM2?=
 =?utf-8?B?NkJPQVZEVUpjZlhpam9JZHZIL2xmdWVKTzc2REpjL2t3VEttNC91R0s2L1lt?=
 =?utf-8?B?MTdlSkl6elFUUzNFTXlweFBLV2xkVEZWN0lla1lhcnU5Q1E2dmRoUllpOXJW?=
 =?utf-8?B?RWpqNXVjQ1c4MXVFN09vVjVoTFQ4VTRpSndMZXlHWGZMNzUrSUZ0QWVRcWZh?=
 =?utf-8?B?cjNVeXJEQ0NQRktONTViOHFKNmV0UG1VOTdIcS92OG9IZTUvbDRjbkR2OE5h?=
 =?utf-8?B?ZGkwV3Rzeld5Y0JGV0xvTjROcE9ROUcvYnN6RUhrSTcyMS9YRFQ3cXlxd2p5?=
 =?utf-8?B?NHoyMzV5aXlSSHJyemdSU1BOTzN2cU1UZHRtSzNCaHNaV2JPa0ZBYTFYenM3?=
 =?utf-8?B?bkE4U25LcHdBeXZMVEFuWXdOYUhjNjZDK2VZck44bUpVa05lcHdRRHRJMGVu?=
 =?utf-8?B?d1RvV0JMRlVkVGFuT3JBcHBBbCtlNWF6bEJxUlhCTDRnMUJidFRxaTBBZmVL?=
 =?utf-8?B?RWxNSjAvUGNNMkxYcXMxMUxNUEdlVU5jS3NFM1JqaGxFU05rd0NBNjM3RW5W?=
 =?utf-8?B?Q2hEeVR3THJhZk9zbktROWJmcHppdUY4KzR0YWx6ays2TWJLTEd3NEFMWHNQ?=
 =?utf-8?B?RXkxV1ZFdWhCSTJad0E3eDVZYndRTERIL1E2dVVscWlobHpjcXg3T0lkbWY4?=
 =?utf-8?B?TTlHcnZrS09HLzVQbU53M2JjR1hNL1kwTys5YlVOVm5QalE1R0VzcStDSTVV?=
 =?utf-8?B?Rlp1UWNZSk50L0QreEtZS2tpN3dUYXBRd0Z3ZkFwTkdQemV2UE5iTlQ0WFc2?=
 =?utf-8?B?QWpmdjRlc0xvZWJObm5xWkpSckpRNFhQVlhqRVBQN2dvWmttM1dBL29HZUJF?=
 =?utf-8?B?a00yWW5DWnRxYzMxa1hMblk4QVB3S0tQTGorZ1I3TndiRld3ZlE4cDV3bnAz?=
 =?utf-8?B?VmU1bWtiRml5ZzdxMEN4cTZQb1J0VDFncm5SclhDMnZmbUIzWEVpdGpTemtQ?=
 =?utf-8?B?M2pOWWZxSHM5SmYxUjRqU244MG1rTjcveFFTYWVBcWgxaEN0dVNnemtQS2RD?=
 =?utf-8?B?VlBQWDlwbGg5UGk4U0VMckxmYlhOR3lEYTJiQUFyYkxtcUpsaVl5dzF2NjNF?=
 =?utf-8?B?azFhbkRCUGR3dml3Wkd0WXpWWkZvVmZJWjFYTFZoZjlJcUhHZUY5VFdMOTVT?=
 =?utf-8?B?bXA3Z2xLSSsxaitZRkE2ZVFFTVcwV0EzTDNnR25lV0ZRR2poNmpLc2FSdlpN?=
 =?utf-8?B?TmIrZmlueUpoMnJUcnNEYzB0RXJPL0FOZHlFTmhzaDJvVksyaERWNkhVZ1oy?=
 =?utf-8?B?b0tnNTJiNzZzZDVpRGJXREtoUFNucDhzU2dQODBSS1VOSU1tTStUWE5rbDY5?=
 =?utf-8?B?aVRSbkZnK2hoVS83NEFPTkJ5MGRtdCt6VWRwd2V2K25sdjd4YnRTQi8yU2pi?=
 =?utf-8?B?R2hzZGY5RThqY2NDN20rN3BsUDZFQ04rMTE1d3lYL0d0dXRYaGVFTWlpU1Bp?=
 =?utf-8?Q?XdF9znrgtK121G2oKEEU6NRvJ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 097771da-34d6-404e-c918-08ddff994c69
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 20:46:43.5632 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nuVIVVQ6RmoRlmg2vTU0lm04ENQbyW74UYrqmBBEEiwdnsi/CcxkoxetP7mJmPPtUveTCMoxlpP8KroWbvX4TQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5818
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

On Mon, Sep 29, 2025 at 03:59:32PM +0200, Miguel Ojeda wrote:
> On Sat, Sep 20, 2025 at 8:23 PM Joel Fernandes <joelagnelf@nvidia.com> wrote:
> >
> > The bitfield macro's setter currently uses the From trait for type
> > conversion, which is overly restrictive and prevents use cases such as
> > narrowing conversions (e.g., u32 storage size to u8 field size) which
> > aren't supported by From.
> 
> Being restrictive is a good thing -- it would be nice to know more
> context about this change, like Alexandre points out.

Sure, I replied to that thread. Lets discuss there as well about the usecase.

> In particular, the line:
> 
>     .set_nibble(0x12345678_u32)    // truncated to 0x8
> 
> sounds fairly alarming, and not what we usually want. Why cannot the
> caller cast on their side, if they really want that?

The setter function generated in this example accepts a u32.

Actually my test case here is not good, I will fix it. In the new v5 series I
am going to post, set_nibble(0x12345678) will actually fail because the value
passed exceeds 4 bit range.

So in reality, there will be no truncation at all, this is just a bad 
test case (I developed the failure mode for when the value passed exceeds
the bit range, only by v5).

> We avoid `as` for similar reasons and nowadays enable some Clippy
> warnings to prevent its use where not needed.

Understood, I can add a comment here to explain why we do it. It is just to
make the code compile, in reality we're not really truncating anything. The
issue solved in this patch is the following line wont compile when narrowing
from 32 bit to 8 bit (even if the value passed does not exceed 8 bits):
  let val = (<$storage>::from(value) << SHIFT) & MASK;

> (By the way, please follow our usual coding conventions for comments.)

Sorry about that, will do.

Thanks!

 - Joel


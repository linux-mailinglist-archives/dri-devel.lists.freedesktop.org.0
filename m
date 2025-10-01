Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FC5BAEE7E
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 02:43:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8451410E568;
	Wed,  1 Oct 2025 00:42:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Zf+gdt10";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012008.outbound.protection.outlook.com [52.101.48.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C08710E304;
 Wed,  1 Oct 2025 00:42:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RLHjopTrlb+d3trUWs5q1PO7oV7NhiNwiUajjgmk/frVlxMPGlDw35TMKvCLNWOv7qoVDrIY20BtZZOOW0wK3EVo4NiGdPjL23nChADTZVTkT3GW+o/701HGEXI8LPcWulAHZzuLiyujzNZtUBErErwdbG2Ngj3Bei0ng8xHjTczKJquIJbMHGt6RQy1hJbgvocRqP++iHrj1Xayfsr+IawwbKACGZBJgoyd7wJHYqhFz51jGbEMx2iL34PTxdlFKkV/Qd4Q6uSNMybCC0MTKC1QGtCmaGoVRBrPHQpLsjUxH0CtLdOsptQ/29jQicwP1vyLdbbg5Yh3Zoe5pm44uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c28Pg+Bm5dxHAmmpzsjxHwa/dbSF1xtGhGZYGwqq5Ho=;
 b=VNN4wMiQrwT/kOKL7BCSfMv06+Df5zQ6/zpSXNS2VZGsb+sS8e/R2OMeor0ANoWgLzhszo8EVGXZOc4fVSnQ7g2GeX08OeGWT6EtRczHJqNBIgu8TcE4n5wPvfUn9sVkEC9FN4SHpOjzEmZypn2RGar7cLIis+8uTVshiVgPqSqSlDwq9ziGHMRRyvWwxGvaosWl21YrwC8o3TAy7aLk6Jd00NT5qkrF7bnr0vmnzjC1xMbYL/Mu4fTE67Fpp61M+wMLwXrMkL8z2mAzQpGLWgfkBuWrrO8GsdjBNPZl68zZU0cipQVe6qUTmr8+3WCWymGzu8baRCn/4nyu7PONkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c28Pg+Bm5dxHAmmpzsjxHwa/dbSF1xtGhGZYGwqq5Ho=;
 b=Zf+gdt10q1tm6Y8IYPz+ssSLUC8f8HYUQqqryieG2lKzr9eox6agSsWSjZpZOu/6h5UxkckoXivEg5QqNPACii7tpktflkw1UxrbAERaGVmmoBQ/rwzD6mqi+Xrw1BsqJ8U01G85/dZEhgSkeisGXdbn4fJGBUduzFP3qaJ0tMH01yYDX2uOrPBdqnS7+WjJJQQTDNQIdIGNG9BZn7RrfDBK6qb69RwERYRMuSz4XL1KcAB0dtfjXOvKSkBELSfhbmjo1W6G4nlS1JAZNB/Umw22Ua4edQEzkdQHuGwB8Ta/nzTR2APK1+NqHZEiVGOZ1HcWK1stsKngMJqFOjyFWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 SJ0PR12MB6805.namprd12.prod.outlook.com (2603:10b6:a03:44f::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.10; Wed, 1 Oct 2025 00:42:54 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9160.015; Wed, 1 Oct 2025
 00:42:54 +0000
Date: Wed, 1 Oct 2025 10:42:49 +1000
From: Alistair Popple <apopple@nvidia.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, 
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 John Hubbard <jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
 Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org
Subject: Re: [PATCH v2 05/10] gpu: nova-core: gsp: Add GSP command queue
 handling
Message-ID: <24jk3p4e3i736fmu6532swihx5ldpxwzpgiyxqjkrklmhh476o@bbwezcponqfx>
References: <20250922113026.3083103-1-apopple@nvidia.com>
 <20250922113026.3083103-6-apopple@nvidia.com>
 <DD2GCDGQ7Q4W.1CSFYSETFSN5H@nvidia.com>
 <7brvf66smc3ltqrw7tm7smth6wnefeqykdm2n4qahi5xnr6d5o@4l5xfdbznlp3>
 <DD5CXDR294YD.2RL474PWBDWTV@nvidia.com>
 <CANiq72k3qkj1HxjnCoknAdWhdM7O1ZBkZDqBsVS7vxYH-tRCWg@mail.gmail.com>
 <DD5D5SRBMW4P.3JJPQVDF5BZLU@nvidia.com>
 <had7hms7ex4w4bvy2mfwtltyyt2xhsn572brrxvibvufxt6fuf@lppudpzwct4a>
 <CANiq72=hmkF=FNiWknrKXeLz4EK_eqLQa2647ejJSfukb9B+-Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72=hmkF=FNiWknrKXeLz4EK_eqLQa2647ejJSfukb9B+-Q@mail.gmail.com>
X-ClientProxiedBy: SY5PR01CA0108.ausprd01.prod.outlook.com
 (2603:10c6:10:246::22) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|SJ0PR12MB6805:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c851752-a0b9-4380-3da9-08de00837521
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QmE2RUpHMmlHTStTT3ZrUmlKVFlOK0s4ZzhVZW1sd295QUsrRTluL3k0SkV5?=
 =?utf-8?B?WVprUWFKc0tQQVh4YkZnWUFnSGp5QjhVNkNPWG1HSFlDMC9lSjUyRENBL0wv?=
 =?utf-8?B?TGZWc2svZlBsVjFvNDhXVmdmSXpITnRDenpnRUdjL012T0JyeHVGNHdEUGhP?=
 =?utf-8?B?WGhMVmZjSytjYnJCWHRxYVZTTyt1YUNHSUJUZlBBa1hCRDlsMWN5L3lkK21L?=
 =?utf-8?B?VUhtMXBUcGZSclpJblVuK1hDcGd5UjFOUUkyeCtJcG9hcjZpQmw2cTU3RXlm?=
 =?utf-8?B?MmYyeitYQjZ4blZDcm5mMUkrSHdmZGQvUXlUTkF0b25XenVRQm5PR2U2Nkhs?=
 =?utf-8?B?NmtCMnA0ek1zc2lXTUlmTmRtKzVEYUhpelBLbDM0VjJqZlIvME9mN0hiamlZ?=
 =?utf-8?B?MUFMUEpCNm4wNDdUT2ZOaDJDYks0NDZJSjN5YllnaEE1MDBjekdGdnZKc3lj?=
 =?utf-8?B?SnlEd1V2d0p1NkRvMlVobkVudERFTk5QRXc1aDI3STVoUXBsR1RTakRVUUxv?=
 =?utf-8?B?bnZtQUdHaTBGaGNPSTc0RnplZzk5dzRieDV1TzRxNjhWZjZXWjU2QWhaVWV4?=
 =?utf-8?B?SldXK2RPMFdEVDYrYjhjSFlJY2RRUk5MYUU1UXlBSWNwUUZ1VVpiODZnU0sv?=
 =?utf-8?B?UnBUTjhDcXBibmdFZFc1QnpaZnNSdU5HeU41MmMxbWxHMGg3UjlpRVhJV29s?=
 =?utf-8?B?UGM0V0oxWWdVT2FSZ1owcmNzNncrcUFHNFpmN0d4Q0UxdmZpU3dtTElnTzlJ?=
 =?utf-8?B?THNheTVTTndyWlhtUXowQlp4b1hXUnovOVV5ZWZjWjBGOTl1a1QyY21iMHhB?=
 =?utf-8?B?bFhpQ1ZtU3hYNVR4VXVkd2h2ekt3ZnZGMmd5R3F3UmhWT2ZxdS9QSVZpYU1n?=
 =?utf-8?B?MW9XSy81UkJwZ0o1ZXBXMTdoajFMZTBvaVMyYm1udjBNVys5QWJiT0xTZFg4?=
 =?utf-8?B?cjJiTnRlL1V6cE5UMEtZYzJyc0lXajBhakxNNEVDeW5GbytVN2M1bzltV2k0?=
 =?utf-8?B?VHNCbjlDMDd2c0NGZ2lrUDNTYURiaGRJWU40NlVqRmhDaTU1STM4ZlR5bU1j?=
 =?utf-8?B?VnVkaWJWMmtEc2lzeExuMm1Lc01BdE0vWkx2Ri9ZQ3VkcGxOUWIrQUJTQXhD?=
 =?utf-8?B?WVlEUWRRazIzdWFyQ2doQ1dYWVNhZzBHdm9zTWkvSlUyYW13bWZsckVaTXpD?=
 =?utf-8?B?VXhTd3hLaEtQODRUVnk0TUpWMWVISndIWHc1d3g1c21POWU3N2VZNmE5RUhM?=
 =?utf-8?B?T1BGNUdsUmo0UUt1QXhyQURTUG9leldhNG04QUZHMUxGcEZkUVQ1d2ZiZlkw?=
 =?utf-8?B?TUpzNjFDaE4rVkxnT3ZnSnZxeFNJNGFaQzZaakVqQ2d2dXZZQmxIZ2JoS28z?=
 =?utf-8?B?T0lXbkZ2V3pzS1puckVlTzZKNnZPekE4TStRL2VMMVBITHRtZlJuSk5oelhP?=
 =?utf-8?B?bENqUUtLSmwrb1l3SnZMbXNFK0txVm8yejhVbWYrL0txMHRiaVR0UHpsL3hi?=
 =?utf-8?B?UmNDSDhyKzhjVVBOWHIrWXdmSkNTRGZTNGtldW1RK0Z3d1NWbGc1NXYrSVdu?=
 =?utf-8?B?Z0t3R1dTZTUxL2U2a1hHS2UvbU1naTdEcVdzSzlMRUo2eXZtd2h1TWQ5Mndj?=
 =?utf-8?B?RFhhRU03QVh2eWtWOXNKbHV2VU5WSWRZcldnMmNmNVJQa2JIK0ZWSkZsaXA2?=
 =?utf-8?B?dkp2YUgya3hvaURHTGZZKzl0TDJhRThIVzZSdXFOVXdUeGhKT0Z4cndIUngz?=
 =?utf-8?B?ckJzMTU1Q0g2MmtuemFLc2NJNVpVaWRkOWMrcTZDOTFTdmx5cTgzSGZjUlRy?=
 =?utf-8?B?K05vNTdPRUVjMUUzSjljalB2SnRWOFlDVjdxR2dxbXJ2TU5OS3FFL2RmdW5H?=
 =?utf-8?B?UXRKbnI4dkp5VVd0MFdOcnlBTDc0RE9BOGJBbU5yVS9ENFJpZkVKNWk5QTZh?=
 =?utf-8?Q?+pBEQ8jAcNhl/kultmCsrFLfUT8/oJXu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1c1blRlNG1oRXRlM2c1aVRPcHNWVTJmaWo4amhENzlPVCtBZk1CeTh4MSsz?=
 =?utf-8?B?NHVYbC9aUC8yL2dDbWd3bkQ5MkJjaGdGMk9VV042WmdpK1NGeDBjT1VPTlMz?=
 =?utf-8?B?YkxLWU1jYTVidjBwa0kzZDN5ODNFRnVoM2cwdzdyam1QdUdJcWhWMVdqNTJh?=
 =?utf-8?B?dkRnNTNSYjJ2TG5YYnA3WGtqL1htUkdrcENJbm9UL3hiL09FenpuUGNTb1NC?=
 =?utf-8?B?NzB6WkdGOWI0MzFCUldCdXBCNWQwZWZvS1VYc2J4U28rTjl0ME9UR0FLaFZW?=
 =?utf-8?B?dHBaTS9WbnhUc1NJU0tPeGc5NXhLSnVQSlJtWk5Qc3ExUTZMcW5pQ2lRMlNO?=
 =?utf-8?B?MzN0TEZVN1IzZU0vVTFRcnhYcGlNaTFCMGZjcWxsYVdnSUlMbzRGM3hMR3Bl?=
 =?utf-8?B?SnRFN2NiU0tNc0JmMUxvUWExVEhMajA5Y24ybG1Gbi81bXhCNWdjZVhtL0d1?=
 =?utf-8?B?MVIvT3A5RFM2ZnBSYmQzMFlOaUhqRTEwenI5TG9GRHZGVllmdGNGWENwT2hU?=
 =?utf-8?B?UllNV2VGaHI1QXp3SkNXSnpNVldVT3J2bE9ESkRFamp4aDdvaXJYRDJsa2Fq?=
 =?utf-8?B?Y2tIQ2hpakdsVG5yQ3NVOExPcW5FN3UzVVFUUWh3WVhxZUxYZTAzeUJydzFs?=
 =?utf-8?B?YXR2TEJpRkwxQW1KRWYzcGViVFNOYnJQRkRuckUxd3N6OVMrRmF6djJINUxY?=
 =?utf-8?B?cXZQSXFmWURRYURtVEZaY1UzUmxEV3BxdUo5ZXpGYWYxbkxiUEJWRStsT2FH?=
 =?utf-8?B?dXdNbkRpWXQybjNDVEo3dDNRWTRzUDZaQVJ1b1IrelBuWmZUYmdJRTdYWS9V?=
 =?utf-8?B?dnYzN1Btc0lxQm9BWHo3YWtUZ25nNWFUam9SUk5kOFVWWEM4elVTaWdRQnN6?=
 =?utf-8?B?QU1PSEhlZ1lQU1FuVzRUSTcvL1NGdm04aUhGR0xib3hYUURJdDIzTE5XQzdt?=
 =?utf-8?B?d1NKU1VBZC9PZVBlWXNJQXdjYlZvTHdQSThEZEFCcDdtNEJsSWJobmxpdWZl?=
 =?utf-8?B?c2FGWVExZnpIbDBGcVhlSTVsMGR6YXNCbkoxSjNDTzBWbkJyaU9EdWVqVHdi?=
 =?utf-8?B?R0p5SndZYWhKODBwQm9ia2JwQmgrL3I4VCsraElzSjZWdWJJSGlGaHo4MUJF?=
 =?utf-8?B?YmpVNStZanpqS2NlWURCdXBLUS9MdXlLWXdvbm44SzZrdGxXQUZMT2dEZ0pB?=
 =?utf-8?B?cWx6aVlmYnFndHhGQ3plWHRvRnI2VTBBbU1FaEJsVEtXc1NEVnN4d3lndFl6?=
 =?utf-8?B?ZElRdnpXMy9wNzk4ZWp0eVV0bnlyclFDR3dFWU9NYzVBMTNoTlp3eENFOCt1?=
 =?utf-8?B?UlZaeVNVbmRhTnlWbElDT0IwYjUrUVg5cDNtMHNWR0lFS0NoT2kzSUJIcVpp?=
 =?utf-8?B?bTFYVHp0bTRNT0RUbloybnFSemNtU0YzcmNWSjEybFJVN3pHT3VyVnQyMjV6?=
 =?utf-8?B?VjlERXlaMUNMTFprYXRjNno3cDY2NWVCRTNHN2FYU3JmTjI4dHY4QmFsQnc4?=
 =?utf-8?B?clpEL0lOZ2gvQ3NXcEJOakRxSlBZWUZ0Mks1Q2tla3p2SkJmejBwRERpM3Rz?=
 =?utf-8?B?ZC92ckN5clRpNmUxWnVDY0xWeU12ZFNhQURXMGJMdW5aN1BYdytrU0VlRm5m?=
 =?utf-8?B?ZVJFL0p0ZUtHQ0lvQnRidU9ZZms0UVVJOGpaK0VMSjAyc3RFc3dRNkx0L2N3?=
 =?utf-8?B?dTlKL0ZhRWd6eXFpY1g4MU1neUg4K2tVdUpjaER0VUl0enozZTdqQVhwTjZD?=
 =?utf-8?B?b2xlY1JkcUVyTThuSHhxVWFQWnUzYWJCT0ZsdHNwV0R6SFdEMW94YTNweXJh?=
 =?utf-8?B?NzhObHdjM09jVndPZEZkM0lEOFgvcUdkS2cvK3E5eVhTRWQrYnoxVWtEcENi?=
 =?utf-8?B?cjFwdWtqZDA3M3FvUWI4eVBsQWp1SE9ienlER2w2Nkpvck4vellPWVpBeTFX?=
 =?utf-8?B?YnA4Ry9tbjZTMWJyd0V5ZmVpOWkwWSsvV2psUklzN0V2Wm5VTDd6MUdXWkNX?=
 =?utf-8?B?L29RM1RvMzhpckQzaHB5cXEwQTUyUG5Ydm1ucUw5TTV0cTFKN3ExUmVZZndJ?=
 =?utf-8?B?UEpid3ZxcHViQjlFOWdLMnJoQkl1RGt2WWcrV0ZQNzNTemZyMGljZXFISkF3?=
 =?utf-8?Q?mne9AFFGNhC4N8N37+VTd5Cqw?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c851752-a0b9-4380-3da9-08de00837521
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 00:42:54.1603 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FON/h1xL8qkzxlnaaSo9PXeovk+YPaW/J62bEee13OwiZ0lXDIZBaEg5mDFH6iZiH3kVzZP62fALzzcqwg35dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6805
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

On 2025-09-30 at 21:58 +1000, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote...
> On Tue, Sep 30, 2025 at 1:42 PM Alistair Popple <apopple@nvidia.com> wrote:
> >
> > Thanks. Is it still expected that `#[allow(clippy::incompatible_msrv)]` is
> > required? Just adding it to `rust_allowed_features` doesn't make the warning go
> > away without the allow, but maybe I'm just doing something wrong...
> 
> The warning is independent of the allowed features, and yeah, it is
> expected that the Clippy may trigger (at this moment when we dance
> with these features), so you can just allow it locally.
> 
> If it is too cumbersome, I may disable it globally.
> 
> I hope that helps!

Thanks! That does help, it's not too cumbersome as we only use it in a few
places. I was just wondering if it was expected or not. A nice future quality
of life improvement might be to automatically disable clippy warnings for
everything in `rust_allowed_features` but I think that's pretty low priority.

> Cheers,
> Miguel

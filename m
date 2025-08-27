Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 068C4B37D83
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 10:20:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 060E010E769;
	Wed, 27 Aug 2025 08:20:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="C8lTI42y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2063.outbound.protection.outlook.com [40.107.96.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3BF410E0C7;
 Wed, 27 Aug 2025 08:20:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qG4uOH2l02Uy9Ew77QQvZxd40fZnvUILyayJT3q3JPkJEsvnYSUupt649gvwLys9dzVvG0LVhrAZ+7IhRz5Eri78NCO8HdRjyjxoEHW6PKn5pqodMg4vlZmgmyIDg5LcuZpcMlf29qYWxJRSj4GLXduLczYT4KHqIzH8E4xB5U8r9PnGNaj9c7Jxbk/EUOkqcYumazCUvWRpm/l/hOzUaydre5ZrbhM+Q/690iL/JJrcIF1bNTFDAVYmJ7cYkhmGLSUVm8lVUneh0r6NenxQzADVD6ZC5kwRdYwdnHxvhQGKCZEXNQP/ZAjhqiBCZGIwmE+hEnNfLi1LnP7J56O+gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uwaw+1FQWiwZZ4A3OQyTUUVqPIEetmehb6UpjmnAULo=;
 b=SEyydP9ZyyR35cbA2e3mAhyvAFuRXNvP+xN3vRdI80AsYGDyFYGP03AoyICcRuR7HH1vF4yM7EaGyp0Z3dHeSI77bWwAuCfKZbRTHLiHKh2g9sK7inrFpY9PdE6an39aT1of1eTdeqF+s1w9wAEXhszUOV78vW5jJiJjlaSefGW+U/OW8jM2cV8bg6Wkb84a0yGL+zkMsps8EOiJwyNyckMiM10Z+jwFj3JaQw2452+RCk5Qw5uBcPrO7X7hGjlhx4wuLbHgk8W2y1gvnRNkDPjqtpErRJnCYwlcjIIqq2IfejWDE7hCxT3esMNsX4QieMW9g6plub0I42wEG4yBbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uwaw+1FQWiwZZ4A3OQyTUUVqPIEetmehb6UpjmnAULo=;
 b=C8lTI42ygut3n2DlJEkHHBtQ0x46HR9Aofza85CnjaEr9wYoQf2v5IjdK5Qtj8Ay2bB4kDJAfV9T7PTe7N9fLGZT9zPgSzGm2RFH4MMZ4qti35SlyXLoySYQBSz8QTl+xhZQnDXnHBGTYUPKTe9M83ph70hIpQJQiSDeG2mqS+hG0wnfgta6W3hDouDmfK5+qpvbhW7nVLDJb+EshM+oJ0F9NJfKNxfNsAjB3nD8t769nzM4tzNab5Z9wbR0rqpO3kflIPHk2ZyuWGDzwdstQL17r0wp1a33voIpOAXT/JnCh85sOs5gsXC+cZ2IVI05kt9rpSyRa1FSOLUK0XoPJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA1PR12MB7709.namprd12.prod.outlook.com (2603:10b6:208:423::15)
 by DS2PR12MB9592.namprd12.prod.outlook.com (2603:10b6:8:27c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Wed, 27 Aug
 2025 08:20:24 +0000
Received: from IA1PR12MB7709.namprd12.prod.outlook.com
 ([fe80::5312:ce8b:bdf5:aa31]) by IA1PR12MB7709.namprd12.prod.outlook.com
 ([fe80::5312:ce8b:bdf5:aa31%5]) with mapi id 15.20.8989.018; Wed, 27 Aug 2025
 08:20:24 +0000
From: Alistair Popple <apopple@nvidia.com>
To: dri-devel@lists.freedesktop.org,
	dakr@kernel.org,
	acourbot@nvidia.com
Cc: Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org
Subject: [PATCH 00/10] gpu: nova-core: Boot GSP to RISC-V active
Date: Wed, 27 Aug 2025 18:19:57 +1000
Message-ID: <20250827082015.959430-1-apopple@nvidia.com>
X-Mailer: git-send-email 2.47.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ME3P282CA0123.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:220:1ca::18) To IA1PR12MB7709.namprd12.prod.outlook.com
 (2603:10b6:208:423::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB7709:EE_|DS2PR12MB9592:EE_
X-MS-Office365-Filtering-Correlation-Id: 25e6c521-0131-4a73-d3cd-08dde5429204
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|1800799024|366016|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q1QyZTlYVlcwRERXd1NHaTNQRkdET3Z0OER3T2Q4SWtJcUtEK3FGK2hGaTM2?=
 =?utf-8?B?dWhnREYzM3M2NWpVcHY1R1ZTWmRHM040U1ZiMWZ5ZmRiWXRVSXp0VEhOUzNX?=
 =?utf-8?B?bll0aGhUWnhOME9ickZZdEU2NkRyRnFWaWUwZFZVSTVLMGxIei9BUzVNcWRV?=
 =?utf-8?B?K0IyTGlOSU9iVmt6Yk5tSmliUFREZml5ZEFheHQ0WVFIalg5bFZKOXMwUFYv?=
 =?utf-8?B?MzgvSHlTaE5xeG83YXVDbTdTS3ArYUgrOXdFS2dZVmNndWsxN2JJaXlERzBZ?=
 =?utf-8?B?c2lad1k1M1VLaTkwdE1HaWVsR0pDTiszM2srL2FONkdlbldBbThsSEV6VStH?=
 =?utf-8?B?dlpPZDl2SGRhaHd5emlXaUoxVUl0YmJMeWcwSkFLV1lBMUt3ckQyMSt4R1c1?=
 =?utf-8?B?NnZCMWxtYk4rVTFGTStYVWdOS1pkTlpHZUgrTjJLRUpxcUFoNUFkMWZtSnZq?=
 =?utf-8?B?NE52eHEwVjlKeE5nZ2pUVVE0eE52U0hDWWQvb1ZJd0hUa3JLVElMejNoV1ht?=
 =?utf-8?B?a0hVdlh3aXFXb1pqWExRR1FqZTNtbHo2cUgwZmdISnFjbjZaYklUbGswTDJk?=
 =?utf-8?B?amVIeTZ0M2l6M1VCeTNPcGhoMmc0Z282Q3NDRVdDR21TMnczR011MkxKVzBl?=
 =?utf-8?B?OUdtS1I0RHpjanBPSkJGU1dNaWdmbEhpR3NqNHJVVGRKSTJQY0ZlSDB2alNt?=
 =?utf-8?B?amtoL2tRYUhvUUdPU1duczF4Z29vMGd3d1RZdi9XNjh0ek5VL3E0a2k3SWNQ?=
 =?utf-8?B?Uzd5MllXWTJRSUpKdVhnYXdwOG55U2g3V3B0RzM0SkNsMUg2K1hvMkcxNU1K?=
 =?utf-8?B?SnNDZVU5N0V4aHNZWVB0NzBYekk5WFNoQVJvY2htSXo3a0RIWkRHQnBUTnlp?=
 =?utf-8?B?UXFmdG1mWjlmb0RqVUsvb1NXTlpJN0tKZlB6QUc4TDkvbUVENGQyNHlJVXpo?=
 =?utf-8?B?NGtXd3M5MVVGMkxlalNoVlhkRW5OejBlbTlPWjJ0U3B0djU0N3hQMGdpT2dJ?=
 =?utf-8?B?c0J3TUxYMUVxREJOanhyTzM5amZLSTh2Ulc4aTBxUi9YZHJIaW81VCt0Umdv?=
 =?utf-8?B?SWlXdkt0elp3YTIrWUZaSnNzSEdiNjRYVlRQaEFZbTVxVWZxME9aZCtlRk9z?=
 =?utf-8?B?bzd4VHZZNzZSeHQ4NHRDMFl5am1GekhzU2dJSzFQRnd2bGhyd2IwWWMvTUFR?=
 =?utf-8?B?SThZU2dIYXkrN1d0N2hRbkVvY1FpenhLWEQ4cjFSUE0yZGdhQmVQQjZtQjY0?=
 =?utf-8?B?MytHb241QTdZdkYrMmFwVE1tNzY4aHlkcWJwTmVlSmNkdDVuTjROSm9EZjhX?=
 =?utf-8?B?U1Bld2RPU0x6bUtrS3h5dVVaakVyTnNUMmNENEtsVkIzajdsSFNLRWljV1Nx?=
 =?utf-8?B?aVZid0puM0Y2TXpJQklZbFlEczRja1c5MHlObFRtU3JObW1kYUZXSUF2QzN1?=
 =?utf-8?B?V3JuVVJsY3NvSktGUFNXckIwUktabnhNQW9Ra1k4SlFzSm95U1EvelV1OWUy?=
 =?utf-8?B?Uk4reER0aFB6WFRKN1lqREpYUUdtOURpOTZhc0lJdms0Y1UvUDRuczdQSGt3?=
 =?utf-8?B?SkdoVGFEM1dhUkJ1Y09kbEF0Mys5VWJOYTdLWGFrd0FuenlBRmZnTVBsNi9W?=
 =?utf-8?B?UUJTU0pCS1RQQW1ybXI0elFVbjRWMDhyWlBzRitKSVpFQi9LUzFaK01NKytY?=
 =?utf-8?B?UU5nM1NaSGJ4V0p2Rll4RFdzRnFKVTJ1NXlxdHJHS2d2WFpDc0x6QmVIVXlk?=
 =?utf-8?B?c1RpSjNuWkFNVVRFTDFyeUhkK1lWejVCTmlhTnlwRmJJWkEvbnBXWmU2WmxK?=
 =?utf-8?B?bUd3V0p2NVRHUjBOMUtzbmFUZ2xucFhSMlNIc3MyK3ZQL3dhamZkOWlpVmlv?=
 =?utf-8?B?aVZBdVBaeEdhTWkvR2pWOTluY0tJT3g4aFRzYlowVXliWWoyd3ZLaTlGc3pD?=
 =?utf-8?Q?3DeF9KuBAYE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB7709.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(366016)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0poRTk0QzErTnliWXd2RTg2eXBtVEdpUlNqUGx1WURxU2txTTExa0swMUhx?=
 =?utf-8?B?WjEyYjV5cXhwTjU2bGY1T2t2eERrT054cWx4QjNZcmJyWXhnN3F0OWRuVTZI?=
 =?utf-8?B?N1ZhZVVwL0x3clUrUDQ1YVJwWHRCZ0o1YVRTSERBME4vL3lZbmNqREZjUzUw?=
 =?utf-8?B?N29RQ3h6cnE1Uy9GMGJXd2VrcG9xa3oybHhMWmxIWklFZ29IdkwyNTErTE1D?=
 =?utf-8?B?VVd6WGFIaHB5cnhTSjV4K0hzQ3ZWMURHeUR4bkYxRS92R0hJSnNoY1BQa3gy?=
 =?utf-8?B?Yi9kNWRBRUZQbmNvbGRuVEdIMW5vRE5IcHJaYzRyYWNMYVVmNUpzSTVWVEpL?=
 =?utf-8?B?a204VFVJM051TVJxTWw1RjM5bE50M1NvaDNTK1hMQitoWHA4eXhIQ3RBdDJ3?=
 =?utf-8?B?SDR2M0FBajR6RGxiQlhqck5kWnNiTUQ4S0tZOW5rWTN2MzhycnYrcXdkc2s1?=
 =?utf-8?B?aURGT05kTVhwbW9QSjhxQkp0SWozN0JtT1hlWndTV0VCR25PeUtyYzB0RER2?=
 =?utf-8?B?TFpLbFNCYk1sZ2Y2cmV2SUpqWWF2RXMwWUcxdkpCaTFWWmlwMFJhSmFGZGlE?=
 =?utf-8?B?MTBQL2N2T2E2LzFMTXM2U1lTcGUzeWF0S0N4U2hHNVJYQ2NVeThtMlYrSHkw?=
 =?utf-8?B?alpCZnV1Vnptc3lrR3ZkOFNZTlRmRUpBeWVSc3lxMEczK2Rubk5BU2tQQnBw?=
 =?utf-8?B?emp4ZUlJNEdEUVpJVWJXaWs1TXdFck5Tb1BLZWdzNUMwSCtTc1ZIejgvSlNo?=
 =?utf-8?B?VU5KWUFmdlBYbzlBYmlmTXVUZmt0Rk5sdkMxOVRoQU9KR280ZWFURFlUaEVh?=
 =?utf-8?B?Q0NCS21FTUZtZjBVcHRBVGdRMVFWZ1p1M1V3TTVJbnJZWHFyMkh0OFNLajd3?=
 =?utf-8?B?L1FCRm11dExUcXJlUDE3bXRTaXRvSjRIaXYzWDJEekEzYkoxQnpjczdQMDdN?=
 =?utf-8?B?UzhzK2x4YjJsa2VjZSswWmc3WTdLWTZONTlQRVZsbXhRczN2QUFGR1pBTTVY?=
 =?utf-8?B?UTE4RFUrSGJQY3NUMGtuME0rV2VXZ0FxYkxnbE9EcnNOMGE3SCtubGVNK05r?=
 =?utf-8?B?WWM3UDliWkx0TDRsUS9NcEF1WFJHOW40SXV2ZXdzd1VxTEhHeStINTFYQWtX?=
 =?utf-8?B?MnFrZUFrV3JYRFhFajdaYnc5eFVjNFRHazFhU3N3bHVxdERwbW81aVRaTEZJ?=
 =?utf-8?B?cWVVTzRRY1hWK0M2WXREU25TQ2pieVlGRUdGaU5CTVA5ZmM0c1lFRlFTSGVi?=
 =?utf-8?B?bjgvbXR1UnNheFg2Q0ZETWhSQlhLaGNNMDNkQnBDQUNrOTJFSjd4cEMvb2Fi?=
 =?utf-8?B?T1BjN2lOUTY1bi8rbit2c2YzZlRQZW1oa0RuVWluZHR4WVRJbHg4ZHM1WnZz?=
 =?utf-8?B?bWlLMXhPVkM1UjVqMnJ6NERxZ05XTnVBYlRMdFBqSld5d0p6WjVlWG5UZ05r?=
 =?utf-8?B?Z0xaNUp3TDhKak5mSU1sRXNXRjNzY0FFT2t2QTJNWnFOOTJIL3V5MHA0VWIx?=
 =?utf-8?B?WHhJUUlsWCtmNkZRZ2RPSGlEWUgyRkRNQmtsQUtkVExHQitkVEZDMUJYYVV6?=
 =?utf-8?B?WVZ0RzRkd2ZNQjNXT1dRSHhsN3c0RTZ0YVFseTNZdU4rN29RWDQzOXV6YUxH?=
 =?utf-8?B?cjBaRERwKzJKS0xYZXlTYWRyUjhMeVhRb2FmajhETTZLN2M0Z2lrV1QxNVVP?=
 =?utf-8?B?UE5DTU5OVk1JYnFSL2RSYzlYRkhSWTNGbHBaMUZrMGZkY0pWUm1ROVpFUkJ2?=
 =?utf-8?B?ckRLS1phcnBVUzA5VlI2eFdhd0pTZnZrSmc3WWpMODZPOXlqZE1VMVk2OXlt?=
 =?utf-8?B?L29IN05vSC9FYjdkS0xuSU1JeXB5TjJYMEFKVjZDN3d4dlNyNjhHRkQxSlNP?=
 =?utf-8?B?QXZlUGZET2NRRW9xY3NETnVzQXNJQmpkc3MxaTRGZUNqV0tQa094dlc4SEMv?=
 =?utf-8?B?NjhxSzYxSGJJc08zaEFyYkpRMmh4NUFhUktkNTQ4VXB5ZlpqcmU2bmdrT2NR?=
 =?utf-8?B?L0c4dVdkeCtYRk1ONlVTMWFGcjNucUZoRmdrbE5Ic28reEtWWTVvTnJCR1RZ?=
 =?utf-8?B?bmswSldLeFdNcExpTVdsU0J2M3BHak5oRVBSUkI0Y2t0cXg1MlZWNDRvT2Vu?=
 =?utf-8?Q?XEB/wlMfv3iMcy+CjgcdYRm7d?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25e6c521-0131-4a73-d3cd-08dde5429204
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB7709.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 08:20:24.0665 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dbFOkcOnwlSAibLhQ9nmwNJCffWgKcALyb1nGF+GqSD8i1j3jQ40NGHHxP8FcFShWkCPU8cMSQ/zcyVsMQo4vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9592
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

This series builds on top of Alex's series[1] to continue initialising the GSP
into a state where it becomes active and it starts communicating with the host.

It includes patches to initialise several important data structures required to
boot the GSP. The biggest change is the implementation of the command/message
circular queue used to establish communication between GSP and host.

This is required to configure and boot the GSP. However this series does not
get the GSP to a fully active state. Instead it gets it to a state where the GSP
sends a message to the host with a sequence of instructions which need running
to get to the active state. A subsequent series will implement processing of
this message and allow the GSP to get to the fully active state.

A full tree including the prerequisites for this patch series is available at
https://github.com/apopple-nvidia/linux/tree/nova-core-for-upstream.

[1] - https://lore.kernel.org/rust-for-linux/dc18894e-09d3-4088-9be0-22c2070b61f4@nvidia.com/T/

To: dri-devel@lists.freedesktop.org
To: Danilo Krummrich <dakr@kernel.org>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>
Cc: Gary Guo <gary@garyguo.net>
Cc: Björn Roy Baron <bjorn3_gh@protonmail.com>
Cc: Benno Lossin <lossin@kernel.org>
Cc: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>
Cc: Trevor Gross <tmgross@umich.edu>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: John Hubbard <jhubbard@nvidia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Timur Tabi <ttabi@nvidia.com>
Cc: linux-kernel@vger.kernel.org
Cc: nouveau@lists.freedesktop.org

Alistair Popple (7):
  gpu: nova-core: Set correct DMA mask
  gpu: nova-core: Create initial GspSharedMemObjects
  gpu: nova-core: gsp: Create wpr metadata
  gpu: nova-core: gsp: Add GSP command queue handling
  gpu: nova-core: gsp: Create rmargs
  gpu: nova-core: gsp: Create RM registry and sysinfo commands
  gpu: nova-core: gsp: Boot GSP

Joel Fernandes (3):
  gpu: nova-core: Add a slice-buffer (sbuffer) datastructure
  gpu: nova-core: falcon: Add support to check if RISC-V is active
  gpu: nova-core: falcon: Add support to write firmware version

 drivers/gpu/nova-core/driver.rs               |   8 +-
 drivers/gpu/nova-core/falcon.rs               |  16 +
 drivers/gpu/nova-core/fb.rs                   |   1 -
 drivers/gpu/nova-core/firmware.rs             |   6 +-
 drivers/gpu/nova-core/firmware/gsp.rs         |   1 -
 drivers/gpu/nova-core/firmware/riscv.rs       |   9 +-
 drivers/gpu/nova-core/gpu.rs                  |  60 +-
 drivers/gpu/nova-core/gsp.rs                  | 237 +++++-
 drivers/gpu/nova-core/gsp/cmdq.rs             | 701 ++++++++++++++++++
 drivers/gpu/nova-core/gsp/commands.rs         | 201 +++++
 drivers/gpu/nova-core/nova_core.rs            |   1 +
 drivers/gpu/nova-core/nvfw.rs                 |  59 ++
 .../gpu/nova-core/nvfw/r570_144_bindings.rs   | 501 +++++++++++++
 drivers/gpu/nova-core/regs.rs                 |  15 +
 drivers/gpu/nova-core/sbuffer.rs              | 188 +++++
 15 files changed, 1991 insertions(+), 13 deletions(-)
 create mode 100644 drivers/gpu/nova-core/gsp/cmdq.rs
 create mode 100644 drivers/gpu/nova-core/gsp/commands.rs
 create mode 100644 drivers/gpu/nova-core/sbuffer.rs

-- 
2.47.2


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHOmGS3pb2m+UQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 21:44:29 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA574B9C2
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 21:44:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63D2A10E671;
	Tue, 20 Jan 2026 20:44:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="WgZ/dzxJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010011.outbound.protection.outlook.com
 [40.93.198.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8371510E225;
 Tue, 20 Jan 2026 20:44:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bTihYCuNo7fsJesLt8FKebg15Tnyv6N0C/OvRMV0ApHPxd/rGZPQQlepvgFm8XgK1EuU/UlWev1X8ClpG3ERHkoVj7W+rBNFBEP8SwF7KxJjQse/yXk2ITc0i0I57I3YgBmfPR2F+tpEFzNiRkz7PHhASH1PO1/D2H1BkOMxfQuJhJz0uTHJPgT9DKj1zgCFaJp/x2Q3zZs6DpmtmmTKHx4ChGFrKQvyjV32K5/tfaTy9kPiq+6h0GJ5+PBW4e5yJ40LniE687vUjhkntpAR9ONS84GyXdP3YzYbnnKC7aaDFIOygBwEjGIrT2iX5F+zABXJGszUtotxdbx2EclbPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/TcWxKjmeXwnq3UjSIdND9ieeM0i00wCMATYd6Xll/Y=;
 b=cWxGgoYKVRKF58DiCvHy1QseYHXhmjs0DyChYT39Q0r3yl5H8SYDoelIqepJdjJa4p6YODwgUrmMp0XcMY+pN7zzYCLmvAlJD3Y3fDKYJZuj+kD+ob4v+moVgxeB4HrUlnB+U2e14iwiJpNGaN3KpmG2vcZ4/v7hkNUFQ0YxlsupIXmNbfEIm8jH6rKgD2CZ0EqHAeMPeyOY09BPKyuiag0YxltTi05HUNfjGiatURcfdg3tVkC8qIiZ71dPZTaV02hpLo0927Rx8pLLn49P1e3VPrZU3Gb+3KMl4Ya+EttuZsBZPvoq42hNKjBRD9cIXjzFMUzAC41v/xVna+gsmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/TcWxKjmeXwnq3UjSIdND9ieeM0i00wCMATYd6Xll/Y=;
 b=WgZ/dzxJ5cYQvEea3FN1+q2LCn1IwlhcYNQTHxHjytWjoGx5QiSLExXPnLRagHhYRX7QFsnjqYmueNXjw3SLdMjpDUgDlojGAxjcthBnCRu47G4zfAW3u7JSj3cbrwRplE/lnc4oZuXskHGrHcD8rdY2XLvYYJi4LNIxN/24ESbAZjkmdgtl+cYa3HMRx1IOQRFpoLIqfIfNChOvEzWZ2RNoERkL9yIEtd/oyd+1LFY0UQo/MK0vBBCPB7aXAYDxQSMIkSIQLSlWJc5pnuDI3PzkGWOU7EqA3GN7xFCo4tb/RuRIU6Q1kJ0dWJTGV8m+/oRAjy0esUfiV3HRFCBlXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 PH7PR12MB6809.namprd12.prod.outlook.com (2603:10b6:510:1af::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.12; Tue, 20 Jan 2026 20:44:10 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9542.008; Tue, 20 Jan 2026
 20:44:10 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Helge Deller <deller@gmx.de>, Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, John Hubbard <jhubbard@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
 Andrea Righi <arighi@nvidia.com>, Andy Ritger <aritger@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Alexey Ivanov <alexeyi@nvidia.com>,
 Balbir Singh <balbirs@nvidia.com>, Philipp Stanner <phasta@kernel.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>, joel@joelfernandes.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Joel Fernandes <joelagnelf@nvidia.com>
Subject: [PATCH RFC v6 11/26] nova-core: mm: Add MMU v2 page table types
Date: Tue, 20 Jan 2026 15:42:48 -0500
Message-Id: <20260120204303.3229303-12-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260120204303.3229303-1-joelagnelf@nvidia.com>
References: <20260120204303.3229303-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0058.namprd03.prod.outlook.com
 (2603:10b6:208:32d::33) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|PH7PR12MB6809:EE_
X-MS-Office365-Filtering-Correlation-Id: 8101165f-2d3b-4ec9-d03b-08de5864a9cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2Cl5yEUB1onXzu8BwatCq5Fz98e/pPtxgOJCdsiEPFFHEpFbULPnZFSsxRM+?=
 =?us-ascii?Q?pdBI0otIE317AhfRsHbvzpsE5TRF658clbRERAztzsTYtqadKSoq/SInVTM+?=
 =?us-ascii?Q?Uzg8RvFYPxAOVqTdl786jMpnTOYGVCWF23NKf6gf7X1Vsd/F2bRFXHgA9Ut8?=
 =?us-ascii?Q?NVB1qvpf/KzWzjj4P8mUxlqX6g4oDKm/dFDGfWRYmA95yo/jJj1VouZn0Bts?=
 =?us-ascii?Q?Bw6KkMfRYAzZr5Ewn0juL8qDdf2AhTxVTKq/m5+St543fPMQEo7i969lvOSb?=
 =?us-ascii?Q?I334bLCCWBHKD/pr1Ay7bZJOATVZ5UC1WSn1F+KSoZauBBViWhMGClYg8VbM?=
 =?us-ascii?Q?wN+tgDybp0SHpQfjC80KTbR9c7LZ/PwnYjNKaTmMCffPzLdOtO5M5Kb1qMKX?=
 =?us-ascii?Q?jeYUfuay+oh+izqKN6eQe+lX53RjRjOCu3DSLuEBG1chDik5NZcVakdF9adr?=
 =?us-ascii?Q?I0SNdugcGqvreCgXHB5rw92C5IU/1gtbSkZCQUYBaUHu/5B+9ROXCcJ2nmYD?=
 =?us-ascii?Q?ALn7/0zoT8gbuer8rKUam/AeXmVI/miDipgc4BXANwcTLy8AAXaAsCrBaxOs?=
 =?us-ascii?Q?nF52NYW5nxWjS8kJwwx3gTRgcmn7N7voFqYiZqVqmvlnO7wG7ecCy2ccDlOY?=
 =?us-ascii?Q?cQhNe1PIBGA4ALjiyj1kbY2Jw0p43qnzICFYqw52lgY0NCl0F6HfTQYr4gC/?=
 =?us-ascii?Q?vZUicCxRclbv6G7BpAD0LwlyCtkhm2EEiQgiqyiBfaUBKNDZDjRY2KqIefJC?=
 =?us-ascii?Q?CXVjeKpbsspF4m4LVj0BaBFCdQ/0HouuyeYkU4BOu4J7qcZaLVMQ4pYy+bM7?=
 =?us-ascii?Q?hDLDmcENSQ/CQy8Y3qX4HxcGKdI04YhbblPpDESY1jpGJcffZjXbaVErTpkQ?=
 =?us-ascii?Q?U1zLmEB4KZRN4wCUCMDePZXd59J1tGKd1bTUmGipDIJgX0DaCiWgv7UopCbi?=
 =?us-ascii?Q?maso0IQCziCorK/5TWhCpS80CWq739X7hsktqSFzxjRQ7puZ7GydWQvjq0Uk?=
 =?us-ascii?Q?VdsqP8/8Cpqhu54O3m/azkZH0zGrwvZX6zhrd7/IuPn/FNHftD4uzM7BlwFH?=
 =?us-ascii?Q?OpVVAavDtGhoIspW3lE4FdIS3q/k833QrPcUxZA+x/FeD8vhe88z9OwmVa43?=
 =?us-ascii?Q?FYgvr0IIBRvEOLAxSELzyV13zeSdgkEyLLZbwuWM7iubjmnQfrZtlgxMFMUT?=
 =?us-ascii?Q?A45IFZRfk0tQ1ov1quVMCbgLuKdVO6Om0cTIEgCLM2GWSpbOryW2vLxuwXzq?=
 =?us-ascii?Q?2LcusAykVkwbZamnx7kkIi1GtJzgNkGqnkAMKUjp5n3qCm5sLJs3PF0oJQbA?=
 =?us-ascii?Q?ZCk+Zs5HwPLWQCMrcF8VZvVR4F//6qFSLQ/IMHlww3XcTrTnoFR0EK2v1Ca3?=
 =?us-ascii?Q?0H5VxrjsKXsnaQ1o4PvevPYXbsQgh2/jdQc1fNueMB28EK/GyEUJ3DoZqLqi?=
 =?us-ascii?Q?vxK4Ij1h0ZEb1PoF2xRLHrFXX+zX0SiYg1ht0jxegOGGurEqhQT2Sd2rz1ov?=
 =?us-ascii?Q?nhVfZow2C1I7IPNrNlgakk9tVln1GgMCfoZB1Ez9EuqGw0xBZcO8xi18Sk+2?=
 =?us-ascii?Q?zZeOHs9IYR4sr4vFlY0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UjLma0wFQ+3e8euVlQFSsoy1hmrb34zdT2VBhOHvpgG06lnoocy0AdrM7dhd?=
 =?us-ascii?Q?v/25CoUqPlVHOtQv7mZx+ZYv38vrwxwAHfQw/lbNiPV5VmrekaelfJX90NNs?=
 =?us-ascii?Q?B7t3B+wZPTsDyLLeU56peoLQ0UMQm8gE0K+AzVdUZkQ339NgPNBlwZhQrrhx?=
 =?us-ascii?Q?tgw3SMEWT0wMVDLf9YdopBODlI4cIhpscXn3D4Z/JD/MDsJt+F50aLna92q4?=
 =?us-ascii?Q?xgJ4xS+G1D8w/1Au+CIPB9xfL4uOszcOd78STWAR9fCV9+JPBZ49yuVxfyiO?=
 =?us-ascii?Q?ph438+N9btLvLR+fc7RFIcsOEmgb1Oi0jzXGFlhuYDTtYHedYtFLaLLqLwkn?=
 =?us-ascii?Q?K2fWQjjNGfDoHb/dqyO+bkJuC4Ix6x0jk6GeRETqkeX7NfyiRaqwu3lTFiOc?=
 =?us-ascii?Q?98ggulIryajDwjWGAL47nL5M3Z+s7ERzKJlopDPtrwiC4FblppaByvv02C7q?=
 =?us-ascii?Q?QkX5FFH+J7xzI5e1UPmjttS5PJraxAwurtGYStPUPauEqVPHiRDDDHdecjKB?=
 =?us-ascii?Q?UM0RVji9mTF073MuH2uGfo39xqcvZyI0uPnrRy7jfVtbglEeyPSU82vRx0rq?=
 =?us-ascii?Q?+7PBQrPI6IbpiZGmmVTSnLPKr6Q0QPQAlyJpw5BLxS19I4x95Q5ta94mW/2c?=
 =?us-ascii?Q?pHYGP4tS9u0US90aSOJnaE2j+2PHyLxwX+XAjsy7CtA55rZuHJoRtEuW3+ia?=
 =?us-ascii?Q?oa2dKHLAGgPTHCNkOcU5z+ByyqyKK/J07gJ9qrZTXenYcLgqVPkP2ta5gjhD?=
 =?us-ascii?Q?CJnNO96+xvdLo+Mo3IaotWv3a5dlq2dDNwKfNXJWiAV1x7y8Dil/oGr0HqBM?=
 =?us-ascii?Q?pkghWn+jFVGDGg1muYJNl5tSw32joJT+IUIJ00QDUOSS/6cIQEJQ4RcBRDLP?=
 =?us-ascii?Q?wZqvAY0b8y15jpVR8JhsyAsRrmBAC5fZjyYBXNdMLkuNMAujp4fesRBBafeb?=
 =?us-ascii?Q?V5iA0LuIHMquzXzdmJGm+tnnqZ2b5r14L7M3VRnGZVqoF43DPLCjkIm1Lqq0?=
 =?us-ascii?Q?wxiKzaHvxF5aVlDEsSse4le0yrPJerDN72dmeqv1Wuj67xIkI2j/aWHYrqQx?=
 =?us-ascii?Q?0ovWUQxkjz+Js5osp9bjcTDwkB+JBjCdKofbsuPMbvfNVUkTPK6i7F+MiLDm?=
 =?us-ascii?Q?URGYlxwJmhWEw/iRBY3zNnK+0GggCFYsD6phuxUsFZat1oYlnUANUJI6qJ4X?=
 =?us-ascii?Q?44W27oNL4I3/6Bmt2jJLby+6uZHzViCjIWz14dXM1jJ+R604PMdu0u9+wUwH?=
 =?us-ascii?Q?fVBq1bJgQP48lqZGFhfy7GJdcZzeVyCy4Jr3+DT4ZRrE+EYl6cvxV1GWe9QG?=
 =?us-ascii?Q?bSN/SKJt249kYQsZNk9ZprbXZdclrOb1Ly5Tll6eYG2TTjTZKsbmOJVS6480?=
 =?us-ascii?Q?z2t0riTMLyeivTUBHb54g8Jb4umbzuMEdLzigOoRWkT3X2TxLtn3JL+nyIct?=
 =?us-ascii?Q?pAS3zZsOH5iQrYaM/pgtA4fXgA2CDsahoHThQgQo7AqKMFE+QQmf6cmAVzkP?=
 =?us-ascii?Q?MxMF0oK03Hh4mxJgG8GgeKCkZKZBZ9L5so6yccypwaWpujYSJmfXbkye2PAk?=
 =?us-ascii?Q?J9z8DLWs62gFwXfKY6qIasd07H5zrOtEzrsRQSADPGLPdPU34EvB2jTddMpg?=
 =?us-ascii?Q?7BTX0YOXTrOS/Q9PMo4J91GskaeuM8cKczYO2M3ISVX1I/Zk0+uzQ2S9QdN0?=
 =?us-ascii?Q?9xdXFLkE6LcRdkhvxnlyR3mdQTs1Fz1f5DsSW202UrMWBR7yUcyEkdvQcm6o?=
 =?us-ascii?Q?7shA4QYmgw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8101165f-2d3b-4ec9-d03b-08de5864a9cd
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 20:44:10.3939 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kp3Edxxwc1nb45Aovw0sjq+KGb5yGQMKv/VuYY3Y+k6Fp+rI+w1q4l68TICbV0LSUl7jbZ7lK8odIQtzmv+7fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6809
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,garyguo.net,protonmail.com,umich.edu,nvidia.com,weathered-steel.dev,collabora.com,joelfernandes.org,lists.freedesktop.org,vger.kernel.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[52];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,nvidia.com:mid,Nvidia.com:dkim,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: EEA574B9C2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add page table entry and directory structures for MMU version 2
used by Turing/Ampere/Ada GPUs.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/mm/pagetable/mod.rs  |   1 +
 drivers/gpu/nova-core/mm/pagetable/ver2.rs | 184 +++++++++++++++++++++
 2 files changed, 185 insertions(+)
 create mode 100644 drivers/gpu/nova-core/mm/pagetable/ver2.rs

diff --git a/drivers/gpu/nova-core/mm/pagetable/mod.rs b/drivers/gpu/nova-core/mm/pagetable/mod.rs
index bb3a37cc6ca0..787755e89a5b 100644
--- a/drivers/gpu/nova-core/mm/pagetable/mod.rs
+++ b/drivers/gpu/nova-core/mm/pagetable/mod.rs
@@ -7,6 +7,7 @@
 //! - Memory aperture types for PDEs and PTEs
 
 #![expect(dead_code)]
+pub(crate) mod ver2;
 
 use crate::gpu::Architecture;
 
diff --git a/drivers/gpu/nova-core/mm/pagetable/ver2.rs b/drivers/gpu/nova-core/mm/pagetable/ver2.rs
new file mode 100644
index 000000000000..d50c3e56d38e
--- /dev/null
+++ b/drivers/gpu/nova-core/mm/pagetable/ver2.rs
@@ -0,0 +1,184 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! MMU v2 page table types for Turing and Ampere GPUs.
+//!
+//! This module defines MMU version 2 specific types (Turing, Ampere and Ada GPUs).
+//!
+//! Bit field layouts derived from the NVIDIA OpenRM documentation:
+//! `open-gpu-kernel-modules/src/common/inc/swref/published/turing/tu102/dev_mmu.h`
+
+#![expect(dead_code)]
+
+use super::{
+    AperturePde,
+    AperturePte, //
+};
+use crate::mm::{
+    Pfn,
+    VramAddress, //
+};
+
+// Page Table Entry (PTE) for MMU v2 - 64-bit entry at level 4.
+bitfield! {
+    pub(crate) struct Pte(u64), "Page Table Entry for MMU v2" {
+        0:0     valid               as bool, "Entry is valid";
+        2:1     aperture            as u8 => AperturePte, "Memory aperture type";
+        3:3     volatile            as bool, "Volatile (bypass L2 cache)";
+        4:4     encrypted           as bool, "Encryption enabled (Confidential Computing)";
+        5:5     privilege           as bool, "Privileged access only";
+        6:6     read_only           as bool, "Write protection";
+        7:7     atomic_disable      as bool, "Atomic operations disabled";
+        53:8    frame_number_sys    as u64 => Pfn, "Frame number for system memory";
+        32:8    frame_number_vid    as u64 => Pfn, "Frame number for video memory";
+        35:33   peer_id             as u8, "Peer GPU ID for peer memory (0-7)";
+        53:36   comptagline         as u32, "Compression tag line bits";
+        63:56   kind                as u8, "Surface kind/format";
+    }
+}
+
+impl Pte {
+    /// Create a PTE from a `u64` value.
+    pub(crate) fn new(val: u64) -> Self {
+        Self(val)
+    }
+
+    /// Create a valid PTE for video memory.
+    pub(crate) fn new_vram(pfn: Pfn, writable: bool) -> Self {
+        Self::default()
+            .set_valid(true)
+            .set_aperture(AperturePte::VideoMemory)
+            .set_frame_number_vid(pfn)
+            .set_read_only(!writable)
+    }
+
+    /// Create an invalid PTE.
+    pub(crate) fn invalid() -> Self {
+        Self::default()
+    }
+
+    /// Get the frame number based on aperture type.
+    pub(crate) fn frame_number(&self) -> Pfn {
+        match self.aperture() {
+            AperturePte::VideoMemory => self.frame_number_vid(),
+            _ => self.frame_number_sys(),
+        }
+    }
+
+    /// Get the raw `u64` value.
+    pub(crate) fn raw_u64(&self) -> u64 {
+        self.0
+    }
+}
+
+// Page Directory Entry (PDE) for MMU v2 - 64-bit entry at levels 0-2.
+bitfield! {
+    pub(crate) struct Pde(u64), "Page Directory Entry for MMU v2" {
+        0:0     valid_inverted      as bool, "Valid bit (inverted logic)";
+        2:1     aperture            as u8 => AperturePde, "Memory aperture type";
+        3:3     volatile            as bool, "Volatile (bypass L2 cache)";
+        5:5     no_ats              as bool, "Disable Address Translation Services";
+        53:8    table_frame_sys     as u64 => Pfn, "Table frame number for system memory";
+        32:8    table_frame_vid     as u64 => Pfn, "Table frame number for video memory";
+        35:33   peer_id             as u8, "Peer GPU ID (0-7)";
+    }
+}
+
+impl Pde {
+    /// Create a PDE from a `u64` value.
+    pub(crate) fn new(val: u64) -> Self {
+        Self(val)
+    }
+
+    /// Create a valid PDE pointing to a page table in video memory.
+    pub(crate) fn new_vram(table_pfn: Pfn) -> Self {
+        Self::default()
+            .set_valid_inverted(false) // 0 = valid
+            .set_aperture(AperturePde::VideoMemory)
+            .set_table_frame_vid(table_pfn)
+    }
+
+    /// Create an invalid PDE.
+    pub(crate) fn invalid() -> Self {
+        Self::default()
+            .set_valid_inverted(true)
+            .set_aperture(AperturePde::Invalid)
+    }
+
+    /// Check if this PDE is valid.
+    pub(crate) fn is_valid(&self) -> bool {
+        !self.valid_inverted() && self.aperture() != AperturePde::Invalid
+    }
+
+    /// Get the table frame number based on aperture type.
+    pub(crate) fn table_frame(&self) -> Pfn {
+        match self.aperture() {
+            AperturePde::VideoMemory => self.table_frame_vid(),
+            _ => self.table_frame_sys(),
+        }
+    }
+
+    /// Get the VRAM address of the page table.
+    pub(crate) fn table_vram_address(&self) -> VramAddress {
+        debug_assert!(
+            self.aperture() == AperturePde::VideoMemory,
+            "table_vram_address called on non-VRAM PDE (aperture: {:?})",
+            self.aperture()
+        );
+        VramAddress::from(self.table_frame_vid())
+    }
+
+    /// Get the raw `u64` value of the PDE.
+    pub(crate) fn raw_u64(&self) -> u64 {
+        self.0
+    }
+}
+
+/// Dual PDE at Level 3 - 128-bit entry of Large/Small Page Table pointers.
+///
+/// The dual PDE supports both large (64KB) and small (4KB) page tables.
+#[repr(C)]
+#[derive(Debug, Clone, Copy, Default)]
+pub(crate) struct DualPde {
+    /// Large/Big Page Table pointer (lower 64 bits).
+    pub big: Pde,
+    /// Small Page Table pointer (upper 64 bits).
+    pub small: Pde,
+}
+
+impl DualPde {
+    /// Create a dual PDE from raw 128-bit value (two `u64`s).
+    pub(crate) fn new(big: u64, small: u64) -> Self {
+        Self {
+            big: Pde::new(big),
+            small: Pde::new(small),
+        }
+    }
+
+    /// Create a dual PDE with only the small page table pointer set.
+    ///
+    /// Note: The big (LPT) portion is set to 0, not `Pde::invalid()`.
+    /// According to hardware documentation, clearing bit 0 of the 128-bit
+    /// entry makes the PDE behave as a "normal" PDE. Using `Pde::invalid()`
+    /// would set bit 0 (valid_inverted), which breaks page table walking.
+    pub(crate) fn new_small(table_pfn: Pfn) -> Self {
+        Self {
+            big: Pde::new(0),
+            small: Pde::new_vram(table_pfn),
+        }
+    }
+
+    /// Check if the small page table pointer is valid.
+    pub(crate) fn has_small(&self) -> bool {
+        self.small.is_valid()
+    }
+
+    /// Check if the big page table pointer is valid.
+    pub(crate) fn has_big(&self) -> bool {
+        self.big.is_valid()
+    }
+
+    /// Get the small page table PFN.
+    pub(crate) fn small_pfn(&self) -> Pfn {
+        self.small.table_frame()
+    }
+}
-- 
2.34.1


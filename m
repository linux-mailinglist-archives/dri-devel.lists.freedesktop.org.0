Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCFpLyLpb2m+UQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 21:44:18 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D174B936
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 21:44:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0611210E657;
	Tue, 20 Jan 2026 20:44:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="RDBEgNZF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012000.outbound.protection.outlook.com
 [40.107.200.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E937310E225;
 Tue, 20 Jan 2026 20:44:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=egoNIGyTMFmq8Fr7lO3dEOsg8rIxCxlh/tUJkViHke4kWs8bqvHP26kqmW3ioj8bz4AbPHJfpyqtySUFo8ekzu8hDNrh+ZduPon2AkG+SCdZFaSzi8eTJRvaEJ80b7l2LdaWKaYIr9NkF9EOOI/EGeaioNab5pFGIt9yiERNflHvEiZGlHJsIWhgLqbiS8gqc97I4OR8ExFgjg6Tvo/aMMjO2urH7LY3W4SDWyMv6lwfQTFq6frz41/9qmKFagFEFxO+eWi3MGhwGpEovC+J5B47oOFZhMa+g9cz0Y895ORcwuwpD3br+rxkHOr+87XRf+nvXmv2zlOs6N/7PipLyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N6yduBpRUNj5frgHGs/am9bdgwj9ubygsF/v6jBT90o=;
 b=MdH60FJRaT1Z8egRsBXcmyc9Y+Rls6ZaAEjezqNnN8ggaRQG7UwdOKOaAeBE6Q8+avZtlmU8vKbjDFysij+mR/3IxOSaub0saE0zJOC5NxY6xxCmKgCr+G0fM0TRFsIV56xMolXqkQi3j9UnSTATj1PdeA5GBmTpKqDnoZMogxw2dxznxxIPcNLsvt+qvkDQ23Dtroxau9VabHmcXqd3o64nI+E6Y7lIAX4Ds57GNh3C4YkstfEJmxN1WYfsY3SWYE/2X8i/sbdjbqyhLI22M19nl+XssPM2BgJ79VnXzWQNxB4s5sfiRvaLn6S0Lnc4RTObJghoQmuVUs+A9LxWLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N6yduBpRUNj5frgHGs/am9bdgwj9ubygsF/v6jBT90o=;
 b=RDBEgNZFWqZowqdEjZw56giYr/v/xDQYnVa0a0c7sEOjnppDyJL5xBGqurXEKfMf/b+UL5hWrijRpR8cgeXZWJJSvR48ClTskaafCLoEAUuwfAYDZi9+8RQ33xH5WgkduTPPbLqpBxFSnUZ14qHRtMbeXq3FhC2+edUXdTR5NA8Wk+K2QQ4PbRabjYDmD9Wus8i2wZsYGlwwiXnlfmNFFND3ThURz03+SV1Dyv8PZnYSq3NUm2reBI6LjzMoteuFChYl3e5aSjMzD4jMRTNo+fuATEnjZQkKZ6Cs9ue6uPKHZNagIdXdqPV5HFTTU3WQtwsmrkG9GWp1J9z3UraV1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 PH7PR12MB6809.namprd12.prod.outlook.com (2603:10b6:510:1af::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.12; Tue, 20 Jan 2026 20:44:04 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9542.008; Tue, 20 Jan 2026
 20:44:04 +0000
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
Subject: [PATCH RFC v6 08/26] nova-core: gsp: Add BAR1 PDE base accessors
Date: Tue, 20 Jan 2026 15:42:45 -0500
Message-Id: <20260120204303.3229303-9-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260120204303.3229303-1-joelagnelf@nvidia.com>
References: <20260120204303.3229303-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0064.namprd03.prod.outlook.com
 (2603:10b6:208:329::9) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|PH7PR12MB6809:EE_
X-MS-Office365-Filtering-Correlation-Id: 03fe6b01-5987-4615-2555-08de5864a628
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DEWiw+ohiMVDIZWX2kd5o+ibSUlSogqe8p3ao53M/c1EXW1SItF7L1bnd8sS?=
 =?us-ascii?Q?5taAgd/1XqrCf+x8eL2np3cQDAY8v//KVX8IvjZFHst1X+xziwvxSTUcPdG4?=
 =?us-ascii?Q?tpNaLm47UF+t/IB95PfFWeDkXY8zX9E+pwDVx+TgzNIjchb1DFW4BgQGKfWV?=
 =?us-ascii?Q?qZBuDmlWAu1zdVc8utOu6JRMZ9jy3kTF6jGM05tXlXTRahW2ttgD4ZEVM4rU?=
 =?us-ascii?Q?g/iDHEMija/QxLfwlR7vBXrKMycp14v0HmqcxFXdXWOMXtFbMB91pIdVMkLO?=
 =?us-ascii?Q?jrwtTNS+tnwcnJwsQ8BtmzakkJaIdG7eoQNdD/TJ1V+JrZUX1Ci8O2O+xiJq?=
 =?us-ascii?Q?Y88H4mTi/WunwtPi0+QGD9WbNNhRV75mWZtHMGXq7tjw+O0+fasqPeb8vt/c?=
 =?us-ascii?Q?2WyM1ZDgH8LZD8Gbd5yks1Q7GaC2b7w0+DZLKTEl11Gwhj9qir7Cdg8xk7ka?=
 =?us-ascii?Q?9SxUQTcP1IXfuEBK6GbfGTCQGa6Jl1lx0/z5qv6wlwH1GbF0IGTkkZYzB/42?=
 =?us-ascii?Q?EsMw21GTlBJ1X8oFVGDdd9PPL9h+Y4BQoG9X2aOLgbKC3I3asHaCzcIoIVsR?=
 =?us-ascii?Q?KvQ+sXN4l8ZW22ng2Un/ospb4QHjc6rn1YofCMG7sVDNQBFNLNnr2WBqkm+d?=
 =?us-ascii?Q?Ct9Y8yr1bpG7GOm7mba4PIr0mBe0Ml0tT7R4xs7jrc8BFi1Gr49acrSNkOPM?=
 =?us-ascii?Q?5e7mD4kjUh/LZjbCRAogkqSDm7J4clXq62rilpY1OSkdkqHYFJJHoIYQdU+K?=
 =?us-ascii?Q?mG+jI6+vMLkfHP5iObV+aMOwwrOPU4atVu+9k8QWzsmHF1sT+/QHYteq63nQ?=
 =?us-ascii?Q?50v1kD1qHebwgCXTWCY2o41pdciQeY3R/QnrZZ5NpNe4zr6bkWE3PLbx+Crq?=
 =?us-ascii?Q?alcRtTFBFpE1GR3q+acLetlraqw8OBMwSFy/1U2gBn7lc3QuhjWyGGy8G91G?=
 =?us-ascii?Q?LYoKA7tacNKQJmjcfSQ9Wg5M6a5+IDu1vEYTU3ytIDkimnuwcB05SBnsF6ZN?=
 =?us-ascii?Q?p9aK7ll/HDMXfzJ7nNIRORTVabdlcJZfzw6VM4scfS5jpT63F+PqUirhrPBP?=
 =?us-ascii?Q?Ce42HLVv2t06cDvWrkoLvfIqPLzcSfyTNsrDazzpvdBRMWpFMrhZ+ghDcemJ?=
 =?us-ascii?Q?XMCk/AAONz4yEqyqrvLRjAbLoPbOwRew6+fI386ENzpO4f+UNfV4WUnIxygW?=
 =?us-ascii?Q?bWhQ1/pEkmlbaviWr62BeJSM10Lr3MAQWImkfjoldTyBA0Tn1JW3UAET/JRB?=
 =?us-ascii?Q?g1L3zs/OrfecVLKFCyT1XQLNfNzivM7MWS0aGLKtz0PSp1gwT/6h8hc2x0eH?=
 =?us-ascii?Q?e0SdaRaZkV7s58tOcsYMLfKEThQatZRVI7+5d/OcSb0QBVuW8L2ZwdNzybeN?=
 =?us-ascii?Q?8FGueFR12DGWrE+nTr5l+0b+j0cAb1lqPgBxhKYJT3B4QZk5qtmLoij2ueaE?=
 =?us-ascii?Q?y6rRGe9CTXxXlgNB2xh4ZuWLdXy5Fr0h6o0DwuL9LAwr1GkQyipqpiqZK+sB?=
 =?us-ascii?Q?Mw9WlREu1d4z/EPnILovbNkgP39onMrPFpCNT+5lDu7nHyS+fLPo+NM5Gcfx?=
 =?us-ascii?Q?urVNdrZaMUyw3zIbWzs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XH3c9j7mKIqhtM7RUFHws9F099xhQbV7pgxWv86grrWo5hwjXJLutylGgApe?=
 =?us-ascii?Q?jffLDI7CFSIqn4yKvcu0D/CyATHcfUzRw0YoxC9uYEkqNVu3Gtjz9GpisTAK?=
 =?us-ascii?Q?tNNWwiVz/KwfZehi/TMXYyMjHckzf0D3wWx/4emrdKhMWviXkT07ciCr+Sk9?=
 =?us-ascii?Q?iCuJRcg0XqTYS99fnHU2El3TmktXdowOXVkNloXpi6gtABKX/mZQSKEwobjA?=
 =?us-ascii?Q?bA8f1cHNU5WLxV40+6hNwUzxECZCQi5Bj41AbMEHhSfGnqVE7JRnVYApmtdd?=
 =?us-ascii?Q?G4x0aENYpiDhya5y1XrHAC3XOJswWSD9H1Tt34YrzMgS/JABCxRM+xf0hvp0?=
 =?us-ascii?Q?xLLJFlx3TYMXfsrf8+RbwuDzdgsYyWT74fyV3VZlHukCxpZdxckGhHRoZNtd?=
 =?us-ascii?Q?KTWHux9kNv8JOGglFEge9maNrOlNFAy+6n8cfwKbq+xk7XpetH2zIid5+oep?=
 =?us-ascii?Q?pM3PPtxIls8SWtyfpfYZ+fClh4HV/gPhlhSapbNA3eNXWiOJ8Jj/I0pAS6J2?=
 =?us-ascii?Q?/O0/sQ948vW5HxZIJdEvJTpVo213TQuGeS2Ek3c9ij7Tg0RI2emJFYhD5qPJ?=
 =?us-ascii?Q?O4UhTYDlnWQOf9VxdcV2X82AJPg0wg5v2DQQLj5Mwfv/MiEjlWp5q0odBfvY?=
 =?us-ascii?Q?fWx1EAN3wP2yAdoIQI9R8uVXxvos8wx+c0A+QQFr1cMWiB8c4ftn5W+RD2EV?=
 =?us-ascii?Q?zBXynQOC/gsXoxE1RgdzdShBlR+X+VSePjifvE3SgB/SIlU0GgO3CKepAPby?=
 =?us-ascii?Q?LBE8gHEptkFgmAEaG53wMtIcEO9Zy5RTrySdBZiAFXvWbOaVEziYg4JEXSnm?=
 =?us-ascii?Q?rprXZ0GRARfdoTeqhfV+EOl9xDGXi7RBP7m6tiG15SJqiOrnIdzRGD+0Mmp7?=
 =?us-ascii?Q?DygAvaIrx7l9ESFE3d+njFySjtoCKeFC94oWzJilcnXUtzN+6I4FVKBN4eEt?=
 =?us-ascii?Q?d5r9Dahk1bkzhvoPRwEeW38XXy0QGBFb7cPb52qp0bfYLWbz0gFTLCMp7WfX?=
 =?us-ascii?Q?vcG3UbfQrUe4p+bKM1IJWEszvF7Og42l0LI37HYshnlxMnZQKQqB2vg8KVl3?=
 =?us-ascii?Q?S8Dp+LO7FlRK6phmJqj/epaDbLYISVUTmUcNQt1b/ZAu08VW9l38kIQBLkWV?=
 =?us-ascii?Q?LW7ODZ9pCcZwNRZmK53qDY1FRKNpj1wQ46DWhKc1VD0PZIg2dbI4nUnzfaL0?=
 =?us-ascii?Q?OHzKzil4kaSCPqEd3Fc9VHIzsJIWm4roTSb0+xJyV9Q2ssiVQeazMesB5Irx?=
 =?us-ascii?Q?Mu3SDIVG7NyJtbbZo9n5lmCnm8yDcw+2tUVHkVzYoDgWHzbqlAuW0rla+Ktd?=
 =?us-ascii?Q?//z8mDcknU/gTjtIpsUQOWjkTQAU+2KDd2j1phsj/0I8mtSdauVHH3drP/yg?=
 =?us-ascii?Q?D/CBfPAiV2WpcTKGYDnBjGyoJ2VVcK/NGxPaGliUCjFhwVqWFiXstPutRpFh?=
 =?us-ascii?Q?ZPy3CzLg+IjO758/szmzMU22nnakw1bkxmgWqlbWj3tA7J5eucpADRsnnIIr?=
 =?us-ascii?Q?MHPDaIERNywZ+L8GQ3LwpDod2c7VhDzkcGFfAZbBLzWW/H7ll+gb6cTiJRUN?=
 =?us-ascii?Q?DbqvzZzkM1dwAUAobQh++rL7YjYHZ3y+K9AYH1OrH4cz2FwN62YJcO7btl7y?=
 =?us-ascii?Q?BaLW81/fLCAJUgRLH7Hy1CuQkNDRjFCYCcyk0uV6sfe4eg1A868MHI+nvpUF?=
 =?us-ascii?Q?SqHtsVOg1ZejGAI93doAFGoQGdSGRv605dbBbaPbIsGyEvSYUKOzwZr6Ixuc?=
 =?us-ascii?Q?WbPO43/xrQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03fe6b01-5987-4615-2555-08de5864a628
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 20:44:04.3393 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mWkNfYQ4TwqmUaQ/8ugLjW/t4DVIKK9O2PraAvToLcXEIHHn1OsIloqTWiDF46eMCXxHLkudAY4aT4PG8ufNJA==
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
X-Rspamd-Queue-Id: 73D174B936
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add accessor methods to GspStaticConfigInfo for retrieving the BAR1 Page
Directory Entry base addresses from GSP-RM firmware.

These addresses point to the root page tables for BAR1 virtual memory spaces.
The page tables are set up by GSP-RM during GPU initialization.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/driver.rs          | 1 +
 drivers/gpu/nova-core/gsp/commands.rs    | 8 ++++++++
 drivers/gpu/nova-core/gsp/fw/commands.rs | 8 ++++++++
 3 files changed, 17 insertions(+)

diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index d8b2e967ba4c..f30ffa45cf13 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -42,6 +42,7 @@ pub(crate) struct NovaCore {
 const GPU_DMA_BITS: u32 = 47;
 
 pub(crate) type Bar0 = pci::Bar<BAR0_SIZE>;
+#[expect(dead_code)]
 pub(crate) type Bar1 = pci::Bar<BAR1_SIZE>;
 
 kernel::pci_device_table!(
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index c8430a076269..7b5025cba106 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -189,6 +189,7 @@ fn init(&self) -> impl Init<Self::Command, Self::InitError> {
 /// The reply from the GSP to the [`GetGspInfo`] command.
 pub(crate) struct GetGspStaticInfoReply {
     gpu_name: [u8; 64],
+    bar1_pde_base: u64,
 }
 
 impl MessageFromGsp for GetGspStaticInfoReply {
@@ -202,6 +203,7 @@ fn read(
     ) -> Result<Self, Self::InitError> {
         Ok(GetGspStaticInfoReply {
             gpu_name: msg.gpu_name_str(),
+            bar1_pde_base: msg.bar1_pde_base(),
         })
     }
 }
@@ -228,6 +230,12 @@ pub(crate) fn gpu_name(&self) -> core::result::Result<&str, GpuNameError> {
             .to_str()
             .map_err(GpuNameError::InvalidUtf8)
     }
+
+    /// Returns the BAR1 Page Directory Entry base address.
+    #[expect(dead_code)]
+    pub(crate) fn bar1_pde_base(&self) -> u64 {
+        self.bar1_pde_base
+    }
 }
 
 /// Send the [`GetGspInfo`] command and awaits for its reply.
diff --git a/drivers/gpu/nova-core/gsp/fw/commands.rs b/drivers/gpu/nova-core/gsp/fw/commands.rs
index 21be44199693..f069f4092911 100644
--- a/drivers/gpu/nova-core/gsp/fw/commands.rs
+++ b/drivers/gpu/nova-core/gsp/fw/commands.rs
@@ -114,6 +114,14 @@ impl GspStaticConfigInfo {
     pub(crate) fn gpu_name_str(&self) -> [u8; 64] {
         self.0.gpuNameString
     }
+
+    /// Returns the BAR1 Page Directory Entry base address.
+    ///
+    /// This is the root page table address for BAR1 virtual memory,
+    /// set up by GSP-RM firmware.
+    pub(crate) fn bar1_pde_base(&self) -> u64 {
+        self.0.bar1PdeBase
+    }
 }
 
 // SAFETY: Padding is explicit and will not contain uninitialized data.
-- 
2.34.1


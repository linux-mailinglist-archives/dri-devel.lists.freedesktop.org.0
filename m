Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AErOKD7pb2m+UQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 21:44:46 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 559DE4BAA6
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 21:44:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED86510E6B1;
	Tue, 20 Jan 2026 20:44:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="kjG74h7+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011051.outbound.protection.outlook.com [52.101.52.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D66E10E67F;
 Tue, 20 Jan 2026 20:44:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CpZhTczc54LBgZcUUShAXnIt24Jk/6aMNn6ejrbYxICw4WKl7eObMaaz+ghUCDpXBxh0YXdovXQjIfP2dLw9QxreqJwKCTW2cBJZF/5ztOFcI6BPHZBgtkIxhLEcRjwgaSWHRHon8xilAEF/NbjvGA+Qcyf4HaKhknkxwJX9IfmSl9ECVV4jsVkclMejDDJG7WuKMAD2n4xmd6DLTbWJ6ie93bBedDROsiJ0gBEaasHd+Ci/vqjkpXDRHppZ/VPrwDZgdtQAUB7/9qT6YFIC3RG3dWPE+m499fvJ5kwuISBm98Lo2hA+OqetHk830Ji9cjTyPZy0xrAL4fkloNqYXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fNts2CmvatAyriteG+SRpJclNlHKGoF0tPzgCYqNO2o=;
 b=r4zLxg+hvIcaYq0VQ1Ra5pFbBbbVx3Eru8gG1DuCWRXAPdhdUM7APDVV6apIkGDPUxR2EAEf1xUkLSWItiHzPmfTecVukD9y+4i9gsFcPReThYjzFfoSgSfHl0nntIUB/8Lz+ZxyOVFXDS78C0MTZARjw9AGaM21+iiU65ErIEiX3R0moe5MsDEqWyjM135LpTHEsP2jeYc3sLY82sARTVr7MQDObzHtYRZWD6FFHg+Wjn//cLoEpBiAfDrNit9qHlKrpXQFqgl1rXXnNeEUQVO/l9Vc5zzrFyhu2aft5YsIBVtFg2vYICwqUa5UnKxVEdmCMTGOV24uiv8/hJqWdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fNts2CmvatAyriteG+SRpJclNlHKGoF0tPzgCYqNO2o=;
 b=kjG74h7+w0R+eCsy+zRmxTKKOpXizDeRsxnafrnfJZ2IehsZIm8DbDTWsKdXhfGOOBfvobVC/fB+cOHuKA2czOZUOnQSb/tKbDPrV48kPr+/SyIAjhlWba7qwVNeAB2XS5boCX/AXidYNmfm5YjMwUstRwZp/VjOAvd9CPQKef814b4SvIeJoipsr7/hkKIefS00/11q7lnLP6wMHdSPZT8MMk1TfUmxW0yq2FU0RwzVABLUvqRaFfwJF0+LO/a92ANtaH7G37TrEU8+P/RQy1nFBj2E/CiBv2XHXRn2KlpXqcpX2t55jQXw/tnySTJiHw98/Hl1gccVWCrS+2gntQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 CY1PR12MB9651.namprd12.prod.outlook.com (2603:10b6:930:104::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.13; Tue, 20 Jan 2026 20:44:28 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9542.008; Tue, 20 Jan 2026
 20:44:28 +0000
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
Subject: [PATCH RFC v6 22/26] nova-core: mm: Add PRAMIN aperture self-tests
Date: Tue, 20 Jan 2026 15:42:59 -0500
Message-Id: <20260120204303.3229303-23-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260120204303.3229303-1-joelagnelf@nvidia.com>
References: <20260120204303.3229303-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR20CA0057.namprd20.prod.outlook.com
 (2603:10b6:208:235::26) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|CY1PR12MB9651:EE_
X-MS-Office365-Filtering-Correlation-Id: 430b97a4-a43c-4ba1-dec1-08de5864b46f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5Lpir1Q3pFdQMvUfJeVXUUFtfMjwoNNREsxEPtBA+eDzTQZtr/YrpRdg+dbz?=
 =?us-ascii?Q?WAEPAOGfi76+q1HUGesxLy27bLoZTLqDiylPjIl4Eku4vfHnshdlAkJ3GW2P?=
 =?us-ascii?Q?VFxSuJHkE+jTp6es/JgNMhNOp5zBOav7roZXYzRGxXfhGtoHukdn/ECEXtyh?=
 =?us-ascii?Q?OxNegu5d8TQgALpUPLcGSG87cUcwSOm5zIgZzfr6ZhgaxpUlCwLcIY3a0W+V?=
 =?us-ascii?Q?6K+gUjopTDPu29C3PCbE/9rLME0XKWg9Bz7Ik7FYPWZiOcEJ8oAucxwKylpN?=
 =?us-ascii?Q?+qhW5IZtlu9i+Dd7zVAUJ+Yrtr7qW5JfrgoukGWbV++ZypwoncK3ATsS9zGK?=
 =?us-ascii?Q?1eI1dt8C6pnC0Z/U4kwcB5dXJIqpxI0oz5icJAWzIiHLSI+Iro6m52HsCnN/?=
 =?us-ascii?Q?3hpcpXn0j0pi0+ePf+PcqHZvQfoL5rD4owXWhC6bft+tCEccRyM+9zjYnYZv?=
 =?us-ascii?Q?1YROxkH7REhjR+CPsk0iKdinzRAylQ7cIavKG96xX6/HJ23/Dv2LTfC8Ri9d?=
 =?us-ascii?Q?du+bKZMbUsn9JgpqWQW64i78MOLBw0Qn6yGDMVNnPXN/s+2BNXkU0KeQtZLT?=
 =?us-ascii?Q?lm2HA8SMNum+5+BEskM3FKkOnLRjEbympNDIN8grEHPzPUBNaxbz3nh0xrSA?=
 =?us-ascii?Q?9Yh6ZG35w6zXIVEljTQyoACg01PVhAu+xwsYXZ7CkHM0Uzbh7jTn5TRYXAIL?=
 =?us-ascii?Q?hvBHGRt8TPSGy+urbf7ngo1GY31wwAn/ca8RHzJg6qXwe9Y9CFSX6+kIPq8z?=
 =?us-ascii?Q?Es1VQZRqLEtCy+mRbySldKd3B8WIwahjr71wpYUnKfCJU8W75F2s6WG6BRGf?=
 =?us-ascii?Q?F75wGhsj7Rgrpne+KnkBuYk50CiZVjs6Yn0XQXtBL+cSGB3odpjgBiiS07iQ?=
 =?us-ascii?Q?nYMjARCt9SdJpj/BTO/g9I0V4JgFLmf0NQH5HkPNeW24+j0kky9jF+pLRhd2?=
 =?us-ascii?Q?oaIKrt25S6HkSEYGw/W2kzhQg9LlLnTNLgZnJp0NfSe5Q0B/XgnQw2JUNO/I?=
 =?us-ascii?Q?cuLbGyxecfOH5heiDyFs8Dgi16a7je5Q1ocgH0yoYd6FdonZhINZOrG1hXQY?=
 =?us-ascii?Q?SRQHQ4QLkFZqK3UaVJaLXN7TgDF6YY3ILDG2MUdHK+N57OniPiJrFsMA2us4?=
 =?us-ascii?Q?ezE8hfzYoGRIGpOaTFwnFNKKYc3to6CmYkHawcmL0h0cQ8nMlUlUoqqHYGFP?=
 =?us-ascii?Q?Cv/MzGCmApOodnUPIh+9F8PiljUCbQSfOacigpSebjjLtDwavYNdaITdWd/I?=
 =?us-ascii?Q?2mMrbAEiYb/rLRnkqNCbn8h2eWoNRJm3CXLydciN3API7a5oFXRsdn0Anvpo?=
 =?us-ascii?Q?rL1l3gBsyIeIs7HrmlBuAYMrgEQw7D3H9JPOvkJJJR5T5GmgqhEI6oVMgKJO?=
 =?us-ascii?Q?cDE4rTPP2NHwTmwpUtNGO+Qip6MMCa00yv4YF+t5/c4xaR/t6lN7Vetsfkl4?=
 =?us-ascii?Q?yErV27zgfFj21nibxqfBugtOWJ4DDcVSXMx5FTtUpGFAeI1NV5iQWTIRu3+M?=
 =?us-ascii?Q?16eXVzcja4hpBLy4zEi0wDZn3I520igXKHOlFxR10KGkdOGVJiFmz6kB6Tj0?=
 =?us-ascii?Q?3spkMrQWheGDoQGmFe8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uSKmWR2z0SPKSQMWbgSQ1N8L9Df0Loju/CuxWzvfrPaT3GRi7DPbAc4DgrU2?=
 =?us-ascii?Q?noOAaQphwpc4YhDzNqDF1FDjzkAmVhAKGz2lq1pZ1tM4mOzxzdDZaqlFC/Me?=
 =?us-ascii?Q?jd7QmIOQy1q0qb9/yX5b0gn9iEkfUzwq2e9i5GvI53EYti747t2NAYTtwWCM?=
 =?us-ascii?Q?+gc0qvoV9chnShVOIwukwUMrUqSiAt5S/dXWMU/tDs4PrIamkh+PeDRCbdri?=
 =?us-ascii?Q?76qh/AIOX1ZXGwJZMb9K9VF0B3mhmrK7KwhXk5XtoWVH0fcPZy0VWKQlOF+K?=
 =?us-ascii?Q?ReoCtGbdyx+KhtPksHjXTuhPeooE82/+BRo3qE71OEm3YHfv4aPvD4QCGZfd?=
 =?us-ascii?Q?mo7I98SV/f4THVhuMcG2TJ2WviTUOLHBWsJnAjkiK1IxPl6KXsrD4qT64iTU?=
 =?us-ascii?Q?H8YLi+zwGZ43TYx7nJr7DP+8KoJ0gvpN9sSKuA9e5aTR1OjEScVS7odcPOOy?=
 =?us-ascii?Q?It4S4iT72NRLzW4PeVHKEnr7RBm2b7WqFDgur2ivaTG9gtu7IY2qy0rf9d1Y?=
 =?us-ascii?Q?VwhmPI7cCa2IxMoVmQCwq5CbuMqjvtkVkxVwqAS/PQEwdY6OZ+Dc85A6D2gh?=
 =?us-ascii?Q?bIAHl9m8Mz6gbEuL81Biz7p7G1wsa3pFwc/WvioPEj9lfu0sdlCdYJzTKdyh?=
 =?us-ascii?Q?MFZhOq9+xfzxYXO+6DdKj6MnaTUiKR/gVb2MFBfYLLpoqj/VrJJDjUgh2rpF?=
 =?us-ascii?Q?d7R0fG3Yxa/vQ0KRmj+gtq5D3D1bDyA+LFPHN3/bPrMbaGDUaIizBDbkfzwX?=
 =?us-ascii?Q?CcJ3vL5Bu2VPD0GZdex2h3uEBGAmQ8fr+w/A1SH1egUvBQ2AAY9H9wOHV3A6?=
 =?us-ascii?Q?LYTVzFS9uTcbZKRYXMpTDZqW78btb04/l0/mHPj2bNnz2sln+HXkdQHs+IEa?=
 =?us-ascii?Q?EW9mq3I5pn4GHsZbOPqe90i8VQeebDQEVvmOBVY0dtCkZYcNuxO+A3meoKbf?=
 =?us-ascii?Q?0vRQH0QDrptyhoebI9fGMTyqwnAIi2gWsa3p1vV+2B0uVFzwqJSnkl2QOS2B?=
 =?us-ascii?Q?+5TQjTaUjn5PA8FFOCnD6+QIlcmn3iazV9sSKUFuKCBZQMdFcS4BcO9rd+aa?=
 =?us-ascii?Q?bNV6NEqsPcBSebgf2+d86X5hHoStHBLsVeL1epu81wI3hh6L0mQBEg55MNHB?=
 =?us-ascii?Q?p9VCY+P/K9XaLU4L3mq9QPlsW7RXhxfVsGF+lXpgg11vaRjwvWizQf5ZPNi8?=
 =?us-ascii?Q?KGBfsUKnnEXysY8lM7UBSnNA5m67554mWeC6KW1VfVZRTdVSOAtRcv3kjLff?=
 =?us-ascii?Q?uHCFvWbDWXFdbbzet6tTULZC2aJ6wJK1UpLbejhUiQcAGiFg8rULffAP0W0b?=
 =?us-ascii?Q?ziqsm+BZht3PWWGmaptcUvD7V5LR8m/RDcK7tYzbNAHz3vmDX0ZcaP/BJeo4?=
 =?us-ascii?Q?uxtCwc5ZVHFgY9p+SGXk/nkr5e1HGDi11PNS84w5IkmoC+rax61Bj90U9/3d?=
 =?us-ascii?Q?LBIMFpfSvNYHZym/6S7DvT8PDKAvGqqRVMRbi9Pab1YZNZ5GtbSmGPcDR1Fh?=
 =?us-ascii?Q?Oqc3fpHwCODnSmYRjuSb7xTJ0lCSzPsW3W9QMKpWx4swyp1cb21gs9zMwV9F?=
 =?us-ascii?Q?0nGZ6hnNQ7mdqiU1RlHpp59VMJUSrep32IeEi5oQonYD5J0khomvkl8oKrDr?=
 =?us-ascii?Q?HNlqNnVWRXQTd6w/xCg4ihk5UrtMFeebxFV1SJB0gPYnzpDBRHTNeHY505Fq?=
 =?us-ascii?Q?SRGpId6LBcV0bmUw9oEhj4XhZvS2hMWEfyTPqqgn4Vxtdx9wfMYY2g8MYuYV?=
 =?us-ascii?Q?bwRWhLtEJA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 430b97a4-a43c-4ba1-dec1-08de5864b46f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 20:44:28.4558 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z8S1/twqvH9hApD3w/5edTgb8i0rE/QA9+G/d1mgN9gRzOdy+S4s5RfgFhOf/TDuMP+h+fedi8hHLqWVxScT6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9651
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
X-Rspamd-Queue-Id: 559DE4BAA6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add self-tests for the PRAMIN aperture mechanism to verify correct
operation during GPU probe. The tests validate various alignment
requirements and corner cases.

The tests are default disabled and behind CONFIG_NOVA_PRAMIN_SELFTESTS
When enabled, tests run after GSP boot during probe.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/Kconfig      |  11 ++
 drivers/gpu/nova-core/gpu.rs       |  14 +++
 drivers/gpu/nova-core/mm/pramin.rs | 160 +++++++++++++++++++++++++++++
 3 files changed, 185 insertions(+)

diff --git a/drivers/gpu/nova-core/Kconfig b/drivers/gpu/nova-core/Kconfig
index 257bca5aa0ef..cbdbc1fb02b2 100644
--- a/drivers/gpu/nova-core/Kconfig
+++ b/drivers/gpu/nova-core/Kconfig
@@ -25,3 +25,14 @@ config NOVA_MM_SELFTESTS
 	  BAR1 virtual memory mapping functionality.
 
 	  This is a testing option and is default-disabled.
+
+config NOVA_PRAMIN_SELFTESTS
+	bool "PRAMIN self-tests"
+	depends on NOVA_CORE
+	default n
+	help
+	  Enable self-tests for the PRAMIN aperture mechanism. When enabled,
+	  basic tests are run during GPU probe after GSP boot to
+	  verify PRAMIN functionality.
+
+	  This is a testing option and is default-disabled.
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 938828508f2c..a1bcf6679e2a 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -324,10 +324,24 @@ pub(crate) fn run_selftests(
         mut self: Pin<&mut Self>,
         pdev: &pci::Device<device::Bound>,
     ) -> Result {
+        self.as_mut().run_pramin_selftest(pdev)?;
         self.as_mut().run_mm_selftest(pdev)?;
         Ok(())
     }
 
+    fn run_pramin_selftest(self: Pin<&mut Self>, pdev: &pci::Device<device::Bound>) -> Result {
+        #[cfg(CONFIG_NOVA_PRAMIN_SELFTESTS)]
+        {
+            use crate::mm::pagetable::MmuVersion;
+
+            let mmu_version = MmuVersion::from(self.spec.chipset.arch());
+            crate::mm::pramin::run_self_test(pdev.as_ref(), self.bar.clone(), mmu_version)?;
+        }
+
+        let _ = pdev; // Suppress unused warning when selftests disabled.
+        Ok(())
+    }
+
     fn run_mm_selftest(mut self: Pin<&mut Self>, pdev: &pci::Device<device::Bound>) -> Result {
         #[cfg(CONFIG_NOVA_MM_SELFTESTS)]
         {
diff --git a/drivers/gpu/nova-core/mm/pramin.rs b/drivers/gpu/nova-core/mm/pramin.rs
index 6a7ea2dc7d77..06384fb24841 100644
--- a/drivers/gpu/nova-core/mm/pramin.rs
+++ b/drivers/gpu/nova-core/mm/pramin.rs
@@ -242,3 +242,163 @@ unsafe impl Send for Window {}
 
 // SAFETY: `Window` requires `&mut self` for all accessors.
 unsafe impl Sync for Window {}
+
+/// Run PRAMIN self-tests during boot if self-tests are enabled.
+#[cfg(CONFIG_NOVA_PRAMIN_SELFTESTS)]
+pub(crate) fn run_self_test(
+    dev: &kernel::device::Device,
+    bar: Arc<Devres<Bar0>>,
+    mmu_version: super::pagetable::MmuVersion,
+) -> Result {
+    use super::pagetable::MmuVersion;
+
+    // PRAMIN support is only for MMU v2 for now (Turing/Ampere/Ada).
+    if mmu_version != MmuVersion::V2 {
+        dev_info!(
+            dev,
+            "PRAMIN: Skipping self-tests for MMU {:?} (only V2 supported)\n",
+            mmu_version
+        );
+        return Ok(());
+    }
+
+    dev_info!(dev, "PRAMIN: Starting self-test...\n");
+
+    let mut win = Window::new(bar)?;
+
+    // Use offset 0x1000 as test area.
+    let base: usize = 0x1000;
+
+    // Test 1: Read/write at byte-aligned locations.
+    for i in 0u8..4 {
+        let offset = base + 1 + usize::from(i); // Offsets 0x1001, 0x1002, 0x1003, 0x1004
+        let val = 0xA0 + i;
+        win.try_write8(offset, val)?;
+        let read_val = win.try_read8(offset)?;
+        if read_val != val {
+            dev_err!(
+                dev,
+                "PRAMIN: FAIL - offset {:#x}: wrote {:#x}, read {:#x}\n",
+                offset,
+                val,
+                read_val
+            );
+            return Err(EIO);
+        }
+    }
+
+    // Test 2: Write `u32` and read back as `u8`s.
+    let test2_offset = base + 0x10;
+    let test2_val: u32 = 0xDEADBEEF;
+    win.try_write32(test2_offset, test2_val)?;
+
+    // Read back as individual bytes (little-endian: EF BE AD DE).
+    let expected_bytes: [u8; 4] = [0xEF, 0xBE, 0xAD, 0xDE];
+    for (i, &expected) in expected_bytes.iter().enumerate() {
+        let read_val = win.try_read8(test2_offset + i)?;
+        if read_val != expected {
+            dev_err!(
+                dev,
+                "PRAMIN: FAIL - offset {:#x}: expected {:#x}, read {:#x}\n",
+                test2_offset + i,
+                expected,
+                read_val
+            );
+            return Err(EIO);
+        }
+    }
+
+    // Test 3: Window repositioning across 1MB boundaries.
+    // Write to offset > 1MB to trigger window slide, then verify.
+    let test3_offset_a: usize = base; // First 1MB region.
+    let test3_offset_b: usize = 0x200000 + base; // 2MB + base (different 1MB region).
+    let val_a: u32 = 0x11111111;
+    let val_b: u32 = 0x22222222;
+
+    // Write to first region.
+    win.try_write32(test3_offset_a, val_a)?;
+
+    // Write to second region (triggers window reposition).
+    win.try_write32(test3_offset_b, val_b)?;
+
+    // Read back from second region.
+    let read_b = win.try_read32(test3_offset_b)?;
+    if read_b != val_b {
+        dev_err!(
+            dev,
+            "PRAMIN: FAIL - offset {:#x}: expected {:#x}, read {:#x}\n",
+            test3_offset_b,
+            val_b,
+            read_b
+        );
+        return Err(EIO);
+    }
+
+    // Read back from first region (triggers window reposition again).
+    let read_a = win.try_read32(test3_offset_a)?;
+    if read_a != val_a {
+        dev_err!(
+            dev,
+            "PRAMIN: FAIL - offset {:#x}: expected {:#x}, read {:#x}\n",
+            test3_offset_a,
+            val_a,
+            read_a
+        );
+        return Err(EIO);
+    }
+
+    // Test 4: Invalid offset rejection (beyond 40-bit address space).
+    {
+        // 40-bit address space limit check.
+        let invalid_offset: usize = MAX_VRAM_OFFSET + 1;
+        let result = win.try_read32(invalid_offset);
+        if result.is_ok() {
+            dev_err!(
+                dev,
+                "PRAMIN: FAIL - read at invalid offset {:#x} should have failed\n",
+                invalid_offset
+            );
+            return Err(EIO);
+        }
+    }
+
+    // Test 5: Misaligned multi-byte access rejection.
+    // Verify that misaligned `u16`/`u32`/`u64` accesses are properly rejected.
+    {
+        // `u16` at odd offset (not 2-byte aligned).
+        let offset_u16 = base + 0x21;
+        if win.try_write16(offset_u16, 0xABCD).is_ok() {
+            dev_err!(
+                dev,
+                "PRAMIN: FAIL - misaligned u16 write at {:#x} should have failed\n",
+                offset_u16
+            );
+            return Err(EIO);
+        }
+
+        // `u32` at 2-byte-aligned (not 4-byte-aligned) offset.
+        let offset_u32 = base + 0x32;
+        if win.try_write32(offset_u32, 0x12345678).is_ok() {
+            dev_err!(
+                dev,
+                "PRAMIN: FAIL - misaligned u32 write at {:#x} should have failed\n",
+                offset_u32
+            );
+            return Err(EIO);
+        }
+
+        // `u64` read at 4-byte-aligned (not 8-byte-aligned) offset.
+        let offset_u64 = base + 0x44;
+        if win.try_read64(offset_u64).is_ok() {
+            dev_err!(
+                dev,
+                "PRAMIN: FAIL - misaligned u64 read at {:#x} should have failed\n",
+                offset_u64
+            );
+            return Err(EIO);
+        }
+    }
+
+    dev_info!(dev, "PRAMIN: All self-tests PASSED\n");
+    Ok(())
+}
-- 
2.34.1


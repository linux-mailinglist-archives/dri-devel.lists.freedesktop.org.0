Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6M78HCVpl2muyAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 20:48:53 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1645E162296
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 20:48:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84BDD10E746;
	Thu, 19 Feb 2026 19:48:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="f38Iljbq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010012.outbound.protection.outlook.com [52.101.61.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A92CF10E743;
 Thu, 19 Feb 2026 19:48:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gSsu2QEwIrnszIakYY4XZtVT4zRc+DKU9AFxCXTY3AHID3EMyt1zh46OOXCXUnakTLYahkC9PhCgS6VFb+R4jffi5DTbjHy7kKW41aEDgxBviuI6HLQiH/aaJd1iaJyVv5S0zfQ6OnUM87KVoJaVa3+mPCIszyzmKenghqjQzAjSeh3fuh/P60I1pDcvlW/nd48qIZvdJ0dRtwhN0tt3UfI0CfVQxM0Uk2iYqvamK5lBPrNWXUxH5w+1j67yQ/wwh+FOY62IrYXF6S61aqLW0wUGKTdc59ysaJ6nhh1jfAmXsKuYlnR4r/QIHHk1gF9bH+JatxC2i893E54KG61TUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q+j6jVOXYkuTUnXNZywacQfp34JireSz3Fn+pSkrMkg=;
 b=wUwuZBE1vLiDb7aRhU+Gjy2Rn8mk822Izf3o0I5xZydko4Lzb3kXFWWMcobBx/iVQtx65fpFJK6TklyVBmv4SrElS5FVhIDCRRkivKEQLWL/Uj/rqGosuJKTmMjPcKmlfDtH7prC15HFBmiP5pdWrs3vNVU5TcoalDrOP+TU9C9SziQ906HE3fmZBwmfe7jSSwJBaemmTBFpu9OK3gw5roCLt3z2e2D9sjo6seoMc6ZQs5AI+0BA8kn1iPf8/yLXmr4WOvH5lgM94eX+7OvAWMT2o8tKj1CItapQ1NIPINYW534XqoWxIRgfWxlo8HREjvPHb3FuwRPnMMcrZyVI7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q+j6jVOXYkuTUnXNZywacQfp34JireSz3Fn+pSkrMkg=;
 b=f38Iljbq57X7+C3v3kdvzjcLNNboS1Ve/UNsjvfMTVSGZOxRi7A/KWd9kn871IOS3VMM+3y9Dkni75xzJ8Lt3IW05yxJ1BCbHqyucOJT6nO7W03Cv0MxsiQqKPokmDDbq37WfBc/QemQFHyroOcemMdwLQISkGKJj39DBoXzjddlbX8Y9FdGbRk1Tcqh/DOyoSCDV6UfKpjdwsWpmAmzfIASMfkib+iqDkuaevXNQpta1XXVANreY048lFyO1NlZBQ6BTfQa+ITE48M1jyL1NMITN1GQo6UN0VDIRWTP7uWnXVWA7+9Vr//O01JNrwGt6QA7QnC/gahVL+vNis0+CQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 IA0PR12MB7722.namprd12.prod.outlook.com (2603:10b6:208:432::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.16; Thu, 19 Feb 2026 19:48:40 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 19:48:40 +0000
Date: Thu, 19 Feb 2026 14:48:38 -0500
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Helge Deller <deller@gmx.de>, Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Alistair Popple <apopple@nvidia.com>,
 Andrea Righi <arighi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 Philipp Stanner <phasta@kernel.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Eliot Courtney <ecourtney@nvidia.com>, joel@joelfernandes.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v7 00/23] nova-core: Add memory management support
Message-ID: <20260219194838.GA1013545@joelbox2>
References: <DGJ1G3D32OMK.30HANB1W46XVL@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DGJ1G3D32OMK.30HANB1W46XVL@nvidia.com>
X-ClientProxiedBy: BL1PR13CA0120.namprd13.prod.outlook.com
 (2603:10b6:208:2b9::35) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|IA0PR12MB7722:EE_
X-MS-Office365-Filtering-Correlation-Id: 9aa8e3a2-c0bf-4126-87b4-08de6fefe13b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?knnMzP7jZeLejYtRucfhjeQFn4Pl3AoP/w3ifDMJNxkS6eMawVrcjnXGWC4e?=
 =?us-ascii?Q?hwklJH8sHyDOjjrV9NpZQBEAsPs61OAkmDs3HFrO3FEzMAAl8S8SmC6qS7lE?=
 =?us-ascii?Q?ptrDFq9+w4VbgkLvpedZr53bq0D+34xGKqHEGO0wn+0GTbGomH+HdhSFdPMF?=
 =?us-ascii?Q?oXxk1NrUXkgPZI6kDVEXYxX1EIuVxNHVyCp2vODcQj88VlGOA9MgXM8bd2DZ?=
 =?us-ascii?Q?TEKsulBNTILZ0yg2rcCIWGuXefoldnd/jWE54NI8C3TuVM2vdmqr1M1/mzXR?=
 =?us-ascii?Q?sFOCBVpRtreF3XI73sHCOivCjki/9H/TGFMntBbeD7AoVw37QVar+9+hj898?=
 =?us-ascii?Q?tmkVQ1ARHOX5N079qi20090PvswhZLI6HNhBcdmmff2nYwvBCsJTJ0hxGsOO?=
 =?us-ascii?Q?0ZFVC81LaNNxVXhg+9IsCpJW5sz3S2RYfgwbXThRUY4uSK1+QwMKfVtnz9IL?=
 =?us-ascii?Q?20NhHMsZuLjK2xckceGxZPJrrpN/KqO0vz1vHMWLGlBa744IevkPqnmGBUmo?=
 =?us-ascii?Q?/754BEjlG76o4bzGk3myofRgW5n9YGNO7MVrybb0cup3uu+P8/w/2l3LdWxG?=
 =?us-ascii?Q?874CbHkY/wqaKoWYEPtl5J8kJqb6xieNVX63sRCudsilyz2xVUXYed4aa/7e?=
 =?us-ascii?Q?tcpu1PfhdvAxDPd6vWoUV+D8W6SuCYgQQfD3+ykLzeHJX3pba0jc+lQsn2pp?=
 =?us-ascii?Q?wSfhCskxZqYAmE58ICXTCZ5LvLndpbMljDjYIh9mOuGiZLt5ygbHsLqvPkQ9?=
 =?us-ascii?Q?px/awnL290g/m7rKp//m/iySuC763LHRBiKCvUgJfJB1eftJWMCqLQ5/IsfA?=
 =?us-ascii?Q?N/fT2jkCRDmxoWCSbVRfVqDANuga0WT3JtFpAe+FswCNPGOYbMZbjD4qLGKS?=
 =?us-ascii?Q?oFHNvqbvxXIScP9s9gkCctNJUD7H+mRbObZ3eYkRMUPB7c/mnq3x7RUskQc+?=
 =?us-ascii?Q?McbWSDzC+keNEbjf2bZ36j89DMX9rIAACI5B5BH1hIki+dxO+G98QKApajit?=
 =?us-ascii?Q?b+x3HSgPK+5RnfhpKjzfQb0uHs3mk5RrccnGiHQ5cgcYddPyreCgKR14NLRV?=
 =?us-ascii?Q?f81+un6wEdAKVFS6FdDmF0h1KVEgnbDvAiA+LWZqNTIGE4iJztDhwNEUWWah?=
 =?us-ascii?Q?J8VErJQ50aPUlvaU/5ovh+8/Mkh9rRFQDqzIzqPES1Z7JnedbLc07W1Ig3wh?=
 =?us-ascii?Q?cLicEAC8EikbvDeLDNHhoNBibKfQmS3gFWS9GQXHwDsA9B8KF6lKo/8Fx8AW?=
 =?us-ascii?Q?2JQF3YinfC0pNkXT700jzPT9BE740LLeTYyre15e+56rfv8cCJu4ck3TbnLE?=
 =?us-ascii?Q?5h4k56WI/OEP1w6ihphUa9EymlpoS+pa4V0GnlR4xKC8Nhe/p3o5gA0c3n+U?=
 =?us-ascii?Q?fdP1L6MouuivDcHH/Ms/uVs6KmhL697OQaJ6gL5kaqJZrZAsGEMQMSRf3EcC?=
 =?us-ascii?Q?RYP3Ohv1TfxkbVf5xjtJLmYU8396i4Lnt4gho7W8X5YXv8ltjThkkpry8Pda?=
 =?us-ascii?Q?gOrToB7bD0nmVmuor+K6yOKcUHgBas3aH7ZR2HqR8H7IjCOk0pU7fIGy46pV?=
 =?us-ascii?Q?1Lu5Xv4y3PuhrSUgl4g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RD+p4rlUd+MZ0FJvfo+/Fwu8YF4SfXzNA4gEKli5IpVPFVnQv7KKB9mSeyhk?=
 =?us-ascii?Q?lJsO6IwA3i/WagBLV9Vu7idWGC/VofnnfpJtQ1zbOmpzrzkS0x0aan1MmFiT?=
 =?us-ascii?Q?IzzgtHwp4vpBcLFWbWwZyTDYbMXyDFZ/MKGp3+DmS1Wm4Oqa9ybWtt2F+5YL?=
 =?us-ascii?Q?X5mmG1DUkVYUs3LcxS7iMScbZceifA97nc36cQLswGagRPVhSZexBsACLP/F?=
 =?us-ascii?Q?JvOzTCU0oAt3jGrMABHdBl+O35CLrFL6IiNnnyQXBUVIzIzZURvGJqdkM48T?=
 =?us-ascii?Q?So6BxyMLIiN3YhLxUMK08F8WFrv1rCbg9qQWrxShqfwAm7F1ffp9sV7urvD4?=
 =?us-ascii?Q?TIjMdT1X1rN+OX79/1S1HWAGMMHSyCJqKHHvZN1J6rThKyGO+sYrPcuNSCif?=
 =?us-ascii?Q?ex+SAzp3j1TKT0BW9j+CvDrCHUKy9jVK9mnmqbkNohKWfQ8aoMg+heTOrJVB?=
 =?us-ascii?Q?JYgjYzPd79tRCd5nG+Wk4ocs2Xg5gK0COfwmVXypLNrWWk1AAbn7NgVY7iO1?=
 =?us-ascii?Q?g6cTycxQQiLi8oQF0qmB4Jymv7iUoKx0t+HOitT5CW/s66eDlR1h3pRWMI1p?=
 =?us-ascii?Q?Hs0id8F2j9wfu7Gh5ep1z4879n8cP1qsBPA0z8e6OGuy3tdUM08//2bDWN66?=
 =?us-ascii?Q?NPNsN+YJpXaP3ndssLnzWg10+xocVYvAdP2UStzhpeiUeeXHcSsd8Hflwm88?=
 =?us-ascii?Q?QvRZBeanbZ0rpOS9k/YR/qgx+HkugXYhqxLKzvIWnnmmYDDSi4x0x4Jw/GCE?=
 =?us-ascii?Q?8yah7ndnz/VP0eWtHOhdSLrJfScN8kFgQlzY8G2tVH0KmjFyoP6DhbXTlHpn?=
 =?us-ascii?Q?LalgDQl3Rm6q29i+FQaKXtj8Xjt9iZJH4bYT6YVnKpud/36/ABKhadJ9/bFe?=
 =?us-ascii?Q?nLLKttLqWGBd+9dBe23oZMwCz4lLMWUcCLkvW2DuLK8VlcnMPhSnt8In9/5P?=
 =?us-ascii?Q?mhIMwfE+qn44wkhnApRMr8TOX+nqZo/hOwReR4EvYrqd+mLstR1sLaBauilK?=
 =?us-ascii?Q?+X2xa/J8HUNkcaiXAzwffsZQ7GXUUGZ/LQ8k+9UnECUEkM8QPphu5ynsmzsp?=
 =?us-ascii?Q?42LHMOsdRnVSrwSEyXzxZWKNL9Gna793xI92EmkkDLK0huKpgz+3WMJXTM9X?=
 =?us-ascii?Q?VbjBaLH1oQ4fIlOYq6+IfXzlf6sziAzMyPNxRiEEeUm66d0n/0LKSwktRjUs?=
 =?us-ascii?Q?5lMV+8wjRRyJoX0kFCzvZ51WucC7ScAuFIDYe5F2QwjZtZAFkR6LWShfrcJ+?=
 =?us-ascii?Q?PtbXOpa4NkUUoxYax73ZhbBTrGAAa6Pif1n1Lf0Sjr7GHP1phm9j3mhbIuwJ?=
 =?us-ascii?Q?v3o1QxAq0oc84ML4TvQZVH7llHbejmlyRZtK7DaITHtoAd5lTKypFPE0K8H3?=
 =?us-ascii?Q?JRrvqXH0oLw37n1RUw8DgO2SvEz9Of8lOVKrtNjw3264afnsx4+n02ZNYRCd?=
 =?us-ascii?Q?EHperMKeDNfww0ONFx8+XM8QMG8qC+f2r3a6hLgeDuIQ6fhb16HQBASUG6Py?=
 =?us-ascii?Q?6xzSc5Ah8IfmR4Q/N+DAzbTHaRNpLTxraEqBJYJ81IWKj8DQA+6z/x+zhr8K?=
 =?us-ascii?Q?YMctqV2lYluC0JxQI6GDi++QTaue5ZCOg4WrB6jrBAMEnKj3G6ec/5Pdioz6?=
 =?us-ascii?Q?00xg2bRd5DKpKFcWVu6ADdhlmwIyZgRLzKpPqn6YkLafBFMbyI/I0bdsumFK?=
 =?us-ascii?Q?p4ngpuBZmJHV1ag6vzf8aX/X/+5s/63+GVK5DpKIRafDmxvAIy9+WgNW0dgt?=
 =?us-ascii?Q?LQ6ekvDM9g=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9aa8e3a2-c0bf-4126-87b4-08de6fefe13b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 19:48:40.1375 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c+k3BPmk3Ocb3gxmPPMlM/T47dN2ZnJmOpMKhTP+NazDHMXNwQMCTrdBfR/CShHWsbxvil40TVBCOsnGIrPbBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7722
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[44];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.intel.com,kernel.org,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,gmail.com,garyguo.net,protonmail.com,umich.edu,nvidia.com,weathered-steel.dev,collabora.com,joelfernandes.org,lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 1645E162296
X-Rspamd-Action: no action

Hi Alex,

Thanks for taking the time to go through the series and for the effort
of doing the reordering. Just to clarify, do you mean I should be
sending each of the phases separately for review instead of in one
series?

By any chance, do you have the tree after doing the rearrangement that I
could take a look at? That would be very helpful so I don't repeat your
rearrangement effort.

Some comments below:

> Nice series, a few overall remarks before I dive deeper into each patch:
>
> - Use `gpu: nova-core:` (not just `nova-core:`) as the patch prefix.

Done.

> - There were a few clippy warnings/rustfmt diffs when I built it.
> - There are build failures introduced in patches 11 and 18 - basically
>   the series doesn't build from 11 until the last patch.
> - This patchset is using the `module/mod.rs` pattern instead of
>   `module.rs` for new modules. The latter is the preferred norm IIUC.

I will work on fixing these based on the reordered patches for the next
spin.

> Phase 1: GSP plumbing
> - nova-core: gsp: Return GspStaticInfo and FbLayout from boot()
> - nova-core: gsp: Extract usable FB region from GSP
> - nova-core: fb: Add usable_vram field to FbLayout
>
> These constitute a logical change by themselves, by getting more
> information from the GSP to know how much VRAM we have. You could even
> display the result as a dev_info of dev_dbg to remove the only remaining
> `dead_code`.

This looks good to me.

> Phase 2: PRAMIN support
> - nova-core: mm: Add support to use PRAMIN windows to write to VRAM
> - docs: gpu: nova-core: Document the PRAMIN aperture mechanism
>
> PRAMIN is needed by everything that follows.

This looks good to me.

> Phase 3: GpuMm
> - nova-core: mm: Add common memory management types
> - nova-core: mm: Add TLB flush support
> - nova-core: mm: Add GpuMm centralized memory manager
> - nova-core: mm: Use usable VRAM region for buddy allocator
>
> The common memory management types patch and TLB give us all we need to
> introduce GpuMm, which makes it more accessible that after going through
> all the page table types which it doesn't depend on. This culminates
> with using the result of phase 1, which also allows you to get rid of
> the temporary 1MB window hack if you rearrange the code a bit.

Yeah, that is a nice advantage!

> Phase 4: page tables / VMM
> - nova-core: mm: Add common types for all page table formats
> - nova-core: mm: Add MMU v2 page table types
> - nova-core: mm: Add MMU v3 page table types
> - nova-core: mm: Add unified page table entry wrapper enums
> - nova-core: mm: Add page table walker for MMU v2/v3
> - nova-core: mm: Add Virtual Memory Manager
> - nova-core: mm: Add virtual address range tracking to VMM
> - nova-core: mm: Add multi-page mapping API to VMM
>
> The main course, required for BAR1 - these follow the original order.

Sounds good.

> Phase 5: BAR1
> - nova-core: Add BAR1 aperture type and size constant
> - nova-core: gsp: Add BAR1 PDE base accessors
> - nova-core: mm: Add BAR1 user interface
> - nova-core: mm: Add BarUser to struct Gpu and create at boot

These sound good to me.

> All the BAR1 stuff now happens in one place. There is certainly room for
> merging a few patches to avoid introducing dead code and eliminating
> just after.

Yeah, I tried to keep the commits at a reasonable size to make review
easier. I will look into merging a little more to see where it is possible.

> Phase 6: tests
> - nova-core: mm: Add PRAMIN aperture self-tests
> - nova-core: mm: Add BAR1 memory management self-tests

This sounds good to me.

> I have done this reordering locally and it seems to build fine.

Please share your reorder tree if you still have it. That would likely save
me a lot of effort. Thanks.

> I'll do a patch-by-patch review following this order, but I wanted to
> share it first for other reviewers of this revision as it makes the
> series more accessible IMHO.

Looking forward to it. Thanks!

--
Joel Fernandes


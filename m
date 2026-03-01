Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKL5BIw3pGnMagUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 13:56:44 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B44C71CFB86
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 13:56:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0740610E280;
	Sun,  1 Mar 2026 12:56:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="dABDq58F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010070.outbound.protection.outlook.com [52.101.46.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69FEE10E242;
 Sun,  1 Mar 2026 12:56:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tUWXcmSbDADXCXCj4mTqO1s2ZfQRWbLbjsXWD4cK0s7nBJD28PfHWDpX8fKKPP2xdmwzmpIG30/KT3uvojkrl09jsTwmA/R7agmQkByrfs4Ag4hs/0g+OGf8+4u05NYViMwe81vR8WN0T1eo/F+UNm2fReg3ZI4DyCM27niB861FYOS1DgolfrgUaq3BeM5suvz7SS73vOkfzK350Hp5YEw6vywq09AsLWvEl1gXpmgzlxKd3BkbK7ZrH+/wdvywN95KwCZS1V2wAThJw3qrv0bQsROV3o/GW2TiiTvRKc7I5WhNHEsXOQp5qYnF5ByWD5YjmOkvloSCJ/TEzWtGPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GIGfi1bmm7i7SmOkR5eGx5RU+3wrmWy3gsj7tkhJ06M=;
 b=fIp1TNoHl+kR5m5V3SCt7fa4J2yTr8U+r3prafF3/cGIAdblI2NaJ7njaqlDoxByPpoAI0h9s9/xH65ike6SEyfPva+FpIbgFbN5EDVxbRlfm9xLvWTX0pe/nmcxY0V1/y6BoOe4IMghpaqoG2DES/T8QOXBu4nzcE3Uyo9a3VfCpy08h6tQEzKfZAxL7RD00ZHp6raZiWTfibTe7sKDPxN1HNsfMx69OhI/csXiTiYZsRZ3HItSnQjzJ0q63L82F1OliwX58gXBhnesY2sJk/Ds6aDchRgWc02kFsJrJB1hdWt7aR+qerAQZZ08/ZcD+aTsJdvs/z+/ayrJFDlT4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GIGfi1bmm7i7SmOkR5eGx5RU+3wrmWy3gsj7tkhJ06M=;
 b=dABDq58FJKUUm7UTPBAFY4EfwwKjXKNpvdjTInF5PxqzFYeaU10hhGUPGyf2EhgybgZqnqeN4vTGBaFOVVttMIiWy5b+huIYGJbCAFxwSqRgBxrbrFiTgku/0m8LU2QyoHYGF+2cNmVyoCo6nhGaBspPELzad3xu7ylOK26r1FZh+tVy0bWfeDQgFe3CV4T2SJTRNN3MY5QTytkLOARD3KeBG+voUnmmLtr20L3bkuf8BjGY3D8rILpDPe3VMppR4hh8FkO2a9mwHIsNjr09fF1bd/Lf18xQKo+TBZE52powTj4niEGH0Qzy2FQWXbmxSJUqNYG1MpWk9NATFmQ4ww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA0PR12MB9010.namprd12.prod.outlook.com (2603:10b6:208:48e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.11; Sun, 1 Mar
 2026 12:56:34 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9654.020; Sun, 1 Mar 2026
 12:56:33 +0000
Content-Type: text/plain; charset=UTF-8
Date: Sun, 01 Mar 2026 21:56:30 +0900
Message-Id: <DGRGNLACDJI2.1JFEXE1GL1ZVM@nvidia.com>
Cc: <linux-kernel@vger.kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Dave Airlie" <airlied@redhat.com>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Koen Koning"
 <koen.koning@linux.intel.com>, <dri-devel@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "Nikola
 Djukic" <ndjukic@nvidia.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Simona Vetter" <simona@ffwll.ch>, "Jonathan Corbet" <corbet@lwn.net>,
 "Alex Deucher" <alexander.deucher@amd.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, "Jani Nikula"
 <jani.nikula@linux.intel.com>, "Joonas Lahtinen"
 <joonas.lahtinen@linux.intel.com>, "Rodrigo Vivi" <rodrigo.vivi@intel.com>,
 "Tvrtko Ursulin" <tursulin@ursulin.net>, "Huang Rui" <ray.huang@amd.com>,
 "Matthew Auld" <matthew.auld@intel.com>, "Matthew Brost"
 <matthew.brost@intel.com>, "Lucas De Marchi" <lucas.demarchi@intel.com>,
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Helge Deller" <deller@gmx.de>, "Alex Gaynor" <alex.gaynor@gmail.com>,
 "Boqun Feng" <boqun.feng@gmail.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Andrea Righi" <arighi@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "Philipp Stanner" <phasta@kernel.org>, "Elle Rhumsaa"
 <elle@weathered-steel.dev>, <alexeyi@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, <joel@joelfernandes.org>,
 <linux-doc@vger.kernel.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <linux-fbdev@vger.kernel.org>
Subject: Re: [PATCH v8 11/25] gpu: nova-core: mm: Use usable VRAM region for
 buddy allocator
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260224225323.3312204-1-joelagnelf@nvidia.com>
 <20260224225323.3312204-12-joelagnelf@nvidia.com>
In-Reply-To: <20260224225323.3312204-12-joelagnelf@nvidia.com>
X-ClientProxiedBy: TYCP286CA0176.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA0PR12MB9010:EE_
X-MS-Office365-Filtering-Correlation-Id: 18c503f3-34b3-4fd3-33f1-08de7791f737
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|10070799003; 
X-Microsoft-Antispam-Message-Info: BVIctgIHLM9b55JzsXRI9vFlGJU+bvF6aVKWxpIjQ9UTgLXp7vpJsW/dDIRBzvye4F8X7jv4uhippvTuxOjBENIUuZ3yYKYia2Y0DhWPHfNl+8i6yVFc5r9uf36UcNJTConsG/byocsKCWMdDoLZe/p4u29S5N4Q5Varl2IYShQPqDrREIbDLtqZuKoPtmQAfE2r3PP6UMiSyK1rLPfyhOIfcLfEcWID448ngYyEduOjbrjZM3653nH+o2GIeM81CqSg5tJyCdbKYe2ExvgcvvX95UnoyiS8yTc4KSTZ3Lt85if8Bphw6u/HFiOxPRJHmxuHcG5yEkaab2lW+TSaW3xw4P/c92mlwRlpFVI8UK0sPxUXfzT3cMx/g3VevXEiDsWETlC74Sd2LZnglJGzVJMRFJ2+6n5KHHL1O/nwk1PTGJXp6kmN+tOdTOKZk02ibrbboXpzsFGF1sX4O6sb3743eCeAv2WlpKBr9v/NFk0BmalzDrPlD84PRPoacg/jIb9gFfrnWOuNTxjOvOKSsAOBTpBj58kCDnxHjc8051xwSOixlmc+Iq1R6v+xvCfrC3Syjg0jygahbAljRGbtwOl1SKJz+hlhO0x6/xIQNfuffkaRfSjMIXAFvDwbHsqtly1PepYeI/dAHQVbic6oZEYY7d5bpEdo49nygHL7f4iQtdVLRa7dBV12fvuQDGEUFmZm36xdFJcmAiWb4qDWTb8vwDhcZYBf5BFU0I6tj6k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y1ZYZWlYRE1iY1hnNkcvOHVKMkplakpNN1dJN1VkWkxrTUFXRFp2WWFzNmly?=
 =?utf-8?B?bElIeis4a3hpdXBmTHpLVVZoWEVNWG04Qk01UjJkSFhCWkhLKzc5RlIvTWJR?=
 =?utf-8?B?cUlDRDZnWDl0eml5ZkR1eHhGd1JocDlZaS91R3VKbmw0bEZ4QjE3emdBQlZO?=
 =?utf-8?B?Q3c3U3JjOXdNck91endNcC80QkU1WTN3UTg3WWxBTFRiYnJ3M1QvOWt1SUdE?=
 =?utf-8?B?SzBpQ0hqNlBDVmdIdTdJZU1rN0k1MkxMcXdreW1Za2gzWU0rYVlXTytRSkQ4?=
 =?utf-8?B?N1pYUFA4MlhjV1BiWm1kYmFqbllGTDE2ekNOZVlvSFhGQkoxQXk5ZU5GMkJE?=
 =?utf-8?B?UW8remtxWkg0L0d1d1h1ZmVGMW54dXBSVXZaaVdyL3J0aXZYdU9aeW1yUHZI?=
 =?utf-8?B?K3lsRDFOUndMbVMwTFkzakdndDJrNXhBZDRsRHgrZ1dIdHc4Nmw1Ty91Umxt?=
 =?utf-8?B?Uk9qRkwrNThwYy9CN0VIZlY4ZytaZ2pUWmZkOG9MUmh4RHFacUxudVcvSmUw?=
 =?utf-8?B?eHY3N2hWQTNucTNuTy9zM2lRT2hwaDhZb0xobW9kdlhwc081aVFnMXZHU2ZV?=
 =?utf-8?B?TzV5R0NoNFYzTUtSV3FzMzZyaEJkclU0OE1Dcm83dldDKzUzV0RmQlVNVmZ3?=
 =?utf-8?B?T0hidHJURkptOEFnMnlQTlZNUTdsV0pRcG1GL2FrYVBBRWlMamRiYjNLS1NJ?=
 =?utf-8?B?MnhaUjB3c29Vd3FtbFZmRmJYLzUzSFRReDJMMlRlUW9seTQ0V010UmNzSmxq?=
 =?utf-8?B?aE1nMEZUMUVsZHVycW9ZVzZHdXdBWkVtRDd3ems4QVlMc2szYmQvNVJZYWg5?=
 =?utf-8?B?RThSRlo0bWkrdFp3SGxLdE8xMEp4Zmg4UkFEYjF2MHlJY05GekRmMWY0emhG?=
 =?utf-8?B?U2dVa1BLNFJyR1hlVWF3UTlSNjNuaFg3bzhCekpDdUYwdnE4bGNCYmRrT244?=
 =?utf-8?B?VXVKMUJ6QkJST2k4cXViK1RmT0w4R09tZzBpUmZYOVMwa1hKVVZFdy9PQjAy?=
 =?utf-8?B?MzZYQlYrNmxGWmxjNElWYWNDZGU0dkkxa1lUSURWWE8xOUpVd3NqRVVnQVU5?=
 =?utf-8?B?TmxJdG8zZ0xzdm10TEVpV1ArMzlCWGo0WDhkVStKVlF6TU4zZCsvRTNvVTJu?=
 =?utf-8?B?VUdTcWhKMmxXWkpuZ0VWRVJTM0ZnSVdmUDM2RHZSUStPbFhJWDh0dXNkRTRH?=
 =?utf-8?B?QWlUWHFrQ2RCUWlMU25oaGg1NWpzZ0VOVUNBR3VwSU0zdTJ6eG80L21yYnhR?=
 =?utf-8?B?aFVteGJqV2dmdVJacjlCazkyNkM0TFhsM3RZbkpZdHM4MUlwaVRnQnk4Y1N2?=
 =?utf-8?B?SlBRVFJLYmJWVlc4NGJZL3VvTVFVY1BTNE5pYjdaK2dUc080RkZNMEVZclVV?=
 =?utf-8?B?TmdncUVycG9QMGpVdTI4YmI2OWN1bGxLSDd2eDNYYWJiVkMzTU5FbjFiaFds?=
 =?utf-8?B?UW9QVTVOM3dXTGFBZ05ZMzBTODJOY25PejM4Sk5UNUplM1hBRzE1M0lsUUds?=
 =?utf-8?B?NlVrU2VvY2xVc1YxYitNMDNsMWtGVi9Oc1ZTUU5mS2o1cVVmcm9FYjduTWZT?=
 =?utf-8?B?aTluSWs4ZjFWOWpyVEVxTWNwcEZVZ1B1WGN6TEpHRVMzRXRxQ0J4aEs1VlJT?=
 =?utf-8?B?UldSZHQ1V0M1VER4MmxrVDkrbENuUjJlY3pkNXk2NjlCYStRSEEraXkrSlIw?=
 =?utf-8?B?YU90K2xiS2YrNGUvamR1SmhidTFZMTMrOWRaa1NiOTNObVgyVVJ3S2JkMHNT?=
 =?utf-8?B?K1NEREsvd29kZGgwU3Q4eHhqY3pGSnYvUUZUNWZ2cFA1MkJIOHNhQVFUVnBN?=
 =?utf-8?B?NU0xbWI2b283Y0NvTFlzdnc5TFBob2N6QlZVWCtmRDlUSTAxSHRjV05zRjVv?=
 =?utf-8?B?QmxYbmtpTGlBRnhibGJJTVAvK2tEWHhZUHFaOFJYOWd2RG90MDRCN3BQSm40?=
 =?utf-8?B?VHlvRDZka1BDNGw1S2pjNjhEdWFQZWxzRitnblE1blRkREJBSVpaZ2haZlhT?=
 =?utf-8?B?SmtCN2M4OWJnNUowU2t1S1kwY1YrbTdVQnJBVlJyNGh4bGJkM3AvbDhoVHIv?=
 =?utf-8?B?TU9CWHJkSXdOMzZOTmVqV09zUm56NUZtYUNBL1pEVXVkeW9mR3pSdUFENTZN?=
 =?utf-8?B?ZCtLWmVFU3hHL0VucHVOci9nTnJ5dGFCcUdFR3JGekNqY2NKL3haZVpMTlRH?=
 =?utf-8?B?OTRSbDkzUXEybCtUTVpnQTFXMWU4SlpST29wL1pZbTJuaFdOd3VodzV3Zlla?=
 =?utf-8?B?UTVMcnFoYThnWHVGdGFHbXN4R0NZbzdTeGN1V0o5Z0x0bGxMUlBhbDF4cnVY?=
 =?utf-8?B?NUs0SHEyK201cEtVOExmNTJ0cHg5TGF6eXBWMW1zQ0ZiSTZ0a05URk9xNThT?=
 =?utf-8?Q?lc9hhgtmFjdpNYVpzhkiWxV27l7yST8wkYYh90OWXByBP?=
X-MS-Exchange-AntiSpam-MessageData-1: mJHfwKYVfBlOlg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18c503f3-34b3-4fd3-33f1-08de7791f737
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2026 12:56:33.7750 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GrsTA4RK6nYCZX2TqyENznuJDOXVtqwsjWz2vHI2tq2o36basnKvRGaxrc7m5cf5eXEZI4JnBxmGZOoouxs2dQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB9010
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,redhat.com,collabora.com,linux.intel.com,lists.freedesktop.org,nvidia.com,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,gmail.com,weathered-steel.dev,joelfernandes.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,Nvidia.com:dkim,nvidia.com:mid]
X-Rspamd-Queue-Id: B44C71CFB86
X-Rspamd-Action: no action

On Wed Feb 25, 2026 at 7:53 AM JST, Joel Fernandes wrote:
<snip>
> @@ -295,18 +309,42 @@ pub(crate) fn new<'a>(
> =20
>              sec2_falcon: Falcon::new(pdev.as_ref(), spec.chipset)?,
> =20
> -            // Create GPU memory manager owning memory management resour=
ces.
> -            // This will be initialized with the usable VRAM region from=
 GSP in a later
> -            // patch. For now, we use a placeholder of 1MB.
> -            mm <- GpuMm::new(devres_bar.clone(), GpuBuddyParams {
> -                base_offset_bytes: 0,
> -                physical_memory_size_bytes: SZ_1M as u64,
> -                chunk_size_bytes: SZ_4K as u64,
> -            })?,
> -
>              gsp <- Gsp::new(pdev),
> =20
> -            gsp_static_info: { gsp.boot(pdev, bar, spec.chipset, gsp_fal=
con, sec2_falcon)?.0 },
> +            // Boot GSP and extract usable VRAM region for buddy allocat=
or.
> +            gsp_static_info: {
> +                let (info, fb_layout) =3D gsp.boot(pdev, bar, spec.chips=
et, gsp_falcon, sec2_falcon)?;
> +
> +                let usable_vram =3D fb_layout.usable_vram.as_ref().ok_or=
_else(|| {
> +                    dev_err!(pdev.as_ref(), "No usable FB regions found =
from GSP\n");
> +                    ENODEV
> +                })?;

The chain through which we obtain `usable_vram` is very inefficient and
much more complex than it needs to be.

`fb_layout` is used as a transport for `usable_vram`, but `usable_vram`
is the only member of it that we ever use. In that case, why not return
`usable_vram` directly?

This is all the better as `usable_vram` is added as an `Option` in
`FbLayout`, not because `None` is a valid state but because `FbLayout`
is already constructed by the time we obtain `usable_vram`. So `None` is
just a value that tells the caller "please return an error". Now we can
remove the option altogether, drop patch 5, and have `boot` return the
error for us if `usable_vram` cannot be obtained.

But let's not stop here. `usable_vram` is first obtained as part of the
`GetGspStaticInfo` reply. It starts its life as `(u64, u64)` before
being morphed into a `Range<u64>` when stored in `FbLayout`. Since its
tuple state is never useful, let's store it as a `Range<u64>` in
`GetGspStaticInfoReply` to begin with and, since we cannot continue
without it anyway, let's make `commands::get_gsp_info()` fail if it
cannot build it. That way we don't even need to store it as an `Option`.

And now, since `boot` already returns the `GetGspStaticInfoReply`, we
can directly access it just by making `usable_vram` public - no need for
`boot` to return a tuple anymore.

Once you have that, something interesting happens: you don't need to
change the `gsp_static_info` arm at all in this patch. All the new code
can be moved to the `mm` arm, which is where it is actually useful
anyway.

The subsequent patches that make use of `boot_params` in other arms can
also access the exact same data using `gsp_static_info`:

- `bar1_pde_base` is also accessible from `gsp_static_info` (let's also
  make it public instead of adding an accessor method),
- The other `boot_params` used to build the `GpuMM` can be reconstructed
  from `usable_vram`.

Which means `boot_params` and `BootParams` can be removed (and the
`Cell` import), and we have something simpler and more direct that takes
~60 less LoCs.

In other words, this arm remains as it was:

    gsp_static_info: gsp.boot(pdev, bar, spec.chipset, gsp_falcon, sec2_fal=
con)?,


> +            // Create GPU memory manager owning memory management resour=
ces.
> +            // Uses the usable VRAM region from GSP for buddy allocator.
> +            mm <- {

this arm can now be:

    let usable_vram =3D &gsp_static_info.usable_fb_region;

    dev_info!(
        pdev.as_ref(),
        "Using FB region: {:#x}..{:#x}\n",
        usable_vram.start,
        usable_vram.end
    );

    GpuMm::new(devres_bar.clone(), GpuBuddyParams {
        base_offset_bytes: usable_vram.start,
        physical_memory_size_bytes: usable_vram.end - usable_vram.start,
        chunk_size_bytes: SZ_4K.into_safe_cast(),
    })?

> +                let params =3D boot_params.get();
> +                GpuMm::new(devres_bar.clone(), GpuBuddyParams {
> +                    base_offset_bytes: params.usable_vram_start,
> +                    physical_memory_size_bytes: params.usable_vram_size,
> +                    chunk_size_bytes: SZ_4K.into_safe_cast(),
> +                })?
> +            },
> =20
>              bar: devres_bar,
>          })
> diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gs=
p/boot.rs
> index 7a4a0c759267..bc4446282613 100644
> --- a/drivers/gpu/nova-core/gsp/boot.rs
> +++ b/drivers/gpu/nova-core/gsp/boot.rs
> @@ -150,7 +150,7 @@ pub(crate) fn boot(
> =20
>          let gsp_fw =3D KBox::pin_init(GspFirmware::new(dev, chipset, FIR=
MWARE_VERSION), GFP_KERNEL)?;
> =20
> -        let fb_layout =3D FbLayout::new(chipset, bar, &gsp_fw)?;
> +        let mut fb_layout =3D FbLayout::new(chipset, bar, &gsp_fw)?;
>          dev_dbg!(dev, "{:#x?}\n", fb_layout);
> =20
>          Self::run_fwsec_frts(dev, gsp_falcon, bar, &bios, &fb_layout)?;
> @@ -252,6 +252,11 @@ pub(crate) fn boot(
>              Err(e) =3D> dev_warn!(pdev.as_ref(), "GPU name unavailable: =
{:?}\n", e),
>          }
> =20
> +        // Populate usable VRAM from GSP response.
> +        if let Some((base, size)) =3D info.usable_fb_region() {
> +            fb_layout.set_usable_vram(base, size);
> +        }
> +

And this change is not needed anymore.


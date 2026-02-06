Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cD2THk5UhmlzMAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 21:51:26 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDE310340D
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 21:51:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8739D10E913;
	Fri,  6 Feb 2026 20:51:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="IeT0sdZ4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CWXP265CU009.outbound.protection.outlook.com
 (mail-ukwestazon11021139.outbound.protection.outlook.com [52.101.100.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C750A10E903;
 Fri,  6 Feb 2026 20:51:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kugdDm1GBI8r8WhU6q8TaGkA49wto2RKvG4BhmyISxLzXHsH4ksIN93kN8WaihveG9jYx9OCyVyRBVo1TTNpZybaQiXsmdvQCE94JOiLkRbWavzwArxN+4fIyz7nq9LB68qpJL5mhaQAgrnw6nE9Jo5pP9KG55p1Lk5BZzNHMEhzAAgIUZiI1956AjygrmUmIfQ367YrtUaFw1Ob71jspyKupegFr94nOZDSEt6d+GObvkWb9hBnwoPprsSzBxLUA9Z+PymsXKqSaXIXpJiqC/ImFYT6I3xKuSOM/WXKqt2ANAv/NSu7HblSfBkfkEaYKX3VQ+fwnz94V3fp4nQpUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CtXFXCQGYqyzQyHYKsjz5cDU5PIrAy1frCq2HdplxIg=;
 b=opC5sh0rfrX7H8CejLiJWYTJpUs59SJKn8OhtRsmDlfx3ZbSguS76rKtyGWspAC5C7wjCyED8EtJddqM2iDGKC80ZuQHSwJbZcJ4bxw3fieq/19yF9dT/U1eRmgMPZwjSiX+qz5sWQXTPNY9EmMllA+x+6M6qhEg8v0yAM9RfeBuFIG5IqiA/dktOG0uOZm+XtYd5SuSypVekRuRXO9KmtkxG36stf5pcct5Cg11Cg7e1HtrvPIetfLXqWSUjsDG3j3qwDI8WeTzFy3/J0Dwvk0XjIc7g/jGWCVChzD0GDd13zSK94lrPgVNQg4NLwTiiEIGGSzPnvzh1hdC0TGhFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CtXFXCQGYqyzQyHYKsjz5cDU5PIrAy1frCq2HdplxIg=;
 b=IeT0sdZ4hI/R8y688Ta15O86IV7O17r1wy5poGBIzHuh5u+MYJlW1xqlO9tcdw1Jx/ss3A+Uqig3T+3wLNC/g0ys1zJoTuU7GCTUauk4rilW+yb/ymgpuN8tIQhUwzDz83+5t/XYcONQGcRrSVZj02X9P/eZVUlW6SGkuhoJz4U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO0P265MB3321.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:187::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 20:51:16 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9564.016; Fri, 6 Feb 2026
 20:51:15 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Feb 2026 20:51:15 +0000
Message-Id: <DG86CJXCM7DB.1A4F4JTMSS9ZZ@garyguo.net>
Cc: <linux-kernel@vger.kernel.org>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Jonathan Corbet"
 <corbet@lwn.net>, "Alex Deucher" <alexander.deucher@amd.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, "Jani Nikula"
 <jani.nikula@linux.intel.com>, "Joonas Lahtinen"
 <joonas.lahtinen@linux.intel.com>, "Rodrigo Vivi" <rodrigo.vivi@intel.com>,
 "Tvrtko Ursulin" <tursulin@ursulin.net>, "Huang Rui" <ray.huang@amd.com>,
 "Matthew Auld" <matthew.auld@intel.com>, "Matthew Brost"
 <matthew.brost@intel.com>, "Lucas De Marchi" <lucas.demarchi@intel.com>,
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Helge Deller" <deller@gmx.de>, "Danilo Krummrich" <dakr@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Edwin Peer"
 <epeer@nvidia.com>, "Alexandre Courbot" <acourbot@nvidia.com>, "Andrea
 Righi" <arighi@nvidia.com>, "Andy Ritger" <aritger@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "Balbir Singh" <balbirs@nvidia.com>, "Philipp Stanner"
 <phasta@kernel.org>, "Elle Rhumsaa" <elle@weathered-steel.dev>,
 <joel@joelfernandes.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <linux-fbdev@vger.kernel.org>
Subject: Re: [PATCH -next v7 1/2] rust: clist: Add support to interface with
 C linked lists
From: "Gary Guo" <gary@garyguo.net>
To: "Joel Fernandes" <joelagnelf@nvidia.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>
X-Mailer: aerc 0.21.0
References: <20260206004110.1914814-1-joelagnelf@nvidia.com>
 <20260206004110.1914814-2-joelagnelf@nvidia.com>
 <73B64D35-6574-4776-962D-865465C40226@collabora.com>
 <8dde5b79-29d6-4840-be9a-31bc4af27cf9@nvidia.com>
In-Reply-To: <8dde5b79-29d6-4840-be9a-31bc4af27cf9@nvidia.com>
X-ClientProxiedBy: LO4P265CA0254.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37c::18) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO0P265MB3321:EE_
X-MS-Office365-Filtering-Correlation-Id: b7cf02bf-c7ed-414a-1bd4-08de65c17874
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QXN2d3U3d050YVJqYXV3Y2lSa0RoVHJvWWVxbnZYYW1oY3VNTitkNCtqczQ0?=
 =?utf-8?B?SlN2bGRoNDVCZDBaQ2UxUzdCZ2lIQzIzSEFiWmNobWx4RlJJSnBNeDVVNm81?=
 =?utf-8?B?bFVrZXJjZWpiZ094eHNIck80Z081RWV2L3ZxNi9NTzFxdEF4OGx3MFNCOUdC?=
 =?utf-8?B?MTQ4Y3YzSllCN2U4cENsdy90bUVjbnVMZkVvUlNPejNlclJCd0RDNm1nTFJT?=
 =?utf-8?B?VzVONXdQY0s0L2RjYUkwNDdDeDJJVnFXdmdYa2g4Tm41eG1GN2Mxa29xTE1S?=
 =?utf-8?B?bWQ4YSsvcWkxMVg0Z0U2VXZnRkc1Ynh0VFUzajNXTFVtSWxjS3V5MVl4VXNy?=
 =?utf-8?B?WlJBWGEyZGJ6bC9SbUxGa04xbUVuWE1hZXdLUW1IeGVGRFhSVFA3M2s0Z1Zr?=
 =?utf-8?B?cWxsL0I3eXhBTEIrR1l4V3dnajhoL1ZERnVVQVRkTkhXbzJpY2FIM2FpeWxD?=
 =?utf-8?B?ZXpFZVZRQXZKWEkyUHNSdUFaWEk4eEFucUpCLzdvWW5uQzQ4ckE1bjFtVHQ3?=
 =?utf-8?B?QStITGlXMlJLcXpFVVFKVUJLRlpGd0xlbXV6S2JWcGg4N1ZMSzFnTkpIcUlG?=
 =?utf-8?B?S1ZwS2pCYTExR0xXL3pZcnd3a3RzaUk3Y0FOMjVaK0Q2VENHaW9qQVFzR1g3?=
 =?utf-8?B?TlJZdFpSNC9CcXFCekJzS1kzbVJMNjVHOHh1aVR4QUlYdnBsRm5BaXNvT08w?=
 =?utf-8?B?cWxiQ1VJa2huNTBQSDV3ekRyd20vRmdEaSsrZ0VwclREOTMwazMyODdJa3Fh?=
 =?utf-8?B?cUovL204Yk9IY0JFKzV1T1pHUnNXUzQwN1VreVFxUEcvRE4wUEt2c2Fqc1ly?=
 =?utf-8?B?UmFlTDJMQ1hiNXhZbGQyT0JGaEM2alg2ZWcxSU9VVFExa1QzQnRjRHZLc0JV?=
 =?utf-8?B?L3plbDJoQjZHbE9hb1crTWMybHpaSWxLOWVGNUpzakNrSUxZTkFhRTArR0Jj?=
 =?utf-8?B?V0paMWQzZlNTR0dWckVRaHJaR1l5cWZNbDg0WmJOUW8wZkV5UUdoa0xlVHhl?=
 =?utf-8?B?dFAwVzJyeVZNTERWRWlYZ0pMa09YcHV3clNCRENzZWRRKys3d2xucFhSSThw?=
 =?utf-8?B?ZVFyd2NYZXIvNU1mRlUydlI5ZGRVcUg1T0NaeW1LTG1nZlF1QzI4NjN1OG11?=
 =?utf-8?B?Y0gzMHFmMVY0Z29RODYzS09QR2tKSlJMWjBOemd6dHZrWGdOaW16QVRHVlNK?=
 =?utf-8?B?RXdwY0NrZWZpTjA2VDd4NytsWTNVSjJ4aThCMmE1ZjgwelFOUTlQY3R1MVFp?=
 =?utf-8?B?R0xsTkdxaXZ0TE1LdWxlTlBWMldtOFRqL2c4TXZzamgxbjBtL3J6UER6VUds?=
 =?utf-8?B?akl2YTV5Z1VXUU5ZYnArUzFJT01VZXh0NXc0dzlad3ZOVXFVYVBnT3pOSkww?=
 =?utf-8?B?U0tveUVMUWRHaUJDaGtvVFJPM3hBN3lVeFJ5OURoRDg1eWRHNE5TQ20zYmdj?=
 =?utf-8?B?OWxWY1JqamRnOEMxWS9yMkdKaS9sU0cyNTZsbDVpcUF1L1BKOTNmbjV0dUp3?=
 =?utf-8?B?YUkvSUxHQngyUXdNaHo5U2xRR0U4NUZpaHRaZjVBODVRZmloS3c5VmI2Tk5D?=
 =?utf-8?B?RGdDNmpRMkdwWUYxQ1VlY2VYMy9xM1EzMnJPZVI1MFlVRlBiT21TMkNHUGxG?=
 =?utf-8?B?QXliblpXZE80RHFTbWIrcDI0elBuakhEekJXeFF6Z2FKQ1pUZTNXY250alZw?=
 =?utf-8?B?RXRCTThsaGRCRU1XY2diV3BoUzl6WUJHZHJmZGFJSUZlZEpqMENkYnl3eGpJ?=
 =?utf-8?B?cmd4UmhGYTltNGFyVDJXZ29pckpXaWpEendnQ3BBdnRVZlYvQ3J0ckZaVE14?=
 =?utf-8?B?UzFkS24xM01CTW92bFJ5c2tKNTQ4c1hYQVB5RFJ0VVk2RkRiSjg3YXI3MHBO?=
 =?utf-8?B?ODgwam1uK3g0eExHallQN0VRekdxV25ZODhMSitxWDRVR253eloza1Nhcytr?=
 =?utf-8?B?bmVuaTU5VUViYWRLSExRTlZXKzZMQ1BlWE5Zdm5DUDBHaGYvRmNVNjIxbzZP?=
 =?utf-8?B?WFYrOUliejd5ZzFrOHl5aWNFV1FxU3FiUXpEVFovaXV5QzdUQTQvV1c3RmhP?=
 =?utf-8?B?a1ovK1dyVnFzTk12dzkxdHhEQlFtd0oxeDMvdXc1clBBbFJLbHFXM2RYTjZZ?=
 =?utf-8?Q?MLJI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VFY1enVBT0JsVGExZ3ZIWmRtRFJrTVJCK0pER2V2N0ExcFVYeldHaU1QN3Ew?=
 =?utf-8?B?TGhvdjM1TUY4Tk1lZ2ZLV1RWeGluNjZUMnVWSG9GSXMzMGlOdU9NaGI3c1FF?=
 =?utf-8?B?T0JwTi9nQnR2REFhekhXcHQrMERWd0QvMFNha1FaeEMyZjhyc1JvYTlhNlln?=
 =?utf-8?B?Ti9nVWpKWFNkQnhKblBNNjJ2ZFl4eklpSFh6L2tSemozWWtHZk1sWDNrbGVB?=
 =?utf-8?B?aHp0TG9oWWRiRjZKaFRIc2lONHJnTTV2SXRKZ2swcmcvWjdKZEVIV2lXNHBp?=
 =?utf-8?B?cWxpUUQ0WkwxbDl0SCtYZlBTbzM3U0IrMktwK0EwWFIrTHBxaXFGNjYzVWVX?=
 =?utf-8?B?dHFlbEdkVFlsNlFsejVCZit3NHVsaytndzd3d1EzYmhLR0pNaDI1ZWo2QjdM?=
 =?utf-8?B?Qnl6UjZtRko2a2YyRG0rZnJLcmRkZzlGaThEV1ZqMEFtZHcxaDE0MmIwOTND?=
 =?utf-8?B?cHlmTXRxeDI1VzdsVWhSeDF4cXRJaXdUd0xHV1hyWSs3M1dGUkY2aGJvRWJu?=
 =?utf-8?B?dGF5bmxEL2Q4Uy9ISmZQUS95SEZiV2ZVZnNGdU9HV2lTMENpZXFjL3c1K2Rn?=
 =?utf-8?B?U1ZUd1krL3dZcXlybE5ET2RSSlVqaXF4ajE0RFZndlNHREFUajNEMi9veEt3?=
 =?utf-8?B?dktnRXpDSHA3OHMvdGlrbGExZHRJTmJ3blI4RnIwUW4rRDFEMjVtL252bGtl?=
 =?utf-8?B?M2lTUVFVN0VuZE5lNjNjUkg2UUtmS0F3WjNTd3prQ29UY01vanVQZHQ0Vmpi?=
 =?utf-8?B?TDNaK2wraHhPaUdwd3MzTXh4bzVROXgzTVFyOXJlaGwwdkE0UkoxWkZkamRK?=
 =?utf-8?B?TXlSY0h6R3dreGhVdVlhYzdyLzZGMTVtbkR0UEZhM1VNU01FN1E1REFaZ3F5?=
 =?utf-8?B?VmNOVlZoMjdkM2Q2Q2pidUVDQUMvN0k3T05mN3hIeXhmRzJ6TnBVdkEyTXla?=
 =?utf-8?B?WnNpNXcxOGRtY2dBODBGQlJteUs1REI5dGErZ1A3S1FvU09OS290ek90QW41?=
 =?utf-8?B?L1Bpb0Vhdlk1YnhHeGJjbFExM0J5bko1SjJyb3lxZlBFYU9lSG94Wkdoc01m?=
 =?utf-8?B?N0o4MVFGRFhKc2pUWk9nNEQ0Skh4R2I5Y0JsaWR5VUx6VGsrbm40UkNaT29l?=
 =?utf-8?B?aTEzTVIxd0NmcmsvV1ZvUG9KVVpISk0vMVZmSHBESTBhT1phcVhlbU1WWGVM?=
 =?utf-8?B?WW12UDJiSnFXaERMeWV4Tk9OUjhzdnhuelBaZGFPWFNvMERDTWpsRjlvOWMv?=
 =?utf-8?B?ek5yOHdZODJLQ2lKZVFKN0NQbmM0Zk00c21UaWNqY2tKTzIyNGhsbHhzSTk1?=
 =?utf-8?B?b0UzRFpWME5WWDhVSjBpVWNnbGMyNWdwQWJqRXIyNUpiaWZMUWFBekV2eU93?=
 =?utf-8?B?SDgrNDB6VGMrY3VsQWtkOWxWZEF3TzZQb05iQTJrZnAwY3pnVTd1UHlpZnl0?=
 =?utf-8?B?Tk9KN0lQbGEwVVJQRW1MNGRuZ0c0WU1uRjA2cU1iSFNSei9kZ1ViZjlDLy9Y?=
 =?utf-8?B?VHY5WDNOa2QrMXphalE5ZzU5ck5TVmlEU3VqaGt3K21GVHBqVUIrM2ltRGVV?=
 =?utf-8?B?NGlBamxEN1ZGREl2c3YrQXNDb3VSOElUbnBTeXZkQnNhdjZPLzhKMk5kNW5B?=
 =?utf-8?B?L0dhc1VLZjY0cXU5Q29acE9UVjVjM1NmRXZ0TVZxemt0Z3Y4UWZrV2ErMFY3?=
 =?utf-8?B?VitaYmZnYkl2R0FNUGZRSVdQekZKZDhXTHJ5Qkl3RHh0V21tbEpCUE51MnZ4?=
 =?utf-8?B?TzdBN3k4K28vNEhqNHd0TlZQbkY2eGt5TkZmWjE4M003d2x4WUZSaEN0V0Ez?=
 =?utf-8?B?M01JTzNTSHNUV0RVYk9RNGQ3Z0NaY3NCMTcxSmNqdGNuL29OVjhITDc0cWRH?=
 =?utf-8?B?ZGNMMWprY09PWHVscmpTSkxuREcxbUhXY1BncDFnTUR1VXdtSnJnNFZBeTc3?=
 =?utf-8?B?Q3NVd2g1ZWhzTnpXZ3hVOGpNMUJRcjNkb2dhWUFMaUVsNm53eXphK3ZTVytZ?=
 =?utf-8?B?N0VaZmM2L09jVXd4d0NzZTArWnNsQURqZFljMGZaOHZvOUhpdkVTQm1FNk9v?=
 =?utf-8?B?ZXVJck5JeSt5UEVGUm02Ui9sbXVxZi9tV0haNFViaWVhbFBBcEJZQU5KeHAz?=
 =?utf-8?B?WHRzTitOVWY5akczdG5FNjJiVVptM1hVRTRrOWQ2WHFxK3FOZHY2bURwZDVl?=
 =?utf-8?B?U3M2Q09UOTJFczhYbkFjN1RJNG9nWFM1cWZDWlM2Z2dWTzdGRENqV0p2aVov?=
 =?utf-8?B?TDJlVE5QdFRFcDRTb3RaV0l6dkRxeThZU1AzejY0VlV0RzY0eUp2Vnh3eVNq?=
 =?utf-8?Q?j27IkE2udVoR7jxZv0?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: b7cf02bf-c7ed-414a-1bd4-08de65c17874
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 20:51:15.9078 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jkMdDd7Uef+4WUboQ+dY75H2u8bju+vJGdph6N08S3h+g7dcROxei3PsFMTDDivkQPSnDOfJAwj+CUCmlHlWbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB3321
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
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,garyguo.net,protonmail.com,umich.edu,nvidia.com,weathered-steel.dev,joelfernandes.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[51];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[garyguo.net:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 1DDE310340D
X-Rspamd-Action: no action

On Fri Feb 6, 2026 at 8:46 PM GMT, Joel Fernandes wrote:
> On 2/6/2026 12:49 PM, Daniel Almeida wrote:
>>> +#[repr(transparent)]
>>> +pub(crate) struct CList<T, const OFFSET: usize>(CListHead, PhantomData=
<T>);
>>> +
>>> +impl<T, const OFFSET: usize> CList<T, OFFSET> {
>>> +    /// Create a typed [`CList`] reference from a raw sentinel `list_h=
ead` pointer.
>>> +    ///
>>> +    /// # Safety
>>> +    ///
>>> +    /// - `ptr` must be a valid pointer to an allocated and initialize=
d `list_head` structure
>>> +    ///   representing a list sentinel.
>>> +    /// - `ptr` must remain valid and unmodified for the lifetime `'a`=
.
>>> +    /// - The list must contain items where the `list_head` field is a=
t byte offset `OFFSET`.
>>> +    /// - `T` must be `#[repr(transparent)]` over the C struct.
>>> +    #[inline]
>>> +    pub(crate) unsafe fn from_raw<'a>(ptr: *mut bindings::list_head) -=
> &'a Self {
>>> +        // SAFETY:
>>> +        // - [`CList`] has same layout as [`CListHead`] due to repr(tr=
ansparent).
>>> +        // - Caller guarantees `ptr` is a valid, sentinel `list_head` =
object.
>>> +        unsafe { &*ptr.cast() }
>>> +    }
>>> +
>>> +    /// Check if the list is empty.
>>> +    #[inline]
>>> +    #[expect(dead_code)]
>>> +    pub(crate) fn is_empty(&self) -> bool {
>>
>> Why can=E2=80=99t this be pub?
>
> I believe this was suggested by Gary. See the other thread where we are
> discussing it (with Gary and Danilo) and let us discuss there.

I suggested the module to be `pub(crate)`. For the individual item it is no=
t
necessary if the module itself already have limited visibility.

Best,
Gary

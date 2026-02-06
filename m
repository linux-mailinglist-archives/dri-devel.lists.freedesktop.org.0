Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yNtXE+wihmklKAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 18:20:44 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D845E100E3C
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 18:20:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EDF210E850;
	Fri,  6 Feb 2026 17:20:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="UgA80g/y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CWXP265CU010.outbound.protection.outlook.com
 (mail-ukwestazon11022113.outbound.protection.outlook.com [52.101.101.113])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24A1C10E078;
 Fri,  6 Feb 2026 17:20:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cfdPPuOCWWxV64UgH0Cc+NRvRqVIAPrThtrvGs0wuWxSi5cdXdYMt6G5q3xyA+UzMOJDfVZx/9hWgJOVXAwRYutEU1qP+CU8MfKiViBiS2k2oDix0lVImCJ4mgsLdXDr5hurHbiDjV8Afc/vUYmupEmjljXJMMbZhRG0zixk3O7GOY220Btt38rKOcapPCoi985vcim3MXVuTZoZzO60kL8nkmL87iT3L8yPCEQcwdKvq4QFIqPkFLnkrxrUFdv8QM+lV7ySKNJxa92Jtjfm8BDPLvpd9pzEEFB8HbDcr9FTnDGKjTN8cSLCcIC5UQL2N8PX1tsvdy674GPb+GNt6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D+Z0qNiVuffg5bHOz+9wWg6RDAkAt+lQnhLfOJ++Q6M=;
 b=azN8drTMOioCGmDFuoP6/nIx2UXs/i/cHfZFiFgLCTi8J/VWDBBJ2yOTq7ZpfKcyZVaCaLkV5oariN6v/dWwSFTo1pKEElWiYD2i5jfcKNBnlzjR4gCan2oeLOI5OzDzokYkgAZl/h5uz3qA5+hRY4nIuYc8o+ext55zVHct0PsAwKSDKlkjyJii5on4vzlG6E/9wGSlQN84isJJiOPVLsJr/lRGJTrnHw/uROWrZSAjjFuxWWUiCXi1IR5ypd2pkzCaL64dGEPP213LD5e2rM7+4DeEHb95YHRzulMiKD6QenBK1XOu16aysWyIhO3l6pRMMaKkyo34z5oV3OZ34Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D+Z0qNiVuffg5bHOz+9wWg6RDAkAt+lQnhLfOJ++Q6M=;
 b=UgA80g/ya/mfFAIteo5gJ/mWq2j7932Nt5R+JUiPM3sDGBaBz/ERju+PGyMCmHefHHKNo+eapLpkBxb6MtXJDKDErUJwnB5Uge+Z/eszDCxdmnfU7TY5pw5VW+6fFFieKSaNXGim5LUBaU2TcAy3pDqUYp9CQNNBcz5piROhQ40=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB2357.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:79::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Fri, 6 Feb
 2026 17:20:34 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9564.016; Fri, 6 Feb 2026
 17:20:34 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Feb 2026 17:20:33 +0000
Message-Id: <DG81V8NG5RC7.38EYLHQZXKTTO@garyguo.net>
To: "Danilo Krummrich" <dakr@kernel.org>, "Gary Guo" <gary@garyguo.net>
Cc: "Joel Fernandes" <joelagnelf@nvidia.com>,
 <linux-kernel@vger.kernel.org>, "Maarten Lankhorst"
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
 "Helge Deller" <deller@gmx.de>, "Alice Ryhl" <aliceryhl@google.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>,
 "Boqun Feng" <boqun.feng@gmail.com>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Edwin Peer"
 <epeer@nvidia.com>, "Alexandre Courbot" <acourbot@nvidia.com>, "Andrea
 Righi" <arighi@nvidia.com>, "Andy Ritger" <aritger@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "Balbir Singh" <balbirs@nvidia.com>, "Philipp Stanner"
 <phasta@kernel.org>, "Elle Rhumsaa" <elle@weathered-steel.dev>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, <joel@joelfernandes.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <amd-gfx@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <linux-fbdev@vger.kernel.org>
Subject: Re: [PATCH -next v7 1/2] rust: clist: Add support to interface with
 C linked lists
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260206004110.1914814-1-joelagnelf@nvidia.com>
 <20260206004110.1914814-2-joelagnelf@nvidia.com>
 <DG7ZF1UT98RQ.3F42J3ULGV2OC@garyguo.net>
 <DG800TDA6OXQ.275PMMS19F1EX@kernel.org>
 <77ac3274-a962-469d-a2f6-6ccc0670988a@nvidia.com>
 <DG80FV3VTT6P.2ZP18EM8605GT@garyguo.net>
 <DG81PJ9QD8FC.2NF6VEKDD3F2Q@kernel.org>
In-Reply-To: <DG81PJ9QD8FC.2NF6VEKDD3F2Q@kernel.org>
X-ClientProxiedBy: LO6P265CA0030.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ff::20) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB2357:EE_
X-MS-Office365-Filtering-Correlation-Id: 690045bc-0cb4-4942-4f85-08de65a409ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eGU4VXUvWDlwaU1YMWZtOTFCa3J0YzFZSGJIUWhjaWErck1QamN4VjFQaFZi?=
 =?utf-8?B?UVlMMk0rNExWcHUyMlM3N1VRYUdqZGZ3aFJXcGMzcWh0dFIxZzVnUGdlcFpw?=
 =?utf-8?B?VGIwaFpqR0pGc28vbkZDQVlyMXhlSHErc2lpZHg3a2F4Q3R1Vy9YbHRaZDhP?=
 =?utf-8?B?bEgrQVBmdzZhN0JtUU14YWFqdnc3QW03SEtTaDNuNW85VGJkOEo2QTJsUDVC?=
 =?utf-8?B?OGtDWnJmMXdmRXEvQzZCUjJwdTBkOXBrQjQ3bEY4TytVTHBuTnlScHdzSDlR?=
 =?utf-8?B?Q3RmWFdOYVBMZTZXRXp3QUQ1cys0MnBGdEF4WGEzVE9RaTlab1kxWmM0Qjht?=
 =?utf-8?B?SGtKT3N4NmVjY0IzdFFpY2RKUTE3U2FSamZpSUhiQnhqSit5Mnd1VjlLd3dX?=
 =?utf-8?B?Y3FVV1ZIcWlVVkZESjhDZkJhK2YzVHRpME4zSjVzZUZIMUx2SkhmKzJOYzZh?=
 =?utf-8?B?WG9LL29POGZ4RXpKYWZ3ZFhFb3kzdC8yaXRrWlBXRlR6bjR0V05uV2VlNjNX?=
 =?utf-8?B?TGFLUnF3Q0xXNTVCUWhFbFN5UW1uZi9rejhHWUZyUmdkZnF5dDBZSXV1eTdp?=
 =?utf-8?B?UG1EcFV5VXBMU0FkZWRsS0Jyd2tDVTJ4MWtFTDg4U2hFOEpyNG5xVTJQcS9u?=
 =?utf-8?B?R2xRUDdleHYyNHVRckoySU9LcmlWUWhDQXg1Z09xRWlXMWRGS1dGRzdlbXQr?=
 =?utf-8?B?emtRYkRsaGE4ZCtSdHFPMElpaElyeDRGckx3RXhBRlhhaDdRSk1PeS9Od0ZS?=
 =?utf-8?B?dWdFVFNuZ282VWtSaTIxRC9iMDVaamtqbFpteWJoRFZXam94RW9nQzM0YTJK?=
 =?utf-8?B?THN5L1ZBUUtBTjZvMFBrOEh4M3lIQUFIOWZQbFlaOEpsYmUwcWIvY0JBVzY5?=
 =?utf-8?B?eHJ2SFhJRGkwUVhmNTE5eEd5ZFBhai9KbnlETm1YWlpPbERtNDFqNm13cTJV?=
 =?utf-8?B?TWVwc2xRQ0ZybmhtclFQY2RCcFphZTJPUmg1U2srL3lqTG1QRzJPTTlpK00z?=
 =?utf-8?B?ZEZ3aFlyWkhzY3ErUDBGS1lLOE9OMWVPVjA0K3BJQWFHY2VNZXpUVld3dThy?=
 =?utf-8?B?aGhMbWxVUlJPa0dqbVdjck9NcjUxMlZnRXRaZUVENGZwbnh0VXNvWWVzRWVC?=
 =?utf-8?B?RjJ0d0NKVGxROS82VGgrM3pFWEY3K2xna2t2QUJiajVMNTZ4UUVxS1ZYSFhl?=
 =?utf-8?B?STl5QjZocnFtRG5FZTJ6WnJ5TnZ0cERRSmhlalRkMDFQRGhoS3VuTkl6UzJz?=
 =?utf-8?B?WkF1ckNTVHMyNE96OWdidXh0RkRuTnNYelRKWWhqN0FMOGIyTjIwYUIxYXZI?=
 =?utf-8?B?U2Y2OG52cFZqU1crRC9XMk1hVlB5WkJHNVZqbkVtYnZBNzZJVllZN2RmNHMw?=
 =?utf-8?B?bENNOFhqazJlempoVy90L3Q3MG56SjF0TXp2eHRxMThhUERNU3lkZWFvc05N?=
 =?utf-8?B?WHBpS2swN1VyL0ltd2dTQytxUmZXZmNTMTRmbVJXNEM5MkNFRVhlRXpDc20y?=
 =?utf-8?B?b0w3Wks1UUZoZUx1U0VyN1d3b1owM1BZQmpiNXhNaTlzZkJEZmNNdExDY0pV?=
 =?utf-8?B?UE4vSXdiZjF2MG5mTldSQ2hYVHRLdG5iUmNhTkVKZzg2cnQrSWl0Y1BKRGs1?=
 =?utf-8?B?YzFQb1dZbzlOaElqQlVuUnpraFJURHdKYnlWMlU5YmNOejNRMm9iM1hsTms5?=
 =?utf-8?B?UHZqd29zMnhUVWlUUW0waWpvamJuVWZvNHo1bmExTm9SKzhwU2VJVWczSTdQ?=
 =?utf-8?B?Y2x5V0hVL0ZMQW9MelFuZVA5ckJnS3Y0bVhIcjYyRFpyamVZV09ZVzRWeUxn?=
 =?utf-8?B?S0xoWnpTYlNHNmJsS2o4RElBaWdXRDBhUlZDYmJYZzJ0NEpSUUVib2lFaXRh?=
 =?utf-8?B?SjdkUFU3V2FlOHp4ZEVweXVidHhJVGVKYUg5Ymg1NjE3QjRabmFMRkxWUmVu?=
 =?utf-8?B?VE9IbFM5U0w2SlNweE40Wm5lYWQ0UUZNK1BjUURZZk9tS3lFWnB3RVVsOE9F?=
 =?utf-8?B?bGNESkUzd2tTNnZ2NGZEWEJVaUdRTFRoTVpxUEZkL1QwamR3QVJkZWh5VkVa?=
 =?utf-8?B?OGx3WENXcFVEYjlSbnF3TjFQQmVDSFJ2N0dCSFI0M0VTYTU2NXRxWnZlRlhl?=
 =?utf-8?Q?/UKU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YXExbzRUeEl6NFpRM0dXamxEZVNqTGV5aFZkdndBN0RPOGRPTm0ybVpDd0dV?=
 =?utf-8?B?cVJiTXhvQzJaTTFydHhENkZZNktKdVFBbW8yWnNYREMrNUxyczJzcklLSitj?=
 =?utf-8?B?ckhZZjdYWEhzNXEvaTRVd2ZmQ3VGQkRPemUzYW1PUXkyeXNzRzJUdDlHczBQ?=
 =?utf-8?B?RVlLdWlFZElRM3o1cjFYR1o5UmlCcHlueG5LWGdzRFhHd0lGdmcxS1ZnWDJr?=
 =?utf-8?B?RzUxUnh0V3A2MDl4aHBVN3BrN3dwZy94MjZ6SHRLSEs1WkJ1U0dHYUlJY1dw?=
 =?utf-8?B?VWVGV09YWkJxbU5tVXF2bDZEWHNaTnpDNDg4bXNxRU5MKzVHNmpYTWowdFYy?=
 =?utf-8?B?OVY4TnJzbmpWVjhtVFVjVXZOUEkvRG43TVk4cXR3SGdRZ2J4U1hVcXdEQjJI?=
 =?utf-8?B?OGRmbllVcUZpMmJVNjVPbEpwcE5JTDRKY2doeFBoRTR0MnVwWGpVRHFmVkk4?=
 =?utf-8?B?UXFNb2orMzBZRm9PcWFTeWdTL3ZkajdEblIreVlOSGhrTWtTWVNoUHBuQ2ZO?=
 =?utf-8?B?aHpiR2o1Vy8vampodzFRQlU3VDRTY29oSTl4VW9aY3BvVGkwR0RNRExDZjE0?=
 =?utf-8?B?RlFZbkZNT1VKOU5OY0tkNlNWSFNkTDVxYitoRDBub0FiZXo2djQ5YS9DQk1h?=
 =?utf-8?B?WGF0OGszRHo2K00rZElQcENWTnFJcWhZM2pRWmdMWXdMNlhDaGx6a2pma0ZI?=
 =?utf-8?B?NFk5aWJVdVN2ZVdVN244WkpiYmlPZGMyMHdqWjBteEswd21NdHJQME44MGE2?=
 =?utf-8?B?MnlkWGprYkRmUS9uWVN2MHpEeFZMcXUzN3QxaUtoa2QzbEx5TitHS1JOU3Zk?=
 =?utf-8?B?aTVicHREcEpYa09kckRDQW1YZXlqUWRqbEgrSjA2R2hDN0ZXNlJncTEwSTB2?=
 =?utf-8?B?UUlDZHBxbTJYbk5yblYzSml0VWEwTC9odE1xNUVFWWcyZU1sbmJvS0FSc1No?=
 =?utf-8?B?K0hpanRzV0NWR0hMUjVTRElNOHl0SnZoS0gxa0lmTmNkYzBrYy9KWlZlMmZX?=
 =?utf-8?B?TmF6aW9GKytRVzJWMW5oSjJKbDJKQW10Zm5hSzcvbDNGYS9qdUUxTTBHakZP?=
 =?utf-8?B?c3BsaUR1b1d3RU1qa20xQUsrdmdzbmpvMnkrSU05NXNuTTVYVGwzMjkrR25m?=
 =?utf-8?B?Ui9aRElGR2tsNXRGU0pwL3FRMmh6K25FZWlYWWx4eWlhRnREd2RucUJObThD?=
 =?utf-8?B?bm9oVDBvdEdoZzdQOWRWYXpxSVFwQ2NDN1ZpNENZNkZhNmlQT0trc1VpenJl?=
 =?utf-8?B?Tnhua1BQZzFzNlphWVhIeVI0bWl6TncwOWpwOUx6MjhvYWprS0lTWDl5aDFy?=
 =?utf-8?B?S09jeVhLSFFIanVmbEJmaUZsc3ptZFdXQkVWOHNSUXoxOGpaT0NMTGZuV3Y1?=
 =?utf-8?B?K2l5WkJwTHk5K3JRbUtYazE3LzRaaTBRQVp2bWdqNlQ5aktCRkxHTENTeU5G?=
 =?utf-8?B?TXF2bW1PUkQzM2NEb0ZOU1NQN25IV2Jiam9wVDFjcXlxaVF6RlVxeE9uczZn?=
 =?utf-8?B?RzE4UXBhbGhtOEFCdDdMcFJFN1NCTlNOa0N4eVF5clVJMkJMdTAwaDlsWWF3?=
 =?utf-8?B?cTJBK3diSE1DTXNmamNNcmpERzRRS2k1Nk1ldWw5ang1bWx1M3BTWlJtbkk0?=
 =?utf-8?B?aFNBclQ2bU0yaHhUd2JBNVQ1cisrTlNkQkNZdE9kb09VcHEwZzZJb1YvVkFG?=
 =?utf-8?B?NkIrOEFqdE14WkFCNXFhMVhPVmwybGZFa3VGaFdVMS8yMjBjb1lzWUZuaUZF?=
 =?utf-8?B?UmkwejhDRjNDeEt4cTFGR3doWk9wVjE3THVjN3lwaVdyQTh6YVFjSUFKK1ZF?=
 =?utf-8?B?Q3RqNnJjOUlUYmNyeFhtaCttNnRJdit6SXIxZ2FZT3duU3RiS2cxcmZxTnpo?=
 =?utf-8?B?a2orVlZMODlvT0NTWjB5NTc2RmVXb01Dd3V4UjlJYWNpUjZoaDJBdnNyTFVH?=
 =?utf-8?B?TjJGVHRTRzRzVkpteWhrNCs4OU5WbEp1UHc4L0hmMHgxN3l6ZllHSTgzcWpZ?=
 =?utf-8?B?NUV5NzI1UEtuY2J5OS8yY1VpVG5oT045TzhEMUtmMVBRdWpSQkhHSHY2ZFZW?=
 =?utf-8?B?Y1RXWC8vK3dKM0lkaTFObEJ5MXZVNXg5T1ZhaFVIbm16czlnY0ZNRVZFL3Fa?=
 =?utf-8?B?aUd0MlpHb1d2RmFUVkdST1ZVOXB1WFN4cS91WjlsUFdFQzE1blg2dU9YZ21V?=
 =?utf-8?B?bUN2V2pGblIzVUw4ZnBYYzZxd1hhaHhCOWJmV3o2OEJiWFJYUDNxS1oraVVO?=
 =?utf-8?B?eWNZMEY5K3J1TTZ0aFIxdkJlZml2N1J5cWFCdVZUNkFRUFB1eU1iVlpBcjU2?=
 =?utf-8?Q?IG0W79G7vR/QtqGk/d?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 690045bc-0cb4-4942-4f85-08de65a409ae
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 17:20:34.5683 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cuuXEL6F3W82FsKyOfJDcUG9nQLv4FaE48Ebn2Y7NU4fyFbFgac3iYmvvL5Xs80bld8RCy8S6KrjJwHR1aTi6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB2357
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
	FREEMAIL_CC(0.00)[nvidia.com,vger.kernel.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,protonmail.com,umich.edu,weathered-steel.dev,collabora.com,joelfernandes.org,lists.freedesktop.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,garyguo.net:mid,garyguo.net:dkim]
X-Rspamd-Queue-Id: D845E100E3C
X-Rspamd-Action: no action

On Fri Feb 6, 2026 at 5:13 PM GMT, Danilo Krummrich wrote:
> On Fri Feb 6, 2026 at 5:13 PM CET, Gary Guo wrote:
>> On Fri Feb 6, 2026 at 4:05 PM GMT, Joel Fernandes wrote:
>>>
>>>
>>> On 2/6/2026 10:53 AM, Danilo Krummrich wrote:
>>>> On Fri Feb 6, 2026 at 4:25 PM CET, Gary Guo wrote:
>>>>> On Fri Feb 6, 2026 at 12:41 AM GMT, Joel Fernandes wrote:
>>>>>> diff --git a/drivers/gpu/Kconfig b/drivers/gpu/Kconfig
>>>>>> index 22dd29cd50b5..2c3dec070645 100644
>>>>>> --- a/drivers/gpu/Kconfig
>>>>>> +++ b/drivers/gpu/Kconfig
>>>>>> @@ -1,7 +1,14 @@
>>>>>>  # SPDX-License-Identifier: GPL-2.0
>>>>>> =20
>>>>>> +config RUST_CLIST
>>>>>> +	bool
>>>>>> +	depends on RUST
>>>>>> +	help
>>>>>> +	  Rust abstraction for interfacing with C linked lists.
>>>>>
>>>>> I am not sure if we need extra config entry. This is fully generic so=
 shouldn't
>>>>> generate any code unless there is an user.
>>>>=20
>>>> I also don't think we need a Kconfig for this.
>>>>=20
>>>> In any case, it shouln't be in drivers/gpu/Kconfig.
>>>
>>> Fair point, I believe I was having trouble compiling this into the kern=
el crate
>>> without warnings (I believe if !GPU_BUDDY). I'll try to drop it and see=
 if we
>>> can get rid of it.
>>
>> If you run into dead code warnings, I think it is fine to just
>>
>>     #[allow(dead_code, reason =3D "all users might be cfg-ed out")]
>>
>> the overhead of just let rustc type-checking this module isn't worth the=
 extra
>> Kconfig plumbing, I think.
>
> You mean because there are pub(crate) in clist.rs? I don't think the Kcon=
fig
> would help with that, nothing prevents people from enabling RUST_CLIST, b=
ut none
> of the users.
>
> Besides that, once we have the new build system, the users of CList are l=
ikely
> in other crates anyways, so I think we should just change things to pub.

I asked for this to be changed to `pub(crate)` because I think this isn't
something that should be used by drivers.

As you said, tt might be tricky to enforce that with new build system when
subsystems are inside different crates. But until then I think it's better =
to
limit visibility.=20

Best,
Gary


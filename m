Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KMq2H3wJn2neYgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 15:38:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1E6198D4E
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 15:38:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD36A10E769;
	Wed, 25 Feb 2026 14:38:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="D2NPz0vn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010036.outbound.protection.outlook.com
 [40.93.198.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B10F810E17F;
 Wed, 25 Feb 2026 14:38:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H2TMIEm1kIN49R0SXJHoh2by+KmpNnCnDkcBDBMmTsqCr9+N+tC4hpVp6MVd4GLA3iz6lIy33D2HiSbmBd9yk3lVztglfN0Iaz/OnIr4/zOU/s0/gh9sN5yeESCQWJ5a1gZSVYgpD86UMAmLBAbkKzP+B5f0NjvUWxvvcKKI0zwqto0BBKaljSzFnbv6wv9Oc/tsDrjDqnlrW83INFSfbPJPSN25l2KMnJNIVJG1S56RxbpMLFnSUZLPNQ3GIq14k6Symkv6+FKqBg1bJ61oyRRqpqcIs8vG9sS6eR6iGy2vwZzsJxyc4tYOlhRE0nm8PjM1wiva0F4XuZuzG9MMEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XaM9jGSX5MpN6G3WfuuiENr5RxNksfP++6oTXGt0Nww=;
 b=mTp3JlSF5RAqfEgL2yLFQUoArS+y7D0ZCHJdl+mkPn8FDEemlDiEUUSm3LPeWsRApAx0h2VNX2v1IkXbHKAtKkhq/ZL2WrcK/bBqYBSpVvm0SKLVAjjDiXbgVBT2Ar8vBmv9UbJ5q6QHd/hjLO3N0iabfk7+UbxKLbHa+w6E3hRwoYHhvB5aIxyD6u++9hxjNf4Ur5k9cVi9i7t39AmslS4akIVyYjADZeVqnMFbiNkNYYFdPMd8snuJOhvzkqZBrnmP8NwPUbVgHo5k5UUlhouigTA9ffWkKo219tlpIBy2eDm2Z0MYJ9tBdxDeRUi5tQWgOPQC2n2zVu7G57rgRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XaM9jGSX5MpN6G3WfuuiENr5RxNksfP++6oTXGt0Nww=;
 b=D2NPz0vnK5C8yZ6qSl4zW3r3qIYDr2k+QyEcQPwcoX3sW+21kq7xZ3oea2SWFvQl+04ouoeJLm+KEgAv3ILaUMRVaBYnAlqZrjKJqzZ83mxngwS1mf9lNJJcrkqsu4PSmcx8vQPeIr0ICBH6zmur1Rh02Ss+ei1NMaewdCeiPMjjLr8xuDM9/4qjdUbH+aGWHCOSqhMmB0Akon+PQeJXtEwQ7kLMNS6WpY57JiWCcZcEVIubSvaTVZKDLv3jQHnYqroqi/P2L8dHYsbNC9QpPwrWbLHz2dQl+fbbB21bMcGrjkBoKkPlap8akxpJpTp2W3btTFvjBjoQ5dxSdPnn3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BN7PPF7C0ACC722.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6d5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Wed, 25 Feb
 2026 14:38:35 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 14:38:35 +0000
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Feb 2026 23:38:31 +0900
Message-Id: <DGO4BIQ6MQ9Y.KB3JJQI71ETU@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
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
Subject: Re: [PATCH v11 4/4] rust: gpu: Add GPU buddy allocator bindings
Content-Transfer-Encoding: quoted-printable
References: <20260224224005.3232841-1-joelagnelf@nvidia.com>
 <20260224224005.3232841-5-joelagnelf@nvidia.com>
In-Reply-To: <20260224224005.3232841-5-joelagnelf@nvidia.com>
X-ClientProxiedBy: TY4PR01CA0126.jpnprd01.prod.outlook.com
 (2603:1096:405:379::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BN7PPF7C0ACC722:EE_
X-MS-Office365-Filtering-Correlation-Id: d4798fad-4639-4a0a-fbf4-08de747b8de7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|10070799003; 
X-Microsoft-Antispam-Message-Info: jBrNORe/WgL1njWrLATd+N0aTrall0DI234IqO2VcP6HGVNBCZnOjA4juLPash8k5ob8FniUBQoaJe7L/E4aiGWCznoy5fPCPoE13f9dzlecssgqO9fTv5Livn4expkemx9fScCpx+y/h1dAoHwZp8AgdsC854ZRsLr1ohTyyibXAhHYNm7SgIIl4r+er3q9W+th/wfoc2x4NtVHyi+H1HjlfnNO6b6CkonnRPFq2SYb1K75v8Ont32RozmH+2cExr9ARSy6Cn/yD1EED0JaLfVscuDYs4N4EwrZdIlErKpBvE8YQFcEzrAR0JA/5b41agKcILfzLSAFN/VFYaPUKc/SbV2CEjEUQXPN/5MkvMCRleh6hXW0I69y9Rp6KrYfJroUg0zBwBZbVvzVLDjywVpjWV27cMGgxm2C0H1ppfLfbBVRhDEUsNYtnKYz07gx+orvB1QXqe1MvLTbWp+3TmCetb1B1/kQxqCi/I/oRKRzkiWGmXX23SoKuR8WnZjEk0Jfvtu1/ZNsB7OIDvQrW0htBDf6me20S+B2XkBuXHRua/tEv46CJFHTGRWQ+RWhdR3LxXE2PRh1idFsKzcldxdtdrRKESyMR7XViEGWpTUtLwJucFKeqDMJoNIwS1AiuMZEGkY4+Fze+cK6mseZeWmadv5Hg3oosTkETYwlLATRF4EdGdNiHxEp8qL7o7nde10gijUvlc88IQFrnRCjSeHBjO3wf3Bmrao7IoWCmt8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SlloVVR3L2tiMjQ5aXF4SnRWVWN2ekxtN1prbXd2ODRKNDFKK1p4VTF6S2RB?=
 =?utf-8?B?MDBjNHVmNzFGeXlwRjROWnNkU1laMktJckp3UkNJNVdPaERkUVMxc20zZk5y?=
 =?utf-8?B?aitDOStlRUZYSEQ0TGR1OXMzUVF6SFpZdDlidjJGYzA3RStxWG9GZ3p6dkhw?=
 =?utf-8?B?SkNCZS9mZVVLbFF5UW9NQVNoS2FuY2hhOURLQU1oOFBzRDRMMjFmYnFVNFdn?=
 =?utf-8?B?ZXhiRDJISEhCRk8rQXBaQks5a2RHRzhzVWpjeXhKNFdQZW5aWlBlK04yMDBZ?=
 =?utf-8?B?aDhqRnlsM3Q5dzJSTVhsTHRSSjdrUDdvbnkxVTROVFpzRXd6a2ZWUkxWb1JC?=
 =?utf-8?B?ZHl6ZXZ5WFBORFBsajhGOURoNU1Ka3BMZEI3dFBmdXlhd3dCcXhLeEs0KzEy?=
 =?utf-8?B?RU1rbXRjeUtKaVhoUGRFc1ZiWjV5SU4vdFBJQVdpUEZJem9DSWlLbTZzeENh?=
 =?utf-8?B?NFZxN0Rxd1dDaUlIVE9takVnblB6YTV1ZjR3ZE00bXlnU3pDUEZFcHMxOURZ?=
 =?utf-8?B?L3dqTktlb1kxNDdsYlhNK3dSN3dreVNZNVlmUEdwVVJ2U2M4Y1lVVHFGRzhP?=
 =?utf-8?B?OE9PS2R6RW83Y1FoK1lqekRxQkxyRjFpV0pvUHgxRFlLRTRSSEJzcTZBbVZ1?=
 =?utf-8?B?NGJwaXp5ZWxnSVBOcUFSZDFublhuNk9XallaTUUrZlY3M0xkRk1pYmhJL3dL?=
 =?utf-8?B?d2grYkNNeGZ4Ym5lYVN3a1NpaURHMStJcGF5d0ZWdTlZL29FOXIrV3lIU1RK?=
 =?utf-8?B?VE9MaVV4T1VJVVhXazFBRjBJcVRacUQ2bEdOVGR6dzNYUWdJQWMweEpyRUlz?=
 =?utf-8?B?OXlRczdFWTR3V1c5N1VBQmVDOWYvZ1VGem5VUjJkcTdDUlE0Njl6RWxCVGpx?=
 =?utf-8?B?VUc0WWpJQTBheFRQSW1WQmxzcGpkRDdoZER3Y1pNN0xaYVpRZ0l3VU9MOEpZ?=
 =?utf-8?B?ZEZhRHdhSTZQS01pV3ZYK21WeWJHdEs5NmRXMW51Y3JQVEYvVkd3cFhRbWJp?=
 =?utf-8?B?MmFDWU90S3MySWtyY3BRcXZQSnBLcUQzUW9TdFF3cnJmTjF3WjBrc2J3Nlgv?=
 =?utf-8?B?KytWQnAvenhVVG1mVlFhUkZ4cXZvNjVXRFJuOFoxalRPTkczYmZLcXVJZkQw?=
 =?utf-8?B?NGVJWmJIUW5oLzd1bmF6dTBZa2MzanBFVFprT2c1bm5UcUtacGZHMGwrVmk1?=
 =?utf-8?B?N1phTXpEWWR3anp0VDV5MHVYOUVueXVxQVFlRGQrQVR0dU96MFRGYnA4N3Fq?=
 =?utf-8?B?Z0pjem9kSUVOVzF5ZnlhNjZaVHZkUHM5SE9jbU9BNHZVSWxMTXFoUnVkdzRU?=
 =?utf-8?B?bko2b2JLeWNUUU5jNTIrckI1ZW5MeG9ENExINjNhTk1rb2s3NWVJZVlGc1ZH?=
 =?utf-8?B?RFA3RHNSMUpwV3paVVVkUnBra3RwcjFsd0M5dGpibWYvbGZpU2VHM2lBT1N3?=
 =?utf-8?B?Qk1aTzY3WjBtbk4xeUxIS05FSVpCeURmTjFtbVk0emxRV3RyWUZEQkRvR0p5?=
 =?utf-8?B?akdselMrODdOTE9uVEpPbWVGWGRGYUk3OTFLYVhuU1R3MlVZRXdUZDRTRUEx?=
 =?utf-8?B?ZmpYTnRUd2JWOGJ2dDBOUUQ4T0t0MTdRL2NlTlNyUHNGWDEzNFZtRjdlMGZS?=
 =?utf-8?B?bHNkUXViUVJ4ZHcvYk00MVhXaXVsc3VDd3NTT0dPTlphY0d5MVJ1aXFyeEZF?=
 =?utf-8?B?SFo4cEU0aWN1OUxGNG9qWXB4MC9GQ3UyZTZ3NW04bGhXU0YwN0ZFZ0kxRGtV?=
 =?utf-8?B?a1RQTUJHWVprZ0hUWlF4dTBDaHRramV5T2NsOTFhbE9lQmVST0VHWWFjb0Ru?=
 =?utf-8?B?SEdrMlBIY2R3UjlMTlFsZkhRaUNMOE4rc3FPK0pRZXdsNEFQRG9NNHlxajZE?=
 =?utf-8?B?cjgxZ0VYT1pJeEdYdktYTTBwU1YyV2VxK0ZTQzdnbnpQTkpFNnRadW40ZDR2?=
 =?utf-8?B?R1U0MEdaOG9TS2V0UFhOL3gwcmJzTXV1cU9wbjFEWWt2a0FjRFRBV0JyUGRj?=
 =?utf-8?B?WXNnc0JNaU1OMGtoWHRXR1FqOEhWNko1RFl0SXh0RFhTbVJKNjZrd1ZhS0oy?=
 =?utf-8?B?NWJJekdIV0htR2dkWkZKRmxEdXQveHkwUDNMdytRRmNRVDI2KzJrQWdEa1V1?=
 =?utf-8?B?aU1rZkVqN3dUY3Bhd3p0OWRXYWJpTW9CbEd3R2RuNm4yc0hVRG1WOXJSSFVs?=
 =?utf-8?B?SjBoM202ZTBFODFYMnZRL0FJV1lMSitLNkR5ZXpLUHkzcFMwN3BET3UwSmpv?=
 =?utf-8?B?cVMvTGFtdVI0b1k5cXRsUTc0ZEptZ0tDUjh5a3dMK2F6S3VncHdrVldiY1c5?=
 =?utf-8?B?M0wyUzdNK0NUNk43UWt3UzhjNUVpbFRFQTIzTlFVMjYzNnV2ZXZxUUhnOHov?=
 =?utf-8?Q?VBagavLjj4yinWaiFBxTPucLML6LDv0qM4yD2DFTWVtAE?=
X-MS-Exchange-AntiSpam-MessageData-1: xMVTI/BI/xL0Qw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4798fad-4639-4a0a-fbf4-08de747b8de7
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 14:38:35.1429 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v2+wkxtQ5QxPra4gM9R2q91icfqe3dobOvRE82t9DMdyaU21LsYRCVGXn7uZRxZ00fcvVDi54kGHGubiQiFq0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF7C0ACC722
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
	NEURAL_HAM(-0.00)[-0.984];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email]
X-Rspamd-Queue-Id: 1F1E6198D4E
X-Rspamd-Action: no action

On Wed Feb 25, 2026 at 7:40 AM JST, Joel Fernandes wrote:
> Add safe Rust abstractions over the Linux kernel's GPU buddy
> allocator for physical memory management. The GPU buddy allocator
> implements a binary buddy system useful for GPU physical memory
> allocation. nova-core will use it for physical memory allocation.
>
> Cc: Nikola Djukic <ndjukic@nvidia.com>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>

<snip>
> diff --git a/rust/kernel/gpu/buddy.rs b/rust/kernel/gpu/buddy.rs
> new file mode 100644
> index 000000000000..4383f82c0fc1
> --- /dev/null
> +++ b/rust/kernel/gpu/buddy.rs
> @@ -0,0 +1,536 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! GPU buddy allocator bindings.
> +//!
> +//! C header: [`include/linux/gpu_buddy.h`](srctree/include/linux/gpu_bu=
ddy.h)
> +//!
> +//! This module provides Rust abstractions over the Linux kernel's GPU b=
uddy
> +//! allocator, which implements a binary buddy memory allocator.
> +//!
> +//! The buddy allocator manages a contiguous address space and allocates=
 blocks
> +//! in power-of-two sizes, useful for GPU physical memory management.
> +//!
> +//! # Examples
> +//!
> +//! ```

This is a very long example illustrating many use-cases. It is long
enough that it is difficult to grasp where each example start. Can I
suggest to aerate it a bit by splitting it into several examples, with a
bit of regular text explaining what each example does, similarly to the
documentation of the `Bounded` type?

You can hide the creation of the `GpuBuddy` after the first example to
keep things concise.

> +//! use kernel::{
> +//!     gpu::buddy::{BuddyFlags, GpuBuddy, GpuBuddyAllocParams, GpuBuddy=
Params},
> +//!     prelude::*,
> +//!     sizes::*, //
> +//! };
> +//!
> +//! // Create a 1GB buddy allocator with 4KB minimum chunk size.
> +//! let buddy =3D GpuBuddy::new(GpuBuddyParams {
> +//!     base_offset_bytes: 0,
> +//!     physical_memory_size_bytes: SZ_1G as u64,
> +//!     chunk_size_bytes: SZ_4K as u64,
> +//! })?;
> +//!
> +//! // Verify initial state.
> +//! assert_eq!(buddy.size(), SZ_1G as u64);
> +//! assert_eq!(buddy.chunk_size(), SZ_4K as u64);
> +//! let initial_free =3D buddy.free_memory_bytes();
> +//!
> +//! // Base allocation params - mutated between calls for field override=
s.
> +//! let mut params =3D GpuBuddyAllocParams {
> +//!     start_range_address: 0,
> +//!     end_range_address: 0,   // Entire range.
> +//!     size_bytes: SZ_16M as u64,
> +//!     min_block_size_bytes: SZ_16M as u64,
> +//!     buddy_flags: BuddyFlags::try_new(BuddyFlags::RANGE_ALLOCATION)?,

Why can a `BuddyFlags` creation fail if we give it a valid value? It
looks like its consts should be of the type `BuddyFlags` themselves so
we can use them directly. Actually, we should probably use `impl_flags!`
for it.

> +//! };
> +//!
> +//! // Test top-down allocation (allocates from highest addresses).
> +//! params.buddy_flags =3D BuddyFlags::try_new(BuddyFlags::TOPDOWN_ALLOC=
ATION)?;
> +//! let topdown =3D KBox::pin_init(buddy.alloc_blocks(&params), GFP_KERN=
EL)?;
> +//! assert_eq!(buddy.free_memory_bytes(), initial_free - SZ_16M as u64);
> +//!
> +//! for block in topdown.iter() {
> +//!     assert_eq!(block.offset(), (SZ_1G - SZ_16M) as u64);
> +//!     assert_eq!(block.order(), 12); // 2^12 pages
> +//!     assert_eq!(block.size(), SZ_16M as u64);
> +//! }

IIUC there should be only one block here, right? That for loop should be
replaced by a call to `next()` followed by another one checking that the
result is `None` to be a valid test.

> +//! drop(topdown);

Here is a good chance to mention that dropping the allocation will
return it - it's expected, but not entirely obvious when you read this
for the first time.

> +//! assert_eq!(buddy.free_memory_bytes(), initial_free);
> +//!
> +//! // Allocate 16MB - should result in a single 16MB block at offset 0.
> +//! params.buddy_flags =3D BuddyFlags::try_new(BuddyFlags::RANGE_ALLOCAT=
ION)?;

Let's recreate the params for each example to make it self-contained
instead of modifying the first one.

> +//! let allocated =3D KBox::pin_init(buddy.alloc_blocks(&params), GFP_KE=
RNEL)?;
> +//! assert_eq!(buddy.free_memory_bytes(), initial_free - SZ_16M as u64);
> +//!
> +//! for block in allocated.iter() {
> +//!     assert_eq!(block.offset(), 0);
> +//!     assert_eq!(block.order(), 12); // 2^12 pages
> +//!     assert_eq!(block.size(), SZ_16M as u64);
> +//! }
> +//! drop(allocated);
> +//! assert_eq!(buddy.free_memory_bytes(), initial_free);
> +//!
> +//! // Test non-contiguous allocation with fragmented memory.
> +//! // Create fragmentation by allocating 4MB blocks at [0,4M) and [8M,1=
2M).
> +//! params.end_range_address =3D SZ_4M as u64;
> +//! params.size_bytes =3D SZ_4M as u64;
> +//! params.min_block_size_bytes =3D SZ_4M as u64;
> +//! let frag1 =3D KBox::pin_init(buddy.alloc_blocks(&params), GFP_KERNEL=
)?;
> +//! assert_eq!(buddy.free_memory_bytes(), initial_free - SZ_4M as u64);
> +//!
> +//! params.start_range_address =3D SZ_8M as u64;
> +//! params.end_range_address =3D (SZ_8M + SZ_4M) as u64;
> +//! let frag2 =3D KBox::pin_init(buddy.alloc_blocks(&params), GFP_KERNEL=
)?;
> +//! assert_eq!(buddy.free_memory_bytes(), initial_free - SZ_8M as u64);
> +//!
> +//! // Allocate 8MB without CONTIGUOUS - should return 2 blocks from the=
 holes.
> +//! params.start_range_address =3D 0;
> +//! params.end_range_address =3D SZ_16M as u64;
> +//! params.size_bytes =3D SZ_8M as u64;
> +//! let fragmented =3D KBox::pin_init(buddy.alloc_blocks(&params), GFP_K=
ERNEL)?;
> +//! assert_eq!(buddy.free_memory_bytes(), initial_free - (SZ_16M) as u64=
);
> +//!
> +//! let (mut count, mut total) =3D (0u32, 0u64);
> +//! for block in fragmented.iter() {
> +//!     // The 8MB allocation should return 2 blocks, each 4MB.
> +//!     assert_eq!(block.size(), SZ_4M as u64);
> +//!     total +=3D block.size();
> +//!     count +=3D 1;
> +//! }
> +//! assert_eq!(total, SZ_8M as u64);
> +//! assert_eq!(count, 2);
> +//! drop(fragmented);
> +//! drop(frag2);
> +//! drop(frag1);
> +//! assert_eq!(buddy.free_memory_bytes(), initial_free);
> +//!
> +//! // Test CONTIGUOUS failure when only fragmented space available.
> +//! // Create a small buddy allocator with only 16MB of memory.
> +//! let small =3D GpuBuddy::new(GpuBuddyParams {
> +//!     base_offset_bytes: 0,
> +//!     physical_memory_size_bytes: SZ_16M as u64,
> +//!     chunk_size_bytes: SZ_4K as u64,
> +//! })?;
> +//!
> +//! // Allocate 4MB blocks at [0,4M) and [8M,12M) to create fragmented m=
emory.
> +//! params.start_range_address =3D 0;
> +//! params.end_range_address =3D SZ_4M as u64;
> +//! params.size_bytes =3D SZ_4M as u64;
> +//! let hole1 =3D KBox::pin_init(small.alloc_blocks(&params), GFP_KERNEL=
)?;
> +//!
> +//! params.start_range_address =3D SZ_8M as u64;
> +//! params.end_range_address =3D (SZ_8M + SZ_4M) as u64;
> +//! let hole2 =3D KBox::pin_init(small.alloc_blocks(&params), GFP_KERNEL=
)?;
> +//!
> +//! // 8MB contiguous should fail - only two non-contiguous 4MB holes ex=
ist.
> +//! params.start_range_address =3D 0;
> +//! params.end_range_address =3D 0;
> +//! params.size_bytes =3D SZ_8M as u64;
> +//! params.buddy_flags =3D BuddyFlags::try_new(BuddyFlags::CONTIGUOUS_AL=
LOCATION)?;
> +//! let result =3D KBox::pin_init(small.alloc_blocks(&params), GFP_KERNE=
L);
> +//! assert!(result.is_err());
> +//! drop(hole2);
> +//! drop(hole1);
> +//!
> +//! # Ok::<(), Error>(())
> +//! ```
> +
> +use crate::{
> +    bindings,
> +    clist_create,
> +    error::to_result,
> +    ffi::clist::CListHead,
> +    new_mutex,
> +    prelude::*,
> +    sync::{
> +        lock::mutex::MutexGuard,
> +        Arc,
> +        Mutex, //
> +    },
> +    types::Opaque, //
> +};
> +
> +/// Flags for GPU buddy allocator operations.
> +///
> +/// These flags control the allocation behavior of the buddy allocator.
> +#[derive(Clone, Copy, Default, PartialEq, Eq)]
> +pub struct BuddyFlags(usize);
> +
> +impl BuddyFlags {
> +    /// Range-based allocation from start to end addresses.
> +    pub const RANGE_ALLOCATION: usize =3D bindings::GPU_BUDDY_RANGE_ALLO=
CATION;
> +
> +    /// Allocate from top of address space downward.
> +    pub const TOPDOWN_ALLOCATION: usize =3D bindings::GPU_BUDDY_TOPDOWN_=
ALLOCATION;
> +
> +    /// Allocate physically contiguous blocks.
> +    pub const CONTIGUOUS_ALLOCATION: usize =3D bindings::GPU_BUDDY_CONTI=
GUOUS_ALLOCATION;
> +
> +    /// Request allocation from the cleared (zeroed) memory. The zero'in=
g is not
> +    /// done by the allocator, but by the caller before freeing old bloc=
ks.
> +    pub const CLEAR_ALLOCATION: usize =3D bindings::GPU_BUDDY_CLEAR_ALLO=
CATION;
> +
> +    /// Disable trimming of partially used blocks.
> +    pub const TRIM_DISABLE: usize =3D bindings::GPU_BUDDY_TRIM_DISABLE;
> +
> +    /// Mark blocks as cleared (zeroed) when freeing. When set during fr=
ee,
> +    /// indicates that the caller has already zeroed the memory.
> +    pub const CLEARED: usize =3D bindings::GPU_BUDDY_CLEARED;
> +
> +    /// Create [`BuddyFlags`] from a raw value with validation.
> +    ///
> +    /// Use `|` operator to combine flags if needed, before calling this=
 method.
> +    pub fn try_new(flags: usize) -> Result<Self> {
> +        // Flags must not exceed u32::MAX to satisfy the GPU buddy alloc=
ator C API.
> +        if flags > u32::MAX as usize {

These `as` conversions are unfortunate - I will try to graduate the
infallible convertors from Nova into kernel soon so we can avoid them,
but for now I guess there's nothing we can do unfortunately.

> +            return Err(EINVAL);
> +        }
> +
> +        // `TOPDOWN_ALLOCATION` only works without `RANGE_ALLOCATION`. W=
hen both are
> +        // set, `TOPDOWN_ALLOCATION` is silently ignored by the allocato=
r. Reject this.
> +        if (flags & Self::RANGE_ALLOCATION) !=3D 0 && (flags & Self::TOP=
DOWN_ALLOCATION) !=3D 0 {
> +            return Err(EINVAL);
> +        }

This indicates that we should use the type system to prevent such
constructs from even being attempted - more on this on
`GpuBuddyAllocParams`.

> +
> +        Ok(Self(flags))
> +    }
> +
> +    /// Get raw value of the flags.
> +    pub(crate) fn as_raw(self) -> usize {
> +        self.0
> +    }
> +}
> +
> +/// Parameters for creating a GPU buddy allocator.
> +pub struct GpuBuddyParams {
> +    /// Base offset in bytes where the managed memory region starts.
> +    /// Allocations will be offset by this value.
> +    pub base_offset_bytes: u64,

Let's remove the `_bytes` suffix. Units can be specified in the
doccomment so they are readily available without making the code
heavier (`dma.rs` for instance does this).

> +    /// Total physical memory size managed by the allocator in bytes.
> +    pub physical_memory_size_bytes: u64,
> +    /// Minimum allocation unit / chunk size in bytes, must be >=3D 4KB.
> +    pub chunk_size_bytes: u64,
> +}

This structure doesn't seem to be useful. I would understand using one
if `GpuBuddyParams` had lots of members, some of which have a sensible
default value - then we could implement `Default` and let users fill in
the parameters they need.

But this structure has no constructor of any sort, requiring users to
fill its 3 members manually - which is actually heavier than having 3
parameters to `GpuBuddy::new`. It is even deconstructed in
`GpuBuddyInner` to store its members as 3 different fields! So let's
skip it.

> +
> +/// Parameters for allocating blocks from a GPU buddy allocator.
> +pub struct GpuBuddyAllocParams {
> +    /// Start of allocation range in bytes. Use 0 for beginning.
> +    pub start_range_address: u64,
> +    /// End of allocation range in bytes. Use 0 for entire range.
> +    pub end_range_address: u64,
> +    /// Total size to allocate in bytes.
> +    pub size_bytes: u64,
> +    /// Minimum block size for fragmented allocations in bytes.
> +    pub min_block_size_bytes: u64,
> +    /// Buddy allocator behavior flags.
> +    pub buddy_flags: BuddyFlags,
> +}

This one also feels like it could be rustified some more.

By this I mean that it e.g. allows the user to specify a range even if
`RANGE_ALLOCATION` is not set. A C API rejects invalid combinations at
runtime. A Rust API should make it impossible to even express them.

IIUC the flags mix the allocation type (simple, range, topdown) with
some orthogonal properties (contiguous, cleared, trim_disable). There is
also one bit (`GPU_BUDDY_CLEARED`) that is not relevant for allocation,
but is freeing a block. We want to use the type system to only allow states
that make sense to be constructed.

The allocation type can be expressed using a three-state enum. Start and
end range only make sense for range allocations, so they would be part
of the `Range` variant.

`size` and `min_block_size` (let's move the unit from the name into the
doccomment) are always relevant, and should be regular arguments of
their own. If `min_block_sizes` only accepts certain values (the C
documentation says "alignment", so power of two?) then it should also
use the relevant type for that (our own `kernel::ptr::Alignment` type?).

`flags` should be its own type (using `impl_flags` again?) allowing a
combination of Contiguous, Cleared, and TrimDisable.

That would turn `alloc_blocks` into something like:

  `fn alloc_blocks(&self, alloc: AllocType, size: u64, min_block_size: Alig=
nment, flags: AllocBlocksFlags)`

(`min_block_size` is a u64 in the C API, but for an alignment a `usize`
is enough and the conversion can be lossless).

> +
> +/// Inner structure holding the actual buddy allocator.
> +///
> +/// # Synchronization
> +///
> +/// The C `gpu_buddy` API requires synchronization (see `include/linux/g=
pu_buddy.h`).
> +/// The internal [`GpuBuddyGuard`] ensures that the lock is held for all

`GpuBuddyGuard` is exported and not internal though.

> +/// allocator and free operations, preventing races between concurrent a=
llocations
> +/// and the freeing that occurs when [`AllocatedBlocks`] is dropped.
> +///
> +/// # Invariants
> +///
> +/// The inner [`Opaque`] contains a valid, initialized buddy allocator.
> +#[pin_data(PinnedDrop)]
> +struct GpuBuddyInner {
> +    #[pin]
> +    inner: Opaque<bindings::gpu_buddy>,
> +
> +    // TODO: Replace `Mutex<()>` with `Mutex<Opaque<..>>` once `Mutex::n=
ew()`
> +    // accepts `impl PinInit<T>`.
> +    #[pin]
> +    lock: Mutex<()>,
> +    /// Base offset for all allocations (does not change after init).
> +    base_offset: u64,

This does not appear to be used in the C API - does it belong here? It
looks like an additional convenience, but I'm not convinced that's the
role of this type to provide this. But if it really is needed by all
users (guess I'll find out after looking the Nova code :)), then keeping
it is fair I guess.

> +    /// Cached chunk size (does not change after init).
> +    chunk_size: u64,
> +    /// Cached total size (does not change after init).
> +    size: u64,
> +}
> +
> +impl GpuBuddyInner {
> +    /// Create a pin-initializer for the buddy allocator.
> +    fn new(params: GpuBuddyParams) -> impl PinInit<Self, Error> {
> +        let base_offset =3D params.base_offset_bytes;
> +        let size =3D params.physical_memory_size_bytes;
> +        let chunk_size =3D params.chunk_size_bytes;
> +
> +        try_pin_init!(Self {
> +            inner <- Opaque::try_ffi_init(|ptr| {
> +                // SAFETY: ptr points to valid uninitialized memory from=
 the pin-init
> +                // infrastructure. gpu_buddy_init will initialize the st=
ructure.
> +                to_result(unsafe { bindings::gpu_buddy_init(ptr, size, c=
hunk_size) })
> +            }),
> +            lock <- new_mutex!(()),
> +            base_offset: base_offset,
> +            chunk_size: chunk_size,
> +            size: size,
> +        })
> +    }
> +
> +    /// Lock the mutex and return a guard for accessing the allocator.
> +    fn lock(&self) -> GpuBuddyGuard<'_> {
> +        GpuBuddyGuard {
> +            inner: self,
> +            _guard: self.lock.lock(),
> +        }
> +    }
> +}
> +
> +#[pinned_drop]
> +impl PinnedDrop for GpuBuddyInner {
> +    fn drop(self: Pin<&mut Self>) {
> +        let guard =3D self.lock();
> +
> +        // SAFETY: guard provides exclusive access to the allocator.
> +        unsafe {
> +            bindings::gpu_buddy_fini(guard.as_raw());
> +        }
> +    }
> +}
> +
> +// SAFETY: GpuBuddyInner can be sent between threads.
> +unsafe impl Send for GpuBuddyInner {}
> +
> +// SAFETY: GpuBuddyInner is `Sync` because the internal GpuBuddyGuard
> +// serializes all access to the C allocator, preventing data races.
> +unsafe impl Sync for GpuBuddyInner {}
> +
> +/// Guard that proves the lock is held, enabling access to the allocator=
.
> +///
> +/// # Invariants
> +///
> +/// The inner `_guard` holds the lock for the duration of this guard's l=
ifetime.

Private members should not be mentioned in public documentation. Also is
this invariant ever referenced when enforced and to justify an unsafe
block? If not I don't think there is a point in having it.

> +pub(crate) struct GpuBuddyGuard<'a> {

IIUC this type can be private.

> +    inner: &'a GpuBuddyInner,
> +    _guard: MutexGuard<'a, ()>,
> +}
> +
> +impl GpuBuddyGuard<'_> {
> +    /// Get a raw pointer to the underlying C `gpu_buddy` structure.
> +    fn as_raw(&self) -> *mut bindings::gpu_buddy {
> +        self.inner.inner.get()
> +    }
> +}
> +
> +/// GPU buddy allocator instance.
> +///
> +/// This structure wraps the C `gpu_buddy` allocator using reference cou=
nting.
> +/// The allocator is automatically cleaned up when all references are dr=
opped.
> +///
> +/// # Invariants
> +///
> +/// The inner [`Arc`] points to a valid, initialized GPU buddy allocator=
.

Most people looking for the documentation will reach it through
`GpuBuddy`. I think we should either move the module-level documentation
to this type, or add a reference to the module so users can easily find
how to use it.

> +pub struct GpuBuddy(Arc<GpuBuddyInner>);
> +
> +impl GpuBuddy {
> +    /// Create a new buddy allocator.
> +    ///
> +    /// Creates a buddy allocator that manages a contiguous address spac=
e of the given
> +    /// size, with the specified minimum allocation unit (chunk_size mus=
t be at least 4KB).
> +    pub fn new(params: GpuBuddyParams) -> Result<Self> {
> +        Ok(Self(Arc::pin_init(GpuBuddyInner::new(params), GFP_KERNEL)?))
> +    }
> +
> +    /// Get the base offset for allocations.
> +    pub fn base_offset(&self) -> u64 {
> +        self.0.base_offset
> +    }
> +
> +    /// Get the chunk size (minimum allocation unit).
> +    pub fn chunk_size(&self) -> u64 {
> +        self.0.chunk_size
> +    }
> +
> +    /// Get the total managed size.
> +    pub fn size(&self) -> u64 {
> +        self.0.size
> +    }
> +
> +    /// Get the available (free) memory in bytes.
> +    pub fn free_memory_bytes(&self) -> u64 {

Same as struct members, the unit doesn't need to be in the method name -
the doccomment is sufficient.

> +        let guard =3D self.0.lock();
> +
> +        // SAFETY: guard provides exclusive access to the allocator.
> +        unsafe { (*guard.as_raw()).avail }
> +    }
> +
> +    /// Allocate blocks from the buddy allocator.
> +    ///
> +    /// Returns a pin-initializer for [`AllocatedBlocks`].
> +    ///
> +    /// Takes `&self` instead of `&mut self` because the internal [`Mute=
x`] provides
> +    /// synchronization - no external `&mut` exclusivity needed.
> +    pub fn alloc_blocks(
> +        &self,
> +        params: &GpuBuddyAllocParams,
> +    ) -> impl PinInit<AllocatedBlocks, Error> {
> +        let buddy_arc =3D Arc::clone(&self.0);
> +        let start =3D params.start_range_address;
> +        let end =3D params.end_range_address;
> +        let size =3D params.size_bytes;
> +        let min_block_size =3D params.min_block_size_bytes;
> +        let flags =3D params.buddy_flags;

These local variables are required so the closure below is not confused
by the lifetime of `params`. But since you are copying its content
anyway, you could just make `GpuBuddyAllocParams` derive `Copy`, pass
`params` by value, and use its members directly in the closure.

That probably won't be needed if we split `GpuBuddyAllocParams` as I
suggested though.

> +
> +        // Create pin-initializer that initializes list and allocates bl=
ocks.
> +        try_pin_init!(AllocatedBlocks {
> +            buddy: buddy_arc,
> +            list <- CListHead::new(),
> +            flags: flags,
> +            _: {
> +                // Lock while allocating to serialize with concurrent fr=
ees.
> +                let guard =3D buddy.lock();
> +
> +                // SAFETY: `guard` provides exclusive access to the budd=
y allocator.
> +                to_result(unsafe {
> +                    bindings::gpu_buddy_alloc_blocks(
> +                        guard.as_raw(),
> +                        start,
> +                        end,
> +                        size,
> +                        min_block_size,
> +                        list.as_raw(),
> +                        flags.as_raw(),
> +                    )
> +                })?
> +            }
> +        })
> +    }
> +}
> +
> +/// Allocated blocks from the buddy allocator with automatic cleanup.
> +///
> +/// This structure owns a list of allocated blocks and ensures they are
> +/// automatically freed when dropped. Use `iter()` to iterate over all
> +/// allocated [`Block`] structures.
> +///
> +/// # Invariants
> +///
> +/// - `list` is an initialized, valid list head containing allocated blo=
cks.
> +#[pin_data(PinnedDrop)]
> +pub struct AllocatedBlocks {
> +    #[pin]
> +    list: CListHead,
> +    buddy: Arc<GpuBuddyInner>,
> +    flags: BuddyFlags,
> +}
> +
> +impl AllocatedBlocks {
> +    /// Check if the block list is empty.
> +    pub fn is_empty(&self) -> bool {
> +        // An empty list head points to itself.
> +        !self.list.is_linked()
> +    }
> +
> +    /// Iterate over allocated blocks.
> +    ///
> +    /// Returns an iterator yielding [`AllocatedBlock`] values. Each [`A=
llocatedBlock`]
> +    /// borrows `self` and is only valid for the duration of that borrow=
.
> +    pub fn iter(&self) -> impl Iterator<Item =3D AllocatedBlock<'_>> + '=
_ {
> +        // SAFETY: list contains gpu_buddy_block items linked via __bind=
gen_anon_1.link.

IIUC the type invariant should be invoked explicitly as we are using it
to justify this unsafe block (i.e. "per the type invariant, ...").

> +        let clist =3D clist_create!(unsafe {
> +            self.list.as_raw(),
> +            Block,
> +            bindings::gpu_buddy_block,
> +            __bindgen_anon_1.link
> +        });
> +
> +        clist
> +            .iter()
> +            .map(|block| AllocatedBlock { block, alloc: self })
> +    }
> +}
> +
> +#[pinned_drop]
> +impl PinnedDrop for AllocatedBlocks {
> +    fn drop(self: Pin<&mut Self>) {
> +        let guard =3D self.buddy.lock();
> +
> +        // SAFETY:
> +        // - list is valid per the type's invariants.
> +        // - guard provides exclusive access to the allocator.
> +        // CAST: BuddyFlags were validated to fit in u32 at construction=
.
> +        unsafe {
> +            bindings::gpu_buddy_free_list(
> +                guard.as_raw(),
> +                self.list.as_raw(),
> +                self.flags.as_raw() as u32,

You won't need this `as` if you make `BuddyFlags` wrap a `u32` instead
of a `usize`.

> +            );
> +        }
> +    }
> +}
> +
> +/// A GPU buddy block.
> +///
> +/// Transparent wrapper over C `gpu_buddy_block` structure. This type is=
 returned
> +/// as references during iteration over [`AllocatedBlocks`].
> +///
> +/// # Invariants
> +///
> +/// The inner [`Opaque`] contains a valid, allocated `gpu_buddy_block`.
> +#[repr(transparent)]
> +pub struct Block(Opaque<bindings::gpu_buddy_block>);
> +
> +impl Block {
> +    /// Get a raw pointer to the underlying C block.
> +    fn as_raw(&self) -> *mut bindings::gpu_buddy_block {
> +        self.0.get()
> +    }
> +
> +    /// Get the block's offset in the address space.
> +    pub(crate) fn offset(&self) -> u64 {
> +        // SAFETY: self.as_raw() is valid per the type's invariants.
> +        unsafe { bindings::gpu_buddy_block_offset(self.as_raw()) }
> +    }
> +
> +    /// Get the block order.
> +    pub(crate) fn order(&self) -> u32 {
> +        // SAFETY: self.as_raw() is valid per the type's invariants.
> +        unsafe { bindings::gpu_buddy_block_order(self.as_raw()) }
> +    }
> +}
> +
> +// SAFETY: `Block` is not modified after allocation for the lifetime
> +// of `AllocatedBlock`.

This safety comment should not need to reference another type - how
about something like "`Block` is a wrapper around `gpu_buddy_block`
which can be sent across threads safely".

> +unsafe impl Send for Block {}
> +
> +// SAFETY: `Block` is not modified after allocation for the lifetime
> +// of `AllocatedBlock`.

Here as well. I'd say that the block is only accessed through shared
references after allocation, and thus safe to access concurrently across
threads.

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFhRDm57pWm6CAYAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 12:58:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8BD1D7F42
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 12:58:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA0E310E49F;
	Mon,  2 Mar 2026 11:58:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="WYUL70hx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013058.outbound.protection.outlook.com
 [40.107.201.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA3EC10E49E;
 Mon,  2 Mar 2026 11:58:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oQNmZB4Nuo2oc/gei623OMmKAYYwUsv+0A1ybD/i5cuKo6O557r6LtED7dy6tOBhEVcAmFjRxOJNEbARg7Eyq/H3M6foOxXcVjF1WBiDVm4WGs46VSZv5tkucyvt0NC031lVQGRjz9aurk7shAdo415W6+tqM3sAvYi1+f/6BVOzW7lWEevgtIFai84zdjb4zciHCeawYDg7LZE3sfLRgnbEjknwZnVhnHYOz5yH5ml7QwnH/trkNGHBipvG5Mcy93+ajLa8nUJp2AlfHUOwDCRLUO5hmG9Cd//zz9Fp5WFABsVn/R1zf848La5TKpqkjAsXSQhMFy7Cu2/dNMYmiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ol4fHMR/0SuAp7nN5bILJHNJcoh4hbvBP3CIn5jDrs=;
 b=mNvSaj5qse6KkI//EKZTFuf+q6I5DkInqbZu7lXMpLQzc9XkJafxbI1wf+ugU8swsdfx0tTR2Q3Yxu5PtFleFnMGypIzF+Clv41k8oUZ2867/QtwiuzNKafma72d3i7f9C1VbyiRFs9xA+vFVyflW4NRATgpOo5QOUOLPw3Ig/Fqq81J0T3NYOJzHkjHjnPcmDCUJJxMm57HhQ8XHNS2F0tSo6C7fLR4Q/2KcZPjmgkCazddMFv1W9rPzSDFiB8vKPTNQ7YKO1A00jpLGevyvfp+T3oHklKbMIvYDCudlRC2bI/Ew2BsoMrp09pATTMJWGWWtqHb4KngkNx73JT2Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ol4fHMR/0SuAp7nN5bILJHNJcoh4hbvBP3CIn5jDrs=;
 b=WYUL70hxl/p+t71tO8qsMWHFqgGsfKdR5FyQhy4T1ENExpr+M4qG31hpEhgGbxPXqH/+RIz0MFBKp1/DxbxrTzLNiLYCXPIop9Ci36gOocXry91uPy1FPA9O2mR8iuGsmpuxAH1IsMIFUyV3lPmhj/yJND/utbfaRfD87fbVp7l4zQYnwtm1plXM8t8y8GCPGd60rZvm1Kve/bDqKUwZE4ldmiJWXrNro0EOg2+zSrnfjvHqdwYWNybhwA2UpUZ85BCIEANSAJPChDZxrAF3Ih3+9CKb64A0w1RqSC6NPisZ7DYyS0X2eylkTVMcehb5ZWdBcuxbxMUvV9UvA4jwkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by LV5PR12MB9827.namprd12.prod.outlook.com (2603:10b6:408:305::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Mon, 2 Mar
 2026 11:58:27 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 11:58:27 +0000
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Mar 2026 20:58:23 +0900
Message-Id: <DGSA1N4M1PUM.29JML8EK3SKWA@nvidia.com>
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
Subject: Re: [PATCH v8 06/25] gpu: nova-core: mm: Add support to use PRAMIN
 windows to write to VRAM
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260224225323.3312204-1-joelagnelf@nvidia.com>
 <20260224225323.3312204-7-joelagnelf@nvidia.com>
In-Reply-To: <20260224225323.3312204-7-joelagnelf@nvidia.com>
X-ClientProxiedBy: TY4PR01CA0065.jpnprd01.prod.outlook.com
 (2603:1096:405:370::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|LV5PR12MB9827:EE_
X-MS-Office365-Filtering-Correlation-Id: 56a706c4-262e-4eb4-fad8-08de785303a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|10070799003|1800799024|366016; 
X-Microsoft-Antispam-Message-Info: dajFa04mWoJ/y8aK98J/Osv6z9Ybw8YIKJ4XQoGpgZwAGpwIyj8HutOrx6WuquHNwuR3z4F55pv0Sr2JO1nAMfSIFhWPpCbOQvcguKucDcoxUdqgbN+G2ZM2Qb8QUcQNiHHCXgs7rF0O8EOcixyuSTc9AiYtohCh9j9OEqYZA/VRhnPxocD4//29mZGTTAWRUOtzmgWg4pu4Mnpmr//4p2ZY7ZjSlnJQazXM4Pp0sSgl9YJ/xRMh5VYraE/Qt8VBO4oAR9K5srm/dRu+1C0Oe3XOG7tFwPf1sHFlrjv5Af6kWH6O2kFXd9QqbGo4QVA/fW0R48MjIzKeuFVRMbZpkrdyOUTj5z2iPrH7i6ASYbX8hug66plO4HnXg8hg39UmsOb36wUyQB3F5zPfiyCJeQlxSArNNSfVtQBcaLvoCWuzQzry1JeQ7B6FhZb1K12qylyjcBkCNc9cFsqVbeCN7G8W+1Mm/KgPqdvxufkbtr7KZMJfmme4wWD4HwbzGthWNvYc7kZ4xGntsP1FKNi7hjgmMrv1Yww6NHPEGPySTGcnGrAJiyG+5CdWjA2fuvXhOZYCSx+JvkMkAYKA28siGWADEkOsJupJps8QCGttIPFHA8QFdvukVQHZZcDfTGOpWdmjmk+jEcQdK6k8BV0A1UZRYGpI9mHQGhh4v1pJBrjKYh0kE8WwAkpURDv0Rep35uo6alA6mFSSzGZ8F0Vchz6qSBniXYNC+yD5SVLpSbs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(10070799003)(1800799024)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?czR4aTRudnY4bXBMVmYwNHpXclQwZFRja3hWS3Bia1RNOW0vMEFYR3Byc0ZD?=
 =?utf-8?B?OGwwd1VKZGROMTBzM3JlQ2cyeVd3cmlGdkhSUUpkU1F0YWYzMDFIU1haZ0ZQ?=
 =?utf-8?B?NDNmTWFVNXJSTnFwS0F4Z0E4MGo5WWVGYVAvM3ZmMlRhWitaeHNvbkxzeE9P?=
 =?utf-8?B?TnZGRzRYNTlmV0NrZG9adFQyVVBIWlhhL2FEZ3g5VVA2dUV0SlNqNWpvb015?=
 =?utf-8?B?YVRBN0VBdXlkOW8vZUZpa0Z0ZGdwVGNCVXp2VWhGaHZBbDZkRlBjQWkrZUU0?=
 =?utf-8?B?dk1xZkkxR2ZwdFdrdTR0K0xOYTV0bkdsSGoyYVJaenh5dUJobC9Qb0dPTDN1?=
 =?utf-8?B?aDRVU0E2Rkl1Z0hnQ1ZTOS9QVXJUNTUzcnJuNTZ0ZjBpVDNXMEwzTEMwN0Jn?=
 =?utf-8?B?NTd1L2NlZGdySkxsR1RmQ0VxZlJaZ1FRZ2Fwa1JkZENrdnloTzQvdjFJVE5E?=
 =?utf-8?B?US9IYUllZjZna3RMYkt5Y3JESHlsR2ZxOTdpN1lMck5kSkN1TWJTNzJyRGRY?=
 =?utf-8?B?NE9jL0ZnbzA1U2phbUlXQkMvMmJpNnVrQkcyOTE2MElJelZ3cklBVnI5MFFY?=
 =?utf-8?B?VlowN3FRSXdEWHdvZWtHREw4YlZYaXRlT0o3U2k2V09ZTjlXTXN0d2pIY09m?=
 =?utf-8?B?SDJ2NXNNMnBMaVh5SG4xQ2NJUlJrL3JXMWFYZ0MvNEpTRGl5K2lOZHFhVThm?=
 =?utf-8?B?WXFtVkZJOHNUREhmcUNxdFBJNWV5M1V6Y2dQREJuTkVySEhITE54YjRCUDJN?=
 =?utf-8?B?SE1kdmhmUmc5Q2JhbFF0aUdTTDBCNUxoLzVydFpWcHY1N2FvMHFURGVXZ3hX?=
 =?utf-8?B?THBzQUhBSUlpL1M1TncrbHk5YmZnU3pPaFpwb0hBR3huZFM4T2tQdTh6blU3?=
 =?utf-8?B?cEQxTWx1Vno0RFk3SzdTSzk5MkovcVlQWmYxTmhMam9GSHpoYzM0UWRUTG5P?=
 =?utf-8?B?bG9uUFR0M2h0TXlNZ2g5cjZuaWcwanhzUTM1QWFUbm5jV2RpM2RpVWdKMjJF?=
 =?utf-8?B?L2JveFBEYjlOWTJ4aEhvek13SmNleVBhR0NwTGdXRGVaRXdNclRuY3J4MVhn?=
 =?utf-8?B?NFltN1RYOWorZFdPa2Z2MWdDZmNRL3BoNlRqUFpvbzJCcFVGM2FWMDhod1Ar?=
 =?utf-8?B?MHBLM210Z0JPUVpvSnFhMFNQTmdDcFJNYlMrc3lGTjdxWmxlTE9RRXkycURx?=
 =?utf-8?B?ZVNiS2cxYVc1Z3BDUGhWeWV3VE1XNk5lR003ZUVuMW1vZ0VTV3dvNHV3YVlS?=
 =?utf-8?B?cW9wbHVQWnFpcnFZSHJYS09wN0VuR2pORjZ5aDR5dTkxVmpHQmdEVCtJR0p3?=
 =?utf-8?B?bUs5a3lWQTBpWnhtSCtXMjlmNXpqK0JIaTRmUDVodXVORmJuUzg4bmNiK0xm?=
 =?utf-8?B?eSs1Vk5KWlRNTnpBK0s0M1lQRStrNStvOElDWXY2U1hPNHZoUE16NGhBN2s0?=
 =?utf-8?B?VFoyTzdWb0doSkZmSk84cnJERjdLMjE5d2tVaTNVV1NHNkwyMXY3eC9FSXdY?=
 =?utf-8?B?NWswRXdkK3lZMkNoeSt2eWpNWFVZV21sdlZhcUdoMUhKWnplK1Z1Njg0bDdl?=
 =?utf-8?B?QnltQXZjcDBtUTZ1WUtYRjkxYzFWaHdjVnFIdjNQdkx4SEFkVk8vVHN3V3Uz?=
 =?utf-8?B?MldjUEs1K0Rqd05LV3FuNFUrbUJKekZYZ09FMnZDNGtVb0NkRTR3K0VKN01X?=
 =?utf-8?B?Q2RjeERHRGh4bG9wNEFkakd0R0dnQmJHcVJScXhod3R0aGFBUExMa3JmbTI3?=
 =?utf-8?B?WU5RdWNjUW9raXpPQUFyTWN6MEtwMkxlaTVLbEJKbXIxM2tnMTZra25VZi9X?=
 =?utf-8?B?SkgxblV2cjJtRjduUEh1MHVKVllqN1hyd01SbmVicGI2dVBOTGVGdE1FcUFy?=
 =?utf-8?B?cGVTdDBJaS8rSHFtdDJvTXNQNUwrV2pnQnA3aWRKRktHS0swTmpZcWFPYVNz?=
 =?utf-8?B?MkJSSzFhamYxcDhvNHp3eWJ4aXg3Z2g5OWNPOTA1QVcvY1MzM0ZnaHF4ZzBO?=
 =?utf-8?B?MUt6cGpzZWpPcVNTOGxQTlhMRlA5RUw3UEYwNHFSWWdsR2hJaHBYZk4yMFRE?=
 =?utf-8?B?U1V4SHZ2UC9zblNRaTdoRTlSdTZnL0JjWHdvN3ZMT1hPTWNMSHpJN083VW5E?=
 =?utf-8?B?N082MWxnUG5ENmEwc2lTTEFWeCtuNk5EWHZPbDNDelZsNEt2OGR1L3dXYUpO?=
 =?utf-8?B?MjFNZjhnSytOWFlhekFoeHFwMnlqV3JnUGtrUW53cVNVZE9pcElYU09EODJE?=
 =?utf-8?B?TGQ3Q1RKOWs4cUhOdXVFWXVXZnl5eEhWUk5BSHowZFV5aXV0THdleWdUVjhP?=
 =?utf-8?B?NFd1NGtOMEl0QTEyd3AxS3RkN0lhTkUvNWNBaFgvcURIV3FrR1BDLzlZS0lk?=
 =?utf-8?Q?1X4YiH9zZQ6JtYLskSIsEGpFXhWWSGKiuiHvcrH7dfivF?=
X-MS-Exchange-AntiSpam-MessageData-1: fhMQWQF877482g==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56a706c4-262e-4eb4-fad8-08de785303a5
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 11:58:27.5656 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1IoaolQ0uz7MyxwY3kAv9fU2umI0j22QjItzYJXpfr6gdY55Xt6MZRjmqF1K+YlOnT1LJNMkXNXhdZxixZWuQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR12MB9827
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
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email]
X-Rspamd-Queue-Id: CE8BD1D7F42
X-Rspamd-Action: no action

Hi Joel,

On Wed Feb 25, 2026 at 7:53 AM JST, Joel Fernandes wrote:
> PRAMIN apertures are a crucial mechanism to direct read/write to VRAM.
> Add support for the same.
>
> Cc: Nikola Djukic <ndjukic@nvidia.com>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>

I have two sets of comments for this patch - one that is immediately
actionable, the other that depends on the availability of the new `Io`
interface. Let's start with the actionable items, I'll do the discussion
about `Io` in another email.

> ---
>  drivers/gpu/nova-core/mm.rs        |   5 +
>  drivers/gpu/nova-core/mm/pramin.rs | 292 +++++++++++++++++++++++++++++
>  drivers/gpu/nova-core/nova_core.rs |   1 +
>  drivers/gpu/nova-core/regs.rs      |   5 +
>  4 files changed, 303 insertions(+)
>  create mode 100644 drivers/gpu/nova-core/mm.rs
>  create mode 100644 drivers/gpu/nova-core/mm/pramin.rs
>
> diff --git a/drivers/gpu/nova-core/mm.rs b/drivers/gpu/nova-core/mm.rs
> new file mode 100644
> index 000000000000..7a5dd4220c67
> --- /dev/null
> +++ b/drivers/gpu/nova-core/mm.rs
> @@ -0,0 +1,5 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Memory management subsystems for nova-core.
> +
> +pub(crate) mod pramin;
> diff --git a/drivers/gpu/nova-core/mm/pramin.rs b/drivers/gpu/nova-core/m=
m/pramin.rs
> new file mode 100644
> index 000000000000..04b652d3ee4f
> --- /dev/null
> +++ b/drivers/gpu/nova-core/mm/pramin.rs
> @@ -0,0 +1,292 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Direct VRAM access through the PRAMIN aperture.
> +//!
> +//! PRAMIN provides a 1MB sliding window into VRAM through BAR0, allowin=
g the CPU to access
> +//! video memory directly. Access is managed through a two-level API:
> +//!
> +//! - [`Pramin`]: The parent object that owns the BAR0 reference and syn=
chronization lock.
> +//! - [`PraminWindow`]: A guard object that holds exclusive PRAMIN acces=
s for its lifetime.
> +//!
> +//! The PRAMIN aperture is a 1MB region at BAR0 + 0x700000 for all GPUs.=
 The window base is
> +//! controlled by the `NV_PBUS_BAR0_WINDOW` register and must be 64KB al=
igned.

s/must be/is - it's not like that hardware is giving us a choice anyway
since we cannot even express a non-aligned value in the window register.

> +//!
> +//! # Examples
> +//!
> +//! ## Basic read/write
> +//!
> +//! ```no_run
> +//! use crate::driver::Bar0;
> +//! use crate::mm::pramin;
> +//! use kernel::devres::Devres;
> +//! use kernel::prelude::*;
> +//! use kernel::sync::Arc;
> +//!
> +//! fn example(devres_bar: Arc<Devres<Bar0>>) -> Result<()> {
> +//!     let pramin =3D Arc::pin_init(pramin::Pramin::new(devres_bar)?, G=
FP_KERNEL)?;
> +//!     let mut window =3D pramin.window()?;
> +//!
> +//!     // Write and read back.
> +//!     window.try_write32(0x100, 0xDEADBEEF)?;
> +//!     let val =3D window.try_read32(0x100)?;
> +//!     assert_eq!(val, 0xDEADBEEF);
> +//!
> +//!     Ok(())
> +//!     // Original window position restored on drop.
> +//! }
> +//! ```
> +//!
> +//! ## Auto-repositioning across VRAM regions
> +//!
> +//! ```no_run
> +//! use crate::driver::Bar0;
> +//! use crate::mm::pramin;
> +//! use kernel::devres::Devres;
> +//! use kernel::prelude::*;
> +//! use kernel::sync::Arc;
> +//!
> +//! fn example(devres_bar: Arc<Devres<Bar0>>) -> Result<()> {
> +//!     let pramin =3D Arc::pin_init(pramin::Pramin::new(devres_bar)?, G=
FP_KERNEL)?;
> +//!     let mut window =3D pramin.window()?;
> +//!
> +//!     // Access first 1MB region.
> +//!     window.try_write32(0x100, 0x11111111)?;
> +//!
> +//!     // Access at 2MB - window auto-repositions.
> +//!     window.try_write32(0x200000, 0x22222222)?;
> +//!
> +//!     // Back to first region - window repositions again.
> +//!     let val =3D window.try_read32(0x100)?;
> +//!     assert_eq!(val, 0x11111111);
> +//!
> +//!     Ok(())
> +//! }
> +//! ```
> +
> +#![expect(unused)]
> +
> +use crate::{
> +    driver::Bar0,
> +    num::u64_as_usize,
> +    regs, //
> +};
> +
> +use kernel::bits::genmask_u64;
> +use kernel::devres::Devres;
> +use kernel::io::Io;
> +use kernel::new_mutex;
> +use kernel::prelude::*;
> +use kernel::ptr::{
> +    Alignable,
> +    Alignment, //
> +};
> +use kernel::sizes::{
> +    SZ_1M,
> +    SZ_64K, //
> +};
> +use kernel::sync::{
> +    lock::mutex::MutexGuard,
> +    Arc,
> +    Mutex, //
> +};
> +
> +/// PRAMIN aperture base offset in BAR0.
> +const PRAMIN_BASE: usize =3D 0x700000;
> +
> +/// PRAMIN aperture size (1MB).
> +const PRAMIN_SIZE: usize =3D SZ_1M;
> +
> +/// 64KB alignment for window base.
> +const WINDOW_ALIGN: Alignment =3D Alignment::new::<SZ_64K>();
> +
> +/// Maximum addressable VRAM offset (40-bit address space).
> +///
> +/// The `NV_PBUS_BAR0_WINDOW` register has a 24-bit `window_base` field =
(bits 23:0) that stores
> +/// bits [39:16] of the target VRAM address. This limits the addressable=
 space to 2^40 bytes.
> +const MAX_VRAM_OFFSET: usize =3D u64_as_usize(genmask_u64(0..=3D39));
> +
> +/// Generate a PRAMIN read accessor.
> +macro_rules! define_pramin_read {
> +    ($name:ident, $ty:ty) =3D> {
> +        #[doc =3D concat!("Read a `", stringify!($ty), "` from VRAM at t=
he given offset.")]
> +        pub(crate) fn $name(&mut self, vram_offset: usize) -> Result<$ty=
> {
> +            // Compute window parameters without bar reference.
> +            let (bar_offset, new_base) =3D
> +                self.compute_window(vram_offset, ::core::mem::size_of::<=
$ty>())?;
> +
> +            // Update window base if needed and perform read.
> +            let bar =3D self.bar.try_access().ok_or(ENODEV)?;

Ouch, we are calling `try_access` for every single read or write
operation. Thankfully we can do without this - see my comments on
`PraminWindow` a bit later.

> +            if let Some(base) =3D new_base {
> +                Self::write_window_base(&bar, base);
> +                self.state.current_base =3D base;
> +            }
> +            bar.$name(bar_offset)
> +        }
> +    };
> +}
> +
> +/// Generate a PRAMIN write accessor.
> +macro_rules! define_pramin_write {
> +    ($name:ident, $ty:ty) =3D> {
> +        #[doc =3D concat!("Write a `", stringify!($ty), "` to VRAM at th=
e given offset.")]
> +        pub(crate) fn $name(&mut self, vram_offset: usize, value: $ty) -=
> Result {
> +            // Compute window parameters without bar reference.
> +            let (bar_offset, new_base) =3D
> +                self.compute_window(vram_offset, ::core::mem::size_of::<=
$ty>())?;
> +
> +            // Update window base if needed and perform write.
> +            let bar =3D self.bar.try_access().ok_or(ENODEV)?;
> +            if let Some(base) =3D new_base {
> +                Self::write_window_base(&bar, base);
> +                self.state.current_base =3D base;
> +            }
> +            bar.$name(value, bar_offset)
> +        }
> +    };
> +}
> +
> +/// PRAMIN state protected by mutex.
> +struct PraminState {
> +    current_base: usize,
> +}

This has only one member and no impl block of its own - shall we inline
it?

> +
> +/// PRAMIN aperture manager.
> +///
> +/// Call [`Pramin::window()`] to acquire exclusive PRAMIN access.
> +#[pin_data]
> +pub(crate) struct Pramin {
> +    bar: Arc<Devres<Bar0>>,
> +    /// PRAMIN aperture state, protected by a mutex.
> +    ///
> +    /// # Safety
> +    ///
> +    /// This lock is acquired during the DMA fence signalling critical p=
ath.

nit: s/signalling/signaling

> +    /// It must NEVER be held across any reclaimable CPU memory / alloca=
tions
> +    /// (`GFP_KERNEL`), because the memory reclaim path can call
> +    /// `dma_fence_wait()`, which would deadlock with this lock held.
> +    #[pin]
> +    state: Mutex<PraminState>,
> +}
> +
> +impl Pramin {
> +    /// Create a pin-initializer for PRAMIN.
> +    pub(crate) fn new(bar: Arc<Devres<Bar0>>) -> Result<impl PinInit<Sel=
f>> {
> +        let bar_access =3D bar.try_access().ok_or(ENODEV)?;
> +        let current_base =3D Self::try_read_window_base(&bar_access)?;
> +
> +        Ok(pin_init!(Self {
> +            bar,
> +            state <- new_mutex!(PraminState { current_base }, "pramin_st=
ate"),
> +        }))
> +    }
> +
> +    /// Acquire exclusive PRAMIN access.
> +    ///
> +    /// Returns a [`PraminWindow`] guard that provides VRAM read/write a=
ccessors.
> +    /// The [`PraminWindow`] is exclusive and only one can exist at a ti=
me.
> +    pub(crate) fn window(&self) -> Result<PraminWindow<'_>> {

The name of this method is strange - we don't pass the base of any
window area. It looks more like it is actually acquiring the `Pramin`
for exclusive access.

Also fun question: what happens if we try to access an area above (or
below) the available VRAM?

> +        let state =3D self.state.lock();
> +        let saved_base =3D state.current_base;
> +        Ok(PraminWindow {
> +            bar: self.bar.clone(),
> +            state,
> +            saved_base,
> +        })
> +    }
> +
> +    /// Read the current window base from the BAR0_WINDOW register.
> +    fn try_read_window_base(bar: &Bar0) -> Result<usize> {
> +        let reg =3D regs::NV_PBUS_BAR0_WINDOW::read(bar);
> +        let base =3D u64::from(reg.window_base());
> +        let shifted =3D base.checked_shl(16).ok_or(EOVERFLOW)?;
> +        shifted.try_into().map_err(|_| EOVERFLOW)

This function is actually infallible.

The `checked_shl` cannot fail because we are shifting a `u32` by 16,
which will always fit into a `u64`. There is some `Bounded` code
incoming that will allow us to prove that safely, but it is not
available in `drm-rust-next` yet. For now can you use a regular shift
operation with a TODO to convert to `Bounded`?

The last line could use `num::u64_as_size` to do the conversion
infallibly. But actually the window base is native to the GPU, not the
host CPU architecture - so it should really be a u64 anyway.

> +    }
> +}
> +
> +/// PRAMIN window guard for direct VRAM access.
> +///
> +/// This guard holds exclusive access to the PRAMIN aperture. The window=
 auto-repositions
> +/// when accessing VRAM offsets outside the current 1MB range. Original =
window position
> +/// is saved on creation and restored on drop.
> +///
> +/// Only one [`PraminWindow`] can exist at a time per [`Pramin`] instanc=
e (enforced by the
> +/// internal `MutexGuard`).
> +pub(crate) struct PraminWindow<'a> {
> +    bar: Arc<Devres<Bar0>>,

Cloning the `Arc` is what forces us to do a `try_access` on every
read/write operation. Needless to say this is overkill and not
efficient.

The `PraminWindow` already holds a reference to its `Pramin`, so you can
just call `try_access` in `window` and store that. This turns `bar` into
this:

    bar: RevocableGuard<'a, Bar0>,

And now you can perform operations on `bar` directly without needing to
acquire it every time.

> +    state: MutexGuard<'a, PraminState>,

I'm wondering whether we should remove the `Mutex` from `Pramin` and
make its methods take `&mut self` (and this would thus become a `&mut
PraminState`).

The rationale for this is that `Pramin` will be owned by `GpuMm`, which
can implement its own locking policy (including across several of the
items it owns) as it needs. That way `Pramin` also stays "pure" in that
it only needs to care about abstracting the hardware.

> +    saved_base: usize,

What is the point of saving and restoring the original position?
`Pramin` gets exclusive access to the PRAMIN area, and whenever we make
an access through the window the base address can be reprogrammed. So
it's not as if the original value has some particular meaning or
constitutes state that deserves to be preserved. Getting rid of this
behavior also lets us remove the `Drop` implementation.

> +}
> +
> +impl PraminWindow<'_> {
> +    /// Write a new window base to the BAR0_WINDOW register.
> +    fn write_window_base(bar: &Bar0, base: usize) {

`base` should be the native type of the GPU, i.e. `u64`.

> +        // CAST:
> +        // - We have guaranteed that the base is within the addressable =
range (40-bits).
> +        // - After >> 16, a 40-bit aligned base becomes 24 bits, which f=
its in u32.

This function does not guarantee anything of the sort - even the caller
doesn't, this actually relies on the behavior of `compute_window`,
another method.

You can enforce this limit by using a `Bounded<u64, 40>` as the type for
base addresses. There is even staging code (not yet in drm-rust-next
unfortunately) that will lets you turn it into a `Bounded<u32, 32>`
safely to be written into the register.

> +        regs::NV_PBUS_BAR0_WINDOW::default()
> +            .set_window_base((base >> 16) as u32)
> +            .write(bar);
> +    }
> +
> +    /// Compute window parameters for a VRAM access.
> +    ///
> +    /// Returns (`bar_offset`, `new_base`) where:
> +    /// - `bar_offset`: The BAR0 offset to use for the access.
> +    /// - `new_base`: `Some(base)` if window needs repositioning, `None`=
 otherwise.
> +    fn compute_window(
> +        &self,
> +        vram_offset: usize,
> +        access_size: usize,
> +    ) -> Result<(usize, Option<usize>)> {
> +        // Validate VRAM offset is within addressable range (40-bit addr=
ess space).
> +        let end_offset =3D vram_offset.checked_add(access_size).ok_or(EI=
NVAL)?;
> +        if end_offset > MAX_VRAM_OFFSET + 1 {

If we are going to use `MAX_VRAM_OFFSET` like this, let's define it as
`1 << 40` and turn this into `if end_offset > MAX_VRAM_OFFSET`.

> +            return Err(EINVAL);
> +        }
> +
> +        // Calculate which 64KB-aligned base we need.
> +        let needed_base =3D vram_offset.align_down(WINDOW_ALIGN);
> +
> +        // Calculate offset within the window.
> +        let offset_in_window =3D vram_offset - needed_base;
> +
> +        // Check if access fits in 1MB window from this base.
> +        if offset_in_window + access_size > PRAMIN_SIZE {
> +            return Err(EINVAL);
> +        }

Here `offset_in_window` cannot be larger than 64K because of the line
before - this check is effectively dead code.

> +
> +        // Return bar offset and whether window needs repositioning.
> +        let new_base =3D if self.state.current_base !=3D needed_base {
> +            Some(needed_base)
> +        } else {
> +            None
> +        };

So maybe I am missing something, but aren't we writing a new base if the
requested offset doesn't fit within [current_base..current_base+64K],
despite the fact that the PRAMIN window is 1MB? This looks like a bug.

Also what happens if we access PRAMIN with decreasing addresses? Won't
we be doing more window resets than we need?

> +
> +        Ok((PRAMIN_BASE + offset_in_window, new_base))
> +    }
> +
> +    define_pramin_read!(try_read8, u8);
> +    define_pramin_read!(try_read16, u16);
> +    define_pramin_read!(try_read32, u32);
> +    define_pramin_read!(try_read64, u64);
> +
> +    define_pramin_write!(try_write8, u8);
> +    define_pramin_write!(try_write16, u16);
> +    define_pramin_write!(try_write32, u32);
> +    define_pramin_write!(try_write64, u64);
> +}
> +
> +impl Drop for PraminWindow<'_> {
> +    fn drop(&mut self) {
> +        // Restore the original window base if it changed.
> +        if self.state.current_base !=3D self.saved_base {
> +            if let Some(bar) =3D self.bar.try_access() {
> +                Self::write_window_base(&bar, self.saved_base);
> +
> +                // Update state to reflect the restored base.
> +                self.state.current_base =3D self.saved_base;
> +            }
> +        }
> +        // MutexGuard drops automatically, releasing the lock.
> +    }
> +}

Let's drop this alongside the original window base restoration, which
doesn't serve any purpose.

> diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/n=
ova_core.rs
> index c1121e7c64c5..3de00db3279e 100644
> --- a/drivers/gpu/nova-core/nova_core.rs
> +++ b/drivers/gpu/nova-core/nova_core.rs
> @@ -13,6 +13,7 @@
>  mod gfw;
>  mod gpu;
>  mod gsp;
> +mod mm;
>  mod num;
>  mod regs;
>  mod sbuffer;
> diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.r=
s
> index ea0d32f5396c..d0982e346f74 100644
> --- a/drivers/gpu/nova-core/regs.rs
> +++ b/drivers/gpu/nova-core/regs.rs
> @@ -102,6 +102,11 @@ fn fmt(&self, f: &mut kernel::fmt::Formatter<'_>) ->=
 kernel::fmt::Result {
>      31:16   frts_err_code as u16;
>  });
> =20
> +register!(NV_PBUS_BAR0_WINDOW @ 0x00001700, "BAR0 window control for PRA=
MIN access" {
> +    25:24   target as u8, "Target memory (0=3DVRAM, 1=3DSYS_MEM_COH, 2=
=3DSYS_MEM_NONCOH)";

This should be converted to an enum. I understand that we only ever want
to use `Vram` as Hopper+ don't support the other types of memories - a
single-variant enum will document that fact and force us to set the
correct value.

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mEKfCBDpb2m+UQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 21:44:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A6E4B8F0
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 21:43:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D91BB10E675;
	Tue, 20 Jan 2026 20:43:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Cw4K4NOt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012001.outbound.protection.outlook.com [52.101.53.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5A7E10E682;
 Tue, 20 Jan 2026 20:43:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yaN8hcUbY1Ux3AFWZwOLGzD5aaJij5R9V6qMvcWOS93G7sIiZ1PcXeKeCV3kS6weN2W3YcnFBko5qx+AW/+eQ1361tEQmM/1iZR3MaXqEAgjnXzU0SSHT6gkD019Oc4GLzg2Ca2ORrj6RtMuVihsRkVa1sVKm6drkcoDjUaTbwsy6J4c6zNVca/jLYexgzskHz82yAAdYpO/m8zDmtB2P4z4yfSPa9+oxraHkARzIaqBN8P41eK5JjfWZreBRVmk/8bWKM4FYsXcD5sTkD+THUSCGXoSh/5aShTmSmMK++A392vELFGMKCa68tlVJSqVLrdbxhOtKOgNs9Wrz8lvrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q7ly6TgSNWTNlrKlknPvbWXM2Dnn575SqIwcOwuE8hc=;
 b=aitd8NbCg+eKEKabYg3NjD2ydObfwTgEYhb/g37Mv+S/zdC3HHdwkDcxgqKUDs2M/75Tl8+9j/bkKnzkNRx9kC9FMUt3sqPWTaEThrC+0Dea0iKJU+eX8+ievsqt9p3aVlKLPp+yOcj6gA/eDxRlWp+eu1hof5SMFgrODM60le6JJ0IbFgHuNv9FER4DF42IgkuOGzaHxUIR3CHrvKarUkm8jJ9vPF7xCoFEVVSL6dm/DcuTho+hChXJ/bbfcZm8dY433AOrYdramGXe40rjLGKgerLSm6xIIfN9F88cTh6vqmWWASopse/QpfsKFxd5cCpYt6hRpC9JuEJ6RGSeAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q7ly6TgSNWTNlrKlknPvbWXM2Dnn575SqIwcOwuE8hc=;
 b=Cw4K4NOtD+fqTVWCssbB8Dfn/2LN9j29flZI898eQbC6zu8fju1uE57Ad1inxk+dOMpKpdkHEUhgApOLG8C8OC+KFiRygw2zXVzSXChmT7e3exb0flWmlX8L0S/a7iBcQJxvVgdqphtLPZHX7ITjSeRomOwxhHmOSP2oXPU1N9sLMErjFX/hQIkctDg5LGOhuIf0xWQJartUAEerqty8p84WEcbHvGev2DxjC/Y4qg4UTT/EAgTc2r3RegG/C8o0vamsA63rY8bC6EsAMI7jEgcig8cj1wHxTZJktXdVdTc4VIVrMuOJ4AcIr91W1Mx+AkwJCwvhFjPV+/s/3b9eYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 PH7PR12MB6809.namprd12.prod.outlook.com (2603:10b6:510:1af::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.12; Tue, 20 Jan 2026 20:43:43 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9542.008; Tue, 20 Jan 2026
 20:43:43 +0000
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
Subject: [PATCH RFC v6 07/26] nova-core: Add BAR1 aperture type and size
 constant
Date: Tue, 20 Jan 2026 15:42:44 -0500
Message-Id: <20260120204303.3229303-8-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260120204303.3229303-1-joelagnelf@nvidia.com>
References: <20260120204303.3229303-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN0PR04CA0003.namprd04.prod.outlook.com
 (2603:10b6:208:52d::15) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|PH7PR12MB6809:EE_
X-MS-Office365-Filtering-Correlation-Id: cfb68622-fac3-44f1-23fa-08de586499a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZB6mw5GDkbFhNIJJdB3p/ED/pH2I7sYRWFGLA1mrX252i4DngHgbolIjddpA?=
 =?us-ascii?Q?UVfHEGNAptCnyzj0bruXHceixhCtWDdZJ/nL/l9h1qLOfZbyvWieeE1vs05M?=
 =?us-ascii?Q?n+m5z0U6Li6LJLujOzAhGXFauJE9RqIKp84KBEvdl3LY9zeeDlDmj5aMt0nJ?=
 =?us-ascii?Q?hKqSlBLkmSh8NXVGGRNJmwC5ze5C9eXXeFz6+HKUez01+zwedO6OzB4lFZr/?=
 =?us-ascii?Q?fZcE1zhjfBQKwCR0vNcj3QlF/vlLdsPyRzK2YuzWu15ioCVlDY0Tnzo0O6HZ?=
 =?us-ascii?Q?Y0MMISZGgjpT8nUMohzL5wu6mgPpQl/b6Nv15ZY8/yVwuunyCD4p/rAoJ0Hw?=
 =?us-ascii?Q?VOQMEkVmH9Vwz2GkLa51ObZ5eOFbXG0UdDPb0ybcIdyYc6APkC8aqfmpGs7U?=
 =?us-ascii?Q?X/SbschD9In6YX4KnvOBAqfS3t7V/JRQG2HsXCooRLRlVmpmduLonSM44IMd?=
 =?us-ascii?Q?8G88uDibEaQLUEye4GMlW/bYm2WsJqHZVsJx6A7u3EKC5z9cNpsQshDECjWI?=
 =?us-ascii?Q?WI1hj264GylguBQqulB1K+V6jheGRdVIe5nReDzeXdhm8vGKFL325byfGw99?=
 =?us-ascii?Q?Hh2GVBJqWRdl7HT1NlD7fp0OMVKqtf/UqV0QIa30G7KTtalfBCtv3UfS7oqI?=
 =?us-ascii?Q?OkCishxuYMgh/1858pyxZwkxlIXrKBSywSlIUB/9i0EYR5XFU7jzpW3KDzRa?=
 =?us-ascii?Q?H0ZweOoO0vBeMvkKsxnkRdkanFmd4BteOr6/d66yIgUUdtWmFfZG6Bm2fvkx?=
 =?us-ascii?Q?QWcXRV/MHCtS0rY98HedSF6wYqteMZjbtEvq2+daWbPuOq9cgtyN494XNCpy?=
 =?us-ascii?Q?beN46OZb79NsrxWLzbXQa2Q0dkPDCIO11EVZjriXBt6JAGKkarC48nrOzAJb?=
 =?us-ascii?Q?ITmFdHQCiLgWGGuyUOWPHyEv+rkKsB/DNEkvaew3KJ6m+7GHd3RaKFyMtS5j?=
 =?us-ascii?Q?b6USr3DtAkGF7zxURfb3DYfu2bCNW5iUM+TtAvk3zHiHTQTvPhXhaqbDzBzI?=
 =?us-ascii?Q?8TXOodkpYGy1EuzRruDq5SwfxSIZ9QgvTaKePpj8vEBydemdzOICwaKrHi4n?=
 =?us-ascii?Q?I113f+Uy+mXSowXjA07vBXfuSB4lGEYkelmIZZCJrehEh9i6uiAFg4Ma97Bb?=
 =?us-ascii?Q?QI9STB+31p8hm4FzzJoG2e5wfKNIOk4GaQban2u1bEwBxjkSV3ip+kYMP/71?=
 =?us-ascii?Q?z4XqsDc05VmOqlJwAZuBEo++bY/KmOnnOAlLdQxas4bJhTYPi1Jm5v58wVtk?=
 =?us-ascii?Q?RFO5jHcf6InxkhRtxzR4kbTihPYuUraQU/GHg9ivxkKVQla26c4NHM4zCv8R?=
 =?us-ascii?Q?Cz56DhUBgBmjEaGyCyQoRa1hVQBtGWtZoOKHIPD6db/OYD7WUKGi/1R8wMyD?=
 =?us-ascii?Q?7Na5/IqD9hS/0RAmt2nnRA5T8AQi6GHVx+Bx36H30aidVOipMHrOIW2qCNsv?=
 =?us-ascii?Q?/E11p4uLCrq+zvDBvspTnK4ZQRT/xsCEyvtn6Fiaj3k5of+MqTbGTVKylEh6?=
 =?us-ascii?Q?NYQr0GktqHhIEdmutmpTkAu4KFoIrwKXKW+sD8ypEPDMDzm5TRzmaryWGNT3?=
 =?us-ascii?Q?m2ZcrPMdk96tlGN/cqo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?O8KwpmAYtNNrykupqKw6Xt9t8gARh8252cbl2EyBQVby5TFcGwm3xqVdArR5?=
 =?us-ascii?Q?6RMkqAv3d0z8aLT+FMsjiRnNxH2O+WptyxLnUd36guD1apue67e6naREz3u+?=
 =?us-ascii?Q?15e/yLTj93JWYX8cJ64oKPBJhLZs0g69ygeS8Mg5BUxsv2OUwU8BMhfAiHss?=
 =?us-ascii?Q?sPCgxhkRcDsZ0KqCxrSxu8mnOSn/ntLATwGkOsIwvklvNH/GcX6IS9mpIImI?=
 =?us-ascii?Q?ga6ozCe/05h2enT6eBPKM8V3TKblVkoG4pSzXlcTV+A86W91kguzyKJEOlBU?=
 =?us-ascii?Q?euLq9PvT27AsM7TNueLkiMfvxmf14RBZnBGCwjFmxQerDHNtYt0+OBR/MoGQ?=
 =?us-ascii?Q?oH0c7I9XkHlV1Xuh6WMVLuE/q038zcnFeX3d33UrwMXMhiCaEALPUxJC0fQN?=
 =?us-ascii?Q?M7LtVtqjz2CM9xoqRutKt++vn9gPP84/cYAytGF4jtKvXyQdVyJzEiYTWBR7?=
 =?us-ascii?Q?f+P5x8mkzbMm/qmM/lSUD88+dRMQRa4qAjGHF7lVfPhQxgpOT0RPvE0VGnnm?=
 =?us-ascii?Q?Ukq0176nfcJjgTIJXJEGok2pg6PrwLcZn8T1PDIDj+QtkRLJOCmH1pZnHuTZ?=
 =?us-ascii?Q?fruKko4WFeRSy05CO+xXP/mucT2tJNggDwCzqgj3L+1KB68Q7lRk8hzYVj9j?=
 =?us-ascii?Q?KC7AA8KrZxP/3zKE9jo+gAd7jD+TwWfcpT9NUu7p1h+VjmLRf6eaC6fk3fbT?=
 =?us-ascii?Q?oWOY8+4xV+U7dNB+KxMxG8iwDgHOFAwrK64v1NCXvpvt11O4RUuwamVjPPVG?=
 =?us-ascii?Q?1hv5jTgAaU3shb/G3JvDTG1+oSmIMr96M48ihieNYZZW/oVyMEWa8sMWZ6dO?=
 =?us-ascii?Q?93Qa/ws+EDYCXnh1F78hUVyKlI/E+YUZAriLJKb4c0urEZHqWM4wqslU3sQY?=
 =?us-ascii?Q?nrzwXpL41xxHuhX+eptenl+lYqUI6+GzArBCPbyOSM7k0TJgqAqiOoJ/k62K?=
 =?us-ascii?Q?08RPAou9yZPuLz3fADtchhTIpFk9VMz61m8Ypw8p4C4G+2tF6AjuUlizFH6p?=
 =?us-ascii?Q?JVyk+yillo+VWS7AS+t5+t5lKyVnzQCsnBPOC8NPJFuhuUG9MDcY7DIUUU3a?=
 =?us-ascii?Q?ipl++/W82qwuqowHEyNuLQZ1ck0xBs69JXKG6U3gRfe6DEAcNp28+A2yV2OD?=
 =?us-ascii?Q?2tvuEJINgu6/jyHSoSF+vpFe+V6PNmj7LaBjtzWMauLsllcZNaEULhxUG8gx?=
 =?us-ascii?Q?9omlMPgi4TSGpNvQzF20G7v19JBXW0OmdhYt/rSbabu1HUOFXXlGPMNiGSED?=
 =?us-ascii?Q?yHkz9kXB5CCqNLJWve77SbXqDdreDPINekn4S+sA7UL13hkdTVzJj+ZwyPK9?=
 =?us-ascii?Q?T+OJ1iwmtP9fj+i+2CnDR/9rm80hYHnq2NrMSElv/HY8FQ3cI9gWlwvNJErD?=
 =?us-ascii?Q?xn870OVVyIxoJ7ALsWRbqFNPE+Uz71cVNMEhCHQqsoB5O0B9a5ziytvN/cLM?=
 =?us-ascii?Q?bseHzCtYfhFRpUU22yCxj9Zy8opvhUCuqUB2RbkTSfOQ21nFJsjgRTHulV46?=
 =?us-ascii?Q?mBQ6Vn93SaWaSJc8ptLMRLsydEZJNKsLcIadS8Cpu3sVaqihiKrTFqOiAgtl?=
 =?us-ascii?Q?R6FYkMzTYnE5ivqeMO544MsU/rjQGQh88zjNjc5jwrbto77jT4yDytva+wW5?=
 =?us-ascii?Q?HAWTXbUT2MX9ugTQIKBttQLXXPhrumT+QutEktjPhjStEUZtzzeFKo8Ib/qB?=
 =?us-ascii?Q?JAicMjfkxAJOAEGGMONeiWypOX6f1d2YPAiUANP4xCEZBbN+Mk7Ce07wF9U1?=
 =?us-ascii?Q?LElRG0w0jw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfb68622-fac3-44f1-23fa-08de586499a8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 20:43:43.2688 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bRlhax3AxS685VFarldKvtN4n95Q5nb+6Fj4nN5P9tgIDbWqvm5BFO+KHP1gpNsK5FF8iEl93GHKN21qP9WueA==
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,nvidia.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,Nvidia.com:dkim]
X-Rspamd-Queue-Id: C5A6E4B8F0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add BAR1_SIZE constant and Bar1 type alias for the 256MB BAR1 aperture.
These are prerequisites for BAR1 memory access functionality.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/driver.rs | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index 5a4cc047bcfc..d8b2e967ba4c 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -13,7 +13,10 @@
         Vendor, //
     },
     prelude::*,
-    sizes::SZ_16M,
+    sizes::{
+        SZ_16M,
+        SZ_256M, //
+    },
     sync::Arc, //
 };
 
@@ -28,6 +31,7 @@ pub(crate) struct NovaCore {
 }
 
 const BAR0_SIZE: usize = SZ_16M;
+pub(crate) const BAR1_SIZE: usize = SZ_256M;
 
 // For now we only support Ampere which can use up to 47-bit DMA addresses.
 //
@@ -38,6 +42,7 @@ pub(crate) struct NovaCore {
 const GPU_DMA_BITS: u32 = 47;
 
 pub(crate) type Bar0 = pci::Bar<BAR0_SIZE>;
+pub(crate) type Bar1 = pci::Bar<BAR1_SIZE>;
 
 kernel::pci_device_table!(
     PCI_TABLE,
-- 
2.34.1


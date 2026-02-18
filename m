Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KCqJJGwtlmmlbwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 22:21:48 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC80159F0F
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 22:21:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DCBA10E635;
	Wed, 18 Feb 2026 21:21:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="LLxCETzc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010005.outbound.protection.outlook.com
 [52.101.193.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6159010E656;
 Wed, 18 Feb 2026 21:21:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ixwrc/i/oSiiOIDkxjBkV4JjFaZk4wqOr8F+oTFeqzHPiKeh1W1AuWSYh7WGk90LpjxKlBwO614L4eioWVsJbOhyAViPyeXMyZ6v/XT85fCM8eu5ctssvsdoL4XKHnKeJ5UUCrJpkcypqiKLw+yUoxsO7Z78R+JbxvElh0E/XlPFuli1dMLe/2KcR9yHoG0cd+U4WQBPho2jYt7pQh4b4kbJoVSr0T76CHJeEVICWyda3ZDDaItdV588jjo5K1P6SYuhnKAu+VoZMBn9Q0kMr8IB/eYGlBq4DJn6yZsnHhaIws1yp8kI6Y+yykAZPqkHzSGJdgzsbO7YpY3bs9zgNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AP/tTN8kLDgeIPbQETr9YklpKScVQYyx7Sl+BIJMw9c=;
 b=G0Z6/bCGoqoSFVFIgD06zlvly+IvxL1JHV4HxFjFtQPqb5yFAmaUL6mMvMzYFID+5Iu35421eKvD1WydqrAngF3+fS0cPMvTTU1lCqwjqk0NKGo5er7izXBu2/RsHi6qruiko5ft5xcGqnZr7f6330nj1Ox4yTMrrCmYO14q1OaQImBjwVEXgIN9wv6M1ohKkI/Y7DqhMhVaicYBDR2zC7qejEb2c6ugfBVIliLALPcI4U6dBWeWmitjskjnem0EWhIxWrGhslSD0t09Lo7QcmfKLpMmalq6sbkb2b6v2gEx2XHGBmnMrApgwKtmQ5AwVbU1fVNnD+53yoNCooSeuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AP/tTN8kLDgeIPbQETr9YklpKScVQYyx7Sl+BIJMw9c=;
 b=LLxCETzcQ8FuRMK/ECN9ZL+Akdh2f6KRYSgjrLhYpfsEIIKuf5ikPVHFOUTrscPrMi+S0eUeSA+IUNmuXmY5YR+thbGxDm5/urNSNoOclewfQgyT4YC0e/lBhOkrTSaluYcQjBBaLgdUMKXbeMz38n1CzFF0VjXhS92zAJZx4R+xGr/Khtz30Jxb0v39F/SlTP+t3hENkF2RENI/XFcIDLLe4G/6ykv7mn8nlGBTa41YEomrlkwiZW/me/ASOSECmq9amTjQs4Vf9USMV03XI5Rk5RuG0ATAsMy1FYJadAuCDEeliw5l8M3Fp6uAAMkH4/QFy57F+1k89B1X6uTGng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 SJ0PR12MB6805.namprd12.prod.outlook.com (2603:10b6:a03:44f::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.16; Wed, 18 Feb 2026 21:21:36 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 21:21:35 +0000
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
 Zhi Wang <zhiw@nvidia.com>, Balbir Singh <balbirs@nvidia.com>,
 Philipp Stanner <phasta@kernel.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Eliot Courtney <ecourtney@nvidia.com>, joel@joelfernandes.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Joel Fernandes <joelagnelf@nvidia.com>, Nikola Djukic <ndjukic@nvidia.com>
Subject: [PATCH v7 19/23] nova-core: mm: Add PRAMIN aperture self-tests
Date: Wed, 18 Feb 2026 16:20:16 -0500
Message-Id: <20260218212020.800836-20-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260218212020.800836-1-joelagnelf@nvidia.com>
References: <20260218212020.800836-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR20CA0066.namprd20.prod.outlook.com
 (2603:10b6:208:235::35) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|SJ0PR12MB6805:EE_
X-MS-Office365-Filtering-Correlation-Id: 57f46851-7e4b-4824-adeb-08de6f33b232
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YSHcc+cUIz62bAxLlPjf/9hbwK08QI3zc6M0xhQRlkYvDjwA+NLRoliUF+Kn?=
 =?us-ascii?Q?5EFXdfCQrJTf5JlkSufhdj/ejJhcsBmWItIfcMoH8BL+mwps0EzgPsywDKiB?=
 =?us-ascii?Q?5Fg/7BFHhbyJl6oKk7Ic2w1XkVL5xXendJ/ROLM/wLSzswBy4gXs9kivBPBV?=
 =?us-ascii?Q?Yi/rkGRCmgm4mrPqFk3Hibuc/Aw35ld97OWc1Szw19eihF14ZMqA2rP3s689?=
 =?us-ascii?Q?zOh9N0MNz3xLygBDyOBlJYXHBFz3qRvqCfroqxyq/dU4GLpltie+J/kLlNUX?=
 =?us-ascii?Q?BViq5grO2jbIKLLv/5Kr7urE7DUlbH9fiu9BnpbeOX/Vg0FkBHxMDDcOKGqo?=
 =?us-ascii?Q?0cutgIbfLgl6WRKa3nCAaIw8UTDGAO3IlosZvLzSA3jKtbFuq5zj5ZiJPHIU?=
 =?us-ascii?Q?rz00d2WM7GPSP/DIbOeqp8dRVQ+hlM8cIeXqm0XMXa65z2jSoNK+WGOsJ6fg?=
 =?us-ascii?Q?ui28sdmobGFmqo+dEyrvhul0qNvLaB9xkeA/dJLchOVtMhkki+M4VTmGhP49?=
 =?us-ascii?Q?ULYq9sripQ/YIdBEQbfydL/A2VJR9eZZ1BLRHM+go9+HL4Bw+/RbLZoPolfb?=
 =?us-ascii?Q?jQLKfz39yx7xU2UuyuOJr8LP6RR/u4ys6pU6REHXK2jNIEEOTIjoZj2Lr5pN?=
 =?us-ascii?Q?9PeEZ3qC/fPrXwm3kjAam4CdpDyfyi2Xu5sw6yAw70llulmFzkK7+WJEOIOx?=
 =?us-ascii?Q?PPk4zNERl/ZPqS5ZwaZlE2+gLYtMKCJS9t/sk+3sae5FbSo6dsCR7Rg6y6od?=
 =?us-ascii?Q?mJ4NltJIq4ZWfv0UJ2G1uLdIS5vBWEmTVsWcZ3uoz6F2ItoNgPaS2JYTnmHS?=
 =?us-ascii?Q?oMxHYlj/jYq65mwXvWRhowm3w7kz+qZ6YXhhm4o0eTDvyYdPC1H10jQZcgXC?=
 =?us-ascii?Q?V4ZBv1faF1EDBfORlYfzY8MoMOVt1lFqFyEINOwUOXf20UQ6UDH/CKEuyN8d?=
 =?us-ascii?Q?YjPaKQJGx9DWJqw1ZXt+aBk5uFeh2ysPj2Q0IIeRtBKY3cGwLKfhAZTSCPhT?=
 =?us-ascii?Q?KdpIqonbn/rLDmPYEOJ0An7LCz4OKGn0e4Jae/P/m8vIP3lhxHU7Gh8GDwdi?=
 =?us-ascii?Q?41yJW8dVzgc0SczoxATQJxALF1eub0er5y8JzlQzsrikg3g8dbB4aP1WhGqI?=
 =?us-ascii?Q?Y3yAJ2vBuAPcYGqzySdPS3kemCSVxVHpiN8IMsBt4mt4p/0xiCZI/a8YxJtB?=
 =?us-ascii?Q?TLk9Xd51blyBNi5zEultYKUua3Rieg38V8F5+ouVdNiuZcqPGd3aPPtMX+3f?=
 =?us-ascii?Q?hEnL6KUspevuMN01K251VIPqxfCIlxdlTWsXjNYSi+WN044ocmdqobS1fCOP?=
 =?us-ascii?Q?+yD0LWY+NveYLRLE9FmFa6Aoq9syryEWSvrTPjVvySxbCnRTprhpX0QwamzS?=
 =?us-ascii?Q?K3l6BhfpbOSZTKFpnU5kmudqt4xWeki03PFKDdlAkMoJUb5Ezj2Pf1zwaLTy?=
 =?us-ascii?Q?Q7NBePTmk79pHkn/SVQVbYNgwve9p0a/RSmdIbEyOKrZISdHo8EPUwp1ImaN?=
 =?us-ascii?Q?2wCk03OrsuiOAfsXGfSU08lpJ2WXhWDyeIK/L/8moWgbwxtxGTdgxqHFUtHX?=
 =?us-ascii?Q?O41/DoTnzCa2JvUESdA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?w9j8jlv5xKSdyRyvzZCGD328NJVsA/fUqwpZZ6kZm+7sLe1pnedBC6sfYddg?=
 =?us-ascii?Q?OQUrx6kdHMIhNJxOaR6sKtgHSEYlq/L/+z6L557w+RFBXbINI8z4linoFFHh?=
 =?us-ascii?Q?Uf/oCLKs9FAd8JszEcDIuENouEG9YgRdedryOtxloG4ZPSy2dAzf9nAs5DNH?=
 =?us-ascii?Q?PQjENaPOsOO3hsTDSroRULiMHUCGHw0w/uleRGbDogadQvc4IwCJp77o2gRj?=
 =?us-ascii?Q?j3TEPAlIfkQsOKzDOnyQeuL43+zTHmLw+fXj9V9/piAPzA1AWPvdvrn4Cr1Z?=
 =?us-ascii?Q?KpkawLCj6A6fTEN9v0ZoHEpDu2HQGG10AfCKeV4dMKstOPa4Dq7BsQaQhO6I?=
 =?us-ascii?Q?wQbhPl5AFbLF3NQK+I4Wfn8ZW85UUFLufZ3VWgNglVuEKgRUgjMgYIJrjvQg?=
 =?us-ascii?Q?4Z9JTT+Zz6yoRv8iXGosWt2bC5KcRkKJOVJlUC2BxYzzZDF8IM/vxwq3JXhi?=
 =?us-ascii?Q?nDwXdSyGjxcFvnELm/1AFq83FMqI5RwlrhKLoGIr9aC3nshwLbOXbIUOmC2k?=
 =?us-ascii?Q?tX48z1r7Alo5YvRxyuGd+Axfy9UTxDYLrvtJHI6PMvFDBPMsPqWKkJP/Zre4?=
 =?us-ascii?Q?4JcMXgF9E0dVIbB0v73NXoJU0Y4kWm1ezgA7JbWO0SgbScf/RU34lNKnDOkw?=
 =?us-ascii?Q?yedKzAp9mQ3WPN9PuUPu7aqhCsWFI876UlTEC9hFkxzgSuvQHBcfTB+dEfwb?=
 =?us-ascii?Q?mdB3oYb1ITQxY1IPJSxKb6arysIR36OWAxzMcRbaGOq0k71N0HwhwlW3R1eO?=
 =?us-ascii?Q?BDjlqQfMpMku07Dtkiw6mKDF1qAls7giE95v0W3pC0VET4X4JrBzx8ylPDth?=
 =?us-ascii?Q?NrTFfO+92HakMDBPbuI2RIjR+Xh645OGAVQ6bTiL9PWK92SVM46U5vqdUACh?=
 =?us-ascii?Q?/4r9mBrmz32CTrNTf1kuHv6bbJ498LqgbQvh/3vP4Y45pYqHc2fqK1AlZGfl?=
 =?us-ascii?Q?3RslDfUE4mGt8Y5uG32LUj/VdjU6d18lCiNTMKNW9T175Jfs+rbgeIdkQd68?=
 =?us-ascii?Q?7vPJSToLsjKY4o9tLToVn/wigUZsIfhnE4rdnwKMzier4F0LM8MO6CyElia8?=
 =?us-ascii?Q?sFIMmH6kPu9a27SynrIvT2TaurtghHebEupT/ro51wJuOc2IqI3Amf101Ve/?=
 =?us-ascii?Q?g9LGKR5Gge9JsVsuw6pZeazpHOdrCJAjrU7TOP5DaA7qd64LtqQxwCECQLt7?=
 =?us-ascii?Q?DU4C5+cZaY5eKe0NJvovwMhUkDk8snQsxKCcYKHbjDALHM8qDryLdaZvp+ya?=
 =?us-ascii?Q?vph79LbDk0LqLuY563WHMTunizD3yyr2qzgObLw44K1aR5vS+GoQwvepCVkc?=
 =?us-ascii?Q?iWw1qO1l/a7jHpuU6oa2UA5056kaLZXFZ7EEKadJZS+O2sjIWK8ltUEAE7GX?=
 =?us-ascii?Q?+yjgN+hos9lE/Gl8TPXKYILBz3jFlIjur0bZeH1e8DLY6Oeg61LCNPAzJ1M6?=
 =?us-ascii?Q?yAt+e8xtQetlgYR4uvIH+tboblQ6pSy7HZB1r8x62GT3jSZz2XscnlguuHnG?=
 =?us-ascii?Q?NI9TimJo7w9DFZEIf4IDGilcef38CS0TXburgIWNY9xdw7MuqGoHYgOQjtbK?=
 =?us-ascii?Q?wgaz+Yh4DC4L2y5ZbUsx50MsfwQjEfFRhLfiZd+qUb8454Uarsb10mTl13C/?=
 =?us-ascii?Q?VDMvXr7HLu33cJGYPtp7tJrTqexHtFLXbFPq6chxjlgv5CAoHxq48XMM85Zs?=
 =?us-ascii?Q?PaByK3ZzGjDTAHwoibTHp0AWzHhJE2DN/TRpq9nIgZ3VHbHNJKn1NUQaL29f?=
 =?us-ascii?Q?6tuzXzft6A=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57f46851-7e4b-4824-adeb-08de6f33b232
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 21:21:35.8778 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cuM+aOZW0US//qjK0af7J+Xd8aYFhOTkMHqi9Ui09e3lvl/uSdy/uKavZUsfZuI5JYgbOKF0syqVP3Hjyobp7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6805
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,garyguo.net,protonmail.com,umich.edu,nvidia.com,weathered-steel.dev,collabora.com,joelfernandes.org,lists.freedesktop.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	RCPT_COUNT_GT_50(0.00)[53];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 3EC80159F0F
X-Rspamd-Action: no action

Add self-tests for the PRAMIN aperture mechanism to verify correct
operation during GPU probe. The tests validate various alignment
requirements and corner cases.

The tests are default disabled and behind CONFIG_NOVA_PRAMIN_SELFTESTS.
When enabled, tests run after GSP boot during probe.

Cc: Nikola Djukic <ndjukic@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/Kconfig      |   4 +-
 drivers/gpu/nova-core/gpu.rs       |   3 +
 drivers/gpu/nova-core/mm/pramin.rs | 161 +++++++++++++++++++++++++++++
 3 files changed, 166 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/Kconfig b/drivers/gpu/nova-core/Kconfig
index d0d4177adb1b..35de55aabcfc 100644
--- a/drivers/gpu/nova-core/Kconfig
+++ b/drivers/gpu/nova-core/Kconfig
@@ -21,7 +21,7 @@ config NOVA_MM_SELFTESTS
 	depends on NOVA_CORE
 	help
 	  Enable self-tests for the memory management subsystem. When enabled,
-	  tests are run during GPU probe to verify page table walking, and BAR1
-	  virtual memory mapping functionality.
+	  tests are run during GPU probe to verify PRAMIN aperture access,
+	  page table walking, and BAR1 virtual memory mapping functionality.
 
 	  This is a testing option and is default-disabled.
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index f17bf1bf0b12..af5a0ffe78aa 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -338,6 +338,9 @@ fn run_mm_selftests(
 
         let mmu_version = MmuVersion::from(self.spec.chipset.arch());
 
+        // PRAMIN aperture self-tests.
+        crate::mm::pramin::run_self_test(pdev.as_ref(), self.bar.clone(), mmu_version)?;
+
         // BAR1 self-tests.
         let bar1 = Arc::pin_init(
             pdev.iomap_region_sized::<BAR1_SIZE>(1, c"nova-core/bar1"),
diff --git a/drivers/gpu/nova-core/mm/pramin.rs b/drivers/gpu/nova-core/mm/pramin.rs
index 77916f5b231e..da98208b9cb7 100644
--- a/drivers/gpu/nova-core/mm/pramin.rs
+++ b/drivers/gpu/nova-core/mm/pramin.rs
@@ -291,3 +291,164 @@ fn drop(&mut self) {
         // MutexGuard drops automatically, releasing the lock.
     }
 }
+
+/// Run PRAMIN self-tests during boot if self-tests are enabled.
+#[cfg(CONFIG_NOVA_MM_SELFTESTS)]
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
+    let pramin = Arc::pin_init(Pramin::new(bar)?, GFP_KERNEL)?;
+    let mut win = pramin.window()?;
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


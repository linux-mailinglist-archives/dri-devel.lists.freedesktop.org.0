Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBLjAwLpb2lhUQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 21:43:46 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9224B849
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 21:43:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7D4910E1B1;
	Tue, 20 Jan 2026 20:43:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="sbUStwFZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010011.outbound.protection.outlook.com [52.101.46.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7617889A88;
 Tue, 20 Jan 2026 20:43:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c+c2ynfxhxN1wXuNK7Lo9iqWYr/RnGSWNpaASfOpgmbzANgGRLuRSq+n1aWMViCvgPckTRmkGV0F74ptZdVg9/T5ALVjVAubU80lMQWpWAIRmW0ur460SQp83syfDPyI7qOBsnh+D/tmnP7AYBi3aW0p1i7Dd4BBVm2xBpRri2r59g1vjfVTLL/Wo536MmWxcRJUGJvpp4T6/PeOSC3Wt0rOUGG0RSGeB5OQg+kRdauI8x9R2NabUcEmHGVPcQUAxX45opJvZ9re3NU3r8qh77HJC4KZrzp8DqIYJ0fMnjMnyc5W7eckIqZwO0O5iFe49D3DGIgEfyAoT/U/Zu7rZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xtKPhHlXHiR4eFexAEWzJ5B8T9yswuJuyjA8Ay54ViE=;
 b=Cg641JB0ybdNJnzvQ66/GtohpwFKgdNi4Pdl9dhgH+530Bi6Xm93rb/Ba8egtLyVNJxbNJfiwv6GsvsinpcQylHVjfUlOlakBYBT4X8rSufHR7JWRRmosUBBKyhc/xYO/HdpISG1Prz272WxGPDCfcjPcHopxzbpbJC8V6iXhqFh4rYgL6jLAoEv/0NB0VVyDi4iVvX2vm+UxPzA7oqxd0XtzZvUn/yROcuwxnq8tjoE9dU5V7pUDKQQWQLpjQMEalmIs0tP26Mt731ZIey6qK6XKxhMLXefoXa2bmpq++yPzSL4o6aMcLShcunA4vGWBlcF71gOq/jELPwnPK1qpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xtKPhHlXHiR4eFexAEWzJ5B8T9yswuJuyjA8Ay54ViE=;
 b=sbUStwFZu8o3SiMDI54IelwsVaaMpknwVwSMVWi3BXPdDwctmW1qDQDb2dHd4RCjBCDP0q+m9EZdKE3jtDMRa67FaU+786aYokwUqOSLYIn9VuUJvW/t2+cP4zYa8cXKYz9eeX1NeJjQmGAVe2w0wEjl7mX+ceojDmFfYS3Z5V551uVKFwyCbV8Trw0UT+xJLQyo7gjsLHjfspLd9ZXv8CHm+vwvEt0NNOMyz+fWrUMTJ3dMRxS1OgFBEdC8WIkOVXbUclRfUTPMEmN+N2bKqjM5MExS3rEwMJigZl5sW7FocqspxMRObs4wjcGqbVE3iR3w7s5skWontSygAjd0nA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 CY1PR12MB9651.namprd12.prod.outlook.com (2603:10b6:930:104::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.13; Tue, 20 Jan 2026 20:43:34 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9542.008; Tue, 20 Jan 2026
 20:43:31 +0000
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
Subject: [PATCH RFC v6 00/26] nova-core: Memory management infrastructure (v6)
Date: Tue, 20 Jan 2026 15:42:37 -0500
Message-Id: <20260120204303.3229303-1-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR16CA0051.namprd16.prod.outlook.com
 (2603:10b6:208:234::20) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|CY1PR12MB9651:EE_
X-MS-Office365-Filtering-Correlation-Id: bc78923e-3a70-4834-6e61-08de586492a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ev/XrEGlEiHVKAUsq0Pv+BkfEcR5p/rCPCR6vLb+3gYv93MgOAaD5Js9i+e8?=
 =?us-ascii?Q?7X0Ch2SeXKMULOdG/cReyZ5QdQ/yhjvm82mPsSib9+BNhZohU9H9s4hODXaY?=
 =?us-ascii?Q?8wlp9gQuTisyxIasoH7O3tY1UPHUBPOn5oVtd/nmrb/kJHP4iWMKY4XYETos?=
 =?us-ascii?Q?YjoHoStRKDvTEmyzTjpVDwRrhyc5Gia3UBFb/guyKFAVP6xMoFXomfoGWgE3?=
 =?us-ascii?Q?RAHyx9pjdwJ/URoYojoSzywp3lGch6gM74XgfPpCwCvSWAiMI8g0q7j+os3O?=
 =?us-ascii?Q?oHGhiZpaUDXbFjQsq/YMmV3xml17kxpvAzY+5fUg2LhvhFnz42mHLi3l6Uex?=
 =?us-ascii?Q?kr4n4YdkNm+8JkIuu5QRHcnddyCMyc90hkZhammy1+JVL6CgA7um9YouWOUo?=
 =?us-ascii?Q?EKK0Zl6iKtrrOPdgvZkzh1V3BpK40QcZMYPGQtw4tiUlFlPGtriattF27CYE?=
 =?us-ascii?Q?UVj8YuI+CzjPxeVtlUdwCirQ7qn3S2a9UEa34XJU/cjIbx2JQJR0ov61ZOr/?=
 =?us-ascii?Q?uKaU/oh3uf7GQTv7iOB1ZBe7XL7+GxxfexIUUoAYjwxCrLKpNq4YrJwVsHCO?=
 =?us-ascii?Q?dKIYdE1Pin81VOx2Z2fUdlZXrfuzhXqUZ4v3BjC824Hi+4f9SmjdquZSEGUF?=
 =?us-ascii?Q?gAQYTh26337afQw2/nM8HNMsFkuUFT32SI4u+YgkoSxU1QFfgzCNhrioiWwa?=
 =?us-ascii?Q?ao9dKH3g8X0p2Y44c8zV1yFRzWV8wH0uXxYgfaSfc5Gzv21jEqwUa4lgRKlc?=
 =?us-ascii?Q?JqO+1JvGrQyNU5vuomO9l3M4Xcq7SVIfG8KRbtBDH/LuFhXjjnzP4y0TWKSQ?=
 =?us-ascii?Q?1teY2XM0EZrtfzF4K4NGm13gG4cjO9X5XJ97z8ZJrzK84rTjDiuuaS63gJO/?=
 =?us-ascii?Q?9U7DQ92aUZSavDii1gkJ9mYn+ShBK2p0EjCFcVdLJoIM/fvligVlv6UUtgFC?=
 =?us-ascii?Q?U0jrWS6Z8wO8WZqMx06DaRqGRaqXP2kE7i4Kl8Dtqvv/SUhY19uE6/NPnan7?=
 =?us-ascii?Q?Ipa13192z0xWiwNJCI4SXWBAOvF7JGR5DVKxpPA0sZIWc435btkV+5t3ptaR?=
 =?us-ascii?Q?1r6yAF3bVBMYrNDOhlNCbeEhdNniJ8y/ZSxbavyyMisJxr5l06FojGdyyKXl?=
 =?us-ascii?Q?qWw1GJftL9oE3ooqB6AyRZKMl0ls3+SC9pxy9OpTnZk4C5w5m5yUSOgzyR7q?=
 =?us-ascii?Q?kt7DqMyjGSfvRW7HHDogSVMe7gChFp3/Eaj2MArdIEYZI3X/I9flIUVHrZqk?=
 =?us-ascii?Q?nqqedzhJ1s/VZuqI+2uFzWO7Llp843MY7/RgIfVIE6TD7oC8BmaJBetEicBh?=
 =?us-ascii?Q?dUKizezOea0znrtWjoJpth4B+wzLoKnmubA9yeEFAAMvm4uSKfI8h2T5cmoJ?=
 =?us-ascii?Q?jdGSExWpZQgHU3uVeEspgfgMMFMJ7dYGe3jdPHcql6rprrSdEfvNk84PPnUN?=
 =?us-ascii?Q?hqPY2qWhU+SPqrlxT06e7+hPb/HtdiNJ0VB7aPIgIPmXVec5CKq1pXl3kGQW?=
 =?us-ascii?Q?NQEH62n03ao65tUAMg2t8Xl1ABFpFtob8pqdTezbm4B8wfuyL2Pyps/RczUL?=
 =?us-ascii?Q?puUBoFLchyGDLgO84gI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8Rd/oEP+Jpg6UfecLKwInF7/58ogpgOyU77WGga5d3X106WTAYjgaJnY64Gx?=
 =?us-ascii?Q?6n/kdL271QVZI8/9lJKQi8gIbX1efK+u2UwD9gKfo4s1dqxFVyqLxVFnpO52?=
 =?us-ascii?Q?TY8mIFAFpZdUQ0H4Pqk+Mlxu3cs/nVEwGDRxkcdi6CJfhiLfZobHqQHrQ0Mf?=
 =?us-ascii?Q?zbABsrKRjl8h+DAMq0zj83rBy6nxz+U6nBXeuW6cC/erHNarWVot4MsiVaXh?=
 =?us-ascii?Q?hFr8tZq9WILSJv7667GuxOaQCZ4hn1PziNqCpvRh+hE7/MoOnTgomMQV4NHw?=
 =?us-ascii?Q?jSdkzq/63U3A2PMmf4lSbhXC7pjVftXeTzEBSy3SuKRkRCHOobe1Vg2S/d/y?=
 =?us-ascii?Q?bGH91J7EPm4F0hU9QRXHG/XqJL/JXa2nEI8bq8ZsG9D0oSRLIgQJaDsseWtW?=
 =?us-ascii?Q?DAa86dmgCT5UrRDNe/Ig5kppFDjLkLPDKlNJFGHVdiWc7TRTXFYwPYI91VCd?=
 =?us-ascii?Q?3aIBwhqaOb55NRzBVlvBYE5VsSzpxH2RUlSRiQsiA4BR5deEgxgNCDZncljq?=
 =?us-ascii?Q?vpEO5H1NmhGvRPBUR4naV16hes+0iOsdoJ01bpJ5hGZgaKlQhEJ1RliUw9sW?=
 =?us-ascii?Q?1mBDSsSxKTx6PaphALdpNE68/dlwGX0oZ+M3Mh3YPC38RHWEStirvdrOCd4N?=
 =?us-ascii?Q?e/7AclMzeamdJT35hxdPziZBWkokqERpt4JEykw0Fxo01hCEgw+M9ETfvQiH?=
 =?us-ascii?Q?u6VLRAAscF8jd6XCMJVs9i73vLWGzwoi8JRED/mnRiHGtzs1wMNQHpMQhn9H?=
 =?us-ascii?Q?C3FKlK2K8IaBinYq3Rs18yNX2R9FGexYa2oZKUVzakunmlVHEvsRcHcf6Zpm?=
 =?us-ascii?Q?LM3RjGPq7SL1InHEkebn3UG/xt9c+VXWGUMHOizZqpRbuIXM1IQsyzsaUuMU?=
 =?us-ascii?Q?pFfm0rDCXcxb0tSMVL54utSzGQaYToatuMtswgRE8Hp9/mUI4l+tUdSh5N3R?=
 =?us-ascii?Q?qTkyQselSDlp5qxYz6ehZVuw/VpGIsPVWOevq42/NZw6RIcTlKcBMAJoN7h7?=
 =?us-ascii?Q?I9qKwCFusYLi4BStBzu9MROzMylI5KhVcxdeCiFITBOZ5CCEsKFKBQogFRZn?=
 =?us-ascii?Q?j9gyV+aRRrK3cWJjPPSVnk2LupVSuBNE5e1y4zcov20AYPncrbnvwMcZMfH/?=
 =?us-ascii?Q?N3P6AWvW2nP8Z2mu2knEnYrUtV9v3EjwwM3Jcn/VfdjhjLGDiI2PCgtZ7mB5?=
 =?us-ascii?Q?8ocPTU4/uWtfe6brynsRHuWKhk+oN4+AuC+8XH/T3KSM38Z7ffOqOW0wvO4A?=
 =?us-ascii?Q?KiwF3lzLqF6YgBMUdSEjIXXtNgykJXh0qXqYkqN0MJ4hs2P5rOOSEyFlxn+Y?=
 =?us-ascii?Q?ru3Imd/g9BTbtLZ+r53952/hrn9WRQVwfMZswOYN3kt6ZTJB8csHsXL9cPT9?=
 =?us-ascii?Q?3KyJla/hO9Y4nlTr1KzmcIqt6Ik0bip2mECJL5GFuovBidFoG8gpVIO6Rsy7?=
 =?us-ascii?Q?i5Zm9tWEMwXk7PTNXZyuW+mVOnGjGz9YUT6IXDavi+QSiC5JvI9WCteDruNa?=
 =?us-ascii?Q?wrDbTVgnPPLfyDWt7KBa04Fd/79eTrjGYmct1pmCswCv+PuPw+3VU2xFNrRR?=
 =?us-ascii?Q?zkj66tht7WQi1XqhUNSZNkWaAQ1FRh3Jhxru9TIVMDTkSeSHqVH3y9sSTGMg?=
 =?us-ascii?Q?n1BHziwlTE+IRDY7/bPJopsSM4fDM/lGLNopJh11t3TX6QDqNk/LAHjFmB/5?=
 =?us-ascii?Q?51oWKr20KlaVcaqswieIP7ODZnkBcUawlIgSwaPOXLe3MYRqkDq5iYKJsovt?=
 =?us-ascii?Q?25Gb/nIaug=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc78923e-3a70-4834-6e61-08de586492a5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 20:43:31.6288 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /0VO2MA1vLunoUubHBgQeVqFDyn1h743J3RLxLD/RNrkebJkbKyfbTMY6L87fhchUIBFcsUbrB/TBnBoL2bULQ==
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,Nvidia.com:dkim,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: AE9224B849
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series is rebased on drm-rust-kernel/drm-rust-next and provides memory
management infrastructure for the nova-core GPU driver. It combines several
previous series and provides a foundation for nova GPU memory management
including page tables, virtual memory management, and BAR mapping. All these
are critical nova-core features.

The series includes:
- A Rust module (CList) to interface with C circular linked lists, required
  for iterating over buddy allocator blocks.
- Movement of the DRM buddy allocator up to drivers/gpu/ level, renamed to GPU buddy.
- Rust bindings for the GPU buddy allocator.
- PRAMIN aperture support for direct VRAM access.
- Page table types for MMU v2 and v3 formats.
- Virtual Memory Manager (VMM) for GPU virtual address space management.
- BAR1 user interface for mapping access GPU via virtual memory.
- Selftests for PRAMIN and BAR1 user interface (disabled by default).

Changes from v5 to v6:
- Rebased on drm-rust-kernel/drm-rust-next
- Added page table types and page table walker infrastructure
- Added Virtual Memory Manager (VMM)
- Added BAR1 user interface
- Added TLB flush support
- Added GpuMm memory manager
- Extended to 26 patches from 6 (full mm infrastructure now included)

The git tree with all patches can be found at:
git://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git (tag: nova-mm-v6-20260120)

Link to v5: https://lore.kernel.org/all/20251219203805.1246586-1-joelagnelf@nvidia.com/

Previous series that are combined:
- v4 (clist + buddy): https://lore.kernel.org/all/20251204215129.2357292-1-joelagnelf@nvidia.com/
- v3 (clist only): https://lore.kernel.org/all/20251129213056.4021375-1-joelagnelf@nvidia.com/
- v2 (clist only): https://lore.kernel.org/all/20251111171315.2196103-4-joelagnelf@nvidia.com/
- clist RFC (original with buddy): https://lore.kernel.org/all/20251030190613.1224287-1-joelagnelf@nvidia.com/
- DRM buddy move: https://lore.kernel.org/all/20251124234432.1988476-1-joelagnelf@nvidia.com/
- PRAMIN series: https://lore.kernel.org/all/20251020185539.49986-1-joelagnelf@nvidia.com/

Joel Fernandes (26):
  rust: clist: Add support to interface with C linked lists
  gpu: Move DRM buddy allocator one level up
  rust: gpu: Add GPU buddy allocator bindings
  nova-core: mm: Select GPU_BUDDY for VRAM allocation
  nova-core: mm: Add support to use PRAMIN windows to write to VRAM
  docs: gpu: nova-core: Document the PRAMIN aperture mechanism
  nova-core: Add BAR1 aperture type and size constant
  nova-core: gsp: Add BAR1 PDE base accessors
  nova-core: mm: Add common memory management types
  nova-core: mm: Add common types for all page table formats
  nova-core: mm: Add MMU v2 page table types
  nova-core: mm: Add MMU v3 page table types
  nova-core: mm: Add unified page table entry wrapper enums
  nova-core: mm: Add TLB flush support
  nova-core: mm: Add GpuMm centralized memory manager
  nova-core: mm: Add page table walker for MMU v2
  nova-core: mm: Add Virtual Memory Manager
  nova-core: mm: Add virtual address range tracking to VMM
  nova-core: mm: Add BAR1 user interface
  nova-core: gsp: Return GspStaticInfo and FbLayout from boot()
  nova-core: mm: Add memory management self-tests
  nova-core: mm: Add PRAMIN aperture self-tests
  nova-core: gsp: Extract usable FB region from GSP
  nova-core: fb: Add usable_vram field to FbLayout
  nova-core: mm: Use usable VRAM region for buddy allocator
  nova-core: mm: Add BarUser to struct Gpu and create at boot

 Documentation/gpu/drm-mm.rst                  |   10 +-
 Documentation/gpu/nova/core/pramin.rst        |  125 ++
 Documentation/gpu/nova/index.rst              |    1 +
 MAINTAINERS                                   |    7 +
 drivers/gpu/Kconfig                           |   13 +
 drivers/gpu/Makefile                          |    2 +
 drivers/gpu/buddy.c                           | 1310 +++++++++++++++++
 drivers/gpu/drm/Kconfig                       |    1 +
 drivers/gpu/drm/Kconfig.debug                 |    4 +-
 drivers/gpu/drm/amd/amdgpu/Kconfig            |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c       |    2 +-
 .../gpu/drm/amd/amdgpu/amdgpu_res_cursor.h    |   12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c  |   80 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h  |   20 +-
 drivers/gpu/drm/drm_buddy.c                   | 1284 +---------------
 drivers/gpu/drm/i915/Kconfig                  |    1 +
 drivers/gpu/drm/i915/i915_scatterlist.c       |   10 +-
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c |   55 +-
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.h |    6 +-
 .../drm/i915/selftests/intel_memory_region.c  |   20 +-
 drivers/gpu/drm/tests/Makefile                |    1 -
 .../gpu/drm/ttm/tests/ttm_bo_validate_test.c  |    5 +-
 drivers/gpu/drm/ttm/tests/ttm_mock_manager.c  |   18 +-
 drivers/gpu/drm/ttm/tests/ttm_mock_manager.h  |    4 +-
 drivers/gpu/drm/xe/Kconfig                    |    1 +
 drivers/gpu/drm/xe/xe_res_cursor.h            |   34 +-
 drivers/gpu/drm/xe/xe_svm.c                   |   12 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          |   73 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h    |    4 +-
 drivers/gpu/nova-core/Kconfig                 |   22 +
 drivers/gpu/nova-core/driver.rs               |    9 +-
 drivers/gpu/nova-core/fb.rs                   |   23 +-
 drivers/gpu/nova-core/gpu.rs                  |  140 +-
 drivers/gpu/nova-core/gsp/boot.rs             |   22 +-
 drivers/gpu/nova-core/gsp/commands.rs         |   18 +-
 drivers/gpu/nova-core/gsp/fw/commands.rs      |   38 +
 drivers/gpu/nova-core/mm/bar_user.rs          |  336 +++++
 drivers/gpu/nova-core/mm/mod.rs               |  209 +++
 drivers/gpu/nova-core/mm/pagetable/mod.rs     |  377 +++++
 drivers/gpu/nova-core/mm/pagetable/ver2.rs    |  184 +++
 drivers/gpu/nova-core/mm/pagetable/ver3.rs    |  286 ++++
 drivers/gpu/nova-core/mm/pagetable/walk.rs    |  285 ++++
 drivers/gpu/nova-core/mm/pramin.rs            |  404 +++++
 drivers/gpu/nova-core/mm/tlb.rs               |   79 +
 drivers/gpu/nova-core/mm/vmm.rs               |  247 ++++
 drivers/gpu/nova-core/nova_core.rs            |    1 +
 drivers/gpu/nova-core/regs.rs                 |   38 +
 drivers/gpu/tests/Makefile                    |    3 +
 .../gpu_buddy_test.c}                         |  390 ++---
 drivers/gpu/tests/gpu_random.c                |   48 +
 drivers/gpu/tests/gpu_random.h                |   28 +
 drivers/video/Kconfig                         |    2 +
 include/drm/drm_buddy.h                       |  163 +-
 include/linux/gpu_buddy.h                     |  177 +++
 rust/bindings/bindings_helper.h               |   11 +
 rust/helpers/gpu.c                            |   23 +
 rust/helpers/helpers.c                        |    2 +
 rust/helpers/list.c                           |   12 +
 rust/kernel/clist.rs                          |  357 +++++
 rust/kernel/gpu/buddy.rs                      |  538 +++++++
 rust/kernel/gpu/mod.rs                        |    5 +
 rust/kernel/lib.rs                            |    3 +
 62 files changed, 5788 insertions(+), 1808 deletions(-)
 create mode 100644 Documentation/gpu/nova/core/pramin.rst
 create mode 100644 drivers/gpu/Kconfig
 create mode 100644 drivers/gpu/buddy.c
 create mode 100644 drivers/gpu/nova-core/mm/bar_user.rs
 create mode 100644 drivers/gpu/nova-core/mm/mod.rs
 create mode 100644 drivers/gpu/nova-core/mm/pagetable/mod.rs
 create mode 100644 drivers/gpu/nova-core/mm/pagetable/ver2.rs
 create mode 100644 drivers/gpu/nova-core/mm/pagetable/ver3.rs
 create mode 100644 drivers/gpu/nova-core/mm/pagetable/walk.rs
 create mode 100644 drivers/gpu/nova-core/mm/pramin.rs
 create mode 100644 drivers/gpu/nova-core/mm/tlb.rs
 create mode 100644 drivers/gpu/nova-core/mm/vmm.rs
 create mode 100644 drivers/gpu/tests/Makefile
 rename drivers/gpu/{drm/tests/drm_buddy_test.c => tests/gpu_buddy_test.c} (68%)
 create mode 100644 drivers/gpu/tests/gpu_random.c
 create mode 100644 drivers/gpu/tests/gpu_random.h
 create mode 100644 include/linux/gpu_buddy.h
 create mode 100644 rust/helpers/gpu.c
 create mode 100644 rust/helpers/list.c
 create mode 100644 rust/kernel/clist.rs
 create mode 100644 rust/kernel/gpu/buddy.rs
 create mode 100644 rust/kernel/gpu/mod.rs


base-commit: 6ea52b6d8f33ae627f4dcf43b12b6e713a8b9331
-- 
2.34.1


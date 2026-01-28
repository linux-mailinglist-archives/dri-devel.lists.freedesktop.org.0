Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qHxpDcYEemlE1gEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 13:44:54 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF61A177D
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 13:44:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1403210E6CD;
	Wed, 28 Jan 2026 12:44:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="hPIWJE9s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013051.outbound.protection.outlook.com
 [40.93.201.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5012810E6CF;
 Wed, 28 Jan 2026 12:44:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z+lYGgLsS6XcD4yn2N57SS56NCvanO1z3jGL3oBGUv4GNAW4LZNQIu0UowakPZnDMl8sPJLpL0ZEvISDYZiJSClQ84fBPSJ4Jws7kS0AjEjfz03aIhnBOjJ06unlrVL/oCfKZ8jl1EfwSxFb/5/op/0q8z3/ESatzPHOC1FLhWN3+PCkdT54J5+dwd7xngjAV7HiGyZvdF9I30mH0M6f1yewxXOiS6T3sCMtOwdQuC3hWW08mERqw8RIH0vVYrTYhgkL0JGg2taXJBDu5ehoUJ17PMw3dYFmGdwTWDO93CPis6Pbz9qiEDGmdNnVsb1nTjZsCkOrofs/xKLKZI2F7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s0D0uxLPAApM+DLvGr1aKRFdjBdf4g9N89FDZJFLRLs=;
 b=B1TWZ0USESJCmHJ8r0FPdL8TlU4rVAbneEafeKk8jnMCN/Ud9eYIiI2mTZcZGY37PIjI0Ne0dZrCghtn6uVcCERf1lBTsVUuYI3RvXCxtLYQmgvENAUwu6JRaggk/EEOHESuJj0orEyS9sPYeoOnAvFq1td+msAMDMmpG3P/+uaXHOBzFZlnFEBA6KRo2ezColz/GEKJam3JB/u53eouAAHJiQRz7ar/A8A4NmxZ1667qH8PCMyLAT5EN8FkCI+qa1jo3NPnUePq32d/nMMfXyEviZ76wDEcc8R6TwtpZgp2rp5Sa4Ui5BOJ7NpjqOojpgzMXsV60KgPpfTV+WtMzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s0D0uxLPAApM+DLvGr1aKRFdjBdf4g9N89FDZJFLRLs=;
 b=hPIWJE9sCUuguA4iH6OvQKeoOCDHdXDHZsUtZBnYWHtt6hpjqhDWrgxdkvcSb8peG4HmVAWYBRn2Wwkd9lOSSay6x9Ae0xlZHHxDv8gao9mvwHAm7Til9sCU9gpvAAZLWTj4x7ClVgNcRlmMqPJQgf8HLXbE3gA6QEQluLW/h6/EFGH4Wb30yrjsCb/Ro15XPE5elt2c6eA8nZMqT1RZZQVnshW0/A7cKMr9hbV9DHQg7RcirfM3Zm/xqX29xZh1PfTwgDvI2HT74DpGiCa8GtwRydfNWiBEs8Hy5bZGzxhFqZeGw0422T+b5D3T0Sf5+tJdHz4cgvN8gndyZr6LmA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 IA1PR12MB6601.namprd12.prod.outlook.com (2603:10b6:208:3a3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Wed, 28 Jan
 2026 12:44:36 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 12:44:36 +0000
Date: Wed, 28 Jan 2026 07:44:34 -0500
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Vivi Rodrigo <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Rui Huang <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Helge Deller <deller@gmx.de>, Alice Ryhl <aliceryhl@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 Bjorn Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, John Hubbard <jhubbard@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
 Andrea Righi <arighi@nvidia.com>, Andy Ritger <aritger@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Alexey Ivanov <alexeyi@nvidia.com>,
 Balbir Singh <balbirs@nvidia.com>, Philipp Stanner <phasta@kernel.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH RFC v6 00/26] nova-core: Memory management infrastructure
 (v6)
Message-ID: <4540DD73-77BA-45F0-B686-32EB96402717@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DG06XUWOJLO5.1ESB8ES6A6081@kernel.org>
X-ClientProxiedBy: IA4P220CA0008.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:558::6) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|IA1PR12MB6601:EE_
X-MS-Office365-Filtering-Correlation-Id: 687689d8-90ff-4223-8106-08de5e6afe97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RWV74g88gNMSyxN3Zr9O2iIdB09EU9FD/mzZHgWwiwV0OJX5r9ku1dJZnnJG?=
 =?us-ascii?Q?e/0Dua5r0XomtFSLfwNfE8YsClfYZdKlMl33vFsmqEWy0m5CoxUKms+GNnyp?=
 =?us-ascii?Q?iVVaYBDg98oo3riYO/lZ6DttPQPDEwBGvwYoVuJvYGjI0q+IfhFfvpCaFAfI?=
 =?us-ascii?Q?d7uHf/R4hApsFhAC2Fm+hz5bPM6OycXmKxN/rIl0v1pAodAElWmn5335Vz6A?=
 =?us-ascii?Q?VL94EJgiY7imXXDwlM72YFlPAzZHJFt4MWlhUt90SFPmopyOGwDlPrPGB7YZ?=
 =?us-ascii?Q?PqAXpu2BMdatENhnpOJ8UmVXkFheZF9h+PaCKdZByq4mz8rB6c7HEU9/Gh0t?=
 =?us-ascii?Q?TPQlVQx/FcWMd3/i60ZQVaCFK+ldX5NM7MH2Wq7O9kuySEzFPW0/ipK0DE4H?=
 =?us-ascii?Q?lg7q1/Iy7xAkDmPs+o5rzOvinykh+YzAf2/xnJyckqTeLBkbrdBhPnFVROv4?=
 =?us-ascii?Q?yQTbBw/Cx45PZADlGqMedz8Ih1d69GJij/P1HTTK4JNdHq1JWT6auWx7nXuX?=
 =?us-ascii?Q?4pQNRAb7UGShZNXwYguzEmHUp4XhWcv/mhOe8Dmh9y8vWUc5ewViMEPVTW5J?=
 =?us-ascii?Q?Dkt+Hm8p16yYInmL+kpId8DBQkvejY8FhTJwWPOSkPI+6nup9vWIl56RB4Di?=
 =?us-ascii?Q?w2PCAVBYc935J7Ic0ErBZ6lOVtQmJWVHbv7xl7W2pCnWKd+D0OhGfv7kjkwk?=
 =?us-ascii?Q?dl7buLpZRyt7aNrWvL+p2nTlobUaMrdlhdkKwhmo0+EBbvE95eAffqzXp17R?=
 =?us-ascii?Q?LlrFtgQmjb4OXFlxRA4p95CcECIycNqrz3OgXbkgbw7p0E4BNWawOXY5s67v?=
 =?us-ascii?Q?l2hbf2OT27XNMpNK1ZqOkip+lq81HoeMO2sAQSETIvOnllaQ8P7GoFzU7IAN?=
 =?us-ascii?Q?B1bPOqi1YJJcOrRoO5HwUlyK9Oz223SCHXpOLR/V1i+l7NS0uy4F2gdUI2xf?=
 =?us-ascii?Q?DkLiKX24dGuF2PKNcuK3tqhqTk3V3rzf5Z/VeWcPaqzCwbo8KqelltxLVBvm?=
 =?us-ascii?Q?n7Fapv3TXtnR0b4fVEc+f3FoxIothhpPxI0GDKz2YgbUFtwgb8wKa24xV1rZ?=
 =?us-ascii?Q?heIQpU9Wo6CoI+ELTUzuwNF5mAT1VctHvJ3MKXFk5WBcaP6Dw/czwYAfecqf?=
 =?us-ascii?Q?sVkK2fAGddsCl3e1LLNaMIBg4Dy/8PF3jqkQjYhQ63VTxLB5mc5x+V3i8/ik?=
 =?us-ascii?Q?cHkTqIcI2f1BlitJDqdOES61IMwGJhK0/DwFwaFQwozN4f6DlR5B0SIPXuIr?=
 =?us-ascii?Q?/ezy5blGa6tsLd6gVyOoqffD/yiLCm+y3CNL+gIT8R8/GydLyFzibAXO9uAj?=
 =?us-ascii?Q?MV1YkxqbhlA/VDJTzGS+zm7vTvboWWPM/3DLwp67ixZ3nf2NcT7pfDFK+VBq?=
 =?us-ascii?Q?VoDSepVuvi5uNS4HbcZSV1mRSAM0jBKlQpbnW6ZYtw51n/SpClijarD2JhJX?=
 =?us-ascii?Q?dsU530OWhVAKHfIJ4RGHSnc69UT8WWMQX3VNOLCPuwNpnKX1fCBr0sfidhox?=
 =?us-ascii?Q?VQ44sVkJaXCn3EJpv7oIMCgQ9WEh0JfEd5N1yZ9c9bYeesP8yj+kCgKwaNde?=
 =?us-ascii?Q?ppYefjVH7g2s7OkzcS0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cYzKhfqtlJRPBrru+1hwTzU0psHZ5AVZZpkGIDmFKfr+wTA33gBa1L06C0OE?=
 =?us-ascii?Q?vLysSBJ/6/d8SSNy278dk0nhMHeds9JjEr0pZ/HC1YQ+eGPA88R5booMXjJi?=
 =?us-ascii?Q?TJ2ndX5UeSMWLD4zofZ64YbobuMlDY2zjgTeveIIA1y+vzZySTORyGb95FEP?=
 =?us-ascii?Q?ej33LnIy9PCYDVf44R0+BR94QYTnaLqeCQMv7SM1HQceu/yz3rMMe+WgZRk3?=
 =?us-ascii?Q?oO9YOpoXARnpEjbHLn7CKRbMdeHqETN2sI4rlw23E13rdRoMjGiU3ZOmy+zc?=
 =?us-ascii?Q?t1Zr2AYnGFOOye/GtHPFGIywF1ZFp8RqH2HneCaSUwS5Z/BL6qbLePZxUSIZ?=
 =?us-ascii?Q?4JbEZ2ZZ0A4NVLzXhxhzKtEJNPBoB0RfNjIpS+O3XUIWOjSJhs2UIg3+iprM?=
 =?us-ascii?Q?h7qcCRCvA86BtbfCc5I5T00ByOzjuqK3MoZyDtABv2zHVxNM/8vfDPIOf2jk?=
 =?us-ascii?Q?g2gxAYnUpNsbGKIBlwtiD0BP0j9fsO5o+VOSioznoaSaTSuYHUgWZ3PE6xA7?=
 =?us-ascii?Q?ZRoWcsfVrP+ey8jNBOXX/9HqKquwZw1ZccfMve44CpmH1ECUL0rxECFJi1x/?=
 =?us-ascii?Q?IMw0kE7Gh2Sn+iKx7vqnocELfNwEl49gui142rNU/UKFoUg4JbEYZ4bbw4Ck?=
 =?us-ascii?Q?eBkrjVmHOy6dZEJmwtJnC5cpRZSLXj0vORoDbpJWEToU8Sakj3f/RzZ5Mkd7?=
 =?us-ascii?Q?0/AoLr2V8+mvl2PRouP8I9FPPsKU+i592x1tr1W2hjeIYkstvUOBZv3Dhot7?=
 =?us-ascii?Q?8nAPHAMPCMjlPDSJKKqcYfrw/oD9w+LhnP0iDZf6ULtgyokiYOjaF4l8zxQS?=
 =?us-ascii?Q?dreP2MJCXUmiPAj+IyVkEETDVMREREehEqoeleDpueh9PGGdBeJ7GcxRLBh7?=
 =?us-ascii?Q?mlHJUfAhZzZYMPcQoIfCPcjFssmS4kANVzAPteUI1ye0UzR1v2O/b/O4RUoe?=
 =?us-ascii?Q?+cMhooLUEL3QDSNWXTns3NLDikv2G1f4jjWFDqzNDub2KThsSk5je5ymzloy?=
 =?us-ascii?Q?44V32YdaAeiEFc8UBKqQaFjGbvRyhb2nU20NHEkhJOsTiniw1/q8a3SqXswt?=
 =?us-ascii?Q?cMUwe/FGIyuqHuigAs3ztJvHfyyAjoIELsBnPtYjoeHbFNGsUl/UsBEya8ai?=
 =?us-ascii?Q?FTdeZaJuxJvyLJaftsM2tYZ2//zbe8GQLrAsu+MEic+MIf8YWXA/EOdaFAhh?=
 =?us-ascii?Q?FfhO89ftDbjyYc0827mIyCGtb4issLqf5s4aiZo7BohaCJunGQVsCBMUc4AX?=
 =?us-ascii?Q?WF4NGSX85kKlSeSnaPkLI2swJz4e7BzI5B7zAGREtXNKDVSwgBJf6FNGsTW5?=
 =?us-ascii?Q?ZPM2nKfph4dmphz+v+5DIE/zDBDSoZoMcCal95+VNuFeqdBgEbPQxxGwJcoR?=
 =?us-ascii?Q?CPCr/uM8ELB9jlD5DcGk0PgZf3IRkSNWf3B+GiotWmTILqjlYWtt+fPBadNH?=
 =?us-ascii?Q?3EPeg8DRGcURzg859wRdRwWYK4vQUz8CGCNuSpAfGVHhmwyERIBQ7iFasIUw?=
 =?us-ascii?Q?A00GcdZ+1cqH7mYVdGRIIq4bouDXYqZMFMlQIS4hOFMBW52mje09fBurAlmf?=
 =?us-ascii?Q?Yv6Lr+s5uoo+FJY4uSbp628QcsjJU2BX5HXIMPtr+DBk3A57KNM1HGj8OjaN?=
 =?us-ascii?Q?jxW/ge9UILotDnHmGdBL6EKFf/x+fW/ISIpaWm9ZLGdbK2ar2AAnmKas/1P2?=
 =?us-ascii?Q?Q/arU3UjD9jBeVxFf8wpizr1QpZF1cO24kjS7pwcktyLJL7lwx9QbKnlgxyo?=
 =?us-ascii?Q?dPjdhD2Rpw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 687689d8-90ff-4223-8106-08de5e6afe97
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 12:44:36.5743 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T0NATs37xmcxF10iglpEgvn17VPX99f1lUUwfHfVx3hGcHbrPLGNFGI/qr6AQ6FLdkh1rm4b1SUMSgV6wTymlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6601
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[nvidia.com,vger.kernel.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,garyguo.net,protonmail.com,umich.edu,weathered-steel.dev,collabora.com,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[51];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:mid]
X-Rspamd-Queue-Id: AEF61A177D
X-Rspamd-Action: no action

On Jan 28, 2026, at 6:38 AM, Danilo Krummrich <dakr@kernel.org> wrote:
> On Tue Jan 20, 2026 at 9:42 PM CET, Joel Fernandes wrote:
>> This series is rebased on drm-rust-kernel/drm-rust-next and provides memory
>> management infrastructure for the nova-core GPU driver. It combines several
>> previous series and provides a foundation for nova GPU memory management
>> including page tables, virtual memory management, and BAR mapping. All these
>> are critical nova-core features.
>
> Thanks for this work, I will go through the series soon. (Although it would also
> be nice to have what I mention below addressed first.)

Thanks, I appreciate that.

> I'm not overly happy with this version history. I understand that you are
> building things on top of each other, but going back and forth with adding and
> removing features from a series is confusing and makes it hard to keep track of
> things.
>
> (In the worst case it may even result in reviewers skipping over it leaving you
> with no progress eventually.)
>
> [...]
>
> Hence, please separate the features from each other in separate patch series,
> with their own proper version history and changelog. In order to account for the
> dependencies, you can just mention them in the cover letter and add a link to
> the other related patch series, which should be sufficient for people interested
> in the full picture.
>
> I think the most clean approach would probably be a split with CList, DRM buddy
> and Nova MM stuff.
>
> And just to clarify, in the end I do not care too much about whether it's all in
> a single series or split up, but going back and forth with combining things that
> once have been separate and have a separate history doesn't work out well.

I understand the concern, and I appreciate you taking the time to explain. Let
me provide some context on how we ended up here, as it may help clarify the
situation.

1. This is a multi-month undertaking with many interdependencies. It is
   difficult to predict which patches will come to exist, the optimal order, how to split, which series
   first, or what pieces are missing. This is similar to the evolution of nova
   itself - complex interdependencies make it hard to predict what will be
   needed. Rather than waiting months for a perfect plan before posting
   anything, I chose to iterate publicly.

2. The decision to move GPU buddy out of DRM came later in the process [1].
   This significantly changed the scope, requiring a much larger patch to
   handle the buddy infrastructure that everything else depends on.

3. The decision to separate buddy from the CList series came from wanting to
   make progress on CList independently [2]. That effort alone took almost a
   month with several rewrites based on feedback from  others.

4. There was some back and forth on whether to post code with users or code
   that could potentially be used. This influenced the decision to combine
   things into the same series to demonstrate working functionality.

5. The memory management code only became functional around v3. Page table
   walking turned out to be tricky, and I did not have a proper user at that
   time. Eventually I realized BAR1 is a strong use case for page table
   translation, so I added support for that.

Regarding splitting the series: that makes sense, I will split into CList, GPU
buddy, and Nova MM as you suggest. You make a fair point about the versioning
too - labeling new patches (even though most are old) as v6 is confusing. One question: what version
numbers should each split series use? CList was at v3 before being combined,
and similar story for GPU buddy and Nova MM. Should I continue from the last
version number they were posted with, or continue from v6?

[1] https://lore.kernel.org/all/20251124234432.1988476-1-joelagnelf@nvidia.com/
[2] https://lore.kernel.org/all/20251129213056.4021375-1-joelagnelf@nvidia.com/

--
Joel Fernandes


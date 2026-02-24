Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GCmQBu8lnmn5TgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 23:27:59 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE4F18D359
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 23:27:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A91AA10E207;
	Tue, 24 Feb 2026 22:27:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="pQDQ8n9s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010002.outbound.protection.outlook.com
 [52.101.193.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8809B10E207;
 Tue, 24 Feb 2026 22:27:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jsDiTwGyzxlryii4KY9vFprNhIAcS0O1rEieIKxAMNaHP406u4mnGRcVLiXrf9dxObeyY2sigf5bF0HDOg89r1FU338F6vdMdcuisrzVgITP6bZz3b6qiAl+HZtDATJK9lXDMY4BqSSbD9f1/CF4e0lW1bjSiayWF1HiGcXBR0C3RrzEGmtpU7hAghsRqXlMn680AQcBvLYVLX0385M69EjkidnqnSYVFiiml5GWIoACtECfxHO9rnVxSG8ruSm4twq0q5DLIoN0S2XNklmvevWlkC6PH4/rmOVuOfa+ICB9M4qOjAdNlwCciVljSUqpxnoUht7NEnKphJOAq4Fqkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4UrcmxwL+HkPLudSy5CbQmCLYE+AgG1twDbGtchtVmg=;
 b=kKAni6gzf1hhdoj1OmiYypDntGXnw6qOHPAtiAC/yGdw2TltNYxk3fA6mQolbbGcjqq/GlYCGpZQmfHARfYTDPRPaXdFTtCzsbb69739CWgUfEjVrFVrYb8QUOGSkMRpNSVAEvCKeJf6v4l4zzx18XiM1vIsObQnEWjVf8gVSSUEKlykhEeVyDBPmDk2ewauhPK7SBv97KG+YhfO303tGv1NqDA8t7/Mw3AYLQPjJXudaijAKNygiX+T0YjmKqvDUlCVXUyaXcz3bOmxKSGvTIIDgBqH+Ov4gd1725KNnqmVtjSIfQB2oMMnoqcKijdJZ/bsB+lQb6i2JHCOaY/+Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4UrcmxwL+HkPLudSy5CbQmCLYE+AgG1twDbGtchtVmg=;
 b=pQDQ8n9sSEtGNa7W0N9wCVhmTkYLjN8GIrG8pIj1F5s7ygXVMKu0Di8qc5yO91Z9pBh9eBKQ0c9RcxFyP7ByUo6Z4HDFRY2K7+3ALlMQtihljMXJZb9qvLS1ZouIkGG8zGbbd7VmYH/i0gZeTqyoDbRhSQ4gTTDgs+DeAbNoLAYHedCmaywFDBh/9+Q5RHnkr3LHTfizwtdTcT+CxnhgPmfC5q5SgyHG6f95TJXH8BjqSRnIY0xxJk+WelvYq0npTaPrj/Mw77exPCwaxF8Mmahe+dI3VkprOsvHqRE+EgfEyzhuv4qhNfcJHbIBzhwdP2l5EUSmlxDGmkHGIAcSzg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 PH7PR12MB5855.namprd12.prod.outlook.com (2603:10b6:510:1d6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 22:27:41 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 22:27:41 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Alex Gaynor <alex.gaynor@gmail.com>, Danilo Krummrich <dakr@kernel.org>,
 Dave Airlie <airlied@redhat.com>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Koen Koning <koen.koning@linux.intel.com>,
 Nikola Djukic <ndjukic@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Philipp Stanner <phasta@kernel.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>, Jonathan Corbet <corbet@lwn.net>,
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
 Helge Deller <deller@gmx.de>, John Hubbard <jhubbard@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, Andrea Righi <arighi@nvidia.com>,
 Andy Ritger <aritger@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 Balbir Singh <balbirs@nvidia.com>, alexeyi@nvidia.com,
 Eliot Courtney <ecourtney@nvidia.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, Joel Fernandes <joelagnelf@nvidia.com>
Subject: [PATCH v11 0/2] rust: clist patches for nova-core memory management
Date: Tue, 24 Feb 2026 17:27:32 -0500
Message-Id: <20260224222734.3153931-1-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CYXPR03CA0020.namprd03.prod.outlook.com
 (2603:10b6:930:d0::26) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|PH7PR12MB5855:EE_
X-MS-Office365-Filtering-Correlation-Id: a26ad792-d3ba-4d88-1d10-08de73f3ec2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5Ehk5iQWOM7VvuHW9PJrk3BzubcJmWWPbrKlYVfSrABrXSqD1Rw5DH2HAH4T?=
 =?us-ascii?Q?L6InJjBm/7DP+2cj+MI1HEI3OGPPRllmgbkp+OGHKcnSBqa4LmOwykE0M4vp?=
 =?us-ascii?Q?TC0MRhpc3ZIF8pR1XeusWjaQ6cODojm9M364vvyaqLZ03eCnX/7OET533z1I?=
 =?us-ascii?Q?+4NO14zT5CZ0W68pZ0zR39leI/0DcjKP3cHaSG8lTM6moAVjSUNPZq5owLPG?=
 =?us-ascii?Q?+/gg2W18AsS4lMVIZfEFWkrXTSOaXkKZhVlVQheXTr1E3fqvtU+oJ4F69WlR?=
 =?us-ascii?Q?bnDyqalaNZnw2x8LY2tR2OWIcSUhCt+G3rqMd1GCFNT6KaS0ByluqXnZo6zq?=
 =?us-ascii?Q?P8w0NPx45e+UwQq8vp0H7E4mJsmqORvKZnuoDaQ26Dephe+mC0tZ00zaoc1z?=
 =?us-ascii?Q?aJ5TAHkSflIa/dQ2K71PSiez4Pb+UZdGv9swG0//Py91xkb5Kzz60AFnVGYb?=
 =?us-ascii?Q?h+h2FGmv6/pz9hpQYb1EkHBGBoYeGo0cu0upHrTAXAy6DaLp4szEYjv7SGuf?=
 =?us-ascii?Q?FXXwxdo06dgy8LfbwqCntJd/2EW0UjU1eWaYBaYE0hR34tf3ZXTedidYDr4d?=
 =?us-ascii?Q?YyxsphbrYVUW22IzavewABezYh5BR1Xfn1fpu4F+3hfm7Nun0a5bgKRQsGka?=
 =?us-ascii?Q?bhp8RF5s8lVVt62txn0hs8hmoW9e9WM0tI1GZAwjG9l1QsD91sVsJwBTgRZb?=
 =?us-ascii?Q?H8/vetoseC1MFAFvKicjRlVP6eHhMye3HCAgJIaGJzMv1xRuaiOgsFAns1dG?=
 =?us-ascii?Q?mtGcaV0m9OelRmVF77Wt4kZ1SkhTyh2/RVInA+xkyjAUMZFCJ602QT2+YJMO?=
 =?us-ascii?Q?2O0sPLaXahFNeLsMap+GGtJyXnvgZAQnCCrGo3RimujTruh6cpe/12e3w/1B?=
 =?us-ascii?Q?iMRwjyVkrDBmxTsn/KysDBeICEP2fG1siIFFZs0W4n2pjH8MLQtuBg9pbusA?=
 =?us-ascii?Q?RbXyzjhDGAIp4sOdJAYsOfF7NWTEnfu37avRBsUIQawF21DE19nT9CIfgD5m?=
 =?us-ascii?Q?Haj6H936aFMd21lHFEArCx9WBpknXemnuhw4y5SlPbTjv4bHTNPKVKvjxLCE?=
 =?us-ascii?Q?uHe9vgJ8gdUODq6lPa/1FsvWXyn0QGaj6C1kAqyRwmKMqbMw/09bsMLGvVlx?=
 =?us-ascii?Q?ImZztSawd0kLrRKj3jMhbd3SZbnryEnanT+0zQBaupSnTNiEjRSJYhKjX+T4?=
 =?us-ascii?Q?NrleDhAaahMiLgX0gxkV8tnyECoPIOeXlkVQv8E4HFjKbMLk0EVljs5mC2Wd?=
 =?us-ascii?Q?+3CpO1WFWQR9O1X56Pd6ESvo86swyOKENeM9h82HG7R/U6wD73odFM8ELz5W?=
 =?us-ascii?Q?mxjFHnU8d2i+z3gFZx5XxnPCNjoWpH/QQinl0mV5B9AnHeW6d97rjmllgMh4?=
 =?us-ascii?Q?bj1l/218AuE60pj9i2nsEws7H2gF/vDJC5T4HAgL3KuPQV1K5Ywuw9fvIo1D?=
 =?us-ascii?Q?fNwVoVFKbrsB9InKMuOlsVcNKdUl4tUfp45vtJpxhv8QegTdOGN0c4WFpupZ?=
 =?us-ascii?Q?4sACFrl+Dlk5zLb5zXCxw4vXL8EkU3wo0LQikbEwFIAAlNt8Dv51No85W61T?=
 =?us-ascii?Q?LKUbGzbRi5RhsD3ZC4E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EMvGvgb+vpnySA9ehHDzxqOIylie8s6UGTah0sSpK+ZtX5U9p/Q4LqEUfB6e?=
 =?us-ascii?Q?rOjVQTOEynidNQSQGY+TfqVke8k+QXQnLJzoAXgBeaDgiKhVo4VdqytQpwVq?=
 =?us-ascii?Q?5zgMaJPj4qYMoW2SLfwwt0zgOL6Z8eq6jmQHd2kfYExyyv4+azmI1J7tpLoE?=
 =?us-ascii?Q?GoRRz7fovoZWTytuh5m6vKhHo+LEJ2xeeNuyG4qRUpnfXB7rfoJsFrhXwp5P?=
 =?us-ascii?Q?X+LABPv4Wc6B/zkik0BUwQdze5Jxw/EqXJBIwdq6BB2FVwWR9DR7WPqIwgj6?=
 =?us-ascii?Q?zTrqbvOjPN6TviKRBeX12nGtmTWWEWuclI086Z3aHza84Qdu90bqChGVDiSx?=
 =?us-ascii?Q?USNS/BwMBU5L/EDe/xTsJB1SeFQRVIfizwGbvLAzCfWI4Igd8O+dxCGVDSBO?=
 =?us-ascii?Q?7gKk7M549z4W5pFv2gs13pphccmCoAU5pvST7sDr5nvpo3dqyluBLyP0brct?=
 =?us-ascii?Q?kVo1YM9Do1N5geyFunGp4s/00831FIkl3aXgTNaZXOzFdszYIXO/Rb06YqI5?=
 =?us-ascii?Q?Ewmr2ALOtjVhGekOrTNWG/CE7xfGSGRThWoGIFmVylweZ7roQDHRF07cSk6i?=
 =?us-ascii?Q?gVqvYePd/1aLIUNsjoMcyrj27Tid4+mTbXQl4K2rvKP9lC0t23e1EqFA3tqq?=
 =?us-ascii?Q?WSG5/ap5R9aeeVa1h/cHmf8ZHWR4alBsGjN5maMZN3isVYfCXdua4F+mrPZg?=
 =?us-ascii?Q?f/woL+sFdG30R7P+qUpXEr1XIbHFEboWPWjRtlI5Om70/xTnqF26cwgeCmMT?=
 =?us-ascii?Q?W4nhPvh3lORNv0b5oP3p/aUh2aCtD3/MGH+9ME55sx1HKnVbowfI0SsILSgT?=
 =?us-ascii?Q?cZE72fAFVFRIfK6p8MMMhthwI9DBI3uga5J9ZrPCRebuRJzFVTgQuNaXvwbp?=
 =?us-ascii?Q?cLpNU2IahCiUZNSvYRZ2CpI3e/yivXxCIjUK+RhLgXLMmg0J6fsjfPSdNWgZ?=
 =?us-ascii?Q?FKMb0qCdVf3iFKhYo8EogjVC39D0QORqNnTjRM5l0/BIXvbvnyDlgdAGjwJ9?=
 =?us-ascii?Q?TlCqYaRUKr+M5p8GcxpH+0G4Fg/+RyMIFrP8andLc77n4Ew8K9TpyfdB5fd2?=
 =?us-ascii?Q?EpkQTkfr4OGGWo0us2Au613D/InnSX3L1fO+zEe3fOnACIHykBm6j2YHR5l+?=
 =?us-ascii?Q?vwW1SFl5S29Zyj5ZdgPdIH5Fnb5XyoIWuGagrMLxABlGNm5w0vd2/xeUjEQr?=
 =?us-ascii?Q?gHbxiDCb3ulhowG+Kk4IBJT9qHUDYoRdbxR0hyTo7fvVgkjO8qFs8UYGqtqS?=
 =?us-ascii?Q?Iu/YIUHcUMhWCnP3P+zCnm2vfdrdn+QgQ+8kTDHc9uxZpylLf82+G7oeQy2H?=
 =?us-ascii?Q?SYFt+Jlz+XRPe1qGgno0S+NGI++xwhBzjeBkzDfl38QdGSkf89q8kuD7bXVj?=
 =?us-ascii?Q?gsuBMWTQ8wEcdsXXhqKc5m3HiHRrM+LBDDaJIcDyUneldXCjjMa6YspVRVR5?=
 =?us-ascii?Q?9Mk6k3zgk0IWnGS7y6cLLl15J14fFPn6sM2yKhOibjOwkWcZgAgcLJBx+WfD?=
 =?us-ascii?Q?z1PBQrcmQTyZvNRL+hVAUZV2E2DXJAxeFnBBFM9MKCZ93zbK2zqwflCJtktk?=
 =?us-ascii?Q?aB0p1eI5/1q7bPvRl+VsBYDNI3T6yz02sRny1v0BhZG0vZRq8LDz0Yq6vqUB?=
 =?us-ascii?Q?UjizBotJQxfNxRKuYn92yUInBPQt01lQgKb21Q7uzzB4OnSy8fWGWbmyGzmQ?=
 =?us-ascii?Q?MW/qw4Iz4OnKL8SjHgi6ImtVWxy5AstI+cdoE/Sbeohc3elCIo6hOXjSXHfd?=
 =?us-ascii?Q?WMBuOOBlCw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a26ad792-d3ba-4d88-1d10-08de73f3ec2d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 22:27:41.1817 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8mhhbPQSQ/hQR8IPFdGop32UNsX26WemhMKd1+jNS0/6rmdi77qL3vgWhhjKiO0dH+o6QwH5H6FQfjbW2OicXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5855
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
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,gmail.com,redhat.com,linux.intel.com,suse.de,ffwll.ch,collabora.com,nvidia.com,weathered-steel.dev,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,lists.freedesktop.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	RCPT_COUNT_GT_50(0.00)[55];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-0.935];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[clist.rs:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:mid,Nvidia.com:dkim]
X-Rspamd-Queue-Id: BEE4F18D359
X-Rspamd-Action: no action

This series provides the clist module needed for nova-core memory management.
These patches are being sent separately from the rest of the preparatory
patches (DRM buddy movement, GPU buddy bindings, etc.) as they can go in
independently.

The clist module provides Rust abstractions for iterating over C
list_head-based linked lists. The primary use-case is iterating over GPU buddy
allocator blocks.

The git tree with all patches can be found at:
git://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git (tag: clist-v11-20260224)

Detailed changelog
------------------
Changes from v10 to v11:
- Sending only the ffi/clist patches separately from the rest of the
  preparatory series, as these can go in independently.
- MAINTAINERS entry: Renamed from "RUST TO C LIST INTERFACES" to
  "RUST [FFI HELPER]" with (CLIST) scope annotations for maintainers,
  following Danilo's suggestion. Note: There is still an ongoing
  discussion about the MAINTAINER file entry naming between Miguel and
  Danilo: https://lore.kernel.org/all/DGJXYEXCYIII.Z6FOAA8YYMAZ@kernel.org/
- Updated clist.rs module documentation per Danilo's review: generalized
  the FFI usage description and added explicit note directing Rust-only
  users to kernel::list::List instead.
- Implemented suggestions from Alice related to safety of CList wrt
  concurrent modifications.
- Removed unnecessary trailing comment markers from example imports.
- Added feature guard for offset_of_nested (Eliot).

Changes from v9 to v10:
- Combined clist/ffi patches into the larger "Preparatory patches for
  nova-core memory management" series (8 patches total).
- Added new ffi module patch: Convert pub use to pub mod and create
  rust/kernel/ffi/mod.rs to host clist as a sub-module.
- Moved clist from rust/kernel/clist.rs to rust/kernel/ffi/clist.rs.
- Added Reviewed-by and Acked-by tags from Gary and Daniel.

Changes from v8 to v9:
- Added nova-core Kconfig change to select GPU_BUDDY.
- Minor fixups.

Changes from v7 to v8:
- Various changes suggested by Danilo, Gary, Daniel. Added tags.

Changes from v6 to v7:
- Extracted clist and GPU buddy patches from the larger RFC v6 nova-core
  memory management series into a standalone series.
- Changes based on suggestions by Gary and Dave.

Changes from v5 to v6:
- Part of the larger RFC v6 nova-core memory management series
  (26 patches).

Changes from v4 to v5:
- Part of the larger RFC v5 nova-core memory management series
  (6 patches).

Changes from v3 to v4:
- Combined the clist and DRM buddy series back together.
- Added Rust bindings for the GPU buddy allocator.
- Moved DRM buddy allocator one level up to drivers/gpu/ so it can be
  used by GPU drivers (e.g. nova-core) that have non-DRM usecases.

Changes from v2 to v3:
- Consolidated 3 patches into a single patch.

Changes from v1 to v2:
- Dropped the DRM buddy allocator patches. Series now focuses solely on
  the clist module.
- Dropped samples and added doctests.
- Added proper lifetime management similar to scatterlist.

Link to v10: https://lore.kernel.org/all/20260218205507.689429-1-joelagnelf@nvidia.com/
Link to v9: https://lore.kernel.org/all/20260210233204.790524-1-joelagnelf@nvidia.com/
Link to v8: https://lore.kernel.org/all/20260209214246.2783990-1-joelagnelf@nvidia.com/
Link to v7: https://lore.kernel.org/all/20260206004110.1914814-1-joelagnelf@nvidia.com/

Joel Fernandes (2):
  rust: ffi: Convert pub use to pub mod and create ffi module
  rust: clist: Add support to interface with C linked lists

 MAINTAINERS              |   8 +
 rust/helpers/helpers.c   |   1 +
 rust/helpers/list.c      |  17 ++
 rust/kernel/ffi/clist.rs | 338 +++++++++++++++++++++++++++++++++++++++
 rust/kernel/ffi/mod.rs   |   9 ++
 rust/kernel/lib.rs       |   4 +-
 6 files changed, 375 insertions(+), 2 deletions(-)
 create mode 100644 rust/helpers/list.c
 create mode 100644 rust/kernel/ffi/clist.rs
 create mode 100644 rust/kernel/ffi/mod.rs


base-commit: 2961f841b025fb234860bac26dfb7fa7cb0fb122
-- 
2.34.1


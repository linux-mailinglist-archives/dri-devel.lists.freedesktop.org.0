Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CO7HGQssnmmkTwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 23:54:03 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1491B18DC67
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 23:54:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5325110E661;
	Tue, 24 Feb 2026 22:53:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="VrETmeih";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011059.outbound.protection.outlook.com [52.101.62.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3B8C10E688;
 Tue, 24 Feb 2026 22:53:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yiR0bLwTm/Yw7A/0NoiWP0VPREn7DdSdAzNCjY3e9WiSI1QjWjSnr6vMNhclI19KHpCtQFIvSWDnOIJgZR9ROUVYkoW5N9vcnz4LZbMsk9kCnUUywWbker8hySw3pfiJ2bltxpJeqJOjsYBbl0Io7RooCfMzHN0c6GPA5fxs9IQG+//0TU8flG7Pu1kkgvvHNJ/sf3bl38j3qDWGT1tP6FIXKtLirn4JOp8/8Vl2as2YkFIR56mT7S0WEHEOjK+Ra6H02iet6BKo5Jqza25oorcvd64bt471SLBuYIJqtLKS7eSBoVOYVvZV+JLckzDuhghA0xIwGbTC8ysKhiLPEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7zKgDPmVZNfWiDtJ9vzaaR7u4t5UNgcAKdjFKBA03YE=;
 b=nH4p6FSNbFvTdnDJ9arCnW2lGsRXnVXQrVZCFcC991+7KrUtQDg8jwKk+tqlABfv9pl8KeMuPYgg6QBAsD8nHhwo/tedkeiOK5ULqSHjJ08K77tyTDoSFPSuL8zl5C3Tqft//e4Gi51u2V/Uuf0F4NMQSVa9rEh7W0LPblczXL/Gf+iTmSu9fljQH9SMEgfaTFh/2QYNUySR3J0uBj2Rf5HodNFY5TOvDHoyRDs6Rz+fG3RHhDzOLdlViUmxvAJBO7h28oaaydNj4N6n2WIWEwovKQZsTBf54OLNt3aep+POZZf4KRImnc5IViEDdlDjKxElNvxPEv0DGZgP08GVwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7zKgDPmVZNfWiDtJ9vzaaR7u4t5UNgcAKdjFKBA03YE=;
 b=VrETmeihb1CinumvqinF9Up8Zw3TzdaKaUdVbQQa/g3uz4YKURlFRNAEFcUOtpaPrdpdIyPZ2uknTDH73jnDB5rkl3Zwv1X5fGmcSUkMbnqpQg84wZ45UqTxXdsXoN8XPzlubWO1bZmF+iehz1RCy7aS4yJQHTyL403xMiZORbwGa4PnoqetMJJPw1DEbHDR69F0KqWkeTpGdq1RvmVR2XZyy185AdBl8jl/VbgmQIbJqlMG6ZZMreR+LSwUi1HusDK6CPcN4roBLw0uimhHvPHyOT4f0d6qzFBsYXs44zvmWPhVoIK/i5QoXlW20i9rh/Db3d7w2/6NxTQrQegXrQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 SN7PR12MB6885.namprd12.prod.outlook.com (2603:10b6:806:263::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.21; Tue, 24 Feb 2026 22:53:47 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 22:53:47 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Dave Airlie <airlied@redhat.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Koen Koning <koen.koning@linux.intel.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Nikola Djukic <ndjukic@nvidia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
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
 Helge Deller <deller@gmx.de>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, John Hubbard <jhubbard@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
 Andrea Righi <arighi@nvidia.com>, Andy Ritger <aritger@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Balbir Singh <balbirs@nvidia.com>,
 Philipp Stanner <phasta@kernel.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>, alexeyi@nvidia.com,
 Eliot Courtney <ecourtney@nvidia.com>, joel@joelfernandes.org,
 linux-doc@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, Joel Fernandes <joelagnelf@nvidia.com>
Subject: [PATCH v8 09/25] gpu: nova-core: mm: Add TLB flush support
Date: Tue, 24 Feb 2026 17:53:07 -0500
Message-Id: <20260224225323.3312204-10-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260224225323.3312204-1-joelagnelf@nvidia.com>
References: <20260224225323.3312204-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0340.namprd13.prod.outlook.com
 (2603:10b6:208:2c6::15) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|SN7PR12MB6885:EE_
X-MS-Office365-Filtering-Correlation-Id: b96afbfb-f868-46b7-c2e2-08de73f791e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?K6JTZiAOiIHgz43T6Sj34CuBRyzmUC+ipiQXtqiCLuzF9c0xa/KmAxbP92Gy?=
 =?us-ascii?Q?Y785giZpAteYq2dN5xtSrdYlX9CtmFnY7NOE2JMXlfcZ1dknJHZRRHkZySgK?=
 =?us-ascii?Q?phl6GNKRCXaRKw66vtKye7VnNF88SRndzn3oPFkkYNRyOrKW4Zt4/rbfmwM/?=
 =?us-ascii?Q?5A/jEvYxS+i3IZLSUdGid9JVABK+Jhc+wnSA26zGDRmfll49YSTG0jdvn6DU?=
 =?us-ascii?Q?xrYpOjUj75h/MFEXsL0AUtvfBNw8V5cG0sCHKTWSBZx+Xp/6HJ5gb6r8U/hs?=
 =?us-ascii?Q?RmeGbidK/+p7wrJVjy9rlymqgM0IW5mbX2iXgtLTApoAItdsqgL55y62xDYb?=
 =?us-ascii?Q?+syuewSxfBArajaYzj3Q5Mr+JJGNveb2CBYlItAf1DBK6p+OBXLcerVHiT7Y?=
 =?us-ascii?Q?Ln0B8HOQq19IW50zoJB9C5TtKo0GeSDE9UGeSybaBXjZf6Yf1zOi7jg9LV8R?=
 =?us-ascii?Q?cB/c2KCmYHAEzm+0OPPK4jRJD/yGD64FCl8m/MaPOgQUVg6Ziubtc6JkiMWk?=
 =?us-ascii?Q?4Eog5fnw604JhUNJLQDEzG07v98S+4CpbF3j7/MnjMLF0vJWeF5GyCPyMIB0?=
 =?us-ascii?Q?ZEBY5kjpl89BlIbC/dIDkmh1UT72uw2OYsgvBQKslo4pj8fH0IOPTHTWGrqN?=
 =?us-ascii?Q?q/JCydO6FOe6gNnd/yJBS6XT44hoLwWyIHXqZPvyGHsuQ06SsplPT63d5DFx?=
 =?us-ascii?Q?g3SG9gX+6iM8p1bUbDAuTpq8a0f2fypuMOHeNFCft/Js4e/5jlpNA3qbGPs2?=
 =?us-ascii?Q?SHf8iA7nRrakzP9wYL2ijqPxEdSxIWML3poDBp6FQclmSBJRDzZoN39IMMAd?=
 =?us-ascii?Q?XCLiy6AwYrrHfFTsiUjLVUpkQXCCOftJRQHK53f0SLj9/Bfl7qumL7E8V634?=
 =?us-ascii?Q?N54gpx7LfcpA5nr19Zx+pVcSrJ0b2pKgzWORdeh/M9JfoOye2W87/IdkZVvT?=
 =?us-ascii?Q?QYdIzQxdfES0Pa2/0QJb6qibhcifyYxNhneZxi+ixiftimFNRgndXV5kl86I?=
 =?us-ascii?Q?hd/gxgJZ4wqp8ISuXiZMQVH5JgCDxVRzsX+QfZMOaa6NWMYSw4HHFan1vq9e?=
 =?us-ascii?Q?jTo+hVQqWExjOAJKRks1+P57faOCn/ImeNLbflcb2cmTWSVpbQBixiPsLGv8?=
 =?us-ascii?Q?3cms6D+UEAtGbTqe3y0jtj9QyBIiqDZFqKPluXcnHvUSngYJXNr39zosuBJ4?=
 =?us-ascii?Q?kuh0xSZEu5fbnKRoejBNaMkrOD7IZ6GLv4B+C2/L5IUdc/zkmP225Kjm23an?=
 =?us-ascii?Q?4k81ydeFYHjJ38SGFqUjNu1YhkyGmrQv2/gvyP3jeotla06Yu91S8r+FqGbk?=
 =?us-ascii?Q?v2dfu38Y5m38e/GXYBAV/sBqW1oJhZimtu3a9KSxVZFvNGddImyrxF/IFF9l?=
 =?us-ascii?Q?OUAoB45oTAWRM68ojMgcWj4rqJAIy91NjLWUlEFtdGYK0IwKqeYipRZ2cB75?=
 =?us-ascii?Q?fo53k2YdgSnAs6gEeOblnjursRZFe7InhCyysIzqWwCQaTFnELZmA1rks/fi?=
 =?us-ascii?Q?orR0/tSnnbbdFbNyUCRm0zzzU363pMa1aePErdnRCvJKbki+/2OIInOr+z1B?=
 =?us-ascii?Q?5AGbdUG3p3ECXuxtYzg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ky2dG+tkFkkRIGJsdVhswKHQGJlpp0Aqz9qXaHHHmLt4Pky3+2ulDUcPLdmI?=
 =?us-ascii?Q?8Z+aliZlGIMSnTyrU3JtxEYsPmoMrkJSAOWGTXWOo78guZ1DX7PKvuLBCnpu?=
 =?us-ascii?Q?8mshcvq/mfGfyzUe70caAEHAqFT9Ks3ZqYuJZFcQQoaksoluLg9ZrpPJFyuP?=
 =?us-ascii?Q?Czq+5yr98gUCh9xSV/pyonk9JEA+tqLM8TaqJFJCWWj0Nwlk8bTiq/fK5sT2?=
 =?us-ascii?Q?O6zLr5CR64zrCEG4DSaJSFPE84+mPni0G0LCc1TBNDsX7WZkV0zMjxU8zgwn?=
 =?us-ascii?Q?Mhg4ZIg6ZuWpJqJVFO5p6bxzY+JRTsCZmwnD7fT2G2SJYO3zjlFwZKMTfN9R?=
 =?us-ascii?Q?XF2LWho8kt6+G71avv0v1ixjdI4iDWJmwJ+uZcp0XDvpCM7gp1AyMOX/SzL4?=
 =?us-ascii?Q?CdLNwhcAXyzsKoqTc5mYqpYQ62j0vwmMv/1YpMKrsJrYDnN6FhNXO3rixXga?=
 =?us-ascii?Q?IvRnmWCfExDihb56wcQJ3PV0tSennPMp1AqfaufKFJqeapKJDQyctqkPE50i?=
 =?us-ascii?Q?6HVZFT8YA2hb40sREoEL8XcokGN8zdQSPQiBrmi2yRxHVbC+Zbi+j1y0jnlE?=
 =?us-ascii?Q?r4SQbdmfg11us3Mb2Ij28gu2APELu0M9LObhVbhnMA2oSjVqKadqTPW0qFiY?=
 =?us-ascii?Q?Do9J2g3pJQ859SPao44k78O77HRXUjBV5UklDqB7OUVZZ6Kk0mOKxQyulk3Q?=
 =?us-ascii?Q?A+cfy11d6TCZZ0RXckBKe3iZBwJ0WEZ1hWnPl0zHhXr51bpAmUZlqGdgWW66?=
 =?us-ascii?Q?3iKZQbZWcs5MYIqb+bmRkpsEvVAYOsoWukEbQytPIKAZ/Y4YcImoDEGouMGy?=
 =?us-ascii?Q?kXUn7XNvjbgf6B09WTKfe+E+8Qgl0V+x4t9FcbrJ7fRx+K7T5U2gXrkb5Aj1?=
 =?us-ascii?Q?GQTNPuyOFzeZO1v8i7nVr/IwUsdaoyX/WznuVfoe4vXxEXxeuCPOVc+s+UHx?=
 =?us-ascii?Q?b3q0ysALwzFPgqlS0HdNGLF8bpun8HaJ5MGxPnMP8VFUnUpECu9wIf0br5am?=
 =?us-ascii?Q?4onPR92DuLhQZGgTcYn7LHJGGoFQpz3KJHe5os58gpePv7AK2S+xUbkhrcVQ?=
 =?us-ascii?Q?+PcrXxaIWIkYh1GFVJH5iBwe1LS5/UTgXIhCq09aJB48AvzpeulQ7kdLYtY5?=
 =?us-ascii?Q?blN9PKDnRPcTFyYjAMnsFJLqSAsk302iQVfZ6kIqnLyA5BGAmV2XEzbmPUcs?=
 =?us-ascii?Q?C/eHuuCTnoM2Ufdp28Nry4gcHA6klYXHKHMozPHy2iWIICGzo6fF6WK5mNA5?=
 =?us-ascii?Q?aIUx6Khu2zbWoS2EbQpjCNvD6YirBOB3HaUEMyvCOg5chc2gnIT84ZN6O2OL?=
 =?us-ascii?Q?snDa6LeLUOraDv0rXtIXuMtm+LsZKv4CqrO9Ke3B1LHW+ARtQGfXijaiQODb?=
 =?us-ascii?Q?FUfJwgt9CyBqR4mQeEtvsMbTnDr3EciVKudoad0KFQB0JYhedIchAh8yMNW5?=
 =?us-ascii?Q?EXBFUvAM/C1gjIhToRImkLU0j2IyQkeGivrryWzf3dNwIm8rMk1cKDe9qdUF?=
 =?us-ascii?Q?B9X4+YcidR0HL1M1hWwvxFYFs460ZUFB91CxTsE8V2K8wqyiFDTtmmAteg9v?=
 =?us-ascii?Q?r0WMIOQK/S3bBtxa939xcnNPg0E8rudsIUXMGqKhsrc0LvR6J5lQw/JFQ+T8?=
 =?us-ascii?Q?T7GvgfPNUk/Ja2DPfjwwM3viryRQqPFWINZQvVmNFFSJAvKInhmAeCI+lqqC?=
 =?us-ascii?Q?lsLK5X7jDc0J/r5ax3MPXZW8yP37bRJBtO7ET6BuFxhfJlNk08KVVzF48heu?=
 =?us-ascii?Q?pYjRgeF2GQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b96afbfb-f868-46b7-c2e2-08de73f791e8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 22:53:47.6559 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JUJkvzhdtCL10Txw+Cl9Z1wkNWPdHElfzcSSiWsBP4qQhfJByRZ2nWvCZNHtRzp+qxAdpiygCULH25T+eCU4HA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6885
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
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,redhat.com,collabora.com,linux.intel.com,lists.freedesktop.org,vger.kernel.org,nvidia.com,suse.de,gmail.com,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,weathered-steel.dev,joelfernandes.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	RCPT_COUNT_GT_50(0.00)[57];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-0.942];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 1491B18DC67
X-Rspamd-Action: no action

Add TLB (Translation Lookaside Buffer) flush support for GPU MMU.

After modifying page table entries, the GPU's TLB must be invalidated
to ensure the new mappings take effect. The Tlb struct provides flush
functionality through BAR0 registers.

The flush operation writes the page directory base address and triggers
an invalidation, polling for completion with a 2 second timeout matching
the Nouveau driver.

Cc: Nikola Djukic <ndjukic@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/mm.rs     |  1 +
 drivers/gpu/nova-core/mm/tlb.rs | 90 +++++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/regs.rs   | 33 ++++++++++++
 3 files changed, 124 insertions(+)
 create mode 100644 drivers/gpu/nova-core/mm/tlb.rs

diff --git a/drivers/gpu/nova-core/mm.rs b/drivers/gpu/nova-core/mm.rs
index a8b2e1870566..ca685b5a44f3 100644
--- a/drivers/gpu/nova-core/mm.rs
+++ b/drivers/gpu/nova-core/mm.rs
@@ -5,6 +5,7 @@
 #![expect(dead_code)]
 
 pub(crate) mod pramin;
+pub(crate) mod tlb;
 
 use kernel::sizes::SZ_4K;
 
diff --git a/drivers/gpu/nova-core/mm/tlb.rs b/drivers/gpu/nova-core/mm/tlb.rs
new file mode 100644
index 000000000000..23458395511d
--- /dev/null
+++ b/drivers/gpu/nova-core/mm/tlb.rs
@@ -0,0 +1,90 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! TLB (Translation Lookaside Buffer) flush support for GPU MMU.
+//!
+//! After modifying page table entries, the GPU's TLB must be flushed to
+//! ensure the new mappings take effect. This module provides TLB flush
+//! functionality for virtual memory managers.
+//!
+//! # Example
+//!
+//! ```ignore
+//! use crate::mm::tlb::Tlb;
+//!
+//! fn page_table_update(tlb: &Tlb, pdb_addr: VramAddress) -> Result<()> {
+//!     // ... modify page tables ...
+//!
+//!     // Flush TLB to make changes visible (polls for completion).
+//!     tlb.flush(pdb_addr)?;
+//!
+//!     Ok(())
+//! }
+//! ```
+
+use kernel::{
+    devres::Devres,
+    io::poll::read_poll_timeout,
+    new_mutex,
+    prelude::*,
+    sync::{Arc, Mutex},
+    time::Delta, //
+};
+
+use crate::{
+    driver::Bar0,
+    mm::VramAddress,
+    regs, //
+};
+
+/// TLB manager for GPU translation buffer operations.
+#[pin_data]
+pub(crate) struct Tlb {
+    bar: Arc<Devres<Bar0>>,
+    /// TLB flush serialization lock: This lock is acquired during the
+    /// DMA fence signalling critical path. It must NEVER be held across any
+    /// reclaimable CPU memory allocations because the memory reclaim path can
+    /// call `dma_fence_wait()`, which would deadlock with this lock held.
+    #[pin]
+    lock: Mutex<()>,
+}
+
+impl Tlb {
+    /// Create a new TLB manager.
+    pub(super) fn new(bar: Arc<Devres<Bar0>>) -> impl PinInit<Self> {
+        pin_init!(Self {
+            bar,
+            lock <- new_mutex!((), "tlb_flush"),
+        })
+    }
+
+    /// Flush the GPU TLB for a specific page directory base.
+    ///
+    /// This invalidates all TLB entries associated with the given PDB address.
+    /// Must be called after modifying page table entries to ensure the GPU sees
+    /// the updated mappings.
+    pub(crate) fn flush(&self, pdb_addr: VramAddress) -> Result {
+        let _guard = self.lock.lock();
+
+        let bar = self.bar.try_access().ok_or(ENODEV)?;
+
+        // Write PDB address.
+        regs::NV_TLB_FLUSH_PDB_LO::from_pdb_addr(pdb_addr.raw_u64()).write(&*bar);
+        regs::NV_TLB_FLUSH_PDB_HI::from_pdb_addr(pdb_addr.raw_u64()).write(&*bar);
+
+        // Trigger flush: invalidate all pages and enable.
+        regs::NV_TLB_FLUSH_CTRL::default()
+            .set_page_all(true)
+            .set_enable(true)
+            .write(&*bar);
+
+        // Poll for completion - enable bit clears when flush is done.
+        read_poll_timeout(
+            || Ok(regs::NV_TLB_FLUSH_CTRL::read(&*bar)),
+            |ctrl| !ctrl.enable(),
+            Delta::ZERO,
+            Delta::from_secs(2),
+        )?;
+
+        Ok(())
+    }
+}
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index d0982e346f74..c948f961f307 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -454,3 +454,36 @@ pub(crate) mod ga100 {
         0:0     display_disabled as bool;
     });
 }
+
+// MMU TLB
+
+register!(NV_TLB_FLUSH_PDB_LO @ 0x00b830a0, "TLB flush register: PDB address bits [39:8]" {
+    31:0    pdb_lo as u32, "PDB address bits [39:8]";
+});
+
+impl NV_TLB_FLUSH_PDB_LO {
+    /// Create a register value from a PDB address.
+    ///
+    /// Extracts bits [39:8] of the address and shifts it right by 8 bits.
+    pub(crate) fn from_pdb_addr(addr: u64) -> Self {
+        Self::default().set_pdb_lo(((addr >> 8) & 0xFFFF_FFFF) as u32)
+    }
+}
+
+register!(NV_TLB_FLUSH_PDB_HI @ 0x00b830a4, "TLB flush register: PDB address bits [47:40]" {
+    7:0     pdb_hi as u8, "PDB address bits [47:40]";
+});
+
+impl NV_TLB_FLUSH_PDB_HI {
+    /// Create a register value from a PDB address.
+    ///
+    /// Extracts bits [47:40] of the address and shifts it right by 40 bits.
+    pub(crate) fn from_pdb_addr(addr: u64) -> Self {
+        Self::default().set_pdb_hi(((addr >> 40) & 0xFF) as u8)
+    }
+}
+
+register!(NV_TLB_FLUSH_CTRL @ 0x00b830b0, "TLB flush control register" {
+    0:0     page_all as bool, "Invalidate all pages";
+    31:31   enable as bool, "Enable/trigger flush (clears when flush completes)";
+});
-- 
2.34.1


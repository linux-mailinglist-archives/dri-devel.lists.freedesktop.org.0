Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cN8eLRAsnmmkTwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 23:54:08 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F6D18DCB3
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 23:54:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81EA210E698;
	Tue, 24 Feb 2026 22:54:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="i1lSiRmN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012025.outbound.protection.outlook.com [52.101.53.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00A2510E665;
 Tue, 24 Feb 2026 22:53:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PfP14TIh1XulSp7dcf7fyuvjptcrJDK47CoU45pzVeE6zhtQv8j09smZEuIkK9wmg+/4C/Op04rc4MN16iexQ7sn9wkxI5WYroBH4wAMcTzED2jLtsbBDbIz9/CtcvYo4HYDpgnZiU/D/M02WZJaFndU29E+4ryYqXb4P6B/WQwAmFJ9rv0A7c1LQecku+HvnzEvKdXEpIuxXpm0Y07uMBJEqLfzoxyqMUEYJ3jSD5m4eXb60NOAv4nf1JlTXn+vpkVjUpCzvcSmOvNeMENg4pfAJTFDv9K5YD7oRu7oqOnL9xlc/2m2HOS4tRGJtKIxXQSlBBnGmsTtqepAUY+Lbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YI3om+J+g5Njey+T40Z5xsmfkXWDiRTHCKW15V8Xgb8=;
 b=Y5B4wrFXZLJfa54CQP5YjWCwMbI8mAc1iX2eJApBdYHy83HOJpUAMWygkT+ac0MlDtMCd0tWneGSGNBkl+rz/44NSRm7BOFUUiUowXNG+/QWCmz4oemKPQq4ZfJPSCMkdy3AVA//33wFwVLmaT2GtLF+TS0t0JCxxxD/OiD02grUgp+yUBkyq4ui2zW5LigQMTjoyoB476Cy+FHdWOng9ZoZ2r+aFaOkStQCDdduf5jPqoBB3WMVr8hdOMkhstxVTZ7ItZCvp+CkYM4f3YN7aSNzpSyUkp4reoCeVkwa+i8On0uECKQHYXilLIGn7EF642ZxrrmsQmq/sDU0r6cPSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YI3om+J+g5Njey+T40Z5xsmfkXWDiRTHCKW15V8Xgb8=;
 b=i1lSiRmNznCqL/RsuomKPggXnpudKZHS7JTtSfJMY7wajcF8WGgbeVlm2ZauGHhH8riyYHykZkAJXR47FJ2LLvbM5KfMkJqlqIj70Ac2tkR2/nzFKHgsipb6f5MYdiKDVj8bRMySl6rfk1lXVT5xdBmY8RWCi66bAbusESZH0EzqL6gmAQA4CoqV6HGpqhrcCsouipnOQJzEeAEnIjIy7uAIbwecLNXt09BW39bKxxlG1agrjLhdxCECRUMS1nBnMl8gFe9bAjsCNSzm9XJkb3l3juK5faf/uim1GxOV0BsWknAgboeNDW1oFX9aUJNzv8/eBUC0puK8Xg2KF4QdZw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 SN7PR12MB6885.namprd12.prod.outlook.com (2603:10b6:806:263::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.21; Tue, 24 Feb 2026 22:53:49 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 22:53:49 +0000
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
Subject: [PATCH v8 10/25] gpu: nova-core: mm: Add GpuMm centralized memory
 manager
Date: Tue, 24 Feb 2026 17:53:08 -0500
Message-Id: <20260224225323.3312204-11-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260224225323.3312204-1-joelagnelf@nvidia.com>
References: <20260224225323.3312204-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0346.namprd13.prod.outlook.com
 (2603:10b6:208:2c6::21) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|SN7PR12MB6885:EE_
X-MS-Office365-Filtering-Correlation-Id: 100a094f-42c0-4288-2e1a-08de73f792b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sa4089Z1PTOcG04yHXiyHjzjdB1Wl9Th8EW1oOj3orMMpqnOapNE78npkk5Z?=
 =?us-ascii?Q?lQaP0lDBtziJGTD9FoY7XeqWPhl4qBfR6j+6/nEIOF2TOXodac1535vcwmRn?=
 =?us-ascii?Q?oQ7Uv3agsPGQeXQbzxvDArFyQbsrqr1BYXsinfaHHeVJ9cH5KNLPkv0yYoeh?=
 =?us-ascii?Q?kQnkZPmLxtCj6IuKXcfPoyBeh22lVXy8bwMv8tgJIcJixyuNHJ/agNs1OvPp?=
 =?us-ascii?Q?CK32ffAlCkJSnBklEb6QAJ/LBwWPPTEmgQo5S9I9MMwV2/XWd7+UUOdYlk8V?=
 =?us-ascii?Q?bZPXVXbNNHsnoZwxtkl53rUltUVx1wkj+rYMRYWq/M+FTljwSjHQUTljqlOh?=
 =?us-ascii?Q?KErEFnkOq6g4l/615GH+ugyxqknfHvJYwCvBgIOUf6FXAt4XFewo3T9j4EqN?=
 =?us-ascii?Q?rGuD554y2J50za4/CNtugvlzq+sehPKz4KKGXqfOLl5l2908SDDrGvTY+HpY?=
 =?us-ascii?Q?jj0vq54fDwMq0XjQ8HGGsMaNNuvih9DLhjKEaOqgD7d08kgz0rKrY7WEtJyF?=
 =?us-ascii?Q?bZMGsnvoqnqElNacXtIUbeZFaHZ++Zj0Wi5v0EEQYaPhDUmMctGgmogiAXBT?=
 =?us-ascii?Q?UaNSETdw45BmZdzfPLz940s1i+jzFlvw2ry4hTwVM6nw+44BXH3ZwHtKuWHu?=
 =?us-ascii?Q?qoquwo4r5MIzX2TbLEvNAzYPMMNZBl95zQwo0xU1Vz3SwhW9lGS9xNNDmzYf?=
 =?us-ascii?Q?Ec44nmR9K1BRDuCmvWTjS1KLCb39On4BjSJj4HFgzi+99LM8B32gpAJJMkLG?=
 =?us-ascii?Q?9iRDP3yiZPuPZ9JmtbP5YnUJCe6S3kkJVOH4nsvsuc5zNvD6+bpmyotUCaIZ?=
 =?us-ascii?Q?F5ckFv9judtHPTSAddbsg0GFOPpuzdTLOn8p/lV7z00QuOuwp8rjt7Ooda6M?=
 =?us-ascii?Q?GPSrKUXG3PXb4VbCnIoEQyD6WzYaGSFBnl/o+giF9j825CRtetm3oBFiVsq5?=
 =?us-ascii?Q?6YGeh+mvfr3NOCUto/WGf84PrK81lVnE7rAhUxYUDgdY7uA0VLYyWv7d/nbU?=
 =?us-ascii?Q?XmfvvjDcdc+sJU2/gSTKcm3xDNhUwlSDNmkkUtYSCU1n5W5QIc6Klvy/je05?=
 =?us-ascii?Q?dB3Zju6mZ83kPuehghL7cIYwUPB1IFdUmKLM+VUMOsf7L4XbtAIjlVJoc19F?=
 =?us-ascii?Q?xRaynkI/iH2SkmPwd4Mb+WpiCNQqgmi16Chd3i4BmjW+QdDolwZAH48C+RLx?=
 =?us-ascii?Q?Snreq4TG8wFwbJcsNt6dihK+2gp+N0+r6fk2A339cv4/htuPg/1h2V7ByP/M?=
 =?us-ascii?Q?CK0vhZUMx27Hl63N7LIW1AACgmhIvFE/XhTOVlG1hK12PEYheiL6xI4yOztg?=
 =?us-ascii?Q?EBzhKyBVjT9zxQwWiCOUYDrAJll8elwi751u584nqCXt0GUc/P6I4GjGqyzy?=
 =?us-ascii?Q?1hDaXt93wpUx5UbElgL8GaheCbCjtTr3tbr31rnOQXdRxbVlx4uBg7zyRsHz?=
 =?us-ascii?Q?NJ6Pg0AsTR+50B9yQN3M4H+tbKQyHySebHv42jgeRH41i04gKWyRXN0YZBQV?=
 =?us-ascii?Q?FfDQK04r0UD9ZGSYkdWFDVTlGPRG7s6xF4GdiVxXkm2xy8PsaJjLxCmyYw9q?=
 =?us-ascii?Q?sIwMCajCanM9/SGT694=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1hnSoMaNpwVsvOW3nUJlse9/aEgS/wsqq0cPCJRRI2v376/lCt9oMQAWZasg?=
 =?us-ascii?Q?DtZFl/qCU+tga3A0bgcfl5jB5R/6CxJi5mWXNb2HQkc5gaarDHn5JnqS5Jli?=
 =?us-ascii?Q?nc1LTDaFbJgr3HArmz+9s6Gzw7ihR9WmdPYGZziEbfx1tPeVo2hm8VaBSDBc?=
 =?us-ascii?Q?fsdvzQq2qmS8eA2W2NR8JZ7bii3cqwfpVLZYagNDm8qMtlblTXNDlRF1BKdA?=
 =?us-ascii?Q?5K3yhSmXsYI9x8nCD+AA1uhxIldTY5G3l+OSuTr3LUxyp+SpONs4wyk/53Bh?=
 =?us-ascii?Q?TTr6aRcl5vH6Zz3myLC/e6mMN15UZbpas/vyEoT8f8pkw853JlT/7KUYsxwv?=
 =?us-ascii?Q?d5fUGSfxmqdDtGjDOdC1avLBUDD1I5wmWgE5QYyn7ky8i/bnThTrYhvsSQZj?=
 =?us-ascii?Q?ZrO0+Rc3l6k8rymVnYPiMCE3WHW5SUJ2vpFLE9yIxH1QfWu42C1Cj5JWyUMx?=
 =?us-ascii?Q?dL6WBdmMrp8SiK7x0WNcQ0atkyWjCEfbCKYwSDZgdY+1EqJ4F9nlC8cvGdlX?=
 =?us-ascii?Q?SzGiePd6oxN7S16E+ii8AzLWKSkFuXYDh5Rtxumy+doCvez2WHlk1dyt+dJz?=
 =?us-ascii?Q?vk22Xpt1yKL215imtDGY9kWEKOTxzaXrL+9BD7lINrhmrepMD9n/SmGJxDqv?=
 =?us-ascii?Q?VbRxYTKk4pHk8VBqyZSuAMrNEs+CHiL9ldOYgDPS9r5BnD6GNljajX+iv6Zr?=
 =?us-ascii?Q?6VHIL6ezc7o/5ND0xeUbhoHhytnQhHXF3yGdawU+fb8e3Wmi9pRJYF4Le3gI?=
 =?us-ascii?Q?xB67ffiIcRsZXnU6UzcVZUdV+EJ6tocMNxPGYLxV3D8+jtrv5qYeAtD1tPu6?=
 =?us-ascii?Q?x1riXnC844+P6SZ53O5GHqEXsOY6PcXIwnilPGqLduXbEp7MbfRZJlyHs2ho?=
 =?us-ascii?Q?io0XP0/EhtR7cBKRJs8Ym6KGEnVGcYPpDVCN+i7nEjiL/hzSY+I6nl0ZcDa+?=
 =?us-ascii?Q?dObqDB/iPF6uMi34sfPTWo4BbDu90b2AqDIppgxuFSbhBwW/zorFosQdQAWl?=
 =?us-ascii?Q?yM/zUQ9si1Xh1Dh3ZzKYrRTttTggzMJVXwaxBE21fwi+T/qmhVjIcWNutfwF?=
 =?us-ascii?Q?R1HP0U553fI4NPvdXK2BHY7bkz005PHYz+w5w9dOvIxgI+ragq4uqYb8drSn?=
 =?us-ascii?Q?GIQkaRMyiN3NMu/3cD5AXlGgbPpmjGCs4dynN7jkKfG1wFS5DICWGJ/3ZV+O?=
 =?us-ascii?Q?aiCBFnK5wVHJZghFcAmZrIRazfycjbNScX2NQpwwjwu0wu9ukMNZMSJ8SiHt?=
 =?us-ascii?Q?oOWMxgtqroDKVep+FjZQFwbNIEJwJosvAW1h8USMAFI57N0P3jJNu25bMf63?=
 =?us-ascii?Q?yjuqN/fCLTMSVdZTf0hOeockPXT+cV38Q/FFt8ssc0MfPn8k6p0sb8cON/Xo?=
 =?us-ascii?Q?kMvBMqeHJywudtb4gZ7n8r/lbPrHWMOp2UDK/Beu8fGp0FLftcWJINVU7w5c?=
 =?us-ascii?Q?42TR1xU3XalzNFdFvDuKNmsrYN/5Dr501hrHDMcTNutV5cpVJG3ukVF81IKv?=
 =?us-ascii?Q?pFlyg+hP4SAKbGSY+LmPzbWpiGODNcfpia6o4Ony8C42iobT3CRtUS4kQA7o?=
 =?us-ascii?Q?jQLtv9HGHbCFx2JoTWicxcHkfgjkPyLdo2Fmp+0V8qbNY13BLF+bgVzQXkUe?=
 =?us-ascii?Q?4Rqet9dJUuuDuHqgZXym2eE3flJBmnm0aWqovXFDsQsWMtctf17N1osn3yVz?=
 =?us-ascii?Q?CC1acwzm2MszhLQn/dz/mOZkyVfdz0Vvwrz4Tb4K0J0cyARZx6QJlNeVlun1?=
 =?us-ascii?Q?cn9CuTXlKw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 100a094f-42c0-4288-2e1a-08de73f792b6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 22:53:48.9926 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W1CdcaMbMlR8JLPwLOWhVR525VrB6eFcbwSCEPXhKgaIy2fSiGf0jvBBIlr4+ehLaoKvAecBPQWNo312Ux10UQ==
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
	NEURAL_HAM(-0.00)[-0.930];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 63F6D18DCB3
X-Rspamd-Action: no action

Introduce GpuMm as the centralized GPU memory manager that owns:
- Buddy allocator for VRAM allocation.
- PRAMIN window for direct VRAM access.
- TLB manager for translation buffer operations.

This provides clean ownership model where GpuMm provides accessor
methods for its components that can be used for memory management
operations.

Cc: Nikola Djukic <ndjukic@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs | 18 ++++++++++
 drivers/gpu/nova-core/mm.rs  | 66 ++++++++++++++++++++++++++++++++++--
 2 files changed, 82 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 5e084ec7c926..ed6c5f63b249 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -4,8 +4,13 @@
     device,
     devres::Devres,
     fmt,
+    gpu::buddy::GpuBuddyParams,
     pci,
     prelude::*,
+    sizes::{
+        SZ_1M,
+        SZ_4K, //
+    },
     sync::Arc, //
 };
 
@@ -22,6 +27,7 @@
         commands::GetGspStaticInfoReply,
         Gsp, //
     },
+    mm::GpuMm,
     regs,
 };
 
@@ -252,6 +258,9 @@ pub(crate) struct Gpu {
     gsp_falcon: Falcon<GspFalcon>,
     /// SEC2 falcon instance, used for GSP boot up and cleanup.
     sec2_falcon: Falcon<Sec2Falcon>,
+    /// GPU memory manager owning memory management resources.
+    #[pin]
+    mm: GpuMm,
     /// GSP runtime data. Temporarily an empty placeholder.
     #[pin]
     gsp: Gsp,
@@ -286,6 +295,15 @@ pub(crate) fn new<'a>(
 
             sec2_falcon: Falcon::new(pdev.as_ref(), spec.chipset)?,
 
+            // Create GPU memory manager owning memory management resources.
+            // This will be initialized with the usable VRAM region from GSP in a later
+            // patch. For now, we use a placeholder of 1MB.
+            mm <- GpuMm::new(devres_bar.clone(), GpuBuddyParams {
+                base_offset_bytes: 0,
+                physical_memory_size_bytes: SZ_1M as u64,
+                chunk_size_bytes: SZ_4K as u64,
+            })?,
+
             gsp <- Gsp::new(pdev),
 
             gsp_static_info: { gsp.boot(pdev, bar, spec.chipset, gsp_falcon, sec2_falcon)?.0 },
diff --git a/drivers/gpu/nova-core/mm.rs b/drivers/gpu/nova-core/mm.rs
index ca685b5a44f3..a3c84738bac0 100644
--- a/drivers/gpu/nova-core/mm.rs
+++ b/drivers/gpu/nova-core/mm.rs
@@ -7,9 +7,71 @@
 pub(crate) mod pramin;
 pub(crate) mod tlb;
 
-use kernel::sizes::SZ_4K;
+use kernel::{
+    devres::Devres,
+    gpu::buddy::{
+        GpuBuddy,
+        GpuBuddyParams, //
+    },
+    prelude::*,
+    sizes::SZ_4K,
+    sync::Arc, //
+};
 
-use crate::num::u64_as_usize;
+use crate::{
+    driver::Bar0,
+    num::u64_as_usize, //
+};
+
+pub(crate) use tlb::Tlb;
+
+/// GPU Memory Manager - owns all core MM components.
+///
+/// Provides centralized ownership of memory management resources:
+/// - [`GpuBuddy`] allocator for VRAM page table allocation.
+/// - [`pramin::Pramin`] for direct VRAM access.
+/// - [`Tlb`] manager for translation buffer flush operations.
+#[pin_data]
+pub(crate) struct GpuMm {
+    buddy: GpuBuddy,
+    #[pin]
+    pramin: pramin::Pramin,
+    #[pin]
+    tlb: Tlb,
+}
+
+impl GpuMm {
+    /// Create a pin-initializer for `GpuMm`.
+    pub(crate) fn new(
+        bar: Arc<Devres<Bar0>>,
+        buddy_params: GpuBuddyParams,
+    ) -> Result<impl PinInit<Self>> {
+        let buddy = GpuBuddy::new(buddy_params)?;
+        let tlb_init = Tlb::new(bar.clone());
+        let pramin_init = pramin::Pramin::new(bar)?;
+
+        Ok(pin_init!(Self {
+            buddy,
+            pramin <- pramin_init,
+            tlb <- tlb_init,
+        }))
+    }
+
+    /// Access the [`GpuBuddy`] allocator.
+    pub(crate) fn buddy(&self) -> &GpuBuddy {
+        &self.buddy
+    }
+
+    /// Access the [`pramin::Pramin`].
+    pub(crate) fn pramin(&self) -> &pramin::Pramin {
+        &self.pramin
+    }
+
+    /// Access the [`Tlb`] manager.
+    pub(crate) fn tlb(&self) -> &Tlb {
+        &self.tlb
+    }
+}
 
 /// Page size in bytes (4 KiB).
 pub(crate) const PAGE_SIZE: usize = SZ_4K;
-- 
2.34.1


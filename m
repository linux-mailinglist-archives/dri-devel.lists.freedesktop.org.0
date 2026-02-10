Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uORfOkbAi2m1aQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 00:33:26 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95315120040
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 00:33:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6BEF10E12D;
	Tue, 10 Feb 2026 23:33:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="GkT3GMHu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012070.outbound.protection.outlook.com
 [40.107.200.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 187F110E10C;
 Tue, 10 Feb 2026 23:33:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xf3zv9r5ZVA+pfyNtsJfgBMRtneo7e43ycB4G8woZTnln2kqaqWUc/iRrA3iKaoq8z3rMpTciucyJyT7EP7BSBN3eLw0VLVkKCG7kNo/htn72+Y10oz14JnDyLHMaoCnCtuIitDdmQLs03pTxNOzf1lrJuLjtG1Rxeo/Ok2aW8dRtKygK5HU5ABtiU7MszIDZTiIg/4LW4hIjbYNxfZQRhvby8qy/Y6EnN/78YNJNdxze3KAHikImPxMjMjFQF0VKSByMHbxKfwStZ4uGVJg3FswEwGMbGvvE4tyFfskTWi6b+a/S/+ohTq94VUMSmbPb95zJ4oYDISh+grIg9Qd8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gytM3D1Y2CfBcfJzE9jg8GeOiOcl5I39fjaQNznum2Q=;
 b=OYoEKHVvCjnDfm4PakY+x+E1gfTVQEqzAaGWruHKDBYJu3xA5f6KtGqNOh4sIbZDc76alQns9zkOMVIwHD7W4RzYhYX4csrb2y1rkqC0eJJLlUGbmBTTEeDqY+WwHJLY0agZPp9LEbI71Lzkw2vxJXrVkuHv4lqbZ03FlBatCvC2ecmt5scEiZHp7PvSzcDxEeg2EwvNd6tM5FaFdkwfmD11JH8RSH3DJl5XAtLSQEbtbooZ02tFGHX85LWmUl0Q4oBk5aw8Rr62LLnDEu/agigekRT1BufYaHw/DjSLbdA4BQ23UXVoyZCUqxU9iDF1eyisRi2zbUqG/HXKr/J0KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gytM3D1Y2CfBcfJzE9jg8GeOiOcl5I39fjaQNznum2Q=;
 b=GkT3GMHuFnL8gjeYpSC3YGYeyk7eEgOShXQd9fWroIwOEp12JD434N2UFyN9pyIv4mYW3XyTPqKzu1qWOoDRS0/lU8ggDdShGJDayRp4tfRuQoyD+RCepwo7vVbd0L6Eu+0YkQRNbh5IFaPC7Nuz9Lh0ve0d+u7+oZv+CkReC18P75JnNDRcvfLXpqtmRvhX48g/OnVmrefmIS7U3fT5fXDiSYH3mEhoEf5ev4BZMivRj07n1yPJ9J8etYzUyBIL+rbtUZl7POeDkI5vDZiafLmOBC9/vdTKS/yARkNPQPHaKh4y12/1T1wKroP/i6+AuM7zYE7iX2wAGkynFZCkPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 IA1PR12MB8586.namprd12.prod.outlook.com (2603:10b6:208:44e::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.10; Tue, 10 Feb 2026 23:33:19 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 23:33:19 +0000
Message-ID: <a571097f-24bb-4e3f-b763-0f7aed93709e@nvidia.com>
Date: Tue, 10 Feb 2026 18:33:14 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next v8 2/3] rust: gpu: Add GPU buddy allocator bindings
To: Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Vivi Rodrigo <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Rui Huang <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Helge Deller <deller@gmx.de>, Alice Ryhl <aliceryhl@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, John Hubbard <jhubbard@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
 Andrea Righi <arighi@nvidia.com>, Andy Ritger <aritger@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Balbir Singh <balbirs@nvidia.com>,
 Philipp Stanner <phasta@kernel.org>, Elle Rhumsaa
 <elle@weathered-steel.dev>, Daniel Almeida <daniel.almeida@collabora.com>,
 joel@joelfernandes.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
References: <20260209214246.2783990-1-joelagnelf@nvidia.com>
 <20260209214246.2783990-3-joelagnelf@nvidia.com>
 <DGB9G697GSWO.3VBFGU5MKFPMR@kernel.org> <1770754015.1979311.8126@nvidia.com>
 <DGBL94I0E5UB.4LNH3JODOKPV@kernel.org>
 <a7140f1d-b4de-412d-88a5-90e76d2200e3@nvidia.com>
 <DGBO3AS8VHIZ.1UNQTIMO8BGAG@kernel.org>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <DGBO3AS8VHIZ.1UNQTIMO8BGAG@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BLAPR03CA0015.namprd03.prod.outlook.com
 (2603:10b6:208:32b::20) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|IA1PR12MB8586:EE_
X-MS-Office365-Filtering-Correlation-Id: 32162d16-22ed-4584-681a-08de68fcc57c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dGhiQTN2SDBUd0NZVVdNNU1hUzNFSGtwNm1ZTFhQdkZNK1RSYXZRVnZsYXln?=
 =?utf-8?B?UGtGelJVa2wwcW15a0FGRm9LdkxyVHRUL1dPSXdGU0FvZ0NIaWFSSlFhbFpL?=
 =?utf-8?B?a3BwU2tLdi9Db0NGRFVmWXZIRHZKRXNxZHZ0WVJqRmQ5YzhvR3FCbTBrMkxs?=
 =?utf-8?B?YmJnamlZNS9oMkVKay9HTWtnNUlrVCtMNE9BSGZWaXduTzVtVXN1c2o5WjVF?=
 =?utf-8?B?aERsWjVoTGx2Z2xYbGR0RTduclZXWmdMVXdRWHBpWjNBSDUveTlHWElvQ2Fh?=
 =?utf-8?B?M1dxdVBvTWVaZUpOeit1TnArMDFFMjhQSFhFMHVzVEoxSDVKbFpKTVdnYWVw?=
 =?utf-8?B?ZmJTSUR0SmR4cktZQmowcEcxeTN6RU9rQzdPeXJuSksrTDZ2cmhNdEpvdjF3?=
 =?utf-8?B?TGdsR20wVVYrQ3VsQ0lpZnViUnBzTWpkS1VZajZ4dVR5bVlOVDc1RUpldkox?=
 =?utf-8?B?bk9HK2pGRlJLbDYxRFhIVFczRGE2ejBXQnNnNDQrVEJyVHR1UmxoMUMvdjV1?=
 =?utf-8?B?VGVhc3dUcXREUlp4Wkt4Ri8yVE04cERFYWV5WG9yYlJsQlBWV2UrYVQ0Y0pt?=
 =?utf-8?B?VTJSclJIS2lXNmErVzNING5tdi9DazkxOGNFbVc1MTNOczVYUDJlMVZuWTVL?=
 =?utf-8?B?Nk5HQWFGU2xkRjlsbDBqNnZHZVNGZHJ5cjVBOFlDay9kaHZ5bHZrTFY2T2Ir?=
 =?utf-8?B?OGRlNmpXelRaSVJ1OTNLc2JpUXRRczhNWndEeFN4aFpRWGNEUzlSeHFHNnFk?=
 =?utf-8?B?MXlkZWtUMll4UFpNQ1JONHJpVExxd1gvQnUxQVArSEkrdVMvTnZXRk5YT3dw?=
 =?utf-8?B?Nkp3NDNCb0RUTjUxWlFxY2pCZTlnaFpWazQrMnJTMnhyMllGQ1VnMnBFV3Ju?=
 =?utf-8?B?OVZ6dDZpZXZHTFpLWk5TMFIvQUJYMGJuUWI1cHdzeTU2NDNHVXJnTTJGN2tX?=
 =?utf-8?B?TkhBVVlnTmEyYmt0bHFhdkZUbGZVY29TNGNzenQ4QXV1SzNaQmJ3Vjg2YlBa?=
 =?utf-8?B?QW1CVVhBSWhTNEM5QVFzNkEvZnRSQWVFN2RKMGJVRm1GZ1VqZHVoRTZsZnpQ?=
 =?utf-8?B?ZUtmbTduZTBZN25aUkg2UXp1R2luTEZLZ0tzRFZCcHAxNW5lVTdOZkNEdlhO?=
 =?utf-8?B?NWZneWh0M0F3Um5la3AwaENyaDFzVFF0a3pDU0cyL2w5dUxRNVVtVlE5cmVs?=
 =?utf-8?B?cHI1SnhOKys0aHl4SllpR2Uwa3ByV3l6REU2VjZNMHlrejMzRWNZSHNIOGFv?=
 =?utf-8?B?bzNYS2tiQnFadjEyeU9DTmR4blZWeitSeGtUUXJxY294V3FiSjFhZ0hmcGk4?=
 =?utf-8?B?R2crK0VvY0JpQTAvUEdiM1p2R05hOTA3WHhmYVI0Z0tnTE52YVhyT2VKOEd1?=
 =?utf-8?B?aThCajZvNlJjWGtiM1VtY1k0QjExc2ZKZlNMTTdOSnA3eG43NnprMjBQRDZo?=
 =?utf-8?B?eXgyMGFibjNROFRKMmJCb1pvVFlDVlpkb01QWStmamhhQzdpRnhMNEN3Ynl1?=
 =?utf-8?B?N1ZWaDVWbHFqQXNZczdIYktDalNGbDFkSERZVldESlFmNzE3NGE5czRMdWV1?=
 =?utf-8?B?VmZ6a1pJdUtvZXFiaG5hT3NXdENtNEJwWXU4WUpXV2FSSHVTaFR4cUx3Vkpp?=
 =?utf-8?B?T1BXaGVwd2tmOUl2OTdMS2UyUGZaU1Q1THoyZTM4UXdCQ015OS9yS3FpQzVW?=
 =?utf-8?B?SGtDWkNXcjgrdE5keFY0NHFiUDl5WHorbGpZK2hoZEl1dmZVUTVrVmRKa0tw?=
 =?utf-8?B?MnlpQzcycjd5aENoWEorUkZLckZsanZjSEZucUxDMWkrcGt1Z1RrMHBrL2Z1?=
 =?utf-8?B?Q21rQnBxSVB4Tms1V0Fobm0rTkJDVnlVOGtKSVpXRlFYZ3VuNmk2dXM1UGtu?=
 =?utf-8?B?RVNLS1VYWCtzOURERklqVkRsSlRlZWxEOUFMVzE0UENVMHg1UTA5anhHU3RR?=
 =?utf-8?B?R3JGN2pldVZnWFM5ekEyNUZKaGdrbitLbm5BUCt2b0phWjNZVS9VcWJyY0d1?=
 =?utf-8?B?L2pNSUVwdUlDRTlST0ppZ1M3alUrYVlPa3JvSSszeTliOWQwZXU1a2VVTUsy?=
 =?utf-8?B?UmYyRXNSM2FmSXd4ZjdqY1d4bk91YjJ4TE5qWElzOEFXazhQOUwvMGk1MmpI?=
 =?utf-8?Q?bO5o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bU5sTmQ1ZTBJMC9kT1EybWgzVHR3REtCTm1vdlU0OUM5YldUaytPOENCbGw2?=
 =?utf-8?B?OFpFTXBQcFlPeFozbmtTTWxqK0NjUlVDYloyK1NVTUJmYlB2R2JtRmNQWGVy?=
 =?utf-8?B?NXd5Rm9vSFJSaUUwR09DZ0lncm0wUXYrd2s3UG95ZHRGWlpQRDZYUEVRR3pV?=
 =?utf-8?B?N0taazNQbHYrUkhLdVh6ZXc0Y2M3MlhlRlFqN2ppWFNTU0lGcTZwR3JFZ3pW?=
 =?utf-8?B?UXNFK00rT1NmVWYyeGJXNVpNdkVpMGFkMGFTeHVFVDNRR2VRcW5yMThhcWgy?=
 =?utf-8?B?aDdZc3RZVHp6RjBFSlB3TVNFa01XeGo3YWZwZDdGYmQwcmh6ZUxIRDcwS1Q2?=
 =?utf-8?B?cW9Gd3VKV09nbjdhN2I1OEtWOU1rQzdIQ0R4T2ZDNTB1b3dUMmxRNDBudHVY?=
 =?utf-8?B?OTlwV2dWMWIyRWdFV0lyaDh4WThFbnJVclBUdWlnWU9hdzBlTWJYUDNUQk5P?=
 =?utf-8?B?bWcrNElhZE1XWXlEbHVyZm5wL1hGRWtjSnhpV0NCVW02VGRLRlAyT1lQSURi?=
 =?utf-8?B?MlRDNXAwcStBb2RaZHZYSFc3Y2FDeTNkVnRQZm5kb0pWUXplTG4yR0pSa3dp?=
 =?utf-8?B?dE5xSG5JK1F6VEhhSmdPWUR5amRsaDBhZ21WUFJGdUNua3Q4TmtuVVFRU1Ar?=
 =?utf-8?B?SytxaGdCUXVNd3JkMGl6d2NMSVlkU2xQOWlVVUp4TFZjK285by9MUVFTSU9D?=
 =?utf-8?B?Nk9BZ0U3eHRobXhpVmkvMUJDYWp1NitMdkpGNFRnWU9qWForSFpnSTRjUnU2?=
 =?utf-8?B?YlMvUGxuYkpsaUN5UEEvVXRLcVFTanBTSEwzUTdIalNtVkRZMDRKdnlSMk9j?=
 =?utf-8?B?UEFxYjA5K3l5bnEvTnF4OVdBWDI5OXpTc3ZuS2FhWFZLbUdwWDJYbTlXUlQ5?=
 =?utf-8?B?cE1LSWNiYVRlZU52bTAwNUJBY3l4OWcwdHRiZkZhcTBXYmZCSUorbWtaL1Jh?=
 =?utf-8?B?SXpXVTdnMjZ4VHBIQ3RIcUw4eHRJR1l0ZERZbW0xQ2xoZjMyWURyMGtlaTFM?=
 =?utf-8?B?RkxCWGNuNXhYZDJkT0E5Vzl5VnFrVTROYjdGaktnZTh3ZU5LaHpPUjc1N2h5?=
 =?utf-8?B?cTI3cWk4TU5ueEg4alpTWWxlY2NwSUJkc3NyMVlST0o2d2JnRmsxS2Y1aDBG?=
 =?utf-8?B?TTRtRjFhc0YvdnFVUkNXa3dMa01zZTV5Yi9JeEt0d2dWZm5mK2g2alRaUzM1?=
 =?utf-8?B?UW1QWEQ2cWcxbEZlS0wvVURlTWxLOVRBeG83Mk9objlSUENzWkZWNUdKOGVh?=
 =?utf-8?B?bGh5QTZxUzc2UTdtN25pNU4yNzVhR3Jvd0dHNllqbXI1UnoyekNWQWVqajBx?=
 =?utf-8?B?VUpGdlVJV0I1TWlRd2RYWklnZWloMFJvdDNSZkdYWUcrSU1hRXlxRDBwUVJq?=
 =?utf-8?B?U3J2eXpnbGFQcm9hTUhCdEt0UVBvUzZ6Wm0wRkVELzRwMXo1MVl0ZFBBUTJL?=
 =?utf-8?B?Sjkrc21lQ0hJaFJwanQyVGJNVXFuSXZTVk1qYWNFLzlzaWU0aVpnZnIvUWdl?=
 =?utf-8?B?aVZBNnlkS0RMa1pwYTJseThoRFZ3bGNSeFhOcU1KTXF3TkEyYTNuUEFqUnl1?=
 =?utf-8?B?bFFzWHNaTVNPT3lxRkFZbFhQQ0dyaDhNOC83Q3pYei9NNVR4QWtudm9uRC8v?=
 =?utf-8?B?NkhPbFF6T0JHbVJ0M2t3a0w5UGNjN2JaOWVFc3BGay9LVmRnMzJTenhYdzFI?=
 =?utf-8?B?cmR6S25IejJqZGtKNDJ6WFpWSW5vYUg3b3p2VkNpTjliUzFPUGEzRkRlbkNz?=
 =?utf-8?B?TnNCYzJDcjU0aUZnbkMxcjZVWWF5bVdQODFQZWJ2QW0rTzRYQVVUcnZ5Nmtr?=
 =?utf-8?B?VWJCVFBsd1YzYVVOWUlkTDFPVDhzSkJLeDVpSjh2MzVxV1l1eXdZNFpBSXlm?=
 =?utf-8?B?cUNDclBSTEx2WmdKMUhuWTYycE95aFhaeXV3elpiSFl2aU1BUEZ5THkwZHp3?=
 =?utf-8?B?cVE0TmhsQnNIVGNlckNscEEydldpZDh3dVA4MVBLK2VCTVJ0QWtHR080OFpX?=
 =?utf-8?B?UmpYczVmSTJIQmowTE9zZVlDM3RURENidEY2a3JMRDNzTyt2eEdTZDBrYmY2?=
 =?utf-8?B?dzErYzFSUEdTMkU2MEZBcXpHM09pNk9aaElDQmxlSHAydGFnL3VtRnJjUmFq?=
 =?utf-8?B?TU53TkhDMmxvQXJtTS9jRVErTFBLcWRpa2NaYU52Q3gwdkdIWE1zRUoxQTdV?=
 =?utf-8?B?RkJyRjhIVE1vbG51MWgxTWRPWDNqODAyemxWRnJSVG0xakRtVEM0OS93RmJY?=
 =?utf-8?B?Vi9yQkpoQ1BPVFJyaVVNUFV1aHFmU1V4dkhwOTdielI1R1ZpVC9OeUFjck0w?=
 =?utf-8?B?dWRVQmpWaDZaN3JsUzQxbzBHVzV5UTFobjVienNSVnJ3WHkrSjgvQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32162d16-22ed-4584-681a-08de68fcc57c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 23:33:18.8954 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +gsx8HxYH8dKOOiYJ09vB4zVSrQvIbhaxp+Uk+VCkg/kAcG/AhVVqJoCfXuduymqcQM3uNYkyxRXaFsuxHdfUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8586
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,garyguo.net,protonmail.com,umich.edu,nvidia.com,weathered-steel.dev,collabora.com,joelfernandes.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[50];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 95315120040
X-Rspamd-Action: no action



On 2/10/2026 6:23 PM, Danilo Krummrich wrote:
> On Tue Feb 10, 2026 at 11:06 PM CET, Joel Fernandes wrote:
>> I wasn't implying to give reason to go for more allocations, it is about a
>> reference to the same allocation that may be required to be shared from multiple
>> objects for whatever reason. But again, currently we don't have a use case for that.
> 
> Sure, I just mentioned it since returning an Arc instead of an impl PinInit
> removes the option for drivers to embed additional driver specific data into the
> same allocation, i.e. it might set the wrong incentive.

Makes sense, thanks!

--
Joel Fernandes


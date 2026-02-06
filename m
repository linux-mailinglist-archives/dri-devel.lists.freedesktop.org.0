Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDOYCzEThmk1JgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 17:13:37 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B6D100183
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 17:13:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C65E810E835;
	Fri,  6 Feb 2026 16:13:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="pxzmmWjw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from LO0P265CU003.outbound.protection.outlook.com
 (mail-uksouthazon11022093.outbound.protection.outlook.com [52.101.96.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5770610E834;
 Fri,  6 Feb 2026 16:13:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g1i5O1CDvcvIIgA7RAWvbJ55iO2euUNEKv6Cx4qskfm4NrhD6xdQcZPF4s481qog4ZSjRnaL+f9jlrn7iChoxBVrtlEBhT4iSXuhSk9/s5/7+Rc44O6Xmt4OQNxNskbh7Y6rSvaqgnoZ6AhMdoYHWjSjw0KI1XeL/D2vxNHW8Yl+i3ZH1XT2hBTycy+eyPqnTh0PMlsXylEPNWolAQGKsUKJ3qFHoawxJKU0ao5NGauhwnO5Ag0jEmAC8MQkchDmOVoxL7BuUyLxaebfvp0TqVm9HtbIYo3tMe/a5RB0vuJsrFfeHDrEQ0ulL2hhsy2q+z+ml7tecCP/AeraKthZ5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kwg/Bj3YCXLxkqwlVHV6hoYjss9oBtGFg9qQi7DMymk=;
 b=U2eQ+MHJVf1Y07fDujMgveXe4lM7FHz9fryLhUmrsaWo3Npmu04TUjdGYuLyAStlV/906dO+PHVau9iVCBeWteP4RRegJpaH9Npm9M5Cegrv7szl7+IKFfwHxeRbRp9V6rYYnyJBfZeQEovzsmmqKZR4m6SxJVzXbZPtgnpi9l4uNWXEm2IvP1AoFLflpbRVFAf77AraocYPuuIe/XOlrYhoHhOOEra7po01YaTF0ltC3W0mNCqv6XnYWsDqwlU32j1o4K6RwtVeVXs/7hWGUz+QBMW0QZSo/t4seC0n71isGAQycug+oaik6Ps4vsw9eb3q+vR/EwLTusqPMTXEbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kwg/Bj3YCXLxkqwlVHV6hoYjss9oBtGFg9qQi7DMymk=;
 b=pxzmmWjwdjiprjPiyNVQSJaY3CIaKK0Lu4KS4iXL2CQxbPJbShH/gpEkH2J/hfNhguiBphvDMpUwtEhmk55U0bZiKTbK8SxtADW+M197EJuXy8/zoAXDVOcPaTXhicGEtjYMpXlTXeMrR4KQ2XRGophFm+Eq9ZddTmyVQE+5HM4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB2018.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:6a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 16:13:28 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9564.016; Fri, 6 Feb 2026
 16:13:28 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Feb 2026 16:13:27 +0000
Message-Id: <DG80FV3VTT6P.2ZP18EM8605GT@garyguo.net>
Subject: Re: [PATCH -next v7 1/2] rust: clist: Add support to interface with
 C linked lists
From: "Gary Guo" <gary@garyguo.net>
To: "Joel Fernandes" <joelagnelf@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Gary Guo" <gary@garyguo.net>
Cc: <linux-kernel@vger.kernel.org>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Jonathan Corbet"
 <corbet@lwn.net>, "Alex Deucher" <alexander.deucher@amd.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, "Jani Nikula"
 <jani.nikula@linux.intel.com>, "Joonas Lahtinen"
 <joonas.lahtinen@linux.intel.com>, "Rodrigo Vivi" <rodrigo.vivi@intel.com>,
 "Tvrtko Ursulin" <tursulin@ursulin.net>, "Huang Rui" <ray.huang@amd.com>,
 "Matthew Auld" <matthew.auld@intel.com>, "Matthew Brost"
 <matthew.brost@intel.com>, "Lucas De Marchi" <lucas.demarchi@intel.com>,
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Helge Deller" <deller@gmx.de>, "Alice Ryhl" <aliceryhl@google.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>,
 "Boqun Feng" <boqun.feng@gmail.com>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Edwin Peer"
 <epeer@nvidia.com>, "Alexandre Courbot" <acourbot@nvidia.com>, "Andrea
 Righi" <arighi@nvidia.com>, "Andy Ritger" <aritger@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "Balbir Singh" <balbirs@nvidia.com>, "Philipp Stanner"
 <phasta@kernel.org>, "Elle Rhumsaa" <elle@weathered-steel.dev>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, <joel@joelfernandes.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <amd-gfx@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <linux-fbdev@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260206004110.1914814-1-joelagnelf@nvidia.com>
 <20260206004110.1914814-2-joelagnelf@nvidia.com>
 <DG7ZF1UT98RQ.3F42J3ULGV2OC@garyguo.net>
 <DG800TDA6OXQ.275PMMS19F1EX@kernel.org>
 <77ac3274-a962-469d-a2f6-6ccc0670988a@nvidia.com>
In-Reply-To: <77ac3274-a962-469d-a2f6-6ccc0670988a@nvidia.com>
X-ClientProxiedBy: LO4P265CA0172.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:312::15) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB2018:EE_
X-MS-Office365-Filtering-Correlation-Id: ed152add-6b46-4b58-6969-08de659aa9f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bXFxV01Dcmc2MUxYRHpYcUI4RFo0amJha1BnNE0vZE5sdlFWWkZ0WU5xaUU1?=
 =?utf-8?B?MlRGNkcrcXZWa3Fjc2JKWjNjMFVUODRLdStrWGN5WXNJa05COXB2MmV0M0hD?=
 =?utf-8?B?TmZnY1h0RndXNFZUL21rcE9xRENqeGhoNEgxeFZuTllMbXJqK0dJZmxmMGly?=
 =?utf-8?B?VnptbHJVcUo4WC8zbElsZVRtUFNKWlZBYnkrZjNSbHZaZmVzZDV2Q0lFdzBH?=
 =?utf-8?B?S1lacGFycE1LM0hNYXhMblFCUFl3dkE5aC9iVmpOYVZjYVhLL2NGK0IxQlFY?=
 =?utf-8?B?Q3NWOThGRG9qbkE2MXdyemdQZ2ZwTk90THFvWCtOZVRvcmhBVGVoVVpmSXd5?=
 =?utf-8?B?WWp2bU9YU3VoWU5RY1dlaDJPUDRmbXo1ekhXUjNFRlc3WGwyV3E3dGQwUitE?=
 =?utf-8?B?MDR1YnhTL1o3RUVmd1Y2ZG9BNjhBalcyVWxSYWRDa1hHbHdKS280dk1iWkxW?=
 =?utf-8?B?RFYrQXlla0RjYmJVN1VjRXlQcDhycEVQU1NUUGNLcWxQbno3N1dwQk9INU8x?=
 =?utf-8?B?cEF6cmNMVFB6d213RzkvRmpWR2pMT1V3V2FqMjhaZlRjNXJhZGJzUWtnMmRM?=
 =?utf-8?B?QXBaT01aY1I5a0VVNnBiRTl1c2liNTE2S25NbW1Tc0FuUEZmT2dTTU9kMHFF?=
 =?utf-8?B?bHgrQk02UzJrT1hhWU9UcmoxVWVyWUpMVlFPNjQyQ1FyYjVaOTR6a3pVandS?=
 =?utf-8?B?NTJxNVIwQXhGeEUxVUc4WmlZbGlsczVlZHNwSWlycjBpT3hUL1JqQmpaUHMz?=
 =?utf-8?B?NERtK243ZCtqM3JDRTIvajY3dXVDZ3YxQmJscFMyTEw3SldOU1ViU3h4SEpi?=
 =?utf-8?B?LzZCc1c1cTZSbmpCUzRiM3JFMElxUjV2S2FkbGJtYnI0aUpxelhIYVdXLzlC?=
 =?utf-8?B?Nk01UitjSVlVem1teU42U2tWaDZaZHRHRFNqK1lGdXdBbXA4SEVaRUVHMTMx?=
 =?utf-8?B?R0p1QnNpUlVId3RZOGdoeHYvWmZFdGMvdzRIc1RQdDU5ZzR1NldPR2pQZ2lu?=
 =?utf-8?B?azRSSkxSZ1RWa28rSHZlM2IzdlcvWE1JVnkwcEx1L0F5bG9mb2xiYTAyWUdL?=
 =?utf-8?B?OUdldDF4WVRmak9yNXVSSVFSaGkrVVhzUVF5eGZvTStOcWJCS3lXYWlYK0VN?=
 =?utf-8?B?VkdGZGc2c3l4b2h4Z25tWmZCd0R0UFlwZEgyQ0dQVDNOVHpiUE9ac29DenBr?=
 =?utf-8?B?eDQ0VFdvdlZEeEdtdVNvTlZYWGhOclM1bHovU3RMWEF5WGUvN01NRk9vNXJK?=
 =?utf-8?B?aWdublJzMnNPeUpjRjBtMHA1U3N4bXFzUHp4Y043UTNBL3RFSnUvaXhhaUZL?=
 =?utf-8?B?a1hvZWxaVC9UVzVYbGlySVV1dDlhUHVXT1JGdnVkZDdrWGVhU3lmU1U2N3Zh?=
 =?utf-8?B?MFZHcXYzTndOR0dDQkZWTFUzZjZqanh5S25zTXVYTlZ1MEM2a2k5OWxXNzkw?=
 =?utf-8?B?OVZlQ3pQMm96MEVzMjloS1FxY1diRlB0YlJHUDhDL0pUeDhlMGpoYXR6ZWdk?=
 =?utf-8?B?TnNLNUR2TThHaEZ2dlVWK2dTSklVUmdnZ1o3bWE4NlpLTEVkVWtRaXBBeHB3?=
 =?utf-8?B?M2JsZ2UrUE0vQlJONUZqVWxXNjYzQ1g1QzZSMXBGSXpja2JLdUs3SWt0RS85?=
 =?utf-8?B?QlZUTnBzemV5UE5hc3kydS9EYjlsYmxCdmw2UWd0VVJsa2dFYkZFN0FFU3pl?=
 =?utf-8?B?Rk8vNjBzdFdGa2x3QmFEWENONTFHM1B1TFZjdWdBWVEvZjN4Zm1qOHVRZU5t?=
 =?utf-8?B?T0hZdzlYR1ZQYjF0cTBvWFdwL2UzdGhHSCtZNTA0czQrbnBjb2g3amZ0Q29o?=
 =?utf-8?B?WUs1c002d09tZWxyTWRvVjF5Sk9MY2x4MG04S3dGQXc5dW11MjRLRllsZ3A5?=
 =?utf-8?B?QTJKdTJWc3RRdjJ5SVNQZlZGTjVEbEdrVGlEdG5QOCtPdnRDYU9kdDRpOFUy?=
 =?utf-8?B?RzNRcGdxSDVpNzV1UE5Dakp2L2dqQzNNUC8rTndRWkhVUGk5a1k5NG1uWXJy?=
 =?utf-8?B?UXUyKzcxNVNTeEt2a0Fkb3QwUnlFKzROVERUUWE5VFNtcHVQWjlTb2kwLzNL?=
 =?utf-8?B?ZlczWHA0SW5FdHpSS3VyQzVQYWt1YmFibC8vUG9yM1BSYm93ZE1uSFdZdDl6?=
 =?utf-8?Q?QOCM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0xhNHVlRUdQd2ZDenJPcmR6N2FMejBhY1YzT0Q1OWJtbEZwZTh4a2hFUG90?=
 =?utf-8?B?VXdndXhPQUUyNHJxSktpY2lVODhUNjBjUVR0alpVdjZZOE8yWjVETmZPaHJ3?=
 =?utf-8?B?cStDUk1iWVo2amtvM3N3aDRtV3lPVHY2MFR5Q015NURoRzVQaDJmNkl0eWlO?=
 =?utf-8?B?a2t6K09NU2VEdDl3ZlcvVlJ6TjZ4ZFptVHBFNEFocGNlUDhkVnQvSDF6VFlV?=
 =?utf-8?B?YTVTdUNYMFRGOGN6dFVDTXQvWWF3bEcvanhYRGFteVo4Z212Y0xkKzZqd3or?=
 =?utf-8?B?VXZlOUdmZE5CSnJSV0h4ZEMyVHBNVldhUGxlaGt4aTBOQ24wNGNYSWlZUXZN?=
 =?utf-8?B?T2xKQWRVc0kyL2QxMGw2SjVpeGNiZU1PM3ROSW94L2x1bHBqL3RsUllNWjQx?=
 =?utf-8?B?bEsvR0tJdjBnUjZPTnVoOVVqc01DaC9vYlNCcjhSMHc2amEwWkZzQ2ZXekh6?=
 =?utf-8?B?ZVJRNnM0NzQ4bVVPQ0hINko3UzcvRWVUYlkwMHlXc1dNc1kyV1d3ZmZtSi9q?=
 =?utf-8?B?eXJhTi83Q1lsRktHZ0p6RzVpUC9OSCtna29BYlE1dC95Ky9xV2cxcm5ERG1y?=
 =?utf-8?B?ZHdhSHZZL2RNMm9ZMTRGSElPOHJWRjFoS3YyK3FBdG9KY2N4UmJyb0JKa096?=
 =?utf-8?B?VXpCbjdiZFd1TlBtRXQ2VnFISUdOWGRrdDhtak4xY3NvZE9pa1pSQkZVelBL?=
 =?utf-8?B?OEExS2dtNFQwY2h3cC81ZUhQblo1UllyYlNLUWtXVXRMOEREUTNuZ1NDZTJo?=
 =?utf-8?B?dFZMSHdFZ0tKVlNHREFnaDI0YnNTU25mRmlRamlzVnVmZHpMcGgza1JodXJB?=
 =?utf-8?B?MG1HOGJUQzk4SjBWY1ovU0UrN2FNQlFxdmluTHMxRU9WWXJuOEpiK2JwSnMv?=
 =?utf-8?B?US9ZbkxuTDBYakpHNHJWNjBzVHFMM1hsWkRveTZ4VmFwNWZwNnFtSWdFTWJT?=
 =?utf-8?B?L1Y4Q09ncmFSWEVRT1lvcGJpWlAvRW1jcFZlZVZTRGxudE5XcTRxeU5SaTJk?=
 =?utf-8?B?TGVSNzhLK05ZZk9qMk5wZVMwd3diZnVhWkNJOGpOY09WOFlYamlxTDhLUnYx?=
 =?utf-8?B?cnhwVkx1SlBwTmJQdEpmYjBCQXhoUWFKU2N0VjRkUkUyanNycGZ3T3dadlJE?=
 =?utf-8?B?a0xZZUpQSkQxOStnbml6ZHM1WHNKYXB2enIzZGxQZ1I5UHVIVjNIY2hlUG1F?=
 =?utf-8?B?S2VuUVF1V1hCSjBKVGRRZ0pvRXpnVFlPY3lrL2tlbjVVTmpWbG9VZFNubnBE?=
 =?utf-8?B?UERiWXZrQk5YRkRqNFpsZGF1RG5hVUJ4ZjFwRG9XVnhncTZnazVMUE5uN0JQ?=
 =?utf-8?B?cXdEaU1LRU8xRUVzMkpPNElCbTN1N1l5OGU2MDBDbUpkckh0V2hXZTlhYzB3?=
 =?utf-8?B?ZklLZGRSMzZxdlpxUWNBMytVUU1yMHpDeC9jR2pidUQ5cW9FVW1zdkJnb0VI?=
 =?utf-8?B?Tk5uVk5sSTRDeklKa2hzbHNPczd2cWlzVHUrbldqbUVMM3hPQ0tUVFVmRUIz?=
 =?utf-8?B?elh6NzUzdElySlJkdjNmOVZYbUFRRHpkbk80MVlTTWdWUkRIeWJqNVZ6TTl3?=
 =?utf-8?B?ZHJSLzF1N2RuUDhlaFNmM2gzMk9SaFpRaWZWcG9HK3FKZDMzZmlDRlpjcTRz?=
 =?utf-8?B?WW5mdEh5YUVwZWxVUjBwTHg2UENGQW9FdURzMWdyYmhsSmVJcGlwbG1WeCsx?=
 =?utf-8?B?RFBYeGdZdExGczNMVHBXMnI1VTlLTnRZcysrVkNiL0xGQXpYYnVXOUVKdkVy?=
 =?utf-8?B?ZU56ZG9ycEpOWWVvV2JKTFRXc21QeWdlVFVCbWQ1WUJpM3RTR2ozQjRUTm9S?=
 =?utf-8?B?d0dQbm9aOEhTOFZiZ3FGNFQ5VTAwSkREZ3VEeVZLWHhWU0FPNzF2NDNTT1ly?=
 =?utf-8?B?NVFEbkhUc2RkUm5Tdy9OYmZ4UlJoS3B3RG52VndmMjRPbDZ4K1dOZCtBT1NR?=
 =?utf-8?B?VDN6VU1zTERydGJSdlJBNnZqUlNhVDR0M25pdHFvcHk2T25zODhrQW1nT2hH?=
 =?utf-8?B?L1RreUppNElNQzFUKzh0TzY5ak5GeHR5bC9PTGM4ak5uWkUzU0pvS0VaSzVS?=
 =?utf-8?B?Y3EyWkl6Rmh5a1B1cUZuQWhWN1pOcEZwb1psdTZpS1Rib3Y5NzdpdmROb3Fy?=
 =?utf-8?B?dVdhSW5zbmRULzNQQnVPMUF0UEd5REt2ZWRhcVlsTnBPZHlaSnZ6OTFWOURu?=
 =?utf-8?B?Y2VrZ1ZkQ0FEbitWaWF2bWZlNGZZTndTWHhiemVWckNndDg2V0dtR1BINTBM?=
 =?utf-8?B?akxqRDJXRGh6R3BJQ2dqNVZ2Wm1CckxTYWVDeTJFaEh6R3NJbzY1ZVVTamRs?=
 =?utf-8?Q?GBsO+7/Bb0JycX+9Ak?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: ed152add-6b46-4b58-6969-08de659aa9f8
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 16:13:28.5461 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HmbBqhRocyqG7sZFTfIOcT4DbEOtYciyCSERzAzwhaLa8JQsYLTxK4jx30UBurd9W1m7VjaC0TdExmqJpEaRxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB2018
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
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,protonmail.com,umich.edu,nvidia.com,weathered-steel.dev,collabora.com,joelfernandes.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[51];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[garyguo.net:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[garyguo.net:mid,garyguo.net:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: C8B6D100183
X-Rspamd-Action: no action

On Fri Feb 6, 2026 at 4:05 PM GMT, Joel Fernandes wrote:
>
>
> On 2/6/2026 10:53 AM, Danilo Krummrich wrote:
>> On Fri Feb 6, 2026 at 4:25 PM CET, Gary Guo wrote:
>>> On Fri Feb 6, 2026 at 12:41 AM GMT, Joel Fernandes wrote:
>>>> diff --git a/drivers/gpu/Kconfig b/drivers/gpu/Kconfig
>>>> index 22dd29cd50b5..2c3dec070645 100644
>>>> --- a/drivers/gpu/Kconfig
>>>> +++ b/drivers/gpu/Kconfig
>>>> @@ -1,7 +1,14 @@
>>>>  # SPDX-License-Identifier: GPL-2.0
>>>> =20
>>>> +config RUST_CLIST
>>>> +	bool
>>>> +	depends on RUST
>>>> +	help
>>>> +	  Rust abstraction for interfacing with C linked lists.
>>>
>>> I am not sure if we need extra config entry. This is fully generic so s=
houldn't
>>> generate any code unless there is an user.
>>=20
>> I also don't think we need a Kconfig for this.
>>=20
>> In any case, it shouln't be in drivers/gpu/Kconfig.
>
> Fair point, I believe I was having trouble compiling this into the kernel=
 crate
> without warnings (I believe if !GPU_BUDDY). I'll try to drop it and see i=
f we
> can get rid of it.

If you run into dead code warnings, I think it is fine to just

    #[allow(dead_code, reason =3D "all users might be cfg-ed out")]

the overhead of just let rustc type-checking this module isn't worth the ex=
tra
Kconfig plumbing, I think.

Best,
Gary

>
>>=20
>>>> +
>>>>  config GPU_BUDDY
>>>>  	bool
>>>> +	select RUST_CLIST if RUST
>>=20
>> If we will have a Kconfig for this, this belongs in the GPU buddy patch.
>
> You mean, in the GPU buddy bindings patch right? If so, yes, I will move =
it there.
>
> Thanks.


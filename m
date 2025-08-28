Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D35CB39B7A
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 13:26:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABC6B10E97F;
	Thu, 28 Aug 2025 11:26:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Q1Xxyt7f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2051.outbound.protection.outlook.com [40.107.223.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1054510E32B;
 Thu, 28 Aug 2025 11:26:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IVOlvWMEvr7cJ6dKLEsiRDi2R4hQ75+ZDOl5UDODbtLaOz76dPR3LfSMYc161jtqJEBmrmfIlUAp3PG45XfPiu6B6buDpQjuEcg/01GG5dAus+qM13jAQ90OmX94rt/yCDO4AJ4x2eBbDzZgSM1JCpRmARGNOydba9kKqkaG4O8qpl3hzOGd45+S/TwY5L/ieiX2cSagMnjwOl5dXZxlM/rkFhToxGu9y5StNrVaVSroRUh98nRRAcdcW5Nu6Ek+8cOJ3DGL12IwqmzmC0kpL6asp0bMkytl2srlORb6hQF32eMsuCvEb70Kvs02oGx8D19J8b+T+CnOjhiqyjvVbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mXrSRXKVinfzmy8xDzJKpzSztRvvpt63PaC5gTnti90=;
 b=MvX6uk4O8fNGbh4jaNooij55HYcdSbHg+yN/tluD3b1USwiM3uQmTKvC12EYomfKt7jEcfS0cAihqfu8If+n0D5saXt1TySpVGNrz3x+8tUzkKeoKMHVvjzoQPPCHOVOEWRJOhp/9LOx20drYU0D3kHkShYdcLRwFvpuNzL5VnauzGQx2N8qWUBaScFhJNmJqkzlpfg+zSMWcg2JWHna0RBvARIesWefJT7uB3dmbCmyDiGpuuDzw6QE8A0uRJkL2nn3jD55R5Kn6qGCsLYl8/bw35Vljb8N3p9cckm2vDi2SJvCZD/JhXKqE2Pob/mAMo6bHWZlHSwD6T1g6QfsQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mXrSRXKVinfzmy8xDzJKpzSztRvvpt63PaC5gTnti90=;
 b=Q1Xxyt7fn+VQxLiDiIbxslB27QdURG9eIuujSfDh9c8lRhXthIhEGNpOo3rfzLjIZm3rVWLbN+99OSXHI4oGmZHG2xGQTc8ifO+NwifJQh1rodUBKI00cO213IaBNZU8avg03+Cx26JBNFtpUihowhk93WsFX1bgVm8uNUSAIR9vRljlu2JNNbZ/YYu3a0KFvvMUjfuKVcRP6MDG+i37c74g8mZ53zXn/m/XBPRq8ijWfOwIdeAksW11M8HYyLrRvqFXd45PPpJGFCkWnPEpu2mCc36Y/OwQYodbdWy6HoGuwHPZ+xRuBPzuCtTFLZvcxGBfUj44QN/M7TyWXshypw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB8344.namprd12.prod.outlook.com (2603:10b6:8:fe::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9073.17; Thu, 28 Aug 2025 11:26:41 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.9052.019; Thu, 28 Aug 2025
 11:26:41 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 28 Aug 2025 20:26:38 +0900
Message-Id: <DCE0VZXSP39I.FKGHKONUTB5L@nvidia.com>
Cc: "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v2 1/8] rust: transmute: add `from_bytes_copy` method to
 `FromBytes` trait
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250826-nova_firmware-v2-0-93566252fe3a@nvidia.com>
 <20250826-nova_firmware-v2-1-93566252fe3a@nvidia.com>
In-Reply-To: <20250826-nova_firmware-v2-1-93566252fe3a@nvidia.com>
X-ClientProxiedBy: TYXPR01CA0058.jpnprd01.prod.outlook.com
 (2603:1096:403:a::28) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB8344:EE_
X-MS-Office365-Filtering-Correlation-Id: 7117e757-abd4-4fbf-fb95-08dde625c290
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|10070799003|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RnEwaStWTW05Z0ZPY3BCeDlkTmw4dEY2dWdTdGVmZmR5OHpKWjFja3pRdGNq?=
 =?utf-8?B?TFA1bThoMk1ySTlBdUMxKzlTMklKbUtUWUtGT3l6RzRyNVBHU05rdmdsT1Zl?=
 =?utf-8?B?NGRGVEJLWngwWWVQaWNEVW5ITGZERGdMN2RoKzRaeEhhQnZnWGFXSDBpVDBt?=
 =?utf-8?B?SXRMTnNSLzFuY1lsait6MnJFM1JEVXFqcFo5WEtpNUl2d0pOOXc1OHBqR3Jx?=
 =?utf-8?B?dFByZnVLcnVsRS9PVm9vZ0lDVDQ0MzBuV0Y5dWtuWFpjSWN0ODNITEVvUUNX?=
 =?utf-8?B?WGw2RnpxeUFQUTQ1cnlzM2pIaENSSGt3djNoMGp6THJTQnNmL25iV0JaVXpG?=
 =?utf-8?B?QlF1TXBqWHZjMlJsdFpHaVhBUjZ5aEcxTmU2LytUd3FxQVFNa2lWWDhXaXhY?=
 =?utf-8?B?U1VIeUw2bDd0QXZsQ1U2Tk9TazVhV05Zc0hvTWVuQ3V3SEQ3MzcxVzJwbnRB?=
 =?utf-8?B?NzVubXB1bUxSbkNWRTNiVUVPS0E3L2V0Mk5sWGFiYk9TMlA0bXc0SlI1VFBG?=
 =?utf-8?B?RUtUVldUVHpGV3VTNnVaa1UrQnV3ZHBQbXlaeGRMK1JrTEVDdW5RVFRKUEVS?=
 =?utf-8?B?ZW5xQ0t1S2J2Rmx0YkU3U3loR2t3a25Ba0xHdlRCbUdseFpQNzkzVXNxSEE0?=
 =?utf-8?B?RzNYb01uVTlIaGJEaE1pYXNmMVdwK2c3dTkvK0dyR1JjOXdONlhob3E5WDlq?=
 =?utf-8?B?cm9PSUdNc0h4NVdKd01XWXVCcFpoeGVmdkdXSDR3bEJyemJCSDNKZ1FQVFJT?=
 =?utf-8?B?Zy9RYWw1VFJ2UHhlcEduOG1BQnNkV0dwVHU2YzBrdndHc2FFb1FvNEp4UkxO?=
 =?utf-8?B?NTNhRDRsOVY5YzE2ZWNRZWFDa2tOYVpSVzNVa0g5UnhycU14dDNrL2t1aXAw?=
 =?utf-8?B?QUZuQVZXOXFoV1MycVk4Uy91MVlVeXRxZllvSTVqV1NQaGM4a2JUNG90ckN0?=
 =?utf-8?B?MmpFVVhvcDkxc1c0TFkzWXNYYi9GOWVIUytlR2lHOUJFbnFmamhNMHJvbWpE?=
 =?utf-8?B?SVRPLzlTaHRIa2ZwVzhxV2U0bWtmWlNPYk5GcnZtNnJBcWQrK1FWSFlrLzBu?=
 =?utf-8?B?OUhsRkhQL0VJVXZQTE0xd24zSXprQkg5M1R1UVloTnB5MGpUWjN2L2NUSW5B?=
 =?utf-8?B?Nmkrd3Qvc1VqKzFvV2NheHJ4T0VBbHFnSzNSS3g3SnJOaVhRdERsaWZBS1Br?=
 =?utf-8?B?bzFjbElhdUdNQThJUVpUS1UvQUQvWjNQSldQR0FhWW1OeFA2MFBySlA2RVVp?=
 =?utf-8?B?TGs4ZzZqMGp6dUlrcEVUQnFiWS9rK3lnSTBNaUd2T2pqWmExKzFUeEVwcktM?=
 =?utf-8?B?WXhwbEY0Z2toN0lmVFdLY3FONkdQRkJ2TnkxRElkSVh4M0FvcFZlWHVWUVV4?=
 =?utf-8?B?ditnRThUVkV3YUtRdTZVdGVlK000OWFNS1hNZGlobThqYUtFb2NLYTRUdHpw?=
 =?utf-8?B?d2NmWDBrMDdWS0FaMmJ4MjRraTZ3U3JEL2duVnFDR3N4aDRseUJ0dFpWSVRW?=
 =?utf-8?B?WUg0d01IR2wzUlQvSDNJeS9JZlRKVkVCaFFhOUtwalQ5ZFczMmFqMFpRUXJX?=
 =?utf-8?B?dFkzL3lCV2ZVNGNxSWtwbEFGRDlSam8yS01hR3JEektBQlJzbTM1TFpGNW5p?=
 =?utf-8?B?TVZYcFVRRmZyOU95MVAxRjVDd0tjOWxyckZ6MmhXRFVueVNnMyswWG0zNStZ?=
 =?utf-8?B?enhvR0ZITXpMdS93MVN1N3phVU5hUWM2NEtjUWhxcmR1WlAvcUM0d0NMSGZk?=
 =?utf-8?B?Nk1QelhQMC8yRkNScGVlM2xENlVzcXNTZXU2L2RSa3VNdStiRTN2WndLVUFI?=
 =?utf-8?B?R0RDNDJEK2NaYUl3WmtzR0c3Qm5xWnhVTFZleWRLYlRBTFY3ajVxSHBBVlFm?=
 =?utf-8?B?bjdrdG1zS2JPcDhmNkpVRkdycWYvRXd6ZFkrNHFDU3JXUlE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(10070799003)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bklaZGZ5QVhFbGhySWVCNWJQTXhzSDdCektUT2IxQzd2aU1LdVY2dXpPWUYr?=
 =?utf-8?B?aitLeVNyMW4yT0ttMkhKeWpBbk9pWGFLaHV0NStXR01ZelFSejlYb0RJYUNN?=
 =?utf-8?B?ZnNUblNxb0krdlUyLzcxWmZYNXl3ejdyMFJBY3oxZ2JqcWRPRGdmSlJZSHA2?=
 =?utf-8?B?V0xab2lEaHM2M1FZTzI3cmxIWEVDZHhHT3NxSmhrN1JEM2JXVFA3RGxseWZt?=
 =?utf-8?B?LzJKSk1HWWJKelZDOVBFTzE0RjZNUUYweElsbFExOWtrNFc0ejJnNDB4SE5h?=
 =?utf-8?B?Wk4xRkFrSVpSbDM4b0ZvN1NGNkJIaml0QUpjTlpJVDBURjBjejhaWG5mSGdj?=
 =?utf-8?B?TlJCS3VWRlFhWFVyUUJCeU8zblptV214UzBUVmhOL0o1eFE3cVNVSUdpL29l?=
 =?utf-8?B?OEdOQ3E0Yjl6RWQ5KzltUjN3TnUrbGdtMDZVdkZsdmM5RHNIdFhsc0lRbXVZ?=
 =?utf-8?B?a0ZHbUNwUjFpMVFSOUtBSTNrdmZLWTN2RjF5QlpDdEdkQWdqUGxDdjlkTGV3?=
 =?utf-8?B?NjJVNjhMOGVPRTlUbWxSTGtWMlA5aUdzZmc1a3JOdWNPRlRzTzNKSW9qQ3Mw?=
 =?utf-8?B?ZmtPclhOVEJsQ1Z6N1ZUWHRtdHNDV3VpUVgvWVhkZ010MWFRbnF1NXJkekI0?=
 =?utf-8?B?K2JHYU1MMkNjdm1uNGZuVjFGNUVxQWZ1T29IM2FwcFZob3V3MXdpdU9URk1I?=
 =?utf-8?B?dzMzblA0bVF1blVvczF5ZXJiM1Z5NDFjaDFITStUVm1PeG5YUmNxK2lHeU9L?=
 =?utf-8?B?bEdBVjR4QityNEwzT1lNbFAyOEFCbThxVzFhZ1lRUHVIU3g1QnlzQ3loL0FI?=
 =?utf-8?B?N2VnUnVCZEdFUmV6eWw2NGVkYnQwb21XR2tvMnpOT2tBNFVHcVRwR3FvTW5u?=
 =?utf-8?B?ZmFaNFlMT2VvR09wZlRJcnFoUXNmeHptS1FjdHd1cGl0Z3IyTW9Jc0ZzTTRS?=
 =?utf-8?B?VmNYdFlOQmQ3cWhyOVBHL0VvdElaRjBMcDdNRjh4NDBKSXphcFVLbk9tYm1r?=
 =?utf-8?B?MGNYdk1JOWNPWG9PZlVobThKVjQ1MzB1R3htSEdKUjFLYjV2bHRtSDg5ekhp?=
 =?utf-8?B?VVg2dW5SeHdESUxreDJEMTNPRkFSL09ZdDQwdEVxUXVsQU9STkMwZGVxcVlR?=
 =?utf-8?B?ZkNUV2tnam44K0tIQ2VUcUJXTFg1UDM5WW9TeUVUeGkvS1VLNWpCbU5kUStZ?=
 =?utf-8?B?bHcwckJneXhLcXJ2K21scjk4QW1yaVJZSHhodEZJanJaZ2JCQzhaSk8zSW9P?=
 =?utf-8?B?UjJvSnpYZEhkZ3FuNDVaR095dXJmZHMzM0syc24xaHVEWFphQ2xTcTFrQ3hL?=
 =?utf-8?B?RWkvOExvNjVLcUY5MGV5VmN1Z2hzcENPalkwSFA0QUJvdFd1R3lhWUJlRFFQ?=
 =?utf-8?B?Q1M0dDFvWXpFSlVjWVBoaE1pNzVtK1hKb2tUVWZtejkvdithS2M0cnFPaXJN?=
 =?utf-8?B?a242VktBVHlBdDhRR1JHaGcvWm5hZDRlWVA0MFRBc1RkSjBTQmJQb2dvdzNI?=
 =?utf-8?B?dXFMSmpqQ0c1dmdvaFYwUlg2c0xrMXNMY1dqdWVlQ21xNTlTdU5QUGhPTjcw?=
 =?utf-8?B?NjkvMEFOMGp6eVNKYmFrRzVvZ1BUbk0xRUxFb2lkcCtZaHlxc0hrWm5zVEFr?=
 =?utf-8?B?S1Bla0d6dThwTHMwYWhoTjZNK1JoRnl2RWV5SmxOSisvQ1N0VlFuaTB3cGFD?=
 =?utf-8?B?NGF4ZFVoYzluOW1zejZNd3NHaEM5QjVvTXlOTDdkUG0vYnQvUXZyZUVreDVM?=
 =?utf-8?B?amt2QlYyS1hVZVNjd1ptK1p5ek1HME9ncjU5bjlyejhOU3cyaGR1K3RXam1S?=
 =?utf-8?B?UDd5cjhCQk1abkUraTQ1MlYvaE53dHlERGtxVFlrUVdVQ1FobmVXMkt1UHp5?=
 =?utf-8?B?UnZoa25TQjdhaHBzQ1c2TmNmUy9jaWNvS2tGL0luUVZ2cjdWKzM4WDl1TWdL?=
 =?utf-8?B?bXpmZmhxSDlKL1RWUm5yV3BiT1NFSExKT0tKM0NlZnJ1R2lOdXlJNHNVRnNy?=
 =?utf-8?B?Y0FHMEhDV1JyTlpQMjNLRjFzSXY1a0E0MUVCK2NlUkl5VW5sTDE5WEYrZGJi?=
 =?utf-8?B?RktpVUN0dGNRbVVIakVVYWlFQThNYjA2emRLTjJoNVBwSSt6WStFQTNPK0F0?=
 =?utf-8?B?QmRocGo1ZzNtR1BjVlkySWJNM3lVS3ZTc0RYTUE1eEZUNEhCaE9qQmZTL1JS?=
 =?utf-8?Q?nqxtZADA83l1lV5ROdeKKwRrcjxdpikgDnTsFdJS1xhn?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7117e757-abd4-4fbf-fb95-08dde625c290
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 11:26:41.3989 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nYG15f1RQk1fMQAxw2zaZbK16SPBpCFhRcMNUe+Xfq3xanHDU3ZA51Eds7CZlTmCoPPMrZjoWFRf8Dstyux6Vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8344
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

On Tue Aug 26, 2025 at 1:07 PM JST, Alexandre Courbot wrote:
> `FromBytes::from_bytes` comes with a few practical limitations:
>
> - It requires the bytes slice to have the same alignment as the returned
>   type, which might not be guaranteed in the case of a byte stream,
> - It returns a reference, requiring the returned type to implement
>   `Clone` if one wants to keep the value for longer than the lifetime of
>   the slice.
>
> To overcome these when needed, add a `from_bytes_copy` with a default
> implementation in the trait. `from_bytes_copy` returns an owned value
> that is populated using an unaligned read, removing the lifetime
> constraint and making it usable even on non-aligned byte slices.
>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

We got 3 Reviewed-by on this patch - Miguel, are you ok if I merge it
together with Christian's `from_bytes` patch, since they are closely
related?


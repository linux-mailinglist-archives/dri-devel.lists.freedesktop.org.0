Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 239B5AE06F6
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 15:24:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B78910EA2E;
	Thu, 19 Jun 2025 13:24:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Yqp3Vgnd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2041.outbound.protection.outlook.com [40.107.102.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 931A010EA34;
 Thu, 19 Jun 2025 13:24:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uVFbbv6O0tL9oulhecUDaRgTxndCdqlbwHcANKl0YjSZHpgC94igqF2l62xvzn96dcnSYYDzKXyTn6RI+8TFLynKBYbHfOpbo4PhkHXFVFLLyI7TxRp5q5Zs+fAHgQP9DrJqptSN1pn/ut/yPW9v58twE9Skg00vyi4FpFhJEnSR5J2w74K61L3IkXyBPRCsmV9XCTJYFAaOukCJA68Ojt609a+dByDEs1m9GKJbkqWUumZRT23HEsAAUEVyOhLjiCdXAdikuQvn5LWjsq8FUmUBs3y53G+Si5J8wkhig/80P6HYYWp3US80n0aVzWj9B32C3pgGoWxpVAC/D8W5gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aEuVf8ba764vp3/Ai+DXZ+XY05tF4LD1XFBSkLqR6dQ=;
 b=M1HCfL/iOSB251Dru0vPSuHO2W81sE4+5pL+Dgm+7POQgTca+WlhnYEW6AKAeSTN3iJh1IwCc5DtxRNFZXKODloTQnMXEAYm7CQVyVi3xL+1vLFmDybHveM7/b0fcouMNh2XK+B1qHvQP2FN7E9naboeJfMU0Oos7MxrB6nDtHljWoOcSfxvqBh2YpCzjR9BD0cwozfqQdHyR9gh4xS0g2J/OzAoqQzZUp60h+tVdEEv7M6YUqRVhqYmrBWNTpUuZ5djaIKuL1XgyZXJTYGctINfw1p9OOVzIrsyV5SvGruTj5glJMwvREZGyHyRGATuhFcMqrDqJCNshw9IA3N/Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aEuVf8ba764vp3/Ai+DXZ+XY05tF4LD1XFBSkLqR6dQ=;
 b=Yqp3VgndqW5bOKfB9zLyA1Rl1Qhup855VNOC8uri9C+ajQia5RVWkoALF335qyuqw/qbbu+VEINkumxrBcA67pOt6T1ofK+KuiNfBL0UQKFvCOHwG1THlp3XAKJGvtGrKKW38IUH8OYW268D/+EjvcfrpN7VLhysZOTJ27komkU3hYnshXfYQfZF1NSAc1rlUxcWILM6aPFgTforbXbDLYyi/Uc1ukjkYNe53qOP7jgQRKtfreDuMrb2gNY/auvXay8eDDwtDNzObqrzRAMpFPpD7vNmjj2Y+/jQfiZg5w+YTEAJiCnfqWaGoo4XWqyWIgyPoLqPxy6Ps3kR7w4lpA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB8122.namprd12.prod.outlook.com (2603:10b6:510:2b7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Thu, 19 Jun
 2025 13:24:38 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8857.019; Thu, 19 Jun 2025
 13:24:38 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 19 Jun 2025 22:23:48 +0900
Subject: [PATCH v6 04/24] rust: make ETIMEDOUT error available
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-nova-frts-v6-4-ecf41ef99252@nvidia.com>
References: <20250619-nova-frts-v6-0-ecf41ef99252@nvidia.com>
In-Reply-To: <20250619-nova-frts-v6-0-ecf41ef99252@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Benno Lossin <lossin@kernel.org>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>, 
 Benno Lossin <lossin@kernel.org>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TY2PR0101CA0021.apcprd01.prod.exchangelabs.com
 (2603:1096:404:92::33) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB8122:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cc0ee46-8fc7-4084-dcb7-08ddaf34a3f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|10070799003|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OTg2UGEwbkk2dEdkbEp3c1ozci9LRXQxcWQ5YlhiSFNLN1g3dW1QaHpVa0U1?=
 =?utf-8?B?Mll4WThVM251TUs4d2t4b2RsdVlxOG1qODJLVEM5SjZUbEFBYkFiYXZ2QmNB?=
 =?utf-8?B?MU15cGI4RVFROGU5WUc5cS9iNXA0Z1VCYjgrcGIydjdyNEJXUmUzVGJja0Vz?=
 =?utf-8?B?S29Ha0E5OEM1cTNaTC9adkwyaS9HZXBPbEFpQytYTHh2anZ2NjlpQnluZWVR?=
 =?utf-8?B?amJuK0F1aFdnaXArTW4zTm5zbmlhWFZhVXN1cUw1dGQxRUZuWmhQSy94T0s5?=
 =?utf-8?B?K085aE0rRk9kaGFja3UwR2IzRnVlSjRoUE5tSUFlMVhKZlBpR0pBN0xZWi9Q?=
 =?utf-8?B?TnVoRTNna0JRaUE3elpzdjR2SFJVYk1Tb0g1YnBLWGpuaS9neXk2QU5OaEVy?=
 =?utf-8?B?UVMyb0pFUnQrL1VycEhZaU1VZUVMM1FIcWZVdFNpOS9MSCt2Z05Cai9TeExv?=
 =?utf-8?B?c1NqQmM3QlAyTTNjb2tLcjNZS2lSeTBYS1poc3RmOVluYW1jZGNIWTROT3Rp?=
 =?utf-8?B?bTRlM2ROblZob3haUnIvZThDR1RkUGpWNFVJTHowcUFDWmtEYVRxRlhNNE02?=
 =?utf-8?B?emhiS1lWSkltbGhLWThEQll5aDIwU1J0RTVqRFFIL1pXUXRmQXgxK2grWDYw?=
 =?utf-8?B?Q1VxMTAvbCtrU0pHeXMySmREd3BQa21DTVc3dzFCMkV4WFZzM2R3eHNoc1cw?=
 =?utf-8?B?VmVtSHNYWHVtTG9XT1ArZmY1WExoNmdmeTNxdldaUS9yNGpGUkZDOVFhN011?=
 =?utf-8?B?UWVvUlhlNm1OM0t4bXBxWE1kczdHemMyalBFeW53S2xHYmNVbUN1b0EraXkw?=
 =?utf-8?B?WjVoT3lBQnZtT1N4ZnpTVGR2MGFzT1BCaUVnNiszVHZCa2o0SnZUaWd0YWQy?=
 =?utf-8?B?eHNQRVdRQ00vT1ZmcDROT2lkd0xZakFUUFg1NmhEVnJGUWRET1pQek9xbk1s?=
 =?utf-8?B?MTQrbHpQU2E5eVBOa25HaFBFYXlJOXNoYmR6UXMwYS82QjRMaURLN2dGdzY2?=
 =?utf-8?B?VGZiYWJ5Q0NUNjVjTHBqWjh3NVdXZFFVVG5KeFJLUE1wVkZscFpNc0FQV3Jt?=
 =?utf-8?B?dHB5UGNhbGt6cGVvVGZySUxnTDlmSUlzMUlQTCtITCtrWWt3cElkWEhsWGJj?=
 =?utf-8?B?U1hDMDR4K3Y5VEhaUFlJQVFROUdWVnEwTm1Pc0U2OHQrd3RkMWxHVW5sYiti?=
 =?utf-8?B?dWNHcW9nYTIxbW14U0tXeUFvTWwrTENWd1VBSU1GWVhTNGxhNWFLejBad292?=
 =?utf-8?B?TWFEMVZwUWFDeDc4RVpQN2JIZDI0cWNvOEZ1MTJySkVPMklzNG8xU2pXekFv?=
 =?utf-8?B?QnFJNWJDNlcyem5scjRHMUJ0Z1JLb3VCakdIdHVJU3RWTFRqYlpDdWlTQldv?=
 =?utf-8?B?NWJDQ0hRZVRRMzN1TWxIb0VNTmc1c2JRMEtLOXc4UmtueEhHQjh0cDhRZ1VW?=
 =?utf-8?B?eVlvYXZ5ZWJTWTJnSTlJRWhoN29rdTJuUUVoRTBoWWs2T0UwN1p3OFF4SHhv?=
 =?utf-8?B?MkpLdlVJNlE0aTVSTXh3bDNaS3hPYUpaaU5GZEVkdmorTjdMNzVnMmxBenFk?=
 =?utf-8?B?Zlk2WDhvYm13MnYyN1o5Q2lHOTVBVm9WcExHRlJkS2lUdUFXcFU0RHo2NUhw?=
 =?utf-8?B?VTEzbmMwckx1MW41QU9uMlhoZU9UWnIwWlVQT053eGxKM0tXcW9NRlJlV1pE?=
 =?utf-8?B?VGJGNWVRTEd3bE1LMWMyRWMyNU95VGxxZHNzRlA0czk2NnBRc25QWlc2dERS?=
 =?utf-8?B?L28xc05xMUp0dXY1QlJZMGF2dkV4SVJXM3Q1VGNxOFZxTVYwOVN0a2p5OVRZ?=
 =?utf-8?B?Qzg3bnZUOWJXY1pxWEs0WDZPaVVkQUVuM1pVZ0oyTEp3dXZucFZQT1ZhSUdF?=
 =?utf-8?B?OERWNnR2Nm9zRXQzeklUcEZTN3pWOXFYR3ZOQ3pEZnhHVmhuL2Fnbjl4cjV0?=
 =?utf-8?B?bFpuMjUvRGZyM1o1eWpvZkNxaFMvS0NLbFNwTjZlWXUwMkVGeWcxbnJZTDdm?=
 =?utf-8?B?UnNXOEIzVWxBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(10070799003)(1800799024)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3IvelI0dzNSY0x5dXRyczBXMW1FQ09GVFdJZGRKaXFNeTF6Ym9oem5RbzNk?=
 =?utf-8?B?Mmxib0x2c09KeDNPT1hFWFZ3R3VQc2lIanRBRzRCMDc5MTJmVC9LaVdpdTQx?=
 =?utf-8?B?WU1iam9YSVpuc2ZDSGNPZmZicUdPcjlPZjJDTGE2R2N3T1Q0Zy93UjZkRFV5?=
 =?utf-8?B?WlFpcmxtamQyNlZzTHY0RTJkSkUzdWRTc1NEdUl6WHdjRXBzV2x2bnFXcDZH?=
 =?utf-8?B?M1NOazFQQjh2aWVtb0pCd3ZWWTRLSjRXQk5kOEFjT2ZRSG1EQVpscG50UVB5?=
 =?utf-8?B?MngrQ1dZbHQzNWFObDBocTJRWWhtcC83bHRQUVN5Z1RNTWtFSmtVMklTZHh5?=
 =?utf-8?B?eXFFbEs5V1dmU1lrdzZ2Ukt0d25WSUUxZzdoZlMzUTRqZmRvL0RVMW52MHRk?=
 =?utf-8?B?T0E4RTdsVHdZRXJkN21aMXVwenhqQ1BMWTFENjhRREpWdU9IYjZKVUhqWVlM?=
 =?utf-8?B?YXYvMXhXdGtCanpiOHdZZkxhc0FRK3M2MzJkaHRLc24zYzc2Y0xYSXFUcmtp?=
 =?utf-8?B?bFI3ZnlkZ2tvLzdnNTh5dlNXRWZSWmpCdE54YjRBWHI5Qi95dy82TFp4M0ly?=
 =?utf-8?B?bFRUck9hbHJEM2V3NXZvWW0yQ0NqSEFMWTVpYnFzc2c5emlwZzVDYnVUc2hp?=
 =?utf-8?B?eVFkZXNET3VvNW9RdGxsL2dhVzRMR0lvYW9JaG1yVERBK0hPSkRsY3ZEalVL?=
 =?utf-8?B?LzNQL1JaM1h2V2VXWlM0TVEycFJnbklZc0wraUVyQkhPNkJmUTE1WUc2Yktl?=
 =?utf-8?B?SXY2TE1STU5iVm1Bd0VLK3ZzMmNubUUrbFVKMnErQXF2SzgrK3h2ek1QMFUy?=
 =?utf-8?B?Zm1mMXJqK2krZmdUVjl3cE1yc3lnVHJvNEdSK2RDSDYrSnpFZEZqRDE0Q20z?=
 =?utf-8?B?NWFkYnp2cEp3Zmh5ZXJxOHp3ZnNCcm5OZ3d1dUdsTzhCQmw5MlZGbUk2NzVU?=
 =?utf-8?B?UFlPSnFPQm9uVGsyRFJFcGE1ekZEZVE4eVU0Vjg3aGdXbEVVL0ZvdTNnM3hY?=
 =?utf-8?B?UFEvaSsvZkRWaXpmOEIxd0hYUFVsU0ZnUVpHdnB2QjNmY3pIMnJmcTg2Q1Zp?=
 =?utf-8?B?Q1MyZm1mUkl3U3pMaDBnZ0tpU3oyWCtzS2ZGNXhLQWFFL2k4dlc2ZWNRY1dW?=
 =?utf-8?B?NlBZaElYazdVRHRsOVdyRGVJUmVLSFlnRGJiNGFzRCtGcTdnV3dJTFp3dmFY?=
 =?utf-8?B?L3F4ZjlLZTBKcnBHNnQxajY4VHVFZk5PL1h3dkhLQWY0M3MvSnhGNDcxYW9t?=
 =?utf-8?B?Nm1zRDhLNWhjcEF1ZzV4UVlCbVpIWnN2NUYzdTFsWFJBV1d6Q1l6U1N6Y3h2?=
 =?utf-8?B?TjcwbDhRQnNOSXhTVWFzc3BWTVRobVZlYUN6NnhPbDdMbXJxN3YzT3BoaXlT?=
 =?utf-8?B?dG9wYUd2cFlKWHVoZExwUVRsbC80VUYvWGZPRE1NajVveXdqc3V2b0tYQTBZ?=
 =?utf-8?B?SDhOZlZlL0xtK1hUdmxzNlBNcUZqN1RxdXg5NnpZcFhrcGhXSXJKeGtJQ1lJ?=
 =?utf-8?B?am1Xcm1oZmRlZWYxQkRkZU9hcWZLL1FSOW1VN0tuM0NjbkhXZklUVlhIbnQr?=
 =?utf-8?B?OVVKdjNoTEFnV2hTUUlkQzBDZFdjeFlzcWFtbDZCcDQ1bFZJSWxZNlY0Nlp6?=
 =?utf-8?B?ekdkaXZmanVNWERJR2toQjZ4L3FDb3ljMzZ3TzEwSnlROXVWeWRMOTFLOEdn?=
 =?utf-8?B?WlV1SnBCOVRTdGM2WXhLUEVFbUhyUlRRWDJJbkRJQjB2eEw0K2FCUXg1cE4y?=
 =?utf-8?B?a2MzYnRyWlpVUHhNUVlzRFhVdjZTZUk3YloyQmdqaC9KME5OM1JtRGlrandj?=
 =?utf-8?B?TEQyVnJNOFB4WWx3OGpKVmN2MzNIQmgyazhGbGx3N0JQelZKQ3F4NC9vS3ZI?=
 =?utf-8?B?RzNkbWNnQjg3OElOZlUzdGNhV1NCRkRqOXVVM2s0d3A1aThqL2dPNjZmOTA5?=
 =?utf-8?B?bm1mVXpkbk5YME4vSVVsVDFZOHFaaXNwbkhDYkgzVENVbXdyb08zUlBPakkw?=
 =?utf-8?B?c2ZDZnFRVWpmWHQvaFFvS1dwaTF2QjhvdlBqQW9UYzlDNGlFY3hrY1YwaFZv?=
 =?utf-8?B?SERIS1RaR2QxUWcrM2d5ZWZPMDVUYUtGR3BsZUJkT1FEUHp4MGpIT21EOEl4?=
 =?utf-8?B?OUxmUnpmT1A0RTYvaWNWY2RROVZtRWRrbkV1SkQzYjY1U24vTXhOemhEZnE5?=
 =?utf-8?Q?d2tNQMmItu0KguC0rMDNEmqhacOoUqhJTwmVaoxtnh5b?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cc0ee46-8fc7-4084-dcb7-08ddaf34a3f9
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 13:24:38.2175 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6uc0RHHoXR/ukFq0vV9xOXkzGQh6ILGh1LqxxVUJIY9cDC+StxmjGjyEHpw15dPXNDolEvKLchitA8q8uhcBIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8122
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

We will use this error in the nova-core driver.

Reviewed-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/error.rs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index 3dee3139fcd4379b94748c0ba1965f4e1865b633..083c7b068cf4e185100de96e520c54437898ee72 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -65,6 +65,7 @@ macro_rules! declare_err {
     declare_err!(EDOM, "Math argument out of domain of func.");
     declare_err!(ERANGE, "Math result not representable.");
     declare_err!(EOVERFLOW, "Value too large for defined data type.");
+    declare_err!(ETIMEDOUT, "Connection timed out.");
     declare_err!(ERESTARTSYS, "Restart the system call.");
     declare_err!(ERESTARTNOINTR, "System call was interrupted by a signal and will be restarted.");
     declare_err!(ERESTARTNOHAND, "Restart if no handler.");

-- 
2.49.0


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5ECEC7DB92
	for <lists+dri-devel@lfdr.de>; Sun, 23 Nov 2025 06:13:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47C0E10E0FC;
	Sun, 23 Nov 2025 05:13:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="NyCLBoP6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011045.outbound.protection.outlook.com [40.107.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C854110E0EA;
 Sun, 23 Nov 2025 05:13:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rCbxVpJZmQbdm+JosF3NQT+F1UGCtYR1sDcJrk1aKXX5qRx3fc+tryGBsbbJqW/vL4iyNWikbH9Wpo0mdPZUA6Jn2Y2u0PemRlnH7qs7bxlkY1hevHIbKc2EoSFaRRGxk4tAX0WzmqoMUT13Ljc4VwJoJ4t4ACU5Z1Z/YhMIkTi4imQ33Rhr//R5oglMnTTK1M11G1bbLiOMDFlyOPcL6eKkp8VttrPLGN6ubGm4DH4/WptccA/zyPLUiBRIKYRFBhT+oJtaLGoFIflQQimY8s8nYTKBmoA/SmlS0K0ALk+bv/fwOycw2lcQ6rM+w0pZC8+3ua/YNXonmYdsUTdB0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qyFM0n48UGrQBpOuaqtvOxhFpQtQ0gD/+jlC7bszIoU=;
 b=wu99SC1g9FvmyND1vquCLtHp3nMzL5ACGCezDenR8e+hJn08nn4tBLfBpO8UycxPCgxOd4H/62IPRvekp6UC1lvzpHgUtFjGbEhNZP3uK6N5TQ23J2IzhgGZjl3T9ZrbXLv0QQy52pT61809OkBHNdTfhgbZy/bZ8Cok8mICYHRXNMBN01V9VVtLuamAvxIzBVI229TmQeiGKBbNzXlWzfAsMdodHd9Ef+6yhsjGO86fjcYfIjQzei+I41GGfxquzoSzjulwETcjtEOZL27XqoS2trdb9jrEkVQALfGVjDxWNbHEzcYv48XCLQ2+Gh+dq3Dro9uRLDL9uyHOOt7VIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qyFM0n48UGrQBpOuaqtvOxhFpQtQ0gD/+jlC7bszIoU=;
 b=NyCLBoP61vgzGa4e/8p40jqrfYjmlz+JezdgIY1P2laWx3ojSMeYc7+HZdit7icSJBH4eWzfQAHGYAfm4BDVcAkFy4Tjb6MLbRhmBlJXwzvhcEZX8ae8g3nfsM0qcJxmnIjs6AnfJ18bqSKvjoiYaNLM9podb4i5TeSRWoHmHu062AoW/49lUrQULjokKODEhPo0zv4+YVFHtECfYi3an8Q2rkA38K40H2wqZEvm6N0go/1Sm8TZEwDO1uFoqF9+kZCTDlxVQ9eSFhjdfi8g62IL+b57tEvLEih1pn6L/IarAMTtz3bhqEVmjyMrQTqRwjGN63DZw1k+HAXcUy++Sg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA1PR12MB6162.namprd12.prod.outlook.com (2603:10b6:208:3ea::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.15; Sun, 23 Nov
 2025 05:12:35 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9343.009; Sun, 23 Nov 2025
 05:12:35 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sun, 23 Nov 2025 14:12:18 +0900
Subject: [PATCH v2 4/4] gpu: nova-core: gsp: Replace firmware version with
 "bindings" alias
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251123-nova-fixes-v2-4-33d86092cf6a@nvidia.com>
References: <20251123-nova-fixes-v2-0-33d86092cf6a@nvidia.com>
In-Reply-To: <20251123-nova-fixes-v2-0-33d86092cf6a@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0183.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA1PR12MB6162:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f601073-4f6e-4383-3b94-08de2a4ee9b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|10070799003|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OVF2a0pYc1RjZHZ2aXlVd0Foamp4RllTaWczTGZmeDZYSk1lMTczNU04eUN2?=
 =?utf-8?B?RHhseTBiN2FORktuTzEzZEROdmorY3Y0RHl3azcxblBEWnF4VnBUY1B5VXRk?=
 =?utf-8?B?cDJXYlVYbEtpd0JQUTFYSkVBK0FxZGtaL2hwR1Q1anh4dTA4cGdvR3RRU0s1?=
 =?utf-8?B?YzZqaUlwTlc0UXdkQ2hVdTlNbjZ0aUJNSTZ5UDVQUTZhRzZ5TEZndVNreDhV?=
 =?utf-8?B?MkY3VmMrNnZRSkFFdmRoU2FuV2txdVNWOHlBQUxac2JtYUVUWm1iRmVYeGNl?=
 =?utf-8?B?aGRUMjZjRDBVZHp2Z3hub0w4ZFJPVHA0Q05LNVRBTm1pUmFlallRZGRhSkhz?=
 =?utf-8?B?K0M5VURwcTVmZUFUUXc5Q1hGUmpUSjBOZS9XdGFtWlIwdVI3VkNhb1Y3MFAy?=
 =?utf-8?B?MktPQ3V6NHp4M0pPb2p3QUFpQm1XT1Y3dlpHWjNYZnMxU2oyakQ2Sjh5bEN4?=
 =?utf-8?B?Z1BXa1FTRjlFbDY1R2ZPN29kMjA3Y0hydVZXVnVsdjRCK0JKcy9qencwSTcy?=
 =?utf-8?B?MmdyRTFrZEhZcXhVYjg4a0J3SGZWaWlQbkg4bUIvdjg5WlRmdUxFQkZtNWlU?=
 =?utf-8?B?VHhEZG83a0hHRTYrVXdkT0czVHRVSVdyRFA0TW1QdTRHNmpDUnRMWlBHcWxQ?=
 =?utf-8?B?ZDV6WHlYT2s5RFBpaW1XeWVtc1lTNDN2ZUJkK3h0SEZyS28yY0FhTXBTU255?=
 =?utf-8?B?c0dpd1NxQjNzK2NGNEFwbHRQcDkydllnSDU2dkRDaDVRZGZ2ZXRVOE5JQTQr?=
 =?utf-8?B?NUhaV0N0ZVNLazZMakxwcERBVTlEN2gwMXQ5ajA0NG91aXRWZHV2RHJvUFlJ?=
 =?utf-8?B?TnZNcGwvSWhtaXVoMUhXbmcrT0dCYkNuZlJ3TDNPVjdSVGhiSjdqeTM2WkhX?=
 =?utf-8?B?ekdnTzBtS2tzNDgwb0gwUHpIZXFwcEg4Wk9GVTdFclJXVFFXVVZaZGJXbGNN?=
 =?utf-8?B?OWNiZVdOV3BNTW0rbVJhUFNnWmZnbm9aTENJN2NtZUc4bWN1aXY1Z3pXOFgy?=
 =?utf-8?B?akx3K0QrSFd1YzUza3VqWitLZWNNOTd2djRPeGJoelZ6U1N6RWx0dGE1V3pZ?=
 =?utf-8?B?L2dmZ1RBbCt5OUd4cm1UWDl4NlBVa0hNL21EZEYrSURFYmZ0NC9OU2ozcm9T?=
 =?utf-8?B?MVRDMDdmeGRwV2JYVEk3aEhjWUl3NlYyWVc3S2RoUjFqbWFtVitBRFhKM05a?=
 =?utf-8?B?Rk9VM2Iwc0tKckhQdUhwbzdBYlJTVzlXdVFiNGJJMHNLTmZ1dUc3SFZHSzVy?=
 =?utf-8?B?V2lxdHdpRHFRYTEvaXQ4bGJRaDJlYWlqZGRRQ2dOMmZ6RjJoYnpWcG44Zm1r?=
 =?utf-8?B?V1Y0MzFvcmxvUDhKRjJIUEdWcG94UWFJYUI3ckkwS1V5MkZSM2dLcW1XMSs0?=
 =?utf-8?B?akFBMjFGWDJ1Vk11MnJvOCtKZEo1Zkl5L1dUMmRsRjFVWE1hNGZkM1ZtMG80?=
 =?utf-8?B?Y0NCWDNEaS85VHIzK0dRS1dOWmtiUFNDai9Db1Z4N25CR1ZKcE1DdEJZalRG?=
 =?utf-8?B?TlhLWlpSL0JDWUNaNk5ySHE4NVY2UWt0ZDhxellKeEdKSklVL3E5VE1FRFlJ?=
 =?utf-8?B?STJwTDlxUWdEUGNPcjZQS29BdHlaTnJWRmRDSTdQc0Z4ZTdGQndYRVkvK1JU?=
 =?utf-8?B?REFvNy9PcFltdnpoZDNRWm12OXNMQTc2dE1KNFZSVUoxbks4OC9GRCttVnd0?=
 =?utf-8?B?SnNFY0hURTQ1QlJkQ2ZmYVNjdlZ6aHZhbTRuRSs1Z01ESXNkNEJJSnZESGEw?=
 =?utf-8?B?bkFMVFNyN2FnR3k0bm5VeGUzZFZSNjAwbXZaT2JHWmRabWFJUDNYRkxQTnNk?=
 =?utf-8?B?TmxZRWk0WS94WVVmOStNQ3hZM0xJejZoQXpyMWxFMkM0Tks4SmwyL1N5SmxI?=
 =?utf-8?B?dXIxKzlGNG5RTmh0ZUVHbVNNQUVlZzJqL3BxWkdtVmxpS01WKy9TdUwrTUI1?=
 =?utf-8?B?TDlpdHdvVnFIY1haYU02VG43eVA3TnBSNDJPMGkyeW1JZ3JuUEhkR1lmdDUx?=
 =?utf-8?Q?3nEvFmunwjnNb36aNSuWFQHmSQqTd8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?THR6eXdObnZIMWpSUTJncTZYN2owbzVUb0taSjUwYmJjbXV3QlBMZlJFenhy?=
 =?utf-8?B?QjgxMXRSQlI0OUJkMWNaeGdlZ1JMdTZTR1FtMWVRZGxsSjF0U3A0SW9uem8r?=
 =?utf-8?B?WDRUcGxObUhNbno4NjJ4NC94aUFLVGlrdElYTVQzY21CUCsxQVdNY3AvdnE1?=
 =?utf-8?B?b3JmSjI4MGRiOEhLS0FJRFA4RFBZQkJCT3hTQ1lycHpxSHJMTlFsbXorMzk1?=
 =?utf-8?B?UmIxMTF5V051ZHJoakFKTDVIN3AwcUEyZTV2ZEQwbkVKYmpZOTlPWElXYkVE?=
 =?utf-8?B?RUJtRjlhdkRTSmtMaG84eFFmT0dPYldNUGhjVHdwOGdzMlVJZXRkTnBXemhR?=
 =?utf-8?B?MjEzMU5tbWU3MkZQd1ZMc1Foc1NnSHNGcExXNHpMOFlUaGNCNlIxZE9xZWF5?=
 =?utf-8?B?S0Rack16WXl3T2VsbkJwNWYxaThjYWRsU3dyaFdVcm01NkxqWVh4Yi82RzVC?=
 =?utf-8?B?U0JxMEZuVDRqbE1YbEUwSzFvTlpORWJSNTZtWkhKbW9SNHNmMHBJeWVlYjdj?=
 =?utf-8?B?dXZwdVVpdGhZMXpRU21EOWZtTlNGR01OUG5YclllSE1iWlZXemxxMkpHdmJs?=
 =?utf-8?B?Nnc3MUFOV0NzemJGN25aTFdJU0VTbUFaVTVtZllwcnZ5NFkvZUFQbFJjVVpQ?=
 =?utf-8?B?L3dmSlMwdlduNitvK1BZTXB6cTAxV1lWSXgvTk8wVjc3S3gvWHpVdW5Ic1ps?=
 =?utf-8?B?L0ZHOFBCQlBWWlIxLzdsd0FBTks1a0hQWnFXbkpxOWd1ZXg1bGFROUoxamU2?=
 =?utf-8?B?YU1xc0E0OS82Rmp0WHFMdkwvUmZZbUwzSHozaWkrTFAzMk5UU2lDRVVCbHhs?=
 =?utf-8?B?WDd0MjRzM3JRM0pEaW1NekdxNmVaZ2tVZ1c2ak96cWtxUXJELzVzSnIydEVr?=
 =?utf-8?B?alpMWUN2V25wUmFWQUVMQWFyb25PdEVXRGlCSGlMYnMwNGNxNlJuZmtSNEN2?=
 =?utf-8?B?U2ZzZGd1dXlySWFVUTdWZFhSZzlWZzljQmJIZndyWXVYNkhSUWdsOVFiZDMy?=
 =?utf-8?B?SU9XRld2cXZqZmFXK2tsU2xaaUZXVjA0QmJ5bUlqSkVlaDgxVmk4S0VscmUz?=
 =?utf-8?B?YmMyZlkxUkpjVkE1QVE4bURYSTVGdHRtOWQ0dnlKYkdxVHptRzMwTkFiUmtH?=
 =?utf-8?B?QllLeWQ5OG5XeVVGS1hFVFlObE9JSXl6dXUxMlREd2RhNmV5UjQ1QS9Namd1?=
 =?utf-8?B?aktRVWFwMHZvOVpuMjd4Zi93T01OMjhuSEZyRkE1RUREc20vK0tURkh0U3dW?=
 =?utf-8?B?Mi9PTDlXVENWOUxZWlhLOVIvdHdOMDBOejhBdU92aTZGaWhzY3BsN1dwdzRL?=
 =?utf-8?B?Q1E5N2dzczMvak9Qc0tjd3Y1eEkwbU82SnpoNjI4bC8vTENPalJzRk5lTldE?=
 =?utf-8?B?VWVXbmZ3MWdPaHlIZFBZdTg1b2dYZm44bEt0S1lGcExpcDN4dGxwSzZNK05y?=
 =?utf-8?B?cE15RlJyRTYxRENPWno0cHFzVXE0SEVwWkpYRkFsSkdlV3pxd1pMR1dtdEdl?=
 =?utf-8?B?c0tQWWJlY2lxTC9VNkxvNmRMbDR4TzlHQm5rN0J5eDhZMDhSdUJhaFViTVdx?=
 =?utf-8?B?dG5CbFVYUmZSdDRGbHBiWElJZ0MvSmVydEJnVE1venNzck5BcTgyTngyM3hs?=
 =?utf-8?B?b29sb1pFUXd0MS90NHZ3aGExNEhrbVVOdjh2bWtiaFY0eDdWajhtenBySk4v?=
 =?utf-8?B?Y0puUWRLYzk5VzhrbldKcCtEWUNhM1gvdWI5UEJtMWtWOEtpMHpScC9OY05q?=
 =?utf-8?B?OHAveUJ1QmpQRkNwbWFIQ0N0dzJ5ajUvbitXbUkrR1pVb2V1Zk5tL0lIQmh6?=
 =?utf-8?B?dG4rcjJEeHRzOWg4c3lqR2pGZ2E5NHhmS0x6a2tyVERQZ0ZsSEl1Y0Vyc2xY?=
 =?utf-8?B?VUNxbTVTV3JPdmt2bnhqbG01U09QdTRTemJjRlRvNVlYcU1ZR21USis3cTlX?=
 =?utf-8?B?M2o4MFN2NnNJQis5cS9obnVHVXdtVXlsVXZFeXE3QWFmSW9DUjJlcnozZWRM?=
 =?utf-8?B?K25wMjhEYUdmOTlVMXBMc1IxYVJzZXZuZERBK2ZrSWRDNnNWR3N3RDhrejQz?=
 =?utf-8?B?NUJZUncycmxUM01hRk9IcDNiZ1pieTNWSlVNWGRrVWdMQVM4ZnAvZHJ0MXp1?=
 =?utf-8?B?aG1UcmlvK1hpNUsrUTBvU3AyMllIdFF3eGV4c2dZWjdOR2FGTXV0by9SbkdH?=
 =?utf-8?Q?UHda8oAECjlY8EwyZo3I6OYQyBcmIAVI8fa/ic9KB2s6?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f601073-4f6e-4383-3b94-08de2a4ee9b8
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2025 05:12:35.1472 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O6NUEP6di3hYDYcu46k1aKZ8BqnHcz+EtCW7q6v5WXWYl5J1ouSozysU/1iqYVMQhJB9J1X5tXgoKsiPz62+ZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6162
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

We have an "bindings" alias to avoid having to mention the firmware
version again and again, and limit the diff when upgrading the firmware.
Use it where we neglected to.

Fixes: eaf0989c77e4 ("gpu: nova-core: Add bindings required by GSP sequencer")
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gsp/fw.rs | 58 ++++++++++++++++++++---------------------
 1 file changed, 29 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 252755dbb73c..3baa5455cc32 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -141,8 +141,8 @@ unsafe impl AsBytes for GspFwWprMeta {}
 // are valid.
 unsafe impl FromBytes for GspFwWprMeta {}
 
-type GspFwWprMetaBootResumeInfo = r570_144::GspFwWprMeta__bindgen_ty_1;
-type GspFwWprMetaBootInfo = r570_144::GspFwWprMeta__bindgen_ty_1__bindgen_ty_1;
+type GspFwWprMetaBootResumeInfo = bindings::GspFwWprMeta__bindgen_ty_1;
+type GspFwWprMetaBootInfo = bindings::GspFwWprMeta__bindgen_ty_1__bindgen_ty_1;
 
 impl GspFwWprMeta {
     /// Fill in and return a `GspFwWprMeta` suitable for booting `gsp_firmware` using the
@@ -150,8 +150,8 @@ impl GspFwWprMeta {
     pub(crate) fn new(gsp_firmware: &GspFirmware, fb_layout: &FbLayout) -> Self {
         Self(bindings::GspFwWprMeta {
             // CAST: we want to store the bits of `GSP_FW_WPR_META_MAGIC` unmodified.
-            magic: r570_144::GSP_FW_WPR_META_MAGIC as u64,
-            revision: u64::from(r570_144::GSP_FW_WPR_META_REVISION),
+            magic: bindings::GSP_FW_WPR_META_MAGIC as u64,
+            revision: u64::from(bindings::GSP_FW_WPR_META_REVISION),
             sysmemAddrOfRadix3Elf: gsp_firmware.radix3_dma_handle(),
             sizeOfRadix3Elf: u64::from_safe_cast(gsp_firmware.size),
             sysmemAddrOfBootloader: gsp_firmware.bootloader.ucode.dma_handle(),
@@ -315,19 +315,19 @@ fn from(value: MsgFunction) -> Self {
 #[repr(u32)]
 pub(crate) enum SeqBufOpcode {
     // Core operation opcodes
-    CoreReset = r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_RESET,
-    CoreResume = r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_RESUME,
-    CoreStart = r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_START,
-    CoreWaitForHalt = r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_WAIT_FOR_HALT,
+    CoreReset = bindings::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_RESET,
+    CoreResume = bindings::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_RESUME,
+    CoreStart = bindings::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_START,
+    CoreWaitForHalt = bindings::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_WAIT_FOR_HALT,
 
     // Delay opcode
-    DelayUs = r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_DELAY_US,
+    DelayUs = bindings::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_DELAY_US,
 
     // Register operation opcodes
-    RegModify = r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_MODIFY,
-    RegPoll = r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_POLL,
-    RegStore = r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_STORE,
-    RegWrite = r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_WRITE,
+    RegModify = bindings::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_MODIFY,
+    RegPoll = bindings::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_POLL,
+    RegStore = bindings::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_STORE,
+    RegWrite = bindings::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_WRITE,
 }
 
 impl fmt::Display for SeqBufOpcode {
@@ -351,25 +351,25 @@ impl TryFrom<u32> for SeqBufOpcode {
 
     fn try_from(value: u32) -> Result<SeqBufOpcode> {
         match value {
-            r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_RESET => {
+            bindings::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_RESET => {
                 Ok(SeqBufOpcode::CoreReset)
             }
-            r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_RESUME => {
+            bindings::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_RESUME => {
                 Ok(SeqBufOpcode::CoreResume)
             }
-            r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_START => {
+            bindings::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_START => {
                 Ok(SeqBufOpcode::CoreStart)
             }
-            r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_WAIT_FOR_HALT => {
+            bindings::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_WAIT_FOR_HALT => {
                 Ok(SeqBufOpcode::CoreWaitForHalt)
             }
-            r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_DELAY_US => Ok(SeqBufOpcode::DelayUs),
-            r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_MODIFY => {
+            bindings::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_DELAY_US => Ok(SeqBufOpcode::DelayUs),
+            bindings::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_MODIFY => {
                 Ok(SeqBufOpcode::RegModify)
             }
-            r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_POLL => Ok(SeqBufOpcode::RegPoll),
-            r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_STORE => Ok(SeqBufOpcode::RegStore),
-            r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_WRITE => Ok(SeqBufOpcode::RegWrite),
+            bindings::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_POLL => Ok(SeqBufOpcode::RegPoll),
+            bindings::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_STORE => Ok(SeqBufOpcode::RegStore),
+            bindings::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_WRITE => Ok(SeqBufOpcode::RegWrite),
             _ => Err(EINVAL),
         }
     }
@@ -385,7 +385,7 @@ fn from(value: SeqBufOpcode) -> Self {
 /// Wrapper for GSP sequencer register write payload.
 #[repr(transparent)]
 #[derive(Copy, Clone)]
-pub(crate) struct RegWritePayload(r570_144::GSP_SEQ_BUF_PAYLOAD_REG_WRITE);
+pub(crate) struct RegWritePayload(bindings::GSP_SEQ_BUF_PAYLOAD_REG_WRITE);
 
 impl RegWritePayload {
     /// Returns the register address.
@@ -408,7 +408,7 @@ unsafe impl AsBytes for RegWritePayload {}
 /// Wrapper for GSP sequencer register modify payload.
 #[repr(transparent)]
 #[derive(Copy, Clone)]
-pub(crate) struct RegModifyPayload(r570_144::GSP_SEQ_BUF_PAYLOAD_REG_MODIFY);
+pub(crate) struct RegModifyPayload(bindings::GSP_SEQ_BUF_PAYLOAD_REG_MODIFY);
 
 impl RegModifyPayload {
     /// Returns the register address.
@@ -436,7 +436,7 @@ unsafe impl AsBytes for RegModifyPayload {}
 /// Wrapper for GSP sequencer register poll payload.
 #[repr(transparent)]
 #[derive(Copy, Clone)]
-pub(crate) struct RegPollPayload(r570_144::GSP_SEQ_BUF_PAYLOAD_REG_POLL);
+pub(crate) struct RegPollPayload(bindings::GSP_SEQ_BUF_PAYLOAD_REG_POLL);
 
 impl RegPollPayload {
     /// Returns the register address.
@@ -469,7 +469,7 @@ unsafe impl AsBytes for RegPollPayload {}
 /// Wrapper for GSP sequencer delay payload.
 #[repr(transparent)]
 #[derive(Copy, Clone)]
-pub(crate) struct DelayUsPayload(r570_144::GSP_SEQ_BUF_PAYLOAD_DELAY_US);
+pub(crate) struct DelayUsPayload(bindings::GSP_SEQ_BUF_PAYLOAD_DELAY_US);
 
 impl DelayUsPayload {
     /// Returns the delay value in microseconds.
@@ -487,7 +487,7 @@ unsafe impl AsBytes for DelayUsPayload {}
 /// Wrapper for GSP sequencer register store payload.
 #[repr(transparent)]
 #[derive(Copy, Clone)]
-pub(crate) struct RegStorePayload(r570_144::GSP_SEQ_BUF_PAYLOAD_REG_STORE);
+pub(crate) struct RegStorePayload(bindings::GSP_SEQ_BUF_PAYLOAD_REG_STORE);
 
 impl RegStorePayload {
     /// Returns the register address.
@@ -510,7 +510,7 @@ unsafe impl AsBytes for RegStorePayload {}
 
 /// Wrapper for GSP sequencer buffer command.
 #[repr(transparent)]
-pub(crate) struct SequencerBufferCmd(r570_144::GSP_SEQUENCER_BUFFER_CMD);
+pub(crate) struct SequencerBufferCmd(bindings::GSP_SEQUENCER_BUFFER_CMD);
 
 impl SequencerBufferCmd {
     /// Returns the opcode as a `SeqBufOpcode` enum, or error if invalid.
@@ -612,7 +612,7 @@ unsafe impl AsBytes for SequencerBufferCmd {}
 
 /// Wrapper for GSP run CPU sequencer RPC.
 #[repr(transparent)]
-pub(crate) struct RunCpuSequencer(r570_144::rpc_run_cpu_sequencer_v17_00);
+pub(crate) struct RunCpuSequencer(bindings::rpc_run_cpu_sequencer_v17_00);
 
 impl RunCpuSequencer {
     /// Returns the command index.

-- 
2.51.2


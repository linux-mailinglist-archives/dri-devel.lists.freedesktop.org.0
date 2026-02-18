Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id TopxAUgnlmkvbgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 21:55:36 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D2E1599A9
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 21:55:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A39E110E316;
	Wed, 18 Feb 2026 20:55:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Sr3htqzz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010063.outbound.protection.outlook.com [52.101.56.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31A0610E316;
 Wed, 18 Feb 2026 20:55:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xibyAHIrqLmZhLICEoTiqEHcvALr4x5jUWS0bfAUZFPBV50c9J1I2Z6AVQKxo2oHi5K97EyymZEmJSmqJNzgGYPgY8uNsi0GBwHv7jI3jkC7S6SXufnssrL+9SqdKDF/F/lzPTfXhrmtsYSguHko+rFJz0cpcp3DW3ZxiMCXAn0JBW/AWE4ZjIDn4XLnQHRlQnGPPOqtmg2Fcu6tKdONTcs072bS7xtNxtIfHkpOErTxDQvQ28vREGFRbKTitnWbRdh5yPLBKc+x/wZc/m7UpInYtmimQ1DSz8I+oDfYaXVnvYCwbfTE51u+TIo8MclbNZ7PyRPOZ+BuALznhC3Ylw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w2TAqTG7olg71rrxfsek/73j8+daHV/6SEM9tKho2Q4=;
 b=MeaEpA6DDlFiqMKyiPrjcWTSYUQH1wIuXeJoyOuY6XwcC/xcN9X2Hcg/SYPKV1WVjWu5IBwXcQoZvfqfsc6ldPNCMvpbOLbAT1HUK8IfctHaxiTVQddgA/Z7RLqXs6MVQEz0mn+uhSYI9T72fAOtTVi4NAhlZtgmft9g5pOAlS9TBnH8pxke2gP7hSoNRuT7jJwq+r6l3N7er8C1S1Vkjd8T4E6gses1K9Fs7MnWU8oGGuOspu+z7pFYkT5+cRp+GtAxpj7sJlvfXA4oR8AZoGL+UQzDPJei98NWLURViBSjU4qiNi5kTkS7AuIeJHJSQXpc6e+PXgOzMkk4f8WdRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w2TAqTG7olg71rrxfsek/73j8+daHV/6SEM9tKho2Q4=;
 b=Sr3htqzzG0ypsk4M6AdXVPJs1tehVvttUPLkysPxzUHDlFnfwVM1u1egTvU/Y3VWxpMEcj+KQQZHumH7sCYiQ4tEuLCL7QifN+bEt/Pewu97doEJORbVMHwT8rJq5MD1gIGirw42m/q4qP6kOc+9Nlwndl8YOsj9nnY1WFsT8WaDawFffvvSbhd/Nx/dDf8diPlwu1/eb9DYGrO2Uw657Cm3gMxRJDUiL5YGE/wkvAXoe3LD7405MSbKe3hRN3SD4iWTh5i9jFFatraIVndRSZEAb+7uU9HZAlFSXU+5VyNtfiOodVgmuQOXyDwekK8sGqGGbM6VkJ7NLGJRpxUFVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 PH0PR12MB8031.namprd12.prod.outlook.com (2603:10b6:510:28e::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.14; Wed, 18 Feb 2026 20:55:26 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 20:55:25 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>
Cc: Dave Airlie <airlied@redhat.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Koen Koning <koen.koning@linux.intel.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Joel Fernandes <joelagnelf@nvidia.com>, Nikola Djukic <ndjukic@nvidia.com>
Subject: [PATCH v10 0/8] Preparatory patches for nova-core memory management
Date: Wed, 18 Feb 2026 15:54:58 -0500
Message-Id: <20260218205507.689429-1-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: IA4P221CA0003.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:559::7) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|PH0PR12MB8031:EE_
X-MS-Office365-Filtering-Correlation-Id: 76f9a318-54df-4424-7521-08de6f300a1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lQyJsPjBEeksxpnqrvzkoXbwFtKsgQIXYAo7iGbIhnumOZis+rHroK/kpXZO?=
 =?us-ascii?Q?Tki3cHDKZE8L9+xQm/slPcz9c2tbiHUnjvgI8zABLXTWYyWcuhH/Dz4LTfRu?=
 =?us-ascii?Q?/K062T8I5ATvK1bpXo9D6V8n10eGTz8LjMIOgH7eSCBAVX+Fp9d+zUo4sTWV?=
 =?us-ascii?Q?+PSA/9LGhHlf3PujjRBpMBiAMI6w1orXp4/XlyODUk5uJaFRCnEdYWdyHWI5?=
 =?us-ascii?Q?2yCzLTiBbAJz/XjQ4mVHc1GPakkQGyxN8IViqePD6GBimv5YIAZZfDC/UHkB?=
 =?us-ascii?Q?tuomMXR25Ym4IfIUOO5l/bw2OkXnJze5tvbPTKqsk2kHCF/Ul/ew7XzHz0Ko?=
 =?us-ascii?Q?OVtyq1bI54afLtgvFUHGkwV96djRQqtA+VcCFKMFCxbl/vgn/ZB3F2WUjm0f?=
 =?us-ascii?Q?mAt+OG1t3aTLUljy1vM133sQugPEBFHqusquh0btXnkfmLttbKNE5Jt9Oala?=
 =?us-ascii?Q?6lOMAbGu662gw7FRjcCNAxps7AS5KDLzK+g2bSQMXsQMVXZQTZUtTLFY3TC2?=
 =?us-ascii?Q?P+VSghqiP7WxR5dj47FrTpvBRsEf4rhK03/H/yHDgYMtvoYx+iH+XDFhTwoG?=
 =?us-ascii?Q?R5gVbn9bi7hic0Dn/RkSOOg65VbnP+UaL8BPTAuRnNAFBOEZDC4E3lG/G3/f?=
 =?us-ascii?Q?5SMlg40pBzVbE/C0sIkV5Xpp29nS+YzfUyuwlqnw9Hy86IJubpPXHH6TsMu5?=
 =?us-ascii?Q?8SpkQ8C7ImVCC3yheBtG0m3AbhcZWRaTgDq5WSfW0pHhfdH1/Jo3FPqF3YDQ?=
 =?us-ascii?Q?PgLqin9ZVrqzOvMB90VYFhOc88W45RWMijxIX23HZpmMJpUOi5WiOFlrfCFS?=
 =?us-ascii?Q?XkAicNdeUVqjSO47odQKxu0oKk0mMIPLlJKy8DkvM1AgC50YAEsG07LfDZQu?=
 =?us-ascii?Q?PPST1nOWF4TRUxNzKJ5gb6LkfFAVOQeDaQDRs2HQ+zwcTOteBbZ5RlpBP0vR?=
 =?us-ascii?Q?V8hTWpm7qqstkDuWkveqNIVa8vXewIJJy+asm2TQFzdWRUONzFlkvebtENUs?=
 =?us-ascii?Q?/01ggabZxv/4htwXBvSVsS0k4lkt0FeekbxboCJnxhn+Kufz1H0Bgq79No2r?=
 =?us-ascii?Q?T9bjV01Tt30hL9ADEoIrKYjrSG+KW5JhqzpJz+0v5S/MtrqJNdvgIlOfzgDf?=
 =?us-ascii?Q?RQEenpbURO3wQvybc6ILTTqtV9zkUedm+RybyBuG8Ym/Fjlz6qnxoeAlECpK?=
 =?us-ascii?Q?MnND9h/LMm8wzoYs3mp5xd1aWNfqs4aOO2wQikCLZnrkhATxw8yOcXSP5vwQ?=
 =?us-ascii?Q?+IN7DeSNda8ucuWk+/GPOImMFhXD6JbZCiqIrWQUjR1BrB1dnUqCFTI7uqjT?=
 =?us-ascii?Q?saoUnAwTB7qeWaeh1B3FNfQuWWKZyswgjzuHDLS3kiG68lzeNKHdw6zBHkCF?=
 =?us-ascii?Q?KGXMEr2iRM49lZwIc9IrFgZGqSynjwU+UTK/J6IwSe03VwOjqka67y0AfTYn?=
 =?us-ascii?Q?R/EBu3N/b1/qsURqjmAhZc7jztmQ5rD3QYZ52SkGYlSmGFZJfUMYqW3soV9h?=
 =?us-ascii?Q?+TLlLDQIZdAshcgeD/G8L25QI03slwGAO3W5h9H3QlXYgQkXpuR/JKHf1rjU?=
 =?us-ascii?Q?vGA1o5JPPiXmJ9j56PtV+2rXwu0OliX6qeE9apQrGOnrcg8vz5CrnYHvFSbH?=
 =?us-ascii?Q?qw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RFQg34Gk988DStmoBKlXXL6l4M5eDjT6XDVy25Jdu7adW0LKpyPqP29pKp7B?=
 =?us-ascii?Q?VS9u79l2wjkWXpLfN5I1kYuJxs327pyb2vPm3fqvCKUtUiwy+a1GdOvqQqzd?=
 =?us-ascii?Q?dQSxPAyS1PF6xQK6sJDJveEB5iz5U/2P1k0mMJpFOY0zGiw77vSbMjb433bB?=
 =?us-ascii?Q?CfowVLrWwnYvUx24EWb9FcMvw7uFqjgZlJn+Cu0mhkdzrzSdEv9rvFx4eUPh?=
 =?us-ascii?Q?awEEQyv2epH2zAEtc0UJorur5okf4DmdeiEB+MSscZSv+N02CI4ZK8xbC4RE?=
 =?us-ascii?Q?zCtowzCUfe4AZpFAQI/CGdNCwKsxl9Oz2idky2F/RyZW9aOm0jhG2klocG5n?=
 =?us-ascii?Q?bdJRvvTGxrJksybsM+RW2fclaFSqgoT8Fuu9Dhfpn7p9yBxNz6uLjQERs6xF?=
 =?us-ascii?Q?6EhgI8Wec+/hDi2u/opo+pixz2Hms/CJgbF6qfhvgal2fK90vOZC21BRD+rA?=
 =?us-ascii?Q?7fxIg0d1/wDs3AO2z9+4LeRr0WA1CSSgCyVTvoTIH0gptrMMAtqOYCYW2Ig1?=
 =?us-ascii?Q?OQiDYHe2Y+6H7jJrLelFcir0zQZ8wdIbU9NBlDwRAasKXFxSr5F9VauV0K4k?=
 =?us-ascii?Q?QavVZ2ROluy3mOFyCb3FfUlQksjsMFThIQIp7zblXITUrXhIU3Y4DnR118hC?=
 =?us-ascii?Q?5RkE7mNzBxqOfU+IyTM2e2eaWExvI2Xhmp05xq9FtDH+J8mxC3D87aeXoupc?=
 =?us-ascii?Q?ULhdr/GANNMpqmZfulManSRZO4fSrMD+Z4MHNv1iQNKRv9bPwk9WkbqXdesZ?=
 =?us-ascii?Q?GxTxZem+Rro4XV7b+WNxjzrpsSbv0hzIG6NLOhYjzDOQtZkVc3hoOGCxkxGA?=
 =?us-ascii?Q?NZmDWrsO+N1OF5kiFzneZ+bCsxaSrwifCbINogAbu0VoWCXiYEXg4uLXmgu6?=
 =?us-ascii?Q?qyUAHNmd7WKcVGa/qKziX/jdKP8/neGXNUA2BdXuwKgETS8N3XEUPa8fttHM?=
 =?us-ascii?Q?5qtf88YmGRVoA0VQs/1Bk2uTK3yyhXIiMCHIOr2mi1Kpr3WSdJ2u8xi3ufTs?=
 =?us-ascii?Q?hNIxtNDR63Ow5oxi5zjeh/vix/eNvE7PtN4opvemZMnEDGAhW0nNEVB9Va3I?=
 =?us-ascii?Q?YyOuL8nFO11JLSraVK5aye6T+04td+w5xU8ChNjprPpdtkoI0+xbHYvshp8M?=
 =?us-ascii?Q?CDxbpiklNxpWsAJBbbwKjCsz0BDm4B6a5qdTKzs5+ubryWTpm4MZ/ObM8Po6?=
 =?us-ascii?Q?8MBJrwC7tf3IgB0IgTWVjT1iRsB2AKxtDL6KBcLvYpbdZa2fv21tp6AgCYum?=
 =?us-ascii?Q?9Ggaz8oYdZMGU6dETkQZb+qT9fjZAPnznprw27sd89U1aDh5KgSZBMhB+BkE?=
 =?us-ascii?Q?ynMHSCu592UkRtqUG1rVpZihlT8n+DKH28ljs1pXYhEIcCLBZU75I1dCx7u6?=
 =?us-ascii?Q?gE4536E+xeAWaeG2gK4a7i0asLoUkckEMH95OtUMbZX4Sd4OdnSqqCmVtkeV?=
 =?us-ascii?Q?VQ2dHT8+QQ8gp5NCGblWRcpyVHMBm+mWOkVA3C3qf7dgI+P6NzQyrCNhx9dc?=
 =?us-ascii?Q?pU/pNhdM1pV7NQXkAwmahGYgykpkRsWyCHCOUK7mrw0RPWhEDRpp7JvLgHTu?=
 =?us-ascii?Q?bvwIep0NRogHtgKbwrlb0///awv68kcQqf1yvaRmxfTKwpc2zYPJWY4WQ9Q0?=
 =?us-ascii?Q?gq1mQ9sPE647AJ/hjtgRjtaxwLWprD9OgflSqul5sPyqE7mnm8HIyTvFMTjY?=
 =?us-ascii?Q?DMPS4+AHxDZaWheFEkglA+71LRoQkXJWq52jLDImS7UKSHOHQku39ZvKwOlp?=
 =?us-ascii?Q?Yki57EarMw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76f9a318-54df-4424-7521-08de6f300a1c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 20:55:25.4832 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hdBQYGtNEVPtUFxhokNYCeo35m86ndpylPWUyAg7sBv6fanLeuq7t9JIebIJS7GlabK8P3NRRgyNrZt6ktV1ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8031
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
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[vger.kernel.org,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 69D2E1599A9
X-Rspamd-Action: no action

These are initial preparatory patches needed for nova-core memory management
support. The series moves the DRM buddy allocator one level up so it can be
shared across GPU subsystems, adds Rust FFI and clist bindings, and creates
Rust GPU buddy allocator bindings.

The clist/ffi patches are ready, reviewed by Gary and Danilo. Miguel, can you
pull those via the rust tree?

The non-Rust DRM buddy related patches are already being pulled into upstream
by Dave Airlie but I have included them here as they are needed for the rest of
the patches (thanks to Dave for reworking them so they applied).

I will post the nova-core memory management patches as a separate follow-up
series just after this one.

The git tree with all these patches can be found at:
git://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git (tag: nova/mm)

Joel Fernandes (7):
  gpu: Move DRM buddy allocator one level up (part one)
  gpu: Move DRM buddy allocator one level up (part two)
  rust: ffi: Convert pub use to pub mod and create ffi module
  rust: clist: Add support to interface with C linked lists
  rust: gpu: Add GPU buddy allocator bindings
  nova-core: mm: Select GPU_BUDDY for VRAM allocation
  nova-core: Kconfig: Sort select statements alphabetically

Koen Koning (1):
  gpu: Fix uninitialized buddy for built-in drivers

 Documentation/gpu/drm-mm.rst                  |   10 +-
 MAINTAINERS                                   |   15 +-
 drivers/gpu/Kconfig                           |   13 +
 drivers/gpu/Makefile                          |    3 +-
 drivers/gpu/buddy.c                           | 1322 +++++++++++++++++
 drivers/gpu/drm/Kconfig                       |    5 +-
 drivers/gpu/drm/Kconfig.debug                 |    1 -
 drivers/gpu/drm/Makefile                      |    1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c       |    2 +-
 .../gpu/drm/amd/amdgpu/amdgpu_res_cursor.h    |   12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c  |   79 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h  |   20 +-
 drivers/gpu/drm/drm_buddy.c                   | 1277 +---------------
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c       |    2 +-
 drivers/gpu/drm/i915/i915_scatterlist.c       |   10 +-
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c |   55 +-
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.h |    4 +-
 .../drm/i915/selftests/intel_memory_region.c  |   20 +-
 drivers/gpu/drm/tests/Makefile                |    1 -
 drivers/gpu/drm/tests/drm_exec_test.c         |    2 -
 drivers/gpu/drm/tests/drm_mm_test.c           |    2 -
 .../gpu/drm/ttm/tests/ttm_bo_validate_test.c  |    4 +-
 drivers/gpu/drm/ttm/tests/ttm_mock_manager.c  |   18 +-
 drivers/gpu/drm/ttm/tests/ttm_mock_manager.h  |    4 +-
 drivers/gpu/drm/xe/xe_res_cursor.h            |   34 +-
 drivers/gpu/drm/xe/xe_svm.c                   |   12 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          |   71 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h    |    4 +-
 drivers/gpu/nova-core/Kconfig                 |    3 +-
 drivers/gpu/tests/Makefile                    |    4 +
 .../gpu_buddy_test.c}                         |  416 +++---
 .../lib/drm_random.c => tests/gpu_random.c}   |   18 +-
 .../lib/drm_random.h => tests/gpu_random.h}   |   18 +-
 drivers/video/Kconfig                         |    1 +
 include/drm/drm_buddy.h                       |  163 +-
 include/linux/gpu_buddy.h                     |  177 +++
 rust/bindings/bindings_helper.h               |   11 +
 rust/helpers/gpu.c                            |   23 +
 rust/helpers/helpers.c                        |    2 +
 rust/helpers/list.c                           |   17 +
 rust/kernel/ffi/clist.rs                      |  327 ++++
 rust/kernel/ffi/mod.rs                        |    9 +
 rust/kernel/gpu/buddy.rs                      |  537 +++++++
 rust/kernel/gpu/mod.rs                        |    5 +
 rust/kernel/lib.rs                            |    5 +-
 45 files changed, 2893 insertions(+), 1846 deletions(-)
 create mode 100644 drivers/gpu/Kconfig
 create mode 100644 drivers/gpu/buddy.c
 create mode 100644 drivers/gpu/tests/Makefile
 rename drivers/gpu/{drm/tests/drm_buddy_test.c => tests/gpu_buddy_test.c} (67%)
 rename drivers/gpu/{drm/lib/drm_random.c => tests/gpu_random.c} (59%)
 rename drivers/gpu/{drm/lib/drm_random.h => tests/gpu_random.h} (53%)
 create mode 100644 include/linux/gpu_buddy.h
 create mode 100644 rust/helpers/gpu.c
 create mode 100644 rust/helpers/list.c
 create mode 100644 rust/kernel/ffi/clist.rs
 create mode 100644 rust/kernel/ffi/mod.rs
 create mode 100644 rust/kernel/gpu/buddy.rs
 create mode 100644 rust/kernel/gpu/mod.rs

Cc: Nikola Djukic <ndjukic@nvidia.com>
base-commit: 2961f841b025fb234860bac26dfb7fa7cb0fb122
-- 
2.34.1


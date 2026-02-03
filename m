Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qB34HowpgmnFPwMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 17:59:56 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE47DC69D
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 17:59:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D98C210E71A;
	Tue,  3 Feb 2026 16:59:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="ikm20+dM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from LO3P265CU004.outbound.protection.outlook.com
 (mail-uksouthazon11020074.outbound.protection.outlook.com [52.101.196.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8457710E701
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 16:59:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G9MnT5Uzdca96uRz2jqZAtA6m17HvRNVyOyGPgpayqBZBGFxZ7IlmzstVL4CNUcJs7M9MEWnpCX1KMsyfF3/Oq5oBETta9i+9X1yV8xKm6G9tzISVULxa6j2X9IhLqGr3oxsPriZLzwvDqQpLZ2CgJgHnrHU3c+mXwIUrVwGz30guyHX0d5IBGKhw4FswTD42x0ZgCLB2SYoD9s5i8yROmSk2zethHE8BPhA2FGvPtDIV9oqN9PXB8HcmlxyXQ+qRBWyJ+V5wV8Qwa4dyrl8S2UYGhwbxVZmhAth4za4XQwBbXuKHQvxeuRddYg/BoIkJWQu6CWTum2NUeKrLj9wQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7wbxZZj0vcR+rkwbTJzBddLo0byJ1QOYAakrB4ZFt5w=;
 b=ASwOhsw79IxwBf2+Rq/0HNiVmOZgstaub14kztDYubs9vkjrN3KLu6LhqDMXm8UVgwZIIt72Hym1OaOYPnXzUkoOCdOX+SJLIfZ4fzlZdpe5K+MAo4FE4CiNCQPzFivXYp6/7Dof7Jx43c6aDfHg5+cCYhK2qMKvcm8G8SsRtuHG/bCYUF2/llSlIedmOdfskL7GlaxmoxiIWzuWo5RZiF/GSXbelsL1Gf+lEMCg15XYSt8xptH9/il7qkzxn83Kbf9RM8Od65WWmtdhr2WFEmpPPHNSbpeadxpKsJ6KYyLiI6ryLGOgbh+tuQ25sFza28mrHKux0VWM1p+hgerB3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7wbxZZj0vcR+rkwbTJzBddLo0byJ1QOYAakrB4ZFt5w=;
 b=ikm20+dMkKqr8tufB7j8j1N7+IIt4aQN7Xlz5ZSDvV7aOsNbxvkvPWugTgRKd79M6G+skDl6w/X1DgMMRRu7c+bFwf79yRBGE//gP1efXEBw8QU9f9vI3xSyo5Pp5JvYKAd9jkpZQEhTr73absEfzQrEtyNWj6j9zY/ongmtxhI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO7P265MB7522.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:41a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Tue, 3 Feb
 2026 16:59:49 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 16:59:49 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Feb 2026 16:59:48 +0000
Message-Id: <DG5HJPIYMS7B.152WPGG9MZZJ5@garyguo.net>
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, "Viresh
 Kumar" <viresh.kumar@linaro.org>, "Danilo Krummrich" <dakr@kernel.org>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Thomas
 Zimmermann" <tzimmermann@suse.de>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Drew Fustini" <fustini@kernel.org>,
 "Guo Ren" <guoren@kernel.org>, "Fu Wei" <wefu@redhat.com>,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-riscv@lists.infradead.org>,
 <linux-pwm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
From: "Gary Guo" <gary@garyguo.net>
To: "Daniel Almeida" <daniel.almeida@collabora.com>, "Boris Brezillon"
 <boris.brezillon@collabora.com>
X-Mailer: aerc 0.21.0
References: <20260107-clk-type-state-v3-0-77d3e3ee59c2@collabora.com>
 <20260107-clk-type-state-v3-1-77d3e3ee59c2@collabora.com>
 <20260108-delectable-fennec-of-sunshine-ffca19@houat>
 <98CD0BF6-3350-40B9-B8A9-F569AE3E3220@collabora.com>
 <20260119-thundering-tested-robin-4be817@houat>
 <aW4lCfUyumOKRRJm@google.com> <20260203113902.501e5803@fedora>
 <E7286D12-0BD9-4726-B072-FE5A040312B1@collabora.com>
 <20260203150855.77c93e22@fedora>
 <4DD13AE1-C85F-450F-93F2-C7C75766E518@collabora.com>
In-Reply-To: <4DD13AE1-C85F-450F-93F2-C7C75766E518@collabora.com>
X-ClientProxiedBy: LO4P123CA0187.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::12) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO7P265MB7522:EE_
X-MS-Office365-Filtering-Correlation-Id: ba751822-5024-481b-8184-08de6345a3f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|10070799003|366016|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ejZPN3ZVaEpJZFZqazNNcG85VjRLSHNSL0lBV3JBUVNnaUxGN1pWZkVjV0xP?=
 =?utf-8?B?djVYbzhqdXRzcDArYTVudDBKV2R3TXU0Y2ozV1R1VkpQRGlSQlJlTzZXSlRa?=
 =?utf-8?B?ZFY3NzdqVlViWFFqZ0I1ZGk4MkVMRnhYZ1ZYYzMrZWtQZy9XS3V1UnBOclVt?=
 =?utf-8?B?Q1BpNkhTSkUvaG5PejB0ektkTmVJQStabGMrRGJiSjdrTXFXdHJHcGFTbkdL?=
 =?utf-8?B?Tm9tL0Jqakl6WEp4alkwRHJpN0tKMGRWV1NYVDZCZTlLeElOUnQyY0tJMjh5?=
 =?utf-8?B?NzFKT2ZMYnFkamVzZGdKT1hPZklicUtmQ0xaa1g2VWRrQ2cwdHkwZHBwK01C?=
 =?utf-8?B?TDVUNW1vOXBMckVTQWR4ZFpvNVlwbEZVaE5PWXFwaUpMdVYwZnpOUTdXUmxN?=
 =?utf-8?B?eEhRbWpyYnlJNGFJTWErMHY4YU5Pa2NmdTFTOEdDblZRUHhlQm9heTB3b250?=
 =?utf-8?B?d05rdjJla3lvLzNqL0JJZmtXb1dhMkwwWUZDN3h0RFpQWnlhVm9jVzhqc0Jv?=
 =?utf-8?B?N0dZbm9HaTJiSmU2QW9aQWNDYTFveFdwWEVjR293SnlySENxdWhJVVUxZWtD?=
 =?utf-8?B?M05FdVErdTJlUllnRXFqbUZ4NTBOWVFMcFJ5RjlhZi9JTlRSOExGay9xaENU?=
 =?utf-8?B?bk5SWkIxSXE5ZkZWa1NoU0FVTUZkTG1CUnZabzAvL1N6YTZiY3hNWDd5M3Ni?=
 =?utf-8?B?UzhuZGJ6a0hJTkRHOFJOUXFESXVsWWJpZjhjdlAybS9HeXBJNldhdC9wOG00?=
 =?utf-8?B?SGhTUjgxdWVFdHlTVVhXSGx1RWNRSU5PcnZTN1h2YU1EalovcHAyUUJEQkF5?=
 =?utf-8?B?Z1ZyZDFvcWVMSGJlSEk4dzN0OE95Z1MzOHFsMldYSTd6L3ZJMFZ5WWtjQ3hz?=
 =?utf-8?B?NmVieTFaZ1ZzSW94UlZPVk9CYUNLTHEya1hBemFkRFlwVXl1SkVyaXN6RVZo?=
 =?utf-8?B?UVUyTnR2bzBJY0tNTUVVci90THlndFU5MHZ2S2ZnUWI2UFF1bU51NmY1Z2JU?=
 =?utf-8?B?NlROWG11VGRvY1RYWVozb0dIcjhpTWp6S0FIN08xODJGQ1J3TGZIZHZKRFlz?=
 =?utf-8?B?MldoYWdnOGI3Q1p6c0RuSEplMDU5TVArVjM1WUtDZk1ldVlUQVFoakZYdHB5?=
 =?utf-8?B?aGQxekxpVUdxTUEwTzF1WGMzRk1UbDRSMzN3MTNaVHVuTkNwcVlYM3Y4ZW0w?=
 =?utf-8?B?YU1sb2RPTDJoYy92aFJ2d1Zic2V4dGxwSGdLeDRaRk1vblkxTlJ3WGlCU0xv?=
 =?utf-8?B?c0VlZ1MwUDBuaVBJaVlYWVd0T0J0VVJ3Vm1Wc0FGdmZIems3WDNGR0M2Ri95?=
 =?utf-8?B?S1NxVEQrNlhaUU04Z0s4MjBmVFhrQy8zZUI1QzFXRkFTUkZ5L1hkQWFPb0R6?=
 =?utf-8?B?QXNwaW0rM1p4eWlxZmEzOVRsb29xd0lVMUpadDhMSlJ3WUtrNTVKNTFmekZO?=
 =?utf-8?B?TFlYZG1aR0FYbWJCbEdZcnRldjJyeWwrVTF5ME5FTFZJMjJhU3F3M0M5cDdK?=
 =?utf-8?B?Wm9mcW1GVDJBMnI2VldvVnFUTVo3V09FMGJSMS9ja2JKRTFpdWpqeS9iWWli?=
 =?utf-8?B?UXl3NFpjeGlTWnpMWkpDL056eFhNMzJxcklONDZMenRPam43VEpVL3NRMTJC?=
 =?utf-8?B?bVBEeUdNNDhxeTlEeTYxOHBVdkU2SDRyeENNUE1US0xFUlhNRGVSNXIydlRq?=
 =?utf-8?B?TFdZOWduNjhtZGs3Yy9PTmtvUDRGWjJWWFl4RHFnblZubG84dlphN2c4Si8x?=
 =?utf-8?B?TDkvK0t4cjROTHdHT1dMRmJac2xtc0pLNkxvMDFFYzM2RWVUeXZ1TWtNZHFz?=
 =?utf-8?B?WHZqSlNSR2NWZ1dlNTA1U2FaRk9WRkNKZG1GNXNIWTY1WFY1ZW1Nc29adEhO?=
 =?utf-8?B?ODg3VjlqaU5Cb1ZrYkJ1MWtoRy9UNGFKRE03N3ozOVhmRG5JQ0s0S2hzWElK?=
 =?utf-8?B?YVJHZFhMUllXYUpEMis5UmdVZ0lmeU5hZHRRNVAzK05JWWtrek9zcFF4QXV3?=
 =?utf-8?B?ako0czFTUVJLZkVudnppYXZUejZRZVBjRXA2UXNQUjVQVGFKamJJMTR4THpv?=
 =?utf-8?B?YlVNNFpva0lCVGRScEo2THY1N3pyQTNjU09ONTFUd1JUUGh2Wm1sdFFzdlVS?=
 =?utf-8?Q?yAs4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(10070799003)(366016)(1800799024); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RlR5Vzh6Qlc5bGUycFdod1Zab2R0ZnRkSE1vUlpzQm9JK2RycWhkdGxiV1l3?=
 =?utf-8?B?dnRoeEZvOFdRYjAwUUloa2tWMnZETUlyZEltaDBMb2NKM05vL3ArZXF0SlRJ?=
 =?utf-8?B?V01PYlhYNGJDQTVuSktKU2dkQlFKNjBNc3AzNFlCa2w4S25YaHB3TktjbDhj?=
 =?utf-8?B?ODEyV0E3QkRIOHhyOTl4ejVqZGRxdkw2QXBReWNzWlJFaUp3aGxla0pBdEtG?=
 =?utf-8?B?RkN2OEpsTStrcDZmd3RtVXlvbHJiZjI0Nm5CWTBEbkJJTU5PK0FoUFhIYjNn?=
 =?utf-8?B?ZFg2L3B0YitaOWtqWDBBWEZMMjRyUGliNDNGeUFBazBpZktrWGhFRzN6bHZ1?=
 =?utf-8?B?QUFPVHdEQUNOWklIVzB1MjJWclBHa2dHQ21MdjZxUkcvZ0VsbThVcVFtVjMw?=
 =?utf-8?B?K3NIWng5MWJFNTNiUjljS1paQ0tRb0JTQTBZM1NEWHpjbmFJLzRzaFpabWJw?=
 =?utf-8?B?RE13N1VZVWZHbnV5L2Q0cHhtLy9qQXA5NFYvZW12TVdCT3pWMldGMmVYQmdJ?=
 =?utf-8?B?UkZwZlp0cWxEd0RhMWVjd2hSQno0YjlFRjE0TFR4cENiWFc4bVVLTWNlTHBp?=
 =?utf-8?B?YWdWTFpyaHRzdHBnKy8xcFRLY3J2YmZHNWZydkd4TG9vcWttdUgyQVJsUjVm?=
 =?utf-8?B?eTk3QURyVXpCOFVXYm1XdWI2aEkwQStpMUxBWkRhMDZuSWZGK1JYSGdvcTZV?=
 =?utf-8?B?bFp6OG82VDJQS2llaDE0L1NETEljRXpkYyswNUp4UWRKb3BxcU0xSm5tWXh0?=
 =?utf-8?B?UFc1cFZnMDFjVlVtSjRoVFpVU2Rma2NBMGpiWGsvWUV1SUZlU291YnltUTND?=
 =?utf-8?B?YnVTckx4SW1qTU1VNFVOdzNCSDltcy9KdGhscllYTllGYWhMbHIxd1JXUTM1?=
 =?utf-8?B?MlkvR3kvSjZXV3FRVjNySElFTzRSY1VCbTJ0TmkyT3MyVmxWSDYwWGQ3bytQ?=
 =?utf-8?B?c3ZTQ2NDWXNxWlp2U3M3bklYZE14ZmNkdjIvYkdXNVJVdUdUR25ySjdJRkpk?=
 =?utf-8?B?T2pYdWxmdEI2RzdaZmVwbXhEZDY2Y0FmUVdRd0hzWjQrZ0xRVzFJRFJEYmhz?=
 =?utf-8?B?cS9iRjZnUStnOUVvZkNEMGNzVVRYSU1CbjFoTUFZa1FhZjJVU2JjUjhidjlo?=
 =?utf-8?B?ZkNWVjVPRmllaEVUNjRWNmJrdUlsWUpxRjhaL0ZFWWRjUVVlK05yNDBoNTJx?=
 =?utf-8?B?akdEdFZoZysybFZZODJ1UTZSRS9wYUhieFQwcXM1UjUzYUpXK1haNVRzZ3pZ?=
 =?utf-8?B?cEYycXh4cWQxTGRFVGt2YXFWTDhiei90Ni8rUzV4bHJoUEZyMFJGYmtXTjVs?=
 =?utf-8?B?dnc2SmZLR2NYMEpEWjNlQk9HN2tteUdETXFKT2g4Ky85MnQzaVRBWU10cTYv?=
 =?utf-8?B?UFpCbkJ3TG1iRUVDN1BmUlg2NTFZMTFZUFl1aGR2NHlVd09jSW1jTmtOQ2lU?=
 =?utf-8?B?VTZtZXo2K0lRSTBIQ3VKWjRmWnlQZ2cvU2NDRUpFQS9aR2dzSzVVS3Y0NFMy?=
 =?utf-8?B?ekxkcGJXUU50YmlDM21xSlEzcWx3N05oWitpYTJZT3B2bko5aXZvSVpIdEpO?=
 =?utf-8?B?dldVWVhPekV1VGlCQmxsTWswbnlHM3JTT3JiT2JJZVJoV1FVWVUycXZVcGtm?=
 =?utf-8?B?WGc1OVcwZ1lycjhLOTNQZXMrSklLUnk2R0Z5Y0pyN05MTktlQU5VdFlHT2kx?=
 =?utf-8?B?THlLSFo4L2sreFEyME96c2ZhTnNKOFNwRmFIamRITHZ4T2hXTW9HdHJNbWpu?=
 =?utf-8?B?TmlHNytMSXJrNW9sa0EvSGg0UDBxemNMRkVpb1BKQTB0WUU3ODBXTG9hMWgy?=
 =?utf-8?B?d3NjbzU3MC9nbWttL0I5S1VnYjd3cXBpbjZxVHlMSzc2NW5hdktkR3B4WDJS?=
 =?utf-8?B?SXQ0L0dzOElCZ0s0RThZR3BlZjdReTRhdFVlMTc0MjhxanUxOE1RU0k1WmR4?=
 =?utf-8?B?ODhScFArNTRsRi9wWk9YYWpVZVFucXVBdTZLVmRGREJMM1ZjakJyR1Y4Zk1D?=
 =?utf-8?B?UVJBd0s4Z0NmSXJkT01WeTkrV3Mvb1ZBYytwdjdHR1pSbHFQQ0U2L2Y1cHFT?=
 =?utf-8?B?eE1IQmhXLzE3NGduaGdLR2hrZVM2SDNvWW40TlJEdjhBNFZpa0NiWkJITXJp?=
 =?utf-8?B?SUZod2JOMGlybndZOFA3aEpyR2taYUtxc0E1WWFJdFFDUGtTN3Y0UkhlRjND?=
 =?utf-8?B?WU5SMURzOU12cGd5K0orSjBmK3JZZXJ4bkdzU0laL0ZMRlYrRHVXOUtQRGhB?=
 =?utf-8?B?V0ZHNzRoaGFRcXgvRFF6RW5SQ1FvTUJCUlVydndxSW9uRkRlS28xbDN0OUJN?=
 =?utf-8?B?eksvWWJxNlNOOHIyeHh1eU1uYnNkMW1peEFoYzRzOWVJenI4dTZOdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: ba751822-5024-481b-8184-08de6345a3f7
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 16:59:48.9078 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h50KXbK2Mj9FMsX4YHpSMGWjJtlqpvieFUUUJ99c0L+ocIPL90sQkUgeJsC+auMAv89jdlSMbgtSLOGY3NFwCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO7P265MB7522
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
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[gary@garyguo.net,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:aliceryhl@google.com,m:mripard@kernel.org,m:rafael@kernel.org,m:viresh.kumar@linaro.org,m:dakr@kernel.org,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:fustini@kernel.org,m:guoren@kernel.org,m:wefu@redhat.com,m:ukleinek@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:linux-pwm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:daniel.almeida@collabora.com,m:boris.brezillon@collabora.com,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[google.com,kernel.org,linaro.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,redhat.com,baylibre.com,garyguo.net,protonmail.com,umich.edu,vger.kernel.org,lists.freedesktop.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[garyguo.net:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: CAE47DC69D
X-Rspamd-Action: no action

On Tue Feb 3, 2026 at 4:28 PM GMT, Daniel Almeida wrote:
> <snip>
>
>>>=20
>>> The problem with what you have suggested is that the previous state is =
not
>>> consumed if you can clone it, and consuming the previous state is a pre=
tty key
>>> element in ensuring you cannot misuse it. For example, here:
>>>=20
>>> let enabled_clk =3D prepared_clk.clone().enable()?;
>>> // do stuff
>>> // enabled_clk goes out of scope and releases the enable
>>> // ref it had
>>>=20
>>> prepared_clk is still alive.
>>=20
>> That was intentional in this example. Think about a prepared_clk that's
>> stored in some driver-internal object, because you want to keep the clk
>> prepared at all times between the probe() and unbind(). Then you have
>> some sections where you want to briefly enable the clk to access
>> registers, and immediately disable it when you're done. The clone()
>> here guarantees that the initial prepared_clk stays valid.
>>=20
>> If you were to disable, unprepare and put the clk when enabled_clk goes
>> out of scope, you'd go
>
>>=20
>> let enabled_clk =3D prepared_clk.enable()?;
>>=20
>> and that would still work, it's just not the same use-case.
>>=20
>
> Ok, let=E2=80=99s have clone() then.
>
>
>>> Now, this may not be the end of the world in this
>>> particular case, but for API consistency, I'd say we should probably av=
oid this
>>> behavior.
>>>=20
>>> I see that Alice suggested a closure approach. IMHO, we should use that
>>> instead.
>>=20
>> The closure, while being useful for the above local clk-enablement
>> example, doesn't allow for passing some Clk<Enabled> guard around, like
>> you would do with a lock Guard, and I believe that's a useful thing to
>> have.
>
>
> Wdym? You=E2=80=99d still get a &Clk<Enabled> that you can pass around, i=
.e.:
>
>    self.prepared_clk.with_enabled(|clk: &Clk<Enabled> | {
>        ... use registers, pass &Clk<Enabled> as needed
>    });
>
> This is now not about clone() vs not clone(), but more about limiting the=
 scope of the
> Enabled state, which would cater to the use-case you mentioned IIUC.

I think it's fine to have all of these:
* `Clone` impl
* `enable` which consumes `Clk<Prepared>` by value and spit out `Clk<Enable=
d>`
* `with_enabled` that gives `&Clk<Enabled>`

This way, if you only want to enable in short time, you can do `with_enable=
d`.
If the closure callback wants to keep clock enabled for longer, it can just=
 do
`.clone()` inside the closure and obtain an owned `Clk<Enabled>`.

If the user just have a reference and want to enable the callback they can =
do
`prepared_clk.clone().enable()` which gives an owned `Clk<Enabled>`. Though=
ts?

Best,
Gary

>
> =E2=80=94 Daniel


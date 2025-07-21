Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D41B0CCAD
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 23:36:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2271710E3C9;
	Mon, 21 Jul 2025 21:36:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="OTzY45ec";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="OTzY45ec";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013068.outbound.protection.outlook.com
 [52.101.83.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 311E510E5B3
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 21:36:18 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=SV/P3DqZkfuz8b+xiXMACZF/5UJ3QvLK4xXgZNHPJPHA+1ldI7CQJVYRq9OTW4uxjGe118fOkl1WfB7zl17PD9dyd7lFBAZUKJtw37c8WDrWMeMXMDs4mSz+d154q0HZ8R/d33ydb+Kt+bJamuUWr6hQNd1bV3oDAD4ZcScphrPWbO5vEkDCyr+ABCs59AoNCXkY47Ah8ncONEn/zke949hYJjXGhRVYl0ANdME1F/w7FmFs6DoAzvODoeT1zTPsmyZCh6+U9U1puN8CD04n4ND2gtfLzmnZJI1NL8gd1Bc4zZhtfsYZofrn352m29SxlZ64jtujw9fd1E7SyfN5Zw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+/07ssfFQ8Gn+A3GGfndxv992Jo9WhSG3f3nX/nfIn4=;
 b=UAPt5Dlf5l5PwC6j/AaySoiPTeRtbaN0Z7s2jN19VV/xeDM1Fb9+wq0Ie2c4dmalswFg7yAEmZws4KpC5cbrxJyEKG9NFON8tBJkN5QdqdZrchPmMZjtlUQCeYsuupOvrN8KC0c0rfKM4of5C7Q/44ktAkKkp/I7ATOCIDItyOCrdJfbx8Fn9BUxOFjQfxHT1/Q846tl4VbtwbOT9CFw46v8jrSHjruIWVFenZo4ZHc71ymELN9BTXksKO0QbIHFo1X+eDWr85fVADDeziScV0xJeettLWKwsEL0Vr0I2QQPfqBb3NuFftNM6NJ9KwVls9a6tJo3UIR3JZqzOJvZYA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+/07ssfFQ8Gn+A3GGfndxv992Jo9WhSG3f3nX/nfIn4=;
 b=OTzY45ecQBQaZRAS8M7JxzjiRFVjuJjUCSPpVNOwghDGGe7hf/h0E6SFjDUwO+yyoXd06QwI/ZJVRmwMcXLoC4yhlQ1N5LX/QlF7FYexW7Q2VFHjVOkr0F4GfGqTbsfsUhuIxZJPMhAHtGNn2+11T7COm0LVgGlAHLlM0zEPBes=
Received: from PA7P264CA0406.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:39b::16)
 by AS2PR08MB9738.eurprd08.prod.outlook.com (2603:10a6:20b:606::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 21:36:09 +0000
Received: from AM2PEPF0001C716.eurprd05.prod.outlook.com
 (2603:10a6:102:39b:cafe::4) by PA7P264CA0406.outlook.office365.com
 (2603:10a6:102:39b::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.29 via Frontend Transport; Mon,
 21 Jul 2025 21:36:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM2PEPF0001C716.mail.protection.outlook.com (10.167.16.186) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20
 via Frontend Transport; Mon, 21 Jul 2025 21:36:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G/J+BywiydqFjdSl4j0vICw+uSoq2zcsS3ElK1wCbsr9Om6tx5rJ325Mgy9+T80tUKjRoNTLqbEbAzyxj+Yq14O06LuixLXhqb3HgtsLOQSli0mULjFAsE459bSbwKq6unrpICBKKXgawzi6Q2fKdon/sppilo2W2K0ran0Vt1+XUGPHUXBTqKwz/xyaPXmvYJsrpyyAkcDpfRd71BvbK2/YvgbdBCPiHRdCkEuNeQuW2HIecLDN6k9/KC0GFR8W/XcDZONavZi6WIDtZIan3G51xBO8/t6E3MY7I63WLTIsDjFJ8kQG4sp0oSeFBslqPxvJPleH2E4KQ+RzoP9ChQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+/07ssfFQ8Gn+A3GGfndxv992Jo9WhSG3f3nX/nfIn4=;
 b=Bn88XRtfDVQ+yEh9ELv7R4lI16U7rxX8jUmoQvydd6uTJ4a2sPn700Ov7D184G7ZBEOXDbZDfVKyeUKd/M67Gh8CdLW0UfnNLH9ictZwWsErp3EgryAdbC5YYdqDz+26sTp5glXmy+f6KYAEboTfbDz+MkKnE/VKfWK/TSmIS4BN9FG1AiRNNo0PrSkHLVtB+eSGfZ1GY8fNbEmTFSXeIJBapIgUd9G2aKeou6JCRJOTeHt2lL1OklZJJbqF/EY/1TErIpCk3/JTAX4fzpAtCA12B0H5L7turoUaeu/26C7J+PF0IXVAW/FHoEBWfrOwswjQ28mDLPYlchRln4DiaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+/07ssfFQ8Gn+A3GGfndxv992Jo9WhSG3f3nX/nfIn4=;
 b=OTzY45ecQBQaZRAS8M7JxzjiRFVjuJjUCSPpVNOwghDGGe7hf/h0E6SFjDUwO+yyoXd06QwI/ZJVRmwMcXLoC4yhlQ1N5LX/QlF7FYexW7Q2VFHjVOkr0F4GfGqTbsfsUhuIxZJPMhAHtGNn2+11T7COm0LVgGlAHLlM0zEPBes=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by PR3PR08MB5611.eurprd08.prod.outlook.com
 (2603:10a6:102:85::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 21:35:34 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%5]) with mapi id 15.20.8943.029; Mon, 21 Jul 2025
 21:35:33 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/6] Add support for new Mali GPUs
Date: Mon, 21 Jul 2025 22:35:22 +0100
Message-ID: <20250721213528.2885035-1-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0279.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::14) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|PR3PR08MB5611:EE_|AM2PEPF0001C716:EE_|AS2PR08MB9738:EE_
X-MS-Office365-Filtering-Correlation-Id: e7ac1cee-8cbf-4ada-841a-08ddc89e9aff
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?SfSNU6l9Fs1RebDJMeCYyCo9vSw1nIPKoq+J0j1UBGhutWRc1OPXZkHLJhZV?=
 =?us-ascii?Q?zmNCx80ejkCrafPnWU/BE26dTtoua2O6EEcT6Ww9sIYYE0fJ99fp64VoU58w?=
 =?us-ascii?Q?P1Jr90VRJjhqnUENhnuwIfCxlSIJls7SHIIGOSvMnaM5RY27zQJVrlDbdOGu?=
 =?us-ascii?Q?eEN/sFzEyGbXQjo5EhE+D6GJJTc5SrXkuEISstMn2exrGZA1xUIyKyDCCl2g?=
 =?us-ascii?Q?RQTZBlLiTULz8m9vuw65rLeITs9MZkHSO1n2tggGZnkLNQZOYBwDnNsTWLmH?=
 =?us-ascii?Q?ebOFknh49P1RiXqnGy3lN0HUKBsakFoe509aIpMdhndR9ush4VhXhMmgqK2J?=
 =?us-ascii?Q?+UuY6ZbkV1NB9VrKMaqHpwelOw6i1gqECOBg+Dh43qCdkArK9/9m82qaAHK5?=
 =?us-ascii?Q?sCNsShLp35O59MlVNCkw5JvGjwqfSTr5JXLW+I2lmWjTvZ0hgNdP2vO5VM1o?=
 =?us-ascii?Q?4Uf7zIDr2++ZGWBjgVRT2OPPq5pBb1mIpffi+ccKjo+QI2mej3AkpoG9cpzb?=
 =?us-ascii?Q?vJFR8OySFN43gyRrjVyS3ob/qOfmA0tvVjEiyw4Hj/qiTlh8TXkGbw+fe6wT?=
 =?us-ascii?Q?Z2vwMdHyLaivNKki3pmqEiQnvG/8LvBMLwAI3++zrK31mZviFpa9VolL5QI0?=
 =?us-ascii?Q?KC7SzP739jHtzvdT6Xt7RIOODQm8lCpAFql0bi+NWTl1ILhtk/sYhHEgQoGQ?=
 =?us-ascii?Q?xBr5LqHg2Z0/b5CGY96bMrR/MF4586BQFT5h0HTk75NjmeC8kka40OMDvwOk?=
 =?us-ascii?Q?3BmZ3wMYbkOFt4xQnb68d7NxGP1fpH3xhK2eyllaAMv/+khPlQX9TpMd2Qit?=
 =?us-ascii?Q?Y87kiK+/yINz5BGZpwC3TmTur6eWRYGe7tPzadHdGtPORUmikW82aZZslsUp?=
 =?us-ascii?Q?KN7o0CQQu6nLTGqXdFPbAmDmOGYUJDOucoMK1TejYlJhpRiHYQkFeu0WeOs+?=
 =?us-ascii?Q?JTxdEck2384j546snyYVJHD05MKxCY0P1/T9OgCvCglurXwD6GfP3FUD3hZg?=
 =?us-ascii?Q?PYx+lo8AYuPcohAbFxXCz3LhzUF7hbUjfnoymij8XOKUHVkz4TjPk76yCEVH?=
 =?us-ascii?Q?hS9raKfVKga5LWhODuN6Jxdw9m6dNUJkMxeVqnzv6K0OBkE6By7Gf9kfBE6J?=
 =?us-ascii?Q?GC7mdMAaC4lEIZVt0E2+midEf5nsGO0zpunVU4j97q/miycBRu7LwbKjF2vz?=
 =?us-ascii?Q?oz9b7s4uwKbPvOpY85U6/IlSPLfo4wEZkuDSzMGCqydMe0EzrjSJ25+kIfYs?=
 =?us-ascii?Q?2LMWbxuxCehLfC0l78kqOUUX0k3wTs+KMdncIxaTKnRhfGZ4355LjO5VJeGJ?=
 =?us-ascii?Q?h2Tndk4j7myoMoWyO+3v1ixotghDMcukt2UfDW+ZbOb2ueCpqd9VdC4pHT7R?=
 =?us-ascii?Q?x3uWeDkpGo5ScPJSCaGPDRx6YiKolxvHlDwLv5gt1DRiFFcKax/RpKNzFqdD?=
 =?us-ascii?Q?hPJYQABsArU=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5611
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM2PEPF0001C716.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 6ba0097c-70aa-4136-b5d2-08ddc89e8516
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|35042699022|1800799024|14060799003|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wP8zNETIDjg0I2XmmQxbBAqFNCdZ7ZEqgN8cQsQWjeIdMk2/1R0bNYnk1b3F?=
 =?us-ascii?Q?I/mygGkJAwrPg+mTUyFTa13aRFekxcznRDA6RigIRG9+9NYOKsupooeOtODn?=
 =?us-ascii?Q?bi1QHLjl9S3fTUk/0Ig4bVUZU8TXMIHLpAQgus6GAt8JqPrPU7in8gVu2snw?=
 =?us-ascii?Q?8kAvuUjw7N39ACgaSYnZotdZ8gHweEz9Jb106k9EjPQr18KGYcRn4Yzv4/41?=
 =?us-ascii?Q?yHc3SuvkK7hEkO2/LB/zolMeNQqF2Rz3ajgWxiWPtpTEIsGPxkhMNb0h+b7H?=
 =?us-ascii?Q?C7XJ3MFAz0HGJKJ57HCaGgE5X16/FeEQ8RArxXNIR57WF981KBKiZq95ejgQ?=
 =?us-ascii?Q?yNaelGFKWks+8OladElOflMomjDQMaW2IXkpOSpXmWjr/3KOSfLY6TuZ10N8?=
 =?us-ascii?Q?5WxpA4Zt6b3QkpUzm9n4EAxdfl/KwKhkNY6qdrj5rINyFubwnHVJ6o5+b+jI?=
 =?us-ascii?Q?Cio+p96to2s/zp31vVzFLJGzygH/z+ejl34sJVmMzcDtG4VB0kwpruKipLhA?=
 =?us-ascii?Q?57GGapQMJRGl1kXl9WVWcuGPGBNzT8mHIKo5sw/CssiZ3Lr4Z5T7cmZa+1OL?=
 =?us-ascii?Q?6+BRdUJndEFpASNKCIBPGb3HloPfUgtC4CGrO+TfLLAW8ulxxrgDbfTLqezf?=
 =?us-ascii?Q?xjO1cpZrnFO/p6gYM4LuNnX1Cc4H7HAJe3dLCN2YTDgL6VNOTcoarci4buz+?=
 =?us-ascii?Q?9iiOQ8RH/ch3YCe11qaf+KkGSjuLdzRyHVkBsqJuwV6nIuVl+FXLgk1KDAfn?=
 =?us-ascii?Q?XLqcOH6qFhL5xJ/Fd3IN4euB9CiV+c8eXkAwQGrpraI892pgoIM8nzRos03q?=
 =?us-ascii?Q?TDhYo/CMKg9uLbhtIY4l+5VF96FrjcB3TUB3t1tIbTEbMBJKlOBt2DvzuHh/?=
 =?us-ascii?Q?svE0CWVHrJO1cFH5DZLpQBSLUau/wb6pUKCg/u7F3DNHbA91GsFT8K2FQRej?=
 =?us-ascii?Q?Tsgxo9IQWCIH1b1NB0Lu6MKM4O11UKgmNUQgLlc+jyUJW/kfaIaugKhmxzVG?=
 =?us-ascii?Q?1YMAxDKsukFGAsPnMC4F4DvTPHf0E0wIf5Gcj8CNtISziQntMza95kqXnhSN?=
 =?us-ascii?Q?O222ht8Mjkh1/QE//zsnPgDLuC3EJz7O4pA3T1lnw+n7RpS6adDR8wOM0Ew+?=
 =?us-ascii?Q?V55iPuvfhRIR46CggNJEMG+F3ArymZ4TEqre9DBKYHgRDZJAUjCd3a70UW1e?=
 =?us-ascii?Q?Wc5kg5stEhrSFDXTLxE/aFr5b8ZHO8SWA8pQCyRfK5W2yINVg1tKfwhbekJI?=
 =?us-ascii?Q?WOqXCS6Qh7cMHINm7ESDlpG2h1yz3HqKuhglK5urTh6ML0zg/3QcBXyX7u/b?=
 =?us-ascii?Q?gkR8sd0iWEvtWJNeaORjJ7GT7xp3aeO7QqB0cvTWgpJJp/F5jrnXkz60BMTZ?=
 =?us-ascii?Q?dYDAbZscTiFBZ0wcUrL9aMD2WmshNLlzjPpNO7ms1Eb0mcZWLDm8N9auohO2?=
 =?us-ascii?Q?fad7T8yEntrDDQHGvx3E2a2/IiP07oaQoqGrKDrVfSkUl8jRUXomXy4N+197?=
 =?us-ascii?Q?A6DcYZ7JfdkPPBYGwij5oNUbhdewAt7QOk/yiLefzHthpEjPheUlvHuL8A?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(35042699022)(1800799024)(14060799003)(36860700013)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 21:36:08.6374 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7ac1cee-8cbf-4ada-841a-08ddc89e9aff
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C716.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9738
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

This patch series introduces some minor refactoring to enable support
for new Mali GPUs.

Key changes:
- Addition of cache maintenance via the FLUSH_CACHES GPU command for all
  supported GPUs in place of FLUSH_MEM and FLUSH_PT MMU_AS commands.
- Added SHAREABLE_CACHE support for GPUs from Mali-Gx20 onwards if
  coherency is enabled.
- Fixed minor issue with the setting of the coherency protocol.

Firmware for these GPUs can be found here:
https://gitlab.com/dliviu/linux-firmware

Patch Breakdown:
[PATCH 1]:   Adds panthor_hw and refactors gpu_info initialization into
             it, laying the foundation for subsequent changes.
[PATCH 2]:   Simplifies the method of determining the GPU model name
             while making it more extensible.
[PATCH 3]:   Adds support for Mali-G710, Mali-G510 and Mali-G310.
[PATCH 4]:   Adds support for Mali-Gx15 GPUs.
[PATCH 5]:   Adds cache maintenance via FLUSH_CACHES GPU command due to
             the deprecation of FLUSH_MEM and FLUSH_PT MMU_AS commands
             from Mali-Gx20 onwards. This feature is extended to all
             previous GPUs as this method of cache maintenance is
             already supported.
[PATCH 6]:   Adds support for Mali-Gx20 and Mali-Gx25 GPUs. This also
             adds SHAREABLE_CACHE support, in addition to fixing a minor
             issue with setting the coherency protocol.

v6:
- Picked up R-bs from Liviu.
- Removed unused register definitions for PATCH 4 and 6.
- Link to v5: https://lore.kernel.org/all/20250721111344.1610250-1-karunika.choo@arm.com/
v5:
- Removed all of the GPU-specific initialization boilerplate as it was
  not being used.
- Merged [PATCH 1/7] and [PATCH 2/7] into one.
- Fixed issue with getting model name before the gpu_info struct is
  populated.
- Merged AMBA_FEATURES and AMBA_ENABLE into GPU_COHERENCY_FEATURES and
  GPU_COHERENCY_PROTOCOL registers respectively. Reworked the fields of
  GPU_COHERENCY_FEATURES and added SHAREABLE_CACHE support.
- Link to v4: https://lore.kernel.org/all/20250602143216.2621881-1-karunika.choo@arm.com/
v4:
- Split 64-bit register accessor patches into another patch series.
  - link: https://lore.kernel.org/dri-devel/20250417123725.2733201-1-karunika.choo@arm.com/
- Switched to using arch_major for comparison instead of arch_id in
  panthor_hw.c.
- Removed the gpu_info_init function pointer in favour of a single
  function to handle minor register changes. The function names have
  also been adjusted accordingly.
- Moved the patch to support Mali-G710, Mali-G510 and Mali-G310 forwards
  to [PATCH 4/7].
- Extended support to perform cache maintenance via GPU_CONTROL to
  Mali-Gx10 and Mali-Gx15 GPUs.
- Link to v2: https://lore.kernel.org/all/20250320111741.1937892-1-karunika.choo@arm.com/
v3:
- Kindly ignore this patch series as there were duplicate patches being
  included.
v2:
- Removed handling for register base addresses as they are not yet
  needed.
- Merged gpu_info handling into panthor_hw.c as they depend on the same
  arch_id matching mechanism.
- Made gpu_info initialization a GPU-specific function.
- Removed unnecessary changes for cache maintenance via GPU_CONTROL.
- Removed unnecessary pre-parsing of register fields from v1. Retaining
  current implementation as much as possible.
- Added support for G710, G715, G720, and G725 series of Mali GPUs.
- Link to v1: https://lore.kernel.org/all/20241219170521.64879-1-karunika.choo@arm.com/

Karunika Choo (6):
  drm/panthor: Add panthor_hw and move gpu_info initialization into it
  drm/panthor: Simplify getting the GPU model name
  drm/panthor: Add support for Mali-G710, Mali-G510 and Mali-G310
  drm/panthor: Add support for Mali-Gx15 family of GPUs
  drm/panthor: Make MMU cache maintenance use FLUSH_CACHES command
  drm/panthor: Add support for Mali-Gx20 and Mali-Gx25 GPUs

 drivers/gpu/drm/panthor/Makefile         |   1 +
 drivers/gpu/drm/panthor/panthor_device.c |   7 +-
 drivers/gpu/drm/panthor/panthor_fw.c     |   5 +
 drivers/gpu/drm/panthor/panthor_gpu.c    | 103 ++-----------------
 drivers/gpu/drm/panthor/panthor_hw.c     | 125 +++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_hw.h     |  11 ++
 drivers/gpu/drm/panthor/panthor_mmu.c    |  33 ++++++
 drivers/gpu/drm/panthor/panthor_regs.h   |   8 +-
 include/uapi/drm/panthor_drm.h           |   3 +
 9 files changed, 200 insertions(+), 96 deletions(-)
 create mode 100644 drivers/gpu/drm/panthor/panthor_hw.c
 create mode 100644 drivers/gpu/drm/panthor/panthor_hw.h

-- 
2.49.0


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 111D79D396C
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2024 12:23:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A16910E709;
	Wed, 20 Nov 2024 11:23:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="DkaQyci+";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="DkaQyci+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013011.outbound.protection.outlook.com
 [40.107.162.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C27DB10E709
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2024 11:23:13 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=v7cgGqjRzHVWdEvySULmVbBf+AdJJOu+6e3jBdehFHnzkGpzrSXPaHvjzPYnR+jnTn4fmB3sRk6BnommQDyAdPNgluJseCjFj/xjmynMaL8kpEcQMRMeKDzZT9Io8OjeB/Hdk8LbDF3oNeEQ16iaAHqC4LwowPoMd3flZngkcW6GMVsUj+251l6OLTIB6ysSpU3EKe0Q8ImKSSmAoTrJaE4KVTz8LNHaukmiCMYMtFX9Vqum1ELhaa/QE499JY0oVF5ZQyAM5X3jMkgaIz+hdojq+A4QizjuKnqcDXQtNRkXkEhWLmY/qVdLTiCvLE/mnMKF91dlipqr3NBU7/UzEA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ke+mfr97YmD1E1c7FQ6fCCt8eEZjEtEbNjVb4kTJlvw=;
 b=qkLUt4u4GDp8/KnkBECg/6/Ntl0U2exHO3Qd0MYl5xamZm3H85dJ75z/47RG+t/XjqoNaTcWBKHVJrFHMMTU+Y9P53FpuKyglxM+fOUfphL0HGz4aZg8zSRjq36HKhwY4ImO9X2JtwG21I7i/+CrGVQN2Rcr6460pt0oFlo38vEO1LgoqYXHqQMZhhNWWhuom3icAKR6VespIdIvrcCxmAuGWG/TDqeWYrhbX23f8P6I78T/R4/XM1iksBkNHwKyfNd6yIx5m3s2zgCBif/11gPo4C022HKDecE72zJb8T4MRjXhY23HEcHv+iTqhEsfD2VOFWV2SdftEGNtEuV4dA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ke+mfr97YmD1E1c7FQ6fCCt8eEZjEtEbNjVb4kTJlvw=;
 b=DkaQyci+cGzXLx3TL+f9FGfZyyufTQt0k/HWrDroO8rIdmrvHG3q4EvILAxOMxiKMEM52xyiSiIn22bLOYNAV5U5JFjEviP2ojZ+9IODSfBoLYpI7Yfp3YGxRk4rXGpr5Klc+NHVbRAGe6YMkraFomTeQQV9nErWxQMifw/UWEE=
Received: from AS9PR0301CA0030.eurprd03.prod.outlook.com
 (2603:10a6:20b:468::30) by AM9PR08MB6033.eurprd08.prod.outlook.com
 (2603:10a6:20b:286::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.14; Wed, 20 Nov
 2024 11:23:08 +0000
Received: from AMS0EPF00000193.eurprd05.prod.outlook.com
 (2603:10a6:20b:468:cafe::14) by AS9PR0301CA0030.outlook.office365.com
 (2603:10a6:20b:468::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24 via Frontend
 Transport; Wed, 20 Nov 2024 11:23:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF00000193.mail.protection.outlook.com (10.167.16.212) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8182.16
 via Frontend Transport; Wed, 20 Nov 2024 11:23:08 +0000
Received: ("Tessian outbound 6970ca6dd121:v490");
 Wed, 20 Nov 2024 11:23:08 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f9def58c0244f5bf
X-TessianGatewayMetadata: XJOBd50BIYHP83qmktWp0QKBx/WZCefHJjGMlIA6GP1++voeEQD/RqRJIGUUYkSYb6mVcf70dbIXNZwGqC5BG3VPMlzZmtUqzTO3B3oOSLOqJkRfouLQ1YUm/3zSmWYAotdqqFm33GvxhBSPKdyytILCUEawiqMImBrDWQQZIUw=
X-CR-MTA-TID: 64aa7808
Received: from L42aa07a32a1f.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5BCE0A17-2007-4494-8393-2A0759B9521E.1; 
 Wed, 20 Nov 2024 11:22:58 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L42aa07a32a1f.2 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 20 Nov 2024 11:22:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z70YnR+XyQxMuFkrKroWHiihTzzCfhrxVKvIxf1B+Avo7NzFIS4j+ylRsPydXUF472C19O3zNzbXQ2xaC5hO8iI78WdIm47z9O4oRdeI1Bihz+0CG0HobQR9m3EJxaRvJaqOUjbVv7FsrhynZPlTraM63npcezsvXDExQEdjRBHaqfcYsQic1USjwpIU7ilzKXtCRYoJhQQfl5N82k1ViZx852isfB+POy0voApQqeULdBaazCV2n/78tR3wp9n0sivZhWG9irA/I4Y1WxvoQn8Sn9yeS4JG5d6KuPsdZxxeCVpnImKwPsGBUCwsCyG3uenWT1evDvo7u87YtNHNCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ke+mfr97YmD1E1c7FQ6fCCt8eEZjEtEbNjVb4kTJlvw=;
 b=cIJroGr54LPIiHg57dT2EpLySjJf6QFr010OlkBTE1ladfulrO5TIsqD4/Hy+JciJzTeELrLLsG0FVRy6AJek1mLYM52+PJmV9oavIREjtb+EJg1nbQWcdcQiV4j/Cas1ldnTTzG9o8+fK+xX9oo1JHF3/dJfHX1EWBMDD6cnpHvYeXsZt8y2NMCZxi14+AIgOAJUkM0SM2OaDryiYfzjxMk/YZStLONbOo2PNMXjAb3hBxAkW7jAQH/pmLSVAlCnN1XsOMNwG+dh5HEULfT/e38Z9defMlWPPDjv0fA96qpa2qc/6rDdEP2OkR9UWn2oiZwpgVbLQPLMxxLBhyDzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ke+mfr97YmD1E1c7FQ6fCCt8eEZjEtEbNjVb4kTJlvw=;
 b=DkaQyci+cGzXLx3TL+f9FGfZyyufTQt0k/HWrDroO8rIdmrvHG3q4EvILAxOMxiKMEM52xyiSiIn22bLOYNAV5U5JFjEviP2ojZ+9IODSfBoLYpI7Yfp3YGxRk4rXGpr5Klc+NHVbRAGe6YMkraFomTeQQV9nErWxQMifw/UWEE=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by GVXPR08MB7799.eurprd08.prod.outlook.com
 (2603:10a6:150:3::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.20; Wed, 20 Nov
 2024 11:22:52 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%3]) with mapi id 15.20.8182.014; Wed, 20 Nov 2024
 11:22:52 +0000
Date: Wed, 20 Nov 2024 11:22:50 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jann Horn <jannh@google.com>
Subject: Re: [PATCH] drm/panthor: Fix compilation failure on panthor_fw.c
Message-ID: <Zz3GioHsrcGG8LNC@e124541.cambridge.arm.com>
References: <20241119164455.572771-1-liviu.dudau@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241119164455.572771-1-liviu.dudau@arm.com>
X-ClientProxiedBy: LO2P265CA0114.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::30) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|GVXPR08MB7799:EE_|AMS0EPF00000193:EE_|AM9PR08MB6033:EE_
X-MS-Office365-Filtering-Correlation-Id: 85918e3c-9f44-4489-c7cc-08dd0955b5ff
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?NehzvnrPyBvqAhIY8bKjjGPf5WR6GQQUiyvsH9rk0RHEY6MDEiNUdHgpZOGZ?=
 =?us-ascii?Q?z/mBLOs+FWOpr4hw2EKIBSDb1ea39s3twalxiT1D1PXVto4BlIwevLPQg1qs?=
 =?us-ascii?Q?q3OqKtw+3Y2DUc4B/0FsrU9mwLP+Bn1MOFAQb8RzUPwibwRcysFdZv2b0IJz?=
 =?us-ascii?Q?uCcXuuqM7o1ZrFIszkO+CcZB4IJyiRAhmVSxnhTYC5nvABd1TQbUAuu0yC2h?=
 =?us-ascii?Q?DQNv/2qt+GyMjwvQquco1LXZYi60CtwPOzEYNMgnnyEGZfP1iGq6oOjyyl3H?=
 =?us-ascii?Q?fvVBa0CsT9XRpQb/KNabG3yPBhZS4kC7Gbk6DIliMFJjl0xQ6sJeRt9U+Zau?=
 =?us-ascii?Q?JfJgw1kSu6GDVXZpS5NqQni7VVZCl0okQVTw/Y/0HV7pWVoSibaMj11TJbUi?=
 =?us-ascii?Q?ck1NK3TGfUi/lEFTv3ebgDwRB48ZoeOFwfXnk1ZE57eZvj3WmZD3YXn+eFVs?=
 =?us-ascii?Q?LCjYtMfEle9qX+G+9Ms7eTWGbvA6a6S+eWmq1JGia0dM9lVWPbQJL3iOEqp5?=
 =?us-ascii?Q?qVIuHGfHx0MNLPRFyeQo0BdezfJQmi05Ehz/NqhhBXwNk78lz55ELcya1zZ0?=
 =?us-ascii?Q?pXGsOO1DIEoOknyX1oNUtFfFRK1TGVA4GJNER/p+fPVOoO5Qv3MaBtoR9N6Z?=
 =?us-ascii?Q?eimz8GiF2iMhvjuwUnXYnFxMtgiDg3sLv4XJ+auuFgWdI9xP/ZSHMRvx2VJn?=
 =?us-ascii?Q?j1vVh3yeNhsS/es/yeShqXUkaJHWkqnTrYEZXEefSckm1CuQdZlXBbG4Ni/E?=
 =?us-ascii?Q?jUAJMHDzkuBIuj/HAewIBWOfH5dRYwexRzBxS/oNrErH0oZjaDXM8FYoInLR?=
 =?us-ascii?Q?WFz2Gy5xTGMR75kB8/VO3IBtaSeru41YAFYMl1Xokc0CXxrT6MbYGB3nEM6W?=
 =?us-ascii?Q?XpLDUT1ySEg1M//3cE1D1LRTT3LhbapSjZU3LqWRhuBGEyAeXOdlj/CgwCeL?=
 =?us-ascii?Q?kWsEqurjCal0UeVLbtjDuU+IENKgWfQbH+Zm3ONy0CnGWt/IFDdtFQLA5STm?=
 =?us-ascii?Q?VqB3SXz6A14NOXq+qpRidql1GVNJ9auP/zFa57wzHGuzuHSQciGVJ0AYzzMg?=
 =?us-ascii?Q?wItnxzV+GA70ZLWsyL5aU/BiWbN4JT/0Yyc3oxX8aB4bzEC2gHPwGy/avSPU?=
 =?us-ascii?Q?JquVoGWNROqaMPiQRdJD851jJp1Evd76L4+XhL9oGMOLC1LbbgOq4cNdO46X?=
 =?us-ascii?Q?Dua506lKAW+nKH8CDlIt+ulKeJUhP9yBB+k4QZl3q6sAa4sjJIi4F9cCpvnN?=
 =?us-ascii?Q?dTnJ7lTS26aG3nem2kl12ZwCiCkpk0eVi+JhlHRUGZAVXUZDCcfQMAK+aIOY?=
 =?us-ascii?Q?Map45ZbVvlyKC7LVo7myJ9gc?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7799
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:800:257::18];
 domain=VI0PR08MB11200.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF00000193.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: ecb8ea3f-6909-470f-d5dd-08dd0955ac0e
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|14060799003|36860700013|376014|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uRTmx308JdFQXMJAibgTkMidy5h3xPYjPvGWd9f8Nyyvj3Vr26GYir90bqtw?=
 =?us-ascii?Q?pe8trUz6oFPB1q0v9tyyIHemnrjflMNy0HGjaYJ8EYyCvkA3241cAF1Ap76B?=
 =?us-ascii?Q?lu+ZhAzo6FchgBHGrQfo/BE9wvU5Hiihd+PJT3m99dHRMRUKNLHdpxqo5Edd?=
 =?us-ascii?Q?fiaYfpQy/WN0Clw9sWPE4cgyUrwjTs3z7v7Mw7mFPONdJ2ecWtvSuFu/Tmny?=
 =?us-ascii?Q?7SxcnXHB5D4CHV6z5+l9drDWxcERWXFAghCkC03DWU4S+8stWVPdPMQyeHzN?=
 =?us-ascii?Q?ysX0GcV6KhPYI/OthwIHA59dU8E4ob2czrC2VJQcoPPdnGEa1Gt8ziLL+m0G?=
 =?us-ascii?Q?n2z8ZZJRJ6ulbuDNQVlRIiQXQn3OgbxMs8rikXzD9TLctueyRrbHxg+e+k7+?=
 =?us-ascii?Q?ptortJUwYBHWNGSuguXL9J70daT9k+u/ngmnblMgmj1NKc69vaogu6l8k2zG?=
 =?us-ascii?Q?fVRn6svlQfzmMdFN87k/TtOLdDr5Z3vLCxLKl9AhjHth+6VjEI35cgqR8Sod?=
 =?us-ascii?Q?TikK4OJFURD+rp0ar9nhDaPLlwf2/RsO7ejqabOzRfwAWP0yjGkpyIg3Oo4h?=
 =?us-ascii?Q?4a5cfLo8cW3O1oyeaKLONXbgvYW7paosJBeZipAxzm9PS21v4LuMAopereXp?=
 =?us-ascii?Q?ugJLaKbHSyt5uTClD3WY0UZaBmjNbmGhFF4ufYtsNkcN54BJqGL+QAUm+K0P?=
 =?us-ascii?Q?mFahOWLta21URGBqxVFBALjnbOn6n9SZlFi5AlmpJPYvXBeQ37D5Di4HRM9m?=
 =?us-ascii?Q?dB4xU7U6vL0rvEn/GunXNbh2fu53xgOY+XLBmchMPrV8BwTmb1Z0SarM3Rll?=
 =?us-ascii?Q?31GmgNjBCRybzvKKrtDAHjqbm/Mzwbs3kXitPtcbHCtRCAB1TrfECLYrlIx2?=
 =?us-ascii?Q?8ZLimS0fBxNaKtNJjY+tfKijME9XOCjMORDquW56/Enyz56HyklxpyVug5vp?=
 =?us-ascii?Q?J0f+1fj0VneROZOnzScpvvzaU0f64dqIPWX7ypUUCKMuPhbvht2XwWI7SWVD?=
 =?us-ascii?Q?ytu/u9JQrrScq/7kDNspsrfKBEA3Qe2E69t7I41RMmd75sRKxSBGbagQqC1G?=
 =?us-ascii?Q?6ykGnFnYRnSCQLhgoSKdlMz+eONSuqyK9vlKf++8HGAcrdntIiTfQySoYMGx?=
 =?us-ascii?Q?6mDTWVFdx6HW0HvMdr3GntM55bT4UOjEewLtGvFeKKfnLHArMC3d5IDjMVGU?=
 =?us-ascii?Q?wjdzKhtIgZ16euEz6GhwVt6zY2KUDIXvKLWyeXwitjFFGAC0qb+PTzeZrc+r?=
 =?us-ascii?Q?zF9E8qrMn1gjF76zVM4Qr3aPpZXLS51aXG+83VkP4n07jb8bh/JZHMY+HVFE?=
 =?us-ascii?Q?DtBTu/AK1dIve6CTVYXS9OO+pN4wi29QCXb5m9l7aqD3d9bROITAYhIVVIkS?=
 =?us-ascii?Q?r55whKLdVWng51mCm1CtV9JGEPgbM3O5xXPxqkhVSjK5OGLKLg=3D=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:64aa7808-outbound-1.mta.getcheckrecipient.com; CAT:NONE;
 SFS:(13230040)(1800799024)(14060799003)(36860700013)(376014)(82310400026)(35042699022);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2024 11:23:08.6318 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85918e3c-9f44-4489-c7cc-08dd0955b5ff
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF00000193.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6033
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

On Tue, Nov 19, 2024 at 04:44:55PM +0000, Liviu Dudau wrote:
> Commit 498893bd596e ("drm/panthor: Simplify FW fast reset path") forgot
> to copy the definition of glb_iface when it move one line of code.
> 
> Fixes: Commit 498893bd596e ("drm/panthor: Simplify FW fast reset path")
> Signed-off-by: Liviu Dudau <liviu.dudau@arm.com>

Reviewed-by: Karunika Choo <karunika.choo@arm.com>

Looks good to me. Build-tested locally. Thanks for catching the mistake
in my previous patch.

> ---
>  drivers/gpu/drm/panthor/panthor_fw.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
> index 4bc52b1b1a286..c807b6ce71bd4 100644
> --- a/drivers/gpu/drm/panthor/panthor_fw.c
> +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> @@ -1133,6 +1133,7 @@ int panthor_fw_post_reset(struct panthor_device *ptdev)
>  		 * This is not needed on a slow reset because FW sections are
>  		 * re-initialized.
>  		 */
> +		struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
>  		panthor_fw_update_reqs(glb_iface, req, 0, GLB_HALT);
>  
>  		ret = panthor_fw_start(ptdev);
> -- 
> 2.47.0
> 

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98ABBBC6CA4
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 00:21:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85D8B10E89D;
	Wed,  8 Oct 2025 22:21:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="IHkTlfCT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010062.outbound.protection.outlook.com [52.101.85.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28C1810E89D;
 Wed,  8 Oct 2025 22:21:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EUeU89pLNi0L1Q50lIMQSLklMZMqlcrQwVnB40zpuA8KAi7AxYl+yGNliIxa/H37RNetCP1dWGudUqTPGWpcm6Gj9HrcWZDh9eSta2osb1TIWyUJMWFRIRnzSoOLpNQey9bUyckADse1LIggQbUZVTyDcIpa9AJ5e+Ni+nEyBO7P0ybJplOdojkCI+l2/G4Ht4Hus1MyaXhZzR5O7FM7fGcJLa94O+Ck4QEVBkQI18CkkaN5zl7S+FU2jIGXkOUu5+pDSnmfKxBjerd1wZFjeJvwZVPZUg9SaNSG6ysT6tm7rHRj4kKIhfQ1w0bOWKxOMsi+pRQfHzWNkRVuw5UZBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iCeaIte1egMtPEc4VH5gvhmP+DDn47TOz7w9YodzPfw=;
 b=idzxNgoVfMTeLigGUAh7FUN4OIgSCCKDEBOYjVlKTlwB8YdkLNv0iI+VcScWLwU8wuZt1ObFx8h0FPlaoTTrHME5d+5eo3pOzWIusHCEqscE1VrymaLqgFLk5e1k6eFNbEu9ExWKQeKDCsSlEHMRHoVxVW1nHwa33meyweyqkRZtgrET9+a4mzDdjGD+J04Fe4l494nW8Xbr+GbjiksxFwXXKIb8cuLOzF//ZMzEKQutHvTXN2g6GKuAIfLtGaReIgHG0O9AQEKXS9oN+eAMHbzYakNUtoHT7J1ChQDDx+FjsMAp8cLb4TBRasRd5VPUkuMOhRAUDzm1pTOLaiykXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iCeaIte1egMtPEc4VH5gvhmP+DDn47TOz7w9YodzPfw=;
 b=IHkTlfCTgaUoAK2oG2f428uO0YJbXeF+pu55b/BydE1MZsNSD7dqy664e5TM0eqK5bl3pHQYiyEpAjVeKbqlof2u+rBmcTXbwu1ICDAjls5nLZdbFfV1eTRa7v5K5HaLesbnx8CrXmQORZ5L2jEOP3GZzShvopb2hbNV3sQb/K99L0Btkn9WvZrVASCjB7NEMpvdse+MqTFwXUMu2yECh03fi/yGXtKPUHOiK3WyvsvYiNed7Mm2qjx5mmbtUb7k4Kffkz7nZoUaspLIrd9HJ4GbHaTl8pynCg9M3cxOuhh53UjeoQBc9MgkywwbGgrwasjD7KC70kdYMdQfHRfFaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 MN0PR12MB5884.namprd12.prod.outlook.com (2603:10b6:208:37c::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.20; Wed, 8 Oct 2025 22:21:18 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9203.007; Wed, 8 Oct 2025
 22:21:17 +0000
Date: Thu, 9 Oct 2025 09:21:12 +1100
From: Alistair Popple <apopple@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 acourbot@nvidia.com, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 John Hubbard <jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
 Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org
Subject: Re: [PATCH v4 00/13] gpu: nova-core: Boot GSP to RISC-V active
Message-ID: <xcg6p3i7zg6rmkc6nfouov73nmjjytynb5qx4r7b2jcosnhipj@ghkqxbrsavvo>
References: <20251008001253.437911-1-apopple@nvidia.com>
 <17dd5928-f06f-4747-b36c-195be4ac5082@kernel.org>
 <d3246f19-e2b8-487f-b896-3bef1ee0174b@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d3246f19-e2b8-487f-b896-3bef1ee0174b@kernel.org>
X-ClientProxiedBy: SY0PR01CA0005.ausprd01.prod.outlook.com
 (2603:10c6:10:1bb::16) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|MN0PR12MB5884:EE_
X-MS-Office365-Filtering-Correlation-Id: 82e85513-0d8c-4ac7-86d0-08de06b9003d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|1800799024|366016|376014|7053199007|27256017; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AQPnYYoKCzMI/mVpZM3b6PNo5JrDHSN8YtKK3BcFVQt8jLSKctYyuOsOpwtd?=
 =?us-ascii?Q?XXAwPB6Z3dZO4UPguWz0FJBqo55MblQNCziOWvC3bFp1mAAJgazQWxXD8bO1?=
 =?us-ascii?Q?yeohv1MqfcaJ1PV7ws+VZIHMUoZpZ9NmrTsvXIsndZIi5DZZY6ufF5gfsc8M?=
 =?us-ascii?Q?ttp0p3ehmfc81nZFoohq+flDnFXMdSChr+IYLwTvnn+W3Dhkw0CJ+GkmU4/U?=
 =?us-ascii?Q?+26HwDIe1bxDRBkRuh5jvi2Haf6D9ewII6HJuTdChw/5TxoMJjtl32lazx7t?=
 =?us-ascii?Q?61ZCdx+zCnxROmVX6RY3FJ1PPMTChXjZ+NlZBVoRYuaBHuq4qNSEqDBW2lAU?=
 =?us-ascii?Q?RNX4v30cEV0Fx5hDKXIwCzyvtLS2lSdpKytPz9wAlJpQx8P2mIlGmgJYIrnG?=
 =?us-ascii?Q?slXjdEmuSDw2RpqUkKj6UTnBHVDlzdSzPGNVmdn7nAYDbf1oXXXCu5R9MpNE?=
 =?us-ascii?Q?8Rh5YiNZmOgFJLixyHQUZJqVU2ZL1wLokcQheB2VTUsfS0BvELkMxrI8lVXw?=
 =?us-ascii?Q?BRv1d1ICrdaJSO18HVuKz3uVQ31sDpbXkDWvSUkvots/FW0av8/Rh/ogIdTD?=
 =?us-ascii?Q?XsffoO1y4gs69JhK8rNImGknXFofX6MfyhJn624mP0tYSKAStEgQ+mxvSdZg?=
 =?us-ascii?Q?/uZcob5H/TV03Ov6xDZbmbUHUKeafDNyfCihZvnX6E6XuWF3iq/3m1Oi6o9m?=
 =?us-ascii?Q?mDALpgYp4UCryKi8Muwhm55vmtv1+DXOvo2KfqC+vhPmdxTLde+g2TAfsWUa?=
 =?us-ascii?Q?AqSM5UB7SHkB2ubOX0ECLeXAtYId8Hr3BwBdOJ8IFUljAusKk0BVE5wd4bNz?=
 =?us-ascii?Q?CohXRCeg+Q1XIeQXtQA/4e+lM+MSKvUkRC8E+TdR94fGEaRDhpKcJw+BdW/w?=
 =?us-ascii?Q?w7DjAMjCQXmgUfeh3Fd61Umdg05x75Gq29NylZK9KQhqEQ4G4EA5urO9ZAB8?=
 =?us-ascii?Q?pMfpoJOhxdfFYuBDrXsLTB5snOFgP+cTGU83bdoGiuu18mE65i2c69s2gjXQ?=
 =?us-ascii?Q?acxBWpwb/3KvVwPPK9qHfd/B1nNjPCTQWUctkXamrgeLUcxvSTiAqJN0R4wC?=
 =?us-ascii?Q?OOy3ZqGI+LneuudngtNCmM+4zrzTs7yAcusQrqetnQSPuU9+DEya3XoqqUbb?=
 =?us-ascii?Q?OPjZldjS5aaD8QbzYpdsERNA5MqxP67Gy/KiWAzu7bDUIByJoOy6VLR81jrc?=
 =?us-ascii?Q?GTy7NkuGcmVysmFoYX2jOZSJ+xb0ues+b7kUvhJsL7uOTdLq2ECiGZtRBkZ1?=
 =?us-ascii?Q?9H3pw1tWGsWQlOdNW2UYDv9351QqAW6wuUMSDB2BUeKW562tLD3oQwOHvA2g?=
 =?us-ascii?Q?fMjT0cvA+feXmz1gWw1OK4qXpPZZc3qs4Pf1YSVbMG42NLkDRnM4JYbEy0S+?=
 =?us-ascii?Q?+GmiG8esSWoyL0Sj01ybglwMqbkolNjh8Lo+m+WrKxHEMzU5+KPWLK/5lmgf?=
 =?us-ascii?Q?xCEJ28Opt83ydPs9HitmD+vH25rMNiIDnQTUp2jhjsUs0+5prTWIMKs3af7b?=
 =?us-ascii?Q?1aysNs6r8xZ6i8yio4nnB7ungk/3lqk4oJ19girut8od/dKcvD91iu/L5A?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(366016)(376014)(7053199007)(27256017);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lsLPJa4dFjjKVNP3iU8b/5EYKnjvlfbRFdqttbENwGvNzhfHssGOTWTwFSwb?=
 =?us-ascii?Q?PTAkZicOP0V/el5R4pdJC0kLcIvVOKgpfeQ2GVOkqlcF3u3+P+TjLEjU3Bvs?=
 =?us-ascii?Q?R0BvmgnFKhImOLJzBV3HYFSk5hH/Y6oCDOyMkEKXBv6xTMwlQmx90lFR8YgP?=
 =?us-ascii?Q?SQkByICZROnfoFbe77d48V+McV4dLlJO8v2D1slSbsuQLyfEoN7P3cm4YZbf?=
 =?us-ascii?Q?R+Bluf6Rs4B6RI0zW0C15sASmck5/56FF0GgGRE6sPX5t2rpihqIBsnCvJfT?=
 =?us-ascii?Q?bd/zjclQuydmrhsM2G+VL9EOIaFS4Se+bS0CONKlJz4sVztW3iUoX14ANzzj?=
 =?us-ascii?Q?X8/Jwpu2d9yX6zsnk+eBDcnyVqqSyP+HG3XuBuM0L2pif1syhudgUF9p0wG/?=
 =?us-ascii?Q?QYUXsysjo3eupMYfXyciQtNeiXl8bIKK0JZTjAFohPH1V+QSHtIHd2tijGC1?=
 =?us-ascii?Q?Ul9HbZiyuwbryTtFDngUmjRPV4xic42Xk7yvDIhlkoUe3dsrdb6yEK4HR5F5?=
 =?us-ascii?Q?S59qhw/7CuYgZFTjIYxm/62epcLT9oFpzRPijr1oTIEdaKPCRFQEcynqnGik?=
 =?us-ascii?Q?xloqnW7eRsydWJ5EapqdLbl5+CT1CIWyDcWBv8LJKIu38fnUzRacKUWMjJF8?=
 =?us-ascii?Q?DcoSiXvPSb+eLI5L4+KgKSAyntk1hTFFADC+pgNdGdqo66bvUXH+PK38gCxU?=
 =?us-ascii?Q?ahoXUad5yJgsPk+HMsRh3nscxDRm5FxB5enZrLj9wIR7WQ1RZeepHUsuAXnO?=
 =?us-ascii?Q?MgMO3cmWpNIj/CFbOxt1wxh+aGVhOiLw8cZI4gCWqx4hU00Y95v4bji92vJX?=
 =?us-ascii?Q?Wkfmrkzrw1oNSb+EtX7pq+GTXddIyzkOX0BHOZY8nD8NexHJCTUi0L8OE6po?=
 =?us-ascii?Q?oOBY6/MtlbZ8jYKVc1apYwiSNa3C4u8tBvOhh2v4wbnBUXx3Q3xJEjdrKFYj?=
 =?us-ascii?Q?vA+b8iV338/EeHkGfiTAi6bNAh5Q9FIuvquClWwlyP/MlG8Usj61Rn8DwehN?=
 =?us-ascii?Q?oPNKSSg1Rj4esuk40h9twxOJVB/thtqrcjd5ylL2pP44P7QOumrzjdFE3n6T?=
 =?us-ascii?Q?yEE2rAbTRlUb1l0Jk3tJf66dMbU3x7CtVYw25OrqUwrXVMWQooqNQ+zAy00o?=
 =?us-ascii?Q?2274Q5HLHtyX2+xdmyOYihhDjrS3tD1vC8xDt24mid96UBnWjcD8wwDlmWzi?=
 =?us-ascii?Q?hv45aR7OnK/NtN+ZD9LNSyYgmIvvfG88sF3GCpvikb9il+2dg7FI4cLmTXlu?=
 =?us-ascii?Q?Rxv0Gv87WzEyZuXkOcZGiSpmVlyzKyTAP71bpZco6IsNdfZXoRLb+d4/AwQg?=
 =?us-ascii?Q?TOj6K3sdSBn1QWQz//5SBTvePu5zLvLpqA1MwMfvTyhgiGe4HoOaA1uD7Znq?=
 =?us-ascii?Q?kYOFmDtskMqIq4XUY6jrmnYH3CO3uzMMTvTJj9JZZg3FhZFp4VIJaqPVHHMB?=
 =?us-ascii?Q?viZiHb0ZQ4Cx2vg1IhHwJ+kC91ptuTQXN5B7M8+43PjTp6eEsFZTdy4CSK0x?=
 =?us-ascii?Q?E8eaxkvWUHnoGOvUaXj+HferRAiGGUr7jMd8IP4+JJPsVAQKGQ18mEVFdVMi?=
 =?us-ascii?Q?Qsw7pQwclia+uaHtm/bphtJ8zbEVAUoCxyNtclfj?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82e85513-0d8c-4ac7-86d0-08de06b9003d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 22:21:17.8618 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l2pATGlgTBCfFkh9i9rdLadt4NcS1U+CZZjHKp/nfwMTrYIAQ0XAhTAEKZTwnXmtPfmMpqHLFc6xlwVfQDdSIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5884
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

On 2025-10-08 at 21:41 +1100, Danilo Krummrich <dakr@kernel.org> wrote...
> On 10/8/25 12:38 PM, Danilo Krummrich wrote:
> > On 10/8/25 2:12 AM, Alistair Popple wrote:
> >> A full tree including the prerequisites for this patch series is available
> >> at https://github.com/apopple-nvidia/linux/tree/nova-core-for-upstream.
> > 
> > The prerequisites in this branch seem to be upstream. When submitting patch
> > series, please base your changes on the corresponding upstream branch (i.e.
> > drm-rust-next, on Linus' tree in this case) and make sure to include the base
> > revision (git format-patch --base). If it depends on other pending patch series,
> > b4 can help to track those dependencies.
> 
> I just noticed that you have version nova-core-for-upstream branches, but v4
> seems to be missing.
> 
> Without the any base revision I can't apply the series for testing purposes. :(

Oh my bad :( I need to improve my scripting here but see
https://github.com/apopple-nvidia/linux/tree/nova-core-for-upstream-v4

These patches are on top of some changes from Alex and a merge of
driver-core-testing and drm-rust-next that Alex kindly provided.

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3268B505E2
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 21:07:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1DDD10E7CB;
	Tue,  9 Sep 2025 19:07:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="E0c4STCR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2066.outbound.protection.outlook.com [40.107.92.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AED510E7CB;
 Tue,  9 Sep 2025 19:07:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cf7xyttf9Tj1duZJ9DR8HPZeSCccFgU7SEbg+ZShaOlYUnsZHtZ4Ku431V4BGXTC5770jNqg9dbYs5Ez0ZMCsy/PschLFQkhffuMmrBwG8diC8jNJ3WEaWhYT6z+ovfLzwKy5C7HLC8Wyn6t7FC3bzT2H74yfFKVmvolBZjuz2ba/tDEPa8/yZXSUGaEzY1cw5pNpiKgbhEzyoqQ8vFFlJKKJhFGqEON5Vk6IDst5i0e38FItUtkTMww3T+b5EyNzi56A48P14R6ULP5v+dJLa9+KUDEeHnNBHBdWqVkBjYBtTh/G7HRnf/LhpPgxSaM+zDi96ll/3eoGyr9YX4Peg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v5L9/CjsdZJWOSwOikU+6q99Da4IB5uRbjXB/zvMjdY=;
 b=VLzx/yVualpTUZ2dvkgEF81rZto/yYeo9AtmoBSgIXbAw1ahRzPUW0RK74KFjdnwHJWWTj22kCA/1F3mzOTR9vczqivocIZSd2VHOJB41ZP+4IJ23wcwat1xmt5kC/Gc2d2xp+odpMRn5P+9CRurlhBUG4bwbPePlE5UQxAVgEIDupb0jSzGtr7Gz2yXqr2bMW7FZYObQXgmv1XXc9hN+f1LftXuT+XBWF7/WRgeTWh7Zq+wJaxQcwUqbV1APdS/W6uEvGCkNn0Dx4o2Jw+T/0MzKS+btbQbSsWmgpME+4NBDAhiGfedF7mwMENQ6xvR0YByvJyv3BZUbjQpo8wjag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v5L9/CjsdZJWOSwOikU+6q99Da4IB5uRbjXB/zvMjdY=;
 b=E0c4STCR0olAKoIxv1rN9LR63gw5B0LWyWJ8FTz/45xYMEaLHjETJfUFlHq31+tINJITxvrcGJb4br4EHVgcl4P/p4ILmhrzwwtNU1zrThoW4OMf4G3OiDADhP0Gay2/zo/Apu93LvK9SR7Tc2ll2G9Gf3DFsgkL4stUa696A5CJqi+Owb5tMExbmZp+k+Lrm1trx7GkFuhuPbjn+SeYWw7cOOqUsWnu4QyOeGwLa7a7+fIDAUNhOx09oJjm3VNgBIKREd5df+w63xIpy5xXvcilNV8yAigDvADYVM9xc5pBo+ssOODlQFKwdyEPD568/nZ0r47GBVorGLCrNN8I5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB8044.namprd12.prod.outlook.com (2603:10b6:8:148::14)
 by BY5PR12MB4242.namprd12.prod.outlook.com (2603:10b6:a03:203::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 19:07:28 +0000
Received: from DS0PR12MB8044.namprd12.prod.outlook.com
 ([fe80::49af:9ef0:2373:1515]) by DS0PR12MB8044.namprd12.prod.outlook.com
 ([fe80::49af:9ef0:2373:1515%6]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 19:07:28 +0000
Date: Tue, 9 Sep 2025 15:07:26 -0400
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 John Hubbard <jhubbard@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 1/2] nova-core: Add a library for bitfields in Rust structs
Message-ID: <20250909190726.GA4177319@joelbox2>
References: <20250824135954.2243774-1-joelagnelf@nvidia.com>
 <307053b6-ce52-45ea-b33b-8ae5f24bf913@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <307053b6-ce52-45ea-b33b-8ae5f24bf913@kernel.org>
X-ClientProxiedBy: BN9PR03CA0911.namprd03.prod.outlook.com
 (2603:10b6:408:107::16) To DS0PR12MB8044.namprd12.prod.outlook.com
 (2603:10b6:8:148::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB8044:EE_|BY5PR12MB4242:EE_
X-MS-Office365-Filtering-Correlation-Id: 24929877-2874-4a63-47aa-08ddefd41e86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cvAHN3FrOfvY6iXoOIZsYKyEIuuzSEGH18ybwUWfcD0YJhK+mBI8sJQS/nuI?=
 =?us-ascii?Q?6/nduIj6/Euh4OlyOHOC6iaLKPPa8MeL9ssNy2LPDRGJY7RG9kFmibWnLhBG?=
 =?us-ascii?Q?WxaDsshs864ExTf8Oouzv4Tl1jB2/H6AAkqAGBrZmvGXtnaR6kAQSOj1qwWQ?=
 =?us-ascii?Q?8M2X6+MW9XSrEwEFZh7FGdOF2qFLE9qhQy5lmabSVs2TMcmIZALzgPS6XJ1l?=
 =?us-ascii?Q?r7MxuhDEl0GED3lE73jB2ynvDKNAvsUmQ3BgRlotTUTWhDLPe+sJd0eUWsGa?=
 =?us-ascii?Q?BGaW0bBxDkHojgZNX0+5wsPPhPOJX1qNbWOQ5p+mjp7I2NqeNNZ/uyi12q8T?=
 =?us-ascii?Q?Pwaw4hhGCabER59Zyn/crNk7mcwQcN9pml7e8qfK7s79UY0OdyDC7dEaCKrM?=
 =?us-ascii?Q?d45kL2eQ4k4d8+jfQRCEAO1TJakIZNI0v5aaWJxMxrIa8Z9sFdMlj7yTVAwe?=
 =?us-ascii?Q?jjtHSAJ76ur0WREOXhVqjSS8YDX1/iyL1GP/0+zWG7InEc+tkleaxAYtHCwr?=
 =?us-ascii?Q?Q0Y9ivpBeCxZRsbrMfbL35o3N/6duidfcJozx6RYOkP6WbkQ/bkUFJYpEzaQ?=
 =?us-ascii?Q?nAS0BKWA9Y59/T4qlc1fHNmm2NJpSMbitN8TXfTocjG9pj7WljJJEtLCvt73?=
 =?us-ascii?Q?Vw4I864/zbR4JjW8DxgAciqJJfXAAhCscwwp/kRGFcJisjHJRv8i0lako8dj?=
 =?us-ascii?Q?eQvmnmswqh52LHP4smOqprUWOtx+T23Pl3UPqz9KqNumhtxq2Yp97uGL3egD?=
 =?us-ascii?Q?IlzOsxMFRd0g3EWppG9FlBkLH8caSnhotyYPnYcfCiKBAO8t1KobVsYDjWR3?=
 =?us-ascii?Q?6RFC7dUJhoQTDCpHSrRbEllI7D6PJuhbFjqzufuiI7HopFOfegvYUaP6mc9J?=
 =?us-ascii?Q?DQUAfvhqZwSxJW4vh6dxa/zyoue3VaBSw0HII4rL6Nq9PRixTFYpWaoSbrlz?=
 =?us-ascii?Q?i88sfQD0imf59IL7rX/cGK8GxqN46RXUZL6q2IW3i+FQdRZsoOSXABMPuhay?=
 =?us-ascii?Q?JRKG/NkXcayB12vdWKVXhgt5rOPTBIA1SqfXCh6tRlmm7HmyW+GpAscBvMe8?=
 =?us-ascii?Q?InRhPvHGoVvgdgCppmP0eO9X+POHJ4ATyaw1VprIOh02rVuzUY6n4L5WM+mj?=
 =?us-ascii?Q?7gBdSgsdPviPHbb4CHYpypeZSZcHo9bLCbvNxxHBiz2kjla1Z+KbKoO4vGl6?=
 =?us-ascii?Q?jwYzMJWjTm+0HqH4xYHwlUFQneGERt5f3MCJLo9b8dmqbuZRouIpDtVWgW62?=
 =?us-ascii?Q?R+vxCe+YFS+URH/4pJQlrsW7X6glQPugRDtypTj3aineoawZcihn+Il8doCg?=
 =?us-ascii?Q?1MIE8FgoiKURuzNUzyR2ecIHTfNPgaaCTVqvd/ggRo6s55Df/Q2RmyaAlaVK?=
 =?us-ascii?Q?GG+EddkmFdmGuXgNe5GpvaIrEAq7IsCRW0pg7ibX+/NPbz+UQm2TZ2hRNPx9?=
 =?us-ascii?Q?p7IiTh/Hu5Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB8044.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JicwJVooL/6jSNPIrNd7kiYXy5H1D7KlKhdNLnMs6VrBeKwd2BX4/APHb2GN?=
 =?us-ascii?Q?rjlUWIrbuuox4z31CUJ3rK0UjAfvNIWXgJkwMqNuMnnvJ+ij8oneOcKAnbQU?=
 =?us-ascii?Q?+uI0MHlTX4yeephLsYXIG9kTd0CqDYDw0z0AAdV4Ow0EBQP3muCfgPnfpOLw?=
 =?us-ascii?Q?Bixn5R9Eei1xh5rWH/EIjOhMFlDg4cJga2+jhwc0kCWs+aAtD52NEvQVSYSS?=
 =?us-ascii?Q?87F1AHbtQvbZ9veneM8vem7Jt92iILaw6Mya66FaOf1NnXbPfbSs4TabXs4N?=
 =?us-ascii?Q?OR9soVERyC5XoL/7EbmpdTlYXNadIQBbk0ZxmrEtOnU8hyWeervzVU+EqWkV?=
 =?us-ascii?Q?2ss8IBX6R3SsBJvqMlpc2F5qomW1hxX0iZiLz86zZ4cs+B0NIVo3uVCfOHJz?=
 =?us-ascii?Q?EspkKkq2undwavxqvRcOMYch4M+YUSEsrV5DoZW2OD7ytynVi67jMBHloqFx?=
 =?us-ascii?Q?RRDnzeGqByfDQ9mmqHFY/VsfdpSMIH6z3J+ktCXt4y8LR2rXywORK9HnmVE8?=
 =?us-ascii?Q?osIdtSNSZkuc3ZFg6JtTpwmc6p5BRhzYdeXgUPa4YGp6WYhDD2ZG5I55/pBT?=
 =?us-ascii?Q?WRipLJeMemL2KiU9yY6hzO+3CPulJ2Iv3L3O/pHQfKbJ/lpmI5mIz4qBQtbA?=
 =?us-ascii?Q?7JHB3gPoDpxMlIv/vl2kNyA1DY2012BnY0kgTQ+k7wdn+ElFcK0TF29LLUk9?=
 =?us-ascii?Q?K2x7+iMNQMSq8ptNa5qnN1zoujr0OcO5jl7QotK3Fw+ijYYnPOm6YqLue19p?=
 =?us-ascii?Q?FzuTGMTK1NUOJ2Os5pETkAZ8Q3CBqCeqQLN73RODeh2VisWOl8q5Qby1kUv+?=
 =?us-ascii?Q?o0STZBclqmgAKXtyVO3n2W5CHjFqykvjlZ+VYH0mB1Jlc9rFCsxLFr4T7Slb?=
 =?us-ascii?Q?Upq/w3F5EDGVvyY+1gxlzxkZbPEltN3oRE84tMZFEqXoTuFtCzU1iO4MEcxv?=
 =?us-ascii?Q?7GGFOCDi3yKPZL5vCIgppEOg4MH0H24i+Lxo/cosYqLnoWdssxYJw7M5D2+S?=
 =?us-ascii?Q?8JbuCgJlHdGp+lYDWgy6LN0uhFMJ5hqKz80BOO7EFUaK7m5b/I98wXqefy24?=
 =?us-ascii?Q?0M5pmrn4wKWDLNSlxjV3xF1STp/R2FMJSlQ59AJEDOt36clPOqGn1dmFA5y9?=
 =?us-ascii?Q?RzK4vd7XDsI/B0H11MQFV0MRoEj3fjGm8V17U3ebQoUTGkGInIQgoVg8O6mu?=
 =?us-ascii?Q?S0r93VYPQI92aU52KC/IinQ3Em/mSXlsl0i43oRXX8pN44KhLUiF69RciLNk?=
 =?us-ascii?Q?cZ4+Z62lttWjeEzvea90cHpIJMn9iXIQg62FQb721fGC9ZYh5mF5r76T0Wn8?=
 =?us-ascii?Q?rSvu1hoCR4THImzfeV/K4JBcwQtsQUN01nQEvtFgikc0c7lq+jghZtJFObYP?=
 =?us-ascii?Q?oUJzPFWvrtNi5yO+zuApIv/57EwKbEptJQKNaf8soUWMhXBYmmox2pcJvbbI?=
 =?us-ascii?Q?YkWu27NdpAYaZ3GV+VpMgJX+Hi2Pszg2GJz6qlX5XywLzzW4Gs49qx2NzyNk?=
 =?us-ascii?Q?bbXXaSPct0HKBN268M7/P4BDd9mHPQXJEW4GOvL/4Q54C3yWAKwR6EgPVOqG?=
 =?us-ascii?Q?qSv5AWyUr1+Gppp4IYz94BZ+1tTnjc4w1Fmq7To9?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24929877-2874-4a63-47aa-08ddefd41e86
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB8044.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 19:07:28.2333 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5AvN/G+DAu5gAV7R2PB8kHNPe5Fq3gj7U5l9I6J5rFazkzajwVAqtWxovBUQGvtkg8KoSHcQMnAZSxM8QrhUMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4242
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

On Mon, Aug 25, 2025 at 12:46:18PM +0200, Danilo Krummrich wrote:
> On 8/24/25 3:59 PM, Joel Fernandes wrote:
> > Add a minimal bitfield library for defining in Rust structures (called
> > bitstruct), similar in concept to bit fields in C structs. This will be used
> > for defining page table entries and other structures in nova-core.
> > 
> > Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> > ---
> >   drivers/gpu/nova-core/bitstruct.rs | 149 +++++++++++++++++++++++++++++
> >   drivers/gpu/nova-core/nova_core.rs |   1 +
> >   2 files changed, 150 insertions(+)
> >   create mode 100644 drivers/gpu/nova-core/bitstruct.rs
> 
> I think this is much simpler than the register!() macro that we decided to
> experiment with and work out within nova-core before making it available as
> generic infrastructure.
> 
> So, probably this should go under rust/kernel/ directly.

Ok, yes, for next revision I moved it into rust/kernel/bits/ and register
into rust/kernel/io/.

thanks,

 - Joel


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2EDB8BB2B
	for <lists+dri-devel@lfdr.de>; Sat, 20 Sep 2025 02:39:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF1DC10E029;
	Sat, 20 Sep 2025 00:39:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="PpnwS86w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011061.outbound.protection.outlook.com
 [40.93.194.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D5C410E029;
 Sat, 20 Sep 2025 00:39:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VyfHUmjgxJmU7L0zDD5kAS0BoyqqcrRSz9K+/2gwcSbZpofbP7A1dCWQ7zc0KQc4QUXpAPQxdc+MrxeyEVCL/38Eb1KW3VtF9tDZE68t/7ga41cosa5ue6qjU84yZyJ+c2TGzaEjM1nAOdU1+dH0UAkjJxt/sBm41hQYdF64Rzl/XLJQMsEppXI5Go05L6gjPZqErExMOltsMq8DaZR48CXcCdqmC0zGi6Cm2N2JpZndVQwInpYuabPXwgJo7STh8RaY4+NDZ8ogdYAsZ2HBQZylTg4rj048JxmtR3uLyvjs3/iamTPNsaDd69hO62TDJaDCvIFVTc7DQYjFnyf6HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xzzsOZ516hhsrRHzOlsgP3ZOSCUM3IXe3FiQcYh5QJo=;
 b=DQ8oDh7MdMBqic2BWDFXxa8dqNMlmK9uJvAVH6egNdr3A6u0QI0LyYQCsrv+7JDRsooufYuQqEswBYv5Z1HbVvgkvUQsmFHuQykmyfxN58CCVfUUFOyJDWE9qLzBmODhCTEGTYT9++w3qvbA6Cpx6ZtWwgTt0YmGEzCB9oL3fbax9lJbUIwvt+Jgl+TMDNYG1AQI8X+Y+KO6DPZ2ThCZZPuOWaQon+9SKhsye6h5P0A34woj+RlL+WTtoxqBXCZ1l3beNQMZcOPcv+T6PYo/CS0w5gpXRO6NwT9MRHjeeWL052BQA37OgT5hfzGXtd9RBPjicWnHJn82LvIZJz8vkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xzzsOZ516hhsrRHzOlsgP3ZOSCUM3IXe3FiQcYh5QJo=;
 b=PpnwS86wxsjec6IMZsKpwqI9xIc2DbRgKM42CpPO7z3QvMPO/kzMELpajcB4P2bMMdZnG3OnC/vugPXM8Yj1mCrl4NZSpTL2oWVMAxWVxfsy4cbx7O91rXmUeSr1tnhm2ug4j+XaISOVsw8hkvAOJnBqmrk8j5hENncDYBRKJOiWX7qsofak6fB5w6qXwRfpMh0eoiWkz9sT1E2JeG879lLoE0Ut+4MgQQVNeCjLHx/VlBAnk+11mrwnRsu5fY1uWPRHbPrXWEYYj8mVZr8Z+GXGqogBRDzphzHQlw/bC/o09OwOfDMClVdSCnwYQ/QI3R2QkWebNrjmdCPy2olatw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by SA3PR12MB8762.namprd12.prod.outlook.com (2603:10b6:806:31f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.17; Sat, 20 Sep
 2025 00:39:17 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.9137.012; Sat, 20 Sep 2025
 00:39:17 +0000
Date: Fri, 19 Sep 2025 20:39:16 -0400
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, acourbot@nvidia.com, Alistair Popple <apopple@nvidia.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 bjorn3_gh@protonmail.com, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 nouveau@lists.freedesktop.org
Subject: Re: [PATCH v3 5/5] rust: Add KUNIT tests for bitfield
Message-ID: <20250920003916.GA2009525@joelbox2>
References: <20250909212039.227221-1-joelagnelf@nvidia.com>
 <20250909212039.227221-6-joelagnelf@nvidia.com>
 <aMDq2ln1ivFol_Db@yury>
 <bbd6c5f8-8ad2-4dac-a3a4-b08de52f187b@nvidia.com>
 <aMIqGBoNaJ7rUrYQ@yury> <20250916095918.GA1647262@joelbox2>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916095918.GA1647262@joelbox2>
X-ClientProxiedBy: BN0PR04CA0118.namprd04.prod.outlook.com
 (2603:10b6:408:ec::33) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|SA3PR12MB8762:EE_
X-MS-Office365-Filtering-Correlation-Id: 4086d3f3-43b1-40e1-c6d7-08ddf7de2198
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Awd3SjVI231JDv0FrSfyyjbtTV/MyrLWns/gl41XzLf3XC+bmQ4RWC7xejFH?=
 =?us-ascii?Q?EPc0v0tbkx74VZnzFvra7/LfBHIfBlMnhbbBEyfWZ6/2x1r4Y9KZj7LOKWu8?=
 =?us-ascii?Q?fFYadqmLa02F+Y71z0rM9qDmsez5h25eQMpE3REez4EiOQgnFFMDLZELyOMC?=
 =?us-ascii?Q?luULOkSwsWAR9qL077AB1tyMa6VoV1gW9aEkuRaVWegFtc2pQA0LV3zkbhA7?=
 =?us-ascii?Q?R4BT1OeXNhUYFsze7pECROMhJsM4JKYUHqYfN6nyXoAVEcxlGKykp1ZNZVY9?=
 =?us-ascii?Q?VgaNhaL//iRz6XAx40s5V5BzG9jQhzTrZXSUpS/ao+nTHwN7LjsILYXua5vI?=
 =?us-ascii?Q?AOT3ttECRvP+KfhzPUI8xvVc0+yHNVZBqDA0kIBq2Bb3vzdw+/zCab79wfjP?=
 =?us-ascii?Q?SiF4xVo0mOOfCWaDNKJ6ng/0jxoYn31pmFIUZWhem4v1oxw1TwcCKlbW9l2O?=
 =?us-ascii?Q?igc0OMvEENcfveJFYxphC0tY5LOhpv5xMzAsiszTcowvv42eVsOTCzP9O9DS?=
 =?us-ascii?Q?rUiZLKKu4iKuGET66vdxMlOKM97olZWMRCdJ5MPWAhV364zLGf4PC8AdrH8m?=
 =?us-ascii?Q?bqS4igLIM7iw1etLvT8m798M5dOr82w4V2IoK6TNV2F+aQxNPbVNHcsgfVyl?=
 =?us-ascii?Q?DYqDeytirJrczDM/2Hd3g59d1UEI9Z/Q/Dt5yPM/uf2ORPMuvF1+kVsjBmFZ?=
 =?us-ascii?Q?3Eib4ORZluM/0SkVZxLlIkPgQr0yfap1d7Qedw8zVfEVoDkVTrusHUz0eXMs?=
 =?us-ascii?Q?Z9n8ylId+viyx3Mh4SsR1+Wu2/o9CyCURdj37n0tcv1tCItVipK1zUc3BxLR?=
 =?us-ascii?Q?MVq5Dn4AsqWiwFdtoATvO9F6qMaoJEylEgpUi/U7fxA3trOmyhTA1vdTJVDj?=
 =?us-ascii?Q?voNstfawgmmcr6fH0iWKfOEufYSMTxfTdzKjrEGq8huETtWvDpSfUKNwtEht?=
 =?us-ascii?Q?oP7cAczUurtzrbh4qX9bRaMUI/lIioPIsxERDixp+38vdgsgZDr9ffYGNJCK?=
 =?us-ascii?Q?c3JJz4I6JJF/jhrSHJDtPzoRZSR67NkWL6UQ98JDj6pXh5FvdPoJYsZKNUYu?=
 =?us-ascii?Q?NqEEdUx4wyBWWLn+6Gf+yvZi5knAr4kvhD88Yvu4PWF7eVASUbvaMWgqd2bN?=
 =?us-ascii?Q?UvA+cRvjmQjIP68aAtmo5C1W8bf7TsyKOfUd65toT/nTiOIEtRKKVoMHFQL0?=
 =?us-ascii?Q?02o1nzm7wNZf1JfHuoe+AHyVL6wozWmVVf7C00e/xSHlETHgheRIbcBrixyZ?=
 =?us-ascii?Q?93MJkAgDC8L0tpwt8XJcSI7uc1KvijbgCAiLlCGCMSb/tqF3wyJtaasUQ/ju?=
 =?us-ascii?Q?CBB5RYPK/kHQdi/IbKPNhNAdhARETymF+xSSmFGFhqxJsW3wUxKHQ/n9iKJw?=
 =?us-ascii?Q?pN+ipGgjm4nQ3BJ3eMIf0YEERG7slGYg/f8YCv3dGGhq/qcchg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1EOLW7zr2V1GrdDnhClwS8uU4vJKXJK5nhdFxHP8qFmAXxtkhpZxxNp+wCZN?=
 =?us-ascii?Q?SeJmsqcMhJ6rFCQWTd3rr95PAlCWxAvTWOjbf1dWPICUvLNT7wHlloP2pnV7?=
 =?us-ascii?Q?XdPAPhc0TiLlc4YHhbqPXbDdalX9KSnhvY79wH6eA/YHoUfYmPJl4jox5dci?=
 =?us-ascii?Q?xw64TEugtWYMC/egdvQP8sNHP39LKo64LRQ61qSyZiNc9SfkHQ5uVj1fgOM7?=
 =?us-ascii?Q?IdzEhZCRmxjyhBQdF8TXpCDewZwGpObhFHtnvtS2ueDxf33Cx45rCyCYFtD8?=
 =?us-ascii?Q?XWZwG9tP7WuCh9kZV+eA++RShztaufJEMsPCS9WBjkDBce8zIBrXwQRaTRh6?=
 =?us-ascii?Q?0nNc4jOjPDIAUbXy2Hr/6uZAj1EEPbT3qcSn6FFCTrgauhCUbb0iQLPtldQ+?=
 =?us-ascii?Q?dzI1DCRAwFOzh/DemHy8R20P2pDPPbOwzSBdDkVA1OJArPIrCQGJutnS4rUa?=
 =?us-ascii?Q?/Prfnnz+D+1jIQ1n9e4MYpOuVoW3tmz1cyvmTthaLEEoF+a9POysC7WDBKbl?=
 =?us-ascii?Q?dbPX4k7uwfAUB+GpOAon4getRHmpPGDUKmaLp6mPpoNZ1Tix3WcX0MQt8EH+?=
 =?us-ascii?Q?5z+dpuIIO5fnnAHwRkYBvLMdpKkgwXUVRNOaPh8n1lPmw+/HusCG2jPWZ7zZ?=
 =?us-ascii?Q?obNozeisO0W1dsH0OtHV2kwXnOPwG+eJkfkwUR3h7XB+kDXoEXuk3KjFjUmd?=
 =?us-ascii?Q?s8CmJd8pehgL41RgcJGwOqAHd+5uS6yMCxpAqIQV1dI0vAAThAoMtHxsqQoq?=
 =?us-ascii?Q?ypbtoRXVhFHon+3RRbtlZVM/BTyTuTFWa1LRYBUWsVUJUQ9nvWcvWNXItC/f?=
 =?us-ascii?Q?RVNT77cNDbLBcuCJ21gpk9REaAwEKvCddx+v78Iu/aslrRZ0EmLrRs6L2qoW?=
 =?us-ascii?Q?fhKkncGj1+QXpo2DtoiuRm+ll0UUP9by/vQb+Se0/ns6l1LF1j8FHLPyDbDV?=
 =?us-ascii?Q?uCK2lPlH8MBaE683ZBZs8X6mL4QISUpcwliJGBySKW+tMNT6McZI0CSZVdfX?=
 =?us-ascii?Q?VkbCVsvz1BH3Bqopng51IsR+dppP7iGxPwx9NahXVQIf7OALl4QJ6UQnxSzC?=
 =?us-ascii?Q?beaQsGMf5RN5BM0My8Y4l0HvH1W/B71yELX2EV6bwbBNF373KhTBebkolklX?=
 =?us-ascii?Q?5k+nKcxMywQCe+d2X/SpScj3B+6jKG2OtxwvvWX+GrtkETmQJNcZuUoV8W6p?=
 =?us-ascii?Q?qn5xHzwuWZd/vKfJh1vAfwoBeqTbeENoV4ANNR+dq+tNATPZeraM2IhsbN/g?=
 =?us-ascii?Q?kIXyEdLl9MXbpPl9pMgsv+DrlMvU1KdfR68mx3SpAUURVRXStdg7K/5Rgyrb?=
 =?us-ascii?Q?E+yQTcd7+Qcal+ryWJMvbIp3yTWPGQ5JGTUn8pky6BcyGZbEDJU8L3w7vw/5?=
 =?us-ascii?Q?4gwcd2O6S2aJQPd/Hp7IbRRJnIO3wkiWVaota2Vpd7fzZG94cCXYl4aoBH/w?=
 =?us-ascii?Q?HsgUx+VKo0YKMjIf/6pMqFM7DXUInCXGCzS9oruBorwlQHWo61JJq4TrgzOs?=
 =?us-ascii?Q?nSLLuMNeQDapdZXeVOaHfPvqWHv2BNLkuTrR1ZTMqm/q3KH1huMr91frdO67?=
 =?us-ascii?Q?4/NXI775eBeLroPcsqwicQ8FHJfK5S6N9x9w0uG1?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4086d3f3-43b1-40e1-c6d7-08ddf7de2198
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2025 00:39:17.6312 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QgeUP7TXoDpXQJMOuSprVACoCySrhU87xHPBepyMd5D4Xp1oyf60Qevwr2FDpqn8CwvJlBpqa0vlpsdOBK6CbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8762
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

On Tue, Sep 16, 2025 at 05:59:18AM -0400, Joel Fernandes wrote:
[...]
> > > In C also this is valid. If you passed a higher value than what the
> > > bitfield can hold, the compiler will still just use the bits that it
> > > needs and ignore the rest.
> > 
> > In C we've got FIELD_{PREP,GET,MODIFY}, implementing the checks.
> > So those who want to stay on safe side have a choice.
> 
> Ah ok. We can add these checks then for the accessors, I will do so in v4.

The C checks use BUILD_BUG_ON, in rust-for-linux we have build_assert but it
is fragile and depends on the value being a constant. Since the setter API
accepts a run-time value and not a constant, we cannot use this.

Or, we can fail at runtime, but that requires changing the set_* to try_set_*
and returning a Result instead of Self. Alternatively, we can have a debug
option that panics if the setter API is misued.

Thoughts?

Or for the moment, we can keep it simple and filter out / ignore extra bits
of the larger value passed (which is what nova-core's register macro bitfield
implementation currently does anyway).

thanks,

 - Joel


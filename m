Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKtbAqGRj2lwRgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 22:03:29 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 650701398A8
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 22:03:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FB4510E318;
	Fri, 13 Feb 2026 21:03:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TZPpRfGf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C313610E2C2;
 Fri, 13 Feb 2026 21:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771016604; x=1802552604;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=s07HKpOwKISaN/OyyYSRccXI8JoYOs7D67K2ngqfBuk=;
 b=TZPpRfGfsjGiI8nMKGfNqbubhItxHxwZQuO8+uxtbGYPRu0bXuIbtukK
 pNpXVr8Bp3aRJXkWbCoecGMTd3wl3Qu4tATogFLbZeWZydSuGuup6nemY
 xp1URJUQliZU0re2+Hci5C9Phz2JakT1PQ29dK2KXTrhUJjy0hby4Ucmx
 VX2shlIyKzShshGDMCu2wUuKDcdsWByE8sEbw5kq/Z9RDg6GdHoPBDQq3
 S4LAMR94xXwP9+aQlLx5ubnhOq/3Dw3LhTCvaSvp+pvvgWiJWy9ii/3oi
 mq8MCkwPxz/9EyHlF3BR7oD4VVZB+403efhBXBI794w31/sUMje+W3HxA Q==;
X-CSE-ConnectionGUID: U2D09lpwRE2gDYSNYc/Plg==
X-CSE-MsgGUID: 8W1hApc1RRe6WBLsE5oeLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="82837669"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; d="scan'208";a="82837669"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 13:03:23 -0800
X-CSE-ConnectionGUID: EJV0ycBlQFCcQsuW+okNLw==
X-CSE-MsgGUID: hYkdwXfmQYyHaMYKvScKTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; d="scan'208";a="217523422"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 13:03:22 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 13 Feb 2026 13:03:22 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 13 Feb 2026 13:03:22 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.69)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 13 Feb 2026 13:03:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k5tZJMGwiyGHNAO/YIm8LdL5Oi/t8PE1IJ4dvWABwqLvhVK7AVUI6Xl4U2YufwYm7OxampzsVWFRXIUhfWENH0QfAo13JVw9+tBzfLCzS8ErpiEEKsmGuG7xQvUV1HyC+C5FPfSz7+6t5TYUG41l8zQcTpsZkShg1qDrXNDrBUU7VRrXFcTests8GQ6agIjxojDXv+uqsQba9bXP9bOAVgTSwfLV7GB6h3f1RWQf0Ayek3K76TbubTHtDGNYvaTpE+3WTs6ZPJU6p4auLc20gePOx6XQ1itZqJalOIECiVX2h7IsaVQdfTqIzmHsl5ft9wQT2Lr7uvUh9pyOYnyBKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ttXdGRjMCdOM0gx1IsTF78MC8nCmnMZOF+uhw7zXmQ=;
 b=qTBEXZw/xRFRHlgyFr0j8u8VJvfwX4osJ3O7zfhsJWNqjh/L7AqBfvlQ1aTseWkVrtwdQ5xWt8glx7VmYlLc9q9tvCKtL6rvNj6FK9hEZBwCOjtIIFNfxTlcfSB83Yf3CiAOXg+o4e8VxFcS3ZyuuIeEoZIe5ppEXLimFUA2v2vVo/X5BVujIsFAgi2L17Q9BkV2lNvBDbX/AlFC3MS+MNON3Rf+aQVN272l8eVsDicSFoM135j9k72PHfTNjCYK8PsJ2EIwGPg2kKQeX4LjLVzwlaQ//I5XmQljqAOEQZJTKAQ0v23rLBgbmPRuAIEqesqDFe4DPadv2d2u9lMc8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by CO1PR11MB5170.namprd11.prod.outlook.com (2603:10b6:303:91::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.14; Fri, 13 Feb
 2026 21:03:20 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.20.9611.012; Fri, 13 Feb 2026
 21:03:20 +0000
Date: Fri, 13 Feb 2026 13:03:15 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <alex.zuo@intel.com>, <joonas.lahtinen@linux.intel.com>,
 <jianxun.zhang@intel.com>, <shuicheng.lin@intel.com>,
 <dri-devel@lists.freedesktop.org>, <Michal.Wajdeczko@intel.com>,
 <michal.mrozek@intel.com>, <raag.jadav@intel.com>, <ivan.briano@intel.com>,
 <matthew.auld@intel.com>, <dafna.hirschfeld@intel.com>
Subject: Re: [PATCH v33 2/5] drm/xe/xe_pagefault: Track address precision per
 pagefault
Message-ID: <aY+Rk0CKsKcg9RZv@lstrano-desk.jf.intel.com>
References: <20260206164731.8395-7-jonathan.cavitt@intel.com>
 <20260206164731.8395-9-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260206164731.8395-9-jonathan.cavitt@intel.com>
X-ClientProxiedBy: SJ0PR03CA0257.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::22) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|CO1PR11MB5170:EE_
X-MS-Office365-Filtering-Correlation-Id: 2236ff55-0036-4e51-dafa-08de6b4350c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QLf+BVIk8mHwrVQ8r6C9uX/pG9rTvo459nso6Jyrt+x+B7hrbWkO3yalMGf8?=
 =?us-ascii?Q?vp/k2eb/m00sRZOF9jvGb0ptvgykXdYbSHBK/Fw4bN/b0XcTqCm3iTueN0F/?=
 =?us-ascii?Q?bAyZnEkI5QuI0NBPKxNJ6kvMbkcIh7Qbb2wt9d2pYEGYUTyO84jX2BBG5Hku?=
 =?us-ascii?Q?RX+U1LbebzitdiGjj2mpOldGxST0QXVvhjqEz7SzjFQ2eC/dwXgZbhSmT3sA?=
 =?us-ascii?Q?wcozm7ugVyJpEkuGV5uBu9YMrQ7NHhBAyoX3Wb4+asfSLvJxPRBidz5+p9AG?=
 =?us-ascii?Q?Tr71uoXwLn6ryrt1xwhznYyj/g4MtgdnQhSMuBfSc+72lhMoPLxSDg9N8QaO?=
 =?us-ascii?Q?JwmUqy/8kJOqnuY6YA2dES94Ay1vAHVyKp/byJ3jYHj+4/c5fJgywkPa3cP9?=
 =?us-ascii?Q?bDuvpTJNyPtrZlnmFeWd5UVGbam1KjM/APul9c17QMFxER+d4XgMS7PZFjW4?=
 =?us-ascii?Q?PtWga+kwvUJKnMYxO/AACoWsmx4w6OK21hwW19VSEh5HMwP4SOvXH7FFlJIL?=
 =?us-ascii?Q?4tURfAQSfRRNWCEd0uxtBvElv9/LHT+PXKgZoyiXjMWYpCx0H2NKyh4XjwjB?=
 =?us-ascii?Q?NmZGFYGInt1SXqGaO5EMQr1WKsm/ri2Q7jfMN2Ju/VUylBw88u2pI+9XhQLS?=
 =?us-ascii?Q?lvAw134a44ENJ1UBE2wOQWHlMSisOBxr+YsDqzRdVHPNkDVhYT5uvsvNOXXO?=
 =?us-ascii?Q?6C983eEp3Krf5RaiJ9fRoiguknvJguKjf62a9Rni9IfRlchVTdlRwkkvyEW0?=
 =?us-ascii?Q?8Y/VJ02tEIcgghPaGsEi/I7x1IRvAzUvW943wiNi7JkJTWMxlkozxsWp/MlS?=
 =?us-ascii?Q?1wC1bsXN1BGJKG01sVnZARp/dchzjgOSZmq5cHpT24wtEbQUw+kEL/d2TOVu?=
 =?us-ascii?Q?/l+WWviUD5rnwL1ygjunKAKCwGwfzIjG51Xa5yWSY861OKPLVnOjxOARB5Im?=
 =?us-ascii?Q?RVMRlk9qg+LJsCGNc5ff7KaZf956VjQdlsEyXwLWkb0tM2Jq7qqILiygxPgk?=
 =?us-ascii?Q?fe66Zt8aPbc7VyiRCEliL8DnHoMU6HxwFnQ6gFXIuEZ2hlP7E5ToA3wz81nk?=
 =?us-ascii?Q?qgT/cFPJ+vZElPzrPmp+uuTw4j+5Op/+W+B03xJPsWjFZpXqvYs2qiJaYODX?=
 =?us-ascii?Q?uHKyAH4oh9iqvu2K9hJZwIavuMAFDcyU6YqWFpdxS0Fok9ltTLH9/cJ/2Zk6?=
 =?us-ascii?Q?wqB/5iz46HWqJP6yEF9LXBxyAk96POntLABg7z2dW1xFN6zq/hvCqZC+l3W6?=
 =?us-ascii?Q?DNERlbLJ5ZI/bhQbFIQziXCWITWz4v4WXUoJYwxX3OE6F/IyGCJch7hdIiJX?=
 =?us-ascii?Q?EgP7Fe+Dpp1cPw/x5pQgLrOGWkw+ItIByrBNe9AEhf5FTBcIJxg3rc9NxQEp?=
 =?us-ascii?Q?qGkwb02Y+STGdTFEQmPNvnDQgxjfQww1D+SG+pghtpvHKDfrU725NsMkOovl?=
 =?us-ascii?Q?cMUQLqWHWMTihvymVSGpZBvJ0QOUz0jHrHXVSc0ZdNorPa6o5hoVLxnnpUBF?=
 =?us-ascii?Q?yacC1xmMRKiX69Er7f7z6IcYww3i/E2ovRhd?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2IdFicHsA4t7XznutRXI9wHb/zRFhUmV9CTcO8C94LhHBIBdw23MAqcgD/6n?=
 =?us-ascii?Q?zoK8hwlkTYdROQELues2CYuSQC1GtDOzxh3JUOEHSixT718o169MrGBfXmaG?=
 =?us-ascii?Q?rUmR41qS4GtQPjatfkZ57+xQodk/ufTXtK4mh8Nm8vpkNarVGKczwrfpy+Sw?=
 =?us-ascii?Q?lJpSZNiXYhTIjyclm2JGcHEigAsi2drNHwp4uaIYT8FT9jbqzAlvh1QX8NOh?=
 =?us-ascii?Q?NwqNph7p7TDALyD23TSvqo+kvzruJlglXs0+DPn/yMR1wt7jiTv4UkT5OLMK?=
 =?us-ascii?Q?HpsNggWH8hpfDGb4RbJw4AMAzvKGxbXcxjA4e85VlOSMIFzVIW55hQ3OApEd?=
 =?us-ascii?Q?vW4Y1iiec8hUlChSToBQJeKkBrQgwyh7stiwDRtjJPsbumFw2XzEbK9VqE3W?=
 =?us-ascii?Q?XdeS7iTHdbCn+ODFnigNTGFPUSfQsPPO880PULIbrlQOESwlBtr4XQKHaDvu?=
 =?us-ascii?Q?aUKP1OBK2CwkqnuLXMQHmK4/qiRFyJvp0J7n411+/uBTur4H+02xVI95xeS+?=
 =?us-ascii?Q?Q2A/ebRlXx04sxenyFS/yiMjuPfAwB0fxiZy9EB4gFzXKSGrjj/npKMAtsU3?=
 =?us-ascii?Q?SGfqNWSgkmgDTqshjZgai8JkZ8Aipmt2wrWtlk4h1jIS7usbwk1l3wtB/aUZ?=
 =?us-ascii?Q?6s1rXXDwognE9N3aFeiKoX9wPLrWaI5Of9K7GBaVxiHgp97t0PWFne/YAyWJ?=
 =?us-ascii?Q?FcH/XxESD1uln/7M52V2FkDEUaG49fsz5kN3/brGPAI5jxD5PB35tuosNGZ0?=
 =?us-ascii?Q?MBY2D0qc69OTVDPz7r0vqJ2oeL7SAMfAWQNdtNcRepPLNkNVhDOOBCg9k62l?=
 =?us-ascii?Q?c85pdy5X5mbL6QUhagHm1+izBVLpsqHqYWyyUQ6khXlh3IQa6UZxpqG8PF34?=
 =?us-ascii?Q?Zo8WkBvfJe8/xWr7VW0AMjP+noMg+qxfWFfCJi78j+Zly0/n6CCpPWRhd+6y?=
 =?us-ascii?Q?WXQdnzZo5cQ73NgOQVtV8/YFAL2jB/TKbVKtdPQ+JArmWhDnHoj5kEnJ1kTt?=
 =?us-ascii?Q?I0FL8oYMU3IOwh2OwmkmEmIYDkWfdITFioGMqTnH6/amyyhjhLp6e+eqiCde?=
 =?us-ascii?Q?zW6fwuhzTMINCS/Q2yi609Mi5Y8ZWJiSq6XZmaQoIFh9+5JMMrN87sEba3xF?=
 =?us-ascii?Q?Bn+mliRCSBJhbxOeo6JlqlE8TXkNbMp+A67eHjFnSQ2kxhKMsePEmZ2Cg2K8?=
 =?us-ascii?Q?snNc4wA5zL96rbbiHPwrfqpgaCcMsJHj71cKuW0NBghXqXzSOhACchsrLQNU?=
 =?us-ascii?Q?3eMgqsYgr+5tCueQ5nwXzPuEFaLIUJPdks7fsVFcg52SNM9tWn12VMm8ssXG?=
 =?us-ascii?Q?oY0Zl5tcbgONVzkfq0TQlcoxBPIqon/jk5GNuTOoZdjKNoEhEIH7tkmv/vJc?=
 =?us-ascii?Q?FHonsnEF8sYh3UwSx/wLVlu6BFjOCyXeoAVvvFqK0X8bkBmyL4hyHoZ16Nab?=
 =?us-ascii?Q?lXFJkwc1kG6JyVneNg8pjluj8YYdabG/bKFOQ5evN0ITwSJJbGUFRpfwHA8Z?=
 =?us-ascii?Q?xS7Rk/HpKLl72WzwBbzP3rBqX5Y/+425KxPwR8qYuN7Oo+ZEH0Gc58Qyg/Be?=
 =?us-ascii?Q?ax4ocmhPGFTCfX9qT8F/g5tu/2FfRdhlLXVONnk+Zs5f24ajjbz4Dv2IJORE?=
 =?us-ascii?Q?MLkEoNAu5L77vKltAbeE6d7rRMFib+e7+aiNZQe7n/eA0rDCQ6o6mpq7tq/Q?=
 =?us-ascii?Q?BMvOIM18utJg0pb6svD6u2cw0Xe17dPx4f20euoJu7gYkFBwCCQJ5zF8JQLp?=
 =?us-ascii?Q?tbKiqk6nSQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2236ff55-0036-4e51-dafa-08de6b4350c1
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 21:03:19.8482 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f+6UBcLwt1K+vdXCZkLI/yM6ZEkVpnX2bGcgDKllbNQqGciihW6+p0sPdCX8t/os+YRcFn3Ca6WmLWE4YZP3Xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5170
X-OriginatorOrg: intel.com
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
X-Spamd-Result: default: False [-0.31 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,patchwork.freedesktop.org:url];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[dri-devel];
	FROM_NEQ_ENVFROM(0.00)[matthew.brost@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: 650701398A8
X-Rspamd-Action: no action

On Fri, Feb 06, 2026 at 04:47:34PM +0000, Jonathan Cavitt wrote:
> Add an address precision field to the pagefault consumer.  This captures
> the fact that pagefaults are reported on a SZ_4K granularity by GuC,
> meaning the reported pagefault address is only the address of the page
> where the faulting access occurred rather than the exact address of the
> fault.  This field is necessary in case more reporters are added where
> the granularity can be different.
> 
> v2:
> - Keep u8 values together (Matt Brost)
> 
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

See [1]. I'm going to ask that a u64 remain completely reserved in
xe_pagefault, as I plan to use this in the fault-storm mitigation
algorithm, which requires enough space for a pointer in xe_pagefault
(u64-sized).

Matt 

[1] https://patchwork.freedesktop.org/patch/704578/?series=161560&rev=1

> ---
>  drivers/gpu/drm/xe/xe_guc_pagefault.c   | 1 +
>  drivers/gpu/drm/xe/xe_pagefault.c       | 2 ++
>  drivers/gpu/drm/xe/xe_pagefault_types.h | 8 +++++++-
>  3 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_pagefault.c b/drivers/gpu/drm/xe/xe_guc_pagefault.c
> index 719a18187a31..79b790fedda8 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pagefault.c
> @@ -74,6 +74,7 @@ int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  				      << PFD_VIRTUAL_ADDR_HI_SHIFT) |
>  		(FIELD_GET(PFD_VIRTUAL_ADDR_LO, msg[2]) <<
>  		 PFD_VIRTUAL_ADDR_LO_SHIFT);
> +	pf.consumer.addr_precision = 12;
>  	pf.consumer.asid = FIELD_GET(PFD_ASID, msg[1]);
>  	pf.consumer.access_type = FIELD_GET(PFD_ACCESS_TYPE, msg[2]);
>  	pf.consumer.fault_type = FIELD_GET(PFD_FAULT_TYPE, msg[2]);
> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> index 922a4f3344b1..a24de27eb303 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> @@ -231,6 +231,7 @@ static void xe_pagefault_print(struct xe_pagefault *pf)
>  {
>  	xe_gt_info(pf->gt, "\n\tASID: %d\n"
>  		   "\tFaulted Address: 0x%08x%08x\n"
> +		   "\tAddress Precision: %lu\n"
>  		   "\tFaultType: %d\n"
>  		   "\tAccessType: %d\n"
>  		   "\tFaultLevel: %d\n"
> @@ -239,6 +240,7 @@ static void xe_pagefault_print(struct xe_pagefault *pf)
>  		   pf->consumer.asid,
>  		   upper_32_bits(pf->consumer.page_addr),
>  		   lower_32_bits(pf->consumer.page_addr),
> +		   BIT(pf->consumer.addr_precision),
>  		   pf->consumer.fault_type,
>  		   pf->consumer.access_type,
>  		   pf->consumer.fault_level,
> diff --git a/drivers/gpu/drm/xe/xe_pagefault_types.h b/drivers/gpu/drm/xe/xe_pagefault_types.h
> index d3b516407d60..333db12713ef 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault_types.h
> +++ b/drivers/gpu/drm/xe/xe_pagefault_types.h
> @@ -67,6 +67,12 @@ struct xe_pagefault {
>  		u64 page_addr;
>  		/** @consumer.asid: address space ID */
>  		u32 asid;
> +		/**
> +		 * @consumer.addr_precision: precision of the page fault address.
> +		 * u8 rather than u32 to keep compact - actual precision is
> +		 * BIT(consumer.addr_precision).  Currently only 12
> +		 */
> +		u8 addr_precision;
>  		/**
>  		 * @consumer.access_type: access type, u8 rather than enum to
>  		 * keep size compact
> @@ -85,7 +91,7 @@ struct xe_pagefault {
>  		/** @consumer.engine_instance: engine instance */
>  		u8 engine_instance;
>  		/** consumer.reserved: reserved bits for future expansion */
> -		u8 reserved[7];
> +		u8 reserved[6];
>  	} consumer;
>  	/**
>  	 * @producer: State for the producer (i.e., HW/FW interface). Populated
> -- 
> 2.43.0
> 

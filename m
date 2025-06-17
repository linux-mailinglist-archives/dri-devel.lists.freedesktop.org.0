Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6007FADDD51
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 22:43:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEB8710E11B;
	Tue, 17 Jun 2025 20:43:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m5NpYT2Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F3D610E11B;
 Tue, 17 Jun 2025 20:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750192992; x=1781728992;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=rJnc2x62CPNjW+FdaMkVldvcVdNv14DoHHzUS51WJho=;
 b=m5NpYT2Qmnh5PFtCKsh6ZgcZJyNmyIjtwB3/T9LbI7L95ZbZswCFoNzX
 MsWueZJITJR7mSqpsyWrOv0F+cA+YQOxY3PCq5580oyUXa6nxhexm8T/1
 z3h2OrnEFwoYZh0r5HwMAzgRIJLegQNYnhl1Vo52JQ1CiridkRd79XidX
 MeRO6pg6tV8ydBty3ADTByujTCa01v1SfZuHVA1nRPxxwnuPSUTjsfEgW
 2QA1lPiSxbftWkT3N4wH3mRjRSX4BgDr+eenMhSvSpSMd62lvAeGHgf8G
 CI0Dgk1KjUr/UHTDG3wHV1M2BNyxAMHURgOXop7v1gFooaqx6KAN5HkxI g==;
X-CSE-ConnectionGUID: 1Repq1puQcq0T/VX9i90AA==
X-CSE-MsgGUID: H7W5LOmRRo67OcpItkwoDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="56207298"
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; d="scan'208";a="56207298"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 13:43:11 -0700
X-CSE-ConnectionGUID: OA/4SN0PR3qEbRnxuQD9ew==
X-CSE-MsgGUID: dP5qVZ1zRvaPrF9zfGGQcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; d="scan'208";a="149466758"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 13:43:11 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 13:43:10 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 17 Jun 2025 13:43:10 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.48)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 13:43:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KrEiLybQ2kUWntdpB6pWJ+BaUk8vWAmnLJcwKK+esH5N2BVYHPDAsgUjbkzDL+LFLlw4vRxMgEa2z9dOtYJFS/T+qq5VjPiq/sgjRQWvMtPl+TOW/orpvTiAKwtNikVYUmZLvGVk6HM+yypjj6lUW837HeQ2hAswjZwdjzW5phBXNrkURgnpGo1tGEArhtaYNfXvCIzoEb+Gm6maMKKhnaFLAtNt5ioP5F+8qr/Jtrsw5ybBqajFy246HW/sFjERplRkOuUxeI/KCsdTXWRmuwAcKzkTGbaSFBeY4YaH+626M4GJ3X9zMnhrvGum3FZE9oOIkzJrkyr9as2+bdpVug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fAakgrCo98mhtVt/JPxlAANq4eKT3J5cLT7t/2eJpIs=;
 b=fLFPWzb5sILbVktjOn8UPGjk9Lgl+RiYTsWSncT96jFy+8la2n6sMMn5VmkdFwBu4thwoy64RoIBC1MdqjUn9qWDcd5LZ7xJvGzbL9eKcK1s717SkCBvlqc8k1UAFa7a5AFT9JkplIfLFjn+VnCyvn8DPXHSzQL+dCzCjTIqV3L/eeFDDTmae2zc/5UVKuAV9U6ucR8gktqcQwJkhTmj8IxuWcfIilhHSqEAn0oReCkeZOlCEjVygTMcLZA9iM8YUqaIqim/CBwTJuWBRlWpL4KTEgNBCqnsfnyDKXJ2TPDDpB7vxtV2hX6pkCYCU86P8q+x11PONjqy8TD69/vFDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SA1PR11MB8840.namprd11.prod.outlook.com (2603:10b6:806:469::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Tue, 17 Jun
 2025 20:42:52 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%7]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 20:42:52 +0000
Date: Tue, 17 Jun 2025 13:44:28 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <apopple@nvidia.com>, <airlied@gmail.com>, Simona Vetter
 <simona.vetter@ffwll.ch>, Felix =?iso-8859-1?Q?K=FChling?=
 <felix.kuehling@amd.com>, Philip Yang <philip.yang@amd.com>, Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, <dakr@kernel.org>,
 "Mrozek, Michal" <michal.mrozek@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH v3 1/3] drm/gpusvm, drm/pagemap: Move migration
 functionality to drm_pagemap
Message-ID: <aFHTrLtKkkhInHKQ@lstrano-desk.jf.intel.com>
References: <20250613140219.87479-1-thomas.hellstrom@linux.intel.com>
 <20250613140219.87479-2-thomas.hellstrom@linux.intel.com>
 <93e663cf-01e7-4241-89ea-3bdda3d19437@intel.com>
 <f08ed0c71c8f193bbf09888e14d0171802415dcf.camel@linux.intel.com>
 <e4d37eb0-ec91-47c5-b888-0b5bbb74db84@intel.com>
 <5da4b6f81517a6c091411a92e1c9d3fd5b902dba.camel@linux.intel.com>
 <aFGgD3BpT4yLwhGg@lstrano-desk.jf.intel.com>
 <e1abbee8dc401e7790049d151e6a2ef3c7b045d9.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e1abbee8dc401e7790049d151e6a2ef3c7b045d9.camel@linux.intel.com>
X-ClientProxiedBy: MW4PR03CA0211.namprd03.prod.outlook.com
 (2603:10b6:303:b9::6) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SA1PR11MB8840:EE_
X-MS-Office365-Filtering-Correlation-Id: 69da5092-237d-4c49-dc44-08ddaddf8770
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?G7Sz65TuIrtruE1gBMqUzp3aNjjJlo42YRZJuE4tVuVrbjnl+yteWUqJkK?=
 =?iso-8859-1?Q?jFBuL9wm5ZLUl6c3va43oKbsoAVhZWW5JLBN/uI23aGq4Ncyb0XTmgqKv7?=
 =?iso-8859-1?Q?cVr/wEs0kUvg3deo/AYmV3+xbe8HmHRQFsogCgoBdLzI/w5FHk56zN57UC?=
 =?iso-8859-1?Q?e8xYyy13cRJxKbtfr9tm5swYaghHVYbbRIRGra20elkYGQ+/BqtX3eWhk1?=
 =?iso-8859-1?Q?jKqqRgcAf0lEV709Lgqlq4V2vm+wm7M85V/uhj3WoKa0JZb6zbnwEVrwwv?=
 =?iso-8859-1?Q?qilBVbhSh2iIpKUaGsy0dC105RQzgvTf/x/XACWWGG8lyb/NrXA8C84hhY?=
 =?iso-8859-1?Q?gPJ/rG4AWmn/flH8BRQpGtBuAlj4PPZM3Kaw7q2jOZLY97WgAm3rLY+h30?=
 =?iso-8859-1?Q?8BgycREGxePv0pwo8DDr8dUc7k/NV3H657RvvqktTAy3XAzH0uBg26fj/D?=
 =?iso-8859-1?Q?MMBKAI8BtL938bEgjmpfzxxJ8viCdPJQXfES9dLqfYKcabrcP5eidJ7TgA?=
 =?iso-8859-1?Q?F8AU5mJlJIrt9w71mgLlgXocL1zlCovp69euUvcqxHl8RHvCAlnDSKBK23?=
 =?iso-8859-1?Q?VYKVmkHgcGiAm8eC4puAn6PcyLP1rN1rXp1+CymAaH7ln4mNVRRSkt9bin?=
 =?iso-8859-1?Q?L00iBtSVYIUTZn2Pq4jxQzIEHp/lvA/2XKkTBoh9lM1vhQqJYl1P/jjfIM?=
 =?iso-8859-1?Q?XaYFK3NTjDmG8ujL9RHxG5wTL2w16tiFXPgGfcDF9Xx6WGbecZZY+VOdeH?=
 =?iso-8859-1?Q?1E1//BsYNCbLfRrLPIoL9trpUf2CuFLukGOMakez/VwmFXDY/sPzlZefHK?=
 =?iso-8859-1?Q?n4aEz6Ef55DXNF1Nmmq+RrdCCKwQoL4DZT16OqnPtb51hLIR4FR7ct+Y6a?=
 =?iso-8859-1?Q?+gWQGtXQNJpWd2H+EBCk2Il+IX5auuXqKMk5o9coxTdHz/cb54sEFM7fvv?=
 =?iso-8859-1?Q?ra2zTY0dc2SsgIiGEvn9Rrr2aYEPdq5iK8tTSKMhEJO9xq+9UxDyZLyBD0?=
 =?iso-8859-1?Q?4lN/oTxJmWrcajprYzMVqW8T2GIvdATKlKHjuMl3AtPYGR5fziDIBTxNg9?=
 =?iso-8859-1?Q?2UqJ7z2tLwWk+YbZMVgOEB5pg/W1Rd15wdz9ZHw84X/9l0HgdbeOLaqSKi?=
 =?iso-8859-1?Q?fnGAzqGeiFzH8+swAwBSmhWoXkdJyOAI9xu0F45hyAUePIjtIARyG3/wE/?=
 =?iso-8859-1?Q?/gGgUS4xYTj5sxvkXguKEZHtP4al0BrgATCz8FJBnUo0W3z5fawG3a/tmK?=
 =?iso-8859-1?Q?3VAqs0kTs7cCS+3IeEMSuEMa4wy8RRuzPtxY1tfWimPFBwhK7FBCCDLjrf?=
 =?iso-8859-1?Q?fK8SB2K+GuIvEdjDkyCPRdm06ao6yyrvqr+972L+Sx+zE8P6akqu5UB0Pa?=
 =?iso-8859-1?Q?+HkzSZ/KWu2iPr1kCk6eDshluMsb9790nWJToAuGNEi2X7qRysxQclGrhC?=
 =?iso-8859-1?Q?BkY8XXbls/49tdecanMlKpDLDnpvgPzofc9w6aUGhBDAq6+CFQlemkxxXZ?=
 =?iso-8859-1?Q?w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ql446sFpy0BOhjSKyBkCJ9BhSMhzZT40VZWQgedWLh+IPvo+4HpyVWekOX?=
 =?iso-8859-1?Q?Z3ezoRke5b2sdcPtFDjZqvE24o0dg59fqY5KzLiprKeJFsaiXaUJWT1n6q?=
 =?iso-8859-1?Q?ojz0ypPRcXYUPTNhHj+RoV89kLuoAB29dRg05+StOfmRjTNoo5cyzVRbck?=
 =?iso-8859-1?Q?qpil/akDc4x7S6GXjZv78ru0mNLMVQvWs+Baz3NWaa3t9LvFr4R3H+oHjj?=
 =?iso-8859-1?Q?4Z6rVmzgealrs2UwDU35+twPqOsO5bPfXbWtxCr63vu4lkNv73zE/YZEns?=
 =?iso-8859-1?Q?tjVVUR/hm/tWN75ubPizcKXzI60fdCICjkthNtZ2v72bl9oWBHhjgjamkc?=
 =?iso-8859-1?Q?tWNvmfRtor8lNyr4GBmS+bp5uDLAtJyNCk9SSzdv3fjQ/1Bn+nOHfUdaD5?=
 =?iso-8859-1?Q?v0aab0AbSLioD/Q/+sPea1fKnqB7cHSMZLgQAm3HcCub535LpYDYqrT8tC?=
 =?iso-8859-1?Q?0zA0JMtjLLzwbOWgvaW+4l8lE2FLHMKlCi9KOcJ27FKddm9hP1oTbGsBaG?=
 =?iso-8859-1?Q?s+vS0EknvEaIignbD4BUlFa1WsKtOOTaldDVsT1gChFsqDPtqqjJo+C2VI?=
 =?iso-8859-1?Q?QSCRbM68riqp08ieKlBrwPcRmGxItuK3uQGU5M3tEiZs/PzXsBbn4rl+g7?=
 =?iso-8859-1?Q?NJGK63lAisOMtQAbimucIjEgNA86f2vngGECTZYaJ/ulBW/+H63PW1xGte?=
 =?iso-8859-1?Q?ldefAJ+FEO29/Ovuss4xeNN6ADsbgT0FtjRKK10YFWEqVQNDwSJqBj9L27?=
 =?iso-8859-1?Q?7EE3Qw2RrXfE7XoIqwBriqgEoh2C5rXHLJBWUwdPkg0l1OwnVEQA5HKu/f?=
 =?iso-8859-1?Q?ASedsTlklvexyWG4LcjOI4zVTPQuam3k0uLvhOXFQRKzt53+bNwiH5bYuK?=
 =?iso-8859-1?Q?Vm1/Pq8t6ei7lwPj9aiTrrgEktNd2Ku6pZHPiQ8S9kraqWjFV8Hct2edKE?=
 =?iso-8859-1?Q?53wLLX4WUq+5SStWv3MNjekLy8CmMg4Y/SMfOMGKlo+Sr7BLjS26KIRT9D?=
 =?iso-8859-1?Q?m0oXXTP/rmCBFmvglg+ZjuyyURnw8dVZ2GN3xDx9/W1omWsRR5rPIcEAvZ?=
 =?iso-8859-1?Q?jH0zSrmDgYy63Lra4w0mvSykfE0s+EcNrlabWu9MN7xvYcmIXxbQkowroV?=
 =?iso-8859-1?Q?Jr97OJGsIu9t3LBLheDBvxFpP5Nmo4OHiwBG9UEfm7CpUUKPMtuCrcjPzv?=
 =?iso-8859-1?Q?9AoFmNvaBTLyDTlI3S4VxI8Y6pKFtRmCytqJPg++hlXW9dbrEvI45ni+hO?=
 =?iso-8859-1?Q?1YT58MHEjuT3g/WCn0hJQyP+zXzR/eS8rCz57zeAJRrG9f7mCqZfFanPlB?=
 =?iso-8859-1?Q?2OyrMJadnEFjrA3Q4q+oiQZOB4Nen88zdMm1eZiqTFjf2DmgEO9FTduoe/?=
 =?iso-8859-1?Q?E02FBoIyr5SVCeti5tq7IH8mu2X8XeNXdsaUPiiqo6tGkanX9EPQHqndo1?=
 =?iso-8859-1?Q?DbkBDSSsjimW3LcEr16OHyA2rAgfbTMcZbHB/GH2IuGtfxaKu/59Oh+tFA?=
 =?iso-8859-1?Q?hOQaAQtL/VVxHiWWyhNCHEleMd6tTej5jNHT/qLg768zEa1yhiEob7KZIz?=
 =?iso-8859-1?Q?oMwOOglMPMqWYdP8VBPie+ms+IReXYQbJmFvcx2+SIaafsshl8hKWS2PYw?=
 =?iso-8859-1?Q?umunHPSnYHbXSWcrg9ecvn06j3bbp6GvFvRcSebXizuNmmKW/en1kJ2Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 69da5092-237d-4c49-dc44-08ddaddf8770
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 20:42:52.0785 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Dp6kaICYs1wEiiyh8ajTkvW0DzmwRuX0bzw1YeNlFO1Ik0Jq86QaZUpt/0k8bRaecdW9ZD1tYgHVjJ2h5ZX+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8840
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

On Tue, Jun 17, 2025 at 09:37:28PM +0200, Thomas Hellström wrote:
> On Tue, 2025-06-17 at 10:04 -0700, Matthew Brost wrote:
> > On Tue, Jun 17, 2025 at 04:55:26PM +0200, Thomas Hellström wrote:
> > > On Tue, 2025-06-17 at 20:17 +0530, Ghimiray, Himal Prasad wrote:
> > > > 
> > > > 
> > > > On 17-06-2025 18:41, Thomas Hellström wrote:
> > > > > On Tue, 2025-06-17 at 18:25 +0530, Ghimiray, Himal Prasad
> > > > > wrote:
> > > > > > 
> > > > > > 
> > > > > > On 13-06-2025 19:32, Thomas Hellström wrote:
> > > > > > > From: Matthew Brost <matthew.brost@intel.com>
> > > > > > > 
> > > > > > > The migration functionality and track-keeping of per-
> > > > > > > pagemap
> > > > > > > VRAM
> > > > > > > mapped to the CPU mm is not per GPU_vm, but rather per
> > > > > > > pagemap.
> > > > > > > This is also reflected by the functions not needing the
> > > > > > > drm_gpusvm
> > > > > > > structures. So move to drm_pagemap.
> > > > > > > 
> > > > > > > With this, drm_gpusvm shouldn't really access the page
> > > > > > > zone-
> > > > > > > device-
> > > > > > > data
> > > > > > > since its meaning is internal to drm_pagemap. Currently
> > > > > > > it's
> > > > > > > used
> > > > > > > to
> > > > > > > reject mapping ranges backed by multiple drm_pagemap
> > > > > > > allocations.
> > > > > > > For now, make the zone-device-data a void pointer.
> > > > > > > 
> > > > > > > Alter the interface of drm_gpusvm_migrate_to_devmem() to
> > > > > > > ensure
> > > > > > > we
> > > > > > > don't
> > > > > > > pass a gpusvm pointer.
> > > > > > > 
> > > > > > > Rename CONFIG_DRM_XE_DEVMEM_MIRROR to
> > > > > > > CONFIG_DRM_XE_PAGEMAP.
> > > > > > > 
> > > > > > > Matt is listed as author of this commit since he wrote most
> > > > > > > of
> > > > > > > the
> > > > > > > code,
> > > > > > > and it makes sense to retain his git authorship.
> > > > > > > Thomas mostly moved the code around.
> > > > > > 
> > > > > > > 
> > > > > > > v3:
> > > > > > > - Kerneldoc fixes (CI)
> > > > > > > - Don't update documentation about how the drm_pagemap
> > > > > > >     migration should be interpreted until upcoming
> > > > > > >     patches where the functionality is implemented.
> > > > > > >     (Matt Brost)
> > > > > > > 
> > > > > > > Co-developed-by: Thomas Hellström
> > > > > > > <thomas.hellstrom@linux.intel.com>
> > > > > > > Signed-off-by: Thomas Hellström
> > > > > > > <thomas.hellstrom@linux.intel.com>
> > > > > > > ---
> > > > > > >    Documentation/gpu/rfc/gpusvm.rst     |  12 +-
> > > > > > >    drivers/gpu/drm/Makefile             |   6 +-
> > > > > > >    drivers/gpu/drm/drm_gpusvm.c         | 759 +------------
> > > > > > > ----
> > > > > > > -----
> > > > > > > ----
> > > > > > >    drivers/gpu/drm/drm_pagemap.c        | 788
> > > > > > > +++++++++++++++++++++++++++
> > > > > > >    drivers/gpu/drm/xe/Kconfig           |  10 +-
> > > > > > >    drivers/gpu/drm/xe/xe_bo_types.h     |   2 +-
> > > > > > >    drivers/gpu/drm/xe/xe_device_types.h |   2 +-
> > > > > > >    drivers/gpu/drm/xe/xe_svm.c          |  47 +-
> > > > > > >    include/drm/drm_gpusvm.h             |  96 ----
> > > > > > >    include/drm/drm_pagemap.h            | 101 ++++
> > > > > > >    10 files changed, 950 insertions(+), 873 deletions(-)
> > > > > > >    create mode 100644 drivers/gpu/drm/drm_pagemap.c
> > > > > > > 
> > > > > > > diff --git a/Documentation/gpu/rfc/gpusvm.rst
> > > > > > > b/Documentation/gpu/rfc/gpusvm.rst
> > > > > > > index bcf66a8137a6..469db1372f16 100644
> > > > > > > --- a/Documentation/gpu/rfc/gpusvm.rst
> > > > > > > +++ b/Documentation/gpu/rfc/gpusvm.rst
> > > > > > > @@ -73,15 +73,21 @@ Overview of baseline design
> > > > > > >    .. kernel-doc:: drivers/gpu/drm/drm_gpusvm.c
> > > > > > >       :doc: Locking
> > > > > > >    
> > > > > > > -.. kernel-doc:: drivers/gpu/drm/drm_gpusvm.c
> > > > > > > -   :doc: Migration
> > > > > > > -
> > > > > > >    .. kernel-doc:: drivers/gpu/drm/drm_gpusvm.c
> > > > > > >       :doc: Partial Unmapping of Ranges
> > > > > > >    
> > > > > > >    .. kernel-doc:: drivers/gpu/drm/drm_gpusvm.c
> > > > > > >       :doc: Examples
> > > > > > >    
> > > > > > > +Overview of drm_pagemap design
> > > > > > > +==============================
> > > > > > > +
> > > > > > > +.. kernel-doc:: drivers/gpu/drm/drm_pagemap.c
> > > > > > > +   :doc: Overview
> > > > > > > +
> > > > > > > +.. kernel-doc:: drivers/gpu/drm/drm_pagemap.c
> > > > > > > +   :doc: Migration
> > > > > > > +
> > > > > > >    Possible future design features
> > > > > > >    ===============================
> > > > > > >    
> > > > > > > diff --git a/drivers/gpu/drm/Makefile
> > > > > > > b/drivers/gpu/drm/Makefile
> > > > > > > index 5050ac32bba2..4dafbdc8f86a 100644
> > > > > > > --- a/drivers/gpu/drm/Makefile
> > > > > > > +++ b/drivers/gpu/drm/Makefile
> > > > > > > @@ -104,7 +104,11 @@ obj-
> > > > > > > $(CONFIG_DRM_PANEL_BACKLIGHT_QUIRKS)
> > > > > > > +=
> > > > > > > drm_panel_backlight_quirks.o
> > > > > > >    #
> > > > > > >    obj-$(CONFIG_DRM_EXEC) += drm_exec.o
> > > > > > >    obj-$(CONFIG_DRM_GPUVM) += drm_gpuvm.o
> > > > > > > -obj-$(CONFIG_DRM_GPUSVM) += drm_gpusvm.o
> > > > > > > +
> > > > > > > +drm_gpusvm_helper-y := \
> > > > > > > +	drm_gpusvm.o\
> > > > > > > +	drm_pagemap.o
> > > > > > > +obj-$(CONFIG_DRM_GPUSVM) += drm_gpusvm_helper.o
> > > > > > >    
> > > > > > >    obj-$(CONFIG_DRM_BUDDY) += drm_buddy.o
> > > > > > >    
> > > > > > > diff --git a/drivers/gpu/drm/drm_gpusvm.c
> > > > > > > b/drivers/gpu/drm/drm_gpusvm.c
> > > > > > > index 7ff81aa0a1ca..ef81381609de 100644
> > > > > > > --- a/drivers/gpu/drm/drm_gpusvm.c
> > > > > > > +++ b/drivers/gpu/drm/drm_gpusvm.c
> > > > > > > @@ -8,10 +8,9 @@
> > > > > > >    
> > > > > > >    #include <linux/dma-mapping.h>
> > > > > > >    #include <linux/hmm.h>
> > > > > > > +#include <linux/hugetlb_inline.h>
> > > > > > >    #include <linux/memremap.h>
> > > > > > > -#include <linux/migrate.h>
> > > > > > >    #include <linux/mm_types.h>
> > > > > > > -#include <linux/pagemap.h>
> > > > > > >    #include <linux/slab.h>
> > > > > > >    
> > > > > > >    #include <drm/drm_device.h>
> > > > > > > @@ -107,21 +106,6 @@
> > > > > > >     * to add annotations to GPU SVM.
> > > > > > >     */
> > > > > > >    
> > > > > > > -/**
> > > > > > > - * DOC: Migration
> > > > > > > - *
> > > > > > > - * The migration support is quite simple, allowing
> > > > > > > migration
> > > > > > > between RAM and
> > > > > > > - * device memory at the range granularity. For example,
> > > > > > > GPU
> > > > > > > SVM
> > > > > > > currently does
> > > > > > > - * not support mixing RAM and device memory pages within a
> > > > > > > range.
> > > > > > > This means
> > > > > > > - * that upon GPU fault, the entire range can be migrated
> > > > > > > to
> > > > > > > device
> > > > > > > memory, and
> > > > > > > - * upon CPU fault, the entire range is migrated to RAM.
> > > > > > > Mixed
> > > > > > > RAM
> > > > > > > and device
> > > > > > > - * memory storage within a range could be added in the
> > > > > > > future
> > > > > > > if
> > > > > > > required.
> > > > > > > - *
> > > > > > > - * The reasoning for only supporting range granularity is
> > > > > > > as
> > > > > > > follows: it
> > > > > > > - * simplifies the implementation, and range sizes are
> > > > > > > driver-
> > > > > > > defined and should
> > > > > > > - * be relatively small.
> > > > > > > - */
> > > > > > > -
> > > > > > >    /**
> > > > > > >     * DOC: Partial Unmapping of Ranges
> > > > > > >     *
> > > > > > > @@ -193,10 +177,9 @@
> > > > > > >     *		if (driver_migration_policy(range)) {
> > > > > > >     *			mmap_read_lock(mm);
> > > > > > >     *			devmem = driver_alloc_devmem();
> > > > > > > - *			err =
> > > > > > > drm_gpusvm_migrate_to_devmem(gpusvm,
> > > > > > > range,
> > > > > > > - *							
> > > > > > > devmem_allocation,
> > > > > > > - *							  
> > > > > > > &ctx);
> > > > > > > - *			mmap_read_unlock(mm);
> > > > > > > + *			err =
> > > > > > > drm_pagemap_migrate_to_devmem(devmem, gpusvm->mm,
> > > > > > > gpuva_start,
> > > > > > > + *
> > > > > > > gpuva_end, driver_pgmap_owner());
> > > > > > 
> > > > > > 
> > > > > > 
> > > > > > fix doc passing timeslice as parameter.
> > > > > 
> > > > > Will fix.
> > > > > 
> > > > > > 
> > > > > 
> > > > > 8<-------------------------------------------------------------
> > > > > ----
> > > > > ----
> > > > > > > +/**
> > > > > > > + * drm_pagemap_migrate_to_devmem() - Migrate a struct
> > > > > > > mm_struct
> > > > > > > range to device memory
> > > > > > > + * @devmem_allocation: The device memory allocation to
> > > > > > > migrate
> > > > > > > to.
> > > > > > > + * The caller should hold a reference to the device memory
> > > > > > > allocation,
> > > > > > > + * and the reference is consumed by this function unless
> > > > > > > it
> > > > > > > returns with
> > > > > > > + * an error.
> > > > > > > + * @mm: Pointer to the struct mm_struct.
> > > > > > > + * @start: Start of the virtual address range to migrate.
> > > > > > > + * @end: End of the virtual address range to migrate.
> > > > > > > + * @timeslice_ms: The time requested for the migrated
> > > > > > > pages to
> > > > > > > + * be present in the cpu memory map before migrated back.
> > 
> > As Himal suggests and see below...
> > 
> > s/cpu/gpu
> > 
> > > > > > 
> > > > > > Shouldn't this be present in gpu or cpu memory map ? We are
> > > > > > using
> > > > > > this
> > > > > > to ensure pagefault can be handled effectively by ensuring
> > > > > > pages
> > > > > > remain
> > > > > > in vram here for prescribed time too.
> > > > > 
> > > > > So with this split, drm_pagemap is responsible for migrating
> > > > > memory
> > > > > and
> > > > > updating the CPU memory map only, whereas drm_gpusvm is
> > > > > responsible
> > > > > for
> > > > > setting up the GPU memory maps. So if it remains in the CPU
> > > > > memory
> > > > > map,
> > > > > then nothing will force the gpu vms to invalidate, unless the
> > > > > gpu
> > > > > driver decides to invalidate itself.
> > > > 
> > > > Thats true.
> > > > 
> > > > > 
> > > > > But looking at this i should probably rephrase "before migrated
> > > > > back"
> > > > > to "before being allowed to be migrated back".
> > > > 
> > > > The confusion for me is that timeslice_ms does not represent the
> > > > time
> > > > pages are required to stay in the CPU memory map, but rather the
> > > > time
> > > > they must remain in the GPU memory map. We defer migrate_to_smem
> > > > until 
> > > > this timeslice has expired.
> > 
> > Ideally, we'd want the timeslice to ensure CPU residency as well. The
> > issue arises because the timeslice is attached to the physical memory
> > (drm_gpusvm_devmem), which is not readily available on the GPU fault
> > handling side. UMD testing showed that ensuring CPU residency is not
> > required for atomics to work, so this part of the implementation was
> > left out. We can revisit and find a solution here if it turns out to
> > be
> > required.
> > 
> > For now, I'd fix the kernel doc above (s/cpu/gpu) with my suggestion
> > and
> > perhaps put in a comment why we don't wait on the GPU fault side.
> 
> > 
> > Matt
> 
> Hi, Matt, Please see my second response to Himal.
> 
> It might be that there is a confusion between "pages present in the cpu
> memory map" and "memory present in system memory"?
> 
> What I mean with "present in the cpu memory map" is that the pagemap
> pages (device private memory) is present in the struct mm_struct for at
> least xx ms. The struct mm is the authoritative information of which
> pages currently hold the data.
> 
> So "migrated pages are present in the cpu memory map" is therefore more
> or less equivalent to "data is present in device private memory".
> 

Ah, ok.

> So maybe I should rephrase this as
> "The time requested for the pagemap pages to be present in @mm"? And

Yea, that seems better.

Matt

> add a discussion like in Himal's reply on the typical use-case?
> 
> the pagemap itself has no control of how and if the gpu vms choose to
> expose this. It can only guarantee that the authoritative location of
> data is the device private memory for timeslice_ms.
> 
> /Thomas
> 
> 
> 
> > 
> > > 
> > > Yeah, although drm_pagemap is not aware of any gpu memory map so it
> > > would be incorrect to bring that up in the api docs. Could add some
> > > discussion, though, that "this could be used to..." and give the
> > > typical gpu use-case?
> > > 
> > > Thanks,
> > > Thomas
> > > 
> 

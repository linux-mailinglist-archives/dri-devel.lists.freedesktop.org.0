Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 102A9C4A310
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 02:06:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6051010E4C9;
	Tue, 11 Nov 2025 01:06:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KfK7NnSs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03D0510E4C5;
 Tue, 11 Nov 2025 01:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762823170; x=1794359170;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=M35gC0SHbrH5NhXVXusTPFpYZ6rr50JibKq2X+j8mP0=;
 b=KfK7NnSslZMCPMfCVEhq53hMA7qlJexNTEXyOb/9zCrUFZEmZXYOAjVE
 GvoKYSHMblXUmmJSDtOmcKdFLnnQl6izGEbUVnYu2VSHv3PYPrD0hgftS
 hzR/tLYVbG7JzbmE18JnmyLG9Y70hJTKr2jxiTB3Up/HUxU688dlcgKpv
 SrOdthV+jagfSwnt5kLJ5w8vBE1izZvdrddLp2FfMV2nPWcj1d3yH6pww
 vaBTbtFAGfgtrxV02lgA/gZu0eNC4t2HF7hqNdjmAv9W4U/qnFYfKNSUX
 XK59KqOtuuTIIIxoH3hoigPKfG4WgaUIeK31dq/KRC90PHkP2Cu636H0U A==;
X-CSE-ConnectionGUID: 3n4IGK0WSMq82CqxMuBLtQ==
X-CSE-MsgGUID: LGW9ozVrSui8RCwtu0h3nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="82277609"
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="82277609"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 17:06:09 -0800
X-CSE-ConnectionGUID: H6iCK6+5T5GsS8HWIBa08A==
X-CSE-MsgGUID: ECalRnzuRIqMHVZkKYBAiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="188460341"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 17:06:08 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 17:06:08 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 10 Nov 2025 17:06:08 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.38)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 17:06:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yB/fXXR+xiPU5Cehew4k75AD8r+WLNHdkX+hF2FEvbLz6n0x33LsZU3BFc7QrJltI13snYZB7VG7tms2mNnMJu2wiHsXwY04B7wDQ+OiG02Hw5TcFC7oM74gUsyFIm6bDRDIQ3sYjXzQvi80VN9qm5KZKSNWiajHGM9iSHPsXu1WlquIOz2Vap+7lJ+WBr1eb6V3nLD6IYEo31PyDMiGnaAsihh2VVAUfeTL15xZCYtIQL9ohnb64Rh+7Mb3pRQKnlS31NvqstQN2IP/yJIvhSreEUIE9sbzjvNXCq0JsjX5PD+ZgM30e64YUtBykFPTjocqm8csqpzpaHkqyg4CnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7cqPcZFkpmzgiJqTQI7sCsymyJA5XVtFHCSFOpHrvmY=;
 b=KFEHgqgUFsNrRt/do/FDuG8uOg6YFUoRAcqA3/Ujoqj1+LAm+vDwQckhq3uYE0GWWvnKHDR4zcVejDg8W8ttyF5GMi1rIjh5vKvXY8KcY6BqS+cWjKUWdrV+3xbKEmZj+jgOgdMYyXuyikML6M1PhTupo+s7yzelwrTrPYKg98PeVBr0S1HAB1/1/IwhsQMZQUGB0YnYIj4pcgOxjIS8CJQJcl5X0/0g+fgi+fEb6lgOJujS4eVWwEj1wsB6CMVjeGBg1AaVcxcXiBKLjgf1LRA1R/9TTWIygniVjipUtRduhEutf3GrQkGYUlvFw0utCtpZ9dH+v/OPGV2lP/71ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 MN0PR11MB6279.namprd11.prod.outlook.com (2603:10b6:208:3c1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 01:06:05 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 01:06:05 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Alex Williamson <alex@shazbot.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum <skolothumtho@nvidia.com>,
 <intel-xe@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kvm@vger.kernel.org>, Matthew Brost <matthew.brost@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, Christoph Hellwig <hch@infradead.org>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Subject: [PATCH v5 14/28] drm/xe/pf: Don't save GuC VF migration data on pause
Date: Tue, 11 Nov 2025 02:04:25 +0100
Message-ID: <20251111010439.347045-15-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251111010439.347045-1-michal.winiarski@intel.com>
References: <20251111010439.347045-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0027.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::18) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|MN0PR11MB6279:EE_
X-MS-Office365-Filtering-Correlation-Id: 253d6166-021f-46bc-1e49-08de20be7d43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bVA0YUpzVmNTS09sRS8xdWVTYW5DT2NjK1RJK1JDaXRpbGRTVjRGa0Q0NURt?=
 =?utf-8?B?bFlsZ1dPWHM4N25jblVVeU01MENnQm5sVVgxYWMyMldTeXNva1NueGpYK3BD?=
 =?utf-8?B?bDdUK1lEVVYxVWJiRFZiRXEvQktub0liWldpTG83YXljZ2xxZm1BS3o2c3VT?=
 =?utf-8?B?Z3dVUk1hL05WWkh0RFJOYnVUWjV0eGE5VTBmemlYRVd6NkJqblo0WTd4SE9K?=
 =?utf-8?B?S0I2NGk3TDNQR0ZhZlFoSitzb0Q1NE8rTFdVV1FCNnNkRFptYkJnbzlYR213?=
 =?utf-8?B?TzJGTitoUnhMUCtha1NoTTJ4S2hoMUJ0NTduTFhqYWpyRVl0dXpPa21Gd3Br?=
 =?utf-8?B?Q2dlYUZsT0NKbDc0UGpqRm1XYU1yZDMxQi82ZzV3N3hIMXd3YlRXbWVRS3px?=
 =?utf-8?B?SHdJRm9QdXZQMW1NM2F5QTZDZ1lZSjBrMW5odEJ5UWFSRDZETkdFTU9KZG5o?=
 =?utf-8?B?WmloaFh2ZHlONDN4NkRGcFczQzRCS0ZpS2dISDA1dk5MUEJXa0tsOUVnWFVN?=
 =?utf-8?B?OTNhc056SUxCYWRRdXZlQVI1T3QyYk95N3o4a3pVZ2M3SVBJN1hoclNtcURE?=
 =?utf-8?B?dE1wbWhPbW40bGtaOHFaNkFIaGg4Q1dpU2ltT0F3ZGd0d3pFc0d5cXVuQjZQ?=
 =?utf-8?B?THJXdCt1RzdtdG5xRjc1dnArVFlJK3Y5aVk4bm9BcHdnNHM3MGJzRVZYV0dK?=
 =?utf-8?B?N3hlTlBOTXBuQjYxTVgwZWVocEpxbDUxcnVCbEd6QUFuZVV0ZTVzMkNKdkRi?=
 =?utf-8?B?L1RMZVpJNS9Na0FjeDlRbEhTUmJtblNYSmpDVGhuaVA0L254R05Oa0J6Qzlk?=
 =?utf-8?B?T28zV3RFUVVsN280dXpvOUVXaU5oR0svQ2JJUWJEaVBScHgzaFg4UVlwcG0v?=
 =?utf-8?B?QmFGL1FwVnFOVy8zdGVUQ2tQbWJsU0x2eXI0bWpXdzNuMnZxMWxpd09VeUZk?=
 =?utf-8?B?b2NRaHhpalpxNHZaTExURlR6V01hQzBkT0YvM2lGQkVqQ0dFeStUOTBsTkY3?=
 =?utf-8?B?cVhqZThzU1NxSVNiZERqZXdQYm9qeW40WXV3T3h6RUU5SlZVcDliV3QyalpX?=
 =?utf-8?B?US9STGIzYWlXUjRqWkRURGZ6UVJNbVl6NkkyR1NycURxV05QdlQ3VEZBUmx1?=
 =?utf-8?B?MWVWM3dUeVp0YnFMNDZMeEFsMjFzQ0VzN0pHNEJhQTc4SElidkczR2dDdFNw?=
 =?utf-8?B?eFJZdm96dDhmdlp4VzVQZ2xzVlhhdDlOVFZoQVZMZitGLy9SWDBTV0cycFd0?=
 =?utf-8?B?S0RoRDUvaTJ6NTFlMHBRVkFFVEU4SmJTUitTRUs2SURzck82MXhVcVRreU5R?=
 =?utf-8?B?V1pOK0FncGNSMzBMS0diRStOSDFkV0xWTHBLdFlVUU04a1ZyUHVKSnJCazFl?=
 =?utf-8?B?SHVXcGsraXdxSHJ5YXJGaVNzYzJqTlFoNVZqbkd2TC8zbWcwWTZBMitEbzBx?=
 =?utf-8?B?QnZqYXU3Rjg2S21hcVA2TTlTNDZpWVZzZFV4UitrcjFLSTlRN3pwOENZSkxa?=
 =?utf-8?B?Qnh1bXJMS213c1ROSEM3Vkp3aEsxSVhPT25mRTg4cSsrQ24ra3BjdTJhUU56?=
 =?utf-8?B?MStmSlRKRU1oeDY2QXNDQmZTK2g2ek5qekhkTzgvWWtKWTlxS25yLzN4bnVn?=
 =?utf-8?B?dGdyNXZiT1RVWllMUlhiVUQwdVJBM2JuZ3dKRFFxZHgwYTVITmgzUVpCYmhI?=
 =?utf-8?B?RWk4VXNvaDNteTVJU2JLRS9oenFoNmlHUE40ZThkaXJXNndiSnlRTGZaeFZO?=
 =?utf-8?B?TGdiWWo1dmJxRWZtRWtDSjJtcjAxNGk0bWhGZDdEUC9kdVExaysvek9ZVWNz?=
 =?utf-8?B?ZzNENjhOSkVVUmJnOUtyYUptUjZQMXhQd01Qc3p1TG9SNG83emRMWTQ3VXpo?=
 =?utf-8?B?UWRPVmdHS1BVVFdBbmNpKyt5blRueVVQcTJ2K2RZNHE3Y0dlNUJNZXdPbUFU?=
 =?utf-8?B?alFtV1JudmdqM3h2VEU0aVd6OVNydjFZY2tMMWtOS1pvdG5LRm9rc2d0V0kx?=
 =?utf-8?Q?wE/AxtgxtU0HUbWxl2cqsfonIfqk30=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?LzdNb2RaTEpUb1FVY2FWS0pyV243T3k0dllPWXFMSHM0SlR6bGpCWitWd0cw?=
 =?utf-8?B?VVhYU09vYVlKS1ZlcWhoRVN3N3RlYlZwN1ozWDRmcHp0T3h4b2JMUmlXTGlO?=
 =?utf-8?B?M0daK01xUDBVVWtZdTMrS2t2Mll1RXNrOVkvWXhoSmRmckRIdUVpMVNQaDFZ?=
 =?utf-8?B?amJZWDEyU0l1Vkt0WFdxdTZCcjhTV25PYm9mUERGZzdzRzJhbGJIcXFJS3V0?=
 =?utf-8?B?cVFqNVJHVmo0d1QwYzlrY00rVmtuaTM2d1VKRFdmTjRBWWYrTG5MSUJZU1Zq?=
 =?utf-8?B?TW52Q29UTU16R0J5bVMrMnpJb1kydml0b0J0Ky9TRzUrQ05NK2JrWjBZY0tX?=
 =?utf-8?B?YW9OSmlHa0g0TkNkYmVwUDNXcko0ZVFzU2V4ZHh1M2pKenRGNmJsaW1kR3Jq?=
 =?utf-8?B?eGY3NCtES1RBTFZKTEZsUjByY3JSbXI0UUtaK1hWNVY5YUF6cGJSTlBMWDRz?=
 =?utf-8?B?VytzZ0FsM2ZVbDdwZXJSZ1NjQjRYbVlYYUU0S0prNGtOaEUrUHhheU1KKytx?=
 =?utf-8?B?aHpDenlGWXRIUVUxRFNDVStma1lCMkF1alJJME43NXR2b1FTQXJ5ZTE2ZzhJ?=
 =?utf-8?B?M3RxazZmVkdDanpVdzNHL3ZhOVI4NXJDZ2dyWDNXKzZBem9mVG5sSGdoN09l?=
 =?utf-8?B?cVN5TU9STmhlbTBkdTVHdFNkVHhwVi9YWDdsS0Jvb0hwanBycVNKb2JLOGVr?=
 =?utf-8?B?Y2pDckQxRUpxeHJlSjRKbnRtVkFFTEx3NlhhSjZQSkJJbFdJR01JS0Y2UGcv?=
 =?utf-8?B?c0RMNmV1T1hCanM5bE82UVQxTCtHNGU3WlREQTBRRDNzWkdCVEdXQjhXV2Ew?=
 =?utf-8?B?VGZIclAySFE0RXNzTW9GSldwZEF5U2FIRGM3bnVHLzNWQ1FyMGF1UWVjQnBh?=
 =?utf-8?B?S2JPSGcvSGp5dFNQbi9TZ2xkcVd6dTJ4c3hOemdPT2xSazk0cUxBNHQ4ekZ1?=
 =?utf-8?B?aU9TU0JpdXp0UUJ3RXhtMzVRWVVMT0srTGdzcVVtb2w4UjY4K04wL3pPTVE3?=
 =?utf-8?B?UGFOZU9XVkwvSEpCcUJlcW1BZ253NHBkd2ZlYVprUy9NcjI4MWJxSGpOVTEw?=
 =?utf-8?B?djRVcjNNWWlWOUl4TzBoR21ZYWUybW1pQ2hyUlNaYTlNaG94QnVUNWRIazBW?=
 =?utf-8?B?YnNDMXJkcXpOS25rQXdJVWtzMC9SZFdOZXhnb0oyMHd3YzVxdjJNeFdadmxq?=
 =?utf-8?B?K1Y5NmM3MkFzV3RLTE5PZ3BqVDFwTWovTXNhRXNuOFMxcGxPMlNuZEZ3MWZF?=
 =?utf-8?B?Z2xUaE04Y21VVElwaXh3Q0VUNzFraU02bmQrTW92TW43L3UrWXpJL0hKaEc2?=
 =?utf-8?B?WTRyOU1NL1FjY0VtaDJzcVRBeFc5dXo2K0lRVE1PZkJzb1VuVFVXTXlqWHdo?=
 =?utf-8?B?TG04SXd3djcwcnRFRG9RWnhHd1BEV0tVZHVLK0lnS3QzemhtcU9LbitKcUg2?=
 =?utf-8?B?WUZYZzRlNUVJTklCV1FicWJwb29DS1lEazNRVE9qNURtNy9MY2RtNHp4anF5?=
 =?utf-8?B?UTRubm12VHpaN0NJQVlvSithU2JmQlo5d0RJUTRxSGRBd2hsUStEdVJUZnds?=
 =?utf-8?B?ejBjYVE1RkpIcTdxRW0zWDlCM1EwTitFa1NwaHd6bmxtREMxaGNHRm5iT2gx?=
 =?utf-8?B?YXROZ2piTEdrWDJ2bmFuMkdLQUNzNjBFbnNBS2xSYlhBbjJvakhqUVNEcHBV?=
 =?utf-8?B?YndCMXNqQm1aaEQ4L2tJcWtJMVlyZnJEb2dlTmxrcnZSak5hcnlscktXTGFY?=
 =?utf-8?B?ZVlrZ2JLeVVKN0h6ZkVnRDJRb0JtYmZLeWxWVWgvdHRzMUtzVWVzUHh6bzhW?=
 =?utf-8?B?cHhXSHpiK3ZwQkZvanEvZGxRcXJqZTBjS1hSTGxiNloxQjBleEc2N3lmbFdq?=
 =?utf-8?B?LzlIWkRwQmcvcy8wN2VtNmdtUllic2ZURWZ1eDhoWU1KWW41K3RQZmJ4TVVR?=
 =?utf-8?B?RkFLTUhMbU9sc2MxeWdrbmc2SWh4TTNzd2RpakptU2s4K1h2aTU5RFVRZm85?=
 =?utf-8?B?RFdGeU1VeFBWWGNjZ3kwM05IRjErKy95SnNESVVZc3FOVFJPNFIxYitTcW9W?=
 =?utf-8?B?UlJYcHdJYXk3VlhJWkhSaTFaU3RNdS9hMndrNTczcnBJTWhMY2l5Uzg2QnJr?=
 =?utf-8?B?b3pSaE9BdmpnaHdLZFNhK3NWd0NCZlpnME51TjM0OWkzOC94ODZ1YjU4MWtp?=
 =?utf-8?B?VHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 253d6166-021f-46bc-1e49-08de20be7d43
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 01:06:05.1806 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SPQjocKYHr1CQRyTzejoOQT9F4C4gqzpynz5K4cbIK/9+x483zuYRP6A8iUTC/VaZOnjPKt8Dbugv5DLvkT01E3WZFM5VO6FwHr0T5j2Jds=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6279
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

In upcoming changes, the GuC VF migration data will be handled as part
of separate SAVE/RESTORE states in VF control state machine.
Remove it from PAUSE state.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   | 39 +------------------
 .../gpu/drm/xe/xe_gt_sriov_pf_control_types.h |  2 -
 2 files changed, 2 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
index 171b2ba0a97dc..bb1ff5ff436c1 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
@@ -184,7 +184,6 @@ static const char *control_bit_to_string(enum xe_gt_sriov_control_bits bit)
 	CASE2STR(PAUSE_SEND_PAUSE);
 	CASE2STR(PAUSE_WAIT_GUC);
 	CASE2STR(PAUSE_GUC_DONE);
-	CASE2STR(PAUSE_SAVE_GUC);
 	CASE2STR(PAUSE_FAILED);
 	CASE2STR(PAUSED);
 	CASE2STR(SAVE_WIP);
@@ -454,8 +453,7 @@ static void pf_enter_vf_ready(struct xe_gt *gt, unsigned int vfid)
  *	:       PAUSE_GUC_DONE                          o-----restart
  *	:        |                                      :
  *	:        |   o---<--busy                        :
- *	:        v  /         /                         :
- *	:       PAUSE_SAVE_GUC                          :
+ *	:       /                                       :
  *	:      /                                        :
  *	:     /                                         :
  *	:....o..............o...............o...........:
@@ -475,7 +473,6 @@ static void pf_exit_vf_pause_wip(struct xe_gt *gt, unsigned int vfid)
 		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_SEND_PAUSE);
 		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_WAIT_GUC);
 		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_GUC_DONE);
-		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_SAVE_GUC);
 	}
 }
 
@@ -506,41 +503,12 @@ static void pf_enter_vf_pause_rejected(struct xe_gt *gt, unsigned int vfid)
 	pf_enter_vf_pause_failed(gt, vfid);
 }
 
-static void pf_enter_vf_pause_save_guc(struct xe_gt *gt, unsigned int vfid)
-{
-	if (!pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_SAVE_GUC))
-		pf_enter_vf_state_machine_bug(gt, vfid);
-}
-
-static bool pf_exit_vf_pause_save_guc(struct xe_gt *gt, unsigned int vfid)
-{
-	int err;
-
-	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_SAVE_GUC))
-		return false;
-
-	err = xe_gt_sriov_pf_migration_save_guc_state(gt, vfid);
-	if (err) {
-		/* retry if busy */
-		if (err == -EBUSY) {
-			pf_enter_vf_pause_save_guc(gt, vfid);
-			return true;
-		}
-		/* give up on error */
-		if (err == -EIO)
-			pf_enter_vf_mismatch(gt, vfid);
-	}
-
-	pf_enter_vf_pause_completed(gt, vfid);
-	return true;
-}
-
 static bool pf_exit_vf_pause_guc_done(struct xe_gt *gt, unsigned int vfid)
 {
 	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_GUC_DONE))
 		return false;
 
-	pf_enter_vf_pause_save_guc(gt, vfid);
+	pf_enter_vf_pause_completed(gt, vfid);
 	return true;
 }
 
@@ -1984,9 +1952,6 @@ static bool pf_process_vf_state_machine(struct xe_gt *gt, unsigned int vfid)
 	if (pf_exit_vf_pause_guc_done(gt, vfid))
 		return true;
 
-	if (pf_exit_vf_pause_save_guc(gt, vfid))
-		return true;
-
 	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WAIT_DATA)) {
 		xe_gt_sriov_dbg_verbose(gt, "VF%u in %s\n", vfid,
 					control_bit_to_string(XE_GT_SRIOV_STATE_SAVE_WAIT_DATA));
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
index 0bee910bdf07e..6027ba05a7f2e 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
@@ -28,7 +28,6 @@
  * @XE_GT_SRIOV_STATE_PAUSE_SEND_PAUSE: indicates that the PF is about to send a PAUSE command.
  * @XE_GT_SRIOV_STATE_PAUSE_WAIT_GUC: indicates that the PF awaits for a response from the GuC.
  * @XE_GT_SRIOV_STATE_PAUSE_GUC_DONE: indicates that the PF has received a response from the GuC.
- * @XE_GT_SRIOV_STATE_PAUSE_SAVE_GUC: indicates that the PF needs to save the VF GuC state.
  * @XE_GT_SRIOV_STATE_PAUSE_FAILED: indicates that a VF pause operation has failed.
  * @XE_GT_SRIOV_STATE_PAUSED: indicates that the VF is paused.
  * @XE_GT_SRIOV_STATE_SAVE_WIP: indicates that VF save operation is in progress.
@@ -71,7 +70,6 @@ enum xe_gt_sriov_control_bits {
 	XE_GT_SRIOV_STATE_PAUSE_SEND_PAUSE,
 	XE_GT_SRIOV_STATE_PAUSE_WAIT_GUC,
 	XE_GT_SRIOV_STATE_PAUSE_GUC_DONE,
-	XE_GT_SRIOV_STATE_PAUSE_SAVE_GUC,
 	XE_GT_SRIOV_STATE_PAUSE_FAILED,
 	XE_GT_SRIOV_STATE_PAUSED,
 
-- 
2.51.2


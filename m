Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB53C5271F
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 14:23:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 013E810E090;
	Wed, 12 Nov 2025 13:23:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m8si6AHj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E84110E090;
 Wed, 12 Nov 2025 13:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762953808; x=1794489808;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=X6vxLZIgHwX69lCpm2yDNp4y7kZqQUBsn5oVenePgTs=;
 b=m8si6AHjgxwt43TABfVT1EySfnE8DesFCab7Xtn+SIu9vb5m2PqrGcAI
 JK4X9QS1fDHq4cuG3aLr4PDQxv0HQhrSOCIisVxRQz/ByiZb8lY1Zp7jJ
 wL/RjFADMed91G3sj+iwYW2ySH0k+LYXFqCcCdDyw6bKgjBeojy1Tmhwz
 2gelb2iKcjmd0w1VIbMz3Uxhsqxorx7Rlv4CfE+IE/fls0mBO9MZShFyu
 h1LsyHY9dzsrZBg2kzRetBUhNmcU9gvC3VpAtxeX62L6Enmb7sY5S3Zsv
 Rnb1GWjAeNvlZH+kQhgVuCH6i9m9+1W91fJi9emNdrpdE9xE5JDpOMPGG Q==;
X-CSE-ConnectionGUID: gdqQYZAARmiuap55EZpo5A==
X-CSE-MsgGUID: xkS8oOHWRmuFH9IwB3hlrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="75322607"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="75322607"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 05:23:27 -0800
X-CSE-ConnectionGUID: 0UOkp+zhTtitIslAtUyGUw==
X-CSE-MsgGUID: paMRR21XRSiQzA5FIcKKAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="188857924"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 05:23:27 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 05:23:26 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 12 Nov 2025 05:23:26 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.62) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 05:23:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wof+ekCR/Nod76/vbhssl5kSvdJhSjmxo0Ax9k6nkSr7FQsMCV3CzgTj6MEAGQKlPt0rnRJ5ZLOr3ZeaL9bDTup7hgbDnr0GqTwu8e6cBIhxRIIEtInnrkktYH1iNsa4LwNW/wjSg9NMO5ZTtoAhxZN/yf4yBd52aYC44CuC+8u31Xw85/b8w0Uy2dhAGlJBtNvuCijPgAyr9E3rq9Om8wSGPvILvBsPcx/wwURLFJG5xKJubGkEYoCffBKX1CKMSWt5nUSh5PR84hz/foljmQyUCv9y6NO4UkaOrJJP2NKxY2w+rM3ustdf+lcCnGnhCUrDr9AIBvSuPepJCScbVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6cljEFUl+Dg82I0u8SFz4G03gfN17i0D/CMKWyu8ykA=;
 b=BzE1N1kW/zUmTICsaz6Fh6yzfdXHDRxuq5H1RyJZqbEFrF2nlf6SvkIve1WXbdElWIHL9srTzZ/TfEcmnewGHbl37HkogEPmwnKhF+z9Z0qZlt1yXwNzjn+ZsW+kQbVMk3i7864xmbVpUehq+4FtoQYOjB0s/H/BWu+Xjmq413nyeisUozH04B755yGMjI7DyJ0OL+MtBkU8KenPs9bNhJrQjk7IHg+B9a4MVNUv7Lb0xKJVc0E7D1IX+BT2IkvTpaTUOD+rl11+aGULxWy7Q967QAeyvxeAfAIQKoIfDoxsI5kj8O+aRoHbDH+0yOM9J+4W7wdvS4RYnPfG45Sj1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH7PR11MB6929.namprd11.prod.outlook.com (2603:10b6:510:204::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.16; Wed, 12 Nov 2025 13:23:20 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 13:23:20 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>,
 Matthew Brost <matthew.brost@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH 07/24] drm/xe/pf: Add support for encap/decap of bitstream
 to/from packet
Date: Wed, 12 Nov 2025 14:22:03 +0100
Message-ID: <20251112132220.516975-8-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251112132220.516975-1-michal.winiarski@intel.com>
References: <20251112132220.516975-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0039.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::25) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH7PR11MB6929:EE_
X-MS-Office365-Filtering-Correlation-Id: 369c940e-7a32-4d93-a22c-08de21eea5b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aGdlUlUzY1VWZkdTVytEZko4V251bkJERCsxOU16Vm50T2dGQTk3ZzkyZDBK?=
 =?utf-8?B?WTl2WGh4a25LUDV2Y0JRN0FDeEIrOVp4d1VpWldydzR2U1dYSTBWTnMyWjBQ?=
 =?utf-8?B?dm5kbEw2SlZtdVEwT2paMmpVT0VhOWdneHN1eFBiNXJEZkdVZ2xOWFhNTHBm?=
 =?utf-8?B?cTZVbzFPZVYyMzh6TTFRK01XUklPOGFWdDFzdTVNUDRHekU2QU52ZFQ3SEJH?=
 =?utf-8?B?eTFGaW9wc2ZIY2RabzdlTHZPTUVIN0NQVEg1S1RQbXlEN0JLdHhDZmRrcWd1?=
 =?utf-8?B?ejJyWHRPVjRNRGlHUCtvQStRRnNzNWp6WjNEek9mT0ZsZkJZVkdCb1pWdzQ1?=
 =?utf-8?B?eWFZNysxMVlMTXZnYzBkaGZndzlJWTlCNVFyVEMrU2Ixc0VnaTRwSSttSjcr?=
 =?utf-8?B?dWU3VXUyRnk2OU1vb1lUcWhVTW55VGtsVVMwVXNEMW5pRmFvbkhWR2Y5OElE?=
 =?utf-8?B?VUFRWTh4YVo4Y1RMN1dFWEFSMHFFbVJBcmdTSlk1UVBYSG1ORmVMSDVnMXR6?=
 =?utf-8?B?cXBQbXE3K01uN0hZTEhXeS9XRkpxTUw3UHVuRVRPM21WdjdMUWFIai9Pbjdh?=
 =?utf-8?B?NVdLOERLcWZKem9XUVZqdVBiTUdock9pSW9aN2RrRmRFZ2pkQUN2cXJMMzdW?=
 =?utf-8?B?ajBrdHpQNE5YSWZsSkJFTmF5TVZGL2krdjhIbDMzdGY0aFdGN3NrQVJaTzZ1?=
 =?utf-8?B?NmxtUTBwOFdXMWU5K2NmdHhRTlNhZHB0cDlSL3ArU2ZoVm8rT09wN1RhaFRH?=
 =?utf-8?B?OGtoRHpqbFQ3ZDFicTRLL2VUMnJ5MklrQWRyRy85YmN3Z2NXU2xaSGgxTnNU?=
 =?utf-8?B?cnk2bld4eGFzUFlwdm5DWlZIcDhCZERzWURlaUR5VFhOMnowYlFYa1J1aGRY?=
 =?utf-8?B?L1oxU1VyN25aU1lVWHdQdHRVdkEzSEExb0xvR0QrZTFKeVhpQm9CbGdrRERW?=
 =?utf-8?B?eWNoYUIzOTRQcmVOYmZKRUZ5RlJQbkhPVWV2Q2FRd3BYSUlEaytnM0NBSEFz?=
 =?utf-8?B?VUhlNWo4RUFsVlcrUXI5MWYrcXc0bDhhVVB0Vmg0cmVWSDFKMTFJYnp3ZERv?=
 =?utf-8?B?VXZ0QVQxT1lzeDBLOGwrbkFlS1docWl0akFPMmhOb1BlNUl2eXNkVGtRQnhM?=
 =?utf-8?B?N1FLNHg3UXo3VVRCalhET1EySHNNMFZ6TzcwNnR6RC9pYm9WVkVFZHcwVGha?=
 =?utf-8?B?dVIwYnRmQlRMakREYUtzaXJ1V01JQzY1dTJtU091dS9iclVqc0o3SU9iODFi?=
 =?utf-8?B?bDdkY2k0Z0JNYUkzK2ptQjBKeUkxMEdtVEtoSGNUUGZ6OUZ4WGFTbUlVOHNj?=
 =?utf-8?B?R2VsNjhmQUxBc3pFcVF0dTY5M2VjZXZKeSsva2RrOW1tOXVOc0wxVHcvWmwz?=
 =?utf-8?B?WXR4d2ZKZm9RcDJzaVk1UWh0MlhLclJFVzV1TEJOeVZldnZzZ1ZCcnF3OWM1?=
 =?utf-8?B?Q2phRnBxaFdDRlNyUEErZXFqNE5DMGI4RlhnR1RrdUE5d2RlcHpPNzBVNzEv?=
 =?utf-8?B?M0w4TjViQWt2UFZNaTQreGFmalpMdGVOOXo4d3BRYlVyNWNldDlRVHlIRC9m?=
 =?utf-8?B?S3hqTDNsUkduSm12OU8xbEwrR0pMaEE3bnM1a21jMVlZVDFTYk9YVjFoLzlO?=
 =?utf-8?B?bGpSckxnRk1uZVhYQ1Nza0g0Q0laenNYSUxmeldabkhoTWFJYlZXVHRLVU5S?=
 =?utf-8?B?dWt5YUUzTVFDeHhhaThEMld6OG44SUFFUk93Z2c3LzdHYjB0NEhEclVMQXVa?=
 =?utf-8?B?eFhhcUViRGV4Rll3OS9JUlRZZnI5Z0hmS0pHdlcwdTdURmFYNE0vL3hDeElO?=
 =?utf-8?B?SUY2d3ArYTkxMGhqbnBiR1FKVlBHTmpFckFmaXJCcGVIeU1tNE5oWCtHQjd4?=
 =?utf-8?B?T1VEZ0ZEV2k4ZmQ1aHZPNVB4b2x2SVFJM3NQV3lOQVBxUEF2Rkl4VmgrSllk?=
 =?utf-8?Q?jRcUxuRG1QfoMV1+oLMLpRvWPWMG6fZy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TEt1U1FBbXpUL3ZLWHJsaFVuY2FZaEtEN2x1NW9DL3JVQitzcTZxeXRUbEM3?=
 =?utf-8?B?OXEzZUEzZ3lrMUVkcWZGeVhUNDdidS9kd0o5SW93Wi9lS1o2RDY1VjFJZ0Zn?=
 =?utf-8?B?amJBM1ZRM2k5Ui9GMjFvV3NvWXo2MVpNWEJaNUNQbGFuWk1vQVNVMkUyUEdF?=
 =?utf-8?B?T0grcFk0dm9pUFRsT29YbWtyNEsxQ3J2c3E0aGh3VkM4SFJMZnNtUk42K0w4?=
 =?utf-8?B?QjFQOUxmczRoWm5XTjlySlVmV0NQVHpaV3FaZGpiQlN4Ynhkc0gwRzhhZzZw?=
 =?utf-8?B?bS96ZDRndzd4dmtSclVJUUd3aFZCRjE5ZnAvVUppdVpKb01xYWtpR1hzeko3?=
 =?utf-8?B?RElHWmxQUExHQVN4TDAwbm82OGxFYmc5anp2M3YzVmdXMjJ4WVVWOWEwb3Vs?=
 =?utf-8?B?Rm1NNVhtY2d0VzRmMXRLdW8rc2NFeCthWDFLdU9sTXZ6b2NmWmZWZlVaTDFN?=
 =?utf-8?B?a0JVR05sakZVQjJMWmgwK0VtZCtRUGNJdUljQTg3UDBJVFh0U3lZZDAwVDQ5?=
 =?utf-8?B?V0c5VmhlK3ZOMEhpYVI1S2pGS2ZwSHREbVJkaElQNnZyWkdCeDdrd3oyYUhl?=
 =?utf-8?B?dHJiTjErbmFPZzl4bXZBWEFiZSs1TnlUbnVLR252VU04enk4NU4vVG5qNyt2?=
 =?utf-8?B?UjFHb2J0ak9VcTlvM0xiK1NXZWRpYlJNSXdvV0R2VlVMZXRxeEZIYlc5WFFo?=
 =?utf-8?B?aVQwWG1vcnROQUllbEF2VU9yMS93dkdmd1hYa2ZSNDVWMUoxM2hFR0F0dHdv?=
 =?utf-8?B?M2g2RUN5WXNZbDJNbHdMOUVDelYvQW5Ma2paM2swQXljaFIzTktNNlorY053?=
 =?utf-8?B?VEVYZ3lkYjZxQkZUM0Y5Z2tDRkdoUGRSa2gySlE3dWFxMUJhMUwrcXA0OHo2?=
 =?utf-8?B?d1IrQmdhU3E3MS9VQnB2S1Zwd2pHL3I1OXY5bXpjVlAzQk1tdkNOaVU3TENX?=
 =?utf-8?B?eE1hRDJxbkpCS09ZVDlkdVB3aEtaUlo3RVBmbjJKcmthMXZMSVhaNVExTVNi?=
 =?utf-8?B?cnk5c0pqaU9CY2lucmdIWGJLWXpBeG9JTjdvQ1NyNXhaNFAzL0dIZkVocGdT?=
 =?utf-8?B?clFVMk1BeTZXL2xwa2ZFVm9GSk1SV0U1SHBvR0QzSDhQWkpOOUFjN3laRnlW?=
 =?utf-8?B?ekNnRDB4SEt5Q2pxQXMrM3l2dEdOb2d4NmRmV0Z5enJLcExGSUZ1QWNZWVhC?=
 =?utf-8?B?RHJmS0M1TUVQTWRMb2dhV3gxQk9yci9zMlVUWG9JeG5PajMvcXh1dElhZ0Qx?=
 =?utf-8?B?eURYSldXZ2h4cUZzU2U3clBObkdkQVQ4N0JJL2doTG5IUTNmcmRnV3VwNmNZ?=
 =?utf-8?B?eURORkdwYlI0ZG11SFh3dmh5ek4wOTNGRWdHUE04Q1ZSOFJoUklsQ3JzWU1r?=
 =?utf-8?B?NDFIUzZjd1J2OE5USWJuZU9qaTdvS1Z0b0s3Y1lYdXlvMWJjRWpNQ1U5aUJI?=
 =?utf-8?B?L1ptOUQ3SGlBU3puWlZ3aEtlK3ZxUkRJeG16amxuR3ZKQzZoN283a2xTZWt0?=
 =?utf-8?B?dnFFeXJnV05hTjJMR3hXUi9RNzRuNXI4SjIvYjBJQjJmQ3poN3p2R1dHRWs3?=
 =?utf-8?B?WTZZY3lNZGVJVzUwNmR6THJpeDJDQ0pBMjI1S09nSlVzbXpsdlRrblAyTlM0?=
 =?utf-8?B?WHMyNytIWWgwUHJZMlh4ZHhQbHFBTWlrajFFd1ZKaHVtdndTSHJKcGFFQXRl?=
 =?utf-8?B?eDhMSDlpVU5HT2lxSmZTY2I4ZVpTb2h3bWY0Tk9Rbm1JUUdHMnMwWmNZeDRM?=
 =?utf-8?B?TnJlRWdJdkQxMWp0bXBpaU1SclRVWkkyOThWcitaZjVXc1Zibk5DS0lGRm9h?=
 =?utf-8?B?dG1lbTVpN3Q4dW5PdythVWE4czJsVjBnbVI2aWdERHQwL3FBVEFqbGRMN0Rp?=
 =?utf-8?B?dGN1Q0pucGNWbEFsK0dTZlBRSXkxQkw1MWtmZmoweThsWEpGbEVQanQxd2da?=
 =?utf-8?B?S0ZBZEpwSTJnVVQ1MEhmZm1tN29pUUN2L1pXWXVlOG9qVzVPOWdEeE42OWJk?=
 =?utf-8?B?UkpOY3ArQ25HbVo2L243cnREblZsT2RFR21wVzRzdGpRZi8xVCs1cGwzQ3pH?=
 =?utf-8?B?ZWhwek9kTkFITVgrQTMzeXZWR1dIRjN3cC9UZGxmTXhGSDhWeFl0SW0rdk04?=
 =?utf-8?B?MHc2Z3JiTWdWbU5yTWNXRTdCcmVoR1hWVlZvemg3ZGtXVDR6MjJXODlOVGtQ?=
 =?utf-8?B?cEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 369c940e-7a32-4d93-a22c-08de21eea5b5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 13:23:20.0463 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sKi+cuVgtTsMKa8VvIauozOXLL6VUdXz8j2+pB134qlFQIyKhBTNZNk85oVGhmVfsAbAB9d7UIGGMW7P9MWFkZNDrjPgaNj9Nv4z0p3FCmc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6929
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

Add debugfs handlers for migration state and handle bitstream
.read()/.write() to convert from bitstream to/from migration data
packets.
As descriptor/trailer are handled at this layer - add handling for both
save and restore side.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_sriov_packet.c          | 293 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_packet.h          |   6 +
 drivers/gpu/drm/xe/xe_sriov_pf_control.c      |   5 +
 drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c      |  35 +++
 drivers/gpu/drm/xe/xe_sriov_pf_migration.c    | 121 ++++++++
 drivers/gpu/drm/xe/xe_sriov_pf_migration.h    |   5 +
 .../gpu/drm/xe/xe_sriov_pf_migration_types.h  |   9 +
 7 files changed, 474 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_sriov_packet.c b/drivers/gpu/drm/xe/xe_sriov_packet.c
index 1ac7e025e9fd9..c612f37e9707c 100644
--- a/drivers/gpu/drm/xe/xe_sriov_packet.c
+++ b/drivers/gpu/drm/xe/xe_sriov_packet.c
@@ -8,6 +8,67 @@
 #include "xe_printk.h"
 #include "xe_sriov_packet.h"
 #include "xe_sriov_packet_types.h"
+#include "xe_sriov_pf_helpers.h"
+#include "xe_sriov_pf_migration.h"
+#include "xe_sriov_printk.h"
+
+static struct mutex *pf_migration_mutex(struct xe_device *xe, unsigned int vfid)
+{
+	xe_assert(xe, IS_SRIOV_PF(xe));
+	xe_assert(xe, vfid <= xe_sriov_pf_get_totalvfs(xe));
+
+	return &xe->sriov.pf.vfs[vfid].migration.lock;
+}
+
+static struct xe_sriov_packet **pf_pick_pending(struct xe_device *xe, unsigned int vfid)
+{
+	xe_assert(xe, IS_SRIOV_PF(xe));
+	xe_assert(xe, vfid <= xe_sriov_pf_get_totalvfs(xe));
+	lockdep_assert_held(pf_migration_mutex(xe, vfid));
+
+	return &xe->sriov.pf.vfs[vfid].migration.pending;
+}
+
+static struct xe_sriov_packet **
+pf_pick_descriptor(struct xe_device *xe, unsigned int vfid)
+{
+	xe_assert(xe, IS_SRIOV_PF(xe));
+	xe_assert(xe, vfid <= xe_sriov_pf_get_totalvfs(xe));
+	lockdep_assert_held(pf_migration_mutex(xe, vfid));
+
+	return &xe->sriov.pf.vfs[vfid].migration.descriptor;
+}
+
+static struct xe_sriov_packet **pf_pick_trailer(struct xe_device *xe, unsigned int vfid)
+{
+	xe_assert(xe, IS_SRIOV_PF(xe));
+	xe_assert(xe, vfid <= xe_sriov_pf_get_totalvfs(xe));
+	lockdep_assert_held(pf_migration_mutex(xe, vfid));
+
+	return &xe->sriov.pf.vfs[vfid].migration.trailer;
+}
+
+static struct xe_sriov_packet **pf_pick_read_packet(struct xe_device *xe,
+						    unsigned int vfid)
+{
+	struct xe_sriov_packet **data;
+
+	data = pf_pick_descriptor(xe, vfid);
+	if (*data)
+		return data;
+
+	data = pf_pick_pending(xe, vfid);
+	if (!*data)
+		*data = xe_sriov_pf_migration_save_consume(xe, vfid);
+	if (*data)
+		return data;
+
+	data = pf_pick_trailer(xe, vfid);
+	if (*data)
+		return data;
+
+	return NULL;
+}
 
 static bool pkt_needs_bo(struct xe_sriov_packet *data)
 {
@@ -135,3 +196,235 @@ int xe_sriov_packet_init_from_hdr(struct xe_sriov_packet *data)
 
 	return pkt_init(data);
 }
+
+static ssize_t pkt_hdr_read(struct xe_sriov_packet *data,
+			    char __user *buf, size_t len)
+{
+	loff_t offset = sizeof(data->hdr) - data->hdr_remaining;
+
+	if (!data->hdr_remaining)
+		return -EINVAL;
+
+	if (len > data->hdr_remaining)
+		len = data->hdr_remaining;
+
+	if (copy_to_user(buf, (void *)&data->hdr + offset, len))
+		return -EFAULT;
+
+	data->hdr_remaining -= len;
+
+	return len;
+}
+
+static ssize_t pkt_data_read(struct xe_sriov_packet *data,
+			     char __user *buf, size_t len)
+{
+	if (len > data->remaining)
+		len = data->remaining;
+
+	if (copy_to_user(buf, data->vaddr + (data->hdr.size - data->remaining), len))
+		return -EFAULT;
+
+	data->remaining -= len;
+
+	return len;
+}
+
+static ssize_t pkt_read_single(struct xe_sriov_packet **data,
+			       unsigned int vfid, char __user *buf, size_t len)
+{
+	ssize_t copied = 0;
+
+	if ((*data)->hdr_remaining)
+		copied = pkt_hdr_read(*data, buf, len);
+	else
+		copied = pkt_data_read(*data, buf, len);
+
+	if ((*data)->remaining == 0 && (*data)->hdr_remaining == 0) {
+		xe_sriov_packet_free(*data);
+		*data = NULL;
+	}
+
+	return copied;
+}
+
+/**
+ * xe_sriov_packet_read_single() - Read migration data from a single packet.
+ * @xe: the &xe_device
+ * @vfid: the VF identifier
+ * @buf: start address of userspace buffer
+ * @len: requested read size from userspace
+ *
+ * Return: number of bytes that has been successfully read,
+ *	   0 if no more migration data is available,
+ *	   -errno on failure.
+ */
+ssize_t xe_sriov_packet_read_single(struct xe_device *xe, unsigned int vfid,
+				    char __user *buf, size_t len)
+{
+	struct xe_sriov_packet **data = pf_pick_read_packet(xe, vfid);
+
+	if (!data)
+		return -ENODATA;
+	if (IS_ERR(*data))
+		return PTR_ERR(*data);
+
+	return pkt_read_single(data, vfid, buf, len);
+}
+
+static ssize_t pkt_hdr_write(struct xe_sriov_packet *data,
+			     const char __user *buf, size_t len)
+{
+	loff_t offset = sizeof(data->hdr) - data->hdr_remaining;
+	int ret;
+
+	if (len > data->hdr_remaining)
+		len = data->hdr_remaining;
+
+	if (copy_from_user((void *)&data->hdr + offset, buf, len))
+		return -EFAULT;
+
+	data->hdr_remaining -= len;
+
+	if (!data->hdr_remaining) {
+		ret = xe_sriov_packet_init_from_hdr(data);
+		if (ret)
+			return ret;
+	}
+
+	return len;
+}
+
+static ssize_t pkt_data_write(struct xe_sriov_packet *data,
+			      const char __user *buf, size_t len)
+{
+	if (len > data->remaining)
+		len = data->remaining;
+
+	if (copy_from_user(data->vaddr + (data->hdr.size - data->remaining), buf, len))
+		return -EFAULT;
+
+	data->remaining -= len;
+
+	return len;
+}
+
+/**
+ * xe_sriov_packet_write_single() - Write migration data to a single packet.
+ * @xe: the &xe_device
+ * @vfid: the VF identifier
+ * @buf: start address of userspace buffer
+ * @len: requested write size from userspace
+ *
+ * Return: number of bytes that has been successfully written,
+ *	   -errno on failure.
+ */
+ssize_t xe_sriov_packet_write_single(struct xe_device *xe, unsigned int vfid,
+				     const char __user *buf, size_t len)
+{
+	struct xe_sriov_packet **data = pf_pick_pending(xe, vfid);
+	int ret;
+	ssize_t copied;
+
+	if (IS_ERR_OR_NULL(*data)) {
+		*data = xe_sriov_packet_alloc(xe);
+		if (!*data)
+			return -ENOMEM;
+	}
+
+	if ((*data)->hdr_remaining)
+		copied = pkt_hdr_write(*data, buf, len);
+	else
+		copied = pkt_data_write(*data, buf, len);
+
+	if ((*data)->hdr_remaining == 0 && (*data)->remaining == 0) {
+		ret = xe_sriov_pf_migration_restore_produce(xe, vfid, *data);
+		if (ret) {
+			xe_sriov_packet_free(*data);
+			return ret;
+		}
+
+		*data = NULL;
+	}
+
+	return copied;
+}
+
+#define MIGRATION_DESCRIPTOR_DWORDS 0
+static size_t pf_descriptor_init(struct xe_device *xe, unsigned int vfid)
+{
+	struct xe_sriov_packet **desc = pf_pick_descriptor(xe, vfid);
+	struct xe_sriov_packet *data;
+	int ret;
+
+	data = xe_sriov_packet_alloc(xe);
+	if (!data)
+		return -ENOMEM;
+
+	ret = xe_sriov_packet_init(data, 0, 0, XE_SRIOV_PACKET_TYPE_DESCRIPTOR,
+				   0, MIGRATION_DESCRIPTOR_DWORDS * sizeof(u32));
+	if (ret) {
+		xe_sriov_packet_free(data);
+		return ret;
+	}
+
+	*desc = data;
+
+	return 0;
+}
+
+static void pf_pending_init(struct xe_device *xe, unsigned int vfid)
+{
+	struct xe_sriov_packet **data = pf_pick_pending(xe, vfid);
+
+	*data = NULL;
+}
+
+#define MIGRATION_TRAILER_SIZE 0
+static int pf_trailer_init(struct xe_device *xe, unsigned int vfid)
+{
+	struct xe_sriov_packet **trailer = pf_pick_trailer(xe, vfid);
+	struct xe_sriov_packet *data;
+	int ret;
+
+	data = xe_sriov_packet_alloc(xe);
+	if (!data)
+		return -ENOMEM;
+
+	ret = xe_sriov_packet_init(data, 0, 0, XE_SRIOV_PACKET_TYPE_TRAILER,
+				   0, MIGRATION_TRAILER_SIZE);
+	if (ret) {
+		xe_sriov_packet_free(data);
+		return ret;
+	}
+
+	*trailer = data;
+
+	return 0;
+}
+
+/**
+ * xe_sriov_packet_save_init() - Initialize the pending save migration packets.
+ * @xe: the &xe_device
+ * @vfid: the VF identifier
+ *
+ * Return: 0 on success, -errno on failure.
+ */
+int xe_sriov_packet_save_init(struct xe_device *xe, unsigned int vfid)
+{
+	int ret;
+
+	scoped_cond_guard(mutex_intr, return -EINTR, pf_migration_mutex(xe, vfid)) {
+		ret = pf_descriptor_init(xe, vfid);
+		if (ret)
+			return ret;
+
+		ret = pf_trailer_init(xe, vfid);
+		if (ret)
+			return ret;
+
+		pf_pending_init(xe, vfid);
+	}
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_sriov_packet.h b/drivers/gpu/drm/xe/xe_sriov_packet.h
index 282a35e77fb39..fd8da5069b53f 100644
--- a/drivers/gpu/drm/xe/xe_sriov_packet.h
+++ b/drivers/gpu/drm/xe/xe_sriov_packet.h
@@ -19,4 +19,10 @@ int xe_sriov_packet_init(struct xe_sriov_packet *data, u8 tile_id, u8 gt_id,
 			 enum xe_sriov_packet_type, loff_t offset, size_t size);
 int xe_sriov_packet_init_from_hdr(struct xe_sriov_packet *data);
 
+ssize_t xe_sriov_packet_read_single(struct xe_device *xe, unsigned int vfid,
+				    char __user *buf, size_t len);
+ssize_t xe_sriov_packet_write_single(struct xe_device *xe, unsigned int vfid,
+				     const char __user *buf, size_t len);
+int xe_sriov_packet_save_init(struct xe_device *xe, unsigned int vfid);
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
index e7b904e57b68c..7789d9e1409c9 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
@@ -5,6 +5,7 @@
 
 #include "xe_device.h"
 #include "xe_gt_sriov_pf_control.h"
+#include "xe_sriov_packet.h"
 #include "xe_sriov_pf_control.h"
 #include "xe_sriov_printk.h"
 
@@ -165,6 +166,10 @@ int xe_sriov_pf_control_trigger_save_vf(struct xe_device *xe, unsigned int vfid)
 	unsigned int id;
 	int ret;
 
+	ret = xe_sriov_packet_save_init(xe, vfid);
+	if (ret)
+		return ret;
+
 	for_each_gt(gt, xe, id) {
 		ret = xe_gt_sriov_pf_control_trigger_save_vf(gt, vfid);
 		if (ret)
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
index e0e6340c49106..4ca86ff4b7dae 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
@@ -13,6 +13,7 @@
 #include "xe_sriov_pf_control.h"
 #include "xe_sriov_pf_debugfs.h"
 #include "xe_sriov_pf_helpers.h"
+#include "xe_sriov_pf_migration.h"
 #include "xe_sriov_pf_provision.h"
 #include "xe_sriov_pf_service.h"
 #include "xe_sriov_printk.h"
@@ -132,6 +133,7 @@ static void pf_populate_pf(struct xe_device *xe, struct dentry *pfdent)
  *      /sys/kernel/debug/dri/BDF/
  *      ├── sriov
  *      │   ├── vf1
+ *      │   │   ├── migration_data
  *      │   │   ├── pause
  *      │   │   ├── reset
  *      │   │   ├── resume
@@ -220,6 +222,38 @@ DEFINE_VF_CONTROL_ATTRIBUTE(reset_vf);
 DEFINE_VF_CONTROL_ATTRIBUTE_RW(save_vf);
 DEFINE_VF_CONTROL_ATTRIBUTE_RW(restore_vf);
 
+static ssize_t data_write(struct file *file, const char __user *buf, size_t count, loff_t *pos)
+{
+	struct dentry *dent = file_dentry(file)->d_parent;
+	struct xe_device *xe = extract_xe(dent);
+	unsigned int vfid = extract_vfid(dent);
+
+	if (*pos)
+		return -ESPIPE;
+
+	return xe_sriov_pf_migration_write(xe, vfid, buf, count);
+}
+
+static ssize_t data_read(struct file *file, char __user *buf, size_t count, loff_t *ppos)
+{
+	struct dentry *dent = file_dentry(file)->d_parent;
+	struct xe_device *xe = extract_xe(dent);
+	unsigned int vfid = extract_vfid(dent);
+
+	if (*ppos)
+		return -ESPIPE;
+
+	return xe_sriov_pf_migration_read(xe, vfid, buf, count);
+}
+
+static const struct file_operations data_vf_fops = {
+	.owner		= THIS_MODULE,
+	.open		= simple_open,
+	.write		= data_write,
+	.read		= data_read,
+	.llseek		= default_llseek,
+};
+
 static void pf_populate_vf(struct xe_device *xe, struct dentry *vfdent)
 {
 	debugfs_create_file("pause", 0200, vfdent, xe, &pause_vf_fops);
@@ -228,6 +262,7 @@ static void pf_populate_vf(struct xe_device *xe, struct dentry *vfdent)
 	debugfs_create_file("reset", 0200, vfdent, xe, &reset_vf_fops);
 	debugfs_create_file("save", 0600, vfdent, xe, &save_vf_fops);
 	debugfs_create_file("restore", 0600, vfdent, xe, &restore_vf_fops);
+	debugfs_create_file("migration_data", 0600, vfdent, xe, &data_vf_fops);
 }
 
 static void pf_populate_with_tiles(struct xe_device *xe, struct dentry *dent, unsigned int vfid)
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
index b5636dc1b5c26..c13205ee1acd6 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
@@ -10,6 +10,7 @@
 #include "xe_gt_sriov_pf_migration.h"
 #include "xe_pm.h"
 #include "xe_sriov.h"
+#include "xe_sriov_packet.h"
 #include "xe_sriov_packet_types.h"
 #include "xe_sriov_pf_helpers.h"
 #include "xe_sriov_pf_migration.h"
@@ -54,6 +55,15 @@ static bool pf_check_migration_support(struct xe_device *xe)
 	return IS_ENABLED(CONFIG_DRM_XE_DEBUG);
 }
 
+static void pf_migration_cleanup(void *arg)
+{
+	struct xe_sriov_migration_state *migration = arg;
+
+	xe_sriov_packet_free(migration->pending);
+	xe_sriov_packet_free(migration->trailer);
+	xe_sriov_packet_free(migration->descriptor);
+}
+
 /**
  * xe_sriov_pf_migration_init() - Initialize support for SR-IOV VF migration.
  * @xe: the &xe_device
@@ -63,6 +73,7 @@ static bool pf_check_migration_support(struct xe_device *xe)
 int xe_sriov_pf_migration_init(struct xe_device *xe)
 {
 	unsigned int n, totalvfs;
+	int err;
 
 	xe_assert(xe, IS_SRIOV_PF(xe));
 
@@ -74,7 +85,15 @@ int xe_sriov_pf_migration_init(struct xe_device *xe)
 	for (n = 1; n <= totalvfs; n++) {
 		struct xe_sriov_migration_state *migration = pf_pick_migration(xe, n);
 
+		err = drmm_mutex_init(&xe->drm, &migration->lock);
+		if (err)
+			return err;
+
 		init_waitqueue_head(&migration->wq);
+
+		err = devm_add_action_or_reset(xe->drm.dev, pf_migration_cleanup, migration);
+		if (err)
+			return err;
 	}
 
 	return 0;
@@ -155,6 +174,36 @@ xe_sriov_pf_migration_save_consume(struct xe_device *xe, unsigned int vfid)
 	return data;
 }
 
+static int pf_handle_descriptor(struct xe_device *xe, unsigned int vfid,
+				struct xe_sriov_packet *data)
+{
+	if (data->hdr.tile_id != 0 || data->hdr.gt_id != 0)
+		return -EINVAL;
+
+	xe_sriov_packet_free(data);
+
+	return 0;
+}
+
+static int pf_handle_trailer(struct xe_device *xe, unsigned int vfid,
+			     struct xe_sriov_packet *data)
+{
+	struct xe_gt *gt;
+	u8 gt_id;
+
+	if (data->hdr.tile_id != 0 || data->hdr.gt_id != 0)
+		return -EINVAL;
+	if (data->hdr.offset != 0 || data->hdr.size != 0 || data->buff || data->bo)
+		return -EINVAL;
+
+	xe_sriov_packet_free(data);
+
+	for_each_gt(gt, xe, gt_id)
+		xe_gt_sriov_pf_control_restore_data_done(gt, vfid);
+
+	return 0;
+}
+
 /**
  * xe_sriov_pf_migration_restore_produce() - Produce a VF migration data packet to the device.
  * @xe: the &xe_device
@@ -174,6 +223,11 @@ int xe_sriov_pf_migration_restore_produce(struct xe_device *xe, unsigned int vfi
 
 	xe_assert(xe, IS_SRIOV_PF(xe));
 
+	if (data->hdr.type == XE_SRIOV_PACKET_TYPE_DESCRIPTOR)
+		return pf_handle_descriptor(xe, vfid, data);
+	if (data->hdr.type == XE_SRIOV_PACKET_TYPE_TRAILER)
+		return pf_handle_trailer(xe, vfid, data);
+
 	gt = xe_device_get_gt(xe, data->hdr.gt_id);
 	if (!gt || data->hdr.tile_id != gt->tile->id || data->hdr.type == 0) {
 		xe_sriov_err_ratelimited(xe, "Received invalid restore packet for VF%u (type:%u, tile:%u, GT:%u)\n",
@@ -183,3 +237,70 @@ int xe_sriov_pf_migration_restore_produce(struct xe_device *xe, unsigned int vfi
 
 	return xe_gt_sriov_pf_migration_restore_produce(gt, vfid, data);
 }
+
+/**
+ * xe_sriov_pf_migration_read() - Read migration data from the device.
+ * @xe: the &xe_device
+ * @vfid: the VF identifier
+ * @buf: start address of userspace buffer
+ * @len: requested read size from userspace
+ *
+ * Return: number of bytes that has been successfully read,
+ *	   0 if no more migration data is available,
+ *	   -errno on failure.
+ */
+ssize_t xe_sriov_pf_migration_read(struct xe_device *xe, unsigned int vfid,
+				   char __user *buf, size_t len)
+{
+	struct xe_sriov_migration_state *migration = pf_pick_migration(xe, vfid);
+	ssize_t ret, consumed = 0;
+
+	xe_assert(xe, IS_SRIOV_PF(xe));
+
+	scoped_cond_guard(mutex_intr, return -EINTR, &migration->lock) {
+		while (consumed < len) {
+			ret = xe_sriov_packet_read_single(xe, vfid, buf, len - consumed);
+			if (ret == -ENODATA)
+				break;
+			if (ret < 0)
+				return ret;
+
+			consumed += ret;
+			buf += ret;
+		}
+	}
+
+	return consumed;
+}
+
+/**
+ * xe_sriov_pf_migration_write() - Write migration data to the device.
+ * @xe: the &xe_device
+ * @vfid: the VF identifier
+ * @buf: start address of userspace buffer
+ * @len: requested write size from userspace
+ *
+ * Return: number of bytes that has been successfully written,
+ *	   -errno on failure.
+ */
+ssize_t xe_sriov_pf_migration_write(struct xe_device *xe, unsigned int vfid,
+				    const char __user *buf, size_t len)
+{
+	struct xe_sriov_migration_state *migration = pf_pick_migration(xe, vfid);
+	ssize_t ret, produced = 0;
+
+	xe_assert(xe, IS_SRIOV_PF(xe));
+
+	scoped_cond_guard(mutex_intr, return -EINTR, &migration->lock) {
+		while (produced < len) {
+			ret = xe_sriov_packet_write_single(xe, vfid, buf, len - produced);
+			if (ret < 0)
+				return ret;
+
+			produced += ret;
+			buf += ret;
+		}
+	}
+
+	return produced;
+}
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
index d48ff2ecc2308..dbf8094900df8 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
@@ -20,4 +20,9 @@ struct xe_sriov_packet *
 xe_sriov_pf_migration_save_consume(struct xe_device *xe, unsigned int vfid);
 wait_queue_head_t *xe_sriov_pf_migration_waitqueue(struct xe_device *xe, unsigned int vfid);
 
+ssize_t xe_sriov_pf_migration_read(struct xe_device *xe, unsigned int vfid,
+				   char __user *buf, size_t len);
+ssize_t xe_sriov_pf_migration_write(struct xe_device *xe, unsigned int vfid,
+				    const char __user *buf, size_t len);
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
index 5f2062c8c0c42..363d673ee1dd5 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
@@ -7,6 +7,7 @@
 #define _XE_SRIOV_PF_MIGRATION_TYPES_H_
 
 #include <linux/types.h>
+#include <linux/mutex_types.h>
 #include <linux/wait.h>
 
 /**
@@ -23,6 +24,14 @@ struct xe_sriov_pf_migration {
 struct xe_sriov_migration_state {
 	/** @wq: waitqueue used to avoid busy-waiting for snapshot production/consumption */
 	wait_queue_head_t wq;
+	/** @lock: Mutex protecting the migration data */
+	struct mutex lock;
+	/** @pending: currently processed data packet of VF resource */
+	struct xe_sriov_packet *pending;
+	/** @trailer: data packet used to indicate the end of stream */
+	struct xe_sriov_packet *trailer;
+	/** @descriptor: data packet containing the metadata describing the device */
+	struct xe_sriov_packet *descriptor;
 };
 
 #endif
-- 
2.51.2


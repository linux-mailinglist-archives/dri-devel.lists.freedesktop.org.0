Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDM8JEl4l2nVywIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 21:53:29 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A3A1627BC
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 21:53:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 293C210E332;
	Thu, 19 Feb 2026 20:53:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S+g77QjO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E43F510E332;
 Thu, 19 Feb 2026 20:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771534404; x=1803070404;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5vV8e5q0OkeACoSD6cGBuMu+DEELyUSK1UKya3Jr7qI=;
 b=S+g77QjOk4TlNhDAMmi5ivxOshg/bmIbD1Lw4rDzL1ZEFju0MCYxl35l
 79yBGUbCmRs7rsOl9UEL2ARkh70yWeWZghjYZ/hmbfmmZDAtpA049/7xL
 1fLpoPZdKGDktaI/FkX58cNm1ND5kYcZ+mLEb4Q0D14plfPYA6ypT/hsI
 8RJ/TQkxzrNA5oXHRsfrTarA3LqFGwBW3y0vuxLrhyA5gxfFhFtKeu9mp
 D5Cg1tbI2ezf3nUGcns7PqxEncrAUyxN4P5wcposDU9tpk/7pg9hnb4+9
 ZDUrOVtszRbjWtTnkw+AwgUeajSK2cWGsJ/jY4HodF4ySB3fs+XwPoWGE A==;
X-CSE-ConnectionGUID: YRHMBQEiTJ+Yuhn7IxfuXw==
X-CSE-MsgGUID: lHosH81oQOWtn2kOtlxX9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="83349062"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="83349062"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 12:53:23 -0800
X-CSE-ConnectionGUID: bgHww+RRR8m/vxt9tL0rdQ==
X-CSE-MsgGUID: /TvLxkevTzmFZGQeHii8wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="237628223"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 12:53:23 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 12:53:23 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 19 Feb 2026 12:53:23 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.46) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 12:53:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fla7B39dXOjSoKE1Uastf3ceY5ypyMvATwk2a09SRvi5VitRZ0dOgtCtoeCIDHu2OPbFA65wuaWDEvKL4zyX2STqZhNVRBegaF+uN7kV43CPiIR63xX54SxfIKuCcCLsIrN/12DT19dG3MsHSJH+Oxwcc+7DSuxS5HMIJ32B41tEeSgRYexMM8yUa1HspK7MPGvpa/Te0p7Rkazoy026qPUjnQrwrNyXkaqPVeNa7wRpGH67kPRoQ1siz2TdkL2XgSo9AaEgvJpcGEaKIxiayY1H6dzfYTRXYjDqpQACZZlGp3uf6X64rWiZ324Z50yL3pzQ/MGiJLj/9PPiV9xQww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mg9Z4I53UzxvUx0qak39O13ek0NdZgDXC5fkCpNV9bE=;
 b=vQcwixLwR5RmEQbJ9Ix5zitpwPmMNINM1cpIOHMrowgxqBK4Czd5tXo6BgK0SxPPnYrZNpw/Uk7BXVfi0dXiLFBhDsaIEoG6z8IGDdtucNh3Z69iEPoD4d4EHw0LMwyk7MyZltdhAjqD+uYdth1PcwmfzIkQXa6lNkNkttPBSV1FliDCH93PeozM/hU+lI8oE5ljBlLmxcf5NL6uLwo+0qx8OhIZ81KGZ3/Zc3pwwTskAfMZ6D8NRrVlupzkklQUubFEJ7WGoAxwNA1i3X1VvusEfWjPLoajF8wJHbcvK6/MVq3dvlDA2po7xvc/awGsdtO8h3m+pgJVbOg2cfqAtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB4804.namprd11.prod.outlook.com (2603:10b6:303:6f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Thu, 19 Feb
 2026 20:53:15 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9632.015; Thu, 19 Feb 2026
 20:53:15 +0000
Date: Thu, 19 Feb 2026 12:53:13 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <leonro@nvidia.com>, <jgg@ziepe.ca>, <francois.dugast@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v5 3/5] drm/pagemap: Drop source_peer_migrates flag and
 assume true
Message-ID: <aZd4OfBJyMepd4Of@lstrano-desk.jf.intel.com>
References: <20260219201057.1010391-1-matthew.brost@intel.com>
 <20260219201057.1010391-4-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260219201057.1010391-4-matthew.brost@intel.com>
X-ClientProxiedBy: MW4PR04CA0152.namprd04.prod.outlook.com
 (2603:10b6:303:85::7) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB4804:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ca7b210-d883-4233-ad46-08de6ff8e751
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AXhh8WCaNBT1fGwvjvhiVaJy6JJgJ3tTsn1rxQwbkG19kwLRl3IhJqKa/PQM?=
 =?us-ascii?Q?rJxxALW0dB5eJTxYSRxe2keTmvcpFjXC6t3qVcs8KPZ69dIwZai2hdjVI5TB?=
 =?us-ascii?Q?aQqq+zYLAh7xafV9a7MCW4EUiYeFuZRw7GoSBSmjLFPBJbQu3MNyJ2DRoaer?=
 =?us-ascii?Q?njOAvCjlKBhR0OlSMf6tIaw3N477+EjJef/D0kihwFytzberi4zJdkjeUcCm?=
 =?us-ascii?Q?fEVowdTpW/o/72YdsC/JtiKpoTcC6JEJHyMsyZg/UuaUyfRBoLh0qWWhXbIs?=
 =?us-ascii?Q?gANek7L0UzWLWtnEEueHRJlbY0CikTXlX4NyteE8kBuyEVxU0SZ7IClZCNdT?=
 =?us-ascii?Q?WZef2falZNZ8NcqYhYY8HowI40RoFcNfXZKOjCr5OuwhjivyjKlz0xxvvslx?=
 =?us-ascii?Q?DKEIAlKl33Q5owy3PIc4Y9G1oGiIDNye5sSORGKVxw7pO8JlCWwgZcljzuMd?=
 =?us-ascii?Q?oDKJNzXxaBz1LJMXEpy3wLScSY//0QQ5VAHn2E1FSXN1mZJQGwD4uY5ssscj?=
 =?us-ascii?Q?muMe/vi8CtvzxyMo+FIpL0oyZMyaZQsVHk2VdxtqJvf8a5Uu8fLPVEI+Sevb?=
 =?us-ascii?Q?3yIPz6IrHXU0yN57ieXIL41tCZBj+XmsbfF8a+Ennunk6kK6MLmSjYjwIPhg?=
 =?us-ascii?Q?o0BDfNU6ew/evNa8FMqF5Su6/Vvw6OLpo0YoD9fpeW1pPO3BF39i1FY1f/f9?=
 =?us-ascii?Q?bLz6dvpg+jjI777FEpdG9sZBBAEgVImVdZ97/UuZSjKHXA//TXQLUj4VDy0U?=
 =?us-ascii?Q?A/bZjbDbAmRTXxYwmPi0hNxQNcoSISfvjM6UzESzrUSXPayT06KeU22vexZb?=
 =?us-ascii?Q?Mdbt3aRZuL8e/D+jVrku0OXtkYdDX9OViXD5Su1nev1OKwT/nB8gJNpS7D0u?=
 =?us-ascii?Q?UjH6+P7pADFQlAXU8yCMtXyEFNFNPweyx8s8M9r2YkActZc3V9UL+P0Qlj38?=
 =?us-ascii?Q?sC1hfXcqAznFuiEBmDuwCT0Yyq/d6KEtGkUgLaP1ogfytRXkJ3iZ46nmZf6x?=
 =?us-ascii?Q?yTy2g3G4o0vlmmR9MeWrcI2Gyb/SZ9NQ+6uHUGq2A1xuiRuVgiTstqg8c7Bc?=
 =?us-ascii?Q?XXaJeKVvn7AQOP9CvL0x1Azuz8Deog96kTnIAmLuDeA1EXAWntO4F877bm19?=
 =?us-ascii?Q?Gpu07DyHDpb3fvaUHWxvzKT1bhnGYAByP8MlfBWoZZDbIh0X5PGAlUCbF9cG?=
 =?us-ascii?Q?BiyOQZWAR1sN+69yvoRWfog0kvyEJSgthlgP9TJFfqVMJFXRSo5e6MllG70D?=
 =?us-ascii?Q?cZuUb9dVB1/VWF6Ht4OwLA5ieXdw3v0ogIThlCyHXQE7gHuJ7m/V6IXEDS4W?=
 =?us-ascii?Q?BWfcWD3mOhr3utIhk0+VSr/QfVYVtR6tqVBBXlv2vEdFkriaf4tvZiomSNK5?=
 =?us-ascii?Q?Q93Bwxnj4jL0oNHNJCNjc4zUhvTsLz2MGiSopkPLOJY8O+FnrmwukX6A6ke4?=
 =?us-ascii?Q?SM7kD4bjPFX+TZH6B5J+sbju72F7VAqypJnXa/GjCpvxXVocRaRZMA9AgqyM?=
 =?us-ascii?Q?vEEhAhvsaNlWiAaNPyBYgxHiGDR4nj1wqX/kg5y9yX1CIgv2CoY/Q/2NoIvH?=
 =?us-ascii?Q?l/5ypobv7YDoBCRaazM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SXVSe9+zCAD5ILuoiqlhGCDY0msquaW06x3VEhiSgfccH+Ietl00n8EEIovA?=
 =?us-ascii?Q?xM4FPYdLWreyREEMxEAisC31by9uD7UAyABPveUoOnmtNXMU1ciuDd4jZKoU?=
 =?us-ascii?Q?zD5MlNkV0Gs6tdDHgNSdd8HB/QTVGdxfd1sG7xkMlG0sg6+aipWpsz7sSCqr?=
 =?us-ascii?Q?Pzaje9k282UmuoY4Q9mQB20//At+Z7NZEDRbnScJGVIG9pDv98OGE1mzlthy?=
 =?us-ascii?Q?gupu6Iz/Qz1eSdDvJsroLlbZKbLljZABLqD1zYkow9hTuYr/9qhFGqxI0JP0?=
 =?us-ascii?Q?g6WEgLej7gYc+zMi3xK+W52SqEvjSdpM3ZZw87TVFBr9dioRI+56ZRP2KdoM?=
 =?us-ascii?Q?gLvOMTw4/RZXF6c2O/WeFD5fpB9XAtUhTxfwcOMglJUjajKfthdB1xf7xBVl?=
 =?us-ascii?Q?StRGj8DwMloAyAnQq1ThghwDYtTLwVOG3szMOT/TeSZF7OxKfqBM4Wbs+1y+?=
 =?us-ascii?Q?4R54YNMby/mcuPWMRSpS3CYgLZXQFmb/Slo+IeUqhdzUkSv6kN13tCmbIFnH?=
 =?us-ascii?Q?6SsKFu+QpIrqsXNYNkBpdI16VrubEH31CXwN3uJ5Tu+HfYN/gXVYdtYmuD5H?=
 =?us-ascii?Q?RfOQKCGq2seyTE1x3mAwLOss4CHXSXPHXwrMuNj3PTLFKKVho2xwkbBNB76u?=
 =?us-ascii?Q?wsUuhq2hvK3nxIn4wf4su0+3SVg9+1baXRv32+yRdxBOH5TsMvmm6yBLqeud?=
 =?us-ascii?Q?v6Tjb1X0Iuec9D7w/B1p1Uxny/keoBVApUWmFpT+PUow41XAhns2jG1slObu?=
 =?us-ascii?Q?bD1DbHfEHepajM/pro2nAEL9AIJRwdfrCKMBWvKMZSl8Hl6HbrYCD8ThNiu6?=
 =?us-ascii?Q?76k0JNtUnxpEpG3XLJmrBujAsCrWkcs+iPEsZ7O+YESXXbdDZ1EeXwqHWgv9?=
 =?us-ascii?Q?L6+Xb5vkY/wk51Ff2sX5JqaWnarmat020uCcEVwNT21yOs6PfKU607xrBhFQ?=
 =?us-ascii?Q?UGPScXJfV7Tj9tnMgtQXTVp8tmHnatAA80CGy+duFk0ZPMInYR7ahp/ykR80?=
 =?us-ascii?Q?U2wbEruVgKJeSxGYDG6dG9qOXtoZpTQPy80M9pf03mSN5UDZkoGCtwqsBAcm?=
 =?us-ascii?Q?mSOxCWZcSeiRL77EsSZGocThw1SddEGTE6gVwDdkaSSBQpZB/a9EjzC4uOKC?=
 =?us-ascii?Q?UyiVdOEBdwZDP+NzRc5qkV+AkfcHh5tWyFJ8A2mxx+WGIrcG2to1tOVtQ5UW?=
 =?us-ascii?Q?H+y9MqVzfdUINItPTShUDnpbE4LFsdCvMT6N+pkl7whMWpgjceSIKRT77oYd?=
 =?us-ascii?Q?jisHJGVfQ7urvoZTYGlZWtVKH0y8p+Z7YU0ujWP/9Ra4WDV2k4ws8om+naJb?=
 =?us-ascii?Q?tQNODxGuu/07T/MsyGyOUwluTTDdj3AaW7TGSH4zdypU+uKlTItl0LsARvWz?=
 =?us-ascii?Q?aVE5WelG0+DT4vtIvykH86IGhADdXbVeuOttPcpDQ+wr9N/nW3SZNHCz7QIK?=
 =?us-ascii?Q?9EYLDxGU4AoRAS5AcnWxzgN1bTMAOyurf1IAgGa8yx5anVrsz3k7EPaBzi0g?=
 =?us-ascii?Q?LXaBT7xjarBuBffNo36YAu7/SQ8btV7UBpuhe5M0vDlKi0cCxmCVfPxyJlYy?=
 =?us-ascii?Q?PfPbhwjnnkOg8/32LftMX4M9Fcsy4KPyT7Y0k22gY/VzvyPxwLdzqtDMloYN?=
 =?us-ascii?Q?+uk0DuJ5BkJ20wsZCHCmhXpgiKWjvDJvIE2c5tfk/pjnVHaSSEmBRg0hNzNA?=
 =?us-ascii?Q?V2AW7NOKNyC83LGyDD3STXVIdWKzz3IbXPihzEtUQYuy/AydgcobGfh3zelM?=
 =?us-ascii?Q?Ja7SpwuPDanwWaWOQ12fjlfmws4QR7k=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ca7b210-d883-4233-ad46-08de6ff8e751
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 20:53:15.7456 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: od1eNWJP2a8HYmD7/LpOpcXuaRwHbY6ZseuEqiNS2dytfO1udHgrfXeV9qOPKOwPX2JLjv8deFM016aHxH1OCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4804
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
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthew.brost@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: E9A3A1627BC
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 12:10:55PM -0800, Matthew Brost wrote:
> All current users of DRM pagemap set source_peer_migrates to true during
> migration, and it is unclear whether any user would ever want to disable
> this for performance reasons or for features such as compression. It is
> also questionable whether this flag could be made to work with
> high-speed fabric mapping APIs.
> 
> Drop the flag and make DRM pagemap unconditionally assume that
> source_peer_migrates is true.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/drm_pagemap.c | 10 ++++------
>  drivers/gpu/drm/xe/xe_svm.c   |  1 -
>  include/drm/drm_pagemap.h     |  8 ++------
>  3 files changed, 6 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> index 01a06d1fd1a0..32535ab01c0f 100644
> --- a/drivers/gpu/drm/drm_pagemap.c
> +++ b/drivers/gpu/drm/drm_pagemap.c
> @@ -602,12 +602,10 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
>  				own_pages++;
>  				continue;
>  			}
> -			if (mdetails->source_peer_migrates) {
> -				cur.dpagemap = src_zdd->dpagemap;
> -				cur.ops = src_zdd->devmem_allocation->ops;
> -				cur.device = cur.dpagemap->drm->dev;
> -				pages[i] = src_page;
> -			}
> +			cur.dpagemap = src_zdd->dpagemap;
> +			cur.ops = src_zdd->devmem_allocation->ops;
> +			cur.device = cur.dpagemap->drm->dev;
> +			pages[i] = src_page;
>  		}
>  		if (!pages[i]) {
>  			cur.dpagemap = NULL;
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index c96ed760c077..e86e69087c7e 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -1027,7 +1027,6 @@ static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
>  	struct xe_pagemap *xpagemap = container_of(dpagemap, typeof(*xpagemap), dpagemap);
>  	struct drm_pagemap_migrate_details mdetails = {
>  		.timeslice_ms = timeslice_ms,
> -		.source_peer_migrates = 1,
>  	};
>  	struct xe_vram_region *vr = xe_pagemap_to_vr(xpagemap);
>  	struct dma_fence *pre_migrate_fence = NULL;
> diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
> index 72f6828f2604..5c33982141c2 100644
> --- a/include/drm/drm_pagemap.h
> +++ b/include/drm/drm_pagemap.h
> @@ -329,12 +329,8 @@ struct drm_pagemap_devmem {
>   * struct drm_pagemap_migrate_details - Details to govern migration.
>   * @timeslice_ms: The time requested for the migrated pagemap pages to
>   * be present in @mm before being allowed to be migrated back.
> - * @can_migrate_same_pagemap: Whether the copy function as indicated by
> - * the @source_peer_migrates flag, can migrate device pages within a
> - * single drm_pagemap.
> - * @source_peer_migrates: Whether on p2p migration, The source drm_pagemap
> - * should use the copy_to_ram() callback rather than the destination
> - * drm_pagemap should use the copy_to_devmem() callback.
> + * @can_migrate_same_pagemap: Whether the copy function can migrate
> + * device pages within a single drm_pagemap.

I forgot to delete this variable, in effort to save CI cycles, will fix
this in next rev or when merging.

Matt 

>   */
>  struct drm_pagemap_migrate_details {
>  	unsigned long timeslice_ms;
> -- 
> 2.34.1
> 

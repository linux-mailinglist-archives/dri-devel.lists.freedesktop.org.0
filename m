Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C42D16BA1
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 06:42:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B24FE10E2EC;
	Tue, 13 Jan 2026 05:42:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nlvvgO1i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B3F410E12E;
 Tue, 13 Jan 2026 05:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768282922; x=1799818922;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=lPRYwmYubWPXwNn73+DEg9Wbqv+JCew2u1oPww+GwgA=;
 b=nlvvgO1i9ZeKja9eTpW7dNKQh69tjLb0xzx/byHPJVZxG5xFsuMZ0elf
 a+rUQYYhC3gciliJVgsKl3LqA8FCtJrr0B2GDuPXAOWfMTO2X6a8qmZlF
 RwiRBQwO+qMxFAStylK5JtT8SFGlfZiAzIwVrPovmsKxggkHe01u/OhC/
 GsfS4yMJpd6KC83asdRA9uLLcTODYuk8XrN4EadpxS30g+/JGDKZb4Fye
 NSPcLTFQ+aLCjIKq0qfLGwZP3TUQWC6dyKO0c5e2OwnrxT53Vfr3VeZkq
 KlrEJisBJC85zyDiCVtz1VZa5zCvel6smIjgKoZhbu52skUmpCMQ7SkRW Q==;
X-CSE-ConnectionGUID: i5tdZNvMS7C8slBMdpI6Hw==
X-CSE-MsgGUID: jN1xZ1NZQ9qHkHCM4ALEKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69460761"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="69460761"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 21:42:02 -0800
X-CSE-ConnectionGUID: kDKVJYmrQtua9iQF3RBrUg==
X-CSE-MsgGUID: jeSsIs//T3C4hATBbnH8CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="227510822"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 21:42:01 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 21:42:01 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 12 Jan 2026 21:42:01 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.64) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 21:42:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pqo+M0+pI2zgBX7LLNUIwmxYZFAp4oYFONafd8gOCm4mBPTv2pT/rDlynohmWDVmr292c2IDE6HHPtxzyQZLlcLbVoo+7jgCsJoqeCEksY6/s1q1W1fXi6FZ5fneKA6UPQSdG+2jJY3MntbdorodmtasJt2A2/MC2YFAq/qB+CMfqj3RqhOGQZLs2CgurplvXHqOmvPOmSvY7Tc0TqaJ1zFRfmP28mPk/cbATjYttms8lgJnN2zeq6tgGArw95SKzP2MKj23ZyzXryfZPhbnfMp1MsZh4/jx6Pp9ptwmFfniiMhgj+3hvBtnKi+VLM9sOhcp4Ifxnl9a2Nl8UEPDuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=clnF3fHCp8d/jNR+LmiR6Bn4OVtPBWIiMAjgVCNOlbA=;
 b=nUi8p0VvCwaRPptuzb6YDj+YsUMXZLxqZkRlHMFW9UZezNvcxO0Q9oekZ0RbfrEdwPLcy33DrdbZjjOBurPJ9jySGbuuoG3WLN/rueJXOE4l6NZSxZIyIY1iZf3Y+Fk90vgfj/v3G+Ke2008O29FQ75gtc0a4r6tb6I5w0oYXfgL1uUz6Te+nhD+tRwVf0p9ajBNr5v2q6NT1XIaa6KAoU0yUtTrPvvJmf2jQq/IqvfK5qufcw3dO4oe9dLNu7RlId0t+fQPxhD+GtOU0QAUIykjV2K+Yw03ZtlzXWcR8qj69kR2o0sU3YnfgLN1jNnsHdczN0dIqVoxZjeuLNIuZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW5PR11MB5882.namprd11.prod.outlook.com (2603:10b6:303:19e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 05:41:53 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Tue, 13 Jan 2026
 05:41:53 +0000
Date: Mon, 12 Jan 2026 21:41:50 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>, Andrew Morton
 <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, "Lorenzo
 Stoakes" <lorenzo.stoakes@oracle.com>, "Liam R . Howlett"
 <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport
 <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko
 <mhocko@suse.com>, Zi Yan <ziy@nvidia.com>, Alistair Popple
 <apopple@nvidia.com>, Balbir Singh <balbirs@nvidia.com>, <linux-mm@kvack.org>
Subject: Re: [PATCH v4 7/7] drm/pagemap: Enable THP support for GPU memory
 migration
Message-ID: <aWXbHul5UOfQyOaJ@lstrano-desk.jf.intel.com>
References: <20260111205820.830410-1-francois.dugast@intel.com>
 <20260111205820.830410-8-francois.dugast@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260111205820.830410-8-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR03CA0260.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW5PR11MB5882:EE_
X-MS-Office365-Filtering-Correlation-Id: 02a2b591-46ed-4a51-0dff-08de526674c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?rBOWhw5wFV0x7RwNPVhOuXooq++6/RBwT9id9Cu/igbTng2AlC6p7KUzRO?=
 =?iso-8859-1?Q?b2JCeni4mqm2UF6ri0A18AWDcmjud6gTyFIV6E0ctbzQrV+tj8HU6k2w7D?=
 =?iso-8859-1?Q?h3f/5FVv9Ydfz15E8qv7022SRCrNo4FQZyroEUhzTC7rcOknBlzKUpDSrM?=
 =?iso-8859-1?Q?xaxooqKJ9WJMXS/Wk1EZ+yVn9lOa+N1LUXjNFDLssFipcZGSaMeeAlLuKE?=
 =?iso-8859-1?Q?MYjq9l62zMC9fNyofj6oMVHBb6PLlFKt8L+2KyPVBLi4MNZF0bmmqyXFhO?=
 =?iso-8859-1?Q?evz9AUiE5ZL2trvExOep+ba1v75dr5LWNTsj5typM9rTeUxQEqiSwyV56d?=
 =?iso-8859-1?Q?HUbKWzQMpbRVV2QxrfG5yR5UI9j1epmaSzgv0tMCxE5woH9Y7kgLhTP5jb?=
 =?iso-8859-1?Q?ocilrTByBlq+lDkbLNV+53smpJVKXxwxcjzSEKgcqa2agxpMtns2gkdDn9?=
 =?iso-8859-1?Q?3vIJmb4St+8+FuDZvi22X0kwpx8ay6QFLtRxsL3x1nvaKCfGNjl22N6QHC?=
 =?iso-8859-1?Q?QW9iF8JWKzv2IWaB+tnITgEOAvdjyKfG/tMlpsq9aAw+e+9ja7dPLS+98n?=
 =?iso-8859-1?Q?/lYyESuiajVHitrM7vuLWUB4mnpkWUs9CIzr4ey5GOH+S+IoX+PdciYQpg?=
 =?iso-8859-1?Q?pIez1dc39ZNoMQqsGyBuhgmMezjqH8lOdLGqnvK5h266YuwYNBlATo99QX?=
 =?iso-8859-1?Q?fd+zF5t1+a1BNwgS0LxhmznZutV+jg0IivvBSQJVMC7kLDyinYKOVY0rH4?=
 =?iso-8859-1?Q?TnAw1/a6/Pvmeh3bSAZvYYrmkkZr7YAHTK/0PoYucLIRRbjEKMGlqNlCu+?=
 =?iso-8859-1?Q?OFzj3ovrHmyqW6rirefG8uxe6bpyxw07yZiCHr5R+IQDXQIsbDrkOTNrj7?=
 =?iso-8859-1?Q?+tmobl3nyTxTiBs+ERnOeRIxOhuPhBXtYDKbVZxp5nR8K7+5MrZ0GCzgiF?=
 =?iso-8859-1?Q?YcJfmtjNBplnyjpgjBhdKlJSlkPBJxUphidjz3BKs4w4hpJcs9+wO3PSXX?=
 =?iso-8859-1?Q?WOp+oWWvulBqaKYVLrcpXWikZSC4wimm4BlrOIWcOHbkV1BLKhXbV3Cf2O?=
 =?iso-8859-1?Q?DvEMt82zfloLwR0KToffZw1XnNURN8qwMsve7EjaRQNnyl/a9hlRwcLWPq?=
 =?iso-8859-1?Q?2PmgcyYdXXpWQcCuD9oGyAR3j9TMSgjSETOfYdu0+MXyC8bS5SOMrefVg8?=
 =?iso-8859-1?Q?ktdqf0Z0iQUgNihvLToJfK7aQ9wAHfs63/7Ke2CM4etcQr6FW7+fzCJjf5?=
 =?iso-8859-1?Q?kbDwzP21eAzEcH+h9CSwDClMR+gZmJNZGDBTx32PzRvA8eDkKV4AcmPmo4?=
 =?iso-8859-1?Q?RHFJvtsLEq1GMaazhXsNBiCwcwO+26/GnQIrb8QFrxXVvyOeYYK9ztGuaf?=
 =?iso-8859-1?Q?UNfTx7hzFPJRJOB2i3JGer8kWaoEpBN08Ofqrmka9N8rprmiYSskorOebE?=
 =?iso-8859-1?Q?fNROgPRCId79O43hYzVh0ZkOaVWSw09BRYLI872fJrcyqyFUM6BPLcDxu7?=
 =?iso-8859-1?Q?dAkSYFsubNQb3HFDoZ82Tg?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?CfKJE8YFxmuw/sQUBbEp88ej3y+xObW6WvucA8on3Sa2XsWsbl74jen3Dv?=
 =?iso-8859-1?Q?i0AfofeoFoQgiFdHKXAQufdsv0MzQprW1hBWHxmbvaJzjZhzhhVOOmZTAw?=
 =?iso-8859-1?Q?DDuyi7ywaHSc3iH15kycYfX2S0ITc3A4Xf66VDdKinHDNSu9HrZTtHoM6/?=
 =?iso-8859-1?Q?aiq3X3dGh7XQPW98d0HJ7wOuIAPGUbIFkqYRq8vAZQgBj6Igocli88hJGp?=
 =?iso-8859-1?Q?7acJ8jrD0YYXNw0AwCKnSnGWvQj+JAL0wX4C4AGxv3iJGIqO8RZ5XHaIla?=
 =?iso-8859-1?Q?dzpBzcTBHuvi3N33bUV7dYepmk35FHL5vVX6boMG6qK+XkDnkeQapK9P23?=
 =?iso-8859-1?Q?3aB+EJkWA7pl06d1giUzkw0nhwUZS3Vs2Cb9IFoxXkXxUIPsTac+F+S7qo?=
 =?iso-8859-1?Q?XiTBzZibhDCuqANe3LXbT+3R/OU0dmgxe37LAfVD/MdWPI5xMhpOszp4r/?=
 =?iso-8859-1?Q?blHZJ+XdXIg7z3rNDn59HevyNNOXHdeKemhYO69a2EvuF44yjYTMUS1b8u?=
 =?iso-8859-1?Q?Ebnzb+Z9i1gHBFt5/dAtfbMQgarx9oWtAppudVSjt9EdelB/QyCG2pAOK1?=
 =?iso-8859-1?Q?w6O/SFObuTHtURkavtvIs5UhqeAaOL503uRIOL7nPYu6RuG1SvuMklhls/?=
 =?iso-8859-1?Q?nTgtdWm4VsLbHGc3KgotIITPOkbjnR193rMEfMkBIvFVm7arR7Bqo6sB75?=
 =?iso-8859-1?Q?YkTSHSRtw6kNpHz2OLKTt5Yimdzu4q60/cDcT+i7ewox0zZicHYqcDJOly?=
 =?iso-8859-1?Q?3oF9492781oD6cHFASaHQiSmmtMfEG0yrQke+l6Xi8fO4MFw8pO4IjM1Kf?=
 =?iso-8859-1?Q?pwrgxVJMCCF+T2x+Mn/NOd9c35w4CXfXiYnKhQnuoiCtJZMoSFI5i/qROE?=
 =?iso-8859-1?Q?vaUGamIEXPZarzVnLPukCbnHQ894MV5nPIlAIyHm/UCAr29Fwbpo0WDs5l?=
 =?iso-8859-1?Q?9ZuYwuGHd3P79DvZcJgZUDiWocmXzcIZtKvpj7F3E5mxv+oe0j43ymv8Nd?=
 =?iso-8859-1?Q?dZwpQGYvD+Itiif8ehleFThaBHnvGyt0mAWYl6ESpAv8v5s9WZTqrbqht/?=
 =?iso-8859-1?Q?sJr9YoEeumrUUGBE8XaxvEDQpXgyfP6KyBVCmu/7yJz5GmPwitc1mauG8g?=
 =?iso-8859-1?Q?8zA5F4l3R/fnJnJ2MeLGxATD0oJxQ0kaNGORtG3LYwYRzjSXHtT3kbmweH?=
 =?iso-8859-1?Q?Rpr7D4yQMPjAmQeR/Y00yu+jV1+c6HGkbPezpwS7vDiI/VeZWhAMi7AAJp?=
 =?iso-8859-1?Q?o+k5vMKxbifrS8nCnkAeNeeTnjof3CoLK7ELjKfmtBPt8EXsNhh2Rxz8DH?=
 =?iso-8859-1?Q?ROjufg6ap9+xlec1uiQpHTpGmQqwLMF2cMAURiXierVKOGWduYzyOJr0fa?=
 =?iso-8859-1?Q?odlbc/7w2Hsx2jvu4BuXV0tTJlI4ifM0pcXGe6D/+eW9k72IxWOUBhOH14?=
 =?iso-8859-1?Q?r7QaoUCVeCrdIhAyitYKTTqTMKtrWiB/cExmNxbQ1Pj6GNYZGIrHA2Mn6G?=
 =?iso-8859-1?Q?RNNC0xW/a8eV2cgjhY8QDjRPgC+E2rIqLpOAAE4aDn3Etg+o8CoZX3tM39?=
 =?iso-8859-1?Q?zCnQr6I5W6fPeJngtYKolENKAXhdVM8mLCDf9kFnl2WON15CleveEnk4vu?=
 =?iso-8859-1?Q?FL3wLbhGYnVcxnoTmlE5uxObWfCqYVrLb7T6SLfTcSJSWmEITPsegm1eTR?=
 =?iso-8859-1?Q?eL7/i2DSMO1MhDahkvgfYkCDjZ9in127Y+oy8Bt3G/9Cf9CE+yne7MKC8j?=
 =?iso-8859-1?Q?XyJI/huead7DcTNzLzGQ2E3EBBHxase4zCUMNUmjT2UHeBwpCqXqG8lHfL?=
 =?iso-8859-1?Q?Pjka0eQyVlvbN63tYu9y1DJtX6N2F+E=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 02a2b591-46ed-4a51-0dff-08de526674c5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 05:41:53.3733 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +H+Rmn4qD7GQTcaBuGorGcYT/oFPbQVT0e8dYuVTm1CWK0M8LI1xoeqU67lfNP3+k++PYCRKVEMh6ivE+hyxSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5882
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

On Sun, Jan 11, 2026 at 09:55:46PM +0100, Francois Dugast wrote:
> This enables support for Transparent Huge Pages (THP) for device pages by
> using MIGRATE_VMA_SELECT_COMPOUND during migration. It removes the need to
> split folios and loop multiple times over all pages to perform required
> operations at page level. Instead, we rely on newly introduced support for
> higher orders in drm_pagemap and folio-level API.
> 
> In Xe, this drastically improves performance when using SVM. The GT stats
> below collected after a 2MB page fault show overall servicing is more than
> 7 times faster, and thanks to reduced CPU overhead the time spent on the
> actual copy goes from 23% without THP to 80% with THP:
> 
> Without THP:
> 
>     svm_2M_pagefault_us: 966
>     svm_2M_migrate_us: 942
>     svm_2M_device_copy_us: 223
>     svm_2M_get_pages_us: 9
>     svm_2M_bind_us: 10
> 
> With THP:
> 
>     svm_2M_pagefault_us: 132
>     svm_2M_migrate_us: 128
>     svm_2M_device_copy_us: 106
>     svm_2M_get_pages_us: 1
>     svm_2M_bind_us: 2
> 
> v2:
> - Fix one occurrence of drm_pagemap_get_devmem_page() (Matthew Brost)
> 
> v3:
> - Remove migrate_device_split_page() and folio_split_lock, instead rely on
>   free_zone_device_folio() to split folios before freeing (Matthew Brost)
> - Assert folio order is HPAGE_PMD_ORDER (Matthew Brost)
> - Always use folio_set_zone_device_data() in split (Matthew Brost)
> 
> v4:
> - Warn on compound device page, s/continue/goto next/ (Matthew Brost)
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Michal Mrozek <michal.mrozek@intel.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: David Hildenbrand <david@kernel.org>
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: Liam R. Howlett <Liam.Howlett@oracle.com>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: Zi Yan <ziy@nvidia.com>
> Cc: Alistair Popple <apopple@nvidia.com>
> Cc: Balbir Singh <balbirs@nvidia.com>
> Cc: linux-mm@kvack.org
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  drivers/gpu/drm/drm_pagemap.c | 77 ++++++++++++++++++++++++++++++-----
>  1 file changed, 67 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> index af2c8f4da00e..bd2c9af51564 100644
> --- a/drivers/gpu/drm/drm_pagemap.c
> +++ b/drivers/gpu/drm/drm_pagemap.c
> @@ -200,16 +200,20 @@ static void drm_pagemap_migration_unlock_put_pages(unsigned long npages,
>  /**
>   * drm_pagemap_get_devmem_page() - Get a reference to a device memory page
>   * @page: Pointer to the page
> + * @order: Order
>   * @zdd: Pointer to the GPU SVM zone device data
>   *
>   * This function associates the given page with the specified GPU SVM zone
>   * device data and initializes it for zone device usage.
>   */
>  static void drm_pagemap_get_devmem_page(struct page *page,
> +					unsigned int order,
>  					struct drm_pagemap_zdd *zdd)
>  {
> -	page->zone_device_data = drm_pagemap_zdd_get(zdd);
> -	zone_device_page_init(page, 0);
> +	struct folio *folio = page_folio(page);
> +
> +	folio_set_zone_device_data(folio, drm_pagemap_zdd_get(zdd));
> +	zone_device_page_init(page, order);

Just noticed this:

s/zone_device_page_init/zone_device_folio_init/

Matt

>  }
>  
>  /**
> @@ -534,7 +538,8 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
>  		 * rare and only occur when the madvise attributes of memory are
>  		 * changed or atomics are being used.
>  		 */
> -		.flags		= MIGRATE_VMA_SELECT_SYSTEM | MIGRATE_VMA_SELECT_DEVICE_COHERENT,
> +		.flags		= MIGRATE_VMA_SELECT_SYSTEM | MIGRATE_VMA_SELECT_DEVICE_COHERENT |
> +				  MIGRATE_VMA_SELECT_COMPOUND,
>  	};
>  	unsigned long i, npages = npages_in_range(start, end);
>  	unsigned long own_pages = 0, migrated_pages = 0;
> @@ -640,11 +645,16 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
>  
>  	own_pages = 0;
>  
> -	for (i = 0; i < npages; ++i) {
> +	for (i = 0; i < npages;) {
> +		unsigned long j;
>  		struct page *page = pfn_to_page(migrate.dst[i]);
>  		struct page *src_page = migrate_pfn_to_page(migrate.src[i]);
> -		cur.start = i;
> +		unsigned int order = 0;
> +
> +		drm_WARN_ONCE(dpagemap->drm, folio_order(page_folio(page)),
> +			      "Unexpected compound device page found\n");
>  
> +		cur.start = i;
>  		pages[i] = NULL;
>  		if (src_page && is_device_private_page(src_page)) {
>  			struct drm_pagemap_zdd *src_zdd =
> @@ -654,7 +664,7 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
>  			    !mdetails->can_migrate_same_pagemap) {
>  				migrate.dst[i] = 0;
>  				own_pages++;
> -				continue;
> +				goto next;
>  			}
>  			if (mdetails->source_peer_migrates) {
>  				cur.dpagemap = src_zdd->dpagemap;
> @@ -670,7 +680,20 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
>  			pages[i] = page;
>  		}
>  		migrate.dst[i] = migrate_pfn(migrate.dst[i]);
> -		drm_pagemap_get_devmem_page(page, zdd);
> +
> +		if (migrate.src[i] & MIGRATE_PFN_COMPOUND) {
> +			drm_WARN_ONCE(dpagemap->drm, src_page &&
> +				      folio_order(page_folio(src_page)) != HPAGE_PMD_ORDER,
> +				      "Unexpected folio order\n");
> +
> +			order = HPAGE_PMD_ORDER;
> +			migrate.dst[i] |= MIGRATE_PFN_COMPOUND;
> +
> +			for (j = 1; j < NR_PAGES(order) && i + j < npages; j++)
> +				migrate.dst[i + j] = 0;
> +		}
> +
> +		drm_pagemap_get_devmem_page(page, order, zdd);
>  
>  		/* If we switched the migrating drm_pagemap, migrate previous pages now */
>  		err = drm_pagemap_migrate_range(devmem_allocation, migrate.src, migrate.dst,
> @@ -680,7 +703,11 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
>  			npages = i + 1;
>  			goto err_finalize;
>  		}
> +
> +next:
> +		i += NR_PAGES(order);
>  	}
> +
>  	cur.start = npages;
>  	cur.ops = NULL; /* Force migration */
>  	err = drm_pagemap_migrate_range(devmem_allocation, migrate.src, migrate.dst,
> @@ -789,6 +816,8 @@ static int drm_pagemap_migrate_populate_ram_pfn(struct vm_area_struct *vas,
>  		page = folio_page(folio, 0);
>  		mpfn[i] = migrate_pfn(page_to_pfn(page));
>  
> +		if (order)
> +			mpfn[i] |= MIGRATE_PFN_COMPOUND;
>  next:
>  		if (page)
>  			addr += page_size(page);
> @@ -1044,8 +1073,15 @@ int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation)
>  	if (err)
>  		goto err_finalize;
>  
> -	for (i = 0; i < npages; ++i)
> +	for (i = 0; i < npages;) {
> +		unsigned int order = 0;
> +
>  		pages[i] = migrate_pfn_to_page(src[i]);
> +		if (pages[i])
> +			order = folio_order(page_folio(pages[i]));
> +
> +		i += NR_PAGES(order);
> +	}
>  
>  	err = ops->copy_to_ram(pages, pagemap_addr, npages, NULL);
>  	if (err)
> @@ -1098,7 +1134,8 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
>  		.vma		= vas,
>  		.pgmap_owner	= page_pgmap(page)->owner,
>  		.flags		= MIGRATE_VMA_SELECT_DEVICE_PRIVATE |
> -		MIGRATE_VMA_SELECT_DEVICE_COHERENT,
> +				  MIGRATE_VMA_SELECT_DEVICE_COHERENT |
> +				  MIGRATE_VMA_SELECT_COMPOUND,
>  		.fault_page	= page,
>  	};
>  	struct drm_pagemap_migrate_details mdetails = {};
> @@ -1164,8 +1201,15 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
>  	if (err)
>  		goto err_finalize;
>  
> -	for (i = 0; i < npages; ++i)
> +	for (i = 0; i < npages;) {
> +		unsigned int order = 0;
> +
>  		pages[i] = migrate_pfn_to_page(migrate.src[i]);
> +		if (pages[i])
> +			order = folio_order(page_folio(pages[i]));
> +
> +		i += NR_PAGES(order);
> +	}
>  
>  	err = ops->copy_to_ram(pages, pagemap_addr, npages, NULL);
>  	if (err)
> @@ -1224,9 +1268,22 @@ static vm_fault_t drm_pagemap_migrate_to_ram(struct vm_fault *vmf)
>  	return err ? VM_FAULT_SIGBUS : 0;
>  }
>  
> +static void drm_pagemap_folio_split(struct folio *orig_folio, struct folio *new_folio)
> +{
> +	struct drm_pagemap_zdd *zdd;
> +
> +	if (!new_folio)
> +		return;
> +
> +	new_folio->pgmap = orig_folio->pgmap;
> +	zdd = folio_zone_device_data(orig_folio);
> +	folio_set_zone_device_data(new_folio, drm_pagemap_zdd_get(zdd));
> +}
> +
>  static const struct dev_pagemap_ops drm_pagemap_pagemap_ops = {
>  	.folio_free = drm_pagemap_folio_free,
>  	.migrate_to_ram = drm_pagemap_migrate_to_ram,
> +	.folio_split = drm_pagemap_folio_split,
>  };
>  
>  /**
> -- 
> 2.43.0
> 

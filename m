Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E022C9D00D
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 22:04:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F88110E6CF;
	Tue,  2 Dec 2025 21:04:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TC2AhBH/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1C1310E6CD;
 Tue,  2 Dec 2025 21:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764709472; x=1796245472;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bQanF7RoZfeIWz5v/WP8DXB025dSifSR8QCmmExK1fg=;
 b=TC2AhBH/tqKtGeHoNgkPX987SKoBusIyudq54c+q9b2DpzPDNXwMtUgH
 /K00Vtd5igLNf4aFdOYOxlNK6koKY6GWGMVs48V85kK8eWP8FlPVGLJiV
 e1E8cFXpobJolKp2pAS46sr/qa75s8WrGhaAq8FYiQ8mQKeHbXhxD8VI4
 p/wdAEDU4aA/Dq/QYp+lOXZf+b/ZpOO1m88/GnqW4OgYM9kbQcS89YJjt
 KzgpFSG/PSPiIj19HsACnyntrG0+cdC6GQbrKKnVyGPp+jN9nKVIOa9vP
 ZhR0n1O08I2Z8psN8TtNtCRFqxEd7XN1E7eaYqWqxDLj6vgiMNFrtKT7D w==;
X-CSE-ConnectionGUID: E4gWMvvUQCiI9h0MwMrNHQ==
X-CSE-MsgGUID: OkEsFjrhQrOzCC4ItVNJeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66582713"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="66582713"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 13:04:31 -0800
X-CSE-ConnectionGUID: RtmGst0hRKCpFCmtws7xwA==
X-CSE-MsgGUID: eBXdKAJeSjaUcjKMtVdwvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="194363718"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 13:04:31 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 13:04:30 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 13:04:30 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.66) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 13:04:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LF/OT0R2oGQLDwU7iLHRx/T4FEFuA4OzfByHQDVsdgyPTCpXxVUtBrLqpfiiycwhjKrYYxNfHBXEgeXL+s/1CZeXEvXvkXA2dTF+8k00WzgorbjJaGmvN9e7F5OV1G1WfWKqrpgC/buWLQwsRZvNV8ctmtZKA0O8rJIozeBCoqHnV+2qxVDeNpzKqeQkcW8Zq5UUlO743VjG+e1LGjMoyTYKjweeyeNWfh8ix3l95f5aOTkiEFoxvNMLuDrog74EaZvvo+VvVSbMPNDf0bKncHkSyN8q7SnB3dC5sKDMwACT5H7EESfNliYJzA2Fb2LpfidA5nYU0uJyQok0N0Bl5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Eujlqkeng1s0Kg+q5Sgzy/dHtZZqHmgk3yZ8umqzAAg=;
 b=dXUppt9jBBhUpojstoOO7j90VrxR+2F/e04KWCmP7QeDURFUClwQl/mxRhEHL3l8NI6F4oqNMfVjnQr5LmGd2SLCGIsszEGWGjzTAhrner2rlz+WZ8E2WW5ifnlbF6nlBKPfL2LnaeBsS7x1afjEQ5ESAOPA8ERRLKyKHmFFGZ1YnRsxayoh4ghQP5qdjHCwDuivPUQwSMbmI63AmzZKUYorqQepT6JOy/jBdkzbQOwkbTiu6x1KB+huHjdTcTXFk1KYNZD3KpcaN/I/9HrZN1YjwhFGnh7b/C9pnKUqw3v1gdLuJS5/evP4zrzBfx99it0SQbSnsIXxIKLD21ql3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS4PPF990BCE628.namprd11.prod.outlook.com (2603:10b6:f:fc02::3d)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Tue, 2 Dec
 2025 21:04:28 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9388.003; Tue, 2 Dec 2025
 21:04:28 +0000
Date: Tue, 2 Dec 2025 13:04:24 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Andi Shyti <andi.shyti@kernel.org>
CC: Philipp Stanner <phasta@kernel.org>, Sumit Semwal
 <sumit.semwal@linaro.org>, Gustavo Padovan <gustavo@padovan.org>, Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Felix Kuehling
 <Felix.Kuehling@amd.com>, Alex Deucher <alexander.deucher@amd.com>, "David
 Airlie" <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>,
 "Matthew Auld" <matthew.auld@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <amd-gfx@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 4/8] drm/xe: Use dma_fence_check_and_signal_locked()
Message-ID: <aS9UWDA4jABUWB+W@lstrano-desk.jf.intel.com>
References: <20251201105011.19386-2-phasta@kernel.org>
 <20251201105011.19386-6-phasta@kernel.org>
 <aS3uycB40j2CptOf@lstrano-desk.jf.intel.com>
 <fdb7dhdrquapw4cb7oa23rpzl6dkzbnotc3otxntruf3a5hvca@szamkxwcjvfc>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <fdb7dhdrquapw4cb7oa23rpzl6dkzbnotc3otxntruf3a5hvca@szamkxwcjvfc>
X-ClientProxiedBy: MW4PR04CA0371.namprd04.prod.outlook.com
 (2603:10b6:303:81::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS4PPF990BCE628:EE_
X-MS-Office365-Filtering-Correlation-Id: bd2dca52-b8dc-428d-e19f-08de31e66181
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qPt1N98lIvO8QDqjMItmPrr5aayjWR3r/6MqrpboRJd3nc/CH/jBdjTQYVZf?=
 =?us-ascii?Q?PVOrfOV/R9DrWnphFlhcJUJy35AzskPkSPbYqqsKa1D6koohyyAUjngwTeWg?=
 =?us-ascii?Q?M97kwklfYiS50AWmriOvqiHngPFlLkKRDHfoAipUKxaro13ioCqB5yq8kMgK?=
 =?us-ascii?Q?sFEwu63OEJ0Mfh7TeiK4W1v8sSZwJV/xaJ/YqjGXzfMTgQ3JVXJOPSqHsO0A?=
 =?us-ascii?Q?T1qWaIHNDRHdRjcUy+Y0uniVRnOpXxCzuOeyMWcZRNzUriUxNNfYV8GlIGBQ?=
 =?us-ascii?Q?5Ce9uS7OgsggvgL7EpKOz6pHEQMY+I0W2ll8OvYoqrO8WJqLR4fcUPedxm+v?=
 =?us-ascii?Q?558O4TN7tIpbJsQXjvqnAT9/gxBQw6NnfFtQjX5jvnMqlyK8w1Kv1yfY2P14?=
 =?us-ascii?Q?E8/PzNL4vb06M8pSa0+BflLvGjfgqAi2mA+L1lYFyXi7t9Um2N1zxG+6EUb9?=
 =?us-ascii?Q?pvw7siOVeeTNS23O6hNLFfd1iHF39431oYPCi4rMO/IECZ0KJurMIO7IM8Vu?=
 =?us-ascii?Q?fgx8nDREyFRekgnY01YrbeAHgFXeQxOh2Hcwx/ellwQ19J7Ff+znTsjRF7Dg?=
 =?us-ascii?Q?15MqxL+CYMI+ZY7lcu8CK8lLbxIeF1z6R0+kVTEyVr1Hbiol/96NQ4kG1RhY?=
 =?us-ascii?Q?2vS+emcQnypo+E6lGd+mo9aNzc1cVNSA+JJ/+DzmcUJqCrI713B+E1Jz1Gch?=
 =?us-ascii?Q?1UZIWS1VFyepW2+xfEJRImNuT46Ih208DnvR0OvBwrGrvw0azSlO1TBMLGcb?=
 =?us-ascii?Q?GofDq/CusCqhiukUEkMRForo04FjMamCKoTTuzUZP8PQj8P6xsUfgVBQtmpM?=
 =?us-ascii?Q?ZsLauFUm9X3E3QtyXbXRUThF3T0QzlsR1CZmMrstlxdNrM8RM68/d6LmibIo?=
 =?us-ascii?Q?Eqm2+1lpbIA6rdd2TCzWC9A3oiIdmBkPSFLjzGZW3s3Vi0eyIFYAlVXisDCx?=
 =?us-ascii?Q?Je2uEGmIVgt2hhvazU//exgw5g48H42husSrVG85lZ/qQWoCO3x9a83jgCG3?=
 =?us-ascii?Q?IN1l/aJb98nd4QHXY8s9IuFfjtgIac5VZLF0fu2IfeyvbBx6owdF8GAVaIDt?=
 =?us-ascii?Q?8WqDB0C6vN+G5CMRc/YzM9B1Nzu822/9QkYDx7A3pIT9xeF1JlA/GzwrlKSb?=
 =?us-ascii?Q?I7SMY2siXYR8A3IkxKjVesi0B4ruG+K3Zojza/KADbQB4W1uaHnzoQWZ6zFD?=
 =?us-ascii?Q?YybSq8xNReOHCXQSNZzXPGMK97Ow9H0JXmGhqhaHIt9nl5jkD/pYnuVRTpfs?=
 =?us-ascii?Q?jTgo7H+UPD2jdYnEr/UdNODMSeRCU4pniJp16cnnMd3FkytZknYhtzl4FmKX?=
 =?us-ascii?Q?xV0E7vaUtQj3ETtEICnlzxbqlzpw32UT7Sz3DGLqxTlVjo9QxW4vUAFjDsBt?=
 =?us-ascii?Q?MlwjGvqLo5m9YYpcS6nphhrk623+dZKCOc0/eIYpFzcmNEUGq46mQHHeWQZM?=
 =?us-ascii?Q?+6KzW9xgrAvuBCEZVRrl+icfTAG8DWBd?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kulHsojG20Nr/WxFRPf912vSynqCmoHRA4eaTtxZmo5abqLKbC6N8zSN/dEe?=
 =?us-ascii?Q?7y6CX6LTZovMg2xNYNUVky2qG0kGAs0e/tTm8VavfOEov4U9hfxJ8/Kn8i6q?=
 =?us-ascii?Q?rA5B6Cu8SBeJrvp4l/GHFn5/E2+6+l/GMlE62JkKoXKyJvdnO7y7/QD1GMtT?=
 =?us-ascii?Q?858T7S4ho/hzlLrxZdxoNSUaycEdK+SeC9PBW+/N3orE8Gahn7k5P+J7wM5K?=
 =?us-ascii?Q?rzVfWpgYn1DmThW0dxrrdmKumEGupQrdZuNi/cUiDvQsspQQup97HQPVT7u0?=
 =?us-ascii?Q?uiCH3EiwVNyYWA+Rj9Z9MCEsa97iVrj2XNCtWKe+uUFm+hraxgq2GouMw7ig?=
 =?us-ascii?Q?kF1a7PvIpxhwmJW2BKGYghY4qa+tAN0yMrW3l4cfqYBy2VGIogbgYkIMTpwP?=
 =?us-ascii?Q?QYKtwV8YRmkDOmVV1+X6czUS/LwjvN0tBpj50IfAxOJJcDaqU5SnfzMh/VkF?=
 =?us-ascii?Q?UWTp1g7snZjlRrZA/487tqypsAH1BCPirnhDGfEfxE8cM5MM2mnfalzRzE0C?=
 =?us-ascii?Q?P4HB0t8IHM1XQBdi42Bcc9fqIDYDpZ3nCNsncFHlm0NQ70ifZ+a5FgLSS+pU?=
 =?us-ascii?Q?9dMjBp4RkhMuGtnFMfdm4rsjMjWCHUHOgetYz4LzDMn0L/o4bNUSKSRfz5GN?=
 =?us-ascii?Q?vIETeNi4AKPqjm+PoqvjxBkqzqIdOJaA5NcbPIxUapIygS48vBHf2qGdKV0g?=
 =?us-ascii?Q?2HmkvLDERXOwyhTLFfuw+vRj0EO5+bkg99aqkDaNQf+60VS0OWLlOLgVby+p?=
 =?us-ascii?Q?eEcqGISpEJPSGs7EIfaLeQ+1uTLNnLJWSXkyZJCyn6txs/798j9miEv+9l3J?=
 =?us-ascii?Q?Mc6okXf6yre8Sh/aVyyV/O+F6yDmeFFTRTKsG5yFblweFV/HPAczrqyj59fD?=
 =?us-ascii?Q?pg5gnGQBUt1b8K6+pb6cCfps42DQ2v6kl6VCSZF47VW46s9MpebuAm44wT+4?=
 =?us-ascii?Q?UI3Vlpkq5wpZWUvYcDgdi5noZnnalQKuBy6nifFqRgl9sT+0c4SCBct1Okd+?=
 =?us-ascii?Q?cgG6PjvvJXtZgCneVZglGozxQCykZIVwbN31NBQs66jwFl0lFNOt6kghcHq5?=
 =?us-ascii?Q?m7/+6iKua2XvqxcfIsUkXJnCDVfKOUcGzbU4wCm66Ew+AR4e9zUHGhqJ7/vE?=
 =?us-ascii?Q?EZ6O/YyXRQgyF6hdD3Y32NTxCdIGflFXjlK+kDaztu13Et3LeimRJsYSc2qa?=
 =?us-ascii?Q?c+pyGVuimPVRhrmcb8cppPFaGZzVQ5OXuDL6ivSnKK7QnooNapKnC8cbiaeC?=
 =?us-ascii?Q?+ZRgG3430RlXMFnd9WK+bfxODhlZHl82rBO7R7rTEdopqcg06joMSSRgSQyZ?=
 =?us-ascii?Q?WjdIDQL3lKrRHxioJGVtErdHx+fczpdeRP0cA9ZcJzdmMp29GvX3PWxpPaRG?=
 =?us-ascii?Q?zkHGakITvrKEgWVmfR6/UqHGWzSXKX3qJgU6X8xUGbVFiXH5y9sc4I8Qq69u?=
 =?us-ascii?Q?tOlOt8HzZeJyJbrdDjF/9faQHwvfnHt5epL3lp+xIQcv+YYnuzwGVidH7dRi?=
 =?us-ascii?Q?aaIRKVLuOw9zkPCIE1KHxKjRX7Bu7OxJzTwkw8FWXNY/ngSKg5nxcjgxhc1I?=
 =?us-ascii?Q?CGnKM9T2AO76kI3Fp/xCcVj5rJZKxSJi41B3TKqAGUAL1Ze1UvKMFPaGXdiI?=
 =?us-ascii?Q?eA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bd2dca52-b8dc-428d-e19f-08de31e66181
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 21:04:28.2916 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OLkVg+ERlLfHKNCNps1Q/0TMPsLdRAA9FhxjFSbMjtl4nxhIjpX1Nq7CLkKTWdXmUVnAauSllqpYEfzI8R9b4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF990BCE628
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

On Tue, Dec 02, 2025 at 09:47:39PM +0100, Andi Shyti wrote:
> Hi Matt,
> 
> > > @@ -93,9 +92,8 @@ void xe_hw_fence_irq_finish(struct xe_hw_fence_irq *irq)
> > >  		spin_lock_irqsave(&irq->lock, flags);
> > >  		list_for_each_entry_safe(fence, next, &irq->pending, irq_link) {
> > >  			list_del_init(&fence->irq_link);
> > > -			err = dma_fence_signal_locked(&fence->dma);
> > > +			XE_WARN_ON(dma_fence_check_and_signal_locked(&fence->dma));
> > 
> > I think XE_WARN_ON can compile out in certain builds. Best to leave warn on logic as is.
> 
> I don't think XE_WARN_ON compiles out. It should always evaluate
> the content, then, depending on the build, it prints debug logs.

Ah, ok. I thought XE_WARN_ON was tied to a Kconfig to compile out or
WARN_ON (this is what XE_WARN_ON resolves) compiled out in some kernel
builds. Upon more looking, I guess neither of these is the case.

So I guess this patch is actually:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

Sorry for the noise. Side note, we should probably just XE_WARN_ON too
since this is just WARN_ON.

Matt

> 
> Andi

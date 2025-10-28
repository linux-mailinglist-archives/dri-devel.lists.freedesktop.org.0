Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7AEFC168F8
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 20:04:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC68A10E0AD;
	Tue, 28 Oct 2025 19:04:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CURBOR7n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CCDB10E07C;
 Tue, 28 Oct 2025 19:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761678250; x=1793214250;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=hNm1LAsrnmTWSoOLyYyUvUZhGJbPiMlSmql4HSSU9pQ=;
 b=CURBOR7n4iW7m3dhSa6S6Gq+9Z0YuZSwG+HlOsrFZOv1A6gjCJZN3a/D
 +2/l1oV4n14kZiZ8E73nzD9R2T6VlRuKcvS/HP2DXDro5X1NaRhoXobaK
 Hqp9prba+of26GGJzR3qtFsWtdJqk9SspmAGzJdWnzojW/MMGK7cUbZYY
 s9u4Jeqj2P3bzqWZHMCn6PXMeWgmDPVSevV7Xuipld+RrGCC7Zut7kYmF
 4bC2VtmMC/IKmT8C+AVVuCbs19Ir74KcdvsHG6kU5TO9NOLXIEujXOuXN
 6K2XmwC0YbxUW8iYYY9VWVeLeXtYfMbDBDSOvzDudEA5fIwwG2Yj1NLYs g==;
X-CSE-ConnectionGUID: GfBTu6YTSueC2JQND1hAJA==
X-CSE-MsgGUID: ew6sfYrXRl+yDH09VaBzZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="75237224"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="75237224"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 12:04:09 -0700
X-CSE-ConnectionGUID: 9Tq7i399QwmrfmD2MQdltQ==
X-CSE-MsgGUID: 13RlEVm7RYetTgUaFEpeVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="185324085"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 12:04:08 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 12:04:07 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 28 Oct 2025 12:04:07 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.32) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 12:04:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d6jrfYeXe+2n4sZQ53vDuK3sKbNcQiAsXr85BlRkb6oqdWXFJ1V//10+olHntqh0A/xYUCC1nf6/XF04fyosptV8cBn6wo3D809jUQyCNyk12e58aG42wz56QL8Q/u8ADglaiRKn43xuzWGqXoI0U9EyyH1yxLZnX+lhJ1Zlv5Y9HjgUnu2ZFjsHiozTX9JUvgsf+1vUoPg4OmhhCaEAm6h7NNQrpiaM6llt9g+6p1TNO7Uh1ed6fnyzZv0v+MLOOvYv7KhLo+r+hapz8+rUQOo+fISgQNpx8VhpJSTmchmZd5DGCL5B/y5oB10I8AbIKoNJLk72WZNw/ZD2/39xcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vpl/11GD0F5DUVPAhTkQwUs7ZrlwZwDd4eaenvapceU=;
 b=fOyNgaVlelqZtt6QL19U1ErREHQYs+k9mFfvKohU95uj5EvlI8uPJ570GKJ9giePDbg4ZJFvr7W22NT55WZf018IzkPxnnW8j9RnFMf4nC6GDAOeNc7/vIOfO4NgCgEYrBCREv86G1/zL0EdWJ+HVeYmf7oxxQqOFha9h9XIIHeuBKi5RcLx1d1J2o7RligZ7Y7MyAZ8Fil8HQ3T1glL4s/fivkpwpIeG4xu7Hhjg6kAg402k365WcVDD+tcT1E5+IApz3uvWE/upLh0M0Ll/DY9nPgLNBckLPAJNeQ37ob0+wjdcBCZfljtKKmL2xf+0bfpaxi1m8N8h5dM5/lyWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA3PR11MB9422.namprd11.prod.outlook.com (2603:10b6:208:57e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 19:04:01 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 19:04:00 +0000
Date: Tue, 28 Oct 2025 12:03:57 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <himal.prasad.ghimiray@intel.com>, <apopple@nvidia.com>, <airlied@gmail.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, <dakr@kernel.org>,
 "Mrozek, Michal" <michal.mrozek@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH 15/15] drm/xe: Retry migration once
Message-ID: <aQETnayTwNWiN0ZV@lstrano-desk.jf.intel.com>
References: <20251025120412.12262-1-thomas.hellstrom@linux.intel.com>
 <20251025120412.12262-16-thomas.hellstrom@linux.intel.com>
 <aQAKsw5nd+WVNLu+@lstrano-desk.jf.intel.com>
 <aa2638b6324ea7162f4f1a2e867f36df6da413f7.camel@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aa2638b6324ea7162f4f1a2e867f36df6da413f7.camel@linux.intel.com>
X-ClientProxiedBy: BY3PR05CA0059.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA3PR11MB9422:EE_
X-MS-Office365-Filtering-Correlation-Id: 04795593-91d7-46a8-dea4-08de1654c0f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QlN3YVhtWFMvNjFZRFI2MlRRQzdCYjVxM0tWMThqKzNyYllrRXhwcVJSSEZn?=
 =?utf-8?B?V0tlcHN6R25mbENRNnNWR1piSHZOTzZ2MWVXS0JwT2RtTm9lN1R6ZTlJdUJY?=
 =?utf-8?B?V1JwYXFQTWlkL2JFUXJXOWlLWUJoUC8wODJJZDFmM1AzRXRQR1pPbmY4Qmt3?=
 =?utf-8?B?aFBKTTdLdUFmR3hDR1ZTRXVkZERNdG5DZlkrQmt5bUNUTlFVSG5RZXhyMGp1?=
 =?utf-8?B?UHRSbVkyTHF2dDF5NnJZK1dEbFgzaTNWdnJXRnVEVENXV1oxTHBLZ2xwUTRu?=
 =?utf-8?B?RWxjTDBvQWFFRzM5NFBBV3JWbHFHUnQzUTF1K1duNGNuZnNNd0lLWVFjc09t?=
 =?utf-8?B?ZGhxeGF2NXpjQ2RrOFc0V2N0dnNKUFlYSW9hZEljS0RYc3hrU0VSNU9udUJR?=
 =?utf-8?B?UVR0WTNDVzVQU2xrZzR0ZlptVjJoaW96RFVXVm1WVHZGTjZ2SnhTd1pNRG5L?=
 =?utf-8?B?aUVwVG5VRnIxcmhhNUdpU2V1c0FmSjBnZE5zOVUxcWRHMDdjUENWaHZjOWYx?=
 =?utf-8?B?T092ZmVOaU5xY3JQOE5yVllxdi9pRHBHdUo3R1NUTnVxY01jdVR6WWtreDFO?=
 =?utf-8?B?eHhsWGNTL1B1VHp5TThydUk4azMxNHdEZFBBTEVlZG1RY3FRcEZNeVBIUE9S?=
 =?utf-8?B?alJWcmUxd0ZzV0ozVDQ1UXBzVGdSTk5peHpGZ2txS2lZZC9RejhRcktvSFk4?=
 =?utf-8?B?TTMyamdkZEdoMmI1UERwKzdkYVFLb0VvR2loWlpuVEs0VHVCZFp2eXhySFFP?=
 =?utf-8?B?SE55VXFhdTFLL3RHdkR1N0t1NFFGOFp6NnNCTkhUUHFUUlFSWkpxVHRmVXdZ?=
 =?utf-8?B?bEtmK0tGc242RDdmcmw4RllyQWNyU3E5d01ad3pCa0FHcmRPbm9CeTFvNjdy?=
 =?utf-8?B?Ym52OUt3c0FBQXlxQXdHUDRwYVFDQ1IrTXBMNHJQZ2t5dGJPRktlSVpQSmlm?=
 =?utf-8?B?VGNWL2Y5ZHRtejZwQ0M3UHlIWVJQYURnQ1RLcStkV3g4UjN6WHIrbDU5dGFH?=
 =?utf-8?B?QU5yUWI2MzZBdTA4SE92OVd1bmZzL09VaGdIU05EM3dnS3J6bktqMjZqengy?=
 =?utf-8?B?dkN6ZTN3SWt2Q0U4dGs3OXRDOEZMb2tKVE1DeS81OGs0UXdLbzVxQWc1NmZX?=
 =?utf-8?B?L2RQdWxJWWh6ejhDa29weUozbHF2QXVNZ1B2S0hZR2dGYWtXYmNmeHJJSVhw?=
 =?utf-8?B?Z0M2WElIL0xwU1M0VjdJalJ0MCtjVER1R3JoRGhHQlpxUjI4eVQyOVFoVUE2?=
 =?utf-8?B?NUErY0dEK1lvMmlaK2JmemV1Vy81NytINUx5K1N2N01seTFneUlnRkpsVXdR?=
 =?utf-8?B?Y2xYaFNoTGtmQnRpZ2U5ejFZdlBxK1ArWUk2MGFXQ0FXV0E0bG9XaS9CZ3VS?=
 =?utf-8?B?K0xJQ3ZGcTEvdVhSWFJHWVBiSGpuQXV2WXl1Rk1FTE5BdTdMaEZyc3BHbERM?=
 =?utf-8?B?M0FZbkNac3VDUndIdE5Yb0JFMmo2aFlNY1VIR0h0RFZFdldrZjNoaXNqc05I?=
 =?utf-8?B?cEdqc3VUUGpEMExtYmx2a0Vmb2krbndTYW5OMi9zVmZlOUd6bmpCOTE4Sm5o?=
 =?utf-8?B?K2QvbWh3R2ZzSFhZWXU5OFZaa0lUNkFNZXlRRENZOENidG1SaE1OckpweGFN?=
 =?utf-8?B?N3BNbDQ2SEdwSUg0QWdoVFNXWEtPdCtqM1d6V3FqQ1Z5LzdmY25wZGxTQWRU?=
 =?utf-8?B?OW5MSGFEaWZUV0NTMmRMNE9oSzAxUXZtRXMvNGlHYVpzK2pidlNFT0c2M0VI?=
 =?utf-8?B?V0xkU0FnK2o5ZkoySTlJZ1ZYMENaM3BlcWpEZkhnUWoyVFBtZ1Ezb05JNGZW?=
 =?utf-8?B?VXg1dXV2TVppVlVuNU9YMW5GM0tHZFBNTUE5WW9Xbk1qaVQ4dnovcmJOTFR4?=
 =?utf-8?B?MHFveDNnOEM4aytueEx5WkViTVNEQmFRU01IUWdRajRqWE91M2p4ektJOER0?=
 =?utf-8?Q?2YOYCc4PJHEn74taIeY1dMEtEu4k5Sdc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c0srUGRUZGZVV21EbjZiQTcvNHBvUDRvekVBa1I3aGNNSTBBVjNBMlF0MHQx?=
 =?utf-8?B?KytSU0xqQURYb0Fqdm9TYzlzYmgwOWwzMDdUVHNXUE8veFRnZU5ISnBjRHBy?=
 =?utf-8?B?eVluNTdPNllZL244ZThPSm1CVFZQRzlVdFJtRHcwYTUrVWlJc0VrV1ZUOW1x?=
 =?utf-8?B?RXNaQWxOd3FsN2dQQ29pT0gvWm10Q3RuaS9LYUdkeXIxbXBGU1hWbnY3MlFE?=
 =?utf-8?B?NjVGd0NZSVBPc2FKTDg5WUNnK2VReDlCQisxUDd6RjBSVXBQWjV0Z2NQN2Fm?=
 =?utf-8?B?VlVhUE1iTEh5S01UcVE2VXJTOEovZGRCRkhQVHBkQTlpek43UWZhK0J1T29Y?=
 =?utf-8?B?UmNHNzJwUWlOQ3FZWFBsZG5Dc1dGaEEvdDVUWDBXeVFSQWhHMFFBb1Rvemxy?=
 =?utf-8?B?MWFkbVJNbUtPWk4vT3d4U25Kc3c1bjVsOVo0aS9BSDBrdkI1TjVJR0ovZVBN?=
 =?utf-8?B?V0JMQTZDQit3RFFsNWtVV0d1R2k5Z1B2d2VabVVLZ0FSYzlDTTVWOUJvQmxB?=
 =?utf-8?B?cWI4UzhHdEl0eEFHZW9XSk5FT0F2d3kwWXRlRzMzQ2dFZWdyTjR0N24rL0ZB?=
 =?utf-8?B?bVVlZmpWRmx5WWduYkQwNlQ0bkJWZlp6VXViRnV1a0NSajMwWjQ2K25yd25H?=
 =?utf-8?B?eUFFOGJtUW1LREJtY2JBenZ4cnV1bHhnOXFPemNyb3lYbDRsQ01kRytQU2oz?=
 =?utf-8?B?dmdiUGdWaDNLVE0xMlpEWFRpUkZ3N0FLL0p0bDYwNitxc3phbk9nUXpUUEZ0?=
 =?utf-8?B?VzdFVVQzTm9TdVMrR2h4VVZVUFdZU2RCayttUExYbUsxOHJ3dXlIZi9OZTRi?=
 =?utf-8?B?UzlzWngraFFJelEvVVB6cDJRWGdjbE1DZmhsOStMRlNtWDJsV1RQMFIzeDNo?=
 =?utf-8?B?TE4vazA5T1Vvb1FtQi9jV0Fhc3hyek9nTXM3KzVwbHQyT3d4ZHB6cHRZdkIz?=
 =?utf-8?B?UTdjd0FzcHJ0YTN2MXVSQkg4c3dRMVhRRklVdncxeW9hVjkrOUw5WlBKcjhn?=
 =?utf-8?B?dHlMQ1dvTjRHWktrZW9vdFBMSnl0dDB6VEpYSUxYTkNOSFZZV1AvQk9LWmIz?=
 =?utf-8?B?Uy8vQmhHVERleUtNL1NOU2Q1Q0c5RnJaZDU4a3dqSk9qRkVoeTMvdmh1OHhu?=
 =?utf-8?B?ODY1dEtxNS82YWJNNndHcHZoZnJWRk9LOUJrQW5CMnA4b0w5ZjRMdlRES1VR?=
 =?utf-8?B?OU90S2FNSlQzSUpjWWdXOEJxQjh6Z0tSdjh5anFrb2xCeDEvK3VWaHFITVEv?=
 =?utf-8?B?QkVXSUtsTGVlRVlWNkZuVHJVd3IycWZpaUxBRzh1L2ViaDg1VGxoSFgrVGZx?=
 =?utf-8?B?amJrdzdkaVg5ZTNabmY4NkNXSTV3a0lLSi8ySlc2YmY0RE82cXo3cTVTcG1L?=
 =?utf-8?B?Q2x3Z3JRQ0RxMnl1ZVJEZHFDQUdCVVR6RGJkL3lxMERPYmhSVllPTVpsK2Q1?=
 =?utf-8?B?MWZicWhZRERUQkI2OUpvWm40TUlFYUhxNFlzQ0Zzc3dNNWRoU3N2QlFpU1Rv?=
 =?utf-8?B?WlNxdVJLQ25TNUc0aFhrbUg1eDg0YkpVeG9IU1ZXMVZwU015Z29CQVFWb2xB?=
 =?utf-8?B?TDJiQlZPZVU1aVFTZkpXcnRGOVlyeGF5SVZudFlBS0k5Q0xQNTc3WHhaekUy?=
 =?utf-8?B?Q1FzNzY5NzN1dkp1c0g1NXc2VjA4a1NBU0Raa3RCVmpNOUdNdzl1OTF6OHFT?=
 =?utf-8?B?bGk1d04vL3haMFVjdmV1UTBsamlNb2pNUWx1cDIraElOQVR2UHZ5UFNIblZR?=
 =?utf-8?B?ZkUyMUFKUXY4NUxnKzNhNHlWcnZSU3VPZHJTQ3cwcERXa0dmTk1sdHVjL2di?=
 =?utf-8?B?cGkvY2tvdHBEQkYxM2Q0RGIwN0w4cC95TVhKZFBNYWovZkpTOUwyVjY2MFcx?=
 =?utf-8?B?UENIeUpaUnQ2dDhkdW1ZR00wQ3R4R1I1ejNjdTNVYjREZkZxczVjOTZTTTcy?=
 =?utf-8?B?NWRHR2kxWUdzclcvcS8rdTVObWtMMUpEbWZmZXBUelNYZ1ZGWURhNzFuaVF2?=
 =?utf-8?B?K09OUVFUYmxYRlE4dnpSZU9GNFo4bVh0bWlMVDM1bkc2cnM3SWFFdUdYVjFV?=
 =?utf-8?B?K3RqbmlqMSt5b245MU1sWE1qdk5veE5kNjlabVZySTdIOWRBSnNSSGNVeGor?=
 =?utf-8?B?TXFkeHRTc0JCNHVwdGc3MUZ5cW5uWkFBMzhNQnhtVmRpYnVGSytOM2lFMXZH?=
 =?utf-8?B?QVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 04795593-91d7-46a8-dea4-08de1654c0f6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 19:04:00.6560 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e50gnrH4/jEolBPWI5XgNuDlXyv7bPqvaXjO2tDvXBGJvGIDVnE4X2Fd7rzuJjvsWFDdiXpQOl3uzTiGFRx4XQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9422
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

On Tue, Oct 28, 2025 at 10:11:18AM +0100, Thomas Hellström wrote:
> Hi, Matt
> 
> On Mon, 2025-10-27 at 17:13 -0700, Matthew Brost wrote:
> > On Sat, Oct 25, 2025 at 02:04:12PM +0200, Thomas Hellström wrote:
> > > Data present in foreign device memory may cause migration to fail.
> > > For now, retry once after first migrating to system.
> > > 
> > > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_svm.c | 19 +++++++++++++++----
> > >  1 file changed, 15 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_svm.c
> > > b/drivers/gpu/drm/xe/xe_svm.c
> > > index 9814f95cb212..41e075aa015c 100644
> > > --- a/drivers/gpu/drm/xe/xe_svm.c
> > > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > > @@ -1529,13 +1529,24 @@ struct drm_pagemap
> > > *xe_vma_resolve_pagemap(struct xe_vma *vma, struct xe_tile *t
> > >  int xe_svm_alloc_vram(struct xe_svm_range *range, const struct
> > > drm_gpusvm_ctx *ctx,
> > >  		      struct drm_pagemap *dpagemap)
> > >  {
> > > +	int err, retries = 1;
> > > +
> > >  	xe_assert(range_to_vm(&range->base)->xe, range-
> > > >base.pages.flags.migrate_devmem);
> > >  	range_debug(range, "ALLOCATE VRAM");
> > >  
> > > -	return drm_pagemap_populate_mm(dpagemap,
> > > xe_svm_range_start(range),
> > > -				       xe_svm_range_end(range),
> > > -				       range->base.gpusvm->mm,
> > > -				       ctx->timeslice_ms);
> > > +retry:
> > > +	err = drm_pagemap_populate_mm(dpagemap,
> > > xe_svm_range_start(range),
> > > +				      xe_svm_range_end(range),
> > > +				      range->base.gpusvm->mm,
> > > +				      ctx->timeslice_ms);
> > > +	if ((err == -EBUSY || err == -EFAULT) && retries--) {
> > 
> > I don't think this is what we want to do here. -EFAULT indicates that
> > the pages are entirely present somewhere in device memory. This could
> > be
> > either on the local device or on a foreign device, but we don’t have
> > enough information here to determine which case it is.
> > 
> > If this is on our local device, we're always good. This could occur
> > playing mremap games.
> > 
> > If it's on a foreign device, things get trickier. If our interconnect
> > supports atomics we're still good. But if the interconnect
> > doesn't support atomics (e.g., PCIe P2P), this an atomic fault, then
> > we
> > need to move the memory. Also, if there's no path between device
> > memories, then of course we need to move the memory.
> > 
> > Again, we don’t have enough information here to make the correct
> > decision. We really need to call drm_gpusvm_range_get_pages to gather
> > the CPU pages in order to make this kind of decision. Ideally, the
> > logic
> > should be built into drm_gpusvm_range_get_pages to understand atomic
> > migration requirements.
> 
> For multi-device I'm just looking at a patch that considers p2p
> migration and at the same time returns 0 if data is placed in
> compatible memory, given migration policies and interconnects. But
> until that patch lands, we need a way to evict memory from foreign
> devices so that we can migrate to the desired device.
> 
> I would have expected that if memory is already present in local device
> memory we'd have that xe_svm_range_in_vram() flag set and would not
> attempt to migrate, at least in most cases? Currently, if data is

We check whether a range has valid GPU mappings and skip the fault if
that’s the case. However, if a user performs an mremap while a GPU
mapping is present, the SVM range becomes new, but the CPU pages remain
valid. In this flow, the VRAM allocation fails, and get_pages correctly
locates the pages.

This situation is similar to a multi-device scenario, where another GPU
fault handler has already moved the CPU pages to the correct location.
We could add an additional step before attempting to allocate VRAM that
detects this condition—for example, by calling get_pages with specific
arguments. For what it's worth, get_pages is a very lightweight
function; if I recall correctly, its overhead is less than 0.05
microseconds.

> already fully or partly present in another p2p-device memory, and we
> ignore the -EFAULT, then get_pages() wouldn't detect that? Or well, we
> can look at the dpagemap returned from get_pages and retry the
> migration at that point.
> 
> We also need to realize that with multi-gpu, the chances of migration
> races increases dramatically and whether those return -EBUSY or -EFAULT
> appears a bit arbitrary to me? We can't really assume that cpages == 0
> means all pages are already where they are supposed to be.
> 
> My current thinking how to handle all this is the following:
> 
> 1) xe_svm_range_in_vram(), first check to avoid migration.
> 2) (NEW, not implemented yet) if we decide to migrate, first run a
> hmm_range_fault() without faulting flag to determine current memory
> migration status - Perhaps optional. This may reject migration more
> efficiently than if we collect pages for migration and then inspect
> them, because then we've already sent an invalidation event.

Yes, I think parts 1 and 2 are probably variations of the get_pages
function mentioned above.

> 3) Call into drm_pagemap_populate_mm(). This collects all compatible-
> and system pages, and determines what to migrate. If no migration
> needed, returns 0. If racing or needing to migrate foreign devices to
> system, return -EBUSY,
> 4) If -EBUSY evict, and retry migration once.
> 
> For now, I think we make atomic faults use local VRAM only. Moving fow
> 

Maybe that makes sense, but drm_gpusvm_pages also includes drm_pagemap,
so adding logic to determine whether atomics are allowed shouldn't be
difficult either. We need to forward on this information to the xe_pt.c
layer to correctly set the atomic enable bit.

> > 
> > Once drm_gpusvm_range_get_pages returns, we can take appropriate
> > action.
> > Initially, for simplicity, this might just be a bounce to system
> > memory.
> > Later, it could evolve into a direct device-to-device move.
> 
> I agree we need a pass with hmm_range_fault(), question is in what
> order we do this. I think a pass without the fault flag on before
> trying to migrate would
> 
> a) Avoid populating with system pages for data that's going to be in
> VRAM anyway,

Agreed. Whether CPU pages are present or not can dramatically affect
migration time, so it's best to avoid faulting pages that can be moved
immediately.

> b) Possibly avoiding collecting migrate pages and thus also an
> invalidation for all devices.
> 

Yes, this is a higher overhead call hmm_range_fault.

> The drawback is we'd might unnecessarily run a non-faulting
> hmm_range_fault() when we need to migrate anyway. My thinking is, that
> would be a rather quick call, though compared to the reverse lookups in
> the migrate code.
> 

Like I said, hmm_range_fault is quite fast—especially once we get 2MB
device pages—so I'm not too concerned about the overhead.

> > 
> > The logic inside drm_gpusvm_range_get_pages would likely involve
> > devmem_only combined with a drm_pagemap passed in, which can detect
> > connectivity and atomic support between devices—based on the
> > drm_pagemap
> > extracted from the ZDD.
> > 
> > Let know if thia makes sense, or if you have thought about doing this
> > in
> > a follow up.
> 
> In any case I think we need to set up a flow-chart / flow-list similar
> to the above and consider the most important cases and what to do with
> them. for now, I think we can replace this patch if necessary with a
> dpagemap check, whether desired equals what's present and rerun after
> that. We'd probably need that anyway.
> 

Yes, some flowcharts for our GPU fault handler would be helpful. It's
already quite complex, and multi-GPU support adds even more complexity.
We have simple examples in the GPU SVM documentation, but perhaps we
could put together a more detailed kernel doc in xe_svm.c that outlines
various scenarios and what we expect to happen in each.

Matt

> Thomas
> 
> 
> 
> 
> > 
> > Matt
> > 
> > > +		range_debug(range, "ALLOCATE VRAM - Retry.");
> > > +
> > > +		drm_gpusvm_range_evict(range->base.gpusvm, &range-
> > > >base);
> > > +		goto retry;
> > > +	}
> > > +
> > > +	return err;
> > >  }
> > >  
> > >  static struct drm_pagemap_addr
> > > -- 
> > > 2.51.0
> > > 
> 

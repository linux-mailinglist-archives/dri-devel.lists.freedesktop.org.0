Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D535C136F6
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 09:06:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3071E10E5A3;
	Tue, 28 Oct 2025 08:06:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WcjHKWjJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B06F210E040;
 Tue, 28 Oct 2025 08:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761638770; x=1793174770;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=w8rxEViocgUyIEIMWtpxg7CeHHTBzb2dMmDndFLT8xM=;
 b=WcjHKWjJy7DJpKVK9sI7w94z11dY/Z3ICfHUsBtePZJ7WQsdGQt9jVKE
 pFj0GnG5+MLlqwxAMt/PniuW1K6OuSAsHEuuYjYqR5i4DSUTos4ydmnpj
 OGBydod8cCdvROgQrTrrf5ClO2uo/GUbowK72F9o2h06StST7YG9hGWCp
 mMjEWFJVWG9lyWJNihi7WQVzLQkhxfUNZAI4DCZ6k+M95gzMf/tIOEETJ
 Z7J40OkWPMFEiYHBA1wO30kMn4PPL9Wz0wKmQ/sB/nv9MPQB7RRmTjbrM
 9VjsLmKhP3c/aRRp3Jckv0QLulS+WocdS0qJoiXIFIXxtYRlg6mLsqWbe A==;
X-CSE-ConnectionGUID: zZqyuhHXT8imA8VI68mRDQ==
X-CSE-MsgGUID: G6qzDI2GTVeaTd2rLXSUag==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="75178341"
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; d="scan'208";a="75178341"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 01:06:10 -0700
X-CSE-ConnectionGUID: bMv1KavaSqi2nQKXvy9ADA==
X-CSE-MsgGUID: ggZte1F0SOGl4TIOt+Oz/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; d="scan'208";a="190475911"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 01:06:08 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 01:06:08 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 28 Oct 2025 01:06:08 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.71) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 01:06:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XQNTVvembFKN728bITMrowYN+OxrOJQkHC05Q1OpIWmPo2HctPCZw4VMXwNdEyOm6ghauzsHZj5qOmWIKCTK9+cVYF5RXRlpPLqEdxrEW1chqRgM6aFnbc0T3lbh7WQW0I4Yt35infJMOCPne9J6+dMaT5E0RKz0YGqyeeC2juc0h7T5vwLSa/DIPMdSi++JKG1zjAMa7MR4FdJ+LyVXjVjEftTIukMuwnPJaN7ygqRKyU8AameQZDxtJ30sNsrTua2YrMq0ckz3b8UAyNYkjYX77auEO0h28732cQO2i6CQd7H8r0ctvJyCAD8fbixFCLdYp1CZ3lALAn+75LRwcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r9P20Z5h+Hfqry/axVAyyTOHpx8eVDHCLNRWJv2u/eE=;
 b=T888p3cJEBkb9t65j2Od+2RelhXKsI7Q1lFbF3SiZJXISm3R+EX/9JEJOE9kbMP7ksCTA23XPjO0dW7fQv9seSw1tx3kyRTpPacnP9Dvk/tW5EBy/yY2ftkoE/wsO2AFt5m2bAwTn/5yxxRkFY8T75Poeq3kyXM/tOcUcNfHfxBTeKe87rMrD71f1X5AHkHhKK5wh17ZvK/9clibylEmUV061cenamZW9rsnsQ+CH88F+IHacUwFtcYbrVn1rEZ1ctq4kOtMTNYHUjz+P6DFkR3XiX65/ebffwp9AyOzCkkYjgoI487tYVS3CgYFMu+CRDUWcKywwaiNif3eaCbb4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CH0PR11MB8192.namprd11.prod.outlook.com (2603:10b6:610:191::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 08:06:06 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9275.011; Tue, 28 Oct 2025
 08:06:06 +0000
Date: Tue, 28 Oct 2025 09:06:02 +0100
From: "Winiarski, Michal" <michal.winiarski@intel.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
CC: Alex Williamson <alex.williamson@redhat.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, 
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Jani
 Nikula" <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Laguna,
 Lukasz" <lukasz.laguna@intel.com>
Subject: Re: [PATCH v2 01/26] drm/xe/pf: Remove GuC version check for
 migration support
Message-ID: <eogx5ttdbjbqr44ezsgapzkk52ni5qrxzd7idhh75wkahkqtdb@viti7syvp2li>
References: <20251021224133.577765-1-michal.winiarski@intel.com>
 <20251021224133.577765-2-michal.winiarski@intel.com>
 <BN9PR11MB5276FD0CBCA1AF1E63351A188CFDA@BN9PR11MB5276.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BN9PR11MB5276FD0CBCA1AF1E63351A188CFDA@BN9PR11MB5276.namprd11.prod.outlook.com>
X-ClientProxiedBy: VI1PR04CA0052.eurprd04.prod.outlook.com
 (2603:10a6:802:2::23) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CH0PR11MB8192:EE_
X-MS-Office365-Filtering-Correlation-Id: 689d241f-8b0e-4a1a-2b26-08de15f8d87c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VGd5QlMrRzJMY3JDNjg5dnBsemx5bFA3cytldmJ4eGdBYUFyUWF1eHVPbzAx?=
 =?utf-8?B?V0ZYR05wZW8yV3J2U1hzZllaNEc1M1pYV0huVllXNUl4RVJRQ2xOT3A0Nldn?=
 =?utf-8?B?eHBwT0lxbkk1azEvQUFuRnpUVFBQS084WUVJT1prbm5pUVNhS2Rob0ZDUEpJ?=
 =?utf-8?B?R0pwRjJQbVNRb1B1dU1yc1ArSmo5TnpHbXlJdk5TMnFkS0dEeGZrSGowYnFE?=
 =?utf-8?B?WVJYNXVDbDJjb3hGL0JDR1lDcm5rM0U5dmtXWXYzYmprNlI0Rm5uQnQwL1l3?=
 =?utf-8?B?cXA2ZDRKeWZuWEdrbDFqSWdkNFl3dzlReXR3bWhOTUovTGV5aFBTVklSV1hv?=
 =?utf-8?B?cjg4RUFwbkxocExsMU02anI2TFpYUTk3M3c0WE1TRUZrNmRicFdycGxVRmRK?=
 =?utf-8?B?WHp6bWVpcE9LYWYySUJOa2FxWURRY2dTZDFYS2ZNKzJCOHVwL0YwOEdFQkJ6?=
 =?utf-8?B?aW5YeU1vdVNOTWVnTW9OY1lvWDdsUCtEKzFPZjRWUnVVZUh4NXM3elY4OXNL?=
 =?utf-8?B?dlhJRjBZKyt5cDN1Wk1qSFhCeGxLNTRxaEpFZFNtMzF1VXdjR01yTURCemZY?=
 =?utf-8?B?aGwyTTgwZk81QUZQQWZrNzBXbHNYd1R4aFpjcW80cjZVNVdpZU1aNVZMSVZT?=
 =?utf-8?B?Y0tvQ3cvNzE3SkRUQzUxOWRHY3BHOU05MlVVT0JxRjJLQmZ5WFgwbDNrdFRI?=
 =?utf-8?B?eTlmc0VsVHluRHkrNDRYYmQ3emZNNWE3NXpLZFNzcHl5MUJhM3I3VlEzK0tn?=
 =?utf-8?B?L2cyWDVNdFdrZmZQWnpDRHhCemlncFBvL1ZPT0VnY3NtNnNzc3hNd3ZsZzJi?=
 =?utf-8?B?RGN6UTV0a0RpS1VSMXZ0OFpjN2xzb29Za2RSUmFITnFmT1QxVk5KMTI2UnBO?=
 =?utf-8?B?VCthWGJIM1plNllYUFdnQld1SjJibkxBVGtOK2R0KzJZS0VrVEtQOTlac21E?=
 =?utf-8?B?L3Eybk16RFdTSG9vTEtnT1RhR2hwT1I3TXRWWSt4azUyVEdYNjgrTy9UTlVx?=
 =?utf-8?B?V252WWJpSVhYSmlzR29YbDFkMER6cWJOL3JBbys5dE5qa2JIM0xWam5uM2Jt?=
 =?utf-8?B?djROYXh4MjZQaWVNdWpFb2JSQ1doVmorNWZnUElQN1c3RnVuTERPaFp4VjJU?=
 =?utf-8?B?alQyaGNBWFZQV2p1Z2p5dnYzbGhvNjZkUHdscGlVNmxPVXNOQk5zSTJYVE1p?=
 =?utf-8?B?eXdPalZhdVMxNUJjRGlJM09ubFdMakxVUHdyczdaM0hkNGJ4N05rb2NBSFg5?=
 =?utf-8?B?dkU3dGVuZ0dTZzZlQjRsV0hIenVZTWhXNXB4Y0hua3oyNmxpTHVub2J4Z0lL?=
 =?utf-8?B?SWpCaGs2Q04rakdoaTBxaFF4NVY3KzVFbzZwTk1RNmJHbk01VHJ2QXV5TFFu?=
 =?utf-8?B?QVVQK09uenRscGc1RWozV3pnaU5DbWVzY21LcndWMmxtMVpDNy9Fd2ZzTGRP?=
 =?utf-8?B?TGhkem5iUlc0U1V3ZVlxWTA1VmJFa1hTbG9HL1dVMkJZVURUR1RZWTJxZkZX?=
 =?utf-8?B?dWdZSHJMNUZxY0pGQUFTVjRlcTlDTmpsQWZ1d0t1V3UwV1hPd09vdGlLTnln?=
 =?utf-8?B?eWxHTVFKNUpHZTBZdnRVd1NZc1A2TnFtdlFHRndCVmFHNWx4ZmkxR2d3MVEz?=
 =?utf-8?B?R05WeWVtdXVMZmhMeWdEUXJxMmRkM2VkeHlWU2h0bDN5V0RPWmtuWFN4Rmtw?=
 =?utf-8?B?dWNRWlFIdUY0NFVzRmFTcHA1SVNabktOaUk5Umh5cXhhVjJERDR1M2tldHpP?=
 =?utf-8?B?eW52WFczY2VxMEpwdXlISmV4WS9LSTBNY2ViOU50K2RXSjlVNHpFc3VoVzk5?=
 =?utf-8?B?bUF4aVNUM0hwSVFZRmsydnV0d3Y2dWFlN1ExSyszTURVUVZ2UGhpdlhYMC90?=
 =?utf-8?B?NWtmWUwwZGtLN2ZXa21jV1RBbHBUeHg0c24wNDJRckJ1WDNSUXlwUERWNmdX?=
 =?utf-8?Q?2xfPEhI7bb6BvlMLEc1nrwVdGE4RzXTO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bVZrU1RwN0FJQ1RWbVJiaStvN3E0SC9teWxyZldmVG5DejQvemJwRmdzckVw?=
 =?utf-8?B?QTczSlN5WEg4YWc0ZXlqV0hMenl4MFYzSGhlZ29yazI5K0ZhV0U1U2U4cCtv?=
 =?utf-8?B?TFlRT2ZrVVl1N0t1Q2RTcUFpbGd4RlNEQ3FhSnBlVHNWRHg2S2Z2MVRmdWVZ?=
 =?utf-8?B?S09la01EUXRaYmdodHAvTUpOdENTL2M2VWc4dzluSS9WdTVTMi9zMmpZOHM1?=
 =?utf-8?B?clJKUVhIQXBxa3lJREFRaFd1Qyt1RmRuNzNIZ0xSblNxUUlFanZIb2lBbm13?=
 =?utf-8?B?YW5aV3F1WnBieHc5d0xVREZXS3VQZ1FGd3dvWDgySTlhSmN3U2JkQWVSZk1V?=
 =?utf-8?B?RGFWeFF2N0NQaVBYdXpBMnB3WHlaWUZUa0VBS21FNFRRYUF4YUNsWlN4Q0VT?=
 =?utf-8?B?Tk04bkVuQ2IvdlU0QjlJc3FWUWJKTnJqbDhpUGlDMlYzNDE3eDc5OWxWU2RK?=
 =?utf-8?B?WGZXUXNVUjM1VW5WSWpyMmZoaG5ySDFXUXh6L0swbHNvS0N3ZlQwb3MxS1pM?=
 =?utf-8?B?eGZNRzZxMTgwMHdQOUJoRVpBRW9SZUwxbWZEZjY1Zjc3cmxtMGFFeHB0WnNX?=
 =?utf-8?B?OWhndThqb0tiVWsvdnpPRmRYN0diRnlNa1Y5NG1XZW9HNkFQMjFOTVdHdzVC?=
 =?utf-8?B?Vk9QTmJmTVhkN0I4cWMyV1RTbklWc2pZRWJ3V2NrRTExTFUwbkxNbFprbjlz?=
 =?utf-8?B?TjM3N1VzY0JEcEIvYmVQSFhyczNNdURnbHliZm5SMG84TUVTa2hoVU1hWVpw?=
 =?utf-8?B?REtFMnJvWWh1Z0NhT0ozUktxZDByM0lCZkVCYXRBNWkvN1pYbzlsajh5TE1o?=
 =?utf-8?B?VFl1eGtSVXUraEs1TytFSTltWjQ5NUlhRDFaQTlqcGhySm1IR3N0T0hSZ1g1?=
 =?utf-8?B?L1Z4K3VtbXc5aHB3VmVpODNlOEFOaiszZDVFc3NIcGtYNzdNK0gxaXNGZWJ4?=
 =?utf-8?B?OFZscWlFVGlpYnZvdnljSzRvbmM2RUpOb2Q3V2s0QzFTWmFMZUxjV0djTWR2?=
 =?utf-8?B?ZVIrK2l2UzVRcWpDc1IxZUIvVU9hUlFpMnp5NUg2eGpPVU0rbTVvVkhNd0p1?=
 =?utf-8?B?VmtqejE5VUtjRUhXMVVEUUJnY2MzcjBrSDViaVpFdUNySmd5VkhvY2pOMFJC?=
 =?utf-8?B?cmdzQ09rc0N4Smdqdkh2KzgzV1hmaXlYRGx2bXVpRVhOYTNGODBocHB2dlQ3?=
 =?utf-8?B?RDQ3cWM3V2FxcWdJLzlUc01QMHFmZkhsZzhNdUNVNC8yUjlxOEwrNElkYlJU?=
 =?utf-8?B?VHdMVFRKTHc1U0h2NC9iQ21DWDRsY0xyTWhUYVpSa1pYTmdoRUhXamRad0JG?=
 =?utf-8?B?VU9URGZqdlQwOUU2bDVUTmlQRDBvVkx4a0F3VGJvZjIvWWlSbFlsOTdLODBI?=
 =?utf-8?B?Y09uTnBrcnlUQnI5K3RjbGRSZ0diei80am80Wjc1M054OHgxTjhMTlZ5MWti?=
 =?utf-8?B?VFFlKzRwekhZM1d2N2Z3Z21rcWxjZ1p2UWFqQmx2eXhKOGRZY3h5QVJqQ1NY?=
 =?utf-8?B?ZmtIbWp2cmFnd29XYWwzRWRhK29SSFA5WFJ3TFRkVStCMk5WYzlhMGNrUm1C?=
 =?utf-8?B?WmNJWEhwSEl5S1AxOTBSWjc2WVBrdkJDSHF1TjlRbEJWMkFtdjVGMnRLbkFl?=
 =?utf-8?B?Nm1ORGRjVnlyRW5ZVXpxbHRjeUhkN21TVDQ5Tk1paStrTGRVNUtLTU5rZE9T?=
 =?utf-8?B?WEVJdys4Wk9mTTV5bWJmbkczTzZUdm8yZjBQempDZW96TFE2TTVOczVqV1px?=
 =?utf-8?B?cnNlUEx5Y3lGVWY3N21hUUNobXZ3dDlkeXgwMTVhMzYrOFV2OGFUckRyYlR5?=
 =?utf-8?B?RFJKZkUxYlZadzNYclFHRFdaWFFTS0I2K1ZlQ1ZramthS0xXOGtDRTcyakdG?=
 =?utf-8?B?bVIwY0lqMUlBVU9VRXFjWTNNOE1RM2p6cWg0K3VXNWd5K05sTlNOMEI3Rk5t?=
 =?utf-8?B?UlFBek1lUlh6eThMaVUya0s5UjVHSVN0ZGdJMDBRQjVFNWFEZzZsV2o2T3NJ?=
 =?utf-8?B?Q2tUQWlTWnNQQTZZUCtBZGE0OGJYeEkrK3lueFpUbjdmVWFCNTdSWGtjMTh2?=
 =?utf-8?B?Y2QyTXB0bi9zTDlKOUxWMnlEeXdlU1Zoa0E4SjVHZjV0cTc1c3crQW1WeTJK?=
 =?utf-8?B?N2RHd29lUVJPQW9wMS9yUnkxYnl4bXdmcHg2SmJKdGF0ckVLMm1FN3VrNnNY?=
 =?utf-8?B?eXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 689d241f-8b0e-4a1a-2b26-08de15f8d87c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 08:06:06.3286 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ha0+PNVIbma7XTSCDqIibsbAIUOx22n/WmObXoyXy/Eb0S1N1LEu9c3MOu7ZT70MHQjLDdidfBeAw/NcTEDB+Ue04arTwZGHFra2yuQxN/w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8192
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

On Tue, Oct 28, 2025 at 03:33:22AM +0100, Tian, Kevin wrote:
> > From: Winiarski, Michal <michal.winiarski@intel.com>
> > Sent: Wednesday, October 22, 2025 6:41 AM
> > 
> >  static bool pf_check_migration_support(struct xe_gt *gt)
> >  {
> > -	/* GuC 70.25 with save/restore v2 is required */
> > -	xe_gt_assert(gt, GUC_FIRMWARE_VER(&gt->uc.guc) >=
> > MAKE_GUC_VER(70, 25, 0));
> > -
> >  	/* XXX: for now this is for feature enabling only */
> >  	return IS_ENABLED(CONFIG_DRM_XE_DEBUG);
> 
> why putting it under a debug option? Now you are sending formal
> series for merge, assuming good quality.

The need for debug option is removed for specific platforms in Patch
24/26, but I will drop it completely in v3.

-Michał

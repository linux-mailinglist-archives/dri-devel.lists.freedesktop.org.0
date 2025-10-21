Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C7EBF9136
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 00:42:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FDE610E64B;
	Tue, 21 Oct 2025 22:42:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bDBI0UPd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17BE610E64C;
 Tue, 21 Oct 2025 22:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761086553; x=1792622553;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=TGkR44qN2DoNy6mpLqkgR5QKxW1Qkbi/B8dm2FfJFKA=;
 b=bDBI0UPd0l94clmuyC8m4wV4gE1jvDAAr7YnvzosLc6olnBIEpwsm/DM
 pVY1edQI9maVMVOL2J6gmMxGOb0/bEvmIbBEPzYjnHrwWE+EW7e5Wb+hP
 4Vkfi61CkaGnRTxJ+1lXBqCxAWHW9JNLLKv72L87ITdqdzo/Ih/EiDhA6
 hISOrmwIZUBuvA2jZ4AUMsXw6HLdFGcJzNGiSdo7U3olZxGEO0iWvnRfF
 ynV/x9IkIcn/WWiYkAuswnWS7nvPMFiLZQleUVOh4XY35Xvlkq0Dvp37A
 8qP8iJL7Z6KOIyU6C6W53Rm0TgqVvqGghs6notAx1mgFoSuoeMI1QLFgJ Q==;
X-CSE-ConnectionGUID: UhCB6UTvTOCYhY+Z+ixVfQ==
X-CSE-MsgGUID: lavMKBkyQnmtQRDWMX1l3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67088848"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="67088848"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 15:42:33 -0700
X-CSE-ConnectionGUID: +avmrByzR1i1ltQGs9nlrg==
X-CSE-MsgGUID: 2mfmoJr5Q9SEplCTGRJRBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="188988479"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 15:42:32 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 15:42:32 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 21 Oct 2025 15:42:32 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.5) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 15:42:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vHfgJ18KXOqlfa+4o5LyuhqqsrwcDNJUjmoAk+BpG/bF+TavjNiVARa44lWZt7lJtmoiIs4AGTZSnZeOCBcEx7Dx8YgK9fbsq624Oy5jimWwptfP6FxJeYkvLDY2AtobTcV7YCzSNnD+M50CC/Ihc28Hz8ed/oBQ7DmaRjjZD5y1E9wvInHAFOiLP/99e7vaWXi+fwgKnfsCJiPaADK648/Bg81B1z+SM9MaqkKq6nym/tIs/uSf0wbnd+TabaPcr3lzxQLxGbJzUkNMsZjTpszLL9jI7Vasy1hStrw7mNNHR/dSHrdiuE0bwZHi3Rq044iISl40uZCMEAavW4F+Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mACTcjUkUBoWInY9xKsVEBolLBSNmkVSeGTAadlbccY=;
 b=tn4+pUXLe18AYhqnxQxyrqUPaubCUdOI75PUO2bvsx5Swe3g+u4wCh7gM+ubvsgWPkJFvfdnDnZcmpDhH1S84Dw6aloetlreyvBITR77XoBUeIc4jsugGbaHqzBkN8eb8z43WQ/OebS7sASCtj8VXw/emke+ImDPcUTMzdGa4+do3JYV2JtfysbJrlQyPG6fhw5VDVYSSjIVPiRZGGHPN2POkMEhInasrxQQc/L4qEfgDYV0WQFu4eIkBHPxctRqZgolNHXIONcmjin0sOB3/J1BidzbEo6JB+SY7UPg8n4y876Gprr2m8Sst570gh6I0IU3bUyAk4E+t/IxnSIv9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH8PR11MB6753.namprd11.prod.outlook.com (2603:10b6:510:1c8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Tue, 21 Oct
 2025 22:42:25 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9253.011; Tue, 21 Oct 2025
 22:42:25 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>, Matthew Brost
 <matthew.brost@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH v2 03/26] drm/xe/pf: Add save/restore control state stubs and
 connect to debugfs
Date: Wed, 22 Oct 2025 00:41:10 +0200
Message-ID: <20251021224133.577765-4-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251021224133.577765-1-michal.winiarski@intel.com>
References: <20251021224133.577765-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P194CA0029.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:803:3c::18) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH8PR11MB6753:EE_
X-MS-Office365-Filtering-Correlation-Id: 55c536fd-1028-456b-35f1-08de10f31ae5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZTFPMWV1azVTQ1N2eU5sZFdmR3hWcXpvYUhrQ05iNmUwOVZUKzVEM3hMQXdo?=
 =?utf-8?B?ZENRS0VoNVIwTDB0eXB2S1pDalgza3VrbG1HRFc2Q01mQzFqRk5PZGxxcXhI?=
 =?utf-8?B?WWhPSlZ2YUI2dkdxN0RnMzA5bmtvT1R5a2hNREp6VFMzOW10UDB6WEZRZVA1?=
 =?utf-8?B?alkzZjl3NTdDWTczS1lBVmFvK2RDVGJwWFlBWDU3OEsvMmo2YVAya2dVeUo5?=
 =?utf-8?B?NUpEMG9WcjdkMXF0VmNVUUZUSXlFZWMwcVRiM2dGdzRoN0M3OXl2bEZ4ZnVj?=
 =?utf-8?B?ZUs2dUxXY3I1d3d1OEZoUHcySzZWelFUSFo5b0c3YTFhOHN3QlNnWlJxTlVy?=
 =?utf-8?B?clh5MmVpZjhVNzVobVgzTnZMRDkzTk1CWEh4QzZQc1VJU2dCMGJuWG1HM2ls?=
 =?utf-8?B?VUo1eFFVei96cjljMitVMjVaMVZLODRnZHVZYndLU01kcEtZUjlwKzl6V3gz?=
 =?utf-8?B?SzJSaVpKWDNqZ1Y2TnlLVWpjWjNBYzF1c09FSHhacGYzNnFwUDNBM1JZQzJv?=
 =?utf-8?B?UWd0enlvUU0wOS9ML1B1dVVLUEtOUmNmY215SHE4SDV5SXNaWFJxcnB2Z1Za?=
 =?utf-8?B?ZU1BbEJKMkhZSks3N3pmck9jemR3d0ZSZ01tN0EvUXc0Y204eXEwNVhIZVoy?=
 =?utf-8?B?NWxSenczd2FiWVFnYzhmODUxYlZXcVRBMTFBZDNML3ByWnBTSG93dkE4WXBU?=
 =?utf-8?B?UXk0M0p6dFQ5cTVFTGs4YnEvOHl5eXNyRGlHMFBXNTExUHFWdGgvNG41dUZk?=
 =?utf-8?B?VGl4MER0eW9leVk5Z1o3ZWRXMWZoMGNtMS9zdk14NlhFQ2Myei9oczJYUWRV?=
 =?utf-8?B?MlJjcUxTc0YvcE1iaE9qamRscXZ1TmYvYmpCWXUzWGhmWVNEVllvUUZ1MWto?=
 =?utf-8?B?cGNWRnZQUU5IalM1OWR4MTcva2xMTmcyM2gycy9PYjk0WWFhK3BPdnJSa0hm?=
 =?utf-8?B?RnJya2YrbXNhZmxobWltV01IMjZ5SmhqREt0RDA1cnF1OTdDWjRXWWRqZFN3?=
 =?utf-8?B?YWJQWVpwLzgyNmZra25XeStKelB6Y1RPTW5rcmpQYmI1VW1vU3hLVGFiMmhJ?=
 =?utf-8?B?a2QxMEVybTlGcHI1S1BIVmNXTUhOckE2T0YyMWpES0I4MityVktHSXBPOFl0?=
 =?utf-8?B?Rk9mUjNCUTY0cTc1djlTd2MwdVNQNzhsUHpSb2NuT1RQamp3ZjZyNXI2TGIw?=
 =?utf-8?B?MGRLZG5vVWxzSXVRUmhFaDNKNFY3d2tPYzVJWXZDd3ZiRERhQ1U1d1RST2VO?=
 =?utf-8?B?cjRORDdSZXNFMVl3eVNKY0x1dHVtYWxNeHZwb2xFMmt6L0JLUDlZd1Z6YnNj?=
 =?utf-8?B?S0lldy9La2ZXZkpjalpFTHlKaGVvcm5qZ09Bc3d3N2F2Q1hjRmJEN1FvZURy?=
 =?utf-8?B?S0RpNVF3YUtERUg2ZXFSZ1c5UnN6VHpzU3JBQUR2UXFHcE0rYmNXZEcwVEZV?=
 =?utf-8?B?MTU1SmltZGttUDdHTnkxbkZSaHBqNE1PN1J6VzEwL2lLMjcyZGFoMCtMMGVY?=
 =?utf-8?B?Qkx3V0FMbEdQY3NmekliYnBURUR6TXVoR3FCVUFlLzdocGg5cWk0VXVuMXdD?=
 =?utf-8?B?MU5MVmF3a2pJMloxQnJ5NlZSVVJ0aUdDdTVjejhDRjd2Qm41SkdqYzZmRjlR?=
 =?utf-8?B?Ukh5VUNRODRqSExhSExnUXg5SVZVaFNSb292dm5od1pPTU1VQUU2YVVmZlhv?=
 =?utf-8?B?WEZ0bnV5c2pTRHllNitGbWxoVkZNbUxwZ290VFMxM3dmZkRrdjJrRTAwR3Fx?=
 =?utf-8?B?NXV5cENxSFpXOHN0ZFBhbWlqTE9VVkZGU1VsUG5ZdXk0K1hBN1FQTzN6ZTV4?=
 =?utf-8?B?V2h5d0Eva1c0dy9KMHRYYkZ2T2tCRGhYcFd1L3dZYTFYajdURVFiUlNiYjZr?=
 =?utf-8?B?TXE2cFdadER4MGhCV3NORDNYODJOWkl6M2RWY1pUbXJoNk1yQXNRZTdrV0Y0?=
 =?utf-8?B?M2VPOGRBemxCTnlEcFZJcjd4V0hrR00rdk5jcWVQcTA2S0M0TE1CWloyMUxZ?=
 =?utf-8?Q?9Tg48Q8n6w/INkjYZxCyN73d6QtNds=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1hxV3dKQUZLOG9DVHdidExUYnRGYlJSRHMzZW56YThCbE5nV1pOWXdtdlFD?=
 =?utf-8?B?clRjMGViV3J0OG9JR2pPQmRGcmZPVkdpdXR4UlBwcklPNUFNNUpkSDVkZ0xL?=
 =?utf-8?B?SGpMdkdLUXpnTkpWZ3hNbGJoZzdlWkJCbWt0VzhxWWtQK09rWVhIY0daYnlP?=
 =?utf-8?B?SmtxVmdqV01aVVdZQTJYQ0RrSkhQQ290WXpvOHZLNFRiYkFOamNFbEEvTm54?=
 =?utf-8?B?YUhZdHBrS0ZHOU9zSDVwb3lVOWNEaVJUbTV0TW4zcEtUVUR0V1hmem1GcHVD?=
 =?utf-8?B?Y1p2WjM4TGNLeWo0SGNONW12OVRSZ0RteHN6Z0FjSHBmRWQxdDNZVzJxWUhP?=
 =?utf-8?B?cDBSbmxCTVNYd1Bqa0dqOGk0L3U5Z01qNDBsejB6WUtsSGZ3N2hteDE2bHh5?=
 =?utf-8?B?NGptVTBzT3Y1ajVpY1BVUHNkSXZrZDlZZ1hCSWRZOUJ4dzR1QjFLdmV6K2Jx?=
 =?utf-8?B?b0FISGIybE85ckpxWkNEek9JZ3dzYnZmL0MvSnI3THR3cnBBRkk5Zkw3MXBL?=
 =?utf-8?B?TG4rRzNuSklnbDRwbFR1SUdsSlFveUtCR0hTRDdYVU1mK21xd0IvNmc4VEcv?=
 =?utf-8?B?eXhqUnQ3Q2Yvck1EUXBDbkVncTVtblR2RllWdzdnVlZ3UFFaVTVraXlBdHVy?=
 =?utf-8?B?RlkrL2FzZ3l0L0xjZnNYM05pNXc4RHhOOUpvQXAyY3hNaDRZeTZGME1Ca0F5?=
 =?utf-8?B?bmltaEZvSnFlTkEyWVQ4M25Pc3p4WFErUEgxQ1VZWVdWemsxTUxudUV4NnZN?=
 =?utf-8?B?bjRFQTFWa1VHVFZtMHJtdEVreTIyS0RNSEx1OHZVVjl4RVRqYjFyN1RzNmx1?=
 =?utf-8?B?ZjNDdVM0Mk8vZnRBUzZ6UEt4VVQrUXpWeWtUZFpPSkJWemxBSklRTGhyc2Vo?=
 =?utf-8?B?elYxNFM5TmtKNVd0WWVrWXZZNEVTRHkxZkh2dmhOdlk2VEN0VUJjLzNkYTdG?=
 =?utf-8?B?aGIvQW9GVUFHS3J0bWozZnAxR2gwc2ltb1FKcjNoRkpOVUYxRU5ydzBzMzVz?=
 =?utf-8?B?bTVpK3JENllHWlhzUFFqakcvOEhNR2JONTZLWGQ0M0FoaXRBL0FzNTQ3UWtX?=
 =?utf-8?B?aFlqWXdjQ1RwZG44ZytKNHVYNXNQVlFXajBFU2pab3NCNDd6ejZlUVYzK0g3?=
 =?utf-8?B?YzNSTWFzTk1SaVF6NnRac3BTb3E1ZGQyaFM0YW1QbS9qRVQxOExNVVd1ZGcz?=
 =?utf-8?B?NDN0d2hXcERqcndFSFE4ditpcEw3WDNrVElQbUU3c0xPd0x2akwzZ2pYb25C?=
 =?utf-8?B?c25Ua2lkOENMZDFxUUJqTTU3QUQ1bmwzS3NXY1VLWTJHTlR1M1ZBMXB4Q0F4?=
 =?utf-8?B?Zm9ERU8xaW9udkFUeG51TFRoTldqSHpIRzIxTjNTK2tvL2s0dnhjME13bFky?=
 =?utf-8?B?Z3JXN2FLU09WNWF0Y1lJVkVGRUhaV05Nd3Z5Q2JaVTdNdHE2Z0V1c3JYRHpx?=
 =?utf-8?B?b1hqb1NjM3VEc2dYczVQRU9RcDNlU3AxTnIvRXJielpTNWVNOVNEcHV6UWZz?=
 =?utf-8?B?ZGc2cGZhY0Zac2Q1bGlLeldtRTlTSnlOem5Oc0grQnRJZGhZM2hRTGJZN0M1?=
 =?utf-8?B?SzRHcHE5enJVc3B2WkpTN21BUi9VdFNYUDRvYjZBNnZMU0IxWkFHTGdVZ1VT?=
 =?utf-8?B?TkVYUlZCWk9zcTdtbEI1clA2c1h0aDNQNHNUQVc2bnpFMlpxM1NkNWVOMW5Z?=
 =?utf-8?B?K09Xd3JjZkIzY0JGcjVPZ0o4cXpsNkRRdDRXNGpJbFRCRkRna3B4VWRsRUd1?=
 =?utf-8?B?ZUJ3YmFSdkZ1ZmNqalNHWnk1K1pZZXpHV1FvNDNaejNGaGl3ZHh3NHZlUWE2?=
 =?utf-8?B?MWNsdWRGRWI2VVFYODNaUHFoQUw4N2NTb1ZsRnJpa0R2MXhBTTJheXpIMzUv?=
 =?utf-8?B?R3B3SXZtcktyYTB3bDZqL0FqaE15bjM0S09KRW9memlsSlpZdTJrelJBUUVz?=
 =?utf-8?B?R3liZWExVUV4RFhMem9idGQvanRaVWtKbEV3RFNVSTdMcklEOUhvc0dxZnEx?=
 =?utf-8?B?MVZ0Z01pSEtiQXpnSkFTME84bjhkbTgvT3RMeFprN1M0MVdQTlZxemh3dVRk?=
 =?utf-8?B?dERSbUtVTE9acUQzWVhlUUJrTkxZYkYrckl5aFRjVHNNT0c5cmszMVBzNXIv?=
 =?utf-8?B?clRBbGdKU2JUR3Z4Q0FRY21YNHB2QkNKYmlYbEFzRjBzTFQwekxDc3BqNmNG?=
 =?utf-8?B?aUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 55c536fd-1028-456b-35f1-08de10f31ae5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 22:42:25.0241 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sXz5+AWjjU+cqku7Isz+cozx7AZwFeREO6kqO9di4x4eOaaNT61qEtJC+F4i86CAydOtPmyY4WU3Py0q2gUFJLo76v7XQKQupQRgMjYSnDw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6753
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

The states will be used by upcoming changes to produce (in case of save)
or consume (in case of resume) the VF migration data.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   | 248 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h   |   6 +
 .../gpu/drm/xe/xe_gt_sriov_pf_control_types.h |  14 +
 drivers/gpu/drm/xe/xe_sriov_pf_control.c      |  96 +++++++
 drivers/gpu/drm/xe/xe_sriov_pf_control.h      |   4 +
 drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c      |  38 +++
 6 files changed, 406 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
index 2e6bd3d1fe1da..b770916e88e53 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
@@ -184,6 +184,12 @@ static const char *control_bit_to_string(enum xe_gt_sriov_control_bits bit)
 	CASE2STR(PAUSE_SAVE_GUC);
 	CASE2STR(PAUSE_FAILED);
 	CASE2STR(PAUSED);
+	CASE2STR(SAVE_WIP);
+	CASE2STR(SAVE_FAILED);
+	CASE2STR(SAVED);
+	CASE2STR(RESTORE_WIP);
+	CASE2STR(RESTORE_FAILED);
+	CASE2STR(RESTORED);
 	CASE2STR(RESUME_WIP);
 	CASE2STR(RESUME_SEND_RESUME);
 	CASE2STR(RESUME_FAILED);
@@ -208,6 +214,8 @@ static unsigned long pf_get_default_timeout(enum xe_gt_sriov_control_bits bit)
 	case XE_GT_SRIOV_STATE_FLR_WIP:
 	case XE_GT_SRIOV_STATE_FLR_RESET_CONFIG:
 		return 5 * HZ;
+	case XE_GT_SRIOV_STATE_RESTORE_WIP:
+		return 20 * HZ;
 	default:
 		return HZ;
 	}
@@ -329,6 +337,8 @@ static void pf_exit_vf_mismatch(struct xe_gt *gt, unsigned int vfid)
 	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_FAILED);
 	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESUME_FAILED);
 	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_FAILED);
+	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_FAILED);
+	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_FAILED);
 }
 
 #define pf_enter_vf_state_machine_bug(gt, vfid) ({	\
@@ -359,6 +369,8 @@ static void pf_queue_vf(struct xe_gt *gt, unsigned int vfid)
 
 static void pf_exit_vf_flr_wip(struct xe_gt *gt, unsigned int vfid);
 static void pf_exit_vf_stop_wip(struct xe_gt *gt, unsigned int vfid);
+static void pf_exit_vf_save_wip(struct xe_gt *gt, unsigned int vfid);
+static void pf_exit_vf_restore_wip(struct xe_gt *gt, unsigned int vfid);
 static void pf_exit_vf_pause_wip(struct xe_gt *gt, unsigned int vfid);
 static void pf_exit_vf_resume_wip(struct xe_gt *gt, unsigned int vfid);
 
@@ -380,6 +392,8 @@ static void pf_exit_vf_wip(struct xe_gt *gt, unsigned int vfid)
 
 		pf_exit_vf_flr_wip(gt, vfid);
 		pf_exit_vf_stop_wip(gt, vfid);
+		pf_exit_vf_save_wip(gt, vfid);
+		pf_exit_vf_restore_wip(gt, vfid);
 		pf_exit_vf_pause_wip(gt, vfid);
 		pf_exit_vf_resume_wip(gt, vfid);
 
@@ -399,6 +413,8 @@ static void pf_enter_vf_ready(struct xe_gt *gt, unsigned int vfid)
 	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED);
 	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_STOPPED);
 	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESUMED);
+	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVED);
+	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORED);
 	pf_exit_vf_mismatch(gt, vfid);
 	pf_exit_vf_wip(gt, vfid);
 }
@@ -675,6 +691,8 @@ static void pf_enter_vf_resumed(struct xe_gt *gt, unsigned int vfid)
 {
 	pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESUMED);
 	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED);
+	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVED);
+	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORED);
 	pf_exit_vf_mismatch(gt, vfid);
 	pf_exit_vf_wip(gt, vfid);
 }
@@ -753,6 +771,16 @@ int xe_gt_sriov_pf_control_resume_vf(struct xe_gt *gt, unsigned int vfid)
 		return -EPERM;
 	}
 
+	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP)) {
+		xe_gt_sriov_dbg(gt, "VF%u save is in progress!\n", vfid);
+		return -EBUSY;
+	}
+
+	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP)) {
+		xe_gt_sriov_dbg(gt, "VF%u restore is in progress!\n", vfid);
+		return -EBUSY;
+	}
+
 	if (!pf_enter_vf_resume_wip(gt, vfid)) {
 		xe_gt_sriov_dbg(gt, "VF%u resume already in progress!\n", vfid);
 		return -EALREADY;
@@ -776,6 +804,218 @@ int xe_gt_sriov_pf_control_resume_vf(struct xe_gt *gt, unsigned int vfid)
 	return -ECANCELED;
 }
 
+static void pf_exit_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
+{
+	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP);
+}
+
+static void pf_enter_vf_saved(struct xe_gt *gt, unsigned int vfid)
+{
+	if (!pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVED))
+		pf_enter_vf_state_machine_bug(gt, vfid);
+
+	xe_gt_sriov_dbg(gt, "VF%u saved!\n", vfid);
+
+	pf_exit_vf_mismatch(gt, vfid);
+	pf_exit_vf_wip(gt, vfid);
+	pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED);
+}
+
+static bool pf_handle_vf_save(struct xe_gt *gt, unsigned int vfid)
+{
+	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP))
+		return false;
+
+	pf_enter_vf_saved(gt, vfid);
+
+	return true;
+}
+
+static bool pf_enter_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
+{
+	if (pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP)) {
+		pf_enter_vf_wip(gt, vfid);
+		pf_queue_vf(gt, vfid);
+		return true;
+	}
+
+	return false;
+}
+
+/**
+ * xe_gt_sriov_pf_control_trigger_save_vf() - Start an SR-IOV VF migration data save sequence.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_control_trigger_save_vf(struct xe_gt *gt, unsigned int vfid)
+{
+	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_STOPPED)) {
+		xe_gt_sriov_dbg(gt, "VF%u is stopped!\n", vfid);
+		return -EPERM;
+	}
+
+	if (!pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED)) {
+		xe_gt_sriov_dbg(gt, "VF%u is not paused!\n", vfid);
+		return -EPERM;
+	}
+
+	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP)) {
+		xe_gt_sriov_dbg(gt, "VF%u restore is in progress!\n", vfid);
+		return -EBUSY;
+	}
+
+	if (!pf_enter_vf_save_wip(gt, vfid)) {
+		xe_gt_sriov_dbg(gt, "VF%u save already in progress!\n", vfid);
+		return -EALREADY;
+	}
+
+	return 0;
+}
+
+/**
+ * xe_gt_sriov_pf_control_finish_save_vf() - Complete a VF migration data save sequence.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_control_finish_save_vf(struct xe_gt *gt, unsigned int vfid)
+{
+	if (!pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVED)) {
+		pf_enter_vf_mismatch(gt, vfid);
+		return -EIO;
+	}
+
+	pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED);
+
+	return 0;
+}
+
+static void pf_exit_vf_restore_wip(struct xe_gt *gt, unsigned int vfid)
+{
+	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP);
+}
+
+static void pf_enter_vf_restored(struct xe_gt *gt, unsigned int vfid)
+{
+	if (!pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORED))
+		pf_enter_vf_state_machine_bug(gt, vfid);
+
+	xe_gt_sriov_dbg(gt, "VF%u restored!\n", vfid);
+
+	pf_exit_vf_mismatch(gt, vfid);
+	pf_exit_vf_wip(gt, vfid);
+	pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED);
+}
+
+static bool pf_handle_vf_restore(struct xe_gt *gt, unsigned int vfid)
+{
+	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP))
+		return false;
+
+	pf_enter_vf_restored(gt, vfid);
+
+	return true;
+}
+
+static bool pf_enter_vf_restore_wip(struct xe_gt *gt, unsigned int vfid)
+{
+	if (pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP)) {
+		pf_enter_vf_wip(gt, vfid);
+		pf_queue_vf(gt, vfid);
+		return true;
+	}
+
+	return false;
+}
+
+/**
+ * xe_gt_sriov_pf_control_trigger restore_vf() - Start an SR-IOV VF migration data restore sequence.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_control_trigger_restore_vf(struct xe_gt *gt, unsigned int vfid)
+{
+	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_STOPPED)) {
+		xe_gt_sriov_dbg(gt, "VF%u is stopped!\n", vfid);
+		return -EPERM;
+	}
+
+	if (!pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED)) {
+		xe_gt_sriov_dbg(gt, "VF%u is not paused!\n", vfid);
+		return -EPERM;
+	}
+
+	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP)) {
+		xe_gt_sriov_dbg(gt, "VF%u save is in progress!\n", vfid);
+		return -EBUSY;
+	}
+
+	if (!pf_enter_vf_restore_wip(gt, vfid)) {
+		xe_gt_sriov_dbg(gt, "VF%u restore already in progress!\n", vfid);
+		return -EALREADY;
+	}
+
+	return 0;
+}
+
+static int pf_wait_vf_restore_done(struct xe_gt *gt, unsigned int vfid)
+{
+	unsigned long timeout = pf_get_default_timeout(XE_GT_SRIOV_STATE_RESTORE_WIP);
+	int err;
+
+	err = pf_wait_vf_wip_done(gt, vfid, timeout);
+	if (err) {
+		xe_gt_sriov_notice(gt, "VF%u RESTORE didn't finish in %u ms (%pe)\n",
+				   vfid, jiffies_to_msecs(timeout), ERR_PTR(err));
+		return err;
+	}
+
+	if (!pf_expect_vf_not_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_FAILED))
+		return -EIO;
+
+	return 0;
+}
+
+/**
+ * xe_gt_sriov_pf_control_finish_restore_vf() - Complete a VF migration data restore sequence.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_control_finish_restore_vf(struct xe_gt *gt, unsigned int vfid)
+{
+	int ret;
+
+	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP)) {
+		ret = pf_wait_vf_restore_done(gt, vfid);
+		if (ret)
+			return ret;
+	}
+
+	if (!pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORED)) {
+		pf_enter_vf_mismatch(gt, vfid);
+		return -EIO;
+	}
+
+	pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED);
+
+	return 0;
+}
+
 /**
  * DOC: The VF STOP state machine
  *
@@ -817,6 +1057,8 @@ static void pf_enter_vf_stopped(struct xe_gt *gt, unsigned int vfid)
 
 	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESUMED);
 	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED);
+	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVED);
+	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORED);
 	pf_exit_vf_mismatch(gt, vfid);
 	pf_exit_vf_wip(gt, vfid);
 }
@@ -1461,6 +1703,12 @@ static bool pf_process_vf_state_machine(struct xe_gt *gt, unsigned int vfid)
 	if (pf_exit_vf_pause_save_guc(gt, vfid))
 		return true;
 
+	if (pf_handle_vf_save(gt, vfid))
+		return true;
+
+	if (pf_handle_vf_restore(gt, vfid))
+		return true;
+
 	if (pf_exit_vf_resume_send_resume(gt, vfid))
 		return true;
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
index 8a72ef3778d47..abc233f6302ed 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
@@ -14,8 +14,14 @@ struct xe_gt;
 int xe_gt_sriov_pf_control_init(struct xe_gt *gt);
 void xe_gt_sriov_pf_control_restart(struct xe_gt *gt);
 
+bool xe_gt_sriov_pf_control_check_vf_data_wip(struct xe_gt *gt, unsigned int vfid);
+
 int xe_gt_sriov_pf_control_pause_vf(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_control_resume_vf(struct xe_gt *gt, unsigned int vfid);
+int xe_gt_sriov_pf_control_trigger_save_vf(struct xe_gt *gt, unsigned int vfid);
+int xe_gt_sriov_pf_control_finish_save_vf(struct xe_gt *gt, unsigned int vfid);
+int xe_gt_sriov_pf_control_trigger_restore_vf(struct xe_gt *gt, unsigned int vfid);
+int xe_gt_sriov_pf_control_finish_restore_vf(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_control_stop_vf(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_control_trigger_flr(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_control_sync_flr(struct xe_gt *gt, unsigned int vfid, bool sync);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
index c80b7e77f1ad2..e113dc98b33ce 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
@@ -31,6 +31,12 @@
  * @XE_GT_SRIOV_STATE_PAUSE_SAVE_GUC: indicates that the PF needs to save the VF GuC state.
  * @XE_GT_SRIOV_STATE_PAUSE_FAILED: indicates that a VF pause operation has failed.
  * @XE_GT_SRIOV_STATE_PAUSED: indicates that the VF is paused.
+ * @XE_GT_SRIOV_STATE_SAVE_WIP: indicates that VF save operation is in progress.
+ * @XE_GT_SRIOV_STATE_SAVE_FAILED: indicates that VF save operation has failed.
+ * @XE_GT_SRIOV_STATE_SAVED: indicates that VF data is saved.
+ * @XE_GT_SRIOV_STATE_RESTORE_WIP: indicates that VF restore operation is in progress.
+ * @XE_GT_SRIOV_STATE_RESTORE_FAILED: indicates that VF restore operation has failed.
+ * @XE_GT_SRIOV_STATE_RESTORED: indicates that VF data is restored.
  * @XE_GT_SRIOV_STATE_RESUME_WIP: indicates the a VF resume operation is in progress.
  * @XE_GT_SRIOV_STATE_RESUME_SEND_RESUME: indicates that the PF is about to send RESUME command.
  * @XE_GT_SRIOV_STATE_RESUME_FAILED: indicates that a VF resume operation has failed.
@@ -63,6 +69,14 @@ enum xe_gt_sriov_control_bits {
 	XE_GT_SRIOV_STATE_PAUSE_FAILED,
 	XE_GT_SRIOV_STATE_PAUSED,
 
+	XE_GT_SRIOV_STATE_SAVE_WIP,
+	XE_GT_SRIOV_STATE_SAVE_FAILED,
+	XE_GT_SRIOV_STATE_SAVED,
+
+	XE_GT_SRIOV_STATE_RESTORE_WIP,
+	XE_GT_SRIOV_STATE_RESTORE_FAILED,
+	XE_GT_SRIOV_STATE_RESTORED,
+
 	XE_GT_SRIOV_STATE_RESUME_WIP,
 	XE_GT_SRIOV_STATE_RESUME_SEND_RESUME,
 	XE_GT_SRIOV_STATE_RESUME_FAILED,
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
index 416d00a03fbb7..8d8a01faf5291 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
@@ -149,3 +149,99 @@ int xe_sriov_pf_control_sync_flr(struct xe_device *xe, unsigned int vfid)
 
 	return 0;
 }
+
+/**
+ * xe_sriov_pf_control_trigger_save_vf - Start a VF migration data SAVE sequence on all GTs.
+ * @xe: the &xe_device
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_pf_control_trigger_save_vf(struct xe_device *xe, unsigned int vfid)
+{
+	struct xe_gt *gt;
+	unsigned int id;
+	int ret;
+
+	for_each_gt(gt, xe, id) {
+		ret = xe_gt_sriov_pf_control_trigger_save_vf(gt, vfid);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+/**
+ * xe_sriov_pf_control_finish_save_vf - Complete a VF migration data SAVE sequence on all GTs.
+ * @xe: the &xe_device
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_pf_control_finish_save_vf(struct xe_device *xe, unsigned int vfid)
+{
+	struct xe_gt *gt;
+	unsigned int id;
+	int ret;
+
+	for_each_gt(gt, xe, id) {
+		ret = xe_gt_sriov_pf_control_finish_save_vf(gt, vfid);
+		if (ret)
+			break;
+	}
+
+	return ret;
+}
+
+/**
+ * xe_sriov_pf_control_trigger_restore_vf - Start a VF migration data RESTORE sequence on all GTs.
+ * @xe: the &xe_device
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_pf_control_trigger_restore_vf(struct xe_device *xe, unsigned int vfid)
+{
+	struct xe_gt *gt;
+	unsigned int id;
+	int ret;
+
+	for_each_gt(gt, xe, id) {
+		ret = xe_gt_sriov_pf_control_trigger_restore_vf(gt, vfid);
+		if (ret)
+			return ret;
+	}
+
+	return ret;
+}
+
+/**
+ * xe_sriov_pf_control_wait_restore_vf - Complete a VF migration data RESTORE sequence in all GTs.
+ * @xe: the &xe_device
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_pf_control_finish_restore_vf(struct xe_device *xe, unsigned int vfid)
+{
+	struct xe_gt *gt;
+	unsigned int id;
+	int ret;
+
+	for_each_gt(gt, xe, id) {
+		ret = xe_gt_sriov_pf_control_finish_restore_vf(gt, vfid);
+		if (ret)
+			break;
+	}
+
+	return ret;
+}
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_control.h b/drivers/gpu/drm/xe/xe_sriov_pf_control.h
index 2d52d0ac1b28f..30318c1fba34e 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_control.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_control.h
@@ -13,5 +13,9 @@ int xe_sriov_pf_control_resume_vf(struct xe_device *xe, unsigned int vfid);
 int xe_sriov_pf_control_stop_vf(struct xe_device *xe, unsigned int vfid);
 int xe_sriov_pf_control_reset_vf(struct xe_device *xe, unsigned int vfid);
 int xe_sriov_pf_control_sync_flr(struct xe_device *xe, unsigned int vfid);
+int xe_sriov_pf_control_trigger_save_vf(struct xe_device *xe, unsigned int vfid);
+int xe_sriov_pf_control_finish_save_vf(struct xe_device *xe, unsigned int vfid);
+int xe_sriov_pf_control_trigger_restore_vf(struct xe_device *xe, unsigned int vfid);
+int xe_sriov_pf_control_finish_restore_vf(struct xe_device *xe, unsigned int vfid);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
index a81aa05c55326..e0e6340c49106 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
@@ -136,11 +136,31 @@ static void pf_populate_pf(struct xe_device *xe, struct dentry *pfdent)
  *      │   │   ├── reset
  *      │   │   ├── resume
  *      │   │   ├── stop
+ *      │   │   ├── save
+ *      │   │   ├── restore
  *      │   │   :
  *      │   ├── vf2
  *      │   │   ├── ...
  */
 
+static int from_file_read_to_vf_call(struct seq_file *s,
+				     int (*call)(struct xe_device *, unsigned int))
+{
+	struct dentry *dent = file_dentry(s->file)->d_parent;
+	struct xe_device *xe = extract_xe(dent);
+	unsigned int vfid = extract_vfid(dent);
+	int ret;
+
+	xe_pm_runtime_get(xe);
+	ret = call(xe, vfid);
+	xe_pm_runtime_put(xe);
+
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
 static ssize_t from_file_write_to_vf_call(struct file *file, const char __user *userbuf,
 					  size_t count, loff_t *ppos,
 					  int (*call)(struct xe_device *, unsigned int))
@@ -179,10 +199,26 @@ static ssize_t OP##_write(struct file *file, const char __user *userbuf,	\
 }										\
 DEFINE_SHOW_STORE_ATTRIBUTE(OP)
 
+#define DEFINE_VF_CONTROL_ATTRIBUTE_RW(OP)					\
+static int OP##_show(struct seq_file *s, void *unused)				\
+{										\
+	return from_file_read_to_vf_call(s,					\
+					 xe_sriov_pf_control_finish_##OP);	\
+}										\
+static ssize_t OP##_write(struct file *file, const char __user *userbuf,	\
+			  size_t count, loff_t *ppos)				\
+{										\
+	return from_file_write_to_vf_call(file, userbuf, count, ppos,		\
+					  xe_sriov_pf_control_trigger_##OP);	\
+}										\
+DEFINE_SHOW_STORE_ATTRIBUTE(OP)
+
 DEFINE_VF_CONTROL_ATTRIBUTE(pause_vf);
 DEFINE_VF_CONTROL_ATTRIBUTE(resume_vf);
 DEFINE_VF_CONTROL_ATTRIBUTE(stop_vf);
 DEFINE_VF_CONTROL_ATTRIBUTE(reset_vf);
+DEFINE_VF_CONTROL_ATTRIBUTE_RW(save_vf);
+DEFINE_VF_CONTROL_ATTRIBUTE_RW(restore_vf);
 
 static void pf_populate_vf(struct xe_device *xe, struct dentry *vfdent)
 {
@@ -190,6 +226,8 @@ static void pf_populate_vf(struct xe_device *xe, struct dentry *vfdent)
 	debugfs_create_file("resume", 0200, vfdent, xe, &resume_vf_fops);
 	debugfs_create_file("stop", 0200, vfdent, xe, &stop_vf_fops);
 	debugfs_create_file("reset", 0200, vfdent, xe, &reset_vf_fops);
+	debugfs_create_file("save", 0600, vfdent, xe, &save_vf_fops);
+	debugfs_create_file("restore", 0600, vfdent, xe, &restore_vf_fops);
 }
 
 static void pf_populate_with_tiles(struct xe_device *xe, struct dentry *dent, unsigned int vfid)
-- 
2.50.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B23E9C4A2E9
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 02:05:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18C5210E4AF;
	Tue, 11 Nov 2025 01:05:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AiFsaJmV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A0A210E4B5;
 Tue, 11 Nov 2025 01:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762823150; x=1794359150;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ihA+Ar6RIphaj4idKo/wFywsBdpm5eD1jiqGxzH08+w=;
 b=AiFsaJmVRu/WrWpzgFZO6YwOLSh3Gp058VkkS4WIhzgWef5xGFdJkBzm
 j9UUyhUemBk70/FaqlUM/md2PCABy01zWOOhbsx4DJDEF9Vu7cvEptp7E
 5mEZTfMBmjJm1eUXh+sBu6Dk326Cqa5SLun7C9oAWi2Ba8tjO4DpcBa9M
 c2fb7xfD+mKbX9UxS62uHDMwZ3OcVCWioybM6baH5yTJOpHvFs3wAwF/P
 RqzYTd2xX3MWBsnzVBevA/MGhHpiLjyHSAeAcX/jC2QxmeKisDD1njvhm
 kqmkuaAugOMKK/yMZr9vkaPxyB6c1kZ/dIO4zIJNXuoEjGhGz/K49DUB1 A==;
X-CSE-ConnectionGUID: C9vudf0aSlydpztaHb8Qng==
X-CSE-MsgGUID: a1OfA5jRT3O1Js7auyTUwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="64969592"
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="64969592"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 17:05:50 -0800
X-CSE-ConnectionGUID: busPQxhtQl+/Cr/s0YSZqg==
X-CSE-MsgGUID: I3vzzG8jSsGHC9v9zq0Pmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="189073403"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 17:05:49 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 17:05:49 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 10 Nov 2025 17:05:49 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.36) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 17:05:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PmSVUyCx3lhv0lUddr1UuLJcLqOtQPi4zRK8cxahhZChuCUFrpwZxj6O0vWt1deea/CAC6a/otAsvb3k2idmqAj+uTszczEha/xch6rqAVZcPI/2+dJ4hf/ZKRgZ0GHJDMyWMlfycX61gOEvJgPwffuLwePbopuz6glcqpnjLsNk2pIfyosslM2CBK1G65oPnrHI0oaZWtmmZWLzkGyW7VHP+u39dZBd4ejGqPGb4w6fHROKlgYge65MLD50Oxh7+xdlafTDq7hGLBpzpKsQXZKar5mPOCLRGd/drnMgJNOigdItpJeNYcgecgGahfECco+R6XcgNxVw3TGMkOmVFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sHadM5ZLg5Qo6xOl0wOmqkpYxpVtZOlj/T40qmG/DS8=;
 b=C8XRADtPWvYYGGxt2VGHi03kLQcrHjIwZz8d2qq8AQ0jMOLb2kWKyBXbpk0Op3xRSfGsIVvzNzTCFE8WY9wWvIFAKigz1Z2UF5ZKE8IEQupvoXH7FFfLrVEHBDJ9QdIXl5wDR2lz4WGVvJq7OUaR7YlnKby/BM9CENJvx+BwTw9usi2SDfrmnCeKHrOpEWf2PGByMCAKjOBDJetUA301oG8aM22Lmp/oLDyLVMDmFGd+l612XBKlTbaoEluoFM7uKv38wyHm12nnhy2VHR2FsPjap/vejeLnm/eikFg1ZiT9vI4NGPXhUoiLuIqVqI02xift8sWEWiN/vTjLgeqcQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 MN0PR11MB6279.namprd11.prod.outlook.com (2603:10b6:208:3c1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 01:05:47 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 01:05:46 +0000
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
Subject: [PATCH v5 09/28] drm/xe/pf: Expose VF migration data size over debugfs
Date: Tue, 11 Nov 2025 02:04:20 +0100
Message-ID: <20251111010439.347045-10-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251111010439.347045-1-michal.winiarski@intel.com>
References: <20251111010439.347045-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0017.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::17) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|MN0PR11MB6279:EE_
X-MS-Office365-Filtering-Correlation-Id: e95799bd-17cd-4dc5-bb5a-08de20be725f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M3Z3aUVlK2lkcmdPQ2ZuYlU2cHN6S21tOUlxYXBpQkNidVpFT1hXc2o3OU90?=
 =?utf-8?B?OHBOUEpVR1Z1MmN6WFhySjhlRCtBRmZ0SGpKUCs3SlBZcUN3Z1ZxWjZUbE9C?=
 =?utf-8?B?YWVkSmlhWG16S0dzY2pVMVExT2pHbmVmTUlWRVdSTWJEbkMwRm5BdjVlUUxS?=
 =?utf-8?B?SC94dk81Z1lqUHBxdkRaWjVLY29GeFBXMGVXenhjYlJGWTdBMXprWUtOWWVw?=
 =?utf-8?B?UEg3bVZrMmZSaGFUeXdkWXFIUzRpOUVrUTJJS3ZlOS96anNaMm9lekliVDNX?=
 =?utf-8?B?NzNiZ1BYeFBKOElIa2ozMWNCdGJtVUZPYkQwR2RndiswcDllLzY2NjI0SDVy?=
 =?utf-8?B?TGZ2K2NRcFdBeHo1QkFQMGFjMDZHNlh3Nzk0QXMxNmMwWVdpS1NzdHFFTmFL?=
 =?utf-8?B?ckhaQjd3d0txOU1EbDFEVjZxRmR3NlowbEhqTGpDbmNVSk1TY0J4Tllob01Q?=
 =?utf-8?B?YWxJOWtoTHA1aU13VXZ1ZnQwYzVNUkdaNktDb3BlWGM5eUg1bHlIajF4eFpa?=
 =?utf-8?B?NWtFb2Z3WVBkYkpseWxFcHYwcWJEa1ZmNTN3SCs5dVh5eEZ4TmVWaER1Tm1B?=
 =?utf-8?B?UjVrVC8zNTBpRWt5M3VJOHA5Y1REL1FoNmVnc2JuekROZ1FCRk5KdThwazFK?=
 =?utf-8?B?UTB5VjNSZGhkR0NzUEtZc1p1VGwrbUhIUWlJdVhHQzJwV1NDa0VvRW1HNk1W?=
 =?utf-8?B?N00vZU43MkpQNkJRQ0h4UVBnZ0tXdWpWU09ha2QzUW4zMzByUE1idnRibDRs?=
 =?utf-8?B?V1N1SVhJdlV5c0dOa3JCNzVIYnAvSTVCMFNlRmxzZUp3ZlZPdzdOc2I4QzBD?=
 =?utf-8?B?aGNJSmtFREJ3TlRXenhHTWdWODFzOURPRnFPRkZrOCs2NXB5N2VyaHI1QzFO?=
 =?utf-8?B?bTFHQWFTYW80bUJBWUhtRkRsU1ZTYnBvanlMS3d5ZGsxUGh0MEo2RE4yVTM1?=
 =?utf-8?B?Zy91VHk1ZmtXWnRlK0J1NUpkZXNvNWk5czFhRWdLcGErd3RLalVEaWduY2ph?=
 =?utf-8?B?TWx0Vmh3WElCYk1jQ0pQZkF0bnhHRVZPQmFraUFYZ1FCc3ZEV29LZUx0VXBw?=
 =?utf-8?B?bHlVMHUwU1lxQVVsTFl3QVRrdHkrTjVCVVZEUVpqYkFmY3kvSCs1dWpuUitR?=
 =?utf-8?B?UnFsZEtsc1NFWHlnNVBtZFNPbWliTTBGbyt4UGZpUmZka092ZzZCQnVvcjlv?=
 =?utf-8?B?R0dHWk4rZWhUMmxiV05lVTAxRktBL3lJZElieEU5aUhLWjFjN1dVdTE4a3Jn?=
 =?utf-8?B?Wm4yUDc4RVZQbEtsN0RMUXVLbEZjYXh4NmQyTTVBVENSeTVMZkw1YWo0aDhF?=
 =?utf-8?B?VitWUVlxVXBINDVhSllNK3NFcWV5R3UzVVZyemhzSHhxVkVwUlJrdDdEcUtY?=
 =?utf-8?B?QXpoRHkwaENxQUI2TVRiZktXcytnd3VnMWR4S3ZHQlpQcUEzeFdIeWxLSXVQ?=
 =?utf-8?B?cFNXbDQ5MlVTWUtLS084ejY2SzZXZVVoOCt1VTRXUVNDb2RxSDhPZkgwd2Ix?=
 =?utf-8?B?QjVtTGp5YnNncHIwUE52UzVDcHUxSkVlQk9jZ2Rna29Kc2RqVXMrNndxYkov?=
 =?utf-8?B?MEZ5VmlPVUIyRGU1VHJrV25pZzJqMkxra3BLNXlqZzZBSzQ2cnJMOHBCT3dP?=
 =?utf-8?B?R1c0K3czb3MwTE4wWFh3NndvZFpmOG5LTE5mTWtMYXJLSU4reUlLVm5sZ2t1?=
 =?utf-8?B?RzNnb1Q2TmtScW9NMTh1dno2RFd4ZDloVjJwOEZOS1RQWW5yYmxRVWpwNk02?=
 =?utf-8?B?UXBhbVBsRFE5UFY3UnI1aWNqMHVVMm0xMlY3YzFqTFQrSnhpdTMwcXdTYWZO?=
 =?utf-8?B?c0ZsRzhtcFVhbWtjaEEwNGNtMGx1aFBsNmxqOWk2NXRRMldoTUl6eUZxKzFa?=
 =?utf-8?B?c2xRSjBLMjAwTmhIVGRUcUVNbGVNNkpGbTNhZWI3RS82OFZMWXdGSERaUnB2?=
 =?utf-8?B?dWxiZExpeEZCOWdrWnllQWpQT1JXWUNRcUcrWittY3FOb0JraTBDTktobkRB?=
 =?utf-8?Q?P1ngIe0fKJQt5YNWuNeMsAmqtml1wo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVdNUVVFOG9EazJqV29Oak1lWUtHVVhhQmt4TTFWdFoxNzZFemUvdXl6V0hs?=
 =?utf-8?B?eEdZUjVCcUxBTmJzamEvUHhtRkx6Z25xWWhCTUVoVWFqN1BuZ1dyUkE4S1JL?=
 =?utf-8?B?bUZuYXE1aXYyZmZFcGtwR20vRHFoU1RxNVBOVGd5OGhLSjlpbW1YRDFqdUUr?=
 =?utf-8?B?K3FPVnVMUE45SzdNQlA0VkNCdmducGU5NWhLN1Q4V3QvSk1Ib3hwWUYrUnIw?=
 =?utf-8?B?YVh5Z2QwZGdReXJqWnkxOGlvbWNFSDlpWWE3ckJidU9XaXBkUjdKaWlNdFZ3?=
 =?utf-8?B?OW1pZTVqRm80Q0lSYzNzdWQ3UlF1OVUzamNsNlRROS9wZDRxWXZBRFJtbDk1?=
 =?utf-8?B?WFV3SXFxbUlwRk51bVhYc3VrZE00RGI1RDZ4c2NxcCtVWlFPVzIzVnUyVldl?=
 =?utf-8?B?V2FBa1hvRytUL1pFeW96MnJpU3NtUGVSN1NkZzZCc09ET0JsYVlhNDkxclJV?=
 =?utf-8?B?Ym1DalczSTl0WE14RFVRZGhyVlRFTEh4QWZ2YXVxZ1Nmc0Q1eFUzSUlhZ2V4?=
 =?utf-8?B?OVowMWx1Z3RiUXFPYjI0cmw4TTFRYzgyR0svaXBjZXR4aDBmTjBaejJwVDFk?=
 =?utf-8?B?UnBEa0daZFZUSG80aE92cXl4akdHK3R2NVFjVUlBQkc3NzZFeXBnbE1SNzgx?=
 =?utf-8?B?VmE4anY2MWRlL2ZEQXViYTZ3ZzhPMFV4L3Y4MFRhQ1U0aVN4UlY3WmVlWnpV?=
 =?utf-8?B?cXRHZ1oyUVVBeE9pQU5peDJiaDRhU2owK1lWSXNValZJRGhpYnlZcXFhUFFj?=
 =?utf-8?B?Sk5sdlpzWXNmSmFZVGw4UysrUEhBUXJONGhLc280RSt2bkNxSHRDdUpCOWZG?=
 =?utf-8?B?TkFCZzdmb1ZoU2R3VTNZOCtQL0NSMllqcDlIQ2pKVHY3aHZEL05TRUROQmxs?=
 =?utf-8?B?UUNrWm5SVFhVeC9ydUlRR2VWTUwrcnhDR3krbmxWZEkvRlNlclJ0cEliYXlx?=
 =?utf-8?B?cHVqNFB2V3RoSzd3L3JwYVpFam53TThubHlFUTU1THB3cWRieVFuTDFFVmtM?=
 =?utf-8?B?bXI0cVlXQnRBUjdpOXRueXdnVlFiZVRoSEZBWEFXNVVjYkNtNENndU1OZnlM?=
 =?utf-8?B?NVhxQkJCK0R5dDRENXZwRjBFWGl6czMyVlk0TEJBY3ZwRFlLeVBPVXJTUnpY?=
 =?utf-8?B?VHZZYzNNYmNCVzFGZWdqWGE2VkYxQnV1Z2JGVFdPWHA5bGpUNTBYNGpqTW5Z?=
 =?utf-8?B?dW1URVZUcTRSUkxyNWdLZC9JeEJKWC9FSUpmVzBVNG9ORWY5V2FPSHR6SjE1?=
 =?utf-8?B?cGpNSzFhQ0xrejBEVmd3VzFGNkZpQVJSbEpoNjJXSk9iSWY0VERXTVNCUC9R?=
 =?utf-8?B?MlpweWk1bStmcmY2MTVZVGdwdldiRjBGaEpLbzdsL1c1MEZ1UEhyYzFWN1Vs?=
 =?utf-8?B?UUx3WVVhUWlOSkxJTjJsS2hRWkZobklpZFlmQXR0bzRzUTFJTVpBOExoNWh5?=
 =?utf-8?B?YS9Rekxjd0hlQ0l0SnN2UFR3aElsY0VKMENOcFIyRm5Rd0dlSVFBaWZFY1JH?=
 =?utf-8?B?d0JDNE5jYVJKWG1YS2wvR1AzejJmM3JRZFBrbzN4R0xxZGNMMTZ6QjFRSXVS?=
 =?utf-8?B?NXhXRmcyV0ZNWjgwL1ZKcUszdkloeFNKSURIUWtwNW9iQW5Hc09DdW5zdEwv?=
 =?utf-8?B?VHVnTy9YWTYyNDJmR1lwQWxkVXd2Yi9GU1RvRkZJVW9uMG9ubnZSMG5sbHpu?=
 =?utf-8?B?Mkw4Q25oS2trMjBmV2I5N2N4NlZHSndYKy9aUk9UcHFtbUNUQkhPZ1FBejEz?=
 =?utf-8?B?ak1IdlZkZmQwZUNqRWMrN0U4MFp3WkpxRFhJSCs3WGpsZ1lFdE0xWHNlVWlJ?=
 =?utf-8?B?N0hDRDlaZU5NTk8vN242ZnNnREZYY255RjlRSXNBZWRlRExQdTYyMkhwNUFl?=
 =?utf-8?B?Sng1V3YzNWQxVmtsUzlxM29qdzdYZW1xOWlCdkwzWFBuVEdxNkVmRVZxMHhM?=
 =?utf-8?B?SmNTRkdUcDlhNUdWZ0RyUDMreGRYb3duTTJjZjh0WFo0NkZXa3I1Z2h6SDhI?=
 =?utf-8?B?d2RjbTh2WlA4UHV3cGxCZDlNcG9jYVBBR090ZUdIWGIyNjF4OCtPNkRsZzV4?=
 =?utf-8?B?QWFWSEwwbDgzcTNwY3V5Q292b1c2czhEK3lsQXBPWEcwSnNmU2gydVNHWkxy?=
 =?utf-8?B?V2hwV0NkMmJuM1hDQjZnQ3h5SVhFOHhOZTBvL2tiWG9RQnFZN3kyckRNNXVZ?=
 =?utf-8?B?b1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e95799bd-17cd-4dc5-bb5a-08de20be725f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 01:05:46.8888 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F8OSVDWY0Jw8pd1idQtAns6mXhlShswmegZ1aL7I8iCP3AOJVzyTdQ+t4BRr0rX5LDshVSt8eWGtK69CT+EklYy9+8yWS+zp+Jd7Gc8z6Ds=
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

The size is normally used to make a decision on when to stop the device
(mainly when it's in a pre_copy state).

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 21 +++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |  2 ++
 drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c      | 28 +++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_pf_migration.c    | 30 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_pf_migration.h    |  1 +
 5 files changed, 82 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
index 4e49022810ea5..0ffe64ee469fe 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
@@ -396,6 +396,27 @@ ssize_t xe_gt_sriov_pf_migration_write_guc_state(struct xe_gt *gt, unsigned int
 }
 #endif /* CONFIG_DEBUG_FS */
 
+/**
+ * xe_gt_sriov_pf_migration_size() - Total size of migration data from all components within a GT.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * This function is for PF only.
+ *
+ * Return: total migration data size in bytes or a negative error code on failure.
+ */
+ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid)
+{
+	ssize_t total = 0;
+
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	xe_gt_assert(gt, vfid != PFID);
+	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
+
+	/* Nothing to query yet - will be updated once per-GT migration data types are added */
+	return total;
+}
+
 /**
  * xe_gt_sriov_pf_migration_ring_empty() - Check if a migration ring is empty.
  * @gt: the &xe_gt
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
index b4c7b5dc9e914..3ad3c3609b415 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
@@ -15,6 +15,8 @@ int xe_gt_sriov_pf_migration_init(struct xe_gt *gt);
 int xe_gt_sriov_pf_migration_save_guc_state(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_migration_restore_guc_state(struct xe_gt *gt, unsigned int vfid);
 
+ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid);
+
 bool xe_gt_sriov_pf_migration_ring_empty(struct xe_gt *gt, unsigned int vfid);
 bool xe_gt_sriov_pf_migration_ring_full(struct xe_gt *gt, unsigned int vfid);
 void xe_gt_sriov_pf_migration_ring_free(struct xe_gt *gt, unsigned int vfid);
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
index 4ca86ff4b7dae..00fe73bd86dfe 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
@@ -254,6 +254,33 @@ static const struct file_operations data_vf_fops = {
 	.llseek		= default_llseek,
 };
 
+static ssize_t size_read(struct file *file, char __user *ubuf, size_t count, loff_t *ppos)
+{
+	struct dentry *dent = file_dentry(file)->d_parent;
+	struct xe_device *xe = extract_xe(dent);
+	unsigned int vfid = extract_vfid(dent);
+	char buf[21];
+	ssize_t ret;
+	int len;
+
+	xe_pm_runtime_get(xe);
+	ret = xe_sriov_pf_migration_size(xe, vfid);
+	xe_pm_runtime_put(xe);
+	if (ret < 0)
+		return ret;
+
+	len = scnprintf(buf, sizeof(buf), "%zd\n", ret);
+
+	return simple_read_from_buffer(ubuf, count, ppos, buf, len);
+}
+
+static const struct file_operations size_vf_fops = {
+	.owner		= THIS_MODULE,
+	.open		= simple_open,
+	.read		= size_read,
+	.llseek		= default_llseek,
+};
+
 static void pf_populate_vf(struct xe_device *xe, struct dentry *vfdent)
 {
 	debugfs_create_file("pause", 0200, vfdent, xe, &pause_vf_fops);
@@ -263,6 +290,7 @@ static void pf_populate_vf(struct xe_device *xe, struct dentry *vfdent)
 	debugfs_create_file("save", 0600, vfdent, xe, &save_vf_fops);
 	debugfs_create_file("restore", 0600, vfdent, xe, &restore_vf_fops);
 	debugfs_create_file("migration_data", 0600, vfdent, xe, &data_vf_fops);
+	debugfs_create_file("migration_size", 0400, vfdent, xe, &size_vf_fops);
 }
 
 static void pf_populate_with_tiles(struct xe_device *xe, struct dentry *dent, unsigned int vfid)
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
index dfcc50203062a..d6c24bea759af 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
@@ -310,3 +310,33 @@ ssize_t xe_sriov_pf_migration_write(struct xe_device *xe, unsigned int vfid,
 
 	return produced;
 }
+
+/**
+ * xe_sriov_pf_migration_size() - Total size of migration data from all components within a device
+ * @xe: the &xe_device
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * This function is for PF only.
+ *
+ * Return: total migration data size in bytes or a negative error code on failure.
+ */
+ssize_t xe_sriov_pf_migration_size(struct xe_device *xe, unsigned int vfid)
+{
+	size_t size = 0;
+	struct xe_gt *gt;
+	ssize_t ret;
+	u8 gt_id;
+
+	xe_assert(xe, IS_SRIOV_PF(xe));
+	xe_assert(xe, vfid);
+
+	for_each_gt(gt, xe, gt_id) {
+		ret = xe_gt_sriov_pf_migration_size(gt, vfid);
+		if (ret < 0)
+			return ret;
+
+		size += ret;
+	}
+
+	return size;
+}
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
index dbf8094900df8..b806298a0bb62 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
@@ -18,6 +18,7 @@ int xe_sriov_pf_migration_restore_produce(struct xe_device *xe, unsigned int vfi
 					  struct xe_sriov_packet *data);
 struct xe_sriov_packet *
 xe_sriov_pf_migration_save_consume(struct xe_device *xe, unsigned int vfid);
+ssize_t xe_sriov_pf_migration_size(struct xe_device *xe, unsigned int vfid);
 wait_queue_head_t *xe_sriov_pf_migration_waitqueue(struct xe_device *xe, unsigned int vfid);
 
 ssize_t xe_sriov_pf_migration_read(struct xe_device *xe, unsigned int vfid,
-- 
2.51.2


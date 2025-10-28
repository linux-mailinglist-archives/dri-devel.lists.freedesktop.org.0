Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C107C1761A
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 00:38:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF19010E6C0;
	Tue, 28 Oct 2025 23:37:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hfGu2gaI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8F6B10E6BE;
 Tue, 28 Oct 2025 23:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761694674; x=1793230674;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=PP+6Rm+YpdqU4zhjI2wcTBSd4FRSsyMf0rWnOBNKxVI=;
 b=hfGu2gaI7Ulx8eMnYa//s70TamlODehMXzw9Cbtu+dq5DBhlrko5sUHe
 CiZZWKcCEZ57O+eHbBUE2cPp0BjS6ZN18kRe5NxpleM7el3Vw02fURWjG
 3ppPOMehdXLzzX28xUPIP3UsRuit6yxH9AXfPaIW3I3bmqRXZPHmqA0wm
 GRDrG/EzyN9A2InoTwRUhTluXVD9wRuiNZ92hfLJg/2VM0X3PsyqBXAk6
 +T//sISAzyW7rIg4nY8cfaeB6qn9+svLB8MqMDpl3rPRXR4P91MI1Ix6h
 QLJt/lpiiKZBS++2PggTn8Z7kdsnEKECo/uI1FA11YNIj/WA5hwp5mzlz w==;
X-CSE-ConnectionGUID: ev6JAu0wRIGY8CfBRaNsbQ==
X-CSE-MsgGUID: 5OgxRY7yTJygWtfvbC8F5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63846393"
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; d="scan'208";a="63846393"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 16:37:54 -0700
X-CSE-ConnectionGUID: GqvBb2zrSyCbFIGdE8rUdw==
X-CSE-MsgGUID: OArcWxVYStKeq+Jh1Qad5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; d="scan'208";a="189844891"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 16:37:53 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 16:37:52 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 28 Oct 2025 16:37:52 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.4) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 16:37:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LWR9kxQ3eejb2qhpO+pfqNuRqhiXs5uVI/0UJx6ByEX1c6uujV3SZ4ySDe8B70748DV+U8BbmHoY9jlwxi6g7j8z1sxFEghruxpDR/kYTAkVNENf/bXlnlmHphrdqNi/eg5qSjVw0Ld2jXt4ZXJzPw8RWcEyfgpFWI+TZE30cFILUjtwPIDZ8UzGfFb5A5WD2UUggUQ/evEjoosFnjRrtNPAwSgmpFzQB4yrgL5Z3VrOYb1XYncaykTycRf/4dD6ps24AYVoOyVHn/Xt5K6f0fLj/dmJnZWLunI8oZrcV/ziTblI6KDAIFhJd/BRfq0reVX6HHDCU2LnNYB4vUCbJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wUObr7BsXF9L81Sz8FqzVh4vV5b7hkrlk1QVwLFctuA=;
 b=lUsB7aDOqXhAO/4bBhmTomJnHzJs0jxr+rX3YxvTxbJicab2aQNc5tAwmq5UlRZghFHC0WCDNlxiQFtllqG6U44mkRCrUI7NUM1K1cnoHzjYnJhjjSolbW4+Foc8FSe7BUynhuCWFwNhkat0lxSSLZ0QABVUwp162RfCmKDSIqg96cJnTAHwjcKZCxa7Gx8Gu8cM9ydXczQumtsFm9ew8bY2nkmyNzGwN92x2yRk7kcLXyqPQSDdieqhlw46RDYyMytOX6/osylEASy4/5a1RH243xtCgNBZuG8fpXPdu3tpyGyuLs1DvV89kOW6B8HwBamWTvubMabH/oUPt2tzIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 LV3PR11MB8726.namprd11.prod.outlook.com (2603:10b6:408:21a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Tue, 28 Oct
 2025 23:37:44 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9275.011; Tue, 28 Oct 2025
 23:37:44 +0000
Date: Wed, 29 Oct 2025 00:37:39 +0100
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Alex Williamson <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>, Matthew Brost
 <matthew.brost@intel.com>, <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>
Subject: Re: [PATCH v2 18/26] drm/xe/pf: Add helpers for VF MMIO migration
 data handling
Message-ID: <zh4olea5hdmfrrj62jhcuff3fqqoimt7incrhylqusdvy6bkko@inf4ufj4qhei>
References: <20251021224133.577765-1-michal.winiarski@intel.com>
 <20251021224133.577765-19-michal.winiarski@intel.com>
 <b523664f-50ce-4de6-8d02-90b6938089c1@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b523664f-50ce-4de6-8d02-90b6938089c1@intel.com>
X-ClientProxiedBy: VI1PR0102CA0067.eurprd01.prod.exchangelabs.com
 (2603:10a6:803::44) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|LV3PR11MB8726:EE_
X-MS-Office365-Filtering-Correlation-Id: 923ff029-5ab7-4b78-319f-08de167afd76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Um9RVXg3TERFRmJKWHUvZDBxaVAzVGY1U1JweDZEdG9OSk1NLzFOMkhmSEFJ?=
 =?utf-8?B?eFFVRVpQaU4zMDVJYU5qUmJFSDBtMUZVNi9RNDhpRVJjcFRydzRNVkk0Zmcx?=
 =?utf-8?B?UUNQQVVIWkpteGMyT1VQQTl0WGJ4N0lGWGRoMWZXeFJZdWNMU3dLbzZRMnhh?=
 =?utf-8?B?WFNCdGtOZ2tNRVpqK3NxRkhncmdyL0hFZHlnVi9UdDMrZmVraGVUN0tkWC9O?=
 =?utf-8?B?bkFmMWNjL0ZnR2lwdHdSVDNKZkEyLzlIT3h3NVdKWWhsVlc0ck14UnVmbndW?=
 =?utf-8?B?ZXlXb3FlZXJub21vTmc5aTYzN2NKZjM2NThGM2dsTURBeFVxWGgyS2Y1ZFNR?=
 =?utf-8?B?V0lJV1VjVTBDZSsxbzJaVW5uVVQvTTRjS0xNWENYVGlIdXNCd2xhd3B4Nk1t?=
 =?utf-8?B?MmsrbC8zZjZ0K1k4cFprVmlLNkpOUzNaaVljU1h0alRZczh5N2dFRkJDQll0?=
 =?utf-8?B?a3ZxVWQrbVI4VWdTWGRhQlg3LzNWWHRlTUNnSTMwbmNvQ3pSM3FGUmVaeXdl?=
 =?utf-8?B?dURXWmVjb1BKUGtFRVhpYThkSm8zajFqdm5wcHFNOUk1RHpoYmIyRjhNY0Nh?=
 =?utf-8?B?Y1lRSC9NS1doWk9ITnU1dDJKS3plb0M2VGdqUno5ZHRQSmRBTFg5VTFtWWxz?=
 =?utf-8?B?Zkhiakh6U1piNStYWlVzV29COUdLTDlVRWZ5cXJ0b3BSM1VnMkxzRUtubWN6?=
 =?utf-8?B?ZEZBelJyTUl3YUZyMGJPeXRjYWxrNU9NTFc3Y2JyS0VZZGRYU1hVV0hxblVw?=
 =?utf-8?B?ZDNiMVVCUTFJcFk5YTdtQmlYUWc5dXBCa1EyclM1Nk9VQ3VxaDVSQnI1aEVN?=
 =?utf-8?B?ZU5Gd3d3K0hETnpMdVVobzNZaGY2d1czczJiSE1hRnVTT0pBQTg0Ryttc2dG?=
 =?utf-8?B?dWx5UmI1dWx5U2xmb0tOZ1hDRThWaWlMWENYa0lPOFM3eFAxUkszckw0L2tU?=
 =?utf-8?B?aW9KYmIzSkgydHlJcURacUc4bDZuSkR1aEZ6ejBPbjJzSkoyNW45UmNrajJu?=
 =?utf-8?B?UkRXOVp0OCtFMFRrMWRSMjZIQlNkREREVTdYM3ArbmZwalpRVVpyVEVOb1Rs?=
 =?utf-8?B?SjQrL0o1amUrV1I5aVc0TUtuVUtxejhGMnVlMUF6ZlBBVnZQbzhLMkVjMmlr?=
 =?utf-8?B?b1NiM3A0RHM5d24razdoMVpveDN6UkpTWDlRLzhQcVF2NzVnTVNRejB4ZHpW?=
 =?utf-8?B?QXpaSWdwMjJxMVNKemJwVDl3TG9zcUlwcU9lK2xueDM1cnRZUm9zMzd6ZktF?=
 =?utf-8?B?QWVkcWZScDFGMG9mZ25rQk1BdFNWdDJleVVDS255QmJ1KzMwQ25ZTFZCWnJl?=
 =?utf-8?B?eGZqMkU1N1ZONjNQODZuZUN2S3RZVVdRNkovUmUzb3lia0t6b09TWjB6b2J3?=
 =?utf-8?B?d1N6MnZjOW5kS1JDNmFWQUI0dlpranRjSnJsYjNLS3FEanZyeTFMK25YcTlV?=
 =?utf-8?B?d012aWF3dSt3M2VDUUJkaHl0WlA3VnVjeG4yMURJM3QrRnQzY1ArL1JTY01s?=
 =?utf-8?B?SGdHOG0xSHhNVGFnaGIvNUtVY0c4d1gwcjl1ZDlUR1ZzWVB5Q0ZMQW56WDNH?=
 =?utf-8?B?WlJDSnF1b1VlVWR5UlJkeGJzWVEyMmFIN3YwbjlUa0hZSjZxMEUwMEx3WFVr?=
 =?utf-8?B?UFY1NGQyeFdTK0JRcFlOcHdPQm5ROGlTaTJEQ3JFVXFMVk5CVTVWQTRSOWUy?=
 =?utf-8?B?Z3JwM09uYW9WSjdEVUZkQzhVRmtxcHY4WTVsaW1vczNZbDNwZEMrS1ZvOEhQ?=
 =?utf-8?B?WG1nblEyVDFBK1hSNStlczVlcU5jcDFNRUFYR0NUQlEzU3FKUEpYcGZFRXBa?=
 =?utf-8?B?UE5kRVdiYnExSnk4Y3AydDU4TG9EaWxLUkZRSmNSSHplaGFPUHRONFFsSFQz?=
 =?utf-8?B?NExGNXZiRkNZSnZpNmZiZTFsR3Rldmk0elJ2UGgwTWUrOE9XNE9PZFlmWUl3?=
 =?utf-8?Q?1GrZwFyBK8Q16aELIWTP5Z3BSLJ5lH7u?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZldGQ3RFcWlHT1paTnJ2Q3l4alJkODJsQWdqbGlpV2d4bWZYS1lPUjhFR2VQ?=
 =?utf-8?B?VVlNeTlSQXd2cUxLTmpCM1hxd0V1SVJ5ZkVZdHJRSDlWTElqdTg0RzlBYkhW?=
 =?utf-8?B?YzZBNTFNZ3JHQlNLb2w5cTUxT1RQU3BhbkJIY3QxcVFkTnZkYVlZb1pnblFt?=
 =?utf-8?B?U2hxT2k3Smx5RzBJV2svdExDTm9lUGsrTHJ6c2VBdWJpcXlwTWNBYStWVGZt?=
 =?utf-8?B?c0VsTkR5N2JBaEIxVCtCV0RJQWdJb3JXeTNuZ3pwT1FpSjgrb29lK204bDN3?=
 =?utf-8?B?SVR4UHE2VlZCQkoyZm10K3ZTUEVSUXdROEZabFRFMzh4b1hETUtORzBTamRs?=
 =?utf-8?B?ZFhXbktDYnZ3dlNOVWFkemlqVnl2RHk0cU5sMnQ2TFQ5MHFkeFRWQkxtZXZB?=
 =?utf-8?B?Q0Z5azh2Rlo4LzlzS01lTk9ycmFpdU9rbmZaVjVVUEhxZXpIMjVsK21CY1Aw?=
 =?utf-8?B?bUN2N1R3MzRoSSt5dWExZWRVa1JYbHJYaEtTM1I0eEJXck1EdlAzMlduUXBy?=
 =?utf-8?B?WlNYWHlPWVFsOFFmRFlDeVRMRTFJZ1Q4ZFBtL0xnb28xVm9oekEwOUhLcHUy?=
 =?utf-8?B?b2Nqb0JGN3lCNWJIajBpUnErZHZSWlprOCtDWlNPNTVTSFJMM3RTUHdWNnQz?=
 =?utf-8?B?cTc3azRYOVZ5OTBvSFhtcjJ6Y2NUSmgzRjVsZjY1TXBERndCOGZOZXgrRmw0?=
 =?utf-8?B?d2h4eEFQQ2hKWkgrNXNnR2dxZFZJOGFLbVg1ZjBCNWN1RXJCTElVRktzTk9a?=
 =?utf-8?B?T3JhUmRaV1ZMWE0vMk1KMVRMNFdleDFiMHFvQVRIa1d6Umd5bXdoRC9sSUJn?=
 =?utf-8?B?MGhCWEJZdEtpRnlsdDVjOHluVisvK2lqNGxRS1pJU0Q5QUJRZ1VVaGNCZUpT?=
 =?utf-8?B?WHo0RlRUWXRtTGJJRFJKaThvNzNMRTNRaGYwU0g1TzhMbTRXWUdWMVpyU1lF?=
 =?utf-8?B?N25SUXFwYmp2ODdRZnMwVkRVVDFOTW1XYjVHUUNyd2xDWitOMmk2dmlaNWlT?=
 =?utf-8?B?cVRuZURCa3hic01QWnN5VG13d1hjanpmU0VHck9WU1ExZFRTbHJGU1VuYjNk?=
 =?utf-8?B?TVZVcTMyQjBreG52ZnNDNlNUY3RjbXp6MjVDdnhmc1dMVFhnc3l2aDVod2Ex?=
 =?utf-8?B?eUVNTXBGcDZpcHFTLzYyWVYzbEVwcjNHdzExdEV6Z25xa3RyZ295OU1VQUVz?=
 =?utf-8?B?NjVJcklWN3Z4RGptbEwzMDcwTkNRWXRKc3R2Uk1ITGZoWUZ5T0Vsa3c1QTFl?=
 =?utf-8?B?VVc4Mk5keEh0cTFOUCtvdnh1VzBPNFp4VDB6cmJDb1VmcTA1SHFUTE5haS9K?=
 =?utf-8?B?ZFc1R2lqV0NSK3dJVkZyQk8zWDFPVVlSNU1TbWFxR3A5eUxlRkJmOVIwN1RF?=
 =?utf-8?B?bHFUcDBMNWVXZWI4ZHM5d3VGcU9lZTVFNTR2OFRlTFRDcGRFQVVmM3dVczVE?=
 =?utf-8?B?S0RXMktSa0RFMy95NjZSVGd3elQzZUpnZkxFdGtSMVZHMUlEWWhBamU1eVYz?=
 =?utf-8?B?VE05aFVUWHpwM0cyS0FpRjNKb0RIaStaMHdQSkpmZFUxSzFlOTJlMXZicGU3?=
 =?utf-8?B?c0FVTXRTWU5SS3JjZHVlNURoTFhDTFFzdGVvdW5ENnpuQS94UXRDQmd1MGVs?=
 =?utf-8?B?YkVwV1RsTEJ4ckhvM3pBVDd0a1dWMTZMaDcwM3k0eGJzTXkxK1ViSUZWRFYz?=
 =?utf-8?B?QnREdnZ2Tko5U1puMzFXQWNrVHFZNnRTVWdzV052V2srVHhQK2RXWmJOUWI1?=
 =?utf-8?B?M3YxQVQyb01Od1UzdDZUeldnRnZNd216dHNYdGFUL2QzN3Z4eTJPUnFzdThk?=
 =?utf-8?B?Q00vdmUrVDI0K0NJTUlWRUFOM3QxR2s3cHdGVGNsVEJpQms1TFl6RnE4Q2I1?=
 =?utf-8?B?S2tMZk5heDVoWmZUclFRK085Vk4ybzRBRFRKSDNIMk8vV3BuZ2RuR1RKWllZ?=
 =?utf-8?B?MHhVdHllWWZxYVU3WE9xN2FvUk9BOS9mT1ptUElZMCtaZmkxWEJWT2FUd3NU?=
 =?utf-8?B?ZytVUG5HamN4UzlTL0h2bWZia05RLzNkVWMrV3gxc1V1Nk4vTlNZazhMTTRo?=
 =?utf-8?B?bmliVDBsNTRHRlhSNFE3SjVsK0NQQjVwU1VVVmdwQ0RxNlZRWHR0T1YyVWIw?=
 =?utf-8?B?ZlVjNzArbmdmbERxN0FZOEpNK1k3N2JBR28vRlhzeVIwMDcvakI1dEV2NHE5?=
 =?utf-8?B?K0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 923ff029-5ab7-4b78-319f-08de167afd76
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 23:37:44.3850 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +A/EVCWqyhf5JLPmFKRk/dGpfLsl4ojBXcpvjT9LPnMn8n1Dr3tNl2yFumOBFgk7XiO4LSIV2yVnBdEmLA1QF5GEeNhr/5vjRc7MJfdhl1g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8726
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

On Fri, Oct 24, 2025 at 12:10:31AM +0200, Michal Wajdeczko wrote:
> 
> 
> On 10/22/2025 12:41 AM, Michał Winiarski wrote:
> > In an upcoming change, the VF MMIO migration data will be handled as
> > part of VF control state machine. Add the necessary helpers to allow the
> > migration data transfer to/from the VF MMIO registers.
> > 
> > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf.c | 88 +++++++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf.h |  6 ++
> 
> wrong place for those helpers
> 
> just promote xe_reg_vf_to_pf()
> 
> or maybe it can be done like this:
> 
> 	void xe_mmio_init_vf(struct xe_mmio *vf, const struct xe_mmio *pf, vfid);
> 
> then
> 
> 	struct xe_mmio mmio_vf;
> 
> 	xe_mmio_init_vf(&mmio_vf, &gt->mmio, vfid);
> 	val = xe_mmio_read32(&mmio_vf, REG);
> 	xe_mmio_write32(&mmio_vf, val, REG);
> 
> let me try check this out

With:
4504e78068924 ("drm/xe/pf: Access VF's register using dedicated MMIO view")

The helpers are somewhat no longer necessary.
I'll move the logic to xe_gt_sriov_pf_migration.c and drop this patch
completely, moving everything into:
drm/xe/pf: Handle MMIO migration data as part of PF control

Thanks,
-Michał

> 
> 
> >  2 files changed, 94 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> > index c4dda87b47cc8..31ee86166dfd0 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> > @@ -194,6 +194,94 @@ static void pf_clear_vf_scratch_regs(struct xe_gt *gt, unsigned int vfid)
> >  	}
> >  }
> >  
> > +/**
> > + * xe_gt_sriov_pf_mmio_vf_size - Get the size of VF MMIO register data.
> > + * @gt: the &xe_gt
> > + * @vfid: VF identifier
> > + *
> > + * Return: size in bytes.
> > + */
> > +size_t xe_gt_sriov_pf_mmio_vf_size(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	if (xe_gt_is_media_type(gt))
> > +		return MED_VF_SW_FLAG_COUNT * sizeof(u32);
> > +	else
> > +		return VF_SW_FLAG_COUNT * sizeof(u32);
> > +}
> > +
> > +/**
> > + * xe_gt_sriov_pf_mmio_vf_save - Save VF MMIO register values to a buffer.
> > + * @gt: the &xe_gt
> > + * @vfid: VF identifier
> > + * @buf: destination buffer
> > + * @size: destination buffer size in bytes
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +int xe_gt_sriov_pf_mmio_vf_save(struct xe_gt *gt, unsigned int vfid, void *buf, size_t size)
> > +{
> > +	u32 stride = pf_get_vf_regs_stride(gt_to_xe(gt));
> > +	struct xe_reg scratch;
> > +	u32 *regs = buf;
> > +	int n, count;
> > +
> > +	if (size != xe_gt_sriov_pf_mmio_vf_size(gt, vfid))
> > +		return -EINVAL;
> > +
> > +	if (xe_gt_is_media_type(gt)) {
> > +		count = MED_VF_SW_FLAG_COUNT;
> > +		for (n = 0; n < count; n++) {
> > +			scratch = xe_reg_vf_to_pf(MED_VF_SW_FLAG(n), vfid, stride);
> > +			regs[n] = xe_mmio_read32(&gt->mmio, scratch);
> > +		}
> > +	} else {
> > +		count = VF_SW_FLAG_COUNT;
> > +		for (n = 0; n < count; n++) {
> > +			scratch = xe_reg_vf_to_pf(VF_SW_FLAG(n), vfid, stride);
> > +			regs[n] = xe_mmio_read32(&gt->mmio, scratch);
> > +		}
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +/**
> > + * xe_gt_sriov_pf_mmio_vf_restore - Restore VF MMIO register values from a buffer.
> > + * @gt: the &xe_gt
> > + * @vfid: VF identifier
> > + * @buf: source buffer
> > + * @size: source buffer size in bytes
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +int xe_gt_sriov_pf_mmio_vf_restore(struct xe_gt *gt, unsigned int vfid,
> > +				   const void *buf, size_t size)
> > +{
> > +	u32 stride = pf_get_vf_regs_stride(gt_to_xe(gt));
> > +	const u32 *regs = buf;
> > +	struct xe_reg scratch;
> > +	int n, count;
> > +
> > +	if (size != xe_gt_sriov_pf_mmio_vf_size(gt, vfid))
> > +		return -EINVAL;
> > +
> > +	if (xe_gt_is_media_type(gt)) {
> > +		count = MED_VF_SW_FLAG_COUNT;
> > +		for (n = 0; n < count; n++) {
> > +			scratch = xe_reg_vf_to_pf(MED_VF_SW_FLAG(n), vfid, stride);
> > +			xe_mmio_write32(&gt->mmio, scratch, regs[n]);
> > +		}
> > +	} else {
> > +		count = VF_SW_FLAG_COUNT;
> > +		for (n = 0; n < count; n++) {
> > +			scratch = xe_reg_vf_to_pf(VF_SW_FLAG(n), vfid, stride);
> > +			xe_mmio_write32(&gt->mmio, scratch, regs[n]);
> > +		}
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >  /**
> >   * xe_gt_sriov_pf_sanitize_hw() - Reset hardware state related to a VF.
> >   * @gt: the &xe_gt
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
> > index e7fde3f9937af..7f4f1fda5f77a 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
> > @@ -6,6 +6,8 @@
> >  #ifndef _XE_GT_SRIOV_PF_H_
> >  #define _XE_GT_SRIOV_PF_H_
> >  
> > +#include <linux/types.h>
> > +
> >  struct xe_gt;
> >  
> >  #ifdef CONFIG_PCI_IOV
> > @@ -16,6 +18,10 @@ void xe_gt_sriov_pf_init_hw(struct xe_gt *gt);
> >  void xe_gt_sriov_pf_sanitize_hw(struct xe_gt *gt, unsigned int vfid);
> >  void xe_gt_sriov_pf_stop_prepare(struct xe_gt *gt);
> >  void xe_gt_sriov_pf_restart(struct xe_gt *gt);
> > +size_t xe_gt_sriov_pf_mmio_vf_size(struct xe_gt *gt, unsigned int vfid);
> > +int xe_gt_sriov_pf_mmio_vf_save(struct xe_gt *gt, unsigned int vfid, void *buf, size_t size);
> > +int xe_gt_sriov_pf_mmio_vf_restore(struct xe_gt *gt, unsigned int vfid,
> > +				   const void *buf, size_t size);
> >  #else
> >  static inline int xe_gt_sriov_pf_init_early(struct xe_gt *gt)
> >  {
> 

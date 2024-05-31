Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A118D59E1
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 07:31:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEC1D14A6DF;
	Fri, 31 May 2024 05:31:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WeBYJH7W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAFDB14A6DE;
 Fri, 31 May 2024 05:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717133489; x=1748669489;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+Mwkizj4rR9j77pTI9LH2kV70Cpxgk/LJicHWF7vWYY=;
 b=WeBYJH7WoQVXc1+/a2Zi76S0gfv1xTePIqSq620e+E71Oh8hemXQzuNt
 Q1IY7I4CYxG4cciKc+soOSvQwcU76dIymFsac5EJENDACZXlBoMdvxMt2
 lpxBLcBQb37/bGJ76vOTEqQEpRe4ZX6zO/j1jAPoxeQkiDSRYGzA//VKN
 mXuoy43RGJ7fThcDFDAXgquoqzePUR9uBRh4ELBfjB0YZwTEHESdrelEK
 SpjL5P1zBtXxatO4MmUYjpKnjzkfrqAFi6SW8rV4AFfpKNLloYYHTfpZ0
 bGKtlZIoUid0xVylxg1Z5BHMbnuFyU0QyJREH1w7XxMPQWcLXFmboesRZ A==;
X-CSE-ConnectionGUID: iqetuf/aQza7VL/LPFBYhg==
X-CSE-MsgGUID: lOrJ4tHRTh2wo2EBOXedCQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="17507565"
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; d="scan'208";a="17507565"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 22:31:27 -0700
X-CSE-ConnectionGUID: uGEsT+E1TyazmEJxEF7jbw==
X-CSE-MsgGUID: PszRp9FlQOKVjLUT3oRIng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; d="scan'208";a="36626356"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 May 2024 22:31:26 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 30 May 2024 22:31:26 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 30 May 2024 22:31:25 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 30 May 2024 22:31:25 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 30 May 2024 22:31:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mF6QNhK7d12woOX38N/6CzchEIwogDhna/2u62HoyTCnsMkEdQtf1zTRtdo+dHVhgWWEFc22uLkuxFI2OBMrG/wZlofB2nEsrYWK+RhFeZS0ornQhF7xBhSlBBlEag2Ijg3TP9Z3ZfY+nEI4ZoD/qyi1Hycpp5RxHJ+kvKJXtZIyGdN5PjRlWkwFPqds/LtPQgJVGbDgp9rjTwwGwjXyxX24y5tyTjlPkjGwbsz/kn453VJ0fRsCp1Uuw+9MOHS9bB3zkxdC4pEUDHsRDXHoCv3SFInsrsJzOUdJl5ss2+K3Snua86HK6GhYekaKoJksPRtIQ+ZJOj9U85p7KMjhFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=etR9YfCPwtU7XJtMO2tofbniqoYwXoRzAjgDni+hzro=;
 b=HVGjk1GF1fFJ0oK0ZSxQuZiXuS2BMcA+e/J6uN/l53hPvl5a30zN4M1xCl6NWhQea76z2z9LDHRErGA4wUNX9WX/w5qDw6Ew5CvEYJPmn7b9DEMcmaM3R3cdgr7VeCMTzNTQiEhoWndhBph98AZK2KP/Oawodw6msS+Jg1F53UIcWSwL41uUJdBJNzfy9yzj4Qx/+EXQmmmWQ5B9K1Pokc2zphvRAN1pYm5Zc2t0ipSN8UWg0r8NLg4hvngEEId5tuQbxedsceQKkDY6xbMJLqdTHYG8epZjOxZQLwDgufrL+WJ2FkicWMuYMU0OlIG1QCzSPae+B3YFMNLUOv7TKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by PH7PR11MB7607.namprd11.prod.outlook.com (2603:10b6:510:279::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Fri, 31 May
 2024 05:31:23 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%6]) with mapi id 15.20.7633.021; Fri, 31 May 2024
 05:31:23 +0000
Message-ID: <5afd0cea-fffd-4231-aabc-2144ed941ba3@intel.com>
Date: Fri, 31 May 2024 11:01:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 3/8] drm/i915: Update trans_vrr_ctl flag when cmrr is
 computed
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, <jani.nikula@intel.com>
References: <20240530060408.67027-1-mitulkumar.ajitkumar.golani@intel.com>
 <20240530060408.67027-4-mitulkumar.ajitkumar.golani@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20240530060408.67027-4-mitulkumar.ajitkumar.golani@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0097.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::14) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|PH7PR11MB7607:EE_
X-MS-Office365-Filtering-Correlation-Id: 9350cd64-9261-4535-dd67-08dc8132e8a7
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OUVJSnVMVEFGUEVNWExzbUt2MWVZWTNyZEF6WnZDZVFwYzdQdkNRK1hyY2hv?=
 =?utf-8?B?ejdhZkIwQm9rd1h4bEFJNDN4eFJQZlVLQWZxMCt4Vm84aGZuK2Y5REt4ZEp2?=
 =?utf-8?B?VVdwMWVlaGVmZVZ5bWFsZjMvYVpyREVNT3VibzVFK25JNXlzbFViM2RDeFg2?=
 =?utf-8?B?UVB3bkZGQWRUNC9YS05wckNZeHAyRUhEUkIzTXNBOGFoczBsb3V6WnVIQ2RM?=
 =?utf-8?B?Q2JqYWc1UWU1b2hrRUNOQ2ZVSkw4VHN5QTdwcUxrWVc5Q25vc2xFZWN5SjI4?=
 =?utf-8?B?VGZFemJSd1NlUUhCN0dTbXBoVzR1NGk4cWlpVlRSdm53MEFsSXlhdCsydVFB?=
 =?utf-8?B?OExpeEFzTGlwcWdNNDJRMG5LWkxKbTNBK2pIeWE0LytvMjZHMHdIMXBVMitL?=
 =?utf-8?B?OFk5K2pjUjVqWGJ1WVFhV2ZnMUZ0WDJvNnAyYjBlVSsvV0phZ09Oa1MwTGd4?=
 =?utf-8?B?bmFLTGdYTWp3Q1ZxQXYrY0JpM0RvVGkxVXJrWlNLemtlTzVHektJcEhSSlN5?=
 =?utf-8?B?WTFGNi9PT3E0WnlOTlpJcDJ0Tlptc2VNaU4zamowclY0SmFTK2NvWXA5QnNx?=
 =?utf-8?B?K1FsV1FmMFZ1M3lmV3BuUjFHTFZwZ2JwNDdCYllzVkxseWxYTE1LbFA5UGJn?=
 =?utf-8?B?bDVmeVNUSlhsMk45ZXI0V2J6YTgyZzVPZmFmSjMrNDJnMm1oZzdxTWpMcVpV?=
 =?utf-8?B?eitoMEI4ODROM2FSRXMyMTFNKzU3Q01TeFB6TGwrd21OZGUzbE52S1NqNEpS?=
 =?utf-8?B?UGRmQlFhRG5yNmhOanVKSEdwME9waXZGYXM1cWVzNm1QM0RzbTl2UmhobEZl?=
 =?utf-8?B?clp0dGZ6OTN4bHZTRHM3eXRCV0hTWEpDRVM3Z0kwVVhDcjhDREZCMVpzR3BL?=
 =?utf-8?B?UXVlcDBiWVVJNUdubjJJSkFtY3ZjZFZ5dXdodWhaeFhDR3JRVU9URHRxeUhm?=
 =?utf-8?B?RStHSnlKQ3dQT2I5bmRubEVxWTh6bEF3ZzZBRHV4NTVBMmNCYmoyZ2dJWFYx?=
 =?utf-8?B?MjZhTzVXWFNiQlgzdmVQWk9GVE5OMU5QdE1QWEVrM3ZDOUoyTVZHMHJTeWw2?=
 =?utf-8?B?YWpSK1JEbVN3d1FIQUhvTHlpbkxHbFlNNzMrUythS0F4aHFuWUp0TkQrK2dC?=
 =?utf-8?B?VkdVejdybno4M01TeUZxWFozUWZJSkNjbHp6d1ZjbE1xbmcvOVFDUS9xNVg1?=
 =?utf-8?B?cUkrVXlyMXZTeGVwbVNsWmo3YWR5VHFhYlo3V2FhWmlYQnpRaGJnZEpCMDhn?=
 =?utf-8?B?N2hqRFJjVXBGNkl5MlRsemZEOEpNVUVlcHBiRGxCaU0zZFdDTzZiNDQ4TGlJ?=
 =?utf-8?B?bGhDUmd3V2NrV0ptNFppV1N2cUc4N3JiUmRrT1hWT3p4ZEhvRjJiV0poQjVo?=
 =?utf-8?B?S0lqTm5ZZlI5N3ZWU2w4YS8xdXRhSVloYjhaWURXUXV2RlEwM09HSXorOU1w?=
 =?utf-8?B?c2dEdXJJT3NMRVRVZXZpaEppalZYSTBhMkp1VDZqMXB6UnloaGhWRlM2c1Q1?=
 =?utf-8?B?VmExQ3FPb25wWkx2L0ZLQ25QU2R0ZC9GK3YvUk9lS2JJMVZjK1NmWXFmZUFT?=
 =?utf-8?B?Y2lIT05mWjVJQkhWSm1oaWVRdklveVd6NGwzVU52SjRJTTNlOXdxVU1XYzFW?=
 =?utf-8?B?V09KaHpTU3JvRmd1M3FmMFhhdHNLNUVSWEVuZEVxT2JvY0ZXUXNPem1QdjlS?=
 =?utf-8?B?UWEzTGVCT1dVOUJ1MS80UlVQL3dCOGFrUHJaZ1BLdDR5cXA5RVplSm5BPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UzJxRFVuMld2WlhNRS9yUU1nK3pUemtBT3Q3V3czZGEwdkM4cEtvTzkyR0pR?=
 =?utf-8?B?azhoaUFiOFVqc2lnV0UvL2lOUW9KeW0rTGN5YXIwTDdURllydjNZUjVTcjF5?=
 =?utf-8?B?eWlVSFpjL3dYMXBJbG8zZUFuSnJmMlBWMUVRUUpZRHFiT3ZxdUFmTmh2eVNu?=
 =?utf-8?B?cWU2Q2NZV000bDk5MjhzMnNzNjB2RW9jNGNhMVZmV3E3c2E4UzVjYXFLYTJV?=
 =?utf-8?B?MlNTa0F1cmYyRmZ2Nm82bTVTLytKNTdUR1FFc0haZkNVai9xQWdQWUdOZXJ2?=
 =?utf-8?B?bzQyNkpwOGNkcUMwOHdNQ3hNQmsxZjNZTXNNZzc3dmNXTXZmOXpVMG04OFpH?=
 =?utf-8?B?Z1JFektGOFdpc1ZJeFN2aTdrc3hZbHFsdG8xMGp0TmxaSG4xd1o4a1pGb01y?=
 =?utf-8?B?R0lPYllpSFhyVTUvdm5hRlN5bEpOekNBM2lMSXNqY3AxSlAxWWQ2VWk5S3pZ?=
 =?utf-8?B?RU1oMU5ScFhnRnZybFBNQWltSnMxNVZJVzlRUDZyejRST3NQa2Q0aWFWY08y?=
 =?utf-8?B?REMxR3lIUFZFcDdqK01QOVFmY3JZQW9OamtjeGNRYzNlME5wdGNHQ3lIbnNp?=
 =?utf-8?B?MVlYbFRoUVJaR0RBeGRrYi9SbGNlWHV3RUF4OGhSbEFySGJzOVlocy82LzNw?=
 =?utf-8?B?WHJpM3VYa01Bd1ZyWVRIdHc3TGNoWWJNS3c0MDEweEdKR1hmM1cvN3ZQdjJa?=
 =?utf-8?B?bjZxM3dxUnI4ZHVxb0F4UnBHRHU4MGZST3Z5Mm9tYktXSzd3NUE2OGpHRGdm?=
 =?utf-8?B?UnE0K293UnRuNEZCRDF5bHdGUng1alN5YTVjUm4zYnEzcEdyeW1UbHJqNlJU?=
 =?utf-8?B?bDMzV3VCekZIY2dvWXJzYmgwb1NxbFVIZUxaMFdlQ0M1dW1oemZCamR2Wk5J?=
 =?utf-8?B?aWtLNmo0L2tDRW5SVjM1OURBclJzYXR3QVMwWllNdUUvQkFOQWJ4VlAyN3Np?=
 =?utf-8?B?OC9ZL2g4S2VXNjJ0bVRuN3VTV3ZHN0gvN2NvMUY5YWdIVXk2M1J1YmdIVVll?=
 =?utf-8?B?b2VyR0VVZDU3NEdXSmVXVGhTMHBsMDZxVzVEMXljQVAxcVdGZnF1cnN5REMv?=
 =?utf-8?B?NEZPcHh3d0FUTk90REZ1MVZkUUNHb0JSMVVIa2F0RFRTNFAxUEJocFhhdDFp?=
 =?utf-8?B?RTFXcWdlL3ZSK2t3bWlVQjFoejFkQ3k3Y1pPbktOOFV2VEJXcHBsNGJhQU1v?=
 =?utf-8?B?WkhqV2JvdXYxME13Y0wrUStXM0xITXFUS2EyU1ZHQU0zMXp5em52VEVkNk02?=
 =?utf-8?B?eHJVMlRPSUZ1KzYvQnVTMkdZenZGRDlOT1ZkRGxFVDRVQ0VNSWhlL3J6Y0U3?=
 =?utf-8?B?eFJESmYwQjVMYy9RUWFjeGxkRmNoZXlxMUJoQUZRZHdEeitJbFVyOVVadi9Q?=
 =?utf-8?B?MmdoV3NDbDFQN3lDRUphKzk5K3NoeVhGZzFvaDFhRHVlandUVHJUcUFCSnJZ?=
 =?utf-8?B?WnJSKzhPWnFndVFRS1dFa0g0ZmNuZkMrU0VsOFE4cEtyRGVCNTEzRlBOK2t4?=
 =?utf-8?B?UzZXSE5qN3F4RHBBUXF2R09jTkxkTTFaYlhJM0JJZ21OaXNQTWovYWhYODd5?=
 =?utf-8?B?ZVBhdkdKbkxlcjA0aGRBUU4xSkw0dFptNy9Gd3M2aGUycEJhYklPZ3hRNERy?=
 =?utf-8?B?eDhpSjlsU0R2dUY2b0p4U0hSZGN2ZG0rbHlzbjR5amlLbFFkZUhmYmFEZWxo?=
 =?utf-8?B?S21kTWcwSkhMcnV6Nk52WjF0dDZuUWx1SEtUekd3ai90eFBWdXdIRmxkejNo?=
 =?utf-8?B?TnlaeGo4UThabzBOdjZLS3RheHhpNWhvRUZVdEFpYkVFVGh0U3NaOThHZnA5?=
 =?utf-8?B?U0RZQ0JxRjM5ZUNvckpiMFBubWUrY1Z2aVkzMTVTQ3NibGpDYXgvMVlJa0xn?=
 =?utf-8?B?ZTd1UXFuSktaUVh6YTR4VXRFYy9RSW5NZUU1YzdCZTFEN0RGS2xwTytkSEYr?=
 =?utf-8?B?YlhEQklmdWFKTHNPWi9PMS9leU01amxDNE5Nb1QzQ3JINnFtRWhNL0VnTFgv?=
 =?utf-8?B?SGRtdUhGQlBST1V2SjZWZHkwa1VlZDdSdmlNbXFNWXlWcGJxSzZlY1ZPNU9n?=
 =?utf-8?B?VFo5L0N2THpMSllLYkNGamFZRGlBdkJRTmlKdTVRN1dhcTI1YmpEYWdtUUVU?=
 =?utf-8?B?a1RZMTRmVHorVTZTMzQ5UlN2VkJOejVBQ0hFdzZCSUphcWN2SS9VSXRMVUF2?=
 =?utf-8?B?eUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9350cd64-9261-4535-dd67-08dc8132e8a7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2024 05:31:23.2608 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QLbt3EsSxrwI7LVK4YLjCpubjlFrr6YqsKOXUV2QuAV7aiFPjluQrAFCaLLOqsUTAMAoVkS/KftMSnxbsUEt+iRIITHV0a/oHfWgjR7BFJ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7607
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


On 5/30/2024 11:34 AM, Mitul Golani wrote:
> Add/update trans_vrr_ctl flag when crtc_state->cmrr.enable
> is set, With this commit setting the stage for subsequent
> CMRR enablement.
>
> --v2:
> - Check pipe active state in cmrr enabling. [Jani]
> - Remove usage of bitwise OR on booleans. [Jani]
> - Revert unrelated changes. [Jani]
> - Update intel_vrr_enable, vrr and cmrr enable conditions. [Jani]
> - Simplify whole if-ladder in intel_vrr_enable. [Jani]
> - Revert patch restructuring mistakes in intel_vrr_get_config. [Jani]
>
> --v3:
> - Check pipe active state in cmrr disabling.[Jani]
> - Correct messed up condition in intel_vrr_enable. [Jani]
>
> --v4:
> - Removing RFC tag.
>
> --v5:
> - CMRR handling in co-existatnce of LRR and DRRS.
>
> --v7:
> - Rebase on top of AS SDP merge.
>
> --v8:
> - Remove cmrr_enabling/disabling and update commit message. (Ankit)
>
> --v9:
> - Revert removed line(Ankit).
>
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>

LGTM

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


> ---
>   drivers/gpu/drm/i915/display/intel_vrr.c | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
> index 1f363e34495e..c2b5424f53db 100644
> --- a/drivers/gpu/drm/i915/display/intel_vrr.c
> +++ b/drivers/gpu/drm/i915/display/intel_vrr.c
> @@ -284,8 +284,14 @@ void intel_vrr_enable(const struct intel_crtc_state *crtc_state)
>   			       VRR_VSYNC_END(crtc_state->vrr.vsync_end) |
>   			       VRR_VSYNC_START(crtc_state->vrr.vsync_start));
>   
> -	intel_de_write(dev_priv, TRANS_VRR_CTL(dev_priv, cpu_transcoder),
> -		       VRR_CTL_VRR_ENABLE | trans_vrr_ctl(crtc_state));
> +	if (crtc_state->cmrr.enable) {
> +		intel_de_write(dev_priv, TRANS_VRR_CTL(dev_priv, cpu_transcoder),
> +			       VRR_CTL_VRR_ENABLE | VRR_CTL_CMRR_ENABLE |
> +			       trans_vrr_ctl(crtc_state));
> +	} else {
> +		intel_de_write(dev_priv, TRANS_VRR_CTL(dev_priv, cpu_transcoder),
> +			       VRR_CTL_VRR_ENABLE | trans_vrr_ctl(crtc_state));
> +	}
>   }
>   
>   void intel_vrr_disable(const struct intel_crtc_state *old_crtc_state)

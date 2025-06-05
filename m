Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 939F1ACEBDA
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 10:29:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 981BA10E842;
	Thu,  5 Jun 2025 08:29:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YWKrJ9fm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 391EB10E832;
 Thu,  5 Jun 2025 08:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749112151; x=1780648151;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=SYQh1aSJfY2Xv2XXGFvQC/yDevgeIfmTusMIYAHG9M4=;
 b=YWKrJ9fmM7/43uY7MY9NFO7md16nKNFYHpKb5XIlVX8Y7rfetrabDSnY
 jY4XYhHRJqSUd4syHYGfPlNNHCm4gCyccTi5WSb5mNe0FbZBojqZdJXtY
 vESZa81RDjntL9mPKdz9csl/0Y7CDheEkQRZhhwSwmhHdP2Lu2umJHuTc
 idit6h5YwCGE+sSrJF+1awlig7xzOoU/F5FY3i58QynXcJVNhhFVmqZ6i
 u2gJEtS7Ndp+T0+/iANGYTbyECMWn3LE6V4QKewKJS9OyLwCLt1ufLMni
 Y+8IGv1KWO0/hEZnO6bwPBk4ZBTyAFjKfI4YVi9vj81OHRUclZBLKPZ4Q g==;
X-CSE-ConnectionGUID: +jie7zaDRLeQH1siTpcQHw==
X-CSE-MsgGUID: uPs4ZNW0RpCsJY/WBOiUJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="50456236"
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; d="scan'208";a="50456236"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 01:29:11 -0700
X-CSE-ConnectionGUID: HJMeQLiiRf277p3HFIwMSw==
X-CSE-MsgGUID: jtJzghjxS1mVznvZjq0jjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; d="scan'208";a="150454103"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 01:29:11 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 5 Jun 2025 01:29:10 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 5 Jun 2025 01:29:10 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.50) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 5 Jun 2025 01:29:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N2dFAgw4GdX5PfSI3BvBDl31HEb+SOOxJUVxaNNLGphQoKsdITJD9Bf2Egru2cEhbabnzh1J37N5p0hPv7P1O5LH9C5pAS3Oc6Xi6hOSogoh1c8FPWjl4Sg/lzo0Y4cHzY1mWYSrdD9QxJHNQ2NX+dVAjJvcI2HT8ZugknRALBA0rKE1NzaWPGsxEBhN31Dd4BlXI+i5v2XMupmGRXbY7oOd7fuOOvMgvnhGptq17wTJjM/I3W26yyoPAfBafsPSiYL9UmUrUaSUHq1mI+YJVsFGYqTGG/1eHGzIX1ZSNqZKwnXn1PRLsgm6aogPlPm2UsakI8vb8jIioSvhUZm6YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/hJGrbHdwOkXCS07mTmL9+6eFyepWT87tVRpV81Zis4=;
 b=FbqAP+gLNidMsBewCBz668WbNQPS8YlaN4WwvJfODvgj9WXZ8hsfbaXgOicS1JAxuMSkxgPCaKP9c6s53ITgW9k/XXzQ1hJ7ocGaVDi86qrjF4zTOuVsDKshhCikwee01+M/EcUunLyxS/XO3niM55NhrWPN4qLO5qeXBrc3agC51GcA8MumxVa+o0JL2P/y3dWSX62gmgYLLCzDHE7V4ERotvnW+lT5rjqqe8vdgzLQ0hFEJGB1Wi3OzWKU9UDDikN8+am5iuJX1hkfp7FOHh5/rNFsmfPCoMB+aEuVDUQErU8nquWxA7JZ9x0T9dPVNmo1wwLqzExJiihb6t7mYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by CY5PR11MB6439.namprd11.prod.outlook.com (2603:10b6:930:34::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Thu, 5 Jun
 2025 08:29:07 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%2]) with mapi id 15.20.8769.037; Thu, 5 Jun 2025
 08:29:07 +0000
From: Imre Deak <imre.deak@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
CC: =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Subject: [PATCH v3 4/5] drm/dp: Add an EDID quirk for the DPCD register access
 probe
Date: Thu, 5 Jun 2025 11:28:49 +0300
Message-ID: <20250605082850.65136-5-imre.deak@intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20250605082850.65136-1-imre.deak@intel.com>
References: <20250605082850.65136-1-imre.deak@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0011.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::23) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|CY5PR11MB6439:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f90f939-db1a-4113-7d06-08dda40b0995
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dXltUVlISm9mN0h5L05QOEdTbnQwbnROYURuWk1kZWZzalk0UTJCNnVHK3Vn?=
 =?utf-8?B?TVFzcnB3OUtOaDJ1WHI3OXBYTHA1NnpWV2E4OWtzYWgzK01rdnNreEJvQmdE?=
 =?utf-8?B?YkNKUGwyZ2toeGlzYklORkt4M1EwOGdFdzFXQ2lUVnEvMktFZzNqUW9NVzJF?=
 =?utf-8?B?bnRkMTMyRjJJYitTTEZCWU9XYW5SdFJFTVBTR2hnaEpRUERVb09RN2VPRFFU?=
 =?utf-8?B?M21BdWh1SW40dWNYb1BhODBvYm5mOWFGbnc2aHVXM285aHE5RzNPbmxZT1Vs?=
 =?utf-8?B?VUp3ejhNQU9QNG9CUTU2UlZxNWt1dHV2VUhyMGxaN2VGL1N5aHRkZmU0c3NT?=
 =?utf-8?B?bTJhekIyUUU0bmtNY3FyZ1RZWHRFSnlDNit5SVgzQjM1QUZoQVBuY0huM0Ux?=
 =?utf-8?B?cXFsZXllckoxd0YvRUdCbHFmZnBLd0VvYnpyNXdxSS9CNlFGcnh5V3ZwYnF1?=
 =?utf-8?B?M0lpMFdKRFpMeDUra1VUZmFxNWk1SzMzL2lIWjltUGhtYmxpUGdUdDNjR3RN?=
 =?utf-8?B?QlBDR2lqdloybm9JNTlkcEJwQUZ1cXpjeHY2U0dsa3hnMm5QaktBaWtXV1V3?=
 =?utf-8?B?aFF1K1BXMVZIY1hVcmpBYWRhd01zaENkSnpVMDdMcWUyRGpaZXUvM3ZMY1pi?=
 =?utf-8?B?NkhTbzhaSjVNcDY0bkZLcTlSZi9nZ0dXd2NPVVQ5eml1Zk5EYU9lNmZzWWQ2?=
 =?utf-8?B?cUxMeithUWIwb3duUjRRWHpDMitJRk9IMVVqb2R2SEVOclRUcmliRjVQWnVL?=
 =?utf-8?B?VEh0RE15Z1lJR1FERksvRnAyUktNUU5lNWpEeTh1SVhlT0tvRDNlYmRJVGdx?=
 =?utf-8?B?bmJKLzcxYURlL3E3L0hMaUMwdHVsT0hCRjdOR29nVWY1Slg3Qy8ydUdIajZK?=
 =?utf-8?B?MElOVGU1bDBDZmJLM1JCbmcwSi9mendsVll1TXZyY1ZFRS9qc2lBQ08vbEF4?=
 =?utf-8?B?Vk9vVVRnWnZFYmpLaVZVNlV5UkVzR3RxZ1Y2dDlXSnpZTHg3ZHhwOElKb2ZU?=
 =?utf-8?B?MlcvL3J4TkFyd0dWUEpRUW1RcXhlU01hdFhrbWx6Z1JaNDQ4T3J0S2s3ZzJu?=
 =?utf-8?B?UFBJNThjVnBwREcwT1hFUEF0ZmhaK0g4TlMrOXgzMm1jbWdMWjhOa1UyTWdH?=
 =?utf-8?B?a240R3hwTG9nbVZINkM1Tm9QdHlPanE0NEJGZTZJT3BGUWhHQ2NzWkM0VElT?=
 =?utf-8?B?em9BcXZXWElqSW92L0FFdjdjcEVEMnBnVk10ekx3N2VTbEFzNXV5Ymk4QzNk?=
 =?utf-8?B?Vm1Pa2RkZWxPajJmNmJmQlJvcXRCMUFna2VHMXdwZEMzbGk1Y1BxQUp5Ymow?=
 =?utf-8?B?dWQ0QWhHaDR2a0RYWjNjSWJGMW9XTkdEUzJVZ09DSDJUaCtVSWRJakgyQUdq?=
 =?utf-8?B?WllsSDR1dE5YVkNrSWh6TEkxZFg4S2d3ZnJCdTJmbE1ndklKNTFDeVVFR2hE?=
 =?utf-8?B?R0dwZGE2UHJiYzdkMTB6U0k0a0FpS3c2SWFaajVhZTE2WXBSV0dLemdpclNl?=
 =?utf-8?B?ZmRiOXFKd0dnZGJRMkwva2RZbENxSjQzWGZlYStXc2dFaEEzdldNZWlCV0xG?=
 =?utf-8?B?ZzdHMzdRbUJaRGJyTmtDWFQ4c2lwenJISEV2WjA5RHk1TzBONmlFN2dTM1U1?=
 =?utf-8?B?blFyblhjQll0RG5yUExBMTFFZkQ3dmEwWUJyaElIcVlOdGt0MG9SZHowTWhN?=
 =?utf-8?B?amQvaG50d2hwaElkZWREWEVDeHhTbnZGU0lQazN6SkJ4UndRRnE3QWtubksy?=
 =?utf-8?B?MDFKOFdwWGdyN1hMeTNNKzM4ZEZ2dVlNVmRWRUdUM25IRjVtSXJySDFBU25x?=
 =?utf-8?B?UnJMQjR6a3FoQTY5NCtLa01LeXZWZXR3Rng5Um82ei9tR3BZK09wL3ZQaExI?=
 =?utf-8?B?Z2NKNFdXVTUyN2tZUWRBWDdUOVJnc2xOeG9wUC9ualgvYmRTdXNGT2xFVVFt?=
 =?utf-8?Q?XbnexN+fqzI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWcvTGJNY2ZaSFRkVUVBOUNnTGw5bE5xLzZKRDdkM2NwRHJuR3ZMWmtBWUJu?=
 =?utf-8?B?QkV2RktvQjRyaVlod1NaT1NWQjlLOEd6c3NMUjNla2ZiOTY2UFEwTU1BaVZR?=
 =?utf-8?B?QysxMmorQ3pFdEhEUXJlalhrUFpkRkd0OFFTSWNMbks0YWRTTmpSa1V4ZnBP?=
 =?utf-8?B?eUpoQlhFd281bEl5NEwvengrSXROVmk4c2w2blJyR3VrdlVwR2FGSXFDMDAv?=
 =?utf-8?B?YVJWQmVjVVRCcEZlS2RSRkZHSW9zK25OZW9YUUp2cjBNcHdCK2RhNXE1QnlM?=
 =?utf-8?B?SEsySjBBUG5PZWhnWnVrVkhjOHVjb1dHSXZNU2lqUTUvU0YvWkhzWWdLaDhh?=
 =?utf-8?B?TXJTN01JTFFZOXlxWHprU2ttdm1OckQ1eDZ4b2h1RGszK3hlV0dPZyt5Vmp4?=
 =?utf-8?B?SkY0bE1lenVoK3lVUTd0SlRxcmJYN211N2JhZGthdTdDdXRnTEVGTG1RUmJ0?=
 =?utf-8?B?d0ZNOXdMVVhsUThocU9kdVdxNjA0MW9UcENIOXRDYmJ6WXFwQUxvVHZYclEx?=
 =?utf-8?B?ZnBjSjFCdzZzMUgwNURlQWRrQmcvWUsyRS8xMWZTY1cvZjYzUWYyNm1XN1J4?=
 =?utf-8?B?aXFCWmlaTGphZzJkWDY4NG5ESVRsNnRuQVl4d2JRa0FJSG1wSm9OYk9YSHJF?=
 =?utf-8?B?eUJDVEM0a2pIeTFEOUUvV2JqeGNhdU1YdmlzUzRubU5EOE5XZFM1Zy9NT2FW?=
 =?utf-8?B?VWs5cFNNQ0ZGa21ycDJuNU1oQXZwaXJYUVJybUcwQ3dMSmNqRkRjUEpPTmlY?=
 =?utf-8?B?L1R1clJ0U3NMTCtzc29NVWZibDFIZ3ZmNUIxSVk0dG8yL1BURUVLNjFHS3JV?=
 =?utf-8?B?MTk1MXQvY2lNRmZsQXYyTUxLL2FGSXRKd3VVRVF6TWY5WTQ1NDFlUFVIN3pY?=
 =?utf-8?B?Yk9EUkJQT1pua0t6L3luWWFYRUJJeVpSVVF4bHRvaEE4bllDRXpFYnJVajcy?=
 =?utf-8?B?T1cwY2xIMVZOLzJuNEkvNVBGS3k3QlVJTStvZGNrOHdTU01YV3pvVnN1eVFR?=
 =?utf-8?B?S3B5ZmdvWTAzVHVoQVFYRm1NdkUxV011akIwT25HOFRZYWM1Wkd3ZGNPOWtz?=
 =?utf-8?B?c05Bb2lIdXk5NGJTWSs0eFB2NU0wbFo1T2dUMCtIdnVCSzVSeUYvVnVJMjd1?=
 =?utf-8?B?cGxNSGJla3k1cmZ4TGFCSlhKWjRScGwwTit0eU4rSGZXOCtoRUFIbVlzMzJY?=
 =?utf-8?B?V2ltMThYTEdIUEpRRXN3NU9Yd05heG0rL2hZU0QzWkpsbWRSWE1wMTBWaWVp?=
 =?utf-8?B?SldsTDNrZGVIMFcxZDhxaXVISnFIOVROYzlnNER1alhZT2lJeEV0ZFczRWtH?=
 =?utf-8?B?UWh5bXRVWXNCQkk3VWNaRzlaWjZnKy9ubG1QUFFLL3hXOUlZazRNR3ZTSmg2?=
 =?utf-8?B?ZWpnNzhoV0RXUlRjOUZycFkxb1RwdU5JNjZCY2hFYzBsZEg3U1gwNzRLYzNW?=
 =?utf-8?B?TEdJa0cvaWNaOGVrZmNsYTBqblQvVWRyV1JXVkI4a1RIaFBvME9HUTRqSllN?=
 =?utf-8?B?VmdObXhFL0I0cnNqY1FJa0RGNEVNeFZkNDhjVmtXRnNMQzBKL245SWYwOHR2?=
 =?utf-8?B?WWgzWVE2ajhyS2pVQ2xPb2VVa3VSckdyQ2J1NUpjUFFMNDg1cldER3g3NHdG?=
 =?utf-8?B?ak5SZlkwallqbmQ5c2ZBWmhUTkgwcDY4aTRyL3pvaHcwdkpNVEh0RDVlSHAx?=
 =?utf-8?B?Sk9nNm5wVHpzQlh1cHJsREp5VE0vczFVVlFKYW8wdEhDVFNxTE5pcVRNelYx?=
 =?utf-8?B?VWhsZE55WXhLempmU0hXN2hZcUgrVlE4YVpUQ2pDZ08yRkNDczMvV2xvVWY0?=
 =?utf-8?B?WWVXcGJTRTF4QUM2bTA5VUh2U0FHV1BWampjbFN5YlUzSW1xTXZ5QTJ5UlZx?=
 =?utf-8?B?S0ZiUkNYVWVTcjJtdXp5Q1VUWDZWZ2FHR1pGbXZKV3NmRlNlM0VzeUg2OUNM?=
 =?utf-8?B?ako5aHJrRVBSR3FaRDlEZjdJK3ptZktXRFJ5SEsydXRqQnV4KzhHTGRSbGRl?=
 =?utf-8?B?aDQ1L0RkakJGNjN1MnpxSHJLc3hNUHNCS2ZKOTg5Q0x6SlNTaEF5a0lWTk5t?=
 =?utf-8?B?enFxaTZrT0tSMGpZWlpoUC9WVWJJZW9vWUZBcWp4S1dhQUdBZlpPMW5NQjky?=
 =?utf-8?Q?ZbNhjUq5xUp+Q+HDF+0W08y9A?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f90f939-db1a-4113-7d06-08dda40b0995
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 08:29:07.1166 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4eDjs1b9eRPDsO1oJBJsEkRO52gsOMpqOB9lafpIbulTY2oqLhFkm74uAlCIUEY3nJfQ0Z9BQ8WvCXuUDTWVaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6439
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

Reading DPCD registers has side-effects and some of these can cause a
problem for instance during link training. Based on this it's better to
avoid the probing quirk done before each DPCD register read, limiting
this to the monitor which requires it. Add an EDID quirk for this. Leave
the quirk enabled by default, allowing it to be disabled after the
monitor is detected.

v2: Fix lockdep wrt. drm_dp_aux::hw_mutex when calling
    drm_dp_dpcd_set_probe_quirk() with a dependent lock already held.
v3: Add a helper for determining if DPCD probing is needed. (Jani)

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 42 +++++++++++++++++--------
 drivers/gpu/drm/drm_edid.c              |  3 ++
 include/drm/display/drm_dp_helper.h     |  6 ++++
 include/drm/drm_edid.h                  |  3 ++
 4 files changed, 41 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index dc622c78db9d4..d0b9f672d743c 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -691,6 +691,34 @@ void drm_dp_dpcd_set_powered(struct drm_dp_aux *aux, bool powered)
 }
 EXPORT_SYMBOL(drm_dp_dpcd_set_powered);
 
+/**
+ * drm_dp_dpcd_set_dpcd_probe_quirk() - Set whether a probing before DPCD access is done
+ * @aux: DisplayPort AUX channel
+ * @enable: Enable the probing if required
+ */
+void drm_dp_dpcd_set_probe_quirk(struct drm_dp_aux *aux, bool enable)
+{
+	WRITE_ONCE(aux->dpcd_probe_disabled, !enable);
+}
+EXPORT_SYMBOL(drm_dp_dpcd_set_probe_quirk);
+
+static bool dpcd_access_needs_probe(struct drm_dp_aux *aux)
+{
+	/*
+	 * HP ZR24w corrupts the first DPCD access after entering power save
+	 * mode. Eg. on a read, the entire buffer will be filled with the same
+	 * byte. Do a throw away read to avoid corrupting anything we care
+	 * about. Afterwards things will work correctly until the monitor
+	 * gets woken up and subsequently re-enters power save mode.
+	 *
+	 * The user pressing any button on the monitor is enough to wake it
+	 * up, so there is no particularly good place to do the workaround.
+	 * We just have to do it before any DPCD access and hope that the
+	 * monitor doesn't power down exactly after the throw away read.
+	 */
+	return !aux->is_remote && !READ_ONCE(aux->dpcd_probe_disabled);
+}
+
 /**
  * drm_dp_dpcd_read() - read a series of bytes from the DPCD
  * @aux: DisplayPort AUX channel (SST or MST)
@@ -712,19 +740,7 @@ ssize_t drm_dp_dpcd_read(struct drm_dp_aux *aux, unsigned int offset,
 {
 	int ret;
 
-	/*
-	 * HP ZR24w corrupts the first DPCD access after entering power save
-	 * mode. Eg. on a read, the entire buffer will be filled with the same
-	 * byte. Do a throw away read to avoid corrupting anything we care
-	 * about. Afterwards things will work correctly until the monitor
-	 * gets woken up and subsequently re-enters power save mode.
-	 *
-	 * The user pressing any button on the monitor is enough to wake it
-	 * up, so there is no particularly good place to do the workaround.
-	 * We just have to do it before any DPCD access and hope that the
-	 * monitor doesn't power down exactly after the throw away read.
-	 */
-	if (!aux->is_remote) {
+	if (dpcd_access_needs_probe(aux)) {
 		ret = drm_dp_dpcd_probe(aux, DP_LANE0_1_STATUS);
 		if (ret < 0)
 			return ret;
diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 9cca1e6e4736c..5f45820ad62d5 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -248,6 +248,9 @@ static const struct edid_quirk {
 	/* OSVR HDK and HDK2 VR Headsets */
 	EDID_QUIRK('S', 'V', 'R', 0x1019, BIT(EDID_QUIRK_NON_DESKTOP)),
 	EDID_QUIRK('A', 'U', 'O', 0x1111, BIT(EDID_QUIRK_NON_DESKTOP)),
+
+	/* HP ZR24w DP AUX DPCD access requires probing to prevent corruption. */
+	EDID_QUIRK('H', 'W', 'P', 0x2869, BIT(DRM_EDID_QUIRK_DP_DPCD_PROBE)),
 };
 
 /*
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index e4ca35143ff96..75fa9548aefa0 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -523,10 +523,16 @@ struct drm_dp_aux {
 	 * @no_zero_sized: If the hw can't use zero sized transfers (NVIDIA)
 	 */
 	bool no_zero_sized;
+
+	/**
+	 * @dpcd_probe_disabled: If probing before a DPCD access is disabled.
+	 */
+	bool dpcd_probe_disabled;
 };
 
 int drm_dp_dpcd_probe(struct drm_dp_aux *aux, unsigned int offset);
 void drm_dp_dpcd_set_powered(struct drm_dp_aux *aux, bool powered);
+void drm_dp_dpcd_set_probe_quirk(struct drm_dp_aux *aux, bool enable);
 ssize_t drm_dp_dpcd_read(struct drm_dp_aux *aux, unsigned int offset,
 			 void *buffer, size_t size);
 ssize_t drm_dp_dpcd_write(struct drm_dp_aux *aux, unsigned int offset,
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index 77fd42608e706..3d1aecfec9b2a 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -110,6 +110,9 @@ struct detailed_data_string {
 #define DRM_EDID_CVT_FLAGS_REDUCED_BLANKING  (1 << 4)
 
 enum drm_edid_quirk {
+	/* Do a dummy read before DPCD accesses, to prevent corruption. */
+	DRM_EDID_QUIRK_DP_DPCD_PROBE,
+
 	DRM_EDID_QUIRK_NUM,
 };
 
-- 
2.44.2


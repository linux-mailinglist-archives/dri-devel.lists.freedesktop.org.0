Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CD0AC+GIeGmqqwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 10:44:01 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8196591EC4
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 10:44:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F05D10E4FC;
	Tue, 27 Jan 2026 09:43:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EZT4grxc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DB3710E048;
 Tue, 27 Jan 2026 09:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769507037; x=1801043037;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Pi6xcNC2nwtX04ZqyXytyIKAgKSweepcX/MFldPuM1Q=;
 b=EZT4grxc4+h4m97r9l+wnGmn43776fj4kpXQgNt4cHUrCRlc87REa2YE
 RnG4r46VDyo9vYuKZQqePbiE/6RbpXeSeLgwPMVAhhJj6CCHnmg6m6Yli
 WXQdTKPIkMmfE0mt8sgXN7pcCvu70+IjCSq4fo4VCxtvvmKJT70badddP
 JLvRihDZEI8wMOATbKzLN2N422IMNzblXe3wPBD4kwlp7xYXQ3liOAgc5
 D2HrvYjbOqxghliBYHdsQwnOZhC4dWbBgA9iEr7Ah1TFLuM7dEeVqqJso
 Ck6K7BU0VR1oqe2QWvh4xsYJTrnreA7d9SMin3mRKwNblbWkGwgqJ7ylk Q==;
X-CSE-ConnectionGUID: O9GLFe4OQjGwAJcnoROVMQ==
X-CSE-MsgGUID: RzieW8I4RpasU/waHtDS/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="73283368"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="73283368"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 01:43:56 -0800
X-CSE-ConnectionGUID: jxnq42DrS9GV7MYIsCBfyQ==
X-CSE-MsgGUID: YfalZ/4ET1G7wrJg3tPXRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="207167579"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 01:43:55 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 01:43:54 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 27 Jan 2026 01:43:54 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.68) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 01:43:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kyRtwOZqEUuVdBDAR8JraOjpaOKpdpH3Ck/m5LzowqH7OFKaXiyqGvOY1bPf4tX6eYNqnO94g3TzhjbUz7Y7vgFN5wNU1Ripl9t0YqBHt11fYu/nibIwW/wJnnlu64svMk828ZlYrsbFNHJMV5D4MAD2xpCBKbbVDuSSBmsCAwNCeM2wLyi75u2c7Omf0cIh3jQ0JlKxpuRJ+yJyl8f/jpe0piTRYDiG9vKwndRCv1/gfLsD5kZTe04L6EXBGrBtnfMNg12lFTWvxrKZqvYr8Wsh+ZjcyBZczlshTnfKNE1kkkShp5XcSWBUDLVO0Q7sQAiG3FilpZ7fCHVZcWaCIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SLVZMkUdS2kBjeEUbiFLcuInkEhnEH0SwhTIRRwTP20=;
 b=MHIKdB1inugXfR7pZb2U5vvs3Ndtorbr2sFn0wf0QOP5yfmyXHoqRIbu9MgHTyErEY77jQSBAbX1lots5BXTnm+IcVMdIUXxC57se9b4kMvo/clYKwkqZAuYwX+du7ndGJobX0t0rlPMzW0+uJSIRulXqLRIe2Kd/vlIoF97La95btwOwr0rbMPZd6Pg/UKnc41RXJywCGboFGkv2xyzN6fHJSV7P1jhmXrKynzvN5f4lkxtLyLhruNgJiaQUxe7ifcfcy1TnI1sIGWkGsxqUUP3jYI2PA6jvfca3LmgXJMhT9PZ3xPV5i0XpIbhQTPlH61HA1BeiAC+F74hrmkwSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 MW5PR11MB5785.namprd11.prod.outlook.com (2603:10b6:303:197::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 27 Jan
 2026 09:43:52 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%3]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 09:43:52 +0000
Message-ID: <3158c8f4-a33f-4124-8d9f-e3918ce4d8bb@intel.com>
Date: Tue, 27 Jan 2026 15:13:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] drm/xe/xe_hw_error: Add support for PVC SOC errors
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <aravind.iddamsetty@linux.intel.com>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <joonas.lahtinen@linux.intel.com>,
 <simona.vetter@ffwll.ch>, <airlied@gmail.com>, <pratik.bari@intel.com>,
 <joshua.santosh.ranjan@intel.com>, <ashwin.kumar.kulkarni@intel.com>,
 <shubham.kumar@intel.com>, <ravi.kishore.koppuravuri@intel.com>, "Himal
 Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
References: <20260119040023.2821518-6-riana.tauro@intel.com>
 <20260119040023.2821518-10-riana.tauro@intel.com>
 <aXNOgJrHpMtcox-S@black.igk.intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <aXNOgJrHpMtcox-S@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0146.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b9::10) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|MW5PR11MB5785:EE_
X-MS-Office365-Filtering-Correlation-Id: f55d21b4-58b2-4037-9ae4-08de5d8894a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OGQ4RnkzbUNJZDFjNUxHKzNoNUF1NGJRWEp3RzZYUjcxSWtNcUIySnU2UzVp?=
 =?utf-8?B?eW9nLy9yOTA1TXYwdWxJd09NcUE5bkRnZ0VRZyt6TFd2TnBiNWhtZWVSWmFz?=
 =?utf-8?B?QXltZjF2ckkzdVVFYWJsTERYMmdFejRGdUpEWGdYTGJMYzl2ajk2dXA3K3JI?=
 =?utf-8?B?dTZHSDcvWDgrZ21RWUN1eUt4d1poeTB1Wm5TZ2I5d3hZMTdkSFdQRURxMHh1?=
 =?utf-8?B?WXdyZFpQV1JaZDU0Y0N2SDM1V0hMVjN3MnhGVU5hbWdNaW1kRmltcDN5Ujdp?=
 =?utf-8?B?UEZ1SU4wTEo2dVZBNlVZTG40b1QzS3hyWXpTdEo1ZTJvQTJubVNQK1Zvb2xp?=
 =?utf-8?B?YzJ3M25iS2RLdTl3QkVTU1FjTFZXSnBtbk1rUDIrYVJwUnJzRkh0NU00L0hz?=
 =?utf-8?B?a3oxKzZzd0IveDdHY0Fra3ZvVnBROEJJcVlud0Vnd0tQSnRZSUFmZUZoMWUy?=
 =?utf-8?B?Zk8zRmRiY08zRjRPbjZHdmxNTEF2R3RiMTBIVDNTUUh5eDFPM3dicWZUL2to?=
 =?utf-8?B?WjFTOUozLy8wOEdidkoxQU1xM3JGeG04eWV6RVpmakEzZjIrZTZmWUs4S1No?=
 =?utf-8?B?MVZPMWpkTUZGSTZnZkowZ0JXWlNpUE5oSC9SZ2NLSm5SZnZUdmJmaGFDS01L?=
 =?utf-8?B?UnVONmU3Ym1jU3JvRmVTcExzVXRSWVM3bmJ3WStxSGhkN3JzU05oOXNHbWpk?=
 =?utf-8?B?ZnBaL1NMNE5BSFNMZmJsUHI3ZENZQ2FjWW93MEJGT0hHamRicFpPRWlCTGR2?=
 =?utf-8?B?Qm1Tb0l6eXV5SmFBWkNiZ3dxMmJuSWROdE41MWhnWlpGN2ZDaHpuM1pndHpN?=
 =?utf-8?B?QUF4WU05b2J1cE8rdGpTeUk4b2pxNGkwRU1ZS096Zi9ucUo5bFZqT0s3TDBO?=
 =?utf-8?B?OWdBSEtSajRIZEdjek1xTWF2S3hGaDlyNEVZM0syUis1VlZaaTlYSzBnN3B0?=
 =?utf-8?B?M0d5S0RBaFZpcHh5OGxzbWtUOEc4WWp0V29iQVdCRW5XemtvVGtwM0lHT1d6?=
 =?utf-8?B?blZzSkhGSks4K2pBc3VjWldQWE8xNXd4N0ZqSTQ0U0pMVzQvVjdsckdxZ2g4?=
 =?utf-8?B?SEQxRTNtRk9UZkVkYzJzQnJUTkdXTnZ0NTkyWkE2OGp6alNwdXRMV0pGSDFG?=
 =?utf-8?B?R296YjZ0VXJyblkwOW01ZHFROWRwcHBXRk9SRXc0dmZieWc5SlRGQjc5VmtN?=
 =?utf-8?B?RjBKZEpDczM0QnF6WXU1VFVuYXhiaGZaelFMVlhSZ3BHSGVVZjZXcWRjR0VQ?=
 =?utf-8?B?Qmp3OUJsUXJRamFId042b3dXUWkySll1OXBFNEZGYW5Yb25oaVZOZ0hHRDhX?=
 =?utf-8?B?b1Y0WVo1Yzg1RVBoSS84L3VPMW5jRzhxVStVbVh1N0lJcWFpN0FPWWxMeTJX?=
 =?utf-8?B?L040YnpmU2NGKzhVczhHOHVFZFJNVkUxN2R2M25hQkVRQm5lNWFqN0o3T1No?=
 =?utf-8?B?OTZITGpCSkJLNklmbitUNXgzMUFhYXlNcHlwdUYxTHRSZWdjUS9rVGg3M3Fr?=
 =?utf-8?B?TjFzaFY2aGZyUlhCRjhJZC84S3R1d1ZZNWoyUW0zMVFMZGpwaFRlNFpPWWd3?=
 =?utf-8?B?c05kQXRKNFZqN1JqSHBpMVdiTzFNcndxUWlXcFB5ZGZjM2pxT1o5eVFXc3cr?=
 =?utf-8?B?QS9nTHl5bEk2eDh3NHBrRm5OZ21oNERvdGpZNjlxUEwrUWFiWHlJYlJ0bVRO?=
 =?utf-8?B?a2pxSHZNQkc3Z1FIWHdIQ3p2U1VaNGxYdmFTdWszbGl1ajRpQlUwWHlQNmpv?=
 =?utf-8?B?VnEzTy9CaWtLMGpDdWp0K3dhTHlkK0hXL2hlMk5HUy90OHBpcDNhRjVtUm5Y?=
 =?utf-8?B?WjhrTE1ocXg3QXF3NnZWRzlOVmp2ckd1ODJYMEdEa2pYRTlFcll2d2NQeUF5?=
 =?utf-8?B?VmNIWFVUVzVtYmFweGxnbGptMDUva1ZJdWZ0SHRka1dIYStRc3RzU0lmci9C?=
 =?utf-8?B?M3dNVHBsU3B5d0pJeFFYcmZqSkNNdGpCQ1hUQW54d240STZwZTh4UE5hUFMv?=
 =?utf-8?B?VVFKN0lJeVFHeFR1cWRRS0N6Z2JhMVVIcWdGWFJ0WGxyVmpFZnE3dWlnaE9Z?=
 =?utf-8?B?VnlJM01vUUdjV3E2MThrUFI5THphbkp0alNIU21USStoWFhBRmVXZHpnV1gw?=
 =?utf-8?Q?O9DY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eW4yd200ZW1oczJIUXBNb2oxWVgwWjVqL2ZPS1pLcDBjN2RNOE5JeEZDS1Zr?=
 =?utf-8?B?c0x5Y0VjL1FYd3JCZVVzZllMK3RGN0h5ZnJYZUhIRGxIajd3b1VtTTUvdE9O?=
 =?utf-8?B?UEY2bzIxMmczNUgxREhpS3VESVEvRm1GS01wTFJpWStNZ0Y0ZjhhekNqWWV3?=
 =?utf-8?B?SEdWS0R2R2N5Qkx0OTZyV3QzR3VNSzR6azJvSEFjd2NOYnJmcmlXZkdFdHRS?=
 =?utf-8?B?Y3oxWVEzRmxDeTRxUmMzZ2l4ekx0MWliUnpGWEdkL0VNakJGZXBlc2I1RmFB?=
 =?utf-8?B?c21XUGp5aEFjK0MzR0hQZE51aGJyZnp3RGtNT3RwaEFFdkZPYlpLVS9XWFdX?=
 =?utf-8?B?UXQ5dllWUVJKek1VUWs2MFBkanVGY05aNzRxRVVKVktEMDJ3Qmk5NUVKb1o1?=
 =?utf-8?B?RFp3cVU0UCtvYS9NV2hoL3lueS9JTHJUS0YxMDF4d3pDNlhyMTZ4dlo3OTZ3?=
 =?utf-8?B?Tm5wZUZvOWN3QUcyU0dYdmtVVjhUc21jYndIc2FZb3FRQ1E0MS96cnBvVXVI?=
 =?utf-8?B?U0Eza2VUZHIxYllNT1pZVFUrdm9VaUxHOWxYdk5iODR0ZUREUW0yRG5KWkdH?=
 =?utf-8?B?MHVmU1BIaW1nNFhCZ1o0aUx4Kzk1b2NSSzRmdFVhaU1JTUFhQnRlRXJrZ2hG?=
 =?utf-8?B?SXR2cTAyNzkyVG5SNWVQQ1BwbGlzR3AxM1JzK29EVTF3T2Z1Qm9lOTdJQWJj?=
 =?utf-8?B?cXZKMEg1bFljWWJ2eTRzVWYvRGhLYThhdjhKRVdzM1JQd2tGS0pOby9WZVVE?=
 =?utf-8?B?ZXVCVE9HT2x0Y2xnci9YRU56N2dUbFJqdnl4R1NqZWQrZU9QOFRFM0JlK3Jo?=
 =?utf-8?B?TVlOMVNNUTNRNVd3ZlY4U2g5V1BpdEdod2xiT0RVZUFCaHVlTi9rdi9MWUF2?=
 =?utf-8?B?V2FpdmNxWnlpQ013c04vRU9YUmJROU1rcjArSExqRk1xU09UNXJyQTJlTDB5?=
 =?utf-8?B?aVVHQUFycjRuVUZ1c2t4TE1RSzVKcUlWWUhPYWZ2Q2pENUJodlhsUEV1Zndw?=
 =?utf-8?B?NlQxNkorak82dzRTNXpERFEzRmtuNnFVc0d4SVJNZUkwbytFM1MzQ01Cd0FY?=
 =?utf-8?B?aVFPQ1E3NjJkVzQrUEFHYkV1NHdHWE9ac1ZpcGF3RGtHa0ZZa0FuemlEWDgv?=
 =?utf-8?B?Y3pzNXUzTWlpSGxKS1RBZ0ZZVXF1SkwwRXJmZS9hdllKckNlNERZSThMVWpp?=
 =?utf-8?B?Wm1xNS84TkptMk8rUDUyQ3NrNmNQNnNiTnJ1UStkZzMwbEo5Z1lGMkp2c1A2?=
 =?utf-8?B?d0p6OFBzTm1RTVJzcko2YWp5MnpBTDdncFl0MThSM1VzMnd2NHpzRzdtNXJq?=
 =?utf-8?B?WE54bS9weGlLS2RQYUVSS1o4K0RKMDJqRlpiYnFwRzYzRGR0NjRoVFFQaGts?=
 =?utf-8?B?TzRLZHpzWGpXK3A3bTZFbmpiK1B0bmx5Zjl6ZDVqNGtJcGpiZEl2RE16VDNJ?=
 =?utf-8?B?NnJsZG1JT2tTRW9tK2dWVmJBdEt5WEkzV0F5anoxOUJkNXVHSlR2MDRUWUxX?=
 =?utf-8?B?Y0dmcTE2ZGJXQzVWVmV3ckszU3JJamZsTG11U3Bzbm1HQjZ2M3NDTFBQbU5W?=
 =?utf-8?B?UXNLY3p6WnMyM1pQUmlSbndNVHoyN2phSGluak5Xa2E1OUFleTdOeGx1T1FB?=
 =?utf-8?B?bnZqUmRwbTRuSkJ5U09FSDFzVDA4UHFPRlEyVUMwa0ZML3hnZ3dQd1prM2p3?=
 =?utf-8?B?QUZtY0ZTRHhhZkNrM0N0VktJbExITmI4Mk1lMmlYVUJMVk15UmNlWXl5U3lt?=
 =?utf-8?B?RGNRN2ZRRlBNQVhOWElPeEtpZ1ZrSzFKTXZHQkhTdjAvSnJEa3JSTDhNd3Z3?=
 =?utf-8?B?UkY0WHBnUDFXR0lPbXZGbkFQa0Y4L0ZoVEo1RzhsN2RsYXFDUmhTMENBMS83?=
 =?utf-8?B?WVZjMEgyTnN0Y2NrVEhGT3Q3TFN0MGc2Z2Myc0F6NUw5UUJkYVVUR3lsTHVV?=
 =?utf-8?B?YW1nSEFFOEVhU2tzS3AzdkhqNXBVR3p6aHo4UlNOdkFUcnVYZjdDd0hiaFJ0?=
 =?utf-8?B?alBtU3BYd0hQR3A0eUgzcGk3M0U3blBVaVpQNW5PVGg1dkYvdEZBZHFOQVJ0?=
 =?utf-8?B?Wk4yUHdja1VoaFR5YXo2dmRvOTlsODI1Q0RSK3paM1VkWHo1WDQrWHZSL20v?=
 =?utf-8?B?ZUIwNVB4WGFsK1dJNWFnRjhibHhQeGNSMHpob3hlbUQ0V2JaVURnS3VTVXJO?=
 =?utf-8?B?ejAwQ0JmUndhVW9iVXhjOUNwSGRSVzVMRFN1WXgyS080Qm9XaERqL2VnZG1I?=
 =?utf-8?B?VlhhV3ZwVnlpd2hjQlo2ZmZsbDJuU2Y3S001cXhySDIrT3hudTRyT1o4MUp2?=
 =?utf-8?B?Y3IzWFQ0UkpVSUU1M1FDaVFIS0lXS0tFamE5UjlJUUpGcHJnV1FHUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f55d21b4-58b2-4037-9ae4-08de5d8894a5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 09:43:52.7771 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yjx4dWv2qF+KnWy5sH5ueE2AZ4lbmUOWq62QEHkt60sT0ROhKF6lmnYcKj09tTencWHGIRAC1G4VbD99nqnlyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5785
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,linux.intel.com,intel.com,ffwll.ch,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:email,intel.com:dkim,intel.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[riana.tauro@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 8196591EC4
X-Rspamd-Action: no action



On 1/23/2026 4:03 PM, Raag Jadav wrote:
> On Mon, Jan 19, 2026 at 09:30:26AM +0530, Riana Tauro wrote:
>> Report the SOC nonfatal/fatal hardware error and update the counters.
>>
>> Co-developed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>> v2: Add ID's and names as uAPI (Rodrigo)
>>
>> v3: reorder and align arrays
>>      remove redundant string err
>>      use REG_BIT
>>      fix aesthic review comments (Raag)
>>      use only correctable/uncorrectable error severity (Aravind)
>> ---
>>   drivers/gpu/drm/xe/regs/xe_hw_error_regs.h |  24 +++
>>   drivers/gpu/drm/xe/xe_hw_error.c           | 200 ++++++++++++++++++++-
>>   2 files changed, 223 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h b/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
>> index 5eeb0be27300..b9e072f9e56c 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
>> @@ -41,6 +41,7 @@
>>   								  DEV_ERR_STAT_NONFATAL))
>>   
>>   #define   XE_CSC_ERROR				17
>> +#define   XE_SOC_ERROR				16
>>   #define   XE_GT_ERROR				0
>>   
>>   #define ERR_STAT_GT_FATAL_VECTOR_0		0x100260
>> @@ -62,4 +63,27 @@
>>   						ERR_STAT_GT_COR_VECTOR_REG(x) : \
>>   						ERR_STAT_GT_FATAL_VECTOR_REG(x))
>>   
>> +#define SOC_PVC_MASTER_BASE			0x282000
>> +#define SOC_PVC_SLAVE_BASE			0x283000
>> +
>> +#define SOC_GCOERRSTS				0x200
>> +#define SOC_GNFERRSTS				0x210
>> +#define SOC_GLOBAL_ERR_STAT_REG(base, x)	XE_REG(_PICK_EVEN((x), \
>> +								  (base) + SOC_GCOERRSTS, \
>> +								  (base) + SOC_GNFERRSTS))
>> +#define   SOC_SLAVE_IEH				REG_BIT(1)
>> +#define   SOC_IEH0_LOCAL_ERR_STATUS		REG_BIT(0)
>> +#define   SOC_IEH1_LOCAL_ERR_STATUS		REG_BIT(0)
>> +
>> +#define SOC_GSYSEVTCTL				0x264
>> +#define SOC_GSYSEVTCTL_REG(base, slave_base, x)	XE_REG(_PICK_EVEN((x), \
> 
> Can we add 'master' for consistency? This gets me confused with
> other macros where 'base' can mean either one.

sure..

> 
>> +								  (base) + SOC_GSYSEVTCTL, \
>> +								  (slave_base) + SOC_GSYSEVTCTL))
>> +
>> +#define SOC_LERRUNCSTS				0x280
>> +#define SOC_LERRCORSTS				0x294
>> +#define SOC_LOCAL_ERR_STAT_REG(base, hw_err)	XE_REG(hw_err == HARDWARE_ERROR_CORRECTABLE ? \
>> +						      (base) + SOC_LERRCORSTS : \
>> +						      (base) + SOC_LERRUNCSTS)
> 
> Nit: Perhaps an additional whitespace is needed? ;)

Ahh.. yeah it looks combined. if i do that it'll mess the indentation.

I will add an extra tab for the entire file

> 
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
>> index bd0cf61741ca..d1c30bb199d3 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_error.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
>> @@ -19,6 +19,7 @@
>>   #define  GT_HW_ERROR_MAX_ERR_BITS	16
>>   #define  HEC_UNCORR_FW_ERR_BITS 	4
>>   #define  XE_RAS_REG_SIZE		32
>> +#define  XE_SOC_NUM_IEH 		2
>>   
>>   extern struct fault_attr inject_csc_hw_error;
>>   static const char * const error_severity[] = DRM_XE_RAS_ERROR_SEVERITY_NAMES;
>> @@ -31,7 +32,8 @@ static const char * const hec_uncorrected_fw_errors[] = {
>>   };
>>   
>>   static const unsigned long xe_hw_error_map[] = {
>> -	[XE_GT_ERROR] = DRM_XE_RAS_ERROR_CLASS_GT,
>> +	[XE_GT_ERROR]	= DRM_XE_RAS_ERROR_CLASS_GT,
>> +	[XE_SOC_ERROR]	= DRM_XE_RAS_ERROR_CLASS_SOC,
>>   };
>>   
>>   enum gt_vector_regs {
>> @@ -54,6 +56,92 @@ static enum drm_xe_ras_error_severity hw_err_to_severity(enum hardware_error hw_
>>   	return DRM_XE_RAS_ERROR_SEVERITY_UNCORRECTABLE;
>>   }
>>   
>> +static const char * const pvc_master_global_err_reg[] = {
>> +	[0 ... 1]	= "Undefined",
>> +	[2]		= "HBM SS0: Channel0",
>> +	[3]		= "HBM SS0: Channel1",
>> +	[4]		= "HBM SS0: Channel2",
>> +	[5]		= "HBM SS0: Channel3",
>> +	[6]		= "HBM SS0: Channel4",
>> +	[7]		= "HBM SS0: Channel5",
>> +	[8]		= "HBM SS0: Channel6",
>> +	[9]		= "HBM SS0: Channel7",
>> +	[10]		= "HBM SS1: Channel0",
>> +	[11]		= "HBM SS1: Channel1",
>> +	[12]		= "HBM SS1: Channel2",
>> +	[13]		= "HBM SS1: Channel3",
>> +	[14]		= "HBM SS1: Channel4",
>> +	[15]		= "HBM SS1: Channel5",
>> +	[16]		= "HBM SS1: Channel6",
>> +	[17]		= "HBM SS1: Channel7",
>> +	[18 ... 31]	= "Undefined",
>> +};
> 
> I'd add static_assert() against register size here.

These are anyway register values. so i think it won't get modified above 
32 bits. Yeah sure i can add a static_assert


> 
>> +static const char * const pvc_slave_global_err_reg[] = {
>> +	[0]		= "Undefined",
>> +	[1]		= "HBM SS2: Channel0",
>> +	[2]		= "HBM SS2: Channel1",
>> +	[3]		= "HBM SS2: Channel2",
>> +	[4]		= "HBM SS2: Channel3",
>> +	[5]		= "HBM SS2: Channel4",
>> +	[6]		= "HBM SS2: Channel5",
>> +	[7]		= "HBM SS2: Channel6",
>> +	[8]		= "HBM SS2: Channel7",
>> +	[9]		= "HBM SS3: Channel0",
>> +	[10]		= "HBM SS3: Channel1",
>> +	[11]		= "HBM SS3: Channel2",
>> +	[12]		= "HBM SS3: Channel3",
>> +	[13]		= "HBM SS3: Channel4",
>> +	[14]		= "HBM SS3: Channel5",
>> +	[15]		= "HBM SS3: Channel6",
>> +	[16]		= "HBM SS3: Channel7",
>> +	[17]		= "Undefined",
>> +	[18]		= "ANR MDFI",
>> +	[19 ... 31]	= "Undefined",
>> +};
> 
> Ditto.
> 
>> +static const char * const pvc_slave_local_fatal_err_reg[] = {
>> +	[0]		= "Local IEH: Malformed PCIe AER",
>> +	[1]		= "Local IEH: Malformed PCIe ERR",
>> +	[2]		= "Local IEH: UR conditions in IEH",
>> +	[3]		= "Local IEH: From SERR Sources",
>> +	[4 ... 19]	= "Undefined",
>> +	[20]		= "Malformed MCA error packet (HBM/Punit)",
>> +	[21 ... 31]	= "Undefined",
>> +};
> 
> Ditto.
> 
>> +static const char * const pvc_master_local_fatal_err_reg[] = {
>> +	[0]		= "Local IEH: Malformed IOSF PCIe AER",
>> +	[1]		= "Local IEH: Malformed IOSF PCIe ERR",
>> +	[2]		= "Local IEH: UR RESPONSE",
>> +	[3]		= "Local IEH: From SERR SPI controller",
>> +	[4]		= "Base Die MDFI T2T",
>> +	[5]		= "Undefined",
>> +	[6]		= "Base Die MDFI T2C",
>> +	[7]		= "Undefined",
>> +	[8]		= "Invalid CSC PSF Command Parity",
>> +	[9]		= "Invalid CSC PSF Unexpected Completion",
>> +	[10]		= "Invalid CSC PSF Unsupported Request",
>> +	[11]		= "Invalid PCIe PSF Command Parity",
>> +	[12]		= "PCIe PSF Unexpected Completion",
>> +	[13]		= "PCIe PSF Unsupported Request",
>> +	[14 ... 19]	= "Undefined",
>> +	[20]		= "Malformed MCA error packet (HBM/Punit)",
>> +	[21 ... 31]	= "Undefined",
>> +};
> 
> Ditto.
> 
>> +static const char * const pvc_master_local_nonfatal_err_reg[] = {
>> +	[0 ... 3]	= "Undefined",
>> +	[4]		= "Base Die MDFI T2T",
>> +	[5]		= "Undefined",
>> +	[6]		= "Base Die MDFI T2C",
>> +	[7]		= "Undefined",
>> +	[8]		= "Invalid CSC PSF Command Parity",
>> +	[9]		= "Invalid CSC PSF Unexpected Completion",
>> +	[10]		= "Invalid PCIe PSF Command Parity",
>> +	[11 ... 31]	= "Undefined",
>> +};
> 
> Ditto.
> 
>>   static bool fault_inject_csc_hw_error(void)
>>   {
>>   	return IS_ENABLED(CONFIG_DEBUG_FS) && should_fail(&inject_csc_hw_error, 1);
>> @@ -132,6 +220,26 @@ static void log_gt_err(struct xe_tile *tile, const char *name, int i, u32 err,
>>   			 name, severity_str, i, err);
>>   }
>>   
>> +static void log_soc_error(struct xe_tile *tile, const char * const *reg_info,
>> +			  const enum drm_xe_ras_error_severity severity, u32 err_bit, u32 index)
>> +{
>> +	const char *severity_str = error_severity[severity];
>> +	struct xe_device *xe = tile_to_xe(tile);
>> +	struct xe_drm_ras *ras = &xe->ras;
>> +	struct xe_drm_ras_counter *info = ras->info[severity];
>> +	const char *name;
>> +
>> +	name = reg_info[err_bit];
>> +
>> +	if (strcmp(name, "Undefined")) {
>> +		if (severity == DRM_XE_RAS_ERROR_SEVERITY_UNCORRECTABLE)
> 
> Same comment as last patch.

Will reverse

> 
>> +			drm_err_ratelimited(&xe->drm, "%s SOC %s detected", name, severity_str);
>> +		else
>> +			drm_warn(&xe->drm, "%s SOC %s detected", name, severity_str);
>> +		atomic64_inc(&info[index].counter);
>> +	}
>> +}
>> +
>>   static void gt_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err,
>>   				u32 error_id)
>>   {
>> @@ -210,6 +318,93 @@ static void gt_hw_error_handler(struct xe_tile *tile, const enum hardware_error
>>   	}
>>   }
>>   
>> +static void soc_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err,
>> +				 u32 error_id)
>> +{
>> +	const enum drm_xe_ras_error_severity severity = hw_err_to_severity(hw_err);
>> +	struct xe_device *xe = tile_to_xe(tile);
>> +	struct xe_mmio *mmio = &tile->mmio;
>> +	unsigned long master_global_errstat, slave_global_errstat;
>> +	unsigned long master_local_errstat, slave_local_errstat;
>> +	u32 base, slave_base, regbit;
>> +	int i;
>> +
>> +	if (xe->info.platform != XE_PVC)
>> +		return;
>> +
>> +	base = SOC_PVC_MASTER_BASE;
> 
> 'master'?

sure.

> 
>> +	slave_base = SOC_PVC_SLAVE_BASE;
>> +
>> +	/* Mask error type in GSYSEVTCTL so that no new errors of the type will be reported */
>> +	for (i = 0; i < XE_SOC_NUM_IEH; i++)
>> +		xe_mmio_write32(mmio, SOC_GSYSEVTCTL_REG(base, slave_base, i), ~REG_BIT(hw_err));
>> +
>> +	if (hw_err == HARDWARE_ERROR_CORRECTABLE) {
>> +		xe_mmio_write32(mmio, SOC_GLOBAL_ERR_STAT_REG(base, hw_err), REG_GENMASK(31, 0));
>> +		xe_mmio_write32(mmio, SOC_LOCAL_ERR_STAT_REG(base, hw_err), REG_GENMASK(31, 0));
>> +		xe_mmio_write32(mmio, SOC_GLOBAL_ERR_STAT_REG(slave_base, hw_err),
>> +				REG_GENMASK(31, 0));
>> +		xe_mmio_write32(mmio, SOC_LOCAL_ERR_STAT_REG(slave_base, hw_err),
>> +				REG_GENMASK(31, 0));
>> +		goto unmask_gsysevtctl;
>> +	}
>> +
>> +	/*
>> +	 * Read the master global IEH error register if BIT 1 is set then process
> 
> BIT(1)
> 
>> +	 * the slave IEH first. If BIT 0 in global error register is set then process
> 
> BIT(0)
> 
>> +	 * the corresponding local error registers
> 
> Punctuations please!
> 
>> +	 */
>> +	master_global_errstat = xe_mmio_read32(mmio, SOC_GLOBAL_ERR_STAT_REG(base, hw_err));
>> +	if (master_global_errstat & SOC_SLAVE_IEH) {
>> +		slave_global_errstat = xe_mmio_read32(mmio,
>> +						      SOC_GLOBAL_ERR_STAT_REG(slave_base, hw_err));
>> +		if (slave_global_errstat & SOC_IEH1_LOCAL_ERR_STATUS) {
>> +			slave_local_errstat = xe_mmio_read32(mmio,
>> +							     SOC_LOCAL_ERR_STAT_REG(slave_base,
>> +										    hw_err));
> 
> With long names usually comes the ugly wrapping :(
> So let's either try to shorten some of them here or split the condition
> into another function for readability.
> 
>> +			if (hw_err == HARDWARE_ERROR_FATAL) {
> 
> So we don't log for other severities?

Requirement is only fatal. There are no errors defined for non-fatal

> 
>> +				for_each_set_bit(regbit, &slave_local_errstat, XE_RAS_REG_SIZE)
>> +					log_soc_error(tile, pvc_slave_local_fatal_err_reg,
>> +						      severity, regbit, error_id);
>> +			}
>> +
>> +			xe_mmio_write32(mmio, SOC_LOCAL_ERR_STAT_REG(slave_base, hw_err),
>> +					slave_local_errstat);
>> +		}
>> +
>> +		for_each_set_bit(regbit, &slave_global_errstat, XE_RAS_REG_SIZE)
>> +			log_soc_error(tile, pvc_slave_global_err_reg, severity, regbit, error_id);
>> +
>> +		xe_mmio_write32(mmio, SOC_GLOBAL_ERR_STAT_REG(slave_base, hw_err),
>> +				slave_global_errstat);
>> +	}
>> +
>> +	if (master_global_errstat & SOC_IEH0_LOCAL_ERR_STATUS) {
> 
> Ditto for split.

This should be fine. i will split the slave into a function and retain 
master in this.

Riana

> 
> Raag
> 
>> +		master_local_errstat = xe_mmio_read32(mmio, SOC_LOCAL_ERR_STAT_REG(base, hw_err));
>> +
>> +		for_each_set_bit(regbit, &master_local_errstat, XE_RAS_REG_SIZE) {
>> +			const char * const *reg_info = (hw_err == HARDWARE_ERROR_FATAL) ?
>> +						       pvc_master_local_fatal_err_reg :
>> +						       pvc_master_local_nonfatal_err_reg;
>> +
>> +			log_soc_error(tile, reg_info, severity, regbit, error_id);
>> +		}
>> +
>> +		xe_mmio_write32(mmio, SOC_LOCAL_ERR_STAT_REG(base, hw_err), master_local_errstat);
>> +	}
>> +
>> +	for_each_set_bit(regbit, &master_global_errstat, XE_RAS_REG_SIZE)
>> +		log_soc_error(tile, pvc_master_global_err_reg, severity, regbit, error_id);
>> +
>> +	xe_mmio_write32(mmio, SOC_GLOBAL_ERR_STAT_REG(base, hw_err), master_global_errstat);
>> +
>> +unmask_gsysevtctl:
>> +	for (i = 0; i < XE_SOC_NUM_IEH; i++)
>> +		xe_mmio_write32(mmio, SOC_GSYSEVTCTL_REG(base, slave_base, i),
>> +				(DRM_XE_RAS_ERROR_SEVERITY_MAX << 1) + 1);
>> +}
>> +
>>   static void hw_error_source_handler(struct xe_tile *tile, const enum hardware_error hw_err)
>>   {
>>   	const enum drm_xe_ras_error_severity severity = hw_err_to_severity(hw_err);
>> @@ -263,8 +458,11 @@ static void hw_error_source_handler(struct xe_tile *tile, const enum hardware_er
>>   				 "TILE%d reported %s %s, bit[%d] is set\n",
>>   				 tile->id, name, severity_str, err_bit);
>>   		}
>> +
>>   		if (err_bit == XE_GT_ERROR)
>>   			gt_hw_error_handler(tile, hw_err, error_id);
>> +		if (err_bit == XE_SOC_ERROR)
>> +			soc_hw_error_handler(tile, hw_err, error_id);
>>   	}
>>   
>>   clear_reg:
>> -- 
>> 2.47.1
>>


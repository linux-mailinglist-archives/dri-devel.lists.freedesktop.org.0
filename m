Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKNOOT9IjWlj0gAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 04:25:51 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4616C12A2A9
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 04:25:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D00CF10E6CE;
	Thu, 12 Feb 2026 03:25:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mpm1h/ks";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC04510E1FD;
 Thu, 12 Feb 2026 03:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770866746; x=1802402746;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZwGf860yFeQcWY/2r8GPx1r1iV3T+9VbWtWoiZYAEKo=;
 b=mpm1h/ksYKJzX+Rmu4/JHERi5H4IH9LYFoTVQkSPHpbVwnIRFowCzgXz
 ptCN2Hd2QOQvQwB3Me2iDBKTbkoY4gtut1g++3q5hYMGA8NhhkI7nZzAK
 H9z8QSy/8/ThE+ajE978nsG7atGKzz9mSyqqdmltgDyVmPdFNrDnO4R1T
 WNqlU5hhmKGp+PmiIOY9tYcyMTIRTfeTh0sBiewkm3QgyXU2dtXhdVii9
 V4CvStSG+PBQf90TEb2fpAwtATdgZbX84qQNoP5y5OkEgTkKdOUF4QUqA
 M0pCAufhVcHuA7IQ/rHMod+mpPMimI3N8UVZCNCOq3sQ36GB7fmOXRGjs w==;
X-CSE-ConnectionGUID: osdAXAKIRl2+X2RwvqdvwQ==
X-CSE-MsgGUID: Qmn1fhoKQku06J7OCaUvLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="89618406"
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="89618406"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 19:25:46 -0800
X-CSE-ConnectionGUID: Ymr2/wVIRiyPqf0ypKrI/w==
X-CSE-MsgGUID: TmwkiunPQIa6DAUnnVNRHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="216938112"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 19:25:46 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 11 Feb 2026 19:25:45 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 11 Feb 2026 19:25:45 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.54)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 11 Feb 2026 19:25:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RbmV546zt/FpiRP4qbZwC1DNQ/B/JyjgUQkhAyQ/JIHWkz56ZNrQ95DB72mi654MqPawngwBKtGlM6hO0KuDlxZsnaJ3NwAmin9e1+r2wGAXyFHbuqoNjMBcGJPSUgKwVVNfLbclwf2t0jJRdp8+MSR5K9yNxovjNJA3UKrLmlGSACJapFKkQVXYf2zjviS/0eYbGfFwFAGaa/PWfVtZJKxZb2kFU3HTYB4g6rbPxnzUiy6qzMrPqaS4ceN/KM1FHFKCNNe5e9FkVzWF/hRBnfCoY5LMxeNYkdgHXYPfP23JHGNLBLrO5P0ouxJEIsONCPRP7wT9u6oysAvbDsNRaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h1Z7CCiiBnTHVmTW6b3HxERZzX8T64c4UTNz86duUz8=;
 b=f7vGHZW3PGlXU9BYv7E6ThwqEVahLKW9iKkyTkcPqgr4SLXl1C1uoTCZKedTcRUoX2nATP70m+RFSp2CqAMZ3Qa7fFlkDamZIF1tMKl2LabBPAnAXTkcTH4ZOMYLKKL9JCZMGQdld0xCTHdNHR5dDIi/kj5DdoHb2EyN2mTd7mOe3xOmMWHz4ic81K7/6bBYj1xFyfNjUgX62v0VZyD+AexZr7YwLp0M3woTfZL58os0OY9whLwU6l4lZYz3nE21ktoXyqUMDP/Cu9KFP8cq5O0meurT4pfwSnZqJY82fEwZu+7scCn/SlJJ6MIFG80wqtK1FZCeDNdCgVU/p/qyxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 MW3PR11MB4746.namprd11.prod.outlook.com (2603:10b6:303:5f::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.10; Thu, 12 Feb 2026 03:25:41 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 03:25:41 +0000
Message-ID: <ae9a0aee-d81b-4532-ab36-8025c50ae69a@intel.com>
Date: Thu, 12 Feb 2026 08:55:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] drm/xe/xe_hw_error: Add support for Core-Compute
 errors
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <aravind.iddamsetty@linux.intel.com>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <joonas.lahtinen@linux.intel.com>,
 <simona.vetter@ffwll.ch>, <airlied@gmail.com>, <pratik.bari@intel.com>,
 <joshua.santosh.ranjan@intel.com>, <ashwin.kumar.kulkarni@intel.com>,
 <shubham.kumar@intel.com>, <ravi.kishore.koppuravuri@intel.com>, "Himal
 Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
References: <20260202064356.286243-7-riana.tauro@intel.com>
 <20260202064356.286243-11-riana.tauro@intel.com>
 <aYS3sm6QO0d947hM@black.igk.intel.com>
 <90eaf920-2bc3-4d33-9a64-f6373d704dc0@intel.com>
 <aYsaWAUauWg0XIJl@black.igk.intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <aYsaWAUauWg0XIJl@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0062.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::20) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|MW3PR11MB4746:EE_
X-MS-Office365-Filtering-Correlation-Id: 46caf8b6-4a79-42e0-26af-08de69e665e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TTl2YUU5aGRURGM3WDU4K2lQZXptVlo0Rlcvd3BMNlc0aFJKN2VYOG40N1Fa?=
 =?utf-8?B?aVF1c0VDT2IzR3dDVlJqc0ZoSFVya3M5OFl6RlNPM0V5d0Ivc1ZNSlJkeFJS?=
 =?utf-8?B?OU1UV2taRlNmMk8yWE5ITHI2TDZpb3VDYXpwN2pWd0Y4SXFxYTFIUnVldTNV?=
 =?utf-8?B?UGJlS1BpZmo2TWR0OWkrR3JNTGVjUTdFVXlPSHZjZmpkTW4vWmxBR1pNYUZq?=
 =?utf-8?B?V2dMRGQ5eHpvbTJNdHVTZkdqSk5uTG5yakpHb3hZWlhYME90ZGlqQW5Ma2ti?=
 =?utf-8?B?UUpRTkpRV2Uzd0lYN3JYRzRZZi8wYTViZ01VZi9Na2dubVFVd2MzTG03ZjRR?=
 =?utf-8?B?UE5xT2N4SHhRcTBIV3hWRFRQdVV6dmRCT3Awc2VOOEUrZXQzSFljMHZwa0Vv?=
 =?utf-8?B?RXd0eUIzdGduTEZ0Vko1RXBZbkhncmJWaHlvNTkwM2RMZTcveGVya0R4Ni93?=
 =?utf-8?B?YWJBWG1QeXNGYUpRTFVscGlndEQvMHNaS3JnUUozRFppVlVyNlRDdldweXhy?=
 =?utf-8?B?RUNkTVdsL2d3NEZ5NzZvcW9aTGoxUExTbnRVM2JFMWFGRDduNjRxVGNrd3Z4?=
 =?utf-8?B?cjJjVnZ3WWRGTlRiYk90RjBQR1plb0VBTFg4L2V6YTViR0xKNEhyN2VURVk2?=
 =?utf-8?B?K0xDTjdTSk5QUHE3NmNWZHJMZVplZHdtSVgvZFB5d2RtR2hHci9lUFBndjZx?=
 =?utf-8?B?OXJ6YzlxRkJRZFcxQm9aV1hGY1UrdnEwS2o0Ri9EU3kwZUVjMERmK0x1cXNX?=
 =?utf-8?B?TTlIQnR4UFdpR2w5WUpvMXhEV216cUV4M0lvWmxSRkRlczNYalhVcjdIYWdv?=
 =?utf-8?B?U2VlMGpERUlORnF2QjBPUTV6dm9RYUJvbXgwQU9NejRRS1RYT0dyT0NxdHM0?=
 =?utf-8?B?UHVaeVJxVWN1bWg2WkxVaHdBUnBubzd3ek9SK1BWM20rNUI1Z0wrT1ZGcFNo?=
 =?utf-8?B?enRVL1VDYlFzYlRSRFZKNlJ1a0FoMWJSUUc2V3BiR0x2NGVXN2g1WUMreHhW?=
 =?utf-8?B?VUNuY2NJR0NabndEY3pyVkx4NUlDM3NsVFQreGZMRzNpNUtCakU3MW5HcnJZ?=
 =?utf-8?B?bjNXajlVaXpJL3BkZ1lIaHgxZENUZi9rd3BVai9NL2F0ektxWjFZRFBRdkox?=
 =?utf-8?B?ZjdEWnB3UVFhMU1aYVhBdDlQZDBnUldPVlVNcDlMRkp6K0dUSE9nbDAwcitZ?=
 =?utf-8?B?V2NsWStuWk5lbXhvbTU1Z2VLMUtKeVNJYlpGY2I3cGwvWkF1REI5YkpWTmFz?=
 =?utf-8?B?YWZHRkpzUUUvdUJuMXZaL25NS1FRY0FSWmdLbzU3YzlIdTEwMUc4aE5memlH?=
 =?utf-8?B?U1k2cjNaMytaSUlxN2RmNWNPUllDWGU1YmhveEVUaFpVMTMzRUp0eFdmckFP?=
 =?utf-8?B?QkN1SXFCTCtudlJoNXE3QVFMQVNpYmhiczNtVzdDdTJWSWQ5RzZHdDRJbE5w?=
 =?utf-8?B?MlNQMytGSFJqVEZSclpFa0FOQnpjZEpWeU5qMzhwS1RoTkl2cXpDMm1aem51?=
 =?utf-8?B?TkJTTjdEWWpyVnJRdy9RaCtmYkV4OE1SZEpNdTBIcnlPTWFXMWtYUmtlNmgy?=
 =?utf-8?B?Q09FVjR5WjNjUzBUSmxUamgreXZlTkpTbTAyR3VOemhvbEpEL1A0WmFocXlF?=
 =?utf-8?B?UEl4YThoazA0azFtem9DZ3hONWhKQlg0T3Z2ZFEwc3ZkNnViZFdmQSsyTGZt?=
 =?utf-8?B?U1ZpcGdVcTUxNFJLRnk4bi9SWTVSNVhMaHF0NXlOTEhnNEU0ak1ldncvQzVJ?=
 =?utf-8?B?M25CaWd0TTRBUHBodk5kWWhpNlZ4a1QvZFZmQnFZc3drQ0RZbktyZ2VCdzMw?=
 =?utf-8?B?YmMzRGxtbzBmSjJBZnlmbEdSSS93M1VGZkVoZ0dybUVUQVowcis1cTFyYUsr?=
 =?utf-8?B?NXlaMEczbXBZelNYUmNnMWIwVnJ2cjZMTUc0QkFkMWh6M1RRT1JITGN0dTA4?=
 =?utf-8?B?TmdQU3Bhc0QzQ2R3UHN3ZUhobkxZUDV3S1BUd0xJbjRzMitwMVF2KzJiSjlv?=
 =?utf-8?B?L05jelVLWEdoTGFKNkdjYUVqNWNnbVJHVEFCcHBEQUwvL0JiakF4QWthQW5I?=
 =?utf-8?B?eHlDRjhWdjFhN3R3bXkxUnNTMDhBMWJzVlZGOEN5US9yaTZ4MURET21yMWlF?=
 =?utf-8?Q?wtgc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aEhWYlRWU08zN21xN3lFRWl3OXhaZGVmTi9NcVdML2hKMzlTdXZ3OVlobXNw?=
 =?utf-8?B?RTJUdEI4OEl3ZTFEOGE1VnE5OUUycE9oZ2VRNVQ3cWRIdUVnUjN4VjQwa2ZO?=
 =?utf-8?B?NXlWTTRuY1ZQaTBOV2grN3VvRkl6b3dCSzB0aEM3K1Z4UU5XemxTbzhyd1Ev?=
 =?utf-8?B?aU1hSVFielJXTXVmWEV4cWxuMmZZYzZhaGk4dURXYWJ6aHdlYkRtWDJmOHM4?=
 =?utf-8?B?dnY3cGhqa2JjN3F2RlVGRnB1bkVUK1BxVVRycDFGRlMxTERpL042MEdtODdq?=
 =?utf-8?B?dHd6SE9ycE85dEVnVXlYMVZ6cmJDcmFFMHdabnJrZmVtcFkxbWJWeGU5Z2tq?=
 =?utf-8?B?TnlXZ1NmMXo5WExQejBucS9HUW9JaFRDdDRzd0RjS0ppMU1HNVNYQTN0aVd5?=
 =?utf-8?B?aCtkRUNIWGpDdWtRQnFJODdGNHdYVmt6TVlsdHJOWVdOTElaenNKcktZdzdx?=
 =?utf-8?B?SXBvNktsYVg4Y2lySG9NSW1heXVJTWltSlc0SURxeHJXeUNVQmdvUVBxMDky?=
 =?utf-8?B?TmdEOHhrYTkzL0lnSGdPS3Vzd3plVk9ZZFdqQitnblAvTHp1T3Q5RmdtOUoz?=
 =?utf-8?B?Zm50bFVhUzlIRklPUEJ0WFdLSlUyK212cEFEMWFENDlUWkZpY3RmaGtWWUNp?=
 =?utf-8?B?NzRvaytxTktQMjNGYTlNMVNhbXZxZ3l2NVk5ME5Pb0RFTnVFRDJqMnlMSG5W?=
 =?utf-8?B?dW1BSWowZzJoRy9CLzRQczAzY25YWG5ocjk1YXZoTUNZUFJnSnFucWpFVHlt?=
 =?utf-8?B?MEZDb0MycGtPdlAxanNZYjE5Qys2RHBqblhhUCtEbFRDU1h2cnQyUWhadUo5?=
 =?utf-8?B?dHIyTTNuZWtsaW1CVld5MjJ5K1FBNGszTExLUkdjc0pBd0NRZUtybm5mcVpL?=
 =?utf-8?B?ZlNrbXFYYjlCd3BXRTNHOEd4K2VGbW41d0NSb21aOFNrd05FRkxKNXliOFQ5?=
 =?utf-8?B?aEsvWExGTWJVR08yV3dNNzFHU3VPUnJWWWJNRSt5M2hKNnMvRHppQ2orMUhH?=
 =?utf-8?B?ZnRCbWdieVBJaEhxQjZHVGNWd1VleW5EMCt5L01qcXM0WXFDbnBiKzlnMzBp?=
 =?utf-8?B?R3Vhc0pEd0p3VjBZODROK0gxTjVnU1JMdVlSYjV3eXcrbTR1L3pONW9iUDJ0?=
 =?utf-8?B?VFBLRXh6MGZpZWFsaGs5SVJtVXRTMHFXZUVGM2hMa1F6Y0lxSXc3Slo2TFFS?=
 =?utf-8?B?TENXc25Pa1U1dlQ5VS9ybDBKbkJxSFZmVVBGUmExdzFVZ0tUaUFFcTRMbUdC?=
 =?utf-8?B?TW4zdzFIQ1JEWTRrTzlKL21DZ2UxUWNvRGQ4R2pnZFJJZGJrM3JaK3pYZnhw?=
 =?utf-8?B?UWF1ZjdJWEFlcEpzbWs4R2N4c29GelFINXMyKzVtVC9YOG9scS9XSlVlNjhx?=
 =?utf-8?B?VWZtY29EWC9CYTdNakZlK0pqUjA4MHZDaDhMWW5iZWkrTnk2Rk96RnJvZ2ps?=
 =?utf-8?B?Wk1sSnhYQVhQYXNCdjdqTnZmWHFsMXd1NGI1Q3dSVWgrakJZZldSQnpNSThk?=
 =?utf-8?B?SzBLb0hocFpJUHNkTUhmR2N0T1p5OVk4ZGRjbHduOVRCMzN1OVBiVmhXV0V3?=
 =?utf-8?B?ajYvRHJ6T3l4Z0VualgrU3U5VzEyb3JQTWFoWEVoc20zRSszNDkwaWhBdXVG?=
 =?utf-8?B?Yy94MENXaUV2ZUxlQm40ZFdlcmFKUnNSMGRBclJBVHl4R0xZbFRqUkZ5T21x?=
 =?utf-8?B?MjhMQXE3ZXFkdU4xQWV2QlpzUk43NUNGZFR1UFd5dW44K0EvOHpPMWxmSXFq?=
 =?utf-8?B?Z1Z1Z2FGTWc3WmE0TlJDMk5UK2dGVXJWNzhycGI5a2Z4aWEyQzUrQVE3Z0N1?=
 =?utf-8?B?OGhSemcyWVp6MTlMcW9EeE5qaFhtdTE1UUsyZm5DSDQwUkpWRWMyaGlnU3Bz?=
 =?utf-8?B?T21UYXBOSFdVVnJ4cUdWVXJDN0tQZ1YxeGppNHJ3dHZJenVWMC9qWVZQbVYy?=
 =?utf-8?B?d2c3THhwQ2RJR3dLYy83dUxnZU41RitVdUhjcjJ0ZGlIZkZzMWF5eTNiMkVY?=
 =?utf-8?B?LzhndVM1cFFwcXJhTEZiVFlWUEY2M2xxQklackI4S0tqaEpUYnZCR2ppOVJH?=
 =?utf-8?B?LzdpVVRzV0Q5aTRhelNtMEVtd2IyM1lOTVpYeFJucGVZclRISm9WRCtrbklo?=
 =?utf-8?B?MVRyYVB1amxUUDAxZkdjM1FMSW1UNHVEdGgyM0JzYTNMNFVsZElsTmhTN05O?=
 =?utf-8?B?SnlqaFVSWlFaNHRTUGpXNFk2MmlzU2RUVFJVZHU0NEFQQ2l0OTFCdDU1Z2FH?=
 =?utf-8?B?Mm41NS9BeVA2NVcwWUJJbTNkWWRYOTBtWk94U3E0blRBZG9BT1VnNGFBbEI3?=
 =?utf-8?B?WDVOYlhFU2x6WGprNG44YmZGaEF6TDhST25ROUN1QllwTnFEV0p3Zz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 46caf8b6-4a79-42e0-26af-08de69e665e5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 03:25:41.0100 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZtGGQM1g5luI5XqkmJHIMHtxqeoPIICYOjDF31ytz8X8+8aK5NcB2pKEjv0CsKGxt542ynlEYVHkSuWGIcim8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4746
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[9];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,intel.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	RCPT_COUNT_TWELVE(0.00)[15];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FROM_NEQ_ENVFROM(0.00)[riana.tauro@intel.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,linux.intel.com,intel.com,ffwll.ch,gmail.com];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: 4616C12A2A9
X-Rspamd-Action: no action



On 2/10/2026 5:15 PM, Raag Jadav wrote:
> On Tue, Feb 10, 2026 at 11:28:39AM +0530, Riana Tauro wrote:
>> On 2/5/2026 9:00 PM, Raag Jadav wrote:
>>> On Mon, Feb 02, 2026 at 12:14:00PM +0530, Riana Tauro wrote:
>>>> PVC supports GT error reporting via vector registers along with
>>>> error status register. Add support to report these errors and
>>>> update respective counters. Incase of Subslice error reported
>>>> by vector register, process the error status register
>>>> for applicable bits.
>>>>
>>>> The counter is embedded in the xe drm ras structure and is
>>>> exposed to the userspace using the drm_ras generic netlink
>>>> interface.
>>>>
>>>> $ sudo ynl --family drm_ras --do query-error-counter  --json
>>>
>>> We usually add '\' at the end for wrapping commands so that they're easy
>>> to apply directly (and same for all other patches where applicable).
>>>
>>>>     '{"node-id":0, "error-id":1}'
>>>
>>> Ditto.
>>
>> Will fix this
> 
> Thank you.
> 
>>>> {'error-id': 1, 'error-name': 'core-compute', 'error-value': 0}
>>>>
>>>> Co-developed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>>> ---
>>>> v2: Add ID's and names as uAPI (Rodrigo)
>>>>       Add documentation
>>>>       Modify commit message
>>>>
>>>> v3: remove 'error' from counters
>>>>       use drmm_kcalloc
>>>>       add a for_each for severity
>>>>       differentitate error classes and severity in UAPI(Raag)
>>>>       Use correctable and uncorrectable in uapi (Pratik / Aravind)
>>>>
>>>> v4: modify enums in UAPI
>>>>       improve comments
>>>>       add bounds check in handler
>>>>       add error mask macro (Raag)
>>>>       use atomic_t
>>>>       add null pointer checks
>>>> ---
>>>>    drivers/gpu/drm/xe/regs/xe_hw_error_regs.h |  62 ++++++-
>>>>    drivers/gpu/drm/xe/xe_hw_error.c           | 199 +++++++++++++++++++--
>>>>    2 files changed, 241 insertions(+), 20 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h b/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
>>>> index c146b9ef44eb..17982a335941 100644
>>>> --- a/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
>>>> +++ b/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
>>>> @@ -6,15 +6,59 @@
>>>>    #ifndef _XE_HW_ERROR_REGS_H_
>>>>    #define _XE_HW_ERROR_REGS_H_
>>>> -#define HEC_UNCORR_ERR_STATUS(base)                    XE_REG((base) + 0x118)
>>>> -#define    UNCORR_FW_REPORTED_ERR                      BIT(6)
>>>> +#define HEC_UNCORR_ERR_STATUS(base)			XE_REG((base) + 0x118)
>>>> +#define   UNCORR_FW_REPORTED_ERR			REG_BIT(6)
>>>> -#define HEC_UNCORR_FW_ERR_DW0(base)                    XE_REG((base) + 0x124)
>>>> +#define HEC_UNCORR_FW_ERR_DW0(base)			XE_REG((base) + 0x124)
>>>> +
>>>> +#define ERR_STAT_GT_COR					0x100160
>>>> +#define   EU_GRF_COR_ERR				REG_BIT(15)
>>>> +#define   EU_IC_COR_ERR					REG_BIT(14)
>>>> +#define   SLM_COR_ERR					REG_BIT(13)
>>>> +#define   GUC_COR_ERR					REG_BIT(1)
>>>> +
>>>> +#define ERR_STAT_GT_NONFATAL				0x100164
>>>> +#define ERR_STAT_GT_FATAL				0x100168
>>>> +#define   EU_GRF_FAT_ERR				REG_BIT(15)
>>>> +#define   SLM_FAT_ERR					REG_BIT(13)
>>>> +#define   GUC_FAT_ERR					REG_BIT(6)
>>>> +#define   FPU_FAT_ERR					REG_BIT(3)
>>>> +
>>>> +#define ERR_STAT_GT_REG(x)				XE_REG(_PICK_EVEN((x), \
>>>> +									  ERR_STAT_GT_COR, \
>>>> +									  ERR_STAT_GT_NONFATAL))
>>>> +
>>>> +#define PVC_COR_ERR_MASK				(GUC_COR_ERR | SLM_COR_ERR | \
>>>> +							 EU_IC_COR_ERR | EU_GRF_COR_ERR)
>>>> +
>>>> +#define PVC_FAT_ERR_MASK				(FPU_FAT_ERR | GUC_FAT_ERR | \
>>>> +							EU_GRF_FAT_ERR | SLM_FAT_ERR)
>>>
>>> Nit: Whitespace please!
>>
>> alignment?
> 
> Yes please!
> 
>>>> +#define DEV_ERR_STAT_NONFATAL				0x100178
>>>> +#define DEV_ERR_STAT_CORRECTABLE			0x10017c
>>>> +#define DEV_ERR_STAT_REG(x)				XE_REG(_PICK_EVEN((x), \
>>>> +									  DEV_ERR_STAT_CORRECTABLE, \
>>>> +									  DEV_ERR_STAT_NONFATAL))
>>>
>>> I know it was already like this but how does this evaluate for FATAL?
>>
>> #define _PICK_EVEN(__index, __a, __b) ((__a) + (__index) * ((__b) - (__a)))
>> (index, 0x10017c, 0x100178)  = (0x10017c + index * (0x100178 - 0x10017c));
>> 0 =  0x10017c
>> 1 =  0x100178
>> 2 =  0x100174
> 
> The addresses are usually unsigned, so I got lost there a bit.
> 
>>>> +#define   XE_CSC_ERROR					17
>>>> +#define   XE_GT_ERROR					0
>>>> +
>>>> +#define ERR_STAT_GT_FATAL_VECTOR_0			0x100260
>>>> +#define ERR_STAT_GT_FATAL_VECTOR_1			0x100264
>>>> +
>>>> +#define ERR_STAT_GT_FATAL_VECTOR_REG(x)			XE_REG(_PICK_EVEN((x), \
>>>> +								  ERR_STAT_GT_FATAL_VECTOR_0, \
>>>> +								  ERR_STAT_GT_FATAL_VECTOR_1))
>>>> +
>>>> +#define ERR_STAT_GT_COR_VECTOR_0			0x1002a0
>>>> +#define ERR_STAT_GT_COR_VECTOR_1			0x1002a4
>>>> +
>>>> +#define ERR_STAT_GT_COR_VECTOR_REG(x)			XE_REG(_PICK_EVEN((x), \
>>>> +									  ERR_STAT_GT_COR_VECTOR_0, \
>>>> +									  ERR_STAT_GT_COR_VECTOR_1))
>>>> +
>>>> +#define ERR_STAT_GT_VECTOR_REG(hw_err, x)		(hw_err == HARDWARE_ERROR_CORRECTABLE ? \
>>>> +							ERR_STAT_GT_COR_VECTOR_REG(x) : \
>>>> +							ERR_STAT_GT_FATAL_VECTOR_REG(x))
>>>
>>> Ditto for whitespace.
>>>
>>>> -#define DEV_ERR_STAT_NONFATAL			0x100178
>>>> -#define DEV_ERR_STAT_CORRECTABLE		0x10017c
>>>> -#define DEV_ERR_STAT_REG(x)			XE_REG(_PICK_EVEN((x), \
>>>> -								  DEV_ERR_STAT_CORRECTABLE, \
>>>> -								  DEV_ERR_STAT_NONFATAL))
>>>> -#define   XE_CSC_ERROR				BIT(17)
>>>>    #endif
>>>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
>>>> index 2019aaaa1ebe..ff31fb322c8a 100644
>>>> --- a/drivers/gpu/drm/xe/xe_hw_error.c
>>>> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
>>>> @@ -3,6 +3,7 @@
>>>>     * Copyright © 2025 Intel Corporation
>>>>     */
>>>> +#include <linux/bitmap.h>
>>>>    #include <linux/fault-inject.h>
>>>>    #include "regs/xe_gsc_regs.h"
>>>> @@ -15,7 +16,13 @@
>>>>    #include "xe_mmio.h"
>>>>    #include "xe_survivability_mode.h"
>>>> -#define  HEC_UNCORR_FW_ERR_BITS 4
>>>> +#define  GT_HW_ERROR_MAX_ERR_BITS	16
>>>> +#define  HEC_UNCORR_FW_ERR_BITS		4
>>>> +#define  XE_RAS_REG_SIZE		32
>>>> +
>>>> +#define  PVC_ERROR_MASK_SET(hw_err, err_bit) \
>>>> +	((hw_err == HARDWARE_ERROR_CORRECTABLE) ? (BIT(err_bit) & PVC_COR_ERR_MASK) : \
>>>> +	(BIT(err_bit) & PVC_FAT_ERR_MASK))
>>>
>>> I'd write this as below and move it to xe_hw_error_regs.h
>>
>> This is not specific to register selection or defining bits. It's related to
>> mask. So .c should be the right place
> 
> Don't the mask bits come from register def?

yeah masks are already defined in register header. But this is a 
comparison. I don't see these in the register headers

> 
>>> #define PVC_COR_ERR_MASK_SET(err_bit)			(PVC_COR_ERR_MASK & REG_BIT(err_bit))
>>> #define PVC_FAT_ERR_MASK_SET(err_bit)			(PVC_FAT_ERR_MASK & REG_BIT(err_bit))
>>>
>>> #define PVC_ERR_MASK_SET(hw_err, err_bit)		((hw_err == HARDWARE_ERROR_CORRECTABLE) ? \
>>> 								PVC_COR_ERR_MASK_SET(err_bit) : \
>>> 								PVC_FAT_ERR_MASK_SET(err_bit)
>>>
>>> ...
>>>
>>>> +static void gt_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err,
>>>> +				u32 error_id)
>>>> +{
>>>> +	const enum drm_xe_ras_error_severity severity = hw_err_to_severity(hw_err);
>>>> +	struct xe_device *xe = tile_to_xe(tile);
>>>> +	struct xe_drm_ras *ras = &xe->ras;
>>>> +	struct xe_drm_ras_counter *info = ras->info[severity];
>>>> +	struct xe_mmio *mmio = &tile->mmio;
>>>> +	unsigned long err_stat = 0;
>>>> +	int i, len;
>>>> +
>>>> +	if (xe->info.platform != XE_PVC)
>>>> +		return;
>>>> +
>>>> +	if (!info)
>>>> +		return;
>>>
>>> Since info allocation is not related to hardware, we shouldn't even be
>>> at this point without it. So let's not hide bugs and fail probe instead.
>>
>> yes currently it is supported only on PVC. I can remove this here as there
>> is a PVC check but cannot remove the one suggested below.
> 
> Fair, but please also return the allocation failure. With that perhaps
> xe_hw_error_init() will be int now.

That's present. We just log it as an error and not fail probe.

Thanks
Riana

> 
> Raag
> 
>>>> +	if (hw_err == HARDWARE_ERROR_NONFATAL) {
>>>> +		atomic_inc(&info[error_id].counter);
>>>> +		log_hw_error(tile, info[error_id].name, severity);
>>>> +		return;
>>>> +	}
>>>
>>> ...
>>>
>>>>    static void hw_error_source_handler(struct xe_tile *tile, const enum hardware_error hw_err)
>>>>    {
>>>>    	const enum drm_xe_ras_error_severity severity = hw_err_to_severity(hw_err);
>>>>    	const char *severity_str = error_severity[severity];
>>>>    	struct xe_device *xe = tile_to_xe(tile);
>>>> -	unsigned long flags;
>>>> -	u32 err_src;
>>>> +	struct xe_drm_ras *ras = &xe->ras;
>>>> +	struct xe_drm_ras_counter *info = ras->info[severity];
>>>> +	unsigned long flags, err_src;
>>>> +	u32 err_bit;
>>>> -	if (xe->info.platform != XE_BATTLEMAGE)
>>>> +	if (!IS_DGFX(xe))
>>>>    		return;
>>>>    	spin_lock_irqsave(&xe->irq.lock, flags);
>>>> @@ -108,11 +242,53 @@ static void hw_error_source_handler(struct xe_tile *tile, const enum hardware_er
>>>>    		goto unlock;
>>>>    	}
>>>> -	if (err_src & XE_CSC_ERROR)
>>>> +	/*
>>>> +	 * On encountering CSC firmware errors, the graphics device becomes unrecoverable
>>>> +	 * so return immediately on error. The only way to recover from these errors is
>>>> +	 * firmware flash. The device will enter Runtime Survivability mode when such
>>>> +	 * errors are detected.
>>>> +	 */
>>>> +	if (err_src & XE_CSC_ERROR) {
>>>>    		csc_hw_error_handler(tile, hw_err);
>>>> +		goto clear_reg;
>>>> +	}
>>>> -	xe_mmio_write32(&tile->mmio, DEV_ERR_STAT_REG(hw_err), err_src);
>>>> +	if (!info)
>>>> +		goto clear_reg;
>>>
>>> Same as above.
>>>
>>> Raag


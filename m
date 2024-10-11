Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D1E99AE95
	for <lists+dri-devel@lfdr.de>; Sat, 12 Oct 2024 00:21:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7D0B10E098;
	Fri, 11 Oct 2024 22:21:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YpNVtEfw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79AAA10E098
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 22:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728685298; x=1760221298;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FkwNDV15oOvkO0thvkyW8/o2Rf8bjjmmDMMp0XdQQZQ=;
 b=YpNVtEfwlnTWfdHVPavMgahfcwF0FiErZ83Fk3n9pZxPS8QHXkISU78S
 UyIKqQbjDO7Sd8xMe3FMnmIVebXFLShq60Vxe1JfTtqRldtCtpmDk449K
 XRruul92G15aQUkL7e+YuYnddtAgWGp9V6oN0J3FE5MF/ykP1o1OIUTRG
 0fj8jTiSGM8oDGi3U+6vF056W5jmhwAEtECqwk++yD1Am7A0HZC+bvQ0L
 Bq403NzOIm0adbZ9c4hOwIa1G5s2b0rkN3aHEc65l81FiclYcvCIMiTmS
 m7Q4IhRdUL09KXz79kzEpR+PPh9NETUqfg0ZeLxeBIxRwau/0k5IcM2kR Q==;
X-CSE-ConnectionGUID: H1ag+StsQhGcHwb+cALZRw==
X-CSE-MsgGUID: n+sybRYtQT6Fs7l0Z6eQ5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28188647"
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; d="scan'208";a="28188647"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 15:21:35 -0700
X-CSE-ConnectionGUID: ogofnOsaQxynvOWkLev5fQ==
X-CSE-MsgGUID: esyoqYlVRMW2C4Et47BluA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; d="scan'208";a="76943203"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Oct 2024 15:21:32 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 11 Oct 2024 15:21:32 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 11 Oct 2024 15:21:31 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 11 Oct 2024 15:21:31 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 11 Oct 2024 15:21:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=icLt0FrZPYbU5oXXiiWil2r1C5V49YOeloLfqxTJtHxcS4mvKfLF8jYyqrGFqRnNdpPATyCzmJEYgw8Ca+uI9wmtkuLqpEjPXt19rYh4Czk1+jGQrASnpvF7IZf6GGFxfIEpSMYMreO/0kbT6UFIILhn8tmX60x9JFXETNlTmUzGtQPzsQ87XbvQbQ5UjKdZzssOCQnpExAPpnRnZAu6KhNpgSqpe00C57H7hFr5Xw/d7nzeGco78qc7EpRRlsM/G1yk4p4YBQdD/GPfgT7IMzX2ktJa2uP8CZxPSGfTg9O0kT9QhLryiELpV9v7Btfkd2igb5gK5NHJkmo+kp3eMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GecyV8j6EYqg/XdTBkdDbc2rtzRZtfsFqBR6OXNXIrw=;
 b=oLUuc68yM+ndT82yW9HiVlgiGc5LxJMtvNB7qIR80TxvkYPBlnuEAgelELuXO/4IjEdePF86hneoSNJ+p+R7GtiEzjcug/bMINf5OYjVFtMsl5TO3ljga+KAPbrHpqAHXQy/GTqTTr/C6vmHqIOGi9ZcQnhZRaHYb9zpvEItna0OSJlGhkwzQ+B4xxDX2+S5UqStq7JZ50dt4XA8f7QF2H/thLntij5dXYG3gc20fU8R/WLhXG7NWdfX4EdmRrgEUmyv0xJ2m0IEBQ0hxpx4/DlzxCOFWDeEXuX5MIL69GmNiwwr5jkJUw7UDuS2rpWrOzwvZA3c8poqA4EQCUUb9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.20; Fri, 11 Oct
 2024 22:21:24 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8048.017; Fri, 11 Oct 2024
 22:21:24 +0000
Date: Fri, 11 Oct 2024 15:21:18 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>, "Peter
 Zijlstra" <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, "Arnaldo
 Carvalho de Melo" <acme@kernel.org>, Ian Rogers <irogers@google.com>,
 "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
Subject: Re: [PATCH 0/5] perf: Fix pmu for drivers with bind/unbind
Message-ID: <Zwmk3iqTdTkStfqx@orsosgc001>
References: <20241008183501.1354695-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20241008183501.1354695-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW4PR03CA0267.namprd03.prod.outlook.com
 (2603:10b6:303:b4::32) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|CH0PR11MB5249:EE_
X-MS-Office365-Filtering-Correlation-Id: bcf83464-be9a-481f-6ae5-08dcea430a6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cWJWUjE1RVhhRTR4ZjFKUUc1QWd2anhGRVZRdWxUZ3VkR0JhcmRXWExMWGNr?=
 =?utf-8?B?RmJQTmVPOXFDenpiMWpPU2pXQU5PVHREOE1JMWVqdXZOTnpIYlI4NjVPOWVO?=
 =?utf-8?B?L2NRdVc5SnArYXVrcGt3SHB3dmliRzR1Q2pIZXloMWhKbW0rQWR6UUJnbUJh?=
 =?utf-8?B?WFAzYXk1WklzQlVWS3VUVlkyV1hESm5oODRxZ04zSW1jRi9lYXVwaDltYTMx?=
 =?utf-8?B?Ty9XZ2lJRTZwaERZOUU3TjRHTWJHd0xBQjF4MndyYjFOVFd6bTFqSWhqVGZm?=
 =?utf-8?B?aWIvbWZYdzdhT2UxbG9IYjg2WGZia3hYNU1VbDNtSnpKOVNVS054NDhFdENa?=
 =?utf-8?B?eWllenN1ZXlEeEpsc04xN2I4cCtTUUNIVWxQdmRmcGVTVEtqRXNzNEFaUUlT?=
 =?utf-8?B?TEtkMUNrUTl4STVhUkpQRjg0dkh6OExQejdUMTl6TlZCRGlvajBuNnE3bGlC?=
 =?utf-8?B?YWxSbUxFYmRyWUpvejBhd2d0MHBFZEFJeHhqRGRiZkZRRGpNRXI3SWRTTDYr?=
 =?utf-8?B?V09wMCtHOXkxMCtNL3JJcU5oMGdhc0h4OHY2MXVzdk91anFJQ1pVc2g1ZnBT?=
 =?utf-8?B?Yk5UK1BTS0lpNGNOZzlaZWVWditoSzlHWitCbUlTK0I1WUpSZmU2bVBZbUdo?=
 =?utf-8?B?TzN0VGgxUzMzV29sYklxL3ZoNjVVT2dFUWNXTVlEMkc2ZnhOL0NsdzNhVEpW?=
 =?utf-8?B?N3ZGK1pjYW5weitiR2VmaHcyNVBGQ1dDMzdmZVc4RTMzelB2bWxDeUI0N002?=
 =?utf-8?B?VENJaHpwY3NXN3BrR0s1MkMrRlBqTVB6REdlZnhyS3drdllkcTZDOVJQVTlq?=
 =?utf-8?B?MnZJQ25wa2hpZkd0WEcyeHZMZ2NlclE4YTRvRXpTSldNT2FYZjQwd0dnUHVn?=
 =?utf-8?B?a24venZzR1Y1eWRoajFiMnFLWGNuV0RMY3F5VkZhc0FmZzVqVXZEc3pMa044?=
 =?utf-8?B?SC9ramRpRm1KOVJlRjRtQmZndTFEV043Rzl2RzY2bldEZWc4M0dybmkxenlz?=
 =?utf-8?B?VXZIeG1xYXQyV2xKWnpKVytHVGszdXJlY0NqN1JnKzRYWmpsZThPcjduVHk2?=
 =?utf-8?B?cTg0M3B2cFVnUHh1bERMNWVCemJHMDB0eGhBMERsaXc4ZnIrTlpEWG0rcHlF?=
 =?utf-8?B?M0VCWHpjNjJXS3d3TlY0Z3hHd2lNTWlLRE9PZ2ZneXFIanh5V0JUU0M3c2w0?=
 =?utf-8?B?OTY3azliamhZU1V3emVRZ2cxcGlnQzZhS3ZFaVlkMGcrZnkxZmY2TUpzTGNS?=
 =?utf-8?B?YjlNb1QzMG5hOWxvKzRXUHhaRlBCb3c1MEpTeWs2ZkQ3cFJUMGV5cXdaTGhn?=
 =?utf-8?B?QWJaaDhkUVhEUml2NXZOY0VzOXp5ekFYbTl4WFp6ZndNRmNhQmZ1aXVobXRM?=
 =?utf-8?B?TVBNV2VPQW03UHdoRFFBandTUmU1ZjFjVFljdXgrdVJBSGRnVnlvMmg5cTJR?=
 =?utf-8?B?WWpONUNCMWJrSXF4REpLbmh3cDRXdTJiTkNJZzFGakNGQ05NRklDd3dkV1JZ?=
 =?utf-8?B?a2Y5RXBuNlRjVzRKeG1SN1VMNmhFK21QdHZSSjcwYzFXaWVXRG5Td3Q1VGZS?=
 =?utf-8?B?ZFVSaWhXOXpSS2Z2aTVIZDBQNXBmVnQ2Rm5Gb201UmN1M05ENnkzbEhFOFNz?=
 =?utf-8?B?a0wrTkRrUE81S3pIYnVwc0J3L1VYM0NncTVOOE5PWitzQng1ak1FN1RWV3VB?=
 =?utf-8?B?cTI4aWlYOFFxZURHRGVvYm5saVlhaE5pMDVyTEZsWGpzTlBIMkhwb1MzdDBk?=
 =?utf-8?Q?GQ22be82KqTX74XmMw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVhiaS9xdi9JMVlJeG0xdlhya3J2ZlJrVUV5WVNyaXBTUnZUWVRaQkhqcTB4?=
 =?utf-8?B?V1RMWk83Rm9VQ2YwR1l3RDFkcHkzemlid2NLbDJuenA2M0lLNy9sM0hxSS9q?=
 =?utf-8?B?Ry9vYWFlSXI2bndhb0ZUbHNNOVB2Qkx5WEdsQ3V4L0xGLzBEelhHV3JhYzJ6?=
 =?utf-8?B?MlZCaXBHYkxjSlFRVWxyVVFFZFVIdC8rQkZlTGJFYmVNcjA4VnVxUCtCbkZt?=
 =?utf-8?B?SzVwNDlBRFdlY21nQk1OVlBadStOeDc5blUvRFZvejlOYnc5UTBueTFjTHBO?=
 =?utf-8?B?ci9Ja08zdE9sL1hnTENWbWpWT29heUNUNFpTVS91YktneXJDTFpBOFB4aVNL?=
 =?utf-8?B?Qk93UHFPU1B3Y2NyRGVyc3dBQ1hiMUsxL2xlQXBEeFlSZ3c5cXNQL3VuZmc5?=
 =?utf-8?B?SWNXK1JJbWJick9IdWV5eHgxTkI0ejZlM3Q0Ukx1cXhmSE5lcDUrV2VISjFZ?=
 =?utf-8?B?bHpQWHVzQU5sY0IxV2FYUFdkOFJZbUorNW93ck54YXJFV0JFbklrOS9ERnJW?=
 =?utf-8?B?VFJ1SWhRZVJQN00wNlJ4MlhwcFBWbVBPMVdscURKd3lTdmhzUEVvUXoyRWJw?=
 =?utf-8?B?d1NYTkZjUUJuV08wcFd6bDVOWTRWcXM4dkxsdld4SE05bThudjVaMjJPcHpy?=
 =?utf-8?B?SWJWL3BKTDgxMjBmK25WN1Jxa0g5RktYQUhob0Y3dURyRW9ZeEUybkFkWVNE?=
 =?utf-8?B?cGltcUxqbHpkelljR2dpMHdGTGJ3QkJWSEZJSWZsRmpBeThJSmd0aDNuWU9C?=
 =?utf-8?B?SWdzTDRpOCtJTmhoVTdkKzVtNmRYWWpuRkxxRmo1bGdCVWxyNWpUVncrNVU3?=
 =?utf-8?B?N3Y5V1pNZ2E3eTU3aS8zajNEU3A2RENwSFhNQjVNMGZ4WUszVnN5Y0g1MUNp?=
 =?utf-8?B?SEdNelA0TzN1WElyeG40b0tYckQ0UE0xcjVhMGo3bzZkaGgrcWVCdGZzMmpw?=
 =?utf-8?B?NUZRU0NMU1pqYm8xMmdrMC9yNTUwVEN3Y2t1UTh5TTVVV0hJWlpNQWx5ak9O?=
 =?utf-8?B?aXkveUpqbXVDaUc5WFVlSmRIOGRaeUtmck4zd21WUC93ZTJQZXlnampvdUtI?=
 =?utf-8?B?R3NxR0pXT0ZyRDdEWWxGcDhUNGFoTFhablV1V01GUmgydlZ0MVdMWDEzanZ1?=
 =?utf-8?B?OEJZVjgxVU9qN3RMNTFRb25hUDBSOHhJNW9XZ3lyWnJOVjVMVVFMamlCdUw2?=
 =?utf-8?B?dTk4Z1pUdEpQbzM0NElkblFHVk9lWFZaSGR4SHhpN2JCdjhIa3hYampTTERs?=
 =?utf-8?B?em85ZWtxNldYb05yWnY4NUZIck0wdEpZYU5hUUpkUTF1TkEyUEhTUmZyNFgy?=
 =?utf-8?B?NWd1NXllb21nei9NeEtiRVBHZjhqUndWWlVTRFF3NVNQTDMxOUJkVEJudERs?=
 =?utf-8?B?cjZSNlFIYlRsc0kzdVJmVFNVVHB6OXBUTzhBNHVTVFJkUklxWWNjZzdKbmVn?=
 =?utf-8?B?Wk5GVktDQUtkTUxtRE9Dek55TE9lUmEzbFMya1Y5MFA3cmY2bjdySW9zR3Zx?=
 =?utf-8?B?TlFnaWFuUkZZUnRybGNVUDRLUmNIZWJUMkFhZWV4cVpwZFpQNGYySHBRUWcy?=
 =?utf-8?B?S3lpL2FmdHMwR2ZlTXBKRjMwMUlwSWZWZDAzSXNSUVdTcmNIYzRnWDdOWkRN?=
 =?utf-8?B?SktuVFZQWUw4S1dkV0J2SXpuWkhycDRQSlZnT29od0JscnIvY2NQNlRiRWxi?=
 =?utf-8?B?UHdsZVZEQVpISXA1VSt1UGFUTFY4NmlTRlg1SFduN3hEbk9QZm9zK2RuWkty?=
 =?utf-8?B?VzdaSlJmVFRUMDdKdHZqNFpSRGp1ay9ZRERvNldmdVNVbG90SWJXdE0zZWpJ?=
 =?utf-8?B?VEQya2JMOWtNZmlWRkdNbVlsSzdtZUF2dkViVlBDUHFlb1F3Yk1Nbmxvbldw?=
 =?utf-8?B?K3FmdTFHVWxTMDN5Qmg2VmlTYzJrYnl1cUo0TjRmbmozWmgxOENhMUdSLzl0?=
 =?utf-8?B?ZWNxZEN5MGxZdUJPWUhTR2NQa1NCVWQ3T0JUSmVKOFZPb2dkZHVoMnFDWHZL?=
 =?utf-8?B?dUdFcm1tbUx5aEZtUEVYUU1HeUUxNnU1U3hHckVhT1NtNDByaVhJQ2tTZDdm?=
 =?utf-8?B?UlN1T3ZPUVNhWWhYUVE1a1VsTldJYzVoL2M0NTIxVWVzZXNEZHdoaG1iT2pV?=
 =?utf-8?B?VGFNbGh2YUZrMTlXQ3BzS2pQUEpkdSs1VWRMZ1NXSHhDdldmYldDcGxoZW1y?=
 =?utf-8?Q?VafgB604YajisqERT9iRyPo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bcf83464-be9a-481f-6ae5-08dcea430a6b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 22:21:23.9732 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RsofOa5KUqWvM7Fi9YABhjIrQZgkcH0QjMV+A4Su28WXl2ZKr/ubkYQBbCwXHKklVZ3/rmaVyY6oIUqmomLCASHpp7rFsPNWN22y1sB5lmc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5249
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

On Tue, Oct 08, 2024 at 01:34:56PM -0500, Lucas De Marchi wrote:
>v2 of my attempt at fixing how i915 interacts with perf events.
>
>v1 - https://lore.kernel.org/all/20240722210648.80892-1-lucas.demarchi@intel.com/
>
>From other people:
>1) https://lore.kernel.org/lkml/20240115170120.662220-1-tvrtko.ursulin@linux.intel.com/
>2) https://lore.kernel.org/all/20240213180302.47266-1-umesh.nerlige.ramappa@intel.com/
>
>WARNING: patches 1, 4 and 5 are NOT intended to be applied as is. More
>on this below.
>
>This series basically builds on the idea of the first patch of my
>previous series, but extends it in a way that
>
>	a) the other patches are not needed  (at least, not as is) and
>	b) driver can rebind just fine - no issues with the new call to
>	   perf_pmu_register()

I have 2 broad questions:

(1) I am curious how (b) works. You seem to have a notion of instances of 
devices and then are you using the instance number to create the name 
used for the sysfs entry? Did I get that right?

If so, should the application discover what the name is each time it is 
run? In the failure case that I am seeing, I am running an application 
that does not work when I rename the sysfs entry to something else.

(2) Similar to Patch 1 of your v1 series where you modified _free_event:

static void _free_event(struct perf_event *event)
{
	struct module *module;
...
	module = event->pmu->module;
...
	if (event->destroy)
		event->destroy(event);
...
	module_put(module);
...
}

With the above code, the kref to i915->pmu can be taken from the below 
points in i915 code (just to point out the sequence):

i915_pmu_register()
{
	perf_pmu_register()
	drm_dev_get()
	kref_init()
}

i915_pmu_unregister()
{
	kref_put(&ref, pmu_cleanup)
} 

i915_pmu_event_init()
{
	kref_get()
}

i915_pmu_event_destroy()
{
	kref_put(&ref, pmu_cleanup)
}

void pmu_cleanup(struct kref *ref)
{
	i915_pmu_unregister_cpuhp_state(pmu);
	perf_pmu_unregister(&pmu->base);
	pmu->base.event_init = NULL;
	kfree(pmu->base.attr_groups);
	if (!is_igp(i915))
		kfree(pmu->name);
	free_event_attributes(pmu);
	drm_dev_put(&i915->drm);
}

Would this work? Do you see any gaps that may need the ref counting code 
you added in perf?

Thanks,
Umesh

>
>Another difference is that rather than mixing i915 cleanups this just
>adds a dummy pmu with no backing HW. Intention for dummy_pmu is for
>experimental purpose and to demonstrate changes tha need to be applied
>to i915 (and probably amdgpu, and also in the pending xe patch).
>If desired to have an example like that in tree, then we should hide it
>behind a config option and I'd need to re-check the error handling.
>
>With this set I could run the following test script multiple times with
>no issues observed:
>
>	#!/bin/bash
>
>	set -e
>
>	rand_sleep() {
>		sleep $(bc -l  <<< "$(shuf -i 0-3000 -n 1) / 1000")
>	}
>
>	test_noperf() {
>		echo 0 > /sys/kernel/debug/dummy_pmu/bind
>
>		echo 0 > /sys/kernel/debug/dummy_pmu/unbind
>	}
>
>	test_perf_before() {
>		echo 0 > /sys/kernel/debug/dummy_pmu/bind
>
>		perf stat --interval-count 2 -e dummy_pmu_0/test-event-1/ -I500
>		echo 0 > /sys/kernel/debug/dummy_pmu/unbind
>	}
>
>	test_kill_perf_later() {
>		echo 0 > /sys/kernel/debug/dummy_pmu/bind
>
>		perf stat -e dummy_pmu_0/test-event-1/ -I500 &
>		pid=$!
>		rand_sleep
>		echo 0 > /sys/kernel/debug/dummy_pmu/unbind
>		rand_sleep
>		kill $pid
>	}
>
>	test_kill_perf_laaaaaaater() {
>		echo 0 > /sys/kernel/debug/dummy_pmu/bind
>
>		perf stat -e dummy_pmu_0/test-event-1/ -I500 &
>		pid=$!
>		rand_sleep
>		echo 0 > /sys/kernel/debug/dummy_pmu/unbind
>		rand_sleep
>		rand_sleep
>		rand_sleep
>		kill $pid
>	}
>
>	test_kill_perf_with_leader() {
>		echo 0 > /sys/kernel/debug/dummy_pmu/bind
>
>		perf stat -e '{dummy_pmu_0/test-event-1/,dummy_pmu_0/test-event-2/}:S' -I500 &
>		pid=$!
>		rand_sleep
>		echo 0 > /sys/kernel/debug/dummy_pmu/unbind
>		rand_sleep
>		rand_sleep
>		kill $pid
>	}
>
>	N=${1:-1}
>
>	for ((i=0; i<N; i++)); do
>		printf "%04u/%04u\n" "$((i+1))" "$N" >&2
>		test_noperf
>		test_perf_before
>		test_kill_perf_later
>		test_kill_perf_laaaaaaater
>		test_kill_perf_with_leader
>		echo >&2
>	done
>
>Last patch is optional for a driver and not needed for the fix.
>
>Open topics:
>
>	- If something like the last patch is desirable, should it be
>	  done from inside perf_pmu_unregister()?
>
>	- Should we have a dummy_pmu (or whatever name) behind a config,
>	  or maybe in Documentation/ ?
>
>thanks,
>Lucas De Marchi
>
>Lucas De Marchi (5):
>  perf: Add dummy pmu module
>  perf: Move free outside of the mutex
>  perf: Add pmu get/put
>  perf/dummy_pmu: Tie pmu to device lifecycle
>  perf/dummy_pmu: Track and disable active events
>
> include/linux/perf_event.h |  12 +
> kernel/events/Makefile     |   1 +
> kernel/events/core.c       |  39 ++-
> kernel/events/dummy_pmu.c  | 492 +++++++++++++++++++++++++++++++++++++
> 4 files changed, 539 insertions(+), 5 deletions(-)
> create mode 100644 kernel/events/dummy_pmu.c
>
>-- 
>2.46.2
>

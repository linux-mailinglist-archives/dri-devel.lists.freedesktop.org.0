Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29DD5A7B216
	for <lists+dri-devel@lfdr.de>; Fri,  4 Apr 2025 00:41:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9467810E046;
	Thu,  3 Apr 2025 22:41:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GhlVOjHx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EDAF10E046;
 Thu,  3 Apr 2025 22:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743720083; x=1775256083;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6C3kjMqLnPkXZIjuHn2bEc2/YpI0SCcad9qCh0cumsk=;
 b=GhlVOjHxsIoZo1uOJ+x04/pV7vYLRGKTT+AjyIcBQSddRGL4pOd5QovZ
 NjImg/LcGGeq/DJbss4tVtdthmhmP6K4Vf20eN+W9+pPHsu8kAPXyj+Zv
 IvsVd+j3dwKyaSKHiajkhFRqTqUXqpaL3kdcsO8pquE45Yy99g7rEoyYH
 OxXmClkQw7lbRCVUdMd8ElRHi1e+r0i7tSj/2IpgA2qGJ5RlDNuRb6PEL
 VB9c+j9GshGE833t3bBKpXuRHjKkUCXJEJtETy92VksH9zhPnBd+jK/5M
 BuCPEXbF8wpQ+HZrrbydzKLwGCkC+TVtYuYxXix1hzaqgCVENNyJB0JVn w==;
X-CSE-ConnectionGUID: esvmuRheRsGwebXURJmmTw==
X-CSE-MsgGUID: 0PvncXrlSdKnLhEtsAFcuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="62693216"
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="62693216"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 15:41:22 -0700
X-CSE-ConnectionGUID: yXcIAPjETWy13yXr1KLVfw==
X-CSE-MsgGUID: KzD4xbXSRYqAKVT+p8gnDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="131276003"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 15:41:22 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 3 Apr 2025 15:41:22 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 3 Apr 2025 15:41:22 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 3 Apr 2025 15:41:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q+tVhC70+kfZH2u9Ac3BbhSJr56L2voARVa1uw/Zs45qGCWp42X8BzK/ZQzpuQf+bT8gxpYETsfwvkwPSEJ3+43c5shi4aQN7dAMhn+iALXVd1G4Z8Yi7Gn7uKNMuqcJ8FPtdYPDgTtMjbN6F6EzpEpabgufLzGYxungWX2mPeSNr/dQ1qH88sQrxvDI6oFh+clMJyOvql0a0L3GeQSAXlBzRNqPPlZ/DhrF4ziZGDK1DqrtBWswl5A4h1OWtp9bx+k6bTEe3RuRXo8HTJvmAOCWRfRwDmcHdIcZIQCAVaDC/sCGAkXCAH5BhFUZZHB/aXMctvoBqcH0hARVEjar0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/sJkvic8lVAtwNHBRs2/+YIod1ii9GZP0B2MPbAHVyw=;
 b=ad9VFI52J7fpF2jqdKolaqMV5DbAE/TUCBCa6MwQ+IHP2wrXbAzp8J3YMWEy7sYXg5Y7iAx4hbpTw7D0+NWgKFVg8akPcfUt1sxFPRp1E5YHYSIYhy+Lg9Vm3TZz9mOfsE7/Xx+ducWR32zfVE9qZgpAt21RcGGqW/dAihOGIl+B0EjfBTUp19XDZTyjZAxKdiN6Nzd8LbdXOYeF3KDhc2jH8dLS6hMfClc0FjlwEdQfDBGF8J3OrxB0/091XVrlUGqNKVyI3HixSXjElJw7g0zaN342uyO3QZFPVSP3X+wdsCiOhoZzgoooWWb3dZhqiVnL0ATKZIOOYyyiag4+Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.41; Thu, 3 Apr
 2025 22:41:19 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%5]) with mapi id 15.20.8534.043; Thu, 3 Apr 2025
 22:41:19 +0000
Message-ID: <4b7252d6-273b-46d4-a1fd-e8d985a8db13@intel.com>
Date: Thu, 3 Apr 2025 15:41:16 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] drm/xe: Add devcoredump chunking
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20250403202705.18488-1-matthew.brost@intel.com>
 <20250403202705.18488-2-matthew.brost@intel.com>
 <3716deb0-563c-49fb-9360-743e4c45682c@intel.com>
 <Z+8MZriWfnG0m9va@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <Z+8MZriWfnG0m9va@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0319.namprd03.prod.outlook.com
 (2603:10b6:303:dd::24) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|MN0PR11MB6278:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d7aa50f-2e1b-481d-0cd0-08dd7300a6b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cFM2RjdqTGNQZDVBcCs0VHUrNnJzSmlDOU5rSE10YXRWSHFiQVlvdndVeG5y?=
 =?utf-8?B?MUJJcHNaWVZnaHhoUmIzWTR0eHh1MWxmNHJKSytPeXI0VE5ORUVKRGI5ZFpi?=
 =?utf-8?B?VzFNd0V6a2h4NjZsL0wvbEIvbVJoVGZzdlF4aSt0OWdid1c3bnlEczRyU2lD?=
 =?utf-8?B?WkRidTdqSHU5eXRhSUthRG9mM3BnTElNS0IyNmd0WWNwK0pMRWdPZzZxRkh5?=
 =?utf-8?B?bldPTmxCMWY3LzdUdkIra0w3ZFlBbTJXOHpsN3BxcE56Vitwa0RDTWw4Z0xm?=
 =?utf-8?B?OWhOOXVjcEY2UkgxUUpXNXZEbU55bjlmZU93cHBUN0ZXbHU2OE1wTS80dUdQ?=
 =?utf-8?B?RnA5bG9YZmRNMWk1cEtpcTRvWC9HQ2R6azZXK1g3alZyM0JvYmJlMzZNN09P?=
 =?utf-8?B?cVpCYzZ2S1dCcUJxRUcwN0hCd2VvelVZVU5kMFBjei9tQXVOSzRuNVVhYTEy?=
 =?utf-8?B?bVB5OHU3ZjJEUlFqc1hybzBuOXNTa1h1ZnZNb3oyUGhOQVBVZTMvOGJ1VlVI?=
 =?utf-8?B?UnA4SC9XN05wTU8vQjQ3STg4QkozZFV0eDg0YzQ0SGEwb09QNEFGeFN0WTF1?=
 =?utf-8?B?ckc0MndDZExXSlZqd2dtT0RPV1lGOHkxOWYvMG0raGhxUkhJUzAyc3Bra2JY?=
 =?utf-8?B?b1ZBYzlvZzcvV0dZWlA2NmNZWFdjTGQvamdBUVpCbCtiQVhMSXdYcDZXbjNl?=
 =?utf-8?B?aFFxNUhzTC9WdE85TDU0TVlaV0VvRFFudyswbmhoeHJqR1pNZ05IOCtWQmJ2?=
 =?utf-8?B?bnNYM0dlc3VPd3RRMlpQV01XTXpxVFlrcDdpSWpGOGZIaEt6SGJNZ3lFdXV4?=
 =?utf-8?B?ZzhpV0RFaXVhRmZVNmZOMmVxcVdsbTZOUjVHam10OWxycndOa0JLUTk5VmdH?=
 =?utf-8?B?K1ppUEF3Sk1hVzZua20wUW1Jc1d3K2IxYlJhTlhnWjFBajE1RTgvTUI1SnVW?=
 =?utf-8?B?cFI2aldvazVhOWtPbGV2SjU2YkM0QzNsSUhXZFdyMVVaMUpGK2dHeVNnUkp4?=
 =?utf-8?B?U0xwZCtwNFoxRGo3WDh6ODJFZkpqS0FzTjdvK2dBQlBCSi9Lb09ZaW04STl3?=
 =?utf-8?B?UHk3aVFQdWdrajBPVDkySkEzVUxjai9DLzg5Wi9SMlNkSWZHK01MSmk4a2xS?=
 =?utf-8?B?bWluRmhCNW1pWUtvMEpINmNDemxYbHNzblFQc0dqM0MzNGs1dVd0V1pIb1ZS?=
 =?utf-8?B?WXlLa2J5bzRxSUJsVTVjMTBIUWFkKzNRb05laDc2UHVKbGFGVTFaNTUwNzlH?=
 =?utf-8?B?NWFkNW9RQzd6bjJtVStpLzhvLzhEb2o0U24zWWlYTTNSRTl2OFAzY3hYVzR4?=
 =?utf-8?B?MWFqNjYrdnlxRHoxY3ZMODVVcEx3T01KUjkwWmcvWnFRY3djTVhpZWo4M2Jp?=
 =?utf-8?B?WEtZOW53VmY3VHA4TXBmT01QK1IwQ2ozclBEU3dPMWxiMTdqQUt3UjVLRDBG?=
 =?utf-8?B?R3JncmhPNnR3ZzJ3djJoOUNaU2VMUWJOcDlzZjFPTzVZeTNzQ2N5VWlOU0cw?=
 =?utf-8?B?VHhHZVZpL09rQXUvTEFPMlFYamh6UzlBcjI1WlNGZ3VDSFlMdnBBWlJRaDAw?=
 =?utf-8?B?OFdGMnB0YS9GcXNKZkpvVC90MzR1ZzdFV3p1VDlOdzR4MEtZd0tQQ08wSk5z?=
 =?utf-8?B?bnpHcGpWT3FJMTREWXJuWVJlb25mK2tLeFloRzJGUUdIbmF4K3RkV1BBRkNi?=
 =?utf-8?B?alVuakZjQnV1SDFsbVRaU2JNZ0VrVWlzRnNsRmtyTkNuSjVzdjhLbm91eEIy?=
 =?utf-8?B?OXJlYVlVaDUvdkluQ1c3SUl1Z1RyVVoybDdMN3h2U0hER2FkSTNPK21LanVu?=
 =?utf-8?B?UU1LNlhaZWNKRFB3dnNLMENWMHpVU3JBUkdwMWxaRW1zcmExSWJQMXNXU08r?=
 =?utf-8?Q?rpLeYNWJ+BrWq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WllGYjZpZE9jSjZyMlJSZEcyT3lsaTI3K1ovdUxuKzl0VEo3VmNSdERuOW1M?=
 =?utf-8?B?RUxJOG9BdFdUbmJlSVZ1RzhPMW9CdFVNaDZBdzZHUmVhNnR5b04wblFBOEtN?=
 =?utf-8?B?TnlYQTBEWjdGQzhVd0ZtSkFURHhWcGwya0c0U0YyWDRDRDlEb3YyeFFhbjhi?=
 =?utf-8?B?cERpRCs1dTJqZnNVVEwrYlNRU0R5RVNaVkg2VzhTbXVkNkZkelJSUkJ3WlFQ?=
 =?utf-8?B?akJqTzlHWkYwNEpHcEQxMTRsYUtSTEhKSi9QU1VhalBaTStuRldEUFBVVTZZ?=
 =?utf-8?B?STZ2aTRnZnJlNFQ4cmYrc1NKbU5GMVlKYWh3MVJ4dVVrLzUyMkROMFdWWEhj?=
 =?utf-8?B?OWs5OTZkbVhHY3ZFYndjYk54Ly9pRzZBRDVhVG8vTnpkd0pJQkNiM3NqT0Ny?=
 =?utf-8?B?dktiUnQveHNJNVZhcXJvKzVxUWhIRmk4cTV5ZVF0bjJNTWVGell0Rll1Rldy?=
 =?utf-8?B?bk5ZTkpWS3dLUUU3SjJTcTIrOEZ4OWJKZlAvZ2g1bFJoVjlrbk5mU1l1NEw1?=
 =?utf-8?B?WExnUi83Ym1sQ1F3ZDVnTk5qWkgyazdzTGxMNnh1UFZ2d2RLZjB1ZjRLQ3Ix?=
 =?utf-8?B?U1RhWEJJazlnRXBjdUJqdmZaUDlyeDVDZlRSejFKK2lKUldJeWJjWW1BSXJi?=
 =?utf-8?B?MVovWlR4VGRPdmlqQXQyQWd6MCtYOThONGlmYWVZa2xVcGhGaGRESVJ4VWVo?=
 =?utf-8?B?dGNKWUF3UVJYSGJjTjBSQ0VFK2lZZk5YbjRuVkZ6eDNlSVVPMkw0YnQwZ05h?=
 =?utf-8?B?L0RpcHJHbjRCTlJwUkhKcnorc2NmUjh6cDYzU2VhS3NYODNIa0lZQVVuNGJz?=
 =?utf-8?B?VEJpd3NKR2dGbU9YYzRiY0s3Ykg0bHVuTEdaTFJpN0o0VE1lYWxnVmVBUkpr?=
 =?utf-8?B?NzBNRTNGLzRmRzIzSmtuMmI0SWRQYVJBU0tLSFNPSms1R3dNdHRhc2Q1RXZv?=
 =?utf-8?B?a0xYSSttVTZaL2lhR2ZnOEpMZ0NoTmsvdmpWUmFkUm95S05kRThzaElEVjlj?=
 =?utf-8?B?dENtNjlERlFESEo5SnFwUUpNZ3BvOSs2OHhLZTBCakpkVG1lSjRhaUZzUmVn?=
 =?utf-8?B?ellseXBtcGpGajdOcFlwdmVmOENSeE92K255VDNpR25yb0RHQnBPRVpnUExn?=
 =?utf-8?B?MzBub2x6MVQ4SVlxNUVWbDlyMjlnVW5DRnMzMzJjQm1TakFhS2pHVTBobC9r?=
 =?utf-8?B?RWZTbDI2aDkzYnlCalBmTlhMVEJNTTNWNzgyQU5YNXdhRXhmdUw1Y2dqYWRT?=
 =?utf-8?B?UXRURWdEQTZaZkh6Q3JMdlhFV2ZKMDdKc1ByVmtHZkZ2NlNiM3BsZVFUeEVI?=
 =?utf-8?B?aTFQU2FOZnBkM2RCQ2x3UEYreHNpd0VLMDNGUFZuSnUzTzNIV0FwTmtsR25R?=
 =?utf-8?B?K3BIbTRTcnJzcDROUFVTMXhtL2p2M0VNb3Q2TXlnc2EvQzhWV094Q3FlWkQy?=
 =?utf-8?B?V0w0TEd6eXZ0QUExK29IZTMvcXJxaHo2ZXR1ZnlNa2JmbEpBWFlwTU5LcStN?=
 =?utf-8?B?SlRmSjhvZTNHWElvNG9ENkZmQVdncWNFWWZ2bWxTNFZlQWM4KzFRN3RIM3pY?=
 =?utf-8?B?dE5rc28zSDE3bGRBcnZTdVhUZnQ1K1AwY1FCeFVyUjhUaWM3TTVTbmo4TE12?=
 =?utf-8?B?UVBwWlUxUzlOd0tlaEhiNzJSdUZFQmt5emxSUWJQT0EvYXpNVWhXN0wwTWNU?=
 =?utf-8?B?QzVnL3JLNGlvM1NWWGlWWkl0NDJwWHYyM01rc0dpUjN3WkJnRkZ6RkdtdXVu?=
 =?utf-8?B?SFhZaEEyUDNrMVk4T0l5UHBGYUxxQ3BMeU11elNXT1orZjhqQk8xZ1JDeVNj?=
 =?utf-8?B?ZXRoc1V6RmVWVzQrcnF2b1BLMVFwc0VWaUdMa2Mvc09renFiRDhSMjVUVFhh?=
 =?utf-8?B?NkxPSmcwSzgrVjF4bHIwdUlEeEI3T3pYVUk4TVlpTWRYVWxQYWoveXZ4YWx6?=
 =?utf-8?B?VEozQlk1a1ZJd1JGVFpPa0VnWjlYeGtlNFcyeTc3aytaUVhFc0RlTEdXQk5E?=
 =?utf-8?B?am5ONVpOQkxIR2E5bjRkUEZkMkp3bmQzUTVNd0hTREs3dldtZms1ZDExVklQ?=
 =?utf-8?B?eUxUTEkwdjFyQnpYRDFJQmJldnJCajF3OFBJSWNUUndrKzJsVHV6dWw3RFNy?=
 =?utf-8?B?QlgyZGJLQ0pHdDB1TXBMTHBRTkVTT2l0UW0wUUZkV25UQ3l5Z2lHRCtWK1By?=
 =?utf-8?B?Vmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d7aa50f-2e1b-481d-0cd0-08dd7300a6b6
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 22:41:19.2554 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ALE/eAhCuXt1i/4Q1M6DNVpLjJgxPz1l4LpbhzsTduBf6WtqjbN5IV3KMOaTzkVTLWBo+tzBcrtd2mAFdQzY3g0/egCUVFZjkZuW5J/m4K8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6278
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

On 4/3/2025 3:32 PM, Matthew Brost wrote:
> On Thu, Apr 03, 2025 at 02:39:16PM -0700, John Harrison wrote:
>> On 4/3/2025 1:27 PM, Matthew Brost wrote:
>>> Chunk devcoredump into 1.5G pieces to avoid hitting the kvmalloc limit
>>> of 2G. Simple algorithm reads 1.5G at time in xe_devcoredump_read
>>> callback as needed.
>>>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_devcoredump.c       | 59 ++++++++++++++++++-----
>>>    drivers/gpu/drm/xe/xe_devcoredump_types.h |  2 +
>>>    drivers/gpu/drm/xe/xe_guc_hwconfig.c      |  2 +-
>>>    3 files changed, 50 insertions(+), 13 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
>>> index 81b9d9bb3f57..a9e618abf8ac 100644
>>> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
>>> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
>>> @@ -80,7 +80,8 @@ static struct xe_guc *exec_queue_to_guc(struct xe_exec_queue *q)
>>>    	return &q->gt->uc.guc;
>>>    }
>>> -static ssize_t __xe_devcoredump_read(char *buffer, size_t count,
>>> +static ssize_t __xe_devcoredump_read(char *buffer, ssize_t count,
>>> +				     ssize_t start,
>>>    				     struct xe_devcoredump *coredump)
>>>    {
>>>    	struct xe_device *xe;
>>> @@ -94,7 +95,7 @@ static ssize_t __xe_devcoredump_read(char *buffer, size_t count,
>>>    	ss = &coredump->snapshot;
>>>    	iter.data = buffer;
>>> -	iter.start = 0;
>>> +	iter.start = start;
>>>    	iter.remain = count;
>>>    	p = drm_coredump_printer(&iter);
>>> @@ -168,6 +169,8 @@ static void xe_devcoredump_snapshot_free(struct xe_devcoredump_snapshot *ss)
>>>    	ss->vm = NULL;
>>>    }
>>> +#define XE_DEVCOREDUMP_CHUNK_MAX	(SZ_512M + SZ_1G)
>>> +
>>>    static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>>>    				   size_t count, void *data, size_t datalen)
>>>    {
>>> @@ -183,6 +186,9 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>>>    	/* Ensure delayed work is captured before continuing */
>>>    	flush_work(&ss->work);
>>> +	if (ss->read.size > XE_DEVCOREDUMP_CHUNK_MAX)
>>> +		xe_pm_runtime_get(gt_to_xe(ss->gt));
>>> +
>>>    	mutex_lock(&coredump->lock);
>>>    	if (!ss->read.buffer) {
>>> @@ -195,12 +201,26 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>>>    		return 0;
>>>    	}
>>> +	if (offset >= ss->read.chunk_position + XE_DEVCOREDUMP_CHUNK_MAX ||
>>> +	    offset < ss->read.chunk_position) {
>>> +		ss->read.chunk_position =
>>> +			ALIGN_DOWN(offset, XE_DEVCOREDUMP_CHUNK_MAX);
>>> +
>>> +		__xe_devcoredump_read(ss->read.buffer,
>>> +				      XE_DEVCOREDUMP_CHUNK_MAX,
>>> +				      ss->read.chunk_position, coredump);
>>> +	}
>>> +
>>>    	byte_copied = count < ss->read.size - offset ? count :
>>>    		ss->read.size - offset;
>>> -	memcpy(buffer, ss->read.buffer + offset, byte_copied);
>>> +	memcpy(buffer, ss->read.buffer +
>>> +	       (offset % XE_DEVCOREDUMP_CHUNK_MAX), byte_copied);
>>>    	mutex_unlock(&coredump->lock);
>>> +	if (ss->read.size > XE_DEVCOREDUMP_CHUNK_MAX)
>>> +		xe_pm_runtime_put(gt_to_xe(ss->gt));
>>> +
>>>    	return byte_copied;
>>>    }
>>> @@ -254,17 +274,32 @@ static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
>>>    	xe_guc_exec_queue_snapshot_capture_delayed(ss->ge);
>>>    	xe_force_wake_put(gt_to_fw(ss->gt), fw_ref);
>>> -	xe_pm_runtime_put(xe);
>>> +	ss->read.chunk_position = 0;
>>>    	/* Calculate devcoredump size */
>>> -	ss->read.size = __xe_devcoredump_read(NULL, INT_MAX, coredump);
>>> -
>>> -	ss->read.buffer = kvmalloc(ss->read.size, GFP_USER);
>>> -	if (!ss->read.buffer)
>>> -		return;
>>> +	ss->read.size = __xe_devcoredump_read(NULL, LONG_MAX, 0, coredump);
>>> +
>>> +	if (ss->read.size > XE_DEVCOREDUMP_CHUNK_MAX) {
>>> +		ss->read.buffer = kvmalloc(XE_DEVCOREDUMP_CHUNK_MAX,
>>> +					   GFP_USER);
>>> +		if (!ss->read.buffer)
>>> +			goto put_pm;
>>> +
>>> +		__xe_devcoredump_read(ss->read.buffer,
>>> +				      XE_DEVCOREDUMP_CHUNK_MAX,
>>> +				      0, coredump);
>>> +	} else {
>>> +		ss->read.buffer = kvmalloc(ss->read.size, GFP_USER);
>>> +		if (!ss->read.buffer)
>>> +			goto put_pm;
>>> +
>>> +		__xe_devcoredump_read(ss->read.buffer, ss->read.size, 0,
>>> +				      coredump);
>>> +		xe_devcoredump_snapshot_free(ss);
>>> +	}
>>> -	__xe_devcoredump_read(ss->read.buffer, ss->read.size, coredump);
>>> -	xe_devcoredump_snapshot_free(ss);
>>> +put_pm:
>>> +	xe_pm_runtime_put(xe);
>>>    }
>>>    static void devcoredump_snapshot(struct xe_devcoredump *coredump,
>>> @@ -425,7 +460,7 @@ void xe_print_blob_ascii85(struct drm_printer *p, const char *prefix, char suffi
>>>    	if (offset & 3)
>>>    		drm_printf(p, "Offset not word aligned: %zu", offset);
>>> -	line_buff = kzalloc(DMESG_MAX_LINE_LEN, GFP_KERNEL);
>>> +	line_buff = kzalloc(DMESG_MAX_LINE_LEN, GFP_ATOMIC);
>> Is this related? Or should it be a separate patch?
>>
> It is related. Now that __xe_devcoredump_read is called under
> 'coredump->lock' we are in the path of reclaim, __xe_devcoredump_read
> calls xe_print_blob_ascii85.
>
> Both cases the allocation is relatively small, so would be fairly
> unlikely to fail.
>
> I could make this a seperate prep patch if you think that would be
> better.
Not worth splitting if this is the requirement. But maybe just add a 
comment to the commit message about why it is necessary.

>
>>>    	if (!line_buff) {
>>>    		drm_printf(p, "Failed to allocate line buffer\n");
>>>    		return;
>>> diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
>>> index 1a1d16a96b2d..a174385a6d83 100644
>>> --- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
>>> @@ -66,6 +66,8 @@ struct xe_devcoredump_snapshot {
>>>    	struct {
>>>    		/** @read.size: size of devcoredump in human readable format */
>>>    		ssize_t size;
>>> +		/** @read.chunk_position: position of devcoredump chunk */
>>> +		ssize_t chunk_position;
>>>    		/** @read.buffer: buffer of devcoredump in human readable format */
>>>    		char *buffer;
>>>    	} read;
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_hwconfig.c b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
>>> index af2c817d552c..21403a250834 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_hwconfig.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
>>> @@ -175,7 +175,7 @@ int xe_guc_hwconfig_lookup_u32(struct xe_guc *guc, u32 attribute, u32 *val)
>>>    	if (num_dw == 0)
>>>    		return -EINVAL;
>>> -	hwconfig = kzalloc(size, GFP_KERNEL);
>>> +	hwconfig = kzalloc(size, GFP_ATOMIC);
>> Likewise this?
Hmm, hadn't realised we were doing an alloc/copy/free for every config 
table access. Is that just to avoid doing iosys type reads because the 
table is in LMEM? Seems a lot of overhead for each individual u32 read!

But also why are we doing table reads during core dump -> text printing? 
AFAICT, the only reads are in the steering code for doing EU register 
reads. Don't all the reg reads happen up front and then we stop 
accessing the hardware while doing the chunked dump? If we are 
re-reading hardware state when doing the text conversion we can end up 
with inconsistent dumps as the state changes from one chunk to the next?

John.


>>
> Same as above.
>
> Matt
>
>> John.
>>
>>>    	if (!hwconfig)
>>>    		return -ENOMEM;


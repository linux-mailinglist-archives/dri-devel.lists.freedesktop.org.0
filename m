Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F703B138B0
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jul 2025 12:16:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9AA910E4BA;
	Mon, 28 Jul 2025 10:16:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ENTgGlIG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB5A610E139
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 10:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753697775; x=1785233775;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=P0ZwvNOscpCcJPYrM7wFibZzICLOCc3tWJs6x6kZl6g=;
 b=ENTgGlIG59uAucmT8v1LUu6Cqq2hSwWLrJ8J4w/Al+FnqoWtrKx5N+i7
 fPH7VEPsExMHKlpUpjP0uhoOy8Z3ORxiYQrNrxKOxXN8yFo8QxaDWM70D
 PCXEuUCFs3YsoanJUfwf/F0xPWsNF1zeErMrE4Aa3HyJACggI55g2CNHg
 mAx6D2lHj4is/69lMHPrpup49U9mqxLkhjVnitWH//DMRPhrI70lzqWr0
 70pexH89gFwS5e9NjRCW86n1WuKUkAisBAsu7g+O9jOHdBVr4Z9RnGGxX
 C6WxqEinflAtVFxnDH3u/HBAIDAzovgkOnhRMgUuXU6QlF87H94+zGbaK w==;
X-CSE-ConnectionGUID: KoeL+PWpQgWaORpyXiTSVw==
X-CSE-MsgGUID: kFkPoTMYSjChVd9bhBuyRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="56032173"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="56032173"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 03:16:15 -0700
X-CSE-ConnectionGUID: 8g/SfdDkTvqH1rJ6NGipyA==
X-CSE-MsgGUID: WiNXu5njTUSXiDu+gaLMHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="162091220"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 03:16:14 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 03:16:14 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 28 Jul 2025 03:16:14 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.42)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 03:16:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sOpJghnGOk1OE5/kflNTSO1QIV3ONHykcIpHWPHECY6c7KDGc/8Xq9Oqk4C2klk9h7G1PuUJzdNA3wFvtvj7RI7qUzHENwBkogb2OCjPNqXQo8R+BpEzpyCFwsImnYYyIaedogEaSjs+Eq4DjMY8Ds9ALrsAWINmEOhopv2W86O1+KTF+x8el1EL7Vp9VKtY4TYoArHKKi/RZlFasL7/QXB/lyljCOSOJN8n278yNDydLbILa/+kSezgPbXGEuleDuEmphI0ehp5M4+3aBYHYKIml7Dw8nEF2tUxNEDof3EcnbrZgQl70Wq+x0HKdzeDiOt/TWtyuCq6zIoaLXC+eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6/6uB/9kvXHlYGQj41lmb9dgMXw125QG+bEEknWIMpk=;
 b=wS03XooiG38AHMJKsI5YCeQzjQgtKOG27cmttXjlUAA38v8NMLtEpCl8bNuQ+wE3FO49vJiXJGoL/txS+MWEguwiZZzioZaKvFX/U2iqYDm5rJim/sOf2zGVFh64KSwnayIzZn+S4ojScylLn3Dbfbdbtt1aaYE8l/l3tTjCm5CUUDH4ZDGuVWtb8G3jzRTy/WNi5WYXcMjKKcwZpCNmtgmqxow0bdX0p4U4KppwKWi2HBBRjBZkKVkThJCZ5nLf9ETBAyQ6qkrfVUdsWfZpn4s+5NPo4vFT5CWoTZh1wwDpTPR1J3KHiPd2KoEcTbaLt7xhoSKue6eoLTZn4v2X1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by SJ2PR11MB7517.namprd11.prod.outlook.com (2603:10b6:a03:4cb::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Mon, 28 Jul
 2025 10:16:12 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%7]) with mapi id 15.20.8964.023; Mon, 28 Jul 2025
 10:16:12 +0000
From: Imre Deak <imre.deak@intel.com>
To: <dri-devel@lists.freedesktop.org>
CC: =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Mark Brown <broonie@kernel.org>
Subject: [PATCH 1/3] drm/omap: Pass along the format info from .fb_create() to
 drm_helper_mode_fill_fb_struct()
Date: Mon, 28 Jul 2025 13:16:01 +0300
Message-ID: <20250728101603.243788-2-imre.deak@intel.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250728101603.243788-1-imre.deak@intel.com>
References: <20250728101603.243788-1-imre.deak@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO0P123CA0003.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::11) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|SJ2PR11MB7517:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c992266-42ed-4fe7-3f2a-08ddcdbfc71d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|10070799003|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eVhxY0RucnZDa3FqVWxSYlcvV05VSjVZdUl0RFJ6dTB2dTRjdCtBNVBzWTlL?=
 =?utf-8?B?emlja1VTTTRRdmMxbk5BdHgrOXZmcHlvSy83dDdxUXdRVG1TRlpHcnRNSHpp?=
 =?utf-8?B?bkxwU2ZmanZ4bitIRmxSUTdRVk9vWFRuemw5R2tNZFBlZDRVdElVa2V6V2JQ?=
 =?utf-8?B?VTRNR3pENytJOUhOWGk0ZzQvNk9sZVpjS3VKRkZUYjZJcURkcTJ6dHZ6L1ox?=
 =?utf-8?B?UkVYSy9FcFhORTI1b3JuYnJ6MUkwd25NOUxocThFU3VIVUhUWksrMEJNWmVt?=
 =?utf-8?B?cnJaaDBRTzRGL0VEVGlTYkJwVE1VU29nWTZSdFlVaC9weldLMno4ZG1tanFH?=
 =?utf-8?B?cGVoQldJaUpjOHE4TFc3Tm9tL2hWdVY2MGVjSkV5QmdjWVhFSXYzTFdyemRJ?=
 =?utf-8?B?WlBDUDhYOE4yYVl6WjdmZnF1cXNaNjVEV0RVZ0ZPRGJLeDBZS2h3UjRWNjZE?=
 =?utf-8?B?UmVlZnZlZXltb0RTSTVJb08zZ2MvamZLc29JS1pkYVpiQW1kVWpaSVR5RVly?=
 =?utf-8?B?MEFLWnRFMDZkWEtsdE5hY1RRRUFRcnFNUytsTjVLU0dPMk1RdzZDOXFEYWlD?=
 =?utf-8?B?c2NJakt3cXVqeFM4WWFBOURyajMyVkZSWlFLTnlKTGkvZHQ3aDNlcHNkZTlK?=
 =?utf-8?B?T0F2S3UydTQzQUcvL2VRbnhmbE42U1hqT0pNdGtucDRIdmdvNVJZcUw5ZjBw?=
 =?utf-8?B?YmpPVTlLeVdKSm9jYUVwOE9sMThOcnBoWElKcll2ODd4QmQzSHpmZU1aaFla?=
 =?utf-8?B?VGtjR29Qc1NZZlNEY0M2cnFob0FFN2hHVm1idlZ0RGlmYlR1TU9hRnNHUTFH?=
 =?utf-8?B?YUxPRk5ZcmNpRGNXN0NJN2hMUURabTJCeEF5aThFVjlGcmhKanZhNDhBc1Q2?=
 =?utf-8?B?Mm5ESkw4NzBTYzJmcmFlOGxzdWczWFYyWDZWWmRuSFZ0KzRlVWw2eXQyQ25n?=
 =?utf-8?B?Z3dHcjAyYmJKelNMbzRUTHI2Wms2ZVlCTjViT09JTnNvbEU1TUUrTHJDdGw0?=
 =?utf-8?B?WXNQWGRiTWI3UFAvN2VycEVKSmZXQVdHeE1jU3dLRWcwbUgxb1NVK29NU1dt?=
 =?utf-8?B?VUpvTWZ5bGw3VnVFWGF6N2RWdUNoVGVJSkZZc1JFM21neERpUk1nMTRSaDRH?=
 =?utf-8?B?TjlEdlRyU1VaUTdSMkRzVnFQSnZzYkh5MUIxUVJ2eStkYjROcW82WHhuZlpK?=
 =?utf-8?B?U1VRcjJBQzNidWY5eEJUQmdzbmpPd2s3TE9rWGkzNW5VYlZaT0diZkVQamdt?=
 =?utf-8?B?c0s0ZzFOcTdHYXFEVjlLc2FuZEVzUkNxKytLWkd1OFpZeXBtSHlFb3Vnb0xa?=
 =?utf-8?B?TGYyaHpFaThaWWhscnlpcWdxOUErN1B3bnpMbUp3NXh6UmVRR0UxemtUeWZX?=
 =?utf-8?B?bnhNUWhtZDljRHBMZ3BqT1ZtS3FTKytKcndaeDdTR1NjWFJRVWNKYWhEQlI0?=
 =?utf-8?B?WkpoY2xVNVl3ajdodmtHWUNlR0tKaThQckFBbmpWYlJaTXljRHBySGY0M0Nq?=
 =?utf-8?B?aTdISC8zdUVDOCtObEZPNXpFUkQvNHZhMEdIc0N4TXB4WnNQRy9NOGhVbGJH?=
 =?utf-8?B?enZLZUZlalU0TjAxczVOODFjRW9wN1NGeHVNR2tVZ05ONjlLS29VbzlHSzI5?=
 =?utf-8?B?YVQ0R3BVNkNjdjJwUGtrZTVkeEJMeDh4Y05Jb3JTMXlwODlUT1RCSzF1S1dM?=
 =?utf-8?B?WldPOTZ4L2NvL2NEdG1HNDl1SGpqOWR2dC84c0FkZmtCNmF4RUlENm1rR2JR?=
 =?utf-8?B?V3crcDJQSTFobnFuWTkvV0lIcFg2NW9FL2xjbUV3bE41cm5OckpqUmt3MzZi?=
 =?utf-8?B?eXMzYlVHZzRVUGc4ajN0M3UwM29IWEdsMDhyQU1DK09scGFyeVVEUjZuSDFX?=
 =?utf-8?B?bTBtb21HUE9KWis0UzhZWGNhVVJ5S2dIODFPbEp5QjhTc0c1R0VHc2FQdmR4?=
 =?utf-8?Q?gJ92zC4qcWE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2dmc2NCS3A1bTlqUHVrNUdlRGhucnY3YW9FWWRjNTY5WWxMekxVV3VXQjN6?=
 =?utf-8?B?VFZZTzlrODllL01xTFpOcWpGak9RRHpESDVFNXJZcmVRb3d5WEZ3M3B5RENv?=
 =?utf-8?B?ek1JZ2V6U0xneDBRbW9QZi8zY1lhU2pTVlEzVlR1ejBjSlh4dVMzZ2RrTVVi?=
 =?utf-8?B?QXBaQXBPZFJ5MmRxbm16ZlVpZllERTFiOHVDbkUrMlNPWjNCYmd0TUdXbXhN?=
 =?utf-8?B?Z0JDdTRuZW1mL1hySjhSMFlRb2l1ZEd1Y1lNV21VSXhBa081R3d2WVRzaWJ6?=
 =?utf-8?B?a2IwWDBDMWZyM2lrNUxOSE05WXZPNXBaaEtpVkhVQmJ3ZkkxaUNUNGhJVEIv?=
 =?utf-8?B?WCthQnVkajB4L05BdXhrclVmTFBPTjNIRWF5b0JJV2g3Nm1meUdMZDU2Rlgr?=
 =?utf-8?B?bTJGUUd3QW5kd3J1eUhwL20xRDdJclIxN1pGRXZXeWkybVk5c1g4M29FQWlw?=
 =?utf-8?B?RFY0TitlcU9IcEh1VWlpSGlGTzBkbVJja1NFWGVJc1JQdzZvL1pveDhGVkhN?=
 =?utf-8?B?T2hudndwRUFTeEh3aDBVUWpPZG1teVg0MXBrV0UzWVNZVDc0QTErUEszRk84?=
 =?utf-8?B?cmlBVFVkNXh6OFFQaG56ZUVTY1dBK1l6WjBCbkJqRXh1WldXTHBvemJraERa?=
 =?utf-8?B?Um1WcXZ5VFU4REk5eHBIc1hYRUZPMjk2SzdzKzJKS01OTDZjTmtMU1VCYUsz?=
 =?utf-8?B?WmhVRWVTNU5QT0lob0RlNXQ4RjlUYkRtemFZNmhMNm42ejdQenZUbVBoQzlT?=
 =?utf-8?B?M0RybnpTTmNMTTV6MEs4Qk5ZVTdtM2VEbHlEVXdQcTVuMkloRDF1UWFXdVZh?=
 =?utf-8?B?K2hWZVVJQlNIV2RqVzM1a2RYWDNQV2kveWNMK2VUeEEwRWw2RHRWK3RRM3Vi?=
 =?utf-8?B?ak9jcHBocERta0RGVFVZL2ZEQVNGUXpYcjEwenBxY3l6ODNhZWpNakdDL3Zu?=
 =?utf-8?B?ellDb2twNENnVWpoVSt1aHNyOGNyb0FscmYveHJxdVdwTXlmUjUwcjZRZ0xH?=
 =?utf-8?B?bE9YU0FBd0ZpcmR5RWlLM1FTaU5sK1Bld2xIQUZrRXlUaHN2TzN0L015Y0ZW?=
 =?utf-8?B?R1V1T0RqSGlLVHhCbzZxa1hHUUpicllCRmZCWVBkMURkNUIxQUpNejNldis0?=
 =?utf-8?B?N09sSFZyTFdPdmRPcXNORXByeGNvU0tFYzUxdVF2bmdtL2drdGJzKzVtcFhX?=
 =?utf-8?B?REtUK1dBbjFkZ0JOcVZ1bUhiYWVIcU5SaWhMQXlVMkF6clRoSHBsa2lNUDhZ?=
 =?utf-8?B?V2JKLzRRc1Q0QTRTZHhvNkRJblJPVUdiUjMvVW5xalc2ZDc4Rm9zMFRUV3p0?=
 =?utf-8?B?WEhRM0cyZWdiVTdHTkNrMGpTL053V05VZ2VpajZHVkNGdlMrWVo5eGxsRlBP?=
 =?utf-8?B?QlZjSkcxa1hWZFFRWW9Id1ZSREtnWWF4VjB1d0M3WFA5Nnh3VGpNT2hVNW1C?=
 =?utf-8?B?ZEIycFFpUFdqSlhGZ2czdlBUcFlncURuQnptZ041WVVtMjRwZFFpUERuTEVO?=
 =?utf-8?B?U3ZtNXZaT1lrS1JXU2FIbUpGV0xIYWhISUhiY2pKMGxYM0hHQmh3aXdmV0JJ?=
 =?utf-8?B?L1BoUGMzeG9vVk9QTHNmTXplUldCR2p2SG80L0FFSmc2UldvYWNIQ0poQmd5?=
 =?utf-8?B?VkUzTzFqVXliNVQ3NVdiZktDN0RZek53dzVXczNJNkhlK3JLNzJWdDZyT2Z3?=
 =?utf-8?B?TnA4ZmVxbVdKdFdWMDZqYmw1K2diVlFocE5BQkFwRVZjU0dNWGFFMlN4TFA1?=
 =?utf-8?B?UkVJNjQ1SWpieStnT29xOUZ2eHZnSDBHYkNkZFQwc0h6RTBEWExxTnNWL1dK?=
 =?utf-8?B?NWJTRis4c3k3WkhESHpuaDUwd2p5Wjg1Vk82WmNEWVFRcWNDbFAzazJ3RTha?=
 =?utf-8?B?OVRZWkFkWElNbHlMUFBHQTJHeWNVSTRhWDQ5ZlgrbnNRdElGRzI2Z3c2MXBs?=
 =?utf-8?B?Rk9ibys4Q2RBWUZpVDVPUnVqOGhabHUwN0dYNGdzbnNYN0JSS210MXdOcmo0?=
 =?utf-8?B?eDRPN1MzeDB2MWRnRHFWTU5admlhSWhFd0VLMWtGdndQQmZYQjF4YzgyMDdI?=
 =?utf-8?B?NHFHc3hDS3duNUVjSGlHQThrcnR4QkxsQ3lJRStPclptbFZrU2RsdGpMd0g2?=
 =?utf-8?B?NmlWNllYdTQveDhkSkM0NE9SQlQzTXp3ZlB0WFVNRENQU3A2L21WaVdNa0o1?=
 =?utf-8?Q?pkXjtyaxIvqz2n9bxO7QbP3enI4ELd/DWDUMDwyZzdRf?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c992266-42ed-4fe7-3f2a-08ddcdbfc71d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2025 10:16:12.1082 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MMEz+S6VO/WFhKPlMX/s65QhD/H3nd6BXfUJcu4/p+9GZLNlFJZAJoxwcDsZgEogTJArfHfE5Ac0hlIvytfvxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7517
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

Plumb the format info from .fb_create() all the way to
drm_helper_mode_fill_fb_struct() to avoid the redundant
lookup.

For the fbdev case a manual drm_get_format_info() lookup
is needed.

The patch is based on the driver parts of the patchset at Link:
below, which missed converting the omap driver.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Fixes: 41ab92d35ccd ("drm: Make passing of format info to drm_helper_mode_fill_fb_struct() mandatory")
Reported-by: Mark Brown <broonie@kernel.org>
Closes: https://lore.kernel.org/all/98b3a62c-91ff-4f91-a58b-e1265f84180b@sirena.org.uk
Link: https://lore.kernel.org/all/20250701090722.13645-1-ville.syrjala@linux.intel.com
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/omapdrm/omap_fb.c    | 23 ++++++++++-------------
 drivers/gpu/drm/omapdrm/omap_fb.h    |  2 ++
 drivers/gpu/drm/omapdrm/omap_fbdev.c |  5 ++++-
 3 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_fb.c b/drivers/gpu/drm/omapdrm/omap_fb.c
index 30c81e2e5d6b3..bb3105556f193 100644
--- a/drivers/gpu/drm/omapdrm/omap_fb.c
+++ b/drivers/gpu/drm/omapdrm/omap_fb.c
@@ -351,7 +351,7 @@ struct drm_framebuffer *omap_framebuffer_create(struct drm_device *dev,
 		}
 	}
 
-	fb = omap_framebuffer_init(dev, mode_cmd, bos);
+	fb = omap_framebuffer_init(dev, info, mode_cmd, bos);
 	if (IS_ERR(fb))
 		goto error;
 
@@ -365,9 +365,9 @@ struct drm_framebuffer *omap_framebuffer_create(struct drm_device *dev,
 }
 
 struct drm_framebuffer *omap_framebuffer_init(struct drm_device *dev,
+		const struct drm_format_info *info,
 		const struct drm_mode_fb_cmd2 *mode_cmd, struct drm_gem_object **bos)
 {
-	const struct drm_format_info *format = NULL;
 	struct omap_framebuffer *omap_fb = NULL;
 	struct drm_framebuffer *fb = NULL;
 	unsigned int pitch = mode_cmd->pitches[0];
@@ -377,15 +377,12 @@ struct drm_framebuffer *omap_framebuffer_init(struct drm_device *dev,
 			dev, mode_cmd, mode_cmd->width, mode_cmd->height,
 			(char *)&mode_cmd->pixel_format);
 
-	format = drm_get_format_info(dev, mode_cmd->pixel_format,
-				     mode_cmd->modifier[0]);
-
 	for (i = 0; i < ARRAY_SIZE(formats); i++) {
 		if (formats[i] == mode_cmd->pixel_format)
 			break;
 	}
 
-	if (!format || i == ARRAY_SIZE(formats)) {
+	if (i == ARRAY_SIZE(formats)) {
 		dev_dbg(dev->dev, "unsupported pixel format: %4.4s\n",
 			(char *)&mode_cmd->pixel_format);
 		ret = -EINVAL;
@@ -399,7 +396,7 @@ struct drm_framebuffer *omap_framebuffer_init(struct drm_device *dev,
 	}
 
 	fb = &omap_fb->base;
-	omap_fb->format = format;
+	omap_fb->format = info;
 	mutex_init(&omap_fb->lock);
 
 	/*
@@ -407,23 +404,23 @@ struct drm_framebuffer *omap_framebuffer_init(struct drm_device *dev,
 	 * that the two planes of multiplane formats need the same number of
 	 * bytes per pixel.
 	 */
-	if (format->num_planes == 2 && pitch != mode_cmd->pitches[1]) {
+	if (info->num_planes == 2 && pitch != mode_cmd->pitches[1]) {
 		dev_dbg(dev->dev, "pitches differ between planes 0 and 1\n");
 		ret = -EINVAL;
 		goto fail;
 	}
 
-	if (pitch % format->cpp[0]) {
+	if (pitch % info->cpp[0]) {
 		dev_dbg(dev->dev,
 			"buffer pitch (%u bytes) is not a multiple of pixel size (%u bytes)\n",
-			pitch, format->cpp[0]);
+			pitch, info->cpp[0]);
 		ret = -EINVAL;
 		goto fail;
 	}
 
-	for (i = 0; i < format->num_planes; i++) {
+	for (i = 0; i < info->num_planes; i++) {
 		struct plane *plane = &omap_fb->planes[i];
-		unsigned int vsub = i == 0 ? 1 : format->vsub;
+		unsigned int vsub = i == 0 ? 1 : info->vsub;
 		unsigned int size;
 
 		size = pitch * mode_cmd->height / vsub;
@@ -440,7 +437,7 @@ struct drm_framebuffer *omap_framebuffer_init(struct drm_device *dev,
 		plane->dma_addr  = 0;
 	}
 
-	drm_helper_mode_fill_fb_struct(dev, fb, NULL, mode_cmd);
+	drm_helper_mode_fill_fb_struct(dev, fb, info, mode_cmd);
 
 	ret = drm_framebuffer_init(dev, fb, &omap_framebuffer_funcs);
 	if (ret) {
diff --git a/drivers/gpu/drm/omapdrm/omap_fb.h b/drivers/gpu/drm/omapdrm/omap_fb.h
index 0873f953cf1d1..e6010302a22bd 100644
--- a/drivers/gpu/drm/omapdrm/omap_fb.h
+++ b/drivers/gpu/drm/omapdrm/omap_fb.h
@@ -13,6 +13,7 @@ struct drm_connector;
 struct drm_device;
 struct drm_file;
 struct drm_framebuffer;
+struct drm_format_info;
 struct drm_gem_object;
 struct drm_mode_fb_cmd2;
 struct drm_plane_state;
@@ -23,6 +24,7 @@ struct drm_framebuffer *omap_framebuffer_create(struct drm_device *dev,
 		struct drm_file *file, const struct drm_format_info *info,
 		const struct drm_mode_fb_cmd2 *mode_cmd);
 struct drm_framebuffer *omap_framebuffer_init(struct drm_device *dev,
+		const struct drm_format_info *info,
 		const struct drm_mode_fb_cmd2 *mode_cmd, struct drm_gem_object **bos);
 int omap_framebuffer_pin(struct drm_framebuffer *fb);
 void omap_framebuffer_unpin(struct drm_framebuffer *fb);
diff --git a/drivers/gpu/drm/omapdrm/omap_fbdev.c b/drivers/gpu/drm/omapdrm/omap_fbdev.c
index 7b63968906817..948af7ec1130b 100644
--- a/drivers/gpu/drm/omapdrm/omap_fbdev.c
+++ b/drivers/gpu/drm/omapdrm/omap_fbdev.c
@@ -197,7 +197,10 @@ int omap_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
 		goto fail;
 	}
 
-	fb = omap_framebuffer_init(dev, &mode_cmd, &bo);
+	fb = omap_framebuffer_init(dev,
+				   drm_get_format_info(dev, mode_cmd.pixel_format,
+						       mode_cmd.modifier[0]),
+				   &mode_cmd, &bo);
 	if (IS_ERR(fb)) {
 		dev_err(dev->dev, "failed to allocate fb\n");
 		/* note: if fb creation failed, we can't rely on fb destroy
-- 
2.49.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E64B4A83899
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 07:46:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DEC910E776;
	Thu, 10 Apr 2025 05:46:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IK9DwC/a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CBB210E76E;
 Thu, 10 Apr 2025 05:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744263987; x=1775799987;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uKYF0Ng6heuskqPRZtRVWi1V/+wEfe75v5pEF4lQbqI=;
 b=IK9DwC/a9MfTuHT6ooNOxkJCE9bp+DhvpApGaywCYXvZA8d1X6yGLV7P
 ZJ+aOXYmHkwn2cAEhleiBMJUbj5eR7MJt0438IOSylFNnO4kspPbULPG1
 Vslfp4NoXYlnI3RiUDbIRwYahRbE0q2qJln06jBMU4uJSYSUkwD6yFOfk
 cjD1PFnhwT3bIsrR1HaOSKmpHhgxbhl552UA7q3x2rJPogUl5Q5ugcMi6
 aTOlCOkJnaOKikHlyFArGYTL+vZ+YGsDL+mIItgd0dh55UBpLUw+mMvwK
 FAkv4w2YfaVm9HwbpThMEvs80q/XcUVr+YYECwOncM+l95F7IhQfaxsER A==;
X-CSE-ConnectionGUID: ktmEKWgRSpqJHXYe8QNPtQ==
X-CSE-MsgGUID: sBYznTNwRuOhD6kVNyqVhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="45777083"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="45777083"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 22:46:26 -0700
X-CSE-ConnectionGUID: obaQFLd5RoCDPWiaiFiOSw==
X-CSE-MsgGUID: /t3bdV4vSymdzT6ZPN5rPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="128757722"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 22:46:26 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 9 Apr 2025 22:46:25 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 9 Apr 2025 22:46:25 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 9 Apr 2025 22:46:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cGeP6ZkrRwtlZZpAgtlGtAuVWy7J3Cs0tEEg52oU+vmT6ma0aSATaHjMPZxiwS9LP75J438z8ni0689dlPK7GD6t9z7Xr1DnwMYH8vmHgeadLrDMBuWrP2zoEAAPzguOfk9ZqNqXLsmoFNUpHR7dX4wKMDhAkcsyhy191g1zl4ffC2v+Qhh65EnQJY6hC17jYEPROX6tWtguUQYzwjlKjmOw86DlWdhiym3mFz9f5yciZB/y7GS62A8rd5//n1SNxzrNlcPZsCE/+p4XO4lcD+kcHOIoAMTCu6U0qp5B4Hu+LAnTxJBdVssjU2Kh5n5VtjftBZiucI94QrNHxpm9Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F58g0KHyyE6F4cxL1Fq60p+AlFygJArWDwGsePExjEg=;
 b=iDJStJFO86g6flht0ALl0f+FLUASQ2OOMafd+PnIE3kC+8C3RrUlW2SX3HDiZ2ENT2cWIne/bSJY2fW560sgWBcN2wIlGI9n8WitzwvYUPHw6mRHLGGwZlSlbrII/vbC47mpnmlawxeqMSlnPGUdADsEOKF8QTFMR8gwpp4ELdL4Fy+2ccNLUT8/4MGVUG7ikOwghtyLoA6raydL2t+vBbB4wA9KLTOqY5d0FrkTC0H8PHBFCsL7+PsroNAXMBwXejD6IAKlgTrqZwWi6qeNv/pA18hTezbxEgA56ZQ0fwFXgb/ZgEMIltW4roUgMBn9TbtzFAvqryHR/P0mN5n20g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by LV3PR11MB8458.namprd11.prod.outlook.com (2603:10b6:408:1bb::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Thu, 10 Apr
 2025 05:45:42 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%5]) with mapi id 15.20.8632.021; Thu, 10 Apr 2025
 05:45:41 +0000
Message-ID: <7e599c21-34e6-4c19-9e95-04e0198c4361@intel.com>
Date: Thu, 10 Apr 2025 11:15:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/i915/backlight: Modify condition to use panel
 luminance
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>,
 <dri-devel@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>
CC: <arun.r.murthy@intel.com>
References: <20250408050138.2382452-1-suraj.kandpal@intel.com>
 <20250408050138.2382452-3-suraj.kandpal@intel.com>
 <0e034903-5bbc-435b-8636-ab67f582a536@intel.com>
Content-Language: en-US
In-Reply-To: <0e034903-5bbc-435b-8636-ab67f582a536@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0143.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::13) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|LV3PR11MB8458:EE_
X-MS-Office365-Filtering-Correlation-Id: b5f94313-694a-413c-68de-08dd77f2ee01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cjE5dVlJbm9OT0JWL0djUWhGcmJ1S3RHeTVwRVJYQThLTnRQWEJPV1Fhc1B0?=
 =?utf-8?B?WFo0WG1VVnNsMzlLVEp4ckxKbHBMaW93ZXhsSWx5N0krbEgxOWRXQkcvallE?=
 =?utf-8?B?UWNGd3FTYTE2ZFEvOFE1OW1pTWlxNUVMaDJ5UC9UdTh2eTczTDNqOWRoV0Z1?=
 =?utf-8?B?RExzZkFYWjdVNlhWdlZkYWVWdUFrdFlrZW1ONjBHUWhzUVI0eWVxQk5CY1ZG?=
 =?utf-8?B?M2xvekVSSE9kMWJxUkdCeHNpSnQwUkYzQ0orS01EaVpGOUZNaHp5Q2V3VUcz?=
 =?utf-8?B?UHA5b2pXbGQyemM2bUtwZ01mTzNqQjdOU1JoN0ZVWXJoRk5Zclhsc2ViWEZF?=
 =?utf-8?B?MFMycWk1NkMrSEFucVFqd0lRWlRvWjJMSXdBd0pHSUVkS21RTWc0WGxGdHk3?=
 =?utf-8?B?Rmt5YTRCUWo0aWtKckJjbDM4YlF1aGRydjVHa3lkbGd0U1ovWWQzcjVURWFx?=
 =?utf-8?B?ZG9lY2dObXNnNDlBS0NFaE84QmN2QlRkdkE5WXZZSE9MZitnTmw4OVBCcHdy?=
 =?utf-8?B?UE5RUS9relI2TFIvd2JEQXJDS0padWRrNDZmblFQWi9IRHkxSCt6RGM3RDJj?=
 =?utf-8?B?TW9mSFVncVhIS1dPVlY5TythN09QRTB3U0NxQUNJQlE4eTVxWDczZGdhTkk3?=
 =?utf-8?B?eUtaVjZKa3BJdVJTOGQ0dDJPMkhhTFEyMFFVVFZhQlIzeHkybjRseDJjVmFl?=
 =?utf-8?B?RjY0dDhNdjcwZDZRU0hsdWF0T2tSSkR5UWkvWi9QdmkwRThvcXJVaEJjMjAz?=
 =?utf-8?B?akVuL2JkQm9jQkIvQldxN2RhSWJQYm1vaGZGTVNiQ1R3QWhlbDIyYXJvdG9w?=
 =?utf-8?B?bWlBZTVoV0V2UjFiaG83cTQ2aGR3Z2FXUitsVnRPOGcxeUsxNGpySjZaNUJn?=
 =?utf-8?B?cjg0c2lGL3lJK2kxREI4VURXallEbFgzM00wSmxjNlNhcDFSUG1sNXhMK1NT?=
 =?utf-8?B?YnRXMUpEclJhZERQbWtmVFhTU2pLZXVLb01LbDh1cWVXQ1UybFIxbW5EMlR0?=
 =?utf-8?B?a2pnTWs5emtSZ0xESWFybTJYcUw2czdLTjFDUW0xV1NXblBDY0xNViswZVU5?=
 =?utf-8?B?R0UySlRHN3l0WEQ5MFQ2SVA5QjVCemR1Wms4d3UwVW55UzNnbjdlZU5yYUxj?=
 =?utf-8?B?dElpNFNnWkxYS1RSMy9lSkJrT0NPdXZ2QkxuNXlieFk1cVdZUGVGcFRCSFRS?=
 =?utf-8?B?bmN6UFEwaXEwRG4vM1p2ZnQ3UWlqRURpb1dMWklLRjdONk5RSGtocWE0eC9x?=
 =?utf-8?B?Z0tPWDZuaVR4R0xYOVVrVjRjY1JHTjRCcHdEQ2FZWFZ0UGhNeVNKdmdJdE9h?=
 =?utf-8?B?UWhXOWFSd092cVZqcFZYQkpCZGJLOEg1Ny9lNUhqZC9weDI5QnJkQVc1TmJX?=
 =?utf-8?B?eTJ2WjdHYXkxUnMyMEsxZy9penFVaTd1V240NmtuVFg1WVJqQmtSQ0hEblVp?=
 =?utf-8?B?MGJVZTBvL3crT09iYWJVakNTTTNlWHQ4OFc1ZkpjeUFnbWFkOFRXQ2lSN3Qz?=
 =?utf-8?B?dTF6U0s1SlViZXhvV3RPQ0VVVjlHUWpIeUhRUEFrdlA4NDdXKzZPNXp1c2tm?=
 =?utf-8?B?MHdRMFlkalgwZTBrUnc3TXExU2lXYUJXdkxraERZMkVDc29lL3E3eUpKRHVE?=
 =?utf-8?B?RDVVTk9aSWdNZ3liZmcxSWpqM3NxTE1QTFFibk5EV0s1YzBnUVJycFpqdzdX?=
 =?utf-8?B?RlRBQUU4VmRBQnJJQjh2M1BncWNvQlNhek5IV1pVU1ovZGNKSzRCTVZsL1lZ?=
 =?utf-8?B?WlZ3ZkRucmYyNDdPNFdiampUVTBsbnR6TTY0cTZqQ3VtbEtCK3A2cHBqQVRY?=
 =?utf-8?B?dkhmSE5DeFNVSnU4cEIzY1N6VTY4RFN6d2tYaFJKQzFPL0NEK01vVlh1UGk0?=
 =?utf-8?B?cFJ6UXZkd2NlRGZlL0c3ZHJpWFkvTUVrV1pkU3NSakRlN1E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1UxRVQ5MDd3VG1qWXp2YktWdmJTSUJpdmhSOWg0L2FsbFJRMElnMmgrSThG?=
 =?utf-8?B?elRCT1VBWk1uQlN0anJxRlR1SVRWN216czJYZ1paT3V2K2NmblFFNUh4SDZ2?=
 =?utf-8?B?K0dvcmpNMzNISGNoMkNsMzZ2Q3BST3hMeHJKcXhsa3VkQVBjWkZsMTU0UExH?=
 =?utf-8?B?ZWF5Y3Q2QmhpajJ5UDQzUERkNmNiNTFBSk5UUy9JbFpGTlZGc0VsVTFSTFY3?=
 =?utf-8?B?VFlWSm1tVjBoR1VKZC9jS3VsSXdBaURIVUR0aHFVZXRzM2JCU21PcE5WZ0JU?=
 =?utf-8?B?RDVkSGhzSWFFUnV1WjkraGdleEJvYndTcWp4elpaVEJuRGEyMitTN09SaGM3?=
 =?utf-8?B?dlV6VE5kR3JSeWMvM0tvTUF0eEJYWDhvTGlyUDZPc3RtN0Q4UEZqZ3NjdG8y?=
 =?utf-8?B?TXNDR1ZheXlEMEdsS3dOdFVoOXBTU1RUOUdXcE9raWVES0FEMk51dmJoemxU?=
 =?utf-8?B?Y2xEY3lRYkhNc3lyWklaMVZLVDdLZTVrOUliS05NMTBoUWtKbmMvQ1p2dGdS?=
 =?utf-8?B?MFJvV2M5bEdVQzd4YnVHOHo5N2tDRWxwcVBwck5FTDdCVURqNHVvYmkxODZm?=
 =?utf-8?B?SW8vekpoQ0gweVNiQUNkNkg3cWFIZ09ZbEpvWlVZdWQyZ1JSMldTK1JWcGxi?=
 =?utf-8?B?bHlIMnc1YmwxYWROM1lxRlN1cWxZclMzVnBTTmE1U1Nsa2c0T2pLdFJKZGNr?=
 =?utf-8?B?WTViSlc3MXord2FFeUdOYmpoL0VvLzRiMCsrSXRLTGdBaUJVdDVQZmJpSnJu?=
 =?utf-8?B?SVB4R2ZWMnBxRGREQTVzMnY0MEsyaFl6dVRjSGNtd05pYUlNS3FDYjI4SUpJ?=
 =?utf-8?B?NElZanQ4am91dTU0MU9mTldmQ0k5OGJCclJmMkZEOVhmdGVqc2JITXRyQTVN?=
 =?utf-8?B?YUpxeGFMcXhqeTY5TC84c3gwVWFWOVVnVjJQQU1LNnJ6bGtMSXBZcXdXRzVa?=
 =?utf-8?B?TXc5K3ZuZnBtdTNRaE95Zm84czZobXJPTjZXK1NmdnIxRHJwZzFndUtUZCta?=
 =?utf-8?B?NHlwTk5DTTNCWktwREk4LzlsN2pLcVR5VTlMNHd0R1JEcFk5QzBCeGxxTDNp?=
 =?utf-8?B?V1ZjRHBBaHBzZXphZWFWTFRLTmVxeEhlSDhwaGkveEQ3QThhQzI3a3lLWGpk?=
 =?utf-8?B?QVF5cDBEMUhlc2g1dUJQOTZlRGhtOEtEMkI4aG45dkMwcmJGWWtlZEZzUkoz?=
 =?utf-8?B?RGNBMFlWVjlDVGxKeC95M0hHZDkzNkN0UEtEbzlVYUtsQmpacGlBRWpBa28v?=
 =?utf-8?B?RndSTjk0ZkhBcWtUbnNndlpicy9Rb3lZc01Bek1LVlhLTnBHeWdIaHJDK0dx?=
 =?utf-8?B?VzRsZnoySHFCREVpUVpSb0JqMlo4NC9ydFEyTys0NDhDYWpIQUNQVURJZnVN?=
 =?utf-8?B?VGxsWlI3cGpIWUtiQlZYcWE2WDdzUWZXUy8zb1orNU1zS2k2RXVuTUp0Qlor?=
 =?utf-8?B?cElFS09wTEgrZHh1eFp4UUw5c1ZrQnlKMU5WNmJGMmQ2S1Q3WUtkckRLYVBw?=
 =?utf-8?B?VjZSRXZ0ZXlXRXgyV2JNSGVFY1FsbXpZSUxuZnd1bWdxRDVZS2NuUVgzQllK?=
 =?utf-8?B?MVRhdjVuRjRCNG1BbmVld0NhbVd1YlQvNmpJMFdwWElUclo0NmhkaG5WU2Q4?=
 =?utf-8?B?dnZMc3hYVG9EZldEVytKQjJHaHRWcjNQa2NVNmwxY3VJVU9MNVhSL1RGZkNh?=
 =?utf-8?B?aEZJakZNZUQyTk9VdjI4d29jSllETjRzUHQ5Wm5GdGo1TzhNWjF3SC9TeUc1?=
 =?utf-8?B?SnFkZWE1MjBQV2E3aktQcXJkdW9Od2tBclB2bWdLNWU2RTdmQzN3TGdyWTVR?=
 =?utf-8?B?aVdQKzFMcG5NaktOV0pDZ1p2VmRnNVkxckxsSzJ5Q1lrRFBEeGk2amd1NzRB?=
 =?utf-8?B?ZDNDcE94UlpnRDF4bnk1RzFaS2dsd1RSUTkreTJSTFk5V1dBbVNxRXZrM0NP?=
 =?utf-8?B?VmhCcFpRYnJWdUdXUmNSbmJ2eGtQYll4Z0NvWXZRVEh1NzlZK09kUHlDeXBa?=
 =?utf-8?B?U1M0M0N4c1NnODROSWxCYXNUYml0SFNwQ3UrUkFRaGRWVVpidjBVZ1VwV2Fl?=
 =?utf-8?B?dFBDUmY5b1RhNkZvRWJUYjNCRDdMNmxMOTA3S1I2VEtaQW9zWkVNdDM5R0lt?=
 =?utf-8?B?bFJjWmlzMHJueFBDWWdhNG11aWdjR0tLanY2enZ0dlhodmxSR2hmSytuSzE0?=
 =?utf-8?B?T0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b5f94313-694a-413c-68de-08dd77f2ee01
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 05:45:41.8660 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gwr11mUwto707JtdskVGtTXV5dnDUTblaZKw7FGepkuR8gOZxbIx5JA3c/VcOzMP+PgGYBY9Y/lOUVrPzjUi82tU27EmZWmY7ap2c3lRyMA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8458
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


On 4/10/2025 11:11 AM, Nautiyal, Ankit K wrote:
>
> On 4/8/2025 10:31 AM, Suraj Kandpal wrote:
>> According to our internal spec we need to now check if both
>> panel luminance and smooth brightness are available in panel for
>> us to be able to change brightness using luminance value.
>
> Since DP_EDP_SMOOTH_BRIGHTNESS_CAPABLE is introduced in eDP2.0 and
>
> DP_EDP_PANEL_LUMINANCE_CONTROL_CAPABLE was introduced in eDP1.5
>
> is it like that we intended this for eDP2.0 only and not for eDP1.5 
> panels?
>
> This will perhaps change the behavior for existing eDP1.5 panel. Do we 
> need to add a fix me?


I meant fixes tag.

Regards,
Ankit

>
> Regards,
>
> Ankit
>
>>
>> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
>> ---
>>   drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c 
>> b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
>> index 8173de8aec63..20ab90acb351 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
>> @@ -663,7 +663,8 @@ intel_dp_aux_supports_vesa_backlight(struct 
>> intel_connector *connector)
>>       struct intel_dp *intel_dp = intel_attached_dp(connector);
>>       struct intel_panel *panel = &connector->panel;
>>   -    if ((intel_dp->edp_dpcd[3] & 
>> DP_EDP_PANEL_LUMINANCE_CONTROL_CAPABLE)) {
>> +    if ((intel_dp->edp_dpcd[3] & 
>> DP_EDP_PANEL_LUMINANCE_CONTROL_CAPABLE) &&
>> +        (intel_dp->edp_dpcd[3] & DP_EDP_SMOOTH_BRIGHTNESS_CAPABLE)) {
>>           drm_dbg_kms(display->drm,
>>                   "[CONNECTOR:%d:%s] AUX Luminance Based Backlight 
>> Control Supported!\n",
>>                   connector->base.base.id, connector->base.name);

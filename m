Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B05EDA9A85F
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 11:40:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0940510E78D;
	Thu, 24 Apr 2025 09:40:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AWiUeKk/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5D8F10E278;
 Thu, 24 Apr 2025 09:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745487626; x=1777023626;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=sOvC78kh9CLb4uBtRKpkYGeaYZAQjNAFBGNQGdA8urw=;
 b=AWiUeKk/ROSDG4dmBflGhC3fgnbFbT1//yfwqIMyml/Gdf2NT9UhGUkQ
 SP2QnQTpHisZ+3Zl3lv5YzqECWaEOk3RYwbwQM8v/sszsvL0Eck7CnV8E
 2NdO2amNJIpUUWFfXeiKa7euey61bIQZbJx7EaFdTs0oGlMNjE/US4ugr
 99e9EeiC38YZPdWYvcoNrn/To6SUyvAaC+uY0yqLdur6EdlbsMid5ZROz
 mmP6mZlUO8ULQqDUx+PYOQDIhgcFHJSGiP64Fw+rmQFRStfTWjwrBWFeX
 +5bdU6yRgjVRSolPEe63n4XAdAPrr0SpBvj9tJ9jvNADCk61wnCDLkN6c g==;
X-CSE-ConnectionGUID: 3wZtGs9cSUuA3N0ynnWsgA==
X-CSE-MsgGUID: e00IQBaESk2dE7T3nxUfdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="47237282"
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; d="scan'208";a="47237282"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 02:40:22 -0700
X-CSE-ConnectionGUID: 2PvhRCFzR0yZ8ZwRc99ZwQ==
X-CSE-MsgGUID: UNEgdGOATJa7sx/GtOMtTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; d="scan'208";a="136649646"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 02:40:17 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 24 Apr 2025 02:40:17 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 24 Apr 2025 02:40:17 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 24 Apr 2025 02:40:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mid2Vc76p+/FS49vJddUSNy2zI5sLykkcC3EHTgppw+LhJoEYv3+mMjt6LPS2AH1NyKin3d5kVk9h3ksloOCB4FFvN/L1V2vff2lYZAQJhuvLplUgdt3US75N4OanOxAdZYiYKnwzw/KmolnwORlCn1yKAsMTy78HYDK2H1DAQ71GpehMgQRuzOL1MPV0z4fCuKOkQIpPQc+AKF1GR+LuehOijEQLxSeYW6BRgzpHhd6RntbSCYwLo8vHJIhhvglwWxiwelJ6O2MojQ7iMh97n3ipy2AemxCExz7ti9GsK/W3EvZdey8XBAJRLK8PTPf9xacO5iPZUuXWXVklcQ+Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sOvC78kh9CLb4uBtRKpkYGeaYZAQjNAFBGNQGdA8urw=;
 b=xnr/KyID/aksmtl2IhJ+vsRSdgjCo5Xh+hAnLcnCJdhQXpAmH9rcOqHMX0PFcGGybLtGkVE0KAhyNBrLlCJ2JzWlF0LrFWEDRS/kwdcWRJ1D8yQ37182ib2ls+NmbuQhfMPOiJY8Wr1zaGjKc6MfhRiAXyn3lomve18S8l0GKmZphWX4+WePj3DF20JY2DuhMyhqNE5fL9EsI1YLFYfTYi3KVsDnMfcJZAvEY24MKYhQqkXn86/axcA/P4MuuvFyGwHOEJ804Bid+0Jp+gS/LRcOA1UmcC0l1Swvnj+hbIVuv7Ko4p+/qRvC6fV/iDYMWq8+y/Fv3CVDMkbC7y3rpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7777.namprd11.prod.outlook.com (2603:10b6:930:71::14)
 by SA3PR11MB8119.namprd11.prod.outlook.com (2603:10b6:806:2f2::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Thu, 24 Apr
 2025 09:40:15 +0000
Received: from CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::60a1:eab8:65ee:6bb8]) by CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::60a1:eab8:65ee:6bb8%4]) with mapi id 15.20.8655.033; Thu, 24 Apr 2025
 09:40:15 +0000
From: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "Deak, Imre" <imre.deak@intel.com>
Subject: Re: [PATCH v6 1/2] drm/display/dp: Export fn to calculate link symbol
 cycles
Thread-Topic: [PATCH v6 1/2] drm/display/dp: Export fn to calculate link
 symbol cycles
Thread-Index: AQHbtPQS3/LmlAcADU+iA8AU3apYxLOyj9mA
Date: Thu, 24 Apr 2025 09:40:14 +0000
Message-ID: <d441c161e65a4e028abce954298ad5a680c1c70e.camel@intel.com>
References: <20250424-hblank-v6-0-3d10442d9a31@intel.com>
 <20250424-hblank-v6-1-3d10442d9a31@intel.com>
In-Reply-To: <20250424-hblank-v6-1-3d10442d9a31@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7777:EE_|SA3PR11MB8119:EE_
x-ms-office365-filtering-correlation-id: a63fd691-423b-4016-55a0-08dd83140438
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?UHFVWGIzRlNmSXFpOFI2L0FrdWNNMXBKWkhhcUdZZjFDVUhQMzVKNkNvTkFr?=
 =?utf-8?B?NWJUNEM5TlBsS0p0Q1pKanRzd3p6cXBNci8wZEtVWHhSSXJ4ZEFsRXEzYm9O?=
 =?utf-8?B?T3dlREFWWHhUT0JGQzJFajZwcnozVVg1dlVzaFFnVFh5L2tUQlBrTlozVWJq?=
 =?utf-8?B?MnVCNFM5Nlh2anZDR2RqR0czYXY3cW5jcjAwRVJPNm1yaHJEejZyVG95bG93?=
 =?utf-8?B?cEh2bkx1NWtiK2V4akhYOXlSZFIvSGpBc05vMDlaK0ZQMVhYeGpnS2tlM0pn?=
 =?utf-8?B?SnJWeHU5NTdHRG9xU0RNYlVkK240ekliYWlvZHBKb1A3NDhJd01LMldJZFhk?=
 =?utf-8?B?ZFhrSHdPQlRyWmE5b0doOWY3RVFEZzJwVjNwNVFEbjExWVg1a2xxcXp0dGZz?=
 =?utf-8?B?YVIvakJORTV3Mi8wTGpDZEZac3lLQ21oR1MvR3o1QUF2bFBtSHBNYXlwVHEv?=
 =?utf-8?B?dWpuNVN5bFhzeUt5MWJWWEtEODJOdU11dm1Ha2hCb0t6cHdTeVV5US9EbzZq?=
 =?utf-8?B?cDNzTmpXWUxoS1h5NUJCcmVRcVNqM3pVZ1M5Rm1HcGs4UlNNRHN3RjB3QUJR?=
 =?utf-8?B?dk1XdUFUbmVUSG8vLzM4M0ZON1RmNGs3dlQwZE5pa096ZXM2TnREVXkzWWhz?=
 =?utf-8?B?SnRCSVJNR0JhNm1KaC84blhvMkZvTllSMUdJcGlBWDhQN3Rta0pUQkVRUVAy?=
 =?utf-8?B?ZStOcnF0Z3NvdVA1L2xNZFZ6akRTL1VYckMrL09kMWcxVjBnY2Z1Z0lwWkNl?=
 =?utf-8?B?S3dsRWpzWmtkUVRqTWZIM3Buci9PcFJtbUtRWUd3aE1uNS9qKzhVUjFielhs?=
 =?utf-8?B?OG1yL05Lb1BRM05La2VGZXk2UzdLNDJiWWVwWDdNWG5PdktZNElUaE1oR2xV?=
 =?utf-8?B?VkpkajNWeEdGVEVWMnMzVTczeUZUZDRvb0JacEMzZUQydFFMbHpsZEFaTlB3?=
 =?utf-8?B?WVJTQ2d1TDV0c0VIcTdqZ2FXWmtHWS9MYzl2WkFRTVV6a1ErNnowNTMyaFVW?=
 =?utf-8?B?dkpBUit4YjN6Q3pKemJybmtTYUJNVkUzQU9IOW03YXVTOHJaNFM5bDQ5eWpC?=
 =?utf-8?B?N1BUeUFUYWkveXJlcTdtL1A2UmxwSHRmdDM4aWExZzR6SmU5U2VyNFJYRFZl?=
 =?utf-8?B?VUpiL0NnaDdGcG80S2NjaWVxb1JvMnpjRkdBeHhLd2duN3BON2tYVkZuUmxy?=
 =?utf-8?B?NmhoRGdlaTYzKzRXL3ZocGFkLzFwcS80VktNRlUvZGVuSWZFMFB1aU90U1BB?=
 =?utf-8?B?YS9wTTVXVVpZWEtFeXA1VmVRMXA4Y3hFbkJxRmNhMThRMlhPamVLL2x2VnBa?=
 =?utf-8?B?ekNuMjZnc2hsNnRCZjM3VzR0MGJLZ05qR2FNc0tjSHIrMWZxaVlpVUcyQVda?=
 =?utf-8?B?bDZxMnpkMmhmaDhmeHJTakxReDNiQ3BDYy9VYmhSb1BQcUZ0ZGg0TGZleGw2?=
 =?utf-8?B?bFc1Y1lUYW1paDRqN1ZVVVJJckpNUlNWa214eTI2UkNhZDMrQ0FkQlp2RWlv?=
 =?utf-8?B?VHVrY3lXTlJ0TzJtbVJFalVzOSttcmt2KysvaFVaeVNWNHp5NEVZQWJBN1cv?=
 =?utf-8?B?S3pYUHhqdG9sRjNuSjFyZnlPQXgwb2N0emVQNGRoYTQ3UTlYZFlrRm5RVHRG?=
 =?utf-8?B?ekpuRS96YUZPYWtRMk03NHZDNDdZRHRmcE9JOFpJbm9FUVlKczdJWEliWkJJ?=
 =?utf-8?B?ejI5aHVKYjJJNy9FWHNubEZSTVVTVXhvWWtOSjAzR0xKTFBiSmpYVEFka0Fv?=
 =?utf-8?B?S2c4RUt0a0FjVTlIcHBNR09MT2RnQWpwYW9oL2JIL3lZMWRQaGczcCtHdVhp?=
 =?utf-8?B?Z0cyZEtJendTekJ2d05id0prNlVpZFZxKy92TjE5TXc3algxR0VkNmhOTXdZ?=
 =?utf-8?B?YjY0WWhMcTZkU1FGZjBOcDVhWTBsazhmdThxSEhXYzIrTm9OUnA4bm9RMDQ1?=
 =?utf-8?B?S2tpOUdaK25EdHZHZFNXVFJVZ21WN2RmQzMwbm8ydjYyNXpReGk2QnJsS0FI?=
 =?utf-8?Q?o55XyovFYJ8j6XeXD2yUfstmrn+zXs=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7777.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dyt0YjNTc2lQNGF5UnN2THo5b0JvZHpwakRzaUQ4UUk4TUdkcGxvMnhXbEg0?=
 =?utf-8?B?Vlc1cmMzYUZ4ekZrelFRWkhQQW1uWDFuOUJMWFBKQTR0clgrVFFkZE1pSzlH?=
 =?utf-8?B?SzZMeE1SeUNaU21iYjFmSGppaVAzSnBGemxOcVJxYmI1SW5pZnM4cm91MDA3?=
 =?utf-8?B?emJRU3l3ODNoY3ZuOFpaU3FRL0Rqc1h1V21iZ0YyYnhSRjRKdDY5RjUvMlBX?=
 =?utf-8?B?dUVveWRJQy8zbGJJTktJbUI4RFJYc09LYlNWa2JRNWtsem1xRmUrM0lLNGZF?=
 =?utf-8?B?bFRTMVJkYUh0dlBnQlN6cGw0OE13RXM4WnNPSnhDeVMrWFBCMkZEcGx5SnZ1?=
 =?utf-8?B?RTFZRnJtTlJlY3BRS2x4QzJoekxjalVFdmxPS0sxZzJXblRCeWFJNzJjUXJC?=
 =?utf-8?B?ZjJ6NzcwdHRSb1JzaUdvZnhhWmR1Y2hBbGxnT3dqTDVqL1A5eG14MkU5QWZU?=
 =?utf-8?B?WjIrTXRXMndjRlB5YVFHTGlaN2xLM2pkOCtZQUNkU1lCU29BaGxqWURrUEVK?=
 =?utf-8?B?TmxNQVJBN2kwZ09mWjU0RDVGSWUrRVh1aU1oTGV0Z2xDVVFyUUZSZUVPNXpx?=
 =?utf-8?B?RHgrTmZJa3oxSUlFRzlCOFJaSTNqZ1A2S2F3b1MvM3VDaElKdXJLb1lZQTMr?=
 =?utf-8?B?YmptZUlrQURFU3hvb2dtRCt2Q0IyVi9XSjI0c0VSMmhFQkRDb1JlRXlDdFdV?=
 =?utf-8?B?QVVTMDlPSTljTUkrTzhZN0VFWXpvYkhwaDBkaFc0eTF2TU12d2MvNFlTTGxq?=
 =?utf-8?B?SWZCNU1MeUUyOFpGOWwvWjZVWEoreW5iMTBlbTFscCtRL1hVRDUyZ1U1UklY?=
 =?utf-8?B?V3JQK3d6WUo0cHo5SVRKaTN1Zjd3Ni9JMjBFdmxuMHZNeThXdlFvZXNVM1Jt?=
 =?utf-8?B?M0Jaa3I2NStyUy9YTm9pQzhoUWN1dHBDTjNCcTloeDQrYzFNVG5kMzJuOW9Y?=
 =?utf-8?B?UWx1amM4NGwwcXhTWlRnNjJydWZ4ZUcxZnEySms1K3gyRW10NGg3QTR3YndI?=
 =?utf-8?B?ak1UbFI4MEZyTzh4WmtoS2sycE1pbitvZVA5WVRxMEVRaGl5NE5nSTdwckkw?=
 =?utf-8?B?a2FiWUlMN3JjdjBIVlAwcjRyd0QrZlJucUlnYTc2UXl6UDlra1FpVGlvY1RW?=
 =?utf-8?B?V0l4ZXpycDNvUCtDMUFNNVFJekZKa2NRY2ZBZXoyMnpRQm1UV0tVc0JxcHRQ?=
 =?utf-8?B?OE1FYjlURC8yQjA4bmFXSTFqVVZjSGJFQXNQM1R1UXpoKzhCaWpyMGZFU0g5?=
 =?utf-8?B?WWMydFNMZ3NFaG9GR3M0QkpKb0dFSlZYWnFkYXQwSzhySWpHazZpQ1VTNmg0?=
 =?utf-8?B?bFc4YU5CZGpsc0JJK29mSWhONHB3REtPaUhiL2E3UDVCWkpoOXl4OXJsYWF4?=
 =?utf-8?B?Zm1FajhuNTBMK0Y1Tkt5NUpXQTJDQzlrVUt5YlZvVUtWTXoxME1HLytlbzFZ?=
 =?utf-8?B?K1BxYmJ2YWhBcFhUaDlnL2lraE12Y21yTDN1c2tYUFpBUVJTdDJBbU90K1dj?=
 =?utf-8?B?NG12bC9kTkdsb2FEYXo4OWdwUHY5OW5OUWpFUkJMZHRoZ3B5VTkyVXFxMGlY?=
 =?utf-8?B?amxlVnFiR3NQQ09iQ0d3YURESXg4dVpGY0dFQjA1cERxVklIU0FBUW80OXV1?=
 =?utf-8?B?Mi93UmtTQjdhRkRvbFo4TzgyZ1hvbXpKbzhIYmJjaE9yVGJCOGNHYWZsZm9B?=
 =?utf-8?B?M3d5a0NJS2E2aVJ2dFBXNXlSUDFqLy9mMWtMSTZCSlIxOFJmaFhlQjFnK0JG?=
 =?utf-8?B?cUtvQTJ2Tkg2M2FjVEdvSzQ4andmUHUwejVjcXJBb1g3dlVlaURYSERNSnVR?=
 =?utf-8?B?bE80SGR2cXBaTW1YNmkxSG9PYnZyU0RLbzVHS2kvNmlvL2svbUxKMzQvUXQy?=
 =?utf-8?B?UGdZMUFGbS9pdkRGY0FOSnYrbVlPUWpOWHJqK1VpMkVlSThYWHZ4MXFoM2JR?=
 =?utf-8?B?clJ3TEhZQnh6SWJQRmNkWEJnRXM0QUNEZWtuVW1TcmF3TXJtZlIrdVQxTS90?=
 =?utf-8?B?aDI0am9NMlZWTHN3dW9QYlBrRnB6N2s2ZksreEdBZ3BxZHZoeFNhVEtqTlFn?=
 =?utf-8?B?Y0MzMkU5OXFERWJ6Vm5aeEl2L2RWVnlURWJWVnhnam5tVXdKWVZiL2dYWk1a?=
 =?utf-8?B?eXJhc21vdUZZaU1Ra2tuQ1hsYlBJbDNtNnhCWXJBTG1EY3I2WUVQc2lzSG1h?=
 =?utf-8?Q?wKJeHIg+vPiKdJ7rM9TSPv4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3000FBE15FB6BF4EAD675960567E79C6@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7777.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a63fd691-423b-4016-55a0-08dd83140438
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2025 09:40:14.9801 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D2cHM9zlMgyZdRlU3TcJeP+W34JSHcdJeJ5Qb12RiHtFX7n5xyE+V8J641jom8aDdUq6cK3gBm7y298zuM8MxjlX34WhixgJnnhYhkbQwCs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8119
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

SGksDQoNCg0KT24gVGh1LCAyMDI1LTA0LTI0IGF0IDEzOjUyICswNTMwLCBBcnVuIFIgTXVydGh5
IHdyb3RlOg0KPiBVbmlmeSB0aGUgZnVuY3Rpb24gdG8gY2FsY3VsYXRlIHRoZSBsaW5rIHN5bWJv
bCBjeWNsZXMgZm9yIGJvdGggZHNjIGFuZA0KPiBub24tZHNjIGNhc2UgYW5kIGV4cG9ydCB0aGUg
ZnVuY3Rpb24gc28gdGhhdCBpdCBjYW4gYmUgdXNlZCBpbiB0aGUNCj4gcmVzcGVjdGl2ZSBwbGF0
Zm9ybSBkaXNwbGF5IGRyaXZlcnMgZm9yIG90aGVyIGNhbGN1bGF0aW9ucy4NCj4gDQo+IHYyOiB1
bmlmeSB0aGUgZm4gZm9yIGJvdGggZHNjIGFuZCBub24tZHNjIGNhc2UgKEltcmUpDQo+IHYzOiBy
ZW5hbWUgZHJtX2RwX2xpbmtfc3ltYm9sX2N5Y2xlcyB0byBkcm1fZHBfbGlua19kYXRhX3N5bWJv
bF9jeWNsZXMNCj4gwqDCoMKgIHJldGFpbiBzbGljZV9lb2NfY3ljbGVzIGFzIGlzIChJbXJlKQ0K
PiB2NDogRXhwb3NlIG9ubHkgZHJtX2RwX2xpbmtfc3ltYm9sX2N5Y2xlcygpIChJbXJlKQ0KPiAN
Cj4gUmV2aWV3ZWQtYnk6IEltcmUgRGVhayA8aW1yZS5kZWFrQGludGVsLmNvbT4NCj4gU2lnbmVk
LW9mZi1ieTogQXJ1biBSIE11cnRoeSA8YXJ1bi5yLm11cnRoeUBpbnRlbC5jb20+DQo+IC0tLQ0K
PiDCoGRyaXZlcnMvZ3B1L2RybS9kaXNwbGF5L2RybV9kcF9oZWxwZXIuYyB8IDUzICsrKysrKysr
KysrKysrKysrKysrKy0tLS0tLS0tLS0tLQ0KPiDCoGluY2x1ZGUvZHJtL2Rpc3BsYXkvZHJtX2Rw
X2hlbHBlci5owqDCoMKgwqAgfMKgIDIgKysNCj4gwqAyIGZpbGVzIGNoYW5nZWQsIDM2IGluc2Vy
dGlvbnMoKyksIDE5IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9kaXNwbGF5L2RybV9kcF9oZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9kaXNwbGF5L2Ry
bV9kcF9oZWxwZXIuYw0KPiBpbmRleCA1NzgyOGYyYjdiNWEwNTgyY2E0YTZmMmE5YmUyZDU5MDlm
ZThhZDI0Li42YjQ1MWM5MDUzYTc3ZTNlMzg4OWFlNGNlZjY0Y2FhZjk0MjI0N2M4IDEwMDY0NA0K
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZGlzcGxheS9kcm1fZHBfaGVscGVyLmMNCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2Rpc3BsYXkvZHJtX2RwX2hlbHBlci5jDQo+IEBAIC00MzkzLDggKzQz
OTMsOSBAQCBFWFBPUlRfU1lNQk9MKGRybV9wYW5lbF9kcF9hdXhfYmFja2xpZ2h0KTsNCj4gwqAj
ZW5kaWYNCj4gwqANCj4gwqAvKiBTZWUgRFAgU3RhbmRhcmQgdjIuMSAyLjYuNC40LjEuMSwgMi44
LjQuNCwgMi44LjcgKi8NCj4gLXN0YXRpYyBpbnQgZHJtX2RwX2xpbmtfc3ltYm9sX2N5Y2xlcyhp
bnQgbGFuZV9jb3VudCwgaW50IHBpeGVscywgaW50IGJwcF94MTYsDQo+IC0JCQkJwqDCoMKgwqAg
aW50IHN5bWJvbF9zaXplLCBib29sIGlzX21zdCkNCj4gK3N0YXRpYyBpbnQgZHJtX2RwX2xpbmtf
ZGF0YV9zeW1ib2xfY3ljbGVzKGludCBsYW5lX2NvdW50LCBpbnQgcGl4ZWxzLA0KPiArCQkJCQnC
oCBpbnQgYnBwX3gxNiwgaW50IHN5bWJvbF9zaXplLA0KPiArCQkJCQnCoCBib29sIGlzX21zdCkN
Cj4gwqB7DQo+IMKgCWludCBjeWNsZXMgPSBESVZfUk9VTkRfVVAocGl4ZWxzICogYnBwX3gxNiwg
MTYgKiBzeW1ib2xfc2l6ZSAqIGxhbmVfY291bnQpOw0KPiDCoAlpbnQgYWxpZ24gPSBpc19tc3Qg
PyA0IC8gbGFuZV9jb3VudCA6IDE7DQo+IEBAIC00NDAyLDIyICs0NDAzLDQxIEBAIHN0YXRpYyBp
bnQgZHJtX2RwX2xpbmtfc3ltYm9sX2N5Y2xlcyhpbnQgbGFuZV9jb3VudCwgaW50IHBpeGVscywg
aW50DQo+IGJwcF94MTYsDQo+IMKgCXJldHVybiBBTElHTihjeWNsZXMsIGFsaWduKTsNCj4gwqB9
DQo+IMKgDQo+IC1zdGF0aWMgaW50IGRybV9kcF9saW5rX2RzY19zeW1ib2xfY3ljbGVzKGludCBs
YW5lX2NvdW50LCBpbnQgcGl4ZWxzLCBpbnQgc2xpY2VfY291bnQsDQo+IC0JCQkJCSBpbnQgYnBw
X3gxNiwgaW50IHN5bWJvbF9zaXplLCBib29sIGlzX21zdCkNCj4gKy8qKg0KPiArICogZHJtX2Rw
X2xpbmtfc3ltYm9sX2N5Y2xlcyAtIGNhbGN1bGF0ZSB0aGUgbGluayBzeW1ib2wgY291bnQgd2l0
aC93aXRob3V0IGRzYw0KPiArICogQGxhbmVfY291bnQ6IERQIGxpbmsgbGFuZSBjb3VudA0KPiAr
ICogQHBpeGVsczogbnVtYmVyIG9mIHBpeGVscyBpbiBhIHNjYW5saW5lDQo+ICsgKiBAZHNjX3Ns
aWNlX2NvdW50OiBudW1iZXIgb2Ygc2xpY2VzIGZvciBEU0Mgb3IgJzAnIGZvciBub24tRFNDDQo+
ICsgKiBAYnBwX3gxNjogYml0cyBwZXIgcGl4ZWwgaW4gLjQgYmluYXJ5IGZpeGVkIGZvcm1hdA0K
PiArICogQHN5bWJvbF9zaXplOiBEUCBzeW1ib2wgc2l6ZQ0KPiArICogQGlzX21zdDogJXRydWUg
Zm9yIE1TVCBhbmQgJWZhbHNlIGZvciBTU1QNCj4gKyAqDQo+ICsgKiBDYWxjdWxhdGUgdGhlIGxp
bmsgc3ltYm9sIGN5Y2xlcyBmb3IgYm90aCBEU0MgKEBkc2Nfc2xpY2VfY291bnQgIT0wKSBhbmQN
Cj4gKyAqIG5vbi1EU0MgY2FzZSAoQGRzY19zbGljZV9jb3VudCA9PSAwKSBhbmQgcmV0dXJuIHRo
ZSBjb3VudC4NCj4gKyAqLw0KPiAraW50IGRybV9kcF9saW5rX3N5bWJvbF9jeWNsZXMoaW50IGxh
bmVfY291bnQsIGludCBwaXhlbHMsIGludCBkc2Nfc2xpY2VfY291bnQsDQo+ICsJCQnCoMKgwqDC
oMKgIGludCBicHBfeDE2LCBpbnQgc3ltYm9sX3NpemUsIGJvb2wgaXNfbXN0KQ0KPiDCoHsNCj4g
LQlpbnQgc2xpY2VfcGl4ZWxzID0gRElWX1JPVU5EX1VQKHBpeGVscywgc2xpY2VfY291bnQpOw0K
PiAtCWludCBzbGljZV9kYXRhX2N5Y2xlcyA9IGRybV9kcF9saW5rX3N5bWJvbF9jeWNsZXMobGFu
ZV9jb3VudCwgc2xpY2VfcGl4ZWxzLA0KPiAtCQkJCQkJCcKgIGJwcF94MTYsIHN5bWJvbF9zaXpl
LCBpc19tc3QpOw0KPiAtCWludCBzbGljZV9lb2NfY3ljbGVzID0gaXNfbXN0ID8gNCAvIGxhbmVf
Y291bnQgOiAxOw0KPiArCWludCBzbGljZV9jb3VudCA9IGRzY19zbGljZV9jb3VudCA/IDogMTsN
Cj4gKwlpbnQgc2xpY2VfZGF0YV9jeWNsZXMgPSBkcm1fZHBfbGlua19kYXRhX3N5bWJvbF9jeWNs
ZXMobGFuZV9jb3VudCwNCj4gKwkJCQkJCQnCoMKgwqDCoMKgwqAgcGl4ZWxzLA0KPiArCQkJCQkJ
CcKgwqDCoMKgwqDCoCBicHBfeDE2LA0KPiArCQkJCQkJCcKgwqDCoMKgwqDCoCBzeW1ib2xfc2l6
ZSwNCj4gKwkJCQkJCQnCoMKgwqDCoMKgwqAgaXNfbXN0KTsNCg0KQnR3LCBub3cgd2UgcGFzcyAi
cGl4ZWxzIiBpbiBkcm1fZHBfbGlua19kYXRhX3N5bWJvbF9jeWNsZXMgaW5zdGVhZCBvZiAicGl4
ZWxzIC8gc2xpY2VfY291bnQiIGluDQpjYXNlIG9mIGRzYyBhcyB3ZWxsIQ0KDQpOb3cgSSBzZWUg
dGhlIHNvbWUgb2YgdGhlIG1vZGVzZXRzIGZvciBleGFtcGxlIDZrIEA2MCBhcmUgZmFpbGluZyEN
Cg0KQlINClZpbm9kDQoNCj4gKwlpbnQgc2xpY2VfZW9jX2N5Y2xlcyA9IDA7DQo+ICsNCj4gKwlp
ZiAoZHNjX3NsaWNlX2NvdW50KQ0KPiArCQlzbGljZV9lb2NfY3ljbGVzID0gaXNfbXN0ID8gNCAv
IGxhbmVfY291bnQgOiAxOw0KPiDCoA0KPiDCoAlyZXR1cm4gc2xpY2VfY291bnQgKiAoc2xpY2Vf
ZGF0YV9jeWNsZXMgKyBzbGljZV9lb2NfY3ljbGVzKTsNCj4gwqB9DQo+ICtFWFBPUlRfU1lNQk9M
KGRybV9kcF9saW5rX3N5bWJvbF9jeWNsZXMpOw0KPiDCoA0KPiDCoC8qKg0KPiDCoCAqIGRybV9k
cF9id19vdmVyaGVhZCAtIENhbGN1bGF0ZSB0aGUgQlcgb3ZlcmhlYWQgb2YgYSBEUCBsaW5rIHN0
cmVhbQ0KPiDCoCAqIEBsYW5lX2NvdW50OiBEUCBsaW5rIGxhbmUgY291bnQNCj4gwqAgKiBAaGFj
dGl2ZTogcGl4ZWwgY291bnQgb2YgdGhlIGFjdGl2ZSBwZXJpb2QgaW4gb25lIHNjYW5saW5lIG9m
IHRoZSBzdHJlYW0NCj4gLSAqIEBkc2Nfc2xpY2VfY291bnQ6IERTQyBzbGljZSBjb3VudCBpZiBA
ZmxhZ3MvRFJNX0RQX0xJTktfQldfT1ZFUkhFQURfRFNDIGlzIHNldA0KPiArICogQGRzY19zbGlj
ZV9jb3VudDogbnVtYmVyIG9mIHNsaWNlcyBmb3IgRFNDIG9yICcwJyBmb3Igbm9uLURTQw0KPiDC
oCAqIEBicHBfeDE2OiBiaXRzIHBlciBwaXhlbCBpbiAuNCBiaW5hcnkgZml4ZWQgcG9pbnQNCj4g
wqAgKiBAZmxhZ3M6IERSTV9EUF9PVkVSSEVBRF94IGZsYWdzDQo+IMKgICoNCj4gQEAgLTQ0MzEs
NyArNDQ1MSw3IEBAIHN0YXRpYyBpbnQgZHJtX2RwX2xpbmtfZHNjX3N5bWJvbF9jeWNsZXMoaW50
IGxhbmVfY291bnQsIGludCBwaXhlbHMsIGludA0KPiBzbGljZV9jDQo+IMKgICogYXMgd2VsbCBh
cyB0aGUgc3RyZWFtJ3MNCj4gwqAgKiAtIEBoYWN0aXZlIHRpbWluZw0KPiDCoCAqIC0gQGJwcF94
MTYgY29sb3IgZGVwdGgNCj4gLSAqIC0gY29tcHJlc3Npb24gbW9kZSAoQGZsYWdzIC8gJURSTV9E
UF9PVkVSSEVBRF9EU0MpLg0KPiArICogLSBjb21wcmVzc2lvbiBtb2RlIChAZHNjX3NsaWNlX2Nv
dW50ICE9IDApDQo+IMKgICogTm90ZSB0aGF0IHRoaXMgb3ZlcmhlYWQgZG9lc24ndCBhY2NvdW50
IGZvciB0aGUgOGIvMTBiLCAxMjhiLzEzMmINCj4gwqAgKiBjaGFubmVsIGNvZGluZyBlZmZpY2ll
bmN5LCBmb3IgdGhhdCBzZWUNCj4gwqAgKiBAZHJtX2RwX2xpbmtfYndfY2hhbm5lbF9jb2Rpbmdf
ZWZmaWNpZW5jeSgpLg0KPiBAQCAtNDQ4NiwxNSArNDUwNiwxMCBAQCBpbnQgZHJtX2RwX2J3X292
ZXJoZWFkKGludCBsYW5lX2NvdW50LCBpbnQgaGFjdGl2ZSwNCj4gwqAJV0FSTl9PTigoZmxhZ3Mg
JiBEUk1fRFBfQldfT1ZFUkhFQURfVUhCUikgJiYNCj4gwqAJCShmbGFncyAmIERSTV9EUF9CV19P
VkVSSEVBRF9GRUMpKTsNCj4gwqANCj4gLQlpZiAoZmxhZ3MgJiBEUk1fRFBfQldfT1ZFUkhFQURf
RFNDKQ0KPiAtCQlzeW1ib2xfY3ljbGVzID0gZHJtX2RwX2xpbmtfZHNjX3N5bWJvbF9jeWNsZXMo
bGFuZV9jb3VudCwgaGFjdGl2ZSwNCj4gLQkJCQkJCQnCoMKgwqDCoMKgIGRzY19zbGljZV9jb3Vu
dCwNCj4gLQkJCQkJCQnCoMKgwqDCoMKgIGJwcF94MTYsIHN5bWJvbF9zaXplLA0KPiAtCQkJCQkJ
CcKgwqDCoMKgwqAgaXNfbXN0KTsNCj4gLQllbHNlDQo+IC0JCXN5bWJvbF9jeWNsZXMgPSBkcm1f
ZHBfbGlua19zeW1ib2xfY3ljbGVzKGxhbmVfY291bnQsIGhhY3RpdmUsDQo+IC0JCQkJCQkJwqAg
YnBwX3gxNiwgc3ltYm9sX3NpemUsDQo+IC0JCQkJCQkJwqAgaXNfbXN0KTsNCj4gKwlzeW1ib2xf
Y3ljbGVzID0gZHJtX2RwX2xpbmtfc3ltYm9sX2N5Y2xlcyhsYW5lX2NvdW50LCBoYWN0aXZlLA0K
PiArCQkJCQkJwqAgZHNjX3NsaWNlX2NvdW50LA0KPiArCQkJCQkJwqAgYnBwX3gxNiwgc3ltYm9s
X3NpemUsDQo+ICsJCQkJCQnCoCBpc19tc3QpOw0KPiDCoA0KPiDCoAlyZXR1cm4gRElWX1JPVU5E
X1VQX1VMTChtdWxfdTMyX3UzMihzeW1ib2xfY3ljbGVzICogc3ltYm9sX3NpemUgKiBsYW5lX2Nv
dW50LA0KPiDCoAkJCQkJwqDCoMKgIG92ZXJoZWFkICogMTYpLA0KPiBkaWZmIC0tZ2l0IGEvaW5j
bHVkZS9kcm0vZGlzcGxheS9kcm1fZHBfaGVscGVyLmggYi9pbmNsdWRlL2RybS9kaXNwbGF5L2Ry
bV9kcF9oZWxwZXIuaA0KPiBpbmRleCBkOTYxNGUyYzg5Mzk3NTM2ZjQ0YmI3MjU4ZTg5NDYyOGFl
MWRjY2M5Li43YjE5MTkyYzcwMzEzZDY2ZGNlMWI3YmE0MGRkNTljMTRmODBhMTgyIDEwMDY0NA0K
PiAtLS0gYS9pbmNsdWRlL2RybS9kaXNwbGF5L2RybV9kcF9oZWxwZXIuaA0KPiArKysgYi9pbmNs
dWRlL2RybS9kaXNwbGF5L2RybV9kcF9oZWxwZXIuaA0KPiBAQCAtOTcxLDUgKzk3MSw3IEBAIGlu
dCBkcm1fZHBfYndfY2hhbm5lbF9jb2RpbmdfZWZmaWNpZW5jeShib29sIGlzX3VoYnIpOw0KPiDC
oGludCBkcm1fZHBfbWF4X2RwcnhfZGF0YV9yYXRlKGludCBtYXhfbGlua19yYXRlLCBpbnQgbWF4
X2xhbmVzKTsNCj4gwqANCj4gwqBzc2l6ZV90IGRybV9kcF92c2Nfc2RwX3BhY2soY29uc3Qgc3Ry
dWN0IGRybV9kcF92c2Nfc2RwICp2c2MsIHN0cnVjdCBkcF9zZHAgKnNkcCk7DQo+ICtpbnQgZHJt
X2RwX2xpbmtfc3ltYm9sX2N5Y2xlcyhpbnQgbGFuZV9jb3VudCwgaW50IHBpeGVscywgaW50IGRz
Y19zbGljZV9jb3VudCwNCj4gKwkJCcKgwqDCoMKgwqAgaW50IGJwcF94MTYsIGludCBzeW1ib2xf
c2l6ZSwgYm9vbCBpc19tc3QpOw0KPiDCoA0KPiDCoCNlbmRpZiAvKiBfRFJNX0RQX0hFTFBFUl9I
XyAqLw0KPiANCg0K

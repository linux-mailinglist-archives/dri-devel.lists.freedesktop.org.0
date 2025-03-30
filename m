Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B4FA759C2
	for <lists+dri-devel@lfdr.de>; Sun, 30 Mar 2025 13:16:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82FAA10E128;
	Sun, 30 Mar 2025 11:16:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VBfKgq2i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC3C310E064
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 11:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743333361; x=1774869361;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WgOs3jf0bh9EF7yXHV9rLwQrcNp2lVUEjHFvOjg4mEA=;
 b=VBfKgq2iSGPoItaXrHXiNI8s0XnmJm2VMmX5kjvGbrtwmliKE9oMVfZ+
 hICVxEcrXuVhSeeEuZjf1R1takltwx31aXVRiuw2J8nrFD2HKTTbeKyZh
 zqzTvthAR3S1++UBUJ98gtDNsWVF9LKs3bW+r1hv3IwK52byjt4cXU/NM
 0BTWmpzPlZV7/s87td5arbVpGhQ16rNJOKpqHVjf0f/N/n4/GsbUktCUu
 p5IfVXSsc6m+LFCXcCpcchNNXlI2oTlYGIB+Uz8DpyYkm8UqcbfgcqeMy
 iKo81iIcR4PId4L3aWnF0R193Eu6ivKoqVof2PmEzn7StEk86H8EVuqId Q==;
X-CSE-ConnectionGUID: TgaQKHrpSsKpK+qdoLxTjg==
X-CSE-MsgGUID: ncuy0XRaR92ja2XDczY/3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11388"; a="55288409"
X-IronPort-AV: E=Sophos;i="6.14,288,1736841600"; d="scan'208";a="55288409"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2025 04:15:59 -0700
X-CSE-ConnectionGUID: UAznL+UaQ7aIigt8CI4FfQ==
X-CSE-MsgGUID: Bb0xqyDDTH6CcJgaX0UIbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,288,1736841600"; d="scan'208";a="126660280"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2025 04:15:58 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 30 Mar 2025 04:15:58 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 30 Mar 2025 04:15:58 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 30 Mar 2025 04:15:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yt5T3w9J3bYf1qHm+bRROec6OSM/9mLqnlYqI49kOzstZ8ux1orrVJMoNwU21+UyPYu90aaYBSR/EhvOplfj34tnhPqolct5es86cNY8PZVQFHs6Lmi2I+k4RVLQ0y1Cs8Ic3/SifwCZYSyQnWvVz8F70UeJ+qqLffnAZVj8GLgw1orQ5Ul7jfSss/Dsc3MRvsP5ia/ZhzrbmcXdwIY6qYvrEvHKgaHuk0eWG4pOX8aMI6Ygr8tk6aFMk2U0ry6lAG50Z4vg0E6p0+K1cY4dt9lu+6hnm45TPRFuwJ/NmhTT0/Zy7ea9e1azu3DEE7QoD2FM5pT0BDPVWpyHigDBiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OxagC66XpBdOBT/l+9XbkM2LiAVzHYvEEofCcPWYuGU=;
 b=ZjYDCL2ClUjEZZtgD+vIrIWo1iwkYyQxdVxmjNZtFfzFd8Px7XJyOFQ4i/g4ZQWSfMeePJNXbYSt88sH7w92hXycp7LjLhnbg6HRAo/10ke/16neYARywvnUTI46jdt2nPcATOhGnwzVXjzvDyCxBR9xA2oPW9rFgl1aecNQ4JRzh2dcyXGfwR310TK7LiCtGIxeXHY+RJfFysqHG7ctkYZgrc6FykcW1MpPHlgssHoZLvjxE+l5nF0kGh+5PDsEEBQk3xMSGhf+yQi6PyKCabtK5zQYBw/8QuB5/b+h/DdEM2/Z7DQ3c43RlLtIXz1b1qCsE7zgniJGvFG/XhEPiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5549.namprd11.prod.outlook.com (2603:10b6:5:388::7) by
 SJ0PR11MB4960.namprd11.prod.outlook.com (2603:10b6:a03:2ac::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.44; Sun, 30 Mar 2025 11:15:56 +0000
Received: from DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::6c31:ab8a:d70:2555]) by DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::6c31:ab8a:d70:2555%6]) with mapi id 15.20.8534.043; Sun, 30 Mar 2025
 11:15:55 +0000
Message-ID: <81431521-bedf-4361-a222-0e8ec70bea69@intel.com>
Date: Sun, 30 Mar 2025 14:15:50 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] accel/habanalabs: Switch to use %ptTs
To: Jani Nikula <jani.nikula@linux.intel.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
CC: Oded Gabbay <ogabbay@kernel.org>, "Elbaz, Koby" <koby.elbaz@intel.com>,
 "Sinyuk, Konstantin" <konstantin.sinyuk@intel.com>
References: <20250305110126.2134307-1-andriy.shevchenko@linux.intel.com>
 <Z-PM8oBtTPzqv-S2@smile.fi.intel.com> <87zfh86rqi.fsf@intel.com>
Content-Language: en-US
From: "Avizrat, Yaron" <yaron.avizrat@intel.com>
In-Reply-To: <87zfh86rqi.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TLZP290CA0011.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:9::19) To DM4PR11MB5549.namprd11.prod.outlook.com
 (2603:10b6:5:388::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5549:EE_|SJ0PR11MB4960:EE_
X-MS-Office365-Filtering-Correlation-Id: e507701e-d909-4aa1-128d-08dd6f7c3d6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cklmbFlQS1NYbDZsc0RsRXRPSDdrdXVVMGRlQjVJdFhBUDQ4bnJCbk1zOFBo?=
 =?utf-8?B?bnY0SUtUNk90V3pXeEhZMnBoVjJoeURNOHR6V3lRSGRXc1BlT0kyTXg1dExU?=
 =?utf-8?B?U1dnWFFVcnRURWxGYmRSUE1ScVFJd1lteXN1dy9kUWIzMkZrSGFRbDZvUUNK?=
 =?utf-8?B?TDZMT1NlQ0JCdVJmb0xwNDd2d3hDVDNETDUvQjQrWllDNWtzM2pVVE9sUnhp?=
 =?utf-8?B?NFpDRm1pZVFEQ2FuaWNVWkw0NklRbVcxdzhTMGJOK0ZmcWszY2VWVFd0aTB0?=
 =?utf-8?B?QjlsNUJCbTZMZGN1dWhhYnY2ZDJnQSs4VSs1NUdvSWVQNlRnNG9RQnUxUHJp?=
 =?utf-8?B?VWZIMU0xbHg4L3ArRWJySWxIQ2hMVTlGVjFDVk9LWS92YVJ1a0hEK0pRR0FO?=
 =?utf-8?B?Y0k5SzVmVGx4Um1nd1ZkdWpINUJRMXpzTFU1UmhKeGY3SUxxZDZQSWdaeHJG?=
 =?utf-8?B?TFBWSGFvN3pxZko3eGtaN2NyRXEzYXBxaFNyNmFvZXQreXB3OGFBQ3I2dllM?=
 =?utf-8?B?d2x1R014NjM5ZmJGVGorQzY4ZUtlNG5EQzF0WlFsWmthaGFLQkowTkJjMjN1?=
 =?utf-8?B?NUM2Y0pBZ0VmTVdURTJVaFRKYVhJR0dzcTNHckJTNkRMNWE2cEhIV0Z2TzNS?=
 =?utf-8?B?UmRUN3R2MGJENFF2RWdldTB1OUVLYzJZemtpTXRqaE1XVytEQk9KSlFRTG10?=
 =?utf-8?B?WlVJZjl2MHMzUTI1bGpvNWxFSmNsaGY5aXNmNS8vWGtHRXpURklYclVZVnA3?=
 =?utf-8?B?eGVJeVZYOCtQcVNQc1hjU2JLUTVxYzBaUE1PYjQ1QmRuTnZsYXJENmcrTWw5?=
 =?utf-8?B?Zzg1QXNmTjFDS2l0Zy9aMzVJeUNtYzZGa1ZFUmwyeU9LUUMrMjJBc2x1MW5j?=
 =?utf-8?B?K2R2cFBzYjhyRDA1M2VwYW1WSlE0VDdwV0cwMXd1QVRhK2JPVTV1Y3RUUmoz?=
 =?utf-8?B?K3FvTmxBb2VLUUlGK0NVVmNkcnhsOG9zSXZHSWhLVVFsaThySUlva0FOQXdS?=
 =?utf-8?B?T1N4dG8vUWNHMlM0WEduNTgvZDVjVU1tTmtyVGZsQ3JPVmJMdTl0RnlLTTRD?=
 =?utf-8?B?c3VCRU9iaFNUcThLUjVTWllIS2ZXNlFvY2xBVTYyNHM3QWFiTTZDTlBtUG1w?=
 =?utf-8?B?TTFpYldjbmZRMjlXQllmUkJUNDdKME9SUWNQWW5tZ2NBdG5aYmMxQjBWSjVa?=
 =?utf-8?B?VWNseUg5Vzl4MXFHWnNiZlZDdlA2cElHa2R3VlZGbjdHT0VEOGxkZ0NYZGgr?=
 =?utf-8?B?WUJWem53ZVc2VCtKWnlZZ0hTR3ZJa0ZxVlh0TkhmV2FwSUpRNEVMZm10cFhJ?=
 =?utf-8?B?S3R5UUE0MitQclBKc3lrTlF5R0dqNlRrNDEra2VqZzhpbkZXbjFKZXBJendI?=
 =?utf-8?B?YlVZTGtDQkhJeFNidTQxeG9ZOU9LSWc0cEIwR0tHdFpPM2R2WFlRNTFxUldi?=
 =?utf-8?B?UWFtRlprejRXSGxLdW1qemR2b2dlMXN4amxCZ3lPSWtpeSt6QnM2STRFajQx?=
 =?utf-8?B?SEFIU2Q4UDhBZGlBQitmN0tjcU5FWGlZcmZtenpGMkNIRG9na1BSMi92Z0xR?=
 =?utf-8?B?RzBqTW8xc2R4OXFmeW1RTWI0enNnVGZDV3p2WCtBZjhJMGlVb0tVcFd0MFlx?=
 =?utf-8?B?a2pLeEZseHozUEJQYTRKbVNJdUZFSlZuRmJ4MktkRitqWHFtTWNoOWw0ZGY2?=
 =?utf-8?B?OTNkZkZPLy9rdUloVU9xUlBrM0ZHOUEvVVo3R3pWU25aL0hyeW42ZzlhVU90?=
 =?utf-8?B?QXEwSCtNQWlud0YzdGtIREdpb1RnZmYzcFhhZ1N0RCsrY3Z2NnJYYjBEWXlx?=
 =?utf-8?B?b2xnWmN0YjdDQ3hDT054L0F4bXR0d041dHloU3ZDUlVPc0hiaXd6OXJzTTg3?=
 =?utf-8?B?M1NnbEhsQ3JsaDA2eEFCd2tuT1oydENxdVV2cHFwamVqT0p1V2pYd0RlZGo3?=
 =?utf-8?Q?OEhiawzQIsg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5549.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VEFzZnpyME9Jemc2cDhWbmlBYWRYUDFsQ2h0NjN6V3l3VU9STlNMNTBmLzh2?=
 =?utf-8?B?T0NaUVZvR1dTU2FJbTk0STFzYndpQmRyRmNua0tkZXdrbjZzd2k1TnZXMldO?=
 =?utf-8?B?R0V2ejg4THFYK2hMM3M5QnM0ODEyY0x3QUN5eEJ0ZnVJdUI2bTNpYmlFYmpC?=
 =?utf-8?B?SjdldHQrWjhVMHdXNExDWmhNSUdHd2hpSkVKM1M5SE91emY0bUZLNFhBUGlY?=
 =?utf-8?B?VHdSNXVkTGNjRnlZQ1B1WkxsNUFidlFkRWVpZHUydmVxNDgyOElBcGp3alRT?=
 =?utf-8?B?UmxnRmR0OU5ZZFZFVTFQVVMyZldLak9ldFpWN3NmSGlpcjJwNys0d2dyakNp?=
 =?utf-8?B?NUNwREloWkI3ODMrVEt3TzY0SzFrTFg1RkE1bFVTOC9vN0RjNERQMklVcEVG?=
 =?utf-8?B?MGxiVU1kRHEvVWVJM0tpbWN0RWs3MGwxaTVwMGxIQlJ6akxGS2NWZVhkTm02?=
 =?utf-8?B?YUhJYW84TGJIb3RBV1ZrNndRMzhMMGVJL3VLeUJOU2o4Z25UTlhTMkwrd25W?=
 =?utf-8?B?V0JyMDNzYXEwa0xtWmJoaXJxaHlkR1JodW9XV0pnSE9zSndPUlF1N3Buak1B?=
 =?utf-8?B?SzIwK0VDU3UwMXI1SnczODVEUFJoWFphRWN0ekFMR1BGRTZ6V09ORXlJdC9Q?=
 =?utf-8?B?bmVKdHJ4WXBIaUIrVEJJTWI3UnlJdDl1ODZBKzF6ekllWDZna29kSnJiSWZK?=
 =?utf-8?B?WmpWeXpYWk1mcllXbEh6Qkxxc1V5NWx2MmFTUnNXcTN1RFY5dDFtekpmd0hW?=
 =?utf-8?B?c1VialJ6S2hnSGRTbW5EQVcwWXJ0TXBZOHB2MU1JWnA3NmNIS2hRbXNWc1Ba?=
 =?utf-8?B?NENhNy9KRFcwcFE0eWtLVThadi9LblJYSm90NTg0azhKL2ZRYS8waTQvd01P?=
 =?utf-8?B?MzBpN1JKMEZhR2hEdnpDZDF5UUNBcmJsQ1paWWV2d2ZZMUdyK0k1cGFCM2Fi?=
 =?utf-8?B?ZUJRRzhwdHJ5YWVPOEJmK1pxakUzSGJkR080U3ZmV3U1d2kvYml2RXVnUGxh?=
 =?utf-8?B?ZUlDV1dSaXp1VHBxY0pXOWt6ZWhGK25ydXhOTDB1QXY3VUkzUkxnQS9YaVZW?=
 =?utf-8?B?c2hTT0x1d3J2YWQ2dmNIbEYzeEZhalJGL2dTdStpVVhOMWlmbHQ0RGJ0eS95?=
 =?utf-8?B?MUtqZHpibG41MHJRb0xUbUIxSEtQUEFMVVNGK0Nob2liQU5peW5FYnJRQjZj?=
 =?utf-8?B?bXlQWWpBL3RkTlYreW0wT0pWbFdQbVg0WGNaWS85MjZxU1FJNUgwdkxjeTRS?=
 =?utf-8?B?Z2pqbStZWEVoakRBc3FkTER0cm5heTlQa2pIRWt2M2FIQm9rWS9sMCtSYVBP?=
 =?utf-8?B?MU83L2NlSlZNMStZbUlPZDJMV2pWOUZWT0NERTQvTVgwOG85TkpGRnVxSWNL?=
 =?utf-8?B?RjEvVHBmbFYyZTN0OVZJcVN5WUMvaTZKUFNCMDlZODdha29sZ1VPQ042NVEy?=
 =?utf-8?B?ZFZjYmhqbEpaaUtkZjFTOTRmVE91UTZGa2laR3lnNDdtbGloZ2RQMEVyU2ZL?=
 =?utf-8?B?SG9pTG8wb1UvRjBQbFhuRnZtZWN3ajRnVVhWWEQvTGg4MkhFWGlsSnk4QVNZ?=
 =?utf-8?B?YlRvc3pIc3Z6U3Z4R3hSams2T1htV1NSSExFekU4YzkyN0M2UXRueHlSTjdw?=
 =?utf-8?B?d0dJVUFEMmNPTU80bFZZSEhieWZjNndYMzZ0RWlJVUVGTVU4Ync4am9vSkFK?=
 =?utf-8?B?RVVQSkN0QjNFQm1abTFLc1l5cU02M2VPV005Y1UxZlRHUEtrZk56aEdCa2Ni?=
 =?utf-8?B?U3pka1EyQWJ6VnBxTXR1NlRaOTRRY1hPZnVNbHg0a0M4cVkxOEd6RkU3dFkx?=
 =?utf-8?B?VEJUa21IbnoxbkFIcXVvYk1RdW4zaGZlNDFiV3JMRXJoem5rOXhsZzBtTStj?=
 =?utf-8?B?TVdRMlJIWXlXVnV6Ynl0bHJGWFo1YU1kbmZlNlR6Z3c2S0Y4VGtvSjVUekJx?=
 =?utf-8?B?VDNXays2Yk1pNmpJVTdzMGduQTdTYm9oY1lLLzlra0lNdmJqTUtwQS9Dalox?=
 =?utf-8?B?N1ZsVVVBSzM2aHlpOFNGZjQ4cGRHcFB1SGdrTTkxU3hrMmhkazE3K0g5Z1Mw?=
 =?utf-8?B?Y3JsM1JNUTN5MlBNc1dhSDlNaEE1cmcxMkIvbU5OUlZaQnMwREw0SkszamhN?=
 =?utf-8?B?V2V5eG50K3c5Y0NRZG85ZTI2YnVsOG51QkcrVU9LanlzM1FtTjNzMUNFQzhn?=
 =?utf-8?B?bEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e507701e-d909-4aa1-128d-08dd6f7c3d6d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5549.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2025 11:15:55.7540 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aMlBtnHK4WRqlbUEd71y+/HK0qoIXqt/KWseZXVpbBn+eCLnQmjLKKRt6dD/ft1+gY5Wz7xeWylwRMEU+NxAwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4960
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


On 26/03/2025 11:55, Jani Nikula wrote:
> On Wed, 26 Mar 2025, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
>> +Cc: Jani (sorry, forgot to add you in the first place).
>>
>> Do you think it's applicable now?
> Cc: Yaron, Koby, and Konstantin who are supposed to be the new
> maintainers for accel/habanalabs.
>
>
> BR,
> Jani.

Thanks for the help, We’ll verify this change in our CI/CD pipeline and update you ASAP.

Regards,
Yaron

>
>
>
>> On Wed, Mar 05, 2025 at 01:00:25PM +0200, Andy Shevchenko wrote:
>>> Use %ptTs instead of open-coded variant to print contents of time64_t type
>>> in human readable form.
>>>
>>> This changes N/A output to 1970-01-01 00:00:00 for zero timestamps,
>>> but it's used only in the dev_err() output and won't break anything.
>>>
>>> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>>> ---
>>>
>>> v3: explained the difference for N/A cases (Jani)
>>> v2: fixed the parameters to be the pointers
>>>
>>>  drivers/accel/habanalabs/common/device.c | 25 +++---------------------
>>>  1 file changed, 3 insertions(+), 22 deletions(-)
>>>
>>> diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
>>> index 68eebed3b050..80fa08bf57bd 100644
>>> --- a/drivers/accel/habanalabs/common/device.c
>>> +++ b/drivers/accel/habanalabs/common/device.c
>>> @@ -1066,28 +1066,11 @@ static bool is_pci_link_healthy(struct hl_device *hdev)
>>>  	return (device_id == hdev->pdev->device);
>>>  }
>>>  
>>> -static void stringify_time_of_last_heartbeat(struct hl_device *hdev, char *time_str, size_t size,
>>> -						bool is_pq_hb)
>>> -{
>>> -	time64_t seconds = is_pq_hb ? hdev->heartbeat_debug_info.last_pq_heartbeat_ts
>>> -					: hdev->heartbeat_debug_info.last_eq_heartbeat_ts;
>>> -	struct tm tm;
>>> -
>>> -	if (!seconds)
>>> -		return;
>>> -
>>> -	time64_to_tm(seconds, 0, &tm);
>>> -
>>> -	snprintf(time_str, size, "%ld-%02d-%02d %02d:%02d:%02d (UTC)",
>>> -		tm.tm_year + 1900, tm.tm_mon, tm.tm_mday, tm.tm_hour, tm.tm_min, tm.tm_sec);
>>> -}
>>> -
>>>  static bool hl_device_eq_heartbeat_received(struct hl_device *hdev)
>>>  {
>>>  	struct eq_heartbeat_debug_info *heartbeat_debug_info = &hdev->heartbeat_debug_info;
>>>  	u32 cpu_q_id = heartbeat_debug_info->cpu_queue_id, pq_pi_mask = (HL_QUEUE_LENGTH << 1) - 1;
>>>  	struct asic_fixed_properties *prop = &hdev->asic_prop;
>>> -	char pq_time_str[64] = "N/A", eq_time_str[64] = "N/A";
>>>  
>>>  	if (!prop->cpucp_info.eq_health_check_supported)
>>>  		return true;
>>> @@ -1095,17 +1078,15 @@ static bool hl_device_eq_heartbeat_received(struct hl_device *hdev)
>>>  	if (!hdev->eq_heartbeat_received) {
>>>  		dev_err(hdev->dev, "EQ heartbeat event was not received!\n");
>>>  
>>> -		stringify_time_of_last_heartbeat(hdev, pq_time_str, sizeof(pq_time_str), true);
>>> -		stringify_time_of_last_heartbeat(hdev, eq_time_str, sizeof(eq_time_str), false);
>>>  		dev_err(hdev->dev,
>>> -			"EQ: {CI %u, HB counter %u, last HB time: %s}, PQ: {PI: %u, CI: %u (%u), last HB time: %s}\n",
>>> +			"EQ: {CI %u, HB counter %u, last HB time: %ptTs}, PQ: {PI: %u, CI: %u (%u), last HB time: %ptTs}\n",
>>>  			hdev->event_queue.ci,
>>>  			heartbeat_debug_info->heartbeat_event_counter,
>>> -			eq_time_str,
>>> +			&hdev->heartbeat_debug_info.last_eq_heartbeat_ts,
>>>  			hdev->kernel_queues[cpu_q_id].pi,
>>>  			atomic_read(&hdev->kernel_queues[cpu_q_id].ci),
>>>  			atomic_read(&hdev->kernel_queues[cpu_q_id].ci) & pq_pi_mask,
>>> -			pq_time_str);
>>> +			&hdev->heartbeat_debug_info.last_pq_heartbeat_ts);
>>>  
>>>  		hl_eq_dump(hdev, &hdev->event_queue);
>>>  
>>> -- 
>>> 2.47.2
>>>

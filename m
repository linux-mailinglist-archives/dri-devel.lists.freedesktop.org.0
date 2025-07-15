Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C36B069BB
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 01:07:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D3BC10E6CF;
	Tue, 15 Jul 2025 23:07:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cuuAHnbC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AAE610E54C;
 Tue, 15 Jul 2025 23:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752620855; x=1784156855;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lD2MLRTQExiQzSJxrlXyDGmcnhrdMMIxzGdvUp8+QHc=;
 b=cuuAHnbCL12DhF6M7YUT/zliw1rnSiaBbkPVLAkd1SOJ/zEi4Pkc+2wR
 YJGOS95ODrFqfpAl0LFk/esszrDPmF+ljzyOYTF3m+5jlxoVdmNUW94uy
 xbfp6g8ABLWhVhPg0TUmW/crtTK/0yvxmvlcUh2iqN5gvIwjsQH09Nlzf
 mF39jgQ6A1rTqlX0/9Ns1rtE7MEQ8c8w3+M0ovtW+3Yb8HDndgCjOumkP
 Bpu+8oZO4IObCmO/bNIvgUjfJnVg1Xb+RNj3ZqrlKKfdb+vSzT5zMxK22
 aEA9OF7J+1bEmu8lANvGiQWgDPntSjWRLHiqdLTfr65IOB7zk3w31mizS g==;
X-CSE-ConnectionGUID: 9wl94tqPQ4KcrgA3KaROrA==
X-CSE-MsgGUID: kDWQhgXZRKKmuO4i5Ta9SA==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="53968286"
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; d="scan'208";a="53968286"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 16:07:34 -0700
X-CSE-ConnectionGUID: /JCUCwX1SD6ogh3zcDXwxw==
X-CSE-MsgGUID: 4wqYsCVgTUmaOR9MsJDypw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; d="scan'208";a="157850023"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 16:07:34 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 16:07:33 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 15 Jul 2025 16:07:33 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.79) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 16:07:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ewxpQQLcE2nsbt2A0mskMPzStKuoUOf1WUjGk4xIrZ9DHbwIySrBmf3LbXDZeFgsBwn/8MHevc5UCgcDx+MDq3QJrr+wp66K3ShtJKjQxwM0nUe2K6oFcKwC5X+A8ShQtM2sJmdrSw9F9ut4wdPnLgCj0j8med3unxalclNgkx2YbsK2Jnbq9FR8u1exqdNt+Sl/kR2gTyJkMUrV0WofROiwpPyzc1vJFF3JDIrvkRxSEvFWFtfAOhygkqiosSYRCOn/MCG5NNwnR3VmJuv5xpj9OGoRD9oLN2ZtRCsGJltJW3rsChDtF+NuZ/RqxZ0s2xJdWE+4TrIITOoIZIM0zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wfTQ6tyue0IkmiQVwomXxr3scTJK61BszxfK5vDfat0=;
 b=Y2dV5lE3WjCeWWuwugVbGuuWMK3boLdB5ZVlryAFx1yd6HKu15p7QnTbdah/pHYPJsByhphV6WFQhrWZOwyjKx06H7Rw8tzIYjv6O+0EtY1fmGrtalu8HQ18B8mm52MeMl6TR3cLsWQm7awDY15rb5ypkBouglhtpS/bIoiIG1B6v8UoGoOOzCxETW6bZeeUW7c3JfAqWNkrUAGeLi2FXbl4hhABQP1SKWHyzMQz68oXhL3M8yJy5QDLpPVX+Jv44TgPfJp/viUk+7ovtPzfEDhaAWLNoJ/EoiHMbiPmVnK5xzvZbg3jH0aB/OtmM7Ej6rMyrhIFWU4c45CmOKyO9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by PH7PR11MB6498.namprd11.prod.outlook.com (2603:10b6:510:1f1::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Tue, 15 Jul
 2025 23:07:02 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%5]) with mapi id 15.20.8922.025; Tue, 15 Jul 2025
 23:07:02 +0000
Message-ID: <9fbf3c46-7dcd-4356-a1d7-ab8466df6c34@intel.com>
Date: Tue, 15 Jul 2025 19:07:00 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [bug report] drm/xe/uc: Disable GuC communication on hardware
 initialization error
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <23dd9160-df79-4827-a814-99e486c08ea4@sabinyo.mountain>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <23dd9160-df79-4827-a814-99e486c08ea4@sabinyo.mountain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0151.namprd03.prod.outlook.com
 (2603:10b6:303:8d::6) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|PH7PR11MB6498:EE_
X-MS-Office365-Filtering-Correlation-Id: 68ed1dca-4248-4b91-1f61-08ddc3f44f5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SzdNSXdXVkVod2NiT0o2ZC9Ldzl6bVhLczgvSmZWeG9sVEVVR0VxTXFnejR0?=
 =?utf-8?B?NStHeVFMV3FRVDB6TUh4cWU1SXBFM1hWcG1BSkZSdjZ3VDBPTTl6djJmY2dX?=
 =?utf-8?B?Ly9mc2VmckFUTlBYV05SajFKcENwVHRlM1BmSTM5cnVKYkRYbUxhNko2LzNp?=
 =?utf-8?B?KzcxbWN5Q2hmU0VVUi9HQllqTlZsbFFMMGdtSmxvcE9PNHNNUWN2cEpLQ3No?=
 =?utf-8?B?aGExZ0tsY3FNR2tEc2hpdXk4aDU1dUppMTFRa28vaXlPQThwdHI2cnlEa29H?=
 =?utf-8?B?MFRyOUhjdkFyM0ZqZHRHU25mdDZwZ0diTXM1WitGRnhXK3VMQ2ZSazltV1ZI?=
 =?utf-8?B?OGtGVXdueWpPQmpkNVh5QThqbXY4RXZjQnppNDkzMGpkQ0FpYUQxZUl5SnY4?=
 =?utf-8?B?UWJ2NnZtaDFaZ3ZWZU8veitONS9xczkwMzNjK1h2R25MeEt0dTE5enRtOGhW?=
 =?utf-8?B?UktiZVhQRjZ3NkhUZDZaVyt2bkJCTldTaDVwNjZLM3FOOHNFSmxmbmFHRkpB?=
 =?utf-8?B?aTV1KzhpaWN5L20rYVZ5UmVKTzNlZTdzUWpsRGF3NjRuRE05cGJmQ3F0VGxx?=
 =?utf-8?B?a2tMM1N4aXNUbEFlRU9wYmtIU3MzSTJZbTE0R200Qjd5ck5wcXU2eEFOK01M?=
 =?utf-8?B?VVZreERZQ0xCa3B2MU93WmpJV2hZRXJqMDU2QWhTQ1ZwZDhKSGVCV1diY2Qw?=
 =?utf-8?B?ZkljaERiM2VjaTBmOUpmOXlYNW9ZQ3pRS3N2dDZTT3pXc3l0V3NXTFBGSEhM?=
 =?utf-8?B?aWZKTlk2Rlg1ZlIzS0lsQnRGSWhIekRPWm5sN3RSNzBTWWgvYWVJRkY0ZDN3?=
 =?utf-8?B?UFczNDFoTXgzaCtaTG1SSHp5MzRac2NCVjVvM1NaOEpCUHNBbitrTEdZUVF2?=
 =?utf-8?B?bTVxM29uNHMxcDRqNjA4cElkTUtVYUtMRFNyWXBialE4ZFBXU0lnTHAxajNF?=
 =?utf-8?B?QnduK002dk5FbUF2SENyWlVDUU5DbU94R20rUXhGdi9HM2ZxdUQzcFNVZlVW?=
 =?utf-8?B?TDdJUEhFWVJuNkhDNjk0YVJCUGZ5elA1Z0xwS09DZzRqODZzb3ZWYm93OFpi?=
 =?utf-8?B?aW5FRnBDWGdJcFI4S3RPbzNtQW1XQXlHWC9IUUJrNFBvU29Nc25XQ3ZhUEMv?=
 =?utf-8?B?dHNrclNnZ1NNMzVkNVZ5djZZSS9kaEYxNkgzazJCT1BrbEM4ZTZFMFBJYmRw?=
 =?utf-8?B?VndTSE1OcFJ1UTZIRFlsazZ1VnlyMmVGMjFnWnFDVkFnVHRvWHdCQjZKNzgv?=
 =?utf-8?B?MGVDL1h0eVJoT2RGRTlJNWszWFdDSTIxa0g2MEVzelFhZ1FPMjA4R2pBZVFN?=
 =?utf-8?B?S01oVEVXeG9PbG5zeHN2dFdHMHZzR3RwZ0lub3pwbFJUVENaeEpZTmhOQkNC?=
 =?utf-8?B?eHdRRkJLN2NUYUZZV0RrMnZDS0thNXZSK2srZ2pubHhrRFVxK0tjQnpsL3J0?=
 =?utf-8?B?SzM3L0hBZkZHZ2d4Q1RKeS9wcXNvVDVEcDlmUVpnYSt5dWhzM1hRVDlGYkFz?=
 =?utf-8?B?MGIrU0ROTWx1c290NjRQckk0b0h5RnhqQnppWHliNEVuZWFuRTJmcVhla05U?=
 =?utf-8?B?ZWRVOWQ2Q3N0bzhEaVMydnFEL2JhdzdKbW1NMUxRMW1RbUFzMUpWZ3pYbE9T?=
 =?utf-8?B?WitxYlZNTFgrZms2YXUvbkxFeVljRGw4YVdXelZyNmViaitldnYvS3dZK2Nm?=
 =?utf-8?B?b2o1NDk1ZjU0MXNtU0Jkd0pJVmhlTGc3R2tOUUI4Y1N3WXJPQ01PUWNoRHVJ?=
 =?utf-8?B?dThrTmhnTDdUajZNZ09EREpZQjRRTDZVM29IMjBZZTdoempXcXMrUmlwbGpw?=
 =?utf-8?B?L1VYckQ4azlkd05YYndBQXJjQ29CZkJOSjBWbkJ6RTlnTzFwWHUyUDkvUTdr?=
 =?utf-8?B?V0loQTg3OCtCK2plVGkzdjZMa3lqYk4xaWswMzVCN3ltS21hRzN2YVdQTWl3?=
 =?utf-8?Q?mtQOs3O3MIE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UllHN3VMVTRWV3FXdzZXYWVGU0thVytVYVIwajBzYWFMcndHZXVZdDFpVExq?=
 =?utf-8?B?M1gxQUV6Y3BmYVNkcDdyNGRDejR5aitJNVpiOVV1R0ZsM1FHSTBaWC9DRlF6?=
 =?utf-8?B?Q2t6K3RpOVBhZk0vaUJhbWFpZnQxOWNtOXpBYUtocmRFSUUvRjJMOUVmMURu?=
 =?utf-8?B?UW93R0FGYXd6VVdZclFDRlZRamR3cEx6aGx6Q0dQVkxCQThRK1VlaDUyMFRO?=
 =?utf-8?B?UFNNWmRrU3ZjdzV4WUc3b0h0ZXZRSHk3TFd2NDMrWEZrTkZuRjRid25zc2FV?=
 =?utf-8?B?WmFRNHluYTBoUTdFcy9rRE1MdFpWZkFNS3JJZHNUTDhXeDcvODhTdk9lTWx3?=
 =?utf-8?B?OEw1eWFCTGJ2TGw3elJOK0hBZnVqbjAwTHhVMHNvb3g5VUR2MWZzaW0rc3Vy?=
 =?utf-8?B?cnhHVDJLbTJzbXFUNFM1RElHOENVVUxmemJnK3VZRUV2NmVoa09RbGZpUWtX?=
 =?utf-8?B?NzVQZ2NUVFZ0TXNUNDE2RzZ3VU9DWkErdmE3M3hwcGpWbmphdkxaTXBNWTdB?=
 =?utf-8?B?Ym8rWFpOUnVtcVJRZ2ZQb0NyWjBqSkV1QlRxSGFkS2tWSEhZZi93cU4wVEpu?=
 =?utf-8?B?WTNiRzRLWmt1MHhPZTJnakUrUlhnd1RYYXAwZEZSOUpzWWthallDc0UrUUpn?=
 =?utf-8?B?cmtFUUdCWWVmSGdCYlpWY2l0UDVITUhQL2Rnd0JDSmZVK3RwWWpXMEdpd1g4?=
 =?utf-8?B?czNhNGJob0I1U0s2dGdIUUtsNkxRQ09BVkVDVkVScDRGYnFzQk1tUi9lcEc0?=
 =?utf-8?B?a08wdENHcm9OeFdCYU9QbnA5RGlscTJTU2hpbEkwUy85cWpqT1JaWERsMGZK?=
 =?utf-8?B?Vmxxdno3bVBSbk5OOTlCaEN5OE5rYmRkQ2NSRUVkUUF5bmhnTjhFUHVpK2V0?=
 =?utf-8?B?TlAwWEFYb0tidHU2RlVBQlhNT2owWjBzMGY5UG5TTVBUaEgxQWNnUU01a1Yz?=
 =?utf-8?B?SGk3SnRoQndFUlRzcHByQTVqc2lsSjRZcTE1dk91K3d3ZWhzMmxTSjBDU2dk?=
 =?utf-8?B?cW5mM0VYYkNJS0l5ODlzeHUxc0R0b2pRWlRUVGhMa0ZYREVKTXQzb0FnNEZn?=
 =?utf-8?B?dy9TOWxNb3piWTlVdHBtWUN6clUybVhzUVZtQkVKMldFQU9pY3FUdmNmMU9n?=
 =?utf-8?B?SEtXWTZmMHpVRi9TTlJrUTVSSWdaaktjMUdmSjFDcDRPdUZQb0cvUVBoeTd5?=
 =?utf-8?B?a3FjRlNyS29GMnlVVUlKNWNmTWlNcW15L0xxaUFPTWJZNFRNN2lDbGJSVGRa?=
 =?utf-8?B?MTArWVJhSDVZTVRmbmtLM1U3L21KZ1d0bVpYR0xGNFJvN1RZYU0wdUFOY3A5?=
 =?utf-8?B?d2RGaDF2YXYxY3ZWZjJrS0Fzak9ScUFvYzhVLzM5VzMrWjFyT0ttU0FvK0Y5?=
 =?utf-8?B?bGtDUGVIaTZQN3c1ZWoweHpaTWRGSWVlcHdQWXBLRmVGbjIxMGgwd2RETmEw?=
 =?utf-8?B?ZTE2b1RJcUxzc0JJZHByUFZ1SVZvdDRZcUs1LzhWSVgxME5iNmF0bUlMUTNQ?=
 =?utf-8?B?bGYvbmVMVEhmRFFLR2xGWXJCd29iSmRSOVJOOVlWSU9ER1NHUFJmMkR0Zmcy?=
 =?utf-8?B?LzU0a3ZTdUJEcmxaZ2NveCtURW1uRERRK214R3YzNS9ZZ0RiKytXYm1DWVor?=
 =?utf-8?B?dXZzaGthdUdXdi83VFJHcmJJWEpiSlJqMkZBNVlteHZ6RXY1b1hYdm4zVzZ6?=
 =?utf-8?B?SXhkS0YzeDJ1STdEekIrZ0xyQnZ6NXpTTTZZRlZNRmJCNno2TWcwQjQ5cVNX?=
 =?utf-8?B?MXU1MVpaK05TTHF6ZkUxMFNmOHdxWkVMejI1MnoxaXR1UGNrWitQKzhwd2NC?=
 =?utf-8?B?L2w3YnRnV084ZW50bnRnWjZqVEZFOWFlRHF0Q1RqbnBVMGdvaFlNVXVwZ3J0?=
 =?utf-8?B?WGltcFZZc3NYZjUzR2RvUE5QRDFXNlZTQWdUS3FFQkZmU094SGZyQVdiejZT?=
 =?utf-8?B?Ky9DdGw4NDVhVHFyOUUxR1hseDA4T2c1SjJ4Q0dUR1JLcXEwdEF4YUx6ZjZu?=
 =?utf-8?B?eHhQcUYzUEZoVVRIWUZKdXdFbXJMc0xLWXVUSStDa3ZYNXpBeVB6Q2FzSjR3?=
 =?utf-8?B?YUhjdmNaQ1JzTHM0S0dOSkFzbnVsRzBmNTNWRGkyeWxYUk9VdDdVNXI3TjN1?=
 =?utf-8?B?dlRmTGYrcDd4MEFySXlQbUZHUE1DYkYwMU1zdlV0b0c4eVdlZ3MrV1I3TjE3?=
 =?utf-8?B?NEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 68ed1dca-4248-4b91-1f61-08ddc3f44f5b
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 23:07:02.8194 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R9GHIOZStwQ9FBmok4sfQ9tnEyipBWgBEunYChbYPTqt1N2N2Ruk3dH4cy8X1L9d/fJGB6FVFWhtbFBAJZO40A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6498
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



On 2025-07-15 6:59 p.m., Dan Carpenter wrote:
> Hello Zhanjun Dong,
> 
> Commit b2c4ac219fa4 ("drm/xe/uc: Disable GuC communication on
> hardware initialization error") from Jul 7, 2025 (linux-next), leads
> to the following Smatch static checker warning:
> 
> 	drivers/gpu/drm/xe/xe_uc.c:167 vf_uc_load_hw()
> 	warn: missing unwind goto?
> 
> drivers/gpu/drm/xe/xe_uc.c
>      147 static int vf_uc_load_hw(struct xe_uc *uc)
>      148 {
>      149         int err;
>      150
>      151         err = xe_uc_sanitize_reset(uc);
>      152         if (err)
>      153                 return err;
>      154
>      155         err = xe_guc_enable_communication(&uc->guc);
>      156         if (err)
>      157                 return err;
>      158
>      159         err = xe_gt_sriov_vf_connect(uc_to_gt(uc));
>      160         if (err)
>      161                 goto err_out;
>      162
>      163         uc->guc.submission_state.enabled = true;
>      164
>      165         err = xe_guc_opt_in_features_enable(&uc->guc);
>      166         if (err)
> --> 167                 return err;
>                          ^^^^^^^^^^^
> Should this be "goto err_out;" as well?
Thanks for point out the missing unwind, I will post a fix.

Regards,
Zhanjun Dong>
>      168
>      169         err = xe_gt_record_default_lrcs(uc_to_gt(uc));
>      170         if (err)
>      171                 goto err_out;
>      172
>      173         return 0;
>      174
>      175 err_out:
>      176         xe_guc_sanitize(&uc->guc);
>      177         return err;
>      178 }
> 
> regards,
> dan carpenter


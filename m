Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB779063F7
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 08:21:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7314610E1DE;
	Thu, 13 Jun 2024 06:21:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cDYyOm4C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0E4010E1DE
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 06:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718259662; x=1749795662;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=9U8O1nIHC/nMts1ct9rmZIXYj+VPCDSizUK4rMiKhgo=;
 b=cDYyOm4CgYF2gXfR2miI1JWAvt0qrdxCYL/aMy1WyuleTpMDLdfPpa3o
 VkZIJH7Eef17ZAcbD2/09sFh81IOFxTkXe3xZHN7xr70jnMRJQBwIzTOo
 zpfaPZqD/2iMx9SVqJH4oMAN1KugPndMixpxOrwSoDhEEdzL8yiowfu8r
 XYAW8/nQsDjuAcFh+q3iyzmAOc9RqQ5COvak7bNu/EQfG77+bDeueHzcP
 TiSapzoIKdeZvegbQCBsS7TtNxWPvy35+oiE1Vj2sDiGqQ+6Zk1YY1ePc
 0ACamGV2qJKrRMpXWGG41kXM6N2D+3TikjDZRSqGVvFGmkUqL7cD8VwRn Q==;
X-CSE-ConnectionGUID: ZFbzMjKRQUGqVmAz/+Y57Q==
X-CSE-MsgGUID: RXbkYWfRT6aZAPotD+uKzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="40464835"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="40464835"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 23:20:52 -0700
X-CSE-ConnectionGUID: SF7eunvASwahNQi6xTfICQ==
X-CSE-MsgGUID: zSpt4ypXQHmMrM1e4Dfb2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="40740935"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jun 2024 23:20:52 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 12 Jun 2024 23:20:51 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 12 Jun 2024 23:20:51 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 12 Jun 2024 23:20:51 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 12 Jun 2024 23:20:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PfuJ7v1WX9Frtba7I3ZCa4AehS5wsPn6fIGxgFmeDci3g19c4mJ4U0HB49Kql3OCKK5GvgFuzyTTLquxQL2rBiXf5TcPMt51zKomT+Ny/xqT5m9L9SgNqqS4feowWwVhXKhXlXIf3U+VgV7maJ8qKMM2EqW5YOfnixS6oZNiuT36XmERF1h0owtlppsTq/4TPsHGxJN+hWRg2j3s+1LmfiwXKGyw/3ovxT9NiNJWqhhVssCsQWPv/YmAS3+3g0PcowW4h9E8VbLZvoFbm1Rq5l5wlbs77WQU5LCARScXMYZNVhYJEvlhV5Iv2VU1srxmpfWKcixNEmIYj/LUcDqo4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9U8O1nIHC/nMts1ct9rmZIXYj+VPCDSizUK4rMiKhgo=;
 b=UmBW5EiMVxfGO2C7P7tmxTOvRSt5JcJiKtvkpkcpyVNHPjo43GD7T4tA5F99YJOSJpSHEuYHTwtQyprPP1ZEZL9W3LYqBnE8zp+k6LUt4EKf0wsE+SpD7CayhbCe0utbFWxl9gfIkbJj1UetUoYpjTeWXRMY0gsUOIeCrLQlAPHmCQkR0zBba1XRMWlTC0e0DhOccWA9EaPNWrjjJkbYRYD2jsb+XlUlxP5NV8m1q4jmiiuXVSmqfMfy0ZKsw3Tk+O1/GCe304dY5uTuijeRawIHt+QqMhbC8nZ4bYQQUGZn2qxcZmFGerJlsAOrP3/1WcUmLdttsnGbBrUB1ZJ0Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by MW4PR11MB7006.namprd11.prod.outlook.com (2603:10b6:303:22f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Thu, 13 Jun
 2024 06:20:43 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%6]) with mapi id 15.20.7633.036; Thu, 13 Jun 2024
 06:20:42 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: syzbot <syzbot+40c7dad27267f61839d4@syzkaller.appspotmail.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "kraxel@redhat.com" <kraxel@redhat.com>,
 "linaro-mm-sig-bounces@lists.linaro.org"
 <linaro-mm-sig-bounces@lists.linaro.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "sumit.semwal@linaro.org"
 <sumit.semwal@linaro.org>, "syzkaller-bugs@googlegroups.com"
 <syzkaller-bugs@googlegroups.com>
Subject: RE: [syzbot] [dri?] [media?] general protection fault in
 udmabuf_create (2)
Thread-Topic: [syzbot] [dri?] [media?] general protection fault in
 udmabuf_create (2)
Thread-Index: AQHasNcdFk6N7dn7MkytRS8DxXG1LrGvIFoAgBYwoqA=
Date: Thu, 13 Jun 2024 06:20:42 +0000
Message-ID: <IA0PR11MB718550C7137E8341C7D54A71F8C12@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <0000000000002174ba06197f39c1@google.com>
 <0000000000003032c50619a36bd7@google.com>
In-Reply-To: <0000000000003032c50619a36bd7@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|MW4PR11MB7006:EE_
x-ms-office365-filtering-correlation-id: c40f9b9a-7733-4319-995d-08dc8b70f433
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230034|376008|1800799018|366010|7416008|921014|38070700012; 
x-microsoft-antispam-message-info: =?utf-8?B?RUNjMUpUTjI2ZUFqeFlLWHNsMkxidDRQK254dHozNlJKd2xWaEN3Tko1bHBR?=
 =?utf-8?B?bUdZSmFkWGNGR0hodG05S3NvYzBqMUUwczUrMDRkRnFUWHBtenNtZU9OV050?=
 =?utf-8?B?VThoVnpxZERrUWl6akVONllvS0hZMWtidG5lQVR3U21Cb3p5U1l0R1d3T011?=
 =?utf-8?B?RDlzUzdSenJiVDhiZjg1aTd6WE9QdHBVcDFrY2JJR2xnZGsvVy96YXIrNzdX?=
 =?utf-8?B?STVWNGlJODZFdHB3d3lFTGxzVUxKY0J1bGdGbXprSU9pSTRROHhuOWpyZEVX?=
 =?utf-8?B?Q1FwZUZ0cDVqMG1TcnVxTXdUamtqSGtCQ3FNNnN0NjNBcUU2QjEyNlhSRllh?=
 =?utf-8?B?azRBaUgrVFdIa3hCRVBjMU9ydTVGc2hOdU10c1VtWWpoRkJ4d0ROcmpaYjRs?=
 =?utf-8?B?a1dwRzE0dnBXSWVnd1ArTVhWQTRrVVVBWC9GWkEyTkRId1hlWXBWM2ZyaWZs?=
 =?utf-8?B?SGhncExQTTQ5RHNaSUJTK3VTc0d1M25UWGlKU1JvUDE4YXgwY3VJeDVwem12?=
 =?utf-8?B?cElXeHNTSmRFQVRyeVo3MzBnMExCR3ZIZkV5QnR6MDYxN1VpcTlaRWdlSUVD?=
 =?utf-8?B?b2NLVXNQUGdBbFlVWlowdHF4UTJZYVd6OE5tenM5SU00MG5lbDQ2aHE3UzZT?=
 =?utf-8?B?VkxzN0c3Rjk5bUo4dkVGWUpuSWZMeGVMWUUrUnl0d1Z4M3VzL1ZSQURhTWRB?=
 =?utf-8?B?OVdwbWcwZHc5bUkzZkxRYThSUWg3YUFVRFl5WU5RNkpDZmwwZXowcGlGeS85?=
 =?utf-8?B?eDZpUVFaQlhCT0EvbTVoSlhNUFhSYXE3RFFTamZxL0dSQW5PWU8xNUtTamEx?=
 =?utf-8?B?UlNJZXBqd2kydkQ5SE96WTRkMHRqZHFqSjI4SzR3dHVFZWVOZXNZSXdVSHhW?=
 =?utf-8?B?ajd3N1BnUVNlMVMzb1NFbnlsbm1ncUlpZm5qc3JpUFFFdkJORnMzVmFGcUNS?=
 =?utf-8?B?UFU2SjdhMVkxWjlMSVdEL2V1VmhWOFhDS0cyV0NCYjBlVGNKUlVZZE80NXJQ?=
 =?utf-8?B?K3hPVmhMK0ZzdzBqTDB6QUwrd3VpL3QxV1dqanREZUJScmF4VVBPdy9WSGhM?=
 =?utf-8?B?dVVybW5rcnptRE5JaHpDVjVTK3FxSDB2TE1ENVRsQ2lEWWlBTHFBMzNIZlJJ?=
 =?utf-8?B?MEcyOExFUitBWlhkaVJ3bHAyNG0vKzRDNDl5L1YyajBpeHQrZ2ZSRFNJSHJ0?=
 =?utf-8?B?SVZnUnNTSkpXUDFiWlczRVk4bk9taXdNMjZ4QU5zeG5oSG44OExUTnU1V3Zi?=
 =?utf-8?B?NWVocU5KM3lnRkJrc2ttNjdJSzJTVWxmcFZnaG9IWVJGS2E4Y2NIM0xBVjd6?=
 =?utf-8?B?dEIzY1lkYkpYeTJId1BycmlFQXg1WTgxbzcwS3NxSUp2aG1CZ2JiK3UwcnJ4?=
 =?utf-8?B?eVgvbXFYNjYvZGRCVml4djlGb0xSbFBjcURyZDNDaWhyMmszVDJiRnZtQzRJ?=
 =?utf-8?B?OVFCU3FqeTA4cGNiUml6RkNEL3Q4eUo1OXJkMmZWRU1GMWdUY2xISnpQVE9U?=
 =?utf-8?B?YnI1cWp6TngvbFFSQTBmS0pSU3FmaE1ISWVhSDk1dGZGMmJrZmtEcVhHNHV6?=
 =?utf-8?B?RjRjYzc1VndIamtKSExIdXB3cDJObVB6c1FVSXRLc0hIVjFITXFBWHkzYXJy?=
 =?utf-8?B?TnYrSnNpKzlBVFRRSmlQbHREMUhNMlllNVdNZmNJRU5UeDRwNytPUTkyekp2?=
 =?utf-8?B?WU5CaVpJeVM2dldOMnlmUzZCZGF2VXluUS9xOFNITlFoZmcxblBtbXJvTDVO?=
 =?utf-8?B?RW55UUdiUzBrYWZYYXlUTlNiaXFJU3NXQU12YnNtanMrNEgzaGZLcVd2NFIr?=
 =?utf-8?B?b01CNGhVaTBxbUU0RFpDZz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230034)(376008)(1800799018)(366010)(7416008)(921014)(38070700012);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MGx4MDJ2V3J2VHRxcjc0eHNHRkxwQVhxZUdkTXJidGlUOE4xUXF0NHc1K0tD?=
 =?utf-8?B?TGlYSWErT3B0dnBQdm92aFFCWkR1SnN2SjI5bUdPME1BS1VKbUoyT0pzd2JC?=
 =?utf-8?B?Y2VOUUFWVTV4YUNRWDVvU0M2SHdoMllpY09iaFZFOE5JTjRxbU9kNFcvZlFX?=
 =?utf-8?B?bXdDUXVTbVAyd3E5MEpUY1BycTBMVkMvMUVraU9xampEQ1IvNVhnbTVFVVdv?=
 =?utf-8?B?VEgycS9FS2F3c3VvUDRkNEthb3RSSWFSUEx3NWR1ZzErbkR4dTM0NXFqRVA4?=
 =?utf-8?B?c3lYeVpEM3lvaHdKeGRYSGdpK2dPU0swQ1VMQmE4cDdaV2JqRml3RC9uSTRp?=
 =?utf-8?B?Qk9BN29aV1ZvdjVGNytxbGRETGtBMUpzOFBQQWZyTjlIdVkzN3ViNS9FZnNn?=
 =?utf-8?B?OTJrQ0RrZytNSXlJblFKbXpMNXR3SVNaZGpiVHFibjFQMUNUYTZBbi9mTXNT?=
 =?utf-8?B?RjYxRm5hRjVLclVPeVR1OGtQTi9aNGM3SEwzTWFvbDVGQzZHcDVXMUZ6dW55?=
 =?utf-8?B?SGRNT1R4SEZpN2tJeWhYR1Bsc0xDaC9FU05Ta3plT0xLSkZUYU5Vcnh5d2JG?=
 =?utf-8?B?NEMreUs4dXNQdUc5TWsyWDRDL1lFd0RJeVFlMXhua0JlYzhCS0NtcTc0TkRR?=
 =?utf-8?B?MTZrSWRDMXNqeUhWL3Y0eXhnVnd5MTk4elF2SjNhSmdSSEJWSDBFRllyeFVC?=
 =?utf-8?B?ZWgxcVJ1N2p0NTRzOG9jMnJmVTN4VUtjOGIvWWRoS0RzWk5zT3NUbHZGWVM0?=
 =?utf-8?B?VGlFeXZVSXVlandVN210azJQdjQ0aGVJaWJyMGg1czM1NGloTDVBbDhMQVBT?=
 =?utf-8?B?UzM3NTJCcWJzLzl3emZjWllvamx2OHlRR2UvMVd5Y1R2Q1htcTBwTWd4MTdM?=
 =?utf-8?B?WklLTEVHVTNPMEFJQ1lZTzd2UEVDWENoSGRxU2Y4RWlqeGRTNCt4VzdnQzJ4?=
 =?utf-8?B?Q1NyS0RBVUxDVG9hT0ZOMHVQZWRIbnJnanZuT3FxbDZRYThBMkNxbEx1a1Rn?=
 =?utf-8?B?MjdOVWVmWXNKY2VTNVBBMzdkdHVVMWJzYUpiRXZ4bXgxUlRrZms3MllEODY5?=
 =?utf-8?B?OUMxZXNtMDNIbWE0WHVYSVVBN1dHcHp6YnJWRDl6SEtqSDRlczlXcDJneTlH?=
 =?utf-8?B?NlliUTEwQk95MHNveU4vL0RDVDNJWWN0dTFPMXNPK2dTNW5PeXk0V3pHU1lV?=
 =?utf-8?B?MG1PSXY3WDVNanZsaFJOa3VEVmZZUGVodjlnejlTeklkWCtTNDZEYnUweE1S?=
 =?utf-8?B?WXkwaCtIM2VaS1lmYjlCNWZiYW15QTUyWkdEb25IbitJcGpBY2g2c3NFaXpU?=
 =?utf-8?B?UTJWOUpsSVFCOUd5S3cyQklVZUVaYk1rUHhaSlRKaFpqM1dkZE9YYlFkblRD?=
 =?utf-8?B?T0tnMnMrWSt2ZzFhSCtPRUhSQzdob0tYSStSUVdnUG1WR0k3Y3ZMc1hJU2tK?=
 =?utf-8?B?MjZWZHljOEVsZFlENTR5blJzUHg5TFNWOEhwb09Cc0thUU1lUVZyZHY4RU8z?=
 =?utf-8?B?d0tYUTdWOHJaMTN5TnBhSUMzVXQvSE1sbWlvVk1zMklYUGJtZ2RFQm14S1Rj?=
 =?utf-8?B?SmRUMGhUeGZ1UUUvYVRWQkNQZ3I4d3R2dG9FbWNmNGRnaDFQYTc5djV4b3Aw?=
 =?utf-8?B?Vk1wbzloYkIvOEJJb1ltMlNOSE9oSXdFa1BkZitPTVNjTm1CK1p5Y2lHZ0JY?=
 =?utf-8?B?Z1U4dmpVNE04OEJrdzJ1RmJzRFhGcUNGVjcwMnN0bDZuTVBoMENWTk1XZWQ5?=
 =?utf-8?B?SDZVcVMxSElac09adFREU1dRUE1hNCtRd3NWZmJEUG1iUHV0dzBIeUU3SDQz?=
 =?utf-8?B?RzZJaTBSY2lJTWJOeXpBRVJTdFhFYWlTS0I0OEJTYjJUd1QydjZGdnBFNUNy?=
 =?utf-8?B?bFpjZERSWGhVTWRuaC9lZkNHclBYdThiVjZXM3k5WjUvMExqT1hEOTEvM3c2?=
 =?utf-8?B?ZUVnL2V2TnB4MndPaUpCN3BObStRUlNmanlrV21pQjgwK3kvdnRNTXJIRUtZ?=
 =?utf-8?B?ZUhiUFl0MVRnSDZzWE84ZWZlQTFueTIxSXJJemkvQ21wMnJVcjcrbGliZG51?=
 =?utf-8?B?TStjN28vZ0tjU3NzVlRqaVJoSDdDT0hZY0xvNlNaMnY3ZGpZK3h6bnNCeEJx?=
 =?utf-8?Q?vY0rCqhA/UA487+a8EtHXhXN/?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c40f9b9a-7733-4319-995d-08dc8b70f433
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2024 06:20:42.8859 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QkMi+L0KlKKgANbsxBrByLuYshvOurpugedgUOSZnRqo63nCz5nbV92s6JAJKJRs/QunFRuRGjBPh/xCnU7pb9PC8gOW3RwfgYY2NNXWw6M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7006
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

PiANCj4gSEVBRCBjb21taXQ6ICAgIDlkOTkwNDBiMWJjOCBBZGQgbGludXgtbmV4dCBzcGVjaWZp
YyBmaWxlcyBmb3IgMjAyNDA1MjkNCj4gZ2l0IHRyZWU6ICAgICAgIGxpbnV4LW5leHQNCj4gY29u
c29sZStzdHJhY2U6IGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29tL3gvbG9nLnR4dD94PTE0
YzA4M2U2OTgwMDAwDQo+IGtlcm5lbCBjb25maWc6ICBodHRwczovL3N5emthbGxlci5hcHBzcG90
LmNvbS94Ly5jb25maWc/eD03MzVlOTUzZmVlMDBlYzE5DQo+IGRhc2hib2FyZCBsaW5rOg0KPiBo
dHRwczovL3N5emthbGxlci5hcHBzcG90LmNvbS9idWc/ZXh0aWQ9NDBjN2RhZDI3MjY3ZjYxODM5
ZDQNCj4gY29tcGlsZXI6ICAgICAgIERlYmlhbiBjbGFuZyB2ZXJzaW9uIDE1LjAuNiwgR05VIGxk
IChHTlUgQmludXRpbHMgZm9yIERlYmlhbikNCj4gMi40MA0KPiBzeXogcmVwcm86ICAgICAgaHR0
cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20veC9yZXByby5zeXo/eD0xNzZiNzlkMjk4MDAwMA0K
PiBDIHJlcHJvZHVjZXI6ICAgaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20veC9yZXByby5j
P3g9MTAyNjZlYWE5ODAwMDANCj4gDQo+IERvd25sb2FkYWJsZSBhc3NldHM6DQo+IGRpc2sgaW1h
Z2U6IGh0dHBzOi8vc3RvcmFnZS5nb29nbGVhcGlzLmNvbS9zeXpib3QtDQo+IGFzc2V0cy9mMGRl
ZWIyN2IyOGIvZGlzay05ZDk5MDQwYi5yYXcueHoNCj4gdm1saW51eDogaHR0cHM6Ly9zdG9yYWdl
Lmdvb2dsZWFwaXMuY29tL3N5emJvdC0NCj4gYXNzZXRzLzVhY2QyMjA1Y2VlMS92bWxpbnV4LTlk
OTkwNDBiLnh6DQo+IGtlcm5lbCBpbWFnZTogaHR0cHM6Ly9zdG9yYWdlLmdvb2dsZWFwaXMuY29t
L3N5emJvdC0NCj4gYXNzZXRzLzIyMmVlYmI2YjlkOC9iekltYWdlLTlkOTkwNDBiLnh6DQo+IA0K
PiBJTVBPUlRBTlQ6IGlmIHlvdSBmaXggdGhlIGlzc3VlLCBwbGVhc2UgYWRkIHRoZSBmb2xsb3dp
bmcgdGFnIHRvIHRoZSBjb21taXQ6DQo+IFJlcG9ydGVkLWJ5OiBzeXpib3QrNDBjN2RhZDI3MjY3
ZjYxODM5ZDRAc3l6a2FsbGVyLmFwcHNwb3RtYWlsLmNvbQ0KPiANCj4gT29wczogZ2VuZXJhbCBw
cm90ZWN0aW9uIGZhdWx0LCBwcm9iYWJseSBmb3Igbm9uLWNhbm9uaWNhbCBhZGRyZXNzDQo+IDB4
ZGZmZmZjMDAwMDAwMDAwMTogMDAwMCBbIzFdIFBSRUVNUFQgU01QIEtBU0FOIFBUSQ0KPiBLQVNB
TjogbnVsbC1wdHItZGVyZWYgaW4gcmFuZ2UgWzB4MDAwMDAwMDAwMDAwMDAwOC0weDAwMDAwMDAw
MDAwMDAwMGZdDQo+IENQVTogMSBQSUQ6IDUxMDEgQ29tbTogc3l6LWV4ZWN1dG9yNDc5IE5vdCB0
YWludGVkIDYuMTAuMC1yYzEtbmV4dC0NCj4gMjAyNDA1Mjktc3l6a2FsbGVyICMwIEhhcmR3YXJl
IG5hbWU6IEdvb2dsZSBHb29nbGUgQ29tcHV0ZQ0KPiBFbmdpbmUvR29vZ2xlIENvbXB1dGUgRW5n
aW5lLCBCSU9TIEdvb2dsZSAwNC8wMi8yMDI0DQo+IFJJUDogMDAxMDpQYWdlVGFpbCBpbmNsdWRl
L2xpbnV4L3BhZ2UtZmxhZ3MuaDoyODQgW2lubGluZV0NCj4gUklQOiAwMDEwOmNvbnN0X2ZvbGlv
X2ZsYWdzIGluY2x1ZGUvbGludXgvcGFnZS1mbGFncy5oOjMxMiBbaW5saW5lXQ0KPiBSSVA6IDAw
MTA6Zm9saW9fdGVzdF9oZWFkIGluY2x1ZGUvbGludXgvcGFnZS1mbGFncy5oOjgzNyBbaW5saW5l
XQ0KPiBSSVA6IDAwMTA6Zm9saW9fdGVzdF9sYXJnZSBpbmNsdWRlL2xpbnV4L3BhZ2UtZmxhZ3Mu
aDo4NTggW2lubGluZV0NCj4gUklQOiAwMDEwOmZvbGlvX25yX3BhZ2VzIGluY2x1ZGUvbGludXgv
bW0uaDoyMDc2IFtpbmxpbmVdDQo+IFJJUDogMDAxMDp1ZG1hYnVmX2NyZWF0ZSsweGE1NC8weDEx
YzAgZHJpdmVycy9kbWEtYnVmL3VkbWFidWYuYzozNzYNCj4gQ29kZTogMDEgMDAgMDAgNDggOGIg
NDQgMjQgNzAgNDIgODAgM2MgMjggMDAgNDggOGIgNWMgMjQgNjggNzQgMDggNDggODkgZGYgZTgN
Cj4gOWEgNjMgZWQgZmIgNGMgOGIgM2IgNDkgOGQgNWYgMDggNDggODkgZDggNDggYzEgZTggMDMg
PDQyPiA4MCAzYyAyOCAwMCA3NCAwOA0KPiA0OCA4OSBkZiBlOCA3ZCA2MyBlZCBmYiA0OCA4YiAx
YiA0OCA4OSBkZSA0OA0KPiBSU1A6IDAwMTg6ZmZmZmM5MDAwMzU3ZmJlMCBFRkxBR1M6IDAwMDEw
MjAyDQo+IFJBWDogMDAwMDAwMDAwMDAwMDAwMSBSQlg6IDAwMDAwMDAwMDAwMDAwMDggUkNYOiBk
ZmZmZmMwMDAwMDAwMDAwDQo+IFJEWDogMDAwMDAwMDAwMDAwMDAwMCBSU0k6IGZmZmY4ODgwMjIy
MDcwMjggUkRJOiBmZmZmODg4MDI5NWVlMjQ4DQo+IFJCUDogZmZmZmM5MDAwMzU3ZmQ3MCBSMDg6
IGZmZmZmZmZmOGZhZDhkYWYgUjA5OiAxZmZmZmZmZmYxZjViMWI1DQo+IFIxMDogZGZmZmZjMDAw
MDAwMDAwMCBSMTE6IGZmZmZmYmZmZjFmNWIxYjYgUjEyOiAwMDAwMDAwMDAwMDAwMDAxDQo+IFIx
MzogZGZmZmZjMDAwMDAwMDAwMCBSMTQ6IGZmZmY4ODgwMjIyMDcwMjggUjE1OiAwMDAwMDAwMDAw
MDAwMDAwDQo+IEZTOiAgMDAwMDU1NTU2NDVhOTQ4MCgwMDAwKSBHUzpmZmZmODg4MGI5NTAwMDAw
KDAwMDApDQo+IGtubEdTOjAwMDAwMDAwMDAwMDAwMDANCj4gQ1M6ICAwMDEwIERTOiAwMDAwIEVT
OiAwMDAwIENSMDogMDAwMDAwMDA4MDA1MDAzMw0KPiBDUjI6IDAwMDA3ZmVlZTdjMGYwZDAgQ1Iz
OiAwMDAwMDAwMDIyYjI2MDAwIENSNDogMDAwMDAwMDAwMDM1MDZmMA0KPiBEUjA6IDAwMDAwMDAw
MDAwMDAwMDAgRFIxOiAwMDAwMDAwMDAwMDAwMDAwIERSMjogMDAwMDAwMDAwMDAwMDAwMA0KPiBE
UjM6IDAwMDAwMDAwMDAwMDAwMDAgRFI2OiAwMDAwMDAwMGZmZmUwZmYwIERSNzogMDAwMDAwMDAw
MDAwMDQwMCBDYWxsDQo+IFRyYWNlOg0KPiAgPFRBU0s+DQo+ICB1ZG1hYnVmX2lvY3RsX2NyZWF0
ZSBkcml2ZXJzL2RtYS1idWYvdWRtYWJ1Zi5jOjQyMCBbaW5saW5lXQ0KPiAgdWRtYWJ1Zl9pb2N0
bCsweDMwNC8weDRmMCBkcml2ZXJzL2RtYS1idWYvdWRtYWJ1Zi5jOjQ1MSAgdmZzX2lvY3RsDQo+
IGZzL2lvY3RsLmM6NTEgW2lubGluZV0gIF9fZG9fc3lzX2lvY3RsIGZzL2lvY3RsLmM6OTA3IFtp
bmxpbmVdDQo+ICBfX3NlX3N5c19pb2N0bCsweGZjLzB4MTcwIGZzL2lvY3RsLmM6ODkzDQo+ICBk
b19zeXNjYWxsX3g2NCBhcmNoL3g4Ni9lbnRyeS9jb21tb24uYzo1MiBbaW5saW5lXQ0KPiAgZG9f
c3lzY2FsbF82NCsweGYzLzB4MjMwIGFyY2gveDg2L2VudHJ5L2NvbW1vbi5jOjgzDQo+IGVudHJ5
X1NZU0NBTExfNjRfYWZ0ZXJfaHdmcmFtZSsweDc3LzB4N2YNCj4gUklQOiAwMDMzOjB4N2ZlZWU3
Yjk4MWI5DQo+IENvZGU6IDI4IDAwIDAwIDAwIDc1IDA1IDQ4IDgzIGM0IDI4IGMzIGU4IGMxIDE3
IDAwIDAwIDkwIDQ4IDg5IGY4IDQ4IDg5IGY3IDQ4DQo+IDg5IGQ2IDQ4IDg5IGNhIDRkIDg5IGMy
IDRkIDg5IGM4IDRjIDhiIDRjIDI0IDA4IDBmIDA1IDw0OD4gM2QgMDEgZjAgZmYgZmYgNzMgMDEN
Cj4gYzMgNDggYzcgYzEgYjggZmYgZmYgZmYgZjcgZDggNjQgODkgMDEgNDgNCj4gUlNQOiAwMDJi
OjAwMDA3ZmZkYTU0OTU3ZTggRUZMQUdTOiAwMDAwMDI0NiBPUklHX1JBWDoNCj4gMDAwMDAwMDAw
MDAwMDAxMA0KPiBSQVg6IGZmZmZmZmZmZmZmZmZmZGEgUkJYOiAwMDAwMDAwMDAwMDAwMDAwIFJD
WDogMDAwMDdmZWVlN2I5ODFiOQ0KPiBSRFg6IDAwMDAwMDAwMjAwMDAyYzAgUlNJOiAwMDAwMDAw
MDQwMTg3NTQyIFJESTogMDAwMDAwMDAwMDAwMDAwMw0KPiBSQlA6IDAwMDAwMDAwMDAwMDAwMDAg
UjA4OiAwMDAwMDAwMDAwMDAwMDAxIFIwOTogMDAwMDAwMDAwMDAwMDAwMQ0KPiBSMTA6IDAwMDAw
MDAwMDAwMDAwMDEgUjExOiAwMDAwMDAwMDAwMDAwMjQ2IFIxMjogMDAwMDAwMDAwMDAwMDAwMQ0K
PiBSMTM6IDQzMWJkZTgyZDdiNjM0ZGIgUjE0OiAwMDAwN2ZmZGE1NDk1ODIwIFIxNTogMDAwMDAw
MDAwMDAwMDAwMQ0KPiA8L1RBU0s+IE1vZHVsZXMgbGlua2VkIGluOg0KPiAtLS1bIGVuZCB0cmFj
ZSAwMDAwMDAwMDAwMDAwMDAwIF0tLS0NCj4gUklQOiAwMDEwOlBhZ2VUYWlsIGluY2x1ZGUvbGlu
dXgvcGFnZS1mbGFncy5oOjI4NCBbaW5saW5lXQ0KPiBSSVA6IDAwMTA6Y29uc3RfZm9saW9fZmxh
Z3MgaW5jbHVkZS9saW51eC9wYWdlLWZsYWdzLmg6MzEyIFtpbmxpbmVdDQo+IFJJUDogMDAxMDpm
b2xpb190ZXN0X2hlYWQgaW5jbHVkZS9saW51eC9wYWdlLWZsYWdzLmg6ODM3IFtpbmxpbmVdDQo+
IFJJUDogMDAxMDpmb2xpb190ZXN0X2xhcmdlIGluY2x1ZGUvbGludXgvcGFnZS1mbGFncy5oOjg1
OCBbaW5saW5lXQ0KPiBSSVA6IDAwMTA6Zm9saW9fbnJfcGFnZXMgaW5jbHVkZS9saW51eC9tbS5o
OjIwNzYgW2lubGluZV0NCj4gUklQOiAwMDEwOnVkbWFidWZfY3JlYXRlKzB4YTU0LzB4MTFjMCBk
cml2ZXJzL2RtYS1idWYvdWRtYWJ1Zi5jOjM3Ng0KPiBDb2RlOiAwMSAwMCAwMCA0OCA4YiA0NCAy
NCA3MCA0MiA4MCAzYyAyOCAwMCA0OCA4YiA1YyAyNCA2OCA3NCAwOCA0OCA4OSBkZiBlOA0KPiA5
YSA2MyBlZCBmYiA0YyA4YiAzYiA0OSA4ZCA1ZiAwOCA0OCA4OSBkOCA0OCBjMSBlOCAwMyA8NDI+
IDgwIDNjIDI4IDAwIDc0IDA4DQo+IDQ4IDg5IGRmIGU4IDdkIDYzIGVkIGZiIDQ4IDhiIDFiIDQ4
IDg5IGRlIDQ4DQo+IFJTUDogMDAxODpmZmZmYzkwMDAzNTdmYmUwIEVGTEFHUzogMDAwMTAyMDIN
Cj4gUkFYOiAwMDAwMDAwMDAwMDAwMDAxIFJCWDogMDAwMDAwMDAwMDAwMDAwOCBSQ1g6IGRmZmZm
YzAwMDAwMDAwMDANCj4gUkRYOiAwMDAwMDAwMDAwMDAwMDAwIFJTSTogZmZmZjg4ODAyMjIwNzAy
OCBSREk6IGZmZmY4ODgwMjk1ZWUyNDgNCj4gUkJQOiBmZmZmYzkwMDAzNTdmZDcwIFIwODogZmZm
ZmZmZmY4ZmFkOGRhZiBSMDk6IDFmZmZmZmZmZjFmNWIxYjUNCj4gUjEwOiBkZmZmZmMwMDAwMDAw
MDAwIFIxMTogZmZmZmZiZmZmMWY1YjFiNiBSMTI6IDAwMDAwMDAwMDAwMDAwMDENCj4gUjEzOiBk
ZmZmZmMwMDAwMDAwMDAwIFIxNDogZmZmZjg4ODAyMjIwNzAyOCBSMTU6IDAwMDAwMDAwMDAwMDAw
MDANCj4gRlM6ICAwMDAwNTU1NTY0NWE5NDgwKDAwMDApIEdTOmZmZmY4ODgwYjk0MDAwMDAoMDAw
MCkNCj4ga25sR1M6MDAwMDAwMDAwMDAwMDAwMA0KPiBDUzogIDAwMTAgRFM6IDAwMDAgRVM6IDAw
MDAgQ1IwOiAwMDAwMDAwMDgwMDUwMDMzDQo+IENSMjogMDAwMDAwMDAwMDVmZGViOCBDUjM6IDAw
MDAwMDAwMjJiMjYwMDAgQ1I0OiAwMDAwMDAwMDAwMzUwNmYwDQo+IERSMDogMDAwMDAwMDAwMDAw
MDAwMCBEUjE6IDAwMDAwMDAwMDAwMDAwMDAgRFIyOiAwMDAwMDAwMDAwMDAwMDAwDQo+IERSMzog
MDAwMDAwMDAwMDAwMDAwMCBEUjY6IDAwMDAwMDAwZmZmZTBmZjAgRFI3OiAwMDAwMDAwMDAwMDAw
NDAwDQo+IC0tLS0tLS0tLS0tLS0tLS0NCj4gQ29kZSBkaXNhc3NlbWJseSAoYmVzdCBndWVzcyk6
DQo+ICAgIDA6CTAxIDAwICAgICAgICAgICAgICAgIAlhZGQgICAgJWVheCwoJXJheCkNCj4gICAg
MjoJMDAgNDggOGIgICAgICAgICAgICAgCWFkZCAgICAlY2wsLTB4NzUoJXJheCkNCj4gICAgNToJ
NDQgMjQgNzAgICAgICAgICAgICAgCXJleC5SIGFuZCAkMHg3MCwlYWwNCj4gICAgODoJNDIgODAg
M2MgMjggMDAgICAgICAgCWNtcGIgICAkMHgwLCglcmF4LCVyMTMsMSkNCj4gICAgZDoJNDggOGIg
NWMgMjQgNjggICAgICAgCW1vdiAgICAweDY4KCVyc3ApLCVyYngNCj4gICAxMjoJNzQgMDggICAg
ICAgICAgICAgICAgCWplICAgICAweDFjDQo+ICAgMTQ6CTQ4IDg5IGRmICAgICAgICAgICAgIAlt
b3YgICAgJXJieCwlcmRpDQo+ICAgMTc6CWU4IDlhIDYzIGVkIGZiICAgICAgIAljYWxsICAgMHhm
YmVkNjNiNg0KPiAgIDFjOgk0YyA4YiAzYiAgICAgICAgICAgICAJbW92ICAgICglcmJ4KSwlcjE1
DQo+ICAgMWY6CTQ5IDhkIDVmIDA4ICAgICAgICAgIAlsZWEgICAgMHg4KCVyMTUpLCVyYngNCj4g
ICAyMzoJNDggODkgZDggICAgICAgICAgICAgCW1vdiAgICAlcmJ4LCVyYXgNCj4gICAyNjoJNDgg
YzEgZTggMDMgICAgICAgICAgCXNociAgICAkMHgzLCVyYXgNCj4gKiAyYToJNDIgODAgM2MgMjgg
MDAgICAgICAgCWNtcGIgICAkMHgwLCglcmF4LCVyMTMsMSkgPC0tIHRyYXBwaW5nDQo+IGluc3Ry
dWN0aW9uDQo+ICAgMmY6CTc0IDA4ICAgICAgICAgICAgICAgIAlqZSAgICAgMHgzOQ0KPiAgIDMx
Ogk0OCA4OSBkZiAgICAgICAgICAgICAJbW92ICAgICVyYngsJXJkaQ0KPiAgIDM0OgllOCA3ZCA2
MyBlZCBmYiAgICAgICAJY2FsbCAgIDB4ZmJlZDYzYjYNCj4gICAzOToJNDggOGIgMWIgICAgICAg
ICAgICAgCW1vdiAgICAoJXJieCksJXJieA0KPiAgIDNjOgk0OCA4OSBkZSAgICAgICAgICAgICAJ
bW92ICAgICVyYngsJXJzaQ0KPiAgIDNmOgk0OCAgICAgICAgICAgICAgICAgICAJcmV4LlcNCj4g
DQo+IA0KPiAtLS0NCj4gSWYgeW91IHdhbnQgc3l6Ym90IHRvIHJ1biB0aGUgcmVwcm9kdWNlciwg
cmVwbHkgd2l0aDoNCj4gI3N5eiB0ZXN0OiBnaXQ6Ly9yZXBvL2FkZHJlc3MuZ2l0IGJyYW5jaC1v
ci1jb21taXQtaGFzaCBJZiB5b3UgYXR0YWNoIG9yDQo+IHBhc3RlIGEgZ2l0IHBhdGNoLCBzeXpi
b3Qgd2lsbCBhcHBseSBpdCBiZWZvcmUgdGVzdGluZy4NCg0KI3N5eiB0ZXN0OiBodHRwczovL2dp
dGxhYi5mcmVlZGVza3RvcC5vcmcvVml2ZWsvZHJtLXRpcC5naXQgc3l6Ym90X2ZpeGVzDQoNCg==

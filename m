Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0FFB00BC2
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 21:00:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D565D10E951;
	Thu, 10 Jul 2025 19:00:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jYQGPJh4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE00710E952;
 Thu, 10 Jul 2025 19:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752174043; x=1783710043;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=SWr66t2lH3abLoJFijVWNAjaqyyB9HpB0rGxmAE+n3Q=;
 b=jYQGPJh4X6+Zl/b4617khaXEGiVSrit946VFw/heVe8KdF/STHaW9F7s
 LYFtgv1jYbt08LjeAf7S1H3LGZpKa3tE6En/8x43Z7lo9e8mq/ker2xu1
 kIPgrcZMc85a7uuK0to3S+L9EydfhvVIWA1qiHXMvagbToeQR0Jl71O0P
 hFv/2xiaC2CbpOiijItV05OCXLgkeWZIzE2fFOSR1MfzUd0AW7yOV2BRA
 T1ccciHTjniYYlfQTy2UjNV+g2XxWR/TLFBrEODiJAt49oYt3FZ6Mq0fZ
 3kZQM2g0Y/JpGeRYHtWBQ1dmpS9v2YzwLcKiEA2322y5u01rFuDH31wnb g==;
X-CSE-ConnectionGUID: 20fezrwVTAKWCh+UQkpLmw==
X-CSE-MsgGUID: eZg53BB0QOGhcZeRnPGYhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="42100368"
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="42100368"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 12:00:36 -0700
X-CSE-ConnectionGUID: RwNZK21tSfW8WQP/zruZnQ==
X-CSE-MsgGUID: YWaX4iMOSUuhE9+ZjO93Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="156515999"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 12:00:31 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 12:00:28 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 10 Jul 2025 12:00:28 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.88)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 12:00:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wCTFG0Z8I2eDwJlOiI1bQ/kDkHDuJJRKlyXl/E7o0Mqxm9SN0KnEKJVcYZVZMMCADqMk8WU9Rd71szA+kn/lMfIIqOncHtJ4k4SvdW26snYI3eXC+1/LrzqBPAbXmwggufgKl4xYutH2QJ382VR++jngyomMffWgZybV6svfDXiil1uUBDIgOH4m3Fi5oN2dsQo2SuOnDlkd6xadt3HRIN6+K8ootDFxwbLf0nKtwgDVG9hpkiR3TuBGOdcwhhraJBuHhcMcC/uxVK0WH0dFojpaTKBvG5OTvZdz45919VWE1D8t8+w+oh2w5j9ziljeD9t5aukeTlrrT4U1oEQCeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/vNbww2x+1oV+7NrtOMe9WREuDj8U9q7RZP35IAuQ7Y=;
 b=t+6VsnpeUP9W4G526a6wz3htU9zqz5rEOTIRFxpX+LkXcZRtW9Jbp8/zyqkydFCYHJB5KMlN7zmYcxHHznm5LjFpQGbXUlXe94ssNq1UwvHB2elZzP+UPYnYdY2K7U09Wb430vObgX5mfXrVZj9BUUM52o0GzIqy7US+ldL5uC3RNhpzVAXkf+nB5emMbSYC0iQRqChV4Eot9fspORr0hP0JJfZ6i4HslLSp8lgmCBLmYzeoGQZpLmo+POoSemQSnUXl83y9nzHwjd4z8GLB+eTSa4Jgbl9nJdst1fFUg5SBrn4/L5LjykJhydfrJrzI0st886JNGtElt/pQX417Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SN7PR11MB6873.namprd11.prod.outlook.com (2603:10b6:806:2a4::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Thu, 10 Jul
 2025 19:00:11 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8901.024; Thu, 10 Jul 2025
 19:00:11 +0000
Date: Thu, 10 Jul 2025 15:00:06 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, "Simona
 Vetter" <simona.vetter@ffwll.ch>, Riana Tauro <riana.tauro@intel.com>,
 <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <umesh.nerlige.ramappa@intel.com>, <frank.scarbrough@intel.com>,
 <sk.anirban@intel.com>, =?iso-8859-1?Q?Andr=E9?= Almeida
 <andrealmeid@igalia.com>, David Airlie <airlied@gmail.com>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v4 1/9] drm: Add a vendor-specific recovery method to
 device wedged uevent
Message-ID: <aHANtkxkhI4_Nb6R@intel.com>
References: <20250709112024.1053710-1-riana.tauro@intel.com>
 <20250709112024.1053710-2-riana.tauro@intel.com>
 <aG5xglf8BeGzleWM@phenom.ffwll.local>
 <d42e17ef-30ce-4bf1-9948-7f08fd6f3bac@amd.com>
 <aG56Trd1h5WbWYJt@black.fi.intel.com> <aG6eNcygPshsSlC8@intel.com>
 <aG-BcFN6M9BtjB2j@phenom.ffwll.local>
 <cd206f9e-be53-4b22-a166-ed18fa9b833a@amd.com>
 <aG-U9JTXDah_tu1U@black.fi.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aG-U9JTXDah_tu1U@black.fi.intel.com>
X-ClientProxiedBy: SJ0PR13CA0228.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::23) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SN7PR11MB6873:EE_
X-MS-Office365-Filtering-Correlation-Id: 1695ee2d-b631-48f8-2cdc-08ddbfe3fecb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Y2O0Wpsd1P+IdQz2gYaMAq4c9pS1sCS7t07b4L/qLQnCrYe4u15zCUBmY1?=
 =?iso-8859-1?Q?7SUbwjY30IYtiX56KvjieRv0pIu5z7F64XucE664qxgUQ993AQDy//MF2Z?=
 =?iso-8859-1?Q?odnejZvlRp8TaKPFCV7wC7O/KMq4fOmJwnnP3cqMF3LEuVs53Bae1mmMxO?=
 =?iso-8859-1?Q?qFXah5+OOh+oT2h36JGFOyTi4b+Da03hSiUTOJ0xvu8vDL+Ji9Utipk16o?=
 =?iso-8859-1?Q?U67VsCE62sJp74J5Pli14ZAdbC8T/lnGUvpHVdH4iaeXHnXQ4RBG8G0QR6?=
 =?iso-8859-1?Q?aOo7u7KmqBPFq3FZ3ja2qVY9UNkjnb47vQAN2psv+RF00euyQMqO9u38EC?=
 =?iso-8859-1?Q?4zscuKFwWTTfQ590DdUwD6yEkkdVeKcaUVVvruBfMy3M2SP0+znYWjwsO0?=
 =?iso-8859-1?Q?/omKxFC3pB3UnYvk5fkguihuo7K8HQb4rlvl6P6QeGaHAvED+ya8FFXB7B?=
 =?iso-8859-1?Q?sUvnLnlUnm6UOczx/fXsnKr+o88fZf87TWGGYeaRFQj/U/NXelJvli6nRm?=
 =?iso-8859-1?Q?q5tBDe/Nhn1bS3/9ECDdT3E8IGrXREEIP/UFNTLCGEzuxHN6GumHcVAJox?=
 =?iso-8859-1?Q?ngyF6JZZldS6ViX+YKVvy6Q2McEFQ2EMyt5LiZxGQ4gTYOdghHJLPsmmPZ?=
 =?iso-8859-1?Q?3h5JO6kT62bPzNpgCgr50QRr3clvjoifbvuvfVQ8SYt2Xk5DQEVy37M3YM?=
 =?iso-8859-1?Q?RmqRikvQVOUKfC/B+ucdmTH6IACMPwYvzupHzK5vbqi/5iz5FyCy4YG9fF?=
 =?iso-8859-1?Q?z4rVaO0ekKsx3MTN5cSmE3tkU/bDPKb1sqzIsWjPonsCzSc7jlUI8nNDk5?=
 =?iso-8859-1?Q?jdPgNrP81NfVEbLMZ2dH28qGQnf3ybMNRjZnykGZlyBmpkYXz3KQDWbp7E?=
 =?iso-8859-1?Q?RvUeYYXoZ/yHJbOYXlQqxxoIPYUhHYOfvi2Zy0c6SFZNocI+DSk9XLeost?=
 =?iso-8859-1?Q?ZtMljj4jwCzAY/D24/0A2CPjDItOwq34FbERIg5OKr17Ik9zyEZLSta1H+?=
 =?iso-8859-1?Q?kQQgs5p6b00GSKCuiO84aSbyLKC7qszIRZpyGPUFW9a8nkC0hktHq3ikNU?=
 =?iso-8859-1?Q?6Ei82Otjn+xbimRJ01DDXRLQfHVPXlHpgfLOhnccpWsTmIpS9FTezY2ufU?=
 =?iso-8859-1?Q?pXVSYgoPSTQOuafkorJk54TaSgCmgT9yQ4RqRoSMPIPMrL9vJWIikVGo6k?=
 =?iso-8859-1?Q?kdRuyxpPi21Xq6zsKmESE62BUQck2VjS2kNITWxC+1E9c2L6Fxgv5rrVUi?=
 =?iso-8859-1?Q?Tbl8sY/kQehyVfeZdO1XBqtAB4JFCC8o+H67Z+3t+hbHm8AAvv1PLQ6lKY?=
 =?iso-8859-1?Q?5mPS3d6STc1JiiAanRqt5CZmvpiYVFEDTHrGsdsd1rEGqwbgu7vD4CAmYK?=
 =?iso-8859-1?Q?2SK1whSBDD7pX2mXNZL8NWrUGnoCZKWZ2XaW9NAbFH+ucIIdtsDVrlQhyS?=
 =?iso-8859-1?Q?20fukvGm+6utKqjBDpR45oQENrn2YMNQKiWdxd2+x6Go0L7FVZiVszmERh?=
 =?iso-8859-1?Q?U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?rFRVcVsw8BXIma7uEP2yp/sWw5jORIYHCWC9GOKBkx9dHnP2Up05NcVgid?=
 =?iso-8859-1?Q?UgasvQa5P/a8UHVmg2ctNPtkGlRGiES0QWCBpFOSyYH7Awo1Q9a7YZfIh4?=
 =?iso-8859-1?Q?6CpZFz22TnMiyOXzZ8CkmoXVtBTPVhvnMm8XXxEd5KHZXNdGsBKzelgqnA?=
 =?iso-8859-1?Q?jLAjBKLwV87zxoLPfddX/EAma9kcI3PDSUFTNnb1zXmjvoJs4ozH7sWCdp?=
 =?iso-8859-1?Q?NwCJjkBJS1uxr8JEKN7UNxlx3RUxv+gLxs4eXjTb4e4RFO2ViB+BcVa/KO?=
 =?iso-8859-1?Q?fxj4ml/TlTb18E1EdPKmHmLErkXGlvZqKt4eIWhNOdRbE7Lv2tmRaApXpX?=
 =?iso-8859-1?Q?Qyl92i3Pm78P0gOLNXONHrQSsSXXkF1M5eg8az6/1qaqAKEzp5WOrc1JGh?=
 =?iso-8859-1?Q?umcbJJEnaPHbnu2WSNof844JAr35URU9sh2XdZVxOGSlHAUkenbaSnyQ5o?=
 =?iso-8859-1?Q?wQ7Ablb73tox1Aze9qeqmhnKmxaETiRWaD1sA+PVlpKQS0ghP0yb97h6Ju?=
 =?iso-8859-1?Q?BP2J/9KWrxeiN0JbpDfMPJpZpKf9jEuKgTEYx6K1y4bv+mdhL8k7eS6jhb?=
 =?iso-8859-1?Q?3z8BmGwQ0YpwESRfzf+0m4ILUj+vtYqgxS/ylV/NhHH6MuvbEtMS2LJQy6?=
 =?iso-8859-1?Q?adihYaVvb4qeI0timJBOX5AU1N/fJi+emCHYGaFvC51gIa370SR7TKjy0S?=
 =?iso-8859-1?Q?d04krYJbMAHVEt7ZvkHcCDr/tuJ6scwnr54L4B8lmFfbPtLlYGLsbwx18z?=
 =?iso-8859-1?Q?SZCoM7Bm/zzOFskF98g+F6ajkU4bHTLqKb43I1JpoT/1UnnMenX4EzbAy4?=
 =?iso-8859-1?Q?g2H2BL5dN7HedmYp4SW1eTtclRjQWxro/dGd7U1D75xjWswkkl71iFdoI5?=
 =?iso-8859-1?Q?BXKvy7dCYEsEVzR1EXdmCvxtqUW6H1vCkwe+lHsegaWtvqrX/qtBGceTRm?=
 =?iso-8859-1?Q?tAKiYqLXpMe7AGlbA2TtkJviO2l8NX2RMyEN2r4G/TJtNcA6kgt+Ppd+yf?=
 =?iso-8859-1?Q?JPBO6IcUvDDTjG2oeULGteitLmz4SbIZ7d78sHWCCNyBlUM0IP9SPV79GN?=
 =?iso-8859-1?Q?/UHbvWSNBu2PXVN4/ba01SBmHMy7pVgJXSPnwyLmsH2B6XXprpXE72dpT8?=
 =?iso-8859-1?Q?NAYZJK58o9cv/iVlz2EqJ692/xxzT/513w0awmWxoV031tYz2keA/m+Fwr?=
 =?iso-8859-1?Q?aM32SLxdhvillmtkgxVjl4FBvdjbJmEKzn1YVMzbcVjlXMlRquTr2TYNTy?=
 =?iso-8859-1?Q?6T9hN9Nm4TbFn3Z2mg+xJYv0G2CKNnGVtMM2Xk0acxVHkz9w4tYMPXUWmT?=
 =?iso-8859-1?Q?3ckWjyhn1thH7Y38Bv2EIdUiAJGHXqN6lVviz/P7idGgfG3M2ul7R1iNAB?=
 =?iso-8859-1?Q?+v2ijGnbIWc7lNNz1kdx5uUbWr+A+LIokb/DR+utKQK0xHnWSyaT9niC5B?=
 =?iso-8859-1?Q?3vpy2gNdKoICSBhJlwwG+FzQOe3/fpbo87/T7TopcqsftvXFmO1SkUAYUn?=
 =?iso-8859-1?Q?hBZR1vvHYvIlgolrQ/RetcCKCdtN5kBmuyYEQJujPKO+CpPcuHeJqJaWgf?=
 =?iso-8859-1?Q?Q0lgzmgYAnP5JMvzYwqt4uQUjZjVOxAVY4tOEt+FnZztw2nK9iBF+lzwiq?=
 =?iso-8859-1?Q?sfTjokQsZtSZSmZh1L/T91AwBZhnSiCKF4Y+eAe60bO3x8RqwBc1ZnPQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1695ee2d-b631-48f8-2cdc-08ddbfe3fecb
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 19:00:11.2089 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WDVk8Q/zhFx9JZ8zOtJiH8urgZflwB+Ol3LAxXsPaDZWAZRzQ5iejznvglT9cpy7NZXitW+mOb8AavwaRyQqOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6873
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

On Thu, Jul 10, 2025 at 01:24:52PM +0300, Raag Jadav wrote:
> On Thu, Jul 10, 2025 at 11:37:14AM +0200, Christian König wrote:
> > On 10.07.25 11:01, Simona Vetter wrote:
> > > On Wed, Jul 09, 2025 at 12:52:05PM -0400, Rodrigo Vivi wrote:
> > >> On Wed, Jul 09, 2025 at 05:18:54PM +0300, Raag Jadav wrote:
> > >>> On Wed, Jul 09, 2025 at 04:09:20PM +0200, Christian König wrote:
> > >>>> On 09.07.25 15:41, Simona Vetter wrote:
> > >>>>> On Wed, Jul 09, 2025 at 04:50:13PM +0530, Riana Tauro wrote:
> > >>>>>> Certain errors can cause the device to be wedged and may
> > >>>>>> require a vendor specific recovery method to restore normal
> > >>>>>> operation.
> > >>>>>>
> > >>>>>> Add a recovery method 'WEDGED=vendor-specific' for such errors. Vendors
> > >>>>>> must provide additional recovery documentation if this method
> > >>>>>> is used.
> > >>>>>>
> > >>>>>> v2: fix documentation (Raag)
> > >>>>>>
> > >>>>>> Cc: André Almeida <andrealmeid@igalia.com>
> > >>>>>> Cc: Christian König <christian.koenig@amd.com>
> > >>>>>> Cc: David Airlie <airlied@gmail.com>
> > >>>>>> Cc: <dri-devel@lists.freedesktop.org>
> > >>>>>> Suggested-by: Raag Jadav <raag.jadav@intel.com>
> > >>>>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> > >>>>>
> > >>>>> I'm not really understanding what this is useful for, maybe concrete
> > >>>>> example in the form of driver code that uses this, and some tool or
> > >>>>> documentation steps that should be taken for recovery?
> > >>
> > >> The case here is when FW underneath identified something badly corrupted on
> > >> FW land and decided that only a firmware-flashing could solve the day and
> > >> raise interrupt to the driver. At that point we want to wedge, but immediately
> > >> hint the admin the recommended action.
> > >>
> > >>>>
> > >>>> The recovery method for this particular case is to flash in a new firmware.
> > >>>>
> > >>>>> The issues I'm seeing here is that eventually we'll get different
> > >>>>> vendor-specific recovery steps, and maybe even on the same device, and
> > >>>>> that leads us to an enumeration issue. Since it's just a string and an
> > >>>>> enum I think it'd be better to just allocate a new one every time there's
> > >>>>> a new strange recovery method instead of this opaque approach.
> > >>>>
> > >>>> That is exactly the opposite of what we discussed so far.
> > > 
> > > Sorry, I missed that context.
> > > 
> > >>>> The original idea was to add a firmware-flush recovery method which
> > >>>> looked a bit wage since it didn't give any information on what to do
> > >>>> exactly.
> > >>>>
> > >>>> That's why I suggested to add a more generic vendor-specific event
> > >>>> with refers to the documentation and system log to see what actually
> > >>>> needs to be done.
> > >>>>
> > >>>> Otherwise we would end up with events like firmware-flash, update FW
> > >>>> image A, update FW image B, FW version mismatch etc....
> > > 
> > > Yeah, that's kinda what I expect to happen, and we have enough numbers for
> > > this all to not be an issue.
> > > 
> > >>> Agree. Any newly allocated method that is specific to a vendor is going to
> > >>> be opaque anyway, since it can't be generic for all drivers. This just helps
> > >>> reduce the noise in DRM core.
> > >>>
> > >>> And yes, there could be different vendor-specific cases for the same driver
> > >>> and the driver should be able to provide the means to distinguish between
> > >>> them.
> > >>
> > >> Sim, what's your take on this then?
> > >>
> > >> Should we get back to the original idea of firmware-flash?
> > > 
> > > Maybe intel-firmware-flash or something, meaning prefix with the vendor?
> > > 
> > > The reason I think it should be specific is because I'm assuming you want
> > > to script this. And if you have a big fleet with different vendors, then
> > > "vendor-specific" doesn't tell you enough. But if it's something like
> > > $vendor-$magic_step then it does become scriptable, and we do have have a
> > > place to put some documentation on what you should do instead.
> > > 
> > > If the point of this interface isn't that it's scriptable, then I'm not
> > > sure why it needs to be an uevent?
> > 
> > You should probably read up on the previous discussion, cause that is exactly what I asked as well :)
> > 
> > And no, it should *not* be scripted. That would be a bit brave for a firmware update where you should absolutely not power down the system for example.

I also don't like the idea or even the thought of scripting something like
a firmware-flash. But only to fail with a better pin point to make admin
lives easier with a notification.

> > 
> > In my understanding the new value "vendor-specific" basically means it is a known issue with a documented solution, while "unknown" means the driver has no idea how to solve it.

Exactly, the hardware and firmware are giving the indication of what should be
done. It is not 'unknown'.

> 
> Yes, and since the recovery procedure is defined and known to the consumer,
> it can potentially be automated (atleast for non-firmware cases).
> 
> > > I guess if you all want to stick with vendor-specific then I think that's

Well, I would honestly prefer a direct firmware-flash, but if that is not
usable by other vendors and there's a push back on that, let's go with
the vendor-specific then.

> > > ok with me too, but the docs should at least explain how to figure out
> > > from the uevent which vendor you're on with a small example. What I'm
> > > worried is that if we have this on multiple drivers userspace will
> > > otherwise make a complete mess and might want to run the wrong recovery
> > > steps.
> 
> The device id along with driver can be identified from uevent (probably
> available inside DEVPATH somewhere) to distinguish the vendor. So the consumer
> already knows if the device fits the criteria for recovery.
> 
> > > I think ideally, no matter what, we'd have a concrete driver patch which
> > > then also comes with the documentation for what exactly you're supposed to
> > > do as something you can script. And not just this stand-alone patch here.
> 
> Perhaps the rest of the series didn't make it to dri-devel, which will answer
> most of the above.

Riana, could you please try to provide a bit more documentation like Sima
asked and re-send the entire series to dri-devel?

Thanks,
Rodrigo.

> 
> Raag
> 
> > >>>>>> ---
> > >>>>>>  Documentation/gpu/drm-uapi.rst | 9 +++++----
> > >>>>>>  drivers/gpu/drm/drm_drv.c      | 2 ++
> > >>>>>>  include/drm/drm_device.h       | 4 ++++
> > >>>>>>  3 files changed, 11 insertions(+), 4 deletions(-)
> > >>>>>>
> > >>>>>> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> > >>>>>> index 263e5a97c080..c33070bdb347 100644
> > >>>>>> --- a/Documentation/gpu/drm-uapi.rst
> > >>>>>> +++ b/Documentation/gpu/drm-uapi.rst
> > >>>>>> @@ -421,10 +421,10 @@ Recovery
> > >>>>>>  Current implementation defines three recovery methods, out of which, drivers
> > >>>>>>  can use any one, multiple or none. Method(s) of choice will be sent in the
> > >>>>>>  uevent environment as ``WEDGED=<method1>[,..,<methodN>]`` in order of less to
> > >>>>>> -more side-effects. If driver is unsure about recovery or method is unknown
> > >>>>>> -(like soft/hard system reboot, firmware flashing, physical device replacement
> > >>>>>> -or any other procedure which can't be attempted on the fly), ``WEDGED=unknown``
> > >>>>>> -will be sent instead.
> > >>>>>> +more side-effects. If recovery method is specific to vendor
> > >>>>>> +``WEDGED=vendor-specific`` will be sent and userspace should refer to vendor
> > >>>>>> +specific documentation for further recovery steps. If driver is unsure about
> > >>>>>> +recovery or method is unknown, ``WEDGED=unknown`` will be sent instead
> > >>>>>>  
> > >>>>>>  Userspace consumers can parse this event and attempt recovery as per the
> > >>>>>>  following expectations.
> > >>>>>> @@ -435,6 +435,7 @@ following expectations.
> > >>>>>>      none            optional telemetry collection
> > >>>>>>      rebind          unbind + bind driver
> > >>>>>>      bus-reset       unbind + bus reset/re-enumeration + bind
> > >>>>>> +    vendor-specific vendor specific recovery method
> > >>>>>>      unknown         consumer policy
> > >>>>>>      =============== ========================================
> > >>>>>>  
> > >>>>>> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> > >>>>>> index cdd591b11488..0ac723a46a91 100644
> > >>>>>> --- a/drivers/gpu/drm/drm_drv.c
> > >>>>>> +++ b/drivers/gpu/drm/drm_drv.c
> > >>>>>> @@ -532,6 +532,8 @@ static const char *drm_get_wedge_recovery(unsigned int opt)
> > >>>>>>  		return "rebind";
> > >>>>>>  	case DRM_WEDGE_RECOVERY_BUS_RESET:
> > >>>>>>  		return "bus-reset";
> > >>>>>> +	case DRM_WEDGE_RECOVERY_VENDOR:
> > >>>>>> +		return "vendor-specific";
> > >>>>>>  	default:
> > >>>>>>  		return NULL;
> > >>>>>>  	}
> > >>>>>> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> > >>>>>> index 08b3b2467c4c..08a087f149ff 100644
> > >>>>>> --- a/include/drm/drm_device.h
> > >>>>>> +++ b/include/drm/drm_device.h
> > >>>>>> @@ -26,10 +26,14 @@ struct pci_controller;
> > >>>>>>   * Recovery methods for wedged device in order of less to more side-effects.
> > >>>>>>   * To be used with drm_dev_wedged_event() as recovery @method. Callers can
> > >>>>>>   * use any one, multiple (or'd) or none depending on their needs.
> > >>>>>> + *
> > >>>>>> + * Refer to "Device Wedging" chapter in Documentation/gpu/drm-uapi.rst for more
> > >>>>>> + * details.
> > >>>>>>   */
> > >>>>>>  #define DRM_WEDGE_RECOVERY_NONE		BIT(0)	/* optional telemetry collection */
> > >>>>>>  #define DRM_WEDGE_RECOVERY_REBIND	BIT(1)	/* unbind + bind driver */
> > >>>>>>  #define DRM_WEDGE_RECOVERY_BUS_RESET	BIT(2)	/* unbind + reset bus device + bind */
> > >>>>>> +#define DRM_WEDGE_RECOVERY_VENDOR	BIT(3)	/* vendor specific recovery method */
> > >>>>>>  
> > >>>>>>  /**
> > >>>>>>   * struct drm_wedge_task_info - information about the guilty task of a wedge dev
> > >>>>>> -- 
> > >>>>>> 2.47.1
> > >>>>>>
> > >>>>>
> > >>>>
> > > 
> > 

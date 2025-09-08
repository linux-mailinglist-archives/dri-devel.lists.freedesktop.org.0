Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 313E2B498A4
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 20:47:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A26BB10E5AB;
	Mon,  8 Sep 2025 18:47:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eFpdKo5g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 638DE10E0C5;
 Mon,  8 Sep 2025 18:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757357263; x=1788893263;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=OQGzLgu9sKT0ntz1k/ky/yk5o4stZbGJA2gOSoMeDKE=;
 b=eFpdKo5g3eZN7xX3x4TXKIzRYXt7faa8Qhj47IftFB32U9folux25S8K
 yO2N8GQozFpe4r6EjdNfb4QMXRTXCvbGjlYSkqT/NaIPnQaVub/mVen/k
 luboYhLNaIZlZ/hiiyNclF3gJNMQpRPLSWTCFyVLewG5K8O/C1PlyrM7C
 wCGnk8XslZhWbtC6mojUdTVGZh8Pvi15jW83ii1KD6CffVyWH1IcYjNHt
 stx6qKJ5KaftZ3MtFr2T4kZWFseczQQgAA3jbo9z8N94SMCCKAeCmmT5e
 9fUQmA8OSY5ZHXxEKM6w2Q9yeqyC6ZaG4BVCRC5KEDFpnMmTox+QVsUDk A==;
X-CSE-ConnectionGUID: nh3xMjdKQmCQbNtDIiPMCg==
X-CSE-MsgGUID: PjiN0t0cQNC5PS7KPXGedg==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="70999362"
X-IronPort-AV: E=Sophos;i="6.18,249,1751266800"; d="scan'208";a="70999362"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 11:47:43 -0700
X-CSE-ConnectionGUID: 7AB7cMj7TF2wFCzjfWGHTA==
X-CSE-MsgGUID: oH0KH+gkShKKWoUvM1/e4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,249,1751266800"; d="scan'208";a="178079075"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 11:47:43 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 8 Sep 2025 11:47:42 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 8 Sep 2025 11:47:42 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.86)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 8 Sep 2025 11:47:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mwrOH8QZF5G6IwixAGTY/287UqIfmZmBsK4HF1a+EQVNOuo0DyHYVQrfb+mdBS9DOhUL82oeLkf1IqnnL8NE8Fk3EaApEmMdQcGM7k+Htsy3pJPPMpcf4g4XOtmA31w+vB9tgLIBj1WAGcquPHh1PTaEL9Yvq+5SLXaGuODbTF3kDaXd8NKVGrb+9Uw9E/wrpX2OO2ljds11T/lGKRfBki1W4udTfREWZPR2TDIGbwcZdqeJicu4QlOtT8Jp9wREwJxFSVjiPsa+uon8W1nDOBSJNar2keHJ3vSlOAqg13kt8d9Jphbm/pbGhOIKag/ipv5PWV1CYirlFqcfmfUUdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OQGzLgu9sKT0ntz1k/ky/yk5o4stZbGJA2gOSoMeDKE=;
 b=ftnNnWVbx0LrR6HzYa3Lq4CSdBl4YlBYQ+Uo5imeTVSKsH1NIxaz7rDpb5pCsmZqk71cMOBY/7XhxUuN2fIkgCrFc5LEDxe+keYqxrC3HMw9HNcfQwRUBTXxLdTZIz5Epi/85wvsDkOgQvidDvsMYhLul/n9pAJ5mTszOgdwYL53x5A/mM0K6+HQbnlQOciEKS3qeinlLe+EtLL8yx8xA+PYb3uYrP5ys2DauAL4Eki7ZoYMgOfMaRi5DRUhI7tfn1l4q/d6y+4dUNCd6pRlzejlDcSEubxD+WQMoMuRcleXVgDDRux27/tp8Q6B6U9veIDVRrSQMswHOhCeSOXhUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.22; Mon, 8 Sep 2025 18:47:34 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%3]) with mapi id 15.20.9094.021; Mon, 8 Sep 2025
 18:47:33 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "simona@ffwll.ch" <simona@ffwll.ch>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "christophe.jaillet@wanadoo.fr"
 <christophe.jaillet@wanadoo.fr>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>, "airlied@gmail.com" <airlied@gmail.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/xe/hwmon: Use devm_mutex_init()
Thread-Topic: [PATCH] drm/xe/hwmon: Use devm_mutex_init()
Thread-Index: AQHcH/1MyPVN9hM0Q0OcXSwUnH2RkrSJohYA
Date: Mon, 8 Sep 2025 18:47:33 +0000
Message-ID: <99686467b8d528b0bc9967989ef75df2fc6d1797.camel@intel.com>
References: <989e96369e9e1f8a44b816962917ec76877c912d.1757252520.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <989e96369e9e1f8a44b816962917ec76877c912d.1757252520.git.christophe.jaillet@wanadoo.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|CO1PR11MB5009:EE_
x-ms-office365-filtering-correlation-id: 390c4b05-e248-477e-b538-08ddef082c54
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?b09LRnd2Y3dxTE01N3RpZCtLeThUNzhzc3JkYWp1NS9HUkZPWDE0YzZaT1hk?=
 =?utf-8?B?TzVSYmREREJteGpaSTlSY0ZVanE5bFlLYVJ3QzRzWktHVnNDWUhUeWRnN2ZK?=
 =?utf-8?B?SEhKWHRiUDNRMHc5NWpVSVF1dG5NTXRJZ1lXeHZobEs2aHVYVkRuclNaOGox?=
 =?utf-8?B?ZDdWMHRJazBtZ215TTZad1hVbmJmQWpWay9hWlBKNjhpTEp0YTNtK2ZETFBS?=
 =?utf-8?B?MVd4cGRhWElXTzcrZEFHN05MRlErMFkyajl0SkI2Vzk5aGh6ZWdoblRCNHFx?=
 =?utf-8?B?eXAvSXo3T0R1d2ozc3NscmtmeDJrUktjNWJDQkJqczV3T2dYVFBNeTFOaTBO?=
 =?utf-8?B?YnNuZWp3Zmk3MzFadUlUbHh3dUszSkt5R2luSDkvMWQ1QVQxYmZ4djBPUmlw?=
 =?utf-8?B?UFpLSnIwZ09TbFlKbEdtYmNrSU5WMS9uejZiNFdtd0NmYXdwUTV6V3lMNE0r?=
 =?utf-8?B?c1Nsby9CV2htS0JzdTFaUThkS000NWMrWUFQQTBIZmRYYnhTKytEbXpGS245?=
 =?utf-8?B?WnpZQm5ZZ1FRSzRYQmZUbDBoTVNLcmovS3ZGUnJhamR0WUpNMjg5Rno0NG0v?=
 =?utf-8?B?Ri9kTklzU1lJVjVvVjFjRHFzTU5NbkErbTdVOTNhYmFoTmlMeS9uVHc2Tjlu?=
 =?utf-8?B?UW85RWVmNE1md0FEaEcyVmtUT0xpdWZEK0pOZ202WTVvLzR0KzdBa1lWeFZE?=
 =?utf-8?B?TVo1ckNWeHpNaDVCMWs5ZVJmdHFGRURKaFY5SnRsQVRtWnFyWExNY3dmZHFr?=
 =?utf-8?B?ZWFjeWdoQ2xYYnp4UG1vcUMxT1BEYzg5a3RJWmYreXlIako4NzNXVWl3dWx2?=
 =?utf-8?B?QmVZWUJiTGtkNlJJV0tLSnAvSitvZEw4SGJFNlUxYXpramZ0QUVLMlplN3Zt?=
 =?utf-8?B?TmRCY2NDSVU3V0N0TFdtQzdMSjRCeFZuemNvL3IwZFExK1dqMzgzSDdmUnBK?=
 =?utf-8?B?TXZnL0JTaUNqNUpVUWpwMjR0UUlMS0s3ZkFoRVpxMDlTODA5NzRUQVUvNXJr?=
 =?utf-8?B?V2ZyMmVBbGtjQXZSVjlzV1FQRUVQYUNPdDBjYWRmTmtRbzFsSkI3RlBERWhP?=
 =?utf-8?B?TUFxUm41cnJHa01ZOElMNWhMQ3NDanZrL0FMRytRcmJDSXdVODlnQk1pR1Bl?=
 =?utf-8?B?N3FRaFEwajhmc2tOdzhTbXhkQTFoNnhGdms2Z0wwVkx2MlZKb0VlZXdWTWEw?=
 =?utf-8?B?ZERDZE9Gd3VRU1RCNkhPT0RENG1iQXRUc3BIV2l0TzFaWE1tWWEzckdJeTdF?=
 =?utf-8?B?cXJmZVphaldtdlNXRmI5L3Nxa2M4V3hsWituNjRWOW1JcXlXSUNUM2l4akkx?=
 =?utf-8?B?aTdlb3kraWpxWVIxS2dEeW1uUGtCSHIybkVGeVFOS0xQOFNtNDQ2UTJwNW0w?=
 =?utf-8?B?dWN0eEpsV2NtbVgrSWl1Q0Rtd1JZRXdiWWdwK3YybUthQnhjYXpsbWg1bFdH?=
 =?utf-8?B?bWhBSGlwc0tUcFBpOUNpTklGZlJNZitwTUJ3aDNEVFN6L01MSjk1YlptbkNo?=
 =?utf-8?B?RzJzaXJPcCswMUNIWmdoY0JrVU11ZFl6Qjdyd3pRbkFUSW9RVlkzcVR2TjRC?=
 =?utf-8?B?eERyWG9NQTdjWitSOE5seGw4czFHaDQwa2ZkQzFBUi8yM20zQjh4VTRKS0d0?=
 =?utf-8?B?WGZBVklHN2dLdUltbWo5U1BMQ1M0QVdNVlRBTlZxSjdTS1VYOWpadVNKMkhs?=
 =?utf-8?B?RTJSVGtnN0ViOXNLTlBvekZ4bDNXbVFKcEZIY3dYOXBKUDNBWnpLUnJmZzdT?=
 =?utf-8?B?NWIramY0SEMvVGxmODJSb1JCcFNkNFIzREk1V2xYTkU1RzhzS2grQVUxeUhJ?=
 =?utf-8?B?L2pwa2RPRVBGbVZRRjAxTEJydU9OZ0NwMFNjeTFOOXdNRWNzc0wwakdJaFgv?=
 =?utf-8?B?OVkrckZDT1FIYmdlSkh4WFBQdUJpZmR3M3BUeTR1eG1lNnNURTh2QTFKUUVS?=
 =?utf-8?B?TzFzWlFjTVZielR3N0JLSFRHdGdTbUtMS1RPMFFEbnRvQ0FMcjkvM2REMENE?=
 =?utf-8?B?WHVjeWlqeTFnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cjZTUkdOZ2JwYUZCK1hFMEpLNWIraDVCbW1uQWp6S2Y1V29PczNTVkZ3Tndv?=
 =?utf-8?B?bFJaL3J1MlFhaFU0ZWhDZnlVNWU5T2NsZDRFUDlqNEV1OTkzL0doQlcrVXRz?=
 =?utf-8?B?MGJNYWRraE16cUFWYS8wMm8yZDcyMzUwSGViRnFSbzhJRXk4cUlwaE1WTW5j?=
 =?utf-8?B?c3Z3Rk9rRGN3cnE1aUZKS1ZIZDg1YXFWTFFSWFpEK3ZhSWZndS8rTDl1YVBV?=
 =?utf-8?B?Y2Z5UHU2UnpveEh6NjlNUEF4NUNhbEJVSS9zSlc3RmpSRmNVdEdXNDBYenU4?=
 =?utf-8?B?M0NiQWhPM0N4eTJHZ0k1SlZqVWJ1WG9nb2pXZ3hzakl3V2pmOWRhaWd0WENi?=
 =?utf-8?B?UTJsZlBsSUU1U0FJc0o2cnFwbDF4aHAzTUtnelNVY1JxTGR3Y2hxVldhNVp3?=
 =?utf-8?B?d0NLVVVIbVFBbkRJdjBaaHhCRmFQY0RGaTM4d1BKR3ZGMlVHOFRUZ0dDOHNB?=
 =?utf-8?B?ZUMyYlJ6STRNZkVVeWdJRU9HRWZSaHh5RXY0MlVsd1pybGgyU3Q5OG1oV1J1?=
 =?utf-8?B?dFIrV045SnlzYTlKcVlnVkFtb3luYTdKK1NDNjkxa2VVT0NvcmRUTUxuckZ0?=
 =?utf-8?B?alkxTXhRaGh2WWRyN1lRUHpseWdzUy9Ya1NlNDhIS3dzd0E5aWFqZDQ5MFNt?=
 =?utf-8?B?Z2cwN2UrQkFxUUdDemhZZW9jT0RtVHVDU3VLYUMzUTZyYkZEelNSVnFqRVBr?=
 =?utf-8?B?cUFYU1pSVkVQZXJsemZPSTdiOXRCVmZIc09NbFpGN1FiQWNIcVhtcXpsaVBC?=
 =?utf-8?B?d1VMWDZWVnpEanUvR2srSlZiOEF0WjlFOXhJYjQyREtSZFhTVGMxMDNqOTVX?=
 =?utf-8?B?NUVtQlBIbzJxWjJNTm5vemE3dnNmenBHN0NnVVB3N29IVGdBajVsUXpKSkw3?=
 =?utf-8?B?V0cvV3RWb1I0ZTlkQTJ2aDFPNldQMEZrZEhPb1o5MElocy9VKzhGbkh5dk1X?=
 =?utf-8?B?b01jVDdram16QVZZMVZWbjU0RFBRK1JYS2laVVMvMVBxRFFscjF2czZ2Y2g1?=
 =?utf-8?B?Q0xLWVA3eVN0TjZLOVdJUkZzcHZENU9LS1JHUFV4MUFrNzZORDI0L2J5NExZ?=
 =?utf-8?B?SG41OVpzdVFEY3krSFBqYXN3bVdEdmFmbll1NXRwbXdwRnQ0bFBmZEoydElN?=
 =?utf-8?B?WUxwUkxURFVIMVNnWFZxaDVPVjliajJGdWc5SWd5Y3huUTdkTlVLeGxsSzhL?=
 =?utf-8?B?MkQzTjVFbFVZL0NUVnkzanNxUnU0dkZ0cU1DZkRqcFdWME9TQUFDUmxSQXRj?=
 =?utf-8?B?a1lXQi9SQnltUDMxQzBKdWJNOTV2OUhlSThGd3lsTXdrT3hvdU1mak1xcWpT?=
 =?utf-8?B?SGw5TkZpRVN4TXpCQitzWmFqSDBuN2ROaGpmTnJYYUNMVll3SHpkL3YzaDZa?=
 =?utf-8?B?WHdzcFh0TVhvUHNVRjR3YlpFVDR5d0lPc2lVeVorNFhGRksydEVrYUttdXVX?=
 =?utf-8?B?ZnRBOUZmeitITkc5Qk93UkExSGtRWFVGS3lGbDNCU05xZG1VRGtrd2VqMElQ?=
 =?utf-8?B?aXNRWjJpbmN6Nk0yYXh6ay8xZkJOZmNOc09ZYXNDNTR6TkVMdnJhSlJORG1x?=
 =?utf-8?B?OUpYTDMzMDI3YTFvTXZwS3hoRFo2U0JkYnI1WlRsN2FJR3QzMVJzUHdhRlZR?=
 =?utf-8?B?SnFnR1ZYaTRocUVUUjRyRk5Zd08zRFlVQWpuL01uc1F5clBZQStUcmNNUlpB?=
 =?utf-8?B?LzA3MHAzb0lHY3JGc2toYXpwbC94OFZNcnJ0ZFlsUkV6THRXYUZjd0RkZi8z?=
 =?utf-8?B?Y3M4UjNpSWJ2VHlYb281dlUyR01nYWZ3NmZYcmY2enltbGN5YVlQZlhvQVlw?=
 =?utf-8?B?SW1JdjFyZzJ2a01DcnlOdThwazJBYnhjM2laWm85MmhucjRtYXpVWHNBb1Nl?=
 =?utf-8?B?R2Vwdm9nTkdKbklJS25NRXh3aDZsTHFpYnVlMGNvdGZPQ2MyVzJTdlJJeXFR?=
 =?utf-8?B?VlVuL09mdEhwMUxjZk1lVXZPNlB6QUhKV0MyK2FkblAraCtiWVVhUy9UamJJ?=
 =?utf-8?B?NkJkN3BsS1FEMk1nd1F2QTA0cVdpb1hQWCtvU2dSaXJtT3R3YXZvekN0Vklw?=
 =?utf-8?B?QzRLcUxYa2RsWGE1OFhRMGFmUkZCS3E0K3YrMHB1WVZXaWtwckdEVThBVFZD?=
 =?utf-8?B?MXp1bFJCcVlVQzFTbTVKYURoL1N5cFBrYisvRUFZZ3NaRzB4L0ZTMDdqUzhq?=
 =?utf-8?B?RXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A383562258B85A4EA4482CC71134C342@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 390c4b05-e248-477e-b538-08ddef082c54
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2025 18:47:33.8640 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z4BSvAqNDYHFz2JP6nBZ64SiIo+JiVp43jasumEncmkYWSNalxnkwnf1GbTAWUhsRHpCzTzE3nTR1UDh3TNrF6w0u/yddClP81tyoDMToEk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5009
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

T24gU3VuLCAyMDI1LTA5LTA3IGF0IDE1OjQyICswMjAwLCBDaHJpc3RvcGhlIEpBSUxMRVQgd3Jv
dGU6Cj4gVXNlIGRldm1fbXV0ZXhfaW5pdCgpIGluc3RlYWQgb2YgaGFuZC13cml0aW5nIGl0Lgo+
IAo+IFRoaXMgc2F2ZXMgc29tZSBMb0MsIGltcHJvdmVzIHJlYWRhYmlsaXR5IGFuZCBzYXZlcyBz
b21lIHNwYWNlIGluIHRoZQo+IGdlbmVyYXRlZCAubyBmaWxlLgo+IAo+IEJlZm9yZToKPiA9PT09
PT0KPiDCoMKgIHRleHTCoMKgwqAgZGF0YcKgwqDCoMKgIGJzc8KgwqDCoMKgIGRlY8KgwqDCoMKg
IGhleMKgZmlsZW5hbWUKPiDCoCAzNjg4NMKgwqAgMTAyOTbCoMKgwqDCoMKgIDY0wqDCoCA0NzI0
NMKgwqDCoCBiODhjwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfaHdtb24ubwo+IAo+IEFmdGVyOgo+
ID09PT09Cj4gwqDCoCB0ZXh0wqDCoMKgIGRhdGHCoMKgwqDCoCBic3PCoMKgwqDCoCBkZWPCoMKg
wqDCoCBoZXjCoGZpbGVuYW1lCj4gwqAgMzY2NTHCoMKgIDEwMjI0wqDCoMKgwqDCoCA2NMKgwqAg
NDY5MznCoMKgwqAgYjc1YsKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2h3bW9uLm8KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlIEpBSUxMRVQgPGNocmlzdG9waGUuamFpbGxldEB3YW5hZG9v
LmZyPgo+IC0tLQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2h3bW9uLmMgfCAxMCArLS0tLS0t
LS0tCj4gwqAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDkgZGVsZXRpb25zKC0pCj4g
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9od21vbi5jCj4gYi9kcml2ZXJz
L2dwdS9kcm0veGUveGVfaHdtb24uYwo+IGluZGV4IDMyYTc2YWU2ZTlkYy4uZTY1MzgyZDQ0MjZh
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9od21vbi5jCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2h3bW9uLmMKPiBAQCAtMTI5NCwxMyArMTI5NCw2IEBAIHhlX2h3
bW9uX2dldF9wcmVyZWdpc3RyYXRpb25faW5mbyhzdHJ1Y3QKPiB4ZV9od21vbiAqaHdtb24pCj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgeGVfaHdtb25f
ZmFuX2lucHV0X3JlYWQoaHdtb24sIGNoYW5uZWwsCj4gJmZhbl9zcGVlZCk7Cj4gwqB9Cj4gwqAK
PiAtc3RhdGljIHZvaWQgeGVfaHdtb25fbXV0ZXhfZGVzdHJveSh2b2lkICphcmcpCj4gLXsKPiAt
wqDCoMKgwqDCoMKgwqBzdHJ1Y3QgeGVfaHdtb24gKmh3bW9uID0gYXJnOwo+IC0KPiAtwqDCoMKg
wqDCoMKgwqBtdXRleF9kZXN0cm95KCZod21vbi0+aHdtb25fbG9jayk7Cj4gLX0KPiAtCj4gwqBp
bnQgeGVfaHdtb25fcmVnaXN0ZXIoc3RydWN0IHhlX2RldmljZSAqeGUpCj4gwqB7Cj4gwqDCoMKg
wqDCoMKgwqDCoHN0cnVjdCBkZXZpY2UgKmRldiA9IHhlLT5kcm0uZGV2Owo+IEBAIC0xMzE5LDgg
KzEzMTIsNyBAQCBpbnQgeGVfaHdtb25fcmVnaXN0ZXIoc3RydWN0IHhlX2RldmljZSAqeGUpCj4g
wqDCoMKgwqDCoMKgwqDCoGlmICghaHdtb24pCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqByZXR1cm4gLUVOT01FTTsKPiDCoAo+IC3CoMKgwqDCoMKgwqDCoG11dGV4X2luaXQoJmh3
bW9uLT5od21vbl9sb2NrKTsKPiAtwqDCoMKgwqDCoMKgwqByZXQgPSBkZXZtX2FkZF9hY3Rpb25f
b3JfcmVzZXQoZGV2LCB4ZV9od21vbl9tdXRleF9kZXN0cm95LAo+IGh3bW9uKTsKPiArwqDCoMKg
wqDCoMKgwqByZXQgPSBkZXZtX211dGV4X2luaXQoZGV2LCAmaHdtb24tPmh3bW9uX2xvY2spOwoK
VGhhbmtzIGZvciB0aGUgcGF0Y2ghIFllcyBJIGFncmVlIHRoaXMgbG9va3MgYmV0dGVyLiBBbmQg
d2UgZG9uJ3Qgd2FudAp0byB1c2UgZHJtbV9tdXRleF9pbml0KCkgaGVyZSBiZWNhdXNlLCBhcyB3
YXMgZGV0YWlsZWQgaW4gYW4gZWFybGllcgpmaXggaGVyZSwgd2UgY2FuJ3QgbWl4IGRldm1fa3ph
bGxvYyB3aXRoIGRybW1fbXV0ZXhfaW5pdCBvciByaXNrIGEgdWFmLgoKUmV2aWV3ZWQtYnk6IFN0
dWFydCBTdW1tZXJzIDxzdHVhcnQuc3VtbWVyc0BpbnRlbC5jb20+Cgo+IMKgwqDCoMKgwqDCoMKg
wqBpZiAocmV0KQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIHJldDsK
PiDCoAoK

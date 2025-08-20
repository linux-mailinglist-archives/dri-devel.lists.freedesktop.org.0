Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4540BB2E40C
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 19:37:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C0B510E277;
	Wed, 20 Aug 2025 17:37:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ae6mHamu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E4E710E277
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 17:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755711451; x=1787247451;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3TemWYhXPUyTVogMSgcMwQC3OgxfUCO9VMa1sLHs1ys=;
 b=Ae6mHamukoak/zx7C2WyWgkjRsvQb8txTlJF50Cay0IxKS5p9qK9af0O
 xmu9gLjsUdlqp2dOdlJ3RsS7ZiRxCKHzuczBhKtVmafeI1xvazzfpGZ7e
 W+glegICnLVJT5PRYc3luev4hq+35vsaYKjmheJZHYvZfAm3H6pEZTNMp
 KTEnJkozlQYv2NiVJClmhG7BMyWCXO8LCmlSD/1E2B/44yHK1w//edC1S
 EVG/dj8nmxkYO7hC1L8uyRK2FiyiOpdTZVhW6qweSOQMkpRwmrcz6Si+y
 myfG0IPtmSJMFma7H5utLat3LbeBVpGkRSxmjZohwDG4lba054vyyfsdh A==;
X-CSE-ConnectionGUID: Z5BNO9EZTeScCPP14ZYj+g==
X-CSE-MsgGUID: dW+YJ38xT62U50C+ReqqOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="57845598"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="57845598"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2025 10:37:30 -0700
X-CSE-ConnectionGUID: UJ6J8ANCTburZaIRPgZaAg==
X-CSE-MsgGUID: Z3/ggDkPRNa/EoDEDxDU9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="205343837"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2025 10:37:29 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 20 Aug 2025 10:37:29 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 20 Aug 2025 10:37:29 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.64)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 20 Aug 2025 10:37:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TZisliZqz0aTOBSnIB+gJzVlj5QcXTkgIHOGVC0fxEJjfO0c4BvIF6us509RLfrDYO5lBCBr0FHCl5MxoZzUhreI8MNJCuO7zppcg1Sl5D64tK0Hhq6yz2qRP+gdQQPHwr1c/QxTBSGVYnNuMU3BjV42s5RPaawf+E2wJJfTvSFX0g8j7zBfGMIY/gtInEFHq0AJ0+HAugj4bl4rS5Enyztt0H8Q/7Lx/vH4eq9hsa7CvBf9LdcL75FKN54XGGyAK/yRgCExN+MP1U3oCCN9VY4iadki48u3taXjg4/SVEiaslXHeboCxurG8f6XkNKALkpspjLS05QVkLpZDYNWSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3TemWYhXPUyTVogMSgcMwQC3OgxfUCO9VMa1sLHs1ys=;
 b=upD55gGwbthERTR2zOrWLKjEZjll4wUeMWy7RVRZXhyTQ+EuOjmBcJFCPURv+GY+jPG+Vt+CoF3jX9umnz2+YBD8KjfYr1oTWmw9+IWg0rcK7SP8D1APBztsgYtUdXS3n4RHFNtoB5ZQCD5UArjDCXol0I0wckg5rbi793O64IuDpz0LjRfAdtCGERoZzx7ni9bkvK8hhI2AtjvuzZq0aiGtqPM0suuYU87TV1yKsL3iwArvUP+tpUsUgwDkN+VwmWtuqWk959qRMcP7yfTHkoCUL4vU1Xc8jbo7zYsWPZmXvPD/m7z6AUCHNsipYVn7g9cbCEDrLwCq6wEBU4giQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5112.namprd11.prod.outlook.com (2603:10b6:510:3b::18)
 by DM6PR11MB4724.namprd11.prod.outlook.com (2603:10b6:5:2ad::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Wed, 20 Aug
 2025 17:37:27 +0000
Received: from PH0PR11MB5112.namprd11.prod.outlook.com
 ([fe80::b6b7:41ec:7dc8:773]) by PH0PR11MB5112.namprd11.prod.outlook.com
 ([fe80::b6b7:41ec:7dc8:773%4]) with mapi id 15.20.9031.024; Wed, 20 Aug 2025
 17:37:27 +0000
From: "Kim, Dongwon" <dongwon.kim@intel.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Subject: RE: [PATCH v3 2/2] drm/virtio: Implement save and restore for
 virtio_gpu_objects
Thread-Topic: [PATCH v3 2/2] drm/virtio: Implement save and restore for
 virtio_gpu_objects
Thread-Index: AQHb8NUDVypKU+n2/0WheNGV4r6NTrQp63GQgAH5+QCAQCpScA==
Date: Wed, 20 Aug 2025 17:37:26 +0000
Message-ID: <PH0PR11MB5112F7A64697C5D30F08539DFA33A@PH0PR11MB5112.namprd11.prod.outlook.com>
References: <20250702222430.2316723-1-dongwon.kim@intel.com>
 <20250702222430.2316723-3-dongwon.kim@intel.com>
 <633a9922-2281-4119-8378-8d35089ce89e@collabora.com>
 <PH8PR11MB6879AE6EDD72B112AADC0BF6FA49A@PH8PR11MB6879.namprd11.prod.outlook.com>
 <0eb5e316-5eb5-468e-bee0-b4fc8d0490ae@collabora.com>
In-Reply-To: <0eb5e316-5eb5-468e-bee0-b4fc8d0490ae@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5112:EE_|DM6PR11MB4724:EE_
x-ms-office365-filtering-correlation-id: 0ebc70e4-9ceb-4501-24e9-08dde0103ae0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?T3lGS2ZYYWpmYXEwN0xXcHc3YXdjVnJJOE41WnBHWk1Nbm95a245ajhwQXNt?=
 =?utf-8?B?UUtZeU1yOVN4eFM5Zzg0aFNvbWxlaktOMlVPclJiait4VnUvTVlhT0x2dFJi?=
 =?utf-8?B?eDNYSFI0V0tubDRXZ3lxSnJOS2NhRGswcC91QTRLUGJYOVpHZUdYT1ZKY0lU?=
 =?utf-8?B?aVVtd3pYZFRSUThTUVVQUHp4NFdCanRYRThDaUttSTloeE1yeDFIcnB3SnhM?=
 =?utf-8?B?MG5kb0dPSU1IUEV4VWQ5OXhYK1NBYUl4SmlTaHQ0cEY2Qis3cHg1NWtYWG1p?=
 =?utf-8?B?NC9XZDZlQjZPYjJSR01kdjc3dFJKT0UxcWs1TkhNdzNKZG1kcEt4eEJJaHlw?=
 =?utf-8?B?TzRwcVhsNm5oWUR3cHNuaVNwQkZBaWhLVkovNTNjUzM0Q0g4YUJUd29YWERx?=
 =?utf-8?B?NTlXTDFXQ0RyQjd6VXpSUGRpL0wyNXRudTRFMVUrb21EREZrR3ZFVmk2M1Ix?=
 =?utf-8?B?QXRMSnkyRTRhNWlzVnQ3UzIzZGhZUnZQbkd0S21kMUpudlJrUmdQWVgvUFRu?=
 =?utf-8?B?QUdmdGptVDg2azZSSGl2WnJILzgzZk1rb25CclF4TE9KNnF2MkxGc2Z6elQ3?=
 =?utf-8?B?RzA2Z3ovdDZiNWEyYkhlL3RHanVSMkFlME5oT0R2ZnFtUFcxSldEVndhRjFQ?=
 =?utf-8?B?akZBWnBKK3ljSzBkT2ZDVjlERFVOazM5R1ZBck1XWlpnOVpNWStldUp5M3Bt?=
 =?utf-8?B?ZWY5ZzJmVFdzcWc1SHdZUmF4TytlSkdvcTByS09FMEJXSmZMTmNhQ1BwUk1D?=
 =?utf-8?B?aVNwRUhPcFFVYUVSS3FKdEd6VERTMlJ0QWNTR3l5Yk1kaVc2SjFmUmorcjJC?=
 =?utf-8?B?SHBkSHpLNVJvU3g4M0JmUi9VMnpOR09iVnpkandwcnJaWXA0emEyTk5scWtr?=
 =?utf-8?B?dnozUFh0OExBL0pHSDRsN21YOTV1a2NtZ0UweTFoZzIzSDI4Y1BjK0lxYWVq?=
 =?utf-8?B?UTdleEgyZ2xCV3dSUVpPdFhvVkZMSCtkUFFmUGo1Z0FxYWVnWXB6cHhWMGYr?=
 =?utf-8?B?ZWRvVFJ6RXFsNGJ3YVVFa2tEYU53V1h6S1dDL1plOU56di91YjhNK1ovNjRU?=
 =?utf-8?B?UHZ5eCs5SFp5OUVkSnNBcjg5NGRrM0pKV0M2aGNtTnpFc3Q2bWFBdkFVckJ6?=
 =?utf-8?B?ci9KTDdEc0VzLytoUEVHek9QRy9iRDVaWUVoVnJqUW11ejBGOVhad2Z4OTBo?=
 =?utf-8?B?Z1BjeTJ4dUYxS1d4WWkzK1l2bStETEJ0MGNhNDcyenBRc2Z4akxZNUJzRnNR?=
 =?utf-8?B?NzZsZ1NBL3ZGdDMxeDkySHJPYzNKM0pKcFl4RnQvRHoyRElvNU1KQVFzQnZE?=
 =?utf-8?B?bG45L3A4eWY4YS9haDg5UkFKNGRuSm9qUDZvSGttaGRtZ1BEN1ExMzdpbExR?=
 =?utf-8?B?WTljdzAzVXY2NVd4UWhJcEZHNXRycXNWVG16UEJxeDZaejRaRllrZ1AvVzFO?=
 =?utf-8?B?L1Nka0NUUXBNMlQ0VEVQVlRUVUdkM0xKdXpvZGtMeUYwZDVHQlFGbllXT1hi?=
 =?utf-8?B?MFIvUjNoekxybDgwemNkZlEwd3VzSzl1bnhyRGkzL3JseGVCL1k4MkswNEM4?=
 =?utf-8?B?ZmxvWEwwYU0yL1l4N1JzTTZKa2orUmU1SU5leTk3NUFEU1BBYlcrUkpNeG13?=
 =?utf-8?B?aHA0Rmo0Tmtsd25LUDhnMWQ1QmViZDBxTW9tS3ZLbHFXZzE4NzNleVMvZ2Vm?=
 =?utf-8?B?ZEZxMG5UZ0dwTTM5TE5jN2Uvc2g2VnhRcGxmWmI3cmJkSlpZd2dnd2Z6RkRC?=
 =?utf-8?B?QXJQUndLOXpFcnptUEdDOG9IVU1jaUFRMXpYSW9xZkY4Tll4dVZJaDBqK0Vn?=
 =?utf-8?B?L1ZHN1MrV09VUzVNMkR5Q09adkNqT0Jmek5TdGZ3TkNtVzA5S3h5NGR6Ykxm?=
 =?utf-8?B?bDBGQ3p2SE5oMHcySDFhdVdsTVdsNFFhWWhhMUpJSUJVakR3c201aVhCQUIz?=
 =?utf-8?B?NEtBQnY5VG5TTDRsT2hqUmFybmJrdTgrUXdJWGJlb0lncWdqbVhGMGxuUE9M?=
 =?utf-8?B?a1FhQUdlTlhBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5112.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ei9QL0NZdWM0Ly9ySlF2NzdxUHdTdTkxelBKQVdIQXN4N21DaVV0M2x5MU5z?=
 =?utf-8?B?K2xLY0RrSDFHNVEyOHZ3cU5VUWRBK2hiZWNFWDFWTS9iclNoelRSMDFMUmdl?=
 =?utf-8?B?ejcrUzRlTGFzYWxMN0NKcEp4L3h2NVV6YzVDdzFoVUkxRm9KRzFRZzVLMVdW?=
 =?utf-8?B?Z0xhaE1BK0U5SzUwSEl5MmcxMmpiZFk4bDN5VVNPYUQ0REZkaWVIUnptR3Jp?=
 =?utf-8?B?b0p5TGdBZGFRY2pBQVVuSzArTFI3S1REcDhJVzNQR1ovWWRaWkZjSlRxa25h?=
 =?utf-8?B?ZzQxMHltdEJvZ01RWm1RenNlVFdPM2Zvemg4R1k2Y0VIaHM5ZHRpY24vdGFH?=
 =?utf-8?B?ZUpoTnlGNzFyYitLMXdYUVp5MiszRy8xQlUzZDhETWdreUpTQ05hTFVkOXhy?=
 =?utf-8?B?aFdQSk1sRlN3d0NBdkpzY0p3ZzBwLzFPa3JyREpiZ2hiMi9Dd0F0TG9jVWxo?=
 =?utf-8?B?aEl2VkxBZTJmT2Z2aW93OUg3QnBabE9YaFlaeThNeWxpK1BwTmFDNXB1anls?=
 =?utf-8?B?aHNDODdYaFc5RkpjcCtGUWo1OGtOWUN6c1FhWU1tVVZqNXFLaXpSN1luVDFB?=
 =?utf-8?B?UElnQWc1aEI1RGFhcFdIcDdlVEM1NnBRSVROdHYyamFidG1TblBZSkQwRjNM?=
 =?utf-8?B?SWlXZGtSK0xHZzRkSlZWc0s0ZEtIRU41SW4ySVZGT0QyVmdXQ1Y1SThZdGZB?=
 =?utf-8?B?NWZFV1Y0VmRqdXFtOEVySlBmYWFXeVNBaG5GNm92SmNiT294SmFFc1hOT1h4?=
 =?utf-8?B?MEttdXMrTzFXZS9VRHhRZnVrNVpUTWo2ZnUrdnQvT21FOWFRVm52YmVJdzJD?=
 =?utf-8?B?STRScFVBWHVIWHFBUkVReTBhdWg5eDZ5MnB5OS9qR3Z0VkdCQnhWZUwrSVJl?=
 =?utf-8?B?TEhLaWFJdEdISUg3ZUxhREl0TWtMMitkZ2cvM3A5MERSaEorVEZqb0NQRU9k?=
 =?utf-8?B?cmY3ZXQ1K3J6ZVlFUVp6R2FrcDRoeXhXdnNIc3NoOEd2TU00WFhCc01SSVp6?=
 =?utf-8?B?QisvcTJxRXU4NFBHcEtWcXpOZUVVcVpSYW53QmgyWnBhcWtzM0IxM0RLUVN1?=
 =?utf-8?B?WUVSbFA2bHRldjNDZFlub1hDT2ZBN2JEQUtsSDE5MG9kNjN0S1psYjhZenpS?=
 =?utf-8?B?aWhXS1ZWT3hTdmxsZjJQUlVjaU5oN0ZaMEMvMlRQNjBQN3NqYVRJT0lzRy9o?=
 =?utf-8?B?bk41eFVrNHd4RGJkTWg0SllRVm9yM3pGdVBSVzRIWU50NTJGOHF1NEpaN21W?=
 =?utf-8?B?VjM0WjVyYllFSk8rNmpYYjdiZ25acFk0TXlydGFTWDdnc1RyRWY4Y2VNZzlW?=
 =?utf-8?B?OENPRm5wRXdjbHRsTU8wWWdTM0VEaDJxVi92NFErR0tNQUZuUHlBUFdySEs2?=
 =?utf-8?B?alg0N2c4SEtMQjJVYi94QmIzaFlFRHovZ3YyekVrTUpUdzFYWlZ0eUJ0L2Rv?=
 =?utf-8?B?TTRDcm1jVkhoMTIyK0NMczl6cURYSzVDVXFCZ2taVXJlVXFlci9xZ2Vvd0lF?=
 =?utf-8?B?TElHL3JFMitNRUhYdFk4MkRmR2F1cE1JWVhEcHdqR0dIUWlKU28wVnR1Q3RT?=
 =?utf-8?B?K2NoUUZScEVJV0htRDVQbEx0b3AvYXVFd0lPUmNGVlIxeEt3RDk1YkNQc2tF?=
 =?utf-8?B?OC9WbExpVEc2M2F0dk5PZmg2N1dwNmdQVUJDeStkamNqOTFTV1hxbE0rTW50?=
 =?utf-8?B?ZmtaaW9XcE4yOE1xWjVnZGxFYVcwbmM5bE9ZN0FwNUxmVWRpZ3dCOUdlTFFH?=
 =?utf-8?B?UmxTRXRsOHJMNDlvaGZKVFlLSFUzaVNVL0taK1VKaC9QM2lzSVUyK3JEYnZK?=
 =?utf-8?B?OU1tdlBBaTE2eFBKazczSm11VG5RWHZYQmNYYmVRbkhMMXRGT0gwT1pQdWZX?=
 =?utf-8?B?bE9SR0hjSGJuSzNXU2thMXVoY1RVSVErSkNZaGxwM0hjRDQvZTFtSkozc1Fk?=
 =?utf-8?B?Q1VEak9lSUU0ZnVWVkQxNUxITFFhTmNRN0dBSERHQUkvM252QTlsT3k2V3Jn?=
 =?utf-8?B?Vm5nZ2JnQVJTUU5yelI5SEh6R2ZkWFN4SGZrNy9aZ1prK2NwQWhNV2FFK3dK?=
 =?utf-8?B?RmxQR3pmQlBZSGJLcWUzUzJwUUMrcHN0d3ZKTnFVdm03WUVrd3RWZVNwM2gr?=
 =?utf-8?Q?IT9+mPaG0DgrGHd3w6P5yxfQy?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5112.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ebc70e4-9ceb-4501-24e9-08dde0103ae0
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2025 17:37:26.8057 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ocdVaO/H4leIZKPs14cRQ8vSfW2g1AuwU+yP1l0p0oJuVcxFwfcyTQg/ndJ0Q5tzbgwLtPqZQd9mo3hmfHbt6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4724
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

SGkgRG1pdHJ5LA0KDQpTb3JyeSwgSSBoYXZlIGJlZW4gYnVzeSBpbiBoYW5kbGluZyBzb21lIG90
aGVyIGhpZ2ggcHJpb3JpdHkgdGFza3Mgc28gY291bGRuJ3QgZm9sbG93IHVwDQp3aXRoIHRoaXMu
IFllYWgsIHNvIHRvIGNvbmZpcm0sIHlvdSBhcmUgc2F5aW5nIHRoaXMgb2JqZWN0IHNhdmUvcmVz
dG9yZSBtZWNoYW5pc20NCnNob3VsZCBvbmx5IGJlIHVzZWQgZm9yIFM0IGNhc2UgKGluIHRoZSBQ
TSBub3RpZmllciBmb3IgdmlydGlvLWdwdSBkcml2ZXIpIGFuZCBoYW5kbGUNClMzIGNhc2UgYnkg
bm90IHJlc2V0dGluZyB2aXJ0aW8tZ3B1IGZyb20gUUVNVT8NCg0KSSB3aWxsIHRha2UgYSBsb29r
IGF0IHRoYXQgb3B0aW9uLg0KDQpUaGFua3MhDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0NCj4gRnJvbTogRG1pdHJ5IE9zaXBlbmtvIDxkbWl0cnkub3NpcGVua29AY29sbGFib3JhLmNv
bT4NCj4gU2VudDogVGh1cnNkYXksIEp1bHkgMTAsIDIwMjUgMjo0MyBQTQ0KPiBUbzogS2ltLCBE
b25nd29uIDxkb25nd29uLmtpbUBpbnRlbC5jb20+OyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnDQo+IENjOiBLYXNpcmVkZHksIFZpdmVrIDx2aXZlay5rYXNpcmVkZHlAaW50ZWwuY29t
Pg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDIvMl0gZHJtL3ZpcnRpbzogSW1wbGVtZW50IHNh
dmUgYW5kIHJlc3RvcmUgZm9yDQo+IHZpcnRpb19ncHVfb2JqZWN0cw0KPiANCj4gT24gNy85LzI1
IDE4OjM0LCBLaW0sIERvbmd3b24gd3JvdGU6DQo+ID4gSGkgRG1pdHJ5LA0KPiA+DQo+ID4gSSB0
aG91Z2h0IGFib3V0IHdoYXQgeW91IGFyZSBzYXlpbmcgLSBhdm9pZGluZyBHUFUgcmVzZXQgYW5k
IGl0IHdvdWxkDQo+ID4gd29yayB3aXRoIG5vcm1hbCBzbGVlcCBhbmQgcmVzdG9yZSAoczMpIGJ1
dCB0aGUgcHJvYmxlbSBJIHNhdyB3YXMNCj4gPiBoaWJlcm5hdGlvbiBzY2VuYXJpbyAoczQpLiBJ
biB0aGlzIGNhc2UsIFFFTVUgcHJvY2VzcyB3aWxsIGJlDQo+ID4gdGVybWluYXRlZCBhZnRlciBn
dWVzdCBoaWJlcm5hdGlvbiBhbmQgdGhpcyBhY3R1YWxseSBkZXN0cm95cyBhbGwgdGhlIHJlc291
cmNlcw0KPiBhbnl3YXkuIFNvIHNvbWUgc29ydCBvZiByZWNyZWF0aW9uIHNlZW1lZCB0byBiZSBy
ZXF1aXJlZCBmcm9tIG15IHBvaW50IG9mDQo+IHZpZXcuDQo+IA0KPiBDYW4gd2UgYWRkIHByb3Bl
ciBoaWJlcm5hdGlvbiBzdXBwb3J0L2hhbmRsaW5nIHRvIHRoZSB2aXJ0aW8tZ3B1IGRyaXZlcj8N
Cj4gSS5lLiByZXN0b3Jpbmcgc2htZW0gYnVmZmVycyBiYXNlZCBvbiBTNCBQTV9QT1NUX0hJQkVS
TkFUSU9OIGV2ZW50IGFuZA0KPiBub3QgcmVzZXR0aW5nIEdQVSBvbiBTMy4gRW50ZXJpbmcgUzQg
dGhlbiBzaG91bGQgYmUgcHJvaGliaXRlZCBpZiAzZCBjb250ZXh0cw0KPiBmZWF0dXJlIGVuYWJs
ZWQuDQo+IA0KPiAtLQ0KPiBCZXN0IHJlZ2FyZHMsDQo+IERtaXRyeQ0K

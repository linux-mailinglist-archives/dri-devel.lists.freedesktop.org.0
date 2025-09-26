Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F13DBA3425
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 11:57:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8065710E0A3;
	Fri, 26 Sep 2025 09:57:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hCVKrppK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7375210E0A3;
 Fri, 26 Sep 2025 09:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758880629; x=1790416629;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8swTEGt1dCrBkIXU/nDT58gPmcsal592wC2YS/8BvNw=;
 b=hCVKrppKjs0mJujDulPH4In0wibUwnQrNHlQNNHbJ1+7hAqZNRt7UCML
 YgcF3swZSQyqcbD3pUn8nBkj6igTlK0jVxIri/ob3ffdFigsGvMzmeGra
 gmWMee6H2g9H5EwluDxd8IjRhbONtV9slonX/N4YOcjtJBnbba18eEsrI
 3LX1iOupdvQ3RhNPBxCiO16NYokUh3v4tcezP9jPBOiVdAcmkr85JO4wh
 JzQUdoqTPLnF2L5eb9mbGTs8kikmBbtXyikFZ9cJANzgjI/lj8ZzWYTvV
 A9sXiVS98NStWwlD9AAWXiOMNnhCq1DQwBTRjrcy8DjSdWj2he74W/OeH A==;
X-CSE-ConnectionGUID: sZkNF3b3S3ilhEzQccru7w==
X-CSE-MsgGUID: FNQymUL1SkKXVdLvRK4ZZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="86654752"
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; d="scan'208";a="86654752"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 02:57:08 -0700
X-CSE-ConnectionGUID: MU0AmVACTG21ZSUlDherjQ==
X-CSE-MsgGUID: oy8ztJcfQ2CgEBDnZQ9FcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; d="scan'208";a="181878709"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 02:57:07 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 02:57:06 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 26 Sep 2025 02:57:06 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.46)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 02:57:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TmeyW7eABX7Dl6IigLVBAGVWS03plbXMKIg9J+yRfiATLRIQKSfZMGVS3nXUB0JixHESxiujoMfOkfNtumkHx/jvYwtiENjFrteGExkTSAyKu2oyysbRfn776nesuipBNVL3s6iM7J76a9xth+UYstFf26T1iMwXaVlE+jOGMdhgDaR1EZO6yno/3Txx0ZOutZEVXg2uNcMTz9RxBdhjrmvmFt6/quyXg+4wJVGyPHP9kAjLUlYfGa5L8MTvcjXQqvf7L50w6vVpIbaTZBzBTuh9LgxZniP0cHLBJtH+ZEKUCAemfmac1ks7ZCn97euX+wwD7fGmVw9XNQnj99FZlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8swTEGt1dCrBkIXU/nDT58gPmcsal592wC2YS/8BvNw=;
 b=XGMy8g/xyux4Ni6M80ZtGsYgun/+GcXhBkjoPyN8eDJg5RehGAnaQGS4ibgs1pA5OC0PQc9peMdHRi9A9JtbQ+EiWSbrN89ON5O7+6apTH9D6e99pwSzvRZQ43EJMGHXn2hOqEsXuXlu2g/qHNlErxQ/F2SOi43N7QdOHnxHL7WuwdlEjg6QCmmJUopGL4ngFIUsxN/t34BjfBe2nZDxO19QQ1L6dFY5ub/8PwnEdooSm8DYwndfDAbNkgqz2G3zMTj0WNIXEh3nr/s5wp1zWJqNDPaLOad3xqM7mcBPeKWKk/JNeuXvshsPrOCOOxXkgx8jIfokTpIuENM5VW6zCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by MW4PR11MB6620.namprd11.prod.outlook.com
 (2603:10b6:303:1ea::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.20; Fri, 26 Sep
 2025 09:56:57 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7aab:2a1f:f728:eb01]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7aab:2a1f:f728:eb01%5]) with mapi id 15.20.9137.012; Fri, 26 Sep 2025
 09:56:57 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Aaron, Ma" <aaron.ma@canonical.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "Deak, Imre" <imre.deak@intel.com>, "joonas.lahtinen@linux.intel.com"
 <joonas.lahtinen@linux.intel.com>
Subject: RE: [PATCH 2/2] drm/i915/backlight: Add get brightness support of
 DPCD via AUX
Thread-Topic: [PATCH 2/2] drm/i915/backlight: Add get brightness support of
 DPCD via AUX
Thread-Index: AQHcLsNdPwcC5+SjfEiot8pp/8NCeLSlMXaggAAHjwCAAAEHEA==
Date: Fri, 26 Sep 2025 09:56:57 +0000
Message-ID: <DM3PPF208195D8DA16C685D9A84D20FFDB8E31EA@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20250926085401.2808634-1-aaron.ma@canonical.com>
 <20250926085401.2808634-2-aaron.ma@canonical.com>
 <DM3PPF208195D8DD3E38CF770DE7A86EFB9E31EA@DM3PPF208195D8D.namprd11.prod.outlook.com>
 <CAJ6xRxU1B0wh9eNO8x62+HH_SS_H-eR-Sco9cAeH9fKrTQ+kMw@mail.gmail.com>
In-Reply-To: <CAJ6xRxU1B0wh9eNO8x62+HH_SS_H-eR-Sco9cAeH9fKrTQ+kMw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|MW4PR11MB6620:EE_
x-ms-office365-filtering-correlation-id: 51c19a46-8476-4718-bfbd-08ddfce307e8
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?VzRRc1lMOFg3WVEzeUVPZ2FIVmhpSkNTMWEwTXpsUDZZNVdGVm5oajFKc3BH?=
 =?utf-8?B?Um52RlhjbzVlM012UUtvaFhFdUEwT1RQTkNoSU1aNnJYd0FNYlFyM1BqZjlB?=
 =?utf-8?B?Q0pXWDVKU2oxUlE5eTVTQ0daK1MzdkNhcG1jdkRIRXA2TkVCL1ZuQVhuSVB1?=
 =?utf-8?B?WHhtMWNwdkpiS1RPNmNLaWkzL2ZsQXNHMlcrcHUzSmQ4R3gvNVpmM3QwaGJh?=
 =?utf-8?B?cWxScjlEVFRmRnh2bXZyWkRUbFRpVW1MNWRWWXlCRlRhMkJYcDNsWHhpZEh4?=
 =?utf-8?B?Z0tGZGVWWHB2VVIyZXE0Q24yYVAyWGZLa3NIMDdYWFBVdU9kbHMwS09KQTUw?=
 =?utf-8?B?MUROdC9ySndyNnJUaVd0V2FjV0NVVlk3T2kwaXpHcllKMnNBanozejR0VUxp?=
 =?utf-8?B?ay9IQXVTQmpLVHVnZUcwelk5ektwcG1iSENXcTdiV3VYL3Boc2k0QVppMkdP?=
 =?utf-8?B?MTQ5Vi9qY0lzbHhTdi8zM0kyTFp1WG9Td0dUaVpwdXQyNFVjc1QwL0JPRjNv?=
 =?utf-8?B?SWxOSUZvbUx4RkVaTG9wOFJyZXhFSUVmcVp5cEVnM05rMENwdzNISEFhTkZD?=
 =?utf-8?B?b1U5TjNRZ1Bkcmw0Z0RZeS9KUGJDakhkSXMydUZhRHVqVEhydnhUNHNaKzRp?=
 =?utf-8?B?ejhzQXoxRjFqUWxlakdXeTN6VXZxZyt4MTdPYkhlQk0vR3R0aENaV21JYWdh?=
 =?utf-8?B?aDJXNHo4Y3o5bGlZOEVIUHFHM1FPK21OSEpOZGtaZ3dLWE5Zc29ZenVnRC8z?=
 =?utf-8?B?cjZtdWlOZjBmdTFUQ3ZLWVlOT29BY1FULzBJbVAwc3ZicDQ4WWJDdWlyOVVH?=
 =?utf-8?B?SVdtdXRZT0FyRzhOaEtsOHpzUFR3L3RFdWRwN3ovWUM3RCs0OS8yUThLUS9J?=
 =?utf-8?B?NGdMOHJUUzJ1a1pQdFNpeWw1STNMUjRLRWcyREZRYWhsM3VWbTFqQlg5UWdY?=
 =?utf-8?B?UFpPQUxsMGVVR3ZGQmZaM2wycERLek5wYWRBVW1SdjJyYVV1ZlZiMStYUUkw?=
 =?utf-8?B?Rm5LdzcxOHZmaEVrR2VmcHNxQ2orblNhR0dSUzF3bCtoQ3oySzk3dVRla0Rr?=
 =?utf-8?B?R2szMEwzM04zMklGN3AyMTQ5Mmw2RWNTRTJ6akk0TEV3eGQvRGdtNWhVTmN6?=
 =?utf-8?B?cHFWMGNoditGTTVlaDV2Y2FDc0tra2hmcmp0Mkh5eU1nNkd6dWtrUFdUbFZ6?=
 =?utf-8?B?YTIzUHBuZWFUWkt6aDNsM3p2blhHbGdzSzd0Q05LcEkyYUJrdVdFZzRwSDk3?=
 =?utf-8?B?eE1HT1RnQmJCTFJNOUhjVEVpOGdHRExwZ2V6SWFBY3FyQy9iOE5YM0lVdUUx?=
 =?utf-8?B?T0hSbkFaWDVPQWJTWnNnWVhMTVRUVE1icG8rbUNCZUVaOFZqYk1lK3FwamVZ?=
 =?utf-8?B?SWhnWk5LbVd0U045ZmxLUThyVHl1UG5JQzZPMVg0bm5vd280SkNIRjhHcjZ1?=
 =?utf-8?B?NWRaanpWRXJTRnY3TmJ3ZUtqbndxQk9ETUxZemFoS0laZDhSZ3V5MHo4YVBx?=
 =?utf-8?B?d0hIS2RVb0FGbE01OHhMbkdqN0hsODlVL3NVN1U5emtkb3lzR3RVMkVkSU42?=
 =?utf-8?B?ZkNNZ3hMc0dyWDJIN0hNTHdKc2VmMlVxWHltZkM5VThWM3dPNUlGZjN0SkRj?=
 =?utf-8?B?Ukx3QVUrWEhqSXhKelJqaWc5TGNCWlN2L0FNZk83U3hDSWNWeWZ2UWE2NkU0?=
 =?utf-8?B?WEVlNU5RWXNwNk15Z0ZNMXBoaWt2SkpZcmZkdjNmNXB3ZVpXQXFZdGpjSExE?=
 =?utf-8?B?dzEvYVN5bWR2cW9WNitEVVo2cnpHUUYrSFhBUkZleVRpRXhNUmcrTmhFMkwx?=
 =?utf-8?B?YU03OUU5b2wwK0FTRUlIK1N3ajlsc2ZTaEdxVmxZdWltSEdEYk9Dem9nZlRF?=
 =?utf-8?B?aDZsTVdJSHo5RDQ1b1JTRm5YVmN6dW1welU3dzl6SWRuYXVNaGswdnh1TjhN?=
 =?utf-8?B?NkJ0TlRyZkFmOFJ6UkdMMm1EZXV2NGVMVVhhMXJDc1JPZWJFNXR1eitEMTR5?=
 =?utf-8?B?QzJZNWFNOEpodk5mTzc0TFJZMUhMWUc5cHJPdmJzQVZjOHZVZVJaZ1ZVaVB3?=
 =?utf-8?Q?eHSeS3?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L2JwQmVwdjdscmt3aEVJM1BOVVFTSktwWnkrVVVsbENlTkx2T0xFNG9ybkRy?=
 =?utf-8?B?cUxxcHlvWjNuQ3IrZFN4RUVVSTRhcFI4YzBSWk1URDA2UEhDd2p0MGUrUytM?=
 =?utf-8?B?Z0M4eHN2eUFkZVRiR0VPYXlSanl2RXoyYlQxdnkzbXUzTGgwTmFGR20wSFA3?=
 =?utf-8?B?NEJjRTUrQXN4WlBQOVVWQ0Z6QzVMTHBiZ2lFVzVUZUZzSWpDTDRsd2FrNTVE?=
 =?utf-8?B?dlN4bkUwRFREbDMrYW1XdlQwa2NzWjJhdEdQUFJxb3B3VlRPS1Y4WWs4S0Nu?=
 =?utf-8?B?dUxTM29xZVk0eG15dEVlUVhpVE52cEoyVWo1NUNZeUFybTA0dDlOeE9sL1Er?=
 =?utf-8?B?VE9hOWthUDY5M0k4WnlYUkcxeXJoVWl2OFFXMXkyT1IrcW9IRmMzRk9XR2NC?=
 =?utf-8?B?Uy9CSnhra2hiMHQ4S2Vnc3FHWHpSc0p3ZFh0MmhKUkxUSmFvVnNnaWEvSWhP?=
 =?utf-8?B?a3AyclhXaC9vQ0dQSDBQVXd5Wm5PWWhpQWs0WDBNSy9HazNHZCtyaGZDaVQy?=
 =?utf-8?B?OTgvcDhMMEVzZlhxSXB5QUlFWjRsRnl2d1lOdjFsL0ExZ0ZTWDZ3RHM3R2E5?=
 =?utf-8?B?ZE50NDZ3OWJuSTB1MXlHY1ByanBiMFNnT00vNHhJalFpRTdkUXFmNlFMVXJh?=
 =?utf-8?B?Q1E5aUloK1pVVFcxYVpLMlJyYk9DN3g0ZGVDOEYvNUlubVd6RGFPYjVLdDh4?=
 =?utf-8?B?cHE4d0gyZlF0QkJ5RDhVMGJ2UFVibEFhNUFtYWNjNkdlajNvSlBnbWxta08r?=
 =?utf-8?B?Wjd1Lyt1VDdldUpoSTViSlF4TWdRMlhQV2R0K1hxNDRuaXZ0TFp5OGlvUUZD?=
 =?utf-8?B?OTlkOElRQ0Mxa241NkhoODNPMXRkK2xQenRGZjVXYUZBWTlLUG80d2RmUnM0?=
 =?utf-8?B?Qm0yQXRCMWhZcTFiVzAwVlozRFdVZmZRY1dpbFIrRzJiN2xaN1ZEY1JQTHZU?=
 =?utf-8?B?RjNSR3BrYU9FMjJpOE9EcUtHVFJyVFQwN3kzVjh1bjJ6NXEvMWI2UThLcVBj?=
 =?utf-8?B?V1B5dzlLOStrNGZVKzVvcU9HTURaM1htM00renVCUDgzR21lRmVZK2RZVlFs?=
 =?utf-8?B?ZTJ6a241TitjUmxKOEZ2MUtyL1JvdkRNSEs5WmJ2OC92WUxSZGRqemFmaFJU?=
 =?utf-8?B?NzBIWGVxU1dTdFFpZ3FEU1ZaWDVHS2srRWVDenhSU3NKM1J5cnJmcUltS1hw?=
 =?utf-8?B?K3RTbGY0WDA1aXcwS2VEZWoxLzFOSkkxQW9BMTl5eWFTblp6MFl3aUJxOHJq?=
 =?utf-8?B?RlBCL2RhVHVOUC9HNWJLWGswVTVlemdaVXVnRVRSeURsdWtaVE1qSnRsRXFH?=
 =?utf-8?B?YjdsaEZvMjNWRDNzcW9TMGYybmZWbnJnVzVNdkNZeDJ2SUtiM2RhUmM4NGF1?=
 =?utf-8?B?b1lwbFpla0t6K2F2VHpEM2lyOW5sckZvTEtud2gvZUViVXJxUlZCNU9BcWd4?=
 =?utf-8?B?M05hNDZCbFhzajQzRk9YUmk0a01TeUFGa3lNTzVzQlZMQUZvR0RMaXlOL0RS?=
 =?utf-8?B?L0JGZU5BMjFxelI2RW9oS0YwZFdvVDRiTE9wRW9FbUpINGM1UlBIOSs4a3ZV?=
 =?utf-8?B?Mk5RMlVOUlcyaDEwdFMxUk43RDZMRkFPUTh4UXN5eEEvNUNQNGZGcWhzdUh5?=
 =?utf-8?B?OHVIV3hld2hOTG4zbUlRNFkzeEpDTlYxV09LVVNzcjdlYTF6MTYvRGU1elFP?=
 =?utf-8?B?UGVsQzJPRjhuZ3JsVHg1QTVjbHV5WDRod2N4VmQxL3U5bzJITmhCa1psNlBZ?=
 =?utf-8?B?L2xuZDBKWCtvK25OdEtiTXlLT1NDRTlWeTFFU1JjTmNXVVhkVHdwV2lwL1ZF?=
 =?utf-8?B?djM5SkZuRE84UmVNbFhoUUt0bHI5MzBvZUMra0JQbFZpYTR5WEZnZ2ZtLzhK?=
 =?utf-8?B?OUFqQVdRQUVZYTlhYlFTRFltTXVTVWYrOEtTZ0p0MENucFVzSVYxbGErbzZt?=
 =?utf-8?B?WDhwUFNDRkpZQTB5WXExVzhhNFQ0NlROengzRHhLNC9iNVFnZWVwMW1LOHdl?=
 =?utf-8?B?a2F4T2hCZU9LMHh1V1VyVlNmN2E0ODNneFp1QjdYWHFFUkovZkFHSTBiT1J6?=
 =?utf-8?B?VXd0ODFHYzFtQnJybGYwOEZqY0Q3L0lhU3U5bmlmdjJaMW9sUXRQaWJzMWx1?=
 =?utf-8?Q?TuW8zmf2xOlWdjjLMiVaxLUQ/?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51c19a46-8476-4718-bfbd-08ddfce307e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2025 09:56:57.6876 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4FJE5wdm/PF5bm580iO0/kLU0C9xDokK/zz0xeIKTjobnse5RCxHHoRHFB4ueBg41hCxYgd+QFbCyVZrHDMLSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6620
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQWFyb24gTWEgPGFhcm9u
Lm1hQGNhbm9uaWNhbC5jb20+DQo+IFNlbnQ6IEZyaWRheSwgU2VwdGVtYmVyIDI2LCAyMDI1IDM6
MjMgUE0NCj4gVG86IEthbmRwYWwsIFN1cmFqIDxzdXJhai5rYW5kcGFsQGludGVsLmNvbT4NCj4g
Q2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGludGVsLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmc7IGxpbnV4LQ0KPiBrZXJuZWxAdmdlci5rZXJuZWwub3JnOyBtYWFydGVuLmxh
bmtob3JzdEBsaW51eC5pbnRlbC5jb207DQo+IG1yaXBhcmRAa2VybmVsLm9yZzsgdHppbW1lcm1h
bm5Ac3VzZS5kZTsgYWlybGllZEBnbWFpbC5jb207DQo+IHNpbW9uYUBmZndsbC5jaDsgamFuaS5u
aWt1bGFAbGludXguaW50ZWwuY29tOyBWaXZpLCBSb2RyaWdvDQo+IDxyb2RyaWdvLnZpdmlAaW50
ZWwuY29tPjsgRGVhaywgSW1yZSA8aW1yZS5kZWFrQGludGVsLmNvbT47DQo+IGpvb25hcy5sYWh0
aW5lbkBsaW51eC5pbnRlbC5jb20NCj4gU3ViamVjdDogUmU6IFtQQVRDSCAyLzJdIGRybS9pOTE1
L2JhY2tsaWdodDogQWRkIGdldCBicmlnaHRuZXNzIHN1cHBvcnQgb2YNCj4gRFBDRCB2aWEgQVVY
DQo+IA0KPiBPbiBGcmksIFNlcCAyNiwgMjAyNSBhdCA1OjI24oCvUE0gS2FuZHBhbCwgU3VyYWog
PHN1cmFqLmthbmRwYWxAaW50ZWwuY29tPg0KPiB3cm90ZToNCj4gPg0KPiA+ID4gU3ViamVjdDog
W1BBVENIIDIvMl0gZHJtL2k5MTUvYmFja2xpZ2h0OiBBZGQgZ2V0IGJyaWdodG5lc3Mgc3VwcG9y
dA0KPiA+ID4gb2YgRFBDRCB2aWEgQVVYDQo+ID4gPg0KPiA+ID4gVXNlIGRybSBjb21tb24gaGVs
cGVyIHRvIHJlYWQgYnJpZ2h0bmVzcyBmcm9tIGJvdGggbHVtaW5hbmNlIGFuZCBBVVgNCj4gPiA+
IG1vZGUgdG8gc3VwcG9ydCBnZXRfYnJpZ2h0bmVzcyBmcm9tIERQQ0QgdmlhIEFVWC4NCj4gPiA+
DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBBYXJvbiBNYSA8YWFyb24ubWFAY2Fub25pY2FsLmNvbT4N
Cj4gPiA+IC0tLQ0KPiA+ID4gIC4uLi9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwX2F1eF9iYWNr
bGlnaHQuYyB8IDIwDQo+ID4gPiArKysrKystLS0tLS0tLS0tLS0tDQo+ID4gPiAgMSBmaWxlIGNo
YW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pDQo+ID4gPg0KPiA+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHBfYXV4X2JhY2ts
aWdodC5jDQo+ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHBfYXV4
X2JhY2tsaWdodC5jDQo+ID4gPiBpbmRleCAwYTNhM2Y2YTVmOWQ4Li4wZWU2ZmQwZjQxZWYwIDEw
MDY0NA0KPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcF9h
dXhfYmFja2xpZ2h0LmMNCj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkv
aW50ZWxfZHBfYXV4X2JhY2tsaWdodC5jDQo+ID4gPiBAQCAtNDU0LDI0ICs0NTQsMTYgQEAgc3Rh
dGljIHUzMg0KPiA+ID4gaW50ZWxfZHBfYXV4X3Zlc2FfZ2V0X2JhY2tsaWdodChzdHJ1Y3QNCj4g
PiA+IGludGVsX2Nvbm5lY3RvciAqY29ubmVjdG9yLCBlbiAgew0KPiA+ID4gICAgICAgc3RydWN0
IGludGVsX2RwICppbnRlbF9kcCA9IGVuY190b19pbnRlbF9kcChjb25uZWN0b3ItPmVuY29kZXIp
Ow0KPiA+ID4gICAgICAgc3RydWN0IGludGVsX3BhbmVsICpwYW5lbCA9ICZjb25uZWN0b3ItPnBh
bmVsOw0KPiA+ID4gLSAgICAgdTggYnVmWzNdOw0KPiA+ID4gLSAgICAgdTMyIHZhbCA9IDA7DQo+
ID4gPiAtICAgICBpbnQgcmV0Ow0KPiA+ID4NCj4gPiA+IC0gICAgIGlmIChwYW5lbC0+YmFja2xp
Z2h0LmVkcC52ZXNhLmx1bWluYW5jZV9jb250cm9sX3N1cHBvcnQpIHsNCj4gPiA+IC0gICAgICAg
ICAgICAgcmV0ID0gZHJtX2RwX2RwY2RfcmVhZCgmaW50ZWxfZHAtPmF1eCwNCj4gPiA+IERQX0VE
UF9QQU5FTF9UQVJHRVRfTFVNSU5BTkNFX1ZBTFVFLCBidWYsDQo+ID4gPiAtICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgc2l6ZW9mKGJ1ZikpOw0KPiA+ID4gLSAgICAgICAgICAg
ICBpZiAocmV0IDwgMCkgew0KPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgIGRybV9lcnIoaW50
ZWxfZHAtPmF1eC5kcm1fZGV2LA0KPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IltDT05ORUNUT1I6JWQ6JXNdIEZhaWxlZCB0byByZWFkDQo+ID4gPiBMdW1pbmFuY2UgZnJvbSBE
UENEXG4iLA0KPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29ubmVjdG9yLT5i
YXNlLmJhc2UuaWQsIGNvbm5lY3Rvci0NCj4gPiA+ID5iYXNlLm5hbWUpOw0KPiA+ID4gLSAgICAg
ICAgICAgICAgICAgICAgIHJldHVybiAwOw0KPiA+ID4gLSAgICAgICAgICAgICB9DQo+ID4gPiAr
ICAgICBpZiAoIXBhbmVsLT5iYWNrbGlnaHQuZWRwLnZlc2EuaW5mby5hdXhfc2V0KSB7DQo+ID4g
PiArICAgICAgICAgICAgIHUzMiBwd21fbGV2ZWwgPQ0KPiA+ID4gKyBwYW5lbC0+YmFja2xpZ2h0
LnB3bV9mdW5jcy0+Z2V0KGNvbm5lY3RvciwNCj4gPiA+IHVudXNlZCk7DQo+ID4gPg0KPiA+ID4g
LSAgICAgICAgICAgICB2YWwgfD0gYnVmWzBdIHwgYnVmWzFdIDw8IDggfCBidWZbMl0gPDwgMTY7
DQo+ID4gPiAtICAgICAgICAgICAgIHJldHVybiB2YWwgLyAxMDAwOw0KPiA+ID4gKyAgICAgICAg
ICAgICByZXR1cm4gaW50ZWxfYmFja2xpZ2h0X2xldmVsX2Zyb21fcHdtKGNvbm5lY3RvciwNCj4g
PiA+IHB3bV9sZXZlbCk7DQo+ID4gPiAgICAgICB9DQo+ID4gPg0KPiA+ID4gKyAgICAgY29ubmVj
dG9yLT5wYW5lbC5iYWNrbGlnaHQubGV2ZWwgPQ0KPiA+ID4gKyAgICAgICAgICAgICBkcm1fZWRw
X2JhY2tsaWdodF9nZXRfbGV2ZWwoJmludGVsX2RwLT5hdXgsDQo+ID4gPiArJnBhbmVsLT5iYWNr
bGlnaHQuZWRwLnZlc2EuaW5mbyk7DQo+ID4gPiArDQo+ID4NCj4gPiBKdXN0IGNhbGwgdGhlIGlu
dGVsX2RwX2F1eF92ZXNhX2dldF9iYWNrbGlnaHQgaGVyZSBhbmQgY2FsbCB0aGUNCj4gPiBkcm1f
ZWRwX2JhY2tsaWdodCBnZXQgbGV2ZWwgaW4gdGhlcmUNCj4gPg0KPiANCj4gRG8geW91IG1lYW4g
bm8gY2FsbCBvZiAgcHdtIGdldD8NCj4gDQo+IEkgdGhvdWdodCBpdCBzaG91bGQgYmUgYWxpZ25l
ZCB3aXRoIHNldF9sZXZlbCB3aGVuIGF1eF9zZXQgPT0gMC4NCg0KSSBtaXN1bmRlcnN0b29kIHRo
ZSBjb2RlIGhlcmUgaXRzIGFzIGl0IHNob3VsZCBiZSB0aGUgZGlmZiBqdXN0IG1hZGUgaXQgc2Vl
bSB3ZWlyZA0KDQpSZWdhcmRzLA0KU3VyYWogS2FuZHBhbA0KDQo+IA0KPiBUaGFua3MsDQo+IEFh
cm9uDQo+IA0KPiA+IFJlZ2FyZHMsDQo+ID4gU3VyYWogS2FuZHBhbA0KPiA+DQo+ID4NCj4gPiA+
ICAgICAgIHJldHVybiBjb25uZWN0b3ItPnBhbmVsLmJhY2tsaWdodC5sZXZlbDsgIH0NCj4gPiA+
DQo+ID4gPiAtLQ0KPiA+ID4gMi40My4wDQo+ID4NCg==

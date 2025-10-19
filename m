Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC8DBEDFA4
	for <lists+dri-devel@lfdr.de>; Sun, 19 Oct 2025 09:30:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D1A310E096;
	Sun, 19 Oct 2025 07:30:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cTgE1EO1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A91210E096;
 Sun, 19 Oct 2025 07:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760859011; x=1792395011;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Meuj6ypweZmG/WtN0mubYCnHNWDxK8bj95OsWQdkFFo=;
 b=cTgE1EO1tBhW1tFdrFym6fUPRVQYpT3y67kmC9omF9PzjlCngurX14ab
 cpCm25Ww2pZ9PfMl75Qh8ELIozMsob67X/+h4kVyeOyvgLjq/ZX9dJqmp
 0QA2ALb9IWLbynhxOdyUpITsy2vT/FDqsqBJDKdPVrlaM71UiiI35J6K0
 zZ/3CePvaY6QOCPuG2Ti2YkPKWWY0D6sTXbPE/HEdnW7BNCamoXAkQ8pc
 q4G3FXGxcoCm8hNeBtZnzVuJ/WklvyH52RVJbDcauWhM4M+ZY29S24P7Q
 kOumORnCwmoP6n7GDqx5P9q/QzeD8zzdEYZLNr8WJnGXl8Z2ul0qkAyDw w==;
X-CSE-ConnectionGUID: WeL2VpsGRku2PxK8jTQTvA==
X-CSE-MsgGUID: dBoTJFfsTl2hOaajQfXbXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74453138"
X-IronPort-AV: E=Sophos;i="6.19,240,1754982000"; d="scan'208";a="74453138"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2025 00:30:10 -0700
X-CSE-ConnectionGUID: B8A9qgFqS8SeLgD7jZyn1A==
X-CSE-MsgGUID: tFdoobGxT5O2x4eyJxuYQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,240,1754982000"; d="scan'208";a="183568947"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2025 00:30:09 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 19 Oct 2025 00:30:09 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sun, 19 Oct 2025 00:30:09 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.59) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 19 Oct 2025 00:30:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PqbNn2EHa5FNDr3NhvETRTPnPa0YjmdbplrbQyn0fP8GVrB5btAherEA4ghiORzXYkYxNEedXrQDaN+hC+VoZYgWPF+znKxtV7BY3Y1FJ4WHagMwZCrdOaFVa8ieIAt2/u9O7AYgTTx71Hv0FYO+g0LTBJMKH/ydu3tW2azADR1m3kAbipCOK/AN1eujpkDnRzptiXBno59GHD8oz95XDPgWHH6qH9QCQyWu/bUxugtwTrMr2F+oNPa43VNLtqRfREiv6xKZdo6WgOxS8mVrsjScXT41kBYd1kgOPvAkJAyxd6LOdGAKQAzbo1N+zN9Ii4Z34wGCSdzt2avd+nAx2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Meuj6ypweZmG/WtN0mubYCnHNWDxK8bj95OsWQdkFFo=;
 b=NAKy0BJkbCBtAwx77mRmCwAIBjvpxmPYSm1KBSiGzLxOU27jZ0a/rxv0je/SptNdKq0hwFVEO3EuQ5PoajkCj6paEfXBwEtJmINjBLQije0XV911pMWpX2qm+PkmGF5edzM++eDCrBr3/9PdJjf/5sJZOgXQ8n3m4xXL5FGvHvr3RjEbjc0z9l/zDU0m+X51Yx8+DxtH/6Ya0MgWahG3jHKkfY5BHokea0rvvVHyk7Le6bpfe6IcaDv8PETze/SbABS5Cb9z/XI1dczVZSvlbgBW0GRB96DlNCzL1KRjJgwaxINnkFQXHKYCuWTCYxCAK/pgnQpFDEQAZr2mvusYwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by PH0PR11MB7167.namprd11.prod.outlook.com (2603:10b6:510:1e9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.15; Sun, 19 Oct
 2025 07:30:06 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::22af:c9c9:3681:5201]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::22af:c9c9:3681:5201%4]) with mapi id 15.20.9228.014; Sun, 19 Oct 2025
 07:30:06 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: Randy Dunlap <rdunlap@infradead.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: Petr Vorel <pvorel@suse.cz>, "Gote, Nitin R" <nitin.r.gote@intel.com>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>
Subject: RE: [PATCH v2] mei: intel_lb_mei_interface.h: mark struct member with
 kernel-doc
Thread-Topic: [PATCH v2] mei: intel_lb_mei_interface.h: mark struct member
 with kernel-doc
Thread-Index: AQHcPtB2W4bh+Hb09kK6rlDxVOf6VLTJFimg
Date: Sun, 19 Oct 2025 07:30:05 +0000
Message-ID: <CY5PR11MB6366AC1589B2FE4E054ED6CCEDF4A@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20251016190941.1306157-1-rdunlap@infradead.org>
In-Reply-To: <20251016190941.1306157-1-rdunlap@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|PH0PR11MB7167:EE_
x-ms-office365-filtering-correlation-id: 104b080d-a3e5-4f57-29a6-08de0ee15341
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?TlJnQ1E2NVQ0dC9OcHVpSHBjaGE2ejFmUk9sWThPTHByeTUrT1RJMG1Idkoy?=
 =?utf-8?B?SzRUS0cxV3QzbGdyWGF5Q0FIWTVqNzRLZ1JLZzBzeXZjdFQ4dGdYQ1VWSndW?=
 =?utf-8?B?b0d4Y0dPb1cyT1FLNWF4L3kxUVl1SU1GNWVzdzBFL1ZBalJQOFZkcEFTcXEr?=
 =?utf-8?B?V3phbk9pVTJ5N2pIV005RnNVMXVFL042SGJYNU1xSzNvOUtJSnVPYmw1azFV?=
 =?utf-8?B?cmJUNC9ocVcxWEIzaUJkQXNTUEZHWXlxdVdudTE2ckVYOWpjUnJYWGNWOElD?=
 =?utf-8?B?Um1ud1VYMHd4NEhhUzh5dmFpY3RNVldDc25neWc2RUU1Z2JrU1pBWnFzTXRp?=
 =?utf-8?B?UkZhbFljOWhFRzlaTzdQUVU3My9ub2xNZTNXejRMdzl2ajU2SDJqUzBVS0t5?=
 =?utf-8?B?dmYvWTZCSW9RenlvMlVuY2lCcy84YmZWQU0vdHN4VzQzbExEM2RMM1E1VjJ1?=
 =?utf-8?B?cDlXeTJjSXEzbzhFOHdGbjNxQ3c2YW80WHEyK3lLTXVVWnpSNEFjQi9BNUFx?=
 =?utf-8?B?UlVMZ0VGZjlmWXJyRjd3WW80TkJMQ3pCRHRNYkRydDV0eDFUM1VmYitLMTZv?=
 =?utf-8?B?cE5icG14RXlrWmhrQUc4bVkrQzE3d2lHUW9JM2wyVXVvMXgzZnMwKy9ESE5E?=
 =?utf-8?B?S25kQk1CNXVvMXIwUTRPd29jSCt5RjRRYjZWa1NVdzRPdnM0a3lVdFFkN05t?=
 =?utf-8?B?MGg4Q0xvZGpMT3lnc2hTSFV6ZW4rTzg4ZExhS0FObk83RllHRDhEWjdmdlNI?=
 =?utf-8?B?Lyt5Z2Z1cVM3czNUWnlzaURsWFVFRjJJZGs4RVF4Si8zRXNXODMwRXk2VUg2?=
 =?utf-8?B?K29qUjhHdjQ0Sjl6OW84bDFPRzd3MlNkNElIV2tqTllNc1M2b0h0ZVd5cFhE?=
 =?utf-8?B?OFllbXJGR2JvR0lLVEpHZ3orVGV1WEVDOHUzdDg5cU94eThNM1NKcE5nRGlu?=
 =?utf-8?B?SVZSRW5BWCs1dHMzQmxpTVF4c0dQNXhvLzdRL1FDMzZwVnpMeDhOQUVWakc3?=
 =?utf-8?B?VUhKL0QyM0tRVlIxQUxRYm1RdTAwTks1Qm54bktZeXJXTGNQU2NSVkZuVTVo?=
 =?utf-8?B?ZTkrM09XWGRQK2l6WTB5blpKWml3Vm5iTUV4OHVjNXNLRjJPSnlBTEVLSFhP?=
 =?utf-8?B?RjQ5TXEyUFRORmZCeXVNRmlRaE5zR1gyNnEyd1czN0NyODVGK0wyZUZzQWVx?=
 =?utf-8?B?L2taOXZYS3FVcHlObkFMRXowWnlnaGM5Z0hFODZpRmxhT2ZiSDhicVZndURF?=
 =?utf-8?B?bFQ0Z2F4YnJPWEVlQzk2YWFUck1Zd2k2REtOYS9sdTMzWHF2RFRvZ0JGaUlD?=
 =?utf-8?B?aDdWTkorY2wyeGpvR2pPV1huVU9NYWZRbDVvVVBESnhYdjZKR3ZkRFRWdlJK?=
 =?utf-8?B?QmJ2Yk9hL0RDb054SUV3N2MvaE9uR3dsVG5kbHMvSGdHamlhUysrUG0xUkpj?=
 =?utf-8?B?NTVUS2tzRDEwcDF4ZDhBMDBoNWl4NGhTelBENDZLV1dqckFwZVgzTDd3TVBr?=
 =?utf-8?B?amllKzJmSzhJclFIei9zSDBLYkNzZEdlbGFma1pxZHNOckFicmszakY4MXIw?=
 =?utf-8?B?aE9WaERTdXQzUWxmMDhLc2VZWUFiQVdVdjB3a0N2bTdlSWVLaVgzMGtrQlMx?=
 =?utf-8?B?RmU0aWFtZWVMV21RRjdtN1RiWlFWQStiVmg5RnVlcEJibDVlUGhuRW4yZy9q?=
 =?utf-8?B?aWMzcTlZWktFSDlRYTlSQjAzamwzenBLalJ1Q0p2cWxBaUdvQkZHQWM1NXJm?=
 =?utf-8?B?aUFraDhsc2lNY0tCR3FnQ1l4aGtkQkdXaFlHcURtWmJmUUk5MXZJZW9VK21B?=
 =?utf-8?B?dUpmRlM3M2JlRWdVMFd6RGFXajFQWm9naXRSTGFGWnRaOWR2c0pLWGpTQjA4?=
 =?utf-8?B?cXRSaEtYZXczbGZISnVaM0tlVWx4eG9UdklsdVZ2NDk0ZkNlOXVqTGlLVFVS?=
 =?utf-8?B?bzlvOGdsckpXQ1lIZGIrbUt2Rk9IV3Jlb3RqbTFkOFYrVXo4UWdXeE5BNXpW?=
 =?utf-8?B?cXA3eXQvZlBnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6366.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aFhmdUxrUWFIUnlLQU53M29PWFBLN3pMQVgxT2I2cy9FT3lJMVRUakgxMXRQ?=
 =?utf-8?B?SUdrb1JUbXA5TEZOd3dldWs0MUlmTjUrQm9BT1VwM0EwWnk3S3NMZXhyaGFp?=
 =?utf-8?B?RUIxQmdsUHhYT2JIdUdZQXRlRkxSNk5BbHNIRnE0SGlmb3NKZGpVTWN3NFEv?=
 =?utf-8?B?RzlkRk5vM2RycG1WaWZvV3p4cEs3U3NacGRhTGUreDh1Ni9EQVNHZktQZUFo?=
 =?utf-8?B?SDRxRGJCN3dWNzAwQTZjV1VrZm5DbTVpL3dDM0dVWi9sYlBGSTVnTnkzTGVn?=
 =?utf-8?B?S2EyV0pxWG9pUFRyNkJZYVJCVGdzRyt2dUxpbzF1Y2JxYWtNSFNpWnlUUDJp?=
 =?utf-8?B?RXlBMnJPUEc1WHpyOTM0d2JneUFuM0c1YlBMeDlHMXhyTkNMZFJmWERpUllq?=
 =?utf-8?B?UEpDOFJGaXc4L2pyQ0VVbm4rWFRCb1M0TUtHVjFPZzUrVjB6Rjd5RjQ1MTQ1?=
 =?utf-8?B?YTBwQ3E4WDlOUXp5UWp5MjVSeVVFV3VtUWNYU01iM05rSWF3Z1hRZFY2MmU2?=
 =?utf-8?B?WXdTSXdSUG1xeTRQNUxOVnpiSUpyU0FnMXVhbHdYNStqN0hhYjdsa2VOcDM4?=
 =?utf-8?B?eHBVM0Z1TWl1R3dDeVRidHpFak9VdFl4SXpwQmtIRWhyOGF3QkFQUm1HZzM2?=
 =?utf-8?B?RDdCZDdjRXlxZVViU1dISndxdVlqSGFaMlpLbHk4WVE2QVQ3Y1Z6dW50d2h5?=
 =?utf-8?B?QzZnL29rVEFKc2dYckdZMXdNaWZYS0tXcVJMeGNHSVloM0FpdlVnclBVOEps?=
 =?utf-8?B?K3Ztd3ZBVUozQkg2b2dtWHV2RWw2R0sra2s2aW1uRURCSVpFcWd4c1J5eWxa?=
 =?utf-8?B?cWkzODBSSHJMZHlVMXNtNGN1bVhIZkZTVm0rYWVtVkw4Z0ZmVVhQUHg1aFdj?=
 =?utf-8?B?OEpjUktxZWpkdWpqYkdnWm1TQytVeG5vN0hRcEtERlRNeEV4OWRNdjlQajZ3?=
 =?utf-8?B?dXNhRnh3RWNDdlE1L2dKUzRZS3dYMWJsM3JVa0EyYXBucWxVakNLMDhoUkdr?=
 =?utf-8?B?NWJJcURiT0Z6Rk5ETFZzMHhoTVIwT1VReEwyQlF0NEp3UEpsNnpFcWluTDlZ?=
 =?utf-8?B?S0xTUVBVT1ltTEJTVDR6NWxQWFlMaEhUcHFHakF0eDNTU2dSdDhkekhDSzdk?=
 =?utf-8?B?NnU3SThFandzaFovRFRhOGJqZmgwOHNIM1JkUEZYS2RMYjlyVUxka3F3VDZQ?=
 =?utf-8?B?c2tTclM2QUNsS0tOVnplMGVkNGRTQzFFTitkRDhGQU5uTEVocGJTVCtDWHFK?=
 =?utf-8?B?RDVZYnJTTG5lbmsxV0FKZFdhUUFkSSttdVZEMm5RSDhSazFVYUVWTjBuYzIy?=
 =?utf-8?B?WFVBOUsxd25JN3pBQUFJbFIxbEM3ZnlPNUZPZ0RPaGFYcTRYRVRPRE5ia3Nw?=
 =?utf-8?B?RzZJeEZJdVRvUGE4Y0tmd0l6bEZXSlFjeEJrRDRjZDlzek9sR0xlR0I3ZEpj?=
 =?utf-8?B?aUNBZzhPUWVnWERwVzZGMWRVbG8vQXYydTgrOU5EeWwwNnhONjJzNEFnOGZa?=
 =?utf-8?B?VXk2azcwQ21yNDYrVHNVdzJheVhvaW1qUGtNU2NqUHJMM2pCdENxdmdLY0RO?=
 =?utf-8?B?S05nSVhkTkkxT2orWnBjOFc0dXExYTY2OUQyTVBDTTE3UzV4Z2lLOCtpbmd3?=
 =?utf-8?B?ZllJdmgwMmRpOG9EeFpVYit1SDBLZnhqYnV0YkVhUGlRblpVOVM1dTNOa2VL?=
 =?utf-8?B?NWNnMDlKNzZvaXUrZEZla0JlZk9aQTdzQzZCSlF5K3V3bzFpQjUra01yb1lJ?=
 =?utf-8?B?K29oMlVpYUVMQ2F0SXgxaGhLeWltSW1na2dwRjNxT3Rscmw4bkNHMWV5YmVC?=
 =?utf-8?B?TUVoa0VnalpSbUxmWW5ra0h0b0xrM0tSMnc5dXNINGptS1FDK3VVK2pWTTR6?=
 =?utf-8?B?YlZhUGNad0dENC8rZGNJQys2ZjJEKzcrL2lmRk9RVUN2cDlMYVZoUTQxbFhl?=
 =?utf-8?B?OW9GMm5YeTJlbkV0TEpMc3BpWlFEMG54QzVvM1Q4ajBsRDdFcUN2N2ZFWUlk?=
 =?utf-8?B?bTluMEkrM3NXNVN3Z3pVbVZoY3JOYldMY1hsdzNjRi92b0lKMEk4Y0dvZmFV?=
 =?utf-8?B?aGthWFlHeWtMN1FlaC9pcjIrVmtaQ24vQXdhZmF0RGFOYkFNcGZaenBCVlZN?=
 =?utf-8?Q?A/g+k6JcQFeoDyj8fOvATa/MM?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 104b080d-a3e5-4f57-29a6-08de0ee15341
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2025 07:30:06.0196 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C36C2khlZjdNsxocxAIhtCe7iEFanwOwv+DHAl5OD1fa+vMGpAqv0jVdmzi/TGOUWR4AV0LzqzIIyr/BGXafhE7wFfe0qorXRmpcL9edNYw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7167
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

PiBTdWJqZWN0OiBbUEFUQ0ggdjJdIG1laTogaW50ZWxfbGJfbWVpX2ludGVyZmFjZS5oOiBtYXJr
IHN0cnVjdCBtZW1iZXIgd2l0aA0KPiBrZXJuZWwtZG9jDQo+IA0KPiBVc2UgY29ycmVjdCBrZXJu
ZWwtZG9jIG5vdGF0aW9uIHRvIHByZXZlbnQgMyBrZXJuZWwtZG9jIHdhcm5pbmdzLg0KPiBAcHVz
aF9wYXlsb2FkIGlzIGEgc3RydWN0IG1lbWJlciBoZXJlLCBub3QgYSBmdW5jdGlvbiwgc28gdXNl
ICdAJw0KPiBhbmQgJzonIGluIGl0cyBkZXNjcmlwdGlvbi4NCj4gDQo+IFdhcm5pbmc6IGludGVs
X2xiX21laV9pbnRlcmZhY2UuaDo1NSBJbmNvcnJlY3QgdXNlIG9mIGtlcm5lbC1kb2MgZm9ybWF0
Og0KPiAgKiBwdXNoX3BheWxvYWQgLSBTZW5kcyBhIHBheWxvYWQgdG8gdGhlIGF1dGhlbnRpY2F0
aW9uIGZpcm13YXJlDQo+IFdhcm5pbmc6IGludGVsX2xiX21laV9pbnRlcmZhY2UuaDo2NyBJbnZh
bGlkIHBhcmFtOg0KPiAgKiBAZGV2OiBEZXZpY2Ugc3RydWN0IGNvcnJlc3BvbmRpbmcgdG8gdGhl
IG1laSBkZXZpY2UNCj4gICogQHR5cGU6IFBheWxvYWQgdHlwZSAoc2VlICZlbnVtIGludGVsX2xi
X3R5cGUpDQo+ICAqIEBmbGFnczogUGF5bG9hZCBmbGFncyBiaXRtYXAgKGUuZy4gJUlOVEVMX0xC
X0ZMQUdTX0lTX1BFUlNJU1RFTlQpDQo+ICAqIEBwYXlsb2FkOiBQb2ludGVyIHRvIHBheWxvYWQg
YnVmZmVyDQo+ICAqIEBwYXlsb2FkX3NpemU6IFBheWxvYWQgYnVmZmVyIHNpemUgaW4gYnl0ZXMN
Cj4gICogKiBSZXR1cm46IDAgc3VjY2VzcywgbmVnYXRpdmUgZXJybm8gdmFsdWUgb24gdHJhbnNw
b3J0IGZhaWx1cmUsDQo+ICAqICAgICAgICAgcG9zaXRpdmUgc3RhdHVzIHJldHVybmVkIGJ5IGZp
cm13YXJlICovDQo+ICBpbnQgKCpwdXNoX3BheWxvYWQpKHN0cnVjdCBkZXZpY2UgKmRldiwgdTMy
IHR5cGUsIHUzMiBmbGFncywgY29uc3Qgdm9pZA0KPiAgKnBheWxvYWQsIHNpemVfdCBwYXlsb2Fk
X3NpemUpDQo+IFdhcm5pbmc6IGludGVsX2xiX21laV9pbnRlcmZhY2UuaDo2NyBzdHJ1Y3QgbWVt
YmVyICcqIEBkZXY6IERldmljZSBzdHJ1Y3QNCj4gIGNvcnJlc3BvbmRpbmcgdG8gdGhlIG1laSBk
ZXZpY2UgKiBAdHlwZTogUGF5bG9hZCB0eXBlIChzZWUgJmVudW0NCj4gIGludGVsX2xiX3R5cGUn
IG5vdCBkZXNjcmliZWQgaW4gJ2ludGVsX2xiX2NvbXBvbmVudF9vcHMnDQo+IA0KDQpOb3Qgc3Vy
ZSBhYm91dCB0aGUgcmlnaHQgZm9ybWF0IGhlcmUgYnV0IHRoaXMgcGF0Y2ggbWFrZXMgdGhpbmdz
IGJldHRlci4NCg0KQWNrZWQtYnk6IEFsZXhhbmRlciBVc3lza2luIDxhbGV4YW5kZXIudXN5c2tp
bkBpbnRlbC5jb20+DQoNCj4gRml4ZXM6IDc0MWVlYWJiN2M3OCAoIm1laTogbGF0ZV9iaW5kOiBh
ZGQgbGF0ZSBiaW5kaW5nIGNvbXBvbmVudCBkcml2ZXIiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBSYW5k
eSBEdW5sYXAgPHJkdW5sYXBAaW5mcmFkZWFkLm9yZz4NCj4gUmV2aWV3ZWQtYnk6IFBldHIgVm9y
ZWwgPHB2b3JlbEBzdXNlLmN6Pg0KPiBSZXZpZXdlZC1ieTogTml0aW4gR290ZSA8bml0aW4uci5n
b3RlQGludGVsLmNvbT4NCj4gLS0tDQo+IHYyOiByZWZvcm1hdCBsb25nIGtlcm5lbC1kb2Mgd2Fy
bmluZyBsaW5lcyB0byA8PSA3NSBjaGFycy4gKE5pdGluKQ0KPiANCj4gQ2M6IEFsZXhhbmRlciBV
c3lza2luIDxhbGV4YW5kZXIudXN5c2tpbkBpbnRlbC5jb20+DQo+IENjOiBMdWNhcyBEZSBNYXJj
aGkgPGx1Y2FzLmRlbWFyY2hpQGludGVsLmNvbT4NCj4gQ2M6IEphbmkgTmlrdWxhIDxqYW5pLm5p
a3VsYUBsaW51eC5pbnRlbC5jb20+DQo+IENjOiBSb2RyaWdvIFZpdmkgPHJvZHJpZ28udml2aUBp
bnRlbC5jb20+DQo+IENjOiBUaG9tYXMgSGVsbHN0csO2bSA8dGhvbWFzLmhlbGxzdHJvbUBsaW51
eC5pbnRlbC5jb20+DQo+IENjOiBKb29uYXMgTGFodGluZW4gPGpvb25hcy5sYWh0aW5lbkBsaW51
eC5pbnRlbC5jb20+DQo+IENjOiBUdnJ0a28gVXJzdWxpbiA8dHVyc3VsaW5AdXJzdWxpbi5uZXQ+
DQo+IENjOiBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBpbnRlbC14ZUBs
aXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBnbWFpbC5j
b20+DQo+IENjOiBTaW1vbmEgVmV0dGVyIDxzaW1vbmFAZmZ3bGwuY2g+DQo+IENjOiBkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IC0tLQ0KPiAgaW5jbHVkZS9kcm0vaW50ZWwvaW50
ZWxfbGJfbWVpX2ludGVyZmFjZS5oIHwgICAgMiArLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiAtLS0gbGludXgtbmV4dC0yMDI1MTAxMy5v
cmlnL2luY2x1ZGUvZHJtL2ludGVsL2ludGVsX2xiX21laV9pbnRlcmZhY2UuaA0KPiArKysgbGlu
dXgtbmV4dC0yMDI1MTAxMy9pbmNsdWRlL2RybS9pbnRlbC9pbnRlbF9sYl9tZWlfaW50ZXJmYWNl
LmgNCj4gQEAgLTUzLDcgKzUzLDcgQEAgZW51bSBpbnRlbF9sYl9zdGF0dXMgew0KPiAgICovDQo+
ICBzdHJ1Y3QgaW50ZWxfbGJfY29tcG9uZW50X29wcyB7DQo+ICAJLyoqDQo+IC0JICogcHVzaF9w
YXlsb2FkIC0gU2VuZHMgYSBwYXlsb2FkIHRvIHRoZSBhdXRoZW50aWNhdGlvbiBmaXJtd2FyZQ0K
PiArCSAqIEBwdXNoX3BheWxvYWQ6IFNlbmRzIGEgcGF5bG9hZCB0byB0aGUgYXV0aGVudGljYXRp
b24gZmlybXdhcmUNCj4gIAkgKiBAZGV2OiBEZXZpY2Ugc3RydWN0IGNvcnJlc3BvbmRpbmcgdG8g
dGhlIG1laSBkZXZpY2UNCj4gIAkgKiBAdHlwZTogUGF5bG9hZCB0eXBlIChzZWUgJmVudW0gaW50
ZWxfbGJfdHlwZSkNCj4gIAkgKiBAZmxhZ3M6IFBheWxvYWQgZmxhZ3MgYml0bWFwIChlLmcuDQo+
ICVJTlRFTF9MQl9GTEFHU19JU19QRVJTSVNURU5UKQ0K

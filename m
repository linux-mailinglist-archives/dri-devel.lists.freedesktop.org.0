Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DD48CB0CF
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 16:56:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3E4F10E537;
	Tue, 21 May 2024 14:56:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="my2gQPzD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42BE310E51A;
 Tue, 21 May 2024 14:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716303388; x=1747839388;
 h=from:to:subject:date:message-id:content-id:
 content-transfer-encoding:mime-version;
 bh=zfClGMG9bZt/Fm4OClKYx5Na0MnWVm/2W/7JJ2Vd4l4=;
 b=my2gQPzDIpWBxK/80ywo68J/7/RIC/ngNgTAmpFOYxZUH3ZyVnG0XtQc
 9jROkjBMDarkkPTI3haPJTYMuf8Fqu2+4EqCtW0QB8W4kaRfJApFKGvk4
 ngD2q5ThUnghucevB2wUckSKlp9ceyTFuvMBKR3zXRRNxDfrPi/VAKS1O
 F8OA/ACDc87x6elPhVGwny2yxEA8FN1cYXF9loR9I5qblPQ4fYBdyp1hY
 ocsRL9VMooH4oOpBoXiG+LAVB1nBTp+CnYQ5Wt09zfjYl8bWc3J9VFHJd
 touV1V4VZSaWBaYw5a1ATKMziv526sb1IeUByLmqx7oFm23oGRaDRNyCB Q==;
X-CSE-ConnectionGUID: zX/A7KDnSTOJC6n0NESZfw==
X-CSE-MsgGUID: CBZVfq+SQvyUfurjeSb4Eg==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="12618349"
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="12618349"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 07:56:27 -0700
X-CSE-ConnectionGUID: KvsuoDNxTTufhH6VCGr+5w==
X-CSE-MsgGUID: DYmtXAm2TfW+Gpj4hcXs1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="56176890"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 May 2024 07:56:26 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 21 May 2024 07:56:25 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 21 May 2024 07:56:25 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 21 May 2024 07:56:25 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 21 May 2024 07:56:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QuDKKwlkdOLurZKPLPWBTEgx6x0DhvAw8PI7EfjA7UD5qYy5JhdrdRN4aP1XeHn0H8WVfhtp0YTXYzU2WPe35fpfqJY94WuEGHX9Z4H77mf+I38yEBXbqqng5UfW9cxDOixtKIg+t6QZsDCUAYTPg8WvdJcIq5tMmroJHdMBTfjoVdNxyvv8xoKrf46O11n4xNjOll3bLhE3+eZgFVLKu9QjJPo61BXcu4QWc+ZrK4JITr8LIsUEBwv7Hf8CgTKE6hG5HyydatcfFx5bLas3VxOG0U/kquC/TPDIbWifHbu9kwKaCh2xec811mpk0gxcSNZ8tE5cTafUwUJMLQ8vMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zfClGMG9bZt/Fm4OClKYx5Na0MnWVm/2W/7JJ2Vd4l4=;
 b=Ac59lr1JQRLlJzgkDvLjwXAeXa7ljJraWGUNSJ001ZBSABXpBUcbsQXBXO+mShpz3pnWwN49xlPqjFcY2+CUoU/LG5zm0BvPnJcOy9W+NqlpgBzIAZOgj4Snoi21dVmLfsMRSty0Q2ykvEm9wLlrrTaLIANK7dqYAhGcUO1SPdRDbMyt/gOjAYmZan4c/ZuUQyirTxq5IRdj87UAEfazTwOHHzIOPGdndvJ0WEmfEQ1SyCSeiML08BELtrkNE9FfvByytQ49s7+B4IVHRAno/Ar1Y86qqZ+AhD0t31jlgWOoTWJNMHBvNfAuyZaDLSHlsW0ZPC6HXs9vg/I0LT0HSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB5861.namprd11.prod.outlook.com (2603:10b6:510:133::8)
 by DS0PR11MB6493.namprd11.prod.outlook.com (2603:10b6:8:c3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Tue, 21 May
 2024 14:56:23 +0000
Received: from PH7PR11MB5861.namprd11.prod.outlook.com
 ([fe80::b320:4d74:ffda:ecbf]) by PH7PR11MB5861.namprd11.prod.outlook.com
 ([fe80::b320:4d74:ffda:ecbf%3]) with mapi id 15.20.7587.030; Tue, 21 May 2024
 14:56:22 +0000
From: "Knop, Ryszard" <ryszard.knop@intel.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
 "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: FYI: drm-intel repo moved to fd.o GitLab
Thread-Topic: FYI: drm-intel repo moved to fd.o GitLab
Thread-Index: AQHaq48LgAqI5R+kM0GELBreBzuwmQ==
Date: Tue, 21 May 2024 14:56:22 +0000
Message-ID: <adff92fd559f6798690e3050b4474b099a3dde75.camel@intel.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB5861:EE_|DS0PR11MB6493:EE_
x-ms-office365-filtering-correlation-id: 20422589-ba61-4669-1852-08dc79a62e5e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|366007|376005|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?bFdzMlBDaHVETVQzNmxzbHdIVGZEdG56SkRYUXZZRTgxQ25Sd1lld0l0LzdL?=
 =?utf-8?B?bWFxVEJjaDNXTEN4SkI2T0hmN2lzeVpMNy9laDY5T3VKS2F5MWtYTTFKUEp6?=
 =?utf-8?B?M2d4SGNaSVU5cldnQld0dTdQZ3JjNWg2cC9iMDBFOGExZHd6ODlPZ1pkdzUz?=
 =?utf-8?B?YVRFNzdlQ0RGNTlmK0JRbDBJMG1yMDlPc0dCRVJhYS9HbVFHYXg2c0M5M0xK?=
 =?utf-8?B?Um1ncEJRQUxuZE95L1ZZMHFhL2VXTmZlUU05SmNNZkJpaEc4SDhOY0tLcDhY?=
 =?utf-8?B?TVZDeGJaUGw3SUlXbkRZdE1qeWFBS0h0K1dwY0pmeGNhL3o1K2R5WmlGQU9X?=
 =?utf-8?B?TCtYYlk4VnBPM2szRWlPcTVtci9yL0Z2TWVxN3UyYnBsY0NhT050SlFURUth?=
 =?utf-8?B?RnB5cFdIUFFrbDlqa0h0M21KNFk5VjkxMk4vVDNSem94dkJIZWhyZDBsYi9H?=
 =?utf-8?B?RHBUTE9EOVpZSlp6aGZBSnpGNkEwdDV0Mk5Pam9DWjBiQWxZK1NlYkV5N2NH?=
 =?utf-8?B?QndYNy9JdVhYN010bHBIMjhmekhvdmNjUWRPS2RxdnMyNUNyRGJGMWlSbVdz?=
 =?utf-8?B?STVWOFZ3Vnp1OE9Za0cxWGg3U1VEL0xic0lvZ1JodEZOOGtXTmpVVWdNTk9U?=
 =?utf-8?B?ZWxWS0dzZW5SZFZRSkJXK041YWNOSHRhbnk4TkFWaFBObUU0STlrZXJVZTQw?=
 =?utf-8?B?YUd3NWtpT0NoTWlZREh3ZGJrOE1MTTVtUnBxVVNQUWxDcjNaSTR1c1prcTNn?=
 =?utf-8?B?cHFMK2tSbk5JMU9odFJLMWFaT3N3N0ZUMnhGdVlRSXZxdWtCRUN1dFU1eUpJ?=
 =?utf-8?B?aGJMSWlQTkNwSzZycElDRTlQU1AvQmoxMHNMOUVmZ2t0M1A5aE1xclA2KytI?=
 =?utf-8?B?RTZwWGVQMlp4WWdITnY5aG1pMUxaUm5UN1lDcEw0cXRVcjJJNDlqcEF1djlo?=
 =?utf-8?B?dFRObW4yT1RXNlZaWlpZNjBtMkZIWjU1ZlcwWmFNZ0t0WWhIaFlFR1hWei9O?=
 =?utf-8?B?cE15eklNNFFJczNXRWg2Rk9wWlpRNVdmb3hFeFlJNEY4SFRlTDNLRWN4bUxR?=
 =?utf-8?B?Lzg0ZktlZGtTVWI0ZFhIQ1ZLU0NlcVgwMTF4SmFCcWxKd2RMOWpZdUUwWDIz?=
 =?utf-8?B?QzZJWkwrK1dQRGk4L0pmTTI1NzZGM0U5eXVIeHM0Um9LK3NNc25ac1N4cURX?=
 =?utf-8?B?eGtnNTlNUk84NEwrSENKUXNrb1Q0MTRlS09rZjZhSytUeXVFYVg4ZFppL0xw?=
 =?utf-8?B?MnhjRkFlVUNoUmo4TStuRmI1M282anltS08rcHN6UGgyNGtPSWxvcEhMdjdF?=
 =?utf-8?B?U0ZZVGdTTXZTTTlYR2xOQkxRTGk5alRMWFlYb2dWNkE1cStSVm04ZHQ5NEFx?=
 =?utf-8?B?RFRUdld0MXJYWkZQcXovOWN6MmQ4ZTlQZ2hHd3lPQzRTWWZZbDRUWGhtajNV?=
 =?utf-8?B?RUdNQmUrbEN1c28wVHV0T3AxWlJmK3ErWitESnJWRmV2WGxlS3Mwd2E2aEQ5?=
 =?utf-8?B?dDVPNEoxc1c4T0tjSGcvTEFKYTJkVFcrY0xUN3hmcDB0MCsyNkRaTFc0bURp?=
 =?utf-8?B?RnowZTVaUDNxREM5eU13eU4vSTVCcTBmTlFwNnRoQU9pNHc0K3hMRHJHdWFv?=
 =?utf-8?B?NEhSSUk4c29iaW9vbU5iakZhbkttbmFqV0RzWGd1OC9OYWVHNU4vcXpuUDNy?=
 =?utf-8?B?ZG44Yk9LNWZaU21GaW04Q085dDBKY0tudUxEd1phVjdIa0U1bDVsNmYvYWth?=
 =?utf-8?Q?VXC5vn1eieXNxARpcw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB5861.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WWs3bjA2UmVuVU91UzNYMmd3eGV4bmVlY2MzZXlFOUlpMkVBMGcyTnhuQmNt?=
 =?utf-8?B?VnFWaVdSa2krY2JUMzhCMFNLSXJLNVNyMVJaQ2I1RnU1VkNiS0pycitjRUxT?=
 =?utf-8?B?N0x4eDFpWDBpVkpxKzk3NG1NdWRHWWpjRk1XL0lXRVMvR1FXQkcvbFgwYU9N?=
 =?utf-8?B?TmdMRkRlVUMrRzlaRUt5R3NDSzg4TmdOeFZmTCtNVGZpY0pOYXlObFhqYTFz?=
 =?utf-8?B?SnRYR2tQTnJ1SFYyNWM0UXdOZzJwNE55VUFuVWJYNitTZFlRWXY4SVN5UzdW?=
 =?utf-8?B?eGFKVkFkSGdPL0FwTTFmWWZGTTFtTm9OTkk5U003U1RDUGFPbUtDdTM4RXBX?=
 =?utf-8?B?dk5mMWRvSFA1dERyS24xWUNmMy9uRW1YTHVJbkNKT0xQOHVCdGxlaXJMdDlv?=
 =?utf-8?B?ZmVyUkRaV2R1ZDB4WUduKzQvcVlNOUtldHVOOEVOQ1Q3RGZhOHp5VE9ORGtT?=
 =?utf-8?B?akdtNDN2eEQzRFNJY3M1Y1FFemZkSUh3Q1J6SzJyQy9pTDlqZFNXek1QTTF0?=
 =?utf-8?B?dnNOaXM5Rk9RaWdnMDFTUlN4eFVaUWRCK0hUUlZqOFZMSkdwMnZ1V2ViSCtT?=
 =?utf-8?B?a0V1czMrcno4UC9qUmhWYm1JeUZFc3ZRdXNRTFErblgyY3VHNUt1cXZFYThV?=
 =?utf-8?B?VG1IK1IvcG9aSHY3YUY4cTVHUnJlQTRsMWNHTFdxM0l3YzFicFRCQVdiRW0x?=
 =?utf-8?B?VkY4S3E0Ly80Q1RubjA2V3RJQmF0YXVDdFpqZHFhdkpDSlFOdVl6RVNRRHgx?=
 =?utf-8?B?WHE1UWZaZ3lMdEJ5UklnOWMrN1VGSktEMzdOTGJuMHpUQ1owNnl1QkR4QXVs?=
 =?utf-8?B?MGN0cFZteS9vNjdEQ1dXVHkyWFJjRW1Md1E1dFU0NkFobWlQeEpKVVBHZ1p1?=
 =?utf-8?B?V2djRXFPM0hRZ3dGNkxSRU1XdThFT2xVZzV3c2hoeTgzd0NpYUZncXFMbXdK?=
 =?utf-8?B?NUNER29nUFNoR1kzMDlvc2I3K1UrMFlMRldkbEFCaEQ0TCtlSUFpRHpHNjcr?=
 =?utf-8?B?Z0dWcjI2NUM1UEd3Vm1hTFNiZUxmZWE3RWtxS1dBZDI2c0NwRThCZ0Y3Ukti?=
 =?utf-8?B?aWVJNDcyeEJscURuVnE5Wld0TTNOdEhvaXU0RXFteTlXMGVSeVQ1Y25tT1Jl?=
 =?utf-8?B?SHFBbVRndjlqQU5RUUd4TmVlS3JOQUdiRGtmUDMyb3BqRjh4dGdrREtpZkY5?=
 =?utf-8?B?b1pGSEJQbmRZQ01pTmNTaUVmcGRIdmh0TmV6cTJJTW5MWXhoZFo1VjMzQUd1?=
 =?utf-8?B?bjMwbzRkRWh0ek50d3YvcVFHQzZJNnVXL1lUc3ByMTJvaHRQYWlUK2l1R0xm?=
 =?utf-8?B?QmtJQ1J5akkzUEZSaURjRG5jemJxYlRwdzkxekhXU0UwMTNsOTcvMFdxNHNX?=
 =?utf-8?B?eE9CUU9SQWZwVW1helQzMjRSNjRlaEM2SmZ3d2JyLzhqMEFGZFNNSStnbGN5?=
 =?utf-8?B?clpMRXBoc0hKQTEwL0NiU0M5NFpqZzk3YXY2b0xCK3RZWDBpeUltN3NObHNr?=
 =?utf-8?B?b2loSWZLeTF0RGdEZmsyWTZSTlFYR3lUbWlRdUxTSXB4OThxT2hYbDRwcGVV?=
 =?utf-8?B?U1NzbmxlandMZTJjZit6bnE1Sys3bXRBb0k0WTIvSjIyalZSemN4SDdnNWpv?=
 =?utf-8?B?N1VJK1hpQ0QzelFUeHR2aEdubkZOL3Yzb1ZPeHN4bWN2bGxveGNWNTIxOURU?=
 =?utf-8?B?SE0zY2REaEtJNHZOMDZseFUwSEJOVEgvYm1MTU1WLzIwVzVQb3A3SnR6NUxP?=
 =?utf-8?B?amFCOTZhRWhzL0wvRDUzYnJLeWRjQ3RJalVMdVkycWRXR3Racy84bkk4Z3FC?=
 =?utf-8?B?d1JTTHQzMEw4R0xTSi81VlV2c0FPTXRua1FCREJHb0dZK2NiYnZNZnViRHhp?=
 =?utf-8?B?cVh0bEVUdThDMnB4TStSUUd5WGFuZGY1MFdFKy90akdFRlNsRktQMHJKNFZ5?=
 =?utf-8?B?USs5M2NrdEtqSGowQm5tamU1bWttNEpxRE1nQUxrbDV2TEEwT1RQTnc5N013?=
 =?utf-8?B?dXR3bTBIR0x4ZCtIZWxGd2prL0RwT0luZUhuNXNpZ09CbnhmK1FUWWRWMzB2?=
 =?utf-8?B?L1ZPVXR5YUs3bDNvNDlCMEg2eDYvd3hTWk1tZjlQaUhQcWo3dEZkNjNHZU1L?=
 =?utf-8?B?MTJUNEIvRi8xYmgvNFZPNGxOZjJQbi82WU5IRGZWdFVPNkRTbG5WWW8wdkh0?=
 =?utf-8?B?Zmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FADC79A8E0A0154A85B9EDFB420D1F8C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5861.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20422589-ba61-4669-1852-08dc79a62e5e
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2024 14:56:22.9066 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZQlrQlXbk1mqexwpYXKnaFQktpe07IJwF9f4idSaXVxPF7uCN+enxQVH/xGtg3E86g0zCc4KR2rYnunr4fT1nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6493
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

SGVsbG8sDQoNCkFzIG9mIHRvZGF5LCB3ZSd2ZSBtb3ZlZCB0aGUgZHJtLWludGVsIHJlcG9zaXRv
cnkgKHVwc3RyZWFtIGZvcg0KZHJpdmVycy9ncHUvZHJtL2k5MTUpIHRvIGEgbmV3IGxvY2F0aW9u
Og0KDQpQcmV2aW91c2x5OiBodHRwczovL2NnaXQuZnJlZWRlc2t0b3Aub3JnL2RybS1pbnRlbA0K
TW92ZWQgdG86IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vaTkxNS9rZXJuZWwN
Cg0KVGhlIG9sZCByZXBvIGlzIG5vdyBhIHJlYWQtb25seSBtaXJyb3Igb2YgdGhlIEdpdExhYi1o
b3N0ZWQgb25lLg0KUmVsZXZhbnQgZG9jdW1lbnRhdGlvbiBhbmQgbGlua3Mgd2VyZSB1cGRhdGVk
LiBUaGFua3MgdG8gYmVudGlzcywNCm1yaXBhcmQgYW5kIGRlbWFyY2hpIGZvciBoZWxwIHdpdGgg
dGhlIG1vdmUhDQoNClJ5c3phcmQNCg==

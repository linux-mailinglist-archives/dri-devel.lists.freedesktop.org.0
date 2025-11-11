Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41884C4A364
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 02:06:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFF4110E4D9;
	Tue, 11 Nov 2025 01:06:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VN/txSxz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F53910E4A4;
 Tue, 11 Nov 2025 01:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762823214; x=1794359214;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ZnDNQOgKDalRC3mUseG8iEV6GIfBZe6afO9ChmApJ6M=;
 b=VN/txSxzppx85WbFT9NaoH8HEb+IrT/VJAbo0MpwidIsE+reAUdgj4l4
 K17unXTCWSeMn//Hxzngl+2pENxZjRYHXQ/3yOtPnAu7T2WN/elI80Bvp
 ILdINXAgjNrMLhhA+L05goVEMKLXTopkdHFQkajfTI0XqOcDKPo1h+p7+
 2Ys6f18ZuOj0fB5AzDgCdsnf/fADXa3CcWixQYxoJNNPO2XYyLhBd6tQx
 c2VWAupkDeCuqWgnuNCxBFgPzSLoNxu2T0wt783wnePyLPGRA9LVFp94t
 0lEwh7jstlQ9MpYCPFvDCbPEIVUX81ZNciAvCyP/qvUTlyuaq8cconEoU Q==;
X-CSE-ConnectionGUID: cnDkL3mzSk+rXPEub6h+tA==
X-CSE-MsgGUID: x7PsZ8qNTaetfVCHGxo63Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="64582244"
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="64582244"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 17:06:54 -0800
X-CSE-ConnectionGUID: x0WM0T3eSj2iVTgn6hzgNg==
X-CSE-MsgGUID: v2RgZGl4QWmfBCRTWfIsqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="189073683"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 17:06:53 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 17:06:53 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 10 Nov 2025 17:06:53 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.4) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 17:06:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sYuZRd8Ses4RbzRli9+AckG/d78beHy9i0uDd3+oBmSjKrZjnBE4AGJc9NAoW9HSbZBN4ANzSxfUV9RKdqfG+p8Dk1D+TsWPl5kJgWd2kq3LWNO1TtIbuH9+IqD4aogxJH3sEeyEERHQy1G2Cid7hsS01W4Se/OYmecxtpYkwm/8G11NA6KCk6LPYEgf445Yf9m39hM46QX2kBdm+PlPo/zPIM0E9meIQmIb8yjfToaCDSN43BPrVqKppNCiAwpFPbaVRNQf0VkPdZRS+H0opAYtHK1JVSLLfFRsNI5fSoyq0NvbQlNamcHvc5lvFxYRTzSB3Jfyj5Oo/TR2za3qNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rSJMxu3F5Ob7NVhAVdCX1sHB9rRfvJSPSJvqRujjjKc=;
 b=h1T/zKjoP/nJRzpfKJPH1equp54kYBNGsuKRKvVy7pqPfXQsqcAhyDn8DQhKmAmIlGlB8wwFacjZmGi79gN37tTbtA2oD842TPeQUDCU5gxZZKKRBD/VnXLdTOCurpWTjpyvy2mNb7RsohfNi5xSyFbTdq8W4Ui+f0QyFdFgYiPD93fXNO+Fc3D0U+lLSE+d62IXyGtOKKbCeNfLDmJwDnya2zSBOuWyHxImz/G8LQWO5visCBouKBat1Onos8HlP6fkBpAViLO5VLbqhjJExrZocEhu58wp+Z+CXrLZMgJskA4T8cSKvxcuAJn0uJjFKvTPI0vT5ZqnUK90dlRzDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CO1PR11MB4931.namprd11.prod.outlook.com (2603:10b6:303:9d::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.16; Tue, 11 Nov 2025 01:06:51 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 01:06:50 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Alex Williamson <alex@shazbot.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum <skolothumtho@nvidia.com>,
 <intel-xe@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kvm@vger.kernel.org>, Matthew Brost <matthew.brost@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, Christoph Hellwig <hch@infradead.org>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Subject: [PATCH v5 25/28] drm/xe/pci: Introduce a helper to allow VF access to
 PF xe_device
Date: Tue, 11 Nov 2025 02:04:36 +0100
Message-ID: <20251111010439.347045-26-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251111010439.347045-1-michal.winiarski@intel.com>
References: <20251111010439.347045-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0010.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::12) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CO1PR11MB4931:EE_
X-MS-Office365-Filtering-Correlation-Id: 766c328a-9ee2-45c9-8158-08de20be9855
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aUZtNm5ybm0zUVp0cGZMdGZua1RnV3A1R0g4RW54WXM3NmloU3d6dEZ1VnNx?=
 =?utf-8?B?ZzJsSnFhQWt5OHp0OFpBN1FmMnYxNGFTUEoybElrSUQvOERNWVNZRFhQRVRS?=
 =?utf-8?B?Si8vbGR5eVd0bVB3ZDNiWW5DUG5uTFR0UXJkanhJOW54VEFhd3d1MkZhY0VJ?=
 =?utf-8?B?ai9DWHY1UVNlTStVdzRObmo4M1hJWGdFekhOZE5yb3QxeFZPeU9LVjEwem1o?=
 =?utf-8?B?cTZhQXozSHBpVWRab0JUZTFMc2J2R0cwVC9leHV2SUJ0a0c2ZU5aY013bHpE?=
 =?utf-8?B?NW1zajQ2cGFKVDlnZllsN2FlMHRRWUFFek1oc3NNdXFwTDZGUlJvQ0EweXMy?=
 =?utf-8?B?SGJvN1YzbWhMMWxtdEplTFZKYzhWWHRZeW9obnB5VzFEV2VleURaY2V0b2Uz?=
 =?utf-8?B?dEkxbjdzMDBwbnFLMituTUVGbmtGcXRZTjZLbDR0SXhkL3o4VkFnV04vSjdt?=
 =?utf-8?B?Y1ZpNjdEZmliRzRVNGFnSy9CMEEwSGdsL2tQVEIxNjFwY01rd2drdjc2UVFU?=
 =?utf-8?B?ZnVtZUkrOXc4QnNTLzI5aC9oeU5sNlhpa3RMa2YrbUpUbElENmpNNXJoSlM2?=
 =?utf-8?B?N0h1QVlldW1WV01SREZWQjBSYUZDQUE5emZzdVhaTHpUSkVsSjVyQm1aS0Ev?=
 =?utf-8?B?WSszWXRvcWpMT0lBL0Y3dE1OWmdNaVQvaVYzRTMrWWtuQldqS2JJZ2RORGdI?=
 =?utf-8?B?Y2NudVVBQzBWaUV4RzFMVDN3RW1pTldrSzg1SElLYnl6RVBud1RVUEZQS2RJ?=
 =?utf-8?B?T2JZNmZYY1c4SmU1cmo1ZXNvY2dzdmVmZkdRVU8yZnUyOWpKbjcvWXBoM0JG?=
 =?utf-8?B?NGw2UGFxNWVUQlFyRXlYMUtzaXFTMnpiN25mcUhtRW1GQkxrL1crb0QwZnVR?=
 =?utf-8?B?d2daWkRGRnBQSVE5WW4xMTh3Z3pzTEMyMXZnUml2M2Jpb1oycG9qUjBFYjBj?=
 =?utf-8?B?TXF6d3lsUjJjN011STgxaDRFNFN3VjYzZU91SVhFalJXNDREWTA5YVpmV3Vs?=
 =?utf-8?B?OHU1YThwMmthOWt4MTFlcHhrTU5PUENxWVkrV0VGSktaaDdndzBzN1l0Yk5m?=
 =?utf-8?B?Qm5temJtUmsranNsOUU0ZGF0d2U4K2IzUXZTN0J0L244cjkwMnM5bys4ZmVP?=
 =?utf-8?B?MUZ2cGNLWHNqY1M0ODhoWXg4YlZnY0txWVAxOVJIcVphTXJkNlhlb1hWeUlB?=
 =?utf-8?B?eFRtVnpNWkpyQXBUakVhY1ViNjc1MjV3alJlN0xjVVA0VHpOMlc5M0VwSm1J?=
 =?utf-8?B?MnQwZi9CK2hZT0FLa0xTNzZ3YVUrLzhNdnQ0NktVQmVzU2xrV3ZBSDdQNDUr?=
 =?utf-8?B?Q3F2emNCYjAwOExtRk1OT2ZoaDlNaThvbnJFZVdpeVpTUmhkR2gySVg2eDVm?=
 =?utf-8?B?NXhYQmVPamx4MEw0Z1dYV1JaSExISXJTaGpMbEZOVlJmUUFydEh1c2d2NmxX?=
 =?utf-8?B?TFdtbTFjSHJRQ1RacC91SVExSVNMcnFRNlFIUTJZVVBieWJDanBKeHI3S2hi?=
 =?utf-8?B?WHpBd0w0SnFMaEpsVjlpbkEwdzRwYlBCclI4SjE2MDByVXN3NVUzUHB1QmVB?=
 =?utf-8?B?TU5vRHJrenRGSUJpa25kMzFCWjRScSttL3c1RUNiRktXcjQwRUd0cWQxYmx0?=
 =?utf-8?B?WW9GdVZRZ3hSd3pZZVRjYmZVSG4wdzhFVXhabU41WExycjE0WjljTHFFc3Ux?=
 =?utf-8?B?UXdoUjJ3c3ZLQkNka3JrZ0RBT010bHhIMkNlemhuQmNXK3FQSHk4K3NoUEkw?=
 =?utf-8?B?a2t5RzE0dWI0SXVTTzNLclZaZkVhY2dDQTFaclJQeWl5MTlwU251VUhZc2RH?=
 =?utf-8?B?MDZCVysxVCt0dXJEL04xeDNJUGpKdlJKOStPTEN1N0xKVGlWeHVpcHZDNzRH?=
 =?utf-8?B?d0M0RW1ENW9sdnROamVtQkRYbW40YldneThWVDV4NE1pU1k2cXJFY1ROZ1lh?=
 =?utf-8?B?czhIRzB1SEcyeXk3Q3RJMlBNd3R3MlVCT1JpMm9EV2tTVFhibU9yRk9jamFX?=
 =?utf-8?Q?Am7t1lUeH2dJ18W72Su667q8KG+0XQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WTBIZm5CNzFxWmJzbjlzUGJwOENpR2pKWjQ0VkthS25xeUFFdXZkSG90WWxJ?=
 =?utf-8?B?UnkwYnBtTmYvZUJJdm1GbjNIaHZ1blVDaE81KytXbkdjU25BSWVuYnJZS2hq?=
 =?utf-8?B?eXpoazFjZUZheFJxYkNtbWI1SUs0bzFzTlFDYkFWajRZUGVDWTJpMnVFbWNy?=
 =?utf-8?B?L2FpWk9FWm1ObStMUXBtdVpEL05sYkE3MjZRdGZLRlQ3MEZucEJ2VmdNdUJN?=
 =?utf-8?B?V3UyaFc0VzJxdVR1dzAraXhldmlKdk5YVWlXSGhqSm9YSzVGRG1NRXFkSTJF?=
 =?utf-8?B?TnZnYjZWNU83Yys4UXR6cCtQUWhFOTd6aWdHY0RzREoxZHZRQUF1aG1HY2cx?=
 =?utf-8?B?dWlPbEZHU0hKR2dIQlFaTW5sNHVFOC9yUFZxV1BVU1B6dnN1NWFMM0U5a3lq?=
 =?utf-8?B?U21uZ1I4WVlYMmZCbnlZZENjOFZ2ZGN5d1YvYURPb2ljTk4yYWttUWl2TFpW?=
 =?utf-8?B?c0Q5STlQOFVWNmpSemViY2NrZmZVVVJjZEc5R2NpbUExL3FkdFhxQlQ3NW03?=
 =?utf-8?B?blJDODVTendpWDVRdldKTjRFRXRudC81TFBjV25ienlZK082K3BEY3F0NktT?=
 =?utf-8?B?SjdEUWZYaU9TNHVDOHhXZXd1SmRxVE5SYXl0dnhPY0x0ek5ITjhxMHBhWFky?=
 =?utf-8?B?bVlrSlAzR2U3TzVBaVp2VndKdkJSajJpY3Fqb1hUNTgxNmlxL3dHelJsNlV3?=
 =?utf-8?B?VXZVQXpwWTJBNUNySVdDaXdsOEsyUGVDdVhOVHNGdS9GQVRYWVhiK3pNMnJa?=
 =?utf-8?B?VlVhMUx0TVZyT24yRTZvL1ZRTUpkUjB2VzloeGticzN6TzJwU2ZJOEU0SDZW?=
 =?utf-8?B?YU05NXI5R3MyZE5TTXFVNmZSWUVMVG13bmFvSjhhdU0wQy9mdjVadCsrQU1Z?=
 =?utf-8?B?SFlOMSswbzlTekVSVXRiL1RwSGNHdXArS3JkK2pmalFBYTJidnRQNmpMbXI1?=
 =?utf-8?B?NzBGK1RsYTVmclVNNlRpNFVsS3JXQ2RJd0d5dWJGK245ZlV1Ty8wREtFN29z?=
 =?utf-8?B?am5QMTU4bXNwSGJIbmlWa2NHckVMbzJ5MitQekl5Nk9xeGZWY3U4Ly9sTXln?=
 =?utf-8?B?OW04S3ZMSDZTOFBGQ3JhMjQydjI4SWUreXM5Sm53TzlFd01mV3VPS0Q2Uitk?=
 =?utf-8?B?KzlvcFdaVU95RDJDb3JuN25mOUdHWnd5bWxJKzQrbWwxcUtUYWRyclNrVmpy?=
 =?utf-8?B?K0oyTnQxQ0p5d3BVUmV6OVRHNXAyS2VWeUVrQVR5RTgwQ2c1SGFITi9sa2hP?=
 =?utf-8?B?VEhaUVhIMzdhV1ZxMS9LTGlid01Ud0VRSnp1clJnekZXRFdiVFVNdFBKWGZ2?=
 =?utf-8?B?ZDhLR2dVS3RzMWxZQ2dvaGhmTXJhWnlDVk84cE9TQktHdS9vZkdGRlljbWVy?=
 =?utf-8?B?a0JCZzFaUVFaNWdWVVVXMmxtSm5iNjlEZG1UZW9HZ016bnE3dDlXSWYxMnFz?=
 =?utf-8?B?czRRcmw2eXR2UFZ6V0tvaEZ0aDFCTCtUeFFHY2NCbGUzTWw5RFpsWUY4VElH?=
 =?utf-8?B?V250b1pBOTkvNzg1dEFhVnF2OWxIRFV2c0NmZUZwLzlRbEd3WXpaUTNwRmRW?=
 =?utf-8?B?VkRWaEREK3U1cVJLcm02Z25JdFVaTkIvQTlHL3N0NXY3TU8vVVdSMmcvdFJj?=
 =?utf-8?B?VHNBNXljNEFhZTNYWHJjK3pMT0hKaUxNT2NsWFl6R0V1VUs0QTJCZEo5VGla?=
 =?utf-8?B?RDc2VnBnQUZydHZ0L3QwMzMrV3pLakwzSkRhZCtMUXY0dVM2MWtzeFFKU2o3?=
 =?utf-8?B?T2xtdTN5WVZCMVRvakF6MDIvZ3FzWnB4U1J6L3NiajlwVm5NMXZRY0NCdFdC?=
 =?utf-8?B?dnpjTHBIWjJSazdCQXpuMmhqWmM2WGRQdkFySHRYT1ROSSswMHhua0lWcUtn?=
 =?utf-8?B?RFdwT1NYRllCbXg0TGpHSUdKTFZ4dmEzOGVHRWdJN2IwS0lMNHUzYnFBeDk4?=
 =?utf-8?B?M1ZBTVBndWJGWlVvcnF3RjhBenNoNmx3blZ3U1k2S0lCNFgyUVl0bnZnZGZT?=
 =?utf-8?B?NG9zR1Jja2FhMjlqanAxK3ZkN0grcFNEWUFsTXljR3phcGN2SnhyVXZBeXZD?=
 =?utf-8?B?NG92aVBGQ05iaFY3R3ZYckhPQWg5cmNyZmpINHJSZ2pnZjVlYjJicTJ0eTYy?=
 =?utf-8?B?akNZelZnS2sreStvc1hKWlpaTlFrc2RMQWdvc0FYc2JZc0RLRFY2dHpEQ2F5?=
 =?utf-8?B?cVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 766c328a-9ee2-45c9-8158-08de20be9855
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 01:06:50.5873 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ejrY8l/m1HhyR4oF4hNnVoZFGcGD1F8P84vfUsgc456ESLZc5SjxL0aGVd6EJhQtA6/tUUA8BU1a2fDVha1n6uAYarrlR9Sq6ubjM3F9v4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4931
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

In certain scenarios (such as VF migration), VF driver needs to interact
with PF driver.
Add a helper to allow VF driver access to PF xe_device.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 17 +++++++++++++++++
 drivers/gpu/drm/xe/xe_pci.h |  3 +++
 2 files changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index cd03b4b3ebdbd..5107a21679503 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -1224,6 +1224,23 @@ static struct pci_driver xe_pci_driver = {
 #endif
 };
 
+/**
+ * xe_pci_get_pf() - Get PF &xe_device.
+ * @pdev: the VF &pci_dev device
+ *
+ * Return: pointer to PF &xe_device, NULL otherwise.
+ */
+struct xe_device *xe_pci_get_pf(struct pci_dev *pdev)
+{
+	struct drm_device *drm;
+
+	drm = pci_iov_get_pf_drvdata(pdev, &xe_pci_driver);
+	if (IS_ERR(drm))
+		return NULL;
+
+	return to_xe_device(drm);
+}
+
 int xe_register_pci_driver(void)
 {
 	return pci_register_driver(&xe_pci_driver);
diff --git a/drivers/gpu/drm/xe/xe_pci.h b/drivers/gpu/drm/xe/xe_pci.h
index 611c1209b14cc..e97800d5c9dc3 100644
--- a/drivers/gpu/drm/xe/xe_pci.h
+++ b/drivers/gpu/drm/xe/xe_pci.h
@@ -6,6 +6,9 @@
 #ifndef _XE_PCI_H_
 #define _XE_PCI_H_
 
+struct pci_dev;
+
+struct xe_device *xe_pci_get_pf(struct pci_dev *pdev);
 int xe_register_pci_driver(void);
 void xe_unregister_pci_driver(void);
 
-- 
2.51.2


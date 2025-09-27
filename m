Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7791BA63B5
	for <lists+dri-devel@lfdr.de>; Sat, 27 Sep 2025 23:34:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8265C10E064;
	Sat, 27 Sep 2025 21:33:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UUBWD8/2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A99BE10E064
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Sep 2025 21:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759008824; x=1790544824;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/3UxjgO+VdJypIEr4WrF4X9LYflpDlOY3QgglQLZUjc=;
 b=UUBWD8/22UE4tiXYs6NcLBxszkHG8AEZjTG717gFtWo/DLIPZ87juNVf
 tYUnhj1K1AQ2I0ZHqX4JfImChk8XGj6zgS98cggyEZbTMyH6xtINCenzF
 3HbJTHwlg0Rp6CytcTLVISRoXR45tKwfYqP7V8+6k9+WdHMkoKN3ydPAr
 fvs8M6RDzPVpSrElKaA5cvp1j9AA5TInJTv/JM/HAygKpEpQxI8UkcZDq
 CW2xNMy1fqLIqXYMRSAVu3t2hcff+jepbKMvnAW0uneJ1HNscixMgV+mb
 iI0ApYSJevhL7duGT6QkghUlF5omHc2zyAiHfrgSgSMVVNixHnvBvRhPw g==;
X-CSE-ConnectionGUID: ARg0UjUhS2CAoK61tqwtLg==
X-CSE-MsgGUID: 6iQGIOQSQMmfvvvfW4/IJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11566"; a="78729111"
X-IronPort-AV: E=Sophos;i="6.18,298,1751266800"; d="scan'208";a="78729111"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2025 14:33:31 -0700
X-CSE-ConnectionGUID: eqhDdXUZSlqi33OKalI5iA==
X-CSE-MsgGUID: Z4kw+8yXTlOkzS+2yjS3Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,298,1751266800"; d="scan'208";a="181897903"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2025 14:33:20 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 27 Sep 2025 14:33:16 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 27 Sep 2025 14:33:16 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.55) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 27 Sep 2025 14:33:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A8horQV0E4pKRS+5dVAogCaXaa+5iA4uPUaJNXSck+Z69z+Ias8su/TOmukBk/NZiwekkTUIZ4hVah3Qp70Mkhh+8av5a5gT0tRCj+KpX2YGKy4dqlQyiTRee5zd+Mtiz5tolRSxfBtIIa7Xcq6q2PybxlOMXN3/yIIAjCBO/HVOBD9V4iiCyeP15H2/LiahaAkhTvPyxKzqQjFcU/riP5Cz0Ydx4r3rHilXQeSu0wV8CSWGLoR7hXEt2UfHevLG7PvuDbo97pHuwKkH2O5fn4Jps0+yCqmi4woKFbzCpj9ZLLfDe6TO8mMwVlmf3K4bKjIP5BN1+/6fYqrF+8w/3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tJTTi4AsSJdSbwZR/xkL2HDvfuG7zifWAP6+prvNrbY=;
 b=EOXFrxWpdCET4bCO9xyGLwzjczfZfEg7imnVKNm0hl7JV8pGtLjmdLvHtaQoUxWduoOlIPSCFZcoyfmKxxtONe4ShpSxihqw9wwpOlV3zDYxclM/qHiSFXFUuIotcmv2rJf5w2gccVx5lTq44IrVK7cDWNaFa9em9QFtALq+/K85eLw27KELj1zO+HWkcAGafffi0wDQnSCida4gWl7Mwhq8so16FsYVQPrfTswBNfFp8fhgNnWKI4atCEbswl9Fru/2XEi+n5Nhwrgem0OPU+ko/JccXLmD4AxFuuKAflFhzEpxeJrzrSIWGSJtlGrJG9OMkJ5hShpcNHCxx69ncw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM3PR11MB8683.namprd11.prod.outlook.com (2603:10b6:8:1ac::21)
 by DS0PR11MB6326.namprd11.prod.outlook.com (2603:10b6:8:ce::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.20; Sat, 27 Sep
 2025 21:33:15 +0000
Received: from DM3PR11MB8683.namprd11.prod.outlook.com
 ([fe80::5769:9201:88f6:35fa]) by DM3PR11MB8683.namprd11.prod.outlook.com
 ([fe80::5769:9201:88f6:35fa%5]) with mapi id 15.20.9160.013; Sat, 27 Sep 2025
 21:33:15 +0000
Message-ID: <12ed5c07-ca47-4a75-b90a-ef25f60cd585@intel.com>
Date: Sun, 28 Sep 2025 00:33:11 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [bug report] accel/habanalabs: add NVMe Direct I/O (HLDIO)
 infrastructure
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: <dri-devel@lists.freedesktop.org>
References: <aNfIzF_5MxSLX9Rn@stanley.mountain>
Content-Language: en-US
From: "Sinyuk, Konstantin" <konstantin.sinyuk@intel.com>
In-Reply-To: <aNfIzF_5MxSLX9Rn@stanley.mountain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TL0P290CA0002.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:5::10) To DM3PR11MB8683.namprd11.prod.outlook.com
 (2603:10b6:8:1ac::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR11MB8683:EE_|DS0PR11MB6326:EE_
X-MS-Office365-Filtering-Correlation-Id: edef7b03-53b1-4e5a-4fb3-08ddfe0d7782
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VitIYnNNV1ZNREl0YlNibGhuYVJJZVFicXVmUk1kQVZtQzM3dlZxWGpLMmk4?=
 =?utf-8?B?N01TQitmUDBZazNQcDE3L3U5RlF2WnV1ZkwxdlFsSjR1SVBFT1VWc3N6M0pY?=
 =?utf-8?B?VTZVL3NrSW1tUHl0YThvVS82LzJuaXdDUCtpM2ZrSzJpaXZYVnV2VFl5SDhI?=
 =?utf-8?B?bXc1anVpOVBmZW1DQUM2cE5wNlJaa1pFNW5tMzJBYXNzSCtQcW9HSHBGelRn?=
 =?utf-8?B?Z0FYVTdKWlE5L1dNdmtrY0V3T3N6SUZBcWJkdWkyQ0prTnA5cm5uZXlpbEVY?=
 =?utf-8?B?S1d6cUdoQUJDSG4yV0dTbVRaREN4TDgySnV4aVBBa080cEp1OVJmSG1xTmps?=
 =?utf-8?B?Zm42ZWxjZXlzaE5OUjZ3a2FncGhsK0NOWVlkSHlPVEtLa0EvZVdab2JHUU9V?=
 =?utf-8?B?MlpaVmlhN0Z4MENkVDYvVFZBZnMzVEU5SDM4UzE5YjlqZHVRVEdjNCtlN3F2?=
 =?utf-8?B?UHpmTDlEbG1veEZ3Nk5zUldOZTd5TmlHY0s0NFpDSmFRSFlsNno3Z3BXWEZB?=
 =?utf-8?B?Mjh0dERWbDc2OTdodEp6TTZQZWgxcjZkcWtxeEpIS3NqUHJVRXQyeUxCQjRL?=
 =?utf-8?B?WDl4OHV2djNRdHBlalMyc2NWakY4R28rbFcvSmVWdkdVSWdqNXRTMll2aU4w?=
 =?utf-8?B?d2VCWmNMRG9PNkFmbGVIVTh1WTlpWDNWWWhSZFBySWt1LzFQU1g2eHJDcUli?=
 =?utf-8?B?WjRIMjE4aktnUkpUblVBR2ZoTlV3cng3YkVQd3l4c0luMkI1OWs3bWxxMi9F?=
 =?utf-8?B?dG96NUN1ZGcwa052S2UzMEUzUitmTmxab2FQRWVxejA2d0RpTTdDL2g5UkZQ?=
 =?utf-8?B?MWNUb21FZVM4SmJzc2U1YVhWV214VnNuZzNpVGhGUDA0NnVOU0JNSzJnZ0d2?=
 =?utf-8?B?UHVmMDI4Qno0cVJBWXNVWTRHdHJ1OG1FcGtmRDZlWmhLOG5QeW02cWhDblFZ?=
 =?utf-8?B?TXFiOW9vTmhxSkZjQWh5SzVhTG9YRW1pV0pRcXFKTE1naFhPaXgrM2ZtblRt?=
 =?utf-8?B?Zlp2Vys1d0hvVVFUempZS1Rsd2graTk3WFhEMGVsUkp2TElLOFpKaUJwTTBL?=
 =?utf-8?B?b0ZuOU14d09zeEdTRndLeTN1ZkFUczRFRHg5WHdPc3c3S3VKdSsxV1hMVGZG?=
 =?utf-8?B?VGJJRUtDYXk4TjFzNzZSVEV4NFJKR1B6bmx0eCt5ZGZLSi9lMEVXZ2RWeE9w?=
 =?utf-8?B?ZUcya1U2UHRFZXdKK3JGYnlXR2pBTFc3STBUeTN3YUo5Lzlna3FQYndXUVNE?=
 =?utf-8?B?bWcwT0NlU0NaUEljNVdMTmNtS1c2cDNhUkxDSHFabUl4UG9RUCt1S0JkM21L?=
 =?utf-8?B?MVJzMVZDOUhyS2tzT3BwYTlJZDFrbTllcHlnMVN2OXE0N0JVcmNReEtJRTEx?=
 =?utf-8?B?ckJFaGNPcHFsSVdBV0dHbXUzT2NDUHk2MmJPMEM2bG9wcnBDRjdZWWZmY3lT?=
 =?utf-8?B?UEZVZlJXTWV2ZHAvRTFCNnFRd283aFdNeXRVeWY0TEZEZmhMUENiZXYxMDVj?=
 =?utf-8?B?MWNCSExFa0FHN1hTd1A2NkRzNkNSbDFUVlEwa0ZHNHJFTmI0cVdGY2pVS0xC?=
 =?utf-8?B?VG4wc3NhMGsycFZLdlZGbk9qb1hDZUZuN1VzZEFHZ3ZEZFlzWnc3eGsvM1Bs?=
 =?utf-8?B?ckNIT0Q1VFA2d3QvV2tGaEJ4OUJRNmZ3dWdpU1NhckNXTFpuT3RxczA5QTFZ?=
 =?utf-8?B?MDFsZnhzTDI4WldUV05rcVZwMmprTE55S3owZkhlSUJTTXZKNVRaZGJ3L3pC?=
 =?utf-8?B?UHJUMUhxRDBxdEVsdjZYT21GUGdtTlJXa29zT05ZR2M4VzU1TXd1aUkyNncr?=
 =?utf-8?B?ejgvcVBpd1BpeENab1h1MGFXWkRSR29FUitZVXVxc0FHbVlkdHhSa0pYbmI2?=
 =?utf-8?B?Tk5HbUtrb2VtZ2d6QUo0cXN4eXgrcUpPeG96V1graHppRmYrR1FUR3d3dXBR?=
 =?utf-8?Q?rJ7dCH3bBAU2fe/XLTHcmAETK84dHLmL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR11MB8683.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVo1SlM2dG5CRHBaazlhRUFFakJ0cnR0RU1JSFdsUTR5bVNnN2VDYXhvM082?=
 =?utf-8?B?U1hWRVJiM01mMlV1OXNXaTM1K3g3aUdIUk1ySHUzUS9BUHQraXZ5bjRQUFZ5?=
 =?utf-8?B?NlBUYkEzSjFpVWtOOXlIbStTUjlMTWpSVFhkdlRXVCtkaHM5eXhYTHBDbTF6?=
 =?utf-8?B?cUpUQjZWeVZMTkVyUnY2SzdtQTBoM2h6M2FrMDN6ZGZXSWtBQnJnRDdQK2hj?=
 =?utf-8?B?SVNDOUFYZ1dsRGJBT3FKNVl1c2tRNW1qLzIxeFRIV3pjaWlYNnpFSmpGaWtQ?=
 =?utf-8?B?aU5zSVhpclhzeGk4ZEl5SHlUQ0hQcVdrY3RYRUxSVE5waERGOWhCQWRicjJH?=
 =?utf-8?B?WUVHa0EzZjB3d005Vk5SdEpZSXlZa0RhdmlpTCs0MDZaVmw5cmZFdTlXSFVC?=
 =?utf-8?B?bjZLWFplWFFMbnRpcDFFV2dXajdVb1dUeXZjUW5WSmJhWG94Ui96NkdpVGJz?=
 =?utf-8?B?c1M0MjRCckloNFVYVDQwR2d2dmd4OHVXYWFlZkViMFhnTW9jYjYzTmVtWVFP?=
 =?utf-8?B?MTVMc3A5aHBMQkNxbDZsRC9QTVZlTk1iWlVOb3pGd245N2x6dDUwM2ZMR2hJ?=
 =?utf-8?B?Rng0ZitQb1lEcjNHaElxMkc0WW02MW5yS2dDenc0bFo1QTdvSlVzTWpNK2FN?=
 =?utf-8?B?UytPZ2VXalNIaEhjKzhzTXdaWndEVW5UeWpqLzc5eVRScnpCQ0RMT1BzcUhM?=
 =?utf-8?B?K3FxeWowMWloZnd6QjF2cDBtcTR4cVRLa1BYRGZweHBpZ21HMkw1N0U0bjVU?=
 =?utf-8?B?UGcxR0I5amVjNVIwSlZsVXRDc3FrZjF0MU5qVVlESlNwMXF2WW9JL0dseFhy?=
 =?utf-8?B?QVRjR1R4cXpZZG5pWGR0WkYrNjl6Y3BxTmY2dkR6V3BEYXNDVkVoZlJCalox?=
 =?utf-8?B?czJqaENycGx5NStVRTBqSGFJY0l6VGdxRk5LT0ljcGxKMXZtVEtvVkNpTlA4?=
 =?utf-8?B?Q2JnOTNPZUdiTlM5ekZMK3RxUFlzcnY1a00xN29jTWhnd0IzVW90dzNPS09n?=
 =?utf-8?B?U2NhbWJTaGJ2akdsVDFMckdtNXFnZEdyZVZoTG1zc0dpRjVjOHBUb2hGU0Mx?=
 =?utf-8?B?ckNsSzM5dWhPK2xNR2pSNDZCLzlaMXlBTFp5cU0rOWtCQnlsV1ZBaXNLcVdr?=
 =?utf-8?B?S0xWc2V4SHZMNGhYOUtLVWNrT05tOTl5NDhURkl5Zlo0MHB1UFVvWjNxazNk?=
 =?utf-8?B?QmwyeEhpQ0toRjBTQzNkSWFoYVQ3aHR3YU1DWWErYmlPaitWTkFNSGZjdTFh?=
 =?utf-8?B?V1hYMldpTVBzUVU5WUV1MEh0TmpDVlZya05EUDdicG4zR2FxMFgzdXA1WVcv?=
 =?utf-8?B?TjZSMlhFTmhJZFh6ZzRyaXNNS0FySUw2eHlJeDlmb0ZTYUwrV1lsRnVqQita?=
 =?utf-8?B?WnZZYVdmR0dHK25ESDJYaDhxbWZMK3dBYkFmK0lydkFtajdraUdKNGY5YTBi?=
 =?utf-8?B?U2NMQWRLUFk2bVZPbEl2UVA3Nm1uREl6Ujk4ZEU1dzRUSzhvMmt3eE1CM3Qy?=
 =?utf-8?B?Q2FJRnZseVB6eHZjSHh1WDJSaC9lRVN3WTNLV1p0UXhHVGJ5L09JWHRHWWpp?=
 =?utf-8?B?VnVtQkVDRzhteEJFQi81OUxWSFlXMzY4Q1g2RkxJL3VScms5NHJ6bjBrR1kr?=
 =?utf-8?B?c2xORWR2MGdGY21hRWVTcVAvd0hDQ2VBL2puQ0VSV0FMbUlDUkJIOS9JYkdo?=
 =?utf-8?B?QTYzZmt1Q3lsb2lBZEIwcE9PYno0L1RBOWYvUDlOU0hwZEt5cTZ1QXVnNlVD?=
 =?utf-8?B?QWZ6VVhoNXZWYXBHQ0kzU0VpTjBLUDNjaTNRR0w5c00rTS81OWVLUklXMy9X?=
 =?utf-8?B?Y1JNMWo2L3A5ZXhLTnZiLzlsTEdpZkprVmNnekhxckRLakNiWThsSTVmM2pD?=
 =?utf-8?B?RXM4WWhsb3h1cUF0ZW52aGVUK1d1Y3JvNmR0Q3U4WVRGN0dpTWlLengvbzly?=
 =?utf-8?B?cTZ1dytQRmRtMDM1QjdNVXcrbnNISlYvYmI2RGFFOWZXUUoxWmJJMHVQZjJp?=
 =?utf-8?B?bHdneWhIeXFralhYTjN6YnRCL1c0aDBvQStodnA4U2p3M21kSjZMSlRrWjdN?=
 =?utf-8?B?R1l5N05xK29ReDJydzYxSFIwMDdtTXlmWWVYZ3crNk5LN3pvb3BXbC93Q0Iy?=
 =?utf-8?B?NXYrUTVPeFhtbXg0YnYweDVxOHIybTJrTEYvVkhEdFA4cHZiNCtaMDI1dVJU?=
 =?utf-8?B?dlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: edef7b03-53b1-4e5a-4fb3-08ddfe0d7782
X-MS-Exchange-CrossTenant-AuthSource: DM3PR11MB8683.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2025 21:33:15.1942 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U8pgHqECaEUbih8vgc0NHEr0hVdcD9NGFenmt9EWW6c8Ex4et1Q05661ll06KmjpFFFu8PZrwod1KlGTYxAVbCH7fVcGyU14QuVHOmFCWBc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6326
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

Hi Dan,

Thanks for catching this.

You're right, `bd` is dereferenced before being checked in
hl_dio_fd_register(). I'll send a fix that moves the NULL check
before the dereference.

Konstantin.

On Sat, Sep 27, 2025 at 02:21:00PM +0000, Dan Carpenter wrote:
> Hello Konstantin Sinyuk,
> 
> This is a semi-automatic email about new static checker warnings.
> 
> Commit 8cbacc9a2703 ("accel/habanalabs: add NVMe Direct I/O (HLDIO)
> infrastructure") from Sep 9, 2024, leads to the following Smatch
> complaint:
> 
>     drivers/accel/habanalabs/common/hldio.c:106 hl_dio_fd_register()
>     warn: variable dereferenced before check 'bd' (see line 98)
> 
> drivers/accel/habanalabs/common/hldio.c
>     97		bd = sb->s_bdev;
>     98		gd = bd->bd_disk;
>                      ^^^^
> "bd" is dereferenced here
> 
>     99	
>    100		if (inode->i_blocks << sb->s_blocksize_bits < i_size_read(inode)) {
>    101			dev_err(hdev->dev, "sparse files are not currently supported\n");
>    102			rc = -EINVAL;
>    103			goto fput;
>    104		}
>    105	
>    106		if (!bd || !gd) {
>                      ^^
> Checked too late here.
> 
>    107			dev_err(hdev->dev, "invalid block device\n");
>    108			rc = -ENODEV;
> 
> regards,
> dan carpenter

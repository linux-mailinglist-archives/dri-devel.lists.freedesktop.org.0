Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54766AB4EF0
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 11:14:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB85B10E505;
	Tue, 13 May 2025 09:14:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iTNOKoMj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D03A810E505;
 Tue, 13 May 2025 09:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747127646; x=1778663646;
 h=from:to:cc:subject:date:message-id:content-id:
 content-transfer-encoding:mime-version;
 bh=KDrXsL65QV3vxQ1/8OZb3iknjraFjn+RWuKkrDVJk6E=;
 b=iTNOKoMjNNTmj+OjNv82kbK8cZX3wxvv8SDHvpK/EUWnNzmgALWipj4w
 Q2IpKiN7UCJMuI1Oo7YBYlx9kkOSxoC3JgJV941ufspIz0P3eyGme85Eh
 AcnPwDNZNO/cNhs4sihFL20rj+jC3BABv3vd/dPloaceB+uZu+6oHxaiF
 cYLPABY1p/Fkv1Kb3PvDfbhBsNCy6lD+NRq3je2G9xMPrYaWmvzzGZT8v
 o+4RdvszKnUlxa0WAXErNuQPZgustwLsSazumxtfEnV2B9iT6UioFV6Qp
 krNZ/EbnuTtLv6ngqrVxkPuxLO9hIYuzbnDSrsWTmCsGBnDUbgnh2oMVs A==;
X-CSE-ConnectionGUID: SU4t50LqS7S/WY1FZAlzHg==
X-CSE-MsgGUID: Zto/5SQdRA2B7WwVU4t60A==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="49127138"
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; d="scan'208";a="49127138"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 02:14:03 -0700
X-CSE-ConnectionGUID: 3I4n+VFkR5+LTqVcPMmDzw==
X-CSE-MsgGUID: XtYZhhgOTS2+zy8T+imPOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; d="scan'208";a="142407321"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 02:14:03 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 13 May 2025 02:14:02 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 13 May 2025 02:14:02 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 13 May 2025 02:14:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wR0XwYyP5RH/vguXO30u1VNTM61KFknLk+zeLfov4Av84+HmrFQFo11qaun0KStY1EfdFcJyjGpR2bIzPtSsckhsk2NUVqmWnf0TnTmIiDcEkwiVH1h/NQYNBLHf01N5V4QEAqR1Fp9yTJe3m4YIeFcCljfcC6HQKwm2k2n7iGYbQVERM/4jaIuhgKtSAjRVivovTHgKfIDY6eN8RL5I314Y/ekeB8shgnRTEnInMYgN5eYWN8aqTVj72IEuAC2/gw6Eloh/ZVRRXE3yeN5/teWUlKQwg168ZGsQ62YjJ5JHVcpOI36SS8Gb2SXSwWN5Mu46rwVtIiCtRgx5wye5DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KDrXsL65QV3vxQ1/8OZb3iknjraFjn+RWuKkrDVJk6E=;
 b=DYdlaYCtN1UYIM9XhVhb9NivHIEsrOe+kVqaO8X0og3alkpSyEYMWuADJG32DUzStJLIydNwTa/U5QTYU7T0xqc6OGJIxB7nahIzcXCGOCdyZeJoe2Zyq8KhxnoqFa7MSBh2kSw76NqH0oDe3yJacygjVddZmYs/Xg6ihbqzk9Ki7kSFd/dvsNeJb+3EFkc4cik5byYpYQluEh2EK0Ow4nO4DYpeJmBJMJdB/0jHuJU7b7X/OKdlNiaXe/5akJplW4uRIQCFbYh0bBgMeQSz/Nw8gZ1rwCIfHbv8AAIKI3xGcxWHL2Ynl+caNN8P9j06TKw6TxZYyxosewSk/wdt4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7733.namprd11.prod.outlook.com (2603:10b6:8:dc::19) by
 DS7PR11MB6198.namprd11.prod.outlook.com (2603:10b6:8:9a::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.29; Tue, 13 May 2025 09:14:00 +0000
Received: from DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::41a9:1573:32ad:202c]) by DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::41a9:1573:32ad:202c%4]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 09:14:00 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "christian.koenig@amd.com" <christian.koenig@amd.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost,
 Matthew" <matthew.brost@intel.com>, "Auld, Matthew" <matthew.auld@intel.com>
Subject: TTM evicting same-vm bos
Thread-Topic: TTM evicting same-vm bos
Thread-Index: AQHbw+dcMvXMIx98sUiKJ/PZLRzpQg==
Date: Tue, 13 May 2025 09:14:00 +0000
Message-ID: <5f75b052edab8fbe643c58473992237748a6f861.camel@intel.com>
Accept-Language: en-SE, en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.54.3 (3.54.3-1.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7733:EE_|DS7PR11MB6198:EE_
x-ms-office365-filtering-correlation-id: 5659aa0e-0b25-49be-3768-08dd91fe7f7a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Nk13L3grdTlpT3BEMXN1NzhUYlhpaEg0TGFST3Y5S2xtU29MVHZkb1NUbzAv?=
 =?utf-8?B?SVo1aDh1MldINis4Q2p5L01ZelhXTC9hZTVJaXBNN3VIcFAvYU9TTFJiZFlO?=
 =?utf-8?B?aldYVXVvQzFNL3VFOWVab0ZqYWtOVkVSUXF2ZWljSVhhbWE0RW1sdVFSbVVx?=
 =?utf-8?B?ZzdSaDExdlVId25kRTdLbXp5d0ZlbSsyeENMRitJb3NDZXB2L1oxUnp0d0Zz?=
 =?utf-8?B?TTdwS255cmd0N01QbTU1TlA0K0ZLM0VSSHd4QnZ3QWlMOHhOOEtOM0VXeTNm?=
 =?utf-8?B?M0R0NENqMGlGVGs0cHVWRFRxdVc0dytaY3NhTHlXYUNNaWFja0E4UkhEMTlN?=
 =?utf-8?B?a2svdjk5dnJBaDhIbUR3YjRwVVh0a0VuQnZQZ1hTUFFQbDJNdENzNmtnMnZj?=
 =?utf-8?B?L0kzeFhMNDZ0cUxSdW1wMFM5OWY1R214N1gzdWVneXRtZXpveVFGV093dFY2?=
 =?utf-8?B?WTdPVmRvakFyZ2s0RC82ajRLVzVNc1h2eFpNekZFa3FXblQ4bWQ3d3BSaXM3?=
 =?utf-8?B?L0p3SEtIQ2RVQ3JNdEZzRWs4M1pIYzFiSndNOGpQZmg3OVV0b2VRM00yRzNI?=
 =?utf-8?B?cGhlVGdxZGNsVHAyUXJ2OVBBWDFOdjRvSzlVaHlibEFCMTZmQ3ljRWRHZ0NU?=
 =?utf-8?B?VDNtRXJNWXpaZkZRem1pV0FmRlBWVHVFNHV1bC9BcHdzTXR4bGdBdjhLcE0x?=
 =?utf-8?B?UU12bUdyZE93RDlZYzFSaVZzZ2habXp2OFVWY01vTmFDaGc2dmwvcUdvaEdE?=
 =?utf-8?B?cnZiTmluR3pnODV3Vk5paXRjQXYwUXFjMmV2SzhhREJnbW5wUHVkU05JNGl2?=
 =?utf-8?B?YTlacUQ5emtCd2dKYWJhVHpVTWI2bTRlR2NrQXUxNDE2emVFdHE2a1p4Q0pC?=
 =?utf-8?B?VjNvWUEyVmpuR3Fqb1kxc3lzWFZBeW1SSXJoWDA3eklISXJreFZRRWxFLzZ5?=
 =?utf-8?B?dkhqSUUyYm1INitvWVQ1ZGt6VEpFV29scFdiM2w4ZFdSOGFCZlMwdHVxSUFE?=
 =?utf-8?B?em5hS3RvRWR6czZ3eERzKzBoeUg1SFVicEIzRFRMWnM0cVBCUEl2QnhCY1pC?=
 =?utf-8?B?eWt3bzhzRCtLclB6ZXplWmcvUnNIZ1Fjeno3TmRKOUUrV2dxT1pZL2FWUHYv?=
 =?utf-8?B?RkxjSnQwSzVFMXBCK0xWT0NBa2szVXpTNitRWTFoT0lFbHQ1SEpGYXlXcGFs?=
 =?utf-8?B?MmhLWFpnMTQ4STUrUDA5K1B1RnBYMVhoeEVMRDdPREFYWGhGQTVVSUVZbHMv?=
 =?utf-8?B?MG1vMUhTbnNSc0hwUzRJTWViVGNQa3BMQzQrUmhOajFKYzhyNUwxaUEzK2lG?=
 =?utf-8?B?ZHFvaHBlNmpkN1hoVFFxaXBDWC9oZmRyQzJUUTFuMzZGcEtBSC9jUmhCOTdl?=
 =?utf-8?B?SDB0NXRud00vOStVdG1VaUhJa3U1aXF4YTdUandZYnpKYy8wZkZsTy9IVFNF?=
 =?utf-8?B?M0prdDRKSEw2WWVoVVdSc2RtdjNlempoZ2NucDFsNmpsWEdBMjdqNG03QmVw?=
 =?utf-8?B?Y3J1aXlOQ054TTZqbEJDTE1QWlJBNFlwZXl2WXpvYVMwSUsrQklzcVI2TUdh?=
 =?utf-8?B?dytXNnN0WWpKL04xbm94d3V2Y0RNdFVCa2R0UnVNd29MVFdCQ3JtUUQzNUFr?=
 =?utf-8?B?YWRLdUR6UFdMZ3hYUGUxbmNUaGwrTk41NTdaalZDY0gzWmlaUElxQngzbDNV?=
 =?utf-8?B?aEF6WUF0WnBtSDZudWNPdFl5S1MzM1Y2djhZUS9LM09NRFlldG9QTjJRSG02?=
 =?utf-8?B?ZmlNOU9mS0tSc3h3WGNiQVdQcXlUUkRvQjFpTjlRbVNhT0xadEU1T2JsUjlM?=
 =?utf-8?B?VUU3WFM4TDdEYWZSWWY2Yy9maExMNE1SSXpOVjhrSlNmcExQRWpSWGxwQkh1?=
 =?utf-8?B?ejFWWlEzdmVHTTBwaFgrSmRCS01KRC9jYXN1K2x4NVpZU1FFM2dVQXllKzdo?=
 =?utf-8?B?MTVreUlWOEIzOTB1d1UzdFdZa3RGVFdGZHBPSDV3Ky9LU0twWndSbmNiQ0xn?=
 =?utf-8?Q?Pqk1LbNI7MJTYYNH+XPxOkwbV74lJo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7733.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ejdEUXc3ZngrMWN2K2lqMWptRnF1b0VHWTFyMXpNbjB3MzRGWWFPWkptYURp?=
 =?utf-8?B?NnhqT1U3elRxYk9HQ0NCZGdtc1VDbVczK2VvTFBnN3V6bjJFQUZHcGozclRo?=
 =?utf-8?B?TXRIbmFMb2NOM3JyT050QUllOXdXWkQ4V2U0blF1M1V2cW9vbVYxWThjcllN?=
 =?utf-8?B?bUQrNHd0QUlpeTNrd0dwelkrYWFaS3VUNEpxaktlT0szNThreTdtemo1bm1R?=
 =?utf-8?B?WWxuY3dxUmtPSUdpaDJDWm5kYWJadUk1NlErVTBKZnVaL1lpWHcwRFZlOHM2?=
 =?utf-8?B?R2VTVTNoY0VURlRqVlBxTHp0SXdhc0dhOGxqNmxDeUVGOTg5dHlnZG8vMnh5?=
 =?utf-8?B?MElER0ZmRHRONkd0RlNvRDNkMS9nRHgycEx6eWlVZ2hTdnI3NWxRalpSd0Vm?=
 =?utf-8?B?aU1xWElMOFR5eStRdDJMMDR4MXdQQTJQS1FvVzlocXhRZjhIckRWQkVZZENZ?=
 =?utf-8?B?MWxaRjZnWjBjVk5YcUVpV1A1cml2RFBvZU8xNkFacVpXbWpyT2dHT29ET3M2?=
 =?utf-8?B?WjlvVGRxcGhma0E5R0JybWR5QVUxOG5BQ3dQNklCVzIwUlBxR0o2Nm96OWl5?=
 =?utf-8?B?eGU0eE1LbGh3Sk5JaFBnbTB6dlVIeGE2Tm9DN1ZCczN2NHVNOGxPR0ZWU0ov?=
 =?utf-8?B?eVFwdEhuVi9EQTJHaW4xNUhnV1JpbTR2S2JVS1JzMURkSDVvNzliN2UzSzdl?=
 =?utf-8?B?Y3RWZmh2Y2MrVTl3dXhpbVkyL1czcVpvaVUxZENwVE1Majg1VVNVQ1FUMndO?=
 =?utf-8?B?RHpoRkNab0dnLzIrSGE5d2FRa3RRMm9JSTNFQ0tGaWhleEJmaXpORU42bE4r?=
 =?utf-8?B?VWZFd1I3NjdIeEpSVUh5UXdJbXk5RmZNRldYdU44bjZUNHM5cy9NK1ZOS2RC?=
 =?utf-8?B?MUc0RXNvRmNwQmpZeVBSYVAwaHUrREdSUnVTSEJJMkNMdldtT2VxK2V3TWdP?=
 =?utf-8?B?dVZaZzB4cklDOGZ1UkFjOU96SnQ0OUQxZTJGa0VKdmZaWHNLWWFkbGo4QndR?=
 =?utf-8?B?OHZyazR6Yldia1AwbEk2d1BDZXAzdTZwU0JvcHB2Qll2emVxWGNicXExYVQ3?=
 =?utf-8?B?TktOSHRBcHh2UEhoRWhQcUszK29mUHowL2ZGNTR4UW82aS9NNnU4SDJYMnBI?=
 =?utf-8?B?S0E2VDJYNk1jam9PLzFmWHF6NFVGY0hLSDd2Sno0RGpqb0RCU1lZOHhrbkdr?=
 =?utf-8?B?dmVSWVFGUm40bWcrL284N0p5SysvMlVSblE1eHNBdEdHMzFId2pYaEpTMTJu?=
 =?utf-8?B?bzIvd2dQdE1TUE9pd0pBaWYyKys4MUFzYUMwdUEwSThIc0JzbjlwL0VLUlQz?=
 =?utf-8?B?a2hMZCtUSjlSZ0FOQzNzdEhFSEJZeVNXTEhsYmIxQ2NEVXM3RlZOc0QvQW83?=
 =?utf-8?B?SXFlYjgxNnh3bGVud2Uva2hUb2wzdDk2aXBxbDB4Y3NDNWpEc3VJckhNTzd2?=
 =?utf-8?B?TWNDRVBrV2h6dE9wMFJNOVdvbE1kbnZxa3ZMdWJJSFU5TWovaUFOWUtJZ1Fm?=
 =?utf-8?B?dFAxM1pJSHRPb28yM3QrRHNLS1NwZGNtWDVlUEZqZUpvb01ZRGZEb0lzZDBw?=
 =?utf-8?B?L2RLZHdDSExBSGwyWmdOYXRJV05tb1VOMnlnaVBQN1daVmNQdEc3Ui9FeHZp?=
 =?utf-8?B?aGV2STBrS1V6U0NBTnpuMHVWTjR2RFNPakw3ZjRpRjNSTU1zT2ZqTE1SNE9P?=
 =?utf-8?B?ZGJVQklWOERzZmFVNWVVa3hjNVFLRmUvQ281dmhkOE1DeFF1R2taUW04R2hp?=
 =?utf-8?B?R1ZabGVGS0R3U0hQakVkT1JIVXRtZDF5Ri9Ndzk0Qm1KZGRqaWY4NXZ3TjhU?=
 =?utf-8?B?VDNSWjRoYUZmc3YrWExrUGlVTCtRVWR3V0oyWTgvd2dKRTdVTDBqMlRSMXdn?=
 =?utf-8?B?UE9UWklXUFVoR005bStnYVd3ZUlHSVBqWjQ3Y0krRUhxelUwc0p1VTduZ2xG?=
 =?utf-8?B?RXF2MmxQTmJob1RHUFFrUXdpWHZnc0pnV0xuamFsd2dIQTU2YVhmL1BseFBD?=
 =?utf-8?B?K1JZelY5UmZJM1pkRSt4YTRqY2h3VmhodVc4V1ZpNXFjVmkvc1NIMVZpKzJk?=
 =?utf-8?B?YjEwRDhXSFhvU1hnNGhzM3dMZFdQSU1NVlZKajljb1dEL00rVmtDRjZkSTdD?=
 =?utf-8?B?Y1JjMVVaSEUvdDRFTmVWb0ZRT1FBSkhnRG9uLy9qRXNWQVd3Nk1DY0pUTlVl?=
 =?utf-8?Q?ZGvjDfURQCTqgEtT8s3sEiU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EFCE747587855C4BA4CF5BB17862DB06@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5659aa0e-0b25-49be-3768-08dd91fe7f7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2025 09:14:00.2511 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3mkHNkAnxVnVbMM9+sLgjAduJq4zXMdCb5cL8c1c+dihmL77NV6kZsWfeE64Ydlqo5OA15zTLu3qJdmUNzYIYBKgjTvKgsk2a3su9RLU7mk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6198
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

SGksIENocmlzdGlhbg0KDQpEdXJpbmcgZXZpY3Rpb24gd2Ugd2FudCB0byBiZSBhYmxlIHRvIGV2
aWN0IGJvcyB0aGF0IHNoYXJlIHRoZSBWTSdzDQpyZXNlcnZhdGlvbiBvYmplY3QgYnV0IHRoYXQg
YXJlIGN1cnJlbnRseSBub3QgYm91bmQgdG8gdGhlIFZNIHNpbmNlDQp0aGV5IGFyZSBub3QgcGFy
dCBvZiB0aGUgY3VycmVudCB3b3JraW5nIHNldC4NCg0KVFRNIGNhbid0IGhhbmRsZSB0aGlzIHNp
dHVhdGlvbiBzaW5jZSBpdCdzIG5vdCBhd2FyZSBvZiB3aGV0aGVyIGEgYm8gaXMNCmJvdW5kIHRv
IGEgVk0gb3Igbm90Lg0KDQpEbyB5b3UgaGF2ZSBhIHByZWZlcmVuY2Ugb2YgaG93IHRvIGFkZHJl
c3MgdGhpcz8gT25lIGlkZWEgd291bGQgYmUgdG8NCmZvcndhcmQgdGhlIG9wZXJhdGlvbiBjdHgg
dG8gdGhlIGV2aWN0aW9uX3ZhbHVhYmxlIGNhbGxiYWNrLiBBbm90aGVyIHRvDQphZGQgYW4gInVu
Ym91bmQiIGZsYWcgdG8gdGhlIGJvIGFuZCBhbiAidW5ib3VuZF9vbmx5IiBmbGFnIHRvIHRoZQ0K
b3BlcmF0aW9uIGN0eC4NCg0KQW55IGZlZWRiYWNrIGFwcHJlY2lhdGVkLg0KVGhhbmtzLA0KVGhv
bWFzDQoNCg0KDQo=

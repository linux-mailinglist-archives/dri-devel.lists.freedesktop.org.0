Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D4AACEBDB
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 10:29:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E72910E7EA;
	Thu,  5 Jun 2025 08:29:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jEyv7oxz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B7B610E81C;
 Thu,  5 Jun 2025 08:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749112154; x=1780648154;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Hc2DOmT/31Uk/XwIJTSiLY30lPRunBIz36N0g5KuFeg=;
 b=jEyv7oxzApHGJ7SUSrK+fsSt8ymXhU6P6tFN4Ng/FN45qrXlypfXZNzk
 MXfl3iUnMG3hxZfqOo0T1i4pRyKtyygzURObGjsVpelfzaeg3ompTE0Jq
 bqwbUMQ3aeoDIJ80ed+4Qgzv8RXXOkYI9VoxJ5CsAZrOHgu9MRxSt+JRF
 HFS8gE5p3qwj32C16Wk78VQo6u8pQ54lvmsI3YX6wPJ+Dtxglso7rKoOV
 wWvTQe3y4nEionU59wufYOSrDJmlghVP/Ua88BrssvzU7HZYlgU6ofJtr
 DcndwIIL1CUV390HfrKBY2/NnogJod/z2eNRyxTWycriLBwhGMsozWsNM w==;
X-CSE-ConnectionGUID: np2Ux9qFS+Wph8idHgqP2A==
X-CSE-MsgGUID: vXGpTyQbR/iWFXDPRTqUwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="68771657"
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; d="scan'208";a="68771657"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 01:29:14 -0700
X-CSE-ConnectionGUID: R4EJHvaOT2Suudcpl9EViQ==
X-CSE-MsgGUID: kw87cBc/QRmsnO4uNlkl1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; d="scan'208";a="149274108"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 01:29:14 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 5 Jun 2025 01:29:13 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 5 Jun 2025 01:29:13 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.50) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 5 Jun 2025 01:29:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qD1ksD8tWzB+MK0ZwucTJU3MYdXNmoqXgMRlrwcIV4ZsGc5Xd8fAuWCJoTJWATiOUxHRxLpAvJyvbJH2pZfiZFa42hkaUcBt/Xfvh+UbEtcMG29Clb6uSd402wlgGciRXuz9iSwGKOyLMHPu7uqe7NoWkhEm+LjDaoXciHaN5KEtd0ZkJCO/FiQEL1zrD2u92Nto9EbYPtnT6Cse/xc2s3rMc5uNp5XmCgLTAGVWWATUYvOv2UAOk4QkbMeXXgkKoJ6t9M91sYVHnKd6bDiInBdOxRD9t/YnUKeFWDTq+mkSXlrnz3K/CHYuAsAS8zMcpKx95GaUnFNlUH51D5X7FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X5Quki4VuC+EPyy/z795zZcOdhCULJDTc3k/EjknQjI=;
 b=hm7ClLPXiL2kZPutsGF9pjmlaRbxtMiagD44WF42rmfytk4EzXc0tPoAfJeESUNXsOoZBCM2dg42W4QJCgq6+TEWgbaJ8DSAeD3PZ92Tc5tej+6cru+8GD1SE0L+2gAK0mCUvTEXTM7t/ifz0HYoN9vAHOuTmkLTzSDh37H7MxX/y7uJGvxkdCvKDyxO44uDlqav4Wme5A2boS3BgClRPIGEhpu7ou29d4CKFf4DnyUb2E4Fs/SHJTJ0k64yu/ctRkrf/f0PNKBOSP2tE0PoKwQyE3uIJhtANWNAV3/DlNbLabI9obaa9Y735mG7OajI861IVqtk1vrJmUKUThGEGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by CY5PR11MB6439.namprd11.prod.outlook.com (2603:10b6:930:34::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Thu, 5 Jun
 2025 08:29:09 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%2]) with mapi id 15.20.8769.037; Thu, 5 Jun 2025
 08:29:09 +0000
From: Imre Deak <imre.deak@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
CC: =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Subject: [PATCH v3 5/5] drm/i915/dp: Disable the AUX DPCD probe quirk if it's
 not required
Date: Thu, 5 Jun 2025 11:28:50 +0300
Message-ID: <20250605082850.65136-6-imre.deak@intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20250605082850.65136-1-imre.deak@intel.com>
References: <20250605082850.65136-1-imre.deak@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0011.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::23) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|CY5PR11MB6439:EE_
X-MS-Office365-Filtering-Correlation-Id: 5dc06e3c-b059-416e-a29c-08dda40b0ada
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NDFDd21maHVkZVkxMFBWeUtsUVN4YjlYeGZDUEdKaC9sbEhIYWVBOWNtWFdj?=
 =?utf-8?B?dCtHMmoyZ3dUQ2NlQ2NxWU9mRnRJd2xlNTFGZ2xaZ1lucXNYbUJFL0RSbVpL?=
 =?utf-8?B?dEJGL2dWYmdUVEVGdmFvQ0ViTUgvSWZ5UHU2RHo5Zi9MRC9TaDc1RjVMNWZM?=
 =?utf-8?B?ek1BeWc1ZVpDZzN5Y3I4MjIvVnEwQjR0NzRxYlU3dUZyUGVmVS9zN3FYcDQ0?=
 =?utf-8?B?ZmlmdGJmaXVvWFM3SkNRR2xoeUt3YWlvbVA4K2xNTmliMS9nL2VUb3FaQnhU?=
 =?utf-8?B?cmxhQVNCRksvYmhBQy9PczFlUnZnczFsMnYvQ1VYcUNWVnd3eWZxbUx3amdr?=
 =?utf-8?B?SEFqcE5vY1h0MmFVT0FlR2hoL2pTSTRFL0tSVFFVbDVQV0U4dEVFTDZUNnYz?=
 =?utf-8?B?UlJYMmJBeDNvcDQ4OEpUeThuSk5qeFB6NUl3RWpRVEZRM3krWlhKMjdJMWRz?=
 =?utf-8?B?bkJyVWZYbjc0QWRGN3laRWxKRHBJYWJ3ZlJWa3djTUFUN0FUaTdYazlCNHJI?=
 =?utf-8?B?d0NlR21TNVRXQkhPcHNHSEUyYTZDRTRHQ1Y1ekZabkh5Z0QvMzdHSnFuQjg1?=
 =?utf-8?B?U1JoS3JndmEzbVAvenJtbitWQkREQ0orQlpBN1JoTUJxeUJ0bFhIUys4MEhu?=
 =?utf-8?B?cEpXU0RnTWlJRW9OOFlsSHdlcHlJVXk4aTIzSm9ka2JOelovZ0FnMWtGa0tW?=
 =?utf-8?B?aXNtSWdPU3FUMjYwRXpKcjBQMmNNditNNzdSRE1zRW92SkZ4RURzaTNrenM5?=
 =?utf-8?B?MjJPWkxZZHE5SjdYSmQzdEJFMHhFanVETlJabEFKRDNyYTlIc3hsT3ZucExr?=
 =?utf-8?B?cjZ6aG81dXZpeHVyeGZ0SHl6YjFOd2VUUCtoRFo5ckdhNnhDMnpISHZoZHpY?=
 =?utf-8?B?RXFzTExENWI1bjZKS2U0OTRWSG9IMGNwMlljMzFCd0h3QjZPVFdQVUxTS1RF?=
 =?utf-8?B?cE1SNFBzcVZXTzBCY2JKU3BaVnJYU2tpMjRSVVZBcE1WMlhXT2dYYnZxbDdY?=
 =?utf-8?B?Smo0akFFdFhYamJMOWhzOG1pTTQweEIvZyt4bFlaR0pwRnhNNE9Fdll3YVRy?=
 =?utf-8?B?eDdncXowbGNZUm1sV09nR242dEZLNnJlNmN2MVczWm1xNUJpeHFtVjhVdi9G?=
 =?utf-8?B?bC9GS2NNM0p2ZHF1bFYza3dCVkJROG9jSVVlc1pSYkNLWGg0TVFhMHVDTU9t?=
 =?utf-8?B?bWYvbFBkalpqRjBKVUdjQzdXS09Pb1I3dklFd0cxMlo3aFkrVjBPSkhibHNE?=
 =?utf-8?B?M2R2RzllWHVveXJJdXltZmFPZHFvZE0wVHlMeG1oT2U0SUkxWlBJY1B1YWFa?=
 =?utf-8?B?RlVwbVI3WkNmTzI5ckNCQzhRV3NoNXZJSGhuQXFxeGNlTzFNZXlTUHd2VUtv?=
 =?utf-8?B?c2ZvWmljd1pWd01ZSlBibVJEdG9sZGtBUWxBWFUyR3BYQU0rbzh5SjFwemJQ?=
 =?utf-8?B?WFlLVHVmRmFjK1JiMmp4YmZoL05NOS9OcWs0OXVjc3pIYko0R2RpemVJZlI1?=
 =?utf-8?B?dnVQM0k3RTdTM3ZKKzg5L3paWnpHaDBiV0RSUm5QSkJoSUFiWjlIdit5QUE5?=
 =?utf-8?B?ZmNDbDlyeXlNaGhNR3FuY2lacnByZ21tOU12anc1OVBPN2kvOXgzQlVxTElQ?=
 =?utf-8?B?TjVhRFJ1cUE2OXlsaFZ1c1VmSlo0WDRZekdsVzE0Ym9lQVdPeVB3d0Y3N2NB?=
 =?utf-8?B?U3h6bXQ4d1VOWVFaTWNqKzg3SUpEdlF1NHRGRytEejZTL1EyYXVZZnlvVnpL?=
 =?utf-8?B?QmJCdnkzWmYwRXBJT3dONDhady9FOS9VeUIrSGdYL3ZjNUJiYTNodVhIVnZp?=
 =?utf-8?B?NDRsVVZkSkpMbVdSUnN4YUpkSWdaUXpLQ0hvR0pkeHBnRk1iNVZmaTVOZ0xE?=
 =?utf-8?B?My8wdTlkVE9OOU9UbERiYXk1ZE1TOTJiWUZkTlplOU9nV0ozWGdER2lqNVVE?=
 =?utf-8?Q?Ko3fpcopjAQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akQ0K0NrQTA2T3hXNzdESWhCTkNNMEQxM0hWZHNaeWJST3dPV2w3czlBOG5L?=
 =?utf-8?B?UlZSWTVvTTJDV2tQc0prNGtoK1ZkQytnZUQzcjFSNlFWVStYYzVXUWk0TnZk?=
 =?utf-8?B?MGpEY1NaVWhLK0tEaUtzNkZaQUNENjhSVmZ1SFhmUlBFV1RnZ1gxV2JvQUJz?=
 =?utf-8?B?YkRrTGdSSGdrYTRXQVFrbWFoSk5RWi9DNGk2bnBzQUgxeFVXVFQzTGxzUmQ5?=
 =?utf-8?B?cEk3akpZSENVMno0R2RLdUZ6NHl5NnRITy9PRFVTV0h0dkRMWjNSeDJndTcv?=
 =?utf-8?B?Mkx4L0xoS2dHaW9DYm9DVmEzUWxRSU5GSmpQcmo1emZMNkJWTlZ0Tll2bW1P?=
 =?utf-8?B?VTdyNzdWOEl0YW5pVVM5NERJS0d0anNrWkNUTVAvTWFaZmF0VkNOQzBVRGlo?=
 =?utf-8?B?dHJZVTFTMUVXWWkxSFZoZ0piTjMySEZ0bGxHM0FBY0NoMlk2RCs0WVBBelJ4?=
 =?utf-8?B?bEVFQkpmWUljcGd4OGJMU2pVUUJLTWlHTi9pbDc0cW1MMkZqNlp6TGl1SUw0?=
 =?utf-8?B?NVJiaU40OVlsSjFacEg4MnJtTS9ya3ZPcGpvNjE1bGZMbjlHWkd4N0VEMGJj?=
 =?utf-8?B?S1dXRmZ4L0cwWDIrQ1UzNm9UQzRNRlVNRmNVMG9ycklLM2xiY0ZraFozdzZY?=
 =?utf-8?B?aHI2SDNzMUs4NFYxeWxpL3cvZUJKV3hTcGhQQmFNWllHa3d5Y0VlWDA4K1dn?=
 =?utf-8?B?dEVhUmRkUHBtU2VkZEREN0NNMXQ4aXR2SlZCQ0UvM0JyNGltY25Yc2NoUEV4?=
 =?utf-8?B?K3FDVWxVeGNadktaZWVHQktNZVliOXRkTHdOc291c1RVdjYyc1kvWDJkc0wz?=
 =?utf-8?B?SXV3TUxBbGd6ZTBpOGl1ZXFOU0xSd2c0cjlmNlVwMmdhNFBHeGVZVWVhenI5?=
 =?utf-8?B?czNaT2VnTEhINnYwK0JQMmRxWFdYN1VBU1BrSHlwODQ5REx4V1ZzVWxMVk5q?=
 =?utf-8?B?UGtuYnpxaENoYjQ1U3k5OUhkZTVnVlc5cFhoL3o5QVJub05SL3ZqcmpyQUVJ?=
 =?utf-8?B?bWtXYXRKYWYyZW9OVGVlb09uVFFaYkt0aWNWSUx3VWs1TUdoUDI1RWRSZlpL?=
 =?utf-8?B?N3pjdmxIR0gvdUorLzRuNy9tckluVVhqREhRc0tlMUZWSC9NcHRReHBYWEFu?=
 =?utf-8?B?aXBEdWRsbWhxQ2pQRForRmJRckY4VWJRb0IrR0ZGRlJvV0tYY0FTUFM5Y2o2?=
 =?utf-8?B?aFF4MWJESitrVXhNZHNYOCtjWWMvUDhxMi91Ni9qMW1vZ3RNL3QzN0Y4amFV?=
 =?utf-8?B?Y2lBZ3B0MGdKVjhicmxMQUdhMzJvSlVNSWFhU0lwUnlEZ1BXeXlERitHNjZz?=
 =?utf-8?B?dSt5cUg5elBVRmFFaHBkbHEvdVFpZVVZWW8zL1hJdHVuVTJoM1pCY0dRa29D?=
 =?utf-8?B?NHcyVjFCQ3pSVWZjSCtPY1FwQ0c5VEJvMDFVQjBSbkZnQlllMXBMdmdLSmx4?=
 =?utf-8?B?MXlwSkFTNTdpdWU4M0psdGpVMXgwTTRVUWFzVno5cUZ2MEhsRG51eWdGKzBS?=
 =?utf-8?B?aENVSW02YkxBWjlpTDdqZnJPME43MHE3SkpnNE1ZYzJkbDVrWTcyaTdURThy?=
 =?utf-8?B?djRMTUNYeG5LVForMnJHY0pZNVFadWVWR3Fxc3V2b1V2S0wwZXZvZTQvQ2Iz?=
 =?utf-8?B?aVpVNEdhYWJET1lyVjBBMkk0SHNreU5wOEZwdVNsQk9Ucmt5dDAwSFJ5bkJ5?=
 =?utf-8?B?aXVBUTJZTUtsaDlpZXBtN3Jvc1NCQkNRSTNwVEVwbmZ2ME1JZjFvanR0bVdG?=
 =?utf-8?B?amxxY1ZLMHdVcU5Bc2V0elMrVXl2VHpaaXNrSVlFdkdtTkFSOXBMMnB4bmNZ?=
 =?utf-8?B?OVR3aUFENkd4WGR3WEFOSXd5Kys0azFKN3FST2RhWGp3WEJxYUc5RUp3a3hY?=
 =?utf-8?B?MVpFYk1xZk5tYXdLWE9odklkbVdiZkZsYWFPUlU3Z0QvYjBDcG5xUnhMVm80?=
 =?utf-8?B?SjdPZldOdENFd0VRdy91WnMvYmI5REFuYS92Z2J5aWM3b1d1MVRwMTZRSVhR?=
 =?utf-8?B?SVNKbVNYSEdCVHZIV1VuM2NKSjgyREk4bU9HeUZmTHhaNkdhZlg1UXFSNVk1?=
 =?utf-8?B?TXV3MkcvSGloOHUwVmI3YTFyUmpJeUxORUxkSU5meGM2ZUpaQ3ZTSUxiSGlm?=
 =?utf-8?Q?jcy4AVyzvJMtwtHytmYMuSsWF?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dc06e3c-b059-416e-a29c-08dda40b0ada
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 08:29:09.1787 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wFP6GimmoMietUAXAOZKmy+auAZm0TTeuaTw8ytYtxHPYNVt53pIl1bYwQgCXf1CimostEIK4jR3vnsv0IezZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6439
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

Reading DPCD registers has side-effects and some of these can cause a
problem for instance during link training. Based on this it's better to
avoid the probing quirk done before each DPCD register read, limiting
this to the monitor which requires it. The only known problematic
monitor is an external SST sink, so keep the quirk disabled always for
eDP and MST sinks. Reenable the quirk after a hotplug event and after
resuming from a power state without hotplug support, until the
subsequent EDID based detection.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c      | 11 +++++++++--
 drivers/gpu/drm/i915/display/intel_dp_aux.c  |  2 ++
 drivers/gpu/drm/i915/display/intel_hotplug.c | 10 ++++++++++
 3 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 208a953b04a2f..d65a18fc1aeb9 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -5747,6 +5747,11 @@ intel_dp_set_edid(struct intel_dp *intel_dp)
 	/* Below we depend on display info having been updated */
 	drm_edid_connector_update(&connector->base, drm_edid);
 
+	if (!intel_dp_is_edp(intel_dp))
+		drm_dp_dpcd_set_probe_quirk(&intel_dp->aux,
+					    drm_edid_has_quirk(&connector->base,
+							       DRM_EDID_QUIRK_DP_DPCD_PROBE));
+
 	vrr_capable = intel_vrr_is_capable(connector);
 	drm_dbg_kms(display->drm, "[CONNECTOR:%d:%s] VRR capable: %s\n",
 		    connector->base.base.id, connector->base.name, str_yes_no(vrr_capable));
@@ -5881,6 +5886,7 @@ intel_dp_detect(struct drm_connector *_connector,
 	intel_dp_print_rates(intel_dp);
 
 	if (intel_dp->is_mst) {
+		drm_dp_dpcd_set_probe_quirk(&intel_dp->aux, false);
 		/*
 		 * If we are in MST mode then this connector
 		 * won't appear connected or have anything
@@ -6321,10 +6327,11 @@ intel_dp_hpd_pulse(struct intel_digital_port *dig_port, bool long_hpd)
 	 * complete the DP tunnel BW request for the latter connector/encoder
 	 * waiting for this encoder's DPRX read, perform a dummy read here.
 	 */
-	if (long_hpd)
+	if (long_hpd) {
+		drm_dp_dpcd_set_probe_quirk(&intel_dp->aux, true);
+
 		intel_dp_read_dprx_caps(intel_dp, dpcd);
 
-	if (long_hpd) {
 		intel_dp->reset_link_params = true;
 		intel_dp_invalidate_source_oui(intel_dp);
 
diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux.c b/drivers/gpu/drm/i915/display/intel_dp_aux.c
index bf8e8e0cc19c9..410252ba6fd16 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux.c
@@ -835,6 +835,8 @@ void intel_dp_aux_init(struct intel_dp *intel_dp)
 
 	intel_dp->aux.transfer = intel_dp_aux_transfer;
 	cpu_latency_qos_add_request(&intel_dp->pm_qos, PM_QOS_DEFAULT_VALUE);
+
+	drm_dp_dpcd_set_probe_quirk(&intel_dp->aux, !intel_dp_is_edp(intel_dp));
 }
 
 static enum aux_ch default_aux_ch(struct intel_encoder *encoder)
diff --git a/drivers/gpu/drm/i915/display/intel_hotplug.c b/drivers/gpu/drm/i915/display/intel_hotplug.c
index 74fe398663d63..1093c6c3714c0 100644
--- a/drivers/gpu/drm/i915/display/intel_hotplug.c
+++ b/drivers/gpu/drm/i915/display/intel_hotplug.c
@@ -33,6 +33,7 @@
 #include "intel_display_core.h"
 #include "intel_display_rpm.h"
 #include "intel_display_types.h"
+#include "intel_dp.h"
 #include "intel_hdcp.h"
 #include "intel_hotplug.h"
 #include "intel_hotplug_irq.h"
@@ -906,9 +907,18 @@ void intel_hpd_poll_enable(struct intel_display *display)
  */
 void intel_hpd_poll_disable(struct intel_display *display)
 {
+	struct intel_encoder *encoder;
+
 	if (!HAS_DISPLAY(display))
 		return;
 
+	for_each_intel_dp(display->drm, encoder) {
+		struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
+
+		if (!intel_dp_is_edp(intel_dp))
+			drm_dp_dpcd_set_probe_quirk(&intel_dp->aux, true);
+	}
+
 	WRITE_ONCE(display->hotplug.poll_enabled, false);
 
 	spin_lock_irq(&display->irq.lock);
-- 
2.44.2


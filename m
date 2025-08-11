Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0D8B1FFB0
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 08:57:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC95A10E300;
	Mon, 11 Aug 2025 06:57:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F54j5e43";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A24FC10E2EC;
 Mon, 11 Aug 2025 06:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754895419; x=1786431419;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jOD4JK8Qel2lvRNLDMTkIKChRKxu9tMpOwELLcwUXuo=;
 b=F54j5e43BqfV2YG6WwDilbX50Hbg9+96u+V4dBozPysbzGKXloJ7eMtA
 hOTBfo3VTkle1ZQcQw+WqgVSAH1UukPIdCynUn0UgJIRyU2360l6oMZ3D
 pY5Y+08A/9prt1/ur9skxYJNLYUYwfM49RaYlzIUBpKnz8VK+utj7CSg1
 IyUOKgcI6HBFzzLlm8Rc+3moWSJ/uTuh0AJCcFUFd8x51GxEc4vhlJLxi
 G3Zld8wCnJkvKLkOJd0FsWmPSiGOSnHIyOUis23JmStKgLnCcg0DLyYjE
 sfyL2qU62JqUg/A1q9z303duO5vfSmxAddAsWB8JYRcudQSLuAYKlbg/W A==;
X-CSE-ConnectionGUID: 3J37KpBSR6mbjB9lv8DRrA==
X-CSE-MsgGUID: 1EaSXgnvR7u7zlOiuQOdAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="57220090"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="57220090"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2025 23:56:59 -0700
X-CSE-ConnectionGUID: CEBAqE/iRpmmFIKkUxdS2A==
X-CSE-MsgGUID: Z3X3EFolS9SdBeb2R1ckdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="169950646"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2025 23:56:59 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Sun, 10 Aug 2025 23:56:58 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Sun, 10 Aug 2025 23:56:58 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.50) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Sun, 10 Aug 2025 23:56:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W3LcNm7a71njBKzMrrqYuMOYuBUDOXR/PGmMfYXRBi+Eo0vjDIQ2oRPOgj8n44bXLE+ev2oA3BriZgk4Gb1SPvav+CMsbarY1dCtIGq+ZJCCglHEdLVQDKqlKC8muP89L4HRg/bww0F34J+nk27tbY8Y1YpQV7g0KhASyM1HR5xNe5k29oxoaIiGfYic2yf5QGKFK1an9ukDvWdP3y7pa+Eb1+MvkOx2z9jjUVeXEMZZtqhw+Fy/wZ5c+BfF1G7eUeDGcda+5LpzHmBytkpWLctyUgV3gQrMwRI46sb2p1qpHubL/8x49CEMFp0Jv0wRZWbx3Bq4vcs9h7tZKEdmWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4pabWWzzQX171Q9aua47E+UZACcoFiD2Ay/waxFFcc8=;
 b=oQl0SHT/BpN61TGrqEBQvTnW4ISSzxl6o+P1kmlsgtqYhoHdVLEqP9K/z9seH0vk14rbmn/3dCMNFyANimEvk1EgJDEbOYqRZqMVpj/DjzkYetv0ouAG7ItV1hdlR3j30cMotqRcHrwU2Y1TNud935LHNqF9VCAeoUNZ2AjZeFp+hy4I+zZqhbHb7INd/4pRRSuJyOB2rOQT3+YN4w3AyxhIOTaZRNanWCekP6+C+Pol1isSMhujkNYgLfax/gzk+I9ldODB6J289lDNztydFgtjkBPnMGVudVWNYHULVtb2/kCb9h2PqzI+vuSrhI1suECDcCwyyg+ehX8QUGN2VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by DS0PR11MB6472.namprd11.prod.outlook.com
 (2603:10b6:8:c0::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Mon, 11 Aug
 2025 06:56:55 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::6acb:cbaa:6326:112e]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::6acb:cbaa:6326:112e%7]) with mapi id 15.20.9009.013; Mon, 11 Aug 2025
 06:56:55 +0000
Message-ID: <84c6886f-8f6b-4009-ba81-616596e3fc12@intel.com>
Date: Mon, 11 Aug 2025 12:26:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 03/26] drm/gpuvm: Support flags in drm_gpuvm_map_req
To: Danilo Krummrich <dakr@kernel.org>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Boris Brezillon" <bbrezillon@kernel.org>, Caterina Shablia
 <caterina.shablia@collabora.com>, <dri-devel@lists.freedesktop.org>
References: <20250807164338.1832254-1-himal.prasad.ghimiray@intel.com>
 <20250807164338.1832254-4-himal.prasad.ghimiray@intel.com>
 <DBXWOL7C9IJO.9A7IOEWNQYG2@kernel.org>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <DBXWOL7C9IJO.9A7IOEWNQYG2@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0082.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::12) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|DS0PR11MB6472:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a91c837-ef8a-4526-1e4c-08ddd8a441c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RFR3a1dMREJTOHBROHJqVUwzc2M4Vm8vM1RzU3A1SVpDSGVhTVYxc1FTY1Yw?=
 =?utf-8?B?QUxKV2NOeGcwMmpqU1QveGU0ZUs4N0N6Z1hiMTd6RnZ6WC8wbEJoVEVIN1M4?=
 =?utf-8?B?WEF5WGZsOUJYUHFiSHA1Yjk5RHNtYVBJRHUxOUozcnZrZjdhSW1OM2UwdzI4?=
 =?utf-8?B?TlNJVVJ1amFsVGxQM2FsWGM5aEtTSk80SVBSYWRIVHNEMTVFMFVodHQ0MHkr?=
 =?utf-8?B?d0EyNWpGcGVXbVBYZk5SNXR6bTZyY2ZlU3Erc1ZEY2NweFpzUlRYeGUyNlJO?=
 =?utf-8?B?SFRQSytxWWFiNnI4UDF6VEQwVVVUNllUS1V3UTJjZ3FoV3ZyYjR4WjRJcG5a?=
 =?utf-8?B?SVBMdVdUZEFvUStVSkNYdlQ3ckZOWkxFZUc2VytsR0wvTU1IMEZUaGFPSEFE?=
 =?utf-8?B?NWEwVWF1OVFIelVEZURkOFd6MC9qWUd0U1MvZ3QrcCtzWlIwNW9lY1Y0L3VM?=
 =?utf-8?B?K0NtdCtwbjRvYXBpa2VWUW9ESTNPWGpTQllrYjBjU1BkL3ZkSzBrTEY4SytH?=
 =?utf-8?B?MnQzNVN4VWxEazNmMk9pMnkyMXBtQ2lXcnc5R2ZiWkV4TGJGK0xLVmFpek1R?=
 =?utf-8?B?dVFqd2xSQk9pREdHbXRCVGNtVHd4NmRPY1dCRE1ZSnRUc3ZFSWVMRUxvM0NS?=
 =?utf-8?B?cEpnUWNacFlRMjBRM1h0eE5vZmVhOFNrTlN5NUt6VEZWRGVwQmNURmRBbUFH?=
 =?utf-8?B?b3hWb1M3Q3EwZ2xPWEFhOWNLYlVpSTNVZnJ0YnU1RWVvK3Mwd29WckQ0VER1?=
 =?utf-8?B?WWdXR3l1NFRWV1pwZlBCbjVidGlySGZxRFJiR1pETENMaXdNTkdZdyt1QzRu?=
 =?utf-8?B?RFA2VFVPaHRKcmg1Ynk0U2w1cDJ0ZFFYOVRxK2gvTXl5TG5sWmN3NzhHVHo5?=
 =?utf-8?B?YldlQ05yOE5PQndHYXVRWm5acGZLRWRqS2Urb0FVMlNiUjJOd0RETGJzMS9E?=
 =?utf-8?B?SFNzQnhzd1lRYUZTNlJ5WlJtL01YRHE5ejZHcXlUc1dnd01xQUg5ZFRUNFZ1?=
 =?utf-8?B?dXQreHlKQkxDbDBVWmdSeTBsSUVpYmMxWGxvcFNEcHhUV2FIamxKUmVJVFYy?=
 =?utf-8?B?c2ZCMXZLWnhuY05wY2NLNmdzL1BnZnUwWis3NHdpdzE4YzA4UVIzTUE2K3J0?=
 =?utf-8?B?Z1E1SjF3WjB3Z3lsSVl1enNyYUpuS1czQVVUSW02ayt3enhsNVBIdzdIb21N?=
 =?utf-8?B?cjB3ZXNwSVhnMGtBN2JTNWR2dmpYUDZqTVNXR2ErdGl2NXN5aTF3cVV0VTFm?=
 =?utf-8?B?clBKdkVzSGhCcDk5VGNHM1Z2akx1eWNaeE9VdnlNdTlvZ3A4RnBDZERRVE5r?=
 =?utf-8?B?eFVzUENmWVdLeUJ5Q2ladSszQzJNeVN3TU91dWZ2c2ZLNmdLcVZkYXF6eDV1?=
 =?utf-8?B?cUJuYzhoMVQ0ak5ZSHRYS2NoN0lXMDAxbE4vVlUvOEN6RTQ2dWVNNlc0T1Yy?=
 =?utf-8?B?eUpRTjFXQjVFMzlRODZQaHlYS25SdzRwNmhkaVJrTHYwOUl3ZXBaZzh2RXZV?=
 =?utf-8?B?dlFJNTkvZUk1TVRkWjlaRG03R3VHQ21tcXFlaFhFeW9Lc1Y3bEFrbE8xU2FV?=
 =?utf-8?B?K1pYNDIrWml2RUxEWkFOY25aaTk3V2g1Qk8rcEh6RGJzTTAwUGhOdUhWRTk2?=
 =?utf-8?B?NkMrbnJ6a1kyTk81YWlraHpNN3Y2YkpwYlZmeGwySDM3a3J6ZU1SMnBtUTdx?=
 =?utf-8?B?OVRBQkEzajd1V1VBcWNDcW5qeFRYZDM5b1ZxSmtrWStUdTIxTC92VnpoOEx0?=
 =?utf-8?B?SFRBMkgzcXJ1Z0NIc1ludzlFa2JtMTBTaWNabWhSOVBLTGpvcFZ6QlJ0bExt?=
 =?utf-8?B?Sm5nTjE4eE1YYVBSM0xFdDhrRXg2UkgyZmpYQThmMzhRWnp1WkJZeUNQMFR3?=
 =?utf-8?B?c1NublRsY3krdUVLcm5JdkZHUHRSUExzTWJsNUNINzJjdEw1eFJzVHk2RHJi?=
 =?utf-8?Q?WhRUPFtwTxQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OVczVzlFWUgxTkg2akNJRys1bFlhUlJsSWY5THh4dm9CeGhYVVZpb09tcEh1?=
 =?utf-8?B?aElOVTI2WmdMUkxyMUt0cUdjVitEU1NkT2QwSk9vSU9hVllsMFRuTHZWbWxN?=
 =?utf-8?B?VFJuWExHZnM5VzRoNlBUcHJ6TktqRVVBQjNHVk40aUhPdmhEZW1CN3BFZ3h1?=
 =?utf-8?B?aTdEVngwVDlEQmZ3QStYdGptclY3d3I3N3F4ZWVORGp5SVdZNWpSTTVxVWwz?=
 =?utf-8?B?UlVjZTh0aWpyL3Q0aGo0djJNZkp4SkVtaXZqM09RVVoxbEFRVUQ3SEtrbG94?=
 =?utf-8?B?L3VuRHJYVHBDWVNkRGpnOTJRc0dtNU42aGh4aldWUXhGbFo0TnBncTVIS1Q0?=
 =?utf-8?B?Y1lPcEs2UzJUL043QThvazFIWEYyNjVvVW54VCt4ZEtqNlhoTjdxUWV3OHBW?=
 =?utf-8?B?SzQ4MHpGL1cxQVVXMTdHN0RlQVZQdUNpZFI4LzJVT21DRnJEekdMdGpmYjlq?=
 =?utf-8?B?akY1dHdaQzVxRTN4UVpSSFU3ejk1NUVsaktDLzZVWE1MTjcwMWpncDBIRktO?=
 =?utf-8?B?QktRckhxOCtsOU42V29iQ0NxeDZNaVdicVJ2WFd1TktPOW56Q3o0WWpTelFK?=
 =?utf-8?B?M1FNcWw1V2t3TXc5Uzd4RlhhbE1uWlYxeUdPVCtERGNGYWxpd0ZuLzlaT1Vh?=
 =?utf-8?B?VG10eTlZMjk3bTdFNDZTTk1mL2hkZTdsd2QvcHA4eVNRa3ZuSi9NNldnOS9j?=
 =?utf-8?B?WDVtNVVFS2NKTmszaXVpWXhseFVzWjh6eUwyUDJUUjloMEswOXRtL05yQlNj?=
 =?utf-8?B?UVFhZFVmTGlsUGZFMncrSWJJUWNSR25Zb2ZMQkZ1V3Zpb1Y1cmtVYjdPUTNv?=
 =?utf-8?B?dld0N1h3UnZGK1dPL3ZnZjRwVXIzMHJ2cjNsczBvbEpQanZ4ekR6L3RLbTBF?=
 =?utf-8?B?dmpvU1pUSGI5VXp0UTZkQVE1SzJEUGVpbUIzUTA3bkZaZzZSdmlvMU04cEtt?=
 =?utf-8?B?V0g5a0dHV0tweFFSZE1OR2plOEc2dk9ZeVR5SzVvSll3VVlVbUtNQmF4U1Iw?=
 =?utf-8?B?dnc1ZTVONXN4NVVpZHVHdFdoS3hWbktkdS9MaGNFakI1YXlMREZheks3WmtF?=
 =?utf-8?B?ZlhwV2htRUZyUHpJMjIvTW83eHg3bkU4WFNWeFlORVdQeTRtTXBRcWNuL1gw?=
 =?utf-8?B?V0dVcW5LdmhMNXRvektlSGJHS0R2K2xWbUtCQW15N01tS2JFSitHZmpRMlRK?=
 =?utf-8?B?N0RscEJtMlhFYk5LR2RsNy9VVUtIUHVVOW42bllVQXlrL0k0OVVYcUs5eGx6?=
 =?utf-8?B?OWhsWXdLaGJVdFpzcTFKUnByc2tKOVFvdUl6YUpMSGRnVFF3TFMveThFRHpJ?=
 =?utf-8?B?MWRqTytmdm05MTZ0YTM3Q1NVSWpwbTFVUWRxWEl6UEJ4Z3N5a1RIdUhDenVE?=
 =?utf-8?B?aDlzUStHSlpDUDBVQS9oOUE1YnVXcWJIVnRFRU9TREZFTUR1Zk1EWkhEN1cx?=
 =?utf-8?B?V2pmMkNEaXZVRm81YUU4OW93R0VHa1JJQzRkTHFZajdrNXJnaVNLeUNSSHpo?=
 =?utf-8?B?TGNNaGQ4WUFMRHAvOE13K2haZ1Q3MElETm0xbkljY0F4d2pVcFQwSHQ3OVZI?=
 =?utf-8?B?dWR0OXJNYlY3UzVYTlNNeHJiWnNmcUpkZStMWVY4UW9jd2IwQWZERThhdGl3?=
 =?utf-8?B?U04zMGJyREx4S3ozeVNzOEJJVTk5ZDZsRVo5Ulp3TU1LQjl4dnRjRHloZFlo?=
 =?utf-8?B?dEhTWUpZbVg4Q2YrWUFGWVVjTElsajJTMm1FT1c4dVN1Tkh1ZXhuZDBUZy9l?=
 =?utf-8?B?SGN5R3F5aG5ZZzk4T3FVdDNqUlNGYnZrejg0MlVhamo4Z05aNmF5QnNQeDJv?=
 =?utf-8?B?RzZHcWNLcW1XUFdDNjBmWWdmN0dVN0xwSllCQ1ZzR2UzMzI2aTNuckY3cWNp?=
 =?utf-8?B?RUp1Q1dJVzhxNG1pQWl6anVQSEZGc0czcXN1dVE1WUF1bjdpTHhrUE0yaFE3?=
 =?utf-8?B?THgraDJBNXBMcFBDa2lpWGxDbEh2bUpVY0g0MVlySFNjdmlxUCtKRTFnTlFX?=
 =?utf-8?B?VGVlNkV2TUxETHVTcmNQTzQrWUgyWnZNaWtkeU9JaGtGWFp3NmJmM0MydnBm?=
 =?utf-8?B?aEFMUWpYNGJsMGFKYzNFbWw1cXBIMFgzQnNOYzBiUHZDVXVWalVhbUMyc1VI?=
 =?utf-8?B?L2YwUTR1cVRkSk1kZ1lqZ0l4dTAwMTVJZkp1MHdEZzB2MDhOSWdvamh4ZGk4?=
 =?utf-8?Q?HeSBPJktfjxerwUS8sutnKk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a91c837-ef8a-4526-1e4c-08ddd8a441c5
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2025 06:56:54.9357 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dZmqsGz8QJpjfUMni7P65eWGlvSetYUd4DDxd0Sq2oXaiae1bfAkmRZBoXqytFp0PNQ92tvkrnTBc1jpJ94rU6ILYdHWXBVdW1T5KV99wNw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6472
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



On 09-08-2025 18:16, Danilo Krummrich wrote:
> On Thu Aug 7, 2025 at 6:43 PM CEST, Himal Prasad Ghimiray wrote:
>> This change adds support for passing flags to drm_gpuvm_sm_map() and
>> sm_map_ops_create(), enabling future extensions that affect split/merge
>> logic in drm_gpuvm.
>>
>> v2
>> - Move flag to drm_gpuvm_map_req
>>
>> Cc: Danilo Krummrich <dakr@kernel.org>
>> Cc: Boris Brezillon <bbrezillon@kernel.org>
>> Cc: Caterina Shablia <caterina.shablia@collabora.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: <dri-devel@lists.freedesktop.org>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   include/drm/drm_gpuvm.h | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
>> index cbb9b6519462..116f77abd570 100644
>> --- a/include/drm/drm_gpuvm.h
>> +++ b/include/drm/drm_gpuvm.h
>> @@ -1049,6 +1049,13 @@ struct drm_gpuva_ops {
>>    */
>>   #define drm_gpuva_next_op(op) list_next_entry(op, entry)
>>   
>> +enum drm_gpuvm_sm_map_ops_flags {
> 
> Please also add a doc-comment for the enum type itself, explaing where those
> flags are used, etc.

sure will do.

> 
>> +	 /**
>> +	  * %DRM_GPUVM_SM_MAP_OPS_FLAG_NONE: DEFAULT sm_map ops
> 
> Shouldn't this be '@DRM_GPUVM_SM_MAP_OPS_FLAG_NONE:'?

Yup. will change in next version.

> 
>> +	  */
>> +	DRM_GPUVM_SM_MAP_OPS_FLAG_NONE = 0,
>> +};


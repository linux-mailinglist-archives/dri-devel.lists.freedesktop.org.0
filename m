Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A01AB0649D
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 18:49:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A85010E22C;
	Tue, 15 Jul 2025 16:49:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B9TXh/5o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A24310E22C;
 Tue, 15 Jul 2025 16:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752598194; x=1784134194;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fOQ4SGu2l4GvvHAr7TgIf+lLvediHyxazqSvayM7lb4=;
 b=B9TXh/5o5RkNRB4qy0E61mADzFGlBwit2C/J6hJbRNQ+DFjLb1504qHI
 hRJGb3pld9cbnl9Cjd4rGzK5n+fH+dcf12LhKuhaJwRnW5pdi196mZvHF
 MV9rZPsBYzLGqUH5nxoVtFxzDUyngsim5+FA4IngPti60Fqt4QHJUdK6o
 uljFbSklZpjVl+9Q+yCpmpVCGFwL/KuRkeW23EBAQ/EkQRnCw7h9DTfBk
 pXlGeFjKwnW2NSvjrSVuV3MqagJdgidcyMk1q0gT0zw8UwCp+ns8b0qjb
 NQ2rWoVvkwH1tImf74nRh0QB72OaUIXCmuwlA1QKIjZHdzo3aRNdlkhSd Q==;
X-CSE-ConnectionGUID: e4Zu5yCpT3ayqAddyGMAvw==
X-CSE-MsgGUID: TJucVITuRJi9q3n9tN43iA==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="58638209"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="58638209"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 09:49:53 -0700
X-CSE-ConnectionGUID: RbAeA60gTJW6pU5uGMcZMg==
X-CSE-MsgGUID: 17qPnF9dRa26npeuuS1qvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="162911843"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 09:49:53 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 09:49:52 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 15 Jul 2025 09:49:52 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.45)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 09:49:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o3tabnPyuUHYdbi3DdLlg4ecI67/6Ch7TVl2IPd9am2O0NtL9xLPCMXIfxI4+1QOhBzEOJ4ozjfJ0Osi3SmqfnfLyXx8fXucOfLlCvyRbkpTKu0MLKUacltroY90udMpmimIR4yiRwbXBsssHpo4p5Bxk9UI81BpmC42X9QJePaqP6zF7YOVDNTxCerQeUVfHhiXLN0MrI2WAyzcJwQ7pNzScbvBT8i2eJDn6dbk8jcQp+Aqe2qn4nHHbGovodVgjMwJx4b2VSgjxJW9JO7F0MoUELIPN1D3foWAVau7Bsj4wKu93ZaeFRqzBVftHnJrCLTxhJxEUA8hWOq6YTpwkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AKN+DzEWUVpiuQuBrwYXwF9rXwiHu7AhgjfmBDei7nQ=;
 b=FJTe8ykjEcPiwdM8gqCmG2UcDNaUe98CjLzZgoMJiKIzDrJviaG2XoOhz3MAsTpyzuzre6n1EUFjDWm8M2vamrAdsXa/L98XHJCIveO3ljNDmMWAPNAoJzKTZhd1xJw3i0gxGisjALzkuX9YddYgzNXAis994cyPyp7YZX6uIbJM4mJE3GQuDnc2unpKl32iVHpbGmIgUgAZPCFTHsJksFX6zBSXiBVdiVvUNmJ8gr+ON+czFsWUVQWTaYeSua4vd2APYM8fSRLFK0YmnS8i4ebznkEYMaozrDNH/wxtXqqEEmrOi/XnYecjkBNKNPiGNqfAcN5x6d7KfRIcwtCEWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SA3PR11MB7653.namprd11.prod.outlook.com (2603:10b6:806:306::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Tue, 15 Jul
 2025 16:49:06 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%6]) with mapi id 15.20.8901.033; Tue, 15 Jul 2025
 16:49:06 +0000
Message-ID: <e8545bc4-ab57-4133-89e4-83e6a659de5e@intel.com>
Date: Tue, 15 Jul 2025 22:18:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 7/9] drm/xe: Add support to handle hardware errors
To: "Summers, Stuart" <stuart.summers@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "simona.vetter@ffwll.ch" <simona.vetter@ffwll.ch>, "Jadav, Raag"
 <raag.jadav@intel.com>, "Anirban, Sk" <sk.anirban@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "Scarbrough, Frank" <frank.scarbrough@intel.com>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "aravind.iddamsetty@linux.intel.com"
 <aravind.iddamsetty@linux.intel.com>, "Gupta, Anshuman"
 <anshuman.gupta@intel.com>, "Nerlige Ramappa, Umesh"
 <umesh.nerlige.ramappa@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
References: <20250715104730.2109506-1-riana.tauro@intel.com>
 <20250715104730.2109506-8-riana.tauro@intel.com>
 <0c97fa730d60b72b149e7ff180c8e826e6097a9e.camel@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <0c97fa730d60b72b149e7ff180c8e826e6097a9e.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0027.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::20) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SA3PR11MB7653:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a2cdcb6-05c9-495f-37ad-08ddc3bf8306
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M0JuRnlaS21IYmxpR2ZXK2ZxUUNRWFZYTUN4UHJZWFlRMjFpdy9tTGEwTklj?=
 =?utf-8?B?djk1cGZJVnk5OFhvT0IyQzNzazVDSlh6bFRLdVk3UFhuOHdPK09YcGRUMU9Z?=
 =?utf-8?B?aXMrRWhOOUdEV1RhWFRIVXBuWUQwTGp4aVhRYnZCS0VmRHdDelpJM0hNZTIr?=
 =?utf-8?B?Q0F4NHNpaWZDKzRPT1FFMUxWclBIZXk2b3pWNDNUMzloTmhqVUQzeXByWlFL?=
 =?utf-8?B?cWJXNnJXMGNkZ1NHMm92NGRpUTkvUnU2UHRLOU44SnVpQTlrSXE1NTNpTGxt?=
 =?utf-8?B?a2swaEYxejdxUk5pVDBzaFdsc3R0eVh1UVpkeHhsZUJUSFN0QWNHSmdmS251?=
 =?utf-8?B?SSs3cGN2VFNPQ2E4UEpuQTFWcVhLd29LK3BCOFB5QmRacXJjZkM2K09vUDRT?=
 =?utf-8?B?dndvc2Y2TzJtTVFvcFI4cGk0cTcvVXdFMFJBb0cwNEdoTjBObzRqd0V2L01j?=
 =?utf-8?B?UHErQkdaazRSaFo4V053bWR0WVhneWZrVUdWR3VwZExPbThRcVkvVTVjTFJH?=
 =?utf-8?B?L2RGR2E2UHU3eFN3Q2RKcG8va2lGM004aHJndWxXK0p2RXoyOVZ2dHhiZUR6?=
 =?utf-8?B?bmFJUTUxQUhSS3dCMk85MEl3MTg2U3NPZjh2M0lTTFdIZVdwaVlwQVE5Ujd5?=
 =?utf-8?B?K1JuaFFENlg2bG5naGtJTkxRQWRzQ3ZRR0U2QWpZdmhLTXZWQk1KMUYwUFlG?=
 =?utf-8?B?Wmt4VmlzMHNWclpiRU1CUkFjbnhtUmYxZHgyckhlNStYRGNtUmxwRk1uM3V1?=
 =?utf-8?B?dzRBaC9LTHRWWng4MVVIVDBMZ3h5dFVOZGFCeldudFpqUzUyYzllU2NmNFFa?=
 =?utf-8?B?UEJhVGQwTE5YYUx4SldlRytqY25vZ2MrOXUrT1VWMUk1M1pFZ1lUcEZOZTQ0?=
 =?utf-8?B?T0pZRGFkWXVwcHFpWUFtNnVmQXZSVUw3OGg3Qmh3SUo5eGkyM3g3NUZpdXli?=
 =?utf-8?B?MXlxR291U2JkNjdON1pwOUVxVXQyZFpFeStKRmEzb251MCsxVm9pZU5mUk9i?=
 =?utf-8?B?OUlyU2tiQVRwREZNZU0zZlVvZ3pndWJjS1VFaTM5ekpUK2RKVHlvNFZWUjdo?=
 =?utf-8?B?K3hXYzJXaWtNUVhuWVozUjJxeE5CMi8yQWczOHBLTmRMRUdrTzMxSmNsdHp0?=
 =?utf-8?B?SW1SWnJiYWFCVk5HSC9kM2JZOGt5Wm4rVVJBZWlyOHdiaWNZN2NQQmFURStJ?=
 =?utf-8?B?ejJuaDRVbFdmMnNkYmRFU2R3TWRmWXczQUVnNnV6UnlHR1p2N0xyWExrYUhU?=
 =?utf-8?B?ZDlmMmFhM1BNeE1SQnpqTVl6K3hVQ2g5M0ZKZWhrK25rbGJPRHk1SHE2R3M4?=
 =?utf-8?B?MGtEQzFCTVFsMEpkelJqbDI0Z3VBTU5YNmVaUEZvWEk4V2l3NmZWWFdzYVVt?=
 =?utf-8?B?RURGelRNVTA5bnhvWklBUE5YLzZnZnZWRWRoYUVMOWpZS21jbUZNRkpTVG5W?=
 =?utf-8?B?WUliYnNWMlBiV2FqUUd3OFVCSCtpOHpZM29adEZjOHl4a1dkMFY2SUpERTV2?=
 =?utf-8?B?d2l0aFVSZDArZTdOL2IzSHRvSUVTWWVKZFV1UmRDb2RhZDVtbW1nT2J2UE1i?=
 =?utf-8?B?ZGUwZzhwRmsvd01ZODdZUXN3dy9KQWU1OU92bDZlOW1ZUnlnZVZjTlNHRENw?=
 =?utf-8?B?NFU3eExkRHlpSDZTWENuTVVndDdMS1NlNFRmclphMlVHcTdtU1RKc01DQUMy?=
 =?utf-8?B?N0xhOHFneHZ2Yk8zeGZrTUdjVFRVeERKVC9RNlRLZUNBRGJPcG1EZVQ3eHZr?=
 =?utf-8?B?K2cyUldLc1NBU052YjFKQmJNYmg2ZmFSZHY1QmdRNkJ4RVdiVTAwN2xKUEt6?=
 =?utf-8?Q?PvyDyiqb8uAEOtJ1bkavYGnV85I+HxarGgnAM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ajkyUVRFR0oyREVQWTdxYXBmQy9XMDZMMVk0dE9RWVZjdWVQa2hRT0JDLzZj?=
 =?utf-8?B?Z1RhdDFvNEhmVmdkS3ZCa0J2ZlZnL2FmU3ZiYURycDZURkQwQ2JScnVqMFBC?=
 =?utf-8?B?d2RYTmVZb0h0OHdPYjFaaksveGhwSHhERWYvMENkdllua3dHM2dtMXdiSjFO?=
 =?utf-8?B?azQ5bXo1aEVGQ0JjNDd4SlVrODA2ZURKWDJCaWl0T1lRTm5NTmRnelNQSnRa?=
 =?utf-8?B?ZTNhbWwxVUhsS0ZZY25nby9hRG04TlhjYjYxb2h2NUFqOFlqQ29GRHloVEJN?=
 =?utf-8?B?OGZoNFdCdGVmM3o2aVhhTFo4R0JvN1BmUkhCMWZCMk42Sy9YZWpGWVlXOHU3?=
 =?utf-8?B?dG9TNlV3SnFmS3d1djMyVGs2eU1VbnJjOHI5SjFKY3lPVTJGUXNMNW95Wlhr?=
 =?utf-8?B?d0R2aFJnc25iMkViN1J5ZTNjdk9ONkxmbU1MSS93a1g3WHcwOG1rdU0raXZY?=
 =?utf-8?B?TFMwQ1dqQ0o2L1dzWmRyUTRQc2RRdDU0b0FlNnlraEZ2b0hKbW5vaTVvNFE3?=
 =?utf-8?B?bjFrN2ZZZTJ2aysvbGkxb2kwRTFVT2tHTEdqTERCVCs2L0xsVW1INm5tbXFI?=
 =?utf-8?B?K2tFNWhJRWhMcGR4QmdpcXV4MHkrUGtoS2hHczIyRGIyZVhKeG9vRGVOdkUr?=
 =?utf-8?B?QXFsaWpTYmE1ZWlBLzFPZ1hoQVE2eWhLVTJSeXpHcWI5N0JTRzlhZDVWRTA0?=
 =?utf-8?B?cUI2ZU4xb2xEM004ODQzb3o5VzFVWFlmaGFxeHpZY2creUNDYkY2YU1EWERQ?=
 =?utf-8?B?MWprTEFmZ2NMNkVMRDJMOWt1ZC8wakE3V25hbC9zMXdncWtJZ05iQ2FpWXJ4?=
 =?utf-8?B?WUFQYkU4UGNoZlRYT2Rsc0FLeGlJL0xzeGNEVDM2UnY0aTVWWXB2MHAwazZs?=
 =?utf-8?B?eTVFTko2QmJMa1MyVkZCMEpIeTZoSHg3RWgwYXNnbTErQVdKTnJSelJ3aDFj?=
 =?utf-8?B?TVBWZkNXUFdrakxaTlBpeGczMzRyK1Z2NmF5eHg5R2l6ckxna1pMTmI3NUhB?=
 =?utf-8?B?TDcwak5STUs0N2NYM2c4dmlPaTF1eDRkVUJwK1k1U2ppZDdPSnhmWnQyVE9X?=
 =?utf-8?B?QWppZVZ4cE01TTMwWEw3bncyaHYwejFhNE1kN2RkaEExZGhITUdCNi9semlH?=
 =?utf-8?B?TVZxVmtWZUU0ejRYbHllSGtMS1k2ZXEvSEFHUEFpVjd5ZVMybHRXSm1Fekhk?=
 =?utf-8?B?aWdCeTQ3Y2pCMGpjbkFuVFRiMGRqek5kVDZmOEQxNnFjZzU0ZnFCOEsxb0d6?=
 =?utf-8?B?NXRRSjBDVHUxT3A4dzV2R05sbUdBMXpBeXVSeVZyZDY5bmVzNWs5VWV0Zkx2?=
 =?utf-8?B?MjcxNHRCcm14Y1NveEhmeTJWamI5TGRrMStqQTV0My9vaUErbTkvNVJVRkJt?=
 =?utf-8?B?V2MxbmtqT1FsbEJBQy9uTXBRMDZzNUN0cDh0UEV1Q0tVZzFGRkNLNkpKMzd1?=
 =?utf-8?B?SlRWRVh0NzJ5b1BmNitDaG01ZCs5Q2RkVERDZXVJM28zem04RlNtU01LOWpB?=
 =?utf-8?B?TnlTNVRwYnhNZXNZcTRsRmpnaHZzenJWd0p2ZTNqZktsbTMwSGNlRTlRbUpu?=
 =?utf-8?B?STRsRm1RckNrRUNkZ0xJYXpLdDFHTjlydVE5Q1VxYnZ5THZwcWRWbWpqMTZy?=
 =?utf-8?B?M3U2V3VlRnoxZERQbGpWSU9ROTM0V3h4VSsvTFlTZExHbWpqOHhyUVZDT3hp?=
 =?utf-8?B?Q2taQWNyVFlrS2hML3hCcjRSNW9XRi9iVThzdmZHWWdrSVRsbmZDRkdubEFG?=
 =?utf-8?B?S2pyRmVvbHloVUdQTmRtQ0tQNWFuMU1DZ3plRU0zVnhtL1U1cGtpeGRYUzV1?=
 =?utf-8?B?eHFxOHJCVk05R3ZkOFNYR3Q1TEI1TW90c3dGd21HSjdCajFraE5Mc2hwb3Z1?=
 =?utf-8?B?MzZVOFFrSUVxTTN4Yys1Zmdvem1SakdmRWw3aVpzQVJUeEZYRUZJRVBWeklo?=
 =?utf-8?B?QVMxN083bUJwMFNDTis4NVZuR0hraHdweFlpMzA5QXdYc2dKNWtBNGxyWTZH?=
 =?utf-8?B?WU16WG1ZQzU2eU9nMVdwK3RyL0hzQWNsMTJ3ZURjVUkzUlFVaFRhcVZ3QW0z?=
 =?utf-8?B?MEc4WGRXYm5OMnRBRHFmMmhUQzAzRldCdVJTTHRNOWVaOS9sd1lGMmNXc2F2?=
 =?utf-8?Q?l26nIU/2lUAJg+L6aNbXAiXdr?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a2cdcb6-05c9-495f-37ad-08ddc3bf8306
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 16:49:06.4893 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZYBu5U+mIGN3Gn5SI/If+/eHSr8h8JpTAGn4/lnsYqKqqe+6pYX0z2pL+9UEHz6SjO6n9lmdqRTHWjo8WDBB8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7653
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

Hi Stuart

On 7/15/2025 7:38 PM, Summers, Stuart wrote:
> On Tue, 2025-07-15 at 16:17 +0530, Riana Tauro wrote:
>> Gfx device reports two classes of errors: uncorrectable and
>> correctable. Depending on the severity uncorrectable errors are
>> further
>> classified Non-Fatal and Fatal
>>
>> Correctable and Non-Fatal errors: These errors are reported as MSI.
>> Bits in
>> the Master Interrupt Register indicate the class of the error.
>> The source of the error is then read from the Device Error Source
>> Register.
>>
>> Fatal errors: These are reported as PCIe errors
>> When a PCIe error is asserted, the OS will perform a SBR (Secondary
>> Bus reset) which causes the driver to reload.
>> The error registers are sticky and the values are maintained through
>> SBR
>>
>> Add basic support to handle these errors
>>
>> Bspec: 50875, 53073, 53074, 53075, 53076
>>
>> v2: Remove platform checks and print raw error value (Stuart)
>>      Format commit message (Umesh)
>>
>> Cc: Stuart Summers <stuart.summers@intel.com>
>> Co-developed-by: Himal Prasad Ghimiray
>> <himal.prasad.ghimiray@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray
>> <himal.prasad.ghimiray@intel.com>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> ---
>>   drivers/gpu/drm/xe/Makefile                |   1 +
>>   drivers/gpu/drm/xe/regs/xe_hw_error_regs.h |  15 +++
>>   drivers/gpu/drm/xe/regs/xe_irq_regs.h      |   1 +
>>   drivers/gpu/drm/xe/xe_hw_error.c           | 106
>> +++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_hw_error.h           |  15 +++
>>   drivers/gpu/drm/xe/xe_irq.c                |   4 +
>>   6 files changed, 142 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
>>   create mode 100644 drivers/gpu/drm/xe/xe_hw_error.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_hw_error.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile
>> b/drivers/gpu/drm/xe/Makefile
>> index 07c71a29963d..02f73dffec55 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -80,6 +80,7 @@ xe-y += xe_bb.o \
>>          xe_hw_engine.o \
>>          xe_hw_engine_class_sysfs.o \
>>          xe_hw_engine_group.o \
>> +       xe_hw_error.o \
>>          xe_hw_fence.o \
>>          xe_irq.o \
>>          xe_lrc.o \
>> diff --git a/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
>> b/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
>> new file mode 100644
>> index 000000000000..ed9b81fb28a0
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
>> @@ -0,0 +1,15 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_HW_ERROR_REGS_H_
>> +#define _XE_HW_ERROR_REGS_H_
>> +
>> +#define DEV_ERR_STAT_NONFATAL                  0x100178
>> +#define DEV_ERR_STAT_CORRECTABLE               0x10017c
>> +#define
>> DEV_ERR_STAT_REG(x)                    XE_REG(_PICK_EVEN((x), \
>> +
>> DEV_ERR_STAT_CORRECTABLE, \
>> +
>> DEV_ERR_STAT_NONFATAL))
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/xe/regs/xe_irq_regs.h
>> b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
>> index 13635e4331d4..7c2a3a140142 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_irq_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
>> @@ -18,6 +18,7 @@
>>   #define GFX_MSTR_IRQ                           XE_REG(0x190010,
>> XE_REG_OPTION_VF)
>>   #define   MASTER_IRQ                           REG_BIT(31)
>>   #define   GU_MISC_IRQ                          REG_BIT(29)
>> +#define   ERROR_IRQ(x)                         REG_BIT(26 + (x))
>>   #define   DISPLAY_IRQ                          REG_BIT(16)
>>   #define   I2C_IRQ                              REG_BIT(12)
>>   #define   GT_DW_IRQ(x)                         REG_BIT(x)
>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c
>> b/drivers/gpu/drm/xe/xe_hw_error.c
>> new file mode 100644
>> index 000000000000..0b09f9950cb9
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
>> @@ -0,0 +1,106 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +#include "regs/xe_hw_error_regs.h"
>> +#include "regs/xe_irq_regs.h"
>> +
>> +#include "xe_device.h"
>> +#include "xe_hw_error.h"
>> +#include "xe_mmio.h"
>> +
>> +/* Error categories reported by hardware */
>> +enum hardware_error {
>> +       HARDWARE_ERROR_CORRECTABLE = 0,
>> +       HARDWARE_ERROR_NONFATAL = 1,
>> +       HARDWARE_ERROR_FATAL = 2,
>> +       HARDWARE_ERROR_MAX,
>> +};
>> +
>> +static const char *hw_error_to_str(const enum hardware_error hw_err)
>> +{
>> +       switch (hw_err) {
>> +       case HARDWARE_ERROR_CORRECTABLE:
>> +               return "CORRECTABLE";
>> +       case HARDWARE_ERROR_NONFATAL:
>> +               return "NONFATAL";
>> +       case HARDWARE_ERROR_FATAL:
>> +               return "FATAL";
>> +       default:
>> +               return "UNKNOWN";
>> +       }
>> +}
>> +
>> +static void hw_error_source_handler(struct xe_tile *tile, const enum
>> hardware_error hw_err)
>> +{
>> +       const char *hw_err_str = hw_error_to_str(hw_err);
>> +       struct xe_device *xe = tile_to_xe(tile);
>> +       unsigned long flags;
>> +       u32 err_src;
>> +
>> +       spin_lock_irqsave(&xe->irq.lock, flags);
>> +       err_src = xe_mmio_read32(&tile->mmio,
>> DEV_ERR_STAT_REG(hw_err));
>> +       if (!err_src) {
>> +               drm_err_ratelimited(&xe->drm, HW_ERR "Tile%d reported
>> DEV_ERR_STAT_%s blank!\n",
>> +                                   tile->id, hw_err_str);
> 
> This message is essentially the same as the one below, just with
> "blank" instead of "0x0". And writing back a 0 IMO is inconsequential
> since this already is some kind of hardware bug (bad interrupt, MMIO
> write error, etc) if we get to this point.

May need to check if we really need error logs or debug should be 
sufficient. BAT shows errors on probe on DG2

https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v5/bat-dg2-oem2/igt@xe_module_load@load.html#dmesg-warnings262

The previous series had a skip for DG2 
https://patchwork.freedesktop.org/patch/563668/?series=125373&rev=1 but 
the review comments don't provide more data.

Will check why there is a failure. We might not need error logs for a
correctable error but need to confirm for Non-fatal.

Thanks
Riana

> 
> Can we save a few lines and get rid of this if check? So the function
> just becomes:
> 
> spin_lock()
> read_mmio()
> print_results()
> write_mmio()
> spin_unlock()
> 
> Without any goto or extra check.
> 
>> +               goto unlock;
>> +       }
>> +
>> +       drm_err_ratelimited(&xe->drm, HW_ERR "Tile%d reported %s
>> error 0x%x\n",
>> +                           tile->id, hw_err_str, err_src);
>> +
>> +       xe_mmio_write32(&tile->mmio, DEV_ERR_STAT_REG(hw_err),
>> err_src);
>> +
>> +unlock:
>> +       spin_unlock_irqrestore(&xe->irq.lock, flags);
>> +}
>> +
>> +/**
>> + * xe_hw_error_irq_handler - irq handling for hw errors
>> + * @tile: tile instance
>> + * @master_ctl: value read from master interrupt register
>> + *
>> + * Xe platforms add three error bits to the master interrupt
>> register to support error handling.
>> + * These three bits are used to convey the class of error FATAL,
>> NONFATAL, or CORRECTABLE.
>> + * To process the interrupt, determine the source of error by
>> reading the Device Error Source
>> + * Register that corresponds to the class of error being serviced.
>> + */
>> +void xe_hw_error_irq_handler(struct xe_tile *tile, const u32
>> master_ctl)
>> +{
>> +       enum hardware_error hw_err;
>> +
>> +       for (hw_err = 0; hw_err < HARDWARE_ERROR_MAX; hw_err++)
>> +               if (master_ctl & ERROR_IRQ(hw_err))
>> +                       hw_error_source_handler(tile, hw_err);
>> +}
>> +
>> +/*
>> + * Process hardware errors during boot
>> + */
>> +static void process_hw_errors(struct xe_device *xe)
>> +{
>> +       struct xe_tile *tile;
>> +       u32 master_ctl;
>> +       u8 id;
>> +
>> +       for_each_tile(tile, xe, id) {
>> +               master_ctl = xe_mmio_read32(&tile->mmio,
>> GFX_MSTR_IRQ);
>> +               xe_hw_error_irq_handler(tile, master_ctl);
>> +               xe_mmio_write32(&tile->mmio, GFX_MSTR_IRQ,
>> master_ctl);
>> +       }
>> +}
>> +
>> +/**
>> + * xe_hw_error_init - Initialize hw errors
>> + * @xe: xe device instance
>> + *
>> + * Initialize and process hw errors
>> + */
>> +void xe_hw_error_init(struct xe_device *xe)
>> +{
>> +       if (IS_SRIOV_VF(xe))
>> +               return;
>> +
> 
> Maybe a comment here as to why we are doing this on init? Something
> like:
> /* Check for errors that occurred during boot prior to driver load */
> 
> Thanks,
> Stuart
> 
>> +       process_hw_errors(xe);
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.h
>> b/drivers/gpu/drm/xe/xe_hw_error.h
>> new file mode 100644
>> index 000000000000..d86e28c5180c
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_hw_error.h
>> @@ -0,0 +1,15 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +#ifndef XE_HW_ERROR_H_
>> +#define XE_HW_ERROR_H_
>> +
>> +#include <linux/types.h>
>> +
>> +struct xe_tile;
>> +struct xe_device;
>> +
>> +void xe_hw_error_irq_handler(struct xe_tile *tile, const u32
>> master_ctl);
>> +void xe_hw_error_init(struct xe_device *xe);
>> +#endif
>> diff --git a/drivers/gpu/drm/xe/xe_irq.c
>> b/drivers/gpu/drm/xe/xe_irq.c
>> index 5df5b8c2a3e4..870edaf69388 100644
>> --- a/drivers/gpu/drm/xe/xe_irq.c
>> +++ b/drivers/gpu/drm/xe/xe_irq.c
>> @@ -18,6 +18,7 @@
>>   #include "xe_gt.h"
>>   #include "xe_guc.h"
>>   #include "xe_hw_engine.h"
>> +#include "xe_hw_error.h"
>>   #include "xe_i2c.h"
>>   #include "xe_memirq.h"
>>   #include "xe_mmio.h"
>> @@ -468,6 +469,7 @@ static irqreturn_t dg1_irq_handler(int irq, void
>> *arg)
>>                  xe_mmio_write32(mmio, GFX_MSTR_IRQ, master_ctl);
>>   
>>                  gt_irq_handler(tile, master_ctl, intr_dw, identity);
>> +               xe_hw_error_irq_handler(tile, master_ctl);
>>   
>>                  /*
>>                   * Display interrupts (including display backlight
>> operations
>> @@ -756,6 +758,8 @@ int xe_irq_install(struct xe_device *xe)
>>          int nvec = 1;
>>          int err;
>>   
>> +       xe_hw_error_init(xe);
>> +
>>          xe_irq_reset(xe);
>>   
>>          if (xe_device_has_msix(xe)) {
> 


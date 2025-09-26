Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8971BA52DA
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 23:13:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A889F10EAEE;
	Fri, 26 Sep 2025 21:13:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DAksqU6d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 944E310EAEC;
 Fri, 26 Sep 2025 21:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758921201; x=1790457201;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=PZ1W1SDyIlkjtUPY7AKUFdCTgd6pMtVuEMxcL/+aJ+8=;
 b=DAksqU6d1Gt/N97NNH8plvzMlGQ2NTNHpQD2iksRgTNJsjH8rijbQr2W
 xhSDXNinzO9ySbLT6FeZVKPCtyprqfheooJwqkM8Wt94ILo75ozXLIng9
 oCkpteLcHYLNtAev/E6QnqL+UmpjEnW4V0sU6+zUNPyW8sa8cRNY63fVn
 2as6H6FxtP+VHN/l5fg39a51WnN1uUIQ7VXJQaSTI/TFsGzOfx1er0/K6
 XJ31QfBMupN7H1lwQH3IQqbyOSrDrRwWRqZrTz6wDFZjK38Vonf8s4B5j
 TIRtLDVnV3q82DAv0q5nmWIchBklsSj7upOU4PXjVgKVTQZn18JSmSvps w==;
X-CSE-ConnectionGUID: /NbJsH+rQSOlK73W3qldGg==
X-CSE-MsgGUID: LC2xDxWpShS6GMDn3SBTpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65071018"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="65071018"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 14:13:20 -0700
X-CSE-ConnectionGUID: 6mrpuNEKT12z6B+dzs2w9g==
X-CSE-MsgGUID: aZdC1dpnSGqRgUGHVUZo4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,296,1751266800"; d="scan'208";a="182983170"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 14:13:19 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 14:13:19 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 26 Sep 2025 14:13:19 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.64) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 14:13:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U71Bq4q+LhWQzcUClFRswXl6r2No8MAaJtZgyPRPdRb+ZEos3D5gYj5EEkKz7imy9YYKHUrm9vQuIgvvZcwd9WiCZAEKpmD8HWC4zTNtZWH/geyAxzveLCUkyvP8j27omBH01EmUqDMMu+sTK9mMWLGP5mfDvK3X37fbFeLUrdkoqmJKFfQoBIqSPrDqS9dKaOHJMSVV3f2pJUtPwb3uoWZZPLb+lRdj3oNDfXL12xPc/x3wpXQ1U07Z8hGibw6pMnIcs8R90kjn3Gtf/8hB/hlCrt3mM6/HswOJoC2JBODd3/Gn18Eg+9Q5hAw8s7tWaqlXLYEtCr8QpEAWZW/Gxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WJNVsGwvAG5JoEVDs8FqZd4jEr7XLyAXRkNUVp04xdQ=;
 b=yupzH43WBHB9311W6Yrcjk2l77mwKzmo8fIjBb4gOHqDUU3TEAlXoU4GALZ4FCPyBuJPbJ7h7+udQz2Mf04hvm5LI5kF28ibtBWZ4EGfSl7AnzxOL53+Y56HKN/1kmFT8JeR4hKKr6i1QsO86zCCBylcugmo7Q9ynkpFWeoGRdqwA/mt43rgn8UO/VzjpyNarZP0puBaFHgrFPhe/pL/4Oj8QXXVPXsW2akiO32LOKexXA5CoLU+rBTWKynnctpS3+KoGi2TyCwae9/VjkYGULWzAh1d8Q8dw9qZ4+a1xFmGEvAr05Zk43Ko/fU3RL/wGr4WC3trQjfKL0atxUXc/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by CH3PR11MB7392.namprd11.prod.outlook.com (2603:10b6:610:145::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Fri, 26 Sep
 2025 21:13:12 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%3]) with mapi id 15.20.9160.010; Fri, 26 Sep 2025
 21:13:12 +0000
From: Imre Deak <imre.deak@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?=
 <ville.syrjala@linux.intel.com>
Subject: [PATCH v4 2/6] drm/dp: Add helpers to query the branch DSC max
 throughput/line-width
Date: Sat, 27 Sep 2025 00:12:32 +0300
Message-ID: <20250926211236.474043-3-imre.deak@intel.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250926211236.474043-1-imre.deak@intel.com>
References: <20250926211236.474043-1-imre.deak@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0119.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c6::6) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|CH3PR11MB7392:EE_
X-MS-Office365-Filtering-Correlation-Id: 628dc9ed-f668-4c5a-d64a-08ddfd418010
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|10070799003|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cGJwUWkrOGxpWld5N1EvdUNyaXpLbnFYa3RrV2tqQ2dVZjd1SkZtUEJtOHhv?=
 =?utf-8?B?eHZkcXBLaUYxYzR6R3U3RnlVRGhHZGNGQWw5WXpFRkRUamxQZ1UvVk1wMFpu?=
 =?utf-8?B?Kzh1L3QzOXNOTGhQTmNNcXNKUDZFU25RZ1p2UThESEJNUGdPNk5wSTI3bjVo?=
 =?utf-8?B?VmlDL0puWVA0dndBWlNxK29FZjBFeFJEcHl3dUFGNjAxSk1MMFZoVTJsVmhY?=
 =?utf-8?B?R3hoNEY1U1FabEN2WkVzalZBKzRKaGlrcFBobGJOdFRwS2xXWlRESUJJQ2E2?=
 =?utf-8?B?VFJrNEE3bVljbU91Q0h4eEI4RnBMZkp4bW9kSFRUVXQ1Yng0Y2dhMnhNcDNC?=
 =?utf-8?B?RFZFQVhnOTNYZ2t1a0d6SE1IWlpzaUFaY2J2QlBoYWRzWWw0SFdoOEE5WG5M?=
 =?utf-8?B?SnlNbXpxYjNzSUtNNittNTRPSnlLRFNqVTJDSzFleEhRL2h4UFJVZDViYUpr?=
 =?utf-8?B?MGlsUE9UT1FyLzhWMGxUQ0hkL2VUZWpiaGg5OTZzOWlKdXlsYlo4WjJZUGNJ?=
 =?utf-8?B?RTlHLzlsOUJuNXpmZ0Q5MzQ0U3BUYTlybEhoYURkdldPc3JCVkwxVjFLenRV?=
 =?utf-8?B?TDg3cVczWnZac3F0YUxFcGE5elc4a0Yveml0em5LZzVJSldLT211K1R5akF1?=
 =?utf-8?B?QVIyOTV6K3BCOGpaTHJpcjlsR0ZwejJJV0hzYklXSWE0YnZGVGQweFRWdXJa?=
 =?utf-8?B?azY0V0hOTExVMGJ5R1Q0Y1NCNWY4MXRvMzdTbTd6ZVZQRndJQjJLT1pZdmZa?=
 =?utf-8?B?TjRmeE9QWUkwSjZ6NEEzUmNTdVZ0YjVWK0FjTWZBbWY2R3hkS09ZbFF1SkhM?=
 =?utf-8?B?aU9xUkZuS0dUTzNqMENBd1gvNkoxTkNOb3VZK3lQdXV6S2VIVDE4T3B2SU9r?=
 =?utf-8?B?cVNNODlHK3NjVGxmNUQySHhwaHpUQzNqYnBVKzk4TmEyR1BIV1hwRW1kSGty?=
 =?utf-8?B?R2ZOMFEwNWlWaFE3L3dSM2dOSXF5ODFGeFU0R3ZhVGhra1NLbVpydXFnbExk?=
 =?utf-8?B?bFR4Rk50NW1tS2RXUloydUEwQmYyN3NRalFDUi80NjlicFpDRGMzNTkrT2sr?=
 =?utf-8?B?YmRHdGlTa2Q2MjcxaDR2aDRTUkRzTmFBM2lZZDJKNTgzOE9uLzV1MUlnSUd6?=
 =?utf-8?B?Y1UvZHVSU1FvcEgvbUFmWmZTbDdjc3libkpLNkhaVmQ3eEtuUzBuQVF3elZQ?=
 =?utf-8?B?ekhGbDRoNHE4R1NpMDduYTlYYkRLREhZTUh4Yk1ObVFOWGEvRTRtNTlGc0Np?=
 =?utf-8?B?anY1dHFxZFJheGJSRy9XM3kvRkhKMytXZ2hwWE0vZEl1WGREL0dqQWhnb3BZ?=
 =?utf-8?B?RlZGU1d2UndqVkZBL045UGNVNVhYWjBtTW0vbGV5SWg3bVNOTWRjbURDTFdz?=
 =?utf-8?B?MS93UmV6cG1IL3dZVEpiWlB5WmFRY2Z3RlN2NFBIanBOOHNBNFVmWjN5UG5P?=
 =?utf-8?B?blcwNnhSZ0ZsQVAxT1dJV2hTNzVMUWlTeVpDb1FseTN2RXcwWTgwUXBOUEN4?=
 =?utf-8?B?UzhvS0VGd04zRHlVdDBPcEw0TTBrVkMyUnM1UlQ0Q0wreVNEZjkvWlVGNXRu?=
 =?utf-8?B?L3NTOFpWd2dCdUhqVUx1TWNxTm13SU0zaEdWZG1kWWVNZEZ3djhYL0hSeDN5?=
 =?utf-8?B?cmFYTkVZYWdVMWZnTmdWT2RRRXhad0Vva3BsL1JPRkRKNWU4dUJ2VUM5VVNr?=
 =?utf-8?B?MFpTUHNONEl6L0o2NDJPeEt3eEdZbVB5bkdWTjFONlorSkV6dllmby8rYlBa?=
 =?utf-8?B?S2NpVXNlZnRWakloMzNFeVJURDJRdlg1WklGZG91RW1XVjhaLzRYb05DZXJh?=
 =?utf-8?B?RVY5RFdNQk40SEFTVjRpakNMZXhTai9sbmdOZmx6WU5nL3p3ZDJ1MFlMLzkz?=
 =?utf-8?B?UDdLcUxJbjNzbHBWd2FtcjJ3V2F5MzNqekNxQXNKcFllbzFjekJtSUIyTGVH?=
 =?utf-8?Q?f5IeKykWx27VkE8wJsqMB3A9ZNR0w0nC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TlpVU1VlaC9HdWJtU3BuOUsxaHl5OGV4dGo1M1VrbUtpMEhwUmM4ZUVnc2hI?=
 =?utf-8?B?a0tiM2gyaENsMmRDejNFL0RCYVp1TktpS2dBNDRQU3RGSkhYck9yZ1lBL1h4?=
 =?utf-8?B?alE5WVVSRUpwZDNoQjJqbUtZZmd1cEJUN3RDOHZWZHVJUitOY2M0dW5aQVQz?=
 =?utf-8?B?T3ZkT0hGejlMYjVsK2hOdUFwK2lydHM1eW84anRURWkrcFhnNEpRQTZHSUts?=
 =?utf-8?B?ZVZHekRiSGNUQjdHaGViaWFKVnF5UlVJaFVGWkVNWkhOaTNqMnJ0S25BMi82?=
 =?utf-8?B?anJENkJTa25RSnAyVnFqMzhHbHRocHNJV3BrcmZLSks0dGFhcUg1eElPWkcv?=
 =?utf-8?B?YStNaHlUNmljejM4K3hHYjV0M2YrbGZLSEhvcWluV2pGTk82NVNCaHVaRVEr?=
 =?utf-8?B?Z2kwMStxazlBZlZGdGtkV1dqNGNwbG8vc0JRZTg1eVB4WUl0dmx5cjZRUi9l?=
 =?utf-8?B?MFhWT0tLdytkSm9rRzZHLzNkL3Nic3RMSWRFWkI0T2ZpNmJuNjRjbG5IK3Yv?=
 =?utf-8?B?L1F2eUhnVW45MzYwM2xicTNmVzBKWEZmT1NUZVo0ZVF1ZFptMlFSdGtldXdZ?=
 =?utf-8?B?Y2xlSmZPWkdEQVZCZXZSZmZ3ZjdxeU5ML1o5K3ZNS2hwcVJsMnowSkRDSDVk?=
 =?utf-8?B?TEs2OWpNSFR6RHpTK3RLZ3lvakMwdWY4NjQ5UXd0dzZ2TG9KcjdWb0JvNElS?=
 =?utf-8?B?MXhwR2RkaEFZa0VsNURDUjF0L3l0L1JjRTJnOE0vclBIVStOM1ZKK1ZtTXJa?=
 =?utf-8?B?QmovVnk4K3FYY2M3Y3J4b2pCMzdrVnVwdW9TcklJZWNSWjlYT3IvWFhWVmhz?=
 =?utf-8?B?anBZQyt2N05qUFVld1lFTUQ1ZDEzMlpFVDQxZW1vVHM4aUdqY01nU05Pd1lT?=
 =?utf-8?B?SmV4ZEM2a3F4Ty9RRzRvVlpHS1hPVmpVM2xlWkg2VmFlWkJGL20vQk90aWJI?=
 =?utf-8?B?VjNpZy9EeTk0TkZSd2ZpcGZudFExL1k2ZnVZa2IvaDBFVThvWVN4WXJteVB6?=
 =?utf-8?B?MHJGTkJkQndyeWwvSDd0eThlL2dBUmlwVDZYSmdnT0IvMGpnMXZFbWNZTk5H?=
 =?utf-8?B?aFRJMlNkLzRWbHIxTTY3ZmZ3WEdPWnpNLzJ4Z0FQa1FTSkxid1ZuTGQwcTZ1?=
 =?utf-8?B?cWpENTNRV3BrV0tVQUdWZ0Q4KzYyZDZKVUFFQ3pURU9POUZ1U0xvc21uWHZG?=
 =?utf-8?B?cHNDT294ci9QTVhyYW5JRFRhS1I1c05IY3hVZlVvM2gyNXJhYUs5T0FZTm9a?=
 =?utf-8?B?VkhRWGMvU0dMVDFyd0tzSzlwQS9vdkRCaUFYcmVzcHMvUllTLzcwVE5mWnZR?=
 =?utf-8?B?S3A1MDJvL3cwYzB2a0QvK3ZTMGlXUjllQThzcXFyMXVlQXMwSDV1eDhFekxG?=
 =?utf-8?B?dUxyYnU2bFZEdkpkRjlqelBML0h6dDh0ZU5SQUMxcXVqYXd5bE1rNGNpQWxz?=
 =?utf-8?B?RnV2MFY2WU9xZmt3VjJ1bTAxZVNHcU5HR0kvaVREZk43R2ovWGRobG1kaDZs?=
 =?utf-8?B?dXRXQ2xONmNsWUlyQ3Q5L2cvL0ZQME9HOGJkemZ3enBhUDhaa0FVUXVBQUgv?=
 =?utf-8?B?K1ZOSFo5Mk9OamVCazlKVUNXVE8yaEFYQ0gycUUwdW9GMHc3MTFSeDRKdmF3?=
 =?utf-8?B?NGxieHBTNFJEQjQ4RXRsaW94N0tZK1pFdEE4UTFzRnErYTF5c0pRRW9nQUkx?=
 =?utf-8?B?VVhPdzFQZmJXdDQxZWxpcjFDdytqK1lLeENpME1JRzVRNVJTYzdXTlFPVkRJ?=
 =?utf-8?B?ODI2d2tYODkvMitFVk1pYkJqQ1N6THV1SGNOZVB2Z3E1TXBYTzh1d24zaHor?=
 =?utf-8?B?aitRT0tvdW1IMnJtSjJDM0tuWVVYNkhiRXUrU0V4TkFrdjF0LzNHbWdJV3Fj?=
 =?utf-8?B?RG5tV0FZYm5kRUlIWExJQm56ek5XMmg0cmdyRDN6dW5TQjVKNUFKV3BRUkVR?=
 =?utf-8?B?N0hKWFZQNHpxSGgyN040UWtmd1hGdlRsMkF5cHl3L3NmMytGQm1TS1ZEZStn?=
 =?utf-8?B?VXBZRG01UkYvV291WmZsaHJoeVV6eFFNTDB2QXkvMDJjdDJmYUxrR1NwczBl?=
 =?utf-8?B?aEt0bk14eVF6Q0N5UkRKcFNGR3VsOHU3WTN0ajcveG1GNlJBRWcxTjRIMXpq?=
 =?utf-8?B?WHpheWZmWjNNMWd5ZFZmRUlXNUk1eUtmbWx4OGg3ZFZNTUNCRng4N2EyT0hU?=
 =?utf-8?Q?cqp7dJzDqCjPwrvrHz2pCtMerM2dt07Xq9ORPyrSPng0?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 628dc9ed-f668-4c5a-d64a-08ddfd418010
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 21:13:12.2243 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nZIadl+IrcqsbgGELvz9aacP/i13JZFWBrvrxpr1yF4XjDBcTO466X60Zc9g7Z3QrqTHfWOfcS3g2JEMBCvOQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7392
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

Add helpers to query the DP DSC sink device's per-slice throughput as
well as a DSC branch device's overall throughput and line-width
capabilities.

v2 (Ville):
- Rename pixel_clock to peak_pixel_rate, document what the value means
  in case of MST tiled displays.
- Fix name of drm_dp_dsc_branch_max_slice_throughput() to
  drm_dp_dsc_sink_max_slice_throughput().

Cc: dri-devel@lists.freedesktop.org
Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 142 ++++++++++++++++++++++++
 include/drm/display/drm_dp.h            |   1 +
 include/drm/display/drm_dp_helper.h     |   5 +
 3 files changed, 148 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 1c74fe9459ad9..e0f96b5ba4518 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -2844,6 +2844,148 @@ int drm_dp_dsc_sink_supported_input_bpcs(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_S
 }
 EXPORT_SYMBOL(drm_dp_dsc_sink_supported_input_bpcs);
 
+/*
+ * See DP Standard v2.1a 2.8.4 Minimum Slices/Display, Table 2-159 and
+ * Appendix L.1 Derivation of Slice Count Requirements.
+ */
+static int dsc_sink_min_slice_throughput(int peak_pixel_rate)
+{
+	if (peak_pixel_rate >= 4800000)
+		return 600000;
+	else if (peak_pixel_rate >= 2700000)
+		return 400000;
+	else
+		return 340000;
+}
+
+/**
+ * drm_dp_dsc_sink_max_slice_throughput() - Get a DSC sink's maximum pixel throughput per slice
+ * @dsc_dpcd: DSC sink's capabilities from DPCD
+ * @peak_pixel_rate: Cumulative peak pixel rate in kHz
+ * @is_rgb_yuv444: The mode is either RGB or YUV444
+ *
+ * Return the DSC sink device's maximum pixel throughput per slice, based on
+ * the device's @dsc_dpcd capabilities, the @peak_pixel_rate of the transferred
+ * stream(s) and whether the output format @is_rgb_yuv444 or yuv422/yuv420.
+ *
+ * Note that @peak_pixel_rate is the total pixel rate transferred to the same
+ * DSC/display sink. For instance to calculate a tile's slice count of an MST
+ * multi-tiled display sink (not considering here the required
+ * rounding/alignment of slice count)::
+ *
+ *   @peak_pixel_rate = tile_pixel_rate * tile_count
+ *   total_slice_count = @peak_pixel_rate / drm_dp_dsc_sink_max_slice_throughput(@peak_pixel_rate)
+ *   tile_slice_count = total_slice_count / tile_count
+ *
+ * Returns:
+ * The maximum pixel throughput per slice supported by the DSC sink device
+ * in kPixels/sec.
+ */
+int drm_dp_dsc_sink_max_slice_throughput(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE],
+					 int peak_pixel_rate, bool is_rgb_yuv444)
+{
+	int throughput;
+
+	throughput = dsc_dpcd[DP_DSC_PEAK_THROUGHPUT - DP_DSC_SUPPORT];
+
+	if (is_rgb_yuv444)
+		throughput = (throughput & DP_DSC_THROUGHPUT_MODE_0_MASK) >>
+			     DP_DSC_THROUGHPUT_MODE_0_SHIFT;
+	else
+		throughput = (throughput & DP_DSC_THROUGHPUT_MODE_1_MASK) >>
+			     DP_DSC_THROUGHPUT_MODE_1_SHIFT;
+
+	switch (throughput) {
+	case 0:
+		return dsc_sink_min_slice_throughput(peak_pixel_rate);
+	case 1:
+		return 340000;
+	case 2 ... 14:
+		return 400000 + 50000 * (throughput - 2);
+	case 15:
+		return 170000;
+	default:
+		WARN(1, "Missing case %d\n", throughput);
+		return 340000;
+	}
+}
+EXPORT_SYMBOL(drm_dp_dsc_sink_max_slice_throughput);
+
+static u8 dsc_branch_dpcd_cap(const u8 dpcd[DP_DSC_BRANCH_CAP_SIZE], int reg)
+{
+	return dpcd[reg - DP_DSC_BRANCH_OVERALL_THROUGHPUT_0];
+}
+
+/**
+ * drm_dp_dsc_branch_max_overall_throughput() - Branch device's max overall DSC pixel throughput
+ * @dsc_branch_dpcd: DSC branch capabilities from DPCD
+ * @is_rgb_yuv444: The mode is either RGB or YUV444
+ *
+ * Return the branch device's maximum overall DSC pixel throughput, based on
+ * the device's DPCD DSC branch capabilities, and whether the output
+ * format @is_rgb_yuv444 or yuv422/yuv420.
+ *
+ * Returns:
+ * - 0:   The maximum overall throughput capability is not indicated by
+ *        the device separately and it must be determined from the per-slice
+ *        max throughput (see @drm_dp_dsc_branch_slice_max_throughput())
+ *        and the maximum slice count supported by the device.
+ * - > 0: The maximum overall DSC pixel throughput supported by the branch
+ *        device in kPixels/sec.
+ */
+int drm_dp_dsc_branch_max_overall_throughput(const u8 dsc_branch_dpcd[DP_DSC_BRANCH_CAP_SIZE],
+					     bool is_rgb_yuv444)
+{
+	int throughput;
+
+	if (is_rgb_yuv444)
+		throughput = dsc_branch_dpcd_cap(dsc_branch_dpcd,
+						 DP_DSC_BRANCH_OVERALL_THROUGHPUT_0);
+	else
+		throughput = dsc_branch_dpcd_cap(dsc_branch_dpcd,
+						 DP_DSC_BRANCH_OVERALL_THROUGHPUT_1);
+
+	switch (throughput) {
+	case 0:
+		return 0;
+	case 1:
+		return 680000;
+	default:
+		return 600000 + 50000 * throughput;
+	}
+}
+EXPORT_SYMBOL(drm_dp_dsc_branch_max_overall_throughput);
+
+/**
+ * drm_dp_dsc_branch_max_line_width() - Branch device's max DSC line width
+ * @dsc_branch_dpcd: DSC branch capabilities from DPCD
+ *
+ * Return the branch device's maximum overall DSC line width, based on
+ * the device's @dsc_branch_dpcd capabilities.
+ *
+ * Returns:
+ * - 0:        The maximum line width is not indicated by the device
+ *             separately and it must be determined from the maximum
+ *             slice count and slice-width supported by the device.
+ * - %-EINVAL: The device indicates an invalid maximum line width
+ *             (< 2560 pixels).
+ * - >= 2560:  The maximum line width in pixels.
+ */
+int drm_dp_dsc_branch_max_line_width(const u8 dsc_branch_dpcd[DP_DSC_BRANCH_CAP_SIZE])
+{
+	int line_width = dsc_branch_dpcd_cap(dsc_branch_dpcd, DP_DSC_BRANCH_MAX_LINE_WIDTH);
+
+	switch (line_width) {
+	case 0:
+		return 0;
+	case 1 ... 7:
+		return -EINVAL;
+	default:
+		return line_width * 320;
+	}
+}
+EXPORT_SYMBOL(drm_dp_dsc_branch_max_line_width);
+
 static int drm_dp_read_lttpr_regs(struct drm_dp_aux *aux,
 				  const u8 dpcd[DP_RECEIVER_CAP_SIZE], int address,
 				  u8 *buf, int buf_size)
diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
index cf318e3ddb5c5..43978ddd15056 100644
--- a/include/drm/display/drm_dp.h
+++ b/include/drm/display/drm_dp.h
@@ -1686,6 +1686,7 @@ enum drm_dp_phy {
 #define DP_BRANCH_OUI_HEADER_SIZE	0xc
 #define DP_RECEIVER_CAP_SIZE		0xf
 #define DP_DSC_RECEIVER_CAP_SIZE        0x10 /* DSC Capabilities 0x60 through 0x6F */
+#define DP_DSC_BRANCH_CAP_SIZE		3
 #define EDP_PSR_RECEIVER_CAP_SIZE	2
 #define EDP_DISPLAY_CTL_CAP_SIZE	5
 #define DP_LTTPR_COMMON_CAP_SIZE	8
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index e438c44409952..ac03bfbb0fb52 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -211,6 +211,11 @@ u8 drm_dp_dsc_sink_max_slice_count(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE],
 u8 drm_dp_dsc_sink_line_buf_depth(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE]);
 int drm_dp_dsc_sink_supported_input_bpcs(const u8 dsc_dpc[DP_DSC_RECEIVER_CAP_SIZE],
 					 u8 dsc_bpc[3]);
+int drm_dp_dsc_sink_max_slice_throughput(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE],
+					 int mode_clock, bool is_rgb_yuv444);
+int drm_dp_dsc_branch_max_overall_throughput(const u8 dsc_branch_dpcd[DP_DSC_BRANCH_CAP_SIZE],
+					     bool is_rgb_yuv444);
+int drm_dp_dsc_branch_max_line_width(const u8 dsc_branch_dpcd[DP_DSC_BRANCH_CAP_SIZE]);
 
 static inline bool
 drm_dp_sink_supports_dsc(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE])
-- 
2.49.1


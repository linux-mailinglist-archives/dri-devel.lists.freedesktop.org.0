Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D42F1AEA8D7
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jun 2025 23:28:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD16310E2F2;
	Thu, 26 Jun 2025 21:27:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f9VCYaUk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33FBA10E2F1;
 Thu, 26 Jun 2025 21:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750973276; x=1782509276;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yVb/frNL8fZrhc3ALfTS+Jd1QB8CaZIaXKOY/s8Y2Zw=;
 b=f9VCYaUkGE7+fJYbs1T8SEL1FJdTZ6E/ey5geKyhw8UdNAZstBLBDg3F
 B0nIOq24F8y6eJJTES5L3V181ArdA4CIq6f1knzRq9/kwDZYTgDsLDNXH
 92m+LB6m+rjY1E94Qc94ssCbXpra0byrnZrA3WshAOBPaKL+exRGB02p/
 eO7QhFah9mZwJob3HJzzxgrWAtuhamRTKvvF6Rx0aVsSBw7D/Ff/+kOcJ
 Le/B4FhaD1rB8C6xSWOkJP77ZTfRWLc7mgcbA/SI116ZSDxOa72tNWPd1
 5a/2xSW6i5/wha7lC6Sq/fKsGDat3qV5LS0Kz7FdXZgpm4FdTgIHw3qx9 A==;
X-CSE-ConnectionGUID: RgTqH0DlQxCwDR8pY5AEZw==
X-CSE-MsgGUID: HplrzFjVQUCMsu8pAgz8lA==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="55906198"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="55906198"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 14:27:56 -0700
X-CSE-ConnectionGUID: t7dIJDJzTuOWNqJdO4S8ug==
X-CSE-MsgGUID: Ah8D+C1uTt+3SIVE+qF54g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="152031064"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 14:27:56 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 14:27:55 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 26 Jun 2025 14:27:55 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.69)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 14:27:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LgRPK6zDvRE2OJpf/19j+v66+e2NKBnF6mPemNQurRLEk2IKzXaDbbqkWZs93JvoUAEn4rrDFKdMx8b77QnicP7PGvc5xxudyof33WW3/Yqoz4vIT6IZUG6a7TyFsTeoC/2TQJibktGup7UPXlAsvqGHOXBfmmXJqAKeFcmkxEECSSleQpnqXGV+vyUl2IzsIrocG+LCdbekXNbP2ZXTtaoj7I8M8yJGXWnbplg2UuHFK8ZwoFM2wVk59VRx2sy53fyo/Nb60R7E21kb21eAEGbVTF2V1/flHSdI0ZqR32YFxh9o+37fuKnap2ZbHtOCQT+rVgPkXI1mdEC1fWZjyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pH7t+0Hp3MfG7XoJbUXiiKSLQAFoOi/sDBjXjPJ7+fU=;
 b=ebDypiVKohVcjZ+3mq0rUUsypO/wP7M9qTkbqZbSV1fELJO8LN5zkTajmoU+TFpnj0W6GdksuFmT25bkGbCfQMEHtqTlzjdEh2LADDOBTFkqRBAvRX5zkbiN5zEelbNfaXohF5XmgFe8W9UpLXgXL0a0wE0ss2/jQbYYoQe7CSx3B71xgLr87GGUAVYEz/gBg2SvBOMlB+gcuUNGPfObSXu+EP3es1JtkmXTyV9oq10fsL8frgX4fm6hTfrfrwEw0E0wxBl5ulCmNDwX55j1farQRQbBPbMPkynAa+lzxYWE7vSQAKbbmYInkBNHl77cQj8xnVGPxt94DgNQXZ3/sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by IA1PR11MB7344.namprd11.prod.outlook.com (2603:10b6:208:423::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Thu, 26 Jun
 2025 21:27:53 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%4]) with mapi id 15.20.8857.025; Thu, 26 Jun 2025
 21:27:53 +0000
Message-ID: <e392779f-a205-4085-8663-4cfbbab4bd82@intel.com>
Date: Thu, 26 Jun 2025 14:27:50 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/10] drm/xe/xe_late_bind_fw: Load late binding
 firmware
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Badal Nilawar
 <badal.nilawar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <anshuman.gupta@intel.com>,
 <alexander.usyskin@intel.com>, <gregkh@linuxfoundation.org>
References: <20250625170015.33912-1-badal.nilawar@intel.com>
 <20250625170015.33912-6-badal.nilawar@intel.com> <aF2CQ_VAT6PSh9Lk@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <aF2CQ_VAT6PSh9Lk@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR03CA0014.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::24) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|IA1PR11MB7344:EE_
X-MS-Office365-Filtering-Correlation-Id: 71001e5c-b472-4e62-f831-08ddb4f84f43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d2dPbVk1MTJXV2ZCZWVFUzR1R2lTd1cwMzQ4VmtaOXNLMFBZaUlyNDl6ZDFK?=
 =?utf-8?B?TkRQSjJKQk9ZZnFZS2FiNlZNOHVhVStneTd5K3JSSkE5Sys3Rk0xMUxBMy9q?=
 =?utf-8?B?cU5jMjhXSDRBbkIwc08zcXhLZXNsU1FQVmJWWm1iVTQrTldJNjZyOVhsZGov?=
 =?utf-8?B?TVJvRnRzUmdmVDZReFBwVnRsdStoQUtCaVpPZGxFSGV4cDRBRW8yT2JFQzVj?=
 =?utf-8?B?NitTaWpTV2p2dzdiT0w2MldxM0tuNnJoR3BVcEkrSFYwMWRxWWdSQXM3ZFlt?=
 =?utf-8?B?SWx2U2xIbkpoc0d0ZEZVTHBRcGdFN0ExNTIwR1RPWjBzS1Y5VFlvbmY5amFo?=
 =?utf-8?B?MGovbmpJMjA0cForQ290dkxlQVoxcjd1azAzRkFxKzdMekYxV3Qwd1pGSzhU?=
 =?utf-8?B?Q1NsZVM1b0FJZm5IUHBmNnFKU2xqb25vVENXRkMzdkhEVFVUdmJ2Uk9iSUIy?=
 =?utf-8?B?ZVV1R1NKa25IUVgvOGpXNTVFMHVxZlpwNGFsdXg2eFBWQStiTjdjN1dmZlI0?=
 =?utf-8?B?aUpCakpnV2RVOVZyb215cXo2Nm1FMFNEbUxsQmVtbWkwS0g5dDdxU1dHV1JF?=
 =?utf-8?B?cngxSlRZN0tRb3U1OGNZL0JFYS9sd1UvTTluTnZORDFTRWJDaGdPQWwyQmd5?=
 =?utf-8?B?cVFna0dQaXBYVEN6cG5UMkhjTmt2VGZjNkpXUGZjRDJIRjM2TzltWU5IaThR?=
 =?utf-8?B?WUp0dmp3QnEyd1hFb05CSjNXQTJpQmVVNVVyRU1wOEhaN0swczBrSzYyQ1ls?=
 =?utf-8?B?aEtodzV3d05ORFNsd0svd3hWWFBFQml0YVlWY3dHNk51RWhJYzNzd1lPdmlC?=
 =?utf-8?B?RXQwTnA3Wi9GSitUYnZONVZDZjY2aEtQZ3hkc1VzWm1ZcUlDdHY5aHJWYkw3?=
 =?utf-8?B?bHdRaXJGc0pjVXZxWmwvc0xkVndpOXhrRE9NdGp4d3NYT2dsRkQzUTdMdE9E?=
 =?utf-8?B?aVYyU3Jra3VoQVFOZGw0TDA4RndHdUQ1MGc3L3JtdVZIREdFU0JEcVYrVVNV?=
 =?utf-8?B?ZXg0MnlvcE5Eb09DM0cxNCs2M05lUElBODdFVXB2dnNIQXlqVStoZWZ6Sy9C?=
 =?utf-8?B?bnFBREVFeFZzM0UxenlSUkFWNm40WGdLaDhXbTlaTVdjQUc3dmFXd01TUGtn?=
 =?utf-8?B?YUxNemlETmhnajhHcnVxR3FYVEVLTE9hSkEyekw5aURLUkVhMHZOTXdDV3dY?=
 =?utf-8?B?QmFLUWFHMnl2NFJNc2xaS0xxR2ZKTG9GU0hQVXNHc0NPQmVaWHhlSk1uQVpj?=
 =?utf-8?B?NFJrSFo5UGFyWnBjS290elByMEI4bDFZUGMrdkRVcyt4VW5CMXZ6SnVrMDRR?=
 =?utf-8?B?dEU4UWlmOFFlcnVkQTNOSlpRcXJnejJRSW5pQTlocFBOVWdIeGkxTGo1QXI2?=
 =?utf-8?B?RUZxWW0zbks2ZmxDUzVnR25oSmN0MVVsTmZGOWJobFh6eDFibi9RMUlsWmhH?=
 =?utf-8?B?b2hlMW5GMk90NVdLRWdYb3JDY3Rmc2I3UkR6UVh5RWJ4allFSVdvSGErVnIx?=
 =?utf-8?B?M2M0c0xwWTN2VVhQRE40cUtOdmJLVk5SWjNuRnRhdzk5Ymc5UUNXZG5hc0hJ?=
 =?utf-8?B?SmVoUEREUjBxWTFrbUxPRzd4VTl5eFloTUduK3krMk44MWNlcW9oVlVoS0lu?=
 =?utf-8?B?N2JRS2FSWjhwSUF3OC9PaE5iTVNzbWJvVTQ1RG01YlZTa3dvMkpOVVBwMTR3?=
 =?utf-8?B?N0dNNytvQ1VsSU1LYXlRNFJnaWdTWXkvY0UxUGc2WERISVRoeG5pbEVUbEl3?=
 =?utf-8?B?eGI3eGl2ZGJ3TDV2NExoYXJrSXlWTy81VjgxM1drdHBIeUJwL2R5TlpTVnpr?=
 =?utf-8?B?RnZ5elJaVk1FV1pWOFVGaURyT3lma2h6SUlIeFlSNWUrZ3lEUUtETkpya1kv?=
 =?utf-8?B?MzAwcmFvbTZlUlRvemxDdWJSeHpMWHlwRVVpbGxJaW9OWCtPRXNMQVBTVXlV?=
 =?utf-8?Q?1t32gNVM8LM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UFplV1p4eWVYSGtBTDEzeERQb3BQS2FOYzYxbDhwN0RnbXBGRC93ekNhZjBQ?=
 =?utf-8?B?bnBwRGUvdVlkUXRiR01XSHFUcFM5LzREdU1ZUVR6T3kwc2dGNzBnL0Z6OWln?=
 =?utf-8?B?VzhUbWowaGg5ZzRVZkZzN0VSK3VUU2xUT0xCSGhCN09FamVMOURsOHA4NXVX?=
 =?utf-8?B?QmdrZ1dYSWhoRFdLV3Ewc1duSTZoSUszTFliVFJoN2tNbFRZQVV4WEh3L1VZ?=
 =?utf-8?B?QkY2enNmWkF1NGVYVHk4bWJIZDNHZmdsUUhPb1VobGwzd2dSREdnQXJxbEJv?=
 =?utf-8?B?ZEg5NXZDbDVIMGZoV0FZczhpemNjL3ZJY2FQVEw1MGluWmgwOWx0L0Zhd21V?=
 =?utf-8?B?QnYxazVEa25HdmYzelYzM1MxZVZRd0VMUURHcWFtd1F1WGp5eElKV0FVZE95?=
 =?utf-8?B?OERnKzFuSmpaU01aZGNYaG1ITzZJR3pFejgxdnVseEZQV1hDNXFDK2Vmbi9W?=
 =?utf-8?B?UGtxcCtZWEN0ekxWNU1OdWs2b2h3dXhIbVArU0kyRDg0ZHJKZUpyaFdNUjBx?=
 =?utf-8?B?bk9XTjBLanZHalpmYSthZndGeTZaZWNib250UXRWZWRtVU9rcjlaZEZXSmVv?=
 =?utf-8?B?SDFFTVNVUURPS21xb0k0ZjJtQUsxeTNjVEtxYnRLR0F3ZkRaMHRjQ0d3OVF6?=
 =?utf-8?B?VGZSdE5NR3B6ODZzdHd0WXVqZ0NUdXdKMEZrZlNFeWJ6WGE3ZDM2VmRDTDBw?=
 =?utf-8?B?L3lyU0ltRGlYMUNzK0dVeGZXQXZGYlBJYUhwa3JjbEZyUG11dWtIY0RwUjEr?=
 =?utf-8?B?T0FBMWFFS2JwOTdyVlRpejRqcWkrQUVPSmNUeEJIZVBjWkVMNCtZdy9udDJo?=
 =?utf-8?B?THpWcEZEZHlYL2U2VUVpbHkxOTA3dVFQcEFrdXBWdGQ5eGJrd1lCZzRIY1Jj?=
 =?utf-8?B?S2Y1TysxT0UyM1FnQ3MzWDNVa2xSZ1kwRUg0VS9KVVZ5UXAvNVFZSHFSQmZ5?=
 =?utf-8?B?UW9jOVNpRCt2U09sNkt0M3V3VHcvTVpQa2x0cUVjUWtDZmJVTG8rZ0pGT3Br?=
 =?utf-8?B?YTA3am5yaDRMNXpqblpHUDNmRDlDVHdvbkRGTmU1TzZJL0RTb0orMW9MRXBr?=
 =?utf-8?B?NXpsUEltZnJ2VlBZVVk0ci80czVXM1oyZ0cxSTlQZTRqdFFWZWl0eXF1YkQw?=
 =?utf-8?B?c3Y3Q1pSUFRUR1Q0ZzRBVlZWenBZUDVPRG5ZVFNHWGFuOENnTDV6RElVWHIy?=
 =?utf-8?B?Qnk1K2tnR1JveWJvSnhPZUFucVY0SmxLTUR5enNsS3VrQ05Tc3VlOUgyaXFC?=
 =?utf-8?B?VkVkOXBWWis0ZlZiNHhFcFZ0YXNaWDVsNXkvRWV1OWNUQ2NuM0Y4MVVFaHV4?=
 =?utf-8?B?UUZBSjZpQjVLZGttMU5RR2hmbHZ0Ukc1ZHVzTmVhdU1ENWRzdHhRQmxQcVpo?=
 =?utf-8?B?ZHY1b0J0NWZtbFlmamZyT0I5aExtdWd1TDdQU0dMUndkMm1KNEV3VEQ4T25n?=
 =?utf-8?B?YlRwK1BiZHFqa0luWGVoaDVBOW9jMFgwOVpKZWVFazZvSFZsQWZmQ0xhVUVr?=
 =?utf-8?B?bDcxcTVPSE9JYWhpek5zVHpOUXlySm1nMWs3UURSUGpSYjVxUi9nNXBYZk8y?=
 =?utf-8?B?NkJGNi9TWFVoRm8xMmErMGpibDBYUDBvY3ZubVdYb21WRVFGN0dzaGlUeHh5?=
 =?utf-8?B?Y0s4SGJFYXNUMytlN2JubmxqZ2t0LzJRNWRKU1ZEN1ZvRmhLU1FSVWMrZGwy?=
 =?utf-8?B?SFJpWU1JQ1A5aUwzNUt4OEhabGN2Mzl1U1lxN3JLS0NrV1dubWtyclY2Vjhh?=
 =?utf-8?B?UDNaZmo3NzdKc2NZZ2N6MmFoMHN4cGhmZ01QV1ZicWJicDJmVTNVdUtHYTNh?=
 =?utf-8?B?R2RLUnBKZm5pdWRJejVBc1Z2R0wvblVXeUZMbjQ0UzFURzlEYW9EMTIvUUlO?=
 =?utf-8?B?a1ZvRm5OaG9jbm5rR05zV1IxdG1mYXJYL1JLc2lTUXR5aTVNL0xZTmtiUlpi?=
 =?utf-8?B?dWV4UXl2eXkrN1UxOGFMbWJqSUNZYkljcis0K2ZBUGlHY0FUSytuckV3dEQw?=
 =?utf-8?B?Z29WZ1Y2Q3Z5Wk9lWlRBUmdVRGk3aEpoWlJHMUZpeDh1OG1jZGgvZ0RpZVhy?=
 =?utf-8?B?TG96VlJ5MjVMcFEyQ2wvaWdoZkgrTElHYmcwRTJSaFZNVjQvWGF3N2JPTkRW?=
 =?utf-8?B?MUJSVktiM1A5NUNjZ3g5U1NxVk1VNFNmL1FhRnEwK2pwT2pjL2M1QUZGM0tp?=
 =?utf-8?Q?1TB/KRsUtwR1btFYGy7HY0I=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 71001e5c-b472-4e62-f831-08ddb4f84f43
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 21:27:53.2253 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rBTJbfsUiVfZamdaMMuHtplg3fM/rLYocAtNsiyusImy3U9ilH7zUpXEoBbPpJcdZ8lyXxxaXymr/wIt9DgeZj9yNlDFqVgcArR9bx97FXY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7344
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



On 6/26/2025 10:24 AM, Rodrigo Vivi wrote:
> On Wed, Jun 25, 2025 at 10:30:10PM +0530, Badal Nilawar wrote:
>> Load late binding firmware
>>
>> v2:
>>   - s/EAGAIN/EBUSY/
>>   - Flush worker in suspend and driver unload (Daniele)
>> v3:
>>   - Use retry interval of 6s, in steps of 200ms, to allow
>>     other OS components release MEI CL handle (Sasha)
>> v4:
>>   - return -ENODEV if component not added (Daniele)
>>   - parse and print status returned by csc
>>   - Use xe_pm_get_if_in_active (Daniele)
> The worker is considered outer bound and it is safe
> to use xe_pm_runtime_get which takes the reference
> and resume synchronously.
>
> Otherwise, if using get_if_active you need to reschedule
> the work or you lose your job.

The issue is that the next patch adds code to re-queue the work from the 
rpm resume path, so if we do a sync resume here the worker will re-queue 
itself immediately when not needed. Also, when the re-queued work runs 
it might end up doing another sync resume and re-queuing itself once 
more. However, in the next patch we do also have a flush of the work in 
the rpm_suspend path, so maybe the worker running when we are rpm 
suspended is not actually a possible case?
Also, thinking about this more, that re-queuing on rpm resume only 
happens if d3cold is allowed, so when d3cold is not allowed we do want 
to proceed here we can actually reach here when rpm suspended.

>
>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_late_bind_fw.c       | 149 ++++++++++++++++++++-
>>   drivers/gpu/drm/xe/xe_late_bind_fw.h       |   1 +
>>   drivers/gpu/drm/xe/xe_late_bind_fw_types.h |   7 +
>>   3 files changed, 156 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
>> index 32d1436e7191..52243063d98a 100644
>> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
>> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
>> @@ -16,6 +16,20 @@
>>   #include "xe_late_bind_fw.h"
>>   #include "xe_pcode.h"
>>   #include "xe_pcode_api.h"
>> +#include "xe_pm.h"
>> +
>> +/*
>> + * The component should load quite quickly in most cases, but it could take
>> + * a bit. Using a very big timeout just to cover the worst case scenario
>> + */
>> +#define LB_INIT_TIMEOUT_MS 20000
>> +
>> +/*
>> + * Retry interval set to 6 seconds, in steps of 200 ms, to allow time for
>> + * other OS components to release the MEI CL handle
>> + */
>> +#define LB_FW_LOAD_RETRY_MAXCOUNT 30
>> +#define LB_FW_LOAD_RETRY_PAUSE_MS 200
>>   
>>   static const u32 fw_id_to_type[] = {
>>   		[XE_LB_FW_FAN_CONTROL] = CSC_LATE_BINDING_TYPE_FAN_CONTROL,
>> @@ -31,6 +45,30 @@ late_bind_to_xe(struct xe_late_bind *late_bind)
>>   	return container_of(late_bind, struct xe_device, late_bind);
>>   }
>>   
>> +static const char *xe_late_bind_parse_status(uint32_t status)
>> +{
>> +	switch (status) {
>> +	case CSC_LATE_BINDING_STATUS_SUCCESS:
>> +		return "success";
>> +	case CSC_LATE_BINDING_STATUS_4ID_MISMATCH:
>> +		return "4Id Mismatch";
>> +	case CSC_LATE_BINDING_STATUS_ARB_FAILURE:
>> +		return "ARB Failure";
>> +	case CSC_LATE_BINDING_STATUS_GENERAL_ERROR:
>> +		return "General Error";
>> +	case CSC_LATE_BINDING_STATUS_INVALID_PARAMS:
>> +		return "Invalid Params";
>> +	case CSC_LATE_BINDING_STATUS_INVALID_SIGNATURE:
>> +		return "Invalid Signature";
>> +	case CSC_LATE_BINDING_STATUS_INVALID_PAYLOAD:
>> +		return "Invalid Payload";
>> +	case CSC_LATE_BINDING_STATUS_TIMEOUT:
>> +		return "Timeout";
>> +	default:
>> +		return "Unknown error";
>> +	}
>> +}
>> +
>>   static int xe_late_bind_fw_num_fans(struct xe_late_bind *late_bind)
>>   {
>>   	struct xe_device *xe = late_bind_to_xe(late_bind);
>> @@ -44,6 +82,93 @@ static int xe_late_bind_fw_num_fans(struct xe_late_bind *late_bind)
>>   		return 0;
>>   }
>>   
>> +static void xe_late_bind_wait_for_worker_completion(struct xe_late_bind *late_bind)
>> +{
>> +	struct xe_device *xe = late_bind_to_xe(late_bind);
>> +	struct xe_late_bind_fw *lbfw;
>> +	int fw_id;
>> +
>> +	for (fw_id = 0; fw_id < XE_LB_FW_MAX_ID; fw_id++) {
>> +		lbfw = &late_bind->late_bind_fw[fw_id];
>> +		if (lbfw->valid && late_bind->wq) {
>> +			drm_dbg(&xe->drm, "Flush work: load %s firmware\n",
>> +				fw_id_to_name[lbfw->id]);
>> +			flush_work(&lbfw->work);
>> +		}
>> +	}
>> +}
>> +
>> +static void xe_late_bind_work(struct work_struct *work)
>> +{
>> +	struct xe_late_bind_fw *lbfw = container_of(work, struct xe_late_bind_fw, work);
>> +	struct xe_late_bind *late_bind = container_of(lbfw, struct xe_late_bind,
>> +						      late_bind_fw[lbfw->id]);
>> +	struct xe_device *xe = late_bind_to_xe(late_bind);
>> +	int retry = LB_FW_LOAD_RETRY_MAXCOUNT;
>> +	int ret;
>> +	int slept;
>> +
>> +	/* we can queue this before the component is bound */
>> +	for (slept = 0; slept < LB_INIT_TIMEOUT_MS; slept += 100) {
>> +		if (late_bind->component.ops)
>> +			break;
>> +		msleep(100);
>> +	}
>> +
>> +	if (!xe_pm_runtime_get_if_active(xe))
>> +		return;
>> +
>> +	mutex_lock(&late_bind->mutex);
>> +
>> +	if (!late_bind->component.ops) {
>> +		drm_err(&xe->drm, "Late bind component not bound\n");
>> +		goto out;
>> +	}
>> +
>> +	drm_dbg(&xe->drm, "Load %s firmware\n", fw_id_to_name[lbfw->id]);
>> +
>> +	do {
>> +		ret = late_bind->component.ops->push_config(late_bind->component.mei_dev,
>> +							    lbfw->type, lbfw->flags,
>> +							    lbfw->payload, lbfw->payload_size);
>> +		if (!ret)
>> +			break;
>> +		msleep(LB_FW_LOAD_RETRY_PAUSE_MS);
>> +	} while (--retry && ret == -EBUSY);
>> +
>> +	if (!ret) {
>> +		drm_dbg(&xe->drm, "Load %s firmware successful\n",
>> +			fw_id_to_name[lbfw->id]);
>> +		goto out;
>> +	}
>> +
>> +	if (ret > 0)

nit: here you can just do "else if" and drop the goto.

Daniele

>> +		drm_err(&xe->drm, "Load %s firmware failed with err %d, %s\n",
>> +			fw_id_to_name[lbfw->id], ret, xe_late_bind_parse_status(ret));
>> +	else
>> +		drm_err(&xe->drm, "Load %s firmware failed with err %d",
>> +			fw_id_to_name[lbfw->id], ret);
>> +out:
>> +	mutex_unlock(&late_bind->mutex);
>> +	xe_pm_runtime_put(xe);
>> +}
>> +
>> +int xe_late_bind_fw_load(struct xe_late_bind *late_bind)
>> +{
>> +	struct xe_late_bind_fw *lbfw;
>> +	int fw_id;
>> +
>> +	if (!late_bind->component_added)
>> +		return -ENODEV;
>> +
>> +	for (fw_id = 0; fw_id < XE_LB_FW_MAX_ID; fw_id++) {
>> +		lbfw = &late_bind->late_bind_fw[fw_id];
>> +		if (lbfw->valid)
>> +			queue_work(late_bind->wq, &lbfw->work);
>> +	}
>> +	return 0;
>> +}
>> +
>>   static int __xe_late_bind_fw_init(struct xe_late_bind *late_bind, u32 fw_id)
>>   {
>>   	struct xe_device *xe = late_bind_to_xe(late_bind);
>> @@ -99,6 +224,7 @@ static int __xe_late_bind_fw_init(struct xe_late_bind *late_bind, u32 fw_id)
>>   
>>   	memcpy(lb_fw->payload, fw->data, lb_fw->payload_size);
>>   	release_firmware(fw);
>> +	INIT_WORK(&lb_fw->work, xe_late_bind_work);
>>   	lb_fw->valid = true;
>>   
>>   	return 0;
>> @@ -109,11 +235,16 @@ static int xe_late_bind_fw_init(struct xe_late_bind *late_bind)
>>   	int ret;
>>   	int fw_id;
>>   
>> +	late_bind->wq = alloc_ordered_workqueue("late-bind-ordered-wq", 0);
>> +	if (!late_bind->wq)
>> +		return -ENOMEM;
>> +
>>   	for (fw_id = 0; fw_id < XE_LB_FW_MAX_ID; fw_id++) {
>>   		ret = __xe_late_bind_fw_init(late_bind, fw_id);
>>   		if (ret)
>>   			return ret;
>>   	}
>> +
>>   	return 0;
>>   }
>>   
>> @@ -137,6 +268,8 @@ static void xe_late_bind_component_unbind(struct device *xe_kdev,
>>   	struct xe_device *xe = kdev_to_xe_device(xe_kdev);
>>   	struct xe_late_bind *late_bind = &xe->late_bind;
>>   
>> +	xe_late_bind_wait_for_worker_completion(late_bind);
>> +
>>   	mutex_lock(&late_bind->mutex);
>>   	late_bind->component.ops = NULL;
>>   	mutex_unlock(&late_bind->mutex);
>> @@ -152,7 +285,15 @@ static void xe_late_bind_remove(void *arg)
>>   	struct xe_late_bind *late_bind = arg;
>>   	struct xe_device *xe = late_bind_to_xe(late_bind);
>>   
>> +	xe_late_bind_wait_for_worker_completion(late_bind);
>> +
>> +	late_bind->component_added = false;
>> +
>>   	component_del(xe->drm.dev, &xe_late_bind_component_ops);
>> +	if (late_bind->wq) {
>> +		destroy_workqueue(late_bind->wq);
>> +		late_bind->wq = NULL;
>> +	}
>>   	mutex_destroy(&late_bind->mutex);
>>   }
>>   
>> @@ -183,9 +324,15 @@ int xe_late_bind_init(struct xe_late_bind *late_bind)
>>   		return err;
>>   	}
>>   
>> +	late_bind->component_added = true;
>> +
>>   	err = devm_add_action_or_reset(xe->drm.dev, xe_late_bind_remove, late_bind);
>>   	if (err)
>>   		return err;
>>   
>> -	return xe_late_bind_fw_init(late_bind);
>> +	err = xe_late_bind_fw_init(late_bind);
>> +	if (err)
>> +		return err;
>> +
>> +	return xe_late_bind_fw_load(late_bind);
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.h b/drivers/gpu/drm/xe/xe_late_bind_fw.h
>> index 4c73571c3e62..28d56ed2bfdc 100644
>> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.h
>> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.h
>> @@ -11,5 +11,6 @@
>>   struct xe_late_bind;
>>   
>>   int xe_late_bind_init(struct xe_late_bind *late_bind);
>> +int xe_late_bind_fw_load(struct xe_late_bind *late_bind);
>>   
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
>> index 93abf4c51789..f119a75f4c9c 100644
>> --- a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
>> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
>> @@ -9,6 +9,7 @@
>>   #include <linux/iosys-map.h>
>>   #include <linux/mutex.h>
>>   #include <linux/types.h>
>> +#include <linux/workqueue.h>
>>   
>>   #define MAX_PAYLOAD_SIZE SZ_4K
>>   
>> @@ -38,6 +39,8 @@ struct xe_late_bind_fw {
>>   	u8  *payload;
>>   	/** @late_bind_fw.payload_size: late binding blob payload_size */
>>   	size_t payload_size;
>> +	/** @late_bind_fw.work: worker to upload latebind blob */
>> +	struct work_struct work;
>>   };
>>   
>>   /**
>> @@ -64,6 +67,10 @@ struct xe_late_bind {
>>   	struct mutex mutex;
>>   	/** @late_bind.late_bind_fw: late binding firmware array */
>>   	struct xe_late_bind_fw late_bind_fw[XE_LB_FW_MAX_ID];
>> +	/** @late_bind.wq: workqueue to submit request to download late bind blob */
>> +	struct workqueue_struct *wq;
>> +	/** @late_bind.component_added: whether the component has been added */
>> +	bool component_added;
>>   };
>>   
>>   #endif
>> -- 
>> 2.34.1
>>


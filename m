Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC4DAF0585
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 23:21:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E237710E605;
	Tue,  1 Jul 2025 21:21:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nSL0WLln";
	dkim-atps=neutral
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A81510E083;
 Tue,  1 Jul 2025 21:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751404866; x=1782940866;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=oOM69AG01N1Okzi8zbKYpF7i5MjkIRvM+4ZRmKXZG+Y=;
 b=nSL0WLlnAZhsdkgi3b2tgMyAGAS7QB+WsKtsPc1DDF8keJbgu88nJIl5
 1NCtiwV6ajkjOP8jArO0SyA5ALdYPtUkndpsV5v+GctkGJcVgUXkIgVxl
 TtzFrMuBkGSouGCgdBhkLOmtk/Dq4I4nAxr+YWJcteCB6P9lTR2eEC943
 zXt30nWygbUTajbDYJtLCP30zzTdPuK5O085rHUHzo9n/L1nQ9YI3aTur
 MQSfCEmf3BTsbZy59AuD3gb2IwBSMaZ0SUbdxccCrq0ahwpwxTV17xawA
 uQt86UK+gYVv1L85mW3QdJvWuHMTtIwCiFjoOL4YgcIe1AhqXcctTjevu Q==;
X-CSE-ConnectionGUID: Q9Nw/aIIS8WQnKQ3p7w1Lw==
X-CSE-MsgGUID: JBRE5VP5RWmtpRGOYblB/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="71251457"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="71251457"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 14:21:06 -0700
X-CSE-ConnectionGUID: 7c6k+IvMTBugCqm0M7B+bg==
X-CSE-MsgGUID: gl0VGkGUR76j4bUvXp/3rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="158444624"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 14:21:06 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 14:21:05 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 1 Jul 2025 14:21:05 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.83)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 14:21:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bjvWV1syw9uQD3U43HV/zoz4vnmgWvdTMCzYjk7plwu4OitQmhu3Fwp+N3s+5dxCtfx6+Trj+2lg/k7Yja+hnV3938nhUypVG1l7soMkz6t/lK5Ze+Ctc4/FpjCOEjrQD88uw+LeI+oMirbDRfvHcnvmwEyykMlTEGT57j6ffEqNh2LNbQdeCRs/Bi/Pc3Sbblklr/ylTLrnHu4JT3LRmaP27dVxTkQs2YCZQ7zhhn8Ag5IGZFK4c9GHWe3Qr8cLFpSDviDlClm2nHzk8Zy7SPKr1qgVVv6E2nxLPAvrxZy4trAI4v/A3J1BOs0/BWAYXVUgEtu1UATasowfv+TtDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/aj17nxu+rsaA4Iqd1CKSpH16EHBffNEHbLSXBqarx8=;
 b=ta/qijoq0sOuz40hGJ6F+ynEzpzq4RK6rkdLqADGzauZIqvKhfNzCCHrFe8vIpb/NcLaHykFxPoo1pwTFSTkonYpga1dFzaGYtXVDJVaTuAIFEKTWu4jPqLH4ATKh4Ztu2qD60BW7rKNZsHBdohHg2KoBph5ftAfFtifD7blq7AVs3KWIHO31Ym8rBq345JHEJ0SoRxCbzjSLgGHWHQhYB54GfnR2NamGnsiBf9AsKEYglMt1zzWDZRsotYbpFY5Mi+29K50foRlHeck6TRyeNJqwQl/vQqEqCgHKXaCUEUk31HSh9smsIKjVd4EWxRcF+CHWQ8cCmVZ92KKikATZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by IA1PR11MB6193.namprd11.prod.outlook.com (2603:10b6:208:3eb::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.30; Tue, 1 Jul
 2025 21:21:03 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%4]) with mapi id 15.20.8857.025; Tue, 1 Jul 2025
 21:21:02 +0000
Message-ID: <dbbc9914-57a0-4e04-9b26-9c01b581f811@intel.com>
Date: Tue, 1 Jul 2025 14:21:00 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/i915/guc: Enable CT_DEAD output in regular debug
 builds
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
CC: <DRI-Devel@Lists.FreeDesktop.Org>
References: <20250614030222.105601-1-John.C.Harrison@Intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20250614030222.105601-1-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0175.namprd03.prod.outlook.com
 (2603:10b6:a03:338::30) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|IA1PR11MB6193:EE_
X-MS-Office365-Filtering-Correlation-Id: 330c8694-c2ce-483e-9ef8-08ddb8e52ea4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ajJqa05ydVI4TUk5VlhmdWFJZ3VsRENZNDVnY0hUY3FmYmxiNXAra0x2ZnZP?=
 =?utf-8?B?Mk9PamxyUUlPdldFQXNZNWFkeDIvdEpRMVJhbFJOOTBrVVllY2JLRVBOZTRj?=
 =?utf-8?B?S1o1NFNzR2pld1J0YUtnaVZDS3JYZ1ZvdEJMeHM3cDd5Y2h4R2RLS3pxTFNJ?=
 =?utf-8?B?c2N1TE9hRElIeG1qbXdWcWhBR2xlR0dWaGJ1Q1hOblkyU2xrR2dnZ1lZNDhN?=
 =?utf-8?B?d1E3VkREV0p5K0M0NFN6eTdWYUI5akgxQUJTUVloRFFFUFBEbmJlV3Nab2lD?=
 =?utf-8?B?UHRzdzJzTTZFbm1xbkVyYWRxMDloSjlYZlk0RWRUVit5bmVYUEJ2S29YZkk5?=
 =?utf-8?B?NVFUeUxoOWNoSlpyOFJZeDNoTUdGRWIzS2FLdWVQMlhoRTkyQzF1bkV0NXpn?=
 =?utf-8?B?VjdPa2YwRUVLQTAxMmhTVU44dGhqM1ZqcENRek43T3liajRrOStYT0RzQXZQ?=
 =?utf-8?B?UFFXR2w2K2pVNHVnOHBYOFQxYSszUXdicFV4aUdZWERlcXdMQmdFMHRqRDdF?=
 =?utf-8?B?bUovQWdKbXFpUzVTMjlVMzRZVmo4T3Qya2NHTUJMWU5oZUlDK3pDWGVCenJj?=
 =?utf-8?B?cmc3M1lDcnNpazVvRUtENzNxSW03TEtjbjh6eFE3aTNTcXRvS0xVL1dsakt2?=
 =?utf-8?B?Mnh2MWtGT3gwQUxFL2dCc3YwTkZEMXVVclhGUExMNHY5NDdBbk5tWi9JYVg4?=
 =?utf-8?B?bDZxZEZ4bm1HRW5TWEdDYmhVcmRZa3A0cnB1b2JlUisrcnI5cFBvZ3dGZmVW?=
 =?utf-8?B?My9vTjVLeG4zWDlZa0ZHK0pLaFhZVjkxRi9kVkFRak9INUI2MnBIMTg2V09S?=
 =?utf-8?B?QkJ4Wk5KenNXZDRQRnZXdmVoZ1hkUGliVElkUlYwclpFSHJ4dkpDcmlzZ3Rw?=
 =?utf-8?B?OEhndEpxSW1zV0dxbzZXZVJjdkI2aVZaQjRweE8xRmliZlBkWUt3dWhucHRY?=
 =?utf-8?B?MDByTVI5b2VBUkxHY1U3Nk01aGRjcnYvS3ZMcGh5MkFzZ21MQlZrZDFHYmMw?=
 =?utf-8?B?TFF0MU5VTkpBSDlqdENGRDFxQTlzemJESlhGSWx0Z3FqdVBUZ0I0R2ZBQm14?=
 =?utf-8?B?NGFrdEwyZVNZS093K0NZNE9aWWVTMXZtZFFBT0pVOU5YQVBQUjA5bjE0NEpM?=
 =?utf-8?B?Nm9FV0VNL01McEwrVllDQVlRV2JNMERZakdyU3gvNDdkMlMwWk1BamdPdW5t?=
 =?utf-8?B?RkdGM3BRTlhNaGdBWVFUdmJVZnZObzlnRElZblNLMUNCSnIxbGFVdmFaUjB5?=
 =?utf-8?B?aG1xYjdLMTJYZ1dwV3NZd2F0NlNPaXBaZWpmbmw5VDdGMnR2bkpWQkd3Q2lZ?=
 =?utf-8?B?SGduRXdmUEZ1RE1vOXRNUGpBWHVjOHp5M0UxVVRrKzRoa0dHWkZpMFFWOXFW?=
 =?utf-8?B?QlkvcDdIYlBjVmw1d2hVN1lZVTE3R09KMU9VbDVibFRIYzFPNVNWOGkzL0Mr?=
 =?utf-8?B?M1NZajdabnZJbDFwYkRoUVR1VWJqWVlxZ2dYTHRheVRTbXBzdWcxSnJweldB?=
 =?utf-8?B?dlhYczJLVWt6RGtHR2UyT2tKOVFEaXNGK2Z5Q1ozYmVzL3lmcCszUmxLRXV5?=
 =?utf-8?B?MkV2Y1hPNkZiZ1ZEZzQyb1pBN3hpU1hya2dNRTM2dDlnUUxERmx1NXJySkZR?=
 =?utf-8?B?WmNIV2ZGcm92WHcwUFRDd0RzQmw3UW1wdTlXSEhhVDdWalVVelNNckNXYzQ2?=
 =?utf-8?B?dnJ5QXVyVG92S1VHOFFNcHZ0b3NBb1hnOURCSXQxdnMvcFlaTTl3SnNhRk9B?=
 =?utf-8?B?b2gwOFBTUWFaTDNqWThRSkZhR3N3TDAyb1Y3eUkwbmRDQzZ2V3BqZ3dDa1FR?=
 =?utf-8?B?dW9jb2c0ekQvUVZvTnZjVXdnRUJyRnBUSHFBTzc5VUU3eC9qTGh5MElMdnFm?=
 =?utf-8?B?TzBsNGVscVFMb3prc0VaT3FiVzBJWDR0cnI1bGdYVXo1OW0xY2FlMmJxVE5p?=
 =?utf-8?Q?NFr10YTKHkI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1kwMytNb0NobmJEWkR1ZGVsNUszaSsvNkFmN204R2w5STMrNlpJclNiZWZs?=
 =?utf-8?B?N05PRjQzVkllbDd5M1J0MkVIellLWFdGaFA3akI3QlYrdllsd25UN055L2VH?=
 =?utf-8?B?ODErdWwyT2tMWFMvMXo5ZitNR21DU1hmZUhrOENadS9LM2Nac2dTWWZLSm10?=
 =?utf-8?B?S2RPZVRiWXZ4MW9HSjkvYmlHUU1PTEVvTlhEQSt6eVNrMXNyV2FMQSttTHo0?=
 =?utf-8?B?Z000UVlXMGJENXVzVnF5aTNYdzRWQkR5amcxZ0dVdHpxQXFCMEJyeEhKTlhr?=
 =?utf-8?B?UzZZY3pWL1JjRlBRWEpWUWNkVERzMTVBd2drUDB4MlgxU3lBZ1VuSTZIM05O?=
 =?utf-8?B?YlB2c1AxNmt0Zm16djh4TGdNQ05VdlVRM1VZbm56Q1lySWRIUkg2Tk5SOXhs?=
 =?utf-8?B?cXZoWXZZSSt5Mnc4aVYvVFByTktkcXpyODJOT0RqdkIxcFZBNHk0aWMyRDJE?=
 =?utf-8?B?c3V6UDdzSGRBWjdISnFLelpLR0FGdUdPeW1OUllzaXljZk01eVlIREhPVFdH?=
 =?utf-8?B?azJUTjVHcHN5RDhjM05ON2I5RHFvNE9wNEt0eU91WkcyM3crektKaENrZ0Zq?=
 =?utf-8?B?SU9mZ0k0WWVlNWQwL2tpbGp0WUluRGIxZHMzMHIyUTMweUR5YlJNNlhUOHhF?=
 =?utf-8?B?WnVpTTFnb3hBWDI1UFBzV1VuLzE3RVRKUEQvV0k3em92SmRKTE1nSEJzSjJN?=
 =?utf-8?B?N3ppL2pqdStLSGtvVjE1NXh1Slh0c0xnNFU5RjFucmJKRmNqZHFnQnE5LzN2?=
 =?utf-8?B?L2V5THNHSjBONU4rRllwWkxGZGk0NGEvRElUVXFlcmEvMFhkYThPNTRmTlBt?=
 =?utf-8?B?MkZ0bDQvaE9WemFHelZ2dW9HOWQzNkErbXpnNHFYTVNLbE1BY3YzUklIaXJN?=
 =?utf-8?B?bXozSWFnNnhiaXNlWFpQRVpxUjlSa2J3NmU3NlFrb2NNNDEwT2VsQjQ1SWpj?=
 =?utf-8?B?T0ppOWw5d0lCcG9SRjVrelpIdU9sMFdVWmluV0R5VWN4a0t6MDVidFVyKzRR?=
 =?utf-8?B?YnBGeTJzMEQ0TzZWbWgzbmtnVFZoVlpZdEJ3dlJvbmVpc0lTY1JibUZhTE4r?=
 =?utf-8?B?akNpcU8vTXV5OGQzWTFQV21yRDRqMVRUOUI1cVZJck1xd2lSdTlUT2xmd3I3?=
 =?utf-8?B?V2pZV05hZ1BPUng3blphSWpFR205a01TenAvRnVwWmtjVXIwNjZOWUNnVm1F?=
 =?utf-8?B?YmxjK2V3Tlh6cjN0NWFNVzFrend3OVBPUEUxVFFvOERwaGtxQmxkY2lCc29Y?=
 =?utf-8?B?dGpDdDdmUkN0UXRvWHVJdmxJSWF4d0ltbXVVa3prVWVzU0FsTG1Kcm9Da3lC?=
 =?utf-8?B?YkZsa1JXMGs1N2VVeFUzOGxaNnlZbjBLMUVkVmI5K2RFYUZ4T1UvTWpQVlRo?=
 =?utf-8?B?Sm1GSG9CejFaaEhqKzdIcklnNEphd2hEaWc1azJJYVNDREcrTkkxNGkzZ1hk?=
 =?utf-8?B?aVBDL2w3eVJ0emJCbXhNTXN2T3FyS0VFSnVXQ1VmTlBSS2Q0UzVXNmlpbnNk?=
 =?utf-8?B?NjlBVnd2SDNtc25OKzEzcm1MdktuNUV6VlhXQVFKTEVzeCszUzBuelpUWmE5?=
 =?utf-8?B?SUZuYkFoQTRkY0RueGswOGJrNHRKUHB0VDB6TXJMMFY5U3JHZmVjOCtIdU1n?=
 =?utf-8?B?dGxFUUtyQ05ubHNseHlUUTdIOWlYZ2J6RlNwVllmZXFOUFFKZHlvRmNCNEc4?=
 =?utf-8?B?YjkvREY0VVBuZzdib1ZaWk1nL1YxckxrV3BVSVFSOXhuZVRlVEZoWWJTZk1X?=
 =?utf-8?B?aldDRGgvRWdQci9jMytkcEYrWjV5L1NQdEJRREFvQUlxNnc5Q2htWG5ZSUk0?=
 =?utf-8?B?N2lzdWd6dVNwZXI5OHlYUkxTUFdmYWc1cEtHWUQ2eFRSOFRNMTg0YXJjWnJh?=
 =?utf-8?B?VWNSUkpNRTU2T1N0VzBDRzMvUDJ1NW84UXdtRWpSVUtud0Rnd3Y1VjV5RG1x?=
 =?utf-8?B?ajFIaStkS3lsNFpKZDBDam8wbVZaVCtYNGduTXN0bUNBRzNEMW9SbUhWcjd4?=
 =?utf-8?B?YjZnbXN5Q3V6U1AxK215ZGdyemE2QStPb2hEM0JraDdFSWRRdk9BaFlDQUdE?=
 =?utf-8?B?NGdIc3JvTVlCVnRkMWhRSzJ1OHNDT0VXenhZMU8vcnNRLy9LY1BoelM5UnBY?=
 =?utf-8?B?WjlhYkd2c0s5VXAxNEFXTUptOFlPdUtPNExGeXNRcUtBYjMxSWFuYVRlVENJ?=
 =?utf-8?B?cHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 330c8694-c2ce-483e-9ef8-08ddb8e52ea4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 21:21:02.7296 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kjwxbQbhI0PDsw6+ffdOBdpLYU18MeFRcGKgioIGGJhRTXHJGq79SabhCwa+Q+BL+A5vSHf9KlifwE3cg1ksuGnnU2kseE2wGS9RQrqHk5k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6193
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



On 6/13/2025 8:02 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> There is a sporadic failure to enable CTs ocurring in CI on one
> specific machine that can't be reproduced locally. The driver already
> supports dumping out a whole bunch of GuC related debug info on such a
> failure but only when the verbose GuC debug config option is enabled.
> It would be preferable to not enable all the verbose debug output. So
> just bump the CT_DEAD code to regular I915 debug level rather than GUC
> debug level, at least temporarily for CI.
>
> To prevent excessive spam in other parts of CI, also add a check
> against doing a CT_DEAD dump during an error injection test. No point
> in dumping large amounts of 'why did this fail' info when the fail is
> deliberately induced.
>
> v2: Revert accidentally enabling some other verbose debug output.
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 11 +++++++----
>   drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h |  2 +-
>   2 files changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> index 0d5197c0824a9..380a11c92d632 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> @@ -13,7 +13,7 @@
>   #include "intel_guc_ct.h"
>   #include "intel_guc_print.h"
>   
> -#if IS_ENABLED(CONFIG_DRM_I915_DEBUG_GUC)
> +#if IS_ENABLED(CONFIG_DRM_I915_DEBUG)
>   enum {
>   	CT_DEAD_ALIVE = 0,
>   	CT_DEAD_SETUP,
> @@ -144,7 +144,7 @@ void intel_guc_ct_init_early(struct intel_guc_ct *ct)
>   	spin_lock_init(&ct->requests.lock);
>   	INIT_LIST_HEAD(&ct->requests.pending);
>   	INIT_LIST_HEAD(&ct->requests.incoming);
> -#if IS_ENABLED(CONFIG_DRM_I915_DEBUG_GUC)
> +#if IS_ENABLED(CONFIG_DRM_I915_DEBUG)
>   	INIT_WORK(&ct->dead_ct_worker, ct_dead_ct_worker_func);
>   #endif
>   	INIT_WORK(&ct->requests.worker, ct_incoming_request_worker_func);
> @@ -373,7 +373,7 @@ int intel_guc_ct_enable(struct intel_guc_ct *ct)
>   
>   	ct->enabled = true;
>   	ct->stall_time = KTIME_MAX;
> -#if IS_ENABLED(CONFIG_DRM_I915_DEBUG_GUC)
> +#if IS_ENABLED(CONFIG_DRM_I915_DEBUG)
>   	ct->dead_ct_reported = false;
>   	ct->dead_ct_reason = CT_DEAD_ALIVE;
>   #endif
> @@ -1377,7 +1377,7 @@ void intel_guc_ct_print_info(struct intel_guc_ct *ct,
>   		   ct->ctbs.recv.desc->tail);
>   }
>   
> -#if IS_ENABLED(CONFIG_DRM_I915_DEBUG_GUC)
> +#if IS_ENABLED(CONFIG_DRM_I915_DEBUG)
>   static void ct_dead_ct_worker_func(struct work_struct *w)
>   {
>   	struct intel_guc_ct *ct = container_of(w, struct intel_guc_ct, dead_ct_worker);
> @@ -1386,6 +1386,9 @@ static void ct_dead_ct_worker_func(struct work_struct *w)
>   	if (ct->dead_ct_reported)
>   		return;
>   
> +	if (i915_error_injected())
> +		return;
> +
>   	ct->dead_ct_reported = true;
>   
>   	guc_info(guc, "CTB is dead - reason=0x%X\n", ct->dead_ct_reason);
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
> index 2c4bb9a941be6..e9a6ec4e6d387 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
> @@ -97,7 +97,7 @@ struct intel_guc_ct {
>   	/** @stall_time: time of first time a CTB submission is stalled */
>   	ktime_t stall_time;
>   
> -#if IS_ENABLED(CONFIG_DRM_I915_DEBUG_GUC)
> +#if IS_ENABLED(CONFIG_DRM_I915_DEBUG)
>   	int dead_ct_reason;
>   	bool dead_ct_reported;
>   	struct work_struct dead_ct_worker;


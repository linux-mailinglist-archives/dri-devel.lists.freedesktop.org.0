Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62366C52724
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 14:23:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC63410E728;
	Wed, 12 Nov 2025 13:23:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iQdAO4vG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A99E10E090;
 Wed, 12 Nov 2025 13:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762953809; x=1794489809;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=WBEKYlMAQGvsh/y3JIRm7/zvyagzI7/ParR/ccg+/NQ=;
 b=iQdAO4vGCCRdpwbBpOJsMh0E8XkuorLFAmBUHOFQ9jR7O13J6mdudH+L
 di7Ax6k483Ra1tZR4qvkbHb9MzSvZQzsDdYoPpDbZVOrFqOT3gdsZMLdm
 YNP8bKHe8YOV/BOCjwAIofBcnHqLJDWgpcCaDb9f+Xv7tzGdaNX9xM+UU
 C+k2gWfzK/hMzzlTQMq3UVzPGpe59Z1fUSBi8S77l8xO+G3GKuajxfpny
 0CM1Jz4vZN0k1cgJdL4VjkB2aM26aFl6hqoFPSZwUHaRErBOvB62cMziW
 hxUPGNxEU3eYRy0jD6Yp9cLOhSNelp/YIgpVD4TCzs3Kg1lR+5zdHgy0z Q==;
X-CSE-ConnectionGUID: oMvdh72jRCKh6o6aj66aMA==
X-CSE-MsgGUID: r5ZRehSlRGG+GOlWc8+FPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="87656304"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="87656304"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 05:23:29 -0800
X-CSE-ConnectionGUID: sz0ThVD1ShmJ3A9TPVIJZg==
X-CSE-MsgGUID: zAGE3FTpQkCOLc1C+Ud2qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="194199514"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 05:23:28 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 05:23:27 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 12 Nov 2025 05:23:27 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.55) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 05:23:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x+9A1MT5faUmeNvL1JnvamLusrj7ir6fcLIjUIjIwkD0ece4U/gNce+dc1qV9lMXS7l7WZ673mKyN4S/2AY4ifTuat+YVs0Yoxs8z8Hb6pwvNaOTpQslN2WBrKn6Ch0LY0bUtcOGHiUte6Et832gTrqBHcjobsr9p22v/9BaMBJhCzUVcnLRchBfdTPcrkgSLdZbOVlpr2QCzbgz17NF6bm4Scf2SJvQkH1djxebjG7BnAcUQJg4GmCR93pYZWU4RRYFn9sS1WBO13o/N6jUNfRawo+2xLTRyvlDCWJ8VHB83OLKtYbMdJDL+k4XiVktlZ75xOY/EobCMjT5k+kyfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uh1eRq3oGbIbMY7TV2ti1Al+hy6OHk5mjO16eiLN3Ks=;
 b=q0qOEF6+e3SRunj74u5qQfSitNlUsnkRJD+j1haJnZzkWJOUL9Qf96PARM15y4Z4zX/4ybn/euiww8kg/GNQ46W2WqBAsmihAGGZgkSmmtGalneKYVp27ptDEwCavrJm4RcChBX+kC17E/Hm2CCPRqfe28kPvMZEKuEEgkOor2m6kkdpLdwQP5pFEorA38b3tuSM6azWpd8F0p2MqpBDaY4N8HI5IlGpK4mk0SGm01KvQhaalc8zxRBKDFGjATL7gxHBbocVXud1gXVMZjGlnC+yIZ1bnnN63KbgO065vfyRbVgMbaWOuJEM7bQSYHeyL5Y6uL5nGg5oQXINcmR4RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH7PR11MB6929.namprd11.prod.outlook.com (2603:10b6:510:204::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.16; Wed, 12 Nov 2025 13:23:24 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 13:23:24 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>,
 Matthew Brost <matthew.brost@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH 08/24] drm/xe/pf: Add minimalistic migration descriptor
Date: Wed, 12 Nov 2025 14:22:04 +0100
Message-ID: <20251112132220.516975-9-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251112132220.516975-1-michal.winiarski@intel.com>
References: <20251112132220.516975-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0018.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::13) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH7PR11MB6929:EE_
X-MS-Office365-Filtering-Correlation-Id: a301e0d9-92b7-4897-d916-08de21eea850
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UHNIUkJickRJeSs5K3EyN3FpU0hvMytEd3d2eGd4UzBEMk1ZQ3ZpZzFXRXhZ?=
 =?utf-8?B?WE9OcG81Y2Q0U1NCdUtlSTlJTHFvSktHV1VIVE8rekNOSVhGK2FSZXBiUnhZ?=
 =?utf-8?B?MjhGSCtzS1FrMFRncHNtZWRvSEpVbkJFVW10cEtRU2VOMXpIN3M2ZVpWQnY4?=
 =?utf-8?B?MG0xTkp5b1NSWERRaWE2MTRvMlVqYllSOEVwajdhSElxQUwrQkk2bFo5YlBN?=
 =?utf-8?B?S204NGtoVEEvMnpyODVpQ0g1V201WUtOdk1paWNaMWxOV0tacXR1dVUxQkNU?=
 =?utf-8?B?clpheXJsMjlINXVXM1hMSUtiOU9zSXBqVVhkYVI1WHhpNk9rRDRDSWtRbEFx?=
 =?utf-8?B?cjV5ZHRid1hmN1RRcjhiL3JTTE9qK3d2ODBaaTI1ZmZjcFZmOUdHV0I4WGdk?=
 =?utf-8?B?SVM2MUppblVDM0xSZ05wWitaeHJUVGJaSnc3UThjcVdTQ0hsZnRJNEI1WEVn?=
 =?utf-8?B?aFdhNkJtbzZYbllQazYyNkNEck05b0hWNWQybjJNV1ladUdHbmlqY3ZpYlFK?=
 =?utf-8?B?WFAya1h4SndYREdoSHRpSVZ3NnkzL25oZi9PUEFPQXRCbjFiSE5pK0JsOFNq?=
 =?utf-8?B?K2tGNVZ0VFV0NGZHRWRIclN2YllTRWNxZE1xMTQ5VXRDYlg5bUdTRTArQ3R2?=
 =?utf-8?B?WFllUnRPSS9YQlVUcGsyRDg5TENYOHdERjhtTllqcEFWUGxQZDNib2ZieDFU?=
 =?utf-8?B?bUdhSnJnemtSS0Y2LzkxQkg1OUFVSnJQYTJCZng1SmFod1JDUFZjRGVveS8x?=
 =?utf-8?B?d2JTZUptQ3J2MW5hUzh6Q3NoRVBoNEd0TWtONFBzVE8xZGRYZVZUMHN2bTUw?=
 =?utf-8?B?RzFHMGRVempoeTFZRzE1MUxVeHpKU3ZJY2pVeUg3U0lTZkZvMHZqTDIyVUY0?=
 =?utf-8?B?QkhKRXZwdFZmcVJYWkRPWXQxUVBld2R4WlV6MUI5T0F0Wm4vSU0wTGtjVmc4?=
 =?utf-8?B?WENna0pyYU81d2Nsb01zTHVJN2RRSVhzQ2wyM3Q0UGpJU0VCU3k2cUJYdFFZ?=
 =?utf-8?B?eWpMbXhRT2ZndmE0Q3JQSjhvczhUdkpBSHpoRXpZdE1nSVRaOTZUSEZZVDZP?=
 =?utf-8?B?VE5ZT0UrcU0waW1TN3EyMUF0cStnOGQraGVTc0R6QUpxQko3SksyZytnLzFa?=
 =?utf-8?B?UVpCem1RU3kwc1BZWmI2ZkZMMEUrQ0ovN1BWaFFXOUppTjdBbHJYekhDWHg3?=
 =?utf-8?B?WnBhWDI5ZTdIYXZOd2ZaRGp5ZEtsZGtwbkt2MGQ4bnhYdHRaaHpicXJJNUhE?=
 =?utf-8?B?WXRZNmZ4aGsvbWdZSm9lemZKK2NZQThFYUc4NmhGbFhoZ0xEUXM4S3hRd3Vu?=
 =?utf-8?B?WjNrdDdZcVFuKzB2T1B2SDliQ0N2MTJNT0NNRERiMENiR1BWWUIvVFNFV1kz?=
 =?utf-8?B?VFRtcFl5b0RlaFBqUURIclliREJBUGRMZDg2cStzeDgwVEd1cjZUdHZjVXZk?=
 =?utf-8?B?VHpqTDg2WDZ2V1FlQitsWUFYazRscy9CMmpLMEN2VTcwRWFJdVFWNjhIYURr?=
 =?utf-8?B?RmRRY3RBT0VTa0lXRzMrMXVkTzBWNy93YXRLMTFwSGNGd2t4UnN5b0tmTFFn?=
 =?utf-8?B?cmNNYzhGbE9RaGlGOU9OcEo3T3dLSlpDb2hSS1QxTzZGTmhQOWplakZTVjhB?=
 =?utf-8?B?S0JLSDBuY0Q3bFdCY2Ixdk5NYklTRnpGcTdvSUxXdHpQTGx6bzZCR08wa1py?=
 =?utf-8?B?VXEzRkloNng5SUNQekZ4bkVOUk0rd2t4Rmx3OWl2OFRQWWp2c3hXSkVqd3Rx?=
 =?utf-8?B?RmxrT1FYZjA0RnhqTEpnenZSU1VRK3ZIUnJGWTNhNW5NbWdwZTFQaEFUWFls?=
 =?utf-8?B?MFgyZGFLcE1Oc1g3TXFxUGEzdGpuVEFaT0o3WndYb3R1Z1MrYTFBSVplaHZH?=
 =?utf-8?B?T2o5R2toYzRsaHR0czhwWUxKdUVGSFBsazFjVjg3Z1lJU0xwZEx1a2lqWWlZ?=
 =?utf-8?Q?JKtif1xySyYf1Kfavy3Wtfkebz/DGxYa?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWIwUG0zLzh6dXhkaFpoa3RiclhQNkdCV0NpUXVCYWlZR2xFWEJBa3J1TWNU?=
 =?utf-8?B?WE1XSlo1TlFzZlRMdndFa1p5bzhkbTBEVCtlUmluUXk1MlBVUlVhQmhVVnY4?=
 =?utf-8?B?QUpsTWdSL2RRTEdlQVoxdkQvN2RUSWttNklEWWlRUDB1OW1zQTZGelloODdW?=
 =?utf-8?B?MUpJYUZKNWlWYndHWFhVdXNuNlYreCtYRjJGK2xzajBaN0pla2hqQjNublF0?=
 =?utf-8?B?STU5elFTQUtGNDREcjU2YmkyQVU0VWFudFl3U015cmxFMXZwNTl2WmJycVJ1?=
 =?utf-8?B?Mzc2U0JwajFzSkprVHJ2a2RBN2hlZktKWTZpY1ZUbEx3cjEvLzZFK014MTNK?=
 =?utf-8?B?V0NaUldaK1d6eFFRUC9zWjA4eWg5SWdDaDlPd0MrYXo0RUdCUkJBNUtSWGVo?=
 =?utf-8?B?RXU0eFVxV3FMRUJEZ2hCRVMzUnlJajJDN1Qzdit6RHdtNlhTWWlzM2JCY0Qw?=
 =?utf-8?B?b3JmNU01TmtFcWVxVkl5OVhlQnRlSzlyK0ZveUt0dlJDOFh1MG5zNjlkek1H?=
 =?utf-8?B?TXlSbmJiMi9KTTU2N3JWTEl4WGNPODEvd3liaElpWGRIeTliWEtkTWdDWVp6?=
 =?utf-8?B?V0liMGtyWlI2ZUVZbkF1bzRtU3hEdTBiRVU3KzBDRGVpdWFmWlBRWHlvRkh6?=
 =?utf-8?B?SzFkSGNiT1BPd1BlYmNWS0lxMXhIZm5KeGZyUk05dmVKZkJFRVd1N0NQaWxT?=
 =?utf-8?B?WXhTVlpKU0FFY0NaTkUrc2JraEJwb0FmZTdYY1hiQTgwNUxMTE9ucU9Hcndw?=
 =?utf-8?B?NTdIUlczUWJKZHVobDljcndsSWtYOXpnZDUwMVdCSFRva3dEK2FkR1dibXB0?=
 =?utf-8?B?Mml3QzlXMTByVWUvcEpod0huTGRONkVSYWFXQW01RkF0TTg4UTkrV1ZUSysr?=
 =?utf-8?B?U0pIQUUrSHlkZ3R6aG0vdzVDSkZpeEl4ckNQOXRsZk9MT1JTSi9FN2RreEYx?=
 =?utf-8?B?RzgyZTRua1Z6KzZORE5JRWcxZ29yQXZLU1IwcENlM1NDa21tSUhUV3NyZnFQ?=
 =?utf-8?B?WjhZeE50S3F4YmF2bm9OVnVGMVd2Z011UzBmcmtpbnRpL210OFdiMms4QlUw?=
 =?utf-8?B?Z2R4Skh0MFJqT1lsWkFkVUw1SGtWQVpiLzVpNStZR1NXVVE4MVF5L2dIYVoy?=
 =?utf-8?B?YlVUNDJabTh5VmY4Uzl5S2VpS1Q1Mjl1NzJyZ0prMVpKQU1qand0dG5relhu?=
 =?utf-8?B?U1BSbi93eCtETFp6T0loVzhxMHFpRktkWmdIMWdKVDNJempwS29wbDNHdkhS?=
 =?utf-8?B?cCt1ZXZhWnB0eGhqSUFDVU01a2JnTVltclJET1B1OXAxcllzOHVwdE1MdWlM?=
 =?utf-8?B?YkRwb1hGTVYxQVdkSE9nRTRZcEhyUzNYZG9oMUZIaU1Mc3FIeFVnQ05pSS94?=
 =?utf-8?B?Qkd5OWxibTY0NlRPTFN4aVBrbmVBS25wMGpEYlUvWU12UHVNaEpmRmd1WHl5?=
 =?utf-8?B?c0doRjlHakc4Q1ZJNnNNeVB5KzNoQjM4aENjV2VkSHZ2L1ZrS0h6WGxpOFQr?=
 =?utf-8?B?UDg0SG9zMmdrRFhxK2NwbjB1OWd1VW16U0NKMEhpQ2VwWm9CeTBUNG0zekJt?=
 =?utf-8?B?WU5uTm1DcW9sTGxVRms0bWErL3lHdUZOVE5lMm9JaWlSNXBkbktQMG53U2Rn?=
 =?utf-8?B?R3FLR09BT2NOS0dIRmpkM1AvTDgrVVRDc3V2UTFhWjJHalVDQ0kzQjRSMXd3?=
 =?utf-8?B?TktFeFJpV0ZKMVdONmtBOFlnOENNK3Rmb1haTWdFM0NFNFZIZnpjMXdQTTgy?=
 =?utf-8?B?T1liUHBoWlQ0ajNkVkZzMUtzQXVDZXNuTWdUVlh4UTUrbS9qMnp2aHdNVEZq?=
 =?utf-8?B?cnZJWVNlL2VuZmhVczMxenljNzFYUEl4YzhQaVZ4cUFDMUJoTXFCaGtsWndM?=
 =?utf-8?B?dTVTZlA2b2UwT0xvenlSakY4d3dYVmhlVlZaUGZxT3ErRlFaV2dHajFuUE1Z?=
 =?utf-8?B?M0NkOUt6Snl4T2NhVHcxRnJrdUdlcHh6VEwzVEZTS241eUxDUzcyMzVCZ3BU?=
 =?utf-8?B?b3JKS1NuR2hEbkZXd05GTSt0VUtlZ2YvaGNJVklhM3pXZk9kS3Vqci9zaVE5?=
 =?utf-8?B?V1d2Z1NETzQ4NkdieWlTL0xXTnhuSjBHOUpUWFM2dkJwNkZVSHBHOFNiNUNy?=
 =?utf-8?B?TG9NZEZsRHhXeStIS1NreGFsanFuQWxpd2xNdTZHU2pDTmNobWllVkY1cjdU?=
 =?utf-8?B?bEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a301e0d9-92b7-4897-d916-08de21eea850
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 13:23:24.4274 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lUBbyofk0hpNniC0dAX4oWEpHzLXv+S3a5jP7lj3HCYotZFEByjpMWCzyhzYe4usgi0nz/LZsDliH8PYEBoPB5FQoIee+/ADiy6Zw6SXlso=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6929
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

The descriptor reuses the KLV format used by GuC and contains metadata
that can be used to quickly fail migration when source is incompatible
with destination.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_sriov_packet.c       | 92 +++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_sriov_packet.h       |  2 +
 drivers/gpu/drm/xe/xe_sriov_pf_migration.c |  6 ++
 3 files changed, 99 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_sriov_packet.c b/drivers/gpu/drm/xe/xe_sriov_packet.c
index c612f37e9707c..bab9946968964 100644
--- a/drivers/gpu/drm/xe/xe_sriov_packet.c
+++ b/drivers/gpu/drm/xe/xe_sriov_packet.c
@@ -5,6 +5,7 @@
 
 #include "xe_bo.h"
 #include "xe_device.h"
+#include "xe_guc_klv_helpers.h"
 #include "xe_printk.h"
 #include "xe_sriov_packet.h"
 #include "xe_sriov_packet_types.h"
@@ -350,11 +351,19 @@ ssize_t xe_sriov_packet_write_single(struct xe_device *xe, unsigned int vfid,
 	return copied;
 }
 
-#define MIGRATION_DESCRIPTOR_DWORDS 0
+#define MIGRATION_KLV_DEVICE_DEVID_KEY	0xf001u
+#define MIGRATION_KLV_DEVICE_DEVID_LEN	1u
+#define MIGRATION_KLV_DEVICE_REVID_KEY	0xf002u
+#define MIGRATION_KLV_DEVICE_REVID_LEN	1u
+
+#define MIGRATION_DESCRIPTOR_DWORDS	(GUC_KLV_LEN_MIN + MIGRATION_KLV_DEVICE_DEVID_LEN + \
+					 GUC_KLV_LEN_MIN + MIGRATION_KLV_DEVICE_REVID_LEN)
 static size_t pf_descriptor_init(struct xe_device *xe, unsigned int vfid)
 {
 	struct xe_sriov_packet **desc = pf_pick_descriptor(xe, vfid);
 	struct xe_sriov_packet *data;
+	unsigned int len = 0;
+	u32 *klvs;
 	int ret;
 
 	data = xe_sriov_packet_alloc(xe);
@@ -368,11 +377,92 @@ static size_t pf_descriptor_init(struct xe_device *xe, unsigned int vfid)
 		return ret;
 	}
 
+	klvs = data->vaddr;
+	klvs[len++] = PREP_GUC_KLV_CONST(MIGRATION_KLV_DEVICE_DEVID_KEY,
+					 MIGRATION_KLV_DEVICE_DEVID_LEN);
+	klvs[len++] = xe->info.devid;
+	klvs[len++] = PREP_GUC_KLV_CONST(MIGRATION_KLV_DEVICE_REVID_KEY,
+					 MIGRATION_KLV_DEVICE_REVID_LEN);
+	klvs[len++] = xe->info.revid;
+
+	xe_assert(xe, len == MIGRATION_DESCRIPTOR_DWORDS);
+
 	*desc = data;
 
 	return 0;
 }
 
+/**
+ * xe_sriov_packet_process_descriptor() - Process migration data descriptor packet.
+ * @xe: the &xe_device
+ * @vfid: the VF identifier
+ * @data: the &xe_sriov_packet containing the descriptor
+ *
+ * The descriptor uses the same KLV format as GuC, and contains metadata used for
+ * checking migration data compatibility.
+ *
+ * Return: 0 on success, -errno on failure.
+ */
+int xe_sriov_packet_process_descriptor(struct xe_device *xe, unsigned int vfid,
+				       struct xe_sriov_packet *data)
+{
+	u32 num_dwords = data->hdr.size / sizeof(u32);
+	u32 *klvs = data->vaddr;
+
+	xe_assert(xe, data->hdr.type == XE_SRIOV_PACKET_TYPE_DESCRIPTOR);
+
+	if (data->hdr.size % sizeof(u32)) {
+		xe_sriov_warn(xe, "Aborting migration, descriptor not in KLV format (size=%llu)\n",
+			      data->hdr.size);
+		return -EINVAL;
+	}
+
+	while (num_dwords >= GUC_KLV_LEN_MIN) {
+		u32 key = FIELD_GET(GUC_KLV_0_KEY, klvs[0]);
+		u32 len = FIELD_GET(GUC_KLV_0_LEN, klvs[0]);
+
+		klvs += GUC_KLV_LEN_MIN;
+		num_dwords -= GUC_KLV_LEN_MIN;
+
+		if (len > num_dwords) {
+			xe_sriov_warn(xe, "Aborting migration, truncated KLV %#x, len %u\n",
+				      key, len);
+			return -EINVAL;
+		}
+
+		switch (key) {
+		case MIGRATION_KLV_DEVICE_DEVID_KEY:
+			if (*klvs != xe->info.devid) {
+				xe_sriov_warn(xe,
+					      "Aborting migration, devid mismatch %#06x!=%#06x\n",
+					      *klvs, xe->info.devid);
+				return -ENODEV;
+			}
+			break;
+		case MIGRATION_KLV_DEVICE_REVID_KEY:
+			if (*klvs != xe->info.revid) {
+				xe_sriov_warn(xe,
+					      "Aborting migration, revid mismatch %#06x!=%#06x\n",
+					      *klvs, xe->info.revid);
+				return -ENODEV;
+			}
+			break;
+		default:
+			xe_sriov_dbg(xe,
+				     "Skipping unknown migration KLV %#x, len=%u\n",
+				     key, len);
+			print_hex_dump_bytes("desc: ", DUMP_PREFIX_OFFSET, klvs,
+					     min(SZ_64, len * sizeof(u32)));
+			break;
+		}
+
+		klvs += len;
+		num_dwords -= len;
+	}
+
+	return 0;
+}
+
 static void pf_pending_init(struct xe_device *xe, unsigned int vfid)
 {
 	struct xe_sriov_packet **data = pf_pick_pending(xe, vfid);
diff --git a/drivers/gpu/drm/xe/xe_sriov_packet.h b/drivers/gpu/drm/xe/xe_sriov_packet.h
index fd8da5069b53f..2731e52cf7efd 100644
--- a/drivers/gpu/drm/xe/xe_sriov_packet.h
+++ b/drivers/gpu/drm/xe/xe_sriov_packet.h
@@ -24,5 +24,7 @@ ssize_t xe_sriov_packet_read_single(struct xe_device *xe, unsigned int vfid,
 ssize_t xe_sriov_packet_write_single(struct xe_device *xe, unsigned int vfid,
 				     const char __user *buf, size_t len);
 int xe_sriov_packet_save_init(struct xe_device *xe, unsigned int vfid);
+int xe_sriov_packet_process_descriptor(struct xe_device *xe, unsigned int vfid,
+				       struct xe_sriov_packet *data);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
index c13205ee1acd6..bbaf0caed0572 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
@@ -177,9 +177,15 @@ xe_sriov_pf_migration_save_consume(struct xe_device *xe, unsigned int vfid)
 static int pf_handle_descriptor(struct xe_device *xe, unsigned int vfid,
 				struct xe_sriov_packet *data)
 {
+	int ret;
+
 	if (data->hdr.tile_id != 0 || data->hdr.gt_id != 0)
 		return -EINVAL;
 
+	ret = xe_sriov_packet_process_descriptor(xe, vfid, data);
+	if (ret)
+		return ret;
+
 	xe_sriov_packet_free(data);
 
 	return 0;
-- 
2.51.2


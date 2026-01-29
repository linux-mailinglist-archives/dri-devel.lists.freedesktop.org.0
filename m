Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QEF2HIile2lWHgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 19:23:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6B1B3877
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 19:23:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D842D10E012;
	Thu, 29 Jan 2026 18:23:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mo9aUkBK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B056D10E2C8;
 Thu, 29 Jan 2026 18:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769710980; x=1801246980;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=BYi6lY9C0sH0ntXOcPuQCIhl6GLDPsQeK0Q2qcE1vGM=;
 b=Mo9aUkBKu1xph5/3SEC0piOA3rV28ZO4aYybBWrgrhdfxNr/iqqtTNll
 mYaw0vo0+NA6LPtleQEuoLMxUR87eVryuxQB3n0markYWZ33WJuLp499G
 57Vy8vn6b8CczWFnSOIa11a8+aMJhLor1/3hD3vTJm4qJFRzDVITGmgu4
 Z8zhwzW0xXHv5KkfjAE4RVSMh/F5ny4EI40F9YjPwdyu/h40RWVd8yf37
 HGde7AZVfgB/k7SSGNWuBoc7/2fmY7hi3FHtu2OtVmRw1pkecKl1nlmZu
 lj+vGXG9I1Qok1I2a6YhpcilfvtWtsjx1JEPa8opo/Vno3k0j0mjB182y A==;
X-CSE-ConnectionGUID: V6CtYcAFToeFS6jvztJGvw==
X-CSE-MsgGUID: m/tGibB9R6+kxahQu5kwfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="69974170"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="69974170"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 10:22:57 -0800
X-CSE-ConnectionGUID: xj00rmlDQQ+zgGz2F9jwHw==
X-CSE-MsgGUID: +F93lkzuSv27Vvth0SMaog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="213598126"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 10:22:55 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 10:22:54 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 29 Jan 2026 10:22:54 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.54) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 10:22:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IIlFF28FDEiJFiCAlSBNM/ix7+8yXVk9gcuthNFZ3KLAUyFWRO/v83ITXRjVWfco4G17CQATe9N7SPYxdm0QJDJ+oBbwsHXWl5v3oqcAA6gl2XJCvbKP2SLBh2ZYJdlAAsLi93hfrFe73p1GrZAC/Ys7Q9QdH8XxCRnfJAhY54Hd8+W5oQ46PWXPoOR6I2qO1DJ++07BiPSV5vrvBJ1IZS8BoLIrqLlhJbKieem8kLKrUcEQbI7gPf9YLOgp/cYgI2WikpuO9PAMQquBjL4x410zBeOPS6N9397yQtRrUGcmIkFUg4JOH4Sy1uMiJIShfWpdbYxPZ9b5jwdumK25/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cjk8taNE8BsjuAi7vHJFgdCHASwzjfff0AFrI+yHjOg=;
 b=cAxPxC3ICxwTcPecZxU0xAyok/xuqHPveCfwzKuiD5S9byC9glp2aydoOWHEETAs0cbZGrTS1yPmxSAR1sHGTHxvNNNVfozLgLcmsJrk7zLZt/WmkdKZFEr//N2x/slWIQfEXjQQsZOFWTI9N+fGkPdFgO2HPZaLtpMMJojXZX24RS/2tXTeVsoLjwXjckIvdEoT30NhOABgm2qmoZIVG5ESmdkeomOdz8EtLp6zUnjfAUs12Nhsxa/HSEhiTWnXSk9W/Kc9F5kbJfCPbFxsZE1LkSh7Zzmt5cngcuy7BzrcD2WDmTlwvROEF6qcNrVKyHhxSRO+UrtdFJy8ZxC0ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB7894.namprd11.prod.outlook.com (2603:10b6:610:12c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Thu, 29 Jan
 2026 18:22:50 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9542.010; Thu, 29 Jan 2026
 18:22:50 +0000
Date: Thu, 29 Jan 2026 10:22:47 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
CC: Jason Gunthorpe <jgg@ziepe.ca>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <francois.dugast@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <himal.prasad.ghimiray@intel.com>
Subject: Re: [RFC PATCH v3 04/11] drm/pagemap: Use dma-map IOVA alloc, link,
 and sync API for DRM pagemap
Message-ID: <aXuld/QOR9gh4fjg@lstrano-desk.jf.intel.com>
References: <20260128004841.2436896-1-matthew.brost@intel.com>
 <20260128004841.2436896-5-matthew.brost@intel.com>
 <20260128142853.GH40916@unreal>
 <aXpLhN08jVbltQC0@lstrano-desk.jf.intel.com>
 <20260128175531.GR1641016@ziepe.ca>
 <aXpjk5sAgOzE3OcR@lstrano-desk.jf.intel.com>
 <20260128194540.GA10992@unreal>
 <aXp58fqfeeDD6YI+@lstrano-desk.jf.intel.com>
 <20260129101427.GE10992@unreal>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260129101427.GE10992@unreal>
X-ClientProxiedBy: MW4PR03CA0318.namprd03.prod.outlook.com
 (2603:10b6:303:dd::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB7894:EE_
X-MS-Office365-Filtering-Correlation-Id: f9e8516c-e818-4f98-763e-08de5f6368d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VDM5a0pNU2k0RzcrKytsWGNFMmwvMDZNcUorbUkzWmFPbzdaZnlYS1lhaXRW?=
 =?utf-8?B?V09ST3pWem4xU3I5QTlFWW5EM3V0UjJEeGJXdWVxVUpBWW10MHJHc0hkMHB0?=
 =?utf-8?B?SktNWUdFbFdnTUkvM0xRV0FTczRyOVNpbzUvNjgvV1hYQkVXVHlzUWEzZXFx?=
 =?utf-8?B?aDgyMUFkT3B6NEhOMHVzR1plWUdJdE8wN2F1SExTMUp1TExwT0Q0V3RLTTVz?=
 =?utf-8?B?ejJDK25NdkVGeTNiSmltbmtuSFpvSDBFcmJ5Z200TTNlNytINVM5cWMxQ3lM?=
 =?utf-8?B?R1ZCcVZSS1UvWFU0b1BXeGVuMHYveHRzM20xcTNXYzVlNld5NW5odzhnWTFS?=
 =?utf-8?B?UGtjWnEvV2F2TWpoMVJUZFVyU0Ztb0doTTZTKzN5QlZjdG9zUDBobjErbDho?=
 =?utf-8?B?NWtQdnpMQlpSa0FRcnZ3U1JtUGxmQy9ZNDhXdWw2b0xZbFZ3NHUyaXBDRFd6?=
 =?utf-8?B?SmZjL0FRUjdmUzQxeFlHSGFtRzdmRmJNNU1YU1ZvdklLSnAwVW1DTC9WV0hw?=
 =?utf-8?B?STZKUXo5dHN6QUx5SnI5aU5lNzUvVFdlcmRteFNKVWVLMGtNb0kyNnc0cVZH?=
 =?utf-8?B?TXZKOGJrQUJRQ0N0UmhZU0NWM2RueXRsWHc1bmFUeWdENit3VmQ3WW5kU3BW?=
 =?utf-8?B?cEZwQUd3YWI0SmtmK0Y2ZHl3Vm1yaUhSZ0JBaTlBNjZWZ2ZWYXJIb3JQd1pP?=
 =?utf-8?B?VzNoZ0x1RkgyQ0Vndi85RnJEVU9xbC9LTDB1cjcxYkViRUd6a09LNFkvbkVp?=
 =?utf-8?B?aWtGV0dCZFc0TDlqUllUWXRYZTFQTW9ISUFDYi9HU2RHemZla1Awb3BYVHU1?=
 =?utf-8?B?Mk81OGpGSTlNbWc1cG05bFRtOEpxaGFDcTZOZVpHWjBrK1Q1ZE1BOTJkU2lw?=
 =?utf-8?B?WmNkZE8vUWFpTlRqN05MVjE2RkhmRWJaekcyeElmSGZEVVdObVFtTGxNSllM?=
 =?utf-8?B?cWY2U0xKdnBMMWNqY1FXRVZxc0xDdHBvdnB0MkErN05KQzR3OFZvQjVESmpE?=
 =?utf-8?B?K04xUmY1NDlBNlVJbFVSVnMxV3RmTlB4QXNWaEJ1NG0rOFhqUnBrWHFSb1Zy?=
 =?utf-8?B?K1A3RnBhWDdTdm5mTE0wTFhNY1R6ZTQvY2VUSnljOTlFUEtNOThMYmFRODNu?=
 =?utf-8?B?WUxvQU8xMXJwV3lxSVQ0SUZtWEdQN1dHYlE0Zyt4QnlBc0xYNUdvNk12L1Bq?=
 =?utf-8?B?SXpoTWtJeDF6SzkzTDJBNWR2MFF4TUZPSkh4elZmYVB2MzNyL2xNRlkwM0Q3?=
 =?utf-8?B?SzQvMTBpVkdtOTVhL2RJck9NUGwwbXgvOW4wN1RuZWd6MllnSUZGU24rdFJ3?=
 =?utf-8?B?N3I4dXJJMkE1cnY0MFhJd2pyMVFWSHU5V0NWd2hGd29YaVRNajgrUzUza1NM?=
 =?utf-8?B?bGFlbFU2YmVidXZKdW5laXlNSUp0WTV2cExzTGNXQ2xDbnFQUGNvQTVRaTZl?=
 =?utf-8?B?ZmtrMVYxUkNpRUp4dVU4RFFpaEtBUE1jVnpDSk4yc09Zd011d3lJUCtrU1lD?=
 =?utf-8?B?alhsL1lXb3V6ZzV5d2grWjhySjY0ditTb2Y4QU9OOEJvSERuUStWcGNDSS9u?=
 =?utf-8?B?NHpaVmtYVEg0cHYwSEcySUpBdUM2K2pQdXpJeWp1TGhMQjFEa3hPZFM4Sjdy?=
 =?utf-8?B?RFB6U0tZTklwcHBuWG91Rkd3ZjlXT1pTYUtWd0QzaDdnbElOWGVmdldNTCtJ?=
 =?utf-8?B?ekl5M3NEK2kwSjdFNzRtUXYrK0x1cHViSlg0QWliYUNmUEVPOHZJM1hwcVY5?=
 =?utf-8?B?VEg3cUpLNVg5TzZUWGdvRE9LbDRMYllVc3pTTkN6OHo1S0tBMGlVczVDNUw4?=
 =?utf-8?B?NlNtd2lGM2pQSjhEVlI2WFBUK3FETGFuQmZEdktJNjAyeVlPSGcrWkQ1YWhq?=
 =?utf-8?B?U290YmhDUWlSQWUwOXVtYkphSmNBL0dVL3NTZzBzQnc4ZWxzak9wVlFHdG9P?=
 =?utf-8?B?YUIzZnd0YXd0bGluSUJNZGRXUDhSOWpnTTRuTHJJNFh5MFR3Y21xcG1tTVB3?=
 =?utf-8?B?TktwU053R0RQMjM4TFhSa1pldkZ0MkRIVmFZUkJWc2RMTUc0VnZQV1MxUDZY?=
 =?utf-8?Q?Mz1+8k?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VmtCVFNuOTVQalRQK0lId0V5di8wUkZkVSsyZ2M4c3c2czRVQTdQeWNuZHda?=
 =?utf-8?B?cWJSTXNUYU1DVVJLSEErU051QlhUUkc1YXBXWjhHZFo2aTdMSkdMR0RGUXYw?=
 =?utf-8?B?QUYwL0pvT3FWVmlPODZWRHZPTGFuR3VnT0taaVNRN0Y5UUtWc29VUFphNy9y?=
 =?utf-8?B?WWxUdUdINXZjNWdhVDRUbmoyT1VVaTdxUVdJWFlkSVhQcU9NbnM0SWhTRnpJ?=
 =?utf-8?B?VHdQTkxxWitBTytsbnBlbktrdlNtRTdtZ0xBYWh1MDZhcWtKK0U2VU9uYVVL?=
 =?utf-8?B?aWlwaWtvSk5BKzlZUkJSUTkrZG1XazNoVG9yODJJazJITWFlYmtYNjdJNmtF?=
 =?utf-8?B?bDgzZmY0VDF0SFFXS0xBL3hZODJxQmVaTXdUdXNIN3l5K09SRFFiaGliOXpl?=
 =?utf-8?B?T1RhcXNDTlluSEpvQ043eWpLM3pGdHY2QVVMZXdWRnVqZFk3Mmx0bG51Q1hh?=
 =?utf-8?B?YjNQYk9nU1JkZk56N244L21QOUlKaVBFQWFoTXByRjBPN3FqWU1XMFEzZnFE?=
 =?utf-8?B?bVJSWk1mV2wyRytzOE9YenYyL0x0VlhIc3FMdDc4bUVzdktkMEZzZ1BGdFgy?=
 =?utf-8?B?RnBtMjE3ZFU3VzZ0NWtCWGxpVFlkQTVCYjZwRmRhTG1FbWdWdXBreElXS2Iv?=
 =?utf-8?B?Ry9ZYVFZazNCM1c1dnZQa2ZyZTBJZkdJVytLd0hLdnRIaHNCMmcxaUdxWkxY?=
 =?utf-8?B?TFBnazVDeE1iREM1eUR4UmtvQTdRc3NmYVpzcmU2cWw4MW5ObldYZXZraGlR?=
 =?utf-8?B?d0hDN281THg4aFdhL0Z0Y0wvZ01SRk9HcmZjZ2hxVnJmRWdXLzR2VmQ2eUY3?=
 =?utf-8?B?bzVLSmc0MFpIUG94dWJDaFc0K3BSRDlpOFB2d01rY1JPbDMxQlI1YXZmcVNR?=
 =?utf-8?B?eXZuODJIbmtlY3Y4Q21WYzh6WEVoVkhudVZaU0xXLy83d2wwa1ZnYUduamFk?=
 =?utf-8?B?S1BXK0cvVlltL2xUU1RmVnhLeGo4WFNIT3lqZms2YUhvaGtOQTBYV3pRNjVH?=
 =?utf-8?B?TEg0amhUbThIMGxFRmcxRzBEQ0NmcWN1RFp6TzJ6NE1zUzZtd2ZjRFdhcTVT?=
 =?utf-8?B?cHozSEg0QmM0UEJDdDRHeXdxS3VXRENmUENTKytlbUNRU0Z5Ny9QaFNaL3dY?=
 =?utf-8?B?elVFa0NIUXRGMWswTG42SE8yU1R4MGxOT3doeDFUOXNZbmE2RE1HVDU0TCs5?=
 =?utf-8?B?TW9DS2p6bTA1VUlqQUhmdkhUcTd4ZEcrY3hCYm1KazJvN202QUdaN1R1NXpl?=
 =?utf-8?B?TW9rMmpZNXhSZk0vNDFubm5qSk1wV1I3VHFPVzVCa2J1RWhpUEhXYzQ5dVN4?=
 =?utf-8?B?c3ZRSjAwWUZQZXJDamk2bnhmZnRUOG50N3ZuZmQzVkNHc2RrSWNpcjI1c1Zh?=
 =?utf-8?B?eE5ZbHdTZ0RIMGppRldIS3NOVERleHlpZjZOMDdNeEZUdFBtdjVKVi8zVzJQ?=
 =?utf-8?B?cU5UeXRrMHFTYUducTNMbElXdFkrK0lsTlgyT3FJMU0wOE5KVGVydXk4dFpM?=
 =?utf-8?B?c3NxQjNwZHY3bkxET0VnbmI1ZHB3TTdsOGQ1bmFEdDYvdjlUUGZJckNLVFdB?=
 =?utf-8?B?bkhkNkJydGcyWFZBYU5ZUUlFb285RGlweWxDWnZKZ0twSDlJNUV2NmtQT1Mv?=
 =?utf-8?B?cVJRRlVvWnVEMUlTenhYUWs1STdBbWRQbkFpWWNlTm82VDVMMVh0cmYzWHdn?=
 =?utf-8?B?T1N5K09qL2F4T0VLVG13SEE0ZE8zV2N5VS9jYkZrb1ZQZFJ3WTJOS2Jmc3U3?=
 =?utf-8?B?Vk1VRXRyaFJYcm1PYmxSZWdLZDhPRDA3S2tpaFdrZ2JxWE1CeW4wcVRUQkNu?=
 =?utf-8?B?UmF6djBZN2dMS2FXL1RLQlh6NjZBTTRGTkxGTWlDdVd6WGJWSlZsSWVTS3p1?=
 =?utf-8?B?RnU1LzFlck1DL0dRd0s1ZjBLZ0Irbi9CM0NweTBXTlBkdHpkRytzT3l0N0NK?=
 =?utf-8?B?c3owRFdIalpndjdYMnhvc1M3Wll0cVZKL0w4TGplQmRMZzI0UGJDWnR1TFlm?=
 =?utf-8?B?cTJKeEJVSEhXVVhJakNFdDBUTGhSUHlYTkpLaG5WQjVrQU5sWGNMWENVRXNE?=
 =?utf-8?B?RVJHZnlZR1RsRGJGcEg3dUpBWmxBVXFJVGovbmJyajAzb3hDNCtDeTBDWTVw?=
 =?utf-8?B?ZjhjYUM1TnFNY2Q5aDVHMFllWGpyWFhWY0ZMQmJEc1poNWlManBtY0pDVG1B?=
 =?utf-8?B?V1JMNVJ2d3VGQzk5SkRrb0JHVW8yRFM3ZC8ycUpBZkZvREhPU2RydmYyaU41?=
 =?utf-8?B?MWI3L0M5RFRrYjNUSUJpM1h6UXUvakptdFhSSXNHRGdjdXRvZE9aTFBoMmFM?=
 =?utf-8?B?OTdnbUJqaWZxbGlZemdhYXpabWo3UEpma21BR2o3bVR4ZlJhdHpUWGxkaEVy?=
 =?utf-8?Q?7FdZc4449gdPgFOI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f9e8516c-e818-4f98-763e-08de5f6368d0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 18:22:49.9933 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XK3o4e6jjpGLAdyMaQ13lCziOZvEfixBbc1Ok7QaK8naK65oJXNVJZ8oFtNeJZEHZhWp1gKr/b3U+o+YxRmpYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7894
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:dkim,bootlin.com:url];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthew.brost@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: BD6B1B3877
X-Rspamd-Action: no action

On Thu, Jan 29, 2026 at 12:14:27PM +0200, Leon Romanovsky wrote:
> On Wed, Jan 28, 2026 at 01:04:49PM -0800, Matthew Brost wrote:
> > On Wed, Jan 28, 2026 at 09:45:40PM +0200, Leon Romanovsky wrote:
> > > On Wed, Jan 28, 2026 at 11:29:23AM -0800, Matthew Brost wrote:
> > > > On Wed, Jan 28, 2026 at 01:55:31PM -0400, Jason Gunthorpe wrote:
> > > > > On Wed, Jan 28, 2026 at 09:46:44AM -0800, Matthew Brost wrote:
> > > > > 
> > > > > > It is intended to fill holes. The input pages come from the
> > > > > > migrate_vma_* functions, which can return a sparsely populated array of
> > > > > > pages for a region (e.g., it scans a 2M range but only finds several of
> > > > > > the 512 pages eligible for migration). As a result, if (!page) is true
> > > > > > for many entries.
> > > > > 
> > > > > This is migration?? So something is DMA'ing from A -> B - why put
> > > > > holes in the first place? Can you tightly pack the pages in the IOVA?
> > > > > 
> > > > 
> > > > This could probably could be made to work. I think it would be an
> > > > initial pass to figure out the IOVA size then tightly pack.
> > > > 
> > > > Let me look at this. Probably better too as installing dummy pages is a
> > > > non-zero cost as I assume dma_iova_link is a radix tree walk.
> > > > 
> > > > > If there is no iommu then the addresses are scattered all over anyhow
> > > > > so it can't be relying on some dma_addr_t relationship?
> > > > 
> > > > Scattered dma-addresses is already handled in the copy code, likewise
> > > > holes so non-issue.
> > > > 
> > > > > 
> > > > > You don't have to fully populate the allocated iova, you can link from
> > > > > A-B and then unlink from A-B even if B is less than the total size
> > > > > requested.
> > > > > 
> > > > > The hmm users have the holes because hmm is dynamically
> > > > > adding/removing pages as it runs and it can't do anything to pack the
> > > > > mapping.
> > > > > 
> > > > > > > IOVA space? If so, what necessitates those holes? You can have less mapped
> > > > > > > than IOVA and dma_iova_*() API can handle it.
> > > > > > 
> > > > > > I was actually going to ask you about this, so I’m glad you brought it
> > > > > > up here. Again, this is a hack to avoid holes — the holes are never
> > > > > > touched by our copy function, but rather skipped, so we just jam in a
> > > > > > dummy address so the entire IOVA range has valid IOMMU pages.
> > > > > 
> > > > > I would say what you are doing is trying to optimize unmap by
> > > > 
> > > > Yes and make the code simplish.
> > > > 
> > > > > unmapping everything in one shot instead of just the mapped areas, and
> > > > > the WARN_ON is telling you that it isn't allowed to unmap across a
> > > > > hole.
> > > > > 
> > > > > > at the moment I’m not sure whether this warning affects actual
> > > > > > functionality or if we could just delete it. 
> > > > > 
> > > > > It means the iommu page table stopped unmapping when it hit a hole and
> > > > > there is a bunch of left over maps in the page table that shouldn't be
> > > > > there. So yes, it is serious and cannot be deleted.
> > > > >
> > > > 
> > > > Cool, this explains the warning.
> > > >  
> > > > > This is a possible option to teach things to detect the holes and
> > > > > ignore them..
> > > > 
> > > > Another option — and IMO probably the best one — as it makes potential
> > > > usages with holes the simplest at the driver level. Let me look at this
> > > > too.
> > > 
> > > It would be ideal if we could code a more general solution. In HMM we
> > > release pages one by one, and it would be preferable to have a single-shot
> > > unmap routine instead. In similar to NVMe which release all IOVA space
> > > with one call to dma_iova_destroy().
> > > 
> > > HMM chain:
> > > 
> > > ib_umem_odp_unmap_dma_pages()
> > >  -> for (...)
> > >    -> hmm_dma_unmap_pfn()
> > > 
> > > After giving more thought to my earlier suggestion to use
> > > hmm_pfn_to_phys(), I began to wonder why did not you use the
> > > hmm_dma_*() API instead?
> > > 
> > 
> > That is ill-suited for high-speed fabrics, but so is our existing
> > implementation — we’re just in slightly better shape (?). It also seems
> > ill-suited [1][2][3] for variable page sizes (which are possible with
> > our API), as well as the way we currently program device PTEs in our
> > driver. We also receive PFNs from the migrate_vma_* layer, which must
> > also be mapped.
> > 
> > I also believe the hmm_dma_* code predates the DRM code being merged, or
> > was merged around the same time.
> > 
> > We could work to unify the HMM helpers and make them usable, but that
> > won’t happen overnight. The HMM layer needs quite a bit of work to
> > useable, and then we’d have to propagate everything upward through
> > DRM/Xe and any new users. Let me play around with this though a bit
> > though to get rough idea what would need to be done here.
> > 
> > [1] https://elixir.bootlin.com/linux/v6.18.6/source/drivers/infiniband/core/umem_odp.c#L255
> > [2] https://elixir.bootlin.com/linux/v6.18.6/source/drivers/infiniband/core/umem_odp.c#L193
> > [3] https://elixir.bootlin.com/linux/v6.18.6/source/drivers/infiniband/core/umem_odp.c#L104 
> > 
> > Also this is some odd stuff going... Why sync after every mapping [4].
> 
> Right now, hmm_dma_map_pfn() user is page-based one, we need to sync
> after every pagefault.
> 

Right. On GPUs we typically fault in chunks because it involves a copy
to/from the device, which is expensive, and it’s much more efficient to
transfer larger sizes. (IIRC, faulting 2M with 512 × 4K pages versus 512
separate 4K faults was about 58× faster in the former case.)

THP device pages (+mTHP) make the “one fault == one page” model more
palatable, but memory gets fragmented, and if THP/mTHP allocations fail,
we really need the path where we can move multiple pages in a single
fault. Because of that, we wouldn’t want to sync until all dma-mappings
are linked.

Also, I dug into hmm_dma_map_pfn; it doesn’t handle device-private pages
either, which is something we need.

As a long-term goal, having a function like hmm_dma_map_pfn that handled
multiple pages of various sizes, supported device-private memory,
sparsely populated regions, unified handling with migration PFNs,
handled high-speed fabric vs. P2P, and simply returned a mapping that a
driver could take and program into PTEs would be great. Perhaps that’s a
goal we can work toward eventually, though making this generic across
many driver/subsystem use cases seems difficult. The code I'm writing
here make this generic across DRM but my driver (Xe) is the only user
thus far so really impossible to know if I've got this correct until
another vender jumps in which hopefully is happening soonish.

Matt

> > Blindly doing BIDIRECTIONAL [5]... 
> 
> It was promoted from old code, callers can provide direction.
> 
> > 
> > [4] https://elixir.bootlin.com/linux/v6.18.6/source/mm/hmm.c#L826
> > [5] https://elixir.bootlin.com/linux/v6.18.6/source/mm/hmm.c#L821
> > 
> > > > 
> > > > Do you think we need flag somewhere for 'ignore holes' or can I just
> > > > blindly skip them?
> > > 
> > > Better if we will have something like dma_iova_with_holes_destroy()
> > > function call to make sure that we don't hurt performance of existing
> > > dma_iova_destroy() users.
> > >
> > 
> > Yes, I think this is the best route for the time being. Let me look at
> > this.
> > 
> > Matt
> > 
> > > Thanks
> > > 
> > > > 
> > > > Matt
> > > > 
> > > > > 
> > > > > Jason

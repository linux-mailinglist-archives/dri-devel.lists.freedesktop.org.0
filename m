Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +LwWGzhYqmk/PwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 05:29:44 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D40B21B7DB
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 05:29:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E25F10E325;
	Fri,  6 Mar 2026 04:29:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tx/keLsG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7F7110E236;
 Fri,  6 Mar 2026 04:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772771380; x=1804307380;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LVe7pW0Vn/CtJDNFdMdU1w+Ipqv0p9CRzm79EUpESas=;
 b=Tx/keLsGwqHIcAcsPalAb+uay6owXu6tl9inuEFfdTVKL5IVYB5P7tQ/
 gTp9s39ZnF8Q7Pz4sTTtJTJ28+xLxp12QBsm0lT02P3Hw0YSCl7QD0M1K
 DaRx33VZfySsryv5j4rIoPbjo6YgGyMloNKu0vEuox/UEZZeRkSWUBQdR
 QfWRQc6Ml6y6uOL91c23y41MA5LkFnFHeIE/3RCmV2VhR9HyiSfW3bKyf
 yfu16F3QGIHhiDFN3FKM1P/g3SfO6e6V0QPyM4OA4V4XoyKzLDXC0T6Of
 K01RS2/DL7PUMc5kh2tjaR9FlO5mZuR7BM2d9tXfpvx4fGGlkOvKJD1CO Q==;
X-CSE-ConnectionGUID: VJ/Znvf+Sg6b7+oLPitgRQ==
X-CSE-MsgGUID: ZqUsv/TwSMyEw1aVUajr9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="77745978"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="77745978"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 20:29:21 -0800
X-CSE-ConnectionGUID: zDTfzTleSyGrzL/FfjnTMA==
X-CSE-MsgGUID: seO5thHbTuKS9OdZmu32Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="221721802"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 20:29:21 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 20:29:20 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 5 Mar 2026 20:29:20 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.15) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 20:29:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zFfVkS2Z8jKEF+kY4ErV4Vq0cM3iy0/wnRUrEn+rsbs20yp14yYJbrk2VttyAg2qi+qH5NKW7hXRdp5LilRYy6Nexk7Lyxha1KisMeA0/we+toIiUKopZzVZQsWBcgd+bB0n0QMXdNzHJo3IQmV5igWRCMXZPQuUtFvt/DimsBEWuEeODNbol4H9RAynNvhPr4LGgK2JNIFyPZID3aMT+E1GzIGgJ+INWbt1D0OMGEz0wMq7GJZr9WithOGzhNT4shhF4Gfa4ApR6U/j/HUTxTeNAojzgQkPBqc6QDG03zLNRUq5KZu2ZeB7sh4UqW3eNJmMa5SfJsr5jCPttEg1eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=27+VqI1o6FML+Equb/7mQXRyQ+MY9vI3m7iRAtnT1Dg=;
 b=a2ftkKgopYQFPqgByHqydW9iOhFzf4bHY/2dKbqWJZtd+g7WlDwq3hD3T1N9jZJOLa39z5l+VNs03WPd6rD+z9AcPMQ171RAB6EOO/cKOonGwJ/1paw9ontCeZPVCCJUUibuZROMCI79bvqQ44CQO8LPHtJvZX6nltY8GmS5X1IOGBPn8MhDwhxeZWUCo8g/4PIXVfJuP+Fxn2uhsMmv2nKRzfjiUERPJq8d3g5mF2DsBRRpLuONj6bOA5oBuuy7rlgfj8JnIOCsuD9xWnUgPJUriZ88LobRprh6uhaLGM2+vxi7em/tOK1IahLulUWHclUxR4R3mI642bl3sBAurw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by BL4PR11MB8821.namprd11.prod.outlook.com (2603:10b6:208:5a6::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Fri, 6 Mar
 2026 04:29:17 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::9d4a:f89:f548:dbc7]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::9d4a:f89:f548:dbc7%6]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 04:29:17 +0000
Message-ID: <8e862ee8-34e2-4330-a9ae-e5b97ef3beae@intel.com>
Date: Fri, 6 Mar 2026 09:59:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/4] DP: Read LTTPR caps followed by DPRX caps
To: <imre.deak@intel.com>
CC: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, "Jani
 Nikula" <jani.nikula@linux.intel.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
References: <20260305-dp_aux-v1-0-54ee0b5f5158@intel.com>
 <aamrRxXwBxzt6s4F@ideak-desk.lan>
Content-Language: en-US
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
In-Reply-To: <aamrRxXwBxzt6s4F@ideak-desk.lan>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0015.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::7) To IA0PR11MB7307.namprd11.prod.outlook.com
 (2603:10b6:208:437::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7307:EE_|BL4PR11MB8821:EE_
X-MS-Office365-Filtering-Correlation-Id: 36959c37-74bc-4925-707c-08de7b38edc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: r8g4K8/IC/HHDY9luaEuuJvsm2Tb0o77QJytaVIdEAc4q3s8kaxXA+BzKOuQzgLFckQAdur4DlaJFW3kKY1TZE1M4oBDE8HJ5gtOL3qxIcEV0kW0sOMd5mnVUO3b9iPETyaUMflz1Uc6vcNGVMFnpmJpyH/DjcUBwfNKjgQrSri2LGh4L/BLaZE6l0kNYZG+o7n8nKbuYg5Bev6ZtGpd6CYhmRPmLRbSV14ifZvjy94ubMDn5hMzGsXCrZS+ok/YZNl46Jqib3F5PHzIkhVMTqrAUZkCDat6ayM4op4kRuiY/OX7rJuUt31AedrY7+ErMIuRZECVAk5xJM6L+W9VPEKBQWDv+hiwXjIBQUZWDqK54shWdBX3xaBCQ7kguWyugSmFWRE85BOVHec0aCdrHfxPxaRYkvBaH/vMRxULDzUzJqkSlDir1K4L4KUZqA0ioZzFRLQhLpHomn7fR3nNG3rijuP6vhTG0OJpbWD+gBM7EBI+nxKSZZbTqMJa7e9A3ZGR0F60dXwIN1linExfWpIdsfVV3RDCKLVQDnOfPt2unMW99zPUzlSFy9TYv8DpuS/P7qqNr/bhbvweF6acR71//r0uAK6TIly8mWZtgyfxaBJdgI9Ow7qh2fpSCNj4z3gZdYMdUC95geP6D0+R0wUxtMzKlnSXwW+K8EyxKmLNhWh9PWGYoY+HervtdG68
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXQxcUFmajBQWStNc3JyQVZ4WllYYXN3MFJMU210aHZWWnh6dWExQjZrSW44?=
 =?utf-8?B?TzlmTDIzUWFUUE5FN3dZQVRYb0lwTE56cUhZQit4QmZUSmc3NmhjTDkyMDZj?=
 =?utf-8?B?andSUTdBK1ZCOFhZSDc1QkdtK3ZLVlpUQVJGazNvdk53ZkQ5Ry9NNmd6dVIr?=
 =?utf-8?B?K3lMNGpkZjFvcDJidUc1YW9NSFIxRUNMKzBVRzdIdTFESXRibVI2ZzRsM3Fk?=
 =?utf-8?B?VEdsa3ZVTWpFbng4K3pWWjk0dXd4alhIQkhibGcwMWlMdTduS0s0TWJtdENZ?=
 =?utf-8?B?NWFha3ROZlA1WGRqZU1VeU43L1BUMUJEV2JSOU5jaTlvMTNsQU5NQ3k2NFNz?=
 =?utf-8?B?L240aWhmaTNNczlKM1lFbVVJdmVOYzJGam1iOTdrUEdRN0JkTkZpVEd0cFB1?=
 =?utf-8?B?UFBMeU9Yb2RwazZrSVdEZzVkVDBGWktvL0V4S0RQL25YdUNFZGJzRFhCYWtz?=
 =?utf-8?B?M3FoQ2dzQWFLWDEvZWJkdk5xMEgrbG02bEs4aTM3OEFSNTdESWowWmNlM0RI?=
 =?utf-8?B?UGV6ZVVMb2g0cmY3eXZyNzBkcGJxaWxIK0VzSEZkUWVIeXA2d3hmL0o5RGwr?=
 =?utf-8?B?STVJMGluTVIrRWRPMUhINzNjOE96SDczbHhibVVLYms4WTZXajRlOWZGRyt1?=
 =?utf-8?B?akphQzQ1QmM1NExsdXo0NkxCeFJmSTNNY1BIVFlaRHFJeE1KckR3UjYzcjJD?=
 =?utf-8?B?RXNyNmgzN25qNmxGOGdMblk3ZER0SFBWdUdpWkZmendqbVR0U1RZN2JET0d3?=
 =?utf-8?B?VTFTK2hMc2ZWUWZ3QjZweVRoWTBmbmtIeDlGcC9hWkpGaFliWjZHSzNTaUZR?=
 =?utf-8?B?b1JmS2U5dlFGWmVRU2ltaXpxbXJTQnlOY0tDNkRKMDRHQTh3YlZnZ3hndFlN?=
 =?utf-8?B?NkhIVzAvRW95NkNhRUd0VUNRNTBYYVdjRXBNcVFXQnFGZEFmeDBXNFB0S1Ru?=
 =?utf-8?B?TnlNNnVrY2x3QW42c2ZoMkZjczg5bXIzc1JZL3I2Vm9XKzlObFBGa0JpUG9u?=
 =?utf-8?B?dGFoTjN4UVdIQWhORXRyS3VPNmVjaUZxbHNDdWpaRU0vWjk3em1FeEh1MWda?=
 =?utf-8?B?OGhWYW5yOTF4eW9SNXRKcDVtMU5XblVOUEpiM0Fidmd0NEhGcWc1WWpXNHFK?=
 =?utf-8?B?eFROUjMrSkxXbEgrZjlTNVM5OU1SZXpZVUFHR2NBd0FjU2hMUURTTHZlamV6?=
 =?utf-8?B?VGRBMWlvWXRpVG5SUXd0Q2I0dXZ3NlRueWphY1B1M1Zub21RT1k5c0svbkpy?=
 =?utf-8?B?L1JoSjBWaFg1Z2R3VEw1RGZua2RkOGQ0S05iREE2ZU1QUFcxNjZ1UnhDNzRr?=
 =?utf-8?B?M0V2eFVVNVo3RVJ0djlZMC9IZEVGVXRtekh4MElWendmWXhCTEFlbVRTRy9I?=
 =?utf-8?B?bnhDT1hMWjNSL2dibk9JbXA0NzlHODFJVjRDRGNtSlNnT2ZnRzgxbURWeER4?=
 =?utf-8?B?eGNwQ0RzWHZZNTlKUEh2L3duaEdmQlV6bUFacWpFSHJzbWNDNXJ6Y3N6c3cy?=
 =?utf-8?B?dlBNYXpsekVXck9UQ09CeEhGZzhVOTNNdDh3Zzk4RldQRTQyeHBHRk00MmYx?=
 =?utf-8?B?R1hkamFuU0RlY3phZXNnRWxsUlZmTEJjb2tXeTlwc0I4S2k5RFFvWkM3TFVN?=
 =?utf-8?B?bXJtRWp5Nm9sd002cUFrdDRPOTFtNU5ZS3NramlVWGdCazUxTFNXWENSNUlK?=
 =?utf-8?B?WDBDNWNmMEx2U040NmNON21DanpOUlpVOXdEWHcyVTN5SnNZZllzMjRoWXJh?=
 =?utf-8?B?eUczd0JNNXUraG8zNzB6KzFiZWxsejhjRXBVQ1hXZXNYdWxWb1I0eHVmOTBy?=
 =?utf-8?B?aC9ENTlZNmljV2pMRDVncDlOdWZaVTFWYlBRSW5OdDRrc2tHc2V4QjZ0bFYx?=
 =?utf-8?B?Wkg1WXFiekR2ZVI3UFpnR1Uza2U3UnhFanZMcGdHMlpIcnFlb1d3WGU1aWRB?=
 =?utf-8?B?LzZ2ckgxV1lCcEk3ZGxEQ1Jhd1RyUVEvZXJFNzFpQ0pGa0hMTnJ1SmpIN2hs?=
 =?utf-8?B?Wlh4anRFQk8yUEtIczA1Q3l2aGc2ODR6bGJoQnFQWEtmdWZNa2lrVG9DS20y?=
 =?utf-8?B?RWtDdWtpYnhvZzZhTFp4elU1V3Q2dmhzOXNUMUZWU254d1JUaWpnK2NYUU96?=
 =?utf-8?B?VklrbWZuZDVkTmlmQnRpU2JCNS9tTkxjTTg1dStUbHFIWWkrVWRHZnB6eHhB?=
 =?utf-8?B?dWJudEFhNlVnaUIyNEc4cFdDak91dW9WR1dOOFlJVlphZlpCRzFLNUgwTHNS?=
 =?utf-8?B?QmJDTFYzTU1PTmd1bWpEeDRvUTZMaXA0bXVWcFpxbEpEZUtkaTVyV0xkSHEx?=
 =?utf-8?B?ZjkyNVNLdHJHV3hwbkR3QjhzL1JrSGI0OGU1WC9KelRUMG1mdTFVQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 36959c37-74bc-4925-707c-08de7b38edc6
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 04:29:17.1905 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pr6hHIbw2Fcx2hZMEPzDn355y8ftFZidhCGqOpo0E53YZ4FSMH1/hK/m/WBJYKn7zpVhryP0+K7dojyFpge3Ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8821
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
X-Rspamd-Queue-Id: 1D40B21B7DB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[9];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,intel.com:dkim,intel.com:email,intel.com:mid];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arun.r.murthy@intel.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Action: no action


On 05-03-2026 21:41, Imre Deak wrote:
> On Thu, Mar 05, 2026 at 01:48:10PM +0530, Arun R Murthy wrote:
>> As per the spec  DP2.1 section 3.6.8.6.1, section 2.12.1,
>> section 2.12.3 (Link Policy) the LTTPR caps is to be read first
>> followed by the DPRX capability.
> Not exactly. The Standard requires reading the DPRX capabilities after
> the LTTPR caps are read.
I also mean the same, sorry if my wordings were complex.
> The driver does read the DPRX caps after
> reading the LTTPR caps.

In intel_dp_link_training.c function intel_dp_init_lttpr_and_dprx_caps()

int err = intel_dp_read_dprx_caps()
if (err != 0)
     return err;
lttpr_count = intel_dp_init_lttpr()

Here we are reading dprx caps and then passing this dprx caps to the the 
func intel_dp_init_lttpr(). I think this will be a deviation of the spec.

> The DP Standard does not mandate that the first
> read after a sink is connected (i.e. after the HPD signal of the sink is
> asserted) must be an LTTPR capability read and cannot be any other DPCD
> register read. In fact this would be impossible to guarantee, a DPRX
> capability read - or any DPCD register read for that matter - could
> happen at any point and so it could happen right after the HPD signal
> got asserted.
Spec DP2.1 Section 3.6.8.6.1 LTTPR Recognition
After HPD is propagated from the DPRX to the DPTX, a DP Source device 
with a DPTX shall
read specific registers within the DPCD LTTPR Capability and ID Field 
(DPCD F0000h through
F0009h; see Section 3.6.5)
After LTTPR recognition, a DP Source device with a DPTX shall read the 
DP Sink device with
a DPRX’s capability by reading the DisplayID or legacy EDID and the 
DPRX’s Receiver
Capability field (DPCD 00000h through 000FFh; see Table 2-232).
>> Git log shows that initially drm dp helper exposed function to read
>> lttpr caps. Driver reads the lttpr caps and then the dprx caps.
>> For a particular issue
>> https://gitlab.freedesktop.org/drm/intel/-/issues/3415
>> as a workaround reading dprx caps was done first to know if the panel is
>> < DP1.4 and then read 1 block at a time for lttpr caps.
>>
>> This can be handled in a better way and two such ways is what I see.
>> 1. Read LTTPR caps followed by DPRX caps as per the spec. Then on
>> reading dprx caps if revision < 1.4 then re-read the lttpr caps one
>> block at a time.
>>
>> 2. Read LTTPR caps and if 8b/10b check for correctness of the link rate
>> supported(lttpr caps 0xf0001), if some corrupted value is read then read
>> one block at a time.
> The driver does read the DPRX capabilities after reading the LTTPR
> capabilities. This is what the standard mandates.
Yes but before reading the LTTPR capabilities also DPRX capabilities is 
read. Have added ref to the code snipped above.
Please let me know if my understanding is wrong.
>
> The workaround for issues/3415 depends on the DPCD_REV value, so this is
> read separately before reading the LTTPR caps. I don't see a better way
> to implement the workaround and such read is not prohibited by the DP
> Standard either. So I don't see the point of the changes in this
> patchset.

As Jani pointed this can be added as a quirk for that particular panel 
instead of mandating this kind of reading dprx caps first and then 
reading the lttpr caps for all the monitors.

Thanks and Regards,
Arun R Murthy
-------------------

>
>> I am open for either of the two or you have any other options as well I
>> am open.
>>
>> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
>> ---
>> Arun R Murthy (4):
>>        drm/display/dp: Read LTTPR caps without DPRX caps
>>        drm/i915/dp: Read LTTPR caps followed by DPRX caps
>>        drm/i915/dp: On HPD read LTTPR caps followed by DPRX caps
>>        drm/i915/dp: DPRX/LTTPR caps for DP should be read once
>>
>>   drivers/gpu/drm/display/drm_dp_helper.c            | 63 ++++++++++++++++++++++
>>   drivers/gpu/drm/i915/display/intel_dp.c            |  3 +-
>>   .../gpu/drm/i915/display/intel_dp_link_training.c  | 40 +++++++-------
>>   .../gpu/drm/i915/display/intel_dp_link_training.h  |  1 -
>>   drivers/gpu/drm/i915/display/intel_dp_tunnel.c     |  3 +-
>>   include/drm/display/drm_dp_helper.h                |  2 +
>>   6 files changed, 86 insertions(+), 26 deletions(-)
>> ---
>> base-commit: cfc20c776480fda8c1b0517b187bb71ec0781cd4
>> change-id: 20260305-dp_aux-1e27599e06c8
>>
>> Best regards,
>> -- 
>> Arun R Murthy <arun.r.murthy@intel.com>
>>

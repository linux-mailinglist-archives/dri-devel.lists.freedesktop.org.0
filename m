Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qE1EESjJrmlwIwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 14:20:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E88352399B9
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 14:20:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F05D710E4F9;
	Mon,  9 Mar 2026 13:20:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mKW13IQ2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21CCC10E4F5;
 Mon,  9 Mar 2026 13:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773062436; x=1804598436;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xQ5KoTtzS+SEbT3WWSxtRCesusDeAV2h5oBoAiedlDA=;
 b=mKW13IQ2i2s8AUw6fFexIx9cWgGN2Dwa03qo2v+p2lFRYEB4KfB2H+ym
 F17x78GF30M5zdXNc07O/SxH0XLfYCOcvwnA6bZ35AVktB3FWOsK5Uo6Y
 z4s2OVVmuttMSpQzbyV2M1OYJ995b2tP0MJg3k8E0KInL7PGMId49PNvc
 JWNDV3RM533eiPTVsqmtsawF6SmSScc2NlbJcUUGWHOp21Ils1/du83VF
 1qwObFRTsWwWOpom3X+rm6/vxXR+1iHup5oqOIrpf4EZPeWKkCMamVX4M
 j79xD7ZH8DTG+mX/GfswWx7f4dzcDTkLnh9B3MS2U4jzN2OAxsEr0dcKT Q==;
X-CSE-ConnectionGUID: 5I7Rp6pDRsOAegf4M8TY4g==
X-CSE-MsgGUID: YZZecB4dTAunsF7N/9TSIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="74129538"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="74129538"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 06:20:35 -0700
X-CSE-ConnectionGUID: Y5+hUL32SCmNhViy3RLWDw==
X-CSE-MsgGUID: Um1u6uRvRl+3/ON7vz0R2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="217349956"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 06:20:34 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 06:20:33 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 9 Mar 2026 06:20:33 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.38) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 06:20:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vZjbi9qY6thmW5gTywk3/4yQOmljmHU2Qbvmvz+ksc9+SyiBVbL9073uorqJ6my2J/zqJNon6BS/FTGi6gl8BmOl2Pj91+NTbVSm1g7a/B0YCtsnvajqYrBJfaHert82cBhbSm6DCrafhYzu3DAfOzb6x4YgGEzpMhMHa4whjRXtMI4YmKa4DmGLvyUSjqxelGgLCf8D3vEScAHRKJWzMjehP5L31KrzYRZJx/ge4KiSoLYRCZS/gZ6atMdb6kgFgCI3ve8JmFzyuug5Etn7lRb3VsJtqNAdGU1fQTy7CZnfvyXAUqdnShmWt5fZVoBjwsmQSpKAMMZzFITr6Osmfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ewciLRD1rrCP2RCSPKsXO19thf5F+V2t1U4u2Jj79Q4=;
 b=mLTpMooj5ojMs2y+zcnbV5brSpt90CHJzgdXB/hsUW/10IwOOQOo/xyEoKCKto22zK2bxsDA1AYEfPtJEpOODLkeQmuAuEKdMDt5/HbZC3U8GXN3wQ1JC9FWzCiXXsv0uM31WxLG+s8vmUi6UeGvR+tEoRbQDhewRyZKKwUTm+OGpgkPWkB8ZQhWFwqKrMyl6/FfuVRaeBK4mbwZBR3AZXdOL4ePccrFbVzdNknLy1XUNKwXkrR76MMx559X7iUT03/DfkoyzY0Do4Jdf+QqE5LZVYy2O67Nke80KUN4ZNeLMNkTqAPYONdLKTO3HP4O7DIBp852jgxZH+Op4k9j9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by BL1PR11MB5953.namprd11.prod.outlook.com (2603:10b6:208:384::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.10; Mon, 9 Mar
 2026 13:20:28 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::9d4a:f89:f548:dbc7]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::9d4a:f89:f548:dbc7%6]) with mapi id 15.20.9700.010; Mon, 9 Mar 2026
 13:20:28 +0000
Message-ID: <9faf7059-b9c1-4de5-ab58-a04d80b4b1b6@intel.com>
Date: Mon, 9 Mar 2026 18:50:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 3/3] drm/i915/dp: Configure PORT_AUX_CTL and then
 trigger the tx
To: Jani Nikula <jani.nikula@linux.intel.com>, Simona Vetter
 <simona@ffwll.ch>, <ville.syrjala@linux.intel.com>,
 <suraj.kandpal@intel.com>, <imre.deak@intel.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
References: <20260309-dp_aux_timeout-v1-0-08c610a63a84@intel.com>
 <20260309-dp_aux_timeout-v1-3-08c610a63a84@intel.com>
 <63a9df004fb9843a54b8c7702102d2dc0cc3d948@intel.com>
Content-Language: en-US
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
In-Reply-To: <63a9df004fb9843a54b8c7702102d2dc0cc3d948@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0252.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ae::8) To IA0PR11MB7307.namprd11.prod.outlook.com
 (2603:10b6:208:437::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7307:EE_|BL1PR11MB5953:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d89051a-5b02-4c29-a584-08de7ddea1c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: AMJs0OFb/9PsIHKuba7kLxX+RjnzBPfCC4y5z+iEE210ZEhcnDFKkDtpOLJ66COwyFgfY30BHS0x+SdMR3S0RErsy0eP7dE/zlOBQpMvvmfnYS//v8wML4XyElcM9hMLeEdHbe403gbMsuCYPaJmnTQvFgK0cFSxzEjJwi+aBJWqs1L+rAewG/mrCuToZjm7i/+T3BROrNMB9u3fF7LAsDzdRNZpx27U1iD1Aesopm/iEJNj811zHG6z0TIfzpqdqXQrktzeztqjGwkR2v9eY9oGNKn/7o8EUbLEyT2thb7tN1RFf0yRgdJ3dRceFeggF8S3/kNkXWRPhxvg0ogUsb2aA6TldLHCpcvS+CEuOy/wPJvwBmfeR0nxSN+UMY0/xha/H5x7c8syXGohbqPvBNK74yUyFZEpPer9OwO9ja4Eu5QM0aVG/iZ4CjHTiyyd9MNgDVRC049V7+qHtktWUDVseTN2UoV8lWlwfchuybN8HD1LTy/JQLiYiLhjr9VJoXfid4BOBY90F3m7H7oTzbkme9B4HMfy03N4DsuZkq2XWNTjPvTllNxl5BrVOPahKd8Mr57beD3ReZgTAjqS3BCN6siNTCK04k4egioS9HJVSekFz7GJv4w0ttjU4NRLPrUIDe/oEJqUEBej7jqModg0LAeo4DXoY9aLx2oHjua4/qX+KyTCiMYkDvNsWYAovA9dRRLry7VIm/9OAHPZagETWPa6fqPt6woUyO0u7Yo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2lBeFo2TUxUOVd6RmMvWE5zWlBkY1ZKbEMySUpzbmNqS2hzQkN0U3cvODdM?=
 =?utf-8?B?WVNOaTFwZ0VNOHh2MnBzRUFrYnlPUmcxZjlYVGJ5MjRHWms0YXdYanJIWVha?=
 =?utf-8?B?VEZCMHk2dkg2WVRSa1J0ZCt5VzlYSHYvSUhWeHA4NWxuZlkvbzVsVTNtWmp0?=
 =?utf-8?B?bGpWaVJhMHhTU0ZvK0NnaFFjUHlKWlkyUVZjcEZldVJyeTc1c0pTZnZidGRk?=
 =?utf-8?B?aFF3c044cUhZLzhDb0dqQ25OSVdpZVNjRHIzNmFVOWczaUFzMEdoZVk2R09z?=
 =?utf-8?B?WmR2TkRMamczUWlyU0xpWUZmdWxNRURPVDVocUd0MVRhcS9lRHYwTTczaGNM?=
 =?utf-8?B?NzlWNkVhaWt5T2g5M0FVZzFjVk9uSG5aUDNkcW41aUw4b0pWM3habWZLOUZ6?=
 =?utf-8?B?UkFvK0JYTTV3bXBodWtrdHdqNlZyVTg3R0tNRDlZREdERktYdTRwUlkvSmxJ?=
 =?utf-8?B?c0s4VTlZZCt1SWhhN1ZCWitHMnNXS3FJR3FqUGhIYzdGU0pMTTllNGxIblAr?=
 =?utf-8?B?UnE4dXJRaXoxSkF2M3R1eEVLUW5EQzJlU0o3WER0Z1NGNDI0M0xzdDliSlJJ?=
 =?utf-8?B?ODhNR0pxbW80UHdDZ0s5ZFlUUzVVMVF3MGVlWFp5QTQ0VHY3NDQrR3VnSmZh?=
 =?utf-8?B?cnFFZXovbTR4eVFWcVduMjlxTXE0SEdvOWE2dTdvM1EvMThjWEY4cytkT2Nz?=
 =?utf-8?B?ZGwwbG9xa3ROMVRGQmhwMUZ5cEowODlRekNXbXNUZkR1ODRpSk1OeHM0aDdJ?=
 =?utf-8?B?NXNRdnIwaFRUR2xTdmdSbDNka0xjS2R0V2ZHelRTdS9uTldxY1ZiOW5zc3d1?=
 =?utf-8?B?c2FFa0w5WGhja3htb3M4MWh6Y3czdmk1aEFCM0tNaUUwY3pMVFdxUzZvMjZr?=
 =?utf-8?B?UEkwVEhiaDJhZ0cyK0VnNTZDQXZRSFVpeFJKZXNXbHk5dXhWMHlFSVQrUHJn?=
 =?utf-8?B?RzU1Y3lwZXd5UmhhL3pNVXMwMUlkNFdDNTR5Nk1UMXJOYmt6VFJ1NnlZSU1U?=
 =?utf-8?B?eHVjL1BEaktrSlpXNm5BbXgxdzFnNjZURmhBZEFjZFhBU09wVXhFaHMyKzN3?=
 =?utf-8?B?TVdmb2hZWWlWTW5uU0N4ZnhTNStpcmZMYUpSNXR2UklDb0dUSWplN1pIeWxq?=
 =?utf-8?B?WEF0MXNWVVFLU1ZtUm5wZHdmVkprUmV6Und4UGFNdlh4QlpzSUltakFNRmd0?=
 =?utf-8?B?MEJHL29UQSsyNHhvM1VjS1lmeU4zNmhWalZsTE5tdE1tUk8xcG0rb1kxcVh2?=
 =?utf-8?B?OGEwMWZ6cDUxdlgrNVZqaG03NkZzTHo2cHVvSmtjMmhldEdRWTBqd0haSnRx?=
 =?utf-8?B?L2lodXlJa2pwcjQzSkhCSzMrUTRuYzFOSXU2RXNrUzh4U2NHRTRkK2N0enF1?=
 =?utf-8?B?bmpsbzRpSnllbHJsV0U1aEFheVZxQWRpLzdsci9jTFNBQzNJaDNxZG5MZ2V4?=
 =?utf-8?B?MFliY2hpTmpLdFZxNXhrQThDWHY5K3lHL2twV3ZoM2VmV1Yrc0NYSXNOUzk3?=
 =?utf-8?B?MjZEZ09rMGZoamVmSGZCKy9DUlJtZDk0SGpwZHI0TUlwSTFIeTBvU09ZYnAz?=
 =?utf-8?B?Ym84dVFqdkh1ODZDYnV5cFpjeUxKWExxa3AxSU5BQzVpM051enpua2hZR0I2?=
 =?utf-8?B?Qm1LMkd0dG5ONGFzZGJ6WGxVY2tBVjA5SWtLMWJabnZXZXlaWkR0WFlHV0R0?=
 =?utf-8?B?V3JXdm1WR3NhdXpXTko3MExpdXkwdXRuV0ozWE96NW9TYzJEZmN1WThkMm9V?=
 =?utf-8?B?RHlWWmxRZHAya2FwQ3ZFMFF0RjVYL09DcHAvR3FoKzRWM3MrQmNTYi91ckh0?=
 =?utf-8?B?ZWREWFlhRXMwb2JmV1VJT1RNRnVLOU1HRGhsOGdlMWI4OUNCRU1vdXMycklT?=
 =?utf-8?B?cnVQNWxtVDUxdVBpOU9mSTE5Y3ZzL0dZVlZESUFua1gxUzNjUldKSEdMYTZ0?=
 =?utf-8?B?bmlDU3hGMjhpUlVLWngxVnBxaHlqYTJlYmdUSlB2Y1R1YzdmZ2wySnZUejVl?=
 =?utf-8?B?dVhWQWEvV2diYURWWUVPU1lSY01iSFNlS3BqTm56SjY5L201a0RxcytJRU9q?=
 =?utf-8?B?bXgrODNLbWFLZEQ1QnpVdHpRUVdRd05BM1owUjlqaTI1a1piUEdzYjNLMmI5?=
 =?utf-8?B?R2YwTGVuVkZHL3Y1MUZlRC9JYkgzeG1qdEtoVHpJRUh4aWJKdllNbXBUTUFk?=
 =?utf-8?B?VG1Fd2xxeDUvZG1KNTZvaEZmOFJyTU1XTEFlVlliR3BnSisrdkNUbk5RRXBV?=
 =?utf-8?B?NmltaDd6R3cvd0tBSFRyQWxBNy93VklwK3FYNUNCVlB5TXVqU1BWbGg1aUty?=
 =?utf-8?B?SUJnV0ZPVUowSlNqdDJtSFdUZktPQUNPakRZdUhaeWh3YkNaQy9LUT09?=
X-Exchange-RoutingPolicyChecked: be3eScWX1kREaC2QgOnbk9cHfAyqecvn0x+rvc/3+WfyHlr7ZGWXEJj4ypvIHxmXoSY6bn2lZkpU/8iVK9eT5iAbdo9T+DFLWrsq/fQp29x70BLesa3czByP8dxKOa+NIvtKL1GKbw5OvgChV5S1G8Ux4MqwdH117ISIFrq37wCkd4Mdvh7kn2SA2Dw84qjZ/D1w86iGp2fbpWdOB/+vwPPTOCMP39nkGAwZkqjumP5uL+hjHcwO4h93Vb5uxfBATsia7s7KnuCZ+6fM6Cw438iigggrrGEPNpVX3iNmK8Js30kgP+AHsUwY6oGZcxnyw+5Tkw1sNw3Fl+kcG6NfMQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d89051a-5b02-4c29-a584-08de7ddea1c4
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 13:20:28.4978 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LZEeJ4tPYeur7cH1SPL1opgXbTVYzJKPKsTEQ4v3yfUHz+gxSrtgGgO+fbPw9/bt7FkemXzgIpYFoTDlr0rwTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5953
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
X-Rspamd-Queue-Id: E88352399B9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,intel.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo];
	RCVD_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	FROM_NEQ_ENVFROM(0.00)[arun.r.murthy@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.963];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Action: no action


On 09-03-2026 18:39, Jani Nikula wrote:
> On Mon, 09 Mar 2026, Arun R Murthy <arun.r.murthy@intel.com> wrote:
>> Use re_rmw and update the required bits for PORT_AUX_CTL and drop the
>> bit configurations that are not required(AUX Power Request setting of
>> bit 19). Also break writing to PORT_AUX_CTL into 2 steps with first step
>> for doing the configuration/settings and then second write to trigger
>> the AUX transaction.
> The primary question the commit message should answer is, "Why?"
>
> There's a whole lot of "What?" here, indeed too much since the patch is
> doing too many things in one go.
>
> The point of an RFC patch is to solicit feedback on the idea. But the
> idea remains vague here as there's no rationale why this is needed.
Before initiating the AUX transaction, power well is enabled by calling 
intel_display_power_get().

Here the AUX Power Request bit19 of PORT_AUX_CTL register is being set 
and with a timeout of 600us the AUX Power State is checked to see if the 
power is enabled.

Then as part of the AUX transaction, PORT_AUX_CTL is written using 
intel_reg_write. Since we are writing to the entire register the same 
bit19 AUX Power Request is again being set to ensure the bit is set. 
This setting of bit is un-necessary as its already being set in 
intel_display_power_get.
Hence in order to overcome this un-necessary setting of bit, 
read/mask/write is being used.

Thanks and Regards,
Arun R Murthy
-------------------

>
> BR,
> Jani.
>
>
>> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
>> ---
>>   drivers/gpu/drm/i915/display/intel_display_types.h |  6 +-
>>   drivers/gpu/drm/i915/display/intel_dp_aux.c        | 83 ++++++++++++++--------
>>   drivers/gpu/drm/i915/display/intel_psr.c           | 29 +++++---
>>   3 files changed, 76 insertions(+), 42 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
>> index e189f8c39ccb440f99cd642de177b18f3b605753..341749452579acfc3e08715d2f0b211bf6489dd9 100644
>> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
>> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
>> @@ -1882,10 +1882,10 @@ struct intel_dp {
>>   
>>   	u32 (*get_aux_clock_divider)(struct intel_dp *dp, int index);
>>   	/*
>> -	 * This function returns the value we have to program the AUX_CTL
>> -	 * register with to kick off an AUX transaction.
>> +	 * This function programs the configuration/settings for the AUX_CTL
>> +	 * register but dont kick off an AUX transaction.
>>   	 */
>> -	u32 (*get_aux_send_ctl)(struct intel_dp *dp, int send_bytes,
>> +	void (*get_aux_send_ctl)(struct intel_dp *dp, int send_bytes,
>>   				u32 aux_clock_divider);
>>   
>>   	i915_reg_t (*aux_ch_ctl_reg)(struct intel_dp *dp);
>> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux.c b/drivers/gpu/drm/i915/display/intel_dp_aux.c
>> index 0a9e2d6cdbc5d9e0d17b2db60a32cf20a3bad6b6..4fef378e0a8fbf79211fd98913e507e90b2b48ea 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dp_aux.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux.c
>> @@ -175,12 +175,13 @@ static int g4x_dp_aux_precharge_len(void)
>>   		precharge_min - preamble) / 2;
>>   }
>>   
>> -static u32 g4x_get_aux_send_ctl(struct intel_dp *intel_dp,
>> -				int send_bytes,
>> -				u32 aux_clock_divider)
>> +static void g4x_get_aux_send_ctl(struct intel_dp *intel_dp,
>> +				 int send_bytes,
>> +				 u32 aux_clock_divider)
>>   {
>>   	struct intel_display *display = to_intel_display(intel_dp);
>> -	u32 timeout;
>> +	i915_reg_t ch_ctl = intel_dp->aux_ch_ctl_reg(intel_dp);
>> +	u32 timeout, value;
>>   
>>   	/* Max timeout value on G4x-BDW: 1.6ms */
>>   	if (display->platform.broadwell)
>> @@ -188,8 +189,7 @@ static u32 g4x_get_aux_send_ctl(struct intel_dp *intel_dp,
>>   	else
>>   		timeout = DP_AUX_CH_CTL_TIME_OUT_400us;
>>   
>> -	return DP_AUX_CH_CTL_SEND_BUSY |
>> -		DP_AUX_CH_CTL_DONE |
>> +	value = DP_AUX_CH_CTL_DONE |
>>   		DP_AUX_CH_CTL_INTERRUPT |
>>   		DP_AUX_CH_CTL_TIME_OUT_ERROR |
>>   		timeout |
>> @@ -197,23 +197,35 @@ static u32 g4x_get_aux_send_ctl(struct intel_dp *intel_dp,
>>   		DP_AUX_CH_CTL_MESSAGE_SIZE(send_bytes) |
>>   		DP_AUX_CH_CTL_PRECHARGE_2US(g4x_dp_aux_precharge_len()) |
>>   		DP_AUX_CH_CTL_BIT_CLOCK_2X(aux_clock_divider);
>> +
>> +	intel_de_rmw(display, ch_ctl,
>> +		     (DP_AUX_CH_CTL_DONE |
>> +		      DP_AUX_CH_CTL_INTERRUPT |
>> +		      DP_AUX_CH_CTL_TIME_OUT_ERROR |
>> +		      DP_AUX_CH_CTL_TIME_OUT_MASK |
>> +		      DP_AUX_CH_CTL_RECEIVE_ERROR |
>> +		      DP_AUX_CH_CTL_MESSAGE_SIZE_MASK |
>> +		      DP_AUX_CH_CTL_PRECHARGE_2US_MASK |
>> +		      DP_AUX_CH_CTL_BIT_CLOCK_2X_MASK),
>> +		     value);
>> +	return;
>>   }
>>   
>> -static u32 skl_get_aux_send_ctl(struct intel_dp *intel_dp,
>> -				int send_bytes,
>> -				u32 unused)
>> +static void skl_get_aux_send_ctl(struct intel_dp *intel_dp,
>> +				 int send_bytes,
>> +				 u32 unused)
>>   {
>>   	struct intel_display *display = to_intel_display(intel_dp);
>>   	struct intel_digital_port *dig_port = dp_to_dig_port(intel_dp);
>> -	u32 ret;
>> +	i915_reg_t ch_ctl = intel_dp->aux_ch_ctl_reg(intel_dp);
>> +	u32 value;
>>   
>>   	/*
>>   	 * Max timeout values:
>>   	 * SKL-GLK: 1.6ms
>>   	 * ICL+: 4ms
>>   	 */
>> -	ret = DP_AUX_CH_CTL_SEND_BUSY |
>> -		DP_AUX_CH_CTL_DONE |
>> +	value = DP_AUX_CH_CTL_DONE |
>>   		DP_AUX_CH_CTL_INTERRUPT |
>>   		DP_AUX_CH_CTL_TIME_OUT_ERROR |
>>   		DP_AUX_CH_CTL_TIME_OUT_MAX |
>> @@ -222,17 +234,22 @@ static u32 skl_get_aux_send_ctl(struct intel_dp *intel_dp,
>>   		DP_AUX_CH_CTL_FW_SYNC_PULSE_SKL(intel_dp_aux_fw_sync_len(intel_dp)) |
>>   		DP_AUX_CH_CTL_SYNC_PULSE_SKL(intel_dp_aux_sync_len());
>>   
>> -	if (intel_tc_port_in_tbt_alt_mode(dig_port))
>> -		ret |= DP_AUX_CH_CTL_TBT_IO;
>> +	intel_de_rmw(display, ch_ctl,
>> +		     (DP_AUX_CH_CTL_DONE |
>> +		      DP_AUX_CH_CTL_INTERRUPT |
>> +		      DP_AUX_CH_CTL_TIME_OUT_ERROR |
>> +		      DP_AUX_CH_CTL_TIME_OUT_MASK |
>> +		      DP_AUX_CH_CTL_RECEIVE_ERROR |
>> +		      DP_AUX_CH_CTL_MESSAGE_SIZE_MASK |
>> +		      DP_AUX_CH_CTL_FW_SYNC_PULSE_SKL_MASK |
>> +		      DP_AUX_CH_CTL_SYNC_PULSE_SKL_MASK),
>> +		     value);
>>   
>> -	/*
>> -	 * Power request bit is already set during aux power well enable.
>> -	 * Preserve the bit across aux transactions.
>> -	 */
>> -	if (DISPLAY_VER(display) >= 14)
>> -		ret |= XELPDP_DP_AUX_CH_CTL_POWER_REQUEST;
>> +	if (intel_tc_port_in_tbt_alt_mode(dig_port))
>> +		intel_de_rmw(display, ch_ctl, DP_AUX_CH_CTL_TBT_IO,
>> +			     DP_AUX_CH_CTL_TBT_IO);
>>   
>> -	return ret;
>> +	return;
>>   }
>>   
>>   static int
>> @@ -341,11 +358,12 @@ intel_dp_aux_xfer(struct intel_dp *intel_dp,
>>   	}
>>   
>>   	while ((aux_clock_divider = intel_dp->get_aux_clock_divider(intel_dp, clock++))) {
>> -		u32 send_ctl = intel_dp->get_aux_send_ctl(intel_dp,
>> -							  send_bytes,
>> -							  aux_clock_divider);
>> +		intel_dp->get_aux_send_ctl(intel_dp, send_bytes,
>> +					   aux_clock_divider);
>>   
>> -		send_ctl |= aux_send_ctl_flags;
>> +		/* Update the flags */
>> +		intel_de_rmw(display, ch_ctl, DP_AUX_CH_CTL_AUX_AKSV_SELECT,
>> +			     aux_send_ctl_flags);
>>   
>>   		/* Must try at least 3 times according to DP spec */
>>   		for (try = 0; try < 5; try++) {
>> @@ -356,15 +374,20 @@ intel_dp_aux_xfer(struct intel_dp *intel_dp,
>>   								 send_bytes - i));
>>   
>>   			/* Send the command and wait for it to complete */
>> -			intel_de_write(display, ch_ctl, send_ctl);
>> +			intel_de_rmw(display, ch_ctl,
>> +				     DP_AUX_CH_CTL_SEND_BUSY,
>> +				     DP_AUX_CH_CTL_SEND_BUSY);
>>   
>>   			status = intel_dp_aux_wait_done(intel_dp);
>>   
>>   			/* Clear done status and any errors */
>> -			intel_de_write(display, ch_ctl,
>> -				       status | DP_AUX_CH_CTL_DONE |
>> -				       DP_AUX_CH_CTL_TIME_OUT_ERROR |
>> -				       DP_AUX_CH_CTL_RECEIVE_ERROR);
>> +			intel_de_rmw(display, ch_ctl,
>> +				     (DP_AUX_CH_CTL_DONE |
>> +				      DP_AUX_CH_CTL_TIME_OUT_ERROR |
>> +				      DP_AUX_CH_CTL_RECEIVE_ERROR),
>> +				     (DP_AUX_CH_CTL_DONE |
>> +				      DP_AUX_CH_CTL_TIME_OUT_ERROR |
>> +				      DP_AUX_CH_CTL_RECEIVE_ERROR));
>>   
>>   			/*
>>   			 * DP CTS 1.2 Core Rev 1.1, 4.2.1.1 & 4.2.1.2
>> diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
>> index 9296ca3a4ff468a6e61babd81217e4ba19b15062..e06e04f20355d511e5c58fc28866aa763fd65a4b 100644
>> --- a/drivers/gpu/drm/i915/display/intel_psr.c
>> +++ b/drivers/gpu/drm/i915/display/intel_psr.c
>> @@ -722,7 +722,9 @@ static void hsw_psr_setup_aux(struct intel_dp *intel_dp)
>>   {
>>   	struct intel_display *display = to_intel_display(intel_dp);
>>   	enum transcoder cpu_transcoder = intel_dp->psr.transcoder;
>> +	i915_reg_t ch_ctl = psr_aux_ctl_reg(display, cpu_transcoder);
>>   	u32 aux_clock_divider, aux_ctl;
>> +
>>   	/* write DP_SET_POWER=D0 */
>>   	static const u8 aux_msg[] = {
>>   		[0] = (DP_AUX_NATIVE_WRITE << 4) | ((DP_SET_POWER >> 16) & 0xf),
>> @@ -742,17 +744,26 @@ static void hsw_psr_setup_aux(struct intel_dp *intel_dp)
>>   	aux_clock_divider = intel_dp->get_aux_clock_divider(intel_dp, 0);
>>   
>>   	/* Start with bits set for DDI_AUX_CTL register */
>> -	aux_ctl = intel_dp->get_aux_send_ctl(intel_dp, sizeof(aux_msg),
>> -					     aux_clock_divider);
>> +	intel_dp->get_aux_send_ctl(intel_dp, sizeof(aux_msg),
>> +				   aux_clock_divider);
>>   
>>   	/* Select only valid bits for SRD_AUX_CTL */
>> -	aux_ctl &= EDP_PSR_AUX_CTL_TIME_OUT_MASK |
>> -		EDP_PSR_AUX_CTL_MESSAGE_SIZE_MASK |
>> -		EDP_PSR_AUX_CTL_PRECHARGE_2US_MASK |
>> -		EDP_PSR_AUX_CTL_BIT_CLOCK_2X_MASK;
>> -
>> -	intel_de_write(display, psr_aux_ctl_reg(display, cpu_transcoder),
>> -		       aux_ctl);
>> +	aux_ctl = EDP_PSR_AUX_CTL_TIME_OUT_MASK |
>> +		  EDP_PSR_AUX_CTL_MESSAGE_SIZE_MASK |
>> +		  EDP_PSR_AUX_CTL_PRECHARGE_2US_MASK |
>> +		  EDP_PSR_AUX_CTL_BIT_CLOCK_2X_MASK;
>> +
>> +	intel_de_rmw(display, ch_ctl,
>> +		     (EDP_PSR_AUX_CTL_TIME_OUT_MASK |
>> +		      EDP_PSR_AUX_CTL_MESSAGE_SIZE_MASK |
>> +		      EDP_PSR_AUX_CTL_PRECHARGE_2US_MASK |
>> +		      EDP_PSR_AUX_CTL_BIT_CLOCK_2X_MASK),
>> +		     aux_ctl);
>> +
>> +	/* Send the command or intitate the AUX transaction */
>> +	intel_de_rmw(display, ch_ctl,
>> +		     DP_AUX_CH_CTL_SEND_BUSY,
>> +		     DP_AUX_CH_CTL_SEND_BUSY);
>>   }
>>   
>>   static bool psr2_su_region_et_valid(struct intel_connector *connector, bool panel_replay)

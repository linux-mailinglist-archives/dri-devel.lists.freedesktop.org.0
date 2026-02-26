Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOe8Kg68oGnClwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 22:33:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12AE41AFD95
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 22:33:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 146C310E9C6;
	Thu, 26 Feb 2026 21:32:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h1SnBVZu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC97610E9D9;
 Thu, 26 Feb 2026 21:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772141577; x=1803677577;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=E/5iuN4EUBy1PB413/NrLUcmA7mB9nSDiMTrRAMeWZw=;
 b=h1SnBVZu8XV2cIADIWrtJOdENrtPWcp9q36tMtzhmDZtrzyvr90ejzCx
 dizE1RS4IcGZPnN+DuEb1nb7yuKS8s/Rg3UfDzYcU/pqNIhQl95jrwcTK
 9AKK8lUGDeWR84jDgiUsKMGZmwkBaOpS1lYwvaTug4KZMe1kC7m6lITLB
 49zwzPAhVMGDZLR8aW/yXv553UJA4hwOafcjDFopNGH9Th4GFvmxHAEgi
 8pEuyt4i8OygCny7YnaVQ2gC687BQJ3m/gwz32kfF2WI00Ed5OvgPv2IR
 iyZCWnx8i7PeiYpgI3qY7uWNZ9U/PAQj0TLbPCgM+7pIQQEJ5lpD7Nb0a Q==;
X-CSE-ConnectionGUID: tJPqMnfWQKOqlgWA/XTVFA==
X-CSE-MsgGUID: /qdzLiL1QP2tvuyDh4um+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="73401560"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="73401560"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 13:32:57 -0800
X-CSE-ConnectionGUID: 28IjQQNvQFCPUa7O/0uITw==
X-CSE-MsgGUID: rInACG4LRn66x4CABLWIgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="215927326"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 13:32:58 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 13:32:56 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 26 Feb 2026 13:32:56 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.65) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 13:32:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fvzLjNMlmmmQRFFU6PrYp/fhd0kWUjvFD7H/YW2OgFSUlK9V52wvLddIu/OMwHzfrhQ5kfLqcsB5LkhWNPbC6/tfCK0Hp/kI6wSnI02tbASgGw/KSlJk31XoP+fCilZ4EEbULznPcMt3QXjwekw+2rhPTkEG6LeEV74kQ0Jd6eRv9ahqHrV2Xf58IGRTuFFLhEXMCyo/XD+ehWBDPH9cwJsCzEdqZD5o+CcKRcHdn3IFzWWb9gy9UWPAFqeoe48R/5wfSHAD7SrHIWJ5HbTmIz+qsGfiErTm/6xexVuuwHUij/piZu+JBU9nFQgMo8ieKB4c8YNXHlHuyd880MQpyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zn0IP/CTxDQN99uOEqPrWfAVHq/Ro94X5d+qOLxwBvc=;
 b=zCo78wy43XbCKNoOx+3YZDcAE5BwqcP2M4Qitv6IqB7izQXCKfv5hEspuG2PzxYiE33WDlrfhI6xXAk/gqWgDu7ba4+e8Kkoi5dti5VBHsoI5Xkgll9UXp9bBehDIJ8Ci+d/neZYY1D0vWFkbX3F9XmSVNVn4C9F0y7SGsBIV+3DBK/DUgFX9JuiLXzZZcIRh9q2ZhCDB5O2g3lhkNoWi21Pci0oAs09L4qsumUBE6ykE0haWeNsaysRhlBocETr+WUCne3Rqsq2SR7CqBXfd/gz+T5dAvUyRXX7m/FtFVDVO9XCLaydzu1splVQtdnZx5bcZs/wP2RKAZz5Ne/8Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DM4PR11MB6216.namprd11.prod.outlook.com (2603:10b6:8:a8::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.11; Thu, 26 Feb 2026 21:32:53 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%3]) with mapi id 15.20.9632.017; Thu, 26 Feb 2026
 21:32:53 +0000
Message-ID: <1646e584-9900-4487-8063-5cc1db18870f@intel.com>
Date: Thu, 26 Feb 2026 22:32:48 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v4 1/1] drm/xe/pf: Restrict device query responses in
 admin-only PF mode
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?=
 <piotr.piorkowski@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>, "Dunajski
 Bartosz" <bartosz.dunajski@intel.com>, <dri-devel@lists.freedesktop.org>
References: <20260226163104.3192618-3-satyanarayana.k.v.p@intel.com>
 <20260226163104.3192618-4-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260226163104.3192618-4-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VE1PR03CA0029.eurprd03.prod.outlook.com
 (2603:10a6:803:118::18) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DM4PR11MB6216:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d234f74-6be9-42a0-8e3f-08de757e9922
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: EtbxwKQuHmaCC8dHhXaSbe75+DZwFD3/A26oKQPkzdHsuRN0P3Awas5AtWMPPN5jaZ+vGcbNVsgxZs9YDxMhSbZPPwgdqjYVeUso0AglvTAo89UulabAaUPoAuBh95pGFqo0qv7r52xdvaww5+FNeojYKi2CcGCKOOUC5F4VQqwolHSXJS7G0HlJVcv9fB0S9S1QTLaTHgTRcax/xIiIxehMpC5m6v7bVYrEv8nR6TElwPg1ZWJvQrChf6L5WkvJJXj15flqJt1KkiwT+eNTghTIbfWG0FvZQjFjCgp9oarK2D4ArdMtgiOV1gaTif8macqcZApIO/WGba9Z+xJA4vQT1Hw/ijsRUu0job0XmaxrpL7pNoZd1qXytAhe++1jbySwsURce/iKX98+ur5R6VWoRmq/ILJaHitSajZbsZdzFdBSU1zC5pvH3A9Q54p1QH8aGQxBGCPMRTSSNKatPbw2jqH/MWmE9yeSr318pf9QJXI+u5Mu4EroCpkxkr9xWVVd01etMiQg3QJx7LNTMk9lk3CuTfkIrC8dcSZ4LzNe5nBYjIV0lOhB2AWA76ZlCsYZPmOh1OTBh0GqE4NJARyIXRpmkZoyhU8ApKA096dhF9Bt7mBpCiYP5NGHvwYJT4JRUbWflWRAZ6MXXC1YttODANSinMqi0EZZDP6/JTyCuKac32wjgHRmWWQk2Zb5whNmml6ChvUCAupoRRxBWHjCGT+JNrop8QZplXKR6g8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SmFKYWdvWG9hV2xwWFhMaXJLSkluanE5bHU1YWhUZThhNW5ybTMrOGg2OU52?=
 =?utf-8?B?RnkveGcwRERxVzFQRmpmTnlRK3Nob29VUVpYeWd0bk5Sdk9qVUFwcDVnMmFY?=
 =?utf-8?B?S3BraDdZeGYvb3lnT2tmWFZSM0xPVlFBeDE3bkdZUG5RVFdxdHU2S043aVJa?=
 =?utf-8?B?Q1ZFc1laeGdBNGphQW80OFB1NHRyYUI4UTMrbE5VRVZKSXRkNksyTDZYZ3Z1?=
 =?utf-8?B?V2w1b2w0NUp6Q2ltMTZTeUptV0VJcDRDKy9KaEZqQ3ZBRFpQN1k5THlSckV4?=
 =?utf-8?B?TVE3N1lJbEY1SDJ6U3hNYnFpS3h2TTRVZ2RoaXZ2UjI0Q0Y4V2sxYzZ0a3hQ?=
 =?utf-8?B?RjFkY29pN3g0VTVLRFVDNDJBcWpJdWREMXYzaHdCaHZnRk9RMjRNeWF0aXVX?=
 =?utf-8?B?Wk9zWFA0VndITW9zbXZjRGNSNUY1UUQrYzNwVU9BOEg0VTBaYXh2djg1Q0xK?=
 =?utf-8?B?ODI5VjJyaGJwWEFlNE5tVWNQenc0cURhc0diQ3lCUkpZV1M1aisvcFljU3RK?=
 =?utf-8?B?RGJJVk9Wd3N6c0Y5NVBxOHozV0NPd3hjNDJZK1lsditkbVRVcnJqMHMxRkNm?=
 =?utf-8?B?V014b211NCtPczY4Z0JHZ0Z3cEpxbHdFSC9MZTcyNk0yVTYvYzFjWDR6MkI3?=
 =?utf-8?B?N0RlcHFtTTg2aTZGOXRHaXB1a3dPWFlCZUczSFQ5ZThwVVFWWVVER2tKd2tZ?=
 =?utf-8?B?QjY1OWRVRER2TWowSjBPUEkzczNibWxOTXpIbDdhSHF1MXR0V293bStBVUU2?=
 =?utf-8?B?UE1RODlpcWhqQ0g0TzlRT3crMEhZMHJJNGl0dmdZUE0zdERQeWU3NFkxOVdC?=
 =?utf-8?B?Y05tci94YlV4ZHpJT2RVaS9kY0prYVJwbHdYdkRSK09ieERvSXhWR2g3eHdY?=
 =?utf-8?B?VWM5S0tlL0RiMUo3RGJDekRIMkJjYVQ2SVowdlhGL1lLQXlzTFhCakpXSk95?=
 =?utf-8?B?M0xkSFJ6YnVBUmNSSFh2Vy9DSC9MSzNtQjhVTXNhWHpickxuNGFIN0lMNXBk?=
 =?utf-8?B?Z1RpbWt2RHVaS2VDN3lZaUN3M2luRVdIcm55Y2Jrb0JSeEVjOC84L25SdmJn?=
 =?utf-8?B?N0p2OW0yekw5a2tlRmpFVTRWNUpwbnJQWTJDdE92M1FwYmdPYnpQKzR4bUJN?=
 =?utf-8?B?ZGFHeDh5YStaR3h6ajRlZUUzNXc1ejFTMTR6U1FmZHpWTElaUUMzN1NCSEox?=
 =?utf-8?B?QXlDL0JkbnVoRStKQ2hmcjYvSGpnTzZHSkNGeVNJVklsK3FFNlRLR1ZWbHdL?=
 =?utf-8?B?NnJ4Q3pZeEJNdUJaUWs5Q0NGeXkwNHM4T3VnbWhOVzhDZXcwenFqMFNtR3Rl?=
 =?utf-8?B?cCtxTXhsWkE5aVRUVkhPaFEyTWtrZXorUFQ5VEhlbHJTMm9OMkdoZWJ5aVox?=
 =?utf-8?B?QVFjSTdMd2hSVzI3SVBXUW5UYlF6aStBUFpIZVhOZXRxOFlCSkNUT1VCdG5W?=
 =?utf-8?B?YmRBU3M4eWtOMlMyS3ZzMGZRNWZ3YVg2YmxrYlRSUFk0WittYzY0SEZRZXps?=
 =?utf-8?B?VnBKN3pFNmJ5aEg2dUxjWlhRRkY1ZExMODQ1OHhtd1ZidG83UFg3VG5NSUhI?=
 =?utf-8?B?dnBWa2FjZmQvcjViblp4QTV0NmtVTHVUYTNkdW5ab2FuVFJOTDFsejM3YUsw?=
 =?utf-8?B?OWQ2V2NHMi8wZ3dzQ1dESXVOcEpmdU5UbTFYODU2UURvSVVSMk5jSVZvTnB5?=
 =?utf-8?B?UitEQTc5TXdwWDhrZW5ocFA2eS9ZYTF6ZGluNmNiOUxYRUl3R2Ewdjh3N0hp?=
 =?utf-8?B?VzYvS0VNRW9GWE5IbFhHS05iSnNjM3Jocm56NVdBU2NEVkVBVUhoWm9zdkNS?=
 =?utf-8?B?TGNtbUQ0anVNUjVyWnVsQ25uRnNscWR6dUhVd2NhNjlhTGFtamQ3bjMydEtD?=
 =?utf-8?B?eGdBeEZJa0taTDVpUzU2bUhLVnMzVWoyVVdqUFY2WkNxZi9pajBzRjVyTkpP?=
 =?utf-8?B?REFQTmtTWVJsWHZIblpIOUpVNCtRSGdhcmVHdEJRMm5UelNTUFlvMG16Zisx?=
 =?utf-8?B?MEFXMzFHcWVjek5BQ1hLTTZFL2xDc3VwYmNPb01OTkZBQlB6R3ljWVdtc0FH?=
 =?utf-8?B?bXhwOG5nK0NSZ2dHUysvNW1ZWUo3NVQyK2dadUZWMnF2ek9hRWFMOGMzVUdj?=
 =?utf-8?B?dmxPbjViT0lHZHpaVUl5ZFBuYndqay9aUFYzZVZjN3FZdlVMVjFwQXY0Z3M4?=
 =?utf-8?B?dGNFekVsSWQ5WGFSc0svRldUWkNXR1pCNUhZUkhHa3d3Wm9TaU5yU21mSzVt?=
 =?utf-8?B?aTA1bW5vSEx2UWdOOE5tSXlTanJIa2cwc3NVbzZjRkFEUXFwRWJ5azlpdnpN?=
 =?utf-8?B?YlFnWkE3N3F3bGZ3bWVPZDJpSzVYeE1CbDc5aktJb0k3U1NxQjZuaklsRWJz?=
 =?utf-8?Q?jn0UvwRpAf2eSB98=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d234f74-6be9-42a0-8e3f-08de757e9922
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 21:32:53.0946 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DKmZ51vWA4sKsqKG2YM+y8XbUBgcEXOzvHGgZ4mtoKPjkgJdXypZe3DgFYqDTDYKKQgu2JYIYnHaNvv5yxtWRMgYxZnq/7Qj5QgMPNfHa3s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6216
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,intel.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,driver.name:url,lists.freedesktop.org:email];
	RCVD_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	FROM_NEQ_ENVFROM(0.00)[michal.wajdeczko@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: 12AE41AFD95
X-Rspamd-Action: no action



On 2/26/2026 5:31 PM, Satyanarayana K V P wrote:
> When the PF is configured for admin‑only mode, it is restricted to
> management functions and should not allow users to run workloads.
> Suppress device capabilities to userspace in admin-only PF mode.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> Cc: Dunajski Bartosz <bartosz.dunajski@intel.com>
> Cc: dri-devel@lists.freedesktop.org
> 
> ---
> V3 -> V4:
> - Suppressed device capabilities in admin-only PF mode. (Wajdeczko)
> 
> V2 -> V3:
> - Introduced new helper function xe_debugfs_create_files() to create
> debugfs entries based on admin_only_pf mode or normal mode.
> 
> V1 -> V2:
> - Rebased to latest drm-tip.
> - Update update_minor_dev() to debugfs_minor_dev().
> ---
>  drivers/gpu/drm/xe/xe_device.c | 14 ++++++++++++++
>  drivers/gpu/drm/xe/xe_query.c  | 11 ++++++++++-
>  drivers/gpu/drm/xe/xe_sriov.h  |  8 ++++++++
>  3 files changed, 32 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 3462645ca13c..7bf462eed917 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -25,6 +25,7 @@
>  #include "regs/xe_regs.h"
>  #include "xe_bo.h"
>  #include "xe_bo_evict.h"
> +#include "xe_configfs.h"
>  #include "xe_debugfs.h"
>  #include "xe_defaults.h"
>  #include "xe_devcoredump.h"
> @@ -213,6 +214,11 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
>  			  DRM_RENDER_ALLOW),
>  };
>  
> +static const struct drm_ioctl_desc xe_pf_admin_only_ioctls[] = {
> +	DRM_IOCTL_DEF_DRV(XE_DEVICE_QUERY, xe_query_ioctl, DRM_RENDER_ALLOW),
> +	DRM_IOCTL_DEF_DRV(XE_OBSERVATION, xe_observation_ioctl, DRM_RENDER_ALLOW),
> +};
> +
>  static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
>  {
>  	struct drm_file *file_priv = file->private_data;
> @@ -442,6 +448,14 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>  	struct xe_device *xe;
>  	int err;
>  
> +	if (xe_configfs_admin_only_pf(pdev)) {

maybe we should add a note why we have to use configfs directly (and not 
a helper introduced below)

> +		driver.ioctls = xe_pf_admin_only_ioctls;
> +		driver.num_ioctls = ARRAY_SIZE(xe_pf_admin_only_ioctls);
> +	} else {
> +		driver.ioctls = xe_ioctls;
> +		driver.num_ioctls = ARRAY_SIZE(xe_ioctls);
> +	}

you shouldn't modify this singleton "driver" as its pointer will be passed
to devm_drm_dev_alloc() and will be referenced later by the drm code and
in case of multiple devices, above overwrite will mess things up.

as suggested before, define separate "driver_admin_only_pf" struct

> +
>  	xe_display_driver_set_hooks(&driver);
>  
>  	err = aperture_remove_conflicting_pci_devices(pdev, driver.name);
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index 34db266b723f..1416ab7be809 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -215,7 +215,10 @@ static int query_engines(struct xe_device *xe,
>  			i++;
>  		}
>  
> -	engines->num_engines = i;
> +	if (xe_device_is_admin_only(xe))
> +		engines->num_engines = 0;
> +	else
> +		engines->num_engines = i;

shouldn't you also modify calc_hw_engine_info_size() and then skip
buffer setup?

>  
>  	if (copy_to_user(query_ptr, engines, size)) {
>  		kfree(engines);
> @@ -297,6 +300,9 @@ static int query_mem_regions(struct xe_device *xe,
>  		}
>  	}
>  
> +	if (xe_device_is_admin_only(xe)) 
> +		mem_regions->num_mem_regions = 0;
> +

same here

>  	if (!copy_to_user(query_ptr, mem_regions, size))
>  		ret = 0;
>  	else
> @@ -419,6 +425,9 @@ static int query_gt_list(struct xe_device *xe, struct drm_xe_device_query *query
>  		iter++;
>  	}
>  
> +	if (xe_device_is_admin_only(xe))
> +		gt_list->num_gt = 0;
> +

and here

>  	if (copy_to_user(query_ptr, gt_list, size)) {
>  		kfree(gt_list);
>  		return -EFAULT;

and what about query_config() ?

> diff --git a/drivers/gpu/drm/xe/xe_sriov.h b/drivers/gpu/drm/xe/xe_sriov.h
> index 72e55543c30e..be426afa90b1 100644
> --- a/drivers/gpu/drm/xe/xe_sriov.h
> +++ b/drivers/gpu/drm/xe/xe_sriov.h
> @@ -37,6 +37,14 @@ static inline bool xe_device_is_sriov_vf(const struct xe_device *xe)
>  	return xe_device_sriov_mode(xe) == XE_SRIOV_MODE_VF;
>  }
>  
> +static inline bool xe_device_is_admin_only(const struct xe_device *xe)

rather:

	xe_device_is_admin_only_pf()

> +{
> +	if (xe_device_is_sriov_pf(xe) && xe->sriov.pf.admin_only)
> +		return true;
> +	else
> +		return false;

just:
	return xe_device_is_sriov_pf(xe) && xe->sriov.pf.admin_only;

> +}
> +
>  #define IS_SRIOV_PF(xe) xe_device_is_sriov_pf(xe)
>  #define IS_SRIOV_VF(xe) xe_device_is_sriov_vf(xe)
>  

btw, we may also want to double check that setting from configfs was valid
(we are really running on the PF device) and abort probe if not 



Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4LaDF1uRcWkLJAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 03:54:19 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8D1611AE
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 03:54:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3972910E004;
	Thu, 22 Jan 2026 02:54:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ul9mooD9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCDAF10E004;
 Thu, 22 Jan 2026 02:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769050455; x=1800586455;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nZQxGWpHfWawTV5HijWXoCOHZTI3vGEyJvxNAalrF7M=;
 b=Ul9mooD9QA+Zg+CIM0zo9D07KlX9uCD+EuPsyAXO0f7D+4eOdCD72ntZ
 aWbjzeViJhWYuL+sAGBde5OxWP9VGGAgst9X+N6RgoSyzWH7fbODnsBGR
 cJ4C9PZqEpp305gjOT2NChX0lOycFw/as+gwSuyVGyRVioDOGTi4DQd2l
 pJulNazW1lmhdnUe+t0n/syatSGs9PafR7mNDuqxxCwGPl+OlscC6RXSG
 BfBrAyD/avcIoM0fRsCr0R7j9x/i4N+BVXjVVa+9fXkhlO/nvYvl/n8o+
 g0ZO1Mhnq5T4IbFKryLUeehh4GVQei4YLinZn1n7VCzkB+9Er8A0HjAYE w==;
X-CSE-ConnectionGUID: Q6j1lKdJTBSlNnLAVX6lqQ==
X-CSE-MsgGUID: csAUERlAS/KyhrxPx4WK8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="74140710"
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; d="scan'208";a="74140710"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 18:54:14 -0800
X-CSE-ConnectionGUID: lBi7KsHvSbyCTkMdVO8s6g==
X-CSE-MsgGUID: aAGlfOGLRaeUm5Vd3jYNTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; d="scan'208";a="211128578"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 18:54:14 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 21 Jan 2026 18:54:13 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 21 Jan 2026 18:54:13 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.51) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 21 Jan 2026 18:54:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jPr54kEdVgjmW451+G7rzlA8x8gRVLNL+qnxr7pn3xnGpSL2qF2XfFJMHbckwnO28vcB2dRN/20VqWbBuNZQbjS83SGmE/ttR2hVzY4SGeOQFNA/tscwIdf3PIXu6ZG/G3/FiByxXp9344v30+dVbNGPXkJuOkvUbTFxFMBmBPa78X9SUHlaPfsQlUYLOaXOxhFbwNZtvUShKD+TctlWUgIKV57TIJCFUtIrDhOzPPc5Sir8CGPKV0tgJVktlCMvcp44lv5GzQC8gxRRyTeqhgw+KcED+tqYfsb6zpM/HtBgHqC7+u63JU87EvK2pu6OlInTL0QFViaWap3fHXaW7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jImiL4QFyTlCVYpywK2SV5m7GAcOLgq4B0uTWzGc5kc=;
 b=D4uwLHZTxq0aG+WimyKtf7GazNTcK9duXXv5Zjr8xHvZ5fAFoFZkVRKG6omk4w4822hibq1JfZ+9CjHRENcsh+gskIfgVeRT5YeukNSMC0hRBX/s8hE4rFlPM+z3uT3lqvcbvwUZSDmSreqqau+HW4ZPoDP46mcEVb1aJ7WMEjnDHOgLN8SZHCqRguoJWlTmK8EJFI/iIuKl+TYSCZFUdH0E9qtoNk/+wHvs22K3cRHylXX6nH9RMrlvMzDRRx8su+FaX0GvHAEPQ22Gz/nrhbYVYeKSfFaNQaxorgWhNhmUAnGTRngRz7hv6o/i8d46/yhhNH2wshYfvNl/dK17/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by SJ0PR11MB5023.namprd11.prod.outlook.com (2603:10b6:a03:2de::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Thu, 22 Jan
 2026 02:54:11 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%6]) with mapi id 15.20.9542.009; Thu, 22 Jan 2026
 02:54:11 +0000
Message-ID: <d481788c-227f-479f-bc2a-7e30d55832bd@intel.com>
Date: Thu, 22 Jan 2026 08:24:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/5] drm: Define user readable error codes for atomic
 ioctl
To: Xaver Hugl <xaver.hugl@kde.org>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, <harry.wentland@amd.com>, <uma.shankar@intel.com>,
 <louis.chauvet@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
References: <20260106-atomic-v7-0-d51d9a351684@intel.com>
 <20260106-atomic-v7-1-d51d9a351684@intel.com>
 <CAFZQkGzQ3GmUHibTJS2xCWsya2=Bh_Uo8zjqN5f_K4HMdfpHCA@mail.gmail.com>
 <CAFZQkGwdpfEzv=210AQxBhqauj4NmSQCb1m1xfD1+e6rsTrwow@mail.gmail.com>
Content-Language: en-US
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
In-Reply-To: <CAFZQkGwdpfEzv=210AQxBhqauj4NmSQCb1m1xfD1+e6rsTrwow@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0093.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a8::16) To IA0PR11MB7307.namprd11.prod.outlook.com
 (2603:10b6:208:437::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7307:EE_|SJ0PR11MB5023:EE_
X-MS-Office365-Filtering-Correlation-Id: 601add7a-1f4c-4859-0cdc-08de596184da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z3J5NkFaaGExSWgyZDdJNll2SVlGYzhSYXZtMXNqa09kZ3VRSTFkMS9qbmRa?=
 =?utf-8?B?Q0drSEp6SEVDMmx1WktBWUN4dzdpWXFwdnlodGNkOVZpK3dsVkt2ZktRWG1w?=
 =?utf-8?B?ZFJlQmFOcDlGNDQyOUhIU25udDVibTMyNEVMREZTSnZ3UFBrUGlSWnRLeE1B?=
 =?utf-8?B?azh2blpqY0EzRjFYNWZEZzVNUm5vNHRqM2ZiN1h4OEdkeWZSSTc2RWQxWU5F?=
 =?utf-8?B?TTR2bmVOS1d0VklRK3p3NncreW1rZ20rck1sTkVybkdXa3RhYmZCZm9OQVdy?=
 =?utf-8?B?dWtPdTlHSktkVUtxeVZxQnJETzBPOVJDTXdsVkRQRjRwQ2RDKzAxK3g0ZzAx?=
 =?utf-8?B?bHhqUEdwNlNTV2IrZldMcGo0bnk5OU84Z29reHN2UE9XZms5NnRSNDVBQXNq?=
 =?utf-8?B?RjM5ckpPdGxhTTk2Zmt1T1lxU2lhaE9BOXR2Rks5cmNoZ0NnM011OU5FUi90?=
 =?utf-8?B?UExYbFRVMVp4SE1XMXJ1Ym5weU8xN1g2RjBoaDFFWGNheHUvUWltdi9yNmVR?=
 =?utf-8?B?QzArMmJWVlZGMXAra3k5eTFGMXBxc3poUlAxT1QxK2JmOUtoUVoyU0FBVi9O?=
 =?utf-8?B?L1g4TlRCN05qVGZXWFFOWHhMSzhMUEJQRmEyMjlVdmtqL0NuSWJSb0JUVXJt?=
 =?utf-8?B?OGFELytqZ1g2ZkIrMEFkUVhjVXVWQXlsbGRtZm5aZXVTUVVtc2JNK0VmWDVV?=
 =?utf-8?B?Q1cxOUE4Q3EvNmlId1JieEZCbHVRRXhkc0NrZVAyRnE1ZFZCcGxVa3dvUHhw?=
 =?utf-8?B?ZGxOUGZYMzV0amM4elVXZ3BGNGllQ1lEdUlTeVd6Z0pzbTh2Qlk2YSthUVVD?=
 =?utf-8?B?SUtQcVNObHhDNmxrTm9BVlZndEdrRVpBTnF1S2tqNEg4YmpuSnlkbzZacW9V?=
 =?utf-8?B?MlBKZzRrb1VNUDFUMGNwN2pDTEZEU3kzMDNlYkxUL0htSkgwMFNoUm1uT0Ey?=
 =?utf-8?B?eGlNMDB3SGVCSzlsWjgrSEQxV3hPSHcvbWZMS2lURFJ6L0tWZUNMK0tBdE40?=
 =?utf-8?B?RHM3YmpSOWlRT1FROThBTVIzcmpyczNQWWxNZUpTSUJGYnVWWUd3OHlYNnFJ?=
 =?utf-8?B?ckxtWUhVZXZHOHc0anl3VjBOZkJOTndUKzRRRXhDRVVNM2dGb1d6ZEtEWXE4?=
 =?utf-8?B?WjhWMHBHWXpxbjhTMGM3M2RQaGZ5ZS9SNEFZVzNtMTZlZFdOc2FXa01lT2NS?=
 =?utf-8?B?REF4ZWVxWUlwcHl3dzMwYVV0NHVEV050K09QL0JBU1llQitpVmFtRUE5YTZl?=
 =?utf-8?B?SHhnR0lvMzloQ3hYZzBYZ3lTS3RYZWZFZmR3S3VwUFdiU0hHcXZaU0NyMW8x?=
 =?utf-8?B?SVV5eTNsVXRKR2FKS3k3ZGh2SCtRL0MyNnpMWld5dzMvTjdSbUliVVdKTGp2?=
 =?utf-8?B?R0FBU1M1NnE4dTNFZlFqY1dTd3kxVzFHKzhWczJLU1pBbEx1L3Q1b25yOXRW?=
 =?utf-8?B?bm1JUk15NnRhS3Y0MTQ3RXM1OS8wYVFSZUJVSzYyZXV3L2hGNlBGTVZGNVda?=
 =?utf-8?B?a0VlMk0yMkptckNPM3lJczFIM1E3eDRqWmszQnlrWSt5Tm5iKzZYK2xFcTZK?=
 =?utf-8?B?a2RKaVBMRFltdVFUNGk1RUgvVGJLN3VYa2psSGMxbUk3bVN1cURmbzZZQ0VD?=
 =?utf-8?B?S2owbytCYWVJVVRnK2N4TnlCRlVaWkYyQ2hvYTJaektuWkRyU1NrYnQrK0lC?=
 =?utf-8?B?Zy96aUVlZDBpa0NMSE5zRUdUU2NyVE1FNXFKVWt3c1Z1c1QxL1Q0Ny9KRWRj?=
 =?utf-8?B?L2NCUVlKbHRQT2k1bnFoUUlrWHpUelo4RFE3NHpzVmRiVkozWjRWTWh1d1hi?=
 =?utf-8?B?SS9sM2s4VzRkYmwyTUlDTk51YmRSczdHSEJTWUpYU1BSd3I5STRrL0hxWlpv?=
 =?utf-8?B?THUxbHd0Qy9udm9KTkErK3RkSDZPT2dDaE5DSS9xNTJLZDFGaEJweVF5UWdr?=
 =?utf-8?B?R1ppVFYwVWJ0U2dWZlA1TTlwWS9WUE1EYTVuaXdhMFMvcjdiWC9JNXluaTY4?=
 =?utf-8?B?cnR0TjlOcnVoUncybTY3ei9LMG10ZmdCQ2xjVys4NEExbVpLQUNiM3BlaStm?=
 =?utf-8?B?cVFodGdZeFR6R0k2OXlJOEVBR01ENFB1SnlSN3hyVTdNVDB3WVZjc1ByL1I1?=
 =?utf-8?Q?P+AE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWRMdVRoMEdWNWN3VXZjZnRkSHJYMDRCZFlxbmVua1NUaDh1QTFSZ0dnK1Ax?=
 =?utf-8?B?WEhLN2FKU3kwRjBmYTdZQlZCdURJZlVTeGgvT3MxbXFaQWNtc3Q5N1AyTDZy?=
 =?utf-8?B?ZjdSSVB0ZWJmUHhnU0tTQmQvUGZKSzRLSVhyU0tWcXQwNFBha0NQRzROOE5Y?=
 =?utf-8?B?Ukg5MTh4Z3FZd0tSRFIyd1V0OUd3bndBRWlmdDkvNWJDbnFQTWNNcU5zWFVY?=
 =?utf-8?B?b1M5QWh3MnNKbUIydktGMmZIS0RZZUxSN3VnS24wYmdxR3FmRUZRYVBXSit4?=
 =?utf-8?B?UExxU0hHN2VrUVRnSmtZVVBlUklnSDFyVnFEOU5jUS9GR3VZM1NoUmxVeWJs?=
 =?utf-8?B?UXVBM0RZbE5mUjQ1WHVzYjF0VkRYZFlBYU5PWklCak9WZ2t6NFFEdW1QL2R1?=
 =?utf-8?B?VFpzK3F3NVVMaTNHK0NwUk5xSHJNamE3ODltSmlqOW9WTGw1UEVKUGk1dEVH?=
 =?utf-8?B?RTN3NFJMRElsM2piT240VnBxVXhDbnBhL2RoaVIwOEpFaWl5TUpVZVlpY0ps?=
 =?utf-8?B?ZXFaL1orS2QyVktPeWhvT3ZzU1UyWFFMZVZJRFpJNWVGV2w3aEVFbXdtR1BI?=
 =?utf-8?B?MnA4WXJ4eHo5NExDbkF3UjllVGY2VWFvN2hpWjA1bFhJbm5LV2RHTXBkQVB0?=
 =?utf-8?B?S3JOdDhqOTFpZkxjMEhQVGFqOTFLdmZMQU93RGdVcmQ5UzhVc0xMeXRmZTdk?=
 =?utf-8?B?Zlg4K1MxRk9YMDRHSTNqVEN1cnhsWDBzT0xVaVdFbGtzNG1PV3BVcHhNQXkv?=
 =?utf-8?B?Nk1kRWJtU0MyR3lZS3cwSFZ3TjMycWs5TWdDSTRRL01ndTUzWWtWQndkUk1W?=
 =?utf-8?B?NFRmeW5KN1dGdHMvRmVHNXJhcjNLNXExMXoyN2RyeklsU2N3bHZwNFlaK2gw?=
 =?utf-8?B?cDltTXgrRW9lRTVZdE1ORk1waytZZ1NvOVFDUWozZGlPUVRiSlptOUQvTHpF?=
 =?utf-8?B?M2JSOGxZbHJHRDd0alpHMlhGOHpDbGgzeVp3dVN0b0xqME1tNnJlaUxCWUZB?=
 =?utf-8?B?ZTAxUUpmM0prR0VPZjBuc0F1RUs5VzlVblRwQnkxSjZVdHZPZVU0alNaN2Vl?=
 =?utf-8?B?dWE5L2VQb1VkMzZWWHpGNEFwd1R0dFlZZHI1M3Z4WVE0RXVsQUt1RlFDcVMr?=
 =?utf-8?B?YXNQbW1rb0dNUzZYUGZNVkw2Tm5BaFVUK2xsYWl0MU04VWtnNUJ1NTAvQ1pB?=
 =?utf-8?B?RkZrRU5qcXNBREJEV3VHTFpTMTIrOHFEd3A1WmI4bExCRHZmZ2tZdHcwTUIr?=
 =?utf-8?B?YmM1MGJrdTZQNGhNbGUybDVONjRTakNPN3lxRzRVK3oraUVrOHM3YTBuODEy?=
 =?utf-8?B?dGJRTDVQZWIyL2ova3JISEtqSTZMTmpMT3g3eDd1T1B5cjVwMmNEbmJsM0Q5?=
 =?utf-8?B?cUdST080eWYzUWxiQ3B1OXpBazE2MXlTaXJhTk5KSzdyYkh0Z29oL2ZuZnpV?=
 =?utf-8?B?SU5WRjRjblRTN1crWjlEUFJSSnRpWFFnQWJSTTdFYmhMYUttdDQ2SVpsTFhx?=
 =?utf-8?B?QVRLOVNOb2M3bXlXOVVMK3Exb1F6bW91UWw4elRFMWZVY0VwZ1hnZWU2MTBT?=
 =?utf-8?B?dTdzM21ybHh6dEhBVFlHUEN0U1BCd1BodXJ4ZXJSV2xPN1pPZ3JDNzJNUzFh?=
 =?utf-8?B?dk5rSjdNOTkwQkVkK2N1citWVFZKV2hFTDFTUkxLYmpMekZNQnpZNnVVTXBJ?=
 =?utf-8?B?YVVqcldZWTRrayt1bnhBQlhrUDZhL09nbE5yOCtNSmJpSUNMS1ZMTUtUWSs4?=
 =?utf-8?B?djNTTXM0RnkyM3RpdzU4Y3E2L0dlUmQ4RFBNQlBNdkNUNXpoM0VSZUJLZ09Z?=
 =?utf-8?B?bXFJYUpVMkZCYks0R1owdTluajhVek05eTJNUThtNXY3NEVnN1dUOHQ4emZy?=
 =?utf-8?B?amF0M1NIZDB4YnJBYTh3ZFN3TGxkcWs0elBKT2V3QTVNdzdRU2xwYmdBRFRL?=
 =?utf-8?B?d3hKcllzN3Q5Q2dHcDlFc1NyUGVCTG16Z2JXREhPdlVjeEtaT3lERWZqV2Jj?=
 =?utf-8?B?bjFhbFJXTm1FTUg4eU9KYUpOekpjSDJXUm9tR29GZmRuR3MvRmd5cnJ3Rk5r?=
 =?utf-8?B?cGdycGdvTXgxWUlEWE9yb3VmZHQxNlJUaUltWkQwTVhLdU5NUHd6aXpmQU94?=
 =?utf-8?B?WERUQTNXaE9Hak5DNml6M1ZwNDFYQktDTGVQQkt6QlVWQ0NScjhNYnBzdVJO?=
 =?utf-8?B?ZXVibGVJRzRXY3VVY3hNMzNoUy9OS0h0WTFPL0FIVGNZVnRTeHhNanFNc3VN?=
 =?utf-8?B?aVY5dXBZUGVQLzBnQlJPZ1RsWEFZSmthM0ZBUko5TUMvUjZiOXJRWFhkOE9R?=
 =?utf-8?B?L3lNUllVWUY3RVg5dFBnL2Q0WEZTZmliaDZJVkF6MHdHK29zNVF1QT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 601add7a-1f4c-4859-0cdc-08de596184da
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 02:54:11.1887 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U8LXXwR0IqNAGRzADIgp1srcabXL8hb9WoOLUrKB5LOr8O29XYy9pQJJy0tzBShlEyi2wh3+BTmtYzLemocDlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5023
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
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[9];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim];
	RCPT_COUNT_TWELVE(0.00)[16];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FROM_NEQ_ENVFROM(0.00)[arun.r.murthy@intel.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,intel.com,ursulin.net,amd.com,bootlin.com,lists.freedesktop.org];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: BB8D1611AE
X-Rspamd-Action: no action


On 21-01-2026 19:28, Xaver Hugl wrote:
> Oh, I just noticed: It would help if we had a CAP for this, so the
> compositor knows if the new API is supported before doing atomic tests
> with it.
No new UAPI is added for this and would be enabled by default with 
atomic ioctl.

The reserved field in the struct drm_mode_atomic would be used to return 
the error code. If this value is zero with a atomic_ioctl failure then 
eventually should be a older kernel where this feature is not added. For 
every failure on atomic_ioctl an error_code would be sent by the kernel.

Let me know if you still think a UAPI is required to get to know the 
capability of this feature.

Thanks and Regards,
Arun R Murthy
--------------------


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5712BD0A36
	for <lists+dri-devel@lfdr.de>; Sun, 12 Oct 2025 20:59:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95C4E10E0A5;
	Sun, 12 Oct 2025 18:58:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z/+mwNmO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE26210E0A5;
 Sun, 12 Oct 2025 18:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760295539; x=1791831539;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xgCo22Vc2JREORb8BE+/Jqc+CsUffvL+LlBGi2CInPQ=;
 b=Z/+mwNmOEhZulfF7tznSZtxnwF4njwLGWNrpOahNwdDaDcz6FylR7mkw
 Av7KgSQ3AZ6gxFpmqOVoTlfkQ71oVy02ZlNKCj114CE634JAEgZaZAyS+
 z0lVrmdxEvnsB4q6jrai34W7SyThh1pr49dsb0GKkIrAJ0xkok82eU+Pd
 UvR4aID+388A2epUi+n7ZteRcTlizrKYkddNbLOg2UKiL7AeWyl9B39od
 vCXjXlkkwQEJp5tQSU8Zr/P3SbP27mULopTseGIGrv7ZjjfVR3DPSazvM
 3248jrj7/sP8RVeMVFxW/BHt0/vcc/TVfEbyXFMgAZOYlI5cRETWrxZxU Q==;
X-CSE-ConnectionGUID: ccV3RJkhS6aFJqjT0so/EQ==
X-CSE-MsgGUID: R87IVpQDTBeI5cBiNypMdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11580"; a="62140012"
X-IronPort-AV: E=Sophos;i="6.19,224,1754982000"; d="scan'208";a="62140012"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2025 11:58:58 -0700
X-CSE-ConnectionGUID: 1rpqxujsTB2W2NozSR+Geg==
X-CSE-MsgGUID: Vl+EWMDcQfuuVFygu/VcAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,224,1754982000"; d="scan'208";a="185829162"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2025 11:58:58 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 12 Oct 2025 11:58:57 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sun, 12 Oct 2025 11:58:57 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.67)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 12 Oct 2025 11:58:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xb84KV2iQP/PAEBcqDezhUgFf8NNr0YrwfyiTIzJ5mjfTGibiR1pSuxtOiyx1iKOgfGDoOBNUy1DfGHQiUAsQI7mugX506yjjPoOyHE7PApRJYet9qYXzCHC6HpqXQR3CqrOJk1i0ulwcdYIkipey7VcolQIX9fJx5YDYz5Jat5Hkfb+GoUn3KtkItY2AaJj/8wZ7L4JE+nTU/BtuEtwwDyJuJPNCbVeiaA0GHo5H6feKoqIbq0ZSCtCBXzLcjkeXps3LgvG62xGx2VbWQs9lAbNEVGZXdxPjHMgDJug5S2e/cRY0qny4GjWzSiS7VhOJk9dC4/naqzW1TZm1vgFAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sO7FVHJYvdrXoQLR7P675kZejSvULyLakX+zveEdLA8=;
 b=QX3ORZzjSuoOnf50igzUUDPjShofy1fWYXqez4/zihzu6kKJBSwaxS1W0iNHYtDuQ49iltQPVbZVsmOyVy8Sbs+KUdkl1BWv1X4kWUxW688B8zyV3jT8ItPefMDPpmnT3O4xFDTQ3e05QBB3SWy6ywF0fY0hVb9vyp+pxDPDE/mkJzt1UWl7AMnMwJVaDTZ7ZWwx8mbiZfonYwI0zO07pNolQCqWYDKhVSJKb0RUyxrCPvP6BSKDt2TYE4a1U7HCFHgCKXjD0N4CmZ0LENiHpaBf+wMQnvof3FjbDdAsjXmnwdXLzxL4sNslSJ8/Sahrr1onWdQzNo3tl6wDSnnvzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV2PR11MB6024.namprd11.prod.outlook.com (2603:10b6:408:17a::16)
 by DM4PR11MB6216.namprd11.prod.outlook.com (2603:10b6:8:a8::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.11; Sun, 12 Oct 2025 18:58:49 +0000
Received: from LV2PR11MB6024.namprd11.prod.outlook.com
 ([fe80::dc22:ef1e:53e2:f00f]) by LV2PR11MB6024.namprd11.prod.outlook.com
 ([fe80::dc22:ef1e:53e2:f00f%4]) with mapi id 15.20.9203.009; Sun, 12 Oct 2025
 18:58:49 +0000
Message-ID: <d647da55-9b6b-40fb-95c3-53912fb07a76@intel.com>
Date: Sun, 12 Oct 2025 20:58:42 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/26] drm/xe: Move migration support to device-level
 struct
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>, "Alex
 Williamson" <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum
 <shameerali.kolothum.thodi@huawei.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>
CC: <dri-devel@lists.freedesktop.org>, Matthew Brost
 <matthew.brost@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Lukasz Laguna <lukasz.laguna@intel.com>
References: <20251011193847.1836454-1-michal.winiarski@intel.com>
 <20251011193847.1836454-3-michal.winiarski@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251011193847.1836454-3-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE0P281CA0012.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:a::22) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR11MB6024:EE_|DM4PR11MB6216:EE_
X-MS-Office365-Filtering-Correlation-Id: daab2c1a-f3a5-401c-ae2b-08de09c1601e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TXJJeks0UHNVM2gvVlEzSzRBcTlHNldibWJxVnZhUkNSSXVkWmVBOXNCeGlY?=
 =?utf-8?B?VHd1ejVSVklsUWg0VXpZTFp0SUQwWXpndVlqVmlVSkVwM0RyL2tvZ2UvV2I5?=
 =?utf-8?B?aFhjZ2JqdlduRmprVGhYVEwzR2FqV0h0M0VHUG5WbldaUlExMUhsUkNpVzFU?=
 =?utf-8?B?T0ZuTlM5REpEV3V1VG1rNzBPRStCY05wamR6RCsxbjJOdUpmQlhrcUNtbmk2?=
 =?utf-8?B?OHVtbzJ0cUp5eElSNDZMR0cyMGp5c041dEtvZGJ3Z3NwVEFNUWtSa015dmN1?=
 =?utf-8?B?dGpCMzdYbzROK256YUxJdGFDd0o2QVFCdExlR2NMSEx3d2N4b29tWnFnWHpl?=
 =?utf-8?B?Skl3MmNLSVprc1g2KzNHZUdCRXpuWFdaYUxPcklDV1Iza3BrZlZlTEUyY0Y0?=
 =?utf-8?B?TEN1MXp3OEVqdTBQOVBEb1FWZ2U1Wk0xenlMS1ZPSFVONklJOG8zdFg2dllp?=
 =?utf-8?B?V3JvQnExNTV1ekFBa0hORjlUc1VoWGFCSDVTQ0VxVVZnUHhsbnhjQWtVUXdu?=
 =?utf-8?B?bFJmWmNocm5tbmlUcGN4dVNvcmJPR2R5NVA4T2k3MGlqTEVjaFBudmEybEpY?=
 =?utf-8?B?WVhTcjBlQmtlZWpBWENuQVVEVmVyTmlXNG44Um9OdXR2TU9PSTNFb1NzTWpM?=
 =?utf-8?B?RXk0TXp4U3l5SjFCNXNWYk5uWm1lOHZqTTVtRlJ4bEhROGcvaTJsQlRPVUVK?=
 =?utf-8?B?Zms5VGw5NXQ0TTdHTnJzb3NSa011TTUrSHorMUdXTUV2L2xPODMxcmk5bFgx?=
 =?utf-8?B?ekxUai8zN0R3Z2VPL2VSbG52RFlmaEZESkVZSkFmTStSMjhzUnVya0lwTWE1?=
 =?utf-8?B?WXQySjRzQXlEQVFFYm1HVkR5eEZTcUg5V0tGWkw1Vk1wWDNsUWp3Y0E3SGFq?=
 =?utf-8?B?Tk1NSm1zcXRnYjllOXgyNVlvaTlGVE5RTGhkR0dPSHQ5ajNScVl3NS9BdnVE?=
 =?utf-8?B?cmVPTndlUktTNmlSU3J5NWZaYTRaSWxqN3gxd3pwOHVnMWRyVXV5dWk4aDEy?=
 =?utf-8?B?YjdMVFUvczFMMVQvV1Eya1k4U3VZMFVJaTZ5cXdwQWlFaFBTdXRoSkF2VUlm?=
 =?utf-8?B?L1dWeTFDa0k2cTlUMVZvMEhNcWRyNHJlZWlWcldLd2U2b2xEbFFPcndqYTVu?=
 =?utf-8?B?OWQzTDYxSFhUQWtiMGVhK2kvc0o4YmIzZDFGZW5IWVRleVAzQUhsSXdMQWVz?=
 =?utf-8?B?eGxNdW5MeHVBbXA0alFqYzgwcnBHaDIydVdCblBLdjFCQ0luditwWEg0UTJF?=
 =?utf-8?B?bkN0RFN5TndXRXVraTdBTVM4VWZMRWFLUXVOWUlFNFl6ZVFYMlFOOW9LejB0?=
 =?utf-8?B?Wkx3MVZIWXFQTit4NUZHbmVqU3d0ZmFKZWttNFZETlFqRE55bTdPRHVTWmtu?=
 =?utf-8?B?anV3bGNWMkszU08rRG1MVEVxWWordVA1NlVHYkFJbnJUd1p4ak9sTWVPcE5p?=
 =?utf-8?B?aTBmS0RLT2Z5YldMNXBEaTNSTUdpTmxwOUZFRmI4bnZkUXdwWHpLUkx6NmFP?=
 =?utf-8?B?QjFJWk4vdmlIWUxZNE9ON0hOdVBVbkRtMzhueHVyUkFjelFuYU1uc2xtQkk4?=
 =?utf-8?B?TnhKeDNxN0IyMHJzd3U4ZDllVlhvL2U3aGVGRWpZRmRTZ1R0bkozQ3h3ZDJD?=
 =?utf-8?B?T0NvdU1YVytKRDNIQ09JclprUU9sb053dlROcDQvMWJqWVdhblZYS21QNDRO?=
 =?utf-8?B?bjcwbW5lM3ArT0JJLzAyaC9pT1E5SUFaYi81L2lwQXd2QnJEcEpGaXJkUVZX?=
 =?utf-8?B?ZHg3WjYrMnpiZmgvbVQ4a1c3NmhCU1c3Q0h6VUh0dXcxRWRLakNoQlVmUHVi?=
 =?utf-8?B?cjU2ODNFRlU2VUg4TXJxR09XL3ZWb3NFdUt3cWRZcm83Zm5rSFVXVXFkOHNM?=
 =?utf-8?B?cDR5a3JDUTJ3QVFoOFJaTG1LT0xkNGdnRHA0TTlLTnFrZFUyckFoMkxCNTIy?=
 =?utf-8?B?Tm5RN2wxdmpzeVFZSzE3Tkc1WHRLY2N6WURQQkV6V0UvSGFmZ2Q0QWpaNEVG?=
 =?utf-8?Q?P5G4m+Yyjxd7pRxHmf/mWLy2go/3kc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR11MB6024.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L3lyRHJuNDBJMk9jUVRodXU3UExYeXdqZFBGMFVGUUREZXRhaTBvQkt1Q0VS?=
 =?utf-8?B?L3ZPR1BTRDI5SzlLcVN2S3Bud0xQN0JUU0x1ZWs5cWk0QmFIYUFRZGh4N0Rl?=
 =?utf-8?B?WGNuYWlMOWQvU2lLOS94TWl4dndYd0Q3blBuNTFUclNlZXNkNmJSOXl3cXlv?=
 =?utf-8?B?VDJxQjhpelZFbWoxRmF1ZGwrT21Jblh2ZFRjNWQxVWZEUHVvWGdaajMzTHJi?=
 =?utf-8?B?bUZaNk95dThTcjkvQlNWVjdyOVpMd2lLMnN5Wlo2ODhjZEVicGNTN3lnSXNl?=
 =?utf-8?B?RG1yZ3ZadlhGdTBCVDNSTTdJQTk0V0VGQ1hZTW91VG54a2JIcnM1eE0vZzFy?=
 =?utf-8?B?VG1vWmlZTkNqeDlGSWVNZHQxRW1FR2hiZkpIWEJja24xQlIwcGhIdmZ4cnN5?=
 =?utf-8?B?VXEvV1Q5ZnY0R1JUck5NSjZCZXJpWEVCL1JIeFdLdENFUG9kUlBFb0tvMGov?=
 =?utf-8?B?QUtTUXJXN3o2RDZhY2dCMmlJa1pEUXRnbUljR2RoUGhQVzFEZFpiazc2cG05?=
 =?utf-8?B?YnFFL01oYU5QWkFOUHpHRTc5SWtBdlVtckhoSDNQMmFrT1BTWTNYWDl6MmF2?=
 =?utf-8?B?VVp6QUcvUWZtSHcvQXBFTElLby9ndG4rOWFDYi9UVkFWRHErOVhBcHVZYU1k?=
 =?utf-8?B?NHBNeXZpSHBaWVhKdmQvOHZjcjRnb21HS2E1dVpjelJJb1FlS09PUHk4WGMw?=
 =?utf-8?B?eUFpZ0tqYWw5aExIOU9jWmpkUlFwM244UjhTdnpGRU05dzVaUWoyM0pHcWhT?=
 =?utf-8?B?RTM2Q1FCOFB3cnB3TGJZK28xNzRXZXh0TGNtUnl2cWwwV1JacFI4N0FUcHJ2?=
 =?utf-8?B?T3JMeTlvMW1FdXJldURTOWU3VVhScndKRXAyekFhT0l0RVBzRCtVSyszZHY3?=
 =?utf-8?B?WW8xU05XeUErOFE4dWd4VzJWQzdUNTNrS0xraERIZmdXbUZ3RVdicFg5K2RR?=
 =?utf-8?B?TGdxRDZJUi91U0ZOVENtN1c0R1JjbFpaeFhJazFUWWRUQ2NUTGN5WXpkSGR2?=
 =?utf-8?B?SDhyUXVSK0NYVjlXUEJpZUZSZE1kWEo1N1NpaG5zTlR2VUltdE00MUVBbzZh?=
 =?utf-8?B?UUVQZWMydnRnR25yd1ZsMWFuRDArNi83ODUxOVJ0Wk5RT3lwQmtERHNTdCtr?=
 =?utf-8?B?YkNSZVo3KysybG5mYm9zV3VwL3NibHAreXpRc3lONXhIV2ZUV2h5YlJvZTl0?=
 =?utf-8?B?MEthbXZKeXdPenVGVFU4dzhhcktDRGdHOEdxR3d4SFJlYnVPVEcwNGpJMmFF?=
 =?utf-8?B?QUlwUVIwcjdVL0tHMUZrbTNBL0VvODlHcmlkSWt1MkZVUjhmQUlBd1Y2Mi9v?=
 =?utf-8?B?VFlxbXdKb3lncE13TEpOb3k0L1phMVlXcU90MTUxNktYVFFwa0FaVVRLcTdY?=
 =?utf-8?B?RFQ2MnRSckZuWXdjUzlyeDJaMXpWYXFiMGVYcjBtZ1FzZjhCVTlXb3JmZHl6?=
 =?utf-8?B?eU8zOElaQTBHM2VuZmYxcm4zN253VE90TzVaTkYvakUwcFB2c2V3QzZQQVNp?=
 =?utf-8?B?Uzk2bkZISDhFeGw3QlZKV3pVQUVLMVBJZjhCQTEveDJGMnhrRFl5Mm1tcEpK?=
 =?utf-8?B?NEpudnQrL09wOHh0K2pGbmZReWxXdUpSTXh6NXl3NGs2bGZMTkQ5bjBua1po?=
 =?utf-8?B?d0VsK2p5OEJaM1NVQmJ5aFJkbHUzUWFodGthZVN2U01vSWdpN2FnamV1YTNG?=
 =?utf-8?B?R2ZZVG4rRkJkSW1Dd1FjM3NBTzhhSlU2YUI1R2dpSHJiTUZsT3R1MXNkTHBH?=
 =?utf-8?B?bDN6bmZ3bHUwUnVuTEd1NGJaQ0k2akZnaktyWnMyQXZEZzRDL0JCYUZvZHh3?=
 =?utf-8?B?WlFCUnJjUWpmMTk0eHRaODIwUkZUUUVJSnJjOUVLelZ5bW1EUUdlMkRCYW1i?=
 =?utf-8?B?clJSNmwrN25YYzNrMEw3ZkZLcDJ2U1ZpRHpzeG51TjBJQ0dSckFWZ1hqNkhm?=
 =?utf-8?B?NmV1RkIvTjhlY3RZUDc2THUvUk1yTUJxZ1hIZmlSZTA0emc1bUtlb1h5cFBY?=
 =?utf-8?B?Y09FOW1qcUZzbHcydmMzNnN3NHVXbjBTdWZYU0ZNREptU25kRVlac0ZFVmZN?=
 =?utf-8?B?WE9nWDcvQ0V5OFhkMWg0dG9OWFNMVXJNT3llQWFreG96cWFIV0dqVWJsNnov?=
 =?utf-8?B?UUpaRVE3UWEzT25JcUU5S0JHcWVoR0dzZDA4S0N2amFFRTNhNFFYQ1pmYTRU?=
 =?utf-8?B?V0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: daab2c1a-f3a5-401c-ae2b-08de09c1601e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2025 18:58:49.1948 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ku6YueB954khs5dbiTg8Wi7p+aayS5wRUkOzA6r+HPKezKU1ikPfa2DBk88MrrndgsDHFVOgFO6rTGgLdXZu7fNMNabN25eXy4Mu4HEUsJQ=
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



On 10/11/2025 9:38 PM, Michał Winiarski wrote:
> Upcoming changes will allow users to control VF state and obtain its
> migration data with a device-level granularity (not tile/gt).
> Change the data structures to reflect that and move the GT-level
> migration init to happen after device-level init.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile                   |  1 +
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 12 +-----
>  .../drm/xe/xe_gt_sriov_pf_migration_types.h   |  3 --
>  drivers/gpu/drm/xe/xe_sriov_pf.c              |  5 +++
>  drivers/gpu/drm/xe/xe_sriov_pf_migration.c    | 43 +++++++++++++++++++
>  drivers/gpu/drm/xe/xe_sriov_pf_migration.h    | 27 ++++++++++++
>  .../gpu/drm/xe/xe_sriov_pf_migration_types.h  |  0
>  drivers/gpu/drm/xe/xe_sriov_pf_types.h        |  5 +++
>  8 files changed, 83 insertions(+), 13 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_migration.c
>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_migration.h
>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 84321fad32658..71f685a315dca 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -176,6 +176,7 @@ xe-$(CONFIG_PCI_IOV) += \
>  	xe_sriov_pf.o \
>  	xe_sriov_pf_control.o \
>  	xe_sriov_pf_debugfs.o \
> +	xe_sriov_pf_migration.o \
>  	xe_sriov_pf_service.o \
>  	xe_tile_sriov_pf_debugfs.o
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> index a5bf327ef8889..ca28f45aaf481 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> @@ -13,6 +13,7 @@
>  #include "xe_guc.h"
>  #include "xe_guc_ct.h"
>  #include "xe_sriov.h"
> +#include "xe_sriov_pf_migration.h"
>  
>  /* Return: number of dwords saved/restored/required or a negative error code on failure */
>  static int guc_action_vf_save_restore(struct xe_guc *guc, u32 vfid, u32 opcode,
> @@ -115,8 +116,7 @@ static int pf_send_guc_restore_vf_state(struct xe_gt *gt, unsigned int vfid,
>  
>  static bool pf_migration_supported(struct xe_gt *gt)
>  {
> -	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> -	return gt->sriov.pf.migration.supported;
> +	return xe_sriov_pf_migration_supported(gt_to_xe(gt));
>  }
>  
>  static struct mutex *pf_migration_mutex(struct xe_gt *gt)
> @@ -382,12 +382,6 @@ ssize_t xe_gt_sriov_pf_migration_write_guc_state(struct xe_gt *gt, unsigned int
>  }
>  #endif /* CONFIG_DEBUG_FS */
>  
> -static bool pf_check_migration_support(struct xe_gt *gt)
> -{
> -	/* XXX: for now this is for feature enabling only */
> -	return IS_ENABLED(CONFIG_DRM_XE_DEBUG);
> -}
> -
>  /**
>   * xe_gt_sriov_pf_migration_init() - Initialize support for VF migration.
>   * @gt: the &xe_gt
> @@ -403,8 +397,6 @@ int xe_gt_sriov_pf_migration_init(struct xe_gt *gt)
>  
>  	xe_gt_assert(gt, IS_SRIOV_PF(xe));
>  
> -	gt->sriov.pf.migration.supported = pf_check_migration_support(gt);
> -
>  	if (!pf_migration_supported(gt))
>  		return 0;
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
> index 1f3110b6d44fa..9d672feac5f04 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
> @@ -30,9 +30,6 @@ struct xe_gt_sriov_state_snapshot {
>   * Used by the PF driver to maintain non-VF specific per-GT data.
>   */
>  struct xe_gt_sriov_pf_migration {
> -	/** @supported: indicates whether the feature is supported */
> -	bool supported;
> -
>  	/** @snapshot_lock: protects all VFs snapshots */
>  	struct mutex snapshot_lock;
>  };
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.c b/drivers/gpu/drm/xe/xe_sriov_pf.c
> index bc1ab9ee31d92..95743c7af8050 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf.c
> @@ -15,6 +15,7 @@
>  #include "xe_sriov.h"
>  #include "xe_sriov_pf.h"
>  #include "xe_sriov_pf_helpers.h"
> +#include "xe_sriov_pf_migration.h"
>  #include "xe_sriov_pf_service.h"
>  #include "xe_sriov_printk.h"
>  
> @@ -101,6 +102,10 @@ int xe_sriov_pf_init_early(struct xe_device *xe)
>  	if (err)
>  		return err;
>  
> +	err = xe_sriov_pf_migration_init(xe);
> +	if (err)
> +		return err;
> +
>  	xe_sriov_pf_service_init(xe);
>  
>  	return 0;
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> new file mode 100644
> index 0000000000000..cf6a210d5597a
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> @@ -0,0 +1,43 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include "xe_sriov.h"
> +#include "xe_sriov_pf_migration.h"
> +
> +/**
> + * xe_sriov_pf_migration_supported() - Check if SR-IOV VF migration is supported by the device
> + * @xe: the &struct xe_device

nit: this will render better:

	@xe: the struct &xe_device

but in other places we just use:

	@xe: the &xe_device

> + *
> + * Return: true if migration is supported, false otherwise
> + */
> +bool xe_sriov_pf_migration_supported(struct xe_device *xe)
> +{
> +	xe_assert(xe, IS_SRIOV_PF(xe));
> +
> +	return xe->sriov.pf.migration.supported;
> +}
> +
> +static bool pf_check_migration_support(struct xe_device *xe)
> +{
> +	xe_assert(xe, IS_SRIOV_PF(xe));

we don't need this here for now

> +
> +	/* XXX: for now this is for feature enabling only */
> +	return IS_ENABLED(CONFIG_DRM_XE_DEBUG);
> +}
> +
> +/**
> + * xe_sriov_pf_migration_init() - Initialize support for SR-IOV VF migration.
> + * @xe: the &struct xe_device
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_pf_migration_init(struct xe_device *xe)
> +{
> +	xe_assert(xe, IS_SRIOV_PF(xe));
> +
> +	xe->sriov.pf.migration.supported = pf_check_migration_support(xe);
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
> new file mode 100644
> index 0000000000000..d3058b6682192
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_SRIOV_PF_MIGRATION_H_
> +#define _XE_SRIOV_PF_MIGRATION_H_
> +
> +#include <linux/types.h>
> +
> +struct xe_device;
> +
> +#ifdef CONFIG_PCI_IOV
> +int xe_sriov_pf_migration_init(struct xe_device *xe);
> +bool xe_sriov_pf_migration_supported(struct xe_device *xe);
> +#else
> +static inline int xe_sriov_pf_migration_init(struct xe_device *xe)
> +{
> +	return 0;
> +}
> +static inline bool xe_sriov_pf_migration_supported(struct xe_device *xe)
> +{
> +	return false;
> +}
> +#endif
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
> new file mode 100644
> index 0000000000000..e69de29bb2d1d
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
> index 956a88f9f213d..2d2fcc0a2f258 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_types.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
> @@ -32,6 +32,11 @@ struct xe_device_pf {
>  	/** @driver_max_vfs: Maximum number of VFs supported by the driver. */
>  	u16 driver_max_vfs;
>  

I guess you need to document @migration too to make it work

> +	struct {
> +		/** @migration.supported: indicates whether VF migration feature is supported */
> +		bool supported;
> +	} migration;

also can you move that closer to other sub-component "service" below ?

> +
>  	/** @master_lock: protects all VFs configurations across GTs */
>  	struct mutex master_lock;
>  

but otherwise LGTM, so with above fixed,

	Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>


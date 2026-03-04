Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qMN4DLHyp2lmmwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 09:52:01 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8056D1FCF16
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 09:52:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0923710E980;
	Wed,  4 Mar 2026 08:51:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wj8I7kih";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7F9010E97E;
 Wed,  4 Mar 2026 08:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772614314; x=1804150314;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=069AEjYuO4rHL+kyclbY4UKDr07mgmQARHQWpOfYfto=;
 b=Wj8I7kihYrgbKkxm10zsZ2NzqPvmWtOpLcvchtceNmmJVvgYLqsWuiav
 QMLoi6ZQpe6e5r5x1zh4BhzjuNjdJlyhMG8ZvaQ8iXb+aCdxJaJnJ+Z0e
 pp4PwcKElKb0x+jnF69dGG1SFtBCASkx8GQjmvBgxpQ7afCz3HFb/q99n
 3iRth+7qc6M4Tj/gU1LZYkcIQ6B+np7Q94AOmS1+zZ7Kpb7Av8QAxA1z8
 dpBQWPBVPr3aK9a8I9Lgt7CmoDRz4Doafd3XhHMgZG8PQEJRUExTHDLDa
 ThgCo+5WBEj5KtthFcKgIXmJfh7rEgP3PkRfSkFcArcJnvQ3Qnr/q+mxs w==;
X-CSE-ConnectionGUID: Yg8iNebtRD+c489em5VbPQ==
X-CSE-MsgGUID: uuJ6Q7uQSvKSkseTdbdk6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="91060557"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="91060557"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 00:51:54 -0800
X-CSE-ConnectionGUID: D9Rx4XMZSS2ue4QtDCFIiA==
X-CSE-MsgGUID: RzRa+OGESnatZhDHOmhasg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="256165124"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 00:51:54 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 00:51:53 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 4 Mar 2026 00:51:53 -0800
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.45) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 00:51:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pgYICbNZG/DiUCD5ZOBF4LajXM94PFKxjgRN7r0VrEV2SaBNthL/Hj1ZbuaTxTWhlYkfQM5izFTTaaJHJqmMSS3yoXObw4EM7EWwZwVs85QLzt9cbsgGBp/CtCOLY8epJ5qwOkX2knfvGff12UuvnD03QByxEXC+U3yXw7r5A0PSvhBtE6mEaLwIZFwtBjYTmniyru9wiZwHAf6XUIJC6Bm00fANvjXeFN+QXLXaX1f8b47r4blR/kIQNa0Rlx3HRH8fEFqBqsEyySN00QdzldmmiYlZ6VNI4Zz1+mp8S5y6S/A7PjPDdCULZ44V1CWar59n15xJCmLqTtGXhex5DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ZXdrV3HGyPGbZ+YQaWb1ahJ+G8fWbcehnYXl7SASF8=;
 b=mlglsI3tBIVZi9YYv3PmghQQOHXFjO1haJ9HH1LGn8AQsQYOQbt/aIyuWmRnq6/X/geilKdVpOMuSKdkleA8uW7hCylcey/rD4bmSfzFWOJc1rgT32G2j2p/NF0DJkedwLQse9ISoM8dyjHFRuSbVL1T+MWIjamaQh7tq90fqPeLjbCw3KyuWjSMq0E9YTaoC9KqThFwzUaj8MBvUHxslJQSi+z6eBzkP9aVseJyY0+tmjOf2evs3fYIMrwHyZ1j3zgyDPxAHvqJMJ2/nxfLkqr8aALZF9TwlybaeH+NBnzmxQfowog+C7CC8QqP0gIUMCtv07bldrMvrQn4pJInvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DS0PR11MB7971.namprd11.prod.outlook.com (2603:10b6:8:122::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 08:51:50 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%3]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 08:51:50 +0000
Message-ID: <399b1f09-b134-4ec1-bada-5ec053691bf7@intel.com>
Date: Wed, 4 Mar 2026 09:51:45 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/tests: avoid build warning on 32-bit targets
To: Arnd Bergmann <arnd@kernel.org>, Matthew Brost <matthew.brost@intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Rodrigo Vivi" <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?=
 <piotr.piorkowski@intel.com>
CC: Arnd Bergmann <arnd@arndb.de>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20260304083741.725121-1-arnd@kernel.org>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260304083741.725121-1-arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0229.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8c::19) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DS0PR11MB7971:EE_
X-MS-Office365-Filtering-Correlation-Id: db218d9b-e998-4248-d185-08de79cb46b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: pAREAuSwllwTx0nxXV+bEMyeC1DCVs1dKeOKss4dM4SEMB+sJmlNUomKVZQt7kTiW278JFSqXO8sOMU1LkWMO8EV/p60h0kYbLv2CprGUZX2mySnr2hKK6lZq9UksOFVCUZ+Ej6ch/yFrtKqM7OGttAwViPV3mn4KXF3sRwdtGYiccREjQ1TMBooiHF45hXZdmgywIEaHBXL7LcgMulsU6tI0BvB9Dyz9UMExQHj7usKHJxlXJqFjZJAM0JozkQmtfqDPkpM9Errc8Wvm9kn89q+MLMUDYl2fxgrktctuUIxZ4e5l7DCFVsaHYoCOhFRVsBpudssMdmwzkVEvUSIvQS1yNtWt0t4SzLHeifmmwr+tF0giUuO3N19h7F5nh5BYfO4Pc+VVHVpBlw1jl/p8EzGPO6umCS3lXtJNzA9MVjqdvwAE4e31uVW2N0tQtJ8NabNGdGqjZTU/OkoU+98l9l0iJ2GY2uyw816VNr487ByBbDcCUI/LVBlVs2VlSr9D2rHixkh/86OchzcoC1bGPSaMLhsC6sT0yOPtOclOGtQlC5eZuD7j6a7L+sP/4T0PXHerbvMCT1jgxbhG+UleeTdmBofb2Q3BjkJODWNHmEXAM1pZ0mXRwmU7tx1UFGLtvUrrMkJCMyOsAQ67pkj/PwUcLKYS4SrDTMEA7kPAYeXX79m3JqtbHspp+T//lux
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NE8rWnZCTE5mc0owanhXTEtDZFlZN2lQb1ZqcnJEVVN0N0VaNDJnV0x0bFZr?=
 =?utf-8?B?QTM3Umg1NkE5ZXNyd21idU9FcGxSc2lnRWtRdG5SMXVmdDBvV2RHbWk1ZlRB?=
 =?utf-8?B?UWJTOGFLZ29zQUhrakdYSllzeUs4NThJanRoMTM0dkRBVnhFN1dFY0s2Znpp?=
 =?utf-8?B?bDFsZ3RkMWsxNGFBbnZ5RnlsaW5DdjlhN3hwdWFEdVF1N050eGNrTHl1NHVr?=
 =?utf-8?B?VjZQTjFmcGNub1VydEJuQ1hseng0RENDL3h2ZGpVMDRlaEt2d3JXa3FWay9R?=
 =?utf-8?B?cFN2SG9mNlVyYmx1TXZOaFpYRHZCYXBKbHE4VUROM3F0ZnJiVVhZRnVIYXNu?=
 =?utf-8?B?c3ROQ2ZLdExKdzJFWFlXRUwrcFZEVjVtVUJMWFdnREE5RnoyTCtmQmFYVkxp?=
 =?utf-8?B?bjQ1YmJFY01HZEswSWROcmpQNDRoVXFnMmxwNGlCdkViK2Q2amF0eGRwcWF6?=
 =?utf-8?B?UGt6eGFsWUx4KzE1MmROeEo5Q2ZOZHRKdklqQ2s4Q0ZKNWcyeFI4cUM0MGRU?=
 =?utf-8?B?dVZBSHNUQTM4Uk0xWVNWWU90VktxS0tTQXdvdG04UkZOT08xVCtKK1p5TlU0?=
 =?utf-8?B?NjBISndYMUdpWnZOanhIeTV6MDhuRytUTDR4YkRMQ3RWZUJsaU4zV1pONEdi?=
 =?utf-8?B?Ny9neVl1VlNwb1FJZ3EvYnd3dTdjVisxeURTTlNQM2NsS3NOY2M4Ry9kQXJB?=
 =?utf-8?B?QUYrWHJmandGcGlNYUdJVWNyYVI1K2tFQlYxV1lOTWNyeWk1WUJ3a3VqRHhq?=
 =?utf-8?B?dGx1Y3V2WTJjMmJvMmRVeWVkWkx4M0QvYm5ORUZobkZQRGE0Q3I5RTRYVDBW?=
 =?utf-8?B?emY3ak5uaU1NUVVvZ0RPd0Faa3VDVGVNZ1NnSVNNVXJNeTZkaGdWSEhRZDdK?=
 =?utf-8?B?eklUWkkvWEozR0I2aW1EblJDelB0MTZqaktzSUdOSnQ0bmMvV3VtN0pTZnRI?=
 =?utf-8?B?Mlp6VmtIRWp3OU4rditBenZNL0wzWmgvWFpEYzcxVG1pbzlsN1M4THl0alpP?=
 =?utf-8?B?YzdRQUJ5cUhsRzhveVp6VnZncWxwS1JCREhueHZMK0ZaZ3h0dmZvbWZEN0Iw?=
 =?utf-8?B?aHhIbEJ3OU1MVlByYWJ1Y3Q0YVJWRHlDajczOStZbkc2TXc2QkdNSUhwRGQ5?=
 =?utf-8?B?SkpBMzlrYUdZeUlpVzg0VU5CbWwya1ZlWlFwckhIVy9HSkErYWpGbGJDTFU2?=
 =?utf-8?B?ZDkzMmk1dE5nR1E0UTJvYXVlSDRVa3Y4M0JtYzBJODRSYndhTk14YllqdUFy?=
 =?utf-8?B?WEJ5dUNRbWowdUdVNUxsNVhGdjV3TGV0emlCYmZtZkdwMGpKNTQwZy83ZWVu?=
 =?utf-8?B?TG1yaGJYcVNQczByM2xBRWtuRlhFVGhnUVFrWnhqcGdGZC91bmZwSEZISUhS?=
 =?utf-8?B?SWg5cDBPeTRBL3BzZkY3MUZib3VEWk1PUkt2QlRWemY1TFhiMmo0Zm5NWVBo?=
 =?utf-8?B?ZnpWc3hxNDZZdmVKSnhoTGZXbzBpTkRJS250QW53OEFnVSt6OUcxNjFwL1k0?=
 =?utf-8?B?WFlTVk5ZYUUwYWMxNTlBdUxXL1JZaWxPUXg5aHZKYkFHY3JTMC9ZakVPenFL?=
 =?utf-8?B?Q2FxOCtlU053bWJNY2tlT0tnQnJCUDJJc3FvaGdrTDFTbVp2cjdwODFMcFVw?=
 =?utf-8?B?TjBwS2UzOWZOQ0xUZmEwZEVmKzVqM21wZ0dGVnBSdkFWNGYxMFc5QjY1MVo2?=
 =?utf-8?B?eDlqcGZ5bjRubklhYmFLbVRXYkUycEZ2bUJTRTNoeFh3Z0U2d3lDMkhiQmJh?=
 =?utf-8?B?WTRNTWtqMDh4Ymo1WVZXaUFDN3R5MkE1UG1aTU9qdUl4OVEvbEQvU01zdkFP?=
 =?utf-8?B?djN0ZGdLeittQ0R1M052ZVkxQ0ZhS2UySC9zZmxING9mRmt5RHkwbzJYZHdj?=
 =?utf-8?B?MUZSTmF6MnNGTjNGTnhVa2tEZUMyUDBhbXlSZkticGJGSlhBeUUyS0UyK0hl?=
 =?utf-8?B?dXg0Q2hodWlEUDFiYTFybGhjeW5YdEtEQXVWeVNIalovOGRrQVgwOFNHUXQz?=
 =?utf-8?B?QnBna2pnZ2FLNWdXRHF1ZWlFenkxM0wvVExYK3NxN1o0Unl0aHZHdnJ4d0Uw?=
 =?utf-8?B?ZEFXa2txN1hlK21QTHV0dVNhcSsvMUhmR0FwSzA1bllpd2FOdzNZQW03Z3py?=
 =?utf-8?B?UnZ2bFBJcFB1NU9XamFQb05nOGFkd2R3eFpQUng2UHZTY3A0MmlHelVhUEwv?=
 =?utf-8?B?aW9xVFM0UXRkT2QwM1FwK20wWnRMQVJZK2g4VkpGRzg3YVFxdUhjVWRmNUhN?=
 =?utf-8?B?RGVOd2hlNmhtbS9pT2dXTWxkQVoyV0k0b21NUzg0eFdVU2hNWHNJUVE4WkFl?=
 =?utf-8?B?bG5VSzBZSG93dmFKTlU4ei9yZnltTDRaa3BUT2dyUmJPTjlxVkhoNWcvQytG?=
 =?utf-8?Q?J1fM5QtKo6aVMtGA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: db218d9b-e998-4248-d185-08de79cb46b8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 08:51:50.7187 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JuToPEW0e1udPgyjw55y9lwdCU7xkx5JuUgBSzN6OWSryd3RBpiWcfCyNDWwF/0y/sTR2jB2l846sn5lc7pSTDwtXwla0E0bnZYzYDO14hI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7971
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
X-Rspamd-Queue-Id: 8056D1FCF16
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:mid,arndb.de:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,intel.com,linux.intel.com,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.wajdeczko@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

Hi Arnd,


On 3/4/2026 9:37 AM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Building the test case on 32-bit targets produces an integer overflow warning,
> as a constant value is assigned to a 32-bit resource_size_t variable:
> 
> In file included from drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:3329:
> drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c: In function 'pf_gt_config_test_init':
> drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:14:25: error: conversion from 'long long unsigned int' to 'resource_size_t' {aka 'unsigned int'} changes value from '14940110848' to '2055208960' [-Werror=overflow]
>    14 | #define TEST_VRAM       0x37a800000ull
>       |                         ^~~~~~~~~~~~~~
> drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:71:29: note: in expansion of macro 'TEST_VRAM'
>    71 |         vram->usable_size = TEST_VRAM;
>       |                             ^~~~~~~~~
> 
> Shut up the warning with an extra cast that marks this truncation as intentional.
> This is probably not the right fix here, but I could not figure out where the
> constant value actually comes from, or if a smaller number would be appropriate
> on a 32-bit system. It's possible that the test case or the driver is just not
> useful on 32-bit machines because of other parts of the logic here.
> 
> Fixes: cbe29da6f7c0 ("drm/xe/tests: Add KUnit tests for new VRAM fair provisioning")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> If there is a better way to fix this, please treat this as a bug report and
> just add a Reported-by tag in the commit.

this was already fixed and pushed [1]

[1] https://gitlab.freedesktop.org/drm/xe/kernel/-/commit/4f18a79b3585a28c9f73f859fe83f12d0eccc736

> ---
>  drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
> index 305dbd4e5d1a..86cd15834bac 100644
> --- a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
> +++ b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
> @@ -11,7 +11,7 @@
>  #include "xe_pci_test.h"
>  
>  #define TEST_MAX_VFS	63
> -#define TEST_VRAM	0x37a800000ull
> +#define TEST_VRAM	(resource_size_t)0x37a800000ull
>  
>  static void pf_set_admin_mode(struct xe_device *xe, bool enable)
>  {


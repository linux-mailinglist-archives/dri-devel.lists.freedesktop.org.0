Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sFFoIkPhn2lLegQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 06:59:31 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3742B1A12E1
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 06:59:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FC9F10E861;
	Thu, 26 Feb 2026 05:59:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="msPRN177";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2434B10E032;
 Thu, 26 Feb 2026 05:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772085567; x=1803621567;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=32QjavkLKjB3mtlUgDSqzSLj/EU37GVCCDzwd1Ed98I=;
 b=msPRN177mr7Dm0CJxnTYixYZYLU8SKQ87C1Q/MJMY2UwwxPtnkkurMak
 F9Ba40LfKIhKHv09pkfRwHY0DD+ILxvWhqmOdiCFvAK0ycxP8Asx7E2u0
 f72GHLY/aVbTcCA0suIY/B2D6ZDZzUi2Oj/Aux5sdycaIzzKtY2cfl9pV
 gzSWjZXPMWCiayG+F9/jkWmvm39wudFGLLT3uMCot3ERsvJi16KPZSi+l
 yY733N6gIKttRY5znMLbvzLQPTxdC/Q4KK9BSZvmWn7sMgjOr0/UoV+BX
 LZDQQ9IEFbU/pD/TJr9AFtilsmyJu/b7ylUEBb0eYYsknhPw1P309E7ra g==;
X-CSE-ConnectionGUID: ZEvdohMHTcG6lg0DPyZPrQ==
X-CSE-MsgGUID: MYBXq3NQRxGV+Srt71ZvNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="77006207"
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="77006207"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 21:59:26 -0800
X-CSE-ConnectionGUID: gABqH1ULT6CRwzVho1M+Xg==
X-CSE-MsgGUID: 3YLfborCQYGzYwx+2+YZ4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="216475751"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 21:59:26 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Feb 2026 21:59:25 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 25 Feb 2026 21:59:25 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.0) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 25 Feb 2026 21:59:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vh7Bo5ClWoJDoOaShd5453G58q7P4WXwmy8GbaCCLQSNIYngmSnXee0NSiVkRTv9Bw4LqjkdT3i93X88NqUeokEIz6GAV6nrIpna7oAT0mEKZE4rue2Z2mAbQEtqWQlkUTyXXHwhC7pUuyoeEU7+4PADmVYNXSuSMQBs091lcb1qvMLSeHVEIxqQsKSzZL/A27jEHTPglz/m6M8YwfiqeF6XPmGSYpYkecNv8XcKaHcdUn8YZfs9k+76Qh7xv8eQY4lxlZdfYeXrRmkWyaza9dtPxf3bunqZp/Xjk79JYuZBYS8Q2uNGzY1YMXyybdNrl8yxjMp6fdJv16K07teSww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j8yrW3Vzs6egCgnfZUBN5FoJ1ym8CuDXEZqcMbBQGBI=;
 b=MW//qOe1cCcuCbnekI5etK7DHGZpbgvh1lwqfahQbrc4frgti+gbo8qOOeeUwnQaNEotSxG/Y87jOgNs4xRxiEXBEiXAfrjiwxm44Z8Y9bkcPBsDw+9JL7YLn/GBJ4kuayCB6sG8qSzfdPbLfqqqcFEhUjg2cWENcLGOWOaH4z2NeRU6dRO0QrRoMb8XDSmQvdOfzIv1tPGDRnLRdwK1/+qtXrx5ABey9p+Z1Yu7tNX3XzpadpP4aY7/Hzb7U3YrBPzVAVJZ3YB1nLXyxf/gpxS0/3ncZfXB/37JSYUVpxtXwOxgR9+XY2hWSmUevz3FD3bDdb+YcC83JC0CtSi5Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by IA1PR11MB6291.namprd11.prod.outlook.com (2603:10b6:208:3e5::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Thu, 26 Feb
 2026 05:59:21 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::45f:5907:efdb:cb5b]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::45f:5907:efdb:cb5b%3]) with mapi id 15.20.9654.014; Thu, 26 Feb 2026
 05:59:21 +0000
Message-ID: <8639961c-9395-4bbe-941c-c1511c72af69@intel.com>
Date: Thu, 26 Feb 2026 11:29:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] drm/colorop: Keep colorop state consistent across
 atomic commits
To: Harry Wentland <harry.wentland@amd.com>,
 <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
CC: <contact@emersion.fr>, <alex.hung@amd.com>, <daniels@collabora.com>,
 <mwen@igalia.com>, <sebastian.wick@redhat.com>, <uma.shankar@intel.com>,
 <ville.syrjala@linux.intel.com>, <maarten.lankhorst@linux.intel.com>,
 <jani.nikula@intel.com>, <louis.chauvet@bootlin.com>,
 <stable@vger.kernel.org>
References: <20260218065713.326417-1-chaitanya.kumar.borah@intel.com>
 <f670f350-7230-4bbc-9443-a6307429d7b3@amd.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <f670f350-7230-4bbc-9443-a6307429d7b3@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0275.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f2::13) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|IA1PR11MB6291:EE_
X-MS-Office365-Filtering-Correlation-Id: a867f35c-01f5-4a8f-a6e9-08de74fc2f3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: HMiVDOdvSjx2W9w+e9+/zrqaqMftfC/XJl9VhLspKnDBJ98VOc4VHY3Rn/KO/NPhtOpg4iFj2uJI2ot6TOMliG72ZvYLskiRK1hudkO/HJ8tdj0QguWYTbAU9YHoyVCnnsa5nAgEPjdxvT+IeMmqfAwy1m1w1THISMF0pqysFe8DLMETbdN880p6WIJH4SgF+at21HC+sUbDNipez7HybMB5lOPqoWBiUPISz3KFX14GYcxYX9yclsWxlgQgFFG+NvjbCP2/WWDYtFjib0R+tBHpZ7mIHzV6tIjzh6wAX35rn1vpNhHxicgYYt3PI5fCbPP+ob09qwPpOS5ta8jGYovdEVg0mCbaNsd/SAbDg+ixwD8pJBCZyOCV93mlDOj3VR3SjcR5tfLDI4OJWMGVqYrQO6mmpXqq99JRIyEvgbGQSbpDnU7oT38NBC928ei9NKpfQGjzZ+2O4WGQX+RMDPdg0dN+l2PqOK8R2zEbvwmkL1XR8askZHZwcgjnlHDpLI2ff38ocLP/YajQdl6rj6NDeiVikMlIKq0/QTFEhmk9zExC4fyEXtHyjbYmQbD8L0xEBRPKyqXD+NbAEGrxhYCGcrw5xNp4FwYX26yN2ua9BR73Nxlomn18S/rsC2XcdSxwxYlVFvqLVNr5ZEF0kxRWZ1O9MaS0UhsvgLrMEweNdhwyOofgR4fjjKzePGEymj0kCk0TVaip6JEBcePp8Sdsl4oWC4U/C1Bsx2zai5o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NGRIWVdMdGJFZ1RhemxKYk5yMEFFN0Mva0lUQVdGN3ZGSkN0cXhQR2lEcWkv?=
 =?utf-8?B?R0hCVnJMYmx5Q3BFNGdXbTA2dytJbG1BSC9Zc25KM01IVVppNzA5QkQ3UjBr?=
 =?utf-8?B?ZnlHWmdrSEN3enk5TGlmRnFUZUhNbFB0aFBzUHlaTk9SZWI5dlluOXlEdXhs?=
 =?utf-8?B?ckZCM0Z4Rjl0L2R5OG5zOG5NZy9rYW9kcklvb3MxaW94dFg1SU1IZjdXMjRX?=
 =?utf-8?B?eWlNdi8wRjh1R05mMTJjTmxFTllzQzhpU0JHZVhNZzI1U0FQbENDRWQ3T2NP?=
 =?utf-8?B?MjQ5ZU9idDZ6UTIwNk9oNzQ5WU9hWmF0NndLL0hOUVZsTytFSEE5YUhCaHZR?=
 =?utf-8?B?UG5KQUw1N2xKbmFiYjE0RzhwL0RkT1VXaW8vampPQ0I5US9IeHNKNmtreWp6?=
 =?utf-8?B?RWtwUzBDYXI5a2N0SWJMdXovdkxkSXlTODR4dzJEYVpwWUZEV1gzZDI4RzN4?=
 =?utf-8?B?SHpBSjlPVUplTWhLZ0d3UFBFd0RFYzRVZ3lBS0xTWnF6TWdFT0lFeVpiKzRY?=
 =?utf-8?B?QjYxbnlrM0NVOGZUdUJqYjdvQUlmOWMvMm1Xb0dKTWhOUkIwOXQ3T0hhOXd3?=
 =?utf-8?B?ZW1ad25kQ3N5ZnZJK1hCT2pPL2lwamZyR2NFd1dTK1p4cGFoU1V4RTNWSDRi?=
 =?utf-8?B?VXdyMXJnbW55eDdiZkNLVGplNEdZQ1dHeThIZFRPOGFDVHJRaWtlZmx2TUlm?=
 =?utf-8?B?VU9mcGFSUzd0TVNFMnNuYlpwMmh1bnpGUUh6MWZMZVJlTVJuZjJzZFdzdG01?=
 =?utf-8?B?QU1peVc4eDBVdHhCZENrbmNjMUJKMUV2bW9YMWx2K3dVYjlhL2c1YkEveDc1?=
 =?utf-8?B?SmdwMWxBc25CSzZsRjY0NjFYTzUrRDB3Y0hSZnM2UTZjcnF0ZkFSUkpWZWFN?=
 =?utf-8?B?QTJrU3RXUEVpcGlpMDZOV0llNDc3RHhZNzVXOTlDeThvdEw4YjZNcTFTT0l5?=
 =?utf-8?B?NUVqSE1ZbDgvSWJtNHBRSEo1U2NmYy9KVEc3MytyNnBsWDlvbzd0YjcyaUJ2?=
 =?utf-8?B?VlF0aDRTUlgrd1VjK2JTd2RwSVJpWmx4Ly9kZkFFWHlVelRjeUFoMlJ6d0ph?=
 =?utf-8?B?TGVzR3BjZ0VLVEJDeWFaamM1WWlOZm9neUV5OVhmaEIwTUJOUjhjYjFMdXFy?=
 =?utf-8?B?eDFtdGtJMFZVRkpJc0ZxcjlEaGxJeGJCL3Y4aG9xT1ZtWERBbURoSE1MOVFT?=
 =?utf-8?B?Rlh1WnBlUjJaRFBnT3A4bVNmMU9UOTh6cExGek5hZUt0VXNQSEpBWktYditl?=
 =?utf-8?B?MmtYQ0pENWxyMmtDdkRrQlBUbElXWUZ5ck9NVmFneGQ0SUZJY1UrMWtHYVQv?=
 =?utf-8?B?U2kybTBsR0ttNUdJSnpOdmsxQVY0WXdQUndSV0ZpNTdvQjdLdUs0MjMrcEpC?=
 =?utf-8?B?a3h6blFiK3hxNkd0NVhHc0V6VnU0Q1VpSFdIN1JWS3k0YkswZ3RGVTgrWStW?=
 =?utf-8?B?YTBCZDRIUHFlWW1vM3p6WnFvS1dRblEyNW5saFM5Nmo2c1MyZGQzN01VRzdn?=
 =?utf-8?B?UWY1K0d0Mm14SDF6SjlvTkhGWnVpUXZNeE1pYnpvNDZVQ21WU0hYMmp0b1Az?=
 =?utf-8?B?TW9KdTlFTkZEVHRvVmFaazEzSjdGM2JnQ1p1V3Z4UFFHWFpwTjk0dFpyaC9C?=
 =?utf-8?B?d204dGlyTkp2UnNDZGV4MTdSSEVGNXNJcWl1djJrREpBWWFJUVFmNHkzY0ZK?=
 =?utf-8?B?cmw0a2JLTTNya3ptOTZvNndBaWJ0NzlNNzZHcnNKUzV1TzdQaWFzdjY5MENm?=
 =?utf-8?B?N0VtTXY2YmRzN2Naa2FkeVVPV3lZb0ZlaW9pay9XNXRwYmo0V2NxajlFaTg1?=
 =?utf-8?B?SzlDWkhBMU9RQnlpbldTVjhzaEUxWGxZRjIwMjJTZ2JQeFl0RzRZaXYzOUV3?=
 =?utf-8?B?dldRM3lEM0lQYWJBaldHNXJjbmNCemVranJJSEU2bEszbFVURmVqUmg3dUZu?=
 =?utf-8?B?Y2JLQUQvbEpZZ2FsVERUUlJSY2luUDVBTlhEcHprLzJ5UHM3ZytNTEt3M241?=
 =?utf-8?B?blYyaTFpOTFGQi9SRGNmUXlZZGNJVG5qdVJaSU5zMVJuTkdTUmdOTTlKQ1RH?=
 =?utf-8?B?d2ljTWdKSHgxbXFhRSttRmhRL2oyTWw4dnBTdU13MVpqdDNaY3M2bUFjRkUz?=
 =?utf-8?B?MlFndWxFTHZKMGJIRTNWMlRWWDdPNmZPQmsvNUFTei9zTkVkNkFqVVYxalE2?=
 =?utf-8?B?MmlOelExdVJqUnlzWHBYbTV2dmQ1cE1YakRpdnIvMzkyY01IQzQ1bEJqVXdv?=
 =?utf-8?B?bmkwWHcvMy9JNEZxbU82a2Yva3RveVpNQmtGSEs2TUlzUDZRQkM2QzR6Z3g1?=
 =?utf-8?B?YmpPU0ZCa1NMclJ2bkZCbkRWM0VsRGttYUp4WktjZ094VXNDeVQvN0tKVXUx?=
 =?utf-8?Q?XYWamhcYLW8EP3NY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a867f35c-01f5-4a8f-a6e9-08de74fc2f3e
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 05:59:20.9455 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vDpxTk1npVDmDxEmlq73bsX3nnaNE1pBsAUQ/eSVGO9aRJizdoQrQCmy0RcNHpVJzh/MZJgl7gykRC0DMX/CEhcIKNIT4Olz+OnZLI9clwI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6291
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
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	RCPT_COUNT_TWELVE(0.00)[15];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FROM_NEQ_ENVFROM(0.00)[chaitanya.kumar.borah@intel.com,dri-devel-bounces@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: 3742B1A12E1
X-Rspamd-Action: no action

Thank you Harry for looking into it.

On 2/24/2026 2:44 AM, Harry Wentland wrote:
> On 2026-02-18 01:57, Chaitanya Kumar Borah wrote:
>> This series aims to keep colorop state consistent across atomic
>> transactions by ensuring it accurately reflects committed hardware
>> state and remains part of the atomic update whenever its associated
>> plane is involved.
>>
>> It contains two changes:
>> - Preserves the bypass value in duplicated colorop state.
>>
>> _drm_atomic_helper_colorop_duplicate_state() unconditionally reset
>> bypass to true, which means the duplicated state no longer reflects the
>> committed hardware state. Since bypass directly controls whether the
>> colorop is active in hardware, this can lead to an unintended disable
>> during subsequent commits.
>>
>> This could potentially be a problem also for colorops where bypass value
>> is immutably false.
>>
>> Conceptually, I consider 'bypass' to behave similar to 'visible' in plane
>> state - it represents current HW state and should therefore be preserved
>> across duplication.
>>
>> - Add affected colorops with affected plane
>>
>> Colorops are unique in the DRM model. While they are DRM objects with their
>> own states, they are logically attached to a plane and exposed through
>> a plane property. In some sense, they share the same hierarchy as CRTC and
>> planes while following a different 'ownership' model.
>>
>> Given that enabling a CRTC pulls in all its affected planes into the atomic
>> state, it follows that when a plane is added, its associated colorops are
>> also included. Otherwise, during modesets or internal commits, colorop state
>> may be missing from the transaction, resulting in inconsistent or incomplete
>> state updates.
>>
> 
> That tends to reflect my thinking when I wrote the colorop stuff.
> 
>> That said, I do have a concern about potentially inflating the atomic
>> state by automatically pulling in colorops from the core. It is not
>> entirely clear to me whether inclusion of affected colorops should be
>> handled in core, or left to individual drivers.
>>
> 
> Could this lead drivers to reprogram possibly expensive colorops
> when they didn't change? It won't be an issue for amdgpu since we
> have another level of state tracking, but for drivers that strictly
> follow the atomic model it might lead to issues.
> 

For xe/i915 too, this should be something that we can handle in 
atomic_check().

I guess the real question is whether this violates the atomic design 
contract. As far as I understand, when we pull in affected planes for a 
CRTC, we don’t actually verify whether any plane state has changed.
So by that analogy, should this be acceptable as well?

> On the other hand it makes colorop handling less error-prone in amdgpu,
> and possibly fixes a bug I've come across where we get confused if an
> active colorop isn't part of the state.
> 
> Harry
> 
>> My understanding of the atomic framework is still evolving, so
>> I would appreciate feedback from those more familiar with the intended
>> design direction.
>>
>> ==
>> Chaitanya
>>
>> P.S/Background/TL;DR:
>>
>> I discovered inconsistency with the colorop state while analysing CRC mismatches
>> in kms_color_pipeline test cases[1]. Visual inspection reveals that while CRC is
>> being collected degamma block has been reset. This was traced back to the internal
>> commit that the driver does to disable PSR2 and selective fetch for CRC collection.
>>
>> crtc_crc_open
>>      -> intel_crtc_set_crc_source
>>          -> intel_crtc_crc_setup_workarounds
>>              -> drm_atomic_commit
>>
>> During this flow colorop states are never added to the atomic state which in turn
>> makes intel_plane_color_copy_uapi_to_hw_state() disable the colorops.
>>
>> If we add the colorops, to the atomic state, the problem still persisted because
>> while duplicating the colorop state, 'bypass' was getting reset to true.
>>
>> The two changes made in this series fixes the issue.
>>
>> [1] https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18001/shard-mtlp-6/igt@kms_color_pipeline@plane-lut1d.html
>>
>> Cc: Simon Ser <contact@emersion.fr>
>> Cc: Alex Hung <alex.hung@amd.com>
>> Cc: Harry Wentland <harry.wentland@amd.com>
>> Cc: Daniel Stone <daniels@collabora.com>
>> Cc: Melissa Wen <mwen@igalia.com>
>> Cc: Sebastian Wick <sebastian.wick@redhat.com>
>> Cc: Alex Hung <alex.hung@amd.com>
>> Cc: Uma Shankar <uma.shankar@intel.com>
>> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Jani Nikula <jani.nikula@intel.com>
>> Cc: Louis Chauvet <louis.chauvet@bootlin.com>
>> Cc: <stable@vger.kernel.org> #v6.19+
>>
>> Chaitanya Kumar Borah (2):
>>    drm/colorop: Preserve bypass value in duplicate_state()
>>    drm/atomic: Add affected colorops with affected planes
>>
>>   drivers/gpu/drm/drm_atomic.c  | 5 +++++
>>   drivers/gpu/drm/drm_colorop.c | 2 --
>>   2 files changed, 5 insertions(+), 2 deletions(-)
>>
> 


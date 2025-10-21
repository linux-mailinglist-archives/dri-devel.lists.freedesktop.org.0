Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E30C8BF91A8
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 00:44:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0371110E663;
	Tue, 21 Oct 2025 22:44:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CvojnWFc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A29F10E669;
 Tue, 21 Oct 2025 22:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761086683; x=1792622683;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=QpJ02nPRkuQsfUqAEgTWX8xhHsaQnLJIZMujVqWZtB4=;
 b=CvojnWFckdcX2/QBDt9fn1Qvfg02vXedcjn3yBLQlCRfwb/QGM8iGd5s
 pRpXG7qk5s8ZWN2QlrMpXH1RvFCCKV8SaNV6Kum2cgOELI+ync12Pkc7b
 AwZC6j+/7zZGAuTRVawVbUqpGWYta5fTMwAV0woRukhXrDFbL2UnHqdxk
 gpLNcVXXzNwNOwRV5MgVhd26kWDKypNJQRfdQ2TOdmZ90DFZX+0dkvZ0s
 MaAh2BAweMxwdHncvt+eE6aA7lqb3/qg2FqeCfb5xsykUUxrqxOzpoxwG
 Y23qOV1olrSjaEYDp5o7HQJbOtGCtQyWyrK/IB5h7QhyWAf22NsOZ2tTt w==;
X-CSE-ConnectionGUID: 8C8H27bEQx6kCYvGHNP2Jg==
X-CSE-MsgGUID: NjttF+KuSvSKBp6Ak0Xm/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63135645"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="63135645"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 15:44:43 -0700
X-CSE-ConnectionGUID: b7IjFgepSa212U7bHJz/XQ==
X-CSE-MsgGUID: xxQ3hGb3R4+/YLcLLjUGag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="214345894"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 15:44:42 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 15:44:40 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 21 Oct 2025 15:44:40 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.47) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 15:44:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hA3LTXPTmRbL3o8Uwzp/bCx7Qs7qEhjNFEcRhwAHUKby24NaUR/sjfdWi/Nc+0ZFLsjqUFXv/4VYGR5qeWYN7AQHWoW8Yq1p+WJsNHUZEjbEXK3Xckox7OU5z2nOh6QnBI9F0H37Debdnwj0OKt8yYe/K/EVo3UyPur59Lj2X8I56sF6cUuMKRF6uXShis/ejrb/VwAdIY4SA/XCv8eXlk8KUL5Lv3oiRzGi7ocxlQ4nQJOJ2ZmVHODHMKhvGbc1gYn6b1wKsEeMWRbTfPjzRm/zjv+jMV0Gxg+sk3T0xuIxVyp8xPjpc+BE9r+owVHozySBoXJ0W3t9IZf2W+sZ+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=60dPgpZru0+LUY1WeOWqA8y0IuDlABPCdiZ07C3ivtU=;
 b=Gr3/OrRjyEGH3MpthTQNA6hnz9m+UWtrs7tNBnDOb9mPSMDVKDUhx/YA923WECpRhcztNygztLT27Z6YdM/kNNaWCrV2zZMOdte/PDmhbLQhY8Mf+85usPUYZHpB7Y3DmjwgnG5EakZeJ+R43XFlC0fOowzQ4qRyR0tVC8mzmK1C41g6faIs4WHDTDKa0mAw1WkjC7PO4hXVZt91yxRdFpCxq0kKFmZAe7OUAouhrgjgfOnWABUPyU1PyQM7YCXanEyYjfvvMvMuGCsUUIusLT/iMvbGOb8sJ+9yeaChboaS2+beePmOoN4pYKxwI7gmCZLygPdTvavoHik18P5+MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DM3PPFF28037229.namprd11.prod.outlook.com (2603:10b6:f:fc00::f5f)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Tue, 21 Oct
 2025 22:44:39 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9253.011; Tue, 21 Oct 2025
 22:44:38 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>, Matthew Brost
 <matthew.brost@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH v2 26/26] vfio/xe: Add vendor-specific vfio_pci driver for
 Intel graphics
Date: Wed, 22 Oct 2025 00:41:33 +0200
Message-ID: <20251021224133.577765-27-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251021224133.577765-1-michal.winiarski@intel.com>
References: <20251021224133.577765-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0034.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::7) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DM3PPFF28037229:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a5edefc-1d69-4d5e-05a5-08de10f36aaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a0ZWTk5DeDhCTWhxTmRYZ0U0TXFlUzNmSlNKclRxRnIvdlN5ajVoMU9oU3lI?=
 =?utf-8?B?dFJwRzdWdThZOGlTYW1YSlNrc29YY0E4Tm1xZytpWDQ1WEV5UzdtZEZyOTB3?=
 =?utf-8?B?TUpvN0xkV3F4M2lHVVlvUkhJLzlYVHk2UmVyWHduMGJjc1kzdFBMSE9ONENo?=
 =?utf-8?B?bmVCSmxBYTZDd29FQUhOUlJZS0lRM2tDRlhPRVNYSVYzZXFVc0NvdDk4cjVU?=
 =?utf-8?B?eGdKVDI2bnpYNnRDSlZKZWtOR1l6OXdCL2JpTE8zQyt6dDN4MXU3NkZTZmh0?=
 =?utf-8?B?QXVDMnFoVGtQQVlRblJXRTlDbDJZOHM2cGxqdHVjcEoyUWhSUDFIN1dkVk4x?=
 =?utf-8?B?clBkZXZZZW1jNGJWYk5Dd1hycVpIWnI4dVBsZVNMUnYvUFRuNFNlczY3bU40?=
 =?utf-8?B?bXp2QU5YeENSYWVDanYwVHZtaC8vbWhmMjBnZXBVQjkwWmFNODNVZ2RzY0I5?=
 =?utf-8?B?M0RESE1CaFlPcnhBeUUzbVVLYWIvQ0xReDM1M1NuZVhlMlJDVG1CSXdYS2VD?=
 =?utf-8?B?MkJTNjlTV3p3MFNXTzRRdnRZOXJpV2RuMG9LWVpuWmJBQjc4WHlub0tQRWtv?=
 =?utf-8?B?S3NWY2RFV3ZydEpkekdzVDR0NzU0U1dPZXFDREZpWjQ5V3pMV3F3SnB6d29m?=
 =?utf-8?B?ZHhKbTV4WHBJRUt2dnJkbVN5cllSbjFvWnh0YzBtekhpOFZqWWVzcWlaRUor?=
 =?utf-8?B?MVUwdWR4MU5LVzJNcDlGTVRYb0s2cHo5RlFseVdXZnlKQ1QyVFduZDEwYVNU?=
 =?utf-8?B?MjdQMlp5YnBaZHhLR1ZtVnZxaEJXaWs1VDZwSml2VEd6Wnh6cWEwRHpWME5p?=
 =?utf-8?B?S0dpc1lBdkVQZGpsYkhQM0ZmWE5HRW9KYlRPQzd4Q1hlNjdoSlZnZFUyUVhH?=
 =?utf-8?B?U2JvdDJBREEvMG9DMHhVS1JaSmtweVhWUHFMMmpCM0dkRWlWcFFtMGQrRGJu?=
 =?utf-8?B?Q212cWhhOHBzUmhWVm9mYW5jNWcvRFgzdjNxczk5MWpVaUMyQUZXcDhKNC9T?=
 =?utf-8?B?b1AwNjZ4Z1JvdnBSUjVhZlNwSzdXUEw4S2dxd3RqUU5LKzd6UDlweGl2TGdv?=
 =?utf-8?B?aDl0T2kxT2g1T21McUVNeUgzSC9YajB4UStNaGZxczhDMUxoVkw5cEZyc1Zk?=
 =?utf-8?B?MWtWbkh0K0N5MmxTS1Bzc1Zxb2JuTHIvQ0tGbWRwTlVHbVRYZ25yWm9NRGFV?=
 =?utf-8?B?ZDg2eXdSV2lVdWZmNmFCREZWdllPV1BBNFFRMjZqS05VK0ZzTXFRWFFYZGVP?=
 =?utf-8?B?U0QzVTBrcnhxei9Yd0oySk94dXZVTHRvanRnMDBDQkFJTWVWTS9PUmdwM25w?=
 =?utf-8?B?OStLRjlWS1RGYndPVmJRbGU2d01iWnpwdVFYMWN4b1k3ZWZwWlVPTmNBeHFL?=
 =?utf-8?B?dFVXK0dTVUJKYk9pWGlLSStNTjJZdzVibEJLbjI1NG1NME1xcG9EbHNXazRW?=
 =?utf-8?B?dzY4bU83Vmh6amQvLytNc0JNd0gyZUtWRkszejhTUXpZUGVMOVlTNnY1VEM5?=
 =?utf-8?B?azd5VkxYM1o5TmI4N1NCUG00S0JGZi9SZmFZZjMwWHdKZWJRbjh6b0Y3a3R4?=
 =?utf-8?B?NmhqRDBCek05endPWGVrQ1l1UEdUQ3k0T0IrdEpIaE5WUEk4RzJjbFBBZ0lU?=
 =?utf-8?B?QnJWVXdoZk9ZRmZ4WVJWVTB0TS8wcStjaVlMczZkaDg5dXVOa0FCaG8vWHdQ?=
 =?utf-8?B?aHh0Y0RWa0dQRytIMHlacjB0empUTktWN1FTaWdLVUwxMk9yOEQ5M3JVZDRn?=
 =?utf-8?B?R3JWS2dkNThNYlZ2NUFZSTVjY3VVNmRrVzdQOTh6SDBrKzBYSldjd25vOFkw?=
 =?utf-8?B?ZTl3MWtVMWdreFlUMTNPUG5LaE12ZUM5YXpmQ1FRWG5mSytzNXB1a3J2d04z?=
 =?utf-8?B?NTR3ZXozU2g5RXZqUHpvZUc1VFMzRzJ1SzN0ZmxrU1VFNGRLQksrYS9qSVp4?=
 =?utf-8?B?SkdoQnFhR1YvbGY2UFNDQmU5eDM0czNObkNPWnp6WG00MVRreUhibWZ1VmpB?=
 =?utf-8?Q?OmJuYBmCnaYzxRA2qTN4VK/5oD+8Hc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MlFsNU9lVitxVDAzNjFzckxsNnJQemdkVFVnSXJnVnRnVFlETXRucG4xbzRX?=
 =?utf-8?B?bDl5QzNRbGFZdlBNbG5BVEJXWTZmK2I1YXB4ODl5Uk90cjdwbmpvM2x1UG5p?=
 =?utf-8?B?RmNXbWE1dTIrQ1FuMmQrN2RXVHVDenZaRGxDWW1ZcjB3eWFlbDNCaWlUM1FB?=
 =?utf-8?B?MzNEZWNWV0lkb1RaZGtCRmZSbUpHbGZGNGg3ZzdSNjdqcU1rU0JDSUFHbVB5?=
 =?utf-8?B?NXNNMkV2UzF1Y3hQbUExeTd3QlZ1MjhRU0dQaWpBWURJVGZ6N2dodWtBT1ht?=
 =?utf-8?B?eWdZOUNsaGNTM25RUGtBQklOemR4V2JhdmJHKytnbTd4NWxTajloOVBYUXBH?=
 =?utf-8?B?VTB4aUl6U1JLaXVPNGtZREQyb2JUZkpoOGNsaE4wUkVVQ2RzL29LZWJJVTNP?=
 =?utf-8?B?WFY5K3ROUzlDdVFBV2ZvMnUyZDhweU96QVpKd1RCa2lzUit2cUl6c3l3Vklr?=
 =?utf-8?B?c1J4YzQrKzcyVkVTTDk5UFFWd1NlQ3hTNjFyclBWYS8xemtiZEdRRXZaaDFC?=
 =?utf-8?B?YlowazJUbkFzckgvUTE5WVFJcEdTVDZyNG5OWVVzZkJSSlJyWVU0VkVKSDJF?=
 =?utf-8?B?QUxBdlAzRm83RzlEN0djVDQ3Nms4cHJvUk41dy9DcjBrWEhsdFErb0thSldU?=
 =?utf-8?B?ekREQk14YWFoM0dEYzRCaitJQnBxbE42RGNXYmFHTWZLelh4NDFaSlArd0VH?=
 =?utf-8?B?aTQ1aXZzN2JkOFJhazgwSlBNV0I0dzhEaHVxNGQ3YzZDcllGRkJQR05lVzJN?=
 =?utf-8?B?eUpBN0tCaEFaWUZLUzByYXdsMC9EeDNXUDhodFJGb1R6UlJqREltWkdWczYr?=
 =?utf-8?B?Ym5CZlZIc1EwRTUvUUVEQjJ0YnpQbVJ2elNQY2luUUhQT0RsWkRTT3EzQjZa?=
 =?utf-8?B?elBRalBsaGs3Q0Y0UmdTWWxIRWs5M0hGUHhaNU1PTjBGSUZJSGhLZjV5OW8r?=
 =?utf-8?B?Y1JlWWRBZDUxTjVmOFA3QjBMOW9VV05LNkgyQVcyek1GZzB4OXJPZXVGL1hX?=
 =?utf-8?B?eWtEQ0tCbnNyUzNBSnNUWGhTRzF2NEd2QUp4b3dOR3Urb05ZV25lZmVyVW5T?=
 =?utf-8?B?R1MwTklrb1lKZ0dCaEVuamdGckx2bTNOUHdMOVN1WkdxWlBnUlJvb2ljSkpw?=
 =?utf-8?B?cW1HWm9QS0tDQTc5YVViODFEUGUxNHMxcXVCSjhTVEJjbzhmRjRLZzhwSVJy?=
 =?utf-8?B?ZVYzemxnRUcvODR2ZDhxVXV3OUFXREptdkhqVnZNS2F0ejcrQ0RlQlZSNUI5?=
 =?utf-8?B?MWUwRXZrS1I1SjRHMVErVVF5TFg5djBON0V3eUhaV081M1BFQzF0a21nOVJ3?=
 =?utf-8?B?Y3hYVUJHQXhHZDhOODEzd0l3ZFdGNXR4azk0eW53WW1pdmo0QWdZL2hTU095?=
 =?utf-8?B?ZUFZMit1dUE5VUo4UWl1a1R3Tkc1TUVRUXhTRnh6SkozZVZVQU91eXFLbXNh?=
 =?utf-8?B?d3NzeGUwRmNVaElPWWswcDlDT3lqK042aXlxWkgzanhMMTVwOEJZWWl4ckVz?=
 =?utf-8?B?S09zZTlDMEY2OHVTZkJaRi95d3M1clcyYm5QZGMrOGlzK3ZJVmpDcy9DTjRl?=
 =?utf-8?B?VWdJOW1PeWphMFF3dGtEajJYZVUyS2dicW1mRkZrQ1JsYWFDTTlndmkrZUpY?=
 =?utf-8?B?dDJCU3pKNEFhdlY5TnFLSEFQNW9VMHpQQi9XVlpuLzJXeElhMFBqNWVmWGVs?=
 =?utf-8?B?cmFBNCtveVhraGNxVjUvMW5mNWdHcG9LTkZUNzRHT3dNTlNqYmVjOUdIeFJB?=
 =?utf-8?B?VTVBeFA2Ly8vb0RtZ05yeFBNaW4razRqMjAxRXVFV0tQT291TkhoeHMxYzR5?=
 =?utf-8?B?UXN6dFlzak8rMk9BSWdaTHlyZ2NQK3ZGcmlJOGtYZEErb0ZEY0NTK2pESHU5?=
 =?utf-8?B?TkRwS2UzYk4xRGFjbmZ5WnBKc0tsRm94RkNRTGhyUUxoYVRBeE82U1VsSW5U?=
 =?utf-8?B?c0pTY1NtdjkraUV2bXFLd3N6TzRZK2hpTnhUTjY1WmNYL3ZzZlBwYm5PK1Vi?=
 =?utf-8?B?cW1BVHdLdUhlMmpKbHIreHl1Y0RDbEhJcmZRVGJ4RUp5VlRkeU9leW1lWkox?=
 =?utf-8?B?TnBBTHpNc2pCdU83VUVBR3ZmZEhOS0hKZnBLSW03NWVWYVFDNDNRNEh0MFg2?=
 =?utf-8?B?Uy91SGRzQWpsS3JkdHJ3SC9PQXFPb3pQK3pRUlVZU2FIbGRvT2FEb2pveUpF?=
 =?utf-8?B?emc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a5edefc-1d69-4d5e-05a5-08de10f36aaa
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 22:44:38.8380 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dfm2KRkUi1jGsOIxxNMckfXNZYfNLcNHUhFytEYAuvkqAWedfHQohPt+hqk4D+G4akzRSLXf1HUDbmIG/FLXSScJNa+N5dg6rjVs2S5LUjw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFF28037229
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

In addition to generic VFIO PCI functionality, the driver implements
VFIO migration uAPI, allowing userspace to enable migration for Intel
Graphics SR-IOV Virtual Functions.
The driver binds to VF device, and uses API exposed by Xe driver bound
to PF device to control VF device state and transfer the migration data.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 MAINTAINERS                  |   7 +
 drivers/vfio/pci/Kconfig     |   2 +
 drivers/vfio/pci/Makefile    |   2 +
 drivers/vfio/pci/xe/Kconfig  |  12 +
 drivers/vfio/pci/xe/Makefile |   3 +
 drivers/vfio/pci/xe/main.c   | 470 +++++++++++++++++++++++++++++++++++
 6 files changed, 496 insertions(+)
 create mode 100644 drivers/vfio/pci/xe/Kconfig
 create mode 100644 drivers/vfio/pci/xe/Makefile
 create mode 100644 drivers/vfio/pci/xe/main.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 096fcca26dc76..255fcb01c98e1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26976,6 +26976,13 @@ L:	virtualization@lists.linux.dev
 S:	Maintained
 F:	drivers/vfio/pci/virtio
 
+VFIO XE PCI DRIVER
+M:	Michał Winiarski <michal.winiarski@intel.com>
+L:	kvm@vger.kernel.org
+L:	intel-xe@lists.freedesktop.org
+S:	Supported
+F:	drivers/vfio/pci/xe
+
 VGA_SWITCHEROO
 R:	Lukas Wunner <lukas@wunner.de>
 S:	Maintained
diff --git a/drivers/vfio/pci/Kconfig b/drivers/vfio/pci/Kconfig
index 2b0172f546652..c100f0ab87f2d 100644
--- a/drivers/vfio/pci/Kconfig
+++ b/drivers/vfio/pci/Kconfig
@@ -67,4 +67,6 @@ source "drivers/vfio/pci/nvgrace-gpu/Kconfig"
 
 source "drivers/vfio/pci/qat/Kconfig"
 
+source "drivers/vfio/pci/xe/Kconfig"
+
 endmenu
diff --git a/drivers/vfio/pci/Makefile b/drivers/vfio/pci/Makefile
index cf00c0a7e55c8..f5d46aa9347b9 100644
--- a/drivers/vfio/pci/Makefile
+++ b/drivers/vfio/pci/Makefile
@@ -19,3 +19,5 @@ obj-$(CONFIG_VIRTIO_VFIO_PCI) += virtio/
 obj-$(CONFIG_NVGRACE_GPU_VFIO_PCI) += nvgrace-gpu/
 
 obj-$(CONFIG_QAT_VFIO_PCI) += qat/
+
+obj-$(CONFIG_XE_VFIO_PCI) += xe/
diff --git a/drivers/vfio/pci/xe/Kconfig b/drivers/vfio/pci/xe/Kconfig
new file mode 100644
index 0000000000000..787be88268685
--- /dev/null
+++ b/drivers/vfio/pci/xe/Kconfig
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config XE_VFIO_PCI
+	tristate "VFIO support for Intel Graphics"
+	depends on DRM_XE
+	select VFIO_PCI_CORE
+	help
+	  This option enables vendor-specific VFIO driver for Intel Graphics.
+	  In addition to generic VFIO PCI functionality, it implements VFIO
+	  migration uAPI allowing userspace to enable migration for
+	  Intel Graphics SR-IOV Virtual Functions supported by the Xe driver.
+
+	  If you don't know what to do here, say N.
diff --git a/drivers/vfio/pci/xe/Makefile b/drivers/vfio/pci/xe/Makefile
new file mode 100644
index 0000000000000..13aa0fd192cd4
--- /dev/null
+++ b/drivers/vfio/pci/xe/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_XE_VFIO_PCI) += xe-vfio-pci.o
+xe-vfio-pci-y := main.o
diff --git a/drivers/vfio/pci/xe/main.c b/drivers/vfio/pci/xe/main.c
new file mode 100644
index 0000000000000..bea992cdee6b0
--- /dev/null
+++ b/drivers/vfio/pci/xe/main.c
@@ -0,0 +1,470 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include <linux/anon_inodes.h>
+#include <linux/delay.h>
+#include <linux/file.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+#include <linux/sizes.h>
+#include <linux/types.h>
+#include <linux/vfio.h>
+#include <linux/vfio_pci_core.h>
+
+#include <drm/intel/xe_sriov_vfio.h>
+
+/**
+ * struct xe_vfio_pci_migration_file - file used for reading / writing migration data
+ */
+struct xe_vfio_pci_migration_file {
+	/** @filp: pointer to underlying &struct file */
+	struct file *filp;
+	/** @lock: serializes accesses to migration data */
+	struct mutex lock;
+	/** @xe_vdev: backpointer to &struct xe_vfio_pci_core_device */
+	struct xe_vfio_pci_core_device *xe_vdev;
+};
+
+/**
+ * struct xe_vfio_pci_core_device - xe-specific vfio_pci_core_device
+ *
+ * Top level structure of xe_vfio_pci.
+ */
+struct xe_vfio_pci_core_device {
+	/** @core_device: vendor-agnostic VFIO device */
+	struct vfio_pci_core_device core_device;
+
+	/** @mig_state: current device migration state */
+	enum vfio_device_mig_state mig_state;
+
+	/** @vfid: VF number used by PF, xe uses 1-based indexing for vfid */
+	unsigned int vfid;
+
+	/** @pf: pointer to driver_private of physical function */
+	struct pci_dev *pf;
+
+	/** @fd: &struct xe_vfio_pci_migration_file for userspace to read/write migration data */
+	struct xe_vfio_pci_migration_file *fd;
+};
+
+#define xe_vdev_to_dev(xe_vdev) (&(xe_vdev)->core_device.pdev->dev)
+#define xe_vdev_to_pdev(xe_vdev) ((xe_vdev)->core_device.pdev)
+
+static void xe_vfio_pci_disable_file(struct xe_vfio_pci_migration_file *migf)
+{
+	struct xe_vfio_pci_core_device *xe_vdev = migf->xe_vdev;
+
+	mutex_lock(&migf->lock);
+	xe_vdev->fd = NULL;
+	mutex_unlock(&migf->lock);
+}
+
+static void xe_vfio_pci_reset(struct xe_vfio_pci_core_device *xe_vdev)
+{
+	if (xe_vdev->fd)
+		xe_vfio_pci_disable_file(xe_vdev->fd);
+
+	xe_vdev->mig_state = VFIO_DEVICE_STATE_RUNNING;
+}
+
+static void xe_vfio_pci_reset_done(struct pci_dev *pdev)
+{
+	struct xe_vfio_pci_core_device *xe_vdev = pci_get_drvdata(pdev);
+	int ret;
+
+	ret = xe_sriov_vfio_wait_flr_done(xe_vdev->pf, xe_vdev->vfid);
+	if (ret)
+		dev_err(&pdev->dev, "Failed to wait for FLR: %d\n", ret);
+
+	xe_vfio_pci_reset(xe_vdev);
+}
+
+static const struct pci_error_handlers xe_vfio_pci_err_handlers = {
+	.reset_done = xe_vfio_pci_reset_done,
+};
+
+static int xe_vfio_pci_open_device(struct vfio_device *core_vdev)
+{
+	struct xe_vfio_pci_core_device *xe_vdev =
+		container_of(core_vdev, struct xe_vfio_pci_core_device, core_device.vdev);
+	struct vfio_pci_core_device *vdev = &xe_vdev->core_device;
+	int ret;
+
+	ret = vfio_pci_core_enable(vdev);
+	if (ret)
+		return ret;
+
+	vfio_pci_core_finish_enable(vdev);
+
+	return 0;
+}
+
+static int xe_vfio_pci_release_file(struct inode *inode, struct file *filp)
+{
+	struct xe_vfio_pci_migration_file *migf = filp->private_data;
+
+	xe_vfio_pci_disable_file(migf);
+	mutex_destroy(&migf->lock);
+	kfree(migf);
+
+	return 0;
+}
+
+static ssize_t xe_vfio_pci_save_read(struct file *filp, char __user *buf, size_t len, loff_t *pos)
+{
+	struct xe_vfio_pci_migration_file *migf = filp->private_data;
+	ssize_t ret;
+
+	if (pos)
+		return -ESPIPE;
+
+	mutex_lock(&migf->lock);
+	ret = xe_sriov_vfio_data_read(migf->xe_vdev->pf, migf->xe_vdev->vfid, buf, len);
+	mutex_unlock(&migf->lock);
+
+	return ret;
+}
+
+static const struct file_operations xe_vfio_pci_save_fops = {
+	.owner = THIS_MODULE,
+	.read = xe_vfio_pci_save_read,
+	.release = xe_vfio_pci_release_file,
+	.llseek = noop_llseek,
+};
+
+static ssize_t xe_vfio_pci_resume_write(struct file *filp, const char __user *buf,
+					size_t len, loff_t *pos)
+{
+	struct xe_vfio_pci_migration_file *migf = filp->private_data;
+	ssize_t ret;
+
+	if (pos)
+		return -ESPIPE;
+
+	mutex_lock(&migf->lock);
+	ret = xe_sriov_vfio_data_write(migf->xe_vdev->pf, migf->xe_vdev->vfid, buf, len);
+	mutex_unlock(&migf->lock);
+
+	return ret;
+}
+
+static const struct file_operations xe_vfio_pci_resume_fops = {
+	.owner = THIS_MODULE,
+	.write = xe_vfio_pci_resume_write,
+	.release = xe_vfio_pci_release_file,
+	.llseek = noop_llseek,
+};
+
+static const char *vfio_dev_state_str(u32 state)
+{
+	switch (state) {
+	case VFIO_DEVICE_STATE_RUNNING: return "running";
+	case VFIO_DEVICE_STATE_RUNNING_P2P: return "running_p2p";
+	case VFIO_DEVICE_STATE_STOP_COPY: return "stopcopy";
+	case VFIO_DEVICE_STATE_STOP: return "stop";
+	case VFIO_DEVICE_STATE_RESUMING: return "resuming";
+	case VFIO_DEVICE_STATE_ERROR: return "error";
+	default: return "";
+	}
+}
+
+enum xe_vfio_pci_file_type {
+	XE_VFIO_FILE_SAVE = 0,
+	XE_VFIO_FILE_RESUME,
+};
+
+static struct xe_vfio_pci_migration_file *
+xe_vfio_pci_alloc_file(struct xe_vfio_pci_core_device *xe_vdev,
+		       enum xe_vfio_pci_file_type type)
+{
+	struct xe_vfio_pci_migration_file *migf;
+	const struct file_operations *fops;
+	int flags;
+
+	migf = kzalloc(sizeof(*migf), GFP_KERNEL);
+	if (!migf)
+		return ERR_PTR(-ENOMEM);
+
+	fops = type == XE_VFIO_FILE_SAVE ? &xe_vfio_pci_save_fops : &xe_vfio_pci_resume_fops;
+	flags = type == XE_VFIO_FILE_SAVE ? O_RDONLY : O_WRONLY;
+	migf->filp = anon_inode_getfile("xe_vfio_mig", fops, migf, flags);
+	if (IS_ERR(migf->filp)) {
+		kfree(migf);
+		return ERR_CAST(migf->filp);
+	}
+
+	mutex_init(&migf->lock);
+	migf->xe_vdev = xe_vdev;
+	xe_vdev->fd = migf;
+
+	stream_open(migf->filp->f_inode, migf->filp);
+
+	return migf;
+}
+
+static struct file *
+xe_vfio_set_state(struct xe_vfio_pci_core_device *xe_vdev, u32 new)
+{
+	u32 cur = xe_vdev->mig_state;
+	int ret;
+
+	dev_dbg(xe_vdev_to_dev(xe_vdev),
+		"state: %s->%s\n", vfio_dev_state_str(cur), vfio_dev_state_str(new));
+
+	/*
+	 * "STOP" handling is reused for "RUNNING_P2P", as the device doesn't have the capability to
+	 * selectively block p2p DMA transfers.
+	 * The device is not processing new workload requests when the VF is stopped, and both
+	 * memory and MMIO communication channels are transferred to destination (where processing
+	 * will be resumed).
+	 */
+	if ((cur == VFIO_DEVICE_STATE_RUNNING && new == VFIO_DEVICE_STATE_STOP) ||
+	    (cur == VFIO_DEVICE_STATE_RUNNING && new == VFIO_DEVICE_STATE_RUNNING_P2P)) {
+		ret = xe_sriov_vfio_stop(xe_vdev->pf, xe_vdev->vfid);
+		if (ret)
+			goto err;
+
+		return NULL;
+	}
+
+	if ((cur == VFIO_DEVICE_STATE_RUNNING_P2P && new == VFIO_DEVICE_STATE_STOP) ||
+	    (cur == VFIO_DEVICE_STATE_STOP && new == VFIO_DEVICE_STATE_RUNNING_P2P))
+		return NULL;
+
+	if ((cur == VFIO_DEVICE_STATE_STOP && new == VFIO_DEVICE_STATE_RUNNING) ||
+	    (cur == VFIO_DEVICE_STATE_RUNNING_P2P && new == VFIO_DEVICE_STATE_RUNNING)) {
+		ret = xe_sriov_vfio_run(xe_vdev->pf, xe_vdev->vfid);
+		if (ret)
+			goto err;
+
+		return NULL;
+	}
+
+	if (cur == VFIO_DEVICE_STATE_STOP && new == VFIO_DEVICE_STATE_STOP_COPY) {
+		struct xe_vfio_pci_migration_file *migf;
+
+		migf = xe_vfio_pci_alloc_file(xe_vdev, XE_VFIO_FILE_SAVE);
+		if (IS_ERR(migf)) {
+			ret = PTR_ERR(migf);
+			goto err;
+		}
+
+		ret = xe_sriov_vfio_stop_copy_enter(xe_vdev->pf, xe_vdev->vfid);
+		if (ret) {
+			fput(migf->filp);
+			goto err;
+		}
+
+		return migf->filp;
+	}
+
+	if ((cur == VFIO_DEVICE_STATE_STOP_COPY && new == VFIO_DEVICE_STATE_STOP)) {
+		if (xe_vdev->fd)
+			xe_vfio_pci_disable_file(xe_vdev->fd);
+
+		xe_sriov_vfio_stop_copy_exit(xe_vdev->pf, xe_vdev->vfid);
+
+		return NULL;
+	}
+
+	if (cur == VFIO_DEVICE_STATE_STOP && new == VFIO_DEVICE_STATE_RESUMING) {
+		struct xe_vfio_pci_migration_file *migf;
+
+		migf = xe_vfio_pci_alloc_file(xe_vdev, XE_VFIO_FILE_RESUME);
+		if (IS_ERR(migf)) {
+			ret = PTR_ERR(migf);
+			goto err;
+		}
+
+		ret = xe_sriov_vfio_resume_enter(xe_vdev->pf, xe_vdev->vfid);
+		if (ret) {
+			fput(migf->filp);
+			goto err;
+		}
+
+		return migf->filp;
+	}
+
+	if (cur == VFIO_DEVICE_STATE_RESUMING && new == VFIO_DEVICE_STATE_STOP) {
+		if (xe_vdev->fd)
+			xe_vfio_pci_disable_file(xe_vdev->fd);
+
+		xe_sriov_vfio_resume_exit(xe_vdev->pf, xe_vdev->vfid);
+
+		return NULL;
+	}
+
+	if (new == VFIO_DEVICE_STATE_ERROR)
+		xe_sriov_vfio_error(xe_vdev->pf, xe_vdev->vfid);
+
+	WARN(true, "Unknown state transition %d->%d", cur, new);
+	return ERR_PTR(-EINVAL);
+
+err:
+	dev_dbg(xe_vdev_to_dev(xe_vdev),
+		"Failed to transition state: %s->%s err=%d\n",
+		vfio_dev_state_str(cur), vfio_dev_state_str(new), ret);
+	return ERR_PTR(ret);
+}
+
+static struct file *
+xe_vfio_pci_set_device_state(struct vfio_device *core_vdev,
+			     enum vfio_device_mig_state new_state)
+{
+	struct xe_vfio_pci_core_device *xe_vdev =
+		container_of(core_vdev, struct xe_vfio_pci_core_device, core_device.vdev);
+	enum vfio_device_mig_state next_state;
+	struct file *f = NULL;
+	int ret;
+
+	while (new_state != xe_vdev->mig_state) {
+		ret = vfio_mig_get_next_state(core_vdev, xe_vdev->mig_state,
+					      new_state, &next_state);
+		if (ret) {
+			f = ERR_PTR(ret);
+			break;
+		}
+		f = xe_vfio_set_state(xe_vdev, next_state);
+		if (IS_ERR(f))
+			break;
+
+		xe_vdev->mig_state = next_state;
+
+		/* Multiple state transitions with non-NULL file in the middle */
+		if (f && new_state != xe_vdev->mig_state) {
+			fput(f);
+			f = ERR_PTR(-EINVAL);
+			break;
+		}
+	}
+
+	return f;
+}
+
+static int xe_vfio_pci_get_device_state(struct vfio_device *core_vdev,
+					enum vfio_device_mig_state *curr_state)
+{
+	struct xe_vfio_pci_core_device *xe_vdev =
+		container_of(core_vdev, struct xe_vfio_pci_core_device, core_device.vdev);
+
+	*curr_state = xe_vdev->mig_state;
+
+	return 0;
+}
+
+static int xe_vfio_pci_get_data_size(struct vfio_device *vdev,
+				     unsigned long *stop_copy_length)
+{
+	struct xe_vfio_pci_core_device *xe_vdev =
+		container_of(vdev, struct xe_vfio_pci_core_device, core_device.vdev);
+
+	*stop_copy_length = xe_sriov_vfio_stop_copy_size(xe_vdev->pf, xe_vdev->vfid);
+
+	return 0;
+}
+
+static const struct vfio_migration_ops xe_vfio_pci_migration_ops = {
+	.migration_set_state = xe_vfio_pci_set_device_state,
+	.migration_get_state = xe_vfio_pci_get_device_state,
+	.migration_get_data_size = xe_vfio_pci_get_data_size,
+};
+
+static void xe_vfio_pci_migration_init(struct vfio_device *core_vdev)
+{
+	struct xe_vfio_pci_core_device *xe_vdev =
+		container_of(core_vdev, struct xe_vfio_pci_core_device, core_device.vdev);
+	struct pci_dev *pdev = to_pci_dev(core_vdev->dev);
+
+	if (!xe_sriov_vfio_migration_supported(pdev->physfn))
+		return;
+
+	/* vfid starts from 1 for xe */
+	xe_vdev->vfid = pci_iov_vf_id(pdev) + 1;
+	xe_vdev->pf = pdev->physfn;
+
+	core_vdev->migration_flags = VFIO_MIGRATION_STOP_COPY | VFIO_MIGRATION_P2P;
+	core_vdev->mig_ops = &xe_vfio_pci_migration_ops;
+}
+
+static int xe_vfio_pci_init_dev(struct vfio_device *core_vdev)
+{
+	struct pci_dev *pdev = to_pci_dev(core_vdev->dev);
+
+	if (pdev->is_virtfn && strcmp(pdev->physfn->dev.driver->name, "xe") == 0)
+		xe_vfio_pci_migration_init(core_vdev);
+
+	return vfio_pci_core_init_dev(core_vdev);
+}
+
+static const struct vfio_device_ops xe_vfio_pci_ops = {
+	.name = "xe-vfio-pci",
+	.init = xe_vfio_pci_init_dev,
+	.release = vfio_pci_core_release_dev,
+	.open_device = xe_vfio_pci_open_device,
+	.close_device = vfio_pci_core_close_device,
+	.ioctl = vfio_pci_core_ioctl,
+	.device_feature = vfio_pci_core_ioctl_feature,
+	.read = vfio_pci_core_read,
+	.write = vfio_pci_core_write,
+	.mmap = vfio_pci_core_mmap,
+	.request = vfio_pci_core_request,
+	.match = vfio_pci_core_match,
+	.match_token_uuid = vfio_pci_core_match_token_uuid,
+	.bind_iommufd = vfio_iommufd_physical_bind,
+	.unbind_iommufd = vfio_iommufd_physical_unbind,
+	.attach_ioas = vfio_iommufd_physical_attach_ioas,
+	.detach_ioas = vfio_iommufd_physical_detach_ioas,
+};
+
+static int xe_vfio_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
+{
+	struct xe_vfio_pci_core_device *xe_vdev;
+	int ret;
+
+	xe_vdev = vfio_alloc_device(xe_vfio_pci_core_device, core_device.vdev, &pdev->dev,
+				    &xe_vfio_pci_ops);
+	if (IS_ERR(xe_vdev))
+		return PTR_ERR(xe_vdev);
+
+	dev_set_drvdata(&pdev->dev, &xe_vdev->core_device);
+
+	ret = vfio_pci_core_register_device(&xe_vdev->core_device);
+	if (ret) {
+		vfio_put_device(&xe_vdev->core_device.vdev);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void xe_vfio_pci_remove(struct pci_dev *pdev)
+{
+	struct xe_vfio_pci_core_device *xe_vdev = pci_get_drvdata(pdev);
+
+	vfio_pci_core_unregister_device(&xe_vdev->core_device);
+	vfio_put_device(&xe_vdev->core_device.vdev);
+}
+
+static const struct pci_device_id xe_vfio_pci_table[] = {
+	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_ANY_ID),
+		.class = PCI_BASE_CLASS_DISPLAY << 16, .class_mask = 0xff << 16,
+		.override_only = PCI_ID_F_VFIO_DRIVER_OVERRIDE },
+	{}
+};
+MODULE_DEVICE_TABLE(pci, xe_vfio_pci_table);
+
+static struct pci_driver xe_vfio_pci_driver = {
+	.name = "xe-vfio-pci",
+	.id_table = xe_vfio_pci_table,
+	.probe = xe_vfio_pci_probe,
+	.remove = xe_vfio_pci_remove,
+	.err_handler = &xe_vfio_pci_err_handlers,
+	.driver_managed_dma = true,
+};
+module_pci_driver(xe_vfio_pci_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Intel Corporation");
+MODULE_DESCRIPTION("VFIO PCI driver with migration support for Intel Graphics");
-- 
2.50.1


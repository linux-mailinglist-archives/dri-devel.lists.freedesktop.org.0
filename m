Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCCE9757F8
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 18:09:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8342A10EA42;
	Wed, 11 Sep 2024 16:09:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LNMWZl3k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB04410E55E;
 Wed, 11 Sep 2024 16:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726070954; x=1757606954;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=0aoPZtz3mBBPsneZUb+eRiwcbcXdCH0fiHMW8d/Qw/U=;
 b=LNMWZl3kz4/iyq1UCeXdWbUMlefCqxuw3DHOVEN18uIGLl3D5jujFOo7
 iDfj5YTY8ScP5pAEpFXW+rc4V6yB2FbWbvM2mVgfYHLjV4E83u7ssJDlQ
 NYDzkgVT+Ovya0XXMnbyUYCpACey5KKP5VnoDgYcx4svsaE++h8D3SXaN
 HHow4QfYInML79S3fwaix9zjenQWHXgTO+UkuXeBqRcoR2wb8QV5sPare
 5UfKXjgePLqNhq7Xqj0VZJyLzzAU2t7Q84VTw2PCEXrR74nTeW31LeiLu
 dia9VgEk4IG7/92b5nEQx/hNL22zPlysuUyjKF5wfa4VIdPKo/boOPNcD g==;
X-CSE-ConnectionGUID: FLdWOqx8RKepNaNjyEsz4g==
X-CSE-MsgGUID: fy4eXqd4SOiQagwA+2NAUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="42398290"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; d="scan'208";a="42398290"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 09:09:13 -0700
X-CSE-ConnectionGUID: oxsZ3MxUTZ+VDe0tMh2DQA==
X-CSE-MsgGUID: y8wUto8lQveIE06akm5B5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; d="scan'208";a="71796532"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Sep 2024 09:09:13 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Sep 2024 09:09:12 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Sep 2024 09:09:12 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Sep 2024 09:09:12 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Sep 2024 09:09:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lu7cgYkYIfEQO19BlGTLF9JFGq+YwFz8bq2c2TjP1ZpS0VSsnAWJz3pSTCOZXGBs5p/a0CzzESHr2zZ1jo27YtscgDAtcQ2Ccqp0Qq4Jvoz6jqwKAAQgg74vhNk+JzMnUPBPacZYXRScbiskOM6Zr7G1u0Iu+eD0QXHSIMA2A2kjw+hK50GhnA/qfjyQev4+UmHej+59VF5Lpj+DRpqs34DSF2Osgv8ZOTZA6rOIr9oFzIY88nE8yiHVUlH2jjblnf/pIz8R5eNJal3indxFKxDoPpoq/7H9IuLT7sR1uKlR8/zTF6v8LZ/nmcLhW7LrZEgVDQGwB0JThrVeIrHEHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1piOAhvjJ12bhgg+i4X5vGvDeGvlGy8yOu2lIWs02w0=;
 b=BiB0Qq5k0kp48vA/m2Js6UMNX34gBHS6EtDmlTiBjuKpkoeiKVKymLifKtwi7NwteYrO+dzgIK90r+6WZAoRJYPC9Oue965/QQQI29mLQVg/j4M/5wkhw4iKXcJ3T56GczCOZsy1A6STlShVfyK+BDiWXYUN9+LeIqI6Dqqea1MUsye0m3sk4ElEYc5dJwL4i23BowsatV15sn0ULgHX42ZJLLeAMomyoCg6c2ably1M2lH4mxh5SCxwzscJ3JnjOLa4asnRrBuQuI6DmxUqxaRechgQLCAkr2mtknEnw7islfjyMXZSfDDC2P/W3iXly/UBftKUfh4GQR13Eh5BHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by PH0PR11MB5063.namprd11.prod.outlook.com (2603:10b6:510:3d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.18; Wed, 11 Sep
 2024 16:09:09 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%6]) with mapi id 15.20.7962.016; Wed, 11 Sep 2024
 16:09:09 +0000
Date: Wed, 11 Sep 2024 16:06:48 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <christian.koenig@amd.com>,
 <thomas.hellstrom@linux.intel.com>, <matthew.auld@intel.com>,
 <daniel@ffwll.ch>
Subject: Re: [RFC PATCH 05/28] drm/gpusvm: Add support for GPU Shared Virtual
 Memory
Message-ID: <ZuHAGAxsuXJvzAvd@DUT025-TGLU.fm.intel.com>
References: <20240828024901.2582335-1-matthew.brost@intel.com>
 <20240828024901.2582335-6-matthew.brost@intel.com>
 <ZtBDJCfWxaEOqILc@phenom.ffwll.local>
 <ZtCvcVu3SZsManOw@DUT025-TGLU.fm.intel.com>
 <ZtWnKvaV964EA6mq@phenom.ffwll.local>
 <ZtXv2CTjWx3dG9sC@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZtXv2CTjWx3dG9sC@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: SJ0PR13CA0077.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::22) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|PH0PR11MB5063:EE_
X-MS-Office365-Filtering-Correlation-Id: f03ec083-353d-49b5-1daa-08dcd27c116f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z3lERXVtU2JFNmNqcEFUZ3pxT2FTdXYraW5ndHNsTkgrdkc2bFhlQnFsdU5p?=
 =?utf-8?B?LzIzeDBBc0tLZXBmaU9YZ21oTS9VazRwQ1lxWmhEejEyNGNXRXpFaTgzWHBR?=
 =?utf-8?B?WG1VRXZHd0hpYjlsMnRPcFFRM2xLSzBITHU1Y0RIdWNkMWtIRTVNYitBT3Zh?=
 =?utf-8?B?STgzeFNSa0JGS2Vad0YwcmI2Z2lIZU9BOFUxK0QwMWU0N2pNTmVZTlV3bGZI?=
 =?utf-8?B?OUxzL1RtNjBFSnJUUTkrbkJ5Vit4cTh5UG9LQjNoQVppRFhaTWxFWVpqQ2Rs?=
 =?utf-8?B?MjQ1SFJrd0RRRlV1SWM0R1Z6MlMvM3ExQ2NpUnpmSWNjbUl2OWVmd2FsNG5U?=
 =?utf-8?B?RHNHelA5SHp4T1dJMnJzK2ZpdXMyYm96THJ1OW5VL0RWZ1RNNEtYczZ5V0dU?=
 =?utf-8?B?ZXovSTZic3UyTjdEYzQ4eUZWN2NnTzcvcFBHbnU1VUFGN0xEbUVuQlV3MEhs?=
 =?utf-8?B?aDVhWmlPb2JpclkwbDFsM0pnRHpjcHVVKzBiTkFZd3M2Q1dwZ0Ryb3hucmVC?=
 =?utf-8?B?MHJrQXhvQ0Vqa0hPZm1ueXh2MjBYcTZyWHpMT1FGVW94VVAyK0Z6Z2VGQWM4?=
 =?utf-8?B?dk43RTg1TnVGejdwWU5BbHB4a3ZkQVMrWm1zVmxkY2VvcDlNaXdUdFlwK01Y?=
 =?utf-8?B?Q1o1aWFTZlJqRW9jVnBEd2JKdWkyZ29NK0JZNlhQY0loUTZjSGg3YVo1eTEv?=
 =?utf-8?B?SEluSExTMUZ6dTd0ZHdQL2dHeXFlOGdSZ21DTGN4c1dBQThxeVFLMWwzYWlP?=
 =?utf-8?B?REtkK3dmaDhMeWdCOU5OY284NlFSaE5qUXlzWEZuMVQzU2JTUlp2cVlReDU4?=
 =?utf-8?B?SDFoTlZjODFsWlRFYjBxd0hEUWpJZzNoYTBIMUY4aDBLY1VlNUdrNFhvcndh?=
 =?utf-8?B?RURndVpoaGVUbzAyQUF0TzAyOVlXampYK3JCUkhzSHNoZTA5TEJMbnVQZnVy?=
 =?utf-8?B?SzNJZG05RG5yT3JndjY3QS9uSGoxMnNjaHlTa0NGMlZrUnBHUkZZdGtmN0FV?=
 =?utf-8?B?S2IrWnorQkRoajJES3paQk5HVFRoZ0NWMjJlWEhoU0d2QVk5NVRuSDFPQmNS?=
 =?utf-8?B?K2ZQSkEyVDlHT2NaSGxWMHc3K1V1a1ZKYTZXMVJsTmFyd1liV3JJV3h2K0hU?=
 =?utf-8?B?SkNyNVpnb3p4RDhUcEJqMzFyc1EvRWxpTFZFMDlQV3ZtWlM3aHhCUkVBMWIx?=
 =?utf-8?B?QVVJMzYvRURCSGFUQ0pwTmRmU0Z5WWt6S1c1SVcwQ1ZSSjVzN01PRWtrZU9q?=
 =?utf-8?B?Wkg4SEsydmhaTWtRa3A0MWVoWDRJVTlGOFo1eG9NcFd4SjlsQkFLZXlHb3lQ?=
 =?utf-8?B?L3pQVzJJVEp5Y3RZRUs0c25QQmNaYUl3M29JQXl1blAyc0FTRUtKZGdHNG4v?=
 =?utf-8?B?WW9JaFV5ZExpOHMwM2lTRExrZ1FtQk13bXg2NDArc0JacWdORTJUTjNTM3dp?=
 =?utf-8?B?WkxUOHFEVWtuUWc1a1AyQ3J0SWM0UDFMK00rRHRGK0JXdUVBN1d6bGlUb3Av?=
 =?utf-8?B?YWQvZnlvUGNmYTJCYkxjSlVJNWZrZUhEUldkd1JVaTNGckR4ZzJLMUFDNjdX?=
 =?utf-8?B?V2xqT0xLWlhwZGxYd3ZXMFdoaXdGb3FubEJEV0NpaG9xOXllSjVBY2NIWVdz?=
 =?utf-8?B?d1JuditacXUzSXBrTG9Ga1ZvU3RtWjB3c3ROclJrazExZk13RFVqUWZIRG9K?=
 =?utf-8?B?bkV3L2w3NzFnV1I5MFFTQVp1SVg5NzNUUWxPMDhtSXdHY1BEaGhMR0IzbmJp?=
 =?utf-8?Q?yQ661aEq684aPhs6as=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?blk1dkFKRVlzamxQUnNrb2Jna0xyT2t5cXQxbmhNSFNNNyt2dDJCOUtUSDkw?=
 =?utf-8?B?cW5qY2pzQjhDbXJZTXJMNHJIdHR2SG5aL1JEUk9POThWbWNBUEc0bEt6aHJQ?=
 =?utf-8?B?WHAxOTI2ZEZzeU4vWnQwc0F0RWlWd0lVMzVkeXVmTGZUdXcxU0VkRzd1V0Jy?=
 =?utf-8?B?MGxWWWJ0bERUKzFKMWY2MmdxMEpmb3Y0NXY2NU9sbFdlMi9tWS9JaGwvM3pW?=
 =?utf-8?B?a2VKSTVENE1Oc2JDbW40TjlLbi9SOE5lN1ZZZXVuSyt6ZS8vMmxXTE9MWGlu?=
 =?utf-8?B?SkpwZ201b2F1d005YW80MEF1Rm1kQXgzdElOdlIyM3dUL1h6MlQzWGFyNUZs?=
 =?utf-8?B?cEo2bEJXcjZJVXFaYW44VVZ4QjVZWEZaZXJ1Rkpva01UVXFGT0NzN0xNLzJU?=
 =?utf-8?B?WXMvSDdPRGxmTUszQkpJMDEzRk5xRXdzM0ZBSDdEZGxoTHN1d2dsbkJhdS9H?=
 =?utf-8?B?K3RzNXA5OCtLZ0VyNnpxbWxBemViTFc2WkszeWM4VktudnJ6dWJZU0VpdjE2?=
 =?utf-8?B?TFJ0bE1vS21GMEpSd1J3bHAxWVJ5R2cyMDl2M2FrV29nOFp5QkNvMDZuTkhx?=
 =?utf-8?B?ekVoWXVyQ0k0bW43ZVVFUlM3cytNU3ZqWkQ5RFFCRnpIRUlXV1MvL2xndENW?=
 =?utf-8?B?dkh4bGJpMGJ1UU0wTU9sOVdsTUxrU3FxUGdwYWVTdGs0WHFrZGFLQkJFc1Z2?=
 =?utf-8?B?SFIzU3BwMnM1bUduY0swRmp6b1BGdDFzNXk0WW9sOS8yRzlDNnNxWmh0UUYy?=
 =?utf-8?B?TmhNcVNxamdMaGdnaWplM1dzTllJRUZVMEF3aDJKTW0zU3B1L09URVNRTHNH?=
 =?utf-8?B?aUlkNW1Cd29wTEFpZjR5Snhya3RRbFNHbzFLU0owUXlHdGlNcUtJK1BCdDNs?=
 =?utf-8?B?ZmVkN3FtTi8xc2NBT1dsTXgvZnNQYVlPbTdwNFRybGhaMWVzWHh2cHBzV09u?=
 =?utf-8?B?Q0hOM0pQNldLbGpEbm15TStwamE4RzhaM1hkVGhVcUJJU1I0QUlIZVR0ZzZZ?=
 =?utf-8?B?Qy82YUlTbjA1ZlZQOUozWVFreXRiNXNGTnNlN3pTTmlXZUNEUkx5ZDkwbjFY?=
 =?utf-8?B?Tlp0M2lXVnR1cUo5MUtuMjVPVHNZR2wzQkdJeGN3bFFaaTVJVVlGSGhENnFJ?=
 =?utf-8?B?b09GOHkzNlJkZ1dJK0JTUWIwWG0rV2w1NXlzZ28ybnBER3RQMk52bTkvckdh?=
 =?utf-8?B?NHoza21leTBEbDE3cmtYeDkvMjc1UDgxb1dMdzR2T0kyUVB5N0VLbWNZQkR6?=
 =?utf-8?B?bGJmZU9QRGdERFJ5U3lVbDk3am9SL0Q5SThhdDFoUW9hckFuT2hVWEcwZUZP?=
 =?utf-8?B?Tk1UV2hybFZYRWQ2T1hjc3lIVmlsMGVLZytxRk41U01MQnlPaEliVVNZTHBD?=
 =?utf-8?B?UHFYOUc2dFgydjVQOEZKWWJqL3hxb2Q3c2ZuUFRNY1hTYkZoM1JBVzE1L212?=
 =?utf-8?B?MlRIOUprNDFqY013RUVuZ0crcVlseWFrVTJkZU1uL1A1TDBJL01XQ2c3bUtW?=
 =?utf-8?B?VVNtSWtKRU92dXBad0F1cFVqMHQzK1R5YnJFa0JGUFZtcUdQd3hBYVl2NnlK?=
 =?utf-8?B?Ulp0WTJKT1d6NDRMbVBaTVFHSlFSNWxxQ2RVMVNaMUtCSHRpTzlvYUphQndr?=
 =?utf-8?B?S1JhNFgycWdVWjJNT01LeHJqVVRSTEFOb01HOVdmTy9KbVh6bXF3UmE5OGxC?=
 =?utf-8?B?aEtkdzNJUWFKZ21tbkxvM0dsTUl6d2YxenRqcXZCbVgrZ0JXZ0JYbWo4aXZD?=
 =?utf-8?B?aTZjTnJmNVkreTRoMHFCZHMzY2xudExoNXFQOXhLTTh3US9HMVJIWVBhbkxP?=
 =?utf-8?B?VlBDbkNJMVRrSW9hV3dVZi9oTHhFbXdOblJZZGwvV3pxc2lBOThZOHg4ZUpo?=
 =?utf-8?B?cnQvQklLUDlkcDkxR0VPUlJtclJ6cjFtZ2xuSDlqdUdDdkFaRHBtcmRKaW92?=
 =?utf-8?B?SjBLeWZ1b2wrUGZOOWR2d0lGT05ubUF2clNMeG5KTnYyZE1wTzZXM1NDamxl?=
 =?utf-8?B?bmp5RCtqNTc2Ri9HOEkwSjBRQmlWZjdjYWJJQTZ2TDJOZU5yWkVvV3Fza3ZI?=
 =?utf-8?B?bk44djJZc1RXenZZK3pFZG41TTJoRjltakVCSGJKL3piUkMzaHo5dzFpTkp5?=
 =?utf-8?B?amdNdUdVaUVjb2tmdUJ0RHpBQnY3U0xRWGppSVJuamFtUVFabjg1NkhxeS9B?=
 =?utf-8?B?YUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f03ec083-353d-49b5-1daa-08dcd27c116f
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 16:09:09.2149 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6YxRpRmbpsGJr4hUcqB9h1h5ojV0UEj8y9sDZkYNXaUbKWyjb/Z41Rmyw8a7RMrBfyxNddKcA45wFvpAR4Hhbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5063
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

On Mon, Sep 02, 2024 at 05:03:20PM +0000, Matthew Brost wrote:
> On Mon, Sep 02, 2024 at 01:53:14PM +0200, Daniel Vetter wrote:
> > On Thu, Aug 29, 2024 at 05:27:13PM +0000, Matthew Brost wrote:
> > > On Thu, Aug 29, 2024 at 11:45:08AM +0200, Daniel Vetter wrote:
> > > > On Tue, Aug 27, 2024 at 07:48:38PM -0700, Matthew Brost wrote:
> > > > > This patch introduces support for GPU Shared Virtual Memory (SVM) in the
> > > > > Direct Rendering Manager (DRM) subsystem. SVM allows for seamless
> > > > > sharing of memory between the CPU and GPU, enhancing performance and
> > > > > flexibility in GPU computing tasks.
> > > > > 
> > > > > The patch adds the necessary infrastructure for SVM, including data
> > > > > structures and functions for managing SVM ranges and notifiers. It also
> > > > > provides mechanisms for allocating, deallocating, and migrating memory
> > > > > regions between system RAM and GPU VRAM.
> > > > > 
> > > > > This mid-layer is largely inspired by GPUVM.
> > > > > 
> > > > > Cc: Dave Airlie <airlied@redhat.com>
> > > > > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > > > Cc: Christian König <christian.koenig@amd.com>
> > > > > Cc: <dri-devel@lists.freedesktop.org>
> > > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > 
> > > > Still not sure I've got the right race that you paper over with
> > > > mmap_write_lock, but I spotted a few things, commments inline.
> > > > 
> > > 
> > > I've replied to this issue several times, let's table the
> > > mmap_write_lock issue in this reply - a lot of other things to get
> > > through. Current thinking is try to add a range->migrate_lock like AMD
> > > which I state here [1]. Let's continue discussing the mmap lock issue
> > > there if possible.
> > 
> > Yeah I wrote replies as I read code, so there's a bit a mess from my side
> > here. Apologies for that.
> > 
> 
> All good, has been quite helpful thus far.
> 
> > > [1] https://patchwork.freedesktop.org/patch/610957/?series=137870&rev=1#comment_1111169
> > 
> > Some more replies below that I think we haven't covered anywhere else yet.
> > 
> > > > > + * 2) Garbage Collector.
> > > > > + *
> > > > > + *	void __driver_garbage_collector(struct drm_gpusvm *gpusvm,
> > > > > + *					struct drm_gpusvm_range *range)
> > > > > + *	{
> > > > > + *		struct drm_gpusvm_ctx ctx = {};
> > > > > + *
> > > > > + *		assert_driver_svm_locked(gpusvm);
> > > > > + *
> > > > > + *		// Partial unmap, migrate any remaining VRAM pages back to SRAM
> > > > > + *		if (range->flags.partial_unmap)
> > > > > + *			drm_gpusvm_migrate_to_sram(gpusvm, range, &ctx);
> > > > 
> > > > Note that the migration back to sram isn't guaranteed to succeed, so you
> > > > might be still stuck with partially migrated range. This might be a case
> > > > where hmm gives you vram pfns, but the range you have doesn't have any
> > > > vram allocation anymore because you droppped it here. Not sure tbh.
> > > >
> > > 
> > > Hmm isn't the picture here nor will a VMA once the
> > > drm_gpusvm_evict_to_sram path is always taken as discussed here [2]. I
> > > might have a corner case BO refcounting / TTM resource lookup bug in
> > > somewhere in here which needs to be resolved though (e.g. eviction
> > > racing with this code path), will try to close on that.
> > > 
> > > [2] https://patchwork.freedesktop.org/patch/610955/?series=137870&rev=1#comment_1111164
> > 
> > So maybe my understanding is wrong, but from my reading of the device
> > migration code the exact same non-guarantees as for the sram2sram
> > migration code apply:
> > 
> > - There's no guarantee the page/folio doesn't have an elevated refcount,
> >   which makes the migration fail (in try_to_migrate, where it checks for
> >   surplus refcounts).
> > 
> > - There's no guarantee you'll get the page/folio lock, which makes the
> >   migration fail. Worse the core mm seems to use a fallback to per-page
> >   locking as it's extremely crude "get out of deadlocks due to acquiring
> >   multiple page locks" card.
> >
> 
> I think this circles back to basically the design must be able to move
> VRAM -> SRAM because the host can't access VRAM. Certainly in the CPU
> page fault path this can't fail on the fauling page at least or if it
> does the app gets segfaulted. I'll investigate more here but that is
> still my current thinking. If VRAM -> SRAM can fail / make partial
> progress in eviction paths, then mixed mappings likely need to be
> supported which shouldn't be all that painful - basically just need
> cursor in the bind code which can walk mixed mappings.
> 
> SRAM -> VRAM certainly can fail which is handled by just aborting the
> migration.
> 
> > > > > +map_pages:
> > > > > +	if (is_device_private_page(hmm_pfn_to_page(pfns[0]))) {
> > > > > +		WARN_ON_ONCE(!range->vram_allocation);
> > > > > +
> > > > > +		for (i = 0; i < npages; ++i) {
> > > > > +			pages[i] = hmm_pfn_to_page(pfns[i]);
> > > > > +
> > > > > +			if (WARN_ON_ONCE(!is_device_private_page(pages[i]))) {
> > > > > +				err = -EOPNOTSUPP;
> > > > > +				goto err_free;
> > > > > +			}
> > > > > +		}
> > > > 
> > > > You can't do the above, because the pfn you get from hmm come with zero
> > > > guarantees, you neither hold a page reference nor the page lock. The only
> > > > thing you can do is grab the pagetable lock (or mmu notifier locks) and
> > > > check it's still valid, before you can touch any state. I think the
> > > > range->vram_allocation is probably always valid since you clean that up
> > > > under the same lock/thread, but there's good chances the vram allocation
> > > > is otherwise already gone for good. Or you get an inconsistent snapshot.
> > > > 
> > > 
> > > I haven't seen this pop in my testing yet which is fairly thorough. My
> > > thinking was migration always being enforced at range grainularity we'd
> > > never get mixed mappings from the core as migration is completely under
> > > control of the driver. Maybe I'm not understanding what you are saying
> > > here...
> > 
> > So one scenario is that you race (without the mmap write lock or the
> > migration_mutex design ofc) with another invalidate, and get a partial
> > view here of mixed vram and sram pages. Until you acquire the mmu notifier
> > lock and have made sure your pages are still valid, there's essentially no
> > guarantee.
> 
> The pages are collected in notifier stable state via the hmm locking +
> seqno begin and recheck. Before they can used (e.g. program a bind) yes
> the notifier lock needs to be taken to ensure they haven't changed
> between collection and used - at least this my understanding.
> 
> > > 
> > > > > +
> > > > > +		/* Do not race with notifier unmapping pages */
> > > > > +		drm_gpusvm_notifier_lock(gpusvm);
> > > > > +		range->flags.has_vram_pages = true;
> > > > > +		range->pages = pages;
> > > > > +		if (mmu_interval_read_retry(notifier, hmm_range.notifier_seq)) {
> > > > > +			err = -EAGAIN;
> > > > > +			__drm_gpusvm_range_unmap_pages(gpusvm, range);
> > > > > +		}
> > > > > +		drm_gpusvm_notifier_unlock(gpusvm);
> > > > > +	} else {
> > > > > +		dma_addr_t *dma_addr = (dma_addr_t *)pfns;
> > > > > +
> > > > > +		for_each_dma_page(i, j, npages, order) {
> > > > > +			if (WARN_ON_ONCE(i && order !=
> > > > > +					 hmm_pfn_to_map_order(pfns[i]))) {
> > > > > +				err = -EOPNOTSUPP;
> > > > > +				npages = i;
> > > > > +				goto err_unmap;
> > > > > +			}
> > > > > +			order = hmm_pfn_to_map_order(pfns[i]);
> > > > > +
> > > > > +			pages[j] = hmm_pfn_to_page(pfns[i]);
> > > > > +			if (WARN_ON_ONCE(is_zone_device_page(pages[j]))) {
> > > > > +				err = -EOPNOTSUPP;
> > > > > +				npages = i;
> > > > > +				goto err_unmap;
> > > > > +			}
> > > > > +
> > > > > +			set_page_dirty_lock(pages[j]);
> > > > > +			mark_page_accessed(pages[j]);
> > > > 
> > > > You can't do these, because you don't hold a page reference. They're also
> > > > not needed because hmm_range_fault goes thorugh the full mkwrite dance,
> > > > which takes care of these, unlike the gup family of functions.
> > > >
> > > 
> > > This is a left over from our existing userpte code and it does appear to
> > > be incorrect. Let me remove this and fixup our userptr code while I'm at
> > > it.
> > 
> > Ack.
> > 
> > > > > +	vas = vma_lookup(mm, start);
> > > > > +	if (!vas) {
> > > > > +		err = -ENOENT;
> > > > > +		goto err_mmunlock;
> > > > > +	}
> > > > > +
> > > > > +	if (end > vas->vm_end || start < vas->vm_start) {
> > > > > +		err = -EINVAL;
> > > > > +		goto err_mmunlock;
> > > > > +	}
> > > > > +
> > > > > +	if (!vma_is_anonymous(vas)) {
> > > > > +		err = -EBUSY;
> > > > > +		goto err_mmunlock;
> > > > > +	}
> > > > > +
> > > > > +	buf = kvcalloc(npages, 2 * sizeof(*migrate.src) + sizeof(*dma_addr) +
> > > > > +		       sizeof(*pages), GFP_KERNEL);
> > > > > +	if (!buf) {
> > > > > +		err = -ENOMEM;
> > > > > +		goto err_mmunlock;
> > > > > +	}
> > > > > +	dma_addr = buf + (2 * sizeof(*migrate.src) * npages);
> > > > > +	pages = buf + (2 * sizeof(*migrate.src) + sizeof(*dma_addr)) * npages;
> > > > > +
> > > > > +	zdd = drm_gpusvm_zdd_alloc(range);
> > > > > +	if (!zdd) {
> > > > > +		err = -ENOMEM;
> > > > > +		goto err_free;
> > > > > +	}
> > > > > +
> > > > > +	migrate.vma = vas;
> > > > > +	migrate.src = buf;
> > > > > +	migrate.dst = migrate.src + npages;
> > > > > +
> > > > > +	err = migrate_vma_setup(&migrate);
> > > > > +	if (err)
> > > > > +		goto err_free;
> > > > > +
> > > > > +	/*
> > > > > +	 * FIXME: Below cases, !migrate.cpages and migrate.cpages != npages, not
> > > > > +	 * always an error. Need to revisit possible cases and how to handle. We
> > > > > +	 * could prefault on migrate.cpages != npages via hmm_range_fault.
> > > 
> > > This is a bit stale, can update this comment.
> > > 
> > > > > +	 */
> > > > 
> > > > Yeah I think especially under contention partial migrations, at least back
> > > > to sram due to cpu faults, are pretty much expected. And you need to cope
> > > > somehow.
> > > > 
> > > 
> > > I have seen these pop if the IGT calls mlock on the memory. My thinking
> > > is migration to VRAM is basically optional and fallback to leaving range
> > > in SRAM if an error occurs rather than doing a partial migration. This
> > > is what currently happens so it is coped with.
> > > 
> > > If the memory is marked as must be in VRAM (NIY), well then the user
> > > program has done something wrong and can kill the app (akin to
> > > segfault).
> > 
> > Yeah SIGBUS for "must be in VRAM" sounds like ok semantics.
> > 
> > > > > +
> > > > > +	if (!migrate.cpages) {
> > > > > +		err = -EFAULT;
> > > > > +		goto err_free;
> > > > > +	}
> > > > > +
> > > > > +	if (migrate.cpages != npages) {
> > > > > +		err = -EBUSY;
> > > > > +		goto err_finalize;
> > > > > +	}
> > 
> > What I think is more fundamental is that I think this one here doesn't
> > work. For migrate_to_ram you cannot assume that you can always migrate the
> > entire block, I think to uphold the core mm forward progress rules we need
> > to allow partial migrations there. And I think your current code allows
> > that.
> >
> 
> Yes. I had similar checks in migrate_to_ram at one point and that did
> not work when multiple CPU faults from different threads occured in
> parallel. Each thread can grab a random set of VRAM pages to migrate I
> think.
>  
> > But that then means you also are stuck with partial migration state here.
> > That was the point I tried to make.
> >
> 
> The error path with migrate_vma_pages/finalize safely unwinds the
> migration in these cases leaving all pages in SRAM.
> 
> > > > > +/**
> > > > > + * __drm_gpusvm_migrate_to_sram - Migrate GPU SVM range to SRAM (internal)
> > > > > + * @gpusvm: Pointer to the GPU SVM structure
> > > > > + * @vas: Pointer to the VM area structure
> > > > > + * @page: Pointer to the page for fault handling (can be NULL)
> > > > > + * @start: Start address of the migration range
> > > > > + * @end: End address of the migration range
> > > > > + *
> > > > > + * This internal function performs the migration of the specified GPU SVM range
> > > > > + * to SRAM. It sets up the migration, populates + dma maps SRAM PFNs, and
> > > > > + * invokes the driver-specific operations for migration to SRAM.
> > > > > + *
> > > > > + * Returns:
> > > > > + * 0 on success, negative error code on failure.
> > > > > + */
> > > > > +static int __drm_gpusvm_migrate_to_sram(struct drm_gpusvm *gpusvm,
> > > > > +					struct vm_area_struct *vas,
> > > > > +					struct page *page,
> > > > > +					u64 start, u64 end)
> > > > > +{
> > > > > +	struct migrate_vma migrate = {
> > > > > +		.vma		= vas,
> > > > > +		.pgmap_owner	= gpusvm->device_private_page_owner,
> > > > > +		.flags		= MIGRATE_VMA_SELECT_DEVICE_PRIVATE,
> > > > > +		.fault_page	= page,
> > > > > +	};
> > > > > +	unsigned long npages;
> > > > > +	struct page **pages;
> > > > > +	dma_addr_t *dma_addr;
> > > > > +	void *buf;
> > > > > +	int i, err = 0;
> > > > > +
> > > > > +	mmap_assert_locked(gpusvm->mm);
> > > > 
> > > > That's the wrong mm, at least for the ->migrate_to_ram path. You might be
> > > > called on a anon mapping from a child process. That also means that the
> > > > vma you're looking at might have no relationship with anythign you're
> > > > tracking in your gpusvm.
> > > >
> > > 
> > > Hmm, as discussed [3] I haven't added tests with child processes yet.
> > > Let me do that and update the design as needed. This likely isn't
> > > correct as you say.
> > > 
> > > [3] https://patchwork.freedesktop.org/patch/610957/?series=137870&rev=1#comment_1111169 
> > 
> > Ack. More tests should definitely help here to figure out what's up, and
> > what's just me being confused.
> > 
> 
> Starting to add tests this fork() appears to work after dropping these
> asserts. More thorough testing is needed though.
> 
> > > > > +/**
> > > > > + * drm_gpusvm_migrate_to_ram - Migrate GPU SVM range to RAM (page fault handler)
> > > > > + * @vmf: Pointer to the fault information structure
> > > > > + *
> > > > > + * This function is a page fault handler used to migrate a GPU SVM range to RAM.
> > > > > + * It retrieves the GPU SVM range information from the faulting page and invokes
> > > > > + * the internal migration function to migrate the range back to RAM.
> > > > > + *
> > > > > + * Returns:
> > > > > + * VM_FAULT_SIGBUS on failure, 0 on success.
> > > > > + */
> > > > > +static vm_fault_t drm_gpusvm_migrate_to_ram(struct vm_fault *vmf)
> > > > > +{
> > > > > +	struct drm_gpusvm_zdd *zdd = vmf->page->zone_device_data;
> > > > > +	int err;
> > > > > +
> > > > > +	err = __drm_gpusvm_migrate_to_sram(zdd->range->gpusvm,
> > > > 
> > > > So I think zdd->range doesn't work, because even within a single mm the
> > > > vma mapping a given piece of anon memory does not need to be unique, you
> > > > can duplicate them with mremap.
> > > > 
> > > 
> > > This is attached to a page, not a VMA. Both AMD and Nvidia drivers use a
> > > similar lookup mechanism.
> > 
> > Yeah the page->zone_device_data is fine. It's the zone_device_rage->range
> > which I think isn't ok.
> > 
> 
> Yes, this gets a little confusing with fork() and mremap. The range's
> start / end can be nonsense in the remap case. Also as you mention a
> range->migrate_mutex doesn't seem correct either. I can make it work but
> maybe not worth even typing out why here (I can provide a little more
> detail in another reply). New thinking is zdd stores a size field and
> has the locking - I think is akin to a VRAM folio then.
> 
> > > > So all you have here is the physical memory and the vma, which might or
> > > > might not be from the same process as gpusvm->mm.
> > > > 
> > > > Also the child process scenario means you using mmap_write on the fault
> > > > side doesn't stop all cpu faults migrating stuff back.
> > > > 
> > > > Somewhat aside, but I think that means amdkfd's svm_range->migration_mutex
> > > > is busted, because it's va based and so misses concurrently ongoing
> > > > different mappings moving physical storage around underneath.
> > > >
> > > 
> > > I think all of the above which falls into the fork() + child process
> > > issues which you have raise. Until I test this out I can't speak to this
> > > any level of confidence so I won't. Thanks for raising this issue and
> > > let me write test cases as discussed and educate myself. Once I do that,
> > > we can engage in further discussions.
> > 
> > I think fork + childs will still result in zdd->range being unique (albeit
> > confused about which mm). You need mremap of some of these mappings to
> 
> Agree for fork + child based on initial testing.
> 
> > change the addresses and really cause confusion, which I /think/ (but
> > didn't test) is doable with a single process even and duplicating anon
> 
> Yep, remap changes the address so range is confusing and really size is
> sufficient aligning within VMA's start / end upon CPU fault. AMD does
> this but with a VMA search which I think is a bit overkill.
> 

Sima gave me something to investigate over the past week or so and asked
me to write up my findings and share the list. I'm replying here because
this seems like as good a place as any. 

A. Investigate possible livelock with do_swap_page taking a device page
reference and folio_migrate_mapping aborting in migrate_vma_* if
multiple references are held.

	Sima was correct in identifying this livelock. I was able to reproduce a
	stable livelock with a test where multiple CPU threads faulted the same
	device page in parallel, and an exclusive lock was taken in
	migrate_to_ram. Without an exclusive lock, forward progress is made, but
	on average, there were ~32k calls to migrate_to_ram before a thread
	succeeded. This issue appears to affect all implementations that use
	device pages.

	I have posted a patch with Sima’s suggested core MM fix on the list [1]
	and verified in the local Xe branch that this patch resolves the
	livelock and reduces multiple calls to migrate_to_ram on the same
	faulting page. It would be helpful to get AMD's input and testing on
	this patch.

B. Test out fork

	I added a few test sections to my IGT.

	This basically worked due to the COW (Copy-On-Write) semantics of fork.
	Both the parent and child processes fault on their first CPU access,
	getting their own new copy of any memory allocated before the fork.

	I believe the only change needed was dropping a lockdep assert in
	migrate_to_ram, as the MM can change.

C. MMAP shared with anonymous memory

	I found that this is actually not anonymous memory but rather
	shmem-backed [2] [3]. Only anonymous memory is available for migration,
	so the corner cases related to multiple CPU mappings for device pages
	discussed do not exist.

D. MREMAP behavior

	Added a few test sections to my IGT for possible REMAP cases.

	In all cases (DONTUNMAP, DONTUNMAP with read only...) the old
	memory generates a MMU_NOTIFY_UNMAP event. This fits nicely with
	the design as old range it just unmapped. Next CPU or GPU acess
	to old memory has zero fill semantics.

	The new memory can point to previously allocated device pages.
	With a simple update to design the next GPU fault can find these
	pages and map them.

	MREMAP did expose some problems with a zdd (device page
	zone_device_data) pointing to a range. It was pointed out that
	something physical pointing to something virtual is nonsense. I
	have fixed this locally and agree that all refs from physical to
	virtual will be dropped in the common layer.

D. MREMAP Behavior

	I added a few test sections to my IGT to explore possible MREMAP cases.

	In all cases (e.g., DONTUNMAP, DONTUNMAP with read-only...), the old
	memory generates an MMU_NOTIFY_UNMAP event. This aligns well with the
	design, as the old range is simply unmapped. Subsequent CPU or GPU
	access to the old memory has zero-fill semantics.

	The new memory can point to previously allocated device pages. With a
	simple update to the design, the next GPU fault can find these pages and
	map them.

	MREMAP did reveal some issues with zdd (device page zone_device_data)
	pointing to a range. It was pointed out that having something physical
	pointing to something virtual is nonsensical. I have fixed this locally
	and agree that all references from physical to virtual will be removed
	in the common layer.

E. Locking issues

	Sima strongly suggested not inventing locks for migration to avoid
	races, but rather to accept the core MM races. I removed all locks
	except for the existing Xe locks and eliminated mmap write abuse. With a
	more robust retry loop in the GPU page fault handler, I was able to
	successfully avoid mixed mappings. Whether mixed mappings will be
	supported is a different topic, but in my opinion, this demonstrates
	that a design can work with minimal locking. This will be the design
	moving forward.

Matt

[1] https://patchwork.freedesktop.org/series/138497/
[2] https://elixir.bootlin.com/linux/v6.10.7/source/mm/mmap.c#L2934
[3] https://elixir.bootlin.com/linux/v6.10.7/source/mm/shmem.c#L4941

> Matt
> 
> > memory mappings with mremap.
> > 
> > Cheers, Sima
> > -- 
> > Simona Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

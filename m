Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A884C4A33A
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 02:06:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D90410E4D2;
	Tue, 11 Nov 2025 01:06:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E4CrQYwA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95CBD10E4A4;
 Tue, 11 Nov 2025 01:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762823195; x=1794359195;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=GVvOhKUcVtLR60Qlei9a8qmdgP1tYGEWFL+swVuJpgI=;
 b=E4CrQYwAaq6BxOj22hNjSj0mWQu6coElpdekJk3jtC7qvZ5Q1q7tkqPw
 4ulGJmPwijgT/46D6VVi93OPPBB2L4webZUCrR6B7WGRvPhv52lGdTIcs
 HwpZWX2VSHAMIKPectKCKWuiIJ/qTFoY/bit44DIgOfsuPA15csP8ba6H
 gdEPHYLNfDLakmg2+BIJ57Xpqmt9YHpPTwhlwVb0q57cOEi6LpHqG+UVA
 UXh2UgxnZFBC4IuXG7M0yd04yyKX5vtqQd+I3MeoFjl5pHuvnp5X0boOu
 GQNVcTGYjSQNvEBeZo3m9fT4uSVOdTkQ+yho5LwjGybLAZS6cUtkXw/Z7 A==;
X-CSE-ConnectionGUID: 9dy5T6XqSoq5ExMT7/eg7Q==
X-CSE-MsgGUID: TlNNCMoNSKqHw90lzSOCrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="75493458"
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="75493458"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 17:06:34 -0800
X-CSE-ConnectionGUID: Rpl+c4S2RkSUvNXflMCJXQ==
X-CSE-MsgGUID: eCgSmwyWTuusvddgCzCaFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="188460399"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 17:06:34 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 17:06:33 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 10 Nov 2025 17:06:33 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.22) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 17:06:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VLZRviGGK41gdqs7k9ffuo1gNXbTYCU6n48RCQiBK6j5eVJL5gSyyD6K8exv8S+RN+M3eRlUfFv/Fe7I4S2rWVSW7XgUflzyNHQWseX5DiRTTu0+6LKM0zKkgDlq4QzcXPwd8QxwdB4TRuJ0SmHC9eGwUlQctRnnuT9bso5fOUrWE1z4QPP69U6CQwmPgdcVZd4A7qon3RYeFBN/hT0xyrpxQ0IS+lgBIcFf0MXuXk/aFFIwABMR9gtApk9uaz7X8lZOq5m++iqKoGLvZkjJI0FeK7LTF6kh/8dyPlUEhMm8BEJPvEPZvJtYsl2jzPCc//l8Cw0S4QDQ6LD/5o/G8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p4tRBXZvEeZwwqDFQYKGgZhI4C7r02WUoIU3jfxdNa0=;
 b=SNORQ7Cb0BuwArTRkHl380oDonhg0RXDV5Gvc6HZ7Rrj7QZxtggv1okyOIO/fT+caLodFonMSRb5p5oUMbopck+aoAVXxOJ1GdEYx7fc57dM5LvkaXDKmTofWQHcWf4NuNqORTkZn0oEeDYtBCeaTxvKxrW6GJD7nD3ae7SiO2piCEvQ1POOVuhiokQyEaOTtYWy4k7aGQSRK3/96sRrHUqwatAZkE558B2x7n8X5apOAHdZrPY6O275VIrA1JCuukfOl0EV51nHC7BrrxTp+Wsp6py3o2uMakVS+2XtXHPKGo9NxI6DtApMxg4voeZdPI6zQkpnNA5+oNyJtc78uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CO1PR11MB4931.namprd11.prod.outlook.com (2603:10b6:303:9d::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.16; Tue, 11 Nov 2025 01:06:31 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 01:06:31 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Alex Williamson <alex@shazbot.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum <skolothumtho@nvidia.com>,
 <intel-xe@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kvm@vger.kernel.org>, Matthew Brost <matthew.brost@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, Christoph Hellwig <hch@infradead.org>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Subject: [PATCH v5 20/28] drm/xe/pf: Add helper to retrieve VF's LMEM object
Date: Tue, 11 Nov 2025 02:04:31 +0100
Message-ID: <20251111010439.347045-21-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251111010439.347045-1-michal.winiarski@intel.com>
References: <20251111010439.347045-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0028.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::23) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CO1PR11MB4931:EE_
X-MS-Office365-Filtering-Correlation-Id: dfc11b07-e88b-44d3-9287-08de20be8cf1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NmFTY0pMMkV1ZkhZdUJodUlpRml3V1NZSFlWb0pDN05id2F6dThHNXVnMW5V?=
 =?utf-8?B?WnpnaEtXNGFMem9zUFhCbTM5UHB1alVHdzkzbVlXdklZV1NjNldCczQzdlFD?=
 =?utf-8?B?d0V1ZForK0NXWWJCVzBGWmFKaUJ0bTViNW13WUF4SjZLWlgvTFJibDYybkNn?=
 =?utf-8?B?Nzg0dUFnandkRHhHNEY5bThnbHVRSjZ1eGZTVmFVTDhMbjdaQWwvZVYrTkJX?=
 =?utf-8?B?QWxtdVNtQkp1K0FBYXRleEN3cW0zeHh2R05EYUF3VjdNcEpPSktZa21tY1Ba?=
 =?utf-8?B?MmRDenIwaTRpL1lqbjV2UHNzTXVCeW1RLzV6OFAwU3ZHS3ViTVpGYUF3dWM0?=
 =?utf-8?B?aEFqVW5DcGF0MDZRcGtXUDgvK0FFbVNmYXNNV3YwZDMzOTFhbmNkQVMwdVph?=
 =?utf-8?B?Y3NBS2toS1Uybm5LWEFueG5hQzJ3dUxUMW1vMk5HNEpvaW8xMmhPWlQ4L0Rr?=
 =?utf-8?B?VVZ1UkdDZGpOSnVGWnZubDlqMVg4bkpyeEhaRVZneU55VVd6Q09NTmowdTN0?=
 =?utf-8?B?aVpjWkVHanRvVi9Rb1lNdWtmT0wxL2xmdlJ6YTRFTmdyUGpkbDd3N1lCcGpi?=
 =?utf-8?B?d3cwQmVQR0kzd3BnM2tLTkovb2hEWWEyRHlyNW9PNjJ6V0FscUUrY1ZzYit5?=
 =?utf-8?B?TFRGRk8rZHF5b0NjbWlreS96NW85OUVwMWVYSkZ4TmgwcC9ydTBLUndYc3Zk?=
 =?utf-8?B?Yy9YeXhHZko3bFh1UEU3QmZEUzQ4OEJscmpXTktxTDRsL2ZkVWpqYUltU29G?=
 =?utf-8?B?cU11NWVVcFhUUTB4M1VORUViYm91RDNiakl4WDg3UFZydk5KNHlXR1ZxV3Av?=
 =?utf-8?B?clk3T1d5bWk0b1NpQWpna3J2V0srSTNCWEhVN2RFVUN6bytFUEEwVUVhL2hZ?=
 =?utf-8?B?d0VTK3licW1rVmFVMHFMdEJTS1J1ekRLYzdqblNsT3ljcFEyQUE3Ym9TRDhH?=
 =?utf-8?B?djdoTVZuTFV6TFlac25XVlUzcThQamFhMVBMQ1Jra1dqdmw2UFlDOEFzNFA1?=
 =?utf-8?B?UkNZNWltMDBINWNlVnFTUkRPeS9RNWNvaXhZZUEvK0N0WDA1Zk5RNjY2aUJL?=
 =?utf-8?B?eXhrOXVOOHFqbWsxbmp3YmtzMUhmaDhvQTlFWlJ6SldtaVppYmQ5RTlHVTky?=
 =?utf-8?B?VytIRTVCR2NjV2hVZTVaUnVUV0FocVpsN1czWTh3cFNBbnNRNWZwdjdnL21k?=
 =?utf-8?B?anlrVHJhK01pVHJOT1BXd2NSNXNpaVMvL21pdkRSaWRqblBEcHJjdjVKKzhz?=
 =?utf-8?B?V29oa1NLbDFpckx5eDVpWHRoYkVLdzBoeG0vblhWWng5U0RBY3M1dzZaZjgy?=
 =?utf-8?B?OWVMNG1kcjN5SDBYK09jWHBwODBTQ1NIUWtyVCtuUVRIY2s4bVh6c1BMeEJ5?=
 =?utf-8?B?VktNdUUyeFhMeUV5Z0V1bU1kTTUxYWQ5bytwRm9ZaHFNaEdVVllDRG4zMHdO?=
 =?utf-8?B?NVpvUkxySFJPNXdkU1FSdzBxRGpmQ3hJUXRBUDRKVXJkalAxekp6S0xVM1g4?=
 =?utf-8?B?RnFuN1lwd3JOTUlVQXY1L1VoZld5cnNxVUZpZlpDdEhQczZDSXdkMWlSb1U5?=
 =?utf-8?B?ei9HWWgrcG1LN2tvLzB3MGtmajJtRkt0YytQQzJOazh6NmtTdEdOVXBhRmZG?=
 =?utf-8?B?bzFId2ppUUNTRWlZZUd3QzI1WlF4R0toRG8xU0N1b2xUbmx2cHpTS2FoU3N3?=
 =?utf-8?B?eTJ1WTZpbWkzaUdhMVE2czZTUmRVekR4c28vYkR6U1dsYldXY2NaMDY0c1Z4?=
 =?utf-8?B?YWRnWCtVSmZFZzNiSFR0VVRFN0pUZndOMkpvQ0dwcWhuZU5vZFFHaDI0OUcw?=
 =?utf-8?B?ZTQzdldGNVFQMkhvUnl5Q1pTVHZtNjIzVFpTUktYTmExdjI3VXZXTlQ1Tld1?=
 =?utf-8?B?S1Y2V1N0c1JPcmIreVZ3MnBsUjFiQ1F3akx6M29RaFBMckU2aWpTZnZPSW4v?=
 =?utf-8?B?OG5GQVdIb2psNG4xZzM0UHdVRlNHVlFJdVJWYXQzbXdvdUNiR2sreDM1NURU?=
 =?utf-8?Q?uuK1gg7J5gnAEFd5MwIxffZ6mBG+ds=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?alNnNFdwR2pRWFdZZlI0QW9OTkRnNm1RSStPUG1TQ0JMSE9oVEVLL1hsWTJT?=
 =?utf-8?B?Ukd6ZC9lcFd6QzdlMjlzRGJINk1oTVdLZHJHcFdrcWdqSlNNMkdadFJ4NU5V?=
 =?utf-8?B?Ymd6dVJUNG53Q3R5Rk9KTld2ckRxZlFPcFZSQ01kck5EOEsvZWJ4Q1pKcmlU?=
 =?utf-8?B?ajlhejF1WUhhaWUvOVVybm9GTXBuVGNrUnZQU3dlQUpFRkFVQXNzaGpmR1ND?=
 =?utf-8?B?NExPMnlmOEluYjNpSWRuWmNmN2hVRkhJMGFDaXVYYXR5NmVrRzlyNnU1Tmlh?=
 =?utf-8?B?N1BmNWlwZXVLbWJjSUJkYklvUEFhbFBqbkFwakhQVmUySUpQcUVTRXdvRlcw?=
 =?utf-8?B?U2xVM1pKRldHZDhBYWdVQ3phenUvbWdvVGZERzVBeGFGN3Bud21kNGNSS3la?=
 =?utf-8?B?em9lK3hBYzRGRlZNaS9iUDYvaHN2K0hRQmxzelNXdnBna3A4RVNJVEpGQVN5?=
 =?utf-8?B?WkFOamw5V29GVXJveVJWQ3R1bnVTM2lxS3FTWG1aK3grRnY1bWl5QXVSRGs4?=
 =?utf-8?B?d1RtVGNReTZLQVlpZUdMQ3lUT01ueGpUMWhvS0xkRUNlNDRRVE9WQklUZjFn?=
 =?utf-8?B?czNrdkMrazV5aHBYb1VmZEpVZU01ckNtbFRnNUx5OHRxUVBHRUFQUHN4bERz?=
 =?utf-8?B?d0lHcjBKbUpaeG05VUtiUVBkTUdzNEh1d1N4YkZpZWlnT2RucVljbHF5WVVS?=
 =?utf-8?B?ZUZXZzVWaWFLckhhWE5xelV4MGVPSG9QRW9wYjJqdzZQbWtKV3E0dHlXd21S?=
 =?utf-8?B?MzZGeTM4azZYcnpTVDJWWWhsbjM3M29ZcWdQdEtONlI1S2VnaWxuVThHMldw?=
 =?utf-8?B?Q3hzc1NTUi84Q2hLVExEL3BRQ04xMGEzU3VzTFYzZWpFOW8vMC9qWDhRcHU0?=
 =?utf-8?B?b2ZiMzJ4Tlg1ZnBPcW1MUUdBV1M2d2VrcThkOE45Tk01WWJNeVN3ckswS2xK?=
 =?utf-8?B?WXZYQUJVWXhNOHplelNicm56TDkrUGpLdFB2YzlxOUNyNGFRNk5UQkdlSWJH?=
 =?utf-8?B?VjRDa0l0L2RhMVNoWkZSajRla3g2dG51TXh5cmhlN1F4ci9JZVQrZjM1SXgy?=
 =?utf-8?B?VUVXQjJPTzJ2b3JlNGlJYXRxZ3FDMlM1elRtbm5HR2Y0d1YxcXFRbXJSelgw?=
 =?utf-8?B?ampidURSazlRRDk2anBZODZyWUd4YktKRS96MzNmUHJyS1BIZXRVazB4UFVB?=
 =?utf-8?B?V3Y3SjRGZmErK0U4M3ZXMzNVS2Q5ODM2SjllWUNLM3RWaWxXbitLZ0I4aGow?=
 =?utf-8?B?MUVzaFVUd2V4SnI0WmFLZ0ZXaVpwRUFmVkJ0WmQwZkpWUG1pSGZHYm83UW9K?=
 =?utf-8?B?Ym9HbWx2OTZ6YjlhUHdBeHlvZ3lndWNHNzNEekJ5OVIrdVNJdmFHcG1QVENp?=
 =?utf-8?B?UkorUTNyMTNheUhhTDZtUW9XZVBwbGI5QlEzRGZFbkpxTERjTGNmQ2g2YWFI?=
 =?utf-8?B?T0owNDlkd0RJdnl6dU5pTUtWckc3S2o1aGQrVUovakhTRkJGNTdmbzZHVkJO?=
 =?utf-8?B?ZEFNQmsxZitubThvY1REMkhIYTV0RGpPd2ZROWVVcjNRQmNQelNxU0U2V0RG?=
 =?utf-8?B?N1BVTDhaeStFLzFuU25abmRlQnBzNG5mTzlibm82OWc1WTJDb1FkRGN5UFZr?=
 =?utf-8?B?czFmNzd2eFFxcHBzazcyaE95Um9EU0dCUllnMEkyQWExaVQ2VG9zaEpobk4w?=
 =?utf-8?B?QXp4bGRYOG5UQWtPREM1M3R6aHQ0NDVsNkFPS0hWQ0tFOHhValJPMU9KbG9N?=
 =?utf-8?B?bXdxYnE1T0txdzNJdFJrUFR6SUN6eWp4OUFlczVhY1RWUFY4dnNkQmVieUNs?=
 =?utf-8?B?VTQxUmJPQmdSRnl6YlBnOExGUzEzbXJGT0xUVDBZVmI2elh3YWRYRVF3Qm95?=
 =?utf-8?B?WDk5aVlqcmRtL3JEcFZ0RDEvMEdLcGRQY1pVTmloVklmazJhTEZIWE9KRXNp?=
 =?utf-8?B?UW5hRW00WTM1UkhMTFhqZ0dxcXhBYmY1QzlySDFUc3NlQlVqdnVuTUFybjd4?=
 =?utf-8?B?aC9iMFBrem1TRmF6TGw1WnFMVTR2NDBuNERQcUhrZE85cHhQRTI3c0lKcTBU?=
 =?utf-8?B?Wll6bUVOWVI4ZkxYZTFQdmtIWjdrMTU5b0NaclhuQTVITkl3eUdGaHZickc2?=
 =?utf-8?B?N0dGcWx0WWlZOHJFN3piY2FER2xYT1BYUi8wNWdCcUpPK05YeGpPVDVaRTFu?=
 =?utf-8?B?Wnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dfc11b07-e88b-44d3-9287-08de20be8cf1
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 01:06:31.5204 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zcUcB2mBSSNsPOYiXJtpglO53diiv9ulka2YBE9DM51SWsdCYSvmJ6Yr5lta84LvW0SBS/JVP4R6Uf/YkG/2KBE6kK4zAhDDLXK5nSV7/FQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4931
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

From: Lukasz Laguna <lukasz.laguna@intel.com>

Instead of accessing VF's lmem_obj directly, introduce a helper function
to make the access more convenient.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 26 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |  1 +
 2 files changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 5b4e1d2da5adc..9c14f02961355 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1692,6 +1692,32 @@ int xe_gt_sriov_pf_config_bulk_set_lmem(struct xe_gt *gt, unsigned int vfid,
 					   "LMEM", n, err);
 }
 
+static struct xe_bo *pf_get_vf_config_lmem_obj(struct xe_gt *gt, unsigned int vfid)
+{
+	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
+
+	return config->lmem_obj;
+}
+
+/**
+ * xe_gt_sriov_pf_config_get_lmem_obj() - Take a reference to the struct &xe_bo backing VF LMEM.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * This function can only be called on PF.
+ * The caller is responsible for calling xe_bo_put() on the returned object.
+ *
+ * Return: pointer to struct &xe_bo backing VF LMEM (if any).
+ */
+struct xe_bo *xe_gt_sriov_pf_config_get_lmem_obj(struct xe_gt *gt, unsigned int vfid)
+{
+	xe_gt_assert(gt, vfid);
+
+	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
+
+	return xe_bo_get(pf_get_vf_config_lmem_obj(gt, vfid));
+}
+
 static u64 pf_query_free_lmem(struct xe_gt *gt)
 {
 	struct xe_tile *tile = gt->tile;
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
index 66223c0e948db..4975730423d72 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
@@ -36,6 +36,7 @@ int xe_gt_sriov_pf_config_set_lmem(struct xe_gt *gt, unsigned int vfid, u64 size
 int xe_gt_sriov_pf_config_set_fair_lmem(struct xe_gt *gt, unsigned int vfid, unsigned int num_vfs);
 int xe_gt_sriov_pf_config_bulk_set_lmem(struct xe_gt *gt, unsigned int vfid, unsigned int num_vfs,
 					u64 size);
+struct xe_bo *xe_gt_sriov_pf_config_get_lmem_obj(struct xe_gt *gt, unsigned int vfid);
 
 u32 xe_gt_sriov_pf_config_get_exec_quantum(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_config_set_exec_quantum(struct xe_gt *gt, unsigned int vfid, u32 exec_quantum);
-- 
2.51.2


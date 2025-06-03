Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80771ACCA49
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 17:37:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60AA310E97E;
	Tue,  3 Jun 2025 15:37:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aQvsZ3/1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C420F10E978;
 Tue,  3 Jun 2025 15:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748965024; x=1780501024;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=hPuV7FtQzZi8t94mrWKp/CKrZz7vccpdUk3lR/6i7mw=;
 b=aQvsZ3/1jHqAxAzExwR/qv1QnCID27x4so1JM9zQxv6g5V1KfYzeqsJy
 8zq8JaFy9BztnlyJhed57ipcs1K1FmXVNMAC3BCWNq0Zfgnhth0E1fPYj
 TMiS/OtshI1rToKulmvQP5VQXgibCs8SChT4bMwGnGFxUK0BUMHYJ3MS8
 go5DOsP5mYNI7Dfnoi2w4sEkuqDbvTUPK6v22slOZJLDYskmVSbbyB7QF
 t1b8+CUl7e38/d0zcZ4YRdUXDVtvyANlf9IFX6XSnOupkm5eGx0IRjvvU
 ku9/ygJPVKZ4wjBbcwMSiLpIbFuzTa4BztknayTW61ocmx+rLcxEJdrk2 g==;
X-CSE-ConnectionGUID: tMTx6LQvSLuv419HgRZl2w==
X-CSE-MsgGUID: dSGSGxucR5eUWOMq7Es1MQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="38640749"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="38640749"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 08:37:04 -0700
X-CSE-ConnectionGUID: VIm/0/bPQL65VKhh4uAMYw==
X-CSE-MsgGUID: chT7O5RaTRKDTUCDd6Xpgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="144924805"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 08:37:04 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 3 Jun 2025 08:37:03 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 3 Jun 2025 08:37:03 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.55) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 3 Jun 2025 08:37:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jcUCnt7kcUiQxkN8JQyVVmDVm11DOfYBi6yk6Hb0ZCav4L7ZzSw1maT5pNWCn7kp0jikA1jajxv0ma1kK+9GEo0NXyYsxewImAPINz7ynlQVVozC2yUgbuI0al+WZ/hXSwGTsHEGAc17g1hDu8eVlZ/Gmx72DJMSyi8zUwdf2hl3ffDYtZpMG5y+jMxShCRLArcexbq7iUjHLlEJkuVEr/sYUkrIY55DW1WjdLxFXrnKu4dezQYo9wY6D6vN9xqBzPES7arZUJ/shyXs5+7wtFnIDiF3vMyWBA97oot/sGLCSBtwwBtNJzO0M8o5QlE1I5zGJy1FtxSIl4BewI0QGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iK5SpmRxvrtE21H0R9KZ2GaZGuh3jr3tSWFuEnY9g3g=;
 b=s5bcU+rVNwSJbdxqqCyEzSeuCHJdlfqkOi8P5fSt1/rTxk7Hd9qL8bQMZaRdL069ao3P7g25p6Rd6Ddkbs4+crgN1X1FNJEIpM1TndGHMsIsPhdkdmWsl5g+YA0lyawSM8sV+6WCFBLDnh+eI5pEr84KlfTcQ7qX0PpKQBpWSkv5tAUwmrf2c+gNphciIKtT/7+3X6Hem3AQN0mcPl60vg89yQiHarKIUwR6YETfqPI42l1UwueuSvfl9Iqa69+7dYgHYWACBjlPCqMGZbAbEa74bqncMCYRMiI6c/qtj/L85pKvs/6+D5hz5eMZVEIrMjDwFm4hk5+0+C1vEm/2pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by IA3PR11MB9446.namprd11.prod.outlook.com (2603:10b6:208:582::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Tue, 3 Jun
 2025 15:36:35 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%2]) with mapi id 15.20.8769.037; Tue, 3 Jun 2025
 15:36:34 +0000
From: Imre Deak <imre.deak@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
CC: =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Subject: [PATCH v2 3/4] drm/dp: Add an EDID quirk for the DPCD register access
 probe
Date: Tue, 3 Jun 2025 18:36:27 +0300
Message-ID: <20250603153627.33645-1-imre.deak@intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20250603121543.17842-4-imre.deak@intel.com>
References: <20250603121543.17842-4-imre.deak@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR08CA0245.eurprd08.prod.outlook.com
 (2603:10a6:803:dc::18) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|IA3PR11MB9446:EE_
X-MS-Office365-Filtering-Correlation-Id: 18f9b060-2c52-46d1-afec-08dda2b46bee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZDJJSGluOU4rTG9iWjNyL0tMaWRPT05aMCtrMlZ4K3ZsZTJaOWN6RVJpTXlW?=
 =?utf-8?B?WE90RGUyZGQzQ1Bxb0NxRDRZcXV1UjBRbUZqM3B1VUJGS0tJcUFlVy9kclBH?=
 =?utf-8?B?bll4c1FRbWNQci9kdVlKaHowUlZ0eEtJTEN6WStNc29QSHo5SEdJNm9tRllX?=
 =?utf-8?B?T2tnbEJsYVRGL1NVRjVqS2R6YzZENXVDbE5WOEErL0ZNU1hZbVhRWHdienJj?=
 =?utf-8?B?cmJudVlHb05lZ0dyTTZWUWFYOE5vQmNDek84LzBMRTBlQWh5Y0ZxRTc3aVpU?=
 =?utf-8?B?RGJkYnFjQTJuWlFyWkRlY1dLVjVmUGhpUW9HL2YvNExVZU1tN3BxMzQxUWNQ?=
 =?utf-8?B?NnBCeW12TGhqRDNKSnBLdW9GTHlYYnlSdWRMYm5maVVGakp6N1NrMUNlMFcy?=
 =?utf-8?B?VFdRcmYyZHgxYkpET3dsYW4vQnlSZU1pS284ZDZ1VzhkRjBrNnRqTjZSNW96?=
 =?utf-8?B?cEJSNXBmbkcxcjFmSXFXaGxYU1B0MllnbGVaUFhZWElTVjZjV0VaajdZd3Uv?=
 =?utf-8?B?N1RudXo1TjVZV2t2OHVKdHVJMmNlcEZ6aGxoa2kyOFJNamRiY0g4WUppTnhF?=
 =?utf-8?B?VUFJL200UkdmNG94Nk9lZmF4VHpMUlEyZTFzUS9lZHZWQ1RNSklObDNCMFhs?=
 =?utf-8?B?T3Rob0FSYW5hbDZQeXZlOGlqTHFtQ3NieGtzUTg4SzR4eWFRZEgrRVQycmtU?=
 =?utf-8?B?dnlINHQ3akdrZ3NjdGo4QkltTXNKMjdnSm81WlJlNmZVYTFaMWV1QUwyU1FS?=
 =?utf-8?B?V0IycldaUkF1ZXBtdEtEQ2hjV1RadlZpK1ptSGE0SCs0L0NhcktuQlo0YU1J?=
 =?utf-8?B?cVpod3JxZmd1QnYzN1hqZW9jekdTRmt6SnBndlVPZ21EYWI1OW95R1A2SFhr?=
 =?utf-8?B?ZTlxU3pEWEhiQWtnRWY4dG1lTDd0SStGSWZ4M1hmTG9qTW0yWCt2S0wrVEdo?=
 =?utf-8?B?UGdhVFM0SFpBMmxJOW83ZkI5U2hlZjdseXBrQndPcXp2MVF0ME5xNVRZTnRB?=
 =?utf-8?B?TlRyNWZyVGtad1R2dWM2S2ViQThTcHVVRXE4NitxMEF0YmdYekU4d2NMSklG?=
 =?utf-8?B?WERoMXA1T0w2d2JmSW1sSTNjUFc3MUljRGRrWExLaU1sOE8yYUhOYlJqUk5q?=
 =?utf-8?B?amw4OEJxZnFUQ2hVSXBFREhrZ3hTSlN5RHpPajBYQThnekZ5cmttT1Y5cjc1?=
 =?utf-8?B?bEViZkR4M1VuQ3YwWDQ0czlUUG42aWdyUi9tSm1nTGhjcUZHVEoyQzlxUTdI?=
 =?utf-8?B?cjg2YzcrR1A4VFIwRWxUL2FkQVdva1VJWTJwODFZS3NwZEhqUFdXeFd1Um9n?=
 =?utf-8?B?Q0UwamJ2NFFMbnplT2FQWTlUY1JzVTU3bFBLUXRVS1FoQzFOcTBhN0pOdVpZ?=
 =?utf-8?B?b2VMdFBxclVRVWhrN0Myc1c2U2NNWE1wK3ZGRlRLSjdHK05Vc2x0aXF3Y3d2?=
 =?utf-8?B?QzlNckdmdisvOHpJOGpEbVIvblpkL0RHcWhwVGlTcExCSm5sbko0NndSMEJS?=
 =?utf-8?B?UnBERTZMU0VMS3lpdzFpbFhMME5BcWIvVmdjNVluOUxDdVpHMTIrTnBvZ2h4?=
 =?utf-8?B?ek1iQkgydzdUWUVoaFFWb1hHZ2taYTVJaTlLeWhHRW94NU5veTNpeDFwa1hR?=
 =?utf-8?B?OWRLb3VISmN4cytjZmxodE5odjVKV3pLYjE5elpTYlZGRmgwUlp3ZCtGeEFJ?=
 =?utf-8?B?bmNXZzZGTDNIUzZrRE5EejhGYytGbCtteXRlTnlpSlg5a1RwWldBWmlTSDRz?=
 =?utf-8?B?eFlZdmpoaitLVkcxRHA5ckd3RW1zMTJzVDVkRDJmR244bHpWQU1PbVJIc0ht?=
 =?utf-8?B?ekJkTFp2ZWpKdVlvT2hkajV3M1U1d2ZhQWROQU1QcDEzejJ5NEM1ZWRQdXhv?=
 =?utf-8?B?dkZvcVlRUTBGN1RiMEx1S2J0QlJXYlgwcWZQQjh6dkFxaFJWSFBRYWQxVTN4?=
 =?utf-8?Q?3UqfgebeYZ0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QllrVld4SG5SZEpQbFYzWnREVmVzMzFiaXllVFk0MU1QZDZ3TlNtdGxFZkNz?=
 =?utf-8?B?K2J2eG5Tb3pIZnJNd0NzNGd6U0F6Mmh6TS9YTHlIZ1NpN29UNkRnUHBEbnlF?=
 =?utf-8?B?M1NiTWU0S1cyeUZJU1VHR1RDdk9rWXZIclZTTHNDNnZtVUt3YjgwczdpUmlX?=
 =?utf-8?B?bElKTlR0aG1UZ2NPVlVZdk1PRUI5QTBFcjBLTDhJTTI4RWY1U0pkcHVkYXZm?=
 =?utf-8?B?NjQ1N21iaHBvM1FYRzJxRVQwY2gxaXdDd0FhbmtwV3NOZ1V6WUIzeWRFamxS?=
 =?utf-8?B?M1VsZ0szNWV1YXphZ1FEb09LelVtbHZTTHhRMFg0WER6a1ZJTEMvbkM4SVgv?=
 =?utf-8?B?bkNmalhCL1RhOWxoSzNKbFdmWnVISGwzOWJGbkFpVVVvNmtLdmFMaUJUU1ly?=
 =?utf-8?B?ZzdYM1M3cmRSMjFMa3NSSkdneDNhNGd4Q2pZdGJiL2J2Y2xWUjhkOFhNSGtY?=
 =?utf-8?B?b2xlRjdEbmxqQjBUN2JMMG9BSWt1Y2pvOTlxMmtnSXRJUTZOb252Vm0zb2hs?=
 =?utf-8?B?YUlKWUFUdWdkUWUwUkNaazJicXFPdnJ2V1J0MnZDUzVHWmlBYjdTU1N0YTdU?=
 =?utf-8?B?YUFTV1pFeElLbGpHcUovakM3MjJDck5WYk1HNVJ4T2FPVXBUZ096N3dCQXh4?=
 =?utf-8?B?NkRRMEtnNjJqS3VBTGlOMjVLcDVkTkt2dDVoQUJXYWkxeU5wa1NKdjVDNDQz?=
 =?utf-8?B?d3Q0V2lsZlNna2dibUtBU1NDVXZYVmhHOFhQMkVDQmFGK08zNmVUTGRhN2RX?=
 =?utf-8?B?a1JiV1Q4QUovRG0xSTdMR0V0aWJjcjZab2pzVmk3NXY1OFF4cG5GK0FYdVNa?=
 =?utf-8?B?K0JKMDNVbVlMSFkweE91eGpNWHltbXBVaUxubjVyTTliTExXbDJ1NzZCZTlp?=
 =?utf-8?B?ZWNCNnJaU0NqSThyNHlTRGlyRm5BbHRVWUVxVUNSVU9nWmU5TjJqNkMxZzBZ?=
 =?utf-8?B?K0M3MlZBM2loNmtUK25lM0pjZE9UQmFwZ2psVUppck9rNjBHdGFPT1hxOE5K?=
 =?utf-8?B?dXJnT1hCczNxcDlhVWFRUGdpOEpSYVphOXI2clpjTVJhZ2ZVajFNRzlpYmpX?=
 =?utf-8?B?MDRUSzA5NzNwWnM4MXhYZW9xK2Z5b1J2bzgzUFVSNDNvbzZWWmFPNmhGcm8y?=
 =?utf-8?B?Z3h1b1BRUG82SWVCcjZoSmEySS9aZ0N5N2lBSkMzclNMVTlKUFgrelROdm5n?=
 =?utf-8?B?Z3ptNnMxRUhjNU5HcHdESG5YellKNFl6S0lXODRYalRvN2lyYmc0QVZ3a3lJ?=
 =?utf-8?B?SU45bEJ1NUxvM2RHby9GS0xLUjFGOG1VVDJmalVDS2lSK3hNYmNsakx5VTIr?=
 =?utf-8?B?aUNWSjlsbGs0UitxL0E5U2lHVDJoVVBEU005U3RXeGRQUjRoSmIwR0NWczQ2?=
 =?utf-8?B?Uzg1Ym5nNUlMRWluQ21ucEI3RkZ5R3ZmK1F5ejZKenJKNllPWG9WaXo0dzhV?=
 =?utf-8?B?NGNIcGVSakttbDFHQkg1OVp0aktIS2ZjdEdBQUdWZWc4cTFjOUZOUExiUjVo?=
 =?utf-8?B?Y2ZQaUFZOUNJMy9KOUFhTlQvV0t6KzliUDNMSG43d2c2YTRaYnZqVmF2aFhx?=
 =?utf-8?B?cHFhOG4zWGRGQ2VxanRPcXhxdmNrNlZJV29MVHlRM0JYZEExTFdkMk0ySGQz?=
 =?utf-8?B?M2c2M3J1UTQzVHZJWWVwaVBUQlRkeG5FckJoT3kzVHY1OWpteFI1WHQ3MkZs?=
 =?utf-8?B?TE1XaU1idTcxRk1xd0x3SmN1bER2YnF5Unl0V08vdWNoRURLSXMwd3JETHNw?=
 =?utf-8?B?ZWtjV0U0NXV0L2F2WVNaOTgwakhxU1VSSUU4cGpUenVRSHdYUk9vc1hkQ0dX?=
 =?utf-8?B?SHVKS1lRM2hkRTBWYkg4cDRvS1JqNUFldm1rdll4VzM3R20ybXpyN3pmYnFC?=
 =?utf-8?B?UmFCV0o0Ly9zYTNsZ0o4Smg1ay92YW91WjcvUkNrQ2FTQ1NpbXJMTUM1OG05?=
 =?utf-8?B?aGlQL3JRZFRJcy9aZDY5a2lrTUNnYUJSTjZucCtISU5UMmlqS2hsMUVLS3dq?=
 =?utf-8?B?bCtKTlA4S3FBeGxxZjJvbEdOcjBGN20yUTBJQ29SOTBsT1pRY0tPb2tYZmtk?=
 =?utf-8?B?SGFBcDRqVFMyanVRbTNldFNrUGQ2SzF0K20vcTJHQysxV2dtNElEVy96Z1Ji?=
 =?utf-8?Q?mZqxKf/WWBOqNE2y9Ss9F6iIc?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 18f9b060-2c52-46d1-afec-08dda2b46bee
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 15:36:34.7767 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KRpryD8W68DMl1e/Yj0z9/pGfSSgBvGmFkzIuRioniKKOKWQ7z1QPwxBwLj8Ndf6yU0/Mg5umq/F4xsuZ1CuNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9446
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

Reading DPCD registers has side-effects and some of these can cause a
problem for instance during link training. Based on this it's better to
avoid the probing quirk done before each DPCD register read, limiting
this to the monitor which requires it. Add an EDID quirk for this. Leave
the quirk enabled by default, allowing it to be disabled after the
monitor is detected.

v2: Fix lockdep wrt. drm_dp_aux::hw_mutex when calling
    drm_dp_dpcd_set_probe_quirk() with a dependent lock already held.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 13 ++++++++++++-
 drivers/gpu/drm/drm_edid.c              |  3 +++
 include/drm/display/drm_dp_helper.h     |  6 ++++++
 include/drm/drm_edid.h                  |  3 ++-
 4 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index dc622c78db9d4..4dad677ac6ebe 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -691,6 +691,17 @@ void drm_dp_dpcd_set_powered(struct drm_dp_aux *aux, bool powered)
 }
 EXPORT_SYMBOL(drm_dp_dpcd_set_powered);
 
+/**
+ * drm_dp_dpcd_set_dpcd_probe_quirk() - Set whether a probing before DPCD access is done
+ * @aux: DisplayPort AUX channel
+ * @enable: Enable the probing if required
+ */
+void drm_dp_dpcd_set_probe_quirk(struct drm_dp_aux *aux, bool enable)
+{
+	WRITE_ONCE(aux->dpcd_probe_disabled, !enable);
+}
+EXPORT_SYMBOL(drm_dp_dpcd_set_probe_quirk);
+
 /**
  * drm_dp_dpcd_read() - read a series of bytes from the DPCD
  * @aux: DisplayPort AUX channel (SST or MST)
@@ -724,7 +735,7 @@ ssize_t drm_dp_dpcd_read(struct drm_dp_aux *aux, unsigned int offset,
 	 * We just have to do it before any DPCD access and hope that the
 	 * monitor doesn't power down exactly after the throw away read.
 	 */
-	if (!aux->is_remote) {
+	if (!aux->is_remote && !READ_ONCE(aux->dpcd_probe_disabled)) {
 		ret = drm_dp_dpcd_probe(aux, DP_LANE0_1_STATUS);
 		if (ret < 0)
 			return ret;
diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index e867315253493..9250b425ae230 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -255,6 +255,9 @@ static const struct edid_quirk {
 };
 
 static const struct edid_quirk global_edid_quirk_list[] = {
+	/* HP ZR24w DP AUX DPCD access requires probing to prevent corruption. */
+	DRM_EDID_QUIRK(drm_edid_encode_panel_id('H', 'W', 'P', 0x2869), PANEL_NAME_ANY,
+		       BIT(DRM_EDID_QUIRK_DP_DPCD_PROBE)),
 };
 
 /*
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index e4ca35143ff96..75fa9548aefa0 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -523,10 +523,16 @@ struct drm_dp_aux {
 	 * @no_zero_sized: If the hw can't use zero sized transfers (NVIDIA)
 	 */
 	bool no_zero_sized;
+
+	/**
+	 * @dpcd_probe_disabled: If probing before a DPCD access is disabled.
+	 */
+	bool dpcd_probe_disabled;
 };
 
 int drm_dp_dpcd_probe(struct drm_dp_aux *aux, unsigned int offset);
 void drm_dp_dpcd_set_powered(struct drm_dp_aux *aux, bool powered);
+void drm_dp_dpcd_set_probe_quirk(struct drm_dp_aux *aux, bool enable);
 ssize_t drm_dp_dpcd_read(struct drm_dp_aux *aux, unsigned int offset,
 			 void *buffer, size_t size);
 ssize_t drm_dp_dpcd_write(struct drm_dp_aux *aux, unsigned int offset,
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index 3d8e168521c82..a878805c81d97 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -110,7 +110,8 @@ struct detailed_data_string {
 #define DRM_EDID_CVT_FLAGS_REDUCED_BLANKING  (1 << 4)
 
 enum drm_edid_quirk {
-	DRM_EDID_QUIRK_NONE,
+	/* Do a dummy read before DPCD accesses, to prevent corruption. */
+	DRM_EDID_QUIRK_DP_DPCD_PROBE,
 };
 
 struct detailed_data_monitor_range {
-- 
2.44.2


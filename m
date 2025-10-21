Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C471BF9151
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 00:43:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0E3B10E652;
	Tue, 21 Oct 2025 22:43:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kcd8ReNt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46B3310E652;
 Tue, 21 Oct 2025 22:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761086577; x=1792622577;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=5ZHMnDusAZId7birXYh6lGc5zNBKDs/0WDnBKpzt3DY=;
 b=Kcd8ReNt3+fLio6PBb4GUa0ZDKyizoLIsS3tJdZyg5YdW9mwpgnlvLdp
 BOU9xlhO05kG656a1rab5R6nVx5A6a4DGMY9x9bqNhLk0jcinul3Ts6CN
 XY+G7dWin+dDFfuJpekF1ZQZJhkLg0B8/LZ9+vdail7Wx4NBOmPkHlAgD
 szuUSEASohw1GykTvByo1mVtBg1D3Yr/VmZNO8c+5wx5+Ky33MiZAzgAN
 OcZ4JPsqyReNsWWJMvVls+N98o38Sn5v8AskGiM6MlY8rVXK8cnaLqfF6
 rAzs59ktgMSEPjkejgJQiP5StsKZDBCUSqvhFY1n7FCHoV8mKTs1/M9Vt Q==;
X-CSE-ConnectionGUID: xCBtVL2JTXy+b3dMaqR7og==
X-CSE-MsgGUID: UBqPb8UcSFGMuEWamElU2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63128666"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63128666"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 15:42:56 -0700
X-CSE-ConnectionGUID: 5/vfLUKFTL2LvVqlKiT5wQ==
X-CSE-MsgGUID: 4JKMatjMTf25cTCE4mT4yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="214345548"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 15:42:55 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 15:42:55 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 21 Oct 2025 15:42:55 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.29) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 15:42:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SwwAv64y9KcPcyndI2gMXUDoeExHDa03PK8zm4L3DbOh5ucqM3RkhXizoYdvUdzjM0CZycuTjKTvt7Qs9rSQVSUWdtljd0NhgXvuG3jKtSNNus9O701xBzU2LydhLmM8DC4R2yIpwZtqZoiTlBspk2oeqs9zV1nZlGJRVGBjzc9UxBVRxDWF1OzXLA421TYm7D83Qdl9YjJNLc6Pk0iTjLDVtFSNTeQZ3lLEu7Srwa1JQ22OhLE52hO5oj4xeTmNCULORZHkeptFSABbRckQU+hoI6p2U6HCVkGqKzqURKgc6KWnX7TEVWl+o9VAuvFbSRHCqCW7j9HQTtU8KS49VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U/iTy5tFbKDFp670iPeIdjJ/TaLrvINN0pSTBuFmgKU=;
 b=p7yXE15A0Je+K6U9bLSaBPxTZsqK9eLKlY7pR4VjJNryiz0EbaBq8T+n7hcsS99JqZZCJzyPhQ60HqKPtkaKA4vmXHR29TOhKadA5NzdiXsGiR/mVPfNu4qP4UZ6edCEqej0xu8Am1JJCFDEYuY3FF26j1LjQ6DJKnY9KaYjW389H52kKl0+abeMq399qVZjUd6nTq7pLzyMXvUMekAgKMfukyezlJ4hrISCN8/bjezq5Kh5JAE42J9T9pkCanGboS5YD3ok+/GuLIic8n2VX0JYidlkIgqUTXC1AgvUG+gYw2grct8aommXFgnW63xVXq2RUtl8Jk4R9EkjYxBvsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH8PR11MB6753.namprd11.prod.outlook.com (2603:10b6:510:1c8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Tue, 21 Oct
 2025 22:42:52 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9253.011; Tue, 21 Oct 2025
 22:42:52 +0000
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
Subject: [PATCH v2 09/26] drm/xe: Add sa/guc_buf_cache sync interface
Date: Wed, 22 Oct 2025 00:41:16 +0200
Message-ID: <20251021224133.577765-10-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251021224133.577765-1-michal.winiarski@intel.com>
References: <20251021224133.577765-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P194CA0026.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:803:3c::15) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH8PR11MB6753:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e07a3e9-6f62-4597-6862-08de10f32b88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T1dVeGErd2o1cjFjYVNaTEVBMzI3b0JzR0hxNE5PMnV0V3lWUXUxMmNsQU5L?=
 =?utf-8?B?dW5WeGIyT3U5a3pLWnRGM0puYUt2T0hXUDlsZ1ZabkpxbjIyQnlaQnlsdU5S?=
 =?utf-8?B?dnFjU0hIMW9CK2cvdU9VZCs1Yzh2a0xFQ3AxQjZ4UmdwMTNnN1VOTkFFWVpU?=
 =?utf-8?B?UHFIRnNLK0ROR1hIL0dBWlhmRTErNzU5ZUY2WVVvdFcwbUppcUhTMHF1aUNx?=
 =?utf-8?B?V0FtRXJlbDk0VHQzUFloUjRna2tGdkwyeTc3dTJybVYyaTNiSHRYRTA1Ky9q?=
 =?utf-8?B?azVZTnA2U1oyUXFFVXdjeUxVUkVuQ0JNd1R3bldJMEhNZnRreVJlTkYvbWdp?=
 =?utf-8?B?OGp1bmFoc3ZFZlAvbzl6QXhsV1UrbWNQbWpVRlZXMWJFYTQ3K09rRmhqKzVK?=
 =?utf-8?B?ME43VU9WdVZxaStBMWFpRmNoby9DR1ZaNkY5QlRGWjZMTVFTNWVYbnJwY2Rm?=
 =?utf-8?B?R3lYVmF3MXM2VFpNSHdTMkVuN1Fza1UwUFFqajdsL3hIV2YzcUdHNzNZNWxM?=
 =?utf-8?B?N3VudjRVVUlQVkNwV01Qbm15MjZsc1MvYUFIb1g0SXVDbWxzVitNM3pHaERh?=
 =?utf-8?B?QlA2UEwwS0NTYitQbk5XMlAxK2hYNFdNSHFiclBaOHFpRFJwRkhyRUM4bDFE?=
 =?utf-8?B?UUtZMkdzNFZOdG5OdTdvRU82Q1BYUVdzcW1LMm1YQndTK3pnQk5LbnUybWRa?=
 =?utf-8?B?OFNwTjd1ZXI0aDU0S2FZL3FQeGh0VDRKckdxeEpVbUltUzc4bVZsQkV3S1Nx?=
 =?utf-8?B?bkFoSDd3eGRCQ2FwL0ljQ3NINFNod3F6N2toN1ZSNUdlbjdGUW9YT21hQ0J0?=
 =?utf-8?B?b1c1WlVJVmRlNFNlbnRlTUdBRUU1TFdqREhBN1RWOVRnYzI4cy8wYWlhUUYv?=
 =?utf-8?B?TzNUV1pVekREMlRubHljaDM3NkRWR0pXVW5rTVdFUmNsbmhUNnhTQTA2d0Nw?=
 =?utf-8?B?dEh2dnVFT0tsOW9qTGdTTHZwOWpFQWdjTEFBZjBlb0lhUXdFM0s0SVFCK251?=
 =?utf-8?B?Um1TSG9WWU1rOWpqQ3hLL3ZtSEU4WTJMODQyblpyaDE3b2hrODNBU1J0aFQ4?=
 =?utf-8?B?bnVuSmsyMTQyd3BvYUtmM2Q1NHBqOEdTVFVSUVVWTXJLQ1JZdkl0RGhZNTFP?=
 =?utf-8?B?QlZNQlNNK3hIZXdiU3Vwb1VYTURJM2hlWVppdnNxR2YwRlc2SGlJYm5Dd1NY?=
 =?utf-8?B?a3VYcGxLbThUMW5IQzlUdmo4d3NpWnZWcDArTGU5bDFsUytkZG03UXBzUjRZ?=
 =?utf-8?B?RUxzdDFyS0xrOEZnM2VuaE0vVUZkZ3lIV3poRmU4cEJiUU5zajU4ZThSM0sr?=
 =?utf-8?B?cGRQNFlGSXFHcEdXZGtRaXNrd2pVSHpYNEozTkhPUHVIdGl0aGtocDRlWG5z?=
 =?utf-8?B?WnV4UDJyUjZJRWVoeTR2NzJzOFdpVlNsbXdlM20zdUpGWFh4TWFCUkhuaGNk?=
 =?utf-8?B?RldyM0lHcXpOK0FYUzNQbGlLM0I4dUtpREFHVzdMeDdvd2FJSmZ3T2ZuQ1Nr?=
 =?utf-8?B?V3Bhd3BiWGxwSStUV2RFYzM0SkhTU3RjYTFubFZLVUluM0JXcm5SNDZKZk1I?=
 =?utf-8?B?ZTVHL3Rxdk5mb25YRkkvTXBpMUJ0eGVwSkxBdFQ3MVYyenFiaStRRXlpMHMz?=
 =?utf-8?B?Q0kvRStUOEFTc2ZMVmlMaXNacExyWk5la1Nudm9lRWVDU2Rya1d2a3c5ZVBO?=
 =?utf-8?B?dmxadkZwazI0bmIvUkVNTE84Wm02MXdnTFFrZkNJSk54TzVHcXFKaGUyQURo?=
 =?utf-8?B?aTFxcFNXZzZjd0gzT2NqazB2K0IzTTJBa3FJMTR4cEVXTHdUd2cvY2pQaWlu?=
 =?utf-8?B?T2NHQTlBRzRYWjQ0WGU5QjYyNldBK1BUeGlBaTJuYWo2dUJlOHo2eStMZW9k?=
 =?utf-8?B?VXlkbHpZVDFZZjd2MDZPZEFuK1hZN2dVV3NBRlY2cW8xS09GVGVaZVBLNFlT?=
 =?utf-8?B?TW4rRmtZbHNoa2R1d2J6emRKdUFabUg0RlZlNjVNdGh6cFJISWdmbFQxekRW?=
 =?utf-8?Q?4+FCK9EUpxC6j22b5mpS93LByEq2og=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eDJDZnBCMGFrUHp6ZzJaR2wyQXJTdncycDJldlFwd3JVbXdEcjJVeWV4S3p3?=
 =?utf-8?B?WHhtL0V2T0pLSEZ2MTZkcHlTc3Bwcm9IQmZlbFFyenhsRTFRbkZzOFlVRU1r?=
 =?utf-8?B?VjdwYXV3NzRCNVh2QVVtV1Q2YlpXTlRrZm1DdEE1VmI0VzAyQW1zdjhRQS9V?=
 =?utf-8?B?NEl2djhQY1BaNnRnTUFuQzY3Mnc0QWJKRWlZOXJib0tRQnBLSFNtZ3poenFp?=
 =?utf-8?B?c2RvVUdkc0NuN1Q0eC9NZzA2MUNUTXp2bVpLZE1nUEM5Mkc2cGpFd0lGQ285?=
 =?utf-8?B?d0hDZ3AwMVpQeFJSWjNRSjZ6MjQ0aXhJVWZTZ2xqSXNPdjhaR3pCSVZmOEhK?=
 =?utf-8?B?NzkxeVJLMDNLbnora2ZmNXo0b1U4Mjc3UVFuV09QdUhDRVVqMmp5M3R4RGNx?=
 =?utf-8?B?d2tQc0FHNUtqSmwzWTB5NmE3eVpheml1VHBoY0RaMmZQbkM5VUVIS1JWSU4z?=
 =?utf-8?B?ZGkweWNmRWI5V1IxUVpqR3BhM1RkMVNHNjFYWFpTcnlXeHByVjlBQnY2bkE1?=
 =?utf-8?B?dVY3ZXBGZUNvZ0RCN0ZXeENIOUVCN3FiYi9HYmVLbXBNc1A5UmdNSTB4LzN2?=
 =?utf-8?B?TnVDUXN6eko1VFB6V1hxRUgrczNPREo0UUlaSWpWeFQ5eWgwd2VBQ3ZMSWRa?=
 =?utf-8?B?OU05Wlp4MlN6ZENJQkNCNnljcXNraVFib3R4SzB6RHdnbHlWREVFQU1KOGc2?=
 =?utf-8?B?WFI5bUw0Sk9nN1F0ZHJCMktoUXRIcEQxaDBTc0ZYLzllWmhaOFRrNHpSWWll?=
 =?utf-8?B?WVIzMHRiTDVEZlhkc0tNWExGTk4yS041RlpWY2EyRXRqQkZJQm9GY0JFSE8r?=
 =?utf-8?B?Z3l5TThmaFFzUS9kZkN6OU1rdmJsa2hBT0pabG9lSVJjd2hNVk1vd3F4VUxF?=
 =?utf-8?B?SlRGMmJodW9DWmYva1ZPaWorb0s0NE93RUVZb2xLbElvTkdZWUJSMTY1SG5E?=
 =?utf-8?B?MjdCbUlKTkxDalR3anJ1amNJUVB2N3V2Y01wemQvWW5FZ29kcDA0UVd6bHlF?=
 =?utf-8?B?a3RBclZaTEdyVXJBL0I0UVpZb1NrZVJOa0ZaUjYrazRnYTNWWEkxNHUwU3pv?=
 =?utf-8?B?OEdJWXV5cXZVRTI3VTd2N28yOUczdWU5TWIyckFMY01YQVpDQlEvWWxUcGhl?=
 =?utf-8?B?TWZZenFtWWFCM3AzcmZacW1MYXU5K29BaUxudjM3VzVKTEVzRXl6QUhGR0ds?=
 =?utf-8?B?WmdheUV0ekZ6ZUp3ZVpSTjBiUm1VZ202c3BwS0h2SkxVMXlsVjJneGNxUDJ1?=
 =?utf-8?B?N0NTR3hLQ05RTzZjcmR1aEU0aGNHV0VJdlNVUjdhWjJ4WlZvYXdPSUl4MWtm?=
 =?utf-8?B?dUx5QVl3VXllM3NaWHAxdTV1R1JzUU55ZEZXSnc1UklUS3N3ZnlMVGRxUGdy?=
 =?utf-8?B?S2JVOTFLa0lneTBTSHFqWjQ1ZFVQbFZ1eDRGRG15dGx0TkJqWUw2Sk5TaHVw?=
 =?utf-8?B?TTRwZFFHQmpGbVNVblNoQit0bHNVOXl6NnRXU1JleUlkZVdTQVFCRkRVZDNK?=
 =?utf-8?B?NUFjVEZFYSt3VVdHZ09HSnFSck5Id3pyeEE1VlhaallEMjIwMEtram0zN2NW?=
 =?utf-8?B?VEMzMUUweWx6b0syWGNFR0NzSGxXbVp0aWJjejlFTlZNTWduTmZXeUZsa3Bk?=
 =?utf-8?B?aW9neCtOWllmeTBPTnllN3BNbEJaeGZJcGtRdjA5OTNLcVlRaE43ZjdVcjlZ?=
 =?utf-8?B?VTRxenRmYUJCa3JQSGNOWlVYKzl6bU83VXVZaERacUJJUDV5bFFrenkyaUQx?=
 =?utf-8?B?YUxpN1dHcjhtSFhDSVMzRkdGT2JPQm5CUlJiZjlYbzdHbVljYkxtdkJmaXNy?=
 =?utf-8?B?ZVVIUHJRS1U5Y3UraEVwSEE5Uzd3a3Y5VWRVMXF4YmRZaUxBT1p4ZDI3dlJq?=
 =?utf-8?B?a2ZxaThFZTZta3lJU21JTk90V1RkZEJqZXhmTXVxQkRuVEJmRGUvbGNIQnNI?=
 =?utf-8?B?S2VtcXUrV2xoNWZhNkg0R2VPTTA5MW5JcnNUZ2txdnpLQ25rMW9ZVmdjeksr?=
 =?utf-8?B?eW1DM0drbHpzazAxMC9WMDRnUThBcitEdzJmNmYxb2dhYjBtZ0d4TS9ZNXpu?=
 =?utf-8?B?anBGLzJ6NG9nVlR1WVVpNlF0cjZhSUFHSjlTSk5mbEJ6YWZWbUVsZEsyaGtK?=
 =?utf-8?B?VzJQd1hRY0VDYjVGUTQyUnNnT3hOaHhRUVFNOGhoRE5jRlRTWkhSVnJHT2ln?=
 =?utf-8?B?ZWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e07a3e9-6f62-4597-6862-08de10f32b88
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 22:42:52.7783 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2IQNCfMgIGICRW+FlPxhOjVcnSkp7S+jUhBGsxyZmGYUavwYTR1gKh9v3Ai63YiLG6I1TC2zVLYroqZNegTXKLBYtPcRuXANDhM7qSmmv9w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6753
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

In upcoming changes the cached buffers are going to be used to read data
produced by the GuC. Add a counterpart to flush, which synchronizes the
CPU-side of suballocation with the GPU data and propagate the interface
to GuC Buffer Cache.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_buf.c | 13 +++++++++++++
 drivers/gpu/drm/xe/xe_guc_buf.h |  1 +
 drivers/gpu/drm/xe/xe_sa.c      | 21 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sa.h      |  1 +
 4 files changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_buf.c b/drivers/gpu/drm/xe/xe_guc_buf.c
index 502ca3a4ee606..4d8a4712309f4 100644
--- a/drivers/gpu/drm/xe/xe_guc_buf.c
+++ b/drivers/gpu/drm/xe/xe_guc_buf.c
@@ -115,6 +115,19 @@ void xe_guc_buf_release(const struct xe_guc_buf buf)
 		xe_sa_bo_free(buf.sa, NULL);
 }
 
+/**
+ * xe_guc_buf_sync_read() - Copy the data from the GPU memory to the sub-allocation.
+ * @buf: the &xe_guc_buf to sync
+ *
+ * Return: a CPU pointer of the sub-allocation.
+ */
+void *xe_guc_buf_sync_read(const struct xe_guc_buf buf)
+{
+	xe_sa_bo_sync_read(buf.sa);
+
+	return xe_sa_bo_cpu_addr(buf.sa);
+}
+
 /**
  * xe_guc_buf_flush() - Copy the data from the sub-allocation to the GPU memory.
  * @buf: the &xe_guc_buf to flush
diff --git a/drivers/gpu/drm/xe/xe_guc_buf.h b/drivers/gpu/drm/xe/xe_guc_buf.h
index 0d67604d96bdd..c5e0f1fd24d74 100644
--- a/drivers/gpu/drm/xe/xe_guc_buf.h
+++ b/drivers/gpu/drm/xe/xe_guc_buf.h
@@ -30,6 +30,7 @@ static inline bool xe_guc_buf_is_valid(const struct xe_guc_buf buf)
 }
 
 void *xe_guc_buf_cpu_ptr(const struct xe_guc_buf buf);
+void *xe_guc_buf_sync_read(const struct xe_guc_buf buf);
 u64 xe_guc_buf_flush(const struct xe_guc_buf buf);
 u64 xe_guc_buf_gpu_addr(const struct xe_guc_buf buf);
 u64 xe_guc_cache_gpu_addr_from_ptr(struct xe_guc_buf_cache *cache, const void *ptr, u32 size);
diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
index fedd017d6dd36..63a5263dcf1b1 100644
--- a/drivers/gpu/drm/xe/xe_sa.c
+++ b/drivers/gpu/drm/xe/xe_sa.c
@@ -110,6 +110,10 @@ struct drm_suballoc *__xe_sa_bo_new(struct xe_sa_manager *sa_manager, u32 size,
 	return drm_suballoc_new(&sa_manager->base, size, gfp, true, 0);
 }
 
+/**
+ * xe_sa_bo_flush_write() - Copy the data from the sub-allocation to the GPU memory.
+ * @sa_bo: the &drm_suballoc to flush
+ */
 void xe_sa_bo_flush_write(struct drm_suballoc *sa_bo)
 {
 	struct xe_sa_manager *sa_manager = to_xe_sa_manager(sa_bo->manager);
@@ -123,6 +127,23 @@ void xe_sa_bo_flush_write(struct drm_suballoc *sa_bo)
 			 drm_suballoc_size(sa_bo));
 }
 
+/**
+ * xe_sa_bo_sync_read() - Copy the data from GPU memory to the sub-allocation.
+ * @sa_bo: the &drm_suballoc to sync
+ */
+void xe_sa_bo_sync_read(struct drm_suballoc *sa_bo)
+{
+	struct xe_sa_manager *sa_manager = to_xe_sa_manager(sa_bo->manager);
+	struct xe_device *xe = tile_to_xe(sa_manager->bo->tile);
+
+	if (!sa_manager->bo->vmap.is_iomem)
+		return;
+
+	xe_map_memcpy_from(xe, xe_sa_bo_cpu_addr(sa_bo), &sa_manager->bo->vmap,
+			   drm_suballoc_soffset(sa_bo),
+			   drm_suballoc_size(sa_bo));
+}
+
 void xe_sa_bo_free(struct drm_suballoc *sa_bo,
 		   struct dma_fence *fence)
 {
diff --git a/drivers/gpu/drm/xe/xe_sa.h b/drivers/gpu/drm/xe/xe_sa.h
index 99dbf0eea5402..1be7443508361 100644
--- a/drivers/gpu/drm/xe/xe_sa.h
+++ b/drivers/gpu/drm/xe/xe_sa.h
@@ -37,6 +37,7 @@ static inline struct drm_suballoc *xe_sa_bo_new(struct xe_sa_manager *sa_manager
 }
 
 void xe_sa_bo_flush_write(struct drm_suballoc *sa_bo);
+void xe_sa_bo_sync_read(struct drm_suballoc *sa_bo);
 void xe_sa_bo_free(struct drm_suballoc *sa_bo, struct dma_fence *fence);
 
 static inline struct xe_sa_manager *
-- 
2.50.1


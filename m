Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D275A790CE
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 16:12:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7D9210E7E7;
	Wed,  2 Apr 2025 14:12:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U5AQtR1g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8D8E10E7E3;
 Wed,  2 Apr 2025 14:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743603133; x=1775139133;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=yQvZm0Ga/hRwG31Kw3v5uaPPK1j+cEzIWVk6JP2lqn0=;
 b=U5AQtR1ghAHY2uRvHPGQX790CIJIRzSXy+fb34BBhPUndaDUTKqMLK9t
 1yr2IG3h9uWBoOvG6zpzUk40LuLmD/ih5bpolUlLjJ+xCXQGfaE7n+WHU
 rrEXSWeKhvjwW4K3cXyBRoGmyyaXkp5fYNwsLmca6ZizCVwDEFXjdK/fS
 7S/O/fscwbgVCYg3B4kDi/tv4Qz9dxDtbVyVxvdltW7/f6RH+YBFyQoKS
 8Tn64vvf7y+1WpYLPz1G92MisKsidkAg9i3u4KxIcHi1ncEG2jCgnLUSm
 GOqcyHK/z1PD5GxlXO/zdlnuQm1sgojv5GOwELX385k28Eu2IQ1LqNpFu w==;
X-CSE-ConnectionGUID: AwaYZeHnRQmwJUaSvW2irQ==
X-CSE-MsgGUID: esIO4XelRgiTWF73hUfZDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="44677213"
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; d="scan'208";a="44677213"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 07:12:11 -0700
X-CSE-ConnectionGUID: RzTMhvfxTI2VTbHOwgS1lQ==
X-CSE-MsgGUID: KgabNgITTXqDLSFgD8V2sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; d="scan'208";a="127620443"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Apr 2025 07:12:11 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 2 Apr 2025 07:12:10 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 2 Apr 2025 07:12:10 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 2 Apr 2025 07:12:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h1AqI5xuwYj8OR6A7SuhYFwdIe1ILFDdGaf9Gl7M/DEgD3vZZ7de5EBcIVU7l7zIglrJjQ5leYwdVzoc9sEdfFi1pNM3cTttwgl9tl46Z0qX4nEHgfUrWBQsWHxHj4lIl0ozz3n376G9zd8JPsgZlTImhBcd/aGTKg7B7Q/rEkl6apU0T5qKyYoZtZbFaVJVKoT0lTcS1/znH8b9K+0QXUtVwbN7vzzyTOuLdqH08/pOCZix7Wyc4izAU1cZDDqJ5S8FIiESuaAFnXsEnMFrwJoMYGousX4I4HsX9ri+bQG0piQ+//r7JsAlwbRzJ9y1B1jtGPvMLMqM6l52hKAB5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1plmEqMqpV8IgipC6AnDhVqIl4Yt7pMfRz3yMnlU1nM=;
 b=EUVtEhmg/crKukPo9pcxAaCoHs9rBpXPoNEDfWNk77ekSpRORJy4n/SXCfRBSDO2e6ukqATYRgOOpFPIBjSkTNWixuQYGJJPQYsATyRQpd8F6YrzzWJr2MJbT9TfQRm/UxrIS0OAsIyZoD8fQh1Ha+LFM9qQ5gSVH1ynp90OwG+67M55TPjQstI2i5eN504c65PwDMyi11xffhsmhy9w46xFGlboFrhyk3ldqJxgF8JjuUVwqud8vLBlBIAkPeakH1iu7hJFfYe/S3/iRb4qzIQYgUEAWXxnN02q0ikmYvII4pdUr9T9VQfBFSIQEa3oUuhqIkhtoSJNVsDRsMQ8mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SJ0PR11MB5213.namprd11.prod.outlook.com (2603:10b6:a03:2da::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.48; Wed, 2 Apr
 2025 14:12:05 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%4]) with mapi id 15.20.8583.041; Wed, 2 Apr 2025
 14:12:05 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <linux-pci@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Bjorn
 Helgaas" <bhelgaas@google.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?=
 <kw@linux.com>, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Matt Roper
 <matthew.d.roper@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH v7 6/6] drm/xe/pf: Set VF LMEM BAR size
Date: Wed, 2 Apr 2025 16:11:22 +0200
Message-ID: <20250402141122.2818478-7-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250402141122.2818478-1-michal.winiarski@intel.com>
References: <20250402141122.2818478-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR06CA0129.eurprd06.prod.outlook.com
 (2603:10a6:803:a0::22) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SJ0PR11MB5213:EE_
X-MS-Office365-Filtering-Correlation-Id: 4771b498-e83a-4e15-1dd2-08dd71f058a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bFhMZmRHNnc4WmEraTlObXhKd2tIeWlEWFlrMzhVcWtTWjVrVXRHY1JNNlFZ?=
 =?utf-8?B?Vmc4K0ROcmFYVnFWclBGem1zSG91cUF2WndoRU90cU5kbkpTZUFHeWJkRitQ?=
 =?utf-8?B?bi9vc0pHL2FrTmlEQXZJaW1vTERmZ2JyZ2loWmw4TDlBSFEwZ1luMzRBb2tR?=
 =?utf-8?B?RWNzdUc1RTFuSTQ5RVRocTZmMVBWTlhOeE00dXJ6S3g1RUFGYU5oRTdmbnBq?=
 =?utf-8?B?WXVHQzJLUGROWDNEVWZnSzZHRTFqYjJLRmtzZkdHT1cwR0FFakRlWEw2VzlQ?=
 =?utf-8?B?RDJBMllZQTJhUlp4TjhpWXBPNm9aT2V3UGZnTjJOVmxMalpUQjhOazR1MWMy?=
 =?utf-8?B?cXVndmgweGJuZi9NSGQyOTJrb04yQXk2SlkzdVpwQWNQV3RjQ1NSS2g2b05s?=
 =?utf-8?B?R0RjakpDTVJ3YXJ5WUkvTDFmOFZGQTZnSDNJWCszZXh1QVYwYWJKK2Y0Zk9j?=
 =?utf-8?B?VkttVkQ5RnYzTWoyOVZEWUczcmtlMmUyeWZ4Zmc4d0hwaFVITjlncFE1MEw0?=
 =?utf-8?B?eFNqQnorbEc5TTBWYWxFMFptdDcvRGZZQy9ITnJTeExhTi93S2RVdlRieGN5?=
 =?utf-8?B?SmV3MGQ4dURtMDZuMVVsTE11UHZNVkNNQzlqVmN0c0RVa0hWd1FlcHVLU25j?=
 =?utf-8?B?VWhRdU1ZenpwdkczU01odEJ0dllONlZoY0JIcHRoQU9kMnZkT2FrU2NIQ0d0?=
 =?utf-8?B?VlQwdGRuRi9mV3Q3M0NEVUJseUlsSUZJa2xmcW5WS0xJbzA0OTQ0amRoWlJ1?=
 =?utf-8?B?eFV0b0YxTFdYT2c1SHlzNWVqaStBZXJQVlhCR1lvYmlpbzJtS1AzejZLN1pt?=
 =?utf-8?B?dTFGdFRYQXRzcFZsdXpVQ0pHc0MvcGpGVWtHL210ZEVLT0V5UkVpUlJaVE43?=
 =?utf-8?B?Rzh2cmR1Y2lmMTI0bk5LUXlLRU03aGdPc2xvdTAyT0llU2pjTDRzNTlOVWsx?=
 =?utf-8?B?d1JhWndnUllNR0lPdDdONm93WG9qV0NRc0NyRXkyY3hoQmgyVGpleDN3VWZw?=
 =?utf-8?B?Ym43OCtUUVpXdzVFWWtIQk16YWhIQ1pGSTJWMTRtcUF0ZUZXb0pQemNGa2t4?=
 =?utf-8?B?Y0hTTURjSmthMU1XYXdYc2pEK1h0NWY2SVlJZUZ3T2ZsaHBFU09ZS3RlR29q?=
 =?utf-8?B?Y2luYWdTV2tFWmU3N010M2l1N3B1SkdCT2tzVldBZ2ZKT0duQ3YwSVVJOHht?=
 =?utf-8?B?NzRiWWEvSDZDUDdBTXhuT1VlZklNdStVbE8zdkZCL0p6OHFXcnkyQnk0bWMx?=
 =?utf-8?B?TkNjK1VhUStOVENtU3pkSVBENTFOMktXb0JwOGZuVUtqWDhlQTh0K1VxU0Jz?=
 =?utf-8?B?eUczUXBkdGVETnRLbDVvanpmajJYU09md2h5V1c3bDdqbjJRT2J6SENkV2ZL?=
 =?utf-8?B?dDRGUXBTWmZLZE9pcGU2YURxQ2dSeExlVWNrZk9WeUJvdVpJZEhQcW5Ec0J1?=
 =?utf-8?B?NjlhVTV5NkpoR2VpWmZad2RYdE9FbEVaTUJueWFzUGNOenVNUm9GWGdLL1B5?=
 =?utf-8?B?Y09WNjYxN1JPNDJuWEI3SkVmU0ZvWU1HNHBzUE9qZEphdkVtNWRvQ3B2Q0Ux?=
 =?utf-8?B?VTVuV2VGZlNlQWNBN0ZJQUZoYUQ1NUhHY2VMbmg3RUhnQ1BKd01kWHFqQmdZ?=
 =?utf-8?B?RTUzT0tPS0JCdGRFOWpndFZPSTN6Uml1aG5RRmR3dnNWalBhQWVWdVMyK2Ju?=
 =?utf-8?B?Ukpwelh4T2p2UzVXVCtycklMNncyUkgwcjZiWnExdXVmdHh4eW01Z25NakxU?=
 =?utf-8?B?TGJmZ2dkWDVwMU5YelgrVkt3d29PeVRic1lZV1dJaWVFazFEOGtuc1lxOHAx?=
 =?utf-8?B?YUVSWVM3K3Q4WXlIWU9jQmJXZFhWQXhvMUZyeDVpZ3dTUkE0bkxYendJYUdi?=
 =?utf-8?Q?FlKJ9GFA/DCRk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UzVWWjdhL0UxalF3cCtOd0c5RXUzaGYwRngxaXQ0MzFJOEFUNDJuQlJOd2tJ?=
 =?utf-8?B?R0h1VytVMkVCOHBZdE95Ujc4Nis1cUJ1Y3BwSmcyZmRVSnpIRklqSGZXYTFB?=
 =?utf-8?B?OXF4eHhTeHBSaXp5eTBlYTZpTHdOV2N2SERIdzBxNUNrTFltT212dG80cDlK?=
 =?utf-8?B?UlUxUFQ5OVNxcjMraFZKMy8zWlVaMVhyQU5HSjVkSHRWZjg2dytNZFRjZDht?=
 =?utf-8?B?RjJEb01JbWd0RU9WSm93YjI2WVV2SU5yQnlKT291Y09PYUxRMjY3cHcrUHUz?=
 =?utf-8?B?eDFqd3VSTXM0RWp3ejE2Vm9MbHZueWRyMElVVVo4dlVwWWxtSW1VanlvWWtz?=
 =?utf-8?B?WHRJT3Z2TDlyZGo1WFp4NDZndmNTZ0NvUjJNWEVhZnZnTlJvcjNxaFBTb1JZ?=
 =?utf-8?B?SDQ2TkZBc2NYdlowV2tZUWR5Y0o5eEQ2dGtUZ200ZmdQWmFtZ1hXWkZGQVVy?=
 =?utf-8?B?U0hLVURGVU0zSURYUlRVUFg5dWU1UDhxR1N3T2NqTUhKNUNsTlJvV2NteGpt?=
 =?utf-8?B?d3hKb2ZEZ21nUElKeUZSNE1CSXFBenBmc1JlaUZ2Mml0OXlmcWNadEZlSFN2?=
 =?utf-8?B?TS9QUjcvUFNjeWFuTHF2ZWQzVy8yZFVYNjRvb3dGT1ZPd1hJeVRjL0RFazQ5?=
 =?utf-8?B?YW1CZUgySWdXR1RhS2JsSzBOYVdQREttVFlXakpmM1dEYkVTV3hESDJUcHlC?=
 =?utf-8?B?bUFTd25nNmMrRFMvd2ZPc3gxQmY2ZDgzM2lRZ2llNzVvcFcrK0xWc0E3Y1Er?=
 =?utf-8?B?S3lwaDFkT2FYR1NJb1EwU0lxRkpnSjNqRDlQeFhwUGlpRUFPTC9EL09ITVN3?=
 =?utf-8?B?RmtvcWdLVkRzM1B2ckFNMXhwUFdJRlN1YlZRdnVvaFlPVytTL3laRmhrYkIw?=
 =?utf-8?B?cW5mWWdqQUVPM01tZTVhQWVnSUdTTmM4TjRlNDVqbHJpYkFzb253d3dqS3hG?=
 =?utf-8?B?REhKbXdiWjdxbVNGVHRjeDkxcEl2Rkd6cjZzUEdNdjRZc1hCeU0vQ0VGRUNO?=
 =?utf-8?B?VzJQZkg0SEhiY09JVFIrQ0t1ajVSaVd1NTk4TVFqMzdia3ZEeStZays3eWJo?=
 =?utf-8?B?N1lyUnJrWGxwejAwRDBGbnAyT0R0NER3dncvMTlPYVJBN3dTTmFXdnJCNEVN?=
 =?utf-8?B?UlIvWTlzWHpvWHo2ZjhxVWhyTGhoSkt0eFZEUG96K2FndVV6dzEzVGRKcDc0?=
 =?utf-8?B?RitGQUF2MUw1MjJYOUVFMkw5Q0Jjd2k1MzA3dEZ6QXJpQ1RDQ29XQ0U3VUYr?=
 =?utf-8?B?TTRING92Y25zTnpaYkttcW9YazVDQlRXUG40eThmeG52YzZXaDIrZnl2WVFJ?=
 =?utf-8?B?ZzEvNXdJVlJ4ZkRaUHRUUDFHY1ZsWW8vRXJCTlBHWlo2WTk5dFhuN0pELzRH?=
 =?utf-8?B?SCsvMnptMHJvL0F6NlMvSGtBTjRmbkd6T2tDcWt5V3JDODVlVktkMHBXVER0?=
 =?utf-8?B?NzhTYXFxYmpFUTRjME9ndWRPQ2ZFb2l0T1pLTmZXOHNhVTk2NmFPdkhEa1FF?=
 =?utf-8?B?OTdtb0orSzhFcTZuSC8rY2FjYmErUmdDK3Rydm1UUUlvT3k5ZXdCQXU5K0sv?=
 =?utf-8?B?Zk8rWGk5N2kyQjlnMkJoWmZIL3poQWxZc2RzS2tYU2t0dHY0T0tKVEJOejkr?=
 =?utf-8?B?M2dBb3dRS1RCSVozdC9wU3hZZ0NwUXJuazVlalRTTkVTczlYaklFMDljMVRY?=
 =?utf-8?B?MVZlZ2JncXdIQ214dDkyeUh1dTRNRWVQMW94MjlQZkxJbm1Xam1QZWpYbSsw?=
 =?utf-8?B?WCtIUXovVkNFZEM3K3BvS0tKZHpicGVvM3p3SVk3YVpDc2NMVHRxYTNwSWMx?=
 =?utf-8?B?WGdxU2FuOURjM01qWjZjL0pmSmhDUHArVG5HSjZSK296NHhYbS9vU2d2aEx0?=
 =?utf-8?B?Ly8zWkdVeXpmdWZuRjRmYWtoUkJWODUvVHFCTlNITllFRkppZEZNUUNKUmdW?=
 =?utf-8?B?NldMNDRkdnA1WU9aZnBsZEFxRkNrUWJycU8wSXByWUhXUGx2dk9GQmdqQm1T?=
 =?utf-8?B?UGptWnNjbTFNQVppMmRrMUlUckNSVTRjc2E1Y1hGM1NRdFpid1VEeTI0S0Zp?=
 =?utf-8?B?Q0NrL1JHeFMyV2tBaHp0NDV3b1VLeDRpazhXejJLam5jb3FzcnI3Z2xjRjJl?=
 =?utf-8?B?WGNmVVVld1hzc2ZqeXBJR3psT0xHb0NPKzNGS3JwbGk1bjhscXFFVm4xNmVE?=
 =?utf-8?B?QUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4771b498-e83a-4e15-1dd2-08dd71f058a1
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 14:12:05.1116 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3EYOWMy3j+Q72q0BS9Y65m9F8EAgyzpGWvxiTm8GpINO/UfVhcvTCuTKn46lmpWissTHMeHyO5Cx0fyEIlzH39ydWKBXFE9HY2wA1MVqwAc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5213
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

LMEM is partitioned between multiple VFs and we expect that the more
VFs we have, the less LMEM is assigned to each VF.
This means that we can achieve full LMEM BAR access without the need to
attempt full VF LMEM BAR resize via pci_resize_resource().

Always try to set the largest possible BAR size that allows to fit the
number of enabled VFs and inform the user in case the resize attempt is
not successful.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/gpu/drm/xe/regs/xe_bars.h |  1 +
 drivers/gpu/drm/xe/xe_pci_sriov.c | 22 ++++++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_bars.h b/drivers/gpu/drm/xe/regs/xe_bars.h
index ce05b6ae832f1..880140d6ccdca 100644
--- a/drivers/gpu/drm/xe/regs/xe_bars.h
+++ b/drivers/gpu/drm/xe/regs/xe_bars.h
@@ -7,5 +7,6 @@
 
 #define GTTMMADR_BAR			0 /* MMIO + GTT */
 #define LMEM_BAR			2 /* VRAM */
+#define VF_LMEM_BAR			9 /* VF VRAM */
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
index 09ee8a06fe2ed..4be566331ee15 100644
--- a/drivers/gpu/drm/xe/xe_pci_sriov.c
+++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
@@ -3,6 +3,10 @@
  * Copyright © 2023-2024 Intel Corporation
  */
 
+#include <linux/bitops.h>
+#include <linux/pci.h>
+
+#include "regs/xe_bars.h"
 #include "xe_assert.h"
 #include "xe_device.h"
 #include "xe_gt_sriov_pf_config.h"
@@ -111,6 +115,18 @@ static void pf_link_vfs(struct xe_device *xe, int num_vfs)
 	}
 }
 
+static int resize_vf_vram_bar(struct xe_device *xe, int num_vfs)
+{
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	u32 sizes;
+
+	sizes = pci_iov_vf_bar_get_sizes(pdev, VF_LMEM_BAR, num_vfs);
+	if (!sizes)
+		return 0;
+
+	return pci_iov_vf_bar_set_size(pdev, VF_LMEM_BAR, __fls(sizes));
+}
+
 static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
 {
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
@@ -137,6 +153,12 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
 	if (err < 0)
 		goto failed;
 
+	if (IS_DGFX(xe)) {
+		err = resize_vf_vram_bar(xe, num_vfs);
+		if (err)
+			xe_sriov_info(xe, "Failed to set VF LMEM BAR size: %d\n", err);
+	}
+
 	err = pci_enable_sriov(pdev, num_vfs);
 	if (err < 0)
 		goto failed;
-- 
2.49.0


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA87C18E7A
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 09:15:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6BB210E71B;
	Wed, 29 Oct 2025 08:15:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VOsfxo9p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6277410E71B;
 Wed, 29 Oct 2025 08:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761725704; x=1793261704;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TarmnXfe9DCLMdEuEkDcOITLI1D18ZnzS7mKcWPcwUE=;
 b=VOsfxo9pF9n9djeGpEf8dLDjiJBC7gBrhCLeMAoEKnIbcV0pKK/4wvwg
 +eDgfzQBIuG/j1/Ier4j5fb5F0SKwCqLzUTqS9HzSHfy4y+Egk9YEZc1n
 1kk6Y2pGOkC1rN6K2lenumcPOzYLNnp42W0XFJeHQK0bOGV140UGLRJgb
 G2ooH9CICzgbcxrwgRguMen+6LlHXFYdbVpJ8Jbzge3Y5PmJ5/9/w2LvM
 DywUiNgDdATO1MnTGqWvxEH/vitkeIfHZgtv4kvp7dheWiCyFUeQUJ3be
 DBCp3CYy8reFFpy+c7AZnZChDvIqo6SjLrXQ3DgEeDCNkrv4qp3UYxMwn w==;
X-CSE-ConnectionGUID: FKm1bBjzSnWjPjwmNKehOg==
X-CSE-MsgGUID: WXIWSa/JQiGR1WgfobqDrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74515908"
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; d="scan'208";a="74515908"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 01:15:04 -0700
X-CSE-ConnectionGUID: 4O55OGpVSfGOycQ2jlK+QA==
X-CSE-MsgGUID: rKr5FPPsT5W5ax3T5w/xHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; d="scan'208";a="216453546"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 01:15:03 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 01:15:03 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 29 Oct 2025 01:15:03 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.31) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 01:15:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lijf3gJPcYKnse23uGujQvTwysJx9+tEBE7lHuCXoM4pcuNH8NXHbjzF/gBJnKqxgziCVA4fuq+vOPdEv5+vKBjkDNlq8o2ffj9EbzNqoXVm//m4GJOm+ypYVGMchaJslGTlKt5CItIPW9VshAC5IqhDqkIi/Nl8gKCw7T87XWz0hYZey2L3P0Ij47Boe2ZDwTxGGJLpjLl1b7hQ9/xtkmSXiU4bSUEJUseZfUHHn3tO9Vb9GskWEdAg8DuCYcK/vk09lnTTgSz8G4gzbYsAvg4uJ8GLPcFc/zC2ZYyjWONsAfxoR04/RHfE2SO37YiyB1lfbSWdu20VvUrWGoWHLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TarmnXfe9DCLMdEuEkDcOITLI1D18ZnzS7mKcWPcwUE=;
 b=aUAFh7mTNiXdER5vFiNwLQtMzoO3hQBvcfd9s8czYQwsABhSSzTIeI2WzmRCWZ9hfJXyBytf7JvGvnCl9Ud+PLQJGbS5aejai8GwNd0bQhmERLrXGZXlfdGX5PDgpAEbTFk1IgjNNf/E14JPmgONcXQdnCQAB29QUHSaeDudL3X/h6QDafUgVWtx63i9UFCz0wkUnvZSC0igqL8WfAih497/qHkum6uoqynsvspq96Vfvvg9VpbMvfHoPQSuQC0Jla/KD93FySxMxCFhnTfY9OQL2CFoegPNyLeu+isXl/tgF/xLPcNyTGU9O6P38xjJ3dV9JGyOEfCASUEgJvMqjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by CY5PR11MB6319.namprd11.prod.outlook.com
 (2603:10b6:930:3d::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Wed, 29 Oct
 2025 08:15:00 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc%4]) with mapi id 15.20.9275.011; Wed, 29 Oct 2025
 08:15:00 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 "xaver.hugl@kde.org" <xaver.hugl@kde.org>, "harry.wentland@amd.com"
 <harry.wentland@amd.com>, "Shankar, Uma" <uma.shankar@intel.com>,
 "louis.chauvet@bootlin.com" <louis.chauvet@bootlin.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Murthy,
 Arun R" <arun.r.murthy@intel.com>
Subject: RE: [PATCH v6 4/5] drm/atomic: Return user readable error in
 atomic_ioctl
Thread-Topic: [PATCH v6 4/5] drm/atomic: Return user readable error in
 atomic_ioctl
Thread-Index: AQHcOQD56kiT3K2owUaoCNlvBpWvyrTY4yEw
Date: Wed, 29 Oct 2025 08:15:00 +0000
Message-ID: <DM3PPF208195D8D35B470FB27BB47AD262BE3FAA@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20251009-atomic-v6-0-d209709cc3ba@intel.com>
 <20251009-atomic-v6-4-d209709cc3ba@intel.com>
In-Reply-To: <20251009-atomic-v6-4-d209709cc3ba@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|CY5PR11MB6319:EE_
x-ms-office365-filtering-correlation-id: 1284640b-3be4-413c-bd9b-08de16c3417c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|921020|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?Q0JOTUlYMDN4QXZ0MUlrTnB4ZytacFhKUjNKWWh3OWVDQkI4cEpDRXZZMU1W?=
 =?utf-8?B?Q044Z2lCdG5oY0YrUmM2czd4bUtZWXhhdlZWeE55TVg2R1RpcC9PQmx4dnBv?=
 =?utf-8?B?SXRHaFdxT2xEZWZTbVA3Y3JGQ3hyMy9HWmZxM0p4b2F5U291U2l5QkhzamJX?=
 =?utf-8?B?ckVnSElEeXk0NUFGYlhCa1p3VlZubndJTlhPaEJpWGI1b3V1V21Tc0w0NjNz?=
 =?utf-8?B?ano4NTF5SHRWMUZJNDFHV294ZzRVZVVjT3ZrZ0xIZmhiSmJTaU8yK2NhcTRI?=
 =?utf-8?B?VEpMdi84Tm1kUzVCa2dHNUt5N08rWFVCaXFPSVFKN1UzL0NyTEQ4aUFvcWgz?=
 =?utf-8?B?ZUdkU3BLWkJpN0E5OTB0M0tJWC8zZ2xLM0lhdElVMC9XaXFlM0k1TW00WlZD?=
 =?utf-8?B?NWpGak5TcU80djJ2dFBvRGR3Z29vTFhNMmRzckd5YWVuU0c3NWdTSy9zQnQy?=
 =?utf-8?B?SUhlYkxiUVlNV2VVbWhKU0k0Q0xBczBDb3FjbHZVRGtYa0hwWEJlWTUybjk5?=
 =?utf-8?B?TUk3c3dlWHFoL1I2akU4ZFFhYm1lclp6Z1NhT0lmQUxUOEJWZUdDWnBTc1RM?=
 =?utf-8?B?VzJVT0I2M3pzcVN1akw0Mk1wMjFoS3BIS3RVRzd6eVlrWDliZlFCYU5OckVF?=
 =?utf-8?B?MmZDRHR3TmI5K2xVVW1WK0RwQStUMHZCSko5Snc5ZGtQWCthUys4UVhBQUpU?=
 =?utf-8?B?ZTF0aysvMVRVR3R2aU05STE5Z0JLVVhwZHV6Zkx4SVJRUERKMVBUUUlNa2k2?=
 =?utf-8?B?OEV6akxHQUthNGxtY3BQUG8zSVBxUDB5ZEY1aG1SanhjZW1QMDhRSnNKT001?=
 =?utf-8?B?QUxDekk4d1ZVaFhuVTdaNnlXNG5ETVk5bmJvOHBRUXAxdjdNcUoxRk5YOXR6?=
 =?utf-8?B?cFRtWmFOYTl4d3IvWlZRL1hBRTJvbVlqam5lVlRGNTAvRGhCVFhVa1VYcWlQ?=
 =?utf-8?B?MVVnZU1oNU52eW40UVdVVFJPY2VVQ2s0ODNCUm5yYzYvbTdSNHppWHFVTDgx?=
 =?utf-8?B?SHVMcE1kUHI1ZzhQZ0JZa05sOGFYdXZrdXNFZkJQR3hLU05OcjBTL2o2Ynhs?=
 =?utf-8?B?WHcxenV2dnFBc3ZITGJ5N2hTaWR5ODZ2cXRsRW01NFQ2QXU1dWxKYVlmUmVY?=
 =?utf-8?B?SWY4L0xRRU1CaFc5WmpIaS9tYW4zWTdCa0NPNlF4YitidklldnA4WVh4L3Vk?=
 =?utf-8?B?ZGY2NWUxaTF0cSsxQ1l0UjZ0SSs0eUVncU5CT1VWTU9BNUh5RWNaTkdTSHE4?=
 =?utf-8?B?SysxZ1k3RzI2YWRWaG1IN1RBTVNXYXJiZDZIRFNvMG5YcXpUcjBtcVNrYy9I?=
 =?utf-8?B?VTAxQ1VBUU9yZDJxOXlLbjMwbkxZUUI2YWF6K01obVFLdERObHFpaldwd3FF?=
 =?utf-8?B?ekV0dGpNMTF6RmJiM0VNcUl2SnEyRE9Xb2taeHh4SHFTVGM2ckdxbmVTQ25J?=
 =?utf-8?B?WUoyc2JocENIamppbVhaNVQ4aGdlb0U1cXJLMEZyVDlzbS8xRWJDWTA5cGRk?=
 =?utf-8?B?RVh0WTIvV28yOEN3MWRKcWxScU1RVVRHVU05R2R3TCtCNkpjenhUT3dYRjUz?=
 =?utf-8?B?Qk4wclFWTXQva3pYYTdmNHRKTXZXNWk1UkMvZWNIWDcrTTRKTkI3amNhQmpz?=
 =?utf-8?B?VGtFSVNWVnFjRE1kb1NFL081NWF1NmsrSDlRVzAyTGhXNk1JNUpmQWV4NTM4?=
 =?utf-8?B?c3VGMy9BR2FYVHdEM25qclJaOU5NV3cvNE9WdUdNMHIreHlZRFpVTWc4Qml6?=
 =?utf-8?B?NDVQZitveWlLeDZnb3AydDlER09KQnE2cGJaOTEyU3VhWmh5SSt2cFJyRURR?=
 =?utf-8?B?MWlsek0yMHhHWkhacFNuTTluQklPWVU2ai9iRysrRk1tTFRvOHovTUZ6YkMw?=
 =?utf-8?B?UE5HMXptSnQxOVoxTm0xQ2tQOTRRVGNNaGNTR1FwdjBnVm1mT1VCVEpjWVU0?=
 =?utf-8?B?RzF6Mmc0cXZpeE0xWGt1bFVsaTZmZHQwblVta0hNM1Fick1VUW1rd3FOMzU5?=
 =?utf-8?B?RFZaekhhMDA3cHZIWGhCUVRPam1aeGc5MHNtamhHOVFWVHUzOVJvQWxPaHNM?=
 =?utf-8?B?N2xnN0s3WGpKWXVleWg4eVRveXlKTzhmMEg3UT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(921020)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dE50RE1hQWVqZjRCOXptVUpiL1RnR2NOUkZMUEk5UUxFdEtwYlRPbU44TXZS?=
 =?utf-8?B?NGo2Mk5QL1ZhZ3lEV0RHR0dFZ202QTk4SGpVb0FhSWc5VDJiTUlVd3N4Y08r?=
 =?utf-8?B?a1ZUdzFXa2Q2QitYdlhDM1RmTUNndE5mU3FheDZscm1rUkdOL2ZwWEZjaEtK?=
 =?utf-8?B?b2RoZFZkaUFXaG90dU5DOUNHZ213bVdrV2lwRjVtWitXVW14TGFQdmp6NW92?=
 =?utf-8?B?cmFMNmJNNUk5dzgrWFh2bFRvKzUzaXpBOEtReW9BVVFFWVRYVHJNY2pKNlBB?=
 =?utf-8?B?QUN5OCs2Z2d1cG1icjZiVW5YUVk4K3AzVGRlcDhjZnZraDVEcTB0QjMybHdM?=
 =?utf-8?B?RzMyUkdMUDl6TnVGd1NSVHVYNngzb2pudFc1L0ZHQmhJaDFkd1JvSmFHbDNz?=
 =?utf-8?B?WFdTMGdwM1NwN2o5My9BNWZ4T00zVjFET09qbi9NNUNjeVFBZG03SUIvUjdl?=
 =?utf-8?B?QkUzTlFUOWpTeGNOOU1XQVk1SjRxZ3dsMVllQWlJaUduSUdmZmNrcUQxclpy?=
 =?utf-8?B?MW5xN0FpYUhqUlV2NzJVTnluYlJnU1plNysxUU15S0RPK2pJUmxKdEZCWGZz?=
 =?utf-8?B?ejFORXBQQ3FQc2NUUkNObVlFbHpqa0FFYTFwaU1EUE5veXJiYjQ5b083UGhZ?=
 =?utf-8?B?NXBVelNiVzh1ZHFWUWhEZWVFL3MxZlV1cjJla0t1b2VRNm9ucGZwc0hEVjFx?=
 =?utf-8?B?bk9XQmdtVGRyblh2UGVQYTBSOHJNN1dSTnV0RE1MZm42SmdGY1FnNE5VSldW?=
 =?utf-8?B?enY0cXQxV0NHNnZSbHRIc1EzL21CaXYxRlpabGFCWjFMdHdIOHlwVmwyMmw4?=
 =?utf-8?B?SnVDYVlRN3pXZjI3M1VLOGhrdGVja0c1Y2dUZnl5L2JUWlU2S0NwK1hpMWhK?=
 =?utf-8?B?UGRDMzBQdVBzMFpGSGZDNkNuNFcvL2tFbTlMZXRpN203ZFRENWhNZ3oxeVFy?=
 =?utf-8?B?N3JUSVArOGdGYlgvaTdQdklrVkRXbTBZSUdvbzlJQVdHL2JWVXlMK0FMdE1L?=
 =?utf-8?B?VWpVc3Zwa1QxaHV0cXRVTWpMSytHUWY4REY2em5DdWZwU3hXSmt5eElTaFRS?=
 =?utf-8?B?bTdvUFlWTmRLUDB6bWd3V3d4TkV5THNRZGFiOGthbXZQSGJWaTlEWDZuam9E?=
 =?utf-8?B?S0JXbVdqNG9FVFkrY1J1TXVZd0JKSGhLekRTMW1hTDlvL3haZldFalNwTXkw?=
 =?utf-8?B?UGNkUzlBVWhBa0dLbjBMbmFkUXV6V3lTY1BEMnRFQ3JZdFd2ZUk5dkVxclVL?=
 =?utf-8?B?ektWdTRNRnRFMnhsdkNKTUxUOWczMlJKOVA5UEgvYzZyOUlzWGt0OHVVU04w?=
 =?utf-8?B?Vml3R0Jyb3hIZ1J3c1AyUWhaVithVG5KZ1hSemI2aEJ0b0dJZDYrZzltK0Yz?=
 =?utf-8?B?bzhNYWhtZzUySUJhYWJDOEZ4UGV6dUlocFpkVHlweE5FWlpjWUZsNUdlb1hV?=
 =?utf-8?B?WmF5QWp6Y21Pd0pxNGt2UXZiRXNudG03aVRHUU5SRm1GcE5OR0FsSHVvc0tR?=
 =?utf-8?B?NnFUUDJ0U2VOM3FZOEh5QXVUR1BQd3B6T3NpS2JmZko1NW15THhsMTRVREM0?=
 =?utf-8?B?c2t1QXQxaFljYmNsbmd0TmE4all2VmMwUWlwcUJMR3d0NkE3RVFZd2htTnVR?=
 =?utf-8?B?OEFZaDVuNkt2WCtTLzYrM1VlelJhblBYUVBNdWY2ZWgxb051ZDU1dXVieVBY?=
 =?utf-8?B?NndHK1lPeFp0MWQwcjllSUttazJKUmpnUGlHMjN2MmlBZXJwSUNGVXhUdXB5?=
 =?utf-8?B?eUFKd3NCKzN3QS9Vd0hzcnlGTUt4VXhqQ0oxSDA0Rzh1MnY4NGFTeVlGMWRx?=
 =?utf-8?B?VmV3WkRxUHRpM29hbnVpZ0xta2VCVEIrUURvUGg0dWRHZ3dEMUpQNWJPMVpH?=
 =?utf-8?B?SzhjM0lZTEVrNy9jYlk5TUxzVkNKZTNKOVdpcHZ5aWJHRXd1a2RmTkZSMzYz?=
 =?utf-8?B?Ni9MbW9SdUtWUVExc0g2TlZTNjNxTGhJUjNrN3FnZmpwWWJiMkZWWC9XZXkv?=
 =?utf-8?B?Q2x2SUFhbEtweElTU3g5QmZWTXpKRERIZ1JQWEJiZXJUR3VIMlo2WGZPeExk?=
 =?utf-8?B?elhlUGtJc2J1b2ZMK2l3TThJNXV0b0hTYWJvZy9HU0RTa0cxYXlBL05TUlN3?=
 =?utf-8?Q?GNhpAc9Lvau5mwbKbkEAqU5hA?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1284640b-3be4-413c-bd9b-08de16c3417c
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2025 08:15:00.5712 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /c1+IYvHt6zSkCeXqpBno504F81XJCter0nC8qU9qWvjd17sU74bakRldLaJPv/8fTRq2opPNppx97DYmIshBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6319
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

PiBTdWJqZWN0OiBbUEFUQ0ggdjYgNC81XSBkcm0vYXRvbWljOiBSZXR1cm4gdXNlciByZWFkYWJs
ZSBlcnJvciBpbg0KPiBhdG9taWNfaW9jdGwNCj4gDQo+IEFkZCB1c2VyIHJlYWRhYmxlIGVycm9y
IGNvZGVzIGZvciBmYWlsdXJlIGNhc2VzIGluIGRybV9hdG9taWNfaW9jdGwoKSBzbyB0aGF0DQo+
IHVzZXIgY2FuIGRlY29kZSB0aGUgZXJyb3IgY29kZSBhbmQgdGFrZSBjb3JyZWN0aXZlIG1lYXN1
cmVtZW50cy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFydW4gUiBNdXJ0aHkgPGFydW4uci5tdXJ0
aHlAaW50ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX3VhcGku
YyB8IDcxDQo+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLQ0KPiAgMSBm
aWxlIGNoYW5nZWQsIDUyIGluc2VydGlvbnMoKyksIDE5IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX3VhcGkuYw0KPiBiL2RyaXZlcnMv
Z3B1L2RybS9kcm1fYXRvbWljX3VhcGkuYw0KPiBpbmRleA0KPiAzZWY0NzhlNzE3YmVjOTE3ZDFi
ODgwM2M3MmJiY2M4ZDY0MDlkNzQ1Li4zZDRlOTcwOWU4ZTI4OWNmMzAyNDEzDQo+IGUxNzFiMTMz
NjgxMmQ2NWMxYyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWNfdWFw
aS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX3VhcGkuYw0KPiBAQCAtMTAz
Niw2ICsxMDM2LDExIEBAIGludCBkcm1fYXRvbWljX3NldF9wcm9wZXJ0eShzdHJ1Y3QNCj4gZHJt
X2F0b21pY19zdGF0ZSAqc3RhdGUsDQo+ICAJCQlyZXQgPSBkcm1fYXRvbWljX2Nvbm5lY3Rvcl9n
ZXRfcHJvcGVydHkoY29ubmVjdG9yLA0KPiBjb25uZWN0b3Jfc3RhdGUsDQo+ICAJCQkJCQkJCXBy
b3AsDQo+ICZvbGRfdmFsKTsNCj4gIAkJCXJldCA9IGRybV9hdG9taWNfY2hlY2tfcHJvcF9jaGFu
Z2VzKHJldCwgb2xkX3ZhbCwNCj4gcHJvcF92YWx1ZSwgcHJvcCk7DQo+ICsJCQlpZiAocmV0KSB7
DQo+ICsJCQkJZHJtX21vZGVfYXRvbWljX2FkZF9lcnJvcl9tc2coJnN0YXRlLQ0KPiA+ZXJyb3Jf
Y29kZSwNCj4gKw0KPiBEUk1fTU9ERV9BVE9NSUNfQVNZTkNfUFJPUF9DSEFOR0VELA0KPiArCQkJ
CQkJCSAgICAgICJwcm9wZXJ0eSBjaGFuZ2UNCj4gbm90IGFsbG93ZWQgaW4gYXN5bmMgZmxpcCIp
Ow0KPiArCQkJfQ0KPiAgCQkJYnJlYWs7DQo+ICAJCX0NCj4gDQo+IEBAIC0xMDU4LDYgKzEwNjMs
MTEgQEAgaW50IGRybV9hdG9taWNfc2V0X3Byb3BlcnR5KHN0cnVjdA0KPiBkcm1fYXRvbWljX3N0
YXRlICpzdGF0ZSwNCj4gIAkJCXJldCA9IGRybV9hdG9taWNfY3J0Y19nZXRfcHJvcGVydHkoY3J0
YywgY3J0Y19zdGF0ZSwNCj4gIAkJCQkJCQkgICBwcm9wLCAmb2xkX3ZhbCk7DQo+ICAJCQlyZXQg
PSBkcm1fYXRvbWljX2NoZWNrX3Byb3BfY2hhbmdlcyhyZXQsIG9sZF92YWwsDQo+IHByb3BfdmFs
dWUsIHByb3ApOw0KPiArCQkJaWYgKHJldCkgew0KPiArCQkJCWRybV9tb2RlX2F0b21pY19hZGRf
ZXJyb3JfbXNnKCZzdGF0ZS0NCj4gPmVycm9yX2NvZGUsDQo+ICsNCj4gRFJNX01PREVfQVRPTUlD
X0FTWU5DX1BST1BfQ0hBTkdFRCwNCj4gKwkJCQkJCQkgICAgICAicHJvcGVydHkgY2hhbmdlDQo+
IG5vdCBhbGxvd2VkIGluIGFzeW5jIGZsaXAiKTsNCj4gKwkJCX0NCj4gIAkJCWJyZWFrOw0KPiAg
CQl9DQo+IA0KPiBAQCAtMTA5Niw5ICsxMTA2LDEwIEBAIGludCBkcm1fYXRvbWljX3NldF9wcm9w
ZXJ0eShzdHJ1Y3QNCj4gZHJtX2F0b21pY19zdGF0ZSAqc3RhdGUsDQo+ICAJCQkJCXJldCA9IHBs
YW5lX2Z1bmNzLQ0KPiA+YXRvbWljX2FzeW5jX2NoZWNrKHBsYW5lLCBzdGF0ZSwgdHJ1ZSk7DQo+
IA0KPiAgCQkJCWlmIChyZXQpIHsNCj4gLQkJCQkJZHJtX2RiZ19hdG9taWMocHJvcC0+ZGV2LA0K
PiAtCQkJCQkJICAgICAgICJbUExBTkU6JWQ6JXNdIGRvZXMgbm90DQo+IHN1cHBvcnQgYXN5bmMg
ZmxpcHNcbiIsDQo+IC0JCQkJCQkgICAgICAgb2JqLT5pZCwgcGxhbmUtPm5hbWUpOw0KPiArDQo+
IAlkcm1fbW9kZV9hdG9taWNfYWRkX2Vycm9yX21zZygmc3RhdGUtPmVycm9yX2NvZGUsDQo+ICsN
Cj4gRFJNX01PREVfQVRPTUlDX0FTWU5DX05PVF9TVVBQX1BMQU5FLA0KPiArDQo+ICJbUExBTkU6
JWQ6JXNdIGRvZXMgbm90IHN1cHBvcnQgYXN5bmMgZmxpcCIsDQo+ICsJCQkJCQkJCSAgICAgIG9i
ai0+aWQsDQo+IHBsYW5lLT5uYW1lKTsNCj4gIAkJCQkJYnJlYWs7DQo+ICAJCQkJfQ0KPiAgCQkJ
fQ0KPiBAQCAtMTM5Myw2ICsxNDA0LDcgQEAgaW50IGRybV9tb2RlX2F0b21pY19pb2N0bChzdHJ1
Y3QgZHJtX2RldmljZQ0KPiAqZGV2LA0KPiAgCXN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpzdGF0
ZTsNCj4gIAlzdHJ1Y3QgZHJtX21vZGVzZXRfYWNxdWlyZV9jdHggY3R4Ow0KPiAgCXN0cnVjdCBk
cm1fb3V0X2ZlbmNlX3N0YXRlICpmZW5jZV9zdGF0ZTsNCj4gKwlzdHJ1Y3QgZHJtX21vZGVfYXRv
bWljX2Vycl9jb2RlIF9fdXNlciAqZXJyb3JfY29kZV9wdHI7DQo+ICAJaW50IHJldCA9IDA7DQo+
ICAJdW5zaWduZWQgaW50IGksIGosIG51bV9mZW5jZXMgPSAwOw0KPiAgCWJvb2wgYXN5bmNfZmxp
cCA9IGZhbHNlOw0KPiBAQCAtMTQwMSw2ICsxNDEzLDE0IEBAIGludCBkcm1fbW9kZV9hdG9taWNf
aW9jdGwoc3RydWN0IGRybV9kZXZpY2UNCj4gKmRldiwNCj4gIAlpZiAoIWRybV9jb3JlX2NoZWNr
X2ZlYXR1cmUoZGV2LCBEUklWRVJfQVRPTUlDKSkNCj4gIAkJcmV0dXJuIC1FT1BOT1RTVVBQOw0K
PiANCj4gKwlpZiAoIWFyZy0+cmVzZXJ2ZWQpDQo+ICsJCWRybV9kYmdfYXRvbWljKGRldiwNCj4g
KwkJCSAgICAgICAibWVtb3J5IG5vdCBhbGxvY2F0ZWQgZm9yIGRybV9hdG9taWMgZXJyb3INCj4g
cmVwb3J0aW5nXG4iKTsNCj4gKwllbHNlDQo+ICsJCS8qIHVwZGF0ZSB0aGUgZXJyb3IgY29kZSBp
ZiBhbnkgZXJyb3IgdG8gYWxsb3cgdXNlciBoYW5kbGluZyBpdA0KPiAqLw0KDQpGaXJzdCBsZXR0
ZXIgaW4gdXBwZXJjYXNlLg0KDQo+ICsJCWVycm9yX2NvZGVfcHRyID0gKHN0cnVjdCBkcm1fbW9k
ZV9hdG9taWNfZXJyX2NvZGUgX191c2VyDQo+ICopDQo+ICsJCQkJICh1bnNpZ25lZCBsb25nKWFy
Zy0+cmVzZXJ2ZWQ7DQo+ICsNCj4gIAlzdGF0ZSA9IGRybV9hdG9taWNfc3RhdGVfYWxsb2MoZGV2
KTsNCj4gIAlpZiAoIXN0YXRlKQ0KPiAgCQlyZXR1cm4gLUVOT01FTTsNCj4gQEAgLTE0MDksMzEg
KzE0MjksMzUgQEAgaW50IGRybV9tb2RlX2F0b21pY19pb2N0bChzdHJ1Y3QgZHJtX2RldmljZQ0K
PiAqZGV2LA0KPiAgCXN0YXRlLT5hY3F1aXJlX2N0eCA9ICZjdHg7DQo+ICAJc3RhdGUtPmFsbG93
X21vZGVzZXQgPSAhIShhcmctPmZsYWdzICYNCj4gRFJNX01PREVfQVRPTUlDX0FMTE9XX01PREVT
RVQpOw0KPiANCj4gKwltZW1zZXQoJnN0YXRlLT5lcnJvcl9jb2RlLCAwLCBzaXplb2Yoc3RydWN0
DQo+ICtkcm1fbW9kZV9hdG9taWNfZXJyX2NvZGUpKTsNCg0KSXNuJ3QgaXMgYmV0dGVyIHRvIGhh
dmUgaXQgYXMNCnNpemVvZigqZXJyb3JfY29kZV9wdHIpDQoNCj4gKw0KPiAgCS8qIGRpc2FsbG93
IGZvciB1c2Vyc3BhY2UgdGhhdCBoYXMgbm90IGVuYWJsZWQgYXRvbWljIGNhcCAoZXZlbg0KPiAg
CSAqIHRob3VnaCB0aGlzIG1heSBiZSBhIGJpdCBvdmVya2lsbCwgc2luY2UgbGVnYWN5IHVzZXJz
cGFjZQ0KPiAgCSAqIHdvdWxkbid0IGtub3cgaG93IHRvIGNhbGwgdGhpcyBpb2N0bCkNCj4gIAkg
Ki8NCj4gIAlpZiAoIWZpbGVfcHJpdi0+YXRvbWljKSB7DQo+IC0JCWRybV9kYmdfYXRvbWljKGRl
diwNCj4gLQkJCSAgICAgICAiY29tbWl0IGZhaWxlZDogYXRvbWljIGNhcCBub3QgZW5hYmxlZFxu
Iik7DQo+IC0JCXJldHVybiAtRUlOVkFMOw0KPiArCQlkcm1fbW9kZV9hdG9taWNfYWRkX2Vycm9y
X21zZygmc3RhdGUtPmVycm9yX2NvZGUsDQo+ICsNCj4gRFJNX01PREVfQVRPTUlDX0lOVkFMSURf
QVBJX1VTQUdFLA0KPiArCQkJCQkgICAgICAiRFJNX0FUT01JQyBjYXBhYmlsaXR5IG5vdA0KPiBl
bmFibGVkIik7DQoNCkknZCByYXRoZXIgaGF2ZSBpdCBzYXkgZHJtIGF0b21pYyBjYXBhYmlsaXR5
IG5vdCBlbmFibGVkDQoNCj4gKwkJcmV0ID0gLUVJTlZBTDsNCj4gKwkJZ290byBvdXQ7DQo+ICAJ
fQ0KPiANCj4gIAlpZiAoYXJnLT5mbGFncyAmIH5EUk1fTU9ERV9BVE9NSUNfRkxBR1MpIHsNCj4g
LQkJZHJtX2RiZ19hdG9taWMoZGV2LCAiY29tbWl0IGZhaWxlZDogaW52YWxpZCBmbGFnXG4iKTsN
Cj4gLQkJcmV0dXJuIC1FSU5WQUw7DQo+IC0JfQ0KPiAtDQo+IC0JaWYgKGFyZy0+cmVzZXJ2ZWQp
IHsNCj4gLQkJZHJtX2RiZ19hdG9taWMoZGV2LCAiY29tbWl0IGZhaWxlZDogcmVzZXJ2ZWQgZmll
bGQgc2V0XG4iKTsNCj4gLQkJcmV0dXJuIC1FSU5WQUw7DQo+ICsJCWRybV9tb2RlX2F0b21pY19h
ZGRfZXJyb3JfbXNnKCZzdGF0ZS0+ZXJyb3JfY29kZSwNCj4gKw0KPiBEUk1fTU9ERV9BVE9NSUNf
SU5WQUxJRF9BUElfVVNBR0UsDQo+ICsJCQkJCSAgICAgICJpbnZhbGlkIGZsYWciKTsNCj4gKwkJ
cmV0ID0gLUVJTlZBTDsNCj4gKwkJZ290byBvdXQ7DQo+ICAJfQ0KPiANCj4gIAlpZiAoYXJnLT5m
bGFncyAmIERSTV9NT0RFX1BBR0VfRkxJUF9BU1lOQykgew0KPiAgCQlpZiAoIWRldi0+bW9kZV9j
b25maWcuYXN5bmNfcGFnZV9mbGlwKSB7DQo+IC0JCQlkcm1fZGJnX2F0b21pYyhkZXYsDQo+IC0J
CQkJICAgICAgICJjb21taXQgZmFpbGVkOg0KPiBEUk1fTU9ERV9QQUdFX0ZMSVBfQVNZTkMgbm90
IHN1cHBvcnRlZFxuIik7DQo+IC0JCQlyZXR1cm4gLUVJTlZBTDsNCj4gKwkJCWRybV9tb2RlX2F0
b21pY19hZGRfZXJyb3JfbXNnKCZzdGF0ZS0NCj4gPmVycm9yX2NvZGUsDQo+ICsNCj4gRFJNX01P
REVfQVRPTUlDX0lOVkFMSURfQVBJX1VTQUdFLA0KPiArDQo+ICJEUk1fTU9ERV9QQUdFX0ZMSVBf
QVNZTkMgbm90IHN1cHBvcnRlZCB3aXRoIEFUT01JQyBpb2N0bCIpOw0KPiArCQkJcmV0ID0gLUVJ
TlZBTDsNCj4gKwkJCWdvdG8gb3V0Ow0KPiAgCQl9DQo+IA0KPiAgCQlhc3luY19mbGlwID0gdHJ1
ZTsNCj4gQEAgLTE0NDIsOSArMTQ2NiwxMSBAQCBpbnQgZHJtX21vZGVfYXRvbWljX2lvY3RsKHN0
cnVjdCBkcm1fZGV2aWNlDQo+ICpkZXYsDQo+ICAJLyogY2FuJ3QgdGVzdCBhbmQgZXhwZWN0IGFu
IGV2ZW50IGF0IHRoZSBzYW1lIHRpbWUuICovDQo+ICAJaWYgKChhcmctPmZsYWdzICYgRFJNX01P
REVfQVRPTUlDX1RFU1RfT05MWSkgJiYNCj4gIAkJCShhcmctPmZsYWdzICYgRFJNX01PREVfUEFH
RV9GTElQX0VWRU5UKSkgew0KPiAtCQlkcm1fZGJnX2F0b21pYyhkZXYsDQo+IC0JCQkgICAgICAg
ImNvbW1pdCBmYWlsZWQ6IHBhZ2UtZmxpcCBldmVudCByZXF1ZXN0ZWQgd2l0aA0KPiB0ZXN0LW9u
bHkgY29tbWl0XG4iKTsNCj4gLQkJcmV0dXJuIC1FSU5WQUw7DQo+ICsJCWRybV9tb2RlX2F0b21p
Y19hZGRfZXJyb3JfbXNnKCZzdGF0ZS0+ZXJyb3JfY29kZSwNCj4gKw0KPiBEUk1fTU9ERV9BVE9N
SUNfSU5WQUxJRF9BUElfVVNBR0UsDQo+ICsJCQkJCSAgICAgICJwYWdlLWZsaXAgZXZlbnQgcmVx
dWVzdGVkIHdpdGgNCj4gdGVzdC1vbmx5IGNvbW1pdCIpOw0KPiArCQlyZXQgPSAtRUlOVkFMOw0K
PiArCQlnb3RvIG91dDsNCj4gIAl9DQo+IA0KPiAgcmV0cnk6DQo+IEBAIC0xNTQzLDYgKzE1Njks
MTMgQEAgaW50IGRybV9tb2RlX2F0b21pY19pb2N0bChzdHJ1Y3QgZHJtX2RldmljZQ0KPiAqZGV2
LA0KPiAgCX0NCj4gDQo+ICBvdXQ6DQo+ICsJLyogdXBkYXRlIHRoZSBlcnJvciBjb2RlIGlmIGFu
eSBlcnJvciB0byBhbGxvdyB1c2VyIGhhbmRsaW5nIGl0ICovDQoNCkZpcnN0IGxldHRlciBpbiB1
cHBlcmNhc2UgaGVyZQ0KDQpSZWdhcmRzLA0KU3VyYWogS2FuZHBhbA0KDQo+ICsJaWYgKHJldCA8
IDAgJiYgYXJnLT5yZXNlcnZlZCkgew0KPiArCQlpZiAoY29weV90b191c2VyKGVycm9yX2NvZGVf
cHRyLCAmc3RhdGUtPmVycm9yX2NvZGUsDQo+ICsJCQkJIHNpemVvZihzdGF0ZS0+ZXJyb3JfY29k
ZSkpKQ0KPiArCQkJcmV0dXJuIC1FRkFVTFQ7DQo+ICsJfQ0KPiArDQo+ICAJaWYgKG51bV9mZW5j
ZXMpDQo+ICAJCWNvbXBsZXRlX3NpZ25hbGluZyhkZXYsIHN0YXRlLCBmZW5jZV9zdGF0ZSwgbnVt
X2ZlbmNlcywgIXJldCk7DQo+IA0KPiANCj4gLS0NCj4gMi4yNS4xDQoNCg==

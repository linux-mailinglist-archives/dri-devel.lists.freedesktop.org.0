Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 404F99B11DE
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 23:51:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B5A210EB89;
	Fri, 25 Oct 2024 21:51:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E2jEkX1v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B75810EB89;
 Fri, 25 Oct 2024 21:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729893069; x=1761429069;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=gO0LvjUua6S62XJgIlioVb9aEnjmlOSXeHNkenlw+X8=;
 b=E2jEkX1vXd8Vl1Ci/Wwp397I5nKHQjKc5SMEqm4Np7jF9Cc4qvL/JDfK
 8WAb6GCxYYSRQw5TD8yLFfdsGcans3bu9rdPHy3S2tXRtXAJNeWGfvh6V
 tNXfkaLM7Sjw35dW5+pMhEn7tjzhev2GjKdG9xXeDDNPkzDpaQWbKIl0f
 4qdG7zqHpOUd4L7ybWDkMwu19MvbPmeQ9VT7wM98jrssnuTwpFzJG6pBv
 1Okz+an63oDuHxnfpMYRoMNVjWNZITBCoVtCwGbIRfOReOprzrcHgNrnE
 vFWE8z4csq10w/Jpou+meqsb7FYfpKgqSZkcn9g1yQFqGJFanNT/wkVPJ A==;
X-CSE-ConnectionGUID: jIqBgrHSTNuiAh3BeXnWYg==
X-CSE-MsgGUID: p6t3wLWRS9+8K/Iifc+B4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="29683392"
X-IronPort-AV: E=Sophos;i="6.11,233,1725346800"; d="scan'208";a="29683392"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 14:51:08 -0700
X-CSE-ConnectionGUID: JpRVv2PYT1SEzJq6WMWfeA==
X-CSE-MsgGUID: zyPzq2r1T2eatpfsZu6EJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,233,1725346800"; d="scan'208";a="81492860"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Oct 2024 14:51:08 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 25 Oct 2024 14:51:07 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 25 Oct 2024 14:51:07 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 25 Oct 2024 14:51:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zIaPtggEJsoOgF2fCXpaop6HmO0aC4yCtSEsPyaCADCGQVfGfJ1FcUtoMSF3dEEYa+y4UJFIjeS8/fuolZpRZlJk9WN8sVdV9XDzknbpBWZjAsPBF2PcVv0i7qB0+j4aTX8pHMt7lR6T7VLCYLWDfSFCT7EsgmppEEkk3Lzcp7S/wF95jh/d3XdYQOFxdPY3AnOb2zHljyoxRybUkpC7hFVAZw9RPftGD6XYV4xZZBxC4pP7Mq4lVOyT0KoKcB8bvP2KiRYOV6T/bLZcLEpM1/2OR5geeF1XdJPguf7dymekEXjqNgNe3sD7AtyIpMufFHCiCvQsmZTBhF2+dKi6pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rxHJttmjn7E6Myjzq3+TueUpYOqq6Ozmnw7CozqMA8Y=;
 b=upF1qqP2QW4dlSl0MyLIZGFNUQLwox1xvht6bLuyvOPSKFmW1FFaOmBJlY/LJn9L/L1B1/4Uq9ZMtQJCwdeQe9OJEaPuV6kZkYxNNpVf+SSZKFCXK1NN8zkI4s7V0oLI48nPJzQacngydX9FeBwa31xYWgsQSI77VtcJrH6V6OY+wydon9hfKfbc2Tt6jOVPPiQ4AQ33EroJCS9XY7zAeixfygPBQyoNxZXrm/SgsfiFuAy2f3nkvHMjuUp9kpbL2sRElG5Y+YWyC3boWIjhTWElYK77o2AtUwTTngHpKmBNCXhfVB5x7x62DHE1W8HwYJ3KMeUlJFQGarTgek3OFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DS0PR11MB7682.namprd11.prod.outlook.com (2603:10b6:8:dc::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8093.21; Fri, 25 Oct 2024 21:51:05 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.8093.018; Fri, 25 Oct 2024
 21:51:05 +0000
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
Subject: [PATCH v4 1/7] PCI/IOV: Restore VF resizable BAR state after reset
Date: Fri, 25 Oct 2024 23:50:32 +0200
Message-ID: <20241025215038.3125626-2-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241025215038.3125626-1-michal.winiarski@intel.com>
References: <20241025215038.3125626-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0012.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:1::7)
 To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DS0PR11MB7682:EE_
X-MS-Office365-Filtering-Correlation-Id: 87a0a3e0-998c-449f-8c04-08dcf53f200c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YytmTXI5empqdzk5cFZuSm02aHQ0NkthWEFoU09FQXNpNUZieXBsTTFsNG1C?=
 =?utf-8?B?cDVEaXBhTy9EUWdYcHpQVzA3VUFRWnI1NnlIOVNlM0lWeE9LQkc5TVI0eUVk?=
 =?utf-8?B?T3Y0a0lGdnlMWWFHdE5oZzdKcENoQXIxVXFKT1FESXRQNHpkZ0Fuc1A4dHJ1?=
 =?utf-8?B?T3lnWnNqMHhUbklZTVFpUkVqMmxjbWN0OHV3c1FxR3NNbWgyeTVlS3dUUDJE?=
 =?utf-8?B?Y01kS01NMGdYaW5HUldYcXhpc0FoZXV6aS9Ib01hV2dmNzhuSmI3a3o2Z3Vl?=
 =?utf-8?B?dXRHeWJ6K3UvUG5PWFkzaWNEdVdWeStnaFAzNGVYcG1NMkRXNVM2OS9hZXA1?=
 =?utf-8?B?TFlVTUxHa3F6Y1psUXQvc09RWHRkWkFINTFicUorMTdmaUNxSnZIVUJOZU1F?=
 =?utf-8?B?MTNZOWNkakJoUi9rc3orR1k3dlhEQUN4STQ4UWk2ay8wS2VSd3ZEaUNDRHhh?=
 =?utf-8?B?Q09hRjd0NmRIdFI3Mmk1VDdacEVsTk1DRWpGOEtzVUtKaFByYXhvOWd3Szly?=
 =?utf-8?B?VElPNGNXNFlMdCt1MFIrSXdNYTJmUHdLbEhBb0paQ20vcE9Nb3hmUGRZSUk4?=
 =?utf-8?B?K3p4Sm1KTWRGNkpwRHp1aTc2ck1SRlpaY0NRakEyeGo0U2VvZWlYZzZtdEhz?=
 =?utf-8?B?MG45TFdtUGtQMm10Lyt5ZG1iL3BBNm1LRDNpTTlNNTUxNUFDNUhGeWIyaWhE?=
 =?utf-8?B?ayswK29ZUjlneVphVFNVeFFVeWZRdGhvMkwyS29WRzhrSGdkaVFJaXUwaytU?=
 =?utf-8?B?ek1IRS9RUS96L3VrSmNGMmF3RkdWQWczM0psa1F4MTJ1bTRaYjNiV0xvTkRv?=
 =?utf-8?B?WjV6aFR6ZVFxNkJkL2ltK2VhRGpGZEFOZVgrVlgyNUNaQ3lyaGZGdmkyYnBl?=
 =?utf-8?B?MVMrVXF5MGFUT0VhRkd2b0wzWS9sa09HcWxXVTI0Rkc5RmVZeGxHd2xwdXJs?=
 =?utf-8?B?emZzSUFTeVh4QWlUZnRRSXlGdGtBVVNhYld1K01COEVleEZkY2pwV0MyVTRy?=
 =?utf-8?B?Zm9PVDRFYzhOTWh6NHVUNFNYM1lCakJFelRqWU4zNEpQYnhuZWU2YmxkRHhS?=
 =?utf-8?B?cDB5UkJiQ25aQ1pYSlRwU0tta0ZXUmNYK1FmOUQrMXBiTy9uSUYwcWJ1QWxa?=
 =?utf-8?B?VUhwQVp1ZGc0UFhFM2E0V2RBc2N5Q1ptTENPUEM1WDJJcktGRzZmODlTaEJk?=
 =?utf-8?B?enJ3NDhmckwrOVVmNFNmeThIV0JORFMwNm9QSld1YjcwQlRUZ0ZVK2E5eWNO?=
 =?utf-8?B?czBlMmdzNXNlbzBrVEcxNFpJSjQ3ZUxvdHFwR3oyekVjekNwcGJ4OTQ5Tm1H?=
 =?utf-8?B?d2lhb2MzakRtdElCSnZGenNBZG5NdzB2L251SzdTd3V4dkZGNFVVTlU5NGl6?=
 =?utf-8?B?ZzZPZGdveFhNV2w0TERidGdRTGZETFJHbi9Md3QxTnZmRjlGWVRjK1JHQVZK?=
 =?utf-8?B?cVlhR21aa1Rjak5kQ21tcExieFlFOGJBVGdzVHYxUkdOQzVYeWlZcDRGSW5m?=
 =?utf-8?B?Y1hQT1NxZE9FVDkyMDN0czVaOU1Jd2p4YWdaWVdCZ3U2a1J6QXBCaCtPYUVG?=
 =?utf-8?B?VmRRK0Z4RTBZaVRLTG92NjBiMDB5Mm5HUmEvMk9XZFpGb09jTkRZV2tNSml5?=
 =?utf-8?B?ZWtzNEZoM0VNZTBnN3VKQzRZOWt6NXd0dENqU0lwaC9PUzJkS2xXVlJEL012?=
 =?utf-8?B?UWw4cHMzUzNCQ0Vnb0lTQjdqNUZhUVBkQkNtdGZRbmNlMXRSUmtzbk9EVXlN?=
 =?utf-8?Q?BHJ5SxpCVmaPUJ6XpnL0cbADhTpXa7YdEZdcbO2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUt2NWhSeWptOEh3ZEZDY3JKeWZCbWFYNU9hWnFZQWFyemxybnlwakViOUEv?=
 =?utf-8?B?bWM2QXJFbThrQ1B0QmxlMnNPeGVNRjN3ZFhqVFoxUU14VWF3WEtWRXBRd2F5?=
 =?utf-8?B?LzMvVHVOQVlBUzNIaXdUOWRTNGM2VCsrOHVPN0k0VTlZS25VRmdFaHI4NHVI?=
 =?utf-8?B?QWhuYzcwdWZXRXNtNHRjUVdyNXJYNnlQNkhQVGZ1ZW1wMGR4VE5zS2V1WFM4?=
 =?utf-8?B?UHFjWmx6cmhpTGdsdTM2YVl4VmpFUTVNSk1WRTJnNGI3SkdmakcyVlhTVEN6?=
 =?utf-8?B?L0hiZ0ZndjVNOU1ZbVNRU0x5TytNOWpCRkxmK0ZEcnh0OFMwWVBuaWk0TmJM?=
 =?utf-8?B?TjNRRW92RGpwckN2enFPL0E5NEpZRXdIRGdTa0ZTWkFhV0kwYjF4dC9rM0ZJ?=
 =?utf-8?B?NHdwNUI2Vm0veDhGYWhlZkZVdWhqQm5oWVAwK3ljVUtyMmdWMUxjdnltVlhF?=
 =?utf-8?B?SnZPL0ovSDl0bnFLelcvVFlleXBkQlN4U2UreUk2cCttSmUwcll1NDc2VEpt?=
 =?utf-8?B?ODliaWxJQmx1OXhpTjZwMjlmbjhDUTIyZUMyVWg0WFlnQUlDSC9hTE44NlBl?=
 =?utf-8?B?bDd1R1RlYkNqaHBxSjdwQzAwcWpFR1BJb0RtNTlzM05tN1hrS0FRZkNHeTc4?=
 =?utf-8?B?aVl1NENqNjM0bFVSK1YzVkFSMlZrVlNma1d0Vm95QUpzclBkcXMwK0F3bHFz?=
 =?utf-8?B?alMveXdkN1hyZnJkWEdIZWxzckk1MW9xSFZKbWJkbGJFYkJaSW1XcXkyV1ht?=
 =?utf-8?B?OTJPakpOQkFZZkU1YUdmTGpnQ1BkaTI2MEJwU01BSk1oMjk3Wktua3pnRzhF?=
 =?utf-8?B?RTZKK1pmUlpwSStwUEVMN0Z1aVJKT2tYRTFFNjVTVzR3T0dHREg4MHBvYlht?=
 =?utf-8?B?SVVHaFlWNHBNcks3UVBWZlpraUhaN2RsMTRVQy9UUERkR3NVa1V5Rkg4Y0JG?=
 =?utf-8?B?T3NPRk5lUXFCcmtMcUlMS1o1aFNENk1xaXhKb0xSNzVOa0Y1SkpVMFVrekF5?=
 =?utf-8?B?REcxOVRudjVmeFFFL2xuV0F5UFZJdVZzaUMwRktaQ1JsOHZuY0pZTzRWay9s?=
 =?utf-8?B?MVViVDhXdTRsYlJoaUlYcnRkaUhmaGMxNHVhNDNHSFUyNmhFSVhvdkIxVDNo?=
 =?utf-8?B?ekJVbUxLY3pMQUl3QmhNajRDTWtRQmYxR3U4NFlXM0Y1a3hXQ2N3aUttMnhx?=
 =?utf-8?B?ZW90dU5hZUR0L3h3RlR4QWEyYmIzY1ZxWEFUR1I4OTJSZWNvajBXR1RDYzVH?=
 =?utf-8?B?T01GU2xjZ2Uwb0NROUJRRU4vVXB4emFBM1FyeHJidnZ5L2ZpbnpqVjJpVHlP?=
 =?utf-8?B?KysrdkpLQ2hFMm5SME5GL0E1RFZpeUFwczhaU0o1bmdrdmZWRHNyYUtubnJn?=
 =?utf-8?B?L3RWR3lOQkJkWWtmRU5UaXpCTEQ4bzhRak1NREI1bVB6Ylg1bjZld0V4aG9s?=
 =?utf-8?B?SjNVUmJyTFJhTk9QVU1OMjY2NWJqRmFTKzdFcG8xdXVrYXpudTR6UTA5T244?=
 =?utf-8?B?QndQdTBneGJOaVFEQmdZSUllMU9Va1k3K2FpRTFqY294MEdULzk0TWJLZnBY?=
 =?utf-8?B?VG1saGNndHVEeDJydmlIWC84bHQ0a1pkdVJqS3Fkc045MHI3ZENOSUlBQVVn?=
 =?utf-8?B?MDdkNEtqZGc5dGZsRkwyUDg4VlREUDJuZi9iTWNyNDlsWFZjYzZKZG9xaDU0?=
 =?utf-8?B?K2o2R09nR2xrT2JCUGlaRDlQNTh2SngzRmxYeFppVmtISmRtTFBiWGZDY2tn?=
 =?utf-8?B?aWU5YzkzQUtVMEpkSUIyQkdtVkRZY1dlQXhnKzcxdVBFTkRlNWQ4L2lURHBo?=
 =?utf-8?B?UG44YVlsVVkvTDFpUWJUd3QvVDFNaXVrS3YwUHJVTndRZHJGTm5PNnh1N3o5?=
 =?utf-8?B?eldROUdDWU05VmpUOTJFSzh4U3d4Z0ZqSXhSeE5hZXlPQnJGRUhPMzZkY2g3?=
 =?utf-8?B?T1RaYjB1d3NyMm9udGNCeUpwbkxPMU94ZTlURTRYWUFoNlFaM0hmRW9ldlFT?=
 =?utf-8?B?N1BFUmhPSWJkTnZiVjR6eFFTL2QwNVlpR1RWUC9TQTVjT2QxQllKTlNWNnps?=
 =?utf-8?B?cWdTc01DV3hwVHhlY2tWek9sb0pCdTdCYkVOOXJpcmVTSmZzSytBQ2xRRjcw?=
 =?utf-8?B?UythYW56NmZwSjFlVEZPdUFraVY0c2RmcUxqTXNSNXNKWTZjbjlpNzloZlF5?=
 =?utf-8?B?Znc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 87a0a3e0-998c-449f-8c04-08dcf53f200c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 21:51:05.0689 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rlqrkr1UVhT8C748GdR5513UtX2aRGNX5daPLMK8YKgmVEBksqwH9pBHIAw4eBYXKy8SNHEwyOMHf0NeHjS3m61tJUJPdp7jZl7/Sc7EbE0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7682
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

Similar to regular resizable BAR, VF BAR can also be resized, e.g. by
the system firmware or the PCI subsystem itself.

Add the capability ID and restore it as a part of IOV state.

See PCIe r4.0, sec 9.3.7.4.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/pci/iov.c             | 29 ++++++++++++++++++++++++++++-
 include/uapi/linux/pci_regs.h |  1 +
 2 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
index aaa33e8dc4c97..6bdc9950b9787 100644
--- a/drivers/pci/iov.c
+++ b/drivers/pci/iov.c
@@ -7,6 +7,7 @@
  * Copyright (C) 2009 Intel Corporation, Yu Zhao <yu.zhao@intel.com>
  */
 
+#include <linux/bitfield.h>
 #include <linux/pci.h>
 #include <linux/slab.h>
 #include <linux/export.h>
@@ -862,6 +863,30 @@ static void sriov_release(struct pci_dev *dev)
 	dev->sriov = NULL;
 }
 
+static void sriov_restore_vf_rebar_state(struct pci_dev *dev)
+{
+	unsigned int pos, nbars, i;
+	u32 ctrl;
+
+	pos = pci_find_ext_capability(dev, PCI_EXT_CAP_ID_VF_REBAR);
+	if (!pos)
+		return;
+
+	pci_read_config_dword(dev, pos + PCI_REBAR_CTRL, &ctrl);
+	nbars = FIELD_GET(PCI_REBAR_CTRL_NBAR_MASK, ctrl);
+
+	for (i = 0; i < nbars; i++, pos += 8) {
+		int bar_idx, size;
+
+		pci_read_config_dword(dev, pos + PCI_REBAR_CTRL, &ctrl);
+		bar_idx = FIELD_GET(PCI_REBAR_CTRL_BAR_IDX, ctrl);
+		size = pci_rebar_bytes_to_size(dev->sriov->barsz[bar_idx]);
+		ctrl &= ~PCI_REBAR_CTRL_BAR_SIZE;
+		ctrl |= FIELD_PREP(PCI_REBAR_CTRL_BAR_SIZE, size);
+		pci_write_config_dword(dev, pos + PCI_REBAR_CTRL, ctrl);
+	}
+}
+
 static void sriov_restore_state(struct pci_dev *dev)
 {
 	int i;
@@ -1021,8 +1046,10 @@ resource_size_t pci_sriov_resource_alignment(struct pci_dev *dev, int resno)
  */
 void pci_restore_iov_state(struct pci_dev *dev)
 {
-	if (dev->is_physfn)
+	if (dev->is_physfn) {
+		sriov_restore_vf_rebar_state(dev);
 		sriov_restore_state(dev);
+	}
 }
 
 /**
diff --git a/include/uapi/linux/pci_regs.h b/include/uapi/linux/pci_regs.h
index 12323b3334a9c..a0cf701c4c3af 100644
--- a/include/uapi/linux/pci_regs.h
+++ b/include/uapi/linux/pci_regs.h
@@ -740,6 +740,7 @@
 #define PCI_EXT_CAP_ID_L1SS	0x1E	/* L1 PM Substates */
 #define PCI_EXT_CAP_ID_PTM	0x1F	/* Precision Time Measurement */
 #define PCI_EXT_CAP_ID_DVSEC	0x23	/* Designated Vendor-Specific */
+#define PCI_EXT_CAP_ID_VF_REBAR 0x24	/* VF Resizable BAR */
 #define PCI_EXT_CAP_ID_DLF	0x25	/* Data Link Feature */
 #define PCI_EXT_CAP_ID_PL_16GT	0x26	/* Physical Layer 16.0 GT/s */
 #define PCI_EXT_CAP_ID_NPEM	0x29	/* Native PCIe Enclosure Management */
-- 
2.47.0


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4319C5A98
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2024 15:40:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB54010E5F9;
	Tue, 12 Nov 2024 14:40:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KkFZg5hq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5C6910E5F8;
 Tue, 12 Nov 2024 14:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731422434; x=1762958434;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=U/NnJYkkyq4GnYM3S0yTzOPYxRmuFKrTw5uwLXIkDWc=;
 b=KkFZg5hqN+zT1ITxGSldhdshF068HUy69A3g3bhcs4/XClhVm/OmnkBn
 Fh+DzgZff1AjlsUIYgune0vQkYKbnJdz+hn0vOl5jn6zGNqhcAAf9HuRq
 LSezB4Qrq1hXFhd+VOO/jSmp5xYEs2oBvipGjj5fPZfktHbmodVPJObSe
 JSVlK6bV/1/OWn3F4BHVeT0AfR6S+BZSGo65mPwihUm28kK7cLn6DEZE8
 vh6I1AEEN6hcybZu88OkySXsaH/UKceDcv2JyPRQmh9Z8dQtpxaunl8ew
 MhcKrr+/GDdUjlBO4PjgEJgh7jNbS6kr09dIHaQ1TKjBkSjo//h8eweq6 w==;
X-CSE-ConnectionGUID: E9mDNw2XQnqvthVEDqqRdQ==
X-CSE-MsgGUID: A1Ko1EeRSROuLsldJmhPrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="31133077"
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; d="scan'208";a="31133077"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 06:40:33 -0800
X-CSE-ConnectionGUID: hDpQ8TD6ROSlDv0VzAftcQ==
X-CSE-MsgGUID: XQAKLTm8TE6Xrhm1BQbgjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; d="scan'208";a="87081794"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Nov 2024 06:40:33 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 12 Nov 2024 06:40:32 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 12 Nov 2024 06:40:32 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 12 Nov 2024 06:40:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jJteQp251kLvvi0IxhKpfXW4VHf0iPgdEFhTRCyW8bvkNiH/gNtDPoBBsyVlga9dgoYv5VuJn3Y0zxP9b9gSRcYnjQEwImRTi2yZFZbCnySLxrK/SOVmCH+Kzf1NtBQqjDAJA6Jy/GsiqEAnmkjXnsaiXIkERf6YOXvwFvp+J/C6Y5gQkTq9khkZsICREPyrUf1XvKL98nFxTNFI4vGaJFfnKAmuUT5n0QJVjwDJFekERYHpK4mHwhHXMf0qlVDuraSIgNFhsEoV91FaFi8RbMWUR8LVwSpOckGUQqB3FshRaxYsfx3p/iDpcghQEm6PhkfeFo1CNgs74olxV3KWFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pNNzoKsGFD7KS4yHcwa3OL2/XyEFk1O4On7iR1S1Db8=;
 b=WGoL87zqlskRT7XQcVwRmbnpf+QQO85ivcrIoCV8FZe4HYcyiCFVxov2ki+lBYVfSCqU0XUKekpWapfdlJx+gPcBl50PnNnDPKciti4gwEY8irIJvzKtaos2wLieTD422jiAjw+QI6AB+ot1ULpyEbXITcByYznLW9GLZEn6QwPN9mgCsUGrvWzJwAmf4u1vqmDYKroYhWEF+xmZHhfEDSrzGupmUFY2Exr0Tzi8HgSj2yg0GneqFoKv11eLEVwB1Kg2zBXJLQ+M2f9hTKSUSyr+BKclQXJzarHLNMv2aTummTIQyQRuNlQ/QKegOYUBsSTHOzLQQQfN8mORUvEwJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 IA1PR11MB6074.namprd11.prod.outlook.com (2603:10b6:208:3d6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Tue, 12 Nov
 2024 14:40:28 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.8137.027; Tue, 12 Nov 2024
 14:40:24 +0000
Date: Tue, 12 Nov 2024 15:40:20 +0100
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
CC: <linux-pci@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>,
 "Bjorn Helgaas" <bhelgaas@google.com>, Christian =?utf-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=
 <kw@linux.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Matt Roper
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH v4 3/7] PCI: Add a helper to convert between standard and
 IOV resources
Message-ID: <sygr6xfthxts6fuuz3ueod7r5ygolyim2wtj73yoqcqcxvy57x@fcupjtp2yygs>
References: <20241025215038.3125626-1-michal.winiarski@intel.com>
 <20241025215038.3125626-4-michal.winiarski@intel.com>
 <10b4f173-619a-9913-99de-5d08b3fc854c@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <10b4f173-619a-9913-99de-5d08b3fc854c@linux.intel.com>
X-ClientProxiedBy: BE1P281CA0416.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:83::20) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|IA1PR11MB6074:EE_
X-MS-Office365-Filtering-Correlation-Id: d3bd7abb-7516-44d8-32e4-08dd0327f0f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VkdNakFrS0hSRXFyWUJMYU90Q2tJV1NIRzd6bVNHTU1xSkhCbVdoSDRRYXI3?=
 =?utf-8?B?bFJ6ajhRZEpMMFdKTHhvUnAyNldNUU1jNHJNSXNoMnptQi83MHk4Zk4vcUR3?=
 =?utf-8?B?SlUrSjVFeUhxUm9JNXFWczZqUHNnUk1yQ1djUklJZUNKdW03aDl5WVZTYnhG?=
 =?utf-8?B?ZTNGbUZVbzVGTHFLRHhqK0RxWlN4dmFzQnIyTExQeFRsSitraEd6RldZeVFS?=
 =?utf-8?B?VHdMTmlqb0w5UlJWZUtqZ0tESG91MWJ0WTZkckRJTjlGdWczcEw1VUxCNWRx?=
 =?utf-8?B?dXRVQjE2eEtTNHlvRGVHTEFHNktNT2c0NGZXZDAvUXdCTGZPczRTRk54QkJC?=
 =?utf-8?B?MjRzeG1xYSt1LzU1Y3RDK2dXNUN3dUoxZHRDc1J1em5qYlJ2TmQwemhNZFR6?=
 =?utf-8?B?Tm9iWU1iWWFoOUc0K045ZW9zeHhNZHQydkhMZlRsV1o4YkJQSVFKV1VqZk15?=
 =?utf-8?B?b2huamJuck9aYnltZ2JGeG00TnR4N01qY25vRmd1ZXpvOHJlc3dXRXpWOWF6?=
 =?utf-8?B?a0pzYjlNUXEzczRPdDFmNTZaM1kvQ3AxVVNueFpKV1lCMHZiRlQ0MlNvb3A0?=
 =?utf-8?B?M25yemdoS0NvUm10dmxHaUhnY0pEMXFmMHgvSmhDQisxYmpuOVBuWllZS29M?=
 =?utf-8?B?Vm1HK0ZsUmlSajhGK09LK1NTY05QbTNSNEVpL2J2MkoxQW1Idy9IUzhTUGlK?=
 =?utf-8?B?QnNJWHIrTEJLMFhHRzcrVmFtdzArTXlCelUwOEdGR05xQ1ZJaU5haUFIemto?=
 =?utf-8?B?cEtPSFUwdFhvdktiYitHbmxMbHUweFdja3B1SVA4VmpNVk45Z2JEWkhacHZr?=
 =?utf-8?B?bW1zU2VmWWdkRXVUc0NRcnh1Ry85YWUyOXFKaWQyamVhSC9KZWNBbSt1ZVJY?=
 =?utf-8?B?bEova3RvalhkUHZIN0FNc1poSklFMUdCVWtDQlprTEkwS0R1TkM0M1hnVktT?=
 =?utf-8?B?RmNWdVM2MlBBbER1ZmNtSlQxSk9PQnpxaGMvSWcrTjJFblBXZ25aT3NlMGxK?=
 =?utf-8?B?N1AvQmdlcjNUZTJPL3BpU1p2eWVTS2pIeVF1SXo4OVBVdG5PbDM5VXl6a2lS?=
 =?utf-8?B?elpvdmR1dmRrUGcxaFk0KzZSY3lNenUwMTdhMUs3N2IzNk8xSFIvbUpCRmFI?=
 =?utf-8?B?eG0rWmpqRC9IR1RjelU3cUM2c2U2OUhTRXozekhQVTlCSjNyWkwxK25XL1Rt?=
 =?utf-8?B?WWloNk0zRXpwSEVHQ1F5cDMvZW8rczArU2xNclZJZWwxODZqYm1WR1ZTUmlv?=
 =?utf-8?B?czhDbklmV2ZLV2RDbjhHdldYcDE0NFFaSkRDV05UWXBMS1JiaEZmMThVMjdq?=
 =?utf-8?B?OWdRUllRYzhxUlE3eUF3V1lPWktINkZaYlF1akhRczF3OWE4R3gweXFYdTNa?=
 =?utf-8?B?eHIwRzl2czdkMG85SDFBdWxiS1RzVmN2clVaUDNoRXRMQ2t4blAwR2x2aHFY?=
 =?utf-8?B?VXcvR1pWWEQvYm11aXRkM1lEYm5PL0t2blg5SFIrM0VGSmJhS0Y1WFlkRjN1?=
 =?utf-8?B?SFNEcmo3aXJ0Y1V5cG5lbjBZRUhqQUcwM1hicHlMem5RUitjQ0p0QWVqclg2?=
 =?utf-8?B?ZVFIT2FRN2hQbDZsb3NrQmNyT1BxOEVENUk2Yy9MZmcwTGZKcGkrTnFObUtD?=
 =?utf-8?B?Qyt6NkJKUFRHa1dsSDAxUmwzTklwTmlJQWJwT2dNaWJsZXRTdmphNktOUk5L?=
 =?utf-8?B?Q0JHRm5Rc01lTDQ4eG8veU12VW5lT0pIdldjS21La1B5bFdmeGtjaVpyNzlX?=
 =?utf-8?Q?XRjYoRKu0sy8UTlj38OscBrOmxaSHcYSWNfG/d+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SmtzalBLQ1VvbUIwNldMTk5hZ0V6WEJVRjErcnlGc0J0ZGZla2tIL2k0d0tM?=
 =?utf-8?B?RHFSS010VEZxTzBGRkljMnVjSjNsZmZNNEpXUzRVenBwdWdueW9KSjVJbjBw?=
 =?utf-8?B?dmQwSTFnMG9reEtSTC9kaitjcUxIZXk5UVpwcmRpSVJvYzJtMHByYWdFL0lw?=
 =?utf-8?B?WFQzQWFTalNPUzQvOXVkeUtvQktTQXhWUHl6b001cy9reVE3RU1PUEdQbjNJ?=
 =?utf-8?B?TnhkOUVpMGx6cFI2SUMyWlN4MVRER25NOGU0TEM5bU9kRThTYnhMbTlHenl3?=
 =?utf-8?B?ckZ4UzRGd3pvNEl0ckVMMXdIL01haWtNemdHSDF1ODNWdnFpNDNmQ0czdTNi?=
 =?utf-8?B?Y0tmbEZqcFJZeDdGenJtbUdGZitLNlZBK1BpMGl2eHRYSWhKaHphclJEVmts?=
 =?utf-8?B?dkxXQzEyYjhYYTRtRUpEbWp5WEN2WnZWZFNWaGtCTVk3dzVXVGhQcm90TEIz?=
 =?utf-8?B?eUl1TGh4VkVkcVlxcHVLQWJCZzkva3p6ZlVsWUpaVEt1blVvZVNuOTdqV2k1?=
 =?utf-8?B?Z29nMUxBc3pva0Y1OU1nVU1hZGJZSTdEbHVIVDJ2dzc3aGtYanI5ZVVXL1N4?=
 =?utf-8?B?ZDdMem1aeVNIMlRWVHFGeHZGTzRZdnNlT0JoRWgzMjVHVWZ3RTgxbzE2cHpj?=
 =?utf-8?B?dnNJcm95MytwRWN4VFYxYnZ2VElGdmFVdU5HaE1Jbk9nSncxZ0JLZHc4ZU9q?=
 =?utf-8?B?aGtETkdOSElQeUd2SDM5b0VEWWtlaWdWc05lVnhSMUUrUm9WWWlNYWhlSys3?=
 =?utf-8?B?TTRMSkY3cEFlcFUzeklQN2xzMTVjdlpndFpHaDE1cDdhR09jVmtPbnlyZnB2?=
 =?utf-8?B?ZmRuVjBHTDM0MHYzekNtcVdZdXUxUmJzVlI3N2VQRHN1UVMyaC8rRk1uSnV2?=
 =?utf-8?B?cUhzZEVFWnZMaHFwL2FORUFOOWZqUVRmSEZ2NjF3TWx4RWdFNFNyRWx6Vi9B?=
 =?utf-8?B?K2VZUTZSNXg1Tkc2V3ZieE5mbjAvNU9rRHRnTW02Mm9oZ3lFL1NtSHdjc2s3?=
 =?utf-8?B?WFpaelJOZENwZW5UK1h4YmZtaVltRzFrUTFuWEhmaU9nNTRxSjA2cTR3VFYy?=
 =?utf-8?B?K3FJNWdWWDlxajFqS1NEMXNGd01wSEd1K1RXWGFZNE9MNmJmS3BiaHdpQ1Fj?=
 =?utf-8?B?dm5zbU1WZlFXakNPVCtZb2JWRHBuTDhzeXFsMjhsSGtLS3RZT2VjcW1nWFdR?=
 =?utf-8?B?amdtNUFDNzNNT2QwMGdZMFN3RXhXQkV2cW9NNHNrQndWQUM2SnNLMVZvQUZX?=
 =?utf-8?B?QkNONTEyN3RGUDZLdk80S1hWckowZlhVanI0M2l4bzdNTkMyOVJmM1FJVm5a?=
 =?utf-8?B?bWc5L2xvUXEyODlpSmRiWU1iWVJXaVJ2OVVjWVdBS21LWVNYWVVHTXd4UkhV?=
 =?utf-8?B?V1E2NG1NcUNURjhMODRGdXp5MndWUUlZRzZYRGpQLzZuWUdWa1FobXQ0MFov?=
 =?utf-8?B?WkFmc0lCSzhFQUt2eE5GS21MdUtPRjhsMVNnL3FaSkdEdVByK2hBSlJ3NjVH?=
 =?utf-8?B?WFBzbHlnOHRvSW5pclFLSFdwK3VtVnZ6bDhXaWpjMmFvalFqUXczSnVobW5o?=
 =?utf-8?B?dXNZUlNwcDRxbDNHdjgwalpCZWJsZzZ0MmVrdDlzRThkVG5HTnVUQmViWUJ6?=
 =?utf-8?B?VXN3MnhhNCtTSFlxY1Z6MEhNNXV4T2E5MGdxaEFhSmRORzBDaGRlSHZPQitB?=
 =?utf-8?B?eWNabmtnVEIrYldOUjhuWVZUWHM3REJXcjROZW1nZmY5cCsrTHRHL1h5WSsw?=
 =?utf-8?B?c3N5WkdsaXpjeURvL0dEMmdHUUNVeVNDZE4yK2ljM3ZJQzlpbFFsQjMvejFP?=
 =?utf-8?B?U2xBV0VlcHJTaDhBOHFidXA1cGdUT2tMbGtDKzVMU0xaNUpmZmdmdzJXaVFU?=
 =?utf-8?B?MTMreDZmUkhrREhvWDJIL3R3RllTVjJuODJHRjV1OWhES2VrajJ1TitwTjhs?=
 =?utf-8?B?WFNmVG5qajRkcmVPcWovcjBKNXZ3RXhwSTNXUUFOK3g0VmEyczV3ZkZlUzJx?=
 =?utf-8?B?ejdNRkNmbGRhSW13RmlrWnBPU1hObHNIdXhqZ1cwWTBSVENkQlNVVWxpSGpF?=
 =?utf-8?B?Y2FpdHo0czhkdzJjOGh0NXEwZk92Q0gwWENmVHpjOGF3RlJaREIzR0NGVEpL?=
 =?utf-8?B?N1hQdVlVaW5mUXRabkRBall4NzZoQUpvMTNxNk9VU3hkQ1NBZlZxVm5vdDk5?=
 =?utf-8?B?R1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d3bd7abb-7516-44d8-32e4-08dd0327f0f9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 14:40:23.9418 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZiVhRq1IIGdyWn41F6oKEzse0lAqQ+wL3SZLgha0nJleRBBMYyLJt1zbbxoDLST6fsXqtglvDURZt6X7BjIhCwxiVEm01PeCuYzWZGmgNuE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6074
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

On Wed, Nov 06, 2024 at 04:22:11PM +0200, Ilpo Järvinen wrote:
> On Fri, 25 Oct 2024, Michał Winiarski wrote:
> 
> > There are multiple places where conversions between IOV resources and
> > standard resources are done.
> > 
> > Extract the logic to pci_resource_to_iov() and pci_resource_from_iov()
> > helpers.
> > 
> > Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > ---
> >  drivers/pci/iov.c       | 20 ++++++++++----------
> >  drivers/pci/pci.h       | 18 ++++++++++++++++++
> >  drivers/pci/setup-bus.c |  2 +-
> >  3 files changed, 29 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
> > index 6bdc9950b9787..eedc1df56c49e 100644
> > --- a/drivers/pci/iov.c
> > +++ b/drivers/pci/iov.c
> > @@ -151,7 +151,7 @@ resource_size_t pci_iov_resource_size(struct pci_dev *dev, int resno)
> >  	if (!dev->is_physfn)
> >  		return 0;
> >  
> > -	return dev->sriov->barsz[resno - PCI_IOV_RESOURCES];
> > +	return dev->sriov->barsz[pci_resource_from_iov(resno)];
> >  }
> >  
> >  static void pci_read_vf_config_common(struct pci_dev *virtfn)
> > @@ -322,12 +322,12 @@ int pci_iov_add_virtfn(struct pci_dev *dev, int id)
> >  	virtfn->multifunction = 0;
> >  
> >  	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
> > -		res = &dev->resource[i + PCI_IOV_RESOURCES];
> > +		res = &dev->resource[pci_resource_to_iov(i)];
> >  		if (!res->parent)
> >  			continue;
> >  		virtfn->resource[i].name = pci_name(virtfn);
> >  		virtfn->resource[i].flags = res->flags;
> > -		size = pci_iov_resource_size(dev, i + PCI_IOV_RESOURCES);
> > +		size = pci_iov_resource_size(dev, pci_resource_to_iov(i));
> >  		virtfn->resource[i].start = res->start + size * id;
> >  		virtfn->resource[i].end = virtfn->resource[i].start + size - 1;
> >  		rc = request_resource(res, &virtfn->resource[i]);
> > @@ -624,8 +624,8 @@ static int sriov_enable(struct pci_dev *dev, int nr_virtfn)
> >  
> >  	nres = 0;
> >  	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
> > -		bars |= (1 << (i + PCI_IOV_RESOURCES));
> > -		res = &dev->resource[i + PCI_IOV_RESOURCES];
> > +		bars |= (1 << pci_resource_to_iov(i));
> > +		res = &dev->resource[pci_resource_to_iov(i)];
> >  		if (res->parent)
> >  			nres++;
> >  	}
> > @@ -786,8 +786,8 @@ static int sriov_init(struct pci_dev *dev, int pos)
> >  
> >  	nres = 0;
> >  	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
> > -		res = &dev->resource[i + PCI_IOV_RESOURCES];
> > -		res_name = pci_resource_name(dev, i + PCI_IOV_RESOURCES);
> > +		res = &dev->resource[pci_resource_to_iov(i)];
> > +		res_name = pci_resource_name(dev, pci_resource_to_iov(i));
> >  
> >  		/*
> >  		 * If it is already FIXED, don't change it, something
> > @@ -844,7 +844,7 @@ static int sriov_init(struct pci_dev *dev, int pos)
> >  	dev->is_physfn = 0;
> >  failed:
> >  	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
> > -		res = &dev->resource[i + PCI_IOV_RESOURCES];
> > +		res = &dev->resource[pci_resource_to_iov(i)];
> >  		res->flags = 0;
> >  	}
> >  
> > @@ -906,7 +906,7 @@ static void sriov_restore_state(struct pci_dev *dev)
> >  	pci_write_config_word(dev, iov->pos + PCI_SRIOV_CTRL, ctrl);
> >  
> >  	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++)
> > -		pci_update_resource(dev, i + PCI_IOV_RESOURCES);
> > +		pci_update_resource(dev, pci_resource_to_iov(i));
> >  
> >  	pci_write_config_dword(dev, iov->pos + PCI_SRIOV_SYS_PGSIZE, iov->pgsz);
> >  	pci_iov_set_numvfs(dev, iov->num_VFs);
> > @@ -972,7 +972,7 @@ void pci_iov_update_resource(struct pci_dev *dev, int resno)
> >  {
> >  	struct pci_sriov *iov = dev->is_physfn ? dev->sriov : NULL;
> >  	struct resource *res = dev->resource + resno;
> > -	int vf_bar = resno - PCI_IOV_RESOURCES;
> > +	int vf_bar = pci_resource_from_iov(resno);
> >  	struct pci_bus_region region;
> >  	u16 cmd;
> >  	u32 new;
> > diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> > index 48d345607e57e..1f8d88f0243b7 100644
> > --- a/drivers/pci/pci.h
> > +++ b/drivers/pci/pci.h
> > @@ -584,6 +584,15 @@ static inline bool pci_resource_is_iov(int resno)
> >  {
> >  	return resno >= PCI_IOV_RESOURCES && resno <= PCI_IOV_RESOURCE_END;
> >  }
> > +static inline int pci_resource_to_iov(int resno)
> > +{
> > +	return resno + PCI_IOV_RESOURCES;
> > +}
> > +
> > +static inline int pci_resource_from_iov(int resno)
> > +{
> > +	return resno - PCI_IOV_RESOURCES;
> > +}
> 
> to/from feels wrong way around for me. What is named as "PCI resource from 
> IOV" converts from PCI resource indexing to IOV compatible indexing, and 
> vice versa.

It converts "from" IOV BAR (resource 7+) to VF BAR (resource 0+).
I don't think swapping the to/from would make it clearer.

I had it as pci_iov_resource_to_vf_bar() / pci_vf_bar_to_iov_resource()
before, but went with a shorter naming instead.
Would that be clearer?
pci_iov_resource_to_vf_bar() / pci_iov_resource_from_vf_bar()?
Or perhaps you have a better suggestion?

> 
> >  extern const struct attribute_group sriov_pf_dev_attr_group;
> >  extern const struct attribute_group sriov_vf_dev_attr_group;
> >  #else
> > @@ -608,6 +617,15 @@ static inline bool pci_resource_is_iov(int resno)
> >  {
> >  	return false;
> >  }
> > +static inline int pci_resource_to_iov(int resno)
> > +{
> > +	return -ENODEV;
> > +}
> > +
> > +static inline int pci_resource_from_iov(int resno)
> > +{
> > +	return -ENODEV;
> > +}
> 
> These seem dangerous as the errors are not checked by the callers. Perhaps 
> put something like BUG_ON(1) there instead as it really is something that 
> should never be called for real if CONFIG_PCI_IOV is not enabled, they are 
> just to make compiler happy without #ifdefs in C code.

I'll add a WARN_ON_ONCE(1) to make it more visible.

-Michał

> 
> -- 
>  i.
> 
> >  #endif /* CONFIG_PCI_IOV */
> >  
> >  #ifdef CONFIG_PCIE_PTM
> > diff --git a/drivers/pci/setup-bus.c b/drivers/pci/setup-bus.c
> > index ba293df10c050..c5ad7c4ad6eb1 100644
> > --- a/drivers/pci/setup-bus.c
> > +++ b/drivers/pci/setup-bus.c
> > @@ -1778,7 +1778,7 @@ static int iov_resources_unassigned(struct pci_dev *dev, void *data)
> >  	bool *unassigned = data;
> >  
> >  	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
> > -		struct resource *r = &dev->resource[i + PCI_IOV_RESOURCES];
> > +		struct resource *r = &dev->resource[pci_resource_to_iov(i)];
> >  		struct pci_bus_region region;
> >  
> >  		/* Not assigned or rejected by kernel? */
> > 


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9568AC4E43
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 14:08:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A4A010E479;
	Tue, 27 May 2025 12:08:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IO5eei4p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8858310E481;
 Tue, 27 May 2025 12:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748347707; x=1779883707;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=5XX+d3fHe4QLhFInVHsvXTy1SfIWSbrGHskllA9YeUg=;
 b=IO5eei4pv19qRd/pavCszS0jyd9hQ5EgW1Gs85abMARb2AWPY4nnG8aP
 7Cxp3fiJJZsiN3pW79CIYwZgCkRkvUGuSXVo/EBahRUfow7jp0V039Ch/
 pbb0bD9gaxbFl9LshEge4PZ8qvhBpJ+cF9zhNPhIRipXQ+ZvXzrNeGx4F
 hl6Z2uULQKdyOaK1I5fG4TCaKscZ4gshw/oAStaEUvaMlOTMADQaYPsVl
 x/1qz0Bd4hP6l6hJei0LPTjTr5WGTQegryxdECK1zwnm2EjqLN9mIhM3H
 GwlBO77LCKZAxXuJFAZBFM8kGNrf/uRlE/2EHf83dqXzHxId03qZdvs3s g==;
X-CSE-ConnectionGUID: rzQjNTQHRQKL1Pj7N8lOLA==
X-CSE-MsgGUID: Qwjn77BWQK6gQEAzd3fm1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="60965486"
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="60965486"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 05:08:26 -0700
X-CSE-ConnectionGUID: UL6FmlXCTsqy5HFOQCiADQ==
X-CSE-MsgGUID: BbsxBsRIQuiZXzveT53hWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="147660680"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 05:08:26 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 27 May 2025 05:08:25 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 27 May 2025 05:08:25 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.72)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 27 May 2025 05:08:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wq0JnrlYzHlet/51M7WqeKnRmnCudJAFkHukRSzFHLyxTfNwxhAfp8nf5KcWjGaoG6jNqHny4WNkK82AjIgIIi48KRyuPllWDDMs+haKygPlWRQ65DpZOUEsMj/16xiEVWN7kUQGYFE9Kc3JelH0/kRHQSA8kkUA6yw2h9013KIZf6IUUaUDmipWTAMOf2rXS8AZ7ItBGIDXJ/3+E0N7HbQlDm/NLyGBYSqIFKoo1HUPsaH8kreicocbgN4dhSMw4lpe8KFGUQK4lLfoW9VwmUNh/jZpf/uCs62xelb9i0WfLm0RCbMGx4/Ec2AxODEc0TiKHojgs8NuJgg0yR5lFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D3yisnENRaQOU2rkhz1qn3jrwnDhw1Reyh/cC+8U3ZI=;
 b=xMwOtcPphqlKzZSEPJAw3shMaWDYBgAMJtl78Mn2E59ojPxEj5WMO9STLWmkqvgKpyCBvGY3zewOL343e0nXqfK5DbEbpTWoDwmZ/Yd97he0jOr9UukKO+ReQhUorLD2yk/ciZ/cCH7XcoqVeyIXNj81efhmae8vgOm4dNkZxmeirZ/OYuOmW8hyhMfRS9bc50Jq4K3VcwDAUMjEczshzmCyGLfj9zNAt1cSZjEPz3Lz6FaC5g+HXGk0zXcrbjbcaAzzIL7QSPsfUo6zEyDGwa5lUPnI6UYJI9ibngv6KT7Bmdfdz13bb6wEQOCdfpCB/tpFru2dd+53ry7M+mqc7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SJ0PR11MB5918.namprd11.prod.outlook.com (2603:10b6:a03:42c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.22; Tue, 27 May
 2025 12:08:18 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.8769.025; Tue, 27 May 2025
 12:08:18 +0000
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
Subject: [PATCH v9 4/6] PCI/IOV: Check that VF BAR fits within the reservation
Date: Tue, 27 May 2025 14:06:35 +0200
Message-ID: <20250527120637.665506-5-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250527120637.665506-1-michal.winiarski@intel.com>
References: <20250527120637.665506-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR08CA0223.eurprd08.prod.outlook.com
 (2603:10a6:802:15::32) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SJ0PR11MB5918:EE_
X-MS-Office365-Filtering-Correlation-Id: 102b00f6-b139-410f-eeb1-08dd9d172ae4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YXhNYVhjeEl0WnRGQkc4dHdueVFkN0FqSGtLMUlZeGRnMW5tenJmM1I4blUv?=
 =?utf-8?B?WE45ZEtoSjBhU1pZRFFFSWZkc3UyaUNXc1c2T3F4OTFQU1Z3c0FUc1BHRi9v?=
 =?utf-8?B?QmdzcEdrVEMxdmZ4OHhPY2V5VFNuOGpKOWlzUld4bmVOd2VzRG5vTmlITFdS?=
 =?utf-8?B?RmorbWp0VkpxVHA3RFNPYmZjQjBHazJJUmYvZXNpcmxZa1p0WTd4KzZLTTdL?=
 =?utf-8?B?Tzk4SmJJbmpNSVJhcjVvVGVBMWcwRmw2L3lUY3JubEVaNWIvekhuRFZxdTNu?=
 =?utf-8?B?VS9BM2NhN0Q1bjJqcnc1QW9LUlBSYmJCTkQrVFhGUWE1Tjd4enZ5M3dOelZG?=
 =?utf-8?B?OHdoZlpmWWMrUnVaZlZwK2FtckROSTRmWEpqYUl2L2NUcWhYTkJjWGpZbFQy?=
 =?utf-8?B?Zm9JRUhhLzNPNkVhT2xUU3dDUGVFK0Fnc0UzQlhMYmIxK3BMUHhRYWcyZTNj?=
 =?utf-8?B?TVY2VXE0MFhNTEsxYnNqRWQ4d05tTXByVkpxeEFtZ2JTRkZQcW1QVGh6YnA2?=
 =?utf-8?B?LzVxUytVK3JhOUN4NlMwYmZtOXk3c1FUUytsei9RckcxekFBYzl6UDd3enlH?=
 =?utf-8?B?SU84WGpWZjVBTTJrcWpRaWFHVFJsYndMSys1c3VYSEpReVJESFZFU1l0dHhJ?=
 =?utf-8?B?VmNGOEViQ2FHQzl5QngxRXU4TkhReDNJRFhGeGxOeTZsaDA0WHBLemFhYy9T?=
 =?utf-8?B?cm0zSEtZQ0h4cDlGUm1BZXlDaWhxbUhqSHlYRVYrUTJZZVNLSldHMzBwbTdU?=
 =?utf-8?B?MHZzUmVXZERnN1kxQjRXZG1UTnRhQnp0NTliSStvY3pUK3QzVXhsRTN5eTN0?=
 =?utf-8?B?ZzhwbFppYzFEck1qeTlQZlBzWnFRQ2dXV0RtajBibWg4NHYwbC9DM1JGeDRL?=
 =?utf-8?B?cHduQ1krK2ZwNzJWMUlqaU5lczdadFlyMGZaOTh4S1V0YXAvZEJtWTYyZmF6?=
 =?utf-8?B?ekpkWGZraTNNTG9JWkJjS0NGTGsvTndrSzRGUCtQeFlGbGxhSHQ2aTc2S2lw?=
 =?utf-8?B?T2lNam4vdkZrUTlVVUg2djVXR29qL0JzN2V4bXd6OTVSdDErZ3B0QTB2S0J2?=
 =?utf-8?B?Zk5UanJTMnJFQVVhUVp5L2ZveEFmSHNpTExXbGJ5N01NRnBoczJGbm83N0Yv?=
 =?utf-8?B?cEQ1bnhicGpQU0t6dHBYSDcxMGlCNzVZMU8xSHRYZDFKR1drM0dLeHZ4cVlD?=
 =?utf-8?B?T0ZXNDlDbnhZV0hRRTN6U21BenlWL2lDdThjWDhRQ21hYmxOZjRzM0NuMDJU?=
 =?utf-8?B?MHNPeklBK1N3MVpJSjVlNXJpc1ZzdzlMRWVudk5QRlZnaVpXSjJDNTc2elFY?=
 =?utf-8?B?bzZEQnA5R1h1QkYxVHpaVnV4bzE5NjdrdGsreXdyTmhhOVoxYlVud3hSbUJU?=
 =?utf-8?B?U296c25nbXZWY3BqKzI4TzZNcm5RTXVQVTNJdHNuMUhucUMvVWY4a2Zjck52?=
 =?utf-8?B?RURyTGJQalJYUHRqVE9KTEwxOGNjQlhOUUNBdWQxMXNzaVlyRm9uMTRTRXJ4?=
 =?utf-8?B?UnFTQmV2Z1ZRT2hRT0wwV2E3K3EwSzhxREFkUDh6OVhpamJ0YXcrRDRFdjdY?=
 =?utf-8?B?a2FVQ1l4SUJZZ2J1TVhUVW5hYk0rY0hJYnlxN2h3Ylc5Rk4yRmVFM3BMbndn?=
 =?utf-8?B?WFdKMUxhY1RFeEVIaDdtOUwzTDRZNHdmZzhINlVHSFhkV3RCTG4rQSsvY09k?=
 =?utf-8?B?dDVZNnRBR24zWEFhWmtFbEU2Z25wSEpNY3pHREF5U05yWFNtZFNtdnpyZXNO?=
 =?utf-8?B?dFB2dThJelBicndHd2tXdlorSjBwT1FDOWU2WXY4UWVJUlVEbmtyMldiRU0x?=
 =?utf-8?B?QUovbW94YzNER0tMeXdjUm80TXBRS0JQcGMzVHhUV3NjSFJHR2h3ZmdBNFJF?=
 =?utf-8?B?dk8xMGhnVUhNMW85WnI5amNndnFFSzhKRitwTWRJWnNCSjBQN1V1NUpLK3Vt?=
 =?utf-8?Q?tTiBAahuHr0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cjlMdDhoQ2Vlb2IzbEVKZmNDWXZQTmE2WHBsczBXNzNISTI1RWIvNjJ3NzBl?=
 =?utf-8?B?Y1QyVnJNb1lPMGNuNHg4QVNFUUhnYUJFSE1QRjdkQXEvbmlIM250TTNHaklD?=
 =?utf-8?B?amZtQjJja2Z0b0svWkFRZ05ZVEZ0TitmNFA5NDZqbEVzNVcvVHpJRGw2Zkgx?=
 =?utf-8?B?VnFzNlEvemRpSWQzSis0RlRxSjdTNVFMSlVKQS80QW1JUmFZN25Nd2x2Y1BE?=
 =?utf-8?B?NjU2ZXVzbW5ZaHBFVkF1aW1hN1djeGx5UTJXWkxNWWRncVJsZGRHRXk2bFR0?=
 =?utf-8?B?ZEZMS2czNFA2M0J0RVBzRzlpUVRsVE9NZFdFaDIwbllQTU5GUDNNU0hTRkUv?=
 =?utf-8?B?Y0VqRWwwMUhlVC94QmlCVXo4TENkcVBiYTMvNkVraWtIc1FaaEQvcEJycnZk?=
 =?utf-8?B?bDgyeU5nY1dBSnpsZGJ3SUNWOTROTkE0L3VTZi9CVWNyN3ZOa2wyb2diRm9Y?=
 =?utf-8?B?bkszVjNGL0lDWjcyRUxaSFo3TmdZVTdMZzdWZ3EwdnhzeENQUVB0TmhWaDNt?=
 =?utf-8?B?eXFmaERJYlZuS0ZkOTVRQmpxRjNtQVBJMlZFRXdlcDVrRks2N3RoMXRtdWdB?=
 =?utf-8?B?ZWdqcnRiOHBlRjR1ajMyb1IyM0x1VTVwTmlpU3RtNTR6bWNMQlJzcm5uUHBW?=
 =?utf-8?B?YXRXVEZWajVsd2dOQnZRSWNpc1FqQU9LRlJudEpJUGYwSFp2RUozZ3JzVXNt?=
 =?utf-8?B?b00rcGd1bUlsOVdFbS9GYXhCR1FDZ3dLSlNndjQ0NDZNWXc1UHdtUXZtWU1P?=
 =?utf-8?B?S0w3d0VKUDVSWHowcGRlZGNYaEl5ZDZwRTFvazYweWJHNDdOcjhqZkxFcnkv?=
 =?utf-8?B?VU9QZmpodG5rTWN2NU1hQ1hmb1Y2ejBYWkZ0TERucXh4QXZUNkU5L0pwYlAx?=
 =?utf-8?B?RTJyNDRyNGNnK0pYMGFtRTZnaGVsVEZoS0toSUQrN0NjT01MZ0ZqTytWQy9H?=
 =?utf-8?B?RUlyV1hnSlF0UTJXSGthNnRreTM1cjEvSU40dDErbytOclpoejJOb244L2xl?=
 =?utf-8?B?NFFjN0hTWmtramw1Z0ExdUZRMUs3eU12MFJGeG02eE1Tb1Yyb2pPemFYYW4v?=
 =?utf-8?B?a2J3aUpHUWpzUmV2MEFGU1FVWEJxRjZ1YzJNUkpndm91c1JBQ0hFaVNVcngv?=
 =?utf-8?B?T3ViWCtta1JCdTlJNS9jUlhORDNleGVodUJRc3dFZ2t3ZnVGdUMyU296cU9U?=
 =?utf-8?B?Vm9IdnQ3U3hsbjZsNkNpQXB0ZmpUNXE0bkVvcWF2LzYwbEMxUWJSeGFIYVRN?=
 =?utf-8?B?bXlZSkQ0TU1LbHYrWDZDZTIzZ2tCTXM0aUkyZlh3MWs1cHlvM3ZqQlZxRFlL?=
 =?utf-8?B?dHdmZ1pnd1Y5cHAyb3hwSWZ1ak9GSDhUZktzMEh2T2d0aDhWYnA1UlhmL0l1?=
 =?utf-8?B?Tmx2M0FEMkpRdUV3Z2NrNkR3NzZmNnZaQU1sT0RqNWVpenRZMEVVZEUwRERm?=
 =?utf-8?B?RHBuUTFsYjlhS0plRlRSLzYzNC8zQ05qRlRCckpDT3ZENXA4TDkrbHJudzd3?=
 =?utf-8?B?TUNnTHhpK1gzWko0amlTbFpZQXZCOGhxWlRHVll5ZWc2Y3craTFmMUt4WVlw?=
 =?utf-8?B?d08yMTNmZ29iUmUrRWZ2WlJnUlc2djZyL3JxZzJ5MGJObHFwVHI3NVJmTkhv?=
 =?utf-8?B?aDRjY0xBRzVRQWdIVnhiMVAwTDhLdEdKR1luL2JCd0d6SDRVajYzT2NQd3Bo?=
 =?utf-8?B?QXlyazY2N1ZST0VKZUxFS3M3L2x1cG9VaGlhVDR6QmFQMFFxeWlJZTc4U1JQ?=
 =?utf-8?B?RzNaWHVZU1VVbHA3MGk5bnJDZk1vQ1BWa3pBSVowOTRuNk1ieERmZTNjM3dq?=
 =?utf-8?B?MTliUWpOR1dxbzgrK3d3TTV5TzFzSnpPZWU3eUNVWFdBd2tlc0tsbDJaVTN1?=
 =?utf-8?B?UkpzOWhDREdyZndKdHBvY2JoUGY3K21IcXRXeXJLNzRWRytMbmtVWjd0WXdo?=
 =?utf-8?B?SmVoZGJjMUJ0OFllUkwwU0cxQTNZRUxtMmtOWWxSZjAzdUpzMS9qdVBKdDNi?=
 =?utf-8?B?TUJBSEg2OHpFaDU2bUlIWEJ1RUhkTFhTTlJndUZpK0NoK0RYSFQwMkJ3dnlm?=
 =?utf-8?B?c0M2eXN4WEdvdk5CMUpndjYzOEVJazhRTGQzWis3cWRYeWhiMTRWU3hjajlE?=
 =?utf-8?B?SVBzbWZFWWVzVmhnQS8wUlltNjJ5OUluckhOY2NTdVMrZDgrTGtXTkNaa0cy?=
 =?utf-8?B?OHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 102b00f6-b139-410f-eeb1-08dd9d172ae4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 12:08:18.7123 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2tHGXMKItDMQDJ0gfvtCw0nEUxlv2B3AsVcw9KlUqA6TnvaMS7kWKrMF4KkIr90zrX2w5akbIlBG1+yHnb6j/H4zVbPUCiqZN/Bungh2FoQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5918
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

When the resource representing VF MMIO BAR reservation is created, its
size is always large enough to accommodate the BAR of all SR-IOV Virtual
Functions that can potentially be created (total VFs). If for whatever
reason it's not possible to accommodate all VFs - the resource is not
assigned and no VFs can be created.

An upcoming change will allow VF BAR size to be modified by drivers at
a later point in time, which means that the check for resource
assignment is no longer sufficient.

Add an additional check that verifies that VF BAR for all enabled VFs
fits within the underlying reservation resource.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/pci/iov.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
index 852424cf2ae15..f34173c70b32a 100644
--- a/drivers/pci/iov.c
+++ b/drivers/pci/iov.c
@@ -668,9 +668,12 @@ static int sriov_enable(struct pci_dev *dev, int nr_virtfn)
 	nres = 0;
 	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
 		int idx = pci_resource_num_from_vf_bar(i);
+		resource_size_t vf_bar_sz = pci_iov_resource_size(dev, idx);
 
 		bars |= (1 << idx);
 		res = &dev->resource[idx];
+		if (vf_bar_sz * nr_virtfn > resource_size(res))
+			continue;
 		if (res->parent)
 			nres++;
 	}
-- 
2.49.0


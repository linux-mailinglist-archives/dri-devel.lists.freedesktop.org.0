Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E89C5AC44E2
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 23:44:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAFDB10E3E1;
	Mon, 26 May 2025 21:44:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CjhgYu8H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 012CD10E3C4;
 Mon, 26 May 2025 21:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748295882; x=1779831882;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=4Vlrq7jrCY0n0ZBnmaQTP2Jmg+XbetwB7Ke+5v0ado4=;
 b=CjhgYu8H1RF4Khf4WxqchrjvoqI0H1Lhl+GwodqXZbRtN4qoGPNFvKmH
 sVMj0xIyyRIccSrXofMLNOByuNj/Lu5wIuW3BEjZmbW29abvLvIOmwqrz
 wlUJFtl53y+6f7rax/GJ9RTxV2lbrmZc1Rrxtz35VdBUYBq+niBEX/CFr
 JLNQ9wKdW9qPVkXIfrOa0oPSTTIwYJ+76wItOeuGLPb9M82cX8hCOhmQD
 uu6IS4PK+RD3Fp3xDADHSPfxUJ7IqanXV23CoD802AIt7UvuHpUlDVSuI
 YGEmVDJcEkhR4qj4Kf0Ki7ZuWf67tdT18fBwCRBpG3scxEn9iR3Qr2s2y A==;
X-CSE-ConnectionGUID: E59ip0bMRjun54/na+DN0g==
X-CSE-MsgGUID: mD6V22xnTNSKrUf9MMtAOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="75667639"
X-IronPort-AV: E=Sophos;i="6.15,316,1739865600"; d="scan'208";a="75667639"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 14:44:41 -0700
X-CSE-ConnectionGUID: LLX8cbYGTLa/+J3YD5g2lQ==
X-CSE-MsgGUID: NHbm6J9PTSCGClOWcyRq9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,316,1739865600"; d="scan'208";a="146412653"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 14:44:41 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 26 May 2025 14:44:40 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 26 May 2025 14:44:40 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.72)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 26 May 2025 14:44:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OQGFTHqC5ouTLNdVIqQCls4fJKaYYcyoMlt42O9BEzRNM/yvSy89cQg3byh9fqAYoKTyFxBCbEqfP+SraVGRbfMIBTvzUv/3kolVG+HgqZkOaSoOHs8HLFy/5Q0DTwxzA+j298FeG7ncAn1Mir0XJ42myIo/nl4PzYTmfsXiTElNkFUa1hQnu0+VM0Bd12THN9wgFPIIcfoNQ3VQhlUhUuM0/QMhAAw0qA+e2LwwEtOBxgCFzqBTarTa0pmn/Xd2QJ9DBtCm5EFIE5nQ+AECdTH5DcSAP/qOKjGikvnNHJO6B5+8ojY9JVAjpINZ4nloPmrnaAwX+yIL4J4ix/tyFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k/imEKnmikCxKHc5mSRhnpDVfFDe9G/AD+HX3KpvNPY=;
 b=G31S5TvkaP9OTprzg38khcLgYBzg7KGWDO7pab6L0qVBPyjqOaab+rVOs/uukimQHB0cYNXwhuGDtjKIb9eaP1pTwr7cZbl//qSfImWSA2TkXpBocqhlUNAx9q6aKYwz+w4BRYnIt267CkS6gkX3iYbiykOMFXyOI4GViyU07RCHvAx41lLt7QAyDCJeDsMEN5asz9tZL3fQ51vSq2qYZV6Ho+KiMGA14ankaiOerqrArY+lXDti5bgJiImuhEjfLr6EOSd89bPgvEPEbX5mqu7TlY2NepZMXFp/UYFdNhUwrJMcCnfW4Q0wwVFocGHXDzI0niXrdEkdjoW5V5sa4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DM4PR11MB5279.namprd11.prod.outlook.com (2603:10b6:5:38a::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.24; Mon, 26 May 2025 21:44:17 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.8769.025; Mon, 26 May 2025
 21:44:17 +0000
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
Subject: [PATCH v8 2/6] PCI: Add a helper to convert between VF BAR number and
 IOV resource
Date: Mon, 26 May 2025 23:42:53 +0200
Message-ID: <20250526214257.3481760-3-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250526214257.3481760-1-michal.winiarski@intel.com>
References: <20250526214257.3481760-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0008.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::24) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DM4PR11MB5279:EE_
X-MS-Office365-Filtering-Correlation-Id: da9b190e-5e7a-4aef-df92-08dd9c9e7729
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MmF6OThNLy9GVGpvT0tSVUZod0pyRjJ2RjFqTFdqcUt0UkFXbTNBdytWUll4?=
 =?utf-8?B?b0pMeHUzaVRlNlVPQno0TDR0cFRLQVZqbEc5d0tZY2pneFIzWnpCNnF5THhN?=
 =?utf-8?B?b1ZJQVpoV1ZUeDhSd1ozQldoY2ZCeGF4Z0duT0VScmd3bzNsb25OSXRrN0ph?=
 =?utf-8?B?WFZWZGNyc3h5SHM2Y0dPbG05THdJcWNpTFc4MjJ0SklHL3dpWHJEcXIxeWM2?=
 =?utf-8?B?Q0hST3RUWE8yOE5xdlBZL1ZySHByLzJuUS9qbVpBamFnb3hDWTkwRHlOcDJu?=
 =?utf-8?B?cWFUd1ZQL3o5alhaRW1MRmdvVGJNTnB2UFN4bXV6aUNpUnJCaXlOTllXdjdR?=
 =?utf-8?B?Si9xbHZ6OU1ra2FRNEUvbHRXb09sWThrTkZOOVZDWTdEWWVpMmUwMmFxQjhx?=
 =?utf-8?B?M3F4QnhSWEhzNFg3NCtQeUt4UDlMODUvNE9BNHd4WnRXOWx1aEp5S3ZTVzN3?=
 =?utf-8?B?aG1jVXhZRUN5QjVVUWtKOGRwclU4OVg0bkdJYmZzMU5pYmtJNUJYNVNuL00y?=
 =?utf-8?B?RXdKNGRjNjNmUm12UkZLa1pCOEtNS290bVhNYkdSZ1VZOTIvL0tWRzNnekoz?=
 =?utf-8?B?S092N0ZURmRKdVhBTzB0Mmh5aFdBNmZDY1p6ODZ5TUlvbm9EVGhoQjM1SzZP?=
 =?utf-8?B?MUhqQXJ6MlJ3akkxelA1ekNKcEJLcGpBVW4zQkRTYVovaEI5K09oNVRxNi9V?=
 =?utf-8?B?YXpNMnJjNDBxWWpUekxyTzNIdkZIY09ibVR6SG4rVlJ0NEFSaUNGN3F5akR0?=
 =?utf-8?B?QWFtSVZzOGZNTlVBbkorOTBXNmJUem1FWWxROWFYeTRzRzdacnFFaUcxV21z?=
 =?utf-8?B?Skt3L0Q1bG5ETHpaeTliVTJxazFvUnZCOUlKam5TN0d2WGJ5aEw0RnJNUUFu?=
 =?utf-8?B?Y1I4OFlXaWo2d0xGOWgxMzJONTVHMHRRTDM2ekhrSDJrbnVpZ3JBZkhhVDlR?=
 =?utf-8?B?WGM3eElGblVNc3FOZWpMTUJuSHg1VEI4eXQ1T1BtYmxjSDlvN1lKaU1sQU5S?=
 =?utf-8?B?T3FTaU5MYlZDTDdvdU9hdkRIR2RENnY1MStqZDFtMTQyNE1KeG52NjBzU2JF?=
 =?utf-8?B?cStRTmU1NFgyY0VaTlRJcHRqZWpyQVBVaW9LT3dBT205bGFOdzdFSjdnV0Vp?=
 =?utf-8?B?dncwakVFQVdvVDdRZnNxNzE3WXFtUG5nT0FoZGhHcXFSVlQ0dGF4SXdVMXRy?=
 =?utf-8?B?aFZFemp0bk51cktVR3daVWh3aGE4UjN3MW0xbmo2dTZxU2RVS3pUYUZHVERm?=
 =?utf-8?B?Ymo1ckprVytELzIzQldkVzF5R0ZwTkw0QU54VmsvTGJrREJKTWFkNEhaVkxp?=
 =?utf-8?B?L3h6Tm9KaWFsZFFsVnN1OGo0S3RIWG5BcWIrOTNuQU5sRmpNbWpXQjF3cnRv?=
 =?utf-8?B?aFVpb1MvNG9GT0JuY2FRd0FnZkJKai9Zb2h3dFRzd2ZLSWtVNVlSZExhdFZ3?=
 =?utf-8?B?cnd0UkRVOEJmVWZRNnhCb0hodkt2bnBZMyt3dXg3c0FtUWtEZzUrWkFsVUYv?=
 =?utf-8?B?Yk1TZERKVFJVSDY3NVY1bnFxWEswMWdkd2NmeHVhemdhZHRvMFhIc1ovWUti?=
 =?utf-8?B?d3Rxc2R1bEJwbk1iMXZrSGI1TXNsSktSOXVoNUhiU1ZKaDJwd2VGbERGNW1a?=
 =?utf-8?B?QTA5VHlzRGkxeWF6MEljUzVkT0xyRGFnclU4ZVBtSEpDQTh6cVRIR1U3SERN?=
 =?utf-8?B?ZERUZGFmaUNnblhSUnd6UklDVHVhWVRveUxXS0NmS3h6SFBRZVBRMm81eFZm?=
 =?utf-8?B?WlNVT1ZaMWxFZnQyMVkyd1owR1cxSGRNbVRjLzRtdVVkaVhkb1BWU2JsOG9p?=
 =?utf-8?B?NWRvdmNaMm5xSTNQREJrdmVxRm5XUlQwczZBa2tUMktRMktLeHRISjlkL0Vw?=
 =?utf-8?B?WHRTZ2pSeGlCdG1ubklYWkJWMXFiczVPaS9WL0dWY3NtNjkvSEVtUUFIQ25o?=
 =?utf-8?Q?B4rRG+e2lOc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dVJZOUUvYVZsRHJQVFYyK2s2WFg4UWY3bnVNVDV6cExJN3YvRUVYczRielVx?=
 =?utf-8?B?VUR5eXduYVI1aXpXRGpZUm41MkgzVEx0ZVMxeW41VmJXUVlOZXBDSCswMUpo?=
 =?utf-8?B?dnBkZzBYem9lREdvOHZSNThSLzIzRW5tZ1JWK1BaN3BGNjFrcjhtNGsyQ0FW?=
 =?utf-8?B?TjdPQm5xbFg1MW9ONmd1dmN5QTMyT0dHQmplVHFHOUM1ckx2UVZ0eUxMQ29N?=
 =?utf-8?B?dUl1dHg1TVFJQnRSdWdldUJMQVJnR0s1eW42dGV3Z09MdFVzMGJCOUN5bU95?=
 =?utf-8?B?c0hBTU8vN0plT3AzcHlZSGR1VVh4YmFhcVlZMmRSQzhxZjBXY0o2WnZjZnZs?=
 =?utf-8?B?K1I2T0t3KzNDam1kM2hWRm5qSU40NEUrdW0wajdrUzNzUW9jWUsyT1lpTnlM?=
 =?utf-8?B?UWY5d1RRMG4vU1NpdFQvN2YzRVlHRHlTMlNMYTdGTXY4ZUp0UEhtMk5wV1RE?=
 =?utf-8?B?OHpNaGpQVWsxK2NJQ2NZekE0aGFOKzFUTHlJS0hRR2xEZjZsU3RpaldiZWlT?=
 =?utf-8?B?SGtFL1BtMmhRL1YzN3JHMHVFSGtXWEYvL1Q3Tm9YK21FOVRGbjJ3eU82Skh6?=
 =?utf-8?B?RUszT0t2QnJoQm1DMXQvaDBKWmpqRW9iL1VUUERZV2lRT0I2M2ZTa2ZmNGJP?=
 =?utf-8?B?V1dVNXN3azg5bStndmNHL3JGUXJYSUFPck8zOVhDWXpnR09uSmVHSHlVUnhl?=
 =?utf-8?B?N3VON0gvUU1velh3THgzWkRCOStwR3lqTmdBU0VrcEtZK0h0QUcxQlA0ZjBa?=
 =?utf-8?B?Y0dwbkFRSWtieFZheU5qeHZpNlFEMWhzY2J3K2hLaWJpQ2poOEZSV1VxbGw3?=
 =?utf-8?B?V0QxRzQ0ZEZUN0VQWjg1SE5YSHpkajczNDZrb1h0ZXFyMjJhV1hDbmxKY3dN?=
 =?utf-8?B?eTZuRVhDYldlOEl4ODdXR1MxdWttM1lxZVdlZjl3YjRoN2hsU202WTE0ZlVK?=
 =?utf-8?B?MEhOQkI1cmd0UWh1d2FJNzk1UUpUMXA4UnNYcWlWNGl5LzZzaldDOTQrUFBF?=
 =?utf-8?B?QzdoQk9nUWM5NThZNVBSZ1ZlYUZCdUVHYjVGcFRhenQxQWpUQTdER25PN0Rh?=
 =?utf-8?B?VHQ3TjhVNW40YjI0N1VnMnNLN0w3cmFGQzUyRFU4dTMzek81eUlycXRVQWhF?=
 =?utf-8?B?MnQvQUhJZlNxSG4wYnJRMWlhMHhEVkpST0xXNlMyK1JwQUE4bmZjVVJUaENN?=
 =?utf-8?B?cHY5eEZBWHFMRzZHcEFtb2MvZmtWeXJCS0JwSktSTmY5c212SmhlelZvdFU5?=
 =?utf-8?B?SUdtUDJyZEJDWW5LRFVnUDJXMXdXRDV5dmNuT2Y0K3VmbytvRnpyZ2FSQ015?=
 =?utf-8?B?ZHRvZzhveFd6dUd3YjlySnQyMGhuRmxYSWhBMldVZ1hVM1dmVW5NSFNSVm1G?=
 =?utf-8?B?M2E4VzJ4anBNTWR6NVBrZmZFSDN1a1F3cHJ0dDJNcGJkcHZldngrbmlYN0Nj?=
 =?utf-8?B?REdkbE9MeHFra2U4dlUyQy9BVTE0UjlCdlhKL2o5VVRkUGt5Q1hqcWlWNE9j?=
 =?utf-8?B?dlFTVDJRRW45RHFwU3Bkc2NyUzBlbjQvSWVXVjBUd3I2VEkzYmhuK1NOYjdW?=
 =?utf-8?B?VGtLSUVYVjM2OWtxQ0pNRkdteU10ZDRyKzFxaUQ3S3ZZTHZkTk9pL3dYanBB?=
 =?utf-8?B?elA1VzVNSHBGMENudytBT0JCcTd5MlNQNFhSWDd0L2NFUnlFcnhlRGV5eCtX?=
 =?utf-8?B?Q1dnMUtjRHl3NlJBUmtUTXhhSFNUckNJTTArdUd6eENvQmxJdzJFTWJqVmMw?=
 =?utf-8?B?V0RuekM0Qkl1bUZ0NWY3Y3Yrc3hHZ1dyL2t1QlI3aEU2eTVRTlZ4YzBXTC8v?=
 =?utf-8?B?M2RiTG9WTzNFNy9LMWhIZFEwOXNKeWFZOTNwYzlzOTZHQUMyRmZ5bmVZN04v?=
 =?utf-8?B?U2VzaFNYNTRYUTR5ejdxYXROQUhGTG1JOTZlMGtjNFZTVGlncnU5bit5ZnNJ?=
 =?utf-8?B?Y0k1dmt5bkRzTlkwRmR0Y2MxMW1Ud0JwdUtiOTRjRFp6ZWtGS0loSmllM3dH?=
 =?utf-8?B?STdBeWtsYm9YTlZCNkxNR2w1ZFVFaTFiOEpBcysyOE5TM0pQTjUvMldmaXp0?=
 =?utf-8?B?SWFBMEJwdi9yQStOZTNJMzB4empsazBEK0VYbmVYZk90MTNsT0ZPUDBkZnpn?=
 =?utf-8?B?MDliZzlzbEZXVytZUTNuaTJNTE8rdkZPZ0RsalFJdGQ1dE1iaUdjTFRUMVZW?=
 =?utf-8?B?dWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: da9b190e-5e7a-4aef-df92-08dd9c9e7729
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 21:44:17.5797 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q4PvhRmIdKWe/VKPmJSMo6Tko5rSEB+iB4A36fVacLQ2uwdMIZtSHAZjDpeXtic75IPhSsqo/K4LU0r5KsQqDRSBEOmMC24j/F97Xtqj0Ho=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5279
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

There are multiple places where conversions between IOV resources and
corresponding VF BAR numbers are done.

Extract the logic to pci_resource_num_from_vf_bar() and
pci_resource_num_to_vf_bar() helpers.

Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Acked-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/pci/iov.c       | 26 ++++++++++++++++----------
 drivers/pci/pci.h       | 19 +++++++++++++++++++
 drivers/pci/setup-bus.c |  3 ++-
 3 files changed, 37 insertions(+), 11 deletions(-)

diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
index 8bdc0829f847b..3d5da055c3dc1 100644
--- a/drivers/pci/iov.c
+++ b/drivers/pci/iov.c
@@ -151,7 +151,7 @@ resource_size_t pci_iov_resource_size(struct pci_dev *dev, int resno)
 	if (!dev->is_physfn)
 		return 0;
 
-	return dev->sriov->barsz[resno - PCI_IOV_RESOURCES];
+	return dev->sriov->barsz[pci_resource_num_to_vf_bar(resno)];
 }
 
 static void pci_read_vf_config_common(struct pci_dev *virtfn)
@@ -342,12 +342,14 @@ int pci_iov_add_virtfn(struct pci_dev *dev, int id)
 	virtfn->multifunction = 0;
 
 	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
-		res = &dev->resource[i + PCI_IOV_RESOURCES];
+		int idx = pci_resource_num_from_vf_bar(i);
+
+		res = &dev->resource[idx];
 		if (!res->parent)
 			continue;
 		virtfn->resource[i].name = pci_name(virtfn);
 		virtfn->resource[i].flags = res->flags;
-		size = pci_iov_resource_size(dev, i + PCI_IOV_RESOURCES);
+		size = pci_iov_resource_size(dev, idx);
 		resource_set_range(&virtfn->resource[i],
 				   res->start + size * id, size);
 		rc = request_resource(res, &virtfn->resource[i]);
@@ -644,8 +646,10 @@ static int sriov_enable(struct pci_dev *dev, int nr_virtfn)
 
 	nres = 0;
 	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
-		bars |= (1 << (i + PCI_IOV_RESOURCES));
-		res = &dev->resource[i + PCI_IOV_RESOURCES];
+		int idx = pci_resource_num_from_vf_bar(i);
+
+		bars |= (1 << idx);
+		res = &dev->resource[idx];
 		if (res->parent)
 			nres++;
 	}
@@ -811,8 +815,10 @@ static int sriov_init(struct pci_dev *dev, int pos)
 
 	nres = 0;
 	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
-		res = &dev->resource[i + PCI_IOV_RESOURCES];
-		res_name = pci_resource_name(dev, i + PCI_IOV_RESOURCES);
+		int idx = pci_resource_num_from_vf_bar(i);
+
+		res = &dev->resource[idx];
+		res_name = pci_resource_name(dev, idx);
 
 		/*
 		 * If it is already FIXED, don't change it, something
@@ -871,7 +877,7 @@ static int sriov_init(struct pci_dev *dev, int pos)
 	dev->is_physfn = 0;
 failed:
 	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
-		res = &dev->resource[i + PCI_IOV_RESOURCES];
+		res = &dev->resource[pci_resource_num_from_vf_bar(i)];
 		res->flags = 0;
 	}
 
@@ -933,7 +939,7 @@ static void sriov_restore_state(struct pci_dev *dev)
 	pci_write_config_word(dev, iov->pos + PCI_SRIOV_CTRL, ctrl);
 
 	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++)
-		pci_update_resource(dev, i + PCI_IOV_RESOURCES);
+		pci_update_resource(dev, pci_resource_num_from_vf_bar(i));
 
 	pci_write_config_dword(dev, iov->pos + PCI_SRIOV_SYS_PGSIZE, iov->pgsz);
 	pci_iov_set_numvfs(dev, iov->num_VFs);
@@ -999,7 +1005,7 @@ void pci_iov_update_resource(struct pci_dev *dev, int resno)
 {
 	struct pci_sriov *iov = dev->is_physfn ? dev->sriov : NULL;
 	struct resource *res = pci_resource_n(dev, resno);
-	int vf_bar = resno - PCI_IOV_RESOURCES;
+	int vf_bar = pci_resource_num_to_vf_bar(resno);
 	struct pci_bus_region region;
 	u16 cmd;
 	u32 new;
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 6e667623af32e..14514f4a20ada 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -715,6 +715,15 @@ static inline bool pci_resource_is_iov(int resno)
 {
 	return resno >= PCI_IOV_RESOURCES && resno <= PCI_IOV_RESOURCE_END;
 }
+static inline int pci_resource_num_from_vf_bar(int resno)
+{
+	return resno + PCI_IOV_RESOURCES;
+}
+
+static inline int pci_resource_num_to_vf_bar(int resno)
+{
+	return resno - PCI_IOV_RESOURCES;
+}
 extern const struct attribute_group sriov_pf_dev_attr_group;
 extern const struct attribute_group sriov_vf_dev_attr_group;
 #else
@@ -739,6 +748,16 @@ static inline bool pci_resource_is_iov(int resno)
 {
 	return false;
 }
+static inline int pci_resource_num_from_vf_bar(int resno)
+{
+	WARN_ON_ONCE(1);
+	return -ENODEV;
+}
+static inline int pci_resource_num_to_vf_bar(int resno)
+{
+	WARN_ON_ONCE(1);
+	return -ENODEV;
+}
 #endif /* CONFIG_PCI_IOV */
 
 #ifdef CONFIG_PCIE_TPH
diff --git a/drivers/pci/setup-bus.c b/drivers/pci/setup-bus.c
index cc37cdb5e3522..a7d85b0f3a6cb 100644
--- a/drivers/pci/setup-bus.c
+++ b/drivers/pci/setup-bus.c
@@ -1884,7 +1884,8 @@ static int iov_resources_unassigned(struct pci_dev *dev, void *data)
 	bool *unassigned = data;
 
 	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
-		struct resource *r = &dev->resource[i + PCI_IOV_RESOURCES];
+		int idx = pci_resource_num_from_vf_bar(i);
+		struct resource *r = &dev->resource[idx];
 		struct pci_bus_region region;
 
 		/* Not assigned or rejected by kernel? */
-- 
2.49.0


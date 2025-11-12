Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 733D1C5276A
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 14:24:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D61C010E73E;
	Wed, 12 Nov 2025 13:24:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KPUxDJso";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2BCF10E73D;
 Wed, 12 Nov 2025 13:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762953864; x=1794489864;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=xrDqACs55GE84yhC3cTxkO+49b3d2eMUulfmyH/0AYE=;
 b=KPUxDJsoWRuAHDVX3BfZ6Dqusof46Jm9dgv420LLYMrqHpLpD6tz8StU
 jU8g4p3/+uFueP69dqnT2sD+t5g2dEBwUoLnwRlbtOcGBGGtBMTX996BZ
 d01EG+7EiBcWJCTVcx9QingENckD+u9hEBoVjEHlm0e/M7vMn8/V0tfQ2
 us9Pw8Lz2PHExhRTM+oKNbDd7V4wYTcF3KhM2dvs52IGS234NVgQdQ+M4
 IgzNv44W0C5ypbT3MD7hymns0WfF+wLGN6zED70ITkFW6KDq9xgvEC6U9
 AE9K0dj2rpU0wI4kJiDyF5OJDPB6Cx3tLF59mR4+H+DXcSUzDUiwleQxx Q==;
X-CSE-ConnectionGUID: 4Jz1OmkQQ9GdJQvm2A2MEw==
X-CSE-MsgGUID: HMZ0lyUtTDWShVQSoM5sug==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="87656386"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="87656386"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 05:24:24 -0800
X-CSE-ConnectionGUID: JpzFsJENSi28fX8xUNuPAg==
X-CSE-MsgGUID: /q1ZUgQzRUWHlR0AF3373Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="194199830"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 05:24:23 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 05:24:22 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 12 Nov 2025 05:24:22 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.58) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 05:24:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jmwb0nAApssIjWdMo/cgTjR7Yg1lI/kGUf5n2KMRYwDJ6L4gML8wZzfEpfo0umSh/UfG2TetTtKN4+oR4bmMJM0ohfo3WXx2BYbsj8g9vu1lBsFdx+njBbbmXJrPSK2zOGP/aC8SQsfeDz2yAnLePo2Lj/4IGu0pFbtMSnFHiA/NiPDf9qEp5+mqwugZDy8kt7NUJWORZ8izsucf0uoxj3rWNhFTw96OtjnmfkdRIGxJHlTGOB3ONLFh7c4qC9gp0n9y/ZhrAWUe8n70ZPSXYWRWYVHIFBnrciMyBOiRZhD8vTA/A2Ln2TIr/0gx8vYzBYFhB9o8emyUsl7XHwk2fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y8294im0xXfz1hbayPsQiXLJS+lPMDYkWyoQ7u3SaKY=;
 b=E+HwVOoaTiAOd41EN/N5zc9/RIGbzPrcqyCHfxiBt2N2S6ce6fs3SuCOADbM9axdgkxYxAhNW1cPgjNytxBkzf1pfH8YFG+PXhP5KjTnDsXJX1e4q+b/sWxq+08rswV+k9ylUqprYB2mM8/SIvrinTv6WJwtkeT8XFD8faSikgPlQAg9IAGKOu5RBp7H5UOs9Nns046KDgyt1aWOxxC/fskQtRJKYV5qYOa2Ffyb/BSON+PfKyLPHDGfHRsfuhhhqtPb7gHDxI96bszRI3b0+Bi1oI4Eig5M1mwT4l2PD8CsJ9KVQ+mIRbA0r3Yvozn64Re6dZxiZ6hiDOS0vBz9aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 LV1PR11MB8849.namprd11.prod.outlook.com (2603:10b6:408:2b3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 12 Nov
 2025 13:24:20 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 13:24:20 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>,
 Matthew Brost <matthew.brost@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH 21/24] drm/xe/migrate: Add function to copy of VRAM data in
 chunks
Date: Wed, 12 Nov 2025 14:22:17 +0100
Message-ID: <20251112132220.516975-22-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251112132220.516975-1-michal.winiarski@intel.com>
References: <20251112132220.516975-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0013.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:1::8)
 To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|LV1PR11MB8849:EE_
X-MS-Office365-Filtering-Correlation-Id: ed6581cf-5588-4962-7512-08de21eec9ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VitUL3lWVUFtb1ZLUG1JV3kzODlpejlKVFVVdFRLSGtpWHlLbEZLcVJxM2hI?=
 =?utf-8?B?UHJnd25jS2lKOUJvTFlVZTA1b0xnazNSaUlyNWVKS0hoQnFTWlpxL2tjaEMx?=
 =?utf-8?B?M2N6WE14MUdWZzk5UWlDQUNuY0tyb3BxTVozRm1wK3A2a0tKa0RIWWxia2JZ?=
 =?utf-8?B?aEg0SDlET1RXMWlaUGtGVWFYRjBDcFZrR2JNOHFQU0RpSG04Z1NjSFhPMWRv?=
 =?utf-8?B?anNnaHkwUHlzbTNQTERiMFVweEhvZFdwK01ORmZzVXZjTVA4empraTY2Q3VO?=
 =?utf-8?B?ODkwczNkbFdDY09JMUNBditSMk1LcE5LbzFxb2t5TzVJUVM0amxzZ3BIQStS?=
 =?utf-8?B?MDluejRsQk15RmFibkgvZkNrRXZUbnUxM0VnaGI1RE5KKzdyTHNhUVM0K25j?=
 =?utf-8?B?SDh6OGxCeW9QMHhzU1IyTXJtU2FEeVpmY3FNbmJxRDNQZWVja09BZkRiUHpw?=
 =?utf-8?B?STAzUG81N2hYMTczUkdueXVockQzdGM1ZVZzcEN6TlRDa0ptRVE3NW0yS3l0?=
 =?utf-8?B?MjdkaXVCUmh6dzkxMS9TNll4R3NGUFZOWmxyWG1PSjBTM2FyVlh4TzJOQldm?=
 =?utf-8?B?QjFId2k1ZHVhWDFJOVZHNmZHSDlsQldCRzFNSnYwemFPTzlnY3FqeXUzbUpz?=
 =?utf-8?B?N2FobnRQd09DZUdDZ051a2FRTUVDbmExQTBtNWNKenduU0IzODBlaWZZN0Fy?=
 =?utf-8?B?QlVUWFFPS25wTW82YlI5azgydkxVb1gzWnVNRmZCaUN1VWhyU0o2ZmxXTWxy?=
 =?utf-8?B?OVBwWVd4cTVvOURkUHVIditpS3JxU2FEamcyaG5PZnRkeFZtZmdSSGRVY0RD?=
 =?utf-8?B?ZWs5UzhsNDVRenVOSnhTaTE3VHZGQ3dtZ2s4d3ZpU1hGelJzeXRVbko3ZndM?=
 =?utf-8?B?YXF2bWRqWllKNS9JWktTRGdlN2M4blkxbytETkhLSjNzMkZieTNEU1Z0MFQ1?=
 =?utf-8?B?R0JXRFdXK0NhRlJtQXBtWmR4NFpjVklJdXI0K0JqTjRzcGFDaVQ4eEJrcldv?=
 =?utf-8?B?cFk0Q2xOSENsb1NxK3l3QzlGelVIYXNkOS9hQ1VTaUI1YkR4dHlIQTM0bXB4?=
 =?utf-8?B?STZ3NW1UdEZZS2MvVi9JUDQ4c0MvaDFSYTJBeklnblZUNDMySWxiOGxNQ3pL?=
 =?utf-8?B?VitvZGtlYXNLMk80bGtTTGJxZzVzWWZuNDRLYWc4eTBLNXU5eld1amNjNUpw?=
 =?utf-8?B?ZDJzVXcyd3RoZmVVSjZhcjgvZlI0eG9wU04zcHRxcGVwek5vTjY5TUlteEJm?=
 =?utf-8?B?S3hKN0Z4OC9pUi8wRmgvMG9zd2pJZ1JqaGJ2NWJhaG9WRHpTRDA1cjNBbUJR?=
 =?utf-8?B?TlY4a2V5Q1BGeURNNUs4VmFMNmkyZy85RFBnZnY1WjFyNzMxdHpMelRqeUhu?=
 =?utf-8?B?RnlGcnVremRKV2EvVTRxRUd6eE9KRkdjMS9hYUlPd24vZE9OSUUzd21Hb0Zv?=
 =?utf-8?B?VVQxUk5rSFBia1R6amNzSzU1ZjNXWkZaS2Y4RnExWURrQXQ5RTQ0SlFBZEc2?=
 =?utf-8?B?TXRxcDlETldYRGc3R2h0dGorVGxLaEIyeFhZK3Q2dGNrMjVMV2JhRG9wK3Z4?=
 =?utf-8?B?L082UWtTN2tQQ3NqalN5ZUxHalFEM3o3U3pKaUF3Rk5tSmZabEFkbG9CTzc0?=
 =?utf-8?B?b01HakdSaDZzWWxDeFlRNGJuWU8vNFFtUDJ1WjFVSUJrNzJUbkJ5MGl1SWF4?=
 =?utf-8?B?MFFVUFdrRkZJY0UydGFFdXpULzhwUkN6RVptM2xNemF0Vk9pZFQyaDZxV1Bh?=
 =?utf-8?B?OUpoNVhpUnZEa3FUSHE0aHRldUkzUEtiM09oNnZaU1hlWlBmS3pCSktkQXBz?=
 =?utf-8?B?NG9BRXFuZDA1R0ZZZGVVQzB0b1MrVVJVMUJ0S0d2RTBCQjdBTFR2TzhpT3dD?=
 =?utf-8?B?c1FBS1VuSjJsOTNZNFdQRkNmR21GMUkvMWdieXVxU3lmUnhUUDhzL29tWXln?=
 =?utf-8?Q?6WBhA5Y7EfvbFoKa/hfbU4qa7N28SOTS?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RjJIUmNHVUFKeFNOa09EZytzWlRucEVkMGdDNUVBVURLeXgzcmRJeWRkUVR0?=
 =?utf-8?B?Yi9VMU9NY1U4b2VTT3dmdDk1aHhNMzlkSkRqaEhoUHJON3ArSEtHeWNwZVBM?=
 =?utf-8?B?eUNDYnBnNHJTSSt6UHB4QVdVcW5UNDZ4aU1KY1pWVGVzQVV5YWMya1NGWVFQ?=
 =?utf-8?B?TnhnR2FNVWQ3dk9ONUIzSE1UVFZLcFcyWFk1L1o0QkdaSithSXNOdGs3bE81?=
 =?utf-8?B?UEMxbEp0WTRKN1Y4b08zbHpXY0R1aUtvajJubEhZa1FyQ3dheE5mWFZaMlRK?=
 =?utf-8?B?UDRFTms0RVFKK3hDMjVWS2V6NlYreWhZdXpzVm1DbE1xbnZLa0ZnSDZhaExJ?=
 =?utf-8?B?ZmRBL1daRWQ5Wmt1SW1tangzUVk3dTFMTlB3TjhTNFFIMzhNMWZobkNPNUhr?=
 =?utf-8?B?U2JNS0hWbzRuY29JU0JiZE5FYmZWOTdZY2krcnQrNlprSnJ5dGdQS1h2NTR1?=
 =?utf-8?B?NnNGTWYxbkpKSWh2VlN4ZHdUM0kvL3ZqMVU4bkRWLys1OWIvd1VncDU3QVhF?=
 =?utf-8?B?MVpqbENxZkJmRDlOV3F5aENVdU1wUUFlby92cTBZSnUyRzJ3bDNwQ2pHdklo?=
 =?utf-8?B?eUxxREFVN3Rvd3pWWndTVjhTaFE0b0ErdEtOZGxMaC9LM0NzS01mRmZnVUFh?=
 =?utf-8?B?a1NZelJqbzB2Q3lIbXBkcTFHTWFqT3RvWTVVeHJxOEVvRWUycXlvOGlPa3d0?=
 =?utf-8?B?eUNDUThxRWxrMnhjR3NyaXNKRWFMYmhMTlhnSEcrajI5RE9OUTZPczJwQnZQ?=
 =?utf-8?B?Mjd1RmN0N1ZXWkxqSWVCcm1jcU1NbURUcGxyOGo2M2hMS21RcFluODdSQi9R?=
 =?utf-8?B?TUVYVzIyL0oycURIZGE3Uy9sQ2xQaVgxdlByRVd5a0J1Z3ZJR3BjbmV2TWFV?=
 =?utf-8?B?a001bzhZMEZmeitLS2RKN0E3V3dNTU0zZU95OVVwUDhtTTVSc1I1WUlGREtJ?=
 =?utf-8?B?UlJONzhobzY3K0o0cTQ2TzZNNUpqZWZqQ0NkVFNzMmZWRThkOG1odmU3cXJW?=
 =?utf-8?B?QVIrTGxhT3pYZGE5YUR4RFhmUnZQeE12YVE4TlhuRm9oaG5MSU80aEdzYnZ6?=
 =?utf-8?B?UWNFNjM2Zm5ldHpHdENqczRvWGpZMEdHM2orMGlYZWxGbkhUSnRwR01UUUdQ?=
 =?utf-8?B?SndlWHVXbkE2MTJGMUV3QXpxVk4rNC9FUnkzRUcybk93NTJyUkhQcW1Ea1Fz?=
 =?utf-8?B?QWdNbitKRlZWU1pvTGhESWdsZ2VibnlEM3ZBZmNFZHhzcGpmUjhFKy9udmQ4?=
 =?utf-8?B?bmtUeERjQlFhcVdSYUNzL2hMQjJKWkx6MCthWkkvMUtMMDZGSFZYWGRYRUh1?=
 =?utf-8?B?TllXMjVGQlFYNVhCVjk1N2toS0ZnK0NsSXdRYkczMWZFUFFlTFEveWQ1elYv?=
 =?utf-8?B?L2pTVHZGRG9YOFdlMmVVVEdHUTZKT3FkMDhDMThPc1hUYUR4SXI0R2szZU5O?=
 =?utf-8?B?czhZTGtKL3NNS09NMWUrZCtpOTVleG9XNnZQbDE1THVZQ1B2d2cxa0NvMy9h?=
 =?utf-8?B?cTJLNStHTE1WMzZaM0lqMEt0UGQwQ2w4d3lwMFptOEM3a1p6TEY5UVhSWi9P?=
 =?utf-8?B?ZCtBRGdvYndDY3JyV0VCNWE5SSthNGV2Y0ZlR1pNZmFoRzMwTVZySUpxMldy?=
 =?utf-8?B?R3VaQ0pFNE1XMGVMdFF0Vk8xdVlZQnVaWnJVMG5tQWd3MXdoOUVOdUZteWZT?=
 =?utf-8?B?Sk00Wk9YcG5RQWZqME80RUdqeG8yb0svdTVLbEpIdFExY0ltMmZzVEV4bzFP?=
 =?utf-8?B?OGZMVXJPMG40eGFpTmZuWGlERE03NVV6SU5PWnA0WFNyekl5WEUwdktsRTht?=
 =?utf-8?B?aUxjT1paWGlZcTI1Wlo5VUM1OURwVUxjK0Z5QTEyNUdnQ0FZdjZWZ0lqMjZu?=
 =?utf-8?B?VVU3R2xwSDV1d3RLdkdiM0FkcDY4YlVFM0lTV0grNkVIVjFtc3FGN1BGUTBP?=
 =?utf-8?B?MzVVV1FGZU9LWktRd29TSCt3d3dEMGF6WENZTXRWMHcxUHYxZDlkNGVvQUhS?=
 =?utf-8?B?WG5FQ3I1MHM5VUZhTnI3Z21OaWJlM3VMbUw5aUhHMU9oVjZES204emwyUFhC?=
 =?utf-8?B?WE5VWkVNZGw5NkRNUUUvblJFZnEwSkszek54T0RuZ3Z1QWh1MnN0U05hVjhr?=
 =?utf-8?B?Q1NtUkdRNWtKMXoxRW1iNGlnaHVvWFdWSnhObkc4QUFmbjJuMnZWRDdYTkpM?=
 =?utf-8?B?V2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ed6581cf-5588-4962-7512-08de21eec9ac
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 13:24:20.3969 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1rRApoQ7AZmD9Jexs+72eKQ+bhVI1IPOXDiaaYsB8zp9JW4L8xQFijbZKu0XGDYfzKBsTDsxdqrizBWGUcmRKUb7JUU9M+uuBVVkjdEsu6Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8849
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

Introduce a new function to copy data between VRAM and sysmem objects.
The existing xe_migrate_copy() is tailored for eviction and restore
operations, which involves additional logic and operates on entire
objects.
The xe_migrate_vram_copy_chunk() allows copying chunks of data to or
from a dedicated buffer object, which is essential in case of VF
migration.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 128 ++++++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_migrate.h |   8 ++
 2 files changed, 131 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 5003e3c4dd170..2184af413b912 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -29,6 +29,7 @@
 #include "xe_lrc.h"
 #include "xe_map.h"
 #include "xe_mocs.h"
+#include "xe_printk.h"
 #include "xe_pt.h"
 #include "xe_res_cursor.h"
 #include "xe_sa.h"
@@ -1210,6 +1211,128 @@ struct xe_exec_queue *xe_migrate_exec_queue(struct xe_migrate *migrate)
 	return migrate->q;
 }
 
+/**
+ * xe_migrate_vram_copy_chunk() - Copy a chunk of a VRAM buffer object.
+ * @vram_bo: The VRAM buffer object.
+ * @vram_offset: The VRAM offset.
+ * @sysmem_bo: The sysmem buffer object.
+ * @sysmem_offset: The sysmem offset.
+ * @size: The size of VRAM chunk to copy.
+ * @dir: The direction of the copy operation.
+ *
+ * Copies a portion of a buffer object between VRAM and system memory.
+ * On Xe2 platforms that support flat CCS, VRAM data is decompressed when
+ * copying to system memory.
+ *
+ * Return: Pointer to a dma_fence representing the last copy batch, or
+ * an error pointer on failure. If there is a failure, any copy operation
+ * started by the function call has been synced.
+ */
+struct dma_fence *xe_migrate_vram_copy_chunk(struct xe_bo *vram_bo, u64 vram_offset,
+					     struct xe_bo *sysmem_bo, u64 sysmem_offset,
+					     u64 size, enum xe_migrate_copy_dir dir)
+{
+	struct xe_device *xe = xe_bo_device(vram_bo);
+	struct xe_tile *tile = vram_bo->tile;
+	struct xe_gt *gt = tile->primary_gt;
+	struct xe_migrate *m = tile->migrate;
+	struct dma_fence *fence = NULL;
+	struct ttm_resource *vram = vram_bo->ttm.resource;
+	struct ttm_resource *sysmem = sysmem_bo->ttm.resource;
+	struct xe_res_cursor vram_it, sysmem_it;
+	u64 vram_L0_ofs, sysmem_L0_ofs;
+	u32 vram_L0_pt, sysmem_L0_pt;
+	u64 vram_L0, sysmem_L0;
+	bool to_sysmem = (dir == XE_MIGRATE_COPY_TO_SRAM);
+	bool use_comp_pat = to_sysmem &&
+		GRAPHICS_VER(xe) >= 20 && xe_device_has_flat_ccs(xe);
+	int pass = 0;
+	int err;
+
+	xe_assert(xe, IS_ALIGNED(vram_offset | sysmem_offset | size, PAGE_SIZE));
+	xe_assert(xe, xe_bo_is_vram(vram_bo));
+	xe_assert(xe, !xe_bo_is_vram(sysmem_bo));
+	xe_assert(xe, !range_overflows(vram_offset, size, (u64)vram_bo->ttm.base.size));
+	xe_assert(xe, !range_overflows(sysmem_offset, size, (u64)sysmem_bo->ttm.base.size));
+
+	xe_res_first(vram, vram_offset, size, &vram_it);
+	xe_res_first_sg(xe_bo_sg(sysmem_bo), sysmem_offset, size, &sysmem_it);
+
+	while (size) {
+		u32 pte_flags = PTE_UPDATE_FLAG_IS_VRAM;
+		u32 batch_size = 2; /* arb_clear() + MI_BATCH_BUFFER_END */
+		struct xe_sched_job *job;
+		struct xe_bb *bb;
+		u32 update_idx;
+		bool usm = xe->info.has_usm;
+		u32 avail_pts = max_mem_transfer_per_pass(xe) / LEVEL0_PAGE_TABLE_ENCODE_SIZE;
+
+		sysmem_L0 = xe_migrate_res_sizes(m, &sysmem_it);
+		vram_L0 = min(xe_migrate_res_sizes(m, &vram_it), sysmem_L0);
+
+		xe_dbg(xe, "Pass %u, size: %llu\n", pass++, vram_L0);
+
+		pte_flags |= use_comp_pat ? PTE_UPDATE_FLAG_IS_COMP_PTE : 0;
+		batch_size += pte_update_size(m, pte_flags, vram, &vram_it, &vram_L0,
+					      &vram_L0_ofs, &vram_L0_pt, 0, 0, avail_pts);
+
+		batch_size += pte_update_size(m, 0, sysmem, &sysmem_it, &vram_L0, &sysmem_L0_ofs,
+					      &sysmem_L0_pt, 0, avail_pts, avail_pts);
+		batch_size += EMIT_COPY_DW;
+
+		bb = xe_bb_new(gt, batch_size, usm);
+		if (IS_ERR(bb)) {
+			err = PTR_ERR(bb);
+			return ERR_PTR(err);
+		}
+
+		if (xe_migrate_allow_identity(vram_L0, &vram_it))
+			xe_res_next(&vram_it, vram_L0);
+		else
+			emit_pte(m, bb, vram_L0_pt, true, use_comp_pat, &vram_it, vram_L0, vram);
+
+		emit_pte(m, bb, sysmem_L0_pt, false, false, &sysmem_it, vram_L0, sysmem);
+
+		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
+		update_idx = bb->len;
+
+		if (to_sysmem)
+			emit_copy(gt, bb, vram_L0_ofs, sysmem_L0_ofs, vram_L0, XE_PAGE_SIZE);
+		else
+			emit_copy(gt, bb, sysmem_L0_ofs, vram_L0_ofs, vram_L0, XE_PAGE_SIZE);
+
+		job = xe_bb_create_migration_job(m->q, bb, xe_migrate_batch_base(m, usm),
+						 update_idx);
+		if (IS_ERR(job)) {
+			xe_bb_free(bb, NULL);
+			err = PTR_ERR(job);
+			return ERR_PTR(err);
+		}
+
+		xe_sched_job_add_migrate_flush(job, MI_INVALIDATE_TLB);
+
+		xe_assert(xe, dma_resv_test_signaled(vram_bo->ttm.base.resv,
+						     DMA_RESV_USAGE_BOOKKEEP));
+		xe_assert(xe, dma_resv_test_signaled(sysmem_bo->ttm.base.resv,
+						     DMA_RESV_USAGE_BOOKKEEP));
+
+		scoped_guard(mutex, &m->job_mutex) {
+			xe_sched_job_arm(job);
+			dma_fence_put(fence);
+			fence = dma_fence_get(&job->drm.s_fence->finished);
+			xe_sched_job_push(job);
+
+			dma_fence_put(m->fence);
+			m->fence = dma_fence_get(fence);
+		}
+
+		xe_bb_free(bb, fence);
+		size -= vram_L0;
+	}
+
+	return fence;
+}
+
 static void emit_clear_link_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
 				 u32 size, u32 pitch)
 {
@@ -1912,11 +2035,6 @@ static bool xe_migrate_vram_use_pde(struct drm_pagemap_addr *sram_addr,
 	return true;
 }
 
-enum xe_migrate_copy_dir {
-	XE_MIGRATE_COPY_TO_VRAM,
-	XE_MIGRATE_COPY_TO_SRAM,
-};
-
 #define XE_CACHELINE_BYTES	64ull
 #define XE_CACHELINE_MASK	(XE_CACHELINE_BYTES - 1)
 
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index 9b5791617f5e0..260e298e5dd7f 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -28,6 +28,11 @@ struct xe_vma;
 
 enum xe_sriov_vf_ccs_rw_ctxs;
 
+enum xe_migrate_copy_dir {
+	XE_MIGRATE_COPY_TO_VRAM,
+	XE_MIGRATE_COPY_TO_SRAM,
+};
+
 /**
  * struct xe_migrate_pt_update_ops - Callbacks for the
  * xe_migrate_update_pgtables() function.
@@ -131,6 +136,9 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
 
 struct xe_lrc *xe_migrate_lrc(struct xe_migrate *migrate);
 struct xe_exec_queue *xe_migrate_exec_queue(struct xe_migrate *migrate);
+struct dma_fence *xe_migrate_vram_copy_chunk(struct xe_bo *vram_bo, u64 vram_offset,
+					     struct xe_bo *sysmem_bo, u64 sysmem_offset,
+					     u64 size, enum xe_migrate_copy_dir dir);
 int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
 			     unsigned long offset, void *buf, int len,
 			     int write);
-- 
2.51.2


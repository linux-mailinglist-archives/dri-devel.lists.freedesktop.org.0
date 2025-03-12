Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCAA4A5E7DA
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 00:00:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAA1A10E1C3;
	Wed, 12 Mar 2025 23:00:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l4a0aJSk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6852B10E2BD;
 Wed, 12 Mar 2025 23:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741820439; x=1773356439;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=UG8SDRTdMY35/RmsG2C1YUrhSLn3mXedVDVTK4LI1vw=;
 b=l4a0aJSkambJjRrtiJux3RfPqH58SuylApHSfvr1EOdY4Ww6QMl6EoGc
 rm1hGMBfEA4Qrvqz28GA4O+0uSNN1vR+vCZ3Q9ZvwBfc2UZtIaIMxyboy
 JyGkHrS1QSz4nayLUBpxZfnCDqWcwB1en3EMzx+X6806K513L1eUVJQ+D
 ECTCPFNjOp+SbCt3Rm0jKN6RWV/tBfeSbo2PdIVW4nY7LJyy7WiaXM3QL
 zT7hIdfsmeLmqFeXdiNl194IgsFKtIkWQ7kh1eEWJFPcIUmo64Q2jUkF3
 ZrYvKAlRtnbvj8xqueYybWKv6vnUfP4jnWk0J3BrWNDUCH3Lx4zYoA2cW A==;
X-CSE-ConnectionGUID: sbCdOsnGQO2dZLwzjMmYug==
X-CSE-MsgGUID: sdNsj9d7RFyG5/o53YwcfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="43103733"
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; d="scan'208";a="43103733"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 16:00:34 -0700
X-CSE-ConnectionGUID: QOJlbxulTj6ExUgKLgDUvw==
X-CSE-MsgGUID: 7AqbGxbvSy+vxi/Rvpe5tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; d="scan'208";a="151604410"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 16:00:32 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 12 Mar 2025 16:00:31 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 12 Mar 2025 16:00:31 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 12 Mar 2025 16:00:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ouHepg0kTNS091dxx/uXpT92fP1P4ugw2PiikzL2kz2Bd+fuYPLK2fGFAdwyzUFWuf3DqIHMBZvZfi/SkA+4fyMYKpF2sKSdyUhad7j327hJN5vqr3dlJQ86NLY6uZ3uu56/RIBAyuJ8JqJ6stUSBQf4vKdajtjVo0zGxWXqUJRdFCrmeUkEHt6R5QA92eiW/A3fr7+uf1e+1ulz5NtBnAmFkE6k3+H8nhszrTv+eL7AwXN5LP5KIhYMzyyNEoIrLVL99i2YgT+C7/RjphqhiIeBDBssDVOBWxR6LqHFzbUNezFrvM0F5bKMlftnRXNBLx3pIgD8GDLRDvA60T8WZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OkVth50QBNwntE774hnUZypjg4Ly6a2HtPnU6ImscbQ=;
 b=l7WJPbtoe4Y2sWuOOdz3t2BFevaS8wqacdJ8lluIQMcXKpc1SBwudj4JHG3lvrE5ws4BrePQRPu5ryNF6CqX+Qui+kXIO3VCBctordfKw/5T0dRdqrofD15oVIrkB9KuPzRIFWg0hMevQzbskypj/dtsc7QEGAs34uzSEtSk59D2VqhzXvVZMJProkPxxItkK9K54wpFxR9KhVBiy7SMWl8kak3sJhjTpdeWVAYHJwHrSOjVaFYI1e6H9ccuZ1G4oBp66QOg6Dc91OOFykCC6YS8mWq9vYYs4sD1yPJ8R8oBMIvypRgRwlEt89o9UrM/ZVnGm3IWAvjSp8e9tAapsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SA1PR11MB6735.namprd11.prod.outlook.com (2603:10b6:806:25e::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8511.27; Wed, 12 Mar 2025 23:00:28 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%6]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 23:00:28 +0000
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
Subject: [PATCH v5 0/6] PCI: VF resizable BAR
Date: Wed, 12 Mar 2025 23:59:43 +0100
Message-ID: <20250312225949.969716-1-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.48.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MI0P293CA0002.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:44::7) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SA1PR11MB6735:EE_
X-MS-Office365-Filtering-Correlation-Id: c9730136-e236-4d16-7d25-08dd61b9ae3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bDNtQWpuM0YxRXVnYlVudDgzMCt2NVBlT1NkUnQxOFUxODBYR2RxZ1BabnpQ?=
 =?utf-8?B?bENJVk9CdGlBVXRFQWZpbHZpUlM0TTJjTTFsa1N4VnlLR2szcCtJazlpSlBH?=
 =?utf-8?B?c1ZaRjNFdjRvRkFxM0xyUHo2ZnNRNHFTREZOa0RueW5kK0g4TCt2VmZOc0Uv?=
 =?utf-8?B?bmt3SEpLQmxNQURQZmlyUGErS3NnZThqTTltUmxhOTRKdndOMnR4dUdiTXRO?=
 =?utf-8?B?Z1F5WlljRE54MVlnSVNGcnduakRIY3JSbXUvZTdISjlncmdoOXR3TWpPMXQ3?=
 =?utf-8?B?TXNaVVdvMTNFUTkramZtMnlMS2U2ajlVVXJhUWRTc1BiQmdpNUZPMkdRQ1Qz?=
 =?utf-8?B?NENXR3hNblpYVzJzV3pvZUV5SzNjbTU5VENoaDVPSVc4RVpQcUI5MnRUSm5M?=
 =?utf-8?B?UHVHcTNkbWdVM1phOTBLdGZJVWg0RldkT1c5L3R5eHlnNGFHRXJOSlZpSEs1?=
 =?utf-8?B?S2MyNlEzRWREYVQ5cFRTVTRNenpyNWtBWkJWK1pTYzFRTGpHRjUxL2dvdmsw?=
 =?utf-8?B?SUcyREptMXRuVFFaRU83Y2IzTlFpNFk0OWsyRS9RQzEvVFh6Qm52c0t2MWU0?=
 =?utf-8?B?cVB6T2hmKzQxMHFtV1JVOGtFZUVqQVdsaFdBQi80Z1VmMG1Xd1dMSWdFaTBM?=
 =?utf-8?B?U3dJeVJvTnQzdUI5cXppQWI2d0RJSWNnczNPbmpWWjFmNDViMElEVGljb2Vy?=
 =?utf-8?B?Sk5yT0pnZEw2ajVsZWVBYmFaaUdaczhjUHZtaXlrcDJacEFNaUswTTB1K3Bw?=
 =?utf-8?B?bDBXdWtaNXdwYjUrR1ZDbCtIbWduakd4eU1mWWNZRDc4WWUxa05ZZExtcXAw?=
 =?utf-8?B?VGxVcXZBdU1FOEtFbEJod2UxeEJnazc3VUM1dU00bDVGZktEaXRndTFSNVo1?=
 =?utf-8?B?KzdPZ01EbElRTndZc2FldGRLd3J6WFJ2Z2lOVWxRS0pmT0dGMVIrMWp4QUgx?=
 =?utf-8?B?dWlQSEpEVjlzOGZHcks1RHFCU2wzTVdnclRrQjZPWVo1SjJIa05lbTVjbjM5?=
 =?utf-8?B?Zys0UkxzOEVDUTZSWXJTcHVoOEVUclRBWDFmSVpGNWVjeWFRMlgyL1E1cUV1?=
 =?utf-8?B?dkQ0bHNHMmJJM0h1T1Y3R1FUalk4Y3ovWUlJT0xiSHVuTStReWdJWnVDWE10?=
 =?utf-8?B?S0hRL3RJZVlWZGdNajY3dXBZV1NzbUozcm41SUZRL0c4cGtMTkhMcVVZcXlN?=
 =?utf-8?B?TzFxdHNaSjlvODYxWDFqR0VaOEMzSGdtTkRQUDIrLzJOU1phT3pmQzg0OHZh?=
 =?utf-8?B?YnJmSGlIS2tiN0R6NCt1cVVJd1ZIM0dqSU5ISCtVek85SFhSQUh3MjdxOVp4?=
 =?utf-8?B?R1RxUDdnUHB0alJXZWJpS1Zpc3NGaHp6RkxSTmpJMERMWnE5WTlXd3ZpcUdG?=
 =?utf-8?B?a0gra2U1VTBRMU1aR0dLZ2FHUVE3Y29EU2ZISWpNclVrNHNYeW01MXdnK0xE?=
 =?utf-8?B?M05ZVnlMNnhTdWl1NlVYRUVySkZrN2s2VFJmQVR0eWxNMUlsOGVoNFdIbCtB?=
 =?utf-8?B?RWRJaG1pNFlpOXhaaWhJWENXWlFVQnRoVkc0clduaVpOc0QwWlRqdHFLaFNR?=
 =?utf-8?B?MTdieENxYU1XaEQvR09jMXJpMkFrbDNBRGYrYmczVVVTZjZUSHdTenZ0cUty?=
 =?utf-8?B?eFk0eDROS1gvR2Z2Uk5IOVIzYUVsY3BkeU5YRnJyckExSFFXcTRzWjVQZnJr?=
 =?utf-8?B?dTJwRW5UNDRYTXZLeWhPbDFXbTJLK2dUUE43VHBySjRSVVFJeFFDU1VZKzgy?=
 =?utf-8?B?QnNiUFBReVpOS1VrZXpRRUNmZU96bWxIV0t2NFA1WUtMaENVcDhabDEvbDdy?=
 =?utf-8?B?Wk0rOE5kNHV2amx2VElrU2QwbnJuODdIdFhidEE2WUFUNnFnZWhIdE0zQnFS?=
 =?utf-8?Q?/lmsWmxddark8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dlJJZW01WFRsYjJpbGJmazdKd0NQN0I2WklqdUlrVDdMRWpKK083U1hqZXNq?=
 =?utf-8?B?YXVPT2NXOFM1MWloTng2clp1VzExQWEwNlJLZFR1UWU4ajVZaEpSREl5RE15?=
 =?utf-8?B?ckNJOXdmZ3hhSUxYNG5RYlRkOFNDTHFJQ3pWWmhkNVVFMHpkRVZ0bSs1azlv?=
 =?utf-8?B?aTBZeWk0LzREWkJvOWd3ZDZMdFhlMUFPYmZPNVhEbkxnMGk5U2lnVmFYajFK?=
 =?utf-8?B?T2FhcHB1aWcrdXVnV1docklCeDVwdDdxU2pWd3IvZytwdHZBWlk4VENoaG03?=
 =?utf-8?B?b2JRVEFVcXh5akFSYzFvNTlHcWZ4MTIvZFR2WG1TWTVzQytOL2NCcE1rVmw2?=
 =?utf-8?B?L0J2cnE1NUJIZzQ0OGo4ODFpWVF0UjhNc2pYRldwdHlvc3ZGZ3VYOXRxUW11?=
 =?utf-8?B?R0ZVcE9QVmoxMGorOUd4SHlNaGdSeklEdThFSkNhNlllN1BTWFRZa2JBSnFW?=
 =?utf-8?B?SjYyZ2YrblVpVFE4NjBYM0RDQzBrZUEyWTFUWnF3RjlCYmo5cnozZnBDV3VM?=
 =?utf-8?B?UU9jRWFSTVZQQklnUEJBMDZxbVB5SGZrMkVLTGdFYTFJRHpxMm0rNXJiVU5H?=
 =?utf-8?B?b2VSeVF6YjRFZlcrUmZBMHJqdjlIYURRSVVTRkljRTV6TEdJK2I4YlFEVlNX?=
 =?utf-8?B?WkxzcnJ3L0lQdlNjOW9RWkg4MmZGMG42TnlyWnJjUHlkMlQ2eWRaeWVDam1p?=
 =?utf-8?B?SFVIMHNqSngxaWVRSllrZkwxYURBdGp0eVZ6UHJPRVFyNHY2c2VCVDZEOUl5?=
 =?utf-8?B?MnZXRTZtZUdyOE0vQXRaNW9iRTE3T3FhY1h4UVh0Wlh6aGFnUzVSTitpd1lI?=
 =?utf-8?B?eFlHUVltTFp4RlNVNWpSODRjUzhkQnE4bGMvRm5ZVWZ1V21WT1g2dTQ3dDJs?=
 =?utf-8?B?R2FRK0pDdWFHckU0S0RhYytzYUVaQlBRVllsLzlIQjNDZ1dybldrcU5kNTRn?=
 =?utf-8?B?c1h4MHpkeVgwcUhNN3pZM1JEZS90Ymp0ZHlhVVp5OGx6cnVBUTVzbGhUbjNr?=
 =?utf-8?B?Zm9TaEFjbzl0SjcxUC9MdndBcWZLeWkzTnJpRTJacDdHclJ0R0Fva2o1WVlC?=
 =?utf-8?B?M2NhUEtMS2lkaE5VMERvR3hsbDYrako4bm1ZeEtKSFpoNHNUSTF3eXdVN0l5?=
 =?utf-8?B?VmVlYmQ0ZjBGdG92L2pFMjZXTzRISlRNMWhubU5TVTVyMS9qdk05bWYwK3ZJ?=
 =?utf-8?B?bGtBbXN4bzUyanhyNm9Bc1AyQUFWRDFobExkNStZb20waE1BbkdUem1sWEsw?=
 =?utf-8?B?UU5MOUdsMEJlZlhtWXVPcmp2MzJ5bGdldzliSXlpWkhOTS8vbVQvbEV2bXN4?=
 =?utf-8?B?Qys5VEEvajlxYzhTNS9nUjdxYWVaTTcrMzNPTVJCMFVaVUlxdEh1MDMwdmFV?=
 =?utf-8?B?Y3AwQ2F4M0IvUE5tckx2dFVlWWpvS0FZdlFBNVdWbE1UTFp6TlZMSUdJK2ph?=
 =?utf-8?B?VExWWTN0NHNmSU5qd2dsVStNOEY0cWNGN1o4cU5UZ1VONEpnaFRGZ04zeTFJ?=
 =?utf-8?B?OENkeTVtWHRPLzVCbDg4VDZsOWl3RFNpd1VuazJDdldVQkIrTFNNZUNQMURU?=
 =?utf-8?B?czJKeDdnWXc4dHN1ZUNwUW0xOTJuc2htVXNlSEZRTThUTXhtMC9NMTNwVkJ2?=
 =?utf-8?B?UUlVK0pidkJvMDF2dC9nMTg0NjIxN1ZWOEtVVThTVHdtY21oRjNwd2hndlRp?=
 =?utf-8?B?MlpEMjBMVElPT0FiaXRRY2l0TjdYaVdXZ1E0SXg2RGl1T25NMXNUNVpmTXdR?=
 =?utf-8?B?dHFtMEZQWG5qYkZmbVpndlZubHUxdjdiWndYb28rMlZUN245bklxenYyb2lN?=
 =?utf-8?B?bFRmSnFneFliN2hiWVJ6dENGbVJhV2szeFM0RXA1V3k3Z1lEZU93eFMvSjJk?=
 =?utf-8?B?Qlc0ejFRVnhwWjYvSmZIbTdKSXRUUWRKalZFZWU2NFV0NWpSRHoyNTAzN1lQ?=
 =?utf-8?B?eC9OU3BnWkpldWJkNm5ERDBBcGkwQ20vbmlGL2VnWEZDZ0hZUUNJQkxnU1cz?=
 =?utf-8?B?V1ZFaGwwUzZqNno0YzBnVmNwMWI0MDlRQTFCSUVpaC9INkRKTlNQOEtHZzBn?=
 =?utf-8?B?YUZvUlJQS0lXaUx2WXhVWjBoem9Oak1CanJCZy9XVmJ1MnZkZzl2TisxWWJX?=
 =?utf-8?B?WSs4bjhJbGRhWm1abDNJa092Y1pCM0xGNEFwZFoyYlI1UENDNTFNbmtSMWNa?=
 =?utf-8?B?a0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c9730136-e236-4d16-7d25-08dd61b9ae3e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 23:00:27.8738 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ncNWkb3YPaTDdAu21a3Jqwm90PKI84nAVxUzZTrVWM4qOSHpt+QkrAMpBEtyk8ftPGnd7ctIIOeOYAvOkACkZ3+MnPmAok2++XR4bAkJpq4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6735
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

Hi,

No major logic changes since v4, just a few tweaks to docs, commit
messages and function naming.

v4 can be found here:
https://lore.kernel.org/linux-pci/20241025215038.3125626-1-michal.winiarski@intel.com/

For regular BAR, drivers can use pci_resize_resource to resize it to the
desired size provided that it is supported by the hardware, which the
driver can query using pci_rebar_get_possible_sizes.
This series expands the API to work with IOV BAR as well.
It also adds the additional API for drivers to change the VF BAR size
without resizing the entire underlying reservation (within the original
resource boundary).

Thanks,
-Michał

v4 -> v5:
- Rename pci_resource_to/from_iov helpers and add WARN if called without
  CONFIG_PCI_IOV (Ilpo)
- Reword kerneldoc for pci_iov_vf_bar_get_sizes (Bjorn)
- Reword commit message for VF BAR size check, extract the additional
  size check to separate conditional (Bjorn)

v3 -> v4:
- Change the approach to extending the BAR (Christian)
- Tidy the commit messages, use 80 line limit where necessary (Bjorn)
- Add kerneldocs to exported functions (Bjorn)
- Add pci_resource_to_iov() / pci_resource_from_iov() helpers (Ilpo)
- Use FIELD_GET(), tidy whitespace (Ilpo)

v2 -> v3:
- Extract introducing pci_resource_is_iov to separate commit and
  use it elsewhere in PCI subsystem (Christian)
- Extract restoring VF rebar state to separate commit (Christian)
- Reorganize memory decoding check (Christian)
- Don't use dev_WARN (Ilpo)
- Fix build without CONFIG_PCI_IOV (CI)

v1 -> v2:
- Add pci_iov_resource_extend() and usage in Xe driver
- Reduce the number of ifdefs (Christian)
- Drop patch 2/2 from v1 (Christian)
- Add a helper to avoid upsetting static analysis tools (Krzysztof)

Michał Winiarski (6):
  PCI/IOV: Restore VF resizable BAR state after reset
  PCI: Add a helper to convert between VF BAR number and IOV resource
  PCI: Allow IOV resources to be resized in pci_resize_resource()
  PCI/IOV: Check that VF BAR fits within the reservation
  PCI: Allow drivers to control VF BAR size
  drm/xe/pf: Set VF LMEM BAR size

 drivers/gpu/drm/xe/regs/xe_bars.h |   1 +
 drivers/gpu/drm/xe/xe_pci_sriov.c |  22 +++++
 drivers/pci/iov.c                 | 155 +++++++++++++++++++++++++++---
 drivers/pci/pci.c                 |  10 +-
 drivers/pci/pci.h                 |  28 ++++++
 drivers/pci/setup-bus.c           |   3 +-
 drivers/pci/setup-res.c           |  35 ++++++-
 include/linux/pci.h               |   6 ++
 include/uapi/linux/pci_regs.h     |   1 +
 9 files changed, 243 insertions(+), 18 deletions(-)

-- 
2.48.1


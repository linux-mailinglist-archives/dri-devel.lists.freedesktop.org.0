Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6638AA5EC0
	for <lists+dri-devel@lfdr.de>; Thu,  1 May 2025 14:59:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83EBF10E82C;
	Thu,  1 May 2025 12:59:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Xmk7KkaC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2055.outbound.protection.outlook.com [40.107.220.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED7D510E832;
 Thu,  1 May 2025 12:59:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C+RFH02scLdwRhQUjn916hLRL402Q2FelvTZuUtHnfAYw2lVIiKDtZEsa5/mDu4dxfJc/oPEQDDS82jK+0hbewypPJ829aFyvS8wtLjlJmlipCLZsDB4eCnlyVMXmiRid04VPWmNUam9qAvO+Hs+XzrhCnSOarhVl8MOFfxo1rSyql1acdoHVehHGzycauWfVe9CuFp7nIcXUFgOCi07I7mOfjt7+5ACLgl3RC8dqbgZhbv42HipAdICAJ0ooDvbdPVqD2w4QmkLetiThcgyAP55DJ4Xat+0Er2aqvoYcUs/vvkrsMdZM9vqxoxqjB32kmZVoiiNPwKmufUwt2Rdfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rJC7QTqq6KHNq9JHCjj/L5KRT1piKslvi9h2FXsUrQM=;
 b=Cs+H7wO/31K8LEFKmwSQ3HRrkI3TsdHpoGYCs+3E4LCt2jpgw3ddFWbqjWQNMofUfpdPjvSBe4+H50WLQrELSdmm25TVpzpUYAvIYpAC043G86aouGsvgE2A3+JNgpTEGBBqPbqOVSzrxkibyXmH0FTk5t/6n6aFQm8tZGLG62c8oylfVebA8OGeCKqnqtDi+5fBUPMdMZid70RyK7OdHHK8W3Z0PCwC1S190sCUsK9vyrXkKBJbIEJodwl/vUcfiXn9N4KMxKIV07t8CxRBgeMfAvtsyN7tXPjDCxkdK7hQTJ5QGW2WAQrqcCqLbe+D5qEhPid7on5VlbJelzelFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rJC7QTqq6KHNq9JHCjj/L5KRT1piKslvi9h2FXsUrQM=;
 b=Xmk7KkaCxs3WqkDE2KlkHyLKhZnLb0XJl5lsMbiRnpTpnGgBTPWZYxuaSLoJ8NpkAThBTef4yp/3OzP0OrLhf19mQSDcPKDi/Npv25wBzuSLK73Ui8YwJ6le+RlqTMKDz7qmvLYO9zdWfeNC+47lYcD8QPORutgm2cOslzrxBCdTllRR4/MaXfHf1Aya/MXhjS1c84UF5EBVEJZ2gwJFTNvL1hDDeP4b/KqoodJeBwR1Hf6+AC7cUc0EdCz/AJKIvRXlOhFEQujHDSEdYQirsCkp5bI7UAZTSHihT6acqXVUriueQlD52qWfibgZlmkyreQ6yfRizRtZzKuWuUCT5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB6442.namprd12.prod.outlook.com (2603:10b6:510:1fa::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.29; Thu, 1 May
 2025 12:59:16 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8699.012; Thu, 1 May 2025
 12:59:16 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 01 May 2025 21:58:26 +0900
Subject: [PATCH v2 08/21] gpu: nova-core: introduce helper macro for
 register access
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250501-nova-frts-v2-8-b4a137175337@nvidia.com>
References: <20250501-nova-frts-v2-0-b4a137175337@nvidia.com>
In-Reply-To: <20250501-nova-frts-v2-0-b4a137175337@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP301CA0019.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB6442:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cf6f3eb-e40c-4ed2-fdd2-08dd88affad5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7416014|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Mk1qMlVjUXhxN2RtZlp3MzMxZHFIbFJqYlVadlA1TzA0YTJzUFBGdFViZW5S?=
 =?utf-8?B?dHZXRThHamdYdnZWdDNDLzdvR2tQdTcrZU4xeXFadG5ubzB6WkUyTmovOUgr?=
 =?utf-8?B?NUNJQXBtZHY5N0d5STRvcGJPU2tzVzJxV0NFOXFRSXVpMUljZmFucllQSjFW?=
 =?utf-8?B?WWpXMjdPejFQRGFGQmUraHdlbFVkWGhPMHlWdEFrQTlVMDhzRzB4SFlLM2Jr?=
 =?utf-8?B?aEZyMStqQnFITkJqNGpBZXVqWUVJbmlobXdOQ3NGbmdBS0xjZXRMQmxuVkt1?=
 =?utf-8?B?T3VMNGJ1MW5VU3pqelN5akw1R0c3Z3Zob1VxUHFNd1RJbkIxUkphVmt1WGdh?=
 =?utf-8?B?ZnlBMFNaaHl5Z3IzWWd3Mlhhb2JYMnRBMlR2NFJBTU5rQWg1UE8wTVpwaS80?=
 =?utf-8?B?YWJXTm9QNm03b01wenR1NnBEcUdOTlhOQy9WcG41YTE5M0Z5OFJ5NXA1dnEx?=
 =?utf-8?B?NU44RWpuYUs4T0FlNmVtNkRkUThXeGlGeWFKOUNxY0ZDZitxMHFmMzQzaUs5?=
 =?utf-8?B?SUtueWlQNEVWaUdLTG1UMjR4V211bk1nWHI0aWxhWWFtazZIMThTMExrL3FL?=
 =?utf-8?B?TkdEd0ZxTDQyaXViMEw0S1FOT3dmWklOTnN6OXVOcksxcERtSDhySlpVWjZh?=
 =?utf-8?B?cXhJVkE3bHlCdkVveGhXMElIUlNIYnA1TitJZWpPMU44M0JJL2R2aGI3Wm51?=
 =?utf-8?B?OTFuQ0JsWDNxby91OTBpK08vaDVzanU5TnU1TmdmQXVoNDlGejRGcVNDYXJa?=
 =?utf-8?B?ZndDc1ZLQ01aMjhkR0RMcnpaL1hSVGhUd1RqbUNsT1ZIQU1kYmVaMnNTMlIx?=
 =?utf-8?B?a0xrR0pHekUzc0hoOW96TXNnSVZwZmU3Wjl6MlU1V25FZ1lxOUlhWDcrcC9y?=
 =?utf-8?B?eE9xbkZUM0llbTVlNXZmNmpxUDhITUtmMi9VRmpoSVdGSUd4RitkVFVtcTdt?=
 =?utf-8?B?czBjcGVOenRhQzh6b0VYSEpUamNvb0ZRcnRCWiswTytiSFJpRXVXNG81OTRi?=
 =?utf-8?B?TTdvaHQxeXUzbjdUdmlSUGZUazVUd2I5ZXZEWlpablhFK0J5MTQ0eFZvU3kw?=
 =?utf-8?B?S0p5NDZGRHJreC9ZNXZCNnlnVHNLMnlQOU5uL1VLdzRsSkNuRWRqdzkvNy9m?=
 =?utf-8?B?Ylk1VVZZZHNhd0xMUWtMeFNmV3FRVmRza1htL1h6eGRYNDZCY1VpT2V4aTlS?=
 =?utf-8?B?a05sRFlsakVHWFl0SUlkSEUydTBJUHBsTWQ5RkQ1R0JhaEVjSmNObXFzeXBY?=
 =?utf-8?B?ajZiMWxvamZjQStrSDVEN2s0VTZHa1RaYWNGMmlNRXFoU3ZNNFVXYUUxNGdv?=
 =?utf-8?B?cEdUWWtUaWlVQW9XRm9hbmJsTkxLZEpJRUxTc3ExMmlaZ2I5YUlYL2ZOMWdm?=
 =?utf-8?B?Mzc3L1puTTN1bDFjUTNZa2p5aWxhQUVaN1JNTy9yOEVLaStTTVZJMWFYa293?=
 =?utf-8?B?RWlucVJLczhBWkVaOGF4RUs5WElxVThLdG5yc3JCOG5RUC95MStDRWVJUkJj?=
 =?utf-8?B?YXlvOXg1dG1PL2x3ZEkzY3pwRkZhN1IraCtaL3Z3aFF2OUxwcVd3cmFZcjVs?=
 =?utf-8?B?MzZKUHltZGtjRHAvYjNIcmNiODdVKzQ3cDFmN0pHa2dNRVZERm1zQUYzNXZN?=
 =?utf-8?B?dCtubjVCdG50WFRYTmJFMFVqWmYxN0pPWFBwbEdEb1V3a3MvNDc2ZmhDWWxs?=
 =?utf-8?B?VGtXVzdPc2txOXZtK3l3MS9zcHlEd0Z4NkxtaGJJZmlPN3o2NlhHMEhWNXhh?=
 =?utf-8?B?T2xtRy9FN0NTdFVRUXZRcGYwTDhFajRJYStYbkM5OWNVa1lGRWlMNWo4Qnl4?=
 =?utf-8?B?dzFETmtvSy9tUHNqN1pFNmUwbVhWUFNMNTZGQllBR2lobHBKZjNrMXRMU2ty?=
 =?utf-8?B?VUZIQXhNRjU1c0Faa2FERENlYktJSGdhcVRpT3JJa0hyOWw5WDQxRG4xemh1?=
 =?utf-8?Q?wXfN+KwxvW9ax+mKiGE3757AQswifFSr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7416014)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?amtDOHV1US9WSWk2RTA4TWV6ZGVIanFVQ2VQa05BNG5lTHRUODFyei9raC9j?=
 =?utf-8?B?b3lPc0NsNEc4Mys3eHVHc0Z0b0MvY1pZOS94aVVGTnpMeFRqU0FyNmhWckxX?=
 =?utf-8?B?T2xIVDRGL1I0QThGTHFOS1Zyend4Ly9IRU80K1gwYU9XdkpKN1h4N3pEdk10?=
 =?utf-8?B?ZXBDTnhBVGlIUlVlSElEOW5DMks1MXlYSWNybUV0MmRWZXdSSzkwYTNnTUJj?=
 =?utf-8?B?NWQzZGM3QmRZMlFzUWEzUTI1cVFIZVJpcVY3bGwwa0Nrb01sZ24wMFhjWWpt?=
 =?utf-8?B?Mk1KQjBMK0RHRnNwTHk0VitHK2JlQUZiTU9lQ1UyeXU0alVKSlI2Z0hIMkF6?=
 =?utf-8?B?VUFTT1paV0t0d2p6ZDRwOWx3V2M0TEhEVy94RGgxNXJudzVUT1BvMjhxN1RH?=
 =?utf-8?B?azl6SEt0S1UxdTBYTVJvUkJyL2ErdE5zbWI2aUFxbnFFS0VXSzlURytJUEZy?=
 =?utf-8?B?L3RubitRbWFDSG9oYVBHNlFSTWx2MktSM0Q3a3lHNUtSYldTa0tBRVluMFBS?=
 =?utf-8?B?ZDhVempMeUEyeHk4RXZLTmJrR2pEeXE2TmVPVzdFdFVVc3ZEM2E4ODlQMDcx?=
 =?utf-8?B?ellXWnFTd0ROQlA0bnJQN3NueHpMaEZaa3hGR2NiOENWdHZHMVNkbEJmQnQv?=
 =?utf-8?B?K0dtZWh5KzZWV0VkWHpqd3JrRkZCSE1kd2lQbWhJa0dHV3MwdTU1eWpjL0Ez?=
 =?utf-8?B?YVlWRUtLRW5VNXNHMnFMc1NTQ3ZNRE1LSTFRZkN2VmdGamd6UlhoQUNTRk1Q?=
 =?utf-8?B?dE9obVY0NXR5d3ZpNHp5K0dWd1F1UHF0aCtMN3hqdHlqS1k4d2JYekF6S3I1?=
 =?utf-8?B?ZytpUThZUG5PSFovTUljZWpDZ1lwbEZUNHNWNndFNHpsdGNwSzR2TjRLVjlD?=
 =?utf-8?B?cENmcEJnS2VKNHZRVWt5bzVOODdKZy9SaDJIUWlwVjVIdHhuQXZ4Mnl6Nkh4?=
 =?utf-8?B?SVFwZkJYaXRHUERZd0ZjRHlWL215ekZkM2tVQytHV1poNnp2YmVROWVIR2Rx?=
 =?utf-8?B?dVJkSlM2MlIwNVlWamdHOGFvMFJMcG9ZQ002Zy9VV1Z3ekNsVXhJQktTeUhP?=
 =?utf-8?B?bnRNYVMwTjhEeGlPY2ZpR2JFM285aVVRR0V1OGZzYVdCWFlHUmdobHcwZEN1?=
 =?utf-8?B?QVhwK21rRjNPMjkyMDJqMlRoRHhGaVo2Z2o0cjJpMm1XaVZPckp6d2V1eFNa?=
 =?utf-8?B?KzM0ZStLVFZ5OEQvYXdRN20zc0h2Rm0veEdlWEFGamYwK3RjUmRSaEhCWnYz?=
 =?utf-8?B?bTFkRXg5UTY4YWRMZ2VLTFRrZ0NQVEdqZFdRRjFjYlgyb0tkWDNacGgvVFMz?=
 =?utf-8?B?UmZOQ1FrdzJVelJHTWlwUFRieXgrNWtjZXowWGs1SHN1bDlrYmhpT3FQWU5L?=
 =?utf-8?B?ajh2UmRpRDNqSkNVbWhjVmcyY3BBdmlBZE40WFZoZ2RXYmo0M1FTb2gvUW8r?=
 =?utf-8?B?aHJkeE90Tm5aMVpOU08wVXAyUmtFVzRjb2xoYW5ZQzdPOTRPbjZiM0QwWlRU?=
 =?utf-8?B?VEh3Zm1qa3ZHaFFseXNjRzUvKzVIaHJkc0ZETUdwb3pkTE9BL0V0YmhYcjJN?=
 =?utf-8?B?MUV5MXZLVjhUMVowZHcvY0NJNTdHeGYwM0xFYnllS3kwaXhhNzlZZGNDTml4?=
 =?utf-8?B?K0VmOWlWNzRocVl3ZWh4cUhjbmxtSUZ4bmpaVjFFRVJlMDBEY2d4ODZCU3VF?=
 =?utf-8?B?bURYY0p4K01JcjIxdkUwOWxFOWNGblF2ZVJlY0FyV0c0U1RBd0NWdzRDRVNI?=
 =?utf-8?B?V2Z3WXpjTXp1VldhWG55dGJNOU0rUWxYcmVZVDdXb3grdW1SUXVCY3dtUHpm?=
 =?utf-8?B?cW9kcEozOVE3K3ZGWVJ1YkJ5ZmtaajhTZUZkVDNtNUZuWVV4NGdaK0JZODJl?=
 =?utf-8?B?SlhnOEtLejlOakxwZGhaS0JqRjBIR0czeUxGZFBFWG5mcHFhamtLRlhoMGdC?=
 =?utf-8?B?WVI2dERZVk5Ua1pnL2xsVmhISUFnOEVBVnQxM3Z5NG82bXlzR2daUjRIYnp2?=
 =?utf-8?B?QXZPTHJIb0VCMmRpNjdoNGxqcGM3WVB4TFBuTWozLzZxL3p6TnlOTElxdWV1?=
 =?utf-8?B?dzRZMEZHcXYxTDVBdG4yUTNaMDNFeEd1L0s2eFBqbTJYZ0h1aEg5R3VQdWY5?=
 =?utf-8?B?YnZGVDdPSUx4cGNlbmxwMTZNTkZmOU43SWw0NGxBeVBZT1BkK0xBS2tEelg0?=
 =?utf-8?Q?yXSbc0+0JE9sljk4KSacnmmLdxHXviwAjWQybaVQ7iqa?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cf6f3eb-e40c-4ed2-fdd2-08dd88affad5
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 12:59:16.8079 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E3Z9JC7Rxnpl7JfLEcuCjjyL8qtOzRBWc2kqykx7i2qaZpaF+jsQx/GqG+cXEuedw7fGXBipVML83jUfsMKixg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6442
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

Acquiring the BAR temporarily to access is going to be a very common
pattern, that typically takes two lines of code and introduces a
short-lived local variable.

Add the Nova-local convenience with_bar!() macro, which uses
Revocable::try_access_with() and converts its returned Option into the
proper error as needed.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs         |  3 +--
 drivers/gpu/nova-core/nova_core.rs   | 18 ++++++++++++++++++
 drivers/gpu/nova-core/regs/macros.rs |  1 +
 3 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 64c38425098c19360a7c938f2b86a55ca3c48880..275b005d262e0a01a9ef1498836ef3c3019cb497 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -148,8 +148,7 @@ pub(crate) struct Spec {
 
 impl Spec {
     fn new(bar: &Devres<Bar0>) -> Result<Spec> {
-        let bar = bar.try_access().ok_or(ENXIO)?;
-        let boot0 = regs::NV_PMC_BOOT_0::read(&*bar);
+        let boot0 = with_bar!(bar, regs::NV_PMC_BOOT_0::read)?;
 
         Ok(Self {
             chipset: boot0.chipset()?,
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index a91cd924054b49966937a8db6aab9cd0614f10de..0eecd612e34efc046dad852e6239de6ffa5fdd62 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -2,6 +2,24 @@
 
 //! Nova Core GPU Driver
 
+#[macro_use]
+mod macros {
+    /// Convenience macro to run a closure while holding [`crate::driver::Bar0`].
+    ///
+    /// If the bar cannot be acquired, then `ENXIO` is returned.
+    ///
+    /// If a `?` is present before the `bar` argument, then the `Result` returned by the closure is
+    /// merged into the `Result` of the macro itself to avoid having a `Result<Result<>>`.
+    macro_rules! with_bar {
+        ($bar:expr, $closure:expr) => {
+            $bar.try_access_with($closure).ok_or(ENXIO)
+        };
+        (? $bar:expr, $closure:expr) => {
+            with_bar!($bar, $closure).and_then(|r| r)
+        };
+    }
+}
+
 mod driver;
 mod firmware;
 mod gpu;
diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova-core/regs/macros.rs
index a08d4f2aa0a32b00e80dae4e6b2c79d072241734..7ecc70efb3cd723b673cd72915e72b8a4a009f06 100644
--- a/drivers/gpu/nova-core/regs/macros.rs
+++ b/drivers/gpu/nova-core/regs/macros.rs
@@ -68,6 +68,7 @@
 ///
 /// // Flip the `start` switch for the CPU core which base address is at `CPU_BASE`.
 /// let cpuctl = CPU_CTL::read(&bar, CPU_BASE);
+/// pr_info!("CPU CTL: {:#x}", cpuctl);
 /// cpuctl.set_start(true).write(&bar, CPU_BASE);
 /// ```
 macro_rules! register {

-- 
2.49.0


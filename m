Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C7BAF893E
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 09:25:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDC9010E943;
	Fri,  4 Jul 2025 07:25:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="IPDGbf8K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2070.outbound.protection.outlook.com [40.107.94.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 521FD10E93C;
 Fri,  4 Jul 2025 07:25:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aUNHV4iQ6WEB7YWDJT/Uff4mKyr4ltN5487GWORF6lZ/GbtS0Qk6wHYn572Ap7OQCpoM2Z/HGbANBtNT6vZ8ke5lcyojzghaxqjsbVvsOJwv8PYh/fzKBm460Wy/B6G08b1TemqET67j8FUbZgvnuwvOiRcybq4+Rlrj3mGGs/iqTu7BWHYY3nYvsX9wnecPt77GVqW/tCKfBu6+WGLEhG/MYPZUd6cejvYAEMQ1wRM3i2oOoVYa3ld1u+MabNPdJ/aQLIVSUIS+RuYbzPLcnaqYXqKrxYQwKOaCPeG78c56IE571sJgxaemGHMfiLhgkI6cZqDBEx9RovdoYHLTmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MNKT9IKk4HDnyHd8HK4LSswOMHfGQE97SKiL4YxKz7k=;
 b=XuZQGHRx7Zn5T5NU31YhzXELvWXRTSdp54Zgs8NcB6IdE3c1IqkOxCc4xQS8Ez/3m1Usc/7U185faDGZq/CGpqZrE91RPXXtipaE9nSH7eTAxgx0gAaKT1GS3Fof3av2o+JSbm0rcxLS1/eFEyaxrWnyfBllwEV2nFtKdMX7xGVATMajjANyv76NNWrxeP9CreG1p1QYL4UVd/0aJ49ZLumgPXa9cw6imgEEk2iNGY3DR1S3e2RvYLtY7VTXAJ+u+ndVyV5SL75c835GiHQYs5PgcDHu0iElIVXQzUWyRvF9pQw/YVO5CijhxcvQCe+4plRppspEHTGMufsDJrLUWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MNKT9IKk4HDnyHd8HK4LSswOMHfGQE97SKiL4YxKz7k=;
 b=IPDGbf8KKfedBVbS+Q1w1F+PrD3lcf04kignYqTQIYHtswN0LdjIOjBd4B9rAzk20U7lfW74w1KQw0TElH5+NdK2QoJLwhn7z+I/TkF0/UzeUL/LNCXKKQho4+szR/9OUSVkg04vLqOVjWgUTVr6UXEOLEF+SKpJuPZn5qF0lyTAEvorYzukMAXOL7F4osnDqynibxQrXnooyaaRUEOvilgShCAWkDlmNb/fU63isqem6p50kQGf/kDiifLQtDjBdaH2jJPXFXCwHV6QbYH3K2DTG+ffOHR9ofxyViSsCRC/Zw/xqhAqDbgniX12bQD7QN8DwkHhiKO10EL+5zzzGw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MN0PR12MB6341.namprd12.prod.outlook.com (2603:10b6:208:3c2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Fri, 4 Jul
 2025 07:25:26 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8901.018; Fri, 4 Jul 2025
 07:25:26 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 04 Jul 2025 16:25:02 +0900
Subject: [PATCH 01/18] gpu: nova-core: register: minor grammar and spelling
 fixes
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-nova-regs-v1-1-f88d028781a4@nvidia.com>
References: <20250704-nova-regs-v1-0-f88d028781a4@nvidia.com>
In-Reply-To: <20250704-nova-regs-v1-0-f88d028781a4@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, 
 Beata Michalska <beata.michalska@arm.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, 
 John Hubbard <jhubbard@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0284.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MN0PR12MB6341:EE_
X-MS-Office365-Filtering-Correlation-Id: ef2e994b-a718-4845-e762-08ddbacbf210
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OTA1TnRxblpnakxyTkJ2QVZFNGJyRFRna2RDYkt1NDBBYVA4UXJUSHBnSkhC?=
 =?utf-8?B?NDNjNG9WOTZoaldySlg5NGYxV3J3Zmd2dGgzUmlGWk9sbFdRRWQxekplVTdi?=
 =?utf-8?B?NkhBZ1IvRHNhOXo0Y2xQaGNqcWlaajZFaC9jTnkvQ2E0eGVLa1ZmVEJpeWNB?=
 =?utf-8?B?VEozdFNSaHB3bHRnYis1QmNyMjZtM2tjbFh6UjZWeW5HZ0s0Y2NzQWdRSUgw?=
 =?utf-8?B?cXdkc1N3UGJ5QkgyeUZTTzB5bVFJUVhPVzJXcjA0Wk5pZ1BUZE5kVk1Ea2Q4?=
 =?utf-8?B?SUxKSysrUXFVRUg3TnM4cTJUYkswajBNZndSbklCcGhpc3o1V0RsK2tqT2xv?=
 =?utf-8?B?KzRBQ3ZyVnpidXRxZEExNG1UQ1JsUGdRYi9MVndCTmVlTUN6ejRZeVdRc3FG?=
 =?utf-8?B?ZllPeTJzVkJzYjBic2RzNVVOa2d2b28rZjNZSlJDdUVyR1dlL3lhWm13Y3Np?=
 =?utf-8?B?R3VhWGh0Qkd6cHNUajVYOXVuc1AxeTI5K1BBSnNiWE91eGdWdkVlTG5Ka0pC?=
 =?utf-8?B?cy9rVUZidFNFY3Y5THdNNkYvNjMzM290bHhjcjJaSGZSanlrUWlUWnNlM3p5?=
 =?utf-8?B?Qm9Ram5kbm1ZaElXRUdobEpYd0N1ak02bXc3TXU2UEczRlE1MDRvV1BiMFYx?=
 =?utf-8?B?TVZjcFhhak96aUsxNnh1bmNLbDZkdjIzSjFKK0JFeWlFMzZab3FWcUlSMFBJ?=
 =?utf-8?B?TnNXWnFMMmlVSEdrdUNmRTl5a0I4Wmg5eEpuWGgyMnVPUHV2akNVRW1udEJ0?=
 =?utf-8?B?alFoYW1JbXBSV2Ftb0RsellSeEpKSG9FOWNqQ1BJYy93VXV5aUU2TmdxU3RU?=
 =?utf-8?B?bi9hbGRtdENEcW1CT081R1BJK2NqYm1wYXpONlNBU3pLc2ZHWDdIdXBPZk5Y?=
 =?utf-8?B?U3h0b2M2cWJIeno3dS9aK29TTHQ1cEsvREpxYkNaUTBjeFBoZ0tsQ2tIZkxO?=
 =?utf-8?B?dWNZdGlCOTVBZ1hyeXEvLzhFampFU1IwUWpmd2I4T1RQbmsvYy9JYnBxcGNG?=
 =?utf-8?B?NTNFVzJ6Ri91bUczR21NTUNUUUFIdUYzZWQzd3lxMjU2dWVJeVNOM0owaGox?=
 =?utf-8?B?a1hwTzZ1NDhpSGhpbFpUSS91S05vOVdJVDJPR2YwOVNsWTkzclVwODdHTDl5?=
 =?utf-8?B?OXpzSXJwTmZzVEpQV0xwZnlFTjNxcFczbEFkSzVuKyt4MTRuNzVtRXplQWxy?=
 =?utf-8?B?SDRBb041ZEhxcnU1MXMrbENER1dsQ0xoQ29kU3E0dENOV29EbDBDdU1hL3do?=
 =?utf-8?B?OGdodGpGZnRNOUErT0NpOW5QTTltdzIveUdRV0FpRU9MMUYycFJodW9YVVpI?=
 =?utf-8?B?ZkRkUVNQWStsT0JkaVRTd2FMT0FWRng0eXFHdG5nQnNxdTE0T3BqUjJUSWdN?=
 =?utf-8?B?dXppWVBkMlZLbDV1REMvQmVrRUUvNkpMTjR2T1g1aDFMQnZCU2dNcDYrU0Vy?=
 =?utf-8?B?L0VHTXVGRStLanlNUTJEVWsvd0l6UkgxL2pjK1kvZzZEbWNsOG1vOXVNZDJZ?=
 =?utf-8?B?NGdoSVh1ZHV2MHE3YW5YWjlwZ201Q3A2WHV5dlQ4Z3dZYkl0SW15eW5OUVlZ?=
 =?utf-8?B?SFBZZU13TTNlNjVDUm1NQVNLQ3owMVpoallFOVpmSzlhLzlNSVN5My85ZkZT?=
 =?utf-8?B?RG9hU1ZUYURma09NOEhsbGFjdkZLdldHWU0xUTU0dGF3dmQ2WWtqUUxKckk3?=
 =?utf-8?B?WVVTNUFSSVB4V3E2Z2VrSDVLWnp4aFVpcUE4STFIN25pOHRjUUl3ZUdvQXI3?=
 =?utf-8?B?ZnlyNmdQU1FmZ3FMemJkRU83Q3N2UloyZmQ0RW5rc21McWNpQTYvWGFTUlA2?=
 =?utf-8?B?bFJndld4c0pPWkFBbG5ucEhVcmdZdHRuVk1wTHUvakFCaXFKZGZPWEgyUGVv?=
 =?utf-8?B?cEl5eHNnRW0zWXhqSi91WmFva01oWGhocDRKTWcwV2k4b2VXV0I0UUtCNzlJ?=
 =?utf-8?Q?pvStaFXTRZo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZjlTQnZHQjJrS1Y5UmxBVjI1UVhoNGJkWDRrM0dwZ01KWXFHcnhmVUI2MnVO?=
 =?utf-8?B?aU42aEVJSy8rZjRCT2FpbTN6TDNtMGFzb040Mit0Q0RTZUVpdFpYMlN2dERT?=
 =?utf-8?B?eUxPYVFxOUljUi80cTZGUHpiV0VDYS80Wmo3SEdXZGhTOUJ4OUQ0NWhrYlFH?=
 =?utf-8?B?dTcrNVdqa0FCU2xaR1EwTmlRR2pMWndWU0RwekZ2R1JTaXNUSnNBM3N4UnRz?=
 =?utf-8?B?RmgxcDVYS1FZclg0clNFZ09nUDMvK1hJOGlKQ0xNNkxqTUtGUWthZmlQbHlv?=
 =?utf-8?B?TUlwZDd2YnA3bDRqR3FYRVQ4TVRrdWNKSmJ0bkdoMVljUXBlVlJHMGNJSjlN?=
 =?utf-8?B?Qm5OdlU4WDlNSlZRbXQxOHpsSWt6MElBdFRsd3ZKN2V2R3lZVEF6azNpTWY0?=
 =?utf-8?B?YjhvdXFHU0ViZmYyTmowSVZDWW5DeVNhWkM5RnMxQ0hVTm40djVuN09tczZT?=
 =?utf-8?B?TkhjbnJPbWdYd2NacnRvUnZndHVldTVyMDZYWXhRTWhVMW00cXhzUUVUUWtQ?=
 =?utf-8?B?ZmdDVWQ5c2dacXpwakxzZlRtSnZnWTRsNVRhVm84U09DZzZ1YUNRc3VrUkNG?=
 =?utf-8?B?V3BzL2I2aW5ONlNITE16R2hzSE9LVkhDcXE4SjlIMXNOaU4vMlRZTDVueHIz?=
 =?utf-8?B?b3I4ekFHbkQ0dklyS1lOSGhmUFVCQXM1RGVNZnpjUnR4Wi9uTVZQY25wcWd4?=
 =?utf-8?B?Nk02anNpUzRIdkwvT0s5OXRHM1RnTFdaUkNYUFFSWElVeC9vZVJGNGFKK2hV?=
 =?utf-8?B?amNsTWx5ckw5WEpid1dNYisvNGVWY3NjZ2RnRjRzTEdhRUhUSG5lVmRtWVFS?=
 =?utf-8?B?aUFsQlNadnpKMzR0Q2J6UG1XM0xPN2swZkNUY1ZJS1hCNlI1Sk9pdzBRMGpw?=
 =?utf-8?B?SGdsQ1JaNjZkN2F1eUFTTmxCKzBPQ0dJZWlkdUJyTkN0N2ZPaW9sd3BFTmZJ?=
 =?utf-8?B?QXhNOWs0SlYzUnJacEViMnRGdXZmSElXQXpRVno0NE5rQ3NpdjZLNjZMVnpk?=
 =?utf-8?B?MzJvTGpSTFZreW9NTTFabVZNMzNPeWRZc0VGcnBrNVY0WEhBMW1aM2Yrcklu?=
 =?utf-8?B?YjFEYitvNzg0YUt0M21PYTRWS0toVUR2S3krdVJiTHdqVGxLMlVsejl4RGZU?=
 =?utf-8?B?cmdSa0Zyd3piOUxXYThkeFpPS09tc1pVZm1teUl5NnJVNWhaRm1BekpaN04v?=
 =?utf-8?B?cFdMZUhIWHFKaC9WbVgxdGZwZXdENW5TcmUrU3FxWUdSdlB1aWNaRi8wL1lV?=
 =?utf-8?B?YjZrUDhqa0xLWFZUaFpQMGZJZG9vNnplUUdqckpEdk00ZWt3dW1OVXR5OGZC?=
 =?utf-8?B?cVVVMEpMZEc0Zm1EK0VHTDJYb0xDUXV1VU1qSFFhdFVpUzdBdGg2TEZGK2x1?=
 =?utf-8?B?NE1WU1RlMnYvUkFNRUtDUlNxSjhPSGh6QmY5VlZVcjFBUHBFSGQ2TklSTC9P?=
 =?utf-8?B?LzhFL09iV2JsZlpHNW5LZmxFWUdjS3FHZlZCVk5UWHJFd2F4c01JelY5a3BJ?=
 =?utf-8?B?VWs3K0xDRVhkV3FGQkcyYytwVjY3VzhSSFN2VmhTN0ZNdDd2ZEZORjRhREpH?=
 =?utf-8?B?V05rTXlDY3BsNit5OWx1MHh3Zkc0QjFxSlhDZUcxcmFCVUpOK2pFckFMd3dR?=
 =?utf-8?B?QndqZTZseFY4RjcvaEtpam5rL212SDJDb0RQbDJUR2ZETlljcWk1bG5zSElQ?=
 =?utf-8?B?UEtmNDZUbW92bm8zR3RkU3cvaGJQUzVnOGdwb09GOGd1UFRPT2FmajRjckxR?=
 =?utf-8?B?Q1VobDVabnFWQVRtNGZzYlZ6ejZaS01ucU1oeloxazJjNW9qUWZEV1pIbWhS?=
 =?utf-8?B?N2U3Ujdkd0xYcEhSdlRyOWVBTWtLZjg0UXJxQVFzSFcxa3h4SFdYM2YvakFt?=
 =?utf-8?B?ZkhFdG9tRDRGdjQzTEdLYmR5TFBhVit6SmVzUHc5bXdFN3ZvdEthNjFiNkpa?=
 =?utf-8?B?azZUVXJ6eURMdm1lZE5aK2ttR3M1d2J6NXlrVFFOOFNrYmR4S1l4dEdrMStM?=
 =?utf-8?B?d254QzFVVGtLZktPK0ZOaStZdnJCVzBJa3NkeHlJWEx5VlBlVFFpTFlDNFVF?=
 =?utf-8?B?emk0cDg1cnM4TWd2UytMemRvZm1KeldIbzBJN3kvdThRTHJhTzJqUWhUSVN3?=
 =?utf-8?B?VHpJZ2tLajB4L3lTSzMzTmp3eWNnMDZQZW9aT0RvL214UU1LdXRoTlhXdkVZ?=
 =?utf-8?Q?K/bVo4lgGd9ExHPAJt1ODHD4RQqveiORKO0H/VZP0wsc?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef2e994b-a718-4845-e762-08ddbacbf210
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 07:25:26.1561 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c+cV0fsKx1gmPbNif2QoqzxhM+78e/8+stzMQFh6idXrICoJ5sB7pLDYn6FrbeDRuCh20SKhOSMPnfb+bG3QyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6341
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

From: John Hubbard <jhubbard@nvidia.com>

There is only one top-level macro in this file at the moment, but the
"macros.rs" file name allows for more. Change the wording so that it
will remain valid even if additional macros are added to the file.

Fix a couple of spelling errors and grammatical errors, and break up a
run-on sentence, for clarity.

Cc: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/regs/macros.rs | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova-core/regs/macros.rs
index cdf668073480ed703c89ffa8628f5c9de6494687..864d1e83bed2979f5661e038f4c9fd87d33f69a7 100644
--- a/drivers/gpu/nova-core/regs/macros.rs
+++ b/drivers/gpu/nova-core/regs/macros.rs
@@ -1,17 +1,17 @@
 // SPDX-License-Identifier: GPL-2.0
 
-//! Macro to define register layout and accessors.
+//! `register!` macro to define register layout and accessors.
 //!
 //! A single register typically includes several fields, which are accessed through a combination
 //! of bit-shift and mask operations that introduce a class of potential mistakes, notably because
 //! not all possible field values are necessarily valid.
 //!
-//! The macro in this module allow to define, using an intruitive and readable syntax, a dedicated
-//! type for each register with its own field accessors that can return an error is a field's value
-//! is invalid.
+//! The `register!` macro in this module provides an intuitive and readable syntax for defining a
+//! dedicated type for each register. Each such type comes with its own field accessors that can
+//! return an error if a field's value is invalid.
 
-/// Defines a dedicated type for a register with an absolute offset, alongside with getter and
-/// setter methods for its fields and methods to read and write it from an `Io` region.
+/// Defines a dedicated type for a register with an absolute offset, including getter and setter
+/// methods for its fields and methods to read and write it from an `Io` region.
 ///
 /// Example:
 ///
@@ -24,7 +24,7 @@
 /// ```
 ///
 /// This defines a `BOOT_0` type which can be read or written from offset `0x100` of an `Io`
-/// region. It is composed of 3 fields, for instance `minor_revision` is made of the 4 less
+/// region. It is composed of 3 fields, for instance `minor_revision` is made of the 4 least
 /// significant bits of the register. Each field can be accessed and modified using accessor
 /// methods:
 ///

-- 
2.50.0


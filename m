Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9EB8AFC32E
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 08:50:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0176710E596;
	Tue,  8 Jul 2025 06:50:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Es7nOckT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2055.outbound.protection.outlook.com [40.107.223.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D277310E592;
 Tue,  8 Jul 2025 06:50:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W3i7BefjCHwsJHOfVj6bAqc+zhqrm7Synpyk7L4eE7BLz51RwsAfwp8JGvb5QTYGulVzmkFKIWdPnpZPJkIerOB2RVooAk1rJ0FF/bN8MqLaRxIKlS/n7VCa/msxMLfdOJUd6l/RjZ31B1eMTZNadhJa/oEMc/ipGRfQb/IGwYFJ6fqabjASmmOsUd7pdPKuoaJjn3nMre3uMH6YXoLw6EgLu5sljHt/Xq2puLdqWtZbfzNKXz3rEhS0WM343l5qkO6OK9Jj0kHSvW4o3eKyCXTa0noSiXj5L+yzVfCpHIgVREAUWWnTZPXPG3/FKF4PCJFGmhT1Ih/ZOCvh5E7Zxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vvSXBvSg/26EQoY7Q89ckw+unz3xiKh5Q3uL0AdJIgk=;
 b=Bc+t2JAirzcb3FBsmJ7TyQhRTLP7JWk6IIkOsaaGGZnRsh/XsyJaT79QcN1xoEw2PUaH0lRADqwaieaC7LY0RdJanIqAhB7JEsrpBXjHCmKtm+XqROaSSqy5sogauXra8pWiduO915ZKNjlcxcq+5OyFhkwo8/T0zs87flQIS6/7EBCioK49VeR4n6Jbdji3N0C30uWL55kQCwHUuyYvxwA0zrEhiJgfV1iftS+ztDxNtQn3aaTGnHkmcJKIUCqtAjQiv1/bE9Sr44h+6Xnk/VJLd6JfscrTHmLEeLFt0YBg0s3aTHX0h3jHO3QERxOiE5A6Ea+ZPjKvsIZZLioL9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vvSXBvSg/26EQoY7Q89ckw+unz3xiKh5Q3uL0AdJIgk=;
 b=Es7nOckTOwnojryZoLkCsGM+sFKcFDe9mqsAVfw6oq0HH0etKw01ZG7BEJR4NdHV+0at5V7qpBktd35NNjay/KvlpKUQ5BMjwkT0tSRDXk33ksU/AoLeUoyP4v0atjPu391F28hOff1cd5tgXxHOsCpx48fOUT7mLELZNw2wNzwYR/lHpAzldTUwNW0YX7kBn5VT73V30WfCyyFejN+MI/rvmtOxYB567ulItIGIwgv7c16Ny0k62sLIYRPrTDBr8Wv0zj3EWjWmqOpMqdCWsKf1dnRPqF3sgKfndPCY0UNWRI5NYDguUjCgV9htv0Rd8wu5750YE0eGPP7yTurD6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY8PR12MB8412.namprd12.prod.outlook.com (2603:10b6:930:6f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Tue, 8 Jul
 2025 06:50:05 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8901.021; Tue, 8 Jul 2025
 06:50:05 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 08 Jul 2025 15:49:44 +0900
Subject: [PATCH v4 4/8] gpu: nova-core: convert `/*` comments to `//`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250708-nova-docs-v4-4-9d188772c4c7@nvidia.com>
References: <20250708-nova-docs-v4-0-9d188772c4c7@nvidia.com>
In-Reply-To: <20250708-nova-docs-v4-0-9d188772c4c7@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Joel Fernandes <joelagnelf@nvidia.com>, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0261.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY8PR12MB8412:EE_
X-MS-Office365-Filtering-Correlation-Id: 957e768a-c50e-4e4a-7b62-08ddbdebab87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SEtudURodVlMdU5QZ04yb05sQS9pT1ErSVY2c0tFM2d4bTkxK0syNGNmV1Uz?=
 =?utf-8?B?M1FYSXZTVGFFK2pqNjdHUUh3Vk5NYi9KL0FMSGhPTXZuNG1icUY3aDJmTS9P?=
 =?utf-8?B?cUF1YjBxNU9CU2hDTnpkRGg1MmYyQTZjQWo1QSswQ0p5MGpSTXkxQXd3R2FL?=
 =?utf-8?B?TWVQYkxDY1llemgvSzdtWkZrYVdWK3ozZ3RHQjVTOWR3akJCRVJOSEVYTUc4?=
 =?utf-8?B?Y1ZPWFJySENaMUtKNU81dEduOGxLeERoSmNhRk1FK1dybGpveGdRN2l3YWRI?=
 =?utf-8?B?VXpCUlJaQjROTEhVN1JKNS8vR0I5QnU0QXRERDBzOTFiWk5BT1dTUWhPbTR4?=
 =?utf-8?B?OWxrSjJ2UXZacXR2WkF2czdQVEFBSmJKTU5zZDRsOW9NYU4vTjJTU1MwM0dU?=
 =?utf-8?B?RnRqaXQwNnFFbEZRSjkzUEUrTUszRGFaOGxZTitwRDZiaVlMK1l3Y3V2elJO?=
 =?utf-8?B?S1B4b05WY0NoUnpOcmxlR3FCRVkzbUYwWWswYnlUTlFXcFFlUldtSUh3MnZ0?=
 =?utf-8?B?NGZwcTd6S254VVd0UmkyS1N0R1dmL3ZnY04wT1gwT2QwYk5tZzlGNnJ5QVlE?=
 =?utf-8?B?TXdjMnBjODZiaGx0YW1ZZWtUZlNKd3N1QU94ZTR5Y1RHMmxjSGNUK3B1UGV3?=
 =?utf-8?B?MmtoOUY1Z1RWcVBNeUpiMXJSbU1BcVNpUFpjUU9JUE9GWWNJY3FzbFhKRmdI?=
 =?utf-8?B?b05uYmVOR3dSbytKRFBLWUVZMEZvbjlEdzZLSFIycUdSVE4vbmtLNUxXTDBn?=
 =?utf-8?B?emo2S2YxSjZqT1dQbWdJdUl1Nnk3ZEtjZG9xMkF1a25SVzJOMnJnYThnMGhj?=
 =?utf-8?B?ZGZxY2NOL0NuZUhlTzdSbDRzM09LVXdFMU9pUGZKdENleFJGbDFxWm8vYk45?=
 =?utf-8?B?OFo5ak5CN25nUjBPU1ROOU1rOWJaMFY5c2tnTFovL2k1bVQxOE9DNG1WUkI1?=
 =?utf-8?B?QVVyRlA1OXlEc29lOFg5SFdJd2ZPb1E5ZU05bjIxNUtERjMrekJCUHRFc2M5?=
 =?utf-8?B?UGY3dlZkVklxZFh4T2VJbEY5MW1wd3VWbnY3bWdWUTZrbno5UGpNM2FQV25B?=
 =?utf-8?B?WndnRTNFNUgzMnZDUm9QdUtqU1JYZC9qR1pOMElSOUtSc1RZdEZUc1ViYTNm?=
 =?utf-8?B?SFUvQVNMUUxuSGlyVzBhbk1mUjc3WUNGSnUvSTR5RmpLdWU2aElUM1pPdzR2?=
 =?utf-8?B?SE55UFF3L04reTRnOGhXWVA0VktIS3kwZDVVdlhTUGJsUFJoblpZclhLSU52?=
 =?utf-8?B?bGxIc0ZraGlIeDQ0c1dybG1lNjRSWU04VVZCckhMTGVoYTNvTkpPMjJ3Z3JL?=
 =?utf-8?B?WmtGUE9zYjM4Qm54Z1YySHRQNWxNRlZjNnZQOFltL015eEpMS2RDYzVYRDgz?=
 =?utf-8?B?R2pRcEExK2FBQWlzVkdTYk9xSVhIQlQ2YmhJNy96Tlc0V0I4TEhmZ3A3S1dZ?=
 =?utf-8?B?UkdsQ2l1Z2ozcC9zT2ppbkN4QktzTkhZSGdlSGlNTGl2dUFIc3U5b0tNb0lp?=
 =?utf-8?B?Qi8zdzZQREhEVUpsNEhrUjFybnJaUmlaSVFrZU1BaXVNcDR2bnh2OW9DZXlh?=
 =?utf-8?B?RENJT012bTNlMGF3K2hHelhiWjNnZHRwZXM2VGJaQitUSjA1RCtMUm45c1VL?=
 =?utf-8?B?Qk5DekthWkY0Q2Y1Zzh5ZnRKRDFlU201Y1IrRHNzU0lDVTUzVVU4WGlCbTZV?=
 =?utf-8?B?cUlHL0VwN3VjWnNyRjg4UFlvVXIwMXFYSkw1TlY5Rm1meGE4THU1eGd1ZVBJ?=
 =?utf-8?B?NDhWeGgxSE9FMnl5QVc0SXdIeG1DdXJKb0VGVFVIaDJMaVBEbVh0aFZhRTQz?=
 =?utf-8?B?QTR5OU9UaHN0R2VkSkFXblpDaExub2JVRFRoUWptSlpNN1JZWEd1alNUTHNM?=
 =?utf-8?B?Q0tOWE9CbTZKcFVFa0xnWWMrdjhoRWFEeFlDeHJLY2pEelhYMGpRS1ZYQVBm?=
 =?utf-8?Q?2V3dCHsPE80=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3JnMUQ2UW5yQWgvL296cVFKWHViREx6bGdBNW5BTUlPbjA3clgwUlU3ajRG?=
 =?utf-8?B?c1lGaG9oTmtseVpvbnZWNmZ6cXhEVE1EWDVmTG9ReCtnUXFhS251dWRraFVU?=
 =?utf-8?B?eWNlUEt1YWZnZG45OHE4T1VGTUJrOTJ2YnJMZU1tQXdDU09tbUQ4ak1pYnpF?=
 =?utf-8?B?Z0lUaytXRWp6aG1yNE9UK3JKQVFaOUZyWGRUa0E1YXNGemtpb3E3QWNxdU9m?=
 =?utf-8?B?S25GNUR4RGE4cTJNSEpBZWdSTGRGY2tqUnRVcjN2RUJpTy9OZVdoTzBRd3FG?=
 =?utf-8?B?YTd0UWpjZStLUnZnWDBVQ3hDTzVZamUzVVkxY0hoV0ZPdWhISmRMaUx0em8w?=
 =?utf-8?B?UEwzbDlTeW54N3dnUXNBMElwZ05rN3l0UGpOMnh6bnRaWndmTVcwRU56S09w?=
 =?utf-8?B?RUU2UWMwdFQ1ZU1Pc3czWTkxQW93NDVEU0F1enBMY3oyT1hmRnptd1FIM0pM?=
 =?utf-8?B?WmFWWlZRbWNPUTdrR2RvNHptVEVKTzlUaFoyR3RvOUwzZEwzWmI4N1dhekY3?=
 =?utf-8?B?QXZaQzFvSXAvRUNYTmdzWnhnQ2dOakFsdGt0RU0rTzdtZURJZWZRTVZ4Skdq?=
 =?utf-8?B?eUswZjdhM01TS1hpc1I3K1NnL2NjTUNEa0FTNU5mS1lSc1FsTDNqTHBoRWlr?=
 =?utf-8?B?L1RtbkVEQmhjZUNsS0h2V3FWemtycVV4ekNidGhXVWtyMUhuM21KWjFNbnd4?=
 =?utf-8?B?RHNKZ2ZhVEdQNHozUEtDdWdBb011S1dmLzdOUDFaMithQldDeDRFdXhDZ0NR?=
 =?utf-8?B?S2djYW5Eb1pYRE1CaDhFWExmVWUyMkxzaERkZUFBenFGT0t0QmhlMkExQW1L?=
 =?utf-8?B?VFNlU0ttSnVEdVFhR1ZpZGdka3dVbStYdnh5cUZXei81SzR6dWloTFpyYzBQ?=
 =?utf-8?B?RkZFTWR1TkFYTE5HbXU1aE8vUTNES2k1T3p4S05Td1kvQlNYeFEzSjB4N25D?=
 =?utf-8?B?V1VaSjFFSG1CWW4vaUJUQURkUW5BV1VoNVBpKzNPTEFWR2RxcHQ2b1Z3S0l5?=
 =?utf-8?B?OWRNYzlDQTdpL0JFNmN2SU1BWHRXS0FJaW11U1krWFhBNlVxNmxoTURvaDNW?=
 =?utf-8?B?ZTR3bWwzRDBBMEtLS0tuTE9GTUJJaE5zaGFPMXEwY3N5YU1FTStTcUZGOFc4?=
 =?utf-8?B?V2dxT0xOblk0ZExFU3hFaXo3eEU0eUlYS3BEOTN2ZHR5Y2JISEdqMWovaitF?=
 =?utf-8?B?WFgwSVVGMm5EbUZnWDhTc3l1OEMwTFF1MHVuWWV5ZXBpazNicU1JNTh0WXY2?=
 =?utf-8?B?YTN2MW9LNDhROTJaYUJZSnk5c0I2Vy8vS25PQUJta0tid1JTaUI0UkYvVzlY?=
 =?utf-8?B?T2xwaS9ZcnVUcHZrSm1IVHRZNmRFSTZXUVJjQUd3SGtsM3ZSSFpCU3c1OUV2?=
 =?utf-8?B?OCt5S3Y1UFN6cDY3TC9rZnBNV2k1SSt1TS82cGZhS0FpRCtYY1g3Sll1QVhI?=
 =?utf-8?B?TjRDVHhFMkRhY0xxV3NGNkpJSGhseUpHcGtaY0RyWDBGTDl0a1RCTTJNUFpw?=
 =?utf-8?B?eTFwaTZJRWJzUXphK2ZBVlVwNHRRMDgwSE95cURSakpFTGc5ZmFnc3NscnJM?=
 =?utf-8?B?RzNENUhDZWtvQ1VwMzJ1OFV2Mmp3bUswbWlWbnVUWDNKSGdTckZ6V2s2RjFY?=
 =?utf-8?B?djM1UFhqSEMvakxuL0tXaXE2azNlRGRXYlk1WXROM2FmcnIzYUxoYTMySUFX?=
 =?utf-8?B?MEpmeFNDMEpWNkxINUM1cC9hTjdyNVlEWVUwUzFzQjJvbWptK3ROTDFHMEVD?=
 =?utf-8?B?M3JHbXBUMEdRV0oyNE4wVFJnRFN2TnRGWUFaWEdSZ3NnTURqZTRrMVZiZk5m?=
 =?utf-8?B?dkFLSWErN20zZjc5L2g3bDduckdzZjZUSitZSy9nVlZRWHIzWVJQaHhVeHN0?=
 =?utf-8?B?MkJjamVwQzdNQitJZmhzZVZEemhzSUQ3SFgySUdockcvd1dKSEJtenNMZGl6?=
 =?utf-8?B?S2E2eWppTkFBUEpmWnpaQjVIOTBDUklrZEFJdTRoU0dkbFI4MVJ6QmFCV0RS?=
 =?utf-8?B?SmFoWjB0b3Z1a05lVzEvSERtcDZtZ21ERUR6TjBmUmR6K3hIR2Rsd0NqVEJl?=
 =?utf-8?B?UmxMcWJEVTdTVkRXZTlQNjNrWDMrZVd0SkltYnpXblExZTlzZU9oSy81SmEy?=
 =?utf-8?B?bGJmWWxnTHphRDU0TEF2NmlzQmR0MWk1Zi9IY0srUnJUeU9td212OGRyMkd6?=
 =?utf-8?Q?8Nhmyoay/o0/33r3b7Syrk9IE4Jxbo6Vdimz3ffITOf8?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 957e768a-c50e-4e4a-7b62-08ddbdebab87
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 06:50:05.0459 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jyvDSnOK4fuIx6gSK6e8yFR/nig+Se3JSdgJxNR5XeOoTH31LTPptIeFK8zxG+knj6Q7E4mgSP1gDs1OakB44Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8412
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

The second form is preferred, and there was no reason to use the first.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/regs.rs | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index b934ffe8e81390b36f5a39af39a9b9f337aa66bf..6f774d4f79a5eb253df90e335d05cf6bc1fa5857 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -14,7 +14,7 @@
 use crate::gpu::{Architecture, Chipset};
 use kernel::prelude::*;
 
-/* PMC */
+// PMC
 
 register!(NV_PMC_BOOT_0 @ 0x00000000, "Basic revision information about the GPU" {
     3:0     minor_revision as u8, "Minor revision of the chip";
@@ -42,14 +42,14 @@ pub(crate) fn chipset(self) -> Result<Chipset> {
     }
 }
 
-/* PBUS */
+// PBUS
 
 // TODO[REGA]: this is an array of registers.
 register!(NV_PBUS_SW_SCRATCH_0E@0x00001438  {
     31:16   frts_err_code as u16;
 });
 
-/* PFB */
+// PFB
 
 // These two registers together hold the physical system memory address that is used by the GPU for
 // perform sysmembar operation (see `fb::SysmemFlush`).
@@ -160,7 +160,7 @@ pub(crate) fn usable_fb_size(self) -> u64 {
     }
 }
 
-/* PDISP */
+// PDISP
 
 register!(NV_PDISP_VGA_WORKSPACE_BASE @ 0x00625f04 {
     3:3     status_valid as bool, "Set if the `addr` field is valid";
@@ -178,7 +178,7 @@ pub(crate) fn vga_workspace_addr(self) -> Option<u64> {
     }
 }
 
-/* FUSE */
+// FUSE
 
 register!(NV_FUSE_OPT_FPF_NVDEC_UCODE1_VERSION @ 0x00824100 {
     15:0    data as u16;
@@ -192,7 +192,7 @@ pub(crate) fn vga_workspace_addr(self) -> Option<u64> {
     15:0    data as u16;
 });
 
-/* PFALCON */
+// PFALCON
 
 register!(NV_PFALCON_FALCON_IRQSCLR @ +0x00000004 {
     4:4     halt as bool;
@@ -312,7 +312,7 @@ pub(crate) fn mem_scrubbing_done(self) -> bool {
     31:0    value as u32;
 });
 
-/* PRISCV */
+// PRISCV
 
 register!(NV_PRISCV_RISCV_BCR_CTRL @ +0x00001668 {
     0:0     valid as bool;
@@ -324,7 +324,7 @@ pub(crate) fn mem_scrubbing_done(self) -> bool {
 // only be used in HAL modules.
 
 pub(crate) mod gm107 {
-    /* FUSE */
+    // FUSE
 
     register!(NV_FUSE_STATUS_OPT_DISPLAY @ 0x00021c04 {
         0:0     display_disabled as bool;
@@ -332,7 +332,7 @@ pub(crate) mod gm107 {
 }
 
 pub(crate) mod ga100 {
-    /* FUSE */
+    // FUSE
 
     register!(NV_FUSE_STATUS_OPT_DISPLAY @ 0x00820c04 {
         0:0     display_disabled as bool;

-- 
2.50.0


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A653C4203D
	for <lists+dri-devel@lfdr.de>; Sat, 08 Nov 2025 00:44:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD87E10EBAC;
	Fri,  7 Nov 2025 23:44:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="cE3g87VV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013059.outbound.protection.outlook.com
 [40.93.196.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43ED110EBA4;
 Fri,  7 Nov 2025 23:44:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=te19ivIquJ/1R/RTD7GI1Jlrt/jzzb7itPMuobl0vAMgQ0UurXpS3EHbC2i1PakTg05kdkOC0M/2recc9iMI4qNn04x9VjcqG8rGGoipqO5AhSAjK4yPWr+ehqdEcia2JcL0M3YhftxKf8gZIflp/0bSlCh+huLMzeoTaX28jeZfs2x9GZPf2r74UPVq9LtrEkY0hwR1F35rvrq5DpJk1qUxyaKkOE7PCBdTKGsrd8OTkhTRlXFP1neb30PpWZbbA+ml3vlZCZoGs8l5EOJy1FsNvvybEG/rFTtE6hpeQBLGd/4/VTGcSu6z3V69iEnyHye6awc/pNGNW/jIhNxRsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jf7eqo3LWh310A62CIrpIxysheIRWQSPzYbhbmhANFY=;
 b=SWEmXbAmvuNSvlr8Ih8YyeubRyp2s+A+4vr7+3QD/+9ubNoklvABV/+yKYyd4xla7+yI5bMyazUEgPay7VYRFx1evwcXiKj9AyaSB+UpfFpix6oaRqf8+GyCRUYKoQ6D+d6DFSl229yq151dD3ZKEV0S22nhTNF+pbjqE7f8ME1ystan2ESJcb/N9KkSW8WCdtrmJYDG4z57ZxcS/kWemel0kHsI1hTRahPAaIWKdUs2YtMAgkJVQ6b0JumR2FWJp/L84Wuh8TNNjN3aQ+7WwD99gKkNZn+bwXd/vZpnDoAXv4pY9b0cCfFMXD6o7k4fp14Wn98g43fP6GHS1gLs2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jf7eqo3LWh310A62CIrpIxysheIRWQSPzYbhbmhANFY=;
 b=cE3g87VVbGaJoBdAqKhs7pqWfafAIAs5K7NQ/ID23rPPxi/M8tlc34XVxlSCehzcWEUdfpifMcNUKBsKrOFUNjNOzfaD8lPaqcE+O4E0n/BxTA1/OGTiHiYyRq0Jx+nbOLOyvLRDRY0vdcSL5NubTDrPvuolJhO85oeqev9Oyq6oYthKovtceWNdHikB6lgrbmBeTIwHtlisVdxh63GGUEAUXerdheIoYBVPSe0ZYuFA48EqA27zj5fDXkFly0mqkGeAw6ekYA3yUkBt4/TCBHrCVvlzU3q6Mwrp+W9iGeKn2zWFZC41HUwkHwTFHHgUgxrgxgVzAzAI7BIqjhL2cw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BL3PR12MB6642.namprd12.prod.outlook.com (2603:10b6:208:38e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 23:44:04 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 23:44:04 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sat, 08 Nov 2025 08:43:14 +0900
Subject: [PATCH v8 13/16] gpu: nova-core: falcon: Add support to check if
 RISC-V is active
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251108-gsp_boot-v8-13-70b762eedd50@nvidia.com>
References: <20251108-gsp_boot-v8-0-70b762eedd50@nvidia.com>
In-Reply-To: <20251108-gsp_boot-v8-0-70b762eedd50@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, 
 Lyude Paul <lyude@redhat.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCPR01CA0076.jpnprd01.prod.outlook.com
 (2603:1096:405:3::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BL3PR12MB6642:EE_
X-MS-Office365-Filtering-Correlation-Id: 7667c6c6-3d33-4099-273a-08de1e57890f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bjVrMUVtTGhSV3RLaHRtT0ZtMkJWc3d3Q0ltaUFJWmkwU0RqVlY2NWd6cStW?=
 =?utf-8?B?NEovVU0xSnh0MnJOejQzdjF1M2psL24rWTlkVnd0emdWV2pYSVNBVEIxQ2pN?=
 =?utf-8?B?SGkrUzhvay9ybTcyeFlDbFlLSU9EVEJLYStzWG9zWjBYaUhKVXJHUkFvdTEw?=
 =?utf-8?B?ZEluQm1WbzlSckVrSVFnUXNqU2F1T1dkTUNybXpOZHJpTk5hWHlFSFl5c2dk?=
 =?utf-8?B?ZG1LbFE4Tk4zM0x6SENzTFA2NmhXSmVoOG10U21FYSsxOWxKWGJUTEZGaTBo?=
 =?utf-8?B?YlpwMG9sdlNMblovODNQR3craElrejBWck8vcWYxRnpqUmZreEJXeSs5ektx?=
 =?utf-8?B?cEVWSEtaZmhqSm5ZalhtdWorTExBZFpZMm14dmJ1UjZybzZBclduRGhxUHg1?=
 =?utf-8?B?d1lpVFRNczdrUDVBdWlpYUVBcWNiQVRMNnRZY29PNWx1by9oZXc2cllxVDVa?=
 =?utf-8?B?SDl2Ti9ad0RQdUsrQWZNOUhqaE9nZzNDcXRJTS9lclBBZDZmcndnNmlSaGFl?=
 =?utf-8?B?OWFKcUR2Zk9MU1J0ZHBBWnpGV2syQ3U2Nm02UWJnTmZ6QUFiZmErVnQwdXpT?=
 =?utf-8?B?bVFiamJIY2xlMGZmUCs1aWhpYzkyeGVUNS9JbmllaExDUm85MkN5M0ZFNE1s?=
 =?utf-8?B?ZStXYzNzemxGb0VWaEk4QThWWGpySkdkQklhTDQyTlM0aUViNWNnS1U0dG55?=
 =?utf-8?B?SkJLNHV0a1FIS3p6ZGhjdjdYcGxVbFlIclpLcDJPU0pjU2czS25DTGt4SDJx?=
 =?utf-8?B?amdOeDROSjl2S25yd2xkNmNTK1VsSU4xczZMSUNXVkxRVzJCQ2QySFdXaDhs?=
 =?utf-8?B?dDlOelJDNzdGZUdkRTZvczRkS2c3am1uc1FCYTd5UFIwbnVLWmcyV3BsZnhu?=
 =?utf-8?B?Z3ZVc21PVmRLSlhHLzZPeUp4U3pGNjJibWxUektubVc4MEljbXRhMWdvMHRO?=
 =?utf-8?B?MlpScEY1WFJaRHRlSDFrcFRPQWlzZHVIVEtmY1ZJQnBqWGVDTFMxZzlqRURk?=
 =?utf-8?B?d0NrSW9WZGNuc2MrT094VEJTOUlKTVAyYWdMQzhVVTRMRVBpcDhrUzA1d3dh?=
 =?utf-8?B?cE5iR1ZNZzg3SmZWcDBnZllRamFCNVRFNGhXajRMcjlSMk5YSXdoYWJwRTZ1?=
 =?utf-8?B?U2ZaM1FNc3Flc2Z1dTk3RCtyeDN3KytLN09kRG1xNVl2dktybGJGc2ljci9P?=
 =?utf-8?B?dXliMEtoMjFkMGZ0bXhUMW5lWUdUOHcvMXhBcGV6dzEyU1JWWW1Na2VuaTVj?=
 =?utf-8?B?eS8zVU41SVQ1bkoycnl1cURQRFk2dXpTL1JmMHkxV3luNHU5bXZuQlJDU2V6?=
 =?utf-8?B?WVJhR29uSWo3dVBkelBYRW9ja1FmS1NrZjZzYll4UXdXWUowVnhXRHM0c0ZH?=
 =?utf-8?B?aFpIaDViZ2Q1S1Zha1N0MzlMcmMvOUVpNWozTkpQRnBpdEdOOXJlOGptaHlk?=
 =?utf-8?B?Qi9mZ1hMWUdNeFhOSS80UU52amZVazY2dGFsMzF6NHBQS3c1UndMWU1qeGQz?=
 =?utf-8?B?cWdoREs5MzlydzhOUlFMQmJLUG5ybDF0Z2NwQ0loYXVHWEp3WCtBZHJscGJk?=
 =?utf-8?B?SHFMcjAvQzl2ZzB5NDdudHk3Z1hMUzRpVm9hZEdGQzhzbTc1bEQxTnZ1Ymdh?=
 =?utf-8?B?QXB5NWl3MHA5REJZZ3pIRTVGcE1UTFFaRE5yeTN5eW5WTmFpUDRpblRFcDhq?=
 =?utf-8?B?Wlg0MDNxUmlWM2R3dmhmVHNWYkxUVVVNaTUwTUEvczdCbEI2cjJOcGlBV1M4?=
 =?utf-8?B?bHJURFlSTEFQcGtVd1FCYkY2MWg2bm1DeW1QZlk1cWFaemE2QndvQmw2dzg2?=
 =?utf-8?B?bXFHNElZT2EwWFhMcjJQcGhRY04zQ1dPZzhiNGlsMTFtOTBGaDF3N3lQY1Vp?=
 =?utf-8?B?T1VxM0xqNlNrMEJxU2Job0ZiaUtCVzVGajl0U05uRU1ybmxGN3JKL1JCM29n?=
 =?utf-8?B?M2pGWHFNUVI4TXlCSi9md1pKRlk2a2FkRWhtMW5Yd3VPOTgvYWJXY1pLV05J?=
 =?utf-8?Q?yED3tkDAN7N8H25mpjuTxU0TYH3WG4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OER0dUljeEpsMGtOUlpHeXM5clNBTXlQWS9CbUpBSXI5U0JVUThFdmg3L3RD?=
 =?utf-8?B?d3dWQ2cvd0J2Rk40MkhuTStJdW9jTU9SenpSNGtRcUJVUzVFdVlDNW0zU3VS?=
 =?utf-8?B?THl0OGFyYTEzTXNVTkxURDlrQ2FteVNaZ3hNY042Q1hTakU4RmQ0MFp0WUFk?=
 =?utf-8?B?TEdnMFFGdG14WFoydURWdVk5dUtPL2drbHZUNmZyZjBXdmtQL1dNVWpRQ0NG?=
 =?utf-8?B?RUhhUHd5eVk1VnZVUEpsZVNseUFiN0N5R2JZNDMvNUQrUWlpU0duZHhKdUtK?=
 =?utf-8?B?Y1lyUUpxM2h3Q1ludU9uQU5nYnBQUG5oVHpyUGxJYTdSTEJRajdTQnIvUHVS?=
 =?utf-8?B?QmdRNjhyQnkweVNEZWExaDBLeFU2aFZZZjduYUovOXdHdjZRLytpMmFOTFZm?=
 =?utf-8?B?emM4U2RneVp5MFNPTVM0eXdkUlRXZGRucWdxMllrNmtlbStOcFZzMTBtb1Ns?=
 =?utf-8?B?a25QdzM4c3NZNlhEWkVOU0lFaTc3WWFhN2VleEhmNGRLbjZZL0xZd1pNU0RU?=
 =?utf-8?B?SkE3NzlsSk5GMTNsaWdaQU9xTTU1T0tlbkxxU2ppYTE4blBkMlR2Sm5zTXRq?=
 =?utf-8?B?Wk9SbTJLWFZKZGc3STY4UVUvN0ZVSEVlbE85NWVFOVppa1UvNFAwUi9uVGVX?=
 =?utf-8?B?dTBCU2lOUnVvR2ovOFR2dVJIcjVzSmpQZ1ZmTzMyWU1BTERiUUxmM1ZjeUpu?=
 =?utf-8?B?UVB1SEl0VHg4eVQrR1dUNENoM1dFTU52bEZOa0tKbGxqbktvODFOQjdhQ2RT?=
 =?utf-8?B?N0JSeUdhMmY4bmQzd3MzOVJHbGo4a2hOVE1NUEZzY2psRUdLOFVQcUZLSHdy?=
 =?utf-8?B?MjJ1R1pFTEtwaXozcVRyT3V1UzIwU1NPcDA3MHk3MkV5QmJFblNIWko4L2xj?=
 =?utf-8?B?TWlaQmluVDR2VitxVmM3VFBtM1JkQndsZlRKRWNoTXk3QTVwZ1FZY2tpL0RG?=
 =?utf-8?B?QlA4MEtCOVZHbzd4b2FQanZVVndneFZyT0t5VzRjRHdTTEorYmVrNzdIZmhr?=
 =?utf-8?B?cS9uNEJON2NBOHZlRzllYXJQQ3ZHTlRiZjZDUFA4NVFKQUdSUTZTcENDQWdR?=
 =?utf-8?B?enBmQ0JhTDhCQXN6QnVhMXFkYnp3MCtZTnBpZW81cmJsWkVoZGtFRVcvNTY3?=
 =?utf-8?B?d2s5dGQ3WG5KbHNGSWZwUVlLcmVTRGRzZ1ZWQXc4M0FGbFFvenJXdnh0YnFG?=
 =?utf-8?B?azNCYkNNNmlkUnBLN0Q2RElxbDBwOE9pY0xpU1RseHNzY1hXK2llTUhKU3o5?=
 =?utf-8?B?RDhZUFQxbks3UXRka0xveHVZYjhNWERQUGZtMjBueEpsTW9WN1E4ZkZqU1E0?=
 =?utf-8?B?MDQ4UnBpVERuK0hydEhOSlVrcGpJUHo2VUowaGx0cFpPWTVSVXBsWUVydkVp?=
 =?utf-8?B?OFZ5Q0FRcWo3QVNzTWZmY3BQV28ybmdSMHBhZFY2ZlNHZlBsNnlKVFNyekxP?=
 =?utf-8?B?YXFBeXpRZERyWEZkTXNDMHpmU0x3SGxhT241ZmtyemdrL1NoVDB3RzBOL2w5?=
 =?utf-8?B?SjRjUm1XZW1xWWJINHRDUElHemlGK094QU1lalF1aTc3Qnlpb01Kdy90Z09C?=
 =?utf-8?B?Q09EQ3ZYMUFPUzJNVW9LeW5vcjNlK1lla0NmOVI1MjNtbEwzSGZTTHpjK1dj?=
 =?utf-8?B?ZHVEODZzM0ZnSWlZZGQ0NWk0K3lGejRTS3NCbVA3R2ZwRnpac0c3azZZYisr?=
 =?utf-8?B?bW1jcVFHb3hFeDI4SFBZRE1FWVlsam8xV2l0eGtERXlEVzlhaVBtbnZ6M201?=
 =?utf-8?B?UExkUElsVStUUWoyeVY5UDdWazlrZFVYTkNacm4rL2IxK0hEaHQ1WFA0V21u?=
 =?utf-8?B?OWcrNWdFYjh0ZFBhMm5xbTJyZGR3WDNDNVd6b3l3Rlcvd3g2Znp5OEhKUmVH?=
 =?utf-8?B?QVkva2xqZTh0aUhMaHlTbERsVkdJVzZsQmZJTUdQa2VGOEFrS1BGTXFiY203?=
 =?utf-8?B?aHNIYXJHZXlWT1lWTE5hOUhTNlpYVW1RUjNaYmE2WkhvNmkvMDZCNFBWNE84?=
 =?utf-8?B?R2JnTXpVK1hiZkZMditzajNMcUpnaW5mb2lYQUtaVHBMZzkxODZUWU1oeVdJ?=
 =?utf-8?B?dTY4S3lhc040TzE0cU53d0JqbkJ5YzBJQ3JUTzAwL1FFbUxEUFZWV3Z6OEZp?=
 =?utf-8?B?Tm5McTBENThFWDNMcktxZWxHMjdkV3puMDBHM3dkZmc5V2pHNSsxSkkwbzYr?=
 =?utf-8?Q?pbT/mpUvA3VemOdFFW3kGYBtjbtGsz0WpBWf6vFeCAjh?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7667c6c6-3d33-4099-273a-08de1e57890f
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 23:44:04.4959 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z8C2hFOXwFqeTNxVvWt9DJlK2JXTfZEPCcwz57n330g2Sx8mRS73eMcfPgns2YlC0f4x1o+mYUx2iBsf2rma9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6642
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

From: Joel Fernandes <joelagnelf@nvidia.com>

Add definition for RISCV_CPUCTL register and use it in a new falcon API
to check if the RISC-V core of a Falcon is active. It is required by
the sequencer to know if the GSP's RISCV processor is active.

Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs | 9 +++++++++
 drivers/gpu/nova-core/regs.rs   | 7 ++++++-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index fe5b3256d972..4c1f36073533 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -612,4 +612,13 @@ pub(crate) fn signature_reg_fuse_version(
         self.hal
             .signature_reg_fuse_version(self, bar, engine_id_mask, ucode_id)
     }
+
+    /// Check if the RISC-V core is active.
+    ///
+    /// Returns `true` if the RISC-V core is active, `false` otherwise.
+    #[expect(unused)]
+    pub(crate) fn is_riscv_active(&self, bar: &Bar0) -> bool {
+        let cpuctl = regs::NV_PRISCV_RISCV_CPUCTL::read(bar, &E::ID);
+        cpuctl.active_stat()
+    }
 }
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 41fdda8a0748..5d5ba766cd61 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -339,7 +339,12 @@ pub(crate) fn mem_scrubbing_done(self) -> bool {
 
 // PRISCV
 
-register!(NV_PRISCV_RISCV_BCR_CTRL @ PFalconBase[0x00001668] {
+register!(NV_PRISCV_RISCV_CPUCTL @ PFalcon2Base[0x00000388] {
+    0:0     halted as bool;
+    7:7     active_stat as bool;
+});
+
+register!(NV_PRISCV_RISCV_BCR_CTRL @ PFalcon2Base[0x00000668] {
     0:0     valid as bool;
     4:4     core_select as bool => PeregrineCoreSelect;
     8:8     br_fetch as bool;

-- 
2.51.2


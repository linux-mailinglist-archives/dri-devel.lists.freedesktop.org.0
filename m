Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D9CC42022
	for <lists+dri-devel@lfdr.de>; Sat, 08 Nov 2025 00:44:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87DF910EBA2;
	Fri,  7 Nov 2025 23:44:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="rfTnlPTj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010052.outbound.protection.outlook.com [52.101.56.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E8F710EB9E;
 Fri,  7 Nov 2025 23:44:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JdC2fnhuEY9TlKHokvLC13v8en7UEuWuqeHjLBIrDS0MCx82w/0RZzgX2Va8PQzeMvJfh6J6ciGJGv+24PHsMKq55CnIYUqUL+WtusUy/hDAiKFy1Ry3ELSzy7kkx2Y4V7U0Wo8FVe8iGy9FczsVZecCWq00gK7kEzzaoQwj76t8zQaYHgGPCVCPmLMs7MUMnZ+CAyAocdcPdoGAvGh/eiiZB50Q4sQLCvAgGFA3fCtqrPlm29Cbt/qbwVlzRZjTEOl0Vxv0ZZq6x+WEAem3ojauZWSrm3++MIDjgUHIG/LYraehEetGLICJoaeedrj2ZNtZwCS3ZwWNhbXHxgBopA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XvDWMmmVJ2gGW28YUyYM45z1XX8rad2PXmHLfNLZUxQ=;
 b=tITJEyqyk8WSwZfiyP5CRQobgyD5spumixJSplGr004/gY7M7zPB1k3cqjdHXUelI2ecIVBNUGkET7EPkvwzATcZAWLWwGCwXw5lFPXatrV6cJowMJz1GLYV69pZQHe6WVLop+UEyuWayfEROOtLvcxTkZWr5hXBX/jbrUzOiLtn2Jvoe3o6LBu/PXsSm8VnYCKT/tE6jk4b+XSgfkUEzWcsgqFUr9KVqGPp3NboZ9V/XY07DYxuSSsaII8fEF9/qePjD/3WsRvOvH556cXUrCLOw27M50nvMINwmsGh1XrOBKVbCwEXDfQBbDdskC914n5b+C0iEljI7YsaEjn+3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XvDWMmmVJ2gGW28YUyYM45z1XX8rad2PXmHLfNLZUxQ=;
 b=rfTnlPTj1gJBwovYDS23aXdF9d9VllyPDoF18GLPVtXswIDpbtksGkhBGuKd+vXV7ng3Tu/dtVXJXhSNaU6R5utvi/QHFQhIQNfLkr1oVXdCOoByDMtbacZw/aQ9NlC5anrrXo3Kb7hlp/erxsqa9J0mg1OUXW9eD1koGGlKAemdbtHzc2QxIeNNboiG66A5jHQ1J2zPXK3/Zq1Km+xj0KI2v8JObENB09f78U/i0HE1J6ao53aHmtSZoBmurOp7UEssgab0ysreJtpkt9v5KQva+YtTHnu0BBh4SK5jB4zyg/x+g7l5sZN9u/WUSJ5Cnj16Cf2PlsealBDvx5SJAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BL3PR12MB6642.namprd12.prod.outlook.com (2603:10b6:208:38e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 23:43:57 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 23:43:57 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sat, 08 Nov 2025 08:43:12 +0900
Subject: [PATCH v8 11/16] gpu: nova-core: gsp: Add SetSystemInfo command
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251108-gsp_boot-v8-11-70b762eedd50@nvidia.com>
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
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCPR01CA0054.jpnprd01.prod.outlook.com
 (2603:1096:405:2::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BL3PR12MB6642:EE_
X-MS-Office365-Filtering-Correlation-Id: 97d71544-17c5-4c17-cffe-08de1e5784bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RXJWbHN0cy9VUnBFVlgrZVRDR2Z4bGppOFB4U3g0UnhqVmVKeHBaQms0Y1VW?=
 =?utf-8?B?ZFVYbEVmS0NZT00zNjlaVlY4M2cwQStKaFhta2sycUViQ2ZLM1o2ang2UDVR?=
 =?utf-8?B?VVd4ZzhoVkhaRVlEVXo2WDNKQ3dIMzZteXgwamJtVGovSHRiL1NyMTJ4OW9E?=
 =?utf-8?B?RE9GNVpPS0VRU21HMGxvU0VuTDRDWncwWWVTTERJNURsOVdoY3ZmSHU1QUI3?=
 =?utf-8?B?UzRYSDJ5d1oxalhKdWNoY1gySnBCRVFCY0hwUFZuTVJKNjlzQ1g1TGRDcWlT?=
 =?utf-8?B?bWNsd1NhazNDY0lMckJxZ2loT1NrNisxRDVTZFYvNUxCRVpCOTZWNFJXd0ZF?=
 =?utf-8?B?d25xbjE4Kzd6QVVMRWZDWVRsc01CaGpqNVowTElGZnNOR1BMTWdMdXRmdlpO?=
 =?utf-8?B?MEZ1dUVQN1dJSGE0U2hSZjhzZ3JuVElQUUpSQks3NDRnMjA2aVZ3c2ltYU11?=
 =?utf-8?B?VmtyUjJyN3lBdDFyQXlvUHlZNXVLbXJ3RnRVY0pWM2M5L0tPTmY2YXpudk5P?=
 =?utf-8?B?KzA1eXZ0L2RydTN6MXcrV0FuVVFaTkY0M0ZzdmdiUVVITDR1OU16L2lMOHlK?=
 =?utf-8?B?VG5LUnZ1UEczUklvWlZzS1NDSG9Ld0owNGhXaXZER2RYMVpQNk9BdFEvcFFv?=
 =?utf-8?B?dTB6L0JwSko4SldUQ3lJb1I4T0xQVlgxZTJJeGFsbWRJNDBTSGdVek5rQzBl?=
 =?utf-8?B?cCt6NnV6dXQyU3ZqN0FHbGVXdk50eWM1R3lwajFqdlJDaTFtTFBPcUlLK0N3?=
 =?utf-8?B?U3lubnk0M2V5WkpLQjhLNEhxTklBVVpFZTUyZ2p2MmllWnl1cnhoalkwSHZa?=
 =?utf-8?B?ZEhRbE5rTnRqZHpKMDZPT3ovYWxia1U1NE42TFhOdVJmYmNaQ1BUekpYd0U2?=
 =?utf-8?B?Skw4VjNtUk1iQXdMcUF4RTZoN2UxR3E1c1BYUkg4eGx0OGhEOU9HWDlXdFA0?=
 =?utf-8?B?akl6THJYTlF2WXNBMnRkUU4zaW9Jc1E4Y3A2NWV5Tkh1T3lYRzdaVHZJUnBB?=
 =?utf-8?B?WFkzMityZXgwWnFTUmxDaFlhVDNNKzI0TlB5N0JURjlWZkdRd010RnZ0dDBV?=
 =?utf-8?B?QjNYWk1RYlFCblBZOWNqMGhhQmkzc0xZSmpWQlUvRm0vSTNUWjg3UmtHa1Vp?=
 =?utf-8?B?cDJTclNjLzl2d1RuL1hPenVQa212a2FJM3V5dDZSbnhjdXVKbFA5ZjF4RVVH?=
 =?utf-8?B?NTlIWmw1UVBJdkdPWTl3eHNQOUJkNlA4ejk4NTdEWEE5bGdTV3N2ZjdTNndy?=
 =?utf-8?B?NWtKNnhtWXdCb0tvaGRycEJHNU1JeWJtYi8rY1ZmZHgrSnBUZG0rQ0Z2SG5P?=
 =?utf-8?B?MGg2Tk9IQktaN1laVWkrdnEyZTR4Z2NWRDRJdkY1VE1WNlpaY1NWSGRrdHZk?=
 =?utf-8?B?QXprb01BTEVxZjBlRkdCZDRFY2VKV3BXaFNIVThReXorN1prYWtrN1hETTM4?=
 =?utf-8?B?MzhuRmtVd0RncGVHWnBjbUdQU20zN2FMaXRlN3Z0L3dGUlViR0dlalZNM0Iv?=
 =?utf-8?B?RkxBRElTM1VwdUNGeGs0L1hiekZsSWE0SjJlYlgrVDhTczFCTURYWk5DUHJ2?=
 =?utf-8?B?RXVCM1R4NlFocm9uVjhuL3haaEpnQ0VCZDV6UTgzeXRjUWNybXVPZE45TldI?=
 =?utf-8?B?OEg0SG5yOEUxajl5Qmlvb0owUE1YM2UzLzhlM3ZwZGlSN2RWQ3VOdzloV0N0?=
 =?utf-8?B?dko1cldYT2ZyaG5rU0RiTzZidFcyVmRRNTRSMmdLKzQ4UVFEVXZyWXd0UmxM?=
 =?utf-8?B?R1F4M3BnRnJUZHc5bXlTQXFMUmlrcDBXQXNaYWMvanppZENPKzZXeVlTckZn?=
 =?utf-8?B?RkVqQXdiV0pURDh5K3Q4NlY2ZU5KYklhRHNMcnJFUjdOTzBDMDlSK3dQWUVH?=
 =?utf-8?B?dXJVNGFuZFFqZWs2MkMxaVUvNThYUzE2Y3lYZWlKTnBDWXlkenZOWTk3aXI3?=
 =?utf-8?B?RDhUSkdsU0ZkT3dOMTVqcWFzRERjUlQrZW9TN0xGZXNYQVM3M0pSRzFsRnQx?=
 =?utf-8?Q?BssYthM0/Osj5Msk4C4VdtCOmzhYJQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cEVpNk95UlQ1S0hQZHUrSG55K0R5OHNoZ25INmR3ZXE4MTZYTjJpTkVuU0xS?=
 =?utf-8?B?UlIxSUJZUWJma2QyR09TaTJrY293UXZyb3BZL2UrY1JQTUMrZW13NjNHd2E2?=
 =?utf-8?B?UDJpbFA5U2J3akw5Mlo4MkJqaTlSTzJ4cWxYeDRXdGdpRDJ3dTJmOWE0VzFl?=
 =?utf-8?B?Rmo3YmNwZGZYcURRbHhzT3BENDZXM25va2R1bllqZjFmYmk3OUZFMC92QW1x?=
 =?utf-8?B?czYwRW13TE0yM2l4cDBVeXZuWWo3WkpUaW92VXozMUtEN01KakpkbmtBZFIw?=
 =?utf-8?B?UUkrdU5weW1CY1ZneFdXd1ZvNk5DMzA0UzNxVERYT3NDaDliQlZuSjg2MWZT?=
 =?utf-8?B?YXFtSkMrT2NNV2ZldDZrM1N2Rkp2YndaVmxWQnpXNGxWSmpZbHNKRXpJVlRF?=
 =?utf-8?B?dmVDempoTnVOeHN6bGg5ODJ0UW5LemZ2d0wveU1keGFHR2RSL1diQmhvdVps?=
 =?utf-8?B?ai9YMFBvN1VBdkw2Ujc1ZFFLTWM0TWlUK29OdmN5SzNGVU92aDVES3dKZXIy?=
 =?utf-8?B?eGFzWldhVVhDbHdQWUNQNmhGUi9xK0UvSE1DMi8vaFA0NHdHdnFtSDZqVWox?=
 =?utf-8?B?VG1GYldnZGZBUU9MTTVhMnE3Nkt4MkJ4TnlGSU5XOHB3OC9NTG9pUkdPYUN5?=
 =?utf-8?B?dlVFdTg3aWpPSXhMNkRHa09BV3JTUGl3Q0MyeEFCaFh2TndSd3VBem1QRE5r?=
 =?utf-8?B?ano3cDlTYnV1dWFXRnNiaDFFbmxrWWdTYkJrdE5YQy9nQU9pR0p4TGRTbWdL?=
 =?utf-8?B?UGlHRkptczJaaWQ3Wmhsa1FXUXJUWFg4V2JSZWtDY0RMUU5IbERRL1RMZEly?=
 =?utf-8?B?U3k2SVEvS25SUk93RndNeE0ydm1telpTVFFrRmNHa2VYamRVbndlbG9yN2t1?=
 =?utf-8?B?R0VVTlhwVkhzRFdVQW0xS2V5MmllaEJ0Um1BV09JemRscFU3SHJEYmljcXVz?=
 =?utf-8?B?NG9CK0VpYlJZajN3OGpwMmRCYi83aVpwSC8xakJDYkZVME52L3BWNUhWWlR0?=
 =?utf-8?B?YStDd2VSN0pDN2srcjRXVUJ3U0ozdkIwQ0VwNk11Q0RzL0RhSkZrZnlIWmRy?=
 =?utf-8?B?dFk1NE9lUm5ueFRRMjV2L1FzOFRUaUhJUit3cHpLTEtkQkFmbnJkTFhKU3lJ?=
 =?utf-8?B?WHZuU2lMTWI1bE9TRFlRdC80T2wxM2dGenlhbmxGYTMxK2dOcG9kRGJLQTRi?=
 =?utf-8?B?QXdmRml5L3lER3d1MURRcE5kcDY2K1ZxVkk0SWxQRC9rY09vTmk0TDR3eUNk?=
 =?utf-8?B?ZkJrVHJ4RDRDaVdMYmFnWG9aTXREMXUxVWJLbzJoaHpkbjZ3elhla2NUbEo0?=
 =?utf-8?B?RUZHWHVKamJnRklPMGQyK2J0aFdJWld0OXN2aHRpLzJlc3NnQTJ6S25UQlp2?=
 =?utf-8?B?YVpJRUZrSElibTl5Qm4rZTI5RzJqL3FmNnM4dFJpQ25LWHd5QmxDSTVKK2Ju?=
 =?utf-8?B?T2tIL2VRbGd5Q0VFcENFaU5tZkhYWXZyNktZWmpUTC9UbGRoOU4zU0dTUWxZ?=
 =?utf-8?B?MnBQNHI1UFo1dUxUbUNwRTdwY2tyU3ROSG14bWFEK1RUL3FpbENiN2N4WGRR?=
 =?utf-8?B?TkRpSFU2eDRxZ2liMWhVb21vV2VYd0tpdjNsc21GN2FlZ3ExNGMvM0RCaTlZ?=
 =?utf-8?B?RGlwUkJ5QXF2cGVzeHlPWk1LWjB2UWt1citMdURaRGJZMnRkamt5TEVmMlZB?=
 =?utf-8?B?K0kvSmgyZU9Nb0I0anpOYnpJdk5uT0pXQUpSVkxIakJpT1lSbFZBbEEwUW11?=
 =?utf-8?B?NlU4SFhGdFFjM0draGhSa3hkc2tER2paN1h3Vkt0WG9BYXBGMEd2MEdEN3Iv?=
 =?utf-8?B?cjFKZ2l1T0hMY3hsRXFXL2hqNitaMHZRQWRmbm10eXp3UUgzVmx6bG1NYVlw?=
 =?utf-8?B?SWhhd0tVUElXcWE5amRaZHF3S21xYnNVVUZ3a1ZPS2w1RTgyejdES1o0Mm4x?=
 =?utf-8?B?ODJFbGhRY1luT1drekhPdnZpOVRqRUFMQ2lnYnFUMjZTZ3pLZE9CZ0dBSUVz?=
 =?utf-8?B?MWV5eCt0Tjd0eTFLZStMa3JZeU5aQS9FZWJOOXcvcDNNNXR4T2ZqL0pPNUgr?=
 =?utf-8?B?QWJLVUxGRU1FbFM1RjEvOWd0S0srZ2tqRTBTaEwzaGV1MzV0TUlYSXhrcno2?=
 =?utf-8?B?QS8rdzVEa2FMVmFvZE9FeGliaWJiSmVUSG9QaDRXYnl4Ty83RjJtajFNVnBS?=
 =?utf-8?Q?uC5HbBDl+hRKNUkO32q8iT6lv+HoGPb7clZcaGysd1JE?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97d71544-17c5-4c17-cffe-08de1e5784bb
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 23:43:57.2421 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cup6z8JbUvAUyPBxwjxTMb2wad2IAwD2onizdqatcE2L3umRKA9/pq23TN3lrbveijLTznmyTovP+HE7Kj6nmg==
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

From: Alistair Popple <apopple@nvidia.com>

Add support for sending the SetSystemInfo command, which provides
required hardware information to the GSP and is critical to its
initialization.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gsp.rs                      |   1 +
 drivers/gpu/nova-core/gsp/boot.rs                 |  10 +-
 drivers/gpu/nova-core/gsp/cmdq.rs                 |   1 -
 drivers/gpu/nova-core/gsp/commands.rs             |  31 +++++
 drivers/gpu/nova-core/gsp/fw.rs                   |   1 +
 drivers/gpu/nova-core/gsp/fw/commands.rs          |  56 +++++++++
 drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs | 132 ++++++++++++++++++++++
 7 files changed, 229 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index bc897e57f396..325d8ecad7dd 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -13,6 +13,7 @@
 use crate::gsp::cmdq::Cmdq;
 
 pub(crate) mod cmdq;
+pub(crate) mod commands;
 mod fw;
 
 use fw::GspArgumentsCached;
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 5ea53250bf37..b1c1fe77cbf2 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -29,7 +29,10 @@
         FIRMWARE_VERSION, //
     },
     gpu::Chipset,
-    gsp::GspFwWprMeta,
+    gsp::{
+        commands,
+        GspFwWprMeta, //
+    },
     regs,
     vbios::Vbios,
 };
@@ -119,7 +122,7 @@ fn run_fwsec_frts(
     ///
     /// Upon return, the GSP is up and running, and its runtime object given as return value.
     pub(crate) fn boot(
-        self: Pin<&mut Self>,
+        mut self: Pin<&mut Self>,
         pdev: &pci::Device<device::Bound>,
         bar: &Bar0,
         chipset: Chipset,
@@ -153,6 +156,9 @@ pub(crate) fn boot(
             CoherentAllocation::<GspFwWprMeta>::alloc_coherent(dev, 1, GFP_KERNEL | __GFP_ZERO)?;
         dma_write!(wpr_meta[0] = GspFwWprMeta::new(&gsp_fw, &fb_layout))?;
 
+        self.cmdq
+            .send_gsp_command(bar, commands::SetSystemInfo::new(pdev))?;
+
         Ok(())
     }
 }
diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 4a6c0e14ed53..4749fe88e621 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -440,7 +440,6 @@ fn notify_gsp(bar: &Bar0) {
     /// written to by its [`CommandToGsp::init_variable_payload`] method.
     ///
     /// Error codes returned by the command initializers are propagated as-is.
-    #[expect(unused)]
     pub(crate) fn send_gsp_command<M>(&mut self, bar: &Bar0, command: M) -> Result
     where
         M: CommandToGsp,
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
new file mode 100644
index 000000000000..091dbe59f655
--- /dev/null
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use kernel::device;
+use kernel::pci;
+use kernel::prelude::*;
+
+use super::fw::commands::GspSetSystemInfo;
+use super::fw::MsgFunction;
+use crate::gsp::cmdq::CommandToGsp;
+
+/// The `GspSetSystemInfo` command.
+pub(crate) struct SetSystemInfo<'a> {
+    pdev: &'a pci::Device<device::Bound>,
+}
+
+impl<'a> SetSystemInfo<'a> {
+    /// Creates a new `GspSetSystemInfo` command using the parameters of `pdev`.
+    pub(crate) fn new(pdev: &'a pci::Device<device::Bound>) -> Self {
+        Self { pdev }
+    }
+}
+
+impl<'a> CommandToGsp for SetSystemInfo<'a> {
+    const FUNCTION: MsgFunction = MsgFunction::GspSetSystemInfo;
+    type Command = GspSetSystemInfo;
+    type InitError = Error;
+
+    fn init(&self) -> impl Init<Self::Command, Self::InitError> {
+        GspSetSystemInfo::init(self.pdev)
+    }
+}
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index b083a6a5754c..cacdfb2d4810 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 
+pub(crate) mod commands;
 mod r570_144;
 
 // Alias to avoid repeating the version number with every use.
diff --git a/drivers/gpu/nova-core/gsp/fw/commands.rs b/drivers/gpu/nova-core/gsp/fw/commands.rs
new file mode 100644
index 000000000000..0d3c46f793dd
--- /dev/null
+++ b/drivers/gpu/nova-core/gsp/fw/commands.rs
@@ -0,0 +1,56 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use kernel::prelude::*;
+use kernel::transmute::{AsBytes, FromBytes};
+use kernel::{device, pci};
+
+use crate::gsp::GSP_PAGE_SIZE;
+
+use super::bindings;
+
+/// Payload of the `GspSetSystemInfo` command.
+#[repr(transparent)]
+pub(crate) struct GspSetSystemInfo {
+    inner: bindings::GspSystemInfo,
+}
+static_assert!(size_of::<GspSetSystemInfo>() < GSP_PAGE_SIZE);
+
+impl GspSetSystemInfo {
+    /// Returns an in-place initializer for the `GspSetSystemInfo` command.
+    #[allow(non_snake_case)]
+    pub(crate) fn init<'a>(dev: &'a pci::Device<device::Bound>) -> impl Init<Self, Error> + 'a {
+        type InnerGspSystemInfo = bindings::GspSystemInfo;
+        let init_inner = try_init!(InnerGspSystemInfo {
+            gpuPhysAddr: dev.resource_start(0)?,
+            gpuPhysFbAddr: dev.resource_start(1)?,
+            gpuPhysInstAddr: dev.resource_start(3)?,
+            nvDomainBusDeviceFunc: u64::from(dev.dev_id()),
+
+            // Using TASK_SIZE in r535_gsp_rpc_set_system_info() seems wrong because
+            // TASK_SIZE is per-task. That's probably a design issue in GSP-RM though.
+            maxUserVa: (1 << 47) - 4096,
+            pciConfigMirrorBase: 0x088000,
+            pciConfigMirrorSize: 0x001000,
+
+            PCIDeviceID: (u32::from(dev.device_id()) << 16) | u32::from(dev.vendor_id().as_raw()),
+            PCISubDeviceID: (u32::from(dev.subsystem_device_id()) << 16)
+                | u32::from(dev.subsystem_vendor_id()),
+            PCIRevisionID: u32::from(dev.revision_id()),
+            bIsPrimary: 0,
+            bPreserveVideoMemoryAllocations: 0,
+            ..Zeroable::init_zeroed()
+        });
+
+        try_init!(GspSetSystemInfo {
+            inner <- init_inner,
+        })
+    }
+}
+
+// SAFETY: These structs don't meet the no-padding requirements of AsBytes but
+//         that is not a problem because they are not used outside the kernel.
+unsafe impl AsBytes for GspSetSystemInfo {}
+
+// SAFETY: These structs don't meet the no-padding requirements of FromBytes but
+//         that is not a problem because they are not used outside the kernel.
+unsafe impl FromBytes for GspSetSystemInfo {}
diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
index 17fb2392ec3c..1251b0c313ce 100644
--- a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
@@ -321,6 +321,138 @@ fn fmt(&self, fmt: &mut ::core::fmt::Formatter<'_>) -> ::core::fmt::Result {
 pub type _bindgen_ty_3 = ffi::c_uint;
 #[repr(C)]
 #[derive(Debug, Default, Copy, Clone, Zeroable)]
+pub struct DOD_METHOD_DATA {
+    pub status: u32_,
+    pub acpiIdListLen: u32_,
+    pub acpiIdList: [u32_; 16usize],
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, Zeroable)]
+pub struct JT_METHOD_DATA {
+    pub status: u32_,
+    pub jtCaps: u32_,
+    pub jtRevId: u16_,
+    pub bSBIOSCaps: u8_,
+    pub __bindgen_padding_0: u8,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, Zeroable)]
+pub struct MUX_METHOD_DATA_ELEMENT {
+    pub acpiId: u32_,
+    pub mode: u32_,
+    pub status: u32_,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, Zeroable)]
+pub struct MUX_METHOD_DATA {
+    pub tableLen: u32_,
+    pub acpiIdMuxModeTable: [MUX_METHOD_DATA_ELEMENT; 16usize],
+    pub acpiIdMuxPartTable: [MUX_METHOD_DATA_ELEMENT; 16usize],
+    pub acpiIdMuxStateTable: [MUX_METHOD_DATA_ELEMENT; 16usize],
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, Zeroable)]
+pub struct CAPS_METHOD_DATA {
+    pub status: u32_,
+    pub optimusCaps: u32_,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, Zeroable)]
+pub struct ACPI_METHOD_DATA {
+    pub bValid: u8_,
+    pub __bindgen_padding_0: [u8; 3usize],
+    pub dodMethodData: DOD_METHOD_DATA,
+    pub jtMethodData: JT_METHOD_DATA,
+    pub muxMethodData: MUX_METHOD_DATA,
+    pub capsMethodData: CAPS_METHOD_DATA,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, Zeroable)]
+pub struct BUSINFO {
+    pub deviceID: u16_,
+    pub vendorID: u16_,
+    pub subdeviceID: u16_,
+    pub subvendorID: u16_,
+    pub revisionID: u8_,
+    pub __bindgen_padding_0: u8,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, Zeroable)]
+pub struct GSP_VF_INFO {
+    pub totalVFs: u32_,
+    pub firstVFOffset: u32_,
+    pub FirstVFBar0Address: u64_,
+    pub FirstVFBar1Address: u64_,
+    pub FirstVFBar2Address: u64_,
+    pub b64bitBar0: u8_,
+    pub b64bitBar1: u8_,
+    pub b64bitBar2: u8_,
+    pub __bindgen_padding_0: [u8; 5usize],
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, Zeroable)]
+pub struct GSP_PCIE_CONFIG_REG {
+    pub linkCap: u32_,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, Zeroable)]
+pub struct GspSystemInfo {
+    pub gpuPhysAddr: u64_,
+    pub gpuPhysFbAddr: u64_,
+    pub gpuPhysInstAddr: u64_,
+    pub gpuPhysIoAddr: u64_,
+    pub nvDomainBusDeviceFunc: u64_,
+    pub simAccessBufPhysAddr: u64_,
+    pub notifyOpSharedSurfacePhysAddr: u64_,
+    pub pcieAtomicsOpMask: u64_,
+    pub consoleMemSize: u64_,
+    pub maxUserVa: u64_,
+    pub pciConfigMirrorBase: u32_,
+    pub pciConfigMirrorSize: u32_,
+    pub PCIDeviceID: u32_,
+    pub PCISubDeviceID: u32_,
+    pub PCIRevisionID: u32_,
+    pub pcieAtomicsCplDeviceCapMask: u32_,
+    pub oorArch: u8_,
+    pub __bindgen_padding_0: [u8; 7usize],
+    pub clPdbProperties: u64_,
+    pub Chipset: u32_,
+    pub bGpuBehindBridge: u8_,
+    pub bFlrSupported: u8_,
+    pub b64bBar0Supported: u8_,
+    pub bMnocAvailable: u8_,
+    pub chipsetL1ssEnable: u32_,
+    pub bUpstreamL0sUnsupported: u8_,
+    pub bUpstreamL1Unsupported: u8_,
+    pub bUpstreamL1PorSupported: u8_,
+    pub bUpstreamL1PorMobileOnly: u8_,
+    pub bSystemHasMux: u8_,
+    pub upstreamAddressValid: u8_,
+    pub FHBBusInfo: BUSINFO,
+    pub chipsetIDInfo: BUSINFO,
+    pub __bindgen_padding_1: [u8; 2usize],
+    pub acpiMethodData: ACPI_METHOD_DATA,
+    pub hypervisorType: u32_,
+    pub bIsPassthru: u8_,
+    pub __bindgen_padding_2: [u8; 7usize],
+    pub sysTimerOffsetNs: u64_,
+    pub gspVFInfo: GSP_VF_INFO,
+    pub bIsPrimary: u8_,
+    pub isGridBuild: u8_,
+    pub __bindgen_padding_3: [u8; 2usize],
+    pub pcieConfigReg: GSP_PCIE_CONFIG_REG,
+    pub gridBuildCsp: u32_,
+    pub bPreserveVideoMemoryAllocations: u8_,
+    pub bTdrEventSupported: u8_,
+    pub bFeatureStretchVblankCapable: u8_,
+    pub bEnableDynamicGranularityPageArrays: u8_,
+    pub bClockBoostSupported: u8_,
+    pub bRouteDispIntrsToCPU: u8_,
+    pub __bindgen_padding_4: [u8; 6usize],
+    pub hostPageSize: u64_,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, Zeroable)]
 pub struct MESSAGE_QUEUE_INIT_ARGUMENTS {
     pub sharedMemPhysAddr: u64_,
     pub pageTableEntryCount: u32_,

-- 
2.51.2


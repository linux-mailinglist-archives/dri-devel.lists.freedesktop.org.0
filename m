Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0092BA6A762
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 14:40:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7D6A10E628;
	Thu, 20 Mar 2025 13:40:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="he1IvUXN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060.outbound.protection.outlook.com [40.107.244.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C29910E620;
 Thu, 20 Mar 2025 13:40:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PoAEooKP0tnu8/5RFiPk7TMVTigkcOMJiSxEC/taWnN2RyRPF4nf+u/lhQ4z3dJM6N0eWieInxm0mNsHUtWBZw37Ix5ziRXHb4VX5Rhf3xga1t8W4JUA7e9VYp+v/c+voaCwM1cDsPDLWL8EXNYvarCKD5+pnwJHaSoH4VyILMM7vCKsdBRirJxh2xQ5AScobBqOhW997jCiShcIUuWyRmi8qwBRD9mF2fe8sJFVI/cfnltybiENKzXsgaPx61u/TC0F5TRgDOt9liCAlexaKJSA2skAjksIgVH/ybXwXPVLHOjBjbSOGuolfyCWDQowMsjTQqYqCckTQKF22uRpqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OffwsY/+VwoJMXY1hbuN+yAmEqDYy9rT93dxYRIKGGU=;
 b=iYCykiLlu8vxB4a8GdDYJ/f8JzcYz6GwQYWrq6jdwhh+p+LB5s/Qoi3uz+PLDcObNgm4QkSRhL+fiRj059r/ESvPp+P52XvFiduvnYAsdNX5l0V3T+NtU0/YvSasV2fh/OeBiYHw6Z/El8/nRPEzxZNwtzz/jqv2ZJ7g1t2a3a70KacdpsCXNOSqGi0MH5lAAjER2fFazVJc/4cA5VgQlliaJ18+Jed/2btnj7ezCcmoeXgWrQDZ6wif/vz2pDM5IEj+eoOcEtFCYDlHkPUM8wmX/e6T6jm9/6x3i3XBN6/PWUz2weQW6Qm7B3h0HhCZhJ9IatkrSITsq255ipi0PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OffwsY/+VwoJMXY1hbuN+yAmEqDYy9rT93dxYRIKGGU=;
 b=he1IvUXN5bDH1zQ3cBrmPLpqk9MISaSqsF8+JShEf4Yma3bji0rDMowab6Vh5bDD3zZMVK8G04DQsgESmLST8WmJMsw26wuuzB5PKcqat3RDTKej7kZeTJFn8RnfQGoM8rMIiYcZjerOxxaFitTBEIB33YE4CJcKq/GCEdaqIiL4O5m5WkRQiChUVtHdEllAzwXcExiCKeUpzqFCnExEjgapfkcepS6ROD77YHDLI4JQEf1btP1FGF4lDWpelwcezemLN6Gzve6QTamf6jHF5hb2vIDemO0UDw+dkHuJWDBWefLKEGclbScghhnaNUsSpWc+fmlOze0T3czyzRNuyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA1PR12MB6409.namprd12.prod.outlook.com (2603:10b6:208:38b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.35; Thu, 20 Mar
 2025 13:39:55 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%6]) with mapi id 15.20.8534.034; Thu, 20 Mar 2025
 13:39:55 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 20 Mar 2025 22:39:15 +0900
Subject: [PATCH RFC v3 7/7] gpu: nova-core: add falcon register definitions
 and probe code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250320-nova_timer-v3-7-79aa2ad25a79@nvidia.com>
References: <20250320-nova_timer-v3-0-79aa2ad25a79@nvidia.com>
In-Reply-To: <20250320-nova_timer-v3-0-79aa2ad25a79@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCPR01CA0065.jpnprd01.prod.outlook.com
 (2603:1096:405:2::29) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA1PR12MB6409:EE_
X-MS-Office365-Filtering-Correlation-Id: da629228-f227-45c9-08d2-08dd67b4b328
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|10070799003|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cWt1QzhRaUg3ZFRJck94TDV0cGFvRldYdURQa1R0WmxQeUY5Kzh6OW1iSG1i?=
 =?utf-8?B?QU5YV1NhZDhxMlJQNmkzWDlpQlUxdERLcEpFaFhiVExIZTZud0hqc3AxUGZp?=
 =?utf-8?B?S1ZMMmh2MElKVFNYOXhUc1dRaDN3L3pQdGNsOXBrNlE4NVByTTM2KzVXSlhX?=
 =?utf-8?B?YlRpYWZXYmNxVWZ1WmpwZnFNd29kN3NaanFvSHZ2cnJ3bXp2aFhWQzVkK0U2?=
 =?utf-8?B?d2dUUWc1SFgyejJWMGdERGUzVVoxc1FOY3U5Q1FWeTJxRWRYQVcrT2VwRith?=
 =?utf-8?B?YldwUjhudHRjZ094aC84T2hBTks1bVNUejJZTjlMSnRqNEVZU2hiSEhPMVFr?=
 =?utf-8?B?RWd6cld3UVhaa2NyN2dNK05VSnJzU2VCbm82TktvOExBYkF3aVluQVBOdWYv?=
 =?utf-8?B?SU50OG5IN0VOem1pTTM1M2VCVGhONDJWam55RVpVWDRQU3Rpc3B2ci9vN1VG?=
 =?utf-8?B?T2kwcnRSUkIvR2FoZVdwN3AzbkZ3REhjdnFxc0RRdTZaZ2ZYVVg3bFJ5UEdw?=
 =?utf-8?B?NWxIN3U5VHBVZmI4RVRuSkdvZVhBZjRWbG5zc3VXQU16MUdWQU9XR1dnYi84?=
 =?utf-8?B?eExRd2JRN3IwYnIwNlZaS3p1Z2VYQnNUR2VZMTU5YnA5R1Nna1d2QmVGRFdM?=
 =?utf-8?B?a2dXVzBZcE5VbWczU3ZWQXBRM1BsWDNpRnBteW9NRW5jR3FMWWgvaUFScU1o?=
 =?utf-8?B?eWJDbUJsZDU2a2RKWlk0WVNXQy9LQ0lFVFNqNk5mRE5Hb2tCSWcwT1hMWnNM?=
 =?utf-8?B?dkxiaVJCQTkwSEtXc1pmUjQzUHN6NVpKdVVGVitUaUIxRG9nTFNwOE1JajBm?=
 =?utf-8?B?U0FwKzRndWlob0lYd3NVelJ1VzZXNE5tVW90TndoV3BrdG9Rb1piZTQ1VTNS?=
 =?utf-8?B?eDltNmVpSU1GWFZPTDdycVQvRVhxU1FJM2FvWTBIUlFwS0VES3ZhY3p2aUFp?=
 =?utf-8?B?YTY2RGlXSDhmVnBvNmtrWEVFcVhkVi96MktjcTljdzkyWnh5eHZrYWVzeEN1?=
 =?utf-8?B?VzQzeC9ZMUlBdzJnakFwV0QrMjhRRGxwZy9lSXJNYjRLY2hjblZwOHl6Tmhs?=
 =?utf-8?B?ZS9BY1JiMnZCY0hDYUdxVWZvZVNtNG9PUERPbXZpeUVGSTFtMEdZYlZjK1dP?=
 =?utf-8?B?WkE3Q3dJaTd0a3FJanc0YjYzMk9SaHVnNVVWdm5kY3lmVlp5S3d1K2Zxclox?=
 =?utf-8?B?N055T1BCblQ5YzMyV0IrUkt6Ui96bktTMFFqTUlxK0lYZTFFOHlRRDVBNm9B?=
 =?utf-8?B?UUx2UFlHMnloK1dGbDQraTBHRlRDYjNBbnc0K2JqSTlnTkpNSmkxUnFrazBz?=
 =?utf-8?B?RFQyZXROcHhHODFScWV4eThjTEs1UTV1ZkVpRTRVc2U2ZU5aMWRlMyt0QVUw?=
 =?utf-8?B?OHNBNERvK3ZIS245T0FoTjN4eEJoUTlBZVRkVFVXYzlVZ2ViYjZ2K3pRNTNx?=
 =?utf-8?B?NkVQWjdwS0tQNmh4c2tiUGdoTXhwaWJVWjlFTXVoOG5LdktTb2k4Y05aS0NF?=
 =?utf-8?B?aDI2SVhvd0tkU3hZVUt3NzZ4T2RBV3htREcrdzZLSk1xSllITXZrdXVOb0pR?=
 =?utf-8?B?WFB3NEt5RDhFbTFJWFNmbGp0VDdLTzh3bE1BMGJKQ0cxRmVNY2oveHVpMVVQ?=
 =?utf-8?B?anRGbnMwM2c4YThVaWtOeHpRWndvQ1BZV2FUbmJSU0RlelVjb0wrbDZyTzUz?=
 =?utf-8?B?d3hzbmlDSnZDeVBXbDkwTi9NdHRJL0c2cklBVXdTbzhEMDJHanlUNE1MRG5P?=
 =?utf-8?B?WG9UTndTYnVBRTZPbHRyMGhweHBMQ1g0UEo0WTlUYzFWdy9lb2VlZmtpRGdu?=
 =?utf-8?B?RUk4QkxxVjRPaHMzSnRVSHJGbS9RN2greXNDcktFT1VTRWhJZHZrSWg2OUY4?=
 =?utf-8?B?eWZ2OXM1dFQrNitML1c0NnJqcUlqWmZadHk4aTBVTmFMYk1xYWluaGpYK1Fj?=
 =?utf-8?Q?x/OuUPnGRLc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TG9QNzk0RSthSkpyU3pjYVUvMFRXZFdKYVk5V0Q0bkdaNHZpMFEyMGlnOEZP?=
 =?utf-8?B?dWlVRHpYSWpTMTdGaEdDbDk5ZW9jK0ZlWXFGeFBiTHdFMXlpZ2hhNXZMTkV4?=
 =?utf-8?B?di9LSXhFSmFOc3pHV3JTeGh0VGozUjNqMzNNdzRiMDROTFRSWDZJb0FYYjND?=
 =?utf-8?B?RDVESUUweE5kTTkyTkUwSDA4Ulk1T09CTzg5Y1pMYUM0R3l4ckpSVGNrVWhl?=
 =?utf-8?B?M1NvN0M4UWJKbFJiQXFMU3lUMUkzakQ3VzdSMXI4UHFEUEU4aWgwZ2R6QlVz?=
 =?utf-8?B?Y1NTcGYyUGQ2UUJCOEFzK3VTVVcvUjQzUmZYeXpyU1V4eDBRSVMwbnowaWQr?=
 =?utf-8?B?Ti8xVEJjRW10NXhjTGx3REwzUzBTWHFCaWs4SlpMZUtIcmo0T0pDSWhlajNO?=
 =?utf-8?B?b3pJVGkrRnFUWVZUUjIxUGlEZXhYR2hJUEVsWUd3NU44Y0pOOUppUG5wdUtH?=
 =?utf-8?B?WVhySW9GTDhyK0xIemVibzcvdXZhUjBYTU53SVpvYXZiS2M0T2RYbmJDNmFo?=
 =?utf-8?B?RzlONHhQM3lZVGlYcmZGbTFwTU51QzFyWEJSdDRTWjh3TVQxVEZ3QTlMbkhE?=
 =?utf-8?B?K1MrbWdiMUk4b01TUnVFSVB1TWNjQVRyTWgvdTdtZ1ExUzA1NzJSZWVnb0tr?=
 =?utf-8?B?dnZZYVdhQW10V2xhVXlIRHdSNHVhbjdqR2t0YlByZ3lyTVFsVU1xZGNsRE1s?=
 =?utf-8?B?eGxQT28yQzlob2JwL0RKbXNyUURPaWh2cm1DTTBsY2hocjllM1EyY1hrbWR2?=
 =?utf-8?B?WlRjWFd3Y21ZL2N3Y3oxeGw1d2tzYTFYR0phQmRIeVRDc0krdjV4YVpQS0ov?=
 =?utf-8?B?cU9zWEFkemsrT3JkZ2xqdlR3cWQ3aDRTQWxDQi9hQmlTdXcrOEtkaEMrVUpW?=
 =?utf-8?B?S3ZJSmJOb0NGMFYydHgwbFVXSzExRGFwQjZES1JWaTNmcHoxS0dIbDFSN0pH?=
 =?utf-8?B?N1lxUDM0Q2doalJQWVNGeFlNWWV0Mm1JMStSYlAraXlsQVM1TUsyakIzdDI2?=
 =?utf-8?B?b3dWMzRNcXNjU2ZVY2l5WFNDdlBkeGlIN0o3ckwvc25GUWR2NkM5NmdmcHBB?=
 =?utf-8?B?dGZrc0J5SG81RzVoT0IrVEc1V0JrM0t5c0JWMU9yVTk2Kzh1cHZSUXhwU0Uz?=
 =?utf-8?B?MlpKdW51UFhBUzFsemxOWWExa1U5ZmhELzRLb3NnUStEWHkycUs5RHhKVGFq?=
 =?utf-8?B?TVRGSU16b2VmY3VaZDZ1TW5PVDVYaUdzVzdGM0VzYVYweFMrYkZyYi9GeXgz?=
 =?utf-8?B?ZUdrbGoyYm40VTVEYVpJMmQ5a2g5REM0K0lWWEpHMHRpZWxFZVQxc3NHcFJT?=
 =?utf-8?B?Q0hwelJiVnZkcHNza0Q0bmNNcnE3K0dpMllXRmRkV3UwbTl2NVhucTVTK1VF?=
 =?utf-8?B?VlE4WmhKYkI5aVhwcjJnVjZHc3JhYzUxMjBnSVJJQi9QZE14T1VUempPQ0My?=
 =?utf-8?B?VkZDNlpiemhpZld4MTN3ZVVnTUJLK3o1U21vUklxbWNkTXVySFA3UVBNUjBr?=
 =?utf-8?B?S3loYS9GYUZuR0FKelNHOGh3czhaNHYwT0FxUXNvSSsrd3RkcWthZHBHQnNj?=
 =?utf-8?B?ald0dzE0amdCYmp1ZXhpRTZqV01TaXlWc1N2bTIybVJXeVF6OWhXaTB3b2lk?=
 =?utf-8?B?RCtDS0RHakhPT0dzR2t0a0YyMXYvZE1xS1VlcXlDWGt1cXBZNnljSTJwdDls?=
 =?utf-8?B?NVNnS0NEaGh2cmVLQ0JPdEtTV01OUjdIdFgydW5vYy9lNXVjdlN2TWRGaStZ?=
 =?utf-8?B?U3Y5T1pqbFRuVEsrdVhDRng0cGpqTUlMQWQ2MWsxNmxkS2dQUm03S0puNWR3?=
 =?utf-8?B?Z01VQnlMNXlQTGpUSkErSlNMZktKTkQxRVVWb0RMeDI2aGVyb2hMMU1KQ09S?=
 =?utf-8?B?WUlpR1I4eHdRZjhHaDRmYSt4ejBud0RwRmZrNHJmN003WVVXazdxSzY3WG51?=
 =?utf-8?B?ZklBNnE1OEJUWjRUa0haRnllK3ZyamdHdVFYVmRuaXNaUkVVV2lNR2ZYVjJo?=
 =?utf-8?B?bGlsRUZpQ0d2NDN0U1VwbC9XcWRnTnZqSUlLdEIzNlpVRGhQSFFkc0h6TnNX?=
 =?utf-8?B?RXIxZjU5TU42S3MybmlUUUhvWHQ3R1RlaXE5TGNzdDM2Vkt2b1ZOcWxSdi9B?=
 =?utf-8?B?L3J5RkRKOWRMVFlkdXh0SDlHbzFUN1pJYUczcWhQQ2gvNjd4NXF1Sjkzb1BH?=
 =?utf-8?Q?MKVgT8I+oRO+azIo2YGr9kRtxkZTBru7A4cSRqW+GRgg?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da629228-f227-45c9-08d2-08dd67b4b328
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 13:39:55.7385 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z6pIvbBBXC7EqO2Vr8BkmsMKvPQaztbarcA/QB9A8wNDf10IeBxzwN5PUAoCT/LqjIqyVNgJcjkxbiynzdN/JA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6409
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

This is still very preliminary work, and is mostly designed to show how
register fields can be turned into safe types that force us to handle
invalid values.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/driver.rs    |   2 +-
 drivers/gpu/nova-core/falcon.rs    | 618 +++++++++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/gpu.rs       |  13 +
 drivers/gpu/nova-core/nova_core.rs |   1 +
 drivers/gpu/nova-core/regs.rs      | 188 ++++++++++-
 5 files changed, 820 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index 0cd23aa306e4082405f480afc0530a41131485e7..dee5fd22eecb2ce1f4ea765338b0c1b68853b2d3 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -10,7 +10,7 @@ pub(crate) struct NovaCore {
     pub(crate) gpu: Gpu,
 }
 
-const BAR0_SIZE: usize = 0x9500;
+const BAR0_SIZE: usize = 0x1000000;
 pub(crate) type Bar0 = pci::Bar<BAR0_SIZE>;
 
 kernel::pci_device_table!(
diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
new file mode 100644
index 0000000000000000000000000000000000000000..0dd4b45abbe0a62238efe24d899c55d5db348586
--- /dev/null
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -0,0 +1,618 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Falcon microprocessor base support
+
+// TODO: remove this once this module is actively used.
+#![allow(dead_code)]
+
+use core::hint::unreachable_unchecked;
+use core::marker::PhantomData;
+use core::time::Duration;
+use kernel::bindings;
+use kernel::devres::Devres;
+use kernel::{pci, prelude::*};
+
+use crate::driver::Bar0;
+use crate::gpu::Chipset;
+use crate::regs;
+use crate::timer::Timer;
+
+#[repr(u8)]
+#[derive(Debug, Default, Copy, Clone, PartialEq, Eq, PartialOrd, Ord)]
+pub(crate) enum FalconCoreRev {
+    #[default]
+    Rev1 = 1,
+    Rev2 = 2,
+    Rev3 = 3,
+    Rev4 = 4,
+    Rev5 = 5,
+    Rev6 = 6,
+    Rev7 = 7,
+}
+
+impl TryFrom<u32> for FalconCoreRev {
+    type Error = Error;
+
+    fn try_from(value: u32) -> core::result::Result<Self, Self::Error> {
+        use FalconCoreRev::*;
+
+        let rev = match value {
+            1 => Rev1,
+            2 => Rev2,
+            3 => Rev3,
+            4 => Rev4,
+            5 => Rev5,
+            6 => Rev6,
+            7 => Rev7,
+            _ => return Err(EINVAL),
+        };
+
+        Ok(rev)
+    }
+}
+
+#[repr(u8)]
+#[derive(Debug, Default, Copy, Clone)]
+pub(crate) enum FalconSecurityModel {
+    #[default]
+    None = 0,
+    Light = 2,
+    Heavy = 3,
+}
+
+impl TryFrom<u32> for FalconSecurityModel {
+    type Error = Error;
+
+    fn try_from(value: u32) -> core::result::Result<Self, Self::Error> {
+        use FalconSecurityModel::*;
+
+        let sec_model = match value {
+            0 => None,
+            2 => Light,
+            3 => Heavy,
+            _ => return Err(EINVAL),
+        };
+
+        Ok(sec_model)
+    }
+}
+
+#[repr(u8)]
+#[derive(Debug, Default, Copy, Clone, PartialEq, Eq, PartialOrd, Ord)]
+pub(crate) enum FalconCoreRevSubversion {
+    #[default]
+    Subversion0 = 0,
+    Subversion1 = 1,
+    Subversion2 = 2,
+    Subversion3 = 3,
+}
+
+impl From<u32> for FalconCoreRevSubversion {
+    fn from(value: u32) -> Self {
+        use FalconCoreRevSubversion::*;
+
+        match value & 0b11 {
+            0 => Subversion0,
+            1 => Subversion1,
+            2 => Subversion2,
+            3 => Subversion3,
+            // SAFETY: the `0b11` mask limits the possible values to `0..=3`.
+            4..=u32::MAX => unsafe { unreachable_unchecked() },
+        }
+    }
+}
+
+#[repr(u8)]
+#[derive(Debug, Default, Copy, Clone, PartialEq, Eq)]
+pub(crate) enum FalconModSelAlgo {
+    #[default]
+    Rsa3k = 1,
+}
+
+impl TryFrom<u32> for FalconModSelAlgo {
+    type Error = Error;
+
+    fn try_from(value: u32) -> core::result::Result<Self, Self::Error> {
+        match value {
+            1 => Ok(FalconModSelAlgo::Rsa3k),
+            _ => Err(EINVAL),
+        }
+    }
+}
+
+#[derive(Debug, Clone, Copy, PartialEq, Eq)]
+pub(crate) enum RiscvCoreSelect {
+    Falcon = 0,
+    Riscv = 1,
+}
+
+impl From<bool> for RiscvCoreSelect {
+    fn from(value: bool) -> Self {
+        match value {
+            false => RiscvCoreSelect::Falcon,
+            true => RiscvCoreSelect::Riscv,
+        }
+    }
+}
+
+#[derive(Debug, Clone, Copy, PartialEq, Eq)]
+pub(crate) enum FalconMem {
+    Imem,
+    Dmem,
+}
+
+#[repr(C)]
+#[derive(Debug, Clone, Copy)]
+pub(crate) struct FalconUCodeDescV3 {
+    pub(crate) hdr: u32,
+    pub(crate) stored_size: u32,
+    pub(crate) pkc_data_offset: u32,
+    pub(crate) interface_offset: u32,
+    pub(crate) imem_phys_base: u32,
+    pub(crate) imem_load_size: u32,
+    pub(crate) imem_virt_base: u32,
+    pub(crate) dmem_phys_base: u32,
+    pub(crate) dmem_load_size: u32,
+    pub(crate) engine_id_mask: u16,
+    pub(crate) ucode_id: u8,
+    pub(crate) signature_count: u8,
+    pub(crate) signature_versions: u16,
+    _reserved: u16,
+}
+
+impl FalconUCodeDescV3 {
+    pub(crate) fn ver(&self) -> u8 {
+        ((self.hdr & 0xff00) >> 8) as u8
+    }
+
+    pub(crate) fn size(&self) -> usize {
+        ((self.hdr & 0xffff0000) >> 16) as usize
+    }
+}
+
+/// Trait defining the parameters of a given Falcon instance.
+pub(crate) trait FalconInstance {
+    /// Base I/O address for the falcon, relative from which its registers are accessed.
+    const BASE: usize;
+}
+
+pub(crate) struct Gsp;
+impl FalconInstance for Gsp {
+    const BASE: usize = 0x00110000;
+}
+pub(crate) type GspFalcon = Falcon<Gsp>;
+
+pub(crate) struct Sec2;
+impl FalconInstance for Sec2 {
+    const BASE: usize = 0x00840000;
+}
+pub(crate) type Sec2Falcon = Falcon<Sec2>;
+
+/// Contains the base parameters common to all Falcon instances.
+#[derive(Debug)]
+pub(crate) struct Falcon<I: FalconInstance> {
+    /// Chipset this falcon belongs to.
+    chipset: Chipset,
+    /// Whether this falcon is part of a dual falcon/riscv engine.
+    has_riscv: bool,
+    _instance: PhantomData<I>,
+}
+
+impl<I: FalconInstance> Falcon<I> {
+    pub(crate) fn new(
+        pdev: &pci::Device,
+        chipset: Chipset,
+        bar: &Devres<Bar0>,
+        need_riscv: bool,
+    ) -> Result<Self> {
+        let hwcfg1 = with_bar!(bar, |b| regs::FalconHwcfg1::read(b, I::BASE))?;
+        let rev = hwcfg1.core_rev()?;
+        let subver = hwcfg1.core_rev_subversion();
+        let sec_model = hwcfg1.security_model()?;
+
+        if need_riscv {
+            let hwcfg2 = with_bar!(bar, |b| regs::FalconHwcfg2::read(b, I::BASE))?;
+            if !hwcfg2.riscv() {
+                dev_err!(
+                    pdev.as_ref(),
+                    "riscv support requested on falcon that does not support it\n"
+                );
+                return Err(EINVAL);
+            }
+        }
+
+        dev_info!(
+            pdev.as_ref(),
+            "new falcon: {:?} {:?} {:?}",
+            rev,
+            subver,
+            sec_model
+        );
+
+        Ok(Self {
+            chipset,
+            has_riscv: need_riscv,
+            _instance: PhantomData,
+        })
+    }
+
+    fn select_falcon_core(&self, bar: &Devres<Bar0>, timer: &Timer) -> Result<()> {
+        if self.has_riscv {
+            let bcr_ctrl = with_bar!(bar, |b| regs::RiscvBcrCtrl::read(b, I::BASE))?;
+            if bcr_ctrl.core_select() != RiscvCoreSelect::Falcon {
+                with_bar!(bar, |b| regs::RiscvBcrCtrl::default()
+                    .set_core_select(RiscvCoreSelect::Falcon)
+                    .write(b, I::BASE))?;
+
+                timer.wait_on(bar, Duration::from_millis(10), || {
+                    bar.try_access_with(|b| regs::RiscvBcrCtrl::read(b, I::BASE))
+                        .and_then(|v| if v.valid() { Some(()) } else { None })
+                })?;
+            }
+        }
+
+        Ok(())
+    }
+
+    fn reset_wait_mem_scrubbing(&self, bar: &Devres<Bar0>, timer: &Timer) -> Result<()> {
+        /* TODO: is this needed? */
+        with_bar!(bar, |b| regs::FalconMailbox0::alter(b, I::BASE, |v| v))?;
+
+        timer.wait_on(bar, Duration::from_millis(20), || {
+            bar.try_access_with(|b| regs::FalconHwcfg2::read(b, I::BASE))
+                .and_then(|r| if r.mem_scrubbing() { Some(()) } else { None })
+        })
+    }
+
+    fn reset_prep(&self, bar: &Devres<Bar0>, timer: &Timer) -> Result<()> {
+        let _ = with_bar!(bar, |b| regs::FalconHwcfg2::read(b, I::BASE))?;
+
+        // Expected to timeout apparently?
+        // TODO: check why with OpenRM.
+        let _ = timer.wait_on(bar, Duration::from_micros(150), || {
+            bar.try_access_with(|b| regs::FalconHwcfg2::read(b, I::BASE))
+                .and_then(|r| if r.unk_31() { Some(()) } else { None })
+        });
+
+        Ok(())
+    }
+
+    fn reset_eng(&self, bar: &Devres<Bar0>, timer: &Timer) -> Result<()> {
+        self.reset_prep(bar, timer)?;
+
+        with_bar!(bar, |b| regs::RiscvUnk3c0::alter(b, I::BASE, |v| v
+            .set_unk0(true)))?;
+
+        let _: Result<()> = timer.wait_on(bar, Duration::from_micros(10), || None);
+
+        with_bar!(bar, |b| regs::RiscvUnk3c0::alter(b, I::BASE, |v| v
+            .set_unk0(false)))?;
+
+        self.reset_wait_mem_scrubbing(bar, timer)?;
+
+        Ok(())
+    }
+
+    fn disable(&self, bar: &Devres<Bar0>, timer: &Timer) -> Result<()> {
+        self.select_falcon_core(bar, timer)?;
+
+        with_bar!(bar, |b| {
+            regs::FalconUnk0048::alter(b, I::BASE, |r| r.set_val0(0));
+
+            regs::FalconIrqmclr::default()
+                .set_val(u32::MAX)
+                .write(b, I::BASE)
+        })?;
+
+        self.reset_eng(bar, timer)
+    }
+
+    fn enable(&self, bar: &Devres<Bar0>, timer: &Timer) -> Result<()> {
+        self.reset_eng(bar, timer)?;
+        self.select_falcon_core(bar, timer)?;
+        self.reset_wait_mem_scrubbing(bar, timer)?;
+
+        with_bar!(bar, |b| {
+            // We write Boot0 into FalconRm, for some reason...
+            regs::FalconRm::default()
+                .set_val(regs::Boot0::read(b).into())
+                .write(b, I::BASE)
+        })
+    }
+
+    pub(crate) fn reset(&self, bar: &Devres<Bar0>, timer: &Timer) -> Result<()> {
+        self.disable(bar, timer)?;
+        self.enable(bar, timer)
+    }
+
+    fn dma_init(
+        &self,
+        bar: &Devres<Bar0>,
+        dma_handle: bindings::dma_addr_t,
+        mem: FalconMem,
+        xfer_len: u32,
+        sec: bool,
+    ) -> Result<regs::FalconDmaTrfCmd> {
+        with_bar!(bar, |b| {
+            regs::FalconDmaTrfBase::default()
+                .set_base((dma_handle >> 8) as u32)
+                .write(b, I::BASE);
+            regs::FalconDmaTrfBase1::default()
+                .set_base((dma_handle >> 40) as u16)
+                .write(b, I::BASE)
+        })?;
+
+        Ok(regs::FalconDmaTrfCmd::default()
+            .set_size((xfer_len.ilog2() - 2) as u8)
+            .set_imem(mem == FalconMem::Imem)
+            .set_sec(if sec { 1 } else { 0 }))
+    }
+
+    fn dma_xfer(
+        &self,
+        bar: &Devres<Bar0>,
+        mem_base: u32,
+        dma_base: u32,
+        cmd: regs::FalconDmaTrfCmd,
+    ) -> Result<()> {
+        with_bar!(bar, |b| {
+            regs::FalconDmaTrfMOffs::default()
+                .set_offs(mem_base)
+                .write(b, I::BASE);
+            regs::FalconDmaTrfBOffs::default()
+                .set_offs(dma_base)
+                .write(b, I::BASE);
+
+            cmd.write(b, I::BASE)
+        })
+    }
+
+    fn dma_done(&self, bar: &Devres<Bar0>, timer: &Timer) -> Result<()> {
+        timer.wait_on(bar, Duration::from_millis(2000), || {
+            bar.try_access_with(|b| regs::FalconDmaTrfCmd::read(b, I::BASE))
+                .and_then(|v| if v.idle() { Some(()) } else { None })
+        })
+    }
+
+    fn dma_wr(
+        &self,
+        bar: &Devres<Bar0>,
+        timer: &Timer,
+        dma_handle: bindings::dma_addr_t,
+        dma_base: u32,
+        mem: FalconMem,
+        mem_base: u32,
+        len: u32,
+        sec: bool,
+    ) -> Result<()> {
+        const DMA_LEN: u32 = 256;
+
+        let (dma_start, dma_addr) = match mem {
+            FalconMem::Imem => (0, dma_handle),
+            FalconMem::Dmem => (dma_base, dma_handle + dma_base as bindings::dma_addr_t),
+        };
+
+        pr_info!(
+            "dma write {:?}: dma_handle {:x} dma_start {:x} dma_addr {:x} len {:x}\n",
+            mem,
+            dma_handle,
+            dma_start,
+            dma_addr,
+            len
+        );
+
+        let cmd = self.dma_init(bar, dma_addr, mem, DMA_LEN, sec)?;
+
+        let mut dst = mem_base;
+        let mut src = dma_base;
+        let mut remain = len;
+
+        while remain >= DMA_LEN {
+            self.dma_xfer(bar, dst, src - dma_start, cmd)?;
+            self.dma_done(bar, timer)?;
+
+            src += DMA_LEN;
+            dst += DMA_LEN;
+            remain -= DMA_LEN;
+        }
+
+        pr_info!("dma write remain: {} bytes\n", remain);
+
+        Ok(())
+    }
+
+    pub(crate) fn dma_load(
+        &self,
+        bar: &Devres<Bar0>,
+        timer: &Timer,
+        dma_handle: bindings::dma_addr_t,
+        imem_params: (u32, u32, u32),
+        dmem_params: (u32, u32, u32),
+    ) -> Result<()> {
+        pr_info!("dma_load: {:?} {:?}\n", imem_params, dmem_params);
+
+        with_bar!(bar, |b| {
+            regs::FalconUnk624::alter(b, I::BASE, |v| v.set_unk7(true));
+            regs::FalconDmaCtl::default().write(b, I::BASE);
+            regs::FalconUnk600::alter(b, I::BASE, |v| v.set_unk16(false).set_unk2((1 << 2) | 1));
+        })?;
+
+        self.dma_wr(
+            bar,
+            timer,
+            dma_handle,
+            imem_params.0,
+            FalconMem::Imem,
+            imem_params.1,
+            imem_params.2,
+            true,
+        )?;
+        self.dma_wr(
+            bar,
+            timer,
+            dma_handle,
+            dmem_params.0,
+            FalconMem::Dmem,
+            dmem_params.1,
+            dmem_params.2,
+            true,
+        )?;
+
+        Ok(())
+    }
+
+    pub(crate) fn boot(
+        &self,
+        bar: &Devres<Bar0>,
+        timer: &Timer,
+        v3_desc: &FalconUCodeDescV3,
+        mbox0: Option<u32>,
+        mbox1: Option<u32>,
+    ) -> Result<(u32, u32)> {
+        pr_info!("boot 0\n");
+
+        // Program BROM registers for PKC signature validation.
+        if self.chipset >= Chipset::GA102 {
+            let pkc_data_offset = v3_desc.pkc_data_offset;
+            let engine_id_mask = v3_desc.engine_id_mask;
+            let ucode_id = v3_desc.ucode_id;
+
+            pr_info!(
+                "dmem_sign: {:#x}, engine_id: {:#x}, ucode_id: {:#x}",
+                pkc_data_offset,
+                engine_id_mask,
+                ucode_id
+            );
+
+            with_bar!(bar, |b| {
+                regs::FalconBromParaaddr0::default()
+                    .set_addr(pkc_data_offset)
+                    .write(b, I::BASE);
+                regs::FalconBromEngidmask::default()
+                    .set_mask(engine_id_mask as u32)
+                    .write(b, I::BASE);
+                regs::FalconBromCurrUcodeId::default()
+                    .set_ucode_id(ucode_id as u32)
+                    .write(b, I::BASE);
+                regs::FalconModSel::default()
+                    .set_algo(FalconModSelAlgo::Rsa3k)
+                    .write(b, I::BASE);
+            })?;
+        }
+
+        pr_info!("boot 1\n");
+
+        with_bar!(bar, |b| {
+            if let Some(mbox0) = mbox0 {
+                regs::FalconMailbox0::default()
+                    .set_mailbox0(mbox0)
+                    .write(b, I::BASE);
+            }
+
+            if let Some(mbox1) = mbox1 {
+                regs::FalconMailbox1::default()
+                    .set_mailbox1(mbox1)
+                    .write(b, I::BASE);
+            }
+
+            // Set `BootVec` to start of non-secure code.
+            // TODO: use boot vector variable - apparently this is 0 on v3 hdr?
+            regs::FalconBootVec::default()
+                .set_boot_vec(0)
+                .write(b, I::BASE);
+
+            regs::FalconCpuCtl::default()
+                .set_start_cpu(true)
+                .write(b, I::BASE);
+        })?;
+
+        pr_info!("booted!\n");
+        timer.wait_on(bar, Duration::from_secs(2), || {
+            bar.try_access()
+                .map(|b| regs::FalconCpuCtl::read(&*b, I::BASE))
+                .and_then(|v| if v.halted() { Some(()) } else { None })
+        })?;
+
+        let (mbox0, mbox1) = with_bar!(bar, |b| {
+            let mbox0 = regs::FalconMailbox0::read(b, I::BASE).mailbox0();
+            let mbox1 = regs::FalconMailbox1::read(b, I::BASE).mailbox1();
+
+            (mbox0, mbox1)
+        })?;
+
+        pr_info!("successfully returned {} {}\n", mbox0, mbox1);
+
+        Ok((mbox0, mbox1))
+    }
+}
+
+#[repr(C)]
+#[derive(Debug)]
+struct FalconAppifHdrV1 {
+    ver: u8,
+    hdr: u8,
+    len: u8,
+    cnt: u8,
+}
+
+#[repr(C)]
+#[derive(Debug)]
+struct FalconAppifV1 {
+    id: u32,
+    dmem_base: u32,
+}
+
+const NVFW_FALCON_APPIF_ID_DMEMMAPPER: u32 = 0x4;
+
+#[repr(C)]
+#[derive(Debug)]
+struct FalconAppifDmemmapperV3 {
+    signature: u32,
+    version: u16,
+    size: u16,
+    cmd_in_buffer_offset: u32,
+    cmd_in_buffer_size: u32,
+    cmd_out_buffer_offset: u32,
+    cmd_out_buffer_size: u32,
+    nvf_img_data_buffer_offset: u32,
+    nvf_img_data_buffer_size: u32,
+    printf_buffer_hdr: u32,
+    ucode_build_time_stamp: u32,
+    ucode_signature: u32,
+    init_cmd: u32,
+    ucode_feature: u32,
+    ucode_cmd_mask0: u32,
+    ucode_cmd_mask1: u32,
+    multi_tgt_tbl: u32,
+}
+
+pub(crate) const NVFW_FALCON_APPIF_DMEMMAPPER_CMD_FRTS: u32 = 0x15;
+
+#[derive(Debug)]
+#[repr(C)]
+struct ReadVbios {
+    ver: u32,
+    hdr: u32,
+    addr: u64,
+    size: u32,
+    flags: u32,
+}
+
+#[derive(Debug)]
+#[repr(C)]
+struct FrtsRegion {
+    ver: u32,
+    hdr: u32,
+    addr: u32,
+    size: u32,
+    ftype: u32,
+}
+
+const NVFW_FRTS_CMD_REGION_TYPE_FB: u32 = 2;
+
+#[derive(Debug)]
+#[repr(C)]
+struct FrtsCmd {
+    read_vbios: ReadVbios,
+    frts_region: FrtsRegion,
+}
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index f010d3152530b1cec032ca620e59de51a2fc1a13..ec745dd8175bd3164ed1b865293a526b09c59ab3 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -5,6 +5,7 @@
 };
 
 use crate::driver::Bar0;
+use crate::falcon::{GspFalcon, Sec2Falcon};
 use crate::regs;
 use crate::timer::Timer;
 use crate::util;
@@ -198,6 +199,18 @@ pub(crate) fn new(pdev: &pci::Device, bar: Devres<Bar0>) -> Result<impl PinInit<
         );
 
         let timer = Timer::new();
+        let _gsp_falcon = GspFalcon::new(
+            pdev,
+            spec.chipset,
+            &bar,
+            if spec.chipset > Chipset::GA100 {
+                true
+            } else {
+                false
+            },
+        )?;
+
+        let _sec2_falcon = Sec2Falcon::new(pdev, spec.chipset, &bar, false)?;
 
         Ok(pin_init!(Self {
             spec,
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index f54dcfc66490cb6b10090ef944ac14feca9f6972..35c030485532633a5dd59a8a4a1f6d385cb46c98 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -15,6 +15,7 @@ macro_rules! with_bar {
 }
 
 mod driver;
+mod falcon;
 mod firmware;
 mod gpu;
 mod regs;
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 0d06e09b1ba62d55688c633500f37d3fe1aeb30e..2952fa7f84c274f122bc12e5506b0b2ac0fbb82d 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -2,8 +2,11 @@
 
 use core::ops::Deref;
 use kernel::io::Io;
-use kernel::register;
+use kernel::{register, register_rel};
 
+use crate::falcon::{
+    FalconCoreRev, FalconCoreRevSubversion, FalconModSelAlgo, FalconSecurityModel, RiscvCoreSelect,
+};
 use crate::gpu::Chipset;
 
 register!(Boot0@0x00000000, "Basic revision information about the GPU";
@@ -22,3 +25,186 @@
     31:0    hi => as u32, "high 32 bits of the timer"
 );
 
+/* PFALCON */
+
+register_rel!(FalconIrqsclr@0x00000004;
+    4:4     halt => as_bit bool;
+    6:6     swgen0 => as_bit bool;
+);
+
+register_rel!(FalconIrqstat@0x00000008;
+    4:4     halt => as_bit bool;
+    6:6     swgen0 => as_bit bool;
+);
+
+register_rel!(FalconIrqmclr@0x00000014;
+    31:0    val => as u32
+);
+
+register_rel!(FalconIrqmask@0x00000018;
+    31:0    val => as u32
+);
+
+register_rel!(FalconRm@0x00000084;
+    31:0    val => as u32
+);
+
+register_rel!(FalconIrqdest@0x0000001c;
+    31:0    val => as u32
+);
+
+register_rel!(FalconMailbox0@0x00000040;
+    31:0    mailbox0 => as u32
+);
+register_rel!(FalconMailbox1@0x00000044;
+    31:0    mailbox1 => as u32
+);
+
+register_rel!(FalconUnk0048@0x00000048;
+    1:0     val0 => as u32
+);
+
+register_rel!(FalconHwcfg2@0x000000f4;
+    10:10   riscv => as_bit bool;
+    12:12   mem_scrubbing => as_bit bool;
+    31:31   unk_31 => as_bit bool;
+);
+
+register_rel!(FalconCpuCtl@0x00000100;
+    1:1     start_cpu => as_bit bool;
+    4:4     halted => as_bit bool;
+    6:6     alias_en => as_bit bool;
+);
+register_rel!(FalconBootVec@0x00000104;
+    31:0    boot_vec => as u32
+);
+
+register_rel!(FalconHwCfg@0x00000108;
+    8:0     imem_size => as u32;
+    17:9    dmem_size => as u32;
+);
+
+register_rel!(FalconDmaCtl@0x0000010c;
+    0:0     require_ctx => as_bit bool;
+    1:1     dmem_scrubbing  => as_bit bool;
+    2:2     imem_scrubbing => as_bit bool;
+    6:3     dmaq_num => as_bit u8;
+    7:7     secure_stat => as_bit bool;
+);
+
+register_rel!(FalconDmaTrfBase@0x00000110;
+    31:0    base => as u32;
+);
+
+register_rel!(FalconDmaTrfMOffs@0x00000114;
+    23:0    offs => as u32;
+);
+
+register_rel!(FalconDmaTrfCmd@0x00000118;
+    0:0     full => as_bit bool;
+    1:1     idle => as_bit bool;
+    3:2     sec => as_bit u8;
+    4:4     imem => as_bit bool;
+    5:5     is_write => as_bit bool;
+    10:8    size => as u8;
+    14:12   ctxdma => as u8;
+    16:16   set_dmtag => as u8;
+);
+
+register_rel!(FalconDmaTrfBOffs@0x0000011c;
+    31:0    offs => as u32;
+);
+
+register_rel!(FalconDmaTrfBase1@0x00000128;
+    8:0     base => as u16;
+);
+
+register_rel!(FalconHwcfg1@0x0000012c;
+    3:0     core_rev => try_into FalconCoreRev, "core revision of the falcon";
+    5:4     security_model => try_into FalconSecurityModel, "security model of the falcon";
+    7:6     core_rev_subversion => into FalconCoreRevSubversion;
+    11:8    imem_ports => as u8;
+    15:12   dmem_ports => as u8;
+);
+
+// TODO: This should be able to take an index, like +0x180[16; 8]? Then the constructor or read
+// method take the port we want to address as argument.
+register_rel!(FalconImemC@0x00000180;
+    7:2     offs => as u8;
+    23:8    blk => as u8;
+    24:24   aincw => as_bit bool;
+    25:25   aincr => as_bit bool;
+    28:28   secure => as_bit bool;
+    29:29   sec_atomic => as_bit bool;
+);
+
+register_rel!(FalconImemD@0x00000184;
+    31:0    data => as u32;
+);
+
+register_rel!(FalconImemT@0x00000188;
+    15:0    data => as u16;
+);
+
+register_rel!(FalconDmemC@0x000001c0;
+    23:0    addr => as u32;
+    7:2     offs => as u8;
+    23:8    blk => as u8;
+    24:24   aincw => as_bit bool;
+    25:25   aincr => as_bit bool;
+    26:26   settag => as_bit bool;
+    27:27   setlvl => as_bit bool;
+    28:28   va => as_bit bool;
+    29:29   miss => as_bit bool;
+);
+
+register_rel!(FalconDmemD@0x000001c4;
+    31:0    data => as u32;
+);
+
+register_rel!(FalconModSel@0x00001180;
+    7:0     algo => try_into FalconModSelAlgo;
+);
+register_rel!(FalconBromCurrUcodeId@0x00001198;
+    31:0    ucode_id => as u32;
+);
+register_rel!(FalconBromEngidmask@0x0000119c;
+    31:0    mask => as u32;
+);
+register_rel!(FalconBromParaaddr0@0x00001210;
+    31:0    addr => as u32;
+);
+
+register_rel!(RiscvCpuCtl@0x00000388;
+    0:0     startcpu => as_bit bool;
+    4:4     halted => as_bit bool;
+    5:5     stopped => as_bit bool;
+    7:7     active_stat => as_bit bool;
+);
+
+register_rel!(RiscvUnk3c0@0x000003c0;
+    0:0     unk0 => as_bit bool;
+);
+
+register_rel!(RiscvIrqmask@0x00000528;
+    31:0    mask => as u32;
+);
+
+register_rel!(RiscvIrqdest@0x0000052c;
+    31:0    dest => as u32;
+);
+
+register_rel!(FalconUnk600@0x00000600;
+    16:16   unk16 => as_bit bool;
+    2:0     unk2 => as u8;
+);
+
+register_rel!(FalconUnk624@0x00000624;
+    7:7     unk7 => as_bit bool;
+);
+
+register_rel!(RiscvBcrCtrl@0x00001668;
+    0:0     valid => as_bit bool;
+    4:4     core_select => as_bit RiscvCoreSelect;
+    8:8     br_fetch => as_bit bool;
+);

-- 
2.48.1


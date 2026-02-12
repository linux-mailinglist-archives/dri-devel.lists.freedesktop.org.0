Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGkINsWOjWl54QAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 09:26:45 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDFC12B46D
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 09:26:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E20D710E6FA;
	Thu, 12 Feb 2026 08:26:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="KFxyVr/2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013069.outbound.protection.outlook.com
 [40.107.201.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25E5A10E6F9;
 Thu, 12 Feb 2026 08:26:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jLJ3mgq5OWeep6ktSOTqy7Ua2nxcGPWGn0AMXCS9SoAW6YrUlB3bDSU3DFQOzaPCyDVnICcINWOR1QpQRzOp3dZYSTbvLNpamXktVrApxPZ8MfhB1sqWHM4mFZkguloQx39oCuJu6X34mRJkCI66bCb0memmxvzXm8OscYYBKx+4NmIiqaUcCRFdSOgvpwYYfVhDnimePa85nviI3cy2cpdjQR+3G7VBIr3jLepCbygW9PP1U/PMi6dBBvf90WRfOCy1Qd9+OwfTkPJy9hUxeLC/EUYDpgpHiIOzl0SU2uTDSoJhYMmO6cO7X3FocmyMZEJu83CB5iuxHEHiZYF+cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eBxcNsruIYwqYFBQ0XFE802dLmO/54L7/L6tD547uug=;
 b=ZMyZ7Uk5BRiND2r+g2zJn51C7IC4+gDSzOuc99Z8+DIsjIx0aOPnM1zh/k1MVqfB6CUbT6cUl8areGb9/2lOBlsHq1u+npQUpKqcP68DiTGTYCOVa0XGcauA2tLdXUBauKj/IaCgHzEdUxIz1Lrf6KhvsrcA3inp0cfq9GTyAqyvkjXtgB3xJAd9ez9zcideJteLp1A7oVTw6BBfgp9LQFpE84jJ6nbfawaoYWdpbJimKIurzXGcxYhtHAyR+qvDSAldZd1HeJQWQ6nMsURSrkxKEyo6Iqw90qv0kKAStgD2R7rDHpX12/fPFqZdq8+cWcquVSz+40lJcK62Olv6Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eBxcNsruIYwqYFBQ0XFE802dLmO/54L7/L6tD547uug=;
 b=KFxyVr/2pOmSNEK+bz0oYyf7W3+/tspreEkwirZAUWXnjq1vGJlTvIIsJOaZiYRus6pEE4348L3MWgp9ylNPH11p0Ah55Y2cRgjHsX0kATf8igQ+pltGtp6UEtyCiZo7q7HEdPbOAzTLmFDY4F0VgxYVYzsDVZKP9aXI/t64Koer+PYb53rgfC4+84Xx5VJdJecJvXvvMw9m9WpDHflRNQ2bumV49f9+Ld/gmpA7Zd/NLS1NJY/lBT/ZwNPVsMyehc5SRSMIcnq5x6APKzNt6ajOgBmLRkZ8x+HacrTKJxqaMWZa8wubYxvFB6dhJOSAplmMcsUxb65YixwVNWBLVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH0PR12MB8800.namprd12.prod.outlook.com (2603:10b6:510:26f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.20; Thu, 12 Feb
 2026 08:26:39 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%3]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 08:26:39 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 12 Feb 2026 17:26:21 +0900
Subject: [PATCH v9 4/9] gpu: nova-core: falcon: remove FalconFirmware's
 dependency on FalconDmaLoadable
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260212-turing_prep-v9-4-238520ad8799@nvidia.com>
References: <20260212-turing_prep-v9-0-238520ad8799@nvidia.com>
In-Reply-To: <20260212-turing_prep-v9-0-238520ad8799@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP301CA0063.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH0PR12MB8800:EE_
X-MS-Office365-Filtering-Correlation-Id: e09bcb98-1394-4f1a-0f04-08de6a1071f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|10070799003|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OG11bDhCUXAzS3UzMmhTYUp4Y2FQT2tRckllK3liVWFEdFhVREEyTGhZM0Z2?=
 =?utf-8?B?QllLcDBsOHpBSjFDUW15enY1N3ZsZzBCcUcvU1VDZGtUMDBCMlhEMzU4OElJ?=
 =?utf-8?B?eThGbGFFTlloblYxSHhxZFFpRVZYRXpyWGlzV05kSGFLWHJoYjNHcHgyV1R2?=
 =?utf-8?B?c00xODZiVVQ1YmdVQVhSaEl5cHI4alNCTmdWenV5WmdmUm9DUUpOOFhQa3gx?=
 =?utf-8?B?dnBvcjkvV05SUjU0RFZVWHdtaHdkbzJldkFkZHhrYjJYQVhFZEo5dUVBd25m?=
 =?utf-8?B?ZkYxUGU5QnVKYndzWWhZL2REeVpWaGx1NHBBZzVYR1dpWjMxMWQyRklzWUEz?=
 =?utf-8?B?YVhzZzhBVDZmLzZkYTVER05KYlFmeCtoYjVPdWUzdGN5TGNWeW9wSVNpZkt0?=
 =?utf-8?B?VXFDSjM2bDJ4R0phcDNEZ2d0d2g5a1RpVTNhcWhsb3RVVEI3TlpSeXhmWFVJ?=
 =?utf-8?B?TUxwTXRWZDhTeTg3eXFJL2ZqUU4yZG5nRzlQaG5Ra0R3V3R1ZFN2MWxVWEdw?=
 =?utf-8?B?V1pjVVppRjRranN3ODZvL01oWENqOXdFQXY2cWdZc2pKYmRxT1lqVTRXeGFi?=
 =?utf-8?B?SDlhUUs4elNMM3FuWEV5UzZBdTF6V3lmMlFxei9obTNyaVRlU2VRZGZOUHlB?=
 =?utf-8?B?Mk1la0l1eVgzRi9KZTZaV1ZGYzhON0dIa0hmam9GSnBCK1VoMXR1YXFWRTVU?=
 =?utf-8?B?dDlyd0xPQ0RYR0hSaEF0UkFuZ1BXL1VhSzZwZ0hKN0pDOWd4UkxqY0Z2bXps?=
 =?utf-8?B?MndVNllCMDZ3WU5HUlJZQmJYTnZ2QUpaTC9KTFNteHM2cVJJZ3p1YTBPRnpX?=
 =?utf-8?B?cVpzcG8yNU53Z3NGTHhnMkRoZTlGNHFyaUNmZ3BhaUhTMTNOeXN2L2hRT3dn?=
 =?utf-8?B?Q1BmL1h6ZGsxTmliLzg0WThacTM2WWxRNTU4RUdPajUxaFYweE5aU1FGRFVi?=
 =?utf-8?B?elBiejA1NjR4TDdMUmVOczg3U1BzYlVGV1RaZUJocnB2Z0ZEWVJESmUwWlY0?=
 =?utf-8?B?UnJTRWRoRFJ4Ynh3cjZwbDFxNUpmT3FjQUM2Tnd6bE5YbGU3NFoxNTdHcnZV?=
 =?utf-8?B?cmxEdytTTEh5N2F5QWVSL216dngrQVFBdWp3VXpEVGdJUXBDaGE2RjVqc3hU?=
 =?utf-8?B?eWhvYlE4YTg2UUpwbU5vOS9nVEZvM0l5OVd4TmZmU2F0blU0VGtvODdPd3lX?=
 =?utf-8?B?NU1GWnJPNE96dUp6MzhhNGdUbys1bnoyeEY2SHpLNE1ST0hkN2VhVnRiTlVv?=
 =?utf-8?B?L2xyZVZBOXlUK0d0MCtVQ1QrbE8vb1BGWXZEOUlIWDFhcFo2UTRkQUJyUGFt?=
 =?utf-8?B?SUc1elFqUUdGUjV1UkRlc2FiT2dPTnB5MmFRMmRnMHQzY0dBWjZUNWlSRlkx?=
 =?utf-8?B?WUJVNmN3alpuTFFvSXFBR3I2Ukpsak9OWlVORGRmVkZVMHZmeFJyU1R0VElH?=
 =?utf-8?B?bGxOYzVjMUViRDN4MFNmYllzZGUvbDlheG4zMVcrMm5JY1dEMksyb2VzSkNq?=
 =?utf-8?B?Sm5PeU4xOXVTNHF5Yk00NDdVUmVVbTJwQVFIc0Yrb2xRM2xOYldTWEhEbm9t?=
 =?utf-8?B?QThMazdEa05PR0hBZklqRVJITnIvMFFNalNENHpqRWg3Tm9BSXdUS04xZDBW?=
 =?utf-8?B?TnF3Y3poU2RhbWdFa09weWI0TE5WNlQvbWc1STJxTm5TWUpRZ3BEU2dXMEdz?=
 =?utf-8?B?NHdvd0luVEFWb2JCK2FjQ3hnUG96U3gwMXFnckIrQXh2YTgwNy9JM2grUDlu?=
 =?utf-8?B?dGpuNlJhRzZJNUNzZW1oTStDRmtYUkhqaDRSSWRYeXZPZjgwZnU0TzZLb0Vz?=
 =?utf-8?B?bEM5RkIzbjVyK2dhSHBWTkNUNTM4M2l2QkhWRWY1aEJjZFJERVorcDRVbjg2?=
 =?utf-8?B?SStJb3FHb29pSndNcWtDN1JzcXpmSy8rMVgwNlFBcU55V0F5aVo4WFYvMnZa?=
 =?utf-8?B?K0JBKzVaYnRLTVdRWkloMDF2eEt2OUZIYmswTDNDb01NMVRJenE5VU9yS0V4?=
 =?utf-8?B?VHRvR05BOW9XYnppWXhxK0grYzBvVDdmaXB5VG1uWE5qdHZYSUlTdEZTdjAr?=
 =?utf-8?B?KzN3Qkp5ZEpNV2REbHlWUzM2cWo2bmdMOFhMTUllWXNBcWN1ZWpuQVJjeHdD?=
 =?utf-8?Q?QjxY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T2xSVm13RVlsVW4vN2FSektKVTJaUXU4MnM2R1NqaG9RR2d1VnhPaGIwNG5a?=
 =?utf-8?B?RDlTNEVLNjQ4NHgwQXV0NVZVRlQ5dGpWZVl3RkdtbGk1ZEJFT0pxQ09BM2x3?=
 =?utf-8?B?S0VycHVWZTZKMGhkUEVzUjRzQUx0c1RUbHFyNExEak0vcE9nc0V2NFRhWXUr?=
 =?utf-8?B?eUNsK0R3NXhrNnF5V01Sd2V0RkUrODJZWFdHdzhvcEJUdjgzdlk2RTdDK1Zo?=
 =?utf-8?B?K3V5bjU4M202MkpxeUNRMjUvV0k1VklZeDdrT0Zwcjg5bmxrUjZ3QWZXMDRF?=
 =?utf-8?B?aTBaZVVvMjQxQU5XOTdXMHVXRkMxWHdTRzNhUDJ2TjV5bmo0ekdtMytkNStj?=
 =?utf-8?B?VWEwWVVBeXBTVldnT0s5djlWa3VPZHBYYmU5ZVRqdTZmdHU0ckYrYTNLbkk5?=
 =?utf-8?B?RmJNRm9LVU1uRTNxMjc4dVNqTkFCbENhTVVRQm9RdWxCUzZXdTdzZG1jZjl6?=
 =?utf-8?B?VWlsTFB6cVMraE1SSThjcUJ4L2IxamRUY1BkcW1hamRnWGQzVmMwVlVzQ1dt?=
 =?utf-8?B?Z0x6WUZxQmpFcDhPQlU4dEJvanhldlFZTVRVRUVSS2ZBMStZK2M3K0FRVHdG?=
 =?utf-8?B?UmUxbUdCMTJhZlJ0YmEvaVVNS1ZTUVVLM1R1NzdVekd2Q0hyMGZ3TmkxcG9z?=
 =?utf-8?B?ek1HNHN5Mm5KMEFzb0Zod00vZXhOY2pxckJyS2lkcUZWTXNyV0Vac1Z1OVhB?=
 =?utf-8?B?NFp3bExSdW9Oby84ZmJNSDBnRTdaWHFrY3BIMHZXYXFsNDhoKy9mTjBuRWR2?=
 =?utf-8?B?TXUyOXp6TU96QVZLcWNXSEFvbU5ZQU1aYm5FZmdmZHZsWEU2SWJLNm9DdnlO?=
 =?utf-8?B?cnM4enUvM09oTXVoTFQwVG94RWxiUVRSbUhTUlBWeStjMzZ1TVFSVXAxeUdN?=
 =?utf-8?B?M0d3N1JJcG9INE1sblg2U1hDRzhDWFlTM3pIeDhYaEdKTi9rRUViVFJmY28y?=
 =?utf-8?B?WXg5V01CcUNSRWc0enJaMHpZVWM2bGJCdVJSNlp1dVk3dGwwaU1aa2xUYXNO?=
 =?utf-8?B?R1U2cng2RzQwZC9NNTZIWG40YTAxWGhBZHZaQ3BuVURHK1FDeTFSVVMxU21B?=
 =?utf-8?B?bHlyalE2YWFPODY4emxmbjdsc1VETUo2b3owTWNiNDR6ZFp6cXVNZzhFQjhu?=
 =?utf-8?B?ZHN1RUtzWnIvOWdqZ0N0ckxHNFIxYkJGWWNsQXA5SjBiWGdqczFHN2lWRURy?=
 =?utf-8?B?RHlaeERYdEVQditzQWlwaGhxUnc0N1Q5ZjZWcVBSTEJWQnAyTzg5L0FEZ1Yz?=
 =?utf-8?B?OFE3d3lLaFJtMTZsU1pVcGRrU3Q0OTZ1d1hveUNaU0ZTSWkzY2dibVM2Z25q?=
 =?utf-8?B?Sk4rcUhJVEZCbnUvWXBmcU8yaldXREFqakxxWWlCNGZpUHRvZ3RsRXE5TmFP?=
 =?utf-8?B?b0xibFpaWVBRc0FrRWlsbFZGT0NTZ05pSmQzNkJUbFBwODNCbzdIRmNodGk3?=
 =?utf-8?B?MGZkZTJJMmswenYvbFIydzl3c2IyNllwTVpocmFaL1JaM1RHZ0ErQXk3ZHU5?=
 =?utf-8?B?clNzTEtMM2RnaDQ3TmVtdkxjaDhxeDEvcEF0ckF2RVBmcU5DUnZxRHRJbkdC?=
 =?utf-8?B?MG1TNVFaTkMrcG5EUGZ0WmtRV0grZlM1aktBUFFiaHZOUjZnM1VBeFJLblR4?=
 =?utf-8?B?dkdUdStCYStoeUR1c1owdlY2UFdOdWV5WkpJV1hVdDI5amV1VVR0OURkTGNH?=
 =?utf-8?B?U2VBcFFJRnd6b2YrdDN3OExHSXpiZHZZUktncThtOXdyY2VaaVNUeVBjMElp?=
 =?utf-8?B?REpPY1NsdW1ZZkpZN2lkK3JYODkzZmZ4VmdzTkV5TWFGWElyUU43S3Z3cEJ3?=
 =?utf-8?B?cDVzMDBxT3c4aWwxNTJJT3FTMHpkM1QyWGNnRVRLNUlNWFFYZU5sZTBOS3Ay?=
 =?utf-8?B?L2JaVHVGSDV5ZXRLanFTVW1oaXNUU1pNbWQ4cnNneTJ2bHVPSFlJZXJtUFBF?=
 =?utf-8?B?QkdTSmtKRE9FMzZkdjByYlM2bktGRXArS3ZwNnhxM0daMG1ielR4eW9xcVFV?=
 =?utf-8?B?eXhzL0tXYnZjNW8xNmVhZjhzVk5Xc1dGVnpYb2ViOElwSTFTRGt0WWVCNTFJ?=
 =?utf-8?B?SXBrZGdZR2Q2UkppbmY5RW42YWo3NFZwRTRNS09NZXdtL3JONHQ2Qkg2dGwx?=
 =?utf-8?B?UXBMaXFjODJyTzlZY2FYSURBV1VqeHdxNnNwa2FqMWgraDFhb3dpNHo0bjZH?=
 =?utf-8?B?MkdhSVNkb0E4c0pzUEpLZzF3TlgvWFVNdWhIVXAxa2lFdlBSYnllcDMvZ0N5?=
 =?utf-8?B?T3BKT3EyT3kzczhYOTdqSWZXZ3lucGJaemh5US9xQTl6WktQRGZmY3lZQkRK?=
 =?utf-8?B?c0RKczJDSXBHSGhYd3FBbTFxdUV1bFVUTGsrNjlHaDBSNFpJSUZDR2t5NDFY?=
 =?utf-8?Q?WlBJUygKmha1mBtY4FcXOKbY2UJVIETjnGce02A7qyk0F?=
X-MS-Exchange-AntiSpam-MessageData-1: foDlrgtc53C26A==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e09bcb98-1394-4f1a-0f04-08de6a1071f3
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 08:26:39.8315 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ywsSbXG0tEGsIRTQUcrPChxp9/FJhC8Yez9RqySdHxG7HRAmDO+ocL/zOGCv2QVfpPysAxZB8yungQFgJPDnaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8800
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,nvidia.com,google.com,gmail.com,ffwll.ch];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:mid,nvidia.com:email];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_TLS_LAST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[Nvidia.com:+]
X-Rspamd-Queue-Id: 8DDFC12B46D
X-Rspamd-Action: no action

Not all firmware is necessarily loaded by DMA. Remove the requirement
for `FalconFirmware` to implement `FalconDmaLoadable`, and adapt
`Falcon`'s methods constraints accordingly.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 35744f7c9cb2..5eed48226bd5 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -373,7 +373,7 @@ pub(crate) trait FalconDmaLoadable: Deref<Target = DmaObject> {
 ///
 /// A falcon firmware can be loaded on a given engine, and is presented in the form of a DMA
 /// object.
-pub(crate) trait FalconFirmware: FalconDmaLoadable {
+pub(crate) trait FalconFirmware {
     /// Engine on which this firmware is to be loaded.
     type Target: FalconEngine;
 }
@@ -516,7 +516,11 @@ fn dma_wr(
     }
 
     /// Perform a DMA load into `IMEM` and `DMEM` of `fw`, and prepare the falcon to run it.
-    fn dma_load<F: FalconFirmware<Target = E>>(&self, bar: &Bar0, fw: &F) -> Result {
+    fn dma_load<F: FalconFirmware<Target = E> + FalconDmaLoadable>(
+        &self,
+        bar: &Bar0,
+        fw: &F,
+    ) -> Result {
         // The Non-Secure section only exists on firmware used by Turing and GA100, and
         // those platforms do not use DMA.
         if fw.imem_ns_load_params().is_some() {
@@ -642,7 +646,11 @@ pub(crate) fn is_riscv_active(&self, bar: &Bar0) -> bool {
     }
 
     // Load a firmware image into Falcon memory
-    pub(crate) fn load<F: FalconFirmware<Target = E>>(&self, bar: &Bar0, fw: &F) -> Result {
+    pub(crate) fn load<F: FalconFirmware<Target = E> + FalconDmaLoadable>(
+        &self,
+        bar: &Bar0,
+        fw: &F,
+    ) -> Result {
         match self.hal.load_method() {
             LoadMethod::Dma => self.dma_load(bar, fw),
             LoadMethod::Pio => Err(ENOTSUPP),

-- 
2.53.0


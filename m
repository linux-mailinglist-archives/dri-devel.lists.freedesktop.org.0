Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 589B5C46EC1
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 14:34:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93B4710E3AB;
	Mon, 10 Nov 2025 13:34:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="hvYxC5aS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012003.outbound.protection.outlook.com [40.107.209.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2265E10E3A6;
 Mon, 10 Nov 2025 13:34:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cdZg7RQEwtzpcHh/WtgnDAEqm+g58gbxM+tTs9JA++xyRY92IAkRoO97H7ts0VNdH1bAyv8QNNLEshbg6YiTU26/pIQmzQ8OTqEAWaUE9ZT36dUKjPqPLC2BeVZH66qBCnVL28OSE9u/LjRW97icY6J+kaI0+7S19yv5+vPGeWCTN3nACuxhncOXXrCcnymOhOk5EiDyg5ebVz4vamZismU4uc6QDVF/TQykGsp+I3WPmOVBg7ZP46VPtGzTFz8EMra8tOwEVDkf56mmNUVlm+3qr9+2jHC50mPRkU2OBuhvMu/A+8o1PRncACpBza6broR4FKNckw4gboqwOt7x6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f8BB6ezZKHSTe6ULwJSFFyNmeqRIn+CATCI2DgUFCcE=;
 b=AJo37ySjwkEPict2AZgiFwtVobBu3q9Yw/YNWjkaT4dGb//d6vmd9L9c72nKKlYw315xwVxRMmhiy2Nk+mk3wjjDK9ZFw+JANt5xgbu9rUzBAeDGLdCYcDOQXvKZ/+ShDssTbbPWxoH9qBWMNVq0MVwcVklqbECr62Jv3Sy2P4BTDbdHv+fE/z32NzatGVAPJ+XVIA5rCSgjn1n3iLxt2eCB9aAkBjzdAqStZZbyqMjC4U46hHQypfHWrt0nxM5bvR4tzkWtPvtVz/nguMRQhnEuQcS+rFBoVsDnCWHBmtAmTtQqSr/1+Lx+8rdJyp5Ybncfd2HARRv+JHATL4J3Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f8BB6ezZKHSTe6ULwJSFFyNmeqRIn+CATCI2DgUFCcE=;
 b=hvYxC5aSXP0Ve7DsvkTxFoyY+w1K0dglB0nU94E8VM4+z4/RGEekij7EaEsBisT96TZYKz5nuwCB/wAnZSxJ1Zblgf276Fp0gV+1HAkFoAyaljobxRXGGCL40FJBHGAb0kb55AqrvaGJ/HuzTJBHfvl07rtZOwUugGtCIizaFJQf4lMnMon2ajkRN35ZWAM07ag2ZS4fao2ip3NlPDaAb+zzE/D2VJFDpzYL8joaS2bWfZX8S8AafSlhRRNTQTZq9p9btpF6y7mIfqQqJYerKQbCEZq6EQ1Afc1K5rjN79shARFH34O2trTwNl08yMLHuoXSId1q9ofxMKC/CuVwBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA3PR12MB7784.namprd12.prod.outlook.com (2603:10b6:806:317::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 13:34:46 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 13:34:46 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Mon, 10 Nov 2025 22:34:15 +0900
Subject: [PATCH v9 07/15] gpu: nova-core: Add zeroable trait to bindings
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-gsp_boot-v9-7-8ae4058e3c0e@nvidia.com>
References: <20251110-gsp_boot-v9-0-8ae4058e3c0e@nvidia.com>
In-Reply-To: <20251110-gsp_boot-v9-0-8ae4058e3c0e@nvidia.com>
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
X-ClientProxiedBy: TYWPR01CA0009.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA3PR12MB7784:EE_
X-MS-Office365-Filtering-Correlation-Id: ddf24578-9da9-4ac4-c87a-08de205dea14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|10070799003|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TkNzb0w5U3dXMnFhaXJkb1F6dmRnM21ySUlDaUtIb0E3QzluNngrekhIRVkz?=
 =?utf-8?B?bVZXZWdJY1JqY1hQd3NxelU5YTlBcktpYkZXMTdKOHZSbkQyMTNTallqdmNJ?=
 =?utf-8?B?UzVFanJ5VnJNQWlaUjhiSnpuM3NkYkNFcTVzQmI3NGMwS0w5THI2a3ZMVVhD?=
 =?utf-8?B?MXg2TGVGcys5S0pxT2crWkRxWUhydDZBbVlYWUF2L0NXOFFVTzNVbkJqdERr?=
 =?utf-8?B?YnYwbXdoSExMay96MmhXaDRPdXpuQTZOdGwxL2NKTGdkbStsQ2Y0cXlvZWt0?=
 =?utf-8?B?R2NqNUpoUzR3MFJpR3RRVldTT1ZsZEtWazNheVAyNEZKUWF6eDltMm83Z2Rt?=
 =?utf-8?B?eHlCcWRScnBaVDBjZ2VlWGhMdHBhR0I5eElzNXd6aU5ObDE4aVJhSXpGWm5w?=
 =?utf-8?B?M2xnWHBWZWFqM0pWYVY1Qk43ekcvTWNlZk5yZERhVWlodHQxNFd6MTg3R1FS?=
 =?utf-8?B?STMzTlpQVURianAxNUYwR3pwSmVWMkgyODJwNlNCcERiMzV3WCtQeDgzeWdO?=
 =?utf-8?B?d1BxYTI5TVM0K3o2N3h0Y3plMnhUOUozS3pjd3VtazA0UytZR2dyMS9TUWc2?=
 =?utf-8?B?R1FUczRqNnlIQmRvN1pvbUJLRndNd1A0QmNZa0xDR1FCVkIvc1ExbkxIUWsy?=
 =?utf-8?B?a0dSSjNhYjQxTndkL3c5emRSaVEzc3J0clE5bi9VcVJnOUpTZXlxN3Jmcm9T?=
 =?utf-8?B?R0FVZVIrSUpHVFp0cENqTFhZbFRMZEI3L2V1NkFZTHMwRFVUYjdJTml1SVRt?=
 =?utf-8?B?Q0dLazkwdVA3TXQvWDJOQ1lDSTRySmIycVo5N0xCeWpveEplS1Y1RmxDUFp3?=
 =?utf-8?B?SGJLU2RhbVA2VXB1MDFlTGNJVWE1WCtjYjkzUDRBVlBSUTBnc2Q1ZS94Kzcr?=
 =?utf-8?B?dUdCUHo3a08walZnRjdqNEpCWXNmM25HdHdqRHI4bVJtSjNJSXdOMVBCajlX?=
 =?utf-8?B?M3UwNXp4MzBJYmp2UHRRQU5ic1h1SWxaRUdoREpOVndOQ3kvSDkrUmtpcFRV?=
 =?utf-8?B?RTRYcDUzQjczZnZPK2M1SkphUytWUTVLK3FPck8wYSs0cTlUNjlxMWdZbXVq?=
 =?utf-8?B?R3Z2SHI3aUU2bURKaWtjMDRRTDc2U3N4em1SU28vMkJXcklSa0FHRHJGeFNV?=
 =?utf-8?B?VDYzVEsxcnF6R1JReXI0YmlRRk5mdnRPRHBUaW93MFVCZThPWkszTHZXTGtQ?=
 =?utf-8?B?cDlRQStqRlBGcTlLTjRBaGNJQm91a2pPaWJoeG03U0ZUazJPSndlQmhVUURi?=
 =?utf-8?B?czFmVHJnWVJWUmg5aVBRWmtOWENySlQxYmpZMXQzOFIzczZXTVk2NjJ1UURH?=
 =?utf-8?B?WjA1eFladVhRaHdIUXllaCtKUERjQWFPcG5NR1pvQkcxUmVvWTczU3lVZFJT?=
 =?utf-8?B?SUhiNk5FOStVYjFBNzJyWGMrQ1k0MVFHeFY0L1g3K3BBU3IyY3JTWGQ3aVpS?=
 =?utf-8?B?Mkh1VEJQdGQ2dXgzTlorMDlsbURFZk5vMVNJRHZTSGEyOVRuN3o4ZnExajd5?=
 =?utf-8?B?Ui94eThpbmZuWWNTc1pCcDRoT2w1YWNGNnRzQWVjMzZWYkhsTU9UemZYWGEv?=
 =?utf-8?B?em9zcjBlcDgrYUxWbWZ5WmJ2b2RQZjQ5VjJENG5VMHhqVFRURVlINUJDbHZt?=
 =?utf-8?B?aXl0NnFhanF0Tks5MG1mYmwwWXZXOGdRTVBTYzdldzdIbEJjZ0h4UDBNTHg3?=
 =?utf-8?B?QlYzaDl0U3hXNnBwcXVUN1BnTlN6TW5kVk96cmtEZVN4bm9OWnhybWhKTTBX?=
 =?utf-8?B?Tk9VTG44elJYd2FjMXgrNFF6d0hjS0VMempMOEh5dXdQRUJuVUg0YnZmNjBF?=
 =?utf-8?B?dEQ5QTB1eW13MXoxMmEya1BwT2U4bmxja25KVVdQSGtCVXA5bUdMV0IrN3ht?=
 =?utf-8?B?amJ6NlBTWDkzazVHQThVK3VuaHRKdTkyQlphL08zeTliOVA3SHN0azdTMEpD?=
 =?utf-8?B?SU1LanFlb3o3M0xOSndONzdlNWIwdDg5S0xHaTBOZ2o0eDRYZ3FLaVFDbUZE?=
 =?utf-8?Q?FBl1Q7z3PmPmqlqdp2rGHPM8/xQxhk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(10070799003)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dTNNbzRCUHRaUlZwSGRCN09IM2R0QjNncGRWWkNVUUlKNXp5cE81TURlcDhh?=
 =?utf-8?B?SkF0eERadmNweEdETFdEZGc1d01FaHV4VkxzblpuSmo4dGFpbExkeUlFeTIz?=
 =?utf-8?B?QjlrSTVReXlabEF1Z0wvMGxqN0lMRGNuVG5YaUZXK1lLOWhoU3I5L3dwSlVN?=
 =?utf-8?B?Tk1PRm93WFE1VWl4MGhweEd6N3lITzBVcE5KbWJnNkRJdjhTeFhZV3BCTWdP?=
 =?utf-8?B?ZUNTZzF0VWpDZzJQNUkxcDBXSlpVUmxFMkFRNGduM0ErNVBzODAxdmt1YU0r?=
 =?utf-8?B?UHhGMFp2VklIdU4xVStXNkF2bnJ1UzV4WTlNZWhBUGExUlhpVUMwcnJHZGZW?=
 =?utf-8?B?Tmh1UWkxRFlVbXZpVmZFNk5GaTNXcGMyYW9RSWtzMXVtVzRZb1pFYlk3RStJ?=
 =?utf-8?B?UUZYcVRPRUhXeHhvWWo1eVVodHpLVzJuODcyVVZXdjIrYUFVSTNuTVVZRS9z?=
 =?utf-8?B?eWRPc29sLy9Yb0JoT1h2Z21uSHNrcnpSZ1ZJaEQ3dVlrWlVBYnJYZEkyc0dq?=
 =?utf-8?B?V1AwNUJJNVIvZDJ2aDEzUkh2KzJ0YzB2akg2dVRlN2VJWkZ5MndIYzdYMC8x?=
 =?utf-8?B?RlVEbDB6a2pRU1VVTWQ5R3NvbmoxTGxvT0cxQnRTUGppaUxuT2c5QXhSSE5E?=
 =?utf-8?B?MSt6RXp4cHNjbjZWTFBiSTdwMVNEZ1NSU21MTDFPcG40cjA0REZCd0ZlMTdN?=
 =?utf-8?B?K0ZmSkF1eHhrQ2dUd2lCY3E0Ym0yamRMR2R2TVZLY3FUclpvTXh1bCtyc3JO?=
 =?utf-8?B?bDBZblBEVkpacUN3Ym4vVXRybkhDSnNFaGRBaFZqRTZKdTA5N0w3c0FJVGRU?=
 =?utf-8?B?TVc4b2FXYVRrU1dzLzUrblpuTmxqVzBucUZGOCs2L1lvWFNaSCs1T2dNWHFl?=
 =?utf-8?B?bkEzVU9YeXMybGlOeU9xMU5MdDRUcEk2bFFxTk41b0diUVJSV1VHcHkveUtn?=
 =?utf-8?B?WlZVd3FNem1HUGJTSTdBRzEzTnlnMkpBdWhEa0dBclVVT3ovQStRNHhMU2R5?=
 =?utf-8?B?ZWRWWTVqY1pZczAzVUlwdktWZnllT2kweFJ0TUFnMDI2QlcvOXFCeVdaUVo4?=
 =?utf-8?B?WG9KU3hua3YwL2NiUFFLbVczeW5LRlRrNlNsNGFzem41MVgrQ3JBbWFzSVpB?=
 =?utf-8?B?V2RrMmlLdzJ4U0pTNFJRcEVaWnN0V3lDRHNSUjV2TVZOajQ2QlUvd1JNN3c4?=
 =?utf-8?B?T25GYTdQVy8rM1RyVEQ0VFBJaVExb2hoTjlyYnZ1Mm4xS2pQQlFtRUp2Mklz?=
 =?utf-8?B?aWxYcG9id0x4MlZ4STBXN0FJYlpVc0ZzYVFZNWQwVWtueHN0SFhodjRCdm9L?=
 =?utf-8?B?QkxvemxPSnYrU1JvVDFMVUZrQkRoNk9XZ1JwY25JanNSRDdacmlySjRLekZk?=
 =?utf-8?B?OWUzYXF6UjhTOEIwSEdIazY0Q1lRNldwY2hJTDZ3OGI3dHhPQm53bHFTNFdl?=
 =?utf-8?B?WWRaejA1U0pWSzBSZ0hVWlo3b1JEMFpaSHRoSStSZ1BsZEZqaURXMWRzTEdm?=
 =?utf-8?B?WkxxK2VaLzJuVUlrcVljK1Iza2IrQXV5SEZ5OUtaSnNodVlNU25saVR2WGFI?=
 =?utf-8?B?YVdBT0RNUkY1eWQ2S0c5bkJQeTduQURiZW0rL2EveWduMzFoMXM3aVJuaFlH?=
 =?utf-8?B?a1N4R1lja2JCVDVKd3pXSlRJdEJ0ZEpEaEZGbnJPYjRaZC91U3JXclN5V0tr?=
 =?utf-8?B?WUg3YURPWE8zaUJENktDNnl0YVloSitWTStwRHErOFNyd09ZdnZQdGp4NG9E?=
 =?utf-8?B?NGtGWS9raVFmV3BNYlpSdndSZ0dxUEJOeVNkU2xwS0ZlWWZiM3gzS1JFMVMr?=
 =?utf-8?B?Uit1UHNIa3VtS2xJMWZkVE5GZ0FSUVpSb0x3cUhBSkZmb09mY2thTnNrOHht?=
 =?utf-8?B?eU9ZY0N4OVB2SzEyZis4b3U4N0Z1cDFVM0RIVjcxVTIybWllRUFBbVNHYnlu?=
 =?utf-8?B?QXgvb2MzbUZYUmZyaWhJOHd2VkYybkpaQkZqRTlSbzhIY0hscTdGRzdPL2Nh?=
 =?utf-8?B?RDVNREdpemdEdnc2Q3J3LzBwV05yMGNGRFpMNWJZamk4WitKVXRhUXRYbkgz?=
 =?utf-8?B?VXZKMVpTQ2dTMFZrV3ZsTm94QWozK2ptT09Qams5aWRwUVdJcjRnZzd1Z3ZL?=
 =?utf-8?B?VUJnaUtCMUh6R2x6MjgyN2ptaEZhVHpKTS9iZlZwcTRsS3dQWTF4eXNYWUNC?=
 =?utf-8?Q?xF/qItps7MIseWfOHyHDd3MgVcngGDUcGValIiC8Cnmc?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddf24578-9da9-4ac4-c87a-08de205dea14
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 13:34:46.6680 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HPax87nYsFhgp964Uu6oc02CeePL4vVU4u/nL4acIRwLYM5bv194jlDXXFC+SktWB8ZCnF3SptPwxqoR+6Dl3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7784
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

Derive the Zeroable trait for existing bindgen generated bindings. This
is safe because all bindgen generated types are simple integer types for
which any bit pattern, including all zeros, is valid.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gsp/fw/r570_144.rs          |  5 ++++-
 drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs | 16 ++++++++--------
 2 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144.rs b/drivers/gpu/nova-core/gsp/fw/r570_144.rs
index 82a973cd99c3..048234d1a9d1 100644
--- a/drivers/gpu/nova-core/gsp/fw/r570_144.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144.rs
@@ -24,5 +24,8 @@
     unreachable_pub,
     unsafe_op_in_unsafe_fn
 )]
-use kernel::ffi;
+use kernel::{
+    ffi,
+    prelude::Zeroable, //
+};
 include!("r570_144/bindings.rs");
diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
index 392b25dc6991..f7b38978c5f8 100644
--- a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
@@ -20,7 +20,7 @@
 pub type u32_ = __u32;
 pub type u64_ = __u64;
 #[repr(C)]
-#[derive(Copy, Clone)]
+#[derive(Copy, Clone, Zeroable)]
 pub struct GspFwWprMeta {
     pub magic: u64_,
     pub revision: u64_,
@@ -55,19 +55,19 @@ pub struct GspFwWprMeta {
     pub verified: u64_,
 }
 #[repr(C)]
-#[derive(Copy, Clone)]
+#[derive(Copy, Clone, Zeroable)]
 pub union GspFwWprMeta__bindgen_ty_1 {
     pub __bindgen_anon_1: GspFwWprMeta__bindgen_ty_1__bindgen_ty_1,
     pub __bindgen_anon_2: GspFwWprMeta__bindgen_ty_1__bindgen_ty_2,
 }
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone)]
+#[derive(Debug, Default, Copy, Clone, Zeroable)]
 pub struct GspFwWprMeta__bindgen_ty_1__bindgen_ty_1 {
     pub sysmemAddrOfSignature: u64_,
     pub sizeOfSignature: u64_,
 }
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone)]
+#[derive(Debug, Default, Copy, Clone, Zeroable)]
 pub struct GspFwWprMeta__bindgen_ty_1__bindgen_ty_2 {
     pub gspFwHeapFreeListWprOffset: u32_,
     pub unused0: u32_,
@@ -83,13 +83,13 @@ fn default() -> Self {
     }
 }
 #[repr(C)]
-#[derive(Copy, Clone)]
+#[derive(Copy, Clone, Zeroable)]
 pub union GspFwWprMeta__bindgen_ty_2 {
     pub __bindgen_anon_1: GspFwWprMeta__bindgen_ty_2__bindgen_ty_1,
     pub __bindgen_anon_2: GspFwWprMeta__bindgen_ty_2__bindgen_ty_2,
 }
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone)]
+#[derive(Debug, Default, Copy, Clone, Zeroable)]
 pub struct GspFwWprMeta__bindgen_ty_2__bindgen_ty_1 {
     pub partitionRpcAddr: u64_,
     pub partitionRpcRequestOffset: u16_,
@@ -101,7 +101,7 @@ pub struct GspFwWprMeta__bindgen_ty_2__bindgen_ty_1 {
     pub lsUcodeVersion: u32_,
 }
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone)]
+#[derive(Debug, Default, Copy, Clone, Zeroable)]
 pub struct GspFwWprMeta__bindgen_ty_2__bindgen_ty_2 {
     pub partitionRpcPadding: [u32_; 4usize],
     pub sysmemAddrOfCrashReportQueue: u64_,
@@ -136,7 +136,7 @@ fn default() -> Self {
 pub const LibosMemoryRegionLoc_LIBOS_MEMORY_REGION_LOC_FB: LibosMemoryRegionLoc = 2;
 pub type LibosMemoryRegionLoc = ffi::c_uint;
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone)]
+#[derive(Debug, Default, Copy, Clone, Zeroable)]
 pub struct LibosMemoryRegionInitArgument {
     pub id8: LibosAddress,
     pub pa: LibosAddress,

-- 
2.51.2


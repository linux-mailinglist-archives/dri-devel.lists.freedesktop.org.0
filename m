Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 553FFBE5F7B
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 02:39:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D3BA10EACD;
	Fri, 17 Oct 2025 00:39:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="qFtuNAAl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012043.outbound.protection.outlook.com [40.107.209.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E810610E0AE;
 Fri, 17 Oct 2025 00:39:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lCQRlXx04bBrORkfIHk9YLcVFc+SyrpOaBdEfedurnhBTDPOy8HTxCrVxGvscpBr0b0TMG9ogxVs88zX1ibwDpEpfYAyV/Ri3K16T+qrgG2ap1CAsOABjNVscugHrotnq0KPgKr7Jx2lZNKwb1+GNxNMgLhDqW7ChD3vp3auvQuwNZlPGhVzeERa/CxUpXQUwS4RXIxvarBobFY5RPAvv342WMrYtNkBgQyfjfajZBPbyR74Ztk+0tKIjcKMePPgttUEFROhbgaKCV4DbipAy9VOqD3CTy4211hYELwIA2Za6iQ9U6ROS0nGMkOwtoN+JYf5x5l5j1IH0LcC9mYSsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L2tVS2SQgXhY23BScixOjbnM1KfAtxlAr3t+BMLFDxM=;
 b=pbm5p58kTM1bpL/eYw5l8sSOfy84PNWDaR6Qdcy5x9s9k3OcCaL46PKcZIhDPGSmqiz/omwOjVGcgZ2oVbfi4qNM+jTTXXsjFAHB7Z9Kolrvqgudi4h81EFruA0bVscievDcZ7J9m+Wv+9SESSCPuPHQ7sIJk5OZrOAzvgvm74AEQz5THFkJLiOCsbvnv1G18N47iEMr1RdrCt0vzQkS5RLBMURtFbnjl0b4RpBalfEc/3eIEhdAqmgTZjA5B3DkHCbs2XoHY/9lAiz8kP9XHCA1+Il6LefalXZf9csd66xXqN/u9Cel54sOeQMLrsiEOqNAgZsPXkbDqmMZiXODQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L2tVS2SQgXhY23BScixOjbnM1KfAtxlAr3t+BMLFDxM=;
 b=qFtuNAAluf6VVly7jHsr64bDYBdF5OvrEcMsJEiafsRl2rfeM2JDQpe9QxcgezAI9K94D4V54JeRZEYnwe31ArIfCFNS3mPbPxW8xdeIuGM1yG3O6qOMfBf43Jp7h5HxtORbeytKlTnAj6vVRbNq/gWu2TzsUSSYDJcwpz3v2vKfw5PpWAVmEtWjxOpAoqvLNcn3nf2lBL1bAuke/ObtokGZDKSuGjW8ytd8QUZamMwCgng1kiMN2AGQz6KF/cBlJD/jyMOSoxwNBQKGOlUqy107piki+hxIZSEaWzBmNpMuzhqlWfPD5ciTh1O9yQ5ySPTRtpsU8h5qVc2Pd0KuWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 MN2PR12MB4341.namprd12.prod.outlook.com (2603:10b6:208:262::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Fri, 17 Oct
 2025 00:39:28 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9228.012; Fri, 17 Oct 2025
 00:39:28 +0000
Date: Fri, 17 Oct 2025 11:39:23 +1100
From: Alistair Popple <apopple@nvidia.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 dakr@kernel.org, acourbot@nvidia.com, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 John Hubbard <jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
 Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org
Subject: Re: [PATCH v5 07/14] gpu: nova-core: gsp: Add GSP command queue
 handling
Message-ID: <2uea6utj25fqhmjubke7g66sh2f7qchgnin6fgb23irfl4vxkd@zc4h3tcter3o>
References: <20251013062041.1639529-1-apopple@nvidia.com>
 <20251013062041.1639529-8-apopple@nvidia.com>
 <CANiq72kK4pG=O35NwxPNoTO17oRcg1yfGcvr3==Fi4edr+sfmw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72kK4pG=O35NwxPNoTO17oRcg1yfGcvr3==Fi4edr+sfmw@mail.gmail.com>
X-ClientProxiedBy: SY5P282CA0073.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:203::8) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|MN2PR12MB4341:EE_
X-MS-Office365-Filtering-Correlation-Id: 1718302f-0ba9-4693-368e-08de0d15a114
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|1800799024|366016|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bnI4dVFFRFNXRVpJbWs4bTYybGt0ODhFa1A5V2Q4U0tPRVdtaElJcWY1TDE1?=
 =?utf-8?B?T2drZzY2N0JKYm1vUWtaOVhHVndZanRHVlVuWldHbEpyMnNFd0dLM3BjV0Fq?=
 =?utf-8?B?N0RNcThoN0txa0ZzeURsbERKcmROVktZQmsvMGtXL09odDQyK2hJNHFXTkNL?=
 =?utf-8?B?a2JiV2hkaXZidWxXOHFDY29Hc0hsa0s0eCtycEpVSE1FN3o0U1RiYTYxa0dq?=
 =?utf-8?B?Y3Z2eG5Sd1M5QndNR1lNaXZseVNiWVVobktnMUdJOXNUKzRlVDlzMDRSVjBN?=
 =?utf-8?B?aGorUm01MjRqYnU1QnpsZHcrY0dBZ2lNTHMzbmJhMlU0MjZEbmh0SlRUU01M?=
 =?utf-8?B?MDNYUUJiYVRUUSt4QmJrTWFMcnpQSGUwUjNaUnNVN0VKUEtzZmV5WHplWG1p?=
 =?utf-8?B?STd5MGlWVWZyZERRT0YrT3V5OHk4YTNhYkExSXlIU2NkdElqRk4wSXNkVFRF?=
 =?utf-8?B?aG1ESDBVakVRSDVCSE1JOFJNSGhkeUFDc1dmckF0WGs5Q3BPaTU3V3RVL2ZG?=
 =?utf-8?B?Ym9LZmMyWVNIYjVid28rQ0RaZCtDVDZiTUV3SFd0TytaQVl0UWpEWTRrZ2lv?=
 =?utf-8?B?L1RhTjlkbXROaGUxRVhwZ0xrSW5veVNkMnZLRVR4M0NCaVRDZzd3bEc2NFVK?=
 =?utf-8?B?Sk1xMEg1OTVMQ3dYZ0gvMmNXUEJoRmR0d2w1cXJEajBjOVRHdUdoTm5YVldo?=
 =?utf-8?B?RUx3Z253SFhxT0tkOGRyRWRnaUM2UTRqR01KZy9xTmtxQ3BwdHZOK29zN2xj?=
 =?utf-8?B?T2JtOXpUbE45aFY2M3dUWk5MSVFyeXFSbUN4aEVUVXovUktDOWExQnhaaDRY?=
 =?utf-8?B?bEZ1dmNlY2ZGY2lYWmVtZURpVkRlNGJLZmdPb1VJVFUrUjZwMmU5ajErUGUy?=
 =?utf-8?B?YVRLalQwcmtSb0RrSHZOMFNtc2Q5SWZzajFoSGhJSXRzT29ld3g3NCsxZ2d5?=
 =?utf-8?B?bUNBK205blJYZWRNQzlsY0NzZWRQaW5xTDB1YkFFK284NHRhUGV1ZVdlL2do?=
 =?utf-8?B?QmpzTythSUdUSkV2UGhPSzdudTVvSjFhL2dVYUZENHdIZlVWM0RnSG5UR1ZK?=
 =?utf-8?B?U2tUd3dCblJUbWFmWVFCTENDdmtUYWt3Z25QY0NmaTQvb3VzK3pablhXNmdX?=
 =?utf-8?B?QzVvclgwVlpVa1cxaXBteVBtUHRha2ZJSDRBemN5d1A3MzNOeUNYamxrZld2?=
 =?utf-8?B?TTRDQ1VvZTlNNWJaMURka0g2TGs5WEFmb3dPL0pJR0dzczlicU5nNmtubSt6?=
 =?utf-8?B?dUdlbUVjdUdXeEZQbkNMVTIydjNjYkVMYWx6SGVUTWNHOXBjSVV0WTN2Zm5p?=
 =?utf-8?B?NllaZnFZVEhRRzRxNTBCMjcrUzZkL0JlejdoSHRwTldRbHozNDNaT2NLUkMz?=
 =?utf-8?B?dVk5cTUvZG9aaFFyRXRXNVBGbHhHbGI3NTEwVFMvVDN5cy9hK1crTEtzMjVy?=
 =?utf-8?B?Y1NiZGRnSkxOZHNUSTJ4RlVHM3EyQldzbXpyQjB5Z3FhOEsvVDJ1N3JIL3p6?=
 =?utf-8?B?aWJGWDZ5czFXL3FCRzlDRGV3NlhycXN0NDF4c3h1SE1BQTE4YmgxSjEyeU5R?=
 =?utf-8?B?V05UclA3eW1vVFV3MzREQXV3N2EwTzMzREhjU05PWVFwRVZMTDFZOVNQZzRa?=
 =?utf-8?B?TEY3ckhpVjB6Sml5VkZkVW5PbWRJeTZPQmVULzZ0NGVLWHdObTN5SnJRUkNI?=
 =?utf-8?B?bGU1VjBIYjJLQTl0eUJ6RkY1Z1EwUEQ4ZlZkUW93dUFDWVovT0xDOG40ZVNF?=
 =?utf-8?B?SVJFMzBkNnNGazV3THBSbkw2cHBjdjI0TGwzclEvQlNVaHJQbmlUcktxbHB5?=
 =?utf-8?B?RDNOb0UrRUVFaEFYWWR6c2g1T0dTTHFWSkhWaytzNFRJZEc5c3FVNlRWZHN1?=
 =?utf-8?B?enE5SGtMd2ZIMVJrblF3a3cvSjdxSy9HbDA3aGdZUlVlcVlOOHUwVlA2OEZ5?=
 =?utf-8?Q?F0stYSnaMDkVaiielVR4Mpy32UT0MxWp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(366016)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1FIWEJNUktRemp3NVZvYUhXS0Vpa0VydWRrL1U4Rnd0a2djQ1NrUU9ldjcv?=
 =?utf-8?B?UWRBN2xlaG1LZlViUU5LdTVOQUlETWsxdE5lbkZLL1JMMDFiellKOHJBd2VN?=
 =?utf-8?B?ek9raUZ4OG5RaHprMzk4K1piRVRBZUsrSFpjLzVyWXM4RHowUmMyaGl4UmdX?=
 =?utf-8?B?Tm1FaSs3K3d2cnRvcW5QNFJSdlVxbkFzdnNNNm9EQlloRjVGNVFjL3lrY2FQ?=
 =?utf-8?B?MkNCbytrcGVOa1RUUzhHUEpWeFVQL3Y4cjhEZ3hiSlRhY1hONXB6eFdmVmhB?=
 =?utf-8?B?c0djRTZYSmc3MmFDRmpYK0NuS3NJMTc4TUVxak1MNkE0L2tYdEI0UVpmMUpm?=
 =?utf-8?B?bWtWWnNxT3ZOK0RxT2RvZm5QZE1QcVI3UklUNWhNUzlXOFRpazREeS9HSmlD?=
 =?utf-8?B?SmVEakJrZU5JTHg0WnFPLzBHYU1acVF3MU10NmNYWFF2SlhNZ2pBWWNCb1J1?=
 =?utf-8?B?ZWYyZjBFeUpVamlYV0VvbWpUbjJ4MUhybVRFanNkRFI4R0hId1M2L2FnamJK?=
 =?utf-8?B?aHFraEUxWUx6TDMwMU4vYzFROHR4R1VIQkxTOWRaK3E5d0VSeFNKVzdqNlFG?=
 =?utf-8?B?M211bThwU3FsdWQ2aUlOMlVOK3A3OXhlTmNESnZrb0NJazRJcHJjd3RmS3N1?=
 =?utf-8?B?QlpDQ1JTS2wyWlkwR2RWQjBzb2UvWU1lVGRmdTQ1MjhmbjJuSyt3RE45bExB?=
 =?utf-8?B?QkpNMUpJblhRNlB4c1dWeGlTQ2RxREtRNGt6NmtwSnFMb2tuZldGc1VydTJK?=
 =?utf-8?B?QktKS3B5MnR5UFJyZzZkVzRzY2QxRVpVejYvQnRCc1ZBYXIwVnJVV1VyeHhK?=
 =?utf-8?B?cldqUHZMbC9nSExoTGM1TVlYUXVESHRtMWJlZjhxcDE1MDIyTzR4K0dROHhL?=
 =?utf-8?B?eUZ2RWw4T0RRS0RtTFN2cEhYYnlMUkxmMVM4SUVlNW9NOVJDNEl6dVllMkxw?=
 =?utf-8?B?L1dPOTFxcWs0Si91bW16TzhhOXZ4NThweS90ZTVaKy9mZ3QzMW9CZmpLQWV1?=
 =?utf-8?B?dXB3MEVjZkpuWXFTM09TVTd0TVdDbW5Sc1JUc2Rkd0o5Y0hRejU0YzF1Z3hN?=
 =?utf-8?B?SnZQeG1Vb3ZuN00vdzJZMi9mcFpjczROQkFaU2FsK3VwclZxYmozWHFHQ1JF?=
 =?utf-8?B?T3VEd2lzU0lJNDR6M3psbm5vNVZTV1RqRm52d3k4TFNoakpqaFdmUHRNeUFu?=
 =?utf-8?B?NndCV2FocDZ6MmRYZnJvcXBjUXZyVjNCdUZlc2Q3L3FORjlJcXVYTXYyWi9E?=
 =?utf-8?B?Tno3dVZkMUxsV04rZVJNTHBkS1hlTDBhNXdwNC84TU9JSEs1bWxMNEtDaFNI?=
 =?utf-8?B?ZmY3VExTN0ZsVE1TbjlzUkF0TjErc2JmOTJHem1ycEhtdHBsbzBkcUZxb1Bl?=
 =?utf-8?B?cmtzbzQ3TlZVZE1zM0V4ZjBoWjZKd0ZGb0tCY1kxUnhseTFxTlBSOVgyS0pZ?=
 =?utf-8?B?bExBNlVZalB6bi9EbDA5Rkt3NkVkWVlVc0pVNGFwM0g5RGgrWm91QzJCeDBX?=
 =?utf-8?B?RTBiMTdvM09XeFR6VTFGVERCYThSS2phYWdyS2I5ODk3bXVQVUE1dTg3R0xE?=
 =?utf-8?B?VFJZazZERVFTZHJVTE1VQTNLSGRwNHVSaDBWbHQwVFZ5MytCSmZGcDdyOHBR?=
 =?utf-8?B?OHZpbzBzemk4TlhyUWJKZHltWGpOdnZVVUJpZ0NyY1NNMHIxaG9McWJjbEFo?=
 =?utf-8?B?ckFLU1lVZFhDYmdCcVZUNS8xTU9nbWtaeDNHM28rMUE3R2l1T1FLSjNUK25D?=
 =?utf-8?B?alVCcE5GN1pxaTNnbEpsSjl2cjI0UXRLTXdoNkl1UjhkaXZBZEpRb28rL2Nq?=
 =?utf-8?B?QzNLYVBLMXdOcHBRbGxmRnh0NDErRnRpZGFOQ1A0ZjdTSUpzOGZTT2Y1Tktp?=
 =?utf-8?B?b0J4aEdRUExOWTNyb2Z2Ti9NTkNYelAwbE5mcmU1UjBBdGxNOThyUUQvb2N5?=
 =?utf-8?B?L052OEZjRkh5YWRIMS8xOFFKNzRaZmVOcHlTcnhPYWRLNjMvMnJSRXJpN3ZI?=
 =?utf-8?B?RExNb0Q2TWhhVFIvVDI1TmplZnQ2R0o3eU1rT2Q1aVlMOWcwcGhzZEJROXpq?=
 =?utf-8?B?Y2JGVjdjWDJBWHdaK0UwQnRtRTRsVHNSYTlVbHc4aTFhdWF3TSt3aE5BejM5?=
 =?utf-8?Q?xV7GD03LH2PLz8N2EM+HgdFPw?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1718302f-0ba9-4693-368e-08de0d15a114
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 00:39:28.3629 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bX7wLNxzHYONzlVrGrKO+W27ZLBDJVD+XrdlT+R45Y2kuD+OsFdcd6FOEI+AW/Yg2KDkNJBXlbYI8GhNPDhkbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4341
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

On 2025-10-17 at 05:44 +1100, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote...
> On Mon, Oct 13, 2025 at 8:21 AM Alistair Popple <apopple@nvidia.com> wrote:
> >
> > -rust_allowed_features := asm_const,asm_goto,arbitrary_self_types,lint_reasons,offset_of_nested,raw_ref_op,used_with_arg
> > +rust_allowed_features := asm_const,asm_goto,arbitrary_self_types,lint_reasons,offset_of_nested,raw_ref_op,used_with_arg,slice_flatten
> 
> This is not sorted, and it is not mentioned in the comment right above
> it -- in general, please try to clearly mention this sort of addition
> in the commit message too.
> 
> As Alexandre mentions, it will not work to use it as-is. However, what
> happened in 1.80 was just a rename, but the feature was available
> since 1.67 as `flatten`.

Argh! Thanks, I wasn't aware the function had been renamed.

> If you want to still use it through an indirection or similar, then
> please move it to a new commit that explains the addition of the
> feature and the indirection to use it.

That makes sense, thanks for the explaination.

> See e.g. the `file()` function I added in e.g. rust/macros/helpers.rs
> in commit 36174d16f3ec ("rust: kunit: support KUnit-mapped `assert!`
> macros in `#[test]`s") to see how to set it up.
> 
> Essentially it is:
> 
>     config RUSTC_HAS_SPAN_FILE
>            def_bool RUSTC_VERSION >= 108800
> 
> And then:
> 
>     pub(crate) fn file() -> String {
>         #[cfg(not(CONFIG_RUSTC_HAS_SPAN_FILE))]
>         {
>             ...
>         }
> 
>         #[cfg(CONFIG_RUSTC_HAS_SPAN_FILE)]
>         #[allow(clippy::incompatible_msrv)]
>         {
>             ...
>         }
>     }
> 
> I hope that helps.
> 
> Thanks!
> 
> Cheers,
> Miguel

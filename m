Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA960B4FED2
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 16:07:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2555F10E793;
	Tue,  9 Sep 2025 14:07:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="dlyaCifj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2066.outbound.protection.outlook.com [40.107.236.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63AF310E786;
 Tue,  9 Sep 2025 14:07:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QQvTOg4AtWsA+1TGegPBP7oL5M1OgPDAlLzhdGygVruD6LLdoMdaJnb7LKfGLHD2UtQzXYNlAjTXFQ0O6kgvge3qLr84LLzn6ugNZnQn8otZcDeLs/vZC0JSFIZQ4yC2DZ253zIFbZCpfWvb4RyxDUscUvIKBCx7KJ7GOkJMSfeWxvhH+Ks9mE+ID/DyUMjiCJqiBnC5KmOgZAkMAvmkc/31EDIIsyEhCkhIeJliNrvD/6v5b+ZIZj2jTA2mnkTzqbWfli9JjUJhM5iQcBtbUrprJbNP5uBMxZnmaO08WhKskgTZD9bXZYBTHi1WOw2anpaDJL/VhQOLaZ1aPWy7Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/RHs4RuOFY1TLqnYWVXXVNz9jvCNuGUgosjbjlXt7QM=;
 b=tDUtPTeu4eNGIydFagH9yE1O19HYXEHaIFagHBKWwSSkh5jotHfhIJZ60H7cOeZ961AZ66++PxA/HUMB95K03w9TB05KP/q6R4HpDhnYGr2wJE3trJAxZzp8F+7bicKxcXEWamgNaTX6wRRRVsvpcMYvMPt78UCjc7CmsNySkcdRuBfFTHy7UPOW3Wiql4hSQxuBd0Tiav7MEwEtNpxno+pdxJ/BImi1sNhuSBDJ6atf/r8A5hxor+q4OfYXJ30JRjEF5KDLbAlbVDTKFvO29Z9F0CO9B2LLHDuhE7462t33AN8b4JR5+1Wwn6W4PpunrAzRkJiA4Qq/q1H0c26lIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/RHs4RuOFY1TLqnYWVXXVNz9jvCNuGUgosjbjlXt7QM=;
 b=dlyaCifjiTIumTmP5LGpuY+OXj0B+noJkCNkySviv2d/AWI/rDw9xkfjO1kHRCqu9dbMvXe1JWKEIV6dUwK32DyCwoMsqO8Bie0Ve5dKF8fqwO6zUoPZhZPpXuk94p4xBdluod/6XHmH0q5s60VS0PVYC1Z9SluVsk9oHp4RPbocJlEHyseXTA5nEMz1eZ9wsU8K3P1AaE3e0/RUE5lmCXl4onvSQRNVYNuMUNlEGFn/t/YCZLQejfGqnBJzYUDxIHFN7+MyZue1uY5p+CoMZR1SVxbXMdZ4EZ6M4C2kne5h9e1AqyZssxaCv8oTHyuZTh8WFNCH6tlVsWk4+hmJBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CYYPR12MB8653.namprd12.prod.outlook.com (2603:10b6:930:c5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 14:07:24 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 14:07:23 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 09 Sep 2025 23:06:46 +0900
Subject: [PATCH v4 10/11] gpu: nova-core: Add base files for r570.144
 firmware bindings
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-nova_firmware-v4-10-4dcb433d5fee@nvidia.com>
References: <20250909-nova_firmware-v4-0-4dcb433d5fee@nvidia.com>
In-Reply-To: <20250909-nova_firmware-v4-0-4dcb433d5fee@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCPR01CA0166.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CYYPR12MB8653:EE_
X-MS-Office365-Filtering-Correlation-Id: c73c9040-e99c-410e-f787-08ddefaa328d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|366016|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TlZCemRHcG5nL0JKWlJNK0U2MG9mWThIWi9zekduZ05ZNUNHMmwxK2NGanVq?=
 =?utf-8?B?TkVOa1p2TDhTOHd6YzQvWnRBTm4zY3BpTFJQQnRHekZyREcwTFYzd2JrenJE?=
 =?utf-8?B?YVhZS2xYcnhqYUtzMjZsQ1JIaUlZRGwzeW5qUVY2U1JWWGZxN1lvMkpOSE13?=
 =?utf-8?B?UElwcmxoeUVyZUdyVzJTVXRIZVY1UXc3SDFiZWRTMnZ5dWJaQzdITnRzQ1Ba?=
 =?utf-8?B?NGZsK3YwZW9haXlTc1pES0tMUlNRRzRuRHMxOG5JMmdxcjZiZ0RQdnBHTlRN?=
 =?utf-8?B?RG50a0FQdHRCRFRJdkc3WUdxZWkzZDdjeURJOG00MkgxcXJsVmlIZUV5dHdu?=
 =?utf-8?B?VDhpU2hPUEFuVEZBdGhOMEpaNDZQWnBKMzFhMEpCQmh1WFUwSUVCbmI3blI1?=
 =?utf-8?B?Mm9nTmcvV2xlNFhVWURraVFyLzZkWXF3TnpqaEFwaldkU3NyNFN5SG5JbTV6?=
 =?utf-8?B?alExeCsrUGJZMGVyNDcyMUhaeTRUd2hKcWRGOU1nTm5ybks2dnQ2bnc2cmY5?=
 =?utf-8?B?R2NmbnlxZEI5NEZLd2dUS3FMNWtzWlg5bWQ2TGxvejI0RmZ6UHVsWFZTTnhl?=
 =?utf-8?B?YWNaT1l5QnVmWVZyTmZ6NHZkTngvbWRCdk1hQ3Y0TE9Na25qTU0zN0Y4UGx5?=
 =?utf-8?B?QlR5bld0TkMwaU5jQTFvaDdaRnUxdVZuOVRiZmwza1Z4RGpHSU9BWklYUGlQ?=
 =?utf-8?B?M3RqYWlxRzRhQmJuRnZRMnVNS2o2SENGL3FNNEtLUnN1QnNSWW5RejhTN201?=
 =?utf-8?B?UmFBbXVKTytWWWFBam01a3V1VnMrSVFITk1rU2pucTM5ZHJvSjY3bHRodnRz?=
 =?utf-8?B?blQvMjR3UStIV0ltd01vOG4zZGJoaVcvOFM1N0dYVmRlWk9MVXJpMmpxOVNu?=
 =?utf-8?B?SFhBV2JtQU9NU3hCbTlqc0E5a0p0cTRqVlBPWWxrMnk5THJMRnpqbEZGc2Nn?=
 =?utf-8?B?OGFlY3oreXM1cXV1Uzh1YkpHaFRrMW9RV1hZSWM3WlBMcDgxczFzOEJEdm1N?=
 =?utf-8?B?eDdQSFhzTUNuOGFBMDc2NFBwTG1iL1NONkJ3UEdPbEMrQ2pVazJRUm5lSGJj?=
 =?utf-8?B?eVRmR1Q3ampLN21LOE1BZmI1OStBK3RPSDhtejlrZ2RhS1RDNldYSzkwdWRz?=
 =?utf-8?B?dGhiZFBsSEtHbmdRMHJqSjZlS202YS9GaFc2dnM1VVhEQ0MrL1pzZ0NqL1RW?=
 =?utf-8?B?NzNyU04wV2x1VDVibFhqdFBoQkZEU0J3VGxVK1BvVURZS1pMYy9UY2pCL1Jm?=
 =?utf-8?B?endHcmJHRlhMRlBlU1NqOHpkSlpqWXFJRjZ2NUxYOTFJNkRkbW0vRnM4TTM4?=
 =?utf-8?B?WXhtb05HUHIwOG1ncjFIQk1jbWpEWnU0cmpYdjBUeUJJekU1M3dPYnRnVFNS?=
 =?utf-8?B?RU5jRmIvSFlYeGlwZnNLbjJ5ZC9EVTVwMzVDbkRTaS9HbWlKbzk0am1PdHNP?=
 =?utf-8?B?Uk9uemM3U2hQdlVTSDBJZStGcVlJNWJPeWhRZG04RVBFcDVabWxzQXFyOW1Q?=
 =?utf-8?B?ZGxZOFQ1amo5Ymc5d1ZjcG00YWMvcFh6dS9zUnRWc01JelhEa0xtWGRUUnpw?=
 =?utf-8?B?VDNtcEZqTnNETzN3cVNMaW5SL2dxRGFxOFllRHlDbDBoSCtCbzRNZlNaSG1x?=
 =?utf-8?B?M1hvazVneERKVjFhdmVKZTRIVldEd3ZKZGxJUGVzK3pHYmp5Z2RlZkcyTU4r?=
 =?utf-8?B?SjUvZTZjOG9pZnhHSjhCcm9BYklCUFlHYVd5NU1VZ2txSlBDOEtCODZIMURa?=
 =?utf-8?B?K2kvUWVSM0Q0VndMQUMreFFxZE5NcCtuOVR4N2JpQStoeGoyaVdFYytzNkZP?=
 =?utf-8?B?NzB3TEdIbkFKY2plUGl0elh4L212K0FWMEdIVlI2Wk05UTU4UkFadS9wWnhq?=
 =?utf-8?B?NzI4Nit1T3ZDWjMyVktPYmlySmZIYmpMVi92M0R2WmVyeCs4Q0hqMnlKWG5q?=
 =?utf-8?B?NFhGbXFBMUd6QTFBUmhacXhOMFpiRUpHY0lLMjFveDJFd2l6RUxaNmY1a2Vo?=
 =?utf-8?B?aC9wL3FrTkZnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bEtHb08vMFZ2NDVUbXB2a1RVRlllZW0zbEo4RnNvOFQ0dzBWOGlxZGZFck8z?=
 =?utf-8?B?bjBsQnBzMkppK0ZSby83dTQxK1FQTEpvaDh4Tm40c2F5aWQ2SmRBYTd2cU5W?=
 =?utf-8?B?WS9nUk52SlUwZkQ4a0ZUUE00YlA0cTNla3ZzMmJiMm1IT0lwaWhSSllKcHdM?=
 =?utf-8?B?ZVB5SDBhYVNJM3pVRjJSYi94NTBxS0M3T1hUU0hnUGdVT1Y5Y09VUWQ1cDBi?=
 =?utf-8?B?MTRyTzQ1azZPMGtRcXUwWUQybURzNTZ0djFYbFo5R1oyODhqMXdPTkhDVUtP?=
 =?utf-8?B?VmJIOHlWVTM4c3pQRmFycGtzZHJlMEtmL2xBelVwOHp6UmhhZlRVd1RDMnRy?=
 =?utf-8?B?MXJDT2RGYW05dEVPRDM1akVwWHNYRnpqeHk4ZVBWbmxtUldVR01ja0tTeWJP?=
 =?utf-8?B?MExXMlFIN09UZ1ljd3dpNDAxQlVJMTZ5T2wyWlV6ZjdFUFhjVDFtdW94Q21M?=
 =?utf-8?B?M242UFkwRlErcUIzditvL2RZMXNIMHNwWU0vUUNqaXdKcUF0QXo3ZFU4UDY3?=
 =?utf-8?B?VGg1QW9TdDRuMUQ4MHlvbHRIZDk5dXg0MzVZTjFDNE9ncGx3dGZsVitacXBn?=
 =?utf-8?B?L0VzM1pVeW1TR0xmSWNtbXlxbksyd2x6eXk4RmJwUFlmbVVNV1habWlCakFX?=
 =?utf-8?B?dnA5ZFVxUUhMakNZZHArVzU1NzhnM25vZWVHTVAyZk96UFg3OFgrOVJXL0dS?=
 =?utf-8?B?L29QdVlXUUVzTEd1OVJJSHBoa2xQTGFUaTB4aWNBTU5QQUpabFJjMXlhRDJU?=
 =?utf-8?B?Z1lpbGpxMkVCQUp2L0Y2cWtNSDVxNkhKR3NpSHJ5N0gyWU8rMjF4NkNYeDhK?=
 =?utf-8?B?Z1lsWi9xVzdYTkFiQ05EbS9XR0FQVkxDUlF4U0U5SXphL0V6S0ZKdFRpZ2lt?=
 =?utf-8?B?STFsckp5blQzbzBMVXkyQzdLclVVUTlDRUxmMzZSNEt5VVcyQkNLVElLa0Jn?=
 =?utf-8?B?eVlJQkd6T0Fzdm1KSGlOTFo2eEkva0Jwb2h1VDRoTzRsN0VDL0hEVm9GdjRJ?=
 =?utf-8?B?S1prclhVdjljUjN2SFB3dFJEMDNLRzN5RkpWNEE3azNqR1RRR243ZGZtV0tN?=
 =?utf-8?B?OU02Vko4QjZtVW1tbzN2ejFRYkJjV1k0Wk45Uml1WWZzU25zUjdsS2REVjk1?=
 =?utf-8?B?Z3AwVkhMNCs3NGoxcXQwUjQwOGhvcXIvd2hmRXA2WmlEOUV5cUI4Q1R3QktG?=
 =?utf-8?B?UVAyb0dlM2xPTTVvZWtRVDUvWFI3amV3Z0VLbWNaRFdCTXdYY0pvZE91UW9n?=
 =?utf-8?B?YThsNU40cUYyZUZ4eFVoZllYZVRjYVBRcElXN3RQRHRSMVlVai9pSG40eXBh?=
 =?utf-8?B?bTg4bXNJdXNLWHdKNE0wLzcwTlJhd3dIVjFSVFpnUFRpUW9tNmtlUmNrcmpr?=
 =?utf-8?B?S1dlMWZzT0FBNTRKZjdCN1VxdEdxem82em11eWg1TElxZXcwZ3B5azdwWWFU?=
 =?utf-8?B?aW9JN3FmeVh5U3g1dFBPR0lFUFBpQ0kwTGQ5bVBqOEpTRUdINFI2cFEvQnQv?=
 =?utf-8?B?Uzg2SE4wUDRrbXorWHc3SHU3K2Z1bGxHUU4ydXNkMVhSSlpzRjJuUVhCN1Jt?=
 =?utf-8?B?SmR3T2RobzMvU01meE85c3hzL1VkWDJWekV2blpVaUYxK3RQNkRDdnN2cGkx?=
 =?utf-8?B?ejVmRFNFWDlFbGdNQzM2YWZGRkNxTHFiMTZtVFRONzhoKzI0SUFiMEZuQmQ0?=
 =?utf-8?B?Mm01a0FuWEdSQTJPTy9RQ1p0WmxIa3VySmlOd1dYMUdTVmRLNmYzUjdnRTJ0?=
 =?utf-8?B?bDQyQ0tNUHhIVWFpN25GYlN4QUxLYjdNL25BVytqNDAwWllUNzB4aklITVEv?=
 =?utf-8?B?REpsMzlRb3FYZVZDdUUwZ1JVR1VmMWxKMW8yN3BBRUZ3QllJMW9OV2lKQzN3?=
 =?utf-8?B?TmVLRVBRVURZY2oyWTN5b3lYZE5xVTRBYjNSd0tQaTdXRDM5aVptU0xYQTFi?=
 =?utf-8?B?UnZWU2xlc2N2VHppVzh1a2pZdVFSYVp1Z3pIQ1hWQXEvZDBMSmI3MTM4YVBj?=
 =?utf-8?B?NDFXV09mQkJab1FSR0tBa1VIc2g2YVZTcTdMeGZmZmsweEhFV0NZSTduRjND?=
 =?utf-8?B?S2xBNUlSOHBsdG5oUU5pMHJzb1YxZGRrdUcrWDFtUmZ5eXdNVFBvbXEwTXF3?=
 =?utf-8?B?T01kZGd1WkR2c1FES3k5QUxXanp5Q0pvVWxOa2FSMGlvS0UrYkIwR05SMmQz?=
 =?utf-8?Q?TTNX7vfIaCJ2SV8uuyh9q35voLj/B5hMBxqDXFmLN8u4?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c73c9040-e99c-410e-f787-08ddefaa328d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 14:07:22.9368 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lk7tGedf2ZXtmvnNaQPkDLklcfBuQkcB28GqAL+puIc/yV0g2qgCe9brIFdtqkvVSQ9ScWfegGreIqUbByQwsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8653
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

Interacting with the GSP currently requires using definitions from C
header files. Rust definitions for the types needed for Nova core will
be generated using the Rust bindgen tool. This patch adds the base
module to allow inclusion of the generated bindings. The generated
bindings themselves are added by subsequent patches when they are first
used.

Currently we only intend to support a single firmware version, 570.144,
with these bindings. Longer term we intend to move to a more stable GSP
interface that isn't tied to specific firmware versions.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Reviewed-by: John Hubbard <jhubbard@nvidia.com>
[acourbot@nvidia.com: adapt the bindings module comment a bit]
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gsp.rs                      |  2 ++
 drivers/gpu/nova-core/gsp/fw.rs                   |  7 ++++++
 drivers/gpu/nova-core/gsp/fw/r570_144.rs          | 29 +++++++++++++++++++++++
 drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs |  1 +
 4 files changed, 39 insertions(+)

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index a0e7ec5f6c9c959d57540b3ebf4b782f2e002b08..6933848eb950e97238ab43c7b8f9e022ffe84eba 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -1,4 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 
+mod fw;
+
 pub(crate) const GSP_PAGE_SHIFT: usize = 12;
 pub(crate) const GSP_PAGE_SIZE: usize = 1 << GSP_PAGE_SHIFT;
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
new file mode 100644
index 0000000000000000000000000000000000000000..34226dd009824c1e44d0cb2e37b43434a364e433
--- /dev/null
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -0,0 +1,7 @@
+// SPDX-License-Identifier: GPL-2.0
+
+mod r570_144;
+
+// Alias to avoid repeating the version number with every use.
+#[expect(unused)]
+use r570_144 as bindings;
diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144.rs b/drivers/gpu/nova-core/gsp/fw/r570_144.rs
new file mode 100644
index 0000000000000000000000000000000000000000..35cb0370a7c9b4604393931f9f3bf72ef4a794b4
--- /dev/null
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144.rs
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Firmware bindings.
+//!
+//! Imports the generated bindings by `bindgen`.
+//!
+//! This module may not be directly used. Please abstract or re-export the needed symbols in the
+//! parent module instead.
+
+#![cfg_attr(test, allow(deref_nullptr))]
+#![cfg_attr(test, allow(unaligned_references))]
+#![cfg_attr(test, allow(unsafe_op_in_unsafe_fn))]
+#![allow(
+    dead_code,
+    unused_imports,
+    clippy::all,
+    clippy::undocumented_unsafe_blocks,
+    clippy::ptr_as_ptr,
+    clippy::ref_as_ptr,
+    missing_docs,
+    non_camel_case_types,
+    non_upper_case_globals,
+    non_snake_case,
+    improper_ctypes,
+    unreachable_pub,
+    unsafe_op_in_unsafe_fn
+)]
+use kernel::ffi;
+include!("r570_144/bindings.rs");
diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
new file mode 100644
index 0000000000000000000000000000000000000000..cec5940325151e407aa90128a35cb683afd436d7
--- /dev/null
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
@@ -0,0 +1 @@
+// SPDX-License-Identifier: GPL-2.0

-- 
2.51.0


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 706ADAD72F3
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 16:03:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BFE910E852;
	Thu, 12 Jun 2025 14:02:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZwsYu6hm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2057.outbound.protection.outlook.com [40.107.220.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFC3210E84D;
 Thu, 12 Jun 2025 14:02:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dgcv2z7mmUFNlxR2rXfsfQUQjZMoPuBIkXYq5uNoiLt5zIs29xsD6WjBe3jA+WNl/RzcQ/lbS6LN5bU3jHwjYYWW23tRzULEA8+c5xShjuuBzUxEQAJ3P06Sqj8ncC7v3b8sXhR558dOKf23WWGjnSDX2ruQsaK6xJVh25JEjB+bX9kbL862DWDPXk4duV9nd7NPbyWlWNV+JkwEQt+MPftXpkHuQ2syCinjWUKrC9QGSc4YGvdW6nOKGrvE1eDHBuMbi3PflZ5qBnvvdRcnCl0gJSpk9ozQf0j3Gy5KCTEqHRSkoFSLbBySYDkqksrtxPRafXHSUUM4Ivu7ut5Cxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fbnQ/FyHfAyCCyFUkPYxHinCAmvkpj0+f2thgsqQmfg=;
 b=PUy2vSBk981+0jG3tnK+rMXAIbqoei4XQHbW7UnTy6i6MMDoTk3uoONEsO0Z9D1A4GrztGdFcQeID9pk6DykOrHVkbDffg00j+7BoDH0vf4+VHu4C/xaiOg5rovrESlrFlRMPxu42W6MriSSBp64hOGIQ8jCyir0o5/i3RjlZij8zTU3p56sXdY9PXMdHKRCxaRZETiW6ajxNpuxTbvi+P/wIZ0sg+eYGzQGZL7ToUzJkpMLtSC1QE78x2YTAnSXj0kuMG/dgUWA5f3pNW1s8wqwifkdA2UeNUChoCDGGl//V32LHaHtfsab7PocIb9blka8DdQ3ChLVNckLVZEkzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fbnQ/FyHfAyCCyFUkPYxHinCAmvkpj0+f2thgsqQmfg=;
 b=ZwsYu6hmTmoKye5GkrAZvObsNBEFmc3hUXWeqh7QOO+k9MOsnunVCl/UjJtNM0hvrdP998CuFHqC7hybiUpqOCqsOQFidURQkkjTquQoWFvbqSJ9KCcD5KmBG6pyK22lqzCiCcot0/xeguplV291kRfW7j3s7xBBDCh6P7yCMtsb5dXVYyYY9J/DzPk2qbnHVhWMa0atS444LmZxSLXvDP8dZT6Xq175PkhqrjIjbHTMnLWmbjiLGW5CkHGmyxvRMNibFtsCbGLwUSpniRkgF8rr7XO5C4JjqJrBE9G5O1MT3IK9I/iOZqF9derY6o304NIqrNrLNUyNsTzCxD6/lA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB8458.namprd12.prod.outlook.com (2603:10b6:610:155::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Thu, 12 Jun
 2025 14:02:49 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 14:02:49 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 12 Jun 2025 23:01:34 +0900
Subject: [PATCH v5 06/23] gpu: nova-core: use absolute paths in register!()
 macro
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-nova-frts-v5-6-14ba7eaf166b@nvidia.com>
References: <20250612-nova-frts-v5-0-14ba7eaf166b@nvidia.com>
In-Reply-To: <20250612-nova-frts-v5-0-14ba7eaf166b@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Benno Lossin <lossin@kernel.org>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>, 
 Lyude Paul <lyude@redhat.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TY2PR01CA0001.jpnprd01.prod.outlook.com
 (2603:1096:404:a::13) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB8458:EE_
X-MS-Office365-Filtering-Correlation-Id: fc57581d-5fcb-4a88-a065-08dda9b9d090
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|7416014|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c1lFVHFnZ0YxUW0zaEJqYmtETFBRN1AxZEFiTXpSM1cwMmhGMkJTUWc3aTZH?=
 =?utf-8?B?eTVVT1JaME1NbUlCTWJRaTRBa3ZhanBHVHRZN1ZhRnRDeGdmYlFTRytpbVlm?=
 =?utf-8?B?RkFwK0RLRmU0Y2UrQTBGMUVFWUk3NklyT09lY0hLTmEzOFZRZGFMLytzZmdy?=
 =?utf-8?B?dzFGcmwrVUJkMUVsU29IMllQdXUvaWwwcjVHMGpWVnZLQ1Y1ZnpZVExSdzZM?=
 =?utf-8?B?VU82dlhEMURVTU1Ob01UbEFNS2JqN3M4K1RjUUorOC93Y1pMYUoweVEvQlFi?=
 =?utf-8?B?cHREdU56Z1FHU0R2dzdrUlY5UUNteGIrWlRUdE85amo5L2FiakhhY3l0Qi9H?=
 =?utf-8?B?c3lYNHFaMHc3VDI3Lytsd0lTLzJQQng1bWtoN2YxUkhJV2xXM0RQdmZBcHFy?=
 =?utf-8?B?dEs2VElvZkdJYjJrVk9TWmJzU2pOem1LNVltOGk3d3lYalFQdmc0eERMMmdp?=
 =?utf-8?B?WEYxVDZGMXpnY0E0d2FvL2VybllkKzR4ejFUQnNDSWRuT2lTWkhCMTJWcUdM?=
 =?utf-8?B?NWQzdGJmTi9qNzlSQ2ZGUVp0Q096OU0wMDhHbllWYWRuZnFOR1VtcnZoZEdm?=
 =?utf-8?B?dzUwMzRPNGJBa2oyVmlSVms5VFB4THZSeE5KclpzOEFPdGRCTmxNaWxYdnRM?=
 =?utf-8?B?YVpLajBQNlRQNGduaE05dkJocEJwOFBUT3dPSC9yWTNremVpT0MxcFJ3Nlpq?=
 =?utf-8?B?eXEydEdGMkNUZUNMdUJFQmZuOU1HK0tYTUl6NU9XdkJwaUJtTnRKc1BLMytS?=
 =?utf-8?B?TjVFSEhhMVBRMmxlOWtyV3RtVnhSZzNpRi9NZHVDTHZ2L2Y4dEsxdERLNjhL?=
 =?utf-8?B?bTZsVWVmaXZBZFdxR284b01YSzlYZGdsazBxTVBERDRJMUJnWVg1b0VYaDli?=
 =?utf-8?B?WXRudXpiWmUzMUhiMGFyanVNeXU3ZWl5MEVZbFZ4eWk4bjA3cjV3NThLSmlD?=
 =?utf-8?B?VFBtTy9ranoxa2VERktPZXM0OWM3b1hWVjJ5NTI1MXFTS1V4RWdpczRnQkhn?=
 =?utf-8?B?YmdrN3lqVGZYNGxveFJST3lUc1hlWDg3OHAyUmR0R094aDF1djRGL1V0VXIz?=
 =?utf-8?B?WkJ3aEZsOFhuc0J4WkZ5MjRhWmpxc1p1ZEI0VWEyeTRhNjJmUjVYVXJyY1RL?=
 =?utf-8?B?eU1iSk0xbkpna240anNoTHdRYWNOVzRGWUtwbCtZcVVTR3VvQTJlN1Zvay92?=
 =?utf-8?B?dWF0Nmh0cDMvM1RuNEdrdlE5MkRvMCsvVUhZY2h5YXd5WnNnZmI1TXYvdm9u?=
 =?utf-8?B?emVGZWNPOXdFT3h1Ym8wQjBoRkMrZ3pEU1F2cnNSZ2dJTm1ENGRwQUc1ZXdh?=
 =?utf-8?B?NllYS3RNSjAvTjlRRzczNlZnSEhSc1UwcVg2MVJUTVZpQmgyQ2JtU0FWQlNn?=
 =?utf-8?B?UVI4TWo4MllPODJVY29wQ3hBTXF2ZkpTdjlrSU81dXc4cW92OENvMHlXcGwr?=
 =?utf-8?B?NS9wM21RbWMzS3dIbDlicE1JRFVEYlUwZSs4S3k5Wng4WjI0YVAxdDYzMEgz?=
 =?utf-8?B?V3VWRWNoMnZXMGRJRDhmdDZpZXd5eXF0aWVUd2lrdi80U0tMVFM0UWhhbW1p?=
 =?utf-8?B?SWNFTGNmY04wUVc4YzBoK2ZpNE0xK3ZVRTVNMldCS1JLeFJXYmo3Q3p5aWJp?=
 =?utf-8?B?ZWJQMVQrQUNnM2Zta0ZwMlBIbnRQeE8wQU1OcVFnQk9waWpaN2liTGRpNkN5?=
 =?utf-8?B?akNrT0FRUTBtZU9FcC8wYWhPWko5V09XR1JRM2hMNXhnMXczZS9scEw3MVd0?=
 =?utf-8?B?czM0NHlPd3J0SklBRVc0dmxybnROWnpIUVBubmMxZHdldmUxRVIvbEtWbVZ2?=
 =?utf-8?B?ZFhoYWplemVoV1NLN0hsV09qVmR3d21EWEdJczlNNWlHZGIwRDl4SUZEaFNK?=
 =?utf-8?B?emNPSEFRVDMzd3l6bDk5RDk3R1ZpR2tSWC9iYjFId2YzVXFDWWNEN1QyRXNE?=
 =?utf-8?B?ZC8rWmJoUTQ4TlJlVHY3TlUwRjYzcEtiVWwzeEk5N0ZVMWpZK1dzb1pjdGJs?=
 =?utf-8?B?MXRIVlFndFJRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(7416014)(376014)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QkxUR3JwL1QyTzk4alNLaUE5cFY1dlhISk5OYkNMOXJSM0REeTlYTmhtQnR4?=
 =?utf-8?B?c1FRODh3a3FMQnNsMEVzVXo2TnprZmkrRHFxVFZEVHVsWlBOK3JUcXgvemtP?=
 =?utf-8?B?bXhLZjcvamJ4Wkpoazc4WTI1OXVQT0NrNThrbnRYa2V0bmdRM1ZVNDlHbW43?=
 =?utf-8?B?eXNxZ2lzeC9YSExMeUNNVWllUU8zSUpSRUUrNEFUYUd1WFB4dStHemxGbEJl?=
 =?utf-8?B?MHM5OHZJWjlJT0lhTEJ6azNaMkFUWWdsWUVxSjFWTmlDQmlMc3hqci9EeGs2?=
 =?utf-8?B?TGJHTi9vM2pta21Ec1IzREY2WXo4NE1wZitkdHVCUXFWL3FzWE1Sbkw4Sm1p?=
 =?utf-8?B?VzZ3UlgxMkxmYTg0dkpFVDZnOWF5Wm1MTjRLZ1VBTUdPZW45dTR0R0ljdW9Y?=
 =?utf-8?B?SHdid3B0ZGdhSmlReGpveTAvNGRKUFFQSGhFbkFuKzFmVFJkRmozb05LNkor?=
 =?utf-8?B?clFrTDlqOFQyQUlKWTRwTUZpYnRzTnR2S09FWGVkN1FBTE05eXBNclVzQUFY?=
 =?utf-8?B?cUt3TGI4QXRXUjVoRy92VUNjNUJ3VFNHSHZLK2hYSnBRcGNjV1VOZVRsdjFv?=
 =?utf-8?B?RUtiNzdtYkdUY3VTZ2tycDdKVHdtcnJqUGRlSGJEa1hRcWFvRXRJdCtzaEd6?=
 =?utf-8?B?S2xzSWJrcWVKbXljYzllV2pWUi9GNDdDNE5vVHR5Z3VCeE9lZHFFNXNvcUpn?=
 =?utf-8?B?ckRDdC82Ukx3VmU2MEJXMGorcHM1SjRLZ2RKU3UrczN1UFJ0Qzc3QnpzVWhN?=
 =?utf-8?B?Y3lYZ0lnYlZYZEhySzhNYUliRWhqN2NqNERKMlE4UTNvMmwwcDJWa3VKcVdD?=
 =?utf-8?B?Slk2QmtYaTMrdk5TZGxSRDBNdUo3alVLNFZTWGZrNWpuMjgwelNZbUhmUGJr?=
 =?utf-8?B?SktPbkhzK1Z6bnl5ZWdocm9pVEZmNzN5eFRnSVAvY2U0dGd3SkdIRnRlenBi?=
 =?utf-8?B?ZDNNeEg4SXE3ZG9INDRHSkZqZUVNb1VFQlVmcjVyYTJXdGw4TGgyMFhOUzk0?=
 =?utf-8?B?VGpXY0ZzSEJYcmlRbmN1aXcwaHZHSUtBR0krK1hldVM3UHZobG1XSkdzMDdi?=
 =?utf-8?B?VFBpQXFRZjNuWUlONGlkZzBPZTdOa2NJMFRMdkVCR3phclNiZjBMV3RaYzhH?=
 =?utf-8?B?RDkyZDhIbCtPSCtvZGVPdjNsNEN5OE5LbSszN3dySlg1SGFnVFJmYUFaUUFk?=
 =?utf-8?B?RFh0RHJzS2IyTWZ0VC9nd01sSlNKRUowVDVqaVcxVmxKTGtMMFVuNzF6Ti92?=
 =?utf-8?B?NGZpeFNPdUVVV2FyRk96WFRPVk95b0o5dVRvVUgxU3Y5THhianIxbk1uSTJX?=
 =?utf-8?B?SnI1QUhCN3U2dmZLaUt3RGo1cnlmb0xtaHYyVXUrYzhnc09OVWRXYS9pSVFQ?=
 =?utf-8?B?Mzg1TTJpdVo0eGttTDdUblprSXVoQmttZTFzWFdSV1UxWXFhYTZkQ2RYOWt3?=
 =?utf-8?B?enhaSlo0SmtueWo5OE5qWjFHQTlZRFBUVjN1czhVZ3FEQ2E0dHMrOVNQdEh0?=
 =?utf-8?B?MXhWZklRakh4Z2F5ZGZxcC96N0FCZGVXa0JjNnZ3SnBDYmJEUnB1VjBNNElk?=
 =?utf-8?B?b0w5ZWhCS1ZzNmZXd1Z4eHo1bjI3RDhGRThhbU96a0NmMG9KMisvTkYzRjZa?=
 =?utf-8?B?c3d6bHdIYmhzalBnZngwYUFFRmQxVktYK3F6RmM0dkpQays0NTA5Rmt0bGp3?=
 =?utf-8?B?ek5qemNPcUliMWloQlg4UGx3V0xqdXp4eVUwazNXYTczaTN4VW9IMUFtMS93?=
 =?utf-8?B?K2NlQ0hIdzZnUG5ZMUd6Qk0rNmtSWld3V3NjeCtKZysvR3QvMXhMZEQ1SUZJ?=
 =?utf-8?B?OXJkQ0FsWEdZYVk0STdpZnFaTHE2OW1tZ2pIK2JnU1M1Yk0zN1BheXNoOGhj?=
 =?utf-8?B?VENuUzF0dGNhUGRRZk9NRk5oUHVqbys0L2hDc2lFSnV0S0pOdFppTmtRclhQ?=
 =?utf-8?B?ZkU3eXkxd0xpNCtuTDZscDJkemdiWThhS2F6dlhleW9EelJzYWR2aExHbTAr?=
 =?utf-8?B?NGhaZUw4MVhRV3h3cGI1eVN3UDMybWsrZlh6L1JqUmpNN1R0alRSZzRRNEc0?=
 =?utf-8?B?d1pKSmwySnYwL2w0T01RVnFPWWQraktWTnA5Q245S0pvRmsvNlN0K214NG4v?=
 =?utf-8?B?TWdUVG51MVhnRDZpZ05oU01HQzVOeDRIVEVlN3FUZFFNd1Q1UXRKQnNyTjRa?=
 =?utf-8?Q?GHmkm7oRVy8k27jjptPIp1+ChzL8cBlMW3q6fpeDMMmV?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc57581d-5fcb-4a88-a065-08dda9b9d090
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 14:02:49.1103 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: utRZupEfk7S07dPkpcO0oFW6cBoB8lXzSRhf2T5IYUvMePY3pPj5vbCwSU367oCr7b28s9kcA96FS2rjefi9vQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8458
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

Fix the paths that were not absolute to prevent a potential local module
from being picked up.

Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/regs/macros.rs | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova-core/regs/macros.rs
index 7ecc70efb3cd723b673cd72915e72b8a4a009f06..40bf9346cd0699ede05cfddff5d39822c696c164 100644
--- a/drivers/gpu/nova-core/regs/macros.rs
+++ b/drivers/gpu/nova-core/regs/macros.rs
@@ -114,7 +114,7 @@ fn fmt(&self, f: &mut ::core::fmt::Formatter<'_>) -> ::core::fmt::Result {
             }
         }
 
-        impl core::ops::BitOr for $name {
+        impl ::core::ops::BitOr for $name {
             type Output = Self;
 
             fn bitor(self, rhs: Self) -> Self::Output {
@@ -161,7 +161,7 @@ impl $name {
     (@check_field_bounds $hi:tt:$lo:tt $field:ident as bool) => {
         #[allow(clippy::eq_op)]
         const _: () = {
-            kernel::build_assert!(
+            ::kernel::build_assert!(
                 $hi == $lo,
                 concat!("boolean field `", stringify!($field), "` covers more than one bit")
             );
@@ -172,7 +172,7 @@ impl $name {
     (@check_field_bounds $hi:tt:$lo:tt $field:ident as $type:tt) => {
         #[allow(clippy::eq_op)]
         const _: () = {
-            kernel::build_assert!(
+            ::kernel::build_assert!(
                 $hi >= $lo,
                 concat!("field `", stringify!($field), "`'s MSB is smaller than its LSB")
             );
@@ -234,7 +234,7 @@ impl $name {
         @leaf_accessor $name:ident $hi:tt:$lo:tt $field:ident as $type:ty
             { $process:expr } $to_type:ty => $res_type:ty $(, $comment:literal)?;
     ) => {
-        kernel::macros::paste!(
+        ::kernel::macros::paste!(
         const [<$field:upper>]: ::core::ops::RangeInclusive<u8> = $lo..=$hi;
         const [<$field:upper _MASK>]: u32 = ((((1 << $hi) - 1) << 1) + 1) - ((1 << $lo) - 1);
         const [<$field:upper _SHIFT>]: u32 = Self::[<$field:upper _MASK>].trailing_zeros();
@@ -246,7 +246,7 @@ impl $name {
         )?
         #[inline]
         pub(crate) fn $field(self) -> $res_type {
-            kernel::macros::paste!(
+            ::kernel::macros::paste!(
             const MASK: u32 = $name::[<$field:upper _MASK>];
             const SHIFT: u32 = $name::[<$field:upper _SHIFT>];
             );
@@ -255,7 +255,7 @@ pub(crate) fn $field(self) -> $res_type {
             $process(field)
         }
 
-        kernel::macros::paste!(
+        ::kernel::macros::paste!(
         $(
         #[doc="Sets the value of this field:"]
         #[doc=$comment]

-- 
2.49.0


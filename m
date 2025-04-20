Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F14DA947B5
	for <lists+dri-devel@lfdr.de>; Sun, 20 Apr 2025 14:20:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9249810E30A;
	Sun, 20 Apr 2025 12:20:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="nHLfh5/f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061.outbound.protection.outlook.com [40.107.244.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1B0110E2A5;
 Sun, 20 Apr 2025 12:20:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UlV8XTo1zYUNdIACISHaooDdqNK+6QW4kLMAViynp86PeYZpsLIX5jEn+JqLFvGt+nwDAL8A+/zKkBGpk9v/8mRj8yLXIAUAuFWs1axp5ao5nle0jdw/OsrSFPaOiV/veYf6bnpoVw52srTtwW3kK+liSGe8pKW0k29fv6V4SwMG0JiSu1ra1WA4zNsO8CmPhw7SCdqOabp01Yq1l47WrvdY+9vtxnrU91jSDlFLx2I3LB/WJimNEcK2b/jHoBmTn/nMP0IEeiyKUZHFRTITV2uk8Pvz++n/BEGd8I8F6PiNevLsnK9rF8eXiw0/YNCF5i21OUbuwDEd5TrQ3ZujFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qovyLVakz2CRcqHQ8fcZbF18vsp+TY6C89yXoIfi5go=;
 b=Xj7h1GzQxe/4mmn/wtKLKk3wSUubkBlBt1BbmodRueKF0su75v4WyoUmA34CVJObfjMRTu7FpXgsd875upby65Xurpel5bcVzHwsvdyxVdEWPcgGabwzx0IbdZ/R1jiiDIrnXC2dqVk5lAfIHu5Qp9pVrMMOO8TZqbAsLEzmdA4TbCtEOTk4PtS0ENHV46QTfOwpfp39Dl9dRHGjNJUiKBjekONeuQArtfS6WtfmjRXtIK7t55cgDbnn0HMiFCRygGHabHnnMFx0/O6ZhNqk6NAU5mPJJ7qwa31Jp4pLf/IKSHpNWS8bfPzcF0xN8158sj2V0E9suBTLTq3CpBCntw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qovyLVakz2CRcqHQ8fcZbF18vsp+TY6C89yXoIfi5go=;
 b=nHLfh5/fSgyK7HnMocu1xpzHx+Lwzh8v5lpEWt6Ex3+Zh4OUlPiGrVNe0O8tHGe8oYyvg1yaK/FIULvSU0RPk9L/FHjqI0xm+44F6HEexnETCwtPpaXpsxd9lvpVT62E45txhBcdMbFbhU1N4xusQky/YocrhVptw6fXyS7Lm3taenKm/Nifd+oOuMpStZV14tHUiwtleSv5l0J8ZusvwudVw3ocpGIPAtRZAOesexf6MwEQ2woYXp/mZrjARdcMiK8Z7sGENWgUb1XM65l5lQziCOwYguHI2i1x6ausY/TeC+287rcghbCLMLfOxLeZM/Q0ZNgS6/lwvJcA6+hqkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB9175.namprd12.prod.outlook.com (2603:10b6:510:2e6::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.33; Sun, 20 Apr
 2025 12:20:17 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8655.025; Sun, 20 Apr 2025
 12:20:17 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sun, 20 Apr 2025 21:19:40 +0900
Subject: [PATCH 08/16] gpu: nova-core: wait for GFW_BOOT completion
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250420-nova-frts-v1-8-ecd1cca23963@nvidia.com>
References: <20250420-nova-frts-v1-0-ecd1cca23963@nvidia.com>
In-Reply-To: <20250420-nova-frts-v1-0-ecd1cca23963@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0304.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB9175:EE_
X-MS-Office365-Filtering-Correlation-Id: bdd25f2e-6452-4494-0ffb-08dd8005b60e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|10070799003|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SDNSeUNScTZiTHZFR0lJOHp2QVFDS1BIQlZHWmYrcTlsamV0K3Fnbmc1QnBr?=
 =?utf-8?B?ZklMTURza21TbUlzS3dSVDlsRlQ3SFRZZjBBdDNiZ29ZN0pwL3dITHZwZlJw?=
 =?utf-8?B?YUhyWm5haE11U1E4bzJ1UFlCYWdYTTVwTGNwUldFNTdDMGZxemVqTTk3ZDlP?=
 =?utf-8?B?aXpSMUw3eDAzTDhaTjdhdGVvZkZCTXVWTk9KRkRIRmtLeGRHTldnSXpDNmkr?=
 =?utf-8?B?VlpQMzdNbGRXaUJGVE5tbURiTXZtSGR3WFhtL3dOeDlpYmhIemh5WVBJek1w?=
 =?utf-8?B?anJJRHorSDNTSEUreHJEZWJHZVZLSFFVWng0ZXJDNDNIMHBFeFlQT1NhOWhv?=
 =?utf-8?B?OWJ0eHlSN0p3Tk55eGllL2tPWDRwczZnQkZBcE5MdExucWNlSU9qZEJ0ZEQz?=
 =?utf-8?B?WElISTd1MVBYZHVZTG84LzdDN0tDaVgzaGtRYlNwRnZnMFd3Qnl0blFzWGJj?=
 =?utf-8?B?amVVQkw3QVF6bTZHdjFEUHlacXh4VG1TSjdmUm9BVW9ZdWVibmFRdkJNQkg5?=
 =?utf-8?B?cER2OGFQVjErYThvN2c3NVlGcEFwMldiWG5uOEwzMVo4dUN5U25hUEtWaFY4?=
 =?utf-8?B?ZVhyYk1lL1UzRktxZk9ObjhWTkVIN3BPajl4Z1ZHc0RwUDZGUW1Tb0hoUFIy?=
 =?utf-8?B?aDEvRTA5YVVrTzVhUTYzK0o5WXFlZ0FPVjJMT2pSNnpvVEZJanBBVEhibFZr?=
 =?utf-8?B?dEdkbk00Z1BqdERMVmdONXdtUnVyU1R0MTZEK0UwdmZtcDlYUFdyRXdFN0lu?=
 =?utf-8?B?a3ViWEw2U2x5YXBVMEx3MUt6OTFJcVhZT2lwUEN5ZnpEZ3FGckxjWDlNMWwr?=
 =?utf-8?B?b0lUMlB1aGRWMXl0TXJqcERieFB0d3hmRXpxK0VLYWJ6WHJPTU13ZXIxTWM2?=
 =?utf-8?B?QkhCWTZHUldrRzZzOExYeklxd3Mxd2ZjSjhDelNWMEo3Mm5FYzg0UUxxV1Br?=
 =?utf-8?B?TWxPcnkrVHhGcDZFeVFjeTU3ZXU5OVgxSGUxZjM5UXRnQkJHaFFsZXhzNHVR?=
 =?utf-8?B?YXRyNWRNeGczWFE2OGx5VXNrc29uVVgvSkdrazJDdVNXVGNVRFlYaWcxelJu?=
 =?utf-8?B?SXlqaUVUcHRGOGR0RHpDMHB3WXVybTVBcEt1U0d1eFFsMWJrTklQNzd5L2JY?=
 =?utf-8?B?RFlyd3JkcHczY0x4NUZJZ01UK0cxaVljV1NIeVJ5MEFqUzFOdCtsNXl5d3Qz?=
 =?utf-8?B?TEx4aWhTQlJuNmZUamVFRTlzeDZCTU9uMU1BNFJnUVRPY2pZS2NsQW9ENjQ3?=
 =?utf-8?B?VFR6V08zWnZmUEFjU2NxdEtuNncyRzFqVlZyYTVtaGgrVkFvVU85NXRYTTln?=
 =?utf-8?B?QU1UREN0ZEt1NkozNTI0alpSUXIwL1dFSzJWOTVMR1B3T0R1T3RmY09EM3dP?=
 =?utf-8?B?Umd6SEdlNmtvdm9jdG9lc1ErZkhrNit1NWJxaEk3OW1tcGJnYTZyR0cxNFoy?=
 =?utf-8?B?NjV1RGplWUJnNXNPNEpWc1dzblNRVXFSWS9sRWR5YkhidmMwZGR1M3pQcTI1?=
 =?utf-8?B?STBPbzl0WDZaaUFRWHVwbGJMTjNmeWRPUUlkS2tob2lyQ3lhaG9WaHBNdGlx?=
 =?utf-8?B?VUFwbjhJaWxCUlY1SXBYNWdtY2tMa0piK3QybEdKTC9uNGJPem9LT1ZoVmhM?=
 =?utf-8?B?SnN6eVp1MjB4VURxaVFXNURLSnB2cWZMQ1ZKNmRWaTg5UWdsMnEyeG4zaDZW?=
 =?utf-8?B?WW5UaDUycG5ZWnc2UHZzMG41WDdRdmh4dlZFc0pqRHNNM01UcUZkUmVkei8w?=
 =?utf-8?B?ZlFzVUtycVJwT0Eza2R2dWxCSlVGdmtob2h3bk1YaUZUTHdZdTZhZzBJcktk?=
 =?utf-8?B?amV6MU1lVzdxdEZRTTZXeFFIUmlUSVVqUjZ0RTlZbCtzVFVNUG9xSHZ2Y3Q1?=
 =?utf-8?B?b1VlUHU0Q0xqTTA4Z2NIRVE0MUk2WlMzVWxLcVA3Zk53dUVrSjNpeHBBaGRD?=
 =?utf-8?B?dThsRUNjZFZ6cjZDK1A0VkFXWk5BUDE5SkZHaGVzZnVmVW9oeWQwWDBwcHh0?=
 =?utf-8?B?R1RaekpYaUdBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(10070799003)(1800799024)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ulh3TWdjQWJhK0NLVU50U2ZHZW1LaDV2bjZ3VVczK0lMY2piVEZBMW9abGoy?=
 =?utf-8?B?WTQ0S1NGVTdyVDZzZUVERzVncXZHTWUyb0gxM2p0Q1YzMkVVcGZUbHB3aVQ2?=
 =?utf-8?B?ZnhwNnlrWHcrMHg2MlNpNnQycWZHb3l1bys2SERMc0NzZXlHQjMrc3RuOUpT?=
 =?utf-8?B?cGtNeTExRTZnVWoxdUZ1WVR2cGtidmZwOGN6UVN1eC9JZWdzWnh0eThWSVpF?=
 =?utf-8?B?TVFjSyt4WlpXd0lQZnBFLzBHWXBNNG83NFNVMGhyQVB4bExwcXpQZzQycXM1?=
 =?utf-8?B?dmVkUmRiMUg4WWRBNE11Mk5xT0UzWkh2cWRCS1F1enVVR0Y4SzRDUE1aQzF3?=
 =?utf-8?B?YWtpTTByZ3F4L1pFQTYrbXhYZ2lBd1NvYzdLRnN5RUUvaEVPV0hvWHRyVUcx?=
 =?utf-8?B?MjVndWlrSFJWMUMyV2VzNnVUWGJwZDNpWmQvdWd0SXBLNDR5eEttVUNhd2ds?=
 =?utf-8?B?bFJvOWRqQVRPM21JMmhWdkdDUTVFUDRRWS9VT0VFcjdhSXJhS0FhU2F0MDVM?=
 =?utf-8?B?RmRyaTVEWjlIOEVxc2dNWFc5Ry9wekdUYkpWOGlxQ3FxSU90Q0ZDTFBIWHho?=
 =?utf-8?B?MkpSMm14VDNLOUhKbTN5aWJnTFc2U1pQOWNyK0VXOTduTlpleGZVelN6dS9F?=
 =?utf-8?B?NXB0eHFOS2ltY1ZiWGZtaWZIVnlkU0JGK1NDOGlDK2FwQVgxN2xNZzdpQjF1?=
 =?utf-8?B?SHBNS2NvVDBnUlNKU1RYNHZPbFRsdEhtU2VqUS8wYXdlYXluZ0tJUWJDcXM0?=
 =?utf-8?B?SWhTL0FHRVNIaUpuUGQ2ZU1mVVdqaXp3UDVKYSt1YmEwbHFTeFFITEVRYkJk?=
 =?utf-8?B?MTdSRHUzRjhXSk5xc2c2SnZvODNCMnBhZHBGczBXTGUzTlVlNE5qdFpsYlRC?=
 =?utf-8?B?emxJUks3NTBKWEsvNTdjZ201MW1paVlUSWtXdWFneEZmNjRZTVhpMHBSa1o1?=
 =?utf-8?B?MW95ZDgrQmV3THNGUGw0VHJaUWJDNThNTTZhTlMzQTVUcGdsOVVMZXFjbWt4?=
 =?utf-8?B?LzJEZE9CMHl5bHl5cXVjQzlnbER3ZFFvenZqQXY4cGVmMld4eVNEcndsYWQ1?=
 =?utf-8?B?Y1FBVEJId0dJd2psUWxHclNzdWI2aXNOQW13eklhOWd5WWFuT3NkZExnRXZu?=
 =?utf-8?B?VnJEcEhseG5kU0ZSd3N1QTUxb1RUQlRJOFFDK09zWndVMzQzT2UyYTdWVjhH?=
 =?utf-8?B?SXh5UEgwQmo1MGRBaTRsdEZ2ZHNXd2t4T2YrT3F4NEo0aDF6T0RyYjVXSk85?=
 =?utf-8?B?NmtjWnd4V2tibGhFbmlLNnhsZFNGenI3V0Y1anNSQlVJby83L3hWR01xcWgy?=
 =?utf-8?B?THk0N0hqYWVvaTNXSDl1Q1A2UDVicmlWR2crTWtDSmJXNm95eGtZV0RPNUNm?=
 =?utf-8?B?cG1CTW1YL1VKakJLUytjMmZpN1lxWFFoWlhwUENBWU0yTElLMlRVc24rWEU0?=
 =?utf-8?B?K21Cczhqc3pzYUcyZHdXYVhrUFhuSjlqK1lha1dLbXNKRWtqYWJ4dW9GNjV0?=
 =?utf-8?B?VHlaSkI1RnlkSGN5a2dUbWZxd0FTaTZyWk4rVVlycFBuaHJ1REtjWk5jdjJK?=
 =?utf-8?B?bUR6U3FuY1FCN1p2VEt2K2U4N2h5TGlTbzhxVWljS08wQnBkL1lDcWE1Z0t2?=
 =?utf-8?B?NGJkTHQzNllHQjhmTTgrTm9ObkU0WGJpKy9TRFEybDBXZFhKd2RRbmlMczlm?=
 =?utf-8?B?aHhLZTR3aVlFOTRTRzJQa2VZN1VncEZUQTdWNTZXWmJJeDBTanZxbzIweVdP?=
 =?utf-8?B?L24zSk5QYS9KRHFBR3JGMngyNTcxdmxueGNIUVg4REhhallZYzNwaFlUOFEw?=
 =?utf-8?B?dVpBQUZZS2x1UmNQNWxZTDJJcTRSaWJ3TzU5NSthTmViNm4vWS9zNldhTGds?=
 =?utf-8?B?SmRNazYvL1l5S25YdWJjUjBab21wZytVK25EWnlRQ1ljY1FXOXVBSGFvMkhQ?=
 =?utf-8?B?YkxpbHUvYzF3UkRnU1oxeHFBZ2FkNkJpblY4azQwQ0crZ2ErZnhmN2kwYkxL?=
 =?utf-8?B?WDF1ZGgyeVZWUkFVeWdqdDE5aDNzVGR2ZmFKQkVZZ3k3Z2xCWFJ4dG1LZ1JV?=
 =?utf-8?B?dUE4eFpyUDZQQTNIMUt5bVhiQ2VPTEorTjN0Wi84cHdnS2M1RWduZWFTV2Y1?=
 =?utf-8?B?ZjJjZGY3R01JdTczUkpGblQ3NFV3aDVZRTlJRFVqWFRtM1VoZ05lbVlPNTJQ?=
 =?utf-8?Q?CorU1EVZiz2BrvEo5QAw2dqkVbC7kz5Qn0n9QvmHSFWB?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdd25f2e-6452-4494-0ffb-08dd8005b60e
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2025 12:20:17.5219 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jcxnsq2XRIaM7amYSq+D8Cx3nfgGr7pptM0vmr9EGsQqg8IIg7YjUx/4SlUS02he6EbZZrUDhXYI+U23dXzICA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9175
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

Upon reset, the GPU executes the GFW_BOOT firmware in order to
initialize its base parameters such as clocks. The driver must ensure
that this step is completed before using the hardware.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/devinit.rs   | 40 ++++++++++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/driver.rs    |  2 +-
 drivers/gpu/nova-core/gpu.rs       |  5 +++++
 drivers/gpu/nova-core/nova_core.rs |  1 +
 drivers/gpu/nova-core/regs.rs      | 11 +++++++++++
 5 files changed, 58 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/devinit.rs b/drivers/gpu/nova-core/devinit.rs
new file mode 100644
index 0000000000000000000000000000000000000000..ee5685aff845aa97d6b0fbe9528df9a7ba274b2c
--- /dev/null
+++ b/drivers/gpu/nova-core/devinit.rs
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Methods for device initialization.
+
+use kernel::bindings;
+use kernel::devres::Devres;
+use kernel::prelude::*;
+
+use crate::driver::Bar0;
+use crate::regs;
+
+/// Wait for devinit FW completion.
+///
+/// Upon reset, the GPU runs some firmware code to setup its core parameters. Most of the GPU is
+/// considered unusable until this step is completed, so it must be waited on very early during
+/// driver initialization.
+pub(crate) fn wait_gfw_boot_completion(bar: &Devres<Bar0>) -> Result<()> {
+    let mut timeout = 2000;
+
+    loop {
+        let gfw_booted = with_bar!(
+            bar,
+            |b| regs::Pgc6AonSecureScratchGroup05PrivLevelMask::read(b)
+                .read_protection_level0_enabled()
+                && (regs::Pgc6AonSecureScratchGroup05::read(b).value() & 0xff) == 0xff
+        )?;
+
+        if gfw_booted {
+            return Ok(());
+        }
+
+        if timeout == 0 {
+            return Err(ETIMEDOUT);
+        }
+        timeout -= 1;
+
+        // SAFETY: msleep should be safe to call with any parameter.
+        unsafe { bindings::msleep(2) };
+    }
+}
diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index a08fb6599267a960f0e07b6efd0e3b6cdc296aa4..752ba4b0fcfe8d835d366570bb2f807840a196da 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -10,7 +10,7 @@ pub(crate) struct NovaCore {
     pub(crate) gpu: Gpu,
 }
 
-const BAR0_SIZE: usize = 8;
+const BAR0_SIZE: usize = 0x1000000;
 pub(crate) type Bar0 = pci::Bar<BAR0_SIZE>;
 
 kernel::pci_device_table!(
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 866c5992b9eb27735975bb4948e522bc01fadaa2..1f7799692a0ab042f2540e01414f5ca347ae9ecc 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -2,6 +2,7 @@
 
 use kernel::{device, devres::Devres, error::code::*, pci, prelude::*};
 
+use crate::devinit;
 use crate::driver::Bar0;
 use crate::firmware::Firmware;
 use crate::regs;
@@ -168,6 +169,10 @@ pub(crate) fn new(
             spec.revision
         );
 
+        // We must wait for GFW_BOOT completion before doing any significant setup on the GPU.
+        devinit::wait_gfw_boot_completion(&bar)
+            .inspect_err(|_| pr_err!("GFW boot did not complete"))?;
+
         Ok(pin_init!(Self { spec, bar, fw }))
     }
 }
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index 0eecd612e34efc046dad852e6239de6ffa5fdd62..878161e060f54da7738c656f6098936a62dcaa93 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -20,6 +20,7 @@ macro_rules! with_bar {
     }
 }
 
+mod devinit;
 mod driver;
 mod firmware;
 mod gpu;
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index e315a3011660df7f18c0a3e0582b5845545b36e2..fd7096f0ddd4af90114dd1119d9715d2cd3aa2ac 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -13,3 +13,14 @@
     7:4     major_rev => as u8, "major revision of the chip";
     28:20   chipset => try_into Chipset, "chipset model"
 );
+
+/* GC6 */
+
+register!(Pgc6AonSecureScratchGroup05PrivLevelMask@0x00118128;
+    0:0     read_protection_level0_enabled => as_bit bool
+);
+
+/* TODO: This is an array of registers. */
+register!(Pgc6AonSecureScratchGroup05@0x00118234;
+    31:0    value => as u32
+);

-- 
2.49.0


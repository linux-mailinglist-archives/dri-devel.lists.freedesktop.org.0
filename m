Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21AEDA31DA9
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 05:59:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 146F610E79F;
	Wed, 12 Feb 2025 04:59:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="n2/cJ0XH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2043.outbound.protection.outlook.com [40.107.243.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05CA510E247;
 Wed, 12 Feb 2025 04:59:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nxKXWUe4kjoAU2OOKiTgU85sPt3ZQTrOCUoXG6HTU/xJ7rFDacSJ1OvrjqFtzPPqGzDMmzkDpBK6iDTlvpakNkab8NftS3J3WzRR0Sq+uk0agsFl2MQouRFby8DEBBfsQ1QndqnAn7e9bmFmJniAlligh03wTvSpr6ofXYCBoecEJBmJkkEL3zHgRy3+MZucQtF04jvi5iWL8rzPB3HlrMQ1jZI6f1lsg7X37e5uHtJd8bYXNELpHq613rrcs4KYKvA31EZafWtTuCqLZvuDRoD0Pq/8Qv83UaedETtersIWfYYvyu9Aq4yZo9xM4lWHhmYuJMM9LR87EASssXvfkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3/JJ1na1ybgZl4Y+e3ow46iPK8hEeNf77yeGikU+rmU=;
 b=YISwjNWXaF2MjqFEwZKUpiigovXsxVyogtJUDK+08GNlA/TGYCYqMiCtFu64wvo2kuXQqXhumWbAr0I5AjV1i8FV1JChyZhmGgFhO+kht/6ThrnAcXawxuBBObTfqzP3sSNFvp/PudQbZEFGJfFHBGxttZqKU8yt9xaqO4UFXH2EqlrKAJAk7ALBvDZwD8b6NPs0ArHWq3TPM2E/oJmhWaEXKEuuY8kko/kEwA93J+izSxOoFP721JURYJGsLbaGlL5OX16aHFSEQ2SuLiyU6yHJ0e419IPyMv7oLO3FBclZywTfcf6Snw4DwbTGwIytpWN2sqZ9xrK3d6lNsg1y5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3/JJ1na1ybgZl4Y+e3ow46iPK8hEeNf77yeGikU+rmU=;
 b=n2/cJ0XHFzXPP74sAuub87D7Ue/YTkciolV1sfMgfdf6LBiffwVHnYgslciSSzjGqUDR+rIAUJ3RVSwcI4ed+xYaEtc2iRKKUTuUk4BJDygT8kSvfTyO04m6vFXonbPGI8M39NLBKl6s64Lfdr2O1uckY9k+3cHz/sI3dsC7Eu8se2mk1wtuP5eAuqodb9TFL07vfWsTvQuwtK3vpjv/NSTV1VP9SYCUA0giFjH7tFI7prvCMVZpe+/9GJRiXWTk3+2TGrJSjEQFe7KhHBc6IIFfikY9dFhXRe1XA+0ZRmK7VDXehh04+5UQHOeGklfYnea1UICPY7a7Fwx02LKDdw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH2PR12MB4088.namprd12.prod.outlook.com (2603:10b6:610:a5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.11; Wed, 12 Feb
 2025 04:59:11 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8422.015; Wed, 12 Feb 2025
 04:59:11 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 12 Feb 2025 13:59:01 +0900
Message-Id: <D7Q79WJZSFEK.R9BX1V85SV1Z@nvidia.com>
Cc: <ojeda@kernel.org>, <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <benno.lossin@proton.me>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <dri-devel@lists.freedesktop.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, "Nouveau"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v3 1/2] gpu: nova-core: add initial driver stub
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <corbet@lwn.net>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <ajanulgu@redhat.com>,
 <lyude@redhat.com>, <pstanner@redhat.com>, <zhiw@nvidia.com>,
 <cjia@nvidia.com>, <jhubbard@nvidia.com>, <bskeggs@nvidia.com>,
 <acurrid@nvidia.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250209173048.17398-1-dakr@kernel.org>
In-Reply-To: <20250209173048.17398-1-dakr@kernel.org>
X-ClientProxiedBy: TYCP286CA0342.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH2PR12MB4088:EE_
X-MS-Office365-Filtering-Correlation-Id: df854d35-f506-4bb3-692d-08dd4b21fcfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|10070799003|366016|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UHFkVk1yaStEZFNKbEE1WmNGdExZQko2cVdBNUpEOFJaUFVaZjd4dko0eE5O?=
 =?utf-8?B?VFdmTzRkYjlEUGhVLzBqSGdMckRrTm1wOUs3TlRFc1kwYU8rM0VGNm9BanQ5?=
 =?utf-8?B?WEZ4YTRQanRlaDIzUVRlTEdZTU1pTzB1N05xTUhkUi96SXk0dzF2NGozcWVY?=
 =?utf-8?B?MWR0R1BxajR5cFZnQ3h6RGFGeUZ4MlpJU0wrbWVRbnNqdzRSL1lvSVEra1VS?=
 =?utf-8?B?S3lhWmpuSStrbWN6QjJoSm5aNElNL2ErTiszQmtHZS9TZEIzV1pyUnVLNVYv?=
 =?utf-8?B?YmhQVXlEU1MzTVF4VUlwdkJzQk1vWWlZRWloVlJYMUhwUnhDZC9xTk9iSFIx?=
 =?utf-8?B?d1J4SWJ4bDcwZk03RmV4YzQzM09zSFlPblR5enVZaWNKbFhmYi9yNkt1YThW?=
 =?utf-8?B?MFdHS3A1UEliZllJR094MTZwclYwU05iRG4zcXRVSnVlbHdwRzVxR0dLYzcx?=
 =?utf-8?B?aGxQSTV1WXEwTFNYWkVpVXE1RnlJWGNBYlhZK1dxbHRnUElNQ2RDb1hiZmlk?=
 =?utf-8?B?YmMwNFRPbkR1WFdVYkJILzZBSGNnVjMxaHZYRnZZWWFzMHlpRlZkS2ZLa0F1?=
 =?utf-8?B?dWlkbkFtUnIwb1VZcVlSSHBxbTYxTGtwV1ZpalZmbThVLzA3WHpVUldmcXJa?=
 =?utf-8?B?eWVzOEp0UGFMazgrUlpHUmtpVEFrK3FqaGZZZHRibkZnNWVVWFRIQUFra1Rv?=
 =?utf-8?B?RjVSQlc3RThMTkJtK0k1UFFZT056QjJCaXl1bE5hSXk0UnlpUkRaL2Jzc0l2?=
 =?utf-8?B?NWRLSVF0d3NkbHpYRk1aRHR0dWI3bTFlWHlVTFNWTlpackRjUldHajFmWDlt?=
 =?utf-8?B?T0RnYVJGNHVTZXhSSjFmWTV2Q3hGVGRyY0xHTlRJNjQxNmY5dXRZQlFEczZm?=
 =?utf-8?B?SEY4SDRpeThvL1U2OTMwOUhmQkRoUDRJRTc3KzZ1dUNIVUs4MkZ4eHc5ZHpS?=
 =?utf-8?B?bnh1MHNMVkFCdnVNbzR0UzM2d3RKNHU5aXpJdWpZYXpXZjcwWktVVENZTmdi?=
 =?utf-8?B?L1BML0RRc28xd3l6V0Z1NzY4Y0phQnZKaCtWMjdxSHpzRHVNbTdiREtFcVE3?=
 =?utf-8?B?K2xta0ZCVDJzQklFeE1ERzNORTh1TlAzaXlIMXZuZm1FM21FdTcrMjRnZEJV?=
 =?utf-8?B?S3ZGdlJVakZxZ3lVTURja0lpZEwvUE5QcVpXV3NNd0tSSDluSVBpbW5uUDNV?=
 =?utf-8?B?MVZhZFJMVTNJM3lUNTJqYUVOYklOZW01WkM4eWJBVWhOeDgxYXMwbEM0OGJp?=
 =?utf-8?B?dVlvSG5NMFZQSEUxNUE4NHhVZ0ZJbVpHWnhMaFFrd3lDR3NGdnMwWU5mb3I1?=
 =?utf-8?B?TGFySCtrUS9tZm1YZGJJZFFWcWZLK1lIcDFWdmVzYWtQT3VmSmt2U0lmdGNr?=
 =?utf-8?B?RVJhNXVaczM5RSswUkxhMm81ZUxtMDJkeVB3Sk5TYitTUVJCWC9mOTJWYnlH?=
 =?utf-8?B?SHlsclJkb2lTWUVwY3FZdWVxS08xd1N3M1JEM1hnZ0ZSZkJIVnVicjdYVmdG?=
 =?utf-8?B?ZkNZMW8wL2YxUXBNSmxKaVRiK05sTTFRM1FnblNiNTBjcDJCb0x3cWw1THBH?=
 =?utf-8?B?NThkVS9aRkRHVXVFajJTaUJIeWx3YTFncDJrdmlCYzdNSUlVMHdQS1NZRFFh?=
 =?utf-8?B?VE1pbzVLUE1pTWFBblEwWStieFlmenM0dXUwaFZlQ0RuZGpNMEwrZ0RaUFV4?=
 =?utf-8?B?Q2dXZ200aG1xMUxBcVZlaTM5cXdTWUZIME5aTjFDQ1puLy9zQ2VoZnkzYlRX?=
 =?utf-8?B?ZGszY3o3ZWkyRXdEL1NTbkNkU05JdVY2VGV1NEtpamVIaitQcURlVHN1M2Z3?=
 =?utf-8?B?SkwwNzZVM3RTdzlCZTVrUzBmWGY5aEQ0VnJQQ2RqQlVvbUpieG92MExlZDVn?=
 =?utf-8?B?S2ZmaHRDS1JsaTBlQ05kcWZhdnNVeG5selQ0ckJBY2h0dlYySkM2Tnd2dUJU?=
 =?utf-8?Q?qDOHgQ77dYg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(10070799003)(366016)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YkJDUzk0TkJseER0bkFhVW5TcGNwN012YzRiNkkyOHVkQXJmbmNyS3drQVZ2?=
 =?utf-8?B?ZGtPbVpoVnlKQWNXenVnOUVEbkwvL2xiRnYvL3FuSU9CQ29hL3FWV0JQTkdU?=
 =?utf-8?B?aGlRWmJtanViOUVCMVBjM3lsd2VZVWtycUJDeDM5bE1CUlU3azZmZFNXYnpC?=
 =?utf-8?B?MW9tWWFYMUJ5NTY4eUFiSlI1UGpXaEJTWGJWWWF2UzdmK2lTcGVjc3Z2T1VW?=
 =?utf-8?B?WVZyZktORkdhZXZhc3J2SDdPZWp1YnhONW1uV0NXdEtaNFRIVkxsWEh3SUFS?=
 =?utf-8?B?MExlWU5remVqNE5EMUdpWUJHYmtWeVdmTjlRMWEyZ0lwblRWdHBEaUhDVEVF?=
 =?utf-8?B?bFgzUkRidWJTZkhUOUUrY0k4U3ZVZEVFa3VlZk9laHBPN0FCTDY0clFobzZp?=
 =?utf-8?B?dE1NTjZ5ZHUxeGQ2TEV3ZFF6LzVMUCt1dzgyTHJDc1ZseUNBclFyRy9zS3lo?=
 =?utf-8?B?VEZJUGxFTVlMZnUxelRZM1VNOGwydUZSMEhZYU5SWnk4WEloMlYrQlJMOEtD?=
 =?utf-8?B?RjhUZW1YdEthd3A1dUVmVVI2T2pIa0pUVkpDWmFkSGEwQkRVOUF3am1VaFg5?=
 =?utf-8?B?TkM4cjhxVG1pMDFKcE9tTlNWYURKVjJEWmlSazduRlFnZGdXQjhuT0pLS2hq?=
 =?utf-8?B?MlJBQTU0SEZOWTdycnNPeHR1OW11cTBDM1JkdWZGSDJFY1FFRXA0aHlaeGcx?=
 =?utf-8?B?ODlmUzVZVHllUlEyRUpZcTJ0THlnK2xzNDFiSzJTaG16anVWbllZbi9XcVV4?=
 =?utf-8?B?aWNUOHJRWmdTSGJSdC95Zi9vMVI0OUwzUG5PY2QvejlhaHBWZkhEYW1UcENI?=
 =?utf-8?B?d2laKzFlM0o1UC8zSkNYL3JmNFlvY09FeE9oRytEZFRUVTlTK0JwZW8zamk3?=
 =?utf-8?B?Ujc5V3JKVTJrYjhTT1FOU0NUT21udXFPTzVoaWdBeXZpUGprbGQzSm02bzgw?=
 =?utf-8?B?cklxdE14Nm51Uy9vUGk4YWg5SWJ0dEZtV21ELzJlSUV3aTYxa0svaHpSN2py?=
 =?utf-8?B?TGpzRlRRMU0yRzdBaWZEOTg5V25FZkd4RzlXQlM5MHNNSEI5KzdSaVVmQ2dk?=
 =?utf-8?B?Q2lMcHNvVS9jSk9Ec2VtZ1dSaWlwelk3YkI0NVpuQVNCcTNMcHRDTS9TUjRi?=
 =?utf-8?B?TnhITGFOa0lXbGZETDZxb1F5TTNnM1pMamxQS0pNNnUwand4elB0NlZ0R1cw?=
 =?utf-8?B?Z2tFVVhLbTF5aER3RjlRZStnaUFhb3NaQkc3cTgvYXZPaEcwUDFZZHV5eCs0?=
 =?utf-8?B?ZHdpVTJVeXZRT05ZaHNXbGRhMTViWVRUNmd1UVJpZ3hEMzZ2cEk2ckRkbGJU?=
 =?utf-8?B?ZThQdzdSTklYVExuOGZYSW1BTWs5OEdIZU80VHhGMzl0T1hFRTU1b2YyRnVo?=
 =?utf-8?B?RFRTTzJuZktNbHlob0NPbW9Xck5mSDZMUVk3VVZUTnRnT3BrV2c1V3dPREha?=
 =?utf-8?B?SXRIMWVzNHlVeHVuTXI2WnRBL0d4Q0hzb0FTN29DNFNLZHVmcWJFQVp2UWx6?=
 =?utf-8?B?VUgva3JBaXRJMGFuSzF1a1pIcHB5WmFtL2dBdXBWd3V3V1JMMGhXZ2NPRGtC?=
 =?utf-8?B?QVNhNysvdTdoQjZKYXNDSGVOWWNxZC9LTlVtSm1ndG9DODZtUlRVVWJ4aEZj?=
 =?utf-8?B?WkZNc1RZaTVNZktadk9GaHVZcVpCTjVaM0VCc1dicHdOREJJaDBnR0loRnQz?=
 =?utf-8?B?VGRNNzNGalkrYlBrUkxNUkZsL2VKa05nc3o1TFYwYWZEdWV6bjJQSDYzM2I4?=
 =?utf-8?B?NnNDTkRDR2xXdVJzMEk4TWxkeTFKbzZiMERaZjBsTzlYQVVDRmozNnNRVVFC?=
 =?utf-8?B?Z1ZjaDBzUkpsYXhuUWJGcEl5Qmlra0djNlZ3SHMybVpjUGZlUjBUNzlPTWNu?=
 =?utf-8?B?N3QzOGVPNEh2T1BpR0ZGZ0ZSclFjaWVQUHUzZlRmNDZyczZ0ZjN5V0d4Nytw?=
 =?utf-8?B?K2VNaExCZVpKVit6cVE4Tkt5SGZPSXhzN3ptM1RuNnVBMThDSloyRXdmelEx?=
 =?utf-8?B?WHdTYUxuWHVsMXQzN0duemQ1OHRmMkxWZ3JaLzJtSXhKNmpUNkkzT0Y3U3JC?=
 =?utf-8?B?R1VsUzRCRXFqYzhPbXpqRTc1dGRsWVlwVk9ud2JjMUFZaXNrdG1BQTNFWUFV?=
 =?utf-8?B?ZnVMQ0RzUzYzaDc1SXpFU2VIUlMvWDBlV2hXUGlROUl5UWRFZTQ5NHVFa2ND?=
 =?utf-8?Q?C/VDJhSFMqIDznQucUyVR1KfisF9vcPk3pPhr1FWb52r?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df854d35-f506-4bb3-692d-08dd4b21fcfa
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 04:59:11.0620 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7B2EPQeQJXs0faDwJMJF6bVbZ0F09UqKPw0rjddri5QwlqG0kzKRQE/3E9amae15ytTi6IryV4rpcjSJGseZKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4088
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

On Mon Feb 10, 2025 at 2:30 AM JST, Danilo Krummrich wrote:
> Add the initial nova-core driver stub.
>
> nova-core is intended to serve as a common base for nova-drm (the
> corresponding DRM driver) and the vGPU manager VFIO driver, serving as a
> hard- and firmware abstraction layer for GSP-based NVIDIA GPUs.
>
> The Nova project, including nova-core and nova-drm, in the long term,
> is intended to serve as the successor of Nouveau for all GSP-based GPUs.
>
> The motivation for both, starting a successor project for Nouveau and
> doing so using the Rust programming language, is documented in detail
> through a previous post on the mailing list [1], an LWN article [2] and a
> talk from LPC '24.
>
> In order to avoid the chicken and egg problem to require a user to
> upstream Rust abstractions, but at the same time require the Rust
> abstractions to implement the driver, nova-core kicks off as a driver
> stub and is subsequently developed upstream.
>
> Link: https://lore.kernel.org/dri-devel/Zfsj0_tb-0-tNrJy@cassiopeiae/T/#u=
 [1]
> Link: https://lwn.net/Articles/990736/ [2]
> Link: https://youtu.be/3Igmx28B3BQ?si=3DsBdSEer4tAPKGpOs [3]
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
> Changes in v3:
>   - impl TryFrom<u32> for Chipset
>   - add Chipset::arch()
>   - initialize revision from Boot0
>   - in Firmware, eliminate repeating code pattern using a closure (thanks=
 to
>     Alexandre)
>   - use #[expect(dead_code)] for Firmware
>
> Changes in v2:
>   - Fix module name in Kconfig description. (John)
>   - Expand Kconfig description a bit. (John)
>   - Expand name for PCI BAR0 region.
>   - Do not store / print boot0 raw register value. (John)
>   - Rename CardType to Architecture, rename enum names to represent the
>     architecture name and adjust enum values according to the register
>     definition. (John)
>   - Add an abstraction for register accesses.
>   - Print chipset, architecture and revision.
>   - Load bootloader firmware. (Timur)
> ---
>  MAINTAINERS                        |  10 ++
>  drivers/gpu/Makefile               |   1 +
>  drivers/gpu/nova-core/Kconfig      |  14 +++
>  drivers/gpu/nova-core/Makefile     |   3 +
>  drivers/gpu/nova-core/driver.rs    |  47 +++++++
>  drivers/gpu/nova-core/gpu.rs       | 189 +++++++++++++++++++++++++++++
>  drivers/gpu/nova-core/nova_core.rs |  15 +++
>  drivers/gpu/nova-core/regs.rs      |  56 +++++++++
>  drivers/video/Kconfig              |   1 +
>  9 files changed, 336 insertions(+)
>  create mode 100644 drivers/gpu/nova-core/Kconfig
>  create mode 100644 drivers/gpu/nova-core/Makefile
>  create mode 100644 drivers/gpu/nova-core/driver.rs
>  create mode 100644 drivers/gpu/nova-core/gpu.rs
>  create mode 100644 drivers/gpu/nova-core/nova_core.rs
>  create mode 100644 drivers/gpu/nova-core/regs.rs
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 25c86f47353d..5d5b7ed7da9e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7446,6 +7446,16 @@ T:	git https://gitlab.freedesktop.org/drm/nouveau.=
git
>  F:	drivers/gpu/drm/nouveau/
>  F:	include/uapi/drm/nouveau_drm.h
> =20
> +CORE DRIVER FOR NVIDIA GPUS [RUST]
> +M:	Danilo Krummrich <dakr@kernel.org>
> +L:	nouveau@lists.freedesktop.org
> +S:	Supported
> +Q:	https://patchwork.freedesktop.org/project/nouveau/
> +B:	https://gitlab.freedesktop.org/drm/nova/-/issues
> +C:	irc://irc.oftc.net/nouveau
> +T:	git https://gitlab.freedesktop.org/drm/nova.git nova-next
> +F:	drivers/gpu/nova-core/
> +
>  DRM DRIVER FOR OLIMEX LCD-OLINUXINO PANELS
>  M:	Stefan Mavrodiev <stefan@olimex.com>
>  S:	Maintained
> diff --git a/drivers/gpu/Makefile b/drivers/gpu/Makefile
> index 8997f0096545..36a54d456630 100644
> --- a/drivers/gpu/Makefile
> +++ b/drivers/gpu/Makefile
> @@ -5,3 +5,4 @@
>  obj-y			+=3D host1x/ drm/ vga/
>  obj-$(CONFIG_IMX_IPUV3_CORE)	+=3D ipu-v3/
>  obj-$(CONFIG_TRACE_GPU_MEM)		+=3D trace/
> +obj-$(CONFIG_NOVA_CORE)		+=3D nova-core/
> diff --git a/drivers/gpu/nova-core/Kconfig b/drivers/gpu/nova-core/Kconfi=
g
> new file mode 100644
> index 000000000000..ad0c06756516
> --- /dev/null
> +++ b/drivers/gpu/nova-core/Kconfig
> @@ -0,0 +1,14 @@
> +config NOVA_CORE
> +	tristate "Nova Core GPU driver"
> +	depends on PCI
> +	depends on RUST
> +	depends on RUST_FW_LOADER_ABSTRACTIONS
> +	default n
> +	help
> +	  Choose this if you want to build the Nova Core driver for Nvidia
> +	  GPUs based on the GPU System Processor (GSP). This is true for Turing
> +	  and later GPUs.
> +
> +	  This driver is work in progress and may not be functional.
> +
> +	  If M is selected, the module will be called nova_core.
> diff --git a/drivers/gpu/nova-core/Makefile b/drivers/gpu/nova-core/Makef=
ile
> new file mode 100644
> index 000000000000..2d78c50126e1
> --- /dev/null
> +++ b/drivers/gpu/nova-core/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +obj-$(CONFIG_NOVA_CORE) +=3D nova_core.o
> diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driv=
er.rs
> new file mode 100644
> index 000000000000..63c19f140fbd
> --- /dev/null
> +++ b/drivers/gpu/nova-core/driver.rs
> @@ -0,0 +1,47 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +use kernel::{bindings, c_str, pci, prelude::*};
> +
> +use crate::gpu::Gpu;
> +
> +#[pin_data]
> +pub(crate) struct NovaCore {
> +    #[pin]
> +    pub(crate) gpu: Gpu,
> +}
> +
> +const BAR0_SIZE: usize =3D 8;
> +pub(crate) type Bar0 =3D pci::Bar<BAR0_SIZE>;
> +
> +kernel::pci_device_table!(
> +    PCI_TABLE,
> +    MODULE_PCI_TABLE,
> +    <NovaCore as pci::Driver>::IdInfo,
> +    [(
> +        pci::DeviceId::from_id(bindings::PCI_VENDOR_ID_NVIDIA, bindings:=
:PCI_ANY_ID as _),
> +        ()
> +    )]
> +);
> +
> +impl pci::Driver for NovaCore {
> +    type IdInfo =3D ();
> +    const ID_TABLE: pci::IdTable<Self::IdInfo> =3D &PCI_TABLE;
> +
> +    fn probe(pdev: &mut pci::Device, _info: &Self::IdInfo) -> Result<Pin=
<KBox<Self>>> {
> +        dev_dbg!(pdev.as_ref(), "Probe Nova Core GPU driver.\n");
> +
> +        pdev.enable_device_mem()?;
> +        pdev.set_master();
> +
> +        let bar =3D pdev.iomap_region_sized::<BAR0_SIZE>(0, c_str!("nova=
-core/bar0"))?;
> +
> +        let this =3D KBox::pin_init(
> +            try_pin_init!(Self {
> +                gpu <- Gpu::new(pdev, bar)?,
> +            }),
> +            GFP_KERNEL,
> +        )?;
> +
> +        Ok(this)
> +    }
> +}
> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
> new file mode 100644
> index 000000000000..e7da6a2fa29d
> --- /dev/null
> +++ b/drivers/gpu/nova-core/gpu.rs
> @@ -0,0 +1,189 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +use kernel::{
> +    device, devres::Devres, error::code::*, firmware, fmt, pci, prelude:=
:*, str::CString,
> +};
> +
> +use crate::driver::Bar0;
> +use crate::regs;
> +use core::fmt;
> +
> +/// Enum representation of the GPU chipset.
> +#[derive(fmt::Debug)]
> +pub(crate) enum Chipset {
> +    // Turing
> +    TU102 =3D 0x162,
> +    TU104 =3D 0x164,
> +    TU106 =3D 0x166,
> +    TU117 =3D 0x167,
> +    TU116 =3D 0x168,
> +    // Ampere
> +    GA102 =3D 0x172,
> +    GA103 =3D 0x173,
> +    GA104 =3D 0x174,
> +    GA106 =3D 0x176,
> +    GA107 =3D 0x177,
> +    // Ada
> +    AD102 =3D 0x192,
> +    AD103 =3D 0x193,
> +    AD104 =3D 0x194,
> +    AD106 =3D 0x196,
> +    AD107 =3D 0x197,
> +}
> +
> +impl Chipset {
> +    pub(crate) fn arch(&self) -> Architecture {
> +        match self {
> +            Self::TU102 | Self::TU104 | Self::TU106 | Self::TU117 | Self=
::TU116 =3D> {
> +                Architecture::Turing
> +            }
> +            Self::GA102 | Self::GA103 | Self::GA104 | Self::GA106 | Self=
::GA107 =3D> {
> +                Architecture::Ampere
> +            }
> +            Self::AD102 | Self::AD103 | Self::AD104 | Self::AD106 | Self=
::AD107 =3D> {
> +                Architecture::Ada
> +            }
> +        }
> +    }
> +}
> +
> +// TODO
> +//
> +// The resulting strings are used to generate firmware paths, hence the
> +// generated strings have to be stable.
> +//
> +// Hence, replace with something like strum_macros derive(Display).
> +//
> +// For now, redirect to fmt::Debug for convenience.
> +impl fmt::Display for Chipset {
> +    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
> +        write!(f, "{:?}", self)
> +    }
> +}
> +
> +// TODO replace with something like derive(FromPrimitive)
> +impl TryFrom<u32> for Chipset {
> +    type Error =3D kernel::error::Error;
> +
> +    fn try_from(value: u32) -> Result<Self, Self::Error> {
> +        match value {
> +            0x162 =3D> Ok(Chipset::TU102),
> +            0x164 =3D> Ok(Chipset::TU104),
> +            0x166 =3D> Ok(Chipset::TU106),
> +            0x167 =3D> Ok(Chipset::TU117),
> +            0x168 =3D> Ok(Chipset::TU116),
> +            0x172 =3D> Ok(Chipset::GA102),
> +            0x173 =3D> Ok(Chipset::GA103),
> +            0x174 =3D> Ok(Chipset::GA104),
> +            0x176 =3D> Ok(Chipset::GA106),
> +            0x177 =3D> Ok(Chipset::GA107),
> +            0x192 =3D> Ok(Chipset::AD102),
> +            0x193 =3D> Ok(Chipset::AD103),
> +            0x194 =3D> Ok(Chipset::AD104),
> +            0x196 =3D> Ok(Chipset::AD106),
> +            0x197 =3D> Ok(Chipset::AD107),
> +            _ =3D> Err(ENODEV),
> +        }
> +    }
> +}
> +
> +/// Enum representation of the GPU generation.
> +#[derive(fmt::Debug)]
> +pub(crate) enum Architecture {
> +    Turing,
> +    Ampere,
> +    Ada,
> +}
> +
> +pub(crate) struct Revision {
> +    major: u8,
> +    minor: u8,
> +}
> +
> +impl Revision {
> +    fn from_boot0(boot0: regs::Boot0) -> Self {
> +        Self {
> +            major: boot0.major_rev(),
> +            minor: boot0.minor_rev(),
> +        }
> +    }
> +}
> +
> +impl fmt::Display for Revision {
> +    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
> +        write!(f, "{:x}.{:x}", self.major, self.minor)
> +    }
> +}
> +
> +/// Structure holding the metadata of the GPU.
> +pub(crate) struct Spec {
> +    chipset: Chipset,
> +    /// The revision of the chipset.
> +    revision: Revision,
> +}
> +
> +impl Spec {
> +    fn new(bar: &Devres<Bar0>) -> Result<Spec> {
> +        let bar =3D bar.try_access().ok_or(ENXIO)?;
> +        let boot0 =3D regs::Boot0::read(&bar);
> +
> +        Ok(Self {
> +            chipset: boot0.chipset().try_into()?,
> +            revision: Revision::from_boot0(boot0),
> +        })
> +    }
> +}
> +
> +/// Structure encapsulating the firmware blobs required for the GPU to o=
perate.
> +#[expect(dead_code)]
> +pub(crate) struct Firmware {
> +    booter_load: firmware::Firmware,
> +    booter_unload: firmware::Firmware,
> +    bootloader: firmware::Firmware,
> +    gsp: firmware::Firmware,
> +}
> +
> +impl Firmware {
> +    fn new(dev: &device::Device, spec: &Spec, ver: &str) -> Result<Firmw=
are> {
> +        let mut chip_name =3D CString::try_from_fmt(fmt!("{}", spec.chip=
set))?;
> +        chip_name.make_ascii_lowercase();
> +
> +        let request =3D |name_| {
> +            CString::try_from_fmt(fmt!("nvidia/{}/gsp/{}-{}.bin", &*chip=
_name, name_, ver))
> +                .and_then(|path| firmware::Firmware::request(&path, dev)=
)
> +        };
> +
> +        Ok(Firmware {
> +            booter_load: request("booter_load")?,
> +            booter_unload: request("booter_unload")?,
> +            bootloader: request("bootloader")?,
> +            gsp: request("gsp")?,
> +        })
> +    }
> +}
> +
> +/// Structure holding the resources required to operate the GPU.
> +#[pin_data]
> +pub(crate) struct Gpu {
> +    spec: Spec,
> +    /// MMIO mapping of PCI BAR 0
> +    bar: Devres<Bar0>,
> +    fw: Firmware,
> +}
> +
> +impl Gpu {
> +    pub(crate) fn new(pdev: &pci::Device, bar: Devres<Bar0>) -> Result<i=
mpl PinInit<Self>> {
> +        let spec =3D Spec::new(&bar)?;
> +        let fw =3D Firmware::new(pdev.as_ref(), &spec, "535.113.01")?;
> +
> +        dev_info!(
> +            pdev.as_ref(),
> +            "NVIDIA (Chipset: {}, Architecture: {:?}, Revision: {})\n",
> +            spec.chipset,
> +            spec.chipset.arch(),
> +            spec.revision
> +        );
> +
> +        Ok(pin_init!(Self { spec, bar, fw }))
> +    }
> +}
> diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/n=
ova_core.rs
> new file mode 100644
> index 000000000000..5d0230042793
> --- /dev/null
> +++ b/drivers/gpu/nova-core/nova_core.rs
> @@ -0,0 +1,15 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Nova Core GPU Driver
> +
> +mod driver;
> +mod gpu;
> +mod regs;
> +
> +kernel::module_pci_driver! {
> +    type: driver::NovaCore,
> +    name: "NovaCore",
> +    author: "Danilo Krummrich",
> +    description: "Nova Core GPU driver",
> +    license: "GPL v2",
> +}
> diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.r=
s
> new file mode 100644
> index 000000000000..f2766f95e9d1
> --- /dev/null
> +++ b/drivers/gpu/nova-core/regs.rs
> @@ -0,0 +1,56 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +use crate::driver::Bar0;
> +use kernel::revocable::RevocableGuard;
> +
> +// TODO
> +//
> +// Create register definitions via generic macros. See task "Generic reg=
ister
> +// abstraction" in Documentation/gpu/nova/core/todo.rst.
> +
> +const BOOT0_OFFSET: usize =3D 0x00000000;
> +
> +// 3:0 - chipset minor revision
> +const BOOT0_MINOR_REV_SHIFT: u8 =3D 0;
> +const BOOT0_MINOR_REV_MASK: u32 =3D 0x0000000f;
> +
> +// 7:4 - chipset major revision
> +const BOOT0_MAJOR_REV_SHIFT: u8 =3D 4;
> +const BOOT0_MAJOR_REV_MASK: u32 =3D 0x000000f0;
> +
> +// 23:20 - chipset implementation Identifier (depends on architecture)
> +const BOOT0_IMPL_SHIFT: u8 =3D 20;
> +const BOOT0_IMPL_MASK: u32 =3D 0x00f00000;
> +
> +// 28:24 - chipset architecture identifier
> +const BOOT0_ARCH_MASK: u32 =3D 0x1f000000;
> +
> +// 28:20 - chipset identifier (virtual register field combining BOOT0_IM=
PL and
> +//         BOOT0_ARCH)
> +const BOOT0_CHIPSET_SHIFT: u8 =3D BOOT0_IMPL_SHIFT;
> +const BOOT0_CHIPSET_MASK: u32 =3D BOOT0_IMPL_MASK | BOOT0_ARCH_MASK;
> +
> +#[derive(Copy, Clone)]
> +pub(crate) struct Boot0(u32);
> +
> +impl Boot0 {
> +    #[inline]
> +    pub(crate) fn read(bar: &RevocableGuard<'_, Bar0>) -> Self {

Since RevocableGuard has a Deref implementation you can actually take a
`&Bar0` here, and let deref coercion do its thing.

Also just for confirmation: is the intent that all register offsets,
and masks are kept private within this module, with each register having
its own type and dedicated methods to read/write it and extract useful
information from it? I haven't really written Rust kernel code before,
so I was wondering how we would deal with this problem. This looks like
a pretty safe solution.

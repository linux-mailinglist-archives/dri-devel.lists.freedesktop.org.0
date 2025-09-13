Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7123B56167
	for <lists+dri-devel@lfdr.de>; Sat, 13 Sep 2025 16:12:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04E2810E1F9;
	Sat, 13 Sep 2025 14:12:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="d+a6PtjY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2051.outbound.protection.outlook.com [40.107.94.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89B6C10E1FB;
 Sat, 13 Sep 2025 14:12:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gh10UzbnIJZHlKFuA6fUL+LscadYkt/QmaaQl6D7rYUp6fo9Njp+lTTUpmREkbY+PbNhb2+ZNOg9DBOUcRs57PNx6OaLu3pUmvSf0RMYP/wMs+Bf0Xgp+Pa5uZJzI42fGAAIKqvo/OiLRW0JSanqF7uzBC2F+Ibl4SwpPOQ4Cj99aH7HPxVXfzeOnGxalE+PqFAxuZI0KQxiA+3nrbtUCycmDcqlze+VMU/supVZ0kpJ/J6wE7IEhMSnceg+GUwuCQ2JFVbWSLDtkmufbeCqVDmya2awvqzuD6f9EpPJ7imoAhXj72zztFcEF5rVqcGQe0cxN4VfvnK3p8j5cuwXuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7jpwocEYAIZxLR4v3O9z5t83IEs5m5Gk9V0wpZ/hP0g=;
 b=BLlqYk/UidR4gZ1w0lkahzQ2K2AM8+k7Ar7UmgLgmNwYXONzU1pM92SmE63UAjxepL4RlRLj9ZRiGhM7usBsUB8P7vRgw9AuVY2z5i2R1YIhhPfqUPbHCG97wj683qY0tZ2hQKMe86jxtzH4yodV3/FlQCDGxgGM09iGzLFxwtKP4EOt6YdrdxaLV43ScGZZSjfogOw2/d0PX9OAKDH/KFSGqWILeh5biZzd5shpAfiHkKC5B4bcF/+RB4R50j+58p4UlueGMIBBzlrmhqKR2L/00GwZmJekM/JmEpK6OQ5qW3Shui+ApIm/senZ4YubKoCiLLfPkqKksGkCaUF11Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7jpwocEYAIZxLR4v3O9z5t83IEs5m5Gk9V0wpZ/hP0g=;
 b=d+a6PtjYsU511Rk8ZAiVGGsA55s9lEq6/tLd1hU7/tYn/STsRH9jkO1tW9VzUyS+EbmzlyWPK2ZwTosehXS74Rze95zwqvYr/CdV2+5w5NoO27Ad72DsS9kGoDswkQr0Wqeg/EVoVrJdXCzW+aP2kub4ZD3KNUagG9cKa3+BAp6RVvKZRCqkpI3byjkfwN55kqmo4D2w8Ywv+uI7dJb2DvNuPZ0u0qRurYf0XLgBtQWK7ld1nTCfwixCnt8dnwfeFM6fyqMjMeEkdlXJUZnj7RyFgZdfUt0PbYC8NqWof3b5YzR2gemdoBZNRICqiIrD4Xh1jWIgcZxFAP0btcQ+Og==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY1PR12MB9583.namprd12.prod.outlook.com (2603:10b6:930:fe::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Sat, 13 Sep
 2025 14:12:35 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9094.021; Sat, 13 Sep 2025
 14:12:35 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sat, 13 Sep 2025 23:12:17 +0900
Subject: [PATCH v6 04/11] gpu: nova-core: firmware: move firmware request
 code into a function
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250913-nova_firmware-v6-4-9007079548b0@nvidia.com>
References: <20250913-nova_firmware-v6-0-9007079548b0@nvidia.com>
In-Reply-To: <20250913-nova_firmware-v6-0-9007079548b0@nvidia.com>
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
X-ClientProxiedBy: TYWP286CA0007.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY1PR12MB9583:EE_
X-MS-Office365-Filtering-Correlation-Id: 562f614c-f72a-4924-9388-08ddf2cf9682
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|10070799003|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?enJSWG8vVlFNUUVMbGRtaUlmS2ZxVDNWeUJmcmN2bFZhUDhqUW4rM0tSWUhx?=
 =?utf-8?B?ejNlUkNTTXRrMXF5Tk5OVnBIMlZxU0hZYXo0L3Fpa0phb0NtN3hwVlJZcVhI?=
 =?utf-8?B?OXpvKzdkb1l0SHl0cGVpWGhVbW52d05SQWJJZXByMlhuamV3aFpZNzNVd2k0?=
 =?utf-8?B?blFtRVRzZUZkTVdrTlVWcFAwNXMxUmZxNElFK25LWjliN1hLOU1ISWkvYit3?=
 =?utf-8?B?Nkw4V2tuZC9hYTcvcm1aTUF5SkNsaHlxUTc1cnpza0dqVkZ1UXZqVnhQYkVp?=
 =?utf-8?B?SHlHeGRnM29mQTNNenhRbFFCeUc1YkFtU1FkWEljczllY3VITXltSVlNRWh3?=
 =?utf-8?B?VnZJeWo4bTlXd1RqUEhwcWNpdkdWRFlnKzdlM21nN0tUSkp5VUwrMjBGOVhp?=
 =?utf-8?B?UGRsU3dwNGxnT1d4QUZ5WUE4VWQyd0FVNzVWaGFoMHZncGRXUktITUFIUkVP?=
 =?utf-8?B?UG00eXNibXVXQW9QWHhmdHNQK2E4NmM3a0l6L0JnZlZrYnZSaUJ3alVpM0xr?=
 =?utf-8?B?YmtsT0VqaHEybk4xYVR4SHNXR3hTcExXZmlibE5QM285cnNESjdWZjJMUlBo?=
 =?utf-8?B?TERrbytnVXpvZUtkd1ZiUEo1bS93U1I4TWJ0VGEzeXJ0ZDMrWlRXdlpkTzhU?=
 =?utf-8?B?eTFuQVJKZk5RUzdBQVA5cUIzdDk1WlFzU1VSVEhNM1k2MDJHdHJqS2dvVm8z?=
 =?utf-8?B?WnowMTMzd2pZNmlEZ1ozQnJMcTQ1cWZML2tsVVYrM3dOMTZTay9XNnRFY2Zm?=
 =?utf-8?B?amw4S1VORFcxenV3MFM4aXYrZytobnZRdHRXNGFYbVVXazlXT2hGU0pJd3Ri?=
 =?utf-8?B?RmpjeCtrRnFCYWIzM2RuTCtKbzA3UzBWWDg5d1NVd3RwQUtHaUZqWW05TnhG?=
 =?utf-8?B?RGV2Nk9UcmhNNnp0eDROUkpJSlBSQjdKVEEvMDZraHZ5QU5SLzB2S2p0Yitv?=
 =?utf-8?B?QllESGNFZzJ5OG1tNkxSTk5zNG95bi9pcWR5Y0xuV240NUR5ckJFeE5abnBT?=
 =?utf-8?B?MXhsT1Z2YnFqUDBZazU3ZmI4d3RpMVRERUZueFJNekV6VzFwR1MwZlRrdmNY?=
 =?utf-8?B?dmRjdDVmVmNEMHJwclNSVnl1N0lkK0ovNGZsYWJ1QmdKSFZYcGIrd01zV3FW?=
 =?utf-8?B?M2FwM0tRL1lDMjIrK20wclBzNEZjejlpWUlFNnhzdFlUTFRNRXZhbXZVMEZP?=
 =?utf-8?B?WWRIT3JEeDA3Nlk2YVU2Vk1hV1EvNFZ5clZVSE1HQjFMTDAxTGlDZVVDYkhP?=
 =?utf-8?B?YTc2TEx1Qk90d25GZGtTWUdsemd1MkdyekVETXR6YWZFdWlwRmxYcFg2d0Iy?=
 =?utf-8?B?TFBtaUgyalVYWDBWTjdsZ0ZudE8wZittUGJWdUl3Mm55ZURwa21FNEI0bXNj?=
 =?utf-8?B?Uy95TUNheUVGZFhqdjVGQ1N1ZDhOazZ0K2NSY1BEazVHR0w5eHAzRVE1N0dv?=
 =?utf-8?B?REJ5d2w5NTZvNFhjeXhoQ3lnK3RtdUNWOXgyNlk1NXc2ZnFKYjkzcEp6NEU2?=
 =?utf-8?B?ckNETlRJU2hmemFYMTg0NHdPMFNTODhHMmxRUDBJeXlmVFcyeS9VTUVMd1ZK?=
 =?utf-8?B?Tzk3cGhET1J4clBiTW1kTm9zN0FrdGh2MXQyRlZPaUNYdWtiZklQQlRUTGhO?=
 =?utf-8?B?QjN4cVR4c1BMRDBtZ3VycmtUN1o3c1MyYjRjU0xEYjluYUp0REdlellWVDRG?=
 =?utf-8?B?K0hCaEMyT2FkSUJocHgzQ1VYNkR4VWE1K0tKcXEwVE03eFlhOTFZYUo5djVt?=
 =?utf-8?B?OGN4MXBUYkxYdEJzNDFvY2ZvQmtTeUtpQWF3VFNCNGdSZENzUVpjU2d4Qnp5?=
 =?utf-8?B?by85UE1rL2NpTTZEbWdybGt3SHN5WDJPeVRWdkM3Yk4vWWpLYzNBT3NLTkZS?=
 =?utf-8?B?cXQvNzFiODBmL251VDRSVUZaTDhxTTZPTzNNMU9MbnBXTlRqaERDeThXNExG?=
 =?utf-8?B?TXlhbWRaUWJhbUZ4YUo2WGRldmVML0RzRk8wWXM0Unl3M2FWVTFmQXg3Ym9O?=
 =?utf-8?B?R2JOa0ZtVUt3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OXd5dGE5dGVNQTZTbjdTalN4ZlJEQk9sWENtMUh6OXVKeVZrNjIrSzlxSEVQ?=
 =?utf-8?B?R081NVBUci9KekpmRmpNdm1EeW02TTQ0TGVpODFMMzFndVlETm1uYlRpR3Qx?=
 =?utf-8?B?ZGIrZFczOXFpNjNWM1ZTRGlHcWk2ckk2WnI3MFVmQ0pnYmZrR2FpWXQ4cUxs?=
 =?utf-8?B?TVZBREU0d2VhRFNTa0dxREs4cE9NVUZRRUZZNG5VOWFGUkZFbzdkaldYTHdW?=
 =?utf-8?B?R2tva1pmL2FtQ2ZweG1saWpwMDIzZE1ITDlqR3BqWTJXdHN2b1JCVE1vLzZK?=
 =?utf-8?B?c29kWC9zZGFCR1FQMTdMSUMvSnF1VW9KTDRjV1NWKzRKUmQrWjZHT1g5WjJz?=
 =?utf-8?B?OWJVUnhPcnRsWVFQUjNYb0pyaDVvNWlMRjRZMzYycllRRExSMm9wTXp4Rjlj?=
 =?utf-8?B?QVhiNnBSNEsrb3hTbUpRelZ3WGpKL1M1T1czSHV3N3RCeHBZUWsxQjAxeC9O?=
 =?utf-8?B?L21jdHY1M2o5TXAxV2xlQ2M0MXdBbzU1TjR1QnJSVjdtOVpDZDFHcUQ1RTFI?=
 =?utf-8?B?TThOSldtbnVtZFIwRFdTNnZ1OVU4NmtZQkZScGE1bGIybCt0WGJ4WTR1cjZ2?=
 =?utf-8?B?cmRkcC94c3FyYzVnZVI4OWNqVXpaU3owL2lYYWovRzk0d1pBOG5ZY1hJenN5?=
 =?utf-8?B?V3ZURk54aU9oLzFXR0FJWENoQzlMRkUzNGxzTHhXa0xYMGRpTDl0bkREWXU1?=
 =?utf-8?B?cGhVak5IN3YzSUJVRVdnazhnOXY3WHpMZnFRM2VKUEJ4L053U0xYUytVb3F3?=
 =?utf-8?B?VlZOZUxEV211SWd3R21Md3F0ZkV2Q2U3cmN3NjM1WWFFUHpQVE4wZlBiYU93?=
 =?utf-8?B?eHNFbTVRKytNTXcyRHZES29zM0dYNkt5bUNwK2JiTm9uem5wQnovc01XVTR4?=
 =?utf-8?B?NDMrZFFIZ2xIaTRQUzdhdk80K0NKUG81SE5tWW4veWZBNTZRQ29nUytOSW1E?=
 =?utf-8?B?UEFCZ2RHOC9ROG5KVTFyUGtibVh4eWV0blNVK2VpSHM5MVZqTk9yalUvQVAz?=
 =?utf-8?B?WG41RDdjLzZiMmdLT1QzZlVSaGN2NWJyWFM2S0pYS2JraHNmTDdyczhUVXJn?=
 =?utf-8?B?TFJLaVZpYnZwZGtVSCtsUFh1UDNBOVVxemErTU55RjdHUVkwTDA0TU1FWnBh?=
 =?utf-8?B?cjFCS1BHaUpQQUR6dlhaSlpXdzQzTE9xUHgrc3phZVU4bkVZS1gxT2hFcDg4?=
 =?utf-8?B?am5RblpFZ0Z2a0hkYmV0dmVETWozNzdaRHlFbllzaXFnSDUrV0FoVGp3dzZm?=
 =?utf-8?B?ZUlrR0Z5QncxWkd1UzZ3TmkySFZCcGVvcnZrZTQwTHBjU21GQlZRRExhZ08z?=
 =?utf-8?B?YWl3d2dyL3ZYUThvcWVOMXZrUi9SdDN4NFB1ZlYreWVqdHIrc2NhTXhaTDVr?=
 =?utf-8?B?REoxSFlKM3VsSlA2OHd4UDJWL1dvTk5zdGFFdytsSzh2dlM3K3NvSVUrQUJH?=
 =?utf-8?B?dEVCQ3RscFVrYnRCOWxvSUp4VTQ3MnoyWHUzRWZtM3ozR3Y5SlVNaW5NaGh2?=
 =?utf-8?B?dHdjRGlJUjZNTnNGWHJVWDJra1B1dGhKTDkxaDRSbzNscjNiSFgxL2VjZFF5?=
 =?utf-8?B?TjYxRlI4ZHd2M2pUNWMrRW0wZHlYbm1vWGpXWWlWNDZFKzlWTjJKdVJLTExW?=
 =?utf-8?B?bHVDSGVpM2h1Qk5JbHVnc1JkMTZGVWoxZVk2VnJvQVNyT25FbTZ0RGFVNXdr?=
 =?utf-8?B?QjFJOUQ3a1NJNGFSNlh6b0RsUGdOZ0N4T2kxOTVqL2FFQVhUMDhrSS9FVzJn?=
 =?utf-8?B?Q3lybFM1Kzh5S3hncHIrcnd6d0xIVzcrMHl4b1NNV2pseExIR3VWR0lvTENX?=
 =?utf-8?B?VnVxVEpxUnZKUVFLYUFDQTFnNHVOUGZiTnVNdjI1SHI2eWVjVG9GQUlKTXo3?=
 =?utf-8?B?a21iTjd1dVJqRUFNT0xHNTNxemc5czRrdzhHSTl1ZUtJN0NhWXRVN2F0RjNQ?=
 =?utf-8?B?ckpidDFmNW42ZWh5Z3JmamxhSmNQNWJzcisyUkdNUkp5NExTYVVnSWJlSmFU?=
 =?utf-8?B?dzNQdE1BaEJjSzI5MmY5L0grUEFLLzJnMlpUVXJ2QlJ3NFhWa1k0U0FzNklT?=
 =?utf-8?B?N1MwWWd4SThZbmNjOWF5Y01JYmNtK0JBN3loMlhRb3RQMDlVR1EvdFFwdUt1?=
 =?utf-8?B?R2YyZTNvWTd2b3dTMzRmYjh4OXNFakR1RzdUaDFQQWZkc0psMStwK1dScDZw?=
 =?utf-8?Q?T36IZOVsnVcjEE5Ws7RjU139AAOFzqJxMe4Y4B+LZ879?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 562f614c-f72a-4924-9388-08ddf2cf9682
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2025 14:12:35.4947 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bew5cXcHxc/a6s7Nyk3RHjjBB3jKpcgv42nXL9xJ+cN8VMVBn4f+RqTBYT0PfS8+pY9tMGDD18SSI5207tbK1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9583
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

When all the firmware files are loaded from `Firmware::new`, it makes
sense to have the firmware request code as a closure. However, since we
eventually want each individual firmware constructor to request its own
file (and get rid of `Firmware` altogether), move this code into a
dedicated function that can be called by individual firmware types.

Acked-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 213d4506a53f83e7474861f6f81f033a9760fb61..8e40a671eca8cc3454c106ef6c83bb54e8454715 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -19,6 +19,19 @@
 
 pub(crate) const FIRMWARE_VERSION: &str = "535.113.01";
 
+/// Requests the GPU firmware `name` suitable for `chipset`, with version `ver`.
+fn request_firmware(
+    dev: &device::Device,
+    chipset: gpu::Chipset,
+    name: &str,
+    ver: &str,
+) -> Result<firmware::Firmware> {
+    let chip_name = chipset.name();
+
+    CString::try_from_fmt(fmt!("nvidia/{chip_name}/gsp/{name}-{ver}.bin"))
+        .and_then(|path| firmware::Firmware::request(&path, dev))
+}
+
 /// Structure encapsulating the firmware blobs required for the GPU to operate.
 #[expect(dead_code)]
 pub(crate) struct Firmware {
@@ -30,12 +43,7 @@ pub(crate) struct Firmware {
 
 impl Firmware {
     pub(crate) fn new(dev: &device::Device, chipset: Chipset, ver: &str) -> Result<Firmware> {
-        let chip_name = chipset.name();
-
-        let request = |name_| {
-            CString::try_from_fmt(fmt!("nvidia/{chip_name}/gsp/{name_}-{ver}.bin"))
-                .and_then(|path| firmware::Firmware::request(&path, dev))
-        };
+        let request = |name| request_firmware(dev, chipset, name, ver);
 
         Ok(Firmware {
             booter_load: request("booter_load")?,

-- 
2.51.0


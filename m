Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66ADAAE0719
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 15:25:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B01CA10EA55;
	Thu, 19 Jun 2025 13:25:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="oHynjIZO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2040.outbound.protection.outlook.com [40.107.93.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6765D10EA52;
 Thu, 19 Jun 2025 13:25:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U+hs9hhmYQEVkEusS5TV7Kr/aWowwChlTb9cPshHGlY8GEs0nV6gYUKWhZk/spozaWdbLE3r5W2gp+k2GQZcu7KRA3mDG5I2IqkbfsW6rH3QNlM9yJ5QyjrITkiSPxL42rsY/s1wsRkC425MBXfXM+2cxhGl/ZE7/vJ2V6IuW+AjgTWXBeoeySWKpYs3aziQ/vkliN3UETwI7TmfjcOAc7Z/lzXxO/AJtJGeRE3aFigrf//VHq4QoskuVEjHpsKp0KCU6jXBUPW7mWdtlEWpLq7+BeZ4B46aY4F4NraBWTkCqBzJUkEpfFrKo3reWrr2sGZUugEyQOKQXnK0vtarkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uUd2JvMSSxY7BCXGWf+b3d6lkj+q76GVYnOGVn2AKG8=;
 b=l/srxfDQ+SO1IQTblUilWo+NEYOA8PEI7FXMABvdr152exfyUUIeqx04dMRz5DdHVhVnU8V5C5U5EMEubRkEX5sY1PxXB1DuCknPGcoZkklbMPBtIwWgcmvatJc503MvQ+GNUcKZACT9QNtgKPYHJiR7mJXrWzrW9YvGrj5b1ssUK1vkG3AC2V0XevBnCitK2n6Mz7YTOoyqzG0bo0PVnQQsLqacJilZq3vrhCSQl6Vb3GBa16fakn7qUWAdfvD4LrBxRz3z6ozM1mAvL8uEdwpZ4dNgmQlSubS4zZlZCG+5E6VzNyFievqmVRmLb/p3esdXhOGPDc1kFnFnVjiqPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uUd2JvMSSxY7BCXGWf+b3d6lkj+q76GVYnOGVn2AKG8=;
 b=oHynjIZOc2p1o/LyPgYQu9/IIyF+jSh3Y1tg2v3bmyFMdJkZCs3wNVZa/a0ydIK/gmdCDvDR6BcbAv9WmRXCAj8H5aTAA9rJc7mSLt3DSAY/rcqJLYY10AC0iM+oeEq+pZmc4NPH50F9D9Ge9cMkU5KqrkpnLssxwdS27BBI9kKQfT9nYpU1IMqHlFjvCXP47bpKGXz+u5PSNBvmssBDHtwsFBlJSUr/0WigTLklbEykxrbv0KFtxYkQOAiduPgnjEII0P/PZgfmcvQzqnsfh11ryu1NDTX9tcrS0C15NgE2Zu2ttS6cw7Sktue5n71gRdVNqiOSjdqMRM8t60gVDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM6PR12MB4353.namprd12.prod.outlook.com (2603:10b6:5:2a6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.21; Thu, 19 Jun
 2025 13:25:31 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8857.019; Thu, 19 Jun 2025
 13:25:31 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 19 Jun 2025 22:24:03 +0900
Subject: [PATCH v6 19/24] gpu: nova-core: vbios: Add support for FWSEC
 ucode extraction
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-nova-frts-v6-19-ecf41ef99252@nvidia.com>
References: <20250619-nova-frts-v6-0-ecf41ef99252@nvidia.com>
In-Reply-To: <20250619-nova-frts-v6-0-ecf41ef99252@nvidia.com>
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
 Shirish Baskaran <sbaskaran@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0219.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM6PR12MB4353:EE_
X-MS-Office365-Filtering-Correlation-Id: ea7f2c51-b8e5-49e5-dc70-08ddaf34c3c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|10070799003|376014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aWNycHVqanloZkIzc2RmMm5CUG4xT29xRHRzY3Z2SjN5N0F1WUlLaW5YVjhT?=
 =?utf-8?B?SnQyelVkTEcvMmlYM3Z0Rzd0RXVDcW4weGs4d0dQa0lUbjlaenNzbFZabjFV?=
 =?utf-8?B?UEpVYnJGZmNkQnZXR0lxU2ZvdmVHRER6SGFZaVVObnk3eU1RVmtoMzEzalJ0?=
 =?utf-8?B?aDI3YVBBYVdYWjduT0pmOW9mRGtXWDUvQmRsVmlMYnB0WG9xOVowRzZ3Sk5y?=
 =?utf-8?B?UXR3aDVJbThDM0tVbnYxRm9Da3lBWGxlVWtZRGZDWElRUUF5eHIwUmdaRWty?=
 =?utf-8?B?Zm9zbmQ4MHJENW9nZjA2WHFPNGk1Wis4eTFaeDhrUkFtT0VXUTZRMklnc1ZD?=
 =?utf-8?B?SEE0R1o3a3VVbTVZdytKdkczbitoN3ZpYXQwMGsydXUwRGxhMzNkUU1yR3pV?=
 =?utf-8?B?YS9TMWErYTRVaExPczVWS1hnaWJQRnFCdXhtTVVVTmVGdnNFamllVTdBekhm?=
 =?utf-8?B?N3ZaMndXYzJ3ZWtSOENqVlBMUndRclY3czU2M3NzdGFHUCtIMEUxc1lwd2V3?=
 =?utf-8?B?QU53VEs2N20rcXhNb29sOVlKejlaa3JVUmNCQXBsaGphVzZnMEpNOHNFTHU5?=
 =?utf-8?B?cE9qWlYvWWM3NmdSVUZCQUk2Y0VCbXRRSUs0NjFwcGtwa2h2L1F3RCthVzNy?=
 =?utf-8?B?dHFWeTRMazJ5bDN6bnBVd2JtcXlRalBnQ0xoYmxXUnh0UXU1K1R4NTk2NFU4?=
 =?utf-8?B?dTRWYUozRkRFTlFWeU9qb0VBbG1nbENMcVc1c0tpd1l3Snd0ZjVqRjNLenlQ?=
 =?utf-8?B?V1ZTSEdCOHl5RzZuWkVoU0pwYkxsdWt2am9TQ2N6M1VhMzdvTXNGcEdvdGpE?=
 =?utf-8?B?K0FOd3VIZFY5V0p1ZVFoVGwwU05USTBDdDV0bGU4TmhkUGUrN2diaTJiZEpX?=
 =?utf-8?B?NklJV1Y3VG1rYk1VZVA4RUhERTBtUmx0dmlqQUk4eG1qNkRqTUI2aWNQdWVB?=
 =?utf-8?B?UDkwcDkzdVRlNFV3bmNIdFF6RU9lQnF3RE4vMWs1alowRzFLS1ErSFczU2pB?=
 =?utf-8?B?Yk10QWh1Sm5nMjY2bDN3TG91Ym5iVlR1KzlWZW85dTJodWpRdjBkakN1ZDEr?=
 =?utf-8?B?ZENqeStpNFdDUllVUzlQaEs2K3hNZnB2MVdRRm1NS053ZnU1QVVaTWVmbE95?=
 =?utf-8?B?QUtRUTZwbGtrRTk4S3ZFdEh3R2o3QzJwSGR2RzJTeU5KNWg1YkdJZUpJb0ln?=
 =?utf-8?B?MkpFWjZzZlNzNTYzaTdkcTcva2E2SjlPUWZja25wdnBEUEowdUx2WGQrYVhI?=
 =?utf-8?B?MkNkQ3kwZkZ4NjVTUEZWZGg0dmtqNkRMcDRXZXlSdDRJbmRkR3U4MDBrV0RN?=
 =?utf-8?B?N3gvdk56LzU0MngvWmRjcWpwcjZ6KytkaDIwaUVQaE53WGUzQXVuOXpPdHhh?=
 =?utf-8?B?Wlo5VTBBN0hHMndURVgwSVUxbndING5uSXBhWFJEbkkxb2hrdEdOUW5uSkow?=
 =?utf-8?B?UjBRZlhFaGg4VkZGZDlyRmZYVWkrNFNJVDRSR28wSk90NkJUUG94S2FHSUJ5?=
 =?utf-8?B?KzZDOFcrd1NsaU0xenhEcXdmTlBWNkYxbk84dVRROFRzQ0lvMzNRQmo3ZkI4?=
 =?utf-8?B?dWU2VXNuY2x0V2FoNFY4OXBEcHpNUldTNEptM2VXV2tKN056dmFjMnowNTZU?=
 =?utf-8?B?QW90RG5xM2Fya2V4SWJRSGFJZjlRMTFjZHVHZUM0ZkxocnRVRnVOQ2kwcnIr?=
 =?utf-8?B?dzhCaFpNOXJ5SFpZME5sTGNnY3JkWWJ3WUlzYTZoU3hPcHJwQ2V4eXlGY2hF?=
 =?utf-8?B?Mm02dkZyRkRObUFxRzdHNTA2b2tEY2Mrc2RiM0lXZVE5RzdwV3BVdFNPN0lr?=
 =?utf-8?B?L3hmakFUQU82Vy9HUXAzQUFrMzdaVFRmNWRQSkhPSGUrTjNqejFIb3dsL1hN?=
 =?utf-8?B?RkdIYTg4T0JKNHhlZElpVXE2ckJMdVZTa2lmNFVBMm0vdG8wTGhDZU9NellJ?=
 =?utf-8?B?a1hBR2VkNjh3clJwMTdmWVBoQXpMWlpnSlFQcUdmNXpjZFd3Q1JMVUoxRy94?=
 =?utf-8?B?c3Vnd01ROXVRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(10070799003)(376014)(366016)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VDRUa3RnS043L2ZaUTA2TElTQURLQ3VRQXIzQ3dvbUVWQ0wzZjh2QWtuUHM3?=
 =?utf-8?B?bUp2K0dBRVZ4cEtHdktDREZ4U3piQnpySnlJYkhvT2ZhWE5HNmhWWktmMDNI?=
 =?utf-8?B?alBvTUp6L3gwMDFPaEpjTExpNmY5dktLN1lhaG1NTzdSSTdJSFNqVjVwS0I2?=
 =?utf-8?B?Z3d3TzY2YmdoMHg0ckpHa3IwcldMQ2RyUm9lSFJDOU5ZeUJyODlUTE4xeVcv?=
 =?utf-8?B?NkJzSnNCYkFJcWIxT2VPRDhDWS9ISWM2NUhaNUhub0ZUek5XSEZ6bUlEQkVw?=
 =?utf-8?B?cVEwSmpSUU9DM25xNklBTHZHdHhmTE5zbU9JRGttankwU2pySGxRRGN6aXBo?=
 =?utf-8?B?NXJOUUdTcFpncW1KK1Yzdkh3T2s3ZDRVWUlQUVFpMDRMWktDZHA1eS93OWps?=
 =?utf-8?B?blpFVmo2WENHYWZxTFAwMm9CemgyY2RYQU9tbmNpbmZ1WmU5S2tzZ3huWGxU?=
 =?utf-8?B?RmgrWjB2Mklld0JnaTd5TlI1VUswdGNieG1hRzlrL3RtU3NOdE5DSHQ2OFBr?=
 =?utf-8?B?MUZ0Y28wbStwbUNYYmthYXZ4QmQ2WFg3bFZuWnZ1K0ZhSFVNQWpxcmViekxJ?=
 =?utf-8?B?SGYwblIyZUQ0NTdiNE9uWDN6S045MDJqWTZCY0NLdHd5V0gyUUU3aW5HNHRS?=
 =?utf-8?B?a21tYWxCTmxWQ0twcmFvdjRXRzZKYmFGYVRtcTZDYjB3SzQrV25oSTNZSE1U?=
 =?utf-8?B?Y1JaUUFFRFJJQ1lJaWx5RjBRQTh1NWJjaVVOcndIOU8vWUtlWUxyVVNIVW1s?=
 =?utf-8?B?bk1CRFZIY1dPV0Z4SjhKcHpkMWV1TTE3WUx1Q2lVTFR1cjU3bkFBajBTVm5z?=
 =?utf-8?B?NE9pL2xVczNiQnhqd1ZZbGxudnJoOHdCaGI3Z3pZSFdWajUxV2ZQcFRraFlC?=
 =?utf-8?B?OVhYQTBtN3RlZkpnZVE3VWdGaHBwNFJPbisrQnBGRHBHbHBaTVlBNnFWZklv?=
 =?utf-8?B?TFRhaWplamMyR0ZJc3hIcGhVQm5pRkRJaUZlaGltcjVBeHg2aTB6Ni9ZWUc0?=
 =?utf-8?B?SGp6bWFFRHNCVHpUNlBwY2YvZzd1OEp3Y0FvcElPL1ZSMHlEamxpT3BRRUQx?=
 =?utf-8?B?NG5vSExPT3FqMjRtQ2RBOW9oNFduclcybDM0ZU5tckRhYXJtSmVTaVdTQS9q?=
 =?utf-8?B?TFFTUTNQUmF5Nkk3SDdKTDBTZG82L1pIdzZPQVFNQVdxc2hONllMWk54WHFK?=
 =?utf-8?B?eTZxMEJ1TjlzdjU0SHpCRVJ5aVMzMUNGcC81V0JrNk5OUHVpMnhiRnl0ZVFL?=
 =?utf-8?B?RkpGU1l1T1pRVTlpWlhhM1R0ZlZqT3lHbUVFMWswSzZMNHFOSnlseVo3YWZ1?=
 =?utf-8?B?NzMzYThVUXNRcnl0UnBhRUNxMjdWWmo2TkZzOGZtb24va1hUbFRVVVQ2cmpW?=
 =?utf-8?B?SU1DZUZjQkNzRWdBMnYrY1l2TEIraFVOTGg2NERNRTM2RW5zR1BaNTZGSXJs?=
 =?utf-8?B?K0E3K1h3V3NlNEhqMy9sNkZuM1VybXRUMW5jeE1yRHVZWm1FTnA2L0NpUDkw?=
 =?utf-8?B?dElhY2p2dGZNek56dFlISEN0bWtTelZNRHBRWVo0MDhFa0FPM0ZlcDRGb1Y2?=
 =?utf-8?B?NHllWlplbGljMUgyT2NSaEZTck11a2xlRHM1bGR4cWtNaGs2bDBEUHVGbXgx?=
 =?utf-8?B?bTA4eGFPbWVreEtaYkZkVUZaNjJnZ1Z5WVdxdnBGc3JuYllvakMwM28wdXdi?=
 =?utf-8?B?Y0VZRkVZcVk4cndta1EvTjZKR3FDNTBqbUpTTExwbWtHbHVyaWZBR2MzeDZG?=
 =?utf-8?B?ZUFTaWdtZ2pyL0tGc3VQYVM0Uk02dzN5S3cvenN4Z09vRnRoYUZzRU51K3Vh?=
 =?utf-8?B?QS8zOXBKVGNHUzlJS1Fyako1N1I1TS9pWVdUMGRZSFY1Y3dpeC9vN3VNeitw?=
 =?utf-8?B?SHF3TmxvTzl4Vi9FMkdodTVSYUZDYSttQm8wZUhqZk9VMVdhR29xR3pFYUpi?=
 =?utf-8?B?MHlRaFVsd1EzRW1ocXdzdC9NaGpZTHZqQW93UlhxZGhEMitQRDdlclRWakVU?=
 =?utf-8?B?Z0c0cGVOSmhqUlpjNHVOYitrUkN5S291eUNWZlFRVUg5VFRDb2hyR2ZkeGZ5?=
 =?utf-8?B?TW1wTk50UzhtNk9KSGllZmN5NVBTQTV1Zk5Udmx1THhPVHBUR1ZBQlJCOXpi?=
 =?utf-8?B?YWFlOHBoTjNXYktJcFF0YjBlVVAxM1VGUTVQM28yRHR2SVhrRGtDM0NCcy8z?=
 =?utf-8?Q?3rZELFUtHrWv9hNBF4Nh7TskCJCdAZYD7hq07a/25CSU?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea7f2c51-b8e5-49e5-dc70-08ddaf34c3c6
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 13:25:31.5649 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vWG/c7wxiMVrQYeU4VejR9RhieM10d074gSPiQRh3wfuEb7hTqNli4xmeQHu9xqIbidfIRWdB5iEQHpnNrESOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4353
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

From: Joel Fernandes <joelagnelf@nvidia.com>

Using the support for navigating the VBIOS, add support to extract vBIOS
ucode data required for GSP to boot. The main data extracted from the
vBIOS is the FWSEC-FRTS firmware which runs on the GSP processor. This
firmware runs in high secure mode, and sets up the WPR2 (Write protected
region) before the Booter runs on the SEC2 processor.

Tested on my Ampere GA102 and boot is successful.

[applied changes by Alex Courbot for fwsec signatures]
[acourbot@nvidia.com: remove now-unneeded Devres acquisition]

Cc: Alexandre Courbot <acourbot@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>
Cc: Shirish Baskaran <sbaskaran@nvidia.com>
Cc: Alistair Popple <apopple@nvidia.com>
Cc: Timur Tabi <ttabi@nvidia.com>
Cc: Ben Skeggs <bskeggs@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs |   2 -
 drivers/gpu/nova-core/vbios.rs    | 307 ++++++++++++++++++++++++++++++++++++--
 2 files changed, 298 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 41f43a729ad3bf2c4acb6108f41e0905a6fac0df..e5583925cb3b4353b521c68175f8cf0c2d6ce830 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -44,7 +44,6 @@ pub(crate) fn new(dev: &device::Device, chipset: Chipset, ver: &str) -> Result<F
 /// Structure used to describe some firmwares, notably FWSEC-FRTS.
 #[repr(C)]
 #[derive(Debug, Clone)]
-#[allow(dead_code)] // Temporary, will be removed in later patch.
 pub(crate) struct FalconUCodeDescV3 {
     /// Header defined by `NV_BIT_FALCON_UCODE_DESC_HEADER_VDESC*` in OpenRM.
     hdr: u32,
@@ -77,7 +76,6 @@ pub(crate) struct FalconUCodeDescV3 {
 
 impl FalconUCodeDescV3 {
     /// Returns the size in bytes of the header.
-    #[expect(dead_code)] // Temporary, will be removed in later patch.
     pub(crate) fn size(&self) -> usize {
         const HDR_SIZE_SHIFT: u32 = 16;
         const HDR_SIZE_MASK: u32 = 0xffff0000;
diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index 445b7ee5893c9d16a82254e70d937a902b1d0fae..0149621dca1aaea5b342ff32e4701de49e988839 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -6,7 +6,9 @@
 #![expect(dead_code)]
 
 use crate::driver::Bar0;
+use crate::firmware::FalconUCodeDescV3;
 use core::convert::TryFrom;
+use kernel::device;
 use kernel::error::Result;
 use kernel::pci;
 use kernel::prelude::*;
@@ -192,8 +194,8 @@ impl Vbios {
     pub(crate) fn new(pdev: &pci::Device, bar0: &Bar0) -> Result<Vbios> {
         // Images to extract from iteration
         let mut pci_at_image: Option<PciAtBiosImage> = None;
-        let mut first_fwsec_image: Option<FwSecBiosImage> = None;
-        let mut second_fwsec_image: Option<FwSecBiosImage> = None;
+        let mut first_fwsec_image: Option<FwSecBiosBuilder> = None;
+        let mut second_fwsec_image: Option<FwSecBiosBuilder> = None;
 
         // Parse all VBIOS images in the ROM
         for image_result in VbiosIterator::new(pdev, bar0)? {
@@ -227,12 +229,14 @@ pub(crate) fn new(pdev: &pci::Device, bar0: &Bar0) -> Result<Vbios> {
         }
 
         // Using all the images, setup the falcon data pointer in Fwsec.
-        // These are temporarily unused images and will be used in later patches.
-        if let (Some(second), Some(_first), Some(_pci_at)) =
+        if let (Some(mut second), Some(first), Some(pci_at)) =
             (second_fwsec_image, first_fwsec_image, pci_at_image)
         {
+            second
+                .setup_falcon_data(pdev, &pci_at, &first)
+                .inspect_err(|e| dev_err!(pdev.as_ref(), "Falcon data setup failed: {:?}\n", e))?;
             Ok(Vbios {
-                fwsec_image: second,
+                fwsec_image: second.build(pdev)?,
             })
         } else {
             dev_err!(
@@ -242,6 +246,10 @@ pub(crate) fn new(pdev: &pci::Device, bar0: &Bar0) -> Result<Vbios> {
             Err(EINVAL)
         }
     }
+
+    pub(crate) fn fwsec_image(&self) -> &FwSecBiosImage {
+        &self.fwsec_image
+    }
 }
 
 /// PCI Data Structure as defined in PCI Firmware Specification
@@ -675,7 +683,7 @@ fn new(pdev: &pci::Device, data: &[u8]) -> Result<Self> {
     PciAt: PciAtBiosImage,   // PCI-AT compatible BIOS image
     Efi: EfiBiosImage,       // EFI (Extensible Firmware Interface)
     Nbsi: NbsiBiosImage,     // NBSI (Nvidia Bios System Interface)
-    FwSec: FwSecBiosImage,   // FWSEC (Firmware Security)
+    FwSec: FwSecBiosBuilder, // FWSEC (Firmware Security)
 }
 
 struct PciAtBiosImage {
@@ -694,9 +702,24 @@ struct NbsiBiosImage {
     // NBSI-specific fields can be added here in the future.
 }
 
-struct FwSecBiosImage {
+struct FwSecBiosBuilder {
     base: BiosImageBase,
-    // FWSEC-specific fields can be added here in the future.
+    /// These are temporary fields that are used during the construction of
+    /// the FwSecBiosBuilder. Once FwSecBiosBuilder is constructed, the
+    /// falcon_ucode_offset will be copied into a new FwSecBiosImage.
+    ///
+    /// The offset of the Falcon data from the start of Fwsec image
+    falcon_data_offset: Option<usize>,
+    /// The PmuLookupTable starts at the offset of the falcon data pointer
+    pmu_lookup_table: Option<PmuLookupTable>,
+    /// The offset of the Falcon ucode
+    falcon_ucode_offset: Option<usize>,
+}
+
+pub(crate) struct FwSecBiosImage {
+    base: BiosImageBase,
+    /// The offset of the Falcon ucode
+    falcon_ucode_offset: usize,
 }
 
 // Convert from BiosImageBase to BiosImage
@@ -708,7 +731,12 @@ fn try_from(base: BiosImageBase) -> Result<Self> {
             0x00 => Ok(BiosImage::PciAt(base.try_into()?)),
             0x03 => Ok(BiosImage::Efi(EfiBiosImage { base })),
             0x70 => Ok(BiosImage::Nbsi(NbsiBiosImage { base })),
-            0xE0 => Ok(BiosImage::FwSec(FwSecBiosImage { base })),
+            0xE0 => Ok(BiosImage::FwSec(FwSecBiosBuilder {
+                base,
+                falcon_data_offset: None,
+                pmu_lookup_table: None,
+                falcon_ucode_offset: None,
+            })),
             _ => Err(EINVAL),
         }
     }
@@ -854,3 +882,264 @@ fn try_from(base: BiosImageBase) -> Result<Self> {
         })
     }
 }
+
+/// The PmuLookupTableEntry structure is a single entry in the PmuLookupTable.
+/// See the PmuLookupTable description for more information.
+#[expect(dead_code)]
+struct PmuLookupTableEntry {
+    application_id: u8,
+    target_id: u8,
+    data: u32,
+}
+
+impl PmuLookupTableEntry {
+    fn new(data: &[u8]) -> Result<Self> {
+        if data.len() < 5 {
+            return Err(EINVAL);
+        }
+
+        Ok(PmuLookupTableEntry {
+            application_id: data[0],
+            target_id: data[1],
+            data: u32::from_le_bytes(data[2..6].try_into().map_err(|_| EINVAL)?),
+        })
+    }
+}
+
+/// The PmuLookupTableEntry structure is used to find the PmuLookupTableEntry
+/// for a given application ID. The table of entries is pointed to by the falcon
+/// data pointer in the BIT table, and is used to locate the Falcon Ucode.
+#[expect(dead_code)]
+struct PmuLookupTable {
+    version: u8,
+    header_len: u8,
+    entry_len: u8,
+    entry_count: u8,
+    table_data: KVec<u8>,
+}
+
+impl PmuLookupTable {
+    fn new(pdev: &pci::Device, data: &[u8]) -> Result<Self> {
+        if data.len() < 4 {
+            return Err(EINVAL);
+        }
+
+        let header_len = data[1] as usize;
+        let entry_len = data[2] as usize;
+        let entry_count = data[3] as usize;
+
+        let required_bytes = header_len + (entry_count * entry_len);
+
+        if data.len() < required_bytes {
+            dev_err!(
+                pdev.as_ref(),
+                "PmuLookupTable data length less than required\n"
+            );
+            return Err(EINVAL);
+        }
+
+        // Create a copy of only the table data
+        let table_data = {
+            let mut ret = KVec::new();
+            ret.extend_from_slice(&data[header_len..required_bytes], GFP_KERNEL)?;
+            ret
+        };
+
+        // Debug logging of entries (dumps the table data to dmesg)
+        for i in (header_len..required_bytes).step_by(entry_len) {
+            dev_dbg!(
+                pdev.as_ref(),
+                "PMU entry: {:02x?}\n",
+                &data[i..][..entry_len]
+            );
+        }
+
+        Ok(PmuLookupTable {
+            version: data[0],
+            header_len: header_len as u8,
+            entry_len: entry_len as u8,
+            entry_count: entry_count as u8,
+            table_data,
+        })
+    }
+
+    fn lookup_index(&self, idx: u8) -> Result<PmuLookupTableEntry> {
+        if idx >= self.entry_count {
+            return Err(EINVAL);
+        }
+
+        let index = (idx as usize) * self.entry_len as usize;
+        PmuLookupTableEntry::new(&self.table_data[index..])
+    }
+
+    // find entry by type value
+    fn find_entry_by_type(&self, entry_type: u8) -> Result<PmuLookupTableEntry> {
+        for i in 0..self.entry_count {
+            let entry = self.lookup_index(i)?;
+            if entry.application_id == entry_type {
+                return Ok(entry);
+            }
+        }
+
+        Err(EINVAL)
+    }
+}
+
+/// The FwSecBiosImage structure contains the PMU table and the Falcon Ucode.
+/// The PMU table contains voltage/frequency tables as well as a pointer to the
+/// Falcon Ucode.
+impl FwSecBiosBuilder {
+    fn setup_falcon_data(
+        &mut self,
+        pdev: &pci::Device,
+        pci_at_image: &PciAtBiosImage,
+        first_fwsec: &FwSecBiosBuilder,
+    ) -> Result {
+        let mut offset = pci_at_image.falcon_data_ptr(pdev)? as usize;
+        let mut pmu_in_first_fwsec = false;
+
+        // The falcon data pointer assumes that the PciAt and FWSEC images
+        // are contiguous in memory. However, testing shows the EFI image sits in
+        // between them. So calculate the offset from the end of the PciAt image
+        // rather than the start of it. Compensate.
+        offset -= pci_at_image.base.data.len();
+
+        // The offset is now from the start of the first Fwsec image, however
+        // the offset points to a location in the second Fwsec image. Since
+        // the fwsec images are contiguous, subtract the length of the first Fwsec
+        // image from the offset to get the offset to the start of the second
+        // Fwsec image.
+        if offset < first_fwsec.base.data.len() {
+            pmu_in_first_fwsec = true;
+        } else {
+            offset -= first_fwsec.base.data.len();
+        }
+
+        self.falcon_data_offset = Some(offset);
+
+        if pmu_in_first_fwsec {
+            self.pmu_lookup_table =
+                Some(PmuLookupTable::new(pdev, &first_fwsec.base.data[offset..])?);
+        } else {
+            self.pmu_lookup_table = Some(PmuLookupTable::new(pdev, &self.base.data[offset..])?);
+        }
+
+        match self
+            .pmu_lookup_table
+            .as_ref()
+            .ok_or(EINVAL)?
+            .find_entry_by_type(FALCON_UCODE_ENTRY_APPID_FWSEC_PROD)
+        {
+            Ok(entry) => {
+                let mut ucode_offset = entry.data as usize;
+                ucode_offset -= pci_at_image.base.data.len();
+                if ucode_offset < first_fwsec.base.data.len() {
+                    dev_err!(pdev.as_ref(), "Falcon Ucode offset not in second Fwsec.\n");
+                    return Err(EINVAL);
+                }
+                ucode_offset -= first_fwsec.base.data.len();
+                self.falcon_ucode_offset = Some(ucode_offset);
+            }
+            Err(e) => {
+                dev_err!(
+                    pdev.as_ref(),
+                    "PmuLookupTableEntry not found, error: {:?}\n",
+                    e
+                );
+                return Err(EINVAL);
+            }
+        }
+        Ok(())
+    }
+
+    /// Build the final FwSecBiosImage from this builder
+    fn build(self, pdev: &pci::Device) -> Result<FwSecBiosImage> {
+        let ret = FwSecBiosImage {
+            base: self.base,
+            falcon_ucode_offset: self.falcon_ucode_offset.ok_or(EINVAL)?,
+        };
+
+        if cfg!(debug_assertions) {
+            // Print the desc header for debugging
+            let desc = ret.header(pdev.as_ref())?;
+            dev_dbg!(pdev.as_ref(), "PmuLookupTableEntry desc: {:#?}\n", desc);
+        }
+
+        Ok(ret)
+    }
+}
+
+impl FwSecBiosImage {
+    /// Get the FwSec header (FalconUCodeDescV3)
+    pub(crate) fn header(&self, dev: &device::Device) -> Result<&FalconUCodeDescV3> {
+        // Get the falcon ucode offset that was found in setup_falcon_data
+        let falcon_ucode_offset = self.falcon_ucode_offset;
+
+        // Make sure the offset is within the data bounds
+        if falcon_ucode_offset + core::mem::size_of::<FalconUCodeDescV3>() > self.base.data.len() {
+            dev_err!(dev, "fwsec-frts header not contained within BIOS bounds\n");
+            return Err(ERANGE);
+        }
+
+        // Read the first 4 bytes to get the version
+        let hdr_bytes: [u8; 4] = self.base.data[falcon_ucode_offset..falcon_ucode_offset + 4]
+            .try_into()
+            .map_err(|_| EINVAL)?;
+        let hdr = u32::from_le_bytes(hdr_bytes);
+        let ver = (hdr & 0xff00) >> 8;
+
+        if ver != 3 {
+            dev_err!(dev, "invalid fwsec firmware version: {:?}\n", ver);
+            return Err(EINVAL);
+        }
+
+        // Return a reference to the FalconUCodeDescV3 structure.
+        // SAFETY: we have checked that `falcon_ucode_offset + size_of::<FalconUCodeDescV3>`
+        // is within the bounds of `data`. Also, this data vector is from ROM, and 'data' field
+        // in BiosImageBase is immutable after construction.
+        Ok(unsafe {
+            &*(self
+                .base
+                .data
+                .as_ptr()
+                .add(falcon_ucode_offset)
+                .cast::<FalconUCodeDescV3>())
+        })
+    }
+
+    /// Get the ucode data as a byte slice
+    pub(crate) fn ucode(&self, dev: &device::Device, desc: &FalconUCodeDescV3) -> Result<&[u8]> {
+        let falcon_ucode_offset = self.falcon_ucode_offset;
+
+        // The ucode data follows the descriptor
+        let ucode_data_offset = falcon_ucode_offset + desc.size();
+        let size = (desc.imem_load_size + desc.dmem_load_size) as usize;
+
+        // Get the data slice, checking bounds in a single operation
+        self.base
+            .data
+            .get(ucode_data_offset..ucode_data_offset + size)
+            .ok_or(ERANGE)
+            .inspect_err(|_| dev_err!(dev, "fwsec ucode data not contained within BIOS bounds\n"))
+    }
+
+    /// Get the signatures as a byte slice
+    pub(crate) fn sigs(&self, dev: &device::Device, desc: &FalconUCodeDescV3) -> Result<&[u8]> {
+        const SIG_SIZE: usize = 96 * 4;
+
+        // The signatures data follows the descriptor
+        let sigs_data_offset = self.falcon_ucode_offset + core::mem::size_of::<FalconUCodeDescV3>();
+        let size = desc.signature_count as usize * SIG_SIZE;
+
+        // Make sure the data is within bounds
+        if sigs_data_offset + size > self.base.data.len() {
+            dev_err!(
+                dev,
+                "fwsec signatures data not contained within BIOS bounds\n"
+            );
+            return Err(ERANGE);
+        }
+
+        Ok(&self.base.data[sigs_data_offset..sigs_data_offset + size])
+    }
+}

-- 
2.49.0


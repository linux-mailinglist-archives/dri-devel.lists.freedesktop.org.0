Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E4DBE1B26
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 08:23:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2C3810E946;
	Thu, 16 Oct 2025 06:23:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ltNmMD5i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012021.outbound.protection.outlook.com [52.101.43.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3358710E93F;
 Thu, 16 Oct 2025 06:23:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hnmYAx28NlyihdTfNEcsHlhAeulMhdhV0nMWZiTIuWkxU6WU5ItrjPbY8LjKFiT68t1Mme9AboONBqJUpa4QECfI6z5fEWYqXObcy9G2GnRINM7digOuLNJHxJ7Gf8nPfm/k7mUlxslPY70Zi0OHb+beQ7iNB4W7ZJfaXdGL8RqtXEQvTBziO1JzbXLHHX7RCw0ejq7ZPI0BKIpmXBB+NKE7hzKZYQzUmuuhvEOV0Aauhn0Vglstlc56M9EfyceOrRX5kgbcr0r/YsF2M2GH3eUg3Jv39F70XzgfKJJcmc8UsbfoY39NxF1pRtzQg+waL6NAsqD+umlzNGToqpAFeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CeRjByQbs3oZfukRQYaJngFDVITKtly3OTEJQW1f71k=;
 b=sJGZyCX0eVzbolgOHZFhl98D+E4gwvgXCY3w35uqYFhbG3xb+g+I4JgP7cZYCpv7LQmVcJA5FBvhBjsggxF+LBRsILbtfpFTE/b5l5r+VywJ4y6IlGuzez39PLXO7/CcGrqebzFKnga1LkA5UQaswjMt8iqyARfQTg1FCHW2NKq089M7kUwL49VlhL4bF8CHs7HItpO7K5P67/0Rxa4G3mpaqWw63H8DN0aqpsEHt4huHFmzHUFxRwMC/KFuMuNnhnb1ExE2sCWuGX0Fkx19dz2kBNK3/C9bDbcwQIeODezv/JWVpWbnDgo/qDnZA6MuwWFyV4EDFTCaG0xxjFSzfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CeRjByQbs3oZfukRQYaJngFDVITKtly3OTEJQW1f71k=;
 b=ltNmMD5ifsTN6RzTJ5G2YzKkBczTiCoXLoYA4i+jUZgBFi/fVieDyLHXLu93G+EW6HN7ctdwUm49kNH/e6o3XDQRn+UC140aaV3CFFIEklHN3JVl4CpT6hqrJ9O5gY9KY7NM0bJwFaPuSTahNPhY4hABLi8+kqGF46WvnVVlrnNpkcb8eMUOfMKeDNkNijzVKqE2B1FokQA6sTgLIJIfePn/y/DHUoNpwPbatykk1dpOSrOgEt00n6Dc64HcEJG+diyaGcrjXiDzwFrTFc9zWDLaGM+/aaLG6uR3I4eEBOVKP0OaxzWgEqWIk/aFVGaUs8jAAH4/4p5hvgro0ojypA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA0PR12MB7603.namprd12.prod.outlook.com (2603:10b6:208:439::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Thu, 16 Oct
 2025 06:23:41 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9228.010; Thu, 16 Oct 2025
 06:23:41 +0000
Content-Type: text/plain; charset=UTF-8
Date: Thu, 16 Oct 2025 15:23:38 +0900
Message-Id: <DDJJ4P7ED3LJ.6YD2M62RB5VY@nvidia.com>
Subject: Re: [PATCH v5 04/14] gpu: nova-core: Add a slice-buffer (sbuffer)
 datastructure
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alistair Popple" <apopple@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <dakr@kernel.org>, <acourbot@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, "Lyude Paul" <lyude@redhat.com>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251013062041.1639529-1-apopple@nvidia.com>
 <20251013062041.1639529-5-apopple@nvidia.com>
In-Reply-To: <20251013062041.1639529-5-apopple@nvidia.com>
X-ClientProxiedBy: TYCPR01CA0134.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::13) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA0PR12MB7603:EE_
X-MS-Office365-Filtering-Correlation-Id: b368fa73-5337-4a3e-65ca-08de0c7c8ca8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|10070799003|1800799024|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ajFkMlVjcFQ4cHVLd3BVclhPOUxMM0pDNDNrL3JlQ000dXpjYlZkR3JmTzBs?=
 =?utf-8?B?RDFJT3hmZk01T3h0bDZKTXg4S0FLRmtvUVcyZGRIY0ZBZTg3WXBHK1VwRnJz?=
 =?utf-8?B?MTBJTlp0NmxmZVZSWmcxSHZkSFZLclhQWVV1NDd3Z3NUNlllaW45R2MyU3M2?=
 =?utf-8?B?L3BhK3lxVEVkZ0ErRFlEWElkeThXSllFclZ6eHVhVmo0dFB6VFRkZjgyV2dY?=
 =?utf-8?B?WE9jZVFJWXpmeWZBd1RJU0w3eWZ4eHk5ODBoc2lXWjVSMkgxRC93RVJVUVdW?=
 =?utf-8?B?N1NpTGtxVy9JNmRlZDhYdmJndk1SUHpUaWl0T3UxOEVGdU5EMUVPYUpWMzFH?=
 =?utf-8?B?VXBRNnZGUVdWemo1QzBMS2xLM1ZnYi81VDgrZ0c5aXFZMCtqOWxEYVRWcFlJ?=
 =?utf-8?B?Ty9jYUJqTGdyYS9HaCswbGVSWk4wVk1PcWlLVUd0SEhmNXc2ZU9uaWt0VUI0?=
 =?utf-8?B?UGVsbDJiSFdsZHVBUFhwSmRhYVNPT0pVWGZURUdxQWZEYndGcjl6UENveGg2?=
 =?utf-8?B?WWlsWDV5M1lqTnAyT1BteGNGaFVzekxSanprTkxRYVY2cHZmeTM0Mzk3VzJr?=
 =?utf-8?B?T3lac281ZWI2QlRJcDNYYmU4d2FtOHFWYWNwOGc2SFl0SjhaQnpSSTVUMjdl?=
 =?utf-8?B?TUIvTFRzdmFzZzEwUGJoSXcreWdLRUR1TzIyRG96NjdEbzhXcUJmUnkyUzVq?=
 =?utf-8?B?TUYyQ2t2bHBwbFNHNXdqQ0h0VUZxZC9CSmZhcDEveGpHUWZETVFjOWppT2hP?=
 =?utf-8?B?cmh5Y0FXQWhnemhyUEdTeXF3ZURVSXE3K2RXMWVwRDFDcWV6Tk5Zb3J5STh4?=
 =?utf-8?B?MTYxUVJrY2RKbHkxbVJYTXEvbmhBYnc1VWFEQVlLblV3Rm1zQ2pXaXoxZXhK?=
 =?utf-8?B?djlsb1VwV2VpMmF3Z0Q4UnlYcklMWVV6WTkwNzBJUkpRUitkS3AxTytEVFpn?=
 =?utf-8?B?UHlvL1VOWEUyYkR1Yk9DN0VWVWVlV2ZWNzhpbjVyOWtGeUVuQ1oyUW5tdlI5?=
 =?utf-8?B?aXErT0lJanNQNmxmVmlzZ3M2WmdyUVBLMmVVaE1mWWhyVE9hem50TTc2NFYy?=
 =?utf-8?B?MnR5Q05XLzYvOWRPKzIzeXV1SVVqMFVYek5XZDFWRUxCenJhMThqYVhPbklj?=
 =?utf-8?B?T0dJQ0h3WmdKNGUra1pmMnMwMysxQ3kzM3ZNbjRrOHBQTGhUU1hmS0ZGOGV1?=
 =?utf-8?B?RFp2ZXVwdEh3NG9lc201UDY1TnRMbWtLMk94N2FHSnpaZEtPdU5hU1VnUmRH?=
 =?utf-8?B?bTUrTWdNUGgzeDlZWnF3ZVMvb3czT1pENlBFQzkzTnMxaU0rbFhlNTFKcjFO?=
 =?utf-8?B?M0kvcFpmRGZNUnZvWXE1WkF1Yzk4TE1wRHNtaWxEU0JVNFdMUGpySS9CQW90?=
 =?utf-8?B?aHpBSUcvUXQwZU9BZEgzTnlIdzZ6UjVTYTZ6aTQxbUo3Q2dvQUlFRlVNRFZY?=
 =?utf-8?B?YlcyMUVicmNBSU0ybzVMOGhuUXhOV0YrazVxRkRaOWJRMUE3UHpFK1JDYVBO?=
 =?utf-8?B?S1FqMjJoTVY2MnJHL1ZqckV5TWY2RVJSR3lqRXdTY0o3Z3lKR0lRdHlDVlVo?=
 =?utf-8?B?R0l1MVo2QVRNY1BhQnE4NW1zY20yc25FL3ZKck91NEJNY3llZEV4NHY3VlVs?=
 =?utf-8?B?RmNTZ3pKMDIxYzhobXRCbmFTWWF6dVZHMnJkSnk2MDNKR0NqWDdQTXFmamJV?=
 =?utf-8?B?aDk2MFZXczZweHZWczRabDlUZEVHMEZhREV5ZldyQlZMWEtTUHdjUlVLRWVT?=
 =?utf-8?B?RmhLdWVvZUM5NUN3VTZFTG00L1hwRURXdUZtR1N4OW5ac05US0w4S0c3MGZ5?=
 =?utf-8?B?endrSTlpUGlWMzl0RDBTN09zS2U1OGdJWStqbXRsWVpma3RQdWw3bEUzNlow?=
 =?utf-8?B?eWlTSEVQNEJnNUdUZzdjL3VNQ2pydE5NUks2RXc3eFhUZjZtNVBMZldnY2Iz?=
 =?utf-8?Q?FwFbmXIjtzoz4ghANDg+S2l5EFM11uXJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(10070799003)(1800799024)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WnVJQ3g0UjFIOE85Y2F1NEIraU5VdDgrbDBuNVM5dGM5VWYyS3ROY2hsNlN3?=
 =?utf-8?B?S24xU1IrTUNRdXdTckJ3WFhUVk12WWw2M0xNRElVVklsWkFqWE9FMUVNREY0?=
 =?utf-8?B?NWFzTER4MjRXYi9MUHZoL0pQejMxWU42dWcwZTlPOXVJSUJia29US2RYTll1?=
 =?utf-8?B?ZVRHb0hPbE5aemh4VzQ4T05ZT0xwN1o0Mjl6OC9KZXhkUkU1RVhQR3V1bFRr?=
 =?utf-8?B?TE9Lc3hQNlRVdlcva1RQT1dZNm1GaC82clN3SW5JUUV1R3NXK2p0Yi9NY0pw?=
 =?utf-8?B?VGFhOG1PQkFyNUNmd1gvYk5VOUd6bWdxaTZmbmpVYkVxSXJSSXhucXptWFd6?=
 =?utf-8?B?UFJNTjk2dWlHVEJ2N3NxMW92SEpBZmJGMyttVzVnRm9Cc21mM1RlaG83MEtK?=
 =?utf-8?B?QzdyMzdTZExwa3FUMjRhdjMxSFV0NkxHVVhoYmlsdFB5TmZZL2I5UHhqWXdy?=
 =?utf-8?B?WXR3cWpHTGJWNE1mRVRXZEU3UkMxSGE0ZVc5cUVWSG9jWjRoVTh6U3JYbnUz?=
 =?utf-8?B?VWw4N2hVU3NHUnlJdm05OW9xQjBiaTVIcFVKdTFTa09SMzZrTVM3aW54Y3lh?=
 =?utf-8?B?UHFBUkx3R2J0b1ZTUEZoUDc4MlNWM002OGFnZHFEL21mQkx6NW5mWmU0bHE4?=
 =?utf-8?B?NFJ6dStDWlFJaW93UzQrUkpTSFRuVDBtSlFrSHdCdHFreHAyUEVvekQ3UXJl?=
 =?utf-8?B?NWRqc3IvNElrbEZ6bCsySHdPQzJkRW9wUEYreWJmN3hpOTdKTmtCYUFOWHRL?=
 =?utf-8?B?OVRCSHlDamY4NnZCMnNweVNRTXNlZEJveUhyWEdYcDhRenJBS3o0MzJMTGIy?=
 =?utf-8?B?cW5YdU5CNTlNdDlIcy9kMGxuUzZjRjBGdEZJdWd4cmFYMi9xelRKOUdWUGp2?=
 =?utf-8?B?aTI2OGQ3OGpQeC9kRUF0UWM0MS9QRDhWZ1pvM2hsRmhscTlsUDUra0VkWVBZ?=
 =?utf-8?B?bkgrOWtSWGEwTlZPRFUvQXQxTHJHRHM1WXQ5UzVkT2VwSzRGK0lYTHJLaTV6?=
 =?utf-8?B?aldtUDRWZEpmRlduR056S0dPQlhFN216dDc3NHg0dVdydXNUcTV4RG91VEtP?=
 =?utf-8?B?ZEpPTU51STZlbjFPbHoxQ0ZuU3MxTS9CSUg5YjJTQVpYTDF1U2UvYmkwN3B5?=
 =?utf-8?B?VGx3c2ZkUHlReGdhc1o2RkFpcW9YZXdjeXJJOFU2Wm5nYWNQek9Ud1U1bzBY?=
 =?utf-8?B?UXNJTFc5YS9WUlVnK1ZuYmtXMWtzSXhFQzRNOG5NM2tUQ29lak1QcUtnQ1Ir?=
 =?utf-8?B?b0xTTGRTNFR1R2ZrNm56aGkwSUcyWHRtd09ycXdhS2dhanpiWk5GeDFBTDRx?=
 =?utf-8?B?WnRvWVByOHVNVHVVUVhiLzlQWUw0VzRmZkYyODUrRm8xOEpYMTRIczFNTUZ4?=
 =?utf-8?B?U00ybUM1UWZRSjhqWk8rYnQ0NCtJR0pCNW1Xb1BCblJYTGRjMCtHTWQ4TW9E?=
 =?utf-8?B?SllVOFpzZFB5RFNyK1FlVWQwbjhSaWhhcEpDeTFZUEhGaGl3NUhGZnV5NW9P?=
 =?utf-8?B?VWpMNU9KWHJlTXo3bzkrellNNWlsc2o3Rmc1b1hKUTNBRkNmTE1FTUNnS2Ev?=
 =?utf-8?B?Slc2Vk9VblVLa2YzSm4wTmxhMXpWcEorUHY0ZmttMWZoZWR6Q0JpNGlnTFNR?=
 =?utf-8?B?b1hkamRyZHZqOThHYXVlSmxFTktoTWVHWFpwb2hOK25yRkVOdUFUcjJGZnkz?=
 =?utf-8?B?c0Z3UzRmYUNFSnc0KzJBM1FRN3ZWUEZnR0pVMFdIS0VZSENMemw4WmozQWJq?=
 =?utf-8?B?Tm9jaEorZnZwMFE2SU1FblpqSzdMVDRORHRNblBFS3BlSEtoUmtzS0RnelhG?=
 =?utf-8?B?TnNBTlorVlZLMmNHNUZoZ25VdFFMbnVLbHQyMitNaVFDc3dSOHF3N09lSWNF?=
 =?utf-8?B?NldIcDYzS2tSUUliY1Z0YXVKUTg4Y2t2R1A5Vzd2cnlmYlZBVlZBenIrUTdC?=
 =?utf-8?B?WHRaSTJFa2wxOUdwcEhpTC8rTWROYU9hSkNSZXVacFQ2eTIxMmFzMGpSY0th?=
 =?utf-8?B?VHFYMVZXSjJJdURlZDlFSzdWbEhCZks2MGhKdU5tQzNJSTVFcUlYUThBb0FW?=
 =?utf-8?B?UTRPVzFjYkFQcVQwbEczT0h4RFJDVnNHdWNTR0YvZTl2SXNkaFc2N1VUbnM1?=
 =?utf-8?B?bEZTZFVwZmsyUWVKaVNpT3l0eC9KM0JqR1JzOVpBZWZUUDZXL0puS0N3SHdP?=
 =?utf-8?Q?PxKj1vvlMjQ/JBijFz8tSlaTQvPWxOkXX35NlhsZN9vj?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b368fa73-5337-4a3e-65ca-08de0c7c8ca8
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 06:23:40.9913 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qmN92TXLMJTNC+K8Gmook2wsnbJ1FmxWIAoKXey2kaR9Sfrk4fegUvMdl3gdou6e0dljkOXB3AvhdOqYa3vVrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7603
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

On Mon Oct 13, 2025 at 3:20 PM JST, Alistair Popple wrote:
> From: Joel Fernandes <joelagnelf@nvidia.com>
>
> A data structure that can be used to write across multiple slices which
> may be out of order in memory. This lets SBuffer user correctly and
> safely write out of memory order, without error-prone tracking of
> pointers/offsets.
>
>  let mut buf1 =3D [0u8; 3];
>  let mut buf2 =3D [0u8; 5];
>  let mut sbuffer =3D SBuffer::new([&mut buf1[..], &mut buf2[..]]);
>
>  let data =3D b"hello";
>  let result =3D sbuffer.write(data);
>
> An internal conversion of gsp.rs to use this resulted in a nice -ve delta=
:
> gsp.rs: 37 insertions(+), 99 deletions(-)
>
> Co-developed-by: Alistair Popple <apopple@nvidia.com>
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> Reviewed-by: Lyude Paul <lyude@redhat.com>
>
> ---
>
> Changes for v5:
>  - Typos
>  - s/ETOOSMALL/EINVAL/
>  - Add documentation
>  - Fix up examples
>
> Changes for v3:
>  - Addressed minor review comment from Lyude
> ---
>  drivers/gpu/nova-core/nova_core.rs |   1 +
>  drivers/gpu/nova-core/sbuffer.rs   | 218 +++++++++++++++++++++++++++++
>  2 files changed, 219 insertions(+)
>  create mode 100644 drivers/gpu/nova-core/sbuffer.rs
>
> diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/n=
ova_core.rs
> index fffcaee2249f..a6feeba6254c 100644
> --- a/drivers/gpu/nova-core/nova_core.rs
> +++ b/drivers/gpu/nova-core/nova_core.rs
> @@ -11,6 +11,7 @@
>  mod gpu;
>  mod gsp;
>  mod regs;
> +mod sbuffer;
>  mod util;
>  mod vbios;
> =20
> diff --git a/drivers/gpu/nova-core/sbuffer.rs b/drivers/gpu/nova-core/sbu=
ffer.rs
> new file mode 100644
> index 000000000000..d9c412a68bd8
> --- /dev/null
> +++ b/drivers/gpu/nova-core/sbuffer.rs
> @@ -0,0 +1,218 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +use core::ops::Deref;
> +
> +use kernel::alloc::KVec;
> +use kernel::error::code::*;
> +use kernel::prelude::*;
> +
> +/// A buffer abstraction for discontiguous byte slices.
> +///
> +/// This allows you to treat multiple non-contiguous `&mut [u8]` slices
> +/// of the same length as a single stream-like read/write buffer.
> +///
> +/// # Example:
> +///
> +/// ```
> +/// let mut buf1 =3D [0u8; 5];
> +/// let mut buf2 =3D [0u8; 5];
> +/// let mut sbuffer =3D SBufferIter::new_writer([&buf1, &buf2]);
> +///
> +/// let data =3D b"hello";
> +/// let result =3D sbuffer.write_all(data);
> +/// ```

This example doesn't build - there are several things wrong with it. It
is also missing statements to confirm and show the expected result. Here
is a fixed and slightly improved version:

/// let mut buf1 =3D [0u8; 5];
/// let mut buf2 =3D [0u8; 5];
/// let mut sbuffer =3D SBufferIter::new_writer([&mut buf1[..], &mut buf2[.=
.]]);
///
/// let data =3D b"hi world!";
/// sbuffer.write_all(data)?;
/// drop(sbuffer);
///
/// assert_eq!(buf1, *b"hi wo");
/// assert_eq!(buf2, *b"rld!\0");
///
/// # Ok::<(), Error>(())


> +///
> +/// A sliding window of slices to process.
> +///
> +/// Both read and write buffers are implemented in terms of operating on=
 slices of a requested
> +/// size. This base class implements logic that can be shared between th=
e two to support that.
> +///
> +/// `S` is a slice type, `I` is an iterator yielding `S`.

Why is there another doccomment after the example section? It looks like
this should be merged with the first doccomment before the example?
There is also no `S` generic parameter.

> +pub(crate) struct SBufferIter<I: Iterator> {
> +    /// `Some` if we are not at the end of the data yet.
> +    cur_slice: Option<I::Item>,
> +    /// All the slices remaining after `cur_slice`.
> +    slices: I,
> +}
> +
> +impl<'a, I> SBufferIter<I>
> +where
> +    I: Iterator,
> +{
> +    /// Creates a reader buffer for a discontiguous set of byte slices.
> +    ///
> +    /// # Example:
> +    ///
> +    /// ```
> +    /// let buf1: [u8; 5] =3D [0, 1, 2, 3, 4];
> +    /// let buf2: [u8; 5] =3D [5, 6, 7, 8, 9];
> +    /// let sbuffer =3D SBufferIter::new_reader([&buf1[..], &buf2[..]]);
> +    /// let sum: u8 =3D sbuffer.sum();
> +    /// assert_eq!(sum, 45);
> +    /// ```
> +    #[expect(unused)]
> +    pub(crate) fn new_reader(slices: impl IntoIterator<IntoIter =3D I>) =
-> Self
> +    where
> +        I: Iterator<Item =3D &'a [u8]>,
> +    {
> +        Self::new(slices)
> +    }
> +
> +    /// Creates a writeable buffer for a discontiguous set of byte slice=
s.
> +    ///
> +    /// # Example:
> +    ///
> +    /// ```
> +    /// let mut buf1 =3D [0u8; 5];
> +    /// let mut buf2 =3D [0u8; 5];
> +    /// let mut sbuffer =3D SBufferIter::new_writer([&mut buf1[..], &mut=
 buf2[..]]);
> +    /// sbuffer.write_all(&[0u8, 1, 2, 3, 4, 5, 6, 7, 8, 9][..])?;
> +    /// drop(sbuffer);
> +    /// assert_eq!(buf1, [0, 1, 2, 3, 4]);
> +    /// assert_eq!(buf2, [5, 6, 7, 8, 9]);
> +    ///
> +    /// ```
> +    #[expect(unused)]
> +    pub(crate) fn new_writer(slices: impl IntoIterator<IntoIter =3D I>) =
-> Self
> +    where
> +        I: Iterator<Item =3D &'a mut [u8]>,
> +    {
> +        Self::new(slices)
> +    }
> +
> +    fn new(slices: impl IntoIterator<IntoIter =3D I>) -> Self
> +    where
> +        I::Item: Deref<Target =3D [u8]>,
> +    {
> +        let mut slices =3D slices.into_iter();
> +
> +        Self {
> +            // Skip empty slices to avoid trouble down the road.

I guess "Skip empty slices" is enough as it is part of the algorithm. :)

> +            cur_slice: slices.find(|s| !s.deref().is_empty()),
> +            slices,
> +        }
> +    }
> +
> +    fn get_slice_internal(
> +        &mut self,
> +        len: usize,
> +        mut f: impl FnMut(I::Item, usize) -> (I::Item, I::Item),
> +    ) -> Option<I::Item>

Let's document this a bit as its purpose is not immediately clear. We
can take the documentation from the `get_slice` methods, with a short
explanation that the closure is supposed to split the slice received as
first argument at the position given as the second.

> +    where
> +        I::Item: Deref<Target =3D [u8]>,
> +    {
> +        match self.cur_slice.take() {
> +            None =3D> None,
> +            Some(cur_slice) =3D> {
> +                if len >=3D cur_slice.len() {
> +                    // Caller requested more data than is in the current=
 slice, return it entirely
> +                    // and prepare the following slice for being used. S=
kip empty slices to avoid
> +                    // trouble.
> +                    self.cur_slice =3D self.slices.find(|s| !s.is_empty(=
));
> +
> +                    Some(cur_slice)
> +                } else {
> +                    // The current slice can satisfy the request, split =
it and return a slice of
> +                    // the requested size.
> +                    let (ret, next) =3D f(cur_slice, len);
> +                    self.cur_slice =3D Some(next);
> +
> +                    Some(ret)
> +                }
> +            }
> +        }
> +    }
> +}
> +
> +/// Provides a way to get non-mutable slices of data to read from.
> +impl<'a, I> SBufferIter<I>
> +where
> +    I: Iterator<Item =3D &'a [u8]>,
> +{
> +    /// Returns a slice of at most `len` bytes, or `None` if we are at t=
he end of the data.
> +    ///
> +    /// If a slice shorter than `len` bytes has been returned, the calle=
r can call this method
> +    /// again until it returns `None` to try and obtain the remainder of=
 the data.
> +    fn get_slice(&mut self, len: usize) -> Option<&'a [u8]> {
> +        self.get_slice_internal(len, |s, pos| s.split_at(pos))
> +    }
> +
> +    /// Ideally we would implement `Read`, but it is not available in `c=
ore`.
> +    /// So mimic `std::io::Read::read_exact`.

That's a useful side-comment, but we also need small sentence describing
the method, e.g. "Fill `dst` with the next bytes from this
`SBufferIter`, or return `EINVAL` if there isn't enough data available."

> +    #[expect(unused)]
> +    pub(crate) fn read_exact(&mut self, mut dst: &mut [u8]) -> Result {
> +        while !dst.is_empty() {
> +            match self.get_slice(dst.len()) {
> +                None =3D> return Err(EINVAL),
> +                Some(src) =3D> {
> +                    let dst_slice;
> +                    (dst_slice, dst) =3D dst.split_at_mut(src.len());
> +                    dst_slice.copy_from_slice(src);
> +                }
> +            }
> +        }
> +
> +        Ok(())
> +    }
> +
> +    /// Read all the remaining data into a `KVec`.
> +    ///
> +    /// `self` will be empty after this operation.
> +    #[expect(unused)]
> +    pub(crate) fn read_into_kvec(&mut self, flags: kernel::alloc::Flags)=
 -> Result<KVec<u8>> {

nit: `flush_into_kvec` is probably a more descriptive name, as `read` is
already used for the other method.

> +        let mut buf =3D KVec::<u8>::new();
> +
> +        if let Some(slice) =3D core::mem::take(&mut self.cur_slice) {
> +            buf.extend_from_slice(slice, flags)?;
> +        }
> +        for slice in &mut self.slices {
> +            buf.extend_from_slice(slice, flags)?;
> +        }
> +
> +        Ok(buf)
> +    }
> +}
> +
> +/// Provides a way to get mutable slices of data to write into.
> +impl<'a, I> SBufferIter<I>
> +where
> +    I: Iterator<Item =3D &'a mut [u8]>,
> +{
> +    /// Returns a mutable slice of at most `len` bytes, or `None` if we =
are at the end of the data.
> +    ///
> +    /// If a slice shorter than `len` bytes has been returned, the calle=
r can call this method
> +    /// again until it returns `None` to try and obtain the remainder of=
 the data.
> +    fn get_slice_mut(&mut self, len: usize) -> Option<&'a mut [u8]> {
> +        self.get_slice_internal(len, |s, pos| s.split_at_mut(pos))
> +    }
> +
> +    /// Ideally we would implement `Write`, but it is not available in `=
core`.
> +    /// So mimic `std::io::Write::write_all`.

Same comment as `read_all`.


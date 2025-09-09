Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3764DB4FEC7
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 16:07:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BB8210E779;
	Tue,  9 Sep 2025 14:07:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="c4e4QqGA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2052.outbound.protection.outlook.com [40.107.237.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6092D10E779;
 Tue,  9 Sep 2025 14:07:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MAiq2SPYDwWqj5kfzQwxF0G5Fpul687kS+KxBnHzTv+x6CNFx5c8mGf9Uf50Vftwu4/PQE455ZtO+ECfspa0SzLCmJxhlOP2mQiC83f0g5mJgiMeBQUW0F06LVik1ADMTv8MR2BbMo8EKlhz9rUzlAaJlq9rHvDijo9ef19RC83xzHeo5/GEHrSvDQntdSOV+kPUT4PUSNjMzIqFolwNfU4ZlqZmU0YrYa5ivSgftF19bc1aSQMM6Ux9pXnkY9lOahpI3SrPka8jZPshhV9Kog3WBMcX+thPXgM1nfz42p9CFQjvpZgetduginULr23f457XUVra3ISYwExWTfJnqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/oTkzzQkMQDEW8c6STwFRNckeRpx00U/OqHymbkgmI0=;
 b=nKFmv5HZUIWOA8K5hnedNLLZVVOhu8GCDKLtQVVwPbkFKxZ7oUdmGl8kRn5GdD/UZ80szw0OpruanWHxTZ9s/fg8IZmlwLUA/YcLED5/wd1uoj/PdUfQs+Ednx+lQsFc5a8+d+5Nitj19dtHEE6Pj3amXlbX20KTs7nja4H3NPj8iuoOEpdcfgIF89DdIhk6GhuUxP90y6A+3+2F87O2WAKYzqaGyE1/6fS4Geu+WxlKX/V/W4W2Z7NEa+lyUIH+BcE2iCUeTKrIHC81NSevW2aV3HSF9qwwtUhNpVE4UgAdHb8kBEo3VemqvqyJ9yjFynlIWk1eaei5elg8d2/tbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/oTkzzQkMQDEW8c6STwFRNckeRpx00U/OqHymbkgmI0=;
 b=c4e4QqGAkN75FpSsBAFmStkSwUaQVHlkAftH0cu/m4q71Z9Un9wB75i0JjaD21gJOWzC165nVtDsEWOwXWHowjl2RNmR+DpKo9Zd0xxjCn3cevOV4PsOVuCHBnDANQGg7VW1yZ107dPdm+l2w0x6asKA8bNMWVPwmdGY5ojQE5E3HVhGE8HAwHKswONvcdjdvJAGIi7cUHWZaFV8gq7uIzwr28I6vt5ztZEUubscHEV5NN6kd3fZ9hV4QzOrtU8OJ3uw/1gEt6WcXOrFhaT/GoiV+z6Bx6h+gUWK5QGDQFd0tTz5hEAOjx1DA96c9i+adGqEBWElu/+xZN6E5vn8OQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SN7PR12MB7978.namprd12.prod.outlook.com (2603:10b6:806:34b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 14:07:12 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 14:07:05 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 09 Sep 2025 23:06:41 +0900
Subject: [PATCH v4 05/11] gpu: nova-core: firmware: add support for common
 firmware header
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-nova_firmware-v4-5-4dcb433d5fee@nvidia.com>
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
X-ClientProxiedBy: TYCP286CA0146.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SN7PR12MB7978:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bee48c6-9814-40f5-c4a1-08ddefaa282d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TXhkem4rN0dUcHArRzVvZGQwRlV5V2F0NXRsSm9RUENlNHdpOEZobTlnYkFV?=
 =?utf-8?B?YkNpU2pNN3JqeDM1OFBVZXZXSThFVVRGQkE5b29FQ0NYNGhRaS9sQTY5bzl0?=
 =?utf-8?B?SEJtaUl0eG52RzkyR1poWTZBd0t3dmxFRTFBQ1ZjVEtXbE5TTHdERmRyMGVh?=
 =?utf-8?B?SVlCSW9NMVltc3hFNUtlY1d1aVBDT2NaS3kxY3RjNW5PRFJnRTAwWWs4NWpa?=
 =?utf-8?B?UVJRanZ2RldsMXZuNW9Hb2lvMnRSOEZLV25RRjZ0aUZZeUZrWVI4VStTS1Rh?=
 =?utf-8?B?OUVId1hhRTVGWGFjVGlpUmhVbzB1T01XTlBCZXdrTlRxeC95MmZHTjNaeTdy?=
 =?utf-8?B?QlN4TEtCN1JXUG5WamJueWZaMHAxQVBXQ2JucFlSZ3M3TFFNVnRoQnZHdzhW?=
 =?utf-8?B?T3JDeGFRZTV5SVV4cTEyb2ZlVitVS3k0YXNWTS9HL1dGalFPNlUwcjlyMHBO?=
 =?utf-8?B?RUptbzg1L2JVN0ZJR1Vhdmd3UnNBNU9pVkpwM2dWcjcxb2dma2h0U0JsRXpr?=
 =?utf-8?B?aEllZDVNK3RKVDBxUlJLRElIcG9rZFkwUC9Mb1pUaGNQMkRrODdJdXByN002?=
 =?utf-8?B?MkxobGNWdURMOFdrUUFMMnpqek83NzRmQUlSYnNlVkt0MXBPQU1uWis2NmRo?=
 =?utf-8?B?dXU3ZnBkTVlxN1NyQzRDUzcxcDVWS1lMTUlIeXZZL2t4dS9WM3ZYVURpNUlp?=
 =?utf-8?B?UWl5Rzh4YzJVVkEwSzhFa2lKc0JxSDIwNm9YU0N4VjhhNG1VSTBhNEJHNDNt?=
 =?utf-8?B?V0twUTlKbThWVDJxcXZ3M0RjbWNoVHZoT3c0c2M4cllwNEI3SENsVW5kU3c1?=
 =?utf-8?B?bjMyRi90VlBoSVNFbm1nMXZtdjdqR2QvYjdQc2J2YVdHY1NXdlByZlQyY3NB?=
 =?utf-8?B?Uk5hMmNVSTNPVlBHb3ptckxzNFcvZHJBSy9uV0VMcFc0cit2cER2cDY0VVpY?=
 =?utf-8?B?cnYzbmJ5WWNiQmtITC9vL1JzeU1FakxQQ2pWQmdOSm9YeDJVb0dnNjl5RFcx?=
 =?utf-8?B?dXhEN3Eva3U2aHp6dTRqM3NScjVmWG9ZNTgrQzB3bEQvZWxzcTU1R3JCalNw?=
 =?utf-8?B?cWs3cXc1NmgxcFg1ZWhoSW1WMkVJaGxUVk54WTdmZXVBVkloSkxwVlU2VVpT?=
 =?utf-8?B?bXNoaFJ1ZHpYZXdFcWVQb0YvbkZIaElwV01VQW9vOHFFVnhMeHNnYmhnMVN3?=
 =?utf-8?B?MkFFWjh6d0ExSmZhT1JhaUFQaEIzbGl5bGZSMHBJeGxwbnFySXZsbTZEbDZH?=
 =?utf-8?B?ZENKOU9MbW9OWXZicXYzWGhrZHlTZHFqUWo2MitkSE5wdGtYcVdRdUhOd0hQ?=
 =?utf-8?B?a3luS05CcTllU3dBZHFFazU0eEY0MlRGdFJCNVYyVGxGdFM1bVBUQ3RWN3Y5?=
 =?utf-8?B?aDhyUzFESERxNjNZdFhJRzlxdnU2cHdUY0RpNWdsWE9oeUszZzVWTEt6QUkx?=
 =?utf-8?B?c3BIMlh6UjFKNEwxb0RNNHhNS2h5WDdMYklNWHlmb2hFVm5xaGNubDdxS09s?=
 =?utf-8?B?QWhDcHNBSG5BT2Z6a0pub1BhQ21EN0xNb2pVQ1VIK0hRcFFxd0QyR1dOYnNm?=
 =?utf-8?B?SitzMERKaFpIR0ZnWWhpbkl0ZmNsbzNHUWE4ZUxzSURZRm95YU95TVFneW4z?=
 =?utf-8?B?SkZrNDl1YTF2SHhDR3AxWFVVZ2N1bVQ4TEpBaGRZb1BaUXoyWWtBL0dWRU9v?=
 =?utf-8?B?TlpMQ0ZNalI0YUl0cnM5aG1Vc3liY3pRN3E0TjRIQnVYQ1ZhVlU4YjZBS2Rn?=
 =?utf-8?B?dWhhSlpib1BFdXNHRU9ES1JqdWRoK0VGNXcwYzRNWEFzZnVBQTViL2tmd25s?=
 =?utf-8?B?VzRuejNZZWNLK2gvZHI3MFNxaUZjaG5EZ25TaFlwWlhXNjJvZXd1V1pBTVU3?=
 =?utf-8?B?NEN3SnZCdXhqSmU1ZGd4ajlrVHFhekhYME9yMm5hdDNZNkNKaCtjalJXTE5K?=
 =?utf-8?B?THI3cnpYNHAwVDZRQmJ4dUgrSm1oMkhBYzNqakRDbm0rQzkyS2RDZENPR0xo?=
 =?utf-8?B?b2FXUEM5TnNnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q1JxYnQ1Z0t4c2tOWE5ZZXUyNnNtTE1PdEF4OEo4V3JnUEtVa0hQZHA4SlBw?=
 =?utf-8?B?M1J2Qk1hRm5SWHU4Z0xVM25ITEE1RnhTdjNpQmpJUk1aTlphQ1dtRXcvVGFj?=
 =?utf-8?B?QXExMkdQSkxreHI0Q00rbjhsTlhjTDNvMWdpckJWZ2l6c1VpdnF0VlNtdnhM?=
 =?utf-8?B?ME1KQ3hJS2Y2MjNOOUU1TWNNTWU0Q0RSUWppZVdVeTlSQ29XcmZkYjJQSFVC?=
 =?utf-8?B?T0FZZGllTVNFU0V5TnI3OU5kVzQyY2MzRXJ6RjdhT21WVHUvdmlWT3AwS1N1?=
 =?utf-8?B?TWpnSEp0alFKclZIWjRTNWNTRE9ua2NzVzZPRXBpUVl6TVY0WlROWnA1N3hC?=
 =?utf-8?B?eUR6aWg4QnM4ei96cW5GUGdOM0dMQXJVVjFYQ0FQVTl0TkpQUXA0anJocFow?=
 =?utf-8?B?em1Vc01SNkxXMjUvditzQmZyWE5McTVvSlZGRGZ5V3Q2aFhienBCdTJPbXhp?=
 =?utf-8?B?YW4zQXp3STZtcklvTEMyQ2kxZEkzY2VTZE1RUmZsSGxYenZOYWlqb0MxdXcx?=
 =?utf-8?B?dnZWTkxKT1BLci9jdFF1dWo0bGp2SkZ2bDU5KzdoVHE3QVJqQ0NHOUR3T0xR?=
 =?utf-8?B?UDc2TklRa3hXZmhRVFlCNlc0MmhVQnBLcVBBVDBod1VLQ2pEbm5pRlg2RnVi?=
 =?utf-8?B?MzRMNlNmRlpsZVZ2c2NYMUF4NU02WC9lVnI3NVVkbDZuWUJQdDBEcG1aQjEx?=
 =?utf-8?B?WHdIeUFmSm9kNUhlazdiVk9qSEFkQU83L1QwV1liZ2hhYmFzT2NlMFFqV0RK?=
 =?utf-8?B?RTcvUnhzS0tONU9FZHRRUmRLbkFKeVlVQjA5K01JUUlmQmgxOVJVc0FpcURM?=
 =?utf-8?B?amk0SENTc3VpMk1aTXZZYlFMMW52b0lCWmwvZ1hTNGMyL1VjcVUwMjdLRXdt?=
 =?utf-8?B?dkptSC85WVRUdTN4ekdvMldSOEN0OUtYbFJDcVIvYjY3NTJScTJXRTIyWkJ5?=
 =?utf-8?B?aVhFZkxOQ1oxc29yT2pqeXV5VzB2YmRFeXRLMmt0NXhESXlkR25iVFVzWUw1?=
 =?utf-8?B?T3dYRU9rTVBoUlBJb3JZZ1V4R21mUHlYalBRVktoUlFnNENuaUZqRFJIRnMx?=
 =?utf-8?B?RkpuRlJMNnAvZXZNVDNhVHNueHJTcUc3TTRWTFdGNFhFZ3FSenlzQ1NPdU4z?=
 =?utf-8?B?c3pVQnpMZERkdDl1SFc0cloyUURjQ0NOM1R5ZUFFNS9yTEFwWmdmaTU0ckgz?=
 =?utf-8?B?QkNncjBtbXJTbXVEZ3AzZXo3U2lFV3Fxc3RrOTBmQUE3aWhIMStMZ2x1dVA0?=
 =?utf-8?B?djM5djQydmlFTlJ3Q2h4WVJ0UndyMlluL0pzamZBQ0lhcnRTR3d3dXRldE9y?=
 =?utf-8?B?SEJpSFJZR1ZPWUl5TVR5K0dQYThrOTRKZFJkbUkwS1Q2SFNIa3g2Qjc4ZFBw?=
 =?utf-8?B?OTdpUm80QUhQZUpuNTh3RG5GY0Jlc2dXVlM2czA1L3NibVdQU0dNd0JyVHZB?=
 =?utf-8?B?Sm1aVlJvcWFBMFhYVm4wa2d4b3pxYk04TUFxTWJTdFJCYWRya3k1bjFYb0JC?=
 =?utf-8?B?VHpQeTUwbklrdXhPZ3dJYzRid3p5d2FZQXVGVXpvcFdjUkFoNnRnWW1FME1X?=
 =?utf-8?B?aUJBQUZRUDZ2SzhHMUpIYjRQU3VVazVkNlBqdHBNZHVNQUsrYnJXUURBazdM?=
 =?utf-8?B?UC83UHJML3gvbkJHUWRqTE9rdm9RRDFqTmFmT2hmM1ZjL3k5cGFBdWtUR3Fk?=
 =?utf-8?B?bVFRbVZQRTh0MjR4WFo1RlR3ZmhtYThCdUVMNGwzaXBVRG9LbWVjZndlZGRE?=
 =?utf-8?B?enRZd2swYzZrUElaKzd3M3JyK0k1OXJVWUZjOGtmbEJxT2xkSHpwaFo5eHFC?=
 =?utf-8?B?c1paUVEwRWdlVkRNYTJnciszY1Uvd3FUNFhhaTNZODM0ajNCbDlMVWg4alpw?=
 =?utf-8?B?RnNYNkF0K2FLRjh6OXhLdVZEejY1RzR4NUxhUFJhVi9iWGEyUUdTZGlwSG4x?=
 =?utf-8?B?Y0NyRWtLTU5vOVVZL2Z5c2s1a1RQSGVtNHFTeFFmZzJVOWNCTVNLd3d1NGsv?=
 =?utf-8?B?SFBVQkRHc2Vza1hyeHArVnBOdjkzdkFzODE2d3dQdU54cFVWM2dUM2d3OGhD?=
 =?utf-8?B?SlNSWnI5WWFjZTYrZTJFR3ZDeG1rUFdLQkJoZUc5SEovMHYzb1VlMXJrZTU1?=
 =?utf-8?B?L3ZVR3QwNzRMRWMweWk4QUJudmh2eDFUMGRoTXQ0UlVFWER6aU56V25YbmF6?=
 =?utf-8?Q?6RvLe/Oa8otwaJY/tkd1FVKtEoLlbIpSfFZi+OEutP2/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bee48c6-9814-40f5-c4a1-08ddefaa282d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 14:07:05.5106 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B+3hTfqnSUHEAED4EDjibjVq5/6slBO2nfkliy/2nBNo2QP4GJZ2a0LZI+QoPG45FJPNX9oM+ha3a9ezp4OZhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7978
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

Several firmware files loaded from userspace feature a common header
that describes their payload. Add basic support for it so subsequent
patches can leverage it.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs | 62 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 4e8654d294a2205ac6f0b05b6da8d959a415ced1..32b685c8757b1106084577c2cc7d5ef6056c1c64 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -4,11 +4,13 @@
 //! to be loaded into a given execution unit.
 
 use core::marker::PhantomData;
+use core::mem::size_of;
 
 use kernel::device;
 use kernel::firmware;
 use kernel::prelude::*;
 use kernel::str::CString;
+use kernel::transmute::FromBytes;
 
 use crate::dma::DmaObject;
 use crate::falcon::FalconFirmware;
@@ -156,6 +158,66 @@ fn no_patch_signature(self) -> FirmwareDmaObject<F, Signed> {
     }
 }
 
+/// Header common to most firmware files.
+#[repr(C)]
+#[derive(Debug, Clone)]
+struct BinHdr {
+    /// Magic number, must be `0x10de`.
+    bin_magic: u32,
+    /// Version of the header.
+    bin_ver: u32,
+    /// Size in bytes of the binary (to be ignored).
+    bin_size: u32,
+    /// Offset of the start of the application-specific header.
+    header_offset: u32,
+    /// Offset of the start of the data payload.
+    data_offset: u32,
+    /// Size in bytes of the data payload.
+    data_size: u32,
+}
+
+// SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
+unsafe impl FromBytes for BinHdr {}
+
+// A firmware blob starting with a `BinHdr`.
+struct BinFirmware<'a> {
+    hdr: BinHdr,
+    fw: &'a [u8],
+}
+
+#[expect(dead_code)]
+impl<'a> BinFirmware<'a> {
+    /// Interpret `fw` as a firmware image starting with a [`BinHdr`], and returns the
+    /// corresponding [`BinFirmware`] that can be used to extract its payload.
+    fn new(fw: &'a firmware::Firmware) -> Result<Self> {
+        const BIN_MAGIC: u32 = 0x10de;
+        let fw = fw.data();
+
+        fw.get(0..size_of::<BinHdr>())
+            // Extract header.
+            .and_then(BinHdr::from_bytes_copy)
+            // Validate header.
+            .and_then(|hdr| {
+                if hdr.bin_magic == BIN_MAGIC {
+                    Some(hdr)
+                } else {
+                    None
+                }
+            })
+            .map(|hdr| Self { hdr, fw })
+            .ok_or(EINVAL)
+    }
+
+    /// Returns the data payload of the firmware, or `None` if the data range is out of bounds of
+    /// the firmware image.
+    fn data(&self) -> Option<&[u8]> {
+        let fw_start = self.hdr.data_offset as usize;
+        let fw_size = self.hdr.data_size as usize;
+
+        self.fw.get(fw_start..fw_start + fw_size)
+    }
+}
+
 pub(crate) struct ModInfoBuilder<const N: usize>(firmware::ModInfoBuilder<N>);
 
 impl<const N: usize> ModInfoBuilder<N> {

-- 
2.51.0


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4027A947B7
	for <lists+dri-devel@lfdr.de>; Sun, 20 Apr 2025 14:20:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEA7510E311;
	Sun, 20 Apr 2025 12:20:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="A2ZPPiuM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2042.outbound.protection.outlook.com [40.107.223.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FF1A10E2E7;
 Sun, 20 Apr 2025 12:20:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xjRhqYiQV7beFwXE9Yfwl+VmrOhc5LJYPdhh36VyU8xMipl3kV2BmIe1G0p2l7RV8lHyG9INEksxHcTkouZnaW7QXcoF4tLNIe/2n7NdcbkfWCWEbcq9jTKzcMmb2rJUmhlYGvdrr59EoFFw69dVttG2VjjiMkRFxDv4EoivKjEA7o+Y5jCmHVvW1Ti/SE22dWL9Y4x5cP50LuBMN7XyFpawTDijWqSajfEkfZnqnR0k6BGyit0soa140PungG/MQO7GfS2YgRUnEP7YoTyiLXUJGduPagXX0sxFrPqR7XzaEYRYw4BROF3KpvrA7YTxqZ7whdtziv1RQhMUwCleng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Ql1lYeRHY1dobye17TC16ndoIcge+inHoRuMR/cpg0=;
 b=QI2Q/wraKiAxHdTF6GB1adfKqiJjEmdEwVleeK4Av++uFpUtIU1lmrf1tWnJ4RiDjIyBHEjxNMpbTj34AadWqvGbGNt2g/0XOev1+MRsOp9K2iVQnDhha5C6Xgp82aiub2J9VF0IEPt03WjydZoIwUQEFwwzBsO4qSiFrSC7WJ/zMYBgAlVGEXOudIIli5/y81esW5SuaaQCmxOJdirYCMZginCGqQf1vHtxeIwWEUhbIQfD1oIQIJeEp48Pe9RPIUjQnIEZYGeOiT/zKE4CrvpgF3+jfqKPuWnNVJay90x/2DXFq0JVr9y+p2keiQQggCpie/i+OSKy9VgtdpJr0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Ql1lYeRHY1dobye17TC16ndoIcge+inHoRuMR/cpg0=;
 b=A2ZPPiuMGyjMxQhV4OCX1Yto/RjPd7ehkeWP+AXvDH7TF9D98LfDEQznTBdchysk1qX3vK58rHOB5TFbp7/IudIu8w945LMDjwrP93Wovjh27OdOQcKlhwiN/HPOIPKrSRVX8GJhLDegBbb0BAA6eo7NeyYfZ5A1gkFdJ9LetubYwbPfp0iIufWcHb9R4b50wuz2FeQEidhm0S5l1s24LWZqShfrTpTBUHHC9/RqPm0Ph93/LWEqFPMjR6e4MughYBlgAt9s4n7EIqlsnWGxT4y6fJiVKsfyicSobV6JuR2NchJLKyPQ1Irpz+YFud5OIu//gdg2XVnTEUw9NdPbvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB9175.namprd12.prod.outlook.com (2603:10b6:510:2e6::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.33; Sun, 20 Apr
 2025 12:20:27 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8655.025; Sun, 20 Apr 2025
 12:20:27 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sun, 20 Apr 2025 21:19:43 +0900
Subject: [PATCH 11/16] gpu: nova-core: add falcon register definitions and
 base code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250420-nova-frts-v1-11-ecd1cca23963@nvidia.com>
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
X-ClientProxiedBy: TYCP286CA0082.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB9175:EE_
X-MS-Office365-Filtering-Correlation-Id: e9d8e2e0-fdd2-43e0-e543-08dd8005bbab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|10070799003|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SkY5elk2TllNc1lESkZIYjVCS3M0d24xMlhBdVNiT0x2L0xab1o4TWpIVGVq?=
 =?utf-8?B?WHE5MVVQa0xPR2ZTYkFZcjRJQ2Y5T1NpbUJmZzVVWFUxS0ZteVhnb05la2xV?=
 =?utf-8?B?d3VHRjYxM0Nja2hWaUw0bTJLZy85OTJ4N3Q5OEVKWjZwWnZjZFU5dkFCaDJH?=
 =?utf-8?B?Z3VrV3RFaUNPUzl1bGt4Nk43dlFlR3pCd25WcWEvRU5LZ1BCdkxEc1lBODF1?=
 =?utf-8?B?QmMvODh5amNQVmNGRmtPeWdtL2JZdHZVbDBhR2VFZFRKQ0N4TERNK2JNQ28v?=
 =?utf-8?B?R1dVOHBYakNHSURTdnhLM0NDdmNlblRvRHh6M0hManQxRTRjOVFDckk0aVNw?=
 =?utf-8?B?RGpkdXlhR0tzeVA0NnNnU1lmNDAySmtKbjZxTWljRmU4UHk2eTZjcEdlUmwz?=
 =?utf-8?B?K21XaFJ1bWUwT01IUGhZN0NDNEpoeGJlZXllUS9rR1BoMzAwSmU3djZ3TC9D?=
 =?utf-8?B?SWJvbE9kZW55Nmtkdy9TVDRiQVZMWDUrU1JxdkJzeWFsY2RHd2R1c2hmT0o4?=
 =?utf-8?B?RnV6VXphN0Nuamc0S2J2UWRpeXh5cTA5Q204SlZubm9vdUhJREJYbHVjMzVa?=
 =?utf-8?B?VWFxemovRUNJNTNkbXgwamFLbkZ6S3pVM041Zk5KRU50bUpNaUUrSDZRUS80?=
 =?utf-8?B?NXBPbWxrelprS1U5aDhuNGpEdnp3WlN3eE9LbXlkTXFJSFYxbmFpYjZyMGhD?=
 =?utf-8?B?RmtOZyt4THhZZVpRMEUvL0dJQlNkamduVVJQaHVQcGNrZWpOdWEwQ2dlM2JE?=
 =?utf-8?B?OVFQVXBBVzVFN1dRMjhqbHVQTVJFdXpoaVAvSVliZTMzdi8xTGJNb2Q2R3JI?=
 =?utf-8?B?VCtJbWRvSko4MnRDZ2hVa2dDdkYwU01SMDhUekw2K3hwVjA5ZXRCVnk2R3NQ?=
 =?utf-8?B?M1lsK2hCQ3JreE0rRmNWUWxrVCtLQlYyUXFobmhmN3VFcFkyblI0SEpJUHFh?=
 =?utf-8?B?T0RnTzRGOWRleGNCOUliYnVFMGNhZzlxYlNYK2Z3bEtneUtxb2dibUtTT3Br?=
 =?utf-8?B?QnUzVS9YcU8wcm9NOFUvaVhzZmwrMGozWUVyVXRNUjZ3aCs2R3ppNGh0SllI?=
 =?utf-8?B?QXorM1hHa3RPMS93Z3RwcStMN1JOWVV5RXFGaUgzZnJYblFJS0RoVHpybnZG?=
 =?utf-8?B?N2JsZ0UzSUQrOUZqQ3RqN0FrQTRxbUNnL3lJWXZGcFVVQ05KSFhuVHdhMElx?=
 =?utf-8?B?VjlTQTFKdDZNaEIyY0Y2MEE1ZjhJRjdqRWNjaWV4UXRsWU9SRTQxNmg1MWFs?=
 =?utf-8?B?TjRwNG1OZnppc3Y1emF2ajdSODBVdlh3RGV2eGcxb0FoL0NycU5Jb3psdDh4?=
 =?utf-8?B?QTlmaXhnUkQ4Y0QvMHQrSUVONGExWUxJSHZSVDY5cGlvZTlYVDlrZWt4SVVV?=
 =?utf-8?B?ZXNTTVlCck5PcER4cW5GSTZUY1duQ0FDdzNjcHMxd205dXd0ZWxSb21pR2sw?=
 =?utf-8?B?ZHdBSC9IVFN0ckRLdnduaExlRVVFTE94ODlyOWVXNTloaWpDa2dCYVA3Qml6?=
 =?utf-8?B?RVg5L0NjcjNGcXRPYUpsYWp2WTFZelpIeFpEQ1c2NmtVdDBIbU41U2xQLyth?=
 =?utf-8?B?eVFrVmpqc2M0SDMvK1hCUFVKV3krUTdIT2NwS2hXT3FObWRTdmg3VisrUXBz?=
 =?utf-8?B?dm9YMktBczVZNUlkTGtpV0lOWThvUC9GUCs3NmJoY0xpaURSUzJXRm5tdEc0?=
 =?utf-8?B?TGlldW9mR3V5dlFNT1RtT2pDTUpYT3pwTGVLUGJ2dzNXdXBvRm9NeUEwZ3lv?=
 =?utf-8?B?Zm5MamRRc2xRdnZsQ3FKTTQ4Nk1GbHptWVN5Qk5uZ3lLTnNCOE5QaUNpbndy?=
 =?utf-8?B?TVNid3JSeFpqd2RxQWFTeHhoVE1oc3VianlMTFJwTVJiWGxXNTVrV2JwZnhE?=
 =?utf-8?B?SEt2NGdjd2YrMERpaGxuR3N4bHpKalJNNnJOalhNVG9Sa2xORXQyRVIycEZU?=
 =?utf-8?B?OXpMNjRZR3FqelM2cWZYK3JMRXN3UWFCM3BielY0M3l5UGM3NzJZRWRkc0Zu?=
 =?utf-8?B?RnVZVFc2MmJRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(10070799003)(1800799024)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QkJWbmdDRVFzRnNZd2tJUzVTb2FuZUhYM2VxbjV0OVZEWWFTVTdzMkpLdThs?=
 =?utf-8?B?NGt4N3lRMmZ4dEJVMyt3dVREeStKQXRNbFQvV0NSNGl3aisvcVo2cVlpdGtX?=
 =?utf-8?B?cWw4dTZmWUdOeExIZ2pOcDRUSzNvZ1oyNjFDeUN2TEZ1TVZKYWNnZjZMSnU0?=
 =?utf-8?B?WHB5Y3Jwd2dFb1p4Q3dzb2hENi80cWtFVUZ5bGR3amI2elZKNnFiQVJKTUN1?=
 =?utf-8?B?OWVaQmhkYXJ5eXNFN082b053OGxmVlg3V3Y4SFY0ZHdaWEhlYi90Sm5WWkF4?=
 =?utf-8?B?N29sUi9LbGQ5c3dCNitCdDI1ZDJWUHNJQVlMZ3ExdnBYYnFZN1R2VzNobG1Y?=
 =?utf-8?B?dWtRTTdSSzZucVZHaFhLOGd6WjRVLy9aSzlGcHFGZDhYY2R4ek9NbHZSY3Vk?=
 =?utf-8?B?K09ISndaOTk3M21tdjBBZ1dJaVZaUWxkV0k5eENhRjQrQzRDcCtIVEZLcms1?=
 =?utf-8?B?U25GTGxwd24xT2c3MUx0KzV3TzNwaEJwdHdEcm1SWmFRcWZsdDRidVhkUTdJ?=
 =?utf-8?B?TEhnNjlKOVE1dUhNek1rVjl5QXJCNHBXck42dlcyd0ZxVW9WQUo2T21OeFVO?=
 =?utf-8?B?UWxhaUFWV2NGTE1sd1RmdnA3Rk84SUFBTHI3WG1MdXRJK291eDdTaDBVV3Fz?=
 =?utf-8?B?VmxwV3JHQlg2eUFBZFFZbjJiUWI0RWdIZ08xdTV1d1Z3MXFnZCtsdWdNQ2lF?=
 =?utf-8?B?K3ZPNklCdTQ2cVhScG45TUlvQUNkVzNlczhuODd6bEpuVWVuZ3RYUUJwZ21z?=
 =?utf-8?B?cDFPWXhQaWRvZWd2aTZEYXQ3ZEFlU0o0UTFNZ3JQdjFMY20vTnRkVUFycW05?=
 =?utf-8?B?TG05UnNlNlFnYjZMS2xWZ2dRL2VLU081cW51OVJVN2ZXLzNPVWpwbEszVWdw?=
 =?utf-8?B?ZGxaRnlJNnhNRG9iTDRWem9NSUNieHkvRk5rWkFUSmtieEpWbGhwY0VFeGxC?=
 =?utf-8?B?V2NqUDZTUzJzNXZwZVBtWU5MbS9nSnZGQTJIbXMydlhzMzZkUHV2VlpobmRy?=
 =?utf-8?B?SkNReURNZngzRlRCclkxVWJVenJMc2lXbXJLNlVpYXpSTTA3L2phakJSTGRB?=
 =?utf-8?B?OVl6djQxNDNzcDdvT2xYeEFIMzlWUlBQSkJCZUFSZVZTdDM5QjdDcyswc1Y1?=
 =?utf-8?B?cGpjZnlkSzBLWm5wak8zbjMwT1o2cHFsYlUwSFlpMVNBcnJmTzFQRnMxbk5X?=
 =?utf-8?B?R2liN0FIbDdOUXlWdytmSW9DaGtRaTB1bnBSOFhzZnYxVjhPZzhUbVRKNjZ4?=
 =?utf-8?B?dVNYR2FnMkp1M0swVGhlR3c1QUw1eS9TY0ZpQU8wL21TdTdlOE01STJseW9r?=
 =?utf-8?B?c2h4Q2FzVjBkbDA0SWtZWk1XQWdoYnQzZzJNZU5pcjN4VjJVK09zeUo3NE9a?=
 =?utf-8?B?ekMzV29yUXQ2aGtGK2JTTmtsSmpMeDNsb0N0cVltZEZLMWVoMkZYRnZtbHFY?=
 =?utf-8?B?OW5yWVE3NzVERC9jV0RMRzhaQVc5d2lLRmxSaGNxWXFFclZJWm1VaWtTbUlE?=
 =?utf-8?B?V2VDUzM5Y0lyNmkrL3hXWkozRzFtNks5bkhRQld5VWxHWldIOXhzSkpadGdX?=
 =?utf-8?B?dkg4ZnhtWXZZTU1yT2pTSW1GZ0VyYnpLaFRLeXl1TjZmMW9MMFlYT2tBcVFQ?=
 =?utf-8?B?TS9INnZic1AzZ0xGbVU0cUM5Rmx5a2o5NDFQMUYwS2w1cjFOY1BNNzQrWU5y?=
 =?utf-8?B?WDM2Ky95YVZCME05N1M5QzFvdk1hajFBK2pOTFFRcEFDWmFXSUNLRnFFU0NN?=
 =?utf-8?B?UkpqMWhoQzhzdkwvZm0rVGZyRWprbU9WaEpob0czeXhnaEZzWjViNXZpVVBL?=
 =?utf-8?B?OUVjbEIzY3RMUTliMXRET2Z4L3BZRzk1emRiWmdod04yditGQTFNb3B1Lzc5?=
 =?utf-8?B?TTNMbVBQeUx1dmpVRitQYjJZa2sxdllBcUNWRmtmM3J2U3VhT2oxOFNVTnMx?=
 =?utf-8?B?VEtWeW9LV3lhKzB2T0Q3QzdGeVdnaG5iV3Y0ZktPdzJpWHdKdHE1U2dWS05U?=
 =?utf-8?B?NEVIYWR0WTh1Z3dJa0lXMytKc2JzQ1UxU2tWS2FHaHJBTUI4YmRWVDk2aEg3?=
 =?utf-8?B?Y0Y5SE8rWHozMzJRSGpuUjRjSXYveDFlb1M2cmRMcmNBTDFLWHNrdVo5a0t0?=
 =?utf-8?B?SjJCSk9hUTlzUnNRVWRHOUpLMlduL0hZNHVlcjlSVzd3bXNPY1FpV3h5STBt?=
 =?utf-8?Q?burYO7YSuhzlR5UIbdWgB3hq7c8IDswrSxG/NssuJTDL?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9d8e2e0-fdd2-43e0-e543-08dd8005bbab
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2025 12:20:27.1070 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d/UGVhQo0AqqQGam0NrgIoAuXSFiB/q4rKWeZcjr18tg5iFRhDuxZZCdMPuhospjSyBAmcLX1CTHMqSt/R51WQ==
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

Add the common Falcon code and HAL for Ampere GPUs, and instantiate the
GSP and SEC2 Falcons that will be required to boot the GSP.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs           | 469 ++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/falcon/gsp.rs       |  27 ++
 drivers/gpu/nova-core/falcon/hal.rs       |  54 ++++
 drivers/gpu/nova-core/falcon/hal/ga102.rs | 111 +++++++
 drivers/gpu/nova-core/falcon/sec2.rs      |   9 +
 drivers/gpu/nova-core/gpu.rs              |  16 +
 drivers/gpu/nova-core/nova_core.rs        |   1 +
 drivers/gpu/nova-core/regs.rs             | 189 ++++++++++++
 drivers/gpu/nova-core/timer.rs            |   3 -
 9 files changed, 876 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
new file mode 100644
index 0000000000000000000000000000000000000000..71f374445ff3277eac628e183942c79f557366d5
--- /dev/null
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -0,0 +1,469 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Falcon microprocessor base support
+
+// To be removed when all code is used.
+#![allow(dead_code)]
+
+use core::hint::unreachable_unchecked;
+use core::time::Duration;
+use hal::FalconHal;
+use kernel::bindings;
+use kernel::devres::Devres;
+use kernel::sync::Arc;
+use kernel::{pci, prelude::*};
+
+use crate::driver::Bar0;
+use crate::gpu::Chipset;
+use crate::regs;
+use crate::timer::Timer;
+
+pub(crate) mod gsp;
+mod hal;
+pub(crate) mod sec2;
+
+#[repr(u8)]
+#[derive(Debug, Default, Copy, Clone, PartialEq, Eq, PartialOrd, Ord)]
+pub(crate) enum FalconCoreRev {
+    #[default]
+    Rev1 = 1,
+    Rev2 = 2,
+    Rev3 = 3,
+    Rev4 = 4,
+    Rev5 = 5,
+    Rev6 = 6,
+    Rev7 = 7,
+}
+
+impl TryFrom<u32> for FalconCoreRev {
+    type Error = Error;
+
+    fn try_from(value: u32) -> core::result::Result<Self, Self::Error> {
+        use FalconCoreRev::*;
+
+        let rev = match value {
+            1 => Rev1,
+            2 => Rev2,
+            3 => Rev3,
+            4 => Rev4,
+            5 => Rev5,
+            6 => Rev6,
+            7 => Rev7,
+            _ => return Err(EINVAL),
+        };
+
+        Ok(rev)
+    }
+}
+
+#[repr(u8)]
+#[derive(Debug, Default, Copy, Clone)]
+pub(crate) enum FalconSecurityModel {
+    #[default]
+    None = 0,
+    Light = 2,
+    Heavy = 3,
+}
+
+impl TryFrom<u32> for FalconSecurityModel {
+    type Error = Error;
+
+    fn try_from(value: u32) -> core::result::Result<Self, Self::Error> {
+        use FalconSecurityModel::*;
+
+        let sec_model = match value {
+            0 => None,
+            2 => Light,
+            3 => Heavy,
+            _ => return Err(EINVAL),
+        };
+
+        Ok(sec_model)
+    }
+}
+
+#[repr(u8)]
+#[derive(Debug, Default, Copy, Clone, PartialEq, Eq, PartialOrd, Ord)]
+pub(crate) enum FalconCoreRevSubversion {
+    #[default]
+    Subversion0 = 0,
+    Subversion1 = 1,
+    Subversion2 = 2,
+    Subversion3 = 3,
+}
+
+impl From<u32> for FalconCoreRevSubversion {
+    fn from(value: u32) -> Self {
+        use FalconCoreRevSubversion::*;
+
+        match value & 0b11 {
+            0 => Subversion0,
+            1 => Subversion1,
+            2 => Subversion2,
+            3 => Subversion3,
+            // SAFETY: the `0b11` mask limits the possible values to `0..=3`.
+            4..=u32::MAX => unsafe { unreachable_unchecked() },
+        }
+    }
+}
+
+#[repr(u8)]
+#[derive(Debug, Default, Copy, Clone, PartialEq, Eq)]
+pub(crate) enum FalconModSelAlgo {
+    #[default]
+    Rsa3k = 1,
+}
+
+impl TryFrom<u32> for FalconModSelAlgo {
+    type Error = Error;
+
+    fn try_from(value: u32) -> core::result::Result<Self, Self::Error> {
+        match value {
+            1 => Ok(FalconModSelAlgo::Rsa3k),
+            _ => Err(EINVAL),
+        }
+    }
+}
+
+#[derive(Debug, Clone, Copy, PartialEq, Eq)]
+pub(crate) enum RiscvCoreSelect {
+    Falcon = 0,
+    Riscv = 1,
+}
+
+impl From<bool> for RiscvCoreSelect {
+    fn from(value: bool) -> Self {
+        match value {
+            false => RiscvCoreSelect::Falcon,
+            true => RiscvCoreSelect::Riscv,
+        }
+    }
+}
+
+#[derive(Debug, Clone, Copy, PartialEq, Eq)]
+pub(crate) enum FalconMem {
+    Imem,
+    Dmem,
+}
+
+#[derive(Debug, Clone, Default)]
+pub(crate) enum FalconFbifTarget {
+    #[default]
+    LocalFb = 0,
+    CoherentSysmem = 1,
+    NoncoherentSysmem = 2,
+}
+
+impl TryFrom<u32> for FalconFbifTarget {
+    type Error = Error;
+
+    fn try_from(value: u32) -> core::result::Result<Self, Self::Error> {
+        let res = match value {
+            0 => Self::LocalFb,
+            1 => Self::CoherentSysmem,
+            2 => Self::NoncoherentSysmem,
+            _ => return Err(EINVAL),
+        };
+
+        Ok(res)
+    }
+}
+
+#[derive(Debug, Clone, Default)]
+pub(crate) enum FalconFbifMemType {
+    #[default]
+    Virtual = 0,
+    Physical = 1,
+}
+
+impl From<bool> for FalconFbifMemType {
+    fn from(value: bool) -> Self {
+        match value {
+            false => Self::Virtual,
+            true => Self::Physical,
+        }
+    }
+}
+
+/// Trait defining the parameters of a given Falcon instance.
+pub(crate) trait FalconEngine: Sync {
+    /// Base I/O address for the falcon, relative from which its registers are accessed.
+    const BASE: usize;
+}
+
+/// Represents a portion of the firmware to be loaded into a particular memory (e.g. IMEM or DMEM).
+#[derive(Debug)]
+pub(crate) struct FalconLoadTarget {
+    /// Offset from the start of the source object to copy from.
+    pub(crate) src_start: u32,
+    /// Offset from the start of the destination memory to copy into.
+    pub(crate) dst_start: u32,
+    /// Number of bytes to copy.
+    pub(crate) len: u32,
+}
+
+#[derive(Debug)]
+pub(crate) struct FalconBromParams {
+    pub(crate) pkc_data_offset: u32,
+    pub(crate) engine_id_mask: u16,
+    pub(crate) ucode_id: u8,
+}
+
+pub(crate) trait FalconFirmware {
+    type Target: FalconEngine;
+
+    /// Returns the DMA handle of the object containing the firmware.
+    fn dma_handle(&self) -> bindings::dma_addr_t;
+
+    /// Returns the load parameters for `IMEM`.
+    fn imem_load(&self) -> FalconLoadTarget;
+
+    /// Returns the load parameters for `DMEM`.
+    fn dmem_load(&self) -> FalconLoadTarget;
+
+    /// Returns the parameters to write into the BROM registers.
+    fn brom_params(&self) -> FalconBromParams;
+
+    /// Returns the start address of the firmware.
+    fn boot_addr(&self) -> u32;
+}
+
+/// Contains the base parameters common to all Falcon instances.
+pub(crate) struct Falcon<E: FalconEngine> {
+    pub hal: Arc<dyn FalconHal<E>>,
+}
+
+impl<E: FalconEngine + 'static> Falcon<E> {
+    pub(crate) fn new(
+        pdev: &pci::Device,
+        chipset: Chipset,
+        bar: &Devres<Bar0>,
+        need_riscv: bool,
+    ) -> Result<Self> {
+        let hwcfg1 = with_bar!(bar, |b| regs::FalconHwcfg1::read(b, E::BASE))?;
+        // Ensure that the revision and security model contain valid values.
+        let _rev = hwcfg1.core_rev()?;
+        let _sec_model = hwcfg1.security_model()?;
+
+        if need_riscv {
+            let hwcfg2 = with_bar!(bar, |b| regs::FalconHwcfg2::read(b, E::BASE))?;
+            if !hwcfg2.riscv() {
+                dev_err!(
+                    pdev.as_ref(),
+                    "riscv support requested on falcon that does not support it\n"
+                );
+                return Err(EINVAL);
+            }
+        }
+
+        Ok(Self {
+            hal: hal::create_falcon_hal(chipset)?,
+        })
+    }
+
+    fn reset_wait_mem_scrubbing(&self, bar: &Devres<Bar0>, timer: &Timer) -> Result<()> {
+        timer.wait_on(bar, Duration::from_millis(20), || {
+            bar.try_access_with(|b| regs::FalconHwcfg2::read(b, E::BASE))
+                .and_then(|r| if r.mem_scrubbing() { Some(()) } else { None })
+        })
+    }
+
+    fn reset_eng(&self, bar: &Devres<Bar0>, timer: &Timer) -> Result<()> {
+        let _ = with_bar!(bar, |b| regs::FalconHwcfg2::read(b, E::BASE))?;
+
+        // According to OpenRM's `kflcnPreResetWait_GA102` documentation, HW sometimes does not set
+        // RESET_READY so a non-failing timeout is used.
+        let _ = timer.wait_on(bar, Duration::from_micros(150), || {
+            bar.try_access_with(|b| regs::FalconHwcfg2::read(b, E::BASE))
+                .and_then(|r| if r.reset_ready() { Some(()) } else { None })
+        });
+
+        with_bar!(bar, |b| regs::FalconEngine::alter(b, E::BASE, |v| v
+            .set_reset(true)))?;
+
+        let _: Result<()> = timer.wait_on(bar, Duration::from_micros(10), || None);
+
+        with_bar!(bar, |b| regs::FalconEngine::alter(b, E::BASE, |v| v
+            .set_reset(false)))?;
+
+        self.reset_wait_mem_scrubbing(bar, timer)?;
+
+        Ok(())
+    }
+
+    pub(crate) fn reset(&self, bar: &Devres<Bar0>, timer: &Timer) -> Result<()> {
+        self.reset_eng(bar, timer)?;
+        self.hal.select_core(bar, timer)?;
+        self.reset_wait_mem_scrubbing(bar, timer)?;
+
+        with_bar!(bar, |b| {
+            regs::FalconRm::default()
+                .set_val(regs::Boot0::read(b).into())
+                .write(b, E::BASE)
+        })
+    }
+
+    fn dma_wr(
+        &self,
+        bar: &Devres<Bar0>,
+        timer: &Timer,
+        dma_handle: bindings::dma_addr_t,
+        target_mem: FalconMem,
+        load_offsets: FalconLoadTarget,
+        sec: bool,
+    ) -> Result<()> {
+        const DMA_LEN: u32 = 256;
+        const DMA_LEN_ILOG2_MINUS2: u8 = (DMA_LEN.ilog2() - 2) as u8;
+
+        // For IMEM, we want to use the start offset as a virtual address tag for each page, since
+        // code addresses in the firmware (and the boot vector) are virtual.
+        //
+        // For DMEM we can fold the start offset into the DMA handle.
+        let (src_start, dma_start) = match target_mem {
+            FalconMem::Imem => (load_offsets.src_start, dma_handle),
+            FalconMem::Dmem => (
+                0,
+                dma_handle + load_offsets.src_start as bindings::dma_addr_t,
+            ),
+        };
+        if dma_start % DMA_LEN as bindings::dma_addr_t > 0 {
+            pr_err!(
+                "DMA transfer start addresses must be a multiple of {}",
+                DMA_LEN
+            );
+            return Err(EINVAL);
+        }
+        if load_offsets.len % DMA_LEN > 0 {
+            pr_err!("DMA transfer length must be a multiple of {}", DMA_LEN);
+            return Err(EINVAL);
+        }
+
+        // Set up the base source DMA address.
+        with_bar!(bar, |b| {
+            regs::FalconDmaTrfBase::default()
+                .set_base((dma_start >> 8) as u32)
+                .write(b, E::BASE);
+            regs::FalconDmaTrfBase1::default()
+                .set_base((dma_start >> 40) as u16)
+                .write(b, E::BASE)
+        })?;
+
+        let cmd = regs::FalconDmaTrfCmd::default()
+            .set_size(DMA_LEN_ILOG2_MINUS2)
+            .set_imem(target_mem == FalconMem::Imem)
+            .set_sec(if sec { 1 } else { 0 });
+
+        for pos in (0..load_offsets.len).step_by(DMA_LEN as usize) {
+            // Perform a transfer of size `DMA_LEN`.
+            with_bar!(bar, |b| {
+                regs::FalconDmaTrfMOffs::default()
+                    .set_offs(load_offsets.dst_start + pos)
+                    .write(b, E::BASE);
+                regs::FalconDmaTrfBOffs::default()
+                    .set_offs(src_start + pos)
+                    .write(b, E::BASE);
+                cmd.write(b, E::BASE)
+            })?;
+
+            // Wait for the transfer to complete.
+            timer.wait_on(bar, Duration::from_millis(2000), || {
+                bar.try_access_with(|b| regs::FalconDmaTrfCmd::read(b, E::BASE))
+                    .and_then(|v| if v.idle() { Some(()) } else { None })
+            })?;
+        }
+
+        Ok(())
+    }
+
+    pub(crate) fn dma_load<F: FalconFirmware<Target = E>>(
+        &self,
+        bar: &Devres<Bar0>,
+        timer: &Timer,
+        fw: &F,
+    ) -> Result<()> {
+        let dma_handle = fw.dma_handle();
+
+        with_bar!(bar, |b| {
+            regs::FalconFbifCtl::alter(b, E::BASE, |v| v.set_allow_phys_no_ctx(true));
+            regs::FalconDmaCtl::default().write(b, E::BASE);
+            regs::FalconFbifTranscfg::alter(b, E::BASE, |v| {
+                v.set_target(FalconFbifTarget::CoherentSysmem)
+                    .set_mem_type(FalconFbifMemType::Physical)
+            });
+        })?;
+
+        self.dma_wr(
+            bar,
+            timer,
+            dma_handle,
+            FalconMem::Imem,
+            fw.imem_load(),
+            true,
+        )?;
+        self.dma_wr(
+            bar,
+            timer,
+            dma_handle,
+            FalconMem::Dmem,
+            fw.dmem_load(),
+            true,
+        )?;
+
+        self.hal.program_brom(bar, &fw.brom_params())?;
+
+        with_bar!(bar, |b| {
+            // Set `BootVec` to start of non-secure code.
+            regs::FalconBootVec::default()
+                .set_boot_vec(fw.boot_addr())
+                .write(b, E::BASE);
+        })?;
+
+        Ok(())
+    }
+
+    pub(crate) fn boot(
+        &self,
+        bar: &Devres<Bar0>,
+        timer: &Timer,
+        mbox0: Option<u32>,
+        mbox1: Option<u32>,
+    ) -> Result<(u32, u32)> {
+        with_bar!(bar, |b| {
+            if let Some(mbox0) = mbox0 {
+                regs::FalconMailbox0::default()
+                    .set_mailbox0(mbox0)
+                    .write(b, E::BASE);
+            }
+
+            if let Some(mbox1) = mbox1 {
+                regs::FalconMailbox1::default()
+                    .set_mailbox1(mbox1)
+                    .write(b, E::BASE);
+            }
+
+            match regs::FalconCpuCtl::read(b, E::BASE).alias_en() {
+                true => regs::FalconCpuCtlAlias::default()
+                    .set_start_cpu(true)
+                    .write(b, E::BASE),
+                false => regs::FalconCpuCtl::default()
+                    .set_start_cpu(true)
+                    .write(b, E::BASE),
+            }
+        })?;
+
+        timer.wait_on(bar, Duration::from_secs(2), || {
+            bar.try_access()
+                .map(|b| regs::FalconCpuCtl::read(&*b, E::BASE))
+                .and_then(|v| if v.halted() { Some(()) } else { None })
+        })?;
+
+        let (mbox0, mbox1) = with_bar!(bar, |b| {
+            let mbox0 = regs::FalconMailbox0::read(b, E::BASE).mailbox0();
+            let mbox1 = regs::FalconMailbox1::read(b, E::BASE).mailbox1();
+
+            (mbox0, mbox1)
+        })?;
+
+        Ok((mbox0, mbox1))
+    }
+}
diff --git a/drivers/gpu/nova-core/falcon/gsp.rs b/drivers/gpu/nova-core/falcon/gsp.rs
new file mode 100644
index 0000000000000000000000000000000000000000..44b8dc118eda1263eaede466efd55408c6e7cded
--- /dev/null
+++ b/drivers/gpu/nova-core/falcon/gsp.rs
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use kernel::devres::Devres;
+use kernel::prelude::*;
+
+use crate::{
+    driver::Bar0,
+    falcon::{Falcon, FalconEngine},
+    regs,
+};
+
+pub(crate) struct Gsp;
+impl FalconEngine for Gsp {
+    const BASE: usize = 0x00110000;
+}
+
+pub(crate) type GspFalcon = Falcon<Gsp>;
+
+impl Falcon<Gsp> {
+    /// Clears the SWGEN0 bit in the Falcon's IRQ status clear register to
+    /// allow GSP to signal CPU for processing new messages in message queue.
+    pub(crate) fn clear_swgen0_intr(&self, bar: &Devres<Bar0>) -> Result<()> {
+        with_bar!(bar, |b| regs::FalconIrqsclr::default()
+            .set_swgen0(true)
+            .write(b, Gsp::BASE))
+    }
+}
diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/falcon/hal.rs
new file mode 100644
index 0000000000000000000000000000000000000000..5ebf4e88f1f25a13cf47859a53507be53e795d34
--- /dev/null
+++ b/drivers/gpu/nova-core/falcon/hal.rs
@@ -0,0 +1,54 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use kernel::devres::Devres;
+use kernel::prelude::*;
+use kernel::sync::Arc;
+
+use crate::driver::Bar0;
+use crate::falcon::{FalconBromParams, FalconEngine};
+use crate::gpu::Chipset;
+use crate::timer::Timer;
+
+mod ga102;
+
+/// Hardware Abstraction Layer for Falcon cores.
+///
+/// Implements chipset-specific low-level operations. The trait is generic against [`FalconEngine`]
+/// so its `BASE` parameter can be used in order to avoid runtime bound checks when accessing
+/// registers.
+pub(crate) trait FalconHal<E: FalconEngine>: Sync {
+    // Activates the Falcon core if the engine is a risvc/falcon dual engine.
+    fn select_core(&self, _bar: &Devres<Bar0>, _timer: &Timer) -> Result<()> {
+        Ok(())
+    }
+
+    fn get_signature_reg_fuse_version(
+        &self,
+        bar: &Devres<Bar0>,
+        engine_id_mask: u16,
+        ucode_id: u8,
+    ) -> Result<u32>;
+
+    // Program the BROM registers prior to starting a secure firmware.
+    fn program_brom(&self, bar: &Devres<Bar0>, params: &FalconBromParams) -> Result<()>;
+}
+
+/// Returns a boxed falcon HAL adequate for the passed `chipset`.
+///
+/// We use this function and a heap-allocated trait object instead of statically defined trait
+/// objects because of the two-dimensional (Chipset, Engine) lookup required to return the
+/// requested HAL.
+///
+/// TODO: replace the return type with `KBox` once it gains the ability to host trait objects.
+pub(crate) fn create_falcon_hal<E: FalconEngine + 'static>(
+    chipset: Chipset,
+) -> Result<Arc<dyn FalconHal<E>>> {
+    let hal = match chipset {
+        Chipset::GA102 | Chipset::GA103 | Chipset::GA104 | Chipset::GA106 | Chipset::GA107 => {
+            Arc::new(ga102::Ga102::<E>::new(), GFP_KERNEL)? as Arc<dyn FalconHal<E>>
+        }
+        _ => return Err(ENOTSUPP),
+    };
+
+    Ok(hal)
+}
diff --git a/drivers/gpu/nova-core/falcon/hal/ga102.rs b/drivers/gpu/nova-core/falcon/hal/ga102.rs
new file mode 100644
index 0000000000000000000000000000000000000000..747b02ca671f7d4a97142665a9ba64807c87391e
--- /dev/null
+++ b/drivers/gpu/nova-core/falcon/hal/ga102.rs
@@ -0,0 +1,111 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use core::marker::PhantomData;
+use core::time::Duration;
+
+use kernel::devres::Devres;
+use kernel::prelude::*;
+
+use crate::driver::Bar0;
+use crate::falcon::{FalconBromParams, FalconEngine, FalconModSelAlgo, RiscvCoreSelect};
+use crate::regs;
+use crate::timer::Timer;
+
+use super::FalconHal;
+
+fn select_core_ga102<E: FalconEngine>(bar: &Devres<Bar0>, timer: &Timer) -> Result<()> {
+    let bcr_ctrl = with_bar!(bar, |b| regs::RiscvBcrCtrl::read(b, E::BASE))?;
+    if bcr_ctrl.core_select() != RiscvCoreSelect::Falcon {
+        with_bar!(bar, |b| regs::RiscvBcrCtrl::default()
+            .set_core_select(RiscvCoreSelect::Falcon)
+            .write(b, E::BASE))?;
+
+        timer.wait_on(bar, Duration::from_millis(10), || {
+            bar.try_access_with(|b| regs::RiscvBcrCtrl::read(b, E::BASE))
+                .and_then(|v| if v.valid() { Some(()) } else { None })
+        })?;
+    }
+
+    Ok(())
+}
+
+fn get_signature_reg_fuse_version_ga102(
+    bar: &Devres<Bar0>,
+    engine_id_mask: u16,
+    ucode_id: u8,
+) -> Result<u32> {
+    // The ucode fuse versions are contained in the FUSE_OPT_FPF_<ENGINE>_UCODE<X>_VERSION
+    // registers, which are an array. Our register definition macros do not allow us to manage them
+    // properly, so we need to hardcode their addresses for now.
+
+    // Each engine has 16 ucode version registers numbered from 1 to 16.
+    if ucode_id == 0 || ucode_id > 16 {
+        pr_warn!("invalid ucode id {:#x}", ucode_id);
+        return Err(EINVAL);
+    }
+    let reg_fuse = if engine_id_mask & 0x0001 != 0 {
+        // NV_FUSE_OPT_FPF_SEC2_UCODE1_VERSION
+        0x824140
+    } else if engine_id_mask & 0x0004 != 0 {
+        // NV_FUSE_OPT_FPF_NVDEC_UCODE1_VERSION
+        0x824100
+    } else if engine_id_mask & 0x0400 != 0 {
+        // NV_FUSE_OPT_FPF_GSP_UCODE1_VERSION
+        0x8241c0
+    } else {
+        pr_warn!("unexpected engine_id_mask {:#x}", engine_id_mask);
+        return Err(EINVAL);
+    } + ((ucode_id - 1) as usize * core::mem::size_of::<u32>());
+
+    let reg_fuse_version = with_bar!(bar, |b| { b.read32(reg_fuse) })?;
+
+    // Equivalent of Find Last Set bit.
+    Ok(u32::BITS - reg_fuse_version.leading_zeros())
+}
+
+fn program_brom_ga102<E: FalconEngine>(
+    bar: &Devres<Bar0>,
+    params: &FalconBromParams,
+) -> Result<()> {
+    with_bar!(bar, |b| {
+        regs::FalconBromParaaddr0::default()
+            .set_addr(params.pkc_data_offset)
+            .write(b, E::BASE);
+        regs::FalconBromEngidmask::default()
+            .set_mask(params.engine_id_mask as u32)
+            .write(b, E::BASE);
+        regs::FalconBromCurrUcodeId::default()
+            .set_ucode_id(params.ucode_id as u32)
+            .write(b, E::BASE);
+        regs::FalconModSel::default()
+            .set_algo(FalconModSelAlgo::Rsa3k)
+            .write(b, E::BASE)
+    })
+}
+
+pub(super) struct Ga102<E: FalconEngine>(PhantomData<E>);
+
+impl<E: FalconEngine> Ga102<E> {
+    pub(super) fn new() -> Self {
+        Self(PhantomData)
+    }
+}
+
+impl<E: FalconEngine> FalconHal<E> for Ga102<E> {
+    fn select_core(&self, bar: &Devres<Bar0>, timer: &Timer) -> Result<()> {
+        select_core_ga102::<E>(bar, timer)
+    }
+
+    fn get_signature_reg_fuse_version(
+        &self,
+        bar: &Devres<Bar0>,
+        engine_id_mask: u16,
+        ucode_id: u8,
+    ) -> Result<u32> {
+        get_signature_reg_fuse_version_ga102(bar, engine_id_mask, ucode_id)
+    }
+
+    fn program_brom(&self, bar: &Devres<Bar0>, params: &FalconBromParams) -> Result<()> {
+        program_brom_ga102::<E>(bar, params)
+    }
+}
diff --git a/drivers/gpu/nova-core/falcon/sec2.rs b/drivers/gpu/nova-core/falcon/sec2.rs
new file mode 100644
index 0000000000000000000000000000000000000000..85dda3e8380a3d31d34c92c4236c6f81c63ce772
--- /dev/null
+++ b/drivers/gpu/nova-core/falcon/sec2.rs
@@ -0,0 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use crate::falcon::{Falcon, FalconEngine};
+
+pub(crate) struct Sec2;
+impl FalconEngine for Sec2 {
+    const BASE: usize = 0x00840000;
+}
+pub(crate) type Sec2Falcon = Falcon<Sec2>;
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 1b3e43e0412e2a2ea178c7404ea647c9e38d4e04..ec4c648c6e8b4aa7d06c627ed59c0e66a08c679e 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -5,6 +5,8 @@
 use crate::devinit;
 use crate::dma::DmaObject;
 use crate::driver::Bar0;
+use crate::falcon::gsp::GspFalcon;
+use crate::falcon::sec2::Sec2Falcon;
 use crate::firmware::Firmware;
 use crate::regs;
 use crate::timer::Timer;
@@ -221,6 +223,20 @@ pub(crate) fn new(
 
         let timer = Timer::new();
 
+        let gsp_falcon = GspFalcon::new(
+            pdev,
+            spec.chipset,
+            &bar,
+            if spec.chipset > Chipset::GA100 {
+                true
+            } else {
+                false
+            },
+        )?;
+        gsp_falcon.clear_swgen0_intr(&bar)?;
+
+        let _sec2_falcon = Sec2Falcon::new(pdev, spec.chipset, &bar, true)?;
+
         Ok(pin_init!(Self {
             spec,
             bar,
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index df3468c92c6081b3e2db218d92fbe1c40a0a75c3..4dde8004d24882c60669b5acd6af9d6988c66a9c 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -23,6 +23,7 @@ macro_rules! with_bar {
 mod devinit;
 mod dma;
 mod driver;
+mod falcon;
 mod firmware;
 mod gpu;
 mod regs;
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index f191cf4eb44c2b950e5cfcc6d04f95c122ce29d3..c76a16dc8e7267a4eb54cb71e1cca6fb9e00188f 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -6,6 +6,10 @@
 #[macro_use]
 mod macros;
 
+use crate::falcon::{
+    FalconCoreRev, FalconCoreRevSubversion, FalconFbifMemType, FalconFbifTarget, FalconModSelAlgo,
+    FalconSecurityModel, RiscvCoreSelect,
+};
 use crate::gpu::Chipset;
 
 register!(Boot0@0x00000000, "Basic revision information about the GPU";
@@ -44,3 +48,188 @@
 register!(Pgc6AonSecureScratchGroup05@0x00118234;
     31:0    value => as u32
 );
+
+/* PFALCON */
+
+register!(FalconIrqsclr@+0x00000004;
+    4:4     halt => as_bit bool;
+    6:6     swgen0 => as_bit bool;
+);
+
+register!(FalconIrqstat@+0x00000008;
+    4:4     halt => as_bit bool;
+    6:6     swgen0 => as_bit bool;
+);
+
+register!(FalconIrqmclr@+0x00000014;
+    31:0    val => as u32
+);
+
+register!(FalconIrqmask@+0x00000018;
+    31:0    val => as u32
+);
+
+register!(FalconRm@+0x00000084;
+    31:0    val => as u32
+);
+
+register!(FalconIrqdest@+0x0000001c;
+    31:0    val => as u32
+);
+
+register!(FalconMailbox0@+0x00000040;
+    31:0    mailbox0 => as u32
+);
+register!(FalconMailbox1@+0x00000044;
+    31:0    mailbox1 => as u32
+);
+
+register!(FalconHwcfg2@+0x000000f4;
+    10:10   riscv => as_bit bool;
+    12:12   mem_scrubbing => as_bit bool;
+    31:31   reset_ready => as_bit bool;
+);
+
+register!(FalconCpuCtl@+0x00000100;
+    1:1     start_cpu => as_bit bool;
+    4:4     halted => as_bit bool;
+    6:6     alias_en => as_bit bool;
+);
+
+register!(FalconBootVec@+0x00000104;
+    31:0    boot_vec => as u32
+);
+
+register!(FalconHwCfg@+0x00000108;
+    8:0     imem_size => as u32;
+    17:9    dmem_size => as u32;
+);
+
+register!(FalconDmaCtl@+0x0000010c;
+    0:0     require_ctx => as_bit bool;
+    1:1     dmem_scrubbing  => as_bit bool;
+    2:2     imem_scrubbing => as_bit bool;
+    6:3     dmaq_num => as_bit u8;
+    7:7     secure_stat => as_bit bool;
+);
+
+register!(FalconDmaTrfBase@+0x00000110;
+    31:0    base => as u32;
+);
+
+register!(FalconDmaTrfMOffs@+0x00000114;
+    23:0    offs => as u32;
+);
+
+register!(FalconDmaTrfCmd@+0x00000118;
+    0:0     full => as_bit bool;
+    1:1     idle => as_bit bool;
+    3:2     sec => as_bit u8;
+    4:4     imem => as_bit bool;
+    5:5     is_write => as_bit bool;
+    10:8    size => as u8;
+    14:12   ctxdma => as u8;
+    16:16   set_dmtag => as u8;
+);
+
+register!(FalconDmaTrfBOffs@+0x0000011c;
+    31:0    offs => as u32;
+);
+
+register!(FalconDmaTrfBase1@+0x00000128;
+    8:0     base => as u16;
+);
+
+register!(FalconHwcfg1@+0x0000012c;
+    3:0     core_rev => try_into FalconCoreRev, "core revision of the falcon";
+    5:4     security_model => try_into FalconSecurityModel, "security model of the falcon";
+    7:6     core_rev_subversion => into FalconCoreRevSubversion;
+    11:8    imem_ports => as u8;
+    15:12   dmem_ports => as u8;
+);
+
+register!(FalconCpuCtlAlias@+0x00000130;
+    1:1     start_cpu => as_bit bool;
+);
+
+/* TODO: this is an array of registers */
+register!(FalconImemC@+0x00000180;
+    7:2     offs => as u8;
+    23:8    blk => as u8;
+    24:24   aincw => as_bit bool;
+    25:25   aincr => as_bit bool;
+    28:28   secure => as_bit bool;
+    29:29   sec_atomic => as_bit bool;
+);
+
+register!(FalconImemD@+0x00000184;
+    31:0    data => as u32;
+);
+
+register!(FalconImemT@+0x00000188;
+    15:0    data => as u16;
+);
+
+register!(FalconDmemC@+0x000001c0;
+    7:2     offs => as u8;
+    23:0    addr => as u32;
+    23:8    blk => as u8;
+    24:24   aincw => as_bit bool;
+    25:25   aincr => as_bit bool;
+    26:26   settag => as_bit bool;
+    27:27   setlvl => as_bit bool;
+    28:28   va => as_bit bool;
+    29:29   miss => as_bit bool;
+);
+
+register!(FalconDmemD@+0x000001c4;
+    31:0    data => as u32;
+);
+
+register!(FalconModSel@+0x00001180;
+    7:0     algo => try_into FalconModSelAlgo;
+);
+register!(FalconBromCurrUcodeId@+0x00001198;
+    31:0    ucode_id => as u32;
+);
+register!(FalconBromEngidmask@+0x0000119c;
+    31:0    mask => as u32;
+);
+register!(FalconBromParaaddr0@+0x00001210;
+    31:0    addr => as u32;
+);
+
+register!(RiscvCpuctl@+0x00000388;
+    0:0     startcpu => as_bit bool;
+    4:4     halted => as_bit bool;
+    5:5     stopped => as_bit bool;
+    7:7     active_stat => as_bit bool;
+);
+
+register!(FalconEngine@+0x000003c0;
+    0:0     reset => as_bit bool;
+);
+
+register!(RiscvIrqmask@+0x00000528;
+    31:0    mask => as u32;
+);
+
+register!(RiscvIrqdest@+0x0000052c;
+    31:0    dest => as u32;
+);
+
+/* TODO: this is an array of registers */
+register!(FalconFbifTranscfg@+0x00000600;
+    1:0     target => try_into FalconFbifTarget;
+    2:2     mem_type => as_bit FalconFbifMemType;
+);
+
+register!(FalconFbifCtl@+0x00000624;
+    7:7     allow_phys_no_ctx => as_bit bool;
+);
+
+register!(RiscvBcrCtrl@+0x00001668;
+    0:0     valid => as_bit bool;
+    4:4     core_select => as_bit RiscvCoreSelect;
+    8:8     br_fetch => as_bit bool;
+);
diff --git a/drivers/gpu/nova-core/timer.rs b/drivers/gpu/nova-core/timer.rs
index 8987352f4192bc9b4b2fc0fb5f2e8e62ff27be68..c03a5c36d1230dfbf2bd6e02a793264280c6d509 100644
--- a/drivers/gpu/nova-core/timer.rs
+++ b/drivers/gpu/nova-core/timer.rs
@@ -2,9 +2,6 @@
 
 //! Nova Core Timer subdevice
 
-// To be removed when all code is used.
-#![allow(dead_code)]
-
 use core::fmt::Display;
 use core::ops::{Add, Sub};
 use core::time::Duration;

-- 
2.49.0


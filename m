Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB02ABEC3E
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 08:46:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7179710E679;
	Wed, 21 May 2025 06:46:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="S7LDcIYU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2068.outbound.protection.outlook.com [40.107.237.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D069110E67A;
 Wed, 21 May 2025 06:46:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HoT+LDgDkXyXydTeusXGMnCXeg5zX1+ZR4bW/PzwPDiOSWLyZWSRt8eZZ1aguKEsycpgvjZ0rTqJ1jWln8jY4/g7iIjV/xUsmAOWxWbMcWGVZeUccEyVvmjuPIw6kmw3FpHI87iENVBRriBNIo9BMg+WYZP4gVa9C5LFkFvbW4gSZwuj6aZVWyaElfotlS/fIGe61FpCyTcKHb7wxkc63U2WEzfi8yyXQ/6i/c9ZoD7w2SsCPY/ng7qoEiSYzv6/ir56lRRCxtX9VclLCYISp57rDCIY6rWRY6D1S4RN7yt7UBvsyWv79r+6BiTFmuh5LnzfyedA/tsFuN+tzE/eHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mF+oyCvy/60/dz+Qhbt7dCy+r1DkSO9p0sopNnZsfq8=;
 b=ZY/SzGJlB561358jGGTcsdUqZ4kMg8VybWU1P4pX5LkvH6SFaiilhVbR+rUkGDLzh9WGm76fbS/J20ZgpMH0dtniZj8C9HNdhpzPCEZyoacA5VMoidPrZA1n+/BdBuExjHVyEC6/qf+cxnlqais3Kqkz6SiMc+gQF0rp9D28Lf8vztC8wm8HOPHKy8FA9fZRRbvtpY6LlkM6PHbS1yFeEuKXKQjhv59Aw1JKLbr1zk9kGxtff5PKNHSpG902GIFlEojWCnxojGll4VIczLIABteJ6LruCQp4dt+pxBmx+sJAUHzPgwNfY2S1MBYsop7aDqMQ/8mNrwZYOWdVcfVsoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mF+oyCvy/60/dz+Qhbt7dCy+r1DkSO9p0sopNnZsfq8=;
 b=S7LDcIYU/JNSf7bq30/yFMeZuHW0B+gQLQIyhDczIur0Osl370MAoYvcEyFGz85Wh7QxMWjt4txbMj6Q1UiPtG5WTv1XhePJUPVk+S988m1oL4BXCzPSOGR0jYsllmw8016WOkTMUG2MKljWH3HeIkETT/+VutBYUFgFNWWzhbnTGRojP25ozt26kqY0mXbJG86EAf7cPO+PVjPwc8nMsUHXUMFUVf8YIZGmI8ZXjsUUOZW42WdagC/qJz4Zuj+oDUhzWwZFTJhemiG10l7F7lYXKoR+2ED/faw04mgD4cY+cvwOcXYmMHyqMxxbKfgDzlUxrbDVHNTLWaqbaoRg4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BL3PR12MB6618.namprd12.prod.outlook.com (2603:10b6:208:38d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Wed, 21 May
 2025 06:46:02 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%5]) with mapi id 15.20.8769.019; Wed, 21 May 2025
 06:46:02 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 21 May 2025 15:45:11 +0900
Subject: [PATCH v4 16/20] nova-core: Add support for VBIOS ucode extraction
 for boot
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250521-nova-frts-v4-16-05dfd4f39479@nvidia.com>
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
In-Reply-To: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>, 
 Shirish Baskaran <sbaskaran@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYWP286CA0028.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::14) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BL3PR12MB6618:EE_
X-MS-Office365-Filtering-Correlation-Id: e994afb4-98ec-4aac-df1f-08dd98332687
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RDkvOVhjcUNWUjNOVzJLRGtiUS92TnNoNS9hTlg2M0oveXFEZjBsemJFN0s4?=
 =?utf-8?B?cUJOclh1c1A0US8xVXVjdk5SUmVZMkdPcllJZHlDcnpZM2N1UWJpRkRUNmJ3?=
 =?utf-8?B?NExtaVVCQ3lNdC9KMUZscG51S3hab08reW9rNVZIZHhJcXFPaEREVCs4RFhz?=
 =?utf-8?B?RFpZOWVGNC9wNmtEWm4wNU1mWm9qN0RKS1MvMlBTV0k0b3ZGNUdOSmhoNjRE?=
 =?utf-8?B?Zi9mdUd0UDE3SDExY0MzbUhuRHd3dFNubkNOWVZ4MWJwandQMkdqRU9SWXlt?=
 =?utf-8?B?eEkramZzNmpxOWl2NVZiRnN3WmVobXRnSHdMN1BSN0loT0hmYmRYeDh4aGM3?=
 =?utf-8?B?NDNzTm5KeU1Tb2RxOU4zODQrekVwOEVBaHZnTmU5SXppanJkS005dWkxVXpM?=
 =?utf-8?B?ZDI2VjI4OWwvVzNMR0pOS2F0ZHg5NUNrT0I5czlTS1E2ckErMy81eHcyYnRj?=
 =?utf-8?B?UFFHbXZXU0U5b0ZzNjhEczhhRkNyV2JRRy9WNHRTd3A0SlhPSnQzT1FPNVkw?=
 =?utf-8?B?VmNoSWFHY0pkYVVJZ3NXc2NxNEpIbVYxYm9DTmd1V2ZjQUs1M2xIUzRaWnd2?=
 =?utf-8?B?UWNpUkNhK2VzaHhONmZBQmFwdm94bWVETy9pQjRlMkhqZmQvbHZWU0NveEll?=
 =?utf-8?B?Mit4UkhXNTFTZnJoVjN2ZnZJZnNkbnRkQTY3cWJCNEgyYlQzeTV6ejFia0Ns?=
 =?utf-8?B?a2ZTZXRuUVUyVExUNDFwM2ZaQ09hMUc4VUgrMnQ0VGc3L2hHTi9qZ1NUc2pP?=
 =?utf-8?B?NVlTRGxEMzAveWtDanZlQ0ZzUFdESlNsMXlVUE5QNFJRMHd6VkUvaDN5U3pL?=
 =?utf-8?B?MjRqQzJOTjVUbFRHQVJxSjhQenlUMlAydkN5aVg2RHZTQ0N5U3ZPZXk2YzNP?=
 =?utf-8?B?clpkaUtBV0Y4TDBjVzF2UlZFaFdlYUlMUXVDK1hRcDhQM1FUd1RvSFIwQTND?=
 =?utf-8?B?NDVwMXphWFJaZDE0K0VSZC9rS0hCaGJXUmlZaDlIZWVkZllXWGZnRmZFOXoy?=
 =?utf-8?B?Vmp6ZmxMSy9OK2VRYVBmRmVOUkJUd1VUSUs0d0thSjRlSUVtRDFUcmR3Sml3?=
 =?utf-8?B?YUEwNWV3ZnpEQjhERWVOamlZQWRqdmQ3N2ZSekVqak1CN2FlNmo4alJzNCty?=
 =?utf-8?B?TTFxU3U1MkhlODNIS2VrN0preUVoY2d1S1pBY0RYSXZDM0NSb01DMDNVTTVp?=
 =?utf-8?B?aHNuNHlWdGlWdFpXTDIxQW5TN2ZaR3duelpJZkdRSkQ4WjQyRUdhcnRvTlFs?=
 =?utf-8?B?aUJuTnE0WGdsN0xibU50SUhOL3IzbmtQMnNxYkhGUzVGclpWZWhnZVJJREdv?=
 =?utf-8?B?VEdWcVdRQnErSEhxU2wyOS9EcGN6Q1R0aTdrNGNhTDZKdlB6WGJZcVNaQ1p6?=
 =?utf-8?B?UUlhWEhxbDdjZE9jWjR4aUx2ZXFVU1ZZbHBsa21nZDlqUllBcFp5TnVtdWJI?=
 =?utf-8?B?czBYcm5TWnAvSFg0L1VRbzNXNUwzc0ZlY1gwOTJyak9wTlF6L1NFQ0dmL0Fk?=
 =?utf-8?B?VmdsUjQ2bXJzeXhieFZkTk4yRnJwNXdPdFdraFlXdVRHWlJYakExSExKYXBX?=
 =?utf-8?B?RFBwanJVQitGVng4TlFGNksyNW80Q2tLZitEYjRYQXZ6aGU2angvOERkek9O?=
 =?utf-8?B?bndNbWlPbUpZYmRyTXYzSEg4YjBZRWlaZU9wODZlZXlhb0l3ZS9OUlFZck1Z?=
 =?utf-8?B?eEdTTVBiaE1TVStGY1dreHBXQnFxT1daWm9ReVliTnpKTTNPRmRwOGg1VUkr?=
 =?utf-8?B?a3JabkZYZ3A5UzIweVU2S3RGaHBwMEJGa1hOU3RFd0JYb3ZJd3hxWEp1WlRl?=
 =?utf-8?B?dldHOTY0ZVQ5M05NdjV2MUlZaVJFcG45aDNFVS9DMlhaajFUOUZ0cmx4b0o0?=
 =?utf-8?B?dnFXaWZycTFFM1ZWS1ZUa09KdEtPY0JiZ0pWNDZZanFBU3pOMUhPU3RXdUFY?=
 =?utf-8?B?cklpK1M5dXlxbjFXR1hTcEpJQXBqNW1EMGcxR0ZlMGdjQmJQT0RFVXRnVFJN?=
 =?utf-8?B?VXpFMTJoS25RPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0FsblQwc09LcmtyUnhGVE85eGlhZXV2ajhCejlSZmJBa0JPVmkrbDdnNDU5?=
 =?utf-8?B?bHRQb1p3dkhsemUyeVh6Ulpqd0VURUp1MGlYNitDamdjUjQ1TDgzcmowenNq?=
 =?utf-8?B?U2VjaDVYUTlkMjZ6eFY5aVllaktNdXQ4N2ZGZ0E2am90UDM5a2xqY1p4TUNn?=
 =?utf-8?B?MTAyUDB2YnpOeFFQekhmK29lK2p2dVhjMXNkcC9ocWZhNWZOVlZGWWd3dWR0?=
 =?utf-8?B?UFhxK0Z1bVRaUEhVQWdKU05MTGo1T2ppYmVISE1MdnlNLy8yUktTaWJqUWtY?=
 =?utf-8?B?OUhpYUdWNmlORlZqMnp1dkpvZGJCZG9BOFNzNW0rbUNVWjA4SUcxZUxLV3Fx?=
 =?utf-8?B?Z0llVW5UaDlVcHludmxIMy9IV1g1NTA3b1NpUGhxbndBdFVxSVdkUFdpeUtw?=
 =?utf-8?B?ZDlXRkNaTHhSZGdjZzNNYmNuTTZmVWJiM2FOa0JlaVd1UmovOVRpa0pyRk5U?=
 =?utf-8?B?SUlnSjFlcERpRUZXMHNNdnZiVUUvZDNzYUQyd2JLdlJQZkRIS1ErcFZKaU1J?=
 =?utf-8?B?TDlnSHo0clNEaGFic0dJVGFpZmZHMmZHWU5Sbnc4OWxxdzEyY1lHV0RJcitk?=
 =?utf-8?B?TmQ1bEdrUVlzVVptdHdNeVNrc1J2MEJycjBPNEZGcE9XV3RVOXI5dVA3T1hF?=
 =?utf-8?B?eWx3SFNRVTQ4YWdPYmJIUFRxOGIrNFByK1B2anJzTzloZ3pPZzZrWFlvaStQ?=
 =?utf-8?B?RHJzTklWbHJ3SXJxRGtSSVN6WU9QRE96Y09BbytUWm5tYldJZDY4WWZsSWFt?=
 =?utf-8?B?NGVKMVpNTXBZeFZnakVUd21TeVNlQ1NtcS8rSjhSYlhJdnpnTWp0ZURNL3l4?=
 =?utf-8?B?QllKU2ZCQVlDSHgyb3E3bkNveVloZHBRcmdFOUUyMWFKRVF2cGJLQXBhTDVS?=
 =?utf-8?B?Rmt2TG02QzQ5ak9SR2FiTk9Ba3BPR0JRYTJPWVdsVElIcklIMWJyV21nR0Qz?=
 =?utf-8?B?Vk0ybnBTQjZyUlZzUllYL0JMaWl3OE1tQjFNditUNmpkUUpZa3BqWEVXVlRx?=
 =?utf-8?B?ZVA5Y3pMUlZNNisxMjhZcElVbUV2WmNuU01vUUhjbDVFdmR5UW1ETnViYXpq?=
 =?utf-8?B?UTdCRm8zKzNtQWN4TTYwQ3UzczEvOFUwR3BBRFhQUlhRUGdSSmJ0VHc0Uzgy?=
 =?utf-8?B?MEMyWWRHbVlQTXRmZUhPRGsyb3FnRElUNHRRQTM1TzBoQk00ajY2Q3NYSmU2?=
 =?utf-8?B?UXBaMHRBM3MrcVBKdmRxY25lMnhNbGlVa2M1RTdGNTNObmVuSGQra0x1dmtV?=
 =?utf-8?B?K09RVHI0VmtMbk1ZaTBGZWoyMzkyT2RsVFNpYWw3N25IaWZVTFNTVHMwcGhC?=
 =?utf-8?B?R3VEV0dYYUJnR2s2SFlPdS8yK3ZaSUtGV3dIb0c2WXJ1MVpFaVlraEhtMGhr?=
 =?utf-8?B?cVoyM3dua0pTQTE5eDhOVFI5VEorS3JxQmNqZEtjUisyMWhSbUU5Zm5mc3Js?=
 =?utf-8?B?RHY4RVQ4ZzNpUWs3emppcVNIQzRnWWtFeUR0bllWeFRMamJwdFY5MEdJR09h?=
 =?utf-8?B?c3k3bUdUMHZraGFPNW9CNjl0YjgzUmVrWmNuZjlSenBzUmlGYnBRaWZ1cDR1?=
 =?utf-8?B?clhoSTRQOWJpOTFOOUMzaFE4bm00M3g5Mk45ODRiU24wTnJSLys0UHc5aTJT?=
 =?utf-8?B?UU1nTFd5c1MySmpTeEprYTRuYWFRejFaRzNrb1RuY01ZYVRaVDErZW5aQms3?=
 =?utf-8?B?UHkzS1JzeU1lRGY0Y3Y5andyUm1Fc1dDN1Qra1dBTFFRRWdtVng5L2puK2M2?=
 =?utf-8?B?Ty9uWjd1NUNoandQSlViT093WXE2amdVVmlvN2xHMmE3SE1wRHBQenF1VTNn?=
 =?utf-8?B?SUlFS3FNS1U3V0V4eXFNQmxoRzJ5UXdrSnRRVXVVWEkyLzByVlFYN29MdnpE?=
 =?utf-8?B?aXBqd0I3cmtieUNxelhhMVA0eWxPbzhiTklOemhibXJMQ3NsSDVneDA5elBS?=
 =?utf-8?B?Q084NER1bDE5OW8vRHIxWWdlbUw1d3psczZUSGUxa1REYU96WFY2QUpBQXd6?=
 =?utf-8?B?d2xTQkVvQW12eCtZREVYMG5zMjdUUHFRT2RuZmw2TFFSbk5NWUc4QlRMRk5D?=
 =?utf-8?B?dGFZUy9KSlpVMTh2anExOU9RbFJKSzBsVUNUY25yMllHcU00b3NHTzdSLzlR?=
 =?utf-8?B?OGkrb21tYVd3Z0hsYWdiZUNmSWpKWCtrVjVHQWxQSS9nZDF3NVd6NUR3NjBl?=
 =?utf-8?Q?gJP6/a0QrHM/jXv0kPSdRmrDHJSVHnEKk1trsxpz5Mna?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e994afb4-98ec-4aac-df1f-08dd98332687
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 06:46:02.0980 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 11Wics8F2PcqPKjKfUMGbH4ekziiMo/wYq/6+DEw6L8UsyvHboDs865YkgLmlBw8Al9c1G968fVEbMcIvPr12A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6618
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

Add support for navigating and setting up vBIOS ucode data required for
GSP to boot. The main data extracted from the vBIOS is the FWSEC-FRTS
firmware which runs on the GSP processor. This firmware runs in high
secure mode, and sets up the WPR2 (Write protected region) before the
Booter runs on the SEC2 processor.

Also add log messages to show the BIOS images.

[102141.013287] NovaCore: Found BIOS image at offset 0x0, size: 0xfe00, type: PciAt
[102141.080692] NovaCore: Found BIOS image at offset 0xfe00, size: 0x14800, type: Efi
[102141.098443] NovaCore: Found BIOS image at offset 0x24600, size: 0x5600, type: FwSec
[102141.415095] NovaCore: Found BIOS image at offset 0x29c00, size: 0x60800, type: FwSec

Tested on my Ampere GA102 and boot is successful.

[applied changes by Alex Courbot for fwsec signatures]
[applied feedback from Alex Courbot and Timur Tabi]
[applied changes related to code reorg, prints etc from Danilo Krummrich]
[acourbot@nvidia.com: fix clippy warnings]
[acourbot@nvidia.com: remove now-unneeded Devres acquisition]
[acourbot@nvidia.com: fix read_more to read `len` bytes, not u32s]

Cc: Alexandre Courbot <acourbot@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>
Cc: Shirish Baskaran <sbaskaran@nvidia.com>
Cc: Alistair Popple <apopple@nvidia.com>
Cc: Timur Tabi <ttabi@nvidia.com>
Cc: Ben Skeggs <bskeggs@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs  |    2 -
 drivers/gpu/nova-core/gpu.rs       |    4 +
 drivers/gpu/nova-core/nova_core.rs |    1 +
 drivers/gpu/nova-core/vbios.rs     | 1161 ++++++++++++++++++++++++++++++++++++
 4 files changed, 1166 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index f675fb225607c3efd943393086123b7aeafd7d4f..c5d0f16d0de0e29f9f68f2e0b37e1e997a72782d 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -76,8 +76,6 @@ pub(crate) struct FalconUCodeDescV3 {
     _reserved: u16,
 }
 
-// To be removed once that code is used.
-#[expect(dead_code)]
 impl FalconUCodeDescV3 {
     pub(crate) fn size(&self) -> usize {
         ((self.hdr & 0xffff0000) >> 16) as usize
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 3af264f6da8025b5f951888d54f6c677c5522b6f..39b1cd3eaf8dcf95900eb93d43cfb4f085c897f0 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -9,6 +9,7 @@
 use crate::gfw;
 use crate::regs;
 use crate::util;
+use crate::vbios::Vbios;
 use core::fmt;
 
 macro_rules! define_chipset {
@@ -238,6 +239,9 @@ pub(crate) fn new(
 
         let _sec2_falcon = Falcon::<Sec2>::new(pdev.as_ref(), spec.chipset, bar, true)?;
 
+        // Will be used in a later patch when fwsec firmware is needed.
+        let _bios = Vbios::new(pdev, bar)?;
+
         Ok(pin_init!(Self {
             spec,
             bar: devres_bar,
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index b99342a9696a009aa663548fbd430179f2580cd2..86328473e8e88f7b3a539afdee7e3f34c334abab 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -10,6 +10,7 @@
 mod gpu;
 mod regs;
 mod util;
+mod vbios;
 
 pub(crate) const MODULE_NAME: &kernel::str::CStr = <LocalModule as kernel::ModuleMetadata>::NAME;
 
diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
new file mode 100644
index 0000000000000000000000000000000000000000..d873518a89e8ff3b66628107f42aa302c5f2ddca
--- /dev/null
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -0,0 +1,1161 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! VBIOS extraction and parsing.
+
+// To be removed when all code is used.
+#![expect(dead_code)]
+
+use crate::driver::Bar0;
+use crate::firmware::FalconUCodeDescV3;
+use core::convert::TryFrom;
+use kernel::device;
+use kernel::error::Result;
+use kernel::num::NumExt;
+use kernel::pci;
+use kernel::prelude::*;
+
+/// The offset of the VBIOS ROM in the BAR0 space.
+const ROM_OFFSET: usize = 0x300000;
+/// The maximum length of the VBIOS ROM to scan into.
+const BIOS_MAX_SCAN_LEN: usize = 0x100000;
+/// The size to read ahead when parsing initial BIOS image headers.
+const BIOS_READ_AHEAD_SIZE: usize = 1024;
+/// The bit in the last image indicator byte for the PCI Data Structure that
+/// indicates the last image. Bit 0-6 are reserved, bit 7 is last image bit.
+const LAST_IMAGE_BIT_MASK: u8 = 0x80;
+
+// PMU lookup table entry types. Used to locate PMU table entries
+// in the Fwsec image, corresponding to falcon ucodes.
+#[expect(dead_code)]
+const FALCON_UCODE_ENTRY_APPID_FIRMWARE_SEC_LIC: u8 = 0x05;
+#[expect(dead_code)]
+const FALCON_UCODE_ENTRY_APPID_FWSEC_DBG: u8 = 0x45;
+const FALCON_UCODE_ENTRY_APPID_FWSEC_PROD: u8 = 0x85;
+
+/// Vbios Reader for constructing the VBIOS data
+struct VbiosIterator<'a> {
+    pdev: &'a pci::Device,
+    bar0: &'a Bar0,
+    // VBIOS data vector: As BIOS images are scanned, they are added to this vector
+    // for reference or copying into other data structures. It is the entire
+    // scanned contents of the VBIOS which progressively extends. It is used
+    // so that we do not re-read any contents that are already read as we use
+    // the cumulative length read so far, and re-read any gaps as we extend
+    // the length.
+    data: KVec<u8>,
+    current_offset: usize, // Current offset for iterator
+    last_found: bool,      // Whether the last image has been found
+}
+
+impl<'a> VbiosIterator<'a> {
+    fn new(pdev: &'a pci::Device, bar0: &'a Bar0) -> Result<Self> {
+        Ok(Self {
+            pdev,
+            bar0,
+            data: KVec::new(),
+            current_offset: 0,
+            last_found: false,
+        })
+    }
+
+    /// Read bytes from the ROM at the current end of the data vector
+    fn read_more(&mut self, len: usize) -> Result {
+        let current_len = self.data.len();
+        let start = ROM_OFFSET + current_len;
+
+        // Ensure length is a multiple of 4 for 32-bit reads
+        if len % core::mem::size_of::<u32>() != 0 {
+            dev_err!(
+                self.pdev.as_ref(),
+                "VBIOS read length {} is not a multiple of 4\n",
+                len
+            );
+            return Err(EINVAL);
+        }
+
+        self.data.reserve(len, GFP_KERNEL)?;
+        // Read ROM data bytes and push directly to vector
+        for addr in (start..start + len).step_by(core::mem::size_of::<u32>()) {
+            // Read 32-bit word from the VBIOS ROM
+            let word = self.bar0.try_read32(addr)?;
+
+            // Convert the u32 to a 4 byte array and push each byte
+            word.to_ne_bytes()
+                .iter()
+                .try_for_each(|&b| self.data.push(b, GFP_KERNEL))?;
+        }
+
+        Ok(())
+    }
+
+    /// Read bytes at a specific offset, filling any gap
+    fn read_more_at_offset(&mut self, offset: usize, len: usize) -> Result {
+        if offset > BIOS_MAX_SCAN_LEN {
+            dev_err!(self.pdev.as_ref(), "Error: exceeded BIOS scan limit.\n");
+            return Err(EINVAL);
+        }
+
+        // If offset is beyond current data size, fill the gap first
+        let current_len = self.data.len();
+        let gap_bytes = offset.saturating_sub(current_len);
+
+        // Now read the requested bytes at the offset
+        self.read_more(gap_bytes + len)
+    }
+
+    /// Read a BIOS image at a specific offset and create a BiosImage from it.
+    /// self.data is extended as needed and a new BiosImage is returned.
+    /// @context is a string describing the operation for error reporting
+    fn read_bios_image_at_offset(
+        &mut self,
+        offset: usize,
+        len: usize,
+        context: &str,
+    ) -> Result<BiosImage> {
+        let data_len = self.data.len();
+        if offset + len > data_len {
+            self.read_more_at_offset(offset, len).inspect_err(|e| {
+                dev_err!(
+                    self.pdev.as_ref(),
+                    "Failed to read more at offset {:#x}: {:?}\n",
+                    offset,
+                    e
+                )
+            })?;
+        }
+
+        BiosImage::new(self.pdev, &self.data[offset..offset + len]).inspect_err(|err| {
+            dev_err!(
+                self.pdev.as_ref(),
+                "Failed to {} at offset {:#x}: {:?}\n",
+                context,
+                offset,
+                err
+            )
+        })
+    }
+}
+
+impl<'a> Iterator for VbiosIterator<'a> {
+    type Item = Result<BiosImage>;
+
+    /// Iterate over all VBIOS images until the last image is detected or offset
+    /// exceeds scan limit.
+    fn next(&mut self) -> Option<Self::Item> {
+        if self.last_found {
+            return None;
+        }
+
+        if self.current_offset > BIOS_MAX_SCAN_LEN {
+            dev_err!(
+                self.pdev.as_ref(),
+                "Error: exceeded BIOS scan limit, stopping scan\n"
+            );
+            return None;
+        }
+
+        // Parse image headers first to get image size
+        let image_size = match self
+            .read_bios_image_at_offset(
+                self.current_offset,
+                BIOS_READ_AHEAD_SIZE,
+                "parse initial BIOS image headers",
+            )
+            .and_then(|image| image.image_size_bytes())
+        {
+            Ok(size) => size,
+            Err(e) => return Some(Err(e)),
+        };
+
+        // Now create a new BiosImage with the full image data
+        let full_image = match self.read_bios_image_at_offset(
+            self.current_offset,
+            image_size,
+            "parse full BIOS image",
+        ) {
+            Ok(image) => image,
+            Err(e) => return Some(Err(e)),
+        };
+
+        self.last_found = full_image.is_last();
+
+        // Advance to next image (aligned to 512 bytes)
+        self.current_offset += image_size;
+        self.current_offset = self.current_offset.align_up(512);
+
+        Some(Ok(full_image))
+    }
+}
+
+pub(crate) struct Vbios {
+    fwsec_image: FwSecBiosImage,
+}
+
+impl Vbios {
+    /// Probe for VBIOS extraction
+    /// Once the VBIOS object is built, bar0 is not read for vbios purposes anymore.
+    pub(crate) fn new(pdev: &pci::Device, bar0: &Bar0) -> Result<Vbios> {
+        // Images to extract from iteration
+        let mut pci_at_image: Option<PciAtBiosImage> = None;
+        let mut first_fwsec_image: Option<FwSecBiosPartial> = None;
+        let mut second_fwsec_image: Option<FwSecBiosPartial> = None;
+
+        // Parse all VBIOS images in the ROM
+        for image_result in VbiosIterator::new(pdev, bar0)? {
+            let full_image = image_result?;
+
+            dev_dbg!(
+                pdev.as_ref(),
+                "Found BIOS image: size: {:#x}, type: {}, last: {}\n",
+                full_image.image_size_bytes()?,
+                full_image.image_type_str(),
+                full_image.is_last()
+            );
+
+            // Get references to images we will need after the loop, in order to
+            // setup the falcon data offset.
+            match full_image {
+                BiosImage::PciAt(image) => {
+                    pci_at_image = Some(image);
+                }
+                BiosImage::FwSecPartial(image) => {
+                    if first_fwsec_image.is_none() {
+                        first_fwsec_image = Some(image);
+                    } else {
+                        second_fwsec_image = Some(image);
+                    }
+                }
+                // For now we don't need to handle these
+                BiosImage::Efi(_image) => {}
+                BiosImage::Nbsi(_image) => {}
+            }
+        }
+
+        // Using all the images, setup the falcon data pointer in Fwsec.
+        if let (Some(mut second), Some(first), Some(pci_at)) =
+            (second_fwsec_image, first_fwsec_image, pci_at_image)
+        {
+            second
+                .setup_falcon_data(pdev, &pci_at, &first)
+                .inspect_err(|e| dev_err!(pdev.as_ref(), "Falcon data setup failed: {:?}\n", e))?;
+            Ok(Vbios {
+                fwsec_image: FwSecBiosImage::new(pdev, second)?,
+            })
+        } else {
+            dev_err!(
+                pdev.as_ref(),
+                "Missing required images for falcon data setup, skipping\n"
+            );
+            Err(EINVAL)
+        }
+    }
+
+    pub(crate) fn fwsec_header(&self, pdev: &device::Device) -> Result<&FalconUCodeDescV3> {
+        self.fwsec_image.fwsec_header(pdev)
+    }
+
+    pub(crate) fn fwsec_ucode(&self, pdev: &device::Device) -> Result<&[u8]> {
+        self.fwsec_image.fwsec_ucode(pdev, self.fwsec_header(pdev)?)
+    }
+
+    pub(crate) fn fwsec_sigs(&self, pdev: &device::Device) -> Result<&[u8]> {
+        self.fwsec_image.fwsec_sigs(pdev, self.fwsec_header(pdev)?)
+    }
+}
+
+/// PCI Data Structure as defined in PCI Firmware Specification
+#[derive(Debug, Clone)]
+#[repr(C)]
+struct PcirStruct {
+    /// PCI Data Structure signature ("PCIR" or "NPDS")
+    signature: [u8; 4],
+    /// PCI Vendor ID (e.g., 0x10DE for NVIDIA)
+    vendor_id: u16,
+    /// PCI Device ID
+    device_id: u16,
+    /// Device List Pointer
+    device_list_ptr: u16,
+    /// PCI Data Structure Length
+    pci_data_struct_len: u16,
+    /// PCI Data Structure Revision
+    pci_data_struct_rev: u8,
+    /// Class code (3 bytes, 0x03 for display controller)
+    class_code: [u8; 3],
+    /// Size of this image in 512-byte blocks
+    image_len: u16,
+    /// Revision Level of the Vendor's ROM
+    vendor_rom_rev: u16,
+    /// ROM image type (0x00 = PC-AT compatible, 0x03 = EFI, 0x70 = NBSI)
+    code_type: u8,
+    /// Last image indicator (0x00 = Not last image, 0x80 = Last image)
+    last_image: u8,
+    /// Maximum Run-time Image Length (units of 512 bytes)
+    max_runtime_image_len: u16,
+}
+
+impl PcirStruct {
+    fn new(pdev: &pci::Device, data: &[u8]) -> Result<Self> {
+        if data.len() < core::mem::size_of::<PcirStruct>() {
+            dev_err!(pdev.as_ref(), "Not enough data for PcirStruct\n");
+            return Err(EINVAL);
+        }
+
+        let mut signature = [0u8; 4];
+        signature.copy_from_slice(&data[0..4]);
+
+        // Signature should be "PCIR" (0x52494350) or "NPDS" (0x5344504e)
+        if &signature != b"PCIR" && &signature != b"NPDS" {
+            dev_err!(
+                pdev.as_ref(),
+                "Invalid signature for PcirStruct: {:?}\n",
+                signature
+            );
+            return Err(EINVAL);
+        }
+
+        let mut class_code = [0u8; 3];
+        class_code.copy_from_slice(&data[13..16]);
+
+        Ok(PcirStruct {
+            signature,
+            vendor_id: u16::from_le_bytes([data[4], data[5]]),
+            device_id: u16::from_le_bytes([data[6], data[7]]),
+            device_list_ptr: u16::from_le_bytes([data[8], data[9]]),
+            pci_data_struct_len: u16::from_le_bytes([data[10], data[11]]),
+            pci_data_struct_rev: data[12],
+            class_code,
+            image_len: u16::from_le_bytes([data[16], data[17]]),
+            vendor_rom_rev: u16::from_le_bytes([data[18], data[19]]),
+            code_type: data[20],
+            last_image: data[21],
+            max_runtime_image_len: u16::from_le_bytes([data[22], data[23]]),
+        })
+    }
+
+    /// Check if this is the last image in the ROM
+    fn is_last(&self) -> bool {
+        self.last_image & LAST_IMAGE_BIT_MASK != 0
+    }
+
+    /// Calculate image size in bytes
+    fn image_size_bytes(&self) -> Result<usize> {
+        if self.image_len > 0 {
+            // Image size is in 512-byte blocks
+            Ok(self.image_len as usize * 512)
+        } else {
+            Err(EINVAL)
+        }
+    }
+}
+
+/// BIOS Information Table (BIT) Header
+/// This is the head of the BIT table, that is used to locate the Falcon data.
+/// The BIT table (with its header) is in the PciAtBiosImage and the falcon data
+/// it is pointing to is in the FwSecBiosImage.
+#[derive(Debug, Clone, Copy)]
+#[expect(dead_code)]
+struct BitHeader {
+    /// 0h: BIT Header Identifier (BMP=0x7FFF/BIT=0xB8FF)
+    id: u16,
+    /// 2h: BIT Header Signature ("BIT\0")
+    signature: [u8; 4],
+    /// 6h: Binary Coded Decimal Version, ex: 0x0100 is 1.00.
+    bcd_version: u16,
+    /// 8h: Size of BIT Header (in bytes)
+    header_size: u8,
+    /// 9h: Size of BIT Tokens (in bytes)
+    token_size: u8,
+    /// 10h: Number of token entries that follow
+    token_entries: u8,
+    /// 11h: BIT Header Checksum
+    checksum: u8,
+}
+
+impl BitHeader {
+    fn new(data: &[u8]) -> Result<Self> {
+        if data.len() < 12 {
+            return Err(EINVAL);
+        }
+
+        let mut signature = [0u8; 4];
+        signature.copy_from_slice(&data[2..6]);
+
+        // Check header ID and signature
+        let id = u16::from_le_bytes([data[0], data[1]]);
+        if id != 0xB8FF || &signature != b"BIT\0" {
+            return Err(EINVAL);
+        }
+
+        Ok(BitHeader {
+            id,
+            signature,
+            bcd_version: u16::from_le_bytes([data[6], data[7]]),
+            header_size: data[8],
+            token_size: data[9],
+            token_entries: data[10],
+            checksum: data[11],
+        })
+    }
+}
+
+/// BIT Token Entry: Records in the BIT table followed by the BIT header
+#[derive(Debug, Clone, Copy)]
+#[expect(dead_code)]
+struct BitToken {
+    /// 00h: Token identifier
+    id: u8,
+    /// 01h: Version of the token data
+    data_version: u8,
+    /// 02h: Size of token data in bytes
+    data_size: u16,
+    /// 04h: Offset to the token data
+    data_offset: u16,
+}
+
+// Define the token ID for the Falcon data
+const BIT_TOKEN_ID_FALCON_DATA: u8 = 0x70;
+
+impl BitToken {
+    /// Find a BIT token entry by BIT ID in a PciAtBiosImage
+    fn from_id(image: &PciAtBiosImage, token_id: u8) -> Result<Self> {
+        let header = &image.bit_header;
+
+        // Offset to the first token entry
+        let tokens_start = image.bit_offset + header.header_size as usize;
+
+        for i in 0..header.token_entries as usize {
+            let entry_offset = tokens_start + (i * header.token_size as usize);
+
+            // Make sure we don't go out of bounds
+            if entry_offset + header.token_size as usize > image.base.data.len() {
+                return Err(EINVAL);
+            }
+
+            // Check if this token has the requested ID
+            if image.base.data[entry_offset] == token_id {
+                return Ok(BitToken {
+                    id: image.base.data[entry_offset],
+                    data_version: image.base.data[entry_offset + 1],
+                    data_size: u16::from_le_bytes([
+                        image.base.data[entry_offset + 2],
+                        image.base.data[entry_offset + 3],
+                    ]),
+                    data_offset: u16::from_le_bytes([
+                        image.base.data[entry_offset + 4],
+                        image.base.data[entry_offset + 5],
+                    ]),
+                });
+            }
+        }
+
+        // Token not found
+        Err(ENOENT)
+    }
+}
+
+/// PCI ROM Expansion Header as defined in PCI Firmware Specification.
+/// This is header is at the beginning of every image in the set of
+/// images in the ROM. It contains a pointer to the PCI Data Structure
+/// which describes the image.
+/// For "NBSI" images (NoteBook System Information), the ROM
+/// header deviates from the standard and contains an offset to the
+/// NBSI image however we do not yet parse that in this module and keep
+/// it for future reference.
+#[derive(Debug, Clone, Copy)]
+#[expect(dead_code)]
+struct PciRomHeader {
+    /// 00h: Signature (0xAA55)
+    signature: u16,
+    /// 02h: Reserved bytes for processor architecture unique data (20 bytes)
+    reserved: [u8; 20],
+    /// 16h: NBSI Data Offset (NBSI-specific, offset from header to NBSI image)
+    nbsi_data_offset: Option<u16>,
+    /// 18h: Pointer to PCI Data Structure (offset from start of ROM image)
+    pci_data_struct_offset: u16,
+    /// 1Ah: Size of block (this is NBSI-specific)
+    size_of_block: Option<u32>,
+}
+
+impl PciRomHeader {
+    fn new(pdev: &pci::Device, data: &[u8]) -> Result<Self> {
+        if data.len() < 26 {
+            // Need at least 26 bytes to read pciDataStrucPtr and sizeOfBlock
+            return Err(EINVAL);
+        }
+
+        let signature = u16::from_le_bytes([data[0], data[1]]);
+
+        // Check for valid ROM signatures
+        match signature {
+            0xAA55 | 0xBB77 | 0x4E56 => {}
+            _ => {
+                dev_err!(pdev.as_ref(), "ROM signature unknown {:#x}\n", signature);
+                return Err(EINVAL);
+            }
+        }
+
+        // Read the pointer to the PCI Data Structure at offset 0x18
+        let pci_data_struct_ptr = u16::from_le_bytes([data[24], data[25]]);
+
+        // Try to read optional fields if enough data
+        let mut size_of_block = None;
+        let mut nbsi_data_offset = None;
+
+        if data.len() >= 30 {
+            // Read size_of_block at offset 0x1A
+            size_of_block = Some(
+                (data[29] as u32) << 24
+                    | (data[28] as u32) << 16
+                    | (data[27] as u32) << 8
+                    | (data[26] as u32),
+            );
+        }
+
+        // For NBSI images, try to read the nbsiDataOffset at offset 0x16
+        if data.len() >= 24 {
+            nbsi_data_offset = Some(u16::from_le_bytes([data[22], data[23]]));
+        }
+
+        Ok(PciRomHeader {
+            signature,
+            reserved: [0u8; 20],
+            pci_data_struct_offset: pci_data_struct_ptr,
+            size_of_block,
+            nbsi_data_offset,
+        })
+    }
+}
+
+/// NVIDIA PCI Data Extension Structure. This is similar to the
+/// PCI Data Structure, but is Nvidia-specific and is placed right after
+/// the PCI Data Structure. It contains some fields that are redundant
+/// with the PCI Data Structure, but are needed for traversing the
+/// BIOS images. It is expected to be present in all BIOS images except
+/// for NBSI images.
+#[derive(Debug, Clone)]
+#[expect(dead_code)]
+struct NpdeStruct {
+    /// 00h: Signature ("NPDE")
+    signature: [u8; 4],
+    /// 04h: NVIDIA PCI Data Extension Revision
+    npci_data_ext_rev: u16,
+    /// 06h: NVIDIA PCI Data Extension Length
+    npci_data_ext_len: u16,
+    /// 08h: Sub-image Length (in 512-byte units)
+    subimage_len: u16,
+    /// 0Ah: Last image indicator flag
+    last_image: u8,
+}
+
+impl NpdeStruct {
+    fn new(pdev: &pci::Device, data: &[u8]) -> Result<Self> {
+        if data.len() < 11 {
+            dev_err!(pdev.as_ref(), "Not enough data for NpdeStruct\n");
+            return Err(EINVAL);
+        }
+
+        let mut signature = [0u8; 4];
+        signature.copy_from_slice(&data[0..4]);
+
+        // Signature should be "NPDE" (0x4544504E)
+        if &signature != b"NPDE" {
+            dev_err!(
+                pdev.as_ref(),
+                "Invalid signature for NpdeStruct: {:?}\n",
+                signature
+            );
+            return Err(EINVAL);
+        }
+
+        Ok(NpdeStruct {
+            signature,
+            npci_data_ext_rev: u16::from_le_bytes([data[4], data[5]]),
+            npci_data_ext_len: u16::from_le_bytes([data[6], data[7]]),
+            subimage_len: u16::from_le_bytes([data[8], data[9]]),
+            last_image: data[10],
+        })
+    }
+
+    /// Check if this is the last image in the ROM
+    fn is_last(&self) -> bool {
+        self.last_image & LAST_IMAGE_BIT_MASK != 0
+    }
+
+    /// Calculate image size in bytes
+    fn image_size_bytes(&self) -> Result<usize> {
+        if self.subimage_len > 0 {
+            // Image size is in 512-byte blocks
+            Ok(self.subimage_len as usize * 512)
+        } else {
+            Err(EINVAL)
+        }
+    }
+
+    /// Try to find NPDE in the data, the NPDE is right after the PCIR.
+    fn find_in_data(
+        pdev: &pci::Device,
+        data: &[u8],
+        rom_header: &PciRomHeader,
+        pcir: &PcirStruct,
+    ) -> Option<Self> {
+        // Calculate the offset where NPDE might be located
+        // NPDE should be right after the PCIR structure, aligned to 16 bytes
+        let pcir_offset = rom_header.pci_data_struct_offset as usize;
+        let npde_start = (pcir_offset + pcir.pci_data_struct_len as usize + 0x0F) & !0x0F;
+
+        // Check if we have enough data
+        if npde_start + 11 > data.len() {
+            dev_err!(pdev.as_ref(), "Not enough data for NPDE\n");
+            return None;
+        }
+
+        // Try to create NPDE from the data
+        NpdeStruct::new(pdev, &data[npde_start..])
+            .inspect_err(|e| {
+                dev_err!(pdev.as_ref(), "Error creating NpdeStruct: {:?}\n", e);
+            })
+            .ok()
+    }
+}
+
+// Use a macro to implement BiosImage enum and methods. This avoids having to
+// repeat each enum type when implementing functions like base() in BiosImage.
+macro_rules! bios_image {
+    (
+        $($variant:ident $class:ident),* $(,)?
+    ) => {
+        // BiosImage enum with variants for each image type
+        enum BiosImage {
+            $($variant($class)),*
+        }
+
+        impl BiosImage {
+            /// Get a reference to the common BIOS image data regardless of type
+            fn base(&self) -> &BiosImageBase {
+                match self {
+                    $(Self::$variant(img) => &img.base),*
+                }
+            }
+
+            /// Returns a string representing the type of BIOS image
+            fn image_type_str(&self) -> &'static str {
+                match self {
+                    $(Self::$variant(_) => stringify!($variant)),*
+                }
+            }
+        }
+    }
+}
+
+impl BiosImage {
+    /// Check if this is the last image
+    fn is_last(&self) -> bool {
+        let base = self.base();
+
+        // For NBSI images (type == 0x70), return true as they're
+        // considered the last image
+        if matches!(self, Self::Nbsi(_)) {
+            return true;
+        }
+
+        // For other image types, check the NPDE first if available
+        if let Some(ref npde) = base.npde {
+            return npde.is_last();
+        }
+
+        // Otherwise, fall back to checking the PCIR last_image flag
+        base.pcir.is_last()
+    }
+
+    /// Get the image size in bytes
+    fn image_size_bytes(&self) -> Result<usize> {
+        let base = self.base();
+
+        // Prefer NPDE image size if available
+        if let Some(ref npde) = base.npde {
+            return npde.image_size_bytes();
+        }
+
+        // Otherwise, fall back to the PCIR image size
+        base.pcir.image_size_bytes()
+    }
+
+    /// Create a BiosImageBase from a byte slice and convert it to a BiosImage
+    /// which triggers the constructor of the specific BiosImage enum variant.
+    fn new(pdev: &pci::Device, data: &[u8]) -> Result<Self> {
+        let base = BiosImageBase::new(pdev, data)?;
+        let image = base.into_image().inspect_err(|e| {
+            dev_err!(pdev.as_ref(), "Failed to create BiosImage: {:?}\n", e);
+        })?;
+
+        image.image_size_bytes().inspect_err(|_| {
+            dev_err!(
+                pdev.as_ref(),
+                "Invalid image size computed during BiosImage creation\n"
+            )
+        })?;
+
+        Ok(image)
+    }
+}
+
+bios_image! {
+    PciAt PciAtBiosImage,   // PCI-AT compatible BIOS image
+    Efi EfiBiosImage,       // EFI (Extensible Firmware Interface)
+    Nbsi NbsiBiosImage,     // NBSI (Nvidia Bios System Interface)
+    FwSecPartial FwSecBiosPartial, // FWSEC (Firmware Security)
+}
+
+struct PciAtBiosImage {
+    base: BiosImageBase,
+    bit_header: BitHeader,
+    bit_offset: usize,
+}
+
+struct EfiBiosImage {
+    base: BiosImageBase,
+    // EFI-specific fields can be added here in the future.
+}
+
+struct NbsiBiosImage {
+    base: BiosImageBase,
+    // NBSI-specific fields can be added here in the future.
+}
+
+struct FwSecBiosPartial {
+    base: BiosImageBase,
+    // FWSEC-specific fields
+    // These are temporary fields that are used during the construction of
+    // the FwSecBiosPartial. Once FwSecBiosPartial is constructed, the
+    // falcon_ucode_offset will be copied into a new FwSecBiosImage.
+
+    // The offset of the Falcon data from the start of Fwsec image
+    falcon_data_offset: Option<usize>,
+    // The PmuLookupTable starts at the offset of the falcon data pointer
+    pmu_lookup_table: Option<PmuLookupTable>,
+    // The offset of the Falcon ucode
+    falcon_ucode_offset: Option<usize>,
+}
+
+struct FwSecBiosImage {
+    base: BiosImageBase,
+    // The offset of the Falcon ucode
+    falcon_ucode_offset: usize,
+}
+
+// Convert from BiosImageBase to BiosImage
+impl TryFrom<BiosImageBase> for BiosImage {
+    type Error = Error;
+
+    fn try_from(base: BiosImageBase) -> Result<Self> {
+        match base.pcir.code_type {
+            0x00 => Ok(BiosImage::PciAt(base.try_into()?)),
+            0x03 => Ok(BiosImage::Efi(EfiBiosImage { base })),
+            0x70 => Ok(BiosImage::Nbsi(NbsiBiosImage { base })),
+            0xE0 => Ok(BiosImage::FwSecPartial(FwSecBiosPartial {
+                base,
+                falcon_data_offset: None,
+                pmu_lookup_table: None,
+                falcon_ucode_offset: None,
+            })),
+            _ => Err(EINVAL),
+        }
+    }
+}
+
+/// BIOS Image structure containing various headers and references
+/// fields base to all BIOS images. Each BiosImage type has a
+/// BiosImageBase type along with other image-specific fields.
+/// Note that Rust favors composition of types over inheritance.
+#[derive(Debug)]
+#[expect(dead_code)]
+struct BiosImageBase {
+    /// PCI ROM Expansion Header
+    rom_header: PciRomHeader,
+    /// PCI Data Structure
+    pcir: PcirStruct,
+    /// NVIDIA PCI Data Extension (optional)
+    npde: Option<NpdeStruct>,
+    /// Image data (includes ROM header and PCIR)
+    data: KVec<u8>,
+}
+
+impl BiosImageBase {
+    fn into_image(self) -> Result<BiosImage> {
+        BiosImage::try_from(self)
+    }
+
+    /// Creates a new BiosImageBase from raw byte data.
+    fn new(pdev: &pci::Device, data: &[u8]) -> Result<Self> {
+        // Ensure we have enough data for the ROM header
+        if data.len() < 26 {
+            dev_err!(pdev.as_ref(), "Not enough data for ROM header\n");
+            return Err(EINVAL);
+        }
+
+        // Parse the ROM header
+        let rom_header = PciRomHeader::new(pdev, &data[0..26])
+            .inspect_err(|e| dev_err!(pdev.as_ref(), "Failed to create PciRomHeader: {:?}\n", e))?;
+
+        // Get the PCI Data Structure using the pointer from the ROM header
+        let pcir_offset = rom_header.pci_data_struct_offset as usize;
+        let pcir_data = data
+            .get(pcir_offset..pcir_offset + core::mem::size_of::<PcirStruct>())
+            .ok_or(EINVAL)
+            .inspect_err(|_| {
+                dev_err!(
+                    pdev.as_ref(),
+                    "PCIR offset {:#x} out of bounds (data length: {})\n",
+                    pcir_offset,
+                    data.len()
+                );
+                dev_err!(
+                    pdev.as_ref(),
+                    "Consider reading more data for construction of BiosImage\n"
+                );
+            })?;
+
+        let pcir = PcirStruct::new(pdev, pcir_data)
+            .inspect_err(|e| dev_err!(pdev.as_ref(), "Failed to create PcirStruct: {:?}\n", e))?;
+
+        // Look for NPDE structure if this is not an NBSI image (type != 0x70)
+        let npde = NpdeStruct::find_in_data(pdev, data, &rom_header, &pcir);
+
+        // Create a copy of the data
+        let mut data_copy = KVec::new();
+        data_copy.extend_with(data.len(), 0, GFP_KERNEL)?;
+        data_copy.copy_from_slice(data);
+
+        Ok(BiosImageBase {
+            rom_header,
+            pcir,
+            npde,
+            data: data_copy,
+        })
+    }
+}
+
+/// The PciAt BIOS image is typically the first BIOS image type found in the
+/// BIOS image chain. It contains the BIT header and the BIT tokens.
+impl PciAtBiosImage {
+    /// Find a byte pattern in a slice
+    fn find_byte_pattern(haystack: &[u8], needle: &[u8]) -> Result<usize> {
+        haystack
+            .windows(needle.len())
+            .position(|window| window == needle)
+            .ok_or(EINVAL)
+    }
+
+    /// Find the BIT header in the PciAtBiosImage
+    fn find_bit_header(data: &[u8]) -> Result<(BitHeader, usize)> {
+        let bit_pattern = [0xff, 0xb8, b'B', b'I', b'T', 0x00];
+        let bit_offset = Self::find_byte_pattern(data, &bit_pattern)?;
+        let bit_header = BitHeader::new(&data[bit_offset..])?;
+
+        Ok((bit_header, bit_offset))
+    }
+
+    /// Get a BIT token entry from the BIT table in the PciAtBiosImage
+    fn get_bit_token(&self, token_id: u8) -> Result<BitToken> {
+        BitToken::from_id(self, token_id)
+    }
+
+    /// Find the Falcon data pointer structure in the PciAtBiosImage
+    /// This is just a 4 byte structure that contains a pointer to the
+    /// Falcon data in the FWSEC image.
+    fn falcon_data_ptr(&self, pdev: &pci::Device) -> Result<u32> {
+        let token = self.get_bit_token(BIT_TOKEN_ID_FALCON_DATA)?;
+
+        // Make sure we don't go out of bounds
+        if token.data_offset as usize + 4 > self.base.data.len() {
+            return Err(EINVAL);
+        }
+
+        // read the 4 bytes at the offset specified in the token
+        let offset = token.data_offset as usize;
+        let bytes: [u8; 4] = self.base.data[offset..offset + 4].try_into().map_err(|_| {
+            dev_err!(pdev.as_ref(), "Failed to convert data slice to array");
+            EINVAL
+        })?;
+
+        let data_ptr = u32::from_le_bytes(bytes);
+
+        if (data_ptr as usize) < self.base.data.len() {
+            dev_err!(pdev.as_ref(), "Falcon data pointer out of bounds\n");
+            return Err(EINVAL);
+        }
+
+        Ok(data_ptr)
+    }
+}
+
+impl TryFrom<BiosImageBase> for PciAtBiosImage {
+    type Error = Error;
+
+    fn try_from(base: BiosImageBase) -> Result<Self> {
+        let data_slice = &base.data;
+        let (bit_header, bit_offset) = PciAtBiosImage::find_bit_header(data_slice)?;
+
+        Ok(PciAtBiosImage {
+            base,
+            bit_header,
+            bit_offset,
+        })
+    }
+}
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
+        if cfg!(debug_assertions) {
+            for i in (header_len..required_bytes).step_by(entry_len) {
+                dev_dbg!(
+                    pdev.as_ref(),
+                    "PMU entry: {:02x?}\n",
+                    &data[i..][..entry_len]
+                );
+            }
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
+impl FwSecBiosPartial {
+    fn setup_falcon_data(
+        &mut self,
+        pdev: &pci::Device,
+        pci_at_image: &PciAtBiosImage,
+        first_fwsec: &FwSecBiosPartial,
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
+}
+
+impl FwSecBiosImage {
+    fn new(pdev: &pci::Device, data: FwSecBiosPartial) -> Result<Self> {
+        let ret = FwSecBiosImage {
+            base: data.base,
+            falcon_ucode_offset: data.falcon_ucode_offset.ok_or(EINVAL)?,
+        };
+
+        if cfg!(debug_assertions) {
+            // Print the desc header for debugging
+            let desc = ret.fwsec_header(pdev.as_ref())?;
+            dev_dbg!(pdev.as_ref(), "PmuLookupTableEntry desc: {:#?}\n", desc);
+        }
+
+        Ok(ret)
+    }
+
+    /// Get the FwSec header (FalconUCodeDescV3)
+    fn fwsec_header(&self, dev: &device::Device) -> Result<&FalconUCodeDescV3> {
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
+        // Return a reference to the FalconUCodeDescV3 structure SAFETY: we have checked that
+        // `falcon_ucode_offset + size_of::<FalconUCodeDescV3` is within the bounds of `data.`
+        Ok(unsafe {
+            &*(self.base.data.as_ptr().add(falcon_ucode_offset) as *const FalconUCodeDescV3)
+        })
+    }
+    /// Get the ucode data as a byte slice
+    fn fwsec_ucode(&self, dev: &device::Device, desc: &FalconUCodeDescV3) -> Result<&[u8]> {
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
+    fn fwsec_sigs(&self, dev: &device::Device, desc: &FalconUCodeDescV3) -> Result<&[u8]> {
+        const SIG_SIZE: usize = 96 * 4;
+
+        let falcon_ucode_offset = self.falcon_ucode_offset;
+
+        // The signatures data follows the descriptor
+        let sigs_data_offset = falcon_ucode_offset + core::mem::size_of::<FalconUCodeDescV3>();
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


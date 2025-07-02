Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12BD4AF12FB
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 13:01:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1710110E6EB;
	Wed,  2 Jul 2025 11:01:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="dN2UJaXY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2081.outbound.protection.outlook.com [40.107.92.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BAFD10E6E5;
 Wed,  2 Jul 2025 11:01:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lb4aOW7/9NZWKu3/mn6cHMZOvlqtdr3kfg2obhyiF0aLxkW2hf0gPkvRNDfYkZTCgEIzVVIt00DU4+zPLjdm2JKE7ASSBsno5LVYxYsrDmwDG4KViv7l/33ri7bji2LL5MPP+vv+7jiGX9rxMNStck9M7afbMcJ2saa1eg6bbD9NU54yDdwf3lUy7V9jxk1M3zJ2QfLwfvT1Zff3awk0fBkjmRKz3i4+cUbbVZn66ZgwmDXpDg4Lrz27tWM1vwlDEthPEYrWc4VKFtMIY79WCRjCWC8mviT9DGjE/PMS+qGHufTAA0ScELHvjTmy7yX5kb2TjYy6XXAQfn+KDGx7tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M0wzpSxInXfep6kkRN4i2+zyHqERwnOdqEbrJryGwsA=;
 b=guWMgtY370MJNUfMY1Unp6ATZJsMctP5tHY+3wB5TgAka3MtD4SjhPIdeu1NEn/kZxh1RzQUpwZ/pxUpu8fV35juktD4BPHl7M5p0dZAJA+jkPyTT+/2AHx06NYHDIUGnmXNXiotL/plgNCVpUdJxDnt8GNygyFy+fZCYPCdSxar/t6gThHlnyFuCwrBSV/qubWzjKHzQzjQax+iqKMagb6CnRgj0yhG6o8QNIZk20wojEbQ3j/SLRcjxFS2EpdT7crGEr+cMshG2qKOkk/TBRxX6cBZba8kAIM8GiceVRm/ob4NmOz6Ku1d66vp4vrX3fZEV9OcdaSP9ozmyifX6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M0wzpSxInXfep6kkRN4i2+zyHqERwnOdqEbrJryGwsA=;
 b=dN2UJaXYSH8BiOI0INvvYVRsXA0JTHhI+U7ahOwj4O0dnWXqaDYkHI288EdMtWrz/Nvu+ovVuIQ+Rlths6Qt7w8s1+yOUgjqTPxtQ+xZdQl2jnStKKLGjMu+VM1wObrPRqvlrxykc7EWGn4uEhRUtJzyMdmfSVA1Q3Puf06/FNG7I0mw+jgLR3pyeunBkKNfekKSe6vbNWj097d2xSfexA03rVidaVaVUnDBpYqGjST3oYgCteW254FqsBRkpWNb1kOsHgqDtRuJrjGr5yuwSr2XBA31kK0wzNt25gSPsw230oMGGuLvNvQG0wMh6MVtvIGZuU4amZKOZKppCxme8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CYYPR12MB8892.namprd12.prod.outlook.com (2603:10b6:930:be::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.22; Wed, 2 Jul
 2025 11:01:11 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 11:01:11 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 02 Jul 2025 20:00:41 +0900
Subject: [PATCH v3 4/7] Documentation: gpu: nova-core: Document vbios
 layout
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-nova-docs-v3-4-f362260813e2@nvidia.com>
References: <20250702-nova-docs-v3-0-f362260813e2@nvidia.com>
In-Reply-To: <20250702-nova-docs-v3-0-f362260813e2@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Joel Fernandes <joelagnelf@nvidia.com>, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0247.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CYYPR12MB8892:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f667a86-d380-40c5-d2ec-08ddb957c0fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K1lHdXYxQzlsbHZoeERNVGRiMXFGVXZFNGV2NitaOS94T09TenQrYk1JSENr?=
 =?utf-8?B?MXR1RUFEOFVwUW9wRXJpTGhUbHFhcE0yQ2ZaVTZGeU1rTzQ2MDlTdlQ5TzVh?=
 =?utf-8?B?ekVqZUxCbVNwTzd4NHgwc24vV1Y1OHFMOE5CbTNwN2FacXpRcGRzRFVqYW5a?=
 =?utf-8?B?cERHcGdWRlRPektKRUtmY0tnTGlyTlFaZnlWQmJZUTlwV0Rla3Z4VGlPQWVR?=
 =?utf-8?B?NkVSS005K1lXckhhQk5BUkt1VWZHTVBDV0hIQTNaUW1zQjhEcUZYT01MRFlP?=
 =?utf-8?B?blBaUjVlTzJiR3lwdGxmdE9uOUFxMkY5V3hDMDYzaFdRTjBTSVZDK3AzWUpS?=
 =?utf-8?B?Y3psZ1JZWU9YdytoSlRSUUFUOHB0VllhUVRBV1RkMnFJRkRNQU5ZNlJ1NnEz?=
 =?utf-8?B?MFJ1bG0ybWNHRkRpK3B4QWczZEM3TzV1QkY5MllBUWN5WUtTaTZmVTZUd3Vj?=
 =?utf-8?B?YklWcjVKd0ZIdXQ5bUF4cVJjRzBvbTZmaHhYSjE1bnNJdTUvaHBVTThiN254?=
 =?utf-8?B?THNTWXVJR0x6WnpXMEx1Zm9RRFhIcml2NCtmL0R2d0tDbHFWS0U0L1NaVm5B?=
 =?utf-8?B?cGhWRDVuUVVXOXVwNWlFL29MOVI1UE9YeUI5Y2ZsdGl3Z01lTUlGTDdaYXdM?=
 =?utf-8?B?SEc3QVNrOVpEZVUzaWFVL0FSTy8rbUVLaHJQRlNLazZxenl5V2UwaGE0clZ6?=
 =?utf-8?B?S3d2d1pwbkVOOThXdGN4TEdheElFU3hxNmEzTU1LNWE5cGI2TC9qWjl6Um51?=
 =?utf-8?B?VFBtWDQ4V043ajJRYngvWmtDVEM4S0tFR2ZmUEIzNmNpREU1eG45Ump4S3gy?=
 =?utf-8?B?R3hkU3FZbWlvOU10anhQM1Q2eVlGaS9MZ0oyMjhwU0krM3Bob1dQZG1PM3dn?=
 =?utf-8?B?VG9Vc25BZStFMVFGNnBFS0FLQ0xqMUsvd2dJUXE4UUl2NWVKZTB2Q3pTWm1P?=
 =?utf-8?B?SHM5MzJjRC9WZUcrbWZ0a2NrTlJWc0NUS0l4bXZndVpmY09Falg0M3lXdUhV?=
 =?utf-8?B?b2ZKYkdFazN6c3ZtUnA5YnpUai9wM0FjN0FJSTA0U3BadW1kNmhmT0UvOFZM?=
 =?utf-8?B?Y3hKSkJZMmg1ZmFmUzhmQWtvSUVRZ2kyMk1TZVhVZnhWSmo4RWo4WjdQTFhC?=
 =?utf-8?B?dGs4R2ExbnBoelYwWEZyREI5d3ZuK3JCQjBEbUFQM0hlNEIvS0hnNXNqZktL?=
 =?utf-8?B?QzJoNFFTbGNTLzA3QTBkQ2I0TEhwcHRseXBjdXA5WlZwYUJvQmNQVG1sYWNh?=
 =?utf-8?B?M0RURndLKzJGVHh2dTN6bm4wZ2ZtUUx0ckpKTzlQVzV4QlJXa1d6YStRcGh3?=
 =?utf-8?B?SjVoaXlQdjlvSmhvVUUzaVdRKzV3TVVhellqNCt6UHYxSnY4OGJ4QUduc1hN?=
 =?utf-8?B?cXV5Y05hWTdHWkZFY1VnQm4zWTJsNVptdTlTUFZOYUFzTGVlaFZJRWY1TnJu?=
 =?utf-8?B?cXZQTjlXSXJuclROVm5kNWkwTjBiQjlDaTVNNTdKcUxSclRLUDN2NFE1TmN3?=
 =?utf-8?B?Kzd0YTJwaW51QTVPU2xqNkRJQmNuQ0JSYm03UXpxblhncm5zTGdjZ2xCdC93?=
 =?utf-8?B?VktEeER1c3lnQ3RiaFpyU3cyS0orUlFOaUlyL0NYdCtsVXpqYW9KWHlQWHg4?=
 =?utf-8?B?UVdxTkNUOTFzMytRNGVNS3lQVllucWVreWZxQXFzdHZWNXBqREZDQ1Z6KzlR?=
 =?utf-8?B?cWRXem1xY2FtRXhBcUhZS00wNHhzQ2xDL1R6S3FrWHFwcmwyTExMcGtNUmtS?=
 =?utf-8?B?U0dORndpckxlemhUcWZsNnVoY20wSEdqUjlBbExZZ2doYXN0K0RVRXhzM25R?=
 =?utf-8?B?dDRLN3hlcllvQ05WMmUzdHVJREFSZGxHdlZRVTExUndUZnhHUURUMWVGUEpw?=
 =?utf-8?B?MTZ5R0RyaDdqK3F1TUprT2RmUmZiS1ZnbkJUYWhMeUtFbkNMdlZzc3JJaWpu?=
 =?utf-8?Q?trim04sNNrw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eDNIWUtJcXB0bWZVZktiWmVOdm4zcy9BdHE5RFN1YUNSZ3JYaVNnWXhKM3RX?=
 =?utf-8?B?ajF1ZDUzNHZsT3JGQWN0VUo3ZFkvZGpQcUhVMjZrbDlNT2dORDhqWmVCUDI4?=
 =?utf-8?B?bnJoTWVVbndEQ21DcEJKMFZTb0xJYnRBYkI3RGQ4UHIvOXQ4ZzNrL3VpR3h1?=
 =?utf-8?B?aXBKMTNlcG9LdkQxSHVTWTVNamVSR2NGWldKWHhzZDdkT2k1TUdsa3ArdTRz?=
 =?utf-8?B?MFlNMnJqZy9MWUZXZkxsS3dDMjlnVmM5dytLMmpJbWJjMzNFcnZBMHlSTDJ1?=
 =?utf-8?B?YTd6MVJzbVZHVlhOdFlZY1AxNU9oS3JOS2ZJLzJoTFppd3NNM1RXbDNOZGRh?=
 =?utf-8?B?ZEpZbmUxTzlwT3lYYVhZT09KQ0tMU0tEclFQTGp1SWF5b3RyUmtrenY0WjBV?=
 =?utf-8?B?b2lYV3dqN0ozTVMxQmM4U0RFWWVVbXpZdlA5TkpBcXVISXNZbDdsaWJKZHBr?=
 =?utf-8?B?OEZPdnlycTFtMnN4QlFtbWI0TjFDTjVZRzRodU9MS2dZTTc2UW1uM1JmbFBO?=
 =?utf-8?B?bVVYYnJsQ3ZYRHdwcis0bGlBYWlUSFo1dHVSYWNmRWpNazFtUEw2clhERTJu?=
 =?utf-8?B?U3pSd1VmTDlhUmpIa2ZDSlVOQjFiQnlNdkFSZ3pSS2NyNXovMWFIbVY5TXNR?=
 =?utf-8?B?b2FhT1ptSXhPdzk4dHYvT0lHMDNFbGhUVnRVTW80Nndrdkxvejc0MVRnMW5T?=
 =?utf-8?B?dXJBcURZNWVFNTN3aFY3ZEpLSDBnc0tZcXBZeGhZaWV5eE04VTIwcU5oV3JD?=
 =?utf-8?B?UEI5SkdmYy9KZ0RUaHZiVnFzNUR2U0N6Y05uSEk5R0xvTXI4UUVtTCtQOUFk?=
 =?utf-8?B?UExLdGFxWU1EbzgxUW1qL0dCUHB6R0tzeFNuelhTZjBRWVdBUElDRVNuSmFS?=
 =?utf-8?B?T3lEeE1OS1hpZEZFVkRxRFhSNWhtbTZja3U5aFArd3RleTEwd1krVDFxblFH?=
 =?utf-8?B?Z2VmT1hJS0lCamR4cy9XMUhUNzFlNlpjUlF0NlFXLytuQnk1SG83QVNMSHZt?=
 =?utf-8?B?MGZyd0c5cUNWTFlnMm5VYWZua0VsRXEyc0R0ZFh3ckZtSVZ0bHEvYTl0NFVG?=
 =?utf-8?B?NlJrQ2lQaW90a0piL3dwVTFZcS9BN2t0Q2N1Ulk2aE9RNStJQXlWc2wwdERI?=
 =?utf-8?B?YW9WWHQ3TW9Vb2dCRTk5cGxwVUtoNnMrcGVmV1loVzZVMzg4UllRVzZHZW9L?=
 =?utf-8?B?cE5TWVZpN0lVSHRBcGk1YWRjU2lKS2xVUXFDNDA3Uk5aZnUwQlpmYXp1dkZk?=
 =?utf-8?B?T3J6MWluZzJ6aXd0VXp4Nll3UnFreHNkdnIySEhPVTczNldMUHlnYTNjRUlK?=
 =?utf-8?B?bXNVSzJvVk9peTRzV3NPOCtUNElvalBOOWVJazhlSExHbGtPT0oyWVdjNStj?=
 =?utf-8?B?RlNWWFlFbUlaYU9Eamt4WmNYeTRXN3BtVWZMUDZUSGdYaXhZYk52UWVSRFJV?=
 =?utf-8?B?M1JIRjVCMStrOVZlMFYyOFVmQjhNUEtiNGdQcTFSRG4xOVJObTRVcHNVQ3hK?=
 =?utf-8?B?WXlkUzFwQmY3THdhWkVLdVQ2U3pDNjRTNS9QZktYdmgvTk1nVGVSeS9Td0Fs?=
 =?utf-8?B?UHhtMHcwYk9XQlI1MWF2Y2RMdGczMFgvZ3NsZVdpZTN6cmNIYkt2cWdJbXBF?=
 =?utf-8?B?OENNSDFtMS9yYVJ1NlV0MVFTUXJyTEJXZGNBbnUxUWFjckNnWGh1NHU1cEc5?=
 =?utf-8?B?c211MCtDNWowa0RySkhTazJBUEp1V2NxN0RvaTgyY2Z4T2FNVWFlMGtpVWFx?=
 =?utf-8?B?NXhCWVdJNTdNK0g0UG96SjVmcFNoUnRIOHNGVnNNNzJiQktvRGE0TC9ROFQ0?=
 =?utf-8?B?aUQ4UUFmaFl5ZFkvZDhYK21WSVc5Vkd2ZFhJaVJxZmVDRXNUeFcvU3g2MnJr?=
 =?utf-8?B?aHNUcXNPb213cjIwdHV6VlBlTWZRWFM0WUQ4S2k1cVlwVlc0NFRnNHZKVXlH?=
 =?utf-8?B?Y2lhVm9Rc3NGRjZmUGhNc3UwM00xUW1mNHdiMlA2MzBLdENMTEhTaGkvZUQ3?=
 =?utf-8?B?cmhieVNNckJ2Z3lEWHdlbkpHaXBndWRlL2NoUGc2djJTYVRGK0E3dkJvMWhr?=
 =?utf-8?B?MzZIV0ZINUZGTUl1ai84bTZEMXAycHR0dDhvM2pKeS9UUFpub2VlS3QrWmkx?=
 =?utf-8?B?SUUvMUlRdjRvbDgzSnliQ2tLQkUwRGlpcldpWG5uNHUxZVZlU3VWa0YrbjRZ?=
 =?utf-8?Q?kSB5LphLwIk+Lv7SFUvC5B3pJ2qCjy9wMz/3B0goUxcG?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f667a86-d380-40c5-d2ec-08ddb957c0fb
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 11:01:10.8944 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mtqMmrhVinzd69rDqgGssEWGr9jpJT+SnrxtJbCbXV2A6VN0YT54wI8ohoIW6EW5+7IMaDGApaNTa9+4fFd5Wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8892
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

Add detailed explanation and block diagrams of the layout of the vBIOS
on Nvidia GPUs. This is important to understand how nova-core boots an
Nvidia GPU.

[ Applied Timur Tabi's feedback on providing link to BIT documentation. ]

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 Documentation/gpu/nova/core/vbios.rst | 180 ++++++++++++++++++++++++++++++++++
 Documentation/gpu/nova/index.rst      |   1 +
 2 files changed, 181 insertions(+)

diff --git a/Documentation/gpu/nova/core/vbios.rst b/Documentation/gpu/nova/core/vbios.rst
new file mode 100644
index 0000000000000000000000000000000000000000..55d7dd4a6658c2a20cc5617f96b278bc4ec2ba17
--- /dev/null
+++ b/Documentation/gpu/nova/core/vbios.rst
@@ -0,0 +1,180 @@
+.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+==========
+VBIOS
+==========
+This document describes the layout of the VBIOS image which is a series of concatenated
+images in the ROM of the GPU. The VBIOS is mirrored onto the BAR 0 space and is read
+by both Boot ROM firmware (also known as IFR or init-from-rom firmware) on the GPU to
+boot strap various microcontrollers (PMU, SEC, GSP) with critical initialization before
+the driver loads, as well as by the nova-core driver in the kernel to boot the GSP.
+
+The format of the images in the ROM follow the "BIOS Specification" part of the
+PCI specification, with Nvidia-specific extensions. The ROM images of type FwSec
+are the ones that contain Falcon ucode and what we are mainly looking for.
+
+As an example, the following are the different image types that can be found in the
+VBIOS of an Ampere GA102 GPU which is supported by the nova-core driver.
+
+- PciAt Image (Type 0x00) - This is the standard PCI BIOS image, whose name
+  likely comes from the "IBM PC/AT" architecture.
+
+- EFI Image (Type 0x03) - This is the EFI BIOS image. It contains the UEFI GOP
+  driver that is used to display UEFI graphics output.
+
+- First FwSec Image (Type 0xE0) - The first FwSec image (Secure Firmware)
+
+- Second FwSec Image (Type 0xE0) - The second FwSec image (Secure Firmware)
+  contains various different microcodes (also known as an applications) that do
+  a range of different functions. The FWSEC ucode is run in heavy-secure mode and
+  typically runs directly on the GSP (it could be running on a different designated
+  processor in future generations but as of Ampere, it is the GSP). This firmware
+  then loads other firmware ucodes onto the PMU and SEC2 microcontrollers for gfw
+  initialization after GPU reset and before the driver loads (see devinit.rst).
+  The DEVINIT ucode is itself another ucode that is stored in this ROM partition.
+
+Once located, the Falcon ucodes have "Application Interfaces" in their data
+memory (DMEM). For FWSEC, the application interface we use for FWSEC is the
+"DMEM mapper" interface which is configured to run the "FRTS" command. This
+command carves out the WPR2 (Write-Protected Region) in VRAM. It then places
+important power-management data, called 'FRTS', into this region. The WPR2
+region is only accessible to heavy-secure ucode.
+
+.. note::
+   It is not clear why FwSec has 2 different partitions in the ROM, but they both
+   are of type 0xE0 and can be identified as such. This could be subject to change
+   in future generations.
+
+VBIOS ROM Layout
+----------------
+The VBIOS layout is roughly a series of concatenated images as follows:
+(For more explanations of acronyms, see the detailed descriptions in vbios.rs).
+
+.. note::
+   This diagram is created based on an GA-102 Ampere GPU as an example and could
+   vary for future or other GPUs.
+
+Here is a block diagram of the VBIOS layout::
+
+    +----------------------------------------------------------------------------+
+    | VBIOS (Starting at ROM_OFFSET: 0x300000)                                   |
+    +----------------------------------------------------------------------------+
+    | +-----------------------------------------------+                          |
+    | | PciAt Image (Type 0x00)                       |                          |
+    | +-----------------------------------------------+                          |
+    | | +-------------------+                         |                          |
+    | | | ROM Header        |                         |                          |
+    | | | (Signature 0xAA55)|                         |                          |
+    | | +-------------------+                         |                          |
+    | |         | rom header's pci_data_struct_offset |                          |
+    | |         | points to the PCIR structure        |                          |
+    | |         V                                     |                          |
+    | | +-------------------+                         |                          |
+    | | | PCIR Structure    |                         |                          |
+    | | | (Signature "PCIR")|                         |                          |
+    | | | last_image: 0x80  |                         |                          |
+    | | | image_len: size   |                         |                          |
+    | | | in 512-byte units |                         |                          |
+    | | +-------------------+                         |                          |
+    | |         |                                     |                          |
+    | |         | NPDE immediately follows PCIR       |                          |
+    | |         V                                     |                          |
+    | | +-------------------+                         |                          |
+    | | | NPDE Structure    |                         |                          |
+    | | | (Signature "NPDE")|                         |                          |
+    | | | last_image: 0x00  |                         |                          |
+    | | +-------------------+                         |                          |
+    | |                                               |                          |
+    | | +-------------------+                         |                          |
+    | | | BIT Header        | (Signature scanning     |                          |
+    | | | (Signature "BIT") |  provides the location  |                          |
+    | | +-------------------+  of the BIT table)      |                          |
+    | |         | header is                           |                          |
+    | |         | followed by a table of tokens       |                          |
+    | |         V one of which is for falcon data.    |                          |
+    | | +-------------------+                         |                          |
+    | | | BIT Tokens        |                         |                          |
+    | | |  ______________   |                         |                          |
+    | | | | Falcon Data |   |                         |                          |
+    | | | | Token (0x70)|---+------------>------------+--+                       |
+    | | | +-------------+   |  falcon_data_ptr()      |  |                       |
+    | | +-------------------+                         |  V                       |
+    | +-----------------------------------------------+  |                       |
+    |              (no gap between images)               |                       |
+    | +-----------------------------------------------+  |                       |
+    | | EFI Image (Type 0x03)                         |  |                       |
+    | +-----------------------------------------------+  |                       |
+    | | Contains the UEFI GOP driver (Graphics Output)|  |                       |
+    | | +-------------------+                         |  |                       |
+    | | | ROM Header        |                         |  |                       |
+    | | +-------------------+                         |  |                       |
+    | | | PCIR Structure    |                         |  |                       |
+    | | +-------------------+                         |  |                       |
+    | | | NPDE Structure    |                         |  |                       |
+    | | +-------------------+                         |  |                       |
+    | | | Image data        |                         |  |                       |
+    | | +-------------------+                         |  |                       |
+    | +-----------------------------------------------+  |                       |
+    |              (no gap between images)               |                       |
+    | +-----------------------------------------------+  |                       |
+    | | First FwSec Image (Type 0xE0)                 |  |                       |
+    | +-----------------------------------------------+  |                       |
+    | | +-------------------+                         |  |                       |
+    | | | ROM Header        |                         |  |                       |
+    | | +-------------------+                         |  |                       |
+    | | | PCIR Structure    |                         |  |                       |
+    | | +-------------------+                         |  |                       |
+    | | | NPDE Structure    |                         |  |                       |
+    | | +-------------------+                         |  |                       |
+    | | | Image data        |                         |  |                       |
+    | | +-------------------+                         |  |                       |
+    | +-----------------------------------------------+  |                       |
+    |              (no gap between images)               |                       |
+    | +-----------------------------------------------+  |                       |
+    | | Second FwSec Image (Type 0xE0)                |  |                       |
+    | +-----------------------------------------------+  |                       |
+    | | +-------------------+                         |  |                       |
+    | | | ROM Header        |                         |  |                       |
+    | | +-------------------+                         |  |                       |
+    | | | PCIR Structure    |                         |  |                       |
+    | | +-------------------+                         |  |                       |
+    | | | NPDE Structure    |                         |  |                       |
+    | | +-------------------+                         |  |                       |
+    | |                                               |  |                       |
+    | | +-------------------+                         |  |                       |
+    | | | PMU Lookup Table  | <- falcon_data_offset <----+                       |
+    | | | +-------------+   |    pmu_lookup_table     |                          |
+    | | | | Entry 0x85  |   |                         |                          |
+    | | | | FWSEC_PROD  |   |                         |                          |
+    | | | +-------------+   |                         |                          |
+    | | +-------------------+                         |                          |
+    | |         |                                     |                          |
+    | |         | points to                           |                          |
+    | |         V                                     |                          |
+    | | +-------------------+                         |                          |
+    | | | FalconUCodeDescV3 | <- falcon_ucode_offset  |                          |
+    | | | (FWSEC Firmware)  |    fwsec_header()       |                          |
+    | | +-------------------+                         |                          |
+    | |         |   immediately followed  by...       |                          |
+    | |         V                                     |                          |
+    | | +----------------------------+                |                          |
+    | | | Signatures + FWSEC Ucode   |                |                          |
+    | | | fwsec_sigs(), fwsec_ucode()|                |                          |
+    | | +----------------------------+                |                          |
+    | +-----------------------------------------------+                          |
+    |                                                                            |
+    +----------------------------------------------------------------------------+
+
+Falcon data Lookup
+------------------
+A key part of the VBIOS extraction code (vbios.rs) is to find the location of the
+Falcon data in the VBIOS which contains the PMU lookup table. This lookup table is
+used to find the required Falcon ucode based on an application ID.
+
+The location of the PMU lookup table is found by scanning the BIT (`BIOS Information Table`_)
+tokens for a token with the id `BIT_TOKEN_ID_FALCON_DATA` (0x70) which indicates the
+offset of the same from the start of the VBIOS image. Unfortunately, the offset
+does not account for the EFI image located between the PciAt and FwSec images.
+The `vbios.rs` code compensates for this with appropriate arithmetic.
+
+.. _`BIOS Information Table`: https://download.nvidia.com/open-gpu-doc/BIOS-Information-Table/1/BIOS-Information-Table.html
diff --git a/Documentation/gpu/nova/index.rst b/Documentation/gpu/nova/index.rst
index 2701b3f4af358b373d4ef47975d5a80213f3e276..f38041fcd595524b204eabf6ca3aad51038682cf 100644
--- a/Documentation/gpu/nova/index.rst
+++ b/Documentation/gpu/nova/index.rst
@@ -28,3 +28,4 @@ vGPU manager VFIO driver and the nova-drm driver.
 
    core/guidelines
    core/todo
+   core/vbios

-- 
2.50.0


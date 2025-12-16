Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4181CCC0F83
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 06:13:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 755AC10E6A8;
	Tue, 16 Dec 2025 05:13:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="QzOm65vO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010003.outbound.protection.outlook.com [52.101.46.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6375510E209;
 Tue, 16 Dec 2025 05:13:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j02Q/OuRaq1gXOecK+XvJDREvXMDVLo01OR42MKTjI8XaaZtdT6JbORdFwf07oVnA04k2Qj12jBzLRG32u1hDMJVcOQ2314ZzeOeSMACb8n7cZtnPUaCl84jTfBaq29N+Mn+9sV9/qc5WnXItaP3KM/K/CDyYqa8S80q9+1nAfx/MGwRomITY42N5Uxw3FzUc8K/aDN6qVqtgAvU3fekY5sPaHLYH2SIwW5+fELp7fyxbDSSrnVNCfd39gjaX35i+6LFUcCUO1kkiO+0hUW8fLWHQFy6QLH8hbmqqkcgzgV0pVNGAIX+T9mB57ahJwHM9xuAne/oshGiYSvigxibNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=njB3XbabS5wdP9ffYEU+rRaLSkvMYGkElAUc0uMcjYs=;
 b=eq06RfhPypfxYWSKwFh7E69Q/vPB3+GZXZ3bq8ooXAThRqaODx5KlfnIbmX97WXPs64sPSMf8G4W/TGYqjeVNYnKJ/5LdfQHD6L/7nH58DVu9rTSyVjmclFhovM6Il7yMNbpiWwke0I4fXVBhbfw5HLA8+HecseJ3wONsyUBRR7iYtHXFoNS8KSnZ1dF7Ipu9qsuLd+Nh6EEfsCde7d3GxIaWE4JO5FEpqN1iQHIMz4cW6AvPZWO/yYjYBensqMrpEp5fGHJo+5EExIf78F/jFiqX+DfBUJMvMhXaU6emt+TLDoxMUlXYxUGtFrke0kpXaFDHO4wob1ethL9SXHy+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=njB3XbabS5wdP9ffYEU+rRaLSkvMYGkElAUc0uMcjYs=;
 b=QzOm65vOsLiXvccaOoA5gqoCqPCmGTwoxA73iqPsu3bZ01KNeunTAamOsbQC1IO7dKUHka5Rb8NrymCrvAV7B/rVeh7BpHNG0q5xC7LRxaCNPzl36noVq/QP5S6+E4uuoFl3ovmbY0G//nvVFM0jLBK+TP0u3tlPl4HIKiFdNA3YhQPPn19UD7oaCBB5zkUJVxe21sA+AWqvYCqW/ObOIeHOKxvWR18jbFCjAv8tDk16tCA0GmMioCreeJ8jk00A9JKXI8UBYt/H5FVmekBm48ioARGY37etP3BYo/be6ymLCor3u3KZtMUMQkj804KZ9lron5cMug9MMWlq5G+PJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB8816.namprd12.prod.outlook.com (2603:10b6:8:14f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 05:13:36 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 05:13:36 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 16 Dec 2025 14:13:27 +0900
Subject: [PATCH 1/7] rust: pci: pass driver data by value to `unbind`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-nova-unload-v1-1-6a5d823be19d@nvidia.com>
References: <20251216-nova-unload-v1-0-6a5d823be19d@nvidia.com>
In-Reply-To: <20251216-nova-unload-v1-0-6a5d823be19d@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0328.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB8816:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cc124f2-a999-42b0-cf16-08de3c61ddad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|7416014|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cmJsT3RXU0kxSkdwWE5nalh4MHlackpSMUFySERNSSswWU5VQ2ZqQVh0cTQv?=
 =?utf-8?B?RFh0Q3lxVXpVWXNKQ0tMZlBucTZmK0ZCUFRqQXRRWVlFMURJc3RtOFhZcTR3?=
 =?utf-8?B?ZjZiK3dra3FXeW8vbWhFN0pBdXNLd3NWNWVZbzhBTlVYakpuN3RlczF3T3V6?=
 =?utf-8?B?TE1UcTlycFBDcGZROWJ2TGIrZit2ZHhMeDBjbE9HTFowaENGVjBvdWNVUml1?=
 =?utf-8?B?RmgrMzFhMmxnVmt1SGsxVWhLUmkzZ3FDdjl2dWVsMmpodTZFMGQrelBoUDFJ?=
 =?utf-8?B?eVJjRW9DMFJYeC9kUkFSTitSRFpLZmhZS1hiUDIvL2VqTHRBcG02YTJMK1BR?=
 =?utf-8?B?V0JrNFE0U252KzVqUDVQVkhqamJtMVFQWTJva1hpUlBvTUNET1JrWjJqTkVF?=
 =?utf-8?B?dkVDZk13cDhCTG5xQlFMaHpRNmdtdjQ4dEVCWms0YTYvL0hxNmZ2eStVZXNn?=
 =?utf-8?B?MHlHR3RjVE5HaXFDSWw2WFhYVURrdmU1ek55R2FIU3Z6ZElMakpSL1lpWEhv?=
 =?utf-8?B?UDY5TmwwMHR0dVRNMWdhOW8yc0hQWkNFWHl0S1VIU2Q1eno5OUtHZlFpNHJ6?=
 =?utf-8?B?OHdtSmQrUUZrNXJXa05jS1crTFlrc2RHZ0NTdUxBWHlPRDIzTHBwWStObS9y?=
 =?utf-8?B?RGlsNTJpU3ZldDBtVXEyV0g3MkxQR2VJZ3lXV3VxWEZ6NUEyOG96S1ZYaTlY?=
 =?utf-8?B?V2RCWk9sbDNxVlBvdjFNSlNxejE3SHlLOHBjaGFScmVQc2FML1l6Q01mVEM0?=
 =?utf-8?B?R3dYWWNQMFhJNENIZUNpVmZwSGV3L1VWdHljSzFkek0xcWRaVndGdXJJLzFr?=
 =?utf-8?B?RExUSnhzZmVWOHFsVGlsR080ZkVCLzBzK1c4MmF0VlpIYWNKc0RzZHJCOXBi?=
 =?utf-8?B?VWpCcCthTFc1elMwZXJhUFJjRUZhbDdnZXBrMVNCdVllQkt5SnIxYUtWTmlW?=
 =?utf-8?B?MkpMNzZzNWJJZ1ZBalVwbEVZZGtOUGIyb09uZzNaYzc5alg0UXc3MjViR2FD?=
 =?utf-8?B?VUFPL3FQekNndXRUbDBGYzRmU1JGV3NpUXFoMFZraHhMZ0JHU3lnNkpvZWhX?=
 =?utf-8?B?ay9oQjNsakNEZ3UzQ0E2UVBqOFFWTzhlR2dQSzZXWDlUbWZTc1Zva1o1bkRw?=
 =?utf-8?B?WDlidHVERnh6WUJzQWszQml6OXoveDJ6L25ZNDF5S0JaK3gwR0pMUW1xWS82?=
 =?utf-8?B?bFJudHQ4bnVkajA1cWk0MVVUbVBDeDNkODJtTHBWTGZta3hMVEE0QUtGSzFq?=
 =?utf-8?B?dlhic0h3ZXBPTkd4Sjl1M3dibnJJUDFUOXlmSXlXQVRlbVp6VDJGM3J5ckta?=
 =?utf-8?B?OGhJaWlyeXFnWEpOY1Q4MWUveW8ydzJhdDFRek1DR3JjVFZMQ1daTzg2dlcv?=
 =?utf-8?B?WXdwMkhOTENoQnNKRXQ3ZGJxRDRNNWlQUkZBWTZHb0JSUkNHY0FJMEp6eVNX?=
 =?utf-8?B?cUUzVlJ0dTdFTjRESkN0VmRNV0wxSVpaZldoaG1tamJQTXZlcm5uTDZJR0xy?=
 =?utf-8?B?eG5Ca3lUZm85UStXZTI5dHA5ZmxiWDMzellodnhBaTlLWTd4S3Nnd0tmWlh1?=
 =?utf-8?B?d0g2ZkNqUmJPY0t5SkNPL1BuL1lqVC91MkE0WVpIOEtTM3NwYkJ1R0VyaXZP?=
 =?utf-8?B?eWRRNmdzRWxrMFl5c0g2MDBQeGkxSkhPcHByOW0wZTRXMEZvWGRXZkJkOEVO?=
 =?utf-8?B?T2k5K2ZvdTVJQkdJckZyWGQ1MHlLZW5ad3IwZGR0Z2JGOFY0Z0w4U3dESGJ3?=
 =?utf-8?B?UTM1dG5PdGFGeEhGdXNkbjd3ci93dEF0WFJPMFFzaHBQY252QmJzL0FOSXh3?=
 =?utf-8?B?Vk1qNDNKZW5PYmlDOGFRZlMrQktSWncrdWJDMUpZNHNwS21XaW1Ha2pocGpE?=
 =?utf-8?B?b09XY3ZvVTJ0akFOd1ZqUWE4aTd5N3NVb1Ftb1kxeXhDR2NmSkxtZ0RoeVYr?=
 =?utf-8?B?SDRlRXVDTXBSMHlSL1R1YmZXbERoSzhBVk9mWUZtbWdwWmZIaktNUGJLSjJN?=
 =?utf-8?Q?K7j5obgg3sTkVrTwYOaaSPupFf8tG8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(7416014)(376014)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MldGZ0RKSGpzYTNUUytacXIraVJCREg2MThtRFlyWnhBZUJrNE45UDBKR1BN?=
 =?utf-8?B?NDF1THh4LytsdXVSWVN5ZDNsdFA5M0RBV1FrUlpITkdlK0JndG1hM2crb0tC?=
 =?utf-8?B?Y1crVEoxMnpzbUMvaC8rak5JYVhxNXBKRUI0NFNNazNVWkozTWN1VXlKbHJT?=
 =?utf-8?B?dDB1MlZ0ZlZVeHRETlgxUW40SEc2bFhMREVpYmpwS1djckdvVTRvREZYYXJB?=
 =?utf-8?B?WWNOcE5iVkU2RGs3Q2QxOFNCNlArVlZBbjJpVDdQdEtnRXhPSDU5a1hoWS93?=
 =?utf-8?B?eTk1VzY4ZStQSTN1bE96N3BTSENUUVZMNU44S1ByVnA4MGhoWEx3TnRHdTFv?=
 =?utf-8?B?WXQyc21VTFdhQ2NUVFRGeFZEUzZqWG9lSFBwK2NmRHI5K3dwWGNFbEVIRE10?=
 =?utf-8?B?UHlPdE9tcDB6dmpvbTR5U0lMVDZLVnlEbXcrN1BGTXMxV05EeG5paU5WSmM4?=
 =?utf-8?B?MWZVT0VGT1UzSTE4NjVQYjZaSWtiV012d3BITm9MVVRnUkdTNU9USFRPQUZm?=
 =?utf-8?B?c0NSMkdIR05EMmovWDNPYlpuZk5aK29kK2hKZ2xORWlqd2xKazhOQUR0ekZj?=
 =?utf-8?B?UlV3SjJKTW9CcEhCM1pBYjZHRXpGYjlSNnhJMWRXWHJYUTlGd3UwL3Z1TFR6?=
 =?utf-8?B?SEY0a1dyQjk3Q2FER0NsV3ExTnRJZTV0Q2VKeHE4TVUybksyMGhzakJkNk13?=
 =?utf-8?B?VHJSajNmYU4wNEMybG5NTEtDY1JpZjEyQ3BMTmRjS2ZJVnRjTGg3TUViVjll?=
 =?utf-8?B?VTNTd2J4c2p2TzFIMmlrOWtESGpqREFtSFZ3MnI5R1VWQlhoM200RTVXRkE0?=
 =?utf-8?B?bFhmSVJKc3hYZzJLT3JNSnJ2VHg1eS8rODJLdktGNVdDMGtpaGdwZ3ZBWG53?=
 =?utf-8?B?RHRNeDVxZnBNdGpZck8vRWZKM3RKRW8xMGJGdndyNjBKdFNIVElJakR4QTN5?=
 =?utf-8?B?MEpEVEwySzNTZDhMVGYyNm9VVFNsRWRvRjZVcU9BdjBlN3dZbkpINEVrVlpn?=
 =?utf-8?B?dWFxMStoRjJudE5nSFFCZzVCbHBUaEpXZWZIZGVNNHh2QkV2NEZzN0NNVHVQ?=
 =?utf-8?B?NHBXOE42R0h5QkFxaXJYa0JyM3FuWU00cXhQUTY2a3hNUVNYWW0zemRxQ0s0?=
 =?utf-8?B?VlZvN2IxUHZZbkRMV05odjF0VEtybHdRSXZVcEt3TjB0Skdvd29EMEpnaWhR?=
 =?utf-8?B?V1VacDAvZk9YenYzSStDUVFQZ0pEUXQySHBoVkN5N25UNmpLT0p4M0lQdWpY?=
 =?utf-8?B?NUFLWkZoU1krSjRvRG1YS3pxVHk2WXZwY0wvNmpFeTZKR0NQUEpiQ2lVODFP?=
 =?utf-8?B?R1phc3ViR3RSaUxaZmtBOU5JRkNEdnJjM1pMUmpEWm8xVUs0dGUrZHNVK3dw?=
 =?utf-8?B?aU4xbmN6SXFPeUxjK0pWaGEvUnpSUWYrV3VuWmZDZEkxMGh6ZUV6UGNXTXhV?=
 =?utf-8?B?Yjg2Z0k3N0dLcjBkdnNXY3ZhS1dxbzFGWFFmUjFBN2s2eHRBOUtkNER0ZWRu?=
 =?utf-8?B?SWFwMlN0Q2NZRVpuT1BaWk16RzhrdmwvNTZyZHpoR2F6UGtvMUlGdUl5bGdl?=
 =?utf-8?B?UStpaVdQRVVSN1NaMUhlaFZxSGJrUFZuV1N4QVpTZDNFR1dJVURxM2ppdDd5?=
 =?utf-8?B?Wkl2V3pHRUIrRU9CenJyTEVSMlpNd0ZhMEVSNTNqM1NLYXY4TzE4bEN5QUZh?=
 =?utf-8?B?MW9xSnMvSndVSVBSbzZ5Y204QnQ4TkFzblhOeG1xMm9OS3FMNi92NHF0SDBR?=
 =?utf-8?B?QXgrUHBrTGhNR1FrTGlRL3MzRHE1OEZpQ0tKVG5DbDIvQnlxZEZTZEsvcjVj?=
 =?utf-8?B?anArTXdRZUdURnoremlLRGxwTTlhd1UyNkJQRnhBYVVNUVorbk1Oai9EUmJW?=
 =?utf-8?B?Z0F5SU1KWmQwZmZjL256YUhjL1k2MUZndER4dW9obytaV2RyZjVTWmZSbVRF?=
 =?utf-8?B?bUtMenFYSEdiNFhUVmsxLzR4NGhqc1hXcnB1cEZqQUFTYVZwMmJidHBNU0Jp?=
 =?utf-8?B?eFJjaGxqVFYwYjZUM0lSQS9obDJHR1hvdEMwM0xRMEl5N0d3N2wrTVJadlp3?=
 =?utf-8?B?UTVROTZFUzIrdmZJRVgvZE9FQVR1bHgyanJDTjd1SGM5KzhLNzNhU0F6RU1h?=
 =?utf-8?B?c1V6ZmRCaUtWNi9qVnJJNEdlSnltVkNBNTlpSnc3MWZJRy9LMjVGU1hzb2lG?=
 =?utf-8?Q?VR1skjEZ8soq1u5eJYYOrefJlTMuiJs8QNwc0mr8cqp2?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cc124f2-a999-42b0-cf16-08de3c61ddad
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 05:13:36.3005 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6tsznlV7CfEoLES/xsuvMZ/RJtH2JRl+Fnojc5KkDp7uo4MA2ijJdetw4LKW9jBUGw9zwnkce3NNBumXIbYq0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8816
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

When unbinding a PCI driver, the `T::unbind` callback is invoked by the
driver framework, passing the driver data as a `Pin<&T>`.

This artificially restricts what the driver can do, as it cannot mutate
any state on the data. This becomes a problem in e.g. Nova, which needs
to invoke mutable methods when unbinding.

`remove_callback` retrieves the driver data by value, and drops it right
after the call to `T::unbind`, meaning it is the only reference to the
driver data by the time `T::unbind` is called.

There is thus no reason for not granting full ownership of the data to
`T::unbind`, so do it. This allows the driver mutate the state of its
data while unbinding, and also makes the API more symmetric as the
framework grants back to the driver the data it created in the first
place.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/driver.rs | 2 +-
 rust/kernel/pci.rs              | 4 ++--
 samples/rust/rust_driver_pci.rs | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index b8b0cc0f2d93..b0e3e41ae9d8 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -98,7 +98,7 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> impl PinInit<Self, E
         })
     }
 
-    fn unbind(pdev: &pci::Device<Core>, this: Pin<&Self>) {
+    fn unbind(pdev: &pci::Device<Core>, this: Pin<KBox<Self>>) {
         this.gpu.unbind(pdev.as_ref());
     }
 }
diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index 82e128431f08..39e70adde484 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -116,7 +116,7 @@ extern "C" fn remove_callback(pdev: *mut bindings::pci_dev) {
         // and stored a `Pin<KBox<T>>`.
         let data = unsafe { pdev.as_ref().drvdata_obtain::<T>() };
 
-        T::unbind(pdev, data.as_ref());
+        T::unbind(pdev, data);
     }
 }
 
@@ -303,7 +303,7 @@ pub trait Driver: Send {
     /// operations to gracefully tear down the device.
     ///
     /// Otherwise, release operations for driver resources should be performed in `Self::drop`.
-    fn unbind(dev: &Device<device::Core>, this: Pin<&Self>) {
+    fn unbind(dev: &Device<device::Core>, this: Pin<KBox<Self>>) {
         let _ = (dev, this);
     }
 }
diff --git a/samples/rust/rust_driver_pci.rs b/samples/rust/rust_driver_pci.rs
index 5823787bea8e..ee8fc8d48ff3 100644
--- a/samples/rust/rust_driver_pci.rs
+++ b/samples/rust/rust_driver_pci.rs
@@ -95,7 +95,7 @@ fn probe(pdev: &pci::Device<Core>, info: &Self::IdInfo) -> impl PinInit<Self, Er
         })
     }
 
-    fn unbind(pdev: &pci::Device<Core>, this: Pin<&Self>) {
+    fn unbind(pdev: &pci::Device<Core>, this: Pin<KBox<Self>>) {
         if let Ok(bar) = this.bar.access(pdev.as_ref()) {
             // Reset pci-testdev by writing a new test index.
             bar.write8(this.index.0, Regs::TEST);

-- 
2.52.0


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1733B52F20
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 13:04:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 617BA10EA7B;
	Thu, 11 Sep 2025 11:04:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="RbHjVCxa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2080.outbound.protection.outlook.com [40.107.102.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40E7710EA76;
 Thu, 11 Sep 2025 11:04:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u7iGYyxB7lvKxnZX/F+J0YINebzJlT0wEy0o1UNtzbvVQ1o4FDpTrNVqx2sbVnnTQHOEaCqjYAY0oT5mGZashLN2v7nNtzXyfLDo3bKV9YeuBq3CRAx+QL1UdaTGU57QoyWESMgmeMQzlXQZS8O+uKalj+lrRrOK2lEGcydp0ylMODVpMPanW/OSfdN8GSYvU4ajJG1CIsgTlmb40MZ6l4v7D9awKknz0iI0cNSryF+IaYmNThehA2LkNw9J8zbYI0seW/PSQOQ0BlZGmgcODEeBzu176uU3gSQD65/uq8D/cz2S4mg8f2K9BbuC99mT5iS29OgDuAobkAjx+YVQEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hPJX0ThLq/O2+zRNXqfxr8cPJm7mtqwkW7i+cb6KdzM=;
 b=x3ZPtjKX1XhcvzLV6lk+Qxebzol8pt6pq6Ytt96q4vvsQrD0mteQLcEkEspmmJwNpWk6ZmANYaRiEca6uTVvL1iOie87RwqNFw02bGnZdk6mmYV+aLqTsm6jbStGpsfiwi3kB+jM++DfunDJMTBAfDggZmXXNoNykbW+rErdhoLaCYyziWK62L+xlbkPl6PyBXqUKjfwQPMa7mxwgbpmIpDdpZvatzkUJ+bq2/rtODHYjpVXvGIN02s/P2GkEMV50C4tO7MyH9yue8P9uso37d5l1NmK+I/F02oJvuDEEsT0eoPwSqn+e7+Xv20DLrMS/OoKPXYeIbaqGwA+FUkqtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hPJX0ThLq/O2+zRNXqfxr8cPJm7mtqwkW7i+cb6KdzM=;
 b=RbHjVCxaobixyv39+6CE1ePywGeEvQrZJsebXwTlYz/02MXy9nikscvJFn1NLaSndEs73z/PK2lDhu1AnwnamWn9pJbibtxE+tW34urtc/4qHgnUxMttxKaOXivvv7pNIF5LfQebFda+s4LUtwiTRhJJx1zDnyMhu+x6kr2ijwHJS7l9hUwDXR635+yRPIDiwzuSMrljBunLCi9Xhs52VG7CiQ6ajePxkWvfoh5onjuQEWnZ81DUTFOSR5n3O3S+OP71OPMGBePAVCkLqsFfCnhTrg49Oteu4ULt+V73YZtmV1liY14OYTdHCyHm4jquC9SWX5SDQl9fpvhVvZ/CrA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH8PR12MB9840.namprd12.prod.outlook.com (2603:10b6:610:271::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 11:04:35 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 11:04:35 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 11 Sep 2025 20:04:26 +0900
Subject: [PATCH v5 01/12] gpu: nova-core: require `Send` on `FalconEngine`
 and `FalconHal`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-nova_firmware-v5-1-5a8a33bddca1@nvidia.com>
References: <20250911-nova_firmware-v5-0-5a8a33bddca1@nvidia.com>
In-Reply-To: <20250911-nova_firmware-v5-0-5a8a33bddca1@nvidia.com>
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
X-ClientProxiedBy: TYWP286CA0023.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH8PR12MB9840:EE_
X-MS-Office365-Filtering-Correlation-Id: d099bc1b-5cc6-42de-0511-08ddf122fe72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y3JWTlpiejk1ckJycENwSHlYYjUvdXM2MFBQSjFNU3ZGWGZLSkFyLzNyTWRY?=
 =?utf-8?B?elFMQmUvbXhHVUJwR1ppSyt4RlhwM3EralBSeWlwVjZtQldlTFdaN2pqMU50?=
 =?utf-8?B?ZHdCYlRaRGZXZm1DRDBVVXlhVVdnVVpZR3ZQTVJQUloyT3lFcDFCVGJhY1hn?=
 =?utf-8?B?TUp0R1h0d3hiK3RaaHcrMkhvWDB0TzJObEM4cXJsb0l1MnVwSUg1MDlxMEYr?=
 =?utf-8?B?dVNudENmMENIY3U0ZkNIdzFhQmVOM1lFNW5TZzRMT2lxUUY3dGdlRENJRWMw?=
 =?utf-8?B?b3FXNVJqOUlTRFk3Tm9XS1hKY1diT29Jd3VUelhlK2lrejZBVlFMeFNvUGVP?=
 =?utf-8?B?ZnhkWW5uM3d4b0UxQmtkV1dUREdHN0sxSnp4V01mU1RucW1KV0hpVGFrZlZB?=
 =?utf-8?B?VGFTSHljcW01bUVvVkFQSjYzK3pHM2ZDdDBpMzVMMkRJNFRVOHFwMEt1bG84?=
 =?utf-8?B?dFdjTGswaHg1ZjBLdzNLMDJSaE5QNndQVElybUYvbFZVWkJ4ODJpdHJjRVpw?=
 =?utf-8?B?c3JXRnB3cUxRZVJzdjhTeTBVc2RnN0FLNHAzSUFnbkJzcFFFWmUwYnZYTU1u?=
 =?utf-8?B?MWsxL2hOODlaMEZ0NkpxVm9jeWJ1dmZqR216aWNCeDVvREhoYmh3LzdZbmtt?=
 =?utf-8?B?b0Q4ZEI1VXhRS21LZUcydVJTUEFnWnBUT3pHbmRqM0ZITlhaQXlOM21rUGdr?=
 =?utf-8?B?QjRCYVBlWUV2NER2bnZqTSt2UWNRM0pxblE0SWRLZCtQWXF0YXZidkk5QTRF?=
 =?utf-8?B?MlI0R3BMMHJTMEoyclVWZSt0dDBreVloRDdSVHZFWWdsV3hmQnRFL3VudHJj?=
 =?utf-8?B?N3dIcU9tbzdiM05EbFhud0UwVXRZeHhwanNCbGNHTTk3OTJ3ZnJHUkxIdmlR?=
 =?utf-8?B?S3N3eXUrRWV2cUZGN2ZxRi9wUEU5Yk5yeU1sREVicDF2RzI0SjBDS0pqK3dw?=
 =?utf-8?B?SGdhdFBKby8xb3dvaW5iblduZVFIRDB2ZHlITUpRV2ljb29MTlZaOWVmQUxJ?=
 =?utf-8?B?N2ljQ1ZvbWI3L0RUM3FXMEpBKzhFNVRqU2QvWTBEQWhvZnJ5dlhQZEgxQ2hr?=
 =?utf-8?B?d0lFVDJvbXVRWDlES3dWUzZLWldHUU9vM1hHejJjREZVTW1OS0pZUTFQZ2c1?=
 =?utf-8?B?YmhGS3BYVU1mS01TRzMwR09zS05mSkR0eSs3OEFSNVdzdEFjZ1hZdlZrSGdo?=
 =?utf-8?B?VkxkS1ltbjdxOWJqSnh0b3RSdUpFanNjWFdGQmRBTi9XaUVPSVFuT3RXMFZw?=
 =?utf-8?B?bWNudThSemgvVGF1a0k4NEs1aHBOTkxkNUo5dWZvZEpjTFpTakVYSld1VW9F?=
 =?utf-8?B?K200bk44blJyWU5uRVlJbHB4SlJuckhINTFxUGt3QS9VMDVtNTFOUnZtS1VD?=
 =?utf-8?B?SGxERW5PVXJ2ZSs1YkdjZXUwaElyV0t0dTM3WkdEOFFLMHErSUNIdjUxcnh4?=
 =?utf-8?B?ZGwwT0lIRElna3RBT2FkRWxEb04yQXpMTFZvY3Z3WkVqMW45Z1IvRDBtUElz?=
 =?utf-8?B?WGcyVVcyL3JtTlR6TkdjYkVpMmxNWm5DanJhWmNwMUZhdlZWYitVV1A3c204?=
 =?utf-8?B?S2V3SU8zWktoTGViOTdZOGJuaEhIU1N6S1lhY21CVnV0Qm9DUytaZ09Sc3BR?=
 =?utf-8?B?VmVqeWwzdDZNb2xYeGRnUm82bDZXdllmMDQwWFUvbmFHSjBJTzZBU3ZQZVJM?=
 =?utf-8?B?ZVpzS2k2dTlnZFZRUUhuRWlNNi96R2E5cXBMZk5aUlplVi9NUm9MSGVpYW41?=
 =?utf-8?B?WTFyOWMxcWYzejdSekNHMnREYkRBV2FMeVBOZmd0b2lNSWZwQzRsSStvVDk5?=
 =?utf-8?B?UmYxZ0hNbzNkMGhSQlBjeGFqQXg0OEJtNDE1aEpORFpCTzVybVZHaXR1cjlX?=
 =?utf-8?B?M1JQcTZGVUhJUVVPc2xieGFoU2RSOEUrTjNxeE5jQU5WRkwzaXBWOGtHMDIv?=
 =?utf-8?B?RWlnUHpIN253UXppTXp6Z0Q5V0c2WGdKeEVPYjBLS2F3cXhqR0pPODVGZW1s?=
 =?utf-8?B?OS9mSFJLUDdBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NkFOU3dFREJUcitZVU9VZ3lWNUlJR0Fzc1ZlanNqamxENzVBME5yZVk2M0RN?=
 =?utf-8?B?bEJVM2pmVS9CQ1M4cUkySjV5RUpad3FzTS9reXVJYTFSUVg2V0lNZWw4amNO?=
 =?utf-8?B?bXVzTGhGNUxsWjloTTZvUVBKTlY1TVRHcEw4UWNPMEV2OHdUSFNSd2lnMzFM?=
 =?utf-8?B?UFY1dkpHY1p3U2JReTlLUVhRaWxZUnBxOWR0b2U2dVg1OEh4S0R1b3VnWStp?=
 =?utf-8?B?VmNVUm85ZTlKUzVLN0cxOTJabCtnUytUY1I2bHJEWU5HdWJxMXQ2VUNhcUtB?=
 =?utf-8?B?anBNd1cyV0Qvei9ZSWFzVXcyYm1nL3Mvc3RHbjRyNWFjb0QrQ3NnMFZHbnJW?=
 =?utf-8?B?MmpFVVUvanlUVkdBeUl6WE9ScnNUQXV3TGlzY1IzNEt2ckRzdmhqZWpWbHVu?=
 =?utf-8?B?R0ZPVEg4RnFyWEZ1U243T1ZGdUFHYkdRYm5iM25RZ0krN0J4MTlzeDR6RXhP?=
 =?utf-8?B?NmJadTd2UTcwR1hSTWFxTkt1QnZqSlhUTUJkMk41dHJKNENiVlU4M2ZKamlD?=
 =?utf-8?B?TC8xWEpTU21PUHdUU2tadXJoRkpTZzZKMkt3VjJneE9SQmExdTB1anFZdU5J?=
 =?utf-8?B?cnAxcllmODEvVXRqTEVqZmdQaGhLelM4Rml3UUNDYy9TL3JucVR2L3ZtdzJv?=
 =?utf-8?B?TTdYaUpOSVB2Y292VXJLUUNIZ3hqakIzaUtpQU9zd0pQR3cxQi9zUFR0YWJZ?=
 =?utf-8?B?RDBhaHphK1lPMEtEeGhYYkZCbWU5V1ZjRlMxZUpxVGZpamE4MTJSV1h4UjVO?=
 =?utf-8?B?SzFuUnF4UGFlRW5mUGl0NGRrcVo5Z1UrNnd5OWpqTlZUdk9UWUxIdXJmNERp?=
 =?utf-8?B?RmxxMjU0Nml2M2dSVndONzl3bGw1VkRuTkpMT3VRbjB5NDFWRGZaS1JDbXNI?=
 =?utf-8?B?emxqSDN1dnBRNWdwaHJUVmI5R2JFeExBTjk4eFowcm1KMEFacHJmM2p4YUZq?=
 =?utf-8?B?RVhlZ1BvZ0Q0a0JPbCs3elpMcmJmMEdrSDN0L0gxdHArSkdWNnNDVTZhYlkz?=
 =?utf-8?B?TnlnT3hWYU5wTHZTQ092TjBUc1ZndE1sbTk1YTZ0b214ZDdXcVZheEV4Z0tV?=
 =?utf-8?B?blVNRmNNZUdwcEtBOHpoenRGWkl4REVVem5RSUxpN21vZkFqd1lneXZoWDNt?=
 =?utf-8?B?aWRVaHlmU2JxWmplN1A5c05aamZYRFQyNUxTQ0lHRU9mS3NEZVZrVDlWWEI5?=
 =?utf-8?B?WjhSVXNiMGpFdjBYMmg0eGRhNVVvelRGZTJTeHF5U3VyTUk2NzEva1VKUDVj?=
 =?utf-8?B?SWp1NjFoRVpRdzFEQlpRV1pSUndOU0Q0NnAyZG1sSHlWd3lzb24reTl0OUp5?=
 =?utf-8?B?eFNYYmMyKzNEeUFxVTlDM2p1M2tOejhPUmg4R1FnNEwxdlYvQktqL3JPQWZq?=
 =?utf-8?B?OC9vcTF6TmQwMGhCUml1SHdzdWU3cmxHeFVsUlJaeXN2ZGpDd1R5NVZHODBu?=
 =?utf-8?B?czVxbHcwb0YrNUsycUMxOWFMeDA3bVVRcDBSMVRIYVlKT0t1RmEvZ00vR245?=
 =?utf-8?B?aEJ3ZVgxS0ZWSkVHQTJVTzRBMkxPdkRnTFBFQnNyOENKS3gzYm9UV1ZyTWFy?=
 =?utf-8?B?ZVhBc1NadUJpRTNObGY2THZPNGZLem9WeFZlcG5nc09ueHRzQW1ENlpaMDly?=
 =?utf-8?B?ckw4TlNlM09TSUJ2ak44MlkrV0tJeDQ0MnNTbFErVnM2RVFqdmRIR1BqcXN3?=
 =?utf-8?B?Ykw0K0hqMWhocFd0SlhzUTRnL0M5VkRjMVF5SHNZZ3ErV1ZUdkMzNlZnMEk0?=
 =?utf-8?B?RzZuSFd6bDlUR2gzb0lOajNGQlhCdnk2VFpUSzF6TDNVMzhkcExIQWkrT0VL?=
 =?utf-8?B?TFp3Q1B0aUNMc1RDQVB4bDZ5dVFUeDlvSktrZVdQWHJId2hiakJMQTgyRmNz?=
 =?utf-8?B?OGQ3QlRyU1JobkZzNC9xRWc1c1RTRUlMUUN3VnJTOVhRdHkyRzFKRzZ4c1Rs?=
 =?utf-8?B?MDRtNmUwUDJpRmxBWml6WmQ0dUN0ZUROT0kyUW8rUjUrSmxSQi84TjByT2Js?=
 =?utf-8?B?dU4yS0JHdmVjM3lNbFlvZTNyYTVCK1R3S0ZpNE5NN0RqT0hFazdlVlhEdE5x?=
 =?utf-8?B?MzlhNW9IaXczMFFjS0R4ZVZ1aTE3Y0JMUTFMTUt1Z01HUHk3QVdYcit2T01n?=
 =?utf-8?B?UWdWREROQTd0S2cyU1pHVXB3ZGxiMGxlUWVGRjZJV3hqVnkyZ2xpY2xCQ25B?=
 =?utf-8?Q?PV8WtneD1zlMnAOJDQk/llvZE3+MRfFtm3wdg5ZX/0fY?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d099bc1b-5cc6-42de-0511-08ddf122fe72
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 11:04:35.7703 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eFN7QbmkYLMJbOwhbnQEizujRoLyPjYZJnzalCFaKVM2p9oZMAnBXQNqto8E56uXO3J8BB3dkh3ChIYKGfqQ+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9840
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

We want to store the GSP and SEC2 falcon instances inside the `Gpu`
structure, but doing so require these types to implement `Send` for
`pci::Driver` to remain implementable on `NovaCore`, which embeds `Gpu`.

All implementors of `FalconEngine` and `FalconHal` satisfy the
requirements of `Send`, and these traits also already required `Sync`,
so this a minor tweak.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs     | 2 +-
 drivers/gpu/nova-core/falcon/hal.rs | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 2dbcdf26697beb7e52083675fc9ea62a6167fef8..b16207e7242fe1ac26b8552575b8b4e52f34cf6a 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -286,7 +286,7 @@ fn from(value: bool) -> Self {
 /// Each engine provides one base for `PFALCON` and `PFALCON2` registers. The `ID` constant is used
 /// to identify a given Falcon instance with register I/O methods.
 pub(crate) trait FalconEngine:
-    Sync + RegisterBase<PFalconBase> + RegisterBase<PFalcon2Base> + Sized
+    Send + Sync + RegisterBase<PFalconBase> + RegisterBase<PFalcon2Base> + Sized
 {
     /// Singleton of the engine, used to identify it with register I/O methods.
     const ID: Self;
diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/falcon/hal.rs
index b233bc365882f9add9b6eab33b8d462d7913df37..bba28845561795914e9a4dba277d72bbac0b37dd 100644
--- a/drivers/gpu/nova-core/falcon/hal.rs
+++ b/drivers/gpu/nova-core/falcon/hal.rs
@@ -13,7 +13,7 @@
 /// Implements chipset-specific low-level operations. The trait is generic against [`FalconEngine`]
 /// so its `BASE` parameter can be used in order to avoid runtime bound checks when accessing
 /// registers.
-pub(crate) trait FalconHal<E: FalconEngine>: Sync {
+pub(crate) trait FalconHal<E: FalconEngine>: Send + Sync {
     /// Activates the Falcon core if the engine is a risvc/falcon dual engine.
     fn select_core(&self, _falcon: &Falcon<E>, _bar: &Bar0) -> Result {
         Ok(())

-- 
2.51.0


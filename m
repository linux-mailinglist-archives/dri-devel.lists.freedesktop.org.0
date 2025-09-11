Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E09C4B52F2D
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 13:05:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 361E810EA83;
	Thu, 11 Sep 2025 11:05:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Aqucu+Xd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2050.outbound.protection.outlook.com [40.107.96.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EE0E10EA83;
 Thu, 11 Sep 2025 11:05:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=crSmUCxbrDTwdki2tJ7w8xqRtbVmRUbWTNLPZ6rfCcLy77zUYaeT3lkYA3jv19oT5Pli+HlnJ4XSMQC+E62v6NIqvfiCMti0RTAGgFs4t13K8dcvk3EOGlGtWnb7uUWHWiSxr8WK8B+8uwNXzWKsfoh3VKEprG3FROHgzABf/R3bO1olTBHCel3o7Umf3wmVdgEUZKYSNfUL3rD0BFvFJDb1IRXg0QKHgN1i8upLK5nV7SSy5Szn0zsipkTS9jR6mcAIXjwJPDSd7h2Gj2p9cJ3xNKuaCHJmBIfQRU7iV4uDf1kLO+7Fl95EK6o5gxRHRowubav0TeIUu6L0Q5roHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ToTiL7gNMQBG45R4QR1FNXeYjvL3wX2O0fsYBP5eXCg=;
 b=xcjJLiL5nNJ9utNyhLKuppy61Mu854CVZMK583mnM1pXJ92AnDKR9jdXiuzMmmqCF0ee7yRFt0JtFztWf/BLAQbxDpd1vxygmC9PQS1Oc9J40dBho+Yla4H/IZMXc38Vg43picsZO3bz29K3Amm/UzKPj4O/BUJLA3jXwERWloIJ3ys8a+uXEE99np3bGIZE3RIJrIU722TG3O8os6bhBQ/yX3tjW9+Hmi3hw7yxHQKhlx4FORHrGOPEQkcnxVBOpmPM3clq8ujgKFdIJNZ2wJpoY97PencwGp80R4OpiPqF8e7Rrsb96IjY0b0J1V+xoOrWBHDfCHoQg7ap5krXQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ToTiL7gNMQBG45R4QR1FNXeYjvL3wX2O0fsYBP5eXCg=;
 b=Aqucu+XdY4rJXLkq8Hfr//bgw+Ry6YKOLPRjqfzmyRk5R4jQtg0Y8qFPJAb8RmffKLD3QHFhR2tR4W0oqpRatDmqcsFV8Yuxbhvr44BhI5QdsTWbXKhip93gJ/mvy2Uzqfh8Z3XSSq7vs04cY+m1FWmgVx4O2il0D3SQoajOUxYfi4u/iuZ0Y+QQ89Oj/GgFeKUq7CDmB49te5jRvanQo1aAkz+uWJZVygU4j5Cvnh+kLLH9xwVQvOv51WhOlInYMn+4eID+qG7BwgQYhXdYzVmJHR0Cuk2gUZJbrG+Tm/wqt0ShUmChZhrqiy20iUAWQY4YkOPPgEH+iCuxqpxZUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH8PR12MB9840.namprd12.prod.outlook.com (2603:10b6:610:271::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 11:04:57 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 11:04:57 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 11 Sep 2025 20:04:32 +0900
Subject: [PATCH v5 07/12] gpu: nova-core: firmware: process Booter and
 patch its signature
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-nova_firmware-v5-7-5a8a33bddca1@nvidia.com>
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
X-ClientProxiedBy: TYCP286CA0064.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH8PR12MB9840:EE_
X-MS-Office365-Filtering-Correlation-Id: 2960508d-c302-4912-8212-08ddf1230b0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a0k4N2xOVzJBbEx0dnBQVWZESDFnU2Z1bDEvREFBaDZsa29BU2JpNTAzdVVG?=
 =?utf-8?B?NVMyMU9rck1KNjRVN3c3dVBhdzYvbmdFaXlTek52M29FajNkQkoxalIrMEVR?=
 =?utf-8?B?QkVLVWhPSjZFL0NBNmRmSy83cTE3UUNXWWFuTGN4M3VqL1NwZGRFU05uaFZE?=
 =?utf-8?B?SmJhOGQzWVQ4NlI3NXdXN0l1Z0VUdUZuS1NValZ6cDVOaXFNWlB4RkQ4cEky?=
 =?utf-8?B?dzQ5SkN6MkVkS2FKQlY1bWpWZU8yNXpaVmpndFE2ajBjQzNadEZ2TFZaZmd6?=
 =?utf-8?B?eEEwSW0rQUxsZDY0NWxQdEpsM29OSk10SVBocEJic2NDeTNSeEFGMWdDWllu?=
 =?utf-8?B?MmVRR1NlOXNadnJ5L0hEVVZQZnpONnBSV0k1ZEhnT0YxSk93M0c0U0dMV0x0?=
 =?utf-8?B?THhTZkZybk5BblVaWlpCQ3VDbWxwQWVLbnRpZCtkYUsveUFCcnBxVGZMUUlN?=
 =?utf-8?B?ZXcyWkg5MHFJZHNGZFg0L1ZTLzBxekRSUmNwKy9ZUFlRblpNbXZxVUNwSjJp?=
 =?utf-8?B?cktrSjlIcnBvc2x5VkczVDh3S3BCYm8xcnpnWnZwZmVGOUFhQVUxUEw5VUtY?=
 =?utf-8?B?TEROcG5hTjA0YXgzdXVNOGo1NHhodUVSM2RRUjA5TWFXMlhiTzFyVWljQ2Zk?=
 =?utf-8?B?aGNTMmU1ODRFOFB5SE54ZlBKV0s0Z3FSWEVZV2pDc2NrQVM1c0xaTEZFQ3Nw?=
 =?utf-8?B?MXZIK0hEWXgyV2FnWE15YnBzcVMxRHh2VWVLZEFNSThHaWxwTDV3VzFNejll?=
 =?utf-8?B?VENzRzd2RmVJUXRkSS9OVC9FbUFzQzk0SWFxNDd4QXorWEcyd0kzRFF2UWRO?=
 =?utf-8?B?NFdkUWxjdkJXWGlDNXlacGtKcXB5NW8vVmp1OXVUTWtnbUtVbWdleHZMWU9q?=
 =?utf-8?B?YXZ3MXYyeDJwVmhsQzNHalR4ZlloUFVpY2wxNVM4Z1E3REtzaHVKd3RFekZ5?=
 =?utf-8?B?ci9SM0hhOGZSTEJteWFyQzUrNld4Z2RwY2UvaWZ0a1dmVFIvbWpldC91ek05?=
 =?utf-8?B?aVNQNHZnWGpydGlCbmRFdis2azloL3JCNnFGcTgwWE9QK09jaW9RTEYzamxv?=
 =?utf-8?B?V1JPdC9xbFRyRnhvaWZKY09PV0phVDAvczVZNFhBcHVlNlJnQWpyVnNWeVg4?=
 =?utf-8?B?S0pmdmdzMkVIQ2VUbWFoVXo4RDNEZVJydjhiL1M4L3FYYkRERDBUZ2tZYTdM?=
 =?utf-8?B?cXROV0REKzhKK01XTlpNK2VkdjZybEFFaFlNT3JtSllwRXBLN1BMeVZtRUVs?=
 =?utf-8?B?VWFDeFE4Zmdwa2IzNEFOMnljYUdXQUtrcGhKRlVJR0FGWU13aGVqZTFIVitF?=
 =?utf-8?B?UGVXdnpYcUxwcFFBa214YXNHdUlhem9lNXFoaHZaYnB2MmNOMEE2b05Uaita?=
 =?utf-8?B?YmhneXg0YTdlSGs4RVVUNyttSmNIc25mc2xNTUFmSk5Hb3JOaG9BZDBUYWV0?=
 =?utf-8?B?b2phNFhuWm14eHdNQzN5ZjRCYklacUx4Zk93L0FYa1k1S1ZDWHVtRW8vb0FR?=
 =?utf-8?B?U2o1VFl0RXlJaWR3aXBRNXEwbVJvQXpZOE43K3RCTk81Z0FSdGVYbHdCR3d0?=
 =?utf-8?B?MmlVcXNqVW8wWkpqaU9EazNmdWlEdkRGdVA3cThLaDR1c21COUpSdGZqNXpL?=
 =?utf-8?B?M0xDVTJnMWhkb1BGbEVXdHRCRE5IYmYrSzRiUVRDNHRTOFBNVEtrUXZ4WmNq?=
 =?utf-8?B?YS90VGFXZEhYR2tKcnhPSkRIeTZZQU02SmZCOFBlNUlHbmNaT1NaVmFHNTFM?=
 =?utf-8?B?WnIxcHk1czRBbVJ6dkpDVE5TRThzMGF2U1NIVzBCUkVzYnhYZCtvQTFUWEZW?=
 =?utf-8?B?N2I4b1lSL00yWXNtUVpjR3ZPS2srVm02NWZoSHV0ZnRuVkN3M0tjVlVYYWFH?=
 =?utf-8?B?YWh0MUNkZWpGMmhXYURFTFplaVNFekpGU2oxeGI4a1RPcmFtcFYrYWN3a2Rl?=
 =?utf-8?B?RTRIc0l4elpUY0FoS2l0bmV1cnpCQjF4Qk5FUTN2Qjd1US83VWJrUUpWSGZJ?=
 =?utf-8?B?ekhBS2o5Ti9RPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0V1S1dQcThRb3ZCV2tJdk55RnAyeHBtdzVZRTB6Sm1Hb0c0SDVmM1ZmMWJT?=
 =?utf-8?B?R0txazVvSkF3NkZEUDBkR0tYQ2l4VEdTdW0vM0lLdlB1Sitwc253NTlXeVJL?=
 =?utf-8?B?Ky8zNGRTQzhrb0gyWGdlcWxySEJvb0w0VmNIZEhtNVpKdCtVNHpiaVJKUjVY?=
 =?utf-8?B?c0Q4bDJPNXVyNmNnN1FLTHRQOUFSaGNiYXdBbjZtTnZUaS9rVEtWMmpxTDZ2?=
 =?utf-8?B?SFpxMGFzcFkvUXNSNXg4bjlwaWJEcWk4Z2xLK2gxSm1WQUMyNEVINmF4NzZp?=
 =?utf-8?B?N082T3JWNTI4VjdUZlhwQ0lad2pFeDJocEcydFRwTTVsRncyZ3hlOHVvR1Zw?=
 =?utf-8?B?V3R5K2hTWkpoK3UyOUFZQmZmdWVYU2N5QTE1WXlBMXlpU3RHMHhiUFZGZURV?=
 =?utf-8?B?c1locm1RcWlEMmg5QkpKbXVsTmU4RVo3SDRxaEdVM2toMVZxM0NVeFN3Mmtm?=
 =?utf-8?B?UFN4ZTZrMVEvK2NFeUN6SFVsZy9NTFlCS2JEdENtYWUrWU11SVQ3TW5CZ1FI?=
 =?utf-8?B?OU52V1cyTldPeXlxZ241QTBtSDdaaWZMOFh1Q3NHM2ozSStvWitqaWxuTk9U?=
 =?utf-8?B?dk1yamJZZ2IyK29FUndUMVMzZTJ6K1lBUm5HaGN5bGJnQUtYSHU5SW5KQXR3?=
 =?utf-8?B?VDdFekszTmF0SXBPeGxQaGtNWmVQSG9NSzczN0U3SW1GQkEwVXIxWmVhWkxW?=
 =?utf-8?B?ZkdRbkkyVS9VUDB5cDBTYTVhR3lwa3hYaHg4U0xRbXVmUDZ6dVZaR0s1U2dm?=
 =?utf-8?B?UUEvMUtlZFpaUlZZQ00yRUoraENNVThvWm9XU0VUQWZpM0pRa2Z3am4wbzgw?=
 =?utf-8?B?Qk9QM1hwcHcyMTBGVlNDamJmS0Fmb2R4UmhxSEx3U1JLeldVa0lYbktuZFk1?=
 =?utf-8?B?RXQ4ckJLSWxiL0RtSEJPdkVhL1JOMFB4Z2UzVUxvSy9zcDcxNFlPRHZYMkxx?=
 =?utf-8?B?UEc5RkRsVzQrMnBEd2JVeGNrZVQvNW9tbHlIV1lOUytmeWw5MUdyVEVIdnJi?=
 =?utf-8?B?V3c1M3pKOVo0STluRnFnSDJRbEFaYzNua1BTSmJtUGV0ZFBjOHdyM01kTFVF?=
 =?utf-8?B?Nzd0ZUxWVk13eU9kMnNidlRnM09YM21zRGRZejJLUnpNcy91blRESS9Eb0Mx?=
 =?utf-8?B?L05nUmE2Rk5hQ1VsNERVbmxJL1ZZRmpzTXRLdzdFYllrM2JCMVB3Y0ErTHZn?=
 =?utf-8?B?RWp4QkZ5R1pHRGpVZHY3OWRsYjk3QzJFM0ZadEgxZVpqNHRlbEZQdlE4Z25Q?=
 =?utf-8?B?bnBIS0tqcjhGQVhUd09Bc0FrYXE3djZBV21SK3BKSDlGckNwWDlEb1hkOXlR?=
 =?utf-8?B?TmRVekR5ZVdVV1dRdk1mSm0rT0VHWjhzNEJ3YkRKYXNManhhRjZTanJ4MUNw?=
 =?utf-8?B?dHQrckprRjJ1U1NieWdkc1V1Z1pqbkpsRklYdFAxbVFMZVlqVytuVTNCaDlT?=
 =?utf-8?B?T0pkSVJ0dTVZTnVuK3pMY1A4TVB6dy9xOG9DNEFBd2Jidk9CK1B6c1BQay9p?=
 =?utf-8?B?S0xsK01zdE1yY3V3T3dmamFXak5SQkZWblp6T3lqYXg1bWtHZlpwVmxaVDU0?=
 =?utf-8?B?elBPTHFNcVRNaS9idkNibnNUc2hRUkRZTlA2RnhuNE11SVB1ZXdkVU1lbERp?=
 =?utf-8?B?elJoS2dOUzJjdlJQSHYyaXk0TG1ra3UzdS9YbmNUYUhnbDdwaUF1dWVHZW1s?=
 =?utf-8?B?Rm9PUXpKVjFJcldrT1VnNXo4d2ZsVVZ1d2taTVVsa1hLaXY5TStHVjFVcGNh?=
 =?utf-8?B?R3NzcTdHcVFpc2c0ZnlGNVUrUEJ1MmJSK3VuWktLRWhjMk1oTUZBL3pSdDNm?=
 =?utf-8?B?UThvbmtETzZRdnByNVVHMWlvdkhYZXorUzFhNjNzK09XaC9DSjhBamw4dWNH?=
 =?utf-8?B?Wlhod2hnb2J6T3JBd0pZYmhNT1hwWUhYOUlJVmM0djJTcFpHM01vemxhU3NL?=
 =?utf-8?B?SDhhYzBUM21zN1dWQmJ6Q1JVUS94VGsvYWVQN25FUkVHKzFsaE8rU01SeWEz?=
 =?utf-8?B?NmVOakowV2pyUnhnU0puRDhmMU5NNCtzVGVsOURRaWZtK3pqUXlLMjVCbEdi?=
 =?utf-8?B?bjNnSS92emVrVG1FNEx4MFJTTDYyTDVOZVpBRVMxemx4dUJUc1kxMkxKS3ZS?=
 =?utf-8?B?YnVQdVdzS000NitxcEtwSHJQTDI2U3JNTHJDdEVPeFNDWDFjbFgvVHBSeFp1?=
 =?utf-8?Q?2LWD9RjXq1FP98MejY4WImqpKD5yFbeRMes9zpddjK4c?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2960508d-c302-4912-8212-08ddf1230b0c
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 11:04:56.9321 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gn/HGWgqNdBv/twefIFP38WPhnLn+ju8eXuC/iQq4LWFi8RoqjtH1AtG6/S/Hfo3plPKS3JVnIULIx1ZJAA1JQ==
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

The Booter signed firmware is an essential part of bringing up the GSP
on Turing and Ampere. It is loaded on the sec2 falcon core and is
responsible for loading and running the RISC-V GSP bootloader into the
GSP core.

Add support for parsing the Booter firmware loaded from userspace, patch
its signatures, and store it into a form that is ready to be loaded and
executed on the sec2 falcon.

Then, move the Booter instance from the `Firmware` struct to the
`start_gsp` method since it doesn't need to be kept after the GSP is
booted.

We do not run Booter yet, as its own payload (the GSP bootloader and
firmware image) still need to be prepared.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs          |   4 +-
 drivers/gpu/nova-core/firmware.rs        |   6 +-
 drivers/gpu/nova-core/firmware/booter.rs | 375 +++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/gpu.rs             |  12 +-
 4 files changed, 389 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index b16207e7242fe1ac26b8552575b8b4e52f34cf6a..37e6298195e49a9a29e81226abe16cd410c9adbc 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -293,7 +293,7 @@ pub(crate) trait FalconEngine:
 }
 
 /// Represents a portion of the firmware to be loaded into a particular memory (e.g. IMEM or DMEM).
-#[derive(Debug)]
+#[derive(Debug, Clone)]
 pub(crate) struct FalconLoadTarget {
     /// Offset from the start of the source object to copy from.
     pub(crate) src_start: u32,
@@ -304,7 +304,7 @@ pub(crate) struct FalconLoadTarget {
 }
 
 /// Parameters for the falcon boot ROM.
-#[derive(Debug)]
+#[derive(Debug, Clone)]
 pub(crate) struct FalconBromParams {
     /// Offset in `DMEM`` of the firmware's signature.
     pub(crate) pkc_data_offset: u32,
diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 32b685c8757b1106084577c2cc7d5ef6056c1c64..d954b1e98fda82c44f87d2103e31fa717c392d79 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -17,6 +17,7 @@
 use crate::gpu;
 use crate::gpu::Chipset;
 
+pub(crate) mod booter;
 pub(crate) mod fwsec;
 
 pub(crate) const FIRMWARE_VERSION: &str = "535.113.01";
@@ -37,8 +38,6 @@ fn request_nv_firmware(
 /// Structure encapsulating the firmware blobs required for the GPU to operate.
 #[expect(dead_code)]
 pub(crate) struct Firmware {
-    booter_load: firmware::Firmware,
-    booter_unload: firmware::Firmware,
     bootloader: firmware::Firmware,
     gsp: firmware::Firmware,
 }
@@ -48,8 +47,6 @@ pub(crate) fn new(dev: &device::Device, chipset: Chipset, ver: &str) -> Result<F
         let request = |name| request_nv_firmware(dev, chipset, name, ver);
 
         Ok(Firmware {
-            booter_load: request("booter_load")?,
-            booter_unload: request("booter_unload")?,
             bootloader: request("bootloader")?,
             gsp: request("gsp")?,
         })
@@ -185,7 +182,6 @@ struct BinFirmware<'a> {
     fw: &'a [u8],
 }
 
-#[expect(dead_code)]
 impl<'a> BinFirmware<'a> {
     /// Interpret `fw` as a firmware image starting with a [`BinHdr`], and returns the
     /// corresponding [`BinFirmware`] that can be used to extract its payload.
diff --git a/drivers/gpu/nova-core/firmware/booter.rs b/drivers/gpu/nova-core/firmware/booter.rs
new file mode 100644
index 0000000000000000000000000000000000000000..a4cd9c84bea75b68565778841e78a20cdec9333e
--- /dev/null
+++ b/drivers/gpu/nova-core/firmware/booter.rs
@@ -0,0 +1,375 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Support for loading and patching the `Booter` firmware. `Booter` is a Heavy Secured firmware
+//! running on [`Sec2`], that is used on Turing/Ampere to load the GSP firmware into the GSP falcon
+//! (and optionally unload it through a separate firmware image).
+
+use core::marker::PhantomData;
+use core::mem::size_of;
+use core::ops::Deref;
+
+use kernel::device;
+use kernel::prelude::*;
+use kernel::transmute::FromBytes;
+
+use crate::dma::DmaObject;
+use crate::driver::Bar0;
+use crate::falcon::sec2::Sec2;
+use crate::falcon::{Falcon, FalconBromParams, FalconFirmware, FalconLoadParams, FalconLoadTarget};
+use crate::firmware::{BinFirmware, FirmwareDmaObject, FirmwareSignature, Signed, Unsigned};
+use crate::gpu::Chipset;
+
+/// Local convenience function to return a copy of `S` by reinterpreting the bytes starting at
+/// `offset` in `slice`.
+fn frombytes_at<S: FromBytes + Sized>(slice: &[u8], offset: usize) -> Result<S> {
+    slice
+        .get(offset..offset + size_of::<S>())
+        .and_then(S::from_bytes_copy)
+        .ok_or(EINVAL)
+}
+
+/// Heavy-Secured firmware header.
+///
+/// Such firmwares have an application-specific payload that needs to be patched with a given
+/// signature.
+#[repr(C)]
+#[derive(Debug, Clone)]
+struct HsHeaderV2 {
+    /// Offset to the start of the signatures.
+    sig_prod_offset: u32,
+    /// Size in bytes of the signatures.
+    sig_prod_size: u32,
+    /// Offset to a `u32` containing the location at which to patch the signature in the microcode
+    /// image.
+    patch_loc_offset: u32,
+    /// Offset to a `u32` containing the index of the signature to patch.
+    patch_sig_offset: u32,
+    /// Start offset to the signature metadata.
+    meta_data_offset: u32,
+    /// Size in bytes of the signature metadata.
+    meta_data_size: u32,
+    /// Offset to a `u32` containing the number of signatures in the signatures section.
+    num_sig_offset: u32,
+    /// Offset of the application-specific header.
+    header_offset: u32,
+    /// Size in bytes of the application-specific header.
+    header_size: u32,
+}
+
+// SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
+unsafe impl FromBytes for HsHeaderV2 {}
+
+/// Heavy-Secured Firmware image container.
+///
+/// This provides convenient access to the fields of [`HsHeaderV2`] that are actually indices to
+/// read from in the firmware data.
+struct HsFirmwareV2<'a> {
+    hdr: HsHeaderV2,
+    fw: &'a [u8],
+}
+
+impl<'a> HsFirmwareV2<'a> {
+    /// Interprets the header of `bin_fw` as a [`HsHeaderV2`] and returns an instance of
+    /// `HsFirmwareV2` for further parsing.
+    ///
+    /// Fails if the header pointed at by `bin_fw` is not within the bounds of the firmware image.
+    fn new(bin_fw: &BinFirmware<'a>) -> Result<Self> {
+        frombytes_at::<HsHeaderV2>(bin_fw.fw, bin_fw.hdr.header_offset as usize)
+            .map(|hdr| Self { hdr, fw: bin_fw.fw })
+    }
+
+    /// Returns the location at which the signatures should be patched in the microcode image.
+    ///
+    /// Fails if the offset of the patch location is outside the bounds of the firmware
+    /// image.
+    fn patch_location(&self) -> Result<u32> {
+        frombytes_at::<u32>(self.fw, self.hdr.patch_loc_offset as usize)
+    }
+
+    /// Returns an iterator to the signatures of the firmware. The iterator can be empty if the
+    /// firmware is unsigned.
+    ///
+    /// Fails if the pointed signatures are outside the bounds of the firmware image.
+    fn signatures_iter(&'a self) -> Result<impl Iterator<Item = BooterSignature<'a>>> {
+        let num_sig = frombytes_at::<u32>(self.fw, self.hdr.num_sig_offset as usize)?;
+        let iter = match self.hdr.sig_prod_size.checked_div(num_sig) {
+            // If there are no signatures, return an iterator that will yield zero elements.
+            None => (&[] as &[u8]).chunks_exact(1),
+            Some(sig_size) => {
+                let patch_sig = frombytes_at::<u32>(self.fw, self.hdr.patch_sig_offset as usize)?;
+                let signatures_start = (self.hdr.sig_prod_offset + patch_sig) as usize;
+
+                self.fw
+                    // Get signatures range.
+                    .get(signatures_start..signatures_start + self.hdr.sig_prod_size as usize)
+                    .ok_or(EINVAL)?
+                    .chunks_exact(sig_size as usize)
+            }
+        };
+
+        // Map the byte slices into signatures.
+        Ok(iter.map(BooterSignature))
+    }
+}
+
+/// Signature parameters, as defined in the firmware.
+#[repr(C)]
+struct HsSignatureParams {
+    /// Fuse version to use.
+    fuse_ver: u32,
+    /// Mask of engine IDs this firmware applies to.
+    engine_id_mask: u32,
+    /// ID of the microcode.
+    ucode_id: u32,
+}
+
+// SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
+unsafe impl FromBytes for HsSignatureParams {}
+
+impl HsSignatureParams {
+    /// Returns the signature parameters contained in `hs_fw`.
+    ///
+    /// Fails if the meta data parameter of `hs_fw` is outside the bounds of the firmware image, or
+    /// if its size doesn't match that of [`HsSignatureParams`].
+    fn new(hs_fw: &HsFirmwareV2<'_>) -> Result<Self> {
+        let start = hs_fw.hdr.meta_data_offset as usize;
+        let end = start
+            .checked_add(hs_fw.hdr.meta_data_size as usize)
+            .ok_or(EINVAL)?;
+
+        hs_fw
+            .fw
+            .get(start..end)
+            .and_then(Self::from_bytes_copy)
+            .ok_or(EINVAL)
+    }
+}
+
+/// Header for code and data load offsets.
+#[repr(C)]
+#[derive(Debug, Clone)]
+struct HsLoadHeaderV2 {
+    // Offset at which the code starts.
+    os_code_offset: u32,
+    // Total size of the code, for all apps.
+    os_code_size: u32,
+    // Offset at which the data starts.
+    os_data_offset: u32,
+    // Size of the data.
+    os_data_size: u32,
+    // Number of apps following this header. Each app is described by a [`HsLoadHeaderV2App`].
+    num_apps: u32,
+}
+
+// SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
+unsafe impl FromBytes for HsLoadHeaderV2 {}
+
+impl HsLoadHeaderV2 {
+    /// Returns the load header contained in `hs_fw`.
+    ///
+    /// Fails if the header pointed at by `hs_fw` is not within the bounds of the firmware image.
+    fn new(hs_fw: &HsFirmwareV2<'_>) -> Result<Self> {
+        frombytes_at::<Self>(hs_fw.fw, hs_fw.hdr.header_offset as usize)
+    }
+}
+
+/// Header for app code loader.
+#[repr(C)]
+#[derive(Debug, Clone)]
+struct HsLoadHeaderV2App {
+    /// Offset at which to load the app code.
+    offset: u32,
+    /// Length in bytes of the app code.
+    len: u32,
+}
+
+// SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
+unsafe impl FromBytes for HsLoadHeaderV2App {}
+
+impl HsLoadHeaderV2App {
+    /// Returns the [`HsLoadHeaderV2App`] for app `idx` of `hs_fw`.
+    ///
+    /// Fails if `idx` is larger than the number of apps declared in `hs_fw`, or if the header is
+    /// not within the bounds of the firmware image.
+    fn new(hs_fw: &HsFirmwareV2<'_>, idx: u32) -> Result<Self> {
+        let load_hdr = HsLoadHeaderV2::new(hs_fw)?;
+        if idx >= load_hdr.num_apps {
+            Err(EINVAL)
+        } else {
+            frombytes_at::<Self>(
+                hs_fw.fw,
+                (hs_fw.hdr.header_offset as usize)
+                    // Skip the load header...
+                    .checked_add(size_of::<HsLoadHeaderV2>())
+                    // ... and jump to app header `idx`.
+                    .and_then(|offset| {
+                        offset.checked_add((idx as usize).checked_mul(size_of::<Self>())?)
+                    })
+                    .ok_or(EINVAL)?,
+            )
+        }
+    }
+}
+
+/// Signature for Booter firmware. Their size is encoded into the header and not known a compile
+/// time, so we just wrap a byte slices on which we can implement [`FirmwareSignature`].
+struct BooterSignature<'a>(&'a [u8]);
+
+impl<'a> AsRef<[u8]> for BooterSignature<'a> {
+    fn as_ref(&self) -> &[u8] {
+        self.0
+    }
+}
+
+impl<'a> FirmwareSignature<BooterFirmware> for BooterSignature<'a> {}
+
+/// The `Booter` loader firmware, responsible for loading the GSP.
+pub(crate) struct BooterFirmware {
+    // Load parameters for `IMEM` falcon memory.
+    imem_load_target: FalconLoadTarget,
+    // Load parameters for `DMEM` falcon memory.
+    dmem_load_target: FalconLoadTarget,
+    // BROM falcon parameters.
+    brom_params: FalconBromParams,
+    // Device-mapped firmware image.
+    ucode: FirmwareDmaObject<Self, Signed>,
+}
+
+impl FirmwareDmaObject<BooterFirmware, Unsigned> {
+    fn new_booter(dev: &device::Device<device::Bound>, data: &[u8]) -> Result<Self> {
+        DmaObject::from_data(dev, data).map(|ucode| Self(ucode, PhantomData))
+    }
+}
+
+#[derive(Copy, Clone, Debug, PartialEq)]
+pub(crate) enum BooterKind {
+    Loader,
+    #[expect(unused)]
+    Unloader,
+}
+
+impl BooterFirmware {
+    /// Parses the Booter firmware contained in `fw`, and patches the correct signature so it is
+    /// ready to be loaded and run on `falcon`.
+    pub(crate) fn new(
+        dev: &device::Device<device::Bound>,
+        kind: BooterKind,
+        chipset: Chipset,
+        ver: &str,
+        falcon: &Falcon<<Self as FalconFirmware>::Target>,
+        bar: &Bar0,
+    ) -> Result<Self> {
+        let fw_name = match kind {
+            BooterKind::Loader => "booter_load",
+            BooterKind::Unloader => "booter_unload",
+        };
+        let fw = super::request_nv_firmware(dev, chipset, fw_name, ver)?;
+        let bin_fw = BinFirmware::new(&fw)?;
+
+        // The binary firmware embeds a Heavy-Secured firmware.
+        let hs_fw = HsFirmwareV2::new(&bin_fw)?;
+
+        // The Heavy-Secured firmware embeds a firmware load descriptor.
+        let load_hdr = HsLoadHeaderV2::new(&hs_fw)?;
+
+        // Offset in `ucode` where to patch the signature.
+        let patch_loc = hs_fw.patch_location()?;
+
+        let sig_params = HsSignatureParams::new(&hs_fw)?;
+        let brom_params = FalconBromParams {
+            // `load_hdr.os_data_offset` is an absolute index, but `pkc_data_offset` is from the
+            // signature patch location.
+            pkc_data_offset: patch_loc
+                .checked_sub(load_hdr.os_data_offset)
+                .ok_or(EINVAL)?,
+            engine_id_mask: u16::try_from(sig_params.engine_id_mask).map_err(|_| EINVAL)?,
+            ucode_id: u8::try_from(sig_params.ucode_id).map_err(|_| EINVAL)?,
+        };
+        let app0 = HsLoadHeaderV2App::new(&hs_fw, 0)?;
+
+        // Object containing the firmware microcode to be signature-patched.
+        let ucode = bin_fw
+            .data()
+            .ok_or(EINVAL)
+            .and_then(|data| FirmwareDmaObject::<Self, _>::new_booter(dev, data))?;
+
+        let ucode_signed = {
+            let mut signatures = hs_fw.signatures_iter()?.peekable();
+
+            if signatures.peek().is_none() {
+                // If there are no signatures, then the firmware is unsigned.
+                ucode.no_patch_signature()
+            } else {
+                // Obtain the version from the fuse register, and extract the corresponding
+                // signature.
+                let reg_fuse_version = falcon.signature_reg_fuse_version(
+                    bar,
+                    brom_params.engine_id_mask,
+                    brom_params.ucode_id,
+                )?;
+
+                // `0` means the last signature should be used.
+                const FUSE_VERSION_USE_LAST_SIG: u32 = 0;
+                let signature = match reg_fuse_version {
+                    FUSE_VERSION_USE_LAST_SIG => signatures.last(),
+                    // Otherwise hardware fuse version needs to be subtracted to obtain the index.
+                    reg_fuse_version => {
+                        let Some(idx) = sig_params.fuse_ver.checked_sub(reg_fuse_version) else {
+                            dev_err!(dev, "invalid fuse version for Booter firmware\n");
+                            return Err(EINVAL);
+                        };
+                        signatures.nth(idx as usize)
+                    }
+                }
+                .ok_or(EINVAL)?;
+
+                ucode.patch_signature(&signature, patch_loc as usize)?
+            }
+        };
+
+        Ok(Self {
+            imem_load_target: FalconLoadTarget {
+                src_start: app0.offset,
+                dst_start: 0,
+                len: app0.len,
+            },
+            dmem_load_target: FalconLoadTarget {
+                src_start: load_hdr.os_data_offset,
+                dst_start: 0,
+                len: load_hdr.os_data_size,
+            },
+            brom_params,
+            ucode: ucode_signed,
+        })
+    }
+}
+
+impl FalconLoadParams for BooterFirmware {
+    fn imem_load_params(&self) -> FalconLoadTarget {
+        self.imem_load_target.clone()
+    }
+
+    fn dmem_load_params(&self) -> FalconLoadTarget {
+        self.dmem_load_target.clone()
+    }
+
+    fn brom_params(&self) -> FalconBromParams {
+        self.brom_params.clone()
+    }
+
+    fn boot_addr(&self) -> u32 {
+        self.imem_load_target.src_start
+    }
+}
+
+impl Deref for BooterFirmware {
+    type Target = DmaObject;
+
+    fn deref(&self) -> &Self::Target {
+        &self.ucode.0
+    }
+}
+
+impl FalconFirmware for BooterFirmware {
+    type Target = Sec2;
+}
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 1dfd085189cbf188f9cfa829eb0cb7484d9c4d62..06a7ee8f4195759fb55ad483852724bb1ab46793 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -6,6 +6,7 @@
 use crate::falcon::{gsp::Gsp, sec2::Sec2, Falcon};
 use crate::fb::FbLayout;
 use crate::fb::SysmemFlush;
+use crate::firmware::booter::{BooterFirmware, BooterKind};
 use crate::firmware::fwsec::{FwsecCommand, FwsecFirmware};
 use crate::firmware::{Firmware, FIRMWARE_VERSION};
 use crate::gfw;
@@ -278,7 +279,7 @@ pub(crate) fn start_gsp(
         bar: &Bar0,
         chipset: Chipset,
         gsp_falcon: &Falcon<Gsp>,
-        _sec2_falcon: &Falcon<Sec2>,
+        sec2_falcon: &Falcon<Sec2>,
     ) -> Result<()> {
         let dev = pdev.as_ref();
 
@@ -289,6 +290,15 @@ pub(crate) fn start_gsp(
 
         Self::run_fwsec_frts(dev, gsp_falcon, bar, &bios, &fb_layout)?;
 
+        let _booter_loader = BooterFirmware::new(
+            dev,
+            BooterKind::Loader,
+            chipset,
+            FIRMWARE_VERSION,
+            sec2_falcon,
+            bar,
+        )?;
+
         // Return an empty placeholder for now, to be replaced with the GSP runtime data.
         Ok(())
     }

-- 
2.51.0


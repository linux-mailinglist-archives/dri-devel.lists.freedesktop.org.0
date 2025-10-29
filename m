Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B820C18EC9
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 09:17:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F27410E727;
	Wed, 29 Oct 2025 08:17:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="TatDWjbP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012004.outbound.protection.outlook.com [52.101.43.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3597E10E724;
 Wed, 29 Oct 2025 08:17:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HkMs+kBkCccu6K+B3/JWKPjLJ+Roz7dx44f6mRYwK7goRI4oVzL/yOaxoBovr8OC5jhaZAsShrgi5lVQXpDXZioepWyykBX1GVtCOrJ90AJVJZEtxOpK/2H+RuxHE1Xb5/j2iWTWNzCPuMWPziSxf9YDLlAVDRtiTfu6GxBOhCie/2mAnDw88U+4YxaHtxb1UDJgEclLMU8gxr3EUFhHbqAOdYWyba3D/Q5TgJhx9pU2ODBUjg09LtWtCsQ3ZxDouejXjt/CT/OclTsmgYdMsRjttuzPHiwPeLIgnye3Uanv516wTSdcIUFcjamux4wMqQQS7HAhAwH8LeYjT7GjUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Vgq42ubvnEAoZJTQPnx3eWE4OebPjCdhEIsidgfEVo=;
 b=dtqXMhQXXtKHR9vksRKExR3M2QPecKhfCpKkMyUTqEx2yt+wRDUwloGlfqImQZOPKlqE+CrL5tebbaCTtTRN4owEGdhhmoNTcTztEYqQ8cjznWiSk/lx2Loa2DsmLNtoYoMP0Qlr7mnZ5pwymrNlb+JwYoPO8AXticweT9bXrpKxVdbaoXsTz0QfyztDgiLwSY/3vy8PdPzPNjlKymcg9/8CX8cIOSALB0mmJDa5pnk6skdbKezgr5KwG34HFD8B60E+JMCzzfI0v7MwuLu16n65fsZ7ormfk1k0Q3BshPMZWr+Ss4Pe2S7Q1udTQ5dEpXklbHwZNlaYdKfcJp6n2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Vgq42ubvnEAoZJTQPnx3eWE4OebPjCdhEIsidgfEVo=;
 b=TatDWjbPoMTN04leV7W1GI6sii8DNqJPfWqcVXHGSOLLl6Ch9V4i2Zm1d04AIfXYLWlv8/Zse6SJ+XJEBvurYk88NTeg/3+mRbjsYYgFnuGNoDN3KKEjueF67DpnrW8PbE3S1o2Q2EH29QyyaItkewAaSvUO+IIyXOEI7co9uLaFIOkfmXSfwl3jJ51gFMzzsBQ6oJzqpXpQMoICQnW+pD91TubltQc1ZnJUQZUPbZ6njzdkG4dOpg1pcLRYEs2R0WkZ1F+U2VJxek5bGYWNERUh4YIYgcMiLTrqgTfBv/gbReAZHC1pn8Qu4GPvKdKqE4pGrkPPMDVbam9x8twQ1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3997.namprd12.prod.outlook.com (2603:10b6:208:161::11)
 by SA3PR12MB8438.namprd12.prod.outlook.com (2603:10b6:806:2f6::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Wed, 29 Oct
 2025 08:17:06 +0000
Received: from MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316]) by MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316%4]) with mapi id 15.20.9275.011; Wed, 29 Oct 2025
 08:17:06 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 29 Oct 2025 17:16:28 +0900
Subject: [PATCH v7 01/14] gpu: nova-core: compute layout of more
 framebuffer regions required for GSP
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-gsp_boot-v7-1-34227afad347@nvidia.com>
References: <20251029-gsp_boot-v7-0-34227afad347@nvidia.com>
In-Reply-To: <20251029-gsp_boot-v7-0-34227afad347@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: OS0P286CA0155.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:16a::6) To BY5PR12MB3986.namprd12.prod.outlook.com
 (2603:10b6:a03:195::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3997:EE_|SA3PR12MB8438:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a43f202-4de6-44ca-df2f-08de16c38b72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|7416014|376014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OWNKeEZnUHlCMDBYYjJVL2dJVTczdGdGaEUvT1o5VGVHeGd0cEtqc0JnQlIv?=
 =?utf-8?B?TkFKZFpTenFIUEF1QWJ3NmNxN1UrN3hXRUtxOUJCcE9NQ2NEM2ZURDlHbEJm?=
 =?utf-8?B?UFJDRHE4bnZ6dDBpdWd2N1RTWVprS3MwMHp5allmVDd3Qk1DSEU0K1oxMXdn?=
 =?utf-8?B?Nm1KbFUza0JtcGtkZGw3cGJzMFdKY2RUWXB5dVhPdldjaUpOdTN4SEJqNU9P?=
 =?utf-8?B?MENsaXE4VWpXQURENHZqY1RFQVlpaU9vQ2wxVzVCREJWMUY1a0hSLzlreWVi?=
 =?utf-8?B?YWZYS012Zm5oSHltSUZrcXhQMVUxZUdFTklWaGt6RWx5a3JvWGdKRlVoam1t?=
 =?utf-8?B?NmVLMVBJNk9mNGNDR2xyOHZyOUQzcklUUUZtcEVKeCt3N0t0ZTFNbWhFaDJY?=
 =?utf-8?B?dURkcU5Ycm41WGdIMjYveFY1Nm9zTThGM2xqQ2JnVFhXMGsvbDNZN0JwMS9n?=
 =?utf-8?B?M2dLK3EyL0w5VjJnZUdtMjlPQUVTUFl1VTUvUG9WdXJ4eGRzVklEWmtGd2V0?=
 =?utf-8?B?SEVjeEkvZnFUUWVRcmVCRjdpeWFTY3JKYXhHUDBRK016K1FORnltOXZ1OTBD?=
 =?utf-8?B?RXczK25hbHRqV1BSUUd0ZExmSnNHTzE4dGNCbDdJcnBsWVlGUENkQTZXL25z?=
 =?utf-8?B?RjBDci9kbHRhWEhReXp2dnVTRUZXMzhXY1o1WTZsdXN2S0ZLRC9Wdk5WeXA4?=
 =?utf-8?B?bWpTSHVoamg2VkFsa21nanppUWRVZnM5VXlSSkhWTkNQUVB0ckdzN2FUUDha?=
 =?utf-8?B?bGhYak45TjhLTVh4QnNMZlJRK0VoeFFyUjJzNnduSkdXVkZVK0doazBDQS9S?=
 =?utf-8?B?S0NMT0QyRFB5TnBiWDQzcTdIOFh6U09OZk02aUh2L24yR1NoNHo2czdPYWtO?=
 =?utf-8?B?YVgwMEhSOCtTdmI3eTEwZk1jaFpYeWYrRHBjeU9hdUxvR08xazdOWnd4Q2ky?=
 =?utf-8?B?cEo5L2kzK2dubUN5L1Q0R3BwclpjRWxmZms4aERPNHF1cjdwTjUrQnl5RE9a?=
 =?utf-8?B?eHlDNllpNjRlV21GbWdDSVBDM3FqSUQrQzc1Y0NNeVl1cU9Ob1pLUnFWODh3?=
 =?utf-8?B?cWQ2NTM1UHRjT0FDNnZJYnRodXpYUkl3cjRvbUZuS0hVNkF3YWYwR3htemJJ?=
 =?utf-8?B?ZGYwSVp1b21BclN6VUprc3U2TDBRdVAxS1F0eTF2TEZDeUxuUEVrb3AxR0k4?=
 =?utf-8?B?QlJiRWZDMEh3SmdzTVZaU0hTemx3VXN5TENYYURPQkEvSGhJbWFRK0tqRkJv?=
 =?utf-8?B?dWR3QlZ2b2VuMXJuTzBoNzB5NStQQ2R5cFVLbFgveVRhSldCUmN1Q1UwNXUw?=
 =?utf-8?B?d3JpdVdIa1JGS3I1dm8xSkFHajhNOGRKZ0IxczE4TzZsQ05BRFBudHNFUTla?=
 =?utf-8?B?NXVjUVRydlB5Q2laTjUrU2pxeVpUTE4rb0NUQzVwR3pTNU5iLzdXV2kveUda?=
 =?utf-8?B?bkdhNVZKb3hkNlRBNkFDajE0b0xaTVl2VG9kTHV4cFh4QWhXZHd2YjJQVVlw?=
 =?utf-8?B?aEN2S293Q3R1ZzhRanMrVUREZmRsYVpGTWhxcXlvam9lNnhPVWZkWG1MYk9i?=
 =?utf-8?B?SjVnam9tVEpkbEJFWklPVVM1NjEydnFRRWZMSTdkSXB4ZkdBdmFZZUdLbmQx?=
 =?utf-8?B?R3NJNTFibmozOFYyS01wOEFjSCtNNVJ3MTd5WGFDNjVCYWI3bzdhYkpweS9a?=
 =?utf-8?B?U3JXL1BBem41U2VodG9oelZSQXJXb2NZdzJocWN4RWlUOGZqUXRwVkdYUkM5?=
 =?utf-8?B?enRkcWlBbUVCNGF5cEJobnBnc2l0dTFkZFRVOWJkdkZlVkErbkVDbFQ2YjlQ?=
 =?utf-8?B?UTFnSnp4Nis5MUpKNENqa2Z6ZDFCc05WelF5elhuV3czOG1uQ2dyZzBmWnIr?=
 =?utf-8?B?TnpHcVdBTjZYdXlHMkpTZzZtUHNXU21hQWNCMmNwSXQxczZQalFINW1Ma2tz?=
 =?utf-8?B?amswRldLZ0ZPS0NQRjVVcGJOQ2VLZ2xTVzRIMXJheHkvaE9WcSthVlBnckQ2?=
 =?utf-8?Q?J/JnNntL4Ohw20VtmEadkfCP+fsTCU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3997.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(7416014)(376014)(366016)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bzVHY29EUnRGaEcrdHFZWVdsdm1hSkZwZjliUllRUk80dnJqTXVsa1RUM0hQ?=
 =?utf-8?B?WTJOWldtbXByWC84VkhaMTlhK1NJUkd4OGRnN2hpRUI4cnRmWjdZVisvOCtQ?=
 =?utf-8?B?YWczVHRjYWUzLzNubkZTUUpwYmsvMDQ2dkE0N1lOS0w2TlBQcGJmcVg3d1Za?=
 =?utf-8?B?aE9mZW82b0RxVTdHcDhMcTMxYXFSL1Z3QzRudjhLR1V6N3NIb3hueS9EVDhz?=
 =?utf-8?B?dHNSTDc5ZWl0YSs0dWYzVTRZcTF5Y2ZBVFV5ZEtPdExmbWxsdTZkRXZqMXlB?=
 =?utf-8?B?ZFQyckxZRVh6TWpDUEYvSGNhVXdKd3dQRHQ4R2FTakFyMWFHdmxhdC9CbHhi?=
 =?utf-8?B?a2xzbFJzV1ZkVGs5WVhzdlJJMUNWb2pvbVFnMGpLdU5tZ2V5MVFrQ09kaWNt?=
 =?utf-8?B?Q2NLaTgyTFVPeWdaandIa2FUd0dmMUtvb1lNdEthM2JQK20vOU9VN1VSZldN?=
 =?utf-8?B?OUR5dEIrS0ZPZ1lhc0hGYVFGRlBZYUdOZWV5WUVZV243Q0wyMGhmWXZLclBG?=
 =?utf-8?B?U296b2F5K21FTW1STVBOa1BxM1RtN3NkdWs2aDBkNW1pMmxvc0k2c3Vld3pM?=
 =?utf-8?B?NTBBRSthSzQvSnpKZ0gyUDFWNHBURTVlbU1uMTNVbFp1a2NVSExmQmJzc2Va?=
 =?utf-8?B?UTdJZmYyZHFydjZhZmRRQnAzaktrbExtbWFUdWJRNmJ3TUJsNWhmLzFZdkNo?=
 =?utf-8?B?b0x6Q3IydHdoUFNTMEVPRU9jejQ0eG1Eb3NSS2lFa1hKOER6ODBYeDNrUGV4?=
 =?utf-8?B?aEJlSEFMN2RIRTdURW5pNjBLb0dKVFJhbGdEU016Q0VOTjJIVUcxYUo1RHVF?=
 =?utf-8?B?dWJUSjZwZm1FMmh4L3lmakN3RTJUamx6UGtKYUFrNjByM1dWU1ZjZURzMlRw?=
 =?utf-8?B?YlVtekpNUk8vMEx4NXBhMm14VlJsc2NHY241NFBiYWlYd0cwYitaWHFHamJa?=
 =?utf-8?B?UWwrcE4yRnBqN0Q3dUd1MFMyanpUZkdFZFZvTGMvaWd3N1hYc3FleHVZb0dW?=
 =?utf-8?B?VjVjL2xqMDdsd3RkOURFWHk2RG40L3NXckFWTFA5Y1AvMGJZQjFRbjQvOVE1?=
 =?utf-8?B?ak5Pbi8yNlhuZjRIdUwxR2VsZ08zRDBERUdXZGJ0OHZxb3hSMGtjVzRVS1Rk?=
 =?utf-8?B?RlptaXRDclhCajJNTCtqNVptMEJVR3MyUC9qYVQyVVZKWmpOcjlsUjdlL0dT?=
 =?utf-8?B?SHJ4ajNjeFlwMDlld3QzMkk0ekQzbnU3cGw1a2p6WmMwRGFUbC9LRmN0cXFB?=
 =?utf-8?B?YTJSYU8zT0xMQ3FWaEZQN083dGVQY2g4SEM4Wi9RTlVFTElkMWRqaUo4SmFE?=
 =?utf-8?B?K2NoVkxOZXh4QzBXLzNYeWszODVpb1Nra0pXQnFRSTM2N3o2NE5vUEVjdkRm?=
 =?utf-8?B?OHFKRFUxeWhjeStGSlVFZzhOQ25sLzUrUmpkRVZJa2RsWVlVcmNISWREaThm?=
 =?utf-8?B?LzhWTmZsUnFrWnJOdS9tZWhXdHdQY0JQa3B3YWQ4M1IyVFNpQkFXTlVpNDkw?=
 =?utf-8?B?cVFmQ1FpZUlJQWRrZW1CYWhIcEZEL3RGcHpmSGhwYUJqS25NYmg0M3VQN1pV?=
 =?utf-8?B?UjhaREFVYXZyM2JwRDZKQWJjK0dFSW9MUlp3UVBmMjZCaFlKc2JlbU4yVnFk?=
 =?utf-8?B?N3BNbnJtamdYYUdtQVBoZlhSK2ZZUEtVUk42R1JqeVFSckZzRyticVhtcnll?=
 =?utf-8?B?d2FmVGlRU0JEY0p5N0tnNmE0UzFPaWNKYzcxR0dqM1Y1R3lWSFhmcUE4aDUz?=
 =?utf-8?B?SG0wWkYzM25CYUpQOFpkYUlydzg4QXpoc2E5QXVmTTdKV0ZQMXVkY2ZqRUVK?=
 =?utf-8?B?d0NROWpyL0hmNFJ4R3h4NFVGUjk4ZkMycDJzdTY0WDk4UmFGN3ZMU2lsaXQ3?=
 =?utf-8?B?azUwSWVNUzBYb0tXVlJFMmg3eW5ySnNpTisvM3ZuSHE3MCtYWGxoRXlkV0NX?=
 =?utf-8?B?bU1Mc0VkcHNMZGZOUmFGaEFmYVFlWHNqdC81dHp0Z0FaWEtQY0J0MTd5WUNn?=
 =?utf-8?B?OFRrOHVCWGcrUnpHcGhqaDdSQXltUFVVTldxOFYwMXV2bUtoayttTUh3bHQz?=
 =?utf-8?B?eWFvem5raFBXaXpnSkx1dU1BUlcveE5aMnBOMHRCVDltdmNzQllZN0RFOVlu?=
 =?utf-8?B?Sy9GVlJ4eVQwNUVsdWJ0UVF3WkE0S2R2Wjc3eDE3M1RpcFlXWmlOb0prOHVX?=
 =?utf-8?Q?7TwgOG+R/jjnoT+5Ot5eDHDOOgKUwcE45SPFUvlBKqdz?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a43f202-4de6-44ca-df2f-08de16c38b72
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB3986.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 08:17:06.4881 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W9g0ztrLlVXE2eCTlzD0vO72au1G6Lr2lgnOi+rkB8ORvDUpHUjWGauHrs045zdRSzr5zw4U/DDJQtOMVV8stg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8438
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

Compute more of the required FB layout information to boot the GSP
firmware.

This information is dependent on the firmware itself, so first we need
to import and abstract the required firmware bindings in the `nvfw`
module.

Then, a new FB HAL method is introduced in `fb::hal` that uses these
bindings and hardware information to compute the correct layout
information.

This information is then used in `fb` and the result made visible in
`FbLayout`.

These 3 things are grouped into the same patch to avoid lots of unused
warnings that would be tedious to work around. As they happen in
different files, they should not be too difficult to track separately.

Acked-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs                       |  67 +++++++++++-
 drivers/gpu/nova-core/firmware/gsp.rs             |   4 +-
 drivers/gpu/nova-core/firmware/riscv.rs           |   2 +-
 drivers/gpu/nova-core/gsp.rs                      |   4 +
 drivers/gpu/nova-core/gsp/boot.rs                 |   4 +-
 drivers/gpu/nova-core/gsp/fw.rs                   | 101 ++++++++++++++++-
 drivers/gpu/nova-core/gsp/fw/r570_144.rs          |   1 -
 drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs | 125 ++++++++++++++++++++++
 8 files changed, 298 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index 1461dd643cae..6ad4aca6ab66 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -10,8 +10,10 @@
 
 use crate::dma::DmaObject;
 use crate::driver::Bar0;
+use crate::firmware::gsp::GspFirmware;
 use crate::gpu::Chipset;
-use crate::num::usize_as_u64;
+use crate::gsp;
+use crate::num::{usize_as_u64, FromSafeCast};
 use crate::regs;
 
 mod hal;
@@ -88,14 +90,28 @@ pub(crate) fn unregister(&self, bar: &Bar0) {
 #[derive(Debug)]
 #[expect(dead_code)]
 pub(crate) struct FbLayout {
+    /// Range of the framebuffer. Starts at `0`.
     pub(crate) fb: Range<u64>,
+    /// VGA workspace, small area of reserved memory at the end of the framebuffer.
     pub(crate) vga_workspace: Range<u64>,
+    /// FRTS range.
     pub(crate) frts: Range<u64>,
+    /// Memory area containing the GSP bootloader image.
+    pub(crate) boot: Range<u64>,
+    /// Memory area containing the GSP firmware image.
+    pub(crate) elf: Range<u64>,
+    /// WPR2 heap.
+    pub(crate) wpr2_heap: Range<u64>,
+    // WPR2 region range, starting with an instance of `GspFwWprMeta`.
+    pub(crate) wpr2: Range<u64>,
+    pub(crate) heap: Range<u64>,
+    pub(crate) vf_partition_count: u8,
 }
 
 impl FbLayout {
-    /// Computes the FB layout.
-    pub(crate) fn new(chipset: Chipset, bar: &Bar0) -> Result<Self> {
+    /// Computes the FB layout for `chipset`, for running the `bl` GSP bootloader and `gsp` GSP
+    /// firmware.
+    pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<Self> {
         let hal = hal::fb_hal(chipset);
 
         let fb = {
@@ -139,10 +155,55 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0) -> Result<Self> {
             frts_base..frts_base + FRTS_SIZE
         };
 
+        let boot = {
+            const BOOTLOADER_DOWN_ALIGN: Alignment = Alignment::new::<SZ_4K>();
+            let bootloader_size = u64::from_safe_cast(gsp_fw.bootloader.ucode.size());
+            let bootloader_base = (frts.start - bootloader_size).align_down(BOOTLOADER_DOWN_ALIGN);
+
+            bootloader_base..bootloader_base + bootloader_size
+        };
+
+        let elf = {
+            const ELF_DOWN_ALIGN: Alignment = Alignment::new::<SZ_64K>();
+            let elf_size = u64::from_safe_cast(gsp_fw.size);
+            let elf_addr = (boot.start - elf_size).align_down(ELF_DOWN_ALIGN);
+
+            elf_addr..elf_addr + elf_size
+        };
+
+        let wpr2_heap = {
+            const WPR2_HEAP_DOWN_ALIGN: Alignment = Alignment::new::<SZ_1M>();
+            let wpr2_heap_size =
+                crate::gsp::LibosParams::from_chipset(chipset).wpr_heap_size(chipset, fb.end);
+            let wpr2_heap_addr = (elf.start - wpr2_heap_size).align_down(WPR2_HEAP_DOWN_ALIGN);
+
+            wpr2_heap_addr..(elf.start).align_down(WPR2_HEAP_DOWN_ALIGN)
+        };
+
+        let wpr2 = {
+            const WPR2_DOWN_ALIGN: Alignment = Alignment::new::<SZ_1M>();
+            let wpr2_addr = (wpr2_heap.start - u64::from_safe_cast(size_of::<gsp::GspFwWprMeta>()))
+                .align_down(WPR2_DOWN_ALIGN);
+
+            wpr2_addr..frts.end
+        };
+
+        let heap = {
+            const HEAP_SIZE: u64 = usize_as_u64(SZ_1M);
+
+            wpr2.start - HEAP_SIZE..wpr2.start
+        };
+
         Ok(Self {
             fb,
             vga_workspace,
             frts,
+            boot,
+            elf,
+            wpr2_heap,
+            wpr2,
+            heap,
+            vf_partition_count: 0,
         })
     }
 }
diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index b78311f32752..54584692922f 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -130,11 +130,11 @@ pub(crate) struct GspFirmware {
     /// Level 0 page table (single 4KB page) with one entry: DMA address of first level 1 page.
     level0: DmaObject,
     /// Size in bytes of the firmware contained in [`Self::fw`].
-    size: usize,
+    pub(crate) size: usize,
     /// Device-mapped GSP signatures matching the GPU's [`Chipset`].
     signatures: DmaObject,
     /// GSP bootloader, verifies the GSP firmware before loading and running it.
-    bootloader: RiscvFirmware,
+    pub(crate) bootloader: RiscvFirmware,
 }
 
 impl GspFirmware {
diff --git a/drivers/gpu/nova-core/firmware/riscv.rs b/drivers/gpu/nova-core/firmware/riscv.rs
index 0bae8c74328a..c0aa0c7f6eb9 100644
--- a/drivers/gpu/nova-core/firmware/riscv.rs
+++ b/drivers/gpu/nova-core/firmware/riscv.rs
@@ -64,7 +64,7 @@ pub(crate) struct RiscvFirmware {
     /// Application version.
     app_version: u32,
     /// Device-mapped firmware image.
-    ucode: DmaObject,
+    pub(crate) ucode: DmaObject,
 }
 
 impl RiscvFirmware {
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 64e472e7a9d3..0e698add406f 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -3,11 +3,15 @@
 mod boot;
 
 use kernel::prelude::*;
+use kernel::ptr::Alignment;
 
 mod fw;
 
+pub(crate) use fw::{GspFwWprMeta, LibosParams};
+
 pub(crate) const GSP_PAGE_SHIFT: usize = 12;
 pub(crate) const GSP_PAGE_SIZE: usize = 1 << GSP_PAGE_SHIFT;
+pub(crate) const GSP_HEAP_ALIGNMENT: Alignment = Alignment::new::<{ 1 << 20 }>();
 
 /// GSP runtime data.
 ///
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 2800f3aee37d..fb22508128c4 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -113,12 +113,12 @@ pub(crate) fn boot(
 
         let bios = Vbios::new(dev, bar)?;
 
-        let _gsp_fw = KBox::pin_init(
+        let gsp_fw = KBox::pin_init(
             GspFirmware::new(dev, chipset, FIRMWARE_VERSION)?,
             GFP_KERNEL,
         )?;
 
-        let fb_layout = FbLayout::new(chipset, bar)?;
+        let fb_layout = FbLayout::new(chipset, bar, &gsp_fw)?;
         dev_dbg!(dev, "{:#x?}\n", fb_layout);
 
         Self::run_fwsec_frts(dev, gsp_falcon, bar, &bios, &fb_layout)?;
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 34226dd00982..4aefb7984f25 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -3,5 +3,104 @@
 mod r570_144;
 
 // Alias to avoid repeating the version number with every use.
-#[expect(unused)]
 use r570_144 as bindings;
+
+use core::ops::Range;
+
+use kernel::ptr::Alignable;
+use kernel::sizes::SZ_1M;
+
+use crate::gpu::Chipset;
+use crate::gsp;
+use crate::num::{self, FromSafeCast};
+
+/// Dummy type to group methods related to heap parameters for running the GSP firmware.
+pub(crate) struct GspFwHeapParams(());
+
+impl GspFwHeapParams {
+    /// Returns the amount of GSP-RM heap memory used during GSP-RM boot and initialization (up to
+    /// and including the first client subdevice allocation).
+    fn base_rm_size(_chipset: Chipset) -> u64 {
+        // TODO: this needs to be updated to return the correct value for Hopper+ once support for
+        // them is added:
+        // u64::from(bindings::GSP_FW_HEAP_PARAM_BASE_RM_SIZE_GH100)
+        u64::from(bindings::GSP_FW_HEAP_PARAM_BASE_RM_SIZE_TU10X)
+    }
+
+    /// Returns the amount of heap memory required to support a single channel allocation.
+    fn client_alloc_size() -> u64 {
+        u64::from(bindings::GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE)
+            .align_up(gsp::GSP_HEAP_ALIGNMENT)
+            .unwrap_or(u64::MAX)
+    }
+
+    /// Returns the amount of memory to reserve for management purposes for a framebuffer of size
+    /// `fb_size`.
+    fn management_overhead(fb_size: u64) -> u64 {
+        let fb_size_gb = fb_size.div_ceil(u64::from_safe_cast(kernel::sizes::SZ_1G));
+
+        u64::from(bindings::GSP_FW_HEAP_PARAM_SIZE_PER_GB_FB)
+            .saturating_mul(fb_size_gb)
+            .align_up(gsp::GSP_HEAP_ALIGNMENT)
+            .unwrap_or(u64::MAX)
+    }
+}
+
+/// Heap memory requirements and constraints for a given version of the GSP LIBOS.
+pub(crate) struct LibosParams {
+    /// The base amount of heap required by the GSP operating system, in bytes.
+    carveout_size: u64,
+    /// The minimum and maximum sizes allowed for the GSP FW heap, in bytes.
+    allowed_heap_size: Range<u64>,
+}
+
+impl LibosParams {
+    /// Version 2 of the GSP LIBOS (Turing and GA100)
+    const LIBOS2: LibosParams = LibosParams {
+        carveout_size: num::u32_as_u64(bindings::GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS2),
+        allowed_heap_size: num::u32_as_u64(bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MIN_MB)
+            * num::usize_as_u64(SZ_1M)
+            ..num::u32_as_u64(bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MAX_MB)
+                * num::usize_as_u64(SZ_1M),
+    };
+
+    /// Version 3 of the GSP LIBOS (GA102+)
+    const LIBOS3: LibosParams = LibosParams {
+        carveout_size: num::u32_as_u64(bindings::GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS3_BAREMETAL),
+        allowed_heap_size: num::u32_as_u64(
+            bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MIN_MB,
+        ) * num::usize_as_u64(SZ_1M)
+            ..num::u32_as_u64(bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MAX_MB)
+                * num::usize_as_u64(SZ_1M),
+    };
+
+    /// Returns the libos parameters corresponding to `chipset`.
+    pub(crate) fn from_chipset(chipset: Chipset) -> &'static LibosParams {
+        if chipset < Chipset::GA102 {
+            &Self::LIBOS2
+        } else {
+            &Self::LIBOS3
+        }
+    }
+
+    /// Returns the amount of memory (in bytes) to allocate for the WPR heap for a framebuffer size
+    /// of `fb_size` (in bytes) for `chipset`.
+    pub(crate) fn wpr_heap_size(&self, chipset: Chipset, fb_size: u64) -> u64 {
+        // The WPR heap will contain the following:
+        // LIBOS carveout,
+        self.carveout_size
+            // RM boot working memory,
+            .saturating_add(GspFwHeapParams::base_rm_size(chipset))
+            // One RM client,
+            .saturating_add(GspFwHeapParams::client_alloc_size())
+            // Overhead for memory management.
+            .saturating_add(GspFwHeapParams::management_overhead(fb_size))
+            // Clamp to the supported heap sizes.
+            .clamp(self.allowed_heap_size.start, self.allowed_heap_size.end - 1)
+    }
+}
+
+/// Structure passed to the GSP bootloader, containing the framebuffer layout as well as the DMA
+/// addresses of the GSP bootloader and firmware.
+#[repr(transparent)]
+pub(crate) struct GspFwWprMeta(bindings::GspFwWprMeta);
diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144.rs b/drivers/gpu/nova-core/gsp/fw/r570_144.rs
index 35cb0370a7c9..82a973cd99c3 100644
--- a/drivers/gpu/nova-core/gsp/fw/r570_144.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144.rs
@@ -12,7 +12,6 @@
 #![cfg_attr(test, allow(unsafe_op_in_unsafe_fn))]
 #![allow(
     dead_code,
-    unused_imports,
     clippy::all,
     clippy::undocumented_unsafe_blocks,
     clippy::ptr_as_ptr,
diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
index cec594032515..0407000cca22 100644
--- a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
@@ -1 +1,126 @@
 // SPDX-License-Identifier: GPL-2.0
+
+pub const GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS2: u32 = 0;
+pub const GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS3_BAREMETAL: u32 = 23068672;
+pub const GSP_FW_HEAP_PARAM_BASE_RM_SIZE_TU10X: u32 = 8388608;
+pub const GSP_FW_HEAP_PARAM_SIZE_PER_GB_FB: u32 = 98304;
+pub const GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE: u32 = 100663296;
+pub const GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MIN_MB: u32 = 64;
+pub const GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MAX_MB: u32 = 256;
+pub const GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MIN_MB: u32 = 88;
+pub const GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MAX_MB: u32 = 280;
+pub type __u8 = ffi::c_uchar;
+pub type __u16 = ffi::c_ushort;
+pub type __u32 = ffi::c_uint;
+pub type __u64 = ffi::c_ulonglong;
+pub type u8_ = __u8;
+pub type u16_ = __u16;
+pub type u32_ = __u32;
+pub type u64_ = __u64;
+#[repr(C)]
+#[derive(Copy, Clone)]
+pub struct GspFwWprMeta {
+    pub magic: u64_,
+    pub revision: u64_,
+    pub sysmemAddrOfRadix3Elf: u64_,
+    pub sizeOfRadix3Elf: u64_,
+    pub sysmemAddrOfBootloader: u64_,
+    pub sizeOfBootloader: u64_,
+    pub bootloaderCodeOffset: u64_,
+    pub bootloaderDataOffset: u64_,
+    pub bootloaderManifestOffset: u64_,
+    pub __bindgen_anon_1: GspFwWprMeta__bindgen_ty_1,
+    pub gspFwRsvdStart: u64_,
+    pub nonWprHeapOffset: u64_,
+    pub nonWprHeapSize: u64_,
+    pub gspFwWprStart: u64_,
+    pub gspFwHeapOffset: u64_,
+    pub gspFwHeapSize: u64_,
+    pub gspFwOffset: u64_,
+    pub bootBinOffset: u64_,
+    pub frtsOffset: u64_,
+    pub frtsSize: u64_,
+    pub gspFwWprEnd: u64_,
+    pub fbSize: u64_,
+    pub vgaWorkspaceOffset: u64_,
+    pub vgaWorkspaceSize: u64_,
+    pub bootCount: u64_,
+    pub __bindgen_anon_2: GspFwWprMeta__bindgen_ty_2,
+    pub gspFwHeapVfPartitionCount: u8_,
+    pub flags: u8_,
+    pub padding: [u8_; 2usize],
+    pub pmuReservedSize: u32_,
+    pub verified: u64_,
+}
+#[repr(C)]
+#[derive(Copy, Clone)]
+pub union GspFwWprMeta__bindgen_ty_1 {
+    pub __bindgen_anon_1: GspFwWprMeta__bindgen_ty_1__bindgen_ty_1,
+    pub __bindgen_anon_2: GspFwWprMeta__bindgen_ty_1__bindgen_ty_2,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct GspFwWprMeta__bindgen_ty_1__bindgen_ty_1 {
+    pub sysmemAddrOfSignature: u64_,
+    pub sizeOfSignature: u64_,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct GspFwWprMeta__bindgen_ty_1__bindgen_ty_2 {
+    pub gspFwHeapFreeListWprOffset: u32_,
+    pub unused0: u32_,
+    pub unused1: u64_,
+}
+impl Default for GspFwWprMeta__bindgen_ty_1 {
+    fn default() -> Self {
+        let mut s = ::core::mem::MaybeUninit::<Self>::uninit();
+        unsafe {
+            ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
+            s.assume_init()
+        }
+    }
+}
+#[repr(C)]
+#[derive(Copy, Clone)]
+pub union GspFwWprMeta__bindgen_ty_2 {
+    pub __bindgen_anon_1: GspFwWprMeta__bindgen_ty_2__bindgen_ty_1,
+    pub __bindgen_anon_2: GspFwWprMeta__bindgen_ty_2__bindgen_ty_2,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct GspFwWprMeta__bindgen_ty_2__bindgen_ty_1 {
+    pub partitionRpcAddr: u64_,
+    pub partitionRpcRequestOffset: u16_,
+    pub partitionRpcReplyOffset: u16_,
+    pub elfCodeOffset: u32_,
+    pub elfDataOffset: u32_,
+    pub elfCodeSize: u32_,
+    pub elfDataSize: u32_,
+    pub lsUcodeVersion: u32_,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct GspFwWprMeta__bindgen_ty_2__bindgen_ty_2 {
+    pub partitionRpcPadding: [u32_; 4usize],
+    pub sysmemAddrOfCrashReportQueue: u64_,
+    pub sizeOfCrashReportQueue: u32_,
+    pub lsUcodeVersionPadding: [u32_; 1usize],
+}
+impl Default for GspFwWprMeta__bindgen_ty_2 {
+    fn default() -> Self {
+        let mut s = ::core::mem::MaybeUninit::<Self>::uninit();
+        unsafe {
+            ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
+            s.assume_init()
+        }
+    }
+}
+impl Default for GspFwWprMeta {
+    fn default() -> Self {
+        let mut s = ::core::mem::MaybeUninit::<Self>::uninit();
+        unsafe {
+            ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
+            s.assume_init()
+        }
+    }
+}

-- 
2.51.0


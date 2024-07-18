Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC129346A1
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2024 05:12:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62CF210E03B;
	Thu, 18 Jul 2024 03:12:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="I4cFGVuU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SINPR02CU002.outbound.protection.outlook.com
 (mail-southeastasiaazon11012070.outbound.protection.outlook.com
 [52.101.135.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDF6C10E03B
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 03:12:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T84/QqpVKiOxCJDt+fVtNS4NimApmWE0MpCm1h1wggTlblhphJyrH/TZKhthWTR57eX4FQuINR/jqwGwi1CdxDyha5qs0TFzhAdrmzkXmTHFgFIx//qmcgrBBScqOrn6Ge0YzgXLSEZPM0N7Vz1E2lqCdlADPfOjGJXmfI3MgT/V5clx/P5uy9BhNlac5HpP3PJZB6vHD4KR8ZpTqke0rYz8LDDt7kYHpM9dEE1yvdtUDwm9vbmwo/2P0aqHpUYLq7pYX2myRJind5C09M5G4YE8RyHPDbEnd9AU89RD1ZLJy2PT5vhz0AdFVsaT9ec/WK0FQrl4cJYDXBszUckzoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ijN5egPdFnDtgf8iMwXb6Qa5w8YkLlKQ1ijc6yRwF7g=;
 b=oI/4sfA3STdtFrH2tDSDYpFPcgtImVAQfP/M6fhu4Hnji1Y+N2nmg16dSrEP9kU7s+q4mcYY0LMNv0MDtYdzXyHz6nuRHOF3BIoGxb/rgpBDPoqrlefINhCt6jJdqzqZkfRijrvxCh2w0+9wMNams4OttSFPT1UaG637hvx9k7Xm99kV7Dg9SMmX+pt2tJjilb2cAnp0DacunFw6pRovXQu4tovCEa4TF4LhCVkhLywwxmhe/3Lrb2GfHjkycqk7i5QGCyAi+hhdS0MQtUIYXccyMA5fxvCwT9uwWkJffmPei60XXJWjfatnYRcpRykDc5c5H1fOTNQTgG/bEsQJEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ijN5egPdFnDtgf8iMwXb6Qa5w8YkLlKQ1ijc6yRwF7g=;
 b=I4cFGVuU4aNPfI2OrcnIXsJHI8tpRBEEs6zIOZ9+mZlMLz+fTcNrH8B4jYJlhvD2vm6oqm6Rmc2qqt8KRqIEvGtC7ulVyw/s+sI6756b3jzmryH/FqTXI8VCKB2YXwvWIgR+Qrl394Y8gpNzyV3j5WdWM1hY26i6rxdzN8Bjx5pCyXXmdaeZMVGoAjPxoTpQsrkDQiFgw28SlPjT5wiMUWMyEYQPvi9cQr6DgOC6AARTp+DDyWt/WurHZ0KhKlp6OiiiUsEpPcU0CtG1jYO4hrj/4/fonX/Lp+DaiePBxSmqTAXyoq0ew+OQVYeTKZDxio8unjfU0XLlIPKiD1YCYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by TY0PR06MB5152.apcprd06.prod.outlook.com (2603:1096:400:1b3::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.18; Thu, 18 Jul
 2024 03:12:27 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%6]) with mapi id 15.20.7762.027; Thu, 18 Jul 2024
 03:12:27 +0000
Message-ID: <8b7be53b-ea23-4470-9f03-d46d5ae0dc81@vivo.com>
Date: Thu, 18 Jul 2024 11:12:22 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dma-buf: heaps: DMA_HEAP_IOCTL_ALLOC_READ_FILE
 framework
To: Christoph Hellwig <hch@infradead.org>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, opensource.kernel@vivo.com
References: <20240711074221.459589-2-link@vivo.com>
 <5ccbe705-883c-4651-9e66-6b452c414c74@amd.com>
 <ZpTnzkdolpEwFbtu@phenom.ffwll.local>
 <99364176-a7f0-4a17-8889-75ff92d5694e@amd.com>
 <06713006-c5ce-4773-a1b3-ca3bea56ee45@vivo.com>
 <ZpY-CfcDdEhzWpxN@phenom.ffwll.local>
 <b18ad853-90e4-4ad7-b621-2ca8a8111708@vivo.com>
 <Zpff-8LmqK5AD-a8@phenom.ffwll.local> <Zpf5R7fRZZmEwVuR@infradead.org>
 <7140a145-7dd5-43b0-8b2a-0fd12bb9e62d@vivo.com>
 <ZpiHKY2pGiBuEq4z@infradead.org>
From: Huan Yang <link@vivo.com>
In-Reply-To: <ZpiHKY2pGiBuEq4z@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR01CA0019.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::12) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|TY0PR06MB5152:EE_
X-MS-Office365-Filtering-Correlation-Id: 4137a551-25fe-4d65-bef2-08dca6d773d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bmxqVzI2N1BNSVIzNkNnQ1VOdXMyRWtaSWgzaGFEUm41NTN1aU82UUZCZzFo?=
 =?utf-8?B?WjJTTWliUjUzYVRhaW1USUZUaGJ3Y3JlRDdSYmZ5aXllbXNXazFBQisvL0hs?=
 =?utf-8?B?V3NsYWN3Z2dIZFRRODNJdDk4WGxFcmVDT1RjMzhxYm41Rnh0V2g5MkdNVlNJ?=
 =?utf-8?B?SmdWcWNhNTZWTnE4cnFHY2huMmtmdTU1QkMvUEsxcm81dnFPKzFsZngrNEtr?=
 =?utf-8?B?NkQ3U21lK1ZuRktiTytKNW9LdGtCT2hTQkcvVExaTWRHTjJkcm9iTEVpRW45?=
 =?utf-8?B?bWlXTzJEdnU0Q3VHbHh2K3FvcWwyOFNkSGxNQjYrZ1ZudzZxYXNsSFhwcDNy?=
 =?utf-8?B?czBDWDE4Rm0zUFc5bFpGamxjNXgvVkVHTDdheFk0SGdpTmxhdmdTQjdMSkxF?=
 =?utf-8?B?QWlRMktuVmVvcWhlN1Q2S3RDdU1RbTRCNGpSUHY5dEZBUml5Y1dzL29UQTZp?=
 =?utf-8?B?ZnduNHQ0TWE3Z2IyTzBSaWtzcDNNQ1FrbnRKNDBwMGdkTlcrbnpVZ0wzdXRB?=
 =?utf-8?B?Tjc4eVlxZUI5ckpHenJqaUtVNzFSK1RXNi9wK0Z1L2hjdWJGa2NtQlBwL1I0?=
 =?utf-8?B?c1BQNGVrS093NkwyZ0ZacmtxSFR6b2NLaXd2T2M1TFpaR2FKRER0MkxsR25X?=
 =?utf-8?B?S0Q1NTdQSTlTQUU5MWxlZlRPc0szcS84Vm5BS2htV2kvclNBeXpXcG0wZDgv?=
 =?utf-8?B?WjVwa3dqRitob2QzQVhkOEtvUnlGbmhiS2pEdk5UMmxnc0pnK0l0eWNPK21u?=
 =?utf-8?B?OUxBZTV5WUh4OENMVzA5WWVNMGR1RjRYT2h0a1ptRVB2S2ZlZEh0TzhxWjg2?=
 =?utf-8?B?RFloS1NpT2V1Q3UveDNBMUVJQjZTMGp5aFJyNVdYVzJKRDgvY1dhTWRWNU44?=
 =?utf-8?B?QWF5L0ZhWm04U3dNUlkyOXBlNmg2SXNySW1HTndPVmhhUmJBemt0SmVneWhE?=
 =?utf-8?B?WDBseUY1U2diVEZaYnZvNDNLQkJ0VG83dHdnWWRkcVdkdkxLK0k5MXFyaDBQ?=
 =?utf-8?B?WjZjMXpTd2VPcFdPZ3JQVFBGSk5lRStQY3QxaGdzelprbDJBd2VObXl0TW5E?=
 =?utf-8?B?N3MvZ3BaTjBreStNb2M3SW1QQVE3SGlNMVk1TGtOck5RYTY4bEdqSy9NT25Z?=
 =?utf-8?B?ajg0WTJnM3RnbXFJNmtVY2hVUWFpcGNTR3hiYmU4Yko2QkY2VUwyalZmT3Jk?=
 =?utf-8?B?ZjQrLzZheFhoTm90R2FyYTBJck1VYkFOR1g1ZkE3WG1IVVcvYlJaTjJ5clhC?=
 =?utf-8?B?cGM1Y2NmRnNuSDQ2WkNTdEhvZS96NkhTUVdRTUpRZ1Q4N2hKSzRrNlJWQjdX?=
 =?utf-8?B?SVc2MU9manNmOFVobUVNd2IzSU5MUHJxbUd1eWRIeGloM1VZcUNVVHRxMGFh?=
 =?utf-8?B?L1lCSjUvdTlZc3NKZnlvNnZCUzhubFRobloyVVgrK1RQRFhPcjBRUkNLdEZH?=
 =?utf-8?B?bjBTN2p6ZHZUWlA0TktPbGM5Y3VwbG51RmgrcWMwcGgxY3lMM3ZIcE1rNy84?=
 =?utf-8?B?Z0dqZnJsMURlS0NocXpVcFRjUjZFOTRmYkhpc2JPZHFWZGJ4MVlDTEtGSS9z?=
 =?utf-8?B?WWVEa1RCNEFyemxwUkNRRkJuVU1YOHpGendTYUpNRXYvalRFRzJ4Y203aHQv?=
 =?utf-8?B?TkNsTGlvVnZLbFNiWFhqRXZhUkt0Q1plUmxEdk93TitacFVkcHFvenVKSHdF?=
 =?utf-8?B?cG5Yc0lIaW5ON1ZyOVRGcVBVK0VvS0pEa2gwcmplaGFMV3JxaDhuV29xWWw5?=
 =?utf-8?B?Zlgxbmc3TmYwSVdiMGVNb2hSdGpjRU4xMHFnVFlodEVWK0NETXRTRnBiYTRI?=
 =?utf-8?B?R3BSdlYyQk8zQXdHRFRSWXFHWEEzb010VHVwMEgvQndDZm85cUpHU01XWlgx?=
 =?utf-8?B?azk1VGEwU1R4L0dYOEY4K3h2MVkyc28xU2tPdEtSbS96VGc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(52116014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cUtmaGNGWXEvek5IbXJKMHNNbzhaNWpXcUFPZlE0cndwWWd3aHBxbUtHR0xQ?=
 =?utf-8?B?OUF1SnF5VFpuV2k0N2JhQWFJeWIwZy9CamFqUXErVmpGd1o5SzNMOUJ3MG1Q?=
 =?utf-8?B?UmdYVHVZSTJ0UFhFME4vRVQvbWZHbStxN1JPZEVMVXpDTkp5Q1pscWhxSFN1?=
 =?utf-8?B?K2lQMnFBT3NNZkkwTDR3L1NHd3hmYm9aZG9mczlVMy9JZzYyZEk5U0w1aVFw?=
 =?utf-8?B?OWpLTXkwOWo2am9ZNjZEQm9kRmVDRzRqcTRlSkFQbmlRbDdEeFRxblRaL09k?=
 =?utf-8?B?WUcvTDhJSCtqM0tIaFVmU1ZQYktwZjRQRmpoN0kvcCtwclowVjZvNktMK0Z1?=
 =?utf-8?B?VE5JNzZkUFZPSTFoeW9jYjcrWnNJcXVCeVhyR3U2VUcwK2Fic3RXenlUQWg4?=
 =?utf-8?B?RVpoUmlaMlZ2UmNzc0lOeElSTU1XQ2IrZEg3bHBHSUcyOXdDUUtFUFNneEhr?=
 =?utf-8?B?Qy83UytlTUJLUTc0NlFRRDZaaUtzS2dpMFQ0dDBDU0JiS2hoU2p3MmQ3N1kx?=
 =?utf-8?B?VVRlZzVTM0lBSnoyT2d2QzdWU1U3V1dQQ2xka0RBMjNaaDYxaVVBM1FzZVdX?=
 =?utf-8?B?UlpMdk0xcHRicXRwRkR1bWdGK1JrOXRsRXk1TTM3RTFXVnlnN0h2MENwYU1W?=
 =?utf-8?B?TGFvSWFKMG56RE9yWUkwMGtFbGVvMTRIZC9tdUJ5cFZ5UHZOQVBzWUcwY1lm?=
 =?utf-8?B?T25qZmJIUU02VkxTaVJOcW40T3MzUUFtU25pWFJ0RTBpUjBtb0pTL0VZM2dS?=
 =?utf-8?B?ODBwQXdabnhsdXR5MktLRzIxaGRDTXlmMDh5WCtRN0FEU1R2U2VYUzkzb2Rw?=
 =?utf-8?B?alNKcHExQ1o3Q2dscS9DcTY2NnFvMWF1RGRXdHVBNHMyRnRmTndqbzNOSkNl?=
 =?utf-8?B?NTlpZDRwNEV4RVM2eEwrUUJOR0gxSnNtRkpwc0M1bEhadVY4RkVFUkNORHFo?=
 =?utf-8?B?WVREVTZ1NVhtWGNsRU1mbHVOSXI4MllORXE3QkQwQXU0UHM3Z0JxYmIxZXo0?=
 =?utf-8?B?MVhFYnpUNUVXRElUYjJkUUY1djJQWFJPWVBIQjI4ZEd4TFBVWEZDRUQ3Z09L?=
 =?utf-8?B?K0xrZ0tIelVuK0ppdWl3dExRZlpTQ2YrUzE4aGNIaVJWNXF5anpNcTk4VkI4?=
 =?utf-8?B?b2Z5d3VwZ2N4clJGVEFIRXZOMEZmWUt0Um80M0trZmxXRExBVUh0cWpVbTJL?=
 =?utf-8?B?cTRSeGlJY1Q0U2RzcFhTYUpMcElqVkxKbVlWSUl0Mmp2YkljenVMZjBxa3VW?=
 =?utf-8?B?OFlsN1Z2UTRjaTRKdnA5VXRNcnRHOUVUb0tPYmRXWmFHMWc5dXVRS2lESk1E?=
 =?utf-8?B?R2tXTUxEOVZqRlkrbjVPTXNScW5rdXhtZll6bzBlcTMxdkIySWFhblBKcEw4?=
 =?utf-8?B?SkZ5OXFxUUVyVkFTNlcyUnhRN0Jsb3hnTXVLNHh2OWFTZGRrM1d0ekxwVDBY?=
 =?utf-8?B?aDI5akdKTWtpdjZwbHVnZnJNWWlZSjROSEhqUVgzVlVseWJWOTJCYnZqSy9a?=
 =?utf-8?B?Q2tmMGZKVTdyUElEYll3TG1LUnJ4Nkl1WkNpQ0FWQ0xHcEZoTzQvV0liT09G?=
 =?utf-8?B?OTcvT1dBamw3Ujh5Wm1SVkgzaG14eC9kNnBPQllEU0lpTzdCZFo5S3ZUYUU0?=
 =?utf-8?B?QXFVZmI5VzRtY0lUQ3NGbUd5UDA3K0tUOFpNRHR0V2FET054Yk9BVWlML3lx?=
 =?utf-8?B?RzRWVjRiSllFUDh3VFlvU2pnUXFUYUJ6cEVlOEZ4d08wbU1nanpjVG1hejB1?=
 =?utf-8?B?Z3FQbFBMNEc4YXRxaGZLNDc0QXR1djFTQUlZaHFrYlVvUk9KdTVYWEhqa1ZR?=
 =?utf-8?B?bUh4bnNaSzZkOGVvTTVJREtVRFZRdklaZXZjR3ZRem5Cbit1OFpubnBsNXZy?=
 =?utf-8?B?V0tSeURCa3gwM2l6dCtLMy9wM1p6SmRxaVUwNjdzT21zRFYxT3pBVEtNWDRO?=
 =?utf-8?B?dUJUaFkzYWhZVjQ0RXJRUXJUb3IxdFVmT09HN3BGQmFXVEhrWWY0ZEtMTnF4?=
 =?utf-8?B?dTZkSi9pL3pWRWxrbUorajB6SmVEbFE0QXBZb1diWjVGZjk0c3dhaXRqdmVn?=
 =?utf-8?B?cjBQQzVJV21TUGNOVC9XNTQ0U2puSndXcG1UZHZPaS9WcFAvbE1qUlN0dzVK?=
 =?utf-8?Q?WbJABbtSPA5oC+SO7unMSdhLh?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4137a551-25fe-4d65-bef2-08dca6d773d6
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 03:12:27.3279 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Brxt2bZCpd3jLRo3Zcl1GfYVzv1u9FWhabcAdT2G6DOK5knipxOlCG7cearyTE0ajXGxcb9c1VfmxbBlMTP9+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5152
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


在 2024/7/18 11:08, Christoph Hellwig 写道:
> [Some people who received this message don't often get email from hch@infradead.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> On Thu, Jul 18, 2024 at 09:51:39AM +0800, Huan Yang wrote:
>> Yes, actually, if dma-buf want's to copy_file_range from a file, it need
>> change something in vfs_copy_file_range:
> No, it doesn't.  copy_file_range is specifically designed to copy inside
> a single file system as already mentioned.  The generic offload for
OK, got it. Thanks to point this.
> copying between arbitrary FDs is splice and the sendfile convenience
> wrapper around it
>

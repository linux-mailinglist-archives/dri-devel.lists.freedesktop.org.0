Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B819D22B1B
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 08:02:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 915A110E13E;
	Thu, 15 Jan 2026 07:02:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Nl6UN1zq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013019.outbound.protection.outlook.com
 [40.93.201.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5124410E13E
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 07:02:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vmXSQgelwA4mVEz+NdyyIgcyfdzENaACZEVkDco4ATmwaeFFqXQUHjj1ul6qLFnskVZBbcUfS7OLIEaKEHEktVDLV+Ro+l9X87QJ8/yQUFpcfBye4385GDr+H6jkDIeORkq6ElD47eD8CP8mdrvjN6HtFv8dM6Hx61RL/kYwC60a4mBRrU2HYyjOCguasW+hdA9h6Da6N7pairQh8P/Fra5wpAyZ59eotKE32YemUjAaJZ4sxNrYqBW1cUMDIXnyaN++feDWFYaFwsJNbVRhsaXMoasMETM+IxuzZ80neNWZaVco9yzowwJ0bpsjh9PB7QQhfJOEHp7I6JPak12bzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=renm9du4FSxE6Fz31886PP5edb2pTqDhuw4Z3sEXpus=;
 b=gxye+/g6Td6Ht/WS/MDix+kzPfpwZi6XeSquu4AN6fJAnCxQG0lyg56jrlPT3hfR0WaNlqL4z74zcF7+K4AchDYdB+a/6lIGMCj+4JK8GhneTpGwLGdzswUgngUpxZZUjDaHFBfkVjmnXCHkvtDWTij3QAUwbPeTXjcyYD73keYvh08zCFN6xsLr0LB6prF3LbdRiVi3pl4HsrGGfE0XLMj00aktAa//CE3ya7joz4eSX5Utg/yp675YR6xCYuefySmq9YEbQVRM/rCgTduF6oRNNabQ3PsDcrLqwysOVQL8wKgmEErF5TkZX4JVUigUWPkAzXhIP/1xffj0GR7k0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=renm9du4FSxE6Fz31886PP5edb2pTqDhuw4Z3sEXpus=;
 b=Nl6UN1zqjNejsnHpc78BO1RwJaZ8/fh0WbuTuL/eWUTpa550Gc5HKU+pd0QeJe4lb4xkJ/rXme9X63eJiVTGvmr2gxMT2QZq/K48PCjdh1csKJhJ7End6OrkrtZNEOYTn8P58jWL6W7LiZhxsGfA+4A896CiHFTgVf0vrXeD3MZSwPMgBWHyf76nlNA0UsN6PuISjXO53rcIGA2K9KeXfPE1f7Rc66Mz1owbsTUQoyDxkX9BOgDkaUcvqAKiKupRvxNvZQ94p4R5g1RvrIlqKbS+3SbQtD2gqoyC6urUmpjgSaBoFqsxbDs6IGRglyEq1n0r5PMubhK2yb0CZDeenQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by SJ2PR12MB8942.namprd12.prod.outlook.com (2603:10b6:a03:53b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 07:02:49 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::1f16:244a:2a9d:2c93]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::1f16:244a:2a9d:2c93%3]) with mapi id 15.20.9499.002; Thu, 15 Jan 2026
 07:02:49 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Dmitry Osipenko <digetx@gmail.com>,
 Charan Pedumuru <charan.pedumuru@gmail.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 3/4 RESEND] gpu/drm: tegra: dsi: add support for
 Tegra20/Tegra30
Date: Thu, 15 Jan 2026 16:02:46 +0900
Message-ID: <9411928.T7Z3S40VBb@senjougahara>
In-Reply-To: <20251204061703.5579-4-clamor95@gmail.com>
References: <20251204061703.5579-1-clamor95@gmail.com>
 <20251204061703.5579-4-clamor95@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TY4P286CA0059.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:371::6) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|SJ2PR12MB8942:EE_
X-MS-Office365-Filtering-Correlation-Id: c0485e5b-37d9-4ab5-c4fc-08de5404183a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?anRvbGpUcjVlcXEyZVNzc2lXUW52dGNoazZsazJEUlBBVHFxaEF2SkZtc25t?=
 =?utf-8?B?cEhkYVJmckN4TDM2aisvNDk4Zmk4UWRQcmZLdHVVdjdrSTU2Wlg4bGFNbG9s?=
 =?utf-8?B?Y2JnU2RNTVZCMWJKdnhybXE4VTdYNndNS1VJTi9UTEZJYlJpTlVoOUk0Qm5t?=
 =?utf-8?B?Rm14WTNEME9ZZTdpUFgrSE91dXMzVC9HM21CSlJaeklaNHo5eXlJOCtXQ3JJ?=
 =?utf-8?B?SEszdCs4czA2K0QwVStPS1VIZW9uZUM2eXVROXJvTlpubWQ4cExDYWNTOHor?=
 =?utf-8?B?US9tMm9XczNMOWdlVk9uKzdkWCs0c09iLytRVU9hQkNTaGx4NVpQUWs5WUZG?=
 =?utf-8?B?eGxTWDdhcHRROUt4d2ZnQ0FTQ3g4ak5tdXdOYnVrNnZ5WWxMZzFRREQrWTA1?=
 =?utf-8?B?VndDRS92VDBpeDlmTEFoaXYyTWlPbktkNHlYcTBMRDEyREJpdE4zZjVwSFl5?=
 =?utf-8?B?TnF2enU2NkhTL01zcjFhaDZPT2Y3WnB0YzNjR01ZU0hKdU1yYndSUXEvN1Nm?=
 =?utf-8?B?TFhZRGNZVWRFeVdoQWQwQndGeklHVlAxMFQ5OXJkOFh1NmV4YnFMQ1d3eGpv?=
 =?utf-8?B?NzVkOUl2ZXpwOXhlSXZVM0p2Z2k4ZEZwcmlYZWpPbmdFaS9raCthSGxPYytJ?=
 =?utf-8?B?bG1TSk94Rnd6WXBUY2tYOUUrS21hbks4VG00bmw3YnUyM2hTQVFtbXp5azdQ?=
 =?utf-8?B?bDUyYlFXSXZUcnY4VHk5ZjI1cDVia2pSWUZ2SktXWFdYM0d1UWYvVk56Mm1I?=
 =?utf-8?B?TlhFY2o4WnA4V0N2NWhXQ1UzRzI2UUplQjc1Qk54TDg0TlNWU3g4VUd5V1J1?=
 =?utf-8?B?b2RuenI2VlZDTXZLd0xObUlpK08ybmxybG9HbnhKZko4SzRQRGVIcjFNUFVq?=
 =?utf-8?B?NUd1TGh3WFg4dmwwU2lYZW9oZld3dzdUMUN6bTVXTENQRWpOYlhMeUl6WnFG?=
 =?utf-8?B?RFBLL2E1SEl0NklNYnJLLzlnRjltdUpNbXhhYjlsdDBXVEJwU3lvWlFTRnJO?=
 =?utf-8?B?L0JtWHFuaW52YTJpR0pUZm9KemIyRE9HZXRUcGpCcEJWLzA4Sm9UYWNVdGZE?=
 =?utf-8?B?WmcvTmhndUxmUXgwRXowbFdlVk9wa0t5OFUrdHJTaDhybHBrK3RSeDRmY2Ey?=
 =?utf-8?B?dFRQTHZWTXpteTk0ZkJtV2NxZk5Ha09sTWJaSDNrTThhOHhyeUFkeEtRTkNV?=
 =?utf-8?B?cURuVWROR2tRZ0ZkcEp2dmF3MWJZbE5HY2ZkVEZQZi9NMmR1SkVaL1lGTG9F?=
 =?utf-8?B?TEdha1dlVFVxSHFIS2Z0VHdKREQ5aGYwUFY2UmV3Rnc1cDQxWVJJUFFqZlZ4?=
 =?utf-8?B?aFBhUzVDa2h1ZkRrd0JZSmNkelNoQ2VLZUlXUER6WkFMYlk3WmRjUmIrbkVC?=
 =?utf-8?B?Mk90cWNNd3hiL3J6c3Jsc2I3RTBzMDgyWmw4WG9KcFFEdzBoSjNHTjZFVXVM?=
 =?utf-8?B?a1prWEgzeWdHYk85cEUzd2U3YmNOcnR2bDlLSG5OOFZQWTdBVVpkUE1XbjI0?=
 =?utf-8?B?RC9SZXJEMkl6enoxYm1KTW1YWXd3MndRTTh2emkzVVRPeFVKclI0Z0ZGZjUz?=
 =?utf-8?B?S1hsZVJDMUNhS01YazYvc1JHcGU4QVBtYk9ER2Fsb25kRjh5dHJkYUFiZ2Rv?=
 =?utf-8?B?SjFFckp3SXBDUUM1aG0wakJ3TU5tNWw3SXIxaDhmMW9LRmZXQ3ZjQXRVQ2NY?=
 =?utf-8?B?c054K1BCamQzVnJFVkZNZWtGbGZIcHlUMkZrNnpnWHg2VUw0UHhuR2prMTFT?=
 =?utf-8?B?SmQ1Wi9IN3JFZkJiemVDN2lsRnJMRjQ1cFBHcE1mMlhtZVVyRVFkb2FXY2dC?=
 =?utf-8?B?YTdEeDVhRFhxc2FpRzVZU2hoQXI4VWxXQzdiV1E4dE5sR3ZxbFJOdGVmQmtk?=
 =?utf-8?B?Y25IZUZsa0lzWFVTN1MzN0JBcXFRT2VJbm91UFUzRExrK3NNcmppbzUxRHRU?=
 =?utf-8?B?b2psYjNBam51RDdIS2xGM1FlcG9FTG9rTWNYUlIvc2RLVnU3TWdReHVEWm9N?=
 =?utf-8?B?aWFaYlZTTzQ4M0hMWks0M0VnQjU1V1RwYVhpWlgzRmkvT2V2bGVqalhMaVFw?=
 =?utf-8?B?NTNjeFVuaUlJM2tkNXM3Wm9ORWhZSGxoNFBNWEEzbzRXK1JRUkJURFZ1eFls?=
 =?utf-8?B?aDBYMHFTbUtRRk1jMGF0aDNKTFlKTXp1dkR3THZXQVhDSHRobHN6QS9TNTZR?=
 =?utf-8?B?WEE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR12MB9161.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MU1keFMzQ01ZVlcwbXFzUys5UmNMZitkM3VwZHVmWStFZlEyWlYzdlNtMHJr?=
 =?utf-8?B?c3FGUDRlUXNBZ095TmxHRnlaR2wzUlBtdzJVcFpPUUhvQmh0bzhhZG44RFor?=
 =?utf-8?B?RTNpK1JBOHJTbldveXlERTYrZDNSZm9BTnhwa2dnVGRJRHRLcGZ5Lzg5R1Y0?=
 =?utf-8?B?UUMyN0R0Nlk0TkhQNjNSeDBLbjFFUjBxVmMrSU04SXU4MGN5Si9VQmNPb1pC?=
 =?utf-8?B?SXlDN2RNSHFYb0xQNFZub01pUW1pVFFscHZHdU9EK3I3V21Pc2kxbVc1Ykt0?=
 =?utf-8?B?a09vNS9PZHdENVdsYkdPVFM0aGg0QURrQnVOaU5iNXBhNEl6L25oQkYxZzhv?=
 =?utf-8?B?VmZqajJLUThvSmNLRmhibSs5NVdpZWJjVFFSa3BVRUJlQndoZVJKYW9GRjFL?=
 =?utf-8?B?K1RlUUswUlpxS2FaMFZ0ZUZaVFRkVkRwakpaYjdoemtyZTlhdmlnOU9lOHJr?=
 =?utf-8?B?SlFzZmlKNEFkeG8zMTNSZWVtNXd5Z1p3UFNlN0pKd0RyNkJmWXJRaTBpdGxF?=
 =?utf-8?B?RnltV215SFJidk40TmtqMHplZjF1WHZzRHhRSkZ4dzlQdjlPc2poOC94UG5w?=
 =?utf-8?B?VVlHbjMvaC9YUXFVZDV4UWk1UE9zbEFCVXo4V0xPS0k5Y1V2NlZZUnQzbit6?=
 =?utf-8?B?K3V5c3VocVpoTUJmY3dNdzk5bVNJd2gyRkNWcWE5bGx4T0pabm5waEF3cTQr?=
 =?utf-8?B?NCtRWjFvY3lLYTRxV25YckZhMk9oaXlGKzdrQUJCSXhUM25OMHh3cG1hN2ZT?=
 =?utf-8?B?Y29udmhEVTYxaUZGNU9TRTVhb2MvQmo4Y3JhQTRiMDBrUHgvQm5mZFhnNlc5?=
 =?utf-8?B?cHdrRnlLeHhQdXNvOEswN29MUnlGOXVKRXY3dEtIU1RrWFFEYnpTeU9VWFlF?=
 =?utf-8?B?aFllZTdLZmQwNTNsSXZKSXVoamZkbTVOTHNzZmFCdVgxRlFSQklzYW90QXRB?=
 =?utf-8?B?SWh1VHdiVEZBTUs5ZlNpZVA1TUlPdURpaHBzM3ZVOWtwMUdiUjNMaXdCRE4y?=
 =?utf-8?B?RWRZTzVadWhObS8zMzY2eDVJUCs4WjNCNDhUS3N6ZnI1ODVUREhTT2E0dWkr?=
 =?utf-8?B?ZmlDU0VUNmh6N2NPVXp4Rkl4WE5lNnB4NGNuZUcxYldHQWVYOUJnSmhYRUl5?=
 =?utf-8?B?T0FuSFljdGxwbkhiV1Vta24yMDhkVUUwYkhxQ1AxZUNVOUsxMjFHOG9KOVN1?=
 =?utf-8?B?ajJiRnhnZlVPRitXNVdMUUJFWHMzYnBieUhnTlBtdHJLTHd5VkNZZm9ZTVJv?=
 =?utf-8?B?V2F1REpYbmF6Rkk2K3NCRU13RUo3bnUwcTlXam9NR0pTNUVIckk5MTdwTnhh?=
 =?utf-8?B?VzhGSGVIdmtzaDVNM1FReXdIaG1jdGVSaHBudFIyTDFoai9xWE02aTZDcHNI?=
 =?utf-8?B?QVJMV3NLZGhpNUR0ZjBQNXRrZy9sRjltL0NDWk5WWHlyemY5SFdXc1NySW1t?=
 =?utf-8?B?SG9PY1FXUjNkNlV1NnIyM1lwTS93V3FKREZKakhrWDBrWkZOSVFKaVQvVGhi?=
 =?utf-8?B?alVsejlacEk2bnNmcnk3RkUwalRRVUFqUDV6Q3FxbDAzb0Z5OXpzQVk0ZlJF?=
 =?utf-8?B?Q1hVL0VJNHVVNlhVRkZEdzd4aEczeERTbHk4clVmbnFKaWhtSVJWTjExem85?=
 =?utf-8?B?RHRkb0VzYko0RXJwcG8xWDRsNzRQUzd5UTIrU3JwZlZEVXczM1RpMGNOeDdt?=
 =?utf-8?B?elZQZUxmTTJFbFIrM3N6RndCQWwvak91U1hPWGpuVWhibUVvaDNRb0NMSk9R?=
 =?utf-8?B?V3JpZE1tTEp6c1htYkJSOWEraXVBUlpweWhPaXJaTkpadkYrc29iT3U4Z2dD?=
 =?utf-8?B?OE5qQnlHK1ZNMUJvSDlqUExZZnhLWEw0Wm5WelIrQjVjUC94NURCZTkzL1Er?=
 =?utf-8?B?N1ZJTk8wdzBaeDIrUGJ0WkRNVkI4M0xxQUVCQzVkbkJyS2FlMmt3c0pXS2Nq?=
 =?utf-8?B?UHRWcGpVN3dTNnJEbnhaSk5lRDdzYlZBellMcENLT0dWVG5LU1ROZ2YwZmpX?=
 =?utf-8?B?ZW9UU0ZpbnNEWUIwa3kya3YrVDZ5aGpYZ0xYNm5YY3RSZFlWd3BYZXEyNWMx?=
 =?utf-8?B?NkpWL1dWcU9nVVNVUHpQeEFpcWtscTg2TzJKR3ZOMy8vMmhFTXFwTWF6dE9o?=
 =?utf-8?B?ZURhamZ3aGJ3RWlXWkNCYVpUZG9Bbjhvcm40aG1uY2pON0xIaFdzdFpaOEg0?=
 =?utf-8?B?dktLYXo4clZaYkVxd2VNL3hEZ3NNenJFOWFMR094V0JBUnVVajRLM0NFWjVw?=
 =?utf-8?B?R24vWXFBL0N1SmFwK2Erdlc2bjNnYy9DZXFDbkhOa3ZTYnlFN3ZuQThFY0Ft?=
 =?utf-8?B?VWwzaHB5TjZpdiswSCtiellqRXltdmsraHl2SWU4RS9yS3VIeTIyUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0485e5b-37d9-4ab5-c4fc-08de5404183a
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 07:02:49.7602 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ckhtOTLT5Q7PGlV4QOWG+0hq7kmFB2PyuHuBzUl2qgSJD4bOf4iZMGQkWors4yJyoBBhmjkqjrRu65MKcIbndQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8942
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

On Thursday, December 4, 2025 3:17=E2=80=AFPM Svyatoslav Ryhel wrote:
> Tegra20 and Tegra30 are fully compatible with existing tegra DSI driver
> apart from clock configuration and PAD calibration which are addressed by
> this patch.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/gpu/drm/tegra/drm.c |  2 +
>  drivers/gpu/drm/tegra/dsi.c | 88 ++++++++++++++++++++++++-------------
>  drivers/gpu/drm/tegra/dsi.h | 15 +++++++
>  3 files changed, 74 insertions(+), 31 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
> index 4596073fe28f..5d64cd57e764 100644
> --- a/drivers/gpu/drm/tegra/drm.c
> +++ b/drivers/gpu/drm/tegra/drm.c
> @@ -1359,10 +1359,12 @@ static SIMPLE_DEV_PM_OPS(host1x_drm_pm_ops, host1=
x_drm_suspend,
> =20
>  static const struct of_device_id host1x_drm_subdevs[] =3D {
>  	{ .compatible =3D "nvidia,tegra20-dc", },
> +	{ .compatible =3D "nvidia,tegra20-dsi", },
>  	{ .compatible =3D "nvidia,tegra20-hdmi", },
>  	{ .compatible =3D "nvidia,tegra20-gr2d", },
>  	{ .compatible =3D "nvidia,tegra20-gr3d", },
>  	{ .compatible =3D "nvidia,tegra30-dc", },
> +	{ .compatible =3D "nvidia,tegra30-dsi", },
>  	{ .compatible =3D "nvidia,tegra30-hdmi", },
>  	{ .compatible =3D "nvidia,tegra30-gr2d", },
>  	{ .compatible =3D "nvidia,tegra30-gr3d", },
> diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
> index 8e80c7efe8b4..d079aa7d2a85 100644
> --- a/drivers/gpu/drm/tegra/dsi.c
> +++ b/drivers/gpu/drm/tegra/dsi.c
> @@ -53,6 +53,10 @@ to_dsi_state(struct drm_connector_state *state)
>  	return container_of(state, struct tegra_dsi_state, base);
>  }
> =20
> +struct tegra_dsi_config {
> +	u32 dsi_version;

Rather than a dsi_version field, we should have something that describes th=
e difference. e.g. 'bool has_multiple_pad_controls' being true for the "V1"=
 hardware.

> +};
> +
>  struct tegra_dsi {
>  	struct host1x_client client;
>  	struct tegra_output output;
> @@ -82,6 +86,8 @@ struct tegra_dsi {
>  	/* for ganged-mode support */
>  	struct tegra_dsi *master;
>  	struct tegra_dsi *slave;
> +
> +	const struct tegra_dsi_config *config;
>  };
> =20
>  static inline struct tegra_dsi *
> @@ -663,39 +669,46 @@ static int tegra_dsi_pad_enable(struct tegra_dsi *d=
si)
>  {
>  	u32 value;
> =20
> -	value =3D DSI_PAD_CONTROL_VS1_PULLDN(0) | DSI_PAD_CONTROL_VS1_PDIO(0);
> -	tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_0);
> +	if (dsi->config->dsi_version =3D=3D TEGRA_DSI_V1) {
> +		/*
> +		 * XXX Is this still needed? The module reset is deasserted right
> +		 * before this function is called.
> +		 */
> +		tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_0);
> +		tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_1);
> +		tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_2);
> +		tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_3);
> +		tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_4);
> +
> +		value =3D DSI_PAD_CONTROL_VS1_PULLDN(0) | DSI_PAD_CONTROL_VS1_PDIO(0);
> +		tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_0);
> +
> +		value =3D DSI_PAD_SLEW_UP(0x7) | DSI_PAD_SLEW_DN(0x7) |
> +			DSI_PAD_LP_UP(0x1) | DSI_PAD_LP_DN(0x1) |
> +			DSI_PAD_OUT_CLK(0x0);
> +		tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_2);
> +
> +		value =3D DSI_PAD_PREEMP_PD_CLK(0x3) | DSI_PAD_PREEMP_PU_CLK(0x3) |
> +			DSI_PAD_PREEMP_PD(0x03) | DSI_PAD_PREEMP_PU(0x3);
> +		tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_3);
> +	} else {
> +		value =3D DSI_PAD_CONTROL_LPUPADJ(0x1) | DSI_PAD_CONTROL_LPDNADJ(0x1) =
|
> +			DSI_PAD_CONTROL_PREEMP_EN(0x1) | DSI_PAD_CONTROL_SLEWDNADJ(0x6) |
> +			DSI_PAD_CONTROL_SLEWUPADJ(0x6) | DSI_PAD_CONTROL_PDIO(0) |
> +			DSI_PAD_CONTROL_PDIO_CLK(0) | DSI_PAD_CONTROL_PULLDN_ENAB(0);
> +		tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_0);
> +	}
> =20
>  	return 0;
>  }
> =20
>  static int tegra_dsi_pad_calibrate(struct tegra_dsi *dsi)
>  {
> -	u32 value;
>  	int err;
> =20
> -	/*
> -	 * XXX Is this still needed? The module reset is deasserted right
> -	 * before this function is called.
> -	 */
> -	tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_0);
> -	tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_1);
> -	tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_2);
> -	tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_3);
> -	tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_4);
> -
>  	/* start calibration */
>  	tegra_dsi_pad_enable(dsi);
> =20
> -	value =3D DSI_PAD_SLEW_UP(0x7) | DSI_PAD_SLEW_DN(0x7) |
> -		DSI_PAD_LP_UP(0x1) | DSI_PAD_LP_DN(0x1) |
> -		DSI_PAD_OUT_CLK(0x0);
> -	tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_2);
> -
> -	value =3D DSI_PAD_PREEMP_PD_CLK(0x3) | DSI_PAD_PREEMP_PU_CLK(0x3) |
> -		DSI_PAD_PREEMP_PD(0x03) | DSI_PAD_PREEMP_PU(0x3);
> -	tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_3);
> -
>  	err =3D tegra_mipi_start_calibration(dsi->mipi);
>  	if (err < 0)
>  		return err;
> @@ -1577,6 +1590,7 @@ static int tegra_dsi_probe(struct platform_device *=
pdev)
>  	if (!dsi)
>  		return -ENOMEM;
> =20
> +	dsi->config =3D of_device_get_match_data(&pdev->dev);
>  	dsi->output.dev =3D dsi->dev =3D &pdev->dev;
>  	dsi->video_fifo_depth =3D 1920;
>  	dsi->host_fifo_depth =3D 64;
> @@ -1615,7 +1629,7 @@ static int tegra_dsi_probe(struct platform_device *=
pdev)
>  		goto remove;
>  	}
> =20
> -	dsi->clk_lp =3D devm_clk_get(&pdev->dev, "lp");
> +	dsi->clk_lp =3D devm_clk_get_optional(&pdev->dev, "lp");
>  	if (IS_ERR(dsi->clk_lp)) {
>  		err =3D dev_err_probe(&pdev->dev, PTR_ERR(dsi->clk_lp),
>  				    "cannot get low-power clock\n");
> @@ -1636,10 +1650,12 @@ static int tegra_dsi_probe(struct platform_device=
 *pdev)
>  		goto remove;
>  	}
> =20
> -	err =3D tegra_dsi_setup_clocks(dsi);

> -	if (err < 0) {
> -		dev_err(&pdev->dev, "cannot setup clocks\n");
> -		goto remove;
> +	if (dsi->config->dsi_version =3D=3D TEGRA_DSI_V1) {

And 'has_mux_parent_clk', perhaps? Not a very good name, if you come up wit=
h something better feel free to use it.

I checked, and looks like Tegra30 in fact allows DSIA/DSIB to be muxed to e=
ither PLL_D or PLL_D2, it is just not modelled in the clock driver. The sam=
e applies to all of Tegra114, 124, and 210, but only Tegra114 has it presen=
tly modelled as a mux whereas 124 and 210 have a gate. The TRMs for 124 and=
 210 specify that only PLL_D can be used in the mux bit documentation so th=
e bit is probably dysfunctional on those chips.

The correct solution, hence, I think is to have that config field, and it b=
e false for Tegra20, 124, and 210; and true for Tegra30, and 114. Then impl=
ement the mux clock in the Tegra30 clock driver.

However, I would settle for setting it to false for both Tegra20 and Tegra3=
0 and leaving a comment next to the Tegra30 entry describing the situation =
(the mux clock is not currently modelled).

Cheers,
Mikko

> +		err =3D tegra_dsi_setup_clocks(dsi);
> +		if (err < 0) {
> +			dev_err(&pdev->dev, "cannot setup clocks\n");
> +			goto remove;
> +		}
>  	}
> =20
>  	dsi->regs =3D devm_platform_ioremap_resource(pdev, 0);
> @@ -1703,11 +1719,21 @@ static void tegra_dsi_remove(struct platform_devi=
ce *pdev)
>  	tegra_mipi_free(dsi->mipi);
>  }
> =20
> +static const struct tegra_dsi_config tegra20_dsi_config =3D {
> +	.dsi_version =3D TEGRA_DSI_V0,
> +};
> +
> +static const struct tegra_dsi_config tegra114_dsi_config =3D {
> +	.dsi_version =3D TEGRA_DSI_V1,
> +};
> +
>  static const struct of_device_id tegra_dsi_of_match[] =3D {
> -	{ .compatible =3D "nvidia,tegra210-dsi", },
> -	{ .compatible =3D "nvidia,tegra132-dsi", },
> -	{ .compatible =3D "nvidia,tegra124-dsi", },
> -	{ .compatible =3D "nvidia,tegra114-dsi", },
> +	{ .compatible =3D "nvidia,tegra210-dsi", .data =3D &tegra114_dsi_config=
 },
> +	{ .compatible =3D "nvidia,tegra132-dsi", .data =3D &tegra114_dsi_config=
 },
> +	{ .compatible =3D "nvidia,tegra124-dsi", .data =3D &tegra114_dsi_config=
 },
> +	{ .compatible =3D "nvidia,tegra114-dsi", .data =3D &tegra114_dsi_config=
 },
> +	{ .compatible =3D "nvidia,tegra30-dsi", .data =3D &tegra20_dsi_config }=
,
> +	{ .compatible =3D "nvidia,tegra20-dsi", .data =3D &tegra20_dsi_config }=
,
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(of, tegra_dsi_of_match);
> diff --git a/drivers/gpu/drm/tegra/dsi.h b/drivers/gpu/drm/tegra/dsi.h
> index f39594e65e97..5049ec7813c7 100644
> --- a/drivers/gpu/drm/tegra/dsi.h
> +++ b/drivers/gpu/drm/tegra/dsi.h
> @@ -95,6 +95,16 @@
>  #define DSI_TALLY_LRX(x)		(((x) & 0xff) <<  8)
>  #define DSI_TALLY_HTX(x)		(((x) & 0xff) <<  0)
>  #define DSI_PAD_CONTROL_0		0x4b
> +/* DSI V0 */
> +#define DSI_PAD_CONTROL_PULLDN_ENAB(x)	(((x) & 0x1) << 28)
> +#define DSI_PAD_CONTROL_SLEWUPADJ(x)	(((x) & 0x7) << 24)
> +#define DSI_PAD_CONTROL_SLEWDNADJ(x)	(((x) & 0x7) << 20)
> +#define DSI_PAD_CONTROL_PREEMP_EN(x)	(((x) & 0x1) << 19)
> +#define DSI_PAD_CONTROL_PDIO_CLK(x)	(((x) & 0x1) << 18)
> +#define DSI_PAD_CONTROL_PDIO(x)		(((x) & 0x3) << 16)
> +#define DSI_PAD_CONTROL_LPUPADJ(x)	(((x) & 0x3) << 14)
> +#define DSI_PAD_CONTROL_LPDNADJ(x)	(((x) & 0x3) << 12)
> +/* DSI V1 */
>  #define DSI_PAD_CONTROL_VS1_PDIO(x)	(((x) & 0xf) <<  0)
>  #define DSI_PAD_CONTROL_VS1_PDIO_CLK	(1 <<  8)
>  #define DSI_PAD_CONTROL_VS1_PULLDN(x)	(((x) & 0xf) << 16)
> @@ -140,4 +150,9 @@ enum tegra_dsi_format {
>  	TEGRA_DSI_FORMAT_24P,
>  };
> =20
> +enum tegra_dsi_version {
> +	TEGRA_DSI_V0,
> +	TEGRA_DSI_V1,
> +};
> +
>  #endif
>=20





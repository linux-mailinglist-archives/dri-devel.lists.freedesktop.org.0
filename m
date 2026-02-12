Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +FVlKdmOjWn94QAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 09:27:05 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 237D112B4B9
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 09:27:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7814410E6FE;
	Thu, 12 Feb 2026 08:27:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="HDFrO2de";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010057.outbound.protection.outlook.com
 [40.93.198.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E11010E708;
 Thu, 12 Feb 2026 08:27:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nnhLDy+uLt4TKtwXEKnyrma2KImPwY52KB7bPdv7H88xEzo7UxfvTOVsezKT0GmgJrT3nIbk16/6eVfTO15dQGBhaeVsp5lGcK6AClQpZcoNIeb9sjWajwusGnF1CEdMaGa6YtdoLwXVqteeKOvJSTuXD5jj4gpIqseNCtpLFIxjjNkfG1GlkxDBCefeO3qTXp4o4se2yjqbMC8Yad6FYg5zu+H1rquQiWCfNHaiQFOjo0Kd6bKPdsH/cQ31v7ZNqWUfDBTVl9A0F3lM7i4eC1B9faeHaLbK2fDq2plIAx9vrCBwNb2xDjwm1uoN52MoKl1BTW3BTG7xkjYv8DDKeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JHQMpsxhpG4zZ5K1juiLPThEilWLBx9ikfWZ0H2dJ40=;
 b=YJHwfRpUxn4Rb9yFw0ugqdGKKXHngAW6g69q/h4F4ja95jeT1AmOyBo0supbBkXjcaVFrmuyGVk11izO9jf40vDOjLTaujKHM/jOR4gMfqDpfxD75TTfpyOHFEIF+NouWYKRSvXB5DnY3UzX2rd3HXDiIzWTQq6Akh1casuURkI/k82HLSag+hGElY7inMzFLADdXQwDD5oGu7nndaR5Yyf0bKVuL9LAKqaimEPB57zQAhcqguXaI63lHZTB3oc1+X0gW3OANRYFhxFagQGJV0Bg1c0r+Qy8V7tz3hyU3Ij2pnp3ZFHPYcmfvytKBre9RBkH0V2ZzD5KoFgHIIGXVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JHQMpsxhpG4zZ5K1juiLPThEilWLBx9ikfWZ0H2dJ40=;
 b=HDFrO2dehH008vM0xVsfh42NLHdTVZeGNkDifTzz7otX6EgDlEIzJtQkHGJlQPQHvGET54RPdhwDNDeKicNTG+K+0wAb8zLgU+K3jvO1Ka52SmXZ0bUfNxlUsfiB1Vz7Fo0In4LxmZ47pwGiXaYsWW0PKDcg3M3ffDHfNvrulEmIVjE+01KXXyM3pjyHHq39ZDNNFoKMZF6hwXIlpB1LixV+BCJcr3sdZKvRdYv7rGEtoixfZUh3w7wJJR/Z1WTEOZC361B9r2SRHjjXeQJlKmU66i3bv492kFjQQRoKq8SpnZMgdaBpf9nLhS3pSmfptPkfO7IxRARMQr75Zi2tXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH0PR12MB8800.namprd12.prod.outlook.com (2603:10b6:510:26f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.20; Thu, 12 Feb
 2026 08:26:59 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%3]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 08:26:59 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 12 Feb 2026 17:26:26 +0900
Subject: [PATCH v9 9/9] gpu: nova-core: use the Generic Bootloader to boot
 FWSEC on Turing
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260212-turing_prep-v9-9-238520ad8799@nvidia.com>
References: <20260212-turing_prep-v9-0-238520ad8799@nvidia.com>
In-Reply-To: <20260212-turing_prep-v9-0-238520ad8799@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYXPR01CA0047.jpnprd01.prod.outlook.com
 (2603:1096:403:a::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH0PR12MB8800:EE_
X-MS-Office365-Filtering-Correlation-Id: ec235c53-1bae-489e-c384-08de6a107d80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|10070799003|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MzhtSTdHdXlxTjZ1OVljUmMzRXhRblpOL2d5eHFUeDNxK1JHbTM5cHB5M1hm?=
 =?utf-8?B?eXRNZXpVNE5KY0NQdFB6UWZJWi9HaHJ5ZzFKZnc2aEFQZllZTENQdWRqV3pM?=
 =?utf-8?B?dllJTy9XQTFDbmpDdjRzUk9KTCs0SHR6RndZOGliYWxRSU5iMHZjV2dLSmIz?=
 =?utf-8?B?VEI4TUJsWVMyTXhXTjVlY3ZNcHUwaFE2Q0RIVTZZWlJOTmRJYUR6clJxUy82?=
 =?utf-8?B?ZDNsbG9MMGNOdzNYOXJOT292YlBFWFhQV3ptTkJPSjFsVEJvdjg0dmZDcTFz?=
 =?utf-8?B?Tzh2Q2lYTlRaK2FQTkhuc0lhbGk1QWtSL20wd0tacmlFQjM3cVFkbjFIOVJs?=
 =?utf-8?B?M29Bd2JUOEoyM2RnejlvWUtBMVo2QUx2cG52UHJSSEF4YWJXdUhEK3lyRm5n?=
 =?utf-8?B?TE5sb2NOMUFpYUJiOCsvV3ZiTEpuRGZESDJ6Z0FLSGNJeVhDYXI3bjVxdE41?=
 =?utf-8?B?S3VUUUs3M2dCaFpobXhsNjVpWkhsN3dKQ29lV1F5ek9QZG1tNXRPaHI1ZVJi?=
 =?utf-8?B?cWI1c1p5Z3RFL2twYUdWb0puYlIxOGxQQ1FFUlNDMVpGVXZMalNmdjZkMGVj?=
 =?utf-8?B?Q1k3VW9Ha3c5alg2bE9LT3V5WHdEWXlUSEsvSVVlRzA2S1E3NDZlLzdWWElv?=
 =?utf-8?B?TGZNNE9uNzJmNTVPemFWc2kyL1NuZ2x2bDRaVlp1ZXhXaTZ2VHM2V251REMw?=
 =?utf-8?B?QkNnWXI3M3M3aE5hUi9OYnUrNFlISVBGbmx4SHBJL3E3LzgzdlRyNDV1UTR2?=
 =?utf-8?B?WEVnQ1kybjN2eUJ6YkZzNGZ2RlVJN2FRckYrUUVpOVAwOFpYTjRBc3cxR0Q4?=
 =?utf-8?B?ZDM1Z1paS2xDb2FSb1c0S280MGdNYlV0SjlaOENJQXFRVEZUWEpnbnkxVzVH?=
 =?utf-8?B?N20rU3phTU9VcDVULzEyKzhvbDdKam5MQVMwL3ljM3lXb3krK0RPVytwYzRE?=
 =?utf-8?B?K3J4Snl1SGR6L0lIdlU1QWJkMkpNRVZOVjBGY3o0TC9xbU04aEpoYUQrcUZw?=
 =?utf-8?B?WXUyT1U1ZmcwYm01cGZXTVcrZXFwV3VXQUVqTlNOQ1dBTDcya09nUm5COWNp?=
 =?utf-8?B?bjBVWjg5SGZkQmRjeGJRZ2V4RW9rV3J0ektJdkNwOUZmcFU2THU1aFYrRkhw?=
 =?utf-8?B?enlLWUVnR0hRcFo0VXFHNjQ5cVlDZ3QvOTZrdnlVU0dCaXVqbkowZy93eFAw?=
 =?utf-8?B?R0EyTWF6OHZ6RmRhQ1dLZkFCcUxEN0NpbGQzZzJNQWZnczArRnppRDlqdHRi?=
 =?utf-8?B?dllaRlQvZFVPcVRNYlkzcnBlUGZJRE5qVjJFWmIrL2lCSTIzTjllUUlSTE9p?=
 =?utf-8?B?Q3ZpL21udEZKZkN1bUluVUhta1B4bU9mV2pSaG9GQVBrYlBJSUdUQzFKL1dE?=
 =?utf-8?B?elRnM2tRTmt5S0gwQXBBQWlCY2Y0ejNjanVwUWZxdjQ5VVdETTZLUWM2Ym5W?=
 =?utf-8?B?SVprelJ0bUY5NjR1NklhVjNTdVhaRjIxa0lRL0dXTnR4aE9SbGZQZ3loM3pX?=
 =?utf-8?B?cncxZGRSSHg0VURqNXNyM3ZMSHBJcjNaTkRwVzhXSEVSZFI3MWxhWllEeW1I?=
 =?utf-8?B?TmZOQVgvZmxSSDg5NEpleXo5UUdZdXEyRkZzV1A0cUZSM2hnN29uVTk2d2Fy?=
 =?utf-8?B?cFVqUHRjbmZxdDNxKzY2eW0ydVRYMks4MzErOGIvVDZMUEtFTUxTTFRNeFRR?=
 =?utf-8?B?Vzh5bXl4SWNWbzdjMWsxQkFXVnFFTnF2SXpsNHVYeldRdkFIeWNkc2ovb1U1?=
 =?utf-8?B?T2VyQXpjVDN6SzBCR0ptZ1AyZW9FbjR0eEEvY3IvNTR0Y0ZTL2djWUF3QzJm?=
 =?utf-8?B?ZHoveUhxclNneURLWGVvb3ZPMVpmMm55Rlh0T2lMT3NnWk8yVnZTWXdDSUhn?=
 =?utf-8?B?a08wcCtpZTBrODU0bTdCa0piZkI2amtkV2hVcWJXTG1pckVxZ2NGTmpwdVVp?=
 =?utf-8?B?WFlZTFVoWG5hM0pzZitTVGVIVHVqWWlLL1JGOW13MGF0STI1SElocldXRHBp?=
 =?utf-8?B?ejlKb1NtR3N6Wm5RUG4rakVVWFlpellpaVdCSEtOdFU2WU5VMWowUGVud1Ix?=
 =?utf-8?B?TkRXRVF5bU0vQjJxUFlXV2Y3cnRFcVdDT1M4YThWdzFEek9KQUY4aFcwWUto?=
 =?utf-8?Q?C+Pw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eXd1YUQ5ZlNSS05tc3pSbUg3dWg5TlZtSElqdGVLQ1F6SzRQSVpCbmRpSzBC?=
 =?utf-8?B?VGNDbG9wS3VGcEhyZW0wSyswM1dxWGRJUUlsVUZLU3R5dkhIeGZyRG9xTEY5?=
 =?utf-8?B?UGUzZUNiRTFIWk0zZThVMit2THhCeXdISWg4OUtvUEtpYWZDRzk4V0ltb1k4?=
 =?utf-8?B?dDdzQTFmTGIvTGRSd0NLOC9vSXJ0NHNLNURnYVVMZXFMcjEzeU04WmdDRTh0?=
 =?utf-8?B?Y2F1M1ZUYzBZRjdESFVjcU5DeG5yT1R2TE1CQXVENXhqWVRJUXU2K3BPOWhK?=
 =?utf-8?B?NmJLcGFFOGg1djRJZmRqN3NHQldiY3hvcnhJays0d01VTXVnMmZra213VHdt?=
 =?utf-8?B?eXV6dnordUVHSnRBWjFYV3JsVEU4aWt6WmJNamhTQWZmOFVxaGhkRHNXeGVR?=
 =?utf-8?B?VU1HL1B4c3pvYnR2SytDVHdiMlVTTm1YRTZqQjluejZCWDV0TVBCdWtJYW51?=
 =?utf-8?B?YnVhdzdFai9UR08rZHpYek8wRmpyZ2NtbDVMZFo2d0tpZG52emx2RTdqeEgx?=
 =?utf-8?B?Ym1mYjdvM3hOaFhKNG44Sm1jNjlTVkJhbkNpbW9SK1NiZGhVMlVBdFNSeS9o?=
 =?utf-8?B?UVNiRlRCQStZaXBqSWc1RmQ2c05nSmdvNDgyZmRtMXVvWWE2U2tKV0o0NTNh?=
 =?utf-8?B?cFIvQ2dsU3JUeE9CYmdTTFRINFlSclVkUG9NV2RDZU9ERC82SmJGNnN1Z0ly?=
 =?utf-8?B?bGVxMUhkdkR2QnRLTEVvbnZLQjNqMysxQVF1aXBvZ00wUzBsMC9ubzBhbGIv?=
 =?utf-8?B?YU1sc3hhemc2V2doN0FuTEhnTHdhS0N1RC9SalhST2dCR0xtWnlyVzhDVzh5?=
 =?utf-8?B?QmZadE41TG8yUU96bGQ4UVVNU3BQYzlqU2Q3NUQ5ejdLUTlWZGVIcU9kL2ZZ?=
 =?utf-8?B?Tm1kaE1DbWNTNm9lcnErZG42ZkthbTFjTGROV2lzaXZmNHZUM3Zxdlo2YjRF?=
 =?utf-8?B?S29sbFQyTU1YYzBFOTlqL21Nck1iZUt6Y0NDYkdRaTRibFROVkFqWkRqdHBj?=
 =?utf-8?B?SEpuV05MT3doaXMxbm9zTE52NEFiTDNUZG9YdExOOXRpUEpJMGdTVStYZ2xW?=
 =?utf-8?B?VVRSSlVGMlZzbFhHUHNSajU4cW5TTTc5dFE4MjJEQUZHTEIreUpwZStPY3JO?=
 =?utf-8?B?ekdrZG5RZzhYUmtqTXM0NGt6bXhJVDZ2OXZjQlFtc3hIVzhuSzBhTHg5RHNw?=
 =?utf-8?B?a2hHLzlpZHFJeXNDek9SaFpNUDZodHNmazhsZDk4dllDRVJsWXZmR0xTaERs?=
 =?utf-8?B?ZmMweWdhV0FPc21ET1gvcDZBY3dIYmpTU1AwT3BHSzkyT3BJaFE3UVVTakRD?=
 =?utf-8?B?cXk2T29NOVNZNlFKSGdzRnUyNW9WVExPYXU0bE9RV0hPcTFiYVVvaVFSaVhs?=
 =?utf-8?B?bjFWQ0IrMmNWaklYbEhWY1duYXIySWpXdVhFaVhZMkVYeXc1VWpIK0pZVFhL?=
 =?utf-8?B?dzFEaXdORCtYSVFCQUswMmdBTzU3MXBNaE1hbXFzc1ZwYXJUT0ZlT2hxT0ti?=
 =?utf-8?B?RFhOanNDVDZoZkJBVlA0WmVROVBQc0FZdlNZZjZIbzdrU3BRQ0YzMEtXTDBQ?=
 =?utf-8?B?cWZTeUFqMHl2N3h1a3MrNUxGUEpZaHFXWGhrWEdhSE1lS2NqTHhzMDN3WHZo?=
 =?utf-8?B?MEhTR3J6aEUvODhoaE1weTlOYkxZQkRWNDVjRlN2YkorZXZmd2h1S2lMaVFB?=
 =?utf-8?B?NTJQUjM4S2xaUWpkdVUweHRwa2ZqZkNhT1pETk94bEtZcW5iay9Yb2gvTXAr?=
 =?utf-8?B?MS9CMjZadXJJYXhVdHZuL1FRR3FHQ0ZWSjF5c2ErU2hVeExPeXNPZ2pQVGlS?=
 =?utf-8?B?aG5vT2U1VGlSV2JpbTFNS0xVSUY4ZGhpcEtoYXl1VUFRMXVWNGdDaGFMNGJo?=
 =?utf-8?B?dEswdUpMcmFFcWZhMkFJMkVPS3RwNHcxejgrNWk4b2NWS1hZV3FNSmlaTzA3?=
 =?utf-8?B?VXBXQmhhTnBqZmRzTHdmbVhGZzNob0RTOWQyM2VSRXU5NVo1NnpDYm94VnFh?=
 =?utf-8?B?RDd6aVVCMmNUTEM4WmxpeGthaklMNCtNNllLeitydHNlNXhMamZnSW1LTVR4?=
 =?utf-8?B?RXNLdFgycmRLeGhsdGd6cU1yeXlvWEFiU1BQUmthQVlwWFZmaWJ6VytHZTZC?=
 =?utf-8?B?c2RNNUNsak1DRHcyRjlkaVpGa0s5czRpbytJZTcyYW1SRFVYNS9jY1Fhc0FP?=
 =?utf-8?B?L3MwK0RxUmNIMDlLajMwRE9zT1pOVHZvdVd0eXFHYVNGMW8vSUUxNTNUR204?=
 =?utf-8?B?ZGRJazk1MjJIb0l3ZG5ROENqdENzcElaTHk5OXc3Wm11T2VKOFhOZTFqMWtW?=
 =?utf-8?B?WnFRY294NTZ1OGwzSmJ4TVNZVFNwZWM5MElDY3VyQWMwc3BZVEk1SWVZbUR0?=
 =?utf-8?Q?YmAL7+j6qAypsjAOIYozhYIjyDlbWES+Xz7Hv5Tk5zrYh?=
X-MS-Exchange-AntiSpam-MessageData-1: GpVxc1A4WcxREQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec235c53-1bae-489e-c384-08de6a107d80
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 08:26:59.2000 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ve3dU9LP5m0YEzRB9Xm0Q/62P2PnMGsmyF7R4VV9LfXb2rzKqcuAYWnBP0mXItojUiQCTCP18zTni/myBSqPcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8800
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,nvidia.com,google.com,gmail.com,ffwll.ch];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,Nvidia.com:dkim];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_TLS_LAST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[Nvidia.com:+]
X-Rspamd-Queue-Id: 237D112B4B9
X-Rspamd-Action: no action

From: Timur Tabi <ttabi@nvidia.com>

On Turing and GA100, a new firmware image called the Generic Bootloader
(gen_bootloader) must be used to load FWSEC into Falcon memory.  The
driver loads the generic bootloader into Falcon IMEM, passes a
descriptor that points to FWSEC using DMEM, and then boots the generic
bootloader.  The bootloader will then load FWSEC into IMEM and boot it.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/firmware/fwsec.rs            |   6 +
 drivers/gpu/nova-core/firmware/fwsec/bootloader.rs | 276 +++++++++++++++++++++
 drivers/gpu/nova-core/gsp/boot.rs                  |  15 +-
 3 files changed, 294 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
index ebea7fed43ba..f4159d7a9d0e 100644
--- a/drivers/gpu/nova-core/firmware/fwsec.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec.rs
@@ -10,6 +10,8 @@
 //! - The command to be run, as this firmware can perform several tasks ;
 //! - The ucode signature, so the GSP falcon can run FWSEC in HS mode.
 
+pub(crate) mod bootloader;
+
 use core::{
     marker::PhantomData,
     ops::Deref, //
@@ -408,6 +410,10 @@ pub(crate) fn new(
     }
 
     /// Loads the FWSEC firmware into `falcon` and execute it.
+    ///
+    /// This must only be called on chipsets that do not need the FWSEC bootloader (i.e., where
+    /// [`Chipset::needs_fwsec_bootloader()`](crate::gpu::Chipset::needs_fwsec_bootloader) returns
+    /// `false`). On chipsets that do, use [`bootloader::FwsecFirmwareWithBl`] instead.
     pub(crate) fn run(
         &self,
         dev: &Device<device::Bound>,
diff --git a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
new file mode 100644
index 000000000000..1cfe72e27479
--- /dev/null
+++ b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
@@ -0,0 +1,276 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Bootloader support for the FWSEC firmware.
+//!
+//! On Turing, the FWSEC firmware is not loaded directly, but is instead loaded through a small
+//! bootloader program that performs the required DMA operations. This bootloader itself needs to
+//! be loaded using PIO.
+
+use kernel::{
+    alloc::KVec,
+    device::{
+        self,
+        Device, //
+    },
+    prelude::*,
+    sizes,
+    transmute::{
+        AsBytes,
+        FromBytes, //
+    },
+};
+
+use crate::{
+    driver::Bar0,
+    falcon::{
+        gsp::Gsp,
+        Falcon,
+        FalconBromParams,
+        FalconDmaLoadable,
+        FalconEngine,
+        FalconFbifMemType,
+        FalconFbifTarget,
+        FalconFirmware,
+        FalconPioDmemLoadTarget,
+        FalconPioImemLoadTarget,
+        FalconPioLoadable, //
+    },
+    firmware::{
+        fwsec::FwsecFirmware,
+        request_firmware,
+        BinHdr,
+        FIRMWARE_VERSION, //
+    },
+    gpu::Chipset,
+    num::{
+        self,
+        FromSafeCast, //
+    },
+    regs,
+};
+
+/// Descriptor used by RM to figure out the requirements of the boot loader.
+#[repr(C)]
+#[derive(Debug, Clone)]
+pub(crate) struct BootloaderDesc {
+    /// Starting tag of bootloader.
+    pub(crate) start_tag: u32,
+    /// DMEM offset where [`BootloaderDmemDescV2`] is to be loaded.
+    pub(crate) dmem_load_off: u32,
+    /// Offset of code section in the image.
+    pub(crate) code_off: u32,
+    /// Size of code section in the image.
+    pub(crate) code_size: u32,
+    /// Offset of data section in the image.
+    pub(crate) data_off: u32,
+    /// Size of data section in the image.
+    pub(crate) data_size: u32,
+}
+// SAFETY: any byte sequence is valid for this struct.
+unsafe impl FromBytes for BootloaderDesc {}
+
+/// Structure used by the boot-loader to load the rest of the code.
+///
+/// This has to be filled by the GPU driver and copied into DMEM at offset
+/// [`BootloaderDesc.dmem_load_off`].
+#[repr(C, packed)]
+#[derive(Debug, Clone)]
+pub(crate) struct BootloaderDmemDescV2 {
+    /// Reserved, should always be first element.
+    pub(crate) reserved: [u32; 4],
+    /// 16B signature for secure code, 0s if no secure code.
+    pub(crate) signature: [u32; 4],
+    /// DMA context used by the bootloader while loading code/data.
+    pub(crate) ctx_dma: u32,
+    /// 256B-aligned physical FB address where code is located.
+    pub(crate) code_dma_base: u64,
+    /// Offset from `code_dma_base` where the non-secure code is located (must be multiple of 256).
+    pub(crate) non_sec_code_off: u32,
+    /// Size of the non-secure code part.
+    pub(crate) non_sec_code_size: u32,
+    /// Offset from `code_dma_base` where the secure code is located (must be multiple of 256).
+    pub(crate) sec_code_off: u32,
+    /// Size of the secure code part.
+    pub(crate) sec_code_size: u32,
+    /// Code entry point invoked by the bootloader after code is loaded.
+    pub(crate) code_entry_point: u32,
+    /// 256B-aligned physical FB address where data is located.
+    pub(crate) data_dma_base: u64,
+    /// Size of data block (should be multiple of 256B).
+    pub(crate) data_size: u32,
+    /// Arguments to be passed to the target firmware being loaded.
+    pub(crate) argc: u32,
+    /// Number of arguments to be passed to the target firmware being loaded.
+    pub(crate) argv: u32,
+}
+// SAFETY: This struct doesn't contain uninitialized bytes and doesn't have interior mutability.
+unsafe impl AsBytes for BootloaderDmemDescV2 {}
+
+/// Wrapper for [`FwsecFirmware`] that includes the bootloader performing the actual load
+/// operation.
+pub(crate) struct FwsecFirmwareWithBl {
+    /// Firmware that the bootloader will load.
+    firmware: FwsecFirmware,
+    /// Descriptor to be loaded into DMEM for the bootloader to read.
+    dmem_desc: BootloaderDmemDescV2,
+    /// Code of the bootloader to be loaded into non-secure IMEM.
+    ucode: KVec<u8>,
+    /// Range-validated start offset of the firmware code in IMEM.
+    imem_dst_start: u16,
+    /// Range-validated `desc.start_tag`.
+    start_tag: u16,
+}
+
+impl FwsecFirmwareWithBl {
+    /// Loads the bootloader firmware for `dev` and `chipset`, and wrap `firmware` so it can be
+    /// loaded using it.
+    pub(crate) fn new(
+        firmware: FwsecFirmware,
+        dev: &Device<device::Bound>,
+        chipset: Chipset,
+    ) -> Result<Self> {
+        let fw = request_firmware(dev, chipset, "gen_bootloader", FIRMWARE_VERSION)?;
+        let hdr = fw
+            .data()
+            .get(0..size_of::<BinHdr>())
+            .and_then(BinHdr::from_bytes_copy)
+            .ok_or(EINVAL)?;
+
+        let desc = {
+            let desc_offset = usize::from_safe_cast(hdr.header_offset);
+
+            fw.data()
+                .get(desc_offset..)
+                .and_then(BootloaderDesc::from_bytes_copy_prefix)
+                .ok_or(EINVAL)?
+                .0
+        };
+
+        let ucode = {
+            let ucode_start = usize::from_safe_cast(hdr.data_offset);
+            let code_size = usize::from_safe_cast(desc.code_size);
+
+            let mut ucode = KVec::new();
+            ucode.extend_from_slice(
+                fw.data()
+                    .get(ucode_start..ucode_start + code_size)
+                    .ok_or(EINVAL)?,
+                GFP_KERNEL,
+            )?;
+
+            ucode
+        };
+
+        let dmem_desc = {
+            let imem_sec = FalconDmaLoadable::imem_sec_load_params(&firmware);
+            let imem_ns = FalconDmaLoadable::imem_ns_load_params(&firmware).ok_or(EINVAL)?;
+            let dmem = FalconDmaLoadable::dmem_load_params(&firmware);
+
+            BootloaderDmemDescV2 {
+                reserved: [0; 4],
+                signature: [0; 4],
+                ctx_dma: 4, // FALCON_DMAIDX_PHYS_SYS_NCOH
+                code_dma_base: firmware.dma_handle(),
+                non_sec_code_off: imem_ns.dst_start,
+                non_sec_code_size: imem_ns.len,
+                sec_code_off: imem_sec.dst_start,
+                sec_code_size: imem_sec.len,
+                code_entry_point: 0,
+                data_dma_base: firmware.dma_handle() + u64::from(dmem.src_start),
+                data_size: dmem.len,
+                argc: 0,
+                argv: 0,
+            }
+        };
+
+        // The bootloader's code must be loaded in the area right below the first 64K of IMEM.
+        const BOOTLOADER_LOAD_CEILING: u32 = num::usize_into_u32::<{ sizes::SZ_64K }>();
+        let imem_dst_start = BOOTLOADER_LOAD_CEILING
+            .checked_sub(desc.code_size)
+            .ok_or(EOVERFLOW)?;
+
+        Ok(Self {
+            firmware,
+            dmem_desc,
+            ucode,
+            imem_dst_start: u16::try_from(imem_dst_start)?,
+            start_tag: u16::try_from(desc.start_tag)?,
+        })
+    }
+
+    /// Loads the bootloader into `falcon` and execute it.
+    ///
+    /// The bootloader will load the FWSEC firmware and then execute it. This function returns
+    /// after FWSEC has reached completion.
+    pub(crate) fn run(
+        &self,
+        dev: &Device<device::Bound>,
+        falcon: &Falcon<Gsp>,
+        bar: &Bar0,
+    ) -> Result<()> {
+        // Reset falcon, load the firmware, and run it.
+        falcon
+            .reset(bar)
+            .inspect_err(|e| dev_err!(dev, "Failed to reset GSP falcon: {:?}\n", e))?;
+        falcon
+            .pio_load(bar, self)
+            .inspect_err(|e| dev_err!(dev, "Failed to load FWSEC firmware: {:?}\n", e))?;
+
+        // Configure DMA index for the bootloader to fetch the FWSEC firmware from system memory.
+        regs::NV_PFALCON_FBIF_TRANSCFG::update(
+            bar,
+            &Gsp::ID,
+            usize::from_safe_cast(self.dmem_desc.ctx_dma),
+            |v| {
+                v.set_target(FalconFbifTarget::CoherentSysmem)
+                    .set_mem_type(FalconFbifMemType::Physical)
+            },
+        );
+
+        let (mbox0, _) = falcon
+            .boot(bar, Some(0), None)
+            .inspect_err(|e| dev_err!(dev, "Failed to boot FWSEC firmware: {:?}\n", e))?;
+        if mbox0 != 0 {
+            dev_err!(dev, "FWSEC firmware returned error {}\n", mbox0);
+            Err(EIO)
+        } else {
+            Ok(())
+        }
+    }
+}
+
+impl FalconFirmware for FwsecFirmwareWithBl {
+    type Target = Gsp;
+
+    fn brom_params(&self) -> FalconBromParams {
+        self.firmware.brom_params()
+    }
+
+    fn boot_addr(&self) -> u32 {
+        // On V2 platforms, the boot address is extracted from the generic bootloader, because the
+        // gbl is what actually copies FWSEC into memory, so that is what needs to be booted.
+        u32::from(self.start_tag) << 8
+    }
+}
+
+impl FalconPioLoadable for FwsecFirmwareWithBl {
+    fn imem_sec_load_params(&self) -> Option<FalconPioImemLoadTarget<'_>> {
+        None
+    }
+
+    fn imem_ns_load_params(&self) -> Option<FalconPioImemLoadTarget<'_>> {
+        Some(FalconPioImemLoadTarget {
+            data: self.ucode.as_ref(),
+            dst_start: self.imem_dst_start,
+            secure: false,
+            start_tag: self.start_tag,
+        })
+    }
+
+    fn dmem_load_params(&self) -> FalconPioDmemLoadTarget<'_> {
+        FalconPioDmemLoadTarget {
+            data: self.dmem_desc.as_bytes(),
+            dst_start: 0,
+        }
+    }
+}
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index be427fe26a58..b7dbd57dd882 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -24,6 +24,7 @@
             BooterKind, //
         },
         fwsec::{
+            bootloader::FwsecFirmwareWithBl,
             FwsecCommand,
             FwsecFirmware, //
         },
@@ -48,6 +49,7 @@ impl super::Gsp {
     /// created the WPR2 region.
     fn run_fwsec_frts(
         dev: &device::Device<device::Bound>,
+        chipset: Chipset,
         falcon: &Falcon<Gsp>,
         bar: &Bar0,
         bios: &Vbios,
@@ -63,6 +65,7 @@ fn run_fwsec_frts(
             return Err(EBUSY);
         }
 
+        // FWSEC-FRTS will create the WPR2 region.
         let fwsec_frts = FwsecFirmware::new(
             dev,
             falcon,
@@ -74,8 +77,14 @@ fn run_fwsec_frts(
             },
         )?;
 
-        // Run FWSEC-FRTS to create the WPR2 region.
-        fwsec_frts.run(dev, falcon, bar)?;
+        if chipset.needs_fwsec_bootloader() {
+            let fwsec_frts_bl = FwsecFirmwareWithBl::new(fwsec_frts, dev, chipset)?;
+            // Load and run the bootloader, which will load FWSEC-FRTS and run it.
+            fwsec_frts_bl.run(dev, falcon, bar)?;
+        } else {
+            // Load and run FWSEC-FRTS directly.
+            fwsec_frts.run(dev, falcon, bar)?;
+        }
 
         // SCRATCH_E contains the error code for FWSEC-FRTS.
         let frts_status = regs::NV_PBUS_SW_SCRATCH_0E_FRTS_ERR::read(bar).frts_err_code();
@@ -144,7 +153,7 @@ pub(crate) fn boot(
         let fb_layout = FbLayout::new(chipset, bar, &gsp_fw)?;
         dev_dbg!(dev, "{:#x?}\n", fb_layout);
 
-        Self::run_fwsec_frts(dev, gsp_falcon, bar, &bios, &fb_layout)?;
+        Self::run_fwsec_frts(dev, chipset, gsp_falcon, bar, &bios, &fb_layout)?;
 
         let booter_loader = BooterFirmware::new(
             dev,

-- 
2.53.0


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D31BAF118
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 06:02:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D31010E661;
	Wed,  1 Oct 2025 04:02:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="AeEjUMD/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011063.outbound.protection.outlook.com [52.101.52.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB9A710E2E6
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 04:02:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GPYnUWhLgv7FhpqiwcFLflBnSYLCZKZ1NF7B1nJATLvF38ioAeSfK31cibMfKoHpxcbsVBNPMbBRbWXLyQU9VfFwzC5LtsdeVtxnr0cXUe1MZaBD7lZyOnx5URCRw7MkPu20c3+b3vSeMeJLMxvGuQDoMJrzfL1OkLmyTxvkk4JrxmOi1mtF36GCnizhJU38iH2lpkv6ZQdRvWWM/IjSZ2mlC/3ULzT9CrYCzGWDcXz337kvTl0m46LnJ7HESxg8PGn4Oz8WNA1QR/5ZtfdHqruDOFEEr39jYB7b/yLwwUPj7QqVtMt6XR325w5evfofeFqBfdfy0reLbxNAdCDKRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cntziZMePRwJ8wPs7L1Jh86gj5flVlQYpYfgf4snZy4=;
 b=D4x8WkA2XMvXHGQxJALKneYk6XwW8wzLEUuAfnGe0/ghO9Moxw81s+RCIXOuwXTk495J1zJh6O7Hh9G4SyoYhTZt2aOKQtV6JCGBCurBZVL8I/0jD+wf+fwyCKh9zcZgHxRLm2zpT6Nm9zYEHXvCuCfDviwyeYAfS5n9qPrwlC9Ev1VxK/MQeKfy6iRDhYhdxaF1T5SP7gNFnN+ykdfMEo/6SzVsBrUwOn52L3qitYKgdn7rX+ugb7hMvjcR1dDkFz9a/B+9Eia+GqvNBbYHYegX8/s7/zSKXgPPtOc+R6nxJ/z7mEPG2p/LDLS6/WCRLZQKhJIl6ZA1uHtrp99eDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cntziZMePRwJ8wPs7L1Jh86gj5flVlQYpYfgf4snZy4=;
 b=AeEjUMD/+fA1sTtfG0TjV8UvJGnXTARS04IkqQ+Vmi61QPlZ+VLLk5CC32HVzYV5D4CvLSt0vVhbNS94OaVU2iZ1vmy/XLmTZaaJdPHWl0C461ZocXD/uMYr80CrgDlvkSqjnYs8vqNXoAQEfhDhVsUrIfAohAFFl1vByRgn/1HoEtoxWdpEbYQxBohievRZD5o+h77124V08sh4Xx4GW5fQwmHeZITBi78UIodb9Fhi9zp5M3kZA6zzqGoT35jQYHhOZVF8O5V9Vt6760Q4M65unJOKFizRyUtHui+weVYh9yqTP8hk8wU25hU9TUexjtViErBQHt4sxKp6K3saPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB6494.namprd12.prod.outlook.com (2603:10b6:8:ba::19) by
 PH7PR12MB6000.namprd12.prod.outlook.com (2603:10b6:510:1dc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Wed, 1 Oct
 2025 04:02:26 +0000
Received: from DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11]) by DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11%6]) with mapi id 15.20.9160.015; Wed, 1 Oct 2025
 04:02:26 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 Jonas =?UTF-8?B?U2Nod8O2YmVs?= <jonasschwoebel@yahoo.de>,
 Dmitry Osipenko <digetx@gmail.com>,
 Charan Pedumuru <charan.pedumuru@gmail.com>,
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
 Aaron Kling <webgeek1234@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v3 01/22] clk: tegra: set CSUS as vi_sensor's gate for
 Tegra20, Tegra30 and Tegra114
Date: Wed, 01 Oct 2025 13:02:21 +0900
Message-ID: <6093672.29KlJPOoH8@senjougahara>
In-Reply-To: <20250925151648.79510-2-clamor95@gmail.com>
References: <20250925151648.79510-1-clamor95@gmail.com>
 <20250925151648.79510-2-clamor95@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCP286CA0021.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::11) To DM4PR12MB6494.namprd12.prod.outlook.com
 (2603:10b6:8:ba::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6494:EE_|PH7PR12MB6000:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fb17e50-344a-4dda-9790-08de009f5525
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|1800799024|10070799003|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RDZvOXVLK29PKzJJc091U2tOVjVzUmtVVHluSlZDcFovdUJJN1AzNExnRC9x?=
 =?utf-8?B?S2hXRW5mSkhoY2dzdmtpOFZER2dOS3ZPZEJycUp4WXlpSE8xNTVCaWgwYU1Y?=
 =?utf-8?B?NXdDeWljR3NXR3h0V0VwYXJSL2V5MDVPaTJqZm5zYlNyU1pNVXpPVUhNYjZH?=
 =?utf-8?B?TytDSVB6S096ZjFNMDB1SGpGRmF2cE5TRnRpYUtDTkxCN3dOb3RUcGc3clQw?=
 =?utf-8?B?ZmQvT1NxKy9RZ3RoSU1BK1psZUh2amxkN3ZiM3gvcCtBd3JKWlFVcjBmaHFI?=
 =?utf-8?B?S09mVkNDeStLYVNqWmwzNDhPeEtnMUIvS1ZsSG5CM0NFQnVLeVRyRE1YaHMy?=
 =?utf-8?B?UVkyVzhTZzdaeko4VVpEUnBoN2RaWUFxN2JreWduR2JSSTV6d3EvcEJFRkMw?=
 =?utf-8?B?TUxoTVJxaG1SYyttRWt1YkgxQW52bmpGQXRzaFVnSGNCN2libzRwUFplS1Bm?=
 =?utf-8?B?WERwL3p5aXFBb1FNWXZhb01JOUJZR1RFd0pFZ2MreGZrK0hZakVaUldFc1No?=
 =?utf-8?B?cmVMVHVxWFpqWWt5aVJKVjVvd0RqSWl6djRNbFRTRGdGVEF0azZPOXpMNkg3?=
 =?utf-8?B?ZVova3NjMG9uVFhybUtERTM3ZUJOQzludFBlK0VmaVpSQ09zckEyK3p3eU41?=
 =?utf-8?B?YUF1MWphbmNHVEpVNmdPT1pVV3BWbE5PTHpETUhtQmR6NTRGWE9qZkYrcHp3?=
 =?utf-8?B?ZGozdnJ5RkR6WUFGNnlYZ0hnbStPTmxFdzA5OGFCL1ZKeTRibGxvRXBNUnR6?=
 =?utf-8?B?TmMxbzcyQWgxdDdER2YwSDdpcmQ1MEEwOGYyY0RhdE5oTms4eHJCL1lVbUlz?=
 =?utf-8?B?dWlMRzh6c045VFpDc0NKVkVzYWNNZG9HazBIY2RoekhWVmY1ZXdlQUxYRm9G?=
 =?utf-8?B?QnpuQVV3UENDWlNLcHd6U3UrN25qNGZWY2M4Nnhrdk9EY0trMDE1TEdPb3Bx?=
 =?utf-8?B?Wkl4eW5nR3lBZ25vaEhybVlkWWh3elJpQXE0RFZjNVVTNW1OaEdVTlJOMUpT?=
 =?utf-8?B?S1R1RW5SaUNudndkRm91NUFXNDJrNzJ3WEV4NCtGWm1CSFBFNzZLVFhNdnJu?=
 =?utf-8?B?TnRDbzdVVkdIZFZMZjFsVnlIRTQrV0huYnZMVWluWnljalp3Sk5MRy9rVHNL?=
 =?utf-8?B?cUVwVklaNGMrbThNd0NGcDc3SzBGaVpZak56YjRxbERHcm5nVmE4REp6SEZT?=
 =?utf-8?B?SzFVZi8yVjZOeC9vUm5tenFNVXMxNlF0U2RyRTNaZ0tCS2dGWUVEc0orVlNZ?=
 =?utf-8?B?OEczZnp3bGFXUFRMTjJ3eXJBZEFwZmhTMThpUkRGZDZzNzFaVXhDU2FQUy9i?=
 =?utf-8?B?bU9MT3dmeTk5eXZVYWhiSjJFdXk4MFcxZ1ZLWVc0NzBHWWV6WXpIS1ZmckIw?=
 =?utf-8?B?bTl0a2ozanl2byttZC8wKzFVRDNrWnRUQ1ViZmtuMmtJS2NLbVZOWGFTTWZ6?=
 =?utf-8?B?V2JlbjJYYTdIQWVQSDdsSEJkdS9jMy8zSlNqRzBscTZVb3lUZWNhaGt3V1pC?=
 =?utf-8?B?UmFkZkFRbmxTV1ZnRi9mQzJiYU1Obm9oOVpsNkY0cHdjakNqSXhUdDFaRXB5?=
 =?utf-8?B?aHVpZjRBK1UrOUx6VHFybElHVFpLQnZHVjNoN1BPYnNpckw2eUtWK2RTRGZG?=
 =?utf-8?B?QnhrUU5LaExyN3VmTFl2WEJLeStTY3VwKy81QlBFV3kvZndRQ1EzcGZCcU9Q?=
 =?utf-8?B?TDZJaXJuUVBJMzMyZG5jMWxBR1lHTk5EY253Vkg1eWNsclhneHpVd25oZUdJ?=
 =?utf-8?B?NDJGejAvZzAxNEhrYlZtSmRYVHRvemJpdnZLbDV6MzUzOXNnQ0xBc2sxU1dZ?=
 =?utf-8?B?Vy9TU01PUUluaUVrZmVqYU5ZNDdlbUl4UzF2MituaGViUW9ZMnN0T3pBTlJ6?=
 =?utf-8?B?QitzZ0prOHhhdjA4eXNzeVBYZXArZzBHbTQ1a0lCTXEwSG9COHB6enZtMHBT?=
 =?utf-8?B?ckxhanhHVlREWW9yQmNFV0JwVmdrWDNKRzN1SXVBNTMveDFEVlpzcktQUkJM?=
 =?utf-8?Q?YaaioGPaljJO9QfiRrJR6ukDOzbtzU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6494.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(10070799003)(376014)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akhmTThjSHBQRFRKc0VrNG1CeTk0TVBCQ2N5YkdmMUF3WjQ3RFZOL1dIakFm?=
 =?utf-8?B?V1NuWnBQY1B4azlkaHVCNE44dllRL3d0SWd1YVU0UHRKdUR0dWVHaVVsM2t0?=
 =?utf-8?B?ckhYeEErTU13REMzWmdsWnZCQ29FSWwvWDdsUG9La2xxaVNHS25SZHMwczdp?=
 =?utf-8?B?ejlrclZObTRMSzZKcEZTSHZoVElJOHZtWDhMZnR1TXdUaldQYmVFVTNwbVl2?=
 =?utf-8?B?Q25qZkY5ZXlSZHI2TDM4WjNjRVZ0aFVEcDNZcUxDNHY4UUZjNjFtcjRldkRX?=
 =?utf-8?B?WUNFaDBDWlZYQzVXZWgvL2FCLzJEQUhZaHJ0dE1pL3hKdlM4MGx4TDJycW1M?=
 =?utf-8?B?Zkdyb1B3ZGZDeXM3MnFhaDZJQmlqV0QxcjV2UC9hejNPc1JSTys2ZjVyT3Jj?=
 =?utf-8?B?b09JVUg4SGRzdW81V0tqazd3Z1NjZk0waTdGUjFpakJ1RGlBT3NqRHJQM2h4?=
 =?utf-8?B?MDB1ZkZDZzloZk1BK3lyZ2ZlYVdPb0w2Uzd1MStvU21NZk4zTVZXNUhIUWlw?=
 =?utf-8?B?VHFhUksrWFA1QWREU1VWb2Zab2VrV3NyemdkWlErT1pxcGlTZ3pFNGJZblFN?=
 =?utf-8?B?bCsxZnAxa1kxR2NVdmQyaDVnbTlRTmUzNkdvOTdiUUVQVlhSck91a1FlVlNT?=
 =?utf-8?B?dG4rUzl1L1FWTXN0RjJreitZeHNGQjdWamRKZDgvSmcrRDREam9xelgvdmZj?=
 =?utf-8?B?RUxsVkg5eFZwdTk0OTNNTklTMkZNR1BTeHRBVmlXMm5EVXhhVmJwRk0rOURq?=
 =?utf-8?B?cHQyZmR5Nm5DWHo1N25oYlM1UFZBNEwvRXhYc2Jqc3VxZTkwd2d6bmU2TGpS?=
 =?utf-8?B?b1phUmprU1VKZWRtR3VGZFUyVGpsRUZSZGR0WnhSSlNXVDdwYmt0ZmFjM2JY?=
 =?utf-8?B?bU00SUcwNGJjUDU2QjhJUmNkcUZJampUTVk0Y1NoQ2pydzlrQXVZampmdk40?=
 =?utf-8?B?bkFOcjViNk8rYlhQaDhiVlh0Ynk1YUttaGwxMkY4U1NXakkwV3Uvb1JINDla?=
 =?utf-8?B?NGdhNFlkUm9CZEtNdmdkUTlHNGRiVDEwYm1CM1FzUk9kRFBiMlBXMFhqU09n?=
 =?utf-8?B?dWNITS9qS1ZPRk5HWUIyUzFIV0JLYmpFeE80c1ZoK0ZMc09ZcnNIbnZaTWtw?=
 =?utf-8?B?SzArcGs1dWQzNEtsSnZQTzc0WEUyaHFia0ZxR1gwcEp5ekZSSDRJQTNzajBN?=
 =?utf-8?B?VDBNaXIya2hDazB2TXlSWUxwL1M4RWxzeWVyNHM0cEJFU2hJQ0R2QlJZM1hW?=
 =?utf-8?B?T2EzYTJRSnErbVlQNnBYMzlWS1A4Q3gxVGluaVlveFQ0K1RaS2djYlc1OTJj?=
 =?utf-8?B?d0JvK2JoMURZaXRSNnRoOUIvbE1VNzJXVkFTQjRVWmZBNHh0V25hQ2JkR1ph?=
 =?utf-8?B?ZnNGd0Z5ZzQ5TEtHeVZlYkkxeTZoL2NYdGsyK1JYQnpjZ3JwaHo4KzB6Q1I2?=
 =?utf-8?B?WkFpOTFZQ2QzY2pBUU9HU2xtU2l1MzZrSGFsRjVscUhxNGUyVVhydytQRVlS?=
 =?utf-8?B?RW9zV3pWU3hpMlluM0daVkszMDhQZzJHOXMvTlowY1NXS3pPajhoek5PNmRB?=
 =?utf-8?B?NXExMGpOWTlKR25YRTkxbkhEc0VFRGtQL0xVZDgvNG1Jcjk0YUE2YUh0ZGU0?=
 =?utf-8?B?NW5sd1M4RUd5Rm1iQnJrVlphRzVTYVNhdXgxNmYyQlYzRmJMSGlQWVhjOGlP?=
 =?utf-8?B?RFJaSVRIeUlzcE9sSGtXbm5mTy9Ua2pjRjVVRkZXRzlPZ0JUMWtwTG9Sa0N4?=
 =?utf-8?B?S0ZnRTBTZEZGbVhGOHd1RzRTcTlacGwycjdZQmRGQURZd0p4TnFZY2t6YU9i?=
 =?utf-8?B?RlREQ2hCV3FSeDRUZmVjdlRoUHdpUTRMVldBdE9zOFVjaThDR0M3NW03bzZT?=
 =?utf-8?B?YzFJUERMcUx5YmJyUU1yYTc4dldjWkQ3U1ZDUUdUa3ExVWFpYmJoZzZjWE5B?=
 =?utf-8?B?RUIrS01BemdxV0hmMkc1a3libjRzT3Z5RmtmVjBVbkF2Y0U0R1EwZzBSeEF1?=
 =?utf-8?B?RFNONXZmdXBpejNjd0hjVUFaenZBWXNOdnV0Wm1CM2Vibk9CNnM5UWY2WVFQ?=
 =?utf-8?B?a0hPVHQ0TUFnK2htc1hTaFhZUUV6Y0lheXd0aXUybDVtZzRqYTB1OTdIMXlP?=
 =?utf-8?B?R2s4NFYyZC9IR0tWcy9JNlJkVG51di9KRVhOWUczbEE1Z1dWd244Tk1HRWMz?=
 =?utf-8?B?bFNHd2VRaE54Z3lnZ1A1c2ZCZ01RZFdyR1YxWFVoTnlsYTA0cHhRRXROVXQ2?=
 =?utf-8?B?dWZyYXFhS0dyQ3l4RWNFWmRBaXR3PT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fb17e50-344a-4dda-9790-08de009f5525
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6494.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 04:02:26.4434 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Alr7V8iScCUaXRlGs2Z2K8ECoU1pmvlLyqXXd3TekfRFAlh2xvq58LpepA5wzalCXvFrGsIVRV9i6ep7XIQ8ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6000
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

On Friday, September 26, 2025 12:16=E2=80=AFAM Svyatoslav Ryhel wrote:
> The CSUS clock is a clock gate for the output clock signal primarily
> sourced from the VI_SENSOR clock. This clock signal is used as an input
> MCLK clock for cameras.
>=20
> Unlike later Tegra SoCs, the Tegra 20 can change its CSUS parent, which i=
s
> why csus_mux is added in a similar way to how CDEV1 and CDEV2 are handled=
.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/clk/tegra/clk-tegra114.c        |  7 ++++++-
>  drivers/clk/tegra/clk-tegra20.c         | 20 +++++++++++++-------
>  drivers/clk/tegra/clk-tegra30.c         |  7 ++++++-
>  drivers/pinctrl/tegra/pinctrl-tegra20.c |  7 +++++++
>  4 files changed, 32 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-teg=
ra114.c
> index 186b0b81c1ec..00282b0d3763 100644
> --- a/drivers/clk/tegra/clk-tegra114.c
> +++ b/drivers/clk/tegra/clk-tegra114.c
> @@ -691,7 +691,6 @@ static struct tegra_clk tegra114_clks[tegra_clk_max] =
__initdata =3D {
>  	[tegra_clk_tsec] =3D { .dt_id =3D TEGRA114_CLK_TSEC, .present =3D true =
},
>  	[tegra_clk_xusb_host] =3D { .dt_id =3D TEGRA114_CLK_XUSB_HOST, .present=
 =3D true },
>  	[tegra_clk_msenc] =3D { .dt_id =3D TEGRA114_CLK_MSENC, .present =3D tru=
e },
> -	[tegra_clk_csus] =3D { .dt_id =3D TEGRA114_CLK_CSUS, .present =3D true =
},
>  	[tegra_clk_mselect] =3D { .dt_id =3D TEGRA114_CLK_MSELECT, .present =3D=
 true },
>  	[tegra_clk_tsensor] =3D { .dt_id =3D TEGRA114_CLK_TSENSOR, .present =3D=
 true },
>  	[tegra_clk_i2s3] =3D { .dt_id =3D TEGRA114_CLK_I2S3, .present =3D true =
},
> @@ -1047,6 +1046,12 @@ static __init void tegra114_periph_clk_init(void _=
_iomem *clk_base,
>  					     0, 82, periph_clk_enb_refcnt);
>  	clks[TEGRA114_CLK_DSIB] =3D clk;
> =20
> +	/* csus */
> +	clk =3D tegra_clk_register_periph_gate("csus", "vi_sensor", 0,
> +					     clk_base, 0, TEGRA114_CLK_CSUS,
> +					     periph_clk_enb_refcnt);
> +	clks[TEGRA114_CLK_CSUS] =3D clk;
> +
>  	/* emc mux */
>  	clk =3D clk_register_mux(NULL, "emc_mux", mux_pllmcp_clkm,
>  			       ARRAY_SIZE(mux_pllmcp_clkm),
> diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-tegr=
a20.c
> index 2c58ce25af75..d8d5afeb6f9b 100644
> --- a/drivers/clk/tegra/clk-tegra20.c
> +++ b/drivers/clk/tegra/clk-tegra20.c
> @@ -530,7 +530,6 @@ static struct tegra_clk tegra20_clks[tegra_clk_max] _=
_initdata =3D {
>  	[tegra_clk_rtc] =3D { .dt_id =3D TEGRA20_CLK_RTC, .present =3D true },
>  	[tegra_clk_timer] =3D { .dt_id =3D TEGRA20_CLK_TIMER, .present =3D true=
 },
>  	[tegra_clk_kbc] =3D { .dt_id =3D TEGRA20_CLK_KBC, .present =3D true },
> -	[tegra_clk_csus] =3D { .dt_id =3D TEGRA20_CLK_CSUS, .present =3D true }=
,
>  	[tegra_clk_vcp] =3D { .dt_id =3D TEGRA20_CLK_VCP, .present =3D true },
>  	[tegra_clk_bsea] =3D { .dt_id =3D TEGRA20_CLK_BSEA, .present =3D true }=
,
>  	[tegra_clk_bsev] =3D { .dt_id =3D TEGRA20_CLK_BSEV, .present =3D true }=
,
> @@ -834,6 +833,12 @@ static void __init tegra20_periph_clk_init(void)
>  				    clk_base, 0, 93, periph_clk_enb_refcnt);
>  	clks[TEGRA20_CLK_CDEV2] =3D clk;
> =20
> +	/* csus */
> +	clk =3D tegra_clk_register_periph_gate("csus", "csus_mux", 0,
> +					     clk_base, 0, TEGRA20_CLK_CSUS,
> +					     periph_clk_enb_refcnt);
> +	clks[TEGRA20_CLK_CSUS] =3D clk;
> +
>  	for (i =3D 0; i < ARRAY_SIZE(tegra_periph_clk_list); i++) {
>  		data =3D &tegra_periph_clk_list[i];
>  		clk =3D tegra_clk_register_periph_data(clk_base, data);
> @@ -1093,14 +1098,15 @@ static struct clk *tegra20_clk_src_onecell_get(st=
ruct of_phandle_args *clkspec,
>  	hw =3D __clk_get_hw(clk);
> =20
>  	/*
> -	 * Tegra20 CDEV1 and CDEV2 clocks are a bit special case, their parent
> -	 * clock is created by the pinctrl driver. It is possible for clk user
> -	 * to request these clocks before pinctrl driver got probed and hence
> -	 * user will get an orphaned clock. That might be undesirable because
> -	 * user may expect parent clock to be enabled by the child.
> +	 * Tegra20 CDEV1, CDEV2 and CSUS clocks are a bit special case, their
> +	 * parent clock is created by the pinctrl driver. It is possible for
> +	 * clk user to request these clocks before pinctrl driver got probed
> +	 * and hence user will get an orphaned clock. That might be undesirable
> +	 * because user may expect parent clock to be enabled by the child.
>  	 */
>  	if (clkspec->args[0] =3D=3D TEGRA20_CLK_CDEV1 ||
> -	    clkspec->args[0] =3D=3D TEGRA20_CLK_CDEV2) {
> +	    clkspec->args[0] =3D=3D TEGRA20_CLK_CDEV2 ||
> +	    clkspec->args[0] =3D=3D TEGRA20_CLK_CSUS) {
>  		parent_hw =3D clk_hw_get_parent(hw);
>  		if (!parent_hw)
>  			return ERR_PTR(-EPROBE_DEFER);
> diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegr=
a30.c
> index 82a8cb9545eb..ca367184e185 100644
> --- a/drivers/clk/tegra/clk-tegra30.c
> +++ b/drivers/clk/tegra/clk-tegra30.c
> @@ -779,7 +779,6 @@ static struct tegra_clk tegra30_clks[tegra_clk_max] _=
_initdata =3D {
>  	[tegra_clk_rtc] =3D { .dt_id =3D TEGRA30_CLK_RTC, .present =3D true },
>  	[tegra_clk_timer] =3D { .dt_id =3D TEGRA30_CLK_TIMER, .present =3D true=
 },
>  	[tegra_clk_kbc] =3D { .dt_id =3D TEGRA30_CLK_KBC, .present =3D true },
> -	[tegra_clk_csus] =3D { .dt_id =3D TEGRA30_CLK_CSUS, .present =3D true }=
,
>  	[tegra_clk_vcp] =3D { .dt_id =3D TEGRA30_CLK_VCP, .present =3D true },
>  	[tegra_clk_bsea] =3D { .dt_id =3D TEGRA30_CLK_BSEA, .present =3D true }=
,
>  	[tegra_clk_bsev] =3D { .dt_id =3D TEGRA30_CLK_BSEV, .present =3D true }=
,
> @@ -1008,6 +1007,12 @@ static void __init tegra30_periph_clk_init(void)
>  				    0, 48, periph_clk_enb_refcnt);
>  	clks[TEGRA30_CLK_DSIA] =3D clk;
> =20
> +	/* csus */
> +	clk =3D tegra_clk_register_periph_gate("csus", "vi_sensor", 0,
> +					     clk_base, 0, TEGRA30_CLK_CSUS,
> +					     periph_clk_enb_refcnt);
> +	clks[TEGRA30_CLK_CSUS] =3D clk;
> +
>  	/* pcie */
>  	clk =3D tegra_clk_register_periph_gate("pcie", "clk_m", 0, clk_base, 0,
>  				    70, periph_clk_enb_refcnt);
> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra20.c b/drivers/pinctrl/te=
gra/pinctrl-tegra20.c
> index 737fc2000f66..437e0ac091cc 100644
> --- a/drivers/pinctrl/tegra/pinctrl-tegra20.c
> +++ b/drivers/pinctrl/tegra/pinctrl-tegra20.c
> @@ -2230,6 +2230,10 @@ static const char *cdev2_parents[] =3D {
>  	"dev2_osc_div", "hclk", "pclk", "pll_p_out4",
>  };
> =20
> +static const char *csus_parents[] =3D {
> +	"pll_c_out1", "pll_p_out2", "pll_p_out3", "vi_sensor",
> +};
> +
>  static void tegra20_pinctrl_register_clock_muxes(struct platform_device =
*pdev)
>  {
>  	struct tegra_pmx *pmx =3D platform_get_drvdata(pdev);
> @@ -2239,6 +2243,9 @@ static void tegra20_pinctrl_register_clock_muxes(st=
ruct platform_device *pdev)
> =20
>  	clk_register_mux(NULL, "cdev2_mux", cdev2_parents, 4, 0,
>  			 pmx->regs[1] + 0x8, 4, 2, CLK_MUX_READ_ONLY, NULL);
> +
> +	clk_register_mux(NULL, "csus_mux", csus_parents, 4, 0,
> +			 pmx->regs[1] + 0x8, 6, 2, CLK_MUX_READ_ONLY, NULL);
>  }
> =20
>  static int tegra20_pinctrl_probe(struct platform_device *pdev)
>=20

Please move the pinctrl changes to a separate patch. Otherwise, LGTM.

Mikko



Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8PN+GMmScWlZJgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 04:00:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4859611CE
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 04:00:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A276410E8CF;
	Thu, 22 Jan 2026 03:00:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="iRadT//M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013027.outbound.protection.outlook.com
 [40.93.196.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9630B10E836;
 Thu, 22 Jan 2026 03:00:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IhwqoU3OVXAqlK3nU7Y9Gyie3AsmNOC2LnzxgmRT5CQUzV5Q3ofdu6HwUh3YQVA1nZY9mgmtoqE1NAsbgeCzasKEG4KvAGDwqeppBccidbbIq0W3exrmyXv2js7q9wK3Bx/JgpUUl8HhOiYsO9omRN6Rt47NSc14qgcluF+mKex47KzyelLFsJEE4CDpDWjR1XstpVetXnlBniTiSRpF3v5VmBzgInCbd9NXVtEr76NJ9w3oDB9J/1fQkKy5+mLjIOUOw912ZEaGCTCkTvvkdwEpHpnTWezc/UE9mjIxXFgk2iTOBK0TTj87Q+iHHXxaJZkh3LA0YJngpzvxh8MG3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4MOXsqDtSywmjnm4Q1HZnAn6zEYT0Yl6ESLNfwihhnk=;
 b=JdEvpwHahcZG63cZJdbVWJbXgk7auK1oKjcXDWdDnX3Ska8eW/Q0Wh8BunSxfhefeSCMH06VXr+icWnnrdAbbRR7CfxrHO+LUsR8GDBtK6ji5egplHnPJGLvYRjttqQhBvZTupY49GDZad+UrxUD8d/iz33vvimnXph8CAjCeVprgoVTqlWjI/OKUIJ39k4TJ5OZcIskitNf1Zxl1PHESWasQqqGyBMswmQvvdLBIyGc9OgDQmmwP3nY7J+sthilCcW3V5rei3CfawJm3/wE9KC5CfskDEnmeBzYS8gpzZ4sEdJeNepHtHFA6nlAhkT9ruEGa4NPBosslUFVs+40dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4MOXsqDtSywmjnm4Q1HZnAn6zEYT0Yl6ESLNfwihhnk=;
 b=iRadT//M3ZPffPJvzqZJSpWpPKNXwSgbpUN0qM01PoP3PZ3KmylF6yflh5cGaGo3JQh4EW6w+G6SudszOU8bR6ximx46/WS+lnyYy2GXAWGEfaFsbO+P4wZPdtlt9b9QjuHismqo8Ro4U+rXOPhmDwmOYDzhMmuqAECqr92wWJrUTZetkgS5RjRurJvCMX30W7qohs45nXkvnj/zjLq4AILlfnAuBk+baP3my3/Wu+uRe3/b6WJWZx0L87nxLgQmHfwI3e26TIUrNYtNohbmPifvRL8clplHJ1EMtGH0Szw1wqpmICDplP1+2yxQabo97x4GGFUf5OmTKVwRYBWUgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by SA5PPF7D510B798.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8d0) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Thu, 22 Jan
 2026 03:00:13 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%6]) with mapi id 15.20.9542.008; Thu, 22 Jan 2026
 03:00:13 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Subject: [PATCH 0/4] gpu: nova-core: gsp: fix command queue ring buffer
 bugs
Date: Thu, 22 Jan 2026 11:59:03 +0900
Message-Id: <20260122-nova-core-cmdq1-v1-0-7f8fe4683f11@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMQQqDMBAAvyJ77oJJJbR+pXjYJtt2D0nqJoog/
 r2hHmdgZofCKlxg7HZQXqVITg3MpQP/ofRmlNAYbG9db6zBlFdCn5XRxzAbdER0dfebHfwArfo
 qv2T7Hx/Tycrz0sb1lPCk0uIco9SxCxpRl1Ix8VZhOo4f5rYnAZIAAAA=
X-Change-ID: 20260121-nova-core-cmdq1-6aaa369824c4
To: Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Alistair Popple <apopple@nvidia.com>
Cc: nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Eliot Courtney <ecourtney@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP301CA0049.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::13) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|SA5PPF7D510B798:EE_
X-MS-Office365-Filtering-Correlation-Id: 65246d20-1b82-465b-29f2-08de59625c9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|10070799003|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QzJsdHVOZmo0QlhRNE9SWkEzSEdYdTJtVk9zZmhQZFJXYmRPK1dUWUdyNGpp?=
 =?utf-8?B?L1RTVE5lYTlGVGZCR1l6eUdNV29QWHdiS3phSFcrRzU3V0s0VldoVW5UZXUv?=
 =?utf-8?B?S05TZTNFK2hHNTZ3Z3BTZUZ4MHdKYUZoMjJETXExQzJIODd3NDZGRmh1OVJs?=
 =?utf-8?B?UjNYaVExZHl3M1JSaHpSK2phczdhNkhvRENoOEEwenRkT1o4bDZid09UemhZ?=
 =?utf-8?B?bC8vTHprZjlBK2Q5ZEhHR2plaE9zQnVyZ3ZXcFFlRzI3T3ViNnBadVJTUFNi?=
 =?utf-8?B?U2RvZ292ejRMa3NXbzhiOTQrU045UG1kT2w3cVNZME1qTXR2eHdiRWlTeWJJ?=
 =?utf-8?B?Z21DZ1BURzhPbm8vSlBRQmhPbGVISlB1ZndEQ0RVRnJ1aTd3RFRHTkFSK2FC?=
 =?utf-8?B?bUoxL2tTTzArVnlVcXprWU9DMTBPVFdWQnBLUVduQW80cXdldUg3aVlLakVV?=
 =?utf-8?B?R3FpTFlDUm9aNFdYdGRZTW5FcmlncWZ5ZEhHK2RCUGRpblY1Z0dmRVkxTFJT?=
 =?utf-8?B?bDBXVlk3Zlg2L0ttKzRpdmMranZFVSs4TUQySnNkdjV0bG5SUzEyQWs3bW9U?=
 =?utf-8?B?b0JHOWRxcHE3aDd1eEpIelJEZXBQV0lERW1aQVNLU3dvWld3aGxQeXIzYnZQ?=
 =?utf-8?B?eFNqZXJuNWlCOG5kMzdCWnFiY0lZTnM4YVdPZG0xNnVEcFEvOStQWTdaWitU?=
 =?utf-8?B?TWEvVTF1ZjU0UmJOcGpBNmZUdmFtenJPcy9xaFMyWGo2SDlYcTF6VGpPTUxB?=
 =?utf-8?B?SUZmbEVJaXlJM3VxVk5LUi80MXZibHlnMGZnY0NzT2VoZW95SUlTWmV0WUc5?=
 =?utf-8?B?dHB4dEU3MDlqeTRNY3BGaEF3bFRROWtmZGg3QjdzSzFuVzZpblh4T2NjQVI0?=
 =?utf-8?B?SXVYVFd4ZWpkSDg2bktHcjlJRWw4aTE2TUZPUHZFNjlzTUcyZVZnWXJJQzkr?=
 =?utf-8?B?c0VmaWowM253RUVMNXhhSUIxakNXSTdmaTNMeHpyTndJRDhyR3p4ek55NVNs?=
 =?utf-8?B?K2UrZER1TS91QkxGZ3JZZDllK0lHOHY0ZmpHZHhaeVFGbTRzVExWemsxSG1G?=
 =?utf-8?B?dmRNNFpxa2RHN09MdktoZGhVcEN0NWtvbmJIMHEwQUNBUWNKbUxsM0J2VjEx?=
 =?utf-8?B?L2F2RHl4YmpRVHorMk5WeXhrVUlBa1pHb1FtZ2RpQmx6NmY1RTAyTm9iaHlY?=
 =?utf-8?B?QklYMHVZNnpSdUFGclhQQzBpZW5aaEhWcWpPNmRPb2ovM25LTWZISlVMaDRD?=
 =?utf-8?B?OU5kNTMwdzdkR281NlkrSVVGNUQ0c2tqaVc2NzBxSDBkYjVpdXJQTTFYbXEr?=
 =?utf-8?B?ZjE5cERRY1NIUUNIZzJlV3ZjZUZqMUlmRXdlYXVvV2pBVk80Mk9qUlFPYkFL?=
 =?utf-8?B?Rzd6Q2V1R3hpUjhmWEFib2d2S0VRekRJeHIwUUxpQ01wSzd3TXJVTjFSYTB1?=
 =?utf-8?B?UllYYjR1cU96V1lkWTB3akJLWEdyVlp5SzMvY0x1OFQ2aE9jbFlUYk1tLzdy?=
 =?utf-8?B?YmVsbTRMZFROVHpUeUNDc0U0SXpjVjRlQmsydjJxUmY0azZXWTR3eWoyR2xH?=
 =?utf-8?B?UlZtbXl6ZFNRanZpNE1VT1hxVy9GeW50am91em8vWTR6UTh3QncxaGgxMzZz?=
 =?utf-8?B?bmh6dDdGV1M1WHFvbXBZcy80S3I0NWcxSzRDOTcwaVNuTDRzWmdmbUFoV3Zn?=
 =?utf-8?B?MFFPUXpwMnFmUnRhOUU4SmxXSjB4MFQ4RDJOb2dQVEdMREovTHBTbUI1WjU5?=
 =?utf-8?B?QmxXNHBaUEF5QlNHb0ZFdXpraE5vbkJ1QmZPTTNGT1dmaDJvNmRpVUZVRzNs?=
 =?utf-8?B?dkFiNkFkZVU2OERrZ3N4NXJkL2VnQlVndVlWVGc2WHM1aEVqWG1kL29CbkN2?=
 =?utf-8?B?WVBBMUJ1R1B2Z0JVYTVhTTNLQjhpeG40NVFaZEN4b09XL1hCNFpJOUtkZTc1?=
 =?utf-8?B?MVNZMGllNktBVExMcFk1UTIxb0srWXcya0pwSHJCUEpteWtuVDdiVDVpRmV4?=
 =?utf-8?B?ajN5eUh0SXJYYWpiRGtyOUEwZ0ljU2M1TkFXZ1ZVM05BUkF2NG95cTVObzVX?=
 =?utf-8?B?ZmJGSStiWmFSbGtZM0tuVkh0ZWRTNE1JUmpHRFVEUmdTTnFxTUxDT1Q0alhE?=
 =?utf-8?Q?Nrk4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmJuWjJUbGdleXF5d2pBcmtJSEpkMGlLZkR1UXZiUCsxTkt2Si9TMzgzRkNC?=
 =?utf-8?B?YVkyVXJWYklnQjRnWFc2SkN5WXVqbDl5cG1zeWdDV0JHczkxV0ZzQzAxcDNi?=
 =?utf-8?B?VEVLVERZM0ZvQlVxWW9LMDhJc04zLy81WTkrc2FmSUlFc3kzUTF1SUorcEFQ?=
 =?utf-8?B?TWhZbHNLbHd5VllaemF4M3MxNS9jSnRRbSsyRVc0QlgzTmQwVTlSdDY1QjBv?=
 =?utf-8?B?Y3ZSWS92dklXRm9ZZnZWWS9ZRkV6UDNwaTIrdlAwZGlPNGRxd2xQRTEwMXFH?=
 =?utf-8?B?cWF4MFNLbEswbktpNjdUamZUMUNlekhibEpCd2xVZHYyZERQVGZPUGl0bGc4?=
 =?utf-8?B?eExHUzRGWlBMelJFMEg4Sk5UUjJ2NjVKcFBSaXpTNEZLN3FUb0Q5Vkk0QzZ4?=
 =?utf-8?B?Q1VSTUFUWGZWbGQ0QkwyNjN5c0p1eTN1UWpRN3E1a3FxODd4Q1l2L0lGRDhu?=
 =?utf-8?B?S1JnUDd2ckpNRzN1eDYwK3hBUElZdm5yWnpYT3AzWEdheEVUS1VkemdUTUpo?=
 =?utf-8?B?dHBnVHMrL0QyUFJpc3NtYWVXcGdMczBETVR6RnVmeGZsR216TisxdDNzQ0Rt?=
 =?utf-8?B?YjBic1U4NEJaZVZDMmN6dklNUXFDVWx5dUtpZytMT1IwNE9mL2xVbjhSaEpH?=
 =?utf-8?B?NlAxMm5XU1F3WG9wRFJoeiszcmNUNSs2Z2hoK1JjWW1UbHB5MDZvYWYxd2NO?=
 =?utf-8?B?ZmZxSE54Y1daV1JzR2FwMFpVOHRFOWVWQk5YZjZKZU14b2RZeGpRdE8wYUNz?=
 =?utf-8?B?TTA3TXplT0RaRVpHQlZYZFUrYTBLTGl5RVluSnlLMFAwU1h1S2NvZXg4VFlT?=
 =?utf-8?B?VHVrbDQ3d28xUjdUa3lIS0x0U0JLWEJQSkY4SzBySCtnU2k0dVNZMUxqeDhK?=
 =?utf-8?B?V1hMc1VnQWVQclRUUkdJR09acFVUNjViVmZ6c2VNNUN4MzMvcFVPODFEbW1o?=
 =?utf-8?B?OW1NMWdocWFzU291c3lPbGVRR05LQ0pZYy9NZHBsR0dpUGJISWRrWi9wekUx?=
 =?utf-8?B?UFJxN0RoM3JOV2Q3T0pZbFFJeDloVDBxZzk0dHJQaTdkSEtWMFVSVW8rZlJp?=
 =?utf-8?B?K25iTDlMNnM3ZE5tWGJpbGFZK3pETWthVUt5T1RmL2NVVmI5WEc2RUEvUW56?=
 =?utf-8?B?OE9iM0k2UTNxWjlsdHlNNzF3Q0FWVGw4aEkzS0MyWXM4RXBJeEpLQ1ZuZHlU?=
 =?utf-8?B?UXozLzdkRFRFTVVJVWZxckczaVM4cEc2Ri90UUxPRkQreThSek1yNnhHL0xi?=
 =?utf-8?B?cTBwMHNlNjRPWHpUUXlQL3Uzb0pERkVHK21jcFVNeTZYNkxpOFE4V3Zydkts?=
 =?utf-8?B?TnFtaW9NNDFGeEd2MlMxREhscmVIK2NwUXJ2c055Z3MzWmQxSUJEb3V0ZGt2?=
 =?utf-8?B?dzVEWGl5NEs5WjNtVFgxOHR2VkwxZFE2dnEvTzI0aExZQjNJOUdIYk9hRVJZ?=
 =?utf-8?B?d2plOUtrZ0g5TXF1TFNyck1xdys0YmdYMzZOQ3RMZUxDVGsyVUF5VTQ2by9W?=
 =?utf-8?B?TEpZd1V6M3RIUmZlM1AybWR6VWZwM3NRUHAvVldIN0JISHpUSkYzRW42OGtq?=
 =?utf-8?B?c2hIVmc1M0prdDludXpwZ3JyYlpzMXVYZmM3TElZeUQyYWdOTXZOekxWWFNo?=
 =?utf-8?B?elU5a0E1MmJRTzR5NDJ4dUVJTUVDMkkvOHQ3Zjc0YjUybVI0c2I1NjZRN1lz?=
 =?utf-8?B?RjM3Y01PZ0JSeHVQSWI1czc3Z2U2dWxMWkppeEdiQnVsTnhRelpaQW51VFYr?=
 =?utf-8?B?R0p5SkliSFFtWU1JeWpUU1ZnZWo4OEJic1N3OEJhR2pWZUpaVHZ4UmRuQmVj?=
 =?utf-8?B?cTFSUS82NzliS3kvL1BZazJDT0NXc3ZXMklNY1h4czBqRS80WkRnTGRFK1Bm?=
 =?utf-8?B?dzZiUXNDYk5jc0c3dUQ0VnlXSWwwMi95SWNOVU9NWjZRajUzRnR4WVFFdVpR?=
 =?utf-8?B?TXFqc0RPb3RsVzAxWUh6V1NjVFNTdFF5QWJMb0JHNjJMZXJqSmtncmUvRmpl?=
 =?utf-8?B?aVJiaFRDbFVPVkU4OVkwcXRYR25SeTRhRHkwd2Y4MU42ckxYd01UcFQzaW5Y?=
 =?utf-8?B?alhrRnNiajVHektlL1Z2b08weVQzclIycWxaTDROY1NiUVMyblZhZ25KUjBD?=
 =?utf-8?B?UHFwcURVYkhNWGJ4eTZHUTY1Z0U0OUhOSlJsZzFoL2ZmZUQwSGRqYkJuQmEv?=
 =?utf-8?B?ZXRlR2JkRnNTZWV6bFpBK01rQ2FtdVhhQnUvVFJCSTNNZm9aTTNLZUxKVUJs?=
 =?utf-8?B?ajkrYVZDVi9DYTVtbXluVHlCYUNjU3ZhOGROcmR5OVBBazRkdHN5bW8vbmdJ?=
 =?utf-8?B?NHk4dGpSSWY1enBJN3Y4akdBTHVDVXlucnNEMUxXWnU1aERGVG5RZi9CUDA0?=
 =?utf-8?Q?ZA+pGhyMG+VLbI+ZqcAO8ulnCUgOgfBt8Cy+VUtv+sc2e?=
X-MS-Exchange-AntiSpam-MessageData-1: rf3zNvGvBAfvUg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65246d20-1b82-465b-29f2-08de59625c9b
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 03:00:13.1822 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hgw8RaFzl4rHDSq2Mbf/mIb6lDq91jjn7BK6xm7MqMzQse42nP2PHSeO9autqs2QykfyRB8Kfpv3AvlzwGfkvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF7D510B798
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FREEMAIL_TO(0.00)[kernel.org,nvidia.com,google.com,gmail.com,ffwll.ch];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	DKIM_TRACE(0.00)[Nvidia.com:+]
X-Rspamd-Queue-Id: B4859611CE
X-Rspamd-Action: no action

This series fixes a few bugs in the GSP command queue ring buffer
implementation in nova-core and also clarifies some of the comments.

The ring buffer uses read and write pointers (rx/tx) to track which areas
are available for the CPU vs the GSP to read/write into.

In the ring buffers there were some indexing issues which could end up
causing panics, so I fixed those and added more rigorous proofs of
correctness in the panic comments.

Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
Eliot Courtney (4):
      gpu: nova-core: gsp: fix incorrect advancing of write pointer
      gpu: nova-core: gsp: clarify comments about invariants and pointer roles
      gpu: nova-core: gsp: fix improper handling of empty slot in cmdq
      gpu: nova-core: gsp: fix improper indexing in driver_read_area

 drivers/gpu/nova-core/gsp/cmdq.rs | 68 +++++++++++++++++++++++----------------
 1 file changed, 40 insertions(+), 28 deletions(-)
---
base-commit: 6ea52b6d8f33ae627f4dcf43b12b6e713a8b9331
change-id: 20260121-nova-core-cmdq1-6aaa369824c4

Best regards,
-- 
Eliot Courtney <ecourtney@nvidia.com>


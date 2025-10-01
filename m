Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8ECBAF148
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 06:18:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1953110E663;
	Wed,  1 Oct 2025 04:18:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="huix4qyu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010057.outbound.protection.outlook.com [52.101.85.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F6BD10E659
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 04:18:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kwRIsZsQSUUAEKMcT19C0K+qg0bdGpO/w4fJyhx5EP58VzIletnOKVGuMeWy9ng45X84LoCS/CL4WYuF7F4C2s0P+vu0jELbe4etmH+E6eoz1DbKHh1u15kOCYmyqxE9Vxv9zulaM6s82ZIPZFvVKlabsLXo9ZlQYu0d5ffMiNzmQSPzMu0liivcUfTW5iXlRQiWj/WE8H9EX2mZYT+1Ohxl1xKrsHtMPrqKM2uLqIwWZIp+QPhxTBlZ1N0JwWdVPQpCoWmNPWxq/fW8V5TrKtCGN+30RyXa1yj436aXU5lZppIcQVYCGMG61IdeTYoww49w80gSUO3kq384pt3Q3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0VYFplCbc036V6MzJFv/yhSvzHuxt/VlkJ6SzRpChXg=;
 b=ko86TjFrwWfQLqacYI6Rj6pD3dy3c1kRBuRq5Ae/w7jsb2qZQe5Jw5iOhCb+eueUdKNNjDneSM4Ctk40MERrWCSiBfaU7bRnIoG3BTpmsSXD1NuV61528uxgJ9NNGkaAPSlE6vGiTQcof++T6VqMvTRuIPKL1FOM9gNIpNfmsxXFODnDOJXUZzuhUNizohEi3v4s/jPoxIeTZ3YzLKzG5ekFj1gsBWX5tK4OTwtLeyvnB0l9OFrxoYGCN5Sjq/1eae/eu5C66SDwsHzSt3abZqMHlK+NFuE/gPrX7KuoBjFOYb8E8eaAtmHJ9WXOVNUjnhYN+nXL37Utats62sy79Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0VYFplCbc036V6MzJFv/yhSvzHuxt/VlkJ6SzRpChXg=;
 b=huix4qyuq9ra62bVKtjCAls7n7BAFArB42F8rB7rKe9qJwiM3dAc4uvKdV/5OfRDIWTJ7ARIFEULtcoBhBoWRv8uaXjOHjBEFnkaqgR8q1te1smh9Dx3k76BT6fqGNLXrqXB11Q4wXhH0g6naubnphyJaQpUMSK90nkRtXxdKfyXPVVrei+T+R9+nR6aiR0NhsHKzGgcArxBlGMr6BSwXpLFVGRFkoMKnRv20RiaUztHebd7ypFgKOyyle7JuAVtj8GCprzKiCsWHhZAVUzSuVhxqtYKIBcnwt4W4hA5WJvxqrqT3rIDtIr2L3foyXghHXMJqYtAipzwnIWSAZIHhQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB6494.namprd12.prod.outlook.com (2603:10b6:8:ba::19) by
 DM6PR12MB4281.namprd12.prod.outlook.com (2603:10b6:5:21e::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.18; Wed, 1 Oct 2025 04:18:40 +0000
Received: from DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11]) by DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11%6]) with mapi id 15.20.9160.015; Wed, 1 Oct 2025
 04:18:40 +0000
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
Subject: Re: [PATCH v3 09/22] gpu: host1x: convert MIPI to use operation
 function pointers
Date: Wed, 01 Oct 2025 13:18:37 +0900
Message-ID: <40456849.J2Yia2DhmK@senjougahara>
In-Reply-To: <20250925151648.79510-10-clamor95@gmail.com>
References: <20250925151648.79510-1-clamor95@gmail.com>
 <20250925151648.79510-10-clamor95@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCP286CA0223.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::11) To DM4PR12MB6494.namprd12.prod.outlook.com
 (2603:10b6:8:ba::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6494:EE_|DM6PR12MB4281:EE_
X-MS-Office365-Filtering-Correlation-Id: 586860af-aa58-4322-155c-08de00a199e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|7416014|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VldnbFdIWFV3THVkMGpBdGtibFlIckpTdHVsUjlWNGFSQTVtTUhiRUFmZ1Yz?=
 =?utf-8?B?V3dLZDZ3SjN1OWU2SXd2U3hHOXM5RUFkVlYxSWVFdG1PU2JLZ0FyWjJhYzR4?=
 =?utf-8?B?QlR0RC9CdjQ0U1BjbXpMTlpVTm9hU0xSSmxHejErQ3R5MVhlaHpNcDgwZHRi?=
 =?utf-8?B?OVcxNmh5YlNzaW1ESldubTdpcDE4Z2FydUJtWnMvcTErN3Z0NitieTVoNkNS?=
 =?utf-8?B?TE5QNjRia0ZVcWhMdlFTSGs4bmxQYkI1Z2dxWkRvRXVKVVl2UTlQMkhWRGdz?=
 =?utf-8?B?Z0tidG8xcDdwcVhQcC9EcUhpRFQ0Ymk5Rm9hQ0k0cys5UWJiYytxcjhzeHRl?=
 =?utf-8?B?Q0s0QkQ3Qnl3YXZUdHFXZDV0QmtCUFd0Nk9pemVmUW80N3VXS0lwZXNybmlY?=
 =?utf-8?B?Vk5hcDIweVJBOTlxS25zSndWalpoR1RzZEllUUg1bmQzWnJJWFQ4RVd1L1BW?=
 =?utf-8?B?cXZuY250dVV4RTFLb3VPT1BKa3JDTWJtUUNwZlJUdDk5eXdUTW83RlNuRzRO?=
 =?utf-8?B?VWVxcGU3Vm0zRzJuVFVKZUQxdmJERzhtSUtjVEVXSSt1dEdYQjMvRzFIRnBO?=
 =?utf-8?B?c1l0bTlIL1RucU5BUjNCNVYzUGdoMDFLQ1d0YTl3RlNKTE8yMld2bVZGc3gz?=
 =?utf-8?B?bkV0VDVkMzA5bVpqT2ROWENOeVhteThDc3RLeDM5YkEyQndoVnBhNm5oVXdG?=
 =?utf-8?B?U0hFcm9lZ2EwTjlaMS9wOUlLaEtmbUNXejJuYk9odDl4dkUyK1dmdmN5TzI5?=
 =?utf-8?B?UmIvaDNPYW9mVUpSdzRyRjZyUTNBSEY0Q0kxYXptR2VBRmppbEJ2c2JicnAv?=
 =?utf-8?B?Rm44ZXhhVVdWeVBvdEovanZGTmEwNXJSMjIvZDlObVo4SVZNbGV3Si9iOC9R?=
 =?utf-8?B?NXJMcjhQOVhGSEZxVzcrcEo0WGZBRW5LdkpNbENqOWg0dDF0N1RVRHZVTThR?=
 =?utf-8?B?TWJ4SmhHcWhJK05kWkdhZ0k4anBJTzdGVXE2ZDl0MkQ3N0F6OWJqOFBiZWZh?=
 =?utf-8?B?YmVSNEVtWVVNZUJKdElWUTJRODMvdzU3MXczRzdnZC9DcmtiYWlUUGdrMjdm?=
 =?utf-8?B?Uk9XdkZQWXFyekFFeU92NHN3aUF1K3JZTXl5b01ab2M3ejFkTldpRWt4WmZv?=
 =?utf-8?B?dUlmcVBwWFlualU2UklUbU9ES1AvdTZXNUIySnlEVmVncVdJMG1EVHlDdHdG?=
 =?utf-8?B?SkkwaTlVeDJGZUR3Qi9WM0ZiQXMrUGNzaDVxWUpUd214V3pPQ3BrdmxMZXhQ?=
 =?utf-8?B?YXJYYjhJMUNjSW0rZkgyZmpiTUpEUWdJZ0ZldEJpNnVOYTZ3alpPdWo5SGtH?=
 =?utf-8?B?TFBWR3VSOWxJZ3dBKyszV0NsanFpMnBVcU1uTGRpYlFHcllBYWI3SGc5L1BC?=
 =?utf-8?B?WFRSWEpwdmhtdGpYTmNiVEhDNDROcWVUcm5pTFljVUhTRklxbVYwWnV5ZXc0?=
 =?utf-8?B?NDZ1OVBVOERrQWY1SThIK282d0pNWllYSGlDdGFxRmp0cnZqOEdyekk5WW1o?=
 =?utf-8?B?SmxBVElSM3BlV2Yrd0gyVVIzb1l1eHhNbGNBKzlaelNXNWVmRHhJMk9kdlZC?=
 =?utf-8?B?ZUFOSGlFbGphWlFXUk1vQTkzMWc0dy9Dc0FHaHhCL0lESUc3Vy9rMUYxbHN6?=
 =?utf-8?B?MkUzYzByWU9Nd3hCZldoUThRYnNGcTliaXM0Sm8wNmhVRlNSNkI4UktqQUln?=
 =?utf-8?B?YWNlSHJHREthRDFLRW1XODdVZGpqeFFvTTlOU2NEWTVsb0cwb3JVWng0czRn?=
 =?utf-8?B?WDZaRm9HczhGTnZyVk41ZTlHaWp1bUFJMmlMb1VHc2hTKzF0akdhdVdVYyt4?=
 =?utf-8?B?WDZTMFJxSnJzQkZ3MmtqT2pEak4zRURHR2E2OTdia1hxVHUvYlJweXVKRFdx?=
 =?utf-8?B?b200YjhkMTR1ODlRT0V3WW9paXVHYTJaSmk0RTNSMVBuVHQzZjZjWXYycjYw?=
 =?utf-8?B?ZUJDdTU3bTlSbDlvYVpBRnBqTmxtOVAzNElZMnljcWVOV0lPVXVzQVBHSW13?=
 =?utf-8?Q?FdI0cXr2Vbls1pjbM6Jln7DkDkmRPQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6494.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(7416014)(376014)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmRlTCtnUDE0SVB4STBseXM4VzhYMmJiV0JzYVZGYnByVC9WMER2dncyRksv?=
 =?utf-8?B?bklqSURzemNyTnFEdGE3Q0ljRGhPU3BaQ2p0ZyttZjlkcXpaTk9YaDlsaVgx?=
 =?utf-8?B?NHZ5OGptMmdxanNCUXlzZHowOXlRSlErMXlsbHlWZUVMM0FqOFFtUCtKNitt?=
 =?utf-8?B?dFdzUUl1OWg3d0YxdnZPbVVkN1FOWkk5YUhZOUlEOGFReEVZOWk1UHM3eXlD?=
 =?utf-8?B?MDRXWndoanFKZ3JMbEdNV2JXR0UzOW8xRThaQXhaTnNZSUhsTmJaOXhBQS9q?=
 =?utf-8?B?NUNOR3NwZytRRWFHK0JoU1k0VmZFTzltbTI2RjFUdHN4T3RZVk1CWW9Valg0?=
 =?utf-8?B?dWpHUzhZM0tnQmM1MVducW8zcTR0NXczMFZ2OFlsWjRPdzZDRXhybTE3TEhM?=
 =?utf-8?B?UUNWamR5aU05N1l4WHVyWVg0eXlucElYeEt2K2tFK1QrSXk0SlV5NHZLWTdk?=
 =?utf-8?B?R0dhUG9FRFRYTGhFSTJvVEpGc2YxeVNBNjdSd1F4bDRUUlJvdUhGcVQvc2pN?=
 =?utf-8?B?azdiWm8rdjNtZXBpSi9BanRXajdLa0tVTkFVd0RmUGFyYldJNUtlVUIzVFNw?=
 =?utf-8?B?d2FhNG8wMld1bXFLNEVIV0FVRHhOak1aMzBxOXZOaTdDTHpPVFBZbWVESXNx?=
 =?utf-8?B?VGJ2LzFpN1RubXRGc1BycVJRNWF4bjd4czBkcHJNdVQ2NGsxVXltR25zOTNy?=
 =?utf-8?B?WDhzYitIWlRvQ0loZHFCM3EyTHVlWVN0UXJxQlEvQ0NPa3dpQ0NNMTJCUGpr?=
 =?utf-8?B?TUVNMUhsOU1DRVdlNEI0amFsZUdUMnBCY2hZbnYrMUVvaFNJRFdaaXl1NkNS?=
 =?utf-8?B?YnFXREQyc0lRcno1dklpNThQOGZSN1NMampLWXp6emoxa0g4aFM5K29PSERH?=
 =?utf-8?B?dnpaMmpvMXIzZjMzV0JIaWZDUGt6cEJic2FmN0FZWTlremRqWVprcmU1OWlV?=
 =?utf-8?B?c0hOcEcyV0RKYUVEck1BVk43SE1VWUlJU1orREJwQXBRQS9iNVlIQUxiR2JZ?=
 =?utf-8?B?bXhsY2I0cS8vd3VKUlh6MndQSlY4SVdSY2Qrd3JKbi9jZCtNRGQyb2JDWkdF?=
 =?utf-8?B?QUhKOUsvTCs5UEF1aFQ1QXdrNmRzcUlwYmd6aHc5Z1hNVnRFRmFZQjZPK2s2?=
 =?utf-8?B?UDJ0OFZ0TzYrR2t3Q3kwdUtPeTNBeE92WFY2cmZ3TmdLb1pYWnFMdk4wSXRO?=
 =?utf-8?B?SGxCU2hZZEtiV0ZlbUF3ZWtRcm9BQzJ6U1pjMzFhVm0ydDZ2ZTFtaUdrVlAr?=
 =?utf-8?B?ODhsRWc5a296Q0wybEhqWVpHakkyNEVqSkV6SVRGY2ovb0cxSGJyWTF0aU9k?=
 =?utf-8?B?YThNcFpOYjdqRE5wNk96bmxaTFdyczJCYytSRFgrWS9xSjZUQ0ZpZi8zVlo3?=
 =?utf-8?B?dE03MUNmSDlOYzR0ZGhlRGYwc20ydi94cVh3cXpLVG5rcXp2ZlU0V29PQXN6?=
 =?utf-8?B?RFhzRmZMWm1PQktqL0VDS1RUeHR5Z3JYZjZNNnF3Q01TaVN4UFQ4bmFEelBP?=
 =?utf-8?B?Qm56b1lnTFo2dTV0QXFDS3hQNnhjS1VNYW9TUXZFTmpPd0dNT1RaNFZ5bXht?=
 =?utf-8?B?RDlWbTdiMEZ5cUpnVXZqcStYZTY5YmF4YnpqdkxkOUNwTUdUUXVwak5TNmlE?=
 =?utf-8?B?MHFva1IraGcyTUJXN3k1d01XUU5NU1I2OE5yNXo1eHdDczFPd2s0NHFCdHVl?=
 =?utf-8?B?aU9HTkN4blZkU2lyM1JCY3UwcDNoYkFOdnhkRktpL1NsOUpJaUE0QXlneW85?=
 =?utf-8?B?WmhBRjBaTUVHU0IzTWFHSWlDc0YzNWJHejVtM1lRN0VWSlV4U1NYN20rOTdP?=
 =?utf-8?B?MWhkcFl2U0NRNFlEUlUrb0NoQUIxeUtBZ3hXaEZUVWs5Yzl0UzNGQTVVazdy?=
 =?utf-8?B?TzhvTjlJNTRoOGxoa1VWckFQenJIdEhJaUFobFV1R2FuMmtQekdDVGpOdzNS?=
 =?utf-8?B?YlVKK2R1clFZUHVJODAyM0dVNDU5aXZiaEw3b1RYRHIyU0ZWMHZJeXVTYk1h?=
 =?utf-8?B?QXNRZXdKOHk3OFBFZ1FtcVNtc3o0bzEvRFhCL0ZqOVRmcHJWSzkxYnc5eXgz?=
 =?utf-8?B?ckZ5VW1TL3ZxelhFS2VOS1JrMWJ1QkIxSWhsN2ZxNDF3c0VkV2Y1eWdlVGE5?=
 =?utf-8?B?cEt6TDFxdldQQkgxOTFUb05xbFRndDhtU1J6MlpwdFdNSWVjLy9uRGhocWZF?=
 =?utf-8?B?am9YUXNCSHFtZFc5ZzJsNFZjd1lpRWhFM0xWTk85OWRJVC9qeVhIa1dMcFNU?=
 =?utf-8?B?cmpJbDF1MWhSTkRobEdwQkFLd3Z3PT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 586860af-aa58-4322-155c-08de00a199e5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6494.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 04:18:40.8132 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ilndaIISiljrFsW3fruKWHYt4Td6MLDBkDg+AubWcv32w1yAmJr2prg8mgxdBAbNDQoEZeAuJxFqc+wVoDeyog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4281
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
> Convert existing MIPI code to use operation function pointers, a necessar=
y
> step for supporting Tegra20/Tegra30 SoCs. All common MIPI configuration
> that is SoC-independent remains in mipi.c, while all SoC-specific code is
> moved to tegra114-mipi.c (The naming matches the first SoC generation wit=
h
> a dedicated calibration block). Shared structures and function calls are
> placed into tegra-mipi-cal.h.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/gpu/drm/tegra/dsi.c             |   1 +
>  drivers/gpu/host1x/Makefile             |   1 +
>  drivers/gpu/host1x/dev.c                |   2 +
>  drivers/gpu/host1x/dev.h                |   2 +
>  drivers/gpu/host1x/mipi.c               | 501 +++---------------------
>  drivers/gpu/host1x/tegra114-mipi.c      | 483 +++++++++++++++++++++++
>  drivers/staging/media/tegra-video/csi.c |   1 +
>  include/linux/host1x.h                  |  10 -
>  include/linux/tegra-mipi-cal.h          |  56 +++
>  9 files changed, 594 insertions(+), 463 deletions(-)
>  create mode 100644 drivers/gpu/host1x/tegra114-mipi.c
>  create mode 100644 include/linux/tegra-mipi-cal.h
>=20
> diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
> index 64f12a85a9dd..278bf2c85524 100644
> --- a/drivers/gpu/drm/tegra/dsi.c
> +++ b/drivers/gpu/drm/tegra/dsi.c
> @@ -14,6 +14,7 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/reset.h>
> +#include <linux/tegra-mipi-cal.h>
> =20
>  #include <video/mipi_display.h>
> =20
> diff --git a/drivers/gpu/host1x/Makefile b/drivers/gpu/host1x/Makefile
> index ee5286ffe08d..fead483af0b4 100644
> --- a/drivers/gpu/host1x/Makefile
> +++ b/drivers/gpu/host1x/Makefile
> @@ -9,6 +9,7 @@ host1x-y =3D \
>  	job.o \
>  	debug.o \
>  	mipi.o \
> +	tegra114-mipi.o \
>  	fence.o \
>  	hw/host1x01.o \
>  	hw/host1x02.o \
> diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
> index 1f93e5e276c0..6c403c8e867b 100644
> --- a/drivers/gpu/host1x/dev.c
> +++ b/drivers/gpu/host1x/dev.c
> @@ -782,7 +782,9 @@ static struct platform_driver tegra_host1x_driver =3D=
 {
> =20
>  static struct platform_driver * const drivers[] =3D {
>  	&tegra_host1x_driver,
> +#if !defined(CONFIG_ARCH_TEGRA_2x_SOC) && !defined(CONFIG_ARCH_TEGRA_3x_=
SOC)
>  	&tegra_mipi_driver,
> +#endif

This will disable the driver on multi-SoC configurations like multi_v7_defc=
onfig. We can build in both providers, they just won't be both be probed on=
 any one SoC.

Otherwise looks good.

>  };
> =20
>  static int __init tegra_host1x_init(void)
> diff --git a/drivers/gpu/host1x/dev.h b/drivers/gpu/host1x/dev.h
> index d3855a1c6b47..9be9669d3b1c 100644
> --- a/drivers/gpu/host1x/dev.h
> +++ b/drivers/gpu/host1x/dev.h
> @@ -354,6 +354,8 @@ static inline void host1x_hw_show_mlocks(struct host1=
x *host, struct output *o)
>  	host->debug_op->show_mlocks(host, o);
>  }
> =20
> +#if !defined(CONFIG_ARCH_TEGRA_2x_SOC) && !defined(CONFIG_ARCH_TEGRA_3x_=
SOC)
>  extern struct platform_driver tegra_mipi_driver;
> +#endif
> =20
>  #endif
> diff --git a/drivers/gpu/host1x/mipi.c b/drivers/gpu/host1x/mipi.c
> index e51b43dd15a3..1695e6f3b0d0 100644
> --- a/drivers/gpu/host1x/mipi.c
> +++ b/drivers/gpu/host1x/mipi.c
> @@ -21,195 +21,60 @@
>   */
> =20
>  #include <linux/clk.h>
> -#include <linux/host1x.h>
>  #include <linux/io.h>
>  #include <linux/iopoll.h>
> +#include <linux/of.h>
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
> +#include <linux/tegra-mipi-cal.h>
> =20
> -#include "dev.h"
> +/* only need to support one provider */
> +static struct {
> +	struct device_node *np;
> +	const struct tegra_mipi_ops *ops;
> +} provider;
> =20
> -#define MIPI_CAL_CTRL			0x00
> -#define MIPI_CAL_CTRL_NOISE_FILTER(x)	(((x) & 0xf) << 26)
> -#define MIPI_CAL_CTRL_PRESCALE(x)	(((x) & 0x3) << 24)
> -#define MIPI_CAL_CTRL_CLKEN_OVR		(1 << 4)
> -#define MIPI_CAL_CTRL_START		(1 << 0)
> -
> -#define MIPI_CAL_AUTOCAL_CTRL		0x01
> -
> -#define MIPI_CAL_STATUS			0x02
> -#define MIPI_CAL_STATUS_DONE		(1 << 16)
> -#define MIPI_CAL_STATUS_ACTIVE		(1 <<  0)
> -
> -#define MIPI_CAL_CONFIG_CSIA		0x05
> -#define MIPI_CAL_CONFIG_CSIB		0x06
> -#define MIPI_CAL_CONFIG_CSIC		0x07
> -#define MIPI_CAL_CONFIG_CSID		0x08
> -#define MIPI_CAL_CONFIG_CSIE		0x09
> -#define MIPI_CAL_CONFIG_CSIF		0x0a
> -#define MIPI_CAL_CONFIG_DSIA		0x0e
> -#define MIPI_CAL_CONFIG_DSIB		0x0f
> -#define MIPI_CAL_CONFIG_DSIC		0x10
> -#define MIPI_CAL_CONFIG_DSID		0x11
> -
> -#define MIPI_CAL_CONFIG_DSIA_CLK	0x19
> -#define MIPI_CAL_CONFIG_DSIB_CLK	0x1a
> -#define MIPI_CAL_CONFIG_CSIAB_CLK	0x1b
> -#define MIPI_CAL_CONFIG_DSIC_CLK	0x1c
> -#define MIPI_CAL_CONFIG_CSICD_CLK	0x1c
> -#define MIPI_CAL_CONFIG_DSID_CLK	0x1d
> -#define MIPI_CAL_CONFIG_CSIE_CLK	0x1d
> -
> -/* for data and clock lanes */
> -#define MIPI_CAL_CONFIG_SELECT		(1 << 21)
> -
> -/* for data lanes */
> -#define MIPI_CAL_CONFIG_HSPDOS(x)	(((x) & 0x1f) << 16)
> -#define MIPI_CAL_CONFIG_HSPUOS(x)	(((x) & 0x1f) <<  8)
> -#define MIPI_CAL_CONFIG_TERMOS(x)	(((x) & 0x1f) <<  0)
> -
> -/* for clock lanes */
> -#define MIPI_CAL_CONFIG_HSCLKPDOSD(x)	(((x) & 0x1f) <<  8)
> -#define MIPI_CAL_CONFIG_HSCLKPUOSD(x)	(((x) & 0x1f) <<  0)
> -
> -#define MIPI_CAL_BIAS_PAD_CFG0		0x16
> -#define MIPI_CAL_BIAS_PAD_PDVCLAMP	(1 << 1)
> -#define MIPI_CAL_BIAS_PAD_E_VCLAMP_REF	(1 << 0)
> -
> -#define MIPI_CAL_BIAS_PAD_CFG1		0x17
> -#define MIPI_CAL_BIAS_PAD_DRV_DN_REF(x) (((x) & 0x7) << 16)
> -#define MIPI_CAL_BIAS_PAD_DRV_UP_REF(x) (((x) & 0x7) << 8)
> -
> -#define MIPI_CAL_BIAS_PAD_CFG2		0x18
> -#define MIPI_CAL_BIAS_PAD_VCLAMP(x)	(((x) & 0x7) << 16)
> -#define MIPI_CAL_BIAS_PAD_VAUXP(x)	(((x) & 0x7) << 4)
> -#define MIPI_CAL_BIAS_PAD_PDVREG	(1 << 1)
> -
> -struct tegra_mipi_pad {
> -	unsigned long data;
> -	unsigned long clk;
> -};
> -
> -struct tegra_mipi_soc {
> -	bool has_clk_lane;
> -	const struct tegra_mipi_pad *pads;
> -	unsigned int num_pads;
> -
> -	bool clock_enable_override;
> -	bool needs_vclamp_ref;
> -
> -	/* bias pad configuration settings */
> -	u8 pad_drive_down_ref;
> -	u8 pad_drive_up_ref;
> -
> -	u8 pad_vclamp_level;
> -	u8 pad_vauxp_level;
> -
> -	/* calibration settings for data lanes */
> -	u8 hspdos;
> -	u8 hspuos;
> -	u8 termos;
> -
> -	/* calibration settings for clock lanes */
> -	u8 hsclkpdos;
> -	u8 hsclkpuos;
> -};
> -
> -struct tegra_mipi {
> -	const struct tegra_mipi_soc *soc;
> -	struct device *dev;
> -	void __iomem *regs;
> -	struct mutex lock;
> -	struct clk *clk;
> -
> -	unsigned long usage_count;
> -};
> -
> -struct tegra_mipi_device {
> -	struct platform_device *pdev;
> -	struct tegra_mipi *mipi;
> -	struct device *device;
> -	unsigned long pads;
> -};
> -
> -static inline u32 tegra_mipi_readl(struct tegra_mipi *mipi,
> -				   unsigned long offset)
> +int tegra_mipi_enable(struct tegra_mipi_device *device)
>  {
> -	return readl(mipi->regs + (offset << 2));
> -}
> +	if (device->ops->enable)
> +		return device->ops->enable(device);
> =20
> -static inline void tegra_mipi_writel(struct tegra_mipi *mipi, u32 value,
> -				     unsigned long offset)
> -{
> -	writel(value, mipi->regs + (offset << 2));
> +	return 0;
>  }
> +EXPORT_SYMBOL(tegra_mipi_enable);
> =20
> -static int tegra_mipi_power_up(struct tegra_mipi *mipi)
> +int tegra_mipi_disable(struct tegra_mipi_device *device)
>  {
> -	u32 value;
> -	int err;
> -
> -	err =3D clk_enable(mipi->clk);
> -	if (err < 0)
> -		return err;
> -
> -	value =3D tegra_mipi_readl(mipi, MIPI_CAL_BIAS_PAD_CFG0);
> -	value &=3D ~MIPI_CAL_BIAS_PAD_PDVCLAMP;
> -
> -	if (mipi->soc->needs_vclamp_ref)
> -		value |=3D MIPI_CAL_BIAS_PAD_E_VCLAMP_REF;
> -
> -	tegra_mipi_writel(mipi, value, MIPI_CAL_BIAS_PAD_CFG0);
> -
> -	value =3D tegra_mipi_readl(mipi, MIPI_CAL_BIAS_PAD_CFG2);
> -	value &=3D ~MIPI_CAL_BIAS_PAD_PDVREG;
> -	tegra_mipi_writel(mipi, value, MIPI_CAL_BIAS_PAD_CFG2);
> -
> -	clk_disable(mipi->clk);
> +	if (device->ops->disable)
> +		return device->ops->disable(device);
> =20
>  	return 0;
>  }
> +EXPORT_SYMBOL(tegra_mipi_disable);
> =20
> -static int tegra_mipi_power_down(struct tegra_mipi *mipi)
> +int tegra_mipi_start_calibration(struct tegra_mipi_device *device)
>  {
> -	u32 value;
> -	int err;
> +	if (device->ops->start_calibration)
> +		return device->ops->start_calibration(device);
> =20
> -	err =3D clk_enable(mipi->clk);
> -	if (err < 0)
> -		return err;
> -
> -	/*
> -	 * The MIPI_CAL_BIAS_PAD_PDVREG controls a voltage regulator that
> -	 * supplies the DSI pads. This must be kept enabled until none of the
> -	 * DSI lanes are used anymore.
> -	 */
> -	value =3D tegra_mipi_readl(mipi, MIPI_CAL_BIAS_PAD_CFG2);
> -	value |=3D MIPI_CAL_BIAS_PAD_PDVREG;
> -	tegra_mipi_writel(mipi, value, MIPI_CAL_BIAS_PAD_CFG2);
> -
> -	/*
> -	 * MIPI_CAL_BIAS_PAD_PDVCLAMP and MIPI_CAL_BIAS_PAD_E_VCLAMP_REF
> -	 * control a regulator that supplies current to the pre-driver logic.
> -	 * Powering down this regulator causes DSI to fail, so it must remain
> -	 * powered on until none of the DSI lanes are used anymore.
> -	 */
> -	value =3D tegra_mipi_readl(mipi, MIPI_CAL_BIAS_PAD_CFG0);
> -
> -	if (mipi->soc->needs_vclamp_ref)
> -		value &=3D ~MIPI_CAL_BIAS_PAD_E_VCLAMP_REF;
> +	return 0;
> +}
> +EXPORT_SYMBOL(tegra_mipi_start_calibration);
> =20
> -	value |=3D MIPI_CAL_BIAS_PAD_PDVCLAMP;
> -	tegra_mipi_writel(mipi, value, MIPI_CAL_BIAS_PAD_CFG0);
> +int tegra_mipi_finish_calibration(struct tegra_mipi_device *device)
> +{
> +	if (device->ops->finish_calibration)
> +		return device->ops->finish_calibration(device);
> =20
>  	return 0;
>  }
> +EXPORT_SYMBOL(tegra_mipi_finish_calibration);
> =20
>  struct tegra_mipi_device *tegra_mipi_request(struct device *device,
>  					     struct device_node *np)
>  {
> -	struct tegra_mipi_device *dev;
> +	struct tegra_mipi_device *mipidev;
>  	struct of_phandle_args args;
>  	int err;
> =20
> @@ -219,321 +84,51 @@ struct tegra_mipi_device *tegra_mipi_request(struct=
 device *device,
>  	if (err < 0)
>  		return ERR_PTR(err);
> =20
> -	dev =3D kzalloc(sizeof(*dev), GFP_KERNEL);
> -	if (!dev) {
> +	if (provider.np !=3D args.np)
> +		return ERR_PTR(-ENODEV);
> +
> +	mipidev =3D kzalloc(sizeof(*mipidev), GFP_KERNEL);
> +	if (!mipidev) {
>  		err =3D -ENOMEM;
>  		goto out;
>  	}
> =20
> -	dev->pdev =3D of_find_device_by_node(args.np);
> -	if (!dev->pdev) {
> +	mipidev->pdev =3D of_find_device_by_node(args.np);
> +	if (!mipidev->pdev) {
>  		err =3D -ENODEV;
>  		goto free;
>  	}
> =20
> -	dev->mipi =3D platform_get_drvdata(dev->pdev);
> -	if (!dev->mipi) {
> -		err =3D -EPROBE_DEFER;
> -		goto put;
> -	}
> -
>  	of_node_put(args.np);
> =20
> -	dev->pads =3D args.args[0];
> -	dev->device =3D device;
> +	mipidev->ops =3D provider.ops;
> +	mipidev->pads =3D args.args[0];
> =20
> -	return dev;
> +	return mipidev;
> =20
> -put:
> -	platform_device_put(dev->pdev);
>  free:
> -	kfree(dev);
> +	kfree(mipidev);
>  out:
>  	of_node_put(args.np);
>  	return ERR_PTR(err);
>  }
>  EXPORT_SYMBOL(tegra_mipi_request);
> =20
> -void tegra_mipi_free(struct tegra_mipi_device *device)
> +void tegra_mipi_free(struct tegra_mipi_device *mipidev)
>  {
> -	platform_device_put(device->pdev);
> -	kfree(device);
> +	platform_device_put(mipidev->pdev);
> +	kfree(mipidev);
>  }
>  EXPORT_SYMBOL(tegra_mipi_free);
> =20
> -int tegra_mipi_enable(struct tegra_mipi_device *dev)
> -{
> -	int err =3D 0;
> -
> -	mutex_lock(&dev->mipi->lock);
> -
> -	if (dev->mipi->usage_count++ =3D=3D 0)
> -		err =3D tegra_mipi_power_up(dev->mipi);
> -
> -	mutex_unlock(&dev->mipi->lock);
> -
> -	return err;
> -
> -}
> -EXPORT_SYMBOL(tegra_mipi_enable);
> -
> -int tegra_mipi_disable(struct tegra_mipi_device *dev)
> +int tegra_mipi_add_provider(struct device_node *np, const struct tegra_m=
ipi_ops *ops)
>  {
> -	int err =3D 0;
> +	if (provider.np)
> +		return -EBUSY;
> =20
> -	mutex_lock(&dev->mipi->lock);
> -
> -	if (--dev->mipi->usage_count =3D=3D 0)
> -		err =3D tegra_mipi_power_down(dev->mipi);
> -
> -	mutex_unlock(&dev->mipi->lock);
> -
> -	return err;
> -
> -}
> -EXPORT_SYMBOL(tegra_mipi_disable);
> -
> -int tegra_mipi_finish_calibration(struct tegra_mipi_device *device)
> -{
> -	struct tegra_mipi *mipi =3D device->mipi;
> -	void __iomem *status_reg =3D mipi->regs + (MIPI_CAL_STATUS << 2);
> -	u32 value;
> -	int err;
> -
> -	err =3D readl_relaxed_poll_timeout(status_reg, value,
> -					 !(value & MIPI_CAL_STATUS_ACTIVE) &&
> -					 (value & MIPI_CAL_STATUS_DONE), 50,
> -					 250000);
> -	mutex_unlock(&device->mipi->lock);
> -	clk_disable(device->mipi->clk);
> -
> -	return err;
> -}
> -EXPORT_SYMBOL(tegra_mipi_finish_calibration);
> -
> -int tegra_mipi_start_calibration(struct tegra_mipi_device *device)
> -{
> -	const struct tegra_mipi_soc *soc =3D device->mipi->soc;
> -	unsigned int i;
> -	u32 value;
> -	int err;
> -
> -	err =3D clk_enable(device->mipi->clk);
> -	if (err < 0)
> -		return err;
> -
> -	mutex_lock(&device->mipi->lock);
> -
> -	value =3D MIPI_CAL_BIAS_PAD_DRV_DN_REF(soc->pad_drive_down_ref) |
> -		MIPI_CAL_BIAS_PAD_DRV_UP_REF(soc->pad_drive_up_ref);
> -	tegra_mipi_writel(device->mipi, value, MIPI_CAL_BIAS_PAD_CFG1);
> -
> -	value =3D tegra_mipi_readl(device->mipi, MIPI_CAL_BIAS_PAD_CFG2);
> -	value &=3D ~MIPI_CAL_BIAS_PAD_VCLAMP(0x7);
> -	value &=3D ~MIPI_CAL_BIAS_PAD_VAUXP(0x7);
> -	value |=3D MIPI_CAL_BIAS_PAD_VCLAMP(soc->pad_vclamp_level);
> -	value |=3D MIPI_CAL_BIAS_PAD_VAUXP(soc->pad_vauxp_level);
> -	tegra_mipi_writel(device->mipi, value, MIPI_CAL_BIAS_PAD_CFG2);
> -
> -	for (i =3D 0; i < soc->num_pads; i++) {
> -		u32 clk =3D 0, data =3D 0;
> -
> -		if (device->pads & BIT(i)) {
> -			data =3D MIPI_CAL_CONFIG_SELECT |
> -			       MIPI_CAL_CONFIG_HSPDOS(soc->hspdos) |
> -			       MIPI_CAL_CONFIG_HSPUOS(soc->hspuos) |
> -			       MIPI_CAL_CONFIG_TERMOS(soc->termos);
> -			clk =3D MIPI_CAL_CONFIG_SELECT |
> -			      MIPI_CAL_CONFIG_HSCLKPDOSD(soc->hsclkpdos) |
> -			      MIPI_CAL_CONFIG_HSCLKPUOSD(soc->hsclkpuos);
> -		}
> -
> -		tegra_mipi_writel(device->mipi, data, soc->pads[i].data);
> -
> -		if (soc->has_clk_lane && soc->pads[i].clk !=3D 0)
> -			tegra_mipi_writel(device->mipi, clk, soc->pads[i].clk);
> -	}
> -
> -	value =3D tegra_mipi_readl(device->mipi, MIPI_CAL_CTRL);
> -	value &=3D ~MIPI_CAL_CTRL_NOISE_FILTER(0xf);
> -	value &=3D ~MIPI_CAL_CTRL_PRESCALE(0x3);
> -	value |=3D MIPI_CAL_CTRL_NOISE_FILTER(0xa);
> -	value |=3D MIPI_CAL_CTRL_PRESCALE(0x2);
> -
> -	if (!soc->clock_enable_override)
> -		value &=3D ~MIPI_CAL_CTRL_CLKEN_OVR;
> -	else
> -		value |=3D MIPI_CAL_CTRL_CLKEN_OVR;
> -
> -	tegra_mipi_writel(device->mipi, value, MIPI_CAL_CTRL);
> -
> -	/* clear any pending status bits */
> -	value =3D tegra_mipi_readl(device->mipi, MIPI_CAL_STATUS);
> -	tegra_mipi_writel(device->mipi, value, MIPI_CAL_STATUS);
> -
> -	value =3D tegra_mipi_readl(device->mipi, MIPI_CAL_CTRL);
> -	value |=3D MIPI_CAL_CTRL_START;
> -	tegra_mipi_writel(device->mipi, value, MIPI_CAL_CTRL);
> -
> -	/*
> -	 * Wait for min 72uS to let calibration logic finish calibration
> -	 * sequence codes before waiting for pads idle state to apply the
> -	 * results.
> -	 */
> -	usleep_range(75, 80);
> -
> -	return 0;
> -}
> -EXPORT_SYMBOL(tegra_mipi_start_calibration);
> -
> -static const struct tegra_mipi_pad tegra114_mipi_pads[] =3D {
> -	{ .data =3D MIPI_CAL_CONFIG_CSIA },
> -	{ .data =3D MIPI_CAL_CONFIG_CSIB },
> -	{ .data =3D MIPI_CAL_CONFIG_CSIC },
> -	{ .data =3D MIPI_CAL_CONFIG_CSID },
> -	{ .data =3D MIPI_CAL_CONFIG_CSIE },
> -	{ .data =3D MIPI_CAL_CONFIG_DSIA },
> -	{ .data =3D MIPI_CAL_CONFIG_DSIB },
> -	{ .data =3D MIPI_CAL_CONFIG_DSIC },
> -	{ .data =3D MIPI_CAL_CONFIG_DSID },
> -};
> -
> -static const struct tegra_mipi_soc tegra114_mipi_soc =3D {
> -	.has_clk_lane =3D false,
> -	.pads =3D tegra114_mipi_pads,
> -	.num_pads =3D ARRAY_SIZE(tegra114_mipi_pads),
> -	.clock_enable_override =3D true,
> -	.needs_vclamp_ref =3D true,
> -	.pad_drive_down_ref =3D 0x2,
> -	.pad_drive_up_ref =3D 0x0,
> -	.pad_vclamp_level =3D 0x0,
> -	.pad_vauxp_level =3D 0x0,
> -	.hspdos =3D 0x0,
> -	.hspuos =3D 0x4,
> -	.termos =3D 0x5,
> -	.hsclkpdos =3D 0x0,
> -	.hsclkpuos =3D 0x4,
> -};
> -
> -static const struct tegra_mipi_pad tegra124_mipi_pads[] =3D {
> -	{ .data =3D MIPI_CAL_CONFIG_CSIA, .clk =3D MIPI_CAL_CONFIG_CSIAB_CLK },
> -	{ .data =3D MIPI_CAL_CONFIG_CSIB, .clk =3D MIPI_CAL_CONFIG_CSIAB_CLK },
> -	{ .data =3D MIPI_CAL_CONFIG_CSIC, .clk =3D MIPI_CAL_CONFIG_CSICD_CLK },
> -	{ .data =3D MIPI_CAL_CONFIG_CSID, .clk =3D MIPI_CAL_CONFIG_CSICD_CLK },
> -	{ .data =3D MIPI_CAL_CONFIG_CSIE, .clk =3D MIPI_CAL_CONFIG_CSIE_CLK  },
> -	{ .data =3D MIPI_CAL_CONFIG_DSIA, .clk =3D MIPI_CAL_CONFIG_DSIA_CLK  },
> -	{ .data =3D MIPI_CAL_CONFIG_DSIB, .clk =3D MIPI_CAL_CONFIG_DSIB_CLK  },
> -};
> -
> -static const struct tegra_mipi_soc tegra124_mipi_soc =3D {
> -	.has_clk_lane =3D true,
> -	.pads =3D tegra124_mipi_pads,
> -	.num_pads =3D ARRAY_SIZE(tegra124_mipi_pads),
> -	.clock_enable_override =3D true,
> -	.needs_vclamp_ref =3D true,
> -	.pad_drive_down_ref =3D 0x2,
> -	.pad_drive_up_ref =3D 0x0,
> -	.pad_vclamp_level =3D 0x0,
> -	.pad_vauxp_level =3D 0x0,
> -	.hspdos =3D 0x0,
> -	.hspuos =3D 0x0,
> -	.termos =3D 0x0,
> -	.hsclkpdos =3D 0x1,
> -	.hsclkpuos =3D 0x2,
> -};
> -
> -static const struct tegra_mipi_soc tegra132_mipi_soc =3D {
> -	.has_clk_lane =3D true,
> -	.pads =3D tegra124_mipi_pads,
> -	.num_pads =3D ARRAY_SIZE(tegra124_mipi_pads),
> -	.clock_enable_override =3D false,
> -	.needs_vclamp_ref =3D false,
> -	.pad_drive_down_ref =3D 0x0,
> -	.pad_drive_up_ref =3D 0x3,
> -	.pad_vclamp_level =3D 0x0,
> -	.pad_vauxp_level =3D 0x0,
> -	.hspdos =3D 0x0,
> -	.hspuos =3D 0x0,
> -	.termos =3D 0x0,
> -	.hsclkpdos =3D 0x3,
> -	.hsclkpuos =3D 0x2,
> -};
> -
> -static const struct tegra_mipi_pad tegra210_mipi_pads[] =3D {
> -	{ .data =3D MIPI_CAL_CONFIG_CSIA, .clk =3D 0 },
> -	{ .data =3D MIPI_CAL_CONFIG_CSIB, .clk =3D 0 },
> -	{ .data =3D MIPI_CAL_CONFIG_CSIC, .clk =3D 0 },
> -	{ .data =3D MIPI_CAL_CONFIG_CSID, .clk =3D 0 },
> -	{ .data =3D MIPI_CAL_CONFIG_CSIE, .clk =3D 0 },
> -	{ .data =3D MIPI_CAL_CONFIG_CSIF, .clk =3D 0 },
> -	{ .data =3D MIPI_CAL_CONFIG_DSIA, .clk =3D MIPI_CAL_CONFIG_DSIA_CLK },
> -	{ .data =3D MIPI_CAL_CONFIG_DSIB, .clk =3D MIPI_CAL_CONFIG_DSIB_CLK },
> -	{ .data =3D MIPI_CAL_CONFIG_DSIC, .clk =3D MIPI_CAL_CONFIG_DSIC_CLK },
> -	{ .data =3D MIPI_CAL_CONFIG_DSID, .clk =3D MIPI_CAL_CONFIG_DSID_CLK },
> -};
> -
> -static const struct tegra_mipi_soc tegra210_mipi_soc =3D {
> -	.has_clk_lane =3D true,
> -	.pads =3D tegra210_mipi_pads,
> -	.num_pads =3D ARRAY_SIZE(tegra210_mipi_pads),
> -	.clock_enable_override =3D true,
> -	.needs_vclamp_ref =3D false,
> -	.pad_drive_down_ref =3D 0x0,
> -	.pad_drive_up_ref =3D 0x3,
> -	.pad_vclamp_level =3D 0x1,
> -	.pad_vauxp_level =3D 0x1,
> -	.hspdos =3D 0x0,
> -	.hspuos =3D 0x2,
> -	.termos =3D 0x0,
> -	.hsclkpdos =3D 0x0,
> -	.hsclkpuos =3D 0x2,
> -};
> -
> -static const struct of_device_id tegra_mipi_of_match[] =3D {
> -	{ .compatible =3D "nvidia,tegra114-mipi", .data =3D &tegra114_mipi_soc =
},
> -	{ .compatible =3D "nvidia,tegra124-mipi", .data =3D &tegra124_mipi_soc =
},
> -	{ .compatible =3D "nvidia,tegra132-mipi", .data =3D &tegra132_mipi_soc =
},
> -	{ .compatible =3D "nvidia,tegra210-mipi", .data =3D &tegra210_mipi_soc =
},
> -	{ },
> -};
> -
> -static int tegra_mipi_probe(struct platform_device *pdev)
> -{
> -	const struct of_device_id *match;
> -	struct tegra_mipi *mipi;
> -
> -	match =3D of_match_node(tegra_mipi_of_match, pdev->dev.of_node);
> -	if (!match)
> -		return -ENODEV;
> -
> -	mipi =3D devm_kzalloc(&pdev->dev, sizeof(*mipi), GFP_KERNEL);
> -	if (!mipi)
> -		return -ENOMEM;
> -
> -	mipi->soc =3D match->data;
> -	mipi->dev =3D &pdev->dev;
> -
> -	mipi->regs =3D devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
> -	if (IS_ERR(mipi->regs))
> -		return PTR_ERR(mipi->regs);
> -
> -	mutex_init(&mipi->lock);
> -
> -	mipi->clk =3D devm_clk_get_prepared(&pdev->dev, NULL);
> -	if (IS_ERR(mipi->clk)) {
> -		dev_err(&pdev->dev, "failed to get clock\n");
> -		return PTR_ERR(mipi->clk);
> -	}
> -
> -	platform_set_drvdata(pdev, mipi);
> +	provider.np =3D np;
> +	provider.ops =3D ops;
> =20
>  	return 0;
>  }
> -
> -struct platform_driver tegra_mipi_driver =3D {
> -	.driver =3D {
> -		.name =3D "tegra-mipi",
> -		.of_match_table =3D tegra_mipi_of_match,
> -	},
> -	.probe =3D tegra_mipi_probe,
> -};
> +EXPORT_SYMBOL(tegra_mipi_add_provider);
> diff --git a/drivers/gpu/host1x/tegra114-mipi.c b/drivers/gpu/host1x/tegr=
a114-mipi.c
> new file mode 100644
> index 000000000000..158a0491f830
> --- /dev/null
> +++ b/drivers/gpu/host1x/tegra114-mipi.c
> @@ -0,0 +1,483 @@
> +/*
> + * Copyright (C) 2013 NVIDIA Corporation
> + *
> + * Permission to use, copy, modify, distribute, and sell this software a=
nd its
> + * documentation for any purpose is hereby granted without fee, provided=
 that
> + * the above copyright notice appear in all copies and that both that co=
pyright
> + * notice and this permission notice appear in supporting documentation,=
 and
> + * that the name of the copyright holders not be used in advertising or
> + * publicity pertaining to distribution of the software without specific=
,
> + * written prior permission.  The copyright holders make no representati=
ons
> + * about the suitability of this software for any purpose.  It is provid=
ed "as
> + * is" without express or implied warranty.
> + *
> + * THE COPYRIGHT HOLDERS DISCLAIM ALL WARRANTIES WITH REGARD TO THIS SOF=
TWARE,
> + * INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN N=
O
> + * EVENT SHALL THE COPYRIGHT HOLDERS BE LIABLE FOR ANY SPECIAL, INDIRECT=
 OR
> + * CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS O=
F USE,
> + * DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHE=
R
> + * TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERF=
ORMANCE
> + * OF THIS SOFTWARE.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/host1x.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <linux/tegra-mipi-cal.h>
> +
> +#include "dev.h"
> +
> +#define MIPI_CAL_CTRL			0x00
> +#define MIPI_CAL_CTRL_NOISE_FILTER(x)	(((x) & 0xf) << 26)
> +#define MIPI_CAL_CTRL_PRESCALE(x)	(((x) & 0x3) << 24)
> +#define MIPI_CAL_CTRL_CLKEN_OVR		(1 << 4)
> +#define MIPI_CAL_CTRL_START		(1 << 0)
> +
> +#define MIPI_CAL_AUTOCAL_CTRL		0x01
> +
> +#define MIPI_CAL_STATUS			0x02
> +#define MIPI_CAL_STATUS_DONE		(1 << 16)
> +#define MIPI_CAL_STATUS_ACTIVE		(1 <<  0)
> +
> +#define MIPI_CAL_CONFIG_CSIA		0x05
> +#define MIPI_CAL_CONFIG_CSIB		0x06
> +#define MIPI_CAL_CONFIG_CSIC		0x07
> +#define MIPI_CAL_CONFIG_CSID		0x08
> +#define MIPI_CAL_CONFIG_CSIE		0x09
> +#define MIPI_CAL_CONFIG_CSIF		0x0a
> +#define MIPI_CAL_CONFIG_DSIA		0x0e
> +#define MIPI_CAL_CONFIG_DSIB		0x0f
> +#define MIPI_CAL_CONFIG_DSIC		0x10
> +#define MIPI_CAL_CONFIG_DSID		0x11
> +
> +#define MIPI_CAL_CONFIG_DSIA_CLK	0x19
> +#define MIPI_CAL_CONFIG_DSIB_CLK	0x1a
> +#define MIPI_CAL_CONFIG_CSIAB_CLK	0x1b
> +#define MIPI_CAL_CONFIG_DSIC_CLK	0x1c
> +#define MIPI_CAL_CONFIG_CSICD_CLK	0x1c
> +#define MIPI_CAL_CONFIG_DSID_CLK	0x1d
> +#define MIPI_CAL_CONFIG_CSIE_CLK	0x1d
> +
> +/* for data and clock lanes */
> +#define MIPI_CAL_CONFIG_SELECT		(1 << 21)
> +
> +/* for data lanes */
> +#define MIPI_CAL_CONFIG_HSPDOS(x)	(((x) & 0x1f) << 16)
> +#define MIPI_CAL_CONFIG_HSPUOS(x)	(((x) & 0x1f) <<  8)
> +#define MIPI_CAL_CONFIG_TERMOS(x)	(((x) & 0x1f) <<  0)
> +
> +/* for clock lanes */
> +#define MIPI_CAL_CONFIG_HSCLKPDOSD(x)	(((x) & 0x1f) <<  8)
> +#define MIPI_CAL_CONFIG_HSCLKPUOSD(x)	(((x) & 0x1f) <<  0)
> +
> +#define MIPI_CAL_BIAS_PAD_CFG0		0x16
> +#define MIPI_CAL_BIAS_PAD_PDVCLAMP	(1 << 1)
> +#define MIPI_CAL_BIAS_PAD_E_VCLAMP_REF	(1 << 0)
> +
> +#define MIPI_CAL_BIAS_PAD_CFG1		0x17
> +#define MIPI_CAL_BIAS_PAD_DRV_DN_REF(x) (((x) & 0x7) << 16)
> +#define MIPI_CAL_BIAS_PAD_DRV_UP_REF(x) (((x) & 0x7) << 8)
> +
> +#define MIPI_CAL_BIAS_PAD_CFG2		0x18
> +#define MIPI_CAL_BIAS_PAD_VCLAMP(x)	(((x) & 0x7) << 16)
> +#define MIPI_CAL_BIAS_PAD_VAUXP(x)	(((x) & 0x7) << 4)
> +#define MIPI_CAL_BIAS_PAD_PDVREG	(1 << 1)
> +
> +struct tegra_mipi_pad {
> +	unsigned long data;
> +	unsigned long clk;
> +};
> +
> +struct tegra_mipi_soc {
> +	bool has_clk_lane;
> +	const struct tegra_mipi_pad *pads;
> +	unsigned int num_pads;
> +
> +	bool clock_enable_override;
> +	bool needs_vclamp_ref;
> +
> +	/* bias pad configuration settings */
> +	u8 pad_drive_down_ref;
> +	u8 pad_drive_up_ref;
> +
> +	u8 pad_vclamp_level;
> +	u8 pad_vauxp_level;
> +
> +	/* calibration settings for data lanes */
> +	u8 hspdos;
> +	u8 hspuos;
> +	u8 termos;
> +
> +	/* calibration settings for clock lanes */
> +	u8 hsclkpdos;
> +	u8 hsclkpuos;
> +};
> +
> +struct tegra_mipi {
> +	const struct tegra_mipi_soc *soc;
> +	struct device *dev;
> +	void __iomem *regs;
> +	struct mutex lock;
> +	struct clk *clk;
> +
> +	unsigned long usage_count;
> +};
> +
> +static inline u32 tegra_mipi_readl(struct tegra_mipi *mipi,
> +				   unsigned long offset)
> +{
> +	return readl(mipi->regs + (offset << 2));
> +}
> +
> +static inline void tegra_mipi_writel(struct tegra_mipi *mipi, u32 value,
> +				     unsigned long offset)
> +{
> +	writel(value, mipi->regs + (offset << 2));
> +}
> +
> +static int tegra114_mipi_power_up(struct tegra_mipi *mipi)
> +{
> +	u32 value;
> +	int err;
> +
> +	err =3D clk_enable(mipi->clk);
> +	if (err < 0)
> +		return err;
> +
> +	value =3D tegra_mipi_readl(mipi, MIPI_CAL_BIAS_PAD_CFG0);
> +	value &=3D ~MIPI_CAL_BIAS_PAD_PDVCLAMP;
> +
> +	if (mipi->soc->needs_vclamp_ref)
> +		value |=3D MIPI_CAL_BIAS_PAD_E_VCLAMP_REF;
> +
> +	tegra_mipi_writel(mipi, value, MIPI_CAL_BIAS_PAD_CFG0);
> +
> +	value =3D tegra_mipi_readl(mipi, MIPI_CAL_BIAS_PAD_CFG2);
> +	value &=3D ~MIPI_CAL_BIAS_PAD_PDVREG;
> +	tegra_mipi_writel(mipi, value, MIPI_CAL_BIAS_PAD_CFG2);
> +
> +	clk_disable(mipi->clk);
> +
> +	return 0;
> +}
> +
> +static int tegra114_mipi_power_down(struct tegra_mipi *mipi)
> +{
> +	u32 value;
> +	int err;
> +
> +	err =3D clk_enable(mipi->clk);
> +	if (err < 0)
> +		return err;
> +
> +	/*
> +	 * The MIPI_CAL_BIAS_PAD_PDVREG controls a voltage regulator that
> +	 * supplies the DSI pads. This must be kept enabled until none of the
> +	 * DSI lanes are used anymore.
> +	 */
> +	value =3D tegra_mipi_readl(mipi, MIPI_CAL_BIAS_PAD_CFG2);
> +	value |=3D MIPI_CAL_BIAS_PAD_PDVREG;
> +	tegra_mipi_writel(mipi, value, MIPI_CAL_BIAS_PAD_CFG2);
> +
> +	/*
> +	 * MIPI_CAL_BIAS_PAD_PDVCLAMP and MIPI_CAL_BIAS_PAD_E_VCLAMP_REF
> +	 * control a regulator that supplies current to the pre-driver logic.
> +	 * Powering down this regulator causes DSI to fail, so it must remain
> +	 * powered on until none of the DSI lanes are used anymore.
> +	 */
> +	value =3D tegra_mipi_readl(mipi, MIPI_CAL_BIAS_PAD_CFG0);
> +
> +	if (mipi->soc->needs_vclamp_ref)
> +		value &=3D ~MIPI_CAL_BIAS_PAD_E_VCLAMP_REF;
> +
> +	value |=3D MIPI_CAL_BIAS_PAD_PDVCLAMP;
> +	tegra_mipi_writel(mipi, value, MIPI_CAL_BIAS_PAD_CFG0);
> +
> +	return 0;
> +}
> +
> +static int tegra114_mipi_enable(struct tegra_mipi_device *mipidev)
> +{
> +	struct tegra_mipi *mipi =3D platform_get_drvdata(mipidev->pdev);
> +	int err =3D 0;
> +
> +	mutex_lock(&mipi->lock);
> +
> +	if (mipi->usage_count++ =3D=3D 0)
> +		err =3D tegra114_mipi_power_up(mipi);
> +
> +	mutex_unlock(&mipi->lock);
> +
> +	return err;
> +}
> +
> +static int tegra114_mipi_disable(struct tegra_mipi_device *mipidev)
> +{
> +	struct tegra_mipi *mipi =3D platform_get_drvdata(mipidev->pdev);
> +	int err =3D 0;
> +
> +	mutex_lock(&mipi->lock);
> +
> +	if (--mipi->usage_count =3D=3D 0)
> +		err =3D tegra114_mipi_power_down(mipi);
> +
> +	mutex_unlock(&mipi->lock);
> +
> +	return err;
> +}
> +
> +static int tegra114_mipi_finish_calibration(struct tegra_mipi_device *mi=
pidev)
> +{
> +	struct tegra_mipi *mipi =3D platform_get_drvdata(mipidev->pdev);
> +	void __iomem *status_reg =3D mipi->regs + (MIPI_CAL_STATUS << 2);
> +	u32 value;
> +	int err;
> +
> +	err =3D readl_relaxed_poll_timeout(status_reg, value,
> +					 !(value & MIPI_CAL_STATUS_ACTIVE) &&
> +					 (value & MIPI_CAL_STATUS_DONE), 50,
> +					 250000);
> +	mutex_unlock(&mipi->lock);
> +	clk_disable(mipi->clk);
> +
> +	return err;
> +}
> +
> +static int tegra114_mipi_start_calibration(struct tegra_mipi_device *mip=
idev)
> +{
> +	struct tegra_mipi *mipi =3D platform_get_drvdata(mipidev->pdev);
> +	const struct tegra_mipi_soc *soc =3D mipi->soc;
> +	unsigned int i;
> +	u32 value;
> +	int err;
> +
> +	err =3D clk_enable(mipi->clk);
> +	if (err < 0)
> +		return err;
> +
> +	mutex_lock(&mipi->lock);
> +
> +	value =3D MIPI_CAL_BIAS_PAD_DRV_DN_REF(soc->pad_drive_down_ref) |
> +		MIPI_CAL_BIAS_PAD_DRV_UP_REF(soc->pad_drive_up_ref);
> +	tegra_mipi_writel(mipi, value, MIPI_CAL_BIAS_PAD_CFG1);
> +
> +	value =3D tegra_mipi_readl(mipi, MIPI_CAL_BIAS_PAD_CFG2);
> +	value &=3D ~MIPI_CAL_BIAS_PAD_VCLAMP(0x7);
> +	value &=3D ~MIPI_CAL_BIAS_PAD_VAUXP(0x7);
> +	value |=3D MIPI_CAL_BIAS_PAD_VCLAMP(soc->pad_vclamp_level);
> +	value |=3D MIPI_CAL_BIAS_PAD_VAUXP(soc->pad_vauxp_level);
> +	tegra_mipi_writel(mipi, value, MIPI_CAL_BIAS_PAD_CFG2);
> +
> +	for (i =3D 0; i < soc->num_pads; i++) {
> +		u32 clk =3D 0, data =3D 0;
> +
> +		if (mipidev->pads & BIT(i)) {
> +			data =3D MIPI_CAL_CONFIG_SELECT |
> +			       MIPI_CAL_CONFIG_HSPDOS(soc->hspdos) |
> +			       MIPI_CAL_CONFIG_HSPUOS(soc->hspuos) |
> +			       MIPI_CAL_CONFIG_TERMOS(soc->termos);
> +			clk =3D MIPI_CAL_CONFIG_SELECT |
> +			      MIPI_CAL_CONFIG_HSCLKPDOSD(soc->hsclkpdos) |
> +			      MIPI_CAL_CONFIG_HSCLKPUOSD(soc->hsclkpuos);
> +		}
> +
> +		tegra_mipi_writel(mipi, data, soc->pads[i].data);
> +
> +		if (soc->has_clk_lane && soc->pads[i].clk !=3D 0)
> +			tegra_mipi_writel(mipi, clk, soc->pads[i].clk);
> +	}
> +
> +	value =3D tegra_mipi_readl(mipi, MIPI_CAL_CTRL);
> +	value &=3D ~MIPI_CAL_CTRL_NOISE_FILTER(0xf);
> +	value &=3D ~MIPI_CAL_CTRL_PRESCALE(0x3);
> +	value |=3D MIPI_CAL_CTRL_NOISE_FILTER(0xa);
> +	value |=3D MIPI_CAL_CTRL_PRESCALE(0x2);
> +
> +	if (!soc->clock_enable_override)
> +		value &=3D ~MIPI_CAL_CTRL_CLKEN_OVR;
> +	else
> +		value |=3D MIPI_CAL_CTRL_CLKEN_OVR;
> +
> +	tegra_mipi_writel(mipi, value, MIPI_CAL_CTRL);
> +
> +	/* clear any pending status bits */
> +	value =3D tegra_mipi_readl(mipi, MIPI_CAL_STATUS);
> +	tegra_mipi_writel(mipi, value, MIPI_CAL_STATUS);
> +
> +	value =3D tegra_mipi_readl(mipi, MIPI_CAL_CTRL);
> +	value |=3D MIPI_CAL_CTRL_START;
> +	tegra_mipi_writel(mipi, value, MIPI_CAL_CTRL);
> +
> +	/*
> +	 * Wait for min 72uS to let calibration logic finish calibration
> +	 * sequence codes before waiting for pads idle state to apply the
> +	 * results.
> +	 */
> +	usleep_range(75, 80);
> +
> +	return 0;
> +}
> +
> +static const struct tegra_mipi_ops tegra114_mipi_ops =3D {
> +	.enable =3D tegra114_mipi_enable,
> +	.disable =3D tegra114_mipi_disable,
> +	.start_calibration =3D tegra114_mipi_start_calibration,
> +	.finish_calibration =3D tegra114_mipi_finish_calibration,
> +};
> +
> +static const struct tegra_mipi_pad tegra114_mipi_pads[] =3D {
> +	{ .data =3D MIPI_CAL_CONFIG_CSIA },
> +	{ .data =3D MIPI_CAL_CONFIG_CSIB },
> +	{ .data =3D MIPI_CAL_CONFIG_CSIC },
> +	{ .data =3D MIPI_CAL_CONFIG_CSID },
> +	{ .data =3D MIPI_CAL_CONFIG_CSIE },
> +	{ .data =3D MIPI_CAL_CONFIG_DSIA },
> +	{ .data =3D MIPI_CAL_CONFIG_DSIB },
> +	{ .data =3D MIPI_CAL_CONFIG_DSIC },
> +	{ .data =3D MIPI_CAL_CONFIG_DSID },
> +};
> +
> +static const struct tegra_mipi_soc tegra114_mipi_soc =3D {
> +	.has_clk_lane =3D false,
> +	.pads =3D tegra114_mipi_pads,
> +	.num_pads =3D ARRAY_SIZE(tegra114_mipi_pads),
> +	.clock_enable_override =3D true,
> +	.needs_vclamp_ref =3D true,
> +	.pad_drive_down_ref =3D 0x2,
> +	.pad_drive_up_ref =3D 0x0,
> +	.pad_vclamp_level =3D 0x0,
> +	.pad_vauxp_level =3D 0x0,
> +	.hspdos =3D 0x0,
> +	.hspuos =3D 0x4,
> +	.termos =3D 0x5,
> +	.hsclkpdos =3D 0x0,
> +	.hsclkpuos =3D 0x4,
> +};
> +
> +static const struct tegra_mipi_pad tegra124_mipi_pads[] =3D {
> +	{ .data =3D MIPI_CAL_CONFIG_CSIA, .clk =3D MIPI_CAL_CONFIG_CSIAB_CLK },
> +	{ .data =3D MIPI_CAL_CONFIG_CSIB, .clk =3D MIPI_CAL_CONFIG_CSIAB_CLK },
> +	{ .data =3D MIPI_CAL_CONFIG_CSIC, .clk =3D MIPI_CAL_CONFIG_CSICD_CLK },
> +	{ .data =3D MIPI_CAL_CONFIG_CSID, .clk =3D MIPI_CAL_CONFIG_CSICD_CLK },
> +	{ .data =3D MIPI_CAL_CONFIG_CSIE, .clk =3D MIPI_CAL_CONFIG_CSIE_CLK  },
> +	{ .data =3D MIPI_CAL_CONFIG_DSIA, .clk =3D MIPI_CAL_CONFIG_DSIA_CLK  },
> +	{ .data =3D MIPI_CAL_CONFIG_DSIB, .clk =3D MIPI_CAL_CONFIG_DSIB_CLK  },
> +};
> +
> +static const struct tegra_mipi_soc tegra124_mipi_soc =3D {
> +	.has_clk_lane =3D true,
> +	.pads =3D tegra124_mipi_pads,
> +	.num_pads =3D ARRAY_SIZE(tegra124_mipi_pads),
> +	.clock_enable_override =3D true,
> +	.needs_vclamp_ref =3D true,
> +	.pad_drive_down_ref =3D 0x2,
> +	.pad_drive_up_ref =3D 0x0,
> +	.pad_vclamp_level =3D 0x0,
> +	.pad_vauxp_level =3D 0x0,
> +	.hspdos =3D 0x0,
> +	.hspuos =3D 0x0,
> +	.termos =3D 0x0,
> +	.hsclkpdos =3D 0x1,
> +	.hsclkpuos =3D 0x2,
> +};
> +
> +static const struct tegra_mipi_soc tegra132_mipi_soc =3D {
> +	.has_clk_lane =3D true,
> +	.pads =3D tegra124_mipi_pads,
> +	.num_pads =3D ARRAY_SIZE(tegra124_mipi_pads),
> +	.clock_enable_override =3D false,
> +	.needs_vclamp_ref =3D false,
> +	.pad_drive_down_ref =3D 0x0,
> +	.pad_drive_up_ref =3D 0x3,
> +	.pad_vclamp_level =3D 0x0,
> +	.pad_vauxp_level =3D 0x0,
> +	.hspdos =3D 0x0,
> +	.hspuos =3D 0x0,
> +	.termos =3D 0x0,
> +	.hsclkpdos =3D 0x3,
> +	.hsclkpuos =3D 0x2,
> +};
> +
> +static const struct tegra_mipi_pad tegra210_mipi_pads[] =3D {
> +	{ .data =3D MIPI_CAL_CONFIG_CSIA, .clk =3D 0 },
> +	{ .data =3D MIPI_CAL_CONFIG_CSIB, .clk =3D 0 },
> +	{ .data =3D MIPI_CAL_CONFIG_CSIC, .clk =3D 0 },
> +	{ .data =3D MIPI_CAL_CONFIG_CSID, .clk =3D 0 },
> +	{ .data =3D MIPI_CAL_CONFIG_CSIE, .clk =3D 0 },
> +	{ .data =3D MIPI_CAL_CONFIG_CSIF, .clk =3D 0 },
> +	{ .data =3D MIPI_CAL_CONFIG_DSIA, .clk =3D MIPI_CAL_CONFIG_DSIA_CLK },
> +	{ .data =3D MIPI_CAL_CONFIG_DSIB, .clk =3D MIPI_CAL_CONFIG_DSIB_CLK },
> +	{ .data =3D MIPI_CAL_CONFIG_DSIC, .clk =3D MIPI_CAL_CONFIG_DSIC_CLK },
> +	{ .data =3D MIPI_CAL_CONFIG_DSID, .clk =3D MIPI_CAL_CONFIG_DSID_CLK },
> +};
> +
> +static const struct tegra_mipi_soc tegra210_mipi_soc =3D {
> +	.has_clk_lane =3D true,
> +	.pads =3D tegra210_mipi_pads,
> +	.num_pads =3D ARRAY_SIZE(tegra210_mipi_pads),
> +	.clock_enable_override =3D true,
> +	.needs_vclamp_ref =3D false,
> +	.pad_drive_down_ref =3D 0x0,
> +	.pad_drive_up_ref =3D 0x3,
> +	.pad_vclamp_level =3D 0x1,
> +	.pad_vauxp_level =3D 0x1,
> +	.hspdos =3D 0x0,
> +	.hspuos =3D 0x2,
> +	.termos =3D 0x0,
> +	.hsclkpdos =3D 0x0,
> +	.hsclkpuos =3D 0x2,
> +};
> +
> +static const struct of_device_id tegra_mipi_of_match[] =3D {
> +	{ .compatible =3D "nvidia,tegra114-mipi", .data =3D &tegra114_mipi_soc =
},
> +	{ .compatible =3D "nvidia,tegra124-mipi", .data =3D &tegra124_mipi_soc =
},
> +	{ .compatible =3D "nvidia,tegra132-mipi", .data =3D &tegra132_mipi_soc =
},
> +	{ .compatible =3D "nvidia,tegra210-mipi", .data =3D &tegra210_mipi_soc =
},
> +	{ },
> +};
> +
> +static int tegra_mipi_probe(struct platform_device *pdev)
> +{
> +	const struct of_device_id *match;
> +	struct tegra_mipi *mipi;
> +
> +	match =3D of_match_node(tegra_mipi_of_match, pdev->dev.of_node);
> +	if (!match)
> +		return -ENODEV;
> +
> +	mipi =3D devm_kzalloc(&pdev->dev, sizeof(*mipi), GFP_KERNEL);
> +	if (!mipi)
> +		return -ENOMEM;
> +
> +	mipi->soc =3D match->data;
> +	mipi->dev =3D &pdev->dev;
> +
> +	mipi->regs =3D devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
> +	if (IS_ERR(mipi->regs))
> +		return PTR_ERR(mipi->regs);
> +
> +	mutex_init(&mipi->lock);
> +
> +	mipi->clk =3D devm_clk_get_prepared(&pdev->dev, NULL);
> +	if (IS_ERR(mipi->clk)) {
> +		dev_err(&pdev->dev, "failed to get clock\n");
> +		return PTR_ERR(mipi->clk);
> +	}
> +
> +	platform_set_drvdata(pdev, mipi);
> +
> +	return tegra_mipi_add_provider(pdev->dev.of_node,
> +				       &tegra114_mipi_ops);
> +}
> +
> +struct platform_driver tegra_mipi_driver =3D {
> +	.driver =3D {
> +		.name =3D "tegra-mipi",
> +		.of_match_table =3D tegra_mipi_of_match,
> +	},
> +	.probe =3D tegra_mipi_probe,
> +};
> diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/me=
dia/tegra-video/csi.c
> index 74c92db1032f..9e3bd6109781 100644
> --- a/drivers/staging/media/tegra-video/csi.c
> +++ b/drivers/staging/media/tegra-video/csi.c
> @@ -12,6 +12,7 @@
>  #include <linux/of_graph.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/tegra-mipi-cal.h>
> =20
>  #include <media/v4l2-fwnode.h>
> =20
> diff --git a/include/linux/host1x.h b/include/linux/host1x.h
> index 9fa9c30a34e6..b1c6514859d3 100644
> --- a/include/linux/host1x.h
> +++ b/include/linux/host1x.h
> @@ -453,16 +453,6 @@ void host1x_client_unregister(struct host1x_client *=
client);
>  int host1x_client_suspend(struct host1x_client *client);
>  int host1x_client_resume(struct host1x_client *client);
> =20
> -struct tegra_mipi_device;
> -
> -struct tegra_mipi_device *tegra_mipi_request(struct device *device,
> -					     struct device_node *np);
> -void tegra_mipi_free(struct tegra_mipi_device *device);
> -int tegra_mipi_enable(struct tegra_mipi_device *device);
> -int tegra_mipi_disable(struct tegra_mipi_device *device);
> -int tegra_mipi_start_calibration(struct tegra_mipi_device *device);
> -int tegra_mipi_finish_calibration(struct tegra_mipi_device *device);
> -
>  /* host1x memory contexts */
> =20
>  struct host1x_memory_context {
> diff --git a/include/linux/tegra-mipi-cal.h b/include/linux/tegra-mipi-ca=
l.h
> new file mode 100644
> index 000000000000..77342ee7674f
> --- /dev/null
> +++ b/include/linux/tegra-mipi-cal.h
> @@ -0,0 +1,56 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef __TEGRA_MIPI_CAL_H_
> +#define __TEGRA_MIPI_CAL_H_
> +
> +struct tegra_mipi_device {
> +	const struct tegra_mipi_ops *ops;
> +	struct platform_device *pdev;
> +	unsigned long pads;
> +};
> +
> +/**
> + * Operations for Tegra MIPI calibration device
> + */
> +struct tegra_mipi_ops {
> +	/**
> +	 * @enable:
> +	 *
> +	 * Enable MIPI calibration device
> +	 */
> +	int (*enable)(struct tegra_mipi_device *device);
> +
> +	/**
> +	 * @disable:
> +	 *
> +	 * Disable MIPI calibration device
> +	 */
> +	int (*disable)(struct tegra_mipi_device *device);
> +
> +	/**
> +	 * @start_calibration:
> +	 *
> +	 * Start MIPI calibration
> +	 */
> +	int (*start_calibration)(struct tegra_mipi_device *device);
> +
> +	/**
> +	 * @finish_calibration:
> +	 *
> +	 * Finish MIPI calibration
> +	 */
> +	int (*finish_calibration)(struct tegra_mipi_device *device);
> +};
> +
> +int tegra_mipi_add_provider(struct device_node *np, const struct tegra_m=
ipi_ops *ops);
> +
> +struct tegra_mipi_device *tegra_mipi_request(struct device *device,
> +					     struct device_node *np);
> +void tegra_mipi_free(struct tegra_mipi_device *device);
> +
> +int tegra_mipi_enable(struct tegra_mipi_device *device);
> +int tegra_mipi_disable(struct tegra_mipi_device *device);
> +int tegra_mipi_start_calibration(struct tegra_mipi_device *device);
> +int tegra_mipi_finish_calibration(struct tegra_mipi_device *device);
> +
> +#endif /* __TEGRA_MIPI_CAL_H_ */
>=20





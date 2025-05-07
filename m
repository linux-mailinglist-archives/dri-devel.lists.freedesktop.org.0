Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B30AAE21F
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 16:12:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A94510E80C;
	Wed,  7 May 2025 14:12:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="n+WSKwfI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2065.outbound.protection.outlook.com [40.107.92.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDF7210E800;
 Wed,  7 May 2025 14:12:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kKnewoPC5K5Zrnq9HWA4d1nPp/xorplfSu1CwbEAFI1VAEcGnH+0PlC5sHT1LlHWqpvFv5g6Svo9AZGqFTdQj28hbww7842YXon7F540GCerDj8EHfvr8BFbbiA3lJEsPyGA+jrYIrv1pkowsA1ZL56p7XcVXJBtDl9WirEoxVdbFeHStYfbobzQuR6ZcY85JxjqVpnoN7K8gSLQx/RNK7TISIRxeBVt5O0bHlO2HiKCcR97K0Svw75cbbiusnurJuVa59EO9DxQlCB2XHEZxlDi9y2dGVve1bc3U/oe92PPDEZ70FCiVbHWisk9NGDc07BzDpcSIcKZcWsblw71jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kmwfPeoelHsTumPpFLrBckGhFhAPls7i7W+dYfes86E=;
 b=IwknFeZzxn5so0sxOZrELN2gCMdfJY7zbIUAbldeJvkaG6eHKO4BVTS/opSd8P2FNB4ut0kPP0g+Rk5yhHHy5CivwSewyBbl4cAp6QfeDs60I4/sPQ7O9aCx8n6v6D3DzHuqeRYsIKpxonTjblKbRCPw/nOriwsUHgQh2J0R8sEkwAZP0d10bZLsax1xWXeo+kPrwn/3T3dqw745HPSfw7AsCq/z4zK3jVl8KHhpcZoj7ZiUbkHeVbpsS8OMqCg+DGjPlcdJfIJfu3yMmhHjJzD/wqUD4tfIJ6rH9ADLhvOkSVECXEhrlMTtcHL9YHUO+Z3IFaT8eeE5p45uoqqypg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kmwfPeoelHsTumPpFLrBckGhFhAPls7i7W+dYfes86E=;
 b=n+WSKwfIc2uALYV2fdF3cou0dU9ftMJEBmQB44tZknf2qAhpdLo8ex1Y6VbHDOt5OI4PhJjL5lKF9OnUM68Qo2kdpmnoa+A4KLSjcG4u1CxD/sshgQ/kTmb91GiJss06xt1NcV4/ObS0CgQXDhovzyr0cZdx3pM7xCXeOlYaUaJMG1jcyIyKM8dPVEfZmITv2u16Bpv7uBK3mOrCB/yK8oRByabtKd1EPjN6uBe2Z3wdeJYXc+xyT7/2MzrAd2cXASBelDRM7OP39dmK9yROuqHaHVLbAhcqVRySPaE8+B5pjI6oCjArge+IPw8lJHAe8QY1wQ/bDmBPNyIFXxxfZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM4PR12MB7742.namprd12.prod.outlook.com (2603:10b6:8:102::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Wed, 7 May
 2025 14:12:02 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8699.026; Wed, 7 May 2025
 14:12:02 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 07 May 2025 23:11:59 +0900
Message-Id: <D9PZN1E5H5I4.WXP8OB3ANJ02@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Ben Skeggs" <bskeggs@nvidia.com>,
 "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v2 17/21] rust: num: Add an upward alignment helper for
 usize
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Jonathan Corbet"
 <corbet@lwn.net>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250501-nova-frts-v2-0-b4a137175337@nvidia.com>
 <20250501-nova-frts-v2-17-b4a137175337@nvidia.com>
 <D9LEQ1U1PLO8.3N22GRY380ZM3@nvidia.com>
 <d6962ea3-282d-437c-b3cf-ce701d514558@nvidia.com>
 <D9M5K55GTN6S.1X827WU0Z50UM@nvidia.com>
 <112d971f-20c8-4598-86c9-6822d9c24001@nvidia.com>
 <D9MLOQC5G7XH.3GTUIRCCN8X70@nvidia.com>
 <ce197acc-8b66-4a6c-85aa-3318666d80d3@nvidia.com>
In-Reply-To: <ce197acc-8b66-4a6c-85aa-3318666d80d3@nvidia.com>
X-ClientProxiedBy: TYCP286CA0229.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM4PR12MB7742:EE_
X-MS-Office365-Filtering-Correlation-Id: 714bd876-d538-48fa-9be2-08dd8d71236c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|7416014|366016|1800799024|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eTQyc29zZE5pOEtnRVh5M1pFMnJwNkJWSnY4M2w0dFFUcnN0aGlBZ0Y3VXlK?=
 =?utf-8?B?VmYwcTlpSDJoQ3M3MXpLSWc1RXkrNTJaU3F0RVRKeFZzam1kRVlETkd5TGpl?=
 =?utf-8?B?VWdJcHd3Z2dkWDVyOG1qYXB5YWZHNEhxS2tNTTVRRnFrQVI0NGozSEIrd3N6?=
 =?utf-8?B?S1d2RFhUZTBkaEg5aEhhakdmU0ZhNnNQcGs0dXQzWkN5aFNuaWNIbFpkM3JR?=
 =?utf-8?B?RXJNZ2dvTjZkZlVYaEVlRExWRWtVZDNsZDlEdTA3RkgzaTlQWEM0VnRsVlFG?=
 =?utf-8?B?L1VyZGEySGhHQzZNVnJKbEZKblhWcEdvT2FZeTk2bTVzY042Uno5dlhXS20w?=
 =?utf-8?B?TW5TU1B6U2EzNmp6cXdvQW11QWJlTTN3NUNEQ21SeUJTVjNJZmRmTEU1THBj?=
 =?utf-8?B?Y1BTU0hpYWxZTncvRmtsY0ZRdmNjRFVMQkVTVXhkRDRtWDA2MVNTRkd2eFVz?=
 =?utf-8?B?eWk2WWlpRUphdG1VbFBRNlNEYm1YcndwU2QvL3RKSkN0T2srd3pxdGludXF5?=
 =?utf-8?B?SUlJZFZSdUcvNTZUWDB2SEY1bE5TRHpCME9WUW1QWmxOK1pjT0JuTzBIcnp0?=
 =?utf-8?B?aUxJa1Q4aldMaUF2MXlGajRTTnVrY3BVR3hGREhzQktYdWpvT05VOE1waGR4?=
 =?utf-8?B?Nm5VdVhtQU5RbXluYmpyLzgwVk5zU0s3dEFwMnlQSnZueFUrM1ZwbW91SHFW?=
 =?utf-8?B?YzIrVStGNVhuWXFBUHI2Mi9FbXBVdVNKenFhVnFpSEZxQ1VvMWltZFovMklx?=
 =?utf-8?B?bG1GR29ISFIvN0ZDWFdNV0taSVZIa25WZXBoOHpkUFpQcnNMeUoyM0c2UEV4?=
 =?utf-8?B?Z2tONzRHOXNnb3V0dU9WbCtHZ1lPcXFSTUtwK0dqMkpTNW9RWFVpc212enE2?=
 =?utf-8?B?S1dTVWRpWVFWbG1CWHdnaVQ0cDA0cVVPanNoRTh6Ui9zZndMdW9FRVBMaURj?=
 =?utf-8?B?MndORGtjVmR1aitKejdTdmVxc2lTSTBWVkVQQlBIaXlsMFJVMEN0SEYxdnVU?=
 =?utf-8?B?YlhWd2s4N2kwaVNnTll2c0xMeVhqd21xczU4NlRNTnFUek9nTlp2RzNEcjRl?=
 =?utf-8?B?MDhzRXZkM3JMckcwcUhJUHN3U0NBbUZFWDNuQjFCRjh6QmtRWVlBNVBPbEUw?=
 =?utf-8?B?cnM5b3MrRkl0VUlPSEpnc1Ywb25EK2lGYVl3ZG5mTENVbmZYOVFveWhNTTg1?=
 =?utf-8?B?MjJXQkVvZEI2SERWTkxCYVd2NUFMTVl6TzNCbVo5R044TzFVREZpamVubFRX?=
 =?utf-8?B?bDhpY3dHbFBQd01HVkFKelZsbFE5eWlNZVovWnZlMk5yMkd2RnI2WG1jQUFj?=
 =?utf-8?B?SCttS0Z1MDRPUkZwb1MyUTExSFdweGJBWHNpZ1NhRVllSmJHYWVpQndOZGsw?=
 =?utf-8?B?UTI5cmhJci9rT24yRTZxMlcrSXZGOGxTVWMxenB4VkptdGRSdTFCQ0hwM1JI?=
 =?utf-8?B?N3NZTWJtbU55QlJKZ0QzUlpRc2ZISG92am1oTGJZSkcyZWNKYUR0YmE0Y3E1?=
 =?utf-8?B?WUEvSG1ub3JBWTFwT1ppSmZJb3JQRzVGOFdlUTkxNEE5YzFNNjlaa1Jka2JJ?=
 =?utf-8?B?dHhqNjRDUXBiNUJEaXpWd3UzMVVlZzZDVWlxd2F5cTFHenJrRWxaWlJWN1J2?=
 =?utf-8?B?eGtjSzhuZzExOUtjVmFqeFcrRUxkUjBHU0s2ajg0bVk3VktUOEE0dyt5anpV?=
 =?utf-8?B?SWtLSFhxeVNmV1JKV1ZpTnlzN2hqa3Z3a0xXTXUybHFTUVBwTVhDeDN6blJQ?=
 =?utf-8?B?UWc5cXgzYlBxallTQWJyM0FHRGQ5SWlSclA4MGttYU9pMzBMWG1sY2loZy95?=
 =?utf-8?B?RTF1WkVGU2RQTk1yYUxORGh4SjRZWGZmaGhEMnZWcy9aK0JrYUdMaFZpaTVZ?=
 =?utf-8?B?eVdxUnZZY3BjS2dDQ3Q1WnFOQlg4NDAybXh0bVR0TEw3aDZONWlRS3NJRFRL?=
 =?utf-8?B?cnpzNTJ0RmdMK2xTMWFuY2h2RkFzRldRWjFSUGhZNTg0WHAyUGdTelFqZkxy?=
 =?utf-8?B?T3EvdmJKYkpBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(7416014)(366016)(1800799024)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QU1WeXA3WUt6N2NkV25kWE9ieTNTb1ozWWhvLzJqb09vVzdOdWpKYjY5dkFv?=
 =?utf-8?B?STBVSnRXZml1R3laaDdFK0g0d3owaEpsUmlXZ3M4eDJrc2M3QTZhSm9PQjNH?=
 =?utf-8?B?eFdvZGlZSkVydzYzZSs3RzF6WVBHL29xNlJwNXVHVWgzaFlwNDVVZGJnRWhV?=
 =?utf-8?B?M0tJVE5XYjA3djliYUxJMUoydW11YmN2Q1hFbkRZait2R0xja0hDT21XVFhB?=
 =?utf-8?B?cHgveWd3SFp3ZmRuQ0VmamlodllvUWJGa040VWY0QzVRT2VGNW9xbnZrM2hR?=
 =?utf-8?B?dTRCdC93UFlZNXNZU1RLWHg4N1JpWEV0dTZvdGpCbTZ2Z3lsbVFDM0RMZEhL?=
 =?utf-8?B?OU81UThiRmZ2K1REdHZMcU5nTkJyNmNxTWNCZ0luV2svNVU5Ulg2MHgybUY4?=
 =?utf-8?B?QkdSWGZvZDcyVFBFSWN5WjJkZTRCWmdLMXRIc3JqTHI2aTBkV1ZHbE5tazNJ?=
 =?utf-8?B?M29qYnp4cnk1WXpaZituMXhlQ1VnMHZtcXMyRHR6V1FMaEVwY0tzR0d2Y1Zk?=
 =?utf-8?B?WGREM1pZNStjaGFOSVcyZEpSRHdRQzgrVk9vbkdMQ2xYV3l5dGZvOGd3SDZm?=
 =?utf-8?B?cGg3TGFlQUlLcjBLNENqUEcvYVZTbytXWVEyYnRZV0lXdC8rQnBLZXZnM0tO?=
 =?utf-8?B?UWNqaUpmYU9GbkhaUUtIdzRNakZMV1ZHaUJsd0dZTDI0N0doblVjZ3BzdUt4?=
 =?utf-8?B?MGtNeUlEa3F5Mm5Td3VUY3pqWTkyTzd2MjloVkRaSDZseEZMaHg1WFhrb01k?=
 =?utf-8?B?ODBmUVF2VllOVVN2VzN3QmZNZ2x5SWMyNUhXakU4Qm95ZXAxeWNNK3hBTitD?=
 =?utf-8?B?SFViY0U2amZBZWhsQWQwcHAxdlAyd3VmOFRjamJsL3EzWUlKUXNNNVN3cncy?=
 =?utf-8?B?a21DL0Q0SmtEd1VRMzJqTXVHYVpEc3NCanlOTDU5dmpocUFaRmIyNk1pM3c3?=
 =?utf-8?B?NWxGaGJoL3dWbmhDeVprd0lBbjlDclRNcUxQcm8wVVVETi9Cb2pjNEgwM3J2?=
 =?utf-8?B?N2QrWTQ4Z0dvTGlsQ0EzNjVhdXNHN1pJMHBLODB4d25aNUdBdk5lakt1YmVG?=
 =?utf-8?B?M0tvY010ZkpqWUlLQWg1eW5yV2Q3UlFWWEVMMkl2NnFkeENNSGtDbnVqZjJ1?=
 =?utf-8?B?K2E0dWpCVXN0YS9XQml1aU9kclhGZzBUTi8zRXF0aUxIb0hFeDlIbEM1QWh4?=
 =?utf-8?B?dEx6WUJXWUtqc2kwV3ZhM1NCUG9CVmF2L0p4TU81OUZZR1BmK1o3eE91Sml3?=
 =?utf-8?B?b25ETEtrTytEL0g4UEJuR1NUTTlwNWk0M0x4YitBZUZFUko5bDQvYjhmTFY3?=
 =?utf-8?B?eHdaN1NsYVpkVDBjdlRqdVppZjNtTVlacDJuZDZQU1VWY2RWY2J6TzhWeUZj?=
 =?utf-8?B?NWwrWHpwQWRRQTZMcEl6bStQelhmWXlaY05WbWEvUzNyWjlJOFdQbDFGeVBl?=
 =?utf-8?B?WmF4WjJoYmg4MHlTZUtpd1RkNnBkNFlIUDRvSGhuVVBkbHZMZXpMMmx1V3Ra?=
 =?utf-8?B?M3pEV2tjcVVxcDNCVmJEU01VMDFQMFdON2hQanFMUXVtRGwzeXlnMHlvSGJY?=
 =?utf-8?B?N01ib2FzNmtGTVYzYWVEZzFSR3VsVXlJTHJSTGJvSFY1U1Y3STBLUHo4RU1H?=
 =?utf-8?B?NWNoNWEybXFyVGFPSkgwcXBRK0VweTVlMGFDWnROcU5nOS9PNXNibEVQSEtm?=
 =?utf-8?B?M3BHUFJIMmtkMmg1L1djTXA1R1dtR2JkWmJSdmVlYiszWkFPMUlScDlkOEhr?=
 =?utf-8?B?OUJnS0s1b2tWaWVoL1dJS080UTVpWWw1SVlNb2kzSDBndFE4VCtielBnMnFL?=
 =?utf-8?B?NmtYZGRmQjV3Vm1NM2hNeHprck0xMXkzZ1RhSzNhekpzV2NaZ1F3VEo3K0o1?=
 =?utf-8?B?NUg5SWtmLzh6RXJNQkM3TCtWVkJGOGhITHVpT0lLRHlZSnMySTlaZEQzWmdN?=
 =?utf-8?B?Nlg5R2VDSmhHVDJoejV6MzJGalBvTHZITURJOVhQQjNDVzMxYithRWlaSzM4?=
 =?utf-8?B?TGEyc3pYaHh6UHh1czRuRnIyZk5LUnJmdFo5bE9VNW9sSmExNll5U0pjTGxq?=
 =?utf-8?B?ejZHM3RQa2Z4akRzeklPYm1YM1YrKzhvUkNYdkI4QWphT01tMERzbFhwdlpN?=
 =?utf-8?B?U09qSFVROUdmeW5JeEJVRkwrWmtaalJRNi9iWU9WeHZPNEJmemRtOUpqOXZa?=
 =?utf-8?Q?WuChYC7bTqYA22rDd7a493lQ+yEKMD/UXpg/ILmhhmZl?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 714bd876-d538-48fa-9be2-08dd8d71236c
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 14:12:02.3348 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AdnutZnXDl3iaPSn5TjgJVfW+KsIyhqArXIWojWYzlKPhyFR1FZtsSh/WUu61J8TPGoN7oRzjr+YSuTxhRucNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7742
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

On Tue May 6, 2025 at 12:25 AM JST, Joel Fernandes wrote:
>> Actually it may be a good idea to move this into its own patch/series so
>> it gets more attention as this is starting to look like the `num` or
>> `num_integer` crates and we might be well-advised to take more
>> inspiration from them in order to avoid reinventing the wheel. It is
>> basically asking the question "how do we want to extend the integer
>> types in a useful way for the kernel", so it's actually pretty important
>> that we get our answer right. :)
>
> I am not sure if we want to split the series for a simple change like thi=
s,
> because then the whole series gets blocked? It may also be better to pair=
 the
> user of the function with the function itself IMHO since the function is =
also
> quite small. I am also Ok with keeping the original patch in the series a=
nd
> extending on that in the future (with just usize) to not block the series=
.
>
> Regarding for the full blown num module, I looked over the weekend and it=
s
> actually a bunch of modules working together, with dozens of numeric APIs=
, so I
> am not sure if we should pull everything or try to copy parts of it. The =
R4l
> guidelines have something to say here. A good approach IMO is to just do =
it
> incrementally, like I'm doing with this patch.
>
> I think defining a "Unsigned" trait does make sense, and then for future
> expansion, it can be expanded on in the new num module?

Yeah maybe I was looking too far ahead. This can definitely grow
gradually.

>> To address our immediate needs of an `align_up`, it just occurred to me
>> that we could simply use the `next_multiple_of` method, at least
>> temporarily. It is implemented with a modulo and will therefore probably
>> result in less efficient code than a version optimized for powers of
>> two, but it will do the trick until we figure out how we want to extend
>> the primitive types for the kernel, which is really what this patch is
>> about - we will also need an `align_down` for instance, and I don't know
>> of a standard library equivalent for it...
>
> Why do we want to trade off for "less efficient code"? :) I think that's =
worse
> than the original change (before this series) I had which had no function=
 call
> at all, but hardcoded the expression at the call site. The suggestion is =
also
> less desirable than having a local helper in the vbios module itself. I a=
m not
> much a fan of the idea "lets call this temporarily and have sub optimal c=
ode"
> when the alternative is to just do it in-place, in-module, or via a num m=
odule
> extension :)

`next_multiple_of` has the benefit of returning the correct result even
for non-powers of 2, but at the same time trying to align to something
that is not a power of 2 is probably a defect in the code itself. ^_^;

Another reason for not using it is to have things properly named, so
agreed that an extension trait with the functionality we need, with a
name that clearly carries our intent and implemented as efficiently as
the C equivalent is better than reusing standard library methods that
happen to provide the correct result.

>>> I added the #[inline] and hopefully that
>>> gives similar benefits to const that you're seeking:
>>=20
>> A `const` version is still going to be needed, `#[inline]` encourages th=
e
>> compiler to try and inline the function, but AFAIK it doesn't allow use
>> in const context.
>
> Right, so for the vbios use case there is no use of a const function. The=
 only
> reason I added it is because there were other functions at the time which=
 were
> used (by the now dropped timer module). I suggest let us add the const fu=
nction
> once there is a user of it, I also don't know right how to do it. Like if=
 I use
> generics for the const fn, I get this:
>
> const fn align_up_unsigned<T: Unsigned>(value: T, alignment: T) -> T {
>     let one =3D T::from(1u8);
>     (value + alignment - one) & !(alignment - one)
> }
>
> error[E0658]: cannot call conditionally-const method `<T as Add>::add` in
> constant functions

Interesting, I would expect that to fail but "conditionally-const"?
After looking that up is appears we can constraint a generic type
against a const trait, but that feature is still experimental and not
enabled in the kernel. So agreed, let's consider that later.


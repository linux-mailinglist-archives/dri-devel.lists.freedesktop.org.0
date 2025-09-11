Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FBFB52F37
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 13:05:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E483210EA89;
	Thu, 11 Sep 2025 11:05:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="oBjRt4kb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2057.outbound.protection.outlook.com [40.107.96.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49EE610EAA3;
 Thu, 11 Sep 2025 11:05:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SlVZ7GuFuG6ZH3vJHwDfiRFAIJVfN1NtetY4cQzZub1oKof5z5Ke++SKAUki3ORaXUj9xdYUoxzPXidfk0Y1kQzgRKQINf+wnmHE4pokVgcYyEeYYoVpcgcVfDi7Vxvbj1lX1Hphxixf+6sKYyD+mPqMFGD8mn6qow+mWjkc/l7gQ4K7fGQSKWynNM2l6lPD86qWL75kcdBgvjhWlmXb+xkf1+f+bIFJHS8q57rA4j4S5tcNj5OSOpICfPyAIgTu0LVkFeR6GjcsiAcgRVj9iVzUo/E+GvMiIFw4a/a7DRcK/W37FVN+rIg2okJBM+0JwKlerQExJX+K3rUOjJfgTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=11fdBdw5kdQOOY7SiWW2SIjX5WEG0dPVkVlfG3IE5nM=;
 b=IDwZkIhZXqrgv4sKDu6FRP66GlXXMyzR5Znm4nxq2AffpO3KkLpF/n4xW+apxibMksE4cGaGKNwpXzYSItE2DV13MJ7MyWA1H0A5C9jgDK7xNxiSs1mLo5Uakhkbf4Rmsxe84djgi4J2xa0t047vRKhBfo5jFA6JVxZr38WACEE5ypRG+gO3Ph5Reme8uN8ejUTZ037AjIk3x/cNZvUtrq2kXpS4aB3PInE+HeBd1yFyfIz4klpOOrsafkzqHPbEb5mv7h5XiHcDvw45RVujD4rykLO/ibT7o08aXxNGFYb6nYwCd0ONrDL5HrRHi9Vx82i+TkoUe8BhlJreoEZMqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=11fdBdw5kdQOOY7SiWW2SIjX5WEG0dPVkVlfG3IE5nM=;
 b=oBjRt4kbmEKfKv+dnXAf0Ym2wlOa4OvovzpwO4NxaSScoe+63EvegpiN8gFIcs2CrY1gQ1Odt1VUhYtFH+Jso9EiFfPw7pMgPe8+srD5tE5BT/Ipabf5fWgyQgAg5HOKaUziY6nnXzV7yXeRUwBdw8OAkj7V26ePMSr6V0viwvqtdPKcvTTvKjz+Jp0mDs7U7Xqw6WRlu4Ygs5piEP80+dKji+Zc1ryNDhs7A60hC88KWLb3iHzmovyzzzM4ZfNdDG63qSf8ixgWQPeKyV2UWhjnySz7+DJimITDGdJUC8IJIR27WldHyZznCFwi+unKhUPBQELNsnX9sFigSe9+Vw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH8PR12MB9840.namprd12.prod.outlook.com (2603:10b6:610:271::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 11:05:08 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 11:05:07 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 11 Sep 2025 20:04:35 +0900
Subject: [PATCH v5 10/12] gpu: nova-core: firmware: use 570.144 firmware
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-nova_firmware-v5-10-5a8a33bddca1@nvidia.com>
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
X-ClientProxiedBy: TYWP286CA0009.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH8PR12MB9840:EE_
X-MS-Office365-Filtering-Correlation-Id: 945a0382-6f66-497b-8e5c-08ddf1231179
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dmJKVEZDYlZobjgrTHFFelJwc0lkbkZ1bURYbjd4NkU3dWRlMVpSdnE4SGNW?=
 =?utf-8?B?K0VzWGNqK0NQZU1LWlFuZjBaaGVZb1NkMW1Va0xBTWFXVjhyekllYVBaSlBD?=
 =?utf-8?B?WXV4eHBIQ1hNaFB2ZzlSaWdVT0lYVzZyUXcyQ3NObVA3WU0xSUpLWFp1cThD?=
 =?utf-8?B?c3F4YjUyQVVkUlNsR05tYWVUMmRuenh6Q3ZpMGN0YnQzeG9CMlFjcm9BMVJO?=
 =?utf-8?B?aUhydFpUd2JmVENVSlZyV0k1ejZWd2RZQzhWc2V0eGpabWw5MVdTem83SEpv?=
 =?utf-8?B?bmh1L1l4aTF6c05Femx6cDhNLzkramtKN1VYZmlnOW8vTkpjZ3F6RzVLUFRz?=
 =?utf-8?B?TU14UEdDdURubkp1eFlTeXhXa2NKVjNmbjdlVXN2OTFuTDhRcjNOSkpwQ3Fx?=
 =?utf-8?B?b1YvSXZ6Sm96TW9tNlFNVUkybHZJT3g2aGFnZWFLc0RWeW9OcUtWYXhjV1dv?=
 =?utf-8?B?RDhpamtPRlU5Y09PVmx6UEw5TXUrSzdkZmxlRExaYmZJTHpNMHlnUVpGUEcy?=
 =?utf-8?B?a0U1M3RTbkVaK2hWYjNDYUtqUTRQYWRreHdPbEpYaUZJZDZDWHlZcHRrYUZi?=
 =?utf-8?B?cU93Q1FVYU0yUU5BUkJndTlET1RZWmtKOEN1ZkJJZ3VZNG1LSjJ5a3l3amU0?=
 =?utf-8?B?aWVvbVhLS2FXVXQ4K2hUcFZnYVNUT3A0OUJuZStmZGpWWmg2SGdOWm1BL3Q1?=
 =?utf-8?B?TFA4NzlmQTJ1azVkYStLQ294ZGtFWkxnU0xxWUdiVy8rZVhESTBWUWF0clVh?=
 =?utf-8?B?THBkcWprVzZhUFhyLzhPWEw3ZlZKdFYxSkRaamxTMDRianAyR1pFNm9SaG9a?=
 =?utf-8?B?V3VKTmppek04YnlWVFZ0YXN4RXRmTGF1NXk5M3hyUFBoRm9TSkRnTXkzeEJO?=
 =?utf-8?B?QVVsVFo2OHFPbjJodkFpUnBZWjZJZkVmUGRwc2tXcVB5SWhuM0FSYldNNit4?=
 =?utf-8?B?RmFhcy9HZGwzRUVyMmxXSzBRUTFJcUZKVjRnNlM0cHZ5bUgvRWVINTZqbDZG?=
 =?utf-8?B?NWh1dFNqTnJHMXB4V2V2MFQ4dEdyYnhHd0lEZGZpMGY4UEdhZUtBYzlRVHpl?=
 =?utf-8?B?UFVhVXpVSU1VOHFZV1A3eHFBbFk1TTlnMUk5ZVNuczhMNmR1WjNxUjhvZ0xi?=
 =?utf-8?B?Z2M0M0Y3QnVEblRLbTdYbGtRTUFlV3BISU9GUHplcU5WUitTcjB3NTZhRXNh?=
 =?utf-8?B?elVUSnorbTAwRmpWSUt3U3JuKzVmOXVqMFRlZzJjVEVFcnFGWHF3RTl3Uy9p?=
 =?utf-8?B?TVpoYWNNT3RWNUw4a3FjKzVmTUc3R2J3bUNXOWl0NmdOdm4vYmc5TUFiWTNu?=
 =?utf-8?B?R2dhSU8zN3dNeHhBY3F1TDRGTmpzZmxmT3FBbnBJZnp3U2F4a1d0cU5EOVZk?=
 =?utf-8?B?MVlLcUc5Y1l2TE10eHlFQmRjenZSTktzR2RxUlFHZjVJbzQ5cExYQkhEQ0p1?=
 =?utf-8?B?MjdVN1ZPZStkdnNtWnZpamlFYTNNcFpjSFR0N2p5SUlRbkR6Nm5ZdjZRcXFh?=
 =?utf-8?B?N2VEZGRscFE5L2FyYzQ5NFhvN2ZGc0daRlc3NW9ISTlzSERybUphRGJJN3M0?=
 =?utf-8?B?cFd2MjRtYWxETG1yTlQvaHpzWXEyYkc5RVNYTHEzYU5CbWRDSmE2ZmhPTnM0?=
 =?utf-8?B?a1RKelFHbEc5UWR2NlZIWTErUUN3dGFSMFMxd0x2TkViNTkzQnd1c3I5azU3?=
 =?utf-8?B?U0RLaXhVUkdPb2c4ZUhkd2I1ZUNRZXRwRjZxK09CUzVoMVNkYWVvM3BGdExm?=
 =?utf-8?B?QVorYlFvMmxDeUIzTHJMTDRRcmEwVnJ2dzhIbmx6UWVQWENtUEJvQWRSSkJU?=
 =?utf-8?B?elBmNlAvL2lGYyt6NjFlY1BrSklaY1lzbWgrSVZMSlVObzZFTFhFR2NnOGRZ?=
 =?utf-8?B?YTdKNWFsRUtZWFg2N2dJR0cwSGJmTUhDS1BFT1BJSldWK0dkQTc1S2svT2pn?=
 =?utf-8?B?Sm9HNTVYZDlacUljSjVIMU9xV0lVOWlnTVUzNnBMbm5hSlZ1d1o3NlhFcm9p?=
 =?utf-8?B?Yks1bGdWQlJRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2w1a2xTQ2xzQytTelN3S2xxcDZYN1E0U0VjdzhNdjU0MzZuSGxyNTM3U2RL?=
 =?utf-8?B?ODZLSEhjSUNDMUo4bVZuejNnRDlvRzhJdURTZ1gvQUl6alBienV3eDBsck1F?=
 =?utf-8?B?b09qa1NOV01mWURrUkxtUG1TTHhOdzAySCtOaExiRGhhbFU0VXVWWFJuczll?=
 =?utf-8?B?eUlORVE5SHc2OWtuRkQxOVpJUFJVdE5mWnJvMUYxSlVyRDhKV21TN3NYK1p5?=
 =?utf-8?B?MFNjOXBqZ1FIdTFlNzB0clFKTmtIOTlmaFdqV01OWHhldmJQZ2VwOW9tU2Rw?=
 =?utf-8?B?YWhHUkcvQW1LL0VrVGRZQXIzbkJEaE5NWDk2Vk1CdW9lYmMrbWpia29tbGQ2?=
 =?utf-8?B?WEFHdnc1UjNjM3BLLzdBdS8yb0w5UjZzQWgya0FoV2FHOEYwZ0hiZ3prajlC?=
 =?utf-8?B?dks4WHVyNm12Snh1WkMvK0Z2bk5oYUFmMGhyY2JSZ0svOXB4ell1TFJsdlJr?=
 =?utf-8?B?MDVoQmdrZDAxUnEybURDWTZEODhGRUlBek00dGxoQXRYa3NiT2ZTRWhkeUkx?=
 =?utf-8?B?ZkdrNTg2UVRLQkRmV2tFR3pCVzAyZDNkNFFRV01XT1BwWThGWWtDS21rOEFr?=
 =?utf-8?B?MDlqQlFUZk5KcUtiRkk1N2NIRVgvdTJMaytxTFVWbDVTU0NvSE5PcUFYSzVF?=
 =?utf-8?B?c0g1Wm0xS1FxTVRiYkdFMFh2cklvZk9ydEJGeDA2eVRYTldnWCtKV3pLait2?=
 =?utf-8?B?TFpMenhsVFFqU2V1bFRFVk93d3VMS3ZId1J4TXFsVm9QV3hZSlpQL1VZaU1p?=
 =?utf-8?B?TFcxbnFubEd3bVBRb0luSXZHTXltMTRBeDlnYkZHTzFXTmEzTEhSd21OZTFz?=
 =?utf-8?B?bElVS3JxWTFLNU9SbTRQa0tCaTJjV2VTTTZRYUgwbEJHc29RZ0pPNi9yWXp2?=
 =?utf-8?B?RTh6QzFQN0J0Umt2elRNTWM4ZEFHdlJWVUZ6R2tlaEZ2eVBOUTlBNHIxSDdx?=
 =?utf-8?B?eHNDbmY3NURXSG9icGRkMlFGcEFjS1N2U1F1MjBYaTFURmc4VnF6K3Zpc2VT?=
 =?utf-8?B?a0FnVDRVb2ZMR3hlSmJvZCtsRGpxYXFVYzBwaWw4THVoNkJIemZXS3prSjJi?=
 =?utf-8?B?ZmFLblpGLy9mM1lHOEtFTGQ2anNDdGRoVnpENFA0TURxWEpzamtNOGpPaUsw?=
 =?utf-8?B?L2I1NDV6RUhGeXZoRFZ5dG1nelVhRTlEWFJiS3Y0TE1QeEZVVHJQcW9qOEZy?=
 =?utf-8?B?WFdMMzdBZ2dtOGljRndUZldLM0E3dTNqS1EyM21TbkZ2WmU3ZzFETVRvRVNy?=
 =?utf-8?B?L28wdmJBeVpKcktHV1E4aC9ma0hBdWhMZm1pYUZ0aHpyekU2Z25nVUdTSGdW?=
 =?utf-8?B?STBobENXZjI0VmNRdkF5VXVoT3EyVVk4TFlNMGNMbjQ5NGZySUlXRlcrWFlG?=
 =?utf-8?B?QXZnOHN4b3d1QlZ2aHhBS2NsWThzcmpwQy9uLzVhZzdmSEp3MkQ4bTltTUNT?=
 =?utf-8?B?Ukd4ZDgzSEtpQmViQmlWTlVvTEdLbU5TNy9VZ2ZXRFRIckkycWkwY2Ewd2Rj?=
 =?utf-8?B?aW13L09adEZGVTFnVGkrSWRNdm1CUy94bTBoNzRjbDIweWFCUFNBd0xKMkx5?=
 =?utf-8?B?VC9Qemg3b21kWTlyaUJlc3luc1RlQUJHZE1UcHZ6eGtxNFhBYjlLZDRPNDQx?=
 =?utf-8?B?b2hpY24zbmJUcFowdUFRNFVtbnhpSFBkUFhiMFdVN3Nlai9Nbmk2Y1RwV3pE?=
 =?utf-8?B?TVZON2pHSFA2M2E0YnY2elRDR0plVnhsQ09GZ3duTW4wYmJ0bGZlek9kWUpq?=
 =?utf-8?B?R2loRFdMRzdpNStjSnBKdGJrMzVSL1JDa2RDWkh3Qm9la2hYV2RIdUE0MzVy?=
 =?utf-8?B?UzRKM21ZSUlUN3Faa2ZwUy9nYStNMEVCdk1EMithaklQUWxQQUtsNzhWak9n?=
 =?utf-8?B?cElGZ3pVSWVrRzRPVFJ2ZUV6cEcvaGVjc2hjeDF2V0x3MlcvQVNLeS9XNit1?=
 =?utf-8?B?dzcrOGVPdU5VZHp5Vml5YjdNT3dRMktjNEJJT0hRc0kvSzVmYVR1RnNwNGNV?=
 =?utf-8?B?aHNKdFV3V3psQ3ZjRDNGa3FFR3crc1pWQkFDM3lHT0xrOTVmcnF3NFc1TWtN?=
 =?utf-8?B?Qk1makpYMmUvdWF1ZnZqNFE0Z0pIWkxhaU52blZGL0YxNDBPUU9KeUF6L01y?=
 =?utf-8?B?U2dIV2V2ZVZrYWgyczNKeS85aGU0UXl5NXN3UlhrZnNTM3dzemhuRnFMTWRI?=
 =?utf-8?Q?znAqojO/z5bIBM6LFu8XPK2PV8d9/k1KCpc3zPiUh0ht?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 945a0382-6f66-497b-8e5c-08ddf1231179
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 11:05:07.7206 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SJ9fwteMsi4fU9ocKiDsftFN1DmZ/9cwH4aI+V1UmjLJkdYneOJ+T7dur9Xpcr0F6nmBxQm/PNB1ftuRxnw63w==
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

570.144 is the latest available into linux-firmware as of this commit,
and the one we will use to start development of nova-core. It should
eventually be dropped for a newer version before the driver becomes able
to do anything useful. The newer firmware is expected to iron out some
of the inelegances of 570.144, notably related to packaging.

Reviewed-by: John Hubbard <jhubbard@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index af7356a14def2ee92c3285878ea4de64eb48d344..9a97e97a3c7b4ac65b66e4e5f092839720ded82d 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -21,7 +21,7 @@
 pub(crate) mod gsp;
 pub(crate) mod riscv;
 
-pub(crate) const FIRMWARE_VERSION: &str = "535.113.01";
+pub(crate) const FIRMWARE_VERSION: &str = "570.144";
 
 /// Requests the GPU firmware `name` suitable for `chipset`, with version `ver`.
 fn request_nv_firmware(

-- 
2.51.0


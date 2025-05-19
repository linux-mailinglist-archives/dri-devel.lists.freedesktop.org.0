Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 137CAABCB39
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 01:00:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AD1110E2F0;
	Mon, 19 May 2025 23:00:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="gcRFQV87";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2056.outbound.protection.outlook.com [40.107.92.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1ACE10E2F0;
 Mon, 19 May 2025 23:00:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ib0/s8n1CLZwVwTXaQcfBHU6t8DSBEmiC+9xsQXHGJ23EWDVjxSm/SX29ratlnmKh9fohzzz+amqgLNijsOSBKu6idlr9tFHZPtVAx322HhNEiwvb1s/MPOvBKurn1xyvr2YeNdjfzjx62pLedv/tTTSF3ETR9tTeADfK3mK8CDHMHhViRf/WSJD8ksNaFLlpFati9S6pWCutBt62cL3oKJnMkZ39TiCjhGCtq4kbboNSHmAzdx6oLBvh4S+wIRSAICfBxAt224dUbg7NpPI8IoecAOantgfjSePK0KdyJQf0ah9YS+edvcSqBogQkRMx+6XIL07ZTNR06VdglS90Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fwuHCo6wfWwXQUaETwyhZviG+hpnJuNOl0PxeudkUxs=;
 b=V55++A6FtvuoRTu3aIFf0Uv3yxwXQDtxSQAFX3rBzcmkMPCwnaDUrwravJ1GEbd+NXLAUkbOCXJbQi3AzRFdWZNi12oWLgr//wFn6qtOIZD+1j/K2OfQZkT+uEH1vIyoftqBxbAfrhDanUdQ3Ona5LLqREyNRuJUKoHawaRIL2SVETSkwECGRfss8cJgER6uX8eA2vWj4Jf/1mJCKaZ73AejpnYOItmuuDWrPeNplEOxhwNP0mtBx3/EyO/Bbak9TSTKiis7tpE6Qi/vC+jYeNQM8SEvzjr701e5dLj19Tt7N5FsusQLw3oKjiP6SrOblOq7y/KFfRnRo4j4NRAwOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fwuHCo6wfWwXQUaETwyhZviG+hpnJuNOl0PxeudkUxs=;
 b=gcRFQV87JK6OsSvb5YWqdN4+rQ/aHOJAKI+IsYBeMP2HtuGA4/ZJdI7wUdzWkuzrj96bqY0Rxfz2mtQgY6KeOfGCA8/5Wcu1geggXRIoJ7WsG0eVYI3wYwMxLZq/UhFsC53AYmBUzTYT00+8gKJrPA+h8HvEv/SjRoS6abi0T5QCIbHCyD0cq4cFmqZ3981er+gIOXpdCVs9774oKk8ohJv7aNCDEIl9MxBobt99n4/MMqtX5aR/QmGLcfWTP5l9a0OnuWtCdm+azBTOYfSGYSVyqzuy24yVrsLcTNRvUvFKL/G9ldz85cHEHwPpDVwHNMYTtIEIfZ/z6Ao5xVDYnA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by SA3PR12MB8024.namprd12.prod.outlook.com (2603:10b6:806:312::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Mon, 19 May
 2025 22:59:58 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 22:59:58 +0000
Message-ID: <d79dd1dd-8660-4e67-8d44-a49b1a4a3add@nvidia.com>
Date: Mon, 19 May 2025 18:59:55 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 16/19] nova-core: Add support for VBIOS ucode
 extraction for boot
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>, John Hubbard <jhubbard@nvidia.com>,
 Ben Skeggs <bskeggs@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Shirish Baskaran <sbaskaran@nvidia.com>
References: <20250507-nova-frts-v3-0-fcb02749754d@nvidia.com>
 <20250507-nova-frts-v3-16-fcb02749754d@nvidia.com> <aCTDk9UKRWHWYexR@pollux>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <aCTDk9UKRWHWYexR@pollux>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN0PR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:208:52c::21) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|SA3PR12MB8024:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fb911b4-1e30-4b6b-747e-08dd9728e0dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aFl0R04wVTVEVFMwZFJ2cHRKL0V1N3VnZzMvSmtVL3REbEFQdk5Oa3hCRW54?=
 =?utf-8?B?N21FL1VZWW1FZUg4amgwajdWdzd1QUhZVjVwYm5Ud2g1ZWl1cWljejJuQ2lI?=
 =?utf-8?B?M1dkR1ZYNndDWi9ua08xQmJXNWxIMjZSNkZqNHNTNHFwNnh5M2tCeXpCcUFD?=
 =?utf-8?B?aWtSWllNV0gxWVM4eTNORGdEaGxkZTFjQXNGdEtPd1cwQTE1VUdRVXVPYnpX?=
 =?utf-8?B?U2pCeEdXa0s3VndlaCszZ2gzZURONUpXbU5LdTVqdFBCeTdkTlBQOTJuZEF1?=
 =?utf-8?B?a2FSaHNVNjV0bmREeGFXUG9xNUxZYTRTTVBGU0xhSDRwM0piL0VDMkZFSWxO?=
 =?utf-8?B?bjc4ejBIL0t6eEhjaHlvYXpnZ1RCdFIxbGFzUnFCZ3V2aFA4TG1CWlF5VDVp?=
 =?utf-8?B?OTJ1YjJxWEUyNWhEL01ZWXM5czJqVzl3bngxMWJZUHFGcXRTbklKWmp0VDFG?=
 =?utf-8?B?SEtxSVJ1SnB2ZitDLzdLOEJIV085NjhnbHZQa2tWMWZZWnJleUNoY2QyQzR1?=
 =?utf-8?B?VmVZck9sVnorNXBycWR0T1R0d2p1TGV1MXZ3QXFLWVRHbzNKOEF2Q1dNN2VC?=
 =?utf-8?B?dzVsOFRXWEdtV0NFdndUUmt1ZitSU3VQWVlWS3JLWGpTMXM3WURrRnFmMVY0?=
 =?utf-8?B?S0R6Qyt2bXU2dTFxNUxLTTQwY1IrbHdiRzVORUp1Y1lQbGF5ZnhuM2t3amFK?=
 =?utf-8?B?YUhERTY3MmtxRHp2T0ova2FoNFNHWElUVmJpY0gwNlZPemNzaXNWd3NuMFJF?=
 =?utf-8?B?SHB6UGpQRk5halE0KzdPQjk5MWM1YlRKYUN0eUphdnpyamtidm80WVUzUVdx?=
 =?utf-8?B?aDJ0TW1lMW0vZUM3aDExdnF5NFl4S0I5ZHlUckUxWEMyNEpNV1U5YmMzVVh5?=
 =?utf-8?B?c3Q2RzJFNUExM0hvbmo4NXdUZ1doa3hFUFhnRmxxWVZxQjhyazlGNmc0by83?=
 =?utf-8?B?ZWJ3dm5neVM4cENBSnFqZW11ZkViangvd2lWdXd1Tlh6VE1RWFJnM1V5ZVd3?=
 =?utf-8?B?T3k2bE80UnV6ZFkrK05heDhLNDU3VjZIR2x1K3Z4RzE4QzFkYm82d3RRVFAz?=
 =?utf-8?B?ejdTSnJrNzRuMVYrRmkyT1dKS2lmTDVZQ2JRaDJ1RktoMy9GZTBYT3h4dGh4?=
 =?utf-8?B?UUd4dkdQQzd6d2pJRElTK1JadzVySTVTUzRCY3BoYUc3TUU3cXdWU2tXclJF?=
 =?utf-8?B?RVkwTVlZZXZFdUJSemtWcXVCUU0yL1dVTXJBa0dDWU5XOTFicXRxdGJjM3dq?=
 =?utf-8?B?UGplTTNVNGNyVGw5VlFBQzIzc0hXMGZtRlgxQTN1V1lLNUlwWFhaSVk4S0M3?=
 =?utf-8?B?OFloSHNNcjZTZnpxNXhQQkRGc3hRSVNJL1J1TXhQYnp6YzBUZ2hIRmNTcWg5?=
 =?utf-8?B?c2dUeGI2bWhEeGhwMXU4cWhwR25DWmYzeE9BOUtkWk1uUkQ4RlJOMnhXQm1m?=
 =?utf-8?B?YVgwVy9YSmJ6Rkc3OWFlOXRPSFdNUVhRdTVIdUIyOVkvdVNRM2M2VGRFdUlr?=
 =?utf-8?B?OC9NQy9IbE1idWx6dWNvUkREUDhmbEl3Y1BMbnRUOEpuREhZZCtETEFrcVc1?=
 =?utf-8?B?N2Z3TWFOVzI5RXByZWVla21KU3EvVEpDaFRMOGk5VWt0T2hvUHUzRFAxTGJX?=
 =?utf-8?B?ZEVITGVmZkR0M29GVXR1RUtFdGRCTjk0STR3VGY5K3VpOVZrZEI5QWhUaC95?=
 =?utf-8?B?aUpPclFXNkZiWVdWWW5uZTY5WVZ0MVpWZVcwdFMvVCtIREUrL05wa2YycnJo?=
 =?utf-8?B?VDJ6UEEvaEFzYThCUjkvaVh3cU5ydTlyek9mU1pOWXZndi9mQ0hyUnNEdFRn?=
 =?utf-8?B?MUhicGt5UUsya3gzZmdOK2NzcGJ0amxMT1lqOWpFcm5WdlQvK0RNc1k3QWlq?=
 =?utf-8?B?TWxnTExJaU5nRkdVN3Z6SGdKZnlUOHQ1d3krVy9ZbUtEYlJwVVA2Wnd6dTVn?=
 =?utf-8?Q?ajeaY61etI8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UDBmZzNSYVByZ3NxTjB5QVYzd1BoZDFWc2sydkN2eXJCZUNoYnllUjd0SUtC?=
 =?utf-8?B?ZHUwQ1Rmc015b3gybmV3bUFlUXowSCtVc0R6Z0k3OStjOTR5U3F1M2ovZy9N?=
 =?utf-8?B?SmxiOXZpTnRNdTNuME9KVVJNbGx0VFk5Q1ltaXhFMU1pR2J4bGVmZDBsclRK?=
 =?utf-8?B?NlBoT0hUTWFJenF0dGhQc2gySWNhN0duU0ZDYVFHN3BHZTIzY2pVdkJhbXV2?=
 =?utf-8?B?V0RibzBFbHA0VS9oQ2ZBUGxsZEZXTnpFUXpHd1hzUW1sZ1BpcTgzOThqTGIw?=
 =?utf-8?B?V3RYU1A5NkFHdGtFTWFQVXdqRVY0WHN5MkJ1VFFuQ2JoMjFmV2wvWVZUdmht?=
 =?utf-8?B?dUcvRks4TklmOG9PRFVDSDhObmpsTHB6MGRIUWtPbjBsVUI5dVZkM2lyRHhu?=
 =?utf-8?B?N1lWN05yRHFwLytPSjBOZy9XOWhocEErK005WjROTStDMEZnMC81OEhIUzFt?=
 =?utf-8?B?ckZRUG50dVR1bkNsMU9qUWo2K0oxbFF0RUdBUzF0NFVoOE0xZWQyaFdmRTBO?=
 =?utf-8?B?N21jUE9la2RBakU4V2lXbzUvV1RFdGQvYnpoNm5BaWx2ZVI1c1pkMjNta09I?=
 =?utf-8?B?bEJsMkZVVGpaOE1uZWpjditUcUNGN1NXc1dzNm9xenFMS1NUQ3lJdlRCclhM?=
 =?utf-8?B?dUhnMk5QYUVWM1hSNzhxMUtWRnNTRjRDaUx4UUdUREVLYUVGTWxkTmo1TUdo?=
 =?utf-8?B?ek9TZjA0TU82UWNnbUtDL0JwdzE5R0twYStqM21QMzM0eWVCUk45TnVjRGJQ?=
 =?utf-8?B?UFF1NVBhZUxzRzQwK2FxVkJ2a0hTQXQxZ1FxcDNia09UdW13bEZwYnRsdy9S?=
 =?utf-8?B?bG92N25ETkwyRkxJdm9oL00reFFzTktxS1ZKSXBlUFI1WkRIOVhQMCt3ajEx?=
 =?utf-8?B?cG45Q0ZJL3AwdHBmd0E3QmZQbmk3MDhndlRodDRPL2pOZXloY2tLenFORzUz?=
 =?utf-8?B?QmpTWUlMVVZmVkVONml6bk9PSS9TOG1IbGhZZXdsVlpkTVRTQTlLWVZpK1Ew?=
 =?utf-8?B?RnkvUUJyK21OcTNrVzBLSnhBVGkycGc3S215ODIwa2dIa2VTWnlkZWtmSHBH?=
 =?utf-8?B?YzJWYmo0Ry9udE13REs0UnFTMHhLSlM3QVNRNnpnMGdsSGhXNXhxdmtHQTcx?=
 =?utf-8?B?WkdTMS83TndydnZ2ekNyRHA1cUVTWXpITmhuWUJpMUNsVmVTMzhLdmdncGhB?=
 =?utf-8?B?VFYxc2QzZXNsbUJzRVNmZS9RSXplUzBlZDNXZFY5TE41eFoyQlhRNk5uRXJE?=
 =?utf-8?B?UE1nUUJRY0hWV3YxN1lGYUJ3d0JrUXNacm1TS3BYd3dNdFBwK1RVbHZjOXQy?=
 =?utf-8?B?enM2RW9QZHZVQUtDTmRacDIzdFBkVGY2N3U2ZkRTY2tkMVhaREtHVitVZkFr?=
 =?utf-8?B?cDF2RUVpS0pGQ2E5SHZzM2JHRGhCZVBYb1k3bFZrbVp3alZaYnRtdkNTMlZD?=
 =?utf-8?B?TGRMT2U0VGxnNnZqcEptZzRYSHQ0UThiNU5nYTZtWnNLZmdaK1FoSG1qcFB3?=
 =?utf-8?B?cHZJM3B6YU90QXZXVmVZQXg0MmtzVEVaY2xucnJDRURqaUphbXZXTlpqdGxY?=
 =?utf-8?B?UkI0aHVCbjRjWEJZQUNrUVdzdmlJdWhOc21WWlUwbWk3YnZWNGpvK1k3ZjZL?=
 =?utf-8?B?NTBCSVpKVmFlVHhVQmcwNlJGZWhMT1gzYi82d3YyL3hOYTJLdXhTcHFhcGZG?=
 =?utf-8?B?Zkp1QmYxZGtVYk1NZkpIeXIwcVpkQkpSK1BnNTBKY2ZsMkR3ZHUyZnExd2dw?=
 =?utf-8?B?ZTJ1YWU3SXBnV28xM2pKTTd2MUhKc1U1OFFldXhsd21xY3pSM3FwLy9lQ1hM?=
 =?utf-8?B?V1BaN0VsZXpLb3ZyeVdPQVpDeDRlVW1ORjZsaFBSaEpMd2dQR2UyTDBCNm9u?=
 =?utf-8?B?MkE3QkF0eCtmbmhOODhDTERoZUw5a0l3bHM0eVpnSTgzZ3k1Ris2THFpbGlL?=
 =?utf-8?B?M3I2YkxaVVJHTzNTSytmR1NCNkRwNGprMERPMlc1aWg4dWlUUlpHWVQ3RXJ5?=
 =?utf-8?B?YzNJSHRZaFVwQ0N0c1NrT2NEU25waU1NVXNxNnJLWGc0R2lsdjluZVJkVElC?=
 =?utf-8?B?di9oUDl2TW5aSDJsM0lScFNBdSs2ZkwzcnptbDBQS2pYWjMvUi9GcUVNbm9U?=
 =?utf-8?Q?dpmHiEunyCJikY4ZsJ6924zjN?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fb911b4-1e30-4b6b-747e-08dd9728e0dc
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 22:59:58.5094 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tuDoM6F83dYeRsraIRr/qAbfSPar0Jo5LlPpuRH94tjHcw0bh3HV0RjdOCuIGfB3bisEIqa92/JjrpJadYfUFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8024
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

Hi Danilo,

On 5/14/2025 12:23 PM, Danilo Krummrich wrote:
> On Wed, May 07, 2025 at 10:52:43PM +0900, Alexandre Courbot wrote:
>> +/// PCI Data Structure as defined in PCI Firmware Specification
>> +#[derive(Debug, Clone)]
>> +#[repr(C)]
>> +struct PcirStruct {
>> +    /// PCI Data Structure signature ("PCIR" or "NPDS")
>> +    pub signature: [u8; 4],
>> +    /// PCI Vendor ID (e.g., 0x10DE for NVIDIA)
>> +    pub vendor_id: u16,
>> +    /// PCI Device ID
>> +    pub device_id: u16,
>> +    /// Device List Pointer
>> +    pub device_list_ptr: u16,
>> +    /// PCI Data Structure Length
>> +    pub pci_data_struct_len: u16,
>> +    /// PCI Data Structure Revision
>> +    pub pci_data_struct_rev: u8,
>> +    /// Class code (3 bytes, 0x03 for display controller)
>> +    pub class_code: [u8; 3],
>> +    /// Size of this image in 512-byte blocks
>> +    pub image_len: u16,
>> +    /// Revision Level of the Vendor's ROM
>> +    pub vendor_rom_rev: u16,
>> +    /// ROM image type (0x00 = PC-AT compatible, 0x03 = EFI, 0x70 = NBSI)
>> +    pub code_type: u8,
>> +    /// Last image indicator (0x00 = Not last image, 0x80 = Last image)
>> +    pub last_image: u8,
>> +    /// Maximum Run-time Image Length (units of 512 bytes)
>> +    pub max_runtime_image_len: u16,
>> +}
> 
> Here and in a couple more cases below, please don't use pub for fields of
> private structures.

Fixed thanks.

>> +
>> +impl PcirStruct {
>> +    fn new(pdev: &pci::Device, data: &[u8]) -> Result<Self> {
>> +        if data.len() < core::mem::size_of::<PcirStruct>() {
>> +            dev_err!(pdev.as_ref(), "Not enough data for PcirStruct\n");
>> +            return Err(EINVAL);
>> +        }
>> +
>> +        let mut signature = [0u8; 4];
>> +        signature.copy_from_slice(&data[0..4]);
>> +
>> +        // Signature should be "PCIR" (0x52494350) or "NPDS" (0x5344504e)
>> +        if &signature != b"PCIR" && &signature != b"NPDS" {
>> +            dev_err!(
>> +                pdev.as_ref(),
>> +                "Invalid signature for PcirStruct: {:?}\n",
>> +                signature
>> +            );
>> +            return Err(EINVAL);
>> +        }
>> +
>> +        let mut class_code = [0u8; 3];
>> +        class_code.copy_from_slice(&data[13..16]);
>> +
>> +        Ok(PcirStruct {
>> +            signature,
>> +            vendor_id: u16::from_le_bytes([data[4], data[5]]),
>> +            device_id: u16::from_le_bytes([data[6], data[7]]),
>> +            device_list_ptr: u16::from_le_bytes([data[8], data[9]]),
>> +            pci_data_struct_len: u16::from_le_bytes([data[10], data[11]]),
>> +            pci_data_struct_rev: data[12],
>> +            class_code,
>> +            image_len: u16::from_le_bytes([data[16], data[17]]),
>> +            vendor_rom_rev: u16::from_le_bytes([data[18], data[19]]),
>> +            code_type: data[20],
>> +            last_image: data[21],
>> +            max_runtime_image_len: u16::from_le_bytes([data[22], data[23]]),
>> +        })
> 
> Quite some of those fields seem unused, do we still want to have them? Same for
> other structures below.

I think we discussed this in the previous posting as well. As such, I am not
keen on removing unused fields of structures part of 'standard' specifications
since I only see drawbacks of doing so:
1. Obfuscation
2. Replacement of the fields with some kind of padding so that size_of() works.
3. Goes in the opposite direction of documentation and transparency in how the
structures work.
4. Partially filling structures.


>> +
>> +    /// Check if this is the last image in the ROM
>> +    fn is_last(&self) -> bool {
>> +        self.last_image & LAST_IMAGE_BIT_MASK != 0
>> +    }
>> +
>> +    /// Calculate image size in bytes
>> +    fn image_size_bytes(&self) -> Result<usize> {
>> +        if self.image_len > 0 {
>> +            // Image size is in 512-byte blocks
>> +            Ok(self.image_len as usize * 512)
>> +        } else {
>> +            Err(EINVAL)
>> +        }
>> +    }
>> +}
>> +
>> +/// BIOS Information Table (BIT) Header
>> +/// This is the head of the BIT table, that is used to locate the Falcon data.
>> +/// The BIT table (with its header) is in the PciAtBiosImage and the falcon data
>> +/// it is pointing to is in the FwSecBiosImage.
>> +#[derive(Debug, Clone, Copy)]
>> +#[expect(dead_code)]
>> +struct BitHeader {
>> +    /// 0h: BIT Header Identifier (BMP=0x7FFF/BIT=0xB8FF)
>> +    pub id: u16,
>> +    /// 2h: BIT Header Signature ("BIT\0")
>> +    pub signature: [u8; 4],
>> +    /// 6h: Binary Coded Decimal Version, ex: 0x0100 is 1.00.
>> +    pub bcd_version: u16,
>> +    /// 8h: Size of BIT Header (in bytes)
>> +    pub header_size: u8,
>> +    /// 9h: Size of BIT Tokens (in bytes)
>> +    pub token_size: u8,
>> +    /// 10h: Number of token entries that follow
>> +    pub token_entries: u8,
>> +    /// 11h: BIT Header Checksum
>> +    pub checksum: u8,
>> +}
>> +
>> +impl BitHeader {
>> +    fn new(data: &[u8]) -> Result<Self> {
>> +        if data.len() < 12 {
>> +            return Err(EINVAL);
>> +        }
>> +
>> +        let mut signature = [0u8; 4];
>> +        signature.copy_from_slice(&data[2..6]);
>> +
>> +        // Check header ID and signature
>> +        let id = u16::from_le_bytes([data[0], data[1]]);
>> +        if id != 0xB8FF || &signature != b"BIT\0" {
>> +            return Err(EINVAL);
>> +        }
>> +
>> +        Ok(BitHeader {
>> +            id,
>> +            signature,
>> +            bcd_version: u16::from_le_bytes([data[6], data[7]]),
>> +            header_size: data[8],
>> +            token_size: data[9],
>> +            token_entries: data[10],
>> +            checksum: data[11],
>> +        })
>> +    }
>> +}
>> +
>> +/// BIT Token Entry: Records in the BIT table followed by the BIT header
>> +#[derive(Debug, Clone, Copy)]
>> +#[expect(dead_code)]
>> +struct BitToken {
>> +    /// 00h: Token identifier
>> +    pub id: u8,
>> +    /// 01h: Version of the token data
>> +    pub data_version: u8,
>> +    /// 02h: Size of token data in bytes
>> +    pub data_size: u16,
>> +    /// 04h: Offset to the token data
>> +    pub data_offset: u16,
>> +}
>> +
>> +// Define the token ID for the Falcon data
>> +pub(in crate::vbios) const BIT_TOKEN_ID_FALCON_DATA: u8 = 0x70;
> 
> This can just be private.

Yep, fixed.

>> +
>> +impl BitToken {
>> +    /// Find a BIT token entry by BIT ID in a PciAtBiosImage
>> +    pub(in crate::vbios) fn from_id(image: &PciAtBiosImage, token_id: u8) -> Result<Self> {
> 
> Same here.

Fixed.

> <snip>
> 
>> +struct PciAtBiosImage {
>> +    base: BiosImageBase,
>> +    bit_header: Option<BitHeader>,
>> +    bit_offset: Option<usize>,
> 
> Why are those Options? AFAICS, this structure is only ever created from
> 
> 	impl TryFrom<BiosImageBase> for PciAtBiosImage
> 
> and there you fail if you can't find the bit header anyways.
> 
> Also BitToken::from_id fails if bit_header == None, and it doesn't seem to be
> used anywhere else.
> 
> I think we should remove the Option wrapper for both.

Yes, thanks. That does simplify the code, I made the change and it works.


> 
>> +/// The PmuLookupTableEntry structure is used to find the PmuLookupTableEntry
>> +/// for a given application ID. The table of entries is pointed to by the falcon
>> +/// data pointer in the BIT table, and is used to locate the Falcon Ucode.
>> +#[expect(dead_code)]
>> +struct PmuLookupTable {
>> +    version: u8,
>> +    header_len: u8,
>> +    entry_len: u8,
>> +    entry_count: u8,
>> +    table_data: KVec<u8>,
>> +}
>> +
>> +impl PmuLookupTable {
>> +    fn new(data: &[u8]) -> Result<Self> {
>> +        if data.len() < 4 {
>> +            return Err(EINVAL);
>> +        }
>> +
>> +        let header_len = data[1] as usize;
>> +        let entry_len = data[2] as usize;
>> +        let entry_count = data[3] as usize;
>> +
>> +        let required_bytes = header_len + (entry_count * entry_len);
>> +
>> +        if data.len() < required_bytes {
>> +            return Err(EINVAL);
>> +        }
>> +
>> +        // Create a copy of only the table data
>> +        let mut table_data = KVec::new();
>> +
>> +        // "last_entry_bytes" is a debugging aid.
>> +        let mut last_entry_bytes: Option<KVec<u8>> = if cfg!(debug_assertions) {
>> +            Some(KVec::new())
>> +        } else {
>> +            None
>> +        };
>> +
>> +        for &byte in &data[header_len..required_bytes] {
>> +            table_data.push(byte, GFP_KERNEL)?;
> 
> This should just be
> 
> 	table_data.extend_from_slice(&data[header_len..required_bytes], GFP_KERNEL)?;
> 
> so you don't need the loop and potentially lots of re-allocations.
> 
> Subsequently you can implement the debugging stuff as
> 
> 	if cfg!(debug_assertions) {
> 	    let mut last_entry_bytes = KVec::new();
> 	
> 	    for &byte in &data[header_len..required_bytes] {
> 	        // Debugging (dumps the table data to dmesg):
> 	        last_entry_bytes.push(byte, GFP_KERNEL)?;
> 	
> 	        let last_entry_bytes_len = last_entry_bytes.len();
> 	        if last_entry_bytes_len == entry_len {
> 	            pr_info!("Last entry bytes: {:02x?}\n", &last_entry_bytes[..]);
> 	            last_entry_bytes = KVec::new();
> 	        }
> 	    }
> 	}

Ok, that's better, I took the opportunity to replace this code with:

(Sorry for wrapping)

        // Create a copy of only the table data
        let data_entries = &data[header_len..required_bytes];
        let table_data = {
            let mut ret = KVec::new();
            ret.extend_from_slice(&data_entries, GFP_KERNEL)?;
            ret
        };

        // Debug logging of entries (dumps the table data to dmesg)
        if cfg!(debug_assertions) {
            for i in 0..entry_count {
                pr_info!("PMU entry: {:02x?}\n", &data_entries[i * entry_len..(i
+ 1) * entry_len]);
            }
        }


> In general, I feel like this patch utilizes the Option type way too much and
> often without actual need. Can you please also double check?

Yeah, sorry, I'm somewhat new to rust. :-D. I am going through all my Options now.

I will continue addressing the rest of the comments and those in the other email
and will reply soon. Thanks!

 - Joel


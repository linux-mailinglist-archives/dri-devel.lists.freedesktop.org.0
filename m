Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB811C546BE
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 21:22:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B79110E7A7;
	Wed, 12 Nov 2025 20:22:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="gs+sRy2a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011039.outbound.protection.outlook.com
 [40.93.194.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4A5010E1D9;
 Wed, 12 Nov 2025 20:22:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LRGR2O4gfuCv/pg9sAWy68T/1TbKpYtHv431tAUayYSDEvmQ2TEpJMdDjAFjrEHmyziZXdEVMNtEXLhDKNsxrEgGOIAQcdX3d/wNR8ruzU4NBa+LzXuGJvSeyihiMQS1OHkZJs+Qjr8DnEsi1dCc/Kc9b1dkwvYtr4vcjKfBsH3JH5cz6nbCkrQjq3zjENzwnIOIG+rCJUfkCoczfPobaO8YXeWIWER/kpP/jFu6LXq86uC5fJ5mGrS6n5edsBY2FPbzIGlH5RbMqScnPl5tj5vBhN84Bp1vEPV0KVvTR5/bbkGYvgU4zIprUVAnigkcd39GEgKCyeMp0NVBqwBlQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CPUq0TOeDS8lO5JPdUvx+YUdKTCBd6VwX7wWlZL9kLQ=;
 b=qF6Jhhe+lK0SeJ6qNF5DzO4QwCyN8GBZ8UqkeSETLyZNTjhW5w205WHI//SiohDPmhp4ua6lqoE7DNJnDFUta9bdSAdICEvLmNgzT43fJfuTBapj9fN67Xu1mcc3fjwjI+nklUU2K+8HYmwBtKzA0yD/rh2reEPseKJk5A3rQdN0nJPnXa6DKK0B2yV29bTrohfVDWPuZ8BC1p/zZVXMqo441igyvYzW94gMV+z7bE5YPg1FaGdeNdLMOb5asZq5ceFzQ2lOlAHBushGWXK28Hg/wkZhAWMY4MqwYMLnkACWfgLBaZ5Ea47SyHCEo8i3GoDSzhvBEMfx5T6Z+g1GXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CPUq0TOeDS8lO5JPdUvx+YUdKTCBd6VwX7wWlZL9kLQ=;
 b=gs+sRy2aPkW4iu9RldMRx4nDktQCJwpSBMXrbUL4nyxE/jnFFjblC9/F+o6bB6NwWSecDSELMmDXolWgJj0HyphuEGGXkBMZEtJY0teYUuYVJJgvnoQ0BoWIdDq52okaK1TkbbRNHVD1TjFYI546icrKVcTP2biROw7BFMpUU5OpVuF2gTk9KkUn6SP/lTD6Gwjj5GUTqOk1+crHBkNhv2zgkcfnEqCOHjWKmNh9xMJWNRJod/XSDHsoM3zmZ+Ga4O7/TVMDC4e90Bdk5nv4/JYzoQLbMM4eoEvMv5pDHzvVK3morLH7cpY3SyM0FBhcCl7++axl48ODiMrHlZ+cAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB8056.namprd12.prod.outlook.com (2603:10b6:510:269::21)
 by DS0PR12MB7581.namprd12.prod.outlook.com (2603:10b6:8:13d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 12 Nov
 2025 20:22:46 +0000
Received: from PH7PR12MB8056.namprd12.prod.outlook.com
 ([fe80::5682:7bec:7be0:cbd6]) by PH7PR12MB8056.namprd12.prod.outlook.com
 ([fe80::5682:7bec:7be0:cbd6%4]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 20:22:46 +0000
Message-ID: <f36dc492-507b-489c-8609-6a760526a371@nvidia.com>
Date: Wed, 12 Nov 2025 15:22:43 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/14] gpu: nova-core: gsp: Retrieve GSP static info to
 gather GPU information
To: Lyude Paul <lyude@redhat.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, acourbot@nvidia.com
Cc: Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Daniel Almeida <daniel.almeida@collabora.com>,
 nouveau@lists.freedesktop.org
References: <3b0d776e50fc81797dec2e5d81c86390af78f848.camel@nvidia.com>
 <20251106231153.2925637-1-joelagnelf@nvidia.com>
 <20251106231153.2925637-15-joelagnelf@nvidia.com>
 <970fd472a5284fd5b8416bed6a24e722f9a96a74.camel@redhat.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <970fd472a5284fd5b8416bed6a24e722f9a96a74.camel@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN0P222CA0015.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:208:531::24) To PH7PR12MB8056.namprd12.prod.outlook.com
 (2603:10b6:510:269::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB8056:EE_|DS0PR12MB7581:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ea3d199-c9d5-41c7-f1d6-08de22293e3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z2NydFBzb3NralhNYVE5WGUrcmhMZ3hWMVh6bURaZ244ZWpqTDA4aFB2T0dW?=
 =?utf-8?B?dDlCVVNhYi8xTzU5QzZxanhNNlVGSzIwNXhYUnlBS0xaclYxVWx5SDdWMC9u?=
 =?utf-8?B?YnNmRVlLSDd3TGh5YTVUMk5kK0FUUFZkY3BmQ292RytTMmtWa055UmFTbHhs?=
 =?utf-8?B?R3JEc2U1QjdWaTRGZE1mVWFnazB5b1ZZS3gyVUZXR1BCZ2ZJSWgyYVlTS2xm?=
 =?utf-8?B?M2JGdDFvTXhNVTE3QW1iVDRPSTJnMWk2cXVzaW02K2JKaW5rb0VVV2dPS2Jt?=
 =?utf-8?B?Um5zaTdZOW9kQkpFV0RaU3ZaYUpCN2YyRGVBZVFvQUV2Mi9weGpKRlJmVFZn?=
 =?utf-8?B?SzRVVDVsNUpEeUlLaGExUGRxbjc4dXZhM2RXQlFzcGsrUHBJdHFpaTd5V3FY?=
 =?utf-8?B?NVNOV01wT0hWQlRKTzRtRnlJRUhmR3ZmN09Md3VRU0ZyRjRJV2wySjBFbmNi?=
 =?utf-8?B?MVVvbHpjVGM2bmNlTDkzUnVPcGlLaUwvenRtUjFqVWdZdUErMkhNQ1h6bWhN?=
 =?utf-8?B?WTZjT216U3I5eWJWLys5WElrZXVLczNvNit2Mktyb3dqVFUwL2lVT0kybEEz?=
 =?utf-8?B?Q3UzcUUzR3VzUHNFWjQ0TmZYOHlNQk41RHg0MG8yWlo5SGMxS1RPU2xOUi9P?=
 =?utf-8?B?QXc4a3ZscVNSR0EzYVJuMU9IaWRQNEtvQVZqcFcvRzJlQnBLWm9GcWNPMmI3?=
 =?utf-8?B?RFBuNEI1RDBhcW1pTHZkbWJ2cmlCTk5xZVlpU3lGZUhMU3huczZZazIvOWhm?=
 =?utf-8?B?b0d0eW5aU1pJa2NqaHU4dXhkMWlkdlFuemxUNkgzWTBnMDY2aXYyTC85eGky?=
 =?utf-8?B?eHZ1N3NkaXBCTlNaQmYwQTBRbUVDYXlLUnczdE1GK0tNR1NhdVM5ZHg5MDNR?=
 =?utf-8?B?NmRwT2NGNFdFUFRaWWM1SmJ0WHpab21JeTNITjBzdVVvN1ptcDlTRWhBZGp0?=
 =?utf-8?B?aFo3TGtmS1BHWDQ3d2JjZU0vU0VHbFZYREV4bDhSU0IvckszUGppazhEOXJx?=
 =?utf-8?B?aW0wU05RTllLYUcxMXFmNDlpS0g0RHA0TFdKWUQ3akY4ZFFzSCttampQV1VN?=
 =?utf-8?B?MDRCQzZaMG9pSnRpb2ZyazJOZzZHV2dSdjRIZ3NDQmFjdzdBN2JveGdYU212?=
 =?utf-8?B?cldjTmk4YWZzTWZ2dkJJMkVnT3NLTStPTlpsMUxyMk1MS0wrVnpiemVtZWdj?=
 =?utf-8?B?WmF3amNNc3RKTjVKZXFlUG5vQ2xtSEVOREpkSEpla3B0YVBNOXJkNTV4ZHhS?=
 =?utf-8?B?dFprMVVTQ200QklPMlkrTEN6cG0zcmxKaVNqN2ZBMUxRS29OMSswY2E1Y01o?=
 =?utf-8?B?SkdRemdVN1lWb0xBeGoyY0JxYVlNVjdlWFNzQVlTMG5yV09oUnVsSzlJZE54?=
 =?utf-8?B?ZzRTRDlHRGlNZDhuTDBBR2ZqTXYyV25jM3A0TXZSQ0hTOGRwL2cwdEFWb1Ny?=
 =?utf-8?B?Tm9RbVVRSndtaHhPWjNOSW5hd2s0NHVtMmtJM2FObE95dmtraDA1RjUyZ2Y5?=
 =?utf-8?B?dnlEc1JRL0t0RHRaa2JHTXFLcDJFZDlObFp2ZW9qUURlTndYeW4wbElpRFVZ?=
 =?utf-8?B?c1JnWFNzdDEzeFFrOHg1eGY0c2lWZlFQNlFBSjVUazdFUGNQc21pRnBZZmM2?=
 =?utf-8?B?Q3FxRDUrSXdRaFlYTy9admRjb2VyeG5hTGtlT1VDNU5ObndOOXlyUTZpQnR0?=
 =?utf-8?B?c3VGOU5XcWlnTEtmWCtKOWhmWVhCS2J3MVZqaklmMWZjcW9Gc0V2aEN2TWZo?=
 =?utf-8?B?TExlbHNNMktoNTdyYURKanEwQUxtYXBzZ1dtTFFrMk5YdGhvUzdYcHZIZUlm?=
 =?utf-8?B?a0JNaTZHU2U5VXY0MlpscjBVMFVJRzlvY09UbHBGZFJwYnZmaFZud00vMWJX?=
 =?utf-8?B?d0ppdll1aVlJdXE0MHFuQ09GeHJVVGpSY213UlhGSXE4cDhoK2R5QzFCRWho?=
 =?utf-8?Q?sHV9qmO8Elr+F2pzu6+EAPUEXFODRIc3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB8056.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TzBseXJlNzQvZElCdEZnKzF4MkdDVXcvMGZhQTViVTNibC9XU1JDK0dHRnlK?=
 =?utf-8?B?Q1UwUVhRbXE3dnJWYmFyS1g2eGgybTg5SDFBSTNpSGo1RW1Kbk44MWRBUGNI?=
 =?utf-8?B?VU5Scng5RHJGK0JtYUFSckVHTHV3aFBtc2RHeG9DT3FPN3RPVTRUbjlsZlYw?=
 =?utf-8?B?MUJjNGdzTUtlMmVYTnVlaE1vRjdiM2Mwc0dNU1JFTjA1TXRPalNOajBrVWxt?=
 =?utf-8?B?RlYrbHRnN2QyMWFnWndQM1gvT0k2NWxoY2pwU1hJR0ZMQk4weUV4Yjd3Qks5?=
 =?utf-8?B?Yzl4VG1VbTNHYUxsM3l1b3d6U1F1OHZ4cFVicmdXQlp1bTlVcnVMbTJCRHZZ?=
 =?utf-8?B?MnZ0ZmdVbENib01ZZkI4RENWakQ5Ty8vM3ZpNXdiaHBJeTYwM0FrTEs2L29R?=
 =?utf-8?B?N2tMaHBJbjd4S0o4NXY4d0ZmTXV5ZXgySlJlVjV0SXZCY2FCN0ZVYWxuU29X?=
 =?utf-8?B?US9iTTRnREErelNsNldoL1RWYVMzK3N3K05MZlNUZmdBQjNKYS9xSnc2Vnpm?=
 =?utf-8?B?NmxNd0cvUDB4a3pPZ01JaWtUR2tCYjNnbDJoM2FaNnhpaFQvOU50RU02aUdx?=
 =?utf-8?B?MWJIR1RURHhkcTNDaWxVbUdDeUNSVXN4UGNvQUVYQWI0dHdCVVA1VE83Q0hn?=
 =?utf-8?B?U0ovUzMzU3hVTXVrMFhua3dIU0trQ0VBdXVpQ3dkRE5lWGtxMjBibWdoNHFU?=
 =?utf-8?B?NGZhaWFZRE5KNFMwVEs4b0FsZFN6c0U5eFhzS05SaHp1NGhCbE50MVpWSk1i?=
 =?utf-8?B?dEMwVTNDdEJzdXNEbnNFREMza2JBZUtUZUorRnlMRktLT21FdDFpNFFXUmtS?=
 =?utf-8?B?dmQ4amFIWjdUVlNMRzhWNVd2dVR3QWpQUjA5SUpUK2xRS1VlOGJNNk8rM1Rs?=
 =?utf-8?B?RXVzc0ZSZG9ZaGVJdzRnOER4TitHZHBsQ0dtU0NpaUg4TjBBMURlc0tqdzBK?=
 =?utf-8?B?bEVpVVM0RVVBVGl0TzNNTUFpWlpuRVgrbG9oRnJkbEh4YnlHeDJMWXRReFFP?=
 =?utf-8?B?akU1UEtNckNXZmtrTU11bUZHWWh0eVUzek5sbnJKcGVWYlJOTFpUWXdmeHF6?=
 =?utf-8?B?dCtSeUg0azJaNHE2ZjBxeVNvdUpUUElobjNWcmc1OUo2aTdvejVFK1d2bGQ2?=
 =?utf-8?B?RkpuQTFDMFNKcjBwOW9PMkJ1N0h3SnkzQWtKeHkvZExtbE15VkF2OS82WGQz?=
 =?utf-8?B?YS92TWIwVzJLOU9aTDB4RFI3Y0h5OWRHdzBPc1JzMnRCUjFiV3RsRzBSMERL?=
 =?utf-8?B?NlFNUVRyUUtudTFSVGh3UTFkUjZJVUFrSVF5eWNONFdzaDhCdXV6TTlpeU1h?=
 =?utf-8?B?akJwSjcyUjdRb3crby9UVVNtMzhEQTJZMGpBZkJRdlArWFVFVVNkVWpUNVpr?=
 =?utf-8?B?Snd4Tnh3T2xZNDBUdFVpMkU0TnpvV2NOTGwybkR3VGhKZzFpNWRrY3k1bmls?=
 =?utf-8?B?Szlvcm56ZjBaT2tKSVhqam9IbXY5NnRIcTZjanVjdStCRUFFYUFMaVYza3Ni?=
 =?utf-8?B?YklPaTRPVFl2Z2ZhLzZwLzdWMERORWVYK3JaYlRpd2taS0I4QXpyVlBISE5B?=
 =?utf-8?B?RVczMHV0RlVTZmw5VG5HUzZYaENYOW0rMVhVMUhDa2tackM0MlZkSnhlSVpM?=
 =?utf-8?B?RG5JT0NqRHpLS25wYW5nU2lFNHJPOUpHUWRyZzM2TDJ3TldYa3VWK21lR09G?=
 =?utf-8?B?WjRlVlBPVVZZSTRpYXM1cldvKzRFRFl1MmxjQmhCVlFUQ25NQ1JpRXlWczRj?=
 =?utf-8?B?S2E0em9MUHRUZEtSS0FEUlJOUnZadjY2WlhMMFZIRG1iclVOQnozakZqN0la?=
 =?utf-8?B?MGMvK0prcWZEckpVTnhPcFE5TURlZHJwQkpxcSs3NXpEYktncXYvZ3RaVlM0?=
 =?utf-8?B?aEYwZ3RzQzltb3pzWWpEQmNsRGxua1FpNGY2aDFEV0x6ZExNaTdTU1VzTzEx?=
 =?utf-8?B?aE9YaklNTUVHaDhqQWdNaFdSdFBCM1hyd0dqQjMxNmZuNHFZcUNwNzY5YWRM?=
 =?utf-8?B?VWxiYXUxcHE4YjlvVnBXZm9acWV0Q3d1UTRqSys3VlFZTTBFV2tlVS9yQThy?=
 =?utf-8?B?TjVvUU1EbDU2OXNjakhXTDM0c0RHSHpzRU5nU1g3RmNGMkZXeDZ5c2p3TUl3?=
 =?utf-8?Q?uBZXlChwILwlcH85uR+Cevr1C?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ea3d199-c9d5-41c7-f1d6-08de22293e3e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB8056.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 20:22:46.8178 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5h+TGyZWgIGoOlAnrm20FmPGDhH+tzG3tg7tIWoJpp2HxgCM5F1dvpOIYVqWd9jbKqsCAe6Gm8serdWltOy1uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7581
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

On 11/11/2025 5:02 PM, Lyude Paul wrote:
[...]

>> +#[repr(C)]
>> +#[derive(Debug, Copy, Clone)]
>> +pub struct GspStaticConfigInfo_t {
>> +    pub grCapsBits: [u8_; 23usize],
>> +    pub gidInfo: NV2080_CTRL_GPU_GET_GID_INFO_PARAMS,
>> +    pub SKUInfo: NV2080_CTRL_BIOS_GET_SKU_INFO_PARAMS,
>> +    pub fbRegionInfoParams: NV2080_CTRL_CMD_FB_GET_FB_REGION_INFO_PARAMS,
>> +    pub sriovCaps: NV0080_CTRL_GPU_GET_SRIOV_CAPS_PARAMS,
>> +    pub sriovMaxGfid: u32_,
>> +    pub engineCaps: [u32_; 3usize],
>> +    pub poisonFuseEnabled: u8_,
>> +    pub fb_length: u64_,
>> +    pub fbio_mask: u64_,
>> +    pub fb_bus_width: u32_,
>> +    pub fb_ram_type: u32_,
>> +    pub fbp_mask: u64_,
>> +    pub l2_cache_size: u32_,
>> +    pub gpuNameString: [u8_; 64usize],
>> +    pub gpuShortNameString: [u8_; 64usize],

[...]

>> +mod util;
>>  mod vbios;
>>  
>>  pub(crate) const MODULE_NAME: &kernel::str::CStr = <LocalModule as kernel::ModuleMetadata>::NAME;
>> diff --git a/drivers/gpu/nova-core/util.rs b/drivers/gpu/nova-core/util.rs
>> new file mode 100644
>> index 000000000000..f1a4dea44c10
>> --- /dev/null
>> +++ b/drivers/gpu/nova-core/util.rs
>> @@ -0,0 +1,16 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +/// Converts a null-terminated byte array to a string slice.
>> +///
>> +/// Returns "invalid" if the bytes are not valid UTF-8 or not null-terminated.
>> +pub(crate) fn str_from_null_terminated(bytes: &[u8]) -> &str {
>> +    use kernel::str::CStr;
>> +
>> +    // Find the first null byte, then create a slice that includes it.
>> +    bytes
>> +        .iter()
>> +        .position(|&b| b == 0)
>> +        .and_then(|null_pos| CStr::from_bytes_with_nul(&bytes[..=null_pos]).ok())
>> +        .and_then(|cstr| cstr.to_str().ok())
>> +        .unwrap_or("invalid")
> 
> I feel like I'm missing something obvious here so excuse me if I am. But if
> CStr::from_bytes_with_nul is already scanning the string for a NULL byte, why
> do we need to do iter().position(|&b| b == 0)?

It is because the .get() above could potentially return an entire buffer with
no-null termintaor, as unlikely as that might be. In this case the
`.unwrap_or(msg.gpuNameString.len() - 1),` bit will execute returning 63 as the
length of the buffer space is 64 bytes. `CStr::from_bytes_with_nul()` will then
separately look for the NULL and fail into returning "invalid" as the string.

So mainly, the redundant `.position()` call is it is to handle the failure case.

But you found some duplicated code here! Let me go ahead and just call this
function instead of open coding it.

Thanks.


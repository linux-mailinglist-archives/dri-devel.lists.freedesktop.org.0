Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6ADCC876B2
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 00:06:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AC6F10E4B8;
	Tue, 25 Nov 2025 23:06:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Y+C4wImf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013015.outbound.protection.outlook.com
 [40.93.196.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 134CF10E4B8;
 Tue, 25 Nov 2025 23:06:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ab1eHQFqAiNRPurvnms/jlly1hU1Uc8pBg9ys6/Q3UNaCLC/gxwCyZ66Xau3oKyIgVaooZ9V2zdao8RGZnyqS44Uoh4h/4f7EunnaV9OGW2f0BCOwrpx7iTj4pwcMyUtOt78lCJL5oQUP8ASEgfOK9mpIMkyhmQGgnuXz9wEQw+Wt3Lj3PralfsRCihy8/baGOw0+udVfsAzoJwSBb3p4F0g44gGcC4lUTD7cD2DSXdOfMKiuKDWOYubqnqKwkjvtGws5B8jZQtn0RmnVKwLBLj3WxpXmFHy2CxwfeAAztstIfa5o3Cg8FhYv9z6z/WaUzvQBUBc/DnrpjN8ZPFEaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vJfovsPfr02f/3Ejq1cv0v6n6c/uMcJJormiezrQEpE=;
 b=wVpJ6gVMZd3x3y3zhJr/Q9M2+fjTaK8/E72qWu8MUDPeR6Gh3Z1OB+bwm4NqE/9oeBWu2sX4KOhFIhNjBe10p1eC1ZMsEe/U+RquyI3MXl+W0l9aTGwCEMdFTpow6ujR2fJhLZ9xo/PWccqOgr1oZLRpnqJc0SYFKa7I9BFySKybc/8vFcb1bBhFOKgQLt7RJcrOzCEdiweZQPSEf3cn0XpiiDXCUs3nm1KGwasJymR1yy6oVwU7uOrj+WxKVHfZOkrqZJb7Lp4DUg3RR7KWBLkQ4EAfUAmKgL98+MFZ8LEaG5JtysUSYbsfNnQMOwkC9iBFhbyUqL+QjnhjTQ46/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vJfovsPfr02f/3Ejq1cv0v6n6c/uMcJJormiezrQEpE=;
 b=Y+C4wImfTDxUbcnjF9m7QMCmOJyASsNr2nP53kOe43/kiGljMZ+i6xEgHojm/wWrAdWTN9aqm9BkRa2jO8wKS9RoqqmbtSB1NvaLa+vMQxfuLj/PV8318koWYI1JswkhOK/UM8e6tcFrvn1wBC6peUSD5X2cZtcYBTMZztHsz1EXVLX89Hw+BNDiccep7qSeCeGgHZbTeIoMOLT9AioS5HNW6fZvB27V3BveqgaIT9Y9XPxFsjAk3sTvlXQ7iJZzf4dgmCqdLg+eaC7CtFjQVHyFg1gDYZVUnd1wCD2V0FkPO5a5OymmYRhJlpkuVlMuMGaXKcfCGnnCIsRPBSvnLQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by PH8PR12MB6675.namprd12.prod.outlook.com (2603:10b6:510:1c2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Tue, 25 Nov
 2025 23:06:38 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 23:06:38 +0000
Message-ID: <fa47b9fb-00d6-40e1-9445-e9d2bc9f23da@nvidia.com>
Date: Tue, 25 Nov 2025 18:06:34 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] rust: clist: Add basic list infrastructure and
 head iterator
To: Alexandre Courbot <acourbot@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, airlied@gmail.com
Cc: apopple@nvidia.com, ojeda@kernel.org, alex.gaynor@gmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, jhubbard@nvidia.com,
 ttabi@nvidia.com, joel@joelfernandes.org, elle@weathered-steel.dev,
 daniel.almeida@collabora.com, arighi@nvidia.com, phasta@kernel.org,
 nouveau@lists.freedesktop.org,
 Nouveau <nouveau-bounces@lists.freedesktop.org>
References: <20251111171315.2196103-1-joelagnelf@nvidia.com>
 <20251111171315.2196103-2-joelagnelf@nvidia.com>
 <DEGM8P88O2MV.3D4XL17AMWHJ4@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <DEGM8P88O2MV.3D4XL17AMWHJ4@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR08CA0013.namprd08.prod.outlook.com
 (2603:10b6:208:239::18) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|PH8PR12MB6675:EE_
X-MS-Office365-Filtering-Correlation-Id: f0f9c86e-655d-425c-6af4-08de2c7749ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dWViRTlVT1ZPUEk1Sm1KNklZWDd1SDRQbTBiVjBqKzdYWjZ2RmhNeHZIY1ZQ?=
 =?utf-8?B?bkYvRjZyc2dieU5MMkE2RjNQODRaT1JmcWVRSFJMaGE0YmUycjExdU11OUpN?=
 =?utf-8?B?NXpJWmlFVXZoWmVZNyt2M1l1Yk8vR1FsMkd4SC9neUFZeFJJZEcvblFqdWhM?=
 =?utf-8?B?MmtlN3laSEpwMmVqdXUvb1B6QWY1RHdJMDRRdUsvWkRZV1JPbGtvS1U2d3VF?=
 =?utf-8?B?OTF1L1FqTlF1bCt1em5OY254djVPa2J5VzVLVHNOV2ZDYmhpUjgzNFlyZE0x?=
 =?utf-8?B?bXJGZE9zYnpGTDRReWtaOUVhcXN5QWdWdHMwYWtsSmNkTU51VFVkSXNOWGRK?=
 =?utf-8?B?ZkJNTTR1bjZ2azU1WWgxcjR0RG10Qjh2RGk2eHVCeDRqTHlZU01LY21hM09p?=
 =?utf-8?B?UkI3UGNiL08wUm5pVVFDT1dhOHdoejdIZzFSNmY4dWVoOWdpeFpuMEtiVll4?=
 =?utf-8?B?WDZUdXU3TFZZeDJiQUo2UThxdXg2TnZ5N3JqdUtvQkppOGhiU2NHT2h1RS9y?=
 =?utf-8?B?TTl3b21FTzZzdEI1MVdZNXc3ZmxZc0FmOVJ3Q1lERFlxR0N6OU42NElROGZp?=
 =?utf-8?B?Q1hNOVBaZ083MDFmYlFuVHY4TGhxc0lIWDVaSU9TaHk3M1FxdTBiaWhhY1lG?=
 =?utf-8?B?R0lGUEpOdTY3bEhWV24xUytLbFNVSkYxVXNUa3RHM0s3UFlSU2VHbzVUNmsx?=
 =?utf-8?B?V2N6Vkk5d1d6SUZ4dTU1dXZsRU00SnlQT2tsbUtQOVBrUjhkeE51RXlESUpa?=
 =?utf-8?B?SXJGTHNRekl2aDhuNXVZeEh2OURmeFQ0T294eUVyZTVOT1Z3SFNIcmo0NjRQ?=
 =?utf-8?B?a1g5dEZBcXlaa1dqNVhLSXo0UWJPMGhKeFZrYzQxaEE4eWRZSTUrd1hvRXoy?=
 =?utf-8?B?ckhhVkRja0FpVWpvRC9LaVpMWTJJTWsxQTJsaGhCRlk5QWsxT1hOY2tXTVV3?=
 =?utf-8?B?M3gzdDJscjc0MlcxYTk2cGdpSWZCZk5GVkJEVENzSVF4ejVPdkR3ZVFXQ3A3?=
 =?utf-8?B?RGl4czcwak95bnZadlhEdFM0dXAyK01JdFFERVhSUjNQVUhaUmlkTUNkKzhl?=
 =?utf-8?B?bUE5ak1uZnFPYTcvaFhDbm1DM1V6ZVRNcUNSZTlvNkZ4OC92bjJJbnFZNitS?=
 =?utf-8?B?dXlMVXJYdUdLM2x0TlZzai9ZWUdiRFVPRGk5N3pUNldsK1NxdUU0RHBVaVBY?=
 =?utf-8?B?Vnl4TUFmdjB4d2ZRdUdQQUlDR1ViV09MWmYvY1c5Z0dZK2RBOXl4ZVJRMDdE?=
 =?utf-8?B?UC9CTEl4czcrNE1RS2ExdEZxc29VWnU4T09SRTlHdkNPSmk4OS9vY29MVHNh?=
 =?utf-8?B?M0dmYkF0amkrVmxqZ003N1lySnhQZHhUelFtZzNuOXBBYzdYT3VPNlNmRThm?=
 =?utf-8?B?VDlZaHhmcEV1dmJFbkErT2szS2ZENm5LL3pUc3psRncyM2crYnJiN25aV3RU?=
 =?utf-8?B?Z1hOeVZiNlFRMDdyRElVdDlqQys5WTI5eStKT0pGMmhuNklNcjBTcVJYQTU1?=
 =?utf-8?B?OThaQW9iT295WXk1RklBd0hxUlE1SlRtUmJuNDQwcmRTNzFGYXJ5M01QYlpy?=
 =?utf-8?B?Q3phT2FyY3NKZGhuT2tObWJkc3c5OUhZWFBMYXFXVXhzdVZRZzZ6SXdyallB?=
 =?utf-8?B?RWowQk1PMWtqNFNqSlExeU1EMGJ1WFphaktBeHc1cEladlRQZTMrYVVvZ0dh?=
 =?utf-8?B?aThmSTR0aFNRUE4vL3VmVnFwM2ZHUGF0TGFGZEw1R2lRY0hQMmt4MzI0ODVE?=
 =?utf-8?B?bG8xM3dDMVlXWmFYdGdNZW1iS1BzcURERTNnVXoreUlacmJ5OVppdE94UW1s?=
 =?utf-8?B?NWZjNi9uY3g5dGVGSmIwU29Rc3VaT2M2dzRXSUFTSjVqU3laTU9EaXRxNnly?=
 =?utf-8?B?cXdsQnJjd0FvSjRpdDlmZHBEMEpzNlNFL3NnaFYwNzVabjdnbDZBRWVPVDhw?=
 =?utf-8?Q?PatKYYFXapNEJ+L+Up3Z4D/DYUbwl2jX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?amZwRVFSN3ZWV2RwNmtheGlJdXBFWjFReHh5emhBOGhMTDNHMTVGOWkwVmxY?=
 =?utf-8?B?djZyTEJQcFBJWUxDQzVTSHdiaCtNejJxNjV4VFBoKzYxSXVTaXlqRFdySGVt?=
 =?utf-8?B?RG9sUTFHT1NQNjBJaWo5WVNKK3VtSVdUMDZ0RllIdlZmMk1GSGxNaUxpTDFx?=
 =?utf-8?B?bXAxMWp0Ym1FUDkzZnF5ckZGWVhPUDFxTWRocXpMZ2FTZGlkK28xN01GMXBM?=
 =?utf-8?B?WXY5RklnNElPL0VyV1NiT2ZFeDhQaG1iREpTaW45eGN5UndKRTlFSGpUSlFZ?=
 =?utf-8?B?WERTTThYZnZCU0hvN3NqbU9oK1hrYlZSRlFqQ1VVazArd1JDNjZyV3NmZk9D?=
 =?utf-8?B?N3FPNlBSVkgzNzNpbEM4QkVZd2ZQaUs0dkpDYkZpODNLUkhDYVhnZWM3YnZW?=
 =?utf-8?B?cGFYZzkxc0VMQm1FcU1idTluVHM4TGRLUDcxNmhSci9RMGVETFN5T2xqWTFJ?=
 =?utf-8?B?YlNrTnpwN2c3ejhTelBCVzh1L0JYbU1QclBiQ2lHRzVuRUtndk4rc3JhYys2?=
 =?utf-8?B?dFNPbStqZXVJMS9ydTVKaUFpcHEzOVBnTHBDZUc4dE94cXZZcDZIbk9jUXpw?=
 =?utf-8?B?NUJZM3JqNldYRU1QazZDdTVkMU1jUENqMWlCZXVKV2FvMnp0VUU2eTJncmJL?=
 =?utf-8?B?eTlPazlNb05aWlRLQUpKaW93Y1QrK3NkcmVQSzM3aFFTVVM3U0pqZExPWGlh?=
 =?utf-8?B?c0Zxazk1NmVabGJhdmJKNVhRZCtEWUZTT0xKN3BZcmJhVGp6TVFvTzlmbGpp?=
 =?utf-8?B?TW8wdDBVTUJzZEttOXhiNEx4ckNuZThRdTdUMWhJcEk2bHYvdDR4RlF5elpR?=
 =?utf-8?B?RWluKzVDaHZSL0JCNTJpQjlsKzU5MU81dGN6N2J5Z2JsMHhYd1d6ZnhONUZE?=
 =?utf-8?B?a1FmMndXd2dXam9heEoxV0M5bElCRlRzQXpXSXJ4dEZYaWw1SS9vaFZNTlRy?=
 =?utf-8?B?T25maWE0dTFQa0N4VEdGTFpMdlVhMHFHc2lHTyt4c21HRjVkY21zZm8vNDJ3?=
 =?utf-8?B?WkFpUnowcjJ3MW1VeVh3U0d5SkNUSFNSWkF1c0dhbVRqZzJ0U1ZyRXNaVGZn?=
 =?utf-8?B?aEhkc2lOaXlqdy8ra3o0WXQxRE9SYXdBS0tXaEJPVkdhd3FqNEpQQ0NoYUp1?=
 =?utf-8?B?bW11Z1dqSWpiZlRyaXhWclVxMUdlSlJWYUJUNng1RjE2OHQrWkY1ZmFseG5J?=
 =?utf-8?B?RGNBbk5GODRHWWRTQ1JZRW9xSGpiOWVZb1lLYWpyelRXNGViUnJFcGwxRHBD?=
 =?utf-8?B?TDB6OTlNWFUrTFZaZlplMzIyUmtvaFdJa3VINVNXbUtCbjdtenNqaTRHc2Jw?=
 =?utf-8?B?QmxNUXl5eTBUVmh3RkNEU0htN1hrVGs4TnJOOWZlT00wSXQ5b1VpNzM2QXk1?=
 =?utf-8?B?dXZzK2JjWXRjamprc2REaUZXampwRUo4ZDdEb1JkemJKYklkd1prS2dGZFFE?=
 =?utf-8?B?REhHcitjeVVJdFlTcWlTZkIyWGhvSHpSMGhGUm01aEhWNUVXTXJnL25qWHhi?=
 =?utf-8?B?QUtBREh2RGVpQzVsVFU5MVUwV0Z4RW1GM0JISDN2dFo3RUJPOG5pZHVPaFVj?=
 =?utf-8?B?MDNXazlaWkJvbmJ3ak5laXF4VVJYZnMxSG91YjJWUmNaU21pcTQweDRHTHhX?=
 =?utf-8?B?RVA1bXkrNU5uQmVOMUdlWlpDWTRVRzdSQlN1N2pZdStsSG9TMHhlN3R6WVdH?=
 =?utf-8?B?Tlg3MkN0Uk5LWjd0dHZEcTFnTXN3Z3hjSVlxVGVZQktDZHZTV3FIMnBBMWRF?=
 =?utf-8?B?WTVMZGFPU3VDenJIekZCUExvSkVNNStZSmZxamwxN2hyZzlWNXF0UkxEd3Q0?=
 =?utf-8?B?OEZaUUg3bWk2SnVlOTM5TmFPZVBKOXd5UEZaeFRUMzZWeThXbUVIRE1oNHdG?=
 =?utf-8?B?RlQ1K1V3TGtmWVY0ajQwMzRjamRXM2hlbWQ4WmRNWnlzdWhKZkFLWnRUdjA4?=
 =?utf-8?B?eXp6Vk9SZ0N1SEJJSUZhcUppL2xyMkI1aFpGYWR0czhhWVJJNk0vdTFHVlVZ?=
 =?utf-8?B?V2RXV1hKWnhyRE42ZWlsc0ZacTVXdjNnTEdNUTkzSml2Q0FxTEpuZUp2T0Zk?=
 =?utf-8?B?NXRiS3hDV1B2REUyMGc4cWtPOHdLMXhoOG5HaUovOG5KZEl5emlNYlVNRnZh?=
 =?utf-8?Q?1bK8OXzn1Ph7z2Egy2VWnYm2l?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0f9c86e-655d-425c-6af4-08de2c7749ff
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 23:06:38.8662 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xGIlj8hFO/54cXEYTlXoeJzsN2NkW9i2Xw+mGluUzUUNmPODsNviQMic5VzNKbUJcjmAeDSJeoPyC0TEGdLhzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6675
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



On 11/23/2025 10:47 PM, Alexandre Courbot wrote:
>> +}
>> +
>> +/// Low-level iterator over `list_head` nodes.
>> +///
>> +/// An iterator used to iterate over a C intrusive linked list (`list_head`). Caller has to
>> +/// perform conversion of returned `ClistHead` to an item (typically using `container_of` macro).
>> +///
>> +/// # Invariants
>> +///
>> +/// `ClistHeadIter` is iterating over an allocated, initialized and valid `Clist`.
>> +pub struct ClistHeadIter<'a> {
>> +    current: &'a ClistHead,
>> +    head: &'a ClistHead,
>
> IIUC `head` should probably be a `Clist`?

Sure, but then I would rename it from 'head' to 'list' then, if that's Ok.

The iterator holds the list, and the current position, which makes sense to me.

thanks,

 - Joel

 - Joel


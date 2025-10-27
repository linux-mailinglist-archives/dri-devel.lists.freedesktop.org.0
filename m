Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA005C0CEF2
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 11:21:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDBA310E431;
	Mon, 27 Oct 2025 10:21:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="UaYEIDKd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010068.outbound.protection.outlook.com [52.101.46.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D18610E431;
 Mon, 27 Oct 2025 10:21:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rLwTAKd479eVz6cTVFcrZNGRq89G/7H0sV58LSUyk4gQmPKrCXXfM9FLWbBAPMlehhYNU8Y6wOokK+rYRlR8jfjnJ1cQ20hXezGIUjFpesdL8nRLMTIWPxuPMAxFkwghLIT4uJgrA/ajiHdb/PQacwPDL5q3IVe6NdnIgL7L4X9js4MDRIMKW/O0xDZv1WJgw3/Pbg+ufuFLffXoz5CouP8sj9n+cGW7r8Uu4yUFDzIw35gTI4QW9Z6tt0zxklCRV/92aXCrEHZm/BVYAUkUIY1Elkfl47XMmwvu+YwWldEAcuzN7w48zdJ2mWSByQL1JWgaIsOh7DvfQl103Rx8gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mMlSevWgF5pOk+RUgp88skjvtNXVEsbRwedVvIB5n7w=;
 b=mMGe4609adr+FW6HwqVj3T1TmEbFLwsuoSusXruYRgKLTyadCspMxDq4JXFndk+JL6mvQiFAZRsaW2dYdJCxKVYZQBotEmUmQTqFKKubFC92s5TApiwjNyIaK7m70DLf5k4JCsuWZa77jUnQdoe83UIj+i8h6Zt3zzS/eEaHq6+V/zp0riPX2WKqWiw/WUvqsizVu6vFqOdUGoshoSDNigh/1Bc34wemfDCXHWrITOEvARo2wAXJueq4taTtIBidyr/f2AUAO5dZwWFwi5p/0yavLwn8BPdD74mxrjcCed6m+fQieK/VnAJwW2xst+W/S2cWwjCwjtDMe25QEVJW1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mMlSevWgF5pOk+RUgp88skjvtNXVEsbRwedVvIB5n7w=;
 b=UaYEIDKdu8gaUIYbQyCfwRZgf45rFz3QcGj+DdXKoPoilit7xEzcufxFumRdQt4YJ/7XeCt/F5FOHGf1MpXNDAKsaEzJBJtSAHlvG68o/6evBcc9ldIwOgH6wx4zO/ZNTpHf9rssd9N8DwqMtFbh9Lz+/LghAytacye1ceUdIT4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA1PR12MB7175.namprd12.prod.outlook.com (2603:10b6:806:2b2::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 10:21:24 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 10:21:24 +0000
Message-ID: <02741c46-ae85-4242-b623-f38bb82f6b43@amd.com>
Date: Mon, 27 Oct 2025 11:21:12 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/6] Improving the worst case TTM large allocation
 latency
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>, Dave Airlie <airlied@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sui Jingfeng <suijingfeng@loongson.cn>,
 Thadeu Lima de Souza Cascardo <cascardo@igalia.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Zack Rusin <zack.rusin@broadcom.com>
References: <20251020115411.36818-1-tvrtko.ursulin@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251020115411.36818-1-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0347.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f4::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA1PR12MB7175:EE_
X-MS-Office365-Filtering-Correlation-Id: 014971c0-225a-4476-2749-08de15429461
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZGl6NE1SVCt0Y0l3KzYxb0tvNldEaEpVd2hKSU1pOFVGRm5qMzlhU0o5TkdW?=
 =?utf-8?B?QTdWaVQ2dEtFSHFMeHNEUFNuUVpZMFQ1dlVWQ3h2VWdQbFNWOVlWRkZRSmhs?=
 =?utf-8?B?aHFMbHpuSjBTTXVDN29EMDRPRVpNUmxDWWZqN293TTlWMGpnemUwY1dIdjJh?=
 =?utf-8?B?MnBubU5yajF3clB4Y3lQd1BQVUNXbjhCb1ZPWTcraTdrdVhiR3A2cW04cGND?=
 =?utf-8?B?MmJOdmR4TjlTckRMQ3hyeTlvT0dOa3lyaGNUa05RNjZGWXUyeWJud1BvREJC?=
 =?utf-8?B?RWNJTVZMMEYvTnJ4bGZ1RlQxZzFDSnFBOVJSVzc2TFhsalpxTWVYR0l4SzRj?=
 =?utf-8?B?SXVHbFNaVndaWk5oeTRMK1JpTHVKRk9YRHB3QzRXVHhlcnFWT2JJTVRtUlFs?=
 =?utf-8?B?K0s1M3Y1R2YyT0IxY2JtTytYZkZmQjM5MmJSbFRUc3RESGxKWEh0ZGhHd25Q?=
 =?utf-8?B?cUMzT2V4WlZFTUh4QS93Z1UxRTFmK0FBM25nZ1o5b3J1dGU1V0M3eTNKTzV4?=
 =?utf-8?B?bVFvSmNUczZXR0J0eEpQbytMcDloMlVLSkZmb3M5WEtEenZZODhXRFdMOFZW?=
 =?utf-8?B?QW9xMmVRTExzeDZycElOV0N4OU1pam8yUWVFMk5RSUpab3loSGEvRHluZE02?=
 =?utf-8?B?WEUzeWsyTEFJT3ZvS2FlRmVKd3Y4Z256b2xGQ05jWnFidDBTMG5qbHloYis5?=
 =?utf-8?B?Ni85QUxOZlFEQ1NtOXNHZHZWUGx5YkliWXcvaGFGVC9NeVc3T3VtTndsUEo4?=
 =?utf-8?B?VE8vNDhGOCtYd1VHN3YyU3QxZFJ4bnZPRnNVdENyY3Rxbi9NV3U2MXNwWTEv?=
 =?utf-8?B?YVFaOUtOMStxNHJ0MnpHVmp0bVY5TG5YSzlaN2xka0FweG5ZMGx0a0VzK2E3?=
 =?utf-8?B?R3pzbXY2WEdRT0VEZ0d4NWVpVXdmc0FxaWtsZEcyZmRDQ1NrdG84QjJYL1V3?=
 =?utf-8?B?K3N0d2I2aWJYZzVEYXVvckt0MytrcXpod2pZeFZ3ajQzYjZwS1RLTFhyLy9V?=
 =?utf-8?B?Uk9xTWpaZG9OenhXMU5XNU02eEpiVFRYWVczSitJN2UvRzdRQnBqbEhNQ0xk?=
 =?utf-8?B?RGMxV05nSXR4L1pyUWtJQUs2dnRhVTZJRDNxMTY2ZDk3UGxJV1FlVExJK1VZ?=
 =?utf-8?B?WkZIdXJ3cjNyUDlCNmVpTWhzNDJXdi84Q0F2YzNVT3ZYV3IzV0pFeWI5dlA3?=
 =?utf-8?B?QnhRU0dGOXZSQ281SjNzN1hTLy83SHh1ejduTVRMM0xLc3U0c1pHMzd4R2NX?=
 =?utf-8?B?aG9yekY4ckhaT05UeWFLSlg5VlF2cXNpRGo0Q2tMcUlnVHFKWXFScDFmWkpT?=
 =?utf-8?B?MFBuOFZER1J5NUxDMXgzdTcvbms4SktKb0QyTXNicWFMd090MDFpSWxCVUk1?=
 =?utf-8?B?dWJqUXE5RVA3cEt6UmlYMk9TMXdkZ0Z1bFBacm9teWxqbHFETXBSMVRzUmdn?=
 =?utf-8?B?Z01GdVovVDRFaFpRRFJBVndWLzlFRWIwTXBJbWdxdzVoZmhYQmdNOUNjOFpQ?=
 =?utf-8?B?blpYZ1RMNExERVcycEdpTDJUK3lSdUhpeWNrUTNnU2hyVGZMSk5Wc3krZFhn?=
 =?utf-8?B?TEJmZ0tLSUhZRkQ0OGZrSStKaFlTSVlvRGFkbmJ3eHZDaEhaZWNBN0syWUh4?=
 =?utf-8?B?SzZ5RENVWkpiVjJxSThyM2d0aFlraEtVb29nKzlEdWxtY2dJeVRVZkVjSE9i?=
 =?utf-8?B?WWZJQlBIdWx5b082dlJmYjdRQnh4WGsyZjRIKzlWUmxPcERaaEw2RXNuUWUv?=
 =?utf-8?B?TU51WjVYaXlZaVJKcGhyVWxEVUpDckViMm1HdTBseW0rRCtVcnRqWWpkREFG?=
 =?utf-8?B?dGJ0RUdCMHBRWGNrc0hVSy8yeVluWXMyOW1hWkd3UDY2aFZCUjBBblFXaGpX?=
 =?utf-8?B?Mms0TitKLzRWenI2eXF6T1FTb2svTG5QQVl5NWZQMmZzSVRSRUs1bjRJMFMy?=
 =?utf-8?B?Wk1ObGVWZ0x5UmpmOTZkZUpxVGloS2tEWkMvZkx5RUVibHlaaURqaUduY1Nl?=
 =?utf-8?B?Mmk1Tys5YW5RPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MkpRMnNTay9UeUNaWm5yVE9NL2MrVTBrczZUcVdlODRZSEdVYmYvTUFIL3kv?=
 =?utf-8?B?Y2trMW4raVh5VzdkVGlYT2U3Ymw4dUxXMkFtSDBZbVV6eE1HcUl1dXJMVUtP?=
 =?utf-8?B?dVFNVzU0NmlxcXFzRXpGYjBjNGR4U3pmeTVIbEYvWHhtTUMrbmNqYXRGRWVM?=
 =?utf-8?B?aDFRMEhINDZNVW9CL1pZUXdPWkE1Y25ISDdFNXVzS0lNaVgvR2toS3ZNc2Rn?=
 =?utf-8?B?ZmZLak1RQkhkVUdSN3lyMDBONU53TjRDenJuK1dab0RZaGgxdmZnM0prbFIw?=
 =?utf-8?B?b1VOenBua1NpTUVNdFhvZGRabnZoZWdJTG15Y2lhY25EOGV5cVZ2WGF0V1l3?=
 =?utf-8?B?Yzc3eFQ3THlUd2psNmUrYURQdzJCRDAwQWJDbm9VbmFibHE2Nnd2aUtic05v?=
 =?utf-8?B?SFprUU9xMXdYR09TajFrVitCQzcvd09UNlppRGpCTFFIU0FFbTc2blUzNzYy?=
 =?utf-8?B?Mkh4Mkt3MVVuNE1ZTGdEak1QOE9nMnJQVWxwc1I3TklmN09reG41Y3lrYzNm?=
 =?utf-8?B?cEsyZnFyMXVkanI4TUg4dTFzQnFUckdWc25TbzJQVVhYUEQrdkwxOGowWWpa?=
 =?utf-8?B?cTEwZnY4YlFWNDlPVFZEbzZKSUMzVW9pdU9LbFJiSnM4R1poUzJhZHM0YlNs?=
 =?utf-8?B?cXN2OUxDaHI2cGpBd1UvdFBWaGVCL2hNeUtKRXNvK2ZtdXZtY3huVEIvTE4z?=
 =?utf-8?B?cXVVR0VKWVA0REZra05iTlUwdm1wV2pOMGloTWtLSEpPbEErMFpRb002Z0tH?=
 =?utf-8?B?Sm9pLys5RVhFNmNZUnRIQ1A5Q0xSejFOSjErZThGUVZBbHpQMWx0QlVGbkl1?=
 =?utf-8?B?OGFUaUtva0JucVJMTzFzMVlORVM5c1NrZjVDZlR5MjRhWkhpRHJleHhhSzBF?=
 =?utf-8?B?bjBsMERWZk5YdGo3YVpDdkRVMEtOYlFlekhhNEdoV3ViTmFwMUx3TVAvaGtt?=
 =?utf-8?B?MWxxakowOEhvNzFqOWd1R25YcGJyQkhiRTBIQTFKWGpiaEZRQ2xIaWxTcVB0?=
 =?utf-8?B?UUNRcVdwVlpVVTFUSFZRcDlwUjkrZkRQOWRTTmFwaVd0bzFQK3kxM09YRVM1?=
 =?utf-8?B?Tm1hdGMxaTk1aHNzOWhrSUNweDdudHpHcFptcUM0c2I3a0l2a1V4VFh6SGFa?=
 =?utf-8?B?S2lyOE1QMWJvYkhQMFo5R0N1TEV4NDl5dWk2MnN2TnN5VHVVMlNHTHdGZFg2?=
 =?utf-8?B?d3FlUVlnZ3JFUFVzbm13QlJzQlkyVngyQnZlRTE5OE5FTk9yeVdFMzhxTlpC?=
 =?utf-8?B?WFhJNlN3eHhrY083bUFOYnVGazhlTE96NTVTMzI2L1FPcmRmSjh3Sm1WY21Z?=
 =?utf-8?B?bVVpYUJzd2dLTVpYbUUwZ09UcTBRb3FHRTREV3dKeFNHYURKRmtGY0pjZmR6?=
 =?utf-8?B?ZThxaHRPekw3QXdjQXQzSm8xalVSNDI0V2lpRHFHRTZrZjhXQTNaN1hUY2c4?=
 =?utf-8?B?ZHNOa1MxQkRwMVBzby9IYXJsTklXOHRQcEhuejhuZHYrNThBV3YvckM1ZGts?=
 =?utf-8?B?ZTFpdVJzYWJCdDJXaU1VMkVYcXhKRjdZVjdOUUhzekEvN2Q0WU9jdE9uZ1Np?=
 =?utf-8?B?aGJ3dG9vejI5NzJ4NXIvUGl3Mi9MWldBM3BGN0pFVkhsa2hUVTNLbHJTYXJX?=
 =?utf-8?B?UTYzSDFLNjNuMXZ0ZVlhZ3daekVwTERRSUlOMndKWWRiT044S0t0bDAxS2NP?=
 =?utf-8?B?QmgyVlhTaHN3d0pGc3BoZEFlaU0xL0VaOTROTXRwaEpwUVJLS293cmFvcDFp?=
 =?utf-8?B?dDRTVWM0YWJaRCs0ZkxCU0wyK20waVJyS1ViWWFTK2dtWHEyaHoyc2x0RlpG?=
 =?utf-8?B?RVVHQ2VTVWRWaTVwbXVZR1ViWkVuTkJpTnZxSHdSQ1pvYk96SHE4Q1VJQW1v?=
 =?utf-8?B?Zk1HR0dHQjYwSUIrRTFtV0h5dzVNeVZWMHJaVk5mc0RnZGZUNytuNGN1dXAy?=
 =?utf-8?B?Tk1nVHQ5Q2hjbWdnYjMvamMybzl3aTFNb284bmpmUUtPcTZDeEhCOGlFbXJQ?=
 =?utf-8?B?MHB5SlNGUHkrU0U1TWs5Uk41TTRDREdHZ2h4UWN1UmRmTlU1TStPOTNjL1Zl?=
 =?utf-8?B?TFhkSUUyUHRKcllKL2FYUWdaSDIwY2hjYVJ5bWkrbVhlSTFjSndMcWFQOVJG?=
 =?utf-8?Q?Ef/I=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 014971c0-225a-4476-2749-08de15429461
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 10:21:23.8706 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J2s15d/SflA0TprxYd3WHBGwXO8V1j0BEAsWp151FUR8eaMZc2ii+rR3pCvN7dkb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7175
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

Where not applied yet or superseeded by a newer version Reviewed-by: Christian König <christian.koenig@amd.com> for the entire series.

Regards,
Christian.

On 10/20/25 13:54, Tvrtko Ursulin wrote:
> Disclaimer:
> Please note that as this series includes a patch which touches a good number of
> drivers I will only copy everyone in the cover letter and the respective patch.
> Assumption is people are subscribed to dri-devel so can look at the whole series
> there. I know someone is bound to complain for both the case when everyone is
> copied on everything for getting too much email, and also for this other case.
> So please be flexible.
> 
> Description:
> 
> All drivers which use the TTM pool allocator end up requesting large order
> allocations when allocating large buffers. Those can be slow due memory pressure
> and so add latency to buffer creation. But there is often also a size limit
> above which contiguous blocks do not bring any performance benefits. This series
> allows drivers to say when it is okay for the TTM to try a bit less hard.
> 
> We do this by allowing drivers to specify this cut off point when creating the
> TTM device and pools. Allocations above this size will skip direct reclaim so
> under memory pressure worst case latency will improve. Background reclaim is
> still kicked off and both before and after the memory pressure all the TTM pool
> buckets remain to be used as they are today.
> 
> This is especially interesting if someone has configured MAX_PAGE_ORDER to
> higher than the default. And even with the default, with amdgpu for example,
> the last patch in the series makes use of the new feature by telling TTM that
> above 2MiB we do not expect performance benefits. Which makes TTM not try direct
> reclaim for the top bucket (4MiB).
> 
> End result is TTM drivers become a tiny bit nicer mm citizens and users benefit
> from better worst case buffer creation latencies. As a side benefit we get rid
> of two instances of those often very unreadable mutliple nameless booleans
> function signatures.
> 
> If this sounds interesting and gets merge the invidual drivers can follow up
> with patches configuring their thresholds.
> 
> v2:
>  * Christian suggested to pass in the new data by changing the function signatures.
> 
> v3:
>  * Moved ttm pool helpers into new ttm_pool_internal.h. (Christian)
> 
> v4:
>  * Fixed TTM unit test build.
> 
> v5:
>  * Renamed pool_flags to alloc_flags and moved to TTM_ALLOCATION_ namespace.
>  * Added last patch (propagate ENOSPC) from Thomas' related series for reference.
> 
> v1 thread:
> https://lore.kernel.org/dri-devel/20250919131127.90932-1-tvrtko.ursulin@igalia.com/
> 
> v3 thread:
> https://lore.kernel.org/dri-devel/20251008115314.55438-1-tvrtko.ursulin@igalia.com/
> 
> v4 thread:
> https://lore.kernel.org/dri-devel/20251013082240.55263-1-tvrtko.ursulin@igalia.com/
> 
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Sui Jingfeng <suijingfeng@loongson.cn>
> Cc: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Zack Rusin <zack.rusin@broadcom.com>
> 
> Tvrtko Ursulin (6):
>   drm/ttm: Add getter for some pool properties
>   drm/ttm: Replace multiple booleans with flags in pool init
>   drm/ttm: Replace multiple booleans with flags in device init
>   drm/ttm: Allow drivers to specify maximum beneficial TTM pool size
>   drm/amdgpu: Configure max beneficial TTM pool allocation order
>   drm/ttm: Add an allocation flag to propagate -ENOSPC on OOM
> 
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       |  9 ++--
>  drivers/gpu/drm/drm_gem_vram_helper.c         |  2 +-
>  drivers/gpu/drm/i915/intel_region_ttm.c       |  2 +-
>  drivers/gpu/drm/loongson/lsdc_ttm.c           |  3 +-
>  drivers/gpu/drm/nouveau/nouveau_ttm.c         |  6 ++-
>  drivers/gpu/drm/qxl/qxl_ttm.c                 |  2 +-
>  drivers/gpu/drm/radeon/radeon_ttm.c           |  6 ++-
>  drivers/gpu/drm/ttm/tests/ttm_bo_test.c       | 16 +++----
>  .../gpu/drm/ttm/tests/ttm_bo_validate_test.c  |  2 +-
>  drivers/gpu/drm/ttm/tests/ttm_device_test.c   | 33 ++++++--------
>  drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c | 22 ++++-----
>  drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h |  7 +--
>  drivers/gpu/drm/ttm/tests/ttm_pool_test.c     | 24 +++++-----
>  drivers/gpu/drm/ttm/ttm_bo.c                  |  4 +-
>  drivers/gpu/drm/ttm/ttm_device.c              |  9 ++--
>  drivers/gpu/drm/ttm/ttm_pool.c                | 45 +++++++++++--------
>  drivers/gpu/drm/ttm/ttm_pool_internal.h       | 25 +++++++++++
>  drivers/gpu/drm/ttm/ttm_tt.c                  | 10 +++--
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           |  4 +-
>  drivers/gpu/drm/xe/xe_device.c                |  2 +-
>  include/drm/ttm/ttm_allocation.h              | 12 +++++
>  include/drm/ttm/ttm_device.h                  |  8 +++-
>  include/drm/ttm/ttm_pool.h                    |  8 ++--
>  23 files changed, 154 insertions(+), 107 deletions(-)
>  create mode 100644 drivers/gpu/drm/ttm/ttm_pool_internal.h
>  create mode 100644 include/drm/ttm/ttm_allocation.h
> 


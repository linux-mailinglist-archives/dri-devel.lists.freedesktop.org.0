Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F77C5DCA2
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 16:15:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDFE710EAAB;
	Fri, 14 Nov 2025 15:15:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="czSU60KI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010040.outbound.protection.outlook.com [52.101.46.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7378010EAAA;
 Fri, 14 Nov 2025 15:15:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IWOlrRgeRc2h3ONt9Na65I2ekL4vk53HqhsCeQrPxvuD3y9nijIGddET80VeubR0j9TNJi7r3NOonCNJYtgFVg/6bO3fzgv2OsFYsg6+bcIiFGfodPX3XmmucQiFRgfScGSw6jbjl7aB3lvqYKOUGm7wTx7vwKsfxql2wErBtJVI9DxgmqvxjkofVjwf/pwDGbtGtyWR1uP9QnCAd/XLun4n+yZSh7HUrOua1R2LuSK7WjJJ4koMaQaHsvOJctbUqs22EGsT51s9KYIMan0z/0ugBSBVRPGWTnfPIECD2FKt8vzQemlgnGbeHUZIQiMtsYFo6e+W9B58A9pcfX7Hrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=99SccwjGv6nqsrY9ZIWh4UWry78++jyf1ZctMGojgSk=;
 b=ZhCFVAaGmO3etg8Y5xGIDnbfd1EnpBeWoZSJv5ujMrc2t6NVhlcMhPHIOY6Si6rJ0ppoPC6kRMiERl3C6DLATroXFYeFz4qMFMSeqX2P5Yk1+IISWPFTg4RhBjkYj0yiDl8YdxAQm433aiIQqGX/mgVtexU0Utc3JstLhHfmkfd12gHpdQkbj0o+LNEES5PgbxluzsklJhmlkDjlIIQNrMpAX0Y9FAWiHS4ocijM5Ode15763txcGDqyvQZ9dcfk9gOnuZKgnLyJMuxMkaDLsc3rMe/30eGm3CZEpxLznWV1GW5A/FDhfbtSPxjpQXP0RWY6AXYGl5yFS59N/lHxDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=99SccwjGv6nqsrY9ZIWh4UWry78++jyf1ZctMGojgSk=;
 b=czSU60KIp/WILpiuTLwGMe40SHbxqLECJXdYiuUL+xxHRzGpkg0b3i2RHpSRHzNNVdSWDaeg6awEcXg7/d3Oos11WfraFI9jr2EWhrmPotYPuMx13ZQ2t/+W7aUyMjBD540zSXUb4jiLsz5UaqsTuo/pMfhQtN1OlyrXNB+HJRE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN2PR12MB4406.namprd12.prod.outlook.com (2603:10b6:208:268::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Fri, 14 Nov
 2025 15:15:28 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 15:15:28 +0000
Message-ID: <97f6e36c-93db-48fc-9f3b-30b77fff9a80@amd.com>
Date: Fri, 14 Nov 2025 16:15:23 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/20] drm/amdgpu: statically assign gart windows to
 ttm entities
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Felix Kuehling <Felix.Kuehling@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251113160632.5889-1-pierre-eric.pelloux-prayer@amd.com>
 <20251113160632.5889-7-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251113160632.5889-7-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0026.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::11) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN2PR12MB4406:EE_
X-MS-Office365-Filtering-Correlation-Id: a33397f3-d5f0-4257-dea2-08de2390a4a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a2lwZ2VibWQ4bXVDVmZjVVRNeGZkcmRJZE9KV3h1RkFKeHBqYmdqR0tjbEpQ?=
 =?utf-8?B?QW9pbjJ6NmdSZUNmcUhLYVU2MHI2bU4vTUlvdkphZzZ0cURGL0tOcTZncUxN?=
 =?utf-8?B?Z1lUWm9zQTJYZ2FqQndaV2Yza0JxNXFZQ2pIaU1BY3pCTUd4QnpUbzNtUk56?=
 =?utf-8?B?NHdwcVhOWWN3QWZJUGgzNzF2ZGJaRkdjdjhTUXhZeGY1MnZrR0NrWVVjZ1VJ?=
 =?utf-8?B?VHJaY0tNWWU3SWlOWlhUWmpTQXVPaFlFQ0R4bEoxcFM3b0pXNC85ZW5NYjNV?=
 =?utf-8?B?Mm14M1RQNDFCcDhKTVJZSkVXVUk2ejRTQnl5MFAzQ3dsMHFXWHVVZ3ozS2ll?=
 =?utf-8?B?Ylc2RXF5eHNJWFJsT3RndjArK3h1L0tuaDBjK3JteG5iQzJRV3p3UmtFSkNH?=
 =?utf-8?B?S2NXTEIyS1VIcmxYTXc0ZzdDMWpzamJUNTRrMXdVSFlLVGx2SmhJTEZIZjhw?=
 =?utf-8?B?UnpXdU9XKzhaNjUxL3NYMU1OMzF2NlJCNjVmOWFIVDhMd3NwSi9rUy91MDhu?=
 =?utf-8?B?Z2drU2xadlFhUG13YUZtMjBJMTBVTDN4VXBRdE9meHJOQXRpT3VqUE1nN0g0?=
 =?utf-8?B?OEt1Sm14a2s3MnU0WDl6MkJ5NkxIYi9GR0p3bVh2a1hYd2tkLy90bEk2dlhH?=
 =?utf-8?B?RFIxSWFXcWdnM0FTcHgwQXhJMFQ1bVQ4MnZaaU5tWXp5VkhmVVdkZU1YK3dR?=
 =?utf-8?B?NEtlWFphaTZjek92VHMzVndSMXJVWEJpNmpVMzcvWUFZT0s2ZGJDdjRqQ1Nh?=
 =?utf-8?B?V210RGNmWnliUWQvTUlYa2JWanEyVUQ3eFQ4L3hTZ3VvOFVkNGN2L29EYjBw?=
 =?utf-8?B?T3Vod0ZsRUNPdlpaSUFRZzY0TEYyODhwWElGbS9IV0Jxa3FpQXRudVJxMldz?=
 =?utf-8?B?SEVhRmIrUzI0SXJzeGRYQkZkTUhNVU1QMHJsZTVvd2FSdVl2R1BrL0h0QytK?=
 =?utf-8?B?VHFVQndCNW8wdWVqcW9Pc1U3SzZkQXpPdGdsK3JZOGIxQ21aRHZucGF5eW44?=
 =?utf-8?B?b05uaCtxN2M2ZkZPbjRXQjUzaVFyRkpYeTdGWG5OUnY0VitmWUpBMUVodHVY?=
 =?utf-8?B?bENIZWdMbVZ6YldLbXBPb1doY2J4V3VLb2dJQkFUNENDNXRtb0FmUmdaZnhr?=
 =?utf-8?B?ZUdKbTFtK3lIVnZyQnVEaWRIRkFHVFZwM3Z2SHdBMHk2MUZacm9Vd3JLTkhp?=
 =?utf-8?B?anFmZTZ3RHR0NDBaclgvTXBTUDZnV1MrakFWSWlyMThaRGFZUFRzcU1KOGRS?=
 =?utf-8?B?T0lTQzFKd1dPbS9MdlZMTUZVWnN2a244RU1nZmozdXlmZHVIUmRzRVVMTmZ0?=
 =?utf-8?B?TTFWN0xqVGlhaTNkVDZkY2loT1YvK2J3Z3pzS1R5N3FrMU9TVUZzV2o5ODRL?=
 =?utf-8?B?cjZjS2tLN2hxQzY2NTVHeGxUMzdvQ05GVy8xOEJDQUZ0eDNQYnRFRFJpSzdV?=
 =?utf-8?B?UEd3am5UcDFmZzlSWTVsNU1odEQrVUFLUGIxTU5LTFU0QkFxVTBPR0krS2l5?=
 =?utf-8?B?ZUNUQ2daV1NxWXB0TWxQNnZHMFg2dCtiV1dZMng5UmRRcnVJRnJYN3k5VlhS?=
 =?utf-8?B?dGtra2Y5eG5XWm1zUW5DRlM2YTVGTEVodDBQZ2J6NjR6SHcrUllNeG1oOU5B?=
 =?utf-8?B?bjhMcnZhWGxHVTQzQTZ3WDR1ZVY1R1NGV2prMGFMUndOblNlZit1L1VCcU1Y?=
 =?utf-8?B?KzQ5Q2hIUndpa2NtL29LajJsbWI0b25INzhoaXBTZkpnYThSMTBybjJTR0ZZ?=
 =?utf-8?B?MlNqSzcwYUVaTzF6RFhIWXRGMDJoWWJFeFlZa2NxdkhEbS9HdkJzaDBUQk5T?=
 =?utf-8?B?YU56MVAzWnlYT21uVkRLeUNqTzg5MW9ab2RUMmFIS3VCVkp6RjlXU2NKN0xB?=
 =?utf-8?B?bjFqdmFUZGNnVmZYL1JUUzlZckFzWElCK09wQXFCYzY1Q09YZkV4V0xkRFkw?=
 =?utf-8?Q?EACAr3hjc9gSuZ7IZfGjpMEANz/6QOZ5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWhpRWtCODUrZ2taWDd3NVpFTGZkNXc0NU05TXNxTE1hZ3doVGNHT0VCa1Zq?=
 =?utf-8?B?UGU5R3E0SmJQbUdBMHFHNEV3cjJTOVlGbW84QkNhNkdqWGVFMDFmZTVwaTBL?=
 =?utf-8?B?Qi9XdGVoajJYNWVSQ1VJa2ZhbVFpYm9DREFnTnBPVmUvbVdKSzJ0S0lLbjYy?=
 =?utf-8?B?V0JNQmV5d2M5bmVta0dMVm4zZkxJd1V4Sm56Nk1wQWJwVU92UFQ4TGFjczM5?=
 =?utf-8?B?dDRVL0hqdHNwNXJPZVNONklKemlERXhPQUNpc1ZidElaMndoTWFoY1pSdjNj?=
 =?utf-8?B?Z2c0ampHQWJGUmNHd2xCemRQeUFXUFZIN2s5Q2VLYkp2LzkwVzJyYTdTcFk2?=
 =?utf-8?B?Vnhscm9wRHRaUHRndld0ait5UDYrTVhreDlPclVDbFVCUk5QSUZyek81eWpy?=
 =?utf-8?B?cjNjOFovOUdRSVdaRUhFWnl4NkxpOCtNNjdaUE90LzF3ZUJWdUU5WS9KVVhJ?=
 =?utf-8?B?OHpOVjJKL2NlZktNMk9DSlI5MDloaUdpakFEVU9tbXVJeG1GRzhFSVN3YmZv?=
 =?utf-8?B?R0NoZitrbHNhUS9DTllyRXVLOVZ1YmhEVFlQRGdVdDdLQ21OZGI0THdRcU5s?=
 =?utf-8?B?b21TaGJGN3ZBdUtNV3hhUW4zOHBmSU5YbGhUUFZTQmZuOHE4cVVBWTVKTUtJ?=
 =?utf-8?B?TG0rdWwwOHZsdjRGR0ZmRE5DSW8xaTdwWS9OeTNMK2RKZjF5bEF5RzZYSy9S?=
 =?utf-8?B?bHpxMUxCNGZrQ0g3TmpUa1R6Yy85RkFYNGovN3pEZUZZcExUeGpBUDM5S0hM?=
 =?utf-8?B?ZDAvU3JaL1R6bUd0ZXV4Z0x2VXJqUHJOTDRsQS9iNjJqUTZQWFZscWx3aXZy?=
 =?utf-8?B?Vk5uS0tqbm1GVGtPNDlRamN0bS9nUktxNHdKM3Z2aUZEU2hlTzBTSjF0U1dL?=
 =?utf-8?B?cVlybGRPNC80YW1lbCt5eEU2RTZGN2NYbWpMUmtSdnJZWXdrcHgrTjV4TDg1?=
 =?utf-8?B?eWo0VHRqR3owS2ZmZWFBWnQrM2x6ZVNhTmcxaEp5aUJvMGk0ZVFGYVF2ZjE5?=
 =?utf-8?B?N1RHb3pvTUwzeHZnUEx3UURiQmNET0JaN2pIY2ppN2s3UzYxa3RxNnRxdkZ4?=
 =?utf-8?B?RFdRdG04UHgvN09Da3JkSnFOeDByN1NqMTByRjRTNlJjY3hjZjBlZERmT2JG?=
 =?utf-8?B?NUVqTmg1UVFvR1RaeGNyOWk1VHc0OEZML2o2emx1Y2p3UlptcDNjZDBzei9u?=
 =?utf-8?B?SXIrbXNPNElScVZ2bUVtSnlpeVFYN0I4QXh1YmtGLzlwZUZkSWxtaEZPc2VR?=
 =?utf-8?B?emtuZ29QTzBFbFpsZGFVbCtzQVZ2dVFwcmhFYVFqM2JNUEJ1VEEvMXpPVGRS?=
 =?utf-8?B?KzRHdUVnSGtqTVBBRzZJazBPZ0hDRS93UlgwektIazZmTkJkNTlsbnFtVkFq?=
 =?utf-8?B?VkQ2VlprRENMM2Z5YUpEc3d1Zlg5QW5hOUJkRW1JY0c3Z2NRSlJoSEIvdVBY?=
 =?utf-8?B?b2tKU3FzbTdkcFNLQVdodHgwYVJYRm9ZZmZ1bHU3RUo4SVkvejB0NC9NSGVD?=
 =?utf-8?B?QkZjRDNMZGxpVHEzeWtmenFiV3ptNmc2bU5YR1JwbkxIWDJzYUNOTlg2dGZn?=
 =?utf-8?B?QVFEUGdJMjV6Nkl1dlhPeG5sYVBDWGp6MGxXS25YazJRcjJ5YzQ5VE43VFRB?=
 =?utf-8?B?NTN3dS80SytTT0l6OFRjcm56akVWZTlNc2I5UFVKRmNJWkE3SUhiZndsTG96?=
 =?utf-8?B?bDVYOXhkSHpYRXhqREZMUk1DaDBrWHNIb0ZwT1QyRzE2TVFpN0tiL05FNUtr?=
 =?utf-8?B?ZE56OEFGVVBFMUpyYU11OGVnTHBzRkxoUmVzWVJ5MFVwZWhYUHhadkxWbTQz?=
 =?utf-8?B?WnNZUlI2Z2o4dCtsRjcyMURCelVISnhZbmEwQzNTbzhOeld4WDA2Uitqd0R0?=
 =?utf-8?B?YjJSd05RY0pjQ2NsU3JONEF6L1BXTTIvMG40d3NnZUJqR0VYNVhBdVhVSUxS?=
 =?utf-8?B?UkE3c0wrYmRYN0JVNExjZTF6cUlvc1ptS00ra3RkeGU5OEJzOVNKRDFsZzQ4?=
 =?utf-8?B?SkF2SHFrU0JHNkNaTnR2MW8yQ25UNFkzOEZiMjhSWW5TSUV2MlBpK1lPelMw?=
 =?utf-8?B?c01YczY4TW5MNVhUSmVyYklwRUJJUlluQXZBVTROMVd4bWVRa3dUdzBCelZy?=
 =?utf-8?Q?T5FQRVapjWgDnJOiQz169XyUA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a33397f3-d5f0-4257-dea2-08de2390a4a8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 15:15:27.9638 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OmnF2Rgn3EbGJlbhI1S/6XK0lkNiaouBPv/Jb7ZIRvsieZNe/Am4VMCcW9L72cME
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4406
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

On 11/13/25 17:05, Pierre-Eric Pelloux-Prayer wrote:
> If multiple entities share the same window we must make sure
> that jobs using them are executed sequentially.
> 
> This commit gives separate window id to each entity, so jobs
> from multiple entities could execute in parallel if needed.
> (for now they all use the first sdma engine, so it makes no
> difference yet).
> 
> default_entity doesn't get any windows reserved since there is
> no use for them.
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c  |  9 +++--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c  | 50 ++++++++++++++----------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h  |  9 +++--
>  drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  8 ++--
>  4 files changed, 46 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> index 8e2d41c9c271..2a444d02cf4b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> @@ -686,7 +686,8 @@ void amdgpu_gmc_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
>  	 * translation. Avoid this by doing the invalidation from the SDMA
>  	 * itself at least for GART.
>  	 */
> -	mutex_lock(&adev->mman.gtt_window_lock);
> +	mutex_lock(&adev->mman.clear_entity.gart_window_lock);
> +	mutex_lock(&adev->mman.move_entity.gart_window_lock);

That looks strange, we want to use the default entity here and not anything else. Why are the other ones locked?

>  	r = amdgpu_job_alloc_with_ib(ring->adev, &adev->mman.default_entity.base,
>  				     AMDGPU_FENCE_OWNER_UNDEFINED,
>  				     16 * 4, AMDGPU_IB_POOL_IMMEDIATE,
> @@ -699,7 +700,8 @@ void amdgpu_gmc_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
>  	job->ibs->ptr[job->ibs->length_dw++] = ring->funcs->nop;
>  	amdgpu_ring_pad_ib(ring, &job->ibs[0]);
>  	fence = amdgpu_job_submit(job);
> -	mutex_unlock(&adev->mman.gtt_window_lock);
> +	mutex_unlock(&adev->mman.move_entity.gart_window_lock);
> +	mutex_unlock(&adev->mman.clear_entity.gart_window_lock);
>  
>  	dma_fence_wait(fence, false);
>  	dma_fence_put(fence);
> @@ -707,7 +709,8 @@ void amdgpu_gmc_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
>  	return;
>  
>  error_alloc:
> -	mutex_unlock(&adev->mman.gtt_window_lock);
> +	mutex_unlock(&adev->mman.move_entity.gart_window_lock);
> +	mutex_unlock(&adev->mman.clear_entity.gart_window_lock);
>  	dev_err(adev->dev, "Error flushing GPU TLB using the SDMA (%d)!\n", r);
>  }
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index c8d59ca2b3bd..7193a341689d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -291,7 +291,7 @@ static int amdgpu_ttm_map_buffer(struct drm_sched_entity *entity,
>   */
>  __attribute__((nonnull))
>  static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
> -				      struct drm_sched_entity *entity,
> +				      struct amdgpu_ttm_buffer_entity *entity,

That could already been part of the patch who adds the entity as parameter.

In general we should probably always use amdgpu_ttm_buffer_entity as parameter inside amdgpu_ttm.c

>  				      const struct amdgpu_copy_mem *src,
>  				      const struct amdgpu_copy_mem *dst,
>  				      uint64_t size, bool tmz,
> @@ -314,7 +314,7 @@ static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
>  	amdgpu_res_first(src->mem, src->offset, size, &src_mm);
>  	amdgpu_res_first(dst->mem, dst->offset, size, &dst_mm);
>  
> -	mutex_lock(&adev->mman.gtt_window_lock);
> +	mutex_lock(&entity->gart_window_lock);
>  	while (src_mm.remaining) {
>  		uint64_t from, to, cur_size, tiling_flags;
>  		uint32_t num_type, data_format, max_com, write_compress_disable;
> @@ -324,15 +324,15 @@ static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
>  		cur_size = min3(src_mm.size, dst_mm.size, 256ULL << 20);
>  
>  		/* Map src to window 0 and dst to window 1. */
> -		r = amdgpu_ttm_map_buffer(entity,
> +		r = amdgpu_ttm_map_buffer(&entity->base,
>  					  src->bo, src->mem, &src_mm,
> -					  0, ring, tmz, &cur_size, &from);
> +					  entity->gart_window_id0, ring, tmz, &cur_size, &from);
>  		if (r)
>  			goto error;
>  
> -		r = amdgpu_ttm_map_buffer(entity,
> +		r = amdgpu_ttm_map_buffer(&entity->base,
>  					  dst->bo, dst->mem, &dst_mm,
> -					  1, ring, tmz, &cur_size, &to);
> +					  entity->gart_window_id1, ring, tmz, &cur_size, &to);
>  		if (r)
>  			goto error;
>  
> @@ -359,7 +359,7 @@ static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
>  							     write_compress_disable));
>  		}
>  
> -		r = amdgpu_copy_buffer(ring, entity, from, to, cur_size, resv,
> +		r = amdgpu_copy_buffer(ring, &entity->base, from, to, cur_size, resv,
>  				       &next, true, copy_flags);
>  		if (r)
>  			goto error;
> @@ -371,7 +371,7 @@ static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
>  		amdgpu_res_next(&dst_mm, cur_size);
>  	}
>  error:
> -	mutex_unlock(&adev->mman.gtt_window_lock);
> +	mutex_unlock(&entity->gart_window_lock);
>  	*f = fence;
>  	return r;
>  }
> @@ -401,7 +401,7 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
>  	dst.offset = 0;
>  
>  	r = amdgpu_ttm_copy_mem_to_mem(adev,
> -				       &adev->mman.move_entity.base,
> +				       &adev->mman.move_entity,
>  				       &src, &dst,
>  				       new_mem->size,
>  				       amdgpu_bo_encrypted(abo),
> @@ -1893,8 +1893,6 @@ int amdgpu_ttm_init(struct amdgpu_device *adev)
>  	uint64_t gtt_size;
>  	int r;
>  
> -	mutex_init(&adev->mman.gtt_window_lock);
> -
>  	dma_set_max_seg_size(adev->dev, UINT_MAX);
>  	/* No others user of address space so set it to 0 */
>  	r = ttm_device_init(&adev->mman.bdev, &amdgpu_bo_driver, adev->dev,
> @@ -2207,6 +2205,15 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>  			drm_sched_entity_destroy(&adev->mman.clear_entity.base);
>  			goto error_free_entity;
>  		}
> +
> +		/* Statically assign GART windows to each entity. */
> +		mutex_init(&adev->mman.default_entity.gart_window_lock);
> +		adev->mman.move_entity.gart_window_id0 = 0;
> +		adev->mman.move_entity.gart_window_id1 = 1;
> +		mutex_init(&adev->mman.move_entity.gart_window_lock);
> +		/* Clearing entity doesn't use id0 */
> +		adev->mman.clear_entity.gart_window_id1 = 2;
> +		mutex_init(&adev->mman.clear_entity.gart_window_lock);

I though for a moment that you init the same mutex twice.

Maybe add an amdgpu_ttm_buffer_enity_init() function?

>  	} else {
>  		drm_sched_entity_destroy(&adev->mman.default_entity.base);
>  		drm_sched_entity_destroy(&adev->mman.clear_entity.base);
> @@ -2371,6 +2378,7 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
>  {
>  	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
>  	struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
> +	struct amdgpu_ttm_buffer_entity *entity;
>  	struct amdgpu_res_cursor cursor;
>  	u64 addr;
>  	int r = 0;
> @@ -2381,11 +2389,12 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
>  	if (!fence)
>  		return -EINVAL;
>  
> +	entity = &adev->mman.clear_entity;
>  	*fence = dma_fence_get_stub();
>  
>  	amdgpu_res_first(bo->tbo.resource, 0, amdgpu_bo_size(bo), &cursor);
>  
> -	mutex_lock(&adev->mman.gtt_window_lock);
> +	mutex_lock(&entity->gart_window_lock);
>  	while (cursor.remaining) {
>  		struct dma_fence *next = NULL;
>  		u64 size;
> @@ -2398,13 +2407,13 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
>  		/* Never clear more than 256MiB at once to avoid timeouts */
>  		size = min(cursor.size, 256ULL << 20);
>  
> -		r = amdgpu_ttm_map_buffer(&adev->mman.clear_entity.base,
> +		r = amdgpu_ttm_map_buffer(&entity->base,
>  					  &bo->tbo, bo->tbo.resource, &cursor,
> -					  1, ring, false, &size, &addr);
> +					  entity->gart_window_id1, ring, false, &size, &addr);
>  		if (r)
>  			goto err;
>  
> -		r = amdgpu_ttm_fill_mem(ring, &adev->mman.clear_entity.base, 0, addr, size, resv,
> +		r = amdgpu_ttm_fill_mem(ring, &entity->base, 0, addr, size, resv,
>  					&next, true,
>  					AMDGPU_KERNEL_JOB_ID_TTM_CLEAR_BUFFER);
>  		if (r)
> @@ -2416,12 +2425,12 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
>  		amdgpu_res_next(&cursor, size);
>  	}
>  err:
> -	mutex_unlock(&adev->mman.gtt_window_lock);
> +	mutex_unlock(&entity->gart_window_lock);
>  
>  	return r;
>  }
>  
> -int amdgpu_fill_buffer(struct amdgpu_ttm_entity *entity,
> +int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
>  		       struct amdgpu_bo *bo,
>  		       uint32_t src_data,
>  		       struct dma_resv *resv,
> @@ -2442,7 +2451,7 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_entity *entity,
>  
>  	amdgpu_res_first(bo->tbo.resource, 0, amdgpu_bo_size(bo), &dst);
>  
> -	mutex_lock(&adev->mman.gtt_window_lock);
> +	mutex_lock(&entity->gart_window_lock);
>  	while (dst.remaining) {
>  		struct dma_fence *next;
>  		uint64_t cur_size, to;
> @@ -2452,7 +2461,8 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_entity *entity,
>  
>  		r = amdgpu_ttm_map_buffer(&entity->base,
>  					  &bo->tbo, bo->tbo.resource, &dst,
> -					  1, ring, false, &cur_size, &to);
> +					  entity->gart_window_id1, ring, false,
> +					  &cur_size, &to);
>  		if (r)
>  			goto error;
>  
> @@ -2468,7 +2478,7 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_entity *entity,
>  		amdgpu_res_next(&dst, cur_size);
>  	}
>  error:
> -	mutex_unlock(&adev->mman.gtt_window_lock);
> +	mutex_unlock(&entity->gart_window_lock);
>  	if (f)
>  		*f = dma_fence_get(fence);
>  	dma_fence_put(fence);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> index e1655f86a016..f4f762be9fdd 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> @@ -39,7 +39,7 @@
>  #define __AMDGPU_PL_NUM	(TTM_PL_PRIV + 6)
>  
>  #define AMDGPU_GTT_MAX_TRANSFER_SIZE	512
> -#define AMDGPU_GTT_NUM_TRANSFER_WINDOWS	2
> +#define AMDGPU_GTT_NUM_TRANSFER_WINDOWS	3
>  
>  extern const struct attribute_group amdgpu_vram_mgr_attr_group;
>  extern const struct attribute_group amdgpu_gtt_mgr_attr_group;
> @@ -54,6 +54,9 @@ struct amdgpu_gtt_mgr {
>  
>  struct amdgpu_ttm_buffer_entity {
>  	struct drm_sched_entity base;
> +	struct mutex		gart_window_lock;

Don't call that gart_window_lock. Essentially we are protecting the entity from concurrent access. Just "lock" should probably do it.

> +	u32			gart_window_id0;
> +	u32			gart_window_id1;
>  };
>  
>  struct amdgpu_mman {
> @@ -69,7 +72,7 @@ struct amdgpu_mman {
>  
>  	struct mutex				gtt_window_lock;
>  
> -	struct amdgpu_ttm_buffer_entity default_entity;
> +	struct amdgpu_ttm_buffer_entity default_entity; /* has no gart windows */
>  	struct amdgpu_ttm_buffer_entity clear_entity;
>  	struct amdgpu_ttm_buffer_entity move_entity;
>  
> @@ -177,7 +180,7 @@ int amdgpu_copy_buffer(struct amdgpu_ring *ring,
>  int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
>  			    struct dma_resv *resv,
>  			    struct dma_fence **fence);
> -int amdgpu_fill_buffer(struct amdgpu_ttm_entity *entity,
> +int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
>  		       struct amdgpu_bo *bo,
>  		       uint32_t src_data,
>  		       struct dma_resv *resv,
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> index 09756132fa1b..bc47fc362a17 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> @@ -60,7 +60,7 @@ svm_migrate_gart_map(struct amdgpu_ring *ring,
>  	int r;
>  
>  	/* use gart window 0 */
> -	*gart_addr = adev->gmc.gart_start;
> +	*gart_addr = entity->gart_window_id0;

The comment above should probably be removed.

Regards,
Christian.

>  
>  	num_dw = ALIGN(adev->mman.buffer_funcs->copy_num_dw, 8);
>  	num_bytes = npages * 8;
> @@ -116,7 +116,7 @@ svm_migrate_gart_map(struct amdgpu_ring *ring,
>   * multiple GTT_MAX_PAGES transfer, all sdma operations are serialized, wait for
>   * the last sdma finish fence which is returned to check copy memory is done.
>   *
> - * Context: Process context, takes and releases gtt_window_lock
> + * Context: Process context, takes and releases gart_window_lock
>   *
>   * Return:
>   * 0 - OK, otherwise error code
> @@ -138,7 +138,7 @@ svm_migrate_copy_memory_gart(struct amdgpu_device *adev, dma_addr_t *sys,
>  
>  	entity = &adev->mman.move_entity;
>  
> -	mutex_lock(&adev->mman.gtt_window_lock);
> +	mutex_lock(&entity->gart_window_lock);
>  
>  	while (npages) {
>  		size = min(GTT_MAX_PAGES, npages);
> @@ -175,7 +175,7 @@ svm_migrate_copy_memory_gart(struct amdgpu_device *adev, dma_addr_t *sys,
>  	}
>  
>  out_unlock:
> -	mutex_unlock(&adev->mman.gtt_window_lock);
> +	mutex_unlock(&entity->gart_window_lock);
>  
>  	return r;
>  }


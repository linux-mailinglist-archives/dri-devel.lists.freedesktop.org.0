Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 935D39F31AA
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 14:36:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3E2B10E681;
	Mon, 16 Dec 2024 13:36:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="gxlv5DXf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2057.outbound.protection.outlook.com [40.107.212.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA75A10E681;
 Mon, 16 Dec 2024 13:36:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i+BuLmIupwANIPNaOXuJuf4j9lJiZ6r6ZRocdW7rp1E8ZVxBxtmrBM2WyJL9vs9U88MbT13Ofu7EbhdHc1k1c/rKBlite1wDPVIgVtYWvKO/OONnT9PKMtTStuj8zJKoYGGU9J8r4gcA41t0zsL+IFrsJt0Hm7sZ441lbghscnSDfeKrAi5hCB/tQo/tG0BF1z678QSZ74kOHCIChehk9fD+SFH4B2tJY6zqrQcRAAPCkhdv8thCPKZhOMlwf0U4xm49hNlshFIKmKqW+38C7HxsxoK7aAJEjBOlg7avNa4nLAE2ig5yo2AHqgvYw/e42P2dPBmUXlJnAK8vycd8gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9CTXrnlqGXR0er3RPRRJefFrunyt+UpBB9+o0uOX34s=;
 b=Qhp3R8dQHAfr4LKr2b91bT9MAL7j+rm9Jgk3NYI+NPKNTkziAAhT0ia/FrC0HWeC6MefLYk74nulajRqTll6qi+d4AUYyKef7IHJzdFdeUdQyJjOSvx3333lY536Wk7wbc9bF5ht/222orJ79HREhb/xo2yDG8jUmu+nwMdPUvz/wqnLHfnvZFKo4T59ipYpaHTyox2FbV8TdcrjmelFrNtu5ZtKJpvh4ESR2zOwpIdJ/T6s7uXLPMEoIcv4BLdef09rH4r7n6ZMD7fu/8tC3KisdTox3uNAgg44MechhglGguGZJ1BlQi3sHxg/NVsj6EeV5i4eSzZBkysS0NDpPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9CTXrnlqGXR0er3RPRRJefFrunyt+UpBB9+o0uOX34s=;
 b=gxlv5DXf+AJ43QyEdXhqWeAUE9b2KRdHHGLcs6WwOXOfhM+GD/fttfDtCGuxqHdvLG0p2iD5tJNiw15Cec2G9xqezH0kY8XHMnr7E4nDQkhyyWmJzxIl+us2ZEaxfsJgGgZcNtEtVdL02fYvKM+QTQk/s9g1j6YB/iJ2sKVOK98=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS0PR12MB7804.namprd12.prod.outlook.com (2603:10b6:8:142::5) by
 PH8PR12MB7112.namprd12.prod.outlook.com (2603:10b6:510:22c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Mon, 16 Dec
 2024 13:36:51 +0000
Received: from DS0PR12MB7804.namprd12.prod.outlook.com
 ([fe80::8327:d71a:ce21:a290]) by DS0PR12MB7804.namprd12.prod.outlook.com
 ([fe80::8327:d71a:ce21:a290%7]) with mapi id 15.20.8251.015; Mon, 16 Dec 2024
 13:36:51 +0000
Message-ID: <6028b434-2be7-453a-9be8-bf2e85c0756f@amd.com>
Date: Mon, 16 Dec 2024 19:06:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] drm/amdgpu: Use device wedged event
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: airlied@gmail.com, simona@ffwll.ch, Raag Jadav <raag.jadav@intel.com>,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 jani.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
 lina@asahilina.net, michal.wajdeczko@intel.com,
 "Sharma, Shashank" <Shashank.Sharma@amd.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 himal.prasad.ghimiray@intel.com, aravind.iddamsetty@linux.intel.com,
 anshuman.gupta@intel.com, alexander.deucher@amd.com,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com
References: <20241212190909.28559-1-andrealmeid@igalia.com>
 <20241212190909.28559-2-andrealmeid@igalia.com>
 <d9f2583d-da79-4532-90fc-85028e977ceb@amd.com>
 <c7c498f0-2ee3-42f5-9b45-c87e52ffc3e4@igalia.com>
 <Z1xGe1X_XzB00J1Q@black.fi.intel.com>
 <ed83b0a1-62d1-48e5-ac7b-478be3043733@igalia.com>
 <28d7dcd8-ed3f-4e52-b7fa-c348a827085d@amd.com>
 <7c64746a-c1f6-46c6-a97f-cfd87e9ec3b7@amd.com>
 <5f7dd8ac-e8cc-4a40-b636-9917d82e27f5@igalia.com>
 <84b6dc5b-8c97-4c8d-8995-78cf88b883fc@amd.com>
 <8d6395fc-8143-4099-a9d6-b13d450d7fd7@igalia.com>
Content-Language: en-US
From: "Lazar, Lijo" <lijo.lazar@amd.com>
In-Reply-To: <8d6395fc-8143-4099-a9d6-b13d450d7fd7@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BMXPR01CA0088.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:54::28) To DS0PR12MB7804.namprd12.prod.outlook.com
 (2603:10b6:8:142::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7804:EE_|PH8PR12MB7112:EE_
X-MS-Office365-Filtering-Correlation-Id: 8269dd5c-c1c2-4a61-e1bd-08dd1dd6b249
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VFd3enZIYno0dEhqSXFiVnZpQW9aVG0wd2NyUzNSOTlCc3RTN29aTnRmRDNS?=
 =?utf-8?B?YnVNZmZUTFhKdGEycUl4YzQzRTRTb0pFN3ZmdjR2RzVzVmJaRDJGb3p0MFpW?=
 =?utf-8?B?cG9IVHprOWlpbmpqTk5DaUFOcmZtZ1lXb3hjbjJUV1lEVkFCMklsellsYmxs?=
 =?utf-8?B?a0xUdEczUWdOcE5PNWYwVFN1Tnp2NTZnS1BRVk9XWVFuTmpTU1lDS2hYenBz?=
 =?utf-8?B?TTRYdE5Qa241alpFd1VrcUdCOERRcGw2VnJkWStGMHpzeWIwMnJYbUhxOFZY?=
 =?utf-8?B?b3piZUJkVkdsMjR2a2x4NkpmckxJaU83dnJTaUkyNThIako2NXN1NFVHZER1?=
 =?utf-8?B?M1RrYzRCWVB6MFFqcEhNbGpoNHA3SlFWdEcwRXRQa0dIWDdWeEtudkhzWDJK?=
 =?utf-8?B?b3JBM2c0dGJjRDVDbFRqZXlpdklDNnYyRFhQbDFId2xNeElEWGlBOEZpaGFH?=
 =?utf-8?B?akl1ZkI0c3k2NzlqMVJyTmQvVGI1OU1WbjdDOEVFTzNOSUppaG5SdlcxdWdM?=
 =?utf-8?B?VHJqT0VqVDQ4OXdVMm50TE5jY0F1cUt2eWJMZnFYUXU1eWptdDlMbkIraXVi?=
 =?utf-8?B?cGN4dzBhQVpCVElyQW5jQmhJb0JSY1lLYU1vekpPcUREdkVkMkNrNC9Mbmt4?=
 =?utf-8?B?Z0Q0cEVUck8xaUZzVk5OcFJHWEFoc2gvYjI4TTZGQ1I1ZjBJVkVyVlUyWFpX?=
 =?utf-8?B?bE5qa3NvNE83VEZuSG5FK2xVK0ZxRlpTMVVnR2VkQlJVbVlXMXMrVGZ3NjJI?=
 =?utf-8?B?MzJrMlp2UHA3bEdDNXdRN042YWgzTk80ajVuUWhuMDkvMnRFVWY3QXBGYzlp?=
 =?utf-8?B?UTVkckNaUEpGYnNXYTdzR2NCTENpNGNBeUQrWmlKdjlhOWlZZk1zRjBtMk9D?=
 =?utf-8?B?Vm9oRExIekxiaTk3TmJReVhJRkhWRlVieGNNV0VPaVB2TVk2L2JROTFVb2Nq?=
 =?utf-8?B?R0dYbjlkWnI3c05xQm9CNmNRc24zTzBDdEVDcFA4MjEvckpsaDBqaFp1K0hM?=
 =?utf-8?B?THQ4L2s1TDBWYUE3NFkyakVwNmROYVA3aHlwRHBZNFlhQ3FyRHZaQWhQdDZJ?=
 =?utf-8?B?QkR2TkY5Yng4bnhYeDlDY3BlWDFjT010U1ZGdkFNOEFEWlNpUVhwWlBjc3gv?=
 =?utf-8?B?encyYlBIUTcxdkE0Qmk4NFVHY1Jab2JjbU81d3dVS1kwUkI4aE9lZmMrUFRi?=
 =?utf-8?B?NzdjSko4M3JRamszVkRyam9iSExlNnJqczBwVmhjN0RJV3owSktIZUgwcmRs?=
 =?utf-8?B?cmZIU0tWYXMrTExIeDlzNHJmN3BnNzZKdmVBRWxybDF0QVJPdXlENFcvbGsx?=
 =?utf-8?B?N1lXTzZCSVhKZE5aK2N5QjloL0k3RzVOR3FoOStodUZqeTQ0am02V2NIdENa?=
 =?utf-8?B?enUzZVRvUFZ2TU4vYXduU2ZFdG9XYmVleThaMHQ5dU5jWnNBNDJqU25RL3kz?=
 =?utf-8?B?dFUxT3pWajFnSmgxRDFuUytVdEU3L1VsS3VFRUlvZEVEMzVSSUlGR1NCQmtK?=
 =?utf-8?B?MXVsSi9nVDNIOTNUVFFEY2RsK3QrNytncHJwcGtuUzlUekxqVVNtckVXUjVW?=
 =?utf-8?B?YzUrN29KYmIzS3oyYUxsbXBzdThRL1lvc1czalpGY3BLcDJldDBMaU9yK0Z1?=
 =?utf-8?B?RnVyN0JSdU9sZ1Qwa2RkODFJZDZHWkl1dTMxbTVPSXRxN3hNUjZIcm9hR3pC?=
 =?utf-8?B?bUF1UittQzZNUGJLWXA3aitrYlpkR0JhaTF4NldEdnNHTkgrdERFUzcvejk5?=
 =?utf-8?B?VFEwZGl6WlpMZVpEOElka2JseVhjWVFITlVMN2I5QVJ2SGpNdjA0eDJGMm53?=
 =?utf-8?B?OWo1em9JbkdSenRudVAxa3dFcCtOMDhwT2JCamdlLzNSa0N0SnlNWUp1b0Vh?=
 =?utf-8?Q?vSNDEVLgoMr8e?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7804.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NTIwVEUyWGxrYTBSNHNPUWVucnpHQnc5YS81MmVUTXpBaHFLeEVmeWRsbXVJ?=
 =?utf-8?B?cWJNVnVzamhpK25GQXZvbnZ6WW9FZER3aTlLeVkvTlpkZzZnakRjMmh0eFVz?=
 =?utf-8?B?ckRvYVdMemRLWjNsTGdtK2VvNDFhNnkyQ2RJMWtSSjFidEpQRU9oZlc5V3JI?=
 =?utf-8?B?RlFNa2lzekJrUk04MnhmNDdiL1BRUXBMTDE0REdDVVJKTVNsdDNYa0lUUVNr?=
 =?utf-8?B?d2hrZXhzVjF1RXRCSzNmeUpUa3JNN1ZBZTJ0ZWJYd212V0FWd0ttNEdBbFVK?=
 =?utf-8?B?SmpqeHcwOXQ2RUpQTUJPVmVKbHc1NUJsV3ZtRmlOSUFnSmJHanpkMjBwUFdr?=
 =?utf-8?B?WXJaaGc0OFVJU25RR2V3VS9iR214NUtheHZKRlErTlBhSW14ZFdFS2YraFE1?=
 =?utf-8?B?Si9QbjBta0U2NG84UjZsUThlcU1ualZSQzczWXAwazN4cWZPQWxZMnFrMFRt?=
 =?utf-8?B?a1d4S2R0UGs1bll0clNaR1lLaFNETEEyWEJ6YUpPVWJ1bE4zdmJiVzl4cHdJ?=
 =?utf-8?B?dFF0T0hVNzBXRmlWODlhRjVOUVdQeVlOMVEyS1Babk45dHc2aHNod2RyUmlC?=
 =?utf-8?B?b2JOYzV1a29rT2hxMjhoOVpUeURPOHpBR1p4NDVXazZubEJRQWNKWW5lZi9X?=
 =?utf-8?B?Qi9WM0RjN0QrZkpJbGl2N0ZPQjFzMzVzUXl3MTEvNEY5ZUpyekJtWDlWUWRW?=
 =?utf-8?B?T29OOGZNNGJEVzZGTjg3YTE0aDNmaEFnbmtRenF3UUVkYkRreUd3MUMvSmlZ?=
 =?utf-8?B?cWRWZkFFTzZLc1VuVHRQSkhjbDFSYjZVTFdQL3hBdlhSMXBaUk5tV3ExclRX?=
 =?utf-8?B?MzFNUEhpa25IY29Fc2cxMnhscEU0cERQVEVHWXVtOUJSSXE0ZllWa0U5RWgy?=
 =?utf-8?B?YStPdmZ3YXdWZ2tyUG1FM1JpcmM3aElHeTVReUQ5TWJKQTBkSzl6dzdOTVQ5?=
 =?utf-8?B?RUZUZkpRK1h5K2l4OGIzNmt4VHJxaHdTUE81ZXc1dGIrMmhHaEhGZ3lCVzlG?=
 =?utf-8?B?d1RZUnFQc0wxbEE1THRCTWIwZ2NEUEVDTDB2Sk45QTdCV3RHODJuTzRzVmxG?=
 =?utf-8?B?SXpaSExJRTdZQ1Q0Z2o4NmRudUVKcVBCdlRnQ1N3azlMc1NPbTd1ME9lL1FD?=
 =?utf-8?B?MFdwRUxJQVc1MGU1Z3FVRFg0aFlZR3NlaDl2ZUEyNUliL3F6T1hJSUpwbGJ1?=
 =?utf-8?B?dnFvUW0wMHlSNnEyOERtNXNvZ3NNdkVBNnJHaVNEZVZOUXJzYnlhV2N0bmlC?=
 =?utf-8?B?Ukx2bFdxdi9ORVh6T3Zpb0psY2R5MkYvcXkxZDRPdW0wTmV6QTdJWGkvbjhX?=
 =?utf-8?B?R3dleUJBcGxXdVB2SHF5cjFiblRwM2lXbU84OFNUblduYkp0YXVETmhiMW9i?=
 =?utf-8?B?VmZJTjIzMDJkNkRWQnd2RVZtUjlVUTdzU2I3cFp0ZytZT2d4YXYxQUlqeHZ2?=
 =?utf-8?B?Yi9zQVAwZFN1MEVBdlJkTHNFK2h5d25YTHk4aTFxTW9GYnF4eitSNE1jblJF?=
 =?utf-8?B?ZTRTTDA4d204bmFmK0RxYllsQ3NwVUp3aDFHeWY4THlzTmhGVGNoWHZlNzh6?=
 =?utf-8?B?bm9sUzE4Tmd3Vjh4dG9qVHlmN2pwZVM3bU1IVmpTUDBPa2dlSVB4ekFGcFN3?=
 =?utf-8?B?YjJVczJjdVlxNWpuZDRzbmtGKzdXNnh4RUtzMEx4T0UyZ2Y4ck5udUw3VGR6?=
 =?utf-8?B?UEMxdnNSZEsxbjk0em9NNmxGV3J4SWs2WDFiN0xuSnRFUkEzM2I4SjYxcU9J?=
 =?utf-8?B?WlJLNGFSZHMyTG9PcHBzcjBMTlVEeldKR0praG1scTJnYVFNaFBIOEgwTzMx?=
 =?utf-8?B?K3UrYTBnYkV4U0RscllNSlhCVFZHZGd3WGlDNnBwU0VoV2gvQnJmQ1ZQVWxa?=
 =?utf-8?B?MTZycUFPekpabzU5UWJISXZLMW9Ha3EveE11L3Q0RzdmcmFkaFhxRE5ibitz?=
 =?utf-8?B?K0pwcFIrczE1QkxrZkFONmQyeGFoUmdTLzZnUUhyRFN1MWRnMll1S1hRZEd0?=
 =?utf-8?B?Z2o3c1Z2Mk4waDgwWUVNektNUW9LNnhFa1dZR21ib1lQUDRwK1ZIUytSVEJm?=
 =?utf-8?B?aUVzSVNJSUhIVFJ0a2sxWHpJK3BlVll6Y2VlY3lLdm9iemlFT3BjZEZuTHZ6?=
 =?utf-8?Q?iwab3zKh7AOFyvBjQN18a7hot?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8269dd5c-c1c2-4a61-e1bd-08dd1dd6b249
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7804.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2024 13:36:51.1824 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4IzC6iefovsfZ3nh1C5Hco7hiFK3D8Gdxm9FlhuIpLYwWaC3My5AhhQxjBZLfrBE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7112
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



On 12/16/2024 6:45 PM, André Almeida wrote:
> 
> 
> Em 16/12/2024 10:10, Christian König escreveu:
>> Am 16.12.24 um 14:04 schrieb André Almeida:
>>> Em 16/12/2024 07:38, Lazar, Lijo escreveu:
>>>>
>>>>
>>>> On 12/16/2024 3:48 PM, Christian König wrote:
>>>>> Am 13.12.24 um 16:56 schrieb André Almeida:
>>>>>> Em 13/12/2024 11:36, Raag Jadav escreveu:
>>>>>>> On Fri, Dec 13, 2024 at 11:15:31AM -0300, André Almeida wrote:
>>>>>>>> Hi Christian,
>>>>>>>>
>>>>>>>> Em 13/12/2024 04:34, Christian König escreveu:
>>>>>>>>> Am 12.12.24 um 20:09 schrieb André Almeida:
>>>>>>>>>> Use DRM's device wedged event to notify userspace that a reset
>>>>>>>>>> had
>>>>>>>>>> happened. For now, only use `none` method meant for telemetry
>>>>>>>>>> capture.
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: André Almeida <andrealmeid@igalia.com>
>>>>>>>>>> ---
>>>>>>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 3 +++
>>>>>>>>>>     1 file changed, 3 insertions(+)
>>>>>>>>>>
>>>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>>>>>>> b/drivers/gpu/ drm/amd/amdgpu/amdgpu_device.c
>>>>>>>>>> index 96316111300a..19e1a5493778 100644
>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>>>>>>> @@ -6057,6 +6057,9 @@ int amdgpu_device_gpu_recover(struct
>>>>>>>>>> amdgpu_device *adev,
>>>>>>>>>>             dev_info(adev->dev, "GPU reset end with ret =
>>>>>>>>>> %d\n", r);
>>>>>>>>>> atomic_set(&adev->reset_domain->reset_res, r);
>>>>>>>>>> +
>>>>>>>>>> +    drm_dev_wedged_event(adev_to_drm(adev),
>>>>>>>>>> DRM_WEDGE_RECOVERY_NONE);
>>>>>>>>>
>>>>>>>>> That looks really good in general. I would just make the
>>>>>>>>> DRM_WEDGE_RECOVERY_NONE depend on the value of "r".
>>>>>>>>>
>>>>>>>>
>>>>>>>> Why depend or `r`? A reset was triggered anyway, regardless of the
>>>>>>>> success
>>>>>>>> of it, shouldn't we tell userspace?
>>>>>>>
>>>>>>> A failed reset would perhaps result in wedging, atleast that's
>>>>>>> how i915
>>>>>>> is handling it.
>>>>>>>
>>>>>>
>>>>>> Right, and I think this raises the question of what wedge recovery
>>>>>> method should I add for amdgpu... Christian?
>>>>>>
>>>>>
>>>>> In theory a rebind should be enough to get the device going again, our
>>>>> BOCO does a bus reset on driver load anyway.
>>>>>
>>>>
>>>> The behavior varies between SOCs. In certain ones, if driver reset
>>>> fails, that means it's really in a bad state and it would need system
>>>> reboot.
>>>>
>>>
>>> Is this documented somewhere? Then I could even add a
>>> DRM_WEDGE_RECOVERY_REBOOT so we can cover every scenario.
>>
>> Not publicly as far as I know. But indeed a driver reset has basically
>> the same chance of succeeding than a driver reload.
>>
>> I think the use case we have here is more that the administrator
>> intentionally disabled the reset to allow HW investigation.
>>
>> So far we did that with a rather broken we don't do anything at all
>> approach.
> 
> OK.
> 
>>
>>>> I had asked earlier about the utility of this one here. If this is just
>>>> to inform userspace that driver has done a reset and recovered, it
>>>> would
>>>> need some additional context also. We have a mechanism in KFD which
>>>> sends the context in which a reset has to be done. Currently, that's
>>>> restricted to compute applications, but if this is in a similar
>>>> line, we
>>>> would like to pass some additional info like job timeout, RAS error
>>>> etc.
>>>>
>>>
>>> DRM_WEDGE_RECOVERY_NONE is to inform userspace that driver has done a
>>> reset and recovered, but additional data about like which job
>>> timeout, RAS error and such belong to devcoredump I guess, where all
>>> data is gathered and collected later.
>>
>> I think somebody else mentioned it as well that the source of the
>> issue, e.g. the PID of the submitting process would be helpful as well
>> for supervising daemons which need to restart processes when they
>> caused some issue.
>>
> 
> It was me :) we have a use case that we would need the PID for the
> daemon indeed, but the daemon doesn't need to know what's the RAS error
> or the job name that timeouted, there's no immediate action to be taken
> with this information, contrary to the PID that we need to know.
> 

Regarding devcoredump - it's not done every time. For ex: RAS errors
have a different way to identify the source of error, hence we don't
need a coredump in such cases.

The intention is only to let the user know the reason for reset at a
high level, and probably add more things later like the engines or
queues that have reset etc.

Thanks,
Lijo

>> We just postponed adding that till later.
>>
>> Regards,
>> Christian.
>>
>>>
>>>> Thanks,
>>>> Lijo
>>>>
>>>>> Regards,
>>>>> Christian.
>>>>
>>>
>>
> 


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8BEA5D814
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 09:25:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5267710E727;
	Wed, 12 Mar 2025 08:25:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="HY9SJ025";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2074.outbound.protection.outlook.com [40.107.236.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B1E210E721;
 Wed, 12 Mar 2025 08:25:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=howz6UQJjhTUmIzIcbtLPle6+4KRCZLUHJM76WflOMyHmWAQcXA1LahraxXwDePzwX85MEJqrsv41RQ0AZD+RimBwVu3bG/h+vLzf6RdLhxVAgz4lrNGTRBwPDLB/9JYbTJFgBJIws06xw5+EJ4WZvCgPuYX0PSLR6s370eyA7RW320Qwr5+fk6PETB8+SqA3Tk0aJziFdQEyQt4Pj4lYCXg4CPKDcvyLx9jo2BGjZotG7M5D7LGTB9qNYn0JS6pBSHvOcQWqHqQgf+/zvkkHUkV24qBANQ3aeTqkfCAz5l53uqwz8qCy2V9b/AB+cTDLT2iPktZZC1OkBkyHCKceA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BhGYWXj7hmHETAroZn9x4v5kugnkNKtu3PrP4mrRUZc=;
 b=yVwGRtmzqIRLpc4IpLPkk+0zTL0pbqmQ0bLqbsgJVI+1Q24E6jEcFXS6NOj/nlIHQnOo7vU8gjwKOzhT1OOsayRIVZEk2Tw8WPii3HEXDHkdyx4HW9Ez4spwJTKl4RRby14cusPyPdlnkSoE0ee5Tag8vTvZLvmbbfZvBJZtx9eu7qQ81n5GuMj6eTEyyrPCVGzBlOsfwQhhDuBvclV9C17agjcCqRAFf29mZZB6ZgINn2QFybjSHDV4UMULt7Ja6+CB3uslhc8qa134Ec5LNL9UumTq3qFdaEpYXvumoqP0RPNspqb0UdQedL7Nre7ybY7Nt+e8hm8faTtQKphsVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BhGYWXj7hmHETAroZn9x4v5kugnkNKtu3PrP4mrRUZc=;
 b=HY9SJ025hcvEPocO1zcrK98ufuKOfm9cSr3ekANKIMMeNC3QAaOb+Ory1BKH8aChREIMflYJdhNos5OeioQUpxpiirQEd4n7Pf1PvkcdQDrAThoRAFmbjcCfzx+qW/UJ4n3fqnpHV7/iXHHdP2gLX1vLHiD0IsSEFhTgCWJ6HNM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA1PR12MB7687.namprd12.prod.outlook.com (2603:10b6:208:421::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 08:25:19 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 08:25:19 +0000
Message-ID: <2c99f7a8-7f72-4959-88b5-d3137575640e@amd.com>
Date: Wed, 12 Mar 2025 09:25:08 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/amdgpu: Make use of drm_wedge_app_info
To: Raag Jadav <raag.jadav@intel.com>, Alex Deucher <alexdeucher@gmail.com>
Cc: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, siqueira@igalia.com,
 airlied@gmail.com, simona@ffwll.ch, rodrigo.vivi@intel.com,
 jani.nikula@linux.intel.com, Xaver Hugl <xaver.hugl@kde.org>
References: <20250228121353.1442591-1-andrealmeid@igalia.com>
 <20250228121353.1442591-3-andrealmeid@igalia.com>
 <Z8HO-s_otb2u44V7@black.fi.intel.com>
 <38b9cc8b-2a55-4815-a19f-f5bdf0f7687c@igalia.com>
 <Z8KjZfLYjH6ehYwy@black.fi.intel.com>
 <73602c9b-74f6-4b4a-82c6-918292b13cf7@igalia.com>
 <CADnq5_PbZUoyxyqweqa=kUNsSXanjY=5mUJrn03aY3je6rER+w@mail.gmail.com>
 <Z9BvK55_Nim54eOu@black.fi.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <Z9BvK55_Nim54eOu@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0184.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ca::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA1PR12MB7687:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b761930-514b-49fe-eac5-08dd613f6ca7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TmU3NHNwN3JoR3NYek0xMmJoNzNFTVgzS0ppQXBYYThYamRwQ1RKalBJNUZ0?=
 =?utf-8?B?ZVJMQlh0UnhHSmhEWHRqZG84bVIvcEdhM3BLQVU2MWNwWVdDQWFLd1FraVl3?=
 =?utf-8?B?YTYzSTdudmZvNktEYk50VEJCYU50R2t6cHJuZjREaGRKMWNiSWJQUlovOENj?=
 =?utf-8?B?TWxkTFdrdWhJbEhIYWpOQXd0Q2pucUdzRUx1VkUrTnRLYzJsVXR6YktFcXZZ?=
 =?utf-8?B?L0N0VElCUml6clFZc3c1a09TRVE5Q25zYzQ4SUk3cnhhU256NXZvRlhLY1ZB?=
 =?utf-8?B?SDhQV0xuTGtjek9YZTlqcWZ5NGlRTHNNb2FGekRsYXljdFVrN1g3emk5ZVJD?=
 =?utf-8?B?TWIvU1VYL3VGcGt2UTYrOWVSbEdtWmgzT0VJSjIrbk1NVWEwK1kwWFFRWXht?=
 =?utf-8?B?U0VUeEVlY24vL2RXMjdhQXpUc29DQW1acStibUZBZTYwZENxU2xGUFJnY3dH?=
 =?utf-8?B?dDVxMXBJMHlZUEE4OWdKdWpsVnFuSTdFaUIzWWpvZWNMdXFkc2sxS0QwcG9B?=
 =?utf-8?B?eXBzV1FrRWtsd3V4dytUUk05alVTc3g1S0FIYjUyS1Q1ai9nb1pWQm5vS29W?=
 =?utf-8?B?dWsycm5SczhhNUptZUJxT2kwV2VxVmlXQ2tDbE9vbUgwd3JyTkZaSmhQamQ0?=
 =?utf-8?B?OWZRRmFaWUVLNkg5R0c5Tk9UK2Y0TFZQbm4rQ2QzQkZpdVRCaVcrU2MxNHgv?=
 =?utf-8?B?OU9zcmtHVmo2S3MvWlQ1bjF1aVV1bHdnWEFuT3pHdTAzam1DaFE4V2VXWm1B?=
 =?utf-8?B?S0dIUmN5c1pzUHpsR01heHNyTWFUeWdDSkpGT1pSSHZZeEZRR05UNS8rb204?=
 =?utf-8?B?dkFyMWRQR04xa3FPdXk5aWxtTmVqcEVQMFhaZm5QV2NoMVVDRWZnUEpKb0Fu?=
 =?utf-8?B?d2ZKL05yM1piRFd6b1FHMHk4Rkg2OGRMcnduN0pmOXZCSlI0aWw1OTRUUTVn?=
 =?utf-8?B?NDBwOElsb00xaTFBeDN0SERNYWI4dURZK25PajNDTGtHOUFQbHdjNFI2Skg5?=
 =?utf-8?B?a2IzQ2ZndWk5bkd1RmxsQVV0eGJQOGpzaU4zZkFVREVWOTE4NkRTSDNBeEU0?=
 =?utf-8?B?TFkvTkw0MmR0VFJlcHRLdmorU3RWcE9LZnZHWW0vSnhkNXVFaURxUVZ2dDJE?=
 =?utf-8?B?dlc3bWcwdGlxVmREZlRNTnVMekpKY2NpclkwNzFzeGsxVzBBcFljazZKQWZG?=
 =?utf-8?B?YkU0KytvRGFBamdTbGV3VzVrNUQyZmdEUExSSENxa0JLNVZrbGdBSEZ5WXBD?=
 =?utf-8?B?cUZVMnJWcnNtRWU3RTFpN3dPWDMvMUVGS0RJUUdzTDIyZVpnY210WjZaL1B3?=
 =?utf-8?B?SXE1N0l0eWdkN3RLN0Zyekk0M2wwWHEwVkJLNVNsZ3pSVHoyOUV4SmxKWVln?=
 =?utf-8?B?UElMZTZjd3V0WDJnNmhzbzh3c2tVdnlXcGJab0lMa1FyUHpucWFkM3A3QnVH?=
 =?utf-8?B?VFZobVpNSFFpUmNyb2V4UVF3NGdkdjFvS2p3TlorL0JMOHRNZi9VN3JpRzN5?=
 =?utf-8?B?eW5CYVEwN0xGR3lFb1lsZnZFS3BZRmxkMVE2cmo0OUF6SFJkTlpLMmNvTEFi?=
 =?utf-8?B?Um1aVmZVc0wrYzEwbzYwb3EwOUJhS2hDSzBCQm80cmFzWU5VWWtsMWFzTXpR?=
 =?utf-8?B?ckNnMHA5OWRNWWpHc2JhZ2o2ZkxCMTIzWGljeUFZMTNRcUxldmhFTmRjaWw5?=
 =?utf-8?B?UmU3UzhXOG5taHlVMGg3YldjaGMyT0VDN3h5TzN2cm0yRmpLTUdRMDFTeWtE?=
 =?utf-8?B?RHV4L0MrMTVLQ3lXVlo5eTRnbHZwN3ZtclI0blpRT0IwUGlxTldPbVRyajZI?=
 =?utf-8?B?UjhINWRGR3JXQXBIejgxK0VHT0t4L0pzQnY3Z3lBa3RXelJlYWJNSEdlSkY5?=
 =?utf-8?Q?9jqous4shkBKC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SjZDdFZRUzFzWFFQZklHOE5tVHRtZEtMN1pONzdNZ1plS011YXZpQ2t6cGt3?=
 =?utf-8?B?OUoxc0FiQ1Q4N0N0cHliYTFJUDVHVUZsQ2RXdzZFZjFISEE0L21XbnRvQWRx?=
 =?utf-8?B?MXZodElLeHdCM00zTVZqS0ovZHJXM2V1VS9OVWJZWlVjMTNrZzhQRDNEOStQ?=
 =?utf-8?B?clM4MXlVbjVvQWRNMTB5TE5UYXpxWHN3R1FMMTh4NXEwUCtyMDBaektVaC95?=
 =?utf-8?B?b3FKUFYrOXNFd3JmSmdkV08xbkEwR1dKN3hxZjg5ZkVHSDJZUDJ5d2pEcHJS?=
 =?utf-8?B?c1o2YmZRQlVPWGVrZW1MRzRlVFJxaytPL0RLcXp5THY0cXp3SlBkeDdMOUpS?=
 =?utf-8?B?VmJkZWM1aTJlL0lIY1ZZandEWm9IN0hhdHZndHpvVkVEZHlCdDNMWFVxYldo?=
 =?utf-8?B?d1I3S3BWdnptaExoeEhGSW5UNCtMMlRKdFRSdTJrZ1pOZG5rMTAwaTdqS1dY?=
 =?utf-8?B?ZEVNelhWL3Axc2Y2alQwT2MrcmZQZzhWM2V1alpoMEE4VVROeUtRVFVXRzhK?=
 =?utf-8?B?MXdEaXY4TS9vc2g2SHFsaXA1a211ZHJZVW1tU1B2d2toZ1RoNEk2bFQyczlz?=
 =?utf-8?B?UW02NGx4N2p6SGc4Sk5waExJVlc3SkgvMEhpdU9sdTJMb0pveVozNzl6Znc3?=
 =?utf-8?B?YVRmMXppYm03Ukd3ajcyMHFGdnVya2JSbTdsNFdLcTdXY1ZnK2RGcXIzejg2?=
 =?utf-8?B?c1B4Q2szYStpdVJPWi9CNE9sQ3o0OGY2UFk0aExMYlZpby9LeG5SN1oybE1o?=
 =?utf-8?B?b3RGZDVvQ29qVTl6bStUaTJhbmlJTStCc3V5WjhxbDMvTEptN2pDVUtPbDdQ?=
 =?utf-8?B?OEdaekNLWnU3QTVLVlBRN28renM0MjdLV0tidFFQWGZpWktRK0trWXBGSWl3?=
 =?utf-8?B?endGVi8yMEhHOThBeUszVTdqQ2FQelFyL0laVmNrY21XTk9yTDZVVE5SY3Y0?=
 =?utf-8?B?Q3p4bE1tcXVWcllPNU9qRmdxeElNRmJJWGxlVTdBb0lwMytJdHNvUVY0T1RG?=
 =?utf-8?B?NDk3UmIwZFlWYzhBUSt2Z3poWVZuV0Noc2Z3cks4a01JQUZXeDFMZ2V4Z2Vl?=
 =?utf-8?B?U04zaS9tUE5pNDlhVHI2OHhKeEhtWlhnTlhOQm5DRFJwSGtvNTJvWS84UHdh?=
 =?utf-8?B?S0ZiV1Q2eVdLYjNmdWNyWUhUTnhqc1RCVGxDbTM1N3ZMZlpxZy9EZjVaVUpZ?=
 =?utf-8?B?SThrMFBlNEJXVHFmTjUrN1grZ3hsbUxZRmp0b0JGNHVIcHViRWFTbUtvWUZj?=
 =?utf-8?B?Ry9kMnlrRzRTbitKdFFSaWI5UUVLY2hHZ3o4VXYxWVpCdTNUMTFsd1hUazdD?=
 =?utf-8?B?eGlvRnJMZ2IrdkNUTXNtUWJTdyt1TXMyYW13NmpTeW1UNzg4Ym02clprM2E0?=
 =?utf-8?B?WEJhMGV2YTZHQW9hdTVMVjN1eUVBWEkzYTg5OHg3L2s0Vk9YcFhoVlNHK0xz?=
 =?utf-8?B?UTZrL0h3ZmRwbTlZT0JwV20xbUYzZkF1SGQ3VjBGc1FYQzhrQ0dmRTViVFF4?=
 =?utf-8?B?TVlYZkpRT3FDb0ZZcEFGVzk1YU1VS3lIY2wwRTljd0owbElCOFB6QWw4NDVC?=
 =?utf-8?B?dmlaeitSSHE5MEJTbVhrWXBPUzZUK1liT1hpQkUvTXlhZTNlc0tPODcyMlZL?=
 =?utf-8?B?K0oxVW8vM1ZSVXc0NitTelcyRmt0NTRONHZRaXliWjg1ZXpqQkYxVzBNS2s4?=
 =?utf-8?B?SVBOSWw0b1pneHh3dWVjNnZzSzgyTFFiNWlObHZOaEluR3RqZFlrdEhWeUdw?=
 =?utf-8?B?NnN4YnBmL1MrMHh3RnNvZlIyUkFncUJ2cFRZV01oSlRCUmIvK25xdTF5bGxJ?=
 =?utf-8?B?dEduWEcrZGU2bTdRRktWdVg1K3F0eWxvOUl1aHIybEVNS0RTdGRYZTdyRzla?=
 =?utf-8?B?cUkyMTBjRHpiTXJuOUJmd0MxYklCS3hLczFqOEFUbXk3RnRmMC9FTU8xU01m?=
 =?utf-8?B?WEJydDhYTkxMT25FWlJ6K3F6UXVET1ZzZWd4eUdQbklTc1hiYzJiSTh5WDFn?=
 =?utf-8?B?TkhLUTJTZ0hzQTZVejJid3BzSEJwcjd2VXptZFNnNUdKUnJMSFBjRC95R3NQ?=
 =?utf-8?B?L1ZiTXMzQW5ETWhTbjJmdm5iQjBPaGpUMFN4bkpLWEsxeTlubkE4TitBelFP?=
 =?utf-8?Q?B4r78Lprp3HUfYWbik8zWMXbe?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b761930-514b-49fe-eac5-08dd613f6ca7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 08:25:19.1572 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hjVfw7K3QfADvJSa0UI/vnRIxQHkbVxDrzxeAJ7IwrBP9aUXIbSnoNmhElPxAFs9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7687
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

Am 11.03.25 um 18:13 schrieb Raag Jadav:
> On Mon, Mar 10, 2025 at 06:03:27PM -0400, Alex Deucher wrote:
>> On Mon, Mar 10, 2025 at 5:54 PM André Almeida <andrealmeid@igalia.com> wrote:
>>> Em 01/03/2025 03:04, Raag Jadav escreveu:
>>>> On Fri, Feb 28, 2025 at 06:49:43PM -0300, André Almeida wrote:
>>>>> Hi Raag,
>>>>>
>>>>> On 2/28/25 11:58, Raag Jadav wrote:
>>>>>> On Fri, Feb 28, 2025 at 09:13:53AM -0300, André Almeida wrote:
>>>>>>> To notify userspace about which app (if any) made the device get in a
>>>>>>> wedge state, make use of drm_wedge_app_info parameter, filling it with
>>>>>>> the app PID and name.
>>>>>>>
>>>>>>> Signed-off-by: André Almeida <andrealmeid@igalia.com>
>>>>>>> ---
>>>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 19 +++++++++++++++++--
>>>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    |  6 +++++-
>>>>>>>    2 files changed, 22 insertions(+), 3 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>>>> index 00b9b87dafd8..e06adf6f34fd 100644
>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>>>> @@ -6123,8 +6123,23 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
>>>>>>>            atomic_set(&adev->reset_domain->reset_res, r);
>>>>>>> -  if (!r)
>>>>>>> -          drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE, NULL);
>>>>>>> +  if (!r) {
>>>>>>> +          struct drm_wedge_app_info aux, *info = NULL;
>>>>>>> +
>>>>>>> +          if (job) {
>>>>>>> +                  struct amdgpu_task_info *ti;
>>>>>>> +
>>>>>>> +                  ti = amdgpu_vm_get_task_info_pasid(adev, job->pasid);
>>>>>>> +                  if (ti) {
>>>>>>> +                          aux.pid = ti->pid;
>>>>>>> +                          aux.comm = ti->process_name;
>>>>>>> +                          info = &aux;
>>>>>>> +                          amdgpu_vm_put_task_info(ti);
>>>>>>> +                  }
>>>>>>> +          }
>>>>>> Is this guaranteed to be guilty app and not some scheduled worker?
>>>>> This is how amdgpu decides which app is the guilty one earlier in the code
>>>>> as in the print:
>>>>>
>>>>>      ti = amdgpu_vm_get_task_info_pasid(ring->adev, job->pasid);
>>>>>
>>>>>      "Process information: process %s pid %d thread %s pid %d\n"
>>>>>
>>>>> So I think it's consistent with what the driver thinks it's the guilty
>>>>> process.
>>>> Sure, but with something like app_info we're kind of hinting to userspace
>>>> that an application was _indeed_ involved with reset. Is that also guaranteed?
>>>>
>>>> Is it possible that an application needlessly suffers from a false positive
>>>> scenario (reset due to other factors)?
>>>>
>>> I asked Alex Deucher in IRC about that and yes, there's a chance that
>>> this is a false positive. However, for the majority of cases this is the
>>> right app that caused the hang. This is what amdgpu is doing for GL
>>> robustness as well and devcoredump, so it's very consistent with how
>>> amdgpu deals with this scenario even if the mechanism is still not perfect.
>> It's usually the guilty one, but it's not guaranteed.  For example,
>> say you have a ROCm user queue and a gfx job submitted to a kernel
>> queue.  The actual guilty job may be the ROCm user queue, but the
>> driver may not detect that the ROCm queue was hung until some other
>> event (e.g., memory pressure).  However, the timer for the gfx job may
>> timeout before that happens on the ROCm queue so in that case the gfx
>> job would be incorrectly considered guilty.
> So it boils down to what are the chances of that happening and whether
> it's significant enough to open the door for API abuse.

We are also working on an enforce_isolation parameter for amdgpu which only allows one application at a time to use the hardware for the cost of performance.

The problem is simply that when you don't allow multiple applications to use the HW at the same time you also don't get full utilization of the different HW blocks.

It can also be that a crash only happens because two applications do something at the same time which is not supposed to happen at the same time. Those issue are then usually fixed by firmware updates, but are really really hard to debug.

I don't see much potential for abuse here since you can't easily control from userspace when a lockup happens. And the AMD Linux team has made quite a bunch of requirements to the HW/FW engineers recently which should improve the situation on future HW generations.

So I think we should probably just document that reliability of this information is driver and hardware specific and should be taken with a grain of salt and call it a day.

Regards,
Christian.

>
> Considering this is amd specific accuracy, it's still an open question
> how other drivers are/will be managing it.
>
> Raag


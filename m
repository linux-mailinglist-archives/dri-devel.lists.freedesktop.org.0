Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cO3tGC+SeGmxrAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 11:23:43 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0637592B8B
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 11:23:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5073D10E099;
	Tue, 27 Jan 2026 10:23:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="lf1SOx9+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010003.outbound.protection.outlook.com [52.101.56.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEAC510E099;
 Tue, 27 Jan 2026 10:23:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ugF+oKvbuAO+A4toLM6YWw7JpWf/8GE8CqExbx1lCekM26wEkrD0R3eZB/pwLE2qY+ggXlA0t/XxVjONBi11OdCi3HkSLkc8OAaCFdJsUl/pKfhUoDsomrmRYuBZuPdiZFlNZl0ooT/0er39juklriJyt7ABg1zLwWlF4ZP9qqR2zy83sGGIvwN1jHM4BOnSVTc92fvci5RzDRW3o8HEjzh2Z/9NruftqB/TGcRe/u2+fFeObMWO93+3AxfufGnTjrpFYDggu5LWaHlCM8UqQs3wgrEz9pMzFiiK27oY4kd0fyBZOxfQvUkZfT8oTk+7KXebag5ieEzctTTcMUPTrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/jr/imSRBdv9D+PnH0+U1oLscYXljCY6/IUKmrp4dYs=;
 b=ncQ8u704+W5IwgbRN3gBRZyMIT2Rc7aSj3rAUcWO/a9NtZTOhylkCDxMAipt7QGJBI0sJfS4tPH35G6eoFuaC5x4qQPW1R8NvoBOcwI2jD6YNRVXyQbB3440/QdX2thCvmcuAjmlPt4qaHZ42sgvlVG1Dv2j5c8gUupTbFrRJxBZTtQxvteAkFHdOKPuu2h+PSmQquO9ycOGQHnbk2FfhxplR3F4TQXYT5iz0gv036z4bTIJ1XEFlAkrF4+HCXGLssweCj7OW4Un8UErsatBDBs/pUoSaslDPsMkk94KbqppZnqsFANwlU4Fr438TwoVkOSKrH03p6YWgoXCgZvxVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/jr/imSRBdv9D+PnH0+U1oLscYXljCY6/IUKmrp4dYs=;
 b=lf1SOx9+/pFIFk/Q2yKIk4knoW7cdbaTz5koNE1wlUD+XzS3PgU44zYVWJlIVhHvFzxZGbMs05kDsHH8vHEuhj6PhAS8o1JB/IIKudJ6OXGnxnShlZWXYMDdEjgSOlHVmzcoY+Skmn0BJ8mef0EOOfrQO1QGRLf/OXl5SAmcMz8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA0PR12MB9009.namprd12.prod.outlook.com (2603:10b6:208:48f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Tue, 27 Jan
 2026 10:23:36 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9542.009; Tue, 27 Jan 2026
 10:23:36 +0000
Message-ID: <c9bd8587-aafe-447f-a603-d4fd0da2b567@amd.com>
Date: Tue, 27 Jan 2026 11:23:31 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 11/11] drm/amdgpu: move sched status check inside
 amdgpu_ttm_set_buffer_funcs_status
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260126133518.2486-1-pierre-eric.pelloux-prayer@amd.com>
 <20260126133518.2486-12-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260126133518.2486-12-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0298.namprd03.prod.outlook.com
 (2603:10b6:408:f5::33) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA0PR12MB9009:EE_
X-MS-Office365-Filtering-Correlation-Id: b9896580-b96a-4ff8-ba19-08de5d8e2165
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TnNGaksxUXVZSW0xM3RMZmVyTnBWZnlpdU1HUExEQ1hKeFZNUlVoTjUwOFky?=
 =?utf-8?B?ZHpPbENRZ3REZXZLektzYTB5OFpmMzNCQmRaeWVYSXJtUFQ3aUZjOGNaVXVF?=
 =?utf-8?B?d0ZXMjZLOVRYUUk5cDZYdFFIZEZMYjlYazJlMksvcWhoNnlOL3BuZmVxbFIz?=
 =?utf-8?B?QXFGaUlPa3BHTkxram91WWRmb00yNUhSQjhvWW9ocGhYanRCc1B4L3p3QUJx?=
 =?utf-8?B?VjE0dGtrVWJCZDhHNlZabDB0ZWcvckdVUGVwNzY1UTJpTitWUXRwR29DdG9u?=
 =?utf-8?B?NXdnNDBzSDhCV0JuYVFQRjh6eVRxdzcxc1ltWHpmdTJnR3lQemFDTWM0RmJH?=
 =?utf-8?B?YzVwYnBxUC91N09RZXEyMFIyZ09GYi9oaVltdzY5d1A4empDMzlJaXk3YXZs?=
 =?utf-8?B?VGpYWDNsakZEMld1dDdnbGhsbnBuSWU4ZVVBZW85TDcva1FEM0ZyNmdxNWZ4?=
 =?utf-8?B?SHdQYnNBNGlpcFp5S0wvS2Q4NnV0R1RIejZ6Z0hqQnJvVEJMOWtEV3pneXNK?=
 =?utf-8?B?a3U5QmladEFLZzYzY2Z3RVZBdjJTRUpKL21mSFpRNHdoTzdIWUt5UzJ1Sk4x?=
 =?utf-8?B?R0hHZ244U2Q2dGt5cWp0MFpYNkpPSDZyMjIvdkFreEorUmY5SmdLelFkcDds?=
 =?utf-8?B?TmJnS09wSVViMmZ1QVpmQXZnNHV2QUljRE1YMXp6ZHZOcTE3YVhiZkJrUm5p?=
 =?utf-8?B?MHFFd2tlbVQrYnF5RDR1OWdRNUNsOWFvdVl1YXI4RlJmRWk2Q1p1SzlHTDBv?=
 =?utf-8?B?d2lrSnQ5WWYrWXRhbnFDVU9IdEVORkhnY2UwYmJUVEYxTVBCN0xOU1FaV05G?=
 =?utf-8?B?TG5FeHBQd0x2NGNWZWYwV1hWeG4xelM5UVlHaE54clFOeDk0Sk5GdWRoalVL?=
 =?utf-8?B?MVFPb0ZydGlERHlKd2p3dlhkUi9CNWswaG1XaWQwaE0vemdHY3hZU0lCNnNk?=
 =?utf-8?B?RkZEM3JabTZnT21XdU04L2g2NktCV0huVzUwd0s0OGdZVDNJQzFKRklXOUtO?=
 =?utf-8?B?NG1mcmVPL2xQUUlLQkJSWnI4SFRYcndQTWZDVURpWkNJYkkwZkZxQXdyVTAy?=
 =?utf-8?B?V2NCVWswNFg1NVBuazg3b0o5UHQ0TmJOZFM0c3BhU0h1K2xQVVk5TVlNL2U2?=
 =?utf-8?B?ZEF1UStrSzdRRTZ0NDEwQzJYMTcxSTlEZjdoclJ5RzFJMlNFZGJ4QzJ6Rkp5?=
 =?utf-8?B?WlBERVVWMkJGcWNkZUVqQ3dtZDhEakdYd0NkQlE3Yyt6QkR2em1CWHo5cFhO?=
 =?utf-8?B?ZE9YS29sRUJKN25YTVcrRTlDam9uUGtRa1ErUlV4L1c5WXVYMytIb21ORjZo?=
 =?utf-8?B?dmpHWW1LN0pTL0hPOTMzNjMxa1o4KzhXRkgyUlB6eVFFM3A3R0Y1K3lNQ1E0?=
 =?utf-8?B?V2V5aEIwZllGSGdrSnlXWHB5bXNvdHYxeE16QnkxRXdmUk1kTGU3YjJUK1R5?=
 =?utf-8?B?VjQ3aDRXdlVFME1OQzJqa1ZlQzJGRWU3L2VXeWo5TlhFdGNTbjd2a1JSWnJk?=
 =?utf-8?B?NnhQeW9tSjFQR01wdnRYaEsyelJ5eFBlZGM2Uk1sNndiN2dHU25icDA0V2dZ?=
 =?utf-8?B?Z09IcU5kcWxqekN3Yjh4akFmTlJhUEFkOGpIV2YyNmxDM25WYjFyc2NrTTlN?=
 =?utf-8?B?ak1nUktyODNUUDZwN3AzNWR0dTNoaGMrQm1GRWx2RDRuU2tDdEZ5bHBaRHZD?=
 =?utf-8?B?dEtlVGtuSEpuek5jSGFqRVQxRkVPdnlpc0IwRnY1cXl2ckg5RzZyVVgwZUl5?=
 =?utf-8?B?RERoeGVPbjRlUktUUUxxa3M0TTBTQUFWaTFTaDhrWHRUWVlrMXNpWTNUb2dU?=
 =?utf-8?B?YmlpY2x3VnVDbFF4VlJuUVJIWkxYTEgrOGN0cWRqMUtTMW1ybGZTL3A5Q3FE?=
 =?utf-8?B?ODdQbHN5RXM0UjB4KzllNTRCTWVJbTVCQzNrZnd6aUVRL1NJb0RSQVF2YnQv?=
 =?utf-8?B?WDZCa1dDUHZrTEkyd0ZNeW5wTnR6U3FrejN5MWdEbEZEcUI1b2J5UEtMSVM0?=
 =?utf-8?B?TUgzR2FHeTdHQTE2WkxFZTMyZFMxbThTckMySGlQN0dXRVQvemVuRlM3WTRV?=
 =?utf-8?B?dVdmWmJvVlFUcnRRaVM0K29XbS9FazhvRzhmU09hLzhNaE5xZFZUZlpEV3d2?=
 =?utf-8?Q?kPNw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b3B6YnFrME9WZThEaE10dkZhT3J6cUtZN0xQd084Q2ZHQVRDSUhRYm9yNW5T?=
 =?utf-8?B?OFlkUTA4MzlGbUNmdkQwa1dwaEVCa1Q0UDB1bTZ5VTlRU2FOV3IxUDJjZlpO?=
 =?utf-8?B?eEtld3IxbzRDZTNBRERCdGs5b1ByVnpEbUhKWWlPcW4zUjFlOURPbURMSjBU?=
 =?utf-8?B?N04ydWY0RjUzUDVuRk9PVlZ1SHdHNlZUNk4rb2FrMmRkVDVaWDFidVN5Qllp?=
 =?utf-8?B?bE1ZOEhzVEtmMWFGRGJ4TjljZncyNHpxbzRpdEtTRW9yZldyVFRVZWo4RVIv?=
 =?utf-8?B?Yk15aVE0M2tYTUd0eENyZ2I4YjJ0VHFUbGNFU215YnRNSzNFeHM3MmpnTTI4?=
 =?utf-8?B?bkQzT3huRCtDWUNYWGdUVTc1OTgwOThReVZlUWxKWVNVSkpwVXpXOUhGNHZW?=
 =?utf-8?B?Snc2cThKYlpzUEtoSHZCSVJ3WGtNMWpTMEs1YTBWckt2S3pyRDEvK3luYlNt?=
 =?utf-8?B?SEQrSzVKZU8vWGpLUExZdDFoNjNkb2MyVGdKbnNBbGZ4eEZ2Mzk0dDA4dldZ?=
 =?utf-8?B?d0c0SCtQQmRiTUtBQ0NYRHRMbFZsYnVDSTNYc2VHS09nNFk5YnJuNEtKYVd0?=
 =?utf-8?B?R2t4VmJlWVRzdWZmT05BUjZuWDJ5UFZOTjcrclJyOG5JOU9zbEFQVEN2MU1C?=
 =?utf-8?B?d1U0WW1EK1pNUHFmOTAwSnI4aXVISmRTaUxVTnRQYm9udkt0WVBYZXc0SnpM?=
 =?utf-8?B?WmJwZ3A5K2haSXJGUzhDeDBnSHVZWEcrWVlpR3RmRFhqWGNLS05sYW1oN1BP?=
 =?utf-8?B?TTJpNTRkQ09aR1NzbVVLWmwzOTF5YzhnOUtWMkFUQzhpdDZqVW1OY1Z2Qm1E?=
 =?utf-8?B?ZFE5MnR1SUV0UWQxQnN1VDJlQkF5d0tGNXRTMDdkUEE5NkN0RGI3Z2I1aXBI?=
 =?utf-8?B?Q3RNYWZBOXg5QlFXWWEzMHNLSkFtbHRDaHdFVllmajJFMlIrMlVleGdPWlVw?=
 =?utf-8?B?cWxkVDFodFZPaHlOZlNKVzNEaTJEdzNiL3FWS2VrOVNjVHRJSitIUlMrMklv?=
 =?utf-8?B?NWFkOFNXMjlHTEdSeUN2bWlVZVVscjdaV1RXTE04dGZiRFVtdStVWnFHMkQ5?=
 =?utf-8?B?WFYybFJ2dW0vYzlIMWdBdFl3L2R4eHlsK1pqYnZzcmlqVUdjWEtaWG9kZURV?=
 =?utf-8?B?RUZDMk1WcWpIUFYyMVNOVFhFZ1JKdTJ2QUhoekRYdEY3UXJCSzNlZnI4NnRT?=
 =?utf-8?B?V1V0MGg5KzFXditEL0MzTk0vcUJzUTNJTSt6Qk1NWVVLck9ZU3lpTGEwb0lt?=
 =?utf-8?B?K3ZFanRsU21JSDVmcmdCQm5WMnAxVmhnZ0xYazE5Qk1zaVhCaFdhNkRHSitW?=
 =?utf-8?B?dk5ZVGhqYWVnR25mTEE0alBzNXFRQndhWktLOHZuMWMvVitNb3pMNlRvUkxN?=
 =?utf-8?B?UzdhV1JNZURTam1WOHFXMFppK3MzcGVRc044WDJpQmMxTmpvYXIybjZ1aE9t?=
 =?utf-8?B?OGZxbjhUamVFdXM1cVBJdWMvQlYzeEUvcDFQdVV2WG5HVGI5d1lyUnZrVjdN?=
 =?utf-8?B?UVV0dWVqTksySHlXUTM4V2ZMZzV2blhhNVZXUWpJdkc2THNtQW1kSXg5QjV6?=
 =?utf-8?B?SHhLYzh3UERSYlNkNSttVWNDdzl6TkFKMXB5UlZBbVBEWVdwbXhDWk9tNno3?=
 =?utf-8?B?UXVKMU53Nk5qdmlwRVlZVVZsdGkrdzg3VE5sQUFKaEUvMkdYWTRnRkhqdUxH?=
 =?utf-8?B?TitjWXF0dGx3ZFZ5d2p1dTFhRWpzVEtiTE1MUUFrKzUxRWpnUnZsVkdoYW5j?=
 =?utf-8?B?WGJpNGFhRWIvRXlnYk93cGp0NXZkME8rT09VZEl4eWxZLy9POXRJQ3lRcVZR?=
 =?utf-8?B?S3Y4QUkyVU0xRTRxaHl2RkJwSzArSm8ycllWK0JFV2tFK3RUU3JxcC85R1Nx?=
 =?utf-8?B?Z0NhMHYvWXRQQ2V3UzdvUDh1R0RPR245bmtGVU5lN3hRb0o5YTgvMTdyckdI?=
 =?utf-8?B?R0I0azJRd1RIQStXZXhEVnIyMnU3dEl4dWhlcy9jT1d3Sm8weVl1VXpWVDNP?=
 =?utf-8?B?eXdCSld1OFhoYzYvSTM1RzBCVEtnSkZ6WVNSaTBnYnUwa1JMQ1I5Y1pQYWhD?=
 =?utf-8?B?eldEdVdXckYzb3ZMdWVrZFFmcksvcmZZS2N4bC91V1FRQzdQRi9tTDF5Ym8v?=
 =?utf-8?B?QWZ0TWVDY3k3RVNES3VKWTFvQVBQOU9BRVp1MnlUQ21DYmVkSC90YWJwZXJC?=
 =?utf-8?B?TWRaeHVMc3NGVEZ1MFZDdEVocUpwWTVRWEFrQWhxdmxLZUNqWVhoak04b05y?=
 =?utf-8?B?VzFNSE1ob1huOVpDamNNTXhJS1ZKTFBYL0Z6dTZxalUxNGpzTUYzSzBxaTBT?=
 =?utf-8?Q?55Mof2gxbvm2w7Ad1/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9896580-b96a-4ff8-ba19-08de5d8e2165
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 10:23:36.4237 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vyTqm1bBfuaThfVoM40LZGLglJ9WWglJNlvgxxQjlcDBBrSrPcS8ShYjPoAmutgw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB9009
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 0637592B8B
X-Rspamd-Action: no action

On 1/26/26 14:35, Pierre-Eric Pelloux-Prayer wrote:
> It avoids duplicated code and allows to output a warning.
> 
> ---
> v4: move check inside the existing if (enable) test
> ---
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 13 ++++---------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    |  5 +++++
>  2 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 362ab2b34498..98aead91b98b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -3158,9 +3158,7 @@ static int amdgpu_device_ip_init(struct amdgpu_device *adev)
>  	if (r)
>  		goto init_failed;
>  
> -	if (adev->mman.buffer_funcs_ring &&
> -	    adev->mman.buffer_funcs_ring->sched.ready)
> -		amdgpu_ttm_set_buffer_funcs_status(adev, true);
> +	amdgpu_ttm_set_buffer_funcs_status(adev, true);
>  
>  	/* Don't init kfd if whole hive need to be reset during init */
>  	if (adev->init_lvl->level != AMDGPU_INIT_LEVEL_MINIMAL_XGMI) {
> @@ -4052,8 +4050,7 @@ static int amdgpu_device_ip_resume(struct amdgpu_device *adev)
>  
>  	r = amdgpu_device_ip_resume_phase2(adev);
>  
> -	if (adev->mman.buffer_funcs_ring->sched.ready)
> -		amdgpu_ttm_set_buffer_funcs_status(adev, true);
> +	amdgpu_ttm_set_buffer_funcs_status(adev, true);
>  
>  	if (r)
>  		return r;
> @@ -5199,8 +5196,7 @@ int amdgpu_device_suspend(struct drm_device *dev, bool notify_clients)
>  	return 0;
>  
>  unwind_evict:
> -	if (adev->mman.buffer_funcs_ring->sched.ready)
> -		amdgpu_ttm_set_buffer_funcs_status(adev, true);
> +	amdgpu_ttm_set_buffer_funcs_status(adev, true);
>  	amdgpu_fence_driver_hw_init(adev);
>  
>  unwind_userq:
> @@ -5931,8 +5927,7 @@ int amdgpu_device_reinit_after_reset(struct amdgpu_reset_context *reset_context)
>  				if (r)
>  					goto out;
>  
> -				if (tmp_adev->mman.buffer_funcs_ring->sched.ready)
> -					amdgpu_ttm_set_buffer_funcs_status(tmp_adev, true);
> +				amdgpu_ttm_set_buffer_funcs_status(tmp_adev, true);
>  
>  				r = amdgpu_device_ip_resume_phase3(tmp_adev);
>  				if (r)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index e149092da8f1..1929a03daf18 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -2354,6 +2354,11 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>  		struct amdgpu_ring *ring;
>  		struct drm_gpu_scheduler *sched;
>  
> +		if (!adev->mman.buffer_funcs_ring || !adev->mman.buffer_funcs_ring->sched.ready) {
> +			dev_warn(adev->dev, "Not enabling DMA transfers for in kernel use");
> +			return;
> +		}
> +
>  		ring = adev->mman.buffer_funcs_ring;
>  		sched = &ring->sched;
>  		r = amdgpu_ttm_buffer_entity_init(&adev->mman.gtt_mgr,


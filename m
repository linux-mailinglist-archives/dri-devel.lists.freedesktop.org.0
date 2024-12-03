Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E2C9E27F9
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 17:47:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E877F10EAB5;
	Tue,  3 Dec 2024 16:47:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="jgoUjpJs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2081.outbound.protection.outlook.com [40.107.220.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 558E110EAB5;
 Tue,  3 Dec 2024 16:47:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jr12O4H5Etw5cUFqPTe1gMkbAJTS4tjUzrbJeQVdwx9Gp0kOjTJdmdGFB85AF8NISIceOVFyHXY5vD/CUA0yCKf5Je5mZ+zNIQvS3g0zQhrxzZfCRzSi8msj34U1UwO57hVnMadqjN2AQY+EIWSqvh9QiuHingLQMOIuXnMBJXeE9M5e+kZD5W10hS8GieBIFTmJDBY4aqe0E8lacyVom9zqQMqo22WUrmw05g7RCZipYXzYXPEa7J00u552kWY1a74Ap/aeetxtawwSCr8FhXpMzYEUwNccbD1toEQL0hj52Q6y3yGHaEo7XFd91F7O1IdibySsExZO13YJXSiYoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bRFcNd+KI5OUl9AIsO+aK70HwPLycgCq29J/TewssB0=;
 b=vI9iV9J48BKqeBy/ABxltTZcXD/HUoVPF5z1iAeewya1qlBPYvQmx+OfY6vJMCVmc/AbFlyw2rUd0UEXienEKpiBVb5MorCwhX1nWW9QXFUr9ewGPczPVlVtp2BZCufwRTwx23voNtZhmeiqVqbKvf7SB/0YXdND9IX01Sb3B1IVvEQvF5W8AHL2ZrGmRaFRoqpUtnjOBlehqGJygM+cZ/H6MiSyZm1frgGsog3kNVMFUhhJLqlXI1eoOaOPjhHZ7LLVfZ7BL+1/JnITEef9UcXDaz6RGR1ER18AELff/PA9JAyWoMzedLMA2lcq2MmsbIDQHVeNP9CcqPCKxxu6UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bRFcNd+KI5OUl9AIsO+aK70HwPLycgCq29J/TewssB0=;
 b=jgoUjpJsKXEBx+knk0UW2mAblOZIYYdL7uWb6spbveYR2laBkIsZ6NZER0phY9CncBqUy2+xkL9VcoULs2DWxfBjP5VF2KJ3Yh8+aGT5IVsAKcM1b3bS/EN59640GzJ4pi0RPNPCq8GwQ/URJqyEBZDBk/Cfl4RX3jUK2sq1mmU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA0PR12MB8713.namprd12.prod.outlook.com (2603:10b6:208:48e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Tue, 3 Dec
 2024 16:46:58 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 16:46:57 +0000
Message-ID: <c74e9f5c-3201-4083-8b79-80fdbbd903f2@amd.com>
Date: Tue, 3 Dec 2024 17:46:52 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 3/8] drm/ttm/pool: Provide a helper to shrink pages
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org,
 Paulo Zanoni <paulo.r.zanoni@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>
References: <20241115150120.3280-1-thomas.hellstrom@linux.intel.com>
 <20241115150120.3280-4-thomas.hellstrom@linux.intel.com>
 <800ee040-7c2e-47d0-81e6-a352f5f689fb@amd.com>
 <a07c93704bc7f59f51b5a6a13aeb3e13eee28e3c.camel@linux.intel.com>
 <d1e33436-9c1c-43d4-a86a-956926a7096c@amd.com>
 <73588525571a68f5638300ef171591de10ba5e5d.camel@linux.intel.com>
 <0595e4df-86d4-4082-86ab-b77902d3020b@amd.com>
 <cf722b696676b7383a94c2b846f8230e180ee527.camel@linux.intel.com>
 <bc762b0c-4fe3-48ff-b8df-14f741c91939@amd.com>
 <f74a7b678b5013dbcbe090bbff885827d3675247.camel@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <f74a7b678b5013dbcbe090bbff885827d3675247.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0166.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA0PR12MB8713:EE_
X-MS-Office365-Filtering-Correlation-Id: 59175d5e-6797-4108-26dd-08dd13ba19e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aHRGdXpiQ1NwajFnOU5QRDJaVVByaGpBVENBcnpHUWxQa2dSY3pPY01KMDEx?=
 =?utf-8?B?alNXVzBqa0dBUFNRN3Nyc1RuYnZ4QWgvbUR3MlpZcVRRaVN5K3VsSzJPN1RF?=
 =?utf-8?B?ZEQveGluQTNHQjFjUW1rN3BTc1dpVVVCRUl5SDBTRDVhN3NUOU5UNHJMZElX?=
 =?utf-8?B?S0RPbXZQQkRNMjdqRDlYNUZDYVpqS2h5bzhKNXRTSUl6TWJPZnRJMkhwUjFm?=
 =?utf-8?B?UGFsR25PVmlOZThFT1ZCVUNaWnh6aU92WXl4SXdCRlJkVkdPTDdkOWpPN0tS?=
 =?utf-8?B?ZVZrUzZZRWNINjhaSkx1RXhFR1BJT1I1aVVpNEN1akR1RExtV0lhQlB1eGNZ?=
 =?utf-8?B?TmJraHFoajRCN2kxTmlBODN6RHQ2VnFpSDMyUlFUMWdZMVZuRDd2L2gzM3ZP?=
 =?utf-8?B?TFRTQUxHVERxcXl6QnA5RjQrYWk4czk5dlJKamJ3c2JGRU5XSEwxUy9TSEl0?=
 =?utf-8?B?cmNLcFBWYlJvVENXRkIzVWtXM0RXSHQzY0U1NVBDV0NzeklNUDR1ZXZUZGZl?=
 =?utf-8?B?NkIzbE85R1NaYlBWcThEamJicmRLQW1qcnJXN3ZoUTJjU2d5QTJYdzdFS25E?=
 =?utf-8?B?N25ja2MwM2xnb2RHNzVxTEdWZnhYald6NE02a1d4ZlRMR2pmYzFlR2UxdFY2?=
 =?utf-8?B?YVpsOWl1Rnk1Y0s5d2duRnpDZlg2MUlNaWRjQ3FVdWFpeUFlWTVXbjZDaXJQ?=
 =?utf-8?B?L09wSlYvVnVqRUFyVFBkZkhja1pQMVRTYTdrakk2R0habEt1cUg2MG9jRncr?=
 =?utf-8?B?OHBwd2FMUnpFMUJHakhnZlJJc2F1T2hRa3FaZkQ0SUF0engvclhkcEIwcUJV?=
 =?utf-8?B?Rit3UkFqSTFmU1cyYlFYT2UyN2VRazZ2aHdJbnhtQmRBVFhPVDh0UVJNc2sw?=
 =?utf-8?B?dVV1dmtadHNVTEVUSElVYTllak9VVHJvb2RSaGN5cW9NRUlEL05MNUVGQlpR?=
 =?utf-8?B?YVJMN2Y3MlJKODF2cFpPam5UbkV3eUYvWDZqVmZTU2Y3WG5nTXVQdWI1N29V?=
 =?utf-8?B?QllINnhWV3d4TTJxYkJCTXZnbE5mdXVPNEpVVmZ2b25qN3ZHWGZ5UVZDWUhJ?=
 =?utf-8?B?a3lmOHdtdklGU3Q2SGlMVFlYdzR2TGJNdEhGKzlZZERKc0drcmZySVdhOTJy?=
 =?utf-8?B?a3ExMHNlS09aM1V1Z1JENHkxcW9sZDhXNmdMclhKWlFHWjJId1ZPcjIzenBs?=
 =?utf-8?B?ZWUwaW1TV3V6S1IrZzBOZ2JSVmxaMDVnL0c4dGl3Wi9BVzY4b0ZFZGU2WW1q?=
 =?utf-8?B?K25jeUJwN1Vkdi9OKzZFeThBRUxueVAxUGo0aDhvMkFCQ1pUaklUZ1h4K1dT?=
 =?utf-8?B?N2FJSEZlKzdrMmFLRndzdXVabjdKaERQOThzeXltRTUrWHZXdlJmT3NXemRa?=
 =?utf-8?B?Mlh6eU1sMGNzdGhYUUNtUWZTY0tEdXlydjZUK1ZtVzJkWlJ3Umg5OWxzVFlj?=
 =?utf-8?B?V1ExVTNYTDVpRFMwdmdHSEtBQlFac2FjeGt0b1VPRGlKeGZvQlo3Ynk5VnBh?=
 =?utf-8?B?S2piVnVZN09ackhWV0JJc05XTHBWeHlxYndFVUVWWXp5M3dEcWFrU0hVK3dT?=
 =?utf-8?B?dEdoYm1PVVRiTUJ0c2hJdjBwbFNVL3Z4Unp0Yi9xTG1DR0ZCemtLdnpzNGFz?=
 =?utf-8?B?T1ZrNjJMUTQyMU9jUjNaY3p0dE1UaDZUenhSZmlnMmFhbnVLVVA3WjNOeXVQ?=
 =?utf-8?B?Y001bTUxQ1FFYlRqdk0yWHpnY05MTEVTS3IvWHpJODFZV3Jzc0VTZStPa0tX?=
 =?utf-8?B?S0VKZytSS1VXbXZnMStHanFZbDh2VjVBVnJMNnJXTUFuYzN0b0gwbHd3bUs5?=
 =?utf-8?B?aG5XQnZ0eG5hVzZia0ZkUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YjFKUFNyMkorT3ZIeVZaZlZORGRtQmxqM1RVdDhMd1IxbWlGcTk1QU1yQStY?=
 =?utf-8?B?TWI4Y2Zwc0J6ajd4SkJRZWh5NWFCMnNuanVQeUFSTzYvaHU3TzZRZUdKQ21x?=
 =?utf-8?B?bXlseWlhcngwL3pNNXhUQlFZUWRnTlQrN3JkM1VyS0FFcmNhODUyU1FJUVBH?=
 =?utf-8?B?cmtubjVhN2R5UTlyL3dldHd1MlluazFOUkE4ejJYdXY1T1d4TllObkVvOHVF?=
 =?utf-8?B?NzlPcURHYU1xTGU0ZFBUbE5hbldpWTIxWncyb2xCT3ZRZFRVU0crWUp5dlhv?=
 =?utf-8?B?M1g3bDdNcTRYVkZhdlMwUkJIaHphTTF6YzB5SmNsTU5NV2V1amhpVnBHNjZ3?=
 =?utf-8?B?NDZFZ1Z2NlhuZ0NwVjRlSWEzNFN3bkpIVk9CV0hrbU00WFpSeGVTdVVpOHBT?=
 =?utf-8?B?UmFCWm5hSGwxRDd6N0pyaVg1ekR3aGxidE9ITXp5WEhxWHYyQlJpcEZVZXBw?=
 =?utf-8?B?Nm1XK2VFQ3gvNkNjTzc5eVhrQm4xdkY0K0V3V1NlTG5kSWlCS2g4TnNzME15?=
 =?utf-8?B?Y3pZZVNQVkF3L2FIYmpKVUI5RVpGL0xuMENFeUsxZ0xIZnk4TXhSeVB3VkFZ?=
 =?utf-8?B?TmlzZlh0ZTdjUWp2TTlMNzFWWmNsblJhamtHUkRVYVViMnU4TjlNeGhISE9p?=
 =?utf-8?B?WWdXdjNaeWExT0FDZEl5R3piUncvQjV5T2s0Yk1XdUY1S1cwcXRsRXQxWmxv?=
 =?utf-8?B?bU8xSC9MRjBtU29hbXhIWTFaMXorY0tjUmJZVkVWZ21HUWJ2WjBYNTJqT044?=
 =?utf-8?B?L05HZ0thSDRkRXl3YzdaeWFmOEFuTWhFRVJaTjZBa05SS25JRER1WnNVUG40?=
 =?utf-8?B?bTBBaXZTMkQ4a3BNaUtrWk56Qm9Tb3dwUkVsM3lUTWhDT2wzdDZ0U2o0WUNS?=
 =?utf-8?B?RXBuWjJ0ZEVueDV0VDVyMTIrNUhiSFcya25oWktITWFzdWx3T2M2ajNrRUxl?=
 =?utf-8?B?cWVEZ3ZvVWtpSzVhL096dGRIRzVhbFQ4NGtnNTZzSEhQakpxa2NON0ZORFpG?=
 =?utf-8?B?bmFsM0FZcHpZR0NwSXJRN0tYd2NxS2p4WTlXZm5RQm5DdWZOVGpOQTJKcVha?=
 =?utf-8?B?MHNabGN2WHJtYmZ1MjBVZGplOEQ0YTBTUjVpa0JxTTJKMkYwL3N4ZGJPcXlY?=
 =?utf-8?B?WkNYM25nbTNDL3ErUlU5NkZoYzVzc2ZtZk1nMnVYNkhZaXpiOWJoWWNHdUpG?=
 =?utf-8?B?VndrbHpWMDU3MU51T0pGcXhPNjFYNEo0ZGRLMzhjWDR5NWNJRkpCYkRSSmxk?=
 =?utf-8?B?VVg5Q2xidGJnaDNyUFJ5dGRNWnQxTjYvYlRJVEsvcHpnQjNtUHI2bjRWL0Js?=
 =?utf-8?B?YmpXbXozZk16NitPREFnSVFVelRaY2RzVGp2cDJmRE9LRVpac2dGbVk5SVBy?=
 =?utf-8?B?NnJSK0tneHE0R0ZoYm1UY1Z2ZlpDTm9NNkhZWnFPRzVjYnZEU0podnRmK0pD?=
 =?utf-8?B?emZMR28rcm1FRkNzeHFKaVlCNWNSRVdZTVI3dnFXSC9pS2g1alBFNlVhTTVB?=
 =?utf-8?B?WmZ1Z2JBUmN2M0M3WDh0VnJocUl4YnB0dXIveHZTYm5GcjlPSTBEVzlhTVBu?=
 =?utf-8?B?WC9FT3YzMEd1UFJhR1cwV01Ta0VBejFVQkJJM0w3ODBHU0tHKy9jZUhUR09M?=
 =?utf-8?B?RTRXckZxcU55UWw4WlVBYUhlYkRTZE5VV0hjUjFkSER3M0ZSZGkzcVJic2RX?=
 =?utf-8?B?R3lUbUdOQjFnblhUNW95cVlFMkx4N3ZRNXpjWjNsU0FURFpFMWdMZGROTE8r?=
 =?utf-8?B?MmJYVnpOaTdxZVM3U1FlWkxPNms0b0ZsaGxmZjlOc0pNQVltYkZ1YjEvUEJn?=
 =?utf-8?B?MVNTSUkwTlRUQTJtL1lRZmlTYzRlTFZidWV0cWFpcjA1bFUrVUMvTXUyOStG?=
 =?utf-8?B?WW1XUFYxdE5UM2wxYlNFYWhCWjBjQjB1dnI4b0hkNHEvTEhoWElVekR3MjJ1?=
 =?utf-8?B?cm5YSXlKUnBoa1RRRk9UbWhDdmt1U2Eya2pqdWF0bzBsTG1iR0JNa1hsdzFI?=
 =?utf-8?B?SVUzdmtlOHYvUE51ZGFYK3NLM0ZWbG9DOEl0eVM1YTU4M1p6d20wOGdPdlJI?=
 =?utf-8?B?RW9hR2ZoaHgra1NySVYyZjF1dm5EZnA3M3FxK0Zlaytxa1NPdFpSNDVTWnZU?=
 =?utf-8?Q?Y5k6pkgl71d/XKXMdBTtzLMIq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59175d5e-6797-4108-26dd-08dd13ba19e2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 16:46:57.6951 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F8tZpbYwY26MXxmU602BfTrvxTih2vCy5sI4WsHgPTVanDyMKLqn/wj3ea0yeooh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8713
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

Am 03.12.24 um 17:43 schrieb Thomas Hellström:
> On Tue, 2024-12-03 at 17:39 +0100, Christian König wrote:
>> Am 03.12.24 um 17:31 schrieb Thomas Hellström:
>>> On Tue, 2024-12-03 at 17:20 +0100, Christian König wrote:
>>>> [SNIP]
>>>>>>>>> @@ -453,9 +601,36 @@ int ttm_pool_alloc(struct ttm_pool
>>>>>>>>> *pool,
>>>>>>>>> struct ttm_tt *tt,
>>>>>>>>>       	else
>>>>>>>>>       		gfp_flags |= GFP_HIGHUSER;
>>>>>>>>>       
>>>>>>>>> -	for (order = min_t(unsigned int,
>>>>>>>>> MAX_PAGE_ORDER,
>>>>>>>>> __fls(num_pages));
>>>>>>>>> -	     num_pages;
>>>>>>>>> -	     order = min_t(unsigned int, order,
>>>>>>>>> __fls(num_pages)))
>>>>>>>>> {
>>>>>>>>> +	order = min_t(unsigned int, MAX_PAGE_ORDER,
>>>>>>>>> __fls(num_pages));
>>>>>>>>> +
>>>>>>>>> +	if (tt->page_flags &
>>>>>>>>> TTM_TT_FLAG_PRIV_BACKED_UP) {
>>>>>>>>> +		if (!tt->restore) {
>>>>>>>>> +			gfp_t gfp = GFP_KERNEL |
>>>>>>>>> __GFP_NOWARN;
>>>>>>>>> +
>>>>>>>>> +			if (ctx->gfp_retry_mayfail)
>>>>>>>>> +				gfp |=
>>>>>>>>> __GFP_RETRY_MAYFAIL;
>>>>>>>>> +
>>>>>>>>> +			tt->restore =
>>>>>>>>> +				kvzalloc(struct_size(t
>>>>>>>>> t-
>>>>>>>>>> restore,
>>>>>>>>> old_pages,
>>>>>>>>> +						
>>>>>>>>> (size_t)1
>>>>>>>>> <<
>>>>>>>>> order), gfp);
>>>>>>>>> +			if (!tt->restore)
>>>>>>>>> +				return -ENOMEM;
>>>>>>>>> +		} else if (ttm_pool_restore_valid(tt-
>>>>>>>>>> restore)) {
>>>>>>>>> +			struct ttm_pool_tt_restore
>>>>>>>>> *restore =
>>>>>>>>> tt-
>>>>>>>>>> restore;
>>>>>>>>> +
>>>>>>>>> +			num_pages -= restore-
>>>>>>>>>> alloced_pages;
>>>>>>>>> +			order = min_t(unsigned int,
>>>>>>>>> order,
>>>>>>>>> __fls(num_pages));
>>>>>>>>> +			pages += restore-
>>>>>>>>>> alloced_pages;
>>>>>>>>> +			r =
>>>>>>>>> ttm_pool_restore_tt(restore,
>>>>>>>>> tt-
>>>>>>>>>> backup, ctx);
>>>>>>>>> +			if (r)
>>>>>>>>> +				return r;
>>>>>>>>> +			caching = restore-
>>>>>>>>>> caching_divide;
>>>>>>>>> +		}
>>>>>>>>> +
>>>>>>>>> +		tt->restore->pool = pool;
>>>>>>>>> +	}
>>>>>>>> Hui? Why is that part of the allocation function now?
>>>>>>>>
>>>>>>>> At bare minimum I would expect that this is a new
>>>>>>>> function.
>>>>>>> It's because we now have partially backed up tts, so the
>>>>>>> restore is
>>>>>>> interleaved on a per-page basis, replacing the backup
>>>>>>> handles
>>>>>>> with
>>>>>>> page-pointers. I'll see if I can separate out at least the
>>>>>>> initialization here.
>>>>>> Yeah, that kind of makes sense.
>>>>>>
>>>>>> My expectation was just that we now have explicit
>>>>>> ttm_pool_swapout()
>>>>>> and
>>>>>> ttm_pool_swapin() functions.
>>>>> I fully understand, although in the allocation step, that would
>>>>> also
>>>>> increase the memory pressure since we might momentarily have
>>>>> twice
>>>>> the
>>>>> bo-size allocated, if the shmem object was never swapped out,
>>>>> and
>>>>> we
>>>>> don't want to unnecessarily risc OOM at recover time, although
>>>>> that
>>>>> should be a recoverable situation now. If the OOM receiver can
>>>>> free
>>>>> up
>>>>> system memory resources they can could potentially restart the
>>>>> recover.
>>>> What I meant was more that we have ttm_pool_swapout() which does
>>>> a
>>>> mix
>>>> of moving each page to a swap backend and freeing one by one.
>>>>
>>>> And ttm_pool_swapin() which allocates a bit of memory (usually
>>>> one
>>>> huge
>>>> page) and then copies the content back in from the swap backend.
>>>>
>>>> Alternatively we could rename ttm_pool_alloc() into something
>>>> like
>>>> ttm_pool_populate() and ttm_pool_free() into
>>>> ttm_pool_unpopulate(),
>>>> but
>>>> those names are not very descriptive either.
>>>>
>>>> It's just that we now do a bit more than just alloc and free in
>>>> those
>>>> functions, so the naming doesn't really match that well any more.
>>> So what about ttm_pool_alloc() and ttm_pool_recover/swapin(), both
>>> pointing to the same code, but _alloc() asserts that the tt isn't
>>> backed up?
>>>
>>> That would give a clean interface at least.
>> More or less ok. I would just put figuring out the gfp flags and the
>> stuff inside the for (order... loop into separate functions. And then
>> remove the if (tt->page_flags & TTM_TT_FLAG_PRIV_BACKED_UP) from the
>> pool.
>>
>> In other words you trigger the back restore by calling a different
>> function than the allocation one.
> I'll take a look at this as well.

Ah, and BTW: It's perfectly possible that ttm_tt_free() is called 
because a halve swapped TT is about to be destroyed!

If I'm not completely mistaken that is not handled gracefully when we 
try to always backup from in the ttm_tt_free() function.

So we clearly need the separation of move this TT to a backup (and 
eventually only partially) and freeing it.

Christian.

>
> /Thomas
>
>
>>> For a renaming change that touch all TTM drivers, I'd rather put
>>> that
>>> as a last patch since getting acks for that from all TTM driver
>>> maintainers seems like a hopeless undertaking.
>> Yeah the acks are not the problem, merging it through the xe tree
>> would be.
>>
>> Christian.
>>
>>
>>> /Thomas
>>>
>>>
>>>
>>>
>>>> Christian.
>>>>
>>>>> /Thomas


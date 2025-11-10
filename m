Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90359C4638A
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 12:24:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66DA810E0F4;
	Mon, 10 Nov 2025 11:24:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="FLcCjLas";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012016.outbound.protection.outlook.com [52.101.48.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2308610E0F4
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 11:24:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rKTMSqmyd2NX6AG75/8hln02qEZ1AZ6cadOXaqURb2Fk5cnyMTV31hYe7cj4unQ5r5GS4nv28lCK5xgXJGQOMsAuTzYQP2mZNHNrD3icIga1XGAzh48ydypHk6D3sEvgHj9tufVn8vpJTihH0Wmz8HLd7ZzSKmHyLPg7e/rOfTyA8Ks9Xfi5tZun8Tubme3X8ALFMPtFol7m7IiI+VNk40d97QOoKxdlay58k/qPnqDic3rXCMwDP7cj4MNiF9UexfCh1pT3bqCtPS/8dqbaXAR10yjANIwiHXwAdOjIAxQDA2cm1V4R5Tx5zyqai/hIaLXo3erPXDLUBdD5R6H8vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bMocElK0rErTnx6NUK+Xg/GaiXLnnDzflwg8eU6RjIo=;
 b=puZjxO68kBUAhvRUqfdPtyA7ib85JbkPIwVT88RJuaLuzjf5k9qD2+UqBWtDXhsGSqwRPpSKrRUWh3ZUqtthMpe4xji7XY1CzMpw/iz9CC7HxN+xu3sylnm/uAZUcIf85mHhKZQjOQvBWV81BIiXqFzZyfCcj+vvF8JLJG5kEbsvF0ndxojXOfP09W7TCdjnhZMvdkZ/E43OLwSBFoI95NiTdZ9DcBkRbe5HL50g4Uo3wvStsc6PefqO7IIvnXEBnzM2zFoDdaXxFR9wzPX7chzV/0hpGZGlF8mbr6x1ZnFkq9j2dG0hgQ3NfGEBtwIX/2XVY8wMxy/WDBbwXsNccw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bMocElK0rErTnx6NUK+Xg/GaiXLnnDzflwg8eU6RjIo=;
 b=FLcCjLasbxiN7g8TbW3V83/C4lNEoLDZ4EmiEBZwbRfrBAZTbqWgSWyjZXDi8/IZzYlFgxApV8RH57l+yy4Jk3y5QlJOt0daupmao7rnpNX5VFjUNglv4mbc7ZeSc7lDu/YHXvJI6sr1tklb7qUZpWVM1mQTYndXCydIUMwF5sU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CYYPR12MB8891.namprd12.prod.outlook.com (2603:10b6:930:c0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 11:24:50 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 11:24:50 +0000
Message-ID: <ee63ca7d-77d2-44d8-973b-7276f8c4d4a5@amd.com>
Date: Mon, 10 Nov 2025 12:24:46 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Fix UB in spsc_queue
To: Philipp Stanner <phasta@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>, dakr@kernel.org,
 Matthew Brost <matthew.brost@intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20251110081903.11539-2-phasta@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251110081903.11539-2-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0157.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ba::12) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CYYPR12MB8891:EE_
X-MS-Office365-Filtering-Correlation-Id: d9f0d517-1cab-42c2-663f-08de204bc316
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eGdSR2tpWWsxcEE2U0VxUWFDazZJTXBRczFMYTU5TW45c3BsdWNud1gzd1pr?=
 =?utf-8?B?S0pkVWNvZGVOS2ZsUlgva1o3NmZMYTlPTzQrOU1vM0RhaThLOCtKOStRdVFC?=
 =?utf-8?B?L1hVVGo5aHNKL3ZpYzMrTzJQQkVob3Z3VWc1dm9lNmRLRmFkemFNM1ViWEdU?=
 =?utf-8?B?SEdKRVU1SncramFXSk5keW04T3FoWktjcDIyNmdGWWtTaTBMOExxL29LaVBj?=
 =?utf-8?B?RmRwOExOc3dQQ29WbG9lSnF1OFhGODFRNHdOcnJJc1NhNFJOUVZqYSt5OURT?=
 =?utf-8?B?N0Rvcy9zUFNBdjYyd2xuaVV4QUVaOCsvUDdwNjdCSHNjKzdzWWFRdlRpNnZM?=
 =?utf-8?B?Q1JybDBvZ1lOYXhWODJSZ21rWkxGWHVHRVQzU2VQcXFha3dhWXowZWg2WkFk?=
 =?utf-8?B?bGROeHBKaDhjVVhkTVh6WUN3R0xkaWU1VnZSR2d3b1hOek5BK25POC9lbzNT?=
 =?utf-8?B?RDZyQjF1KytVVW9oWGsxVnVSZEd6V3o0TSttNDFGRlQ5TWFBWk1zVWtYTVNK?=
 =?utf-8?B?UjFZZFdlMjg0WUhDcTBpbnBScmE5VlBnY1ZSK2dtMlFmYk43K3JOdDBnaWx6?=
 =?utf-8?B?bjNVV1BxMmFtaWtkempYWmppTHROTEYwcTBtTklZRDJFMk5FclYxbkVPSVB0?=
 =?utf-8?B?OExOQnAwUnJYemFvV2xOamJuK0dqT3NlU1lkcExEMTBKOHd4dkdnNHFnUndC?=
 =?utf-8?B?c3R4NXYyNkswSVlBRG5nTTJNSDFHTjI3YUU3MEZPMm0wNHByVCthODNMNE8x?=
 =?utf-8?B?ejRkK1NMTVN3djJKQ0RLeWE1TEZ0dkRUWWtjVVJSV3JqSlFST0dBUFFHc05y?=
 =?utf-8?B?a041VUJEMG5lS0M4amFjZHBsdWc1K2hKVVdBMEV2RXZDN0FVQzlrMFhkZ1da?=
 =?utf-8?B?NGZRdS90L0dsNFFHbzE5VW5TU2d5aG9HWVVmK3N6QzFKUitKTW9tTHpEUVFD?=
 =?utf-8?B?bndISDFQVG51d2psVllNZlRIaVZGZFlNc2xtTkh4bzlYOElQdGtoMUx1NVNM?=
 =?utf-8?B?bkFkRTdyWjZZcm1tZWlENDhIL3BNTEFkWGNrL0pOMlN3YjJYUExOWE84QWtG?=
 =?utf-8?B?cXJGTTFIeFhLbDV2bmtRZWF3RmQ2YzZPMTdxYkJLa0NrMzVuUUdUd21xZ01W?=
 =?utf-8?B?V3hHcWMrY1pmc3l4TDdGNFppdGI1VitBUVo4UEx2ZHB0YWhsN04xKzBrUkxJ?=
 =?utf-8?B?OEx4aFVmZFN2VklWTlkySk1iZkVWQVVjeEgzbkdmS0p1aE5idmRGdWd2Z2x0?=
 =?utf-8?B?M3I5T3gwb3dNYzJZNTBZSXBSc3ZoNTdrUnVMTmdZblgraDlHUURkbm5BandH?=
 =?utf-8?B?bURoTEk3Mk44YVBMaC9wSllxaSsrSzVjYUJMTlBUeGFzRUJXMHd3ZS9QVCsz?=
 =?utf-8?B?OHQwY2Z1TFB1eTZDWS9ySVRsdnJ6MzluZGJPV0VlTEY1V0k0Kzgzd1h6L09T?=
 =?utf-8?B?QVVYZ3J1VkFHTXRUdTdtM2E4TnYvVkVBb04xaER5Y095UHVJU1FpUXhMMnhm?=
 =?utf-8?B?c3BheVpjVUhKNXZJa1RjWHVVc2Z3ZGdUZ1h4QXZIaURtRUtlam9vZFlqWUda?=
 =?utf-8?B?NVRSSUlVdlBJMS81R2laYm9rUEwwcmlaOVRGS0NOV3ppVTlHcEtZRGNDTzM2?=
 =?utf-8?B?NlRsQVZlUHA1cForcnY1Nk1DNVBELzc1cU9mZzFBMVJCRHZHcmU5UHU5M3Fz?=
 =?utf-8?B?RmtzWnFSdmdqTzl5YUhIWjVEYkcrWVRFM2FuQTdlZVZPRWZEcHUrMW5tMndG?=
 =?utf-8?B?eG5EZFZwOHkrQ1lyc2ZON0ZDN1owRUdzWFcxTmFYa2czT1BTTEltZ2t2d0Mv?=
 =?utf-8?B?dlRkbU13SFRHanZIeVNabDNVaEo0WUxwQXJqMGd0QmUxYWhMeEY5UGN3blpX?=
 =?utf-8?B?SXpQMjhoSzJ2Y1dxYnk5WEJjNjNsVWNPY09JSE9ma0xucERhbXpQK1V0RkRu?=
 =?utf-8?Q?jZUNEjQRw3aoIQGy+hYiuDdKKZ5Bt4RS?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?REZCcmk0Smh5Q2JBM2VJeTNsUWJlQzBwYlZaRkdHMFNuMDNFMkc4YzljaThz?=
 =?utf-8?B?aldCZU91SWJQWHZxNkZ1dktwRFNQR1VqSFpsdHM2c1VKZU1TbXZ6djF3SmF4?=
 =?utf-8?B?U3MzMk9WZVRXQWZTSklQTEJ2M2VCUlFtUStGNHRFd0RITWd0MXB3S1dTTmEr?=
 =?utf-8?B?VkJaTXRPSDZTV2hKT2tGbEk0ZVdVM2ExOGlBdENpSUF1Vk90MFBYTXlEVVdi?=
 =?utf-8?B?dkxPNnZvZHRlOGQyMlV2UEw4VTkwcUswYm1CdWRmNlEzMUdzNDc0cGVLbVhp?=
 =?utf-8?B?ZFdmZlhCbFliSGVCY0I4YnNDa0VrODNZUnFJWUtUTUMrdkxUbFgxRXFNVUdx?=
 =?utf-8?B?UGZQbmRsVXRONEhwMHBKT0pTQTZBZ2ZzY05sZGdHcWs4N21qaTFhRStUeE9r?=
 =?utf-8?B?NFQ0amt4eE1oNkxBcU03SDJuNFd1dHVnRmRjQXp6ZXBZOEZnNFJGbHIvMzdD?=
 =?utf-8?B?UUJPU2FHQWRiRXUyckoySUtBZWtvZmhHT0xoeXVsZnpDT3JyQkpyWUI5N3NE?=
 =?utf-8?B?cktiQkx2d25pb29IWFJwMDJjbXArcll5T2hIdmJqKzZnMmRCZHNwMFlNSlFX?=
 =?utf-8?B?NHVSYVd4Y0Y0bVUyRXNIazlRK3JzMGR4S2VBNzgxeDloby9tTXNnUnNGeEdt?=
 =?utf-8?B?S1hxQ3JJRGtKS0ZFVHhlSTJKcHBCRy9RS1RTNENjRDRNWWxjNFQ0MUhKUGhG?=
 =?utf-8?B?cGxxc2hSb0lscnFzNGFSdmhVLy85eXY4aXFaN2hBeWs5WkMveWkzUXNrNDA2?=
 =?utf-8?B?Ym1wK1BCUmg5cUZZSjkvY0xISVIzNHY2UXBSdk1lYXRxVEdXa3oyWloyUWJo?=
 =?utf-8?B?TlRFamg5NXZKb2duY25xSGJlR2lFNmhLMXNWYTRabHB0T3dLVG5SZEE4b1ll?=
 =?utf-8?B?eFhwOGxyNStKbVFqSW83UCtxdXYzVzUydVpMT1VtNnVhVXp5RjZ3bHRTeWZq?=
 =?utf-8?B?MThuVlkrcFVaNlhBK3NzUHhveUREVmNrd2pSTEd5SDZGbmdOS2NxRWtUM01Z?=
 =?utf-8?B?Y01JYXJpS0NISHFMS29GcHlBVHVySWJCUzViWUZFNDVpOGhIWUtFZEkrQkVR?=
 =?utf-8?B?ZkZZVkg5VU5CdFgvbHd2OE84Z29LSjJjMVNEYTJMZ09obHdlcEVaM0p0Z1VC?=
 =?utf-8?B?WTlsRFlhZHpzWXNwMzdLdjA0RCtLRXZiNjdVcXl3aHVxdmd5ODFML3hOQzVN?=
 =?utf-8?B?aUIrS2UxemthdnI0VlcvRERJQ3pMNzZYTkRrTWV4MGs5eWQrMlVtbnhwSDRN?=
 =?utf-8?B?RG9GR2JtbFl1bnc1L01acWZhc1lIcWFBNGxmN2JOcG1yOE84ZmY3eGJUUHBO?=
 =?utf-8?B?MnZhSEU1UjJ3NkwxaEE5ays0SkxIQ1JnbGJmZ1d3VmcvTGl6UWlPc0ZHZXh0?=
 =?utf-8?B?TDRwRFVLVkJaWkRKeWhtNTFGa3NXdGVvbGNNWHRJVVE2NytGVmZRZHhFQllm?=
 =?utf-8?B?R0p4UVplRU9HbHk0d2lZd1ZoMExWZlpXRVhYOFBESEpXRmk1V2JSNWl5VllU?=
 =?utf-8?B?YmIwQWUrdisyUjVHaTNGQTJCMjNXaWRYd1gxUGlMQ0NxTUhidjZhcWNsV1ps?=
 =?utf-8?B?UHNIQ2NFbmd1RU1sT1czV2pTM2lMSm9VemhDOFVoeEVsYVBOdDRJdkFWYTNy?=
 =?utf-8?B?YVdrYlNIYW5nYTFua09wbExlbUppR2g2cEhydHM0Tmc4SlBFOGF1QWQzMzFK?=
 =?utf-8?B?UUJESllaWGZBelM4U2NxbHBFa29yRXkzcTQ2Z3ZMSXhDNGwvWmFaVGNhQnpN?=
 =?utf-8?B?TnUxa1lPQkMrN1VRWWkwOXdvWkw5QkhXSWNvOSszanJOOWtmMUpPSlY2cGo2?=
 =?utf-8?B?MWV3azV0NFVodUZydjExQTJ6RzNEQVBoSElBNnNpdkhYN2NQK3d6TXJJNnRv?=
 =?utf-8?B?SEJvWmVqUnlGbGlDZmlrYzI4WnBpT1FmdEVsb2FQdkhicFpHZWNWZ1U0RTR1?=
 =?utf-8?B?dWR6bTF3QTh3aTdrbFA5ZldFNE5ndzlaZkZEQnc2UkVBZFJGMG1MSEN1M2V4?=
 =?utf-8?B?NHVwL0hCZXBVQ3FMdUlNK21uREt3MERQZHVubUx0cm9WRUt0ZXZvUEowMmNF?=
 =?utf-8?B?YTFENjU1WnBkbkM3NURMeWo3ZWtUS1ZQVnlPZmhtamlWbEdCdk5vZUtsZllC?=
 =?utf-8?Q?oEFdzcOBdAe8agsorwt4iJcni?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9f0d517-1cab-42c2-663f-08de204bc316
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 11:24:50.4242 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fb4cotuu2d+oOwlJhsHXT90rRwnKComXJO37nBQTv4yZDmbezSUXwycRRC0/2fSE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8891
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

As far as I can see that is not correct or rather not complete.

The peek function should only be used to opportunistically look at the top of the queue. It would only be problematic if it returns a non NULL value once and then a NULL value later.

The whole idea of the SPSC is that it is barrier-free and the signaling of new entries to the consumer side is providing the barrier.

So basically on the provider side you have
spsc_push(entry)
wake_up(consumer)

And on the consumer side you have:

woken_up_by_provider() {
	entry = spsc_peek();
	...
	spsc_pop();
}

The problem we are facing here is that the spsc only provides the guarantee that you see the entry pointer, but not the content of entry itself.

So use cases like:

woken_up_by_provider() {
	while (entry = spsc_peek()) {
		...
		spsc_pop();
	}
}

Are illegal since you don't have the correct memory barriers any more.

Took me an eternity to understand that as well, so bear with me that I didn't previously explained that.

Question is what should we do?

Regards,
Christian.

On 11/10/25 09:19, Philipp Stanner wrote:
> The spsc_queue is an unlocked, highly asynchronous piece of
> infrastructure. Its inline function spsc_queue_peek() obtains the head
> entry of the queue.
> 
> This access is performed without READ_ONCE() and is, therefore,
> undefined behavior. In order to prevent the compiler from ever
> reordering that access, or even optimizing it away, a READ_ONCE() is
> strictly necessary. This is easily proven by the fact that
> spsc_queue_pop() uses this very pattern to access the head.
> 
> Add READ_ONCE() to spsc_queue_peek().
> 
> Cc: stable@vger.kernel.org # v4.16+
> Fixes: 27105db6c63a ("drm/amdgpu: Add SPSC queue to scheduler.")
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
> I think this makes it less broken, but I'm not even sure if it's enough
> or more memory barriers or an rcu_dereference() would be correct. The
> spsc_queue is, of course, not documented and the existing barrier
> comments are either false or not telling.
> 
> If someone has an idea, shoot us the info. Otherwise I think this is the
> right thing to do for now.
> 
> P.
> ---
>  include/drm/spsc_queue.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/drm/spsc_queue.h b/include/drm/spsc_queue.h
> index ee9df8cc67b7..39bada748ffc 100644
> --- a/include/drm/spsc_queue.h
> +++ b/include/drm/spsc_queue.h
> @@ -54,7 +54,7 @@ static inline void spsc_queue_init(struct spsc_queue *queue)
>  
>  static inline struct spsc_node *spsc_queue_peek(struct spsc_queue *queue)
>  {
> -	return queue->head;
> +	return READ_ONCE(queue->head);
>  }
>  
>  static inline int spsc_queue_count(struct spsc_queue *queue)


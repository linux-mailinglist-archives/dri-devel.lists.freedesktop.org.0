Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9A1B0204F
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 17:21:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9E0310E39F;
	Fri, 11 Jul 2025 15:21:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="J9h8ahDO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2082.outbound.protection.outlook.com [40.107.212.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BE0610E2C1;
 Fri, 11 Jul 2025 15:21:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qjcWpowYR/vRWrw+TylPS8U4NbmBKOxWmWuQ2IwfiCUVI1rA1ItMbeB+iNk7tuqi+1SUN1z23rbQHl2j8e22KxqPmAVZ+NH6WBzqAvyHah39yZwtMa0giQV56OYLacpwgt5VkFJ4RQ2f5TE5yodtGh16CKaCj1LxtB3aB6Bzkz5WCtP5mGAaOqr7fYYhn08Rh2YSLawvabYv1kiitia2JZQjzbRl+zUIRP2HEp9m2rKGBiOwpmLPcuc2eVzayFky2Acl1TiBfudY3HEaZXdZ26DXujemhWuRzl2yi3XR4Iu9XaPh0uu24mS3dm92rt1tYfFIDp5dN+sEl8IKbA59Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oMd92AAVYdhWuLoRrcbWbcCSLdrXghWRCNJgkFL1CfM=;
 b=INRNcucFfkffYkpzD1D3OAgXy92ZauOVOKhQ+HuZ1RsrOUWnjt5iRglsgz4k4JFiZSZigh/aMRCMMwIlJYtD94juhssIBrlDAZ7gDMDwoyvC5CeQDiSXa8XcOLuNIz1oxoZ2CjX4e/Omct3hfAhHF1wR0vjkmHiz+QmS4Np8oDFEFJgD6+Kv2jlg3qHPxp/VddRl0maIZyVUWS2XyxcN+PMVKK5w6R2OQk3NJCPvO/ana+UEQ1/c0V3zWPOZA1gFlT8xNUxg/ljSJUhzjOrcIYrB2MJJuYkKzCJVRMFfxamS5zUHN7Jjf/066WDToKKKkbLrJtyCAG7i9OKd3y4iEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oMd92AAVYdhWuLoRrcbWbcCSLdrXghWRCNJgkFL1CfM=;
 b=J9h8ahDOnD43X/1XlW3HMmbHfSDWqGsv4O4hIfhuro3m4qZ4GA92hNVsZ9oP4GsjTT7u/7uCKy2UDpn1RWG/g9YCbgWmc/wbez+X/YP8Mw59RTHricF4qbkAkA8yhOWBIqcewVEbp66qScn4eq1CzdpX2ULMPvTagueQzNE7BhE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY1PR12MB9627.namprd12.prod.outlook.com (2603:10b6:930:104::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.21; Fri, 11 Jul
 2025 15:20:56 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8901.024; Fri, 11 Jul 2025
 15:20:56 +0000
Message-ID: <176e7f13-52e8-42d6-a9db-0bb237790aef@amd.com>
Date: Fri, 11 Jul 2025 17:20:49 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/8] drm/sched: Allow drivers to skip the reset and
 keep on running
To: phasta@kernel.org, =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Simona Vetter <simona@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Melissa Wen <mwen@igalia.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, intel-xe@lists.freedesktop.org
References: <20250708-sched-skip-reset-v5-0-2612b601f01a@igalia.com>
 <20250708-sched-skip-reset-v5-2-2612b601f01a@igalia.com>
 <20499b2a-0695-430a-9280-035a7e04d328@amd.com>
 <335c9bc57d19f17a3ba0da311f287dfdc3d580c7.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <335c9bc57d19f17a3ba0da311f287dfdc3d580c7.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0034.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c7::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY1PR12MB9627:EE_
X-MS-Office365-Filtering-Correlation-Id: 00f81806-fab3-4670-c510-08ddc08e8831
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZlYwbWl5ZkN4akd1MkU2OHU0ako1UExvZnF1WVpJY25vK2V1SGVlVjZjMGtI?=
 =?utf-8?B?TEgyUUF4bGFvYVZEc216eUU3bHNOc3J6bXkxY0V1QXFIWGFZTmFZaEhFcFpi?=
 =?utf-8?B?WXJkUW1Malo3akYvOFBKVEtWTEIyTWlXYjFVR2xaV3BobzR2NUJrVTAzM3hD?=
 =?utf-8?B?MHMvZTdvMnJQNkh1TjNuZXYxYnZabFBuT2d0ZEJvaUtOM2JkN3lYdTNPeDdV?=
 =?utf-8?B?bmowM1NDanMvNTdPWkM5QWlwbzdjMUNaU25VS1pYYlkzZVBrR0F2eVgycjM0?=
 =?utf-8?B?VTNNN0lYNUpzV0REcXAyaWEwdzBLa21CR3psUy83NFFZaUpRb04rOE5CcWR0?=
 =?utf-8?B?RGZWaEpPR0RVb0FSM09CZTFKMVk2b01uZG1oWm9Cd1ZReWs5bUpheG9mVGls?=
 =?utf-8?B?dUZPTi9jQ05rUncwSVQ3cnpQSEp5VHdLaG95OXNSUGFZemU3WkpkN0JjaHd3?=
 =?utf-8?B?dmd2cnQyVXA0T1NQQzlyc2V5ZE1wZ1ZJejdrOVFHTFFPQm4ralpxK0FoSG80?=
 =?utf-8?B?cU5NVnR2MHBTRklDb2Q5ckxKQXEwVlBBK2QwYjhSRGpnYXhidmNhbS9xYTZk?=
 =?utf-8?B?Rm82R2FMQUdNc0tzbzBXT1IvMkpPejRoZHo5WHpoSkhnY3IvVjNSRjFGY1B4?=
 =?utf-8?B?cDhGYTB0bjZWWUJ5MnZFZkNySkFINXQ1OVluOUgraDZRcUl0UEdCT0F2cmcz?=
 =?utf-8?B?aGtqbU9McDV3TGRoenVVV3VjYzFsbndZSUc2K0dhVnhVa1BjeXpvcEJUVjhQ?=
 =?utf-8?B?QVl6dFZ2QWx6UHVHWnlDaHR1UkdZajRzc2Y3dkJLWVdkcERtTHJpb0dRdW9B?=
 =?utf-8?B?Uk9hQXR6c0ZKc1VPSVNWdC9uWVkyM0o5WHBYa0FJd1lFY1h1WllxaFRxdUxJ?=
 =?utf-8?B?RlMyS0pEaG1ody9kSENYRzRnenBLYmdHbUNFb0R1ZDB2dVoyNHFUbFdkQStV?=
 =?utf-8?B?a3Z3aEh5Z1dnbUNuYVk4MmQ2SVBUWXZCQmU3Qm1hZkZUbXRFNVFnRDAzZEdv?=
 =?utf-8?B?SXlwdk0xMXJZUTlYdit0cWo1QU1pZXBJb0c2bTRZalBqbmZBd2hlUWhlTm5p?=
 =?utf-8?B?TTJNL3Z2b0w2ODlZbE5vNjMzR1Mrb2VSYi93d0pEWitiQVNOYU5ha0FBWm9H?=
 =?utf-8?B?UXZXUGVlT3YxTFdPOS8yNnRLTk1RalkwK3oxeTZQam9NeTAzVWhGUUh4RWhE?=
 =?utf-8?B?bnZCck5VQU9Xb2RUM2QzUGdKSjVoWnFUTHNYSTFZOGpBT21MaGI1UkFmR0JH?=
 =?utf-8?B?Z1BGVTZHSC9XeUswKzh5SlNxa2RSdkhUeXJkS2ZXT3FsaXFnMmhTSFR0ck0r?=
 =?utf-8?B?UWFFRHRwZlo3YUxIZzlFWTk4bjl5RjNGWnFQZzlRZ2cxNld2NVdWWHRHVEZS?=
 =?utf-8?B?OXFvVHRqdFZ0RFl4Rm5BMTBHYlplWmFOQWZBNHYyS1pmMm5MM3Q4UTJ6WHow?=
 =?utf-8?B?cUhHT3JkcTd6TUZjNzlUNDBtb3VCN1lieHhDTlRDTkVwQi9kVTI1TkpFQUtL?=
 =?utf-8?B?VDRsSnFlTytCeEwwelRVUXc1czhSUFZ3YjRNeUhlUUdHV0NMT25Vd2dTRTZv?=
 =?utf-8?B?RTB0VUZEaWlKQWZ5eDhFbHJ5bEZLeVFZRHdaZDFOZkRWazBYYTZIMGdnUGVI?=
 =?utf-8?B?TGdYYVp0dFRFN3p6b1hmdGppRTZsdDVIQ1NqcjhQL2x1WHVPQy9IazF4RWY2?=
 =?utf-8?B?V1RnMVNET3JWT2Q1a0MvY0d5N3oyV0VFNGhZdmczeFRGZi92UndjSmc2OUt4?=
 =?utf-8?B?aG10SkpVYXpscS9HTng5MjExWWhtdEgvYXcxS1ErMWtCMDYrdTg3ZXU3T1JO?=
 =?utf-8?B?YWY5aVlMbzYvZDZoYTQ3T080MzNZamFCeWs3UUZZeSs3RXJXU2JFYWxPaG14?=
 =?utf-8?B?TEVvbE8xSDY0bjJQN2xXMTZydk43L283bUhIZlAxbG1WREhpVGxvOEtmSHZK?=
 =?utf-8?B?UmhNSlMvUGVyL24vY0NnQjJ6ajFXcDMyRWU5TGF1M2Y5cEEvSjBOVm9BcldI?=
 =?utf-8?B?UGtFcnluaHVBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVpPa1F0QXpyS2MyL0xLWlIwSkJ0K3B2SUk2VkVXY2xlbjBtOElsQklRUGpw?=
 =?utf-8?B?d2FFYk9SK1F1N2hLOFZlYk00NUF2NDZyNXByL2d2YUppUk5PS2RmNWJqYnl5?=
 =?utf-8?B?U1RnUU5CLzZWWnQ4QXhwMjhTTjBDVXZTT21YYXNhbXZLR3hWc0FLOEdza2Jv?=
 =?utf-8?B?cUF0WHpzTGVsSE1yTU44dzNvOGJvNjgvSVh1MityS2VuWHNmTThPVTAvZUta?=
 =?utf-8?B?bTZHc2YwUFlUd21SNXdpOGpXWFZSaG9kVm9yTnhDUGdoaWcyWmhIYVZKZzFv?=
 =?utf-8?B?aE9vQUFmRWJzVm1qNkxBVEhnSG5wTnlQc0dtZXM3U0hxYUJYUTAvaURTZEpG?=
 =?utf-8?B?ZGxJUXZ5RCtHRVRJbEdNR08vcWNQdndwS0NRb3dVNXJmSVp3bUpCZHNxSTNj?=
 =?utf-8?B?MURmYzhIVHY2eTZ6MWJqNEVSQ2doMllna0lhY29wQzJ0dUdSeGViZjFkc1dm?=
 =?utf-8?B?LytDSXJtS1gzOFBnTnNwSGIrSnJpZFdja0tvcWU4SklZRnYyWm5aaUZvd0w0?=
 =?utf-8?B?RTNMRHpsMU9oSWJwci9Qa2dZL04wNVBoeHd3SjA5dmhZeTc1R1BiWDhSL2hL?=
 =?utf-8?B?SWFrYTNxUFE2TmNNWFJiOGlJbXBOUkNLRC9hTzRvdko1OFZyUWdaRjhER213?=
 =?utf-8?B?OUM1dmtSQlRXWkg3dVRZbHFzWTFHQU5BWkR0bnFrMGdIY29oSm9yR01hS1BP?=
 =?utf-8?B?Q3NqbnF1blEreFhGcnNhVk14RzZmVzhzclIzKzRMY1NUeDBKaFl0a3J6bXF5?=
 =?utf-8?B?MEt1dndyVXpBN2wzVmdxMzlVTE4rWnRwYjVZV0piOGZkZnlLWkFYYzV4UEVt?=
 =?utf-8?B?K2pkeEJaNEs2WUZhK0NFSW82VmVoTThjeWtMbDZtVXcwdmlJT0hSRUt6dCtG?=
 =?utf-8?B?U0RzZ3NTWkVNNFBXK0NFTjhhNXZNWkpZaDFtaHU3MktiaW1xcWp3OEVDRHlk?=
 =?utf-8?B?SzQ4ajVkb3VNSkJJcXZoL0tlMll4R1ZWMkdWQkhUWjBrMCt1bGwyWDlha0lu?=
 =?utf-8?B?S3h0SnQ3NGRUajV4NGM5UklIMHdQZW1kNU40WE9aMlcrMGFJKzNrZUVDSGxZ?=
 =?utf-8?B?c0VXRjkzNUZ3eVQxOHUwT1NPSGxVYksrOTNoNStUQndwWHRBVllJei9lVCtz?=
 =?utf-8?B?WFR6cFdSRDFXdDFmWVdnYm0vdUw2VllQMlE3c2taYytqNVFmZGVHMkwyNm52?=
 =?utf-8?B?U0NNOXBnbVdZSUFzM3hTd0YxbnVoNG00NXpVb3pwTzFBYmN2U0QydGhrN3B5?=
 =?utf-8?B?RFltOWhxdENzS1B0UjhYQWdLTXNYV2FIWm1uTEl5ZDNjZTd0L2ZuUmZaTVdY?=
 =?utf-8?B?WjJCT25waVZDQWZQMjljMHRxRWNlTDQ5MTFlY1pkUHpzbnRPMTVJTUVja3NB?=
 =?utf-8?B?Rk9zQ0pqNTRqQXN6SHREVllxZzZlanpDaTZrM2hZT2dXZG1UVVhSTFBhSHpo?=
 =?utf-8?B?OVRMT0pYcFBPYU9UeUxmTVNqV2NXMTJLcGFvRisvSzNMMEpRc2dOcnNIYitF?=
 =?utf-8?B?TGF1SEl2b0JSWWdhdUhZKzYrR0cwUmVDV1JXUmMzMWt6Tkd6YlpCQVZPU01q?=
 =?utf-8?B?Zm9kU2JPRHVodldFMjVxVlA3OWd0aXJQWllpaEROU3IvQlJkUWNEQ2Z1VEhi?=
 =?utf-8?B?QTdSeWgyUDJ1K1JYNFJHUU1OTHVSL3MwQzhmYlJjdDVrVEZyNEI0Z09HRlo5?=
 =?utf-8?B?MHBWWkZEazlzRjVIaUovTGJYbFcxN1FhYXQvZUFlOTAxRHk5VnNjT1ZUZE5k?=
 =?utf-8?B?YTFCcmYvWWhQRW1YUERhTndVVm9LTjhyeUNTZWlLRDlUZFF4dFVJSEE3bU8w?=
 =?utf-8?B?OGVyRE9JbkVpVWJGaHgwMlVMdUU2eEVGNWU3YzFhSFBMUmtjMDh6RUdpanlU?=
 =?utf-8?B?MzhzQVIrd0JHVDZrZTUwS1ZQa1J6dGJNcmNoeCs1bHMrK1ZJN2tFVjJoeXp2?=
 =?utf-8?B?dmNnMW0xVnFVRXpuWWtzRXhKR2tWZWxIVlBXV2t1SjdTWkNpRHlOTW91QWVT?=
 =?utf-8?B?OVpXSHY0Z0dtTzc0YnpLMGphMGh2eXVlaFRsRHFwVU8vaWxFY2hhVUt5aDZH?=
 =?utf-8?B?a3BJZGRQRHBlaDMzMDg1WE8zUTdaK1lQb0RxLzNTQU1veWs5Zk1zcXpuS05a?=
 =?utf-8?Q?C8LIilNNYzoAAJaO2jE5Au9BX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00f81806-fab3-4670-c510-08ddc08e8831
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 15:20:56.2026 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y4AMF5rfZ9I0jJmblESGGbHsvok5rniRynXsiTKLl1wGR0+4erW5bEBAzPBmO9kX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9627
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

On 11.07.25 15:37, Philipp Stanner wrote:
> On Fri, 2025-07-11 at 15:22 +0200, Christian König wrote:
>>
>>
>> On 08.07.25 15:25, Maíra Canal wrote:
>>> When the DRM scheduler times out, it's possible that the GPU isn't hung;
>>> instead, a job just took unusually long (longer than the timeout) but is
>>> still running, and there is, thus, no reason to reset the hardware. This
>>> can occur in two scenarios:
>>>
>>>   1. The job is taking longer than the timeout, but the driver determined
>>>      through a GPU-specific mechanism that the hardware is still making
>>>      progress. Hence, the driver would like the scheduler to skip the
>>>      timeout and treat the job as still pending from then onward. This
>>>      happens in v3d, Etnaviv, and Xe.
>>>   2. Timeout has fired before the free-job worker. Consequently, the
>>>      scheduler calls `sched->ops->timedout_job()` for a job that isn't
>>>      timed out.
>>>
>>> These two scenarios are problematic because the job was removed from the
>>> `sched->pending_list` before calling `sched->ops->timedout_job()`, which
>>> means that when the job finishes, it won't be freed by the scheduler
>>> though `sched->ops->free_job()` - leading to a memory leak.
>>
>> Yeah, that is unfortunately intentional.
>>
>>> To solve these problems, create a new `drm_gpu_sched_stat`, called
>>> DRM_GPU_SCHED_STAT_NO_HANG, which allows a driver to skip the reset. The
>>> new status will indicate that the job must be reinserted into
>>> `sched->pending_list`, and the hardware / driver will still complete that
>>> job.
>>
>> Well long story short we have already tried this and the whole approach doesn't work correctly in all cases. See the git history around how we used to destroy the jobs.
>>
>> The basic problem is that you can always race between timing out and Signaling/destroying the job. This is the long lasting job lifetime issue we already discussed more than once.
> 
> The scheduler destroys the job, through free_job().
> I think we have agreed that for now the scheduler is the party
> responsible for the job lifetime.

That's what I strongly disagree on. The job is just a state bag between the submission and scheduling state of a submission.

For the scheduler the control starts when it is pushed into the entity and ends when run_job is called.

The real representation of the submission is the scheduler fence and that object has a perfectly defined lifetime, state and error handling.

>>
>> If you want to fix this I think the correct approach is to completely drop tracking jobs in the scheduler at all.
> 
> I don't see how this series introduces a problem?
> 
> The fact is that drivers are abusing the API by just firing jobs back
> into the scheduler's job list. This series legalizes the abuse by
> providing scheduler functionality for that.
> 
> IOW, the series improves the situation but does not add a *new*
> problem. Even less so as driver's aren't forced to use the new status
> code, but can continue having job completion race with timeout
> handlers.

Maybe yes, but I'm really not sure about it.

Take a look at the git history or job destruction, we already had exactly that approach, removed it and said that leaking memory is at least better than an use after free issue.

>>
>> Instead we should track the HW fences (or maybe the scheduler fences which point to the HW fence) the scheduler waits for.
>>
>> This HW fence is then given as a parameter to the driver when we run into a timeout.
>>
>> This has the clear advantage that dma_fence objects have a well defined livetime and necessary state transition. E.g. you can check at all times if the fence is signaled or not.
> 
> I'd say that centralizing job handling in the scheduler is a
> prerequisite of what you suggest. You can't clean up anything while
> certain drivers (sometimes without even locking!) just willy-nilly re-
> add jobs to the pending_list.

The point is we should get completely rid of the pending list.

Then the whole question of removing or re-adding anything to the pending list doesn't appear in the first place.

The issue with that is that we need to change the timeout callback to take the fence and not the job. And that is a rather big change affecting all drivers using the scheduler.

Regards,
Christian. 

> 
> 
> P.
> 
>>
>> Regards,
>> Christian.
>>
>>>  
>>> Signed-off-by: Maíra Canal <mcanal@igalia.com>
>>> ---
>>>  drivers/gpu/drm/scheduler/sched_main.c | 46 ++++++++++++++++++++++++++++++++--
>>>  include/drm/gpu_scheduler.h            |  3 +++
>>>  2 files changed, 47 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>> index 0f32e2cb43d6af294408968a970990f9f5c47bee..657846d56dacd4f26fffc954fc3d025c1e6bfc9f 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -374,11 +374,16 @@ static void drm_sched_run_free_queue(struct drm_gpu_scheduler *sched)
>>>  {
>>>  	struct drm_sched_job *job;
>>>  
>>> -	spin_lock(&sched->job_list_lock);
>>>  	job = list_first_entry_or_null(&sched->pending_list,
>>>  				       struct drm_sched_job, list);
>>>  	if (job && dma_fence_is_signaled(&job->s_fence->finished))
>>>  		__drm_sched_run_free_queue(sched);
>>> +}
>>> +
>>> +static void drm_sched_run_free_queue_unlocked(struct drm_gpu_scheduler *sched)
>>> +{
>>> +	spin_lock(&sched->job_list_lock);
>>> +	drm_sched_run_free_queue(sched);
>>>  	spin_unlock(&sched->job_list_lock);
>>>  }
>>>  
>>> @@ -531,6 +536,32 @@ static void drm_sched_job_begin(struct drm_sched_job *s_job)
>>>  	spin_unlock(&sched->job_list_lock);
>>>  }
>>>  
>>> +/**
>>> + * drm_sched_job_reinsert_on_false_timeout - reinsert the job on a false timeout
>>> + * @sched: scheduler instance
>>> + * @job: job to be reinserted on the pending list
>>> + *
>>> + * In the case of a "false timeout" - when a timeout occurs but the GPU isn't
>>> + * hung and is making progress, the scheduler must reinsert the job back into
>>> + * @sched->pending_list. Otherwise, the job and its resources won't be freed
>>> + * through the &struct drm_sched_backend_ops.free_job callback.
>>> + *
>>> + * This function must be used in "false timeout" cases only.
>>> + */
>>> +static void drm_sched_job_reinsert_on_false_timeout(struct drm_gpu_scheduler *sched,
>>> +						    struct drm_sched_job *job)
>>> +{
>>> +	spin_lock(&sched->job_list_lock);
>>> +	list_add(&job->list, &sched->pending_list);
>>> +
>>> +	/* After reinserting the job, the scheduler enqueues the free-job work
>>> +	 * again if ready. Otherwise, a signaled job could be added to the
>>> +	 * pending list, but never freed.
>>> +	 */
>>> +	drm_sched_run_free_queue(sched);
>>> +	spin_unlock(&sched->job_list_lock);
>>> +}
>>> +
>>>  static void drm_sched_job_timedout(struct work_struct *work)
>>>  {
>>>  	struct drm_gpu_scheduler *sched;
>>> @@ -564,6 +595,9 @@ static void drm_sched_job_timedout(struct work_struct *work)
>>>  			job->sched->ops->free_job(job);
>>>  			sched->free_guilty = false;
>>>  		}
>>> +
>>> +		if (status == DRM_GPU_SCHED_STAT_NO_HANG)
>>> +			drm_sched_job_reinsert_on_false_timeout(sched, job);
>>>  	} else {
>>>  		spin_unlock(&sched->job_list_lock);
>>>  	}
>>> @@ -586,6 +620,10 @@ static void drm_sched_job_timedout(struct work_struct *work)
>>>   * This function is typically used for reset recovery (see the docu of
>>>   * drm_sched_backend_ops.timedout_job() for details). Do not call it for
>>>   * scheduler teardown, i.e., before calling drm_sched_fini().
>>> + *
>>> + * As it's only used for reset recovery, drivers must not call this function
>>> + * in their &struct drm_sched_backend_ops.timedout_job callback when they
>>> + * skip a reset using &enum drm_gpu_sched_stat.DRM_GPU_SCHED_STAT_NO_HANG.
>>>   */
>>>  void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
>>>  {
>>> @@ -671,6 +709,10 @@ EXPORT_SYMBOL(drm_sched_stop);
>>>   * drm_sched_backend_ops.timedout_job() for details). Do not call it for
>>>   * scheduler startup. The scheduler itself is fully operational after
>>>   * drm_sched_init() succeeded.
>>> + *
>>> + * As it's only used for reset recovery, drivers must not call this function
>>> + * in their &struct drm_sched_backend_ops.timedout_job callback when they
>>> + * skip a reset using &enum drm_gpu_sched_stat.DRM_GPU_SCHED_STAT_NO_HANG.
>>>   */
>>>  void drm_sched_start(struct drm_gpu_scheduler *sched, int errno)
>>>  {
>>> @@ -1192,7 +1234,7 @@ static void drm_sched_free_job_work(struct work_struct *w)
>>>  	if (job)
>>>  		sched->ops->free_job(job);
>>>  
>>> -	drm_sched_run_free_queue(sched);
>>> +	drm_sched_run_free_queue_unlocked(sched);
>>>  	drm_sched_run_job_queue(sched);
>>>  }
>>>  
>>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>>> index 83e5c00d8dd9a83ab20547a93d6fc572de97616e..257d21d8d1d2c4f035d6d4882e159de59b263c76 100644
>>> --- a/include/drm/gpu_scheduler.h
>>> +++ b/include/drm/gpu_scheduler.h
>>> @@ -393,11 +393,14 @@ struct drm_sched_job {
>>>   * @DRM_GPU_SCHED_STAT_NONE: Reserved. Do not use.
>>>   * @DRM_GPU_SCHED_STAT_RESET: The GPU hung and successfully reset.
>>>   * @DRM_GPU_SCHED_STAT_ENODEV: Error: Device is not available anymore.
>>> + * @DRM_GPU_SCHED_STAT_NO_HANG: Contrary to scheduler's assumption, the GPU
>>> + * did not hang and is still running.
>>>   */
>>>  enum drm_gpu_sched_stat {
>>>  	DRM_GPU_SCHED_STAT_NONE,
>>>  	DRM_GPU_SCHED_STAT_RESET,
>>>  	DRM_GPU_SCHED_STAT_ENODEV,
>>> +	DRM_GPU_SCHED_STAT_NO_HANG,
>>>  };
>>>  
>>>  /**
>>>
>>
> 


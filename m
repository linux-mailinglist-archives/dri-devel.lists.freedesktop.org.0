Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06475CCD665
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 20:33:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10D2610E340;
	Thu, 18 Dec 2025 19:33:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="qBT1QHS/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010056.outbound.protection.outlook.com
 [40.93.198.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9255910E182;
 Thu, 18 Dec 2025 19:33:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ud/oJhMbPqh/RYl4+wOQUpAd0Zh87cqCEsGQQOXdfUucshjbHVINTgHCfDWMvU+3S6WFpgSJjkoIYAK7eyD6Hqs1/OywrOF4Cj6cqoh0tcfgmeiI5gpY3PTz5Gi13U4hOuZONSM92BBrK5UON0veCxR9bdqenrRlC/kgOxXOXqYSOj+hJj/FxjJqDAmKx3ZTGXQd1jXVu+dTbA0JfwVhBtsqTrNGfvICVUsSKBNVH4QCsNbrIez2XxjSQ982/S4kMeLGMyaDKTL2p9gk9V8ITlifz/f81lh9dS9Uy1wFA4+VszqgW6ScqY5ymIY9ZMFqtPweH+Au6j2CW0ApeHOjRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hk6mGHkFuQagJomc8oO+CwLp7Ylvox470NkPl1bFXPc=;
 b=DH13YhkeH3QAAu3pIzjd4CQy/oiuIsWM/xNOyJONJcbl1BjyNtGdD7C9oyLLhjfKztInXjUgZWDA98/1UiprF1IOe7hC6IDtPgXv9cedH6/q5xpf0NqSL32gGo99iT/Vyo8K8VxBOq7by5NmFDwNeVudjjcYDvKOnF2OJSGKPuA80yXt8tSdl8d02RnCMbK0rCrCrMq6onQ3qQVGRiQc/i0QkJoaGGhzmj8x7+RHg4uGsEepILQArtthx8rs/PlQ+2LoIK78E4S/2RGz6meCVAqcCsoC6myE7Z5H56pfXXlXuHmafQOPIvYkwcTuGJcEzY8hV7/pcX54u0D8sMXLOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hk6mGHkFuQagJomc8oO+CwLp7Ylvox470NkPl1bFXPc=;
 b=qBT1QHS/15LhE3aXuAf7JBBW2Sr/kHI6nSqgyAV9GSKipm3bAAjFgxPDTVwBRHJdjOAie2mVMRkCF8XYQLUQjvnBPV+7o/Y5WgfVob2IAYOmUeWUD79XqlgWSqe9I3ZD7zU41YZ8oztXGYdNuKNPs2XAnbYSuOzNeEGBj3a0UEY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by DM4PR12MB7528.namprd12.prod.outlook.com (2603:10b6:8:110::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 19:33:05 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%6]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 19:33:05 +0000
Message-ID: <befebef3-0870-4c2d-a847-1fe1cc2acd7b@amd.com>
Date: Thu, 18 Dec 2025 12:33:03 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/atomic: convert
 drm_atomic_get_{old,new}_colorop_state() into proper functions
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Simon Ser <contact@emersion.fr>,
 Harry Wentland <harry.wentland@amd.com>, Daniel Stone
 <daniels@collabora.com>, Melissa Wen <mwen@igalia.com>,
 Sebastian Wick <sebastian.wick@redhat.com>
References: <20251218141527.405328-1-jani.nikula@intel.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20251218141527.405328-1-jani.nikula@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0126.namprd03.prod.outlook.com
 (2603:10b6:303:8c::11) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|DM4PR12MB7528:EE_
X-MS-Office365-Filtering-Correlation-Id: 81d55996-a0fa-4370-5171-08de3e6c440c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d0NRb3F6dUt3WHR5NSsrR0lodHpnaUdqNVd0TGk1MzQrOEQwL09sdUszTkxO?=
 =?utf-8?B?N1U0bWVOdFBjRDhhd1EyeDlCUnQrRnF4VkhDb2JsZjJzOWZQV1JDWjFMMEU2?=
 =?utf-8?B?c0ZLV09VcnJ5N3JyQnZrbWtJSHQvZ2JXbklCbU9LWGlkT1l4Wk5SWGdaS2Ro?=
 =?utf-8?B?d1RQY0o3SmVMQi9sYnlFVW1WVWxMbmo5a1NlLzVFeEd0OUVLNUgvaVo4OUxT?=
 =?utf-8?B?RkFCNDRBdFkyVUo5U2dJOGdOaW9oN0dBM0laUkR1ZXVMME1nTjA3QzJRUXhj?=
 =?utf-8?B?OGgyakJsM0RWejFDbWdzcEErNnhRa29UZlV6RWV3a0lUek1hV0VVQXpqbjRT?=
 =?utf-8?B?amNhR2NvVTdEUi90dkVmQ2haWGt0V25Ya3B2enhWSkR4MkZSRThheU9PMjNN?=
 =?utf-8?B?aVpsRHFMbm9TUTFUTDFjbWNBRStQM3VZZWpON1dJN3R2M2lQbTREUmhBcVg1?=
 =?utf-8?B?ZzVVQzdpUU5jaGNDQ0dSbTF2Z1dhNFpGZ2NlRkJ6ejJYNEJCUG5sc1lhWWdk?=
 =?utf-8?B?OW51UWExZDgwRm5mOG8yVHJVaUNIcTNUcVN2MWNwL0hpdWxoOG1BYXpjNmlk?=
 =?utf-8?B?U2FxUkVYbVptWGk4K1AvOGcybWhTQmtZZE8rVElyVDE3YllnMDNaNnI3RVoy?=
 =?utf-8?B?RTQrc2dYQklpd002SDdrUkNXVHFEZG94ZERxNGxQRE9paktpVXhESGgyTGla?=
 =?utf-8?B?L2NaUndTTUtqTUNha3M4WXprOE5VSmNpdzdhcUdLU2lBaFN1d1l5ZXl2d1Yw?=
 =?utf-8?B?UHNGUzF2Z3cvb3JzK1VyNm8vQllocmxHRUZkcXVTNFdZSTYrL2lZZkZaa0xL?=
 =?utf-8?B?bXBRY0VPN3dVWDZlR1cvSUdIZVZCbUsxRGVtcUdDcndJWU9sakRqN2VWNlRK?=
 =?utf-8?B?SVR0T0cvNittcmg1TVhyZmc1c1RrdmFtYmFnU3dDak56MkFvdWhtbzdzZ0Qw?=
 =?utf-8?B?K0M3YzlzNG1SS3pUL3ZpekZIOG5GOWs0dXZkdHFRZHhoSGlzTW5oZjNGaUEw?=
 =?utf-8?B?U0dvZWgvQUVIbS8wYm1LdUdsZk9jS2NDaEIrc2R0RzZxdmVRTVAzN2djWnlw?=
 =?utf-8?B?WE9aOTlXekZ1V2hIU0xHTVpDZ2YvRlBuZXlhRTh2S2lIOGRySEJ6SCtoK2Zp?=
 =?utf-8?B?V3VBSXJJOHZORmQ2eDdjdDBBcEVobi9MMHBBWVlzUUd1Smx6K0ZSR3h3anhH?=
 =?utf-8?B?WXhDT2JwcWgySElnV1FnNU1UWmJjVXpZYUQwSW1lREhYUUM0UndHeXRScnVu?=
 =?utf-8?B?UDdaSzh1NXlmVHo5cjlRM1puUjk4ejgrY0F6S0h1dy83OEhFdDUyN29KOHBB?=
 =?utf-8?B?WjlGV21zazlyalZUNE9XS01nT2tEOVgzYm01bm9PMElBVWxUb1NjcUhML1Rh?=
 =?utf-8?B?N3c0VkR4cHZPY2trc2hEeTVmdEJscjRwSU56dElCNVlueGFoQXNkYWYxeENn?=
 =?utf-8?B?VW03NXVkVE9FeGdwZWYvY2RUcUtJa0NiZG1qUVFsUnE0Zys1bWNwMG5oSGZn?=
 =?utf-8?B?UXNPYThBa0FJWHpXUU5tREdyeDdpSEdjbjFlRHphSkh4TU1pSEVkblZtd0pU?=
 =?utf-8?B?ZEV6MG8rN3FQREszc25QNCtPQzFZa3VDUVdvdkJpT1BtYWg2Tm44Q0VWYy9I?=
 =?utf-8?B?R2Y2LzZRQndxYjdhU2I4RVZPQ2xoVXRoeDAyT3ZNWmZzMkZMTlJ6NHBkcHI4?=
 =?utf-8?B?TVFBZXZTQXVVRHJYNStWK0pIY2lhVjA1cFo0cWJxZzZ0K1BjOVN6eHArMjhB?=
 =?utf-8?B?ek9taUd0SjhzWU95bHAvYzJHb3NhNHp2dzFtM3VteDlmU1hTQnVmZFJmb0sy?=
 =?utf-8?B?blN1OXRobVNRcENYMkdmZC9PWWZMR0FWOUc1K0ZaZ3lqaVFuQk5uaUdXdDEy?=
 =?utf-8?B?SGdneDYwTVVVbk85MjRFMUlSR2gvczJJNXp1OGxYN1BMQlVHMHJiYTl1dG1v?=
 =?utf-8?Q?pvMhHWDsKrNzl84CESlm0On30hGNhjB/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qk41ODg3MVpiYkVubkN6YU1WOHBNbXgzTFBzbEJmZWZWZmtGMzlKZ3ArQ215?=
 =?utf-8?B?cDZnNjBTTkd3TFViblEyd1NGbzhlSlJEV1BHTzh0TlVwZmR4Tk5kRTBDV2pu?=
 =?utf-8?B?QlJZWU5aVEJQWFBKNVIyMjZvN2ZRbVZOekNtazYyVVBIa0l1WWVCbGh5SzZ6?=
 =?utf-8?B?TVBqVUxNWWxFN1p5Z0tMUzBETEZpeFpqdWJFVTNNamI2VFo4aWY1QjhqRS9Y?=
 =?utf-8?B?OFBCM0gzc2ZYSFVGejlLcm1jYXBjL3QyY3gyQmRwN1FPWGZ3ZGRGWURmemVR?=
 =?utf-8?B?cUR6UGQwL0JtTC91ckkwSXl5MDhuQUUzVHpudWVPdytoVHg2djhtZ3VraWlD?=
 =?utf-8?B?aDMybUZzYkFnRzlKRXZDdnlPVnF6VXZUUzdVNWpqbkEvYmFpUXJ4aHZtUDlT?=
 =?utf-8?B?U1IzTWdWQlVEU1ZRV3N0K2lsVmJWS29ycFBPUXpzYkdOQjF6Qk5uNFFzZWp6?=
 =?utf-8?B?Zm05eTl3ZGVKWGdqcWVaaUt2bzZaK2tuWjA5THZvVzJvUVJqSkRPbmtnUmxv?=
 =?utf-8?B?K2lXSHFUb2NXVVdQamo3ZXp0THVIVTZXeEJjM043RXU3QjNVN1JMc043c3Vt?=
 =?utf-8?B?dGtiblNhZ0xwUFllcjYwUnBTd1FBNzl2b2hwMHJTYjdHb0FSRXE2cTJCZGVS?=
 =?utf-8?B?eEkwSHBFb1VkbkdTcEtxS2FUT1R1WDFaSXN2SEhMTGdSU2V2QUxzMmtpNUl2?=
 =?utf-8?B?eG8xTTdPWGMvWnUzaG1hTGIyWDZLSmFoZDZTRHZkUWdlbnVLaVJIa3h2WWRw?=
 =?utf-8?B?S20wWGNkRm5yUkQzYTI3OHFnTnlaNklTc1BPWFFhd3Y5QVF3RVIrVEF5QXBV?=
 =?utf-8?B?KzAzUjVxYVpCZ3Q3U0gwbklhU2pJblpMcnVZUnpXRjFYKzE5ZG5kb2xydUhk?=
 =?utf-8?B?cmxqUE1zazd4aVI1elVsY2p3MVY0ajdkSUgrcmZpRlptdDNrZUVoL1I2R0lE?=
 =?utf-8?B?eG83Z1dXVmZoblh0SHVaK21iWWRUOUlGY292U1dtU2V0QlFuaGZDdVVYUkF6?=
 =?utf-8?B?aHlPTHBjaldUeWtIVlZ5RXlFaTJpV0srcXpqZG9yWVpxcVdLTUd6ZjE3eFdE?=
 =?utf-8?B?bUlnWTBobTRTUlhvK0NnazhHTjFQdHREU092eEJURnNwZWl4WVdTajAyaG1B?=
 =?utf-8?B?ejZwVjhtK0ZwVXgxYVhuNGRTTDFmY1VGZ3hqT3ZoZzMxWFZzUnRKUGxpVlls?=
 =?utf-8?B?Q1ZNM3RMcERwT20yc3dTWmxUOWEvdkF2a20yKzVNSDlTbkIxWlFBTkQzcXJz?=
 =?utf-8?B?L2c2TmV1MjZTelplVWhsUDhBREdHVy9JWTNQaG1rMExWVnBJaE5waGR4NVBw?=
 =?utf-8?B?czdjQmM3RjhMdzZGNjd2NXdGeTJaQ0tKdUxFTFBNY1F5YVpBTGczNHVRQmcz?=
 =?utf-8?B?bktac1ZzMHp6dWpFTjRWdjZrWEpFQlJmR01GQ0JKRm1RWkNGSWtUdTY0RXNs?=
 =?utf-8?B?d3FnMDNJSGM0TktDS3NBamh4aUo0TTFSU2Z3aVQzWlo5MTdqUnkzL0VsTmRh?=
 =?utf-8?B?Y043bitQSVR6M0l2bVpZVW8wNWw1cGtqeThvVEZnZThqZitIYTRWU1hCZjgx?=
 =?utf-8?B?Y1Y5VDVxZGUzN0JiWXVTUW1FcUloQmxKN0pIUlhqWEVIRXNRSEFwOStlRDhL?=
 =?utf-8?B?d21CVUVCZDlFYlV6aFpCcEp3cHpwNnJKMCtURkdUaGlMNU90VlgzSmhPdm10?=
 =?utf-8?B?S3JzQUVzRzBqNGlOdU1NRS9MMVRHRjJyUlpUTlYzSitkN0Z4aWhJanJuTFZ1?=
 =?utf-8?B?c1VGQlFiNityUEtsTGl1cjlENDM1MEhNeFEvQk03cUt5T2hkYU9oQ0ZkMHVh?=
 =?utf-8?B?ckcvMW9aTjlXdGljSjMrcEp5akpLVjBxd29WUm8rdkJUNFRtd3B2K0FXL0sx?=
 =?utf-8?B?aE1jcGc4d2syQlBUK01OR3pKcmhUT1NJWk02a2V4VVF4azFtcy93VGRJQ0xZ?=
 =?utf-8?B?K0pyT2R6QWdzZU9FT2pDMnZnUzBneGpjWFc0MVkzVVpTMTNLSlNJc0hNUmUv?=
 =?utf-8?B?UlkrSGRpc1pKMSt4aVlOQXlsemt4cW9iTkRmV0QzZHhxS0EvUXp6YmJpNE1D?=
 =?utf-8?B?Nm9ldU45UWxTYUdBWHR1cHA0QTJhQ2RBNzhjTmRKWGN3U3RLYlcrbjQ5K1hG?=
 =?utf-8?Q?vcUK+Xhkxkn1+uy4BJ+V6OAra?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81d55996-a0fa-4370-5171-08de3e6c440c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 19:33:05.4106 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cw2OluVxxLL//gchJRFHj/Zb08X9pFRej9FxVXZfSwOMnohFHSaIhOTWEY/bNqB8GYu227NfjF3tgNG0E5fetA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7528
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

Hi Jani,

Some compilation errors with this patch:

drivers/gpu/drm/vkms/vkms_drv.c: In function ‘vkms_destroy’:
drivers/gpu/drm/vkms/vkms_drv.c:261:9: error: implicit declaration of 
function ‘drm_colorop_pipeline_destroy’ 
[-Werror=implicit-function-declaration]
   261 |         drm_colorop_pipeline_destroy(&config->dev->drm);
       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors
make[9]: *** [scripts/Makefile.build:287: 
drivers/gpu/drm/vkms/vkms_drv.o] Error 1
make[9]: *** Waiting for unfinished jobs....
drivers/gpu/drm/vkms/vkms_composer.c: In function ‘apply_colorop’:
drivers/gpu/drm/vkms/vkms_composer.c:164:58: error: invalid use of 
undefined type ‘struct drm_colorop’
   164 |         struct drm_colorop_state *colorop_state = colorop->state;
       |                                                          ^~
drivers/gpu/drm/vkms/vkms_composer.c:165:41: error: invalid use of 
undefined type ‘struct drm_colorop’
   165 |         struct drm_device *dev = colorop->dev;
       |                                         ^~
drivers/gpu/drm/vkms/vkms_composer.c:167:20: error: invalid use of 
undefined type ‘struct drm_colorop’
   167 |         if (colorop->type == DRM_COLOROP_1D_CURVE) {
       |                    ^~
drivers/gpu/drm/vkms/vkms_composer.c:168:38: error: invalid use of 
undefined type ‘struct drm_colorop_state’
   168 |                 switch (colorop_state->curve_1d_type) {
       |                                      ^~
drivers/gpu/drm/vkms/vkms_composer.c:169:22: error: 
‘DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF’ undeclared (first use in this function)
   169 |                 case DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF:
       |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/vkms/vkms_composer.c:169:22: note: each undeclared 
identifier is reported only once for each function it appears in
drivers/gpu/drm/vkms/vkms_composer.c:174:22: error: 
‘DRM_COLOROP_1D_CURVE_SRGB_EOTF’ undeclared (first use in this 
function); did you mean ‘DRM_COLOROP_1D_CURVE’?
   174 |                 case DRM_COLOROP_1D_CURVE_SRGB_EOTF:
...


Including the drm_colorop.h in vkms_composer.c and vkms_drv.c fixes them:

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c 
b/drivers/gpu/drm/vkms/vkms_composer.c
index 3cf3f26e0d8e..cd85de4ffd03 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -5,6 +5,7 @@
  #include <drm/drm_atomic.h>
  #include <drm/drm_atomic_helper.h>
  #include <drm/drm_blend.h>
+#include <drm/drm_colorop.h>
  #include <drm/drm_fourcc.h>
  #include <drm/drm_fixed.h>
  #include <drm/drm_gem_framebuffer_helper.h>
diff --git a/drivers/gpu/drm/vkms/vkms_drv.c 
b/drivers/gpu/drm/vkms/vkms_drv.c
index dd1402f43773..434c295f44ba 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -17,6 +17,7 @@
  #include <drm/drm_gem.h>
  #include <drm/drm_atomic.h>
  #include <drm/drm_atomic_helper.h>
+#include <drm/drm_colorop.h>
  #include <drm/drm_drv.h>
  #include <drm/drm_fbdev_shmem.h>
  #include <drm/drm_file.h>


Alex

On 12/18/25 07:15, Jani Nikula wrote:
> There is no real reason to include drm_colorop.h from drm_atomic.h, as
> drm_atomic_get_{old,new}_colorop_state() have no real reason to be
> static inline.
> 
> Convert the static inlines to proper functions, and drop the include to
> reduce the include dependencies and improve data hiding.
> 
> Fixes: cfc27680ee20 ("drm/colorop: Introduce new drm_colorop mode object")
> Cc: Simon Ser <contact@emersion.fr>
> Cc: Alex Hung <alex.hung@amd.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Daniel Stone <daniels@collabora.com>
> Cc: Melissa Wen <mwen@igalia.com>
> Cc: Sebastian Wick <sebastian.wick@redhat.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> 
> ---
> 
> Including the massive Cc list because I don't want to keep doing this
> afterwards. This stuff needs to be blocked and fixed during review. Just
> stop including headers from headers. It's a PITA to clean up.
> ---
>   .../amd/display/amdgpu_dm/amdgpu_dm_color.c   |  3 ++
>   drivers/gpu/drm/drm_atomic.c                  | 32 +++++++++++++++
>   drivers/gpu/drm/drm_atomic_helper.c           |  1 +
>   .../drm/i915/display/intel_display_types.h    |  1 +
>   include/drm/drm_atomic.h                      | 39 ++++---------------
>   5 files changed, 45 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> index 1dcc79b35225..20a76d81d532 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> @@ -23,6 +23,9 @@
>    * Authors: AMD
>    *
>    */
> +
> +#include <drm/drm_colorop.h>
> +
>   #include "amdgpu.h"
>   #include "amdgpu_mode.h"
>   #include "amdgpu_dm.h"
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index 6d3ea8056b60..52738b80ddbe 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -641,6 +641,38 @@ drm_atomic_get_colorop_state(struct drm_atomic_state *state,
>   }
>   EXPORT_SYMBOL(drm_atomic_get_colorop_state);
>   
> +/**
> + * drm_atomic_get_old_colorop_state - get colorop state, if it exists
> + * @state: global atomic state object
> + * @colorop: colorop to grab
> + *
> + * This function returns the old colorop state for the given colorop, or
> + * NULL if the colorop is not part of the global atomic state.
> + */
> +struct drm_colorop_state *
> +drm_atomic_get_old_colorop_state(struct drm_atomic_state *state,
> +				 struct drm_colorop *colorop)
> +{
> +	return state->colorops[drm_colorop_index(colorop)].old_state;
> +}
> +EXPORT_SYMBOL(drm_atomic_get_old_colorop_state);
> +
> +/**
> + * drm_atomic_get_new_colorop_state - get colorop state, if it exists
> + * @state: global atomic state object
> + * @colorop: colorop to grab
> + *
> + * This function returns the new colorop state for the given colorop, or
> + * NULL if the colorop is not part of the global atomic state.
> + */
> +struct drm_colorop_state *
> +drm_atomic_get_new_colorop_state(struct drm_atomic_state *state,
> +				 struct drm_colorop *colorop)
> +{
> +	return state->colorops[drm_colorop_index(colorop)].new_state;
> +}
> +EXPORT_SYMBOL(drm_atomic_get_new_colorop_state);
> +
>   static bool
>   plane_switching_crtc(const struct drm_plane_state *old_plane_state,
>   		     const struct drm_plane_state *new_plane_state)
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index 10adac9397cf..5840e9cc6f66 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -34,6 +34,7 @@
>   #include <drm/drm_atomic_uapi.h>
>   #include <drm/drm_blend.h>
>   #include <drm/drm_bridge.h>
> +#include <drm/drm_colorop.h>
>   #include <drm/drm_damage_helper.h>
>   #include <drm/drm_device.h>
>   #include <drm/drm_drv.h>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> index 6ff53cd58052..eb2e3f1e83c9 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -34,6 +34,7 @@
>   #include <drm/display/drm_dp_tunnel.h>
>   #include <drm/display/drm_dsc.h>
>   #include <drm/drm_atomic.h>
> +#include <drm/drm_colorop.h>
>   #include <drm/drm_crtc.h>
>   #include <drm/drm_encoder.h>
>   #include <drm/drm_framebuffer.h>
> diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
> index 74ce26fa8838..178f8f62c80f 100644
> --- a/include/drm/drm_atomic.h
> +++ b/include/drm/drm_atomic.h
> @@ -30,7 +30,6 @@
>   
>   #include <drm/drm_crtc.h>
>   #include <drm/drm_util.h>
> -#include <drm/drm_colorop.h>
>   
>   /**
>    * struct drm_crtc_commit - track modeset commits on a CRTC
> @@ -712,6 +711,14 @@ drm_atomic_get_plane_state(struct drm_atomic_state *state,
>   struct drm_colorop_state *
>   drm_atomic_get_colorop_state(struct drm_atomic_state *state,
>   			     struct drm_colorop *colorop);
> +
> +struct drm_colorop_state *
> +drm_atomic_get_old_colorop_state(struct drm_atomic_state *state,
> +				 struct drm_colorop *colorop);
> +struct drm_colorop_state *
> +drm_atomic_get_new_colorop_state(struct drm_atomic_state *state,
> +				 struct drm_colorop *colorop);
> +
>   struct drm_connector_state * __must_check
>   drm_atomic_get_connector_state(struct drm_atomic_state *state,
>   			       struct drm_connector *connector);
> @@ -808,36 +815,6 @@ drm_atomic_get_new_plane_state(const struct drm_atomic_state *state,
>   	return state->planes[drm_plane_index(plane)].new_state;
>   }
>   
> -/**
> - * drm_atomic_get_old_colorop_state - get colorop state, if it exists
> - * @state: global atomic state object
> - * @colorop: colorop to grab
> - *
> - * This function returns the old colorop state for the given colorop, or
> - * NULL if the colorop is not part of the global atomic state.
> - */
> -static inline struct drm_colorop_state *
> -drm_atomic_get_old_colorop_state(struct drm_atomic_state *state,
> -				 struct drm_colorop *colorop)
> -{
> -	return state->colorops[drm_colorop_index(colorop)].old_state;
> -}
> -
> -/**
> - * drm_atomic_get_new_colorop_state - get colorop state, if it exists
> - * @state: global atomic state object
> - * @colorop: colorop to grab
> - *
> - * This function returns the new colorop state for the given colorop, or
> - * NULL if the colorop is not part of the global atomic state.
> - */
> -static inline struct drm_colorop_state *
> -drm_atomic_get_new_colorop_state(struct drm_atomic_state *state,
> -				 struct drm_colorop *colorop)
> -{
> -	return state->colorops[drm_colorop_index(colorop)].new_state;
> -}
> -
>   /**
>    * drm_atomic_get_old_connector_state - get connector state, if it exists
>    * @state: global atomic state object


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DE4AEF0A8
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 10:16:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B070210E13D;
	Tue,  1 Jul 2025 08:16:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vi6kfs4n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2064.outbound.protection.outlook.com [40.107.236.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7C3110E13D
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jul 2025 08:16:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wy6TlzYIxZgBhsX/bfOIf1G9n5DNn0MdKafCv5/Mwt6DR2YxXLVwOjSFvxmxqOsCppmEkDytQ2SunNXE1xhB6Zl9IakUNhVD19TtLNQxysJNEWapm/+YWXed/JyndisZTuCxtMHvviolqXKfB+Om6xd2H5MOkxAQbwZ7rPKETV8FQEjubErezFE7tdFO97MHaMWYP4WKInYBCVBEPMMK56c0c76yLssOd2v/z+lwPdNrR7tMGyB7GLxkfVhVWt+B826+O1a4adOSA71IlIm5jJn9unuB9T9psdStX5fzhLxrnaZKkNNJQNBNHTni+NzwsugMGif741Z7mp05ahGjOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ySZ0nEIBLldTSGrMe/lB5vgKAA02730agk2H0nC8amU=;
 b=flHDh/ZNK23QOXO43R81FfLBLYPRIGzC+7dJMs0p/9hK4OoRP7dA38KkctksMN2yaCN6rJ4M3ZLhZ4HpVRB6U5Syewiy7j2IJfNJwm+dmuOWvSg7pWoqy4D9NNZH2yoKeD9czgs5VL50Kb8vdbPYN+qSQrZfTQeYFJh1MRLeke6wKWy5+ZKB0uvzWJETZ3tPf1JQF7/VYUYPtRnaxqGowk5ADztWUJ2/PXpQi0EKDA1A12ODdETMo9zOzem9ohGw9Pg/x/FID+Da/dWzlPEaB+UvnUtwsMwr2ZAnvw25CkEdgc/26DE1ppBHicY6bt9pV4B4PaXdICVYn+wpYTvfAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ySZ0nEIBLldTSGrMe/lB5vgKAA02730agk2H0nC8amU=;
 b=vi6kfs4ny6BaHzeXeCXDrxIoPqvZV4+lkA/lNbPJmYWRrr5E2auNfo6GYF0TD9NlGuPgGorO55VzsyxDyJH+UVZvcgs0ZD0lKauNGi0LQQAo4mZjuMYHDlK2h/yXUl1WtCd3rgfTzXPPWP4qBxsf+JfHGaAVlSFcpmhMQjTQl44=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA1PR12MB9468.namprd12.prod.outlook.com (2603:10b6:208:596::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.19; Tue, 1 Jul
 2025 08:16:07 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8880.027; Tue, 1 Jul 2025
 08:16:07 +0000
Message-ID: <26c79b1e-0f7f-4efa-9040-92df8c5bdf1f@amd.com>
Date: Tue, 1 Jul 2025 10:15:59 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/17] ttm: add objcg pointer to bo and tt
To: David Airlie <airlied@redhat.com>
Cc: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Johannes Weiner <hannes@cmpxchg.org>,
 Dave Chinner <david@fromorbit.com>, Kairui Song <kasong@tencent.com>
References: <20250630045005.1337339-1-airlied@gmail.com>
 <20250630045005.1337339-13-airlied@gmail.com>
 <20a90668-3ddf-4153-9953-a2df9179a1b1@amd.com>
 <CAMwc25ok0Q93+EeyyoR-S0Ffvi-GswDiUGA8rPBwZ+C+5Y8HVA@mail.gmail.com>
 <cf6cb95f-df79-40ae-95d5-dc5a7620a136@amd.com>
 <CAMwc25q-kBRGDrphU+iAyqENZhgdRtEnSrR9z6b5bQ_JFzzK2g@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAMwc25q-kBRGDrphU+iAyqENZhgdRtEnSrR9z6b5bQ_JFzzK2g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1P221CA0009.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::24) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA1PR12MB9468:EE_
X-MS-Office365-Filtering-Correlation-Id: e4a11e75-8afc-4883-28fe-08ddb8778771
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UVdSU0VZeDgrWlAzUDBueVgvUExDaU1CcVp2d1l2YW53L1hDZWIxZG5yZ25k?=
 =?utf-8?B?SFBuY2psajdOYktyUlBvVXhrcloxei9MMTNmK0VqU05UV0EzeVJpRkdSSlJM?=
 =?utf-8?B?QU9iMFlhY2Y4aEpLRExQSnY0Y3R3KzFrUWlLUE16VHpZd0hUTnArbTBGaGZn?=
 =?utf-8?B?Tmw2OFdTOVlCWmdOQ0xzOU9BOEpYNnJqdWkxUHZOYk5IZzFocS9rYmFIRGpv?=
 =?utf-8?B?aTBRWFlialE2U05sdkVXMmNTMGVKYnFPUzFSL25EZ1l3dHNwcEl4MnNyeVdh?=
 =?utf-8?B?NktwTFo4WTlQSTJCQUxyOFhwZTdxZEFHM2ZkNGFScUNtYTBJbzFRbEtyMHh4?=
 =?utf-8?B?Q2hpWUtQOWkwQ1Q5czMwOFFZajYxTnFBYmZoYjFzWk1RaUZOM0JaZ210NWI1?=
 =?utf-8?B?VXBxdVB5bFNHS0N2SHl6emtKNkxvdElJeE9rYnRhSkxUeDRYa1VQRjY4anpS?=
 =?utf-8?B?ZFkzUzlhUGJoaU9tS3FPZlRQTXhSa25pWUs0Nm9NYTkyRnBKV1VmNE9jUk1X?=
 =?utf-8?B?WG1lditqdGR4dHkyU1lDWDU4M3hHbmhNWThZcHh2WHVxU1F6Uml5UGUwdk1u?=
 =?utf-8?B?WXRxcTIwaE5VQVBQMnAwOEZxOUxqOG1KY0lmRkFmazVuenVJSjdhclF6dkJ4?=
 =?utf-8?B?VXZCeDVwVGRMcU1Gd3JBTjhSNHBmdERONXc1cCtaY2g3NTdWUWVMVUdXSUxV?=
 =?utf-8?B?aHN1NGgwWnlRQmF1bTZ0V2l6S0VYOEVVbzhsNTBjOEdqeWJHWVBudWRaTnpm?=
 =?utf-8?B?bGgrTkt6OG80aFJVNGJGaEx4cHB0UzZsa2Z3djQxYS9jR0Y3dXpJa3d6OHF5?=
 =?utf-8?B?ZXVHaS9EbXR0Z1FXRTgrL0pRc2IwMFY1VGc4NW1VSDlWQkdsSWc5MG00eU9Q?=
 =?utf-8?B?QXlkUVBBc3ZmVWtEL3EyZHZRTjFldXBVazRxazRlVmZOa3RMb1N1Rko2K1g4?=
 =?utf-8?B?Mnp0aVVyWTMreSt3SUdRM0NtMkxIendwM3dEckxRVHpPV1VOV29GVjVqb0Jl?=
 =?utf-8?B?SkMyQjlqZ0dLU3FJRnRPbXZBQ09wc2hpSFdtRStuTXpENHdrWFdKT0ljWWZR?=
 =?utf-8?B?Si83bzEzRmpRdFpZcFNtenVPcHZOOTFDKzBrM1NzSnlkTXE1ZmlaWGtuV3Mr?=
 =?utf-8?B?TDhHMU5MamxtbUVVQjZtUUd2U1Bib2xPS3JhbmpkcVM0dWZLZURNNEtGS1VT?=
 =?utf-8?B?ZDJkbzhHSFU3bTBSWU9VOStneGVMcGxWN0M3ajA0ZDdrNkNqS3VRQVVxMTJj?=
 =?utf-8?B?ZzA4UU9kdFE5WHJFNGpHYmtiajlvaUNTUC9oZGFhNVV2UUxWZllteUFGZ2k5?=
 =?utf-8?B?N1Y3WFlkZmcwRnVXWGk4ZS9xb3lzNi9lUkhLZGdqZmlzZ3VGTDc3czJQWENx?=
 =?utf-8?B?UlFUMkFFVjJ3Uk9lRFpDbDJnNDhiS3Azd0xkREsrdUUzSmppeDdoUHhPZURM?=
 =?utf-8?B?Qnc5Y1R3dGNGNGV5N2RGNzVzQXJpOHZvOGNvVkhXenRLOXlONmw3WkMwYUVW?=
 =?utf-8?B?L2o2dHZxd2tuS3h1UHBFQnhXUFlYNFB1WnpQWnBreUY4OHJrR0JHL1lpM1ll?=
 =?utf-8?B?YnF6b0FZZVY5Nm8wT1FpOXQyb0NleVJYR2luZ3V0VVpSa21JbGY1YkNnK013?=
 =?utf-8?B?SzA3UTlBeVNHVElSN1RVK0plMzVGYklySUtkdmpjM1dtZlBPWko3aW1wYk5i?=
 =?utf-8?B?NHdwTkRCMWk5V3p6N1g1V3B4dXJ4WnVYUyt6VVlHVDFVL1BJcTRWbWFhRVdZ?=
 =?utf-8?B?L2lvNHlJajRmOHZDSXRqL3pmd1F6Q1AyOFlkUFFwbUl5ejM4UHhQWitXak5D?=
 =?utf-8?B?djVSbWV6eDQ4dWJpcEVjVWdtaWZBdzNxNjI3TS9RSU0rWE45RFk2cjFac3JG?=
 =?utf-8?B?b055aFJaYStrS2thYndJK3JIUC9oaW43QTRQSjVGS1VHRnRtUG5nZkkyZWFt?=
 =?utf-8?Q?KFS/DwlzSz0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UDZYNXM5TWZDYmZaZjdRN2ViS0ErVFNzRkdWRVpKSmdoTmNDMnZ2WXVzNGsx?=
 =?utf-8?B?OTFYSk9BMFJQWjduNWxSdlJpNzBKUzA3dS9EeldWWDBTUUtrRVFXVS8vSkpj?=
 =?utf-8?B?Z3psV2RpZTh2cmVMODVqUjFPNEZEbFVrYitDanYzbFkwSW5DRCtIemhMRmlP?=
 =?utf-8?B?UGpjWk5tM2dHSnA3TDVDb2g2TDIxVS9EaFNFc0xPTXBOeDFJUDgraWtEYTNs?=
 =?utf-8?B?NFROcStOOUJpd0N3NkloajdDUTdMQzVDbEVMNzBTTnVGUlRncWNONEFWOTVI?=
 =?utf-8?B?WjBNaWNhbUhVKzFlRGxrdjI0bjhuVTlQaGR3enRzeXg2ajllaytqQmV1dXhB?=
 =?utf-8?B?NUxpbUg2bEYvMmhGRFN5SFkrWVdaajJONDhZOEFEMGNRdUVwbndpSFpveDJi?=
 =?utf-8?B?VzNwREkwSytRVkZvK0pNZXdVTFE2alhMb0YvVXNUcGwySmg4YmYrNHI0NWh1?=
 =?utf-8?B?TTVuQ0hITnNzU25WekxHT3cyNE1pYVhjcVNBZEFzbkNlenY4a3pSb0l5M3c4?=
 =?utf-8?B?NEgvTkdVS0ZGL0dqbWxvZHRnd0taY3NLeHlmRVZXb1ptL0lpclJMOUliZnNs?=
 =?utf-8?B?ekExQXhHU1NCRkdGMHhGb0o1aGluaUZyZTlnd3ZrcG1PSlNCTE4ycFJJNjNE?=
 =?utf-8?B?bDEvaDN4aE9IUEFFOGZOZncrRUpvZ3ZQRnV1UWVTZG4rT0ZnR2F3bHYxZ0pI?=
 =?utf-8?B?RHZIaWdKV3VKdTg4ODNQNmVGdDJ1RHdaam42endVa0dBMVh6SHBKa0YyaUla?=
 =?utf-8?B?UU1EN3BKUHBTcFZUYi9zbVNlcDlJSUZpV2ovcmRvb1V0U0R6WndZVVA4c0Fa?=
 =?utf-8?B?eUxEbnBjL0ZQWHR3Nm9pUVQ0aGRjeGFvTGRwNDhNM1lqSmRGeVBXVEFCM0Zt?=
 =?utf-8?B?UkRFdEVlajlhRDN1N1QrYk9jQ0dySVhRTlRTZ09aTzBnOUFFZStCWjkxZGh3?=
 =?utf-8?B?V2hVQWFFQW5HLzgvdEgwNGU3eUZaT0djNnNUNzk2Ykp3SUdLVjVQMXUycmdJ?=
 =?utf-8?B?SUlpd01rTThsNndkdmxrTHNiTmdyNTNMZUxhRzRDMVczVUtJVHV6Zk9IdHVq?=
 =?utf-8?B?anl6OGYrRGZ6K0hzbWZqUm9SMlBQNzJ1UUEwSXlEYk5PdjNKSGE3ZUNRcndu?=
 =?utf-8?B?VFBvMGszS0lrRFlLdXlaYVhBUHpWMzdkcGd5SlU5dS9CeHFaaUovUlZSZ0to?=
 =?utf-8?B?V1NmWW1PVDJCaDQ3ZVQwR1RVN0MweFN3L01nKzFEemFPOWFZcExTZnp0Ymx1?=
 =?utf-8?B?aE1lQVpYWndwSVl2V29kRFNzRXpHUjBSb0x2dTNoWlhEdW12TE1wLzFmdWFn?=
 =?utf-8?B?c2Jhb2N1M0hzTVIxV2tIS1U3dnVlK0R6NmcveVM2ZmFSZzNVTjVVcVUycFlR?=
 =?utf-8?B?TDkxR0Jnd01zcmE4VkI0dkRZNlc0TFhDM3MzOFlQV1hTM1NuZkpEclE1MjUz?=
 =?utf-8?B?b211WCsvR3RrSUZadkltSjMwSkFQMVl3VUxleDI4S0JEdHcvN29LRWlJdTc0?=
 =?utf-8?B?Z2NzTnpuWHgvcldyV0l1ZkVuUlp3MTE5WXhBKzM2ejFSU2ZxWmRlZGpEengx?=
 =?utf-8?B?Smo2c0NKTHpUYmFJRk1VbmRDMnJxQWFZdkQ3akhXaWNLb05xY2JSOEJidjlx?=
 =?utf-8?B?TEYzRTdKL0xqWjR4MzVMSXNRK0FEUkhxMitRTnBWT2d2OS9aVlR6SFRoQ0Jp?=
 =?utf-8?B?SENNc1UxMFU2bkRCYUhjbjl2MUdFV2dTWURhRkdrWFpuWk91akZDUFN5ZVdB?=
 =?utf-8?B?Y1VZK0FnWGI3RUZOY1R6U0Z2UXhYb0U2eERkSGJ5c3dYWVVtam1kT0NXQVl2?=
 =?utf-8?B?WmRPNUhIR1ZUVEJpMmdrT3F4MnUzWm1uOUNEUUVyM1V3MlJtYnNUbCt6cWVq?=
 =?utf-8?B?bGRhV1I5anRaMHhVMG8vZUtXOTlOYi83UFhMbXpQS1VvU3RqR245UjlLYmQw?=
 =?utf-8?B?SDgyRStuWGswb3Q3cGYrN3lHRjJKRnhCQmw3ZDhsOGVqVFJRbklSU3JaR1Rr?=
 =?utf-8?B?TS8xaXYrak8waGozTDB0eEtaNXJSQm9RN0VaeFgwUmQ2ZUlWN3NLNUFEdkVz?=
 =?utf-8?B?TVpoa2lFZHlQajhsaWtqRFB6YnNvRXlXdlVPTDRJK2JhaktacktxWm9OcW91?=
 =?utf-8?Q?g2soF3O8t2LuL7ycgXn1fqRDv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4a11e75-8afc-4883-28fe-08ddb8778771
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 08:16:07.1424 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fA8KvjXUWPiy+OU1SUpEgFxiw1TeBn77ys58kJTnp2gLNQZ76TG8K1ezKzN+vNR+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9468
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

On 01.07.25 10:06, David Airlie wrote:
> On Tue, Jul 1, 2025 at 5:22 PM Christian König <christian.koenig@amd.com> wrote:
>>>>> diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
>>>>> index 15d4019685f6..c13fea4c2915 100644
>>>>> --- a/include/drm/ttm/ttm_tt.h
>>>>> +++ b/include/drm/ttm/ttm_tt.h
>>>>> @@ -126,6 +126,8 @@ struct ttm_tt {
>>>>>       enum ttm_caching caching;
>>>>>       /** @restore: Partial restoration from backup state. TTM private */
>>>>>       struct ttm_pool_tt_restore *restore;
>>>>> +     /** @objcg: Object cgroup for this TT allocation */
>>>>> +     struct obj_cgroup *objcg;
>>>>>  };
>>>>
>>>> We should probably keep that out of the pool and account the memory to the BO instead.
>>>>
>>>
>>> I tried that like 2-3 patch posting iterations ago, you suggested it
>>> then, it didn't work. It has to be done at the pool level, I think it
>>> was due to swap handling.
>>
>> When you do it at the pool level the swap/shrink handling is broken as well, just not for amdgpu.
>>
>> See xe_bo_shrink() and drivers/gpu/drm/xe/xe_shrinker.c on how XE does it.
> 
> I've read all of that, but I don't think it needs changing yet, though
> I do think I probably need to do a bit more work on the ttm
> backup/restore paths to account things, but again we suffer from the
> what happens if your cgroup runs out of space on a restore path,
> similiar to eviction.

My thinking was rather that because of this we do it at the resource level and keep memory accounted to whoever allocated it even if it's backed up or swapped out.

> Blocking the problems we can solve now on the problems we've no idea
> how to solve means nobody gets experience with solving anything.

Well that's exactly the reason why I'm suggesting this. Ignoring swapping/backup for now seems to make things much easier.

>> So the best we can do is to do it at the resource level because that is common for everybody.
>>
>> This doesn't takes swapping on amdgpu into account, but that should not be that relevant since we wanted to remove that and switch to the XE approach anyway.
> 
> I don't understand, we cannot do it at the resource level, I sent
> patches to try, they don't fundamentally work properly, so it isn't
> going to fly. We can solve it at the pool level, so we should, if we
> somehow rearchitect things later to solve it at the resource level,
> but I feel we'd have to make swap handling operate at the resource
> level instead of tt level to have any chance.
> 
> Swapping via the backup/restore paths should be accounted properly,
> since moving pages out to swap one way cgroups can reduce the memory
> usage, if we can't account that swapped pages aren't removed from the
> page count, then it isn't going to work properly.

But that is only possible if you generalize the shrinker XE has implemented for at least amdgpu as well (and make it memcg aware).

That's exactly what I would try to avoid because it means tons of additional driver specific work before we can get at least a foundation for memcg awareness.

Alternatively we could implement a shrinker for the existing swapping path, but I tried that before and Sima, Thomas and I agreed that this is not the right thing todo and rather came up with the XE shrinker.

Christian.

> 
> Dave.
> 


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A9DA8B422
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 10:42:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E495C10E892;
	Wed, 16 Apr 2025 08:42:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="CY+psJEy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2040.outbound.protection.outlook.com [40.107.223.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1DAB10E892;
 Wed, 16 Apr 2025 08:42:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sd1bYDuN9uUwm+11PLUT8/E+Tg0Z1IE/P39JTr6ZjudaQUoUheFuevQNxFmURVfBEYgYcz3fWpJoLungQ5Igiv5vQoHtnCkNQhKEqZS7Jc/N4qd8QJqbQDVIPG2XqZOBtNZ0hVdY9zFPpALpTjDd5sUvT8XkQIGO9wzwLJh81TuoUDUzC/YkdNBWP2gRBmS+ZdIbpKj039m1wmFaICIounXZdzCl8jJzs22rCpTbSA9FH3ut3oxm7piTUMoaeBsdbwYC8YmE80WLbCykcTOvnIJbO2j+gvPTtndZF7EZHq4RX+VIky8crlcASLcczt+H635MiZyQ2j9xvI7TQiq2zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D3l1PX/n6B3w+sOJk0KCsIlxcN1YpNAgAuuSlw5S/Zk=;
 b=VF0cPVwYz6oRBr52m55Mq4+RN9wpUYglKvmPD1RDWBCgOtfHA+p3FigJjYRRkVxTISb1a+hB+YyBIUBZljfKDuz5W/9l6hVCMlk/h6gUjCYmbPCCrraq7mM0KjIFjbDFLCVHKyskhjZSw90gx9jPi8I9sPsQWsoA2JKWtg5ZOKyZYkZdqlGWCbSwF1qYrh3Pdr/W1pa4BikGl1FCDLf1AMZVmNdMDejMcCpxokWC94iil76Dv9YDW8Lg7Obovf9ZJDlnDr+iOsHvG+C/MzDmKet3WcM3XVkMeJPH3GWJMKauf+E3JbOlDVGrdhxr6XBRTm9jeOWcVGMnth8i8E1EoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D3l1PX/n6B3w+sOJk0KCsIlxcN1YpNAgAuuSlw5S/Zk=;
 b=CY+psJEy8jR+HNjTpYcm+U44JO43cz9ZS3yq1jEf2nrSQvsDIkauHdbQMweMsVq3pUYiNgnSfj80k8x9uUXrMMveBkQTzkTpMLXHvQyuOwR9mX2WwrRgk6+8itN0Ivpqvo21rqFDZRzdtc5tiFE6L60oc3ooXxONvt5WCxBc20g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5753.namprd12.prod.outlook.com (2603:10b6:208:390::15)
 by PH7PR12MB6394.namprd12.prod.outlook.com (2603:10b6:510:1fe::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.29; Wed, 16 Apr
 2025 08:42:50 +0000
Received: from BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e]) by BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e%3]) with mapi id 15.20.8655.021; Wed, 16 Apr 2025
 08:42:50 +0000
Message-ID: <c3108180-4579-4aed-b375-946863b0fc87@amd.com>
Date: Wed, 16 Apr 2025 14:12:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] drm/amdgpu: add drm_file reference in userq_mgr
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Sunil Khatri <sunil.khatri@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
References: <20250415184318.2465197-1-sunil.khatri@amd.com>
 <20250415184318.2465197-2-sunil.khatri@amd.com>
 <dcc0921c-d0f1-491c-b5f8-ef0be4d08dfb@igalia.com>
Content-Language: en-US
From: "Khatri, Sunil" <sukhatri@amd.com>
In-Reply-To: <dcc0921c-d0f1-491c-b5f8-ef0be4d08dfb@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4PR01CA0096.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:2af::8) To BL1PR12MB5753.namprd12.prod.outlook.com
 (2603:10b6:208:390::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5753:EE_|PH7PR12MB6394:EE_
X-MS-Office365-Filtering-Correlation-Id: 23890dfa-7854-4234-cbd0-08dd7cc2ab9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OGgvNDNSNWlQMmFkdDg3QWR5a2Zhcms3U0FlU1FSMVlQcGNlNnFlRE1hYUdX?=
 =?utf-8?B?bGNyTWh1NmtoWEFOU0FOcHlYRUMzZEswOEVSTzQyVjhLcktKK0VmR0V6N0xy?=
 =?utf-8?B?Wk5rV0tjajJwK01QUzJybDN3ckNLQWE3Q056SU1LNC9BbmtIYkduSUROU0Qy?=
 =?utf-8?B?VnVuOXMycG5KbVJzcXllTllndGEvdlljQUNYZkl5cUJRcmlSZWV4QnNMU3h5?=
 =?utf-8?B?SHF1aVpYRFdYdG5ieXJ6cXhPQWpFRWNHR0ExRTRiZDJseDBFbHNaSkZvT1pS?=
 =?utf-8?B?TTh0a0RIMzZjK2VNTVhYb1dIbTZoQ01FbzREOFpIS1daQ2h0K01ZL1ZkenFJ?=
 =?utf-8?B?bXhkZDdvUGJBWGZMLzNoOTBuMFhlSDBPanZpZUJVdHRHWmFNV292YUlPWkth?=
 =?utf-8?B?VVhiNVowWlhXcHowSTM3QThVTllnMzZYQmhiSnp0dnpsRjRSL1FtSzFJelZG?=
 =?utf-8?B?U3M2SlBJR0dybGJmZDdKVGNXMnFRVDAvWEhhaEtJODBDNWdUTHJpT3Y3cHVK?=
 =?utf-8?B?WnBZQVdvVGlUeWxoSTlWTHhCU0tuVW1RdXhyQU5tWWs0OUhMb2ExWkhDWVBY?=
 =?utf-8?B?clN5L2RUZS9oU1VNeHV0cGM5bnVDck1YOERqSkR6S1QvZVovTTVYek92bWE5?=
 =?utf-8?B?L01GWTBnYmhyUHVwQTZoZUNuYWQ1b1VqbmRZRHVVY2J5SHJFNm1PNXFJZk9U?=
 =?utf-8?B?TlVvY09sM3MzOXphdXJOa3pRa0lWVGJOamtKaVo3Z2VmS3pPVXZERVpvckVP?=
 =?utf-8?B?WlBXNjlPWXRaSVRSSkFzV1U3ODErMFFRSFl3VU05ejhlUlNaZm1HZDlZdjJW?=
 =?utf-8?B?WVdPeEFNaEhSVERpUEFXOWVxZXpyd0VzN1JPc2FOL3h3VEYzM3JKL0hyK0VR?=
 =?utf-8?B?bVp4QXFPajdzb0tKQ1p1L3FZa0ppMUxzYjJXQ0FGUGtrTWUrYkUwTUxuVTBI?=
 =?utf-8?B?NU9SUFlQZFFYUFRUVnlpMFZzakl0aWdkMmZoTVc2dWFBSzR0S2FpM1VBTWp1?=
 =?utf-8?B?bkJUUDQ1akdmS3JCbXlFWmhzQUhvdyt4ajg2V1paajVNZmVtL0lCTDlFSEQv?=
 =?utf-8?B?cWJsRUczN090TXZKL0o3eEFXZFUwa043RFRrRTl4bi83QkRZVWx0NEU0NnF4?=
 =?utf-8?B?N0I4ZHUwZVhhZVF4SG4rOVhaSmpIeTNjZ1JaQUZxOThzNHIyL094VWRJeDB3?=
 =?utf-8?B?UUNYL21Gd0UvcGw2T0FUaXpYclcwd3lXbE1iS3ZGVldMS1laVkdpZExtZ1gy?=
 =?utf-8?B?d3Q4ZVR1cysrL2t1Tlc2Z3ZFNDdOM2crVXdkc2ErRDNncFZESk5DUUh1ZTcy?=
 =?utf-8?B?dk1IQXVJWHVvbkJHa2ZYci8rK1NiWDROTHhsbldPc2hKS1MwRzdxLzMxZkpv?=
 =?utf-8?B?OHR2R09kVG5WSElSKytxODNldkk0K3NsWWtpQVZ2dlFFVUV1M1ZCbHBWYU04?=
 =?utf-8?B?N1F3RVZ1eVpsZ0VRYmY0OU9GMnVseUZGa2xQV0huSmJ4dWlKMFVMOWlsZWR1?=
 =?utf-8?B?R3ZvWmx0SlBxdnpNbWl2cXJtY3BhWm9tSVYyWXYyNkJjWUw1VkwxcXA2aU5l?=
 =?utf-8?B?YzZablhhS1VyQU15ZnRVZC9NUzc2ajFBY2thcm9zTGJFdCtCbHQ2MWVwMkR5?=
 =?utf-8?B?Y1Q3RVRleUl5SGRtU1Zwb3p1SjUrTGFITWNLRUg5UzZHYVhkdTFMbmZFblQx?=
 =?utf-8?B?Sk5hV0Z0eFBIMitMbnl3SFpJWGpFUEJlanZxS0MrTzJrUjlrYVlxcFNBNS9Q?=
 =?utf-8?B?aXREU0xQczQ2SFozWTdWc0lzcnI2OWpGU1l5cWMzQXo3WDRNWXU1MzJQTnJl?=
 =?utf-8?B?SGcyVnRYMHhHVmV0bGdlbDEwODMrQld6Nm1ZaGFOeVFyR2pKbnVrUDlCZmJk?=
 =?utf-8?B?b3Q0Z0VRU09mVDhubm00NUVuMDdtUDFyT1JLZ2RqWnVYTk02bTFETmg0MUlv?=
 =?utf-8?Q?m9YikR4TbvE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5753.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MnBmL2dJbVcrQjZDQWtldDN2ZU9aVE43YlA0OGhYTkZJczUrakprcFk1ZnhF?=
 =?utf-8?B?cW0xbENDeDJpeVRyRmNYNnBtTW1ZZFZqSWVXaUJUR0E2SldjM1BjcXFXcDR2?=
 =?utf-8?B?czZXNGxCMURpdFVEUWkyWTFWbXUySkFFcStXY3FQYis5Q3NrY0t2bHk1VVZV?=
 =?utf-8?B?Z3VUNUp6WXJXZFhLWGM0M3RJZmJ0L2wzcnRKa05Mdk1FcjhtSktTWlFhSkxt?=
 =?utf-8?B?SWo2cndXMWZnODFIZUZCcC84aHAzd1gxY01lSktDVVR4STBFSkg5bWk0N2E5?=
 =?utf-8?B?YVZRUFViU2dwWU1rRkU5Mm1FQ1RtdXdBVjFLclBjRHluTWRIOFBnOVNUYWRq?=
 =?utf-8?B?S3p6cVFkZ3o4QjA2YXRidkNnUVF2Z01FODdEVGZPNzlPazRwelp4ZGQvRmcy?=
 =?utf-8?B?SHlCWDcxWjF5NWV1ZHFBMG9vOXl4ZnVob3QrSnB4TWhwcEdMTSs5REllSXdt?=
 =?utf-8?B?aUI0MUsrODJaYVlKamVrRmowZEhOVDd1VFk4cDcreWFOMjBSVkVoWmxBdXVp?=
 =?utf-8?B?eXBlV29XNU1KQ2p2OTBvYnpkcm4rQ2pmYzVMZVdxVDUwNHBKUUlSYzlWaGZZ?=
 =?utf-8?B?U2FCVkJEQngxNis2SzlqL2RvZ1gxcXhFdFBXUkZpS1J6ZXNUQXk0eHpuU09W?=
 =?utf-8?B?elA2M1RZcUlVSkpHV1hXZVA1TWZkSEcxb1R1WkdqOEJrTnBNQ2lzYllib0h2?=
 =?utf-8?B?WnNHWm9OSnE5ZUs2UzE4U1hoc01Xc05jVEovSVM2cGJnTnFzRWQraUNHc1JD?=
 =?utf-8?B?Z2IxdmtoNzVoRjA3NlNlblRYdW9Takx6WXVOcVJzYkxLQ3lEcW1uV2kyZ2JL?=
 =?utf-8?B?Qnh1dkNvMHBpWUg1eXBBTmZUMWNCSGJLeVFwdEJ1ektlL1FyOWh0dUl1eVFB?=
 =?utf-8?B?NmorYnJId3lLZmcycE14VGNjSDA2QnhOZXVrYStCTUIyd0JEYm0xR0FjWWhL?=
 =?utf-8?B?bzl4OWtuMUJaYllzaWw2c3F2QkxvMXVwNHFsb0x6UmFBSlBESUltWStUNWph?=
 =?utf-8?B?RDl5cHMxMHlwREgveXJ6eVZlcDZuT2NHOU9SYVVxOWhDRnozV1NLQmVwdjZF?=
 =?utf-8?B?aDN4bm5OelU2eFlSRHhWd1QzK3BXOTRwWHYrSHIyVW5QQTErWmhoUHg2T095?=
 =?utf-8?B?QWx0QVlLb2QvRUxtaXhUU3lKcFNjN0o5cGZyVmp0bTdueThZRDdQdU51SVdt?=
 =?utf-8?B?STgrcHo0NzA5cDVyazlPdldNQWpHMDIyQnBMUzlPRThpL3liSC9ibndIYnR0?=
 =?utf-8?B?bFgzeXp4Q2NmNVVjaC9MQitnVjhqTFY4N0R1c3IzWTRVTGVySjJoaVZwcm9s?=
 =?utf-8?B?T2FpUUs4V202VEhod2pNOFg4c2FxZlM2VmR0Z1FPbFZOSEZzdXp3QWNjMTdY?=
 =?utf-8?B?d0FPSE11UnhWR2Y2MTlJR3NHV3pyTytHSVBvZHJjM3pTZks1UHJZV1cxYjIz?=
 =?utf-8?B?VnlZS1FCTlBIREh6clViRi9zbmhJejI1ZjFPREl2YThOWHlkaGFHdmNIM2JF?=
 =?utf-8?B?NHMwU3JNdG0vMmVXUDlYckl2Q2hwbk1ReTlJbXh0VXZ5ZVBxL2NibUsvZEVu?=
 =?utf-8?B?OXR4U2k5Z0RUcFJIakpHd0wwL2dlcFVkWk1BRDRCSi9WNlV0SzlpZnFvQnVl?=
 =?utf-8?B?OGJkYS9abFVqcDlpa2t3cEFzSkl4d1ZkSzg1MmtyV3liYjJjMmU4V3lVcGoz?=
 =?utf-8?B?UDNSd1FkdzdESUk2N25STzlKanFXRmovVGdNNlZMdjg3UUY4WWVHVlIxMXFu?=
 =?utf-8?B?eXVKKzFIdnAyUXl2Vk10MEpvRjVhZlk4dGZUQlpaRWxRYnRYQTNqcTc3clZQ?=
 =?utf-8?B?bnFrNnNyalRhMVFFalI3ck9DaEhBRkRIYTZKa3NYcWdPRFlmQ2VHemZDQlEv?=
 =?utf-8?B?bjVJWitTWnN1cW1wb1oyMlJIQ1RsQUFiTlFYd0UwT0p4OWFmSG84VVhkcGJ6?=
 =?utf-8?B?M0tvMmRjNWxNdUlONzlHL2F2OTRjUTMwNWxxZnl4eVJ4UGdsb0tNZTFkRFpt?=
 =?utf-8?B?TTc0TU93WERjVlp1ZlQ4VmVnSlFyRTZ4Nm9RN0t2azhtdDNPUEQrazlROXJn?=
 =?utf-8?B?cDh2N09OWDZjRjU0L3A2Q2JDbUcwN2dUeWlKbUNTQ2s0M3FkUE96UDRjZ2FE?=
 =?utf-8?Q?9UNNrpiWFH3QfNRhbz0OZoZFV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23890dfa-7854-4234-cbd0-08dd7cc2ab9c
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5753.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 08:42:50.3987 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZY7PnpbEG0l0n0X2FZispR7Z3LZ98aYZGWpA0x1F/85LqAjRlPaYMtTwD4dsrG+eysvd0eLCZjUbY9G3rtaIUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6394
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


On 4/16/2025 12:59 PM, Tvrtko Ursulin wrote:
>
> On 15/04/2025 19:43, Sunil Khatri wrote:
>> drm_file will be used in usermode queues code to
>> enable better process information in logging and hence
>> add drm_file part of the userq_mgr struct.
>>
>> update the drm_file pointer in userq_mgr for each
>> amdgpu_driver_open_kms.
>>
>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c       | 1 +
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.h | 1 +
>>   2 files changed, 2 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
>> index 3d319687c1c9..3de3071d66ee 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
>> @@ -1436,6 +1436,7 @@ int amdgpu_driver_open_kms(struct drm_device 
>> *dev, struct drm_file *file_priv)
>>         amdgpu_ctx_mgr_init(&fpriv->ctx_mgr, adev);
>>   +    fpriv->userq_mgr.file = file_priv;
>>       r = amdgpu_userq_mgr_init(&fpriv->userq_mgr, adev);
>
> It's a bit of a layering violation since amdgpu_userq_mgr_init() is 
> the place which otherwise initialises fpriv->user_mgr. One day someome 
> might put a memset in there for example. Anyway, I think it would be 
> nicer if you passed fpriv to that function. Potentially instead of 
> adev. Looks like that would be cleaner "design".
>
I agree totally this should be inside amdgpu_userq_mgr_init with fpriv 
passed to function. But i guess whoever wrote it in first place thought 
to make it same as done in a line above fot ctx_mgr. Once we have these 
patches merge i will push these fixes separately.

Regards
Sunil Khatri

> Regards,
>
> Tvrtko
>
>>       if (r)
>>           DRM_WARN("Can't setup usermode queues, use legacy workload 
>> submission only\n");
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.h 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.h
>> index 381b9c6f0573..fe51a45f7ee4 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.h
>> @@ -77,6 +77,7 @@ struct amdgpu_userq_mgr {
>>       struct amdgpu_device        *adev;
>>       struct delayed_work        resume_work;
>>       struct list_head        list;
>> +    struct drm_file            *file;
>>   };
>>     struct amdgpu_db_info {
>

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C9A42FC60
	for <lists+dri-devel@lfdr.de>; Fri, 15 Oct 2021 21:44:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78A726ED9D;
	Fri, 15 Oct 2021 19:44:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2070.outbound.protection.outlook.com [40.107.94.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3E616ED9D
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 19:44:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Id5VNL1aHq9WWsemIoVKLyRWL0d9XzwL3cvRo9rsVJ1dUTTj3wF47CJyCqcNwLdC6qtdG5YcxFmfDnQD5s7qm9o6NU3kLfMz2Dz8PLqVXlFuWFZn44k0emnQAlJHgf+n7v+yAAC+WusNdoceLAZWxfGFlfwBZNP1RwwUW4xkC42iGWik6sttGruSucc9H63bXcPmFIBzUDAtU+gvSH4DIr8VElrLw0VV2C6uWHqTq9ug7jiiqfN64UQ0uWhv0a8zw3qhdWiAX9D65Y+LNt4T/4kHu+uyn4pD6G4wsFizydOUhv5lQjvzSMSyI7YANbr+kbECbST+US2REX9ZoI++1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HEvP17J6UgnaCf0SBGIZAYgnWrEBP3pOs0kQdeQwzrY=;
 b=n5dDOYwtBeY0Io21b0kNg4x8WF59GGyf3ELxnG3tKJowtIc+F+sL04eImwiE/nBsAa+SGtmFOY8E8st61Vw8h3Ea7s6hHaELhHmYqdLjbMd0SrnzhWLtpX13kXxWQGfegySlhXR2qUWbWOCc9WIMoFAqRf3E62HpjXao2q2FZVa8oPyV+BIIh7gMXzs0d1x8Zcx/pjg/GzgnuPQMghpOjQDf6U1ODyzLDjSwU60Tw47VIMUzE5LhfK6uiI3I4lgBRnKjFBzs/cvVcZOKeSMbyTUvX5e0v3ybOY4/rT3r3UKREAWmL4kDu+9wtyoixNcAIRzGdrCuekiYrCz5llELCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HEvP17J6UgnaCf0SBGIZAYgnWrEBP3pOs0kQdeQwzrY=;
 b=DFETkU2jca5ZLqS0hd1eapW8nHof22TLFF0bAZuVcwyS31ldD+K6OqcDL/klAW18RKGJTTRjxV+jz8y1V+8AXTZv0ICgZxkQ4w1ku0AcmOZvJcNlxQQ/veGlmXIhr+qQTB2wnX8wcmymiJk8Kcshk9bHzcq7oTs+QqC79m3Nrfs=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4554.namprd12.prod.outlook.com (2603:10b6:303:55::21)
 by MW3PR12MB4556.namprd12.prod.outlook.com (2603:10b6:303:52::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Fri, 15 Oct
 2021 19:44:00 +0000
Received: from MW3PR12MB4554.namprd12.prod.outlook.com
 ([fe80::700d:46f0:61ab:9c1c]) by MW3PR12MB4554.namprd12.prod.outlook.com
 ([fe80::700d:46f0:61ab:9c1c%9]) with mapi id 15.20.4608.017; Fri, 15 Oct 2021
 19:44:00 +0000
Subject: Re: [PATCH] drm: Update MST First Link Slot Information Based on
 Encoding Format
To: Lyude Paul <lyude@redhat.com>, Jerry.Zuo@amd.com,
 dri-devel@lists.freedesktop.org
Cc: Harry.Wentland@amd.com, Wayne.Lin@amd.com, Nicholas.Kazlauskas@amd.com,
 "Lipski, Mikita" <Mikita.Lipski@amd.com>
References: <5e463fbc3d633eea1078e838ba5be0065ffbeb1e.camel@redhat.com>
 <20211012215848.1507023-1-Bhawanpreet.Lakha@amd.com>
 <3fbf786ee687e57cab02d71c745d01fb39819cba.camel@redhat.com>
From: Bhawanpreet Lakha <Bhawanpreet.lakha@amd.com>
Message-ID: <8fb410e5-3b47-d0a7-6d73-3b6692429e10@amd.com>
Date: Fri, 15 Oct 2021 15:43:56 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <3fbf786ee687e57cab02d71c745d01fb39819cba.camel@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: BN0PR04CA0042.namprd04.prod.outlook.com
 (2603:10b6:408:e8::17) To MW3PR12MB4554.namprd12.prod.outlook.com
 (2603:10b6:303:55::21)
MIME-Version: 1.0
Received: from [IPv6:2607:fea8:9dd:3f70::28d8] (2607:fea8:9dd:3f70::28d8) by
 BN0PR04CA0042.namprd04.prod.outlook.com (2603:10b6:408:e8::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.16 via Frontend Transport; Fri, 15 Oct 2021 19:43:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d40e7dd5-86f3-4139-da9f-08d990142264
X-MS-TrafficTypeDiagnostic: MW3PR12MB4556:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW3PR12MB455669AAE750E2D0E4C0787CF9B99@MW3PR12MB4556.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WaACmef78v0RdylhJQtfYhSX0e4voqxK7xQ9Xl2l/m0C2cprNxl8m8Ix+4ezUlwLSm5hja31SMwbL+lv/TEb/IFqcEJ0PAt7wuwTTHipgOL17blCV+++dX1s/6fO7ZOrT5tTXEy604N21ZXFkEtt2WMrnv09Akv2APfcrRyWa5QnRr4RxmAPZO+Gev3vYbf7RKnPhTr9v+chajzmhKlM2qKBmGF5AvX0stWchuyTtq9FYVpJ7DxpK9wg75Ow5w44T8GtEB+5YYJT/BriM/EolTBR/aNoGC2+mCrpCAnrLN8QfYCX0HVV2ltQ8HAFrMUFp6lWAfHnr5oYxOp01q7e8uEWW1+8egiEtNrzy503t3lptpW5Pm5ilQujkPqgRin7zOM4Fn62WRbtxUYfB1hNaraDRqxjW3vaYI3oowcQJ7wBvcxRgnl3E12CrfsT2jKViar7U1zSgYm7VIIgcYpjgczpwO6aFVe3vyY1ck33sQTRP4YdwDMH/2o0se/LlOEM0aTZs3Qx1qKl0pyTqEYmQqXqXKnlzQSofnVJQ4+JWc40q22Y/yTgCQzJPkQubeUStpvHnEisY65Y+ucuVTUUSdx8W49ICx8cDLoT5q5ZHSDaqtvZmxkjcrAoKDr44sSjyFAqjShhRIx/gE827xmT+DKoS6o9CkR5rCesHBcDcvoyRRiw4C2C6+/ZzD6FFtdcRZ8rrprkFWSocpFMaOoOCF5J5jVdYKFw5VrXGbEbvZ4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR12MB4554.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(30864003)(83380400001)(38100700002)(2616005)(66946007)(6666004)(4001150100001)(5660300002)(86362001)(186003)(4326008)(53546011)(31686004)(6486002)(316002)(66556008)(66476007)(8676002)(2906002)(15650500001)(8936002)(31696002)(508600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eTVSODl2RytXRU4yZ3ROUVgwSmJCSUdwWUtKSU90R1M3VCtSdUFGK2t2VjRH?=
 =?utf-8?B?V1JHM1RNd29hVWs2VmxPWk5UVkt5UWQ5b1U1TWttMHNnTVhmMXV1RTJobFR0?=
 =?utf-8?B?QkcxN29vZzZuNXhPRzc4VUxLMlF2RzcrWFFJWHNYYkU4dGgwT2xLU0ozcGlZ?=
 =?utf-8?B?aDIrd1l6QnEwbU02ZHZKa2VlYjRaUnRlYUlTQVViUnlSd0tlZEdIM1V4eUJU?=
 =?utf-8?B?RmZCOUI2dm1LUDcrVzFya21sYThKbUdETFRmREhHUlBoTUhrbzZRMDZLSTcr?=
 =?utf-8?B?MkNPTzhhZndpZlYya0h1MmRRajkvQk9zR21rVGE5NDhMcUl4V1Z1RENwL2ZR?=
 =?utf-8?B?SmhOZkVKZFZDS1hCeTNCYjdFV1V0ZldBN3M0cUtOUmphTmJqSW4zWTQ5LzVO?=
 =?utf-8?B?elFwbVprOFY3WHFZbWtyWGhwV25OQWdZWHRLVzJzMUpsb3JiTVlSNFp6dVhH?=
 =?utf-8?B?Z1BEc3ZIY3hWUVJmV1d3TWpnK2p3aWFmTkk3ZGU5WTNEazVtbC80ZEhZSDNl?=
 =?utf-8?B?bHBOYlBUaXh6clhJUDcyZHBrWndySXZLbGhvTjBycFZRYXNOWUVUa0VuRXdh?=
 =?utf-8?B?dmhQVGVlOXNFb1Fzam9KVEcyaXJxaEFhVCtFQmlWUWxsWCsvN25PalBpZHJq?=
 =?utf-8?B?c0Q1TjRpL29UVWNWblliamVGMEJRMG80MGJPU3JjOGYyaGZENTkxaWtEekxB?=
 =?utf-8?B?S00zRlFrR084Ry9ZRkJ4REZhU0dTVHA3d0Iwb1BUWFFmY3U5L01zMmZOZ05h?=
 =?utf-8?B?VW0vbVJZekJ5WTF6L1R4cHp6YmRaMFVxSFdkbWJ6Nml2TnpRMFlXZ2RTR3cz?=
 =?utf-8?B?TDBRK1lHOEtYbFhRVVczYTB6cTJKMFdUK1MxcXdRcjFpMnYxMHp0U0FpTCtS?=
 =?utf-8?B?ekhMUlUrbExIVG9sdmlSWVdVakdWVEcvSjE0R0pkV1p6Qis5cXZqMEhYTW9K?=
 =?utf-8?B?bTh5YkhaMkpnQ3U4MjFIdVU2aXQrTExjT0F3aU1PTEltUEg5c1QxQXA1TnVv?=
 =?utf-8?B?a2UvR2s1dmw2MGJFOEM5Smo3d2pWS1ZXSC9TNDFnTk80Y1VnVkJTYzBWMkk3?=
 =?utf-8?B?ZnVDWmU1OW9hZjMwc3hVK1JiVmZYY0t0emNkeHpUSTZOMlB1UHpnSnRLUUFy?=
 =?utf-8?B?ZTJsem5KUDNxdmFES1licStaN0lwdnVIc296bzVPcnRRZERFT1dMc2FlYzFB?=
 =?utf-8?B?M0VQNmU0eFovamFUU3QvWERhcm5qbE82SVdDMkUrTTV5VXZSMlNUZWdzbXNZ?=
 =?utf-8?B?cWNYNWlUSlJaSFllSUcrd1BGVlhlQUdhSVV1Q2VCdmdOTG1BWWtpZGg1elRW?=
 =?utf-8?B?cjRDem0vV013aTJZWE41MUt2SWdTMllKa2pTbkszWm4xcU5GWWcwRWJTZFkv?=
 =?utf-8?B?eGJnRTBnUzkwcUt0TUZpNkVQNGVvTkM4ZTlhYVA4aFJVQjVjb0h5Y3pYVnZR?=
 =?utf-8?B?TGd0ZG9nYzZxS3lYbFlXMWpjRFhnNjhkbG94Z1JwTGhWdzBVUXlUNE91NUFn?=
 =?utf-8?B?NVlkMndFNGVwQk9DTUdidXdMUkJUcmwyaGc5UGlmTFBQVVY1UndPTGw1SnlT?=
 =?utf-8?B?TlI4Y0cxMUZBS1NZZXFVWnpxeFc1eHhPWG4xSFo2NXliaVdkTXRVY0p5THZ3?=
 =?utf-8?B?M2RWRktsUUduY0dIb3lLMWM0bTBvVlNHZXJMWFlCZXBwRS82eWFqSFlOWVYw?=
 =?utf-8?B?YlJ3VEoyUFhKcXVtN215dUhGTmRnT3E3eFJpNnJJM3JhVTF3b211L0c1VFEr?=
 =?utf-8?B?NVhLcDBiRGUvVmg1NFBHS2dzN3JJQkwzMU12N1o3TUlFTFpDbVJ3Q3UwOFQw?=
 =?utf-8?B?eDQxdHJwNCtWZUlhYi96QT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d40e7dd5-86f3-4139-da9f-08d990142264
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4554.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 19:44:00.3224 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a2uD77ASo+VuUZLENxcjRg6vb3QtMhHrvQvPGx/a7137g4fbj0cwq3MzlmPdSNc3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4556
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


On 2021-10-13 6:25 p.m., Lyude Paul wrote:
> Some comments below (also, sorry again for the mixup on the last review!)
>
> On Tue, 2021-10-12 at 17:58 -0400, Bhawanpreet Lakha wrote:
>> 8b/10b encoding format requires to reserve the first slot for
>> recording metadata. Real data transmission starts from the second slot,
>> with a total of available 63 slots available.
>>
>> In 128b/132b encoding format, metadata is transmitted separately
>> in LLCP packet before MTP. Real data transmission starts from
>> the first slot, with a total of 64 slots available.
>>
>> v2:
>> * Remove get_mst_link_encoding_cap
>> * Move total/start slots to mst_state, and copy it to mst_mgr in
>> atomic_check
>>
>> Signed-off-by: Fangzhi Zuo <Jerry.Zuo@amd.com>
>> Signed-off-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
>> ---
>>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 28 +++++++++++++++
>>   drivers/gpu/drm/drm_dp_mst_topology.c         | 35 +++++++++++++++----
>>   include/drm/drm_dp_mst_helper.h               | 13 +++++++
>>   3 files changed, 69 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> index 5020f2d36fe1..4ad50eb0091a 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> @@ -10612,6 +10612,8 @@ static int amdgpu_dm_atomic_check(struct drm_device
>> *dev,
>>   #if defined(CONFIG_DRM_AMD_DC_DCN)
>>          struct dsc_mst_fairness_vars vars[MAX_PIPES];
>>   #endif
>> +       struct drm_dp_mst_topology_state *mst_state;
>> +       struct drm_dp_mst_topology_mgr *mgr;
>>   
>>          trace_amdgpu_dm_atomic_check_begin(state);
>>   
>> @@ -10819,6 +10821,32 @@ static int amdgpu_dm_atomic_check(struct drm_device
>> *dev,
>>                  lock_and_validation_needed = true;
>>          }
>>   
>> +#if defined(CONFIG_DRM_AMD_DC_DCN)
>> +       for_each_new_mst_mgr_in_state(state, mgr, mst_state, i) {
>> +               struct amdgpu_dm_connector *aconnector;
>> +               struct drm_connector *connector;
>> +               struct drm_connector_list_iter iter;
>> +               u8 link_coding_cap;
>> +
>> +               if (!mgr->mst_state )
>> +                       continue;
> extraneous space
>
>> +
>> +               drm_connector_list_iter_begin(dev, &iter);
>> +               drm_for_each_connector_iter(connector, &iter) {
>> +                       int id = connector->index;
>> +
>> +                       if (id == mst_state->mgr->conn_base_id) {
>> +                               aconnector =
>> to_amdgpu_dm_connector(connector);
>> +                               link_coding_cap =
>> dc_link_dp_mst_decide_link_encoding_format(aconnector->dc_link);
>> +                               drm_dp_mst_update_coding_cap(mst_state,
>> link_coding_cap);
>> +
>> +                               break;
>> +                       }
>> +               }
>> +               drm_connector_list_iter_end(&iter);
>> +
>> +       }
>> +#endif
>>          /**
>>           * Streams and planes are reset when there are changes that affect
>>           * bandwidth. Anything that affects bandwidth needs to go through
>> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
>> b/drivers/gpu/drm/drm_dp_mst_topology.c
>> index ad0795afc21c..fb5c47c4cb2e 100644
>> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
>> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
>> @@ -3368,7 +3368,7 @@ int drm_dp_update_payload_part1(struct
>> drm_dp_mst_topology_mgr *mgr)
>>          struct drm_dp_payload req_payload;
>>          struct drm_dp_mst_port *port;
>>          int i, j;
>> -       int cur_slots = 1;
>> +       int cur_slots = mgr->start_slot;
>>          bool skip;
>>   
>>          mutex_lock(&mgr->payload_lock);
>> @@ -4321,7 +4321,7 @@ int drm_dp_find_vcpi_slots(struct
>> drm_dp_mst_topology_mgr *mgr,
>>          num_slots = DIV_ROUND_UP(pbn, mgr->pbn_div);
>>   
>>          /* max. time slots - one slot for MTP header */
>> -       if (num_slots > 63)
>> +       if (num_slots > mgr->total_avail_slots)
>>                  return -ENOSPC;
> For reasons I will explain a little further in this email, we might want to
> drop this…
>
>>          return num_slots;
>>   }
>> @@ -4333,7 +4333,7 @@ static int drm_dp_init_vcpi(struct
>> drm_dp_mst_topology_mgr *mgr,
>>          int ret;
>>   
>>          /* max. time slots - one slot for MTP header */
>> -       if (slots > 63)
>> +       if (slots > mgr->total_avail_slots)
> …and this
>
>>                  return -ENOSPC;
>>   
>>          vcpi->pbn = pbn;
>> @@ -4507,6 +4507,18 @@ int drm_dp_atomic_release_vcpi_slots(struct
>> drm_atomic_state *state,
>>   }
>>   EXPORT_SYMBOL(drm_dp_atomic_release_vcpi_slots);
>>   
>> +void drm_dp_mst_update_coding_cap(struct drm_dp_mst_topology_state
>> *mst_state, uint8_t link_coding_cap)
> Need some kdocs here
>
>> +{
>> +       if (link_coding_cap == DP_CAP_ANSI_128B132B) {
>> +               mst_state->total_avail_slots = 64;
>> +               mst_state->start_slot = 0;
>> +       }
>> +
>> +       DRM_DEBUG_KMS("%s coding format on mgr 0x%p\n",
>> +                       (link_coding_cap == DP_CAP_ANSI_128B132B) ?
>> "128b/132b":"8b/10b", mst_state->mgr);
> need to fix indenting here, and wrap this to 100 chars
>
>> +}
>> +EXPORT_SYMBOL(drm_dp_mst_update_coding_cap);
>> +
>>   /**
>>    * drm_dp_mst_allocate_vcpi() - Allocate a virtual channel
>>    * @mgr: manager for this port
>> @@ -4538,8 +4550,8 @@ bool drm_dp_mst_allocate_vcpi(struct
>> drm_dp_mst_topology_mgr *mgr,
>>   
>>          ret = drm_dp_init_vcpi(mgr, &port->vcpi, pbn, slots);
>>          if (ret) {
>> -               drm_dbg_kms(mgr->dev, "failed to init vcpi slots=%d max=63
>> ret=%d\n",
>> -                           DIV_ROUND_UP(pbn, mgr->pbn_div), ret);
>> +               drm_dbg_kms(mgr->dev, "failed to init vcpi slots=%d max=%d
>> ret=%d\n",
>> +                           DIV_ROUND_UP(pbn, mgr->pbn_div), mgr-
>>> total_avail_slots, ret);
>>                  drm_dp_mst_topology_put_port(port);
>>                  goto out;
>>          }
>> @@ -5226,7 +5238,7 @@ drm_dp_mst_atomic_check_vcpi_alloc_limit(struct
>> drm_dp_mst_topology_mgr *mgr,
>>                                           struct drm_dp_mst_topology_state
>> *mst_state)
>>   {
>>          struct drm_dp_vcpi_allocation *vcpi;
>> -       int avail_slots = 63, payload_count = 0;
>> +       int avail_slots = mgr->total_avail_slots, payload_count = 0;
>>   
>>          list_for_each_entry(vcpi, &mst_state->vcpis, next) {
>>                  /* Releasing VCPI is always OK-even if the port is gone */
>> @@ -5255,7 +5267,7 @@ drm_dp_mst_atomic_check_vcpi_alloc_limit(struct
>> drm_dp_mst_topology_mgr *mgr,
>>                  }
>>          }
>>          drm_dbg_atomic(mgr->dev, "[MST MGR:%p] mst state %p VCPI avail=%d
>> used=%d\n",
>> -                      mgr, mst_state, avail_slots, 63 - avail_slots);
>> +                      mgr, mst_state, avail_slots, mgr->total_avail_slots -
>> avail_slots);
>>   
>>          return 0;
>>   }
>> @@ -5421,6 +5433,10 @@ int drm_dp_mst_atomic_check(struct drm_atomic_state
>> *state)
>>                          break;
>>   
>>                  mutex_lock(&mgr->lock);
>> +
>> +               mgr->start_slot = mst_state->start_slot;
>> +               mgr->total_avail_slots = mst_state->total_avail_slots;
>> +
> this isn't correct - atomic checks aren't allowed to mutate anything besides
> the atomic state structure that we're checking since we don't know whether or
> not the display state is going to be committed when checking it. If we're
> storing state in mgr, that state needs to be written to mgr during the atomic
> commit instead of the atomic check.
>
> ...but, coming back to this MST code after being gone for a while, I think it
> might be time for us to stop worrying about the non-atomic state. Especially
> since there's only one driver using it; the legacy radeon.ko; and right now
> the plan is either to just drop MST support on radeon.ko or move the MST code
> it uses into radeon.ko.Which brings me to say - I think we can drop some of
> the hunks I mentioned above (e.g. the changes to drm_dp_init_vcpi and
> drm_dp_find_vcpi_slots I mentioned above). We can then just update the kdocs
> for these functions in a separate patch to clarify that now in addition to
> being deprecated, these functions are just broken and will eventually be
> removed.
>
> So - doing that allows us to get rid of mgr->total_avail_slots and mgr-
>> start_slot entirely, just set the slot info in the atomic state during atomic
> check, and then just rely on the atomic state for
> drm_dp_atomic_find_vcpi_slots() and friends. Which seems much simpler to me,
> does this sound alrght with you?
>
Thanks for the response,

That function is per port so not sure how that will work. Also we only 
need to check this inside drm_dp_mst_atomic_check_vcpi_alloc_limit(), 
which doesn't have a state.

We could add the slots(or some DP version indicator) inside the 
drm_connector, and add a parameter to 
drm_dp_mst_atomic_check_vcpi_alloc_limit(int slots)? and call it with 
this info via drm_dp_mst_atomic_check() and then update the mgr->slot in 
commit.


Bhawan

>>                  ret = drm_dp_mst_atomic_check_mstb_bw_limit(mgr-
>>> mst_primary,
>>                                                              mst_state);
>>                  mutex_unlock(&mgr->lock);
>> @@ -5527,11 +5543,16 @@ int drm_dp_mst_topology_mgr_init(struct
>> drm_dp_mst_topology_mgr *mgr,
>>          if (!mgr->proposed_vcpis)
>>                  return -ENOMEM;
>>          set_bit(0, &mgr->payload_mask);
>> +       mgr->total_avail_slots = 63;
>> +       mgr->start_slot = 1;
>>   
>>          mst_state = kzalloc(sizeof(*mst_state), GFP_KERNEL);
>>          if (mst_state == NULL)
>>                  return -ENOMEM;
>>   
>> +       mst_state->total_avail_slots = 63;
>> +       mst_state->start_slot = 1;
>> +
>>          mst_state->mgr = mgr;
>>          INIT_LIST_HEAD(&mst_state->vcpis);
>>   
>> diff --git a/include/drm/drm_dp_mst_helper.h
>> b/include/drm/drm_dp_mst_helper.h
>> index ddb9231d0309..f8152dfb34ed 100644
>> --- a/include/drm/drm_dp_mst_helper.h
>> +++ b/include/drm/drm_dp_mst_helper.h
>> @@ -554,6 +554,8 @@ struct drm_dp_mst_topology_state {
>>          struct drm_private_state base;
>>          struct list_head vcpis;
>>          struct drm_dp_mst_topology_mgr *mgr;
>> +       u8 total_avail_slots;
>> +       u8 start_slot;
>>   };
>>   
>>   #define to_dp_mst_topology_mgr(x) container_of(x, struct
>> drm_dp_mst_topology_mgr, base)
>> @@ -661,6 +663,16 @@ struct drm_dp_mst_topology_mgr {
>>           */
>>          int pbn_div;
>>   
>> +       /**
>> +        * @total_avail_slots: 63 for 8b/10b, 64 for 128/132b
>> +        */
>> +       u8 total_avail_slots;
>> +
>> +       /**
>> +        * @start_slot: 1 for 8b/10b, 0 for 128/132b
>> +        */
>> +       u8 start_slot;
>> +
>>          /**
>>           * @funcs: Atomic helper callbacks
>>           */
>> @@ -806,6 +818,7 @@ int drm_dp_mst_get_vcpi_slots(struct
>> drm_dp_mst_topology_mgr *mgr, struct drm_dp
>>   
>>   void drm_dp_mst_reset_vcpi_slots(struct drm_dp_mst_topology_mgr *mgr,
>> struct drm_dp_mst_port *port);
>>   
>> +void drm_dp_mst_update_coding_cap(struct drm_dp_mst_topology_state
>> *mst_state, uint8_t link_coding_cap);
>>   
>>   void drm_dp_mst_deallocate_vcpi(struct drm_dp_mst_topology_mgr *mgr,
>>                                  struct drm_dp_mst_port *port);

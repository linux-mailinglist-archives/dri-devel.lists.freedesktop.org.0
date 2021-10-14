Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E8D42E2AB
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 22:22:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACF846EC4D;
	Thu, 14 Oct 2021 20:22:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2041.outbound.protection.outlook.com [40.107.223.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FB2C6EC4D
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 20:22:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=apGYx0Bx6BG5pP+1UQtGdlmxHlTcAPpR4F3BzwfHje0bgR0NFJYWB41bXemBpk/gshKV61x0J8G2lWcjnYnRQts8z4hFednILjOYWQgxwTyjS3TkVapqWf2ZjHZPMEI/MjcOaI80xDGKKkdH6Ftv7D9OiEUNVy0TEONCzXwfs6Ltl8ypohDnVSnxjeBLaiaflnIPxSxDW/CW6ENsrl1Yrh132ZlZHRbEslcliTbXd2s+8iXG/+Q1vlF1B3gCfJ0NrCCZyQ7RH8/MlOtslPst6hayd9lwuoj4WV9jFJfL92tY4ZCNLUkLhCSPjVLJRcZLnp2/8rPL32iu77ukSoqH4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a0p4y2RJevnn8nLhTNPyaYskM6jdtyhRDEdYvT5v9OA=;
 b=ex4EPz9BjgrpgK/YrF0itVJ3lVF6ZVJX4TxS0Hn98+zSCnLilkawTK6elXq0eUVm+a1yod7IWXDysXIaVeojSDB220MJwUtUpITQiEsQRn5aoJnTXeNyEYBoWA8Yc4lDIjIGmxX8ePi3Q3hcp1YDUFtr8zQ1f1mSb0zvrnUhdbjSjxg30KCRNekD9mLkpBsJmJ4AKwSo1p8iuar9ra8cO1Gw9g06twDKMWPObwK7StvmZUcI0Rd8SWNC4Ct1Fq/KQTGnIJbcOocXThV4dr8jorcMpdC2+6+O5IHMS5r2NHGCsWWPYXlwsKR93DZCLOBI8WZQL7zIR0WU+uOiL1YOcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a0p4y2RJevnn8nLhTNPyaYskM6jdtyhRDEdYvT5v9OA=;
 b=2hxLsLOEGCqWVuMXyGzptLSU6p4hcZp+LyouWOhnNIMqHgNfY09pOWOJ8+1dIlJ7sND3w9kxuwrknQ3wCt8LpWYd2uNV8udhsfVO2Byrg2qqEkMd7Ulb815sruQkpoCcdoBJc/dcrU7+hDxRibnnHPj0SGsNcswuNCppoJ50B1E=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4554.namprd12.prod.outlook.com (2603:10b6:303:55::21)
 by MW3PR12MB4538.namprd12.prod.outlook.com (2603:10b6:303:55::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Thu, 14 Oct
 2021 20:22:30 +0000
Received: from MW3PR12MB4554.namprd12.prod.outlook.com
 ([fe80::700d:46f0:61ab:9c1c]) by MW3PR12MB4554.namprd12.prod.outlook.com
 ([fe80::700d:46f0:61ab:9c1c%9]) with mapi id 15.20.4608.016; Thu, 14 Oct 2021
 20:22:30 +0000
Subject: Re: [PATCH] drm: Update MST First Link Slot Information Based on
 Encoding Format
From: Bhawanpreet Lakha <Bhawanpreet.lakha@amd.com>
To: Lyude Paul <lyude@redhat.com>, Jerry.Zuo@amd.com,
 dri-devel@lists.freedesktop.org
Cc: Harry.Wentland@amd.com, Wayne.Lin@amd.com, Nicholas.Kazlauskas@amd.com,
 "Lipski, Mikita" <Mikita.Lipski@amd.com>
References: <5e463fbc3d633eea1078e838ba5be0065ffbeb1e.camel@redhat.com>
 <20211012215848.1507023-1-Bhawanpreet.Lakha@amd.com>
 <3fbf786ee687e57cab02d71c745d01fb39819cba.camel@redhat.com>
 <d9a43511-3435-0efc-d8a2-24c035b0ec74@amd.com>
Message-ID: <d657b5e0-6f8f-0427-f455-f12e0c2479a2@amd.com>
Date: Thu, 14 Oct 2021 16:22:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <d9a43511-3435-0efc-d8a2-24c035b0ec74@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0117.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::26) To MW3PR12MB4554.namprd12.prod.outlook.com
 (2603:10b6:303:55::21)
MIME-Version: 1.0
Received: from [IPv6:2607:fea8:9dd:3f70::28d8] (2607:fea8:9dd:3f70::28d8) by
 YT1PR01CA0117.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.16 via Frontend Transport; Thu, 14 Oct 2021 20:22:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d10d8259-5e71-4c31-13a2-08d98f505902
X-MS-TrafficTypeDiagnostic: MW3PR12MB4538:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW3PR12MB45388B5025FFB4F8C7FB79C1F9B89@MW3PR12MB4538.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Vby5AQO3hDx2kDDaFwaP6sj0BGoEqWEczRwhfQu+ldqvDJm+QtyGAF6lxD6Az8rBiyzYNYvQbjPDozDDPTZlLdV+a6Uq4+WBZBrS2d29dy5xDdV35nJBfRL+bgR0euzMCybwvLwKrehXqJUsyucTKeWRDEUxtmX9pd9qhXsVCKKnVcVKOx5oGhVln1G9wXcw/14o6ESAcJ4SaAnOwjyT4RMMqjNfE2qLQXQ62edaNUteEwZV4wS6SqFObdEYZTniBRIyde4OFsfkduhbwMuxAb+ORWL6uTcWtVFrcZgSKE4C0kOGwZvjcgDT8sRRksu2VcAXL9A6M5pE7sY8N86LMSOONoAwLXM7xTKbuY22p+85FbKMLtGbqgPwiMpusY6vklqJ5p7H6B831p5SFtxw+fJjj+7r+WVKXb1mYq03e1yFfCxPy2KyxS8g5jFQWFKXlVmf7mbOcvffpUX0hCWFFi5vq0EdcXOBJjnMl5mMAA3ObMwuEbwNacbJU58/fhLZa4R95HG3PfZ6QVKMzlXi0meoa8zdBGNT6ElZrbuyk5Er45NiHsEMuBbTJkpUKPvEhvKCHRm88sYIAmjAKw+4ZrpJ5F7uOP4DjIxysnuqVfXBJI3fsyW5B56p1MVI853yHlCb6j1lrS40sYkq6GqCcR+emJXe7SffGkcTo/lmoZ75jz4FGy3x6TOLOJfH2l2UZnz61YH+J3A5A1UnR2yvI4I8apfKBEzCZRRQqsCAHi4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR12MB4554.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(66946007)(4001150100001)(30864003)(15650500001)(8676002)(316002)(186003)(6486002)(66556008)(66476007)(2906002)(4326008)(83380400001)(8936002)(53546011)(5660300002)(38100700002)(2616005)(508600001)(36756003)(31686004)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z21FSmJSL1VDTm44dER2T0R4aEJRbUFoSVllVXBOVXc4RDZoalM2VVZzWXky?=
 =?utf-8?B?VW1CRFdibGkzQkZYTTl2RDE2RTNPY2RLYjlMR2RZKzY5ak45QlZmQzgvKys5?=
 =?utf-8?B?OE11eGtsNTliQ3dxaUJZSVYwQU50K2JTb3RXM0hheC90WDdkUXFMR2o2elVu?=
 =?utf-8?B?NjE5YzdPN2had1dGZVV3Rmx0UVEvUytqNW1kZGlrUytRcFlkZjdHSTgwWm1V?=
 =?utf-8?B?M1lGbS9CWjUreUk5V3Z5dFYyN0hobDRWOFRUaU13dUxJZjBVQ3F3UjRsd1Q2?=
 =?utf-8?B?amdLK25pcFJwS29NWFNQYjFBeDBDZnkyYlp3bnJNYXdXRkw0SENNRUI4OUVV?=
 =?utf-8?B?MUIwQWMwS0hvZDlwVG41WXdKWG5hN3hGRC9FYjRRV2E3L0dobnhhdmxzakZv?=
 =?utf-8?B?NW92N1NCMFVYNUk4Qm1zZVBVeHh5dGdiaUg1SjFqbGs5TnlCYktqWHhNZWs0?=
 =?utf-8?B?YmNRR0swZ2NOdkJXVG9hSHZLclpQeW4rWjVUZnU2UmFCd2JYZmc5QkxVTWVv?=
 =?utf-8?B?OHhEclRuWE8wWWR2S0dLa0puSi9Nb2FERG5VRzFiTXZGMmROK0tIakpMVE5N?=
 =?utf-8?B?YVJxTnUrK09GOG55eUNwVEd3S1ZNaHUxT3UwL21oa2Q4bXpQZzVDMTEvY3NE?=
 =?utf-8?B?Y3FUa3dKMElZRkdUNnI5bG9RUThzNlp5NjFEbi9OeUdybkU5aVBxY25wbnd0?=
 =?utf-8?B?bEFndjU0Y2FOK09RejZ1cmt6RXZTWFZsNXdHSEo2TGJIaDhVY0xFMERCSG1a?=
 =?utf-8?B?VDhONERvYmN5UXppOWRzemFIRnpBSEdEQnNYeE5COUYyOFhTaFpUVjFOZ3U5?=
 =?utf-8?B?L0Z4Mk1kRER6d1RRc1k2ZEdMR0k3UFMrRTFVMUZlbHA4end1RkdmdGgxNUtt?=
 =?utf-8?B?WU9OQndJdEVuc01SanpKZUhoL2NEKzdEZDRJVVA2NkF1UTlxZkR3MDA5VEN4?=
 =?utf-8?B?WW9ZeWdoZ1BPUytkTDJlWVRrTEc4Umw5ZzcvNW5wSWkwNFdyWkIwdzZmcVhE?=
 =?utf-8?B?cFQzLzcyelhNbFowVEg1SldkejIzTHRwQXl3Z1owQU44VnJPNUttcW53UXFH?=
 =?utf-8?B?MUZrSUpBamJjUjdGdDdmclFoT1hUM0F5eXRwMlJLbUpVTVNvWHB1NW1nbFlD?=
 =?utf-8?B?MGc2TENiS3Q4L1laQTZwVUN6U2d3ZkZSNVZKQUd2Z2VIemZCdHNBd2hlWk9w?=
 =?utf-8?B?UzBvdVJxZTFpelRhTVJlS056Qkk4WUpCdWVOVkk3RThyNkxhVmVsTkQ0ZDBY?=
 =?utf-8?B?TU1mMzg2am00TzI1R21VUyt5bkx4ckluZ0NDOFhheko5YUNYaHV1K0RNelhj?=
 =?utf-8?B?SDBIVDNNakxBNTNtd1lJY2dWbURhL2Jyd0pvU2NOek9oamhTOWVBSGUzNGM0?=
 =?utf-8?B?MExCQzFBSlE2SGgzUGozVUZJRTR5b1dpVmFxQ1l5TFB5TjlQOTZjT3BScUlx?=
 =?utf-8?B?VUFGTStZU2N1OXlVVDY5NitUZG5UeHRmWktrZW1jdVRpSFB3WXk4cENxeUp1?=
 =?utf-8?B?bTR6UkhDb1k0Wm9XZnlQVXo0UkJGVWZWWk1zZkNLNDVSS3FUODBjZktoSFVo?=
 =?utf-8?B?anNsVWFhMmpvaUxUUFpjWW1leDlIR0I5UDJLalVqaEpJSzhEQjE3NkFXaG9S?=
 =?utf-8?B?VHM1MlRTRnNRcDkyZHFWZVFEdHZ5UGtxYkk0WllSS3VDMHd0dzJ3c2JQazlL?=
 =?utf-8?B?YmtpZTVZOFRlUFlrK29BUkdyZjJOMWtrd2k5MnhkSE1ONUU0cTYvMDM1SGJs?=
 =?utf-8?B?SWs1UmkwYmlXQWNQK3UxVDlHQ1dnZTlEanUzSVR4eDh2SVZ0S2ltOEsraUNz?=
 =?utf-8?B?Y2phTm9hMGxPK29peHJ5Zz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d10d8259-5e71-4c31-13a2-08d98f505902
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4554.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2021 20:22:30.4264 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: amwwkkLCSgQ7ukjcjKS+GL2lB3D15wC5KxliiepTMd7T/L5AWEiEncmcZ2hWgfG3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4538
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

Adding Mikita aswell

On 2021-10-14 4:21 p.m., Bhawanpreet Lakha wrote:
>
> On 2021-10-13 6:25 p.m., Lyude Paul wrote:
>> Some comments below (also, sorry again for the mixup on the last 
>> review!)
>>
>> On Tue, 2021-10-12 at 17:58 -0400, Bhawanpreet Lakha wrote:
>>> 8b/10b encoding format requires to reserve the first slot for
>>> recording metadata. Real data transmission starts from the second slot,
>>> with a total of available 63 slots available.
>>>
>>> In 128b/132b encoding format, metadata is transmitted separately
>>> in LLCP packet before MTP. Real data transmission starts from
>>> the first slot, with a total of 64 slots available.
>>>
>>> v2:
>>> * Remove get_mst_link_encoding_cap
>>> * Move total/start slots to mst_state, and copy it to mst_mgr in
>>> atomic_check
>>>
>>> Signed-off-by: Fangzhi Zuo <Jerry.Zuo@amd.com>
>>> Signed-off-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
>>> ---
>>>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 28 +++++++++++++++
>>>   drivers/gpu/drm/drm_dp_mst_topology.c         | 35 
>>> +++++++++++++++----
>>>   include/drm/drm_dp_mst_helper.h               | 13 +++++++
>>>   3 files changed, 69 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> index 5020f2d36fe1..4ad50eb0091a 100644
>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> @@ -10612,6 +10612,8 @@ static int amdgpu_dm_atomic_check(struct 
>>> drm_device
>>> *dev,
>>>   #if defined(CONFIG_DRM_AMD_DC_DCN)
>>>          struct dsc_mst_fairness_vars vars[MAX_PIPES];
>>>   #endif
>>> +       struct drm_dp_mst_topology_state *mst_state;
>>> +       struct drm_dp_mst_topology_mgr *mgr;
>>>            trace_amdgpu_dm_atomic_check_begin(state);
>>>   @@ -10819,6 +10821,32 @@ static int amdgpu_dm_atomic_check(struct 
>>> drm_device
>>> *dev,
>>>                  lock_and_validation_needed = true;
>>>          }
>>>   +#if defined(CONFIG_DRM_AMD_DC_DCN)
>>> +       for_each_new_mst_mgr_in_state(state, mgr, mst_state, i) {
>>> +               struct amdgpu_dm_connector *aconnector;
>>> +               struct drm_connector *connector;
>>> +               struct drm_connector_list_iter iter;
>>> +               u8 link_coding_cap;
>>> +
>>> +               if (!mgr->mst_state )
>>> +                       continue;
>> extraneous space
>>
>>> +
>>> +               drm_connector_list_iter_begin(dev, &iter);
>>> +               drm_for_each_connector_iter(connector, &iter) {
>>> +                       int id = connector->index;
>>> +
>>> +                       if (id == mst_state->mgr->conn_base_id) {
>>> +                               aconnector =
>>> to_amdgpu_dm_connector(connector);
>>> +                               link_coding_cap =
>>> dc_link_dp_mst_decide_link_encoding_format(aconnector->dc_link);
>>> +                               drm_dp_mst_update_coding_cap(mst_state,
>>> link_coding_cap);
>>> +
>>> +                               break;
>>> +                       }
>>> +               }
>>> +               drm_connector_list_iter_end(&iter);
>>> +
>>> +       }
>>> +#endif
>>>          /**
>>>           * Streams and planes are reset when there are changes that 
>>> affect
>>>           * bandwidth. Anything that affects bandwidth needs to go 
>>> through
>>> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
>>> b/drivers/gpu/drm/drm_dp_mst_topology.c
>>> index ad0795afc21c..fb5c47c4cb2e 100644
>>> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
>>> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
>>> @@ -3368,7 +3368,7 @@ int drm_dp_update_payload_part1(struct
>>> drm_dp_mst_topology_mgr *mgr)
>>>          struct drm_dp_payload req_payload;
>>>          struct drm_dp_mst_port *port;
>>>          int i, j;
>>> -       int cur_slots = 1;
>>> +       int cur_slots = mgr->start_slot;
>>>          bool skip;
>>>            mutex_lock(&mgr->payload_lock);
>>> @@ -4321,7 +4321,7 @@ int drm_dp_find_vcpi_slots(struct
>>> drm_dp_mst_topology_mgr *mgr,
>>>          num_slots = DIV_ROUND_UP(pbn, mgr->pbn_div);
>>>            /* max. time slots - one slot for MTP header */
>>> -       if (num_slots > 63)
>>> +       if (num_slots > mgr->total_avail_slots)
>>>                  return -ENOSPC;
>> For reasons I will explain a little further in this email, we might 
>> want to
>> drop this…
>>
>>>          return num_slots;
>>>   }
>>> @@ -4333,7 +4333,7 @@ static int drm_dp_init_vcpi(struct
>>> drm_dp_mst_topology_mgr *mgr,
>>>          int ret;
>>>            /* max. time slots - one slot for MTP header */
>>> -       if (slots > 63)
>>> +       if (slots > mgr->total_avail_slots)
>> …and this
>>
>>>                  return -ENOSPC;
>>>            vcpi->pbn = pbn;
>>> @@ -4507,6 +4507,18 @@ int drm_dp_atomic_release_vcpi_slots(struct
>>> drm_atomic_state *state,
>>>   }
>>>   EXPORT_SYMBOL(drm_dp_atomic_release_vcpi_slots);
>>>   +void drm_dp_mst_update_coding_cap(struct drm_dp_mst_topology_state
>>> *mst_state, uint8_t link_coding_cap)
>> Need some kdocs here
>>
>>> +{
>>> +       if (link_coding_cap == DP_CAP_ANSI_128B132B) {
>>> +               mst_state->total_avail_slots = 64;
>>> +               mst_state->start_slot = 0;
>>> +       }
>>> +
>>> +       DRM_DEBUG_KMS("%s coding format on mgr 0x%p\n",
>>> +                       (link_coding_cap == DP_CAP_ANSI_128B132B) ?
>>> "128b/132b":"8b/10b", mst_state->mgr);
>> need to fix indenting here, and wrap this to 100 chars
>>
>>> +}
>>> +EXPORT_SYMBOL(drm_dp_mst_update_coding_cap);
>>> +
>>>   /**
>>>    * drm_dp_mst_allocate_vcpi() - Allocate a virtual channel
>>>    * @mgr: manager for this port
>>> @@ -4538,8 +4550,8 @@ bool drm_dp_mst_allocate_vcpi(struct
>>> drm_dp_mst_topology_mgr *mgr,
>>>            ret = drm_dp_init_vcpi(mgr, &port->vcpi, pbn, slots);
>>>          if (ret) {
>>> -               drm_dbg_kms(mgr->dev, "failed to init vcpi slots=%d 
>>> max=63
>>> ret=%d\n",
>>> -                           DIV_ROUND_UP(pbn, mgr->pbn_div), ret);
>>> +               drm_dbg_kms(mgr->dev, "failed to init vcpi slots=%d 
>>> max=%d
>>> ret=%d\n",
>>> +                           DIV_ROUND_UP(pbn, mgr->pbn_div), mgr-
>>>> total_avail_slots, ret);
>>>                  drm_dp_mst_topology_put_port(port);
>>>                  goto out;
>>>          }
>>> @@ -5226,7 +5238,7 @@ drm_dp_mst_atomic_check_vcpi_alloc_limit(struct
>>> drm_dp_mst_topology_mgr *mgr,
>>>                                           struct 
>>> drm_dp_mst_topology_state
>>> *mst_state)
>>>   {
>>>          struct drm_dp_vcpi_allocation *vcpi;
>>> -       int avail_slots = 63, payload_count = 0;
>>> +       int avail_slots = mgr->total_avail_slots, payload_count = 0;
>>>            list_for_each_entry(vcpi, &mst_state->vcpis, next) {
>>>                  /* Releasing VCPI is always OK-even if the port is 
>>> gone */
>>> @@ -5255,7 +5267,7 @@ drm_dp_mst_atomic_check_vcpi_alloc_limit(struct
>>> drm_dp_mst_topology_mgr *mgr,
>>>                  }
>>>          }
>>>          drm_dbg_atomic(mgr->dev, "[MST MGR:%p] mst state %p VCPI 
>>> avail=%d
>>> used=%d\n",
>>> -                      mgr, mst_state, avail_slots, 63 - avail_slots);
>>> +                      mgr, mst_state, avail_slots, 
>>> mgr->total_avail_slots -
>>> avail_slots);
>>>            return 0;
>>>   }
>>> @@ -5421,6 +5433,10 @@ int drm_dp_mst_atomic_check(struct 
>>> drm_atomic_state
>>> *state)
>>>                          break;
>>>                    mutex_lock(&mgr->lock);
>>> +
>>> +               mgr->start_slot = mst_state->start_slot;
>>> +               mgr->total_avail_slots = mst_state->total_avail_slots;
>>> +
>> this isn't correct - atomic checks aren't allowed to mutate anything 
>> besides
>> the atomic state structure that we're checking since we don't know 
>> whether or
>> not the display state is going to be committed when checking it. If 
>> we're
>> storing state in mgr, that state needs to be written to mgr during 
>> the atomic
>> commit instead of the atomic check.
>>
>> ...but, coming back to this MST code after being gone for a while, I 
>> think it
>> might be time for us to stop worrying about the non-atomic state. 
>> Especially
>> since there's only one driver using it; the legacy radeon.ko; and 
>> right now
>> the plan is either to just drop MST support on radeon.ko or move the 
>> MST code
>> it uses into radeon.ko.Which brings me to say - I think we can drop 
>> some of
>> the hunks I mentioned above (e.g. the changes to drm_dp_init_vcpi and
>> drm_dp_find_vcpi_slots I mentioned above). We can then just update 
>> the kdocs
>> for these functions in a separate patch to clarify that now in 
>> addition to
>> being deprecated, these functions are just broken and will eventually be
>> removed.
>>
>> So - doing that allows us to get rid of mgr->total_avail_slots and mgr-
>>> start_slot entirely, just set the slot info in the atomic state 
>>> during atomic
>> check, and then just rely on the atomic state for
>> drm_dp_atomic_find_vcpi_slots() and friends. Which seems much simpler 
>> to me,
>> does this sound alrght with you?
>
> Thanks for the response,
>
> That function is per port (drm_dp_atomic_find_vcpi_slots) so not sure 
> how that will work, maybe I don't understand what you mean?
>
> Also we only need to check this inside 
> drm_dp_mst_atomic_check_vcpi_alloc_limit(), which doesn't have a 
> state, so we still need to have this on the mgr somehow.
>
> I was thinking we could add the slots(or some DP version indicator) 
> inside the drm_connector, and add a parameter to 
> drm_dp_mst_atomic_check_vcpi_alloc_limit(int slots) and call it with 
> this info via drm_dp_mst_atomic_check().
>
>
> Bhawan
>
>>
>>>                  ret = drm_dp_mst_atomic_check_mstb_bw_limit(mgr-
>>>> mst_primary,
>>> mst_state);
>>>                  mutex_unlock(&mgr->lock);
>>> @@ -5527,11 +5543,16 @@ int drm_dp_mst_topology_mgr_init(struct
>>> drm_dp_mst_topology_mgr *mgr,
>>>          if (!mgr->proposed_vcpis)
>>>                  return -ENOMEM;
>>>          set_bit(0, &mgr->payload_mask);
>>> +       mgr->total_avail_slots = 63;
>>> +       mgr->start_slot = 1;
>>>            mst_state = kzalloc(sizeof(*mst_state), GFP_KERNEL);
>>>          if (mst_state == NULL)
>>>                  return -ENOMEM;
>>>   +       mst_state->total_avail_slots = 63;
>>> +       mst_state->start_slot = 1;
>>> +
>>>          mst_state->mgr = mgr;
>>>          INIT_LIST_HEAD(&mst_state->vcpis);
>>>   diff --git a/include/drm/drm_dp_mst_helper.h
>>> b/include/drm/drm_dp_mst_helper.h
>>> index ddb9231d0309..f8152dfb34ed 100644
>>> --- a/include/drm/drm_dp_mst_helper.h
>>> +++ b/include/drm/drm_dp_mst_helper.h
>>> @@ -554,6 +554,8 @@ struct drm_dp_mst_topology_state {
>>>          struct drm_private_state base;
>>>          struct list_head vcpis;
>>>          struct drm_dp_mst_topology_mgr *mgr;
>>> +       u8 total_avail_slots;
>>> +       u8 start_slot;
>>>   };
>>>     #define to_dp_mst_topology_mgr(x) container_of(x, struct
>>> drm_dp_mst_topology_mgr, base)
>>> @@ -661,6 +663,16 @@ struct drm_dp_mst_topology_mgr {
>>>           */
>>>          int pbn_div;
>>>   +       /**
>>> +        * @total_avail_slots: 63 for 8b/10b, 64 for 128/132b
>>> +        */
>>> +       u8 total_avail_slots;
>>> +
>>> +       /**
>>> +        * @start_slot: 1 for 8b/10b, 0 for 128/132b
>>> +        */
>>> +       u8 start_slot;
>>> +
>>>          /**
>>>           * @funcs: Atomic helper callbacks
>>>           */
>>> @@ -806,6 +818,7 @@ int drm_dp_mst_get_vcpi_slots(struct
>>> drm_dp_mst_topology_mgr *mgr, struct drm_dp
>>>     void drm_dp_mst_reset_vcpi_slots(struct drm_dp_mst_topology_mgr 
>>> *mgr,
>>> struct drm_dp_mst_port *port);
>>>   +void drm_dp_mst_update_coding_cap(struct drm_dp_mst_topology_state
>>> *mst_state, uint8_t link_coding_cap);
>>>     void drm_dp_mst_deallocate_vcpi(struct drm_dp_mst_topology_mgr 
>>> *mgr,
>>>                                  struct drm_dp_mst_port *port);

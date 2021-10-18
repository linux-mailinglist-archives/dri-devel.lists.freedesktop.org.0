Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B754327ED
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 21:47:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 421BC6EA67;
	Mon, 18 Oct 2021 19:47:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2080.outbound.protection.outlook.com [40.107.223.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D40646EA67
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 19:47:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PMoWuhKcC1xwuBeRadayO+UJq53RkGmCqred35Qad3tUGjOMuo5jpzHViJEBkuxDCouedpIJeGC6FKxytxbe7YJvITCUngMd32qhW4VRoA9XeI+sA3dgyuCz52OXoCHMgeryzu9Sy1bo4B6CE+x9QuxwnVXEUuG1uHkWC3EvPbAii6Ug0/t8sCh740ztFycoJcdb66lr0Km5i6JOJw6V5njNyCNTmq6buqJuB4xOPU+qXERXlxz/SEWNWaOO7G1JYDbttq5SuczhHl3ixF6xjHXsE8tjSyNXqxrAn5EwZjowMO0p+t1PPjdQo9Hab1aWXF1RsCkclTWcIlswvrzHbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D37sA/zAmWcbAYJggj2+BDVq0br5cKj4sk9kTxqhAqU=;
 b=bGxVLSHRRLNePGeVDUlEiyUZM68oIjE1NKKE/QhlO7XxSYhGz0UkZu7pgaPm/x3d2y0LxiR/WGIVgxKBj80HCbZoG9pulGYUbl9qejx61Oo3jSymkuRLkzCr/DrCdrBDuY7yJ2jWlmTPZKbHMa5xDm6QmbvgG3kMuCYynrH2N6MR9Q8kfCantng2Tv6hRd6NMNnsVU/BVVl+ljRZnk+MsOlJ1ZGCFM0/UzfRPfYQZnw9/8tLRj7qTol2DTJXTMrnX6MPDatzQN1FszWyCuNjMtDtgl/cln3x8zzabWhWR0rVaxk8eiByQ7eUXdZsTinTLdj7w74vD6v1m6ntDoK18Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D37sA/zAmWcbAYJggj2+BDVq0br5cKj4sk9kTxqhAqU=;
 b=Hp4/MDosvi504pcLyEnrc5GWsyzAUN9lJMUSr2ns5XfdhHnxyVjn/WBbZwbDDTRC+OrMbzd+IzJNQRAj1Afo5/nM1NR9aXTlUI8zcBtvTvKEUJ4HHrxQskK6fCfXXBLmooJj8Qy61Gjm67NSELX4/HUVS1/rfLG2H/woNgBAgXE=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4554.namprd12.prod.outlook.com (2603:10b6:303:55::21)
 by MW2PR12MB4684.namprd12.prod.outlook.com (2603:10b6:302:13::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Mon, 18 Oct
 2021 19:47:08 +0000
Received: from MW3PR12MB4554.namprd12.prod.outlook.com
 ([fe80::700d:46f0:61ab:9c1c]) by MW3PR12MB4554.namprd12.prod.outlook.com
 ([fe80::700d:46f0:61ab:9c1c%9]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 19:47:08 +0000
Subject: Re: [PATCH] drm: Update MST First Link Slot Information Based on
 Encoding Format
To: Lyude Paul <lyude@redhat.com>, Jerry.Zuo@amd.com,
 dri-devel@lists.freedesktop.org
Cc: Harry.Wentland@amd.com, Wayne.Lin@amd.com, Nicholas.Kazlauskas@amd.com,
 "Lipski, Mikita" <Mikita.Lipski@amd.com>
References: <5e463fbc3d633eea1078e838ba5be0065ffbeb1e.camel@redhat.com>
 <20211012215848.1507023-1-Bhawanpreet.Lakha@amd.com>
 <3fbf786ee687e57cab02d71c745d01fb39819cba.camel@redhat.com>
 <8fb410e5-3b47-d0a7-6d73-3b6692429e10@amd.com>
 <2a71120b01c96c942cdaba4ad6c0a0bbbd2d91e2.camel@redhat.com>
From: Bhawanpreet Lakha <Bhawanpreet.lakha@amd.com>
Message-ID: <7e2abaa7-ca3a-6da9-6e43-772ce287f674@amd.com>
Date: Mon, 18 Oct 2021 15:47:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <2a71120b01c96c942cdaba4ad6c0a0bbbd2d91e2.camel@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YT2PR01CA0008.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::13) To MW3PR12MB4554.namprd12.prod.outlook.com
 (2603:10b6:303:55::21)
MIME-Version: 1.0
Received: from [IPv6:2607:fea8:9dd:3f70::90be] (2607:fea8:9dd:3f70::90be) by
 YT2PR01CA0008.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:38::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.16 via Frontend Transport; Mon, 18 Oct 2021 19:47:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 65c87385-e47d-4619-dd49-08d9927011d4
X-MS-TrafficTypeDiagnostic: MW2PR12MB4684:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW2PR12MB4684A9FE6829492D22977CBAF9BC9@MW2PR12MB4684.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P7u/KGyP1FkGMzbR81MGGuZXcB8rEaC0pv4vt9FGBXk1OYTfIdpkyEchIxvBXE0yj1apGtf87MRpuHHauerIJc6XWG4lCehKMuk/gPme9Sh3brb11nIMpvZuc4bOEXxJX6v5NgtTR6EUY9zpu2Bnmp3FKQzbvwpdUEzMJtWq0KdGbbppckOMDYwhKcYOpcOd7DnzqtLQ1aqZYU1iWyTva3GRxsjGP37x0aNqTqxgRsR8MuF0f77oK2MiKv1y5J8erT/4fmys8dKnb4YURCblwuFGNVuC/4yoXw3L3hIpgDDO4JE3BwaMGR3PvmFe2nXVG7VA4Wqr5NtPYVRl9yuFMGwOzKxKtqofTgfv6yQLt6wWr7t31WUqNjagk4cdM/gB/5icG1m5MostqAOBugYUJ/2Ga/vzJty8ohIQomYSYXPTTjG6XR2OsdC7PNVszJX7CMIkuvEiUtg4cIv0fhKQdheSFikmNVw3LYOrctnGfBBzkCs0gi8UdSqLaYS/AdzZZ9zYER9COVTyHXXOQkzlBa0o1DLmQFN6ekFa5g9MA5mucZ0FEWdYOomi5xFEBjVoRuC/t4L4IV2d6MoRdn4hVeOhuswai9aXXCe/dp1HI4viQZ99FYbSSLz+YzIGAYHSk0wgdD8OCyPtd6KI6qY+cvX4n55sF/9SLZKFZhR2PSmBtJg3sPq8DJLi4sEYScvFtuTaX5qwm2bl+pynOkFR5HONv8orNEcNl7XGW0HRKNM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR12MB4554.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(53546011)(5660300002)(86362001)(83380400001)(4326008)(2906002)(4001150100001)(38100700002)(36756003)(316002)(508600001)(8936002)(15650500001)(2616005)(31686004)(186003)(31696002)(6486002)(66946007)(66556008)(8676002)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OHk2cFI1NWZiSm5ZZXFZUDk1S2ViVmNiK1Q0NWVIcVpjTElOU2VidEs4WXJ4?=
 =?utf-8?B?RHVkbVZoN3hjZy80MUZPM3lLSlRjR3JoOHBtZnc3ZHpjdmtjZG9qaDdDTDhk?=
 =?utf-8?B?M0dnSnZJRmlLMDVvNWJKYThpdkRGOXhPZmNEQTcrTVRSVFpLTU9CUDB5NTBD?=
 =?utf-8?B?ald4bzdNNVgzR3VSUjdIWVdRMXJGYjhhREJVUCtyK0JGV09HdWhjQWs3TEp6?=
 =?utf-8?B?RnVHMW9COFBIOCtVbUFJZTA4djZsNVlkWEZwQStRY25lbFBKWTVQUVkrWi9Y?=
 =?utf-8?B?cXhxbWwwM2FDaVVUNVdtMHVqZ0pvbG40M3d0d1pHdlJKUEp3djFNNWpkUDVF?=
 =?utf-8?B?YzhGRkpqUnU2WHlTNk40K3FwNVVTSzUrcVJnOUZteld6Zkp3WElUa0xwbTgr?=
 =?utf-8?B?ZGw3T3kvRWtiM3lmRUs0MW1FTzNDV3ZaN3BKcmlCaitIdDdqMjlxOWdBaHZy?=
 =?utf-8?B?c2JkVHlpMFAwT0JFckpRY3Z4QlhiQ0hQWjJHdjJZSTFvVHp4dTJxcXVQdzdj?=
 =?utf-8?B?bUMzS2dBOHJ2V1Y2cmY3WnREdHMvRHJjdHZYSGpabGJZSTdOTGNLRGhDeU0w?=
 =?utf-8?B?WGZnbzc0anZvMmlxdjhCRkZVUnNZblZadFIwSVpTekJGcFhjMzJsMXhCenNy?=
 =?utf-8?B?N3VCRGJKTWVYQ2p2aFpnb3R1eEQxTVVteCt4YUdRT2Q1dk5mSW1DSGsrOUxR?=
 =?utf-8?B?QjBhbjI4TUxIamV0OGo2ZTBXc0k3YndPbkdSQ0E2bllKNzVNVjRMVmFoT2FT?=
 =?utf-8?B?LzIrWXpDSTJKclFNT3liVnlzV0F5dHFOZzA0TVdmTkM4LzQ2andqTis5Vm52?=
 =?utf-8?B?ZFBOYUpvcCtSYjZqSWoydElnZHA3WGwwUGphK2pyS0tKN3J4YTRBbVdLSW1l?=
 =?utf-8?B?NlBSTjkyQjM2cjNUMG14UmRRYnZzS3hoVW5lQnFpSUN2UFNpYTBpdWFtSFlC?=
 =?utf-8?B?VFAydkNEUzIvczNGUVdPMXIxUXhNcSswMTlZVVRPUTJ2cWZwMTQ0SW12bnJz?=
 =?utf-8?B?NUR1SkZtdXB2cXFmOVYrcWIvRVp5VTJmbDIwVHN3WDJZZThHd2xoblBmTFUz?=
 =?utf-8?B?RXNnQmhUTVNhWUJDSWJmdDBXVWtmZTQxTnM5SXpaQTlEUzlPcHJiVjljcjJv?=
 =?utf-8?B?K0h5aG1zU2c0Q0dQSk92TjlBa253T3diNENtc24yR1NWVGVqaHhJWm1POUdv?=
 =?utf-8?B?a2NUdUxCa0Y2T3FpWUpRRjJaSDA5dHVoZjVodTdTZEdWMUwremFnYUFRaGNt?=
 =?utf-8?B?QjFua0gva2FucDNVcGtDYVQ4QXpLaWRSajJUYjR2SzdVVE5EeG52dExUQkFs?=
 =?utf-8?B?UUMzc0ttZ0lhK1dVcXdneGxZQ3dVS0FZZXdSR1dYbDduNCtjSFNiYjZDOU83?=
 =?utf-8?B?MlZOR2RKKzBQYjN1bCtvRXNJNHkwWWVXN1FHS1pPTVhUV3dGNjVQaGhBUXZu?=
 =?utf-8?B?R05laUdScWRVMldGYkJZSGJyTE9zN1dyNFB4K2VNbUwzNTIzeGt0eFRRckp0?=
 =?utf-8?B?N1NCUHlHVXM4Q1I4VXpIc2hzbmhSalIxUTZmWVhrcDM4b3RNSy9jdE1meGdm?=
 =?utf-8?B?ZkdCSDF5SC9pdnNPT2pzcitlcDFDd0hBZDk1bEJxdHB5azVwRldQM1pIL0pG?=
 =?utf-8?B?aWp6OU9QUkdUMG55YjFxZmczM3dJempyT0hqNWcxdUN4cTRBSmEvRXMzZEZD?=
 =?utf-8?B?a0dkVndydnQydFdaS1ZPdmtTSHI0djFralhBaEJFRDRZUHlUaU50VGllWEtC?=
 =?utf-8?B?a3FjdmtNaDdvejJtU0k1TGpkN1ZWMk41S2pQUnlxcVpydTdZdXpBL3VEejZI?=
 =?utf-8?B?OE82MlBDaDQ2VG1WNFM5dz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65c87385-e47d-4619-dd49-08d9927011d4
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4554.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 19:47:08.5350 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xr7kQ+nyDKH0kUnIK9OSHNfVGpvTyXRSj+7W+2P0I+J8/trzaJ/e1ZM06SChdNCv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB4684
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

I understand the mst_state argument its just that most of the mst 
functions are using mst_mgr/port structs and there is no easy way to 
extract the mst_state using mgr/port in these places 
(drm_dp_update_payload_part1, drm_dp_mst_allocate_vcpi, drm_dp_init_vcpi 
etc) where we need the slot info.

So either we need to keep a copy of the slots in the mgr because that's 
what most of the code is using right now or pass around the atomic state 
to get the mgr->state mapping. (I don't have much experience with the 
mst code so maybe I am missing some key detail here?)


Thanks,

Bhawan


On 2021-10-15 4:41 p.m., Lyude Paul wrote:
> [more snip]
>
> On Fri, 2021-10-15 at 15:43 -0400, Bhawanpreet Lakha wrote:
>> Thanks for the response,
>>
>> That function is per port so not sure how that will work. Also we only
>> need to check this inside drm_dp_mst_atomic_check_vcpi_alloc_limit(),
>> which doesn't have a state.
>>
>> We could add the slots(or some DP version indicator) inside the
>> drm_connector, and add a parameter to
>> drm_dp_mst_atomic_check_vcpi_alloc_limit(int slots)? and call it with
>> this info via drm_dp_mst_atomic_check() and then update the mgr->slot in
>> commit.
> TBH - I think we can actually just get away with having all of this info in
> drm_dp_mst_topology_state
>
>>
>> Bhawan
>>
>>>>                   ret = drm_dp_mst_atomic_check_mstb_bw_limit(mgr-
>>>>> mst_primary,
>>>>                                                               mst_state);
>>>>                   mutex_unlock(&mgr->lock);
>>>> @@ -5527,11 +5543,16 @@ int drm_dp_mst_topology_mgr_init(struct
>>>> drm_dp_mst_topology_mgr *mgr,
>>>>           if (!mgr->proposed_vcpis)
>>>>                   return -ENOMEM;
>>>>           set_bit(0, &mgr->payload_mask);
>>>> +       mgr->total_avail_slots = 63;
>>>> +       mgr->start_slot = 1;
>>>>    
>>>>           mst_state = kzalloc(sizeof(*mst_state), GFP_KERNEL);
>>>>           if (mst_state == NULL)
>>>>                   return -ENOMEM;
>>>>    
>>>> +       mst_state->total_avail_slots = 63;
>>>> +       mst_state->start_slot = 1;
>>>> +
>>>>           mst_state->mgr = mgr;
>>>>           INIT_LIST_HEAD(&mst_state->vcpis);
>>>>    
>>>> diff --git a/include/drm/drm_dp_mst_helper.h
>>>> b/include/drm/drm_dp_mst_helper.h
>>>> index ddb9231d0309..f8152dfb34ed 100644
>>>> --- a/include/drm/drm_dp_mst_helper.h
>>>> +++ b/include/drm/drm_dp_mst_helper.h
>>>> @@ -554,6 +554,8 @@ struct drm_dp_mst_topology_state {
>>>>           struct drm_private_state base;
>>>>           struct list_head vcpis;
>>>>           struct drm_dp_mst_topology_mgr *mgr;
>>>> +       u8 total_avail_slots;
>>>> +       u8 start_slot;
>>>>    };
>>>>    
>>>>    #define to_dp_mst_topology_mgr(x) container_of(x, struct
>>>> drm_dp_mst_topology_mgr, base)
>>>> @@ -661,6 +663,16 @@ struct drm_dp_mst_topology_mgr {
>>>>            */
>>>>           int pbn_div;
>>>>    
>>>> +       /**
>>>> +        * @total_avail_slots: 63 for 8b/10b, 64 for 128/132b
>>>> +        */
>>>> +       u8 total_avail_slots;
>>>> +
>>>> +       /**
>>>> +        * @start_slot: 1 for 8b/10b, 0 for 128/132b
>>>> +        */
>>>> +       u8 start_slot;
>>>> +
>>>>           /**
>>>>            * @funcs: Atomic helper callbacks
>>>>            */
>>>> @@ -806,6 +818,7 @@ int drm_dp_mst_get_vcpi_slots(struct
>>>> drm_dp_mst_topology_mgr *mgr, struct drm_dp
>>>>    
>>>>    void drm_dp_mst_reset_vcpi_slots(struct drm_dp_mst_topology_mgr *mgr,
>>>> struct drm_dp_mst_port *port);
>>>>    
>>>> +void drm_dp_mst_update_coding_cap(struct drm_dp_mst_topology_state
>>>> *mst_state, uint8_t link_coding_cap);
>>>>    
>>>>    void drm_dp_mst_deallocate_vcpi(struct drm_dp_mst_topology_mgr *mgr,
>>>>                                   struct drm_dp_mst_port *port);

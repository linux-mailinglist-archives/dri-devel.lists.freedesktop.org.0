Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3722A3A319F
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 19:00:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA5B06E3D0;
	Thu, 10 Jun 2021 17:00:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2079.outbound.protection.outlook.com [40.107.101.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1EE56E3D0
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 17:00:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KYby6pK1uj8uQlUO45CnnZAbFBJPlpweKVk9FxdH9Bx+KLbCeyGYPh0Q8Ik6jYaKt2oJqkyuiY5WkmhzeTvzOYnzW6NTEG33Fxdtdkm6NvmDKME1vCFPhRjoKHfCRmim7pYLUNM8wxZJX8XCGifTDEy9L5TCI4hgumxTTEV/37Jtn5dSSNANAbWm1ioJJt9G/kBvASehw5QhxvOex6YyuQQygf87nXvPEXXTqpJlA4AgIzDChTBW3/kX4E1GhOhu1Niy2SVVkbuC+rICKvJPzmgd1XmWcztLZK8g/9QDWCyv3r01DsxNZaugoAEFNoc55g8J7TNlv1mjeTYyTt4fxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kiZmEaAiNZQQnDMkV/cgjibeZ8qxGsjVpmESQE2pUeE=;
 b=kI14p453T3Yp+WQH6OxtmRDv/2d+SdASS67ANvlrWAcoaQsiWxs0kjUrfRtDAQYEGKLNxv7+8kL6AFCvD6MooiHUYOCLZxOlxdbJnRCaW775QpqfcamOyc+ZvW6VoqHdysfdws5T0w0jux73dMcaiXixXFv9+2U9kPB9T0l9ZmRl9kgxOru22zlizoo35cv2xWVP4FpUHDQhzvei3c4gGYKzwhLLtolB2bnb43CxMmx9dphwFVpQvTTiMEgFcd6EnAHoCati57yuxFJ5b03AxaA3Tb84/dflN99j8rGn9MECdz3eRarulbVoNYyEFhmYjVltczx0QI91tUviVOm0aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kiZmEaAiNZQQnDMkV/cgjibeZ8qxGsjVpmESQE2pUeE=;
 b=B489Y+ogE8JtZptPr1aYVelYtvMiFPDM7wn748c0Zs4Fl+fMyjjQ8W2luak0xe8TscPYVWgMjwIMwOX3gDc7OfOAnh1F6qyVMNvemS6iCw+8POrkTycehyzdXZPkuf/HXXbAomaazz+I+LQD0Oapis8XEelqkYOSnUxg65qaKWA=
Authentication-Results: vmware.com; dkim=none (message not signed)
 header.d=none;vmware.com; dmarc=none action=none header.from=vmware.com;
Received: from MN2PR05MB6624.namprd05.prod.outlook.com (2603:10b6:208:d8::18)
 by BLAPR05MB7331.namprd05.prod.outlook.com (2603:10b6:208:292::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.10; Thu, 10 Jun
 2021 17:00:02 +0000
Received: from MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::45fe:a746:21e9:e8fc]) by MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::45fe:a746:21e9:e8fc%6]) with mapi id 15.20.4219.022; Thu, 10 Jun 2021
 17:00:02 +0000
Subject: Re: [PATCH 3/9] drm/vmwgfx: Fix subresource updates with new contexts
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 dri-devel@lists.freedesktop.org
References: <20210609172307.131929-1-zackr@vmware.com>
 <20210609172307.131929-4-zackr@vmware.com>
 <4c17b92c-2f06-13a6-95e0-45c419ec088b@shipmail.org>
From: Zack Rusin <zackr@vmware.com>
Message-ID: <53a5a5c9-e8bd-7f7e-8893-d304bec746b5@vmware.com>
Date: Thu, 10 Jun 2021 12:59:59 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <4c17b92c-2f06-13a6-95e0-45c419ec088b@shipmail.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [108.36.85.85]
X-ClientProxiedBy: BL0PR02CA0026.namprd02.prod.outlook.com
 (2603:10b6:207:3c::39) To MN2PR05MB6624.namprd05.prod.outlook.com
 (2603:10b6:208:d8::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.193] (108.36.85.85) by
 BL0PR02CA0026.namprd02.prod.outlook.com (2603:10b6:207:3c::39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.20 via Frontend Transport; Thu, 10 Jun 2021 17:00:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 82535cbb-5f0e-4f32-2a29-08d92c312fce
X-MS-TrafficTypeDiagnostic: BLAPR05MB7331:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BLAPR05MB73318223B7935E8C12EDD0A5CE359@BLAPR05MB7331.namprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:265;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MWlbO1mAF4hb7S0XHfFiUblhxWcRsBRNiyBLORHIhfDjiVAF2cEk4fp6urBAib2GyV2oCErs0C7whdNqM7JYkIXE0oiQK/gypfOa9bp5miZUHnUw2ZGhy70MqiIrsP2Un3dZmuVXinK7s+URgEFRV2fw5y0HPUYZ5FJY7E2QGvr8Zg9B0Fm+SVjqbYjQ9iX7u1Qyr+GTJGZ7hL/BCzYu5gxY3yIwGM4IHkpmG4CaL+jcEwxgBEOv8mXZFixu0655otBDXyv0XcUs3Zs/AER0HGML2eO8v4ETdksMalemwK21S+k/MybvQkV+QwCh+LBsdrr5j2SR7kMQLjppT38w02LAHOWyXbNo3pfkBh6npvtiN9s1KQbKo1UApcXq6ydVdWJ8PaGzP7S43WJEXW9YiwV7g9OV5jujWAmpu9rsXetEEgj2gHEDSW6qFqjTGU8RMDCWlloPklIroMoZWx4H7HJZrpzOGafvLm//eI2bQRN3qrOXXxL7t+Y4LFaOrCKe2X5B3794Dlf5y6UAqQh+QB2o+eb7pIDP9ar93Vv3PwutjdTTcEDHq+/8rQ+X4vweTD6TieBukJsWDWSuM+X5xNimdOq2/WTXW+NZ4KULIr9wL9RUv9A+atQI5PTbAFwhj8XZO5ib4IF02XWKJQPtui7XASXrdTtnYWNV/bOmMYqO2GUh4cW2a3JIXpaNaStZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR05MB6624.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(346002)(376002)(39860400002)(136003)(8676002)(8936002)(86362001)(31696002)(54906003)(53546011)(16576012)(316002)(4326008)(956004)(107886003)(6486002)(38100700002)(16526019)(186003)(31686004)(66574015)(2616005)(66476007)(66556008)(66946007)(36756003)(15650500001)(26005)(2906002)(478600001)(83380400001)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N3ZZWFQrODBOUXp5VjBKR1JrSkY0TU94RXNtQmFnWXlDVURzRGVnMUFvbzN6?=
 =?utf-8?B?anFQdkhScytwbHBGWXZRanF0RWJWaGlwM2M2T0x0SGI5SXJJNGNMbW1weGUr?=
 =?utf-8?B?NElDRVRHS3g5QWY3SkFsa2szazJaRlI0UldORUtHYkkzV2RSMlhLM21CYnBi?=
 =?utf-8?B?NGc1ZHIwTnpMYVBqd1A5SmJGSVRmV2MyYnJJSjI0Ti90VXBGck1ISHVTMWJQ?=
 =?utf-8?B?RVBlais4Z2crcHp1R2tOeWo4TVpzcmc0SE9Eb3ZMTFk3RmtqdUQ4LytNN1RL?=
 =?utf-8?B?N0syYXJIRFRkUjZQb1RkQjI2dVRkZ21UQUsvUk9xUURGNkhKaGpnMmY2Y0E3?=
 =?utf-8?B?T0dUYVhvbzI5OUlFR3ZxQ3hFKzRQYVFRK25pMGtpenZzaFhBN01SV1d0Tkt1?=
 =?utf-8?B?VGFaSHNoRU4rYmpidTVjdjl3dzY2aXlQWVZVTkVRai9qV3BKd1lDTmhVUEtW?=
 =?utf-8?B?UXlEd0dpbXFlbXczd3ArbUtBRDNqejRJR2Q2WjZOb21tNDVQdDkwLzdkRVNx?=
 =?utf-8?B?c05rc2t2bS80aldRYWxmWWxJRGVtVzF4Mkg2WVdnRVAvemhvRlUveWFsS2ho?=
 =?utf-8?B?L2pLQmdOZHNlRis2YlFjRGFkdTBrVDFtVFVLeFo1U1dWVkZZajlnbDB5MGR5?=
 =?utf-8?B?QTI1RExDcWhGTUVXWS9YamJVazJrcmpwQ3ZwajZpZEwwaVYyNVBLTUMvc1VX?=
 =?utf-8?B?aUtWTUZvSXgvbXpTN2F3ZXZIUENsTW5JcFhGUncwY2UvK0lLTEhsTWZaMGtz?=
 =?utf-8?B?aElZbHVrTU9qSE5XYU9DVStiN1pkZkZWSXdNWFJEZ1cxazNwM2ZvdUpSbm5J?=
 =?utf-8?B?Y2JiM2c4TkZkRWdub3hhL2NjNUJKYUZISjZhWTh1UDlCYi84YTg3MjA0MU9K?=
 =?utf-8?B?Wlh1aWxoTzgzRk1hSFpVa2x5czBBWlc1TXh3SE1TN1YyNWo3VEpmVWxZeW00?=
 =?utf-8?B?NG9QVjQ5RlAxZ2swNkdKSXFLZCtzU1VOQzY5a2FpU1lsZTBmY0psRU1aUit0?=
 =?utf-8?B?bFM3bW9xUTBjSU1rekgyT0s2cGE4Nm1VcUN0K2VTRkVjNitTa284QXNDMzRt?=
 =?utf-8?B?TWMyVVE2VWRhZlhLU2p3TzJmc1NmcTAwNW9LYy8zS0Z2T0xVL1Y3dDVSUENk?=
 =?utf-8?B?T0RLdDFFS24vK1B1bWxMbWoza25pcW5RK1hQdHNodXlZSnFocjZGOEFibnpJ?=
 =?utf-8?B?SkxoaHdpd1BveGtjelVJTGJUMFl5NXZVdFhOUUNZeUZ0Ui9SaGUyZWc3TkNF?=
 =?utf-8?B?bS91cmlUVm9kUmRCKzVvbjM5cnVkNjRMeXdwR1JLdGx4VHZFbmlmTkszc3N0?=
 =?utf-8?B?UWg2ZE1LWkdWYXFPaldVUU5QcE1GbWdadWxNM3R2UlhjekVpZjUyTVlmVzNP?=
 =?utf-8?B?T3FtdjRXb1JQV3l3Yi9NT1ZOeUJCOWN4U1NOc3lIMGFBUzdULy9hZUhSWWtX?=
 =?utf-8?B?N01adXBPY2RtaGJoRzlld29xTkpDdHBDaVZMbDFpZ2JleTZHTXFOUjJETnBZ?=
 =?utf-8?B?UG9nWW1wV2VaaTZZSFNIMEhnR1hieUtOcDZaUzc4cmxZMy8zQitkYUpFQTBU?=
 =?utf-8?B?VkRLbDVTdnRLQldrcHlPcDhVbi91YWp3UXpGSHNIS1JWdm9TTTRwU1FERWxt?=
 =?utf-8?B?RmlTOS9jZ1M4VTBQaVhzbnpMQzdINjFseTdiZ3I0Z2ZTU21mVkVqcWd4R1Ji?=
 =?utf-8?B?enFzY1BIc1dUQTI1R1JzUnYrakx6UU9TNTltZUFvcHBZMHhad0hZbjFPZWdq?=
 =?utf-8?Q?1i2LMRUQVuUtbol0OLEcUFy9vj31xo/ImbMInWD?=
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82535cbb-5f0e-4f32-2a29-08d92c312fce
X-MS-Exchange-CrossTenant-AuthSource: MN2PR05MB6624.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 17:00:02.3282 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mIDNNKUO5YiQVU5VSAKuakE+d7aZdLsfJjWAmESSRHdO+v6/Er+SrqaU8CInUHmbKoCSokWzjQurpnpt9pVqNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR05MB7331
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
Cc: Martin Krastev <krastevm@vmware.com>,
 Roland Scheidegger <sroland@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/10/21 2:49 AM, Thomas Hellström (Intel) wrote:
> Hi,
> 
> On 6/9/21 7:23 PM, Zack Rusin wrote:
>> The has_dx variable was only set during the initialization which
>> meant that UPDATE_SUBRESOURCE was never used. We were emulating it
>> with UPDATE_GB_IMAGE but that's always been a stop-gap. Instead
>> of has_dx which has been deprecated a long time ago we need to check
>> for whether shader model 4.0 or newer is available to the device.
> 
> Stupid question perhaps, but isn't UPDATE_SUBRESOURCE available with SVGA_CAP_DX regardless of the SM capabilities of the underlying device?

It is, but the extra functionality it provides is a bit pointless on older contexts. In general we're trying to bundle the features in something more resembling the windows side, that's not for the purpose of the guest but host side or more specifically so that the stack is more coherent and vmwgfx isn't doing something uncommon (i.e. using dx10 features with CAP_DX but without CAP_DXCONTEXT) where renderers might be asked to do something they've never been tested for.

We've overloaded the shader model 4.0 naming though in ways that's not ideal, so has_sm4_context really is CAP_DX & CAP_DXCONTEXT, we should've probably went with has_d3d10_feature_level, has_d3d11_feature_level, has_gl43_feature_level etc instead.

z

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBCFE41C602
	for <lists+dri-devel@lfdr.de>; Wed, 29 Sep 2021 15:48:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F1856EA7B;
	Wed, 29 Sep 2021 13:48:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2072.outbound.protection.outlook.com [40.107.94.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D0176EA6E;
 Wed, 29 Sep 2021 13:48:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b7L7FGeLojqmZvbFkeyePVaTANL5QmOHqySlcP0vKVTDWf6vEkL4wT10ey5OgjNYkgKA5Zi1PgZRUAt8s/7hyjxallVBtA+GLN9pm/ZTOrT9uPXFSPirAV6r/dxKvr4jQnl5mMtKB8czkuopw+5uUyAAdWLWv9/HDWYjOKWCZdMMeyoSHFQgt+dQkuQO88mhsKyxMDxS+W70V7C0LZ4+xE1V6sNBFFW07mZudtzWwAQFXnxOx5ed/9sUMMQtTw8WYVDEHuejPJMTl3A8p8yKqVZIGoCyBF5a5BOVS9MoHV/Mdw96JfoGyrStMRMbRk3thXMuhngawyqvAzdjnbPo7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=8xyvqdtqwaHfNzrSApgDzSoR4lnO8NkAE9jehyhMz/8=;
 b=QR7zY19mQ8r+n+Go831bzmi8iNPTiD/ZdcfwMeYxJMY8KONsNx9VNnbeFzafULKzLhTnW1dTaQTeicTnTkMBsFb3mMVJ3/E8JueJXCBPXoSlGLwz0RYjrpoaady4EhT++QRd/xPyNK8twBItGx7h4ZZxjQgQzMv89A0FLlIyfiFoE85dR69BWU+K99VzJFJ3Fg2z7j/jUmlfsI2P8V249SibLQArEDhke0P0oyxdmo6VBbqn9sSbtn3abmhZgC6kornDudIzyL3Ql9lNO2V8Df3XYTOy7D2jT8YwBgQawNmxtvhqeeYjbp21Q5yX3dLNwj4hEimaEP6Kvpab3N5KEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8xyvqdtqwaHfNzrSApgDzSoR4lnO8NkAE9jehyhMz/8=;
 b=nRncIN4znjlkpnjw9vjBUP/QA9Bcsht2ZVEk+HE5DBKziUL3o5MsCrdJXbOc9ch9/6khWcQ59FapsrdeJvJZhUxCNvx7PL8DllVer4j2FnYwDTZH60UzW2fNAs/V9AflJpYa+vpdkoLkqxv8L5Jvg9FQ8FpEeiMobs3aLQNABho=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CO6PR12MB5457.namprd12.prod.outlook.com (2603:10b6:5:355::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Wed, 29 Sep
 2021 13:48:10 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::d82f:e8c3:96ac:5465]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::d82f:e8c3:96ac:5465%8]) with mapi id 15.20.4566.015; Wed, 29 Sep 2021
 13:48:10 +0000
Message-ID: <ea12af48-7caf-03e2-fb60-489bc5803c3c@amd.com>
Date: Wed, 29 Sep 2021 09:48:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH v2] drm/amd/display: Only define DP 2.0 symbols if not
 already defined
Content-Language: en-US
To: "Navare, Manasi D" <manasi.d.navare@intel.com>,
 "Zuo, Jerry" <Jerry.Zuo@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Cc: "Nikula, Jani" <jani.nikula@intel.com>,
 "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>,
 "nathan@kernel.org" <nathan@kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>,
 "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>
References: <20210928170828.26452-1-harry.wentland@amd.com>
 <DM6PR12MB49125AD4817D693AA3987B08E5A89@DM6PR12MB4912.namprd12.prod.outlook.com>
 <2c69ff90750f40ecad3cd4053bc46497@intel.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <2c69ff90750f40ecad3cd4053bc46497@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0275.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:68::25) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
Received: from [192.168.50.4] (198.200.67.104) by
 YQBPR0101CA0275.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:68::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.13 via Frontend
 Transport; Wed, 29 Sep 2021 13:48:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a038919-ebca-455b-e313-08d9834fc64d
X-MS-TrafficTypeDiagnostic: CO6PR12MB5457:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR12MB5457681A6D69D589FC2420D78CA99@CO6PR12MB5457.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b5MQ2ixDgpcmOyalY0KG/R0hfxSEcBuFH6jYe3iBMAzhoig1K2RgCCsTOMn59W19sdCO51zEhuVgvUa05y6OhxV6m12/0oJfifWYmpm/ZLvlAXDEER1X3sSDb0R/MI/kjr8DiUK/Q/e+z80M4clmVio6aTcIrIwvPTUT7q64XOflAhq5OoChuzzusm/hrgfvvFEXmXgDSwCQSAhSz2mOb7xk7YFFWJrjGzqA4z72ZdJhyjr/q/lUv4ZQc2vtgnpuHLeU8xlpocTi4/F5QEypE1NDry7ms9/bInJk1QgQf4PeHl/Iz/D4MQyBz5GPzQpVt/S+qbwGXdJDBtY0+U0OTXuyBV83HjMbJbA1ponLPPloEuf0o/yHyThTaGOCmL5JxSTH/VIBEKTYinLe1LxHE41pn5njOkh3ZW8SSmWrFnTVWpDXeJIq3p18i8x3lOLaSY6nYKlYRyZyNN27Wet0Qp6AVwlE+321XZLsiPSQCnfwREfh/YX3oq+scX1rXjQemM17Mnw+t+5RnOM1GNUP1Iw/kynDIJW9aMU9tDOqNNtiWH/siQI92/7jIdIy4DryLZSOAWdYrcHsCvttu//d3fZ13U3FoomGVJZeHO+8wfYCSZu64EeB6zooC+yAg0rX39dQUBg46kXg/DAP5g2EPlHaRj7mhO/oKsMnioouwlxE78HnS3VkqCPXRq57K3L7vCSSDPIjG0VhJjxF1BkwQb1vq4EEi4zM4QvYgUOljWDXmkZPLDNHSL2jc3IsZexu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(956004)(66476007)(66556008)(8676002)(110136005)(31686004)(7416002)(54906003)(508600001)(6486002)(316002)(2616005)(36756003)(66946007)(31696002)(86362001)(4326008)(8936002)(53546011)(2906002)(186003)(44832011)(83380400001)(38100700002)(26005)(5660300002)(16576012)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bnVyWlh6dTd5Q2ZJVk5HQkRYcXJjWnN0bm5MRm5idVlvSWYvZnhFUURRenp3?=
 =?utf-8?B?YjVnMjJDZUhia2hjV3YvcTdzRE01ZmNQUzlsb0hVMGxXWFdWSm1LamYrcnV1?=
 =?utf-8?B?VFBlbzhRenUvOHZFNVozNjF6eDBQSzFUalY0T2VOWkw0ZmxBV0h2c3pEdjNU?=
 =?utf-8?B?anpkUEg3MWxWNUhXUDZtaTRwWnNqUnd5ejdFWnN1bk1OdVdHMnJNQWNEdFdH?=
 =?utf-8?B?R3RnNG5qamZMY0s3SWhnSzlsbEpRdnl0aW9XcDllajBUdlNLeGttUUtITjRV?=
 =?utf-8?B?clB4ZzJxZ1AxVGcraG5rcSs0T0tYTzRWdVZ4WTNwVlFOSnRDUUNjYzZDb3l4?=
 =?utf-8?B?bFhxUVZTYUhXR3NRWCt6S2YxNSszekRRRkV4b0txWTBySWxVZ1BQVjNiN2Za?=
 =?utf-8?B?TWhzdUV0cHZEaDNJbmlZdTJRYTFieXAreUl1YU5VL0dXTU1wVnR6U3pWdUU3?=
 =?utf-8?B?WjhpM2FyU2swY3czSnU4NjdHRC9IWDhtMzJZYUdXMm9iT3dTdTBWOExBczRR?=
 =?utf-8?B?eTIxRkFITXFFYXIxOGtGUHV4TEN6c3Z6aEx5aDg4VVYzbFNETGFlUUh4Umw4?=
 =?utf-8?B?QnlIT0MrZEplbXI5MWlIclYrNzlJUnJJUFFvSk4wY1VDOEw4MS82MUgzVDR3?=
 =?utf-8?B?MG8vWnErVU1aNk5SY3RVU3dYSnFISWJmTGRTNnptMkJHYTJsQXhPVlE0cVBk?=
 =?utf-8?B?R0dacGlZbUpQcVowOU5MTXJ6dzJNaGJ4M3hQYlZyK3BsdmR6ZXNmM0c1R2sy?=
 =?utf-8?B?RjhKampSMTFOamVtVWtzUTRieXMwbi80TkFKVlM1ZzJJdGNSNHBkY3RMdjlL?=
 =?utf-8?B?WlduT3NiLys3UUJmM3picTcrSlpQeURJZVpyTFU1YWFyd0hkazJMa2lIYWVy?=
 =?utf-8?B?TjdZNHpGSDA3c2dHSGUxcFdMQjM0eFV3V21GZnQyWkFCZ2tnWUhTNThUVmdt?=
 =?utf-8?B?eXVRZ0NabWROa2VoelJTN0VRYU5pVzRrci9hOUVxeGo4Mzh5d2RHVC9wMHlK?=
 =?utf-8?B?Q2s0dmpObC9rbmQ3dmJEMXZEWkxmVGhkd0dPbkoyTXQ4aU1CVkhvS0NjL2hi?=
 =?utf-8?B?ME0zc2NQZnI2UHFXdXpHQytOWTNvcWRTUjdNcHp3R1hVYnFicjEzRUc5QndL?=
 =?utf-8?B?R05kbHJDcXF4V2Y1bzNZQkVFQjgzOGRZVzdNWkJBb0g2RWtKRUMvLzVzNHlp?=
 =?utf-8?B?alVMaElad0ZuRTFLWmxDKzhZdlNzSmpHNnExUzlPaEtsMG9iV0J4T00vVWUw?=
 =?utf-8?B?RzY4TFpkUmphQkxWaGlXY05hWEI4L0dScVh1M1BDbjJrbkFZOWM3U3pHMkQ0?=
 =?utf-8?B?dy9NVm42ZThJcGJDTGtIVTBiZ0lVbFdRSU5XbWpNY1RQenRkK0FlTytVdFBw?=
 =?utf-8?B?dHJURzlnaW9wZDNvYWl1K0tJYjFZUEkwTTR1R1BCMVFhOWk5L2xJdkUxaTBZ?=
 =?utf-8?B?YjVwVStXbzQ4dXA2YnRETndFK0ptNHRMRTc5VStPYkFEYThDem5YNW43RzFp?=
 =?utf-8?B?SDQ5cWdVYmxJWk9mak10eUpFRVBBRlExY3dEaEsvMGlNRmZBaEJYdC9SMjdi?=
 =?utf-8?B?L2dRaUVYb3F2T0dsamg3SlBWZ1NyUkg4RlM2anp4a0ErT1pxWVJCeE9KNUNN?=
 =?utf-8?B?ZVltY3h1QWs0NGVRTnMrSTNuS1VNRWRBQjY2Rk4zd2M2Y01HWC84ZEt5ZVU3?=
 =?utf-8?B?eVVzVTJJdlVrVS9XNFJpT01ZcHFQL04xQ3RXRDE1eno3em5MVmp0QjExcVBC?=
 =?utf-8?Q?Fj9yB0DEABSS2lFQrTp8nOiT1sR6+srocRYpevC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a038919-ebca-455b-e313-08d9834fc64d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2021 13:48:10.3847 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZyemxzKa3jP1K+9ac/wSRAf+++0A5WZDPCvblRjqkc48zIXMoKkWnUOYHCZokiROiQ/oxcIwYjliqpdVq9nFLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5457
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



On 2021-09-28 23:58, Navare, Manasi D wrote:
> [AMD Official Use Only]
> 
> We have merged such DRM definition dependencies previously through a topic branch in order to avoid redefining inside the driver.
> But yes guarding this with ifdef is good.
> 
> Reviewed-by: Manasi Navare <manasi.d.navare@intel.com>
> 

Ah, I merged it already. But thanks for your review.

I agree these are better defined in drm headers, with a preparatory
patch if needed by the driver. We're working on cleaning it up and
dropping the driver defines.

Harry

> Manasi
> 
> -----Original Message-----
> From: Zuo, Jerry <Jerry.Zuo@amd.com>
> Sent: Tuesday, September 28, 2021 11:11 PM
> To: Wentland, Harry <Harry.Wentland@amd.com>; Deucher, Alexander <Alexander.Deucher@amd.com>; amd-gfx@lists.freedesktop.org
> Cc: Nikula, Jani <jani.nikula@intel.com>; Li, Sun peng (Leo) <Sunpeng.Li@amd.com>; nathan@kernel.org; intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; ville.syrjala@linux.intel.com; Navare, Manasi D <manasi.d.navare@intel.com>; Koenig, Christian <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>; sfr@canb.auug.org.au; linux-next@vger.kernel.org; airlied@gmail.com; daniel.vetter@ffwll.ch; Wentland, Harry <Harry.Wentland@amd.com>
> Subject: RE: [PATCH v2] drm/amd/display: Only define DP 2.0 symbols if not already defined
> 
> [AMD Official Use Only]
> 
>> -----Original Message-----
>> From: Harry Wentland <harry.wentland@amd.com>
>> Sent: September 28, 2021 1:08 PM
>> To: Deucher, Alexander <Alexander.Deucher@amd.com>; amd-
>> gfx@lists.freedesktop.org; Zuo, Jerry <Jerry.Zuo@amd.com>
>> Cc: jani.nikula@intel.com; Li, Sun peng (Leo) <Sunpeng.Li@amd.com>;
>> nathan@kernel.org; intel-gfx@lists.freedesktop.org; dri-
>> devel@lists.freedesktop.org; ville.syrjala@linux.intel.com;
>> manasi.d.navare@intel.com; Koenig, Christian
>> <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>;
>> sfr@canb.auug.org.au; linux- next@vger.kernel.org; airlied@gmail.com;
>> daniel.vetter@ffwll.ch; Wentland, Harry <Harry.Wentland@amd.com>
>> Subject: [PATCH v2] drm/amd/display: Only define DP 2.0 symbols if not
>> already defined
>>
>> [Why]
>> For some reason we're defining DP 2.0 definitions inside our driver.
>> Now that patches to introduce relevant definitions are slated to be
>> merged into drm- next this is causing conflicts.
>>
>> In file included from drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c:33:
>> In file included
>> from ./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:70:
>> In file included
>> from ./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu_mode.h:36:
>> ./include/drm/drm_dp_helper.h:1322:9: error:
>> 'DP_MAIN_LINK_CHANNEL_CODING_PHY_REPEATER' macro redefined [-
>> Werror,-Wmacro-redefined]
>>         ^
>> ./drivers/gpu/drm/amd/amdgpu/../display/dc/dc_dp_types.h:881:9: note:
>> previous definition is here
>>         ^
>> 1 error generated.
>>
>> v2: Add one missing endif
>>
>> [How]
>> Guard all display driver defines with #ifndef for now. Once we pull in
>> the new definitions into amd-staging-drm-next we will follow up and
>> drop definitions from our driver and provide follow-up header updates
>> for any addition DP
>> 2.0 definitions required by our driver.
>>
>> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> 
> Reviewed-by: Fangzhi Zuo <Jerry.Zuo@amd.com>
> 
>> ---
>>  drivers/gpu/drm/amd/display/dc/dc_dp_types.h | 54
>> ++++++++++++++++++--
>>  1 file changed, 49 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/display/dc/dc_dp_types.h
>> b/drivers/gpu/drm/amd/display/dc/dc_dp_types.h
>> index a5e798b5da79..9de86ff5ef1b 100644
>> --- a/drivers/gpu/drm/amd/display/dc/dc_dp_types.h
>> +++ b/drivers/gpu/drm/amd/display/dc/dc_dp_types.h
>> @@ -860,28 +860,72 @@ struct psr_caps {  };
>>
>>  #if defined(CONFIG_DRM_AMD_DC_DCN)
>> +#ifndef DP_MAIN_LINK_CHANNEL_CODING_CAP
>>  #define DP_MAIN_LINK_CHANNEL_CODING_CAP                      0x006
>> +#endif
>> +#ifndef DP_SINK_VIDEO_FALLBACK_FORMATS
>>  #define DP_SINK_VIDEO_FALLBACK_FORMATS                       0x020
>> +#endif
>> +#ifndef DP_FEC_CAPABILITY_1
>>  #define DP_FEC_CAPABILITY_1                          0x091
>> +#endif
>> +#ifndef DP_DFP_CAPABILITY_EXTENSION_SUPPORT
>>  #define DP_DFP_CAPABILITY_EXTENSION_SUPPORT          0x0A3
>> +#endif
>> +#ifndef DP_DSC_CONFIGURATION
>>  #define DP_DSC_CONFIGURATION                         0x161
>> +#endif
>> +#ifndef DP_PHY_SQUARE_PATTERN
>>  #define DP_PHY_SQUARE_PATTERN                                0x249
>> +#endif
>> +#ifndef DP_128b_132b_SUPPORTED_LINK_RATES
>>  #define DP_128b_132b_SUPPORTED_LINK_RATES            0x2215
>> +#endif
>> +#ifndef DP_128b_132b_TRAINING_AUX_RD_INTERVAL
>>  #define DP_128b_132b_TRAINING_AUX_RD_INTERVAL
>>       0x2216
>> +#endif
>> +#ifndef DP_TEST_264BIT_CUSTOM_PATTERN_7_0
>>  #define DP_TEST_264BIT_CUSTOM_PATTERN_7_0            0X2230
>> +#endif
>> +#ifndef DP_TEST_264BIT_CUSTOM_PATTERN_263_256
>>  #define DP_TEST_264BIT_CUSTOM_PATTERN_263_256
>>       0X2250
>> +#endif
>> +#ifndef DP_DSC_SUPPORT_AND_DECODER_COUNT
>>  #define DP_DSC_SUPPORT_AND_DECODER_COUNT             0x2260
>> +#endif
>> +#ifndef DP_DSC_MAX_SLICE_COUNT_AND_AGGREGATION_0
>>  #define DP_DSC_MAX_SLICE_COUNT_AND_AGGREGATION_0
>>       0x2270
>> -# define DP_DSC_DECODER_0_MAXIMUM_SLICE_COUNT_MASK   (1 <<
>> 0)
>> -# define DP_DSC_DECODER_0_AGGREGATION_SUPPORT_MASK
>>       (0b111 << 1)
>> -# define DP_DSC_DECODER_0_AGGREGATION_SUPPORT_SHIFT  1
>> -# define DP_DSC_DECODER_COUNT_MASK                   (0b111 << 5)
>> -# define DP_DSC_DECODER_COUNT_SHIFT                  5
>> +#endif
>> +#ifndef DP_DSC_DECODER_0_MAXIMUM_SLICE_COUNT_MASK
>> +#define DP_DSC_DECODER_0_MAXIMUM_SLICE_COUNT_MASK    (1 <<
>> 0)
>> +#endif
>> +#ifndef DP_DSC_DECODER_0_AGGREGATION_SUPPORT_MASK
>> +#define DP_DSC_DECODER_0_AGGREGATION_SUPPORT_MASK
>>       (0b111 << 1)
>> +#endif
>> +#ifndef DP_DSC_DECODER_0_AGGREGATION_SUPPORT_SHIFT
>> +#define DP_DSC_DECODER_0_AGGREGATION_SUPPORT_SHIFT   1
>> +#endif
>> +#ifndef DP_DSC_DECODER_COUNT_MASK
>> +#define DP_DSC_DECODER_COUNT_MASK                    (0b111 << 5)
>> +#endif
>> +#ifndef DP_DSC_DECODER_COUNT_SHIFT
>> +#define DP_DSC_DECODER_COUNT_SHIFT                   5
>> +#endif
>> +#ifndef DP_MAIN_LINK_CHANNEL_CODING_SET
>>  #define DP_MAIN_LINK_CHANNEL_CODING_SET                      0x108
>> +#endif
>> +#ifndef DP_MAIN_LINK_CHANNEL_CODING_PHY_REPEATER
>>  #define DP_MAIN_LINK_CHANNEL_CODING_PHY_REPEATER     0xF0006
>> +#endif
>> +#ifndef DP_PHY_REPEATER_128b_132b_RATES
>>  #define DP_PHY_REPEATER_128b_132b_RATES
>>       0xF0007
>> +#endif
>> +#ifndef DP_128b_132b_TRAINING_AUX_RD_INTERVAL_PHY_REPEATER1
>>  #define DP_128b_132b_TRAINING_AUX_RD_INTERVAL_PHY_REPEATER1
>>       0xF0022
>> +#endif
>> +#ifndef DP_INTRA_HOP_AUX_REPLY_INDICATION
>>  #define DP_INTRA_HOP_AUX_REPLY_INDICATION            (1 << 3)
>> +#endif
>>  /* TODO - Use DRM header to replace above once available */
>>
>>  union dp_main_line_channel_coding_cap {
>> --
>> 2.33.0
> 


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2EA809230
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 21:21:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C7C110E971;
	Thu,  7 Dec 2023 20:21:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::601])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E451510E971;
 Thu,  7 Dec 2023 20:21:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OdelzjH+6RB4W5T13OkfPlufv92KryprEZm/TlMqbWufp98TbxkbKNT8z0HqnLiqH/dp89WzivBLZTh5KV5xNyQtx7Rb0A6vDGzGcJU3JeXbDGH64JJ3KdgqvXODfpWPr9WWI/kp4/2s4+X7u7tB1psEP2Cz5N2FSzHMqFI25txcYVU2tCP1mq1oWDcF/PpPGMxswDEGG6kSFbX7laIesUtVLPsVXuvqWhKbEOld5tC7JnSKPoShqDVSuYJM262uvoFBOCx+oiAw1HDstsQ6+Z4BkxaB/aTMo0N+UGyVDa4LOLsEqNjXqKNZRhwavJI3r53V5ZkdCSXNYvbXi66ESA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Mc9DkYFjBJYHL2Ozfx1hqQRo+KmCSN7Fz/UOVUJoe8=;
 b=HEK12gC47FZXpq1TpwmycLm94/STbQdz6hRo86dkrz/QEC/KxALhRX64dD7tbUy0bVCwenbuyYEZ+lvB6sfPHWC//sjTM+LLDSS2as2noTbLdMRNhmp1zsF/hBl7nBkvVF2PqZDOul3/xOzMSLY9n16TZQ5Zt6QFbUWLWmy61/KUZCFZWzSD/yK3nQStGzdSN+l4AV7LkPCjNFX2udMzPGuzPCRsut9g95DbYi4SLllJ+U8Gw78yQjxt+OLM+U1QYydEafeGvWdeayCxO8dyNDau57udbdxDtCSw6h4niCV/QtajPRQYyO9qTesfPN76Q4QhnzSNX+woIhDofLdacA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Mc9DkYFjBJYHL2Ozfx1hqQRo+KmCSN7Fz/UOVUJoe8=;
 b=Q5c1aKngMGNzWvOByKIaHT4/ywwIlTov+KKMpRqG3+tqy5hkmPSXrM0KQq9HfyRV5i0Qdph0HeObH6CYkEWHqmJoqa2Lha+Z9OOHpCZv/wft7s1OQ3CVGkTTPGn0l3dq7tqM1IeLklLEVFUOCPbIDOe4No9P8y96obUBItAtBkc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by SJ0PR12MB7005.namprd12.prod.outlook.com (2603:10b6:a03:486::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.27; Thu, 7 Dec
 2023 20:21:27 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::3a35:139f:8361:ab66]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::3a35:139f:8361:ab66%7]) with mapi id 15.20.7068.027; Thu, 7 Dec 2023
 20:21:27 +0000
Message-ID: <87e3b34e-46d5-438a-b691-0b5d3ca46626@amd.com>
Date: Thu, 7 Dec 2023 15:21:21 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: fix cursor-plane-only atomic commits not
 triggering pageflips
Content-Language: en-US
To: Xaver Hugl <xaver.hugl@gmail.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20231207182532.19416-1-xaver.hugl@gmail.com>
 <CAFZQkGzOn9L+qmDm=_0kBrkX1H0obqYsjpyuOzMuO8xS1Bm1GQ@mail.gmail.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <CAFZQkGzOn9L+qmDm=_0kBrkX1H0obqYsjpyuOzMuO8xS1Bm1GQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0145.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:7e::6) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|SJ0PR12MB7005:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b5df12a-b679-433f-c68a-08dbf7621782
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: weUXt33DG/0DSZ1cRkyjpAnpesdoRdvE0iBya/hV9PMqYhiVfW2swHDJr3S5CxESYtdgeJydXgec7MQnInGRWQ04CdLeoHbLN1HGJETkwY/mqvXfWo5EgHMGT2/tx7WCtLnXZIRFJ64+LmUh5hPmL+KMKeLgBkQ0uqIEMxWuI/2Hrix64fDBGwQdwzPRBA6xFrkj9fhANd31LhEq++MhDr0ADz0GvDKetha6ThaY7QTtjdob7MiEVKRaQ65GfrwZu00rl4Np2hAcbYo1sy9+pCuGfmX/jo+kixNmAXoTtxmZnFYlmx+CZQkCm24HjGLAyMrjIGEtdNNI5PJEXPIkbvnZKuKlR0IrmgZLqJLKeLXRZNoxYUhtPrqHGoOREy1wdD5gDHKmaNitmauft9uvStY/3qfiCsqeRMOPhmcwhnktyBtHrgKji6/VyZnrWymA8UTMoFAxUSgQFTjvEPfThrd21eFTTwq2XcghywWgZNHj301WFBrporRSvfWkTZXxPTrZExnwquf96df5f+twDacq7FBu4Z0FXAJaOvhXhy9LrCkS4CpXa8WSZDgeMZXtixOJk8FdFEXq50gOacbdWt/0FNT5gdlU9fg2CyjrTVTZQHBAgSNTGG71MIvvxzy3qEV1dlpa7sVzpacUrot09w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(346002)(376002)(396003)(39860400002)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(6666004)(6506007)(2616005)(26005)(38100700002)(41300700001)(53546011)(6512007)(83380400001)(316002)(66946007)(66556008)(66476007)(478600001)(966005)(6486002)(31686004)(86362001)(44832011)(5660300002)(2906002)(4326008)(31696002)(8936002)(8676002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UVZ2aHRrQUpqYUJVblQxb1ZWVklHZlNSUkVKWlFyeDRTL0hpYzdvekxIWEcx?=
 =?utf-8?B?MjBTR0JsejVVaFhUZnlSbml3TzY3OHpyRzNOWk5TWHM0WnVXaitpM0JzTWpW?=
 =?utf-8?B?V1hIUFp6MXljb0N3VFVXRHBoTTJId1BLYWVZdldtOFN4ak5Ia0VIb2hHRlRI?=
 =?utf-8?B?UkxpUmRZMllQVmk4dGZZMkFPS1ZsSW5QZzJUQmw1ZXVhNzNYQy8xdkE3V3dr?=
 =?utf-8?B?NjVvSldhcEtVRnVvTDh1RC9kMG1VbXBXTkdsQmFORWM2L041S1g4enN0a3Fa?=
 =?utf-8?B?TGMrckNTMjBlTkEvUWFpSVc5M1dXOFgxVWJYOHVuV1BaVkU3dGJ2azBFcFhl?=
 =?utf-8?B?OVVTWkN1QVk3VlVlZWpwZEpJTEZkOFM5eGFwdGJkWldXT1dGOUFiUmVYenhR?=
 =?utf-8?B?NldFUUVheURMRUZwMUVOTVFPQ2VRU01TWFJOSm5ienlkeWVzV1B3bEs4Vmph?=
 =?utf-8?B?RTVaUjJnd1lPZk5maloyNktob3pWOWVUVE41N0kvNjZIM1hWWVllV1lWVmRq?=
 =?utf-8?B?cUFUbGcrMGo3QVVFenFJY3lRZ0ZiaEk3YTZ5VjlvQUREaDBsRUNhU0UyR0Zi?=
 =?utf-8?B?T2ZuSDdaclBpYTlXcnVzeUFaMDFJZnRZcm94VzRoVHROZElHNnZxUk05R1BU?=
 =?utf-8?B?NjZScTBZNExIQVJyOTdzdGszY0FBaWlMQVJEWVJXL0Y4VktOSEJ4SzB3aHZz?=
 =?utf-8?B?TzFIT0lhMFozdzduTDQ4S1B6SWVWbUp5cS9yN0R2aUlNUCtrV3FvdEh1SmF4?=
 =?utf-8?B?MHRobFJnQ04zUnk4bkMyZUp0N3EySGJhMVBjR1J2c1dSbkdIb1BETXY2RFUr?=
 =?utf-8?B?ZXhKdWg0YVFnUVBNTGVYN1Q3YzhMaTBwSGdFUUdqRjNnSGp4LytSVS9Vc1B6?=
 =?utf-8?B?K2dPZVFOcFpoeGtNZUxzZVNybmpwc1NaWEt1d3ZNWnY4amlzdFE1a0VnN1p5?=
 =?utf-8?B?OE5tOFRvTnZkVkt5MGhZUzJzOWN1d244cTNSckZTQWdvZCsySlFic2txbXNS?=
 =?utf-8?B?M2ZmQWVycDZJWXhHVDdRcTJUR1ZyV1BDQWFIYVlwVGFlcjFTVER1RnlLNWxt?=
 =?utf-8?B?VzArdTdMNzltbTFDNVNIMHJwKzlOUXRkdHRaWGZkVTJNM2h1R3ppZnNMVnZO?=
 =?utf-8?B?NlFaSUxaUXJFT0RwTE1tVDYxeExxSjNjWDZkVkR2QzI0WDBFd3lHVDd2elNM?=
 =?utf-8?B?R1dSdzBXWmZKWXNvei9qSXBFZyt1bURJbnB6OStKbC9QUXFuWDh1ZXk4OHBw?=
 =?utf-8?B?bnphc2tqMWoreUhKNEI5Y29ROXU5dUU0TE96YTFJSlFZb1VZVTlHQWlzeDEx?=
 =?utf-8?B?Q3hsMFJEdjRUNkFSVXdCZ05ZU2RyZmpSN050SmlQdGtjTmlwQXZtTzVSeGZi?=
 =?utf-8?B?RzcwVEV4Uy9NRE80OU5UMGY4UXpyWHQzRGM3YnpiRlpkWWhQMWZCWUs1TTlE?=
 =?utf-8?B?aEUwK2xONWhrYXo4alRRZVNaYnhycUcyOStySmtzQ1lZOEhrOEIySUVYdlNi?=
 =?utf-8?B?ek1EZTlHT2kxRnI1UGpPbU50U2tzKzMwZGFQMTJkbmRkSEpTbHg5SmkyOHQ5?=
 =?utf-8?B?WCthTDk3OFZwNzNuSmJ0dGtveC9EbzVGRlg2RnhsakE0cE5EQkt1akNYOWpY?=
 =?utf-8?B?WHNaM1BoTDlSemJON25sUzFRbnBuZjFMc3o2bitJMzk0SDZBZ015d1poaUZi?=
 =?utf-8?B?OHZoWUNhOWI5Q0gyR2RoaFEyeTFvU05LUlVvL201MzMyVVpHNzFYR2lXa2dh?=
 =?utf-8?B?d0RMZmdKZjhhVHNTemFtRGsvTlB3b08zaHNlVTNxVDBLNXQ3OTZjdGlqcGRH?=
 =?utf-8?B?VU5JcktOL0preXVzQVdoWnNlaVVzSFRGYkxPSXB2K2RYTElnd3JoVFh0Z0h5?=
 =?utf-8?B?WkQraXJuQWpaNG85czlEV1VlbC9rWUxmSlc2dUt5Zk1UT1dpV3lreXRvSC8z?=
 =?utf-8?B?SzA1ZHdFa2tpaC9pMjVQdkZNOTNZSWViNSt0NVVKNzJpUkRRY0U2RHlCMnVL?=
 =?utf-8?B?RzlPcHN4c1Y0YzFYYmllRStRemtrMVBmQVpFYkhMdlNKM3p0T0ZQSS9xdWQ3?=
 =?utf-8?B?RTR5eHZFUVpydDJCZ29UdEZWeWQzSThvNEdIS0lXVDdvaE1LSXBFQ2lHZERi?=
 =?utf-8?Q?aTq+ihMmkSZexOp+Ay/RtGoGC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b5df12a-b679-433f-c68a-08dbf7621782
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2023 20:21:27.8424 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TXIXbiZngYMaL2R3lOebn96t4AuUnw8rL/BKLf79Bwm7wdAwmjqAOvugiXxytJAWzi2zCDCc7So+wkUwZ5dR3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7005
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
Cc: stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023-12-07 14:30, Xaver Hugl wrote:
> Sorry, it looks like I sent this too soon. I tested the patch on a
> second PC and it doesn't fix the issue there.
> 

Ah, too bad. Won't merge it then.

Harry

> 
> Am Do., 7. Dez. 2023 um 19:25 Uhr schrieb Xaver Hugl <xaver.hugl@gmail.com>:
>>
>> With VRR, every atomic commit affecting a given display must trigger
>> a new scanout cycle, so that userspace is able to control the refresh
>> rate of the display. Before this commit, this was not the case for
>> atomic commits that only contain cursor plane properties.
>>
>> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3034
>> Cc: stable@vger.kernel.org
>>
>> Signed-off-by: Xaver Hugl <xaver.hugl@gmail.com>
>> ---
>>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 10 ++++++++--
>>   1 file changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> index b452796fc6d3..b379c859fbef 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> @@ -8149,9 +8149,15 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
>>                  /* Cursor plane is handled after stream updates */
>>                  if (plane->type == DRM_PLANE_TYPE_CURSOR) {
>>                          if ((fb && crtc == pcrtc) ||
>> -                           (old_plane_state->fb && old_plane_state->crtc == pcrtc))
>> +                           (old_plane_state->fb && old_plane_state->crtc == pcrtc)) {
>>                                  cursor_update = true;
>> -
>> +                               /*
>> +                                * With atomic modesetting, cursor changes must
>> +                                * also trigger a new refresh period with vrr
>> +                                */
>> +                               if (!state->legacy_cursor_update)
>> +                                       pflip_present = true;
>> +                       }
>>                          continue;
>>                  }
>>
>> --
>> 2.43.0
>>

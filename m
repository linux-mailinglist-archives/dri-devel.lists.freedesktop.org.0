Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4F076221B
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 21:15:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C73610E3F1;
	Tue, 25 Jul 2023 19:15:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2046.outbound.protection.outlook.com [40.107.237.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2954E10E3F0;
 Tue, 25 Jul 2023 19:15:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JlwXduJJhXm+z1jmBImZlsOgnAHK6bzt86te/+2YvM02KksgLt3/Rv93/NXphWqhj9bfAznn2HLorVk0EdDghbx92vplCmJN3rVBrJLNg/6U+58DnPQkdUOj+V0gtwiIubdi0bTjLj/+0AQpVh20vH28I92TjnOvGW1mI31H04xu48ss7rok4/HlmBd1OofWzIg++4oHQfbzY5MOl0JWBeYlmwNdiqDhzIcX1MuMJOZ1IxMsqmdQw8HCjwImN9eiDrw9R0j3SxFz5mqOkbKE4aYhL/UR8L1UC3e+RifXfFz3rbTcJ9WTOSdwoqsvFy0/s/Jr0kLPYwpzdgZkVl/jRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HCjzoi60bx1RkiMYclYgTdNSzUEYuWh5C7PdD3kS8JU=;
 b=TGV5hbvjrPZOU2uHTEk7ZVy+S248brd8PmkGDIQt3/ox4VwDqq+3DqATzOovEao6Py/WNC7jjtdIdeP4uMHEigS3QlEwJYTK/jB7hBIwcVF55/fCpP7isTGRvXY7O03wmlc2gsZhdInP4PSq7u3jnwnSTquUH2oB+HLm15qiG0qkSEaTA417UNPP8fQK2m7CEMuYBK5EdILWGKiHzb6WSgSf2OQfXSaTbZCrWFTA4YdxpcMtwcESGMw5OJz0oTGt6UEJ/60NpwohyVMwnI+fmJGXvFU8pl4nkrFJRq8WbYOTw5/ZWG2aVr4L5eK9gcFkzlnwNOWgcU19uXT7peDupg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HCjzoi60bx1RkiMYclYgTdNSzUEYuWh5C7PdD3kS8JU=;
 b=jNzgXx0klB60aG1Dy0TjdS8+vLwWTxmXotv23c9VUhoj4pC4HOJYgiJWSPK+SVN1xQuVg5KIB8WBmGhBnDpRsTz/ZESiMXxPiIGo/LOqG5VJ4BorvVfP42b98gaOMn8gMaWeN5hKkMoy6T4mZuCtSmOXjjmSXZMgfxYkXvoJ4hs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by BY5PR12MB4132.namprd12.prod.outlook.com (2603:10b6:a03:209::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Tue, 25 Jul
 2023 19:15:45 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::36f9:ffa7:c770:d146]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::36f9:ffa7:c770:d146%7]) with mapi id 15.20.6609.031; Tue, 25 Jul 2023
 19:15:45 +0000
Message-ID: <6aa9061b-1702-b8f2-9cb8-982895b9def4@amd.com>
Date: Tue, 25 Jul 2023 14:15:41 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH V7 4/9] wifi: mac80211: Add support for ACPI WBRF
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>, "Quan, Evan" <Evan.Quan@amd.com>
References: <20230719090020.2716892-1-evan.quan@amd.com>
 <20230719090020.2716892-5-evan.quan@amd.com>
 <9b1f45f9-02a3-4c03-b9d5-cc3b9ab3a058@lunn.ch>
 <7d059aed-fac0-cdcd-63d5-58185bb345db@amd.com>
 <DM6PR12MB26196A993B3BA93392AA0FEDE403A@DM6PR12MB2619.namprd12.prod.outlook.com>
 <d4cfbbae-9cd0-4767-8c80-ec09d1dbaf9c@lunn.ch>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <d4cfbbae-9cd0-4767-8c80-ec09d1dbaf9c@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR08CA0010.namprd08.prod.outlook.com
 (2603:10b6:805:66::23) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|BY5PR12MB4132:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f52a4ac-523e-4674-86c3-08db8d438bfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 14lTPXTSQv7L110tPR0CNsQxASdmuEJZjI23SEiKZlLo2b6yi0Gwy961mFyp65SJJkg5khc74k5ua91seIwLH21S+rDkt28rpYK8B3rOlPGFuVAfYpJJnJxPbuTt0ET9a+gjMcS/T3x5vtuLqnxlX3SOh1AGpLj7TWwbpnUZdotIUK95ntGXDZqRF77o8BfCG8ElPiAW0gQJUPDxgsf7JwTnyJa6eVikpTVcN7rY9CHE/KcTIOy0MJWClW+3LtEgPj4EOJoEif/aMCgSPIvQRAJ4u2mXZELxJJXcNaJ0seWVYYMr8U2UaBDgawVxHBzXBnxYk16NjHo6rWCOdMJyeSWHpLY+GlsdZErGK7tGF8OiwMbt30rNT/6kqUG8YTqY3n2Dud8ACB/Sw2XMxH0evX9aAd/sl2tGDwJ+dcFKj9SauKiC4jlpfwdUwoJW/ZD3cgo7wC8rzILbn17JCeo46WPRZa7ike6qz39RNIw6Pn8U1XFLUNc68/9Y2YVr5LEu6AfgZX1RxIciPqS+Im6L2/CG85j/WFIBz6YLAFQnLkfyuuLuucGR2j7CwaN3aD5zjNR305Y6KJs5Bj3p+CsPO8/NXkg0gweGOEk52YVF9tiQHLygEwEHDwdlIbfjGO/mbwxExOQna5OV7xM7d2IN1Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(396003)(136003)(39860400002)(376002)(346002)(451199021)(54906003)(66946007)(66556008)(66476007)(2616005)(36756003)(83380400001)(86362001)(31696002)(38100700002)(478600001)(110136005)(6506007)(6486002)(26005)(6666004)(53546011)(186003)(6512007)(31686004)(5660300002)(41300700001)(316002)(2906002)(4326008)(6636002)(44832011)(8676002)(8936002)(7416002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3NHVmNLUEZjdURLb0RuMnErZEt4V3lPQUhkUWRJaTJhZysvdVV1RGtXQUsw?=
 =?utf-8?B?Wi95NnArczJiYjd3cUtpVkxLYXE3b3NjdHFmM3NSQUl0R1pTWHJTQ3daU1Nj?=
 =?utf-8?B?cEMvcXEyTXdwYXFlS1E3TWY0bzl2RmQ3OVplY1FQdGNGb1NmdWU0TXlISnY2?=
 =?utf-8?B?cUoyYjlCVm1EalpBWlQ5Z3Q1b1FrTTNMNkE1NkcxU0ViUFdrU05XaVlCazQ2?=
 =?utf-8?B?SXBrZGFYa2RydTJ5bmFJeVUxbGkvSXplTTQ2aktvcUI1NmFsTWw1dUNVNGtt?=
 =?utf-8?B?bjFPczgvRExyZVVuTDZmOGhYNUU3RWVqLzVCTld3Tkt3eERveUNhdkw5VFFH?=
 =?utf-8?B?amxCWFNuMUdrZTY4Z1IvZEN5c2s1MEFnUHM4YzBqY0hWOE51RGgzb0pIbXBQ?=
 =?utf-8?B?a05ITEgwbElwOWNaajd4TmxJc284bVhWUVZVUytkcTJXRjVVUEVCei9jcGZl?=
 =?utf-8?B?NDI3SVZOUUJSeklrWW0vVkZoY0VVYWtlZWRUc2lBbHVyWjRNTjlPeUx5Nkxn?=
 =?utf-8?B?TUFYNEVmZnhYZE43MCt3TVlmNUEzRk5YS1dXWjc5bnRkWExFMUpzdXl3RHFE?=
 =?utf-8?B?MXQrRDI1UE1qUXlYczQ2NHJ5TjdZbGVFYkZ2aVZIaW8xcVl5RDQxRHhKcC9h?=
 =?utf-8?B?U05oZlB3aFV6SUtUQzhnYlNldVQybnh3cFVqWGdROTIxOHpUZG0xUUV2THdF?=
 =?utf-8?B?bjZUUTBoY1RQWFJBcHM2dnpQTGRVTEFtMUdrQkNJOGhDUlFqSDZtaDRQeFpQ?=
 =?utf-8?B?c2VTZVRmTTJobnNOMDJkM2c5Zzk4L3J4YnVEanVwWEcwdEF6dGszYXRrTUov?=
 =?utf-8?B?SmR0OG9tYzkveUJUSURjOWNqSTZoekNJYXJONk9SVjUxNlZ2V1MwMjZlN2xy?=
 =?utf-8?B?dFBVcGVQUlJFTkdCVzF3VjZHbDlZQmY0cWpwcDJrSkhCaWM4Uk1JbFZSVm12?=
 =?utf-8?B?VUplTGJXaWQrV3JoMXFIV1pTMWdPUmg3VHBFMm0vRjRuTlM5NVllY3dRNXV0?=
 =?utf-8?B?UGNlNHJsamFHSitnUUYxQWkrbXdDM3pvU1htcWhCaUhvVkFDSnB6Q05MUVNS?=
 =?utf-8?B?UE1VbTUyNENTMW5oMUFTYlM0SDVEZVVyT3lMRlhPb0p2RkRNWERKLzNLZHJk?=
 =?utf-8?B?SEwxb0U0WHpPb0EyS1hrWUs5V01yV1ZhcE0zWlFOM2FCYmxzaHRVSnBxOHpJ?=
 =?utf-8?B?VXJFell2NlFzZ09oa2lEYXE2TUUzWWxzL3hNajMxMlJEdnhSSzRiY242aEpR?=
 =?utf-8?B?Z3lUeDE3cFY1bStRa0tURm12czgycGszL2RvcmRYMzFoQUpqQ0tGanVXcThD?=
 =?utf-8?B?aGtwMHk3QXBwc1pMVFhtbk94dzFoTmZ1cWlmVHZtVnI2OTF1Q1F3S1gyOHhB?=
 =?utf-8?B?TEJaNjNlaEg1bFBNRk1lQU5tZ1NCSkZIK1JobGpRRFYzc2xhb25RVmZpelZI?=
 =?utf-8?B?WlRXZERITXk1SnpDRVJKVFRJOGx2K2FDcEhoY2ROZ2dsWG1jMFhyRzZDRTlB?=
 =?utf-8?B?OFdJTGg0OUxxbTNJMHNqTHBJaE9LL3ZPZjVoM21wMndTeXVDYVYrY3VkWWxk?=
 =?utf-8?B?S09ieG9PUXhBbi9lL0o4YzVGVVRuc1FmckFCa1gyRk5PTnRiMnQ1NzNzWW5l?=
 =?utf-8?B?M2o0R0hsZDRKeE9zUUptdHY5cjFnTlVmOW5HNjI1VSttNlZSLzZ4MUxrM29z?=
 =?utf-8?B?bjc1OFBnWkE4bktNRkFhT0JuR0pDLzNtVDBDeEg5bnZ2eU9lU1NnaGQwQld6?=
 =?utf-8?B?c2Y3M2x3Rk1yaHYzL29SMnp4dEpLU2tJZmtVZjZZWkxLK0tqY2JzMGZVWXlV?=
 =?utf-8?B?UUNNaFVsc005RkJwTTRiMjREWWZ4V1JwSWR5QkRvQ2Y3ZmNaOFZJcjdqdTAw?=
 =?utf-8?B?Y1czbCtZS253ZGZnUkNmYzdwbGowYll5WGhGSGNWSnN4TGZxTm9WZ2ZxQzdx?=
 =?utf-8?B?L0lXQVlnQ2tUbW9VSUliako2bzlDS1dEaHlqcEtyZHJoUVVxMUZ3MFB1TDVO?=
 =?utf-8?B?Ym12eFR1U1RnVzV0NEZ0ajY4Yy90REkyMFczWW1NenV5RCs4TzY4cHdrQUxZ?=
 =?utf-8?B?UlBERHRDVS9PVFlhUmR4OFh6dnYrWXZ6c3l6dkk2RlNiUTlxUFFwUm9BREUz?=
 =?utf-8?Q?ZxMp0nNGciiFbj36qpKQXSez9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f52a4ac-523e-4674-86c3-08db8d438bfc
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2023 19:15:45.6248 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uQpRVuwxXJ8TDqZGYoFd1cP5LyoCeVzIR/i1+KZlqM1Szx1U4iuH/v8Ss+XIvNqK6oHbKP61uSv47sKINapivQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4132
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
Cc: "jingyuwang_vip@163.com" <jingyuwang_vip@163.com>,
 "bellosilicio@gmail.com" <bellosilicio@gmail.com>,
 "rafael@kernel.org" <rafael@kernel.org>, "trix@redhat.com" <trix@redhat.com>,
 "Lazar, Lijo" <Lijo.Lazar@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mdaenzer@redhat.com" <mdaenzer@redhat.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
 "kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>,
 "lenb@kernel.org" <lenb@kernel.org>,
 "andrealmeid@igalia.com" <andrealmeid@igalia.com>,
 "arnd@arndb.de" <arnd@arndb.de>, "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "edumazet@google.com" <edumazet@google.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 "johannes@sipsolutions.net" <johannes@sipsolutions.net>,
 "davem@davemloft.net" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/25/2023 13:57, Andrew Lunn wrote:
>>>>> @@ -1395,6 +1395,8 @@ int ieee80211_register_hw(struct
>>> ieee80211_hw *hw)
>>>>>     debugfs_hw_add(local);
>>>>>     rate_control_add_debugfs(local);
>>>>>
>>>>> +  ieee80211_check_wbrf_support(local);
>>>>> +
>>>>>     rtnl_lock();
>>>>>     wiphy_lock(hw->wiphy);
>>>>>
>>>>
>>>>> +void ieee80211_check_wbrf_support(struct ieee80211_local *local) {
>>>>> +  struct wiphy *wiphy = local->hw.wiphy;
>>>>> +  struct device *dev;
>>>>> +
>>>>> +  if (!wiphy)
>>>>> +          return;
>>>>> +
>>>>> +  dev = wiphy->dev.parent;
>>>>> +  if (!dev)
>>>>> +          return;
>>>>> +
>>>>> +  local->wbrf_supported = wbrf_supported_producer(dev);
>>>>> +  dev_dbg(dev, "WBRF is %s supported\n",
>>>>> +          local->wbrf_supported ? "" : "not"); }
>>>>
>>>> This seems wrong. wbrf_supported_producer() is about "Should this
>>>> device report the frequencies it is using?" The answer to that depends
>>>> on a combination of: Are there consumers registered with the core, and
>>>> is the policy set so WBRF should take actions. > The problem here is,
>>>> you have no idea of the probe order. It could be this device probes
>>>> before others, so wbrf_supported_producer() reports false, but a few
>>>> second later would report true, once other devices have probed.
>>>>
>>>> It should be an inexpensive call into the core, so can be made every
>>>> time the channel changes. All the core needs to do is check if the
>>>> list of consumers is empty, and if not, check a Boolean policy value.
>>>>
>>>>        Andrew
>>>
>>> No, it's not a combination of whether consumers are registered with the core.
>>> If a consumer probes later it needs to know the current in use frequencies too.
>>>
>>> The reason is because of this sequence of events:
>>> 1) Producer probes.
>>> 2) Producer selects a frequency.
>>> 3) Consumer probes.
>>> 4) Producer stays at same frequency.
>>>
>>> If the producer doesn't notify the frequency because a consumer isn't yet
>>> loaded then the consumer won't be able to get the current frequency.
>> Yes, exactly.
> 
> So now we are back to, what is the point of wbrf_supported_producer()?
> 
> I'm talking general case here, not your ACPI implementation. All i'm
> really interested in is the generic API, which is what an Intel CPU,
> combined with a Radieon GPU and a Qualcomm WiFi device will use. Or an
> AMD CPU combined with an nvidia GPU and a Mediatek Wifi, etc. The wbrf
> core should support an combination of produces and consumers in a
> generic way.
> 
> If you assume devices can probe in any order, and come and go, it
> seems like the producers need to always report what frequencies they
> are using. Otherwise when a noise generator pops into existence, as
> you say, it has no idea what frequencies the producers are using.
As the series stands today if the probe order is reversed everything 
works fine.

1) Consumer probes
2) Producer probes
3) Producer selects a frequency
4) Consumer reacts to frequency.

> 
> The exception is when policy says there is no need to actually do
> anything. If we can assume the policy is fixed, then
> wbrf_supported_producer() could just report the policy which the wbrf
> core should know about.
> 
>      Andrew
> 

This comes back to the point that was mentioned by Johannes - you need 
to have deep design understanding of the hardware to know whether or not 
you will have producers that a consumer need to react to.

For example the physical location GDDR6 memory and proximity to the 
hinge where the antenna was routed might play a big factor in whether 
you need something like this.

If all producers indicate their frequency and all consumers react to it 
you may have activated mitigations that are unnecessary. The hardware 
designer may have added extra shielding or done the layout such that 
they're not needed.

So I don't think we're ever going to be in a situation that the generic 
implementation should be turned on by default.  It's a "developer knob".

As mentioned in the Kconfig it's intended use is for identifying 
situations that may benefit from mitigation before support was 
introduced into the firmware.

If needed these can then be enabled using the AMD ACPI interface, a DT 
one if one is developed or maybe even an allow-list of SMBIOS strings.


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1F875F87E
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 15:40:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B93410E31A;
	Mon, 24 Jul 2023 13:40:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2082.outbound.protection.outlook.com [40.107.244.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B754310E31A;
 Mon, 24 Jul 2023 13:40:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VlncVbPTUH5dAnc3UCpmyu/OacANLCQNR23qjGr3WvhEXM0BuunTmRGP4uBE8bRPLukSCYQxdZHLchnt/mkmqp0bM0SSJM297ONErgyGRp7FhEYWT1BpJCcw+whN62Qy2r70tPIZoSL15ngtV0QvTyIYkoWr1Z4p0ixYyZU/SVPfIemdZhJEPFIunC47P9ebOgoG12mlnKkObThNucJO3xP5vcia4Qtta1ARsNKAzNWvGTnx82t9b/qFq2ObBdvrwj2T+S86UeiyCSwwg0xhzE71mQZPBhs+Ej/xvICra+jwSmTmrSGH6g3le/vjrdlZ6R+9n02Ag0ZKNP5QSTSKWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7JH2N+MZ4Yew6D8lRMINgoPINuXIJ+oLnl1vxRiDcug=;
 b=MiBuAgp9iTFwKrdzDkp6DZPMPpP11pdxahVnAt2Fnmt74iaf+TdiWp4/C3g94Y8lEBuk5w4aO3UTqBvXOqLENJ71ogHgwXemXGGhVV6WHv3RvFxHCIxMZq60QWnIAQTpKw+zijZCrqbKRVyabuey2DKiR6go7XhgeCLBmzchtuxBdfpeu7DjLTfEgpkTBEkNVjwKFTuHNrtkC/eW9aWu4LvmA0qQxbd2stFVFL8qVrK5aDebKRzLJt4H5nFKmw/HM9o2uEfkp21DnCQJsS13dFdeB6PDiNuay/pjtsrxlOOiQxARTZ4xxO2IlGU7froHigz9ZQN09cfpqei3PAMzZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7JH2N+MZ4Yew6D8lRMINgoPINuXIJ+oLnl1vxRiDcug=;
 b=Ol/r5rijg6JclY5Z+jppK8yHaYnXiS2ck+GdynX1T3UKQYjn3Yg0IfEb7AwsNFkUbbcOK78QQ+XuUAfCm4BTknKHyFo4ndlaNK0oSkCTZ89Yrlt9MzsUD08ARwmXluFCZdAVzOzDw18X7AGHeDFR39qnz8UDPIcX4Zb7CGpoYxk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CY8PR12MB7684.namprd12.prod.outlook.com (2603:10b6:930:87::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 13:40:37 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::36f9:ffa7:c770:d146]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::36f9:ffa7:c770:d146%7]) with mapi id 15.20.6609.031; Mon, 24 Jul 2023
 13:40:37 +0000
Message-ID: <7d059aed-fac0-cdcd-63d5-58185bb345db@amd.com>
Date: Mon, 24 Jul 2023 08:40:33 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH V7 4/9] wifi: mac80211: Add support for ACPI WBRF
To: Andrew Lunn <andrew@lunn.ch>, Evan Quan <evan.quan@amd.com>
References: <20230719090020.2716892-1-evan.quan@amd.com>
 <20230719090020.2716892-5-evan.quan@amd.com>
 <9b1f45f9-02a3-4c03-b9d5-cc3b9ab3a058@lunn.ch>
Content-Language: en-US
From: "Limonciello, Mario" <mario.limonciello@amd.com>
In-Reply-To: <9b1f45f9-02a3-4c03-b9d5-cc3b9ab3a058@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0101.namprd04.prod.outlook.com
 (2603:10b6:806:122::16) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CY8PR12MB7684:EE_
X-MS-Office365-Filtering-Correlation-Id: 46ef888e-9e45-440c-f24d-08db8c4b903d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1clvL9l3lWYE9hEIrdcf2Dtu/xIfWqROz7J30rMAUT3fGeCOmwBeS4MCEMokD0DDd69kygMyM00BNwGbztVY52NarfjT0BaIr3DbTzPCdNjwMqs8lc+qf0zYdpBrfdhcWJfX4+SlQSD3kzUk0qqKOvbaAlZCt52xVOU7JwZjQyxr1xu3Z27c/SBn1x7vCxUc3q63i8GVuzBk6/mSO8xP182b5qsGAy3tcfsLgShwVH6fBdfZ45FxC/ofuGdXVorOFMFwcoM2hmRLbn9aQeReLQHUghlNrV19V4DJj7NdsRTwbSuUBR42kLFWFY/oexHF1CLT1xrJDGgT92+YUPuefQT3O1M4S5KCzh+jyZrScqpH+gNhyJB+BCm86nBzE7e0/nPksgJeSP1DChU7pkg/KZUzeoThZ0GOqDfIf0vP28wp0G34kHGgF/Y7xQ2vXIkAfR1BCwlY6xd+Gq2JtuvHCMlG0eRuAy1LIIL5qSQF8ix8MM4nMGCUZia9BM2EchU3/n5RXNhm+wpHDZoFg/7Zr2iWpOPCjs73LbZcirxlXpqkgvScKaAs0jYc6Ql2y25oAgAbcteiiBSHIWa9W6oF/W141TQOB6TRiVXpd8lSazCg5CXlJ4kg3xSzxnRp2uy5R79Ws2PrtxX5U5FZHMNL5Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(346002)(39860400002)(376002)(366004)(451199021)(186003)(26005)(53546011)(6506007)(31696002)(5660300002)(36756003)(8936002)(8676002)(7416002)(2906002)(2616005)(86362001)(38100700002)(83380400001)(6486002)(6666004)(6512007)(316002)(66556008)(4326008)(6636002)(66946007)(66476007)(478600001)(31686004)(110136005)(41300700001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T2sxSWd3ZnNRSlNzSWxqUFZRbW5TVEFkcnBoZkRZTTdDbjY0MlUyQ2hFTzN0?=
 =?utf-8?B?MXB6NHNEaFFZUHJ5SlBpTTljd3cyaWFoZ3UxdXVoalhzWFNGSGJuMGlpMzJ3?=
 =?utf-8?B?WlU4a0NMaXNUK3M1U3JwdDZ5Y3NNQndIMGJpWEdIOU5XRnNHUEdIM2NhQ29x?=
 =?utf-8?B?NzQyQTNNWk9xUEZJcmVyUnF5bnhFaFZ4R24wKzdlVUNPNC9NR2ppUTcrQUo0?=
 =?utf-8?B?Zzd2clJoRXpCN2lheFlhTzhYNzAzT3pscTFsN0ZXYnVvZGhsU0VqVDh2eVdw?=
 =?utf-8?B?OEkrdVVqUmtSUERqeXlYY09hSWRnNnY3MTlaYmI0ZWVsYUcwdTZYQkNyMnRh?=
 =?utf-8?B?NkpJKzFvcGdRRWZjaERLalgwbzkwdjdDYjJIdUdQaDJlN0pGNXlQOHBEME13?=
 =?utf-8?B?b0NNNWpmZ3JrWC94UHZhVjQ5ZUIvaDByYjlTMFh1anBkbnFzUjRUeG9CT0VF?=
 =?utf-8?B?TERCNDNmQ3R2MVU2NEZZNFh1aS9JNXprZ2N6dkpPWlZMelhMbWNiTjJsaGcy?=
 =?utf-8?B?WDd1ZFQyTGNMVnhGb0ErWndiT0ZUOU4vbi9Oak91VGRFbzd2SXUxa29QdGxo?=
 =?utf-8?B?MllNNXlaS2xpVW1XNERJU3Z4Wmc3UERRQ1Uxc2VuSksyUXNrRmY3RkRLMDc4?=
 =?utf-8?B?dmJON3hkNHljZm1oQnZCWEg5ZURMREtyWjZtaFg2djJiT3FGZnRtTndtQlBR?=
 =?utf-8?B?c0tEM2V1WTl0ejNWTGFRZzJNQ1MrSitTc0RLK240ODN6bkNyZkc4VHpMeFBv?=
 =?utf-8?B?TlppdHJpZjNFaWJFSzhUdmRvbng5ajY1S3Y2eGJkTmw1YzlVU1h2dGlsNkQr?=
 =?utf-8?B?YThLZVBYdXRTczlpS2N2TjBJdk84TDR3YmROd1ZWRFcrblpnS2FMWmhaK3ZE?=
 =?utf-8?B?bEt0VXBMM2QyUDJDelBZRC9MZURxVXluU1VZdnhSNlhVQkx6WGc2ZGZGOGd3?=
 =?utf-8?B?a3BndmFORGxFVDZyaGg2aUVNd2Z6cXBITWpDYnRPa1g2MnJwT1NKcjYrQXF4?=
 =?utf-8?B?VXdaWTU0ZVBUcmI3dlM1RVpib09MajJNakxnbFk2SmtTMVJTY0wvMjJRSkZw?=
 =?utf-8?B?Q2w1RjFFUlNMbWhhcmxsdnZPWDdOZGRrUjFNM0M1R21wTFFTVDdUQnkxVWJ0?=
 =?utf-8?B?Y1Q3cmcxbU1oNk5jRndpeGRJUWNqS25wSkNBS1NYNGFpR2Y0NTd6clg4MC9j?=
 =?utf-8?B?d09saTFqUktjcE4wbXY0SVBJUk1zLzhJa0JwTzRGVVlySG52Q05PY01FUU9I?=
 =?utf-8?B?WVNGa3BoYUFDNU1obWw3R1Yzc1dBN3dIbUdNZ0dDdTRrTzc4eTV5M1NxSjJ6?=
 =?utf-8?B?RVFBZkhjMnUzdGw1Qk1YdXcyRXBZeWRGdkFjU0FIaDRscFRYNHVPb1RuNHhZ?=
 =?utf-8?B?TlNoNTJrY3Z6RHFhYlF1S2J4aGJhWGhxVlorcDVWZVdlQlNzTWhmQS81QnRT?=
 =?utf-8?B?L00rSitBR28zMCsxZGo0dTZVUG9CZ2RSY3FBNzdyUHVQNXFkRlBEWGVWSFpv?=
 =?utf-8?B?ZkUzOHc4Y0M4SHppb3dtV0VuQVBXMXBMWEFMZjM4SlA2NVNWUTNDNkZHWFlY?=
 =?utf-8?B?QmJUc29uOE93RHI5VU9jckx3Y3JnaUVlcFhwaDJzMmRSaExmdkRpcnJmUUl1?=
 =?utf-8?B?NklQbDJkSXRQbTVNclBYNnM4UGJ1cGs0ck43d3NoT0hUejRYNDl0aVhnenFw?=
 =?utf-8?B?a09vKytBSUtUMmoveTd2YzZDNmFzSU43V3pFS0MyN0Z2MUFrd1crZmVmcTA1?=
 =?utf-8?B?aWhYMmd6SG9vRXU0VWd4RnAzTWlNbXdLcHJGaXVXb0FZNmNiNWJ6ZkpJNEhZ?=
 =?utf-8?B?ODltQ2ZVQXQxMVd3OGhOSVVTcDkwYVV3dmNMamtaa0JKaFFTeU1raXZpeThP?=
 =?utf-8?B?TFpGZVp0bnd0djVKQWhNWjlMSXB5REtNd2JKd0JIUUZxZ01IVHlqY0NKc2Zv?=
 =?utf-8?B?ckpZaXgydUNYRnhUUkNNZktnYmlJUDNmUzlXYmhXa1BTZXRwS3RUOFVXL3hh?=
 =?utf-8?B?VS9XTXhuOEVUSWZPajNLYVl1cktyTzlMZGw1UWJIYjVkZDczL0lGZThaNDBF?=
 =?utf-8?B?VEdGbUFyTmt6MVdGTjBwQ0hka2pPajV4Ty9wcmdDUzhINzNmRENac3pPbDFS?=
 =?utf-8?Q?xnKVfmZv/rWeB7Bpua4KsJL1K?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46ef888e-9e45-440c-f24d-08db8c4b903d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 13:40:37.6890 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h1sKb9G7leKWVRP1St/LYYzp82fnZQ/SGhX1eWFj4JSlvRIjfA6zAeoeY196V8FuVaTPhuLIvJLPUVieh0DZxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7684
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
Cc: jingyuwang_vip@163.com, bellosilicio@gmail.com, rafael@kernel.org,
 trix@redhat.com, Lijo.Lazar@amd.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, mdaenzer@redhat.com,
 amd-gfx@lists.freedesktop.org, linux-acpi@vger.kernel.org, kuba@kernel.org,
 pabeni@redhat.com, lenb@kernel.org, andrealmeid@igalia.com, arnd@arndb.de,
 hdegoede@redhat.com, netdev@vger.kernel.org, Xinhui.Pan@amd.com,
 linux-wireless@vger.kernel.org, edumazet@google.com, Christian.Koenig@amd.com,
 tzimmermann@suse.de, Alexander.Deucher@amd.com, johannes@sipsolutions.net,
 davem@davemloft.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/24/2023 04:22, Andrew Lunn wrote:
>> @@ -1395,6 +1395,8 @@ int ieee80211_register_hw(struct ieee80211_hw *hw)
>>   	debugfs_hw_add(local);
>>   	rate_control_add_debugfs(local);
>>   
>> +	ieee80211_check_wbrf_support(local);
>> +
>>   	rtnl_lock();
>>   	wiphy_lock(hw->wiphy);
>>   
> 
>> +void ieee80211_check_wbrf_support(struct ieee80211_local *local)
>> +{
>> +	struct wiphy *wiphy = local->hw.wiphy;
>> +	struct device *dev;
>> +
>> +	if (!wiphy)
>> +		return;
>> +
>> +	dev = wiphy->dev.parent;
>> +	if (!dev)
>> +		return;
>> +
>> +	local->wbrf_supported = wbrf_supported_producer(dev);
>> +	dev_dbg(dev, "WBRF is %s supported\n",
>> +		local->wbrf_supported ? "" : "not");
>> +}
> 
> This seems wrong. wbrf_supported_producer() is about "Should this
> device report the frequencies it is using?" The answer to that depends
> on a combination of: Are there consumers registered with the core, and
> is the policy set so WBRF should take actions. >
> The problem here is, you have no idea of the probe order. It could be
> this device probes before others, so wbrf_supported_producer() reports
> false, but a few second later would report true, once other devices
> have probed.
> 
> It should be an inexpensive call into the core, so can be made every
> time the channel changes. All the core needs to do is check if the
> list of consumers is empty, and if not, check a Boolean policy value.
> 
>       Andrew

No, it's not a combination of whether consumers are registered with the 
core.  If a consumer probes later it needs to know the current in use 
frequencies too.

The reason is because of this sequence of events:
1) Producer probes.
2) Producer selects a frequency.
3) Consumer probes.
4) Producer stays at same frequency.

If the producer doesn't notify the frequency because a consumer isn't 
yet loaded then the consumer won't be able to get the current frequency.

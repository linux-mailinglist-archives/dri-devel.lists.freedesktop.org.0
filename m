Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B038F738673
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 16:12:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7846410E491;
	Wed, 21 Jun 2023 14:12:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2072.outbound.protection.outlook.com [40.107.237.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74B2010E491;
 Wed, 21 Jun 2023 14:12:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aSZa/nXsPdPvUpc9oxPYAySLR0e1f8KN13P7lg5ZzwzvXixa20DD6RxQoxNDvD63Whtf2czUXgrSzqw/p5W7PLwAROxRB2sV7wuW3Zcnx0NzwzQoihbE+8qp1xOP6tOGHtY/vb2p5RQYfiuWrMrefpKmacnjIe0vU7YeJt32MtF8Bj5m2Gh1obHtOeSZObMDQTovi9q26XpiyXa9HGclwtmsFdBccuCidEYOuTLjoioBO8GO4a+rKyUFTxQaVYVNo4QRhT/xuKb5CKvJcYx4l5yymJNdtd3oD52DeZwWDAcI2Dup84OPbtovncDOeGI9nAXoI6aOXpAtR/8bqdmbuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kTWVUHCi1wlt7wRWmFoQ2AXEzeI+kSrBxX6mHMne/rA=;
 b=Mk5DgrIs7SxF11NfvsMtWbYl/yum9VE3gdhqohp/PAhwko7U5PaardUwRQWqkpghd+LcOzI/nNDp7uzjPOeS0pN0g3HlCAwsLDLdAlPctBfSMFalld5JF7Dh85iWRpvTr8VRvUtmX6ceXlTsrrqGqsfUktdqUdQcWMN6uoXtpF5eXYhzcfHb6XErtjrQhPt66DabdxxDfRh9DV/DWw8dhfeqwfRurccZNRsKgVFsTd6tgtIAVwIH2DE8smlE6qIl7Y5/GxauuPJRF2dvWqSpBGBKSrLcqEMINByLIaTF3F4VOaKHzUsoypwuge9riIuV5iKwLLy768jaMr85XIXq3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kTWVUHCi1wlt7wRWmFoQ2AXEzeI+kSrBxX6mHMne/rA=;
 b=KzYYFAOb8iO3oBVtpC0vqUkkODTXn/EnzBCWnspcuJtwbHG03lYkIVeDtGeFii3gEiYVM7jwpxgMpWhfzsMOXW4Y3EGCq/c85n0Td8iXkFgBrb2mgDOlwt9lsnSmzW/Y3qlZlZLxbpHZ+VZMeSXdN5+uq1vnk/cOF6ZVJc07a98=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DS0PR12MB7557.namprd12.prod.outlook.com (2603:10b6:8:130::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Wed, 21 Jun
 2023 14:12:43 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dfcf:f53c:c778:6f70]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dfcf:f53c:c778:6f70%5]) with mapi id 15.20.6521.020; Wed, 21 Jun 2023
 14:12:43 +0000
Message-ID: <9fdcd5a6-5315-b4d8-1662-30bfc6cb67d8@amd.com>
Date: Wed, 21 Jun 2023 09:12:38 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH V4 3/8] wifi: mac80211: Add support for ACPI WBRF
Content-Language: en-US
To: Johannes Berg <johannes@sipsolutions.net>, Evan Quan <evan.quan@amd.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>
References: <20230621054603.1262299-1-evan.quan@amd.com>
 <20230621054603.1262299-4-evan.quan@amd.com>
 <3eb2c16cb0692c8d6b03bd57cb049b1fb3457e92.camel@sipsolutions.net>
From: "Limonciello, Mario" <mario.limonciello@amd.com>
In-Reply-To: <3eb2c16cb0692c8d6b03bd57cb049b1fb3457e92.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR04CA0079.namprd04.prod.outlook.com
 (2603:10b6:805:f2::20) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DS0PR12MB7557:EE_
X-MS-Office365-Filtering-Correlation-Id: cd6b3cbb-dbd7-4a82-05d3-08db7261948f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PB0ibkcTfSk7lkhUCX2kWkSbSB+XrB2+rwGBULGOC28Ba/v8G+Jokx3khEGBJMpk0/LfMpLpYujj8YTI/1n0X5ujSzUng0bWok9QN9bSgU7JymtlpYXRhgs/FAPpVqwwexe0mmWpkRbqZ24jVmT48FkBGgjAPuYdf3HrtYiKiE5vrI0ZW6a7/TBBeF9WC7ZPK2Kctu3VViNBk+QG80hM07Mi6WC4GbTdEUe/s3CCMBq9LyGgmW7f2ei8GG9mj90ohrU4OOdwl4XQqY1ISXd3bPZvMyZ5VpOma7vjpU+8irfXfwYfwadkRa4hzxqiJc06l4gBMFXqEioKn3AeFW6rqtmcL3KXU1RW927MW9LNCzzmjQySGeeqBUxryNBgir/+n44b67qF70DKueEDjxVZrDr1TnyAwN0LNlUg72uS6c6+NxKZqLlKmP6GkC1Aqsse273cmqbyHFtZXYxYkZaOmYJTfc8kt9VjBXjTBBVvlwIW4cmo3ko56hFw1oJZMWOWPsDLjT6z1p8jBauf96I8QZUCVxAFXy4g6daUuMMOW64SjMBf/a/qPyMeZ3QDwkGzEr9tNNJMl1QuQohRlHiqCPFQTZdJBy38rXQ7LOWkzKMb3PHiYlirecEkRIsYLXDnEJBwqVIhFoeu99AtFpBKqQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(396003)(346002)(366004)(136003)(39860400002)(451199021)(4326008)(2906002)(478600001)(110136005)(86362001)(31696002)(6486002)(38100700002)(6666004)(41300700001)(83380400001)(316002)(36756003)(66946007)(66556008)(66476007)(2616005)(6512007)(6506007)(8676002)(8936002)(7416002)(26005)(186003)(5660300002)(53546011)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vk82Mnh0UWhSRk5hVkcwZGFDcDRJK1p6SzVzTGNJemtvMTQ3Ri9obnlDTzM0?=
 =?utf-8?B?UHVxUTdwUzl0RkpLYnJwYWFlMC96NmxVUmRVVEMwcGZaN0kvU0Y3VEJPdDE2?=
 =?utf-8?B?M2RNWU92N1pVcHZNdnNGMDIzTzluY2NOdExpNkdEWk55cm1PQW5Db2xNMVNC?=
 =?utf-8?B?NWY3M2ZKVUh0TW1Mc09adnM1MSt5V0pHQjR4ckpxNGNtMWdkUk42UmxPSTYy?=
 =?utf-8?B?dWkwOW1RS2lVUmhicmZ4NkRLQXIrNXZiTVhIMmJORFBtM0hBcEI5eS9PbjNK?=
 =?utf-8?B?UFZ0bnFzb2NwT0JMcERQSFVGUkhsZytISlB6OGdzVGt5S1ZuZ0VON0pLRmli?=
 =?utf-8?B?ZG4wdlBwaXVQRWRIWmRuR2VCaCszUFhJRHVJZHpUbDQvNk1tVnV6QmE0bVhQ?=
 =?utf-8?B?NERZNmdvZ2NXVVJPK2pHWE9IZzlLci9vTzNSMUtKZjluUE9RNDlJbjZMK2po?=
 =?utf-8?B?bzMvYk9menhTU2R3SVA1b2lnakV4SlpOcDFQT3ZucHNhcDZCTmVUTmlQbjNo?=
 =?utf-8?B?eEpQUFBxNzE3R2o5VjVRak4xYjlMSFRZRlNhVTBBZUQzZGVCQksreVlHS25U?=
 =?utf-8?B?aE55UTN5K3g0aVFIb0RpWXBydE51QXI5dHZ5Y0gweUplNWJkekErZmRaZU5V?=
 =?utf-8?B?NVZXWVpzSHNSWVZLMEFlWnR5V0VzZmc2YjlRZDIwN0ZnbUtxWDNIMC9MZFlK?=
 =?utf-8?B?UlJwZGs4b3puZzhucHZXYWxmbTVNZFduZThRV2g4UE9ady84dTBRdU1mQjJx?=
 =?utf-8?B?bU1CRnpZQzdlL2MrdlB6UldNMDQ5YWl4anlRdGRRVndmNFFqZlNlQTJsUXFm?=
 =?utf-8?B?WkNyU2RSbU9oYjJZaWNJZ2NPMk5xVTIrSHNnRzVnYXpEMlEzK1hQQ010b054?=
 =?utf-8?B?V3pNd054cDVzVGtDMFdqTEE2bGdVSGZ4MDl5ZWFOK2ZVZVJHTCtMaTZ0cWp3?=
 =?utf-8?B?ZitYbXdqMGVqenJJbkg3cnQyVXhxUG02OTBrbHhCbHZTQUtVei9xODFhRTJi?=
 =?utf-8?B?KzNYMklLcEE1Wm51NExRV1NnczN6WVdiM2xXaGp0a25LbFhnWlBQKzE5VG9x?=
 =?utf-8?B?R1dKcFJPcUtybGdXM0JBRzZvdEtRM0YrNHF4SndyQjg4bm5mYlhrQjR3RkRI?=
 =?utf-8?B?WGhONG5KaTBqYnlnS2dsbGFrQkZzK3ZLQ2hjU2NiWHIwZkRkVzJ2NlRtTjhy?=
 =?utf-8?B?UjVxUW12RTk3WHlMamJkdHJsa1BOVTl0TFdYUmx5NlY0enZIUXRhZzNucHlz?=
 =?utf-8?B?NVl4MGlnQUNzTlhLcGpvL2hQMDVwcW1RUi82OU9HUGZYYWlVcHJZNndGaE5F?=
 =?utf-8?B?K3kxZTV3eTlnOHBaaS94L1hwY0tKc1pPNnNEM1U5YURsOGdSMERtMVhVQURO?=
 =?utf-8?B?WWFPREpObEtuMkNPd0pmeVJRNFJRODJBS3h4Z0pmUEVsN0llc2Y2cUFmU0tu?=
 =?utf-8?B?WS9ERktsbUliOGpEdXJGRk5jNlhjZ0tmVS94RGZIWVVsRWplWjgxanMreDBL?=
 =?utf-8?B?My9LenByaU1iQld5cHovdTB0VjhXUGJPMmpOSXlCRHR0Rnp5QzB0b1ZENW9i?=
 =?utf-8?B?SUo2K21SZGpub2FFUml3aFFxL0lROTkwNWs4Wjl5OFprYU1OUkUrVnVWZFV6?=
 =?utf-8?B?ZTNYZUZXUnN2ZWVjU1U3Vzl4aUgzTDVqREhDV3hKZnpVNGdhdXZxYjJJVG1o?=
 =?utf-8?B?eWJ6eGpKbGhrSGtaRGZEeCtLcXN5a2h3Vktab3c2Ym1FQkcwdkZyZGVDWlJ1?=
 =?utf-8?B?cFNBRng2MkJuVy9jTjBXOUtHeEFaMTJSQS9iYVdjNUsva3VtRmJOQUhXdHVF?=
 =?utf-8?B?SmRPS3M4ZkkvM2RGcVZtK1p0MDlWZzFva0JsNkh4T1UrdEtDS0hNSDgrWVdi?=
 =?utf-8?B?Tk13RkRaY0ZiVnpZN05HakxSY3drSUt3dnpyc09DdXNXR20yQkYyTnhoVklQ?=
 =?utf-8?B?UE1BNDRhYVAwWXYxSW9UN0FLM1FnbTQ0eTBOVmZzcisvQXVTbTE2dElCM1Bj?=
 =?utf-8?B?WG1WRjJBTnNzL0Uwc0Q5UDlQZGJ1OUg5WjBWdElPRFg1Y0hCRHp4Y1lpd1cz?=
 =?utf-8?B?YnFHczNDV3FIUFVCd1BINGdseWU4Zy9WdE43b1ZlVGxvalVsRmJheStpdkJk?=
 =?utf-8?Q?IY6pkMQSWRUxbBCRKUcjroL+e?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd6b3cbb-dbd7-4a82-05d3-08db7261948f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 14:12:43.4863 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lExDAf+poZ/P30ERDkC2wJmO14Bm6aSiH8MjRITjpUoCkeLb5/cneyyPWXbgQRIZVqrO34RfoK8oow6qpy8abA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7557
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
Cc: jingyuwang_vip@163.com, bellosilicio@gmail.com, trix@redhat.com,
 lijo.lazar@amd.com, dri-devel@lists.freedesktop.org, edumazet@google.com,
 amd-gfx@lists.freedesktop.org, linux-acpi@vger.kernel.org, mdaenzer@redhat.com,
 kuba@kernel.org, pabeni@redhat.com, lenb@kernel.org, andrealmeid@igalia.com,
 arnd@arndb.de, hdegoede@redhat.com, netdev@vger.kernel.org, Xinhui.Pan@amd.com,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 christian.koenig@amd.com, tzimmermann@suse.de, alexander.deucher@amd.com,
 davem@davemloft.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/21/2023 5:22 AM, Johannes Berg wrote:
> On Wed, 2023-06-21 at 13:45 +0800, Evan Quan wrote:
>> To support AMD's WBRF interference mitigation mechanism, Wifi adapters
>> utilized in the system must register the frequencies in use(or unregister
>> those frequencies no longer used) via the dedicated APCI calls. So that,
>> other drivers responding to the frequencies can take proper actions to
>> mitigate possible interference.
>>
>> To make WBRF feature functional, the kernel needs to be configured with
>> CONFIG_ACPI_WBRF and the platform is equipped with WBRF support(from
>> BIOS and drivers).
>>
>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>> Co-developed-by: Evan Quan <evan.quan@amd.com>
>> Signed-off-by: Evan Quan <evan.quan@amd.com>
> I was going to say this looks good ... but still have a few nits, sorry.
>
> But then the next question anyway is how we merge this? The wifi parts
> sort of depend on the first patch, although technically I guess I could
> merge them since it's all hidden behind the CONFIG_ symbol, assuming you
> get that in via some other tree it can combine upstream.
>
> I'd also say you can merge those parts elsewhere but I'm planning to
> also land some locking rework that I've been working on, so it will
> probably conflict somewhere.
Since it's all gated by CONFIG_ACPI_WBRF for each subsystem that it touches,
my take is that we should merge like this:

1) Get A-b/R-b on patch 1 (ACPI patch) from Rafael.
2) Merge mac80211 bits through WLAN trees
3) Merge AMDGPU bits *and* ACPI bits through amd-staging-drm-next 
followed by drm tree

Since WLAN and AMDGPU bits are using the exported ACPI functions from
patch 1, we need to make sure that it is accepted and won't change
interface before merging other bits.

Everything can come together in the upstream tree and the bots
will be able to test linux-next as well this way.

By bringing ACPI bits through amd-staging-drm-next we can also enable 
the new Kconfig
option in AMD's CI system to make sure that all the amdgpu bits are 
going through CI
testing too earlier before it even hits linux-next.


>> +++ b/net/mac80211/chan.c
>> @@ -506,11 +506,16 @@ static void _ieee80211_change_chanctx(struct ieee80211_local *local,
>>   
>>   	WARN_ON(!cfg80211_chandef_compatible(&ctx->conf.def, chandef));
>>   
>> +	ieee80211_remove_wbrf(local, &ctx->conf.def);
>> +
>>   	ctx->conf.def = *chandef;
>>   
>>   	/* check if min chanctx also changed */
>>   	changed = IEEE80211_CHANCTX_CHANGE_WIDTH |
>>   		  _ieee80211_recalc_chanctx_min_def(local, ctx, rsvd_for);
>> +
>> +	ieee80211_add_wbrf(local, &ctx->conf.def);
> You ignore the return value here.
>
>
>> @@ -668,6 +673,10 @@ static int ieee80211_add_chanctx(struct ieee80211_local *local,
>>   	lockdep_assert_held(&local->mtx);
>>   	lockdep_assert_held(&local->chanctx_mtx);
>>   
>> +	err = ieee80211_add_wbrf(local, &ctx->conf.def);
>> +	if (err)
>> +		return err;
> But not here.
>
> In the code, there are basically two error paths:
>
>> +int ieee80211_add_wbrf(struct ieee80211_local *local,
>> +		       struct cfg80211_chan_def *chandef)
>> +{
>> +	struct device *dev = local->hw.wiphy->dev.parent;
>> +	struct wbrf_ranges_in ranges_in = {0};
>> +	int ret;
>> +
>> +	if (!local->wbrf_supported)
>> +		return 0;
>> +
>> +	ret = wbrf_get_ranges_from_chandef(chandef, &ranges_in);
>> +	if (ret)
>> +		return ret;
> This really won't fail, just if the bandwidth calculation was bad, but
> that's an internal error that WARNs anyway and we can ignore it.
>
>> +	return wbrf_add_exclusion(ACPI_COMPANION(dev), &ranges_in);
> This I find a bit confusing, why do we even propagate the error? If the
> platform has some issue with it, should we really fail the connection?
>
>
> I think it seems better to me to just make this void, and have it be
> only a notification interface?
>
> johannes

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9524547D70B
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 19:41:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00C1910E224;
	Wed, 22 Dec 2021 18:41:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2053.outbound.protection.outlook.com [40.107.244.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F389510E224
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 18:41:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g5KKN775gO9yypBR1gaERTNK5rZx4hMfyLSX75+JBqa8afOoF1IqLgnltFMEoR3wIMEEEjKA2XNgjI6zkN90lk+VOkq5t+B88g4sPh/gqV8nw9VLUsj8hRkwsS4JlL+W5anjlh+2MVcPpMaIIx/dGKhTfqAVFq3967/949iD3wIJbrAjJpdNwCEEkDzp9xL28FLDHgSqiXHcT8hH1IenoaOFLLXwFUAnnuvH5ypsgBW7rYDbfqdD/XRfips+h/QfIqtK5Wi2WJ5w1a+Pz7TPD4OnfQyNuQjxJXXSH886b671piQxJbOWm8iyadY90vjiOR0v2/3Cj9k9XSed7XvUPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iCisSz4oAlzVdViZB6aSFxqo+8WzEl5DuxdjlU8NJXg=;
 b=bbDXIWbuHhtqaOQEdy/FIHZ7rL0BUk0QO3brzpkWMR5zLo8ktYJQQaDJahyqmN5xzawBMJe5mDKfUi66VW2SIil2t8tLO1nAJL1xUUe9jDjTbzANrUbTgeYEI3u7o4KgHMcx119MxZga70jo96dhoy3l5Cxr1b5WMYMEspEb0bobLHVtv+VniqGUBpHklLIiA4lLs8WCM4+6OwbHanphu5oGATyL/6uhzUqfYl0XAZRi9C3xk+h+fyqvY4EYak+ssK5kq0TIorbEAmiTd+e5v4RlMuHQh+Wx6WRzFobnpx113jhCLHMdf7+FtkdBNK9YTTlfyrrvxRoUNcNxiEHWeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iCisSz4oAlzVdViZB6aSFxqo+8WzEl5DuxdjlU8NJXg=;
 b=Ckhgi0Cc3t7dl3PuiN5GWENYw2hZL/hXh4qZOu31m2iBX63K9chmnRGnqus5QdyWNLukqCv1Le3iZgi1JtjTqoMoi5Jxp++4Fnb5LCqw8foc5tCbk09DB4aoQQiyYyB9xAndRgRZ6VzuJidnzwgqg3ZDoXCQhrA94ObtbXlYT/0XbYYzw+NZ0Cg1NZ6Ow4qyLYXn60xC57f+0dq6xzqIrchJhtMS0PxU1xFw/hpZg8Kdv5ZqiLTWLUYTgwNYo7oeAg4QfaE1KQXIsxlEDoYsxN5NqqRGc7cRpz6noxlCPE00v1TJjtS8B9NoZqkg/phkBXsJ6w7s2wGbRP73ZiNOOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 CO6PR12MB5396.namprd12.prod.outlook.com (2603:10b6:303:139::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4801.14; Wed, 22 Dec 2021 18:41:25 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::ecac:528f:e36c:39d0]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::ecac:528f:e36c:39d0%5]) with mapi id 15.20.4801.020; Wed, 22 Dec 2021
 18:41:25 +0000
Subject: Re: [PATCH v16 08/40] gpu: host1x: Add initial runtime PM and OPP
 support
From: Jon Hunter <jonathanh@nvidia.com>
To: Dmitry Osipenko <digetx@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver
 <pdeschrijver@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>,
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Michael Turquette <mturquette@baylibre.com>
References: <20211130232347.950-1-digetx@gmail.com>
 <20211130232347.950-9-digetx@gmail.com>
 <21212ddb-205f-71d6-0199-d75768eaf32c@nvidia.com>
 <41edc53b-5ed1-d524-2546-c3d1ee6cdea4@gmail.com>
 <6652ac84-36f5-0e43-65fa-04786f384f21@nvidia.com>
Message-ID: <56dce9c7-397d-75b0-b5b8-18ce1084e72b@nvidia.com>
Date: Wed, 22 Dec 2021 18:41:15 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <6652ac84-36f5-0e43-65fa-04786f384f21@nvidia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM8P191CA0017.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:21a::22) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 28cfe679-690c-408f-28c9-08d9c57aa841
X-MS-TrafficTypeDiagnostic: CO6PR12MB5396:EE_
X-Microsoft-Antispam-PRVS: <CO6PR12MB53962A62A40801FA11948493D97D9@CO6PR12MB5396.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xp52V6GEOGSefPtYs+TKiNMhhbY56Rb4DPk4rJ/H8cIKpdhbTiydVHJ9DjkAKU4o5LG52Sc6DOZOO0YoCnHE4Ff4ieecai6OvFdAAjxMpCBEnkLXdxDv/tQlpJp+PY/I+xKYfznpZU2Ib3ViHTCE0JU7JYCRmpPsZzhTeIeGbDiXuBU6MwIAPDVuCat316vJFYtpp3JwNt+MdMVfExR4JNJ9dZVvTmMEGDvKEU7iWudk29mxlCv1NuMrLwQXDqgIL72/vksImZMKWTfIbGDbMdtvy2E65mmavM6EAMqbOCawEVIb4YiGUoDVVUo8+csdeOTCwS3IKU9DZobJG4S0+zElmTSNEwPRFK2dZr7Zsd6bYnTJYcQ1yfb2siHR5faW/JQFioNaICpIUPbsJy6XS3f+zqZS6KQqzQWaQ0v2Br3wWcNWs5c+75LBGO8UUPBQIRXHOTd6xfeUlJcq03CFS4aK//G58YDuPvcLqP2ha6TDP+K/wkkGmXXlkextLq77b/rzgwF/uc/2GI5XRJuaoRF37Bt/v3YtseJn7lfI+FGT5AyqMq6bqHV71KxN5hTD4nBvzqBba+hA2yHodeIqWRA/pWdbNsK4/rsw5fb5wECnuqRoH4ggwxuehMA3ez3GwrJeZEJHN0aiMm92rrpDBQHRQmi28ziX7nPwuhPxU0j3+DnLLi6xlzaQtR+9WS/Ei9+xvt0KFzrLw7mUyAY+m5SVVjNJGIHP7GqbyIxEjS12vgqRPkDoXpfiGrvXJbiOgCeXjIii9QtI9aPy/WyFsE4k9vkEgPKOz5jsHpHLGFH3SSJQuXtLbSopaH+/Q+2I
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5444.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(55236004)(53546011)(31686004)(7416002)(66476007)(6666004)(83380400001)(8676002)(8936002)(86362001)(4326008)(31696002)(6506007)(66946007)(26005)(186003)(508600001)(6486002)(38100700002)(2616005)(2906002)(66556008)(316002)(5660300002)(110136005)(6512007)(921005)(36756003)(32563001)(43740500002)(45980500001)(357404004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SFVRejZnbnNFSS9qbmRlcmp5Q3QycHhVZjlBZ0I4RWZWc2g0UjhSam1ZY00w?=
 =?utf-8?B?MHVSWVBMenVPOWsrWFcrN0tMN0FpNWNRY0dlR0lWYVJhbDhUTUl3UTY0cHpw?=
 =?utf-8?B?ZVJnNjZnL2hmRE5qMml1UlFXcGlvMmlvMUtJSEpkdVI2T3VHVFo1eFRzVWxF?=
 =?utf-8?B?UDh5cW83Sm5nVWpDSlNYS01qYWdzbG15c3V2N3M0N1lha0ZRZ0Nnd3NoUGZL?=
 =?utf-8?B?QVJqbUpYRWUrb0N6dk5Fb0I1VHVHSml4UUNMNXNiSXd3R1grcHFUYVE2K3JO?=
 =?utf-8?B?STJ5OW5pUzdYZFYrYm56aFcwRVpRelVXLy9FelpueDlTR2w0aGMxVVVjbnN0?=
 =?utf-8?B?dTF5MndteWpDY0tHN1Y4SzE4dmRBR2pkWldwdzFyWTVhaUhYMFVoczl3K05I?=
 =?utf-8?B?NjIrLzF5L3RMNlBSVkVkUmhaMjUyR0U1ak5lSHlkRFRYVnJXNUdqTHdnV3JV?=
 =?utf-8?B?ZUJCQ202NmU0bzhiWFA3QmtEZDc5S0ErZ25NMWh0WndRaDI1MURxajEzNVhO?=
 =?utf-8?B?SnEvWlhmdzBOZ0tPbnVENFBreUVaeG90ZzdyL25EcmN4emZvTllTQ3lZb29v?=
 =?utf-8?B?bkQ4aXc1U2hUZlJ4YS9HQTFSMFBNa3UzNmY1WDdxRGZwbUxHdnFaZmNnVC9V?=
 =?utf-8?B?NzNVL2R4WWV2cjZFc1lhRExpVFZrczhOY21KVngxMk1JMnB3R2M1eXJKNXd2?=
 =?utf-8?B?enNMYmI2WTFXTUtrWEhEV1k4TWJGa2lOcVdESnpGUWMyU3NnY0pOYTFUcFVy?=
 =?utf-8?B?NEJScHNEK29wNG1HcmtGTjRkWS80bVl2MTZvbnVncjQxMXdDY0xJb3dwTmxj?=
 =?utf-8?B?VzRkKzNkMFhpT3JiaWxZRDlwdHVLQ21na2pWdFpiN0hUNk9sNkFRNXIySVp5?=
 =?utf-8?B?RGFoMjAxYk5KVEhNZTczT1U0VFRESkJXMXlZbFV0ZWVlekk3V3gxSkMvRkk2?=
 =?utf-8?B?MjU5YUpmZlA3OG1zdkMyY3VmL3VCcUFnVHhCT0JGTVlBQjZadHhBWVRNNjh5?=
 =?utf-8?B?MEpoRlMxb0VHMVVBWWxkZXp2UEE1WUs3djlueC95bHZNR2txNVJpUFFIaGRD?=
 =?utf-8?B?SnVaQmJTdWF1OW5pNisxaGszQVNybVhBR0draWVRZnBiek4yRGIva3RvckM4?=
 =?utf-8?B?UTJKVXZuTFMybm9ucW1rdGFwOUg3dVpXRjRzY0hlYTJIeEJReXhKbTVnSE53?=
 =?utf-8?B?ZlF3S1FwVDVQL2Vra0NjZ2M3Q2o1dUJWWnYwRG5pclZFazJzQ0p6RzFjQ2Nw?=
 =?utf-8?B?WEJITk5mcWhEVmNHQmZmQ0dqRWg0Mktoa3YxbHNyNlFEcFlTWjVOUFZkYXJz?=
 =?utf-8?B?SU1XZGxXTDVVVWhacGpWby9CUG03MWdJRXVPRzc0SldVbmNva2hOanVHS2c2?=
 =?utf-8?B?bktTY0RrTnFERWtrL1ZjaHUxd2x5RE9TUDhUODA3L29mT2FZQTlqZFdvaGFK?=
 =?utf-8?B?OHFwT3FkZnBGakkrZ2dNVDZUenBYUU1ENmtQcys0ZkNZbmt3WHVaWXNqRUVj?=
 =?utf-8?B?SGVaL0ZiTitMamtSaUNiRWhwR0dGTVdxYnJkS2E2bTVyNU1rdVIzQkxScWJE?=
 =?utf-8?B?K0JTNU1nQXowWjhNdzRRYWxQQ0t5cy9kZTNFMXVLMHVEL3pNWjFyaldBZFQy?=
 =?utf-8?B?STJEM01KNExPWGVYWmF3ZHFIRjdIdVJtUGFDbVlVMktrUEhlTXVxQm1zbUhQ?=
 =?utf-8?B?MUQvSmh5a1prem1OaVYrUmhPM2tLb1RDSUg3SnFHUUZGSDV1Z1NvYm9SdXho?=
 =?utf-8?B?Vll6bGFiKzI5Y3BMM3J4U3I2cGs2dndFN0F6d3dDWFhzb1dGWDNqdHlteG1S?=
 =?utf-8?B?dG1td21EaWlkaU11c3dGMGY4WitjeDQ3dXZWU08xK3BBUGl0WnI2WXNGM2Zt?=
 =?utf-8?B?dmNYMnlRU29iczhocThOM2V3N2ptTjV0aStreUYrNmlBdDVMZzdsTTkxZHd4?=
 =?utf-8?B?c2p4U0Erdkd2S1dsL3ExTDFxTmhhMm1QNVNMeFQ1RVlUYzRFTHNHQURLc2lS?=
 =?utf-8?B?aERVaDVTUFR6Rk5UL3dYWkExVkQrdlBRcENITWVrVnI0Y1ExUkZXbDMybG9Y?=
 =?utf-8?B?ZXpPTWJFRWtNTzFWTmVqMGlGanlRZjgyT1RCWEl0V2NHdTB2aHphL0RsZW04?=
 =?utf-8?B?N0IyM1pSQjF4Wm1CZ25LMDBKa0ppTDQxSzFVcnZrbUxkSFBIMEMrUU9BdzRV?=
 =?utf-8?Q?gSKhr7Y83hrHk0tGOdZ9J1g=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28cfe679-690c-408f-28c9-08d9c57aa841
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 18:41:25.1888 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VlgDEcyElKnBxAl+1Q/N8tU9Xg9BtL2VvvV7uAy0vsEfMUj8Mbn3CJaW/E9G3xNgsKrEJvZuByydwF/EDTBSNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5396
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
Cc: linux-pwm@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Heidelberg <david@ixit.cz>,
 linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 22/12/2021 09:47, Jon Hunter wrote:
> 
> On 21/12/2021 20:58, Dmitry Osipenko wrote:
>> Hi,
>>
>> Thank you for testing it all.
>>
>> 21.12.2021 21:55, Jon Hunter пишет:
>>> Hi Dmitry, Thierry,
>>>
>>> On 30/11/2021 23:23, Dmitry Osipenko wrote:
>>>> Add runtime PM and OPP support to the Host1x driver. For the starter we
>>>> will keep host1x always-on because dynamic power management require a
>>>> major
>>>> refactoring of the driver code since lot's of code paths are missing 
>>>> the
>>>> RPM handling and we're going to remove some of these paths in the 
>>>> future.
>>>
>>>
>>> Unfortunately, this change is breaking boot on Tegra186. Bisect points
>>> to this and reverting on top of -next gets the board booting again.
>>> Sadly, there is no panic or error reported, it is just a hard hang. I
>>> will not have time to look at this this week and so we may need to
>>> revert for the moment.
>>
>> Only T186 broken? What about T194?
> 
> Yes interestingly only Tegra186 and no other board.
> 
>> Which board model fails to boot? Is it running in hypervisor mode?
> 
> This is Jetson TX2. No hypervisor.
> 
>> Do you use any additional patches?
> 
> No just plain -next. The tests run every day on top of tree.
> 
>> Could you please test the below diff? I suspect that
>> host1x_syncpt_save/restore may be entirely broken for T186 since we
>> never used these funcs before.
>>
>> --- >8 ---
>>
>> diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
>> index f5b4dcded088..fd5dfb875422 100644
>> --- a/drivers/gpu/host1x/dev.c
>> +++ b/drivers/gpu/host1x/dev.c
>> @@ -580,7 +580,6 @@ static int __maybe_unused
>> host1x_runtime_suspend(struct device *dev)
>>       int err;
>>
>>       host1x_intr_stop(host);
>> -    host1x_syncpt_save(host);
>>
>>       err = reset_control_bulk_assert(host->nresets, host->resets);
>>       if (err) {
>> @@ -596,9 +595,8 @@ static int __maybe_unused
>> host1x_runtime_suspend(struct device *dev)
>>       return 0;
>>
>>   resume_host1x:
>> -    host1x_setup_sid_table(host);
>> -    host1x_syncpt_restore(host);
>>       host1x_intr_start(host);
>> +    host1x_setup_sid_table(host);
>>
>>       return err;
>>   }
>> @@ -626,9 +624,8 @@ static int __maybe_unused
>> host1x_runtime_resume(struct device *dev)
>>           goto disable_clk;
>>       }
>>
>> -    host1x_setup_sid_table(host);
>> -    host1x_syncpt_restore(host);
>>       host1x_intr_start(host);
>> +    host1x_setup_sid_table(host);
> 
> 
> Thanks! Will try this later, once the next bisect is finished :-)

I tested the above, but this did not fix it. It still hangs on boot.

Jon

-- 
nvpublic

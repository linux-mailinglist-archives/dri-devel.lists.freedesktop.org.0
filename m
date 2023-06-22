Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BE573A97A
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 22:28:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 063B610E028;
	Thu, 22 Jun 2023 20:28:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20619.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::619])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B1F710E028;
 Thu, 22 Jun 2023 20:28:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VUVQZpoY5e3r7CVd5FMFIJd8lxtT4THbB/M4F4TpLldfZmZoz/sToYE5QxXM2GUWO3NiorKPGpgrTs3DjgnEvjlFaAfBagDdBGpDCurkeU+GMKCa2AhTcEqbXqoaRaDAtwnq7oOGUwK7L2ZxS/biO4/kLc4xyyd+viHcgvsrbgm7naB1MpZ7CW/5+W/LKWg8ZH7grOcFOSeppFS8byMZGQX3UjID+UtIvWTSmloAl7Ws6oGZ27OktwHnwxO8gMyywMa8E+5JBys5SoPZunBxQ+5UMkV9k97UWnxfm5tdq+zaZ5WQaRMFiCjK9umLKtW9OwXgN/XOoJxF6yAFVjf4uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QgMZxZyIThZ6iWrSNno0vz9zXLmjXPn37d3mR2d0IRs=;
 b=LYBWrHDJVHSWi/8NIJ5N6aqo0kPksK4XMHiCNxvxHsD0CNa8XtvFiUJ68ePK7QEhktnSpXCMgPQJfS73DDvYRf9r2ORFIanEeM2elx5DwHLy+kyPHz2LJ7sqUrwqODjQaxBHyZIxFhmjXFx1eveokkoXwve0+FZIwM6v3yhvMm5Z4CkeJKCIU5qPUmyRY4PhthAYwaHIchy7GpW2IsGNRhMBBA2FO3v1nY9o+ripMA/2sRZDQU98NM/t9K1iWLuW/TLqDJy7YD2YQwGdHv5euHQyhR2NMaoK8pPOKc53mcCzW6kJLLWNSFxnLoshareW15tKSgtqaezvBR7dsnmoLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QgMZxZyIThZ6iWrSNno0vz9zXLmjXPn37d3mR2d0IRs=;
 b=yTuwnXGc9hKSpSqbLRE2EB7V9aHH0u6dT/xGbhKjUVy6U41X/gulqu2C7h0+7aa0mmHVYVkaEUcQ6afvUIADIs7EcMfkfOKMb7rMHM66lS8JNbC7wIqo+SwO3B0kKzAKPKjUU1dRe2sE+yeqrH+6PnkVeq+fVPVS3o0r+Lpmox4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by IA0PR12MB7674.namprd12.prod.outlook.com (2603:10b6:208:434::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Thu, 22 Jun
 2023 20:28:44 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dfcf:f53c:c778:6f70]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dfcf:f53c:c778:6f70%5]) with mapi id 15.20.6521.020; Thu, 22 Jun 2023
 20:28:44 +0000
Message-ID: <4e522001-7b36-0e38-10d9-22c55de728ea@amd.com>
Date: Thu, 22 Jun 2023 15:28:36 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH V4 1/8] drivers/acpi: Add support for Wifi band RF
 mitigations
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>, "Rafael J. Wysocki" <rafael@kernel.org>
References: <216f3c5aa1299100a0009ddf4e95b019855a32be.camel@sipsolutions.net>
 <b1abec47-04df-4481-d680-43c5ff3cbb48@amd.com>
 <36902dda-9e51-41b3-b5fc-c641edf6f1fb@lunn.ch>
 <33d80292-e639-91d0-4d0f-3ed973f89e14@amd.com>
 <9159c3a5-390f-4403-854d-9b5e87b58d8c@lunn.ch>
 <a80c215a-c1d9-4c76-d4a8-9b5fd320a2b1@amd.com>
 <8d3340de-34f6-47ad-8024-f6f5ecd9c4bb@lunn.ch>
 <07ad6860-8ffb-cc6c-a8e5-e8dc4db4e87a@amd.com>
 <08dd8d17-6825-4e53-8441-85c709326f48@lunn.ch>
 <3e337dc0482e16e2aaa4090b613dc8dea7803fa8.camel@sipsolutions.net>
 <ef7dc1ab-c6d0-4761-8d0a-8949bfd3da80@lunn.ch>
From: "Limonciello, Mario" <mario.limonciello@amd.com>
In-Reply-To: <ef7dc1ab-c6d0-4761-8d0a-8949bfd3da80@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR10CA0013.namprd10.prod.outlook.com
 (2603:10b6:806:a7::18) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|IA0PR12MB7674:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b16860c-bd64-4131-764f-08db735f44a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3Uzw9drOXd2MmMi8YpGPBY42FLSBiukxBy7qnM/gmrXgSdeKoViTfnYGhJ7LA0Vj1pyNsRmNatU/QdKEg4wjDWVSMqcy8PHC5jTsgw2tr4mSD8OJnfbJUVr3yOLED+dlDx5yPqs/4ph05GKrzrb5k2uyBjyhQ8NjrFOI9kiSgVHGo7bHkfX6wenKC9GhyoCaum1QnpbMLFl++V6f07ZT1xaZ7JwpHtppwhWomN8BeIPHggdTaTDdT7/zJo+Px9q982XFj6wDAqYWbjLPx6WZ0F0p62VaI/C07JYNmaSg47QIYJXcwWEqfZ4y2bD3oWZkwBOcXs+xgfGruhhTU1s53yMdADp9UAYXoVlrPy0dtmeqDvs/Hl3W1M11aIhpa1mzMMmyvhjQePchgaCZH07l6fwjX7PS/3cSBXRnWJ0RKSUlGUWOZzN9drJg2/Vd5IatewhwyEVaqpyVVmZgfc9lHzCXmt0Qlmtyg/t6U8eIdNvNI19Ud2UcevDi4Av8XyE4Z0vT4Pmxys990CvtMQWk1gk27+u4tvw4BW93Y3gqU6GxxqLQvyXtcQkFpC8DTAPAP8aXqQcS34KNA7F870teM0p+MJqX9R+hc3zu4ax+3KFP8b2CG1SXW95uHZ+cS9sZiHS5Q9kt4IhONkBzh/WC1A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(39860400002)(346002)(366004)(396003)(136003)(451199021)(5660300002)(6486002)(38100700002)(6666004)(478600001)(54906003)(41300700001)(8676002)(7416002)(316002)(8936002)(110136005)(66476007)(2906002)(66556008)(2616005)(66946007)(4326008)(83380400001)(26005)(66899021)(186003)(6512007)(53546011)(6506007)(31696002)(36756003)(86362001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?am1WUE40WHE0ZXdRcm5WNHAvNzBBK3hIQkJNSmFuSTg4UVJtbk1lMFdKRW5h?=
 =?utf-8?B?L1NBVk9NZTFVZmNqQkxlNHBMMHJpMTlKdytXUUdKVzF3SjYzLzJxUmpuUm9h?=
 =?utf-8?B?UWhBL2EvTjFQQTFBdEM3OHQwT0o0NWdQNmwyZllSRWpvVEVjaHZqcW1UY21J?=
 =?utf-8?B?NUFrWGN5WkJEdmUwNFFOeWxkSE82V2x5WEdkK084TjNqaU9Ya1IyUmpLZUpH?=
 =?utf-8?B?Rm5kV1V3bldHdUFSMnlXMURYRThrWkFxb2NEaFBVSVQxK3NvV3ZFenQrNksy?=
 =?utf-8?B?Z294aE83eDVjVEtxanJaNVpsQ3Jpd3ptMkxEcnVJNHY3dTlBbnVpN1pVZjM0?=
 =?utf-8?B?RVpRRHNiV2VtWk9LcFo3VHR5Y0lpbUxpTmp0Nk9SMU9Ca3NvVmNiYkQvam50?=
 =?utf-8?B?VEN2SzJNR3hycVNHeXpMQzBFSzdMZ1JqWDE1eWVrcmJWaW5FSGJHT1U2SUNk?=
 =?utf-8?B?VmVnOExYa01uRXdUSi9FVDdsc2dlcndSZlVDSnV0RnFWMVVXMGxsa29iVTBL?=
 =?utf-8?B?Q1VHNXdDS2kxMW9UZUs0azlaUnE2RWZRTVhoc3ZwUTgydHduek5OMFkvVVJ6?=
 =?utf-8?B?K1BJVEovKzJLTUw5QXljRUFtZlpzR1RzSUpPQWVGbmhEMFZiaWdHWmVJRDQ5?=
 =?utf-8?B?RURMQnpLT2kzQ3NBSmRFVHZtTm9PVFhZT3MranhsdzhkVGRjYnJ1QkV1V3Zz?=
 =?utf-8?B?Y1FUWDRBbHAyUUFTRk1yVXNLNCsyWTdtbnFYb3hEajQ2c0RrdWp4VEFsdkpE?=
 =?utf-8?B?M2d6dWFLTExkSVFxczl1RFdxdzM3cHV1S09HaDlEYmcxL0FXUjJzd1U5V29L?=
 =?utf-8?B?TDE0YmpMc2pJYUF2SmJpVDBoQm9DOXdYSGM0V2JTa2xiQ3FaeXFHekJGVjFT?=
 =?utf-8?B?am1FYUxLUGgzZzlVZFhhZW5IOWJqQ2Vwb3B6SGVRN003V1hWT1RxK1JBUGVh?=
 =?utf-8?B?Vm1QYXpnU1E5ZlNWcXNzb3BRTkZPK0dQc0h6UUFPd2NPcXZQVTd2NmlPZ3ZH?=
 =?utf-8?B?b0VQODNTY3J4MXEwS21UZ29ENWlhM29DaHI0aFRqbDFNOWxZZDEwb0JEY1Vy?=
 =?utf-8?B?V092Smh5MUVZdC9FQmU3YnJDZHAzQUlEcWpQa01JdUx2MzJPbmFsSVB3YTYx?=
 =?utf-8?B?NTlTTytZS2pvTW1iSGdyWXRLcEROdlp2OVZPN0Y0c2dSNUNSUlNLbkxFZHdE?=
 =?utf-8?B?aFZPTWdEMnJFenJ0TG5LN1BWcjhZMHBBSWZTLzRFaGVDSTNhMWxrY3ZQdFZ0?=
 =?utf-8?B?LzdyQ1M0d3BZMSsrWGY1UWpzakRsdmM4K1lITEpQOGU2UnF0NG15L3huWTdG?=
 =?utf-8?B?SDR3bURpQlgyRFZzclVVbzZqTlJjTzJzYms3aElRUXR0R05LT0xGTEVNY3N6?=
 =?utf-8?B?cFYzOTVyNVluM0hucHBaY0dQRHpvUmZoL3ZkNEVHL3JzVWlhWFRpT3NRODJl?=
 =?utf-8?B?UXVPblpHSTAwTU83WU9XVXVJd1IzVWM0eU8zKzJQaE9nVFNCczUrYVFsZGdF?=
 =?utf-8?B?WWp3QTBqTWkrRkdmMjRxemlmcGtHKzcyenRXQWNVY096anhUMTlyUkllcDBO?=
 =?utf-8?B?bTJaNlN0MU5zVDlRMXhOeGMrQ2V0UE9qWmloOTF1TjlhQnBqRXJwdHZ3RjNQ?=
 =?utf-8?B?eW5QaHNrbWNNdkR3bTRsQW84TXdJRnhMb0Z5MFlKVmNqeVVzZjVoMUttYzI1?=
 =?utf-8?B?dXlaOWlES3N3dmhVMHdxYjg4RzlNaW00bzdib3Vma1JNUEI5S2NvN3Z4OXdo?=
 =?utf-8?B?WU1Cc05zcEZUeGQ2K1ZrbFowbGxvOVRGcS9mMDZkNDZvL2oxNWRpcW1XSDhW?=
 =?utf-8?B?aEgwMnVNTkxBSnRQVFJDRnFETE1sNk13Zys3blNCK0NLaGNkNVUxMmVpNXRz?=
 =?utf-8?B?cEFneUNlejRqYUM2SFcwWWpDdStsejRhT0ZvdFZYVTZpYjVJMEtIUFI4WCtl?=
 =?utf-8?B?aXdLdFRDNmtINWIzR1ZqRHpRZWxYOFl1dTNWSmVOREpaMDY4NFRIa09DaUth?=
 =?utf-8?B?SEo1MlVCc0VwZy9uZW1iRUJYKzBPNXl1TCtZaVRnUGF4SSt5YmE5ZndFL1BI?=
 =?utf-8?B?ay91ZXFydVM4TldOV21ZVEZQbmh5aG9XekdIZXFsT0l6UVVib1AyeWZZcjhl?=
 =?utf-8?Q?ekZjXPFk+Df/rSstpZn/plNKj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b16860c-bd64-4131-764f-08db735f44a4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2023 20:28:43.7700 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VQ5ODzVdjWdpBluKfqZVnOXbs7xaUSs07WlhhKZK14HWjP/8+Agy+9pvIQrAsu3aOYAmlKfbuhE0Z0RRk6bhUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7674
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
 lijo.lazar@amd.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, mdaenzer@redhat.com,
 amd-gfx@lists.freedesktop.org, linux-acpi@vger.kernel.org, kuba@kernel.org,
 pabeni@redhat.com, lenb@kernel.org, andrealmeid@igalia.com, arnd@arndb.de,
 hdegoede@redhat.com, Evan Quan <evan.quan@amd.com>, netdev@vger.kernel.org,
 Xinhui.Pan@amd.com, linux-wireless@vger.kernel.org, edumazet@google.com,
 christian.koenig@amd.com, tzimmermann@suse.de, alexander.deucher@amd.com,
 Johannes Berg <johannes@sipsolutions.net>, davem@davemloft.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/21/2023 8:55 PM, Andrew Lunn wrote:
>> Honestly I'm not sure though we need this complexity right now? I mean,
>> it'd be really easy to replace the calls in mac80211 with some other
>> more generalised calls in the future?
>>
>> You need some really deep platform/hardware level knowledge and
>> involvement to do this, so I don't think it's something that someone
>> will come up with very easily for a DT-based platform...
> What is this API about?
>
> It is a struct device says, i'm badly designed and make a mess of the
> following frequency bands. Optionally, if you ask me nicely, i might
> be able to tweak what i'm doing to avoid interfering with you.
>
> And it is about a struct device say, i'm using this particular
> frequency. If you can reduce the noise you make, i would be thankful.
Hey now - you're making assumptions about what's badly designed.

At it's core the issue here that prompts all of this is a
"platform" issue with the tiny Z heights laptops these days
strive for causing implied limitations for shielding.

Independently both components work just fine.

>
> The one generating the noise could be anything. The PWM driving my
> laptop display back light?, What is being interfered with?  The 3.5mm
> audio jack?
>
> How much deep system knowledge is needed to call pwm_set_state() to
> move the base frequency up above 20Khz so only my dog will hear it?
> But at the cost of a loss of efficiency and my battery going flatter
> faster?
>
> Is the DDR memory really the only badly designed component, when you
> think of the range of systems Linux is used on from PHC to tiny
> embedded systems?
>
> Ideally we want any sort of receiver with a low noise amplifier to
> just unconditionally use this API to let rest of the system know about
> it. And ideally we want anything which is a source of noise to declare
> itself. What happens after that should be up to the struct device
> causing the interference.
I do get your point here - but the problem with a PWM on your
laptop display interfering with the 3.5mm audio jack would
likely be localized to your specific model.

If you have the 16" version of the laptop and I have the 13"
version I might have the 3.5mm audio jack in another location,
that is better shielded and so making that assumption that we
both have the same components so need to make changes could be
totally wrong.

If you have EVERYTHING with an amplifier advertising frequencies
in use without any extra information about the location of the
component or the impacts that component can have you're going
to have a useless interface that is just a bunch of garbage data.

I really think the application of this type of software
mitigation should be reserved for system designers that made
those design decisions and know they are going to run into problems.

> Mario did say:
>
>    The way that WBRF has been architected, it's intended to be able to
>    scale to any type of device pair that has harmonic issues.
>
> Andrew
The types of things that we envisioned were high frequency devices
with larger power emissions. For example WWAN or USB4 devices.
These fit well into the ACPI device model.

When Evan gets back from holiday I'll discuss with him the ideas from
this thread.

However before then I would really appreciate if Rafael can provide
some comments on patch 1 as it stands today.


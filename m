Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03624738F2A
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 20:50:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C11610E344;
	Wed, 21 Jun 2023 18:50:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20626.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8d::626])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE9B710E344;
 Wed, 21 Jun 2023 18:50:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T64V+dMoaV+KQE/EXkEPIYHBf37CTchBSr75y8/emNJwMMkD4hVjRwWYSFMMcJSzpjxGiQARuGZev3cN6FgYQ3GG2myA9osjf4we4aCaZS4in7Pn6g25gG3wpO/b9VHYxjQu8iTE2Z1+9XCdtmaM0F0zdO2bpA6/s7FeXNG1oKD6QcnmnxblLJkypQ9hiixB8lbY60qYf7XDavXaE8Txm9DkwYDg8muAEt2+mYN3j8PH0UV3V1OUWD2qNUalyXMkIx6rE8Gbi+fzeMdsnZeoQaNuYdHAvgiFUTbhY4aoVn2kTHdUqkSGz3gQj0P6YY7p9Do7fOCgcp/L4CMW1I+HSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9vzajxK6jmcnW0W0LSnPn+KaIU/2VDE6hzkCuIqoNlE=;
 b=F949O33n8Of+t/Br8UySSs7glSuCl2F57Z7Vgz+Qx9L67/Ia6JUEglBqqRLr/hQwchqlZWOda3N5Bu3+CbcwS+OB3yuU7ypW9i0Lwa3W4CTb7vwhzd+umr6dOWWRbyBW6vI7v7aBWTv66czpAUt0VASooUuqeeyNfziM4e9iWBaEZ9Bfi9w8Vwen9KMKAwtQKGnKLlLEkPU/P6kQLb+KjfJr868uKi8ezIPkFpPEkolm56U+Z8yoztxuc6f6sVviKjBHmWFPslNH1MWG031RbsZjq+getSkcBNLzYi92NJ/aDv/GZHJS352Cr3tjTh93/jhTNQsSFowHLkKe4rmCOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9vzajxK6jmcnW0W0LSnPn+KaIU/2VDE6hzkCuIqoNlE=;
 b=ftdAeeUIG70BonAVFJNut7Tgq1VDs/F8xlQrRr6IZMJTAcKj84PiFnhtYpmTG/me4ShE5+TAciqev0bB85d1GxdIXJEFmKXjl0D8BwSWVtsSFAd9AdFyhyNSfpce/OicPJWv1IUBtgFcRMw4ziuqM69uKSBowUdV7UuE33AlFSY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by MW5PR12MB5622.namprd12.prod.outlook.com (2603:10b6:303:198::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.21; Wed, 21 Jun
 2023 18:50:39 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dfcf:f53c:c778:6f70]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dfcf:f53c:c778:6f70%5]) with mapi id 15.20.6521.020; Wed, 21 Jun 2023
 18:50:39 +0000
Message-ID: <07ad6860-8ffb-cc6c-a8e5-e8dc4db4e87a@amd.com>
Date: Wed, 21 Jun 2023 13:50:34 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH V4 1/8] drivers/acpi: Add support for Wifi band RF
 mitigations
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>
References: <20230621054603.1262299-1-evan.quan@amd.com>
 <20230621054603.1262299-2-evan.quan@amd.com>
 <3a7c8ffa-de43-4795-ae76-5cd9b00c52b5@lunn.ch>
 <216f3c5aa1299100a0009ddf4e95b019855a32be.camel@sipsolutions.net>
 <b1abec47-04df-4481-d680-43c5ff3cbb48@amd.com>
 <36902dda-9e51-41b3-b5fc-c641edf6f1fb@lunn.ch>
 <33d80292-e639-91d0-4d0f-3ed973f89e14@amd.com>
 <9159c3a5-390f-4403-854d-9b5e87b58d8c@lunn.ch>
 <a80c215a-c1d9-4c76-d4a8-9b5fd320a2b1@amd.com>
 <8d3340de-34f6-47ad-8024-f6f5ecd9c4bb@lunn.ch>
From: "Limonciello, Mario" <mario.limonciello@amd.com>
In-Reply-To: <8d3340de-34f6-47ad-8024-f6f5ecd9c4bb@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1P222CA0170.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c3::26) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|MW5PR12MB5622:EE_
X-MS-Office365-Filtering-Correlation-Id: b4fa8b6f-5b7e-4cb7-b909-08db72886811
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PiXe0IPIoZ7T8W83wcG58t3JAu4aCOAFypK4bezP7PBorMLcBurDVPgd2hlpECezhLgVZv5MCQ9ej0PANHPa/iD6QzvLKLAGM2maLZzTqYUXmilGuU8x2nyrhnRKHP+uZvnSjNMCkpeqn69rfg84qKyxmJDdnCwjNGYAutxEtWnGEZXze5wLK+LGh3Oc6V/YXHxCmvg56VRNpnwwzX2E06oes8PolzS19kpPcFMAJP6NKGykaXu6MJo+O+Wcv4ZRIgkZggEVB9Fk2+tAAoQ/zbBGsS93EKS0ojBJFYhQBzCMijjWT5Br8LLCe5ElQCWPu7A8lZJE+LJ+ENsfYt5Cp/cKmizE3oNLg+o1ogGDq8HaRevBrcUa80h3PIsiG8l3Ofm8vIZEOsPj3mRerkiAkBuSnSyh4/a1su0pPWx75v8vl7k223Ifh0JcfzwHllQeg/WXcZJ+zmvF04uGSTpqEnMeqt9wOhiESl+EiStpFuEY1RmlF5gL7zpR5f/w3VYl7izzxynwuiuKcIOg4tyD/ZBoAab3kPPmAX/Qd74U+Papc+1OV3qoJB9R4c25H4HA92LR5FuLDgVQvbCaw1yBZsA8ZuqVxwwLDO2ijep2eWDMCtirKq5EEuZc/XgXIpvAG0YTdDeLPkkX5xVoxJsvug==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(366004)(39860400002)(346002)(396003)(136003)(451199021)(5660300002)(7416002)(2906002)(8676002)(8936002)(83380400001)(31696002)(36756003)(86362001)(38100700002)(31686004)(186003)(54906003)(6916009)(66476007)(6666004)(4326008)(6486002)(66946007)(478600001)(66556008)(26005)(6512007)(41300700001)(316002)(2616005)(6506007)(53546011)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXJDVHd3WDFCaU9qaEEyVEl1UG5tbEZCN2dudHBtVlRGN3dTN1RDVUNZenJn?=
 =?utf-8?B?ZzE2dlhuWms4cU9oM2hTQXVuSWxSUVhCTW9JRkM5NmxhV2t2cDB6bDdTY0FX?=
 =?utf-8?B?UkxFNHZNbzBzd2hPR2lHVkV2T3ZPcUxjdXNkamZwZWNiV3o2QnIzRStWbkJW?=
 =?utf-8?B?MFcwdXNmcUc5SktSd0R2ZUd0UmoybHNFVkM4eCtsRCtXbTlZZHVtNGhXYWYy?=
 =?utf-8?B?V2l5YnlPM0wrK0FGOFNmOVBwdlVBN1ZVZ3FPQ1lGR29XMW1jalVBTG1oempX?=
 =?utf-8?B?TGlzeFV4cFhvMjI4VnNNbzNnK3lPY2xzYzlTYWJUUy9KOFVjRU14SkZYemd6?=
 =?utf-8?B?ZzhQcXJmckRsRlc0aWRYTGJ1ei9vZDlLVitEcjA1RHR5Zzh5djM3NDZGajRW?=
 =?utf-8?B?K0t0MEwrREUzR3lDcmx5R2liNTJuckc0cUNEMGluTWtrZSs1UERlQWtLN3Vp?=
 =?utf-8?B?MlJMK3BpSlVDVGZ4NlFma3BiTW9FTkEwUXJnK0VvMHh4U01pYXpaSkVLcGlH?=
 =?utf-8?B?Vkx1Yk5ldlY1NThHRGIraTUzZU41MnFTUkh2aURtS1FDaGJJSVd4cjZ0T0RV?=
 =?utf-8?B?SGozZEZKQ2Z6UXg4SUVuUGlsWGJuRExkZ1VuMno1K0dKUXMxaWFFMTNYdm5L?=
 =?utf-8?B?WFVlVXdWbFJtMWVsaENKbHdLOG5pdk91TE5Ma091ZWNRdTV6WFFnR0pJVVRp?=
 =?utf-8?B?bUk3byt2YXZOQW1RWFQ1bnhrUGQ2dkllbFBBQTlLYnEwNHdvR05EN3V3WVFY?=
 =?utf-8?B?YWV0dVQvaWZxL1MvMVVRZi9XYlRoQ2QzYVlLQytuajRLUDR6dWNnYUM4SzJn?=
 =?utf-8?B?TVRKOVJLSkVEZTVUMk1Sc3FTTXlsWWNOWk1WOTl1NTg4NFMvQWpDTytCRUQ2?=
 =?utf-8?B?VDAzR04rQ1lFK3ptUTdJbUx4MFIvQzNHWUZCdng4bXN6bEl1QkkvR0R2QnZG?=
 =?utf-8?B?aGNFYXNiS0dEc0VJSTArZnlOUEl0SFJzNzhhMlY1VUlQVlFXeStwdnBhSXNL?=
 =?utf-8?B?ck5vSzVURzlaK1E4ZmZtWEZCdXdvKzdYWWtMSnlwNTUzTEl1NmlSZGxRY2N5?=
 =?utf-8?B?Y1hzd2E0Rm1UUWJUTzlMZTc4VkEwUmNlZEplNnFtMWJQNUY3SDZmV0R5OWZm?=
 =?utf-8?B?RGt3SmlzM2JBeUxaZW92VFNETTArdmg3MWNUQWQwS2ZZdC9qaXQ2azRMeHda?=
 =?utf-8?B?SnI0OU1keUM3L3hCQU8zQVR3UEJtVWphdm83YlRvQWNXYndMekJ1alVrb1RI?=
 =?utf-8?B?am5TSC9SaUZ2ODFtaTVhcFFYYUtTbUh1MWU2dGlHSWVsM1M5Y3ljeWtBZXdU?=
 =?utf-8?B?dDdpd0R1aTZMZG1jc3N3Y1RkcCtyRElMV2lJSE9QcXg2OEZlSzY2OG5RL00z?=
 =?utf-8?B?Y0t4TzNZZ3NvNVFpVXprYlBpT2VadGtmLzRxU0M5Q2FvZUtuU29TY2NrN2hp?=
 =?utf-8?B?L3VyVys4SGorbzFHTG55bkFKSjBCL2gyVHlMOERZWDdBSVVCSFF5eEpUWGxy?=
 =?utf-8?B?MXJSVWlpd3lrUGJTR0JWUUJqeWxPZjZidVFCYVQyd00rNi9HMUc0UXZYNjd5?=
 =?utf-8?B?K1NPMW9iclRqV0VFSmQ1YVdHT1N6UkRybWtOWm14NGViKzIvd0VMdGFpRUJG?=
 =?utf-8?B?WElIdnFKRnlrZlZNTm1RNCt5dDdINXpkVC8zbGswOXVpWU4vcmdZN3JjeTBN?=
 =?utf-8?B?U2ZQdmFtSkZLYWVpOE9sTXZBQk1WR2RBSUdXeUlpdlRGbmlkdk1yNFZoZDFF?=
 =?utf-8?B?NzBNK2lJYVVTTVV0OFdXc1lnNTVqN0U2a1dzc0haYm15dUNEQU1xY3JabW85?=
 =?utf-8?B?QUpUeExTVGtmZ3RVWW1HbW53QUZLRHFxbmJuaTV4QlRabll1RG5ld2tJUjdk?=
 =?utf-8?B?TWU1SExhQmhMM2twb0VEYTdQWVc0OTRQUXdocEhDRExXM0tYWFVZMXBSME9X?=
 =?utf-8?B?QVNpM016ZHN6WGM5K1daNFFLbEVJeC9EQzNQMG9HaklyeE5KVHVQU1Y3YTlL?=
 =?utf-8?B?cG5rclRvWVRtcnJ1NnQ5ckcyUmYrV3JlTEhaK1AzZjRkR0plcllwNU5qb1ht?=
 =?utf-8?B?bVBBRVdNRVZHV2RBLzBiNy9xbDJlMGNIT2x4Uk9scFBndmZhU25VVEM4TEk4?=
 =?utf-8?Q?8hW+xY8WEQ2tPOeGdihVZ5ALz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4fa8b6f-5b7e-4cb7-b909-08db72886811
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 18:50:39.1870 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1A3uIbhd/5+NY3IdInUvZx1BeSVfucusEti98y3ow+2styoHtgn7d18PSeYjfsQLMijr1SLgd7jy1OR5qecGjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5622
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
 trix@redhat.com, lijo.lazar@amd.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, mdaenzer@redhat.com,
 amd-gfx@lists.freedesktop.org, linux-acpi@vger.kernel.org, kuba@kernel.org,
 pabeni@redhat.com, lenb@kernel.org, andrealmeid@igalia.com, arnd@arndb.de,
 hdegoede@redhat.com, Evan Quan <evan.quan@amd.com>, netdev@vger.kernel.org,
 Xinhui.Pan@amd.com, linux-wireless@vger.kernel.org, edumazet@google.com,
 christian.koenig@amd.com, tzimmermann@suse.de, alexander.deucher@amd.com,
 Johannes Berg <johannes@sipsolutions.net>, davem@davemloft.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

So if we go down this path of CONFIG_WBRF and CONFIG_WBRF_ACPI, another
question would be where should the new "wbrf.c" be stored?  The ACPI only
version most certainly made sense in drivers/acpi/wbrf.c, but a generic
version that only has an ACPI implementation right now not so much.

On 6/21/2023 1:30 PM, Andrew Lunn wrote:
>> And consumer would need to call it, but only if CONFIG_WBRF_ACPI isn't set.
> Why? How is ACPI special that it does not need notifiers?
ACPI core does has notifiers that are used, but they don't work the same.
If you look at patch 4, you'll see amdgpu registers and unregisters using
both

acpi_install_notify_handler()
and
acpi_remove_notify_handler()

If we supported both ACPI notifications and non-ACPI notifications
all consumers would have to have support to register and use both types.

>
>> I don't see why it couldn't be a DT/ACPI hybrid solution for ARM64.
> As said somewhere else, nobody does hybrid. In fact, turn it
> around. Why not implement all this in DT, and make X86 hybrid? That
> will make arm, powerpc, risc-v and mips much simpler :-)
>
> 	Andrew
Doesn't coreboot do something hybrid with device tree?  I thought they
generate their ACPI tables from a combination of DT and some static ASL.

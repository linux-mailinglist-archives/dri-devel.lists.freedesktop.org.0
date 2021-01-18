Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B912F9AB5
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jan 2021 08:43:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4200C6E0F4;
	Mon, 18 Jan 2021 07:43:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2049.outbound.protection.outlook.com [40.107.237.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F74D6E0F4
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jan 2021 07:43:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lXUCevCzK5mE63PzhaJzDOHU3TIeE3RrEEnuxwdMQaH0QEY8LL8xNBBmggusBY20VhmkUa6p1FwVMcLCYvJi7Pj269aRhj7ja/sBeiASL3ha1K2j0l80bfiDYuao9LyCMdwoy8wla8K7Ms4Y4VuKaVQ8sZ/BZEO/ArHEKD/jFXB40Lyw2K96uPpMKzC8xLy56TvAVmZnodjI3Fj9IRpG5kXuVdPi84wSBnm5bD6OTYO/vbjEFf8xU9ShEflwzMb/Tsm47vw40SucRR/3r+DTv06dRZgEgFmYZOZSX04ggv4oUtrvMc7Uwx1NSgd52Lzyf06t+RbqzkblBGo0mfX3/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BbgkFUOIMWXu9p6LpQ+rheQaNJYsoGpx3nF+QKwmrcw=;
 b=H4jgCJiOtm2zlbAljEy7T441yc12JOtC/NZK0EO0TvyvcWbq85E/Aaqlb+OjmoSWEtPAjBrbSsrWqoCIAQNqqqXLRA7MRxTj0IGoIxrkwx4FTlIHoCkX/BnU/gpWI/mulff8ZoCDKMpjAi39xqNV1Xwct8XDv8Y+Du1GqD/CQIV3E1QKrT+BOPL1Sdv4Wx4dgS/AYLsKplO50ZVmbhFIDPzLt76oNUJ/EA7k7y2k4Q/dk3Xbjmr39FfSlIAYwZcdiQhW72KNwG7gCiMbdY4Yht4RyuHgCxgY4XZLjqwTaK6+1xdsaORvTb7dDzlIV5LszJ9ljaKqEKlDsq4Fwq/M1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BbgkFUOIMWXu9p6LpQ+rheQaNJYsoGpx3nF+QKwmrcw=;
 b=bnQbW2skdRO1ym8UYT1Dl/djZ34GE1ERxIH9ovqNfyMg+gi3QbqmDJdMgwvIch96T4Ir3sOlVpW6r8VWjpIusFdehE87WJ2xIkVTvcwKsGE59xXr7egafuiEweGfDtcVBhZpX+bRziKmj4GkLz73nTgfKoHxsj+Wu3CQfTtB0hI=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4109.namprd12.prod.outlook.com (2603:10b6:208:1d9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Mon, 18 Jan
 2021 07:43:21 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3763.014; Mon, 18 Jan 2021
 07:43:21 +0000
Subject: Re: Change eats memory on my server
To: Eli Cohen <elic@nvidia.com>, Thomas Zimmermann <tzimmermann@suse.de>
References: <20210114151529.GA79120@mtl-vdi-166.wap.labs.mlnx>
 <23cf7712-1daf-23b8-b596-792c9586d6b4@suse.de>
 <20210117050837.GA225992@mtl-vdi-166.wap.labs.mlnx>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <83f74a11-b3c0-db2e-8301-4292d60d803b@amd.com>
Date: Mon, 18 Jan 2021 08:43:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210117050837.GA225992@mtl-vdi-166.wap.labs.mlnx>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR07CA0008.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::21) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR07CA0008.eurprd07.prod.outlook.com (2603:10a6:208:ac::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.6 via Frontend Transport; Mon, 18 Jan 2021 07:43:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 29ae74d0-3ad5-4e98-e293-08d8bb84b9ff
X-MS-TrafficTypeDiagnostic: MN2PR12MB4109:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4109A9257B18B4E5409B18FE83A40@MN2PR12MB4109.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O/C5R18qOsH6X9a6YwOtCIawJK5cHU8JmKu04e3UuIjDPDHGewn12mmur05UJivUIUzblHC+FQWyVf65UQ2QTWLXZ1r0VrgYLa3HL+gyhDIvv9DOqx+ZZn5ENZDSA5CTnK2I8rq/CK8qBWw5oHG4CyUlP9bsdaBSM0+T5k0gXhx3mE78z5cHFU0G9gbka+Wg9nW9BluCun8NxLu0xU8ZLSkE6Mba6WRxap0mDcwO8qJ/6sFXdnecD0CvY2XeOZlHxzZKg1ravIrzBEQ3INHMGLKI/gFv7ccnb6KYHSv84QcdMk7g4n/PSE4dJjNSmSs3kv/t7GGXcDwbEBkyEv5ncw0xyOfGQ7HQGeL08jJhV2xJs951plTFwCND0OrD1Z/CA1K5mEtnHFnsynpJX6EhF4hqxAd3/XGKKx0/9lGzIHnnhRZig3vYsVewlegMu9ykTs8dII0hVng4DBmDAT6T8b3HlYSdqv+C276iTC10LKA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(136003)(396003)(39860400002)(36756003)(5660300002)(31686004)(316002)(478600001)(8936002)(186003)(66556008)(8676002)(6486002)(16526019)(2616005)(2906002)(86362001)(66476007)(66946007)(31696002)(4326008)(6666004)(52116002)(83380400001)(110136005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?eFFFcmRkS2dZTjBsaUFaY1JPenpjalZmdmVqaStuajFIb0tVbit4a2RDRWVN?=
 =?utf-8?B?RTUxdnc1Z1o2dW50QVRxdUpoZ2tDUmJQemhxMGNHbTBPOW5HVFdBTXNFRFNB?=
 =?utf-8?B?L0o2SHpDK09MUmlZWFBHS3R6TnFMdDFQbUdSMkp3aHlNZzJBejQyQ3UwQldr?=
 =?utf-8?B?THp0SkttNWR1WDZ6dWFHYVorZ3BFYllNZVNYc2R1Q01QdlczRWwvVVk3WUU5?=
 =?utf-8?B?N1ZBMlh1TWozOGV2S3JQOGlpWGJUdGZ3WjdKZUNZZlFpRWhJTHB5SWZZaDBD?=
 =?utf-8?B?VzBuYWQ1Ylp5Ym1ySy9oUSsrY1gvOWJXb2w1allGYS9mZHd3Q1R4dW5DR3FF?=
 =?utf-8?B?dEpJb293VThSRXFJaGpXdmVMTnhLUHM3d0k0eVQrR3NId3RTMjlKUUM2cllJ?=
 =?utf-8?B?emlRa3FIYlBFYkRRbTFGMEF0WUt5OHZKbXBSZTdyS3BFV1Yvb0xNYjVCSFlD?=
 =?utf-8?B?YjM1ZzFZMGJvbnB3cHhHSFJINXRERi9tUXpFR3pwSGdCazFIbVNxTFBnWGZJ?=
 =?utf-8?B?cStyenJiM2JPSlhMbE96c1NucHlOTm8xOFhuSFNkNXRYQzA4UjY4bWlhMkZX?=
 =?utf-8?B?NFZUb09EbzVJUEVpUFAvdGlwTTFoNTZYUStwTks4cnA4SDVVaHkrUm0rZldP?=
 =?utf-8?B?NGJ0aHpnb1NEdjNOUi9SbmFWcSswRElBN0Q5cG1qQkJhSEdtcE5iMndIREUx?=
 =?utf-8?B?NGM4V0VhWncwUGV2UWlXRng0ejJNdDI3MWF3NjA1UE5OTENBYmJJQ3ZKN1I3?=
 =?utf-8?B?QmhWSXZaMDJVYURhWkZsYlUxVmtyOHoxTWR3SmRXNXdSUFRIUDVGM1B3eXpU?=
 =?utf-8?B?OVY1R2g2SnZEL0U5NzM5eUpISWhxOHVWcDlIMHo1SVZPaFdSWFpKcloxWlcy?=
 =?utf-8?B?ZWlPZDZndlBTTU9LZFBQTGRZUXFpL3lLQjV1R1h2aFVISUlGdm9ZcUp0VFhr?=
 =?utf-8?B?Mk9XNXNNMjkvbUluaEZwUmdXbXJFSHNGLzJ1TUpZakJBMXUvTG1MM0xjMGwv?=
 =?utf-8?B?RGNEWVhUck9HNUZRU2ZxVHN5Z3VJUUpYSlA2a0oybmI4dm9TdXg4T3l1Zzlp?=
 =?utf-8?B?bTNnc2dBdVNBVHUrWVFhTy9uYmtJRHBBUXhYZW1QZjlNN2kvNTN5N1FFRWpU?=
 =?utf-8?B?b1VCK0NEV01jMG4xdC9nLy93K2ZQOE1HK3J1Y3pYaE1wbk5uNGE0ZFhuZkRq?=
 =?utf-8?B?eDFNTHYyN05KdlNYWE00dmIwRGhLUHh0MEthSVQ4WGNkdXF6Z1NhYmlwUzV2?=
 =?utf-8?B?WVdORU12VFVob2lwNEJUbVlWaW8zWWNpMW8vVVU1VUdncGdlQXRYaElGaGZs?=
 =?utf-8?B?cU1xaE1NeVRFUnZvSHMwMjVGVkN6WGJHclFmQlhDUTV0dTR5K1JmR3RmQmtJ?=
 =?utf-8?B?ZmtZWHZTS292OFJtd3ZJSVNEanJ0NExHWUR2UzBJYXRQU1V1T0g3R0M5dDNs?=
 =?utf-8?Q?zQN6S3au?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29ae74d0-3ad5-4e98-e293-08d8bb84b9ff
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 07:43:21.2821 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cLBsmIe6A/S1u0y28Bt06bjAc4yqb3dbeW7yQ/LIOWRiR3iZI2vER8uhByKdRaR6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4109
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
Cc: daniel.vetter@ffwll.ch, sam@ravnborg.org, linux-kernel@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Eli,

have you already tried using kmemleak?

This sounds like a leak of memory allocated using kmalloc(), so kmemleak 
should be able to catch it.

Regards,
Christian.

Am 17.01.21 um 06:08 schrieb Eli Cohen:
> On Fri, Jan 15, 2021 at 10:03:50AM +0100, Thomas Zimmermann wrote:
>> Could you please double-check that 3fb91f56aea4 ("drm/udl: Retrieve USB
>> device from struct drm_device.dev") works correctly
> Checked again, it does not seem to leak.
>
>> and that 823efa922102
>> ("drm/cma-helper: Remove empty drm_gem_cma_prime_vunmap()") is broken?
>>
> Yes, this one leaks, as does the one preceding it:
>
> 1086db71a1db ("drm/vram-helper: Remove invariant parameters from internal kmap function")
>   
>> For one of the broken commits, could you please send us the output of
>>
>>    dmesg | grep -i drm
>>
>> after most of the memory got leaked?
>>
> I ran the following script in the shell:
>
> while true; do cat /proc/meminfo | grep MemFree:; sleep 5; done
>
> and this is what I saw before I got disconnected from the shell:
>
> MemFree:          148208 kB
> MemFree:          148304 kB
> MemFree:          146660 kB
> Connection to nps-server-24 closed by remote host.
> Connection to nps-server-24 closed.
>
>
> I also mointored the output of dmesg | grep -i drm
> The last output I was able to save on disk is this:
>
> [   46.140720] ast 0000:03:00.0: [drm] Using P2A bridge for configuration
> [   46.140737] ast 0000:03:00.0: [drm] AST 2500 detected
> [   46.140754] ast 0000:03:00.0: [drm] Analog VGA only
> [   46.140772] ast 0000:03:00.0: [drm] dram MCLK=800 Mhz type=7 bus_width=16
> [   46.153553] [drm] Initialized ast 0.1.0 20120228 for 0000:03:00.0 on minor 0
> [   46.165097] fbcon: astdrmfb (fb0) is primary device
> [   46.391381] ast 0000:03:00.0: [drm] fb0: astdrmfb frame buffer device
> [   56.097697] systemd[1]: Starting Load Kernel Module drm...
> [   56.343556] systemd[1]: modprobe@drm.service: Succeeded.
> [   56.350382] systemd[1]: Finished Load Kernel Module drm.
> [13319.469462] [   2683] 70889  2683    55586        0    73728      138             0 tdrm
> [13320.658386] [   2683] 70889  2683    55586        0    73728      138             0 tdrm
> [13321.800970] [   2683] 70889  2683    55586        0    73728      138             0 tdrm

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

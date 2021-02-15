Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFFD31B91D
	for <lists+dri-devel@lfdr.de>; Mon, 15 Feb 2021 13:25:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42C4089F97;
	Mon, 15 Feb 2021 12:25:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760054.outbound.protection.outlook.com [40.107.76.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AF4B89F97
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Feb 2021 12:25:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ekzQUWgJxD4fVCgJvLAUERsdTwe3Z35+k5AtQ1GL9fYFcft46tJf1G6mYfO5IQEwJ7GMOkhFN5PWzVwyRUsT6hZ1OAdFA3tsXZlt0wfO+i2tNCFJoKhLiwnrxAiosZOWz2GsbCVqDv4K8unQHS/OdgHxoz0EAMPILgeChgWxcunl3vU8dPGVf7SaNUDF7r5SSFCW8+4sviLhMWjsm/MdTZxrTvRsWMwLOA41U4QvN7puhu1qf5XiynowdWlUi/QHsLDVp2fqihFFyXdV3XqYnpZPYKFpcXpU9i/Cq94C3PI8JadXHhWpHk1cOL6z9z32Jn9lxCTd/5TjEEV3tlJhvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y/lBEeXgI/RRAz1rrd1URdZGwzrd5UMMkpJijXhyi8o=;
 b=df6teeF+qKzicDo9S/vAnlDY1giwPnXWRZmdmTvzMPOIa1UXBX+LpT/tTr8f1YQWg2AvFJEO4FtX7kQ1DRu5CnIMFedndZ7UBOqlLsCvizGntfenmOSeKsDyJlQqH6tUK8/lZYX8O09uF6oHzfc1BRSyYXqr/TzxfOASv3meaSCReTEWxJ/LYlgQtBqaQDiymXtTXaDZR9uoEpjKING6l9MdeFdtELCQyRtbulqQxvY7Ko2vmBaWxPCDJiXnGUDl3hSX2nmhlcbfZ8w96sdWxHeGbIrC8SEOb9zh1nU9EYtHZWrrVcnPNdVZ8+WPPnWEKi9HbY4+tuPwtZPUaXi/Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y/lBEeXgI/RRAz1rrd1URdZGwzrd5UMMkpJijXhyi8o=;
 b=Qr4KcL+/J3wO9ShCIvhFDZTAmyejOkiBoYVTq92ECT/56bQd+bUjqqIIo7Jsf6aJhcgr71oESFA7fwVxBTdsXLxXf3qfeB3hcpYXJ4tom3uiIZJmnB9Nu9+BQ/zaxXMIhDLW3dG6YkFuYmCCgZWToU+KIFjttbb+if0p8A9YbzI=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3935.namprd12.prod.outlook.com (2603:10b6:208:168::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Mon, 15 Feb
 2021 12:25:07 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3846.038; Mon, 15 Feb 2021
 12:25:07 +0000
Subject: Re: DMA-buf and uncached system memory
To: Lucas Stach <l.stach@pengutronix.de>, Simon Ser <contact@emersion.fr>
References: <91ff0bbb-ea3a-2663-3453-dea96ccd6dd8@amd.com>
 <GUuZYSQk2hxgykDhSxfB2GWo47lQlVrKBtWMwQUG7Ar2GAag5WQDxBI0zq6nDTooPBzTktyRpnu25Ju1UKE3FYD9yHbkNMAHcmSI96hoJhA=@emersion.fr>
 <da9edfa0-8a18-44a2-fa79-83b4177afd8e@amd.com>
 <8d23f1ca6fe76d8971365bf54ca71ba71698980d.camel@pengutronix.de>
 <7ecf008d-a1f5-ddff-c8ac-8e7bfaf9c680@amd.com>
 <04f2e57540896d2c51120236889a6ae293e711d8.camel@pengutronix.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <cc98293f-eb4f-bf0c-2e25-7e41b12d5ca2@amd.com>
Date: Mon, 15 Feb 2021 13:25:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <04f2e57540896d2c51120236889a6ae293e711d8.camel@pengutronix.de>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:3e90:5494:cc4a:73e5]
X-ClientProxiedBy: AM4PR0202CA0014.eurprd02.prod.outlook.com
 (2603:10a6:200:89::24) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:3e90:5494:cc4a:73e5]
 (2a02:908:1252:fb60:3e90:5494:cc4a:73e5) by
 AM4PR0202CA0014.eurprd02.prod.outlook.com (2603:10a6:200:89::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25 via Frontend
 Transport; Mon, 15 Feb 2021 12:25:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4540ee28-3519-4137-9d7d-08d8d1acba98
X-MS-TrafficTypeDiagnostic: MN2PR12MB3935:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB393512A00C6F0FEB95935D9D83889@MN2PR12MB3935.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3iX/8jT6SHdDIPpEzsqelWGRx2F7soqzfOeEZ1eH+eSd1LupjUsNH4K/jBMLJnPqQi6LPdltBKr2DIQNJ/iYqT/3EvS1Y6PeaewMrz5Y5TzW/Og4A5DGunC1w+gFPTXQAgIU487hlxNzbt75MNwEVfH7L/aKSyP6QW8ctWXEI2Wr3a7y4PEEg8uKKeW1ebtpAjDomFeWnlu1jcmQIbl3Z84bhYcTCX9YbGCfbWq7VrPReW27aTw10wGs8hibUF0ocq2C2ekx2Q0rJgf9ImhVgvSbmCYRnEaHYFbxh3odXCxm6xmkclFwQGYl+tZPC8QlCzxwNXimEMiASgqfYwALiAhL08fO/cW5ypqtQqLgi3UWV1xqf3MGKuIe/5NPTkF9ei6ENmpCEqHTvpYOu1YWEK3d4NebTrrO1v2E536owi11BbjtIp2q9JBTdUZPRiP/+EgnzVrEnnLSfSE19dhHXlLdrurjtBUOGOumFx2dvigh9zsqUFH+8SToukamyjsH+UOiNlF87/SeYG0aJsT6Bi9q5kETaUfLbfLWrWVB+zutfjocpwtmION0N5QjEWPMmstwrSVG44fUMbW2yxxJeb9KBYyTL3bnKmgqtZS3pIY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(39860400002)(366004)(396003)(346002)(4326008)(6486002)(31686004)(52116002)(36756003)(478600001)(5660300002)(66476007)(316002)(54906003)(110136005)(8676002)(31696002)(86362001)(66946007)(186003)(16526019)(6666004)(8936002)(66556008)(2616005)(83380400001)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NS9mbnpGdFVOMnlCaDFpUi9uVzdJVkZTejR5cm9PMEFkNXB6bCs3ZjliYm5W?=
 =?utf-8?B?R1puQWM3UWpVZFZJRUtEazh2ZWkrQ2xKK3dETTFEdTFJdWdUS2tudTF0TUxi?=
 =?utf-8?B?QTUwZWt6bGZlYnFieGR0OE9XYVpiTENTZFVEVldRQU5MSWlzOFBncFVNeW8x?=
 =?utf-8?B?QWs2KzJURklPZkRFdmZlbHhiSUFwd0hXWnlvWUR0dG1tczg4R1RNWG1zWDF3?=
 =?utf-8?B?TmlQSE1UcTdFNUplZzJrQXJiZHROZlNEbG13VDdoNFJMd1lSdGxJNm4xVTJo?=
 =?utf-8?B?eC90empoeElGQmVoc01meFkyakwzcUtrR0ZVZHFSQkE0MWxzOGZBQWpYWnBS?=
 =?utf-8?B?dXRONE5GUmZidS92bnF6dGFpcDNJWTNwYklacHNQYlNtR2E1TCtENWo2a25y?=
 =?utf-8?B?aEtwVjR5N1NRandOUTE1dFp0Q1kwUXAzU0tYWkJKaWVMV21ybU81WWNNWno0?=
 =?utf-8?B?TmVvT0Z4YXlNVXpSU0NUeXA5RUxBcmdKSUtMbjcxME94OTJOb1NUVnphQ0w0?=
 =?utf-8?B?dm8yYmMyc0RyR2d5b1B5QXdhbi8rZTFPMndMbXFiQ2FNSmZ0RGJ1YnZCNVlO?=
 =?utf-8?B?SWl3V2dVdTJWOEJhNHVOZnRybjhNcmlDSDFnbzhPNWtWTGtKYk1jUXdBempy?=
 =?utf-8?B?TUtORGRnMnkrSStiSXBSd0dxNVV3L1hJQ2FrRzd2QllKb3VDV1B2YjMxUjZG?=
 =?utf-8?B?RjVlRkViOEdJUHdJaUhncW1FTkFXQU5JTFUzRVEvK2lrTDhJUlA1M3lPUEZS?=
 =?utf-8?B?MmVmbml1amxCeTRyOS84TXBWdDZwZE1ucmxjT2l1UWdqSkpTYnFLVTYvMzUx?=
 =?utf-8?B?SEoxb3dLdFlRMCsxUVBIaTMzY2lPMWFEV1p1THptK3l2UlBCN0VuUkdNbjcx?=
 =?utf-8?B?cEsvbVJoMVp0ZHpYOTdRU3NxbUdlREFZZ1EwaHM2cFVCTFpOeHRJME00TUt3?=
 =?utf-8?B?Y1lLS09xeEdjUCtVSGc1Y0pzZjZjTmwvWnY2QWo2S2dwTzRpNFZoTVQ2dGtM?=
 =?utf-8?B?Vzg3a2RQYWYzN3dPR1JPbTZOVnM2MlBZMlpNWEJPbUd5QXZUMnh4QmhFNENx?=
 =?utf-8?B?VURpcVZwQnBYNG1NVVpEOHdmUFdIcTQ5TWpJU3VQOElzd1pEalNNcC9VS3d1?=
 =?utf-8?B?RWJRanU0eStiRHU4ZTNEeDk1VlczM3lUOW9JYkxoT3VxQS9oRW9vUVNCL2ZH?=
 =?utf-8?B?VlFFOUpRTjYwSGI3bUtzMkVWUnJjQVNmQW9hWHdhQ2w5N1ZiZFdSWllhZzRN?=
 =?utf-8?B?YitHUHZzcFJlcWFKZldrQ3B1dWFxNmtjOFFPM2o4Q2NHK29MbisvMEIyd0pk?=
 =?utf-8?B?eDJHYzVnc1J0T2VzV2twaDNCb21VVlQ4RjJBRE1nSGIrUVg2TEpSWWYvZzZm?=
 =?utf-8?B?WWlocTBaTVpqZEZqcG96aXFhbklnTlhkbElLY3g3cDhWZ0VBNnpEWEdmb1U3?=
 =?utf-8?B?a3JnenFqSzljK2laQzZsY0g3Q29Hc0ppOVgwZ0xmWjdmd0orbkhJR3VKbHkv?=
 =?utf-8?B?VFJqZEFab3REMzZaMjBWQlZPUVVBTXZEUHpxMVFrNmI5Y3ZmRGVEcnNmRzNC?=
 =?utf-8?B?WWtQTXk0RlNDR1pmL2x1bGtJZXU2TzB0eEhvdGFRSDFvemNPaHhub2s4bjB3?=
 =?utf-8?B?cW5zWi96bGY2WmxnMUFoamIreDZtbGdaQys3MkNwUDdRTWNyU2JoRVJpcHQx?=
 =?utf-8?B?dFl3OEN3TkxMQlM5dk1GUU14Unc2aHhIRVZ5R0diMmxteHl1emEwVlZpSHJR?=
 =?utf-8?B?REw1VnRYS3Uwek92anVnQjdzMjBTVXFHZXhyMUZMNUVkRDJxYlhta2NESSs5?=
 =?utf-8?B?NUlFUGZ3KzZON1VRY1lWTU9Xb2FqbUVOdVcxYlRORFlneWozTDdLWUhSbWNL?=
 =?utf-8?Q?drBGrCnNwYPQE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4540ee28-3519-4137-9d7d-08d8d1acba98
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2021 12:25:07.2556 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +JzS2WgA5aeutjVWMUo23xusLv0Zl4YBqW/N4iZ34jwng8SZIjMktiWiAjx2ndUH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3935
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
Cc: linaro-mm-sig@lists.linaro.org, linux-media <linux-media@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Sharma,
 Shashank" <Shashank.Sharma@amd.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 15.02.21 um 13:16 schrieb Lucas Stach:
> [SNIP]
>>>> Userspace components can then of course tell the exporter what the
>>>> importer needs, but validation if that stuff is correct and doesn't
>>>> crash the system must happen in the kernel.
>>> What exactly do you mean by "scanout requires non-coherent memory"?
>>> Does the scanout requestor always set the no-snoop PCI flag, so you get
>>> garbage if some writes to memory are still stuck in the caches, or is
>>> it some other requirement?
>> Snooping the CPU caches introduces some extra latency, so what can
>> happen is that the response to the PCIe read comes to late for the
>> scanout. The result is an underflow and flickering whenever something is
>> in the cache which needs to be flushed first.
> Okay, that confirms my theory on why this is needed. So things don't
> totally explode if you don't do it, but to in order to guarantee access
> latency you need to take the no-snoop path, which means your device
> effectively gets dma-noncoherent.

Exactly. My big question at the moment is if this is something AMD 
specific or do we have the same issue on other devices as well?

>> On the other hand when the don't snoop the CPU caches we at least get
>> garbage/stale data on the screen. That wouldn't be that worse, but the
>> big problem is that we have also seen machine check exceptions when
>> don't snoop and the cache is dirty.
> If you attach to the dma-buf with a struct device which is non-coherent
> it's the exporters job to flush any dirty caches. Unfortunately the DRM
> caching of the dma-buf attachments in the DRM framework will get a bit
> in the way here, so a DRM specific flush might be be needed. :/ Maybe
> moving the whole buffer to uncached sysmem location on first attach of
> a non-coherent importer would be enough?

Could work in theory, but problem is that for this to do I have to tear 
down all CPU mappings and attachments of other devices.

Apart from the problem that we don't have the infrastructure for that we 
don't know at import time that a buffer might be used for scan out. I 
would need to re-import it during fb creation or something like this.

Our current concept for AMD GPUs is rather that we try to use uncached 
memory as much as possible. So for the specific use case just checking 
if the exporter is AMDGPU and has the flag set should be enough for not.

>> So this should better be coherent or you can crash the box. ARM seems to
>> be really susceptible for this, x86 is fortunately much more graceful
>> and I'm not sure about other architectures.
> ARM really dislikes pagetable setups with different attributes pointing
> to the same physical page, however you should be fine as long as all
> cached aliases are properly flushed from the cache before access via a
> different alias.

Yeah, can totally confirm that and had to learn it the hard way.

Regards,
Christian.

>
> Regards,
> Lucas
>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

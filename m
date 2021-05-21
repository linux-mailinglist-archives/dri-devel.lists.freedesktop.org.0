Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D6F38C692
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 14:32:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B86CB6E4B5;
	Fri, 21 May 2021 12:32:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2087.outbound.protection.outlook.com [40.107.100.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88FFD6E4B5;
 Fri, 21 May 2021 12:32:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g4NgLJWDmH2hog3vlAeXIgtVbvDMxxpfL/N3oAh0KcvUDpOsJFQW139l6lGYC9Hl+C7VxwKkQg22UwhGcOIB+8w3ii9zsZSlSzxUxV+ElaU1nDxcKigWceGQN4HKmx7zDjki4xhjsYO0BnoMLWzMtoD/27xCucPZI2Glhh0yOccBJ6+2aC7B3k2IwRdEkudscLmdL/KeLiFpbXz4fAHAYDxN/HUzrBdBl4gNXMvQyWnpsybJaquupwWuLBMZEosaektTp8BPJ+OQFj1aiZALPrTK2bmdG0k35AgBK44UbvrXae/mn0DFPQ/l2kAUmXLR1xJCJ3/wEw8elNOKogKAGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/UMv03/D9DobQHWYnQndeXQ3Z3Q1TS3+sS8BTxwR8ds=;
 b=jO4XIN5c9pNxFKVkx1hgvj2X8VEHV5S3i7a2e8/UBQlYbSEAXd6NjtHn/kxh6DDAh1BlutHUBlLTyTZiI+EdJvat8IwQ/KMMNmLb3PUUYpkpp2Cz/sYZepUy2oM0BIlnt7t+gPWN+bnOD+4R1/5ar9REQpfijUYBto8Tji6oj4fnjGpk4tGUjkGqtuTKQ0WCr2v/lnjumnZwddjDbV508ZnSL3ZuG40Hs0Mqq14dMjdTdJ6QaQ6ospnZZUkC35n4AFGg2y/deCYqm9ahM82ekIm/7TjYKGvqeSBFJuKFuUv8hswejNfmP/73AnzODRXpgV+VQRz3Ha2eSFEi7YpzDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/UMv03/D9DobQHWYnQndeXQ3Z3Q1TS3+sS8BTxwR8ds=;
 b=WcG7IU4vv46EBUTQl6mwIYccckPZ700HcpGpkmFdt3m1L82yOqUIGqmYSW3f+v1YuCj2gHOqTY5oLXeHZmxzj6bpJdTDbqxm0ROZZu39KWZN04ofY0BS+86xGcjlu3usO+8euAia92BdiTliXwNhriHb4myhcX/wv0u4ahrpYRo=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4144.namprd12.prod.outlook.com (2603:10b6:208:15f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Fri, 21 May
 2021 12:32:33 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4150.023; Fri, 21 May 2021
 12:32:33 +0000
Subject: Re: [RFC 7/7] drm/i915: Expose client engine utilisation via fdinfo
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20210520151254.959958-1-tvrtko.ursulin@linux.intel.com>
 <20210520151254.959958-8-tvrtko.ursulin@linux.intel.com>
 <BYAPR12MB28401B22CACDC249926C0A19F42A9@BYAPR12MB2840.namprd12.prod.outlook.com>
 <38a6d339-bca5-13f0-1cc8-db96f1b587bb@amd.com>
 <CAKMK7uEKwWhfMDrBUh394U99bXipHrAb+YUCOryOV-FU4k07Eg@mail.gmail.com>
 <1159220c-1a40-3e38-5885-2c8c72408da0@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <cc77a39c-2de3-b049-e485-78f4a496b649@amd.com>
Date: Fri, 21 May 2021 14:32:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <1159220c-1a40-3e38-5885-2c8c72408da0@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:b48f:ff97:fb4c:5b1d]
X-ClientProxiedBy: AM0PR10CA0128.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::45) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:b48f:ff97:fb4c:5b1d]
 (2a02:908:1252:fb60:b48f:ff97:fb4c:5b1d) by
 AM0PR10CA0128.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::45) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.26 via Frontend Transport; Fri, 21 May 2021 12:32:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f9db52f5-bade-4c42-25ce-08d91c5481f3
X-MS-TrafficTypeDiagnostic: MN2PR12MB4144:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4144D97D9D0568495047BB2C83299@MN2PR12MB4144.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lZ4uz20GLRYZ7wczaMURoXCnYPthKDoxXd3Oq3hNHKx9q2NyjkjpreWsW1hJhC85QMj51y8wgk0GOgPKJqLtG6bK1D6BBypBKmgQrHPT3XNUROoeV4Vb5DSTmrUzRGhuBSaXF2zgRJrxbPmJbXePAjWVZkGVgjv+pozrury7CKQDWdo6QCFa4pbO+PqRhwKOYl92k78qkkhNhT2tZTO7LcnN+MHjGk3r+q60oGlY3E0Of4NSlTOR4hqHDOjZcusamJab5gg83lrY6t2CZzNZau+luUDl1UCkHbBSWYEbWjFM3C/a4gT+oF7yVSwJb/pwS4HemkPq+WotPGmxVK80ck1CA1Gru2+tOa2bfYYKvqBuVJiWHyh4eAs9K2J4Jr8lABUrWnHdZLqvtDWttoeqtoA1SVJ5g208nKAOwEEkp5c8fAxTG7S9cUXbARPTtM7/uG3gikQjNho+zQvQxKkIlmEwLqWEE9YDTF79wDj2gFPKUaW0CSYAFRJaWcpKa9+JrZ5KHGF3qt38sgaMDCyv+fa3ihES1Dv1oovOYQdDyw1yiFqDd0OeuyJSGVKl55cEvaUYjkjA6aWbj5YOoETlACXCZYA8vSEIgQWvb7JUtdOEEPFLBbb8AEQRf/BccHgeaDZ4buG0geNxP57Td3w+rYAfWbEjaxBnNQxYHuF3QXLhl7a71nZZLO8QRYIniD5T
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(39850400004)(346002)(396003)(136003)(31696002)(316002)(31686004)(8676002)(38100700002)(5660300002)(6486002)(186003)(86362001)(110136005)(16526019)(36756003)(2616005)(54906003)(478600001)(66946007)(53546011)(6666004)(2906002)(66574015)(8936002)(4326008)(66556008)(83380400001)(52116002)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bzdxNUc0emJkYVV1UjZpVUpaUkdCTUUvMk9WNWU0dDcyUXdhNEJuMUN5cjE5?=
 =?utf-8?B?YmdTUU9uN3FYeGxrWDl5bVcxbFRLcFYvcG52WlBJYkVlOUdhR1BCbjdaQXJx?=
 =?utf-8?B?dDN2N2lXeWdaL05yaEVBL3dkZTZvNWlvWVREQzdMdzVITkZPNkQ0dVJWejh4?=
 =?utf-8?B?aEVmNHg5S1A0RkgrNFdCQW5wTmJyWFlUbE5BVms3aytPd0xLWVNOTEtpQzBs?=
 =?utf-8?B?bFZBOGFyeE5kTENZSXkrdjJJVGdTamRJVXM4ZXVteGR3K2UzNGNkdERIWVFp?=
 =?utf-8?B?MVF0TElneWVRbGN2VExGQ1hCdU95ZHVkMVdyL3p4RlFCemdsSUIvc1U0QWds?=
 =?utf-8?B?VUZpRlVlMjZZWml1SmRJaWMyakpaUUNrNUVEOUVXanZWT0lHcGo1U0Izb2h0?=
 =?utf-8?B?Q2ZxYmVIRitTRzZNYllJaStTNHhpRXJSckhZNTkzQnZoWEszamdaWkNVM2VP?=
 =?utf-8?B?SVBadlZYS1dBbHJmdXk2L0U0aDRRQ3pJa3dBaEFhUG5tSzlzRXUxT05XNmZw?=
 =?utf-8?B?ZDB4MXc2MGpEaXIzTDJQNTRyUUdCODFobWI4YmxCL1B3UXZ0bVBsQ0ZFajhL?=
 =?utf-8?B?M0cva05Kb2pJY0NKSVo5eHZuRHJjbXBPQ1Vld2pxWndRa2tRaGJCaEM4ZExo?=
 =?utf-8?B?OStROUd6TWdqVUhwcUFLSStIc3hPcmdTQ1FscjRFUVVJWHdSQkE1a2ZCTDBU?=
 =?utf-8?B?UklUMndUYURoWUJGOWlieDRpQmwxdGFHWlRjREZkM3hqL2Jyakw1ZHB0LzMz?=
 =?utf-8?B?SVpoQUI0eGo1MGJKbTl6eDMzOWNHdWc1SHRtR0w0VXZrcVRqaEdnREliUVRB?=
 =?utf-8?B?dXpBQzZPYVZZV3g5N0VDd3BvMExWUGU4WlVxK28zN0NSTDMrZUdwQytLVWdl?=
 =?utf-8?B?UCtPaHFsWFJodEZzajFTaVhFNTBqNjEvSTNJbk9EUUt2MlV6M0JwRTZLUXJz?=
 =?utf-8?B?UWZNVlNrb3luRXhnalhCNENOOFQ1S1BhanBXYzFWSk1sUDFFclJvenN4MnRw?=
 =?utf-8?B?cnl1U0RZa1F3R0VFZjh5QldRemFHdVJUZWJyVHhBOTIwR1BaYmpiYmoyWUh4?=
 =?utf-8?B?eTV5SFlWY2tuSlA0WHlKMVZyTWJtWklJWTgxdmFvQXU3N3h6TXBIVVRkOXBh?=
 =?utf-8?B?NFRRMTZmbUxXeTZLVXFSZnFaRTlnRTlWYjFhUkRiUDVhS0lNRVgyQnc1VHA0?=
 =?utf-8?B?R0IzNDBMZDNwZm50dFkzSWwxY01sRHFrYnYyWTJ6cXlNSWVrNDFBbWthY2VJ?=
 =?utf-8?B?VTU4Wk56NzZiSDhvVGFTTXhtalVTTEYxQ0krTFJOUlVUcmlQMVZ0SkZlRFdk?=
 =?utf-8?B?c1BkaHl6MHpacW1jZW5nbURTY1FSbFgrc0VVYWlOcDhLeUpkMFB2dDNtU1Av?=
 =?utf-8?B?QW1mR0g5SFYyVDFDQmwrRVVnK0oyTDZLeEMvc3pOdEN5WURBMjhRRzgrK2Yr?=
 =?utf-8?B?YnJRMFhicUlJLys4Y2xONjlwUXZsbWJTTXRNOTAwaUM5emNxa2lzTnZ5QTZE?=
 =?utf-8?B?VWVDaFpHU09DQ3BRN3FzY1MyNVF0V1ZNZ0doSzdnQUZUUzlGeEtzbkRURFY2?=
 =?utf-8?B?cHpNMFg1WWs2Y1Fxb0pGOFhJTmlHMHFrTzR6R2NoUzZXZGg3QTVDNVR2a2tS?=
 =?utf-8?B?MUNQRU9wL2c1U3dlWGNhYkJwNnk1U1ZlbmQ1cG1tYnV0cjYyQ2lyZVl6czBP?=
 =?utf-8?B?d2NpOTJ6N2QzTUV0M1BBNGl3USs0TlNORFRyRDBOTDhlczZ0ZC8yTnliRXg2?=
 =?utf-8?B?NGxoNlUzM29Od0gra3pXUmN1aHY5Nk5adlF5bjFRSll4aXF3NUpzNmcvYU4x?=
 =?utf-8?B?aTBIRk5veWdscGRxeGJlSVBxUEdxeituclNVbXpONHp3ZEhZcVdQMTVKcWV2?=
 =?utf-8?Q?7Hzwz/9CU4Z8g?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9db52f5-bade-4c42-25ce-08d91c5481f3
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2021 12:32:33.4041 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gt9MrA91Zc3ncMBK7C2Q4UGM8S0ryQzGI+OYv3jdKYAhza0xa1+3XJDxeGiY5fv5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4144
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
Cc: "Intel-gfx@lists.freedesktop.org" <Intel-gfx@lists.freedesktop.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Nieto,
 David M" <David.Nieto@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 21.05.21 um 14:26 schrieb Tvrtko Ursulin:
>
> On 20/05/2021 18:47, Daniel Vetter wrote:
>> On Thu, May 20, 2021 at 6:31 PM Christian König
>> <christian.koenig@amd.com> wrote:
>>>
>>> Yeah, having the timestamp is a good idea as well.
>>>
>>>    drm-driver: i915
>>>
>>> I think we should rather add something like printing 
>>> file_operations->owner->name to the common fdinfo code.
>>>
>>> This way we would have something common for all drivers in the 
>>> system. I'm just not sure if that also works if they are compiled 
>>> into the kernel.
>>
>> Yeah common code could print driver name, busid and all that stuff. I
>> think the common code should also provide some helpers for the key:
>> value pair formatting (and maybe check for all lower-case and stuff
>> like that) because if we don't then this is going to be a complete
>> mess that's not parseable.
>
> I see we could have a few options here, non exhaustive list 
> (especially omitting some sub-options):
>
> 1)
> DRM core implements fdinfo, which emits the common parts, calling into 
> the driver to do the rest.
>
> 2)
> DRM adds helpers for driver to emit common parts of fdinfo.
>
> 3)
> DRM core establishes a "spec" defining the common fields, the optional 
> ones, and formats.
>
> I was trending towards 3) because it is most lightweight and feeling 
> is there isn't that much value in extracting a tiny bit of commonality 
> in code. Proof in the pudding is how short the fdinfo vfunc is in this 
> patch.
>

I would say that we should add printing the module name to the common 
fdinfo function for the whole kernel.

And for the DRM specific stuff either 2 or 3 is the way to go I think. 
Number 1 sounds to much like mid-layering to me.

Regards,
Christian.

>> And value should be real semantic stuff, not "here's a string". So
>> accumulated time as a struct ktime as the example.
>
> Ideally yes, but I have a feeling the ways how amdgpu and i915 track 
> things are so different so first lets learn more about that.
>
>>> Am 20.05.21 um 18:26 schrieb Nieto, David M:
>>>
>>> [AMD Official Use Only]
>>>
>>>
>>> i would like to add a unit marker for the stats that we monitor in 
>>> the fd, as we discussed currently we are displaying the usage 
>>> percentage, because we wanted to to provide single query 
>>> percentages, but this may evolve with time.
>>>
>>> May I suggest to add two new fields
>>>
>>> drm-stat-interval: <64 bit> ns
>>> drm-stat-timestamp: <64 bit> ns
>>>
>>> If interval is set, engine utilization is calculated by doing <perc 
>>> render> = 100*<drm_engine_render>/<drm_stat_interval>
>>> if interval is not set, two reads are needed : <perc render> = 
>>> 100*<drm_engine_render1 - drm_engine_render0> / <drm-stat-timestamp1 
>>> - drm-stat-timestamp0>
>
> I would like to understand how admgpu tracks GPU time since I am not 
> getting these fields yet.
>
> 1)
> You suggest to have a timestamp because of different clock domains?
>
> 2)
> With the interval option - you actually have a restarting counter? Do 
> you keep that in the driver or get it from hw itself?
>
> Regards,
>
> Tvrtko


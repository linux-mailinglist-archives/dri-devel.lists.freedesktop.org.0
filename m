Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5093931166A
	for <lists+dri-devel@lfdr.de>; Sat,  6 Feb 2021 00:09:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AA256E0D7;
	Fri,  5 Feb 2021 23:09:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2086.outbound.protection.outlook.com [40.107.94.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8E256E0C4;
 Fri,  5 Feb 2021 23:09:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kew20CLrW5V7vQKcEDLtzr4TXKRWr076b5h3Ape55Titgn9UL8OkneBGV1j+FFAxHXy8IxqA22w3j5lLcRYAnHxi9Xqs5uFe1896yPg5rN2GkWawl/nAEY4GRSFdYqv4wNM+xTFTrNe2mNWYt56fj2uJPbDW/fe3wSgCuTiMuD6EBb7EzXG/s6yjSgMsKgEi8o3b/18Mb8BNbxR7U9MMi3qqLizTcCgcWYgIyyGFyKRdCASyo8736A4VAEs4EpJU2tUuItE4TcvmDub5vFYc2/5gFmerFgTxTDHzCRojgyskL42BRsIaH2a66+6N054o3I4CA8ip5PqafjaFuxMCUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7mh4e7HU7zGAL0YLJxlSyOBobsh53/rgrcHPH/8ccf4=;
 b=FF8lYypVdQwc6TlTsF8GRy7M87OjgVm+iIni1pzZBWcEDg1UM4pQXvifFJr/Ik75G1Vn//qmfvEDmvYAC+HZg2LhO/qZAOtPdrtvXEO0bJx0Skh77HhdRj0pYN1VrBn5hv/9x+3jeN8UCFQ6kkE0s5O80Ew2IAjrTgSE1G7g0V+/aXSL8KFUT8oZ7IiZHDQWR6xYu3rLKYvb0RkC2HnkrZ14AM3iQPC/DdpUPr/It+eYLzOvReGCDRTNZhD7FVU4f4eKiATSWO42nF3RJzDxQdt37LXmbNrVia8MA6snHXFfrAbfRSCV+8VuVQSaLX9fuy1TNxu1Re8jXkuYtW6YxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7mh4e7HU7zGAL0YLJxlSyOBobsh53/rgrcHPH/8ccf4=;
 b=iCWSWOnZitnGhqL6HP+7ZcdSisezmYEYIf9hcB630QLaPKPBPq/ZaPL2DPvuEGfFDxQ22b941J6HdczI09q27FKgzT0N94LbuMIUvs50sz2lHabgwclsccIFVvq0nO5c5D116+swUMWdBVq58Wjx8pFGpOZN427gNs9+64CF3GQ=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4368.namprd12.prod.outlook.com (2603:10b6:806:9f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.23; Fri, 5 Feb
 2021 23:09:17 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::41b1:11f5:fd1e:fc5f]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::41b1:11f5:fd1e:fc5f%5]) with mapi id 15.20.3825.023; Fri, 5 Feb 2021
 23:09:17 +0000
Subject: Re: [PATCH v4 11/14] drm/amdgpu: Guard against write accesses after
 device removal
To: Daniel Vetter <daniel.vetter@ffwll.ch>
References: <1611003683-3534-1-git-send-email-andrey.grodzovsky@amd.com>
 <1611003683-3534-12-git-send-email-andrey.grodzovsky@amd.com>
 <35ecd67f-620f-df50-3e03-d24dc12452d6@gmail.com>
 <8925db97-bf81-7e5e-527d-f654713b400d@amd.com>
 <CAKMK7uHCzBpaC2YypKeQwbJiT0JG2Hq7V0BC5yC88f9nqgxUiw@mail.gmail.com>
 <8ed4a153-d503-e704-0a0d-3422877e50fa@amd.com>
 <91b8ea73-aa69-1478-2e7c-63ab1cb250ae@gmail.com>
 <7834dbdf-27ad-f21d-b58b-2772a598ea8a@amd.com>
 <07dceec0-0be9-1531-0357-353f04d1cb2b@amd.com>
 <69f036e2-f102-8233-37f6-5254a484bf97@amd.com>
 <0b502043-5a66-dcd5-53f9-5c190f22dc46@gmail.com>
 <78e4705d-c55f-6c68-d0f9-b1939b636121@amd.com>
 <CAKMK7uEm=N4kQYyzMt=nUefu2BdyKNcWikFiSJih7CthJMd2Aw@mail.gmail.com>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <7cf5acce-1f6d-740b-1162-7a571deb949d@amd.com>
Date: Fri, 5 Feb 2021 18:09:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAKMK7uEm=N4kQYyzMt=nUefu2BdyKNcWikFiSJih7CthJMd2Aw@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:74f0:8064:c429:544e]
X-ClientProxiedBy: YT1PR01CA0030.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::43)
 To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:74f0:8064:c429:544e]
 (2607:fea8:3edf:49b0:74f0:8064:c429:544e) by
 YT1PR01CA0030.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.19 via Frontend Transport; Fri, 5 Feb 2021 23:09:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6bfe9174-0548-46b5-f3b3-08d8ca2b0fe4
X-MS-TrafficTypeDiagnostic: SA0PR12MB4368:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB43680CF266BD01F2BBE35B37EAB29@SA0PR12MB4368.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HSyE65EKJj5vcde2AzW8kgz5bPYVmEwF713E997bcpoi6hZorSDFERDWMQ96XRW/C4X2DigQaArjdQkizY/QkgLNFQTGuIU1ICJfEMi+zAZ6afJ4h87+CCtf0IZ8IwCQ4TFpBmOfqkKlgyLHg/Z8VphDNAuFtrXvdTgvXczq6eI1E5u7yDOgs3quXrfwmQqOd7eRE8GQ60o9MDuMboiMBHNPCJljZ6TjxOFiBmDMHLA6iynDHSEkRT+YHqaiLsY34nokxHVorfxZiSPY6ILLXunNJgIzxlanWHG3nZ13J/8iNjHEWKOb6MEejMozMKm1Ouii1n6YJnDxbCS2/mKssC0eTuTtD1dbqM3omkm5vVqMcXGlQX5TgEZrnh2yvsT+k9eSn1CeLnRK4mtOhAGU/SFrjSOMTbqiPckwrpT7LWUlavKs/vlZzpvyHxsb89LoOv1K/rKTOeD1FEWZgU78Eb4EpaTeyrdKLuaYdOUVisIQh2QCSMTo/7cRy/hHUpYzAbHOMwB6lt0tCgXX0RuprfnckyZZneLy/6cGdjhX6prHaReBpMxR0UFUTm3NUrdRGhZJoxE90rhcbVGqJ/KnN2sH0VjN+L+qkc54IuTfTidkZZWET1/ASeZDcm4tbh78UP80iqGraQ/KGLutFCu6+w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(346002)(366004)(136003)(376002)(8676002)(45080400002)(2906002)(53546011)(4326008)(16526019)(186003)(31696002)(6486002)(86362001)(6916009)(8936002)(316002)(52116002)(66476007)(66556008)(66946007)(54906003)(5660300002)(31686004)(966005)(66574015)(36756003)(2616005)(83380400001)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bEpwV0ZIY2ZQMnVHOTlDMUdyY2JScGQ5K0RXR1pWOEN1Tk1JYlRxZUpQakNH?=
 =?utf-8?B?MHRUQjJiMGZLRVRLZGttMWRVMURIMU9JckdFY0tXQ2Y0dnJzMStGZGNKY0d0?=
 =?utf-8?B?UjlBcWNWTmlmd0JUSmFVZVdLa3R5NGJvRlJvK05UVytXOW5KK2RrN0kyK1Vs?=
 =?utf-8?B?bkhrZE9EMlA4VjdQczlxSDlyKzNuVlNFdnNCY2s4TkFoclVGTVlaY1dmMUpo?=
 =?utf-8?B?eVFySitROWdkUVpmSnVLV21QQlNhMlg1ZUR5RmxCQkUyZSt6Q1ZFbHNXNHRO?=
 =?utf-8?B?UkM0TGNodkt0SXFrRjc3ZEF4S0s2MDJPaUZIS2lQT2VTKzJrdHhRdjVFLzZi?=
 =?utf-8?B?SWFYd2lhUG1hOXZDcHpibnc2QzZJTmRSRVQyc2s0dU1BQ1hpaEdCMmxrd0Js?=
 =?utf-8?B?UTM5cm84UmllcUg0K240cG1CM0hya3JFTGRuS28vYkc0OXoxZVQ2dm9KV0h3?=
 =?utf-8?B?MEpMMlZVTncwbjZGb29XY1d4UEVSTUhnSkF5OURCMmRma1BCQUUwR29kR2JM?=
 =?utf-8?B?N1FoQzN1K3QvczZHaktxd2xvOWNscWxEbllMZ1NqNCtpaHoxbVYzYnNPLzlQ?=
 =?utf-8?B?WC9ldWYrM05CL3B2Nk1QSXd4RUF6akV5dkFWSm1uQU1XdDJhaXh4U3FXWmNI?=
 =?utf-8?B?WGRMVGRBYkxieFQ1T3VsS0cwekxFWmNNM2tncGtIVVBPTGVwWGhRS3pPUGVV?=
 =?utf-8?B?NGpMQU5ESzYwS3JBSVBJSDNHNmhPMTkvZmpJazV2VHhxeE5TcVJ6VHRCMU15?=
 =?utf-8?B?TGx0Q24rUE01TnMrQjlZYWc2YnVnbFBBWnJLMzdKYWdhTjdtSzJVN0FKN0tE?=
 =?utf-8?B?dnZTaWI1alN1U2VDb1RDZW9Gak4vVWU2S0cxNUtZQW5SL3ZHbExwa2ppWFht?=
 =?utf-8?B?b2NiSmlPbHV4MmIvNE1hQXpLMksrQ3JiaDNMb0VKQVpXTmZyVXZUc2VVbzF4?=
 =?utf-8?B?Y1RxZ05BRVI1eHBvM3QxNWE5d1YxRGRHdzQxQlAzVXNzVmZLakM3eWE0VUEw?=
 =?utf-8?B?OHdLT0gxeUpQTkh3NWU1bS9hSzZ4ZFd3SlF1aURBaUpaZmtMN1ZPcm5yNytL?=
 =?utf-8?B?S1JQYjUvaXJxTWZQT1RkMlNPa1JaMmJEdHZ6S3dydzJaOE1LempYQWMyOXFG?=
 =?utf-8?B?VEt6ODFJVmNnSU94bllyWmhHcWRDRnBsWVhNcStoMzc2NWx1Z1Y1NVR6Unhw?=
 =?utf-8?B?cHc4S0hSbnViVGxVWkpIdG5LMGNpVVViN0JrbTQ4b1RIK1RObTdsR21Remkv?=
 =?utf-8?B?eGFZenUxQmtzZGwxQ29uUndxRXNiYXFGRVMvTlJITnF1S0tPN0dZWitKcEYw?=
 =?utf-8?B?WU5ZMjZGdHhlZzUwMnhTUUdtOTBCYVpNaWtoMllGTEZLeFlOdTcvWkQ2Qmpv?=
 =?utf-8?B?bm52RzljbUY1Sk9STXk4NGtJdEhteDJKWTNPZEErUk1FL1FwWGpqSHZsM1Fi?=
 =?utf-8?B?V2dUZ1ZRWEZYNlF3dWlhWmNqMFhBajlEZHZoKzhFRmpYTTl6RWNVR25oZnYx?=
 =?utf-8?B?THhMMHFKcFZaQzZTL1BBMVdGS2U1dUZVeitCWTcvelB2UU85UUNTbFF1RGNz?=
 =?utf-8?B?eHlLN1UvcWZ2MGtqamI1OSs0cnRFUG03K3BjeFYwMnM3a3VtU3RocU5EWkc2?=
 =?utf-8?B?NUcrTEZ3OWNkdkt2WTltUy9Xc0lnNkRsR3lKMVRyZDBZcnhmSmR0bFhTQ3Q5?=
 =?utf-8?B?eVZPTlBRMk1jallOZ3Izc0NOSXJ3L1ZGZUhyMldkc21JMGsvM0Jmb0w1cm51?=
 =?utf-8?B?RU5SQVFxSkFnUmttblVJSSt2S2c1Z3F2NjEyTnlLZGJzdGJmSlJUa2VTOUx4?=
 =?utf-8?B?TDBHWVU0WHhOZjJ0T3VwTVgyZE5IOENSN3grcVhrL1JDVkFTYXhSL3BEWXV3?=
 =?utf-8?B?ZjNxVjFlNW1hUithMVF6TGNiVDZkZEptZVJlMUdlbE9DZFE9PQ==?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bfe9174-0548-46b5-f3b3-08d8ca2b0fe4
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 23:09:17.4760 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iPxtyxSHTMzV0szqRTKP9pcxlZ4sPIMN6My7HAGqKeMxVKB3hMocw9x6fiGJbkp338YurIBpYTYaoZxEFDxtVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4368
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
Cc: Greg KH <gregkh@linuxfoundation.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <Alexander.Deucher@amd.com>, Qiang Yu <yuq825@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiAyLzUvMjEgNToxMCBQTSwgRGFuaWVsIFZldHRlciB3cm90ZToKPiBPbiBGcmksIEZlYiA1
LCAyMDIxIGF0IDU6MjIgUE0gQW5kcmV5IEdyb2R6b3Zza3kKPiA8QW5kcmV5Lkdyb2R6b3Zza3lA
YW1kLmNvbT4gd3JvdGU6Cj4+Cj4+IERhbmllbCwgcGluZy4gQWxzbywgcGxlYXNlIHJlZmVyIHRv
IHRoZSBvdGhlciB0aHJlYWQgd2l0aCBCam9ybiBmcm9tIHBjaS1kZXYKPj4gb24gdGhlIHNhbWUg
dG9waWMgSSBhZGRlZCB5b3UgdG8uCj4gCj4gU3VtbWFyaXppbmcgbXkgdGFrZSBvdmVyIHRoZXJl
IGZvciBoZXJlIHBsdXMgbWF5YmUgc29tZSBtb3JlCj4gY2xhcmlmaWNhdGlvbi4gVGhlcmUncyB0
d28gcHJvYmxlbXM6Cj4gCj4gLSBZb3UgbXVzdCBndWFyYW50ZWUgdGhhdCBhZnRlciB0aGUgLT5y
ZW1vdmUgY2FsbGJhY2sgb2YgeW91ciBkcml2ZXIKPiBpcyBmaW5pc2hlZCwgdGhlcmUncyBubyBt
b3JlIG1taW8gb3IgYW55IG90aGVyIGh3IGFjY2Vzcy4gQQo+IGNvbWJpbmF0aW9uIG9mIHN0b3Bw
aW5nIHN0dWZmIGFuZCBkcm1fZGV2X2VudGVyL2V4aXQgY2FuIGhlbHAgd2l0aAo+IHRoYXQuIFRo
aXMgcHJldmVudHMgdGhlIHVzZS1hZnRlci1mcmVlIGlzc3VlLgo+IAo+IC0gRm9yIHRoZSBhY3R1
YWwgaG90dW5wbHVnIHRpbWUsIGkuZS4gYW55dGhpbmcgdGhhdCBjYW4gcnVuIHdoaWxlIHlvdXIK
PiBkcml2ZXIgaXMgdXNlZCB1cCB0byB0aGUgcG9pbnQgd2hlcmUgLT5yZW1vdmUgY2FsbGJhY2sg
aGFzIGZpbmlzaGVkCj4gc3RvcHAgaHcgYWNjZXNzIHlvdSBtdXN0IGd1YXJhbnRlZSB0aGF0IGNv
ZGUgZG9lc24ndCBibG93IHVwIHdoZW4gaXQKPiBnZXRzIGJvZ3VzIHJlYWRzIChpbiB0aGUgZm9y
bSBvZiAweGZmIHZhbHVlcykuIGRybV9kZXZfZW50ZXIvZXhpdAo+IGNhbid0IGhlbHAgeW91IHdp
dGggdGhhdC4gUGx1cyB5b3Ugc2hvdWxkIG1ha2Ugc3VyZSB0aGF0IHdlJ3JlIG5vdAo+IHNwZW5k
aW5nIGZvcmV2ZXIgd2FpdGluZyBmb3IgYSBiaWcgcGlsZSBvZiBtbWlvIGFjY2VzcyBhbGwgdG8g
dGltZSBvdXQKPiBiZWNhdXNlIHlvdSBuZXZlciBiYWlsIG91dCAtIHNvbWUgY29hcnNlLWdyYWlu
ZWQgZHJtX2Rldl9lbnRlci9leGl0Cj4gbWlnaHQgaGVscCBoZXJlLgo+IAo+IFBsdXMgZmluYWxs
eSB0aGUgdXNlcnNwYWNlIGFjY2VzcyBwcm9ibGVtOiBZb3UgbXVzdCBndWFyYW50ZWUgdGhhdAo+
IGFmdGVyIC0+cmVtb3ZlIGhhcyBmaW5pc2hlZCB0aGF0IG5vbmUgb2YgdGhlIHVhcGkgb3IgY3Jv
c3MtZHJpdmVyCj4gYWNjZXNzIHBvaW50cyAoZHJpdmVyIGlvY3RsLCBkbWEtYnVmLCBkbWEtZmVu
Y2UsIGFueXRoaW5nIGVsc2UgdGhhdAo+IGhhbmdzIGFyb3VuZCkgY2FuIHJlYWNoIHRoZSBkYXRh
IHN0cnVjdHVyZXMvbWVtb3J5IG1hcHBpbmdzL3doYXRldmVyCj4gd2hpY2ggaGF2ZSBiZWVuIHJl
bGVhc2VkIGFzIHBhcnQgb2YgeW91ciAtPnJlbW92ZSBjYWxsYmFjay4KPiBkcm1fZGV2X2VudGVy
L2V4aXQgaXMgYWdhaW4gdGhlIHRvb2wgb2YgY2hvaWNlIGhlcmUuCj4gCj4gU28geW91IGhhdmUg
dG8gdXNlIGRybV9kZXZfZW50ZXIvZXhpdCBmb3Igc29tZSBvZiB0aGUgcHJvYmxlbXMgd2UgZmFj
ZQo+IG9uIGhvdHVucGx1ZywgYnV0IGl0J3Mgbm90IHRoZSB0b29sIHRoYXQgY2FuIGhhbmRsZSB0
aGUgYWN0dWFsIGh3Cj4gaG90dW5wbHVnIHJhY2UgY29uZGl0aW9ucyBmb3IgeW91Lgo+IAo+IFVu
Zm9ydHVuYXRlbHkgdGhlIGh3IGhvdHVucGx1ZyByYWNlIGNvbmRpdGlvbiBpcyBhbiB1dHRlciBw
YWluIHRvCj4gdGVzdCwgc2luY2UgZXNzZW50aWFsbHkgeW91IG5lZWQgdG8gdmFsaWRhdGUgeW91
ciBkcml2ZXIgYWdhaW5zdAo+IHNwdXJpb3VzIDB4ZmYgcmVhZHMgYXQgYW55IG1vbWVudC4gQW5k
IEkgZG9uJ3QgZXZlbiBoYXZlIGEgY2xldmVyIGlkZWEKPiB0byBzaW11bGF0ZSB0aGlzLCBlLmcu
IGJ5IGZvcmNlZnVsbHkgcmVwbGFjaW5nIHRoZSBpb2JhciBtYXBwaW5nOiBXaGF0Cj4gd2UnZCBu
ZWVkIGlzIGEgbWFwcGluZyB0aGF0IGFsbG93cyByZWFkcyAoc28gd2UgY2FuIGZpbGwgYSBwYWdl
IHdpdGgKPiAweGZmIGFuZCB1c2UgdGhhdCBldmVyeXdoZXJlKSwgYnV0IGluc3RlYWQgb2YgcmVq
ZWN0aW5nIHdyaXRlcywgYWxsb3dzCj4gdGhlbSwgYnV0IGRyb3BzIHRoZW0gKHNvIHRoYXQgdGhl
IDB4ZmYgc3RheXMgaW50YWN0KS4gTWF5YmUgd2UgY291bGQKPiBzaW11bGF0ZSB0aGlzIHdpdGgg
c29tZSBrZXJuZWwgZGVidWcgdHJpY2tzIChraW5kYSBsaWtlIG1taW90cmFjZSkKPiB3aXRoIGEg
cmVhZC1vbmx5IG1hcHBpbmcgYW5kIGRyb3BwaW5nIGV2ZXJ5IHdyaXRlIGV2ZXJ5IHRpbWUgd2Ug
ZmF1bHQuCj4gQnV0IHVnaCAuLi4KPiAKPiBPdG9oIHZhbGlkYXRpbmcgYW4gZW50aXJlIGRyaXZl
ciBsaWtlIGFtZGdwdSB3aXRob3V0IHN1Y2ggYSB0cmljawo+IGFnYWluc3QgMHhmZiByZWFkcyBp
cyBwcmFjdGljYWxseSBpbXBvc3NpYmxlLiBTbyBtYXliZSB5b3UgbmVlZCB0byBhZGQKPiB0aGlz
IGFzIG9uZSBvZiB0aGUgdGFza3MgaGVyZT8KPiAtRGFuaWVsCgpOb3Qgc3VyZSBpdCdzIG5vdCBh
IGR1bXAgaWRlYSBidXQgc3RpbGwsIHdvcnRoIGFza2luZyAtICB3aGF0IGlmIEkKanVzdCBzaW1w
bHkgcXVpZXRseSByZXR1cm4gZWFybHkgZnJvbSB0aGUgLnJlbW92ZSAgY2FsbGJhY2sgIHdpdGhv
dXQKZG9pbmcgYW55dGhpbmcgdGhlcmUsIHRoZSBkcml2ZXIgd2lsbCBub3QgYmUgYXdhcmUgdGhh
dCB0aGUgZGV2aWNlCmlzIHJlbW92ZWQgYW5kIHdpbGwgYXQgbGVhc3QgdHJ5IHRvIGNvbnRpbnVl
IHdvcmtpbmcgYXMgdXN1YWwgaW5jbHVkaW5nCklPQ1RMcywgam9iIHNjaGVkdWxpbmcgZS50LmMu
IE9uIHRoZSBvdGhlciBoYW5kIGFsbCBNTUlPIHJlYWQgYWNjZXNzZXMgd2lsbApzdGFydCByZXR1
cm5pbmcgfjAsIHJlZ2FyZGluZyByZWplY3Rpbmcgd3JpdGVzIC0gSSBkb24ndCBzZWUgYW55d2hl
cmUKd2UgdGVzdCBmb3IgcmVzdWx0IG9mIHdyaXRpbmcgKGUuZy4gYW1kZ3B1X21tX3dyZWc4KSBz
byBzZWVtcyB0aGV5IHdpbGwKanVzdCBzZWFtbGVzc2x5ICBnbyB0aHJvdWdoLi4uIE9yIGlzIGl0
IHRoZSBwY2lfZGV2IHRoYXQgd2lsbCBiZSBmcmVlZApieSBQQ0kgY29yZSBpdHNlbGYgYW5kIHNv
IEkgd2lsbCBpbW1lZGlhdGVseSBjcmFzaCA/CgpBbmRyZXkKCj4gCj4+Cj4+IEFuZHJleQo+Pgo+
PiBPbiAxLzI5LzIxIDI6MjUgUE0sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+PiBBbSAyOS4w
MS4yMSB1bSAxODozNSBzY2hyaWViIEFuZHJleSBHcm9kem92c2t5Ogo+Pj4+Cj4+Pj4gT24gMS8y
OS8yMSAxMDoxNiBBTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4+Pj4gQW0gMjguMDEuMjEg
dW0gMTg6MjMgc2NocmllYiBBbmRyZXkgR3JvZHpvdnNreToKPj4+Pj4+Cj4+Pj4+PiBPbiAxLzE5
LzIxIDE6NTkgUE0sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+Pj4+Pj4gQW0gMTkuMDEuMjEg
dW0gMTk6MjIgc2NocmllYiBBbmRyZXkgR3JvZHpvdnNreToKPj4+Pj4+Pj4KPj4+Pj4+Pj4gT24g
MS8xOS8yMSAxOjA1IFBNLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+Pj4+Pj4+Pj4gW1NOSVBdCj4+
Pj4+Pj4+IFNvIHNheSB3cml0aW5nIGluIGEgbG9vcCB0byBzb21lIGhhcm1sZXNzIHNjcmF0Y2gg
cmVnaXN0ZXIgZm9yIG1hbnkgdGltZXMKPj4+Pj4+Pj4gYm90aCBmb3IgcGx1Z2dlZAo+Pj4+Pj4+
PiBhbmQgdW5wbHVnZ2VkIGNhc2UgYW5kIG1lYXN1cmUgdG90YWwgdGltZSBkZWx0YSA/Cj4+Pj4+
Pj4KPj4+Pj4+PiBJIHRoaW5rIHdlIHNob3VsZCBhdCBsZWFzdCBtZWFzdXJlIHRoZSBmb2xsb3dp
bmc6Cj4+Pj4+Pj4KPj4+Pj4+PiAxLiBXcml0aW5nIFggdGltZXMgdG8gYSBzY3JhdGNoIHJlZyB3
aXRob3V0IHlvdXIgcGF0Y2guCj4+Pj4+Pj4gMi4gV3JpdGluZyBYIHRpbWVzIHRvIGEgc2NyYXRj
aCByZWcgd2l0aCB5b3VyIHBhdGNoLgo+Pj4+Pj4+IDMuIFdyaXRpbmcgWCB0aW1lcyB0byBhIHNj
cmF0Y2ggcmVnIHdpdGggdGhlIGhhcmR3YXJlIHBoeXNpY2FsbHkgZGlzY29ubmVjdGVkLgo+Pj4+
Pj4+Cj4+Pj4+Pj4gSSBzdWdnZXN0IHRvIHJlcGVhdCB0aGF0IG9uY2UgZm9yIFBvbGFyaXMgKG9y
IG9sZGVyKSBhbmQgb25jZSBmb3IgVmVnYSBvcgo+Pj4+Pj4+IE5hdmkuCj4+Pj4+Pj4KPj4+Pj4+
PiBUaGUgU1JCTSBvbiBQb2xhcmlzIGlzIG1lYW50IHRvIGludHJvZHVjZSBzb21lIGRlbGF5IGlu
IGVhY2ggYWNjZXNzLCBzbyBpdAo+Pj4+Pj4+IG1pZ2h0IHJlYWN0IGRpZmZlcmVudGx5IHRoZW4g
dGhlIG5ld2VyIGhhcmR3YXJlLgo+Pj4+Pj4+Cj4+Pj4+Pj4gQ2hyaXN0aWFuLgo+Pj4+Pj4KPj4+
Pj4+Cj4+Pj4+PiBTZWUgYXR0YWNoZWQgcmVzdWx0cyBhbmQgdGhlIHRlc3RpbmcgY29kZS4gUmFu
IG9uIFBvbGFyaXMgKGdmeDgpIGFuZAo+Pj4+Pj4gVmVnYTEwKGdmeDkpCj4+Pj4+Pgo+Pj4+Pj4g
SW4gc3VtbWFyeSwgb3ZlciAxIG1pbGxpb24gV1dSRUczMiBpbiBsb29wIHdpdGggYW5kIHdpdGhv
dXQgdGhpcyBwYXRjaCB5b3UKPj4+Pj4+IGdldCBhcm91bmQgMTBtcyBvZiBhY2N1bXVsYXRlZCBv
dmVyaGVhZCAoIHNvIDAuMDAwMDEgbWlsbGlzZWNvbmQgcGVuYWx0eSBmb3IKPj4+Pj4+IGVhY2gg
V1dSRUczMikgZm9yIHVzaW5nIGRybV9kZXZfZW50ZXIgY2hlY2sgd2hlbiB3cml0aW5nIHJlZ2lz
dGVycy4KPj4+Pj4+Cj4+Pj4+PiBQLlMgQnVsbGV0IDMgSSBjYW5ub3QgdGVzdCBhcyBJIG5lZWQg
ZUdQVSBhbmQgY3VycmVudGx5IEkgZG9uJ3QgaGF2ZSBvbmUuCj4+Pj4+Cj4+Pj4+IFdlbGwgaWYg
SSdtIG5vdCBjb21wbGV0ZWx5IG1pc3Rha2VuIHRoYXQgYXJlIDEwMG1zIG9mIGFjY3VtdWxhdGVk
IG92ZXJoZWFkLgo+Pj4+PiBTbyBhcm91bmQgMTAwbnMgcGVyIHdyaXRlLiBBbmQgZXZlbiBiaWdn
ZXIgcHJvYmxlbSBpcyB0aGF0IHRoaXMgaXMgYSB+NjclCj4+Pj4+IGluY3JlYXNlLgo+Pj4+Cj4+
Pj4KPj4+PiBNeSBiYWQsIGFuZCA2NyUgZnJvbSB3aGF0ID8gSG93IHUgY2FsY3VsYXRlID8KPj4+
Cj4+PiBNeSBiYWQsICgzMDg1MDEtMjA5Njg5KS8yMDk2ODk9NDclIGluY3JlYXNlLgo+Pj4KPj4+
Pj4KPj4+Pj4gSSdtIG5vdCBzdXJlIGhvdyBtYW55IHdyaXRlIHdlIGRvIGR1cmluZyBub3JtYWwg
b3BlcmF0aW9uLCBidXQgdGhhdCBzb3VuZHMKPj4+Pj4gbGlrZSBhIGJpdCBtdWNoLiBJZGVhcz8K
Pj4+Pgo+Pj4+IFdlbGwsIHUgc3VnZ2VzdGVkIHRvIG1vdmUgdGhlIGRybV9kZXZfZW50ZXIgd2F5
IHVwIGJ1dCBhcyBpIHNlZSBpdCB0aGUgcHJvYmxlbQo+Pj4+IHdpdGggdGhpcyBpcyB0aGF0IGl0
IGluY3JlYXNlIHRoZSBjaGFuY2Ugb2YgcmFjZSB3aGVyZSB0aGUKPj4+PiBkZXZpY2UgaXMgZXh0
cmFjdGVkIGFmdGVyIHdlIGNoZWNrIGZvciBkcm1fZGV2X2VudGVyICh0aGVyZSBpcyBhbHNvIHN1
Y2gKPj4+PiBjaGFuY2UgZXZlbiB3aGVuIGl0J3MgcGxhY2VkIGluc2lkZSBXV1JFRyBidXQgaXQn
cyBsb3dlcikuCj4+Pj4gRWFybGllciBJIHByb3BzZWQgdGhhdCBpbnN0ZWFkIG9mIGRvaW5nIGFs
bCB0aG9zZSBndWFyZHMgc2NhdHRlcmVkIGFsbCBvdmVyCj4+Pj4gdGhlIGNvZGUgc2ltcGx5IGRl
bGF5IHJlbGVhc2Ugb2Ygc3lzdGVtIG1lbW9yeSBwYWdlcyBhbmQgdW5yZXNlcnZlIG9mCj4+Pj4g
TU1JTyByYW5nZXMgdG8gdW50aWwgYWZ0ZXIgdGhlIGRldmljZSBpdHNlbGYgaXMgZ29uZSBhZnRl
ciBsYXN0IGRybSBkZXZpY2UKPj4+PiByZWZlcmVuY2UgaXMgZHJvcHBlZC4gQnV0IERhbmllbCBv
cHBvc2VzIGRlbGF5aW5nIE1NSU8gcmFuZ2VzIHVucmVzZXJ2ZSB0byBhZnRlcgo+Pj4+IFBDSSBy
ZW1vdmUgY29kZSBiZWNhdXNlIGFjY29yZGluZyB0byBoaW0gaXQgd2lsbCB1cHNldCB0aGUgUENJ
IHN1YnN5dGVtLgo+Pj4KPj4+IFllYWgsIHRoYXQncyBtb3N0IGxpa2VseSB0cnVlIGFzIHdlbGwu
Cj4+Pgo+Pj4gTWF5YmUgRGFuaWVsIGhhcyBhbm90aGVyIGlkZWEgd2hlbiBoZSdzIGJhY2sgZnJv
bSB2YWNhdGlvbi4KPj4+Cj4+PiBDaHJpc3RpYW4uCj4+Pgo+Pj4+Cj4+Pj4gQW5kcmV5Cj4+Pj4K
Pj4+Pj4KPj4+Pj4gQ2hyaXN0aWFuLgo+Pj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4+Pj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPj4+PiBhbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+Pj4+IGh0dHBzOi8vbmFtMTEuc2FmZWxpbmtzLnByb3Rl
Y3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmxpc3RzLmZyZWVkZXNrdG9wLm9y
ZyUyRm1haWxtYW4lMkZsaXN0aW5mbyUyRmFtZC1nZngmYW1wO2RhdGE9MDQlN0MwMSU3Q0FuZHJl
eS5Hcm9kem92c2t5JTQwYW1kLmNvbSU3Qzc4MTBkOGQ2ZjAzNDQzY2UyZTA0MDhkOGNhMjJlYTk5
JTdDM2RkODk2MWZlNDg4NGU2MDhlMTFhODJkOTk0ZTE4M2QlN0MwJTdDMCU3QzYzNzQ4MTU5ODYx
NTU4MTY5MyU3Q1Vua25vd24lN0NUV0ZwYkdac2IzZDhleUpXSWpvaU1DNHdMakF3TURBaUxDSlFJ
am9pVjJsdU16SWlMQ0pCVGlJNklrMWhhV3dpTENKWFZDSTZNbjAlM0QlN0MxMDAwJmFtcDtzZGF0
YT16VFY2RlRwTDN0aXRtTVRWRVB4eFZUOGU1bFRLVnNMVml3WnVkRXNObiUyQnclM0QmYW1wO3Jl
c2VydmVkPTAKPj4+Pgo+Pj4KPiAKPiAKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==

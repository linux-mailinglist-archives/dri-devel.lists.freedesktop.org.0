Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41AD73218F2
	for <lists+dri-devel@lfdr.de>; Mon, 22 Feb 2021 14:35:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC61D6E0DC;
	Mon, 22 Feb 2021 13:35:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2075.outbound.protection.outlook.com [40.107.94.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 461666E0DC;
 Mon, 22 Feb 2021 13:35:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jbiIMfIESiAkyQMPp5KEkx6fCvbGAO7SxV7FpT/RfgF7krVAu8OvjUeJStDviai0gGMh+1yxLbNG6YUdWxLEV1l045zVd1Us9ss77YbTtT4Z3unMaIImntrKddK76MlshxhjLhWNuUBuiJrANscOdpcdtCyo8a1HcEihpdqa/xUASxzlmzEb8FoSal8rrCh7LFE8nnhL1+ftgW0eOIEObr31ALJ4QKa0nWFSzNysi6FAg3DfjnxXPvLc962yuGxmbkQvOhsjx+p+l2oVKefC85l7bJ5CuDg7w3HiijvswKbfKJsqtg+IHlKoTRP/EhajnfjtjXenEMYNhvxH1/scUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bqxnBnV4UkxNsBnRZbYja9IXbxbOIpNOVEl19GUYB+c=;
 b=Iq09jpUzZIHO6DKFV1KLmLUzTirwMAkJa4xkcgjx1/qk0CaZbbcBI8yiW12vHNBMJQ/jpaID1nsck/UZq8Dwia2gTfXlaV1yyWJnWZizoWLzG48EA4ABuWDcC0TYx0nGfT0L3Oh57L8qDmyi3IVT47TJFfCyrlAWjuTNOVCE2KU0NDw57MRtrkWYpu/GgyV37URYN0IKbL5pii+qZrZLXmOw5eKAo2nAkUOIEEYGpbFtdgqHANNMJef/l/SKzvoGvH29crSrBM7atRWDKDEiaVzkt3aNPHXCp8MPiKFF2jzN93H6n4tVu1l7mQLYXbR3LHxp8MH/f/4IEWt6z0TkgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bqxnBnV4UkxNsBnRZbYja9IXbxbOIpNOVEl19GUYB+c=;
 b=mO3kw4uH8gq2ObsHv78/FqSD0X/ghBtRjoEWIyrqzJ9NaYbZ7gCKRc0wRrjAcoAls+km7J8TAXT8484fZa+jn8AdGQwSb3q5FSbURmQo7yjyxvSxcTEABvnHs7DPMv2lN8ArBNj/QGWsWiRgYFwQx8GTFVanZPwzhJBP6AHDsLs=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB4749.namprd12.prod.outlook.com (2603:10b6:805:e8::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.34; Mon, 22 Feb
 2021 13:35:16 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::41b1:11f5:fd1e:fc5f]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::41b1:11f5:fd1e:fc5f%5]) with mapi id 15.20.3868.033; Mon, 22 Feb 2021
 13:35:16 +0000
Subject: Re: [PATCH v2] drm/scheduler: Fix hang when sched_entity released
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <1613599181-9492-1-git-send-email-andrey.grodzovsky@amd.com>
 <bc2c5ce4-a641-8a5e-bd7b-11174c883e99@gmail.com>
 <6f8dac3e-99eb-1b84-60f9-ee9b24210fbc@amd.com>
 <abcb8ea9-fcb4-a781-bf87-d12f3910e484@gmail.com>
 <74c4a9e1-f1e0-03e5-3c99-755f3cf1b60f@amd.com>
 <bf874237-033c-8eb2-336c-ec79ae9ef941@gmail.com>
 <5e52bd1b-107c-ffea-8d29-aae474047859@amd.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <8edee026-d09a-b04c-8a39-baabefaa2000@amd.com>
Date: Mon, 22 Feb 2021 08:35:07 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <5e52bd1b-107c-ffea-8d29-aae474047859@amd.com>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:fa64:c93b:6c76:3385]
X-ClientProxiedBy: YT1PR01CA0155.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::34) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:fa64:c93b:6c76:3385]
 (2607:fea8:3edf:49b0:fa64:c93b:6c76:3385) by
 YT1PR01CA0155.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3868.31 via Frontend Transport; Mon, 22 Feb 2021 13:35:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 265bc267-20d4-4a79-33b4-08d8d736b06d
X-MS-TrafficTypeDiagnostic: SN6PR12MB4749:
X-Microsoft-Antispam-PRVS: <SN6PR12MB47490523C49E59A1C7DCAD14EA819@SN6PR12MB4749.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:663;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6Vu8uIo2KpqgbMkgD5lGVwDHl8EubKM1HWqsDFjuDvCbKbsZPF7+Him05P5L6USXPAwDdfDBir/ZfFanemEO9tHAnTN9ngM6g0+c+hLZxtqciy4akW7Z52Kxxf4H0ByF4vioHN6uLkmvW/eO3JmyVwJU/sGnAH/uHpC2wHEf95TqX5gObRBKEwnNUMS1oXQeWkf/aT/dN2JfATo2AKvJCUHrEO/oHBKh0h5Bsd/qO6yYdS+0Z4DRuYRJ95Ue8DgVZXeOqQVPtfnrV5NoWeayFkDyfZEzUvK9JkLRXNE3k94zZlHACWtJ9hAPF6AMoQQwarW0dVK0/Xik+0oZZ6o22uJ4deMasIDqEMNx6ZNVdJwzjUh2J/LgiFgPtTVsR7Gh94G4Dp41B9/+bu/ovTtXTPzsTj4PQvwnFtfRX/IqnFRcQ8IRUCcH09WlR1lv8oeE+fZ6/wf9GU7o6arQMePCVwo5xfFkDG2Wd+ckSCHsLtu6TP5kV/mrjEoYRLq6mw36yH2di9ffqx1rUEMYVRDcrJctfvM3U23CrA7u8g4lwDX8l3nsuKbck77tQCqauOBGQZf33hrVq26DO/ReesOamZQTv0hJf2nJOJ56/j/0VrrcATHQBq2a1lpcV8ccIhn1Bfo3PkVlLYXCVSoEsnUoKQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(39860400002)(396003)(366004)(316002)(6666004)(66574015)(86362001)(8676002)(44832011)(66476007)(2906002)(186003)(16526019)(31696002)(83380400001)(53546011)(66946007)(6486002)(2616005)(52116002)(5660300002)(8936002)(45080400002)(31686004)(36756003)(966005)(478600001)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MUM3KzlHL1JQVkltK09TTDdSeW43dnBiSk9UOCtncTVUK2JuemlCdjR3OGho?=
 =?utf-8?B?QjZiQ3ZjeDZKbE40eXZSNGFIZEhTSmJ5N3JwSHhpWkJhUUZkd0U4aXZpNE9x?=
 =?utf-8?B?dVBzd0dibDloQlczT0NvQ3djVWxBdEFwcXM1UGcvMDYzNE9sazFzeER6aTZm?=
 =?utf-8?B?NFY3UzFsc1JEODkyQTUwbi93b00rd3ZDWnN2UTFSb21qbnpLVzlOZFhnUXZJ?=
 =?utf-8?B?amUzNXNLanJmeEZwS1NHT2krVGM4aTljQWNtN0Y2U1NCOG13bzVsemRUdzFp?=
 =?utf-8?B?YytUNmVKcWR1OTZGVnMzeGV2SHZRdTFlS0dwTUxMbXZONmMreE0rMmgzRDh0?=
 =?utf-8?B?ZFJScUFmdFFQZGo2TVlLMm4vM25KWUxGU1QzdjRNSFNvMGFEdFFaUUJrcnM0?=
 =?utf-8?B?cTlVemtSOGxUSElYQnl4WXlEOU1lNWR3azRjd0xHR2lMYUpnUDNCMW4zZ1dk?=
 =?utf-8?B?Y3JRQVZrQ2xmcGhVVWUxaW9mRFlHQ3VKZHpJdUFYSlQweDE4VktkY1ZHUTNK?=
 =?utf-8?B?c3l6bzRaNXFFbER4N3FOM3hRYU1HbGpaak9KaTB0bWJUMWZmV3hZWG1KVjI1?=
 =?utf-8?B?aklNaHlSc1VSL3RZN245U2dPSXFpLytRU2dKQTd5SWVHeGJXY3FNYUlPM3M0?=
 =?utf-8?B?R0c1RFdlWGNSUUFRcTVhaTAyQitYT2p6NURjOWQvcTdjVHE3V1BUZFlqTnZp?=
 =?utf-8?B?dmJ1WGZSbmRRWGFTcTRVdzBPQ3NJSFh3N0NyZEhYa0lXbjdCc1o2T0VOV2Fo?=
 =?utf-8?B?RjRxNnVyTEhOTk1KUTBCUDdFOXJ2UHRiMTc4eFZENlQvWVR2TThPTW4xMGU3?=
 =?utf-8?B?emNKcWM0cVpMejlodG5SamZndmhnUWR2Y2VTcStXSnZZYXdVaWNvMzVuLzVS?=
 =?utf-8?B?M0UrVlR3bTNhaDhCRU0xWndvODFPcytHcmx6NE9lakVaWm1YZnVpTkxaSk5I?=
 =?utf-8?B?ZzRubU5WSFIyVnhjSEVlbFk5a2JlR1RZWnNoTmI2aXI5SXUwY1h2bjZWQ1Zp?=
 =?utf-8?B?SGVHYm5kdTh6SS8vT3l1R2hDOExTSEtibitTRHFBY3BZaGdqeCtBL3N6TXlw?=
 =?utf-8?B?S2wxa2Q3ZWE5VHEyTkd6dzlQZURnWml2OEhld1U3d3JlNzN3amVBWU85SW1W?=
 =?utf-8?B?dWo5QjVhZmEwVldYdXVMRGRRUUtPKzA4TWh0c29hN29zZHR2d21YWDJIVjdT?=
 =?utf-8?B?Z2haR0lEUGN6MDlOTmNPMDE4clFlUXdyZ1BvbzlVRlphbDNHdjBYYUNUd1lX?=
 =?utf-8?B?V1oyZXh6dzdNQ3BDeGE5KzBqOXNvcGh4V1J5UXpXN21XSXZ3U3ZmV0RKM2Vi?=
 =?utf-8?B?K25nYk1ua1U2dGtPK09NeU45dWR0TEdFcm96T2Y2blZ1bXhPZ1RyM0xaNStW?=
 =?utf-8?B?L3o2UUwyb2NNRUpZR0VoL3JuMUpXQTd0QnZGUjNSNTZPUzBoQ3VqbmpLeUhI?=
 =?utf-8?B?OUYzWlg4Wll3YmdjOWNzWVByek1hWkgvUnhBenJpM1FYWUpocmtBeG9ZZ1pT?=
 =?utf-8?B?Mm9HMi9HZmxMbDFucWphRmUrR3o0N1RnNE5jbHRIY3FtTFBFQXBCQnZJcWdY?=
 =?utf-8?B?UndZcUROYjZINGZVQmppeHR1YlBPUE52QjZ3dTN4WVVxUUhUV0htd0hFMFBS?=
 =?utf-8?B?VWl3VnM5dnQ1TjAwMFVvWTlFUm1RY2tIZWw4NnpibUU1M0hEUFdpN25TTno0?=
 =?utf-8?B?Zk03YzFHKyttQWliSXh4L05JUHNwZHkxcVZpUGxJdTRMSDUwZm9qakZuTm1z?=
 =?utf-8?B?UFhVMlpvQWhwWHZOQjZCUG5HQUxLcWRtbXJidjA2MVV2TDBLOHYyRThMSVhB?=
 =?utf-8?B?K3R4aTROajBCYy9GTTkwb2ltTXgvdjN2QkQ2SEpjT3R6RmdpR2loSVhRK2Zo?=
 =?utf-8?Q?c/hKyQxJBLO9o?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 265bc267-20d4-4a79-33b4-08d8d736b06d
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 13:35:16.4405 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CiQgr2A0IQ7PqD959lkMo5WDOc9nTU592+lWeno4UcfgR7ADKNxDsoD7/G21rYSys5G22SpYWEHe64IiMN/Ojg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB4749
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UGluZwoKQW5kcmV5CgpPbiAyMDIxLTAyLTIwIDc6MTIgYS5tLiwgQW5kcmV5IEdyb2R6b3Zza3kg
d3JvdGU6Cj4KPiBPbiAyLzIwLzIxIDM6MzggQU0sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+
Cj4+Cj4+IEFtIDE4LjAyLjIxIHVtIDE3OjQxIHNjaHJpZWIgQW5kcmV5IEdyb2R6b3Zza3k6Cj4+
Pgo+Pj4gT24gMi8xOC8yMSAxMDoxNSBBTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4+PiBB
bSAxOC4wMi4yMSB1bSAxNjowNSBzY2hyaWViIEFuZHJleSBHcm9kem92c2t5Ogo+Pj4+Pgo+Pj4+
PiBPbiAyLzE4LzIxIDM6MDcgQU0sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+Pj4+Pgo+Pj4+
Pj4KPj4+Pj4+IEFtIDE3LjAyLjIxIHVtIDIyOjU5IHNjaHJpZWIgQW5kcmV5IEdyb2R6b3Zza3k6
Cj4+Pj4+Pj4gUHJvYmxlbTogSWYgc2NoZWR1bGVyIGlzIGFscmVhZHkgc3RvcHBlZCBieSB0aGUg
dGltZSBzY2hlZF9lbnRpdHkKPj4+Pj4+PiBpcyByZWxlYXNlZCBhbmQgZW50aXR5J3Mgam9iX3F1
ZXVlIG5vdCBlbXB0eSBJIGVuY291bnRyZWQKPj4+Pj4+PiBhIGhhbmcgaW4gZHJtX3NjaGVkX2Vu
dGl0eV9mbHVzaC4gVGhpcyBpcyBiZWNhdXNlIAo+Pj4+Pj4+IGRybV9zY2hlZF9lbnRpdHlfaXNf
aWRsZQo+Pj4+Pj4+IG5ldmVyIGJlY29tZXMgZmFsc2UuCj4+Pj4+Pj4KPj4+Pj4+PiBGaXg6IElu
IGRybV9zY2hlZF9maW5pIGRldGFjaCBhbGwgc2NoZWRfZW50aXRpZXMgZnJvbSB0aGUKPj4+Pj4+
PiBzY2hlZHVsZXIncyBydW4gcXVldWVzLiBUaGlzIHdpbGwgc2F0aXNmeSBkcm1fc2NoZWRfZW50
aXR5X2lzX2lkbGUuCj4+Pj4+Pj4gQWxzbyB3YWtldXAgYWxsIHRob3NlIHByb2Nlc3NlcyBzdHVj
ayBpbiBzY2hlZF9lbnRpdHkgZmx1c2hpbmcKPj4+Pj4+PiBhcyB0aGUgc2NoZWR1bGVyIG1haW4g
dGhyZWFkIHdoaWNoIHdha2VzIHRoZW0gdXAgaXMgc3RvcHBlZCBieSBub3cuCj4+Pj4+Pj4KPj4+
Pj4+PiB2MjoKPj4+Pj4+PiBSZXZlcnNlIG9yZGVyIG9mIGRybV9zY2hlZF9ycV9yZW1vdmVfZW50
aXR5IGFuZCBtYXJraW5nCj4+Pj4+Pj4gc19lbnRpdHkgYXMgc3RvcHBlZCB0byBwcmV2ZW50IHJl
aW5zZXJpb24gYmFjayB0byBycSBkdWUKPj4+Pj4+PiB0byByYWNlLgo+Pj4+Pj4+Cj4+Pj4+Pj4g
U2lnbmVkLW9mZi1ieTogQW5kcmV5IEdyb2R6b3Zza3kgPGFuZHJleS5ncm9kem92c2t5QGFtZC5j
b20+Cj4+Pj4+Pj4gLS0tCj4+Pj4+Pj4gwqAgZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hl
ZF9tYWluLmMgfCAzMSAKPj4+Pj4+PiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4+
Pj4+Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDMxIGluc2VydGlvbnMoKykKPj4+Pj4+Pgo+Pj4+Pj4+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYyAKPj4+
Pj4+PiBiL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jCj4+Pj4+Pj4gaW5k
ZXggOTA4YjBiNS4uYzZiNzk0NyAxMDA2NDQKPj4+Pj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
c2NoZWR1bGVyL3NjaGVkX21haW4uYwo+Pj4+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9zY2hl
ZHVsZXIvc2NoZWRfbWFpbi5jCj4+Pj4+Pj4gQEAgLTg5Nyw5ICs4OTcsNDAgQEAgRVhQT1JUX1NZ
TUJPTChkcm1fc2NoZWRfaW5pdCk7Cj4+Pj4+Pj4gwqDCoCAqLwo+Pj4+Pj4+IMKgIHZvaWQgZHJt
X3NjaGVkX2Zpbmkoc3RydWN0IGRybV9ncHVfc2NoZWR1bGVyICpzY2hlZCkKPj4+Pj4+PiDCoCB7
Cj4+Pj4+Pj4gK8KgwqDCoCBpbnQgaTsKPj4+Pj4+PiArwqDCoMKgIHN0cnVjdCBkcm1fc2NoZWRf
ZW50aXR5ICpzX2VudGl0eTsKPj4+Pj4+Cj4+Pj4+PiBCVFc6IFBsZWFzZSBvcmRlciB0aGF0IHNv
IHRoYXQgaSBpcyBkZWNsYXJlZCBsYXN0Lgo+Pj4+Pj4KPj4+Pj4+PiDCoMKgwqDCoMKgIGlmIChz
Y2hlZC0+dGhyZWFkKQo+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBrdGhyZWFkX3N0b3Aoc2No
ZWQtPnRocmVhZCk7Cj4+Pj4+Pj4gwqAgK8KgwqDCoCAvKiBEZXRhY2ggYWxsIHNjaGVkX2VudGl0
ZXMgZnJvbSB0aGlzIHNjaGVkdWxlciBvbmNlIGl0J3MgCj4+Pj4+Pj4gc3RvcHBlZCAqLwo+Pj4+
Pj4+ICvCoMKgwqAgZm9yIChpID0gRFJNX1NDSEVEX1BSSU9SSVRZX0NPVU5UIC0gMTsgaSA+PSAK
Pj4+Pj4+PiBEUk1fU0NIRURfUFJJT1JJVFlfTUlOOyBpLS0pIHsKPj4+Pj4+PiArwqDCoMKgwqDC
oMKgwqAgc3RydWN0IGRybV9zY2hlZF9ycSAqcnEgPSAmc2NoZWQtPnNjaGVkX3JxW2ldOwo+Pj4+
Pj4+ICsKPj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgaWYgKCFycSkKPj4+Pj4+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBjb250aW51ZTsKPj4+Pj4+PiArCj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKg
IC8qIExvb3AgdGhpcyB3YXkgYmVjYXVzZSBycS0+bG9jayBpcyB0YWtlbiBpbiAKPj4+Pj4+PiBk
cm1fc2NoZWRfcnFfcmVtb3ZlX2VudGl0eSAqLwo+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBzcGlu
X2xvY2soJnJxLT5sb2NrKTsKPj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgd2hpbGUgKChzX2VudGl0
eSA9IGxpc3RfZmlyc3RfZW50cnlfb3JfbnVsbCgmcnEtPmVudGl0aWVzLAo+Pj4+Pj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBzdHJ1Y3QgZHJtX3NjaGVkX2VudGl0eSwKPj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbGlzdCkpKSB7Cj4+Pj4+
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3Bpbl91bmxvY2soJnJxLT5sb2NrKTsKPj4+Pj4+
PiArCj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyogUHJldmVudCByZWluc2VydGlv
biBhbmQgcmVtb3ZlICovCj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3Bpbl9sb2Nr
KCZzX2VudGl0eS0+cnFfbG9jayk7Cj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc19l
bnRpdHktPnN0b3BwZWQgPSB0cnVlOwo+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRy
bV9zY2hlZF9ycV9yZW1vdmVfZW50aXR5KHJxLCBzX2VudGl0eSk7Cj4+Pj4+Pj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgc3Bpbl91bmxvY2soJnNfZW50aXR5LT5ycV9sb2NrKTsKPj4+Pj4+Cj4+
Pj4+PiBXZWxsIHRoaXMgc3Bpbl91bmxvY2svbG9jayBkYW5jZSBoZXJlIGRvZXNuJ3QgbG9vayBj
b3JyZWN0IGF0IGFsbCAKPj4+Pj4+IG5vdy4KPj4+Pj4+Cj4+Pj4+PiBDaHJpc3RpYW4uCj4+Pj4+
Cj4+Pj4+Cj4+Pj4+IEluIHdoYXQgd2F5ID8gSXQncyBpbiB0aGUgc2FtZSBzYW1lIG9yZGVyIGFz
IGluIG90aGVyIGNhbGwgc2l0ZXMgCj4+Pj4+IChzZWUgZHJtX3NjaGVkX2VudGl0eV9wdXNoX2pv
YiBhbmQgZHJtX3NjaGVkX2VudGl0eV9mbHVzaCkuCj4+Pj4+IElmIGkganVzdCBsb2NrZWQgcnEt
PmxvY2sgYW5kIGRpZCBsaXN0X2Zvcl9lYWNoX2VudHJ5X3NhZmUgd2hpbGUgCj4+Pj4+IG1hbnVh
bGx5IGRlbGV0aW5nIGVudGl0eS0+bGlzdCBpbnN0ZWFkIG9mIGNhbGxpbmcKPj4+Pj4gZHJtX3Nj
aGVkX3JxX3JlbW92ZV9lbnRpdHkgdGhpcyBzdGlsbCB3b3VsZCBub3QgYmUgcG9zc2libGUgYXMg
dGhlIAo+Pj4+PiBvcmRlciBvZiBsb2NrIGFjcXVpc2l0aW9uIGJldHdlZW4gc19lbnRpdHktPnJx
X2xvY2sKPj4+Pj4gYW5kIHJxLT5sb2NrIHdvdWxkIGJlIHJldmVyc2UgY29tcGFyZWQgdG8gdGhl
IGNhbGwgc2l0ZXMgbWVudGlvbmVkIAo+Pj4+PiBhYm92ZS4KPj4+Pgo+Pj4+IEFoLCBub3cgSSB1
bmRlcnN0YW5kLiBZb3UgbmVlZCB0aGlzIGJlY2F1c2UgCj4+Pj4gZHJtX3NjaGVkX3JxX3JlbW92
ZV9lbnRpdHkoKSB3aWxsIGdyYWIgdGhlIHJxIGxvY2sgYWdhaW4hCj4+Pj4KPj4+PiBQcm9ibGVt
IGlzIG5vdyB3aGF0IHByZXZlbnRzIHRoZSBlbnRpdHkgZnJvbSBiZWluZyBkZXN0cm95ZWQgd2hp
bGUgCj4+Pj4geW91IHJlbW92ZSBpdD8KPj4+Pgo+Pj4+IENocmlzdGlhbi4KPj4+Cj4+PiBSaWdo
dCwgd2VsbCwgc2luY2UgKHVuZm9ydHVuYXRlbHkpIHNjaGVkX2VudGl0eSBpcyBwYXJ0IG9mIAo+
Pj4gYW1kZ3B1X2N0eF9lbnRpdHkgYW5kIGFtZGdwdV9jdHhfZW50aXR5IGlzIHJlZmNvdW50ZWQK
Pj4+IHRoZXJlIGlzIGEgcHJvYmxlbSBoZXJlIHRoYXQgd2UgZG9uJ3QgaW5jcmVtZW50IGFtZGdw
dV9jdHgucmVmY291bnQgCj4+PiB3aGVuIGFzc2lnbmluZ8KgIHNjaGVkX2VudGl0eQo+Pj4gdG8g
bmV3IHJxIChlLmcuIGJlZm9yZSBkcm1fc2NoZWRfcnFfYWRkX2VudGl0eSkgYW5kIG5vdCBkZWNy
ZW1lbnQgCj4+PiBiZWZvcmUgcmVtb3ZpbmcuIFdlIGRvIGl0IGZvcgo+Pj4gYW1kZ3B1X2NzX3Bh
cnNlci5lbnRpdHkgZm9yIGV4YW1wbGUgKGluIGFtZGdwdV9jc19wYXJzZXJfaW5pdCBhbmQgCj4+
PiBhbWRncHVfY3NfcGFyc2VyX2ZpbmkgYnkKPj4+IGNhbGxpbmcgYW1kZ3B1X2N0eF9nZXQgYW5k
IGFtZGdwdV9jdHhfcHV0KS4gQnV0IHRoaXMgc2VlbXMgYSBiaXQgCj4+PiB0cmlja3kgZHVlIHRv
IGFsbCB0aGUgZHJtX3NjaGVkX2VudGl0eV9zZWxlY3RfcnEKPj4+IGxvZ2ljLgo+Pj4KPj4+IEFu
b3RoZXIsIGtpbmQgb2YgYSBiYW5kIGFpZCBmaXgsIHdvdWxkIHByb2JhYmx5IGJlIGp1c3QgbG9j
a2luZyAKPj4+IGFtZGdwdV9jdHhfbWdyLmxvY2sgYXJvdW5kIGRybV9zY2hlZF9maW5pCj4+PiB3
aGVuIGZpbmFsaXppbmcgdGhlIGZlbmNlIGRyaXZlciBhbmQgYXJvdW5kIGlkciBpdGVyYXRpb24g
aW4gCj4+PiBhbWRncHVfY3R4X21ncl9maW5pICh3aGljaCBzaG91bGQgYmUgbG9jayBwcm90ZWN0
ZWQKPj4+IGFueXdheSBhcyBJIHNlZSBmcm9tIG90aGVyIGlkciB1c2FnZXMgaW4gdGhlIGNvZGUp
IC4uLiBUaGlzIHNob3VsZCAKPj4+IHByZXZlbnQgdGhpcyB1c2UgYWZ0ZXIgZnJlZS4KPj4KPj4g
UHVoLCB0aGF0J3MgcmF0aGVyIGNvbXBsaWNhdGVkIGFzIHdlbGwuIE9rIGxldCdzIGxvb2sgYXQg
aXQgZnJvbSB0aGUgCj4+IG90aGVyIHNpZGUgZm9yIGEgbW9tZW50Lgo+Pgo+PiBXaHkgZG8gd2Ug
aGF2ZSB0byByZW1vdmUgdGhlIGVudGl0aWVzIGZyb20gdGhlIHJxIGluIHRoZSBmaXJzdCBwbGFj
ZT8KPj4KPj4gV291bGRuJ3QgaXQgYmUgc3VmZmljaWVudCB0byBqdXN0IHNldCBhbGwgb2YgdGhl
bSB0byBzdG9wcGVkPwo+Pgo+PiBDaHJpc3RpYW4uCj4KPgo+IEFuZCBhZGRpbmcgaXQgYXMgYW5v
dGhlcsKgIGNvbmRpdGlvbiBpbiBkcm1fc2NoZWRfZW50aXR5X2lzX2lkbGUgPwo+Cj4gQW5kcmV5
Cj4KPgo+Pgo+Pj4KPj4+IEFuZHJleQo+Pj4KPj4+Cj4+Pj4KPj4+Pj4KPj4+Pj4gQW5kcmV5Cj4+
Pj4+Cj4+Pj4+Cj4+Pj4+Cj4+Pj4+Pgo+Pj4+Pj4+ICsKPj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBzcGluX2xvY2soJnJxLT5sb2NrKTsKPj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgfQo+
Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBzcGluX3VubG9jaygmcnEtPmxvY2spOwo+Pj4+Pj4+ICsK
Pj4+Pj4+PiArwqDCoMKgIH0KPj4+Pj4+PiArCj4+Pj4+Pj4gK8KgwqDCoCAvKiBXYWtldXAgZXZl
cnlvbmUgc3R1Y2sgaW4gZHJtX3NjaGVkX2VudGl0eV9mbHVzaCBmb3IgdGhpcyAKPj4+Pj4+PiBz
Y2hlZHVsZXIgKi8KPj4+Pj4+PiArwqDCoMKgIHdha2VfdXBfYWxsKCZzY2hlZC0+am9iX3NjaGVk
dWxlZCk7Cj4+Pj4+Pj4gKwo+Pj4+Pj4+IMKgwqDCoMKgwqAgLyogQ29uZmlybSBubyB3b3JrIGxl
ZnQgYmVoaW5kIGFjY2Vzc2luZyBkZXZpY2Ugc3RydWN0dXJlcyAqLwo+Pj4+Pj4+IGNhbmNlbF9k
ZWxheWVkX3dvcmtfc3luYygmc2NoZWQtPndvcmtfdGRyKTsKPj4+Pj4+Cj4+Pj4KPj4KPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGFtZC1nZnggbWFp
bGluZyBsaXN0Cj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL25hbTEx
LnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZsaXN0
cy5mcmVlZGVza3RvcC5vcmclMkZtYWlsbWFuJTJGbGlzdGluZm8lMkZhbWQtZ2Z4JmFtcDtkYXRh
PTA0JTdDMDElN0NhbmRyZXkuZ3JvZHpvdnNreSU0MGFtZC5jb20lN0NkOTQ4YTEyNmVlYjg0YWJm
M2UxMzA4ZDhkNTk4Y2EyZiU3QzNkZDg5NjFmZTQ4ODRlNjA4ZTExYTgyZDk5NGUxODNkJTdDMCU3
QzAlN0M2Mzc0OTQxOTk1MDExMjE3NjQlN0NVbmtub3duJTdDVFdGcGJHWnNiM2Q4ZXlKV0lqb2lN
QzR3TGpBd01EQWlMQ0pRSWpvaVYybHVNeklpTENKQlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4wJTNE
JTdDMTAwMCZhbXA7c2RhdGE9U0FXamZzRlolMkJUaTZqS1ZjeUp0SUM5cU04RWdHdGhtdDNNblNG
bHhidXQ4JTNEJmFtcDtyZXNlcnZlZD0wIAo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=

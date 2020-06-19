Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E872201B44
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jun 2020 21:30:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D88086E8EF;
	Fri, 19 Jun 2020 19:30:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760078.outbound.protection.outlook.com [40.107.76.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBB7E6E8EF;
 Fri, 19 Jun 2020 19:30:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M3kvAFSPvTSR38BIBIfO1Ku9Z4hvQ3bKjeINWxzFgXu69fxs6eN4s09+bDtDZCTqK8P3WOWmgo4MLPKBCw0W9CEMBjhHTbWpGama9sIIVzg/qe/M5kVKgDEmGDuJL0kVkH1WOO7OHW/N7BsOICB7bSzsm9h0WwhOrKRewbyAqt1kFe/PX/RH7ioXt2vlHllTrQQ9lF+rMmy7RjJx3AoCxpTTAhI/dGOBit7vrwk/uyKOceLvsOaiVGYZgHS9mkewrpxHW5ZXNffRVjCHQZpliUBysAJKUK+PEqyJSb8GImo1Al+nDdSh5RbIA9ne3bg01Qq6op6V1AZJ/lZUdYdCQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jvjLtakuII4qwZT9yWE0Upm0ewz1wEZiQEZgDFPl3rc=;
 b=RknV5sYkiUY0i8CaHV69NqQYSamNbm/xNC1BTMq3JOZFD4mio039iJ9r6tuS2ESzTK/ocT54ZZMwi/XT1GCQTjRno3ZW/j8edkS5XIt+3rmj53Vz+/I8FEwJmG4rWu4cC7VLck7cm/xLm71m8UrSA3SbK/0tY7MEH7NGlZGBG0l/YgvGsCLmkMnJ7ztxmUlzD92rIlzWTPSQxsREEdZcFALvXukTm59vrlf2/SWrlpJu8aP4ZdX7l5cvP6jVgipkCMnfMXV7UNSyTWKCFe7CsdQ4H6l55XblHQTf8Ohkk6Obr8QpJN0H1j/EoDmOtMWP/E1Pc558BunJzzIAsBNDnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jvjLtakuII4qwZT9yWE0Upm0ewz1wEZiQEZgDFPl3rc=;
 b=VMHrdCgpRGybdC1pdU0XNGrzDAmsDcSaFzGwB8A5KTpfWMLCRNvUc6Nyqta+2AmfoLRNOukGKZfv93OGvaSfQmlgaaUyY03tfBn3ROlLA1vovQJllvA3Tq65tuSO/EvnzD6jopPJip5hwJKvVeHy904qC570McFa7HzQ3UjiCJs=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
Received: from SN1PR12MB2414.namprd12.prod.outlook.com (2603:10b6:802:2e::31)
 by SN1PR12MB2512.namprd12.prod.outlook.com (2603:10b6:802:31::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Fri, 19 Jun
 2020 19:30:35 +0000
Received: from SN1PR12MB2414.namprd12.prod.outlook.com
 ([fe80::18d:97b:661f:9314]) by SN1PR12MB2414.namprd12.prod.outlook.com
 ([fe80::18d:97b:661f:9314%7]) with mapi id 15.20.3109.021; Fri, 19 Jun 2020
 19:30:35 +0000
Subject: Re: [Linaro-mm-sig] [PATCH 04/18] dma-fence: prime lockdep annotations
To: Alex Deucher <alexdeucher@gmail.com>, Jerome Glisse <jglisse@redhat.com>
References: <CAKMK7uE7DKUo9Z+yCpY+mW5gmKet8ugbF3yZNyHGqsJ=e-g_hA@mail.gmail.com>
 <20200617152835.GF6578@ziepe.ca> <20200618150051.GS20149@phenom.ffwll.local>
 <20200618172338.GM6578@ziepe.ca>
 <CAKMK7uEbqTu4q-amkLXyd1i8KNtLaoO2ZFoGqYiG6D0m0FKpOg@mail.gmail.com>
 <20200619113934.GN6578@ziepe.ca>
 <CAKMK7uE-kWA==Cko5uenMrcnopEjq42HxoDTDywzBAbHqsN13g@mail.gmail.com>
 <20200619151551.GP6578@ziepe.ca>
 <CAKMK7uEvkshAM6KUYZu8_OCpF4+1Y_SM7cQ9nJWpagfke8s8LA@mail.gmail.com>
 <20200619172308.GQ6578@ziepe.ca> <20200619180935.GA10009@redhat.com>
 <CADnq5_Pw_85Kzh1of=MbDi4g9POeF3jO4AJ7p2FjY5XZW0=vsQ@mail.gmail.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <86f7f5e5-81a0-5429-5a6e-0d3b0860cfae@amd.com>
Date: Fri, 19 Jun 2020 15:30:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <CADnq5_Pw_85Kzh1of=MbDi4g9POeF3jO4AJ7p2FjY5XZW0=vsQ@mail.gmail.com>
Content-Language: en-US
X-ClientProxiedBy: YTXPR0101CA0002.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::15) To SN1PR12MB2414.namprd12.prod.outlook.com
 (2603:10b6:802:2e::31)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.116.63.128) by
 YTXPR0101CA0002.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3109.21 via Frontend Transport; Fri, 19 Jun 2020 19:30:33 +0000
X-Originating-IP: [142.116.63.128]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d87c7a3a-4337-43dc-9853-08d814873cdd
X-MS-TrafficTypeDiagnostic: SN1PR12MB2512:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN1PR12MB2512DBA209E7BE4311ADF81192980@SN1PR12MB2512.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 0439571D1D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xZz4cPf0E+IOuBmkCQ3S++fNyziA9Pq64W9G4wYDGTrNX7T/E+jlwmmTcuxdeABWMPlEioKTQu8PixCjZNnrotvglcqpVmJtZvr9EENsd6AzGjKAGz5qAklmRwdWo9/37L6KLYXdBZjdMnFndNa6Bi4/u+Ux8aUEjFmdGgbDPcu7G6YCHeTKwSsn69YxaSd6a3dspXtOMbEfqNvq3Ay9/r+Wffb55V8sxYvuOUIoZjEZBUb7WB37NFUrYhT8eY/ELVcycPH51rpIozwQAbsbNi1S9bv+qpGMATO6lVAdClMmT1cmAhL3rWixHNpwzBwqgFvMTytjbMohgLVzpguluCZI7KF1g0i0i2l83B8DKLmjwgz61uyWmP3l12x6RGvIPUpc5GtTnqVMF66xS5q9p4QF4zVo9RhNLB8ojAyCAvU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN1PR12MB2414.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(39860400002)(396003)(136003)(366004)(346002)(66946007)(66476007)(66556008)(52116002)(26005)(186003)(16526019)(83380400001)(316002)(16576012)(54906003)(44832011)(956004)(2616005)(86362001)(31696002)(66574015)(53546011)(31686004)(478600001)(8936002)(7416002)(36756003)(6486002)(8676002)(110136005)(2906002)(5660300002)(4326008)(966005)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 4jHeby2L7xpwW+2kztpdjD5Lp4yauBWGp68OfHn0TTG4071baxB0HW90ItqNnRquY141cw5qp3MI9JbfGm/PcHJcPyEqYIphB1N0nbzIo7+S8N+l3OErtyZpLSNv4Ee6rN4PPFE5JBo/1Xuw/byNW6whFt+3w8K5ieBxj31Pb52BssqS6tLyavIA6LzpxIFeZYknDHV8yOGWOCOOtrcIJSizT6GpzGdBfDZtbt5jlpu+/6pcHmbfJlzb4qkoc53puEIAhXvT6DaToD0dOh+j7bcUo1ANbIelh4gIglGWwmj8eLAMo4xqJe/hxL5kdjF5rFSjMx6b2Nmms0/kp4hQWYYgEq1zDmhvppCUGcFXEVC5xvZSMIbJfhVg6ykTRe+17yCtZd7WHJUSp0YQW0L02DJ04t+rkvta6xjQhcqGgrSM7q7GjXSpnUsIrz9hBydpkNJZ0iAiMBI7nKgWGavhI6jRcbgET9eEiToHpEjppI7NDRplW3lDF0XNDQv6lgR9
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d87c7a3a-4337-43dc-9853-08d814873cdd
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2020 19:30:34.9849 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dtUIWjKt+9EwCo8J2gmm4KOpNCDOW2qykHmmrL2/MJZbcomdAIzbTYeHrm96Q6VXbMSHzqgKJwvqUPtnO00t0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2512
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
Cc: linux-rdma <linux-rdma@vger.kernel.org>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Thomas Hellstrom <thomas.hellstrom@intel.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CkFtIDIwMjAtMDYtMTkgdW0gMzoxMSBwLm0uIHNjaHJpZWIgQWxleCBEZXVjaGVyOgo+IE9uIEZy
aSwgSnVuIDE5LCAyMDIwIGF0IDI6MDkgUE0gSmVyb21lIEdsaXNzZSA8amdsaXNzZUByZWRoYXQu
Y29tPiB3cm90ZToKPj4gT24gRnJpLCBKdW4gMTksIDIwMjAgYXQgMDI6MjM6MDhQTSAtMDMwMCwg
SmFzb24gR3VudGhvcnBlIHdyb3RlOgo+Pj4gT24gRnJpLCBKdW4gMTksIDIwMjAgYXQgMDY6MTk6
NDFQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3cm90ZToKPj4+Cj4+Pj4gVGhlIG1hZG5lc3MgaXMg
b25seSB0aGF0IGRldmljZSBCJ3MgbW11IG5vdGlmaWVyIG1pZ2h0IG5lZWQgdG8gd2FpdAo+Pj4+
IGZvciBmZW5jZV9CIHNvIHRoYXQgdGhlIGRtYSBvcGVyYXRpb24gZmluaXNoZXMuIFdoaWNoIGlu
IHR1cm4gaGFzIHRvCj4+Pj4gd2FpdCBmb3IgZGV2aWNlIEEgdG8gZmluaXNoIGZpcnN0Lgo+Pj4g
U28sIGl0IHNvdW5kLCBmdW5kYW1lbnRhbGx5IHlvdSd2ZSBnb3QgdGhpcyBncmFwaCBvZiBvcGVy
YXRpb25zIGFjcm9zcwo+Pj4gYW4gdW5rbm93biBzZXQgb2YgZHJpdmVycyBhbmQgdGhlIGtlcm5l
bCBjYW5ub3QgaW5zZXJ0IGl0c2VsZiBpbgo+Pj4gZG1hX2ZlbmNlIGhhbmQgb2ZmcyB0byByZS12
YWxpZGF0ZSBhbnkgb2YgdGhlIGJ1ZmZlcnMgaW52b2x2ZWQ/Cj4+PiBCdWZmZXJzIHdoaWNoIGJ5
IGRlZmluaXRpb24gY2Fubm90IGJlIHRvdWNoZWQgYnkgdGhlIGhhcmR3YXJlIHlldC4KPj4+Cj4+
PiBUaGF0IHJlYWxseSBpcyBhIHByZXR0eSBob3JyaWJsZSBwbGFjZSB0byBlbmQgdXAuLgo+Pj4K
Pj4+IFBpbm5pbmcgcmVhbGx5IGlzIHJpZ2h0IGFuc3dlciBmb3IgdGhpcyBraW5kIG9mIHdvcmsg
Zmxvdy4gSSB0aGluawo+Pj4gY29udmVydGluZyBwaW5uaW5nIHRvIG5vdGlmZXJzIHNob3VsZCBu
b3QgYmUgZG9uZSB1bmxlc3Mgbm90aWZpZXIKPj4+IGludmFsaWRhdGlvbiBpcyByZWxhdGl2ZWx5
IGJvdW5kZWQuCj4+Pgo+Pj4gSSBrbm93IHBlb3BsZSBsaWtlIG5vdGlmaWVycyBiZWNhdXNlIHRo
ZXkgZ2l2ZSBhIGJpdCBuaWNlciBwZXJmb3JtYW5jZQo+Pj4gaW4gc29tZSBoYXBweSBjYXNlcywg
YnV0IHRoaXMgY3JpcHBsZXMgYWxsIHRoZSBiYWQgY2FzZXMuLgo+Pj4KPj4+IElmIHBpbm5pbmcg
ZG9lc24ndCB3b3JrIGZvciBzb21lIHJlYXNvbiBtYXliZSB3ZSBzaG91bGQgYWRkcmVzcyB0aGF0
Pwo+PiBOb3RlIHRoYXQgdGhlIGRtYSBmZW5jZSBpcyBvbmx5IHRydWUgZm9yIHVzZXIgcHRyIGJ1
ZmZlciB3aGljaCBwcmVkYXRlCj4+IGFueSBITU0gd29yayBhbmQgdGh1cyB3ZXJlIHVzaW5nIG1t
dSBub3RpZmllciBhbHJlYWR5LiBZb3UgbmVlZCB0aGUKPj4gbW11IG5vdGlmaWVyIHRoZXJlIGJl
Y2F1c2Ugb2YgZm9yayBhbmQgb3RoZXIgY29ybmVyIGNhc2VzLgo+Pgo+PiBGb3Igbm91dmVhdSB0
aGUgbm90aWZpZXIgZG8gbm90IG5lZWQgdG8gd2FpdCBmb3IgYW55dGhpbmcgaXQgY2FuIHVwZGF0
ZQo+PiB0aGUgR1BVIHBhZ2UgdGFibGUgcmlnaHQgYXdheS4gTW9kdWxvIG5lZWRpbmcgdG8gd3Jp
dGUgdG8gR1BVIG1lbW9yeQo+PiB1c2luZyBkbWEgZW5naW5lIGlmIHRoZSBHUFUgcGFnZSB0YWJs
ZSBpcyBpbiBHUFUgbWVtb3J5IHRoYXQgaXMgbm90Cj4+IGFjY2Vzc2libGUgZnJvbSB0aGUgQ1BV
IGJ1dCB0aGF0J3MgbmV2ZXIgdGhlIGNhc2UgZm9yIG5vdXZlYXUgc28gZmFyCj4+IChidXQgaSBl
eHBlY3QgaXQgd2lsbCBiZSBhdCBvbmUgcG9pbnQpLgo+Pgo+Pgo+PiBTbyBpIHNlZSB0aGlzIGFz
IDIgZGlmZmVyZW50IGNhc2VzLCB0aGUgdXNlciBwdHIgY2FzZSwgd2hpY2ggZG9lcyBwaW4KPj4g
cGFnZXMgYnkgdGhlIHdheSwgd2hlcmUgdGhpbmdzIGFyZSBzeW5jaHJvbm91cy4gVmVyc3VzIHRo
ZSBITU0gY2FzZXMKPj4gd2hlcmUgZXZlcnl0aGluZyBpcyBhc3luY2hyb25vdXMuCj4+Cj4+Cj4+
IEkgcHJvYmFibHkgbmVlZCB0byB3YXJuIEFNRCBmb2xrcyBhZ2FpbiB0aGF0IHVzaW5nIEhNTSBt
ZWFucyB0aGF0IHlvdQo+PiBtdXN0IGJlIGFibGUgdG8gdXBkYXRlIHRoZSBHUFUgcGFnZSB0YWJs
ZSBhc3luY2hyb25vdXNseSB3aXRob3V0Cj4+IGZlbmNlIHdhaXQuIFRoZSBpc3N1ZSBmb3IgQU1E
IGlzIHRoYXQgdGhleSBhbHJlYWR5IHVwZGF0ZSB0aGVpciBHUFUKPj4gcGFnZSB0YWJsZSB1c2lu
ZyBETUEgZW5naW5lLiBJIGJlbGlldmUgdGhpcyBpcyBzdGlsbCBkb2FibGUgaWYgdGhleQo+PiB1
c2UgYSBrZXJuZWwgb25seSBETUEgZW5naW5lIGNvbnRleHQsIHdoZXJlIG9ubHkga2VybmVsIGNh
biBxdWV1ZSB1cAo+PiBqb2JzIHNvIHRoYXQgeW91IGRvIG5vdCBuZWVkIHRvIHdhaXQgZm9yIHVu
cmVsYXRlZCB0aGluZ3MgYW5kIHlvdSBjYW4KPj4gcHJpb3JpdGl6ZSBHUFUgcGFnZSB0YWJsZSB1
cGRhdGUgd2hpY2ggc2hvdWxkIHRyYW5zbGF0ZSBpbiBmYXN0IEdQVQo+PiBwYWdlIHRhYmxlIHVw
ZGF0ZSB3aXRob3V0IERNQSBmZW5jZS4KPiBBbGwgZGV2aWNlcyB3aGljaCBzdXBwb3J0IHJlY292
ZXJhYmxlIHBhZ2UgZmF1bHRzIGFsc28gaGF2ZSBhCj4gZGVkaWNhdGVkIHBhZ2luZyBlbmdpbmUg
Zm9yIHRoZSBrZXJuZWwgZHJpdmVyIHdoaWNoIHRoZSBkcml2ZXIgYWxyZWFkeQo+IG1ha2VzIHVz
ZSBvZi4gIFdlIGNhbiBhbHNvIHVwZGF0ZSB0aGUgR1BVIHBhZ2UgdGFibGVzIHdpdGggdGhlIENQ
VS4KCldlIGhhdmUgYSBwb3RlbnRpYWwgcHJvYmxlbSB3aXRoIENQVSB1cGRhdGluZyBwYWdlIHRh
YmxlcyB3aGlsZSB0aGUgR1BVCmlzIHJldHJ5aW5nIG9uIHBhZ2UgdGFibGUgZW50cmllcyBiZWNh
dXNlIDY0IGJpdCBDUFUgdHJhbnNhY3Rpb25zIGRvbid0CmFycml2ZSBpbiBkZXZpY2UgbWVtb3J5
IGF0b21pY2FsbHkuCgpXZSBhcmUgdXNpbmcgU0RNQSBmb3IgcGFnZSB0YWJsZSB1cGRhdGVzLiBU
aGlzIGN1cnJlbnRseSBnb2VzIHRocm91Z2ggYQp0aGUgRFJNIEdQVSBzY2hlZHVsZXIgdG8gYSBz
cGVjaWFsIFNETUEgcXVldWUgdGhhdCdzIHVzZWQgYnkga2VybmVsLW1vZGUKb25seS4gQnV0IHNp
bmNlIGl0J3MgYmFzZWQgb24gdGhlIERSTSBHUFUgc2NoZWR1bGVyLCB3ZSBkbyB1c2UgZG1hLWZl
bmNlCnRvIHdhaXQgZm9yIGNvbXBsZXRpb24uCgpSZWdhcmRzLArCoCBGZWxpeAoKCj4KPiBBbGV4
Cj4KPj4KPj4+PiBGdWxsIGRpc2Nsb3N1cmU6IFdlIGFyZSBhd2FyZSB0aGF0IHdlJ3ZlIGRlc2ln
bmVkIG91cnNlbHZlcyBpbnRvIGFuCj4+Pj4gaW1wcmVzc2l2ZSBjb3JuZXIgaGVyZSwgYW5kIHRo
ZXJlJ3MgbG90cyBvZiB0YWxrcyBnb2luZyBvbiBhYm91dAo+Pj4+IHVudGFuZ2xpbmcgdGhlIGRt
YSBzeW5jaHJvbml6YXRpb24gZnJvbSB0aGUgbWVtb3J5IG1hbmFnZW1lbnQKPj4+PiBjb21wbGV0
ZWx5LiBCdXQKPj4+IEkgdGhpbmsgdGhlIGRvY3VtZW50aW5nIGlzIHJlYWxseSBpbXBvcnRhbnQ6
IG9ubHkgR1BVIHNob3VsZCBiZSB1c2luZwo+Pj4gdGhpcyBzdHVmZiBhbmQgZHJpdmluZyBub3Rp
ZmllcnMgdGhpcyB3YXkuIENvbXBsZXRlIE5PIGZvciBhbnkKPj4+IHRvdGFsbHktbm90LWEtR1BV
IHRoaW5ncyBpbiBkcml2ZXJzL2FjY2VsIGZvciBzdXJlLgo+PiBZZXMgZm9yIHVzZXIgdGhhdCBl
eHBlY3QgSE1NIHRoZXkgbmVlZCB0byBiZSBhc3luY2hyb25vdXMuIEJ1dCBpdCBpcwo+PiBoYXJk
IHRvIHJldmVydCB1c2VyIHB0ciBoYXMgaXQgd2FzIGRvbmUgYSBsb25nIHRpbWUgYWdvLgo+Pgo+
PiBDaGVlcnMsCj4+IErDqXLDtG1lCj4+Cj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4+IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4+IGFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCj4+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPiBhbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

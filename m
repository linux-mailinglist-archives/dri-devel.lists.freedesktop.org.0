Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5192229A35
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jul 2020 16:36:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ACC189ECB;
	Wed, 22 Jul 2020 14:35:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E80289B95;
 Wed, 22 Jul 2020 14:35:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pg1vV1CqXP2yNw9ydQFeKkkM0sDtRaahPom6OdMuoSwcpFir/cL+etVfEkFztIwRY+pdd3q1s6OZygk2movIWm9zI6/r+ah4bkp72q09W67WbaLEhNNfY6vPqqxCgfhi+Fi7Nl8F3a6DjiVVDlgLgn6gMym78NlEXer0SeBWn1/CU2iRrG8wHHw3QP+vXCRt6iLLGK1Rh7D/GvlCsOaE4Xp8VJQELeQrdOJ8tnp+3IMwdtwWycIJPSrFAtkDIFsn62d73Qjv1xE4vjejNAIJ7dg3uZXSTx/6o7+mq/q4cwmPqtZOySn4TXRgY/Su+zThfbx3XT79O8lRdT5VP4U4oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z5ki77Mr37d5Njfng6N04EA0iYbJN4PLETxakjBX3sE=;
 b=MZh4Oku+wd4TQJrgBIDifrjqRUrV0XyaErVapEX5Ci3nzqVUjV4PssLy1yeAc3SZDL/1ZSVxefn6ewZRSEkZzP3a0D2ztrZvvuTacPT1ZHLL25aD8IdkA9lCB93ocQQ4siToF8JlPJGcaF47GGCk4XdkKMW2WWdkp1CRFwWPeg6C461PyebIBcUyjKOwZfAABPHwDm2K+JQhtv51B71jWWsEAW2Cd+HXjEUwVUjWkLVzuFNj+DBuL3pMmBUjCrsBeKI5WDRw71CkWIaIivY5toCCTz4c/EzMQ32vU7GeJbyk4PQ5XPMzPjwNjLRvgrg6TrmK12OzKrpmTjk3BrFeqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z5ki77Mr37d5Njfng6N04EA0iYbJN4PLETxakjBX3sE=;
 b=otkvzPDg2zASvrIK3yni+Fdu937SHlPBxskdv837bSEO4hr+G3hMKvWE+HDEEIZijtwIMRPBTtSJSxmpq6Uzu4uvgPkMEg82tIz6Wre1mUO2IujcPyg5OZY80StV82Kcc6jTT6CYmVaYIK5OOUl7asPW2yahcVVs81vkztJBj7E=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3904.namprd12.prod.outlook.com (2603:10b6:208:165::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.22; Wed, 22 Jul
 2020 14:35:52 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3216.021; Wed, 22 Jul 2020
 14:35:52 +0000
Subject: Re: [Linaro-mm-sig] [PATCH 1/2] dma-buf.rst: Document why indefinite
 fences are a bad idea
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20200707201229.472834-4-daniel.vetter@ffwll.ch>
 <20200721074157.GB3278063@phenom.ffwll.local>
 <3603bb71-318b-eb53-0532-9daab62dce86@amd.com>
 <57a5eb9d-b74f-8ce4-7199-94e911d9b68b@shipmail.org>
 <CAPM=9twUWeenf-26GEvkuKo3wHgS3BCyrva=sNaWo6+=A5qdoQ@mail.gmail.com>
 <805c49b7-f0b3-45dc-5fe3-b352f0971527@shipmail.org>
 <CAKMK7uHhhxBC2MvnNnU9FjxJaWkEcP3m5m7AN3yzfw=wxFsckA@mail.gmail.com>
 <92393d26-d863-aac6-6d27-53cad6854e13@shipmail.org>
 <CAKMK7uF8jpyuCF8uUbEeJUedErxqRGa8JY+RuURg7H1XXWXzkw@mail.gmail.com>
 <8fd999f2-cbf6-813c-6ad4-131948fb5cc5@shipmail.org>
 <CAKMK7uH0rcyepP2hDpNB-yuvNyjee1tPmxWUyefS5j7i-N6Pfw@mail.gmail.com>
 <df5414f5-ac5c-d212-500c-b05c7c78ce84@shipmail.org>
 <CAKMK7uF27SifuvMatuP2kJPTf+LVmVbG098cE2cqorYYo7UHkw@mail.gmail.com>
 <697d1b5e-5d1c-1655-23f8-7a3f652606f3@shipmail.org>
 <CAKMK7uGSkgdJyyvGe8SF_vWfgyaCWn5p0GvZZdLvkxmrS6tYbQ@mail.gmail.com>
 <c742c557-f48f-1591-1d1d-a5181b408a67@gmail.com>
 <a046ea93-b303-17d4-add4-efd0a709cfd2@shipmail.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <e3112430-9533-ef75-cbd8-31814893210c@amd.com>
Date: Wed, 22 Jul 2020 16:35:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <a046ea93-b303-17d4-add4-efd0a709cfd2@shipmail.org>
Content-Language: en-US
X-ClientProxiedBy: AM4PR0501CA0066.eurprd05.prod.outlook.com
 (2603:10a6:200:68::34) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4PR0501CA0066.eurprd05.prod.outlook.com (2603:10a6:200:68::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.20 via Frontend
 Transport; Wed, 22 Jul 2020 14:35:49 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a062cc6d-8ed7-403c-ffa6-08d82e4c887a
X-MS-TrafficTypeDiagnostic: MN2PR12MB3904:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB39040017DDFC959A6241494183790@MN2PR12MB3904.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ++X2WpuwNZ2gd0fzED4LamcA8kL59xXw0xKyQVV7urgVc0o7VKvHK12OpyXNvCzNjR35AJwl7Ws3utT5+TaDmzmHeNgdTFQzTKMeeutmTHnAJZhb0qtkeV/aKphnYY/SjOv4h0c6aydGt0s+lzu4lDysNop5MGWbu6FBUMEYk4udo0ReErYlnoZUqoN3P4jmVMfwdws2LK/WU/ChX9wV5X8uvbsnAZXyS9KwkR3eB05i0/L/+1EBzihCYOe9KKcKZNrKimBOFbYxCGw5F0fTU87euo2J9cZeSTy7psXsj7x1mEcN+B269XW2MByEhbh72B/qsVvZ+lx8KhnfKOd2EUZ10eLa/ijZdJNfsc3ekVbHUHChDPlEVa9KcnZz/LoWakKeOkSb89WvSolNraPytoKfRw0J/Gkse8FkmAvw9R+bOOHzlRevX5N3Hrfqcf9dxNYCbzokqzNCYb/Z9shwxg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(136003)(366004)(346002)(396003)(39860400002)(66556008)(66946007)(66476007)(52116002)(31686004)(8936002)(110136005)(8676002)(6486002)(2906002)(6666004)(186003)(54906003)(86362001)(31696002)(16526019)(316002)(53546011)(478600001)(45080400002)(5660300002)(7416002)(4326008)(36756003)(66574015)(83080400001)(2616005)(83380400001)(966005)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: tW/EPpdNbYGU2v1302xgJRqwhlLJ9oDWezWais9esNAEqrfmOwXwyJ1WvlBRmulm9VR7TzozHNq9ERRuo88XPLz8OcRVgFaYGff6ULVfXDGhcPUj0rjrhdmHrA7XUnTWEwkvpBUigGWzm9do7+bL+4EizzKHUdLMIQYuDBaphSpYxSgg8xqCGpVh6un11pLSu/g5bpEQUb+UgXBdzSj/dTYrO1V/D7fyBPpcb5OnjqAf5fnEQaKgjE/3WG2qL1OSDU4j9shFSaAxwxpghrk5FMdEbZtMhfE2/lB0DG3X40j6qFoTOAzTTSCQqV5cacLAAC3F33BS+x8VkZ2ujBmQOLob35N1+UvOULKg3CrEMiRDQ0glUY+AMP/E3467AHWrjN/HHKRbfH5sfqahK61YbwQSPSsaHgKVEW911PCKGclrxKOmczm6qi7nSiOgsbcstxGLD1FnDE7ZuvwBrtwc7kCq0kpAlFHDelSE0k+vMDkGmi7QFrKvqwcss4VlQWe5a6X83XAucGUDOciUrVZBhSJd/Qw6/9GwPs/O1wA/WM0T4BpjvKyKz2IbwMgnVaX6
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a062cc6d-8ed7-403c-ffa6-08d82e4c887a
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2020 14:35:52.3764 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h3BYahg24isfh8V7XFHl1HgHr2ifES9hi2UGvcvxwWc7wBVfnHYe0E3xu+fSznLy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3904
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
Cc: Daniel Stone <daniels@collabora.com>,
 linux-rdma <linux-rdma@vger.kernel.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Steve Pronovost <spronovo@microsoft.com>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>, Jesse Natalie <jenatali@microsoft.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjIuMDcuMjAgdW0gMTY6MzAgc2NocmllYiBUaG9tYXMgSGVsbHN0csO2bSAoSW50ZWwpOgo+
Cj4gT24gMjAyMC0wNy0yMiAxNjoyMywgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4gQW0gMjIu
MDcuMjAgdW0gMTY6MDcgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+Pj4gT24gV2VkLCBKdWwgMjIs
IDIwMjAgYXQgMzoxMiBQTSBUaG9tYXMgSGVsbHN0csO2bSAoSW50ZWwpCj4+PiA8dGhvbWFzX29z
QHNoaXBtYWlsLm9yZz4gd3JvdGU6Cj4+Pj4gT24gMjAyMC0wNy0yMiAxNDo0MSwgRGFuaWVsIFZl
dHRlciB3cm90ZToKPj4+Pj4gSSdtIHByZXR0eSBzdXJlIHRoZXJlJ3MgbW9yZSBidWdzLCBJIGp1
c3QgaGF2ZW4ndCBoZWFyZCBmcm9tIHRoZW0gCj4+Pj4+IHlldC4KPj4+Pj4gQWxzbyBkdWUgdG8g
dGhlIG9wdC1pbiBuYXR1cmUgb2YgZG1hLWZlbmNlIHdlIGNhbiBsaW1pdCB0aGUgc2NvcGUgb2YK
Pj4+Pj4gd2hhdCB3ZSBmaXggZmFpcmx5IG5hdHVyYWxseSwganVzdCBkb24ndCBwdXQgdGhlbSB3
aGVyZSBubyBvbmUgY2FyZXMKPj4+Pj4gOi0pIE9mIGNvdXJzZSB0aGF0IGFsc28gaGlkZXMgZ2Vu
ZXJhbCBsb2NraW5nIGlzc3VlcyBpbiBkbWFfZmVuY2UKPj4+Pj4gc2lnbmFsbGluZyBjb2RlLCBi
dXQgd2VsbCAqc2hydWcqLgo+Pj4+IEhtbSwgeWVzLiBBbm90aGVyIHBvdGVudGlhbCBiaWcgcHJv
YmxlbSB3b3VsZCBiZSBkcml2ZXJzIHRoYXQgd2FudCB0bwo+Pj4+IHVzZSBncHUgcGFnZSBmYXVs
dHMgaW4gdGhlIGRtYS1mZW5jZSBjcml0aWNhbCBzZWN0aW9ucyB3aXRoIHRoZQo+Pj4+IGJhdGNo
LWJhc2VkIHByb2dyYW1taW5nIG1vZGVsLgo+Pj4gWWVhaCB0aGF0J3MgYSBtYXNzaXZlIGNhbiBv
ZiB3b3Jtcy4gQnV0IGx1Y2tpbHkgdGhlcmUncyBubyBzdWNoIGRyaXZlcgo+Pj4gbWVyZ2VkIGlu
IHVwc3RyZWFtLCBzbyBob3BlZnVsbHkgd2UgY2FuIHRoaW5rIGFib3V0IGFsbCB0aGUKPj4+IGNv
bnN0cmFpbnRzIGFuZCBob3cgdG8gYmVzdCBhbm5vdGF0ZSZlbmZvcmNlIHRoaXMgYmVmb3JlIHdl
IGxhbmQgYW55Cj4+PiBjb2RlIGFuZCBoYXZlIGJpZyByZWdyZXRzLgo+Pgo+PiBEbyB5b3Ugd2Fu
dCBhIGJhZCBuZXdzPyBJIG9uY2UgbWFkZSBhIHByb3RvdHlwZSBmb3IgdGhhdCB3aGVuIFZlZ2Ex
MCAKPj4gY2FtZSBvdXQuCj4+Cj4+IEJ1dCB3ZSBhYmFuZG9uZWQgdGhpcyBhcHByb2FjaCBmb3Ig
dGhlIHRoZSBiYXRjaCBiYXNlZCBhcHByb2FjaCAKPj4gYmVjYXVzZSBvZiB0aGUgaG9ycmlibGUg
cGVyZm9ybWFuY2UuCj4KPiBJbiBjb250ZXh0IG9mIHRoZSBwcmV2aW91cyBkaXNjdXNzaW9uIEkn
ZCBjb25zaWRlciB0aGUgZmFjdCB0aGF0IGl0J3MgCj4gbm90IHBlcmZvcm1hbnQgaW4gdGhlIGJh
dGNoLWJhc2VkIG1vZGVsIGdvb2QgbmV3cyA6KQoKV2VsbCB0aGUgVmVnYTEwIGhhZCBzdWNoIGEg
aG9ycmlibGUgcGFnZSBmYXVsdCBwZXJmb3JtYW5jZSBiZWNhdXNlIGl0IAp3YXMgdGhlIGZpcnN0
IGdlbmVyYXRpb24gd2hpY2ggZW5hYmxlZCBpdC4KCkxhdGVyIGhhcmR3YXJlIHZlcnNpb25zIGFy
ZSBtdWNoIGJldHRlciwgYnV0IHdlIGp1c3QgZGlkbid0IHB1c2ggZm9yIAp0aGlzIGZlYXR1cmUg
b24gdGhlbSBhbnkgbW9yZS4KCkJ1dCB5ZWFoLCBub3cgeW91IG1lbnRpb25lZCBpdCB3ZSBkaWQg
ZGlzY3VzcyB0aGlzIGxvY2tpbmcgcHJvYmxlbSBvbiAKdG9ucyBvZiB0ZWFtIGNhbGxzIGFzIHdl
bGwuCgpPdXIgc29sdXRpb24gYXQgdGhhdCB0aW1lIHdhcyB0byBqdXN0IG5vdCBhbGxvdyB3YWl0
aW5nIGlmIHdlIGRvIGFueSAKYWxsb2NhdGlvbiBpbiB0aGUgcGFnZSBmYXVsdCBoYW5kbGVyLiBC
dXQgdGhpcyBpcyBvZiBjb3Vyc2Ugbm90IApwcmFjdGljYWwgZm9yIGEgcHJvZHVjdGlvbiBlbnZp
cm9ubWVudC4KCkNocmlzdGlhbi4KCj4KPiBUaG9tYXMKPgo+Cj4+Cj4+IEtGRCBpcyBnb2luZyB0
byBzZWUgdGhhdCwgYnV0IHRoaXMgaXMgb25seSB3aXRoIHVzZXIgcXVldWVzIGFuZCBubyAKPj4g
ZG1hX2ZlbmNlIGludm9sdmVkIHdoYXRzb2V2ZXIuCj4+Cj4+IENocmlzdGlhbi4KPj4KPj4+IC1E
YW5pZWwKPj4+Cj4+Pgo+Pj4KPj4+IC0tIAo+Pj4gRGFuaWVsIFZldHRlcgo+Pj4gU29mdHdhcmUg
RW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCj4+PiBodHRwczovL25hbTExLnNhZmVsaW5rcy5w
cm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cCUzQSUyRiUyRmJsb2cuZmZ3bGwuY2glMkYm
YW1wO2RhdGE9MDIlN0MwMSU3Q2NocmlzdGlhbi5rb2VuaWclNDBhbWQuY29tJTdDNjU4MzZkNDYz
YzZhNDM0MjVhMGIwOGQ4MmU0YmMwOWUlN0MzZGQ4OTYxZmU0ODg0ZTYwOGUxMWE4MmQ5OTRlMTgz
ZCU3QzAlN0MwJTdDNjM3MzEwMjUwMjAzMzQ0OTQ2JmFtcDtzZGF0YT1GOExaRW5zTU9KTGVDM1Ny
JTJCUG4ySGpHSGx0dGRrVlVpT3pXN21ZZWlqeXMlM0QmYW1wO3Jlc2VydmVkPTAgCj4+Pgo+Pj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4+IGFtZC1n
ZnggbWFpbGluZyBsaXN0Cj4+PiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+Pj4gaHR0
cHM6Ly9uYW0xMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNB
JTJGJTJGbGlzdHMuZnJlZWRlc2t0b3Aub3JnJTJGbWFpbG1hbiUyRmxpc3RpbmZvJTJGYW1kLWdm
eCZhbXA7ZGF0YT0wMiU3QzAxJTdDY2hyaXN0aWFuLmtvZW5pZyU0MGFtZC5jb20lN0M2NTgzNmQ0
NjNjNmE0MzQyNWEwYjA4ZDgyZTRiYzA5ZSU3QzNkZDg5NjFmZTQ4ODRlNjA4ZTExYTgyZDk5NGUx
ODNkJTdDMCU3QzAlN0M2MzczMTAyNTAyMDMzNDQ5NDYmYW1wO3NkYXRhPVYzRnNmYWhLNjM0NCUy
Rlh1anRMQSUyQmF6V1YwWGpLV0RYRldPYlJXYzFKVUtzJTNEJmFtcDtyZXNlcnZlZD0wIAo+Pj4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=

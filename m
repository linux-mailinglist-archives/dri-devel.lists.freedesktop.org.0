Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7974F135693
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2020 11:15:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EF9F89C2C;
	Thu,  9 Jan 2020 10:15:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2077.outbound.protection.outlook.com [40.107.92.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ED1189C2C;
 Thu,  9 Jan 2020 10:15:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H+e3p28+WVHci44bvpHJhQdor9Ty/qIJvf+qo+x9Yg9H5f9wCZOrw7+c5PTx0i8coBH8hGuqA9Klf8mxJoYRFVQaDoncTAujcFxo86HdmTz6E/U7wKsqgYzcD3bHVhVclX3AgoHzIqTFMkpyfjbjiqa/SLtBupAyw7CXxAGbjkovV7Du76i/rWjMKJo7LBjzLkMGY9SDKuChTZr6C+Cjozh7csQNmxE8yoHW6Tof+oYfnXpWsSwkfBbQEBBZTIiTDtgO3GHyCtpId1NaqihvRWS6eUX/iL7OLKay2jvzcQC+fs8bhhXiDjgUv6FQ858HK5OTLrVhJJm1qmc/fK/Y7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZufGPYmcOmszYCmgdpWsaFPzjSAvVqnk7hN6BpWaBcQ=;
 b=B5ymCSlfThSnH95dc0zgbRE8LCHDKIYbzojWBm6T1ORFHYeFZFY13wWWDvSWjxaasc1MNPIOOrehExtcApWUrdJ+IfeSeqv+siNG2T/sq5OS6IKuwAIkBMqRiLlauL4y3nr8rWfBDndwUB5ziSTWkIZLA5TQB8d8Kp4PquyYa17TVuwPSekvQFBh7QSaOydMl88uenNxTyVJZ2yjV8NyJL+d68bAmNtiATY9Nr2z9E4oLhn0POL4sexFVnqSIarRpe8r4X89lRl97lCF2LwIjeCW8ar2ru9lJkYocQIqpyx7NYsZTSsVP+lHgK4m77yHJwtzpsmekIXjRJPpyde8FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZufGPYmcOmszYCmgdpWsaFPzjSAvVqnk7hN6BpWaBcQ=;
 b=PX7nYBXXoXytJqJUES1UwWgQueqXgvMXWf1FG5dY095G5R3OAAqHdo8Eq5BqquCCywYxfZq36jG2mt/nyTKAtO1Ni5gYd/1q73huLwhsTK/p5ClRcU1IkiSs2+LyUPatCtNw0sQ2nau7nU0IDJuwR4Bh5phHEYBriXts3KYrniE=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from BN6PR12MB1699.namprd12.prod.outlook.com (10.175.97.148) by
 BN6PR12MB1314.namprd12.prod.outlook.com (10.168.228.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.11; Thu, 9 Jan 2020 10:15:17 +0000
Received: from BN6PR12MB1699.namprd12.prod.outlook.com
 ([fe80::2cac:fcd3:c947:5813]) by BN6PR12MB1699.namprd12.prod.outlook.com
 ([fe80::2cac:fcd3:c947:5813%8]) with mapi id 15.20.2623.008; Thu, 9 Jan 2020
 10:15:17 +0000
Subject: Re: [PATCH 0/2] drm/radeon: have the callers of set_memory_*() check
 the return value
To: Alex Deucher <alexdeucher@gmail.com>, Kees Cook <keescook@chromium.org>
References: <20200107192555.20606-1-tli@digitalocean.com>
 <b5984995-7276-97d3-a604-ddacfb89bd89@amd.com>
 <202001080936.A36005F1@keescook>
 <CADnq5_NLS=CuHD39utCTnTVsY_izuTPXFfsew6TpMjovgFoT5g@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <a2919283-f5aa-43b2-9186-6c41315458c4@amd.com>
Date: Thu, 9 Jan 2020 11:15:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <CADnq5_NLS=CuHD39utCTnTVsY_izuTPXFfsew6TpMjovgFoT5g@mail.gmail.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR10CA0052.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::32) To BN6PR12MB1699.namprd12.prod.outlook.com
 (2603:10b6:404:ff::20)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR10CA0052.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2623.9 via Frontend
 Transport; Thu, 9 Jan 2020 10:15:14 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3be78018-8481-4f29-b86b-08d794ecd31d
X-MS-TrafficTypeDiagnostic: BN6PR12MB1314:|BN6PR12MB1314:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN6PR12MB1314412E1CAB5A06082F898983390@BN6PR12MB1314.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 02778BF158
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(136003)(396003)(366004)(376002)(199004)(189003)(86362001)(66574012)(8676002)(53546011)(6666004)(31686004)(4326008)(66476007)(66556008)(66946007)(81156014)(52116002)(5660300002)(8936002)(36756003)(81166006)(16526019)(316002)(54906003)(110136005)(31696002)(186003)(45080400002)(2616005)(966005)(2906002)(6486002)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1314;
 H:BN6PR12MB1699.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: slXjqOyQixByrGfVPPtTHwUZsPkfKWrGO7E74cSId618zy3+IZ87lAe766Bx934u1YhuadtT0taJGp72t5RweH77evdNQ4kM8m1hRzy5g09utXKt//UP7Ow58s3R2NGaBYr42PKKsEDUj7QG92hH6Cr0CJUf/1vtcIljEXcgyoQrFUo7eMeouzD1WeKkEXYJ4xiePPPFDAoFqdu6UssIyYHUZM95qjhgHl3IcpATuxBolaWOQ2l2BpaszCUQ+kPcZYz74RHi3EqTa+hYVyMKw4Dt1A+2LWJFtloQH2I03AcgBC+Z4NtQqtM3vm0DLsquqLCak6EEAcTq7+jxoenZiTsxphCSOTKP3FZeUgc3vMjcxtjGYbadRA3HaUmI2+VO2U+q6bLYOmKuVPjZs3tYaAnz8fQEg6dqHnrssONQ3lNgMjVCa5/67QtD3l6wdOilvxO+t+Mx2YRIHFrscRpGA4W8NzUJdGNHee0Nss6OLGc=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3be78018-8481-4f29-b86b-08d794ecd31d
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2020 10:15:17.6165 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZFraTC4Nw5P53Fc2etWK/nG3aauXz+n0Loo6cwQiHI9sjuMI+sigEtJEWa14Rh9H
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1314
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
Cc: kernel-hardening@lists.openwall.com, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Tianlin Li <tli@digitalocean.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDguMDEuMjAgdW0gMTg6NTEgc2NocmllYiBBbGV4IERldWNoZXI6Cj4gT24gV2VkLCBKYW4g
OCwgMjAyMCBhdCAxMjozOSBQTSBLZWVzIENvb2sgPGtlZXNjb29rQGNocm9taXVtLm9yZz4gd3Jv
dGU6Cj4+IE9uIFdlZCwgSmFuIDA4LCAyMDIwIGF0IDAxOjU2OjQ3UE0gKzAxMDAsIENocmlzdGlh
biBLw7ZuaWcgd3JvdGU6Cj4+PiBBbSAwNy4wMS4yMCB1bSAyMDoyNSBzY2hyaWViIFRpYW5saW4g
TGk6Cj4+Pj4gUmlnaHQgbm93IHNldmVyYWwgYXJjaGl0ZWN0dXJlcyBhbGxvdyB0aGVpciBzZXRf
bWVtb3J5XyooKSBmYW1pbHkgb2YKPj4+PiBmdW5jdGlvbnMgdG8gZmFpbCwgYnV0IGNhbGxlcnMg
bWF5IG5vdCBiZSBjaGVja2luZyB0aGUgcmV0dXJuIHZhbHVlcy4KPj4+PiBJZiBzZXRfbWVtb3J5
XyooKSByZXR1cm5zIHdpdGggYW4gZXJyb3IsIGNhbGwtc2l0ZSBhc3N1bXB0aW9ucyBtYXkgYmUK
Pj4+PiBpbmZhY3Qgd3JvbmcgdG8gYXNzdW1lIHRoYXQgaXQgd291bGQgZWl0aGVyIHN1Y2NlZWQg
b3Igbm90IHN1Y2NlZWQgYXQKPj4+PiBhbGwuIElkZWFsbHksIHRoZSBmYWlsdXJlIG9mIHNldF9t
ZW1vcnlfKigpIHNob3VsZCBiZSBwYXNzZWQgdXAgdGhlCj4+Pj4gY2FsbCBzdGFjaywgYW5kIGNh
bGxlcnMgc2hvdWxkIGV4YW1pbmUgdGhlIGZhaWx1cmUgYW5kIGRlYWwgd2l0aCBpdC4KPj4+Pgo+
Pj4+IE5lZWQgdG8gZml4IHRoZSBjYWxsZXJzIGFuZCBhZGQgdGhlIF9fbXVzdF9jaGVjayBhdHRy
aWJ1dGUuIFRoZXkgYWxzbwo+Pj4+IG1heSBub3QgcHJvdmlkZSBhbnkgbGV2ZWwgb2YgYXRvbWlj
aXR5LCBpbiB0aGUgc2Vuc2UgdGhhdCB0aGUgbWVtb3J5Cj4+Pj4gcHJvdGVjdGlvbnMgbWF5IGJl
IGxlZnQgaW5jb21wbGV0ZSBvbiBmYWlsdXJlLiBUaGlzIGlzc3VlIGxpa2VseSBoYXMgYQo+Pj4+
IGZldyBzdGVwcyBvbiBlZmZlY3RzIGFyY2hpdGVjdHVyZXM6Cj4+Pj4gMSlIYXZlIGFsbCBjYWxs
ZXJzIG9mIHNldF9tZW1vcnlfKigpIGhlbHBlcnMgY2hlY2sgdGhlIHJldHVybiB2YWx1ZS4KPj4+
PiAyKUFkZCBfX211c3RfY2hlY2sgdG8gYWxsIHNldF9tZW1vcnlfKigpIGhlbHBlcnMgc28gdGhh
dCBuZXcgdXNlcyBkbwo+Pj4+IG5vdCBpZ25vcmUgdGhlIHJldHVybiB2YWx1ZS4KPj4+PiAzKUFk
ZCBhdG9taWNpdHkgdG8gdGhlIGNhbGxzIHNvIHRoYXQgdGhlIG1lbW9yeSBwcm90ZWN0aW9ucyBh
cmVuJ3QgbGVmdAo+Pj4+IGluIGEgcGFydGlhbCBzdGF0ZS4KPj4+Pgo+Pj4+IFRoaXMgc2VyaWVz
IGlzIHBhcnQgb2Ygc3RlcCAxLiBNYWtlIGRybS9yYWRlb24gY2hlY2sgdGhlIHJldHVybiB2YWx1
ZSBvZgo+Pj4+IHNldF9tZW1vcnlfKigpLgo+Pj4gSSdtIGEgbGl0dGxlIGhlc2l0YXRlIG1lcmdl
IHRoYXQuIFRoaXMgaGFyZHdhcmUgaXMgPjE1IHllYXJzIG9sZCBhbmQgbm9ib2R5Cj4+PiBvZiB0
aGUgZGV2ZWxvcGVycyBoYXZlIGFueSBzeXN0ZW0gbGVmdCB0byB0ZXN0IHRoaXMgY2hhbmdlIG9u
Lgo+PiBJZiB0aGF0J3MgdHJ1ZSBpdCBzaG91bGQgYmUgcmVtb3ZlZCBmcm9tIHRoZSB0cmVlLiBX
ZSBuZWVkIHRvIGJlIGFibGUgdG8KPj4gY29ycmVjdGx5IG1ha2UgdGhlc2Uga2luZHMgb2YgY2hh
bmdlcyBpbiB0aGUga2VybmVsLgo+IFRoaXMgZHJpdmVyIHN1cHBvcnRzIGFib3V0IDE1IHllYXJz
IG9mIGhhcmR3YXJlIGdlbmVyYXRpb25zLiAgTmV3ZXIKPiBjYXJkcyBhcmUgc3RpbGwgcHJldmFs
ZW50LCBidXQgdGhlIG9sZGVyIHN0dWZmIGlzIGxlc3Mgc28uICBJdCBzdGlsbAo+IHdvcmtzIGFu
ZCBwZW9wbGUgdXNlIGl0IGJhc2VkIG9uIGZlZWRiYWNrIEkndmUgc2VlbiwgYnV0IHRoZSBvbGRl
cgo+IHN0dWZmIGhhcyBubyBhY3RpdmUgZGV2ZWxvcG1lbnQgYXQgdGhpcyBwb2ludC4gIFRoaXMg
Y2hhbmdlIGp1c3QKPiBoYXBwZW5zIHRvIHRhcmdldCB0aG9zZSBvbGRlciBjaGlwcy4KCkp1c3Qg
YSBmZXcgd2Vla3MgYmFjayB3ZSd2ZSBnb3QgYSBtYWlsIGZyb20gc29tZWJvZHkgdXNpbmcgYW4g
aW50ZWdyYXRlZCAKUjEyOCBpbiBhIGxhcHRvcC4KCkFmdGVyIGEgZmV3IG1haWxzIGJhY2sgYW5k
IGZvcmNlIHdlIGZpZ3VyZWQgb3V0IHRoYXQgaGlzIG5lYXJseSAyMCB5ZWFycyAKb2xkIGhhcmR3
YXJlIHdhcyBmaW5hbGx5IGZhaWxpbmcuCgpVcCB0aWxsIHRoYXQgaGUgd2FzIHN0aWxsIHN1Y2Nl
c3NmdWxseSB1cGRhdGluZyBoaXMga2VybmVsIGZyb20gdGltZSB0byAKdGltZSBhbmQgdGhlIGRy
aXZlciBzdGlsbCB3b3JrZWQuIEkgZmluZCB0aGF0IHByZXR0eSBpbXByZXNzaXZlLgoKPgo+IEFs
ZXgKPgo+Pj4gV291bGQgaXQgYmUgdG8gbXVjaCBvZiBhIHByb2JsZW0gdG8ganVzdCBhZGQgc29t
ZXRoaW5nIGxpa2U6IHIgPQo+Pj4gc2V0X21lbW9yeV8qKCk7ICh2b2lkKXI7IC8qIEludGVudGlv
bmFsbHkgaWdub3JlZCAqLy4KPj4gVGhpcyBzZWVtcyBsaWtlIGEgYmFkIGlkZWEgLS0gd2Ugc2hv
dWxkbid0IGJlIHBhcGVyaW5nIG92ZXIgZmFpbHVyZXMKPj4gbGlrZSB0aGlzIHdoZW4gdGhlcmUg
aXMgbG9naWMgYXZhaWxhYmxlIHRvIGRlYWwgd2l0aCBpdC4KCldlbGwgSSBjZXJ0YWlubHkgYWdy
ZWUgdG8gdGhhdCwgYnV0IHdlIGFyZSB0YWxraW5nIGFib3V0IGEgY2FsbCB3aGljaCAKaGFwcGVu
cyBvbmx5IG9uY2UgZHVyaW5nIGRyaXZlciBsb2FkL3VubG9hZC4gSWYgbmVjZXNzYXJ5IHdlIGNv
dWxkIGFsc28gCnByaW50IGFuIGVycm9yIHdoZW4gc29tZXRoaW5nIGdvZXMgd3JvbmcsIGJ1dCBw
bGVhc2Ugbm8gbGFyZ2VyIApyZWZhY3RvcmluZyBvZiByZXR1cm4gdmFsdWVzIGFuZCBjYWxsIHBh
dGhzLgoKSXQgaXMgcGVyZmVjdGx5IHBvc3NpYmxlIHRoYXQgdGhpcyBjYWxsIGFjdHVhbGx5IGZh
aWxlZCBvbiBzb21lYm9kaWVzIApoYXJkd2FyZSwgYnV0IHdlIG5ldmVyIG5vdGljZWQgYmVjYXVz
ZSB0aGUgZHJpdmVyIHN0aWxsIHdvcmtzIGZpbmUuIElmIAp3ZSBub3cgaGFuZGxlIHRoZSBlcnJv
ciBpdCBpcyBwb3NzaWJsZSB0aGF0IHRoZSBtb2R1bGUgbmV2ZXIgbG9hZHMgYW5kIAp0aGUgdXNl
ciBnZXRzIGEgYmxhY2sgc2NyZWVuIGluc3RlYWQuCgpSZWdhcmRzLApDaHJpc3RpYW4uCgo+Pgo+
Pj4gQXBhcnQgZnJvbSB0aGF0IGNlcnRhaW5seSBhIGdvb2QgaWRlYSB0byBhZGQgX19tdXN0X2No
ZWNrIHRvIHRoZSBmdW5jdGlvbnMuCj4+IEFncmVlZCEKPj4KPj4gLUtlZXMKPj4KPj4gLS0KPj4g
S2VlcyBDb29rCj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwo+PiBodHRwczovL25hbTExLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29t
Lz91cmw9aHR0cHMlM0ElMkYlMkZsaXN0cy5mcmVlZGVza3RvcC5vcmclMkZtYWlsbWFuJTJGbGlz
dGluZm8lMkZkcmktZGV2ZWwmYW1wO2RhdGE9MDIlN0MwMSU3Q2NocmlzdGlhbi5rb2VuaWclNDBh
bWQuY29tJTdDYTU0MmQzODRkNTQwNDBiNWIwYjcwOGQ3OTQ2MzZkZjElN0MzZGQ4OTYxZmU0ODg0
ZTYwOGUxMWE4MmQ5OTRlMTgzZCU3QzAlN0MwJTdDNjM3MTQxMDI3MDgwMDgwMTQ3JmFtcDtzZGF0
YT1FSEZsNllPSG1OcDdnT3FXc1ZtZm9lRDBqTmlyQlRPR0hjQ1A0ZWZDJTJGdkUlM0QmYW1wO3Jl
c2VydmVkPTAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=

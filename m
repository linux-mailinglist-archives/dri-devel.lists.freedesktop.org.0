Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0141118351E
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 16:39:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0B726EAEB;
	Thu, 12 Mar 2020 15:39:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750050.outbound.protection.outlook.com [40.107.75.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EDA66E24B;
 Thu, 12 Mar 2020 15:39:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aK5rpTVOgb0AfF5k7LEvoLDvlPeZyvtwxDtohWsD5pbRrxRQPXj15QvuqwKtUpJUGjE1Deyvk22vh440TRgxWRvgw3LR1HHgz8mUga/9Ro/zuX6VYb3KcV5xVVBKR0HKU19YRptXeYYkP7Y9+q6ePKoakL7TssIpBQYfAzhorYUWqnmJY/cYZ8a6s1oQDFRQlgb4BRrmwApipd64XMpsrnk+wcMivyDpV6t+M1vRz/NDxe44EQ4jkAVr+CJlcaURW4FXEIwb3lUryHmqnCEMNr5IMXPKY9Yv5kxL0LFtFKCS+robi1fbS4kR7TpzZJKPUtxddSYGV0YhAgMF2DJqtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a3D31AGBywQS3/TIr+IaBfzl79bcVq4ft5hrjpxhrOI=;
 b=P+LsvQbbZC317Al2fBOCYEDEju3Y24VKMDNGxXWzFFrFZggMr7zNp1PmM06ogvDzDpsM4fejJHoTyRTeXjd+bgNdNP/ZlQPHADEQHlZ58typmxwBSxh2KqS3Q9GN1qSLbl0aExh42rKEnywVK4wG/VXK5H/IDWcixHNkrqZ8cnJoysbwg5WJCYlxxYYmts2DvQvVfNvQN2T796T2hXdnIkOb5xK7Q+6IQHEmezpL/N3k4OKzo6NDbj3Ni3aSH0DEahseYIhPgtoiKl6BPNLR1pz8biCLRGGUOSlLkKf+qUhN7N9kdi0YeSwjci0gPQYsNTpmaOTZcEEK04+rQEyL0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a3D31AGBywQS3/TIr+IaBfzl79bcVq4ft5hrjpxhrOI=;
 b=Qip84NIKF2EpS3MP31RnlCSn6Tjy5GSb88RNeiT5G+2gFcg+Zqc4WQbna4taKmB7HhVdm2xSuTI1ZKxz9szgu6MQElRSMjNG/xICeAP9YpqP+Gz8QP+Q1QhmMBVSwb3sD7QBUN/GXrzfAFKWfYRB5m/WPh15csLkCE1Rm1kosw0=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (2603:10b6:3:10c::22)
 by DM5PR12MB1146.namprd12.prod.outlook.com (2603:10b6:3:73::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.17; Thu, 12 Mar
 2020 15:39:09 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::d40e:7339:8605:bc92]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::d40e:7339:8605:bc92%11]) with mapi id 15.20.2793.018; Thu, 12 Mar
 2020 15:39:09 +0000
Subject: Re: [PATCH 1/6] lib/scatterlist: add sg_set_dma_addr() function
To: Jason Gunthorpe <jgg@ziepe.ca>, Christoph Hellwig <hch@infradead.org>
References: <20200311135158.3310-1-christian.koenig@amd.com>
 <20200311135158.3310-2-christian.koenig@amd.com>
 <20200311152838.GA24280@infradead.org>
 <f2b46f49-a8d0-9d43-3120-e1ed36fc3a80@gmail.com>
 <20200312101943.GA14618@infradead.org>
 <b5db44eb-1dde-1671-feb0-9e47d120f172@amd.com>
 <20200312104729.GA26031@infradead.org> <20200312141928.GK31668@ziepe.ca>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <5383c8de-4e2c-dc8c-363d-a35d671abfc3@amd.com>
Date: Thu, 12 Mar 2020 16:39:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20200312141928.GK31668@ziepe.ca>
Content-Language: en-US
X-ClientProxiedBy: AM0P190CA0026.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::36) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0P190CA0026.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.15 via Frontend Transport; Thu, 12 Mar 2020 15:39:07 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d47b8ca4-af08-40c0-c722-08d7c69b8186
X-MS-TrafficTypeDiagnostic: DM5PR12MB1146:|DM5PR12MB1146:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB114683F259F4F84DA9A4B62C83FD0@DM5PR12MB1146.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0340850FCD
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(366004)(396003)(39860400002)(136003)(199004)(316002)(4326008)(31696002)(86362001)(8676002)(2616005)(66476007)(6486002)(8936002)(66556008)(2906002)(5660300002)(66946007)(478600001)(110136005)(6666004)(81156014)(36756003)(81166006)(16526019)(52116002)(31686004)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1146;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PY2Op2rek7IPtZ6/3ZF3idz8TwiUda4XxtBDFXr7LhEwit1j2nKlgrQrnlZDl5wFv/pGtpjaA/IBxNSP9y1//JseH0DUR1xVjFL+Jmb7YFwiF+VVhXNhyqjYmJkNQGxs0qwhSg6DwCqGtwrIoK9zhYoIDj8bdqH2gx4PtT9Ik2Z7HeKuUGW7knHkAH3ty6mllHYmu7zuZdrMRYPXYP3iCCcbDvIyF7wmzsLgjXt2gwtj1yrbMsd0+N5pddvVO5XvKVvc4DjYA2hDH+CPu+5dhwOaDw9dpZI1Q0AUW4DPaX3rZdnGh724GLusJNXmz+fcKA5JadXNnqvbGr/katBKc2wLOYfDM7NowR0YpmvgF22yXWm4PebJ0CIz+BjhZCNsIzZ0uANSg6BoxVTLiIn7RTf3KbC7DJIwOwcsx/DX6KFkf8HUAYEyvPN4dNqbOnqK
X-MS-Exchange-AntiSpam-MessageData: WEUqJtgPbao+ziq+Lq4vhuh9SBAmm4nmyrJ5uW2gtUs9CyASefcy0+VB4IcYansYUKEF8dEgGXFjUnDS5hCcicaWQ6Sh/EJaO4YLcLM/0rAGwMNk21vdBzFrDtM3JRP+W8uy82gdd+aKA9uGHEvUQvY0csYAcI0beXma5u1P2Ch9ubipfCPOI5vlUo8SZjWty407nZBjH+OQhUJopA84wQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d47b8ca4-af08-40c0-c722-08d7c69b8186
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2020 15:39:09.3707 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZH+s2gIInFP214b5BzIziRZ1TPu96nU2KaitFcyy8PXemSL1mXYKwAo35esQWO7l
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1146
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Logan Gunthorpe <logang@deltatee.com>,
 linux-media@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTIuMDMuMjAgdW0gMTU6MTkgc2NocmllYiBKYXNvbiBHdW50aG9ycGU6Cj4gT24gVGh1LCBN
YXIgMTIsIDIwMjAgYXQgMDM6NDc6MjlBTSAtMDcwMCwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6
Cj4+IE9uIFRodSwgTWFyIDEyLCAyMDIwIGF0IDExOjMxOjM1QU0gKzAxMDAsIENocmlzdGlhbiBL
w7ZuaWcgd3JvdGU6Cj4+PiBCdXQgaG93IHNob3VsZCB3ZSB0aGVuIGRlYWwgd2l0aCBhbGwgdGhl
IGV4aXN0aW5nIGludGVyZmFjZXMgd2hpY2ggYWxyZWFkeQo+Pj4gdGFrZSBhIHNjYXR0ZXJsaXN0
L3NnX3RhYmxlID8KPj4+Cj4+PiBUaGUgd2hvbGUgRE1BLWJ1ZiBkZXNpZ24gYW5kIGEgbG90IG9m
IGRyaXZlcnMgYXJlIGJ1aWxkIGFyb3VuZAo+Pj4gc2NhdHRlcmxpc3Qvc2dfdGFibGUgYW5kIHRv
IG1lIHRoYXQgYWN0dWFsbHkgbWFrZXMgcXVpdGUgYSBsb3Qgb2Ygc2Vuc2UuCj4+Pgo+PiBSZXBs
YWNlIHRoZW0gd2l0aCBhIHNhbmVyIGludGVyZmFjZSB0aGF0IGRvZXNuJ3QgdGFrZSBhIHNjYXR0
ZXJsaXN0Lgo+PiBBdCB2ZXJ5IGxlYXN0IGZvciBuZXcgZnVuY3Rpb25hbGl0eSBsaWtlIHBlZXIg
dG8gcGVlciBETUEsIGJ1dAo+PiBlc3BlY2lhbGx5IHRoaXMgY29kZSB3b3VsZCBhbHNvIGJlbmVm
aXQgZnJvbSBhIGdlbmVyYWwgbW92ZSBhd2F5Cj4+IGZyb20gdGhlIHNjYXR0ZXJsaXN0Lgo+IElm
IGRtYSBidWYgY2FuIGRvIFAyUCBJJ2QgbGlrZSB0byBzZWUgc3VwcG9ydCBmb3IgY29uc3VtaW5n
IGEgZG1hYnVmCj4gaW4gUkRNQS4KClRoYXQgd291bGQgaW5kZWVkIGJlIGF3ZXNvbWUuCgo+IExv
b2tpbmcgYXQgaG93Li4gdGhlcmUgaXMgYW4gZXhpc3Rpbmcgc2dsIGJhc2VkIHBhdGggc3RhcnRp
bmcKPiBmcm9tIGdldF91c2VyX3BhZ2VzIHRocm91Z2ggZG1hIG1hcCB0byB0aGUgZHJpdmVycy4g
KGliX3VtZW0pCj4KPiBJIGNhbiByZXBsYWNlIHRoZSBkcml2ZXIgcGFydCB3aXRoIHNvbWV0aGlu
ZyBlbHNlIChkbWFfc2cpLCBidXQgbm90Cj4gdW50aWwgd2UgZ2V0IGEgd2F5IHRvIERNQSBtYXAg
cGFnZXMgZGlyZWN0bHkgaW50byB0aGF0IHNvbWV0aGluZwo+IGVsc2UuLgo+Cj4gVGhlIG5vbi1w
YWdlIHNjYXR0ZXJsaXN0IGlzIGFsc28gYSBiaWcgY29uY2VybiBmb3IgUkRNQSBhcyB3ZSBoYXZl
Cj4gZHJpdmVycyB0aGF0IHdhbnQgdGhlIHBhZ2UgbGlzdCwgc28gZXZlbiBpZiB3ZSBkaWQgYXMg
dGhpcyBzZXJpZXMKPiBjb250ZW1wbGF0ZXMgSSdkIGhhdmUgc3RpbGwgaGF2ZSB0byBzcGxpdCB0
aGUgZHJpdmVycyBhbmQgY3JlYXRlIHRoZQo+IG5vdGlvbiBvZiBhIGRtYS1vbmx5IFNHTC4KClll
YWggdGhhdCdzIG15IGNvbmNlcm4gYXMgd2VsbC4gRm9yIEdQVSBkcml2ZXJzIEkgZG9uJ3QgdGhp
bmsgd2UgbmVlZCAKdGhlIHN0cnVjdCBwYWdlcyBhbnl3aGVyZSwgYnV0IHRoYXQgbWlnaHQgbm90
IGJlIHRydWUgZm9yIG90aGVycy4KCj4+PiBJIG1lYW4gd2UgY291bGQgY29tZSB1cCB3aXRoIGEg
bmV3IHN0cnVjdHVyZSBmb3IgdGhpcywgYnV0IHRvIG1lIHRoYXQganVzdAo+Pj4gbG9va3MgbGlr
ZSByZWludmVudGluZyB0aGUgd2hlZWwuIEVzcGVjaWFsbHkgc2luY2UgZHJpdmVycyBuZWVkIHRv
IGJlIGFibGUKPj4+IHRvIGhhbmRsZSBib3RoIEkvTyB0byBzeXN0ZW0gbWVtb3J5IGFuZCBJL08g
dG8gUENJZSBCQVJzLgo+PiBUaGUgc3RydWN0dXJlIGZvciBob2xkaW5nIHRoZSBzdHJ1Y3QgcGFn
ZSBzaWRlIG9mIHRoZSBzY2F0dGVybGlzdCBpcwo+PiBjYWxsZWQgc3RydWN0IGJpb192ZWMsIHNv
IGZhciBtb3N0bHkgdXNlZCBieSB0aGUgYmxvY2sgYW5kIG5ldHdvcmtpbmcKPj4gY29kZS4KPiBJ
IGhhdmVuJ3QgdXNlZCBiaW9fdmVjcyBiZWZvcmUsIGRvIHRoZXkgc3VwcG9ydCBjaGFpbmluZyBs
aWtlIFNHTCBzbwo+IHRoZXkgY2FuIGJlIHZlcnkgYmlnPyBSRE1BIGRtYSBtYXBzIGdpZ2FieXRl
cyBvZiBtZW1vcnkKPgo+PiBUaGUgc3RydWN0dXJlIGZvciBob2xkaW5nIGRtYSBhZGRyZXNzZXMg
ZG9lc24ndCByZWFsbHkgZXhpc3QKPj4gaW4gYSBnZW5lcmljIGZvcm0sIGJ1dCB3b3VsZCBiZSBh
biBhcnJheSBvZiB0aGVzZSBzdHJ1Y3R1cmVzOgo+Pgo+PiBzdHJ1Y3QgZG1hX3NnIHsKPj4gCWRt
YV9hZGRyX3QJYWRkcjsKPj4gCXUzMgkJbGVuOwo+PiB9Owo+IFNhbWUgcXVlc3Rpb24sIFJETUEg
bmVlZHMgdG8gcmVwcmVzZW50IGdpZ2FieXRlcyBvZiBwYWdlcyBpbiBhIERNQQo+IGxpc3QsIHdl
IHdpbGwgbmVlZCBzb21lIGdlbmVyaWMgd2F5IHRvIGhhbmRsZSB0aGF0LiBJIHN1c3BlY3QgR1BV
IGhhcwo+IGEgc2ltaWxhciBuZWVkPyBDYW4gaXQgYmUgYWNjb21pZGF0ZWQgaW4gc29tZSBnZW5l
cmljIGRtYV9zZz8KClllcywgd2UgZWFzaWx5IGhhdmUgcmFuZ2VzIG9mID4xR0IuIFNvIEkgd291
bGQgY2VydGFpbmx5IHNheSB1NjQgZm9yIHRoZSAKbGVuIGhlcmUuCgo+IFNvIEknbSBndWVzc2lu
ZyB0aGUgcGF0aCBmb3J3YXJkIGlzIHNvbWV0aGluZyBsaWtlCj4KPiAgIC0gQWRkIHNvbWUgZ2Vu
ZXJpYyBkbWFfc2cgZGF0YSBzdHJ1Y3R1cmUgYW5kIGhlbHBlcgo+ICAgLSBBZGQgZG1hIG1hcHBp
bmcgY29kZSB0byBnbyBmcm9tIHBhZ2VzIHRvIGRtYV9zZwo+ICAgLSBSZXdvcmsgUkRNQSB0byB1
c2UgZG1hX3NnIGFuZCB0aGUgbmV3IGRtYSBtYXBwaW5nIGNvZGUKPiAgIC0gUmV3b3JrIGRtYWJ1
ZiB0byBzdXBwb3J0IGRtYSBtYXBwaW5nIHRvIGEgZG1hX3NnCj4gICAtIFJld29yayBHUFUgZHJp
dmVycyB0byB1c2UgZG1hX3NnCj4gICAtIFRlYWNoIHAycGRtYSB0byBnZW5lcmF0ZSBhIGRtYV9z
ZyBmcm9tIGEgQkFSIHBhZ2UgbGlzdAo+ICAgLSBUaGlzIHNlcmllcwo+Cj4gPwoKU291bmRzIHBy
ZXR0eSBtdWNoIGxpa2UgYSBwbGFuIHRvIG1lLCBidXQgdW5mb3J0dW5hdGVseSBsaWtlIGEgcmF0
aGVyIApodWdlIG9uZS4KCkJlY2F1c2Ugb2YgdGhpcyBhbmQgY2F1c2UgSSBkb24ndCBrbm93IGlm
IGFsbCBkcml2ZXJzIGNhbiBsaXZlIHdpdGggCmRtYV9zZyBJJ20gbm90IHN1cmUgaWYgd2Ugc2hv
dWxkbid0IGhhdmUgdGhlIHN3aXRjaCBmcm9tIHNjYXR0ZXJsaXN0IHRvIApkbWFfc2cgc2VwYXJh
dGVseSB0byB0aGlzIHBlZXIycGVlciB3b3JrLgoKQ2hyaXN0aWFuLgoKPgo+IEphc29uCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

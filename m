Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 739771BC5F0
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 19:00:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77BC96E84E;
	Tue, 28 Apr 2020 17:00:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2079.outbound.protection.outlook.com [40.107.236.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78F946E84E
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 17:00:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y3nO8icVz9oFgzNh6DSTrUnFeg5pc/HeqCaNbahafSAKa0Mv0FtiYnTewA70lnDmEM8k7AzfFoimqg/Qwi38rVrz8IY6qksWgJhiCoyV63J8fwBgfTpZkBxBTiwJSu9we9soHnCh8vvf1gCOcIbLWjIQbP5nI8eoLk51ZQlSj6IPShwqJmLkDWKJTuq1KzGxK/loiTYRdKd0kILE3jwdhWuTnoyesMq0c6PYX5MUhpkom58+a3y821Ve1Z7/RNRmbBPaWWVc3QhfRny4l/iYf5ZMrdjaCnkkWxz6CsiPJ4QrUT0QVTFYzHXkF4fLkJVo4mo9n2ayczS9plCFjd3AsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OkGxnWzoL2XQeqBLXJ1gRF1d1rtAU2BneMyEggw12eY=;
 b=Hq2UNZCUTzTmrxIzrJZhejtAbSnPwe9Ro0+/dGm7BEGciHA/nwdK9JRhjvOWf/lI6/I5y0zmVhc+nYMe2RSDTllvzE/o8tCSzahydVzrA4+MuO04Z2wBM5QAkc2NdRX3PSbOxdnyF+MJzIATyvrBkFtpoepXs7/CS/M2TystqOrjubN/cZ7Qpyjv7u7BPeLkT6lsl1R13aGZcxj2iIkTLpFkop9l+T7tSB4SX3MsABRYnM1II67KK2fEjGeym0Opma1m+i1m2LKRsJSagO8ZTP1BoGnfErm+xyc2j1ybCd7uMUIoI8QIjWo0j/ixRzq02N4MzwI2vfd/ZyFYBeM8fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OkGxnWzoL2XQeqBLXJ1gRF1d1rtAU2BneMyEggw12eY=;
 b=susbQ4ngGomI0ZxE7r8zYbayIU5nwY8/8YAPa6i/ePHIS5PF/WUiF5Pg79DX9wsDx8+WWMbvrYKSWR+RMgdCWUsoVv4DDzsbrT7HQcVcum7ofPHONDtuMBdz9zz7BAqM7EAlfr2w02C1xLsfB2qx6/zHHoVDpKzl0qU9ko/gzgU=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3867.namprd12.prod.outlook.com (2603:10b6:5:1cf::33)
 by DM6PR12MB2874.namprd12.prod.outlook.com (2603:10b6:5:15e::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.22; Tue, 28 Apr
 2020 17:00:45 +0000
Received: from DM6PR12MB3867.namprd12.prod.outlook.com
 ([fe80::5de4:116a:c6b:bb6f]) by DM6PR12MB3867.namprd12.prod.outlook.com
 ([fe80::5de4:116a:c6b:bb6f%6]) with mapi id 15.20.2937.023; Tue, 28 Apr 2020
 17:00:45 +0000
Subject: Re: [PATCH 1/1] drm/mm: optimize rb_hole_addr rbtree search in high
 addr mode
To: Chris Wilson <chris@chris-wilson.co.uk>,
 Nirmoy Das <nirmoy.aiemd@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200428160423.4402-1-nirmoy.das@amd.com>
 <158809071622.24122.16400979345123305890@build.alporthouse.com>
From: Nirmoy <nirmodas@amd.com>
Message-ID: <add0029f-1cd0-1cc1-94cc-1aa7c56f52ea@amd.com>
Date: Tue, 28 Apr 2020 19:05:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <158809071622.24122.16400979345123305890@build.alporthouse.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR04CA0005.eurprd04.prod.outlook.com
 (2603:10a6:208:122::18) To DM6PR12MB3867.namprd12.prod.outlook.com
 (2603:10b6:5:1cf::33)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2003:c5:8f21:c300:72b6:e4f5:e01f:2334]
 (2003:c5:8f21:c300:72b6:e4f5:e01f:2334) by
 AM0PR04CA0005.eurprd04.prod.outlook.com (2603:10a6:208:122::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13 via Frontend
 Transport; Tue, 28 Apr 2020 17:00:44 +0000
X-Originating-IP: [2003:c5:8f21:c300:72b6:e4f5:e01f:2334]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5dc3ce26-ee3b-4c59-8886-08d7eb95b104
X-MS-TrafficTypeDiagnostic: DM6PR12MB2874:|DM6PR12MB2874:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB2874CF2DF87B68D0E2922BDB8BAC0@DM6PR12MB2874.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 0387D64A71
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3867.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(366004)(136003)(39860400002)(396003)(346002)(2616005)(36756003)(8936002)(66476007)(66946007)(66556008)(316002)(186003)(53546011)(8676002)(110136005)(4326008)(16526019)(52116002)(2906002)(6666004)(478600001)(31686004)(31696002)(6486002)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fRy+tIt7OHv5OoqvP5bWfsKdSgzKmkomsAnERVBeBF4FVIbes7CdOciVDllnllsG1Wl2o/g7BPx7jgQ4SqORkVHkqBtSTYxi58W4wZN2/jQ5596IL0NouT302hhMcrNaKVWH8tWq0QKhyg2SUDI+epyiP0zittcXcZS75yqH+I1Ro5CcYVrkkzYaHzkZltTs4aX93/lhIMRl2uX8abteobCdYb4jyKdbspJGUYZdSbLmuAdkZbWejZQ9FDLxxEMRAXKH8kBSIk+MD23kaC9+GL5DLRKC+Q+ZPrLsmduvXnqvGt3Zay+XfGxi9bB+o+69nO6NzYiK6k+HmsGBrpyFhX+0yCR2vgAWSGR9+XQRbsGW2Q4ACaqF5VCFrvdU+uiUEM5YT5ft8i+DhqXzEHuWAImInOi1QfZojCVrMCgxyElN4fOp+oBiHP3o6aysnFBG
X-MS-Exchange-AntiSpam-MessageData: PihBQlgYI1N6zQrv+FEFu87lKUuKjToku5CdXGTsfNnVstKbbil65O8zE1yKFc5MbGhvQqc7TyNPjL0NzJPvoKuCI6tLUgqDPU0FgG5olIXw5TwwdIdMGrwhIHyn+M4TuFaJZ0k/XDon1i8CvBEGYhng/j/ba7IQNopor+lYmDTVSQMtos4hW4Zbf2U8yuQ5yjL9NnS7/21NhDlJO7xrAs6UZW5K03a3a7JxeIKlWKTuOHGyZgt331ikAovIdecqHegYc1sLYBHAe0wm8/PskBfONrGQQAkV3AE/SiPLnujVGsTdT0bp6LWWE8MPXjNI6UibnjzNN7PN2PU0jbQdxCfZrLd9A9NKEbcDapheUCYiSORYvZs2ci0+aen1QB0iEpeendDf3/83YPi6eZ6V/zGeOeg+fkAqtuMBpiO0Z9n52IzoXT5VdlGcrrMtnHnKKKxYA28ZT8H0aBCcQhE6tz6x8ttoPCeupquPKmpPiooKSBZaT30PEvrhe/I8zkgvRHaut2T8lD+L2Oh/qUeVT+/dVmC+5L41tT48E8rZjKFBW8zFAL5eGC9yMTJucDHyPHJKfjWAA1F+OuDnwpjjm59fcQSGiZYIN5PxJ3iucMmPn+m9upu4uKWUxxwvBNPQa+48oP1IgS/rAkT/yINPysIIauKZveuEtF9esE+c/l1t/z/pV0lyzlwF9I8OwOJg3HdetQiTwFjialG+92GExokKDsgkEnovNEGKqtp112NjBtTx8fAtuUPSz8MDSUvCIfzxm/0hPMKlVCMOwKd7HpzGE6Nttva2WKWeGe2HMQQTGHApekkQcKwBQVAdYej3Z9yOr3wa+mtlnbS9JjZ/NdSRi4j1hdwXaYXd1oIyC6U=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dc3ce26-ee3b-4c59-8886-08d7eb95b104
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2020 17:00:45.0582 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mOxoEa93U2xoujur9h/2PAipdc6jbfM14eff+bHD7u4CUNFemuAp8bWFksFUMBwgqA3PiwRP2NkvgWV97FjN7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2874
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
Cc: nirmoy.das@amd.com, christian.koenig@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDQvMjgvMjAgNjoxOCBQTSwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+IFF1b3RpbmcgTmlybW95
IERhcyAoMjAyMC0wNC0yOCAxNzowNDoyMykKPj4gVXNlcnNwYWNlIGNhbiBzZXZlcmVseSBmcmFn
bWVudCByYl9ob2xlX2FkZHIgcmJ0cmVlIGJ5IG1hbmlwdWxhdGluZwo+PiBhbGlnbm1lbnQgd2hp
bGUgYWxsb2NhdGluZyBidWZmZXJzLiBGcmFnbWVudGVkIHJiX2hvbGVfYWRkciByYnRyZWUgd291
bGQKPj4gcmVzdWx0IGluIGxhcmdlIGRlbGF5cyB3aGlsZSBhbGxvY2F0aW5nIGJ1ZmZlciBvYmpl
Y3QgZm9yIGEgdXNlcnNwYWNlCj4+IGFwcGxpY2F0aW9uLiBJdCB0YWtlcyBsb25nIHRpbWUgdG8g
ZmluZCBzdWl0YWJsZSBob2xlIGJlY2F1c2UgaWYgd2UgZmFpbAo+PiB0byBmaW5kIGEgc3VpdGFi
bGUgaG9sZSBpbiB0aGUgZmlyc3QgYXR0ZW1wdCB0aGVuIHdlIGxvb2sgZm9yIG5laWdoYm91cmlu
Zwo+PiBub2RlcyB1c2luZyByYl9wcmV2KCkuIFRyYXZlcnNpbmcgcmJ0cmVlIHVzaW5nIHJiX3By
ZXYoKSBjYW4gdGFrZSByZWFsbHkKPj4gbG9uZyB0aW1lIGlmIHRoZSB0cmVlIGlzIGZyYWdtZW50
ZWQuCj4+Cj4+IFRoaXMgcGF0Y2ggaW1wcm92ZXMgc2VhcmNoZXMgaW4gZnJhZ21lbnRlZCByYl9o
b2xlX2FkZHIgcmJ0cmVlIGJ5IHN0b3JpbmcKPj4gYW4gZXh0cmEgZmllbGQgaW4gZHJtX21tX25v
ZGUsIG1heF9ob2xlX3NpemUuIEVhY2ggZHJtX21tX25vZGUgbm93IHN0b3Jlcwo+PiBtYXhpbXVt
IGhvbGUgc2l6ZSBmb3IgaXRzIHN1YnRyZWUgaW4gZHJtX21tX25vZGUtPm1heF9ob2xlX3NpemUu
IFVzaW5nCj4+IGRybV9tbV9ub2RlLT5tYXhfaG9sZV9zaXplLCBpdCBpcyBwb3NzaWJsZSB0byBl
bGltaW5hdGUgY29tcGxldGUKPj4gc3VidHJlZSBpZiB0aGF0IHN1YnRyZWUgaXMgdW5hYmxlIHRv
IHNlcnZlIGEgcmVxdWVzdCBoZW5jZSByZWR1Y2luZyBudW1iZXIKPj4gb2YgcmJfcHJldigpIHVz
ZWQuCj4+Cj4+IE5vdGU6IEltcGxlbWVudGF0aW9uIGRldGFpbHMgb2YgcmJfaG9sZV9hZGRyIHJi
dHJlZSB1cGRhdGVzIGFmdGVyIGEgbm9kZQo+PiByZW1vdmFsIGFuZCBhZGRpdGlvbiBpcyBib3Jy
b3dlZCBmcm9tIGJsb2NrL2JmcS13ZjJxLmMgd2hpY2ggaXMgdHJ5aW5nIHRvCj4+IGFjaGlldmUg
YSBzaW1pbGFyIGdvYWwuCj4gRmVlbHMgbGlrZSBpdCBpcyBhbiBhdWdtZW50ZWQgcmJ0cmVlPwoK
CkkganVzdCByZWFkIGFib3V0IGF1Z21lbnRlZCByYnRyZWUgcXVpY2tseSBhbmQgeWVzIGl0IGZl
ZWxzIGxpa2Ugc28uwqAgSSAKd2lsbCB0cnkgdG8gdW5kZXJzdGFuZCBtb3JlCgphYm91dCBpdCBh
bmQgd2lsbCBzZWUgaWYgSSBjYW4gY29udmVydCB0aGlzIGxvZ2ljIHRvIGEgYXVnbWVudGVkIHJi
dHJlZS4KCgo+Cj4+ICtzdGF0aWMgc3RydWN0IGRybV9tbV9ub2RlICoKPj4gK25leHRfaG9sZV9o
aWdoX2FkZHIoc3RydWN0IGRybV9tbV9ub2RlICplbnRyeSwgdTY0IHNpemUpCj4+ICt7Cj4+ICsg
ICAgICAgc3RydWN0IHJiX25vZGUgKnJiX25vZGUsICpsZWZ0X3JiX25vZGUsICpwYXJlbnRfcmJf
bm9kZTsKPj4gKyAgICAgICBzdHJ1Y3QgZHJtX21tX25vZGUgKmxlZnRfbm9kZTsKPj4gKwo+PiAr
ICAgICAgIGlmICghZW50cnkpCj4+ICsgICAgICAgICAgICAgICByZXR1cm4gZmFsc2U7Cj4+ICsK
Pj4gKyAgICAgICByYl9ub2RlID0gJmVudHJ5LT5yYl9ob2xlX2FkZHI7Cj4+ICsgICAgICAgaWYg
KHJiX25vZGUtPnJiX2xlZnQpIHsKPj4gKyAgICAgICAgICAgICAgIGxlZnRfcmJfbm9kZSA9IHJi
X25vZGUtPnJiX2xlZnQ7Cj4+ICsgICAgICAgICAgICAgICBwYXJlbnRfcmJfbm9kZSA9IHJiX3Bh
cmVudChyYl9ub2RlKTsKPj4gKyAgICAgICAgICAgICAgIGxlZnRfbm9kZSA9IHJiX2VudHJ5KGxl
ZnRfcmJfbm9kZSwKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVj
dCBkcm1fbW1fbm9kZSwgcmJfaG9sZV9hZGRyKTsKPj4gKyAgICAgICAgICAgICAgIGlmICgobGVm
dF9ub2RlLT5tYXhfaG9sZV9zaXplIDwgc2l6ZSB8fAo+PiArICAgICAgICAgICAgICAgICAgICBl
bnRyeS0+c2l6ZSA9PSBlbnRyeS0+bWF4X2hvbGVfc2l6ZSkgJiYKPj4gKyAgICAgICAgICAgICAg
ICAgICBwYXJlbnRfcmJfbm9kZSAmJiBwYXJlbnRfcmJfbm9kZS0+cmJfbGVmdCAhPSByYl9ub2Rl
KQo+PiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gcmJfaG9sZV9hZGRyX3RvX25vZGUo
cGFyZW50X3JiX25vZGUpOwo+PiArICAgICAgIH0KPj4gKwo+PiArICAgICAgIHJldHVybiByYl9o
b2xlX2FkZHJfdG9fbm9kZShyYl9wcmV2KHJiX25vZGUpKTsKPj4gK30KPiBUaGUgbWF4X2hvbGVf
c2l6ZSB3b3VsZCBlcXVhbGx5IGFwcGx5IHRvIG5leHRfaG9sZV9sb3dfYWRkcigpLCByaWdodD8K
CgpTb3JyeSzCoCB5ZXMgd2UgbmVlZCB0aGF0IHRvby4gSSB3aWxsIGFkZCBuZXh0X2hvbGVfbG93
X2FkZHIoKS4KCgo+Cj4gU2FkbHksIEkgZGlkIG5vdCBleHBsb3JlIHRoZSBmcmFnbWVudGVkIHNl
YXJjaCBMT1cvSElHSCBpbiB0ZXN0LWRybV9tbS5jLgo+IFRoYXQgd291bGQgYmUgYSB1c2VmdWwg
YWRkaXRpb24gYXMgd2VsbC4KCgpZZXMgdGhhdCB3b3VsZCBiZSB1c2VmdWwgdG9vLgoKSSB1c2Vk
IC4vdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvZHJpdmVycy9ncHUvZHJtX21tLnNoIHRvIHZlcmlm
eSB0aGlzIHBhdGNoLgoKPiAtQ2hyaXMKCgpUaGFua3MgZm9yIHJldmlld2luZywKCk5pcm1veQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

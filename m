Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E9320533D
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jun 2020 15:16:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFC0E6E235;
	Tue, 23 Jun 2020 13:16:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2068.outbound.protection.outlook.com [40.107.92.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CE666E235;
 Tue, 23 Jun 2020 13:16:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lnRhu8geKEFngRJHuIVheFOSO7eyro6/Z9rEeOzLan1s75x0NW4DhG3aOvFtECBC4TuArUZ/xBjQ80nCdAajMp9Vz+9JTLv+zveVViWyMLmo2ae9+GU5qs5Ae53p4SqCYzUyB0FcSNNlu7Q0sFbHmI/5vKSUQISkI9Fpb7LhzJ1fLyJBnRGVO5Ik7g6FjY97B351qgeYnvc/KMcg6skQAxreasrmVY3DTn04PzsQ5CJHkGJ3hpyICOA4gcRx3sBJGgoiTyNImTtMiDw/6Smy44Yij4vBuB/mZebwUwnlIiIXPHWOmtuTVJ/FJf8JS389bI2dXm8sV6l3hT+sfjczfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nJFw02q0uYhHnOYKqfu/T9VcydLOziqaycpWegwYAPU=;
 b=biPF/00zE23pGhkKaXMCoG/+RVkCuuex5F69XlBylOmg8Oqm2pROPXICfHt4n8CPr7jZCwlo5/lklOdXlDWGsUIlpj0S4Eh///Evc3XHkIgFoQ42IzgeOcC8thBQk6ucIork0FGbui7mcDKvCMWTNb+cu28wb9dGWLLB8UuEM0/F4pVv4n4U5Sgk5XVP43jWRn5IjkLxQNy44a0hSLc3UFIgbNSzj4yGZgCq9U6SCLyvLGX7a3n4OlswL6lnJrRn49bLI9B/OUrEyzqKi5UGcBWnQkqrCEL3mUIs47aO/xPUJjtQBpzezELDH8eotRG5yBvI36hs4wP+oo440S7FNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nJFw02q0uYhHnOYKqfu/T9VcydLOziqaycpWegwYAPU=;
 b=aJkczNXzFAVPaG9hpXr2DQb/BhJ0HIr6L5wIq72wAjD1+8nZa4zFVhQNzvh0R9Wty7DOQ3YoJ8OXKuJ7ZY5vtYEwBPrrYyXVdEJK5GGT+oYCp6BP7wyH3ZtFjH+JseqynfiCqAmb1QHaPg4PgHTQw0UG4NPb+FpoR8cChtwT41Y=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4401.namprd12.prod.outlook.com (2603:10b6:5:2a9::15)
 by DM6PR12MB4204.namprd12.prod.outlook.com (2603:10b6:5:212::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21; Tue, 23 Jun
 2020 13:16:19 +0000
Received: from DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::a045:f8c0:8edb:1ef1]) by DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::a045:f8c0:8edb:1ef1%9]) with mapi id 15.20.3109.027; Tue, 23 Jun 2020
 13:16:19 +0000
Subject: Re: [PATCH v2 6/8] drm/amdgpu: Unmap entire device address space on
 device remove.
To: Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexdeucher@gmail.com>
References: <1592719388-13819-1-git-send-email-andrey.grodzovsky@amd.com>
 <1592719388-13819-7-git-send-email-andrey.grodzovsky@amd.com>
 <ec7dc51a-231f-f9e7-6082-5aad02965c67@gmail.com>
 <CADnq5_Oz_858bq-PRc=DsL62=TiqFaONw4qARK8NVbUVzMfuCw@mail.gmail.com>
 <20200623102203.GK20149@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <1bd67cd4-abd3-a6a8-e109-aea9752fff48@amd.com>
Date: Tue, 23 Jun 2020 15:16:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20200623102203.GK20149@phenom.ffwll.local>
Content-Language: en-US
X-ClientProxiedBy: FRYP281CA0009.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::19)
 To DM6PR12MB4401.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 FRYP281CA0009.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3109.23 via Frontend Transport; Tue, 23 Jun 2020 13:16:17 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 26c4af61-028e-4477-7cc5-08d817779e08
X-MS-TrafficTypeDiagnostic: DM6PR12MB4204:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB42042D6D540B8BD5F5397E2783940@DM6PR12MB4204.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 04433051BF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dBED2JpXWylH8T8mjI3icSEosAbHYniFk8Rxyv5NWZdP9qrNtCTF0ArfB6UMZH5UR1Y+uuNZlBDv9Tqpy5GznYdpNY5rfsOBFGgGSo/xFTiqEJwLmNyYTP89/+w7cQh0nPkvE9aUNj4h8OLgj/+Bq0tr7D/4wDKNeG3jbOcY6b1Tr0p6X29A8zPUHEbzIcQLealO5YMCR0SQrgT88SlZeSE/tWlzUiiEJD9Ed3wFgcKW46c3DjPP6W8iwEfsO/t/grhn7f2zJudPzV4NYHNZrCFJZvMDs5i3vz8OjBOTE3+MQR7CHS9NSrkDlWjyna5u97Smm5vw99aABtivrHTPtuqkOj5t5abRdQDXuJZhBA/cfc0fdxoiOl4A9fuhduLC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4401.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(346002)(136003)(396003)(39860400002)(366004)(110136005)(83380400001)(6666004)(8676002)(54906003)(53546011)(6486002)(316002)(16526019)(31686004)(52116002)(2906002)(186003)(478600001)(5660300002)(4326008)(66946007)(86362001)(66556008)(8936002)(36756003)(2616005)(31696002)(66476007)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: qEVoTj/ah8q4TUHrnkh2qXuqJFdBlebyBlBTtPxK1L47lSi/I3ggTQ9UZw+vQYMubHxbHMkHYa7v83TatD4QVkqIofmVbUmJBUJ7VF80cOx/eFcucVvIhJ/qBky6oN7P+1AJ27XHrk2RggsSW0mXVH5CP7pIcfXFi4mehjdYhIB2VfZRVWtY44HsgMPWO345vZa5bQqgRn+jOEC6IXiYNJX0adQKJCzkdkqLpDITdCRkPYO8A2dE+X02bBEkM6lkum2EOXUbpJ82w9cSQOrBlV6W+27v1ZWtVeemU2j8FToWhJf9CD7rBZNFN1U2dov0nbf1QC69OsPkdm2hrCTH2A+QyReAzd/Sp3huQn8xH9vKCSqt2zgakN82uzUFPwDWpz7xRQx6499Pe9JhCBly1zFHKot4LKv8xWzNaMEGWbNDZ7UwiuioCggk5vbcN4+EOWIR5gJC3C0P71s82adZ+V2IS4CLTzuyR6lvhXnT9HmJElgXvtyAKnaRfWXGRtyYKlSvKblKIzSpnInxiLM6fE6+zpDi87yi3Jh7SAfd7Tf/xkHDW3nsBYTij4GtSj0f
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26c4af61-028e-4477-7cc5-08d817779e08
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2020 13:16:19.5735 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FfO8fQszEHP0jfw/4+81Y/JiHC+tCk8pB3sfRyPvJGcs3GpOjDr0RgUZuCzbPE28
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4204
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjMuMDYuMjAgdW0gMTI6MjIgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIE1vbiwgSnVu
IDIyLCAyMDIwIGF0IDAzOjQ4OjI5UE0gLTA0MDAsIEFsZXggRGV1Y2hlciB3cm90ZToKPj4gT24g
TW9uLCBKdW4gMjIsIDIwMjAgYXQgMzozOCBQTSBDaHJpc3RpYW4gS8O2bmlnCj4+IDxja29lbmln
LmxlaWNodHp1bWVya2VuQGdtYWlsLmNvbT4gd3JvdGU6Cj4+PiBBbSAyMS4wNi4yMCB1bSAwODow
MyBzY2hyaWViIEFuZHJleSBHcm9kem92c2t5Ogo+Pj4+IFVzZSB0aGUgbmV3IFRUTSBpbnRlcmZh
Y2UgdG8gaW52YWxpZGF0ZSBhbGwgZXhzaXN0aW5nIEJPIENQVSBtYXBwaW5ncwo+Pj4+IGZvcm0g
YWxsIHVzZXIgcHJvY2Nlc3Nlcy4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJleSBHcm9k
em92c2t5IDxhbmRyZXkuZ3JvZHpvdnNreUBhbWQuY29tPgo+Pj4gUmV2aWV3ZWQtYnk6IENocmlz
dGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPj4+Cj4+PiBJIHRoaW5rIHRo
b3NlIHR3byBwYXRjaGVzIGNvdWxkIGFscmVhZHkgbGFuZCBpbiBhbWQtc3RhZ2luZy1kcm0tbmV4
dAo+Pj4gc2luY2UgdGhleSBhcmUgYSBnb29kIGlkZWEgaW5kZXBlbmRlbnQgb2YgaG93IGVsc2Ug
d2UgZml4IHRoZSBvdGhlciBpc3N1ZXMuCj4+IFBsZWFzZSBtYWtlIHN1cmUgdGhleSBsYW5kIGlu
IGRybS1taXNjIGFzIHdlbGwuCj4gTm90IHN1cmUgdGhhdCdzIG11Y2ggdXNlLCBzaW5jZSB3aXRo
b3V0IGFueSBvZiB0aGUgZmF1bHQgc2lkZSBjaGFuZ2VzIHlvdQo+IGp1c3QgYmxvdyB1cCBvbiB0
aGUgZmlyc3QgcmVmYXVsdC4gU2VlbXMgc29tZXdoYXQgc2lsbHkgdG8gY2hhcmdlIGFoZWFkIG9u
Cj4gdGhpcyB3aXRoIHRoZSBvdGhlciBiaXRzIHN0aWxsIHZlcnkgbXVjaCB1bmRlciBkaXNjdXNz
aW9uLgoKV2VsbCB3aGF0IEkgd2FudGVkIHRvIHNheSBpcyB0aGF0IHdlIGRvbid0IG5lZWQgdG8g
c2VuZCBvdXQgdGhvc2Ugc2ltcGxlIApwYXRjaGVzIG9uY2UgbW9yZS4KCj4gUGx1cyBJIHN1Z2dl
c3RlZCBhIHBvc3NpYmxlIGJpa2VzaGVkIGhlcmUgOi0pCgpObyBiaWtlc2hlZCwgYnV0IGluZGVl
ZCBhIHJhdGhlciBnb29kIGlkZWEgdG8gbm90IG1ha2UgdGhpcyBhIFRUTSBmdW5jdGlvbi4KCkNo
cmlzdGlhbi4KCj4gLURhbmllbAo+Cj4+IEFsZXgKPj4KPj4+PiAtLS0KPj4+PiAgICBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMgfCAxICsKPj4+PiAgICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKykKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfZHJ2LmMKPj4+PiBpbmRleCA0MzU5MmRjLi42OTMyZDc1IDEwMDY0NAo+Pj4+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYwo+Pj4+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYwo+Pj4+IEBAIC0xMTM1LDYgKzExMzUs
NyBAQCBhbWRncHVfcGNpX3JlbW92ZShzdHJ1Y3QgcGNpX2RldiAqcGRldikKPj4+PiAgICAgICAg
c3RydWN0IGRybV9kZXZpY2UgKmRldiA9IHBjaV9nZXRfZHJ2ZGF0YShwZGV2KTsKPj4+Pgo+Pj4+
ICAgICAgICBkcm1fZGV2X3VucGx1ZyhkZXYpOwo+Pj4+ICsgICAgIHR0bV9ib191bm1hcF92aXJ0
dWFsX2FkZHJlc3Nfc3BhY2UoJmFkZXYtPm1tYW4uYmRldik7Cj4+Pj4gICAgICAgIGFtZGdwdV9k
cml2ZXJfdW5sb2FkX2ttcyhkZXYpOwo+Pj4+Cj4+Pj4gICAgICAgIHBjaV9kaXNhYmxlX2Rldmlj
ZShwZGV2KTsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C4D10B281
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2019 16:35:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14C896E312;
	Wed, 27 Nov 2019 15:35:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770073.outbound.protection.outlook.com [40.107.77.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 285216E093;
 Wed, 27 Nov 2019 15:35:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BPs/tAnZp2FFNwODeprUIMrRzef03yM3gmBxgBg00eUtd7NmZ4Vn8TTPF9CqzopUxr/u7KAxmEMj7kn6JK/7iGW6NCpQDUnepYZ0heR3/4hTINXzoQ/KyNBbmYJi+NJzRuXRd171cCVo5L0mo7JrQ/ND5Ngrkam9lKYW3pXXtmEMMWq+teTyWMFJNnPacVdmV/lhnUJ/sG+PZqc+2ZB259/qASZq/in5PH+7C3FdimGdaGDOKrrP8FoyTDQXmJoXDG3eOFrbT23SLSvAD+ryKqlCRnKwQ0wtWiGGMH5WCuwyWxCFgzNNye5MgOSfRta9NgC6HCxC6zXikaovYFc2jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CgT3/1EysHh9Y0hcpSkudffacOhAH9zIGde5K7KXJhQ=;
 b=dftWSkl517bjeb0iYker5rb+6WJP7WzPZ4W9SFoAtKgKV/aogiH/xVGLLvvFqcYUwuhPMSkKrLFEWPEpNFkAnK9IW1INjuZ8INAAPBnY4GHY2wsRvR+TxcUY4Z3ja5Hb1zHOE6YupmgV2wacrPbmcz71SyU10FLhbwDVuIpICW9jmwSxbH2T1AfufRhFwkwfbOCJnZms/mi+mSAH72rFuxsd1zY5NY62PaGcgzpAoFoRPqnRB0m5wqpXmG2DKzCjpv1Q1W7pJTqPVLNG1dWMlM+fPTMXX0MuyKtex+tADja+cgrv4ufmMYkM4RHb+5b7az6Xw5vI/1SINDd6KtC2DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1564.namprd12.prod.outlook.com (10.172.39.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.16; Wed, 27 Nov 2019 15:35:51 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::e5e7:96f0:ad90:d933]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::e5e7:96f0:ad90:d933%7]) with mapi id 15.20.2474.023; Wed, 27 Nov 2019
 15:35:51 +0000
Subject: Re: [PATCH v3 1/2] drm/sched: Avoid job cleanup if sched thread is
 parked.
To: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>,
 Steven Price <steven.price@arm.com>
References: <1574691041-5499-1-git-send-email-andrey.grodzovsky@amd.com>
 <93c692cb-5306-e024-57f1-463402cb2c44@arm.com>
 <c75aff45-2fc6-47da-34e0-a179f1ce5e9a@gmail.com>
 <cdd5de63-ca5a-19c1-0ef3-02916a2655d1@amd.com>
 <b3835ff0-15f0-ead4-0255-3d93fc560c77@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <cfd0c726-94d0-f530-5ef6-47a9e313043a@amd.com>
Date: Wed, 27 Nov 2019 16:35:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <b3835ff0-15f0-ead4-0255-3d93fc560c77@amd.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR0102CA0021.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:14::34) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
MIME-Version: 1.0
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 755ae311-9bac-4dbb-19dd-08d7734f7ba5
X-MS-TrafficTypeDiagnostic: DM5PR12MB1564:|DM5PR12MB1564:
X-MS-Exchange-PUrlCount: 1
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB15641DDED72CE193549C1E0683440@DM5PR12MB1564.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 023495660C
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(376002)(346002)(136003)(396003)(199004)(189003)(4326008)(50466002)(31696002)(6666004)(386003)(6246003)(8936002)(14454004)(7736002)(99286004)(45080400002)(186003)(966005)(8676002)(478600001)(2486003)(23676004)(81166006)(81156014)(305945005)(25786009)(65956001)(31686004)(6506007)(46003)(446003)(6486002)(47776003)(316002)(65806001)(66574012)(53546011)(2870700001)(76176011)(14444005)(229853002)(6116002)(2906002)(36756003)(52116002)(86362001)(2616005)(11346002)(110136005)(6436002)(5660300002)(58126008)(66946007)(6306002)(66476007)(66556008)(6512007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1564;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iwmJMeQ5ynvOeqk/NU7oOntU0JrQFprUhwVUCWCn3aUyFmAkRQ8iJqxK1aiYIyL+1OtwkmwSpo3k9KGhZriCF8kB5Xk0kWdXDyfH0U13Cx/O8Jhcxr2av0dmwO6LPHatpYuxbIYvd1uD5NHvU7Agq+RuWJMfT/nBbmmg/eSilvE8r/15ixF5e5U4ZPxfyU9yPlWL105L+FSo+ri/h0I7s7M5esn/a9VUtbo9hoErMH6fUy5VgFlrBrmgvqq+o4IrOZirJmV2oH45jZulD7vEa/srnQyHNZOoxeoOuBS35nkhFmdgN4UN4ZZLRGi/hM5SEDHWgDZ/FyAj9QF5D+W1CI4lXmW4IVlIPmKPhV68dHoWq1zwa4GajktiisoTivZVgKP/dQPBzj4Ow389OOe88F764UeOM8PPQ3UIZZZbAKBN+CNSDD3rq6xDxLe1bon+dLk46BVezwRHPhlPQe4uvgVCXIDxbSnO7IH+fjh805k=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 755ae311-9bac-4dbb-19dd-08d7734f7ba5
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2019 15:35:51.2051 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ut3uGcRncwJAojCB7xUHgyXBlUV+6tQTuLCj/yFcGWO26eKfa8ju2cVvEnHVTwgi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1564
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CgT3/1EysHh9Y0hcpSkudffacOhAH9zIGde5K7KXJhQ=;
 b=YhTHAkt+Gxov1VPh1q/wc+jVXL5yhit2aDqtmH8mWyrIoT7oLvNKQ8ywtOAJG6n1MJIOo+TpfnBwpY/u1P/Hkjd1yEoO+NMaKyb4D06JHttSDJ9CH5nLfmD2zRUqcUQixXouCeKFPLKlaLmybF2P3ChrSumeNhixEZbeLKfq+I4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Emily.Deng@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjcuMTEuMTkgdW0gMTY6MzIgc2NocmllYiBBbmRyZXkgR3JvZHpvdnNreToKPiBQaW5nLi4u
Cj4KPiBBbmRyZXkKPgo+IE9uIDExLzI2LzE5IDEwOjM2IEFNLCBBbmRyZXkgR3JvZHpvdnNreSB3
cm90ZToKPj4KPj4gT24gMTEvMjYvMTkgNDowOCBBTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToK
Pj4+IEFtIDI1LjExLjE5IHVtIDE3OjUxIHNjaHJpZWIgU3RldmVuIFByaWNlOgo+Pj4+IE9uIDI1
LzExLzIwMTkgMTQ6MTAsIEFuZHJleSBHcm9kem92c2t5IHdyb3RlOgo+Pj4+PiBXaGVuIHRoZSBz
Y2hlZCB0aHJlYWQgaXMgcGFya2VkIHdlIGFzc3VtZSByaW5nX21pcnJvcl9saXN0IGlzCj4+Pj4+
IG5vdCBhY2Nlc3NlZCBmcm9tIGhlcmUuCj4+Pj4gRldJVyBJIGRvbid0IHRoaW5rIHRoaXMgaXMg
bmVjZXNzYXJ5LiBrdGhyZWFkX3BhcmsoKSB3aWxsIHdhaXQgCj4+Pj4gdW50aWwgdGhlCj4+Pj4g
dGhyZWFkIGlzIHBhcmtlZCwgYXQgd2hpY2ggcG9pbnQgdGhlIHRocmVhZCBpcyBzdHVjayBpbiAK
Pj4+PiBrdGhyZWFkX3BhcmttZSgpCj4+Pj4gdW50aWwgdW5wYXJrZWQuCj4+Pj4KPj4+PiBTbyBh
bGwgdGhpcyBkb2VzIGlzIGF2b2lkIHdhaXRpbmcgZm9yIGFueSBjbGVhbnVwIGpvYnMgYmVmb3Jl
IAo+Pj4+IHBhcmtpbmcgLQo+Pj4+IHdoaWNoIG1pZ2h0IGJlIGEgcmVhc29uYWJsZSBnb2FsIGlu
IGl0c2VsZiwgYnV0IGlmIHNvIGxldHMgYXQgbGVhc3QKPj4+PiBkb2N1bWVudCB0aGF0Lgo+Pj4K
Pj4+IE5vdyB0aGF0IHlvdSBtZW50aW9uIGl0IHRoYXQgaXMgaW5kZWVkIHdyb25nLgo+Pgo+Pgo+
PiBJIHdvdWxkbid0IHMgY2FsbCBpdCB3cm9uZyBidXQgc3VwZXJmbHVvdXMgaW4gY3VycmVudCBj
b2RlIGFzIGluZGVlZCAKPj4gb25jZSB0aGUgdGhyZWFkIGlzIHBhcmtlZCB0aGVyZSB3aWxsIGJl
IG5vIHN1YnNlcXVlbnQgY2FsbHMgdG8gCj4+IGRybV9zY2hlZF9nZXRfY2xlYW51cF9qb2IgdW50
aWwgdGhlIHRocmVhZCBpcyB1bnBhY2tlZCBiYWNrLCBpZiBmb3IgCj4+IGV4YW1wbGUgd2UgZGVj
aWRlIHRvIGNhbGwgZHJtX3NjaGVkX2dldF9jbGVhbnVwX2pvYiBmcm9tIGEgd29yayBpdGVtIAo+
PiB3aGljaCBrZWVwcyBzY2hlZHVsZWQgaXQgd291bGQgYmUgbmVlZGVkLgo+Pgo+Pgo+Pj4KPj4+
IFRoZSByZWFsIHByb2JsZW0gaXMgdGhhdCBpbiB0aGUgbWFpbiB0aHJlYWQgd2UgbWFuZ2xlZCB0
aGUgY2FsbCB0byAKPj4+IGt0aHJlYWRfcGFya21lKCkgaW50byBkcm1fc2NoZWRfYmxvY2tlZCgp
IHdoaWNoIGNhbiBiZSBjYWxsZWQgaW4gCj4+PiBhdG9taWMgY29udGV4dC4KPj4KPj4KPj4gV2hl
cmUgaXMgdGhlIGF0b21pYyBjb250ZXh0IGluIHdhaXRfZXZlbnRfaW50ZXJydXB0aWJsZSA/IEkg
c2VlbSBubyAKPj4gdG8gc2VlIGFueS4KCkl0J3MgYSByYXJlIGV2ZW50LCBidXQgdGhlIGNoZWNr
IGNvZGUgaW4gYSB3YWl0X2V2ZW50XyogbWFjcm8gbWlnaHQgYmUgCmNhbGxlZCBpbiBhdG9taWMg
Y29udGV4dC4KClRoYXQncyBhbHNvIHRoZSByZWFzb24gd2h5IFN0ZXZlbiBQcmljZSBjYW1lIHVw
IHdpdGggdGhlIGZvbGxvd2luZyBwYXRjaDoKPiBjb21taXQgNTg4Yjk4MjhmMDc0NGNhMTM1NTVj
NGEzNWNkMDI1MWFjOGFkOGFkMgo+IEF1dGhvcjogU3RldmVuIFByaWNlIDxzdGV2ZW4ucHJpY2VA
YXJtLmNvbT4KPiBEYXRlOsKgwqAgRnJpIE9jdCAyNSAxMTo1MTo1NiAyMDE5ICswMTAwCj4KPiDC
oMKgwqAgZHJtOiBEb24ndCBmcmVlIGpvYnMgaW4gd2FpdF9ldmVudF9pbnRlcnJ1cHRpYmxlKCkK
CkJUVzogSSd2ZSBqdXN0IHB1c2hlZCB0aGUgdjQgb2YgdGhhdCBwYXRjaCB0byBkcm0tbWlzYy1u
ZXh0LgoKQ2hyaXN0aWFuLgoKPj4KPj4gQW5kcmV5Cj4+Cj4+Cj4+Pgo+Pj4gSSBzdWdnZXN0IHRv
IHJld29yayB0aGlzIHNvIHRoYXQgdGhlIGt0aHJlYWRfc2hvdWxkX3BhcmsoKSBhbmQgCj4+PiBr
dGhyZWFkX3Nob3VsZF9zdG9wKCkgdGVzdCBpbiB3YWl0X2V2ZW50X2ludGVycnVwdGlibGUoKSBj
b21lIGZpcnN0IAo+Pj4gYW5kIHRoZW4gY2FsbCBrdGhyZWFkX3BhcmttZSgpIG91dHNpZGUgb2Yg
dGhlIAo+Pj4gd2FpdF9ldmVudF9pbnRlcnJ1cHRpYmxlKCkuCj4+Pgo+Pj4gUmVnYXJkcywKPj4+
IENocmlzdGlhbi4KPj4+Cj4+Pj4KPj4+PiBTdGV2ZQo+Pj4+Cj4+Pj4+IFNpZ25lZC1vZmYtYnk6
IEFuZHJleSBHcm9kem92c2t5IDxhbmRyZXkuZ3JvZHpvdnNreUBhbWQuY29tPgo+Pj4+PiBSZXZp
ZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+Pj4+
PiAtLS0KPj4+Pj4gwqAgZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMgfCAx
MCArKysrKysrLS0tCj4+Pj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDMg
ZGVsZXRpb25zKC0pCj4+Pj4+Cj4+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc2No
ZWR1bGVyL3NjaGVkX21haW4uYyAKPj4+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3Nj
aGVkX21haW4uYwo+Pj4+PiBpbmRleCBkNGNjNzI4Li42Nzc0OTU1IDEwMDY0NAo+Pj4+PiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYwo+Pj4+PiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYwo+Pj4+PiBAQCAtNjM1LDkgKzYzNSwx
MyBAQCBkcm1fc2NoZWRfZ2V0X2NsZWFudXBfam9iKHN0cnVjdCAKPj4+Pj4gZHJtX2dwdV9zY2hl
ZHVsZXIgKnNjaGVkKQo+Pj4+PiDCoMKgwqDCoMKgIHN0cnVjdCBkcm1fc2NoZWRfam9iICpqb2I7
Cj4+Pj4+IMKgwqDCoMKgwqAgdW5zaWduZWQgbG9uZyBmbGFnczsKPj4+Pj4gwqAgLcKgwqDCoCAv
KiBEb24ndCBkZXN0cm95IGpvYnMgd2hpbGUgdGhlIHRpbWVvdXQgd29ya2VyIGlzIHJ1bm5pbmcg
Ki8KPj4+Pj4gLcKgwqDCoCBpZiAoc2NoZWQtPnRpbWVvdXQgIT0gTUFYX1NDSEVEVUxFX1RJTUVP
VVQgJiYKPj4+Pj4gLcKgwqDCoMKgwqDCoMKgICFjYW5jZWxfZGVsYXllZF93b3JrKCZzY2hlZC0+
d29ya190ZHIpKQo+Pj4+PiArwqDCoMKgIC8qCj4+Pj4+ICvCoMKgwqAgKiBEb24ndCBkZXN0cm95
IGpvYnMgd2hpbGUgdGhlIHRpbWVvdXQgd29ya2VyIGlzIHJ1bm5pbmcgT1IgCj4+Pj4+IHRocmVh
ZAo+Pj4+PiArwqDCoMKgICogaXMgYmVpbmcgcGFya2VkIGFuZCBoZW5jZSBhc3N1bWVkIHRvIG5v
dCB0b3VjaCAKPj4+Pj4gcmluZ19taXJyb3JfbGlzdAo+Pj4+PiArwqDCoMKgICovCj4+Pj4+ICvC
oMKgwqAgaWYgKChzY2hlZC0+dGltZW91dCAhPSBNQVhfU0NIRURVTEVfVElNRU9VVCAmJgo+Pj4+
PiArwqDCoMKgwqDCoMKgwqDCoCAhY2FuY2VsX2RlbGF5ZWRfd29yaygmc2NoZWQtPndvcmtfdGRy
KSkgfHwKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqAgX19rdGhyZWFkX3Nob3VsZF9wYXJrKHNjaGVk
LT50aHJlYWQpKQo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIE5VTEw7Cj4+Pj4+IMKg
IMKgwqDCoMKgwqAgc3Bpbl9sb2NrX2lycXNhdmUoJnNjaGVkLT5qb2JfbGlzdF9sb2NrLCBmbGFn
cyk7Cj4+Pj4+Cj4+Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPj4+PiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+Pj4+IGFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCj4+Pj4gaHR0cHM6Ly9uYW0xMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29r
LmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGbGlzdHMuZnJlZWRlc2t0b3Aub3JnJTJGbWFpbG1hbiUy
Rmxpc3RpbmZvJTJGYW1kLWdmeCZhbXA7ZGF0YT0wMiU3QzAxJTdDYW5kcmV5Lmdyb2R6b3Zza3kl
NDBhbWQuY29tJTdDZTgxYTgyNGE1Zjk4NGY1MWJjMTkwOGQ3NzI1MDNhMjUlN0MzZGQ4OTYxZmU0
ODg0ZTYwOGUxMWE4MmQ5OTRlMTgzZCU3QzAlN0MwJTdDNjM3MTAzNTYxMjIxMjk4NjkxJmFtcDtz
ZGF0YT10VzlYdXB0N2FzY1ZQT2xIeEgwcEhHY2JVQXJWeVRhNVZUbGUwMTZBY0dnJTNEJmFtcDty
ZXNlcnZlZD0wIAo+Pj4+Cj4+PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs

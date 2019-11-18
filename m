Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA9010045B
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 12:38:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FE966E48D;
	Mon, 18 Nov 2019 11:38:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790084.outbound.protection.outlook.com [40.107.79.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBF576E48C;
 Mon, 18 Nov 2019 11:38:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LvEqyVgq9cQ4Kqp7GyCnDVpOqe511G1Xpz75So+u79g5K6PlK2rV47eWYSzICvNAafGLf3w/qYSAVyYMshQt6dedRHDNUzNaZL/rBcOmFHdkJOBtjg1BAuXVZI6CVAvW7A7Hz+QuHIOdurnQrBmMi462uBV2WvpXwSvuR9xVHeR1LqYzU5YhUwmZI6/DEhB2Z/gFnyDxJKzsX+OlwFLstksV7dTDSuxI20F0x19smA19WXN2AFWueVzZopzO9MzsvcmYo4ervZ4gC8DgkNgbZXLrLduH3Q+/sqVRtOO6YT1T7lGIHPeHByFpdCYMD3/5MP6qPtvf0f0Wygu1xTsOcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YzQXw5Hs18dVdD9R3TFXZF/EIXbhEBg80eOY4DwREec=;
 b=KoWhIDBI9NpsTJYuyW+Gk01My8Zo/CcxpA3KkXeWxsXa+HkLEj4aPavDNf0uc385kB+Ng39sejHf+fQOuYJ2H7estGFg3qXFuwvDEat78n986yc4WHh+r9kZpLxJkNLACgFP45RvE7l/i60gXyj/SvTPpB0P5bTrB1G6ZhcYjJ5t8AdcuYXpsKf8HBhzhG/uZkj53DAGiSMthFpWzuHum0uJ1m3sVdpjXPC0mEz84QI8MW7bMgoo57bwmKqwOh4vKNvm3KAus7Ai+a3I2WxDTjO+SSWicPyYDuWToljuVHn0h9iEI228k/AUNvqibPIRBOm81ny9BSyIfqY5KZ32uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1308.namprd12.prod.outlook.com (10.168.238.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.23; Mon, 18 Nov 2019 11:38:20 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::e5e7:96f0:ad90:d933]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::e5e7:96f0:ad90:d933%7]) with mapi id 15.20.2451.029; Mon, 18 Nov 2019
 11:38:20 +0000
Subject: Re: [PATCH 06/15] drm/i915: Drop dma_buf->k(un)map
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20191118103536.17675-1-daniel.vetter@ffwll.ch>
 <20191118103536.17675-7-daniel.vetter@ffwll.ch>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <b08cffee-5070-32bc-7304-15461ba5e814@amd.com>
Date: Mon, 18 Nov 2019 12:38:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20191118103536.17675-7-daniel.vetter@ffwll.ch>
Content-Language: en-US
X-ClientProxiedBy: AM0PR0402CA0025.eurprd04.prod.outlook.com
 (2603:10a6:208:15::38) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
MIME-Version: 1.0
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2cae0069-8177-471b-659a-08d76c1bd012
X-MS-TrafficTypeDiagnostic: DM5PR12MB1308:
X-Microsoft-Antispam-PRVS: <DM5PR12MB1308F699978A466BCB54A35A834D0@DM5PR12MB1308.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-Forefront-PRVS: 0225B0D5BC
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(136003)(366004)(346002)(39860400002)(189003)(199004)(305945005)(6666004)(8676002)(81156014)(81166006)(66556008)(8936002)(66476007)(66946007)(6512007)(31686004)(23676004)(76176011)(2486003)(2906002)(6436002)(6486002)(229853002)(478600001)(486006)(6506007)(186003)(446003)(2870700001)(52116002)(46003)(476003)(2616005)(11346002)(99286004)(14444005)(58126008)(316002)(54906003)(110136005)(86362001)(31696002)(6116002)(386003)(6246003)(14454004)(66574012)(7736002)(25786009)(47776003)(65806001)(65956001)(36756003)(5660300002)(50466002)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1308;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 29F591Z6xcf/DBLhJ/U30hJTbyoaez+V5EgZP/BtbaUMNrXwusRkakqtUrxzmFGyYxCexClY9912FZtn81xQUjIPQjlqS5pZDgfknVLeLiE30EAM/oLOUybuK/aw4bgTkuAiPbQEpLd/tgQzUKxtVScBX0o+wHVMB85zhXzL2Pj2BPR+C3j03xIHCwPWIzvtNX9i32Mtsrvxyg/XVONFIpH5LnFI1ZUnJodhcwrGpCSlJYZO7kHWMpkaUy1rRq7iObXzyYboG+L2RN622bn1NL4S0Ju+QyyVXiCbXxu1xEYAT7NxMNNQ5hiW2cqDEWlxV1+rCDByIXJJcThUrpb+027iuxO2/yQr1YHB1AQ7VqAXuZ/zKFq9itIUL9jhqcRIbDQeD9QLY0TLbp+LYjmfIgn/efEnsi2YAIV3imBQmeioEOjzMfLYTxUzqLuYmEDJ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cae0069-8177-471b-659a-08d76c1bd012
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2019 11:38:20.8547 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1v8EReOSJf20ODMSTcvfPoUTU/iJJmhGAdvo7LTc4g1MlRVKAIY9wX5Z+DKDU39p
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1308
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YzQXw5Hs18dVdD9R3TFXZF/EIXbhEBg80eOY4DwREec=;
 b=Y30b+2uG6eV4wxNHgpqyskn+exEYljZonXVpZhWIFk1dUgqelDY0mBbYf819ytJ3DBgdaCCZz/O5C/RPhYSuALzjfVVDkwFvgNFuSXoFqLUJOB1HGhYVQKXxS5AZGAZmvSJjjfTh7E36GG2tDPpDhtY7vOHJKUPX+t872LaE2PQ=
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTguMTEuMTkgdW0gMTE6MzUgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE5vIGluLXRyZWUg
dXNlcnMgbGVmdC4KCkdvb2QgdG8ga25vdywgdGhhbmtzLgoKPgo+IEFzaWRlLCBJIHRoaW5rIG1v
Y2tfZG1hYnVmIHdvdWxkIGJlIGEgbmljZSBhZGRpdGlvbiB0byBkcm0KPiBtb2NrL3NlbGZ0ZXN0
IGhlbHBlcnMgKHdlIGhhdmUgc29tZSBhbHJlYWR5KSwgd2l0aCBhbgo+IEVYUE9SVF9TWU1CT0xf
Rk9SX1RFU1RTX09OTFkuCj4KPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwu
dmV0dGVyQGludGVsLmNvbT4KPiBDYzogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24u
Y28udWs+Cj4gQ2M6IE1hdHRoZXcgQXVsZCA8bWF0dGhldy5hdWxkQGludGVsLmNvbT4KPiBDYzog
RGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KPiBDYzogSmFuaSBOaWt1bGEg
PGphbmkubmlrdWxhQGludGVsLmNvbT4KPiBDYzogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcu
b3JnPgo+IENjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4K
CkFja2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cgo+
IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX2RtYWJ1Zi5jICAgIHwg
MzYgLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICAgLi4uL2dwdS9kcm0vaTkxNS9nZW0vc2VsZnRlc3Rz
L21vY2tfZG1hYnVmLmMgIHwgMTYgLS0tLS0tLS0tCj4gICAyIGZpbGVzIGNoYW5nZWQsIDUyIGRl
bGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1
X2dlbV9kbWFidWYuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9kbWFidWYu
Ywo+IGluZGV4IGVhZWE0OWQwOGViNS4uMzcyYjU3Y2EwZWZjIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9kbWFidWYuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9kbWFidWYuYwo+IEBAIC05Myw0MCArOTMsNiBAQCBzdGF0
aWMgdm9pZCBpOTE1X2dlbV9kbWFidWZfdnVubWFwKHN0cnVjdCBkbWFfYnVmICpkbWFfYnVmLCB2
b2lkICp2YWRkcikKPiAgIAlpOTE1X2dlbV9vYmplY3RfdW5waW5fbWFwKG9iaik7Cj4gICB9Cj4g
ICAKPiAtc3RhdGljIHZvaWQgKmk5MTVfZ2VtX2RtYWJ1Zl9rbWFwKHN0cnVjdCBkbWFfYnVmICpk
bWFfYnVmLCB1bnNpZ25lZCBsb25nIHBhZ2VfbnVtKQo+IC17Cj4gLQlzdHJ1Y3QgZHJtX2k5MTVf
Z2VtX29iamVjdCAqb2JqID0gZG1hX2J1Zl90b19vYmooZG1hX2J1Zik7Cj4gLQlzdHJ1Y3QgcGFn
ZSAqcGFnZTsKPiAtCj4gLQlpZiAocGFnZV9udW0gPj0gb2JqLT5iYXNlLnNpemUgPj4gUEFHRV9T
SElGVCkKPiAtCQlyZXR1cm4gTlVMTDsKPiAtCj4gLQlpZiAoIWk5MTVfZ2VtX29iamVjdF9oYXNf
c3RydWN0X3BhZ2Uob2JqKSkKPiAtCQlyZXR1cm4gTlVMTDsKPiAtCj4gLQlpZiAoaTkxNV9nZW1f
b2JqZWN0X3Bpbl9wYWdlcyhvYmopKQo+IC0JCXJldHVybiBOVUxMOwo+IC0KPiAtCS8qIFN5bmNo
cm9uaXNhdGlvbiBpcyBsZWZ0IHRvIHRoZSBjYWxsZXIgKHZpYSAuYmVnaW5fY3B1X2FjY2Vzcygp
KSAqLwo+IC0JcGFnZSA9IGk5MTVfZ2VtX29iamVjdF9nZXRfcGFnZShvYmosIHBhZ2VfbnVtKTsK
PiAtCWlmIChJU19FUlIocGFnZSkpCj4gLQkJZ290byBlcnJfdW5waW47Cj4gLQo+IC0JcmV0dXJu
IGttYXAocGFnZSk7Cj4gLQo+IC1lcnJfdW5waW46Cj4gLQlpOTE1X2dlbV9vYmplY3RfdW5waW5f
cGFnZXMob2JqKTsKPiAtCXJldHVybiBOVUxMOwo+IC19Cj4gLQo+IC1zdGF0aWMgdm9pZCBpOTE1
X2dlbV9kbWFidWZfa3VubWFwKHN0cnVjdCBkbWFfYnVmICpkbWFfYnVmLCB1bnNpZ25lZCBsb25n
IHBhZ2VfbnVtLCB2b2lkICphZGRyKQo+IC17Cj4gLQlzdHJ1Y3QgZHJtX2k5MTVfZ2VtX29iamVj
dCAqb2JqID0gZG1hX2J1Zl90b19vYmooZG1hX2J1Zik7Cj4gLQo+IC0Ja3VubWFwKHZpcnRfdG9f
cGFnZShhZGRyKSk7Cj4gLQlpOTE1X2dlbV9vYmplY3RfdW5waW5fcGFnZXMob2JqKTsKPiAtfQo+
IC0KPiAgIHN0YXRpYyBpbnQgaTkxNV9nZW1fZG1hYnVmX21tYXAoc3RydWN0IGRtYV9idWYgKmRt
YV9idWYsIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKQo+ICAgewo+ICAgCXN0cnVjdCBkcm1f
aTkxNV9nZW1fb2JqZWN0ICpvYmogPSBkbWFfYnVmX3RvX29iaihkbWFfYnVmKTsKPiBAQCAtMTk1
LDggKzE2MSw2IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZG1hX2J1Zl9vcHMgaTkxNV9kbWFidWZf
b3BzID0gIHsKPiAgIAkubWFwX2RtYV9idWYgPSBpOTE1X2dlbV9tYXBfZG1hX2J1ZiwKPiAgIAku
dW5tYXBfZG1hX2J1ZiA9IGk5MTVfZ2VtX3VubWFwX2RtYV9idWYsCj4gICAJLnJlbGVhc2UgPSBk
cm1fZ2VtX2RtYWJ1Zl9yZWxlYXNlLAo+IC0JLm1hcCA9IGk5MTVfZ2VtX2RtYWJ1Zl9rbWFwLAo+
IC0JLnVubWFwID0gaTkxNV9nZW1fZG1hYnVmX2t1bm1hcCwKPiAgIAkubW1hcCA9IGk5MTVfZ2Vt
X2RtYWJ1Zl9tbWFwLAo+ICAgCS52bWFwID0gaTkxNV9nZW1fZG1hYnVmX3ZtYXAsCj4gICAJLnZ1
bm1hcCA9IGk5MTVfZ2VtX2RtYWJ1Zl92dW5tYXAsCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2dlbS9zZWxmdGVzdHMvbW9ja19kbWFidWYuYyBiL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2dlbS9zZWxmdGVzdHMvbW9ja19kbWFidWYuYwo+IGluZGV4IGI5ZTA1OWQ0MzI4YS4uOTI3
MmJlZjU3MDkyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9zZWxmdGVz
dHMvbW9ja19kbWFidWYuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9zZWxmdGVz
dHMvbW9ja19kbWFidWYuYwo+IEBAIC03NiwyMCArNzYsNiBAQCBzdGF0aWMgdm9pZCBtb2NrX2Rt
YWJ1Zl92dW5tYXAoc3RydWN0IGRtYV9idWYgKmRtYV9idWYsIHZvaWQgKnZhZGRyKQo+ICAgCXZt
X3VubWFwX3JhbSh2YWRkciwgbW9jay0+bnBhZ2VzKTsKPiAgIH0KPiAgIAo+IC1zdGF0aWMgdm9p
ZCAqbW9ja19kbWFidWZfa21hcChzdHJ1Y3QgZG1hX2J1ZiAqZG1hX2J1ZiwgdW5zaWduZWQgbG9u
ZyBwYWdlX251bSkKPiAtewo+IC0Jc3RydWN0IG1vY2tfZG1hYnVmICptb2NrID0gdG9fbW9jayhk
bWFfYnVmKTsKPiAtCj4gLQlyZXR1cm4ga21hcChtb2NrLT5wYWdlc1twYWdlX251bV0pOwo+IC19
Cj4gLQo+IC1zdGF0aWMgdm9pZCBtb2NrX2RtYWJ1Zl9rdW5tYXAoc3RydWN0IGRtYV9idWYgKmRt
YV9idWYsIHVuc2lnbmVkIGxvbmcgcGFnZV9udW0sIHZvaWQgKmFkZHIpCj4gLXsKPiAtCXN0cnVj
dCBtb2NrX2RtYWJ1ZiAqbW9jayA9IHRvX21vY2soZG1hX2J1Zik7Cj4gLQo+IC0JcmV0dXJuIGt1
bm1hcChtb2NrLT5wYWdlc1twYWdlX251bV0pOwo+IC19Cj4gLQo+ICAgc3RhdGljIGludCBtb2Nr
X2RtYWJ1Zl9tbWFwKHN0cnVjdCBkbWFfYnVmICpkbWFfYnVmLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1
Y3QgKnZtYSkKPiAgIHsKPiAgIAlyZXR1cm4gLUVOT0RFVjsKPiBAQCAtOTksOCArODUsNiBAQCBz
dGF0aWMgY29uc3Qgc3RydWN0IGRtYV9idWZfb3BzIG1vY2tfZG1hYnVmX29wcyA9ICB7Cj4gICAJ
Lm1hcF9kbWFfYnVmID0gbW9ja19tYXBfZG1hX2J1ZiwKPiAgIAkudW5tYXBfZG1hX2J1ZiA9IG1v
Y2tfdW5tYXBfZG1hX2J1ZiwKPiAgIAkucmVsZWFzZSA9IG1vY2tfZG1hYnVmX3JlbGVhc2UsCj4g
LQkubWFwID0gbW9ja19kbWFidWZfa21hcCwKPiAtCS51bm1hcCA9IG1vY2tfZG1hYnVmX2t1bm1h
cCwKPiAgIAkubW1hcCA9IG1vY2tfZG1hYnVmX21tYXAsCj4gICAJLnZtYXAgPSBtb2NrX2RtYWJ1
Zl92bWFwLAo+ICAgCS52dW5tYXAgPSBtb2NrX2RtYWJ1Zl92dW5tYXAsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F162126D9E6
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 13:12:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27F9E6EBD0;
	Thu, 17 Sep 2020 11:12:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2084.outbound.protection.outlook.com [40.107.92.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 696BA6EBD0
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 11:12:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hUlvEs+DF+4V756W/bYHI2tLF0sbtsSH8VYC+lWWGFxe0z2/Podp10UYl6Ftb4wwIizsOZFs/gBZPM/ntAqva1EYGz+jqbfAyXyVO4cOLYSrFkluP425lcdGZqDKiEPmf1BXKTDWA8PR+4LFV7BHxn++r2zmuK8OXRbE1UdsgyuAl+7YoEUjkPr73faaCq+yx6Xpl74uL4W4UOKUExcUyXqaSR7mXSSbHQdRD0nw/ec6O341ZOFKbruZlksukGpIO6b7yxKnG8YtqOsWmm9NtmO1ZoBEJ/JneJ25shZuNs/Efb4JjdPfGRCSgsfJ88rXNJ/fCzCVuG4JQuutt3yH8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fac8TUoxbgMheWTmUdvDm/ePlJUgKdSG0HuyqttLQ14=;
 b=lNyc1d2Hd7Fw58OFyC5JZwqjVXydHodvCg8uaiyrhRMdbxKm9QIBg7zY3dACMz1CDq17lBQtCkFe0yFlqjjb280f00/SLdjun6iVUcETY19/NdN+ciuUeXQph+xyNxCWvL58Ak64wkWTF0otAt+1d2Cdl4ZsZ2c0WsQiscHs/VV7BJIcjqWqmX644GVztytpThBwJaAyC2K5GNKcYuzTn1e4rTyAhlRHckf6vA8vu1TfD6dkgDIlc7N6poi3S2IE1Kq0209ZWJqfCp0pV7OMAuVtENicLw4S2vyjvWhLqkEGliikchp3YXwjKPvOZt+jDcR3zkMtmMiVuwa41SwwNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fac8TUoxbgMheWTmUdvDm/ePlJUgKdSG0HuyqttLQ14=;
 b=cuz/H8RztYI4gAeYqTVn6mnLwX+dwGaEfAD/udE0CSx49V7axw+Xh09rlG26ymz0L5UjDUV9KuxoCxM2hLbmbiP8BGLNsZS0orbEOg/bL5fKSidVf2pBSESxwRvaCxpelMmWsvCXsjaWulX22JbQ5JKvvRFFbDbt9L1Arj+9ECs=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3935.namprd12.prod.outlook.com (2603:10b6:208:168::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Thu, 17 Sep
 2020 11:12:07 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3391.014; Thu, 17 Sep 2020
 11:12:07 +0000
Subject: Re: [PATCH 6/8] drm/vram-helper: don't use ttm bo->offset v4
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Nirmoy Das <nirmoy.aiemd@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200624182648.6976-1-nirmoy.das@amd.com>
 <20200624182648.6976-7-nirmoy.das@amd.com>
 <0f0520f2-3994-8ea8-b7ef-11135c148533@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <98c70355-1e01-a10c-099c-0a37dac5856f@amd.com>
Date: Thu, 17 Sep 2020 13:12:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <0f0520f2-3994-8ea8-b7ef-11135c148533@suse.de>
Content-Language: en-US
X-ClientProxiedBy: AM4PR0701CA0012.eurprd07.prod.outlook.com
 (2603:10a6:200:42::22) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4PR0701CA0012.eurprd07.prod.outlook.com (2603:10a6:200:42::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.4 via Frontend
 Transport; Thu, 17 Sep 2020 11:12:05 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7c8ed58e-1f6e-410f-38e0-08d85afa83e9
X-MS-TrafficTypeDiagnostic: MN2PR12MB3935:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3935F83EC840C049A680EEA8833E0@MN2PR12MB3935.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hntV/SmQsvXOtNnXuSH3PGioQukDym/bEOHxnp9ycTIUbZOy8MmyAMzTqr9Ss9Nk1U+YGi6S9xzELglOd2LTDn6qFBCC5GHdMbNyazSC0fZGXhJSn6zT9echu7bxr7x9Dw0svK4Boeos72MCzUsUqslePPGXCB0pc8ORgwXOXlWgGlpgHU3CboSGVhv04611Qv+jRi2b4kcwG2fDXLcufj7k1isnrDg44r5gNnIKEr9WYaREoFxORbT6eICmWukGSBFIeAGBWxnJjWTrEMgbdJAmLsus6AedVq4oa1FTKNqWwm570b57KVAz4actGzzWEK/X8/hq9OMP1XcCGk4cGQkKfv1qPpAiIiL2b4RLHnFB0dcaHF5H43+/c+zHD8DI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(366004)(39860400002)(396003)(136003)(2616005)(86362001)(5660300002)(36756003)(110136005)(66476007)(4326008)(31696002)(52116002)(6666004)(8676002)(66946007)(66556008)(478600001)(8936002)(6486002)(7416002)(16526019)(2906002)(45080400002)(186003)(83380400001)(31686004)(316002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 1qhuEr4lJ8kOic8+I5STDWEon+01MDjpqShTrdqLDarCyjTPmLY6UeDrP6NqVVXk7veC7KI1eCxZi10+RW6rD362K4+pE43nuce5zCDGuTwhl/eEHqpU/gvDFcwZV6HgM4Ga0DOUUg7LPTv0deKPQZUjFvC6h3i4FIYxhO9xjqjOddqTKzFnS5XL9ckGZ2Tf/VqF3cSOG6jrHaJK5mAZw7MuTcL0UD3QhQgXuE/rV8Ep4iCbVTWf8lnH5qzZ6ePn75sLvsX05X5e+Q6u86qam2EZe+M+A0Bc/ezrOvi4spMXKbkVEQUwOI7Dn4NPgs07EHuptu+/cLQvTisjaaoLmTxgDRcxqESEiMEvP53TUbLGkVVLnq9Li59Mi2Hq+dPz6SsM0R0/FzUDMEg0gvDNn1ktBvAdUCSnf/KZlkgYOyKZvfH+JL/9uJAHhzwiU0Tx2klWd5vtakuBOZV6nHucbfkSMaiKHCP+d4GWMYmWleeiGmXXCdKhy5h9EFPHDz6JY7OTU9+GOQPcz61VujYq41biA4jDh+1HeO4FCSKSQu/whL88+zXsIEX+sygGauW/DXphnsCeN+KzuVVsV6C9vq2nyWiK6xH9fnUj7FdDBgbPkmQIhjlmMrEP3NQkBFdPaVzL+FRsgvUdNNXdqfVrkH296jcigmmBiM8CsL0Kk6eJVEJlJ+NSmBeJC5tM23qbdSLzD+X/At9/coYFTii7Sg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c8ed58e-1f6e-410f-38e0-08d85afa83e9
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2020 11:12:07.6067 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Q5pJRPHNe1CE6w3aLYvYrpQn6CkalaV//b1m+y3VMh9uu8rUaZYz93Z8aj4tBA8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3935
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
Cc: sashal@kernel.org, thellstrom@vmware.com, airlied@linux.ie,
 kenny.ho@amd.com, brian.welty@intel.com, nirmoy.das@amd.com,
 linux-graphics-maintainer@vmware.com, bskeggs@redhat.com,
 Daniel Vetter <daniel.vetter@ffwll.ch>, alexander.deucher@amd.com,
 sean@poorly.run, kraxel@redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVGhvbWFzLAoKQW0gMTcuMDkuMjAgdW0gMTI6NTEgc2NocmllYiBUaG9tYXMgWmltbWVybWFu
bjoKPiBIaQo+Cj4gQW0gMjQuMDYuMjAgdW0gMjA6MjYgc2NocmllYiBOaXJtb3kgRGFzOgo+PiBD
YWxjdWxhdGUgR0VNIFZSQU0gYm8ncyBvZmZzZXQgd2l0aGluIHZyYW0taGVscGVyIHdpdGhvdXQg
ZGVwZW5kaW5nIG9uCj4+IGJvLT5vZmZzZXQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IE5pcm1veSBE
YXMgPG5pcm1veS5kYXNAYW1kLmNvbT4KPj4gUmV2aWV3ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRh
bmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cj4+IC0tLQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2Vt
X3ZyYW1faGVscGVyLmMgfCAxMSArKysrKysrKysrLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxMCBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fdnJh
bV9oZWxwZXIuYwo+PiBpbmRleCAwMDIzY2UxZDJjZjcuLmFkMDk2NjAwZDg5ZiAxMDA2NDQKPj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuYwo+PiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5jCj4+IEBAIC0yODEsNiArMjgxLDE1IEBA
IHU2NCBkcm1fZ2VtX3ZyYW1fbW1hcF9vZmZzZXQoc3RydWN0IGRybV9nZW1fdnJhbV9vYmplY3Qg
KmdibykKPj4gICB9Cj4+ICAgRVhQT1JUX1NZTUJPTChkcm1fZ2VtX3ZyYW1fbW1hcF9vZmZzZXQp
Owo+PiAgIAo+PiArc3RhdGljIHU2NCBkcm1fZ2VtX3ZyYW1fcGdfb2Zmc2V0KHN0cnVjdCBkcm1f
Z2VtX3ZyYW1fb2JqZWN0ICpnYm8pCj4+ICt7Cj4+ICsJLyogS2VlcCBUVE0gYmVoYXZpb3IgZm9y
IG5vdywgcmVtb3ZlIHdoZW4gZHJpdmVycyBhcmUgYXVkaXRlZCAqLwo+PiArCWlmIChXQVJOX09O
X09OQ0UoIWdiby0+Ym8ubWVtLm1tX25vZGUpKQo+IEF0IHRoaXMgbGluZSBJIGdvdAoKU291bmRz
IGxpa2UgYXN0IGZvcmdvdCB0byBwaW4gdGhlIGN1cnNvciB0byBWUkFNLgoKSWYgeW91IGxvb2sg
YXQgYXN0X2N1cnNvcl9wYWdlX2ZsaXAoKSwgeW91IHNlZToKPiDCoMKgwqDCoMKgwqDCoCBvZmYg
PSBkcm1fZ2VtX3ZyYW1fb2Zmc2V0KGdibyk7Cj4gwqDCoMKgwqDCoMKgwqAgaWYgKGRybV9XQVJO
X09OX09OQ0UoZGV2LCBvZmYgPCAwKSkKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
cmV0dXJuOyAvKiBCdWc6IHdlIGRpZG4ndCBwaW4gdGhlIGN1cnNvciBIVyBCTyB0byBWUkFNLiAq
LwoKVGhlIGRybV9XQVJOX09OX09OQ0UoKSBqdXN0IG5ldmVyIHRyaWdnZXJlZCBiZWZvcmUgYmVj
YXVzZSBpdCBjaGVja3MgZm9yIAp0aGUgd3JvbmcgY29uZGl0aW9uIChvZmYgPCAwKS4KClJlZ2Fy
ZHMsCkNocmlzdGlhbi4KCj4KPiBbICAxNDYuMTMzODIxXSAtLS0tLS0tLS0tLS1bIGN1dCBoZXJl
IF0tLS0tLS0tLS0tLS0KPiBbICAxNDYuMTMzODcyXSBXQVJOSU5HOiBDUFU6IDYgUElEOiA3IGF0
Cj4gZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuYzoyODQgZHJtX2dlbV92cmFt
X29mZnNldCsweDU5LzB4NjAKPiBbZHJtX3ZyYW1faGVscGVyXQo+IFsgIDE0Ni4xMzM4ODBdIE1v
ZHVsZXMgbGlua2VkIGluOiBmdXNlKEUpIGFmX3BhY2tldChFKSBlYnRhYmxlX2ZpbHRlcihFKQo+
IGVidGFibGVzKEUpIGlwNnRhYmxlX2ZpbHRlcihFKSBpcDZfdGFibGVzKEUpIGlwdGFibGVfZmls
dGVyKEUpCj4gaXBfdGFibGVzKEUpIHhfdGFibGVzKEUpIGJwZmlsdGVyKEUpIHJma2lsbChFKSBk
bWlfc3lzZnMoRSkgbXNyKEUpCj4gaW50ZWxfcG93ZXJjbGFtcChFKSBjb3JldGVtcChFKSBrdikK
PiBbICAxNDYuMTM0MDUxXSAgc2NzaV9kaF9lbWMoRSkgc2NzaV9kaF9hbHVhKEUpCj4gWyAgMTQ2
LjEzNDA3NF0gQ1BVOiA2IFBJRDogNyBDb21tOiBrd29ya2VyL3U0ODowIFRhaW50ZWQ6IEcgICAg
ICAgICAgICBFCj4gICAgICA1LjkuMC1yYzQtMS1kZWZhdWx0KyAjNDkyCj4gWyAgMTQ2LjEzNDA4
M10gSGFyZHdhcmUgbmFtZTogU3VuIE1pY3Jvc3lzdGVtcyBTVU4gRklSRSBYMjI3MCBNMi9TVU4K
PiBGSVJFIFgyMjcwIE0yLCBCSU9TIDIuMDUgICAgMDcvMDEvMjAxMAo+IFsgIDE0Ni4xMzQwOTld
IFdvcmtxdWV1ZTogZXZlbnRzX3VuYm91bmQgY29tbWl0X3dvcmsKPiBbICAxNDYuMTM0MTE2XSBS
SVA6IDAwMTA6ZHJtX2dlbV92cmFtX29mZnNldCsweDU5LzB4NjAgW2RybV92cmFtX2hlbHBlcl0K
PiBbICAxNDYuMTM0MTI4XSBDb2RlOiAwMiAwMCAwMCAwMCA3NCAyNCA0OCA4ZCBiYiA4MCAwMiAw
MCAwMCBlOCBlZiAyNyAxNwo+IGQ3IDQ4IDhiIDgzIDgwIDAyIDAwIDAwIDViIDQ4IGMxIGUwIDBj
IGMzIDBmIDBiIDQ4IGM3IGMwIGVkIGZmIGZmIGZmIDViCj4gYzMgPDBmPiAwYiAzMSBjMCA1YiBj
MyA5MCA2NiA2NiA2NiA2NiA5MCA0MSA1NiA0MSA1NSA0OSA4OSBkNSA0MSA1NCA0OQo+IFsgIDE0
Ni4xMzQxMzddIFJTUDogMDAxODpmZmZmYzkwMDAwMTA3YzM4IEVGTEFHUzogMDAwMTAyNDYKPiBb
ICAxNDYuMTM0MTQ5XSBSQVg6IDAwMDAwMDAwMDAwMDAwMDAgUkJYOiBmZmZmODg4MTExMTU1MDAw
IFJDWDoKPiBmZmZmZmZmZmMwMzIzMjNiCj4gWyAgMTQ2LjEzNDE1OF0gUkRYOiBkZmZmZmMwMDAw
MDAwMDAwIFJTSTogZmZmZjg4ODEwZTIzNjMwMCBSREk6Cj4gZmZmZjg4ODExMTE1NTI3OAo+IFsg
IDE0Ni4xMzQxNjhdIFJCUDogZmZmZjg4ODEwOTA5MDAwMCBSMDg6IGZmZmZmZmZmYzAzMjMyMjUg
UjA5Ogo+IDAwMDAwMDAwMDAwMDAwMDIKPiBbICAxNDYuMTM0MTc3XSBSMTA6IGZmZmZlZDEwMjA2
NzUwMjAgUjExOiAwMDAwMDAwMDAwMDAwMDAxIFIxMjoKPiBmZmZmODg4MTA5MDkxMDUwCj4gWyAg
MTQ2LjEzNDE4N10gUjEzOiBmZmZmODg4MTBlMjM2MzAwIFIxNDogZmZmZjg4ODEwOTA5MDAwMCBS
MTU6Cj4gMDAwMDAwMDAwMDAwMDAwMAo+IFsgIDE0Ni4xMzQxOTddIEZTOiAgMDAwMDAwMDAwMDAw
MDAwMCgwMDAwKSBHUzpmZmZmODg4MTE2MDAwMDAwKDAwMDApCj4ga25sR1M6MDAwMDAwMDAwMDAw
MDAwMAo+IFsgIDE0Ni4xMzQyMDZdIENTOiAgMDAxMCBEUzogMDAwMCBFUzogMDAwMCBDUjA6IDAw
MDAwMDAwODAwNTAwMzMKPiBbICAxNDYuMTM0MjE1XSBDUjI6IDAwMDA3ZjYwNTQ3ZDkxMDAgQ1Iz
OiAwMDAwMDAwMDI5MjE2MDAyIENSNDoKPiAwMDAwMDAwMDAwMDIwNmUwCj4gWyAgMTQ2LjEzNDIy
M10gQ2FsbCBUcmFjZToKPiBbICAxNDYuMTM0MjQ1XSAgYXN0X2N1cnNvcl9wYWdlX2ZsaXArMHgz
ZS8weDE1MCBbYXN0XQo+IFsgIDE0Ni4xMzQyNzJdICBhc3RfY3Vyc29yX3BsYW5lX2hlbHBlcl9h
dG9taWNfdXBkYXRlKzB4OGEvMHhjMCBbYXN0XQo+IFsgIDE0Ni4xMzQzMDBdICBkcm1fYXRvbWlj
X2hlbHBlcl9jb21taXRfcGxhbmVzKzB4MTk3LzB4NGMwCj4gWyAgMTQ2LjEzNDM0MV0gIGRybV9h
dG9taWNfaGVscGVyX2NvbW1pdF90YWlsX3JwbSsweDUxLzB4OTAKPiBbICAxNDYuMTM0MzU3XSAg
Y29tbWl0X3RhaWwrMHgxMDMvMHgxYzAKPiBbICAxNDYuMTM0MzkwXSAgcHJvY2Vzc19vbmVfd29y
aysweDU2YS8weGE2MAo+IFsgIDE0Ni4xMzQ0MzFdICA/IF9fbG9ja19hY3F1aXJlZCsweDFjYS8w
eDNkMAo+IFsgIDE0Ni4xMzQ0NDddICA/IHB3cV9kZWNfbnJfaW5fZmxpZ2h0KzB4MTEwLzB4MTEw
Cj4gWyAgMTQ2LjEzNDQ2MF0gID8gX19sb2NrX2NvbnRlbmRlZCsweDRhMC8weDRhMAo+IFsgIDE0
Ni4xMzQ0OTFdICA/IHdvcmtlcl90aHJlYWQrMHgxNTAvMHg2MjAKPiBbICAxNDYuMTM0NTIxXSAg
d29ya2VyX3RocmVhZCsweDhiLzB4NjIwCj4gWyAgMTQ2LjEzNDUzOV0gID8gX3Jhd19zcGluX3Vu
bG9ja19pcnFyZXN0b3JlKzB4NDEvMHg1MAo+IFsgIDE0Ni4xMzQ1ODNdICA/IHByb2Nlc3Nfb25l
X3dvcmsrMHhhNjAvMHhhNjAKPiBbICAxNDYuMTM0NTk3XSAga3RocmVhZCsweDFlNC8weDIxMAo+
IFsgIDE0Ni4xMzQ2MTJdICA/IGt0aHJlYWRfY3JlYXRlX3dvcmtlcl9vbl9jcHUrMHhiMC8weGIw
Cj4gWyAgMTQ2LjEzNDYzN10gIHJldF9mcm9tX2ZvcmsrMHgyMi8weDMwCj4gWyAgMTQ2LjEzNDY5
OF0gaXJxIGV2ZW50IHN0YW1wOiA3NDExMQo+IFsgIDE0Ni4xMzQ3MTFdIGhhcmRpcnFzIGxhc3Qg
IGVuYWJsZWQgYXQgKDc0MTE3KTogWzxmZmZmZmZmZjk3MWM2OGY5Pl0KPiBjb25zb2xlX3VubG9j
aysweDUzOS8weDY3MAo+IFsgIDE0Ni4xMzQ3MjNdIGhhcmRpcnFzIGxhc3QgZGlzYWJsZWQgYXQg
KDc0MTIyKTogWzxmZmZmZmZmZjk3MWM2OGVmPl0KPiBjb25zb2xlX3VubG9jaysweDUyZi8weDY3
MAo+IFsgIDE0Ni4xMzQ3MzddIHNvZnRpcnFzIGxhc3QgIGVuYWJsZWQgYXQgKDczMzU0KTogWzxm
ZmZmZmZmZjk3NTQ2OWQ1Pl0KPiB3Yl93b3JrZm4rMHgzZjUvMHg0MzAKPiBbICAxNDYuMTM0NzQ5
XSBzb2Z0aXJxcyBsYXN0IGRpc2FibGVkIGF0ICg3MzM1MCk6IFs8ZmZmZmZmZmY5NzNmODFkMD5d
Cj4gd2Jfd2FrZXVwX2RlbGF5ZWQrMHg0MC8weGEwCj4gWyAgMTQ2LjEzNDc1OF0gLS0tWyBlbmQg
dHJhY2UgNzRkZDVmYWM2YTNhMmMwYyBdLS0tCj4KPgo+IEhhcHBlbnMgd2l0aCBhc3Qgd2hlbiBk
b2luZwo+Cj4gICAgd2VzdG9uLWxhdW5jaAo+Cj4KPgo+PiArCQlyZXR1cm4gMDsKPj4gKwo+PiAr
CXJldHVybiBnYm8tPmJvLm1lbS5zdGFydDsKPj4gK30KPj4gKwo+PiAgIC8qKgo+PiAgICAqIGRy
bV9nZW1fdnJhbV9vZmZzZXQoKSAtIFwKPj4gICAJUmV0dXJucyBhIEdFTSBWUkFNIG9iamVjdCdz
IG9mZnNldCBpbiB2aWRlbyBtZW1vcnkKPj4gQEAgLTI5Nyw3ICszMDYsNyBAQCBzNjQgZHJtX2dl
bV92cmFtX29mZnNldChzdHJ1Y3QgZHJtX2dlbV92cmFtX29iamVjdCAqZ2JvKQo+PiAgIHsKPj4g
ICAJaWYgKFdBUk5fT05fT05DRSghZ2JvLT5waW5fY291bnQpKQo+PiAgIAkJcmV0dXJuIChzNjQp
LUVOT0RFVjsKPj4gLQlyZXR1cm4gZ2JvLT5iby5vZmZzZXQ7Cj4+ICsJcmV0dXJuIGRybV9nZW1f
dnJhbV9wZ19vZmZzZXQoZ2JvKSA8PCBQQUdFX1NISUZUOwo+PiAgIH0KPj4gICBFWFBPUlRfU1lN
Qk9MKGRybV9nZW1fdnJhbV9vZmZzZXQpOwo+PiAgIAo+PgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

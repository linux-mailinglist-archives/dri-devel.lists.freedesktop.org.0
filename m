Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C82729CFDC
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 13:12:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85F2B6EC9A;
	Wed, 28 Oct 2020 12:12:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2064.outbound.protection.outlook.com [40.107.243.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4DBF6EC9A
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 12:11:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kwOrKkZuK64PAwPoEi+UzIZyMNPhhNuCQnW2XijqBZbDi0Sr4nnz9dFrOGHEZjU1Yrgn1E9y+Qw3ozx1kn4+SVm6XNOSTszRiJjXUmErbULAVw0sGXgOvEPn+vEVxKYKsEkC5Vrfst4nsQRVuyDDlfCQ1UetL6u4xW+1Fsnha5iUYf4A+/63svQ+MNWDKAEgi0kxV0AtQzDEveeYET1FyudVRq7ZgRpC+aeKDgN1FsF+J5CB75EWGh5JBxf06/0MDeY1nlbBg8qw0THJEG41fZJqlqylr4Brp2Z3NOeHue+Kx84TpLERUHo4zqwIoE9IplhGY7suEew2xjN5ia/3rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AP5Bl19SBkYMBsiV+y3FDRK7GODOEaTLUAHC/6kotAY=;
 b=MdHmlmCC4wi3c1q7PgWESydKOYMycQvgMCh16VuL91y1BEUz9gz/sPKQe+ej7/g6hHESkVIALsub4GwMv+E9csu6qI/sjeb9wmGPWAu/bVazdtXi3k/GI/WKV9mRcF6Tzh+Q/WWDiRJ5bp6wlexi54gIf5VGq/iIX2cUd9vcN5ys7DYICIBoaI7OC8hBkFPYAOPagVC+00C9PslPQjb9udQswAfIbOxh13ruKlh7MqjsB3XLMGrfZLYGtnVtgH/No/8qUt8hnzR5UqnKyQX3mni2z0q5YW1+gNmdH4e1X1vSVEMK8eEK0wdogJxFtPZr05nTitR/qPsb7H5aZAhvEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AP5Bl19SBkYMBsiV+y3FDRK7GODOEaTLUAHC/6kotAY=;
 b=TsbjZZpTw6rXgMQSPBYbjX3C8wpi/gNhQ6p7brhplUNOW0+ifbKdZMtIec2aj0yf2cga2g/ifJBZaFua2DkDNWqmRiVDGloUsT9QLC+SRhtFxixoeyAWgSSdtKv7LrvrihoM39WldPNgltQCL43CIoMvrok0jlSDXo1vzL2iMY4=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2545.namprd12.prod.outlook.com (2603:10b6:207:4e::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Wed, 28 Oct
 2020 12:11:56 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3477.029; Wed, 28 Oct 2020
 12:11:56 +0000
Subject: Re: [PATCH] drm/ttm: Warn on pinning without holding a reference
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20201028113120.3641237-1-daniel.vetter@ffwll.ch>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <376c6ae4-b54d-05e4-1297-7abf379425de@amd.com>
Date: Wed, 28 Oct 2020 13:11:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201028113120.3641237-1-daniel.vetter@ffwll.ch>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR10CA0026.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::36) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR10CA0026.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::36) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19 via Frontend
 Transport; Wed, 28 Oct 2020 12:11:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e3daf1c6-3bcf-4c9a-c87a-08d87b3aa9ae
X-MS-TrafficTypeDiagnostic: BL0PR12MB2545:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB2545E849709A443801D646D283170@BL0PR12MB2545.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9F7IfZqdnee70/5kj1vyhV11nZqR+kvPU1ulrDluxlTQ4J+pZQt4TB7aAerWfmgrkaYL+KPdE90QoejTDiXBmxWoNrVDZwKDlCL0b7X5LtO5YgS2efIaQAEEg5SrJ35xwXytY+Y5NFa7hHAtMeCoDOmHfvFtpOoWgZ0+0duheCUsEMPRHpvgtejzlU3oTe408lOAG3rKBlemYeqrIYWvR931/YqtMTYqQrOcTQwisHa7Rx09Eb4yAnGvGp1aOMUbNtupmBOLUjNoI05LM+thopUZxdh/VTvJF/WUOLIlDvNLV66x63d5FmCY+2GkSU1dwTtO/uyAON11NxuROcxQ3jYq39mbCsbzP5wzVr27oe/R+4Tr1B5Vfj1A7rfM4F1E
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(396003)(346002)(376002)(136003)(36756003)(5660300002)(2906002)(8936002)(110136005)(2616005)(6666004)(83380400001)(86362001)(4326008)(52116002)(8676002)(31696002)(316002)(54906003)(186003)(478600001)(6486002)(16526019)(31686004)(66946007)(66476007)(66556008)(66574015)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: LFTGE8YZuB4rfRvpTHe7wBKPaGzGiovdFaJwH3Ho9InQLmF3BKwWKia3HH09wXMt21h2zxcatbQJVqMezFFGN1Dhpz55yeUet1ObnNDwblkBQ+NUvGSwVYOB/BZ0y2QMGrJPN37lKJnrzvuUjnp4TfpoyBH2jhUNTwauV4PLUXAbvRb0W9umO24r8KCivZAEyVjsYO52hua5lYRjfYw2MQDA/Dq0rpgsgpzFjhzKFFkf5toTrmK5mG5hCqXzftPKX3tb25GcU0NeXPXggaN5TFiN0o9VWPnDeGQ4XhTrj+POP8uqXgTiqbFgzAIW3kjnOMKqY6+FNt43/5t4RPT4kvJN3u8ubEMzs8m/LFWNBUkCVbjGtUiYJ35csu9/+RO9AleA34XR4tT4gb8HAQnl7Dg506g3VFo3DWzzQFotl+NXdpmI+n5y9eoMtox6PXnaqliqUWTtHqAsMmH6OfcSX4u0ZJW9krU2glegSgkXY76aWE1tdMrM2n4wrX/2taQOdnwRkynvc300/zEhKf0O+mqGS890BdHc5u/RKW8ypyUzRBN672acvhPQ7fx+/Q+MyaXSuq2qXUG+ktnhxZdPYag5OJGbAni2etzU6l1KmBnvdANiKKs4ty6LhoQakJuL99c0bsrH1p5/CtSOS9iNdpKa9d6RPHf4taqOAV/ODWdgnNKbM0K9t+0STnwNwZwJKK8IAFyzjBArZTgIgmrbqQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3daf1c6-3bcf-4c9a-c87a-08d87b3aa9ae
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2020 12:11:55.9568 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d80Ct3pCiaTLF2NFSdNbLbSa8Dc8p5AAyBjvKbbJFyjZipwAymfcuZhoUS3qkv62
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2545
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
Cc: Daniel Vetter <daniel.vetter@intel.com>, Huang Rui <ray.huang@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjguMTAuMjAgdW0gMTI6MzEgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE5vdCB0ZWNobmlj
YWxseSBhIHByb2JsZW0gZm9yIHR0bSwgYnV0IHZlcnkgbGlrZWx5IGEgZHJpdmVyIGJ1ZyBhbmQK
PiBwcmV0dHkgYmlnIHRpbWUgY29uZnVzaW5nIGZvciByZXZpZXdpbmcgY29kZS4KPgo+IFNvIHdh
cm4gYWJvdXQgaXQsIGJvdGggYXQgY2xlYW51cCB0aW1lIChzbyB3ZSBjYXRjaCB0aGVzZSBmb3Ig
c3VyZSkKPiBhbmQgYXQgcGluL3VucGluIHRpbWUgKHNvIHdlIGtub3cgd2hvJ3MgdGhlIGN1bHBy
aXQpLgo+Cj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRl
bC5jb20+Cj4gQ2M6IENocmlzdGlhbiBLb2VuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4K
PiBDYzogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4KClJldmlld2VkLWJ5OiBDaHJpc3Rp
YW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cgo+IC0tLQo+ICAgZHJpdmVycy9n
cHUvZHJtL3R0bS90dG1fYm8uYyB8IDIgKy0KPiAgIGluY2x1ZGUvZHJtL3R0bS90dG1fYm9fYXBp
LmggfCAyICsrCj4gICAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMgYi9kcml2
ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCj4gaW5kZXggZjUxYjVlMjBmYTE3Li5hMDExMDcyYWI2
MWQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKPiBAQCAtNTA5LDcgKzUwOSw3IEBAIHN0YXRpYyB2
b2lkIHR0bV9ib19yZWxlYXNlKHN0cnVjdCBrcmVmICprcmVmKQo+ICAgCQkgKiBzaHJpbmtlcnMs
IG5vdyB0aGF0IHRoZXkgYXJlIHF1ZXVlZCBmb3IKPiAgIAkJICogZGVzdHJ1Y3Rpb24uCj4gICAJ
CSAqLwo+IC0JCWlmIChiby0+cGluX2NvdW50KSB7Cj4gKwkJaWYgKFdBUk5fT04oYm8tPnBpbl9j
b3VudCkpIHsKPiAgIAkJCWJvLT5waW5fY291bnQgPSAwOwo+ICAgCQkJdHRtX2JvX2RlbF9mcm9t
X2xydShibyk7Cj4gICAJCQl0dG1fYm9fYWRkX21lbV90b19scnUoYm8sICZiby0+bWVtKTsKPiBk
aWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19hcGkuaCBiL2luY2x1ZGUvZHJtL3R0
bS90dG1fYm9fYXBpLmgKPiBpbmRleCAzNzEwMmU0NWU0OTYuLmI0NWFlZTIzZDdkMCAxMDA2NDQK
PiAtLS0gYS9pbmNsdWRlL2RybS90dG0vdHRtX2JvX2FwaS5oCj4gKysrIGIvaW5jbHVkZS9kcm0v
dHRtL3R0bV9ib19hcGkuaAo+IEBAIC01NzEsNiArNTcxLDcgQEAgc3RhdGljIGlubGluZSBib29s
IHR0bV9ib191c2VzX2VtYmVkZGVkX2dlbV9vYmplY3Qoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0
ICpibykKPiAgIHN0YXRpYyBpbmxpbmUgdm9pZCB0dG1fYm9fcGluKHN0cnVjdCB0dG1fYnVmZmVy
X29iamVjdCAqYm8pCj4gICB7Cj4gICAJZG1hX3Jlc3ZfYXNzZXJ0X2hlbGQoYm8tPmJhc2UucmVz
dik7Cj4gKwlXQVJOX09OX09OQ0UoIWtyZWZfcmVhZCgmYm8tPmtyZWYpKTsKPiAgIAkrK2JvLT5w
aW5fY291bnQ7Cj4gICB9Cj4gICAKPiBAQCAtNTg0LDYgKzU4NSw3IEBAIHN0YXRpYyBpbmxpbmUg
dm9pZCB0dG1fYm9fdW5waW4oc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibykKPiAgIHsKPiAg
IAlkbWFfcmVzdl9hc3NlcnRfaGVsZChiby0+YmFzZS5yZXN2KTsKPiAgIAlXQVJOX09OX09OQ0Uo
IWJvLT5waW5fY291bnQpOwo+ICsJV0FSTl9PTl9PTkNFKCFrcmVmX3JlYWQoJmJvLT5rcmVmKSk7
Cj4gICAJLS1iby0+cGluX2NvdW50Owo+ICAgfQo+ICAgCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F55277142
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 14:42:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E82096EAE3;
	Thu, 24 Sep 2020 12:42:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2042.outbound.protection.outlook.com [40.107.243.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D44B6EAE2
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 12:42:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fFyDWuJ6UHjqlHDXgNmuwihjaGTWFAJLXWwaa77CToiTklFBYiaQ+VRsosG3tYSgitQ9xfi+CfcofDgl/lctwV1Uf7hqfwAgddK9vosBsPsIdxdupgLdQI/3YU6BOc22iPkPnSdotegDDhzdk2xBlZN3xpLYMKSEZveBI3tM98j41X0EmNhpPv20AJzccy/l71eSskLFPvhgz4vnAVISRptfrJmeWSjM0oYe+8x64HBVB8+ZM+eXQqIVfdyCDcZENpE+OgEqUftvHfNFHneSs/eAy0vc/EEarMiK11SRSl2GaQS2uVUihXdIIM8sjW1/9+M0ob3mQoeUT38FEcupIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pS/oHKXp4XxxLZgQRnjKl97YZz4F1IlVwgLJapu/AT8=;
 b=TiGe8g1yPAVyOAVnSVIhuM6lEgEEGXVbw6Zvuh3v54Emq9sYGxu+Dkmqkl0cy2a7iwHOl+ijcQSnL0SWqT0DqumLyLFXofudqhGcKIdI1zGEz3JF3n1koP8BVl2mQBvdfZ9jDLz8bCaF3w5msXi0a+ps7SqRxIjS5qWJLsLolaYwqf4jV2YXKbB4NTqVAxCVGtLDLxZ3gC6nfmeIpw7LaHI4wk1Me04rkoCOEum1cWd5VOaujKlluXXsYDdnRZRgafXJutnH6hHr6qGcO8jpAo57poy8t4tZknJfCSTNc5fnY3rTVdrAy8zvzk/v5I8C8QJUkXRKS3SneJRrl3gYPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pS/oHKXp4XxxLZgQRnjKl97YZz4F1IlVwgLJapu/AT8=;
 b=p/ttv1GVzq2y7s0D2XKEWASAlUsJ+s0UBJImhDxTb9qJqh6rBueUyCuQq6zI70K0GgHdr3JZTbSfIvjRKDSFhpftuQn/RsRfDfLq3nv+XpfV/TRVn1FMjmTbYOzO+XWcnbKDopBf1HA4HVIW9Z8OD8mHdmPcHflRiKP82emzBn0=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4392.namprd12.prod.outlook.com (2603:10b6:208:264::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.19; Thu, 24 Sep
 2020 12:42:40 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3412.022; Thu, 24 Sep 2020
 12:42:40 +0000
Subject: Re: [PATCH 37/45] drm/ttm: add a helper to allocate a temp tt for
 copies.
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200924051845.397177-1-airlied@gmail.com>
 <20200924051845.397177-38-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <39ca897a-e7f2-93c8-e844-449ccbfe6041@amd.com>
Date: Thu, 24 Sep 2020 14:42:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200924051845.397177-38-airlied@gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR04CA0046.eurprd04.prod.outlook.com
 (2603:10a6:208:1::23) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR04CA0046.eurprd04.prod.outlook.com (2603:10a6:208:1::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.22 via Frontend Transport; Thu, 24 Sep 2020 12:42:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 76c83387-2c4c-45fb-b326-08d860875309
X-MS-TrafficTypeDiagnostic: MN2PR12MB4392:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4392EB56B7670E57164E586683390@MN2PR12MB4392.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F82SZ/AWPg4evkzNOnBmauN5opfKEPCZ+YpxHV1hennikH5tNuMEfOnS+DNhvbJwWpNwvunpNILwHni2Ec+iY7Lk5vWD+NpRhHZipzN/42FFPYnTowR6iUyCbppwUJqTSIH3xt+u3eVEYacw9/feUx1bVle/r9s4rMYOjQyjpoXf8jEEG5dgBixCkWI9AWwfA5OQaf0s8fAnPoqnQOBB5M5xBgHlhaYHHxqE621uG3/cw4Kf2L83hMnxhoetCNTpHG4N6gbK6L6WTStSTdQwpr+tTdgKz85wRbku2oKA+8+Ye2MzV6WpO300RSpH07BVPWJGEx8aGW3gfPVI6V2bXT5l/AXi5ckQFiWJg86OX0f3nUIarcEkSu9pWauyHjQ8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(396003)(366004)(376002)(39860400002)(83380400001)(4326008)(8676002)(8936002)(52116002)(6486002)(6666004)(478600001)(66476007)(86362001)(16526019)(2906002)(66946007)(2616005)(31686004)(31696002)(186003)(5660300002)(316002)(36756003)(66556008)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: L9ZfJkW6Syeh0813wIGbWv/+cX8n3GZGBi4VLv8fMiKdOrGPi91nMsJjNOjIw5tq5xO/LgzM9doBt+tAtfl3rYu1AhmeXDuaTkHnCBu71RIje+mj6xg05YaD/JVQlX1zuUZEdvuB72F0qYUKnKVaT+UDmm82S8kLWzERzrSxKtUe3pyGbuihm9Mw/kg1+KX/391g7iZroEsTUaeAJNQU/E5TH2tQRnG9kRi2P5lZJM6buwjPVI8IDBR1JGbGioZFNtSuiCMTlGkctvOMSZdlpHS0M8HvNRue3B9QzJDme3wsaSJD6Jw8qEDoMv2KHCL2dxlmVEUg2bm3h9iGjk7MqSB5XPidCpGMrjHbCTLEBEd5n9WzFfiEDxQ3oKZPtaP3Mhzd47QwsYNNrGXT7pcxsOWQ1/LvWSZHANWQS1spSJi+f98AhiAjiFqEM6lobXfdptFSMwMbRqDrA9LKW9hVJPGRxt6W49kCOivOxAIue14/M3y2dDAM/d1I3b+HpZwnHDChYnogMpxaNRPkXgFl5989q6x3dbDPcnXZ2W26HWeVrmO1tQPLof/fYVh6i6FR7M2sDBUy2zxhW0WtreFTyYRwiqJVhvcKTo2yf5MbPKIVPLn7ZKFpS0XpvNPWcZaU86qh9UWX8xQFIkdi2HKEdobxkCoYbuq/HIDJpRovDWjbnpgxKPSGAwHReiluyxqvA9udbR6tbVyjrxC+0mZwyg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76c83387-2c4c-45fb-b326-08d860875309
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2020 12:42:40.6029 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c7Q5nljsKaupEp1gyUQEZGQZSFIBAxitv6flsrxcsZKcR88vcuuR/DAiM5AwsvSm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4392
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
Cc: bskeggs@redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjQuMDkuMjAgdW0gMDc6MTggc2NocmllYiBEYXZlIEFpcmxpZToKPiBGcm9tOiBEYXZlIEFp
cmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+Cj4gQWxsIHRoZSBhY2NlbCBtb3ZlcyBkbyB0aGUg
c2FtZSBwYXR0ZXJuIGhlcmUsIHByb3ZpZGUgYSBoZWxwZXIKCkFuZCBleGFjdGx5IHRoYXQgcGF0
dGVybiBJIHdhbnQgdG8gZ2V0IGF3YXkgZnJvbS4KClNlZSB3aGF0IGhhcHBlbnMgaWYgd2UgKGZv
ciBleGFtcGxlKSBoYXZlIGEgVlJBTSAtPiBTWVNURU0gbW92ZSBpcyB0aGUgCmZvbGxvd2luZzoK
CjEuIFRUTSBhbGxvY2F0ZXMgYSBuZXcgdHRtX3Jlc291cmNlIG9iamVjdCBpbiB0aGUgU1lTVEVN
IGRvbWFpbi4KMi4gV2UgY2FsbCB0aGUgZHJpdmVyIHRvIG1vdmUgZnJvbSBWUkFNIHRvIFNZU1RF
TS4KMy4gRHJpdmVyIGZpbmRzIHRoYXQgaXQgY2FuJ3QgZG8gdGhpcyBhbmQgY2FsbHMgVFRNwqAg
dG8gYWxsb2NhdGUgR1RULgo0LiBTaW5jZSB3ZSBhcmUgbWF5YmUgb3V0IG9mIEdUVCBUVE0gZXZp
Y3RzIGEgZGlmZmVyZW50IEJPIGZyb20gR1RUIHRvIApTWVNURU0gYW5kIGNhbGwgZHJpdmVyIGFn
YWluLgoKVGhpcyBpcyBhIGhvcnJpYmxlIHBpbmcvcG9uZyBiZXR3ZWVuIGRyaXZlci9UVE0vZHJp
dmVyL1RUTS9kcml2ZXIgYW5kIHdlIApzaG91bGQgc3RvcCB0aGF0IGltbWVkaWF0ZWx5LgoKTXkg
c3VnZ2VzdGlvbiBpcyB0aGF0IHdlIHJld3JpdGUgaG93IGRyaXZlcnMgY2FsbCB0aGUgdHRtX2Jv
X3ZhbGlkYXRlKCkgCmZ1bmN0aW9uIHNvIHRoYXQgd2UgY2FuIGd1YXJhbnRlZSB0aGF0IHRoaXMg
bmV2ZXIgaGFwcGVucy4KCldoYXQgZG8geW91IHRoaW5rPwoKVGhhbmtzLApDaHJpc3RpYW4uCgo+
Cj4gU2lnbmVkLW9mZi1ieTogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KPiAtLS0K
PiAgIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMgICAgfCAyOCArKysrKysrKysrKysrKysr
KysrKysrKysrKysrCj4gICBpbmNsdWRlL2RybS90dG0vdHRtX2JvX2RyaXZlci5oIHwgIDUgKysr
KysKPiAgIDIgZmlsZXMgY2hhbmdlZCwgMzMgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9i
by5jCj4gaW5kZXggZWI3NjAwMmFhNTNkLi4zNThkMTU4MGRjMTYgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRt
X2JvLmMKPiBAQCAtMTU0MSwzICsxNTQxLDMxIEBAIHZvaWQgdHRtX2JvX3R0X2Rlc3Ryb3koc3Ry
dWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibykKPiAgIAl0dG1fdHRfZGVzdHJveShiby0+YmRldiwg
Ym8tPnR0bSk7Cj4gICAJYm8tPnR0bSA9IE5VTEw7Cj4gICB9Cj4gKwo+ICtpbnQgdHRtX2JvX2Ny
ZWF0ZV90dF90bXAoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywKPiArCQkJIHN0cnVjdCB0
dG1fb3BlcmF0aW9uX2N0eCAqY3R4LAo+ICsJCQkgc3RydWN0IHR0bV9yZXNvdXJjZSAqbmV3X21l
bSwKPiArCQkJIHN0cnVjdCB0dG1fcmVzb3VyY2UgKm5ld190ZW1wKQo+ICt7Cj4gKwlzdHJ1Y3Qg
dHRtX3BsYWNlIHBsYWNlbWVudF9tZW10eXBlID0gewo+ICsJCS5mcGZuID0gMCwKPiArCQkubHBm
biA9IDAsCj4gKwkJLm1lbV90eXBlID0gVFRNX1BMX1RULAo+ICsJCS5mbGFncyA9IFRUTV9QTF9N
QVNLX0NBQ0hJTkcKPiArCX07Cj4gKwlzdHJ1Y3QgdHRtX3BsYWNlbWVudCBwbGFjZW1lbnQ7Cj4g
KwlpbnQgcmV0Owo+ICsKPiArCXBsYWNlbWVudC5udW1fcGxhY2VtZW50ID0gcGxhY2VtZW50Lm51
bV9idXN5X3BsYWNlbWVudCA9IDE7Cj4gKwlwbGFjZW1lbnQucGxhY2VtZW50ID0gcGxhY2VtZW50
LmJ1c3lfcGxhY2VtZW50ID0gJnBsYWNlbWVudF9tZW10eXBlOwo+ICsKPiArCSpuZXdfdGVtcCA9
ICpuZXdfbWVtOwo+ICsJbmV3X3RlbXAtPm1tX25vZGUgPSBOVUxMOwo+ICsKPiArCXJldCA9IHR0
bV9ib19tZW1fc3BhY2UoYm8sICZwbGFjZW1lbnQsIG5ld190ZW1wLCBjdHgpOwo+ICsJaWYgKHJl
dCkKPiArCQlyZXR1cm4gcmV0Owo+ICsKPiArCXJldHVybiAwOwo+ICt9Cj4gK0VYUE9SVF9TWU1C
T0wodHRtX2JvX2NyZWF0ZV90dF90bXApOwo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS90dG0v
dHRtX2JvX2RyaXZlci5oIGIvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19kcml2ZXIuaAo+IGluZGV4
IDRhNjNmZWMyNGU5MC4uYTc1MDdkZmFhODlkIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvZHJtL3R0
bS90dG1fYm9fZHJpdmVyLmgKPiArKysgYi9pbmNsdWRlL2RybS90dG0vdHRtX2JvX2RyaXZlci5o
Cj4gQEAgLTU1OCw2ICs1NTgsMTEgQEAgdm9pZCB0dG1fbWVtX2lvX2ZyZWUoc3RydWN0IHR0bV9i
b19kZXZpY2UgKmJkZXYsCj4gICBpbnQgdHRtX2JvX21vdmVfdG9fbmV3X3R0X21lbShzdHJ1Y3Qg
dHRtX2J1ZmZlcl9vYmplY3QgKmJvLAo+ICAgCQkJICAgICAgc3RydWN0IHR0bV9vcGVyYXRpb25f
Y3R4ICpjdHgsCj4gICAJCQkgICAgICBzdHJ1Y3QgdHRtX3Jlc291cmNlICpuZXdfbWVtKTsKPiAr
Cj4gK2ludCB0dG1fYm9fY3JlYXRlX3R0X3RtcChzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJv
LAo+ICsJCQkgc3RydWN0IHR0bV9vcGVyYXRpb25fY3R4ICpjdHgsCj4gKwkJCSBzdHJ1Y3QgdHRt
X3Jlc291cmNlICpuZXdfbWVtLAo+ICsJCQkgc3RydWN0IHR0bV9yZXNvdXJjZSAqbmV3X3RlbXAp
Owo+ICAgLyoqCj4gICAgKiB0dG1fYm9fbW92ZV9tZW1jcHkKPiAgICAqCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CD2275A5C
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 16:40:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 123446E9C3;
	Wed, 23 Sep 2020 14:40:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2085.outbound.protection.outlook.com [40.107.243.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F0906E9BB
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 14:40:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YlMHDRwz9l35bf74H0S+HzzHft+ZTz4JX5zJDOHsnx9Io3Nl8TdSntZb+SlUuiJ0XsHuy7hjvGB4B8lmslMlcMhTLZDt4poxq70HKEA/gYS62HzAW+qmE9/egDlJr25UzUCrolyBknwxEaih+WVOcmx55oNAQZH4qzxajgxPM9cW9L2eq3L/YVYROTX4mAn49A5/w7WfoQKXMHOpOlRyDxn5HmK/D+Jx4BFQhFAjCDRSrgpbb4ubASkfrteg36FZHNGlRCHQbAdwQU0D9v32Sc+qOgnYjHZ0rf4yN8dTcJK7qOpMrD/Rd7bc5HSBNTIbBKbqzk6XXQRs2Myb59Vbdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KLRMHTPNXaNCE+TL0Cx5+GYe3WXMsLElCRx/sgeh9E0=;
 b=VIGT3bcwggTG6krwDJWuhjoStZAcrpwYbhLP075yXPikojCfzjlo9nbHewm0heB8P4h7ZxSivK1Krh0EmCnezXTLZxN03izKMx7ImuoxqyEyeIM3xNtF2Xmla9cpzyEc3CDs3pzGP9g+xUa24Iztucw8P8cLAKTVNIUT8WUXUmnqEX8qF7nbNQZ05w4qZ73mpwGCyMiA4SfXm9rbAwhANpCYF28+ryJPQO7wfhRRqF1Zm5dkGnkNIJxqfVwEOu/kYgv2RkAs9xibdLRFhgay/OrsyVsvaSrWYLVMoox8b0O1aKxTgk4mtln4ZfWTPPKZQYFYKgm2nNph2hYsXBhhbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KLRMHTPNXaNCE+TL0Cx5+GYe3WXMsLElCRx/sgeh9E0=;
 b=PDKFZIzVwE4ijeUL7xfgTk2rFFifqlJSe1ysl4FgXbvZV/+8LlGmsNzOxTBx98Q8e2XacC2YHZUTebVyf/1xD4K2WVBdVKDBnRXYFwmytkWx7Ue0b6ycXvnt+v+KkBoXtyluEnXc+RBRAmRcoHxCWQMsnnv2uu2mQOqDpqX5qoE=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3839.namprd12.prod.outlook.com (2603:10b6:208:168::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.13; Wed, 23 Sep
 2020 14:40:19 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3412.022; Wed, 23 Sep 2020
 14:40:19 +0000
Subject: Re: [PATCH 05/10] drm/ttm: add bo wait that takes a ctx wrapper.
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200923030454.362731-1-airlied@gmail.com>
 <20200923030454.362731-6-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <de7cab6b-6432-5f94-28a5-d2161531a63e@amd.com>
Date: Wed, 23 Sep 2020 16:40:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200923030454.362731-6-airlied@gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM4PR07CA0028.eurprd07.prod.outlook.com
 (2603:10a6:205:1::41) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4PR07CA0028.eurprd07.prod.outlook.com (2603:10a6:205:1::41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.8 via Frontend Transport; Wed, 23 Sep 2020 14:40:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 055a9914-9129-40ee-8ccd-08d85fce9838
X-MS-TrafficTypeDiagnostic: MN2PR12MB3839:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3839AC791863347AA3BDA42F83380@MN2PR12MB3839.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6Je5jigZEw7spyFBIwk84Dr+diQv/sic3ETRrt9BqzitPoriDfUclP2kFEhNau8PTb791gMZIJETkPaJM//OOHDmcgFiG1dhvnSlmNr0pj8xkfPb4+4w3qHl2NnpAj5jO5kYq/5bYT//QGdd0dI0DqAbW8jqbG0zNANulOSdapbrbZl6JgFt3bmsOWAtBzciI8tvh/dBNqvdMArRVaj2Vqd60JprlAZhO7Q8iX6AZ3B9LzDyYEmvhmrhIJ/HnbjeK0kt+BBiam4XQXniuLKhctwKipTCflJlCddAb2FYlQnFB0ApDzWrLkZjGO55EuiAbbnucVhV1d5F0qnPEQ1hNba9MGLNYXR+/3B688YlOqKiT9fhFHCqioCV8imBf5bX4allXvVsWjTXKxOzImyen7/b3yAU7Vg3RWcgE8VwsbU9BtT++E+mFL+fZSc6m0Mk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(366004)(346002)(136003)(39860400002)(8936002)(16526019)(6666004)(6486002)(316002)(8676002)(5660300002)(31696002)(36756003)(83380400001)(52116002)(66946007)(86362001)(31686004)(478600001)(2906002)(4326008)(2616005)(66556008)(66476007)(186003)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: ohqb7fozgNQo5iVxQrm5E9QXHMo/UoXEEh0yV5Pmw/fMqZ/rV7Hzr/5KKOv/9kX2nqy6PwGbxZV0GJYIXDCB4yfWSAONein8tleXD74Gd3gKl4oXYXhySCAn2R0YonsM+qkfnqZE75lsChjsZV/EHXF52KyPL1i7yKNTSjSncCFo+QiJueyRxCvA6S0pASRv8QYS0o5Zpq/u8IA94uwocspYIYx0Y3Ww5yWrEU2H1KBS9xNvIrXE28ZucQBXVgVjrU2WCYY2Httpp/msimf3QytMnNAGIjxvdz8QsQtnfIOoeTy4f2nmkCKucRf0VwGml5ac2RwatE+Z0LBk3XPGoHXH+xIt3UH9CRrfDtIJWvudL6snnkyNyghUg3quEvsButdyPuShaIpgAWV5h/770uuag6e6Me4GVc1ylr/vXIoDNBtc/20AM5BmOCEMaHoqtshR0QIeuI43M6Vk+SaYfk6RMCVXGhHEfzRGkOz+njctoeEa0WIb6lMF2H3XbzVcA8E6hsc1YAVoi44BObikbth4kT+eYzWqvBRGLVgENpLI4z7S0ixfD8AJOoHKej2El41bvNTGXZL7WK69leowGkkVZGB48t2wECvv6GAjExzsoNkliP4j/8zYv43TqK1Nfl0UuUaeprWTEPIMgVb8/YJY8xgn1li3fFEsa9PfUF07CmBa7Row6UTuMm4tAM3P7L3d42BLTlSUuwADSqR1RQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 055a9914-9129-40ee-8ccd-08d85fce9838
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2020 14:40:19.6778 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: clWt6KRvWApiLFS5Ci+TXDPiZuG3ModPHuxU8r06Km4rZmzQ5aHCsPuv6Zqe31M/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3839
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

QW0gMjMuMDkuMjAgdW0gMDU6MDQgc2NocmllYiBEYXZlIEFpcmxpZToKPiBGcm9tOiBEYXZlIEFp
cmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+Cj4gSSdtIHRoaW5raW5nIG9mIHB1c2hpbmcgdGhl
IHdhaXQgaW50byB0aGUgZHJpdmVycy4KPgo+IFNpZ25lZC1vZmYtYnk6IERhdmUgQWlybGllIDxh
aXJsaWVkQHJlZGhhdC5jb20+CgpSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0
aWFuLmtvZW5pZ0BhbWQuY29tPgoKPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25v
dXZlYXVfYm8uYyB8IDQgKystLQo+ICAgZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfdHRtLmMgICAg
ICAgIHwgMiArLQo+ICAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdHRtLmMgIHwgMiAr
LQo+ICAgZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdXRpbC5jICAgIHwgNCArKy0tCj4gICBp
bmNsdWRlL2RybS90dG0vdHRtX2JvX2FwaS5oICAgICAgICAgfCA1ICsrKysrCj4gICA1IGZpbGVz
IGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9iby5jIGIvZHJpdmVycy9ncHUvZHJt
L25vdXZlYXUvbm91dmVhdV9iby5jCj4gaW5kZXggOGE5MGIwN2YxN2E0Li44ZDUxY2ZjYTA3Yzgg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9iby5jCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9iby5jCj4gQEAgLTEwMzgsNyArMTAz
OCw3IEBAIG5vdXZlYXVfYm9fbW92ZShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLCBib29s
IGV2aWN0LAo+ICAgCXN0cnVjdCBub3V2ZWF1X2RybV90aWxlICpuZXdfdGlsZSA9IE5VTEw7Cj4g
ICAJaW50IHJldCA9IDA7Cj4gICAKPiAtCXJldCA9IHR0bV9ib193YWl0KGJvLCBjdHgtPmludGVy
cnVwdGlibGUsIGN0eC0+bm9fd2FpdF9ncHUpOwo+ICsJcmV0ID0gdHRtX2JvX3dhaXRfY3R4KGJv
LCBjdHgpOwo+ICAgCWlmIChyZXQpCj4gICAJCXJldHVybiByZXQ7Cj4gICAKPiBAQCAtMTA3Myw3
ICsxMDczLDcgQEAgbm91dmVhdV9ib19tb3ZlKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8s
IGJvb2wgZXZpY3QsCj4gICAJfQo+ICAgCj4gICAJLyogRmFsbGJhY2sgdG8gc29mdHdhcmUgY29w
eS4gKi8KPiAtCXJldCA9IHR0bV9ib193YWl0KGJvLCBjdHgtPmludGVycnVwdGlibGUsIGN0eC0+
bm9fd2FpdF9ncHUpOwo+ICsJcmV0ID0gdHRtX2JvX3dhaXRfY3R4KGJvLCBjdHgpOwo+ICAgCWlm
IChyZXQgPT0gMCkKPiAgIAkJcmV0ID0gdHRtX2JvX21vdmVfbWVtY3B5KGJvLCBjdHgsIG5ld19y
ZWcpOwo+ICAgCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX3R0bS5jIGIv
ZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfdHRtLmMKPiBpbmRleCAwMWZlMGMzYTNkOWEuLjJjMzVj
YTQyNzBjNiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF90dG0uYwo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX3R0bS5jCj4gQEAgLTE2MCw3ICsxNjAsNyBAQCBz
dGF0aWMgaW50IHF4bF9ib19tb3ZlKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sIGJvb2wg
ZXZpY3QsCj4gICAJc3RydWN0IHR0bV9yZXNvdXJjZSAqb2xkX21lbSA9ICZiby0+bWVtOwo+ICAg
CWludCByZXQ7Cj4gICAKPiAtCXJldCA9IHR0bV9ib193YWl0KGJvLCBjdHgtPmludGVycnVwdGli
bGUsIGN0eC0+bm9fd2FpdF9ncHUpOwo+ICsJcmV0ID0gdHRtX2JvX3dhaXRfY3R4KGJvLCBjdHgp
Owo+ICAgCWlmIChyZXQpCj4gICAJCXJldHVybiByZXQ7Cj4gICAKPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdHRtLmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9u
L3JhZGVvbl90dG0uYwo+IGluZGV4IDlmZjhjODFkNzc4NC4uZWE5ZmZhNjE5OGRhIDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX3R0bS5jCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdHRtLmMKPiBAQCAtMzAyLDcgKzMwMiw3IEBAIHN0YXRp
YyBpbnQgcmFkZW9uX2JvX21vdmUoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywgYm9vbCBl
dmljdCwKPiAgIAlzdHJ1Y3QgdHRtX3Jlc291cmNlICpvbGRfbWVtID0gJmJvLT5tZW07Cj4gICAJ
aW50IHI7Cj4gICAKPiAtCXIgPSB0dG1fYm9fd2FpdChibywgY3R4LT5pbnRlcnJ1cHRpYmxlLCBj
dHgtPm5vX3dhaXRfZ3B1KTsKPiArCXIgPSB0dG1fYm9fd2FpdF9jdHgoYm8sIGN0eCk7Cj4gICAJ
aWYgKHIpCj4gICAJCXJldHVybiByOwo+ICAgCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS90dG0vdHRtX2JvX3V0aWwuYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3V0aWwuYwo+
IGluZGV4IDE5NjhkZjk3NDNmYy4uYmRlZTRkZjFmM2YyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS90dG0vdHRtX2JvX3V0aWwuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRt
X2JvX3V0aWwuYwo+IEBAIC01OSw3ICs1OSw3IEBAIGludCB0dG1fYm9fbW92ZV90dG0oc3RydWN0
IHR0bV9idWZmZXJfb2JqZWN0ICpibywKPiAgIAlpbnQgcmV0Owo+ICAgCj4gICAJaWYgKG9sZF9t
ZW0tPm1lbV90eXBlICE9IFRUTV9QTF9TWVNURU0pIHsKPiAtCQlyZXQgPSB0dG1fYm9fd2FpdChi
bywgY3R4LT5pbnRlcnJ1cHRpYmxlLCBjdHgtPm5vX3dhaXRfZ3B1KTsKPiArCQlyZXQgPSB0dG1f
Ym9fd2FpdF9jdHgoYm8sIGN0eCk7Cj4gICAKPiAgIAkJaWYgKHVubGlrZWx5KHJldCAhPSAwKSkg
ewo+ICAgCQkJaWYgKHJldCAhPSAtRVJFU1RBUlRTWVMpCj4gQEAgLTIzMSw3ICsyMzEsNyBAQCBp
bnQgdHRtX2JvX21vdmVfbWVtY3B5KHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sCj4gICAJ
dW5zaWduZWQgbG9uZyBhZGQgPSAwOwo+ICAgCWludCBkaXI7Cj4gICAKPiAtCXJldCA9IHR0bV9i
b193YWl0KGJvLCBjdHgtPmludGVycnVwdGlibGUsIGN0eC0+bm9fd2FpdF9ncHUpOwo+ICsJcmV0
ID0gdHRtX2JvX3dhaXRfY3R4KGJvLCBjdHgpOwo+ICAgCWlmIChyZXQpCj4gICAJCXJldHVybiBy
ZXQ7Cj4gICAKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19hcGkuaCBiL2lu
Y2x1ZGUvZHJtL3R0bS90dG1fYm9fYXBpLmgKPiBpbmRleCA2Y2JlNTliYzk3YWIuLmI4NDA3NTZk
YmNjYSAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2RybS90dG0vdHRtX2JvX2FwaS5oCj4gKysrIGIv
aW5jbHVkZS9kcm0vdHRtL3R0bV9ib19hcGkuaAo+IEBAIC0yNjIsNiArMjYyLDExIEBAIHR0bV9i
b19nZXRfdW5sZXNzX3plcm8oc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibykKPiAgICAqLwo+
ICAgaW50IHR0bV9ib193YWl0KHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sIGJvb2wgaW50
ZXJydXB0aWJsZSwgYm9vbCBub193YWl0KTsKPiAgIAo+ICtzdGF0aWMgaW5saW5lIGludCB0dG1f
Ym9fd2FpdF9jdHgoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywgc3RydWN0IHR0bV9vcGVy
YXRpb25fY3R4ICpjdHgpCj4gK3sKPiArCXJldHVybiB0dG1fYm9fd2FpdChibywgY3R4LT5pbnRl
cnJ1cHRpYmxlLCBjdHgtPm5vX3dhaXRfZ3B1KTsKPiArfQo+ICsKPiAgIC8qKgo+ICAgICogdHRt
X2JvX21lbV9jb21wYXQgLSBDaGVjayBpZiBwcm9wb3NlZCBwbGFjZW1lbnQgaXMgY29tcGF0aWJs
ZSB3aXRoIGEgYm8KPiAgICAqCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK

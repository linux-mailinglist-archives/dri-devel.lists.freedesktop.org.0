Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 194762346CD
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 15:24:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41E516EA9E;
	Fri, 31 Jul 2020 13:24:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700085.outbound.protection.outlook.com [40.107.70.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 078F66EA9E
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 13:24:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XL9uJ7bRuWcZUqfj4DZVXZEBt4zGzj2Np9u8HwWZ6oJxVMmTUUJbX4I6gy+3qxzXhYWcOwnLv7LgO2o+WwDHdrdRBB2vIXqmDhd6Hi0UWoBtfV+QC7GOLTaf3/+2SzMitBR6ioEx3+lRVRYze8rhHHMVoLEWGEPKMrLAfJ/fKBnsbfrdy35ArxTQiB71S4qIbg/SKVmwrHTr9ZCFXJPBvukWC8Nw7lQ2qYgSFdX/lu+PpqMp5QPmTvAH6Gh8tZImguhJ5qhFrM7LQRgkj2GREXLKonbhfejE3KGCKFp/42h950tEqtXwzwsqRgxA5nPQTfZrvMZlolZyL75e8LZg1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ChVz2jypVn8F37BtDQpts1j+aUpo+uGOK4kQ0DfLqg=;
 b=LvN/68tNGGcZ/jw56saHCGOKzmMVpg6BqYIP+ueHRfFaruDe+zm45ykcQvMlmKG6jP3uA9eIer2FPE6EQOekDZduobW59dMKoiAIsPFw+vNx/I2eU0hvbxViyldeTvO6HCGmyscMOCGX6TYdp5y0Lb2U3wEdS3Y71GnhK8yBpEPLTUVrSLI2dOHP+6SkgKXHAwUlBxFOwWSRk362rwdYn1Q3atJJkbMyHnxOJPeIoi51yecH6RzJB37fKVmsIAO5WbS9E1b1SVLmMhLNkqsNy7AKEf7pyYKlPt05NRmZMqgAf/pwmeBaDc5hT5KSfflB48s9oG3wFkSBisRx1m5Gig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ChVz2jypVn8F37BtDQpts1j+aUpo+uGOK4kQ0DfLqg=;
 b=Wk0mqdOzLGDdgxA4UUznmlYjfPznb3CDg9m3Flke0cjG2N0LKJK/7Z4904KeVMNGJdMMEDga5AS/AwrGvc8pjW294RygIVeFGeFlstglYYDf3Tkla+0cEXfUKM5omCeVX5VjU3YBy7c+uDdqbQw0qmzWezxGPSmT/eiZVGye0mI=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.20; Fri, 31 Jul
 2020 13:24:47 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3239.020; Fri, 31 Jul 2020
 13:24:47 +0000
Subject: Re: [PATCH 34/49] drm/ttm: make manager debug function optional
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200731040520.3701599-1-airlied@gmail.com>
 <20200731040520.3701599-35-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <9bcc5793-f677-808b-3d38-334c80092903@amd.com>
Date: Fri, 31 Jul 2020 15:24:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200731040520.3701599-35-airlied@gmail.com>
Content-Language: en-US
X-ClientProxiedBy: AM3PR07CA0107.eurprd07.prod.outlook.com
 (2603:10a6:207:7::17) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM3PR07CA0107.eurprd07.prod.outlook.com (2603:10a6:207:7::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.9 via Frontend Transport; Fri, 31 Jul 2020 13:24:46 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6fd3046e-6f3a-4fd3-d2b7-08d835551883
X-MS-TrafficTypeDiagnostic: MN2PR12MB4342:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4342573EF56745352931DF10834E0@MN2PR12MB4342.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:346;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mD0TptTT7gUXovYWRj4pGq8LHZQbwqx8BbX/h2oPT+I5/kFhtNIGx0eBEgfb/isWxUv6NDXng0UsxmeSDVO4fo3XJcbovMLKFjIyxgrph0HBFHciRknCc7ptX0Djnxp9MZkoYnbGP/TiJaAPgQDD5F9PZJAsaA8nBkY/i8KPb2fzQQM36CnyfrNxcKCGdCy8cjtT3oS3nWxEowKvYAlkjbTdpnvs9EcdPq1+oclzZo5TfTf1dZzSuNLKDYZ6sK17rWacO6DOFF+WTYAD/ThNpRVfpwwI2iQKaj8qf0w4BJRA3NndRwk7Op8Q9SDeBvbLkhE9rNeFOsu+s2BVeIgBF0UP11ZoilXf0nrakmOb1z+3XXB4eoWmFcVD+pYELbDL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(136003)(346002)(396003)(39860400002)(366004)(2616005)(186003)(16526019)(4744005)(36756003)(31686004)(66574015)(83380400001)(31696002)(86362001)(8936002)(316002)(2906002)(66556008)(66476007)(66946007)(478600001)(5660300002)(52116002)(6666004)(4326008)(8676002)(6486002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: NihwXiPPWMt6vm0hmjnsLOt0acm1dkDKnSF6DlMfKOoSEBKU/JiPYlbyFduXk0ZjxRJF3bqPtrVpkWzW+CodQQKdYEPnIjhKfwv1Uh7hPWPo/8/UWiWOKNwrl8fjYZBhGZ9pT+zFdjmeH9yxn44ZP1/l+YALeF9fNFvV+bCt3LcyZ51x3x325OI/3uuO2kDWVqgDcVxE9sLlL/zJQd7lDcVqNwT5S8BjAMEY5MUPHmK1pjG+echby0rPFtlCAWGhLKNmsINJ98z2/jhEVmCpoxcdblAGQOFv6nnzp9hW1XQ+BlbONLNxZKeBXZXOw3OX13R0siP6roKvQAIlGb4iSgNZVO5v9S+o7B4quhqQ4Xn5j6vXPabfg0W3+3hum7gMZyLo+UuW5RVoGGf8GZ/FSnMJC/Oqh9yzo2nG7Ky+aHce0EmULEwJuMKcYorAxSdB3FoRnc2d3jIIMTmVbj0VssdfeiI/rXJmebH4If4gjNzxJ0dL8KIQFGJNmOdrYAJ9apsqPrKI6hjAkQaUiMTLB/DdGvxB6VS5KCGIvbJeO3Yo1eixsJDxPt1r5VMVVZ0gNpvprbPRWlNHI+kL8v8tfna49e5fFSP2LaOLu5O9EMfrjHixvrATKgPPf/LotsjPRP0XDoXeeHNjgcZqyA9+def3uCWyd5OhV4PHEKP/Az4m06MN5gyd7V/sGiDyADeIWt69T3yTqNQRcuaN2HXdCw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fd3046e-6f3a-4fd3-d2b7-08d835551883
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2020 13:24:47.5818 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D2HKs+/z+CCOOAcN14il6oRPuvHXrz+C8IL9jxTERGPcoAVnx4xR4s9sNgvmyj1G
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4342
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
Cc: sroland@vmware.com, bskeggs@redhat.com, kraxel@redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMzEuMDcuMjAgdW0gMDY6MDUgc2NocmllYiBEYXZlIEFpcmxpZToKPiBGcm9tOiBEYXZlIEFp
cmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+Cj4gU2lnbmVkLW9mZi1ieTogRGF2ZSBBaXJsaWUg
PGFpcmxpZWRAcmVkaGF0LmNvbT4KClJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJp
c3RpYW4ua29lbmlnQGFtZC5jb20+Cgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL3R0bS90dG1f
Ym8uYyB8IDIgKy0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMgYi9kcml2
ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCj4gaW5kZXggOTJkZThhNmQ3NjQ3Li4xZThmZGExYzli
M2EgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKPiBAQCAtODgsNyArODgsNyBAQCBzdGF0aWMgdm9p
ZCB0dG1fbWVtX3R5cGVfZGVidWcoc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsIHN0cnVjdCBk
cm1fcHJpbnRlciAqcAo+ICAgCWRybV9wcmludGYocCwgIiAgICBzaXplOiAlbGx1XG4iLCBtYW4t
PnNpemUpOwo+ICAgCWRybV9wcmludGYocCwgIiAgICBhdmFpbGFibGVfY2FjaGluZzogMHglMDhY
XG4iLCBtYW4tPmF2YWlsYWJsZV9jYWNoaW5nKTsKPiAgIAlkcm1fcHJpbnRmKHAsICIgICAgZGVm
YXVsdF9jYWNoaW5nOiAweCUwOFhcbiIsIG1hbi0+ZGVmYXVsdF9jYWNoaW5nKTsKPiAtCWlmICht
ZW1fdHlwZSAhPSBUVE1fUExfU1lTVEVNKQo+ICsJaWYgKG1lbV90eXBlICE9IFRUTV9QTF9TWVNU
RU0gJiYgbWFuLT5mdW5jLT5kZWJ1ZykKPiAgIAkJKCptYW4tPmZ1bmMtPmRlYnVnKShtYW4sIHAp
Owo+ICAgfQo+ICAgCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK

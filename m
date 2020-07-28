Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F73230492
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 09:49:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4895E6E1EE;
	Tue, 28 Jul 2020 07:49:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2083.outbound.protection.outlook.com [40.107.223.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 659616E1EE
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 07:49:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cRCprE3ldjQwo9pkZJfdmEj7yaJCuG4G3mg5ouUysJweGBJLYyywR3cVY17JhYgYA5oph4TI5xNTqHnieTjhCbwHdV89V7MRq36YLEhkvIC+1iUAoFsF/Rbhu3SdoyXE1AG4xn6gQzyBgG1ZSUa+NyXRaGnMd0SngNb6fHVFpsImIgbtV1fh0y1kekXXH80FfOxngwiB60oCV1azf/OaUbiv+gaET6CZhJuJk3hIBb9pWYIPFvSXB9cW5hcuzfUrV6xbmTbQAZ6h2sAsYYuGDamJ9QAfNh7cxI6e9SVvm5sINlgwpFPEr2wY6anGqdCcVgCQ3tsK3UFABIknIHTuyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DKY8CbwdUQyhP21FeBEkcxSrcFYIPoy9+CCAOWKRubo=;
 b=fR2ERNaTO71uckasycRnJJHhy63HIgrEUtXMdbyAyHadRmMwnX/oLhsiZ3EjoXz/F/3c+cfxA4fmz7RqLeSIKUdX4Pq4tyyaLnaW1j5+UJehG2fAYc2HXPMqeo0xP2pI1OSKla59yy5vlqf5PJlYrGmjYeSzDNgbswyl6tNCSkMqsd24+vzxuZPihDmBEf/WVR13ybgj74bp/AwWVwkId0g3LAGuBrYJ+d6lEZs0GdYfs9ez25iQr8KOZ29l+oJ5fA6s8qyLgXLyYh7o7yx21QQgluBluhwJJIJurI1VIT3hvcHCMHHsvsVvlmWColTTODRA/pk3N5zHG0IiTmH09w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DKY8CbwdUQyhP21FeBEkcxSrcFYIPoy9+CCAOWKRubo=;
 b=dxh9wZDGjs/m7bgpQGr6IeHg/zTsH/t5v2ZaiFdrK2Rr58t8y8dTX5tTgt0VgqeF+V90R5mxOog9ds9mYZIoGa+c8f/4rX+81hp27xxVFLnVTm3p8MaGN5V896zW64jHuVaZqFXBxV4m567zS7SIa0/QDdvihH2yBYsMiQeoTM4=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2419.namprd12.prod.outlook.com (2603:10b6:207:44::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.25; Tue, 28 Jul
 2020 07:49:03 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3216.033; Tue, 28 Jul 2020
 07:49:03 +0000
Subject: Re: [PATCH] drm/ttm/nouveau: don't call tt destroy callback on alloc
 failure.
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200728041736.20689-1-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <b18a4abf-6a05-7d2f-4c75-3e48396894ae@amd.com>
Date: Tue, 28 Jul 2020 09:48:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200728041736.20689-1-airlied@gmail.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR03CA0048.eurprd03.prod.outlook.com (2603:10a6:208::25)
 To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR03CA0048.eurprd03.prod.outlook.com (2603:10a6:208::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.22 via Frontend Transport; Tue, 28 Jul 2020 07:49:02 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1c7ac3e6-4d34-4227-fa51-08d832cab28f
X-MS-TrafficTypeDiagnostic: BL0PR12MB2419:
X-Microsoft-Antispam-PRVS: <BL0PR12MB2419958F471BCD7CFDF32AAA83730@BL0PR12MB2419.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1051;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IA6UwBPWHuliMsaMfG31WABYQf/mpG67/vGI2sdVlD4qXMGQK88lxbwMkaj4RbCRpWFHxcid2rQNXoqTAZsNfQEX0sEnJStibR3/KigeGss9dve25R9OD6jXvtjp1OkUtFPKo7jbJDdZC8idI1689w7cSXamhTjgWCyxwRbq03MYUjwmabkEoku+CsQnFa4FkhC2j1Q1oS30hWFnLTBaroLqRoBgieuk+LEJft7Hw5/B4AC39IncvDgYfAcHsxXB1CqA5moZDElc8c4cphIbBnnH4AzzcPDV6WgKhUr4GgDttNlXV3z+tDc9hPbCvn1hlcwIK7o6ovSeNsmrlv7fwRcOz0QxKbj3fgPgtd/X6mG7oK8i+HpOj1aghh5I0mp1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(366004)(136003)(376002)(39860400002)(346002)(66556008)(66476007)(66574015)(83380400001)(66946007)(31686004)(8936002)(6666004)(478600001)(8676002)(86362001)(6486002)(16526019)(186003)(4326008)(2616005)(36756003)(31696002)(316002)(52116002)(5660300002)(2906002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: s3OSTQsZeD2yODpbMCZm6+VsE5/YLPatQIPlC/uqKfvR84ahZeIDp/EhpD16BtRHz6GIRC6GknBkKF6ixrqqrYz8d61vOhzb0jxCWnIReywgGpiQsSWzbo8yTWpDfbTQEO3KnvormRk4/xSXOrtDqV1vrsXFb27GrF8svgJbswDCtHwZcleb95SDlZaRrsTz7MVNh7tcP74ukvl6qNqOFCWpSHAX/LfaGW11P66RFAJFLjUAJIpliga2CY6QVWGQ1it8/1fxty7WMyKMLG8MQXdSikp4407Fn8WUOl74OMCIv8S5HDqv78q2dWGnk+T62RKxRWFeuK3Uioi9q9UIZ04Z9oUrV4es+i83uYhK6MFyLwoRcEjYlKiI+7ZDL0Yd9GnBoCFzDIKeo+/K5Pwv5eKcNU5chKZXBALEJl7Acuf6vHoK91zi/aYaQIeiX+DYbW9QBqgPySK4GOqoUUkzr95DwXVDg/uDrPehrXd1XOeF+7xADSKZh+6xFOVGv9FTM9A/pveFL/IUGCvIUS+hBm5Z5Yu6R3N85bk7d+t7sm2B5zgY3mmbj6AK8SdXWILi
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c7ac3e6-4d34-4227-fa51-08d832cab28f
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2020 07:49:03.4657 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sImcwuRla6tIOhrXudkecSTx3wV08/thz9/36uAm6TjDuhc6+oIl218g1AGOafHu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2419
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

QW0gMjguMDcuMjAgdW0gMDY6MTcgc2NocmllYiBEYXZlIEFpcmxpZToKPiBGcm9tOiBEYXZlIEFp
cmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+Cj4gVGhpcyBpcyBjb25mdXNpbmcsIGFuZCBmcm9t
IG15IHJlYWRpbmcgb2YgYWxsIHRoZSBkcml2ZXJzIG9ubHkKPiBub3V2ZWF1IGdvdCB0aGlzIHJp
Z2h0Lgo+Cj4gSnVzdCBtYWtlIHRoZSBBUEkgYWN0IHVuZGVyIGRyaXZlciBjb250cm9sIG9mIGl0
J3Mgb3duIGFsbG9jYXRpb24KPiBmYWlsaW5nLCBhbmQgZG9uJ3QgY2FsbCBkZXN0cm95LCBpZiB0
aGUgcGFnZSB0YWJsZSBmYWlscyB0bwo+IGNyZWF0ZSB0aGVyZSBpcyBub3RoaW5nIHRvIGNsZWFu
dXAgaGVyZS4KPgo+IChJJ20gd2lsbGluZyB0byBiZWxpZXZlIEkndmUgbWlzc2VkIHNvbWV0aGlu
ZyBoZXJlLCBzbyBwbGVhc2UKPiByZXZpZXcgZGVlcGx5KS4KPgo+IFNpZ25lZC1vZmYtYnk6IERh
dmUgQWlybGllIDxhaXJsaWVkQHJlZGhhdC5jb20+CgpUaGF0IGxvb2tzIHJpZ2h0IHRvIG1lIGFz
IHdlbGwsIFJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIAo8Y2hyaXN0aWFuLmtvZW5pZ0Bh
bWQuY29tPgoKPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfc2dkbWEu
YyB8IDkgKysrLS0tLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV90dC5jICAgICAgICAg
ICAgfCAzIC0tLQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDkgZGVsZXRp
b25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9z
Z2RtYS5jIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9zZ2RtYS5jCj4gaW5kZXgg
MjBiNmQwYjNkZTVjLi5jM2NjZjY2MWI3YTYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L25vdXZlYXUvbm91dmVhdV9zZ2RtYS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUv
bm91dmVhdV9zZ2RtYS5jCj4gQEAgLTk1LDEyICs5NSw5IEBAIG5vdXZlYXVfc2dkbWFfY3JlYXRl
X3R0bShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLCB1aW50MzJfdCBwYWdlX2ZsYWdzKQo+
ICAgCWVsc2UKPiAgIAkJbnZiZS0+dHRtLnR0bS5mdW5jID0gJm52NTBfc2dkbWFfYmFja2VuZDsK
PiAgIAo+IC0JaWYgKHR0bV9kbWFfdHRfaW5pdCgmbnZiZS0+dHRtLCBibywgcGFnZV9mbGFncykp
Cj4gLQkJLyoKPiAtCQkgKiBBIGZhaWxpbmcgdHRtX2RtYV90dF9pbml0KCkgd2lsbCBjYWxsIHR0
bV90dF9kZXN0cm95KCkKPiAtCQkgKiBhbmQgdGh1cyBvdXIgbm91dmVhdV9zZ2RtYV9kZXN0cm95
KCkgaG9vaywgc28gd2UgZG9uJ3QgbmVlZAo+IC0JCSAqIHRvIGZyZWUgbnZiZSBoZXJlLgo+IC0J
CSAqLwo+ICsJaWYgKHR0bV9kbWFfdHRfaW5pdCgmbnZiZS0+dHRtLCBibywgcGFnZV9mbGFncykp
IHsKPiArCQlrZnJlZShudmJlKTsKPiAgIAkJcmV0dXJuIE5VTEw7Cj4gKwl9Cj4gICAJcmV0dXJu
ICZudmJlLT50dG0udHRtOwo+ICAgfQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRt
L3R0bV90dC5jIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fdHQuYwo+IGluZGV4IGJhYjY3ODcz
Y2ZkNC4uOWQxYzcxNzczODRjIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRt
X3R0LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV90dC5jCj4gQEAgLTI0NCw3ICsy
NDQsNiBAQCBpbnQgdHRtX3R0X2luaXQoc3RydWN0IHR0bV90dCAqdHRtLCBzdHJ1Y3QgdHRtX2J1
ZmZlcl9vYmplY3QgKmJvLAo+ICAgCXR0bV90dF9pbml0X2ZpZWxkcyh0dG0sIGJvLCBwYWdlX2Zs
YWdzKTsKPiAgIAo+ICAgCWlmICh0dG1fdHRfYWxsb2NfcGFnZV9kaXJlY3RvcnkodHRtKSkgewo+
IC0JCXR0bV90dF9kZXN0cm95KHR0bSk7Cj4gICAJCXByX2VycigiRmFpbGVkIGFsbG9jYXRpbmcg
cGFnZSB0YWJsZVxuIik7Cj4gICAJCXJldHVybiAtRU5PTUVNOwo+ICAgCX0KPiBAQCAtMjY4LDcg
KzI2Nyw2IEBAIGludCB0dG1fZG1hX3R0X2luaXQoc3RydWN0IHR0bV9kbWFfdHQgKnR0bV9kbWEs
IHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sCj4gICAKPiAgIAlJTklUX0xJU1RfSEVBRCgm
dHRtX2RtYS0+cGFnZXNfbGlzdCk7Cj4gICAJaWYgKHR0bV9kbWFfdHRfYWxsb2NfcGFnZV9kaXJl
Y3RvcnkodHRtX2RtYSkpIHsKPiAtCQl0dG1fdHRfZGVzdHJveSh0dG0pOwo+ICAgCQlwcl9lcnIo
IkZhaWxlZCBhbGxvY2F0aW5nIHBhZ2UgdGFibGVcbiIpOwo+ICAgCQlyZXR1cm4gLUVOT01FTTsK
PiAgIAl9Cj4gQEAgLTI5MCw3ICsyODgsNiBAQCBpbnQgdHRtX3NnX3R0X2luaXQoc3RydWN0IHR0
bV9kbWFfdHQgKnR0bV9kbWEsIHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sCj4gICAJZWxz
ZQo+ICAgCQlyZXQgPSB0dG1fZG1hX3R0X2FsbG9jX3BhZ2VfZGlyZWN0b3J5KHR0bV9kbWEpOwo+
ICAgCWlmIChyZXQpIHsKPiAtCQl0dG1fdHRfZGVzdHJveSh0dG0pOwo+ICAgCQlwcl9lcnIoIkZh
aWxlZCBhbGxvY2F0aW5nIHBhZ2UgdGFibGVcbiIpOwo+ICAgCQlyZXR1cm4gLUVOT01FTTsKPiAg
IAl9CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

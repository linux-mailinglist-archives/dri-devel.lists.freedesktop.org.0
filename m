Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43AC323B9AE
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 13:38:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85D226E462;
	Tue,  4 Aug 2020 11:38:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2083.outbound.protection.outlook.com [40.107.220.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 265DC6E462
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 11:38:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UTOS7T7FISVLE+I4gYxnaP4zJI5+MZz0ymysptadlask16hs2IB4lxYemXbek4ofXXnWE2ajd/zFizVIcNY6YnqEpKSy5GQ7M+ERg7i0Xy6qk9Kk0L/MEYI98OyDP0BB2Xt7WlRfY/ql0L1cvoEBEqppmyl6WMfaeiRNXtc9Mq1gpKiuZumVL7ZB8EP8f8cHdCW7mu7N+bP67wwRowDQKB/Ha4JtuvRRV7W3o6TkiaEoaq5zxHAljsyhvod6qctigOn8ea/CAqioSXy+j1FI12ahZA08X87fdj+SVaqlc7eX+TREvg/LatCpRUdwGgUvrGebl0pFE/mk11p6fOGzkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g1fQtEcSkcXZ1bDHK0HhUAvxJ3YfciBgR/E/uCpLtkE=;
 b=CcRKVdfn3QsUaX50aO+o32BjV1MQSLrXGuYElt06FxuXEjYHaqaGLTIpVSmcSCSPQPeZ4aaKf0J0tSskcCf8lRVtZY6KcFMpPafRiagyxLdq1EoR3gaTcqSwGaibwMP+4Vm7XcTCH3MWQ6D2twYEddbw9rW5stK5Mfaomp6ssASmYzn+SKLJHdodBPlE3MJUl1JwfgmCF0U1wzv1CyOWwn1U/3b0mkhEaG8kGZSm+Ss7R8kq75GRqvXcFaE/wGGowPDKb9ofHAB3RcQF7P99S+GsjNJvENjXXjd/dciK89LoRwuRjMYWlnsyi06KTfPOMlKVUvMiCw+d+mC2jp8gCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g1fQtEcSkcXZ1bDHK0HhUAvxJ3YfciBgR/E/uCpLtkE=;
 b=lDnjg1eEOuk836HDhcVJtVlkJ7m9I7dxRBSs+NTnAd4dhF7Qb0o4TTO4W64cv6fbpw1GIdPYdlTd4GLu9FufiKBFzEZBzzrM+Eb3VbwWnJ4j5hLlv5aul6DClxLbrQkSIZWHW4VcEGrCx/AA4MWpMOda7CmZvzsZayOFWw4U9/U=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4111.namprd12.prod.outlook.com (2603:10b6:208:1de::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.20; Tue, 4 Aug
 2020 11:38:50 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3239.022; Tue, 4 Aug 2020
 11:38:50 +0000
Subject: Re: [PATCH 56/59] drm/ttm: add a wrapper for checking if manager is
 in use
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200804025632.3868079-1-airlied@gmail.com>
 <20200804025632.3868079-57-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <4b3c9236-0eb1-d946-9597-daea59c0f4a4@amd.com>
Date: Tue, 4 Aug 2020 13:38:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200804025632.3868079-57-airlied@gmail.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR10CA0121.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::38) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR10CA0121.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.17 via Frontend Transport; Tue, 4 Aug 2020 11:38:48 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a622110c-9fd7-4f73-7bba-08d8386af4cd
X-MS-TrafficTypeDiagnostic: MN2PR12MB4111:
X-Microsoft-Antispam-PRVS: <MN2PR12MB41116130F618A76065F67100834A0@MN2PR12MB4111.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LR1HQ/QSDyl4BkVio0Vn/XefXunDPFffkL5jTTZS9YWnHEt8Zlk8QzS/VDx6FfR6rIDNoZpueeevQz2w38MLOW18nR/Xc7alF44VAnQMPydCf77TwXnj+husHAJDsJKTGQ45kUIxStdUsHM3mJTS3e34O7DhN2I4KmwYcQ1nqbTvmPWajfKzryxMJCnrqAHIhKtEBENCIracd/gg0Lyt6C995eANMqRxcxn24zgHzubeoZLmDg0g+5f6DHXH6s7bxEI+T5ErxqcqD5Xe+wbucNR+Gn2rMEIn7OgjaY/iLa3M+CPJevKz4WRyI/1fEMUF9fX2xOeLwx3FzzcHbt3LqlhC2r1e6I5tDhpvSYdZo1eyHJGet4WgXMUkQGIvZl0l
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(346002)(396003)(376002)(39860400002)(366004)(478600001)(6486002)(86362001)(2906002)(6666004)(66574015)(316002)(16526019)(186003)(83380400001)(52116002)(8936002)(66556008)(31696002)(4326008)(66946007)(31686004)(2616005)(66476007)(36756003)(8676002)(5660300002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: H1c8G1lZ0UQLpTPgNcBm0T0XmzqPh6s6KRYEixaJbMSQ012VEDy+g5h1kWzE9y247IsSd3k2YTRFTKCUKzTr81dPU9EzVfTOH3Ykw2SNitVwngPouq9xi+VVTflAubpOzimxCM6AgBYUuVPz+YxigQI9GJ3cHyNLK1rwK8qxPaP6xz4WbqEONJBNISu6QrRe6qu8CGLeRxC9qNMy4M317DPc2zFQp/t8vtzudP4X27IkvGxQxwed3SrAQUpJrQ80k3yzVCQf30krKgAnvIN735Pm29pfQk1/LNmcqFYBPMNNNyjShL2WD1gJtrSymyYHOpf74ND/sTvFFYV4riYqAEnwAr9XNU9LFZ/k0zZxBWGBF8S97Y3bUeP7Vjt+o1bTZ3CbdLGfMBThd1kq9dtxQTLo4ZVLdk7Sphi5TE8cmyXFHFrwqLK/HT4LM37hSK6y6OtsVifvZ/2XaC7EywM9VZkpcPtcmKNjmwPs7dY26bZYKZqbPnUlzzL2MZRvX53MKMD69eRfDcOipTBlnZpnEZT827Dr9ozaQTedDai0TlPAAsUyTD8T9O0mVt+/3QizWBekBY4o1vT3pP/J3W6GWltsWHbU2mazO3TtIlEEwcmkpAWimCOq7VD4YkeDW/zzfgLrfvl+kIs+l5Vc1QQqU8XgIrXkfW8UZR/Y8EIl6KRSfK1cR47epNoragftUo2QYhmwX3SZ193AKqQbkmGQmw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a622110c-9fd7-4f73-7bba-08d8386af4cd
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2020 11:38:50.0009 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sA73sjl7wW+bn1H7jXZgyBwLZ/zN4vb/Oic1EBTHF8v126THczADI8//997CLkOL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4111
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
Cc: sroland@vmware.com, linux-graphics-maintainer@vmware.com,
 bskeggs@redhat.com, kraxel@redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDQuMDguMjAgdW0gMDQ6NTYgc2NocmllYiBEYXZlIEFpcmxpZToKPiBGcm9tOiBEYXZlIEFp
cmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+Cj4gVGhpcyBjb252ZXJ0cyB2bXdnZnggb3ZlciB0
byB1c2luZyBhbiBpbnRlcmZhY2UgdG8gc2V0IHRoZQo+IGluIHVzZSBhbmQgY2hlY2sgdGhlIGlu
IHVzZSBmbGFnLgo+Cj4gU2lnbmVkLW9mZi1ieTogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0
LmNvbT4KClJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFt
ZC5jb20+Cgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV90dG0uYyB8
ICAxIC0KPiAgIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMgICAgICAgICAgfCAgMiArLQo+
ICAgZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmMgICB8IDE0ICsrKysrKystLS0t
LS0tCj4gICBpbmNsdWRlL2RybS90dG0vdHRtX2JvX2RyaXZlci5oICAgICAgIHwgMTQgKysrKysr
KysrKysrKysKPiAgIDQgZmlsZXMgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlv
bnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3R0
bS5jIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV90dG0uYwo+IGluZGV4IDIyMTg1
YThkY2ZhMS4uMzhhMGU0YmQxNmY3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2
ZWF1L25vdXZlYXVfdHRtLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1
X3R0bS5jCj4gQEAgLTI0MCw3ICsyNDAsNiBAQCBub3V2ZWF1X3R0bV9pbml0X2d0dChzdHJ1Y3Qg
bm91dmVhdV9kcm0gKmRybSkKPiAgIAl0dG1fbWVtX3R5cGVfbWFuYWdlcl9pbml0KG1hbiwgc2l6
ZV9wYWdlcyk7Cj4gICAJdHRtX3NldF9kcml2ZXJfbWFuYWdlcigmZHJtLT50dG0uYmRldiwgVFRN
X1BMX1RULCBtYW4pOwo+ICAgCXR0bV9tZW1fdHlwZV9tYW5hZ2VyX3NldF91c2VkKG1hbiwgdHJ1
ZSk7Cj4gLQo+ICAgCXJldHVybiAwOwo+ICAgfQo+ICAgCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS90dG0vdHRtX2JvLmMgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCj4gaW5k
ZXggY2RhMzNiNGFmNjgxLi43ZDEwYWJhZTlhNjAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3R0bS90dG1fYm8uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKPiBA
QCAtMTAwMiw3ICsxMDAyLDcgQEAgc3RhdGljIGludCB0dG1fYm9fbWVtX3BsYWNlbWVudChzdHJ1
Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAo+ICAgCQlyZXR1cm4gcmV0Owo+ICAgCj4gICAJbWFu
ID0gdHRtX21hbmFnZXJfdHlwZShiZGV2LCBtZW1fdHlwZSk7Cj4gLQlpZiAoIW1hbiB8fCAhbWFu
LT51c2VfdHlwZSkKPiArCWlmICghbWFuIHx8ICF0dG1fbWVtX3R5cGVfbWFuYWdlcl91c2VkKG1h
bikpCj4gICAJCXJldHVybiAtRUJVU1k7Cj4gICAKPiAgIAlpZiAoIXR0bV9ib19tdF9jb21wYXRp
YmxlKG1hbiwgbWVtX3R5cGUsIHBsYWNlLCAmY3VyX2ZsYWdzKSkKPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4
L3Ztd2dmeF9kcnYuYwo+IGluZGV4IDcxNjg0MDNmYjRmOC4uYjJmMWU3YTNiMDQ4IDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2Rydi5jCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmMKPiBAQCAtNjMwLDcgKzYzMCw3IEBAIHN0YXRp
YyBpbnQgdm13X3ZyYW1fbWFuYWdlcl9pbml0KHN0cnVjdCB2bXdfcHJpdmF0ZSAqZGV2X3ByaXYp
Cj4gICAJCQkJIFRUTV9QTF9GTEFHX0NBQ0hFRCwgVFRNX1BMX0ZMQUdfQ0FDSEVELAo+ICAgCQkJ
CSBmYWxzZSwgZGV2X3ByaXYtPnZyYW1fc2l6ZSA+PiBQQUdFX1NISUZUKTsKPiAgICNlbmRpZgo+
IC0JdHRtX21hbmFnZXJfdHlwZSgmZGV2X3ByaXYtPmJkZXYsIFRUTV9QTF9WUkFNKS0+dXNlX3R5
cGUgPSBmYWxzZTsKPiArCXR0bV9tZW1fdHlwZV9tYW5hZ2VyX3NldF91c2VkKHR0bV9tYW5hZ2Vy
X3R5cGUoJmRldl9wcml2LT5iZGV2LCBUVE1fUExfVlJBTSksIGZhbHNlKTsKPiAgIAlyZXR1cm4g
cmV0Owo+ICAgfQo+ICAgCj4gQEAgLTExOTIsOSArMTE5Miw5IEBAIHN0YXRpYyB2b2lkIF9fdm13
X3N2Z2FfZW5hYmxlKHN0cnVjdCB2bXdfcHJpdmF0ZSAqZGV2X3ByaXYpCj4gICAJc3RydWN0IHR0
bV9tZW1fdHlwZV9tYW5hZ2VyICptYW4gPSB0dG1fbWFuYWdlcl90eXBlKCZkZXZfcHJpdi0+YmRl
diwgVFRNX1BMX1ZSQU0pOwo+ICAgCj4gICAJc3Bpbl9sb2NrKCZkZXZfcHJpdi0+c3ZnYV9sb2Nr
KTsKPiAtCWlmICghbWFuLT51c2VfdHlwZSkgewo+ICsJaWYgKCF0dG1fbWVtX3R5cGVfbWFuYWdl
cl91c2VkKG1hbikpIHsKPiAgIAkJdm13X3dyaXRlKGRldl9wcml2LCBTVkdBX1JFR19FTkFCTEUs
IFNWR0FfUkVHX0VOQUJMRSk7Cj4gLQkJbWFuLT51c2VfdHlwZSA9IHRydWU7Cj4gKwkJdHRtX21l
bV90eXBlX21hbmFnZXJfc2V0X3VzZWQobWFuLCB0cnVlKTsKPiAgIAl9Cj4gICAJc3Bpbl91bmxv
Y2soJmRldl9wcml2LT5zdmdhX2xvY2spOwo+ICAgfQo+IEBAIC0xMjIzLDggKzEyMjMsOCBAQCBz
dGF0aWMgdm9pZCBfX3Ztd19zdmdhX2Rpc2FibGUoc3RydWN0IHZtd19wcml2YXRlICpkZXZfcHJp
dikKPiAgIAlzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXIgKm1hbiA9IHR0bV9tYW5hZ2VyX3R5
cGUoJmRldl9wcml2LT5iZGV2LCBUVE1fUExfVlJBTSk7Cj4gICAKPiAgIAlzcGluX2xvY2soJmRl
dl9wcml2LT5zdmdhX2xvY2spOwo+IC0JaWYgKG1hbi0+dXNlX3R5cGUpIHsKPiAtCQltYW4tPnVz
ZV90eXBlID0gZmFsc2U7Cj4gKwlpZiAodHRtX21lbV90eXBlX21hbmFnZXJfdXNlZChtYW4pKSB7
Cj4gKwkJdHRtX21lbV90eXBlX21hbmFnZXJfc2V0X3VzZWQobWFuLCBmYWxzZSk7Cj4gICAJCXZt
d193cml0ZShkZXZfcHJpdiwgU1ZHQV9SRUdfRU5BQkxFLAo+ICAgCQkJICBTVkdBX1JFR19FTkFC
TEVfSElERSB8Cj4gICAJCQkgIFNWR0FfUkVHX0VOQUJMRV9FTkFCTEUpOwo+IEBAIC0xMjU3LDgg
KzEyNTcsOCBAQCB2b2lkIHZtd19zdmdhX2Rpc2FibGUoc3RydWN0IHZtd19wcml2YXRlICpkZXZf
cHJpdikKPiAgIAl2bXdfa21zX2xvc3RfZGV2aWNlKGRldl9wcml2LT5kZXYpOwo+ICAgCXR0bV93
cml0ZV9sb2NrKCZkZXZfcHJpdi0+cmVzZXJ2YXRpb25fc2VtLCBmYWxzZSk7Cj4gICAJc3Bpbl9s
b2NrKCZkZXZfcHJpdi0+c3ZnYV9sb2NrKTsKPiAtCWlmIChtYW4tPnVzZV90eXBlKSB7Cj4gLQkJ
bWFuLT51c2VfdHlwZSA9IGZhbHNlOwo+ICsJaWYgKHR0bV9tZW1fdHlwZV9tYW5hZ2VyX3VzZWQo
bWFuKSkgewo+ICsJCXR0bV9tZW1fdHlwZV9tYW5hZ2VyX3NldF91c2VkKG1hbiwgZmFsc2UpOwo+
ICAgCQlzcGluX3VubG9jaygmZGV2X3ByaXYtPnN2Z2FfbG9jayk7Cj4gICAJCWlmICh0dG1fYm9f
ZXZpY3RfbW0oJmRldl9wcml2LT5iZGV2LCBUVE1fUExfVlJBTSkpCj4gICAJCQlEUk1fRVJST1Io
IkZhaWxlZCBldmljdGluZyBWUkFNIGJ1ZmZlcnMuXG4iKTsKPiBkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS9kcm0vdHRtL3R0bV9ib19kcml2ZXIuaCBiL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVy
LmgKPiBpbmRleCAzMDA5MzQyODllNjQuLmYyMzFmZTM0ZTc0NCAxMDA2NDQKPiAtLS0gYS9pbmNs
dWRlL2RybS90dG0vdHRtX2JvX2RyaXZlci5oCj4gKysrIGIvaW5jbHVkZS9kcm0vdHRtL3R0bV9i
b19kcml2ZXIuaAo+IEBAIC02NzgsNiArNjc4LDIwIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCB0dG1f
bWVtX3R5cGVfbWFuYWdlcl9zZXRfdXNlZChzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXIgKm1h
Cj4gICAJbWFuLT51c2VfdHlwZSA9IHVzZWQ7Cj4gICB9Cj4gICAKPiArLyoqCj4gKyAqIHR0bV9t
ZW1fdHlwZV9tYW5hZ2VyX3VzZWQKPiArICoKPiArICogQG1hbjogTWFuYWdlciB0byBnZXQgdXNl
ZCBzdGF0ZSBmb3IKPiArICoKPiArICogR2V0IHRoZSBpbiB1c2UgZmxhZyBmb3IgYSBtYW5hZ2Vy
Lgo+ICsgKiBSZXR1cm5zOgo+ICsgKiB0cnVlIGlzIHVzZWQsIGZhbHNlIGlmIG5vdC4KPiArICov
Cj4gK3N0YXRpYyBpbmxpbmUgYm9vbCB0dG1fbWVtX3R5cGVfbWFuYWdlcl91c2VkKHN0cnVjdCB0
dG1fbWVtX3R5cGVfbWFuYWdlciAqbWFuKQo+ICt7Cj4gKwlyZXR1cm4gbWFuLT51c2VfdHlwZTsK
PiArfQo+ICsKPiAgIC8qKgo+ICAgICogdHRtX21lbV90eXBlX21hbmFnZXJfY2xlYW51cAo+ICAg
ICoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=

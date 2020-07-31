Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7040E2346D4
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 15:26:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DB176EAA0;
	Fri, 31 Jul 2020 13:26:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2068.outbound.protection.outlook.com [40.107.92.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BBC16EAA0
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 13:26:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PYijBMCdhtlcOv8fhjdISoy/wYF5QcvJ56oMJuYynXx6egH6BO3ee6hKKe9vH1G6oB3u6YabOpser1dfcNNzT3zcFshmVOq2WAQSNmie3oZ6P0OhtFnZbK0A0B/KsOj1SpaABBD2N63v1Jil2B6xR9yDzcwvdeymVA4+Yb0Hgsr41ApDg/UUc6VHO+432V5Y8HoTzp5qmPqN2+bjQi/tTtitG2ek6iYTfeKmKqMBi3H5jtq2KHBxORuDFFUhLc13ZQc/bE9rY8+2TfORCyWSG8rzQoRl7FNub/migL48tkpayzLEBWi4ZiAjB643cFeInkroRgAkcwY01bmMfoPK1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lGCvGB2ROeONVCIhb/Qs2urA4UHY0rOMiVD4ymYZkZI=;
 b=dMl7RvR30j02OquELXqM9JWQdx2WTCuwO6We+U3mI5VHZMCmnINpgWz+nhbqOURocsXxDyPDjJ824gtKy36LyCzFIzzZzJsayLdtLnwOiiJHTZckAw8MxQjqYAeAScW4oSQQuIRMyclCsKsI+iYynq2PmBfYB8OuUB50IiFE4Y4ugjPWc5g3ij4fSoLDpBXPfGLAH9c/T4spVj8h/v5IJb3frJWV+RpgMDCRW7HqA66Aqupsivt3P3QbZckm0Y3mBK1IVhkdc2abqpbBlZJpfQFjnr6PbsBXlN9zyWs19QW4SJ/I2PSa0Cp6viL2NuKYSXdNAhp1YmRg9GQzrkQheQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lGCvGB2ROeONVCIhb/Qs2urA4UHY0rOMiVD4ymYZkZI=;
 b=eLroeAkr46Ymlpm6WE9zxF2Y5DWlmqm0v6wK9GcKwfRBwJ1ijcAyvmnLaZHWTdmEL8wHPYFXKrufkb5dW6CBIuei6kIPZNLZ+MO0azYSwd7ubNhx6DypKqVRfFdf9vXHycvqCtWZ7wEXZyvKJ6ClKe0ytIDVM7olIFEMclFdP2c=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4301.namprd12.prod.outlook.com (2603:10b6:208:1d4::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17; Fri, 31 Jul
 2020 13:26:06 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3239.020; Fri, 31 Jul 2020
 13:26:06 +0000
Subject: Re: [PATCH 36/49] drm/vmwgfx/gmrid: don't provide pointless ttm debug
 callback
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200731040520.3701599-1-airlied@gmail.com>
 <20200731040520.3701599-37-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <ac8c8bc9-fb28-709b-d09e-9114d45efe1b@amd.com>
Date: Fri, 31 Jul 2020 15:26:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200731040520.3701599-37-airlied@gmail.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR04CA0021.eurprd04.prod.outlook.com
 (2603:10a6:208:122::34) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR04CA0021.eurprd04.prod.outlook.com (2603:10a6:208:122::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16 via Frontend
 Transport; Fri, 31 Jul 2020 13:26:05 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 963c1f75-43c6-4315-a60e-08d8355547a7
X-MS-TrafficTypeDiagnostic: MN2PR12MB4301:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4301B17EB99A6AA88D6C4403834E0@MN2PR12MB4301.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZnFVNFO/nHuxi9xa74Yk2wOenWGyMmp55XJ9sCQYXK1he2Fnrvote7urS7dUPuBX+1rJBKXdMfeb7UIcF551HI1mMci1lnfSM3skT5NjjUdYbsqNOVDtYZKeeph++7X/lnSbEkiP8jbzzGFBLcfxBvJa3E8BScQdVQ6qwdgXCHhrStg33zwnp+RqbJCMl7LbZ2VQdJR0TFh6AZL4TtxlTHiP9AgzhVb++WvzIn458yE49P0AjBQ1+rCgJ6+1Rvbtlupr9hZnzJFooLAQXynaiqgwyz+iq7LKZSubzAxfjCBof+72g53PYBY//tlY/yJPsR5lommMFS47+hjvbjP+O3LH3tLUCEonw0oL4u4fQF3kIMsw2S6yYILE22VZo//f
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(396003)(346002)(376002)(136003)(39860400002)(8936002)(8676002)(31696002)(6666004)(36756003)(31686004)(4326008)(478600001)(316002)(6486002)(5660300002)(66476007)(86362001)(2616005)(66556008)(66946007)(52116002)(186003)(16526019)(2906002)(83380400001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: +lTMTzi72LWAJIp+uvPIyjwD8PKAEkar3I5V+NV41ABudUO2myvIrxP9xRJ+vftx7GF+7aApO+eX1N5m5TjHsyEWULeliEZkPETsMA44rxzXMlThuug6sxzp9GV45cm7aljKwcQy8r4axISLm+KXHcABVADRIgP7SLiYQCZF9s51xataAJSQbMM8OW/DvMqg1O14xMktqK8UIhXi642C+YP/0e5o4KLu0T25m+2XzX80h/S7OkyK1apzCSWdTARqM2bX+Kl+JgnTagfmPx/rMdbu1eMD3oQg4trIv+YXgWv2m9oiiNcyra7C1tUVpupRKkuaF2k27epeH84iWin4MWDHFDo2HfAYfWy8Bq2uOs6I0MK1VhdV9XltOu2qlkxIdFOy5kVN8XDq3sAFPPDKusHFIgU5jN+Yna9QfDnDEBriKHCUg8mr+tli+XQBGgluyN4gZRYoSRbo5k5iALV6rPSltYsMAs98/rki0iUikcUleiRqrIcO/kSuObikq+ypuqAa+zUwYmKDkPBlYEQgIYktMotwlkANhspeKUMJ1hfpS2GeBtkQ+4pvV1oAgEjkLQzShVbIVRigg/Cyv7zu+ywZxw0hawHXZk4kCgT47lz5fqWKWDC0DbIobyex6Rj/WKPm0/yhPKzARqPrDbfQKDzwiuSg/CRF6uVMGZs+2kQKeC3nE6iUkIOBh3la68QN0FCUAvGbOrsnwyZcWzI1+Q==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 963c1f75-43c6-4315-a60e-08d8355547a7
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2020 13:26:06.6065 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: klGsX19wJwsvKPMXpOwe7m8oSHzzNskBNyIgfRalY9q20uIqTlyv4kDyqlqHgPAx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4301
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
PGFpcmxpZWRAcmVkaGF0LmNvbT4KCkFja2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3Rp
YW4ua29lbmlnQGFtZC5jb20+Cgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdn
ZnhfZ21yaWRfbWFuYWdlci5jIHwgNyAtLS0tLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgNyBkZWxl
dGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9n
bXJpZF9tYW5hZ2VyLmMgYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9nbXJpZF9tYW5h
Z2VyLmMKPiBpbmRleCAzZmE4MDliNWUzYmQuLjJkYjk5ZjA0NDliMCAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9nbXJpZF9tYW5hZ2VyLmMKPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9nbXJpZF9tYW5hZ2VyLmMKPiBAQCAtMTQ5LDE0ICsx
NDksNyBAQCB2b2lkIHZtd19nbXJpZF9tYW5fdGFrZWRvd24oc3RydWN0IHZtd19wcml2YXRlICpk
ZXZfcHJpdiwgaW50IHR5cGUpCj4gICAJdHRtX2JvX21hbl9jbGVhbnVwKG1hbik7Cj4gICB9Cj4g
ICAKPiAtc3RhdGljIHZvaWQgdm13X2dtcmlkX21hbl9kZWJ1ZyhzdHJ1Y3QgdHRtX21lbV90eXBl
X21hbmFnZXIgKm1hbiwKPiAtCQkJCXN0cnVjdCBkcm1fcHJpbnRlciAqcHJpbnRlcikKPiAtewo+
IC0JZHJtX3ByaW50ZihwcmludGVyLCAiTm8gZGVidWcgaW5mbyBhdmFpbGFibGUgZm9yIHRoZSBH
TVIgaWQgbWFuYWdlclxuIik7Cj4gLX0KPiAtCj4gICBzdGF0aWMgY29uc3Qgc3RydWN0IHR0bV9t
ZW1fdHlwZV9tYW5hZ2VyX2Z1bmMgdm13X2dtcmlkX21hbmFnZXJfZnVuYyA9IHsKPiAgIAkuZ2V0
X25vZGUgPSB2bXdfZ21yaWRfbWFuX2dldF9ub2RlLAo+ICAgCS5wdXRfbm9kZSA9IHZtd19nbXJp
ZF9tYW5fcHV0X25vZGUsCj4gLQkuZGVidWcgPSB2bXdfZ21yaWRfbWFuX2RlYnVnCj4gICB9OwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

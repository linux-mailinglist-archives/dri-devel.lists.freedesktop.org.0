Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4AF276F9F
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 13:13:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57C746E202;
	Thu, 24 Sep 2020 11:13:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2065.outbound.protection.outlook.com [40.107.243.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC4AF6E202
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 11:13:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NLxy9MvwzJStDzVxwcELX6j2eNxFQVhOfRDWYkL2Brj5hE8JbgYyXyf5RzLsPqNfbPFG6YBO+9MKeB538Iu8Sk9bLNQ2mflTBqD8ckI4zEsCt+xEzbDaXRLRQDVi9WkhXbo8y8536AnLjl+Qb0LRYrG4PH5u8Ml/Nyzsov8J0TyDfpBzQiolWLkPh791QV9LhvmS2Uqf1kz9jdmLUd0ZRRIwXloPtUSk23PbdQ9e8Pd2vks9KFa6PmHBaSGOjyTogJg453g16nDmpqrNABhCxAuLWTj5MPzDsyKxqH5pmeJr24WJev1UGQghFS2NSIfdrjgyjwOeHZMBe16hBBs7Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cfTAiJe4bOuDE1/CFezTkCvlouM9buYgYZvEcYVO5Ss=;
 b=NWPd2kpjUXoB2QD7O14537Moa38gALMqaY57ze0nqLr+SQyO5GjeZas0V8Xab7ngOgFdh7DfjEww4Qt+rHtJqwupEk3VmuS/bepX/0XO/+kont/gTbS3nppPUlub97Siz3hhHJcVkXI82fd6kbdM0V5qsL+svJe+qVY2CzaQCgybWWpLjqg8W58jdAE1hOxjRgU4NvHvIel3ykx1cCCvYNdYylwCNk1yDcN3jQ99FNZSAR+DVxFAsDvxexKCqW8Xr44Hhsrbu097sPygASZGCTCV1Yp9BPtjHY36omV7uW0LuvcUjAqZmJ6AXv/jhPAiKrK7C/1kXMWdwK1pR6mT/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cfTAiJe4bOuDE1/CFezTkCvlouM9buYgYZvEcYVO5Ss=;
 b=KaeVUpq8kOBncIc8Acohj3kyWD68E1X7oivkrKZHTY4g23xwzP1DHR0QqMLslPG1uIT6j1GwXlXIAswExBYLTbFKeyMkUc5q7OPPMuQIMAXUCnOmUgzoz+eu/E8mAk/oa67fxe7rFMXvQtjAS9s58Ep0/jc1h2wg8yqBFhHfK1M=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2356.namprd12.prod.outlook.com (2603:10b6:207:4d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.22; Thu, 24 Sep
 2020 11:13:46 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3412.022; Thu, 24 Sep 2020
 11:13:46 +0000
Subject: Re: [PATCH 07/45] drm/vmwgfx: add a move callback.
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200924051845.397177-1-airlied@gmail.com>
 <20200924051845.397177-8-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <27533ac6-051e-5bc1-391a-e7f02ccac762@amd.com>
Date: Thu, 24 Sep 2020 13:13:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200924051845.397177-8-airlied@gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR03CA0020.eurprd03.prod.outlook.com
 (2603:10a6:208:14::33) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR03CA0020.eurprd03.prod.outlook.com (2603:10a6:208:14::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.22 via Frontend Transport; Thu, 24 Sep 2020 11:13:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ece965d7-5dcb-424d-9417-08d8607ae7a8
X-MS-TrafficTypeDiagnostic: BL0PR12MB2356:
X-Microsoft-Antispam-PRVS: <BL0PR12MB2356A04395D7D910082E1E9983390@BL0PR12MB2356.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GfKQNbZtocCYRbY2A/LJ5xNggz82JwOgx8NawbiGHCwBIvEOepUWe25HNH9L7HrNEQF/085Ijp5R9IJHfSm0Xtbr1S6nyOe7YQG3tuCDW3NUCjl7QCLu9MJzlQY7PxC3rCbHOPu+GPgtWA0hLCGozV/FVsa3L4N1esrFY96H5noEu2E2MZrSTZCvq9nDTp5JyP56HKbuAP8A5ehXlPdibTF5K91o5kHM9+jgk9QYjuF+z0JkOWleeTtuuciEgEqSSYalNECdUvdvIahYTz/BeHhGl6BOy7O0pSj8MjVPjfrIWcd388dIu+GK/WaUFVMByCrskt5sZ+bREF5L9JbjE52BNPdT5Cvy2Xfoa0+HZJr8kylCrUFq9pO1A6UE14nM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(396003)(39860400002)(136003)(366004)(86362001)(66946007)(6666004)(6486002)(478600001)(2616005)(4326008)(83380400001)(8936002)(31686004)(66556008)(5660300002)(66476007)(52116002)(186003)(36756003)(16526019)(8676002)(316002)(31696002)(2906002)(66574015)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: QCsmVp7m8Chy8jbfrU0lkx0Qkg12XA86PLxqBVEL45s0lpz+MuySWq6jpf67omhdrJeXVkTkDvwtLuIA0ha4jZPxzCCkc7WD7JS/2by0J9Zy5adP2Eqhll7AkHiX68cFn+eDxnNFkULlAGrR/PJqvW7Lch2Gy5SmcWgpN5ccVDeZ3mjX5XG1Tbg/DrKfwwHjYRYy77pKUJy/I/ynL1VzCNZG7GWgtVVI457JO/bHU1nenxq7WXJK5pAscpO5PZ/2NQagranP106D4lVg5y8CENUMvZEtkmDUszGrOOrl1rTZ7aLy3qqOeN350zvgksOE9o17tbfVa8Rq3fcRChnzjltOGkCdq8x8oDFkzPgvXMMKFiV04xqZuFMIpAfgT7vzTUK+AwSc3hy/8Fir5ZzFZ1cdvlTcoPRlWrxXpT/vbdLxW2PE8TwUmo1GMO3/NBe8tKJdhrROVTWAojjTDd0WYPcZ0k31BuyvTApA3uUD0FbodWtV52aUuEnaKKS4Bqhx06i3hPFDPDETZ4yQzvkq0Q3GJwtevpFpDTCm1eY91T3V9RQZTl36l8rILbOntI38yFzSfTmQVdWHAUnP1WkN0gnTLwnHBKvnyd9JM5tm3sWNnX/qLETcRNelQfYvhthTmrowgmiMlN5q+17L28GREJv51Eo2xJsEjtR5F7DLbCtprVV5MmZqVgmUe9NrOKGfTd0de+lvSSu1mcIrOhmZTg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ece965d7-5dcb-424d-9417-08d8607ae7a8
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2020 11:13:46.4115 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cIwYk98Dk7tz5iQhZLfKK7Yjq1et5Picm2Zb1jL8wWKF7Wnn4rSnq8hLXoGdjkAE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2356
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
cmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+Cj4gVGhpcyBqdXN0IGNvcGllcyB0aGUgZmFsbGJh
Y2sgdG8gdm13Z2Z4LCBJJ20gZ29pbmcgdG8gaXRlcmF0ZSBvbiB0aGlzCj4gYSBiaXQgdW50aWwg
aXQncyBub3QgdGhlIHNhbWUgYXMgdGhlIGZhbGxiYWNrIHBhdGguCj4KPiBTaWduZWQtb2ZmLWJ5
OiBEYXZlIEFpcmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+IC0tLQo+ICAgZHJpdmVycy9ncHUv
ZHJtL3Ztd2dmeC92bXdnZnhfdHRtX2J1ZmZlci5jIHwgMTkgKysrKysrKysrKysrKysrKysrLQo+
ICAgMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF90dG1fYnVmZmVyLmMgYi9k
cml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF90dG1fYnVmZmVyLmMKPiBpbmRleCAyZjg4ZDJk
NzlmOWEuLjZlMzZmYzkzMmFlYiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4
L3Ztd2dmeF90dG1fYnVmZmVyLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dm
eF90dG1fYnVmZmVyLmMKPiBAQCAtNzI1LDYgKzcyNSwyMyBAQCBzdGF0aWMgdm9pZCB2bXdfc3dh
cF9ub3RpZnkoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibykKPiAgIAkodm9pZCkgdHRtX2Jv
X3dhaXQoYm8sIGZhbHNlLCBmYWxzZSk7Cj4gICB9Cj4gICAKPiArc3RhdGljIGludCB2bXdfbW92
ZShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAo+ICsJCSAgICAgYm9vbCBldmljdCwKPiAr
CQkgICAgIHN0cnVjdCB0dG1fb3BlcmF0aW9uX2N0eCAqY3R4LAo+ICsJCSAgICAgc3RydWN0IHR0
bV9yZXNvdXJjZSAqbmV3X21lbSkKPiArewo+ICsJc3RydWN0IHR0bV9yZXNvdXJjZV9tYW5hZ2Vy
ICpvbGRfbWFuID0gdHRtX21hbmFnZXJfdHlwZShiby0+YmRldiwgYm8tPm1lbS5tZW1fdHlwZSk7
Cj4gKwlzdHJ1Y3QgdHRtX3Jlc291cmNlX21hbmFnZXIgKm5ld19tYW4gPSB0dG1fbWFuYWdlcl90
eXBlKGJvLT5iZGV2LCBuZXdfbWVtLT5tZW1fdHlwZSk7Cj4gKwo+ICsJaWYgKG9sZF9tYW4tPnVz
ZV90dCAmJiBuZXdfbWFuLT51c2VfdHQpIHsKPiArCQlpZiAoYm8tPm1lbS5tZW1fdHlwZSA9PSBU
VE1fUExfU1lTVEVNKSB7Cj4gKwkJCXR0bV9ib19hc3NpZ25fbWVtKGJvLCBuZXdfbWVtKTsKPiAr
CQkJcmV0dXJuIDA7Cj4gKwkJfQo+ICsJCXJldHVybiB0dG1fYm9fbW92ZV90dG0oYm8sIGN0eCwg
bmV3X21lbSk7Cj4gKwl9IGVsc2UKPiArCQlyZXR1cm4gdHRtX2JvX21vdmVfbWVtY3B5KGJvLCBj
dHgsIG5ld19tZW0pOwoKVGhpcyBzaG91bGQgYmUgIn0gZWxzZSB7IiwgYXBhcnQgZnJvbSB0aGF0
IFJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIAo8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29t
PgoKPiArfQo+ICAgCj4gICBzdHJ1Y3QgdHRtX2JvX2RyaXZlciB2bXdfYm9fZHJpdmVyID0gewo+
ICAgCS50dG1fdHRfY3JlYXRlID0gJnZtd190dG1fdHRfY3JlYXRlLAo+IEBAIC03MzUsNyArNzUy
LDcgQEAgc3RydWN0IHR0bV9ib19kcml2ZXIgdm13X2JvX2RyaXZlciA9IHsKPiAgIAkudHRtX3R0
X2Rlc3Ryb3kgPSAmdm13X3R0bV9kZXN0cm95LAo+ICAgCS5ldmljdGlvbl92YWx1YWJsZSA9IHR0
bV9ib19ldmljdGlvbl92YWx1YWJsZSwKPiAgIAkuZXZpY3RfZmxhZ3MgPSB2bXdfZXZpY3RfZmxh
Z3MsCj4gLQkubW92ZSA9IE5VTEwsCj4gKwkubW92ZSA9IHZtd19tb3ZlLAo+ICAgCS52ZXJpZnlf
YWNjZXNzID0gdm13X3ZlcmlmeV9hY2Nlc3MsCj4gICAJLm1vdmVfbm90aWZ5ID0gdm13X21vdmVf
bm90aWZ5LAo+ICAgCS5zd2FwX25vdGlmeSA9IHZtd19zd2FwX25vdGlmeSwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=

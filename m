Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 896A71DB483
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 15:03:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6588E6E1F6;
	Wed, 20 May 2020 13:03:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2064.outbound.protection.outlook.com [40.107.92.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA2446E1F6
 for <dri-devel@lists.freedesktop.org>; Wed, 20 May 2020 13:03:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nMWSzcIApTyrN7lTIvjaQNAP82UksB+a9CNv2NpDWXnMR9xjN4MDOfQZqFeq0l+OZrCHVtFTN+E0ycHPyHB+3RGAl/nReE/0dnQzxJQoq6W5k5SxQnUHVF3y36b7XBFY82Wdj0MKWIGNqdtjkMW6dSUgfshLTVttPWI3C5Hrj66TOeoY3tmurRlffDbzC1ZbuhzSmS1NjMvohh/XqKynYR1mW5xG+6OdA0qqHMTcJqlZzasskzcUQ9lW/xbgqSbTl7adczjpdb1bGWcvjaSl78KKNIWouj1kkrmtz2weRUSILttvfWzHY8XwTnJnCEyvonogeygGynBJMeNOm6Cfww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TAV5E7vFjiJrGTwjle1zln4frt5JDsqO1boI70jhlWc=;
 b=ICetvmlbOG396c6M5ks7kKANie77qYMc6H8Sd0euWzfwP4F7CDirVXA6fc+UUCRNR4+jSSiAFPTIqezOS88Dtnk30S3HMuP18XKC3RKfgQ55ZYlrwHRA2zT2ANd2HosqNKdB1gE1WjKIQHoH201p1ZYMtQNBiONQAeftjGH/1I/ReLZvx8YLAibmvFVGjA9nP3ESqdiUIjJiqlj8VyqA7qhrYEQXzBrZmORiIlXehGnzKOnY2FJOg6In3KNq+CAxpof+mx8W6yMyBVp2b87hsGJdZcFWmcwdXOG6B33cw4G6KVJCqHTvSOP6w/5wXnZ5raPXz4g0YuJJN7KQAOvfPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TAV5E7vFjiJrGTwjle1zln4frt5JDsqO1boI70jhlWc=;
 b=iKOGCeRUTB2leXLJmJmDZwPLTQCu0Gp4gOK+ayBZKiOY2yIzNSwfdg99v9NtLqg2j9jGpWtbMmiOOcFKHSlMhoxOeKe3QI1u4UGog2bBrE2sU2sCLyi6thSTacc1Fp6E/+7SQEF0jtuLrHDRSjyLj4tttrC/ik58k1cByfzhm5Y=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4401.namprd12.prod.outlook.com (2603:10b6:5:2a9::15)
 by DM6PR12MB3977.namprd12.prod.outlook.com (2603:10b6:5:1ce::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20; Wed, 20 May
 2020 13:03:28 +0000
Received: from DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766]) by DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766%3]) with mapi id 15.20.3021.020; Wed, 20 May 2020
 13:03:28 +0000
Subject: Re: [PATCH 1/1] drm: check for NULL pointer in drm_gem_object_put
To: Daniel Vetter <daniel@ffwll.ch>
References: <20200520121450.79340-1-nirmoy.das@amd.com>
 <96a01388-7d91-56b5-4cd4-16052aba7a60@amd.com>
 <158997895740.8153.16875812670855148581@build.alporthouse.com>
 <b2284cd6-56cb-847a-1b6f-e4825c4ec1d3@amd.com>
 <20200520130058.GZ206103@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <11e1109c-79ad-ed06-8afc-067750f27351@amd.com>
Date: Wed, 20 May 2020 15:03:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20200520130058.GZ206103@phenom.ffwll.local>
Content-Language: en-US
X-ClientProxiedBy: AM0PR07CA0003.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::16) To DM6PR12MB4401.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR07CA0003.eurprd07.prod.outlook.com (2603:10a6:208:ac::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3021.12 via Frontend Transport; Wed, 20 May 2020 13:03:26 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 93525f44-00be-4734-e4fa-08d7fcbe302c
X-MS-TrafficTypeDiagnostic: DM6PR12MB3977:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB3977051087F01353FA820AD283B60@DM6PR12MB3977.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:949;
X-Forefront-PRVS: 04097B7F7F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nvh/LfPpDau06jwFx2TG0ZXa6omHm030thnhn6Cgn0JuZ1+FezhpYuh1wtqGLmBFamYneCl8vBkRSelmq+NX5QlYin3k6s+B0DUI4oTG/sOTZPjpNRUu4gI6xOkvZdzpve3h/9o7TCMf+GCuADmBZQIERlak2aOIlPGHuEagT2zrx8aeCf32YyMabPwtMpDlmBaK6jUYLJUaydI8jNPrC49r//vfJ1PvdJZw6uNn5NGKeqUQDV0weYdo3LAQmxQ4TjMaM3/+mKJ+Q5i3DAT3BV0TibtS6admys5Kk3csfp0EkWfVbX1kFzGziBoX3geDAX0lyaPGjBKmseU9EG7CF8rCE96wh9LLnKhu112FJClhVNKTPRm+UlyFcecb7gPTtUfO6zcJtQBGjLuY1e9KTB5iYZ9TBE1ED1gDOxvolkYdzmw+1l1RTcz7OwAfYUBK+XWWQcNpTZxZqXNUO8WrV5Yn9nsZzfgbfBSijbbowiiu7EKRl0IB1xdSNZTZ6i5r
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4401.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(346002)(376002)(136003)(366004)(396003)(8676002)(2906002)(31686004)(2616005)(66476007)(66556008)(4326008)(16526019)(36756003)(6486002)(66946007)(6666004)(54906003)(316002)(478600001)(86362001)(6916009)(66574014)(5660300002)(31696002)(186003)(52116002)(8936002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: NvldNPVHWyDklqZ8E/8s/UQ1pLgP5rQSrabrH/58NVtJS+SDfon5nioczpzfk3RFOM3Wpyi0512LG0XboJWqctDP0VtFK6LaaLt293Tjb6ZOCpEcRI17NJMAfrVeEgOqlYVsn3VstHKyXX8tHRlH+LUvklM0lQmyL/XtxGHyTcDlvTsL02y5YxfDz0d7oRTil7kjagCUywV6yAD1QCko9u+LNByI1VQYZ2rLt7dQw2NNxi9R0kXJPUXqAyGqNF99hvAP8nCLQTFlXDW7qRZngBrKbnZ7iZBlXyKgxk1yFl+7gD2kZkw79pGDmJaN0qcwXc7Oy2aApt4pveEcnjfeWoGbl6v+AqtripgHEtHgpDQUjUu1ZxXtQmtkmZ1/ZbTlSV7IDgMybJ9HqaLCDuQuGwpeKvPdpYJ9X+V1mYhawv99vX1tkt+5xq8z+WmvApfcjQ4taaXc+vbnxyA2Jr+SEfLAMOY5FjC5dHI4ZBxj9Iz9zSPXB7m345+9fjGHxh9e7IzximVgh/CMSuNZsLUopL7PsbRIzO9xC66b0y5R9zt4DPSZRFiINj5KVHeR0lzC
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93525f44-00be-4734-e4fa-08d7fcbe302c
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2020 13:03:27.9474 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n9INIAx32USrMvqsJRBp8SbYJ7KCQntqxVVB13H72l1TK+NZK6W4Orgzodsa4+zT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3977
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
Cc: Emil Velikov <emil.l.velikov@gmail.com>,
 Nirmoy Das <nirmoy.aiemd@gmail.com>, Nirmoy Das <nirmoy.das@amd.com>,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjAuMDUuMjAgdW0gMTU6MDAgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIFdlZCwgTWF5
IDIwLCAyMDIwIGF0IDAyOjU0OjU1UE0gKzAyMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+
IEFtIDIwLjA1LjIwIHVtIDE0OjQ5IHNjaHJpZWIgQ2hyaXMgV2lsc29uOgo+Pj4gUXVvdGluZyBD
aHJpc3RpYW4gS8O2bmlnICgyMDIwLTA1LTIwIDEzOjE5OjQyKQo+Pj4+IEFtIDIwLjA1LjIwIHVt
IDE0OjE0IHNjaHJpZWIgTmlybW95IERhczoKPj4+Pj4gZHJtX2dlbV9mYl9kZXN0cm95KCkgY2Fs
bHMgZHJtX2dlbV9vYmplY3RfcHV0KCkgd2l0aCBOVUxMIG9iaiBjYXVzaW5nOgo+Pj4+PiBbICAg
MTEuNTg0MjA5XSBCVUc6IGtlcm5lbCBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2UsIGFkZHJlc3M6
IDAwMDAwMDAwMDAwMDAwMDAKPj4+Pj4gWyAgIDExLjU4NDIxM10gI1BGOiBzdXBlcnZpc29yIHdy
aXRlIGFjY2VzcyBpbiBrZXJuZWwgbW9kZQo+Pj4+PiBbICAgMTEuNTg0MjE1XSAjUEY6IGVycm9y
X2NvZGUoMHgwMDAyKSAtIG5vdC1wcmVzZW50IHBhZ2UKPj4+Pj4gWyAgIDExLjU4NDIxNl0gUEdE
IDAgUDREIDAKPj4+Pj4gWyAgIDExLjU4NDIyMF0gT29wczogMDAwMiBbIzFdIFNNUCBOT1BUSQo+
Pj4+PiBbICAgMTEuNTg0MjIzXSBDUFU6IDcgUElEOiAxNTcxIENvbW06IGdub21lLXNoZWxsIFRh
aW50ZWQ6IEcgICAgICAgICAgICBFICAgICA1LjcuMC1yYzEtMS1kZWZhdWx0KyAjMjcKPj4+Pj4g
WyAgIDExLjU4NDIyNV0gSGFyZHdhcmUgbmFtZTogTWljcm8tU3RhciBJbnRlcm5hdGlvbmFsIENv
LiwgTHRkLiBNUy03QTMxL1gzNzAgWFBPV0VSIEdBTUlORyBUSVRBTklVTSAoTVMtN0EzMSksIEJJ
T1MgMS5NUiAxMi8wMy8yMDE5Cj4+Pj4+IFsgICAxMS41ODQyMzddIFJJUDogMDAxMDpkcm1fZ2Vt
X2ZiX2Rlc3Ryb3krMHgyOC8weDcwIFtkcm1fa21zX2hlbHBlcl0KPj4+Pj4gPHNuaXA+Cj4+Pj4+
IFsgICAxMS41ODQyNTZdIENhbGwgVHJhY2U6Cj4+Pj4+IFsgICAxMS41ODQyNzldICBkcm1fbW9k
ZV9ybWZiKzB4MTg5LzB4MWMwIFtkcm1dCj4+Pj4+IFsgICAxMS41ODQyOTldICA/IGRybV9tb2Rl
X3JtZmIrMHgxYzAvMHgxYzAgW2RybV0KPj4+Pj4gWyAgIDExLjU4NDMxNF0gIGRybV9pb2N0bF9r
ZXJuZWwrMHhhYS8weGYwIFtkcm1dCj4+Pj4+IFsgICAxMS41ODQzMjldICBkcm1faW9jdGwrMHgx
ZmYvMHgzYjAgW2RybV0KPj4+Pj4gWyAgIDExLjU4NDM0N10gID8gZHJtX21vZGVfcm1mYisweDFj
MC8weDFjMCBbZHJtXQo+Pj4+PiBbICAgMTEuNTg0NDIxXSAgYW1kZ3B1X2RybV9pb2N0bCsweDQ5
LzB4ODAgW2FtZGdwdV0KPj4+Pj4gWyAgIDExLjU4NDQyN10gIGtzeXNfaW9jdGwrMHg4Ny8weGMw
Cj4+Pj4+IFsgICAxMS41ODQ0MzBdICBfX3g2NF9zeXNfaW9jdGwrMHgxNi8weDIwCj4+Pj4+IFsg
ICAxMS41ODQ0MzRdICBkb19zeXNjYWxsXzY0KzB4NWYvMHgyNDAKPj4+Pj4gWyAgIDExLjU4NDQz
OF0gIGVudHJ5X1NZU0NBTExfNjRfYWZ0ZXJfaHdmcmFtZSsweDQ0LzB4YTkKPj4+Pj4gWyAgIDEx
LjU4NDQ0MF0gUklQOiAwMDMzOjB4N2YwZWY4MGY3MjI3Cj4+Pj4+Cj4+Pj4+IFNpZ25lZC1vZmYt
Ynk6IE5pcm1veSBEYXMgPG5pcm1veS5kYXNAYW1kLmNvbT4KPj4+PiBGaXhlczogLi4uLiBtaXNz
aW5nIGhlcmUuIEFwYXJ0IGZyb20gdGhhdCBSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZwo+
Pj4+IDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Lgo+Pj4+Cj4+Pj4gUGxlYXNlIHJlc2VuZCB3
aXRoIHRoZSB0YWcgYWRkZWQsIHRoZW4gSSdtIGdvaW5nIHRvIHB1c2ggdGhpcyB0bwo+Pj4+IGRy
bS1taXNjLW5leHQgYXNhcC4KPj4+Pgo+Pj4+IENocmlzdGlhbi4KPj4+Pgo+Pj4+PiAtLS0KPj4+
Pj4gICAgIGluY2x1ZGUvZHJtL2RybV9nZW0uaCB8IDMgKysrCj4+Pj4+ICAgICAxIGZpbGUgY2hh
bmdlZCwgMyBpbnNlcnRpb25zKCspCj4+Pj4+Cj4+Pj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2Ry
bS9kcm1fZ2VtLmggYi9pbmNsdWRlL2RybS9kcm1fZ2VtLmgKPj4+Pj4gaW5kZXggNTIxNzNhYmRm
NTAwLi5hMTM1MTAzNDZhOWIgMTAwNjQ0Cj4+Pj4+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9nZW0u
aAo+Pj4+PiArKysgYi9pbmNsdWRlL2RybS9kcm1fZ2VtLmgKPj4+Pj4gQEAgLTM3Miw2ICszNzIs
OSBAQCBzdGF0aWMgaW5saW5lIHZvaWQgZHJtX2dlbV9vYmplY3RfZ2V0KHN0cnVjdCBkcm1fZ2Vt
X29iamVjdCAqb2JqKQo+Pj4+PiAgICAgc3RhdGljIGlubGluZSB2b2lkCj4+Pj4+ICAgICBkcm1f
Z2VtX29iamVjdF9wdXQoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmopCj4+Pj4+ICAgICB7Cj4+
Pj4+ICsgICAgIGlmICghb2JqKQo+Pj4+PiArICAgICAgICAgICAgIHJldHVybjsKPj4+Pj4gKwo+
Pj4gVGhpcyBhZGRzIHNldmVyYWwgdGhvdXNhbmQgTlVMTCBjaGVja3Mgd2hlcmUgdGhlcmUgd2Vy
ZSBwcmV2aW91c2x5IG5vbmUuCj4+PiBJIGRvdWJ0IHRoZSBjb21waWxlciBlbGltaW5hdGVzIHRo
ZW0gYWxsLgo+Pj4KPj4+IEknZCBzdWdnZXN0IHJldmVydGluZwo+Pj4gYjVkMjUwNzQ0Y2NjICgi
ZHJtL2dlbTogZm9sZCBkcm1fZ2VtX29iamVjdF9wdXRfdW5sb2NrZWQgYW5kIF9fZHJtX2dlbV9v
YmplY3RfcHV0KCkiKQo+PiBJIGRpZG4ndCBsb29rZWQgaW50byB0aGlzIHBhdGNoIGluIGRldGFp
bCwgYnV0IGFsbG93aW5nIHRvIGNhbGwgKl9wdXQoKQo+PiBmdW5jdGlvbnMgd2l0aCBOVUxMIGFu
ZCBub3RoaW5nIGJhZCBoYXBwZW5zIGlzIHJhdGhlciBjb21tb24gcHJhY3RpY2UuCj4+Cj4+IE9u
IHRoZSBvdGhlciBoYW5kIEkgYWdyZWUgdGhhdCB0aGlzIG1pZ2h0IGNhdXNlIGEgcGVyZm9ybWFu
Y2UgcHJvYmxlbS4gSG93Cj4+IG1hbnkgc2l0ZXMgZG8gd2UgaGF2ZSB3aGljaCBjb3VsZCBjYWxs
IGRybV9nZW1fb2JqZWN0X3B1dCgpIHdpdGggTlVMTD8KPiBIbSBob3cgZGlkIHdlIGV2ZW4gZ2V0
IHRvIGEgcGxhY2Ugd2hlcmUgb25lIG9mIHRoZSBfcHV0IGZ1bmN0aW9ucyBoYWQgYQo+IE5VTEwg
Y2hlY2sgYW5kIHRoZSBvdGhlciBkaWRuJ3Q/CgpObyBpZGVhLgoKPiBJIGRvIGV4cGVjdCB0aGUg
Y29tcGlsZXIgdG8gY2xlYW4gdXAgdGhlIGVudGlyZSBtZXNzLCBvbmx5IHBsYWNlIHdoZXJlIEkK
PiBjYW4gdGhpbmsgb2YgTlVMTCBjaGVja3MgaXMgZHVtYiBjbGVhbnVwIGNvZGUgd2hlbiBkcml2
ZXIgbG9hZCBmYWlsZWQKPiBoYWxmd2F5IHRocm91Z2guIEluIGFsbCBvdGhlciBwbGFjZXMgdGhl
IGNvbXBpbGVyIHNob3VsZCBoYXZlIHNvbWUKPiBldmlkZW5jZSB0aGF0IHRoZSBwb2ludGVyIGlz
bid0IE5VTEwuIEJ1dCB3b3VsZCBiZSBnb29kIHRvIGNoZWNrIHRoYXQncwo+IHRoZSBjYXNlIGFu
ZCB3ZSdyZSBub3QgZG9pbmcgc29tZXRoaW5nIHN0dXBpZCBoZXJlIC4uLgoKV2VsbCBOaXJtb3kg
aXMgYmxvY2tlZCwgc28gd2UgbmVlZCBhIHNvbHV0aW9uIGZhc3QuIEF1ZGl0aW5nIGFsbCBjYWxs
IApzaXRlcyBpcyBub3QgYW4gb3B0aW9uLgoKUmV2ZXJ0IG9yIHRoaXMgb25lIGhlcmUgSSB3b3Vs
ZCBzYXksIGVpdGhlciBvbmUgaXMgZmluZSB3aXRoIG1lLgoKQ2hyaXN0aWFuLgoKPiAtRGFuaWVs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

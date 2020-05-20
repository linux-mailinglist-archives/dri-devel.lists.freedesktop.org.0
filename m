Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF2C1DBD9E
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 21:07:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 805216E889;
	Wed, 20 May 2020 19:07:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2070.outbound.protection.outlook.com [40.107.220.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DE6F6E888;
 Wed, 20 May 2020 19:07:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GYqeqJ77c0kAlp+aJrSLRaAuS6P5aRuVb4gQ+PEDbhmHaxSoGJblMqtBsXd36zLlzVqHRNGg6ARldEOGAdAleCFmdMS+iokA8Stev1fD38XrLtZ/sV80+4Tw6UVjMa5h306Ny/lpmVNS4YDnzyhSJolg7SrNlEzsAMcwhPEQvFjrKvbkc/V8RyHqM5hx4nmIAa559jlnHuaAIvF911G6rzS6nxC8500kO7CtheYJ/F3LBxVKWOsG31K/DfUNMeZZsN1RwUxGribHR47Rnsoc21ifW4oAzRmufbAourNSWEq3WUu/5reoXkVZ2K6DFEcctn5KkAghjlkfzzj7KcjMpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HD3av7OScivS49PGp3BpTV5SQWcXfAaIBlNVYuKH6cU=;
 b=KyaTO4DdnXt6b3SnH/fBJzprQnOXFIDBtV7k+ThgydZep6mPk9kg5m/U2QQ/AU5ooYqzp8cPzrUQSfixgmMHOmuoy9ebbOhmd+pxYN88XqzF0d5qCo0ayxb/Jxq2HG3keSzCBph8qyoSbqWjBiVe6MvT5kaP/BjlPeVrVzJ1DmjlcDafdlV2uIkFDkYswebo+rgYE/ToCothMdy+MKGxRiouOe8XnAvtyZWT0Xhk1PX5lAcabkwQeWR8/zqnGQ+4jkrxSHRJhIK1O8xKjNZ3i437pPbZ1/LGMtAf803r4Pz2nh6Z/JlxhQr1HitfpECVEU/RxZ4o8A7jQvf5s/ekww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HD3av7OScivS49PGp3BpTV5SQWcXfAaIBlNVYuKH6cU=;
 b=m+cVXCnObOB+ybEoR+sRxUxn4VEauFoGrQXMrwJ/025AQlxkjCvDSCdd1sIqaaNeQ6r5LzT+8SeP6EfDqKs+TK80WP5RHidEblQNTMSbmSQdncAIx4G+jXl+xgaEnU9g8JdatmS1CSFRT2SAVYk6uKoaZ5UtIXy4T6I2IfQvLu4=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (2603:10b6:a03:ae::10)
 by BYAPR12MB3205.namprd12.prod.outlook.com (2603:10b6:a03:134::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20; Wed, 20 May
 2020 19:07:37 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::fd29:4119:9ef5:8210]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::fd29:4119:9ef5:8210%7]) with mapi id 15.20.3021.020; Wed, 20 May 2020
 19:07:37 +0000
Subject: Re: [PATCH 2/2] drm/amd/display: Enable fp16 also on DCE-11.0 -
 DCE-12.
To: Mario Kleiner <mario.kleiner.de@gmail.com>,
 Alex Deucher <alexdeucher@gmail.com>
References: <20200515051924.12331-1-mario.kleiner.de@gmail.com>
 <20200515051924.12331-3-mario.kleiner.de@gmail.com>
 <7ab95258-02a9-fd39-6806-e6e81ddc295c@amd.com>
 <CADnq5_MJzLC4q8MU9GTmVLzN1kHxy9m15nm3WwsCoPUb-0d2WA@mail.gmail.com>
 <CAEsyxyjCbRvo-o-pUeYiuBbLX9SRNtZjaOLBr6CXDTdKRnMiNg@mail.gmail.com>
From: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
Message-ID: <54f52bcf-83a6-f087-762d-3c8534f84865@amd.com>
Date: Wed, 20 May 2020 15:07:33 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <CAEsyxyjCbRvo-o-pUeYiuBbLX9SRNtZjaOLBr6CXDTdKRnMiNg@mail.gmail.com>
Content-Language: en-US
X-ClientProxiedBy: YTBPR01CA0014.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::27) To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.148.234] (165.204.55.211) by
 YTBPR01CA0014.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3021.23 via Frontend Transport; Wed, 20 May 2020 19:07:36 +0000
X-Originating-IP: [165.204.55.211]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f5c8fbdc-b309-4839-6da3-08d7fcf10f57
X-MS-TrafficTypeDiagnostic: BYAPR12MB3205:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR12MB320516D14FBFC10B41708604ECB60@BYAPR12MB3205.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-Forefront-PRVS: 04097B7F7F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rfkQBAvdq/NvpLdf53y2Lytdrz1grVMe1EdkMOt7eWT5AXl7dPIMKi8VjRxwfjK6zFNonIoIM6YAhC3DteY0c1QXjFAVyjjgvAEfL9b/e/MYO1b9ix6eQB3KpBk+TTAXt4fFNt4seK4bzK/Ufwmzp7N6dXnpk0CMbR7QdLq15tyfktr2iyuSbaCn0rAkn/WqOQgk0SS8kHg+7pbSHoOBpFIgWqnqNrlqQCLSsVGQsYIkz0OE9SwzQjilfvtSlJcu06O1/5B3p1Fq+ZETNQTILJ5z75s+QGRv+enXSK7e/y2X4NFXVftrv5ay5LuulRTv/qO1jrtikJCn6fYQr4llCySJbS06IhezL10Zt2X6KA1KXPVgnzFfSWsaMATyGbWJZveWUK1czfifdFdm80e+T/G9RMZ2nelsZj315KG2HiVsIiWwb4cQuDqmBWa8c7bP0SwbkPRyLsR3WcEtZ/qGYCnRkhhANH6HKf3/TIhxBYaKHxkUTIEVaRqMhl9p8fSLRF6vhW1eRKjuMgwulSFP75PzIGaIRkAR9hQjJ6E82t8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3560.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(366004)(136003)(396003)(346002)(376002)(2616005)(956004)(6486002)(966005)(478600001)(53546011)(8676002)(66556008)(26005)(66476007)(2906002)(66946007)(6666004)(4326008)(31696002)(86362001)(36756003)(5660300002)(16576012)(110136005)(52116002)(8936002)(186003)(316002)(16526019)(31686004)(54906003)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 3he0n2XwhmBT0QEuObqPohJEVPp5JdrSJOveiSmk+VF7H4bTM0KFamtA0rv8HO/5yXrTVgFqI8wzEw2DKgByZLb+QT/f7b2ihlrm+/QfAJ3YJRsB2Eha1/o4+039g09c4g2koTslpAGrQehJ60caQHRMXMKH+bFx6u1OopmSYDaL/5r/CGSxAci40uP6B08v21Hy5vmes73CQlF2sOOlsaeaLkCKxf+JB9IICHI/9oPtUfsZcsxng2Cb5fBDvx8U2rju0JInl5KBfEtdX0HGMOyxdhCotoFM3/u+KtX5ogBMdBiALbOxhopG+EcGP/2gpXgP3cz/U47PYx+CFsm5pFaGpYSpA4hr+L2FOBhwJtR9f5ZmAKJztYjVwaX1zH5mqsQQ4DsK8u8yX+kXTxovAhSxabqYUmxh6QyjQw9MGQnLSlReTUQljDaOfMOnRjyvp6/4li6qnDdsDu1AJxd4L0hcBtgkxZZOHff3iSTlrOfbzKdhqUjXRFpFCXyYLVns
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5c8fbdc-b309-4839-6da3-08d7fcf10f57
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2020 19:07:37.2589 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7UMWH9HKz+Pig5Ko/5ND7mwRk+PAxXWZvIn31C26y5OxtJA5oYQ8CPyWYAZL+8eLyMPJcG7LRLra0YnbHX6l2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3205
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
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 Harry Wentland <hwentlan@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC0wNS0yMCAyOjQ0IHAubS4sIE1hcmlvIEtsZWluZXIgd3JvdGU6Cj4gT24gV2VkLCBN
YXkgMjAsIDIwMjAgYXQgODoyNSBQTSBBbGV4IERldWNoZXIgPGFsZXhkZXVjaGVyQGdtYWlsLmNv
bSAKPiA8bWFpbHRvOmFsZXhkZXVjaGVyQGdtYWlsLmNvbT4+IHdyb3RlOgo+IAo+ICAgICBPbiBX
ZWQsIE1heSAyMCwgMjAyMCBhdCAxMjozOSBQTSBIYXJyeSBXZW50bGFuZCA8aHdlbnRsYW5AYW1k
LmNvbQo+ICAgICA8bWFpbHRvOmh3ZW50bGFuQGFtZC5jb20+PiB3cm90ZToKPiAgICAgID4KPiAg
ICAgID4gT24gMjAyMC0wNS0xNSAxOjE5IGEubS4sIE1hcmlvIEtsZWluZXIgd3JvdGU6Cj4gICAg
ICA+ID4gVGVzdGluZyBvbiBhIFBvbGFyaXMxMSBncHUgd2l0aCBEQ0UtMTEuMiBzdWdnZXN0cyB0
aGF0IGl0Cj4gICAgICA+ID4gc2VlbXMgdG8gd29yayBmaW5lIHRoZXJlLCBzbyBvcHRpbWlzdGlj
YWxseSBlbmFibGUgaXQgZm9yCj4gICAgICA+ID4gRENFLTExIGFuZCBsYXRlci4KPiAgICAgID4g
Pgo+ICAgICAgPiA+IFNpZ25lZC1vZmYtYnk6IE1hcmlvIEtsZWluZXIgPG1hcmlvLmtsZWluZXIu
ZGVAZ21haWwuY29tCj4gICAgIDxtYWlsdG86bWFyaW8ua2xlaW5lci5kZUBnbWFpbC5jb20+Pgo+
ICAgICAgPiA+IC0tLQo+ICAgICAgPiA+wqAgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2RjZTExMC9kY2UxMTBfcmVzb3VyY2UuYyB8IDIgKy0KPiAgICAgID4gPsKgIGRyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9kY2UxMTIvZGNlMTEyX3Jlc291cmNlLmMgfCAyICstCj4gICAg
ICA+ID7CoCBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlMTIwL2RjZTEyMF9yZXNv
dXJjZS5jIHwgMiArLQo+ICAgICAgPiA+wqAgMyBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KyksIDMgZGVsZXRpb25zKC0pCj4gICAgICA+ID4KPiAgICAgID4gPiBkaWZmIC0tZ2l0Cj4gICAg
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZTExMC9kY2UxMTBfcmVzb3VyY2Uu
Ywo+ICAgICBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UxMTAvZGNlMTEwX3Jl
c291cmNlLmMKPiAgICAgID4gPiBpbmRleCA5NTk3ZmM3OWQ3ZmEuLmEwNDNkZGFlNTE0OSAxMDA2
NDQKPiAgICAgID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlMTEw
L2RjZTExMF9yZXNvdXJjZS5jCj4gICAgICA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2RjZTExMC9kY2UxMTBfcmVzb3VyY2UuYwo+ICAgICAgPiA+IEBAIC00MTAsNyAr
NDEwLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkY19wbGFuZV9jYXAgcGxhbmVfY2FwID0gewo+
ICAgICAgPiA+wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAucGl4ZWxfZm9ybWF0X3N1cHBvcnQgPSB7
Cj4gICAgICA+ID7CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oC5hcmdiODg4OCA9IHRydWUsCj4gICAgICA+ID7CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoC5udjEyID0gZmFsc2UsCj4gICAgICA+ID4gLcKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLmZwMTYgPSBmYWxzZQo+ICAgICAgPiA+
ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC5mcDE2ID0gdHJ1
ZQo+ICAgICAgPgo+ICAgICAgPiBDYXJyaXpvIChEQ0UgMTEuMCkgaGFzIGEgSFcgYnVnIHdoZXJl
IEZQMTYgc2NhbGluZyBkb2Vzbid0IHdvcmsuIEkKPiAgICAgID4gcmVjb21tZW5kIHdlIGxlYXZl
IGl0IG9mZiBoZXJlLgo+IAo+ICAgICBJJ2xsIGRyb3AgdGhpcyBodW5rIGZvciB1cHN0cmVhbS4K
PiAKPiAgICAgQWxleAo+IAo+IAo+IE9rLCBubyBmaXh1cCBwYXRjaCBuZWVkZWQgZnJvbSBteXNl
bGYsIHRoYW5rcyBBbGV4LiBEb2VzIHRoZSBzY2FsaW5nIGJ1ZyAKPiByZWZlciB0byBzY2FsaW5n
IHRoZSBwbGFuZXMgKHRob3NlIG1heF9kb3duc2NhbGVfZmFjdG9yIC8gCj4gbWF4X3Vwc2NhbGVf
ZmFjdG9yIGRlZmluaXRpb25zIHNlZW0gdG8gYmUgdW51c2VkKSBvciB0aGUgZnAxNiB2YWx1ZXMg
aXRzZWxmPwo+IAo+IFdoYXQgYWJvdXQgRENFIDggYW5kIERDRSAxMCBodyBjYXBhYmlsaXRpZXMg
d3J0LiBmcDE2PyBTaG91bGQgaSBzZW5kIAo+IGZwMTYgZW5hYmxlIHBhdGNoZXMgZm9yIHRob3Nl
IGFzIHdlbGw/Cj4gCj4gLW1hcmlvCgpZZWFoLCB0aGUgdXBzY2FsZSBhbmQgZG93bnNjYWxlIGZh
Y3RvcnMgd2VyZSBpbnRlbmRlZCB0byBibG9jayBGUDE2IAphY2NlcHRlZCBhbmQgcmVqZWN0IHRo
ZSBjb21taXQgYnV0IEkgZ3Vlc3Mgbm9ib2R5IGV2ZXIgYWRkZWQgdGhvc2UgdG8gCmF0b21pYyBj
aGVjay4KCkkgcmV2aWV3ZWQgdGhlIHBhdGNoIHdpdGggdGhlIGlkZWEgaW4gbWluZCB0aGF0IHdl
IGFscmVhZHkgYmxvY2tlZCB0aGlzIApvbiBhIERDIGxldmVsLiBXZSBjYW4gcmUtZW5hYmxlIGl0
IGluIHRoZSBjYXBzIGFmdGVyIHRoaXMgaXMgaW4gSSB0aGluay4KCk9mZiB0aGUgdG9wIG9mIG15
IGhlYWQgSSBkb24ndCByZW1lbWJlciB3aGF0IERDRTgvRENFMTAgc3VwcG9ydHMsIGJ1dCAKSSdt
IGFsc28gbm90IHN1cmUgaWYgdGhleSBldmVuIHN1cHBvcnQgc2VuZGluZyB0aGUgU0RQIG1lc3Nh
Z2UgZm9yIHRob3NlIAp0byByZWFsbHkgYmUgdXNhYmxlLgoKUmVnYXJkcywKTmljaG9sYXMgS2F6
bGF1c2thcwoKPiAKPiAgICAgID4KPiAgICAgID4gSGFycnkKPiAgICAgID4KPiAgICAgID4gPsKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgfSwKPiAgICAgID4gPgo+ICAgICAgPiA+wqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAubWF4X3Vwc2NhbGVfZmFjdG9yID0gewo+ICAgICAgPiA+IGRpZmYgLS1naXQK
PiAgICAgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlMTEyL2RjZTExMl9yZXNv
dXJjZS5jCj4gICAgIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZTExMi9kY2Ux
MTJfcmVzb3VyY2UuYwo+ICAgICAgPiA+IGluZGV4IDRhNzc5NmRlMmZmNS4uNTFiM2ZlNTAyNjcw
IDEwMDY0NAo+ICAgICAgPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9k
Y2UxMTIvZGNlMTEyX3Jlc291cmNlLmMKPiAgICAgID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvZGNlMTEyL2RjZTExMl9yZXNvdXJjZS5jCj4gICAgICA+ID4gQEAgLTQx
MSw3ICs0MTEsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRjX3BsYW5lX2NhcCBwbGFuZV9jYXAg
PSB7Cj4gICAgICA+ID7CoCDCoCDCoCDCoC5waXhlbF9mb3JtYXRfc3VwcG9ydCA9IHsKPiAgICAg
ID4gPsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLmFyZ2I4ODg4ID0gdHJ1ZSwK
PiAgICAgID4gPsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLm52MTIgPSBmYWxz
ZSwKPiAgICAgID4gPiAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAuZnAxNiA9IGZh
bHNlCj4gICAgICA+ID4gK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLmZwMTYgPSB0
cnVlCj4gICAgICA+ID7CoCDCoCDCoCDCoH0sCj4gICAgICA+ID4KPiAgICAgID4gPsKgIMKgIMKg
IMKgLm1heF91cHNjYWxlX2ZhY3RvciA9IHsKPiAgICAgID4gPiBkaWZmIC0tZ2l0Cj4gICAgIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZTEyMC9kY2UxMjBfcmVzb3VyY2UuYwo+
ICAgICBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UxMjAvZGNlMTIwX3Jlc291
cmNlLmMKPiAgICAgID4gPiBpbmRleCA5YTk3NjRjYmQ3OGQuLjhmMzYyZThjMTc4NyAxMDA2NDQK
PiAgICAgID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlMTIwL2Rj
ZTEyMF9yZXNvdXJjZS5jCj4gICAgICA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2RjZTEyMC9kY2UxMjBfcmVzb3VyY2UuYwo+ICAgICAgPiA+IEBAIC01MTYsNyArNTE2
LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkY19wbGFuZV9jYXAgcGxhbmVfY2FwID0gewo+ICAg
ICAgPiA+wqAgwqAgwqAgwqAucGl4ZWxfZm9ybWF0X3N1cHBvcnQgPSB7Cj4gICAgICA+ID7CoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC5hcmdiODg4OCA9IHRydWUsCj4gICAgICA+
ID7CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC5udjEyID0gZmFsc2UsCj4gICAg
ICA+ID4gLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLmZwMTYgPSBmYWxzZQo+ICAg
ICAgPiA+ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC5mcDE2ID0gdHJ1ZQo+ICAg
ICAgPiA+wqAgwqAgwqAgwqB9LAo+ICAgICAgPiA+Cj4gICAgICA+ID7CoCDCoCDCoCDCoC5tYXhf
dXBzY2FsZV9mYWN0b3IgPSB7Cj4gICAgICA+ID4KPiAgICAgID4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiAgICAgID4gZHJpLWRldmVsIG1haWxpbmcg
bGlzdAo+ICAgICAgPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gICAgIDxtYWls
dG86ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4KPiAgICAgID4gaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKPiAgICAgPGh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsPgo+IAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

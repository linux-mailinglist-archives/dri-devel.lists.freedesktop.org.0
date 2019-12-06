Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE69114BA7
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2019 05:30:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46C496F962;
	Fri,  6 Dec 2019 04:30:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2072.outbound.protection.outlook.com [40.107.92.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD5716E171;
 Fri,  6 Dec 2019 04:30:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IMovWfHn3+pHx7maGOYTgo5nE5q62yG2Zew+407l035FXOTXEdcGPQooareNDG8OsmyouH17pfqbRbLTq4JXPaC13hzUBn9F3Lsy5F6Q/YinvNxvUMlNbIfMke9Gi4CGrz9mg6awXHk1EXKz0eV01zj+2Ct4ldBGUrKytVtnm11maFqHxNlIoXfG778mFIWv1hXE1OlOoyqnZI69SlVDmXtc2HHj1XEfpmu3VzKPLOOhWNoiktobpdwf8DeXfYC5dOfIY8dc33Nl7t9ms7yEM6EgXutCMwH1lJE2sD5yyklYIGPMdHWnEvtrIZHJTZ7Awccg+6eq/ssknyqyj/qW3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PSWlMzHiCcloYfiDS/AQ1BqEE7CNyZeOh/76eWMTIT0=;
 b=LGoJPYdpIOclfHNOyXHLOstmBwsHXrzdnqEQqIWbYwyUy1Mf5k4QAnj9wMXboDi8HK0nFJG9Seb7vDttnsMptB+BDf7WOe+FQiDlDWZ+8iE4M1E2sINCV08nqhdpaWldSZg1jlWOlaL3KNCotfeJsjMKkom8YF3rlod0RuHQcqEm19GKSE+e2oYzC0Qqt9LqKISP1rcWvJxf5LGjmoOnBMN/i/NiPY6f+0RKqauDV7sx0v2d+QEmFr12Bk33Kv6zeSt0aVR/2EOxlT/dD6deSFpCBvCbEUzarpt2VO+qvF8maI5G2jdattVFRhyXQ81YWe+qQ5lUFeXoUZRJuEkBPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR1201MB0228.namprd12.prod.outlook.com (10.174.115.135) by
 BN6PR1201MB0145.namprd12.prod.outlook.com (10.174.238.146) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.13; Fri, 6 Dec 2019 04:30:45 +0000
Received: from BN6PR1201MB0228.namprd12.prod.outlook.com
 ([fe80::d8c9:e17c:33f1:6d2]) by BN6PR1201MB0228.namprd12.prod.outlook.com
 ([fe80::d8c9:e17c:33f1:6d2%3]) with mapi id 15.20.2516.014; Fri, 6 Dec 2019
 04:30:45 +0000
Subject: Re: [PATCH v8 04/17] drm/dp_mst: Fill branch->num_ports
To: mikita.lipski@amd.com, amd-gfx@lists.freedesktop.org
References: <20191203143530.27262-1-mikita.lipski@amd.com>
 <20191203143530.27262-5-mikita.lipski@amd.com>
From: Harry Wentland <hwentlan@amd.com>
Autocrypt: addr=hwentlan@amd.com; keydata=
 mQENBFhb4C8BCADhHHUNoBQ7K7LupCP0FsUb443Vuqq+dH0uo4A3lnPkMF6FJmGcJ9Sbx1C6
 cd4PbVAaTFZUEmjqfpm+wCRBe11eF55hW3GJ273wvfH69Q/zmAxwO8yk+i5ZWWl8Hns5h69K
 D9QURHLpXxrcwnfHFah0DwV23TrD1KGB7vowCZyJOw93U/GzAlXKESy0FM7ZOYIJH83X7qhh
 Q9KX94iTEYTeH86Wy8hwHtqM6ySviwEz0g+UegpG8ebbz0w3b5QmdKCAg+eZTmBekP5o77YE
 BKqR+Miiwo9+tzm2N5GiF9HDeI2pVe/egOLa5UcmsgdF4Y5FKoMnBbAHNaA6Fev8PHlNABEB
 AAG0J0hhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPokBNwQTAQgAIQUC
 WFvgLwIbAwULCQgHAgYVCAkKCwIEFgIDAQIeAQIXgAAKCRAtWBXJjBS24xUlCAC9MqAlIbZO
 /a37s41h+MQ+D20C6/hVErWO+RA06nA+jFDPUWrDJKYdn6EDQWdLY3ATeAq3X8GIeOTXGrPD
 b2OXD6kOViW/RNvlXdrIsnIDacdr39aoAlY1b+bhTzZVz4pto4l+K1PZb5jlMgTk/ks9HesL
 RfYVq5wOy3qIpocdjdlXnSUKn0WOkGBBd8Nv3o0OI18tiJ1S/QwLBBfZoVvfGinoB2p4j/wO
 kJxpi3F9TaOtLGcdrgfghg31Fb48DP+6kodZ4ircerp4hyAp0U2iKtsrQ/sVWR4mbe3eTfcn
 YjBxGd2JOVdNQZa2VTNf9GshIDMD8IIQK6jN0LfY8Py2uQENBFhb4C8BCAC/0KWY3pIbU2cy
 i7GMj3gqB6h0jGqRuMpMRoSNDoAUIuSh17w+bawuOF6XZPdK3D4lC9cOXMwP3aP9tTJOori2
 8vMH8KW9jp9lAYnGWYhSqLdjzIACquMqi96EBtawJDct1e9pVgp+d4JXHlgIrl11ITJo8rCP
 dEqjro2bCBWxijsIncdCzMjf57+nR7u86SBtGSFcXKapS7YJeWcvM6MzFYgIkxHxxBDvBBvm
 U2/mAXiL72kwmlV1BNrabQxX2UnIb3xt3UovYJehrnDUMdYjxJgSPRBx27wQ/D05xAlhkmmL
 FJ01ZYc412CRCC6gjgFPfUi2y7YJTrQHS79WSyANABEBAAGJAR8EGAEIAAkFAlhb4C8CGwwA
 CgkQLVgVyYwUtuM72Qf+J6JOQ/27pWf5Ulde9GS0BigA1kV9CNfIq396TgvQzeyixHMvgPdq
 Z36x89zZi0otjMZv6ypIdEg5co1Bvz0wFaKbCiNbTjpnA1VAbQVLSFjCZLQiu0vc+BZ1yKDV
 T5ASJ97G4XvQNO+XXGY55MrmhoNqMaeIa/3Jas54fPVd5olcnUAyDty29/VWXNllUq38iBCX
 /0tTF7oav1lzPGfeW2c6B700FFZMTR4YBVSGE8jPIzu2Fj0E8EkDmsgS+nibqSvWXfo1v231
 410h35CjbYDlYQO7Z1YD7asqbaOnF0As+rckyRMweQ9CxZn5+YBijtPJA3x5ldbCfQ9rWiTu XQ==
Message-ID: <0c0b9623-ed5e-d43f-5898-5464d1669ed5@amd.com>
Date: Thu, 5 Dec 2019 23:30:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
In-Reply-To: <20191203143530.27262-5-mikita.lipski@amd.com>
Content-Language: en-US
X-ClientProxiedBy: YTXPR0101CA0010.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::23) To BN6PR1201MB0228.namprd12.prod.outlook.com
 (2603:10b6:405:57::7)
MIME-Version: 1.0
X-Originating-IP: [2607:fea8:925f:a8a0::2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4c9fe8a3-05be-43b8-befd-08d77a050f6e
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0145:|BN6PR1201MB0145:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN6PR1201MB0145574CE3643FB268C311E78C5F0@BN6PR1201MB0145.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-Forefront-PRVS: 0243E5FD68
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(366004)(376002)(346002)(39860400002)(189003)(199004)(66476007)(36756003)(186003)(65956001)(478600001)(8936002)(66946007)(6666004)(53546011)(66556008)(31686004)(81156014)(81166006)(230700001)(31696002)(6506007)(305945005)(5660300002)(966005)(2616005)(14444005)(99286004)(14454004)(50466002)(6512007)(6486002)(229853002)(450100002)(76176011)(52116002)(8676002)(25786009)(58126008)(23676004)(11346002)(316002)(2906002)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR1201MB0145;
 H:BN6PR1201MB0228.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UU3LiNLVw2IptTXcAvPRp6lafLZbvM9HXKWFHZINGTgvms6vZfvcPxauU7MMgqG3DXm9oJYyKKzkwkb9UsqUw+ROEnsNugqPBq/fgEK5KCj34tQ8Wo2VWxupcBmGtmR5v7LrfDBlKpGKDQQqc+aee/phqDoF+tw6HQO7B2qTfG88ICs6aW5S3p749xcza52XUlyKmPM4pITZ7dP6boic/z6EM1w/AiKLq5S7WVvvpsU5K7kwX3+Vw/sT7SNzyBza4rXurJ59WI+NSRhXJ3RrghwfLKBxV+gImaKrvkBGj5AIqVWTyTRAvy2wVLnziszKP+/gPYotBlxMutJnCOSbRjRuNS3OVxSzsu9lM25dBaaNbFLWLiUsIpxFjSb1ZPHSvFn6tsqd3xtYseHil7WC/mTEgV7j7nx8Az93fVcR+i4pwfUR/QSb51cZXxiF8mMvKxEHclu0vuMl/tz/ai7D20CqR0sEiVJ34VGixrWxbuM=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c9fe8a3-05be-43b8-befd-08d77a050f6e
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2019 04:30:45.3073 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9QCDbj1IFJhrllNNcJVmCpPUai5MqrQZpejO42juSyjaDDvfte3mnmvj7WUbRRr9HulBdrCtiFTHJWRhQfjQCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0145
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PSWlMzHiCcloYfiDS/AQ1BqEE7CNyZeOh/76eWMTIT0=;
 b=ruzURyRpuny7lDD06gzjan/k9keD+l/b4qBKcQ5IxqAoLydmOXsSnoTnlcyZDVWvczaeNBB8mglf1CFuH7linPqks8ju2bbQh+7Eq1pmfIAaX2HhrvHAudHxqV2tRCnN/uhHmWWaVedONJ0wH3wRpCQ8GU/hCfi9C8thM3w1Lsk=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Harry.Wentland@amd.com; 
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: David Francis <David.Francis@amd.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0xMi0wMyA5OjM1IGEubS4sIG1pa2l0YS5saXBza2lAYW1kLmNvbSB3cm90ZToKPiBG
cm9tOiBEYXZpZCBGcmFuY2lzIDxEYXZpZC5GcmFuY2lzQGFtZC5jb20+Cj4gCj4gVGhpcyBmaWVs
ZCBvbiBkcm1fZHBfbXN0X2JyYW5jaCB3YXMgbmV2ZXIgZmlsbGVkCj4gCj4gSXQgaXMgaW5pdGlh
bGl6ZWQgdG8gemVybyB3aGVuIHRoZSBwb3J0IGlzIGt6YWxsb2NjZWQuCj4gV2hlbiBhIHBvcnQg
aXMgYWRkZWQgdG8gdGhlIGxpc3QsIGluY3JlbWVudCBudW1fcG9ydHMsCj4gYW5kIHdoZW4gYSBw
b3J0IGlzIHJlbW92ZWQgZnJvbSB0aGUgbGlzdCwgZGVjcmVtZW50IG51bV9wb3J0cy4KPiAKPiB2
MjogcmVtZW1iZXIgdG8gZGVjcmVtZW50IG9uIHBvcnQgcmVtb3ZhbAo+IHYzOiBkb24ndCBleHBs
aWNpdGx5IGluaXQgdG8gMAo+IAo+IFJldmlld2VkLWJ5OiBMeXVkZSBQYXVsIDxseXVkZUByZWRo
YXQuY29tPgo+IFJldmlld2VkLWJ5OiBIYXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1k
LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBEYXZpZCBGcmFuY2lzIDxEYXZpZC5GcmFuY2lzQGFtZC5j
b20+Cj4gU2lnbmVkLW9mZi1ieTogTWlraXRhIExpcHNraSA8bWlraXRhLmxpcHNraUBhbWQuY29t
Pgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jIHwgMiArKwo+
ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Rw
X21zdF90b3BvbG9neS5jCj4gaW5kZXggMDZhYWU5YjUyZThhLi5kNzRiNzY3ZDBmZTEgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYwo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKPiBAQCAtMjEyOSw2ICsyMTI5LDcg
QEAgZHJtX2RwX21zdF9wb3J0X2FkZF9jb25uZWN0b3Ioc3RydWN0IGRybV9kcF9tc3RfYnJhbmNo
ICptc3RiLAo+ICAJYnVpbGRfbXN0X3Byb3BfcGF0aChtc3RiLCBwb3J0LT5wb3J0X251bSwgcHJv
cHBhdGgsIHNpemVvZihwcm9wcGF0aCkpOwo+ICAJcG9ydC0+Y29ubmVjdG9yID0gbWdyLT5jYnMt
PmFkZF9jb25uZWN0b3IobWdyLCBwb3J0LCBwcm9wcGF0aCk7Cj4gIAlpZiAoIXBvcnQtPmNvbm5l
Y3Rvcikgewo+ICsJCW1zdGItPm51bV9wb3J0cy0tOwo+ICAJCXJldCA9IC1FTk9NRU07Cj4gIAkJ
Z290byBlcnJvcjsKPiAgCX0KPiBAQCAtMjI1Niw2ICsyMjU3LDcgQEAgZHJtX2RwX21zdF9oYW5k
bGVfbGlua19hZGRyZXNzX3BvcnQoc3RydWN0IGRybV9kcF9tc3RfYnJhbmNoICptc3RiLAo+ICAJ
CW11dGV4X2xvY2soJm1nci0+bG9jayk7Cj4gIAkJZHJtX2RwX21zdF90b3BvbG9neV9nZXRfcG9y
dChwb3J0KTsKPiAgCQlsaXN0X2FkZCgmcG9ydC0+bmV4dCwgJm1zdGItPnBvcnRzKTsKPiArCQlt
c3RiLT5udW1fcG9ydHMrKzsKPiAgCQltdXRleF91bmxvY2soJm1nci0+bG9jayk7Cj4gIAl9Cj4g
IAoKRGlkIHlvdSBkcm9wIHRoZSBudW1fcG9ydHMtLSB3aGVuIHdlIGRvIGxpc3RfZGVsKCkgYnkg
YWNjaWRlbnQ/CgpTZWUgaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoLzMy
NTYwMC8KCkhhcnJ5Cgo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2461117F9EC
	for <lists+dri-devel@lfdr.de>; Tue, 10 Mar 2020 14:01:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EDBF8984D;
	Tue, 10 Mar 2020 13:01:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2053.outbound.protection.outlook.com [40.107.220.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B49098984D
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 13:01:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ebE9AGLRbgPppO97jUtUOGF8Ls+3v+gg41VGPDEOqDMKCSWqW9rad9zueLdxb5AwVq3AN0LUpRxabllrdjyj7srZFM7pQVALeEG7eDUn3mSHHhDu7VNb5n9+vfdKwoj52srl4suGyLTzlKHxPO0CGpQtAYIMCvACDH8Dhia1pTW4e5DYBU0NEmd7OtnqQGNgNERT7E7TjvGHVzHVWy3cZ3HozRBBn3tkhBAuXNRhs8vAvOxG4N8RtYPR87qTV41wjdMbHgB88WabfL2G0Jg6lTvp8y6Prh/VcNZqBvC0VXzVs5G02sdTiMfnbZYAPo6SIVPWWG4QzmBrOgdD2x4XnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s3DAaJlOB3m7QyjhiB1YEhKbeHSld0Pi0f/yFT+Coqc=;
 b=nIA77GO3I6+x8JhbyR3+qhNqKy9hwP/7TtW1ok4ZcUi1/ccgGWxSi9cP78mMhVhwr1sjTdtxBgP4dMzA6SL6J97oWdA2Tn5kXzx44idO9jdqJyicUtXWr2mi8LHogeE3K+IChGnyvND+PdlK4QiPqVpACweXEkWRwI/I+FxbHRcr0KuV2ttRBOffVVvxj9uqTzgcgOHTrI8wRkg76gCHJjSCOm+jmvBL1H3itPMTPgmS4d2s4216ijkWOHI1IGXTXF/GiKeGEbWptMDA3icZq3+TRGF11fSIN8+tOpbdBTi0Ek6vY+vjXEqPutrHJEPW+Tvexz5yMoqhOzd48kIfgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s3DAaJlOB3m7QyjhiB1YEhKbeHSld0Pi0f/yFT+Coqc=;
 b=bXUT9GX0e8fQ8etjB40Y5etSlCX/Zp0WxO13O7tm7tL9KbaJr/7MZsKD7dWeKAlCr1xsmX2EXeL7cl1xG8XVorqk/wTf6lEzIJO3mG2VAZu6VDLT0za+wYUZKJeU3uMyl8VBtICfgUykKMieAOyks1xB6gFqm//rjYY+x++gVkw=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mikita.Lipski@amd.com; 
Received: from DM6PR12MB2906.namprd12.prod.outlook.com (2603:10b6:5:15f::20)
 by DM6PR12MB4563.namprd12.prod.outlook.com (2603:10b6:5:28e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.16; Tue, 10 Mar
 2020 13:01:14 +0000
Received: from DM6PR12MB2906.namprd12.prod.outlook.com
 ([fe80::cd57:c685:c45c:8c07]) by DM6PR12MB2906.namprd12.prod.outlook.com
 ([fe80::cd57:c685:c45c:8c07%6]) with mapi id 15.20.2793.013; Tue, 10 Mar 2020
 13:01:14 +0000
Subject: Re: [PATCH v2 0/4] drm/dp_mst: Fix bandwidth checking regressions
 from DSC patches
To: Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org
References: <20200306234623.547525-1-lyude@redhat.com>
From: Mikita Lipski <mlipski@amd.com>
Organization: AMD
Message-ID: <11954bfb-7ab9-19bf-9c8d-6fb2d6a647bd@amd.com>
Date: Tue, 10 Mar 2020 09:01:12 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
In-Reply-To: <20200306234623.547525-1-lyude@redhat.com>
Content-Language: en-US
X-ClientProxiedBy: YTXPR0101CA0049.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::26) To DM6PR12MB2906.namprd12.prod.outlook.com
 (2603:10b6:5:15f::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.29.224.72] (165.204.55.250) by
 YTXPR0101CA0049.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.14 via Frontend
 Transport; Tue, 10 Mar 2020 13:01:13 +0000
X-Originating-IP: [165.204.55.250]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 05c06a0e-4f89-47d0-7824-08d7c4f31d0e
X-MS-TrafficTypeDiagnostic: DM6PR12MB4563:|DM6PR12MB4563:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB45632B1B06AA1FF3DA25B0E6E4FF0@DM6PR12MB4563.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 033857D0BD
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(396003)(376002)(136003)(366004)(199004)(189003)(186003)(16526019)(2616005)(956004)(31696002)(26005)(6486002)(36756003)(7416002)(66476007)(36916002)(81166006)(54906003)(16576012)(478600001)(316002)(52116002)(31686004)(81156014)(53546011)(66556008)(5660300002)(66946007)(2906002)(4326008)(8936002)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB4563;
 H:DM6PR12MB2906.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mdahrCD/MtkkbEaiOyP6n5bhgCapf7Wbg0mIR+iDCOizhNsFfrWLSr+je6SQn1r0rFjcYZ8keyPeNN13vLIxIhVKCvvX3TnE5gp8Y/DBYQb2thU4Qcc9tw8Mbb/TlV/MnOGsO9oYE8/6IKEY90KGy6RxJmge2qnQ9/IfZZVydtzMLQVUqyXaCIptvQHJFUIIRyaibHmNtKhoO/ks5bPWxZyqJyuhPFJx9ANe3caYJa2PCbjO+eRVexDJ6zB8NWnnmgeHNQCLWljoeyhOQUTfw1uIRgk96cOaTVJOk5bZMlcYx1UX4z6HH28+Z2I4WCA0ypiu11dUlLvMWHvJDBoCCNfSwXNhcbnRUHc/oe/4cdLjizc0xxiZWeTOmFEVDQyhRcxBR3GYtyJQxKqdpEJbfd/d2u/31ji8eZ3Z2AD3LLsKx2QIaG0ExnYk3OgT5fcW
X-MS-Exchange-AntiSpam-MessageData: h0zJ77AMAgpKYfwhvonVFTrDF+0cBT3kRO7gfiSG+48V8vQ51T3ORDh6/qVqypRbPDatHzuuWjmhu+bDKBpFCJlX/iagXFOAZ4ECAB3Ylz3dsqut7c2vseAhAksbrZoP2dDfQWYcDbIvWhJLemyidQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05c06a0e-4f89-47d0-7824-08d7c4f31d0e
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2020 13:01:14.1378 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zK+NhLg7+/J4Cykk/68q7vdbxty8UjNX1PL3ghsnou1w2hAhGpt+ftmuThA6XczF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4563
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Sean Paul <seanpaul@google.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>, Alex Deucher <alexander.deucher@amd.com>,
 Mikita Lipski <mikita.lipski@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiAzLzYvMjAgNjo0NiBQTSwgTHl1ZGUgUGF1bCB3cm90ZToKPiBBTUQncyBwYXRjaCBzZXJp
ZXMgZm9yIGFkZGluZyBEU0Mgc3VwcG9ydCB0byB0aGUgTVNUIGhlbHBlcnMKPiB1bmZvcnR1bmF0
ZWx5IGludHJvZHVjZWQgYSBmZXcgcmVncmVzc2lvbnMgaW50byB0aGUga2VybmVsIHRoYXQgSSBk
aWRuJ3QKPiBnZXQgYXJvdW5kIHRvIGZpeGluZyB1bnRpbCBqdXN0IG5vdy4gSSB3b3VsZCBoYXZl
IHJldmVydGVkIHRoZSBjaGFuZ2VzCj4gZWFybGllciwgYnV0IHNlZWluZyBhcyB0aGF0IHdvdWxk
IGhhdmUgcmV2ZXJ0ZWQgYWxsIG9mIGFtZCdzIERTQyBzdXBwb3J0Cj4gKyBldmVyeXRoaW5nIHRo
YXQgd2FzIGRvbmUgb24gdG9wIG9mIHRoYXQgSSByZWFsbGxsbGx5IHdhbnRlZCB0byBhdm9pZAo+
IGRvaW5nIHRoYXQuCj4gCj4gQW55d2F5LCB0aGlzIHNob3VsZCBmaXggZXZlcnl0aGluZyBiYW5k
d2lkdGgtY2hlY2sgcmVsYXRlZCBhcyBmYXIgYXMgSQo+IGNhbiB0ZWxsIChJIGZvdW5kIHNvbWUg
b3RoZXIgcmVncmVzc2lvbnMgdW5yZWxhdGVkIHRvIEFNRCdzIERTQyBwYXRjaGVzCj4gd2hpY2gg
SSdsbCBiZSBzZW5kaW5nIG91dCBwYXRjaGVzIGZvciBzaG9ydGx5KS4gTm90ZSB0aGF0IEkgZG9u
J3QgaGF2ZQo+IGFueSBEU0MgZGlzcGxheXMgbG9jYWxseSB5ZXQsIHNvIGlmIHNvbWVvbmUgZnJv
bSBBTUQgY291bGQgc2FuaXR5IGNoZWNrCj4gdGhpcyBJIHdvdWxkIGFwcHJlY2lhdGUgaXQg4pml
LgoKVGhlIHNlcmllcyBpcyB0ZXN0ZWQgYW5kIHZlcmlmaWVkIHdpdGggTVNUIERTQyBSZWFsdGVr
IGJvYXJkLgpUZXN0ZWQtYnk6IE1pa2l0YSBMaXBza2kgPG1pa2l0YS5saXBza2lAYW1kLmNvbT4K
Cj4gCj4gQ2M6IE1pa2l0YSBMaXBza2kgPG1pa2l0YS5saXBza2lAYW1kLmNvbT4KPiBDYzogQWxl
eCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgo+IENjOiBTZWFuIFBhdWwgPHNl
YW5wYXVsQGdvb2dsZS5jb20+Cj4gQ2M6IEhhbnMgZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhhdC5j
b20+Cj4gCj4gTHl1ZGUgUGF1bCAoNCk6Cj4gICAgZHJtL2RwX21zdDogUmVuYW1lIGRybV9kcF9t
c3RfaXNfZHBfbXN0X2VuZF9kZXZpY2UoKSB0byBiZSBsZXNzCj4gICAgICByZWR1bmRhbnQKPiAg
ICBkcm0vZHBfbXN0OiBVc2UgZnVsbF9wYm4gaW5zdGVhZCBvZiBhdmFpbGFibGVfcGJuIGZvciBi
YW5kd2lkdGggY2hlY2tzCj4gICAgZHJtL2RwX21zdDogUmVwcm9iZSBwYXRoIHJlc291cmNlcyBp
biBDU04gaGFuZGxlcgo+ICAgIGRybS9kcF9tc3Q6IFJld3JpdGUgYW5kIGZpeCBiYW5kd2lkdGgg
bGltaXQgY2hlY2tzCj4gCj4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5j
IHwgMTg1ICsrKysrKysrKysrKysrKysrKy0tLS0tLS0tCj4gICBpbmNsdWRlL2RybS9kcm1fZHBf
bXN0X2hlbHBlci5oICAgICAgIHwgICA0ICstCj4gICAyIGZpbGVzIGNoYW5nZWQsIDEyOSBpbnNl
cnRpb25zKCspLCA2MCBkZWxldGlvbnMoLSkKPiAKCi0tIApUaGFua3MsCk1pa2l0YSBMaXBza2kK
U29mdHdhcmUgRW5naW5lZXIgMiwgQU1ECm1pa2l0YS5saXBza2lAYW1kLmNvbQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

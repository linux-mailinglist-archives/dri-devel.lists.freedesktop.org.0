Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC142048E8
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jun 2020 07:00:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD9EA6E939;
	Tue, 23 Jun 2020 05:00:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750070.outbound.protection.outlook.com [40.107.75.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74F6E6E8DE;
 Tue, 23 Jun 2020 05:00:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VeMpW4/3Q67zvhsaiI7S5GC+/g8ejnAQyNm6CmaVvyUf044UkSVOIyNQAzHacjybhTqJqL1i0MoQ/YkOdu9vNffKf9TI7IMGuuzzqj+hY9m95ATzi7iZjt++70KEcZYtGBXpeP7TPmvugw0xDDZpxfI2GPxLEN4Wfv7SDp7jO1hGONxt0fnv4mIO4rzx56HAhHlzjKSojlQYe/I7TCoY1+1N7fubroon07buVxPxyIhvJT2fyzRyag60lFtk90EX871S+0Zg8TOtBfL3klQrHR353KPJkK3THTPJ/W4Mav83ZPTDNzvqJ8EMT5KfIj5n/mOmsVeRW+aZO9syyo2lZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8XKf44HRkbI77wqOeLRBFeAj6pepCmHVruxsgd+HVpk=;
 b=WOKEwDsvTbELyYF3fSI/NhhDkaDL6Mtd+yQ30kCK3LRR+EHZR22I7XVyuPoRwERg7gu1t+qwrf2rBiZaJjIbfBFaiNx0si69boVR+F66fIQw0/PeXM3YELFxJo5TqPl3rjNYnLRHUnadY9YVgZ3GZC8hz9GipIDjmg7r5UzzJsA++XHLhtB7hgg/zo669EqOJVZxWl4LApkyQ1tmvNX3NGu4cfoxQd+OIoJT/322G+SCnqjI5eGw+xoHDKzpjtam/xB3yW70VRYAl1hq1AHZ52fVYCvwIBwFgnjnx18jFavnQFfK2vUHJDFu9VmN3QxMvf4L98ivbEgCVqpF23/t3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8XKf44HRkbI77wqOeLRBFeAj6pepCmHVruxsgd+HVpk=;
 b=UgGl1182ddc7TFXHSteSy2xqskn/DZvxcPU2M985F2D8OXV355hurePLb9VW7YhvDu+eFDHeIQE3LMsnJRCREpE2L61QsZlyrZKjP0akPNLqALC55ILH3L/9WehqSjetWzSReK36OZZbnjm4R0aa+NZI8xg/gJIV0fQSyQjwiuI=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4340.namprd12.prod.outlook.com (2603:10b6:5:2a8::7) by
 DM5PR12MB1756.namprd12.prod.outlook.com (2603:10b6:3:108::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3109.23; Tue, 23 Jun 2020 05:00:05 +0000
Received: from DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::f5e6:e937:2eac:18cf]) by DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::f5e6:e937:2eac:18cf%3]) with mapi id 15.20.3109.027; Tue, 23 Jun 2020
 05:00:05 +0000
Subject: Re: [PATCH v2 3/8] drm/ttm: Add unampping of the entire device
 address space
To: Daniel Vetter <daniel@ffwll.ch>
References: <1592719388-13819-1-git-send-email-andrey.grodzovsky@amd.com>
 <1592719388-13819-4-git-send-email-andrey.grodzovsky@amd.com>
 <20200622094502.GB20149@phenom.ffwll.local>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <3a365581-0f00-32de-6656-77348dcd0ea2@amd.com>
Date: Tue, 23 Jun 2020 01:00:02 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <20200622094502.GB20149@phenom.ffwll.local>
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0111.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::20) To DM6PR12MB4340.namprd12.prod.outlook.com
 (2603:10b6:5:2a8::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:6818:fffb:5b06:bef1]
 (2607:fea8:3edf:49b0:6818:fffb:5b06:bef1) by
 YT1PR01CA0111.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3109.22 via Frontend Transport; Tue, 23 Jun 2020 05:00:04 +0000
X-Originating-IP: [2607:fea8:3edf:49b0:6818:fffb:5b06:bef1]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 69f898d0-cf1f-4fb7-6f53-08d817324b18
X-MS-TrafficTypeDiagnostic: DM5PR12MB1756:
X-Microsoft-Antispam-PRVS: <DM5PR12MB175644D60043876881EE0E08EA940@DM5PR12MB1756.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-Forefront-PRVS: 04433051BF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BNxjePP0ndfeIEUMMUmvnIhT/bi6bdHAsGUSV/890xRFxfbJefR5UHp3iMQ4wGdGj6mCHyTzo1z7u8hXhjWhmwUrMNXs7e4CM0jqwa55rsECWeTqzhObBtzXcWVZVRlo2du7S/PP2PFXmZO9u4lDtFUrvs9daRBGq7BG+H7WXWxYYJfectlR6/D3VQS/KXSRSvMMcUxSMOn6PnYQIcwXVXnLYUBHv+1k8+OOQlUjUQvfsF6tPB4DvY3GhVN+f4uc6CWCHql47i9CM+Tt4EbEH0+GOLt7q8FVTmqY9LLk/RDmOBmK2J5EJhRJ8vnEl78k6uHRjc/TflMfND1vo0cGLvZyqcgLDKuK2Kdr0v5S458Ns2UAN+9+1p4BRJS9j7E2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4340.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(376002)(136003)(39860400002)(396003)(366004)(36756003)(6916009)(186003)(16526019)(66946007)(6486002)(2906002)(478600001)(53546011)(52116002)(5660300002)(4326008)(2616005)(83380400001)(31686004)(31696002)(86362001)(8936002)(66556008)(66476007)(8676002)(316002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: N89IquqJGgWlHPL3MbOY55TaTajFS+Bcn/tqJ6LfXk5nTZmeVny1YS9OViTDCalajVWAMzIojMksibvhdb/9JfSUBv08Uu/kqQMkSm+PT6j1VGnjC5JGlOhaGLHrg2iOK5lDK0YC7O2hQTbEcyO3YSjO3RHtuUfFhLPY6dQK15P0jNQClJTS1vaK9uWdNBSpRv9YLJEnFUozuXesABsIvA5BDqwZ1/TeL3AOzRzP+t1sqie4FHiYI5LIds/sqR7diTHSEwQvRuEg+8g1eGS99cvZZH4LxkiL07QjuUSTQaawiv8wsiVZhaNJpaOnFDhg+2q8A+77S+ZZ3Oj//tzPI8RZOcL9Wbtf+fJcL18lu7PEqD0FeL5pHzlaBBK/Gh4HEdpID5iq7jx8MLghgbmmicbkKJH7LdgO3NnF1GU3kNJ7MrpSbO6lddMfAddQj1vWm4kZ+0CnorJvh9W/Dt3gS3x+1B4hEe6WtVc9UxBSkuekdYznsufwyqrot3JnL4W5Qso1eVNlyhatnhYpBl0Y9kwBZYQmZBpGvsONdz6r9yM=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69f898d0-cf1f-4fb7-6f53-08d817324b18
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2020 05:00:05.0473 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lh+09aZjLoKcxybL+Jfg0Tl5qIxTLOpyd2SXhCBZlYw72i74sCAlJ3Tis+mSj1T+1+DGjeh4dAMsp3/vgxbQiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1756
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
Cc: daniel.vetter@ffwll.ch, michel@daenzer.net, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, ckoenig.leichtzumerken@gmail.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDYvMjIvMjAgNTo0NSBBTSwgRGFuaWVsIFZldHRlciB3cm90ZToKPiBPbiBTdW4sIEp1biAy
MSwgMjAyMCBhdCAwMjowMzowM0FNIC0wNDAwLCBBbmRyZXkgR3JvZHpvdnNreSB3cm90ZToKPj4g
SGVscGVyIGZ1bmN0aW9uIHRvIGJlIHVzZWQgdG8gaW52YWxpZGF0ZSBhbGwgQk9zIENQVSBtYXBw
aW5ncwo+PiBvbmNlIGRldmljZSBpcyByZW1vdmVkLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBBbmRy
ZXkgR3JvZHpvdnNreSA8YW5kcmV5Lmdyb2R6b3Zza3lAYW1kLmNvbT4KPiBUaGlzIHNlZW1zIHRv
IGJlIG1pc3NpbmcgdGhlIGNvZGUgdG8gaW52YWxpZGF0ZSBhbGwgdGhlIGRtYS1idWYgbW1hcHM/
Cj4KPiBQcm9iYWJseSBuZWVkcyBtb3JlIHRlc3RjYXNlcyBpZiB5b3UncmUgbm90IHlldCBjYXRj
aGluZyB0aGlzLiBPciBhbSBJCj4gbWlzc2luZyBzb21ldGhpbmcsIGFuZCB3ZSdyZSBleGNoYW5n
aW5nIHRoZSB0aGUgYWRkcmVzcyBzcGFjZSBhbHNvIGZvcgo+IGRtYS1idWY/Cj4gLURhbmllbAoK
CklNSE8gdGhlIGRldmljZSBhZGRyZXNzIHNwYWNlIGluY2x1ZGVzIGFsbCB1c2VyIGNsaWVudHMg
aGF2aW5nIGEgQ1BVIHZpZXcgb2YgdGhlIApCTyBlaXRoZXIgZnJvbSBkaXJlY3QgbWFwcGluZyB0
aG91Z2ggZHJtIGZpbGUgb3IgYnnCoCBtYXBwaW5nIHRocm91Z2ggaW1wb3J0ZWQgCkJPJ3MgRkQu
CgpBbmRyZXkKCgo+Cj4+IC0tLQo+PiAgIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMgICAg
fCA4ICsrKysrKy0tCj4+ICAgaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19kcml2ZXIuaCB8IDcgKysr
KysrKwo+PiAgIDIgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMgYi9kcml2
ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCj4+IGluZGV4IGM1YjUxNmYuLjkyNmEzNjUgMTAwNjQ0
Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKPj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL3R0bS90dG1fYm8uYwo+PiBAQCAtMTc1MCwxMCArMTc1MCwxNCBAQCB2b2lkIHR0bV9i
b191bm1hcF92aXJ0dWFsKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8pCj4+ICAgCXR0bV9i
b191bm1hcF92aXJ0dWFsX2xvY2tlZChibyk7Cj4+ICAgCXR0bV9tZW1faW9fdW5sb2NrKG1hbik7
Cj4+ICAgfQo+PiAtCj4+IC0KPj4gICBFWFBPUlRfU1lNQk9MKHR0bV9ib191bm1hcF92aXJ0dWFs
KTsKPj4gICAKPj4gK3ZvaWQgdHRtX2JvX3VubWFwX3ZpcnR1YWxfYWRkcmVzc19zcGFjZShzdHJ1
Y3QgdHRtX2JvX2RldmljZSAqYmRldikKPj4gK3sKPj4gKwl1bm1hcF9tYXBwaW5nX3JhbmdlKGJk
ZXYtPmRldl9tYXBwaW5nLCAwLCAwLCAxKTsKPj4gK30KPj4gK0VYUE9SVF9TWU1CT0wodHRtX2Jv
X3VubWFwX3ZpcnR1YWxfYWRkcmVzc19zcGFjZSk7Cj4+ICsKPj4gICBpbnQgdHRtX2JvX3dhaXQo
c3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywKPj4gICAJCWJvb2wgaW50ZXJydXB0aWJsZSwg
Ym9vbCBub193YWl0KQo+PiAgIHsKPj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL3R0bS90dG1f
Ym9fZHJpdmVyLmggYi9pbmNsdWRlL2RybS90dG0vdHRtX2JvX2RyaXZlci5oCj4+IGluZGV4IGM5
ZTBmZDAuLjM5ZWE0NGYgMTAwNjQ0Cj4+IC0tLSBhL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fZHJp
dmVyLmgKPj4gKysrIGIvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19kcml2ZXIuaAo+PiBAQCAtNjAx
LDYgKzYwMSwxMyBAQCBpbnQgdHRtX2JvX2RldmljZV9pbml0KHN0cnVjdCB0dG1fYm9fZGV2aWNl
ICpiZGV2LAo+PiAgIHZvaWQgdHRtX2JvX3VubWFwX3ZpcnR1YWwoc3RydWN0IHR0bV9idWZmZXJf
b2JqZWN0ICpibyk7Cj4+ICAgCj4+ICAgLyoqCj4+ICsgKiB0dG1fYm9fdW5tYXBfdmlydHVhbF9h
ZGRyZXNzX3NwYWNlCj4+ICsgKgo+PiArICogQGJkZXY6IHRlYXIgZG93biBhbGwgdGhlIHZpcnR1
YWwgbWFwcGluZ3MgZm9yIHRoaXMgZGV2aWNlCj4+ICsgKi8KPj4gK3ZvaWQgdHRtX2JvX3VubWFw
X3ZpcnR1YWxfYWRkcmVzc19zcGFjZShzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldik7Cj4+ICsK
Pj4gKy8qKgo+PiAgICAqIHR0bV9ib191bm1hcF92aXJ0dWFsCj4+ICAgICoKPj4gICAgKiBAYm86
IHRlYXIgZG93biB0aGUgdmlydHVhbCBtYXBwaW5ncyBmb3IgdGhpcyBCTwo+PiAtLSAKPj4gMi43
LjQKPj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

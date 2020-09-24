Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 244B7276F84
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 13:10:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D92FA6E1F5;
	Thu, 24 Sep 2020 11:10:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2046.outbound.protection.outlook.com [40.107.223.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F25B6E1F5
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 11:10:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UQe9A6NNhxJ6ZOUMoxLwPBuObnYcbc37XF7RgOuLZoFU+X/yl1MTT4IRRaK0ojJGODqhNJJ/ud0Le1l4X0uPxqSTYd76VL5LNsd3Yddjbk9VrCYmQcLXfvC9ubN7/WzuHGuiWk6G/8EjS23S7pX3BEXiCcxsnfQX/TQSeCExCsyJL71EN5NrsbzoTyXET/5IpfjSJ3Ny8uozzV4hVIHEuSj88ozF/j6wxkjgeIH5e3jbbCcudh9iKmGk9WCV+mX9a3nOqnLzO1AQo61/GgE5GAnQsTevYaZK/M5BRsoZb7WLTSF40EJyq/efK7AR5gZ7UPD3cR7wBrnzf4vDbBrGJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zrL7nSNrUPx08bM/FwOFi5kVIDzotNf4bjYKwLr7Yi8=;
 b=bPs0/HSsJY40zvP+ElsNJLmpSFHBW4s+qhmr2sR5zsitbN82j09nzfejnExZOFDT7jOLXsgtw70vb0QgotTKZ1881GhpxpjQOUPALxa7ieJqIvk21/zKHhqRF8zEb0gBnynukfUTIIhQTRQ2d8ynH6Ub7XWhrIIKywXgHTx8V1PcqOwIdphmtTHCx95BGxaWKNMplxNJOEix00D4wyCQz2IiiEYgsQ1UePNf6ZphDtCVMn/mPiCjrJmx79Sj0/klMPvG0SsUmAqV6NXezrVglg2B6be4ZgyZcBjHMeCBjsY+tyOi6gZdQCnSgD1QGPj+AOY2yA88hpOJPb/Usc0ZFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zrL7nSNrUPx08bM/FwOFi5kVIDzotNf4bjYKwLr7Yi8=;
 b=gody9/QJG2NlToV+MRuew+oA88nqHkR4ShHr+lVotaTZEMGrJl/FZh476aWCDIkvaBnWSi5d0rMJWBCvQs5mbfXbsg9Lx5z8fVmLM8T9MIa0Zxqx8hyoN166PtImRkneZY9IikpsZDp+b8djFpDw9d0iNR19WzQBRaf2/jPHeB0=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.21; Thu, 24 Sep
 2020 11:10:33 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3412.022; Thu, 24 Sep 2020
 11:10:33 +0000
Subject: Re: [PATCH 03/45] drm/amdgpu/ttm: handle tt moves properly.
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200924051845.397177-1-airlied@gmail.com>
 <20200924051845.397177-4-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <a0b3e1d5-a707-9702-9b36-a8f34c9f9f00@amd.com>
Date: Thu, 24 Sep 2020 13:10:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200924051845.397177-4-airlied@gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR05CA0079.eurprd05.prod.outlook.com
 (2603:10a6:208:136::19) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR05CA0079.eurprd05.prod.outlook.com (2603:10a6:208:136::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20 via Frontend
 Transport; Thu, 24 Sep 2020 11:10:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3321b108-77b6-43a3-2861-08d8607a74be
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:
X-Microsoft-Antispam-PRVS: <BL0PR12MB23531364131197CB095941EF83390@BL0PR12MB2353.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8RTzQr9VrT05FVqGZGS1Y4PeVFsu0qZUpITtNsCrcqJ7poIcy8lwhLn6kSul7YRa6BsSKNXPTDDPpFT4NHbZtogFM91YiiuIpW7Pi6XZfX4pJ6vVQf/zkFsOI5YBqOmo/TDosVhJBg737/PcjiXjqxu6D3Xl3IfLT7ZeKlCyA0SpPReEuyN5jOlLYiOeOsCY2Qzdz9lgHln6iYoCMgNZpmhPtZ3pCOlaQ7G/yKr9AFpRw5idl1KDaoI4upRH9IZghigXYPGTI/4lSQRT691eJvezqWdxEi5+0eBbohex6O5fxyBCrrdl/QIWAqg/D5LPaImLONLVJG+vOS781JZ/+Mxh17I7s0bqjbqwscjfpZlWlrt9Ll9xpJ0pDZ2iWm/N
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(136003)(39860400002)(396003)(346002)(5660300002)(6486002)(316002)(4326008)(478600001)(8936002)(8676002)(52116002)(2616005)(16526019)(36756003)(31696002)(66946007)(66476007)(66556008)(186003)(31686004)(83380400001)(86362001)(6666004)(2906002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: NfDrJiiQjwuK2yrWJfSWyqDofLzq6QvqB+onlefwHZVSu6FLu1Z3if+d/LtuqG7MUzKJhVO67+ap07H3MgvuX98SgCr29CwWuWuPYe6eNXwRUGklsCSj4EIrY6x0iovxhXDQIHmXxdP+DJuOaMOf9TVnNyvTXBxGXfNOFTpg+Mu/tqSEaFsr7vEl4A7eGOk4kgRmjBdA4UWgTztAHfjxXUd2pwzuwmUhCils2VJkTIA8cczLaCLMDGJ0H+U/jcPFkjfu4Kt4p8g7PW5rsfAntKuz/n64oVMOqkf/xS/VYujpnwoaXtayFOtr+PPu+eZ+eoWM9GwjNq+uDUoQTG6hUv/sCYLIa6Mc8fZYMADjStHRegu5jUmVYCzcMuxRrr8rFsTO3UxX3HnBFyP2cie5alQUWG9fm0yOOSZzyOlre86VLfdkrMZpExvacKYR9go7uSTPhG/36BojoT6pjvlnrVBLVQQdXnBJq360aO/QolI4EnfD5diq8eslDGIPxEifov0L8u4PD3poHnvCrgUsyAfXzkrjfwGt2EpIufNl33IwKZWcwpsMax7Ga4aSbadatnoQN1mUicb5uZvfZ3BnuOxJU8j5nS6NmSDyz62+uXaJtyFhYcEg6X+061ZYI64qGs9iotuvgZzcdrt1TPjgWUb003cIQz/dIFuqSv1+Gdca/dt//bCvKao1WDve1kkiS+JEmQmhdYsb6SYdn7lXNg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3321b108-77b6-43a3-2861-08d8607a74be
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2020 11:10:33.5510 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vkDCGKk1iT6sbKUzvnu038uOnYnOk70faxe5tqL38B6lVpvYGdpabAR1MJjd6pml
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2353
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
cmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+Cj4gVGhlIGNvcmUgbW92ZSBjb2RlIGN1cnJlbnRs
eSBoYW5kbGVzIHVzZV90dCBtb3ZlcywgZm9yIGFtZGdwdQo+IHRoaXMgd2FzIGJlaW5nIGhhbmRs
ZWQgYWxzbyBpbiB0aGUgZHJpdmVyLCBidXQgbm90IHVzaW5nIHRoZSBzYW1lCj4gcGF0aHMuCj4K
PiBJZiBtb3ZpbmcgYmV0d2VlbiBUVC9TWVNURU0gKGFsbCB0aGUgdXNlX3R0IHBhdGhzIG9uIGFt
ZGdwdSkgdXNlCj4gdGhlIGNvcmUgbW92ZSBmdW5jdGlvbi4KPgo+IEV2ZW50dWFsbHkgdGhlIGNv
cmUgd2lsbCBiZSBmbGlwcGVkIG92ZXIgdG8gY2FsbGluZyB0aGUgZHJpdmVyLgo+Cj4gU2lnbmVk
LW9mZi1ieTogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KClJldmlld2VkLWJ5OiBD
aHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cgo+IC0tLQo+ICAgZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jIHwgMTIgKysrKysrKy0tLS0tCj4g
ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+Cj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYwo+IGluZGV4IGRiNWY3NjFmMzdlYy4u
ZDNiZDJmZDQ0OGJlIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV90dG0uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0u
Ywo+IEBAIC02NzEsMTQgKzY3MSwxNiBAQCBzdGF0aWMgaW50IGFtZGdwdV9ib19tb3ZlKHN0cnVj
dCB0dG1fYnVmZmVyX29iamVjdCAqYm8sIGJvb2wgZXZpY3QsCj4gICAJCXR0bV9ib19tb3ZlX251
bGwoYm8sIG5ld19tZW0pOwo+ICAgCQlyZXR1cm4gMDsKPiAgIAl9Cj4gLQlpZiAoKG9sZF9tZW0t
Pm1lbV90eXBlID09IFRUTV9QTF9UVCAmJgo+IC0JICAgICBuZXdfbWVtLT5tZW1fdHlwZSA9PSBU
VE1fUExfU1lTVEVNKSB8fAo+IC0JICAgIChvbGRfbWVtLT5tZW1fdHlwZSA9PSBUVE1fUExfU1lT
VEVNICYmCj4gLQkgICAgIG5ld19tZW0tPm1lbV90eXBlID09IFRUTV9QTF9UVCkpIHsKPiAtCQkv
KiBiaW5kIGlzIGVub3VnaCAqLwo+ICsJaWYgKG9sZF9tZW0tPm1lbV90eXBlID09IFRUTV9QTF9T
WVNURU0gJiYKPiArCSAgICBuZXdfbWVtLT5tZW1fdHlwZSA9PSBUVE1fUExfVFQpIHsKPiAgIAkJ
dHRtX2JvX21vdmVfbnVsbChibywgbmV3X21lbSk7Cj4gICAJCXJldHVybiAwOwo+ICAgCX0KPiAr
Cj4gKwlpZiAob2xkX21lbS0+bWVtX3R5cGUgPT0gVFRNX1BMX1RUICYmCj4gKwkgICAgbmV3X21l
bS0+bWVtX3R5cGUgPT0gVFRNX1BMX1NZU1RFTSkKPiArCQlyZXR1cm4gdHRtX2JvX21vdmVfdHRt
KGJvLCBjdHgsIG5ld19tZW0pOwo+ICsKPiAgIAlpZiAob2xkX21lbS0+bWVtX3R5cGUgPT0gQU1E
R1BVX1BMX0dEUyB8fAo+ICAgCSAgICBvbGRfbWVtLT5tZW1fdHlwZSA9PSBBTURHUFVfUExfR1dT
IHx8Cj4gICAJICAgIG9sZF9tZW0tPm1lbV90eXBlID09IEFNREdQVV9QTF9PQSB8fAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

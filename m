Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D96189D31
	for <lists+dri-devel@lfdr.de>; Wed, 18 Mar 2020 14:42:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EF4F89C09;
	Wed, 18 Mar 2020 13:42:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2067.outbound.protection.outlook.com [40.107.236.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24E5C89C09;
 Wed, 18 Mar 2020 13:42:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DXuvzZUvSCs6rR2bNiwJVZ7sUVQekh+wS1wwgH4h5xrZoJmMRlpP+6yV2JyzupOXjqvfjJCBSP1V64avSx+jmD+8P08C/WetK21vWTdg70xQD20pQGOrKb3zACpGBP3ZTZarQ5ioNTDYMPSM0daIzsI/XCdByoYnlksSZShW6DMbpr/sAtydPMTwLR5vtpqq6206hP6+amcS/snXoPl3n5D9Uj8GU76rSP+p4xqFyofU9J7FYcI+H02qJOqITSc3vExcgp3EUioaBbJxgQxvxeHlzCvWegNzE78ldWhdLLCpmzCqQzuFkJfmx0K4hYMl4v/sqvBFoU5soBCbsHbX3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=74a4djp87XUJPUhX+Ecz7JBhknwOZmk1+aWnbvRSaOY=;
 b=lOeJeCup79qdNVjLkfz5qcolAC7Cnz2EBlK/2vbE/klRzfXAwKCRKRvkjy6AUjdVnTAT68UGWMjaf9NurHw0JsvkI35AbQz/oGJrZzlKAVqLCEXLBfu9khMBbpxRjgkLMDAqJh9KoimvifhuPlIc5lu0EY93+414cpJ/TypvEh0/eRBGqzzKP3BTrhZRFal69f3rOmbUiFc/o3+h6iM93IFONqutTMld22qG+So/xKhnn8MTIP2EMFmIFEd6oxio8jg079aY+0li0BiR+dl9EH9Da9kHMrw2hznC4K4AXsABiP/UhoZw/sxwoy1tLoRurndwGDKaQvc9G8ij4X5YqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=74a4djp87XUJPUhX+Ecz7JBhknwOZmk1+aWnbvRSaOY=;
 b=AW0/hGc+1i5mAfHl8/m3O1/Ow9kHkbNKKS+cUpCFDAuZCnaSP9LYxF/enz9GICPhVswAqmfzh1LNvfv39nNsaEzxKXZiDCMG0IwB5ilQxe7tuVmJmJ55mS8ISpct8mypzKR0Uha6nCjRDIPyVHBTGh8bSVY2zblPvo9L3ZIOCe0=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Harry.Wentland@amd.com; 
Received: from MW3PR12MB4379.namprd12.prod.outlook.com (2603:10b6:303:5e::11)
 by MW3PR12MB4489.namprd12.prod.outlook.com (2603:10b6:303:5e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.18; Wed, 18 Mar
 2020 13:42:29 +0000
Received: from MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::2ca3:d95b:6303:76a5]) by MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::2ca3:d95b:6303:76a5%7]) with mapi id 15.20.2814.021; Wed, 18 Mar 2020
 13:42:29 +0000
Subject: Re: [PATCH 2/3] drm: Create a drm_connector_helper_funcs hook for
 Adaptive Sync support
To: Manasi Navare <manasi.d.navare@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20200318063517.3844-1-manasi.d.navare@intel.com>
 <20200318063517.3844-2-manasi.d.navare@intel.com>
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
Message-ID: <df0c6a51-418c-6a1a-5b14-4c895114bb1d@amd.com>
Date: Wed, 18 Mar 2020 09:42:24 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
In-Reply-To: <20200318063517.3844-2-manasi.d.navare@intel.com>
Content-Language: en-US
X-ClientProxiedBy: BN8PR16CA0030.namprd16.prod.outlook.com
 (2603:10b6:408:4c::43) To MW3PR12MB4379.namprd12.prod.outlook.com
 (2603:10b6:303:5e::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.252.3.202] (165.204.84.11) by
 BN8PR16CA0030.namprd16.prod.outlook.com (2603:10b6:408:4c::43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.21 via Frontend Transport; Wed, 18 Mar 2020 13:42:27 +0000
X-Originating-IP: [165.204.84.11]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 44a2d5c3-928d-4dba-2cef-08d7cb42338e
X-MS-TrafficTypeDiagnostic: MW3PR12MB4489:|MW3PR12MB4489:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW3PR12MB4489CF1BE16CC8A223B26CD38CF70@MW3PR12MB4489.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-Forefront-PRVS: 03468CBA43
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(396003)(39860400002)(366004)(136003)(199004)(316002)(4326008)(478600001)(16526019)(6486002)(186003)(54906003)(16576012)(66574012)(956004)(5660300002)(52116002)(53546011)(26005)(2616005)(31696002)(36756003)(66946007)(6666004)(8676002)(31686004)(81166006)(66556008)(66476007)(8936002)(81156014)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MW3PR12MB4489;
 H:MW3PR12MB4379.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nSg7/tPHVfBUhFcbJmEyqc/ignRmIm0WItkMnx9a7IeBlAHIg2g0SjV+mEfz8RglEpuhh4QdIHNL+5Ot1h2GsEY6oE0g8cFNFVbO+xf7hSpgPWore5M0AsNd4zDar5G1BVse2mqI85L2veZJB6XLceEFGtlsY3Yl8O44zjGZbfPynByKpTiqHUlZpGBthRnuukET82o0s+sNFsl8GYlAoR7P89mFNhJwzQD7hJnoURQ2S5iMty2CCNoYPSoCpUur5gwzVA3Rl7IQ2731RDZebsg3jbromaP1qUvMuFO4BmIKRwMqU2LBOvEAr0MOnsivuToRyACZ28rMHIpDjDNMWVxf5Cb+6gBPXd/CNdLaME/wC6M5l4C/FlKJS7nVAoI4ongYAY5sHNZEQVgr2bFp4XVT4l2KIH/jljruyGQivpCyYfVFRa9A+nMj2rhVAKTa
X-MS-Exchange-AntiSpam-MessageData: BrHXAZa2zH62Hk9T8PkjUcache9vMYEIFg2ylrOIot2kAV6B6LFmlfC0kaRvzYTr5Mk7TOYt276IVT16MPjmcMlUaJdUvT5awq7DeUg8DN3mPGZuURavQmdesdElFmvH/COvPCyvgmN7LarlgVPf2w==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44a2d5c3-928d-4dba-2cef-08d7cb42338e
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2020 13:42:29.1341 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QDIqoEfeGsK1AuZQ/madnibWIyHROYLJZldiVpttO0GbJG5QS+nybbTIADkdIegt5yXNcGn+Tql6UfCHc0xioQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4489
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
Cc: Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC0wMy0xOCAyOjM1IGEubS4sIE1hbmFzaSBOYXZhcmUgd3JvdGU6Cj4gVGhpcyBwYXRj
aCBhZGRzIGEgaG9vayBpbiBkcm1fY29ubmVjdG9yX2hlbHBlcl9mdW5jcyB0byBnZXQgdGhlCj4g
c3VwcG9ydCBvZiB0aGUgZHJpdmVyIGZvciBhZGFwdGl2ZSBzeW5jIGZ1bmN0aW9uYWxpdHkuCj4g
Cj4gVGhpcyBjYW4gYmUgY2FsbGVkIGluIHRoZSBjb25uZWN0b3IgcHJvYmUgaGVscGVyIGZ1bmN0
aW9uIGFmdGVyCj4gdGhlIGNvbm5lY3RvciBkZXRlY3QoKSBhbmQgZ2V0X21vZGVzKCkgaG9va3Mg
dG8gYWxzbwo+IHF1ZXJ5IHRoZSBhZGFwdGl2ZSBzeW5jIHN1cHBvcnQgb2YgdGhlIGRyaXZlci4K
PiAKPiBDYzogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGxpbnV4LmludGVsLmNvbT4KPiBDYzog
VmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPiBDYzogSGFy
cnkgV2VudGxhbmQgPGhhcnJ5LndlbnRsYW5kQGFtZC5jb20+Cj4gQ2M6IE5pY2hvbGFzIEthemxh
dXNrYXMgPE5pY2hvbGFzLkthemxhdXNrYXNAYW1kLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBNYW5h
c2kgTmF2YXJlIDxtYW5hc2kuZC5uYXZhcmVAaW50ZWwuY29tPgoKUGF0Y2hlcyAxIGFuZCAyIGFy
ZQpSZXZpZXdlZC1ieTogSGFycnkgV2VudGxhbmQgPGhhcnJ5LndlbnRsYW5kQGFtZC5jb20+CgpI
YXJyeQoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9wcm9iZV9oZWxwZXIuYyAgICAgICB8
ICA0ICsrKysKPiAgaW5jbHVkZS9kcm0vZHJtX21vZGVzZXRfaGVscGVyX3Z0YWJsZXMuaCB8IDE2
ICsrKysrKysrKysrKysrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspCj4g
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJvYmVfaGVscGVyLmMgYi9kcml2
ZXJzL2dwdS9kcm0vZHJtX3Byb2JlX2hlbHBlci5jCj4gaW5kZXggNTc2YjRiN2RjZDg5Li40NDAz
ODE3YmZiMDIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9wcm9iZV9oZWxwZXIu
Ywo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJvYmVfaGVscGVyLmMKPiBAQCAtNDgyLDYg
KzQ4MiwxMCBAQCBpbnQgZHJtX2hlbHBlcl9wcm9iZV9zaW5nbGVfY29ubmVjdG9yX21vZGVzKHN0
cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsCj4gIAo+ICAJY291bnQgPSAoKmNvbm5lY3Rv
cl9mdW5jcy0+Z2V0X21vZGVzKShjb25uZWN0b3IpOwo+ICAKPiArCS8qIEdldCB0aGUgQWRhcHRp
dmUgU3luYyBTdXBwb3J0IGlmIGhlbHBlciBleGlzdHMgKi8KPiArCWlmICgqY29ubmVjdG9yX2Z1
bmNzLT5nZXRfYWRhcHRpdmVfc3luY19zdXBwb3J0KQo+ICsJCSgqKmNvbm5lY3Rvcl9mdW5jcy0+
Z2V0X2FkYXB0aXZlX3N5bmNfc3VwcG9ydCkoY29ubmVjdG9yKTsKPiArCj4gIAkvKgo+ICAJICog
RmFsbGJhY2sgZm9yIHdoZW4gRERDIHByb2JlIGZhaWxlZCBpbiBkcm1fZ2V0X2VkaWQoKSBhbmQg
dGh1cyBza2lwcGVkCj4gIAkgKiBvdmVycmlkZS9maXJtd2FyZSBFRElELgo+IGRpZmYgLS1naXQg
YS9pbmNsdWRlL2RybS9kcm1fbW9kZXNldF9oZWxwZXJfdnRhYmxlcy5oIGIvaW5jbHVkZS9kcm0v
ZHJtX21vZGVzZXRfaGVscGVyX3Z0YWJsZXMuaAo+IGluZGV4IDdjMjBiMWM4YjZhNy4uMGIyMDNm
ZGQyNWRmIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9tb2Rlc2V0X2hlbHBlcl92dGFi
bGVzLmgKPiArKysgYi9pbmNsdWRlL2RybS9kcm1fbW9kZXNldF9oZWxwZXJfdnRhYmxlcy5oCj4g
QEAgLTEwNzksNiArMTA3OSwyMiBAQCBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9oZWxwZXJfZnVuY3Mg
ewo+ICAJCQkJICAgICBzdHJ1Y3QgZHJtX3dyaXRlYmFja19qb2IgKmpvYik7Cj4gIAl2b2lkICgq
Y2xlYW51cF93cml0ZWJhY2tfam9iKShzdHJ1Y3QgZHJtX3dyaXRlYmFja19jb25uZWN0b3IgKmNv
bm5lY3RvciwKPiAgCQkJCSAgICAgIHN0cnVjdCBkcm1fd3JpdGViYWNrX2pvYiAqam9iKTsKPiAr
Cj4gKwkvKioKPiArCSAqIEBnZXRfYWRhcHRpdmVfc3luY19zdXBwb3J0Ogo+ICsJICoKPiArCSAq
IFRoaXMgaG9vayBpcyB1c2VkIGJ5IHRoZSBwcm9iZSBoZWxwZXIgdG8gZ2V0IHRoZSBkcml2ZXIn
cyBzdXBwb3J0Cj4gKwkgKiBmb3IgYWRhcHRpdmUgc3luYyBvciB2YXJpYWJsZSByZWZyZXNoIHJh
dGUuCj4gKwkgKiBUaGlzIGlzIGNhbGxlZCBmcm9tIGRybV9oZWxwZXJfcHJvYmVfc2luZ2xlX2Nv
bm5lY3Rvcl9tb2RlcygpCj4gKwkgKiBUaGlzIGlzIGNhbGxlZCBhZnRlciB0aGUgQGdldF9tb2Rl
cyBob29rIHNvIHRoYXQgdGhlIGNvbm5lY3RvciBtb2Rlcwo+ICsJICogYXJlIGFscmVhZHkgb2J0
YWluZWQgYW5kIEVESUQgaXMgcGFyc2VkIHRvIG9idGFpbiB0aGUgbW9uaXRvcgo+ICsJICogcmFu
Z2UgZGVzY3JpcHRvciBpbmZvcm1hdGlvbi4KPiArCSAqCj4gKwkgKiBUaGlzIGhvb2sgaXMgb3B0
aW9uYWwgYW5kIGRlZmluZWQgb25seSBmb3IgdGhlIGRyaXZlcnMgYW5kIG9uCj4gKwkgKiBjb25u
ZWN0b3JzIHRoYXQgYWR2ZXJ0aXNlIGFkYXB0aXZlIHN5bmMgc3VwcG9ydC4KPiArCSAqCj4gKwkg
Ki8KPiArCXZvaWQgKCpnZXRfYWRhcHRpdmVfc3luY19zdXBwb3J0KShzdHJ1Y3QgZHJtX2Nvbm5l
Y3RvciAqY29ubmVjdG9yKTsKPiAgfTsKPiAgCj4gIC8qKgo+IApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

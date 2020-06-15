Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B919F1FA4D0
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jun 2020 01:57:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63DED6E56A;
	Mon, 15 Jun 2020 23:57:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2045.outbound.protection.outlook.com [40.107.223.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FCA46E566;
 Mon, 15 Jun 2020 23:57:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W0FzlObrMvPx5Yfe59cqeB4s5PBDwHAPm4oORECBLfvckF/JemopLMnzuU4tyaaDrpNjQlRu8OahNPD6W3DqYB6RbYjH8Yijr3e8Gt9+8RZiV+Lo9UJyCSaBJA28oEB/JmnrqyHR4vCSiDd+NS2cVY4BNJaWShJ/654Y3QxyRbUi0X9IYu6Ob20nd0GGfQpHUEx8YfobfzXW/GbFwGvc1jTc7vKge+4QnEeN7VWVBFZyPWNa1FSyzDMhxX0oSIiiUDLBoKA/yRZ6flz4jOllVHW8CQ7xzEMi6Pf3mFBq9UJ9KpkFB4U4Xi/ILyvYvB5oFXfT30dsgBqjG1uSUT6WvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hGRwWTggQ0JenzXESwFnQH6dFS/cDUfqaFEXscCU1lg=;
 b=IGJ6ljUvS35rkfN+1onFftrEQjMHsxKjca9IcJXgUbX/76QPts/sK4gafEd2sUnfs54X81nAL5eTB7UPgo1mGyQ9ERdZbYdk8vWu+1XFJ97UrQFiAlAyGtrQ/inqNy+URVVpHUcLx0pPipGBiZB6pG+yueXJqD/SDsi6onvFnSoZ+vh5ZGPD2Q7KWg0QJ741U/7VCgoxk2sTSBVx1SyYUstzpx1419LYV0+l/y/zxKHDkj9GOCyuBEfy6mPzaTS5JvLCFmzHs9EhPm1QHOewQppBThDtwdE3iiGTbpmJCAAfM6lFNNbFvF66i6Q0rkEFjNSjrHcaF4+0P8x+JAe0wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hGRwWTggQ0JenzXESwFnQH6dFS/cDUfqaFEXscCU1lg=;
 b=q34wYY50ITrcmyKSzrn5nf7wMAM+m5Q8xJWbTW42dX8UIR/wCykmHBP9rJPk27Jiejva/ygilhCbebKTTTgXvpPxFeb8FKhRJ8FUEOwjAQ1OM8t8OwBJj213V56/30Z5R0A/crk4SPf64KzBhOQe3o8GzOuGDRlc9EHK+palCdk=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from SN1PR12MB2414.namprd12.prod.outlook.com (2603:10b6:802:2e::31)
 by SN6PR12MB2766.namprd12.prod.outlook.com (2603:10b6:805:78::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18; Mon, 15 Jun
 2020 23:57:39 +0000
Received: from SN1PR12MB2414.namprd12.prod.outlook.com
 ([fe80::18d:97b:661f:9314]) by SN1PR12MB2414.namprd12.prod.outlook.com
 ([fe80::18d:97b:661f:9314%7]) with mapi id 15.20.3088.029; Mon, 15 Jun 2020
 23:57:39 +0000
Subject: Re: [PATCH] drm/amdkfd: Fix reference count leaks.
To: wu000273@umn.edu, kjlu@umn.edu
References: <20200613193226.21531-1-wu000273@umn.edu>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <349ff701-613e-7234-45ec-0f874e135712@amd.com>
Date: Mon, 15 Jun 2020 19:57:36 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200613193226.21531-1-wu000273@umn.edu>
Content-Language: en-US
X-ClientProxiedBy: YTOPR0101CA0015.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::28) To SN1PR12MB2414.namprd12.prod.outlook.com
 (2603:10b6:802:2e::31)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.149.124] (165.204.55.211) by
 YTOPR0101CA0015.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.19 via Frontend
 Transport; Mon, 15 Jun 2020 23:57:38 +0000
X-Originating-IP: [165.204.55.211]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 738983ea-0144-4371-63ce-08d81187e25c
X-MS-TrafficTypeDiagnostic: SN6PR12MB2766:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB2766ED1B2714A6C580444A9A929C0@SN6PR12MB2766.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-Forefront-PRVS: 04359FAD81
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IhIWeAsmAUdBrj5JNEKVy5K1cfH+zxZgDiA65KrudyzmjPeO4noZTM+QAHsl4zq0TKmCSuVVOtmLpUWrh9UW815B9m/3A1zLD5YVrXvBe+NhC9MH53iWIOSSSu8a+Co3IadYMKzKWdiMiTL15mcrVrfh7oQNLbzLiZxdqh+FNEUGodDjWwc/q+2o4mpJCaPjOdjL2AeOnw1wloJqEbzVCtGqA+4utlBrN7tZo+oY3RbVfFabgNs8qqPT/t5XfnI3xlhRz14XUEqSi1oS6ZhD6rQmjMa74EatrXroxp4QZu8VT5HJvr34vGhwTJTvfGOkih3n68tZwzSLNVV78PXIj6bZN8/FLALfvJFBeU7wD0CeCV3P1jWCceRrxUsYqvOK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN1PR12MB2414.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(396003)(366004)(376002)(39860400002)(136003)(186003)(16526019)(4326008)(8676002)(66556008)(956004)(2906002)(2616005)(6486002)(44832011)(8936002)(66946007)(66476007)(86362001)(31696002)(36756003)(52116002)(31686004)(26005)(5660300002)(16576012)(83380400001)(478600001)(53546011)(316002)(54906003)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: r4DnOhXjAc4fW3GdDSsVGeFgpdtmezcg5n00Km52427cDOatx+gxKVjKy3natk1Ps8N5+qS5B8sN0c6NT1kqbEdWNOM32aOSPvzC8P3eZhrVcB5oCZkEjF2OkENsCEEjI0RpYRX0DWPV+80z1y2PHAfVipl99CKiVvgD8XXHYA8yUnARfF59SWaq538tEBcFIXovdhfNvAfOZCSPB/XQMaFI4LiV7GcCpHfomfR3VsQJwlIn0iTI6atkdslNFjUDs0jfkLtWliMFWd2299w4PXtZ0J/sEHhqg0Fyb/Q9ZxO7tTo1+k70YdvLN/a7dtyGpcxRUYcxYE7t3DInt8oa1J8kVUNXFN1P5314Kg/4+flJQFBE34paqTQNE3CaVliz3XDp2sz7JIwnux8wr0ZR7qYymhh4veOhLGt1dUip/hufl03dhzGmPNMtYsll1s7aceFHyXiCnFrDYsgTHHqYJIZCqb+NvtWZZtDFHP7ufblBSrWBFqu9qFX5FDybjCMF
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 738983ea-0144-4371-63ce-08d81187e25c
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2020 23:57:39.1546 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C2NeNXi6vGnnkQn5W4EDXVy52sAn/tQbHmk/sOZgCT5sdpoYRNvdrPyRlj7xku5yKLHDWJlJHAA4u8TLj7gB/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2766
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC0wNi0xMyAxNTozMiwgd3UwMDAyNzNAdW1uLmVkdSB3cm90ZToKPiBGcm9tOiBRaXVz
aGkgV3UgPHd1MDAwMjczQHVtbi5lZHU+Cj4KPiBrb2JqZWN0X2luaXRfYW5kX2FkZCgpIHRha2Vz
IHJlZmVyZW5jZSBldmVuIHdoZW4gaXQgZmFpbHMuCj4gSWYgdGhpcyBmdW5jdGlvbiByZXR1cm5z
IGFuIGVycm9yLCBrb2JqZWN0X3B1dCgpIG11c3QgYmUgY2FsbGVkIHRvCj4gcHJvcGVybHkgY2xl
YW4gdXAgdGhlIG1lbW9yeSBhc3NvY2lhdGVkIHdpdGggdGhlIG9iamVjdC4KPgo+IFNpZ25lZC1v
ZmYtYnk6IFFpdXNoaSBXdSA8d3UwMDAyNzNAdW1uLmVkdT4KClRoYW5rIHlvdS4gVGhlIHBhdGNo
IGlzCgpSZXZpZXdlZC1ieTogRmVsaXggS3VlaGxpbmcgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+
CgpJJ20gYXBwbHlpbmcgdGhlIHBhdGNoIHRvIG91ciBhbWQtc3RhZ2luZy1kcm0tbmV4dCBicmFu
Y2guCgpSZWdhcmRzLAogwqAgRmVsaXgKCgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRrZmQva2ZkX3RvcG9sb2d5LmMgfCAyMCArKysrKysrKysrKysrKystLS0tLQo+ICAgMSBmaWxl
IGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3RvcG9sb2d5LmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGtmZC9rZmRfdG9wb2xvZ3kuYwo+IGluZGV4IGJiNzdmN2FmMmI2ZC4uZGMz
YzQxNDlmODYwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF90
b3BvbG9neS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3RvcG9sb2d5
LmMKPiBAQCAtNjMyLDggKzYzMiwxMCBAQCBzdGF0aWMgaW50IGtmZF9idWlsZF9zeXNmc19ub2Rl
X2VudHJ5KHN0cnVjdCBrZmRfdG9wb2xvZ3lfZGV2aWNlICpkZXYsCj4gICAKPiAgIAlyZXQgPSBr
b2JqZWN0X2luaXRfYW5kX2FkZChkZXYtPmtvYmpfbm9kZSwgJm5vZGVfdHlwZSwKPiAgIAkJCXN5
c19wcm9wcy5rb2JqX25vZGVzLCAiJWQiLCBpZCk7Cj4gLQlpZiAocmV0IDwgMCkKPiArCWlmIChy
ZXQgPCAwKSB7Cj4gKwkJa29iamVjdF9wdXQoZGV2LT5rb2JqX25vZGUpOwo+ICAgCQlyZXR1cm4g
cmV0Owo+ICsJfQo+ICAgCj4gICAJZGV2LT5rb2JqX21lbSA9IGtvYmplY3RfY3JlYXRlX2FuZF9h
ZGQoIm1lbV9iYW5rcyIsIGRldi0+a29ial9ub2RlKTsKPiAgIAlpZiAoIWRldi0+a29ial9tZW0p
Cj4gQEAgLTY4MCw4ICs2ODIsMTAgQEAgc3RhdGljIGludCBrZmRfYnVpbGRfc3lzZnNfbm9kZV9l
bnRyeShzdHJ1Y3Qga2ZkX3RvcG9sb2d5X2RldmljZSAqZGV2LAo+ICAgCQkJcmV0dXJuIC1FTk9N
RU07Cj4gICAJCXJldCA9IGtvYmplY3RfaW5pdF9hbmRfYWRkKG1lbS0+a29iaiwgJm1lbV90eXBl
LAo+ICAgCQkJCWRldi0+a29ial9tZW0sICIlZCIsIGkpOwo+IC0JCWlmIChyZXQgPCAwKQo+ICsJ
CWlmIChyZXQgPCAwKSB7Cj4gKwkJCWtvYmplY3RfcHV0KG1lbS0+a29iaik7Cj4gICAJCQlyZXR1
cm4gcmV0Owo+ICsJCX0KPiAgIAo+ICAgCQltZW0tPmF0dHIubmFtZSA9ICJwcm9wZXJ0aWVzIjsK
PiAgIAkJbWVtLT5hdHRyLm1vZGUgPSBLRkRfU1lTRlNfRklMRV9NT0RFOwo+IEBAIC02OTksOCAr
NzAzLDEwIEBAIHN0YXRpYyBpbnQga2ZkX2J1aWxkX3N5c2ZzX25vZGVfZW50cnkoc3RydWN0IGtm
ZF90b3BvbG9neV9kZXZpY2UgKmRldiwKPiAgIAkJCXJldHVybiAtRU5PTUVNOwo+ICAgCQlyZXQg
PSBrb2JqZWN0X2luaXRfYW5kX2FkZChjYWNoZS0+a29iaiwgJmNhY2hlX3R5cGUsCj4gICAJCQkJ
ZGV2LT5rb2JqX2NhY2hlLCAiJWQiLCBpKTsKPiAtCQlpZiAocmV0IDwgMCkKPiArCQlpZiAocmV0
IDwgMCkgewo+ICsJCQlrb2JqZWN0X3B1dChjYWNoZS0+a29iaik7Cj4gICAJCQlyZXR1cm4gcmV0
Owo+ICsJCX0KPiAgIAo+ICAgCQljYWNoZS0+YXR0ci5uYW1lID0gInByb3BlcnRpZXMiOwo+ICAg
CQljYWNoZS0+YXR0ci5tb2RlID0gS0ZEX1NZU0ZTX0ZJTEVfTU9ERTsKPiBAQCAtNzE4LDggKzcy
NCwxMCBAQCBzdGF0aWMgaW50IGtmZF9idWlsZF9zeXNmc19ub2RlX2VudHJ5KHN0cnVjdCBrZmRf
dG9wb2xvZ3lfZGV2aWNlICpkZXYsCj4gICAJCQlyZXR1cm4gLUVOT01FTTsKPiAgIAkJcmV0ID0g
a29iamVjdF9pbml0X2FuZF9hZGQoaW9saW5rLT5rb2JqLCAmaW9saW5rX3R5cGUsCj4gICAJCQkJ
ZGV2LT5rb2JqX2lvbGluaywgIiVkIiwgaSk7Cj4gLQkJaWYgKHJldCA8IDApCj4gKwkJaWYgKHJl
dCA8IDApIHsKPiArCQkJa29iamVjdF9wdXQoaW9saW5rLT5rb2JqKTsKPiAgIAkJCXJldHVybiBy
ZXQ7Cj4gKwkJfQo+ICAgCj4gICAJCWlvbGluay0+YXR0ci5uYW1lID0gInByb3BlcnRpZXMiOwo+
ICAgCQlpb2xpbmstPmF0dHIubW9kZSA9IEtGRF9TWVNGU19GSUxFX01PREU7Cj4gQEAgLTc5OCw4
ICs4MDYsMTAgQEAgc3RhdGljIGludCBrZmRfdG9wb2xvZ3lfdXBkYXRlX3N5c2ZzKHZvaWQpCj4g
ICAJCXJldCA9IGtvYmplY3RfaW5pdF9hbmRfYWRkKHN5c19wcm9wcy5rb2JqX3RvcG9sb2d5LAo+
ICAgCQkJCSZzeXNwcm9wc190eXBlLCAgJmtmZF9kZXZpY2UtPmtvYmosCj4gICAJCQkJInRvcG9s
b2d5Iik7Cj4gLQkJaWYgKHJldCA8IDApCj4gKwkJaWYgKHJldCA8IDApIHsKPiArCQkJa29iamVj
dF9wdXQoc3lzX3Byb3BzLmtvYmpfdG9wb2xvZ3kpOwo+ICAgCQkJcmV0dXJuIHJldDsKPiArCQl9
Cj4gICAKPiAgIAkJc3lzX3Byb3BzLmtvYmpfbm9kZXMgPSBrb2JqZWN0X2NyZWF0ZV9hbmRfYWRk
KCJub2RlcyIsCj4gICAJCQkJc3lzX3Byb3BzLmtvYmpfdG9wb2xvZ3kpOwpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

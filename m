Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE943276F8F
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 13:11:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D716F6E1FB;
	Thu, 24 Sep 2020 11:11:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2051.outbound.protection.outlook.com [40.107.223.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 760946E1FB
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 11:11:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eok3cZOqYwvv0oUqYDQ0h8IZ8YZFH+fa8sqd6m48CGOPHMYRoKU7CwMgoVUbzU1WBj9aQI8DoqJf5be8kf+g8bO2ep/8l2FpMYh1jPPgvw6Lm/m41pPH2Fkq8Ui5D6Dy1PKCrGQ7KNU06Rt+KyjvltPIavgV2QA9c5XEYB7R/cBwJJOuMssu9emWMpn+gO9BFOaUfUVSjEk+Ga6FoNs58cSKok3DiWghUcl9DraEHE9XbVDoCD4VBydd9Q1My2Y0AFqZMLWECqdyrt3TofmD2T4FzYLMXmIqdbwoHJ+i7OC0INpGDStCbv9PGo/zK9OnxtPXjrj4/NIhlf/8ghMDRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VeuJdp0TFkIlzdDg5UOEWYr5H53Wyty12GJnAPhBG7U=;
 b=Qc2qAsK/gz4Xdixmhf4xavPy2vcSz8AvZd6Au9ybaKy5ZTaVyCEgLUpgSqqOnO3Uk3huYty9OYgd4Ec7+xBuufGeBMbGM8cMQdMnydkfQ4bh/tbiHmprssHftMNzGINHFI3msNsobMpF8XVQ+Tb4U/z1SZ9N1MBVaqne1DZEFPYBROzq6UmGGS20LAZOyTwS38CE3DMOvtHIDHQCKAE2DcaUBsgQOACQusUUEz2bCNYCzo64MH3MuoTXco8ha5EhyzW27fQAJcRoYCq2UWZymS0Fyai4vRsMEI+Fxj5Z0gCsS8r3tC2+kom/0BbPHsNnBcZpUN1BRpyo41qbQV9YoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VeuJdp0TFkIlzdDg5UOEWYr5H53Wyty12GJnAPhBG7U=;
 b=FMpsaP+2llu+YDilWkh1GcBvv9/2fYUGFfxMYDAKH2EhtVBQBqwRtlnQEoOx20fGgoGvQ3j+9Lr6EUBzkLQQ+snbQzm9gXtkmONDKfilbCEtvN0HPN1VRmmLzXfOnBaGSzeoj2L2NJoIYrtiIVyw8GN8RsgFjIz07mYtYmkae4o=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.21; Thu, 24 Sep
 2020 11:11:31 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3412.022; Thu, 24 Sep 2020
 11:11:31 +0000
Subject: Re: [PATCH 05/45] drm/nouveau/ttm: handle ttm moves properly.
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200924051845.397177-1-airlied@gmail.com>
 <20200924051845.397177-6-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <2f98f8b1-527a-32a2-99b9-b06ce9878e50@amd.com>
Date: Thu, 24 Sep 2020 13:11:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200924051845.397177-6-airlied@gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR05CA0075.eurprd05.prod.outlook.com
 (2603:10a6:208:136::15) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR05CA0075.eurprd05.prod.outlook.com (2603:10a6:208:136::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20 via Frontend
 Transport; Thu, 24 Sep 2020 11:11:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e2492103-5b09-4df4-5ff1-08d8607a96f9
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:
X-Microsoft-Antispam-PRVS: <BL0PR12MB2353649BF16D5A83D07AA9DC83390@BL0PR12MB2353.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ybyhy+YF3Wu6pBMPMbvtENHxwq2T8j89Mb/JTV/Sc/4378l9caS9l8c7RPd7YPHpVB0zCqy+jje7H1fXyxj2048p7RPS73fhXDhf+JtbymkOOYkq1zIi0qSsOhKtUFUx0uT9/Lf0GJqIt+wMerzQwrB/hdt6VI1Cs3mU+fB/W2vM36VaCnFjau236goKzDICTf/9Hq51D4YtO7AbvR13x526XmIJ9v+nSZ4bjUhO3uX87Kbe2h9wNxaSrNvqRVYvv9K5SZXmxr8a5E/6liYrTZHX9N7Qv+3LBmoj1oMWoKmJZZZ6UGbhjj2QPsofLdb/3zvXRZ+4PW2x4tq7mtyUb/kCFXcb7M439BUouTvOD40o3iBXqLt3ei9L9bQRspXC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(39860400002)(376002)(136003)(366004)(66556008)(66476007)(66946007)(31696002)(186003)(36756003)(16526019)(2906002)(6666004)(86362001)(31686004)(8936002)(478600001)(4326008)(6486002)(5660300002)(316002)(2616005)(52116002)(8676002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: KVSQtaPIbc0u3QrZH2WCPlm66ERWu26SlfVp6ZhGVyXfMwcGrUG15s4ewoIRqxRk8XyA+OjqWiZBs3dXO132aWmQUfmIc8ahoUDF9txaeZQSJNWiM521hp3g342axsRNgIj2fQPj5dUsMUg8e8dZG24PUom1G9/J0RVNmqO4eKJBZLLfAPCrN1h8SG74yDHwUsVMUIprCTZdqEvPhrbE/ylOuEnxc4btnfSEas18N+wDo5AQTFd4DEovah1dDBSVJ6ehyn6t5yzNIQZq+6mlONE9L+L2ITd8MqWM2ij7+Zlp0/NkaBXZhunR5i0Zf6H9MLMF0f7Yx94IKMXJYCPPkws0tHWQWY66Y6iDoraZzY3DlxvrJs16cI4QdfUPuTsfsUsq5tESB3SG4obEISvj7x8Gz9XPCYZBQCkDTpWh/dJQdLKhNqA/ge8pMyx85WM7RQAukz5+ySXTpi9zSbU/9/zKvrDQt5ToM8n915RFGCqER0MMGFdORc6tMwORF2COGOXRqD/rNSKHAxASdqJJsP9zMUfH7YyP+BEj7t5u3i9FKbc5RbEd0mn/jO98XAXmjH1h2kuPvSpMYnK7AeoOixx7Ffn6q4AkKzDfHQK5kKQdLXcFIW2lsEtYq0ZuCU4PxwIqpjqof5KCFT8q8miVFtnE5y6ymkKVctdV2/L0PP01CxDsYqu2dkSRcRvl8gviaPlEeEENdNcmpLn7iEiSLw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2492103-5b09-4df4-5ff1-08d8607a96f9
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2020 11:11:31.0136 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R4si7nbXrFEiR0wsRItth8rZCZXilCINwdptgwlytjuVWUVrLUa+IJAgrqpUGGLi
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
cmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+Cj4gVGhlIGlkZWEgaXMgdG8gZmxpcCB0aGUgY29y
ZSBvdmVyIHRvIGNhbGxpbmcgdGhlIGRyaXZlciBhbHdheXMsCj4gc28gYWRkIHN1cHBvcnQgZm9y
IG1vdmVzIGhlcmUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBEYXZlIEFpcmxpZSA8YWlybGllZEByZWRo
YXQuY29tPgoKQWNrZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1k
LmNvbT4KCj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMgfCAx
MiArKysrKysrKysrKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspCj4KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9iby5jIGIvZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9iby5jCj4gaW5kZXggOGQ1MWNmY2EwN2M4Li4yYzEw
YTg0YjJjYzAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9i
by5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9iby5jCj4gQEAgLTEw
NTcsNiArMTA1NywxOCBAQCBub3V2ZWF1X2JvX21vdmUoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0
ICpibywgYm9vbCBldmljdCwKPiAgIAkJZ290byBvdXQ7Cj4gICAJfQo+ICAgCj4gKwlpZiAob2xk
X3JlZy0+bWVtX3R5cGUgPT0gVFRNX1BMX1NZU1RFTSAmJgo+ICsJICAgIG5ld19yZWctPm1lbV90
eXBlID09IFRUTV9QTF9UVCkgewo+ICsJCXR0bV9ib19tb3ZlX251bGwoYm8sIG5ld19yZWcpOwo+
ICsJCWdvdG8gb3V0Owo+ICsJfQo+ICsKPiArCWlmIChvbGRfcmVnLT5tZW1fdHlwZSA9PSBUVE1f
UExfVFQgJiYKPiArCSAgICBuZXdfcmVnLT5tZW1fdHlwZSA9PSBUVE1fUExfU1lTVEVNKSB7Cj4g
KwkJcmV0ID0gdHRtX2JvX21vdmVfdHRtKGJvLCBjdHgsIG5ld19yZWcpOwo+ICsJCWdvdG8gb3V0
Owo+ICsJfQo+ICsKPiAgIAkvKiBIYXJkd2FyZSBhc3Npc3RlZCBjb3B5LiAqLwo+ICAgCWlmIChk
cm0tPnR0bS5tb3ZlKSB7Cj4gICAJCWlmIChuZXdfcmVnLT5tZW1fdHlwZSA9PSBUVE1fUExfU1lT
VEVNKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

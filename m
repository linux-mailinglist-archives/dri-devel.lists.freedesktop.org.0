Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0B52959F1
	for <lists+dri-devel@lfdr.de>; Thu, 22 Oct 2020 10:15:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4177D6F537;
	Thu, 22 Oct 2020 08:14:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2082.outbound.protection.outlook.com [40.107.94.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D9826F537
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Oct 2020 08:14:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d0eDQmXHCFH9EVstsy5S+Kgg+DThsA17P4FyB8U/ZGUFMUYO9S/5JY0Wdk+JTCQuHznksd6EozfOvBCsAJ28o4AKBWU8hBTHTLXhEzfNVoFcZuZpXBHfZubP1MvmFr415KXcLNQCMdpQYAmAMXcTnEPnu6ikjHcK6ze1k23Sd1xaXzwkz98sHqfYiBev1diFEXBbGXHjQ2J7Z0gkgVSCBStZqsnXOz5YjPh80gog3gNOoc3Afe8liQKx80l6qWlln05Ken8n88UNRD0pMLtWXmeQDQj+WMYCPg64Fw+FGyfMA+3qWolKnd7DFD494YqyNUNrLDimU7fab1ESgES1JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6UwV527Vrhu9H6R7/5bKDWEuwdCQ93xVwA6zo9h7IF0=;
 b=eHRS0+HLtyKa0zl+Bv6G1TcruRKBnWeTQoKoLN5W+4v/D4Lv675LWvq82rPR4dGJe5IH4H+pccKY3pCOIW4HWUopiwvUBq5linZiMl2c955EQu0hVaMKSNRzvpjrlHdZH2TnB/VIJBQuuvAbjI9MlV6iCBZpt1QCsoexIaGeEXRz/auZk9u/9swdQkEEJjAnLfZ7sNwLqqV4FBy031tXpsK3QOSp+F702tY/JOvwVK4o/7bwNrHeTGI3rXeGeq9K24ejsoplFiBjg4MTR/Td4IJgmXo9saBtwjRKyGSjLITj6+JeP7rHIjruRmXEG3KmL47+dQ74zrvc6PcW8JXKkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6UwV527Vrhu9H6R7/5bKDWEuwdCQ93xVwA6zo9h7IF0=;
 b=Uty15rG7fx/iPQxCm8BuGyxcFrc8RvtnDQvbjtlzYNkaeSikiHFlcfDeIGaMT2JkSFaDUoknNGWQXv2NPhM8sxlCUJ8Cxq541EKCD1zOMDG3JzMVOEY6q9YbAkH8UzqUg4d8EUlD0Eo/iHh+MMvmBZbn7thdGw0YEBQ/lSkzZgM=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4929.namprd12.prod.outlook.com (2603:10b6:208:1c4::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Thu, 22 Oct
 2020 08:14:55 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3477.028; Thu, 22 Oct 2020
 08:14:55 +0000
Subject: Re: [PATCH] drm/ttm: remove overlapping memcpy support
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20201022031152.1916925-1-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <3e60d0ae-da24-fd62-fad7-c96156f82d62@amd.com>
Date: Thu, 22 Oct 2020 10:14:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201022031152.1916925-1-airlied@gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR03CA0063.eurprd03.prod.outlook.com (2603:10a6:208::40)
 To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR03CA0063.eurprd03.prod.outlook.com (2603:10a6:208::40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.18 via Frontend Transport; Thu, 22 Oct 2020 08:14:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 41d1e4ec-0d6c-4236-ec12-08d876628f07
X-MS-TrafficTypeDiagnostic: BL0PR12MB4929:
X-Microsoft-Antispam-PRVS: <BL0PR12MB49290BCF5E0F089347347F44831D0@BL0PR12MB4929.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ns1KTt+IAMlmS/DIrfgClwR9PgpGbsyNWTfCfbz4ekvA93VeOTENaOq80DLC4xszYomfEWGHt/nJQFunXHjDXi/t6m5E3ji0p3mBV+M/6l8x/yEqw0W+9RR0IWxgvwqRu1/ybm7xWrhw17NPaZtVm2BBOOt8iaD3fc/Usuz0Sw8wRzAgwiuGoF1Q5yi1/A4PC+jpRwkcU+2owDEqUr2GhQa/5kYBePc9obIbTg7DLsYoN9XVpSeRXpBjPX6DF7b6e0YzqvXlkNr2zlNEBCwZ86IxcLMRIcvuau5zmGRvgdICAwGRskOQDN7vGBODO0QEqhLKw7vB8AZ3GIBePK8fFeZ9X7aT7GBkAvGzk/16ewvTPfHGgttu4jMmAPW76uJ9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(136003)(396003)(376002)(346002)(2906002)(66556008)(52116002)(66476007)(5660300002)(6666004)(83380400001)(86362001)(2616005)(478600001)(31686004)(66946007)(6486002)(316002)(8676002)(186003)(16526019)(31696002)(36756003)(8936002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: hUk1pNiaMNb8HaQCkuw7w8etp8JHKFULNg8RCdZN1TQai9h+fspFQVWYgX5SEdO5r/2HD6f0MO+3f9dVEkIfs0oiHCQZRvgjoPTFG9smnwT147N6vWPUWvWk6rD8NNLLa7HK1LTWSnFWlhodE/7xtU303dTCUFljRqSu99tf3onLcf5Xak8CojdgbWPaZQC1ZunU3aBRnmVUx4SoJN1NkAs3PJM5kXuc26qL6w1BjtUvRs6+EILR+LxuvvyH0yRAsPPHf5RmzZ3wQ2/EBXxO7EWsnK4Ydp4JLlkYRDKAJqdTdhSSPzWxDe4UogYlDhL0wuTKtWkcmsZ4oDXDeFQd/D7zNyqdkr/vaGqL46jY5cW0FSgwhMXvfQ1g5449x78N+G6+fKkmy8ydMf+5akz8kWx7KsKOoAAj/E88PkuAXT1ZHrY1SPPBkiLCNnA2oAbCrtXYRFerxvNwbztfR9DxZwyhRMNROLQObxe/Km5U8PBQd0QQv9fSXFJfxazvXdnAgIqqw/K28N5lm6LX5oiYysE8aCHZ/COprObFZENSQuDDGNZheDgCJJGe6tV7zElhKngBFzUU6qHJWNHe7pQIjc2tK5qEPOrQBS73+R1L5uiPzCYtmC2cDgHacqe43aymzCdyXqxeAcajzw1pD0lwcc2f8cc6/SgyKlyCjbpQJzjAlduPYVHxsY4vZYXGfDVxA5+MPol+tOdJVzH+rQ7jjg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41d1e4ec-0d6c-4236-ec12-08d876628f07
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2020 08:14:55.4756 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3zFwbiApgetEcZeAxWAIuGYJjeBKNwVw3dT3BX4pEN8yCPwR7YS3DyLirw8KYhZW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4929
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjIuMTAuMjAgdW0gMDU6MTEgc2NocmllYiBEYXZlIEFpcmxpZToKPiBGcm9tOiBEYXZlIEFp
cmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+Cj4gcmVtb3ZlIHRoZSBvdmVybGFwcGluZyBtZW1j
cCBzdXBwb3J0IGFzIGl0J3MgbmV2ZXIgdXNlZC4KPgo+IFNpZ25lZC1vZmYtYnk6IERhdmUgQWly
bGllIDxhaXJsaWVkQHJlZGhhdC5jb20+CgpSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8
Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgoKPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS90dG0v
dHRtX2JvX3V0aWwuYyB8IDE5ICsrKy0tLS0tLS0tLS0tLS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2Vk
LCAzIGluc2VydGlvbnMoKyksIDE2IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS90dG0vdHRtX2JvX3V0aWwuYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2Jv
X3V0aWwuYwo+IGluZGV4IDBhNTY5NGVmMWUwNy4uZWNiNTQ0MTVkMWNhIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3V0aWwuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS90dG0vdHRtX2JvX3V0aWwuYwo+IEBAIC0xODAsOSArMTgwLDYgQEAgaW50IHR0bV9ib19tb3Zl
X21lbWNweShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAo+ICAgCXZvaWQgKm5ld19pb21h
cDsKPiAgIAlpbnQgcmV0Owo+ICAgCXVuc2lnbmVkIGxvbmcgaTsKPiAtCXVuc2lnbmVkIGxvbmcg
cGFnZTsKPiAtCXVuc2lnbmVkIGxvbmcgYWRkID0gMDsKPiAtCWludCBkaXI7Cj4gICAKPiAgIAly
ZXQgPSB0dG1fYm9fd2FpdF9jdHgoYm8sIGN0eCk7Cj4gICAJaWYgKHJldCkKPiBAQCAtMjIwLDI3
ICsyMTcsMTcgQEAgaW50IHR0bV9ib19tb3ZlX21lbWNweShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmpl
Y3QgKmJvLAo+ICAgCQkJZ290byBvdXQxOwo+ICAgCX0KPiAgIAo+IC0JYWRkID0gMDsKPiAtCWRp
ciA9IDE7Cj4gLQo+IC0JaWYgKChvbGRfbWVtLT5tZW1fdHlwZSA9PSBuZXdfbWVtLT5tZW1fdHlw
ZSkgJiYKPiAtCSAgICAobmV3X21lbS0+c3RhcnQgPCBvbGRfbWVtLT5zdGFydCArIG9sZF9tZW0t
PnNpemUpKSB7Cj4gLQkJZGlyID0gLTE7Cj4gLQkJYWRkID0gbmV3X21lbS0+bnVtX3BhZ2VzIC0g
MTsKPiAtCX0KPiAtCj4gICAJZm9yIChpID0gMDsgaSA8IG5ld19tZW0tPm51bV9wYWdlczsgKytp
KSB7Cj4gLQkJcGFnZSA9IGkgKiBkaXIgKyBhZGQ7Cj4gICAJCWlmIChvbGRfaW9tYXAgPT0gTlVM
TCkgewo+ICAgCQkJcGdwcm90X3QgcHJvdCA9IHR0bV9pb19wcm90KGJvLCBvbGRfbWVtLCBQQUdF
X0tFUk5FTCk7Cj4gLQkJCXJldCA9IHR0bV9jb3B5X3R0bV9pb19wYWdlKHR0bSwgbmV3X2lvbWFw
LCBwYWdlLAo+ICsJCQlyZXQgPSB0dG1fY29weV90dG1faW9fcGFnZSh0dG0sIG5ld19pb21hcCwg
aSwKPiAgIAkJCQkJCSAgIHByb3QpOwo+ICAgCQl9IGVsc2UgaWYgKG5ld19pb21hcCA9PSBOVUxM
KSB7Cj4gICAJCQlwZ3Byb3RfdCBwcm90ID0gdHRtX2lvX3Byb3QoYm8sIG5ld19tZW0sIFBBR0Vf
S0VSTkVMKTsKPiAtCQkJcmV0ID0gdHRtX2NvcHlfaW9fdHRtX3BhZ2UodHRtLCBvbGRfaW9tYXAs
IHBhZ2UsCj4gKwkJCXJldCA9IHR0bV9jb3B5X2lvX3R0bV9wYWdlKHR0bSwgb2xkX2lvbWFwLCBp
LAo+ICAgCQkJCQkJICAgcHJvdCk7Cj4gICAJCX0gZWxzZSB7Cj4gLQkJCXJldCA9IHR0bV9jb3B5
X2lvX3BhZ2UobmV3X2lvbWFwLCBvbGRfaW9tYXAsIHBhZ2UpOwo+ICsJCQlyZXQgPSB0dG1fY29w
eV9pb19wYWdlKG5ld19pb21hcCwgb2xkX2lvbWFwLCBpKTsKPiAgIAkJfQo+ICAgCQlpZiAocmV0
KQo+ICAgCQkJZ290byBvdXQxOwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==

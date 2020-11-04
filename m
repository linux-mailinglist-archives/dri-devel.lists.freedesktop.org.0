Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 259502A6E6F
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 21:01:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02BEE6E1DE;
	Wed,  4 Nov 2020 20:01:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062.outbound.protection.outlook.com [40.107.244.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50D4F6E1DE;
 Wed,  4 Nov 2020 20:01:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W//rMV3xEIfylgw3YuG6H5NjKaXvYRu283cHFguibZv7EHi18UwJTO7gC73hbLBn1INguTUvrRTAhJKa+HzL02lKmWBWhREyWpxiddDZ+8jVHXVrwyCl8XmT5KwBVJOuu3DQ38DzdXzXOaymUnryQlhXVFGaymmeP39GsyqWs2ggYsAViEq0JknJFpeGnK+exjUWJ8eva3yD/wFq8x17iisahyA/57w24N3/LXnlDJRuedg7vWZDRFKiz0gycQHaZNLhGwZNET08SvxdPlSq5UCFhYfaYRkmN4aH20BLYZNVIG5PeE8pU2F3XjUtu6x3azjondRlva+i+eC6EisiSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4BeO/g2d2dsKbgp4a7ffnEyxGjaYJRjlPwHOCGkvVxM=;
 b=GhUmTCp4eq8OJ37zQklMMr4QqUcqr6a0cO+AfYZF5eW5/rA5jDzFso9sfhyoE3pz9PAioLwvHN3JoSsAyw3QoQ12X4MRQEYEwftxHV4hXED9J1AzBWTLGxiOUCKQoATPf/OSj9Nm9iGFxTu6nCXbza4fhu8jjEZLdxZZxtu9cy722M8GsaTSvWdPo0LFy7VS5X6mLY58eBDmLwZN6Pp8DZniW7dZNuwoHiEIrmv6xPAzOf+3LvLW54xfe9g89dI8XByBFMs/KcXDT7PrzSr71j+N1prVjKehO7EUoJrknxqzCsnzC8IxVEmoTUiHJWQVdp4XgmhjDBx7p07ImI8kjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4BeO/g2d2dsKbgp4a7ffnEyxGjaYJRjlPwHOCGkvVxM=;
 b=G9VORrLSNpv7bGmlz9GF8A4lolNVDyRRzwkd2Vcu/yjx0fserA907Tsyq+MFjO2a8LVUkAtmsVQwL7Z9p7+OtISQMYQ7zABKU4QZsnUCaE6uzYWnGBjAbmhWYc6s54sDEqbQT0zmcpHgBIL/gvsbbe5nW/N3ZW9pZfrG6KK18/g=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB3792.namprd12.prod.outlook.com (2603:10b6:208:16e::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Wed, 4 Nov
 2020 20:01:19 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::b07d:ede5:2f45:5de8]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::b07d:ede5:2f45:5de8%9]) with mapi id 15.20.3499.032; Wed, 4 Nov 2020
 20:01:19 +0000
Subject: Re: [PATCH] drm/amdkfd: replace idr_init() by idr_init_base()
To: Deepak R Varma <mh12gx2825@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20201104151359.GA69034@localhost>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
Message-ID: <91ebae30-c75c-5485-8de5-36464e97ed7e@amd.com>
Date: Wed, 4 Nov 2020 15:01:17 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201104151359.GA69034@localhost>
Content-Language: en-US
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YTXPR0101CA0008.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::21) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.27.226.80] (165.204.55.251) by
 YTXPR0101CA0008.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.18 via Frontend Transport; Wed, 4 Nov 2020 20:01:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: efe50ebd-f241-43e1-4355-08d880fc6549
X-MS-TrafficTypeDiagnostic: MN2PR12MB3792:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB37922588A7CB655C8F57926192EF0@MN2PR12MB3792.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:332;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pA4ZJjxO2fROYYg9bI1Vsi3bvJUdsZFp5k5j6QPHEYVlXWoZvrxngdv6k+X744/6b6xVc/NXd9COhNZGLaK/d9kZHQbq8r5AM5ixHX9K82GDswqEeY6ppMlWqsUpuETtbRZ5wVbRxwqo7o3QfCzp3zUiJVfSi4wV0S6AYXg1Q9YoaYf1LjpJi2q+fAHC5f5DR0emN46pYA3Maq6+1akgDTC4n2mu0PBvBs6wHrXEmzBRqUk659WxcYnAUXy30dZRGg8NnXZOKF5yCvfBe7u4yIlR80D57qmljtQIf7PZQ1j2SQwm46xJI/3miNW30lIHL2uD3rQPdzd3NTid4B5mJg/2ekKQIC3XuiSqL1sp2R3nvw1YY0IIcQ9GbxF/fYI8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(376002)(366004)(346002)(39860400002)(52116002)(16576012)(110136005)(36916002)(2616005)(956004)(66946007)(36756003)(66476007)(66556008)(316002)(8936002)(6486002)(31696002)(83380400001)(53546011)(86362001)(186003)(8676002)(478600001)(44832011)(2906002)(31686004)(16526019)(26005)(5660300002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: zbVlu4C4JMDFkMktNrB2IyPXxSVQj6MPmtYCu/BsEDY7z4e8kt7HUeEJRKMVam5XGGzCvqDRoUSsfVWAsSkAuBskOkfAU167kzICafO70+lORTECLyKnraXkBhnt38iYTJXhXn2R6nDsko+uf15q9rdvpDbYl6SYuYRXZSErLCDcxL3V4fkKNQdsHs1NMln/YGPLaR1YtfMxSZNlj4IQ3rmRCphtreThO48Zi0x/A81b8T3Qnzdx9M29yEX8FbuVs6tRot/rEuy1uCrDWESSkxvjIgmQsWspynFE68xboSn12oamcjNes1SVF9Jd7ewZPgWWdlZs8fECSaAER0dgZpqx/6u/ecMRILBi+HdKwTXz6Igd3h6ORPcMMzUW4Q+bDUdtQKWk8RgJLkJzVDIyDKX7KyWJ3A1Lcqj35sYUDoPUmooLzC+jKllBfbWVyb7jRq/52w7b0cgFtb6Wr8vW2TZbBrnj36li9SU5DLY6JyUQyTnEoiqAF7oGdOfqlgwlRmN4xgjeYHUH4kIJXAdc/T4V+V2XDn8Nb0hydR/a7+oZxx1FmD3g+vh7E4RrOzjAF4rl5wFY9qwVdv4yeNZJOXFSUUT6gyBJnkiU0NrX9IpjLqKo7cxKbm1+BmW14rXi5KyCpPobaujTyAN6mYvQCQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efe50ebd-f241-43e1-4355-08d880fc6549
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2020 20:01:19.4051 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lvjlxftwG0BNedu8vUE/iZM0Ta6BCQcb1PjSNRtqAJW6IofFTKeh5OUQ3UF9+vGeXScuohOrCXtcLs1eiLdPQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3792
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

T24gMjAyMC0xMS0wNCAxMDoxMyBhLm0uLCBEZWVwYWsgUiBWYXJtYSB3cm90ZToKPiBpZHJfaW5p
dCgpIHVzZXMgYmFzZSAwIHdoaWNoIGlzIGFuIGludmFsaWQgaWRlbnRpZmllci4gVGhlIG5ldyBm
dW5jdGlvbgo+IGlkcl9pbml0X2Jhc2UgYWxsb3dzIElEUiB0byBzZXQgdGhlIElEIGxvb2t1cCBm
cm9tIGJhc2UgMS4gVGhpcyBhdm9pZHMKPiBhbGwgbG9va3VwcyB0aGF0IG90aGVyd2lzZSBzdGFy
dHMgZnJvbSAwIHNpbmNlIDAgaXMgYWx3YXlzIHVudXNlZC4KCkkgZGlzYWdyZWUuIFdlIGNhbGwg
aWRyX2FsbG9jIHdpdGggc3RhcnQ9MCBmb3IgYm90aCB0aGVzZSBJRFJzLiBUaGF0IAptZWFucyAw
IHNlZW1zIHRvIGJlIGEgdmFsaWQgaGFuZGxlLgoKUmVnYXJkcywKIMKgIEZlbGl4CgoKPgo+IFJl
ZmVyZW5jZXM6IGNvbW1pdCA2Y2U3MTFmMjc1MDAgKCJpZHI6IE1ha2UgMS1iYXNlZCBJRFJzIG1v
cmUgZWZmaWNpZW50IikKPgo+IFNpZ25lZC1vZmYtYnk6IERlZXBhayBSIFZhcm1hIDxtaDEyZ3gy
ODI1QGdtYWlsLmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9l
dmVudHMuYyAgfCAyICstCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJvY2Vz
cy5jIHwgMiArLQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2V2
ZW50cy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2V2ZW50cy5jCj4gaW5kZXgg
YmEyYzJjZTBjNTVhLi5iMzMzOWI1M2M4YWQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRrZmQva2ZkX2V2ZW50cy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRr
ZmQva2ZkX2V2ZW50cy5jCj4gQEAgLTIzMCw3ICsyMzAsNyBAQCBzdGF0aWMgaW50IGNyZWF0ZV9v
dGhlcl9ldmVudChzdHJ1Y3Qga2ZkX3Byb2Nlc3MgKnAsIHN0cnVjdCBrZmRfZXZlbnQgKmV2KQo+
ICAgdm9pZCBrZmRfZXZlbnRfaW5pdF9wcm9jZXNzKHN0cnVjdCBrZmRfcHJvY2VzcyAqcCkKPiAg
IHsKPiAgIAltdXRleF9pbml0KCZwLT5ldmVudF9tdXRleCk7Cj4gLQlpZHJfaW5pdCgmcC0+ZXZl
bnRfaWRyKTsKPiArCWlkcl9pbml0X2Jhc2UoJnAtPmV2ZW50X2lkciwgMSk7Cj4gICAJcC0+c2ln
bmFsX3BhZ2UgPSBOVUxMOwo+ICAgCXAtPnNpZ25hbF9ldmVudF9jb3VudCA9IDA7Cj4gICB9Cj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcm9jZXNzLmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJvY2Vzcy5jCj4gaW5kZXggNjU4MDNlMTUz
YTIyLi4wMjJlNjFiYWJlMzAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRr
ZmQva2ZkX3Byb2Nlc3MuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9w
cm9jZXNzLmMKPiBAQCAtMTI4OSw3ICsxMjg5LDcgQEAgc3RydWN0IGtmZF9wcm9jZXNzX2Rldmlj
ZSAqa2ZkX2NyZWF0ZV9wcm9jZXNzX2RldmljZV9kYXRhKHN0cnVjdCBrZmRfZGV2ICpkZXYsCj4g
ICAJbGlzdF9hZGQoJnBkZC0+cGVyX2RldmljZV9saXN0LCAmcC0+cGVyX2RldmljZV9kYXRhKTsK
PiAgIAo+ICAgCS8qIEluaXQgaWRyIHVzZWQgZm9yIG1lbW9yeSBoYW5kbGUgdHJhbnNsYXRpb24g
Ki8KPiAtCWlkcl9pbml0KCZwZGQtPmFsbG9jX2lkcik7Cj4gKwlpZHJfaW5pdF9iYXNlKCZwZGQt
PmFsbG9jX2lkciwgMSk7Cj4gICAKPiAgIAlyZXR1cm4gcGRkOwo+ICAgCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=

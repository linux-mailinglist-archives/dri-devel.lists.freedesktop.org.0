Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E277209EC3
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jun 2020 14:43:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D0FC6EBC4;
	Thu, 25 Jun 2020 12:43:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2067.outbound.protection.outlook.com [40.107.94.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99B7F6E2BE;
 Thu, 25 Jun 2020 12:43:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sg2dnE0hIBgszL8JZUeFqWm+W9OePx1WXXl/EAdrRZS0/r1/VLXO+jJpB2YzLVZ/nhQ2Q3qx1YrusxLf4p2sIWtChRzIeiGHoEWqJx0Wo4/p701wx87FQoQTzLw0oVaixVHQ4YTx9w7dmJTESazcaRHpIJS5JdN47t6bxhOMJWPjsWLJKqMSp7UkI+z/MsO/nzyZsp3KkM2zharc/dPc2fQWS8zIUIWbNhlrFhfWr3J+gWMk+hm/QzxpL8QbMn1cHjdo+M1Fpqlz6Z5hBO6tofpopgfFxw8IJpr08OCObxYKP/x/Qt9Dcw8b951xz/9E9McJr2hCEUUa0ABTQa0Nhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7IsrMOfRMgNPzDrmv8liVuELkj5eNcrvgrTYHNNA3oo=;
 b=X9U7H776ZZmRYoKPAmiw/u1RzL2UBQ3L8EYs027Ir/a8fwNmJuBI4xwKqo3DtJkv2g8s5LH1nsPJKq6HwG3gJr2FbaP+3+lp1yhmPcv9kLpr2fetcCgOJ0xP/UkQNYUgn+yUq2NZ0T9Zcl9eiXDZhRKy+2d1Cb+q1rA9zLXtPu9nvWJEDq3k9bUSC8Rytg7F4GTTQNh/V0MzD+lPkSk6efKyNObeiOZbJH5uCbrGyi7vvhN0vXrMrK3us0fMTY9cEhz1lelV/kW2VVB7MXnBRN9QbF+cSE4NIrvdW0xjx1hKlD5VaeOIq4R/IRUwpEeMrSAHh4PbimrVXa2SAU+lHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7IsrMOfRMgNPzDrmv8liVuELkj5eNcrvgrTYHNNA3oo=;
 b=WpPUZyQY0MM1p300xqC4nwT3lhIfCOVSR78+2yiKgkrwGThGQSUxMVzLim6+Y4W0b4E0TFLz8uds5PDUI07PZ42m0p3Lv5RIDfPrPjCOL5qMBYGwLxc+NQ86Of8Iqbjz8qAJ8mgS8xkPkli6oMYyRWeHt4qTf4SNbXslEM2Sbjg=
Authentication-Results: chris-wilson.co.uk; dkim=none (message not signed)
 header.d=none; chris-wilson.co.uk; dmarc=none action=none header.from=amd.com; 
Received: from DM6PR12MB4401.namprd12.prod.outlook.com (2603:10b6:5:2a9::15)
 by DM6PR12MB2745.namprd12.prod.outlook.com (2603:10b6:5:45::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21; Thu, 25 Jun
 2020 12:43:47 +0000
Received: from DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::a045:f8c0:8edb:1ef1]) by DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::a045:f8c0:8edb:1ef1%9]) with mapi id 15.20.3131.020; Thu, 25 Jun 2020
 12:43:47 +0000
Subject: Re: [PATCH 1/2] Revert "dma-buf: Report signaled links inside
 dma-fence-chain"
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 dri-devel@lists.freedesktop.org
References: <20200625123443.19680-1-lionel.g.landwerlin@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <51e00eed-c8f1-aabf-ec2c-07be0453ab3b@amd.com>
Date: Thu, 25 Jun 2020 14:43:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20200625123443.19680-1-lionel.g.landwerlin@intel.com>
Content-Language: en-US
X-ClientProxiedBy: AM3PR07CA0078.eurprd07.prod.outlook.com
 (2603:10a6:207:6::12) To DM6PR12MB4401.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM3PR07CA0078.eurprd07.prod.outlook.com (2603:10a6:207:6::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3153.10 via Frontend Transport; Thu, 25 Jun 2020 12:43:46 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c97ceea2-6033-4c0e-4fc5-08d81905673a
X-MS-TrafficTypeDiagnostic: DM6PR12MB2745:
X-Microsoft-Antispam-PRVS: <DM6PR12MB274505DBC1533E8339BACC5383920@DM6PR12MB2745.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-Forefront-PRVS: 0445A82F82
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2ELGDQpcboMv0LRj4pmsaCCrAkbjByiERkb7LM+DDpBR7nCttC3V9cNpzjjZDEUtJ4XghaTrbj2NVGMNltvVivGLhJsnpIL96Z0DLfEepEQIt59zbQNN3uNqA03RSIcD92qMJ9FpaYGigAliaWKFfZUBqaY13odiIMIrxbhRq/0/kenDda0mZ/eQb6kUqri/TQ1eG09ikqgqZvug6m8PTjHSiI9V+AzJcrG2LBWZy0wMYIeWGynUCHOUhcft1/w/PlpsHk3XoWff56LjURx1HDSld6kD2aTVAjsrhg3Xn1jIrs/KWbHEvGhGuqEyxb8ArZgBrDuItYqapOYeMNdmtn2JmkR+yYodpKMb7y7eUOHv4JT81JzdVaNaX9hgHKc0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4401.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(136003)(366004)(346002)(376002)(396003)(2616005)(6486002)(186003)(52116002)(16526019)(316002)(66946007)(66556008)(66476007)(2906002)(4326008)(36756003)(5660300002)(31686004)(478600001)(6666004)(83380400001)(86362001)(31696002)(8936002)(8676002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 0H51HZp4VCh8yi4q8u4w1SOy3gTFjUAHDzd4uSwNo8ShZGPynBD5niN1N9YS4MmukRvkLHmc00Izf6jHOPPLsLM4ZmOV4pHYWFv1X3Cv6WljP0+WZrWBxWsOFpBb+PLR0HT0S5O075AD+Z13XffIGbIOXEFu9OTOEEIhWwXnt+Pr4ZRIA7a/FepwKvrTVnZWTfzrgd6tjZILlZOhxPP+xwcpocXG5cA0zRLrnQPhi4zLN0zNh9oq3dmls0GVzjGo37gGJl4aZ1+ekP1eAaAn0dUuuUBgGGpvZXoRCg9dYnJrCn7wb5diRJxk4VRSLeqbR/bfpU2/kXyV6tGBIscifL/mh9n02pOHH0wYnrLS+vV5YjsWV9WzYdLHKwTwhol/suAsamW2SDhnxREDfW2FCxLY1d1lisRTm3EnKAP/bPp0L7o2x34a4heSciw1Bs8RJAeyiC27I9VNURtfBqCPULrETmckf+XEQkE1QQ3rUbvC+JFn+AnBzDq8pVJX4k/Fw6iA7lcKCrYoqz4gZWbF4wXhk+B/vyujSFTTXUhihLMlrNnfzuBHsSZLsBCHk7Qu
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c97ceea2-6033-4c0e-4fc5-08d81905673a
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4401.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2020 12:43:47.3477 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M4Qlh/DTBIs/hMWRVy2ZWtIGjDmaU9bJwk190n9lUBaJ6zmuIFtJlK0x+jW8C+cr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2745
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
Cc: intel-gfx@lists.freedesktop.org, chris@chris-wilson.co.uk
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjUuMDYuMjAgdW0gMTQ6MzQgc2NocmllYiBMaW9uZWwgTGFuZHdlcmxpbjoKPiBUaGlzIHJl
dmVydHMgY29tbWl0IDVkZTM3NmJiNDM0ZjgwYTEzMTM4ZjBlYmVkYzgzNTFhYjczZDhiMGQuCj4K
PiBUaGlzIGNoYW5nZSBicmVha3Mgc3luY2hyb25pemF0aW9uIG9mIGEgdGltZWxpbmUuCj4gZG1h
X2ZlbmNlX2NoYWluX2ZpbmRfc2Vxbm8oKSBtaWdodCBiZSBhIGJpdCBvZiBhIGNvbmZ1c2luZyBu
YW1lIGJ1dAo+IHRoaXMgZnVuY3Rpb24gaXMgbm90IHRyeWluZyB0byBmaW5kIGEgcGFydGljdWxh
ciBzZXFubywgaXMgc3VwcG9zZWQgdG8KPiBnaXZlIGEgZmVuY2UgdG8gd2FpdCBvbiBmb3IgYSBw
YXJ0aWN1bGFyIHBvaW50IGluIHRoZSB0aW1lbGluZS4KPgo+IEluIGEgdGltZWxpbmUsIGEgcGFy
dGljdWxhciB2YWx1ZSBpcyByZWFjaGVkIHdoZW4gYWxsIHRoZSBwb2ludHMgdXAgdG8KPiBhbmQg
aW5jbHVkaW5nIHRoYXQgdmFsdWUgaGF2ZSBzaWduYWxlZC4KPgo+IFNpZ25lZC1vZmYtYnk6IExp
b25lbCBMYW5kd2VybGluIDxsaW9uZWwuZy5sYW5kd2VybGluQGludGVsLmNvbT4KClJldmlld2Vk
LWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cgo+IC0tLQo+
ICAgZHJpdmVycy9kbWEtYnVmL2RtYS1mZW5jZS1jaGFpbi5jIHwgNyAtLS0tLS0tCj4gICAxIGZp
bGUgY2hhbmdlZCwgNyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2RtYS1i
dWYvZG1hLWZlbmNlLWNoYWluLmMgYi9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLWNoYWluLmMK
PiBpbmRleCBjNDM1YmJiYTg1MWMuLjNkMTIzNTAyZmYxMiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L2RtYS1idWYvZG1hLWZlbmNlLWNoYWluLmMKPiArKysgYi9kcml2ZXJzL2RtYS1idWYvZG1hLWZl
bmNlLWNoYWluLmMKPiBAQCAtOTksMTIgKzk5LDYgQEAgaW50IGRtYV9mZW5jZV9jaGFpbl9maW5k
X3NlcW5vKHN0cnVjdCBkbWFfZmVuY2UgKipwZmVuY2UsIHVpbnQ2NF90IHNlcW5vKQo+ICAgCQly
ZXR1cm4gLUVJTlZBTDsKPiAgIAo+ICAgCWRtYV9mZW5jZV9jaGFpbl9mb3JfZWFjaCgqcGZlbmNl
LCAmY2hhaW4tPmJhc2UpIHsKPiAtCQlpZiAoKCpwZmVuY2UpLT5zZXFubyA8IHNlcW5vKSB7IC8q
IGFscmVhZHkgc2lnbmFsZWQgKi8KPiAtCQkJZG1hX2ZlbmNlX3B1dCgqcGZlbmNlKTsKPiAtCQkJ
KnBmZW5jZSA9IE5VTEw7Cj4gLQkJCWJyZWFrOwo+IC0JCX0KPiAtCj4gICAJCWlmICgoKnBmZW5j
ZSktPmNvbnRleHQgIT0gY2hhaW4tPmJhc2UuY29udGV4dCB8fAo+ICAgCQkgICAgdG9fZG1hX2Zl
bmNlX2NoYWluKCpwZmVuY2UpLT5wcmV2X3NlcW5vIDwgc2Vxbm8pCj4gICAJCQlicmVhazsKPiBA
QCAtMjI4LDcgKzIyMiw2IEBAIEVYUE9SVF9TWU1CT0woZG1hX2ZlbmNlX2NoYWluX29wcyk7Cj4g
ICAgKiBAY2hhaW46IHRoZSBjaGFpbiBub2RlIHRvIGluaXRpYWxpemUKPiAgICAqIEBwcmV2OiB0
aGUgcHJldmlvdXMgZmVuY2UKPiAgICAqIEBmZW5jZTogdGhlIGN1cnJlbnQgZmVuY2UKPiAtICog
QHNlcW5vOiB0aGUgc2VxdWVuY2UgbnVtYmVyIChzeW5jcHQpIG9mIHRoZSBmZW5jZSB3aXRoaW4g
dGhlIGNoYWluCj4gICAgKgo+ICAgICogSW5pdGlhbGl6ZSBhIG5ldyBjaGFpbiBub2RlIGFuZCBl
aXRoZXIgc3RhcnQgYSBuZXcgY2hhaW4gb3IgYWRkIHRoZSBub2RlIHRvCj4gICAgKiB0aGUgZXhp
c3RpbmcgY2hhaW4gb2YgdGhlIHByZXZpb3VzIGZlbmNlLgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

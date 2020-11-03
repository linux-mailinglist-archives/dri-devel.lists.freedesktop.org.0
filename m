Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C812A3E2A
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 08:57:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 744936E856;
	Tue,  3 Nov 2020 07:57:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2084.outbound.protection.outlook.com [40.107.102.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D49636E84E
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 07:57:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X+lHH4t5qmI9MeFcPhusKfcCbaH9m4AXhPh8K+fxphFdKY9zwD1d5DJ2Kns+nzVCPWiOW5gQ8Cb9vufseMPZbAq++ijtFLmflCukHYTK+tMoAhpsX2ccHpw3EB4CvcQRJFxC7cTOdPe+q+Seosg+Q3j0YmF/LFY8ptzklWSPXveKtwF7muAQ0gIcznxBD4K+k83fhN/odWeJiyjPHtVuu1WkfTU3QCgvmIXvSttrJ3RzN/AWOv8gOVyBJ2bDbbUJ3YoB2Glt22+/yIhDRg4lYhP+Uws2LNf4NDkYf1Zy/ApShuLkPv5rmrRiFmOmnNaxqrhlVb8zWhrvQgTbfCedVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F80JcsvPpHN5dwo7nEL3rbuUF3RfCtyEQo6vHs1h0cc=;
 b=UlR/LTNp3k8yKvOfK53tEgSjgVLOX0cbP0H2H7hk4AimxsPqbBrVaFsYkT3lcn0Q89Xxu1w0bS0lGB8sCyYRfHvZbyTztDprTwP9rYNAukN3RbdrPpWckzjFc/9Z6af836FAYDuZgEY2rI+0LbDIZUxgoLxOngzhTMMlFrjh/o+70iepl/QGZuc0uuyXoTgxRG7S1YKzteRqjDK97mXQ71FjL7MNo28Eh2SDyLFx4mRBYfVCv/aP0xEB7TGByUY69KTuR9Wbj/7JRMhQ6xhX/8lrnxxhq9Bc5Nztt20sylRiFHfQpOcjG1dzCBqY3QhcBxyAWc7ZbwMJumaujXFy/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F80JcsvPpHN5dwo7nEL3rbuUF3RfCtyEQo6vHs1h0cc=;
 b=bi8e1LErU9ZevG8NMLXW30+Aww9gFJ2cLCzWFK1wDNf2ZaslvaYzxwEFFvP557e8HWeA1syRoAbcoDoJaKw8yNJmozwbui5Nh2Wbm0BjsxtYZBexnGmJ5nPp6CFTIpFCGSQMwLC/xfAlkYpb6tagIGVPzSFocwXx6kIb1C6CQ5o=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4222.namprd12.prod.outlook.com (2603:10b6:208:19a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Tue, 3 Nov
 2020 07:57:20 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31%7]) with mapi id 15.20.3499.030; Tue, 3 Nov 2020
 07:57:20 +0000
Subject: Re: [PATCH] dma-buf: Fix static checker warning
To: Jianxin Xiong <jianxin.xiong@intel.com>, dri-devel@lists.freedesktop.org
References: <1604375518-145511-1-git-send-email-jianxin.xiong@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <e44d5574-904c-b8c3-51b1-8f967e6a92fe@amd.com>
Date: Tue, 3 Nov 2020 08:57:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <1604375518-145511-1-git-send-email-jianxin.xiong@intel.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM9P192CA0023.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:21d::28) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM9P192CA0023.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:21d::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.19 via Frontend Transport; Tue, 3 Nov 2020 07:57:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 471006e9-bb6d-40f8-3b06-08d87fce170a
X-MS-TrafficTypeDiagnostic: MN2PR12MB4222:
X-Microsoft-Antispam-PRVS: <MN2PR12MB422266EE674B0A326823CA2B83110@MN2PR12MB4222.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:131;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dWdqQaikcLIt36Ar2RxmtWPT87ZPO6rl1C1CJBsIxmJ3ZoI8ps23tKrT38IuKpVsYS3losKRVY2gLsVz4HD5wSyrlEJNUQYFkhQdNFwPulA+TmO3ZmMLNr77yU8ZjqiMo+k6/usGGmaTiNBlcvKaw6gHz+9035IAc2EhA27PxuvP3AMBt98wxefBOZzl+7J7j1s18zZrw2b7qy6r/79dLm4Z6vgygSh0vHgDFyqlzKMIkBh2QJk2t3Ic021CHcgmZoL6wFM3N2GW9kxTJcGHmTlMywf9d/fvNzRipY8B4oSTqk/eAL1YVJSe5CZOlPaztSvvckGV+wwfew9pRbsVn6KOz23xfQ1fAVnaLRaYVrbyV2wsmbjdDpDGWFeYefO/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(396003)(376002)(346002)(136003)(83380400001)(66476007)(36756003)(2906002)(31696002)(8676002)(66574015)(66556008)(8936002)(31686004)(86362001)(5660300002)(66946007)(6486002)(4326008)(478600001)(52116002)(6666004)(186003)(54906003)(316002)(16526019)(2616005)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: PJiObkyqiOjNW+r0uARK86a7JyyTCkFLUwgcsAGyYt8PHnocUI84FP+4opSm4NyAPshJFyDkkW4jCDY/UhSiNWdRzkr75im5vLGlULR4SKR4q8sNtEXjyOO7obc/O/Rcb7ZaQbnfhI5XuIyFKSswKBpCjjWDbBKWgbS9cpCtrz9V2a0phWCt1lZHcmkPBHZx9IO4RvWYw8EmzQKUaaKrYBb1miOQ5yZPKEnXXt3YczMXGtv3sngz9BmRvcx3ZZRAnP56VQf/reX7Rc/WII+92UOeLCfs+fKz8ELBuHkFlFzvAT4pDHqqmtKCyo1LGYUBYZanEUjFOuiaHV5p68gch0E3ovjuJvnXVFzZxbmBBDbVQtR5byukeDJ4QIDaec86nyx3n7GR7crZjzSrMCKB9Phfz3E4Z0//NwtauzSEsbLkQZQ39PGQ8QVut5/gF4pTCzEkeQV17veO00hBCfaoFabLxq01vxjSqfcRyfPl72eQXgPwHJGiKsdkrboLuQN3goGpeDqaADBlJMaVj3Vq4y0l7cD+m7wCm5yo/pJapivnkayUXwxqAqK53W4cbq4CL2JKV1xYtn0afHX/gnmk0gtxBprNUBwzuVNSbkziyDj00LxfDGDP6myoFOYGX7nriY1Diqh8M9k/sL6VQju3kB6TYjBr1rZESfrBUUa4YHmlVnw0BQTBV9Wvh4ausU4kCrImkTFiiqbjF7r/nVotAw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 471006e9-bb6d-40f8-3b06-08d87fce170a
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2020 07:57:20.2260 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1UrTRRHGxw+tNbkFyw59rPgq5DpTJ8z9xepLuR0vQWXa1znEvhX9G58btlwx0cQt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4222
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
Cc: Daniel Vetter <daniel.vetter@intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDMuMTEuMjAgdW0gMDQ6NTEgc2NocmllYiBKaWFueGluIFhpb25nOgo+IEhlcmUgaXMgdGhl
IHdhcm5pbmcgbWVzc2FnZToKPgo+IAlkcml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi5jOjkxNyBkbWFf
YnVmX21hcF9hdHRhY2htZW50KCkKPiAJZXJyb3I6ICdzZ190YWJsZScgZGVyZWZlcmVuY2luZyBw
b3NzaWJsZSBFUlJfUFRSKCkKPgo+IEZpeCBieSBhZGRpbmcgZXJyb3IgY2hlY2tpbmcgYmVmb3Jl
IGRlcmVmZXJlbmNpbmcgdGhlIHBvaW50ZXIuCj4KPiBGaXhlczogYWM4MGNkMTdhNjE1ICgiZG1h
LWJ1ZjogQ2xhcmlmeSB0aGF0IGRtYS1idWYgc2cgbGlzdHMgYXJlIHBhZ2UgYWxpZ25lZCIpCj4g
UmVwb3J0ZWQtYnk6IERhbiBDYXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJAb3JhY2xlLmNvbT4KPiBT
aWduZWQtb2ZmLWJ5OiBKaWFueGluIFhpb25nIDxqaWFueGluLnhpb25nQGludGVsLmNvbT4KClJl
dmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CgpE
byB5b3UgaGF2ZSBjb21taXQgYWNjZXNzIHRvIGRybS1taXNjLW5leHQgb3Igc2hvdWxkIEkgcHVz
aCBpdD8KCj4gLS0tCj4gICBkcml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi5jIHwgMiArLQo+ICAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9kbWEtYnVmL2RtYS1idWYuYyBiL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtYnVmLmMK
PiBpbmRleCA1NTZmNjJlLi4wZWI4MGMxIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZG1hLWJ1Zi9k
bWEtYnVmLmMKPiArKysgYi9kcml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi5jCj4gQEAgLTkwOCw3ICs5
MDgsNyBAQCBzdHJ1Y3Qgc2dfdGFibGUgKmRtYV9idWZfbWFwX2F0dGFjaG1lbnQoc3RydWN0IGRt
YV9idWZfYXR0YWNobWVudCAqYXR0YWNoLAo+ICAgCX0KPiAgIAo+ICAgI2lmZGVmIENPTkZJR19E
TUFfQVBJX0RFQlVHCj4gLQl7Cj4gKwlpZiAoIUlTX0VSUihzZ190YWJsZSkpIHsKPiAgIAkJc3Ry
dWN0IHNjYXR0ZXJsaXN0ICpzZzsKPiAgIAkJdTY0IGFkZHI7Cj4gICAJCWludCBsZW47CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

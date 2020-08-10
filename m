Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4131A240422
	for <lists+dri-devel@lfdr.de>; Mon, 10 Aug 2020 11:37:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B609896E9;
	Mon, 10 Aug 2020 09:36:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2075.outbound.protection.outlook.com [40.107.223.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7417E896E9;
 Mon, 10 Aug 2020 09:36:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g0FOrCcnXb7LWzc9zch6FZc3r7sjEtonqw2S6QU+RV1Iph+AEeiPCe5RO6fFGt63H+RBJ6C6EOdZuVpuRbsg5aHt+DCT9YTGZtmwKlxP0A4vMGyvJAsvCwYAUVa8XiTVcw5sB7cWHOsGEpIOnKjudIdH5a2djwx784ZchBGf6jRCKbK48/n3Xfh/+WLmBNpc4XTby7DOPIRvqYjuwh0EdlGWfHMOoAZFGulUdZbDCYxLk3NlGMzUom75tAUZ/lhPnzT2K0QiHsiQGp4KdCfE9glSbWu/fN/S/d8C+Wt0bMUOvLfah2Ddvw8NeJK6VmYqQ2RK46effSvSSgO0v68UkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UdzF692QjAJE8CzhcVJ4khd93yf7raCWP6TUmUFhcFw=;
 b=KQMoKfe9FS5/G/dRdKPh1utF0UX2nwAjbncg1cu1is7t4IghYW7LDg34v6JqBiRLm/kYDN5JH6GZMGcedG4j8OaGsjcQKGc4ISTiEY32VMMIL2TweZYjqpod8Wnwmzq15TDyTKy7zDUMmAbMUkexysKwJ7ko/8aFc8LB5usd3/Emtx/pyzR2OyRgAkizaDxaO12nttuZRH71NbFrAUPIRLZI/wqjOcb8xaz/9poU++uq4lzJbRe986zr9kH30rkHlqRYKquS/S+K7Z5h1Z5hoSJW+6vdzpQxVdzQqyx1e2efjEJV2cwx4UlfjVRFbK96FYCbCUU2s/O5fMSncZXunQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UdzF692QjAJE8CzhcVJ4khd93yf7raCWP6TUmUFhcFw=;
 b=sQ1iE28UkItY0ALDS9zuaVBvHK5wwCIGiCDCSWWkxllgA9W5J/eMZhc5jAnoYdc9tQDCaAXhDKcRcvokRBPFeBS/+0F/D+wSWWlDWcXzdiI9ODQJ3m6FidMoT8cKWIIX7zH5/rDLs4eGPa+oRr+FojbNgwJ26x+VzTaP5/z6Q8c=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4206.namprd12.prod.outlook.com (2603:10b6:208:1d5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Mon, 10 Aug
 2020 09:36:52 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3261.024; Mon, 10 Aug 2020
 09:36:52 +0000
Subject: Re: [PATCH] drm: amdgpu: Use the correct size when allocating memory
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 alexander.deucher@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 sumit.semwal@linaro.org, colton.w.lewis@protonmail.com,
 Ori.Messinger@amd.com, m.szyprowski@samsung.com, bernard@vivo.com,
 dri-devel@lists.freedesktop.org
References: <20200809203406.751971-1-christophe.jaillet@wanadoo.fr>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <b4117d15-d563-5e1e-d8ce-edded2db77a1@amd.com>
Date: Mon, 10 Aug 2020 11:36:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200809203406.751971-1-christophe.jaillet@wanadoo.fr>
Content-Language: en-US
X-ClientProxiedBy: AM0PR02CA0090.eurprd02.prod.outlook.com
 (2603:10a6:208:154::31) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR02CA0090.eurprd02.prod.outlook.com (2603:10a6:208:154::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19 via Frontend
 Transport; Mon, 10 Aug 2020 09:36:50 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4cd87d2f-9555-4f28-3839-08d83d10e998
X-MS-TrafficTypeDiagnostic: MN2PR12MB4206:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4206F8ECA1C1F0E3C0C31CA883440@MN2PR12MB4206.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7saBlRA/atspTH7xgEWY6qdqXyLXGPiSsxb3u4qeowIAW04pyivm1kGSB/YgRw+uYy6zcHNgBeeTuhVGjaXvnQNo7bH5Ava0WOoqPGPGzAmphjz5S5m8vcDWPJPuNjKKElUMT95QktYDp8bAkzU8J1L2rP3wvmHQvuTHzfeoNQaJFh8+G2t8G1VlX3Jto8ZhoclqOkS6AQYkxJlPPh/bW9eSz0HXCXUjBX1Oqnvhgz9xmBp6uiOhTl2ZZV/v22ywXUZ4oitF7rnzqWsOhNs6SWWFP4txVbIAyLGjLLu8P3M7Gv0ekGLX6k/c39AeqhVA+VB2sUiJkXABrhYn/KfnAPUfncJm8nJIum4xE7owRCIKhA32w1xznkTqOWVu+CapijYTGhGC3EjYrzSpTyW25Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(4326008)(2906002)(7416002)(6486002)(498600001)(2616005)(52116002)(186003)(16526019)(5660300002)(31696002)(66574015)(8936002)(66556008)(66946007)(66476007)(86362001)(31686004)(6666004)(83380400001)(36756003)(8676002)(921003)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: INoEiAtUc1us2NsoL8opopsRTE6QF1eLimRZ3CX+CyyfH6+zi/naQAoOh9FOWqtOHFnVhDWLqk6QRSLSNMGcl9t46+D5rAlLg0dgzzSK7+ZzTn77ih/gGbSjIPiJH036qXboRUkJ22V/5WdZ4HkaYBo/0VTiM4lO6rahKnymVo8pUi2fLdGn1Bl1lIFXOUq/N8OyszcFk/9VZVhFoo5aD8wedrqn6EyBe+IQbihVwhEaGpceAnVx+RbCXrvNOp5cMeGz6JTtIn/abqonZZz8rzvXAfEt6zN/2i3zLJtQw8NZGQG0GAtMR5gXvrtrpYJR2Flgli3VFeDS60QQE+2c8c4GDk175H8Pu5ME/2soqxO1Asw/FYXcfhOYRNdkpli/9mgitHqczkn6PnyD5clCDOyjDziXdx953mM6CEBB+qYgAHi3mSADoQ7WgjGYzAZ59KwXTGizUaetAJWwbEgvxLh/3KOV9lYB1+/w3C8MSIumLPDJ/PUcvBumIhxLdWAV/AbG9qGEC6idDlPS0oI/OtnCxJ9fxLJ9OhqFngheypMPoHSdwVZQuj5SLoQaj7Xfk9NRDvBqqIHsyLE2FwM897sRhwYnkhdN80jNW7s3oXE/yKx3grG6tpunKill6VpbNzNxhCRKc/OT4lQITgg1Sdtwo5zKv44rZSsIA9wQEpeQLEMBdXux684XyJ2TPTuyjkJYUGnq2MSQJ23+InuWlw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cd87d2f-9555-4f28-3839-08d83d10e998
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2020 09:36:52.6450 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QQ5gNwpVLpdGVVz4iOBVFIISTjW4G8gQgalYh/ztu+qHabuWFejfvkWK4gCCF60e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4206
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDkuMDguMjAgdW0gMjI6MzQgc2NocmllYiBDaHJpc3RvcGhlIEpBSUxMRVQ6Cj4gV2hlbiAn
KnNndCcgaXMgYWxsb2NhdGVkLCB3ZSBtdXN0IGFsbG9jYXRlZCAnc2l6ZW9mKCoqc2d0KScgYnl0
ZXMgaW5zdGVhZAo+IG9mICdzaXplb2YoKnNnKScuICdzZycgKGkuZS4gc3RydWN0IHNjYXR0ZXJs
aXN0KSBpcyBzbWFsbGVyIHRoYW4KPiAnc2d0JyAoaS5lIHN0cnVjdCBzZ190YWJsZSksIHNvIHRo
aXMgY291bGQgbGVhZCB0byBtZW1vcnkgY29ycnVwdGlvbi4KPgo+IEZpeGVzOiBmNDRmZmQ2Nzdm
YjMgKCJkcm0vYW1kZ3B1OiBhZGQgc3VwcG9ydCBmb3IgZXhwb3J0aW5nIFZSQU0gdXNpbmcgRE1B
LWJ1ZiB2MyIpCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoZSBKQUlMTEVUIDxjaHJpc3RvcGhl
LmphaWxsZXRAd2FuYWRvby5mcj4KCkdvb2QgY2F0Y2gsIFJldmlld2VkLWJ5OiBDaHJpc3RpYW4g
S8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cgo+IC0tLQo+ICAgZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZyYW1fbWdyLmMgfCAyICstCj4gICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdnJhbV9tZ3IuYyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV92cmFtX21nci5jCj4gaW5kZXggMTM0Y2MzNmUzMGM1Li4wNzM5ZTI1
OWJmOTEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zy
YW1fbWdyLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdnJhbV9t
Z3IuYwo+IEBAIC00NjIsNyArNDYyLDcgQEAgaW50IGFtZGdwdV92cmFtX21ncl9hbGxvY19zZ3Qo
c3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCj4gICAJdW5zaWduZWQgaW50IHBhZ2VzOwo+ICAg
CWludCBpLCByOwo+ICAgCj4gLQkqc2d0ID0ga21hbGxvYyhzaXplb2YoKnNnKSwgR0ZQX0tFUk5F
TCk7Cj4gKwkqc2d0ID0ga21hbGxvYyhzaXplb2YoKipzZ3QpLCBHRlBfS0VSTkVMKTsKPiAgIAlp
ZiAoISpzZ3QpCj4gICAJCXJldHVybiAtRU5PTUVNOwo+ICAgCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

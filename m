Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0692023035A
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 08:56:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D3126E1B2;
	Tue, 28 Jul 2020 06:56:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760080.outbound.protection.outlook.com [40.107.76.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E28A6E126;
 Tue, 28 Jul 2020 06:56:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TsfTjbpobIZNIgzGCjY67TyDcapQYEy3yvFlbRBaEndJblUutlCxmGW1xYbefuytAIimB8fvAdD9V6VeLxQJjeZwo1xnW8sfNKTS0Pjl5IDqEUB19pWLmJGj1CcIpEjkeneMA3QCI3H/BVIXTnATg5ZaSW5Ff60T/4x9P+lIHl6yfYJocZ7nUpsfuI8mCWEITjPImPOEFv3YjkUj0G87aLRtn9ySIQ3yfRPn26AS4/+lOd5XsHmTPw2cJxUHtWkQlSZOAuEdL3nIuzXvu3OEvSXlImpgwVnrzirRbi0d/fMsxoKUpNah3Dv56f8JF0vP9hq48xRm081TCFRKOPFzaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VkWADiYG8d5BSQMhIF0cqLu5QiFbDd3x67E2ayjtq6s=;
 b=nCj2SEj6sdMV8Er+oA9ABfhAfusicD39u/CgarKzDgMo/fZVU2ah83mnpA0yBzjvi35SXw4wakyrvnYffqBUkQ04t6ZGHFCG0V4eqxVDjZHq/qTRBLrShp6UCDc5oSsgQX/IL7qHSdilhz5ahtuA7i+OLnNdXJ2p0B6fUhvAk4xgYIDZpwTYv7xg8FyNzn+YUwwescZhjn1Ce4OxUzAO3h9T2W/hZLZQ6uS0MSgqO610KBy6DhEGtD1Na4vyIKeLg9GFe0/Hcn+T5DhrfFPtbHWeTQl5LuKPhIOxTIpppRLaPDvoEKFlyGwpWJT2UhCPdzoxFT6pRsWq0f90IFcfPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VkWADiYG8d5BSQMhIF0cqLu5QiFbDd3x67E2ayjtq6s=;
 b=wH3w9+R7kgugUpLyhcnIzbGLsGsGGSwnJgeZhI8HN/YsEOcXUNYjLoBiVlo/JvuG802YNx7G/I00m9/X5Sqe9GJQGjY78+7vj+IT/3ZXiDLjvLJD+OM4lzHkSflp3qizCyCLVqFqaDPV9PCZzHNiyeeUhQP/K6a3IkApWW7DJdc=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3838.namprd12.prod.outlook.com (2603:10b6:208:16c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.23; Tue, 28 Jul
 2020 06:56:42 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3216.033; Tue, 28 Jul 2020
 06:56:42 +0000
Subject: Re: [PATCH] drm/amdgpu/dc: Stop dma_resv_lock inversion in commit_tail
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20200727213017.852589-1-daniel.vetter@ffwll.ch>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <d4e687e9-cf0b-384f-5982-849d0fa11147@amd.com>
Date: Tue, 28 Jul 2020 08:56:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200727213017.852589-1-daniel.vetter@ffwll.ch>
Content-Language: en-US
X-ClientProxiedBy: AM0PR10CA0018.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::28) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR10CA0018.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.22 via Frontend
 Transport; Tue, 28 Jul 2020 06:56:40 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8222575c-e9db-4375-acc2-08d832c36271
X-MS-TrafficTypeDiagnostic: MN2PR12MB3838:
X-Microsoft-Antispam-PRVS: <MN2PR12MB383874905529E140F43DAFF383730@MN2PR12MB3838.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: etuWxKD+7FSURO5FPlbjT1kJJsu3f/cOqXh4VQVWX3utitJ+Z0vns5gmutSv3X2AFvCEZzZcpEAyZDMU5C+NVZjcM6ubsAUxMHHqXM9VNFt1p+pLix4P4HECw4lbdOkKxBL8vRHzh1t6ds+I7BhCaxIwYavsPbPPZ6kLtN0WnzrlIdVfgh8z8HqpwwLsTzJ4AdDo0n9efblzLJvzdZhmCBz8gYtUnjlZnN0RRLcLTp9z1ra5EpaXu3YvtnldNmSHyh8ZsdB+NUmE6cBsb7MGawlpQ0nszD2AbOIBp5SSNz6ZICIoPlD07iOgUa81Qnaabw/ylVhZ9WD3dLLEXMuthNoIhOJZstJaAPeX5D8nFNCD7b0GJpyEqR0q9VBz/E0HHqNKLZ/1mO1o7rjYdoMJS1CuQLWOzzRnGcMxCxbIoYWcfptK6QsoPE1NeyQ9mlM7Esm4QQOCtZwnZVSiua5xmA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(396003)(136003)(346002)(366004)(376002)(6666004)(186003)(31686004)(16526019)(86362001)(66574015)(66476007)(66946007)(83380400001)(8676002)(478600001)(966005)(4326008)(45080400002)(66556008)(5660300002)(6486002)(8936002)(54906003)(31696002)(36756003)(2616005)(52116002)(7416002)(316002)(2906002)(110136005)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: u5WKVduONTremJCVT9sGeouYFPpogtoU823m5Pr+jNMNOM/DUHLQ9Xs4KfB788cHAB4ZROn+8cH4Zhfn6GR0OvWPyNQZxuYqiZC8HeEzZ0mYYKScXdlZZsxHkKxTfUnoFwVVMsC8Bcm7wJMDAAGBlF6MsupbVYIp9+ejS8qD4HcZc6l6yBirriWSMJFvRGigs2OX84b5GboX0t8gQMZGAOEgzv+Bx23xxjIuDthcwxK3tE6mWlhxyCtKC/vZ5VAY0BnbpgcyH14RwxWLM/hnh0RVuNcADQePClpGluoRpLCfKVmr7Bk9BhJJrUaG2+doJmBHCL82314kFjk8GGyRgy+PBiCoiHYBvOorIW66tB8nquT7tkQDx7/lSC9Tisz3/Q0J8Q1IgyB30lIVTmID0GWIXtvdEgxFzr5HfzkcbDMnDsvVbHSKEeVdk+OIDG3hYtav0d1pPD9MY6y7efNPC/iHd7ThqcI64dVd3Y5ucQmrbBXNWGp1F6BljnkBTvRSmo4I38YmncLyBqFt2EyA1Zddxsdg9m//G8a0aZTmaq+KHgsh7oUBxVpQjMLFV8+W
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8222575c-e9db-4375-acc2-08d832c36271
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2020 06:56:42.5593 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lX0potb1U9WL+HICjQxPAO4/1oIBFXhi7+LFJKsAasgFLvZJdlz6aIrNUKnMgu2L
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3838
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
Cc: linux-rdma@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 linaro-mm-sig@lists.linaro.org, Daniel Vetter <daniel.vetter@intel.com>,
 linux-media@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjcuMDcuMjAgdW0gMjM6MzAgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IFRyeWluZyB0byBn
cmFiIGRtYV9yZXN2X2xvY2sgd2hpbGUgaW4gY29tbWl0X3RhaWwgYmVmb3JlIHdlJ3ZlIGRvbmUK
PiBhbGwgdGhlIGNvZGUgdGhhdCBsZWFkcyB0byB0aGUgZXZlbnR1YWwgc2lnbmFsbGluZyBvZiB0
aGUgdmJsYW5rIGV2ZW50Cj4gKHdoaWNoIGNhbiBiZSBhIGRtYV9mZW5jZSkgaXMgZGVhZGxvY2st
eS4gRG9uJ3QgZG8gdGhhdC4KPgo+IEhlcmUgdGhlIHNvbHV0aW9uIGlzIGVhc3kgYmVjYXVzZSBq
dXN0IGdyYWJiaW5nIGxvY2tzIHRvIHJlYWQKPiBzb21ldGhpbmcgcmFjZXMgYW55d2F5LiBXZSBk
b24ndCBuZWVkIHRvIGJvdGhlciwgUkVBRF9PTkNFIGlzCj4gZXF1aXZhbGVudC4gQW5kIGF2b2lk
cyB0aGUgbG9ja2luZyBpc3N1ZS4KPgo+IHYyOiBBbHNvIHRha2UgaW50byBhY2NvdW50IHRtel9z
dXJmYWNlIGJvb2xlYW4sIHBsdXMganVzdCBkZWxldGUgdGhlCj4gb2xkIGNvZGUuCj4KPiBDYzog
bGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnCj4gQ2M6IGxpbmFyby1tbS1zaWdAbGlzdHMubGlu
YXJvLm9yZwo+IENjOiBsaW51eC1yZG1hQHZnZXIua2VybmVsLm9yZwo+IENjOiBhbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cj4gQ2M6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgo+IENjOiBNYWFy
dGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgo+IENjOiBD
aHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gU2lnbmVkLW9mZi1i
eTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+Cj4gLS0tCj4gREMtZm9s
a3MsIEkgdGhpbmsgdGhpcyBzcGxpdCBvdXQgcGF0Y2ggZnJvbSBteSBzZXJpZXMgaGVyZQo+Cj4g
aHR0cHM6Ly9uYW0xMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBz
JTNBJTJGJTJGbG9yZS5rZXJuZWwub3JnJTJGZHJpLWRldmVsJTJGMjAyMDA3MDcyMDEyMjkuNDcy
ODM0LTEtZGFuaWVsLnZldHRlciU0MGZmd2xsLmNoJTJGJmFtcDtkYXRhPTAyJTdDMDElN0NjaHJp
c3RpYW4ua29lbmlnJTQwYW1kLmNvbSU3QzhhNGY1NzM2NjgyYTRiNWM5NDNlMDhkODMyNzQ3YWIx
JTdDM2RkODk2MWZlNDg4NGU2MDhlMTFhODJkOTk0ZTE4M2QlN0MwJTdDMCU3QzYzNzMxNDgyMzE0
NTUyMTg0MCZhbXA7c2RhdGE9cWQ3TnJveDYyTHIlMkZYV2JKSkZWc2tnOVJZTDQlMkZvUlZDRmpS
NnJVRE1BNUUlM0QmYW1wO3Jlc2VydmVkPTAKPgo+IHNob3VsZCBiZSByZWFkeSBmb3IgcmV2aWV3
L21lcmdpbmcuIEkgZml4ZWQgaXQgdXAgYSBiaXQgc28gdGhhdCBpdCdzIG5vdAo+IGp1c3QgYSBn
cm9zcyBoYWNrIDotKQo+Cj4gQ2hlZXJzLCBEYW5pZWwKPgo+Cj4gLS0tCj4gICAuLi4vZ3B1L2Ry
bS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgfCAxOSArKysrKystLS0tLS0tLS0t
LS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMoLSkK
Pgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2Ft
ZGdwdV9kbS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVf
ZG0uYwo+IGluZGV4IDIxZWM2NGZlNTUyNy4uYTIwYjYyYjFmMmVmIDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCj4gQEAgLTY5
NTksMjAgKzY5NTksMTMgQEAgc3RhdGljIHZvaWQgYW1kZ3B1X2RtX2NvbW1pdF9wbGFuZXMoc3Ry
dWN0IGRybV9hdG9taWNfc3RhdGUgKnN0YXRlLAo+ICAgCQkJRFJNX0VSUk9SKCJXYWl0aW5nIGZv
ciBmZW5jZXMgdGltZWQgb3V0ISIpOwo+ICAgCj4gICAJCS8qCj4gLQkJICogVE9ETyBUaGlzIG1p
Z2h0IGZhaWwgYW5kIGhlbmNlIGJldHRlciBub3QgdXNlZCwgd2FpdAo+IC0JCSAqIGV4cGxpY2l0
bHkgb24gZmVuY2VzIGluc3RlYWQKPiAtCQkgKiBhbmQgaW4gZ2VuZXJhbCBzaG91bGQgYmUgY2Fs
bGVkIGZvcgo+IC0JCSAqIGJsb2NraW5nIGNvbW1pdCB0byBhcyBwZXIgZnJhbWV3b3JrIGhlbHBl
cnMKPiArCQkgKiBXZSBjYW5ub3QgcmVzZXJ2ZSBidWZmZXJzIGhlcmUsIHdoaWNoIG1lYW5zIHRo
ZSBub3JtYWwgZmxhZwo+ICsJCSAqIGFjY2VzcyBmdW5jdGlvbnMgZG9uJ3Qgd29yay4gUGFwZXIg
b3ZlciB0aGlzIHdpdGggUkVBRF9PTkNFLAo+ICsJCSAqIGJ1dCBtYXliZSB0aGUgZmxhZ3MgYXJl
IGludmFyaWFudCBlbm91Z2ggdGhhdCBub3QgZXZlbiB0aGF0Cj4gKwkJICogd291bGQgYmUgbmVl
ZGVkLgo+ICAgCQkgKi8KPiAtCQlyID0gYW1kZ3B1X2JvX3Jlc2VydmUoYWJvLCB0cnVlKTsKPiAt
CQlpZiAodW5saWtlbHkociAhPSAwKSkKPiAtCQkJRFJNX0VSUk9SKCJmYWlsZWQgdG8gcmVzZXJ2
ZSBidWZmZXIgYmVmb3JlIGZsaXBcbiIpOwo+IC0KPiAtCQlhbWRncHVfYm9fZ2V0X3RpbGluZ19m
bGFncyhhYm8sICZ0aWxpbmdfZmxhZ3MpOwo+IC0KPiAtCQl0bXpfc3VyZmFjZSA9IGFtZGdwdV9i
b19lbmNyeXB0ZWQoYWJvKTsKPiAtCj4gLQkJYW1kZ3B1X2JvX3VucmVzZXJ2ZShhYm8pOwo+ICsJ
CXRpbGluZ19mbGFncyA9IFJFQURfT05DRShhYm8tPnRpbGluZ19mbGFncyk7Cj4gKwkJdG16X3N1
cmZhY2UgPSBSRUFEX09OQ0UoYWJvLT5mbGFncykgJiBBTURHUFVfR0VNX0NSRUFURV9FTkNSWVBU
RUQ7CgpZZWFoLCB0aGUgYWJvLT5mbGFncyBhcmUgbW9zdGx5IGZpeGVkIGFmdGVyIGNyZWF0aW9u
LCBlc3BlY2lhbGx5IHRoZSAKZW5jcnlwdGVkIGZsYWcgY2FuJ3QgY2hhbmdlIG9yIHdlIGNvcnJ1
cHQgcGFnZSB0YWJsZSB0YWJsZXMuIFNvIHRoYXQgCnNob3VsZCB3b3JrIGZpbmUuCgpBbnlib2R5
IHdobyBwaWNrcyB0aGlzIHVwIGZlZWwgZnJlZSB0byBhZGQgYW4gUmV2aWV3ZWQtYnk6IENocmlz
dGlhbiAKS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+LgoKUmVnYXJkcywKQ2hyaXN0
aWFuLgoKPiAgIAo+ICAgCQlmaWxsX2RjX3BsYW5lX2luZm9fYW5kX2FkZHIoCj4gICAJCQlkbS0+
YWRldiwgbmV3X3BsYW5lX3N0YXRlLCB0aWxpbmdfZmxhZ3MsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

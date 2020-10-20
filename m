Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D61052936F9
	for <lists+dri-devel@lfdr.de>; Tue, 20 Oct 2020 10:47:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A77746EC3E;
	Tue, 20 Oct 2020 08:47:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2050.outbound.protection.outlook.com [40.107.244.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23F856EC3D
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 08:47:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F2l7H+4kxXoZtO4No3UR1gvMt1tq1eEqRj+QSn7EyVOI3JzTdDIkTgxLhXg5d0XMwzizYjv5kjfN4VxBe3pVf2EyTKI1D+uUX1MLFZil2vbwLQmIgBlTPutN356HOtbKJDp3EO8xBecmr4gejWKUcqUS3scqY9YDmN2AWo6mn9DChlJrzGL63KAOY4kpdOHlNEnMtmi70GwP2l89FGL5ANfjvvjY1fMjiJALC3//sD7UjclaQianxiW4fwbTYpPxoMyD7c8dTRZ7AZq4KbLrQ1pdsIJ/XodLBzTXVn1CO0+Uiao2gSQGrBzC73e88fFAr86mo1bnksAOZ4fgnC+PJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EGxPxr6jqh/T6Zct/DL85UoZphkvBSRa/RiB5T5qINc=;
 b=VUD0AWmmuieVFguDUMA039nraLevo9ejNV4+wksf7vQnRjept6vzUIADVWiOpML+2Pfc/BrOVGiqZQBxyzwPwoE/Nb/zR+wdybxXRiHY4sYtweALeohHK1GI5f0+j4Dlge35ZBSbG4DOBsuk3XEh7taalc/+Q1cHiqEj3MX6lZQlBl4vMWCFpS/TpeDQCqI3+PWz3lZEb8nDLqX/ohgB7c9KZzrHwjQ9L8+RA4UibdbUD/GBVIOTVaCGHsXdWEDb9K/XkDYzsNXaQHjvUPD5RFMTWdwK84fv302qFsefpaWl12AjFxqI72Umz5X10nXqxD6Lit2N0R1nQK+qlEWChg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EGxPxr6jqh/T6Zct/DL85UoZphkvBSRa/RiB5T5qINc=;
 b=f6d/H/BT1WctYBXqCnd2U9UQWsGglfTKBx8Cey9BQrhQFFW7oRuv1H8BIu9wDb+ita7ZPre/x0qsSIlS3cEhEqqOAcgCoLxYHiI4uhFlZlba6oQhCtESqhT9lLmgqwEtdcQh0Oxl8BWsdGmzGd8yIzGcY0s/63GmYDZebrpMS1A=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3727.namprd12.prod.outlook.com (2603:10b6:208:15a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Tue, 20 Oct
 2020 08:47:04 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3477.028; Tue, 20 Oct 2020
 08:47:04 +0000
Subject: Re: [PATCH 1/5] drm/ttm: fix eviction valuable range check.
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20201019222257.1684769-1-airlied@gmail.com>
 <20201019222257.1684769-2-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <f31234a8-efe2-f3bc-bdfb-4664c770cfd9@amd.com>
Date: Tue, 20 Oct 2020 10:46:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201019222257.1684769-2-airlied@gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: FRYP281CA0014.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::24)
 To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 FRYP281CA0014.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.7 via Frontend Transport; Tue, 20 Oct 2020 08:47:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1f08c3df-c9bd-4874-cd00-08d874d4b7f7
X-MS-TrafficTypeDiagnostic: MN2PR12MB3727:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3727F40F4249ECDCE75889C4831F0@MN2PR12MB3727.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3gxCnlRC0XZiTT21rqWG5RDvw1jrfUZbpw1lIRiikTwd+cQYRQEXxrxBgergKVj5zZ7mSpd+c/tG7awHAC2kqfwN6IEgLztUCNT30lKNCTLesz8LFPD7Xsco853CEkF9PsqQFoUAPU9goczMn/9gkxrpKCwkJVLRWbluq6qUXuw8OMleqpACz/HzZpltzhzXJdQQJj0+9pJthrfeIBijDoqRxDBg3we0obxNCBLUP00B4Z1cFUmZ/9/2rh1a4oWQwXPkhFiUMFkomrw00tDPKF6iSZnUOapw2EdCJG1sk7/e9EyXWN268fb+BDNVpbVAnziTfW7O+eLXn34uIdIFwif/ikVNB9p1cD7knLNkn9bbwARZpdCu0DBwIEeYCoYb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(396003)(39860400002)(376002)(366004)(66946007)(66556008)(66574015)(6486002)(8936002)(186003)(16526019)(8676002)(83380400001)(36756003)(86362001)(478600001)(31696002)(52116002)(66476007)(6666004)(2616005)(2906002)(31686004)(5660300002)(316002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: seiCso+wS1cWzUZzsE9kxAyScWA2cemNVQxIywxFOspMhd3l75sG1GN6UpD+m8DjI0Tw0pnl3bG6lftat0wnFT2HV+KzOeqezyUF+mtzmxbm15UDadANqmSWE2NwToax2UImhnYq2vmJ7w+quk1prhAxbxQKG+rvgm1D5ZC0gv1BiZbPzKLPMOU5wYCg9za2UH/cmoH1ncQdJjE2DBtq3n7I7krJqVv/EfU1cknHV6+q2TGkQ7vfyGD7Gc/kgtcFfdQdZezrT5kZUi1c6QIkRT1D9YVQir4z3YBqNffSaCm3WfqHf/SPjdmvib+SWLoiF4aCW4f6RChmqt5sWJeeHT/vdk41qzKV7r++KwVgV3b17AkCSoNnwctX2Snv3eOSWqSv9QxIH8VGTKA7yA+6mPbKQKSK1u72Q+hMPwDIru5w/PUnUaG+QoOafzdhLZvL67CGraSe5KhyE1x+JEaPVOp6MzWkBMCjU3JrBHv884z1/m/LtPS/8jSIKVNLXKTRX7/Pa+oEWohuBMJmVH7iyRWQPvb6s1o6loi7PmIR2mJNk6r9E3EtIOkkDBJivJ+rg1qq7UL7E8NCcKCD4XMYK1mWt7puo8KyE3URYePft86cCG9sdKmNZdQ/9k3GgiGl/ez6Ru4OYAPes7gorFMQ9El3DvsVY09dYUIJPGwcfd0J2NFb1N70rQq1fmHeKISHBaloZVNyjHf2APTe6y8/Cw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f08c3df-c9bd-4874-cd00-08d874d4b7f7
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2020 08:47:04.3653 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jvhyYmua5Paz3Mg2I0cOPHD8CSFKxjD3XD3f0hVyfVSD9+fDl1MURtbMrSt5Fz9h
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3727
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

QW0gMjAuMTAuMjAgdW0gMDA6MjIgc2NocmllYiBEYXZlIEFpcmxpZToKPiBGcm9tOiBEYXZlIEFp
cmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+Cj4gVGhpcyB3YXMgYWRkaW5nIHNpemUgdG8gc3Rh
cnQsIGJ1dCBwZm4gYW5kIHN0YXJ0IGFyZSBpbiBwYWdlcywKPiBzbyBpdCBzaG91bGQgYmUgdXNp
bmcgbnVtX3BhZ2VzLgo+Cj4gTm90IHN1cmUgdGhpcyBmaXhlcyBhbnl0aGluZyBpbiB0aGUgcmVh
bCB3b3JsZCwganVzdCBub3RpY2VkIGl0Cj4gZHVyaW5nIHJlZmFjdG9yaW5nLgoKT2gsIHllcyBp
dCBtb3N0IGxpa2VseSBkb2VzIQoKPiBTaWduZWQtb2ZmLWJ5OiBEYXZlIEFpcmxpZSA8YWlybGll
ZEByZWRoYXQuY29tPgoKUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5r
b2VuaWdAYW1kLmNvbT4KCkNDIHN0YWJsZT8KCj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vdHRt
L3R0bV9iby5jIHwgMiArLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyBi
L2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKPiBpbmRleCBjYmM3NGEzMjBkYjIuLjMxMDE2
NTBjMDFiNCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwo+IEBAIC02MjAsNyArNjIwLDcgQEAgYm9v
bCB0dG1fYm9fZXZpY3Rpb25fdmFsdWFibGUoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywK
PiAgIAkvKiBEb24ndCBldmljdCB0aGlzIEJPIGlmIGl0J3Mgb3V0c2lkZSBvZiB0aGUKPiAgIAkg
KiByZXF1ZXN0ZWQgcGxhY2VtZW50IHJhbmdlCj4gICAJICovCj4gLQlpZiAocGxhY2UtPmZwZm4g
Pj0gKGJvLT5tZW0uc3RhcnQgKyBiby0+bWVtLnNpemUpIHx8Cj4gKwlpZiAocGxhY2UtPmZwZm4g
Pj0gKGJvLT5tZW0uc3RhcnQgKyBiby0+bWVtLm51bV9wYWdlcykgfHwKPiAgIAkgICAgKHBsYWNl
LT5scGZuICYmIHBsYWNlLT5scGZuIDw9IGJvLT5tZW0uc3RhcnQpKQo+ICAgCQlyZXR1cm4gZmFs
c2U7Cj4gICAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2198E27BD88
	for <lists+dri-devel@lfdr.de>; Tue, 29 Sep 2020 09:05:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF53589DFC;
	Tue, 29 Sep 2020 07:05:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2086.outbound.protection.outlook.com [40.107.92.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C65D389DFC
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 07:05:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cpnI9sT4E5nAqZ0417CBVK7bnGm0i+TgTMUGuFtYjeavGfrJbxEuCyC5ciPTFhvMPKTxaiZ1dmVOALLlaPn7xKt/dWdjoVnApPpYv/me5PY/K4/09TtyBLKQ26w+emr76yhyccZFS/KiCPBkn2I2CB3EwI4s8Fs0/xSDiKDJ1EHK4OcraIVBjndT0a7r2MV07DXwVlSPtPDrmDGo139j0oI9OSACHdamo8V/OPNXrDKVz5K7hMiKC1HX9ACkAO4dF/lcxjgAqqJP0x3u7IwJ1rNQyhnq6X6KlV2BwVv8tP0XdPUsDcUkJ3dbDyy2f7NryWS3ifk4wccqnSAg0194/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g3HEQ6iCFsiIbrYuhqbjVxZuseVOgkjt67PL6gdrmmw=;
 b=Cprq/TWOiUspSwyo9TyVPSPAf2AItqpMmrgTlzwAalJI8945jx7bB0TiBmHa5/5RguFB5ZwFqTK5b5eQJQ/fzWkk/rDUWKCMdfwl4icsOMyoiGMZG068U3g6LWKomFCm0xtDPHmRkLkpETPZEte18p2njGtG0XJPh8Ug71UPbRnL4wyZMef04f+SDAxMFWd1H23yBVwN4HZTfL4wMBOLo54G7vjoK94NfwfuD0mfIOPl0da4/iae2EekDFrYxByP2qpl7bmjqYyiAK5Pb96SdtFVy0gQSgrI3Pl2UA4o/XtUZ7lfwegztUYQX1uasTELWJqyaAJ85mU+wLuXIL4dYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g3HEQ6iCFsiIbrYuhqbjVxZuseVOgkjt67PL6gdrmmw=;
 b=RBxX3jHzV8Y1zuc2TsKuOhcFWEFSoKiBDO4xX9Og7o9/tD1LbC3hbmtFVvXg+yosEULp1YsieqKvcfQf+iGq6ar2xp+Dp3w+HnVtq+qLQTfbE61Nxn98gbiLM08y5SmRP7JLgOh1Iu0/P0vG8okH5ray3CuRwE3ggLZEaAwTjfc=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20; Tue, 29 Sep
 2020 07:05:31 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3412.029; Tue, 29 Sep 2020
 07:05:31 +0000
Subject: Re: [PATCH 30/45] drm/ttm: add a new invalidate notify callback.
To: Dave Airlie <airlied@gmail.com>
References: <20200924051845.397177-1-airlied@gmail.com>
 <20200924051845.397177-31-airlied@gmail.com>
 <2608ea3c-5838-8fdb-59b6-d984d18f17d9@amd.com>
 <CAPM=9tw=o8oFyZ-RWtB+ZqGd+b2fo_zxQ8Nj2Z-iXahxb2TUsQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <dc087f3a-ad34-9c81-1372-8b69b3508c3e@amd.com>
Date: Tue, 29 Sep 2020 09:05:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAPM=9tw=o8oFyZ-RWtB+ZqGd+b2fo_zxQ8Nj2Z-iXahxb2TUsQ@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR04CA0084.eurprd04.prod.outlook.com
 (2603:10a6:208:be::25) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR04CA0084.eurprd04.prod.outlook.com (2603:10a6:208:be::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.20 via Frontend Transport; Tue, 29 Sep 2020 07:05:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 939581a0-7739-4f7e-fa6e-08d864460d8f
X-MS-TrafficTypeDiagnostic: MN2PR12MB4192:
X-Microsoft-Antispam-PRVS: <MN2PR12MB419254D668335CB240D07A5F83320@MN2PR12MB4192.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i1KXhDnBmC0q9HhR6JaRhHuj4V59DnOgb/qqSzSQM6LayLIS+ezlhVFugf9n/XwGOxjq6LvWvk/wR2pQsswDsvmR2iZcgyq8AZKJ4Xu0JPYf/6pMn2Yoeb14V5R6TCFzMfQ3HcADXSQLosR21AP9s1GIz74E+EnujJpiTqrQ2ncvM0F9sY4rF8rUL4qcY4laKMteXaFScME6FI8azdd8nC36KDDanwhOV7Qr2X/z+uiyUDGlrfS8fMTgBjyROpNhNNsJ6jg8RG1TdlEboWmnJYYxI5EFXEs7csFdTS8NQ6jvO+jY6XDJDB6raM9XKlJqSFiXSWXfJeItO4xNnY+SNHCCILcZZdp3FH7RXHCwoE2i0nQx863S6qWgZNJLxI/HS5MbDzlj2CGZgrFYFUmqq8fz//YSU7EVjKdy+fadlpafj3a8LgFakECXYIUtPsNX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(136003)(39860400002)(396003)(316002)(36756003)(186003)(52116002)(2616005)(54906003)(4326008)(31686004)(6916009)(478600001)(86362001)(8676002)(8936002)(66476007)(66556008)(66946007)(6666004)(5660300002)(31696002)(16526019)(6486002)(2906002)(83380400001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: B3h8l4BlzMowTC8bxVHp7QgqeKvnISm7j5lK1MIaSR8e17v3F3Wn16dt0zsiUuCVO6lgJqmGBBG4IvNTU1ClbpkObTiXlDrvSO4GNgS9zM5RA4/2CyPMJi+Bt2cg9BcFgAhMF3BOioWwBcJHyeWnB7XBdk84hIC3y9IE0RExX2UJwxHC7XytQWPLQCiscsR98deOkWJVol1v+8BMqbuJkaFC1SXAnXv6oKlKL32tkrUc7B/VWOZ1YkfRB0YuoX/u9n5+GEF3eLCburPbvxTRcCraAx17C/y/ZmcRpolAmlFQW/oXNgFRzFLJOBDEO7bB1C4H8EnFrulKz/lgxkJTUX4I8vRzSQ1jd0sh9rVM3wyS+mrNNADNae1UlQCr0M4Kfu8S4hFlp9o8qo7Ak5tTiXH3wiOHFnzqTCGrs0DawQm/kXnzdo5ysHiCjaBdTcgB2YYM4YFp5FeSFZffp81MWKla0MOjxpciiBnfpoK1Eo9x/eIfpEduCG6UROqLJsKmEw92nKSBpVi3McveCeNZ2to6+HdkpanTpyD+l0XK3qqwC7g810ZMBVa5Cqp9czuExfibwIgrQky2+hmgHh+Ss3v0TlNqvxqPLtuotPAeZkNyaKfGxcD1rcG6kNpsGi5wtSX/AK0HcWLomSFx/4Bi4SWm9pu6eoqumGzBfwqTuhGKgT432v9ZBu+yWmjRtTyt9FNlCdkHE+RqHgmF4xPtOw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 939581a0-7739-4f7e-fa6e-08d864460d8f
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2020 07:05:31.3391 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KfGIf4DZzHYgGcQW+1Vrm0M1HO2LoynNLJyV6y1jYkjIZUbvMK47b/El7IbJgwTW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4192
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
Cc: Ben Skeggs <bskeggs@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjkuMDkuMjAgdW0gMDU6MjMgc2NocmllYiBEYXZlIEFpcmxpZToKPiBPbiBUaHUsIDI0IFNl
cCAyMDIwIGF0IDIyOjI1LCBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5j
b20+IHdyb3RlOgo+PiBBbSAyNC4wOS4yMCB1bSAwNzoxOCBzY2hyaWViIERhdmUgQWlybGllOgo+
Pj4gRnJvbTogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KPj4+Cj4+PiBTaWduZWQt
b2ZmLWJ5OiBEYXZlIEFpcmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+PiBOQUssIGNvbXBsZXRl
bHkgdW5uZWNlc3NhcnkuCj4+Cj4+IFdlIHNob3VsZCByYXRoZXIgZG8gdGhlIHJlbWFpbmluZyBh
Y2NvdW50aW5nIGluIHRoZSBhbHJlYWR5IGV4aXN0aW5nCj4+IHJlbGVhc2Vfbm90aWZ5KCkgY2Fs
bGJhY2suCj4+Cj4+IFRoYXQgbWFrZXMgbXVjaCBtb3JlIHNlbnNlIGFuZCBpZiBJJ20gbm90IGNv
bXBsZXRlbHkgbWlzdGFrZW4gY291bGQKPj4gYWN0dWFsbHkgZml4IGEgYnVnIGluIGFtZGdwdS4K
PiByZWxlYXNlX25vdGlmeSBpcyBjYWxsZWQgZnJvbSBvbmUgcGF0aCwgYnV0IHRoZXJlIGlzIGEg
cGF0aCBpbgo+IGV2aWN0aW9uIHdoZXJlIGlmIGl0IGdldHMgcGFzcyAwIHBsYWNlbWVudHMKPiBp
dCB0ZWFycyBkb3duIHRoZSBtZW1vcnksIGFuZCBhbGxvY2F0ZXMgYSB0dC4KCllvdSBtZWFuIGZv
ciB0aGUgcGlwZWxpbmVkIGd1dHRpbmc/IE1obSwgSSBzZWUuIFByb2JhYmx5IGJldHRlciB0byBj
YWxsIAp0aGUgbW92ZSBjYWxsYmFjayBmb3IgdGhvc2UgY2FzZXMgYXMgd2VsbC4KCk9rLCBnbyBh
aGVhZCB3aXRoIHRoYXQgYXBwcm9hY2ggZm9yIG5vdy4gQnV0IHdlIHJlYWxseSBuZWVkIHRvIGNs
ZWFuIAp0aGF0IHVwIGZ1cnRoZXIuCgpDaHJpc3RpYW4uCgo+Cj4gSSdtIGNvbnNpZGVyaW5nIHdo
ZXRoZXIgaXQgc2hvdWxkIGJlIGFjY2VwdGFibGUgdG8gY2FsbCBldmljdCB3aXRoIG5vCj4gcGxh
Y2VtZW50cyAodGhvdWdoIG1heWJlIHRoYXQganVzdCBtZWFucyBldmljdCB0byBzeXN0ZW0pLgo+
Cj4gRGF2ZS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=

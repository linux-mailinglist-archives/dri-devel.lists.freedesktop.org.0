Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B176924188F
	for <lists+dri-devel@lfdr.de>; Tue, 11 Aug 2020 10:53:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8104289B97;
	Tue, 11 Aug 2020 08:53:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2086.outbound.protection.outlook.com [40.107.220.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82C0589B97
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 08:53:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EwtI8kosF0RkuEf7U1fmJoUvsP+IjlXXd9Fj6z0gFUGcx07zATu7pMY7uWY5/08dkievOoGuoVobJjgaDyseRnMhmLoM5JfxZa5MO4W8evMDPTpkcBTl67V1cBcUHVSWrKiWEIRxUG1Le5eo3npGOWGpEh1KVtGwKZCAFWRc9QssAdJBzFEP33BBTdVBiXwYGaiA9XjfpKAzqskmXbWCNRxpv8+lqQOBHN1d9Aw9tLEwemH0MFiNXcMlVDDztchroZbiHCfHh1lH8KkL6pFt1++zcmJrQ5XpG2r/BvxsqKdxX3+PrS4sUsk2cfpxCWSOXIv9EJ+kQIOP4/FTW4yPYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fDQWh253C5wJEWvM6kY+XBgl20P9bn/mVLy35uHW6nA=;
 b=gtYj3dj72j0UXsJzN+cyQkb2/ppR5zhzrq8Xzq/qhu08gPzZxnRQTddJ9slCeg6Ju/8Tz6a4VVvhlLmD61aCAipG/+nRhBZETkMpOQmoWE90gNucdEQ8HKdP7xxFwpl5o2T0mgr2231oIFBv5xqU0IQSoT6Kx9v6SVXE+n9mU/HMnmvRJl5C0s4KRKGIsbQ5mGjmxAfHs2tsx04APLKzx7z1gMzqCo5u4cjDEsVK2i8ipveIvyIhYWMXYIPS1oASFpD5AEwSWAbbcspz1HkW38/aS9gmJsrq65vfplljv9gAT4r78xh3le4fY16lLmmbT8BZ6gmx4h/3iGeUTClIEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fDQWh253C5wJEWvM6kY+XBgl20P9bn/mVLy35uHW6nA=;
 b=X8mCJatUIuW4RtTDkAre+wZYDyAASa40jChf41t9+93GQqByMavek4Gi71vT14mODg+x4j/VDftN7wbIhVxpjNxd4hFQ4wXZwyHVIczBq1C0zVzZAaFfmer0XlLDf+fEW+o/qIChHjNyd4I6wYJILjR1Tkb492K9ARBzegyofus=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2578.namprd12.prod.outlook.com (2603:10b6:207:49::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.22; Tue, 11 Aug
 2020 08:53:33 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3261.024; Tue, 11 Aug 2020
 08:53:33 +0000
Subject: Re: [PATCH 1/2] drm/ttm: init mem->bus in common code.
To: Dave Airlie <airlied@gmail.com>
References: <20200811074658.58309-1-airlied@gmail.com>
 <CAPM=9tw2nZB569FUw_KGhhP07m0n8ZugcFNrAsa0kn+9xtndsg@mail.gmail.com>
 <ceca6880-201f-a4b1-4d07-caac3e570e93@gmail.com>
 <CAPM=9tzgiwR3kLKo92ncAL+D7dxJbSNVA6BUF8Pic7-NM_8vDg@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <a1839a2a-75e5-5a3d-fa24-2ae684d11d1b@amd.com>
Date: Tue, 11 Aug 2020 10:53:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAPM=9tzgiwR3kLKo92ncAL+D7dxJbSNVA6BUF8Pic7-NM_8vDg@mail.gmail.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR03CA0072.eurprd03.prod.outlook.com (2603:10a6:208::49)
 To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR03CA0072.eurprd03.prod.outlook.com (2603:10a6:208::49) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.20 via Frontend Transport; Tue, 11 Aug 2020 08:53:32 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8b6230b7-35fe-4a72-9eaa-08d83dd406ba
X-MS-TrafficTypeDiagnostic: BL0PR12MB2578:
X-Microsoft-Antispam-PRVS: <BL0PR12MB2578E4BE0FD1593A1347C4A683450@BL0PR12MB2578.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 08NPQM6XXvy8pO4sLTGEnWwNn0HrJhZN8kWxN2dFYPAIbPy1BOuJWiaBHOmPxuNtA/enNmuVInvkJXll9XMsErxPeZNmnCN6D8ZWEe8NQ7kmOi9Fw/xSOdzKOJyY34k5hL2618SDCRJOIp3kbjW50BZ79dUjMGiHlEXAmgDuifEPK7JReHFVj+frXs2vVNlKuREUSI5WoJ/XfUDwPNWG0hFyl1XWKcLg2GvVue4ehfz8GRaxYYeOXmR+ZZJFqzHg1gJ1/hTh1lH4vUkt+0/98sXJ88liVOaMVjzqMSG9NyKolHpgxnbsm4o66oz3zebuj0QvhcH6ImdV6nthoJMuAOWIOl7OO7+2qp0evWpEFUWrdsa08kFZIJuU7bKMWBZOCLyCNFnJHO33FtJEX3dEXx/cgmL4RMGCHy5gCWICrh0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(366004)(136003)(376002)(346002)(39860400002)(966005)(316002)(36756003)(8936002)(8676002)(6916009)(66476007)(66556008)(66946007)(6486002)(4326008)(186003)(31686004)(478600001)(45080400002)(83380400001)(16526019)(86362001)(52116002)(5660300002)(6666004)(31696002)(2616005)(2906002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 3XSkS0yU71CtdRhXDMHiAXIB+BTgaAjVvl7hZw/ZiwzJCTNPN7FkS+N5EH9az7emXkbq3adCcDoDI+oW9ZdtYJAijJQNt+D3ywRkSWdCNDvkktII+mw0CnfGsyjpiRvokiuzKFz7+/tC1Gg6GaWVEzVtPE7YyW8Nu6ksIxnWaIgtOGXaOrgkzp5FlM//FBAK9PfMV3h6D774z21edj/SlpcBTwRw9vpoc7x1exaQi1R7cDfyRetQcRUuWep6Qx8WRVUfbPXvZsDKeb2NxBhl8WXf6vg3f1huYSPKY/oGDwBvWOakl8W3C/YYL8C+UI28wDEg9KhLkKA0gnvnRgq4bJ/CeKTEmXrsZnN3JWyqib379n+5g0st4lYJoSecffPooGKg24IhcJZN531qtHrYnarKdXn7R91jm4fmK6IE3geib1By0zMID50afHPsy8yxbYEcpoFxwaY2Tbnr1E/Bhfe1E5NHp1XwqZNeDNqoDXrb/l+G8EpI8RfRgvU1Xt1564EX4zsHqX8oVbJwQjGEuZgA3vPFlmu9Ckz5174uN5u41bm5VN73osdM+6DM3MJmL0RWPbqQHD019B62pjFHzpNcZ3wZ0pZuB7dAZGmwRYD7GQsLv0rnKE6KJhn9j2XLaaGZ7yVgL4La4+rOOxbrY+XirgZz3uurfe73YmGx2tyZ9ow8xwsgpgLoOZrvJLflvWXnjKctqTs0Z/YbzAN6/A==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b6230b7-35fe-4a72-9eaa-08d83dd406ba
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2020 08:53:33.0878 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y88qMknxHNFe4lADW7Vd9vLhJsiOXM/sY7hZqccWoLBviEm2Ku0wBt6BqQDp4J+E
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2578
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTEuMDguMjAgdW0gMTA6NDkgc2NocmllYiBEYXZlIEFpcmxpZToKPiBPbiBUdWUsIDExIEF1
ZyAyMDIwIGF0IDE4OjQyLCBDaHJpc3RpYW4gS8O2bmlnCj4gPGNrb2VuaWcubGVpY2h0enVtZXJr
ZW5AZ21haWwuY29tPiB3cm90ZToKPj4gSSd2ZSB0b3RhbGx5IG1pc3NlZCB0aG9zZSBhbmQgc3Rp
bGwgZG9uJ3Qgc2VlIGFueSByZWZlcmVuY2UgaW4gYW55IGluYm94Cj4+IHRvIHRoZSBvcmlnaW5h
bCBtYWlsIG9yIHBhdGNoICMyIGluIHRoaXMgc2VyaWVzLgo+IEkgZm9yZ290IHRvIGNjIHlvdSBv
biB0aGUgb3JpZ2luYWwgcG9zdGluZywgYnV0IHRoZXkgc2hvdWxkIGJlIG9uIGRyaS1kZXZlbAo+
Cj4gaHR0cHM6Ly9uYW0xMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0
dHBzJTNBJTJGJTJGcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZyUyRnNlcmllcyUyRjgwNTE3JTJG
JmFtcDtkYXRhPTAyJTdDMDElN0NjaHJpc3RpYW4ua29lbmlnJTQwYW1kLmNvbSU3QzliYTgwNjhj
NjQ0YTQ5NWIzNWEzMDhkODNkZDM3YjgyJTdDM2RkODk2MWZlNDg4NGU2MDhlMTFhODJkOTk0ZTE4
M2QlN0MwJTdDMCU3QzYzNzMyNzMyNjA3MjkwMTg5MSZhbXA7c2RhdGE9WW9MUkdrU3R5ZE9JUUVa
VUw3cnExT201OHVTTnU2d2o3Yll5N3lFc2hidyUzRCZhbXA7cmVzZXJ2ZWQ9MAoKUmV2aWV3ZWQt
Ynk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4gZm9yIGJvdGgu
Cgo+PiBCdXQgdGhpcyBwYXRjaCBhdCBsZWFzdCBsb29rcyBsaWtlIGl0IG1ha2VzIGEgbG90IG9m
IHNlbnNlLgo+Pgo+PiBCVFc6IERvZXMgYW55Ym9keSBrbm93IHdoeSB3ZSBzZXBhcmF0ZSBiYXNl
IGFuZCBvZmZzZXQgaGVyZT8gVGhhdAo+PiBkaXN0aW5jdGlvbiBzZWVtcyB0byBiZSBzdXBlcmZs
dW91cyBhcyB3ZWxsLgo+IEkgdGhpbmsgYmFzZSBpcyBvbmx5IHVzZWQgZm9yIHByZW1hcHBlZCBv
YmplY3RzLAoKWWVhaCwgYnV0IHRha2UgYSBsb29rIGhvdyBpdCBpcyB1c2VkLiBBcyBmYXIgYXMg
SSBrbm93IHdlIGRvbid0IGhhdmUgYSAKc2luZ2xlIGNhc2Ugd2hlcmUgd2UgZG9uJ3QgZG8gIm1l
bS0+YnVzLmJhc2UgKyBtZW0tPmJ1cy5vZmZzZXQiLgoKSWYgdGhhdCdzIHRydWUgKG5lZWRzIGRv
dWJsZSBjaGVja2luZykgdGhlbiB3aHkgdGhlIGhlY2sgZG8gd2UgaGF2ZSB0d28gCmZpZWxkcyBm
b3IgdGhpcz8KClJlZ2FyZHMsCkNocmlzdGlhbi4KCj4KPiBEYXZlLgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

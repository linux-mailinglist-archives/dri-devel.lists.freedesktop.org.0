Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 914B524B19A
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 11:01:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7F466E914;
	Thu, 20 Aug 2020 09:01:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2045.outbound.protection.outlook.com [40.107.237.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2508B6E088;
 Thu, 20 Aug 2020 09:01:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WykbU1/IjSMVE/vRNOzpklIQqBD0C/ZyLlgF04Ja/7NiTTiiJM/+2XKIhJ5NVDAKZI6UJnGuXnpgSeK6Qa5yep68XxNZ//jp0DhxGuJyoeb0ex3UMc8nSszGJSF8zsVUUXezBDyIQ8vcvN8BQr3RQIwJ/OlEPI6XSgkNcB7cGSPNj+CLEXr3lQ/Bh1J3T2SRZV2kbbeFV+JZgSLCTJZeTqwvpjQN4rth0QG8EXcAv67QIHJujwnUqRBHdU5JmqZGv05HCVRHU4VGRvrDoz7/ea5BguUqqHN1pMugSZvlZ0bRvWJKwLjzH0+KuwwURT/oGVypPVovbsHBjwznVxIfyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ab1FJCII+B+N7LDkMU+8v4/NCmHR1dfE/oYii3ovvTU=;
 b=fYwof8B5304Uim3O2dvP7chzg484avv9bstLhyKDd20H1Mxlz4uu2GGi23D0ySSlh4lcn3o6672ju6PDeBQUiAXed8Ekxrbyl9dXQGvS6nUco/cqgiWypfTghfysovGtjgBavEW2LoumdvxaYEUTgD7s4Skkkf9TwjWUwaokuMqhldGRtfqKuTQsMEWzzW9YFx9XUnBLaP38whLKYlWu7tM0vqWd4UUKJ+EGGXDsvu6J23WAxYqRCUWCx2UR4zHqoWQQbMkhdKFlzlhvmxVZgC7Q3RM3H4MefIfaIqHkbgL2696A6KHW91jdNpnQ46nS+ZPyBnL7TiOyLFTxQoG9Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ab1FJCII+B+N7LDkMU+8v4/NCmHR1dfE/oYii3ovvTU=;
 b=h8MmIUzfhTF18XWNzeypoX9j9uh2YYLRJsxm9d5C7FpssBWAEsKdn3oSf1dY7c3YSLK0FYJxy/7R71Bj9umBPukOBUjdvKTriu6WCGhL0Ny+f/TJJon+4ivuwZI40LH/KKP94MWjOEUKKV4o9w0AxihCX58tN4VLHB+dA/yCwN4=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3677.namprd12.prod.outlook.com (2603:10b6:208:15a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Thu, 20 Aug
 2020 09:01:36 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3283.028; Thu, 20 Aug 2020
 09:01:36 +0000
Subject: Re: [PATCH v2] drivers: gpu: amd: Initialize amdgpu_dm_backlight_caps
 object to 0 in amdgpu_dm_update_backlight_caps
To: Furquan Shaikh <furquan@google.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
References: <20200820052600.3069895-1-furquan@google.com>
 <20200820075241.3160534-1-furquan@google.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <5c7dbcd6-b4c5-f7e5-40d5-b65d8ff58030@amd.com>
Date: Thu, 20 Aug 2020 11:01:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200820075241.3160534-1-furquan@google.com>
Content-Language: en-US
X-ClientProxiedBy: AM4PR0701CA0027.eurprd07.prod.outlook.com
 (2603:10a6:200:42::37) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4PR0701CA0027.eurprd07.prod.outlook.com (2603:10a6:200:42::37) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.10 via Frontend
 Transport; Thu, 20 Aug 2020 09:01:33 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: aa03b1b1-db92-4db3-5f0b-08d844e7a482
X-MS-TrafficTypeDiagnostic: MN2PR12MB3677:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB36772412EEFE666ADA136508835A0@MN2PR12MB3677.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7RyTahbzTnCd0d5zcGGai2lcEby3yy3vrgyeQTp00m21jUr4zd30UxS8joncy6mKIj1NLxo7ybmN3TtHEm6mFS679JUftPXDHto9NlyAFRAYUlVufbBq8+/NDBlIHm/E0rBIyfpb+Ih1zSKOR/eLtokFjg6teySrEBJbKmlAiptZpk3E+g5DmLzJZg+rhfzY3CLpq9cPt0tGX43VMaoDDG0HWFtSp92jlfjZsqgK5AAQGDokjZ/P+32a+4+zJBhVSqm0/Fo2D1WvCUyGnaJFUcBzd0sG0M8DCtvIoqUOcDvG7rbE+oHF+3JZTMUnqhtly7GX3J6D3FyojynSYa6bg9c6oljfqjw+uWZ9sX0wz7VcZN5hZKivdwz2W5KpR7O9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(39860400002)(376002)(396003)(366004)(6486002)(2616005)(186003)(8936002)(5660300002)(6666004)(83380400001)(4326008)(66946007)(6636002)(36756003)(478600001)(52116002)(66556008)(16526019)(66476007)(8676002)(54906003)(86362001)(31696002)(66574015)(110136005)(2906002)(31686004)(316002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: GXUIhDNQej0uPN7MNhLmJ1iP2mIS4NLNeZ9zArSxqKPPMASChug12x6slBYrARywAZLx+gCJ5IaNt94OdeofjMQDi0PRMdNCb996+vdATnXooKBQQIzaRC/R2KJTySdyIkwKUJA5vOdrYNSqaO3weSBgGZ+gY+hPzgPusCJn01PfNDOiz4jNPxATy4b/GGjuoPanzEo17bBKtlObQd6Q2CDXOE1nCN1Y2+277UNz061dZ0KqBUdloWiune6x4d8bKGBZ82RLi3uK3SwiihCRylYcqbYut2vMmk5wzYCbvcS9jbaIQ1PnybRFX1ECmJbI4ib5HiWGRBzUENgiI93cz8/vV4NR10amt9hKWHoalkah/QjAz1f5tq/8z9ROXS+aJK0Z1gP5k5PRilPOKxlE6kcYWVvQjOXsNgivdqjyGU/+rxBI+BhwCvU91IMv2hB65bRlddx6IPhbsw2slSDIeUnDoYlZheVeC7z9roCnn1Svciy1Qx6dharvaROVZOzEs9I69q45Kpt82y51BbslpnVucCxbbBh752yZCrMjEpYocxANjMxohcT989mu8UUBHcPFQp6SCIqn1J1e7E7LK/U9Jt/lPDxhDGtY6xkN2NRFwpvJP5g6aPzuKzQkIuBo/bF2KANsRwOigg4m3Gs7j5ogdW6+MGcvJAV6l5adOfIOFPlzVILDxmNqQDPTJZGaaitYEnc+wdVVMKAGhf+QGw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa03b1b1-db92-4db3-5f0b-08d844e7a482
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2020 09:01:36.3615 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Qj/ZVC6EdqMPYqf2jdW+0sTcRMmUScargtPhXkjEiJGDFXq7XNKlOB9gtATjREd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3677
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
Cc: Stylon Wang <stylon.wang@amd.com>, deepak.sharma@amd.com,
 David Airlie <airlied@linux.ie>, adurbin@google.com,
 Roman Li <roman.li@amd.com>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mikita Lipski <mikita.lipski@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjAuMDguMjAgdW0gMDk6NTIgc2NocmllYiBGdXJxdWFuIFNoYWlraDoKPiBJbiBgYW1kZ3B1
X2RtX3VwZGF0ZV9iYWNrbGlnaHRfY2FwcygpYCwgdGhlcmUgaXMgYSBsb2NhbAo+IGBhbWRncHVf
ZG1fYmFja2xpZ2h0X2NhcHNgIG9iamVjdCB0aGF0IGlzIGZpbGxlZCBpbiBieQo+IGBhbWRncHVf
YWNwaV9nZXRfYmFja2xpZ2h0X2NhcHMoKWAuIEhvd2V2ZXIsIHRoaXMgb2JqZWN0IGlzCj4gdW5p
bml0aWFsaXplZCBiZWZvcmUgdGhlIGNhbGwgYW5kIGhlbmNlIHRoZSBzdWJzZXF1ZW50IGNoZWNr
IGZvcgo+IGF1eF9zdXBwb3J0IGNhbiBmYWlsIHNpbmNlIGl0IGlzIG5vdCBpbml0aWFsaXplZCBi
eQo+IGBhbWRncHVfYWNwaV9nZXRfYmFja2xpZ2h0X2NhcHMoKWAgYXMgd2VsbC4gVGhpcyBjaGFu
Z2UgaW5pdGlhbGl6ZXMKPiB0aGlzIGxvY2FsIGBhbWRncHVfZG1fYmFja2xpZ2h0X2NhcHNgIG9i
amVjdCB0byAwLgo+Cj4gU2lnbmVkLW9mZi1ieTogRnVycXVhbiBTaGFpa2ggPGZ1cnF1YW5AZ29v
Z2xlLmNvbT4KClJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmln
QGFtZC5jb20+Cgo+IC0tLQo+IHYyOiBTd2l0Y2hlZCB0byB1c2luZyBtZW1zZXQgZm9yIGluaXRp
YWxpemF0aW9uIG9mIG9iamVjdC4KPgo+IGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRn
cHVfZG0vYW1kZ3B1X2RtLmMgfCAyICsrCj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9k
bS9hbWRncHVfZG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1k
Z3B1X2RtLmMKPiBpbmRleCBlNGIzM2M2N2I2MzQuLmRhMDcyOTk4Y2U0OCAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwo+IEBA
IC0yODU1LDYgKzI4NTUsOCBAQCBzdGF0aWMgdm9pZCBhbWRncHVfZG1fdXBkYXRlX2JhY2tsaWdo
dF9jYXBzKHN0cnVjdCBhbWRncHVfZGlzcGxheV9tYW5hZ2VyICpkbSkKPiAgICNpZiBkZWZpbmVk
KENPTkZJR19BQ1BJKQo+ICAgCXN0cnVjdCBhbWRncHVfZG1fYmFja2xpZ2h0X2NhcHMgY2FwczsK
PiAgIAo+ICsJbWVtc2V0KCZjYXBzLCAwLCBzaXplb2YoY2FwcykpOwo+ICsKPiAgIAlpZiAoZG0t
PmJhY2tsaWdodF9jYXBzLmNhcHNfdmFsaWQpCj4gICAJCXJldHVybjsKPiAgIAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

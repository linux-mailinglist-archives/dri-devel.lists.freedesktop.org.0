Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4667C232028
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jul 2020 16:15:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C3616E53C;
	Wed, 29 Jul 2020 14:15:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2088.outbound.protection.outlook.com [40.107.237.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2EE96E52E;
 Wed, 29 Jul 2020 14:15:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Slkgi1k37NM1+0lcz05I5x8UmeFXiBUfCQdPyWie/cOMhOmskJ6fCrXfvVymZSmx2tSwS1i2ve3ny6HCgEZCGpSCw51lj9EOO9ozV7GUQmfb/qQos/dl8MehyoKN7UbPIIieAvH/d0pOeT01gS+cw2lc/KrADjuEM/WUz9NjCBccNBO0gGLkGPOlfhX5jQ3gvuAx6X6NzL80ZY4JUwVx0my1VXVDgbbkmoGUt0jGCs8JSwZjXcmPzXoHHc4Qx87z0a8RZa8Tq6vzc3uaFzUeIQ3Rj6NWz7s+o2Z9ecBHwLtxVQ9LnObeqIN0IzqHE5Ly7DLH1j+KD2vJ3bhUgJyIAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YzLVSbW3MY5/aZ3o0JBjZhwYNezZwYxZYT+jj8EzZ1A=;
 b=WfdOSCRx5oexwSak+SVeJQo8fmn5fDd7EUhf5TBXHAFYNQHlQAxSzuF/w2bM20pLTfKmRJFkm3n1iqTNIcSU63encEtgzz3H+aZJr2RWO2ZKZF5JlRNI6PFJNyjXNDcLfbPzJCK9WtuWbGlm/CMPBo1IJX3wIEd5xU82USq4uT+OnIqFJCZhLvF3CGBBqASiXlmNq79Lizy+VjdiX7QapOclOOg1ftzfqZD2ilKC8xD8S859W8evJcmqXDzer3KVmyuQXjFAWLV7P7dH0WhCfe3nE0c6sG+pYaOXIEEjnxb/Z96+mwJ4I1pZ9fQj2c/FHh8iKcty1aZweKakZCff2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YzLVSbW3MY5/aZ3o0JBjZhwYNezZwYxZYT+jj8EzZ1A=;
 b=lrBtE2iZM8LjaRvgWPvobNMrjogM46v5h7or4XohBlNo7VQ+H8QBolyo6k4fHBZyzs0cygbgCDoE9aKMyf+RftwHRBCfPNWGBhQ+GoXy8M+Wnnxmrt2HQjpT1ELhFojqKYj/bX9dEroeRfQMKWxQbcY0fZ+aPzTKzqW2BHttN+M=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from SN1PR12MB2414.namprd12.prod.outlook.com (2603:10b6:802:2e::31)
 by SA0PR12MB4510.namprd12.prod.outlook.com (2603:10b6:806:94::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Wed, 29 Jul
 2020 14:15:45 +0000
Received: from SN1PR12MB2414.namprd12.prod.outlook.com
 ([fe80::657c:114:220c:88f9]) by SN1PR12MB2414.namprd12.prod.outlook.com
 ([fe80::657c:114:220c:88f9%7]) with mapi id 15.20.3239.017; Wed, 29 Jul 2020
 14:15:45 +0000
Subject: Re: [PATCH 1/1] drm/ttm: fix offset in VMAs with a pg_offs in
 ttm_bo_vm_access
To: christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
References: <20200728182704.1809-1-Felix.Kuehling@amd.com>
 <9994a650-8065-c51c-6454-47064d20c729@gmail.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <7c389ab3-4322-ebd5-f042-e80204dbcfbc@amd.com>
Date: Wed, 29 Jul 2020 10:15:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <9994a650-8065-c51c-6454-47064d20c729@gmail.com>
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0062.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::31) To SN1PR12MB2414.namprd12.prod.outlook.com
 (2603:10b6:802:2e::31)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.120.80.228) by
 YT1PR01CA0062.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.16 via Frontend Transport; Wed, 29 Jul 2020 14:15:44 +0000
X-Originating-IP: [142.120.80.228]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8a72e61c-02aa-4c38-2ee8-08d833c9e221
X-MS-TrafficTypeDiagnostic: SA0PR12MB4510:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB45101F0C31343183883F777092700@SA0PR12MB4510.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sHR5O+3pFltfEfwOr+WKKFilh6tevzFzSrsl1NFZe9zlYW2rkFEmNj1+DfhF2ImOZJ7EwpBduDwdGHT2PQ9Q+jVOPe0F18EFkEhm/QjkHHIX4ltSDtPezw3CeKyhkOXNPbgG2R+lgYyehVvyi62u9/9tpNff+f/V01LuU3IRVhZS+cUYTap96bUjRL6UayBN7jXxMpN3yM6cheUiXu1G1rS2M0Tcl06h52u9mce20sIMbLeH4xgv+bSz7DxpgQ6JvYjGrfCV+c/z7RMuMqMC/evQqIqxiTN0vWQ+WrqZxO80cDW08pcH5K49R1MwShKlklH7/QHI5ZT/XHFMS8kgHWxePS17/bWfHfjsZ0vBwYMLmeKMIXgS13Pn9R+gj+BB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN1PR12MB2414.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(396003)(366004)(136003)(346002)(39860400002)(66476007)(86362001)(36756003)(8936002)(83380400001)(6862004)(6636002)(8676002)(52116002)(31686004)(66556008)(31696002)(2906002)(26005)(186003)(956004)(450100002)(2616005)(478600001)(66574015)(5660300002)(316002)(44832011)(37006003)(16526019)(4326008)(16576012)(66946007)(6486002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: gZL8kOhGW1xbzwSQZFAYjGNDtDUTUjiIZjD4odSpVY1sL9GoOiy2aOf5v2y9PbgAayee4J2NLgyjH6jrupB1EzubVgaF9XOIAtowlrVrDw8uFyp4VAApMhqVTx894phCj+2No19RWYoDeOJJan03pGPIDIgfO0+tZWR8R+726WsDFjjOXqdAH9RPPR8IR9p1J/+zbf9EIbHCaTS+3+9NWoK3w+Lps0uRFmBh2qd+m6mvnWSAFUHuMzP768MsHAkkXdKFUbhpkBMWnpYBbbypjIfAroDcikF1p9wVnvChlc09cUf0iMXgJe49FWHwWng8d21/dMg0RK+V5k7LgpVt4H0+deddlTpU/kA+m5HUlHfWfpBin3v/hsCX8wHJWU6xUg5ZuJihkyUyTX/bz1V5VVdFardsGJdZ8YmznZjpMj4Y+uUzN+lVkAdOrizqiY2kEzNIOY9M/xqUxjDFR7DrJHTJLVkhcPvQovtBeV1GMSmnPgjul2c8kTJr/nGGIx6N
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a72e61c-02aa-4c38-2ee8-08d833c9e221
X-MS-Exchange-CrossTenant-AuthSource: SN1PR12MB2414.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2020 14:15:45.1881 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KypXCP8pupdklnNd6b/HK0zjMmNwuoULlXcQZK3FFPR2nSmEHzf5ejFONH+eXzCdPJgUlx0pE1UwmiprR2e8wA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4510
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
Cc: laurent.morichetti@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjAyMC0wNy0yOSB1bSA0OjA4IGEubS4gc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOgo+IEFt
IDI4LjA3LjIwIHVtIDIwOjI3IHNjaHJpZWIgRmVsaXggS3VlaGxpbmc6Cj4+IFZNQXMgd2l0aCBh
IHBnX29mZnMgdGhhdCdzIG9mZnNldCBmcm9tIHRoZSBzdGFydCBvZiB0aGUgdm1hX25vZGUgbmVl
ZAo+PiB0byBhZGp1c3QgdGhlIG9mZnNldCB3aXRoaW4gdGhlIEJPIGFjY29yZGluZ2x5LiBUaGlz
IG1hdGNoZXMgdGhlCj4+IG9mZnNldCBjYWxjdWxhdGlvbiBpbiB0dG1fYm9fdm1fZmF1bHRfcmVz
ZXJ2ZWQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEZlbGl4IEt1ZWhsaW5nIDxGZWxpeC5LdWVobGlu
Z0BhbWQuY29tPgo+PiBUZXN0ZWQtYnk6IExhdXJlbnQgTW9yaWNoZXR0aSA8bGF1cmVudC5tb3Jp
Y2hldHRpQGFtZC5jb20+Cj4KPiBSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0
aWFuLmtvZW5pZ0BhbWQuY29tPgo+Cj4gR29pbmcgdG8gcGljayB0aGF0IHVwIGZvciBpbmNsdXNp
b24gaW4gZHJtLW1pc2MtbmV4dC4KClRoYW5rcy4gSSdsbCBzdWJtaXQgaXQgdG8gYW1kLXN0YWdp
bmctZHJtLW5leHQgc28gaXQgbWFrZXMgaXRzIHdheSBpbnRvCm91ciBES01TIGJyYW5jaCBxdWlj
a2x5LgoKQWxleCwgd291bGQgeW91IHB1c2ggdGhpcyB0byBkcm0tZml4ZXM/CgpSZWdhcmRzLArC
oCBGZWxpeAoKCj4KPj4gLS0tCj4+IMKgIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3ZtLmMg
fCA0ICsrKy0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdm0uYwo+
PiBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3ZtLmMKPj4gaW5kZXggMzg5MTI4YjhjNGRk
Li42MGI0MTQ0N2JlYzggMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2Jv
X3ZtLmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdm0uYwo+PiBAQCAtNDA1
LDggKzQwNSwxMCBAQCBzdGF0aWMgaW50IHR0bV9ib192bV9hY2Nlc3Nfa21hcChzdHJ1Y3QKPj4g
dHRtX2J1ZmZlcl9vYmplY3QgKmJvLAo+PiDCoCBpbnQgdHRtX2JvX3ZtX2FjY2VzcyhzdHJ1Y3Qg
dm1fYXJlYV9zdHJ1Y3QgKnZtYSwgdW5zaWduZWQgbG9uZyBhZGRyLAo+PiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHZvaWQgKmJ1ZiwgaW50IGxlbiwgaW50IHdyaXRlKQo+PiDCoCB7Cj4+
IC3CoMKgwqAgdW5zaWduZWQgbG9uZyBvZmZzZXQgPSAoYWRkcikgLSB2bWEtPnZtX3N0YXJ0Owo+
PiDCoMKgwqDCoMKgIHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8gPSB2bWEtPnZtX3ByaXZh
dGVfZGF0YTsKPj4gK8KgwqDCoCB1bnNpZ25lZCBsb25nIG9mZnNldCA9IChhZGRyKSAtIHZtYS0+
dm1fc3RhcnQgKwo+PiArwqDCoMKgwqDCoMKgwqAgKCh2bWEtPnZtX3Bnb2ZmIC0gZHJtX3ZtYV9u
b2RlX3N0YXJ0KCZiby0+YmFzZS52bWFfbm9kZSkpCj4+ICvCoMKgwqDCoMKgwqDCoMKgIDw8IFBB
R0VfU0hJRlQpOwo+PiDCoMKgwqDCoMKgIGludCByZXQ7Cj4+IMKgIMKgwqDCoMKgwqAgaWYgKGxl
biA8IDEgfHwgKG9mZnNldCArIGxlbikgPj4gUEFHRV9TSElGVCA+IGJvLT5udW1fcGFnZXMpCj4K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

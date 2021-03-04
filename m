Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F21C32D8B8
	for <lists+dri-devel@lfdr.de>; Thu,  4 Mar 2021 18:40:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0E876EA4F;
	Thu,  4 Mar 2021 17:40:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061.outbound.protection.outlook.com [40.107.237.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A04C46EA4F;
 Thu,  4 Mar 2021 17:40:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HxN1XVCEjn47/NQNf1KRDpzr3D13XoW+ZLh+7sARBwk9FIbx8n3DqZPlBM2wCofygLy0N9rAal7ALP002/1/s7Zjc/ysFkXHqxbyNGtQXAineSg5RGfQrJKdNqHW4iQ1MEI96SIi7NA2VyqZdLEhZZDbiDEWanFvWgDCN7B7g31DLgAztU1a2wz6WbrGo3I+nE186V7wKSP7Ck0gjn5rn8yEhL/vr9VoLYrBGXDHs8oSATX/VZOwT/f1ceATt01/iHXElXj6CmNH1Tnf8fQYvHiJXST+l0m0ID6WpRXW0H3f+2Ir3Y7nzXnq9pY/tu4Jcy17Mn7jRaFF9WW8FUuSRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IcCQJq++TbGxrZbG10G5QIv/rE0zdli6zcc5wr73zFA=;
 b=bRQvomyZ9D2TxypdiguugcC/OcC44YO+1IxKHDyJDzh0pRxlpAKIpEzTV9Ww+sFWl/gOzNTdG26Zu/VTkUHYVyHDa/hNNOnHPa96075Xmn+Gzm0RTTI/Sl+ahih372Sqj7RLKVvzumbtPsxRo5KJQ2rYSovmxTplS2TY8B+iFQCg4TFnzkfnQ0ibWyyispnXqn3hRiaMPK96H8A47Rat8HX/W6AbCaJ5D//yDtketDm0DyDNINhJyw770A36Kc9tP9fInaffiCxvH/dpQXu3Ux1P397F0mPSVQlyEntjOJjqtZmuTeIzytlqcYrmFIZnolnnDn6aOs55tcUYUSxkng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IcCQJq++TbGxrZbG10G5QIv/rE0zdli6zcc5wr73zFA=;
 b=sSvQvxEzd/9upzJUkFHGq7aCiKQlbGSaL/A1V89jqEXuKQGXFqQkb5R30yMhJahHUl/O5hq0cKC6bfA0h0izo34W11Ja1XYDZwpopVpCleSqoXJmPtKwfmwCH6aVW9KBPfqVKyEWF2QZxO9Gu0/QywWQVOVG9CbuoLc1pfsiGaQ=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from BY5PR12MB4097.namprd12.prod.outlook.com (2603:10b6:a03:213::20)
 by BYAPR12MB3526.namprd12.prod.outlook.com (2603:10b6:a03:13d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20; Thu, 4 Mar
 2021 17:40:21 +0000
Received: from BY5PR12MB4097.namprd12.prod.outlook.com
 ([fe80::a8bd:e678:1c74:94f1]) by BY5PR12MB4097.namprd12.prod.outlook.com
 ([fe80::a8bd:e678:1c74:94f1%8]) with mapi id 15.20.3890.032; Thu, 4 Mar 2021
 17:40:21 +0000
Subject: Re: [PATCH] drm/ttm: ioremap buffer according to TTM mem caching
 setting
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Oak Zeng <Oak.Zeng@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, brahma_sw_dev@amd.com
References: <1614873891-5836-1-git-send-email-Oak.Zeng@amd.com>
 <69501a46-ffbe-437c-3651-03400b3455a5@amd.com>
 <4fd6a67c-34dd-9510-4057-835c0c8eb190@gmail.com>
From: "Bhardwaj, Rajneesh" <rajneesh.bhardwaj@amd.com>
Message-ID: <cc59a59a-116e-68d7-88fd-6c359a5e98c5@amd.com>
Date: Thu, 4 Mar 2021 12:40:17 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <4fd6a67c-34dd-9510-4057-835c0c8eb190@gmail.com>
Content-Language: en-US
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YTOPR0101CA0044.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::21) To BY5PR12MB4097.namprd12.prod.outlook.com
 (2603:10b6:a03:213::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.4.42.239] (165.204.55.251) by
 YTOPR0101CA0044.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.23 via Frontend
 Transport; Thu, 4 Mar 2021 17:40:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3e1d57fb-75a5-4dd9-f53f-08d8df349528
X-MS-TrafficTypeDiagnostic: BYAPR12MB3526:
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR12MB35265E612847BFD4BCD1E13FFE979@BYAPR12MB3526.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8GBmt3uovHKlUpRxRgIzWEbYePW26G4EcBoCumC3/h6vS8C28Z6XQI8fJJzgCXUfYwiVTAXD52nO5ceHbPCJ5RZRntlTTiB1z1s9oCgaONvPfeAD9U4WdeIgZjWoraLmmb1m5BUF4Qn1E30C2dlA+DxvLMmugj3cd+rnVL98AlM4JwxI0LsrsMK8op0iINozi+CC7VwlWOECvltNK8u8db7MLdeSZ74xDwFO2oOiEpZy/yYlbVsSNTe8zXvjDrfRicdBtqRZotb754dYLTbbAh5EN2oT1agOGCmorykHNtyqLRvvcCUEApQif7BJ5N2o25FixjHEO+i3/8p6+hsOxM+XXlGT11xqWdDf7cCgaxrBHGn52vwsNwrqLbdphTP27E9I8ocWZQAAklC3TkD+QXRpmyl8aEfRtAaNFxcnOskVrhMNvR5oAK8cNI3iRVss+lEpX0TucOqcKoneLQ83yCk6EbbDwVK7GcM9u4ULgl7kRLgXjyHD6DtynRJ2FPDOy9DbBnRzOhIcrXc7RdWtoD/tB0Oq8DJ+fmufJepPwNL+PH9NJTDE9SHC0NmfJLmI1KeCGxQDMABoTXyaZ3SCwVu1soeDEoQMEVqyuUa+Yvck7bHL22DGEo+Nxq4nZOrhDWavGIqpmD/TS8Lz+RhJgg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4097.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(346002)(376002)(136003)(39860400002)(8676002)(52116002)(478600001)(45080400002)(956004)(86362001)(31696002)(66556008)(66946007)(6486002)(66476007)(16576012)(2616005)(186003)(16526019)(316002)(36756003)(31686004)(53546011)(8936002)(4326008)(6636002)(5660300002)(26005)(2906002)(966005)(110136005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MHRBdU9heWJHcGhFRHhRR3k5bWVpZmtwNmZNay85cjdKUUp5bC95bm10cC9l?=
 =?utf-8?B?LzJRc2krZnF6NW9TSncwNStwdGtzOWYvc3hqL1ZnazBuMU9ua3VZTjNtdTRS?=
 =?utf-8?B?NUFpWnlFVWRMdXVsMmNIdFFXamFuMDhKZ01ieFFKSXFUSlQ2c3pPMkhOWmdC?=
 =?utf-8?B?OWpXak4vR0FiME55S0ZqM2thSldRZmhXQzFFenYwVFNha29FTmp4eldnUHE5?=
 =?utf-8?B?VEhXa1dJdE4wOCtYZFJDNGRWVHNJZnh1ZUNZOUxNVmlXcFNJME9nS1ZsYkxh?=
 =?utf-8?B?YmNNamtBNFpBeHh6OVlISE9jT0Mya1hNR3RBRFpSK2EvdHVmNmNJd054cnBt?=
 =?utf-8?B?RlQ1NXJ3bTY0Nm9IaXkxelRmc1UxMXI5WjNhUHFiMnp6Sms0dWlHelQyandS?=
 =?utf-8?B?Zk9kcDBpZHVVOFJwbW5kcjloL2tsZm9YYUVZbnozSHF4bm42SUZPYW9WbWJm?=
 =?utf-8?B?ZVQwZ2NtQ0J5b09mME44Mk9vaDAvNlJPbjArQVBEVDA5ck51SUJvbjlEM2hR?=
 =?utf-8?B?NW5MUkpMWWowekZlc2MyRll2dEZyTUJPUUJQL1lha3ozNjhGWmdPTjFETms1?=
 =?utf-8?B?b1RxakdiVWxERGpWWkpGcUhUZERLUUl0YnRVSU80eUxNT0tOZjMybXZNa1Qz?=
 =?utf-8?B?NmMyOFRqNjk3NUZDdXZhMTlLZDF6dkxaWnlaOFpFOEROZjRFbHdJWWI2YUNV?=
 =?utf-8?B?dU5uRVZvWDNIUGs4bjBKSURVNEFkMFhEZkl4ZEdjT2IvTmJlWlpaL0ZhcVZn?=
 =?utf-8?B?ZzlFN1JnODZsVzJERnArbnhhU00xeVFjWUtFQi9yYnRoeXFMQWRYNUpTYlli?=
 =?utf-8?B?a2w1LzNKSFUxRVJXMDVXNHZTRjAxMGp0VndGTmdQbjl0MXpKWE5zN3RXOTlM?=
 =?utf-8?B?aURmKzYxMTRCTXIzS2lVQ1kvWVYrM1VsQUJMaGVmYUNuUXBHUUM5YzNyWjlN?=
 =?utf-8?B?RFBKSFBOczZCQjRjbWFsRi9wanRIdys3eit1NGVKUHdXWHFKTGFRMzFTUVhS?=
 =?utf-8?B?UldGK2syOWgxc20ramxLeDhFQzRjWU5IY2Zva0JSRzNHcUtFamtGcEllSjE5?=
 =?utf-8?B?aEVLWnhaNUo5U01rU2UxT0RLT3E5dzhDRll0RXpEOU9wa1ZFbkE1bFR3WW4y?=
 =?utf-8?B?WUY1RGVlYXBHWmIwVXU2WGxlemhDanZPMGF4Y0FiZVpkcHpRbXdyZWJvOExZ?=
 =?utf-8?B?cDF2RVJiZi9sRllWMStheDhzQk13YVZHL1dDU0NWU3Q5dkdPR0M1OWllVG5r?=
 =?utf-8?B?MDFpTXpyNE92dTFRdG85dG9CSC9lSHEybVpxQndNZEtqM09EMlh3L0IxUkFX?=
 =?utf-8?B?cWZQRGhZeDRmNkJXdnBPbFUrUkh5VGtNaXkzbnZ0R3E3dzV6K3loc1M0R1ll?=
 =?utf-8?B?eVNUWWgvUVkwT3loUzdaMzAvbDdIWHZMdW10bnFsdlFTK2RuS0lhZ1l0eVVK?=
 =?utf-8?B?RUsvTFl6QVV6YWpUTkFTY0lVc3I1MVJzR0tqcmRmcHRabUgwcFZCQmJKa1BY?=
 =?utf-8?B?dmtrNHIzb283MktVZmUzcVIrekVnU3V5U01JUkJDWUVRU096MUYrckFLY0o1?=
 =?utf-8?B?U09SU09aSDUrSnNMLy9vSGIvQi8rOEU3UTNFOVMrUEF0RzRkdnBrblBLdG9u?=
 =?utf-8?B?Y1VnYmtLZnBibEdvekZjbjJPNy9NYitESkdpc3FsZkhXUHRXcDVvU0xzWERL?=
 =?utf-8?B?c240S0dvcXMvbEFvb2hSR2NubFlZZTFQR1pSSEhYbTVtTnRYclJUc0JUL3pZ?=
 =?utf-8?Q?QC/9hZw4W+gIBZ1eZaRBQXD3Dd+ibIh23xwjhF6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e1d57fb-75a5-4dd9-f53f-08d8df349528
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4097.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2021 17:40:21.0162 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wLZf5mkKV2PoswVQyTEvAR3Knmkv8dYH74/noXif3vPPoqFFgbIgNuf7WsxBm3VlGbLcSkJLrIspdkKx+GxDxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3526
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
Cc: Alexander.Deucher@amd.com, jinhuieric.huang@amd.com, Felix.Kuehling@amd.com,
 harish.kasiviswanathan@amd.com, christian.koenig@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDMvNC8yMDIxIDEyOjMxIFBNLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+IFtDQVVUSU9O
OiBFeHRlcm5hbCBFbWFpbF0KPgo+IEFtIDA0LjAzLjIxIHVtIDE4OjAxIHNjaHJpZWIgQmhhcmR3
YWosIFJham5lZXNoOgo+PiBJIHdhcyB3b25kZXJpbmcgaWYgYSBtYW5hZ2VkIHZlcnNpb24gb2Yg
c3VjaCBBUEkgZXhpc3RzIGJ1dCBsb29rcyBsaWtlCj4+IG5vbmUuIFdlIG9ubHkgaGF2ZSBkZXZt
X2lvcmVtYXBfd2MgYnV0IHRoYXQgaXMgdmFsaWQgb25seSBmb3IKPj4gUEFHRV9DQUNIRV9NT0RF
X1dDIHdoZXJlYXMgaW9yZW1hcF9jYWNoZSB1c2VzIF9XQi4gT25lIG1vcmUgc21hbGwKPj4gY29t
bWVudCBiZWxvdy4KPj4KPj4KPj4gQWNrZWQtYnk6IFJham5lZXNoIEJoYXJkd2FqIDxyYWpuZWVz
aC5iaGFyZHdhakBhbWQuY29tPgo+Pgo+PiBPbiAzLzQvMjAyMSAxMTowNCBBTSwgT2FrIFplbmcg
d3JvdGU6Cj4+PiBJZiB0Ym8ubWVtLmJ1cy5jYWNoaW5nIGlzIGNhY2hlZCwgYnVmZmVyIGlzIGlu
dGVuZGVkIHRvIGJlIG1hcHBlZAo+Pj4gYXMgY2FjaGVkIGZyb20gQ1BVLiBNYXAgaXQgd2l0aCBp
b3JlbWFwX2NhY2hlLgo+Pj4KPj4+IFRoaXMgd2Fzbid0IG5lY2Vzc2FyeSBiZWZvcmUgYXMgZGV2
aWNlIG1lbW9yeSB3YXMgbmV2ZXIgbWFwcGVkCj4+PiBhcyBjYWNoZWQgZnJvbSBDUFUgc2lkZS4g
SXQgYmVjb21lcyBuZWNlc3NhcnkgZm9yIGFsZGViYXJhbiBhcwo+Pj4gZGV2aWNlIG1lbW9yeSBp
cyBtYXBwZWQgY2FjaGVkIGZyb20gQ1BVLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IE9hayBaZW5n
IDxPYWsuWmVuZ0BhbWQuY29tPgo+Pj4gUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLb25pZyA8Q2hy
aXN0aWFuLktvZW5pZ0BhbWQuY29tPgo+Pj4gLS0tCj4+PiDCoCBkcml2ZXJzL2dwdS9kcm0vdHRt
L3R0bV9ib191dGlsLmMgfCAxNCArKysrKysrKysrKysrKwo+Pj4gwqAgMSBmaWxlIGNoYW5nZWQs
IDE0IGluc2VydGlvbnMoKykKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0
bS90dG1fYm9fdXRpbC5jCj4+PiBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3V0aWwuYwo+
Pj4gaW5kZXggMDMxZTU4MS4uNzQyOTQ2NCAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS90dG0vdHRtX2JvX3V0aWwuYwo+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9f
dXRpbC5jCj4+PiBAQCAtOTEsNiArOTEsMTAgQEAgc3RhdGljIGludCB0dG1fcmVzb3VyY2VfaW9y
ZW1hcChzdHJ1Y3QgdHRtX2RldmljZQo+Pj4gKmJkZXYsCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGlmIChtZW0tPmJ1cy5jYWNoaW5nID09IHR0bV93cml0ZV9jb21iaW5lZCkKPj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGFkZHIgPSBpb3JlbWFwX3djKG1lbS0+YnVzLm9mZnNldCwg
YnVzX3NpemUpOwo+Pj4gKyNpZmRlZiBDT05GSUdfWDg2Cj4+Cj4+Cj4+IFBsZWFzZSB1c2UgI2lm
IGRlZmluZWQgKENPTkZJR19YODYpCj4KPiBBY3R1YWxseSAjaWZkZWYgaXMgdXN1YWxseSBwcmVm
ZXJyZWQuCgpvb3BzLCBpIHdhcyByZWZlcnJpbmcgdG8gSVNfRU5BQkxFRCAoQ09ORklHKSBhbmQg
bm90IGlmIGRlZmluZWQuCgoKPgo+IENocmlzdGlhbi4KPgo+Pgo+Pj4gK8KgwqDCoMKgwqDCoMKg
IGVsc2UgaWYgKG1lbS0+YnVzLmNhY2hpbmcgPT0gdHRtX2NhY2hlZCkKPj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGFkZHIgPSBpb3JlbWFwX2NhY2hlKG1lbS0+YnVzLm9mZnNldCwgYnVzX3Np
emUpOwo+Pj4gKyNlbmRpZgo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGVsc2UKPj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGFkZHIgPSBpb3JlbWFwKG1lbS0+YnVzLm9mZnNldCwgYnVzX3Np
emUpOwo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGlmICghYWRkcikgewo+Pj4gQEAgLTM3Miw2ICsz
NzYsMTEgQEAgc3RhdGljIGludCB0dG1fYm9faW9yZW1hcChzdHJ1Y3QKPj4+IHR0bV9idWZmZXJf
b2JqZWN0ICpibywKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAobWVtLT5idXMuY2FjaGluZyA9
PSB0dG1fd3JpdGVfY29tYmluZWQpCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtYXAt
PnZpcnR1YWwgPSBpb3JlbWFwX3djKGJvLT5tZW0uYnVzLm9mZnNldCArIG9mZnNldCwKPj4+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzaXpl
KTsKPj4+ICsjaWZkZWYgQ09ORklHX1g4Ngo+Pj4gK8KgwqDCoMKgwqDCoMKgIGVsc2UgaWYgKG1l
bS0+YnVzLmNhY2hpbmcgPT0gdHRtX2NhY2hlZCkKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IG1hcC0+dmlydHVhbCA9IGlvcmVtYXBfY2FjaGUoYm8tPm1lbS5idXMub2Zmc2V0ICsgb2Zmc2V0
LAo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHNpemUpOwo+Pj4gKyNlbmRpZgo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGVsc2UKPj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1hcC0+dmlydHVhbCA9IGlvcmVtYXAoYm8tPm1lbS5idXMu
b2Zmc2V0ICsgb2Zmc2V0LAo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgc2l6ZSk7Cj4+PiBAQCAtNDkwLDYgKzQ5OSwxMSBAQCBpbnQg
dHRtX2JvX3ZtYXAoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywKPj4+IHN0cnVjdCBkbWFf
YnVmX21hcCAqbWFwKQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGVsc2UgaWYgKG1lbS0+YnVzLmNh
Y2hpbmcgPT0gdHRtX3dyaXRlX2NvbWJpbmVkKQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgdmFkZHJfaW9tZW0gPSBpb3JlbWFwX3djKG1lbS0+YnVzLm9mZnNldCwKPj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYm8tPmJhc2Uuc2l6
ZSk7Cj4+PiArwqDCoMKgwqDCoMKgwqAgZWxzZSBpZiAobWVtLT5idXMuY2FjaGluZyA9PSB0dG1f
Y2FjaGVkKQo+Pj4gKyNpZmRlZiBDT05GSUdfWDg2Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB2YWRkcl9pb21lbSA9IGlvcmVtYXBfY2FjaGUobWVtLT5idXMub2Zmc2V0LAo+Pj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJvLT5iYXNlLnNp
emUpOwo+Pj4gKyNlbmRpZgo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGVsc2UKPj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHZhZGRyX2lvbWVtID0gaW9yZW1hcChtZW0tPmJ1cy5vZmZzZXQs
IGJvLT5iYXNlLnNpemUpOwo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+PiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+PiBhbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwo+PiBodHRwczovL25hbTExLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2su
Y29tLz91cmw9aHR0cHMlM0ElMkYlMkZsaXN0cy5mcmVlZGVza3RvcC5vcmclMkZtYWlsbWFuJTJG
bGlzdGluZm8lMkZhbWQtZ2Z4JmFtcDtkYXRhPTA0JTdDMDElN0NyYWpuZWVzaC5iaGFyZHdhaiU0
MGFtZC5jb20lN0NjNDM4NjU0NGVhMTA0ODdkM2EwYzA4ZDhkZjMzNjNhMSU3QzNkZDg5NjFmZTQ4
ODRlNjA4ZTExYTgyZDk5NGUxODNkJTdDMCU3QzAlN0M2Mzc1MDQ3NTkyNjQ3OTM5NzAlN0NVbmtu
b3duJTdDVFdGcGJHWnNiM2Q4ZXlKV0lqb2lNQzR3TGpBd01EQWlMQ0pRSWpvaVYybHVNeklpTENK
QlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4wJTNEJTdDMTAwMCZhbXA7c2RhdGE9bk0yVXRRUWRBY3R5
YXBmWlNyaGZ4JTJCb0olMkJkc3pWNFlwNjJMVGVoc1VXd1klM0QmYW1wO3Jlc2VydmVkPTAgCj4+
Cj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

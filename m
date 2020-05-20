Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F921DB849
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 17:33:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CD356E869;
	Wed, 20 May 2020 15:33:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2082.outbound.protection.outlook.com [40.107.220.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D80136E866;
 Wed, 20 May 2020 15:33:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CLs/tZNjLLKZ2cdQNfFYE82HIKXCdIIjnGQi7e3b31ojVTmQZ5GcoA3aZng1NKHjr1q1adRqj3LMBwndlv0lg1R2AcjQD3LwP9LRrKfouo3SEb+wT4jbxpob4eQd6TGnxwNEEzZs3gRknU9Fj8ivCJildZkErzeTbyHffHRM0SXmGDOF8nBrA6Q4qxmIg+D2hSE+SB1YAtidc9SlvSMWtyd/j9wytZADAZYS/jxKWdyxf7lu0y78fYrCx7JVpY3djtbJBDtfmwsQR1zGBEkjkJIujyY8WynP3370LZFCWNwqexzBXwJm1FeswWKZLMKz4YbRZHSZF62kldQY1TTdUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jqIYvwL+bBitemeEj0cdFHAsoqcJqmYyC5i3nr1s7UY=;
 b=VXAj64pxtZD8IR2jgEbeSZjSwmpxtqAPw4tIDHAIwU5VKhMrOf1R4lwJYLz/J+GcOD0kXeXX/CzptZr6GlbBayvT87MmnLhG1HpggW3RHet5Scl3CvOEI9rysKFfnpeOJXCWoellnnAPWvz+GoLQg8tV9YMReiNXyf6G+Kra7UQlqphAKwrNtifqqJc3vfQTSW7VZaj6679JDAA7pSwSOlfYpCLgT2bPvLgwRnz6mCmghTMXXGyFZfDqMWQEzWVrxZjYxm/ucwX0fNS289yOlE2VdV7pKnrilQgeDF0pWely+iwFbmTGl0rsBXgarfHSmpVPg8JZdeRfbCuhUabL4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jqIYvwL+bBitemeEj0cdFHAsoqcJqmYyC5i3nr1s7UY=;
 b=XdKcUkJHI901bpTUAYNWfsZbcDRcQ6eHYPQPaw6DjkyXsPavAKLdUqfWu0+zhKElAY1fIUaiNe9WRQ/8Tf6WzQ6W6NxTy141jM/LTetzWUEbQZ1OXBITY8yRNDf7Z+iJBDPI1XLyoAetBNdT45VFLQWQMIdrNL8XACvMQVC2IOM=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4401.namprd12.prod.outlook.com (2603:10b6:5:2a9::15)
 by DM6PR12MB3500.namprd12.prod.outlook.com (2603:10b6:5:11d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.27; Wed, 20 May
 2020 15:33:06 +0000
Received: from DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766]) by DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766%3]) with mapi id 15.20.3021.020; Wed, 20 May 2020
 15:33:06 +0000
Subject: Re: [PATCH v3] drm/amdgpu: off by one in
 amdgpu_device_attr_create_groups() error handling
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Alex Deucher <alexander.deucher@amd.com>, Kevin Wang <kevin1.wang@amd.com>
References: <14063C7AD467DE4B82DEDB5C278E8663010E2302FA@FMSMSX108.amr.corp.intel.com>
 <20200520152556.GQ3041@kadam>
 <14063C7AD467DE4B82DEDB5C278E8663010E230378@FMSMSX108.amr.corp.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <d8b26176-b3f7-500a-50f8-9282f615ec74@amd.com>
Date: Wed, 20 May 2020 17:32:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <14063C7AD467DE4B82DEDB5C278E8663010E230378@FMSMSX108.amr.corp.intel.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR10CA0103.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::20) To DM6PR12MB4401.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR10CA0103.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3021.23 via Frontend Transport; Wed, 20 May 2020 15:33:02 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ad7ab873-c8d2-4d6c-7b59-08d7fcd3178e
X-MS-TrafficTypeDiagnostic: DM6PR12MB3500:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB35003F8B3A9A76A825E4E97783B60@DM6PR12MB3500.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-Forefront-PRVS: 04097B7F7F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PqMTHP9d8aMrsC6T37+ptJdK/3Lk6ZHw6f6DUmTrNX+W5igL4zI14+jhumN6RhkWq8SrS4UTDSHEiFOOY5bxLxPhAoTQuhaeMr6/OR6wUVqK0GJPiiE/k3gpjSup+3fxw38HnHT9fS7Rgu98cma+ZTR16LFx1YFJHgV2h9yrjpl914ym9J1Vd64EFoyTP/YaRqO3mEiU2sPWbeSfkZhopX9oGwH+c6CB0p61B7lo8J43dXianQZspd6Z/T1+k+i7PpEcwUZT4fOn3lgECl0oq/fH4RxJCMralyTi1yB9LPBKHRwWjmDR8ujMJoE86rLj6i9y/oF27zvRc1t5ufUDRKJng0SAUeO9v4HQQcfBVS8zB0mmBKTAIUeR0Hsl/VGaOOrlk0C/KJx4+REr3AbEpOZFKNaIIAnb3BG5cCTZblIYfBcNz4wV3malidPLzytJueWHFWpW+tMp5GNNICp+RMe1Kq8hV9iAafK4Z5bA83mRT3knSbxxT5lXEYT+Ph9k
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4401.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(136003)(39860400002)(376002)(346002)(396003)(54906003)(316002)(86362001)(478600001)(8676002)(31696002)(53546011)(110136005)(4326008)(6636002)(5660300002)(186003)(16526019)(6666004)(36756003)(66946007)(31686004)(52116002)(6486002)(8936002)(2906002)(2616005)(66476007)(66556008)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: H3hNbOzIfOZUXvuoNw0EQ6DNNr2iHVs+J798n5xE1sPSoVW9p/kU1g2ws6cD+kCygfTfIs3t4koQHz+vse08nAox6p/nFJlS4SiYWV2if26ixFLWtdKi/aLcuVWMUbEhKRNZJ1pfLMHfB3d71MvdJRqZM+9+HHTNvnUMNTop6qc9QNSFGbN4hgdhDIU05PQwx1OxkR2mkxCnwLhRQnNK7mCVB92oVshCM0G2DrZ2rn5tMTpRaUakkfAvdJq9qPynFxq0lF4pXqli+aHMuD6Rs1FGOW8aQmbESqZHeB/q0pzY90kUqKg/3gxVgHfh+zsNgpKpDMC4IbyBNr0o3Txxh4xLg0IwM7c5yxXhJaJYV7HwFk3TV3qot5O3L2timKDLbfoN/CZr1VzNqWkC/K0AyjZfSWQPp/CL5kSHymRCT0T3JOInfxlQTXV3Wny6J8QDPGu0CziqL0nWyR2VvUF8eXc4XMHcNS6S7xWp1UfnqukTezK1Ci9z1ULe/LilSWicntslQANOBH57kKxetd6Er+Up4NY7FxDzyaAh+q+UOEsCYv0PYmkarK6joVUqHERm
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad7ab873-c8d2-4d6c-7b59-08d7fcd3178e
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2020 15:33:06.2365 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YOCRW3SXF8STRNPwYJ211ctcz2se3leZeDSODOTg6tkMJfCTETnVEjntu/iTHB+s
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3500
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
Cc: David Airlie <airlied@linux.ie>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Hawking Zhang <Hawking.Zhang@amd.com>, Rui Huang <ray.huang@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Evan Quan <evan.quan@amd.com>, Kenneth Feng <kenneth.feng@amd.com>,
 Yintian Tao <yttao@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjAuMDUuMjAgdW0gMTc6MzEgc2NocmllYiBSdWhsLCBNaWNoYWVsIEo6Cj4+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tCj4+IEZyb206IERhbiBDYXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJA
b3JhY2xlLmNvbT4KPj4gU2VudDogV2VkbmVzZGF5LCBNYXkgMjAsIDIwMjAgMTE6MjYgQU0KPj4g
VG86IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT47IEtldmluIFdhbmcK
Pj4gPGtldmluMS53YW5nQGFtZC5jb20+OyBSdWhsLCBNaWNoYWVsIEogPG1pY2hhZWwuai5ydWhs
QGludGVsLmNvbT4KPj4gQ2M6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1k
LmNvbT47IERhdmlkIEFpcmxpZQo+PiA8YWlybGllZEBsaW51eC5pZT47IERhbmllbCBWZXR0ZXIg
PGRhbmllbEBmZndsbC5jaD47IEV2YW4gUXVhbgo+PiA8ZXZhbi5xdWFuQGFtZC5jb20+OyBSdWkg
SHVhbmcgPHJheS5odWFuZ0BhbWQuY29tPjsgS2VubmV0aCBGZW5nCj4+IDxrZW5uZXRoLmZlbmdA
YW1kLmNvbT47IFlpbnRpYW4gVGFvIDx5dHRhb0BhbWQuY29tPjsgSGF3a2luZyBaaGFuZwo+PiA8
SGF3a2luZy5aaGFuZ0BhbWQuY29tPjsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGRy
aS0KPj4gZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJu
ZWwub3JnOyBrZXJuZWwtCj4+IGphbml0b3JzQHZnZXIua2VybmVsLm9yZwo+PiBTdWJqZWN0OiBb
UEFUQ0ggdjNdIGRybS9hbWRncHU6IG9mZiBieSBvbmUgaW4KPj4gYW1kZ3B1X2RldmljZV9hdHRy
X2NyZWF0ZV9ncm91cHMoKSBlcnJvciBoYW5kbGluZwo+Pgo+PiBUaGlzIGxvb3AgaW4gdGhlIGVy
cm9yIGhhbmRsaW5nIGNvZGUgc2hvdWxkIHN0YXJ0IGEgImkgLSAxIiBhbmQgZW5kIGF0Cj4+ICJp
ID09IDAiLiAgQ3VycmVudGx5IGl0IHN0YXJ0cyBhICJpIiBhbmQgZW5kcyBhdCAiaSA9PSAxIi4g
IFRoZSByZXN1bHQKPj4gaXMgdGhhdCBpdCByZW1vdmVzIG9uZSBhdHRyaWJ1dGUgdGhhdCB3YXNu
J3QgY3JlYXRlZCB5ZXQsIGFuZCBsZWFrcyB0aGUKPj4gemVyb2V0aCBhdHRyaWJ1dGUuCj4+Cj4+
IEZpeGVzOiA0ZTAxODQ3YzM4ZjcgKCJkcm0vYW1kZ3B1OiBvcHRpbWl6ZSBhbWRncHUgZGV2aWNl
IGF0dHJpYnV0ZSBjb2RlIikKPj4gU2lnbmVkLW9mZi1ieTogRGFuIENhcnBlbnRlciA8ZGFuLmNh
cnBlbnRlckBvcmFjbGUuY29tPgo+PiAtLS0KPj4gdjI6IHN0eWxlIGNoYW5nZQo+PiB2MzogRml4
IGVtYmFycmFzc2luZyB0eXBvIGluIHRoZSBzdWJqZWN0Cj4g8J+Yigo+Cj4gQWNrZWQtYnk6IE1p
Y2hhZWwgSi4gUnVobCA8bWljaGFlbC5qLnJ1aGxAaW50ZWwuY29tPgoKUmV2aWV3ZWQtYnk6IENo
cmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KCj4KPiBtCj4+IGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbS5jICAgICAgICAgICB8IDMgKy0tCj4+IDEg
ZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BtLmMKPj4gYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcG0uYwo+PiBpbmRleCBiNzUzNjJiZjA3NDIu
LmU4MDk1MzRmYWJkNCAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3BtLmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Bt
LmMKPj4gQEAgLTE5NDIsOSArMTk0Miw4IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2RldmljZV9hdHRy
X2NyZWF0ZV9ncm91cHMoc3RydWN0Cj4+IGFtZGdwdV9kZXZpY2UgKmFkZXYsCj4+IAlyZXR1cm4g
MDsKPj4KPj4gZmFpbGVkOgo+PiAtCWZvciAoOyBpID4gMDsgaS0tKSB7Cj4+ICsJd2hpbGUgKGkt
LSkKPj4gCQlhbWRncHVfZGV2aWNlX2F0dHJfcmVtb3ZlKGFkZXYsICZhdHRyc1tpXSk7Cj4+IC0J
fQo+Pgo+PiAJcmV0dXJuIHJldDsKPj4gfQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==

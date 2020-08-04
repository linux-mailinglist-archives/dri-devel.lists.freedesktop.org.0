Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E86C23B8DD
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 12:35:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DC3489AEE;
	Tue,  4 Aug 2020 10:35:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2080.outbound.protection.outlook.com [40.107.94.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B778189AEE
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 10:35:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iGkH/EUnM8iXZ1+KKVgeqFhUbieWjhVYl5hqpLN+Bzxb80oohK+/fOp3F8LPZKHrIPE8iK7HUhfz8kHOPb5QxTycmTVmKV9MF1xPAT5QbA+efiDp2i9O124xgQlM0iyjfiBfflhastal0BGCuux8Cb4yXDYRksYcvA8PehCnpau2zLV9m8w6NHtE+El5IuW2YxxlgmoQp1RW5vQILPDrLltTg7D5hk6So+bOIW+bL+TLQw6mCXs/WOBu6fQWfPyPv9e+fDeMLbnyzGkk7654C9Ta9Lj/4SUIHcandaK72iAyfUYyuH52ekvybNMH+ZwM4p0b2apxRUX/bUxOErst7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fqQjf7bxFXKKLObOwe2UAoRlYvakjlP6NAjnhfy3/Q8=;
 b=nB1YiD4rWh2cw5HeT0jzwgDbKLGaImX0Sj8FLWQyMiPXxI8BtCt7vORbuxukrpIWu+qYtkH28xMDNOnGfa2DJ8QwytLcKEYoSdv2i7q6ynprBG4XiPLwkKsAjM5R34TKAjJV/upFYaJJX5Xb5s111kVk4siCo+iISxYV49P6Y0Z06Mfb+3o8oyEDPtAki3rSGmOtjfF83LuJvHyZA1BfREOHwdlcVF30TN7HnmvoBSTcoi/qdjl8DOO0tXnHk4a+Qj7fDNXEuW4ol6fH6sT0wNuK+ZjEadaeztRvszlBI2pKL7jez8WahiZ8cuza5m3RQ9HmFa8zeevybeGGG8XJrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fqQjf7bxFXKKLObOwe2UAoRlYvakjlP6NAjnhfy3/Q8=;
 b=cg7JQN1G0JRmETfEAyQF3YnCkImWoY2vv1toF6bQdgeFuGB/6I3Ndcy8bv3XzDWH9FC12J5S8EgJkz9MebVULMJ5YW0KCODK+vuBM1GIyyCSNoAZxB5omcEK5NArKq/jJFhbDyxGNmfynqtyjUYFIxahifC2c7Zhl316Ts3G8AU=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4254.namprd12.prod.outlook.com (2603:10b6:208:1d0::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17; Tue, 4 Aug
 2020 10:35:40 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3239.022; Tue, 4 Aug 2020
 10:35:40 +0000
Subject: Re: [PATCH 08/59] drm/ttm: export memory type debug entrypoint.
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200804025632.3868079-1-airlied@gmail.com>
 <20200804025632.3868079-9-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <e4ec6419-3ec9-5754-a841-bca6d94d47b8@amd.com>
Date: Tue, 4 Aug 2020 12:35:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200804025632.3868079-9-airlied@gmail.com>
Content-Language: en-US
X-ClientProxiedBy: AM3PR04CA0135.eurprd04.prod.outlook.com (2603:10a6:207::19)
 To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM3PR04CA0135.eurprd04.prod.outlook.com (2603:10a6:207::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.17 via Frontend Transport; Tue, 4 Aug 2020 10:35:38 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 69719c12-2f47-4527-c403-08d83862221e
X-MS-TrafficTypeDiagnostic: MN2PR12MB4254:
X-Microsoft-Antispam-PRVS: <MN2PR12MB425442367233B086C525DA99834A0@MN2PR12MB4254.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8Xl4tF4t044i6SMqC71RpHZC29aQxfiHXQayQBhhX/V0btrRCemOR9WrRzkSXg6xQbl/n7lYEZnv7Oflnc3LfbbXpJBUMsEK5W0ENKuOkH2I6taMvubAavCZFMpBtNScqlUgCPGZZUkejIvsFeW1kKBg+KcCSL7Zx6/O/eF0W1VyMkXASBrI6bKI2VeWzYgAqfCSaC+n2qZywo3QlQPSeQaF1t9i0OZ4EzvQ/x1LrIgD7fOpwN6P3xK1J14ng6z1jpAic9GQLSwBv9jyZUPJNJGpAAYhcBwU2+ZGPJYeMayA69MzK6ICKHn5Cu4NR/KtFIM2IK33qNhXbgYHGhSvbg7qRQRTLrvBLogSoYKjuVPHw/p1mtoP+ZhCMtV67IV2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(376002)(346002)(366004)(396003)(39860400002)(66556008)(36756003)(66946007)(31686004)(16526019)(66476007)(186003)(8936002)(31696002)(6486002)(83380400001)(52116002)(4326008)(2616005)(6666004)(316002)(86362001)(2906002)(478600001)(8676002)(5660300002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: FMJLOyT3PfDvOPescBoh9Hk/jBxrZbumRycrlZO62kuHX+9dM0/oRtGB1BJvCPwWhWE7pHOdSnsujkjNj6kVC0rAM2ktxDJWRMfla+kTxnMMsWpNTqH7VjsARLdx3CkMZeTBMj3TSYmnYH5dBJhllKj9n/sozb+VX8QTgVNlCexlgdMAd6K3ZaGfrpweMqQs7Kxdmr9J9LGU+qjOSwFF3vIByIC2HY76xSIPZJfKlFQwMqzOxiLXKg1z2tRUTxap/fnBSClsxJNj0SoK9RC2+QIGxNA8hCenL0CgwnYaO8qPizNcIRdjie9339Cpk9WwPf8sRGF+9yX1WP2Sc/gWK8PjDt9VEFYCpcMukRpsDPRNpkTIPsp/vaXjKWV9HzReo9cLKFPZdiOTZL9OIFlyrR6ImGVcrmRDiaL3F7wsIDgXV0uQDkXPISBDw+Lnm/3y3u6jS36MDiKIWUv9KIyBgqGW3jlu7HCltK8QtcnnqvPm3eu6284q43o4ZjMmFQqt7LMcTAkJhfekOZVTZfy3gd/7q8cnctvYg0oGlmEIOpaLAjJt045pXpj5+YwhqZGh/9mVL+7nOc2XWGQwmxUZS4FclzrI4RicIGWKfm6PQ0m+kA274SZrYS3dY7cnqPLnkdXCAflcIAhunSuU9y/DpTMvElieQCXeDPjc6hzWNiv/GMozwYKTby85VDsSk0P+rMyNqtzQUQy1KHUNX82hCg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69719c12-2f47-4527-c403-08d83862221e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2020 10:35:40.6995 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nGgg1N5kTUfky/SRtQ+qkbvrvVHLd/G310uGqu6WgxIhNELA6HISzS1P6Yq30ex7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4254
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
Cc: sroland@vmware.com, linux-graphics-maintainer@vmware.com,
 bskeggs@redhat.com, kraxel@redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDQuMDguMjAgdW0gMDQ6NTUgc2NocmllYiBEYXZlIEFpcmxpZToKPiBGcm9tOiBEYXZlIEFp
cmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+Cj4gQXMgc3VnZ2VzdGVkIG9uIHJldmlldywganVz
dCBleHBvcnQgdGhlIG1lbW9yeSB0eXBlIGRlYnVnIGZvcgo+IGRyaXZlcnMgdG8gdXNlLCB3aGls
ZSBhbHNvIG1ha2luZyB0aGUgZGVidWcgY2FsbGJhY2sgb3B0aW9uYWwKPiAoZG9uJ3QgbmVlZCB0
byB0ZXN0IGZvciBzeXN0ZW0gYXMgaXQgd29uJ3QgaW5pdCBpdCkuCj4KPiByZW5hbWUgaXQgdG8g
YmUgbW9yZSBjb25zaXN0ZW50IHdpdGggb2JqZWN0IG5hbWUgZm9yIG5vdy4KPiAod2UgbWF5IHJl
bmFtZSBhbGwgdGhlIG9iamVjdHMgbGF0ZXIuKQo+Cj4gU2lnbmVkLW9mZi1ieTogRGF2ZSBBaXJs
aWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KClJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxj
aHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL3R0bS90
dG1fYm8uYyAgICB8IDEzICsrKysrKystLS0tLS0KPiAgIGluY2x1ZGUvZHJtL3R0bS90dG1fYm9f
ZHJpdmVyLmggfCAgOCArKysrKysrKwo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25z
KCspLCA2IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0v
dHRtX2JvLmMgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCj4gaW5kZXggMmI0OTAzNzIz
MWViLi4yYWM3MGVjMWYzN2QgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1f
Ym8uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKPiBAQCAtNzcsMjYgKzc3
LDI2IEBAIHN0YXRpYyBpbmxpbmUgaW50IHR0bV9tZW1fdHlwZV9mcm9tX3BsYWNlKGNvbnN0IHN0
cnVjdCB0dG1fcGxhY2UgKnBsYWNlLAo+ICAgCXJldHVybiAwOwo+ICAgfQo+ICAgCj4gLXN0YXRp
YyB2b2lkIHR0bV9tZW1fdHlwZV9kZWJ1ZyhzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiwgc3Ry
dWN0IGRybV9wcmludGVyICpwLAo+IC0JCQkgICAgICAgaW50IG1lbV90eXBlKQo+ICt2b2lkIHR0
bV9tZW1fdHlwZV9tYW5hZ2VyX2RlYnVnKHN0cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdlciAqbWFu
LAo+ICsJCQkJc3RydWN0IGRybV9wcmludGVyICpwKQo+ICAgewo+IC0Jc3RydWN0IHR0bV9tZW1f
dHlwZV9tYW5hZ2VyICptYW4gPSAmYmRldi0+bWFuW21lbV90eXBlXTsKPiAtCj4gICAJZHJtX3By
aW50ZihwLCAiICAgIGhhc190eXBlOiAlZFxuIiwgbWFuLT5oYXNfdHlwZSk7Cj4gICAJZHJtX3By
aW50ZihwLCAiICAgIHVzZV90eXBlOiAlZFxuIiwgbWFuLT51c2VfdHlwZSk7Cj4gICAJZHJtX3By
aW50ZihwLCAiICAgIHVzZV90dDogJWRcbiIsIG1hbi0+dXNlX3R0KTsKPiAgIAlkcm1fcHJpbnRm
KHAsICIgICAgc2l6ZTogJWxsdVxuIiwgbWFuLT5zaXplKTsKPiAgIAlkcm1fcHJpbnRmKHAsICIg
ICAgYXZhaWxhYmxlX2NhY2hpbmc6IDB4JTA4WFxuIiwgbWFuLT5hdmFpbGFibGVfY2FjaGluZyk7
Cj4gICAJZHJtX3ByaW50ZihwLCAiICAgIGRlZmF1bHRfY2FjaGluZzogMHglMDhYXG4iLCBtYW4t
PmRlZmF1bHRfY2FjaGluZyk7Cj4gLQlpZiAobWVtX3R5cGUgIT0gVFRNX1BMX1NZU1RFTSkKPiAr
CWlmIChtYW4tPmZ1bmMgJiYgbWFuLT5mdW5jLT5kZWJ1ZykKPiAgIAkJKCptYW4tPmZ1bmMtPmRl
YnVnKShtYW4sIHApOwo+ICAgfQo+ICtFWFBPUlRfU1lNQk9MKHR0bV9tZW1fdHlwZV9tYW5hZ2Vy
X2RlYnVnKTsKPiAgIAo+ICAgc3RhdGljIHZvaWQgdHRtX2JvX21lbV9zcGFjZV9kZWJ1ZyhzdHJ1
Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAo+ICAgCQkJCQlzdHJ1Y3QgdHRtX3BsYWNlbWVudCAq
cGxhY2VtZW50KQo+ICAgewo+ICAgCXN0cnVjdCBkcm1fcHJpbnRlciBwID0gZHJtX2RlYnVnX3By
aW50ZXIoVFRNX1BGWCk7Cj4gICAJaW50IGksIHJldCwgbWVtX3R5cGU7Cj4gKwlzdHJ1Y3QgdHRt
X21lbV90eXBlX21hbmFnZXIgKm1hbjsKPiAgIAo+ICAgCWRybV9wcmludGYoJnAsICJObyBzcGFj
ZSBmb3IgJXAgKCVsdSBwYWdlcywgJWx1SywgJWx1TSlcbiIsCj4gICAJCSAgIGJvLCBiby0+bWVt
Lm51bV9wYWdlcywgYm8tPm1lbS5zaXplID4+IDEwLAo+IEBAIC0xMDgsNyArMTA4LDggQEAgc3Rh
dGljIHZvaWQgdHRtX2JvX21lbV9zcGFjZV9kZWJ1ZyhzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3Qg
KmJvLAo+ICAgCQkJcmV0dXJuOwo+ICAgCQlkcm1fcHJpbnRmKCZwLCAiICBwbGFjZW1lbnRbJWRd
PTB4JTA4WCAoJWQpXG4iLAo+ICAgCQkJICAgaSwgcGxhY2VtZW50LT5wbGFjZW1lbnRbaV0uZmxh
Z3MsIG1lbV90eXBlKTsKPiAtCQl0dG1fbWVtX3R5cGVfZGVidWcoYm8tPmJkZXYsICZwLCBtZW1f
dHlwZSk7Cj4gKwkJbWFuID0gJmJvLT5iZGV2LT5tYW5bbWVtX3R5cGVdOwo+ICsJCXR0bV9tZW1f
dHlwZV9tYW5hZ2VyX2RlYnVnKG1hbiwgJnApOwo+ICAgCX0KPiAgIH0KPiAgIAo+IGRpZmYgLS1n
aXQgYS9pbmNsdWRlL2RybS90dG0vdHRtX2JvX2RyaXZlci5oIGIvaW5jbHVkZS9kcm0vdHRtL3R0
bV9ib19kcml2ZXIuaAo+IGluZGV4IDc5NThlNDExMjY5YS4uNzNmNWQ5Yzc2NmNjIDEwMDY0NAo+
IC0tLSBhL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVyLmgKPiArKysgYi9pbmNsdWRlL2Ry
bS90dG0vdHRtX2JvX2RyaXZlci5oCj4gQEAgLTc5NSw0ICs3OTUsMTIgQEAgcGdwcm90X3QgdHRt
X2lvX3Byb3QodWludDMyX3QgY2FjaGluZ19mbGFncywgcGdwcm90X3QgdG1wKTsKPiAgIAo+ICAg
ZXh0ZXJuIGNvbnN0IHN0cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdlcl9mdW5jIHR0bV9ib19tYW5h
Z2VyX2Z1bmM7Cj4gICAKPiArLyoqCj4gKyAqIHR0bV9tZW1fdHlwZV9tYW5hZ2VyX2RlYnVnCj4g
KyAqCj4gKyAqIEBtYW46IG1hbmFnZXIgdHlwZSB0byBkdW1wLgo+ICsgKiBAcDogcHJpbnRlciB0
byB1c2UgZm9yIGRlYnVnLgo+ICsgKi8KPiArdm9pZCB0dG1fbWVtX3R5cGVfbWFuYWdlcl9kZWJ1
ZyhzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXIgKm1hbiwKPiArCQkJCXN0cnVjdCBkcm1fcHJp
bnRlciAqcCk7Cj4gICAjZW5kaWYKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=

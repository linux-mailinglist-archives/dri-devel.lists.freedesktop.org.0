Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A379D23B94E
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 13:16:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50F046E437;
	Tue,  4 Aug 2020 11:15:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680087.outbound.protection.outlook.com [40.107.68.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87C426E437
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 11:15:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hftoA107h9/UcFM2AvRipdp3cFoLJAanyAWwlK0i/MpexQLMHdlBcxgTljrkhxP3hKtoMWssrzYGjJq4EjkEk0B7PLzx+DQZmVVlALoTt6zSqBP7H61xRpDFlAPrd0kFnl26CHxQH6+jv7R1n/7afMF55xye5rEng+EBuTF7EfhhUab90VZlkFxuWh5RWgWqSK8I6F2/esjDm/eJmi2Qmr8uPDjbKeEn0/GSFjVLhu3nrlpS8ejCjLlttcUEEIA49l6OBaFQ2I3H7np4IjLG+rX3e/rdzDeVAww4bq3WZIWEEle8Xyqaz/uedMLw/CNn0LfBQ9tNrK4KTvU2PwzaHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NoIOte3FTDq8zX99iWWdFMp9cogH9w7NZBqVSxwkJPM=;
 b=CwDO042Fe+obSnyXUEydKrLzK3P4NCJ4R/kOm+DX7uplm7s+UKsaP+oNHjT3Wig/Qc45tVXuXjJM60/XQt2X55iR8hpsxJCusnjDHbaTCZlXMYzgnO5DHdwk/pU6sP8Xo+Ytp4PSfTcgHDzf3bFJCH4sHPNvyoVfaibwon7TyKBfJsqwsibPNB0VLfqJczG43iwRK6m+L+hmEiz2KOpkCcssOojquMr8aY/gCZb16n4JlZBWDAWBzZm4R3W3H2DJRWu25yq2oTIbNqYH/a940m/2IGfjy6ELmNpRX45529sdAtq5Qa7U/bM3HqAoR06Yd7NLBlpfQz1AZy7zKiNXvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NoIOte3FTDq8zX99iWWdFMp9cogH9w7NZBqVSxwkJPM=;
 b=kVAHMRoT5AUItfLAXawCJlqveoZX/Q3GxFH/pY25xfDmWcdVzlbe701q/pD5S+AoZ4hITKPh68OuPbTNjuejcEYULmg2S2SiiseEI8DqORQPx0gbZB6TL9IkUwi1hW3dSjqAktyiwmZG7PGiog8kLrdYQW74i0bQCGB/YmPK+8o=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2418.namprd12.prod.outlook.com (2603:10b6:207:4d::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.20; Tue, 4 Aug
 2020 11:15:55 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3239.022; Tue, 4 Aug 2020
 11:15:55 +0000
Subject: Re: [PATCH 16/59] drm/radeon: use new ttm man init path
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200804025632.3868079-1-airlied@gmail.com>
 <20200804025632.3868079-17-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <1f9f30c6-c420-4ecc-4a4f-394cd7a9ff59@amd.com>
Date: Tue, 4 Aug 2020 13:15:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200804025632.3868079-17-airlied@gmail.com>
Content-Language: en-US
X-ClientProxiedBy: AM4PR0302CA0031.eurprd03.prod.outlook.com
 (2603:10a6:205:2::44) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4PR0302CA0031.eurprd03.prod.outlook.com (2603:10a6:205:2::44) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17 via Frontend
 Transport; Tue, 4 Aug 2020 11:15:54 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 47276aa3-ff64-4e40-86b3-08d83867c18a
X-MS-TrafficTypeDiagnostic: BL0PR12MB2418:
X-Microsoft-Antispam-PRVS: <BL0PR12MB241800A857E60A1E00BE5AFE834A0@BL0PR12MB2418.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:626;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JLgsWHPLOMiGImmwNvbW7dMplCBliNq36LlUf42RM90306s7dfzzQo7LYYxACwjhUqxiByaOspy59MXI5VydCkKTRD09N5/05ETnIlydXxOnaBDDKHAH4SlScCTTzjEM/82b7q+6xp+3uI9w9on4sZZsnAi4x5tx/hVdMiJ50Q1GGVyYrwhZJQ9MhR1PHSr+mIPo7ugzIfj4hYN1vVZYe8u16mwXfSwIbiqKaY7YdBrLm/H3ONYWiF08C+7+Pzu1FIJDZqpNylguNMVZ9yDzcUi1JbWKFMuO01B0eBTlZ7BJN3pmeOCzKAicC9GlDsyIzF8cXyLF8/OiwJcLkXzABWw4vOic6OlOwR2qaRxbJRvhYpzWOpbogbrb50Iz3e28
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(136003)(346002)(376002)(396003)(39860400002)(2906002)(6486002)(5660300002)(316002)(478600001)(8676002)(52116002)(31696002)(16526019)(83380400001)(66476007)(4326008)(36756003)(6666004)(86362001)(66556008)(31686004)(8936002)(2616005)(186003)(66946007)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: GsqEMvZhlTSFcwJq/LP3Nqe6jGoifmxY6HdYKlwzli2+WivUe5m57SDWtzkWqAPJbuwVayM0VQTWNAXrGIqRJ66+ShWQhCO/hZ8HMF3xabbpgQQQ5mXvxMg5jBGmelOR9JPdovt+F4++lDQRnrkVj+gDMjGuaESBTREDlAZv8SM3GXsYIGn1jDXdH8YJSPxS7DvGqbKscYJOstv9r5OeLtP9u7Wp1b7PjOFqxtmaquFnmesmH4Lutl+JHj9XqaACLur/HGp0yVQ8hSNtqrmLoKrC0OpzK7sDfKDS7Uk7PNwrfsTO6fY8PgK4PWup/RlZOCfkzQ/EIATa/XIA9AAtCURJDeAG+lYIJ0ML5Cio4NfSiY+j0b4wq5fh9qEbo0zU9lWB3AeIs+ATZwaC+TYfW+M664CkrX62UI1RiDOCisNWD6Aj0Es2+Nc+nhdb3RP2QlJFm/DmgBsy6MwJp0HFEWfRwwLwxYn5Dq+GiAjbedntYyQFqkANKdSU/Au6sIZ0IWhL9p/dYfuU/DBrX/Q0g4dDRFReWBQUkuYcbqcfwZfiYXXz1trVmZ1HGtJKgfsvcsE7YzdVFxpX5x55rRcj9vlQH2lfGFo1H1cw6kcI86PVNLSzfV1vf3mR/eh14K1ZLPrnqB5hzWdeqjWD8fDr4uqFcWvurbG8jlQPX3A3A8IvT/bybK3EUwgAC2l53ea2t2m5UGf7OAkYZ10QsqRYgg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47276aa3-ff64-4e40-86b3-08d83867c18a
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2020 11:15:55.5991 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iv9N0ufA+9/4ETV1OiQH81kH8JdlNWx4jRzdgjKHu480Wd2D5vyNrxsWJzD01K2Y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2418
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
cmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+Cj4gVXNlIHRoZSBuZXcgY29tbW9uIG1hbmFnZXIg
aW5pdCBwYXRoLgo+Cj4gU2lnbmVkLW9mZi1ieTogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0
LmNvbT4KClJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFt
ZC5jb20+Cgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdHRtLmMgfCAx
MCArKysrLS0tLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA2IGRlbGV0
aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX3R0
bS5jIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdHRtLmMKPiBpbmRleCAwYjA3ZDhl
ZDZlZGQuLjg0YzAyYjQ1MjljMCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9u
L3JhZGVvbl90dG0uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX3R0bS5j
Cj4gQEAgLTcwLDE5ICs3MCwxNyBAQCBzdGF0aWMgaW50IHJhZGVvbl90dG1faW5pdF92cmFtKHN0
cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KQo+ICAgewo+ICAgCXN0cnVjdCB0dG1fbWVtX3R5cGVf
bWFuYWdlciAqbWFuID0gJnJkZXYtPm1tYW4uYmRldi5tYW5bVFRNX1BMX1ZSQU1dOwo+ICAgCj4g
LQltYW4tPmZ1bmMgPSAmdHRtX2JvX21hbmFnZXJfZnVuYzsKPiAgIAltYW4tPmF2YWlsYWJsZV9j
YWNoaW5nID0gVFRNX1BMX0ZMQUdfVU5DQUNIRUQgfCBUVE1fUExfRkxBR19XQzsKPiAgIAltYW4t
PmRlZmF1bHRfY2FjaGluZyA9IFRUTV9QTF9GTEFHX1dDOwo+ICAgCj4gLQlyZXR1cm4gdHRtX2Jv
X2luaXRfbW0oJnJkZXYtPm1tYW4uYmRldiwgVFRNX1BMX1ZSQU0sCj4gLQkJCSAgICAgIHJkZXYt
Pm1jLnJlYWxfdnJhbV9zaXplID4+IFBBR0VfU0hJRlQpOwo+ICsJcmV0dXJuIHR0bV9yYW5nZV9t
YW5faW5pdCgmcmRldi0+bW1hbi5iZGV2LCBtYW4sCj4gKwkJCQkgIHJkZXYtPm1jLnJlYWxfdnJh
bV9zaXplID4+IFBBR0VfU0hJRlQpOwo+ICAgfQo+ICAgCj4gICBzdGF0aWMgaW50IHJhZGVvbl90
dG1faW5pdF9ndHQoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYpCj4gICB7Cj4gICAJc3RydWN0
IHR0bV9tZW1fdHlwZV9tYW5hZ2VyICptYW4gPSAmcmRldi0+bW1hbi5iZGV2Lm1hbltUVE1fUExf
VFRdOwo+ICAgCj4gLQltYW4tPmZ1bmMgPSAmdHRtX2JvX21hbmFnZXJfZnVuYzsKPiAgIAltYW4t
PmF2YWlsYWJsZV9jYWNoaW5nID0gVFRNX1BMX01BU0tfQ0FDSElORzsKPiAgIAltYW4tPmRlZmF1
bHRfY2FjaGluZyA9IFRUTV9QTF9GTEFHX0NBQ0hFRDsKPiAgIAltYW4tPnVzZV90dCA9IHRydWU7
Cj4gQEAgLTk4LDggKzk2LDggQEAgc3RhdGljIGludCByYWRlb25fdHRtX2luaXRfZ3R0KHN0cnVj
dCByYWRlb25fZGV2aWNlICpyZGV2KQo+ICAgCX0KPiAgICNlbmRpZgo+ICAgCj4gLQlyZXR1cm4g
dHRtX2JvX2luaXRfbW0oJnJkZXYtPm1tYW4uYmRldiwgVFRNX1BMX1RULAo+IC0JCQkgICAgICBy
ZGV2LT5tYy5ndHRfc2l6ZSA+PiBQQUdFX1NISUZUKTsKPiArCXJldHVybiB0dG1fcmFuZ2VfbWFu
X2luaXQoJnJkZXYtPm1tYW4uYmRldiwgbWFuLAo+ICsJCQkJICByZGV2LT5tYy5ndHRfc2l6ZSA+
PiBQQUdFX1NISUZUKTsKPiAgIH0KPiAgIAo+ICAgc3RhdGljIHZvaWQgcmFkZW9uX2V2aWN0X2Zs
YWdzKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D072DA17B
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 21:27:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B1266E150;
	Mon, 14 Dec 2020 20:27:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2086.outbound.protection.outlook.com [40.107.94.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1692B6E14C;
 Mon, 14 Dec 2020 20:27:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TJWW1PHrOEhgwPRi16gtofEqkpoCe9rjm+IgQizc41GvcniGO1gAWP/uBUnypvY/V1s66qm+UgkNXpyuwwgistNkGBSI+Mm7raCYW/di2edPHE3u0q8zh45vOe9L1MNXT/ag/P0FNEs04xZpTpRUE1z0wfPnQl3IfPM4w6ffgECh7GPnhV9RWzKLRcXexfG0vk8YAC7az9XBRnBfXgwXgdXUxQmlxE5epx51VTAXVUfguZURQQAZoSyiDvbYQ3YKdyga0VTCMLWy9ojjY6M9QnVZUS4QoswDDHiwRrzymZYPk/1PHwP9kFSmH4xJ08tGX8UVf7QrQfWGCjFrY0y0Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FNZcoFlX86as7yPvB4mGIcEe7GkarjpxFfy0HZYEirk=;
 b=EN+POhFDAEm2NRjiMGAqfp9vKefSOJ7NVHdfpX6quw3IQ/roRUm8hIe/hUiy+j9vr6v2FH8QgacZfOaWwgB2V+TLpT335eel68GWiRoKM1en+BfMXhSOiPuvjbY9UvSeSoRYYtc8Llj8uuc3NYRrhzKsO5H2m191+xM7QMWLEd1S2kKOD2O/kfcfQG24OLITj5LYwzuduPMMxSAyP3bNcfV+XP/6nJjJTTT3f+j1q7+pOpdshD9Ky3ilANYvGDmaHTFklpL88eV+CQRapf8m+ApaXEb7ih+5eqXCevCAy26ZuZYCKKCS3oNH1KcZkyWqyFa9SUoMxV0mfaOy0hEPMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FNZcoFlX86as7yPvB4mGIcEe7GkarjpxFfy0HZYEirk=;
 b=MfPj3VW9EUohXK4B3+2Gx5GQqw7+t1MhvvUAZFn4MLEjTPsn9yK63pE1sJvk91Thmrc309kNnO4huXQJ+jT++7gYttyQLSvmTuZwmZIT8kvrbAQb+5i+Fsb/JeqUpFWInQ/T/wji5dFdYqTWE5NNV5GZSorzb88uZoU9ch5mn0g=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2388.namprd12.prod.outlook.com (2603:10b6:207:4a::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.14; Mon, 14 Dec
 2020 20:27:15 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3654.024; Mon, 14 Dec 2020
 20:27:15 +0000
Subject: Re: [PATCH] drm/amdkfd: fix ttm size refactor fallout
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20201214191725.3899147-1-daniel.vetter@ffwll.ch>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <4dceb130-70bc-11b1-2078-02f511725b9e@amd.com>
Date: Mon, 14 Dec 2020 21:27:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201214191725.3899147-1-daniel.vetter@ffwll.ch>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM4PR0202CA0004.eurprd02.prod.outlook.com
 (2603:10a6:200:89::14) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4PR0202CA0004.eurprd02.prod.outlook.com (2603:10a6:200:89::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Mon, 14 Dec 2020 20:27:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 34ff5d81-634e-4697-49e0-08d8a06ea54c
X-MS-TrafficTypeDiagnostic: BL0PR12MB2388:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB2388E7419C4C2B796FDC270883C70@BL0PR12MB2388.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:635;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kJZS0sjXUTytUD6CcadMfW/6jxarOlEEtrlMJBWcthUdFhDWijD13lykC7CuM+pFS5VPenzIILv31QqSQRnv8X1midz9ZIUhemdOcLtgGRKuPCZpd9Toi/iz5Iou4noKTORm58zMY9xZCCx+CsSrwy/xDilxSZUyaLQNbimtVpFah/bC1xXiC2IcJReqwWaMWDlvVB6JRXpjIHncb6ELpx0EEPc/9tt1NnBhc/O5CD1RTqbX3NsTNgQkh8BSWVk0lV88DaAbdKreQxsj6rY7/jN2C+0j11hAqKhPpBLwM37telsddErI36AuSX7FNZhxiM5iw/V5fQ+Kh3UxdJCeWAYQuf3OZ8eugPTjfNNrG8fV2UyeBIC8MosAvat2fTiH63oN7lDjaHR0jlIMdKBEIk98z/kPhiPVqdN4RQUHMNlCn5o6TpyzJPXg90DIcl0Q
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(136003)(66946007)(31696002)(186003)(66556008)(16526019)(66476007)(8676002)(66574015)(508600001)(31686004)(6486002)(34490700003)(110136005)(5660300002)(54906003)(2906002)(8936002)(6666004)(4326008)(86362001)(2616005)(36756003)(83380400001)(52116002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dzNicEdGL1hnaC96TmlEL2NlUEZkVEk2dDZ6a0hydjN6cCtBY0lINnV2dUJN?=
 =?utf-8?B?T3czSWVDaHM5dmhRTm9ZYjNKVk16VjhVYjRGaDhMYjJTK3krbUdrRUdRRXJB?=
 =?utf-8?B?bytzTFFzZjBxSE5tRDRNMVFuRXlYRjE0Z0diWStLVmwrdjRLakJjaUdkRU4w?=
 =?utf-8?B?QklDMWpjVUNjTS9VTEhGRjIvc1VuWktYTW04Sjc3UnFoc1UwTVlXRW1idTdh?=
 =?utf-8?B?QjM0alpkVFhzTkwzbkNBVXZPL3QvUHhOWi84bDNBOXdETkJKdXVHVlc5cXQ1?=
 =?utf-8?B?Y2NodHJBdzN0WnQ3STk5S1VMMTB6bXlaekYwbFd3WlY3NE00OHk5Z3hacFZq?=
 =?utf-8?B?bks1UVNoVlV0cUd2RVFWdHVxVUN5R0oweld2RmxvT291WEI1bmdvMkV3NGRk?=
 =?utf-8?B?S2VDaTdYY2o1bjNkVFNObHBHR2pyRlVnOEpnY3U4NklHb1RmSnRQMW01SitD?=
 =?utf-8?B?eGlUdUdiWnRBYTE0dDNMVlV2OTBjT0lna1B5OXk3ZDR0b1Nlcmt0Y003VzNR?=
 =?utf-8?B?NTFmL0NBZ3V3QWhmWkluVW82RUs2TUh4bC9RdHBpam9mai94bk54SmI2Z3k0?=
 =?utf-8?B?Z05wN2grL0tnWHQzNUhBWllRZk5wZDQwa1VhbUwwWFhDSVYzTU5qZjZJU3J0?=
 =?utf-8?B?SjZyMUhLbFluRkFtY0dBRzJwRGJEWERjOGFTQlA4alk1T0o3THBpSFRnYlZ2?=
 =?utf-8?B?WkJIK3gvUHYwRE8wdG5ScGpVK1BKUXl4VUIzWVh5UVZTSGJQYk9OZHgvWTQ1?=
 =?utf-8?B?ME1PbUtNalJXcnhicEZ5VENRY09VR0xxajZDbUk2MkZJMmxhMGdXbU55MHAw?=
 =?utf-8?B?NVQzVXVXKzVGN1ltZmIxVDlyMUVzYzdqOFVXVERaK3Fqdlo4MTl2NTBRYytF?=
 =?utf-8?B?dUE3NFNySGNyMkJtQ3NsenF6OWlScEVYSW1mdU11dGZCNm5WNVREcnJ4Z3Fl?=
 =?utf-8?B?ZEk0c2oxWVpSZmxUNXFnV21GNytVcVZpWXlFeFA3cHE2TmtVSjIwYmpHdFZk?=
 =?utf-8?B?SlA0VVowRUMvbjlXb1lUZmVsWkE3UDFKQ2tuY0ltZjQ3UmUxNVRacHJkakRC?=
 =?utf-8?B?bGhaUkFROWdib0YxNU0zK1V3V2FjT0UvRkthcHVqVFRURE9SU000N1JJOFNG?=
 =?utf-8?B?VUcrTWlEZGhEblZObXdjVm8xK1IzYkFiTFZwb1RXTHNmTUxNZmdpNHlaYnB6?=
 =?utf-8?B?OU54SEVvQ1ovREQzNC8vN2FGcVdUdWNvZDhFaDQyZnNIWlRWYk1PRDh3d2kr?=
 =?utf-8?B?QWF0bFlDa3RjdGpwS2QyTG0vZ2xrQVdYVUVwRG80VmxGcnFNNk1Rekt0eTZT?=
 =?utf-8?B?Y3VUcUlOOHZHcU04K0FzZm1UNnJwb1E2cmtydWowQ29qWFpZdGxGOC9ydC94?=
 =?utf-8?B?UU5aZUUvd0tpeld3cllDWFZKdThUNWFySnFJS01jbUx0M2ZyMEFrQk9kemNJ?=
 =?utf-8?Q?BlSRU/46?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2020 20:27:15.1732 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 34ff5d81-634e-4697-49e0-08d8a06ea54c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CeJ3oaxFLiTqHUz0G+EIx0Rros852R/iFrR0czFpIqu5B9TVMkz5V/UZP+RP7cLJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2388
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, Huang Rui <ray.huang@amd.com>,
 amd-gfx@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTQuMTIuMjAgdW0gMjA6MTcgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IEkgZ3Vlc3MgQ2hy
aXN0aWFuIGRpZG4ndCBjb21waWxlIHRlc3QgYW1ka2ZkLgoKU2NyYXRjaGluZyBteSBoZWFkIHdo
YXQgaGFzIGhhcHBlbmVkIGhlcmUuIFdoZW4gSSB0ZXN0ZWQgZXZlcnl0aGluZyB3YXMgCmF0IGxl
YXN0IGJ1aWxkaW5nIGZpbmUuCgo+Cj4gRml4ZXM6IGUxMWJmYjk5ZDZlYyAoImRybS90dG06IGNs
ZWFudXAgQk8gc2l6ZSBoYW5kbGluZyB2MyIpCj4gQ2M6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlz
dGlhbi5rb2VuaWdAYW1kLmNvbT4KPiBDYzogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4g
KHYxKQo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgo+IENjOiBG
ZWxpeCBLdWVobGluZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4KPiBDYzogYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwu
dmV0dGVyQGludGVsLmNvbT4KClJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3Rp
YW4ua29lbmlnQGFtZC5jb20+Cgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2FtZGtmZF9ncHV2bS5jIHwgOCArKysrLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDQg
aW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMKPiBpbmRleCA3NzkxZDA3NGJkMzIuLmE5
NjQ3ZTdmOThhOCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfYW1ka2ZkX2dwdXZtLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfYW1ka2ZkX2dwdXZtLmMKPiBAQCAtNDUzLDcgKzQ1Myw3IEBAIHN0YXRpYyBpbnQgYWRkX2Jv
X3RvX3ZtKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCBzdHJ1Y3Qga2dkX21lbSAqbWVtLAo+
ICAgCXN0cnVjdCBhbWRncHVfYm8gKmJvID0gbWVtLT5ibzsKPiAgIAl1aW50NjRfdCB2YSA9IG1l
bS0+dmE7Cj4gICAJc3RydWN0IGxpc3RfaGVhZCAqbGlzdF9ib192YSA9ICZtZW0tPmJvX3ZhX2xp
c3Q7Cj4gLQl1bnNpZ25lZCBsb25nIGJvX3NpemUgPSBiby0+dGJvLm1lbS5zaXplOwo+ICsJdW5z
aWduZWQgbG9uZyBib19zaXplID0gYm8tPnRiby5iYXNlLnNpemU7Cj4gICAKPiAgIAlpZiAoIXZh
KSB7Cj4gICAJCXByX2VycigiSW52YWxpZCBWQSB3aGVuIGFkZGluZyBCTyB0byBWTVxuIik7Cj4g
QEAgLTEyODEsNyArMTI4MSw3IEBAIGludCBhbWRncHVfYW1ka2ZkX2dwdXZtX2ZyZWVfbWVtb3J5
X29mX2dwdSgKPiAgIAkJc3RydWN0IGtnZF9kZXYgKmtnZCwgc3RydWN0IGtnZF9tZW0gKm1lbSwg
dWludDY0X3QgKnNpemUpCj4gICB7Cj4gICAJc3RydWN0IGFtZGtmZF9wcm9jZXNzX2luZm8gKnBy
b2Nlc3NfaW5mbyA9IG1lbS0+cHJvY2Vzc19pbmZvOwo+IC0JdW5zaWduZWQgbG9uZyBib19zaXpl
ID0gbWVtLT5iby0+dGJvLm1lbS5zaXplOwo+ICsJdW5zaWduZWQgbG9uZyBib19zaXplID0gbWVt
LT5iby0+dGJvLmJhc2Uuc2l6ZTsKPiAgIAlzdHJ1Y3Qga2ZkX2JvX3ZhX2xpc3QgKmVudHJ5LCAq
dG1wOwo+ICAgCXN0cnVjdCBib192bV9yZXNlcnZhdGlvbl9jb250ZXh0IGN0eDsKPiAgIAlzdHJ1
Y3QgdHRtX3ZhbGlkYXRlX2J1ZmZlciAqYm9fbGlzdF9lbnRyeTsKPiBAQCAtMTQwMiw3ICsxNDAy
LDcgQEAgaW50IGFtZGdwdV9hbWRrZmRfZ3B1dm1fbWFwX21lbW9yeV90b19ncHUoCj4gICAJbXV0
ZXhfbG9jaygmbWVtLT5sb2NrKTsKPiAgIAo+ICAgCWRvbWFpbiA9IG1lbS0+ZG9tYWluOwo+IC0J
Ym9fc2l6ZSA9IGJvLT50Ym8ubWVtLnNpemU7Cj4gKwlib19zaXplID0gYm8tPnRiby5iYXNlLnNp
emU7Cj4gICAKPiAgIAlwcl9kZWJ1ZygiTWFwIFZBIDB4JWxseCAtIDB4JWxseCB0byB2bSAlcCBk
b21haW4gJXNcbiIsCj4gICAJCQltZW0tPnZhLAo+IEBAIC0xNTA2LDcgKzE1MDYsNyBAQCBpbnQg
YW1kZ3B1X2FtZGtmZF9ncHV2bV91bm1hcF9tZW1vcnlfZnJvbV9ncHUoCj4gICAJc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYgPSBnZXRfYW1kZ3B1X2RldmljZShrZ2QpOwo+ICAgCXN0cnVjdCBh
bWRrZmRfcHJvY2Vzc19pbmZvICpwcm9jZXNzX2luZm8gPQo+ICAgCQkoKHN0cnVjdCBhbWRncHVf
dm0gKil2bSktPnByb2Nlc3NfaW5mbzsKPiAtCXVuc2lnbmVkIGxvbmcgYm9fc2l6ZSA9IG1lbS0+
Ym8tPnRiby5tZW0uc2l6ZTsKPiArCXVuc2lnbmVkIGxvbmcgYm9fc2l6ZSA9IG1lbS0+Ym8tPnRi
by5iYXNlLnNpemU7Cj4gICAJc3RydWN0IGtmZF9ib192YV9saXN0ICplbnRyeTsKPiAgIAlzdHJ1
Y3QgYm9fdm1fcmVzZXJ2YXRpb25fY29udGV4dCBjdHg7Cj4gICAJaW50IHJldDsKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8F92C682C
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 15:49:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EF786EE02;
	Fri, 27 Nov 2020 14:49:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2052.outbound.protection.outlook.com [40.107.237.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1DFF6EE02;
 Fri, 27 Nov 2020 14:49:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VAaGfCQuc1O3AiAaNZCaBjiUi2Xf/qEVJ5aApZw1U1ikD/Cja0WIJM27uE9fOPSYhahgHf4xJvfG6pjK3rE6eVVIVoCWZRFByqJgsSnRxGgTvnHwPbUF76UZx+D+m21GxTyJVLtTBSywpL58/mpmRkZdObm2iem3eqL673KmVbC1rsQMnSeUzondwxMm6BbVZ2KoZkB4jX0mzn3V9Gojo+YAu0lbaa6rFDKsuBNXCPkXNXtwC5aQSxhSs+caOvq4XjON1NbckA+kZ4mj/K57HwC6idUF2ULInBCGPlvEGUbF2QP3DrzUcfilK7350P20P+seb0PGt1bxwgqSxlo7Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tsPc9kSD3yolOsCkWQ0hfbB+7k7lQAmUDrlZPFUUWfQ=;
 b=kkLIimXWIuKl4CWALwoddjoDcYSH+L3j8P7Zp6hN8MuN7yelyIPyZ5Y7yRFJTdv8IF+4/2m7gy/BTLP+jihzVxZy3KKPnb2bjZrGxHr2DuMYLUIOuUE964Xufj0XpOozvOd22yJ445OmHsyYbqyuArlkbA6fx0KPuvpKUPf/qD15WlHZz2yehLiSqe4lGs196o4tFEIGgqpmjNuRYJex9flub04wNwfMXTFm4V7/FfmYI0sQgC7GB/bQfCfLE4LxP1VOdWfTnitHKe1WyItxOIeqHZuWjePCl/nHSyv+JktAlH/GGH2GANsuCGiFbXKMctjA9tfP5QfJM6D9XtI/WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tsPc9kSD3yolOsCkWQ0hfbB+7k7lQAmUDrlZPFUUWfQ=;
 b=378++aR1PZXGQgvluVCyYl4d5e/w4LZpwPztSgxYRyayficWaBigkIYi9+yPHAUSsVO+m9c+ntr5g1P+6NDw7OG+xQwR231U5Gs7h/9mrTuGfnISvyvrJUM2UsKdlsd4pdepd8zXX29Nv8AFXkiwvJUiNjTp43dib1kQObpfbQU=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2420.namprd12.prod.outlook.com (2603:10b6:207:4c::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.24; Fri, 27 Nov
 2020 14:49:37 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31%7]) with mapi id 15.20.3589.032; Fri, 27 Nov 2020
 14:49:37 +0000
Subject: Re: [PATCH] drm/radeon: fix check order in radeon_bo_move
To: Daniel Vetter <daniel@ffwll.ch>
References: <20201125143424.1434-1-christian.koenig@amd.com>
 <CAKMK7uF7SZ_ihX+s6Rxg8Ws96vViu8Ab2vN+6VysWeDRkQMbNg@mail.gmail.com>
 <CAPM=9txqSCUcCoYKXxC6bX5Qx1SEBG4MPNTdKRybogwyOsZg5w@mail.gmail.com>
 <66a8a6f5-af8b-a46f-0dfa-417dd699b58f@gmail.com>
 <CAKMK7uEurRUDsK58xAiJ98xQckCeL6p+hFvbkx8AP6HAW-EsDw@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <5a88c54c-3731-856a-da3c-b084c9b33187@amd.com>
Date: Fri, 27 Nov 2020 15:49:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAKMK7uEurRUDsK58xAiJ98xQckCeL6p+hFvbkx8AP6HAW-EsDw@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM9P192CA0029.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:21d::34) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM9P192CA0029.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:21d::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.20 via Frontend Transport; Fri, 27 Nov 2020 14:49:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8f101340-1d8f-45e4-cbbf-08d892e3a903
X-MS-TrafficTypeDiagnostic: BL0PR12MB2420:
X-Microsoft-Antispam-PRVS: <BL0PR12MB242048CD812D76D2CDD57DCE83F80@BL0PR12MB2420.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z2wETkYnviAo4YlkMcRbT451kWDNuYmIlPAD6NiLq55TchPcP4+SMNDqWPHqnepQ2gOkQbIQ28b8m8HKRrS9PLVPXDPdwQ1UDTniPMlaUBQs6XVysv4zDj6546+NwzSpljlTFfZd5C/mzAotFS00u2JLqAq6j60q1jnjSBpYyXy26qtLGE7GOJnCkk72a2fuZrS06+MkygMkLHf0gD9jefepSNTGZTQBQ6xZgmLhBdwvNZVH/+6n0vyul5puRNavZTRqtL1my2EPMWUDpOeHXJLYcBcEUtxTza0TFRovxTcrroMyjVPhg6y6AoHAPwQPizXU00tA6sFGY/skXFxvcTnk6LcuqkGgYQg5he4lxx9NTgkKRlJvCls1NQ3JoU3T
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(376002)(396003)(136003)(346002)(6666004)(31686004)(86362001)(66946007)(66556008)(8676002)(8936002)(6486002)(4326008)(66476007)(5660300002)(36756003)(83380400001)(66574015)(54906003)(2616005)(186003)(16526019)(2906002)(53546011)(316002)(52116002)(31696002)(6916009)(478600001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?THB6QTdIVy9TV1JLcmxpR3l6U1ZJVXR6ck9EWnU4VFBRYXpYM0hMSkRPUTQ1?=
 =?utf-8?B?cEU1Zk1GdHFRRFFsZE9BT21LdWdwVS9oTVNXRm8rd0VTOU5lK0RDNzY3cW5R?=
 =?utf-8?B?L1BwN2NUUWJlM0F2aVJNN2RkeVhxck9lTHBkdVpUaFo1cWJqL1FpbW4rSDgz?=
 =?utf-8?B?dTZUOXVCUVhtNkw3WHoxeXVHVktNeWZjRU5kMkgxajRaRFZLd0JZU0QzelZD?=
 =?utf-8?B?cTltaFRZNVE5bkVJSnBYTnlzK05XZ3JoZHZNMlJpY1dDWHFJZEZHbUFuV3py?=
 =?utf-8?B?TXFvNzlHcUZKZ2U2ZlV0aUh0dDFFb3lQRUNsNktJOUViRWlYd0loMGI4ME52?=
 =?utf-8?B?dWtLK2hBY09wQ3ZzU1pxTkZSWUg0MjVjeUhxS3BnbXRxOE5aUEl4YTNURVhk?=
 =?utf-8?B?aXE2WDBFcTlFUW9TQ3NRNE9rMm5IemFuVjB2bDVMcHcxOXBmSE5Ec1BFWGY5?=
 =?utf-8?B?Nm1UOXlIcG0ycWxSQVQyZnkwMU1ldnAraE9wSjZvcWszZlFuaGJOTkIrQkxB?=
 =?utf-8?B?SDlJaEE1cGpsMEs0cjgwelNxaE9rUEpYNGd6d1NaVkYwWVdBbUpnb1Jta0xX?=
 =?utf-8?B?NGZxU09Ub2ZnSjdsZForVXVsMzlaaHVEaGNjM1hSR2hYM3AwM0VrVGNjenZI?=
 =?utf-8?B?NzVzcTkrMURaUmxXZ05EMlE3bG1Db3JueTFkSkJxV3dnbFV0Q0c0UjBlWm9Y?=
 =?utf-8?B?eVYvVXdPdzR1UmxFMXoyWUpuVHJoU0JlVEtSaURPcm5MNURmbElpa1VKK2x0?=
 =?utf-8?B?OXBwR1RnUEdpa1UvdWVYM0licXdUUjVMTzRFbEdvOTRCaVZ0YXdQZlFQYjhL?=
 =?utf-8?B?aDJtSVVBRXBpekpsUmNFZjdRdWZaK1R1NU9zWHlLckVwODdSNEtYR3NadnN3?=
 =?utf-8?B?L3crWTJ1WktMTytyaUxoaktFZ1RtUUlSaHBsR3c4U1c1RytuM0QzUG1ESWcw?=
 =?utf-8?B?MjRSMVJMYll4bU84WGVNVVJXMnBkOXl3R011ZDJEam95MHdPVXNnaTQxam83?=
 =?utf-8?B?NXdqMi92bXprL3JkcktBYVhkSkNST1dGeDdSYm4ySUE4V0U5c0N3ZWkwd1RE?=
 =?utf-8?B?aEg5ZkxZRklLRUNiajY3UjZmSWE4Qng1SndWL1d3Q2FXTThrWGJ1N0JjNXJs?=
 =?utf-8?B?elpCTmJGWTM0Q3hnb2c3VmtJWXA5QnByUkZQaWErdUdGRG5peTcwVUJBbGN4?=
 =?utf-8?B?aUc1S3NRL1M0SGpDS1k0Rk1GQVZhZS9PTFN1WFV5MlI2ZXZsZHhTSmwxd1NQ?=
 =?utf-8?B?QXQ4Qy9ScHFxTmY1ODg0NEdPdUhlbFg0eXRXb0ZlSjJ5WVdiS0pZVmkybXQw?=
 =?utf-8?B?WllUL3FmcVBFZWV4M2U4K1lyV0VoNHNtaDNoOG1YS0llQ1h1WE5rWmYrbXJU?=
 =?utf-8?B?NUlEWGl6aFhOQ1hWWldjR2o3cTdYNi9CUytWRUFUb1NZL3N2UHFlaG5KMnRY?=
 =?utf-8?Q?WFjGmTMB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f101340-1d8f-45e4-cbbf-08d892e3a903
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2020 14:49:37.1190 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jjZNv5+kGRA9LPWjUk0bQi+CHMKoYQtQoPR7jnVdSccS/a3nXy8XSvnaf1D80jJN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2420
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
Cc: Dave Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjcuMTEuMjAgdW0gMTU6NDYgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIEZyaSwgTm92
IDI3LCAyMDIwIGF0IDM6MTAgUE0gQ2hyaXN0aWFuIEvDtm5pZwo+IDxja29lbmlnLmxlaWNodHp1
bWVya2VuQGdtYWlsLmNvbT4gd3JvdGU6Cj4+IEFtIDI3LjExLjIwIHVtIDA5OjMxIHNjaHJpZWIg
RGF2ZSBBaXJsaWU6Cj4+PiBPb3BzIHNvcnJ5IGZvciBkZWxheSBMR1RNCj4+Pgo+Pj4gUmV2aWV3
ZWQtYnk6IERhdmUgQWlybGllIDxhaXJsaWVkQHJlZGhhdC5jb20+Cj4+IFRoYW5rcy4KPj4KPj4+
IE9uIEZyaSwgMjcgTm92IDIwMjAgYXQgMDI6MzQsIERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZnds
bC5jaD4gd3JvdGU6Cj4+Pj4gT24gV2VkLCBOb3YgMjUsIDIwMjAgYXQgMzozNCBQTSBDaHJpc3Rp
YW4gS8O2bmlnCj4+Pj4gPGNrb2VuaWcubGVpY2h0enVtZXJrZW5AZ21haWwuY29tPiB3cm90ZToK
Pj4+Pj4gUmVvcmRlciB0aGUgY29kZSB0byBmaXggY2hlY2tpbmcgaWYgYmxpdHRpbmcgaXMgYXZh
aWxhYmxlLgo+Pj4+IE1pZ2h0IGJlIGdvb2QgdG8gZXhwbGFpbiB3aHkgYmxpdHRpbmcgbWlnaHQg
bm90IGJlIGF2YWlsYWJsZSwgZS5nLgo+Pj4+IHN1c3BlbmQvcmVzdW1lIGFuZCBvciBjaGlwIGRl
YXRoIGFuZCBzdHVmZiBsaWtlIHRoYXQuCj4+Pj4KPj4+Pj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0
aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+Pj4+IE5lZWRzIEZpeGVzOiAy
OGE2OGY4MjgyNjYgKCJkcm0vcmFkZW9uL3R0bTogdXNlIG11bHRpaG9wIikKPj4gV2h5IGRvZXMg
dGhlIHN1YmplY3Qgb2YgdGhlIHBhdGNoIG5lZWRzIHRvIGJlIGluICIoKSIgPyBJIHdhcyBhbHJl
YWR5Cj4+IHdvbmRlcmluZyB3aHkgZGltIHNvbWV0aW1lcyBjb21wbGFpbnMgYWJvdXQgbXkgRml4
ZXMgdGFnLgo+IEhtIEkgdGhvdWdodCB0aGF0J3MgdGhlIG9mZmljaWFsIHN0eWxlLiBJIGtpbmRh
IGhhY2tlZCBhcm91bmQgb24gaXQKPiB1bnRpbCBsaW51eC1uZXh0IHN0b3BwZWQgY29tcGxhaW5p
bmcgYWJvdXQgb3VyIEZpeGVzOiB0YWdzLiBNYXliZSBpdCdzCj4gbm90IHF1aXRlIGFjY3VyYXRl
bHkgcmVmbGVjdGluZyB0aGUgY3VycmVudCBiaWtlc2hlZC4gSWlyYyBjaGVja3BhdGNoCj4gZXZl
biBjb21wbGFpbnMgd2hlbiB5b3UgbGVhdmUgb3V0IHRoZSBjb21taXQgYmVmb3JlIHRoZSBzaGEx
LCBhdCBsZWFzdAo+IGluIGZyZWUtZm9ybSB0ZXh0IGluIHRoZSBjb21taXQgbWVzc2FnZS4KCldl
bGwgImdpdCBsb2cgLTEgLS1vbmVsaW5lIDI4YTY4ZjgyODI2NiIgZ2l2ZXMgbWU6CgoyOGE2OGY4
MjgyNjYgZHJtL3JhZGVvbi90dG06IHVzZSBtdWx0aWhvcAoKV2hpY2ggaXMgd2hhdCBJIHdvdWxk
IG5hdHVyYWxseSBleHBlY3QgaGVyZSwgYnV0IG5vIGlkZWEgd2hhdCB0aGUgCm9mZmljaWFsIGZv
cm1hdCBzaG91bGQgYmUuCgpDaHJpc3RpYW4uCgo+IC1EYW5pZWwKPgo+Pj4+IEJ0dwo+Pj4+Cj4+
Pj4gJCBkaW0gZml4ZXMgW3NoYTFdCj4+Pj4KPj4+PiBnZW5lcmF0ZXMgdGhhdCBmb3IgeW91IHBs
dXMgbmljZSBjYyBsaXN0IG9mIG9mZmVuZGVycy4gV2l0aCB0aGUgRml4ZXMKPj4+PiBsaW5lIGFk
ZGVkOgo+Pj4+Cj4+Pj4gUmV2aWV3ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJA
ZmZ3bGwuY2g+Cj4+IFRoYW5rcywKPj4gQ2hyaXN0aWFuLgo+PgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

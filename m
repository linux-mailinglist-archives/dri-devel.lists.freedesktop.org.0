Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A26BC32500D
	for <lists+dri-devel@lfdr.de>; Thu, 25 Feb 2021 13:59:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCA276E15A;
	Thu, 25 Feb 2021 12:59:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2069.outbound.protection.outlook.com [40.107.92.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CBAE6E156;
 Thu, 25 Feb 2021 12:59:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UV3gaEW9aZAes8TgoDbiuiD2IHWkyIzwAaAvQ3aLw/idQWwu+c7XEvUqkM5WhaWSEQnz3rW6NgWFBrp+lYGMPLWu+AEoJSo7Ofi0JGM7ZqKTBUn9azkqYl7YGUQ6lp7Ol5GOo6M7zXEO2nfP2ZCvAUFxLmHBicZhD9LMLOLWT8QjBvvIvVThcGz+1HtxUWSn1/NbJBc7CECwXJPaFHKZtHxpWgGRATO4LpYTcQuTVEDQNYOaKNxKQcNtxJF9RSC8HR6PglfYgkyg0U64zjrnYT6jV5zbmqy7Q8tv4YYtVcC1y3lMG7lQvloP7MUgpiDOYP3gwHcOXcXkJLsvcdgRsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=csLA0EYmNI7s+YrBG25wMxLYxseNS33cY62HiLhdGVw=;
 b=CVWBi7jI6tQjq+oHZsukV8tDSfaI+uRx4Jma69qMEFco55CdUGvJruXdZFqCfMzU4WdXspdeiugQ1wfH2pn2VvZvxFApUXdTt3YkbXDidNdrp/faTa5yZLIv9oGtzY5dqBJrFYr+NTEPFwL7MRU5o6GzN6c6ocJeNKff9YcGvFNbTMyn1T7p6RqOBgU5WwcMGEssOpnk+irEZ6M16gvqj9NKXvWqAQ2wewTeYNEZ2z6w92SXJT8MfyjI/KDU2Ztfwgj2Of9bELnBlPYXufXRoBiewPxL+iMx5y6ExsdGfz0Wh/RsJRMMgcWiX5LjQCpCdVeTHZCRtGbk7bR9q9Bk5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=csLA0EYmNI7s+YrBG25wMxLYxseNS33cY62HiLhdGVw=;
 b=nG/bj8YnMBfnMJiIQt9ltfBk0ApTXU+W9NxhY1ZP1oZ0ud1rVRbJt/RVzD7uyVY1zV168MkFjAqD3nUDLalrZv0mJScwg/CS3hTNWSQy6kGt2rO9iaRhJP0ndm7GffQNKjmp2IwTcdI3qWfZcimWXhJbZdNu8jQnyB43baNk5CE=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4756.namprd12.prod.outlook.com (2603:10b6:208:8d::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Thu, 25 Feb
 2021 12:59:16 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3868.033; Thu, 25 Feb 2021
 12:59:16 +0000
Subject: Re: [PATCH] drm/nouveau/pci: rework AGP dependency
To: Arnd Bergmann <arnd@kernel.org>, Ben Skeggs <bskeggs@redhat.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <20210225125301.1723047-1-arnd@kernel.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <7c41b175-6da2-6801-43c2-c4038c08b228@amd.com>
Date: Thu, 25 Feb 2021 13:59:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210225125301.1723047-1-arnd@kernel.org>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:fc8:43:f4c0:95af]
X-ClientProxiedBy: AM0PR10CA0100.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::17) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:fc8:43:f4c0:95af]
 (2a02:908:1252:fb60:fc8:43:f4c0:95af) by
 AM0PR10CA0100.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.19 via Frontend Transport; Thu, 25 Feb 2021 12:59:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: fc8410ad-d4fa-4f1a-3380-08d8d98d27e6
X-MS-TrafficTypeDiagnostic: BL0PR12MB4756:
X-Microsoft-Antispam-PRVS: <BL0PR12MB475687714BEB832EE58729A6839E9@BL0PR12MB4756.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EJbgtcvqeSO4J0QQsQv700GOQO6DDCnoTvOsGtD9ikyJLnzwmfArwyginktpZ8tYR9BXSJ8ynHsl0KhtJS6cRCnBGY7pWzjks2KO2DtN1f0J12PYTohZIg1WfZDhs1lW176fHWzrVo4d2OpcPmD1c4dx9rcmIJOyB+8UGRMmCfHw27xvUVMK3ZqiOjV4JFC0RTlQ3m792Ltwlxl/CAXw6FglnEk423v8FZNh7vs8gwKjhKDBitUpYxuE8vAPf4422W00dVxyYny+Z+AdmMJFxWGcJcVYpz7jQ8EW9TWLEsf8VncKSC8TFCiKZkFECv4XsMU15wjWRTaJ/ugVw2m4W1UvpB49vGD9HuUfiAdCflbygniCpv1EaDMC07jP49N01PGdePOCat5TRA9BR3Y0nazDxntBgbJ8Q0REuJJjt2rRiL6RQJDqqwNEcOuCAdxP1qh2q9llj3InM6WyfJlO2KxmKIo1E80CDAPfXYhoi4bS644YYDZtypcW1AkUuzYTi2a/eAPB7ZCBGLttDfrHCWlv0PaEkIYO56lUdzW59p69Ddiujm/A/ZZgp5XYMQciTJSeqBewufUwc/cWo7BHaZ4vGWVhYB6r+YJp1V0NPGU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(396003)(376002)(136003)(39860400002)(186003)(4326008)(2616005)(31686004)(52116002)(6486002)(83380400001)(66946007)(2906002)(478600001)(6666004)(5660300002)(66574015)(36756003)(86362001)(16526019)(54906003)(8676002)(7416002)(110136005)(66556008)(66476007)(316002)(31696002)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?T09aR3h3R1RFU1Z5cndLNGxCVkJYUVR1QWFHUVgyYlh3UDJQQ3RxYXc2bHhj?=
 =?utf-8?B?V0dwbURDZ3hDcHhJdUJ1TmxzTVkxMlVEU0NlWjkrbGs0T1RFK3paUkZEU2NJ?=
 =?utf-8?B?ZkV2Uyt6ZjNEM3JaT0ZpTVU4ZUtubms5bUV3SVhyUi9kSXMyRE1ZTjIwSm9Y?=
 =?utf-8?B?RitiaFFIWkFMRlcxTjFMRlB5ZUdvZFhkRGJDTzJDenJCZG56N0t5MFMyYmxw?=
 =?utf-8?B?amsyZXhycS9JWk9ZcURvMStvcnU0b1B0cEtwMXcrTWdCVjlMVnJWTHV3Ym5h?=
 =?utf-8?B?QWRWWXNWQXIyc0RCajJRYjFTb1Z5KytUVVB2UmRGbk5RaGJZenZEbXlzWjcv?=
 =?utf-8?B?dEhYbFRxYk8vQlYrUUt6d2JYRlJVK0pLWjByTU4yVkdUVHMxZlJsNGMwQ3My?=
 =?utf-8?B?Q1VtQVhZS1A0S2RHUExiWE5IVlNxcndNVHdONEduZURRSWttTmJsRXdUcDZq?=
 =?utf-8?B?QkRoWXhZZE9jT3dNeEZWcklkNjExbFdSZ2NYbkFSVDhjRW44bzhpcmJTRnBO?=
 =?utf-8?B?bzlpYnpzckFiMHNuUFZxMU05c3p3aE1WZnlOWEJHVGdUK2lQaXJUSzlvaXR1?=
 =?utf-8?B?dTErSTd1NTA0Mi9zVTRkVGRUTG1Rc2Y5eUJFMXp2YUh4YVJZczBXTWlJeDVv?=
 =?utf-8?B?UHhTMDRCOVBib1hsdmhkMzIxUFVyQnA1N3V6R2N3dC91UFFJZGxGV0J6Rk5K?=
 =?utf-8?B?OU0wcXNCc25xTzVqQm1HcWRSU1FralRkQ3gxMjA2dWh0M3p2RmswZVd6RlNx?=
 =?utf-8?B?dXNTdE92UmltWHlseE93THlrZlpGQjNONDYzK29DM2psallZdXBTaHJDalMr?=
 =?utf-8?B?S1VTTkoxU0lQQVhGSkczVFRpRE5SNVRxNFNPWGpxaWxWZG12RjlmYzQxVzRv?=
 =?utf-8?B?aFowazJCTlE0MTRSaUpuUlpzUmlyZEE1dVFYQ20yQzE3dzJYUU40Z1FTZUQ3?=
 =?utf-8?B?TWs1VVpMWTE0RVMzU0UrQzFpYTZaK1pDeHNVTzVZT2Q4TnpRNXNOSUR6dGoz?=
 =?utf-8?B?UWxORXl1b0NIR01GMG1MRFR2Q0VwV1M5K2pnS1hKV1hQUnBqaFh2ZmwrYXlX?=
 =?utf-8?B?T2tSMXozTGg2TlQrU1VIUDNwTTA0QmhJTmdiY2lyVTNrQ0lqY3Y1aFBiaW5q?=
 =?utf-8?B?SEVXY0tCUCtWR2dNT0FyYjFxUkU2Yi9SdmtrbDNuQVdDMzFJZi9TM1lZY3Ex?=
 =?utf-8?B?YUkvYzZRK21oaFh3WXQ3Y2ZGZDRGdjdpQm9HeWN0NFhGaVBYaVk2SlI4K0Jo?=
 =?utf-8?B?NXowclVlTFVGQ3c0UlBFcGkzOWV4ZWQrdW9NNE9QYnp0QnpVQWFaZzUyYlhn?=
 =?utf-8?B?bkV4cVNhWGZ4K2piU2FtZUZ5RkhCd2hpR01LbzZrOTFXbkVZWHFvR21YVGdx?=
 =?utf-8?B?c3pJSENJTm5TdHcwdlREQUloaWtZZ1hsa1c1M2VwZ01wZm14Z2EvUXNBR2NO?=
 =?utf-8?B?QmpMc25IY0hYU3B0ZlNRSk9hODVEdE9ERm9WbmpWQlgyVmd2L1FMYldjUzFi?=
 =?utf-8?B?N09NVDNkUTBYWFVLQTdhaWlHK0kxUHZKaDRVbDE4YWJ5RHl6alZ4RTAyR1Q5?=
 =?utf-8?B?ZUNhb1lVUGtTWC9tRUZPNHNFZ0xrR3hCYlFFVzZtNExsSGg3bHlrN1pXRnZQ?=
 =?utf-8?B?Y29aUUszQjVlMk93UDZOaTF4V1BuWGtCdHdIbHVYbFV0d0FNQyt5SUgwNmNY?=
 =?utf-8?B?RjQvK1RlTWVaL3NONG15ekNlSkI3blR0WU9MRFh2WGhhek9pRHdzNm01ZmJ0?=
 =?utf-8?B?OHJWa2hiV1NhVHRSQVZFWUh5NEVlajRjVEpScUw5a1kzV0pBbERESFJlYTlq?=
 =?utf-8?B?QWR0T21uT09CQ0FVa3pqNy9uY0dudjU2RndHM1ZVYjh5Rk1UVzNid0dKZmF2?=
 =?utf-8?Q?2DHyuwAB302Ra?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc8410ad-d4fa-4f1a-3380-08d8d98d27e6
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2021 12:59:15.8807 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KGzcu0bgdQm3TBwXC3AaHsYSVzw/XOYAwA/ayCrfLXS310jET6jQocr4VxkGBWlZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4756
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
Cc: Arnd Bergmann <arnd@arndb.de>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjUuMDIuMjEgdW0gMTM6NTIgc2NocmllYiBBcm5kIEJlcmdtYW5uOgo+IEZyb206IEFybmQg
QmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Cj4KPiBJIG5vdGljZWQgYSB3YXJuaW5nIGZyb20gJ25t
JyB3aGVuIENPTkZJR19UUklNX1VOVVNFRF9LU1lNUyBpcyBzZXQKPiBhbmQgSVNfUkVBQ0hBQkxF
KENPTkZJR19BR1ApIGlzIGZhbHNlOgo+Cj4gZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9z
dWJkZXYvcGNpL2FncC5vOiBubyBzeW1ib2xzCj4KPiBJIGxhdGVyIGZvdW5kIHRoaXMgaXMgY29t
cGxldGVseSBoYXJtbGVzcyBhbmQgd2Ugc2hvdWxkIGZpbmQgYSB3YXkKPiB0byBzdXBwcmVzcyB0
aGUgd2FybmluZywgYnV0IGF0IHRoYXQgcG9pbnQgSSBoYWQgYWxyZWFkeSBkb25lIGEKPiBjbGVh
bnVwIHBhdGNoIHRvIGFkZHJlc3MgdGhpcyBpbnN0YW5jZS4KPgo+IEl0IHR1cm5zIG91dCB0aGlz
IGNvZGUgY291bGQgYmUgaW1wcm92ZWQgYW55d2F5LCBhcyB0aGUgY3VycmVudCB2ZXJzaW9uCj4g
YmVoYXZlcyB1bmV4cGVjdGVkbHkgd2hlbiBBR1AgaXMgYSBsb2FkYWJsZSBtb2R1bGUgYnV0IG5v
dXZlYXUgaXMgYnVpbHQtaW4KPiBpdHNlbGYsIGluIHdoaWNoIGNhc2UgaXQgc2lsZW50bHkgb21p
dHMgYWdwIHN1cHBvcnQuCj4KPiBBIGJldHRlciB3YXkgdG8gaGFuZGxlIHRoaXMgaXMgd2l0aCBh
IEtjb25maWcgZGVwZW5kZW5jeSB0aGF0IHJlcXVpcmVzCj4gQUdQIGVpdGhlciB0byBiZSBkaXNh
YmxlZCwgb3IgZm9yY2VzIG5vdXZlYXUgdG8gYmUgYSBtb2R1bGUgZm9yIEFHUD1tLgo+IFdpdGgg
dGhpcyBjaGFuZ2UsIHRoZSBjb21waWxlLXRpbWUgaGFjayBjYW4gYmUgcmVtb3ZlZCBhbmQgbGxk
IG5vCj4gbG9uZ2VyIHdhcm5zLgo+Cj4gRml4ZXM6IDM0MGIwZTdjNTAwYSAoImRybS9ub3V2ZWF1
L3BjaTogbWVyZ2UgYWdwIGhhbmRsaW5nIGZyb20gbm91dmVhdSBkcm0iKQo+IFNpZ25lZC1vZmYt
Ynk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Cj4gLS0tCj4gICBkcml2ZXJzL2dwdS9k
cm0vbm91dmVhdS9LYnVpbGQgICAgICAgICAgICAgICAgIHwgMSArCj4gICBkcml2ZXJzL2dwdS9k
cm0vbm91dmVhdS9LY29uZmlnICAgICAgICAgICAgICAgIHwgMSArCj4gICBkcml2ZXJzL2dwdS9k
cm0vbm91dmVhdS9udmttL3N1YmRldi9wY2kvS2J1aWxkIHwgMiArLQo+ICAgZHJpdmVycy9ncHUv
ZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvcGNpL2FncC5jICB8IDIgLS0KPiAgIGRyaXZlcnMvZ3B1
L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L3BjaS9hZ3AuaCAgfCA5ICsrKysrLS0tLQo+ICAgNSBm
aWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvS2J1aWxkIGIvZHJpdmVycy9ncHUvZHJtL25v
dXZlYXUvS2J1aWxkCj4gaW5kZXggNjA1ODZmYjgyNzVlLi4xNzNiOGQ5ZDg1ZTMgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvS2J1aWxkCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL25vdXZlYXUvS2J1aWxkCj4gQEAgLTE1LDYgKzE1LDcgQEAgbm91dmVhdS15IDo9ICQobnZp
Zi15KQo+ICAgIy0gY29kZSBhbHNvIHVzZWQgYnkgdmFyaW91cyB1c2Vyc3BhY2UgdG9vbHMvdGVz
dHMKPiAgIGluY2x1ZGUgJChzcmMpL252a20vS2J1aWxkCj4gICBub3V2ZWF1LXkgKz0gJChudmtt
LXkpCj4gK25vdXZlYXUtbSArPSAkKG52a20tbSkKPiAgIAo+ICAgIyBEUk0gLSBnZW5lcmFsCj4g
ICBpZmRlZiBDT05GSUdfWDg2Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1
L0tjb25maWcgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9LY29uZmlnCj4gaW5kZXggMjc4ZTA0
ODIzNWE5Li45MDI3NmE1NTdhNzAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZl
YXUvS2NvbmZpZwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L0tjb25maWcKPiBAQCAt
Miw2ICsyLDcgQEAKPiAgIGNvbmZpZyBEUk1fTk9VVkVBVQo+ICAgCXRyaXN0YXRlICJOb3V2ZWF1
IChOVklESUEpIGNhcmRzIgo+ICAgCWRlcGVuZHMgb24gRFJNICYmIFBDSSAmJiBNTVUKPiArCWRl
cGVuZHMgb24gQUdQIHx8ICFBR1AKCk15IGZpcnN0IHRob3VnaHQgd2FzIFdURj8gQnV0IHRoZW4g
SSByZWFsaXplZCB0aGF0IHRoaXMgdG90YWxseSBtYWtlcyBzZW5zZS4KCldlIHNob3VsZCBwcm9i
YWJseSBoYXZlIHRoZSBzYW1lIGZvciByYWRlb24gYXMgd2VsbC4KCkFwYXJ0IGZyb20gdGhhdCB0
aGUgcGF0Y2ggaXMgQWNrZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgCjxjaHJpc3RpYW4ua29lbmln
QGFtZC5jb20+Cgo+ICAgCXNlbGVjdCBJT01NVV9BUEkKPiAgIAlzZWxlY3QgRldfTE9BREVSCj4g
ICAJc2VsZWN0IERSTV9LTVNfSEVMUEVSCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9u
b3V2ZWF1L252a20vc3ViZGV2L3BjaS9LYnVpbGQgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9u
dmttL3N1YmRldi9wY2kvS2J1aWxkCj4gaW5kZXggMTc0YmRmOTk1MjcxLi5hNDAwYzY4MGNmNjUg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvcGNpL0ti
dWlsZAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L3BjaS9LYnVp
bGQKPiBAQCAtMSw1ICsxLDUgQEAKPiAgICMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IE1JVAo+
IC1udmttLXkgKz0gbnZrbS9zdWJkZXYvcGNpL2FncC5vCj4gK252a20tJChDT05GSUdfQUdQKSAr
PSBudmttL3N1YmRldi9wY2kvYWdwLm8KPiAgIG52a20teSArPSBudmttL3N1YmRldi9wY2kvYmFz
ZS5vCj4gICBudmttLXkgKz0gbnZrbS9zdWJkZXYvcGNpL3BjaWUubwo+ICAgbnZrbS15ICs9IG52
a20vc3ViZGV2L3BjaS9udjA0Lm8KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZl
YXUvbnZrbS9zdWJkZXYvcGNpL2FncC5jIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9z
dWJkZXYvcGNpL2FncC5jCj4gaW5kZXggMzg1YTkwZjkxZWQ2Li44NmM5ZTFkNjU4YWYgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvcGNpL2FncC5jCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvcGNpL2FncC5jCj4gQEAg
LTIwLDcgKzIwLDYgQEAKPiAgICAqIE9USEVSIERFQUxJTkdTIElOIFRIRSBTT0ZUV0FSRS4KPiAg
ICAqLwo+ICAgI2luY2x1ZGUgImFncC5oIgo+IC0jaWZkZWYgX19OVktNX1BDSV9BR1BfSF9fCj4g
ICAjaW5jbHVkZSA8Y29yZS9vcHRpb24uaD4KPiAgIAo+ICAgc3RydWN0IG52a21fZGV2aWNlX2Fn
cF9xdWlyayB7Cj4gQEAgLTE3Miw0ICsxNzEsMyBAQCBudmttX2FncF9jdG9yKHN0cnVjdCBudmtt
X3BjaSAqcGNpKQo+ICAgCj4gICAJcGNpLT5hZ3AubXRyciA9IGFyY2hfcGh5c193Y19hZGQocGNp
LT5hZ3AuYmFzZSwgcGNpLT5hZ3Auc2l6ZSk7Cj4gICB9Cj4gLSNlbmRpZgo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9wY2kvYWdwLmggYi9kcml2ZXJz
L2dwdS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9wY2kvYWdwLmgKPiBpbmRleCBhZDRkMzYyMWQw
MmIuLjA0MWZlMWZiZjA5MyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9u
dmttL3N1YmRldi9wY2kvYWdwLmgKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmtt
L3N1YmRldi9wY2kvYWdwLmgKPiBAQCAtMSwxNSArMSwxNCBAQAo+IC0vKiBTUERYLUxpY2Vuc2Ut
SWRlbnRpZmllcjogTUlUICovCj4gLSNpbmNsdWRlICJwcml2LmgiCj4gLSNpZiBkZWZpbmVkKENP
TkZJR19BR1ApIHx8IChkZWZpbmVkKENPTkZJR19BR1BfTU9EVUxFKSAmJiBkZWZpbmVkKE1PRFVM
RSkpCj4gICAjaWZuZGVmIF9fTlZLTV9QQ0lfQUdQX0hfXwo+ICAgI2RlZmluZSBfX05WS01fUENJ
X0FHUF9IX18KPiAgIAo+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTUlUICovCj4gKyNp
bmNsdWRlICJwcml2LmgiCj4gKyNpZiBJU19FTkFCTEVEKENPTkZJR19BR1ApCj4gICB2b2lkIG52
a21fYWdwX2N0b3Ioc3RydWN0IG52a21fcGNpICopOwo+ICAgdm9pZCBudmttX2FncF9kdG9yKHN0
cnVjdCBudmttX3BjaSAqKTsKPiAgIHZvaWQgbnZrbV9hZ3BfcHJlaW5pdChzdHJ1Y3QgbnZrbV9w
Y2kgKik7Cj4gICBpbnQgbnZrbV9hZ3BfaW5pdChzdHJ1Y3QgbnZrbV9wY2kgKik7Cj4gICB2b2lk
IG52a21fYWdwX2Zpbmkoc3RydWN0IG52a21fcGNpICopOwo+IC0jZW5kaWYKPiAgICNlbHNlCj4g
ICBzdGF0aWMgaW5saW5lIHZvaWQgbnZrbV9hZ3BfY3RvcihzdHJ1Y3QgbnZrbV9wY2kgKnBjaSkg
e30KPiAgIHN0YXRpYyBpbmxpbmUgdm9pZCBudmttX2FncF9kdG9yKHN0cnVjdCBudmttX3BjaSAq
cGNpKSB7fQo+IEBAIC0xNywzICsxNiw1IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBudmttX2FncF9w
cmVpbml0KHN0cnVjdCBudmttX3BjaSAqcGNpKSB7fQo+ICAgc3RhdGljIGlubGluZSBpbnQgbnZr
bV9hZ3BfaW5pdChzdHJ1Y3QgbnZrbV9wY2kgKnBjaSkgeyByZXR1cm4gLUVOT1NZUzsgfQo+ICAg
c3RhdGljIGlubGluZSB2b2lkIG52a21fYWdwX2Zpbmkoc3RydWN0IG52a21fcGNpICpwY2kpIHt9
Cj4gICAjZW5kaWYKPiArCj4gKyNlbmRpZgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==

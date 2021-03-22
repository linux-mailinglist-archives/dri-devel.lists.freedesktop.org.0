Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BAD34404F
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 12:58:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 737C56E44C;
	Mon, 22 Mar 2021 11:58:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2044.outbound.protection.outlook.com [40.107.244.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0584789CC9;
 Mon, 22 Mar 2021 11:58:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eLwj3SJdbQ8ImIxdXeAhYwh2Qe59UqFEElmkRZGuKiGnQsEUb9xuUU8vL6bPdoNLm37uZN4MnCnJNvYQZr/wVEGHNOnzrf5NR+2yHHrRJ9vzabWL73sLdn5iVZ+gX5u4KPnLvYqKYs3gHr7ozyaIXetuSunnq5Yf6Hya8wmWGvsj5GDoMOeqcnUie7u8nqnK5YrZDbMnCi4JApwm1T60axsrybH2WpHZffXIhfjll/v/gnllHGQgwiOWl/UerTRdHrWvBDxyPjYvkhmKyr36qxi0wpldshSxPgi2Qj42p1fqIBjhqhwgRdaO8c3dNU7ifV8Q31hPHku/HshtWOcZ7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G883sjOj/bQ3RfhdFZ36x4y/IjNHJyP87/9oaQyXzfM=;
 b=f52WpEYjdS92WywI06CGBlms6MGqSRWfMqm8KwswO/en79srOdG0vxtuKrEcX9cSotQnN0RfDAMMfAyxbboly/Uy/T5OoIkd2CvM73UUXqyy7XChygr+HBA7/8+Sdo2HRpy7CH9+2OGIDT5nxwOBdiFQxcD2sW7wJ15xjxO4QXWDxrIUCY22UTlEXgB7TAphvTDsxP0vKTRfEm/Epn3iDSGrpkUG1Ee/kDKPSgiQVWzynDAmCqbjBIqUVx65YLuYW+UVnOA3mUFENNZqzDH+NGu0dhuORuAbuQjipgPM0VAPleolZXIYuE3ZJcNPsFZ/uGbXKPq5Hh1Wee86PFh87g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G883sjOj/bQ3RfhdFZ36x4y/IjNHJyP87/9oaQyXzfM=;
 b=ff1sdGzyApjCigxbLHTieEtauJG1kHzF+6rvaEvO3ABh6cv8OY45vmZWXdRplARN0iIRbMqmv4x7KWg/wMBaeLje4Z3wri698sICZQCzIhbEwPA3ZI1yWzBPUuPDzGwrdHn0vpAhjout4A4y+kpc6y3aT3H7xldK6qIDyjUw/us=
Authentication-Results: googlegroups.com; dkim=none (message not signed)
 header.d=none;googlegroups.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4390.namprd12.prod.outlook.com (2603:10b6:208:26e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.25; Mon, 22 Mar
 2021 11:58:29 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3955.027; Mon, 22 Mar 2021
 11:58:29 +0000
Subject: Re: [PATCH] amdgpu: avoid incorrect %hu format string
To: Arnd Bergmann <arnd@kernel.org>, Alex Deucher
 <alexander.deucher@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20210322115458.3961825-1-arnd@kernel.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <385b8150-ab31-0a53-db09-e0dcdd1d7c25@amd.com>
Date: Mon, 22 Mar 2021 12:58:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210322115458.3961825-1-arnd@kernel.org>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:e345:6f8e:fa4b:2c52]
X-ClientProxiedBy: AM4PR0302CA0020.eurprd03.prod.outlook.com
 (2603:10a6:205:2::33) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:e345:6f8e:fa4b:2c52]
 (2a02:908:1252:fb60:e345:6f8e:fa4b:2c52) by
 AM4PR0302CA0020.eurprd03.prod.outlook.com (2603:10a6:205:2::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Mon, 22 Mar 2021 11:58:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 130530c0-c46f-4ddc-d0b9-08d8ed29ce17
X-MS-TrafficTypeDiagnostic: MN2PR12MB4390:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4390FFD1C67D9865938D45EF83659@MN2PR12MB4390.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5/qu3R3BnomeW3WmsOT0rUwl05IZv2NHh6kPmqBlbYQhcfiv22HW5/v0xra2aB6mq2N+VjGb9eJVdDYldvlgz/LYMg9vxSdmhhxGkG/MvQ9jwrmhDd9+kid79dGmhQKPGnyu28xfixaAbZ+M+abFnl5o4nybWd8r4xmkBbL8gQ85p2kNsyxQWGRCwUsokrbQUkZLB4eLMjr8J1vQ0S7rXkcHULsJaJI89OANX94wDExgtXS8Q1jHYXZ0gFfL1otltTs5YDulFPqCm45SDqyKyMEIOSJhneXttr4zFAVnuOGiBhFhNT89V8ciz3/wyPv3t9zQ/aAG5xmXvgQFaae7aGLta7onL4jX3TjAcSWW+niLXiq69O1QrAmBKjFEptGB2auj8S4Bth2GwQRfOyXvuXv2jr6H74KvL43l6PkBIrENftHLs8flVEsu33jtdz0Dy72VcedQn5c5MDduI9SLK8EvHpvXOqGQryFJzBzASbFjcKhPVMK5ZQPiH3ZwBEIhnp4qtHu9YcK54FIKvsiCpr0IGMI71ZdsjVxyCnDcgl6Ab2AwVKls7nZFDG3OkV17L94mYJrVgFiYdvaEf9x/n18eQs87TCtMMxetOCnVF1bRjD0vVQSqhopBLvkv+iYNu2HDYpJDx37U7tdNQUoWtBMOjexjWUg0vyajJAo4P2UPi+52daZOzhplc2W0h7/sf9wsmGx0v7dxOrvWcEN4fvuybOamccsUgwAUUWYxC4I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(346002)(39860400002)(396003)(366004)(7416002)(52116002)(2906002)(5660300002)(4326008)(31696002)(2616005)(38100700001)(8676002)(54906003)(110136005)(478600001)(316002)(6486002)(86362001)(8936002)(66476007)(31686004)(66946007)(66556008)(6666004)(16526019)(186003)(36756003)(83380400001)(66574015)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Yitsdm85ay9hUU1GZi9XVG5mQlBWa3NkMFcrVTlCc09tRE1zOUFPd0lXUmhJ?=
 =?utf-8?B?QTBwZ1dFdUxIaXVncDU0Y1JwNlRMMEFaaVpRTVhWYXlpRmlJb1NIRnMvaEJo?=
 =?utf-8?B?UjdoSkhqbDNEaG5Fd0NWemdobnFXQ3BqYWFSclU1b3pYbXpzS3VTZWN3RmxJ?=
 =?utf-8?B?ZDErNlZObXM5UUpJV0x2cHRBMGxWSGNoTENpNW5QUnF2ZHhnY1F1SHd0NExs?=
 =?utf-8?B?bUVpWFczdGlvZGRyZ3hCamh4TXZOQkk1UUFTNzgyNlRRWWhuRWF3TzAzckM4?=
 =?utf-8?B?eks5L2liU0w0OVY1dW8rV2RSQ292Mmt3UjR5UlBqV2JReG9lc3dpbUlPTG1L?=
 =?utf-8?B?Y3E2WWNOUHRDOFZUbTByM3p6TTNpOEcrSytndGI1SzFkeUU1Sm9oUUxGaTZB?=
 =?utf-8?B?ZmFRVnJ1Sm55VmVSaGpKZDlKUmZJU1VaZFJGUUlzRCtHVjJQVVFicTZScTBm?=
 =?utf-8?B?MlQ2TkprY1UwbnEvdzNiak5aaDJnZHg5REhsRjl6cFRnNXArbWtQc3h0ZGNy?=
 =?utf-8?B?OWdxQXRBU3c4SnFncVZqdmgyeWwwVlg2WUZ4U250aVBlaG1nOWx6ejUrMHda?=
 =?utf-8?B?TXhaVTZTTHRXdGlQN2VxemdtQVIyZlJoRHlyVmtzMitjdStSY25oN2lEV1NW?=
 =?utf-8?B?QzgrYld4djB2R1MrR2puRkxNVmF2QTZHNVNuWWxBdG9SMlVzanJMQVQ4MGhD?=
 =?utf-8?B?bmJnNU4vdUI5Snk1c25nQWpydE9qTUxCNEdBbzhJY2k0YXVzMklJci9sT2VE?=
 =?utf-8?B?bWFMREt5UWVKRlNnWVJqWUFHL05uNUtFejlEc0lyK0I5TzFKdjJsTmFrMzRz?=
 =?utf-8?B?TE9tN3RHN1Y4eVcxTDhVZGNna2t4RURUd01MRzJKZmpQWk9SWjlMUHZXVXAr?=
 =?utf-8?B?Q2xGVW53ek1pVW1FU3dOYzYveW1mcSt3RjFYZmFTOGZqamJVWVJZWVZOd29k?=
 =?utf-8?B?dVB0OERGRVl6bU4rWk1vUWN5NXV0RTdTNm1iYVg0T2RWa2haTUQzLzJMU2JF?=
 =?utf-8?B?N3R2NUYrYlZHTENHbzZtRlBEa0d2WS9xNHlSV1BtREhQL050QmtCWUFpbSs4?=
 =?utf-8?B?TE5LcjNqZG1Sc1FEazRVcENrM3ZORkg0Zmo4aXFsQ0N4VDZCK0xaL3QzeGdo?=
 =?utf-8?B?TmpzdGFhOW5Fd0luL0M5ZUlteXNLcDVpTVNEaXRoMnV4STVXcytrRVV1cTND?=
 =?utf-8?B?TDQrT0JrSWhaeVFWRWdpRG9mYnpVY0cxZ21sZ0xYRGFueU1mVE5DcDczWERP?=
 =?utf-8?B?L0paVEM4cldKcEFYdS9ZdkJmRlF4dmJOM2R3dzV4UzE0WkptOUJtT3FtU29I?=
 =?utf-8?B?MjZsbU9tWXJ0SlpNaFdHWWFKWnM2aFVyQUNjd2pYUks2VVo3em9pcHkweU1F?=
 =?utf-8?B?ZE1saTJIaWU4R2U2SW0yQ3NaeHZyWThpOHc4UGczbU5kUmxDSlQveHhJOFJn?=
 =?utf-8?B?Q1F5RldMUmtjY0ErMUlrSkllbHU1TmY3YmFBUmh3WC9pQndpOU1uNjdCR3ly?=
 =?utf-8?B?Ry95UHorUUVHRytYam9WN21veUpFZE1YRkpBbFNjZGphYXhtay9NUk1qVkU1?=
 =?utf-8?B?Q0d4MkFmeVM0RkgyVDNSVG0xcG1IUy9NeTNtRmFoVzNkbWVHRUFYOStiVTlJ?=
 =?utf-8?B?bWJRTlBudVRvRkl2cjJQZkd5aW41VnhpTUhHZ1ZCUktpWWZHamEwamx5UHJV?=
 =?utf-8?B?Zi9GVHJTbU84eXZXSXNjS28rMkgvTU1NY1FxYktKcFQzUlhseUJoTmdwSGxx?=
 =?utf-8?B?WGlZT2UxeDRuR2o0d05Nbmc0Z2NRNTJaOHhpWHE5WStWMk1LRi8xYUk0ZGw2?=
 =?utf-8?B?a1VYdUxNN1pHZTNhd3Q0aU5KWmZsOGlJQWR0dzdsMzZST0pCK3pRVDBWM2Rw?=
 =?utf-8?Q?XSEc5lG+ftFOE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 130530c0-c46f-4ddc-d0b9-08d8ed29ce17
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 11:58:29.5975 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iSwj3bajZvFAWcKed6mBdH6Jtqke/2w2nqrqL1OxDYHkJ7DBO9PxX77mUS7TAlgm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4390
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
Cc: Sonny Jiang <sonny.jiang@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 Tom Rix <trix@redhat.com>, dri-devel@lists.freedesktop.org,
 xinhui pan <xinhui.pan@amd.com>, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Nathan Chancellor <nathan@kernel.org>, clang-built-linux@googlegroups.com,
 Chen Li <chenli@uniontech.com>, Lee Jones <lee.jones@linaro.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjIuMDMuMjEgdW0gMTI6NTQgc2NocmllYiBBcm5kIEJlcmdtYW5uOgo+IEZyb206IEFybmQg
QmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Cj4KPiBjbGFuZyBwb2ludHMgb3V0IHRoYXQgdGhlICVo
dSBmb3JtYXQgc3RyaW5nIGRvZXMgbm90IG1hdGNoIHRoZSB0eXBlCj4gb2YgdGhlIHZhcmlhYmxl
cyBoZXJlOgo+Cj4gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3V2ZC5jOjI2Mzo3
OiB3YXJuaW5nOiBmb3JtYXQgc3BlY2lmaWVzIHR5cGUgJ3Vuc2lnbmVkIHNob3J0JyBidXQgdGhl
IGFyZ3VtZW50IGhhcyB0eXBlICd1bnNpZ25lZCBpbnQnIFstV2Zvcm1hdF0KPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHZlcnNpb25fbWFqb3IsIHZlcnNpb25fbWlub3IpOwo+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fgo+IGluY2x1
ZGUvZHJtL2RybV9wcmludC5oOjQ5ODoxOTogbm90ZTogZXhwYW5kZWQgZnJvbSBtYWNybyAnRFJN
X0VSUk9SJwo+ICAgICAgICAgIF9fZHJtX2VycihmbXQsICMjX19WQV9BUkdTX18pCj4gICAgICAg
ICAgICAgICAgICAgIH5+fiAgICBefn5+fn5+fn5+fgo+Cj4gQ2hhbmdlIGl0IHRvIGEgcmVndWxh
ciAldSwgdGhlIHNhbWUgd2F5IGEgcHJldmlvdXMgcGF0Y2ggZGlkIGZvcgo+IGFub3RoZXIgaW5z
dGFuY2Ugb2YgdGhlIHNhbWUgd2FybmluZy4KPgo+IEZpeGVzOiAwYjQzN2U2NGUwYWYgKCJkcm0v
YW1kZ3B1OiByZW1vdmUgaCBmcm9tIHByaW50ayBmb3JtYXQgc3BlY2lmaWVyIikKPiBTaWduZWQt
b2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgoKUmV2aWV3ZWQtYnk6IENocmlz
dGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KCj4gLS0tCj4gICBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdXZkLmMgfCAyICstCj4gICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdXZkLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfdXZkLmMKPiBpbmRleCBlMmVkNDY4OTExOGEuLmM2ZGJjMDgwMTYwNCAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdXZkLmMKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdXZkLmMKPiBAQCAtMjU5LDcgKzI1
OSw3IEBAIGludCBhbWRncHVfdXZkX3N3X2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYp
Cj4gICAJCWlmICgoYWRldi0+YXNpY190eXBlID09IENISVBfUE9MQVJJUzEwIHx8Cj4gICAJCSAg
ICAgYWRldi0+YXNpY190eXBlID09IENISVBfUE9MQVJJUzExKSAmJgo+ICAgCQkgICAgKGFkZXYt
PnV2ZC5md192ZXJzaW9uIDwgRldfMV82Nl8xNikpCj4gLQkJCURSTV9FUlJPUigiUE9MQVJJUzEw
LzExIFVWRCBmaXJtd2FyZSB2ZXJzaW9uICVodS4laHUgaXMgdG9vIG9sZC5cbiIsCj4gKwkJCURS
TV9FUlJPUigiUE9MQVJJUzEwLzExIFVWRCBmaXJtd2FyZSB2ZXJzaW9uICV1LiV1IGlzIHRvbyBv
bGQuXG4iLAo+ICAgCQkJCSAgdmVyc2lvbl9tYWpvciwgdmVyc2lvbl9taW5vcik7Cj4gICAJfSBl
bHNlIHsKPiAgIAkJdW5zaWduZWQgaW50IGVuY19tYWpvciwgZW5jX21pbm9yLCBkZWNfbWlub3I7
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

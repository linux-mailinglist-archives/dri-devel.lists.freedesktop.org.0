Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C62C2E1A2A
	for <lists+dri-devel@lfdr.de>; Wed, 23 Dec 2020 09:55:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24BCF89DC1;
	Wed, 23 Dec 2020 08:54:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2088.outbound.protection.outlook.com [40.107.92.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D312A89DC1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Dec 2020 08:54:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l47nvmNCAzwiE022tDK3VekLpA32HCFYV94QZN2r5obO9TiJwoWo970/cvuhs+2QfsA1GsDLe1ehZgF7i/3ZPNUhtFPhpCOfOIcQmozvDUBnKNQRN7sS23G7f3qaGhspCLH7cj+cqejkLPbG2h4zFQWOacxm3XWq0LcR4i4xZkZoYtxZQf5PtJfaLXTOaaurOFq1HXQ6xQRoZP01haimw9UyH9y5ZT10Bthhop5KkLucCS47ZF8DIybuDj0c7bpXA/7wgOxeRxR2MlGxIA9yGOzOIIwcc2eL7eGFszDz3xVI+2icFrrPEDOhYMT7sA3WRbab8XI/QMplC3RKmYhFxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0MbdxRAqXouDI1iOGpFpgOu5enMY1k4tfEnhNyHkBSU=;
 b=DY3sveeJmR13a2IUB8xrz+mPidLe+v7kbTR1KfdbhnOu0LB1rhqFQAFqL06P+jg4IF+07acierODgas7oPmtid6uvKCRNcYeyPUmxbuwXl3/kR/VextDrI5Bh0OSjxk6cOdF1xa+dsYrFKyLFKar6zsXtoZYByuBT8FHoOglLLl+od8P3l72lAVmPBxUJnf3cdJqG9jUSaYU3oEmSkkWKOMHcTQgdNUA9yyaIZl5dcMYSwmF2xRq45A6TgEQoKVyrc8Be+0uWnQQI+ZCLCIGE2l3LF1RtoSayRANrJenCtmkDYzAq/pI6PISTm0x9rPLl/svbhF2fHNzDKQf53V/Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0MbdxRAqXouDI1iOGpFpgOu5enMY1k4tfEnhNyHkBSU=;
 b=JADBtDYm1C2jsaz74HDSamtYEHM4Vtigd7PnBmW8cPiGD5H1hPGYbnmkhAI94lPU8DmHuuy92yd/jGvcUTaQUcudfY8qEbhRaC3Xh4K8dLY3BUYgWfu5xEo9oxSAJ5hKjm9eXWoqjdQsKy1TKJrgK/hF9+DCBvocl8QfyRDP5rc=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4947.namprd12.prod.outlook.com (2603:10b6:208:17d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27; Wed, 23 Dec
 2020 08:54:54 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3700.026; Wed, 23 Dec 2020
 08:54:54 +0000
Subject: Re: [PATCH 2/2] drm/amdgpu: use GTT for uvd_get_create/destory_msg
To: Chen Li <chenli@uniontech.com>, dri-devel@lists.freedesktop.org
References: <87r1njy1s7.wl-chenli@uniontech.com>
 <87pn33y1fc.wl-chenli@uniontech.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <73336ba2-343d-ddba-54fe-4ebf75654394@amd.com>
Date: Wed, 23 Dec 2020 09:54:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <87pn33y1fc.wl-chenli@uniontech.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR06CA0127.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::32) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR06CA0127.eurprd06.prod.outlook.com (2603:10a6:208:ab::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3700.27 via Frontend Transport; Wed, 23 Dec 2020 08:54:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2ab76b79-4a2c-417d-5e08-08d8a7206a96
X-MS-TrafficTypeDiagnostic: BL0PR12MB4947:
X-Microsoft-Antispam-PRVS: <BL0PR12MB4947629D47E5A782EE6B38D283DE0@BL0PR12MB4947.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:94;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i8nVn1Y5c8pClY3YnBjZ5URR5Gvuy1gf57IwuwN7PEC6VNzpJhte9XOij+YPB7Iqn38gAoHBo1ImAsVjfO+LWfaZF8qXuXHL2XBq6xFD9Liy9YB5R+mLiAGFVEPXoByH/63026Xxkx6RETQriQatVbjIoUV2WCq4gl+qWO21wPx0AY/h/k3FSdZzGCNy9U6G9VrsmKl9uRtGvFlxA3PJwPtGPoBsQbl3OoBwrGJpyM6j2h80iuKbEFKfX5/YzkoN6AY9RMmdyIkAdOvWIg2+9rbBMC4dY06b853w0QOuAxpBKBCM1eNdd2C6hbQ3wU3wScnslYXZxCnZaF0MCip8op9Hbght6iJ7RYOVcjj3Ml7JHb7+RhL+9L3wYDSmaLf1COy5fJs3382tgUD3heTe9cFNv3+YTT9Z4gx39DcGz5c5AeglxxIeSqolUkJWYwD0GkusBpDRLuVY2cCQXtu6IoWzFmw9m8pClZgRljzqCGE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(136003)(346002)(396003)(366004)(2616005)(6486002)(6666004)(478600001)(8936002)(8676002)(31696002)(86362001)(36756003)(66476007)(66946007)(52116002)(66556008)(186003)(83380400001)(316002)(5660300002)(31686004)(2906002)(16526019)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Mk1NWmRxWnM2RWxlTUQ1OGRTcDExMDVxTG0xZWpEeEVnOHJsLzIyNjFZaDlB?=
 =?utf-8?B?NXRMaEhTSlhDRXdpczdyQnlTMEhxRGpEZERYeFVJdEEwSmUxdFVZQzBPZ3dB?=
 =?utf-8?B?b3h5MzJicHhVanBlWjBoQUo3WmdEWXNtUER3Z1VZSEZnaURFSXowT2NmSm5R?=
 =?utf-8?B?QVNPemNUdDlqL1Nwb1phbCt2S0xWZVlKWDQ4WEdMbVlXNWRwcHgrMy9tYVhX?=
 =?utf-8?B?RE54MjVsOVBaU1drbldLZWxvSlZnbnNZc212c3BVaEczQlFvRDlwbHF0cnlH?=
 =?utf-8?B?L1A0T1hYZE9TRXB0Qm5QZTBteG5nM080UEF3YjRFTXJ2czZwN1pZWmxGQlZv?=
 =?utf-8?B?OE56MGQ3c1M1QVZHbUtSN1JoNUp6NStKTTMrNnRqYjIvSS9KSGtpeFR6V1Zo?=
 =?utf-8?B?ZlBQMGVHSXJLODlPQ2MyN3RPekdGZitPWEhkWW1zQzEyNHBVbE5yNUFSSHgz?=
 =?utf-8?B?U3dIczFxWEZmQ2V6eGRTOWFvajE4d05xVWY0Wlo4a0tWVVVUdDR3M3ZwcGZU?=
 =?utf-8?B?R3N4UWppcFNvOW9HQW5VdGpKZGtLM3c0VUREZ0FFTXZXbVVDUFJnOTNEcnpq?=
 =?utf-8?B?Y1hHS293ZEoyWEtrNkhMaEtnZU9pVCs3WTlpS3JmVUhYVXQwdkI1cDBvWWRU?=
 =?utf-8?B?YWQ4SzVDekdIVWNwNy9rTndYUEpzL2RudHJrZWMzelBIZk4yRFo4Mi8yKzU2?=
 =?utf-8?B?dm0vWWl3MDd2bkxKZ2xLT2hPUmxkMWE3d0Q4bjkrUFhCeDdsaWc1WEtUM2FQ?=
 =?utf-8?B?d0pnQmEyM3prMWFoZndIbExSNnN0TkdnWUJDczB0ZnpQTEk2Z3RYRkZDMmsv?=
 =?utf-8?B?clBsenpUdTc3aGhPY042bEdCbCtMMFdKdmcyQ3FQNzl2UkhRMmJwRkdoa3pZ?=
 =?utf-8?B?NlNFWm1LREpJQzhONXFHZUdxcm9DYUxOb2prdnpnVFpvUGJESEw0SEpZR0Jz?=
 =?utf-8?B?a1pTTVRVc1NRMGlROTNuRFowU0MrVEphNGhROTQraC9LYXAvUko2OGJZRTBx?=
 =?utf-8?B?QUNXUS9lSkdXVXA3QUdmMmZvMmxGL3ZXNENzcERXaGN5ako2dnZnQ0MvN2NR?=
 =?utf-8?B?T0w4N2tpSTNXRFFDYkJGR2FoL3lqMmVUNk1MUU5WU1dOeUh1ZlNzZWQxYVlv?=
 =?utf-8?B?SGJPc2RwK1RDb2J5enE2VkQvVGZXUmZzbHliako4bWx6bFhhR0psOUpwRG5p?=
 =?utf-8?B?TEhEdnd6SE1BY2NZcDZEM25nQjIxZHE0WjZ3YnNyR2NPTmtzc3MrcFR6NUZL?=
 =?utf-8?B?bnBna3JURyttcVovT0g0TVZLSHVvcGlWSVJNa0J1YXNleUJEc2s1c0tDQXkr?=
 =?utf-8?B?Mm44UHFXem5BelpDMDhtK0tSdEdyWExWN1BiQlVJMlZQcEY0cG0wRHhzV0FY?=
 =?utf-8?B?Zjh3MDhBVnVKU0c1eGlUdHVUV1dJc0I4clZtK3Z3RExaTWFiWkZLUkxzTW1G?=
 =?utf-8?Q?AC2OXUhX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2020 08:54:54.0687 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ab76b79-4a2c-417d-5e08-08d8a7206a96
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p4VRv3ep5CESfxzhWg5D6xQy2pzhoP+jAhKVDLfELJ77xhAxIO1RIIBaTHTD7C/Q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4947
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjEuMTIuMjAgdW0gMTA6MDUgc2NocmllYiBDaGVuIExpOgo+IE9uIG1vZGVybiBncHVzLCBH
VFQgKHN5c3RlbSBtZW1vcnkpIHdvcmtzIGFzIHdlbGwgaGVyZSwgYW5kIHRoaXMgbWF5Cj4gYWxz
byBiZSBhIHdvcmthcm91bmQgZm9yIHBsYXRmb3JtcyB3aGljaCBjYW5ub3QgbWFwIHZyYW0gY29y
cmVjdGx5Lgo+Cj4gU2lnbmVkLW9mZi1ieTogY2hlbmxpIDxjaGVubGlAdW5pb250ZWNoLmNvbT4K
ClJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+
Cgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3V2ZC5jIHwgNCAr
Ky0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91dmQuYyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91dmQuYwo+IGluZGV4IDhiOTg5Njcw
ZWQ2Ni4uZTJlZDQ2ODkxMThhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV91dmQuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV91dmQuYwo+IEBAIC0xMTcwLDcgKzExNzAsNyBAQCBpbnQgYW1kZ3B1X3V2ZF9nZXRfY3JlYXRl
X21zZyhzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsIHVpbnQzMl90IGhhbmRsZSwKPiAgIAlpbnQg
ciwgaTsKPiAgIAo+ICAgCXIgPSBhbWRncHVfYm9fY3JlYXRlX3Jlc2VydmVkKGFkZXYsIDEwMjQs
IFBBR0VfU0laRSwKPiAtCQkJCSAgICAgIEFNREdQVV9HRU1fRE9NQUlOX1ZSQU0sCj4gKwkJCQkg
ICAgICBBTURHUFVfR0VNX0RPTUFJTl9HVFQsCj4gICAJCQkJICAgICAgJmJvLCBOVUxMLCAodm9p
ZCAqKikmbXNnKTsKPiAgIAlpZiAocikKPiAgIAkJcmV0dXJuIHI7Cj4gQEAgLTEyMDIsNyArMTIw
Miw3IEBAIGludCBhbWRncHVfdXZkX2dldF9kZXN0cm95X21zZyhzdHJ1Y3QgYW1kZ3B1X3Jpbmcg
KnJpbmcsIHVpbnQzMl90IGhhbmRsZSwKPiAgIAlpbnQgciwgaTsKPiAgIAo+ICAgCXIgPSBhbWRn
cHVfYm9fY3JlYXRlX3Jlc2VydmVkKGFkZXYsIDEwMjQsIFBBR0VfU0laRSwKPiAtCQkJCSAgICAg
IEFNREdQVV9HRU1fRE9NQUlOX1ZSQU0sCj4gKwkJCQkgICAgICBBTURHUFVfR0VNX0RPTUFJTl9H
VFQsCj4gICAJCQkJICAgICAgJmJvLCBOVUxMLCAodm9pZCAqKikmbXNnKTsKPiAgIAlpZiAocikK
PiAgIAkJcmV0dXJuIHI7CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK

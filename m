Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B8E31BB01
	for <lists+dri-devel@lfdr.de>; Mon, 15 Feb 2021 15:26:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76F766E81E;
	Mon, 15 Feb 2021 14:26:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2080.outbound.protection.outlook.com [40.107.244.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE4C66E81E;
 Mon, 15 Feb 2021 14:26:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VlxSotLv6OECl+JnlX9bfjPiku9Yqo/R8VxXonfucN9MV13QGg472JedaNU0R3dHUPq1xvZHcQoh04TPAuverRAnn19nSCXH67brD8DxUo5gKRM+OgeXyjlMy3LYJHphMOwNubkgXt5Fi5xkBiAuDtwrwguM/WiYp4X7U9BxQmY6/Z3cJSn1uTmIWDez/S3S6Sr56Lk2sTGLvq2evVR32gPZtMbkLgVH2dKN8HgFP+5ixtOhp6L/IFyPIY5TbKSwIYFVX1AkQcG74xtOmgQ9WCuAJtSeynzWnpYFGWvqyb/bptc+saEMo+NCSHdPEBLm0Fs0HhBqoW+ssXFssYdcfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kEPCJpwUacu5aR2jhd5tpwqz0a7bZLdP6xbT0Qt4Rkw=;
 b=Uc56oFrd9vIPa4wLLNbiKwQqBBJS9YS6n9ZJuqk9FhhJPefuEbEb9ebt5RJXAmws7uHVgyvG/zwF60WurQsnJY9pQSeL1UUnWctp+FCSlUINY6FAbRfZ+pfjVstx4xpOZWX9FG2lSz5dnnGB5Uh+ACi1HPyIvXAMNrwdDR2pTnmhRg5lkCxRXJZjg8IAGtWDfZ6L8KVSuVeY36BoNUxAHf/utv3hycKsG7dQfETsJ2jIIFtS1IdBWNcCCiqi368iwa/wzPhIx13NSCQESwQZ6sVePP5LMaV3lqjM1pZt5wqLYbfqEA72KSSefdc2GUbMRgXiApd4cdpJzwizFQhpwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kEPCJpwUacu5aR2jhd5tpwqz0a7bZLdP6xbT0Qt4Rkw=;
 b=wEA6EyQ8iPdIx8ujPGQK6tluBNgfZBSl+A0s9OO1CB3zGSmEK6UEOTpYmjWjFPdjCsMx/UJMzyW0lF9FWKLukwoltrNqQ6yGVZae6eN4UfF9gP6/SsH1v9Fttr15yePvxclc4iCXNFWB157E5ohWkroiBtGuM5elDE6pycS34UY=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4223.namprd12.prod.outlook.com (2603:10b6:208:1d3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Mon, 15 Feb
 2021 14:26:16 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3846.038; Mon, 15 Feb 2021
 14:26:16 +0000
Subject: Re: [PATCH v1 1/3] string: Consolidate yesno() helpers under string.h
 hood
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Mikita Lipski <mikita.lipski@amd.com>, Eryk Brol <eryk.brol@amd.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 "David S. Miller" <davem@davemloft.net>,
 Rahul Lakkireddy <rahul.lakkireddy@chelsio.com>,
 Francis Laniel <laniel_francis@privacyrequired.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 netdev@vger.kernel.org
References: <20210215142137.64476-1-andriy.shevchenko@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <43456ba7-c372-84cc-4949-dcb817188e21@amd.com>
Date: Mon, 15 Feb 2021 15:26:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210215142137.64476-1-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:83c6:b72d:87bd:4259]
X-ClientProxiedBy: AM0PR01CA0086.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::27) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:83c6:b72d:87bd:4259]
 (2a02:908:1252:fb60:83c6:b72d:87bd:4259) by
 AM0PR01CA0086.eurprd01.prod.exchangelabs.com (2603:10a6:208:10e::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25 via Frontend
 Transport; Mon, 15 Feb 2021 14:26:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ac94fef5-e2bd-474b-8a5e-08d8d1bda799
X-MS-TrafficTypeDiagnostic: MN2PR12MB4223:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4223CCD1DB73BD57D9D89FE683889@MN2PR12MB4223.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zNmks1hC0bG4XZViiAJ6og59UUCwHWsDwGLvopN0x0AoN8HHR8yRjmRdryhoDEqDOMOM+c2nKlOC2sKJ7YXcbFqM1fMiRacWvHVGJUR5g05QFCg48c1GjLVt8BPmb5mqWogaRZmf4uCk9Z1fvAB0EsIoix5VomRVErCj9tRmGMILwA7SClR/wfBWXqYSyJo3FNXLFt7Hm2MNn9NN+wSF4T/6nGLX7+cs1XxT3hSD0CPQwr5EYmuxgFWwmGInvU+kTxDuGOXUvxTNS5GE1//kr9aYG3nriJ/mqyXdQSLIXTz/vdfUWJko0A7Ztf3/n6aZQ+29jSo5JNZ+7QXMdDwANl456R6SsdxeLAWEY5o9h5bR2Xm4CoQd4ygRt7eGtEgvZnAcX/odW2PMb3GskBw6Xt7kRu3eSYch54m9ZFnMsy1z9Bs72P9QLAQ3R0/QNQPeKXAnmM7GrWAEAJIZ8+HxCRvv9HoZnfk5Vac08PKfNnOOZ6Whm+Gc2QonXuGxJyF9Zp2R8w3Q8+jbyvMgI6L3xavKiY/R5bfcALjB+TG4eTbRCTv870n5L5RR9DldDwW5Hh96TDXdgCcyxdkvXpB8ZUNZzcqLfNAAMyw3h6qNV78=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(366004)(39860400002)(396003)(136003)(6486002)(7416002)(5660300002)(2616005)(66946007)(36756003)(52116002)(31696002)(54906003)(4326008)(478600001)(16526019)(8936002)(86362001)(186003)(2906002)(83380400001)(31686004)(921005)(6666004)(66476007)(66556008)(316002)(8676002)(110136005)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dDBnMzZiMTAxM1c1RVpQa0l3amdBa1luekI3TXNJSWVscmhqeVcvNHM3OXhL?=
 =?utf-8?B?Y0lqTE9sQmt0d1ZzT1BxbXBDNGltMHJoUm9PdXFQS2pDSkpOVUIwZGFQSlJU?=
 =?utf-8?B?WWRHSGR3T1Erb1VlclBiaVFTSTZQK3g1VDlyWUR6Ukt3RDltaHZsMTllVUsr?=
 =?utf-8?B?MEtrNlloSFB6cEN3TlZoeFA0RmxIZUZpZXFnWDlnVXZ6VEY2OHJ0a0d1Z1Nq?=
 =?utf-8?B?OVVBSHdQNWd6WDlUdjlKV3FTZjFqRURYemJsRU92eEo1WHBsWlNmdGRBNVJ1?=
 =?utf-8?B?Qm1Kc0J1ZDhKTDRob1VaNElTL21WdUVNbTRqc0dxU2xTK3RlTmhPVENrZUMx?=
 =?utf-8?B?Y215VWc4dFV3Y2F0MTJQQ1F1S3R1ait3SlkxVUNYbHVXSFNhT1cwQWRrS2JT?=
 =?utf-8?B?QnlVVTJLRFpPT2E4cVlJWmZRbStLMEF4ek1Ub3QxT3Erak11ZXdMcDZxVzEy?=
 =?utf-8?B?RkFaUTdBaFJHZFhNNkRZa21xRWlYRkR4cVJIalRPd3czZU5nTkYzenp0VGVw?=
 =?utf-8?B?ZWUrTWo2dnFGb0Z5M1plbzNWdE9RTnlrMEZaaFRCeU1tUXFhWHV5aFpObk92?=
 =?utf-8?B?NDVMdzJzcFAyb1pTL2ZSVE1td0NEbkp1ZTBaakI4QjhzWm9abG5Db3dudExx?=
 =?utf-8?B?ektjbXJPZ2RJZ3p2dFZKTkNuVlJKb296d2E4WW9TUkE5L2FVNWI1VkJQcFd2?=
 =?utf-8?B?YlR3UHN3b01KdE5wQ0t2MVhnMldGRWl5ODl3Z05RZnlpckpsUzJ1Z3lBWExn?=
 =?utf-8?B?QmdkcmY2UmJlRkFiSm9yTUlZZThZVEw3aVl2T21iZjBEWTlpYzBkMEZzVm5R?=
 =?utf-8?B?K0FwZWZTWnpVQkJQYWNWT1RmNFNFOFNWczVSTjZZakJqUzI3UndHMEVweVFi?=
 =?utf-8?B?SGg5Ry8vcFZiL2JoM3d2cDE4VlNmUWI2L2NGUVBSUnduc0c1R05pZnFCNER0?=
 =?utf-8?B?WXp2SVhoY0xNQkIrUkxFamVldkMyR2gzek5sRkNCc01tdkc3MjgvTExnUTlw?=
 =?utf-8?B?dEc2TWxFTTBZL3R3cTF1UDl0MUJhbUxRZlQ3Ni8xS0RDZC9ObGpXSm4veDU2?=
 =?utf-8?B?eERtVUl4WnhmdEtFOFpyU21mWWRCQm5FZ1FiamE1dzJMWUxkUGJwUmhlR1lK?=
 =?utf-8?B?S3VPY3h4WlA2aEpCZUVYNkFvZ0MvWWtYcGJvSTRYSnFyMUE5c1RxVkpydWNF?=
 =?utf-8?B?Umc1Sm4wdjJLQkVvaW0xT2pOUFN5RlFJbXhoSmdNS05DNFp0SnJlazg0L0Fu?=
 =?utf-8?B?Zk9Id0o3dXBlaXcxWktzZ3J2di9zekw4Z2ZNRnNGU1JBNkZUMi9ObXpUdVVE?=
 =?utf-8?B?U0x5M2dxUVZmdVhNdEMwWmYyY1dMSlFDMVQxQnVVTTRMY2s5cm5DcDQ3MnVi?=
 =?utf-8?B?RSt4bHdjL3F1bnVJTWZHUW1rSzFWZkwwbXMrTHliTDU0SHRER3UzN0NLT0pP?=
 =?utf-8?B?VFIwZHFJRThtSVBVT21oQzB2S2VXYk5YRmFMaXU3OWpRWFVRU0gyeXZLSXp0?=
 =?utf-8?B?K05tRHNPZDhPc2JqSXVKdDNwaHBOWGlQVFpicHQxbWJsWFUzQldGK29JazlR?=
 =?utf-8?B?dEw2TkF3b2Y1RVJTbDJnRlllVnpqdkxTYUd6TnUyNTJBQkJ4L0J4UloxWXAy?=
 =?utf-8?B?WHZOcnlPZ1pNSUFiTUZialNHMkVMWFkxMkFjSElsRXk0N0d2bUEvcjRQb3lR?=
 =?utf-8?B?WkZmWi9PY0Ywb2lVYjYrNlZ1M1FMU1FyaFdvYkE5N2h3UEp2M2dTNTBTWWM4?=
 =?utf-8?B?dklLcWRkdlgvYUs2VS94SmdOUjVVVStNNENlWkJIMk5SM0J5aDY2U1IwMUlV?=
 =?utf-8?B?aDVtTlZYaC9WVjlrOEh4dTVsMDhkWnBzVThMNEJ1eVhwa0xEd1dqVFJlb0ho?=
 =?utf-8?Q?tW6z0X2w8/vPO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac94fef5-e2bd-474b-8a5e-08d8d1bda799
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2021 14:26:16.6915 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LIKjwn4Dp9M7WBLkT9H72QotDkZ3XLQ820usZ6NPvMJ9HikIyOJykFAW15ltd7iY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4223
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
Cc: Raju Rangoju <rajur@chelsio.com>, Leo Li <sunpeng.li@amd.com>,
 David Airlie <airlied@linux.ie>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jakub Kicinski <kuba@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTUuMDIuMjEgdW0gMTU6MjEgc2NocmllYiBBbmR5IFNoZXZjaGVua286Cj4gV2UgaGF2ZSBh
bHJlYWR5IGZldyBzaW1pbGFyIGltcGxlbWVudGF0aW9uIGFuZCBhIGxvdCBvZiBjb2RlIHRoYXQg
Y2FuIGJlbmVmaXQKPiBvZiB0aGUgeWVzbm8oKSBoZWxwZXIuICBDb25zb2xpZGF0ZSB5ZXNubygp
IGhlbHBlcnMgdW5kZXIgc3RyaW5nLmggaG9vZC4KPgo+IFNpZ25lZC1vZmYtYnk6IEFuZHkgU2hl
dmNoZW5rbyA8YW5kcml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tPgoKTG9va3MgbGlrZSBh
IGdvb2QgaWRlYSB0byBtZSwgZmVlbCBmcmVlIHRvIGFkZCBhbiBBY2tlZC1ieTogQ2hyaXN0aWFu
IApLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4gdG8gdGhlIHNlcmllcy4KCkJ1dCBs
b29raW5nIGF0IHRoZSB1c2UgY2FzZXMgZm9yIHRoaXMsIHdvdWxkbid0IGl0IG1ha2UgbW9yZSBz
ZW5zZSB0byAKdGVhY2gga3ByaW50ZiBzb21lIG5ldyBmb3JtYXQgbW9kaWZpZXIgZm9yIHRoaXM/
CgpDaHJpc3RpYW4uCgo+IC0tLQo+ICAgLi4uL2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1k
Z3B1X2RtX2RlYnVnZnMuYyAgICB8ICA2ICstLS0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL2k5MTUv
aTkxNV91dGlscy5oICAgICAgICAgICAgICAgICAgICB8ICA2ICstLS0tLQo+ICAgZHJpdmVycy9u
ZXQvZXRoZXJuZXQvY2hlbHNpby9jeGdiNC9jeGdiNF9kZWJ1Z2ZzLmMgICB8IDEyICstLS0tLS0t
LS0tLQo+ICAgaW5jbHVkZS9saW51eC9zdHJpbmcuaCAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB8ICA1ICsrKysrCj4gICA0IGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMjEg
ZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2FtZGdwdV9kbS9hbWRncHVfZG1fZGVidWdmcy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fZGVidWdmcy5jCj4gaW5kZXggMzYwOTUyMTI5YjZkLi43
ZmRlNGY5MGU1MTMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Ft
ZGdwdV9kbS9hbWRncHVfZG1fZGVidWdmcy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fZGVidWdmcy5jCj4gQEAgLTIzLDYgKzIzLDcgQEAK
PiAgICAqCj4gICAgKi8KPiAgIAo+ICsjaW5jbHVkZSA8bGludXgvc3RyaW5nLmg+Cj4gICAjaW5j
bHVkZSA8bGludXgvdWFjY2Vzcy5oPgo+ICAgCj4gICAjaW5jbHVkZSA8ZHJtL2RybV9kZWJ1Z2Zz
Lmg+Cj4gQEAgLTQ5LDExICs1MCw2IEBAIHN0cnVjdCBkbXViX2RlYnVnZnNfdHJhY2VfZW50cnkg
ewo+ICAgCXVpbnQzMl90IHBhcmFtMTsKPiAgIH07Cj4gICAKPiAtc3RhdGljIGlubGluZSBjb25z
dCBjaGFyICp5ZXNubyhib29sIHYpCj4gLXsKPiAtCXJldHVybiB2ID8gInllcyIgOiAibm8iOwo+
IC19Cj4gLQo+ICAgLyogcGFyc2Vfd3JpdGVfYnVmZmVyX2ludG9fcGFyYW1zIC0gSGVscGVyIGZ1
bmN0aW9uIHRvIHBhcnNlIGRlYnVnZnMgd3JpdGUgYnVmZmVyIGludG8gYW4gYXJyYXkKPiAgICAq
Cj4gICAgKiBGdW5jdGlvbiB0YWtlcyBpbiBhdHRyaWJ1dGVzIHBhc3NlZCB0byBkZWJ1Z2ZzIHdy
aXRlIGVudHJ5Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfdXRpbHMu
aCBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfdXRpbHMuaAo+IGluZGV4IGFiZDRkY2Q5Zjc5
Yy4uZTZkYTVhOTUxMTMyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVf
dXRpbHMuaAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfdXRpbHMuaAo+IEBAIC0y
Nyw2ICsyNyw3IEBACj4gICAKPiAgICNpbmNsdWRlIDxsaW51eC9saXN0Lmg+Cj4gICAjaW5jbHVk
ZSA8bGludXgvb3ZlcmZsb3cuaD4KPiArI2luY2x1ZGUgPGxpbnV4L3N0cmluZy5oPgo+ICAgI2lu
Y2x1ZGUgPGxpbnV4L3NjaGVkLmg+Cj4gICAjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4KPiAgICNp
bmNsdWRlIDxsaW51eC93b3JrcXVldWUuaD4KPiBAQCAtNDA4LDExICs0MDksNiBAQCB3YWl0X3Jl
bWFpbmluZ19tc19mcm9tX2ppZmZpZXModW5zaWduZWQgbG9uZyB0aW1lc3RhbXBfamlmZmllcywg
aW50IHRvX3dhaXRfbXMpCj4gICAjZGVmaW5lIE1CcHMoeCkgS0JwcygxMDAwICogKHgpKQo+ICAg
I2RlZmluZSBHQnBzKHgpICgodTY0KTEwMDAgKiBNQnBzKCh4KSkpCj4gICAKPiAtc3RhdGljIGlu
bGluZSBjb25zdCBjaGFyICp5ZXNubyhib29sIHYpCj4gLXsKPiAtCXJldHVybiB2ID8gInllcyIg
OiAibm8iOwo+IC19Cj4gLQo+ICAgc3RhdGljIGlubGluZSBjb25zdCBjaGFyICpvbm9mZihib29s
IHYpCj4gICB7Cj4gICAJcmV0dXJuIHYgPyAib24iIDogIm9mZiI7Cj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbmV0L2V0aGVybmV0L2NoZWxzaW8vY3hnYjQvY3hnYjRfZGVidWdmcy5jIGIvZHJpdmVy
cy9uZXQvZXRoZXJuZXQvY2hlbHNpby9jeGdiNC9jeGdiNF9kZWJ1Z2ZzLmMKPiBpbmRleCA3ZDQ5
ZmQ0ZWRjOWUuLmM4NTdkNzNhYmJkNyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5l
dC9jaGVsc2lvL2N4Z2I0L2N4Z2I0X2RlYnVnZnMuYwo+ICsrKyBiL2RyaXZlcnMvbmV0L2V0aGVy
bmV0L2NoZWxzaW8vY3hnYjQvY3hnYjRfZGVidWdmcy5jCj4gQEAgLTM0LDYgKzM0LDcgQEAKPiAg
IAo+ICAgI2luY2x1ZGUgPGxpbnV4L3NlcV9maWxlLmg+Cj4gICAjaW5jbHVkZSA8bGludXgvZGVi
dWdmcy5oPgo+ICsjaW5jbHVkZSA8bGludXgvc3RyaW5nLmg+Cj4gICAjaW5jbHVkZSA8bGludXgv
c3RyaW5nX2hlbHBlcnMuaD4KPiAgICNpbmNsdWRlIDxsaW51eC9zb3J0Lmg+Cj4gICAjaW5jbHVk
ZSA8bGludXgvY3R5cGUuaD4KPiBAQCAtMjAxNSwxNyArMjAxNiw2IEBAIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgZmlsZV9vcGVyYXRpb25zIHJzc19kZWJ1Z2ZzX2ZvcHMgPSB7Cj4gICAvKiBSU1MgQ29u
ZmlndXJhdGlvbi4KPiAgICAqLwo+ICAgCj4gLS8qIFNtYWxsIHV0aWxpdHkgZnVuY3Rpb24gdG8g
cmV0dXJuIHRoZSBzdHJpbmdzICJ5ZXMiIG9yICJubyIgaWYgdGhlIHN1cHBsaWVkCj4gLSAqIGFy
Z3VtZW50IGlzIG5vbi16ZXJvLgo+IC0gKi8KPiAtc3RhdGljIGNvbnN0IGNoYXIgKnllc25vKGlu
dCB4KQo+IC17Cj4gLQlzdGF0aWMgY29uc3QgY2hhciAqeWVzID0gInllcyI7Cj4gLQlzdGF0aWMg
Y29uc3QgY2hhciAqbm8gPSAibm8iOwo+IC0KPiAtCXJldHVybiB4ID8geWVzIDogbm87Cj4gLX0K
PiAtCj4gICBzdGF0aWMgaW50IHJzc19jb25maWdfc2hvdyhzdHJ1Y3Qgc2VxX2ZpbGUgKnNlcSwg
dm9pZCAqdikKPiAgIHsKPiAgIAlzdHJ1Y3QgYWRhcHRlciAqYWRhcHRlciA9IHNlcS0+cHJpdmF0
ZTsKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9zdHJpbmcuaCBiL2luY2x1ZGUvbGludXgv
c3RyaW5nLmgKPiBpbmRleCA5NTIxZDhjYWIxOGUuLmZkOTQ2YTVlMThjOCAxMDA2NDQKPiAtLS0g
YS9pbmNsdWRlL2xpbnV4L3N0cmluZy5oCj4gKysrIGIvaW5jbHVkZS9saW51eC9zdHJpbmcuaAo+
IEBAIC0zMDgsNCArMzA4LDkgQEAgc3RhdGljIF9fYWx3YXlzX2lubGluZSBzaXplX3Qgc3RyX2hh
c19wcmVmaXgoY29uc3QgY2hhciAqc3RyLCBjb25zdCBjaGFyICpwcmVmaXgKPiAgIAlyZXR1cm4g
c3RybmNtcChzdHIsIHByZWZpeCwgbGVuKSA9PSAwID8gbGVuIDogMDsKPiAgIH0KPiAgIAo+ICtz
dGF0aWMgaW5saW5lIGNvbnN0IGNoYXIgKnllc25vKGJvb2wgeWVzKQo+ICt7Cj4gKwlyZXR1cm4g
eWVzID8gInllcyIgOiAibm8iOwo+ICt9Cj4gKwo+ICAgI2VuZGlmIC8qIF9MSU5VWF9TVFJJTkdf
SF8gKi8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E7F364860
	for <lists+dri-devel@lfdr.de>; Mon, 19 Apr 2021 18:39:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 199BF89DC1;
	Mon, 19 Apr 2021 16:39:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2059.outbound.protection.outlook.com [40.107.236.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2172A6E40C
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 16:39:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T+fAfb82RO4o5xVyZjd3BYboQG0ztwyArMDjNasHB0KuB1MmpJknKQUg1UcS910mK2uX6zpJ3jiGjSU6JRcy4GI+HtMD8wTMuBGKQNAhNuhtdoEpEDmcXA+274LudXuOQxM9dOtvkTP5EnIDAlCm1H+BauZl7Xi565c47WXY/5/SiU3ImDs3mtGXehuBWlBNzX8u9T3DaW7fU1FZSD1jqsKqQYKYWsH1XPLirUAkQlxnXmQ3aDfc7pfMDBZYxInGLh+QCHUbqwwTrbotRaq0sY611jJSFRxy5wDoWbNZe2TryFL2gt5JghhtPAA6inrfXqIUCK3tyLaN70DF02vPlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wyWxjStxP4YQb/eH7IlQ1g3N4ioOxA7kOgVIpBUFkmY=;
 b=aYWWhHBy77F7BoYwOnUKhbXUDwifwuUwc+uTl8+tLnt0wzQ68fIvewwD0i1Bni5MaYYg+Or5Ve9WSFtC6TqrA1M8Jztgb7jx1jepw/5RSygE8iuSayPmq9LJHoCQdUPzbsDeO5l5HPxgTofUKraHCrIMXrN0wcYJUhjxeqv7Wr5QU76GVuHepLHFsoomgTPnwbKr63CsoYbWImU2fTy1T5JdO4lSK8+dTv9XBM7DO6H3UyzkJQFlvHlO9oYWu+cNBDjHfMqhb0CljcMxEnIBZ/6NwN7PkFVp7+x4ZrSySn4Xpi19XdLl5hDdgiwMk0dJxDcI6nqScicABxDsrXPsmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wyWxjStxP4YQb/eH7IlQ1g3N4ioOxA7kOgVIpBUFkmY=;
 b=iAhWizkW/D5+j4CPwEDoh7SGa1Pis8T9O99a0HjP7r9ifAyZz4medNSoY8XPxdJb01gbP5KB0Q0nCodFMAw7Hd+Ae95wtEbDEy7vUNduecACdhRFRhlcLye3toltAXBez3J/NYpcd6c7T8B+pZPDhj/eNbN+fHmqwQ00DWchYrY=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from CY4PR12MB1463.namprd12.prod.outlook.com (2603:10b6:910:e::19)
 by CY4PR1201MB0055.namprd12.prod.outlook.com (2603:10b6:910:1b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19; Mon, 19 Apr
 2021 16:39:31 +0000
Received: from CY4PR12MB1463.namprd12.prod.outlook.com
 ([fe80::a457:1047:3886:4630]) by CY4PR12MB1463.namprd12.prod.outlook.com
 ([fe80::a457:1047:3886:4630%9]) with mapi id 15.20.4042.024; Mon, 19 Apr 2021
 16:39:30 +0000
Subject: Re: [PATCH] drm/ttm: remove special handling for non GEM drivers
To: dri-devel@lists.freedesktop.org
References: <20210419092853.1605-1-christian.koenig@amd.com>
From: Nirmoy <nirmodas@amd.com>
Message-ID: <f7e6aa8d-2499-0870-d5ff-f5da36b45bc8@amd.com>
Date: Mon, 19 Apr 2021 18:39:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210419092853.1605-1-christian.koenig@amd.com>
Content-Language: en-US
X-Originating-IP: [93.229.37.157]
X-ClientProxiedBy: PR0P264CA0287.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1::35) To CY4PR12MB1463.namprd12.prod.outlook.com
 (2603:10b6:910:e::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.178.87] (93.229.37.157) by
 PR0P264CA0287.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Mon, 19 Apr 2021 16:39:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6eb8f3bc-6610-4c1c-4611-08d90351b472
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0055:
X-Microsoft-Antispam-PRVS: <CY4PR1201MB00551EC90B07E3293590EE998B499@CY4PR1201MB0055.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:190;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: it73bNyTiFANe+Ke8JKZV86eh5WmJNuDdyyuB18EX+gcomGJbeFeFCEPprwS16NqdarRHgp/4kvN9w0akIjV/eIO7LJoLPqA3Pb6eLojgBM05gsfUa+t5xtYDp9px52DHorAMN9r5NgQLXp4OYZXWccx2G1e7Ss1Itz39Xx6P73ZUOVJNALcs/LhuBXGrOitpEYCgQa3fWmsG+xjc/0Y/RmFIC+uLVO7RyNVD7v/oA8hj2Lb5gGvo73MubjpZTEgoHZ4djglAYlUQSV6wDuRtvaOV7QwAMpDp4RdTnY03Nj+yoZl8m3OC1ctxDMqZTm0Xz6kYg7vDVTsfFWQlxQHpSG8ggK45278Q4PMbAyWpE2bGBDTHNHpRClx7UfPvIfk60dFipkoYgsYXWLSM77TQX4cO3TwxiEaLQ3MVidMyP03baFeK2ktnv5nWqJ3UtdgXOu1zI4lx+NuvqwjCOImu+F/n8uvbsCtMwEAfQK9dwVI02hTJXZ/klFdJ6Urs6pPuJ6xrUDj+HOgtq7/fXtAuaVkXevOt3bfgTKfeKKvMPEr4jfFH9PCEflkME+5oZmTvYpzgbMWiVTCLIO22IqYxZ/gijC2kov0w7z8dQTK+7k8Yw0cf6UxdAH9ag5GrfR3tm0/muCNcoQNzn8hNX3cRvw/f+5BI/0nqf8MMrHCXd3axjTwoFS+4M+HcCbDygO5VrOlxyE13k+bKYr+6DWQKw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR12MB1463.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(346002)(366004)(136003)(396003)(186003)(16526019)(6916009)(2906002)(38100700002)(83380400001)(38350700002)(53546011)(26005)(6666004)(16576012)(6486002)(52116002)(316002)(5660300002)(31686004)(8676002)(66556008)(66946007)(8936002)(956004)(66476007)(2616005)(31696002)(36756003)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VmZCMUhyZ2RHZ1htcjAwN3RKbkVGR0R6TkVjVmJYWWtGZE9DM3M3YTJ3aks0?=
 =?utf-8?B?Q3lvcGZFTWhIS1psQUp5Ny8zN3dHaDRrM01ZVE8zdzYwZGtJdE1BTXJnM0Nz?=
 =?utf-8?B?SERKbFFCS001RUVnTEx1N1JwNDZtd0dKT3lBdUhhcVdmRXBZRWhjdjh5L1BY?=
 =?utf-8?B?MnRDeXBUMWxFdXRHbGdHakFqM0NBeDF2WEpCVnZXWTV1aURpcndQc1dZMG5E?=
 =?utf-8?B?UVdKYWl0ZnNlYmlaMHJNdmkzN2dLcFl1RmNmQlNPNGJIdkxpNXZTVWY3bkx4?=
 =?utf-8?B?Sit1UXBJaVNxdHNiWTJNbGh6dlp5VDJrMHhCQ1h3bitpdGdMWSt6SVZPdWJS?=
 =?utf-8?B?NzJNUnRTcEF1Y0IxUktXSXp1K1BKRUQ5Z2xIV25RMkJ0bklaK1U1WXU4OFdo?=
 =?utf-8?B?Y29KVXkraktoV2Y5ckErK05pd09abHVXNXZpZlAyakI4Z3ExcG5mQ0lhTHJn?=
 =?utf-8?B?eExlZXo2ZXgya29sYkRIekhZdXpyWW96cnJXSThuaCtycUNaZURTY29FdEp5?=
 =?utf-8?B?QTBMemN5TEVZSmx1QW1UdzdrRXZRdEtUbGVFZjh0TzMwQWxZWFNjUUtIUUtU?=
 =?utf-8?B?WEM3QzU0cExxOWN5NGwxeFY2ZnMxRTZZUTFISlZoK1l0Wk51UGErRkZpbXpo?=
 =?utf-8?B?djNwNW5TdDR2VkpTQlBlM0QwZ0V6bG5KY2VUTUNPTU82L01Oa2JiLzNOYUxp?=
 =?utf-8?B?V01EQStzcWxUY0tKSEpxT09DbnQ2Mm1ERDFhQjBsYW9Mc1dueVRHL3pER29Q?=
 =?utf-8?B?ZmdEVHlMUHVGaHJ6TzJ0SjlmSmxLVitwYno2U2s2aEVwOGwvVndqcXk4aWE4?=
 =?utf-8?B?SGtTbWJEeXpST3NBcjAzRkRXN1JaSmtONmJwK0VzTHI3cEpKVkFwR29pRnVV?=
 =?utf-8?B?WW5EVDNxZTFsc1dUeXI1MXV2SjcrT3AzN0s5U0lCVGt5VkovMHNMQjJzRk1r?=
 =?utf-8?B?UW9Vak9sL3pjOXF2QVVsTzNOcUpvMXg5em1aL0x6a1U2aGxuUG02NmtIdVYz?=
 =?utf-8?B?L0F4TkNMWk5JelVZZzJTUWhrNjk1bDdOWERPWGU4OTdRWjRmcFZJNGY2V3FX?=
 =?utf-8?B?RWxOYjhHc2E2NWhmZmlCZmRmRXdUYWd6azBWU3l1WGdCSVR4TCtaWVp2dU4r?=
 =?utf-8?B?bE4rdnhyK0dRNW9MYVFQVVVtY3hFTVorSW0zWFhnaEFtMDVkZlhTbUFNYUZ6?=
 =?utf-8?B?Y2x2MEQ3Zmh2dFpOUnBmdmcvRXY4NjRaTFdkMmZvd2pkTjkyQ1FTcWcwallZ?=
 =?utf-8?B?UEQvc1QwZ1oyNzRPS2syWlJhbm05UklWclEzazFzYTh1ajBlRHYrb3owV0ky?=
 =?utf-8?B?L0ovZ3EvU1ZMVGNNemVVVEFMc2JtaEl4Vjgyb1YrMHFwYlBrc0VNSWNFQkh1?=
 =?utf-8?B?Rkk4aUxpc2wrajMrMWNBa01McVU4ejlRVWt0YXU4WGhkZ3BLeWhtK3g2SXA1?=
 =?utf-8?B?SHZaRlIrU0xnSmFRR3VtYVhMRUpjUCtFb3lucGNiKzZUZ1JvajhaNGs2S2Mv?=
 =?utf-8?B?T0d5NytxZm1UYmw3aC82WFkrRFcwaXFtQ3FBNHVhMlB1R1ZPeG1iZ2VJdVZZ?=
 =?utf-8?B?cERKVUdrT2FhWnpwYjcrWWtuSTB3RmlOZ3hIYm9RMVJvNXV5ZVZyRWJRVnN2?=
 =?utf-8?B?ZHdPRThPdWppL3htS0o2OGdlWEN4SGNaem5xUDMzc2JXS2oxV0dpNVZHWS9O?=
 =?utf-8?B?clVzZ0lldHBPN0pBSlhQNmFrYW5vekxseFlENURoY3NpbE9KeU83QUFlNGho?=
 =?utf-8?Q?VdNGKUy2VvAV4lEoeZP/Hn8tG8poPozCkpkxpcq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eb8f3bc-6610-4c1c-4611-08d90351b472
X-MS-Exchange-CrossTenant-AuthSource: CY4PR12MB1463.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2021 16:39:30.8056 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GVgfwQP9PXh1vSLrVmLsEo13RfARFrvKPAQSkcdfr/IcTflTP/WInim0ek2W6akiQVoInCfKLupGhBmYvXp/og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0055
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

VGVzdGVkLWJ5OiBOaXJtb3kgRGFzIDxuaXJtb3kuZGFzQGFtZC5jb20+CgpPbiA0LzE5LzIxIDEx
OjI4IEFNLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+IHZtd2dmeCBpcyB0aGUgb25seSBkcml2
ZXIgYWN0dWFsbHkgdXNpbmcgdGhpcy4gTW92ZSB0aGUgaGFuZGxpbmcgaW50bwo+IHRoZSBkcml2
ZXIgaW5zdGVhZC4KPgo+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlh
bi5rb2VuaWdAYW1kLmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMg
ICAgICAgfCAxMSAtLS0tLS0tLS0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhf
Ym8uYyB8IDEwICsrKysrKysrKysKPiAgIGluY2x1ZGUvZHJtL3R0bS90dG1fYm9fYXBpLmggICAg
ICAgfCAxOSAtLS0tLS0tLS0tLS0tLS0tLS0tCj4gICAzIGZpbGVzIGNoYW5nZWQsIDEwIGluc2Vy
dGlvbnMoKyksIDMwIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS90dG0vdHRtX2JvLmMgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCj4gaW5kZXggODA4
MzFkZjBlZjYxLi4zODE4M2UyMjcxMTYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0
bS90dG1fYm8uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKPiBAQCAtNDYw
LDggKzQ2MCw2IEBAIHN0YXRpYyB2b2lkIHR0bV9ib19yZWxlYXNlKHN0cnVjdCBrcmVmICprcmVm
KQo+ICAgCj4gICAJYXRvbWljX2RlYygmdHRtX2dsb2IuYm9fY291bnQpOwo+ICAgCWRtYV9mZW5j
ZV9wdXQoYm8tPm1vdmluZyk7Cj4gLQlpZiAoIXR0bV9ib191c2VzX2VtYmVkZGVkX2dlbV9vYmpl
Y3QoYm8pKQo+IC0JCWRtYV9yZXN2X2ZpbmkoJmJvLT5iYXNlLl9yZXN2KTsKPiAgIAliby0+ZGVz
dHJveShibyk7Cj4gICB9Cj4gICAKPiBAQCAtMTA1NiwxNSArMTA1NCw2IEBAIGludCB0dG1fYm9f
aW5pdF9yZXNlcnZlZChzdHJ1Y3QgdHRtX2RldmljZSAqYmRldiwKPiAgIAl9IGVsc2Ugewo+ICAg
CQliby0+YmFzZS5yZXN2ID0gJmJvLT5iYXNlLl9yZXN2Owo+ICAgCX0KPiAtCWlmICghdHRtX2Jv
X3VzZXNfZW1iZWRkZWRfZ2VtX29iamVjdChibykpIHsKPiAtCQkvKgo+IC0JCSAqIGJvLmJhc2Ug
aXMgbm90IGluaXRpYWxpemVkLCBzbyB3ZSBoYXZlIHRvIHNldHVwIHRoZQo+IC0JCSAqIHN0cnVj
dCBlbGVtZW50cyB3ZSB3YW50IHVzZSByZWdhcmRsZXNzLgo+IC0JCSAqLwo+IC0JCWJvLT5iYXNl
LnNpemUgPSBzaXplOwo+IC0JCWRtYV9yZXN2X2luaXQoJmJvLT5iYXNlLl9yZXN2KTsKPiAtCQlk
cm1fdm1hX25vZGVfcmVzZXQoJmJvLT5iYXNlLnZtYV9ub2RlKTsKPiAtCX0KPiAgIAlhdG9taWNf
aW5jKCZ0dG1fZ2xvYi5ib19jb3VudCk7Cj4gICAKPiAgIAkvKgo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9iby5jIGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92
bXdnZnhfYm8uYwo+IGluZGV4IDUwZTUyOWEwMTY3Ny4uNTg3MzE0ZDU3OTkxIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2JvLmMKPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vdm13Z2Z4L3Ztd2dmeF9iby5jCj4gQEAgLTQ2MCw2ICs0NjAsNyBAQCB2b2lkIHZtd19i
b19ib19mcmVlKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8pCj4gICAJV0FSTl9PTih2bXdf
Ym8tPmRpcnR5KTsKPiAgIAlXQVJOX09OKCFSQl9FTVBUWV9ST09UKCZ2bXdfYm8tPnJlc190cmVl
KSk7Cj4gICAJdm13X2JvX3VubWFwKHZtd19ibyk7Cj4gKwlkbWFfcmVzdl9maW5pKCZiby0+YmFz
ZS5fcmVzdik7Cj4gICAJa2ZyZWUodm13X2JvKTsKPiAgIH0KPiAgIAo+IEBAIC01MTIsNiArNTEz
LDExIEBAIGludCB2bXdfYm9fY3JlYXRlX2tlcm5lbChzdHJ1Y3Qgdm13X3ByaXZhdGUgKmRldl9w
cml2LCB1bnNpZ25lZCBsb25nIHNpemUsCj4gICAJaWYgKHVubGlrZWx5KHJldCkpCj4gICAJCWdv
dG8gZXJyb3JfZnJlZTsKPiAgIAo+ICsKPiArCWJvLT5iYXNlLnNpemUgPSBzaXplOwo+ICsJZG1h
X3Jlc3ZfaW5pdCgmYm8tPmJhc2UuX3Jlc3YpOwo+ICsJZHJtX3ZtYV9ub2RlX3Jlc2V0KCZiby0+
YmFzZS52bWFfbm9kZSk7Cj4gKwo+ICAgCXJldCA9IHR0bV9ib19pbml0X3Jlc2VydmVkKCZkZXZf
cHJpdi0+YmRldiwgYm8sIHNpemUsCj4gICAJCQkJICAgdHRtX2JvX3R5cGVfZGV2aWNlLCBwbGFj
ZW1lbnQsIDAsCj4gICAJCQkJICAgJmN0eCwgTlVMTCwgTlVMTCwgTlVMTCk7Cj4gQEAgLTU3MCw2
ICs1NzYsMTAgQEAgaW50IHZtd19ib19pbml0KHN0cnVjdCB2bXdfcHJpdmF0ZSAqZGV2X3ByaXYs
Cj4gICAJaWYgKHVubGlrZWx5KHJldCkpCj4gICAJCXJldHVybiByZXQ7Cj4gICAKPiArCXZtd19i
by0+YmFzZS5iYXNlLnNpemUgPSBzaXplOwo+ICsJZG1hX3Jlc3ZfaW5pdCgmdm13X2JvLT5iYXNl
LmJhc2UuX3Jlc3YpOwo+ICsJZHJtX3ZtYV9ub2RlX3Jlc2V0KCZ2bXdfYm8tPmJhc2UuYmFzZS52
bWFfbm9kZSk7Cj4gKwo+ICAgCXJldCA9IHR0bV9ib19pbml0X3Jlc2VydmVkKGJkZXYsICZ2bXdf
Ym8tPmJhc2UsIHNpemUsCj4gICAJCQkJICAgdHRtX2JvX3R5cGVfZGV2aWNlLCBwbGFjZW1lbnQs
Cj4gICAJCQkJICAgMCwgJmN0eCwgTlVMTCwgTlVMTCwgYm9fZnJlZSk7Cj4gZGlmZiAtLWdpdCBh
L2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fYXBpLmggYi9pbmNsdWRlL2RybS90dG0vdHRtX2JvX2Fw
aS5oCj4gaW5kZXggMzU4N2Y2NjBlOGY0Li5lODhkYTQ4MWE5NzYgMTAwNjQ0Cj4gLS0tIGEvaW5j
bHVkZS9kcm0vdHRtL3R0bV9ib19hcGkuaAo+ICsrKyBiL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9f
YXBpLmgKPiBAQCAtNTYyLDI1ICs1NjIsNiBAQCBzc2l6ZV90IHR0bV9ib19pbyhzdHJ1Y3QgdHRt
X2RldmljZSAqYmRldiwgc3RydWN0IGZpbGUgKmZpbHAsCj4gICBpbnQgdHRtX2JvX3N3YXBvdXQo
c3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywgc3RydWN0IHR0bV9vcGVyYXRpb25fY3R4ICpj
dHgsCj4gICAJCSAgIGdmcF90IGdmcF9mbGFncyk7Cj4gICAKPiAtLyoqCj4gLSAqIHR0bV9ib191
c2VzX2VtYmVkZGVkX2dlbV9vYmplY3QgLSBjaGVjayBpZiB0aGUgZ2l2ZW4gYm8gdXNlcyB0aGUK
PiAtICogZW1iZWRkZWQgZHJtX2dlbV9vYmplY3QuCj4gLSAqCj4gLSAqIE1vc3QgdHRtIGRyaXZl
cnMgYXJlIHVzaW5nIGdlbSB0b28sIHNvIHRoZSBlbWJlZGRlZAo+IC0gKiB0dG1fYnVmZmVyX29i
amVjdC5iYXNlIHdpbGwgYmUgaW5pdGlhbGl6ZWQgYnkgdGhlIGRyaXZlciAoYmVmb3JlCj4gLSAq
IGNhbGxpbmcgdHRtX2JvX2luaXQpLiAgSXQgaXMgYWxzbyBwb3NzaWJsZSB0byB1c2UgdHRtIHdp
dGhvdXQgZ2VtCj4gLSAqIHRob3VnaCAodm13Z2Z4IGRvZXMgdGhhdCkuCj4gLSAqCj4gLSAqIFRo
aXMgaGVscGVyIHdpbGwgZmlndXJlIHdoZW5ldmVyIGEgZ2l2ZW4gdHRtIGJvIGlzIGEgZ2VtIG9i
amVjdCB0b28KPiAtICogb3Igbm90Lgo+IC0gKgo+IC0gKiBAYm86IFRoZSBibyB0byBjaGVjay4K
PiAtICovCj4gLXN0YXRpYyBpbmxpbmUgYm9vbCB0dG1fYm9fdXNlc19lbWJlZGRlZF9nZW1fb2Jq
ZWN0KHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8pCj4gLXsKPiAtCXJldHVybiBiby0+YmFz
ZS5kZXYgIT0gTlVMTDsKPiAtfQo+IC0KPiAgIC8qKgo+ICAgICogdHRtX2JvX3BpbiAtIFBpbiB0
aGUgYnVmZmVyIG9iamVjdC4KPiAgICAqIEBibzogVGhlIGJ1ZmZlciBvYmplY3QgdG8gcGluCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=

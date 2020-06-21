Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B84202B5B
	for <lists+dri-devel@lfdr.de>; Sun, 21 Jun 2020 17:33:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D85206E07F;
	Sun, 21 Jun 2020 15:33:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2042.outbound.protection.outlook.com [40.107.93.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5033A6E07F
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Jun 2020 15:33:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=luIQrljqIJp1J3QUBzFTH4J4TNhVrCTOFMblVqcXmrxuIH0SqeNQ3laA76sC2LY47t5eMCF9IgorBn3Z3XMblGp1zscJfCO4UZUeSy7J2AQbvmPoEDS8fGyoRis0ypZIN4Y7BOGgVZkzOyfNg7d44v9En64nl+HY2rhcU7JFW2yhx3vaGXYMtNYt+gIHVWhYbk7+1uZUhHPMBJM1UrOK2s3TS4eYnyOqCPCuMnoRgxOONVb4pFRKVsiK+sf+w88NJ08bdTX1RqC453Qp/rigSgUZwGdYqNv1O9tdwikxajC0wvVU7WUn5DXftvkMjiZx4QBbNoXE/F6IYYNUd8uexw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Are0p1caBUBUlxBQrGrfy+u4IiwxS09U2BZrsACPTbM=;
 b=Rvah2a+rKjDWfZQzy775O3z0kDCHaBSRXeyYYrd+0THErxqgnFKKuxp8yYuuFco1qwwPF9Hhnl8K9R7Iy0gi6GbWYmXKvSq9m5eIMUS1Sv1SchBOc9rv0wlmChTDYwCEE4/eQeVv87kfYejiCnverR3U+QJ/Xc8c17LJVUyP7kVjUh5Gt/p7X+kSGV/gYncnmnbSAwtsJZX29kJK14PBgQSDfTX+5eVmoe3RMmsoRMMAV7TKW6T+rlrdbpNxCkP8UGnoG0zeWb4YsuoVWvt5vPyP+T+mMtqJiexO4FP8CSaTp2bYyTW5NcUMHNdikIzRpkHEvLU/a0A2Rv34HxiGNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Are0p1caBUBUlxBQrGrfy+u4IiwxS09U2BZrsACPTbM=;
 b=HhWGRd9q57mrtEA0Phe88AQx3DUHlwNR0bsH308I9bObNKxbU/6MXkew/aQzT+gEX1QDey259Ps5fieKgBNGvQwNmWS9HN1a0cvsF2H9ujuT7xQS8L0KdyQFwaPCV2FC4S7tj+40/BTcWweekjJTlOCyGNbZJcCLbRe+lXqXIZA=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4401.namprd12.prod.outlook.com (2603:10b6:5:2a9::15)
 by DM6PR12MB2636.namprd12.prod.outlook.com (2603:10b6:5:4a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.23; Sun, 21 Jun
 2020 15:33:07 +0000
Received: from DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::a045:f8c0:8edb:1ef1]) by DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::a045:f8c0:8edb:1ef1%9]) with mapi id 15.20.3109.023; Sun, 21 Jun 2020
 15:33:07 +0000
Subject: Re: [PATCH][next] drm/mm/selftests: fix unsigned comparison with less
 than zero
To: Colin King <colin.king@canonical.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
References: <20200617155959.231740-1-colin.king@canonical.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <feb9dc72-c6e8-b745-ca90-b4ff7021d7bd@amd.com>
Date: Sun, 21 Jun 2020 17:33:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20200617155959.231740-1-colin.king@canonical.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR04CA0039.eurprd04.prod.outlook.com
 (2603:10a6:208:1::16) To DM6PR12MB4401.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR04CA0039.eurprd04.prod.outlook.com (2603:10a6:208:1::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3109.21 via Frontend Transport; Sun, 21 Jun 2020 15:33:06 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 231c3103-6f5b-42ce-572a-08d815f86583
X-MS-TrafficTypeDiagnostic: DM6PR12MB2636:
X-Microsoft-Antispam-PRVS: <DM6PR12MB26362070163314522C9656EC83960@DM6PR12MB2636.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 04410E544A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UtsQSZzkXTL7rpW61lR26yC4igpMykH9F1v0wPpVWCLGqSsvNelVa9GcEl3dnK1IFuWI9dxo71kMrSu+IxdUMdcRWAkZD3E+J/SubHnVRhtnfa4izm7dJy1lJqsUObH9Hhfd+aGqQJNDkTwYGP0zAX7tp2go0hRLA0d28iMgxLLa3GoxJGcHNoCdBow0uCgzSfXM0dhm7RjVReTPFj6h7QhmC9LuRYJVA4wkeInMUL/hfTswbKpejuO8HOMLvuNeFlsM0fYXs64WTREg/zS2ArVw7weO+vOELwbSLcSXGCrSeYO3ni/1aaAVtu/BLV0mefK/Dt/S4EeGojGOrEHG0ci2IEHTcrDiQqSsmCLka+T8gPN5MTo7TReM8Vg4N1E4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4401.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(396003)(39860400002)(346002)(376002)(366004)(6666004)(5660300002)(31686004)(66476007)(16526019)(86362001)(83380400001)(31696002)(8676002)(110136005)(66946007)(66556008)(478600001)(4326008)(2616005)(316002)(52116002)(36756003)(2906002)(186003)(6486002)(8936002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: b+Yt8FQsPD4KHLkzqbG96soN5ml7cdsIn66kpeVe7lLppTvpie8mq/oOMbx09SwZlib1JlogYEJbNfeULEdQ3tdmUJcMYuFdve2sLXuBd158pHYSF7JPlyfIL0vwe8MKdyaHESqrZeo3b2KrHlHV+olfyhbb1t6isGAGUUhHnZ8CUoypQ77LSOthilVrhaLxSqEnqrMc3g38yibOUgKAYsv6IsLz+65Ge4LhoCugrOWYMWeGntHr1b4eb3kDpodoHXYtMIgSaYN7pL02pPW2Q4jOo3augXVxT/I2+NMhRQb6BSupo5OWuTr75ALRRYChYkEp5o/17U3/KO6y1r8CEiGq9B9n1N8vO3NzNNTd2bSI2nltxijlcVUxmKmdoDGJt0r/DsCiSPnxMAtGgX5QM1Ctcd42hH4dfjVMuyD/hZxFchLyBwNNmG02F9o5WTRuP0yT/6QziWZSa+VQ52txla1MiviA1rJ72+dcxUKiHFF3Go9cmL4eZRwTmH4UKf+hGmeL1p1oNPlWHshzcHOlQtF6ng940OGIjNLS+YYMpcE=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 231c3103-6f5b-42ce-572a-08d815f86583
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2020 15:33:07.3806 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tgURX4q9ieFkDS5aqDyx5hMe6cCzxNTIAjqGWcJAU7mCG9VE5aFYNQwMY5bWoE7u
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2636
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTcuMDYuMjAgdW0gMTc6NTkgc2NocmllYiBDb2xpbiBLaW5nOgo+IEZyb206IENvbGluIElh
biBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+Cj4KPiBGdW5jdGlvbiBnZXRfaW5zZXJ0
X3RpbWUgY2FuIHJldHVybiBlcnJvciB2YWx1ZXMgdGhhdCBhcmUgY2FzdAo+IHRvIGEgdTY0LiBU
aGUgY2hlY2tzIG9mIGluc2VydF90aW1lMSBhbmQgaW5zZXJ0X3RpbWUyIGNoZWNrIGZvcgo+IHRo
ZSBlcnJvcnMgYnV0IGJlY2F1c2UgdGhleSBhcmUgdTY0IHZhcmlhYmxlcyB0aGUgY2hlY2sgZm9y
IGxlc3MKPiB0aGFuIHplcm8gY2FuIG5ldmVyIGJlIHRydWUuIEZpeCB0aGlzIGJ5IGNhc3Rpbmcg
dGhlIHZhbHVlIHRvIHM2NAo+IHRvIGFsbG93IG9mIHRoZSBuZWdhdGl2ZSBlcnJvciBjaGVjayB0
byBzdWNjZWVkLgo+Cj4gQWRkcmVzc2VzLUNvdmVyaXR5OiAoIlVuc2lnbmVkIGNvbXBhcmVkIGFn
YWluc3QgMCwgbm8gZWZmZWN0IikKPiBGaXhlczogNmU2MGQ1ZGVkMDZiICgiZHJtL21tOiBhZGQg
aWdfZnJhZyBzZWxmdGVzdCIpCj4gU2lnbmVkLW9mZi1ieTogQ29saW4gSWFuIEtpbmcgPGNvbGlu
LmtpbmdAY2Fub25pY2FsLmNvbT4KClJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJp
c3RpYW4ua29lbmlnQGFtZC5jb20+CgpHb2luZyB0byBwaWNrIHRoYXQgdXAgZm9yIGRybS1taXNj
LWZpeGVzIHRvbW9ycm93LgoKPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9zZWxmdGVzdHMvdGVz
dC1kcm1fbW0uYyB8IDQgKystLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc2VsZnRlc3Rz
L3Rlc3QtZHJtX21tLmMgYi9kcml2ZXJzL2dwdS9kcm0vc2VsZnRlc3RzL3Rlc3QtZHJtX21tLmMK
PiBpbmRleCAzODQ2YjBmNWJhZTMuLjY3MWExNTJhNmRmMiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vc2VsZnRlc3RzL3Rlc3QtZHJtX21tLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
c2VsZnRlc3RzL3Rlc3QtZHJtX21tLmMKPiBAQCAtMTEyNCwxMiArMTEyNCwxMiBAQCBzdGF0aWMg
aW50IGlndF9mcmFnKHZvaWQgKmlnbm9yZWQpCj4gICAKPiAgIAkJaW5zZXJ0X3RpbWUxID0gZ2V0
X2luc2VydF90aW1lKCZtbSwgaW5zZXJ0X3NpemUsCj4gICAJCQkJCSAgICAgICBub2RlcyArIGlu
c2VydF9zaXplLCBtb2RlKTsKPiAtCQlpZiAoaW5zZXJ0X3RpbWUxIDwgMCkKPiArCQlpZiAoKHM2
NClpbnNlcnRfdGltZTEgPCAwKQo+ICAgCQkJZ290byBlcnI7Cj4gICAKPiAgIAkJaW5zZXJ0X3Rp
bWUyID0gZ2V0X2luc2VydF90aW1lKCZtbSwgKGluc2VydF9zaXplICogMiksCj4gICAJCQkJCSAg
ICAgICBub2RlcyArIGluc2VydF9zaXplICogMiwgbW9kZSk7Cj4gLQkJaWYgKGluc2VydF90aW1l
MiA8IDApCj4gKwkJaWYgKChzNjQpaW5zZXJ0X3RpbWUyIDwgMCkKPiAgIAkJCWdvdG8gZXJyOwo+
ICAgCj4gICAJCXByX2luZm8oIiVzIGZyYWdtZW50ZWQgaW5zZXJ0IG9mICV1IGFuZCAldSBpbnNl
cnRpb25zIHRvb2sgJWxsdSBhbmQgJWxsdSBuc2Vjc1xuIiwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=

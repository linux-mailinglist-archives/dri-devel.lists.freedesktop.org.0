Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05EAB2DA093
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 20:34:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BE266E10F;
	Mon, 14 Dec 2020 19:34:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2046.outbound.protection.outlook.com [40.107.92.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4636E6E10F;
 Mon, 14 Dec 2020 19:34:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ofiOMnXLoq9TBO1zhaZH8hG2K74m/xVvZEdC/S1pbKlXTWk1id675MCU6EfwgPhBK0ifpsEMKgKb4cH670PDv9I185dQ9tBpYWwn62a8pZ+n1/ake8QNugjB4elz7Nyzs/lDs41/7qof/IVazQqZrE0AeurCl3ctRUG8fM/gRR/AFvJEIMkjYc0Gvs0x6URDYwXqXnKwfeCBP/vgI1nkmTZwvKlXI4eC8vWK8GLeWQphftpHryT88yCa/2hEvoRbFxDiaW6axkIDzJb4wLNGHYO0woaDIxPG5crLanJjUc+e8RIHhi1m8KWkJaCxRvxPVB6RK22ZzgRaCtX6bsxZ8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SMcyG0mvyWCyvkLs1/C0dQbNIA/7GFPTsdOS462Yaog=;
 b=Ii3nQDxID8dow8uEVwmHVOkTpyw2bjRABIO45bH+AGSpp52LaXJSF98ohTgKXIHxNA6BwsZ/Kth6yMsclKRA1gjtyJehTjYQfYmTuIYISbl9ARiJeuNAUO6bWJk4WMmGupoCcpa1Hg8vCQvq+c+x/FyubtuKWTOGICkWrru85rhLJNT/ulomjHL0P67aqnfj8+uFHexcsojtmvyVonB8VwprqUS/Hrk+a8IyNB1+/Azsl0I+JWdtafwP15+5Tbkpq+4A6EYYEg1vtvejIHWfgz6dtp2qTtm++qXhRcQk0Z/oYT0lBfIpfaBzf7C1ec1iJyLl4zTCGkHE/MLv7xzK/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SMcyG0mvyWCyvkLs1/C0dQbNIA/7GFPTsdOS462Yaog=;
 b=P+dZ2RJ43HXd0FeNoSaTtnYBb5+Ljox2b0nTerjWqvhq+00h6mmcBiM+2dcfT/NJw1vmdBbppmZd/70ysd8jP9aUgLMwOQlAax0Xxih15hUx4H+C7uhEBrke1BLf52PtyVqTl/Cg71lH8hbLUlKzcPqLn5fmXCJ6ujWVAgj/pgw=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by BL0PR12MB2355.namprd12.prod.outlook.com (2603:10b6:207:3f::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Mon, 14 Dec
 2020 19:34:22 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::b07d:ede5:2f45:5de8]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::b07d:ede5:2f45:5de8%9]) with mapi id 15.20.3654.024; Mon, 14 Dec 2020
 19:34:22 +0000
Subject: Re: [PATCH] drm/amdkfd: fix ttm size refactor fallout
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20201214191725.3899147-1-daniel.vetter@ffwll.ch>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <06e6a4bd-e74a-f760-225c-2c4347ea2cbb@amd.com>
Date: Mon, 14 Dec 2020 14:34:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201214191725.3899147-1-daniel.vetter@ffwll.ch>
Content-Language: en-US
X-Originating-IP: [142.117.121.176]
X-ClientProxiedBy: YT1PR01CA0113.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::22) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.117.121.176) by
 YT1PR01CA0113.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Mon, 14 Dec 2020 19:34:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c4a0677a-0b07-4595-06b4-08d8a067423a
X-MS-TrafficTypeDiagnostic: BL0PR12MB2355:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB2355E361CA502787BFECF4DC92C70@BL0PR12MB2355.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:546;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O857zzNbdTerwm/Zvg3Lc9u1hyCZy3qpYDFcyoTvZ+echcS1Y0DDnkBZfEoo3ny3gUOPHwFpMEc9iLrQGiNKTajM6ZOnGL2J87X+Ew+AGhayUMpOe0huV3nsb2XCidcn8pDmuEAKywBr3HHLk42HjoHHcI2n5ZVobkcQZdH9EvJ/ZbQgdt6poVYw86V31HFg4A2GYMOfmlTVR0058NaFYVvoAsv+vrMEwaqEgX8IH4JEMz4oTKSrU2rLRz91aftaNDkPOwx6FoKwYtltzgg77jdniKr7tYI4P5v6ek8gDPrH/zvCUpDuPLmKO5b6Oi4r2fTfg5rSCbrlaemAtt6T4F6eQJ/ag+sPP91PaYvAxLDzhsli204pGr4ciK85g0S7Uj0mTmQRYMvT1klnBrJnjpadEau84tTF1W/w9HDgPkpHEwlWsPtLU03cQz9HUBMy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(376002)(366004)(31686004)(26005)(83380400001)(36756003)(8676002)(86362001)(52116002)(66556008)(66946007)(2906002)(956004)(8936002)(66476007)(6486002)(4001150100001)(186003)(2616005)(16526019)(4326008)(66574015)(5660300002)(44832011)(16576012)(34490700003)(110136005)(54906003)(31696002)(508600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WVhTL0oyenl4MGJaMit2S3c4YnlNdHh1LzhCVWE1U3EyVzVlVnFCb3QxV0JK?=
 =?utf-8?B?SXFBL2xnc3VlU1dHY3FpT2ZaU3k3V3NtYlVybFlLcnhPQVF2WjFianFDVVVX?=
 =?utf-8?B?OGh2NUNaTHVCQnkyNXhHUkIzWlhybzhZMG9xQXd6SlI4bU5vR3ZkbU1LQ0s1?=
 =?utf-8?B?aHI1eFRFS0dPSkJrQ3hMK0NyRExzV05YZ1Y2TUdwM1AySmF3eUZjV2ZmWmdt?=
 =?utf-8?B?V3Vpdk5JL1FYRWxTdUxkMmY0dFdxMkwxTm1mMmJEUTRaczVvU0ZuaVhaUWxL?=
 =?utf-8?B?QUJJUGZXNUlIUzM0ekNzVWErMnhwVjEyWkxxMU1NazNCdXRPTlEyV0RLYnY3?=
 =?utf-8?B?ZXIvdDRaWGNjNkplZ2ZVdlRPdzUwL2p1d2lLTUFhSEtWMzBOVEdWVERnT2pB?=
 =?utf-8?B?WEJ1OXV2RVB2NjZTLzRua1JmanRVcXZHcVhqK0d1d285K1BVd2hNK0lXRDhW?=
 =?utf-8?B?a3NMdDAvcjBNU3hZajduL1ZOKzROZzRZUzVQZ0dROWlqNzRTa240d29jODZy?=
 =?utf-8?B?WDdCakRvOUwzYnJRNzljSkRlU3NpQStrNnR4WTJULzRtNytDTVFhOUJRODQ1?=
 =?utf-8?B?TXAyM1Jmd0Fqd2pIb2IvYnQrek1hRUNVV0VBNFhGWEVrR3htUzVIZ2tsNVRS?=
 =?utf-8?B?U3NJaGJnaTIwYkE1WEVLTHJuSnNhYmhMZjNrVmd5czJGZldsdXBhSFpJei9W?=
 =?utf-8?B?UGNidGgvYmxNNm1ORHprcU9GSm00WGxTZFNPendOSGlReWk3SVhma0hUYnFa?=
 =?utf-8?B?R2hmOEFVOEdXR05UbjhUUkhkWkw4dW1LcW1ycHhQSVpRL0ttaXp3ZC80R3ZW?=
 =?utf-8?B?SE93eFVVZExOU0o4MEx6ZmtVOXljbFhaMEZDbHl2YXErbzJ0dFJJbjlyeFlS?=
 =?utf-8?B?c09JSk9mMkxkK2ozamdqUVJSbjIvWmNFTXBXL0RuLy9IODFKVU1OTjRhVXFh?=
 =?utf-8?B?aTI5MVF1L2hvWGpBWlVlNnVlRkI3UDJBZlNSNFNPME5RRmZuWTJMWjRlcWxQ?=
 =?utf-8?B?ODZOaXBZclJtMXhTZXUya1ZYamtQc1kxakdZOHJhcTU3bGFCMWtrRXhKSGNq?=
 =?utf-8?B?Mm1oNC9qWVdTZ0V2bHY1WlcycUVkcTc3bk1OZUxKMWE0ZUtCUnJGVjVINTlB?=
 =?utf-8?B?b1d3TGcyZFUzR3hsTHRQNHhxQk5iN01GUDgxK0RwTlZyWjVyRUxSdTdNWVh0?=
 =?utf-8?B?THB1bGw2MGpSVWRIWXlicUc5R1dYQWFhWUIwdzU2cGJtRVNYUDI0bW1CdEJL?=
 =?utf-8?B?OTl4ZVA4QlppamE4WFpmTUJJVjFNcWlCRDhEV3VlMngyYUtKTk9aNXBmZUVy?=
 =?utf-8?Q?01SikfWHiMjPeWfqF0jLtwb1eauVdHXnaC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2020 19:34:22.4586 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: c4a0677a-0b07-4595-06b4-08d8a067423a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ptGQFsZ2DJdQb2SxPsWe0r/uhBolTR17LOcujnYNSvPh9YD2nVQdz84YcGrWe+cE8EE4f9eZzTJLQHEttmpYsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2355
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
Cc: Daniel Vetter <daniel.vetter@intel.com>, Huang Rui <ray.huang@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjAyMC0xMi0xNCB1bSAyOjE3IHAubS4gc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IEkgZ3Vl
c3MgQ2hyaXN0aWFuIGRpZG4ndCBjb21waWxlIHRlc3QgYW1ka2ZkLgo+Cj4gRml4ZXM6IGUxMWJm
Yjk5ZDZlYyAoImRybS90dG06IGNsZWFudXAgQk8gc2l6ZSBoYW5kbGluZyB2MyIpCj4gQ2M6IENo
cmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiBDYzogSHVhbmcgUnVp
IDxyYXkuaHVhbmdAYW1kLmNvbT4gKHYxKQo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0
dGVyQGZmd2xsLmNoPgo+IENjOiBGZWxpeCBLdWVobGluZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNv
bT4KPiBDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBE
YW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KClRoYW5rcy4KClJldmlld2Vk
LWJ5OiBGZWxpeCBLdWVobGluZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4KCgo+IC0tLQo+ICBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMgfCA4ICsrKyst
LS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9n
cHV2bS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5j
Cj4gaW5kZXggNzc5MWQwNzRiZDMyLi5hOTY0N2U3Zjk4YTggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5jCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5jCj4gQEAgLTQ1Myw3ICs0
NTMsNyBAQCBzdGF0aWMgaW50IGFkZF9ib190b192bShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRl
diwgc3RydWN0IGtnZF9tZW0gKm1lbSwKPiAgCXN0cnVjdCBhbWRncHVfYm8gKmJvID0gbWVtLT5i
bzsKPiAgCXVpbnQ2NF90IHZhID0gbWVtLT52YTsKPiAgCXN0cnVjdCBsaXN0X2hlYWQgKmxpc3Rf
Ym9fdmEgPSAmbWVtLT5ib192YV9saXN0Owo+IC0JdW5zaWduZWQgbG9uZyBib19zaXplID0gYm8t
PnRiby5tZW0uc2l6ZTsKPiArCXVuc2lnbmVkIGxvbmcgYm9fc2l6ZSA9IGJvLT50Ym8uYmFzZS5z
aXplOwo+ICAKPiAgCWlmICghdmEpIHsKPiAgCQlwcl9lcnIoIkludmFsaWQgVkEgd2hlbiBhZGRp
bmcgQk8gdG8gVk1cbiIpOwo+IEBAIC0xMjgxLDcgKzEyODEsNyBAQCBpbnQgYW1kZ3B1X2FtZGtm
ZF9ncHV2bV9mcmVlX21lbW9yeV9vZl9ncHUoCj4gIAkJc3RydWN0IGtnZF9kZXYgKmtnZCwgc3Ry
dWN0IGtnZF9tZW0gKm1lbSwgdWludDY0X3QgKnNpemUpCj4gIHsKPiAgCXN0cnVjdCBhbWRrZmRf
cHJvY2Vzc19pbmZvICpwcm9jZXNzX2luZm8gPSBtZW0tPnByb2Nlc3NfaW5mbzsKPiAtCXVuc2ln
bmVkIGxvbmcgYm9fc2l6ZSA9IG1lbS0+Ym8tPnRiby5tZW0uc2l6ZTsKPiArCXVuc2lnbmVkIGxv
bmcgYm9fc2l6ZSA9IG1lbS0+Ym8tPnRiby5iYXNlLnNpemU7Cj4gIAlzdHJ1Y3Qga2ZkX2JvX3Zh
X2xpc3QgKmVudHJ5LCAqdG1wOwo+ICAJc3RydWN0IGJvX3ZtX3Jlc2VydmF0aW9uX2NvbnRleHQg
Y3R4Owo+ICAJc3RydWN0IHR0bV92YWxpZGF0ZV9idWZmZXIgKmJvX2xpc3RfZW50cnk7Cj4gQEAg
LTE0MDIsNyArMTQwMiw3IEBAIGludCBhbWRncHVfYW1ka2ZkX2dwdXZtX21hcF9tZW1vcnlfdG9f
Z3B1KAo+ICAJbXV0ZXhfbG9jaygmbWVtLT5sb2NrKTsKPiAgCj4gIAlkb21haW4gPSBtZW0tPmRv
bWFpbjsKPiAtCWJvX3NpemUgPSBiby0+dGJvLm1lbS5zaXplOwo+ICsJYm9fc2l6ZSA9IGJvLT50
Ym8uYmFzZS5zaXplOwo+ICAKPiAgCXByX2RlYnVnKCJNYXAgVkEgMHglbGx4IC0gMHglbGx4IHRv
IHZtICVwIGRvbWFpbiAlc1xuIiwKPiAgCQkJbWVtLT52YSwKPiBAQCAtMTUwNiw3ICsxNTA2LDcg
QEAgaW50IGFtZGdwdV9hbWRrZmRfZ3B1dm1fdW5tYXBfbWVtb3J5X2Zyb21fZ3B1KAo+ICAJc3Ry
dWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSBnZXRfYW1kZ3B1X2RldmljZShrZ2QpOwo+ICAJc3Ry
dWN0IGFtZGtmZF9wcm9jZXNzX2luZm8gKnByb2Nlc3NfaW5mbyA9Cj4gIAkJKChzdHJ1Y3QgYW1k
Z3B1X3ZtICopdm0pLT5wcm9jZXNzX2luZm87Cj4gLQl1bnNpZ25lZCBsb25nIGJvX3NpemUgPSBt
ZW0tPmJvLT50Ym8ubWVtLnNpemU7Cj4gKwl1bnNpZ25lZCBsb25nIGJvX3NpemUgPSBtZW0tPmJv
LT50Ym8uYmFzZS5zaXplOwo+ICAJc3RydWN0IGtmZF9ib192YV9saXN0ICplbnRyeTsKPiAgCXN0
cnVjdCBib192bV9yZXNlcnZhdGlvbl9jb250ZXh0IGN0eDsKPiAgCWludCByZXQ7Cl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=

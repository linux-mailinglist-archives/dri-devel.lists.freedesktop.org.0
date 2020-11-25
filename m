Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0082C4212
	for <lists+dri-devel@lfdr.de>; Wed, 25 Nov 2020 15:19:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B354F89E98;
	Wed, 25 Nov 2020 14:19:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2063.outbound.protection.outlook.com [40.107.243.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 341E889E98;
 Wed, 25 Nov 2020 14:19:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qp1S1/lJRGEBowfDlfw66DOpmucCGRkg8S5WFo9a9aIgWZZT0zxgli8hXUfmCI573QcBr7AQwfTkJQWsWeuvX4qADznXlASoof/P8duzq/mzCEMxv+dOyzCu1AAZ6V96jd26rOBHcAfbjA/JBkcSR949B5vKCdIKFFA7V+uczPPBlYTZ7kvUSFnMNkl2Gw5qTWdFBj9GEnX8zvPtCHERZscCDjhUlnleKf6gLrO7FwhGrhjX/ePHftuMCZWdxMBUyqk+CiUAp4OfjYH+WFZTreVqbf9FsuZ1zyytywrSVb4GH7w92DcoJ8+VrBHUtMKRT2y2eQi5fmbKxwTzemxaEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yc0vHeqEzy/nNNXLLwo56pQeOjt6MrgxV5bmDrLH/c0=;
 b=n+VnrjuZYxDkF+c4q38AE4polJ1GwzWpAv6a3rd8pIrP+rzBP0F7H6XOtfr/tfUt+lr9nsRwJmK9SW4yv2AetIr8dOZdHjvfYvTS003tOG5SmM7FI1V7BfKf8ljQ/7UkLH17u4CmsoSze8VrxhQm+8mB93T7n3fnYVIGLIBDRDY6uJ5v5fqs1d/s5E6AJ2dxCPuolHw31IdY4rucnvZVjO6o7s26l22lGu/+5J9CliWMDo43097CGdvv9zkWFJ1NDPM4r8CeqVQtnZkImcvsehL0WY0Apya6QwmG40kSKC4Zk7iiYkX/VzA5fUY7n7UDFeQhm2Ys694eE85DDExvTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yc0vHeqEzy/nNNXLLwo56pQeOjt6MrgxV5bmDrLH/c0=;
 b=3lbZ2lvXyS95raj/bFOLe4Z6M0WpqUS8E7d85+YBsaWoQ1Z3UZ8B1zKu1e+W2XLwpHAbiDVVyDN1iiI0M3JtemdLyw2Q60kFOr+YkKFCc2QU8Gw0uRcSHd8UYdZ03RroEgJpPCGqgniVhSDZTfChUXpptjyTNh58OjBOwsAfiUs=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4303.namprd12.prod.outlook.com (2603:10b6:208:198::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20; Wed, 25 Nov
 2020 14:19:41 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31%7]) with mapi id 15.20.3589.022; Wed, 25 Nov 2020
 14:19:41 +0000
Subject: Re: [PATCH][next] drm/amdgpu: Fix sizeof() mismatch in bps_bo
 kmalloc_array creation
To: Colin King <colin.king@canonical.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Tao Zhou <tao.zhou1@amd.com>,
 Guchun Chen <guchun.chen@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20201125141806.1881036-1-colin.king@canonical.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <88005778-a759-a3c8-a86d-070a51f04dc2@amd.com>
Date: Wed, 25 Nov 2020 15:19:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201125141806.1881036-1-colin.king@canonical.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR04CA0097.eurprd04.prod.outlook.com
 (2603:10a6:208:be::38) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR04CA0097.eurprd04.prod.outlook.com (2603:10a6:208:be::38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.20 via Frontend Transport; Wed, 25 Nov 2020 14:19:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7e4792ee-ed7b-40c9-9221-08d8914d262c
X-MS-TrafficTypeDiagnostic: MN2PR12MB4303:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB430348DD98423365D70C06B483FA0@MN2PR12MB4303.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pXH469PuZXsNYEwDZ2emcrP+KB3FQkTf2bmxXawDy2CDpLEDupIAVxxmESbp19IfM1YAj8JLWMt0Ss7EcRfXpxQUYh1wqVKeG82Fvqih/8+ZZncnFial3++UNwPZgOl9Z/qK0fPenMznB5T5Ice7lNr8v2DKa7Pan/js8ceL7viRfjMSTvrWAVcTJdf5nuoBItrlVkNaxVjcdCEhXUqA54tXOQ+YBh8gCyTr/yjOp3IZskIagwQ667Yw/K4/IX4J1Kaqw9e4GGM0vFARIDLJwwnffp6uChOIqFnd5JiMJ3Bjk/y8u3/M7gwo315sWQZOXOF2ehSwT6EnQOUdd7rvjhy+mhlGFb8Pp2+hEM+A/PmpHoXs8fVCX+/vZBnlBiRr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(396003)(346002)(366004)(376002)(86362001)(110136005)(31686004)(31696002)(83380400001)(6486002)(66574015)(316002)(36756003)(8936002)(5660300002)(4326008)(8676002)(16526019)(66946007)(66556008)(2616005)(66476007)(2906002)(6666004)(186003)(478600001)(52116002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Y3pKdmt3RFBNT241Njk0WFdjdDkxaEtQMEJscmw0aDlHbzZ3aldJOWQyNHZy?=
 =?utf-8?B?NUhIZW5EN1R6VWh4NXBVUkIxMmJReUpkT1kzYnlYRkhRL0dtSWphYWNlVnh0?=
 =?utf-8?B?eUJRQ2ZRR0tBd1JWb0JuVDVEVzB2UHk4MUtPbk5nZlVURUtvNjB4Z3F4aklQ?=
 =?utf-8?B?TDlHMVk2WmlReUovZ1o2OXJtY1dCNnp6SURTNVhBTUU0YlRmSUljUnhjTC9V?=
 =?utf-8?B?bkFObGR5blMxWWlxZVk0TENkWDhkcnM0WUVWZGVMaU0rYTB3ckdCV0x0MHJa?=
 =?utf-8?B?cjQySWphQWpSRjcvRHcxVkI0YVNHM1JwNHZleDE1T2UyczFmTWpaaXRaVGMx?=
 =?utf-8?B?Qjk4Y3pQSmpjWVFlYkdIM21YZFhyU2VGY3IvRG4xVGJvTlF0OC9lamlhMVVr?=
 =?utf-8?B?R2k1TnZUcU1lSmt2OUhwM1R2VVY4UGFLNFBPZDI2UnpmcXB5dGVlamJpUmUv?=
 =?utf-8?B?QmYxeEFoTEowMGlrWXNaK3VaZkpCOTM3aVFhVTZVTlJOZk9ZNXJweEY4RnYy?=
 =?utf-8?B?UTJiQnFvZ0tKMlRsYXBhdjAzM0RlaDczRW5kWTIyRmZHWWE5YklwVWFiUnV0?=
 =?utf-8?B?YXJUTWNVZjBxYzRkRGVrLzVVaEdhYlMrSTNheEMxaTJqbU5wTlBGZzh0U29E?=
 =?utf-8?B?K3pNc3ZoR1RGK3ZUVEZZQ3EvaW9qZzdJb3Rnc05BamhoVCswbC93TU1BZkI0?=
 =?utf-8?B?WmxLSzNZVXd1WWpKNnQwY3ltV25QdGhLSkxRVTFzcTkvWkMvSWE5ZEI0QUtI?=
 =?utf-8?B?eTY0bzU4ODYyNjhLanljZGFnbU52M1FKS1JtUEhOeUFKZ1EvQTQ2T3VWT0RH?=
 =?utf-8?B?RVlVTUp1K0F2dldKYWZ3Q0dQYjBPaGFleUhjbDNrY3l6alI1UHlURFZzVUhn?=
 =?utf-8?B?UVg0bGtVYlFYVDBpSytiSmIyVEppa0tEaEFnVUdFS0tMVkdadlBSL3FuemN6?=
 =?utf-8?B?ZGNEcFlkZHdFclJ1MmJhaXBZZFR5RkVWMnVaM3FmWlRnVjJLTEluNzFMcE1T?=
 =?utf-8?B?UCtnNTl5bHhSS1ZxbFZsSnprMkxlRVdTZE9RSFBIaHZ2YWRJZjBzMU5rWUlG?=
 =?utf-8?B?WnJsTHBhckVWL1lPRXIyVTAzQ1FWVkFmRlNxMTF3d1V4Q1pTeWJYZkFJRnZH?=
 =?utf-8?B?ZFFpL2V2U05LaThaUE8rT2pnVmx1T2lNc2VvMGRjdExsQndkZjhBcDFlYVBQ?=
 =?utf-8?B?bkpmbFFyVEF5RWJIUGp4ZmpWY2YvTDg4NjRYK0FiM2o1U2c2aTJKaXRJa1E0?=
 =?utf-8?B?N3ZFUXdOdXNobk0wMjJ5blFZL3E3RkJWY2taZW1xTUlXS2J6VEJuMWNJQklF?=
 =?utf-8?B?SG05MDRUZEE0MTZFd3hVbmNXTGswNVJLZEFmeXZNNG16ZVgrWFFSa1k2Umd4?=
 =?utf-8?B?RGdIYVBrMk1sRXEvKzFxSERIdmJsaTdMaGg0ZlJiL2dhK3gvY3IxempVVUxi?=
 =?utf-8?Q?A57hANZH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e4792ee-ed7b-40c9-9221-08d8914d262c
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2020 14:19:41.4658 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w56mRr66oSTcdE01IccUCkXFrDYCrsSf9Rh+J4OqjwGymoJydjve8psiZB4n9tDX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4303
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

QW0gMjUuMTEuMjAgdW0gMTU6MTggc2NocmllYiBDb2xpbiBLaW5nOgo+IEZyb206IENvbGluIElh
biBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+Cj4KPiBBbiBpbmNvcnJlY3Qgc2l6ZW9m
KCkgaXMgYmVpbmcgdXNlZCwgc2l6ZW9mKCgqZGF0YSktPmJwc19ibykgaXMgbm90Cj4gY29ycmVj
dCwgaXQgc2hvdWxkIGJlIHNpemVvZigqKCpkYXRhKS0+YnBzX2JvKS4gIEl0IGp1c3Qgc28gaGFw
cGVucwo+IHRvIHdvcmsgYmVjYXVzZSB0aGUgc2l6ZXMgYXJlIHRoZSBzYW1lLiAgRml4IGl0Lgo+
Cj4gQWRkcmVzc2VzLUNvdmVyaXR5OiAoIlNpemVvZiBub3QgcG9ydGFibGUgKFNJWkVPRl9NSVNN
QVRDSCkiKQo+IEZpeGVzOiA1Mjc4YTE1OWNmMzUgKCJkcm0vYW1kZ3B1OiBzdXBwb3J0IHJlc2Vy
dmUgYmFkIHBhZ2UgZm9yIHZpcnQgKHYzKSIpCj4gU2lnbmVkLW9mZi1ieTogQ29saW4gSWFuIEtp
bmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KCkFja2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmln
IDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3ZpcnQuYyB8IDIgKy0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV92aXJ0LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfdmlydC5jCj4gaW5kZXggMmQ1MWI3Njk0ZDFmLi5kZjE1ZDMzZTNjNWMgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZpcnQuYwo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92aXJ0LmMKPiBAQCAtMjgzLDcgKzI4Myw3IEBA
IHN0YXRpYyBpbnQgYW1kZ3B1X3ZpcnRfaW5pdF9yYXNfZXJyX2hhbmRsZXJfZGF0YShzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldikKPiAgIAkJcmV0dXJuIC1FTk9NRU07Cj4gICAKPiAgIAlicHMg
PSBrbWFsbG9jX2FycmF5KGFsaWduX3NwYWNlLCBzaXplb2YoKCpkYXRhKS0+YnBzKSwgR0ZQX0tF
Uk5FTCk7Cj4gLQlicHNfYm8gPSBrbWFsbG9jX2FycmF5KGFsaWduX3NwYWNlLCBzaXplb2YoKCpk
YXRhKS0+YnBzX2JvKSwgR0ZQX0tFUk5FTCk7Cj4gKwlicHNfYm8gPSBrbWFsbG9jX2FycmF5KGFs
aWduX3NwYWNlLCBzaXplb2YoKigqZGF0YSktPmJwc19ibyksIEdGUF9LRVJORUwpOwo+ICAgCj4g
ICAJaWYgKCFicHMgfHwgIWJwc19ibykgewo+ICAgCQlrZnJlZShicHMpOwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

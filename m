Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A07D5276FDD
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 13:26:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8EB76EA66;
	Thu, 24 Sep 2020 11:26:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2045.outbound.protection.outlook.com [40.107.237.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3737A6EA66
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 11:26:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ej2m7KUFgrPSTOzSCCKJUVBzkoNb29YKEkO2ES5ZD2EcArasrQ7eFVU+XpJLc5ILiVcFNkGHPJwfPMKi1oitpBhjfKtUvK6dyLDcFYHWM675XN5AgsioBcaWNGl9smM45ufZ1GVugYg8HN0Oefyh1j1RhmVTeZXsYbzW4FAtfd6k2NMME0WuOenfJdggVSDxxjMtIPWLel61T5afVSKpHbLMxRfQwXCFI8AGWONoFIDCReE/1NAubFZ4qa1Te+SjJZcNfTy9uE+u+FjxqVGw1KoFc3NLl80CgYlOz1lsCAyzfB2bAuBbIraVw4Oiko4C1NKwoupz/KHuD8XBGkdmNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gAQuefLn5FRVuM1paZZm8irO8IucAvgT2DVPHaabo6A=;
 b=kfZ95+VfRb/GiBHJMk82M/L2wm92uOdE7QSo3LcIm379tV5oNXFlN2J/6XW6UH0UVjeXxyAqCfetSQdJ6f+cF0UchwxFz3EQK2Pi7MXpYo7rt9/twXi4b0YGQ/CjBkqhsUpWg6VUc6GwdcR7Ur8NLoEBXmGX+76Fy3YxGyQy4f+DhXqheGbxyVRzu+PpiYf4Orj+ocd2abciRvYfwP7PLRS8H/RdQdeUcn6aHOYgPsSLHXRQMWcZIsi//pOghuMro26Ff9qZugWMaRThOSH46CMNFiyv2G22MM90t3Pd+YIda2PMTnLW317NKr11coYM0HRkgE/fJ6XKwoU5DK59vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gAQuefLn5FRVuM1paZZm8irO8IucAvgT2DVPHaabo6A=;
 b=cJUrUROc+alWtFJZfLR1SftVAKrO0ejpCFkSBwEBEMytnyY2FszDSQ8o2yCPU2VHPTj8yP7vbggh1G3dKgHE99gF0l+Hj/OVpVcSr4zA1xmiAl4q/KZ+/VJMudvR0OIxs49cOfB4rDU1dLJnPetMAuZ4ARP30kD8ehgQajbxYYw=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4408.namprd12.prod.outlook.com (2603:10b6:208:26c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14; Thu, 24 Sep
 2020 11:26:20 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3412.022; Thu, 24 Sep 2020
 11:26:20 +0000
Subject: Re: [PATCH 13/45] drm/ttm: use new move interface for known
 system->ttm moves
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200924051845.397177-1-airlied@gmail.com>
 <20200924051845.397177-14-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <7b6256cb-7861-734e-25bd-2d4da2378a6e@amd.com>
Date: Thu, 24 Sep 2020 13:26:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200924051845.397177-14-airlied@gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR10CA0042.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::22) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR10CA0042.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.26 via Frontend
 Transport; Thu, 24 Sep 2020 11:26:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1745823b-1ef9-496a-0e31-08d8607ca94d
X-MS-TrafficTypeDiagnostic: MN2PR12MB4408:
X-Microsoft-Antispam-PRVS: <MN2PR12MB44087AF6D9DCD4D76831391283390@MN2PR12MB4408.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R1SS4sSPZ+iW5Jl1VMw4vIzKVkWAI+2xxpgUF18ejAUBurrzg/o5/LZXYGaKtE3aTKqMUTummRPva8hi1uxxPrmocpluXniSTRnBZSkPP4+Oe0GZoTDxiOl1GFkozLAcpFyqP684W/W1ssh5uBhePAZDzkjPKAhJ3kfNkeAs5McS8X1sIxpGM1/wZExR0arlFMCuM1/qzVRp5jz+Wyl9xX0RsuiH6BtMaWXAUi7ADqxCnCGFUWc09fcXhnuVld6p7QzhmQBLfUifs4PdL468YQuypYwtuJHGURM94obgZdzrWiAj/gHj0D0s+5fJkQF1/DKefUenKQ6xmWJNZ3qmxP7K7ePZ+SMrEmdoYG46Pds0ew7gA7MqYIBp6tNBASEJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(39860400002)(396003)(376002)(346002)(31696002)(66946007)(16526019)(8676002)(186003)(66476007)(6666004)(5660300002)(2616005)(52116002)(83380400001)(66556008)(86362001)(2906002)(36756003)(316002)(6486002)(8936002)(31686004)(478600001)(4326008)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: y3GIVoND8UfFw1RrqDonWl/HIGXZpG3Qf5n5T/vXtpCqrhocw7raf66XanX19/W1OTiQSxuTdquZIZQdu7ybvchL4MrOTjtixRLsZ/wFN6skTQdIIRWXY38W0BhxC71L+fMJ19jWUErTATX/C6C1uEMi0kqg7C0samDTodbDA6akVy484fJrRExbXan2KKb5Kudep+LxYeY8Y712u40nzVeMKtOaC5v7+jxLAIF+o1BNtPf06xHE7BBR/GZ35liQDiDZwztrg72gfs6EKnZqQelWZpSt7gZP+8Bvdw5EwBvaafgf5/6CaEBRY9rpdOM7qdqGPo2gBPf5pi3tvoe4gzFGV9TXMrhDhCGkMkPmL0LI+mHNIVzvFK4GS7vDP/IBK7NYrH528+YMN1+ssarmovN7L9qHpYX1NFbPEVWXWRZwsgQ8xg0IQzz+NXXTYMY9ra7bzU6Q6qMhd7RTvokohSMlZnrBKRYOLeWApX4ZDJNXeljSrWD7/xD7G2ndjZXvTS8y7PfKQDgWgEF+YxNxeGW9Ek+lCcO99hHTCfqibFnaKEhaqzPK1dyyoWAIA0Hf20Ogc9JNXM4GTiMzBzzgKxV3jiRpNiskmi1gp2af4VKRpYVAvopnkPeeSRNI7W5O5Ug2i40/EZB114UnIdbSQceMBnmWg+rUJMsESJ07J0H0BzaRuXL8cu6NB1FRaEJEkq1fVcJMWIqknXZmYVSFcA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1745823b-1ef9-496a-0e31-08d8607ca94d
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2020 11:26:20.7144 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vOxs7tXCmR9oYhC2XTMTVBVwoaQkaTrU2V/8+mGkjdcOOaolZCyGqZ/JpkhQrRut
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4408
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
Cc: bskeggs@redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjQuMDkuMjAgdW0gMDc6MTggc2NocmllYiBEYXZlIEFpcmxpZToKPiBGcm9tOiBEYXZlIEFp
cmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+Cj4gSW4gYWxsIDMgZHJpdmVycyB0aGVyZSBpcyBh
IGNhc2Ugd2hlcmUgdGhlIGRyaXZlciBrbm93cyB0aGUKPiBibyBpcyBpbiBTWVNURU0gc28gZG9u
J3QgY2FsbCB0aGUgYXBpIHRoYXQgY2hlY2tzIHRoYXQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBEYXZl
IEFpcmxpZSA8YWlybGllZEByZWRoYXQuY29tPgoKSW4gdGhlIGxvbmcgdGVybSBJIGNvbXBsZXRl
bHkgd2FudCB0byBnZXQgcmlkIG9mIHRoaXMgbm9uc2Vuc2UgYmVjYXVzZSAKaXQgbWVhbnMgdGhh
dCB3ZSBjYWxsIGJhY2sgaW50byBUVE0gd2hpY2ggdGhlbiBjYWxscyB1cyBhZ2Fpbi4KCkJ1dCBm
b3Igbm93IHRoZSBwYXRjaCBpcyBSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyAKPGNocmlz
dGlhbi5rb2VuaWdAYW1kLmNvbT4KCj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfdHRtLmMgfCA0ICsrLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZl
YXVfYm8uYyAgICB8IDMgKystCj4gICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl90dG0u
YyAgICAgfCAzICsrLQo+ICAgZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdXRpbC5jICAgICAg
IHwgMSArCj4gICA0IGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMo
LSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRt
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMKPiBpbmRleCBkM2Jk
MmZkNDQ4YmUuLjk2MGE5OWQ2NzkzYSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfdHRtLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfdHRtLmMKPiBAQCAtNjA3LDExICs2MDcsMTEgQEAgc3RhdGljIGludCBhbWRncHVfbW92
ZV9yYW1fdnJhbShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLCBib29sIGV2aWN0LAo+ICAg
CX0KPiAgIAo+ICAgCS8qIG1vdmUvYmluZCBvbGQgbWVtb3J5IHRvIEdUVCBzcGFjZSAqLwo+IC0J
ciA9IHR0bV9ib19tb3ZlX3R0bShibywgY3R4LCAmdG1wX21lbSk7Cj4gKwlyID0gdHRtX2JvX21v
dmVfdG9fbmV3X3R0X21lbShibywgY3R4LCAmdG1wX21lbSk7Cj4gICAJaWYgKHVubGlrZWx5KHIp
KSB7Cj4gICAJCWdvdG8gb3V0X2NsZWFudXA7Cj4gICAJfQo+IC0KPiArCXR0bV9ib19hc3NpZ25f
bWVtKGJvLCAmdG1wX21lbSk7Cj4gICAJLyogY29weSB0byBWUkFNICovCj4gICAJciA9IGFtZGdw
dV9tb3ZlX2JsaXQoYm8sIGV2aWN0LCBuZXdfbWVtLCBvbGRfbWVtKTsKPiAgIAlpZiAodW5saWtl
bHkocikpIHsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9i
by5jIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9iby5jCj4gaW5kZXggMmMxMGE4
NGIyY2MwLi4yY2I2MWVlYTk0ODEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZl
YXUvbm91dmVhdV9iby5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9i
by5jCj4gQEAgLTk0NSwxMCArOTQ1LDExIEBAIG5vdXZlYXVfYm9fbW92ZV9mbGlwcyhzdHJ1Y3Qg
dHRtX2J1ZmZlcl9vYmplY3QgKmJvLCBib29sIGV2aWN0LAo+ICAgCWlmIChyZXQpCj4gICAJCXJl
dHVybiByZXQ7Cj4gICAKPiAtCXJldCA9IHR0bV9ib19tb3ZlX3R0bShibywgY3R4LCAmdG1wX3Jl
Zyk7Cj4gKwlyZXQgPSB0dG1fYm9fbW92ZV90b19uZXdfdHRfbWVtKGJvLCBjdHgsICZ0bXBfcmVn
KTsKPiAgIAlpZiAocmV0KQo+ICAgCQlnb3RvIG91dDsKPiAgIAo+ICsJdHRtX2JvX2Fzc2lnbl9t
ZW0oYm8sICZ0bXBfcmVnKTsKPiAgIAlyZXQgPSBub3V2ZWF1X2JvX21vdmVfbTJtZihibywgdHJ1
ZSwgY3R4LCBuZXdfcmVnKTsKPiAgIAlpZiAocmV0KQo+ICAgCQlnb3RvIG91dDsKPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdHRtLmMgYi9kcml2ZXJzL2dwdS9k
cm0vcmFkZW9uL3JhZGVvbl90dG0uYwo+IGluZGV4IGRmNWNlZGIyYjYzMi4uN2I3NzhmYzc0Zjdi
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX3R0bS5jCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdHRtLmMKPiBAQCAtMjgwLDEwICsyODAs
MTEgQEAgc3RhdGljIGludCByYWRlb25fbW92ZV9yYW1fdnJhbShzdHJ1Y3QgdHRtX2J1ZmZlcl9v
YmplY3QgKmJvLAo+ICAgCWlmICh1bmxpa2VseShyKSkgewo+ICAgCQlyZXR1cm4gcjsKPiAgIAl9
Cj4gLQlyID0gdHRtX2JvX21vdmVfdHRtKGJvLCBjdHgsICZ0bXBfbWVtKTsKPiArCXIgPSB0dG1f
Ym9fbW92ZV90b19uZXdfdHRfbWVtKGJvLCBjdHgsICZ0bXBfbWVtKTsKPiAgIAlpZiAodW5saWtl
bHkocikpIHsKPiAgIAkJZ290byBvdXRfY2xlYW51cDsKPiAgIAl9Cj4gKwl0dG1fYm9fYXNzaWdu
X21lbShibywgJnRtcF9tZW0pOwo+ICAgCXIgPSByYWRlb25fbW92ZV9ibGl0KGJvLCB0cnVlLCBu
ZXdfbWVtLCBvbGRfbWVtKTsKPiAgIAlpZiAodW5saWtlbHkocikpIHsKPiAgIAkJZ290byBvdXRf
Y2xlYW51cDsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdXRpbC5j
IGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdXRpbC5jCj4gaW5kZXggZGFmOWE5MTg1N2Y4
Li5lNzY4ODM4MzZlNmUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9f
dXRpbC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdXRpbC5jCj4gQEAgLTY3
LDYgKzY3LDcgQEAgaW50IHR0bV9ib19tb3ZlX3RvX25ld190dF9tZW0oc3RydWN0IHR0bV9idWZm
ZXJfb2JqZWN0ICpibywKPiAgIAl9Cj4gICAJcmV0dXJuIDA7Cj4gICB9Cj4gK0VYUE9SVF9TWU1C
T0wodHRtX2JvX21vdmVfdG9fbmV3X3R0X21lbSk7Cj4gICAKPiAgIHN0YXRpYyBpbnQgdHRtX2Jv
X21vdmVfb2xkX3RvX3N5c3RlbShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAo+ICAgCQkJ
CSAgICAgc3RydWN0IHR0bV9vcGVyYXRpb25fY3R4ICpjdHgpCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

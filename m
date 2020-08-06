Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2925C23D819
	for <lists+dri-devel@lfdr.de>; Thu,  6 Aug 2020 10:43:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA4C36E897;
	Thu,  6 Aug 2020 08:43:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060.outbound.protection.outlook.com [40.107.243.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C5676E897
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Aug 2020 08:43:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P0ejW7SaB4oUGFhlEHmBK9CMucks8+LEXQrIYupxqcSXh56t5JbcMQaLD7XNqQhdSojiwb/HFHNcvly9UjIz1VIG9xLHwafv1QRhyyGLegSAqxY7hyIPBlpzyY7l5bNF8uiXhlsgGsl9w1BE7PouXA0Y4EioyqELwSciCliWQjqZiqi1cwUK0GS1sgZzpcez5TB8+UBal11whBbYGV/tOxfvNWm6CWllqVPH0JLqI7bbkhzwnModq0ykHjo8BVteOXm7DlSdLwILPzdW29/2pTJLASzheSm9jFNYDKYeZI9aZKZNhAOlOo1oATgW7pltKgn7/Mr+diDjT6XtzqzXbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mzGaGl8Uc4YtWQue6yKgYcZOhrXdt9nXuFRf3nx/IKo=;
 b=WQu/n3VKG3NiQR+StQTStzRf/LNNoKyWqR1av5ng4aL2xbxbbcDDt4BA7Qz6rjZskow/HX+DcVpCno58cz4D8cYZ+aIv8ijrCS3GO6lKXrW3CG80HQmAj68C368tHeBkKWkT0CO2Y600SA1syDG+7TNwvsvUX7FYm3PaCPqmOJvns6t9w4dn1cqYEJLH/m31UlXq4r9X73Ij4HvBct79jSwsTpKmsE1L1HBRZHff3Z8tT//vi+MXWnFjXftQ/UeweGCbA6XB4ZKUBq+7rg60BJsBTG0OBOo+X0XjW8oAcDVZwpX16G6CgBspbKCySGdB8pgAxngxUeI2L4lMZMLVuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mzGaGl8Uc4YtWQue6yKgYcZOhrXdt9nXuFRf3nx/IKo=;
 b=Mg3RomYZyWAi/2zULiMf7KZil7QiXTySy0su0Ta6/5uqGI0va92tmRGZRq4/J6Uj42GhTUdJd7PYdfX/AiZBrGmNLxfHws78f5NSwbvotqgS004zfa2vfPcG5xpF2QZ7nA58df58iWD/xzfuF3qzZxSW9g9gZKZd0soOmCquj0U=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4222.namprd12.prod.outlook.com (2603:10b6:208:19a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.18; Thu, 6 Aug
 2020 08:43:07 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3239.023; Thu, 6 Aug 2020
 08:43:07 +0000
Subject: Re: [2/2] drm/ttm: make TT creation purely optional v3
To: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
References: <20200629151925.2096-2-christian.koenig@amd.com>
 <a1ba1387-1270-32e3-960f-f98495d92c11@daenzer.net>
 <03df2698-293b-2dff-923a-f8c731f55dec@gmail.com>
 <b818b065-50cd-9e8a-3cff-01dd124a04c4@daenzer.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <8d5809be-104d-40e8-e8bb-5186d5b565b5@amd.com>
Date: Thu, 6 Aug 2020 10:43:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <b818b065-50cd-9e8a-3cff-01dd124a04c4@daenzer.net>
Content-Language: en-US
X-ClientProxiedBy: AM0PR08CA0023.eurprd08.prod.outlook.com
 (2603:10a6:208:d2::36) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR08CA0023.eurprd08.prod.outlook.com (2603:10a6:208:d2::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.15 via Frontend Transport; Thu, 6 Aug 2020 08:43:06 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a8929bd0-d1b5-49c0-9c13-08d839e4bd7d
X-MS-TrafficTypeDiagnostic: MN2PR12MB4222:
X-Microsoft-Antispam-PRVS: <MN2PR12MB422297D9721B09220E9198B883480@MN2PR12MB4222.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TTEMGUpaFcERMmoV95V73/YIIu4m1hloUC/wJ6RrY7S9ah2AZ/3y7JRpOjuumtZ35kOg2FTmOFdVo5ZrOUy6NaSLue7wHEeyG5d2T64H9ozkQGgCqOEDTv44VKVRdgcNiKjh9fIPcjBQnOBjCaznMKcLojIqlF5OghReZnVK4VP2hMaIY5RCy5KLxewKdMcKQ8WhS95rfwdMDIx54EuD+C0/nvQF95IU0ZN9uO00blRxfie+eWVW8uQmMlNrAiwBh1D88+ygrEvQ/ZCgaqhpvUC/FavXftMS3MZIfj4spNTvIdJfzkkxzxozzeOkg2uYbGIUR/5BmFrgaZMoW4bF5+MndXbmFzq40O0KhVo+qhKj7ZkNagd4kkrAwkbyjOY+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(136003)(346002)(376002)(396003)(39860400002)(31696002)(2616005)(5660300002)(31686004)(478600001)(86362001)(52116002)(8676002)(83380400001)(66476007)(4326008)(36756003)(316002)(66946007)(6666004)(53546011)(6916009)(8936002)(186003)(6486002)(16526019)(66556008)(2906002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: nCwlYErqxQYJDbQPNlrNzRD84WykP6Di92srxrqg3/7067+uPGhSXfHaoKNMQuTU+3QOdoSGDMY6XfCWljkHeTbFRyVjuoUZRmVwosefokA8j1lPcdWPycyC7X5UiVmy0kGoAry3XGXVYc/9EHQLNCfe5/LbjYwjfZL0uZZO7bM+ZeedGlsEhPuxl2fsm+1ejoUAzJ1C6cbsvPAaTObR+n5QFjLpeJqKW/npym+5OP5XLCJ9aN+DjKN2Ac1hoxhvodA1ThHpo3njcnFpB3thL0cFSEWpXJnXgI7iXFasNnJH64hWvKuYvh8Ln5SSflkudg8MldtwneYv2qMibMqLAoQBIq+pE/6nzWYlKIoYoBl1/F0X6WN2Y/vyhBs1x6HfxJAnWWnQxafSg3K40RiELnEdSuyW8wqsFJ+RQYY223JLy8VdcPaGDS18cF/+lLh8ZomdUo3DWD/jvlVlVHiCZ4se07H5cVZMxEYFY9+cVCwh7RplZ3mBzIv4P4AXY8QilAMXBGCQhC3FEsYRl7fwxveTrvNTuP1tml9pmFq5UIwH6XYaXKsJwZkfeb3GHYwrDExVRN1pWjS/f0+IPxQWjiMrX30gdS+3/sO0WRQdtXhXqZJ172dIzVV1s3S1kXB1XVTKmkeXUp4AtwfC7feHYDH8LES62ZvisxuSIJ3cDbe817/pF9Tpzje4QlbWr/GNrS93EqvqqNyp3GAyDJuKQQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8929bd0-d1b5-49c0-9c13-08d839e4bd7d
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2020 08:43:07.0825 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wqh65lhJ2ozx06RHGQrVuFC+tzW97k4mWyr/bT80u2rMlDEMnoa6ujWi6GthQUg2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4222
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
Cc: dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDYuMDguMjAgdW0gMTA6MDEgc2NocmllYiBNaWNoZWwgRMOkbnplcjoKPiBPbiAyMDIwLTA4
LTA2IDk6MTMgYS5tLiwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4gQW0gMDUuMDguMjAgdW0g
MTg6MTYgc2NocmllYiBNaWNoZWwgRMOkbnplcjoKPj4+IE9uIDIwMjAtMDYtMjkgNToxOSBwLm0u
LCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+Pj4+IFdlIG9ubHkgbmVlZCB0aGUgcGFnZSBhcnJh
eSB3aGVuIHRoZSBCTyBpcyBhYm91dCB0byBiZSBhY2Nlc3NlZC4KPj4+Pgo+Pj4+IFNvIG5vdCBv
bmx5IHBvcHVsYXRlLCBidXQgYWxzbyBjcmVhdGUgaXQgb24gZGVtYW5kLgo+Pj4+Cj4+Pj4gdjI6
IG1vdmUgTlVMTCBjaGVjayBpbnRvIHR0bV90dF9jcmVhdGUoKQo+Pj4+IHYzOiBmaXggdGhlIG9j
Y3VycmVuY2UgaW4gdHRtX2JvX2ttYXBfdHRtIGFzIHdlbGwKPj4+IFRoaXMgYnJva2UgYW1kZ3B1
IHVzZXJwdHIgZnVuY3Rpb25hbGl0eSBmb3IgbWUsIGluIHBhcnRpY3VsYXIgYWxsCj4+PiBHTF9B
TURfcGlubmVkX21lbW9yeSBwaWdsaXQgdGVzdHMsIGUuZy4KPj4+Cj4+PiAuLi4vcGlnbGl0L2Jp
bi9hbWRfcGlubmVkX21lbW9yeSBkZWNyZW1lbnQtb2Zmc2V0IC1hdXRvIC1mYm8KPj4+IE9mZnNl
dCBpcyBkZWNyZW1lbnRlZCwgbm8gd2FpdC4KPj4+IE1lc2E6IFVzZXIgZXJyb3I6IEdMX0lOVkFM
SURfT1BFUkFUSU9OIGluIGdsQnVmZmVyRGF0YQo+Pj4gWy4uLl0KPj4+IFVuZXhwZWN0ZWQgR0wg
ZXJyb3I6IEdMX0lOVkFMSURfT1BFUkFUSU9OIDB4NTAyCj4+PiAoRXJyb3IgYXQgdGVzdHMvc3Bl
Yy9hbWRfcGlubmVkX21lbW9yeS90ZXN0LmM6MjE0KQo+Pj4gUElHTElUOiB7InJlc3VsdCI6ICJm
YWlsIiB9Cj4+IEJ1dCBubyBjcmFzaGVzPyBJIHdvdWxkIGhhdmUgZXhwZWN0ZWQgYSBOVUxMIHBv
aW50ZXIgZGVyZWYgaWYgd2UgaGF2ZQo+PiBtaXNzZWQgY2FsbCBwYXRoLgo+IE5vIGNyYXNoZXMu
IFNpbmNlIGEgR0wgZXJyb3IgaXMgcmFpc2VkLCBteSBndWVzcyB3b3VsZCBiZSB0aGF0IGFuIGlv
Y3RsCj4gd2hpY2ggd2FzIHByZXZpb3VzbHkgc3VjY2VlZGluZyBpcyBub3cgcmV0dXJuaW5nIGFu
IGVycm9yLgoKTWhtLCBJIGNhbiByZXByb2R1Y2UgdGhlIHByb2JsZW0gdGhhdCB1c2VycHRycyBk
b2Vzbid0IHdvcmsgYW55IG1vcmUuIApCdXQgZXZlbiB3aXRoIHRoZSBtZW50aW9uZWQgcGF0Y2gg
cmV2ZXJ0ZWQgdGhhdCBzdGlsbCBkb2Vzbid0IHdvcmsgb24gCnRoZSB0aXAgb2YgZHJtLW1pc2Mt
bmV4dC4KCkFyZSB5b3Ugc3VyZSB5b3VyIGJpc2VjdGluZyBpcyByaWdodD8gR29pbmcgdG8ga2Vl
cCB0ZXN0aW5nLgoKQ2hyaXN0aWFuLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK

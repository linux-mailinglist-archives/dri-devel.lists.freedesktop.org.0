Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A7122B17E
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jul 2020 16:39:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 200ED6E09F;
	Thu, 23 Jul 2020 14:39:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770078.outbound.protection.outlook.com [40.107.77.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BE246E09F
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jul 2020 14:39:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KkgTA9dr0zfcOwLOHQsmd7TpjdUdt+x3cnVQ0WEIHNxeJk65/KOyaqZ8I1pA21Te7Tkmz1erVGadvqfm6PxWTFL1NS2g6NiP7jU0CfuQqcqfL8iYnZL61C/uH55XbeLuWQ5RSIuZE2BSyTW2eca9kL5ORw8L5BPnUGpCVazkwgoFuTC99DPVwQ2hP8olm51+REIIavj/R/i+xgp869OY9BjR6YYyZi5FwP+JmW/NW8CMvB4YOr8yX9vZy5vmMVFkSYMrEGfLTGNBuYGpiZBO7ziogv0lT87Cm3pC25ji7vwPMyUFCL8vkyHDTsOF+NoQcy14jS0m+8wD9la3ubO47Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ACF3vwnUg2qeWMzPbPhLu7vaRlQ6AqJyPqbM99kPJP0=;
 b=OOz5GjVP57rfasJ5PX0zuqJfqgGYBygX5CZIBN5ucv8pYRqV3FRoje838JW28KP3rsRKzuVIxQ+EXe3AcbGpdviTU++Xerc6FfKA2hsdiDMXTd4/ldJRBp4vVCbDMMnUXLh2UGYMfJmROqD9LCUMtC1POxBqFBQDP52eMnVNmC4SR2XFAAkT6quEhAgoAS90Ei5dA/vPIsL+q2mw1ZC6ZFdR/ucKkwVfGm9lM+Fi+XLKOHZ2AuQg9qNkssSkKAT4GYo+ywPgYpYxDd3hfBO/U6PuZKzOZEwQe/Aq3LZ8ModY1E9Jv1mpFCjLDkSadvfmFwE/Eu8CKZRDnt1SW65dlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ACF3vwnUg2qeWMzPbPhLu7vaRlQ6AqJyPqbM99kPJP0=;
 b=VkuqIY0LmtNZ9BV3uA3kGBaiaWkHWP74ZjopkMhjgt5Z0ogEJkVeTAQYBXdFBmDC+HffxGgEsqm1sxluf5mZC3Yy/MeTcnAK8HRCaZsc04hmEZj56lSHhLvVHcZQyGiCob9JjYl7g0z2efU+HSBVEb0d+DoOTBJ2mnNh3L6Yxac=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from SN1PR12MB2414.namprd12.prod.outlook.com (2603:10b6:802:2e::31)
 by SN1PR12MB2541.namprd12.prod.outlook.com (2603:10b6:802:24::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Thu, 23 Jul
 2020 14:39:23 +0000
Received: from SN1PR12MB2414.namprd12.prod.outlook.com
 ([fe80::5d1d:887c:3ba6:1d0d]) by SN1PR12MB2414.namprd12.prod.outlook.com
 ([fe80::5d1d:887c:3ba6:1d0d%7]) with mapi id 15.20.3216.020; Thu, 23 Jul 2020
 14:39:23 +0000
Subject: Re: [PATCH] drm/ttm: fix pipelined gutting for evictions
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20200723090000.5725-1-christian.koenig@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <a2e49196-6938-782d-95d6-75a85b070219@amd.com>
Date: Thu, 23 Jul 2020 10:39:21 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200723090000.5725-1-christian.koenig@amd.com>
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0100.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::9) To SN1PR12MB2414.namprd12.prod.outlook.com
 (2603:10b6:802:2e::31)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.117.61.76) by
 YT1PR01CA0100.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.22 via Frontend Transport; Thu, 23 Jul 2020 14:39:23 +0000
X-Originating-IP: [142.117.61.76]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5dcdd93f-a621-4e33-0e66-08d82f163134
X-MS-TrafficTypeDiagnostic: SN1PR12MB2541:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN1PR12MB25415990B7D190CB7EAB974392760@SN1PR12MB2541.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AXY5hyMSc7VxdYpNIwng2lk24OFJ++bYvh0qvdbPsTwntJQYUnAEIqirFBcAJhgzyy18XwqvrgIPRsqsunqeLS4O/nmiZWcbfT45TTj1O5qlRFO4Pgute74a9YrQxaR8AiznhRB6Vb4Cs6YBie50Tm2g6qsN0duTH8RN10DV4mzmu9nzTeUHWkLH25q0uz8OxDBPm0vQzk7EhDqPqZa6WBZTbS1l6n/wnCqlsXjXOH4pPTe+gxtE/EWsCgk0i9LnvhwF13O+ljMrzgqJ3UyId1dG2uuHKL5bZFVyCKKp+AnJ3tEj3gUEwo+wUsJ3ikjGfdfdrLOX1hWMMRgZ3WUpotS/amP6eiOTte0uARTkOfcPojyoLccioivvgVpKLxWs
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN1PR12MB2414.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(346002)(366004)(376002)(39860400002)(136003)(31696002)(66946007)(4326008)(2616005)(66574015)(31686004)(5660300002)(956004)(26005)(8676002)(186003)(6486002)(44832011)(16576012)(83380400001)(52116002)(86362001)(66476007)(66556008)(8936002)(16526019)(2906002)(316002)(36756003)(478600001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 7qkdCpn3SiFMGVRNfRTFy9Yoe60QW2v/f7ydWdxpu8Y6y5W+63CbKa3p9XcdUSQ1Kk8QoOoQfpbvrrhvQOFkNPdq7UvBZGGluJS8tqlBgjZNi9qkEHU8hFnUgU5RH6VV1LIJHsLj+5wuYpFFyGUs61ErIjN+UfMhWjlep1aKZLE2+rwofEH81lo+IVGcxwdpPDRIzRjSpmMn00tYLL74IMAT0EOwpFGgOUuW7ZGSDfPoj8UHQtF70Y0ErX6pukaYYjZ15v2sLTWecm49XhX1r6ItLkw9nIk7kSyNwcq837CBOqypuuEhfYjShQmpkhZXJw3oJlg28VfB6f3rAtYODh0BUd6B2TT1fDHXX5qxOLpuLrN4eexPSZ+JnSswqG66v4hJkrZw7aa808Sz1MBVNKaWtPUjvQV+UbHb/78uZJpI4L76UFy/ptaC5ExEF8cetMqB6suBNTfyZK9lM4a7wJ06f4VzHVcLX5NtLrhKqhU2dhraYlnrJx9sIOgz+20f
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dcdd93f-a621-4e33-0e66-08d82f163134
X-MS-Exchange-CrossTenant-AuthSource: SN1PR12MB2414.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2020 14:39:23.6684 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NzG/N7ak0iC4j7fAff8JA5zq8d+6314r4e8yPG37eVQiNaBQUblT3N3saAyqwy05WYHwZKj/14Of6/2CBZ6tug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2541
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
Cc: Alex.Sierra@amd.com, Philip.Yang@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjAyMC0wNy0yMyB1bSA1OjAwIGEubS4gc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOgo+IFdl
IGNhbid0IHBpcGVsaW5lIHRoYXQgZHVyaW5nIGV2aWN0aW9uIGJlY2F1c2UgdGhlIG1lbW9yeSBu
ZWVkcwo+IHRvIGJlIGF2YWlsYWJsZSBpbW1lZGlhdGVseS4KPgo+IFNpZ25lZC1vZmYtYnk6IENo
cmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KCkxvb2tzIGdvb2QgdG8g
bWUuCgpSZXZpZXdlZC1ieTogRmVsaXggS3VlaGxpbmcgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+
CgoKQWxleCwgaW4gdGhpcyBjYXNlIHRoZSBzeW5jaHJvbm91cyB0dG1fYm9fd2FpdCB3b3VsZCBi
ZSB0cmlnZ2VyaW5nIHRoZQpldmljdGlvbiBmZW5jZSByYXRoZXIgdGhhbiBhIGRlbGF5ZWQgZGVs
ZXRlLgoKU2NoZWR1bGluZyBhbiBldmljdGlvbiB3b3JrZXIsIGxpa2Ugd2UgY3VycmVudGx5IGRv
LCB3b3VsZCBvbmx5IGFkZAp1bm5lY2Vzc2FyeSBsYXRlbmN5IGhlcmUuIFRoZSBiZXN0IHBsYWNl
IHRvIGRvIHRoZSBITU0gbWlncmF0aW9uIHRvCnN5c3RlbSBtZW1vcnkgc3luY2hyb25vdXNseSBh
bmQgbWluaW1pemUgdGhlIHdhaXQgdGltZSBoZXJlIG1heSBiZSBpbgphbWRncHVfZXZpY3Rpb25f
ZmxhZ3MuIFRoYXQgd2F5IGFsbCB0aGUgU0RNQSBjb3BpZXMgdG8gc3lzdGVtIG1lbW9yeQpwYWdl
cyB3b3VsZCBhbHJlYWR5IGJlIGluIHRoZSBwaXBlIGJ5IHRoZSB0aW1lIHdlIGdldCB0byB0aGUg
dHRtX2JvX3dhaXQuCgpSZWdhcmRzLArCoCBGZWxpeAoKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2Ry
bS90dG0vdHRtX2JvLmMgfCAxMiArKysrKysrKysrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEwIGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3R0bS90dG1fYm8uYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKPiBpbmRleCBi
YzIyMzBlY2I3ZTMuLjEyMjA0MDA1NmEwNyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
dHRtL3R0bV9iby5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwo+IEBAIC02
NTEsOCArNjUxLDE2IEBAIHN0YXRpYyBpbnQgdHRtX2JvX2V2aWN0KHN0cnVjdCB0dG1fYnVmZmVy
X29iamVjdCAqYm8sCj4gIAlwbGFjZW1lbnQubnVtX2J1c3lfcGxhY2VtZW50ID0gMDsKPiAgCWJk
ZXYtPmRyaXZlci0+ZXZpY3RfZmxhZ3MoYm8sICZwbGFjZW1lbnQpOwo+ICAKPiAtCWlmICghcGxh
Y2VtZW50Lm51bV9wbGFjZW1lbnQgJiYgIXBsYWNlbWVudC5udW1fYnVzeV9wbGFjZW1lbnQpCj4g
LQkJcmV0dXJuIHR0bV9ib19waXBlbGluZV9ndXR0aW5nKGJvKTsKPiArCWlmICghcGxhY2VtZW50
Lm51bV9wbGFjZW1lbnQgJiYgIXBsYWNlbWVudC5udW1fYnVzeV9wbGFjZW1lbnQpIHsKPiArCQl0
dG1fYm9fd2FpdChibywgZmFsc2UsIGZhbHNlKTsKPiArCj4gKwkJdHRtX3R0X2Rlc3Ryb3koYm8t
PnR0bSk7Cj4gKwo+ICsJCW1lbXNldCgmYm8tPm1lbSwgMCwgc2l6ZW9mKGJvLT5tZW0pKTsKPiAr
CQliby0+bWVtLm1lbV90eXBlID0gVFRNX1BMX1NZU1RFTTsKPiArCQliby0+dHRtID0gTlVMTDsK
PiArCQlyZXR1cm4gMDsKPiArCX0KPiAgCj4gIAlldmljdF9tZW0gPSBiby0+bWVtOwo+ICAJZXZp
Y3RfbWVtLm1tX25vZGUgPSBOVUxMOwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK

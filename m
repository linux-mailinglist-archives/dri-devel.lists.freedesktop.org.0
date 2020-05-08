Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DBF1CA5D4
	for <lists+dri-devel@lfdr.de>; Fri,  8 May 2020 10:17:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26BDC6E084;
	Fri,  8 May 2020 08:17:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2074.outbound.protection.outlook.com [40.107.236.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2B756E084;
 Fri,  8 May 2020 08:16:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hQsxZ+87XV0Q9aFufPA1uWEw5+8s8Cai5sUpyOUnuXHlCnT2Es1zBTJVfXvbm1dY9+IxZ3oYlQgwgzGBYNd5FvFijbZX8HYmy+56ndXbsh+N6WQKw2nAPmVsGU5P97GxxwIq1nGs/LAoH3yQet0/qFefYjbuzeB7+/WoakLdJ2hps3pFzAzSbf4z4px9Cs3oJbHv1yROqdfkAq6iOvatVBSWlV8wRbT97dBNWh3LTkNCPRiGxA1iFC2vkDTiNJwdZM9zaan4Eg3MzOm90yfNDJjwZeWUeQe5YVExiVrwN2dP2InSC+2hRmWwLL4wSTnq/afeTKrC/I1tE4RIAF7DIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JRwelLAfsLPguh231FuS5UuplaGfa2SKc5kTuy3P/4w=;
 b=k64MdyagwTCDo7uPS1yAHZjnbgunfPFnt4DyJ73iPk9u9Lc03XzU37BSI5ffxZAcpagfkJN6sKC3uhJazybBW8MiHnruznnFz3wIdnM+ZONDd8r9n2WiRdCUNKHYTu8JfO9403/uV9LA43Dwhei/zTisB7n56+iZGpWPkWIfqUOFSGuq/u7S5mhaG2KO2c87qhlBmu9AUACiaHjnr7RcFBv9aB2K7yYMKLEAGBEfaWyS5GxKG0uEm5eXMmFl+INnJ+ttDhc0RRW2/LRdQP7olAPS9qLsyI72BEhytnUO8oahv1/yd1jaQJLwuik3DPlOcfHFeZW5a8eyZQagzriuZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JRwelLAfsLPguh231FuS5UuplaGfa2SKc5kTuy3P/4w=;
 b=RieMolF2WmZiGDWNGWKVS74kHPpnK5an01sqFqhIHa7iFPnG2a/KnjzQS5QrGv/wWN/ZFDdUr8qnvtsHwZ3hIEE0YZTFNmWn6b1vCFPqAk+yEk8UfWbcTH38GLtJiNRdLiQKujJuGNz43oLqm1XaM8x2QGaAvX/cLwQRTjkOpA4=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4401.namprd12.prod.outlook.com (2603:10b6:5:2a9::15)
 by DM6PR12MB3177.namprd12.prod.outlook.com (2603:10b6:5:187::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20; Fri, 8 May
 2020 08:16:56 +0000
Received: from DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766]) by DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766%3]) with mapi id 15.20.2979.033; Fri, 8 May 2020
 08:16:55 +0000
Subject: Re: [PATCH 06/36] drm/amdgpu: use the unlocked drm_gem_object_put
To: Sam Ravnborg <sam@ravnborg.org>, Emil Velikov <emil.l.velikov@gmail.com>
References: <20200507150822.114464-1-emil.l.velikov@gmail.com>
 <20200507150822.114464-7-emil.l.velikov@gmail.com>
 <20200507180310.GC13247@ravnborg.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <d79cd110-27d3-3df9-00b2-b1cad5924454@amd.com>
Date: Fri, 8 May 2020 10:16:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20200507180310.GC13247@ravnborg.org>
Content-Language: en-US
X-ClientProxiedBy: AM0P190CA0010.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::20) To DM6PR12MB4401.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0P190CA0010.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.29 via Frontend Transport; Fri, 8 May 2020 08:16:54 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2de3fdb8-3a46-4c1e-84d9-08d7f3282bd1
X-MS-TrafficTypeDiagnostic: DM6PR12MB3177:|DM6PR12MB3177:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB3177E4D34EDFF1E29E400D7483A20@DM6PR12MB3177.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-Forefront-PRVS: 039735BC4E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vP3/moChYV43GzAmv+TMUXDm58iGG4vl6euztmIUGVdL4/+MCEJkHH5Sa0afWMYm5/W1YxOHz/cCTZGf1hjCiA8csZvBiZqOjarwS8YcbVSDZfxZpwcBxRyJzQNe3XWQdka9G5gjwEgUU8luHeQmlBb0hZeeDOB4vFBiFRbvOs2/CF4I1AmL56ToRRJNrRLCHHhKYpNT2JLC8O9UEAIe5ADnBsUZ69OzFJ2iXtbSFyfEY5n8jZnyLhw45ge2DVS38BDxaIDPP/v7yyv6eaafH6SlymKjOAALjJYXLfkQ+Xq27gBXmaSmuf8AAXKyX2trYgU7o+zIw4dyWXjxaxrLSwDTM+Eem+xKTola1KBcf2ndzWI5hcydKMamW6w/aQJ8sUsb61qoWQbKvQNDaPHwARTwr24KkLRwBYkzz/L5Wjf6I5hXdpIIQThhvdGRXS65fu5mWnnptnVZ26yHI5dV/Ze8B0c+/iyUw0wBzps40CNytgXck/qds7enetLxFzDtr1WC4SdDPeZ6RMLkwGO5/gH3aH0TQPWuM8gRk3Ks3ByJqhPLzMaLaDgqzoFJwbmYMuIAoiY2NCTxR8dlaRszFZ8Ecw+hr8mNQ6SoXJA+9b8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4401.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(376002)(346002)(366004)(396003)(136003)(33430700001)(6666004)(110136005)(2906002)(16526019)(316002)(52116002)(186003)(31686004)(66946007)(66556008)(66476007)(8936002)(8676002)(45080400002)(4326008)(36756003)(31696002)(66574014)(966005)(2616005)(86362001)(83300400001)(83310400001)(83290400001)(478600001)(83320400001)(83280400001)(33440700001)(6486002)(5660300002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: Jh3Tqdgm4sIRtZhvo32GygnceVSP9SR/+fz9P1CJXvnSc+MljVutXIsIQdDrdEZi+KpYTiWPGH83DY0/WJAv++3/7IMgSEKiI2IaqAhRshjOilRGhGx8c2FuVnx2d9k8wogpLLCsrSqaHQMf8Nwq2kryee7Mlyi38Dr10rFDO2PGsQ5cYm0XN6u0hckTVZ1XinwUZsjtVz6sJAGPSdqcOYqoxCYwqX3CzUPDprm+sJNildEKuFAgY0dKAxVvZqocqIbxkLhUt3Fn6OkTLC7VWEXzIX6BEyx02rjw3l6qRUGVehCyAqWDry2eFpHqLsRjYGUTYiE5xlNJytpuF90i5RUjqDe78aQ8HIoSnmTQ3Aa+YQx0kM+d4kyfVYDLUf42HFg6a1tvVqyBcuh1TmbJFUepblndWEnmllR2fxuJILX4hvX9FLJdwGONl54v0QlSOVT4FVphaMfLgu6muAKS0HglNJW0SM3iz5jWir0wpHCY6K0crxWqMuDy1x8MouZntJKtnAj4NqHDvT5LRgJ+Kz6VH9IW0Ri2GaWnELLc8hEI4jndRwGobv9D0/wDMqY3
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2de3fdb8-3a46-4c1e-84d9-08d7f3282bd1
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2020 08:16:55.7897 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h2HtJe10+XIQzCGylaoO9eXuf3jqs+PBetiN5/9B3E9W2bbaJXBTOGW95jaI0abd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3177
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
Cc: Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDcuMDUuMjAgdW0gMjA6MDMgc2NocmllYiBTYW0gUmF2bmJvcmc6Cj4gSGkgRW1pbC4KPgo+
IE9uIFRodSwgTWF5IDA3LCAyMDIwIGF0IDA0OjA3OjUyUE0gKzAxMDAsIEVtaWwgVmVsaWtvdiB3
cm90ZToKPj4gRnJvbTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4K
Pj4KPj4gVGhlIGRyaXZlciBkb2VzIG5vdCBob2xkIHN0cnVjdF9tdXRleCwgdGh1cyB1c2luZyB0
aGUgbG9ja2VkIHZlcnNpb24gb2YKPj4gdGhlIGhlbHBlciBpcyBpbmNvcnJlY3QuCj4+Cj4+IENj
OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cj4+IENjOiBDaHJpc3Rp
YW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4+IENjOiBhbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwo+PiBGaXhlczogYTM5NDE0NzE2Y2EwICgiZHJtL2FtZGdwdTogYWRk
IGluZGVwZW5kZW50IERNQS1idWYgaW1wb3J0IHY5Iik6Cj4+IFNpZ25lZC1vZmYtYnk6IEVtaWwg
VmVsaWtvdiA8ZW1pbC5sLnZlbGlrb3ZAZ21haWwuY29tPgo+PiAtLS0KPj4gICBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZG1hX2J1Zi5jIHwgMiArLQo+PiAgIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RtYV9idWYuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9kbWFfYnVmLmMKPj4gaW5kZXggNDNkOGVkN2RiZDAwLi42NTJj
NTdhM2I4NDcgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9kbWFfYnVmLmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rt
YV9idWYuYwo+PiBAQCAtNTg3LDcgKzU4Nyw3IEBAIHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqYW1k
Z3B1X2dlbV9wcmltZV9pbXBvcnQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwKPj4gICAJYXR0YWNo
ID0gZG1hX2J1Zl9keW5hbWljX2F0dGFjaChkbWFfYnVmLCBkZXYtPmRldiwKPj4gICAJCQkJCSZh
bWRncHVfZG1hX2J1Zl9hdHRhY2hfb3BzLCBvYmopOwo+PiAgIAlpZiAoSVNfRVJSKGF0dGFjaCkp
IHsKPj4gLQkJZHJtX2dlbV9vYmplY3RfcHV0KG9iaik7Cj4+ICsJCWRybV9nZW1fb2JqZWN0X3B1
dF91bmxvY2tlZChvYmopOwo+PiAgIAkJcmV0dXJuIEVSUl9DQVNUKGF0dGFjaCk7Cj4+ICAgCX0K
PiBMaWtld2lzZSBwcmV2aW91cyBwYXRjaC4KPiBEcm9wIHRoaXMgYXMgdGhlIHBhdGNoIGlzIGNv
cnJlY3QgYWZ0ZXIgdGhlIHJlbmFtZSBhIGZldyBwYXRoY2VzIGxhdGVyLgoKV2VsbCB0aGlzIGlz
IGEgYnVnIGZpeCBpbiB0aGUgZXJyb3IgcGF0aCBhbmQgc2hvdWxkIHByb2JhYmx5IGJlIGJhY2sg
CnBvcnRlZCwgc28gaGF2aW5nIGEgc2VwYXJhdGUgcGF0Y2ggaXMgY2VydGFpbmx5IGEgZ29vZCBp
ZGVhLgoKQ2hyaXN0aWFuLgoKPgo+IAlTYW0KPgo+PiAgIAo+PiAtLSAKPj4gMi4yNS4xCj4+Cj4+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IGRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKPj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+PiBo
dHRwczovL25hbTExLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMl
M0ElMkYlMkZsaXN0cy5mcmVlZGVza3RvcC5vcmclMkZtYWlsbWFuJTJGbGlzdGluZm8lMkZkcmkt
ZGV2ZWwmYW1wO2RhdGE9MDIlN0MwMSU3Q2NocmlzdGlhbi5rb2VuaWclNDBhbWQuY29tJTdDNDEw
MzZiZDdhYjgwNGQ4YmViZGYwOGQ3ZjJiMGU5MzglN0MzZGQ4OTYxZmU0ODg0ZTYwOGUxMWE4MmQ5
OTRlMTgzZCU3QzAlN0MwJTdDNjM3MjQ0NzEzOTg5NTcxMTY1JmFtcDtzZGF0YT1kMEx5c01ObXNj
JTJCU3pTa1lzWkRtRTQzYXpVMG5tQWIlMkIxdEZIbiUyQk1OeERnJTNEJmFtcDtyZXNlcnZlZD0w
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

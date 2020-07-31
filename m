Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E862346FD
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 15:34:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58E7C6EAB3;
	Fri, 31 Jul 2020 13:33:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2052.outbound.protection.outlook.com [40.107.237.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11B016EAB3
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 13:33:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I58wSNJU26mLe/8sgEd09PCPW0IpJ8AWY3E/mxBFpDZRYDVqg53DfgeVIFLQZwvEmOfUdLG01tIjjoG89D8v+sRtDSEJrpIBnEEO5Iek1IzBOZoe9KjouVuCkJ57PIPhVcjC295YXGxqc/LeBmgT2yaKXddROLM45C0idgM2RiqbJIG0B4JLVUneXKd4yFp7fUuhcEN5OY6YoH2nYyTq+lXKWIbs6uwlTKIg/Ep6b7rmJ5ht4XNC+7RGxjDrlYOuigmC3y+3iDG0iIRy+gvcb1P0PmNllphP2HDVDvzcPG3pBlbMkbqHcADklx9GmfPNxGePWa57LQbLVLicvYaptQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bTbqAs2zeNK3enPbfSgtZMhPOJECsNY7FGFqIYAIsMM=;
 b=FKZzphGlv4jzY3RvpDRk23F7/pQ/QNoUZJjnHoBtSwE3biMd9uFyejhoc0n+ceZU4EK2UO/RgSHkRensxTsxsTMBzDSCdIof3LLU0hDgReV8xLlOIhgAGqb/u+VIxrlv7Cgva8x3EzWRB1RPu2vbd9o6JCmtXP67XGCOKSIaN32dYsefqcbP/JwH4wNjzLn86XnFVz0BBT5adhykRBwldybl/UB/45d4IrgDxUkgUDQ6YCcHTnQdyMS5VXtU0KhraHeDPjgkercyN0Z0ImYPK4Wf4eK1p5MjF6Ft8Y0+gDqTZMNQ5sxpwIcRR8cG41Xy0PCA6MMFX0C/mnJ8cYVndw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bTbqAs2zeNK3enPbfSgtZMhPOJECsNY7FGFqIYAIsMM=;
 b=3VRz3Sb8TaAQGWkNLqS1c7TE+8ijP8qbw19pJQX+rqBTab8zTyuQj/dzMF9wUDGFzVOtmBOM7rrDlNR7eGZ/zzvuEvac6jTclQrJi/gBuDQULxeL9zWmxdWdsq0L2Jk2ZA59hFNcbhogMGxtF2EeGsRK0O8HkXNbrXlZ1FVHhcw=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4335.namprd12.prod.outlook.com (2603:10b6:208:1d4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.20; Fri, 31 Jul
 2020 13:33:55 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3239.020; Fri, 31 Jul 2020
 13:33:55 +0000
Subject: Re: [PATCH 44/49] drm/ttm: drop priv pointer in memory manager
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200731040520.3701599-1-airlied@gmail.com>
 <20200731040520.3701599-45-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <b2f16029-09d1-1fba-2ba0-e92a614f1a03@amd.com>
Date: Fri, 31 Jul 2020 15:33:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200731040520.3701599-45-airlied@gmail.com>
Content-Language: en-US
X-ClientProxiedBy: AM4PR0202CA0014.eurprd02.prod.outlook.com
 (2603:10a6:200:89::24) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4PR0202CA0014.eurprd02.prod.outlook.com (2603:10a6:200:89::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17 via Frontend
 Transport; Fri, 31 Jul 2020 13:33:53 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c5800d53-f106-4673-ea75-08d835565ec4
X-MS-TrafficTypeDiagnostic: MN2PR12MB4335:
X-Microsoft-Antispam-PRVS: <MN2PR12MB433588DFA9FC0967F8A46AD8834E0@MN2PR12MB4335.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yOhpfquMqyN2qGk/gp2D1bS5mljPKvNl+vpEVQphl3jrtpPx0ClgXea5aMDOmXHzAF2Mxfqtd3TeB9X+5f3gmLT8Hfo83K/W2yENEgw7qYNfjKne5leZHwSyB4N/RU0vgZ10NJcIeDXacM5EL+X7xTgvzLx5rJ+t9H9gLhMJoHmgbwqtUbcTzAPgUjQFOU9EGhZO+TYrVly83E12JXxxPAgErvfThMwt0bEbXEqqYYWS2HnMrd6qMj3HaIUsZ0HxORnQmUqRr48InYk2BasZ92Oa8EoFTFByLvdVTMA3rISLlEiaByPAQksoR4/EAZDSBh0hGO6ft5O/284Wz6v5/XdJKnTXuM5CwfQTQ3zIoIw4g6TICVY2cy7fX2ffL5F4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(136003)(366004)(376002)(346002)(39860400002)(52116002)(186003)(16526019)(5660300002)(31686004)(316002)(6486002)(4326008)(8676002)(6666004)(8936002)(66574015)(66946007)(2906002)(83380400001)(478600001)(66476007)(66556008)(31696002)(36756003)(86362001)(2616005)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: /zAQ4YyNPVYyEaJ/Qy4MGa0qe2khY7IS3OxFaRhMMXjW0ma1uTD8xcJKK+ERZkL93ZZf7C1igi67IJLL13IPhOY0CfdMkA4juVrVBVxFaXsAtmhQOCAknZICGkzBoEI270/FvdPBCZQ0rlNfUyB8ZE64YkQUl7u3NGBH5BaKGVRj7njkI3Mq6F2NBDygUNVW9xK/1KhYQTfzM7iXYrGUZTkMQCWbFn9Y0rGJ+Rux+qtnJYsHnI4s3hOWMaG2f0nGoCRpCfiVBjLcxVwCEuLFJnlUP6v0samBBu5j7H65R4Lf/gQx27UjuIRytgZPmItKkhmfRHXQcHXDDSDv6+nCJX4GdwCJxiGOF5A2EMnG/Tje2XNCg04Qgw+UBcHrJWjA0bGu4VrA55jWnD8yQXfzv7+BDeLHGlUZ6BKIekW7Tbav61YIZ2BmDFSQKP0fgC1Aglk5BYYrtJBEFgQkD1C4O0LJ9ykwLyuLYJHH7XcarGIUd8UZHYDaSKXWKJD3zay4GjnEd9RnSw5JoD7lFQTC6QYzY7o7Kj3biuNLiU+PRicfdV8Q3lzb3ga17mEShl+QhaQnmBJ3LZIomSsnHQpQo2Yo528dl45pwAQmk0o23nLmnYu4z/j3HLGVmJEHrhiy+AdGHCGKzOPD/Dn2nkp77Y6lyV8m0p1HbW5MDLk64VohfNxGP/n0xvHyJmvhcwc7+wIUgmEJcJ4AOJzAzfO4gw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5800d53-f106-4673-ea75-08d835565ec4
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2020 13:33:55.2384 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nsiLhVLAMxgR1z+QjXMfp0nzZ8ojLmkETSQTGJZqW65AG7fBsPf+gIygvMRDhOd5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4335
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
Cc: sroland@vmware.com, bskeggs@redhat.com, kraxel@redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMzEuMDcuMjAgdW0gMDY6MDUgc2NocmllYiBEYXZlIEFpcmxpZToKPiBGcm9tOiBEYXZlIEFp
cmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+Cj4gVGhpcyBpc24ndCBuZWVkZWQgYW55bW9yZSBi
eSBhbnkgZHJpdmVycy4KPgo+IFNpZ25lZC1vZmYtYnk6IERhdmUgQWlybGllIDxhaXJsaWVkQHJl
ZGhhdC5jb20+CgpSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5p
Z0BhbWQuY29tPgoKPiAtLS0KPiAgIGluY2x1ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVyLmggfCAy
IC0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9p
bmNsdWRlL2RybS90dG0vdHRtX2JvX2RyaXZlci5oIGIvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19k
cml2ZXIuaAo+IGluZGV4IDYzMTlkODVkNzI3MC4uYTM4NzA0ZmUwNzM3IDEwMDY0NAo+IC0tLSBh
L2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVyLmgKPiArKysgYi9pbmNsdWRlL2RybS90dG0v
dHRtX2JvX2RyaXZlci5oCj4gQEAgLTEyMyw3ICsxMjMsNiBAQCBzdHJ1Y3QgdHRtX21lbV90eXBl
X21hbmFnZXJfZnVuYyB7Cj4gICAgKiBAZGVmYXVsdF9jYWNoaW5nOiBUaGUgZGVmYXVsdCBjYWNo
aW5nIHBvbGljeSB1c2VkIGZvciBhIGJ1ZmZlciBvYmplY3QKPiAgICAqIHBsYWNlZCBpbiB0aGlz
IG1lbW9yeSB0eXBlIGlmIHRoZSB1c2VyIGRvZXNuJ3QgcHJvdmlkZSBvbmUuCj4gICAgKiBAZnVu
Yzogc3RydWN0dXJlIHBvaW50ZXIgaW1wbGVtZW50aW5nIHRoZSByYW5nZSBtYW5hZ2VyLiBTZWUg
YWJvdmUKPiAtICogQHByaXY6IERyaXZlciBwcml2YXRlIGNsb3N1cmUgZm9yIEBmdW5jLgo+ICAg
ICogQGlvX3Jlc2VydmVfbXV0ZXg6IE11dGV4IG9wdGlvbmFsbHkgcHJvdGVjdGluZyBzaGFyZWQg
aW9fcmVzZXJ2ZSBzdHJ1Y3R1cmVzCj4gICAgKiBAdXNlX2lvX3Jlc2VydmVfbHJ1OiBVc2UgYW4g
bHJ1IGxpc3QgdG8gdHJ5IHRvIHVucmVzZXJ2ZSBpb19tZW1fcmVnaW9ucwo+ICAgICogcmVzZXJ2
ZWQgYnkgdGhlIFRUTSB2bSBzeXN0ZW0uCj4gQEAgLTE1Miw3ICsxNTEsNiBAQCBzdHJ1Y3QgdHRt
X21lbV90eXBlX21hbmFnZXIgewo+ICAgCXVpbnQzMl90IGF2YWlsYWJsZV9jYWNoaW5nOwo+ICAg
CXVpbnQzMl90IGRlZmF1bHRfY2FjaGluZzsKPiAgIAljb25zdCBzdHJ1Y3QgdHRtX21lbV90eXBl
X21hbmFnZXJfZnVuYyAqZnVuYzsKPiAtCXZvaWQgKnByaXY7Cj4gICAJc3RydWN0IG11dGV4IGlv
X3Jlc2VydmVfbXV0ZXg7Cj4gICAJYm9vbCB1c2VfaW9fcmVzZXJ2ZV9scnU7Cj4gICAJc3Bpbmxv
Y2tfdCBtb3ZlX2xvY2s7CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK

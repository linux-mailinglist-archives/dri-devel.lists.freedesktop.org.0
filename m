Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E368A23B98B
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 13:30:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18DB96E457;
	Tue,  4 Aug 2020 11:30:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2078.outbound.protection.outlook.com [40.107.220.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6CBF6E457
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 11:30:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UsbpfA5dlw06N7RQkeWvRCvPwKrgg8+VipVdFcHA0HNvHw8Kl1wsJQRQPB2u63bK9rhLGAktoMIoGAgWu7qpr0/qazaUyUyLVSfBnQGMTgmLz4+HDKa9Z0ZGr+dXZd+/s2zjtV1ppDX8KZUs7I/9eKUy08d0L8QODRhNTPa40EObfpL+Rq1ZqXZ5kTd7Fn1bAIXr5wEkc+gITvibvRoD0MLgMibjps01k/ePDd6gIFGyEFxeWDdfBtqhXgyARXyHRJd/gKnbsqBDDYGOaOip3PmEhuLxviMgN0ShhUtzxUzZaRJLTQc3jVwsBEdTG5iXHGpW5z+QISMjqmxYieryeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e9B2gtfPBtUNgggiZmafBuOBt2yBMiphYPG89mx2Na4=;
 b=Dcs5mIa5699ZGp47R+rlVGBHNhGYmWBd5kI5hREfd0SNdGU1R4QTevRQUlfGgHbN9Eo5jDX2cm8Ksex4CS2QUBjeqeTztc6NQrSaneZuOyahEtuFQjFGI/RcMz3y7tqg+9byTBPjQgLqXQJBPGbECuz890l26vzrZaLYMk/gJpJ2728d51Ml6u1eMAp7mpATfwAzZaYsEBVOpEpkG/OvWZmq5ZZL28aGASWgAIy+HHPzMgs97j0Ve32pt9c/92mYSn2L6s0B0iFj5a+KdMl0nm3Zc6bwgEXQbGJRu0QdOb5XcRGiDDECj4CKWBoW6I1RXwpN4VeAaVLtzBQO2jet8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e9B2gtfPBtUNgggiZmafBuOBt2yBMiphYPG89mx2Na4=;
 b=JIqAmR9m6bBY3Xxw2AeGlDrCbnj0/tWMyLIMtQ7Bx5bHGI9YkX+t+GGd8Bv9wZgFiRHn7fNM6kHZ+9eMxUoHpT0EUDTgW3Li3LyeQB/5WHhpu1ehjIwjmyfQgvjRjTvTZImeBVM/bkcish6yjtAihQjt4LL1/8VcR+BQTK31kPo=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4142.namprd12.prod.outlook.com (2603:10b6:208:1dd::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16; Tue, 4 Aug
 2020 11:30:32 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3239.022; Tue, 4 Aug 2020
 11:30:32 +0000
Subject: Re: [PATCH 44/59] drm/ttm: allow drivers to provide their own manager
 subclasses
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200804025632.3868079-1-airlied@gmail.com>
 <20200804025632.3868079-45-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <ebca7bee-f1e7-caaf-f4ad-e9953af43e71@amd.com>
Date: Tue, 4 Aug 2020 13:30:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200804025632.3868079-45-airlied@gmail.com>
Content-Language: en-US
X-ClientProxiedBy: FR2P281CA0022.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::9) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 FR2P281CA0022.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:14::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.13 via Frontend Transport; Tue, 4 Aug 2020 11:30:31 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: be276ab6-9a23-4c62-4d5f-08d83869cc2b
X-MS-TrafficTypeDiagnostic: MN2PR12MB4142:
X-Microsoft-Antispam-PRVS: <MN2PR12MB414296D821B6A65283A83DBA834A0@MN2PR12MB4142.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:390;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X8osqB3Rys1LeSfct1ZyCjYV5daKlghT2D9me4ZPYEBvjWD7iMQWjAIitwoMsrRNuLgwa+xaQk9cTe2nWMdMfsCn2Od6ph1FW3a1LBYyVJad/Y1cYNx7/gtT2K18F97LwaQXz3z29YUF8cbMl61gOXbpxC5Rdg285kxPkS/vLoQwQouMAcOL5W+hKys1RTs5UqbkStLGBnEsczs4KVoKm/ct34ZqgQQNx/wiaI97ZSjeA7n0Ut5508fy4y8525gpJ4rB73lPji7zvahWiGFc0/vp9d/P2MfTO41+Eb6K0yRsqwkIu3C6k1CiaFXIWYf05hwb8/W1ax4On6B4Q2HEY21pv8RpK8DuP1MManfCtB8pajKzrnyx9uclIue3/UHZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(136003)(376002)(366004)(39860400002)(346002)(2906002)(2616005)(83380400001)(6486002)(36756003)(31686004)(316002)(6666004)(66574015)(16526019)(186003)(66946007)(4326008)(8676002)(31696002)(86362001)(478600001)(5660300002)(52116002)(8936002)(66556008)(66476007)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 3+MRAE5ZRR1qeuVNyr+6DQOlsBuLxNrZ1QKmXiMsDv4fneaCTAROEi23sTEz6pT9G528KpJs9v9Pw+p+yOAbE+/JEDi77r75ec05lOBr1VkRO05VkTbRxF64lNE2pCk1hRj6H0QPEgdXZCg35ThgO0rQ1fquCjGtFPlPsv66Igr66gC6ULfYlf8CHq7KLC89lFndGKgweVtQUkseO8MIKfE7W57eCFEN0JoYReTQ5fEvw80H1f//37YZ8pxq+88zLnw/cGkLIYMCl2uzDzGDXyp4vmuZYCY+JwLUc8oHreR5RxLgfAcRE2yb3iXfkR1Kmlz9v95hG2J2vpCiqaPdf48WJshXmC4jAPFtiv5Sq/YtXXUfbhw3FPRsMwtqQYIqzUq7Eo1Fw9gCggqBolPM4JE2gp4mRVJu+NHAV9nLe7hikx1c9jvNcmgjTVkRRLGxWTzJkU9yDzB2uFtI48eIJvaRdtu++udgo/X7/g9YijcpyvXMWZpf5AG/6bh12ksuON/gYGB6yZCM7igBZ99ZJiBofOkf+mYgAia3z/Q5JF+W07cD9hZfes2Dy6ETBRCbgs4uhmSJRIKcRv/1vUDo0iG9OuV+SM9YT1w7MAKyRHV0N81XLSU9bSopehPlP9dgI5cIdT+OEfPNnItjJdzJz6BuDaieknfKb6kiDVzLvTfTVlx/2HO+gGzcXpNksiJ2OFtuYckOI9PvVGb/OiNq/A==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be276ab6-9a23-4c62-4d5f-08d83869cc2b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2020 11:30:32.4274 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jr8+NYEp7Ty5c0dJAr2/8EzeVPjusrLLvaiAU6PI5uQ3eTszYSOVOAZ3lrekRCDd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4142
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
Cc: sroland@vmware.com, linux-graphics-maintainer@vmware.com,
 bskeggs@redhat.com, kraxel@redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDQuMDguMjAgdW0gMDQ6NTYgc2NocmllYiBEYXZlIEFpcmxpZToKPiBGcm9tOiBEYXZlIEFp
cmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+Cj4gVGhpcyB3aWxsIGdldCByZW1vdmVkIGV2ZW50
dWFsbHkgYW5kIGFsbCBkcml2ZXJzIHdpbGwgdXNlIHRoaXMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBE
YXZlIEFpcmxpZSA8YWlybGllZEByZWRoYXQuY29tPgoKUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBL
w7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KCj4gLS0tCj4gICBpbmNsdWRlL2RybS90
dG0vdHRtX2JvX2RyaXZlci5oIHwgMTEgKysrKysrKysrKy0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAx
MCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9k
cm0vdHRtL3R0bV9ib19kcml2ZXIuaCBiL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVyLmgK
PiBpbmRleCAwM2IyNTNkMTRlNmEuLjY5NDBkODVhNTMxYSAxMDA2NDQKPiAtLS0gYS9pbmNsdWRl
L2RybS90dG0vdHRtX2JvX2RyaXZlci5oCj4gKysrIGIvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19k
cml2ZXIuaAo+IEBAIC00MTksNyArNDE5LDcgQEAgc3RydWN0IHR0bV9ib19kZXZpY2Ugewo+ICAg
CSAqIGFjY2VzcyB2aWEgdHRtX21hbmFnZXJfdHlwZS4KPiAgIAkgKi8KPiAgIAlzdHJ1Y3QgdHRt
X21lbV90eXBlX21hbmFnZXIgbWFuX3ByaXZbVFRNX05VTV9NRU1fVFlQRVNdOwo+IC0KPiArCXN0
cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdlciAqbWFuX2RydltUVE1fTlVNX01FTV9UWVBFU107Cj4g
ICAJLyoKPiAgIAkgKiBQcm90ZWN0ZWQgYnkgaW50ZXJuYWwgbG9ja3MuCj4gICAJICovCj4gQEAg
LTQ1MCw5ICs0NTAsMTggQEAgc3RydWN0IHR0bV9ib19kZXZpY2Ugewo+ICAgc3RhdGljIGlubGlu
ZSBzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXIgKnR0bV9tYW5hZ2VyX3R5cGUoc3RydWN0IHR0
bV9ib19kZXZpY2UgKmJkZXYsCj4gICAJCQkJCQkJICAgIGludCBtZW1fdHlwZSkKPiAgIHsKPiAr
CWlmIChiZGV2LT5tYW5fZHJ2W21lbV90eXBlXSkKPiArCQlyZXR1cm4gYmRldi0+bWFuX2Rydltt
ZW1fdHlwZV07Cj4gICAJcmV0dXJuICZiZGV2LT5tYW5fcHJpdlttZW1fdHlwZV07Cj4gICB9Cj4g
ICAKPiArc3RhdGljIGlubGluZSB2b2lkIHR0bV9zZXRfZHJpdmVyX21hbmFnZXIoc3RydWN0IHR0
bV9ib19kZXZpY2UgKmJkZXYsCj4gKwkJCQkJICBpbnQgdHlwZSwKPiArCQkJCQkgIHN0cnVjdCB0
dG1fbWVtX3R5cGVfbWFuYWdlciAqbWFuYWdlcikKPiArewo+ICsJYmRldi0+bWFuX2Rydlt0eXBl
XSA9IG1hbmFnZXI7Cj4gK30KPiArCj4gICAvKioKPiAgICAqIHN0cnVjdCB0dG1fbHJ1X2J1bGtf
bW92ZV9wb3MKPiAgICAqCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK

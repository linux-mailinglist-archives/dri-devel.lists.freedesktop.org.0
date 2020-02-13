Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EFED15BF4E
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2020 14:27:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5D306E2E1;
	Thu, 13 Feb 2020 13:27:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20605.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::605])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E95A46E2DF
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 13:27:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cgq6TgJImM6056ErBOI+MEp0td54eGsdnNJdwahtuxg2ty0eCRNVMOpXgr1wJCRy1UPxrqueC0DoQPrut3HG3BtVoJdIdfSb20vVzmxZN/67eNIkk1Bi0VQlcMFyHOHE7KiSEneej058qkUO/dJjYwj0yK2SxYuCALjNqCEaBUgB5IR/ewBUJ+Otv6A9ZXhbHN6eYqqW9YK3qL5v0NLithcO4aSC7W7GqefL+hFtSxG5xNjzZXoYTaINIHVUGTUubvFTcz2UbKzfQypg2ULowex+qTUijimWpQbLTk8tOAQoKjylwZq0QV+fAwW74DY+omUT4efIQIjhWnFcv8NHgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Rg1igDohsT9S8JYXKxKuaJ23Zg0ljiTToovC+9gcQk=;
 b=fL55dp3qoPV3bp7Jt0z4XQywO8veuurwyAtToK9YuUbqLCUs2e4r2R+L0IIWC9B5zBlUdP/tJmNd5J5fTITUOPrzm1Sv9tSCWd5Z0QhcgT4g3Woy/CVarziAli0onFeXtREX7bRO/gKwuVjK1dF/PazjreSccEQBWaU9QwzOxNh4N5jCMmTID5aZoebh/Z2nPQF2VFaC+F3iZ9FnKKDuaJorr7MnowCizuaoYPmZJNT0QoLcmbZpvkVavLj2VOjo2G0SwgHM65p40EkmxJgf796LYchA9KwJKhDq+YCqdfKwZ3Ur6OzadtomKPAETKUsAOMW90LKHrD0Sz+AVqomwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Rg1igDohsT9S8JYXKxKuaJ23Zg0ljiTToovC+9gcQk=;
 b=JELRPo+14PKI5hbHV5/vR3+mIj59MdFoJLgwB5G5fYPU8YQZ3KiaoJa5Kv4ckb81jhBSYO8aFo3Yw5K9oZq7RqvuajPH0WEE+w4UoQkIniUYpeCvxQ4bB+WuNk+T8DTuXmCiRBfpOs6fCmczt4eN2hzDSFLGKoaoiYk5HNpWdrw=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Nirmoy.Das@amd.com; 
Received: from DM5PR12MB2376.namprd12.prod.outlook.com (52.132.143.139) by
 DM5PR12MB2437.namprd12.prod.outlook.com (52.132.208.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.22; Thu, 13 Feb 2020 13:25:38 +0000
Received: from DM5PR12MB2376.namprd12.prod.outlook.com
 ([fe80::c06c:24da:d4c5:5ee3]) by DM5PR12MB2376.namprd12.prod.outlook.com
 ([fe80::c06c:24da:d4c5:5ee3%6]) with mapi id 15.20.2729.024; Thu, 13 Feb 2020
 13:25:38 +0000
Subject: Re: [RFC PATCH 2/6] drm/radeon: don't use ttm bo->offset
To: christian.koenig@amd.com
References: <20200213120203.29368-1-nirmoy.das@amd.com>
 <20200213120203.29368-3-nirmoy.das@amd.com>
 <21dc2b96-fd7d-19e4-bda6-ebdae2051435@amd.com>
 <bacde18d-3db6-8752-a4ba-2fddf0e406a0@amd.com>
 <10d62138-bb51-155e-ac57-0f23c9c2943e@gmail.com>
From: Nirmoy <nirmodas@amd.com>
Message-ID: <70b9b568-92f3-a257-4011-3a68f3b31a6c@amd.com>
Date: Thu, 13 Feb 2020 14:28:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
In-Reply-To: <10d62138-bb51-155e-ac57-0f23c9c2943e@gmail.com>
Content-Language: en-US
X-ClientProxiedBy: BN6PR04CA0065.namprd04.prod.outlook.com
 (2603:10b6:404:8d::15) To DM5PR12MB2376.namprd12.prod.outlook.com
 (2603:10b6:4:b9::11)
MIME-Version: 1.0
Received: from [IPv6:2003:c5:8f2a:5e00:4db9:9f42:976e:8a13]
 (2003:c5:8f2a:5e00:4db9:9f42:976e:8a13) by
 BN6PR04CA0065.namprd04.prod.outlook.com (2603:10b6:404:8d::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.22 via Frontend Transport; Thu, 13 Feb 2020 13:25:37 +0000
X-Originating-IP: [2003:c5:8f2a:5e00:4db9:9f42:976e:8a13]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0d8ec8e5-270d-4c26-a4cb-08d7b0883715
X-MS-TrafficTypeDiagnostic: DM5PR12MB2437:|DM5PR12MB2437:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB2437F769B6648264AD5B55608B1A0@DM5PR12MB2437.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 031257FE13
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(39850400004)(376002)(346002)(136003)(366004)(396003)(189003)(199004)(66574012)(31696002)(6486002)(31686004)(66946007)(6636002)(34206002)(66476007)(6666004)(66556008)(4326008)(36756003)(2616005)(2906002)(316002)(52116002)(37006003)(5660300002)(81156014)(81166006)(16526019)(966005)(186003)(478600001)(8936002)(53546011)(45080400002)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2437;
 H:DM5PR12MB2376.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nLT/QsLWx9OCM5BYyBeZ6oejvjIFJMj8qB6JRvB96I7UQNx8O8FV0BgfWvXi68avzJAz2JajM4Dkig3TM1fVMN86a2oJIK/9DMy81VkIOzOBVsB5RPIqJrdoXIHmd27SH7hjgCXIu+oCZyNkOqNR4K0qLyb7HSbhj0qA1ndILK3uGxb5zGoHjNF3x3Tvd0aDlwpWblsr0g2oz17AI7Z7a697fgv0nShxNF3RwNPWuv8qoxRgrcmWC/ZFZJ7Fl1qN73PYpKO1BodbI9uWNE8YEQ3Q9i5K1XRG/CqarzzdAnOZMCTGpw+SVClMY7mQaKJKU5MpAcXugF7ANSrO1Di6nKPZKAwvBXGG1Hd7OG1gm//okkLzBeFXsyBWxs+H/ZrNpNfO06sWHzFyj13yTQUe7AIYGc+lxOr81oPLcpGtnrQ4KFUKa5i4bUFhUJlyuc86k6WzpgxWd0MIiyMXxqNaWNCn1PTeZY6dPQ8AgG/BgQc0Dgfp+iR1RTIiQ5ZTEDNImfsHRQMKwz1dvIG8BLz+dA==
X-MS-Exchange-AntiSpam-MessageData: CkKoFkTBBWV5tWmg/f003//ezj42hauKkG7x/Di2eSJl81anb0dk1gpdTeubTh3hISjAMUiz1rdb0NEdr36ZFP5mb1Ehk/u/Vq8/AP27nB1gDFrRaSB4t12iMrGfe5zdm/QBUP/xWG9ngN7KSQ6u/nzQrrD14HH3DQBTFyreuIJPuL20CTKQCa0m3RH8hsWrUQvcS5xRhCqAOowDIis94w==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d8ec8e5-270d-4c26-a4cb-08d7b0883715
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2020 13:25:38.5259 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F1RZcRdagABnOZVVfkbHMYDNfzhRQqwzsQ7hyLO98ZlH/czayp5fgtaWb+o7DbhJqvsnASOEruzfzAMw4iCWXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2437
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

Ck9uIDIvMTMvMjAgMjowMCBQTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPiBBbSAxMy4wMi4y
MCB1bSAxMzozMSBzY2hyaWViIE5pcm1veToKPj4KPj4gT24gMi8xMy8yMCAxOjE4IFBNLCBDaHJp
c3RpYW4gS8O2bmlnIHdyb3RlOgo+Pj4gTG9va3MgbGlrZSBtb3N0IG9mIHRoZSBwYXRjaCBpcyBt
aXNzaW5nPwo+Pj4KPj4+IFdlIHNob3VsZCBoYXZlIHF1aXRlIGEgbnVtYmVyIG9mIHVzZXMgb2Yg
dGhlIEJPIG9mZnNldCBpbiByYWRlb24gb3IgCj4+PiBkbyBhbGwgb2YgdGhvc2UgZ28gdGhyb3Vn
aCByYWRlb25fYm9fZ3B1X29mZnNldD8KPj4gQ29tcGlsYXRpb24gd29ya2VkIHNvIEkgdGhpbmsg
YWxsIHRob3NlKGJvLT5vZmZzZXQpIGFjY2Vzc2VzIHdlbnQgCj4+IHRocm91Z2ggcmFkZW9uX2Jv
X2dwdV9vZmZzZXQuCj4KPiBDb29sLCB0aGFuIHRoYXQgaXMgYSBsb3QgZWFzaWVyIHRvIGltcGxl
bWVudCB0aGFuIEkgdGhvdWdodCBpdCB3b3VsZCBiZS4KPgo+IEkgYXNzdW1lIHlvdSBkb24ndCBo
YXZlIFJhZGVvbiBoYXJkd2FyZSBseWluZyBhcm91bmQgdG8gdGVzdCB0aGlzPwo+Cj4gSWYgeW91
IGNhbiB5b3UgZ2l2ZSBtZSBhIGJyYW5jaCBvbiB0aGUgQU1EIChvciBwdWJsaWMpIHNlcnZlcnMg
SSBjYW4gCj4gZ2l2ZSBpdCBhdCBsZWFzdCBhIHF1aWNrIHJvdW5kIG9mIHRlc3RpbmcuCgpodWgg
aXQgc2VlbXMgSSBoYXZlIHRvIHJlYmFzZSBpdCBhIGJpdCBmb3IgZHJtL2RybS1uZXh0IGFzIGl0
IGlzIGJhc2VkIApvbiBvdXIgaW50ZXJuYWwgYnJhbmNoIDovCgpZb3UgY2FuIGFjY2VzcyB0aGUg
YnJhbmNoIGF0IApodHRwOi8vZ2l0bGFiMS5hbWQuY29tL25pcm1vZGFzL2xpbnV4L3RyZWUvdHRt
X2NsZWFuLjEKCkkgd2lsbCByZWJhc2UgdGhpcyBmb3IgZHJtLW5leHQgaW4gbmV4dCB2ZXJzaW9u
IG9mIHRoZSBwYXRjaCBzZXJpZXMuCgo+Cj4gQ2hyaXN0aWFuLgo+Cj4+Pgo+Pj4gSWYgeWVzIHRo
ZW4gdGhlIGNoYW5nZSBpcyBtdWNoIHNtYWxsZXIgdGhhbiBJIHRob3VnaHQgaSBuZWVkcyB0byBi
ZS4KPj4+Cj4+PiBDaHJpc3RpYW4uCj4+Pgo+PiBSZWdhcmRzLAo+Pgo+PiBOaXJtb3kKPj4KPj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4gYW1kLWdm
eCBtYWlsaW5nIGxpc3QKPj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPj4gaHR0cHM6
Ly9uYW0xMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJG
JTJGbGlzdHMuZnJlZWRlc2t0b3Aub3JnJTJGbWFpbG1hbiUyRmxpc3RpbmZvJTJGYW1kLWdmeCZh
bXA7ZGF0YT0wMiU3QzAxJTdDTmlybW95LkRhcyU0MGFtZC5jb20lN0M2MGFhMTdjMDVhMmY0NzQ2
NjNmMDA4ZDdiMDg0YjU1MCU3QzNkZDg5NjFmZTQ4ODRlNjA4ZTExYTgyZDk5NGUxODNkJTdDMCU3
QzAlN0M2MzcxNzE5NTYzNDI3MjgzODkmYW1wO3NkYXRhPUkybjB5TVhLNUN0ckc1dFk5UTQ3aWd4
SnY5T25iJTJGQTdQQmVMd3JwUGI1NCUzRCZhbXA7cmVzZXJ2ZWQ9MCAKPj4KPgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

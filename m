Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 659672D5769
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 10:42:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F95F6E415;
	Thu, 10 Dec 2020 09:42:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2078.outbound.protection.outlook.com [40.107.223.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7F506E405;
 Thu, 10 Dec 2020 09:42:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ada6awMZavrBBgY8CSqRXyN3K8GDq8c2C1aaSZh77GX8C8iJIgfmdkEmZ52QThYnXrvC5eJlKdgqIXUbnzL06uBTaC0XF+X4lRJSLqNC1uaUWnl3pPN4XAUWy9eyn/HFlhoeXRCdcau8J7Obs502Y5x9KZwyD56ryUrleQzaYAQdXygtVDLvx5QaPY41v+VULC3ViPWq5D93EJd9MSHBwuqatdMMyIzKGVX7psIPYlVA2KBrd2z1191bz+AN6Na4P0hoqyFmHYyNnf+gRLTwGggl3RZ3+joAR63mGFSkI4+1LTZq78JDuab+wC2lTGy6WTTUiv2cN61cFUQA6sGbqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U5B5p7HEj0PcKXLyouOR7Pt9sYaQHiM3ia57AT2u5VY=;
 b=N9IGzap2/9RgZazONw9/YcUzmKg5XO/mAh521rclVi4fFgPmIuvndTBJroG1SZ/wDR9rv/cLw8yhOUFLnWFd4H4xpz3JvJKFhC8GybnUuvR7+oxc5A3gDG3VGUAnjivIJGyrAUqxAeYdhcsVJHIrpUexbi27JrB0eWAZ6ChNgUkNgh6587/E1kAwtMW+YNQlEofs4xyeccigGkyvtaRWx8xtT3TpYQWlWAS5fgyUXq1zV4WuHoClbCQ/1TrUgDL8gnW13GyTcU3KeFzqNM6zct2BKQjn60If5avXk7vPkAPlVKWB0OUq00Osx93M+5BsTPTo4buAEXcF/rYnY9Pgfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U5B5p7HEj0PcKXLyouOR7Pt9sYaQHiM3ia57AT2u5VY=;
 b=EbOSAIFXqrdBI87V8vrPa+8YYz/Hh5HGfbcMDoXZJIY2+tMdwU/mId8hkELAOYKjo5QHcySyqUFF6v9xboRoLktoFlutnnyghxtvgm35ra/6NigIu1mKq6ACtgTiSVXLSdVk530GkbNlMYehxJsqoKZ1uCLroY75T6vInkn1eog=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4605.namprd12.prod.outlook.com (2603:10b6:208:3d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.20; Thu, 10 Dec
 2020 09:42:05 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3654.016; Thu, 10 Dec 2020
 09:42:05 +0000
Subject: Re: [PATCH 1/1] drm/scheduler: Job timeout handler returns status (v2)
To: Lucas Stach <l.stach@pengutronix.de>, Luben Tuikov
 <luben.tuikov@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20201210021438.9190-1-luben.tuikov@amd.com>
 <20201210021438.9190-2-luben.tuikov@amd.com>
 <39a74cea2b6f3bfcc7b86de7a7a1dbcc93e21a7f.camel@pengutronix.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <b42284c3-b774-41dc-d4fa-1a61d9d25df4@amd.com>
Date: Thu, 10 Dec 2020 10:41:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <39a74cea2b6f3bfcc7b86de7a7a1dbcc93e21a7f.camel@pengutronix.de>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM4PR0101CA0078.eurprd01.prod.exchangelabs.com
 (2603:10a6:200:41::46) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4PR0101CA0078.eurprd01.prod.exchangelabs.com (2603:10a6:200:41::46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Thu, 10 Dec 2020 09:42:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 33c1a03e-9551-4444-0ff0-08d89cefdaf8
X-MS-TrafficTypeDiagnostic: MN2PR12MB4605:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4605EF5E4145B5626A2D045483CB0@MN2PR12MB4605.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1kDkocjgtaVJ1uuHU8i0hlqCYnJIRorX7xxdkkfc75f5kg5zO+YYT92/3RvDWClsVwrozh6d/fqPkmVytQ4jiWpmeSc0xGoZiYZC7zy4nOBfqw4/PfGEkYauP/yuWPt1Wp+iwX+f3qheawoFTERf+0UYDvdm3EvbFczQ9a6Hst1r9ZFKjMGJs/XiMDB7tJwjehNN0lU3a+hjaOP+D0HgolS/O/tHbryww+csgo7ZC0L/KR23WqDb2W0AyQ5xrQEyTupX0gKOugPmfm/iBIhaUCB9pMd5lKqi/UkkWyKp7F7Ezv5yDksYc1LPkN0wpz2EL6VEhcT3E5JfCLEpm0nt6K3URoGXteXPtk1drtwB9rPO7hpSpfMoWv81MIjWbVnXo7tjGRYegLgBQ8lDPzqnKq9yvflHDswyhDPRvsoA25I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(376002)(136003)(6666004)(31696002)(16526019)(2616005)(31686004)(110136005)(8676002)(66476007)(508600001)(8936002)(52116002)(54906003)(186003)(36756003)(2906002)(86362001)(6486002)(66556008)(7416002)(66946007)(34490700003)(5660300002)(83380400001)(4326008)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OXhxRnNSZ2V2MzY1Z2xkVWN6dGdRSkJzOFAzVmJMaXpiVHVxb1lzajdJYmlk?=
 =?utf-8?B?T1ErZzdFbXBCTVdkek8wclc0SDNGWG5DVnRyVlA4U2o2blBLL21lczhBWTJ1?=
 =?utf-8?B?TGFCemNGWFF1b002S005ZXlJK20yMjE1eHpUdHJHUUF4NEFCaEdzRGk2YmFt?=
 =?utf-8?B?S2xRczZlZHVON2RoMENwdkY2YkpVMTZPQld4eW8rdTU4cjNicnM4a3FtaUVq?=
 =?utf-8?B?bHJOTlZyUzNya0ZVeUdiSm5aaGdzOThDSE81SVoxTURSWitCRDNhRmdFeURP?=
 =?utf-8?B?bjFqL0ViQ0M5Q2I3UU93RytXZ1h0SmY4L3grb1RDeXNraWZkK2xBZWo3SkYw?=
 =?utf-8?B?WGx4Z1NJeFkyejBhMjVhT25NclY0bC95cjFRbkNrVjh4MzFra09QYXBqRWp1?=
 =?utf-8?B?WnVpREdzdkduSE1kMDNoeGU3aytDUXdDdGY3UHNhTytuWTFyalNieDk4N0FD?=
 =?utf-8?B?QjQ3Z2g5bWNGVGJhczIwSlRrcDNKeWNPRHNXbHROd1JkTkUvUHJENHZ5NTVu?=
 =?utf-8?B?N2pZVS9aNzF6NWdJQ0N1ZmVCcHZ2amFlVkpqdW1CZG9QTDBzNUI4cFhLZWdQ?=
 =?utf-8?B?MlRoT21SQ1ovUW9ia3JCaWJjUVR3UWxOeTA3dmdiWm9NRnVwWE9EMHJpWmd1?=
 =?utf-8?B?S3NjK3l5aEZHQzh0T1NrakRxVXd0V3d0TGt6VjZZWUs4dnprVlBENEN0Njds?=
 =?utf-8?B?Z09zOXBSMFdQc2RWcW9GMWI1eUFHaVJmVUhUQkNhaW4rUzM4bHc3UWtNdGFx?=
 =?utf-8?B?OEVuWDlyczhLd1NBNGw3Z2h3UStycVFJV3hmUzNJMkowWUZmVnZhOC9ZSFIx?=
 =?utf-8?B?aUo2WmxERzlSN0xoanFRZXBESkh0aEtybk1UMlRPNzgvUmtObkMvbTdGMlNV?=
 =?utf-8?B?bUt5dm9UR0ZLT0loRXMrTVc2SXArbmYrZzZ2WWI1QjFleXkvNG1FNUxjenpo?=
 =?utf-8?B?NWhnMURrWVA3Qnc2NkdUa2VXRjFLY282SjI0WDdtcGo0dWZQV3o1SnB4d0JC?=
 =?utf-8?B?enVoamJ3cEpDWlUyalg0K2piUVVEL1YvU0MwTFlta1grNXhjVHp3SFNvZHJu?=
 =?utf-8?B?OFlVZzhxQ0RvV0pDTllVcGwzTWI1RUR0NFQ3Qlo4cmcwNEFrWXQ1Wi9MREpN?=
 =?utf-8?B?NU90MGFTd0JMdEI4cmhWdEdkSGkrTFV2VUFXQlFVMEVTWVVWR0FQNG9KeHl3?=
 =?utf-8?B?bTRySCs3REw4YUZMYnhrTlVjcDJyTjN2akxYRm94dS9wMUw0aE5XK016Vzd4?=
 =?utf-8?B?WFVzM3hBd1Q5WjBiVzJyYUM2SEVJODdjcE1JTjhKTEE2RWx2emthTFlHamRy?=
 =?utf-8?B?ZVkxU0hNUk5nV0N0M1BqWU1XeU45UTFBSU0yZjdPT0tlUjhmOHFKdnRTcDVO?=
 =?utf-8?B?QWwxYXBDZG5RR0c1QW4ycjlNQmwvcTZYVkVRY21DU1lvRjY4SUh6N3hsdytM?=
 =?utf-8?Q?gySXKYzj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2020 09:42:05.6642 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 33c1a03e-9551-4444-0ff0-08d89cefdaf8
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cBGLOWPrWynD56BcaPY4/sJyUkBsm+tCzC1Zows8T6qM4DJmN09OivIJN0EwxWT/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4605
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
Cc: kernel test robot <lkp@intel.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Steven Price <steven.price@arm.com>,
 Qiang Yu <yuq825@gmail.com>, Russell King <linux+etnaviv@armlinux.org.uk>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTAuMTIuMjAgdW0gMTA6MzEgc2NocmllYiBMdWNhcyBTdGFjaDoKPiBIaSBMdWJlbiwKPgo+
IEFtIE1pdHR3b2NoLCBkZW4gMDkuMTIuMjAyMCwgMjE6MTQgLTA1MDAgc2NocmllYiBMdWJlbiBU
dWlrb3Y6Cj4+IFtTTklQXQo+PiAtc3RhdGljIHZvaWQgZXRuYXZpdl9zY2hlZF90aW1lZG91dF9q
b2Ioc3RydWN0IGRybV9zY2hlZF9qb2IgKnNjaGVkX2pvYikKPj4gK3N0YXRpYyBlbnVtIGRybV90
YXNrX3N0YXR1cyBldG5hdml2X3NjaGVkX3RpbWVkb3V0X2pvYihzdHJ1Y3QgZHJtX3NjaGVkX2pv
Ygo+PiArCQkJCQkJICAgICAgICpzY2hlZF9qb2IpCj4+ICDCoHsKPj4gIMKgCXN0cnVjdCBldG5h
dml2X2dlbV9zdWJtaXQgKnN1Ym1pdCA9IHRvX2V0bmF2aXZfc3VibWl0KHNjaGVkX2pvYik7Cj4+
ICDCoAlzdHJ1Y3QgZXRuYXZpdl9ncHUgKmdwdSA9IHN1Ym1pdC0+Z3B1Owo+PiBAQCAtMTIwLDkg
KzEyMSwxNiBAQCBzdGF0aWMgdm9pZCBldG5hdml2X3NjaGVkX3RpbWVkb3V0X2pvYihzdHJ1Y3Qg
ZHJtX3NjaGVkX2pvYiAqc2NoZWRfam9iKQo+PiAgIAo+PiAgwqAJZHJtX3NjaGVkX3Jlc3VibWl0
X2pvYnMoJmdwdS0+c2NoZWQpOwo+PiAgIAo+PiArCS8qIFRlbGwgdGhlIERSTSBzY2hlZHVsZXIg
dGhhdCB0aGlzIHRhc2sgbmVlZHMKPj4gKwkgKiBtb3JlIHRpbWUuCj4+ICsJICovCj4gVGhpcyBj
b21tZW50IGRvZXNuJ3QgbWF0Y2ggdGhlIGtlcm5lbCBjb2Rpbmcgc3R5bGUsIGJ1dCBpdCdzIGFs
c28gbW9vdAo+IGFzIHRoZSB3aG9sZSBhZGRlZCBjb2RlIGJsb2NrIGlzbid0IG5lZWRlZC4gVGhl
IGNvZGUganVzdCBiZWxvdyBpcwo+IGlkZW50aWNhbCwgc28gbGV0dGluZyBleGVjdXRpb24gY29u
dGludWUgaGVyZSBpbnN0ZWFkIG9mIHJldHVybmluZwo+IHdvdWxkIGJlIHRoZSByaWdodCB0aGlu
ZyB0byBkbywgYnV0IG1heWJlIHlvdSBtZWFuIHRvIHJldHVybgo+IERSTV9UQVNLX1NUQVRVU19D
T01QTEVURT8gSXQncyBhIGJpdCBjb25mdXNpbmcgdGhhdCBhYm9ydGVkIGFuZCBqb2IKPiBzdWNj
ZXNzZnVsbHkgZmluaXNoZWQgc2hvdWxkIGJlIHNpZ25hbGVkIHdpdGggdGhlIHNhbWUgcmV0dXJu
IGNvZGUuCgpZZXMgYW5kIG5vLiBBcyBJIHRyaWVkIHRvIGRlc2NyaWJlIGluIG15IHByZXZpb3Vz
IG1haWwgdGhlIG5hbWluZyBvZiB0aGUgCmVudW0gdmFsdWVzIGlzIGFsc28gbm90IHZlcnkgZ29v
ZC4KClNlZSBldmVuIHdoZW4gdGhlIGpvYiBoYXMgY29tcGxldGVkIHdlIG5lZWQgdG8gcmVzdGFy
dCB0aGUgdGltZXIgZm9yIHRoZSAKcG90ZW50aWFsIG5leHQgam9iLgoKT25seSB3aGVuIHRoZSBk
ZXZpY2UgaXMgY29tcGxldGVseSBnb25lIGFuZCB1bnJlY292ZXJhYmxlIHdlIHNob3VsZCBub3Qg
CnJlc3RhcnQgdGhlIHRpbWVyLgoKSSBzdWdnZXN0IHRvIGVpdGhlciBtYWtlIHRoaXMgYW4gaW50
IGFuZCByZXR1cm4gLUVOT0RFViB3aGVuIHRoYXQgCmhhcHBlbnMgb3IgcmVuYW1lIHRoZSBlbnVt
IHRvIHNvbWV0aGluZyBsaWtlIERSTV9TQ0hFRF9OT0RFVi4KClJlZ2FyZHMsCkNocmlzdGlhbi4K
Cj4KPj4gKwlkcm1fc2NoZWRfc3RhcnQoJmdwdS0+c2NoZWQsIHRydWUpOwo+PiArCXJldHVybiBE
Uk1fVEFTS19TVEFUVVNfQUxJVkU7Cj4+ICsKPj4gIMKgb3V0X25vX3RpbWVvdXQ6Cj4+ICDCoAkv
KiByZXN0YXJ0IHNjaGVkdWxlciBhZnRlciBHUFUgaXMgdXNhYmxlIGFnYWluICovCj4+ICDCoAlk
cm1fc2NoZWRfc3RhcnQoJmdwdS0+c2NoZWQsIHRydWUpOwo+PiArCXJldHVybiBEUk1fVEFTS19T
VEFUVVNfQUxJVkU7Cj4+ICDCoH0KPiBSZWdhcmRzLAo+IEx1Y2FzCj4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4FA151BC9
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2020 15:03:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB4D66EF38;
	Tue,  4 Feb 2020 14:03:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750077.outbound.protection.outlook.com [40.107.75.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE6906EF38
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2020 14:03:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ktgyg/b2DdUFEd/FVWj7YS49hoOsSb6aTHiHnHMrXt1nWbw1kdCh2bmxjVCicyJufBQWI+t70VrCAMdlrP8c6hZCRvcMdEgUjntKB+OW0tnUCKAG/7uN4VGU6uFWmrvehAbTTPPnkL7yUk7mhHFck2d9NBeFWdHH+TIlK7TxnkV8GGt/IL9SJZlg7hIT36xbDh9KFE1hP1rU/C53Smk480ge5mNzGI/OqujFTBT4ai+agccNAheE+ijRAbpBVticS2Co7v6YQp3ABDX4+8I6j3iRiougxMkw+hhXucchiVw07+9UFYYwg3j+3njs21JA+RVenI+1GirsK1N/zdLz/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Es5VW4+pGq3jrb0bo7GWAQlsT0j8EnN4qaARGnv0jNM=;
 b=Hb7u/n4ux+PfjH1HDaowIzCYJQggyQHmFcA5FjCcTUdK6w/VFrYa3S3P5GLJROliWWH55Pm32wixOX1BI6rafMnePsrd/j82oRkl9Tgxdg8xM/N9PKVz5kWYZTr2BJ7NbuIeMtqFCGLL0qcR7utb4S+/yUMEIFjqsc5uqRgOpRsC6M0PdjBopbrbpjmLTUdTV21l4CSkrj4s0d+Z/NVDGwtWB7artV/N83lXpBRTaVig8/Iue8Ne7j/5B7yfreG0bPPO387gTmbdfgWM7pfL+pAJbsU1vSK46iyxQPZUpRN7LS5Y26VZB88Z8GT/J82TEGt0Ze96hOH0aLeEPWEreA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Es5VW4+pGq3jrb0bo7GWAQlsT0j8EnN4qaARGnv0jNM=;
 b=uYx40dfAYasPW6+/oqdZNSXLqfrUNVDsDvOWh7OUPjBjFXxqPfe6r4PB/2SzRdHyhHU0KGuYQtOxq3dc+9pRW8w03qwKhGi7nF/yCC8HN/5EULwe+Sou424ovkSr/M72/k+y0RQE7zzeI5N76guy8ktVpK2Kh8pep8Wr3QotZNA=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB2533.namprd12.prod.outlook.com (52.132.139.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2686.30; Tue, 4 Feb 2020 14:03:49 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::d40e:7339:8605:bc92]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::d40e:7339:8605:bc92%11]) with mapi id 15.20.2686.031; Tue, 4 Feb 2020
 14:03:49 +0000
Subject: Re: [bug report] drm/ttm: fix re-init of global structures
To: Dan Carpenter <dan.carpenter@oracle.com>
References: <20200204125741.lwg526qxwn5gn5ux@kili.mountain>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <c83eb759-3ca9-64a6-d40c-32786304d82c@amd.com>
Date: Tue, 4 Feb 2020 15:03:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20200204125741.lwg526qxwn5gn5ux@kili.mountain>
Content-Language: en-US
X-ClientProxiedBy: AM0PR07CA0002.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::15) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR07CA0002.eurprd07.prod.outlook.com (2603:10a6:208:ac::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.12 via Frontend Transport; Tue, 4 Feb 2020 14:03:48 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 694f609b-6a92-4eef-966a-08d7a97b0ef2
X-MS-TrafficTypeDiagnostic: DM5PR12MB2533:
X-Microsoft-Antispam-PRVS: <DM5PR12MB2533A28EE9A2164FF029564E83030@DM5PR12MB2533.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 03030B9493
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(366004)(376002)(346002)(136003)(189003)(199004)(66574012)(4326008)(81166006)(66946007)(81156014)(16526019)(6486002)(6916009)(186003)(36756003)(5660300002)(52116002)(31696002)(86362001)(2906002)(8936002)(2616005)(6666004)(478600001)(31686004)(66476007)(66556008)(8676002)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2533;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /PGyiJ+7XFcQJZEgwnQGM+VQhvwoar3kcpHjB068CkXL0zRa2lRXeyMoEIu1zsvwCEz4VQRUSPTiYnrliL+ZzTNIFF3sumRDtnTF2daN4bULm6JJlgGy13owqWRGQqAJkaU6KhfcOSShEXmPwhL3wwmZZnOnKpJ7dZ1tUXkUpMAHX5pZkyUPDRRpaCztwFCj33rRR/Ojea6Yv4JMHypTCEdIvcHK68R3uriIAvA+HcTTq3W1LlUWYq9RV8P+BlJM5jWR58GUBooAlyGclOiiiBH8EQbdhuuPPmJpCGLb+GJkJfDgioOYg/klNuPDM1lDTXV6FU0CV/bdwOXCoZMLX7zO4fd+AGvlZuj78hiBZJAQdE2zmr28oAPJUerGxLnZYNPvL/aAAbYEvHAwzS1bnS4ay+VWBgx+xMQ3exCQgsbWxdaXc/obZdenjAvDd3u4
X-MS-Exchange-AntiSpam-MessageData: 2Vg6bCBhsq4K1A+1Q+OxI7mZoMgj+Fc7jrmEHB8/Zn8mnNd1kJAqQ5qEufmIat9fK2XC6P9RaFzz8s+5lB32T+ZHQsYg5ReoIo1CGNzxE3a7eRIrAF/dCL8hR5c3U2tsxdDxhcgTIa9ZWo7Jzb8xanYyG1z5pb9wPVXUC6w7kROFkIjDnygUA490mlRGGGaOudjOvlUHYTQoIspRQsTWPg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 694f609b-6a92-4eef-966a-08d7a97b0ef2
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2020 14:03:49.4574 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fZuh9dueCXJ2c3dl9J+9y6rRTwKyNDDEpy5WutGeXWIm0Hmk7v0ZeHxX3uL0elq9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2533
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

QW0gMDQuMDIuMjAgdW0gMTM6NTcgc2NocmllYiBEYW4gQ2FycGVudGVyOgo+IEhlbGxvIENocmlz
dGlhbiBLw7ZuaWcsCj4KPiBUaGUgcGF0Y2ggYmQ0MjY0MTEyZjkzOiAiZHJtL3R0bTogZml4IHJl
LWluaXQgb2YgZ2xvYmFsIHN0cnVjdHVyZXMiCj4gZnJvbSBBcHIgMTYsIDIwMTksIGxlYWRzIHRv
IHRoZSBmb2xsb3dpbmcgc3RhdGljIGNoZWNrZXIgd2FybmluZzoKPgo+IAlkcml2ZXJzL2dwdS9k
cm0vdHRtL3R0bV9iby5jOjE2MTAgdHRtX2JvX2dsb2JhbF9yZWxlYXNlKCkKPiAJd2FybjogcGFz
c2luZyBmcmVlZCBtZW1vcnkgJ2dsb2InCj4KPiBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5j
Cj4gICAgMTU5MSAgc3RhdGljIHZvaWQgdHRtX2JvX2dsb2JhbF9rb2JqX3JlbGVhc2Uoc3RydWN0
IGtvYmplY3QgKmtvYmopCj4gICAgMTU5MiAgewo+ICAgIDE1OTMgICAgICAgICAgc3RydWN0IHR0
bV9ib19nbG9iYWwgKmdsb2IgPQo+ICAgIDE1OTQgICAgICAgICAgICAgICAgICBjb250YWluZXJf
b2Yoa29iaiwgc3RydWN0IHR0bV9ib19nbG9iYWwsIGtvYmopOwo+ICAgIDE1OTUKPiAgICAxNTk2
ICAgICAgICAgIF9fZnJlZV9wYWdlKGdsb2ItPmR1bW15X3JlYWRfcGFnZSk7Cj4gICAgMTU5NyAg
fQo+ICAgIDE1OTgKPiAgICAxNTk5ICBzdGF0aWMgdm9pZCB0dG1fYm9fZ2xvYmFsX3JlbGVhc2Uo
dm9pZCkKPiAgICAxNjAwICB7Cj4gICAgMTYwMSAgICAgICAgICBzdHJ1Y3QgdHRtX2JvX2dsb2Jh
bCAqZ2xvYiA9ICZ0dG1fYm9fZ2xvYjsKPiAgICAxNjAyCj4gICAgMTYwMyAgICAgICAgICBtdXRl
eF9sb2NrKCZ0dG1fZ2xvYmFsX211dGV4KTsKPiAgICAxNjA0ICAgICAgICAgIGlmICgtLXR0bV9i
b19nbG9iX3VzZV9jb3VudCA+IDApCj4gICAgMTYwNSAgICAgICAgICAgICAgICAgIGdvdG8gb3V0
Owo+ICAgIDE2MDYKPiAgICAxNjA3ICAgICAgICAgIGtvYmplY3RfZGVsKCZnbG9iLT5rb2JqKTsK
PiAgICAxNjA4ICAgICAgICAgIGtvYmplY3RfcHV0KCZnbG9iLT5rb2JqKTsKPiAgICAxNjA5ICAg
ICAgICAgIHR0bV9tZW1fZ2xvYmFsX3JlbGVhc2UoJnR0bV9tZW1fZ2xvYik7Cj4gICAgMTYxMCAg
ICAgICAgICBtZW1zZXQoZ2xvYiwgMCwgc2l6ZW9mKCpnbG9iKSk7Cj4gICAgICAgICAgICAgICAg
ICAgICAgICAgXl5eXl5eXl5eXl5eXl5eXl5eXl5eXgo+IERlcGVuZGluZyBvbiB0aGUgY29uZmln
IGtvYmplY3RfcmVsZWFzZSgpIG1pZ2h0IGNhbGwgdHRtX2JvX2dsb2JhbF9rb2JqX3JlbGVhc2Uo
KQo+IGEgZmV3IHNlY29uZHMgYWZ0ZXIgdGhpcyBtZW1zZXQuICBNYXliZSBwdXQgdGhlIG1lbXNl
dCBpbnRvCj4gdHRtX2JvX2dsb2JhbF9rb2JqX3JlbGVhc2UoKT8KClRoYXQncyBub3QgcG9zc2li
bGUuIFRoZSBvYmplY3QgbWlnaHQgYmUgcmUtdXNlZCBkaXJlY3RseSBhZnRlciB3ZSBkcm9wIAp0
aGUgdHRtX2dsb2JhbF9tdXRleC4KCkhvdyBjYW4gd2Ugd2FpdCBmb3IgdGhlIHR0bV9tZW1fZ2xv
YmFsX3JlbGVhc2UoKSB0byBoYXZlIGZpbmlzaGVkPwoKSSBtZWFuIGluIHRoZW9yeSB0aGF0IGZ1
bmN0aW9uIHNob3VsZCBhY3R1YWxseSBiZSB1c2VkIGZyb20gYSAKbW9kdWxlX2V4aXQoKSBjYWxs
YmFjaywgYW5kIHdlIG5lZWQgdG8gbWFrZSAxMDAlIHN1cmUgdGhhdCB0aGUga29iaiBpcyAKZ29u
ZSBvciB3ZSBhcmUgcnVubmluZyBpbiBhIGJ1bmNoIG9mIHRyb3VibGUuCgpDaHJpc3RpYW4uCgo+
Cj4gICAgMTYxMSAgb3V0Ogo+ICAgIDE2MTIgICAgICAgICAgbXV0ZXhfdW5sb2NrKCZ0dG1fZ2xv
YmFsX211dGV4KTsKPiAgICAxNjEzICB9Cj4KPgo+IHJlZ2FyZHMsCj4gZGFuIGNhcnBlbnRlcgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

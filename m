Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6401610DB
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2020 12:16:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6951E6E92A;
	Mon, 17 Feb 2020 11:16:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2085.outbound.protection.outlook.com [40.107.236.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6504D6E92A;
 Mon, 17 Feb 2020 11:16:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ItU0q0Tge/ND9CKSmPTjMBxjJmNPP2wOeZ+6McE5CBBZIPxIT7Zjezb0CC/2QMEzv1QeeOeVVozwV3tsnrUU9i1HrazJriULIlYOyT1pSaH9LC+gUF9cGx0kj3tr8Upor7yVYfhQe0EtewlB72qFgOKGjjdg2mAXMVd4w/8CuPitDLH9ryXdpWhnx1YwKEODXTRL17WpHEZIww4zpSdWzcf9qpLS1uc5KzQPJmgkX0KbTOR3GCFlHpIyfYVjeBOBI6z/GFDSIyTs8DpqEpgsV85xPMIuY5P3GUlSNvPjpUK9erZMf7cJeqgcLjdqqpZrVTZNfHsIw36AwRbAl7zWnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3O0sUInIZYohNFEgE/pwwzk0KRUMiALQA1ZxVKFK24U=;
 b=MFms7XMvLJPVunHqzMAG087u+Ge6cD0jIRnJ65SnAO9SgFUY1W3b2fIpGiCBh7+keM92r76w7AcYInUNroQhnMUb1seXUmk+pXdMT9kuiodzNDG133nvAIUl3q9PsWQ0txk8eWVSb5/grFOQZewRZ7ZQNuEEpEZVBWLE+iJk1tqdi5ETQUoGu+2IpGejHEgJjooQojIZwM16gTW08AtZ8mdlrZeAjDvRr0hPTIkLRq+huYteqrXMu9Ze5FO3p7w6Ll+zA9HEkX2olMeRY4dfWpOxmZtrjPquY7qwRmpQT/Gj92F6dSfLrMD0kEGdil71ohkruM5U4HeZyq5odmwzGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3O0sUInIZYohNFEgE/pwwzk0KRUMiALQA1ZxVKFK24U=;
 b=XYF9zHY1QXjQxvyd6Aas1u70TRtLY6LqswP09ughBe0Gv+juq/RGSgm9hmMAFTgHhazrJF4QN8kU58oI4OOMNTdHU06xD0dH9ueSZJHRt3h5AK8an2KQUfii6aUpMYWlrtuYskP5M0Ky46nLIZwmdeN+PIcoEX0HLb27VtDFObA=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Nirmoy.Das@amd.com; 
Received: from DM5PR12MB2376.namprd12.prod.outlook.com (52.132.143.139) by
 DM5PR12MB2424.namprd12.prod.outlook.com (52.132.142.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.25; Mon, 17 Feb 2020 11:16:11 +0000
Received: from DM5PR12MB2376.namprd12.prod.outlook.com
 ([fe80::c06c:24da:d4c5:5ee3]) by DM5PR12MB2376.namprd12.prod.outlook.com
 ([fe80::c06c:24da:d4c5:5ee3%6]) with mapi id 15.20.2729.028; Mon, 17 Feb 2020
 11:16:11 +0000
Subject: Re: [PATCH 3/7] drm/vmwgfx: don't use ttm bo->offset
To: christian.koenig@amd.com, Nirmoy Das <nirmoy.aiemd@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20200217101841.7437-1-nirmoy.das@amd.com>
 <20200217101841.7437-4-nirmoy.das@amd.com>
 <19509316-9673-a435-6e74-ab4f43344d94@gmail.com>
From: Nirmoy <nirmodas@amd.com>
Message-ID: <98e8a992-ceeb-3996-a2aa-99c830dde355@amd.com>
Date: Mon, 17 Feb 2020 12:18:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
In-Reply-To: <19509316-9673-a435-6e74-ab4f43344d94@gmail.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR01CA0120.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::25) To DM5PR12MB2376.namprd12.prod.outlook.com
 (2603:10b6:4:b9::11)
MIME-Version: 1.0
Received: from [IPv6:2003:c5:8f26:1400:bc11:1ead:619e:c67c]
 (2003:c5:8f26:1400:bc11:1ead:619e:c67c) by
 AM0PR01CA0120.eurprd01.prod.exchangelabs.com (2603:10a6:208:168::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.22 via Frontend
 Transport; Mon, 17 Feb 2020 11:16:08 +0000
X-Originating-IP: [2003:c5:8f26:1400:bc11:1ead:619e:c67c]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f686370a-c9a5-42ac-1ea3-08d7b39acb1c
X-MS-TrafficTypeDiagnostic: DM5PR12MB2424:|DM5PR12MB2424:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB2424244FB9968F8F893BB0008B160@DM5PR12MB2424.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 0316567485
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(39860400002)(376002)(366004)(346002)(199004)(189003)(8676002)(31696002)(52116002)(81156014)(66946007)(81166006)(66476007)(2616005)(186003)(16526019)(6486002)(6666004)(66556008)(53546011)(31686004)(2906002)(316002)(8936002)(36756003)(7416002)(5660300002)(478600001)(66574012)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2424;
 H:DM5PR12MB2376.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wJ8GkKBhLyh5ADaD8+ZcOvzysF63rCrlQVUIUEcCFpJ9e09t+SVajW1xGTQiQRFK3If1IuYAw6dmI4eS5/QpHmbyBWmuml0Csqx/2z4FyFXCxsqJqyZnEPDRHWGc2gVuawADYA2kqF4qkyu10F596qNbfYB2pxIJeqhE/PlGzBYIS3T1BeKjvrmmUn0lVqGm5WR4fYXu2UbwrEHui3Ey4XPd22lKrRBWTm+XJdCjdrJcmD7zBL0+w/avoo8Bbuwwq+zMb7+FR7h+bUBSty55Tr/8pwIEDyCJIIHmGoWcCSEBZJVgvMaufjdrreDKLJIcyd/1aQWcPJTFKafm+eyNOF4OUp7sN3u9iJbPaV1kFnAMN3EEYmhjefGkVQ+Ue3q3BdHsm+WPsO6zMGuxIlSjf6WNr/g4Q5+ah2NedbXCDo389y/HoAQgG1uQ2korWG9Y
X-MS-Exchange-AntiSpam-MessageData: pS0l71gbQCC0TJ/e5/SriQg2srL6F9qhaW3/xCt8OhMygwEsWpXTG1H9WUdz7OLHp/uq0OI/OAyf8vPPOcs6n9dfhNwFXaxlZesDiDKAc+L/kHkaOPPk7zsALi2qZ1NVj2z3UnpMdNr2obPU66huwaC2TPVofFPaibhq0jzHjpL8GK/mqO+vfecXSMT4/BDl0kXsSQSP8qdIu8fFNoVZ9g==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f686370a-c9a5-42ac-1ea3-08d7b39acb1c
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2020 11:16:11.2166 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H9iBraI0YsBQS+Q5gmKjwI259SIROtXcUoTBTrH9L/XtspX7uHfEiG4TtzGRJPj9yBqFwSnhglZbOPwzS0dp+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2424
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
Cc: thellstrom@vmware.com, airlied@linux.ie, kenny.ho@amd.com,
 brian.welty@intel.com, amd-gfx@lists.freedesktop.org, nirmoy.das@amd.com,
 linux-graphics-maintainer@vmware.com, bskeggs@redhat.com,
 alexander.deucher@amd.com, sean@poorly.run, kraxel@redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDIvMTcvMjAgMTI6MDkgUE0sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4gQW0gMTcuMDIu
MjAgdW0gMTE6MTggc2NocmllYiBOaXJtb3kgRGFzOgo+PiBDYWxjdWxhdGUgR1BVIG9mZnNldCB3
aXRoaW4gdm13Z2Z4IGRyaXZlciBpdHNlbGYgd2l0aG91dCBkZXBlbmRpbmcgb24KPj4gYm8tPm9m
ZnNldAo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBOaXJtb3kgRGFzIDxuaXJtb3kuZGFzQGFtZC5jb20+
Cj4+IC0tLQo+PiDCoCBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9iby5jwqDCoMKgwqDC
oMKgwqDCoCB8IDQgKystLQo+PiDCoCBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9leGVj
YnVmLmPCoMKgwqAgfCAyICstCj4+IMKgIGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2Zp
Zm8uY8KgwqDCoMKgwqDCoCB8IDIgKy0KPj4gwqAgZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdn
ZnhfdHRtX2J1ZmZlci5jIHwgMiAtLQo+PiDCoCA0IGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9u
cygrKSwgNiBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92
bXdnZngvdm13Z2Z4X2JvLmMgCj4+IGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfYm8u
Ywo+PiBpbmRleCA4YjcxYmY2YjU4ZWYuLmE3MTQ1ODJiYjYxYyAxMDA2NDQKPj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfYm8uYwo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
dm13Z2Z4L3Ztd2dmeF9iby5jCj4+IEBAIC0yNTgsNyArMjU4LDcgQEAgaW50IHZtd19ib19waW5f
aW5fc3RhcnRfb2ZfdnJhbShzdHJ1Y3QgCj4+IHZtd19wcml2YXRlICpkZXZfcHJpdiwKPj4gwqDC
oMKgwqDCoMKgwqDCoMKgIHJldCA9IHR0bV9ib192YWxpZGF0ZShibywgJnBsYWNlbWVudCwgJmN0
eCk7Cj4+IMKgIMKgwqDCoMKgwqAgLyogRm9yIHNvbWUgcmVhc29uIHdlIGRpZG4ndCBlbmQgdXAg
YXQgdGhlIHN0YXJ0IG9mIHZyYW0gKi8KPj4gLcKgwqDCoCBXQVJOX09OKHJldCA9PSAwICYmIGJv
LT5vZmZzZXQgIT0gMCk7Cj4+ICvCoMKgwqAgV0FSTl9PTihyZXQgPT0gMCAmJiAoYm8tPm1lbS5z
dGFydCA8PCBQQUdFX1NISUZUKSAhPSAwKTsKPgo+IFlvdSBjb3VsZCBkcm9wIHRoZSAoPDwgUEFH
RV9TSElGVCkgcGFydCBoZXJlLgo+ClRoYW5rcyBDaHJpc3RpYW4hIEkgd2lsbCBkcm9wIHRoYXQg
aW4gbmV4dCB2ZXJzaW9uLgo+IEFwYXJ0IGZyb20gdGhhdCBmZWVsIGZyZWUgdG8gc3RpY2sgYW4g
QWNrZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgCj4gPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4g
b24gdGhlIHBhdGNoLgo+Cj4gQ2hyaXN0aWFuLgo+Cj4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==

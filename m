Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 842AD1B270F
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 15:03:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE7436E934;
	Tue, 21 Apr 2020 13:03:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2075.outbound.protection.outlook.com [40.107.94.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 690B06E06B;
 Tue, 21 Apr 2020 13:03:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e4F6X40vhgg9D0xivejDf8h841gM6TCd5bfJDuD52HZbG3rKw7Qm3MaaJOEX/2VUIq1kPYGmiMmkUxnDGMI89tLj8y0hyrkumA2DXRndChhMVMtF3AJ9g+vPt2T73VYGZIy1S58h8Og4LR8ZCx3rb62AvZXsfv9P6TUE+G6Vhzx3fuMM2fvfmixbhMOGqKtdT3LgFh/IvwFAO0Nc9wBzLhKm8Nf1F/yFFqnzSgI4vzPG5DtFZdwd00KruR293xXw6xBC6QVe+FEUhckryM6+so62iCJWILqx1uVtdyu4Xa3tvmkiUNVQGBnGbUuXWRwm8rpnA5dIva0M1grfpFPRHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YDUEgxeWOZ78A9hE1wo///i8Z9K2dkaaghMy/aorsU8=;
 b=TFH48YMEk70oC7g1B9K4L/LYMWrp/6qmvbuoqx56nS/hTaeTOCeIVl+6VTquYT8C16PJOdnZvqTElNxREXCneOtkF3SyKf8A2U4Ll7aPg/MpN8/7QII9vEvNpcnSWZOjCR4WyJH2VLon7Yna2XmIRdhsuSGjVbT14dCgnXYFSZg0EWpvuDjsd5YsFXXmzcy0QjXF8/kClwF0MTQJgCg80he+t5BZ+hAIlMrRYIR9STM6Fd22r3Rv9QCfomsuRVF0+L7AYOMUW60qaS5zwQ92xjvn4zvC7Naft2IHgM2GbxaeabQMbqGlODu5u7e0BN9MGVhV1bhHVo4d/0gUDHRp7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YDUEgxeWOZ78A9hE1wo///i8Z9K2dkaaghMy/aorsU8=;
 b=VL3t/Npj62wnUJCkvdV4lgy5Jp1v2BOF/pvFr/Omh4f+WMsPH7ikrjN1iyLv4+8TK1y0FKF4eRh8Tzk8wktaJWKVDgB0ncF+UrZ4seYQDlrkfVbbAGCVFIwunoZV2FlMQ9Z08R1/hLx8W+zARAtKZN9d1E5c1Rmk1E3CVIYP+MU=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM6PR12MB4401.namprd12.prod.outlook.com (2603:10b6:5:2a9::15)
 by DM6PR12MB2892.namprd12.prod.outlook.com (2603:10b6:5:182::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Tue, 21 Apr
 2020 13:03:29 +0000
Received: from DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766]) by DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766%3]) with mapi id 15.20.2921.030; Tue, 21 Apr 2020
 13:03:29 +0000
Subject: Re: [PATCH] amdgpu: fixes memleak issue when init failed
To: =?UTF-8?B?6LW15Yab5aWO?= <bernard@vivo.com>
References: <AIEABQDACBGx7eaGVybumqrT.3.1587470983521.Hmail.bernard@vivo.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <5c1510e2-9007-50b8-9be9-b8a00f943c9b@amd.com>
Date: Tue, 21 Apr 2020 15:02:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <AIEABQDACBGx7eaGVybumqrT.3.1587470983521.Hmail.bernard@vivo.com>
Content-Language: en-US
X-ClientProxiedBy: AM0P190CA0018.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::28) To DM6PR12MB4401.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0P190CA0018.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2921.26 via Frontend Transport; Tue, 21 Apr 2020 13:03:27 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: dd3f655c-9fba-4a0e-99a9-08d7e5f46305
X-MS-TrafficTypeDiagnostic: DM6PR12MB2892:|DM6PR12MB2892:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB2892044145B348086456514483D50@DM6PR12MB2892.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-Forefront-PRVS: 038002787A
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4401.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(346002)(136003)(376002)(366004)(39860400002)(396003)(81156014)(6916009)(53546011)(2906002)(86362001)(6486002)(478600001)(52116002)(4326008)(316002)(8936002)(8676002)(31686004)(36756003)(66946007)(186003)(66574012)(31696002)(2616005)(5660300002)(66476007)(66556008)(16526019)(54906003);
 DIR:OUT; SFP:1101; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8y1aS+CHxjBo6SUmRJbTiGK8XNtY/HpVRaZCVIaBWKANR/XRsJQcXSOPnmfwVuu6SoE06qrJMNxRjekRsMAzyq/g6ydIVm+HUr0GuJgWBeLdunZYmAXqZAr6o3CSNOAWZMXkKQld7tdf92WUHN4CMIYM14+4UxnBZgW/GmbM7PlLP75DeFjTT1xDZmwzaHNut+CTlkTUsny/CJKJvMVflNyMf2U4SYOhmo6UebyBzxBp6Nc+WHuiOjfk9xB7E5qXxrqdtxSl8rN5wQbkweNXuJNXTaHjFpqJ0MjkaW4aSvlNEAvDLPTt/GRu4d8PvDXP2TRGLBDr+cIq9ZouP/+dN520I6f/MDi2/J9nhpEc9CsF1Nb6kWGLTBWy4rATgzG/FfdjveF+NZ2rjUPPnpB51IBh4LUwPDBMNQ11UJEnvhYG1gAgYLmbWtHKNLbdx3OQ
X-MS-Exchange-AntiSpam-MessageData: p5951OFVyXqmNn9OBxXg5y2/JccIUBDxn0O3IPTfE+DjsGy614GSUIJ/fmnvqIiN0jaC3MI+p0EMv2BKEAzCcpa2CgNy0t7D/ZbSVoNiA1b2t6ganHCa4kvoYNJNbEo+thZEOog9+KmLVybe+Gz3FYP6TQs3bdKRs8ZZeyey4fe1n9o7ZCUqolfZ8kf/zVkFss1KbQif1KvtwgmJYT0HX85L6PU5YTKkKSgAi561B3JH5nfc+RajagfvV7F9V0SeU4cFHaE+Jw68FMwomZp3bsWEmt3W7yR2lN22FQQsXZe2vkDhA7cLpomaLgY1yFfTCebudEaq6yZRSb76yFaJSiPVtmPVjE70CByZLUbPX4Oe5ISGIJBgaTN5o6lS+LTUWNxTng1LCV3/v9XfQfbwcicHTgMMAI45zIIyXMJ3qhVjp2sCHYtNIPoEH52P1wUWmPibolhbgI2Q7u0xlMNm1GEHC4WHhgdHfb0tAcGLb63gdcuB3DfszVmSbaMpVsdF8MTgWOej0RTVqEaclhNUrnH90AshEc3RAILJ4ryBj26u+fE70/KQ0tEwQZqAq4IwNOqfYtF3ef5E3q/yDCHgP3n9n6CWAZhFMcqHxD2uxWHkbMA+zIHMtcFq0nQrcWZ6fFEEWxuBuJTfVZHF9I16wZxLahaSUkEQyvO7UNqkpwEZ1S/02c5iyQKm/wBKNwcFHK2SuJ3CvJ46A/8y8EbsVi6Ijd6no8fC/xQzYm8VqycfGMgYfYloRZJk4MvkuS8VOfMsgrLexMrblE7qOgDz5/gE1FFBnLBx230vgDckBN8mYcgQBu97Pw8Bk1YpE6bl+/szjPBfEgZZ1m9HWPVY5hAtxNP8RhzPq/80DsrXb5U=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd3f655c-9fba-4a0e-99a9-08d7e5f46305
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2020 13:03:29.4905 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jSaXiebFt/Tty9sqPbznCV9BRGfEQMPDVmqRsEQNVdYahXBgDGAZsyx7JT0qrPGS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2892
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
Cc: Tom St Denis <tom.stdenis@amd.com>, Ori Messinger <Ori.Messinger@amd.com>,
 opensource.kernel@vivo.com, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjEuMDQuMjAgdW0gMTQ6MDkgc2NocmllYiDotbXlhpvlpY46Cj4gRnJvbTogIkNocmlzdGlh
biBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gRGF0ZTogMjAyMC0wNC0yMSAx
OToyMjo0OQo+IFRvOiAgQmVybmFyZCBaaGFvIDxiZXJuYXJkQHZpdm8uY29tPixBbGV4IERldWNo
ZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+LCJEYXZpZCAoQ2h1bk1pbmcpIFpob3UiIDxE
YXZpZDEuWmhvdUBhbWQuY29tPixEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+LERhbmll
bCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4sVG9tIFN0IERlbmlzIDx0b20uc3RkZW5pc0BhbWQu
Y29tPixPcmkgTWVzc2luZ2VyIDxPcmkuTWVzc2luZ2VyQGFtZC5jb20+LFNhbSBSYXZuYm9yZyA8
c2FtQHJhdm5ib3JnLm9yZz4sYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcsZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZyxsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnCj4gQ2M6
ICBvcGVuc291cmNlLmtlcm5lbEB2aXZvLmNvbQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGFtZGdw
dTogZml4ZXMgbWVtbGVhayBpc3N1ZSB3aGVuIGluaXQgZmFpbGVkPkFtIDIxLjA0LjIwIHVtIDEz
OjE3IHNjaHJpZWIgQmVybmFyZCBaaGFvOgo+Pj4gVlJBTSBtYW5hZ2VyIGFuZCBEUk0gTU0gd2hl
biBpbml0IGZhaWxlZCwgdGhlcmUgaXMgbm8gb3BlcmFjdGlvbgo+Pj4gdG8gZnJlZSBremFsbG9j
IG1lbW9yeSAmIHJlbW92ZSBkZXZpY2UgZmlsZS4KPj4+IFRoaXMgd2lsbCBsZWFkIHRvIG1lbWxl
YWsgJiBjYXVzZSBzdGFiaWxpdHkgaXNzdWUuCj4+IE5BSywgZmFpbHVyZSB0byBjcmVhdGUgc3lz
ZnMgbm9kZXMgYXJlIG5vdCBjcml0aWNhbC4KPj4KPj4gQ2hyaXN0aWFuLgo+Pgo+IE9LLCBnZXQg
aXQuCj4gQnkgdGhlIHdheSwgc2hvdWxkIGkgbW9kaWZ5IHRoaXMgcGF0Y2ggdG8ganVzdCBoYW5k
bGUgPGtmcmVlKG1ncik+IGluIGVycm9yIGJyYW5jaCwgb3IgdGhhdCBpdCBpcyBhbHNvIHVubmVj
ZXNzYXJ5PwoKV2hhdCB5b3UgY2FuIGRvIGlzIHRvIGRyb3AgdGhlICJyZXR1cm4gcmV0IiBpZiBh
bnl0aGluZyB3aXRoIHRoZSBzeXNmcyAKbm9kZXMgZ29lcyB3cm9uZyBhbmQgaW5zdGVhZCBwcmlu
dCB0aGUgZXJyb3IgY29kZS4KCkl0J3MgcmVhbGx5IGFubm95aW5nIHRoYXQgbG9hZGluZywgdW5s
b2FkaW5nIGFuZCBsb2FkaW5nIHRoZSBkcml2ZXIgCmFnYWluIHNvbWV0aW1lcyBmYWlscyBiZWNh
dXNlIHdlIGhhdmUgYSBidWcgaW4gdGhlIHN5c2ZzIGZpbGVzIGNsZWFudXAuCgpXZSBjZXJ0YWlu
bHkgc2hvdWxkIGZpeCB0aG9zZSBidWdzIGFzIHdlbGwsIGJ1dCB0aGV5IGFyZSBqdXN0IG5vdCAK
Y3JpdGljYWwgZm9yIGNvcnJlY3QgZHJpdmVyIGZ1bmN0aW9uYWxpdHkuCgpSZWdhcmRzLApDaHJp
c3RpYW4uCgo+Cj4gUmVnYXJkcywKPiBCZXJuYXJkCj4KPj4+IFNpZ25lZC1vZmYtYnk6IEJlcm5h
cmQgWmhhbyA8YmVybmFyZEB2aXZvLmNvbT4KPj4+IC0tLQo+Pj4gICAgZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3ZyYW1fbWdyLmMgfCAyNCArKysrKysrKysrKysrKysrLS0tLQo+
Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4+
Pgo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92cmFt
X21nci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZyYW1fbWdyLmMKPj4+
IGluZGV4IDgyYTMyOTllNTNjMC4uNGM1ZmIxNTNlNmI0IDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZyYW1fbWdyLmMKPj4+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92cmFtX21nci5jCj4+PiBAQCAtMTc1LDMwICsxNzUs
NDQgQEAgc3RhdGljIGludCBhbWRncHVfdnJhbV9tZ3JfaW5pdChzdHJ1Y3QgdHRtX21lbV90eXBl
X21hbmFnZXIgKm1hbiwKPj4+ICAgIAlyZXQgPSBkZXZpY2VfY3JlYXRlX2ZpbGUoYWRldi0+ZGV2
LCAmZGV2X2F0dHJfbWVtX2luZm9fdnJhbV90b3RhbCk7Cj4+PiAgICAJaWYgKHJldCkgewo+Pj4g
ICAgCQlEUk1fRVJST1IoIkZhaWxlZCB0byBjcmVhdGUgZGV2aWNlIGZpbGUgbWVtX2luZm9fdnJh
bV90b3RhbFxuIik7Cj4+PiAtCQlyZXR1cm4gcmV0Owo+Pj4gKwkJZ290byBWUkFNX1RPVEFMX0ZB
SUw7Cj4+PiAgICAJfQo+Pj4gICAgCXJldCA9IGRldmljZV9jcmVhdGVfZmlsZShhZGV2LT5kZXYs
ICZkZXZfYXR0cl9tZW1faW5mb192aXNfdnJhbV90b3RhbCk7Cj4+PiAgICAJaWYgKHJldCkgewo+
Pj4gICAgCQlEUk1fRVJST1IoIkZhaWxlZCB0byBjcmVhdGUgZGV2aWNlIGZpbGUgbWVtX2luZm9f
dmlzX3ZyYW1fdG90YWxcbiIpOwo+Pj4gLQkJcmV0dXJuIHJldDsKPj4+ICsJCWdvdG8gVklTX1ZS
QU1fVE9UQV9GQUlMOwo+Pj4gICAgCX0KPj4+ICAgIAlyZXQgPSBkZXZpY2VfY3JlYXRlX2ZpbGUo
YWRldi0+ZGV2LCAmZGV2X2F0dHJfbWVtX2luZm9fdnJhbV91c2VkKTsKPj4+ICAgIAlpZiAocmV0
KSB7Cj4+PiAgICAJCURSTV9FUlJPUigiRmFpbGVkIHRvIGNyZWF0ZSBkZXZpY2UgZmlsZSBtZW1f
aW5mb192cmFtX3VzZWRcbiIpOwo+Pj4gLQkJcmV0dXJuIHJldDsKPj4+ICsJCWdvdG8gVlJBTV9V
U0VEX0ZBSUw7Cj4+PiAgICAJfQo+Pj4gICAgCXJldCA9IGRldmljZV9jcmVhdGVfZmlsZShhZGV2
LT5kZXYsICZkZXZfYXR0cl9tZW1faW5mb192aXNfdnJhbV91c2VkKTsKPj4+ICAgIAlpZiAocmV0
KSB7Cj4+PiAgICAJCURSTV9FUlJPUigiRmFpbGVkIHRvIGNyZWF0ZSBkZXZpY2UgZmlsZSBtZW1f
aW5mb192aXNfdnJhbV91c2VkXG4iKTsKPj4+IC0JCXJldHVybiByZXQ7Cj4+PiArCQlnb3RvIFZJ
U19WUkFNX1VTRURfRkFJTDsKPj4+ICAgIAl9Cj4+PiAgICAJcmV0ID0gZGV2aWNlX2NyZWF0ZV9m
aWxlKGFkZXYtPmRldiwgJmRldl9hdHRyX21lbV9pbmZvX3ZyYW1fdmVuZG9yKTsKPj4+ICAgIAlp
ZiAocmV0KSB7Cj4+PiAgICAJCURSTV9FUlJPUigiRmFpbGVkIHRvIGNyZWF0ZSBkZXZpY2UgZmls
ZSBtZW1faW5mb192cmFtX3ZlbmRvclxuIik7Cj4+PiAtCQlyZXR1cm4gcmV0Owo+Pj4gKwkJZ290
byBWUkFNX1ZFUkRPUl9GQUlMOwo+Pj4gICAgCX0KPj4+ICAgIAo+Pj4gICAgCXJldHVybiAwOwo+
Pj4gKwo+Pj4gK1ZSQU1fVkVSRE9SX0ZBSUw6Cj4+PiArCWRldmljZV9yZW1vdmVfZmlsZShhZGV2
LT5kZXYsICZkZXZfYXR0cl9tZW1faW5mb192aXNfdnJhbV91c2VkKTsKPj4+ICtWSVNfVlJBTV9V
U0VEX0ZBSUw6Cj4+PiArCWRldmljZV9yZW1vdmVfZmlsZShhZGV2LT5kZXYsICZkZXZfYXR0cl9t
ZW1faW5mb192cmFtX3VzZWQpOwo+Pj4gK1JWQU1fVVNFRF9GQUlMOgo+Pj4gKwlkZXZpY2VfcmVt
b3ZlX2ZpbGUoYWRldi0+ZGV2LCAmZGV2X2F0dHJfbWVtX2luZm9fdmlzX3ZyYW1fdG90YWwpOwo+
Pj4gK1ZJU19WUkFNX1RPVEFfRkFJTDoKPj4+ICsJZGV2aWNlX3JlbW92ZV9maWxlKGFkZXYtPmRl
diwgJmRldl9hdHRyX21lbV9pbmZvX3ZyYW1fdG90YWwpOwo+Pj4gK1ZSQU1fVE9UQUxfRkFJTDoK
Pj4+ICsJa2ZyZWUobWdyKTsKPj4+ICsJbWFuLT5wcml2ID0gTlVMTDsKPj4+ICsKPj4+ICsJcmV0
dXJuIHJldDsKPj4+ICAgIH0KPj4+ICAgIAo+Pj4gICAgLyoqCj4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=

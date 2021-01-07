Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D18572ED607
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 18:50:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 878196E49C;
	Thu,  7 Jan 2021 17:50:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2088.outbound.protection.outlook.com [40.107.93.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F3806E49C
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jan 2021 17:50:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cXSBxPqa7RkT9eZ+9VrcKB+u3O352xiObA06KhsjiukdbFD4y5UBYpSzUBCjUh0g+YzsNwQAc1EW8AWf1PWryuYQOfWalJ52bbeg1rmyWqWc1CcTm588oOt3Rhsg/jiuzDLd9tzNNgdhwW0x2QiqHAGo0CkZieqajDWOX0Acohe66Jjt/7n06aicGUcrCUQENU/VO3w6upgNZlRGQ5Y6FlpRroNiJVUaX8ts3VXOI3QB/VP6GrTp99Vi43XH4yKMcJdACAJA0aOWEhkUaTaZZDUrEfaJm+CEf2HS1aBMqWWsztMYSh1YofF8oIhga5VrF8xygl24Adad7aWX0Yxgaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sg/CDzXyze3tWUJxj0mz1HiBNVrEWG7Jo2YIZ4wHVUk=;
 b=lRAbROB/o7M3+hXHDCtR4qjyDcFabWowkDQ42dDDGR5v7mnOrGYceD7m2C00hMPfOtYgJxIBFmCEoRuk980zmdYfR5KtjDVCej4QEwT5TajVXShCoiluWFX6eBIrmm15gA6nb91ygQs2h6tNDQZui2lIzFh/YeC1kdNCeLEjZjVXHSGftSXtKe5nxfHMvnyVxBjEdCcBRf6qfLyhPxOd3TwiSnbGBSxdiKM4TuWji+R9jSiI2vjECE8i0HjGoWlzNy84GFHFbRxswyIVYcjmmVYwoOpUOg47UAWT9Sz4IIiwWnLMH7dOPK32XZFy9eCNgXXVZKObDtXRWxW+X2toPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sg/CDzXyze3tWUJxj0mz1HiBNVrEWG7Jo2YIZ4wHVUk=;
 b=fC9Pd8JQuIWgGTx0qc0tFEvyoP3CgaJ4qKoF97572WQNwYRmi/zpWCe1wkZc66cmo5YrmWAfOekMQZlugs64F7QNRZDljqoC8eLj6+U9KAjyX1bJ89qsAymHzJN42fLvHtQDRcUP/AFr3Ynrm5/Jo/0a3s17e3WESx8Zb9yF64U=
Authentication-Results: google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3916.namprd12.prod.outlook.com (2603:10b6:5:1ca::21)
 by DM6PR12MB3066.namprd12.prod.outlook.com (2603:10b6:5:11a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Thu, 7 Jan
 2021 17:50:50 +0000
Received: from DM6PR12MB3916.namprd12.prod.outlook.com
 ([fe80::f872:3677:28c3:660b]) by DM6PR12MB3916.namprd12.prod.outlook.com
 ([fe80::f872:3677:28c3:660b%5]) with mapi id 15.20.3721.024; Thu, 7 Jan 2021
 17:50:50 +0000
From: Nirmoy Das <nirmoy.das@amd.com>
To: bhelgaas@google.com
Subject: [PATCH 2/4] PCI: Add pci_rebar_bytes_to_size()
Date: Thu,  7 Jan 2021 18:50:15 +0100
Message-Id: <20210107175017.15893-3-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210107175017.15893-1-nirmoy.das@amd.com>
References: <20210107175017.15893-1-nirmoy.das@amd.com>
X-Originating-IP: [217.86.111.165]
X-ClientProxiedBy: AM0PR03CA0093.eurprd03.prod.outlook.com
 (2603:10a6:208:69::34) To DM6PR12MB3916.namprd12.prod.outlook.com
 (2603:10b6:5:1ca::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from brihaspati.fritz.box (217.86.111.165) by
 AM0PR03CA0093.eurprd03.prod.outlook.com (2603:10a6:208:69::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Thu, 7 Jan 2021 17:50:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1659d772-1a1e-4a33-07b1-08d8b334c536
X-MS-TrafficTypeDiagnostic: DM6PR12MB3066:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB3066DD336F5BC4B6F31333308BAF0@DM6PR12MB3066.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:586;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8fZVVfVQKUhK4jHgy0xx2FcF5EODaYXNclS8auonvf6NDsJnnpZhztuNSHp/N6VmU6EAiTBsP9NNZRtdd268f2SnW9Q18Zg1A8MbJUFD0zqtejNYn89P+XLsbnaE/0+JYFJFtjuTWP299mswkTFuw5BNMVgLbCslxytGijBmOakD8tVBeWIaSA2cCSIZrEUBG2uod1zPeO5d5OLlop/5k/TYhkD5U9TWOJalyBlY0+8a0cuOYaRIAOMfboz2xrg7iii62QMe1jCNL6yHfYr1CxnM5Dfc/IYnK3xxLuA8iW9hI10GEpqsQd7oVAFOmDIz087AsxImzn5EAi+pXVZ7gU3bS8lIoYiJgbNzQ/bFIP6W+jLC7OS2NcEWyp2k8qmCyXGFKFur6G2eHzPq+1mWjQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3916.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(376002)(136003)(39860400002)(396003)(4326008)(6916009)(316002)(1076003)(66574015)(83380400001)(478600001)(6486002)(54906003)(36756003)(26005)(66476007)(66556008)(5660300002)(8936002)(66946007)(2616005)(16526019)(44832011)(2906002)(52116002)(6506007)(8676002)(86362001)(6666004)(956004)(6512007)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ajJyWnJpTWpISVpCa2xXYksxUUJqVzFpMHZFN053ZkYzYWFLU29BTjBkUGhF?=
 =?utf-8?B?aGc1WXlzTWkydjNrOGxqdTRocjdpQTNFakFqNFZPeEpWa3VjYmFTc1BlRUJr?=
 =?utf-8?B?YzZ1YUhZMStMWnl4eXFSRFFSMURqdU1GVytmZTJ3UHFkTC9VbE5vb1ZuVXNy?=
 =?utf-8?B?ZThaTzUzVTVmL0NkaE5STjR4a0pHeWhEclpqWkhZcWJTNlRDQUJJbjFMTkFH?=
 =?utf-8?B?MmtweDJlNHczUk5VSW1aZFJ3eU5BRHBJNjkyaG1nTnpJMTV6bWZtSEFmSTdF?=
 =?utf-8?B?RE1LTThBanA2V3NLMk91Z2xkVnc4NlBteTYxY2J6VkIvVXB6QmRWQkJvWWF1?=
 =?utf-8?B?RnlqS25pWjl0TlZSeTJuS3lQT1VWcHNiVUlqWVlicFp4c052UHhXd1Mrek1S?=
 =?utf-8?B?dHpha1lwcEpOMy9OY2UzdWFwVEYvaXE3NWJUZ1kxWDdnTXo0UU9NSUFQVmRh?=
 =?utf-8?B?SEVqOUhRckFzVExaclNTV2JDRHhKUDZNckdnV3BPTFBKQStxc3p5VGFSWlo3?=
 =?utf-8?B?QW5jOHlJWHhrKzllZ3UzZGY1bFZVcFY4K01jK0hZZnU4djVjUGxpUHYyWUdM?=
 =?utf-8?B?TmQ4SDFtcm4xVnk4c1dFM2M0elF4UG91WHZyTFM5V0pWZklYWWFzL2E0L2ZN?=
 =?utf-8?B?dk1YN2tMZlA2WVVDSHlaZFloRW1LbHdtRFIvUC9xZTNyN0pqK1N6djZHc2FT?=
 =?utf-8?B?dHhwQjhJZFQxTkc5WS9GcStTOWp4Q2NBOG1IcTQrbGVrbVlQbUNxcmFhZTRX?=
 =?utf-8?B?c2RzOTNMQ3lmSGhJY1FMODdNOFdLKzRkeHZOSlVCSjZ2OXQvNlNlZGk5Wkc4?=
 =?utf-8?B?c1JoQ2VSYU9UT1g4VjdpSThGSk94bE5CdWNsektNaWlHMEJvNkN3U3FyN1Nh?=
 =?utf-8?B?ejB6OGQ2YWNGRWZOMmNzelpHT2RTSTBWb2pOZlJtdkk3NE5tRFFYdG85dFQ1?=
 =?utf-8?B?NGovMEp3Tnd5UWhFOCticUJmaHdvKzNpYkJWS0RKMmlnRzkwNzIweFR1NXNh?=
 =?utf-8?B?VUhYTE83UGh0dVRLdHpsczB2RW9XcHRNWmtwNmxzb3NWUzZrOHRuYm5icUxY?=
 =?utf-8?B?eERkYUlOTTJmcjNWM3Y3bWMzTy9mbGhIQ1YvTVpuYTJUV3diV1NYb3hjU1FT?=
 =?utf-8?B?a04xNTlOQ3k2Y1dkWHlIYXJjZFUwRk1JcnBFYktLRTJHMHdTai9ZNEpCYSs0?=
 =?utf-8?B?RWVaNmhIbWJvU1kxSDhWYlFsNzhtenZTVko2cWFVajR2eklKRndzKzZuR29h?=
 =?utf-8?B?VzV4RHR6MHI4N0JldXRFODhpam44ZE1BR0ducXVYSEg5R255dE43UHNZUXZJ?=
 =?utf-8?Q?fhHJbS2zEG8yj1EaaIs5IN1PyWt9VdspsN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3916.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2021 17:50:50.0039 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 1659d772-1a1e-4a33-07b1-08d8b334c536
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cvmwmxmnAHZyZeyNm+GhAqb96CSZkvyjrdQvBLiS+FL7R7PgdhYzE0pXLLBEkidf24ITTHsPCF8xKc2vogT67A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3066
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
Cc: ckoenig.leichtzumerken@gmail.com, dri-devel@lists.freedesktop.org,
 Nirmoy Das <nirmoy.das@amd.com>, linux-pci@vger.kernel.org,
 devspam@moreofthesa.me.uk,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VXNlcnMgb2YgcGNpX3Jlc2l6ZV9yZXNvdXJjZSgpIG5lZWQgYSB3YXkgdG8gY2FsY3VsYXRlIGJh
ciBzaXplCmZyb20gZGVzaXJlZCBieXRlcy4gQWRkIGEgaGVscGVyIGZ1bmN0aW9uIGFuZCBleHBv
cnQgaXQgc28gdGhhdAptb2R1bGFyIGRyaXZlcnMgY2FuIHVzZSBpdC4KClNpZ25lZC1vZmYtYnk6
IERhcnJlbiBTYWx0IDxkZXZzcGFtQG1vcmVvZnRoZXNhLm1lLnVrPgpTaWduZWQtb2ZmLWJ5OiBD
aHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6
IE5pcm1veSBEYXMgPG5pcm1veS5kYXNAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL3BjaS9wY2kuYyAg
IHwgMiArLQogaW5jbHVkZS9saW51eC9wY2kuaCB8IDYgKysrKysrCiAyIGZpbGVzIGNoYW5nZWQs
IDcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGNp
L3BjaS5jIGIvZHJpdmVycy9wY2kvcGNpLmMKaW5kZXggZWY4MGVkNDUxNDE1Li4xNjIxNjE4NmI1
MWMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcGNpL3BjaS5jCisrKyBiL2RyaXZlcnMvcGNpL3BjaS5j
CkBAIC0xNjQ4LDcgKzE2NDgsNyBAQCBzdGF0aWMgdm9pZCBwY2lfcmVzdG9yZV9yZWJhcl9zdGF0
ZShzdHJ1Y3QgcGNpX2RldiAqcGRldikKIAkJcGNpX3JlYWRfY29uZmlnX2R3b3JkKHBkZXYsIHBv
cyArIFBDSV9SRUJBUl9DVFJMLCAmY3RybCk7CiAJCWJhcl9pZHggPSBjdHJsICYgUENJX1JFQkFS
X0NUUkxfQkFSX0lEWDsKIAkJcmVzID0gcGRldi0+cmVzb3VyY2UgKyBiYXJfaWR4OwotCQlzaXpl
ID0gaWxvZzIocmVzb3VyY2Vfc2l6ZShyZXMpKSAtIDIwOworCQlzaXplID0gcGNpX3JlYmFyX2J5
dGVzX3RvX3NpemUocmVzb3VyY2Vfc2l6ZShyZXMpKTsKIAkJY3RybCAmPSB+UENJX1JFQkFSX0NU
UkxfQkFSX1NJWkU7CiAJCWN0cmwgfD0gc2l6ZSA8PCBQQ0lfUkVCQVJfQ1RSTF9CQVJfU0hJRlQ7
CiAJCXBjaV93cml0ZV9jb25maWdfZHdvcmQocGRldiwgcG9zICsgUENJX1JFQkFSX0NUUkwsIGN0
cmwpOwpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9wY2kuaCBiL2luY2x1ZGUvbGludXgvcGNp
LmgKaW5kZXggOTk5OTA0MGNmYWQ5Li43N2ZlZDAxNTIzZTAgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUv
bGludXgvcGNpLmgKKysrIGIvaW5jbHVkZS9saW51eC9wY2kuaApAQCAtMTIyNiw2ICsxMjI2LDEy
IEBAIHZvaWQgcGNpX3VwZGF0ZV9yZXNvdXJjZShzdHJ1Y3QgcGNpX2RldiAqZGV2LCBpbnQgcmVz
bm8pOwogaW50IF9fbXVzdF9jaGVjayBwY2lfYXNzaWduX3Jlc291cmNlKHN0cnVjdCBwY2lfZGV2
ICpkZXYsIGludCBpKTsKIGludCBfX211c3RfY2hlY2sgcGNpX3JlYXNzaWduX3Jlc291cmNlKHN0
cnVjdCBwY2lfZGV2ICpkZXYsIGludCBpLCByZXNvdXJjZV9zaXplX3QgYWRkX3NpemUsIHJlc291
cmNlX3NpemVfdCBhbGlnbik7CiB2b2lkIHBjaV9yZWxlYXNlX3Jlc291cmNlKHN0cnVjdCBwY2lf
ZGV2ICpkZXYsIGludCByZXNubyk7CitzdGF0aWMgaW5saW5lIGludCBwY2lfcmViYXJfYnl0ZXNf
dG9fc2l6ZSh1NjQgYnl0ZXMpCit7CisJYnl0ZXMgPSByb3VuZHVwX3Bvd19vZl90d28oYnl0ZXMp
OworCXJldHVybiBtYXgoaWxvZzIoYnl0ZXMpLCAyMCkgLSAyMDsKK30KKwogdTMyIHBjaV9yZWJh
cl9nZXRfcG9zc2libGVfc2l6ZXMoc3RydWN0IHBjaV9kZXYgKnBkZXYsIGludCBiYXIpOwogaW50
IF9fbXVzdF9jaGVjayBwY2lfcmVzaXplX3Jlc291cmNlKHN0cnVjdCBwY2lfZGV2ICpkZXYsIGlu
dCBpLCBpbnQgc2l6ZSk7CiBpbnQgcGNpX3NlbGVjdF9iYXJzKHN0cnVjdCBwY2lfZGV2ICpkZXYs
IHVuc2lnbmVkIGxvbmcgZmxhZ3MpOwotLSAKMi4yOS4yCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

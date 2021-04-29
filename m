Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B6336E5C9
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 09:18:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12DAF6ED34;
	Thu, 29 Apr 2021 07:18:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A51A56ED22;
 Thu, 29 Apr 2021 07:18:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OGR7Fh6CBRR/qxms65Ptv0wiI+Ddh7MqP4obK6+RYnWxVIVy3SCftYnDRoloqMIz7GEi6japFpPWvSeV5ZMkduDlIPBMk7OPGuMMXnv3IQx3nBcfJ9k0oIh3kQL0nYy8oAXIxUaJAjC8RW0nluW7WLI59ER6iWxQzD4+Bdk9RKLd6N18Y9c4GJye+ykHCQIOuUf8yZSMD9i16hOCA92hlmcnbpj2PFhVWtLYnnbr9nYcpPXWbWiGdYQ5kKS8Je1g43c37TmITaZ1aEODtre+ayxaXQeq79gffS1o+SYFiiTWGD1kHBtF6y43MVIed3Rnei90wLRir2bga0mKrLE0Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sn6oMAWRlInr2XLygHlYtSVveNrUgJMJFc+EnkhdLtM=;
 b=nB8TrrP16QrLPDJHvG85IOCHGwdg1utraaCxWMq+EM4DyXrM1+/zMH2EXjAgVKb27jXITNGFc7bezWO+XYPb08s9qL+Mp606tYR26eL2FMsm7ZdhOFypOgX7mXU3diQIO4algex+1Hxtgkor5G4Gwae81KUCTwsvyvbI6SJ1G1IeMkV+70T/k58amnI6dGwDEOLQUOz5SXMUqY1tgvryy4OWFz54xnqJ19+vf2cE002UrcsoIJfS2u1NsZrvTZZXzatoPh5XWJXWTRdCHb60i0Y9uGgpngabxERsPI6HBVZH8ylbOktHNLg6Sf2J4V5QUnRUgeCUp6PQkcW0SIts9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sn6oMAWRlInr2XLygHlYtSVveNrUgJMJFc+EnkhdLtM=;
 b=ovd4+Tpwo0TKu2gvyPqGABKo9uQi/2UGHz7Eorbx+Od64i/BmwtYikijWOPpYaP39qWfpjg1QvCfrKD3Lq3Mv4O1bkpyt+NxiF6gC8WPIl4t8h/JfrLkR5bVsY7jQ1e4pjf+X62freFoHglaAELSIowfnIh3Z3L9JrvCKqc5beA=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4816.namprd12.prod.outlook.com (2603:10b6:208:1b5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.23; Thu, 29 Apr
 2021 07:18:20 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4065.029; Thu, 29 Apr 2021
 07:18:20 +0000
Subject: Re: [PATCH v5 15/27] drm/scheduler: Fix hang when sched_entity
 released
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, ckoenig.leichtzumerken@gmail.com,
 daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
References: <20210428151207.1212258-1-andrey.grodzovsky@amd.com>
 <20210428151207.1212258-16-andrey.grodzovsky@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <a8314d77-578f-e0df-5c49-77d5f10c76c7@amd.com>
Date: Thu, 29 Apr 2021 09:18:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210428151207.1212258-16-andrey.grodzovsky@amd.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:49f7:8b5a:d7ab:5e3e]
X-ClientProxiedBy: AM3PR04CA0140.eurprd04.prod.outlook.com (2603:10a6:207::24)
 To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:49f7:8b5a:d7ab:5e3e]
 (2a02:908:1252:fb60:49f7:8b5a:d7ab:5e3e) by
 AM3PR04CA0140.eurprd04.prod.outlook.com (2603:10a6:207::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.25 via Frontend Transport; Thu, 29 Apr 2021 07:18:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf8c16dd-e58d-4e42-73a1-08d90adef750
X-MS-TrafficTypeDiagnostic: MN2PR12MB4816:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB48163EC124944473A8DD1615835F9@MN2PR12MB4816.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1360;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UeQ0I3f0LJbbSJVp4piBsxS6nKAh9+leU1Z1m+SmVuZUzdLdZGQmB835h7v3Yyi5hiReS7lySnezuwIABCK6+awGTXGh8cXSL65Cxp7x0uzihRLmQSmSzqnD8rXQ3UYk/BYLTsUecHMSPcNFBp1RlLSFBzWR/MUbo5jhzsKn43+nvodFCKH2MMto2tNu+fLo4XZuIOYWOTRPYGOkiULH5FCZfrjlbso3NotsX0ZVk/uCt9YKD5FCUgVXtsKVbCAJ5/GaZZlNInEahnA20dkrpAyDHDwarQAYfvHoYszBrVdzg1WrJwaJ6fEm0FOsNc0zbMZP3DMMLBRZaatUeSWB6nmGvDGL+RNEwMi1ohrHUzYCnm1VSFGFvK20617TUKuYlcDr9ez3kphqeIHW7aZJEkIFTdS1k3wNZP4BiSrPT4Pyl/NfYJsx4jWndYFrUhFGvCSJrZKoL21gFYQue67gi/YtUlWz31/RRVdEO/qwpSY5I8dqdfLfafvWMk3fPSQUf544FSX1px/6m0ADAe5KhoA4QuEZFYcjKB7FHc7LMFSTvj01AeJSTy+L5/5z3x7xYoQPIvcg0MUqV4QM/YPRVb+xaAkj1byJEch0qU+kS8r7qXWPdlNPURyjYBOs+0eEcVN9Pxvdmr6ybm2oWu/oiYSMG5dumUqXn/VRYYVYNPSV/cFZ0XclMfbM/TWWlR7z
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(396003)(136003)(39860400002)(366004)(316002)(478600001)(6486002)(5660300002)(66556008)(36756003)(66476007)(31696002)(6636002)(66946007)(8676002)(66574015)(8936002)(83380400001)(31686004)(2616005)(86362001)(16526019)(52116002)(186003)(6666004)(38100700002)(4326008)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?YVpjelo0MGVpSEUwT25ObWFQMmw4V1FLVmNSb24ydERWMlJHeDNzMEw2UUFB?=
 =?utf-8?B?d1I0cjNrVytPSG13bklTMWJVTUlMVjI5bGxOMnRNQ2lEYVhMZFp5VzROVTd6?=
 =?utf-8?B?Vkd2eDRMWFRNWE9yQWxnbkpmTWFXL2tiZVJ0OUErVWpmNjhtcGdFTW54d2NK?=
 =?utf-8?B?WGdQc3V3U1crZE9yb3pleXNINEl3QnZlN3BIc1N5S0ZteXRSdzBOeDZqL2lF?=
 =?utf-8?B?UG1WaVFYMHBMWFVURFlHRFU4MjY3cm5WK1ZDRy9xd1Bxa3hHUzlQVzVIVk4r?=
 =?utf-8?B?dHdGdENpY2Eyd2s3M2tWK1ZMcVpGbldqRFJjQjFSRkZQaXhpWW9NV1pPeU54?=
 =?utf-8?B?SFNPWTZFQldrVXRrN3Frdm0wZkdmalNXeko3SzlyZFpEd21VcnRQWnU0Vk5h?=
 =?utf-8?B?L3RIUTZiN25rSjI1VTE1YnhLWEhvaDczbCtUeVZIMTFxUlltTndKRDJJSEFU?=
 =?utf-8?B?cU1ZTmFLbFBsUlJvVlZUNzk4RkpmUFV3cnN0N3lhOTJsQW1uRWNZbHdMVzVz?=
 =?utf-8?B?a1hVQkpJN0hqZWQrUXFKbzNmd050M2NtMUd5NVEwY0lEZFY4c2dDL0FoMENs?=
 =?utf-8?B?OE1qdTNiWlQxbUdwbjFqcGVBT2dpUlBPMDVwSTJLUXRJTitwdkNLM2t3dmpY?=
 =?utf-8?B?SGsrMUd0ZEVjZnBXYkQ1RXRlT0g2Z1BMcmNLM2dlaVp2ZXBSM2VybmJwWEJi?=
 =?utf-8?B?YWs2WlFOUVVqV1BzUldORVpkd2wrSGFUNVl2bjNvdUhzTG9STFB5bTNYZk5u?=
 =?utf-8?B?STVhRU1zTGJIa0pIYmRsZ3d6QUcxSisrZFo1SGkxY0ZENTdVTnA1QmpBdmJ5?=
 =?utf-8?B?a25kTkVGNExXZUJTOWVWZmJlUThpWkhUcHUzc2xIOTg0VmoxVFA1bmVjUE1h?=
 =?utf-8?B?Uy9lOXBnMDcxMVRGbk1uMlBhN3hPaytjRGdEQVN1TjlTRnJ5M0hMcitvdzhR?=
 =?utf-8?B?QmNLVStxMU5hVEhDRCtrTzlsM2tFUTYxVythU2lqMEF2UUN6aFZja2RraStj?=
 =?utf-8?B?T3FJWWVQNDBGVHNUZmJYd2lFeFNaaFo3ZEVHaC9ScERpZUZYbFZ5ZWVUdzRq?=
 =?utf-8?B?QWRXN1ZIQTNLWlkwR2N6OUJsc0NqS3FsQ1VkZnluc2RyczhIYkwwbmpQaEtU?=
 =?utf-8?B?bE9rWmJ0R215ZkNiL2FIaHI2aDZ5WlhYdmtjdWhrbE83ZytnQjY3bWdHR2FQ?=
 =?utf-8?B?a0ZwNzFKa21zY0dRWkdhOS9CUFh2VkNLNWhUZkxxa1dEb1N6YlRMQkJTd3lT?=
 =?utf-8?B?ZzkvSGpIZUxIczhneUxXMTA2MzlRZW1CcjdZYXVKZkR2bG5ZeVFCV1lCSjN2?=
 =?utf-8?B?RFhCNHo5bVphbFN1R2NhRHZXUFR6TmFPcTFHcFhkMktMN0dPUCtPcldpVktG?=
 =?utf-8?B?NUtZQzRUcTYvZm1TQXNJMHB5SHpRak9Ld040dnJxamJwTzZYMnBzTTU0K0lx?=
 =?utf-8?B?L21aSUg2WTNwd3VHQTdFT2hKRmcyYk1QMFBNdWp1ZktTWWhYMlNpZjhrdzQ0?=
 =?utf-8?B?Wm01YldMN1FYV0U1VjdTd05nQ1dmN3Y2ZFljNmtmRjQzaGJ0dnRMSDNqdFgy?=
 =?utf-8?B?ZnFDRFRlWmRGSmNIRmNTeXJlalNtQUVFNWhxUmRreUFmU0R5RW42U3cvZ09I?=
 =?utf-8?B?RjZTR1RZTDh5QS9VMDExTWdjRTF3NVQrZ3o2THFkUnVBRU91MjhCZW43UVU3?=
 =?utf-8?B?ekxydGFjWW9QaGV2K3RXV2NwbndpUmY3d21DdlpCNmV6WXNUa0hQd2YwTVZG?=
 =?utf-8?B?YmtISVUzM1ZiZ1VlYTVER0x4QXo5WFdsSmo4Q0x2Y2daR1RVYzVkWWxETXAz?=
 =?utf-8?B?WTJNRFhSSWVpb1cxYTBBUEE2cDE3Nk8xV1AzejZ6OVNWaVdGUUM3azQyZ3B1?=
 =?utf-8?Q?7++2nirJhLb3L?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf8c16dd-e58d-4e42-73a1-08d90adef750
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2021 07:18:20.0716 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VdzjZeqDnn7zVbnMjqJzySlaEmwL4KhI5Oxj4QxtWNQ1T5y/yQRPNeLbZl0rIrec
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4816
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
Cc: Alexander.Deucher@amd.com, gregkh@linuxfoundation.org, helgaas@kernel.org,
 Felix.Kuehling@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SSBuZWVkIHRvIHRha2UgYW5vdGhlciBsb29rIGF0IHRoaXMgcGFydCB3aGVuIEkgZG9uJ3QgaGF2
ZSBhIG1hc3NpdmUgCmhlYWRhY2hlIGFueSBtb3JlLgoKTWF5YmUgc3BsaXQgdGhlIHBhdGNoIHNl
dCB1cCBpbnRvIGRpZmZlcmVudCBwYXJ0cywgc29tZXRoaW5nIGxpa2U6CjEuIEFkZGluZyBnZW5l
cmFsIGluZnJhc3RydWN0dXJlLgoyLiBNYWtpbmcgc3VyZSBhbGwgbWVtb3J5IGlzIHVucG9sYXRl
ZC4KMy4gSm9iIGFuZCBmZW5jZSBoYW5kbGluZwoKQ2hyaXN0aWFuLgoKQW0gMjguMDQuMjEgdW0g
MTc6MTEgc2NocmllYiBBbmRyZXkgR3JvZHpvdnNreToKPiBQcm9ibGVtOiBJZiBzY2hlZHVsZXIg
aXMgYWxyZWFkeSBzdG9wcGVkIGJ5IHRoZSB0aW1lIHNjaGVkX2VudGl0eQo+IGlzIHJlbGVhc2Vk
IGFuZCBlbnRpdHkncyBqb2JfcXVldWUgbm90IGVtcHR5IEkgZW5jb3VudHJlZAo+IGEgaGFuZyBp
biBkcm1fc2NoZWRfZW50aXR5X2ZsdXNoLiBUaGlzIGlzIGJlY2F1c2UgZHJtX3NjaGVkX2VudGl0
eV9pc19pZGxlCj4gbmV2ZXIgYmVjb21lcyBmYWxzZS4KPgo+IEZpeDogSW4gZHJtX3NjaGVkX2Zp
bmkgZGV0YWNoIGFsbCBzY2hlZF9lbnRpdGllcyBmcm9tIHRoZQo+IHNjaGVkdWxlcidzIHJ1biBx
dWV1ZXMuIFRoaXMgd2lsbCBzYXRpc2Z5IGRybV9zY2hlZF9lbnRpdHlfaXNfaWRsZS4KPiBBbHNv
IHdha2V1cCBhbGwgdGhvc2UgcHJvY2Vzc2VzIHN0dWNrIGluIHNjaGVkX2VudGl0eSBmbHVzaGlu
Zwo+IGFzIHRoZSBzY2hlZHVsZXIgbWFpbiB0aHJlYWQgd2hpY2ggd2FrZXMgdGhlbSB1cCBpcyBz
dG9wcGVkIGJ5IG5vdy4KPgo+IHYyOgo+IFJldmVyc2Ugb3JkZXIgb2YgZHJtX3NjaGVkX3JxX3Jl
bW92ZV9lbnRpdHkgYW5kIG1hcmtpbmcKPiBzX2VudGl0eSBhcyBzdG9wcGVkIHRvIHByZXZlbnQg
cmVpbnNlcmlvbiBiYWNrIHRvIHJxIGR1ZQo+IHRvIHJhY2UuCj4KPiB2MzoKPiBEcm9wIGRybV9z
Y2hlZF9ycV9yZW1vdmVfZW50aXR5LCBvbmx5IG1vZGlmeSBlbnRpdHktPnN0b3BwZWQKPiBhbmQg
Y2hlY2sgZm9yIGl0IGluIGRybV9zY2hlZF9lbnRpdHlfaXNfaWRsZQo+Cj4gU2lnbmVkLW9mZi1i
eTogQW5kcmV5IEdyb2R6b3Zza3kgPGFuZHJleS5ncm9kem92c2t5QGFtZC5jb20+Cj4gUmV2aWV3
ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiAtLS0K
PiAgIGRyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfZW50aXR5LmMgfCAgMyArKy0KPiAg
IGRyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jICAgfCAyNCArKysrKysrKysr
KysrKysrKysrKysrKysKPiAgIDIgZmlsZXMgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2No
ZWRfZW50aXR5LmMgYi9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX2VudGl0eS5jCj4g
aW5kZXggZjA3OTBlOTQ3MWQxLi5jYjU4ZjY5MmRhZDkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3NjaGVkdWxlci9zY2hlZF9lbnRpdHkuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9z
Y2hlZHVsZXIvc2NoZWRfZW50aXR5LmMKPiBAQCAtMTE2LDcgKzExNiw4IEBAIHN0YXRpYyBib29s
IGRybV9zY2hlZF9lbnRpdHlfaXNfaWRsZShzdHJ1Y3QgZHJtX3NjaGVkX2VudGl0eSAqZW50aXR5
KQo+ICAgCXJtYigpOyAvKiBmb3IgbGlzdF9lbXB0eSB0byB3b3JrIHdpdGhvdXQgbG9jayAqLwo+
ICAgCj4gICAJaWYgKGxpc3RfZW1wdHkoJmVudGl0eS0+bGlzdCkgfHwKPiAtCSAgICBzcHNjX3F1
ZXVlX2NvdW50KCZlbnRpdHktPmpvYl9xdWV1ZSkgPT0gMCkKPiArCSAgICBzcHNjX3F1ZXVlX2Nv
dW50KCZlbnRpdHktPmpvYl9xdWV1ZSkgPT0gMCB8fAo+ICsJICAgIGVudGl0eS0+c3RvcHBlZCkK
PiAgIAkJcmV0dXJuIHRydWU7Cj4gICAKPiAgIAlyZXR1cm4gZmFsc2U7Cj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jIGIvZHJpdmVycy9ncHUvZHJt
L3NjaGVkdWxlci9zY2hlZF9tYWluLmMKPiBpbmRleCA5MDhiMGI1NjAzMmQuLmJhMDg3MzU0ZDBh
OCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYwo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jCj4gQEAgLTg5Nyw5
ICs4OTcsMzMgQEAgRVhQT1JUX1NZTUJPTChkcm1fc2NoZWRfaW5pdCk7Cj4gICAgKi8KPiAgIHZv
aWQgZHJtX3NjaGVkX2Zpbmkoc3RydWN0IGRybV9ncHVfc2NoZWR1bGVyICpzY2hlZCkKPiAgIHsK
PiArCXN0cnVjdCBkcm1fc2NoZWRfZW50aXR5ICpzX2VudGl0eTsKPiArCWludCBpOwo+ICsKPiAg
IAlpZiAoc2NoZWQtPnRocmVhZCkKPiAgIAkJa3RocmVhZF9zdG9wKHNjaGVkLT50aHJlYWQpOwo+
ICAgCj4gKwlmb3IgKGkgPSBEUk1fU0NIRURfUFJJT1JJVFlfQ09VTlQgLSAxOyBpID49IERSTV9T
Q0hFRF9QUklPUklUWV9NSU47IGktLSkgewo+ICsJCXN0cnVjdCBkcm1fc2NoZWRfcnEgKnJxID0g
JnNjaGVkLT5zY2hlZF9ycVtpXTsKPiArCj4gKwkJaWYgKCFycSkKPiArCQkJY29udGludWU7Cj4g
Kwo+ICsJCXNwaW5fbG9jaygmcnEtPmxvY2spOwo+ICsJCWxpc3RfZm9yX2VhY2hfZW50cnkoc19l
bnRpdHksICZycS0+ZW50aXRpZXMsIGxpc3QpCj4gKwkJCS8qCj4gKwkJCSAqIFByZXZlbnRzIHJl
aW5zZXJ0aW9uIGFuZCBtYXJrcyBqb2JfcXVldWUgYXMgaWRsZSwKPiArCQkJICogaXQgd2lsbCBy
ZW1vdmVkIGZyb20gcnEgaW4gZHJtX3NjaGVkX2VudGl0eV9maW5pCj4gKwkJCSAqIGV2ZW50dWFs
bHkKPiArCQkJICovCj4gKwkJCXNfZW50aXR5LT5zdG9wcGVkID0gdHJ1ZTsKPiArCQlzcGluX3Vu
bG9jaygmcnEtPmxvY2spOwo+ICsKPiArCX0KPiArCj4gKwkvKiBXYWtldXAgZXZlcnlvbmUgc3R1
Y2sgaW4gZHJtX3NjaGVkX2VudGl0eV9mbHVzaCBmb3IgdGhpcyBzY2hlZHVsZXIgKi8KPiArCXdh
a2VfdXBfYWxsKCZzY2hlZC0+am9iX3NjaGVkdWxlZCk7Cj4gKwo+ICAgCS8qIENvbmZpcm0gbm8g
d29yayBsZWZ0IGJlaGluZCBhY2Nlc3NpbmcgZGV2aWNlIHN0cnVjdHVyZXMgKi8KPiAgIAljYW5j
ZWxfZGVsYXllZF93b3JrX3N5bmMoJnNjaGVkLT53b3JrX3Rkcik7Cj4gICAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=

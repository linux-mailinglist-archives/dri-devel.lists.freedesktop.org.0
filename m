Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 923AD34E805
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 14:55:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2C456E8CE;
	Tue, 30 Mar 2021 12:55:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2058.outbound.protection.outlook.com [40.107.236.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BC0F6E8CD;
 Tue, 30 Mar 2021 12:55:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l0EVsiQiEsaYCWzoW1CRSdW+gZvqcHSJwPkUt6rT9tzJdYC+6c7bCMMyZrDZ0kyPawiDOrrGtVxkWrnxFD6XitX0+6J/A4HEn9iUE5G9wnzX102OgyUG6ofEDGdzPG2PdqzShE+h8nyVT8caj2z2olt4QVAGJYJ4+bs08SVdbMf9vfDzwCfoFDa3gglpEM+Yp8/LMbX6nyH5Ut9XpgqigWXMuNip4nbPDzSc/aE4V254H02lmvXmHDzDHmiaoeEUYPCS9LkNeaUEFsJ7qJ6RK9/bg0QnhR6wRfaF9izeBkS6CdIqyGEBS0OMLs0qP85jkHxeSZovWBkQdyLZmZjw/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xv0jJ67lv4ReE4taYeTjyAIWHwk9KVcIQqH2c0xCBIE=;
 b=nTdqAzvaTQlfbR6V4l6qJHNGyEulERtS+ZJm3XtddNr2vAT5yHqrYOfU2kgrqQgFpIchNSiM1Hn1JKlmkx8P8srQCG1fIvtoP6/AiqzcbXE7Z31QXBPCNI5pHJFEPnqz6Vhx9ZSjh7tYT2B99mLhzkJM3S09TjscfBNfQa7GN+lCC14uxG3V1ui/IYjTeY6sLGqeds3wq6Fwcrq6ndMDazUCjcoadjav40BltCa0CIYzVX2u2KmmYLpNeHs9dp7GNgwFijtysHvNwPRmNFd3xw3Fzro2g7g3Ai2bHIsmpmcQSKByH6GQuB968RA9dKqNDdyhBtjrc/eLxWeVncgDdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xv0jJ67lv4ReE4taYeTjyAIWHwk9KVcIQqH2c0xCBIE=;
 b=lTKJJjyXhMxO/W0h6grvyyfRG5NOm2zynvakyYspt+8gG0LCb0zLlV+f6/XHrTmUhWOuwwAlhHJS4klaTPqOdFqYBw2fVis8rpfXRgdw+ccK+wEIsYpewZ3YWehA30k3gBtYhcyStn/tq4VZkueF0ZPhPSNjckyJG5gUv9a/Yns=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4606.namprd12.prod.outlook.com (2603:10b6:208:3f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.31; Tue, 30 Mar
 2021 12:55:07 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3977.033; Tue, 30 Mar 2021
 12:55:06 +0000
Subject: Re: [PATCH] drm/amdgpu: fix an underflow on non-4KB-page systems
To: Xi Ruoyao <xry111@mengyan1223.wang>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>
References: <20210329175348.26859-1-xry111@mengyan1223.wang>
 <d192e2a8-8baf-0a8c-93a9-9abbad992c7d@gmail.com>
 <be9042b9294bda450659d3cd418c5e8759d57319.camel@mengyan1223.wang>
 <9a11c873-a362-b5d1-6d9c-e937034e267d@gmail.com>
 <bf9e05d4a6ece3e8bf1f732b011d3e54bbf8000e.camel@mengyan1223.wang>
 <84b3911173ad6beb246ba0a77f93d888ee6b393e.camel@mengyan1223.wang>
 <97c520ce107aa4d5fd96e2c380c8acdb63d45c37.camel@mengyan1223.wang>
 <7701fb71-9243-2d90-e1e1-d347a53b7d77@gmail.com>
 <368b9b1b7343e35b446bb1028ccf0ae75dc2adc4.camel@mengyan1223.wang>
 <71e3905a5b72c5b97df837041b19175540ebb023.camel@mengyan1223.wang>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <c3caf16b-584a-3e4c-0104-15bb41613136@amd.com>
Date: Tue, 30 Mar 2021 14:55:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <71e3905a5b72c5b97df837041b19175540ebb023.camel@mengyan1223.wang>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:8ca4:a46e:6aa7:208c]
X-ClientProxiedBy: AM0PR08CA0007.eurprd08.prod.outlook.com
 (2603:10a6:208:d2::20) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:8ca4:a46e:6aa7:208c]
 (2a02:908:1252:fb60:8ca4:a46e:6aa7:208c) by
 AM0PR08CA0007.eurprd08.prod.outlook.com (2603:10a6:208:d2::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.24 via Frontend Transport; Tue, 30 Mar 2021 12:55:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b32fe342-0ff3-4963-0cbb-08d8f37b0b03
X-MS-TrafficTypeDiagnostic: MN2PR12MB4606:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB46060196FF7529870D9E30EA837D9@MN2PR12MB4606.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SsZHLzXKLdfW3QWQUoWf8H5OikYCYu4S5UvCOgl6ahyz54RhwbPx0Xtf4imbHVCkh9S2D76HDDaef7y4EAPCzIsiUZwF/YddpClVYveKD8tHKde4pN4qNbokIoeYdxx90BrAl8E0yN/9Bjw2SQq5j41k0nJ6OtXniKUZm/Agi85ewk4jeHxC2f3Ms3ZZSSd1f3fYHOtQQkBXPYleI7V2DyyPswoSDc8sck6hAPyLqPc+cmK8OT7G3aOnANWywmHwZCPkXBcO1QxssJUOZHF89fdOgAStbaAlu83RxslAGx/WAWNxzjhW3twYh+LBgTF52GI07KOP+RjQpfy8j+aYj/R5KU2/kAW/8ICnb3ul5egLTm5jt3pFfrATrLXNpcK409kUzOA0fIY9LU9rWkKZPhv4TWqT5ugbE0eAV2zdPbAPanAXtDKhu2XgcLtBwfWRcIDY1pXPpjsOf8JqWHYZ2heIC1V2z9p8ixK8Sl86/6rpGNcwgVU/dyjGZvzMERxcPOq7OD4UDhoXEwutx3st61e+GXLvSxTigsDy/xXSN12e6m4l80bxDT1yIwKnDJaObXWQ7g+lAgrJQ0j+zTT8GpFPqM+qpjk+8aRUdlryEhvd+SWK3q+/QFgvd9ZnmYdv56DVNlnQZuIXXe/k4O68z8bwuLNjA4+N8ILei57Jk9XT4RbGP6Co6MygiYfRN65m2gc/XASUi4A3zDVq3dxoGKl+S1wqNNOp1mSRCA4dEok=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(396003)(39850400004)(346002)(366004)(83380400001)(316002)(8936002)(6636002)(16526019)(86362001)(31696002)(38100700001)(53546011)(6486002)(5660300002)(8676002)(4326008)(66946007)(54906003)(36756003)(2906002)(478600001)(186003)(2616005)(6666004)(110136005)(66476007)(66556008)(66574015)(52116002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cGVtMlp1Uy9td0k0anRMSWFCYzBrcm05WTNqNEtkRDdFVm5TMDU0SUhhRXhZ?=
 =?utf-8?B?Z2RDcmM1VEwzKzloWEFFVUI2cjBJOGQ0YVEzRG5FMjNTZ2dSaCtBYUI3V09B?=
 =?utf-8?B?QlVlWnRaMjVVWHRha0Z4R3Z4Y0VxUzF4eVBpVWh0Q2tTOU5DRXNiUUFGWldP?=
 =?utf-8?B?WkNvZ0pFMnZNNVpTejY5dVJ5SkVxc1ArdHZ4SW9xS1kyOGFxOTBvcjNwWER2?=
 =?utf-8?B?dFA2TTlDeFlrOFlBMTg4YlI4bkVtTyt1bHhOQUFCbHJHSGN4TDVVVWJna084?=
 =?utf-8?B?MzNCeWV3YjVkd1Y2SlFRUi9kcnJtTmtMREp2SEsyWXFjYWFCQ1RPWHdETWwv?=
 =?utf-8?B?MmdJMFQ3QkhXT3RvZkRzV3daNUxtSFdHamE3RjZUOEppUnJyaWh5YlRiWVBr?=
 =?utf-8?B?VEczNVFkbmZNZlVXOWJYbEVLVnJLYnM3Qnd5V0ptVHNCTHBDQ1NMbzBzQVhQ?=
 =?utf-8?B?M1FWN0sxeHkyNktrWDJvbjA2d0pqWmt5MjdxQTg1c3Q0WFlnclBJNXY4TjRN?=
 =?utf-8?B?Y0dNa0tLRzllTzRkUlRLNS9FKy9GY3hCaDhWMWRzMVJWdkJkcjBqYWwzdFlQ?=
 =?utf-8?B?aS9PUjU2NGlnZWROU0ozby9DUFU1MzcwTFZwMFRMcEpFcVBMRUlKUE5qR3B6?=
 =?utf-8?B?L3duWGhKZEtuVm94ems4Q2NxbzV3MXpxdlJQTUtsVGlvVnBESndLTEJaMHd2?=
 =?utf-8?B?Q3dWRTlTYVYrRyswUGV3QkpLaG9LOCt1QnJPemtIRTV6Wi9XSExkRjBUNzZM?=
 =?utf-8?B?c21JNHJNOTVsUWFNcC9nL3NaRGNzdHpoekxpTjZQSUdlTlg3MmFZUXN0OVFM?=
 =?utf-8?B?SWdoekZXeVBqODRQa1M4OTNoT1FpbFZKcitJMGtxTk5zZjNYcUNMakVmdURh?=
 =?utf-8?B?NWc4RjNEMUVtWGpvSUc1L05VaXcwaTZ3Q3l1TVJqOU5lMzh0allFTTNmcStZ?=
 =?utf-8?B?Z0lSZUlGSTV2UVd3clFqSjFTdWwxYk9SMXdDSUNjV1lGQXMrNlkzaUtINzVU?=
 =?utf-8?B?UThNbDQyTDkzbGdpZzRvTTFJd1JFbUtaK0o2dnVqTyt5U3hnc2ZPWmU1SHl1?=
 =?utf-8?B?b2tjd1lyNkdHdTN1YmxPOVRXMTRZbkJqZzdONC8wdG16OWxQcjZoWHAyUFIr?=
 =?utf-8?B?RU5pVndhSHhDUFBTK2doSzl5akI2K0thNVBXYmYxcU1JcDB5WkxteVN2MWc0?=
 =?utf-8?B?a20rY2ZoemY5ejNXRUdnM0pLNFg5SjVzTUJrZWpESkpMQlU2cS9qTEhnbE9s?=
 =?utf-8?B?SzlOaFN3U3FsdTBkVE1CVTY2emFqOFFXWGwvL2sya3VRaHUwWXpPalJlWE1p?=
 =?utf-8?B?QnAzZjZ5V280MHdkNTk4NEp2NmJKQXNDT0F1L0pBZ3VsR3AxeGRacEJsWnh2?=
 =?utf-8?B?VXUrSUlaWVoxaUttWUEyTFBjaE1UTGNGYVVGRVVpZm1QR3JMRDFvOWNRbnAx?=
 =?utf-8?B?cTdxS1VTVk1aRVNoRXQ1elBubnFZMUZORkhJWElrK3JObEdzeWZGbktaaE8y?=
 =?utf-8?B?L3ZWS3JTR3RpWHUwK1MzYkQ1MlJKcGNhOHF6UnpZUVhtcXV1ZGVIS1BhOFNs?=
 =?utf-8?B?RUk1cFhYVG1ydmRuUGxHYi80T0NLdklXMXRWTDl5N2RoZ1JyUWFsSHE4QVJh?=
 =?utf-8?B?T29QNHB0NlIweWlGRUttbkFnRjc2SVo4RG01a24vUWRCVFlPdGQvMUZUU3JE?=
 =?utf-8?B?eFpxYnZ6L25WdUxQeFNNYTA2UU5IblpUK0loNFJBczVwc3Rua2NqT1ZUNjFZ?=
 =?utf-8?B?VS9ONjg2MUQrU3dQNDlOODU0dDk0VHYvOTlUbWpmY3ljR2Q3QVF1ZjJUdlov?=
 =?utf-8?B?RGZCdUx6OFBlL0ZGd3pMVlVtcVJ0OUM5aDFKNnhRWnNXYkpkczM1bHJEOEZC?=
 =?utf-8?Q?4Tdf8tNVq03oI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b32fe342-0ff3-4963-0cbb-08d8f37b0b03
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2021 12:55:06.5690 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bsXOK159maAk7rF+VaKRILy0lH0LXy1borq6aZXOP43zhMlM4vHjfV0QTWsjLGVo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4606
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
Cc: David Airlie <airlied@linux.ie>, Felix Kuehling <Felix.Kuehling@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 =?UTF-8?Q?Dan_Hor=c3=a1k?= <dan@danny.cz>, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMzAuMDMuMjEgdW0gMTQ6MDQgc2NocmllYiBYaSBSdW95YW86Cj4gT24gMjAyMS0wMy0zMCAw
Mzo0MCArMDgwMCwgWGkgUnVveWFvIHdyb3RlOgo+PiBPbiAyMDIxLTAzLTI5IDIxOjM2ICswMjAw
LCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+Pj4gQW0gMjkuMDMuMjEgdW0gMjE6Mjcgc2Nocmll
YiBYaSBSdW95YW86Cj4+Pj4gSGkgQ2hyaXN0aWFuLAo+Pj4+Cj4+Pj4gSSBkb24ndCB0aGluayB0
aGVyZSBpcyBhbnkgY29uc3RyYWludCBpbXBsZW1lbnRlZCB0byBlbnN1cmUgYG51bV9lbnRyaWVz
ICUKPj4+PiBBTURHUFVfR1BVX1BBR0VTX0lOX0NQVV9QQUdFID09IDBgLsKgIEZvciBleGFtcGxl
LCBpbiBgYW1kZ3B1X3ZtX2JvX21hcCgpYDoKPj4+Pgo+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgIC8q
IHZhbGlkYXRlIHRoZSBwYXJhbWV0ZXJzICovCj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqAgaWYgKHNh
ZGRyICYgQU1ER1BVX0dQVV9QQUdFX01BU0sgfHwgb2Zmc2V0ICYgQU1ER1BVX0dQVV9QQUdFX01B
U0sKPj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNpemUgPT0gMCB8fCBzaXplICYgQU1E
R1BVX0dQVV9QQUdFX01BU0spCj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHJldHVybiAtRUlOVkFMOwo+Pj4+Cj4+Pj4gLyogc25pcCAqLwo+Pj4+Cj4+Pj4gIMKgwqDCoMKg
wqDCoMKgwqAgc2FkZHIgLz0gQU1ER1BVX0dQVV9QQUdFX1NJWkU7Cj4+Pj4gIMKgwqDCoMKgwqDC
oMKgwqAgZWFkZHIgLz0gQU1ER1BVX0dQVV9QQUdFX1NJWkU7Cj4+Pj4KPj4+PiAvKiBzbmlwICov
Cj4+Pj4KPj4+PiAgwqDCoMKgwqDCoMKgwqDCoCBtYXBwaW5nLT5zdGFydCA9IHNhZGRyOwo+Pj4+
ICDCoMKgwqDCoMKgwqDCoMKgIG1hcHBpbmctPmxhc3QgPSBlYWRkcjsKPj4+Pgo+Pj4+Cj4+Pj4g
SWYgd2UgcmVhbGx5IHdhbnQgdG8gZW5zdXJlIChtYXBwaW5nLT5sYXN0IC0gbWFwcGluZy0+c3Rh
cnQgKyAxKSAlCj4+Pj4gQU1ER1BVX0dQVV9QQUdFU19JTl9DUFVfUEFHRSA9PSAwLCB0aGVuIHdl
IHNob3VsZCByZXBsYWNlCj4+Pj4gIkFNREdQVV9HUFVfUEFHRV9NQVNLIgo+Pj4+IGluICJ2YWxp
ZGF0ZSB0aGUgcGFyYW1ldGVycyIgd2l0aCAiUEFHRV9NQVNLIi4KPiBJdCBzaG91bGQgYmUgIn5Q
QUdFX01BU0siLCAiUEFHRV9NQVNLIiBoYXMgYW4gb3Bwb3NpdGUgY29udmVudGlvbiBvZgo+ICJB
TURHUFVfR1BVX1BBR0VfTUFTSyIgOiguCj4KPj4+IFllYWgsIGdvb2QgcG9pbnQuCj4+Pgo+Pj4+
IEkgdHJpZWQgaXQgYW5kIGl0IGJyb2tlIHVzZXJzcGFjZTogWG9yZyBzdGFydHVwIGZhaWxzIHdp
dGggRUlOVkFMIHdpdGgKPj4+PiB0aGlzCj4+Pj4gY2hhbmdlLgo+Pj4gV2VsbCBpbiB0aGVvcnkg
aXQgaXMgcG9zc2libGUgdGhhdCB3ZSBhbHdheXMgZmlsbCB0aGUgR1BVVk0gb24gYSA0awo+Pj4g
YmFzaXMgd2hpbGUgdGhlIG5hdGl2ZSBwYWdlIHNpemUgb2YgdGhlIENQVSBpcyBsYXJnZXIuIExl
dCBtZSBkb3VibGUKPj4+IGNoZWNrIHRoZSBjb2RlLgo+IE9uIG15IHBsYXRmb3JtLCB0aGVyZSBh
cmUgdHdvIGlzc3VlcyBib3RoIGNhdXNpbmcgdGhlIFZNIGNvcnJ1cHRpb24uICBPbmUgaXMKPiBm
aXhlZCBieSBhZ2Q1Zi9saW51eEBmZTAwMWU3LgoKV2hhdCBpcyBmZTAwMWU3PyBBIGNvbW1pdCBp
ZD8gSWYgeWVzIHRoZW4gdGhhdCBpcyB0byBzaG9ydCBhbmQgSSBjYW4ndCAKZmluZCBpdC4KCj4g
ICAgQW5vdGhlciBpcyBpbiBNZXNhIGZyb20gdXNlcnNwYWNlOiAgaXQgdXNlcwo+IGBkZXZfaW5m
by0+Z2FydF9wYWdlX3NpemVgIGFzIHRoZSBhbGlnbm1lbnQsIGJ1dCB0aGUga2VybmVsIEFNREdQ
VSBkcml2ZXIKPiBleHBlY3RzIGl0IHRvIHVzZSBgZGV2X2luZm8tPnZpcnR1YWxfYWRkcmVzc19h
bGlnbm1lbnRgLgoKTWhtLCBsb29raW5nIGF0IHRoZSBrZXJuZWwgY29kZSBJIHdvdWxkIHJhdGhl
ciBzYXkgTWVzYSBpcyBjb3JyZWN0IGFuZCAKdGhlIGtlcm5lbCBkcml2ZXIgaXMgYnJva2VuLgoK
VGhlIGdhcnRfcGFnZV9zaXplIGlzIGxpbWl0ZWQgYnkgdGhlIENQVSBwYWdlIHNpemUsIGJ1dCB0
aGUgCnZpcnR1YWxfYWRkcmVzc19hbGlnbm1lbnQgaXNuJ3QuCgo+IElmIHdlIGNhbiBtYWtlIHRo
ZSBjaGFuZ2UgdG8gZmlsbCB0aGUgR1BVVk0gb24gYSA0ayBiYXNpcywgd2UgY2FuIGZpeCB0aGlz
IGlzc3VlCj4gYW5kIG1ha2UgdmlydHVhbF9hZGRyZXNzX2FsaWdubWVudCA9IDRLLiAgT3RoZXJ3
aXNlLCB3ZSBzaG91bGQgZm9ydGlmeSB0aGUKPiBwYXJhbWV0ZXIgdmFsaWRhdGlvbiwgY2hhbmdp
bmcgIkFNREdQVV9HUFVfUEFHRV9NQVNLIiB0byAiflBBR0VfTUFTSyIuICBUaGVuIHRoZQo+IHVz
ZXJzcGFjZSB3aWxsIGp1c3QgZ2V0IGFuIEVJTlZBTCwgaW5zdGVhZCBvZiBhIHNsaWVudCBWTSBj
b3JydXB0aW9uLiAgQW5kCj4gc29tZW9uZSBzaG91bGQgdGVsbCBNZXNhIGRldmVsb3BlcnMgdG8g
Zml4IHRoZSBjb2RlIGluIHRoaXMgY2FzZS4KCkkgcmF0aGVyIHNlZSB0aGlzIGFzIGEga2VybmVs
IGJ1Zy4gQ2FuIHlvdSB0ZXN0IGlmIHRoaXMgY29kZSBmcmFnbWVudCAKZml4ZXMgeW91ciBpc3N1
ZToKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfa21zLmMg
CmIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2ttcy5jCmluZGV4IDY0YmViMzM5
OTYwNC4uZTEyNjBiNTE3ZTFiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfa21zLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2tt
cy5jCkBAIC03ODAsNyArNzgwLDcgQEAgaW50IGFtZGdwdV9pbmZvX2lvY3RsKHN0cnVjdCBkcm1f
ZGV2aWNlICpkZXYsIHZvaWQgCipkYXRhLCBzdHJ1Y3QgZHJtX2ZpbGUgKmZpbHApCiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfQogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGRldl9pbmZvLT52aXJ0dWFsX2FkZHJlc3NfYWxpZ25tZW50ID0gCm1heCgoaW50KVBBR0VfU0la
RSwgQU1ER1BVX0dQVV9QQUdFX1NJWkUpOwogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGRldl9pbmZvLT5wdGVfZnJhZ21lbnRfc2l6ZSA9ICgxIDw8IAphZGV2LT52bV9tYW5hZ2VyLmZy
YWdtZW50X3NpemUpICogQU1ER1BVX0dQVV9QQUdFX1NJWkU7Ci3CoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGRldl9pbmZvLT5nYXJ0X3BhZ2Vfc2l6ZSA9IEFNREdQVV9HUFVfUEFHRV9TSVpF
OworwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkZXZfaW5mby0+Z2FydF9wYWdlX3NpemUg
PSAKZGV2X2luZm8tPnZpcnR1YWxfYWRkcmVzc19hbGlnbm1lbnQ7CiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgZGV2X2luZm8tPmN1X2FjdGl2ZV9udW1iZXIgPSBhZGV2LT5nZnguY3Vf
aW5mby5udW1iZXI7CiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGV2X2luZm8tPmN1
X2FvX21hc2sgPSBhZGV2LT5nZnguY3VfaW5mby5hb19jdV9tYXNrOwogwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGRldl9pbmZvLT5jZV9yYW1fc2l6ZSA9IGFkZXYtPmdmeC5jZV9yYW1f
c2l6ZTsKCgpUaGFua3MsCkNocmlzdGlhbi4KCj4gLS0KPiBYaSBSdW95YW8gPHhyeTExMUBtZW5n
eWFuMTIyMy53YW5nPgo+IFNjaG9vbCBvZiBBZXJvc3BhY2UgU2NpZW5jZSBhbmQgVGVjaG5vbG9n
eSwgWGlkaWFuIFVuaXZlcnNpdHkKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==

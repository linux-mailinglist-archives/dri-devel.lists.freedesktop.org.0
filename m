Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C021637201A
	for <lists+dri-devel@lfdr.de>; Mon,  3 May 2021 21:03:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FACE6E8D4;
	Mon,  3 May 2021 19:03:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2057.outbound.protection.outlook.com [40.107.220.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3C6D6E8D4
 for <dri-devel@lists.freedesktop.org>; Mon,  3 May 2021 19:03:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lXgUaLRKtVimAcTwWltYEe6wePqLnoCZPP8SXLusz5d6D0X9h9h4ITOxoYucfiNvt2DIq1PVDayvSBLI3D6hFSGamPHffs7TUz6EqIoW6vQ2qJ8xyDJzDyy/37fD85x9xa8wNc/zopjbxOm5FKY2oyQaRSEp4KqvcoJirjFgCUHYViO1KiOCs949NnfLoVGNYAd1ZJgLNrlzW2T1lcdlG/UbfDjSwAQ6c1Zkcw1CX/wp0YCV9xhbESzNF9kGI/8mSlxkP79eKWLleOTbxHEmbxLS5VEh18sEYlobbOPl+DiWH4Kn9+7rQHy49hIGZBslUuZUN6IaF/hEukCzO1PMlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YhEgUSxRKwc+xIlWEmCJ1lV/aO21vVCeb39Uu3VZdMI=;
 b=VzdwLFLPCjTXurWLynmT4OzReLsOuGdfe5U5dC8h075JjUNuDbharBGq4EBF10Fn9986uUsIwGbBOG/5VFPRdCnSCVnaViRBJPzcEHQBXTPJMahHC5BvCOcx1A28vlZ9UowXRIYJD99JYD2fr0MchBprVEsM+L33eWrE3Nkswv4RLeWWncTp4bbBb/gvNfIRyeg50a77hXP0zRgw4jN1ZrVEU9uN9qVPUsE9B4ht2mCsXwgVektbUKO9FYpFqD0+JSbFDWHuYwte1+yb7XRA1VRrCb1XeVik368lYv+h/jIzm8UTrHR19svbz8HPED1xfokP4DOQ1HMwfi9Alhhgmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YhEgUSxRKwc+xIlWEmCJ1lV/aO21vVCeb39Uu3VZdMI=;
 b=P+EV6df0AMika3t5/vU8Mku7tEf2eJwknrGNqUtslK91AU1FZd3qMngGQcwju/Pkaxrm9RJbRsKjCYqTLzAjWmtzI4eD9ZbNXCEsWFcHP4gDtGgGhKLIMsqgcB6292iS5CO5q71AOrwDHWRoy+MI59TfPxFs7t3vp/xdNXJaQKc=
Authentication-Results: vmware.com; dkim=none (message not signed)
 header.d=none;vmware.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4550.namprd12.prod.outlook.com (2603:10b6:208:24e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.42; Mon, 3 May
 2021 19:02:57 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4087.044; Mon, 3 May 2021
 19:02:57 +0000
Subject: Re: [PATCH 1/1] drm/vmwgfx: use ttm_bo_move_null() when there is
 nothing to move
To: Nirmoy Das <nirmoy.das@amd.com>, dri-devel@lists.freedesktop.org
References: <20210503190013.91732-1-nirmoy.das@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <c3c9000f-cc6a-55d3-cb98-0c602e922faa@amd.com>
Date: Mon, 3 May 2021 21:02:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210503190013.91732-1-nirmoy.das@amd.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:9f6e:f974:d57f:1142]
X-ClientProxiedBy: AM4PR0302CA0027.eurprd03.prod.outlook.com
 (2603:10a6:205:2::40) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:9f6e:f974:d57f:1142]
 (2a02:908:1252:fb60:9f6e:f974:d57f:1142) by
 AM4PR0302CA0027.eurprd03.prod.outlook.com (2603:10a6:205:2::40) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.27 via Frontend
 Transport; Mon, 3 May 2021 19:02:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 50e2ebc3-367b-4931-f735-08d90e660ff5
X-MS-TrafficTypeDiagnostic: MN2PR12MB4550:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4550F1CE76AF8B84795BF6F3835B9@MN2PR12MB4550.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:376;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ENGULLE8/5puH01gbntFy76d8BCwZ//EZXiBisHPXgfnCLRgWFXCTLLSYar2Ti64wqJbIyCGCZ3b4XnWg2hTmSi1gF6EOofYn8kUxTJs5/+TvyjZDT3I5P0a51eVSg7kFFDSmwdJAikfZobhQd0yLE+GEJ7RyT9p0lpi/CSZEyXltjkIOaR6xBX7X1ElS/gJsBa/qUkOgvKALfEsP5iuOn7B7N9A/7XK+aE212R00Ngo3E6hNGRnZ4cj7MBvhP82Nu1Iryyar8Na2C4k3PCNMWnIbwUcl5I9yma8DDR0uy7pqKjrLXMSW7UlZTHe1R/Kr9dhrRxAEarPbZ5nohst7MqdLIsEqV+bDOc0W88fe9CwleVi2bKoPk6YcrCvhu+kZZZiqS/XAAuznOuFDKb/6gkVCrqEYdxOFgP2FMqtwrUqvGTAwLecUSM+jtOjGD+hnpKIGsmGEi3alVkkCjXQ+Q2Z6b+rjHxIEXdqJT9inzWieVZL1YpgES26dg/PQFVCTNDd/1QXLbyhCyQUZjJ8yNshiaj49i11t3gYOGie2AUl3xYiXDPcgc3cVJRh9Jbhi1NC5ippMOQjnm6TsvFpewIFzNt6/bg7QxMt1k4oJuarGOd9GQaOh+s4JUuaKBgzhLa6GzDioxW73FC6Ux/Ef6uZMN9bQHr8HlDOjbgGJ9NmawgXjjAXC8Q/R4tUI8KT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(346002)(376002)(136003)(39850400004)(36756003)(66556008)(316002)(38100700002)(52116002)(31686004)(6666004)(83380400001)(66476007)(16526019)(8936002)(31696002)(66946007)(5660300002)(8676002)(66574015)(478600001)(186003)(86362001)(6486002)(2906002)(4744005)(4326008)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VFZtSkM2MmNIbmNsZFB5R3NEd1VsZVFQSWVYNUp2V0JuT1lxWGZXY2YzSzJh?=
 =?utf-8?B?TWd3aWh2SnlEcWQ5dGgrcEhpOXF0MGNod1NoaHN5OERjUjlqdXdrMGRuZ3FK?=
 =?utf-8?B?T2R2cXhLd1hhWUdRSk5sYVZacHRLclJKVTU0VURiUEN3Qms4UThSd3hPYlc3?=
 =?utf-8?B?dVYvRlBuVjNJUklRbXJSRS94U2NadXE2QjRnQ0RoWm5sNzZucS9nb1JqcXRr?=
 =?utf-8?B?dVFBMGFJRlhCK29nSFo0OEhCOWFyVExZZzk1Q01CcUpFUGxNSUdJR0Fpb3lu?=
 =?utf-8?B?ZkVQOTdNOHNWRzN0NHBmcXJXNGR3NSt0aUFRTFZEQjdBVEpIc3RMK2RrUTN4?=
 =?utf-8?B?VlcxOHorbVJFSlBxeGl4Y3kyL0lQRmNvV245OGxDVTVaUnUyN1VBUkoycFor?=
 =?utf-8?B?L3UvSFJoZ3dZemRjWmFiZklJR21NR21jMXl5WXNPU2RZcmhFaUZma0xNK2tT?=
 =?utf-8?B?elBKWDFiUGlxR3k0d0FjRlVnVWVuaGlkWHczSGh1dERrTzRMQVVQN21LT2Jj?=
 =?utf-8?B?NjFkYlpFcEZLNC9sc3dDcFJvRnFWL3RVWk1hbFRKK0t6UDhOY2UxaytneE1U?=
 =?utf-8?B?WWd2QXE1Y2Q0bEJOTVkrTlg1d3ZjdWhSalNFSDFhLzBrczZvTGh2bWFlQXZP?=
 =?utf-8?B?QUJDRStISUNvZ0ZIcEJJSzQ0MmJvbi8yUUZNZkY5SzZRUVd4VGdxRTlLTHFh?=
 =?utf-8?B?UHJIWmloWVRYSjZKQjVnak5CRndSOFB5TStuVDV2T3p2a09WK211Q1pEM3Zu?=
 =?utf-8?B?K1RCaDJ3YWZpMXVEQnV6Wk8vT0VPS0RFVGRIK2RuS09iU0JQUGhhNWRsSThV?=
 =?utf-8?B?YVhrUUptMXVSUWdZT3BiOEVtazFlK2lneDBKVWZRL1RFaHpjb0MybjRQNDFm?=
 =?utf-8?B?MmNSdlpjWmRFemF0azRlQ0hqUDJFWGZsOGc1aUt5ZzhRbG5JUUdScWEyS1Jo?=
 =?utf-8?B?NDVlY2pxeUM4aHlxbE9VWjdMN2pWaTZnekpuWE9ITFM1MTk5MlNXYjB5UTZT?=
 =?utf-8?B?UGI3SlVFV3o0YWRVaElZbVYvV0xJSTVaUXhNMUsrMFFmN1RsVnVSN2VTZEJT?=
 =?utf-8?B?enFBZHBGaUdJNklzNWJSUWxMUWF6MEpKQlBrOGtzUmxSR2N5VHdPcXhEN21I?=
 =?utf-8?B?UW9JSmJnaUNJSjV6ZldMYTlhVTV0SCtTV2tkN2pRNk4rU1YyL1B4Mi8xTGJK?=
 =?utf-8?B?NjRrZGRONEpYUXdQMVlPMDZ6RG9jdE9tdm1MTlRvcGNaaWlBZzQvT0p6S201?=
 =?utf-8?B?SHpUNWNHalJ4SjdyVmJIZ1lhUEZLbDNWMXpXbDEvUWhZREZabW4veEZhcDY4?=
 =?utf-8?B?aFhGZmhzbWxWSUtmRkhGRXBkNzVlZmZDdms2QnVnTmFjeDZJbFYvcGtPTzZP?=
 =?utf-8?B?TE8rU0dHME55dkNmTVovN0hpWmpMMDVLN0RjSDNzVEZ5azZsek1YdHo4WW5r?=
 =?utf-8?B?N0ZSYTJvL1RDRVVvclBKVU9VZjJvMHpKcDc0Y0x6TmRGY0RKdDRrVTNZQ1lP?=
 =?utf-8?B?ZFRtSEJBVE40ZDc0aHgxMmZBdWc5SmsrMzBQSkVLMjJCaFdBcDVlR2FVQUJU?=
 =?utf-8?B?a09jb2NVakJTNGlySTR4Y2pXMG84V2svTGptOUk5V0tsbzlVdU5YTFdJQmNl?=
 =?utf-8?B?NEJhK3N4K0E2UTdpb1ZWQktNSk9wQ2FWbW4zcGdPUDNubUVhQ1pMaXZXY1VG?=
 =?utf-8?B?cWljT0thZ1hKM3lyNHRPdWx4QnpJWXpySWpHZm9weDBKdEo0eC9SaUZDRW1z?=
 =?utf-8?B?dmVMcFF2R3dVUEFXTnJQNGpzRXRCbWlBaDVVU3EvYmR4OHEzUVhSNm5WUUhT?=
 =?utf-8?B?ckZYVWNLOGVzZEY5WmZxaTRmVUpNc2hnbmkwVkZnMmtKQXhrT2J6TUQwUmJz?=
 =?utf-8?Q?EIBOOvIuYs1IL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50e2ebc3-367b-4931-f735-08d90e660ff5
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2021 19:02:57.1114 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xWGLKgoU+W6y9Ze2r6jagajH3mj9QQ/8uom1WpMs9A2W9CJXUCczHbV4j904Z/Pg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4550
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
Cc: daniel.vetter@ffwll.ch, sroland@vmware.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDMuMDUuMjEgdW0gMjE6MDAgc2NocmllYiBOaXJtb3kgRGFzOgo+IFVzZSB0dG1fYm9fbW92
ZV9udWxsKCkgaW5zdGVhZCBvZiB0dG1fYm9fYXNzaWduX21lbSgpLgo+Cj4gU2lnbmVkLW9mZi1i
eTogTmlybW95IERhcyA8bmlybW95LmRhc0BhbWQuY29tPgoKUmV2aWV3ZWQtYnk6IENocmlzdGlh
biBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KCj4gLS0tCj4gICBkcml2ZXJzL2dw
dS9kcm0vdm13Z2Z4L3Ztd2dmeF90dG1fYnVmZmVyLmMgfCAyICstCj4gICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF90dG1fYnVmZmVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vdm13
Z2Z4L3Ztd2dmeF90dG1fYnVmZmVyLmMKPiBpbmRleCAyZGMwMzFmZTRhOTAuLmJlYWY0MmY4NGYw
MyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF90dG1fYnVmZmVy
LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF90dG1fYnVmZmVyLmMKPiBA
QCAtNzM4LDcgKzczOCw3IEBAIHN0YXRpYyBpbnQgdm13X21vdmUoc3RydWN0IHR0bV9idWZmZXJf
b2JqZWN0ICpibywKPiAgIAo+ICAgCWlmIChvbGRfbWFuLT51c2VfdHQgJiYgbmV3X21hbi0+dXNl
X3R0KSB7Cj4gICAJCWlmIChiby0+bWVtLm1lbV90eXBlID09IFRUTV9QTF9TWVNURU0pIHsKPiAt
CQkJdHRtX2JvX2Fzc2lnbl9tZW0oYm8sIG5ld19tZW0pOwo+ICsJCQl0dG1fYm9fbW92ZV9udWxs
KGJvLCBuZXdfbWVtKTsKPiAgIAkJCXJldHVybiAwOwo+ICAgCQl9Cj4gICAJCXJldCA9IHR0bV9i
b193YWl0X2N0eChibywgY3R4KTsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=

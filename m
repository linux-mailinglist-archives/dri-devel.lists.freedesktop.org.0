Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4063922B9E0
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jul 2020 01:02:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB1246E486;
	Thu, 23 Jul 2020 23:02:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2064.outbound.protection.outlook.com [40.107.94.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 548E06E486
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jul 2020 23:02:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oagk2+JmSkdViGnhR6L0zyBJIBA0AQpggFNZscavL7EFrPoxPRloUZrlvvfTvLKBIu1cmYmHOfO+fyjF9FSYKKRoGGvok9Yww5iTGyjVlBtHu0u4diAtT/BcyhuOU5VxTDCzwjxfuHSIBT1S5jKbqP7KzYhzJTNXh47GgPzT30SWFtOO09ZmFTGKhFBbS8Q7mDSIFLypui6vlIGGkdi0vPfdyzVbmQBP6yN5b71ZiHWxNgoA0UG21oWUrdteuzx0f7jfWawPLQ9zJg1aMEO9+DC7Z46LkklsPFX8nQZgP1x2AgA4baOBOjMXCL41hZ2eSuf6UT3Ffzut1ZDVdk7MLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B5JIdrcNvMTCMAvbbM9SQrdIUeRWRUN4xSWsCKWTrLI=;
 b=HyZKuCifmVYwQgFxvf8CXgnYUnisqr9q+hw7z49rhcqNfduXmbW5gVD2Xa7QmE7qkg8ddQJXshvQCrbzzvQtV4NQboXVluK89bJITnWmfBXkvdrShpp/j3wlI2qu39N0QGshX/VS/TNuU1qu/XLfXXxB2+I0KxMoV6XmP3Y+O2Yto5aC9V2uC5y7dg3ooPXlqQ8g+SLAo1VOpG94Dy+Wquwvl6n8N8E+15oyEvAUta0/c693WByioHsngB8TavaYVVbBP0PTyCDp1zImarD/8w3cxGXAWSjT6BjqsxRGfv0SXzjeQN0BBgDwmySdHNSosnevER8kFbkr4b62+Xni2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B5JIdrcNvMTCMAvbbM9SQrdIUeRWRUN4xSWsCKWTrLI=;
 b=Q40ZVHPv20cbU1dzO/gKN/lnKGMp48jbs5YGmEvl/N9Z7RI8Wmv1tBW2+M5hce+1y0goxO4tqpS4IyEeDWGYPimxnQxZGJYB/YS58uj/eCPlHhiM3A4jjVc82gxLG+BpiQOzrDHJTUjEtHcnl6FZJTERBsfxS6nTUEUxdYVm5/4=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from SN1PR12MB2414.namprd12.prod.outlook.com (2603:10b6:802:2e::31)
 by SN6PR12MB2686.namprd12.prod.outlook.com (2603:10b6:805:72::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.18; Thu, 23 Jul
 2020 23:02:21 +0000
Received: from SN1PR12MB2414.namprd12.prod.outlook.com
 ([fe80::5d1d:887c:3ba6:1d0d]) by SN1PR12MB2414.namprd12.prod.outlook.com
 ([fe80::5d1d:887c:3ba6:1d0d%7]) with mapi id 15.20.3216.020; Thu, 23 Jul 2020
 23:02:21 +0000
Subject: Re: [PATCH] drm/ttm: fix pipelined gutting for evictions
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20200723090000.5725-1-christian.koenig@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <982ad05c-f2f8-0a53-9b90-119fe93a5374@amd.com>
Date: Thu, 23 Jul 2020 19:02:19 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200723090000.5725-1-christian.koenig@amd.com>
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0073.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::12) To SN1PR12MB2414.namprd12.prod.outlook.com
 (2603:10b6:802:2e::31)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.117.61.76) by
 YT1PR01CA0073.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.23 via Frontend Transport; Thu, 23 Jul 2020 23:02:20 +0000
X-Originating-IP: [142.117.61.76]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 345229e4-7346-44dc-e227-08d82f5c7471
X-MS-TrafficTypeDiagnostic: SN6PR12MB2686:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB26866123B686DFA10047201992760@SN6PR12MB2686.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aF8fhHPQaptalyyKGPgnGz2U4kZQmACWaIYUyig0TlPowmw+kTgKHkGIGq3oGRXyOGHeO39qIEALUgdVgQ5/I3RvRSW8M5Vcr7TFaYRECTlVfWZWMeXbfwMa4TqXYbiCw/7MWQdXrU+OKikrCjUskcXmfdh5XCib3QDrLqQI/sR0okQSo1bgnN6gCy9L3PG+/fEdR6fLRffP0pzVrtPOAOvqf2Rs9RwyIQ5tVnRYkzhsyoJKoMyY0iimfsymdRHP/QwhRJ0+qC6Kt6Hg+E99rIAOvGrkSf+f71lzhRqAr6LlzlfBBkOuKlAIXhtP8HDVnkYcAHQBceRGjDV7D6kxLdU40bH1nwLEuipfsCMC6HqK61Jti/2BtvIfswI5tdrS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN1PR12MB2414.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(366004)(39860400002)(346002)(136003)(396003)(66556008)(66476007)(52116002)(316002)(478600001)(66946007)(31696002)(956004)(16576012)(86362001)(2616005)(44832011)(83380400001)(6486002)(26005)(8676002)(8936002)(31686004)(2906002)(36756003)(4326008)(5660300002)(16526019)(186003)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: dt5EZ1x/xY1cgaf6kE9fRKj+XRuXtmmTQ0VItTa5dfimGmDwIywCnauaxlGxAxYDeeSSCF4+dFBG0M12IgOESUkKPtP8mxtfcDzpSf1N6NwJVgZxaHI/wHGzanhZ50gMOqkZZq98Zu9ByTEqaTbEIvHXTriT3CrcllsWBfzJEqGNBP16kbcZ6VtNjx0EqBRMSjTdCHt9xV3YFiq9ntFxzhEntSHCB4g+qpVAVMZ3NF/ma22PnL4SMKNTfVTft8ElU/47YEGzyPCdpRt3oogM8QZuSDj1Rc4SKx2CQt35RYXZxgUR/WDecG43UoHj51YiMkdx2HfZlop76MLWJFdWC3lkk9Qq00Q9QfxjM5Amh5Qhc/wiPXlDxb8pxjbjFN0Fzj1faBnzhrQGXc8uENvayz437sPdxyN1l+0mkxh+i1fAB+bml64sVBjZzYtC3gdoeWHuEObP+NMl7puBcgG1TxCz82qtUKYWXndsPj6e2KIhHrVNuPDe3UyMglANv2by
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 345229e4-7346-44dc-e227-08d82f5c7471
X-MS-Exchange-CrossTenant-AuthSource: SN1PR12MB2414.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2020 23:02:21.3700 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 93GN7xLcUoGMQQY91eqovanUhbWsP6PCZ8Et82+Rtc8+nHL0YhPTf2INeU5uQNeyFTi7qgBbi8uMF63HQmc2qQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2686
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
Cc: Alex.Sierra@amd.com, Philip.Yang@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjAyMC0wNy0yMyB1bSA1OjAwIGEubS4gc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOgo+IFdl
IGNhbid0IHBpcGVsaW5lIHRoYXQgZHVyaW5nIGV2aWN0aW9uIGJlY2F1c2UgdGhlIG1lbW9yeSBu
ZWVkcwo+IHRvIGJlIGF2YWlsYWJsZSBpbW1lZGlhdGVseS4KPgo+IFNpZ25lZC1vZmYtYnk6IENo
cmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiAtLS0KPiAgZHJpdmVy
cy9ncHUvZHJtL3R0bS90dG1fYm8uYyB8IDEyICsrKysrKysrKystLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMTAgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwo+
IGluZGV4IGJjMjIzMGVjYjdlMy4uMTIyMDQwMDU2YTA3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS90dG0vdHRtX2JvLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5j
Cj4gQEAgLTY1MSw4ICs2NTEsMTYgQEAgc3RhdGljIGludCB0dG1fYm9fZXZpY3Qoc3RydWN0IHR0
bV9idWZmZXJfb2JqZWN0ICpibywKPiAgCXBsYWNlbWVudC5udW1fYnVzeV9wbGFjZW1lbnQgPSAw
Owo+ICAJYmRldi0+ZHJpdmVyLT5ldmljdF9mbGFncyhibywgJnBsYWNlbWVudCk7Cj4gIAo+IC0J
aWYgKCFwbGFjZW1lbnQubnVtX3BsYWNlbWVudCAmJiAhcGxhY2VtZW50Lm51bV9idXN5X3BsYWNl
bWVudCkKPiAtCQlyZXR1cm4gdHRtX2JvX3BpcGVsaW5lX2d1dHRpbmcoYm8pOwo+ICsJaWYgKCFw
bGFjZW1lbnQubnVtX3BsYWNlbWVudCAmJiAhcGxhY2VtZW50Lm51bV9idXN5X3BsYWNlbWVudCkg
ewo+ICsJCXR0bV9ib193YWl0KGJvLCBmYWxzZSwgZmFsc2UpOwo+ICsKPiArCQl0dG1fdHRfZGVz
dHJveShiby0+dHRtKTsKPiArCj4gKwkJbWVtc2V0KCZiby0+bWVtLCAwLCBzaXplb2YoYm8tPm1l
bSkpOwoKV2hlcmUgZG9lcyB0aGUgbWVtb3J5IGluIHRoZSBiby0+bWVtICh0dG1fbWVtX3JlZykg
Z2V0IGRlc3Ryb3llZD8gSXQKZG9lc24ndCBnZXQgYXR0YWNoZWQgdG8gYSBnaG9zdCBCTyBpbiB0
aGlzIGNhc2UsIHNvIHNvbWVvbmUgd2lsbCBoYXZlIHRvCmNhbGwgdHRtX2JvX21lbV9wdXQgZXhw
bGljaXRseSBiZWZvcmUgeW91IHdpcGUgb3V0IGJvLT5tZW0uCgpSZWdhcmRzLArCoCBGZWxpeAoK
Cj4gKwkJYm8tPm1lbS5tZW1fdHlwZSA9IFRUTV9QTF9TWVNURU07Cj4gKwkJYm8tPnR0bSA9IE5V
TEw7Cj4gKwkJcmV0dXJuIDA7Cj4gKwl9Cj4gIAo+ICAJZXZpY3RfbWVtID0gYm8tPm1lbTsKPiAg
CWV2aWN0X21lbS5tbV9ub2RlID0gTlVMTDsKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==

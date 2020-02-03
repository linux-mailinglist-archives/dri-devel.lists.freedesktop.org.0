Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F42E150E7B
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2020 18:16:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09D0D6E225;
	Mon,  3 Feb 2020 17:16:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2062.outbound.protection.outlook.com [40.107.236.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EC866E225;
 Mon,  3 Feb 2020 17:16:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kiffTm8WM5G0SEFInh4n3wWxlwEU81QHOexvi5qVkhRBQ+hWStNE5A4Y8EvMwi8xIr6jfvKLP91QJ6fY5zoCem2sG7hT/uPCQRdXchBGxq5ZsmfH68kWg62JRiFguJWKFzgEOeFSYem1g14A0sY+WN8wi4y1UL3J41DhEX2CjENrt/D8lbUwt7as4fzr2O5rrostVExPqANamJYvKNYEJCSfbfcwpU7kSGRpvjP47UL9ki9I0WmOF56M07FiXDmIOZKBUN9PDvUPJVCZdMOfKD8ZAU+LH4CNidFiTxS2ko02FDHkuy5ieYg4ZcCoV+SEmzw4p9cXT7XEbmHiccKCJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kP5YxPaUnw/mmqtfzj0P0CXrZvdxGSpEZaMB3tAG10A=;
 b=AcTXpNj1QuhsqYGHf/RyBzcuaLi1KlI95QmHXbCMT3xCTPTGadYup9PHlCUfJrjbRIQfad1czcBm32ld9M3LwumoUh1geEVX8Vn28KDRQ+EfU8GVf2kc5KZnMw3cMtcS/LllaxqNbq+JIJiIXPgqpNGkDYAKcQvJMW/M0ugkVn5CVrMDW46fAy5wvheZTOpR8DkUMssS94/NIT1dWNXf5Sc5B1VOlI/OPZ/72ElVoSqbIXLgmL6/oM3Q62uOa/pb8u3mYJMFAnQY8kM7vOoZZ0UHOPk3qcRv9mowKPCRW7iRmxCM1pjpYYFzYCLOkXhs3kxd4T9bd6hTmux+55kxAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kP5YxPaUnw/mmqtfzj0P0CXrZvdxGSpEZaMB3tAG10A=;
 b=WHCq/xca27D/otRxSfpGL5qvAiUSlpmn37kf0Ugfx9NXVPd3L5Urz6xzQp6rDLtCKYVcW/X04TFhAokWYKjoS8gHqg3Xlhxxyj8mT4brUTISNYdXSpVhXXcO2gj8FGgWfi5/TquwaZFHOvjeVWwUkbzFMqiH2nvt5XslMGxInBM=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1209.namprd12.prod.outlook.com (10.168.234.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2686.29; Mon, 3 Feb 2020 17:16:39 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::d40e:7339:8605:bc92]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::d40e:7339:8605:bc92%11]) with mapi id 15.20.2686.031; Mon, 3 Feb 2020
 17:16:39 +0000
Subject: Re: [PATCH v2] drm/radeon: have the callers of set_memory_*() check
 the return value
To: Tianlin Li <tli@digitalocean.com>, kernel-hardening@lists.openwall.com
References: <20200203161827.768-1-tli@digitalocean.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <6e5a18f6-b7f6-c401-c845-fe24b183f348@amd.com>
Date: Mon, 3 Feb 2020 18:16:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20200203161827.768-1-tli@digitalocean.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR05CA0086.eurprd05.prod.outlook.com
 (2603:10a6:208:136::26) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR05CA0086.eurprd05.prod.outlook.com (2603:10a6:208:136::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2686.29 via Frontend
 Transport; Mon, 3 Feb 2020 17:16:37 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6b603d2b-343a-4008-4cbe-08d7a8ccd4ba
X-MS-TrafficTypeDiagnostic: DM5PR12MB1209:|DM5PR12MB1209:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB120964F1725658F3FC14CD5083000@DM5PR12MB1209.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0302D4F392
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(136003)(39860400002)(366004)(376002)(189003)(199004)(2616005)(66946007)(66556008)(31696002)(66476007)(2906002)(6486002)(36756003)(31686004)(4326008)(86362001)(66574012)(81156014)(8676002)(81166006)(8936002)(54906003)(6666004)(316002)(52116002)(45080400002)(16526019)(966005)(186003)(5660300002)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1209;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8NPey4ko1r9VwUhulrVFZ+tTb1Ogma/BQWyxeEm2HuPkjLm/3iGX4W1MeBukMJ/r+3lyB4X1CEVtT31K7drrmR2rEGRElGexQHotzKqLQ6EbXmA4djERNJvw/khJl5bVrz1dQswL9hGcfeYLPttPiXN4dSB6ckZGUH7mIX1oEWrTAwBlUCrDyQTP/1JIaNwyRrDkzgRR/B+xttyoFkbmke0Aeq3WRzRzz9ukGK4xCFWFt6clxTxE+ujxh+42L4iG0DZ+SHVRbmJZvMn/LZA1wxlWfx39fFEaWZjNu903cm+Af0x+QaESmZVQ5b7LbyyCB3O3UdohCexoIiiPu6OioeoPCJues1FILGmX6vpJlNCFiC5AFaYzCd3b21uuFBWM3gGRUTLBtGKbpJKfKCR0r+iBSRnHW3vLO700HLw6FXmhvtAArP8LCu/WkKlypmxh+HyBRB0GVuLQZrq89SYOru7+pQT3iHqJC6HCX55eVzR6nCS5WLn/62N+juKJVfDA2uuf+CBGK0g1U0XSGzddpA==
X-MS-Exchange-AntiSpam-MessageData: mHrqjViZGqH+NG9fAuMDu9GXI3Y07SDcoW6HFuAH1+m4lXCgHK7Z57Bo7QrDKMZcURabr65XhmsEPZDTbsrp2JPTgT0Gt0p6IGuNHr9ZL38Atpe1wdNgfjhGfyNwgVFXWYlPaFThA+pSoivY8pjZ/Yi9afDNnHfyIGPTzpx4X9klHTjdWX60DnBaYlc6gaWtIxt6ShVbdL1GUo4J7SkhbA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b603d2b-343a-4008-4cbe-08d7a8ccd4ba
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2020 17:16:39.3232 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 39B9R42sPSaCYxjZvJdYiFHcNyyW0ay7OlE8NrM4loHqbD1HF08+h71L+oeNX1Ns
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1209
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
Cc: keescook@chromium.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDMuMDIuMjAgdW0gMTc6MTggc2NocmllYiBUaWFubGluIExpOgo+IFJpZ2h0IG5vdyBzZXZl
cmFsIGFyY2hpdGVjdHVyZXMgYWxsb3cgdGhlaXIgc2V0X21lbW9yeV8qKCkgZmFtaWx5IG9mCj4g
ZnVuY3Rpb25zIHRvIGZhaWwsCgpPaCwgdGhhdCBpcyBhIGRldGFpbCBJIHByZXZpb3VzbHkgZGlk
bid0IHJlY29nbml6ZWQuIFdoaWNoIGFyY2hpdGVjdHVyZXMgCmFyZSB0aGF0PwoKQ2F1c2UgdGhl
IFJTNDAwLzQ4MCwgUlM2OTAgYW5kIFJTNzQwIHdoaWNoIGFyZSBhZmZlY3RlZCBieSB0aGlzIGFy
ZSAKaW50ZWdyYXRlZCBpbiB0aGUgc291dGgtYnJpZGdlLgoKPiAgIGJ1dCBjYWxsZXJzIG1heSBu
b3QgYmUgY2hlY2tpbmcgdGhlIHJldHVybiB2YWx1ZXMuCj4gSWYgc2V0X21lbW9yeV8qKCkgcmV0
dXJucyB3aXRoIGFuIGVycm9yLCBjYWxsLXNpdGUgYXNzdW1wdGlvbnMgbWF5IGJlCj4gaW5mYWN0
IHdyb25nIHRvIGFzc3VtZSB0aGF0IGl0IHdvdWxkIGVpdGhlciBzdWNjZWVkIG9yIG5vdCBzdWNj
ZWVkIGF0Cj4gYWxsLiBJZGVhbGx5LCB0aGUgZmFpbHVyZSBvZiBzZXRfbWVtb3J5XyooKSBzaG91
bGQgYmUgcGFzc2VkIHVwIHRoZQo+IGNhbGwgc3RhY2ssIGFuZCBjYWxsZXJzIHNob3VsZCBleGFt
aW5lIHRoZSBmYWlsdXJlIGFuZCBkZWFsIHdpdGggaXQuCj4KPiBOZWVkIHRvIGZpeCB0aGUgY2Fs
bGVycyBhbmQgYWRkIHRoZSBfX211c3RfY2hlY2sgYXR0cmlidXRlLiBUaGV5IGFsc28KPiBtYXkg
bm90IHByb3ZpZGUgYW55IGxldmVsIG9mIGF0b21pY2l0eSwgaW4gdGhlIHNlbnNlIHRoYXQgdGhl
IG1lbW9yeQo+IHByb3RlY3Rpb25zIG1heSBiZSBsZWZ0IGluY29tcGxldGUgb24gZmFpbHVyZS4g
VGhpcyBpc3N1ZSBsaWtlbHkgaGFzIGEKPiBmZXcgc3RlcHMgb24gZWZmZWN0cyBhcmNoaXRlY3R1
cmVzOgo+IDEpSGF2ZSBhbGwgY2FsbGVycyBvZiBzZXRfbWVtb3J5XyooKSBoZWxwZXJzIGNoZWNr
IHRoZSByZXR1cm4gdmFsdWUuCj4gMilBZGQgX19tdXN0X2NoZWNrIHRvIGFsbCBzZXRfbWVtb3J5
XyooKSBoZWxwZXJzIHNvIHRoYXQgbmV3IHVzZXMgZG8KPiBub3QgaWdub3JlIHRoZSByZXR1cm4g
dmFsdWUuCj4gMylBZGQgYXRvbWljaXR5IHRvIHRoZSBjYWxscyBzbyB0aGF0IHRoZSBtZW1vcnkg
cHJvdGVjdGlvbnMgYXJlbid0IGxlZnQKPiBpbiBhIHBhcnRpYWwgc3RhdGUuCj4KPiBUaGlzIHNl
cmllcyBpcyBwYXJ0IG9mIHN0ZXAgMS4gTWFrZSBkcm0vcmFkZW9uIGNoZWNrIHRoZSByZXR1cm4g
dmFsdWUgb2YKPiBzZXRfbWVtb3J5XyooKS4KPgo+IFNpZ25lZC1vZmYtYnk6IFRpYW5saW4gTGkg
PHRsaUBkaWdpdGFsb2NlYW4uY29tPgoKUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNo
cmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KCj4gLS0tCj4gdjI6Cj4gVGhlIGhhcmR3YXJlIGlzIHRv
byBvbGQgdG8gYmUgdGVzdGVkIG9uIGFuZCB0aGUgY29kZSBjYW5ub3QgYmUgc2ltcGx5Cj4gcmVt
b3ZlZCBmcm9tIHRoZSBrZXJuZWwsIHNvIHRoaXMgaXMgdGhlIHNvbHV0aW9uIGZvciB0aGUgc2hv
cnQgdGVybS4KPiAtIEp1c3QgcHJpbnQgYW4gZXJyb3Igd2hlbiBzb21ldGhpbmcgZ29lcyB3cm9u
Zwo+IC0gUmVtb3ZlIHBhdGNoIDIuCj4gdjE6Cj4gaHR0cHM6Ly9uYW0xMS5zYWZlbGlua3MucHJv
dGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGbG9yZS5rZXJuZWwub3JnJTJG
bGttbCUyRjIwMjAwMTA3MTkyNTU1LjIwNjA2LTEtdGxpJTQwZGlnaXRhbG9jZWFuLmNvbSUyRiZh
bXA7ZGF0YT0wMiU3QzAxJTdDY2hyaXN0aWFuLmtvZW5pZyU0MGFtZC5jb20lN0NiYTIxNzZkMmNh
ODM0MjE0ZTZiMTA4ZDdhOGM0YmIxZCU3QzNkZDg5NjFmZTQ4ODRlNjA4ZTExYTgyZDk5NGUxODNk
JTdDMCU3QzAlN0M2MzcxNjM0MzUyMjcwMzAyMzUmYW1wO3NkYXRhPW1EaFVFaTN2bXhhaGpzZHJa
T3I4M09FSVdOQkhlZk84bGtYU1QlMkZXMzJDRSUzRCZhbXA7cmVzZXJ2ZWQ9MAo+IC0tLQo+ICAg
ZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZ2FydC5jIHwgMTAgKysrKysrLS0tLQo+ICAg
MSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPgo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9nYXJ0LmMgYi9kcml2ZXJzL2dw
dS9kcm0vcmFkZW9uL3JhZGVvbl9nYXJ0LmMKPiBpbmRleCBmMTc4YmEzMjE3MTUuLmEyY2M4NjRh
YTA4ZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9nYXJ0LmMK
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9nYXJ0LmMKPiBAQCAtODAsOCAr
ODAsOSBAQCBpbnQgcmFkZW9uX2dhcnRfdGFibGVfcmFtX2FsbG9jKHN0cnVjdCByYWRlb25fZGV2
aWNlICpyZGV2KQo+ICAgI2lmZGVmIENPTkZJR19YODYKPiAgIAlpZiAocmRldi0+ZmFtaWx5ID09
IENISVBfUlM0MDAgfHwgcmRldi0+ZmFtaWx5ID09IENISVBfUlM0ODAgfHwKPiAgIAkgICAgcmRl
di0+ZmFtaWx5ID09IENISVBfUlM2OTAgfHwgcmRldi0+ZmFtaWx5ID09IENISVBfUlM3NDApIHsK
PiAtCQlzZXRfbWVtb3J5X3VjKCh1bnNpZ25lZCBsb25nKXB0ciwKPiAtCQkJICAgICAgcmRldi0+
Z2FydC50YWJsZV9zaXplID4+IFBBR0VfU0hJRlQpOwo+ICsJCWlmIChzZXRfbWVtb3J5X3VjKCh1
bnNpZ25lZCBsb25nKXB0ciwKPiArCQkJICAgICAgcmRldi0+Z2FydC50YWJsZV9zaXplID4+IFBB
R0VfU0hJRlQpKQo+ICsJCQlEUk1fRVJST1IoInNldF9tZW1vcnlfdWMgZmFpbGVkLlxuIik7Cj4g
ICAJfQo+ICAgI2VuZGlmCj4gICAJcmRldi0+Z2FydC5wdHIgPSBwdHI7Cj4gQEAgLTEwNiw4ICsx
MDcsOSBAQCB2b2lkIHJhZGVvbl9nYXJ0X3RhYmxlX3JhbV9mcmVlKHN0cnVjdCByYWRlb25fZGV2
aWNlICpyZGV2KQo+ICAgI2lmZGVmIENPTkZJR19YODYKPiAgIAlpZiAocmRldi0+ZmFtaWx5ID09
IENISVBfUlM0MDAgfHwgcmRldi0+ZmFtaWx5ID09IENISVBfUlM0ODAgfHwKPiAgIAkgICAgcmRl
di0+ZmFtaWx5ID09IENISVBfUlM2OTAgfHwgcmRldi0+ZmFtaWx5ID09IENISVBfUlM3NDApIHsK
PiAtCQlzZXRfbWVtb3J5X3diKCh1bnNpZ25lZCBsb25nKXJkZXYtPmdhcnQucHRyLAo+IC0JCQkg
ICAgICByZGV2LT5nYXJ0LnRhYmxlX3NpemUgPj4gUEFHRV9TSElGVCk7Cj4gKwkJaWYgKHNldF9t
ZW1vcnlfd2IoKHVuc2lnbmVkIGxvbmcpcmRldi0+Z2FydC5wdHIsCj4gKwkJCSAgICAgIHJkZXYt
PmdhcnQudGFibGVfc2l6ZSA+PiBQQUdFX1NISUZUKSkKPiArCQkJRFJNX0VSUk9SKCJzZXRfbWVt
b3J5X3diIGZhaWxlZC5cbiIpOwo+ICAgCX0KPiAgICNlbmRpZgo+ICAgCXBjaV9mcmVlX2NvbnNp
c3RlbnQocmRldi0+cGRldiwgcmRldi0+Z2FydC50YWJsZV9zaXplLAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

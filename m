Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC1929601A
	for <lists+dri-devel@lfdr.de>; Thu, 22 Oct 2020 15:36:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D969B6E0B7;
	Thu, 22 Oct 2020 13:36:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770082.outbound.protection.outlook.com [40.107.77.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC5726E05F;
 Thu, 22 Oct 2020 13:36:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZKZjTQDGqo1kg0F+Z8vM6PMvhBSeUI83i3VPNorQrzWECN+YNKHFLUZaa6g8lg5MtEyr+BNOMc9K81UkXiATO5ozdKkdp9gG561IDHc8DOZP22m2p4cWA3H0UNyYY//jYpmneAExE8uUpoy9NwMnxHp1RFcK+SWzV5+LC0qld0Px5GNeqvtzqlxAoncNfxcxP1MkOrxyaNEGCJqg41eBVd2fbGWXi8I2SiiKyxYD8/A20FVuV8XwKi2QPXM4ktYdIJAiOoPx6JLjTUnzD1wClOE26/UZ2phl6yW1R2tIZ3iBLcSCEOuaQktCX8ekWgZy0NIiYd81KuhhXnUiMmYoaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r0aQzm0lqtGV6sRtVOmabO6Jua3LbxWug1tPnfgXU34=;
 b=Hc0oDjSWFouycKRh22rxkq/Uwp91BYqfHq7N9Z7P15/nZKxmeftJfAmvka/pG5crdqHCWVpcTpoSWyQn3jBZSBTr8Wd0X6O6XD+ImAxP0wF6KAALHXOWaPHM51nwIZIqUxRlh/48edRmmRiqrCZCcvxzAMnAzMAlzaOipwh30CXhOTaqou9rhrCXp8RGLdp4kwL3/t/QPe5UuEs38ze2R2GhxCcgCGZMycUgoyDqtVjygGmWY+3Sxgb6U8FCDgWfeZ7JwWhtyObfylY189WoxCiVBgVF11T220ZnSu8Kj2rVqScs3hzD/m+jYGNYMEh8rysTrPBvI7U/Dffj1+FB8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r0aQzm0lqtGV6sRtVOmabO6Jua3LbxWug1tPnfgXU34=;
 b=Kt1S9DGaWo2otRNBwjy8yjFY+SArMTmLGbOpBHcf6CQG684haPEEbmKdZpixTHYBWqTBKqlFGCjFwbQm1NTFouHF+w6BYXRxKQRa8RQbJGVy/oFENpAnmO52q6UEKTl5XzSdUlijudz9woRcVimuxovbi63Wx+h4sFTUHCchE+M=
Authentication-Results: daenzer.net; dkim=none (message not signed)
 header.d=none;daenzer.net; dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (2603:10b6:a03:ae::10)
 by BY5PR12MB4164.namprd12.prod.outlook.com (2603:10b6:a03:207::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Thu, 22 Oct
 2020 13:36:28 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::b46f:9253:b0d8:7999]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::b46f:9253:b0d8:7999%7]) with mapi id 15.20.3477.028; Thu, 22 Oct 2020
 13:36:28 +0000
Subject: Re: [PATCH 1/3] drm/atomic-helpers: remove legacy_cursor_update hacks
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20201021163242.1458885-1-daniel.vetter@ffwll.ch>
From: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
Message-ID: <86236137-4a3b-69af-1769-8c4ac8603c08@amd.com>
Date: Thu, 22 Oct 2020 09:36:23 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
In-Reply-To: <20201021163242.1458885-1-daniel.vetter@ffwll.ch>
Content-Language: en-US
X-Originating-IP: [24.212.165.133]
X-ClientProxiedBy: YQBPR0101CA0002.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00::15) To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.180] (24.212.165.133) by
 YQBPR0101CA0002.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c00::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.18 via Frontend Transport; Thu, 22 Oct 2020 13:36:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a409e730-f87b-45b6-d51e-08d8768f7a25
X-MS-TrafficTypeDiagnostic: BY5PR12MB4164:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR12MB416434CDD04AC0175B2730EAEC1D0@BY5PR12MB4164.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DUvsxjVhBEohf5mMG6eL8cZloWfLPFf66wnq6PW9qYXbWm4rJLyJbazi/HRtTSzfdZKM6n0JeX2BAbxoXQ55Nf60+op7eD8T8JQX71mq2JoJw2aVPjBSIacE19a6rISNxvLl9op4dTlujzGEo78toJH7Mq0u42DryJTeIz5mQpkfNk3L/O+G6AHiXWodqpPtYKYSityiiVYYssv+v8jyXn+ZOHnFME8UmC+UccodoDzXHfv4aNJr5Zl/hMqief2AZhd4avmqYWFgDCEKLml47EKUnwuqGtF/9igcdSisCs7ZD/d7/foOYnNW2Za1n0zBR2iy1YuKaFoaxtHKi8t0R3+arY6QN9tFv8nbltcZvtXD1w3vBjm/E1/5MZZnbjT9eTTYwuWmoOP88PcKzRhDe12bEgUUIOLOg4JYr5BgDGRVVsp1TuSohB1oPnW73bioY1CXuZMsPSWVsycz9E4bTg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3560.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(39860400002)(376002)(346002)(396003)(2616005)(26005)(956004)(6666004)(4326008)(186003)(53546011)(4001150100001)(966005)(2906002)(83380400001)(36756003)(66574015)(6486002)(8676002)(66946007)(16526019)(316002)(31686004)(66476007)(110136005)(66556008)(54906003)(31696002)(52116002)(86362001)(478600001)(5660300002)(16576012)(8936002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: ELTzvLa5dxUCnrDIedB04oJqrX6jugMvXwqvd74D748NUA19TCZvrB3cOjATSYzC222k+rleMB5Cg/vPMziB8gYnu60F+E/I+WziaNZtCsGPlGBE6dsQafag7il0AGReP5+bAgAy3eM7GQ3qJ+TwHZ87lo011cwuBQG9a1JhkxVlie0/+HtRnBA2wGTmDACyPMjj1JXcCPHRR6qI2VLi6tFngWJSeeW7phvHYp7YAQcYX7puhkVuJO6JAcbKxj6oQR06A9eEo07JNPnEuTY8fNEDLVgCeaw0Y6pKn+x4YIlj2JvUrumFbAsDnAVW24uTRWgjwqI7Mt9csTHCqHtcrQERv1+gRYOUExHyuXjbpPyxGxok+PjkWyuUt2LfhC+gV4sZSpdrAj+vv/+iVrxYyaxzw/FFDTqGFrA1afnmxpiutKbqhg/Xp1qaqdcICzLGMoyuxkZoQBvQkxkTh533bRJTDTfN2RtQkDC0j85/iNf9nBaVqktaBpsQ6Unsyivn/naSpYTK9z5cFi3Dj23PloQNh7QTic7ZwKjY0rEEhpEFzD9wCNmimbg9dY2/3LT/+6kcJUFFJRXjhzQG/errFJa4vvP6SArG6UkG7wce4yOfoDusktZZ3CBv4BCfYMnttb9Jc8DzQmPGjj3URVjFfw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a409e730-f87b-45b6-d51e-08d8768f7a25
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3560.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2020 13:36:27.9053 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gHYFBicwUiaLOj4zfUMGHrfzP53R7t15xEmCESlZEAmj7upsFNW9GagzGCd46qAPNuh+ETQn92uZcHNPRV5mlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4164
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 mikita.lipski@amd.com, =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC0xMC0yMSAxMjozMiBwLm0uLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+IFRoZSBzdHVm
ZiBuZXZlciByZWFsbHkgd29ya2VkLCBhbmQgbGVhZHMgdG8gbG90cyBvZiBmdW4gYmVjYXVzZSBp
dAo+IG91dC1vZi1vcmRlciBmcmVlcyBhdG9taWMgc3RhdGVzLiBXaGljaCB1cHNldHMgS0FTQU4s
IGFtb25nIG90aGVyCj4gdGhpbmdzLgo+IAo+IEZvciBhc3luYyB1cGRhdGVzIHdlIG5vdyBoYXZl
IGEgbW9yZSBzb2xpZCBzb2x1dGlvbiB3aXRoIHRoZQo+IC0+YXRvbWljX2FzeW5jX2NoZWNrIGFu
ZCAtPmF0b21pY19hc3luY19jb21taXQgaG9va3MuIFN1cHBvcnQgZm9yIHRoYXQKPiBmb3IgbXNt
IGFuZCB2YzQgbGFuZGVkLiBub3V2ZWF1IGFuZCBpOTE1IGhhdmUgdGhlaXIgb3duIGNvbW1pdAo+
IHJvdXRpbmVzLCBkb2luZyBzb21ldGhpbmcgc2ltaWxhci4KPiAKPiBGb3IgZXZlcnlvbmUgZWxz
ZSBpdCdzIHByb2JhYmx5IGJldHRlciB0byByZW1vdmUgdGhlIHVzZS1hZnRlci1mcmVlCj4gYnVn
LCBhbmQgZW5jb3VyYWdlIGZvbGtzIHRvIHVzZSB0aGUgYXN5bmMgc3VwcG9ydCBpbnN0ZWFkLiBU
aGUKPiBhZmZlY3RlZCBkcml2ZXJzIHdoaWNoIHJlZ2lzdGVyIGEgbGVnYWN5IGN1cnNvciBwbGFu
ZSBhbmQgZG9uJ3QgZWl0aGVyCj4gdXNlIHRoZSBuZXcgYXN5bmMgc3R1ZmYgb3IgdGhlaXIgb3du
IGNvbW1pdCByb3V0aW5lIGFyZTogYW1kZ3B1LAo+IGF0bWVsLCBtZWRpYXRlaywgcXhsLCByb2Nr
Y2hpcCwgc3RpLCBzdW40aSwgdGVncmEsIHZpcnRpbywgYW5kIHZtd2dmeC4KPiAKPiBJbnNwaXJl
ZCBieSBhbiBhbWRncHUgYnVnIHJlcG9ydC4KPiAKPiB2MjogRHJvcCBSRkMsIEkgdGhpbmsgd2l0
aCBhbWRncHUgY29udmVydGVkIG92ZXIgdG8gdXNlCj4gYXRvbWljX2FzeW5jX2NoZWNrL2NvbW1p
dCBkb25lIGluCj4gCj4gY29tbWl0IDY3NGU3OGFjYWUwZGZiNGJlYjU2MTMyZTQxY2JhZTViNjBm
N2Q2NjIKPiBBdXRob3I6IE5pY2hvbGFzIEthemxhdXNrYXMgPG5pY2hvbGFzLmthemxhdXNrYXNA
YW1kLmNvbT4KPiBEYXRlOiAgIFdlZCBEZWMgNSAxNDo1OTowNyAyMDE4IC0wNTAwCj4gCj4gICAg
ICBkcm0vYW1kL2Rpc3BsYXk6IEFkZCBmYXN0IHBhdGggZm9yIGN1cnNvciBwbGFuZSB1cGRhdGVz
Cj4gCj4gd2UgZG9uJ3QgaGF2ZSBhbnkgZHJpdmVyIGFueW1vcmUgd2hlcmUgd2UgaGF2ZSB1c2Vy
c3BhY2UgZXhwZWN0aW5nCj4gc29saWQgbGVnYWN5IGN1cnNvciBzdXBwb3J0IF9hbmRfIHRoZXkg
YXJlIHVzaW5nIHRoZSBhdG9taWMgaGVscGVycyBpbgo+IHRoZWlyIGZ1bGx5IGdsb3J5LiBTbyB3
ZSBjYW4gcmV0aXJlIHRoaXMuCj4gCj4gUmVmZXJlbmNlczogaHR0cHM6Ly9idWd6aWxsYS5rZXJu
ZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0xOTk0MjUKPiBDYzogbWlraXRhLmxpcHNraUBhbWQuY29t
Cj4gQ2M6IE1pY2hlbCBEw6RuemVyIDxtaWNoZWxAZGFlbnplci5uZXQ+Cj4gQ2M6IGhhcnJ5Lndl
bnRsYW5kQGFtZC5jb20KPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0
dGVyQGludGVsLmNvbT4KCkknbSBmaW5lIHdpdGggdGhlIGlkZWEgYnV0IGl0IGxvb2tzIGxpa2Ug
d2UgbmVlZCBtb2RpZmljYXRpb24gdG8gYW1kZ3B1IAp0byBub3QgYnJlYWsgYW55dGhpbmc6Cgpp
ZiAoc3RhdGUtPmxlZ2FjeV9jdXJzb3JfdXBkYXRlKSB7Ci8qIC4uLiAqLwoJCXN0YXRlLT5hc3lu
Y191cGRhdGUgPQoJCQkhZHJtX2F0b21pY19oZWxwZXJfYXN5bmNfY2hlY2soZGV2LCBzdGF0ZSk7
CgoKV2Ugb25seSBjaGVjayBhc3luYyB1cGRhdGUgZm9yIGxlZ2FjeV9jdXJzb3JfdXBkYXRlcyBo
ZXJlIHdoaWNoIHdvbid0IApjb3ZlciB0aGUgYXRvbWljIHBhdGguIEkgdGhpbmsgaXQncyBzYWZl
IHRvIGRyb3AgdGhlIGNoZWNrIGhlcmUgYnV0IHRoYXQgCnNob3VsZCBwcm9iYWJseSBiZSBkb25l
IGJlZm9yZSBvciBhcyBwYXJ0IG9mIHRoaXMgc2VyaWVzLgoKUmVnYXJkcywKTmljaG9sYXMgS2F6
bGF1c2thcwoKPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX2hlbHBlci5jIHwg
MTMgLS0tLS0tLS0tLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEzIGRlbGV0aW9ucygtKQo+IAo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY19oZWxwZXIuYyBiL2RyaXZl
cnMvZ3B1L2RybS9kcm1fYXRvbWljX2hlbHBlci5jCj4gaW5kZXggYTdiY2I0YjQ1ODZjLi41NDlh
MzFlNjA0MmMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWNfaGVscGVy
LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY19oZWxwZXIuYwo+IEBAIC0xNDgx
LDEzICsxNDgxLDYgQEAgZHJtX2F0b21pY19oZWxwZXJfd2FpdF9mb3JfdmJsYW5rcyhzdHJ1Y3Qg
ZHJtX2RldmljZSAqZGV2LAo+ICAgCWludCBpLCByZXQ7Cj4gICAJdW5zaWduZWQgY3J0Y19tYXNr
ID0gMDsKPiAgIAo+IC0JIC8qCj4gLQkgICogTGVnYWN5IGN1cnNvciBpb2N0bHMgYXJlIGNvbXBs
ZXRlbHkgdW5zeW5jZWQsIGFuZCB1c2Vyc3BhY2UKPiAtCSAgKiByZWxpZXMgb24gdGhhdCAoYnkg
ZG9pbmcgdG9ucyBvZiBjdXJzb3IgdXBkYXRlcykuCj4gLQkgICovCj4gLQlpZiAob2xkX3N0YXRl
LT5sZWdhY3lfY3Vyc29yX3VwZGF0ZSkKPiAtCQlyZXR1cm47Cj4gLQo+ICAgCWZvcl9lYWNoX29s
ZG5ld19jcnRjX2luX3N0YXRlKG9sZF9zdGF0ZSwgY3J0Yywgb2xkX2NydGNfc3RhdGUsIG5ld19j
cnRjX3N0YXRlLCBpKSB7Cj4gICAJCWlmICghbmV3X2NydGNfc3RhdGUtPmFjdGl2ZSkKPiAgIAkJ
CWNvbnRpbnVlOwo+IEBAIC0yMTA2LDEyICsyMDk5LDYgQEAgaW50IGRybV9hdG9taWNfaGVscGVy
X3NldHVwX2NvbW1pdChzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAqc3RhdGUsCj4gICAJCQljb250
aW51ZTsKPiAgIAkJfQo+ICAgCj4gLQkJLyogTGVnYWN5IGN1cnNvciB1cGRhdGVzIGFyZSBmdWxs
eSB1bnN5bmNlZC4gKi8KPiAtCQlpZiAoc3RhdGUtPmxlZ2FjeV9jdXJzb3JfdXBkYXRlKSB7Cj4g
LQkJCWNvbXBsZXRlX2FsbCgmY29tbWl0LT5mbGlwX2RvbmUpOwo+IC0JCQljb250aW51ZTsKPiAt
CQl9Cj4gLQo+ICAgCQlpZiAoIW5ld19jcnRjX3N0YXRlLT5ldmVudCkgewo+ICAgCQkJY29tbWl0
LT5ldmVudCA9IGt6YWxsb2Moc2l6ZW9mKCpjb21taXQtPmV2ZW50KSwKPiAgIAkJCQkJCUdGUF9L
RVJORUwpOwo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==

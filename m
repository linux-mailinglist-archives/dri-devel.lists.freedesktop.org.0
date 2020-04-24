Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE4F1B6E8D
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 08:56:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EABE66EA76;
	Fri, 24 Apr 2020 06:56:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2072.outbound.protection.outlook.com [40.107.93.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14C176EA75
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Apr 2020 06:56:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JBzETgUxAzA3FPwUvg87Jrd81K1DCYW7hc5xVIGqqMiTCNKVqO9Byn5swexl6JnyfnVtVYBWotgNyWdMW+nefWdg6Z0vMIBJVSaYhZD7sGc/iHOD5xGqz7z9UyHFupyvUb4oWSdkJLbyVVwpqZBYb5RFOKWgzEkoY8E8opP8ovVEj1hSBm9nurY9yENMZOal0DI0afVqIGICyNLtHgPES/wUE3uFQUyZAoH1uQTHm0bI384ss7DxPfATF5w/PfkD2JzJy6DO1f0eNI/KhCuFvx/4bWAdmGT1UxxMbzcAph5wsCZWqRreCxi/dW2/t47ECFpSoxwWgaMpB6ROuwBX9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QH7dgSPwED6FG0iaisW0tDJIY4kukVdXVsRTA3s4Kdo=;
 b=mhCd7qIh3vsJQhv4z5IVp4UDmkqB8pjXKBdWmlA3W+14nnZXt49sb/30F9sTzJ48I519uN6E2sUO+tSnmlFmpGYNXy6g1DJGmvRqbAGwQ9TzFxe38PzuRaeONr1zjLkxyDpb3bbQJQM8+9SB6BPWzRY7fA6CQ9S+9tLmK/UEj03nHu2SY/JMGrOT2a4TrXTAYRnxsfRfRAeG956SISmApjgj9Za6VTw+OSUaTKEieEwCBUsdww58b/SDYS+iuZ9UYDDk2gnajYHNvWbOYpJUnM+WmufHczOZ22iZbadeHqhiJac05WEU/VSgQuBPtBS679AXBDkyFksUElTn4DwOpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QH7dgSPwED6FG0iaisW0tDJIY4kukVdXVsRTA3s4Kdo=;
 b=LeE6BFVAVN3hhVMzTzJwvtQV8fU/PgIjKo4SmE2ACU1R51WUeb0FMANDR0sRLEKz6Vfd8JThxtanXBENnLiqpsbMCDHivogeyEAHLPI7T5O4+VDGtiPABfunoP7gK8Qs9DsDr2bKIqTvc4Pb2OyD4RxAlDP/iC0Fl1EqsnkS5NU=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM6PR12MB4401.namprd12.prod.outlook.com (2603:10b6:5:2a9::15)
 by DM6PR12MB3721.namprd12.prod.outlook.com (2603:10b6:5:1c2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Fri, 24 Apr
 2020 06:56:20 +0000
Received: from DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766]) by DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766%3]) with mapi id 15.20.2937.020; Fri, 24 Apr 2020
 06:56:20 +0000
Subject: Re: [PATCH 2/2] drm/vram-helper: Alternate between bottom-up and
 top-down placement
To: Thomas Zimmermann <tzimmermann@suse.de>, Gerd Hoffmann <kraxel@redhat.com>
References: <20200422144055.27801-1-tzimmermann@suse.de>
 <20200422144055.27801-3-tzimmermann@suse.de>
 <20200423111808.fbh23br7jrkte3ih@sirius.home.kraxel.org>
 <da7bb4d1-852e-6372-cc2a-938561220483@suse.de>
 <20200423135709.3yuafqt3xouka4jp@sirius.home.kraxel.org>
 <c592baa1-7e0f-688e-1e31-bb7c8c28d8fa@amd.com>
 <abd885fb-39e3-35e6-9104-2298ad73c2c6@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <d5c457e6-6808-2a00-fa21-65601abc00cf@amd.com>
Date: Fri, 24 Apr 2020 08:56:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <abd885fb-39e3-35e6-9104-2298ad73c2c6@suse.de>
Content-Language: en-US
X-ClientProxiedBy: AM3PR05CA0117.eurprd05.prod.outlook.com
 (2603:10a6:207:2::19) To DM6PR12MB4401.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM3PR05CA0117.eurprd05.prod.outlook.com (2603:10a6:207:2::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2937.13 via Frontend Transport; Fri, 24 Apr 2020 06:56:15 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 38eebfce-d8e0-4bde-dd85-08d7e81c97fe
X-MS-TrafficTypeDiagnostic: DM6PR12MB3721:
X-Microsoft-Antispam-PRVS: <DM6PR12MB372137C2CC2A3B1ED4EC7FB683D00@DM6PR12MB3721.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 03838E948C
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4401.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(136003)(366004)(39860400002)(346002)(396003)(376002)(66556008)(31686004)(4326008)(110136005)(478600001)(66946007)(66476007)(52116002)(36756003)(86362001)(316002)(966005)(6486002)(2906002)(81156014)(31696002)(8676002)(16526019)(186003)(5660300002)(8936002)(2616005)(6666004);
 DIR:OUT; SFP:1101; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H/FNVz3qoKXdIeErA2hlwtnFyP40NpxPhHNcrxjldjh9CneMG348DqzJ6ZEBRjE+9VDe94IOFIp9QjG1ZN0osnIg2jIlMYrGqOB02othkht8z3gItrOlwk3205F8NW3Lfozon4AMoJ+m7rKpqInCi9+uoi/b5OSlWWn+sd6R9zEY8CxmlFegCdQv8GNKsT64YPljRP2tEskRbfIWpppPTa3QlTvuxUsXgSVR3ugNSyeBkD225mcs7TXJGBL/KFH1JgQaSrPkxXDLQsrBDL5wUw7P/F3ioUdaF216FPiyHQOOcUyBSU0/iLpAH5cqX7HsLO/eNdstZEMcP1p+DQ/gP4QMbyx7CoZGvoucA/ucuUM5xtGRdVpmJvPEmQcZEnOdUXlR6yqa89k3hrMk8BYv5Ts2z3cdIh2npMDye/AKI3cNUncsBPeRB9jB+5JOXdHIlzwWlnYCEe8Hsd1sxp3uEsoUGB9jD4/IwMyrxvBKAag=
X-MS-Exchange-AntiSpam-MessageData: oDkU4d+6ArtiVyPcM5giCXOGKHw7hqnvx8eXZN4h+V65le+oJjuNufVIwkk9SICA4YeiftE4TASXorRHE5plYczEggQh5EVQKZ9md5UCk3SbIN2sDRIL1n+Ijswk/Lm06jcOf6oBJyXwk8I6+fu1LK4UaCMKs7Vh4lxIKjVNXIQkGFihcpMp7/xS8eeEnjQw4MbcRr74ADadRkXXbgRt/zYWkINTEze0s9L866mv5V0mAwcIwTzyq82zu1rbPQ7z3N9wT3p4rz47p2uw8oJylrawNDcwi66d7EFW2PudjkTfFQiXdcjbj2IEuMtSb156n5+DMVSrpcwLXi0aVCe0loAT4I3RYgrxDxlTHtcS3p1qffJ+XsAfzYMRiuSp7nPfHxAGCSOMyn+mcY5Lvj5DYlNZ9XQ9oAQXPRsFHkKNTjdFA5ZvqGfojACgYlBZDQkQZYSkCs3fQtQuHB0p5kLMJdG8NhAwZfZUuMTbDAtmQ84rFfHBrmurkw2VJRGkVW4GXWpwsuI1wiamDJzWUzDyDYUdsWth2J6voswc968slCQv+z0ZmvGhC0pgapsA+T0xUaNamlMZ7iKjX9iJVtiUFvu118+xZF1Wr+3MTzCKYgdWfImxgrQk8uBmQm2xsO6WM9cRqCdXqayfs0OGOaP6KubxMAuSKOzSmXewp4M+kRjCNn3NashsocFBvaCMZB4eowtM8CFINNidoPwqSnA5XU6yS2pugyJn+3+9DaKo59a6BTE9W9YhIqwe4NrDRQmXbB/hR2SVd80YPdir//gAM4y0dU3opQr6WBFs+1+QUD7ecQQX9gFGWr8FQRmjcKktU2jZyeQRdbhBGaSBRIXMvYtD02pzbkNkRPfx6NtyXsA=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38eebfce-d8e0-4bde-dd85-08d7e81c97fe
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2020 06:56:20.6888 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nyRQVxFi9iy0Kaf9QN/0ae01D5euF1RnONDb+nErKGJSa1gac2r1jce30bYVrY2k
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3721
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
Cc: airlied@linux.ie, sam@ravnborg.org, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjQuMDQuMjAgdW0gMDg6Mjcgc2NocmllYiBUaG9tYXMgWmltbWVybWFubjoKPiBIaSBDaHJp
c3RpYW4KPgo+IEFtIDIzLjA0LjIwIHVtIDE3OjA0IHNjaHJpZWIgQ2hyaXN0aWFuIEvDtm5pZzoK
Pj4gSGkgZ3V5cywKPj4KPj4gb25lIHRoaW5nIHlvdSBkb24ndCBzZWVtIHRvIGhhdmUgY29uc2lk
ZXJlZCB5ZXQgaXMgdGhhdCBub3Qgc2V0dGluZyB0aGUKPj4gdG9wLWRvd24gZmxhZyBhbHNvIHdv
bid0IGdldCB5b3UgdGhlIGJvdHRvbS11cCBhcHByb2FjaCwgYnV0IHJhdGhlciB0aGUKPj4gYmVz
dCBmaXQuCj4gS2luZCBvZiB1bnJlbGF0ZWQ6IFdvdWxkIGl0IHBpY2sgdGhlIHNtYWxsZXN0IGZy
ZWUgYXJlYSB0aGF0IGNhbiBob2xkIGEKPiBCTz8gSU9XLCB3b3VsZCBhIHNtYWxsIGN1cnNvciBC
TyBmaWxsIHVwIGEgc21hbGwgZnJlZSBhcmVhIGV2ZW4gaWYKPiB0aGVyZSdzIGEgbXVjaCBsYXJn
ZXIgZnJlZSBhcmVhIHNvbWV3aGVyZT8KClllcywgZXhhY3RseSB0aGF0LgoKVGhlIGJvdHRvbS11
cCBtZXRob2Qgc2VhcmNoZXMgZm9yIHRoZSBsb3dlc3QgaG9sZSB3aGljaCBjYW4gZml0IHRoZSAK
cmVxdWlyZW1lbnRzLgoKVGhlIHRvcC1kb3duIG1ldGhvZCBzZWFyY2hlcyBmb3IgdGhlIGhpZ2hl
c3QgaG9sZSB3aGljaCBjYW4gZml0IHRoZSAKcmVxdWlyZW1lbnRzLgoKQm90aCBvZiB0aG9zZSB3
YWxrIHRoZSBob2xlcyBieSB0aGUgYWRkcmVzcyBpbmRleCB0cmVlLCBidXQgdGhlcmUgaXMgCmFs
c28gdGhlIGJlc3QgbWV0aG9kIHdoaWNoIGxvb2tzIGF0IHRoZSBob2xlcyBieSB0aGVpciBzaXpl
IGFuZCB0cmllcyB0byAKZmluZCB0aGUgYmVzdCBmaXQuCgpUaGUgYmVzdCBtZXRob2QgdXN1YWxs
eSBvbmx5IG5lZWRzIGEgc2luZ2xlIHRyZWUgd2FsayBpbnN0ZWFkIG9mIGEgCmxpbmVhciBzZWFy
Y2guCgo+PiBBbSAyMy4wNC4yMCB1bSAxNTo1NyBzY2hyaWViIEdlcmQgSG9mZm1hbm46Cj4+Pj4g
QnV0IGN1cnNvciBCT3MgYXJlIHNtYWxsLCBzbyB0aGV5IGRvbid0IG1ha2UgbXVjaCBvZiBhIGRp
ZmZlcmVuY2UuIFdoYXQKPj4+PiBpcyBuZWVkZWQgaXMgc3BhY2UgZm9yIDIgcHJpbWFyeSBmcmFt
ZWJ1ZmZlcnMgZHVyaW5nIHBhZ2VmbGlwcywgd2l0aCBvbmUKPj4+PiBvZiB0aGVtIHBpbm5lZC4g
VGhlIG90aGVyIGZyYW1lYnVmZmVyIGNhbiBiZSBsb2NhdGVkIGFueXdoZXJlLgo+Pj4gVGhlIHBy
b2JsZW0gaXNuJ3QgdGhlIHNpemUuwqAgVGhlIHByb2JsZW0gaXMgZHluYW1pY2FsbHkgYWxsb2Nh
dGVkIGN1cnNvcgo+Pj4gQk9zIGNhbiBhbHNvIGZyYWdtZW50IHZyYW0sIGVzcGVjaWFsbHkgaWYg
dG9wLWJvdHRvbSBhbGxvY2F0aW9uIGlzIGFsc28KPj4+IHVzZWQgZm9yIGxhcmdlIGZyYW1lYnVm
ZmVycyBzbyBjdXJzb3IgQk9zIGNhbiBlbmQgdXAgc29tZXdoZXJlIGluIHRoZQo+Pj4gbWlkZGxl
IG9mIHZyYW0uCj4+IFdlbGwgbWF5YmUgaW5zdGVhZCBvZiBhIHBpbmcvcG9uZyBhcHByb2FjaCBi
ZXR3ZWVuIHRvcCBhbmQgYm90dG9tIHVzZSBhCj4+IHNpemUgYmFzZWQgYXBwcm9hY2ggdG8gcGxh
Y2Ugc21hbGwgQk9zIGF0IHRoZSB0b3AgYW5kIG9ubHkgdGhlIGxhcmdlcgo+PiBvbmVzIGF0IHRo
ZSBib3R0b20gKG9yIHRoZSBvdGhlciB3YXkgYXJvdW5kKS4KPiBUaGF0J3Mgd2hhdCB0aGUgY3Vy
cmVudCBjb2RlIGRvZXMgYW5kIGl0IHJlc3VsdHMgaW4gdGhlIE9PTS4gQmFzaWNhbGx5LAo+IHRo
ZXJlJ3MgYSBsYXJnZSBCTyBpbiB0aGUgbWlkZGxlIG9mIHZyYW0gYW5kIHRoZSBwYWdlZmxpcCdz
IGRlc3RpbmF0aW9uCj4gQk8gZG9lcyBub3QgZml0IGJlZm9yZSBvciBhZnRlciB0aGUgbGFyZ2Ug
b25lLgoKVG91Z2ggcHJvYmxlbS4gTm8gaWRlYSBob3cgdG8gb3RoZXJ3aXNlIGZpeCB0aGlzIHdp
dGhvdXQgbWFraW5nIHRoZSAKbGFyZ2UgQk8gbW92ZWFibGUgc29tZWhvdy4KCkNocmlzdGlhbi4K
Cj4KPiBCZXN0IHJlZ2FyZHMKPiBUaG9tYXMKPgo+PiBDaGVlcnMsCj4+IENocmlzdGlhbi4KPj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4gZHJpLWRl
dmVsIG1haWxpbmcgbGlzdAo+PiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4+IGh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

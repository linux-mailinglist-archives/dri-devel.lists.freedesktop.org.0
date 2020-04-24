Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EABD1B6F1F
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 09:40:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52FF86E441;
	Fri, 24 Apr 2020 07:40:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2060.outbound.protection.outlook.com [40.107.236.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 868476E441
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Apr 2020 07:40:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fDvcHxwxlhIBJd5D41enm8iLdwBpISV6eoUGyw/LgSbNpVY436ddTT8uOrWYjFrICkyXilyFrU6gg1C5LIrFa0C5CeShO1coRWMDT0XZI+ZMt9NWpEESPYrA7flUkbp41+oZRk5z8/XBj+IKAa2/qr6iZQ6oJEruS0qeLKWND1BBP4Njp3aU5AitduNBPA9MR5q/KJHtmYKV3CwPUATnoLPNeV0dUBNNzo17WFT97TpfcpK5B3XMW1CpKc5Hf+56pIFCIqlSZIu+3vyQ5M8zvYedDzuSQRDOLnL/TcO4FhTJ4L/AQmWdBdH4IiqlggbnM3DZYT9AGqS99FfKj/HeQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ywv9idSb77ocsneb1LlQG20sTbkCg9dpSzog0QzvjHI=;
 b=VZl0POkbkq+3z8JBWtJRtnEUfgypymso5ZyTpHnNlTTs77UjJXieZQGm2vYtUrcahJBhfa7sM3qKnRbEuwCmNJK0+cWE9OQYlMIfJmnJyEieEFf7kJl+HygeQ3ij0wfiWMW5MDJ2yNfALyq7du8XvbsIiOhqOuHgMIzvSuKXJegLFDsXQuKKTTW0kAt/ppWV4ShUWT/w3Gt8dsmm4bpUo3bkHEUBlTGTuXG7+k5oAM27by244mw45VC/bS6olQtcRK2E6ffUsa5U5wZ+J4zFD9I7QNNQRT8GHr6WHRe0KHSBfiRelXTvseVX8FCKu3eZsp+sXl8Xin+glAYVfS20lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ywv9idSb77ocsneb1LlQG20sTbkCg9dpSzog0QzvjHI=;
 b=A0M0h8uADuYi0AQWn+cELoWj+2Ze3aN/sDOaxxSSx+UTSO5OBvNA5yIWkeaTG7wIPLIf54ceGMXrg/S8GZlpwj2DmuiJaATXh2fQjkynO5WmeEEqqqitN82EUzjdrxczsJucwZ4bsT6m/R1NlYGj6E807maxidIDNdMuIPJJEYk=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM6PR12MB4401.namprd12.prod.outlook.com (2603:10b6:5:2a9::15)
 by DM6PR12MB4404.namprd12.prod.outlook.com (2603:10b6:5:2a7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.22; Fri, 24 Apr
 2020 07:40:01 +0000
Received: from DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766]) by DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766%3]) with mapi id 15.20.2937.020; Fri, 24 Apr 2020
 07:40:01 +0000
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
 <d5c457e6-6808-2a00-fa21-65601abc00cf@amd.com>
 <4ead5cfc-2915-dabd-e820-6e380e442175@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <fa96736a-e827-30dc-80a0-81ba58c4ade9@amd.com>
Date: Fri, 24 Apr 2020 09:39:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <4ead5cfc-2915-dabd-e820-6e380e442175@suse.de>
Content-Language: en-US
X-ClientProxiedBy: AM0PR01CA0094.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::35) To DM6PR12MB4401.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR01CA0094.eurprd01.prod.exchangelabs.com (2603:10a6:208:10e::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13 via Frontend
 Transport; Fri, 24 Apr 2020 07:40:00 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 07798e52-15bd-4743-ce2f-08d7e822b259
X-MS-TrafficTypeDiagnostic: DM6PR12MB4404:
X-Microsoft-Antispam-PRVS: <DM6PR12MB440426C2A9000E1D6EF6797F83D00@DM6PR12MB4404.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 03838E948C
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4401.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(376002)(346002)(39860400002)(366004)(136003)(186003)(16526019)(2616005)(4326008)(81156014)(8936002)(86362001)(31696002)(52116002)(36756003)(478600001)(2906002)(8676002)(6486002)(6666004)(31686004)(66946007)(5660300002)(66476007)(66556008)(966005)(110136005)(316002);
 DIR:OUT; SFP:1101; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SgEgw/dgKaHFDKe8I7xr4tn7O5gkJMv8edrt6YQwTcQ7y+X/Nk2xv2LD6krUb9yaoEI2iPqanvF/SGc6gwD/OL3+7vorb77c6+E3ClzQAcLvoWoe0cS7uxZNLvw2rL61BJvc2d9LQA6JwNJIcsJIUjZbqV8Bm+qeXZI+0/zOoBdMnxCRCXBJ8koP0SO/p7sQPeMuzueGCBMnmWHNgwnNF4sUoNsRQmjQGm3ejsstUBOPxd5Fi/kAfle2OKStdFP35jIueTz7jugg0nwzBCQ8At5IKaXWmKDOKFNyE/jxuxHIPPRfxcAsE5Cat8V1Xw/WyhJkFNPzcHZte/yyfFocXHGDhLbiFjIyy7cmxis+S+Cdw1uiBg3/tJizROwFAaW5TutMSXstO6jmsAGCZdxkh39tY/XvBHya95CEK6WJQiXVEF9QL+rb50o71evmVGmkBGi+HB8Q+RdikPKQfSbqGZO43CoudQF/fTWIIPJygAE=
X-MS-Exchange-AntiSpam-MessageData: tl/cu4nDGGRzVsCBs6P5U51kvMMQr4Sf49hUMsOO5Hs/eQTxoPmy8Zo0+mBDsDBVZYwu29pJpXvhrBTo/atXL8ObxZN40Axu/lWxTs/fx4T1D1ur+tBsJAzGDabGkK9U9pZD3WYpC4C2YiEl7aXaj9teLkTFApa4QqGMEmaxRmPipKo681sC2x61MGJRgwKx4GBMISwFYU300KTyT7cdok3b+ospL2JnM7jnAMPrA43W8zdXwOEhLC7J7PUiy/tIVBmYiiYwhiZ6cVVAidGpTxu11g9wBTJmHp7QAN4DSui23CuVDfO9orn4TmCzvHrK2JqiVRPvqh4l5UOM2bjxQU+ioRcNBCOVqWaaj29Qw1gemjP4ccGUlVq2mCz6r8s01Ko600IRa0w3fBAhIlxBe+4QJH7yBDuKJJ+t5A7kR+Gci22TRg5ZB1v9EKiTYJHIkRxc1sHlHjihC5Kof7cZdraOJFyCa1HidTjvP1hknPRCXhOrua1zdsDfSWnWrKp57OAr5UUrw/j11NY/qv1JmbV9a4oQXq74uhA2tAVpSX28OCXDBcs5IhVBTb5iSE+ARpwioCh0E7Azca0nrGMzG+maYJWXcBsnAmuvkctsjOlrof8sj0oBkSIztTTjAbiwwTlXHMg/Hd7g/TMdwNG+Oibd0PK3bTubgMTlrsPaKYOKuWqaigDZFBtM8JJBnSRB+s0BENqGNmu6qoCOr87jJa4vM8JhmK4D65esvaKJ6ZbI6vjw8DCyN5hYKbdYXGJkWWYpnk9ZbZ2dvn4Czg2lOs+JAmY0TUtmdL+kdi32gTz8YdDCmmbXwyyLxWKSay0hOmdo0VluCC5ublpvALApNbMKD7W0wx1ptaUzKNR6xWY=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07798e52-15bd-4743-ce2f-08d7e822b259
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2020 07:40:01.6509 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3HRjxEep11iketlARK0I+ugT0W8eJ6NyZ0/nHsqQT0hNU7L2sWKbi95RbpvUSC7j
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4404
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

QW0gMjQuMDQuMjAgdW0gMDk6MDMgc2NocmllYiBUaG9tYXMgWmltbWVybWFubjoKPiBIaQo+Cj4g
QW0gMjQuMDQuMjAgdW0gMDg6NTYgc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOgo+PiBBbSAyNC4w
NC4yMCB1bSAwODoyNyBzY2hyaWViIFRob21hcyBaaW1tZXJtYW5uOgo+Pj4gSGkgQ2hyaXN0aWFu
Cj4+Pgo+Pj4gQW0gMjMuMDQuMjAgdW0gMTc6MDQgc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOgo+
Pj4+IEhpIGd1eXMsCj4+Pj4KPj4+PiBvbmUgdGhpbmcgeW91IGRvbid0IHNlZW0gdG8gaGF2ZSBj
b25zaWRlcmVkIHlldCBpcyB0aGF0IG5vdCBzZXR0aW5nIHRoZQo+Pj4+IHRvcC1kb3duIGZsYWcg
YWxzbyB3b24ndCBnZXQgeW91IHRoZSBib3R0b20tdXAgYXBwcm9hY2gsIGJ1dCByYXRoZXIgdGhl
Cj4+Pj4gYmVzdCBmaXQuCj4+PiBLaW5kIG9mIHVucmVsYXRlZDogV291bGQgaXQgcGljayB0aGUg
c21hbGxlc3QgZnJlZSBhcmVhIHRoYXQgY2FuIGhvbGQgYQo+Pj4gQk8/IElPVywgd291bGQgYSBz
bWFsbCBjdXJzb3IgQk8gZmlsbCB1cCBhIHNtYWxsIGZyZWUgYXJlYSBldmVuIGlmCj4+PiB0aGVy
ZSdzIGEgbXVjaCBsYXJnZXIgZnJlZSBhcmVhIHNvbWV3aGVyZT8KPj4gWWVzLCBleGFjdGx5IHRo
YXQuCj4gSSBzZWUuCj4KPj4gVGhlIGJvdHRvbS11cCBtZXRob2Qgc2VhcmNoZXMgZm9yIHRoZSBs
b3dlc3QgaG9sZSB3aGljaCBjYW4gZml0IHRoZQo+PiByZXF1aXJlbWVudHMuCj4gQnV0IHRoZXJl
J3Mgbm8gd2F5IHRvIGV4cGxpY3RlbHkgc2VsZWN0IGJvdHRvbS11cD8gV2hhdCBpcwo+IFRUTV9Q
TF9GTEFHX0NPTlRJR1VPVVMgZG9pbmc/CgpNYWtpbmcgc3VyZSB0aGF0IHdlIGFsbG9jYXRlIGNv
bnRpZ3VvdXMgZm9yIGFtZGdwdS4gQWRkZWQgdGhhdCBiZWNhdXNlIEkgCmNvdWxkbid0IGZpeCBh
IGZldyBwcm9ibGVtcyBvdGhlcndpc2UuCgpTaG91bGQgcHJvYmFibHkgYmUgYSBkcml2ZXIgcHJp
dmF0ZSBwbGFjZW1lbnQgZmxhZyBpbnN0ZWFkLCBidXQgZGlkbid0IApoYWQgdGltZSB0byBjbGVh
biB0aGF0IHVwLgoKUmVnYXJkcywKQ2hyaXN0aWFuLgoKPgo+IEJlc3QgcmVnYXJkcwo+IFRob21h
cwo+Cj4KPj4gVGhlIHRvcC1kb3duIG1ldGhvZCBzZWFyY2hlcyBmb3IgdGhlIGhpZ2hlc3QgaG9s
ZSB3aGljaCBjYW4gZml0IHRoZQo+PiByZXF1aXJlbWVudHMuCj4+Cj4+IEJvdGggb2YgdGhvc2Ug
d2FsayB0aGUgaG9sZXMgYnkgdGhlIGFkZHJlc3MgaW5kZXggdHJlZSwgYnV0IHRoZXJlIGlzCj4+
IGFsc28gdGhlIGJlc3QgbWV0aG9kIHdoaWNoIGxvb2tzIGF0IHRoZSBob2xlcyBieSB0aGVpciBz
aXplIGFuZCB0cmllcyB0bwo+PiBmaW5kIHRoZSBiZXN0IGZpdC4KPj4KPj4gVGhlIGJlc3QgbWV0
aG9kIHVzdWFsbHkgb25seSBuZWVkcyBhIHNpbmdsZSB0cmVlIHdhbGsgaW5zdGVhZCBvZiBhCj4+
IGxpbmVhciBzZWFyY2guCj4+Cj4+Pj4gQW0gMjMuMDQuMjAgdW0gMTU6NTcgc2NocmllYiBHZXJk
IEhvZmZtYW5uOgo+Pj4+Pj4gQnV0IGN1cnNvciBCT3MgYXJlIHNtYWxsLCBzbyB0aGV5IGRvbid0
IG1ha2UgbXVjaCBvZiBhIGRpZmZlcmVuY2UuCj4+Pj4+PiBXaGF0Cj4+Pj4+PiBpcyBuZWVkZWQg
aXMgc3BhY2UgZm9yIDIgcHJpbWFyeSBmcmFtZWJ1ZmZlcnMgZHVyaW5nIHBhZ2VmbGlwcywKPj4+
Pj4+IHdpdGggb25lCj4+Pj4+PiBvZiB0aGVtIHBpbm5lZC4gVGhlIG90aGVyIGZyYW1lYnVmZmVy
IGNhbiBiZSBsb2NhdGVkIGFueXdoZXJlLgo+Pj4+PiBUaGUgcHJvYmxlbSBpc24ndCB0aGUgc2l6
ZS7CoCBUaGUgcHJvYmxlbSBpcyBkeW5hbWljYWxseSBhbGxvY2F0ZWQKPj4+Pj4gY3Vyc29yCj4+
Pj4+IEJPcyBjYW4gYWxzbyBmcmFnbWVudCB2cmFtLCBlc3BlY2lhbGx5IGlmIHRvcC1ib3R0b20g
YWxsb2NhdGlvbiBpcyBhbHNvCj4+Pj4+IHVzZWQgZm9yIGxhcmdlIGZyYW1lYnVmZmVycyBzbyBj
dXJzb3IgQk9zIGNhbiBlbmQgdXAgc29tZXdoZXJlIGluIHRoZQo+Pj4+PiBtaWRkbGUgb2YgdnJh
bS4KPj4+PiBXZWxsIG1heWJlIGluc3RlYWQgb2YgYSBwaW5nL3BvbmcgYXBwcm9hY2ggYmV0d2Vl
biB0b3AgYW5kIGJvdHRvbSB1c2UgYQo+Pj4+IHNpemUgYmFzZWQgYXBwcm9hY2ggdG8gcGxhY2Ug
c21hbGwgQk9zIGF0IHRoZSB0b3AgYW5kIG9ubHkgdGhlIGxhcmdlcgo+Pj4+IG9uZXMgYXQgdGhl
IGJvdHRvbSAob3IgdGhlIG90aGVyIHdheSBhcm91bmQpLgo+Pj4gVGhhdCdzIHdoYXQgdGhlIGN1
cnJlbnQgY29kZSBkb2VzIGFuZCBpdCByZXN1bHRzIGluIHRoZSBPT00uIEJhc2ljYWxseSwKPj4+
IHRoZXJlJ3MgYSBsYXJnZSBCTyBpbiB0aGUgbWlkZGxlIG9mIHZyYW0gYW5kIHRoZSBwYWdlZmxp
cCdzIGRlc3RpbmF0aW9uCj4+PiBCTyBkb2VzIG5vdCBmaXQgYmVmb3JlIG9yIGFmdGVyIHRoZSBs
YXJnZSBvbmUuCj4+IFRvdWdoIHByb2JsZW0uIE5vIGlkZWEgaG93IHRvIG90aGVyd2lzZSBmaXgg
dGhpcyB3aXRob3V0IG1ha2luZyB0aGUKPj4gbGFyZ2UgQk8gbW92ZWFibGUgc29tZWhvdy4KPj4K
Pj4gQ2hyaXN0aWFuLgo+Pgo+Pj4gQmVzdCByZWdhcmRzCj4+PiBUaG9tYXMKPj4+Cj4+Pj4gQ2hl
ZXJzLAo+Pj4+IENocmlzdGlhbi4KPj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+Pj4+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPj4+PiBkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4+Pj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKPj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+PiBkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK

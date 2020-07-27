Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E47E822EE36
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jul 2020 16:05:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 770C78999C;
	Mon, 27 Jul 2020 14:05:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770048.outbound.protection.outlook.com [40.107.77.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF1DE8999C;
 Mon, 27 Jul 2020 14:05:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mWV6WuMtMk6rocvkzEbro5hagm2kyvsZSLviCquEv8kakqfxus6GfoJV5Dp9/49Ki21BTciTdQh6zRM++THtk9UdCEOGVcFIKifuTOxYTuws1mKCFx861xPs2aXN32q4+kYBSI5GqavcvzzVm37lp/GzoHz+cj7z8LTwcmRHIh03onDIoXWyEm8vo005DmIB/TxOFKJWL6Q/CxkEptNnQc8GFTTjPaggmStalbrQ/iyQdTVw6kfNnv1ZjKNCtRN04g2KotvWS59Qvmpg+oxBoxreIk7ab92pdixWS3LN7M78cbYUaUCXSIoKUIrpAGaIcqqDSikpq0E/Ab8zFRbTXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aHYTdusamJwCxX+n1ab6vpKjAtGGwKntZgQhiD1AwdI=;
 b=bqedtU8iC2xtIruEs2/Rs8Zea/cyfQ4yHo71n4jZG5WKnH+x9Rtp2gZitoca0JJF5E1rBEijddeOMkVDJ0oQB1S6v+o3HyDfC71GflEDUfIbOghzbXURiSERJk1oFUnR3a1+4ZpmAGehrk5eaOZHG9uNn/FZaPhadhY/gTJ5IV9lJ9mAzK8jcMS//a4RVLUbynId5S8gnZhT1m0rNAbFD1NFFuHLg5HLTbKwchRhhbvHduvsGzhSl84DUPtWR3TnVx/4LwCxkNaikWbd4ZLLOo1f+sNd7fhzSMiTsLBROzIl1+J5UDCAI8z+bfrd4zYQr+Auejy0+b0+JmuDxF2W/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aHYTdusamJwCxX+n1ab6vpKjAtGGwKntZgQhiD1AwdI=;
 b=DiLyrUB+MM6woOZpBeKR5HQ2YLoqataV+zuObuMYYC6CihKCgMAo2GKkJD/8GzupL46GBaKsBoeFTD3qqnoZXj7MjIPFdIgzBvYZkIfQIjbGC+EALYamxNfj4fuo/xqTFLEPkKdiym9kTRgaNuiUOaMyUCxwR63I/o7JfORyQco=
Authentication-Results: molgen.mpg.de; dkim=none (message not signed)
 header.d=none;molgen.mpg.de; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3561.namprd12.prod.outlook.com (2603:10b6:5:3e::26) by
 DM5PR12MB2533.namprd12.prod.outlook.com (2603:10b6:4:b0::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.33; Mon, 27 Jul 2020 14:05:06 +0000
Received: from DM6PR12MB3561.namprd12.prod.outlook.com
 ([fe80::6df0:61cb:d37:2a0b]) by DM6PR12MB3561.namprd12.prod.outlook.com
 ([fe80::6df0:61cb:d37:2a0b%6]) with mapi id 15.20.3216.033; Mon, 27 Jul 2020
 14:05:05 +0000
Subject: Re: [PATCH] drm/amd/display: Clear dm_state for fast updates
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Mazin Rezk <mnrzk@protonmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <M0lxN5AUlPvzBKULfIBe5BZRwfQGXeMQCdWItYcQ-9P79y32WzExYK2Y0DwyNVtyGelqbvV07_lFk1oeT4cApbT-P_oH0bnxQbMmFsJv_xg=@protonmail.com>
 <ba078fb0-0dbc-df06-cfe9-f9537883f82a@amd.com>
From: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
Message-ID: <e2f55480-c24f-6c85-08d3-21131a22d0bf@amd.com>
Date: Mon, 27 Jul 2020 10:05:01 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <ba078fb0-0dbc-df06-cfe9-f9537883f82a@amd.com>
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0028.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::41)
 To DM6PR12MB3561.namprd12.prod.outlook.com
 (2603:10b6:5:3e::26)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.148.234] (165.204.55.211) by
 YT1PR01CA0028.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.23 via Frontend Transport; Mon, 27 Jul 2020 14:05:05 +0000
X-Originating-IP: [165.204.55.211]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ce32ea47-ff5a-4409-7610-08d83236105c
X-MS-TrafficTypeDiagnostic: DM5PR12MB2533:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB2533F4F2C0A305F8ACEA8FF4EC720@DM5PR12MB2533.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WIPxJAHC7JD/TACeQk37iMu6chvccei3WefcaRuxFLSQsp3nXrUBiXS2iSj+ET0eWuPnOfYllXRJErWtUoELWwflKmWvZPs9xYgcCh/w2g3Wc4EP58S7aoHMMyuSZoBBhPNWek19zQcIW/ag8u1Vcndc/Zp2V5qFNwMC5Va4WzHmxReN5LO82LyBZt1FK7y6A494BVKd5grT+VWXmQpdJAhm+vDcHRc8gy7BYWQhpTsQiVS14he7And/DRmJfNZ59kV3xLxd6OiMpTvDRVY9xIyIb6JA4PLvd1qOJGZKVU3DK0fYHjS2AetIU8x8f2KoMP5614quJlcvsWYqr1jsTSrmvMYvTKeg9TahsJerWxBKpEnSBlk/kZBgPYx4/FCO6WrLMMwZ7wFRxqt4isK6tqmrYcqNtH79DIaU4kKKLxaeBKtXgAAfRVZ+LzS62TqPLk/Bjl+3aQNJf3MwOJglCQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3561.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(346002)(366004)(136003)(376002)(39860400002)(316002)(86362001)(5660300002)(6486002)(66574015)(8936002)(8676002)(16576012)(54906003)(15650500001)(110136005)(2906002)(31696002)(66476007)(66556008)(26005)(53546011)(16526019)(66946007)(36756003)(83380400001)(186003)(478600001)(966005)(2616005)(956004)(4326008)(52116002)(6666004)(31686004)(7416002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: BagserpB/3ffAcri9c/WWJS8tKIDgEA1GdBnAFShHv1BE8poIcorEQzGsAGjSTG+KcD7e2vQs3CIIQ/S6fmZP+IIQzGQxL19PTdsLNdlvGEbwFRrv1x/FdfWjVzy190t8Idra+xixgoNHVZtt467ea0v+ymHOFMeb1ZDZaeD7LAS9/JBroWwchg7ga+QdVgLuOi0YNfEF5pI9dql9GeHMhPbgd40Lqj+ZP2cu6ncSVpuZ6FOTSerurvFmjlpdpQzwfCR/B4lLZXJypHZxpWC33S9S7UJmI9cul3SX1sL8hcUBtFBxUc4MShTdPSRYn/fU3etapmyrriBu3fE2B0QpiZSG20y+MHHMHQO0H8B7xi2TLQU13JX0NCsGTTi2NItVNc38TIW+t//7KBkXKTw1CUucXeMviHH5sGJS2RTJfky0dImWzDdUHh9A8D46/4W0M9F9zKX1zE2k0IVS5G5W7OpO6BDmdkESZruSHdbRIGtNFzEN8zfw8CBoWpXcjZ5
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce32ea47-ff5a-4409-7610-08d83236105c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3561.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2020 14:05:05.8662 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YEmoDu1n2h+CFMI+hscf6qPgNuqVhux+kSXVqJ1iPlH2Uit2jWeqvpBrDK+8h7bckqlFVuRgmcWWI6CLXynM1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2533
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
Cc: Paul Menzel <pmenzel@molgen.mpg.de>,
 "anthony.ruhier@gmail.com" <anthony.ruhier@gmail.com>,
 Duncan <1i5t5.duncan@cox.net>, Kees Cook <keescook@chromium.org>,
 "sunpeng.li@amd.com" <sunpeng.li@amd.com>,
 "regressions@leemhuis.info" <regressions@leemhuis.info>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "mphantomx@yahoo.com.br" <mphantomx@yahoo.com.br>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC0wNy0yNyA5OjM5IGEubS4sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4gQW0gMjcu
MDcuMjAgdW0gMDc6NDAgc2NocmllYiBNYXppbiBSZXprOgo+PiBUaGlzIHBhdGNoIGZpeGVzIGEg
cmFjZSBjb25kaXRpb24gdGhhdCBjYXVzZXMgYSB1c2UtYWZ0ZXItZnJlZSBkdXJpbmcKPj4gYW1k
Z3B1X2RtX2F0b21pY19jb21taXRfdGFpbC4gVGhpcyBjYW4gb2NjdXIgd2hlbiAyIG5vbi1ibG9j
a2luZyBjb21taXRzCj4+IGFyZSByZXF1ZXN0ZWQgYW5kIHRoZSBzZWNvbmQgb25lIGZpbmlzaGVz
IGJlZm9yZSB0aGUgZmlyc3QuIEVzc2VudGlhbGx5LAo+PiB0aGlzIGJ1ZyBvY2N1cnMgd2hlbiB0
aGUgZm9sbG93aW5nIHNlcXVlbmNlIG9mIGV2ZW50cyBoYXBwZW5zOgo+Pgo+PiAxLiBOb24tYmxv
Y2tpbmcgY29tbWl0ICMxIGlzIHJlcXVlc3RlZCB3LyBhIG5ldyBkbV9zdGF0ZSAjMSBhbmQgaXMK
Pj4gZGVmZXJyZWQgdG8gdGhlIHdvcmtxdWV1ZS4KPj4KPj4gMi4gTm9uLWJsb2NraW5nIGNvbW1p
dCAjMiBpcyByZXF1ZXN0ZWQgdy8gYSBuZXcgZG1fc3RhdGUgIzIgYW5kIGlzCj4+IGRlZmVycmVk
IHRvIHRoZSB3b3JrcXVldWUuCj4+Cj4+IDMuIENvbW1pdCAjMiBzdGFydHMgYmVmb3JlIGNvbW1p
dCAjMSwgZG1fc3RhdGUgIzEgaXMgdXNlZCBpbiB0aGUKPj4gY29tbWl0X3RhaWwgYW5kIGNvbW1p
dCAjMiBjb21wbGV0ZXMsIGZyZWVpbmcgZG1fc3RhdGUgIzEuCj4+Cj4+IDQuIENvbW1pdCAjMSBz
dGFydHMgYWZ0ZXIgY29tbWl0ICMyIGNvbXBsZXRlcywgdXNlcyB0aGUgZnJlZWQgZG1fc3RhdGUK
Pj4gMSBhbmQgZGVyZWZlcmVuY2VzIGEgZnJlZWxpc3QgcG9pbnRlciB3aGlsZSBzZXR0aW5nIHRo
ZSBjb250ZXh0Lgo+IAo+IFdlbGwgSSBvbmx5IGhhdmUgYSBvbmUgbWlsZSBoaWdoIHZpZXcgb24g
dGhpcywgYnV0IHdoeSBkb24ndCB5b3UgbGV0IHRoZSAKPiB3b3JrIGl0ZW1zIGV4ZWN1dGUgaW4g
b3JkZXI/Cj4gCj4gVGhhdCB3b3VsZCBiZSBiZXR0ZXIgYW55d2F5IGNhdXNlIHRoaXMgd2F5IHdl
IGRvbid0IHRyaWdnZXIgYSBjYWNoZSBsaW5lIAo+IHBpbmcgcG9uZyBiZXR3ZWVuIENQVXMuCj4g
Cj4gQ2hyaXN0aWFuLgoKV2UgdXNlIHRoZSBEUk0gaGVscGVycyBmb3IgbWFuYWdpbmcgZHJtX2F0
b21pY19jb21taXRfc3RhdGUgYW5kIHRob3NlIApoZWxwZXJzIGludGVybmFsbHkgcHVzaCBub24t
YmxvY2tpbmcgY29tbWl0IHdvcmsgaW50byB0aGUgc3lzdGVtIHVuYm91bmQgCndvcmsgcXVldWUu
CgpXaGlsZSB3ZSBjb3VsZCBkdXBsaWNhdGUgYSBjb3B5IG9mIHRoYXQgY29kZSB3aXRoIG5vdGhp
bmcgYnV0IHRoZSAKd29ya3F1ZXVlIGNoYW5nZWQgdGhhdCBpc24ndCBzb21ldGhpbmcgSSdkIHJl
YWxseSBsaWtlIHRvIG1haW50YWluIGdvaW5nIApmb3J3YXJkLgoKUmVnYXJkcywKTmljaG9sYXMg
S2F6bGF1c2thcwoKPiAKPj4KPj4gU2luY2UgdGhpcyBidWcgaGFzIG9ubHkgYmVlbiBzcG90dGVk
IHdpdGggZmFzdCBjb21taXRzLCB0aGlzIHBhdGNoIGZpeGVzCj4+IHRoZSBidWcgYnkgY2xlYXJp
bmcgdGhlIGRtX3N0YXRlIGluc3RlYWQgb2YgdXNpbmcgdGhlIG9sZCBkY19zdGF0ZSBmb3IKPj4g
ZmFzdCB1cGRhdGVzLiBJbiBhZGRpdGlvbiwgc2luY2UgZG1fc3RhdGUgaXMgb25seSB1c2VkIGZv
ciBpdHMgZGNfc3RhdGUKPj4gYW5kIGFtZGdwdV9kbV9hdG9taWNfY29tbWl0X3RhaWwgd2lsbCBy
ZXRhaW4gdGhlIGRjX3N0YXRlIGlmIG5vbmUgaXMgCj4+IGZvdW5kLAo+PiByZW1vdmluZyB0aGUg
ZG1fc3RhdGUgc2hvdWxkIG5vdCBoYXZlIGFueSBjb25zZXF1ZW5jZXMgaW4gZmFzdCB1cGRhdGVz
Lgo+Pgo+PiBUaGlzIHVzZS1hZnRlci1mcmVlIGJ1ZyBoYXMgZXhpc3RlZCBmb3IgYSB3aGlsZSBu
b3csIGJ1dCBvbmx5IGNhdXNlZCBhCj4+IG5vdGljZWFibGUgaXNzdWUgc3RhcnRpbmcgZnJvbSA1
LjctcmMxIGR1ZSB0byAzMjAyZmE2MmYgKCJzbHViOiByZWxvY2F0ZQo+PiBmcmVlbGlzdCBwb2lu
dGVyIHRvIG1pZGRsZSBvZiBvYmplY3QiKSBtb3ZpbmcgdGhlIGZyZWVsaXN0IHBvaW50ZXIgZnJv
bQo+PiBkbV9zdGF0ZS0+YmFzZSAod2hpY2ggd2FzIHVudXNlZCkgdG8gZG1fc3RhdGUtPmNvbnRl
eHQgKHdoaWNoIGlzCj4+IGRlcmVmZXJlbmNlZCkuCj4+Cj4+IEJ1Z3ppbGxhOiAKPj4gaHR0cHM6
Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDczODMgCj4+Cj4+IEZpeGVz
OiBiZDIwMGQxOTBmNDUgKCJkcm0vYW1kL2Rpc3BsYXk6IERvbid0IHJlcGxhY2UgdGhlIGRjX3N0
YXRlIGZvciAKPj4gZmFzdCB1cGRhdGVzIikKPj4gUmVwb3J0ZWQtYnk6IER1bmNhbiA8MWk1dDUu
ZHVuY2FuQGNveC5uZXQ+Cj4+IFNpZ25lZC1vZmYtYnk6IE1hemluIFJlemsgPG1ucnprQHByb3Rv
bm1haWwuY29tPgo+PiAtLS0KPj4gwqAgLi4uL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2Rt
L2FtZGdwdV9kbS5jIHwgMzYgKysrKysrKysrKysrKystLS0tLQo+PiDCoCAxIGZpbGUgY2hhbmdl
ZCwgMjcgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgCj4+IGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwo+PiBpbmRleCA4
NmZmYTBjMjg4MGYuLjcxMGVkYzcwZTM3ZSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwo+PiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCj4+IEBAIC04NzE3LDIwICs4NzE3
LDM4IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2RtX2F0b21pY19jaGVjayhzdHJ1Y3QgCj4+IGRybV9k
ZXZpY2UgKmRldiwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiB0aGUgc2FtZSByZXNvdXJjZS4g
SWYgd2UgaGF2ZSBhIG5ldyBEQyBjb250ZXh0IGFzIHBhcnQgb2YKPj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqAgKiB0aGUgRE0gYXRvbWljIHN0YXRlIGZyb20gdmFsaWRhdGlvbiB3ZSBuZWVkIHRvIGZy
ZWUgaXQgYW5kCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgICogcmV0YWluIHRoZSBleGlzdGluZyBv
bmUgaW5zdGVhZC4KPj4gK8KgwqDCoMKgwqDCoMKgwqAgKgo+PiArwqDCoMKgwqDCoMKgwqDCoCAq
IEZ1cnRoZXJtb3JlLCBzaW5jZSB0aGUgRE0gYXRvbWljIHN0YXRlIG9ubHkgY29udGFpbnMgdGhl
IERDCj4+ICvCoMKgwqDCoMKgwqDCoMKgICogY29udGV4dCBhbmQgY2FuIHNhZmVseSBiZSBhbm51
bGxlZCwgd2UgY2FuIGZyZWUgdGhlIHN0YXRlCj4+ICvCoMKgwqDCoMKgwqDCoMKgICogYW5kIGNs
ZWFyIHRoZSBhc3NvY2lhdGVkIHByaXZhdGUgb2JqZWN0IG5vdyB0byBmcmVlCj4+ICvCoMKgwqDC
oMKgwqDCoMKgICogc29tZSBtZW1vcnkgYW5kIGF2b2lkIGEgcG9zc2libGUgdXNlLWFmdGVyLWZy
ZWUgbGF0ZXIuCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgICovCj4+IC3CoMKgwqDCoMKgwqDCoCBz
dHJ1Y3QgZG1fYXRvbWljX3N0YXRlICpuZXdfZG1fc3RhdGUsICpvbGRfZG1fc3RhdGU7Cj4+Cj4+
IC3CoMKgwqDCoMKgwqDCoCBuZXdfZG1fc3RhdGUgPSBkbV9hdG9taWNfZ2V0X25ld19zdGF0ZShz
dGF0ZSk7Cj4+IC3CoMKgwqDCoMKgwqDCoCBvbGRfZG1fc3RhdGUgPSBkbV9hdG9taWNfZ2V0X29s
ZF9zdGF0ZShzdGF0ZSk7Cj4+ICvCoMKgwqDCoMKgwqDCoCBmb3IgKGkgPSAwOyBpIDwgc3RhdGUt
Pm51bV9wcml2YXRlX29ianM7IGkrKykgewo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1
Y3QgZHJtX3ByaXZhdGVfb2JqICpvYmogPSBzdGF0ZS0+cHJpdmF0ZV9vYmpzW2ldLnB0cjsKPj4K
Pj4gLcKgwqDCoMKgwqDCoMKgIGlmIChuZXdfZG1fc3RhdGUgJiYgb2xkX2RtX3N0YXRlKSB7Cj4+
IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChuZXdfZG1fc3RhdGUtPmNvbnRleHQpCj4+IC3C
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGNfcmVsZWFzZV9zdGF0ZShuZXdfZG1fc3Rh
dGUtPmNvbnRleHQpOwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAob2JqLT5mdW5jcyA9
PSBhZGV2LT5kbS5hdG9taWNfb2JqLmZ1bmNzKSB7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgaW50IGogPSBzdGF0ZS0+bnVtX3ByaXZhdGVfb2Jqcy0xOwo+Pgo+PiAtwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBuZXdfZG1fc3RhdGUtPmNvbnRleHQgPSBvbGRfZG1fc3RhdGUtPmNv
bnRleHQ7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZG1fYXRvbWljX2Rlc3Ry
b3lfc3RhdGUob2JqLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBzdGF0ZS0+cHJpdmF0ZV9vYmpzW2ldLnN0YXRlKTsKPj4gKwo+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qIElmIGkgaXMgbm90IGF0IHRoZSBlbmQgb2YgdGhlIGFy
cmF5IHRoZW4gdGhlCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIGxhc3Qg
ZWxlbWVudCBuZWVkcyB0byBiZSBtb3ZlZCB0byB3aGVyZSBpIHdhcwo+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBiZWZvcmUgdGhlIGFycmF5IGNhbiBzYWZlbHkgYmUgdHJ1
bmNhdGVkLgo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKi8KPj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoaSAhPSBqKQo+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RhdGUtPnByaXZhdGVfb2Jqc1tpXSA9Cj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0YXRlLT5wcml2YXRl
X29ianNbal07Cj4+Cj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChvbGRfZG1fc3RhdGUt
PmNvbnRleHQpCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGNfcmV0YWluX3N0
YXRlKG9sZF9kbV9zdGF0ZS0+Y29udGV4dCk7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgc3RhdGUtPnByaXZhdGVfb2Jqc1tqXS5wdHIgPSBOVUxMOwo+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHN0YXRlLT5wcml2YXRlX29ianNbal0uc3RhdGUgPSBOVUxMOwo+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0YXRlLT5wcml2YXRlX29ianNbal0u
b2xkX3N0YXRlID0gTlVMTDsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdGF0
ZS0+cHJpdmF0ZV9vYmpzW2pdLm5ld19zdGF0ZSA9IE5VTEw7Cj4+ICsKPj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBzdGF0ZS0+bnVtX3ByaXZhdGVfb2JqcyA9IGo7Cj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIH0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIH0KPj4gwqDCoMKgwqDCoCB9Cj4+Cj4+IC0tIAo+
PiAyLjI3LjAKPj4KPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=

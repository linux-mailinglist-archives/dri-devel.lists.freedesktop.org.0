Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 934FB1038BC
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 12:31:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6DB56E286;
	Wed, 20 Nov 2019 11:31:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760059.outbound.protection.outlook.com [40.107.76.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55F346E286;
 Wed, 20 Nov 2019 11:31:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ikLCu0WQFwjdpKT85uglUg6VaJ/s0BvB6kIDaHmiJzZI0mtdeu8GFLBi+JniBazBgnCBxEitCiVQ449ekLj+GA7rgO2YWFtRkw8TzkrnRiWlZVIMsmqoTpRK1mBM5roZY9W+2Dg9z7F5fnu+muNX6ovi51NagET6IE3rM49/Evfvxk5MDUp1vK7gy6u3Wt8oB/UW/kwtrXLRhHiki1JLwkaQWgEV8+MlTlhDrXe95lN9rYEIzEV1rmTY2Fix1gh+tQzmBK6tjQM/kibEEc9KHDl59yUP37afByCGcIZ8e8O9gtAMrBaRg7295yCeaa4eJSlI+dbkOuq3YQ/m5J5nyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KCXxNyloWBorNsqO4fdCFq8jLjOvxrkCuCoU/NOYikY=;
 b=mGz4jTDSVyE12XREG4vkjv8/leAANR3uPqgr9elkwpfwWnFzmWfssckdKHBX9NkE/pmxujwoT2HYaXF//Ud1/0iHMBMwqRmpH2aL59NxshTrHShIiCCpiXdxRkIIllLlx33c+KhVmWSOW8JwPn9JMMAbtrSTNSUuGgi2S/reSCRrBPD5ah3bKwrsoLtXvS1mCIggA2lgjSFbeG1m8+y9fhwtsdPmI91fHmjyVbTWtN9P0PnXPyLibD67z1euFVCDAgo5loNEMSD/oXIniVDTzySSy7oEVG8N63ojFJ4/0DOcr5UhxyQgCL3bMRssjGhWynROYaXBvBb3Y9VMuisu1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1642.namprd12.prod.outlook.com (10.172.35.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.29; Wed, 20 Nov 2019 11:31:07 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::e5e7:96f0:ad90:d933]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::e5e7:96f0:ad90:d933%7]) with mapi id 15.20.2451.031; Wed, 20 Nov 2019
 11:31:07 +0000
Subject: Re: [PATCH 2/3] dma-resv: Also prime acquire ctx for lockdep
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20191119210844.16947-1-daniel.vetter@ffwll.ch>
 <20191119210844.16947-3-daniel.vetter@ffwll.ch>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <7fb69a1a-170a-9afa-7de8-d511cbd20c39@amd.com>
Date: Wed, 20 Nov 2019 12:30:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20191119210844.16947-3-daniel.vetter@ffwll.ch>
Content-Language: en-US
X-ClientProxiedBy: AM0PR01CA0116.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::21) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
MIME-Version: 1.0
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b56f851e-0204-479e-183a-08d76dad2260
X-MS-TrafficTypeDiagnostic: DM5PR12MB1642:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB16424A8F5A67034CE1CBC6A7834F0@DM5PR12MB1642.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 02272225C5
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(346002)(39860400002)(366004)(396003)(189003)(199004)(51444003)(52314003)(99286004)(65956001)(65806001)(6666004)(47776003)(23676004)(2486003)(386003)(6506007)(76176011)(52116002)(81166006)(8936002)(81156014)(316002)(25786009)(478600001)(229853002)(58126008)(110136005)(8676002)(54906003)(14444005)(186003)(2616005)(46003)(305945005)(11346002)(86362001)(476003)(7416002)(446003)(7736002)(486006)(31696002)(6116002)(66556008)(2906002)(50466002)(5660300002)(66946007)(31686004)(36756003)(66574012)(6486002)(14454004)(6246003)(2870700001)(4326008)(6512007)(6436002)(66476007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1642;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6+7H5W/WD4L1/G6ZucWC5dIeK7zgoCTgqjAvLwwTk5s65AfrQKf8+musycxImN4W0cNWThUDRrS8GJ6dVXvHSqjZ1z6a6kAhB6KudJANDZrz90lOzrouq3uGTQ0NULZ+Txnzu3rMaorm2MwT8+q8CUuqXPtlh1XGMM99P9JZrIR2Lvj0j/H9ZvSe9/byzWYd4yYMgZwL178tK/7TV+6SqRpf8ZChlySdEGnxwEITg0TsQV02B0XUeLyQIRFm3tMaumy47p3w+fwIIUcITPH125hebs6orGTguwwi9EY/3AGOW6dJJ12Eh29i9uzMC+qmMImJTAYv0K2N+LQ9m0x+t4x97lIltMZl0qpDTjlodgABiK/UXW0Up3HlZqTE6lv/pb/aEOAVLJKGlKTIdZlGheuSuE1b2WEJieG/41pILg0GUc71k4rsr+kIOj3qSSXc
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b56f851e-0204-479e-183a-08d76dad2260
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2019 11:31:07.3475 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jkSUknKuls1nXVg9VlYC+Jp/AEjoVVqtLnd9GbjduHApRr8hQTkoyxs46KzNFfj3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1642
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KCXxNyloWBorNsqO4fdCFq8jLjOvxrkCuCoU/NOYikY=;
 b=tF0bMginlZRvTf+v530TxrDwQAs/pzBSF7pntc14C/5In3LdjWHz09LCF581+D653GBHE/KJRwSVngBkNsaf6Au3TvKzQpDjzxh2kxqV2cAU4ZgnYGB1GS2P2vjyt2lC6Cdo+TY1B1yvj6TzAgd/HwI+CkuPYL+kwifh5xybI7o=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: linaro-mm-sig@lists.linaro.org, Huang Rui <ray.huang@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>, Russell King <linux+etnaviv@armlinux.org.uk>,
 Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Sean Paul <sean@poorly.run>,
 linux-media@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTkuMTEuMTkgdW0gMjI6MDggc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IFNlbW5hdGljYWxs
eSBpdCByZWFsbHkgZG9lc24ndCBtYXR0ZXIgd2hlcmUgd2UgZ3JhYiB0aGUgdGlja2V0LiBCdXQK
PiBzaW5jZSB0aGUgdGlja2V0IGlzIGEgZmFrZSBsb2NrZGVwIGxvY2ssIGl0IG1hdHRlcnMgZm9y
IGxvY2tkZXAKPiB2YWxpZGF0aW9uIHB1cnBvc2VzLgo+Cj4gVGhpcyBtZWFucyBzdHVmZiBsaWtl
IGdyYWJiaW5nIGEgdGlja2V0IGFuZCB0aGVuIGRvaW5nCj4gY29weV9mcm9tL3RvX3VzZXIgaXNu
J3QgYWxsb3dlZCBhbnltb3JlLiBUaGlzIGlzIGEgY2hhbmdlZCBjb21wYXJlZCB0bwo+IHRoZSBj
dXJyZW50IHR0bSBmYXVsdCBoYW5kbGVyLCB3aGljaCBkb2Vzbid0IGJvdGhlciB3aXRoIGhhdmlu
ZyBhIGZ1bGwKPiByZXNlcnZhdGlvbi4gU2luY2UgSSdtIGxvb2tpbmcgaW50byBmaXhpbmcgdGhl
IFRPRE8gZW50cnkgaW4KPiB0dG1fbWVtX2V2aWN0X3dhaXRfYnVzeSgpIEkgdGhpbmsgdGhhdCds
bCBoYXZlIHRvIGNoYW5nZSBzb29uZXIgb3IKPiBsYXRlciBhbnl3YXksIGJldHRlciBnZXQgc3Rh
cnRlZC4gQSBiaXQgbW9yZSBjb250ZXh0IG9uIHdoeSBJJ20KPiBsb29raW5nIGludG8gdGhpczog
Rm9yIGJhY2t3YXJkcyBjb21wYXQgd2l0aCBleGlzdGluZyBpOTE1IGdlbSBjb2RlIEkKPiB0aGlu
ayB3ZSdsbCBoYXZlIHRvIGRvIGZ1bGwgc2xvd3BhdGggbG9ja2luZyBpbiB0aGUgaTkxNSBlcXVp
dmFsZW50IG9mCj4gdGhlIGV2aWN0aW9uIGNvZGUuIEFuZCB3aXRoIGR5bmFtaWMgZG1hLWJ1ZiB0
aGF0IHdpbGwgbGVhayBhY3Jvc3MKPiBkcml2ZXJzLCBzbyBhbm90aGVyIHRoaW5nIHdlIG5lZWQg
dG8gc3RhbmRhcmRpemUgYW5kIG1ha2Ugc3VyZSBpdCdzCj4gZG9uZSB0aGUgc2FtZSB3YXkgZXZl
cnl3YXkuCj4KPiBVbmZvcnR1bmF0ZWx5IHRoaXMgbWVhbnMgYW5vdGhlciBmdWxsIGF1ZGl0IG9m
IGFsbCBkcml2ZXJzOgo+Cj4gLSBnZW0gaGVscGVyczogYWNxdWlyZV9pbml0IGlzIGRvbmUgcmln
aHQgYmVmb3JlIHRha2luZyBsb2Nrcywgc28gbm8KPiAgICBwcm9ibGVtLiBTYW1lIGZvciBhY3F1
aXJlX2ZpbmkgYW5kIHVubG9ja2luZywgd2hpY2ggbWVhbnMgbm90aGluZwo+ICAgIHRoYXQncyBu
b3QgYWxyZWFkeSBjb3ZlcmVkIGJ5IHRoZSBkbWFfcmVzdl9sb2NrIHJ1bGVzIHdpbGwgYmUgY2F1
Z2h0Cj4gICAgd2l0aCB0aGlzIGV4dGVuc2lvbiBoZXJlIHRvIHRoZSBhY3F1aXJlX2N0eC4KPgo+
IC0gZXRuYXZpdjogQW4gYWJzb2x1dGUgbWFzc2l2ZSBhbW91bnQgb2YgY29kZSBpcyBydW4gYmV0
d2VlbiB0aGUKPiAgICBhY3F1aXJlX2luaXQgYW5kIHRoZSBmaXJzdCBsb2NrIGFjcXVpc2l0aW9u
IGluIHN1Ym1pdF9sb2NrX29iamVjdHMuCj4gICAgQnV0IG5vdGhpbmcgdGhhdCB3b3VsZCB0b3Vj
aCB1c2VyIG1lbW9yeSBhbmQgY291bGQgY2F1c2UgYSBmYXVsdC4KPiAgICBGdXJ0aGVybW9yZSBu
b3RoaW5nIHRoYXQgdXNlcyB0aGUgdGlja2V0LCBzbyBldmVuIGlmIEkgbWlzc2VkCj4gICAgc29t
ZXRoaW5nLCBpdCB3b3VsZCBiZSBlYXN5IHRvIGZpeCBieSBwdXNoaW5nIHRoZSBhY3F1aXJlX2lu
aXQgcmlnaHQKPiAgICBiZWZvcmUgdGhlIGZpcnN0IHVzZS4gU2ltaWxhciBvbiB0aGUgdW5sb2Nr
L2FjcXVpcmVfZmluaSBzaWRlLgo+Cj4gLSBpOTE1OiBSaWdodCBub3cgKGFuZCB0aGlzIHdpbGwg
bGlrZWx5IGNoYW5nZSBhIGxvdCByc24pIHRoZSBhY3F1aXJlCj4gICAgY3R4IGFuZCBhY3R1YWwg
bG9ja3MgYXJlIHJpZ2h0IG5leHQgdG8gZWFjaCBhbm90aGVyLiBObyBwcm9ibGVtLgo+Cj4gLSBt
c20gaGFzIGEgcHJvYmxlbTogc3VibWl0X2NyZWF0ZSBjYWxscyBhY3F1aXJlX2luaXQsIGJ1dCB0
aGVuCj4gICAgc3VibWl0X2xvb2t1cF9vYmplY3RzKCkgaGFzIGEgYnVuY2ggb2YgY29weV9mcm9t
X3VzZXIgdG8gZG8gdGhlCj4gICAgb2JqZWN0IGxvb2t1cHMuIFRoYXQncyB0aGUgb25seSB0aGlu
ZyBiZWZvcmUgc3VibWl0X2xvY2tfb2JqZWN0cwo+ICAgIGNhbGwgZG1hX3Jlc3ZfbG9jaygpLiBE
ZXNwaXRlIGFsbCB0aGUgY29weXBhc3RhIHRvIGV0bmF2aXYsIGV0bmF2aXYKPiAgICBkb2VzIG5v
dCBoYXZlIHRoaXMgaXNzdWUgc2luY2UgaXQgY29waWVzIGFsbCB0aGUgdXNlcnNwYWNlIHN0cnVj
dHMKPiAgICBlYXJsaWVyLiBzdWJtaXRfY2xlYW51cCBkb2VzIG5vdCBoYXZlIGFueSBzdWNoIGlz
c3Vlcy4KPgo+ICAgIFdpdGggdGhlIHByZXAgcGF0Y2ggdG8gcHVsbCBvdXQgdGhlIGFjcXVpcmVf
Y3R4IGFuZCByZW9yZGVyIGl0IG1zbQo+ICAgIGlzIGdvaW5nIHRvIGJlIHNhZmUgdG9vLgo+Cj4g
LSBub3V2ZWF1OiBhY3F1aXJlX2luaXQgaXMgcmlnaHQgbmV4dCB0byB0dG1fYm9fcmVzZXJ2ZSwg
c28gYWxsIGdvb2QuCj4gICAgU2ltaWxhciBvbiB0aGUgYWNxdWlyZV9maW5pL3R0bV9ib191bnJl
c2VydmUgc2lkZS4KPgo+IC0gdHRtIGV4ZWNidWYgdXRpbHM6IGFjcXVpcmUgY29udGV4dCBhbmQg
bG9ja2luZyBhcmUgZXZlbiBpbiB0aGUgc2FtZQo+ICAgIGZ1bmN0aW9ucyBoZXJlIChvbmUgZnVu
Y3Rpb24gdG8gcmVzZXJ2ZSBldmVyeXRoaW5nLCB0aGUgb3RoZXIgdG8KPiAgICB1bnJlc2VydmUp
LCBzbyBhbGwgZ29vZC4KPgo+IC0gdmM0OiBBbm90aGVyIGNhc2Ugd2hlcmUgYWNxdWlyZSBjb250
ZXh0IGFuZCBsb2NraW5nIGFyZSBoYW5kbGVkIGluCj4gICAgdGhlIHNhbWUgZnVuY3Rpb25zIChv
bmUgZnVuY3Rpb24gdG8gbG9jayBldmVyeXRoaW5nLCB0aGUgb3RoZXIgdG8KPiAgICB1bmxvY2sp
Lgo+Cj4gQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRl
bC5jb20+Cj4gQ2M6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgo+IENj
OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gQ2M6IFN1bWl0
IFNlbXdhbCA8c3VtaXQuc2Vtd2FsQGxpbmFyby5vcmc+Cj4gQ2M6IGxpbnV4LW1lZGlhQHZnZXIu
a2VybmVsLm9yZwo+IENjOiBsaW5hcm8tbW0tc2lnQGxpc3RzLmxpbmFyby5vcmcKPiBDYzogSHVh
bmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4KPiBDYzogRXJpYyBBbmhvbHQgPGVyaWNAYW5ob2x0
Lm5ldD4KPiBDYzogQmVuIFNrZWdncyA8YnNrZWdnc0ByZWRoYXQuY29tPgo+IENjOiBBbGV4IERl
dWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cj4gQ2M6IFJvYiBIZXJyaW5nIDxyb2Jo
QGtlcm5lbC5vcmc+Cj4gQ2M6IEx1Y2FzIFN0YWNoIDxsLnN0YWNoQHBlbmd1dHJvbml4LmRlPgo+
IENjOiBSdXNzZWxsIEtpbmcgPGxpbnV4K2V0bmF2aXZAYXJtbGludXgub3JnLnVrPgo+IENjOiBD
aHJpc3RpYW4gR21laW5lciA8Y2hyaXN0aWFuLmdtZWluZXJAZ21haWwuY29tPgo+IENjOiBSb2Ig
Q2xhcmsgPHJvYmRjbGFya0BnbWFpbC5jb20+Cj4gQ2M6IFNlYW4gUGF1bCA8c2VhbkBwb29ybHku
cnVuPgo+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwu
Y29tPgoKQWNrZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNv
bT4KCj4gLS0tCj4gICBkcml2ZXJzL2RtYS1idWYvZG1hLXJlc3YuYyB8IDggKysrKysrKy0KPiAg
IDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2RtYS1idWYvZG1hLXJlc3YuYyBiL2RyaXZlcnMvZG1hLWJ1Zi9kbWEt
cmVzdi5jCj4gaW5kZXggZDNjNzYwZTE5OTkxLi4wNzllMzhmZGUzM2EgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9kbWEtYnVmL2RtYS1yZXN2LmMKPiArKysgYi9kcml2ZXJzL2RtYS1idWYvZG1hLXJl
c3YuYwo+IEBAIC0xMDAsNyArMTAwLDkgQEAgc3RhdGljIHZvaWQgZG1hX3Jlc3ZfbGlzdF9mcmVl
KHN0cnVjdCBkbWFfcmVzdl9saXN0ICpsaXN0KQo+ICAgc3RhdGljIHZvaWQgX19pbml0IGRtYV9y
ZXN2X2xvY2tkZXAodm9pZCkKPiAgIHsKPiAgIAlzdHJ1Y3QgbW1fc3RydWN0ICptbSA9IG1tX2Fs
bG9jKCk7Cj4gKwlzdHJ1Y3Qgd3dfYWNxdWlyZV9jdHggY3R4Owo+ICAgCXN0cnVjdCBkbWFfcmVz
diBvYmo7Cj4gKwlpbnQgcmV0Owo+ICAgCj4gICAJaWYgKCFtbSkKPiAgIAkJcmV0dXJuOwo+IEBA
IC0xMDgsMTAgKzExMCwxNCBAQCBzdGF0aWMgdm9pZCBfX2luaXQgZG1hX3Jlc3ZfbG9ja2RlcCh2
b2lkKQo+ICAgCWRtYV9yZXN2X2luaXQoJm9iaik7Cj4gICAKPiAgIAlkb3duX3JlYWQoJm1tLT5t
bWFwX3NlbSk7Cj4gLQl3d19tdXRleF9sb2NrKCZvYmoubG9jaywgTlVMTCk7Cj4gKwl3d19hY3F1
aXJlX2luaXQoJmN0eCwgJnJlc2VydmF0aW9uX3d3X2NsYXNzKTsKPiArCXJldCA9IGRtYV9yZXN2
X2xvY2soJm9iaiwgJmN0eCk7Cj4gKwlpZiAocmV0ID09IC1FREVBRExLKQo+ICsJCWRtYV9yZXN2
X2xvY2tfc2xvdygmb2JqLCAmY3R4KTsKPiAgIAlmc19yZWNsYWltX2FjcXVpcmUoR0ZQX0tFUk5F
TCk7Cj4gICAJZnNfcmVjbGFpbV9yZWxlYXNlKEdGUF9LRVJORUwpOwo+ICAgCXd3X211dGV4X3Vu
bG9jaygmb2JqLmxvY2spOwo+ICsJd3dfYWNxdWlyZV9maW5pKCZjdHgpOwo+ICAgCXVwX3JlYWQo
Jm1tLT5tbWFwX3NlbSk7Cj4gICAJCj4gICAJbW1wdXQobW0pOwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

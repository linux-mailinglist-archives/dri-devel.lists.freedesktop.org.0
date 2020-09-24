Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D449A276DC8
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 11:48:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFD0C6E195;
	Thu, 24 Sep 2020 09:48:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2085.outbound.protection.outlook.com [40.107.237.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A6D16E195
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 09:48:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U/lknbbvhqorh3FkGq58fEcWEXDNGoGhbWKe9hSVlAGTRV0gU2yFE0ojPVhq0b74zoLsP7IWPA1KUcgNpLBl5pnO7NeLKntYWQ/HazPhy0axcU6/UCBiaUE6BvzvBK9YXysO/Wnb+JkST035gT6GscF+5AxvI/Dks3SOP2XQeJCamZjzVlyncPIEnyc+eD6YA6GcgiPp7RYQ5k6Y8QmKJoAErCMqxPnRSAyrw/g9Ujp9q2OK4/eEk9NI9SH5LuV7moy2+4dBEv469UM3ss7+zLe6FEzGfXiQ7C+SuZbcK4uMRR60O3YyNbSMCc8D0Xy/+VYy4BXWjPYoQxYKpk0qoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wUFTarpyoGzV8WXoNHoRnI1B4qzXDOWGAGTVq0BP3hY=;
 b=D52aqzZ5/A3zWkM0H5Il0VtHQWtLfY5v0TKZ/cTv7qVpCIBDa1yCdo5i9Mw6dMNISwGzQLdXbtYT82xeDxD5NTXFsDeDjTGyzqSuFNMFjT1yPmhyFAdPdBJQzQ6Ix5tnEohNp1+XgD/s1d3zXAP/hBSiTUDTENWH1arZj3l2L25lqmYMOXd0Y8f6U0uEZxj8cB0V/iYLnvvykNxd8DuazzMY/bvFsd0qN6cZR0/a06D+GDuznmKwSLPIBMQ3TQsYeGc8erVNIPrOqwc2MX1crHE+vwb09HWkSG8Muse3tfFn0cqKW53h0+AY3ZZqc5BL9QU9+cDYmtNfxBQGTDao4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wUFTarpyoGzV8WXoNHoRnI1B4qzXDOWGAGTVq0BP3hY=;
 b=b6iJnfF6KVVvwvW3Db9wIkBdDSi3oO4Gcp0SyurMdBa5DEgMj7bRvJ0Z7n/KTY6nQ3ypNAyvbZxMK8nLEaEKQawoMscNydIEEkc83wj+HaMOhNlQpmtbU/tHp4kaGeMXQcmXaq/jqvhDGOmS23fLQtYFMiUb4KEzHJr0qNpeoBI=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4125.namprd12.prod.outlook.com (2603:10b6:208:1d9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.15; Thu, 24 Sep
 2020 09:48:05 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3412.022; Thu, 24 Sep 2020
 09:48:05 +0000
Subject: Re: [PATCH 07/10] drm/amdgpu/ttm: handle tt moves properly.
To: Dave Airlie <airlied@gmail.com>
References: <20200923030454.362731-1-airlied@gmail.com>
 <20200923030454.362731-8-airlied@gmail.com>
 <51eae609-0ea5-d204-f34b-ea5d67989760@amd.com>
 <CAPM=9tyC7fjfGhY8Hz1UzSdjvigJou39nZ-cd9omqiMZJHi-3w@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <a7b61e33-55d4-f351-fdb4-9c083a4ab925@amd.com>
Date: Thu, 24 Sep 2020 11:48:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAPM=9tyC7fjfGhY8Hz1UzSdjvigJou39nZ-cd9omqiMZJHi-3w@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: FRYP281CA0005.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::15)
 To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 FRYP281CA0005.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.20 via Frontend Transport; Thu, 24 Sep 2020 09:48:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 394cd7b8-225a-4bd1-a278-08d8606eef26
X-MS-TrafficTypeDiagnostic: MN2PR12MB4125:
X-Microsoft-Antispam-PRVS: <MN2PR12MB41256D28EBF248EA82EA1E5483390@MN2PR12MB4125.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GR3SbPgKiMWjoxP+TYHIhLkzaiEyrlhGmnELnxhDlGs5kLY0pDf0zOF18JfG7zVM4N3BlISjxO3I2Kv/Tsq/6ohnWNiUotAznpcx+4uubMT/QFSZztOjzBlIYSPFDSXYtHNTwiKlYpu2n1ls23kRd6cqqFvQmWJ8ItBO4jfPEJ3ytw5uuA6GneOdbcLKfq0L7/r/jOtYy7ElBE9AfeXlIhkvTc7E+eYbscQ6yd5cukaLxsR9gCEr2x52UuJoxbHkC6kxpBPYCIDYxkXTBvgo/t69B7kvG8vIapc3iS1Md9Gw1R60z1MQ3GoACATHMjgVEQ3KQxX2tbe40ouIaeW8oPJ/jIuFZTBHdhsiWquOInAMi3+wufMB0Y3xmRwl8mNTVl3Gx6EIKaqFMv/CEn0726RJZUyJzJlxplHxN/OlOZnTCOTdLveORCsAqnyaoDX2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(346002)(39860400002)(136003)(376002)(186003)(16526019)(8936002)(86362001)(4326008)(478600001)(5660300002)(52116002)(8676002)(54906003)(31696002)(6916009)(6486002)(66476007)(66946007)(66556008)(31686004)(316002)(2616005)(83380400001)(66574015)(36756003)(2906002)(6666004)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: Jl3dsiSfb5QjIySBZGisoXi8Xtow+SEXP18s8W2Iha1iln3rCWXR2kUqMrP7PKmPPArGBXn+z8fdsjsPO6rZBWlTMIEqGNbuqX13ebeUwOE8THkq3KbVBh0K8OH3mK3qVRsFVVHEXE0W5n7LJFrNDw0Uefdir+NfTaKAmKLT7hoLvP54qlVa2JJecJSnPAx0pKsXn1IrQuUazhxA6s3waSw7kAuxh7B5HL/4KiG6HSoR+ZXzwmcjthGO9MurQ2lIa2wd/dKN4SXtn6KIAh9Af0hxUy03LZO13ws070g9kJFU4sfO+8kxLEzqeZsOcqM47XmD8E0JCpexM5/kgXgnjdSORMy01wc6czpcyrNYSJho4nERyq15+w8xt/Ds4t8XaivXxO68s3QtuG1edIMwL/IVkBaYWM9VkXa6EE8CSw0molC0+sFraMI67OPfsGeS/C1Yn6GcyFpXmf7KjvcXDqRfDKa1fSL20RvFg170o3KkmaFdze2/ktDRytTm1Go0K+wMSTJKrocgmaWD2B9/Ig3BBTH86dHU+mNX8XYtoEvQ0lsRhMJSfwmlxbG56/w+9ouu7lhpd933Zk6egUcZdPUjhifMcq+toGmyvWytTzc0tWsUAI+YhQRDZnknVm4nrrPk+Ks4rwSkJ5TPGUh1L3FWn/7HApaMuBTPpbcLCBI3cQlmxF8MW/Lk6dhJWmja+6UuY+xLujvRJNdRX7MSCA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 394cd7b8-225a-4bd1-a278-08d8606eef26
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2020 09:48:05.1448 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AHDR5wmwvrIdqIHawPgSsUXcaHj+4h8iB8IeHBVljU79mSXoQEl4+xW99fFWGoWW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4125
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
Cc: Ben Skeggs <bskeggs@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjQuMDkuMjAgdW0gMDI6NDYgc2NocmllYiBEYXZlIEFpcmxpZToKPiBPbiBUaHUsIDI0IFNl
cCAyMDIwIGF0IDAwOjQ2LCBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5j
b20+IHdyb3RlOgo+PiBBbSAyMy4wOS4yMCB1bSAwNTowNCBzY2hyaWViIERhdmUgQWlybGllOgo+
Pj4gRnJvbTogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KPj4+Cj4+PiBUaGUgY29y
ZSBtb3ZlIGNvZGUgY3VycmVudGx5IGhhbmRsZXMgdXNlX3R0IG1vdmVzLCBmb3IgYW1kZ3B1Cj4+
PiB0aGlzIHdhcyBiZWluZyBoYW5kbGVkIGFsc28gaW4gdGhlIGRyaXZlciwgYnV0IG5vdCB1c2lu
ZyB0aGUgc2FtZQo+Pj4gcGF0aHMuCj4+Pgo+Pj4gSWYgbW92aW5nIGJldHdlZW4gVFQvU1lTVEVN
IChhbGwgdGhlIHVzZV90dCBwYXRocyBvbiBhbWRncHUpIHVzZQo+Pj4gdGhlIGNvcmUgbW92ZSBm
dW5jdGlvbi4KPj4+Cj4+PiBFdmVudHVhbGx5IHRoZSBjb3JlIHdpbGwgYmUgZmxpcHBlZCBvdmVy
IHRvIGNhbGxpbmcgdGhlIGRyaXZlci4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBEYXZlIEFpcmxp
ZSA8YWlybGllZEByZWRoYXQuY29tPgo+Pj4gLS0tCj4+PiAgICBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfdHRtLmMgfCAxMiArKysrKysrLS0tLS0KPj4+ICAgIDEgZmlsZSBjaGFu
Z2VkLCA3IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYwo+Pj4gaW5kZXggZGI1Zjc2MWYzN2VjLi5kM2JkMmZk
NDQ4YmUgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
dHRtLmMKPj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYwo+
Pj4gQEAgLTY3MSwxNCArNjcxLDE2IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2JvX21vdmUoc3RydWN0
IHR0bV9idWZmZXJfb2JqZWN0ICpibywgYm9vbCBldmljdCwKPj4+ICAgICAgICAgICAgICAgIHR0
bV9ib19tb3ZlX251bGwoYm8sIG5ld19tZW0pOwo+Pj4gICAgICAgICAgICAgICAgcmV0dXJuIDA7
Cj4+PiAgICAgICAgfQo+Pj4gLSAgICAgaWYgKChvbGRfbWVtLT5tZW1fdHlwZSA9PSBUVE1fUExf
VFQgJiYKPj4+IC0gICAgICAgICAgbmV3X21lbS0+bWVtX3R5cGUgPT0gVFRNX1BMX1NZU1RFTSkg
fHwKPj4+IC0gICAgICAgICAob2xkX21lbS0+bWVtX3R5cGUgPT0gVFRNX1BMX1NZU1RFTSAmJgo+
Pj4gLSAgICAgICAgICBuZXdfbWVtLT5tZW1fdHlwZSA9PSBUVE1fUExfVFQpKSB7Cj4+PiAtICAg
ICAgICAgICAgIC8qIGJpbmQgaXMgZW5vdWdoICovCj4+PiArICAgICBpZiAob2xkX21lbS0+bWVt
X3R5cGUgPT0gVFRNX1BMX1NZU1RFTSAmJgo+Pj4gKyAgICAgICAgIG5ld19tZW0tPm1lbV90eXBl
ID09IFRUTV9QTF9UVCkgewo+Pj4gICAgICAgICAgICAgICAgdHRtX2JvX21vdmVfbnVsbChibywg
bmV3X21lbSk7Cj4+IEkgd291bGQgZmVlbCBiZXR0ZXIgaWYgd2UgbnVrZSB0dG1fYm9fbW92ZV9u
dWxsKCkgYW5kIGFsd2F5cyB1c2UKPj4gdHRtX2JvX21vdmVfdHRtKCkuCj4gQW55IHJlYXNvbj8g
VGhlIGNvZGUgcGF0aCBpbiB0aGUgY3VycmVudCBtb3ZlIGNvZGUgcHJldHR5IG11Y2gKPiBpcyB0
aGlzLgo+Cj4gVGhlIGN1cnJlbnQgbW92ZSBwYXRocyBhcmUKPgo+IGlmIChuZXdfdHQgJiYgb2xk
X3R0KQo+ICAgIGlmIG9sZCBpcyBzeXN0ZW0KPiAgICAgICBtb3ZlIG51bGwKPiAgICBlbHNlCj4g
ICAgICBtb3ZlIHR0bQo+IGVsc2UKPiAgICBjYWxsIGRyaXZlciBtb3ZlLgo+Cj4gU28gSSB3YW50
ZWQgdG8gbWFpbnRhaW4gdGhhdCBvcmRlci4gY2FsbGluZyB0aGUgbW92ZSB0dG0gd2lsbCBqdXN0
Cj4gbWFrZSBhIHBvaW50bGVzcyBjYWNoaW5nLCBwb3B1bGF0ZSwgYmluZCBzdGVwLgoKV2VsbCB3
ZSB3YW50IHRvIGdldCByaWQgb2YgdGhlIGJpbmQvdW5iaW5kIHN0dWZmIGluIFRUTS4KCkFuZCBJ
J20gc2VyaW91c2x5IHRoaW5raW5nIGFib3V0IGdldHRpbmcgcmlkIG9mIGFsbCB0aGUgY2FjaGlu
ZyBzdHVmZi4KClNvIGFsbCBvZiB0aGlzIHNob3VsZCBqdXN0IGdvIGF3YXkgcmF0aGVyIHNvb24u
CgpDaHJpc3RpYW4uCgo+Cj4gQnV0IEknbSBnb2luZyB0byB0aGluayBhYm91dCBpdCBhIGJpdCBt
b3JlLgo+Cj4gRGF2ZS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C28F32183F9
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 11:38:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E9946E093;
	Wed,  8 Jul 2020 09:38:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2076.outbound.protection.outlook.com [40.107.223.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E76466E093
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 09:38:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m4BWyrhDzNH/wGj8hNm+JBQn8EI5LgBzixErGp/Yb3SeJJOhorZDplJcYyEhDCtV9TTO5kOkKhEkEWKtkPJiokrb8wbmd7cBHb/BAw0kakK6/XRPqVLqBC4eP05D+vnHxACeNA4r8y6IbjSnl0pRJnyeYaUwPINIQYIKMAw1CLMVVWlRNpv5/Q5CIClP5ReWhEn8KbjsdF2dDFbDouhOxUlVqxo/w8JLt0SArgxepCGMQMEs1SRw4syk62CRcwgDv3PSS7xQjqBeubb6zWpuaq0CQCid61u5nRm+QoKxvWnEII6OJyn8bKKZacWltM4BKn0E1vNOtKKl6PwFU7VQJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/j20SdRDqoS2Rwjw0JY0jDwKzia8WEIaFIInTNiK5w8=;
 b=mhE1an6nXYp2Pol6mzW0J5VRGzFFkVNyvpKHjdLRJEWLRcevPqxfa/kpipL5cuX+2YuI1tXV6V8fUl4ukkDXHPZdyZHthk1aiEVGNbgbDFGNamUbie6qF9xV4ANNqm1E1TiXp9cBqNBEyeQsZA7IOBVWEXHJRDs6om1SHz2qxVCpMDoNh1zvpdNlfO+PQ/XWxNXFs863U2IiIEqM96NE8VyujtGDDxgwlnR5AVKUMfR+y/sq9KV5EHqQog0woGQDGrBmRsqUP0FZ9dBDkJGXyXLeZmOw+ZSYDkUl5b3707ntHY44TdoaZJZ0qacKNdNADj3hXfAP2C5SAqH+6w+3pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/j20SdRDqoS2Rwjw0JY0jDwKzia8WEIaFIInTNiK5w8=;
 b=oXIxVxp8ZZoHsNaEU9IEMcIkqFuHUAKFS85UUlSKTtUksr5CmnrJvG/BtKzV0PvnQkLKOC+65UDowi+jiU9q9G4jUYg+pE1EBc0w9DGS8Gih0DcaQisEI3SuhRhdtvwJ1B9deNU2Wp3FUI8okz6v63mG6p485Dp2hyMTHblfhUE=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3726.namprd12.prod.outlook.com (2603:10b6:208:168::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.28; Wed, 8 Jul
 2020 09:38:37 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3174.021; Wed, 8 Jul 2020
 09:38:37 +0000
Subject: Re: [RFC PATCH v2 0/3] RDMA: add dma-buf support
To: "Xiong, Jianxin" <jianxin.xiong@intel.com>, Jason Gunthorpe
 <jgg@ziepe.ca>, Daniel Vetter <daniel@ffwll.ch>
References: <20200701123904.GM25301@ziepe.ca>
 <34077a9f-7924-fbb3-04d9-cd20243f815c@amd.com>
 <CAKMK7uFf3_a+BN8CM7G8mNQPNtVBorouB+R5kxbbmFSB9XbeSg@mail.gmail.com>
 <20200701171524.GN25301@ziepe.ca>
 <20200702131000.GW3278063@phenom.ffwll.local>
 <20200702132953.GS25301@ziepe.ca>
 <11e93282-25da-841d-9be6-38b0c9703d42@amd.com>
 <20200702181540.GC3278063@phenom.ffwll.local>
 <20200703120335.GT25301@ziepe.ca>
 <CAKMK7uGqABchpPLTm=vmabkwK3JJSzWTFWhfU+ywbwjw-HgSzw@mail.gmail.com>
 <20200703131445.GU25301@ziepe.ca>
 <f2ec5c61-a553-39b5-29e1-568dae9ca2cd@amd.com>
 <MW3PR11MB45553DB31AD67C8B870A345FE5660@MW3PR11MB4555.namprd11.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <d28286c7-b1c1-a4a8-1d38-264ed1761cdd@amd.com>
Date: Wed, 8 Jul 2020 11:38:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <MW3PR11MB45553DB31AD67C8B870A345FE5660@MW3PR11MB4555.namprd11.prod.outlook.com>
Content-Language: en-US
X-ClientProxiedBy: AM4PR0302CA0021.eurprd03.prod.outlook.com
 (2603:10a6:205:2::34) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4PR0302CA0021.eurprd03.prod.outlook.com (2603:10a6:205:2::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21 via Frontend
 Transport; Wed, 8 Jul 2020 09:38:35 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 722c98ac-e1aa-42bf-e73a-08d82322b08a
X-MS-TrafficTypeDiagnostic: MN2PR12MB3726:
X-Microsoft-Antispam-PRVS: <MN2PR12MB37267A161CD30E9B62CA617C83670@MN2PR12MB3726.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 04583CED1A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qvvMVJBeRMwSmyI3WBQA1Ms0HtfusFgdwzuRZZyzO0OQtaZ87orp4Iuj/wRR2WQPZoi1b7B5KX5X4vmvOTj0l4Ua7wa48RUvMlmzlrrCqEidUXpyJv819cl0FlGZqGjXwtEW5Cbtebq60DWvwaiOcZn45wMZH+QMzxgGbXsi8j2r/r8cvwTjWf+Xzvxl6xTBp/Hzsc0Z3MFoiy6YZ7Pho4twyHMuUcKrWXlb9iV9I/osJoFoep3XK+POV1aH9g/V7d45AxXWbSCFWyCIESkuosmMsNROJnScHJTj8m0Ai0gCw7GzAK3d8yN/FLUJvE6mihcmdiWm7jd4IF7hoPrnHhlg2E166kHhdOoJGkZ2RTU3IQdci/XVw2Yx5i5EFiaCt6gySHxEJSFsdzZOXtMK05SRK+76dDZZ5+Qb7+bGAQg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(396003)(346002)(39860400002)(366004)(136003)(86362001)(478600001)(316002)(4326008)(966005)(66574015)(31696002)(8936002)(6486002)(110136005)(186003)(52116002)(16526019)(31686004)(66946007)(2616005)(66476007)(66556008)(8676002)(2906002)(54906003)(83380400001)(36756003)(5660300002)(6666004)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: w+gmZ9RXETQEjNfBxiachwz2xY8S6UrygRCJnxPMC7ZdLyT609ZkL+ewtugC85xnA0QtKcYD/8pgkIpIs/FRlpM+cb9cQjWYANIRpm6x1f3EtN9bNKfTc8VurNU9xzPWIGsfxhGxCMozXcCS9Dq4wUUdR3hYA7mQkKuvxLwO+L7iE8IGQ2XfMGqgDyIzihWjDvBjXEP2Zz1J/kHDSozRRKzFA0TIxuWdfxacbO5He2U028YWxUYLOAtqgcuTIqShViqhcxdD3vcQJTgIBc8WWn1/qsIehrtG7ku5I0KDYeXpxm9lKX6X+x6YNo8404Ho5hjpU1QEPdkofTAGNxvwyHEXvmcvfMLSpymLGB+ncXBZr4cT410tGQdO27ug4klYLL4rj2qcN4dS+E+RwIftJyQuwcQBYnqwRDzBIjMX1QkBHllOzLUp//1+3AGO06nacTkwDWNRt9bEzKg1rY/qA485mA80yOJy/I4Oh7efU3LjacI9EiMeP9bMul/MiFLUzr5bLUhbu5je9gEzoNPhSbrw8cnB0bJwR88auyoJjaVMpv7248e4cOdGf4vH7JwI
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 722c98ac-e1aa-42bf-e73a-08d82322b08a
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2020 09:38:37.4016 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iPgd7Bx/30iPBiWPfIp3XpfI7cu2keRrDQE+t144ScQWBjJZxs4IoUcPDIWdYxmL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3726
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
Cc: "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>, "Vetter,
 Daniel" <daniel.vetter@intel.com>, Doug Ledford <dledford@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Leon Romanovsky <leon@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDcuMDcuMjAgdW0gMjM6NTggc2NocmllYiBYaW9uZywgSmlhbnhpbjoKPj4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtv
ZW5pZ0BhbWQuY29tPgo+PiBBbSAwMy4wNy4yMCB1bSAxNToxNCBzY2hyaWViIEphc29uIEd1bnRo
b3JwZToKPj4+IE9uIEZyaSwgSnVsIDAzLCAyMDIwIGF0IDAyOjUyOjAzUE0gKzAyMDAsIERhbmll
bCBWZXR0ZXIgd3JvdGU6Cj4+Pgo+Pj4+IFNvIG1heWJlIEknbSBqdXN0IHRvdGFsbHkgY29uZnVz
ZWQgYWJvdXQgdGhlIHJkbWEgbW9kZWwuIEkgdGhvdWdodDoKPj4+PiAtIHlvdSBiaW5kIGEgcGls
ZSBvZiBtZW1vcnkgZm9yIHZhcmlvdXMgdHJhbnNhY3Rpb25zLCB0aGF0IG1pZ2h0Cj4+Pj4gaGFw
cGVuIHdoZW5ldmVyLiBLZXJuZWwgZHJpdmVyIGRvZXNuJ3QgaGF2ZSBtdWNoIGlmIGFueSBpbnNp
Z2h0IGludG8KPj4+PiB3aGVuIG1lbW9yeSBpc24ndCBuZWVkZWQgYW55bW9yZS4gSSB0aGluayBp
biB0aGUgcmRtYSB3b3JsZCB0aGF0J3MKPj4+PiBjYWxsZWQgcmVnaXN0ZXJpbmcgbWVtb3J5LCBi
dXQgbm90IHN1cmUuCj4+PiBTdXJlLCBidXQgb25jZSByZWdpc3RlcmVkIHRoZSBtZW1vcnkgaXMg
YWJsZSB0byBiZSB1c2VkIGF0IGFueSBtb21lbnQKPj4+IHdpdGggbm8gdmlzaWJpbHR5IGZyb20g
dGhlIGtlcm5lbC4KPj4+Cj4+PiBVbmxpa2UgR1BVIHRoZSB0cmFuc2FjdGlvbnMgdGhhdCB0cmln
Z2VyIG1lbW9yeSBhY2Nlc3MgZG8gbm90IGdvCj4+PiB0aHJvdWdoIHRoZSBrZXJuZWwgLSBzbyB0
aGVyZSBpcyBubyBhYmlsaXR5IHRvIGludGVycnVwdCBhIGNvbW1hbmQKPj4+IGZsb3cgYW5kIGZp
ZGRsZSB3aXRoIG1hcHBpbmdzLgo+PiBUaGlzIGlzIHRoZSBzYW1lIGZvciBHUFVzIHdpdGggdXNl
ciBzcGFjZSBxdWV1ZXMgYXMgd2VsbC4KPj4KPj4gQnV0IHdlIGNhbiBzdGlsbCBzYXkgZm9yIGEg
cHJvY2VzcyBpZiB0aGF0IHRoaXMgcHJvY2VzcyBpcyB1c2luZyBhIERNQS1idWYgd2hpY2ggaXMg
bW92ZWQgb3V0IGFuZCBzbyBjYW4ndCBydW4gYW55IG1vcmUgdW5sZXNzIHRoZSBETUEtYnVmIGlz
Cj4+IGFjY2Vzc2libGUgYWdhaW4uCj4+Cj4+IEluIG90aGVyIHdvcmRzIHlvdSBzb21laG93IG5l
ZWQgdG8gbWFrZSBzdXJlIHRoYXQgdGhlIGhhcmR3YXJlIGlzIG5vdCBhY2Nlc3NpbmcgYSBwaWVj
ZSBvZiBtZW1vcnkgYW55IG1vcmUgd2hlbiB5b3Ugd2FudCB0byBtb3ZlIGl0Lgo+Pgo+IFdoaWxl
IGEgcHJvY2VzcyBjYW4gYmUgZWFzaWx5IHN1c3BlbmRlZCwgdGhlcmUgaXMgbm8gd2F5IHRvIHRl
bGwgdGhlIFJETUEgTklDIG5vdCB0byBwcm9jZXNzIHBvc3RlZCB3b3JrIHJlcXVlc3RzIHRoYXQg
dXNlIHNwZWNpZmljIG1lbW9yeSByZWdpb25zIChvciB3aXRoIGFueSBvdGhlciBjb25kaXRpb25z
KS4KPgo+IFNvIGZhciBpdCBhcHBlYXJzIHRvIG1lIHRoYXQgRE1BLWJ1ZiBkeW5hbWljIG1hcHBp
bmcgZm9yIFJETUEgaXMgb25seSB2aWFibGUgd2l0aCBPRFAgc3VwcG9ydC4gRm9yIE5JQ3Mgd2l0
aG91dCBPRFAsIGEgd2F5IHRvIGFsbG93IHBpbm5pbmcgdGhlIGRldmljZSBtZW1vcnkgaXMgc3Rp
bGwgbmVlZGVkLgoKQW5kIHRoYXQncyBleGFjdGx5IHRoZSByZWFzb24gd2h5IEkgaW50cm9kdWNl
ZCBleHBsaWNpdCBwaW4oKS91bnBpbigpIApmdW5jdGlvbnMgaW50byB0aGUgRE1BLWJ1ZiBBUEk6
IApodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC9sYXRlc3Qvc291cmNlL2RyaXZlcnMv
ZG1hLWJ1Zi9kbWEtYnVmLmMjTDgxMQoKSXQncyBqdXN0IHRoYXQgYXQgbGVhc3Qgb3VyIGRldmlj
ZXMgZHJpdmVycyBjdXJyZW50bHkgcHJldmVudCBQMlAgd2l0aCAKcGlubmVkIERNQS1idWYncyBm
b3IgdHdvIG1haW4gcmVhc29uczoKCmEpIFRvIHByZXZlbnQgZGVueSBvZiBzZXJ2aWNlIGF0dGFj
a3MgYmVjYXVzZSBQMlAgQkFScyBhcmUgYSByYXRoZXIgcmFyZSAKcmVzb3VyY2UuCgpiKSBUbyBw
cmV2ZW50IGZhaWx1cmVzIGluIGNvbmZpZ3VyYXRpb24gd2hlcmUgUDJQIGlzIG5vdCBhbHdheXMg
cG9zc2libGUgCmJldHdlZW4gYWxsIGRldmljZXMgd2hpY2ggd2FudCB0byBhY2Nlc3MgYSBidWZm
ZXIuCgpSZWdhcmRzLApDaHJpc3RpYW4uCgo+Cj4gSmlhbnhpbgo+Cj4+IENocmlzdGlhbi4KPj4K
Pj4+IEphc29uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 112BB2CA2D1
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 13:38:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49CAB89CAD;
	Tue,  1 Dec 2020 12:38:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062.outbound.protection.outlook.com [40.107.92.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1D2889CAD
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 12:38:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j5GunO1vp30JoJgBlBsS732XsWdcW0oKWUsQrCvScprKHgGj2xES6thKM/QNY2I5NFlZJ+RR2qTWioBXhkipljvTcpheBxpaCvECcBAwG2Y0SebQVc5mOiSDtz3cLYfTIL012wp5qZTBe1LGKPIAewUxe5Rsj2mQma1nwi3ZWw46Z47qb7cA0hCi9E+xUHLc5tpZ4u6RjcoogYsxzlqT++FwbAxaCR1TrpbUkz3fNk3MU1zL4XDGz9m5GjnJOk3B1EtYdrgmTfCq/mh1OD1ihpsWku4hJmxaVf7oqzQffGf8Dow9LKgCRM1ylVKQYttl2+ck7DQKuQKYkqgmpbPA1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z5ca+S3KYeB/1dkJeW7WcJLNqRpfpPw4uzFUWF+VKK4=;
 b=kyMiGSy68GYIpGNRBTDCRf9Wg7A4L0i7MUuMMQIsCWHDhxGsYrN7g8A3fdtfIFWIzL/VTcRwtT/Fd+mr3MyFN2cF60DFAx5cS5y6BWcQXDr+/pY2U+jeYURVVqwnw0U0/7SRJndtNA+vNDB35xYfG2lIDJYgAXrs1eUUDo4uC4kvPoRA5UPTOhdNp4dUMRIlwVtTO0EyVJn4Qf9sz5imoZ2pBOZutQyEkxE3aGQHrSmohftZt2OclAfIlRuxgT00ZIjmWQ84tMlc+cmCWr+DkTA+JoeKFqZhqWSWjiuQ6t9yjWyTFPmCaY0ygjdBBw3JzcJR+fT4slDDrR9OssMM9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z5ca+S3KYeB/1dkJeW7WcJLNqRpfpPw4uzFUWF+VKK4=;
 b=hQbrlRIaky2r3KYgR1KvKQjXmiqg58uxe5GvobLRGGqJD33Y+onlMhsAxa6inauRh7iSQ7RNaNLBzuKXD33QCy/4ywXjZiviZTllPT4/sJ2VyAuNetQIcxUN/rRG0+k5yBBX4cqfeqCvlmzdSrSY2LASLPul0Msjfm9zEcg/Fqo=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4157.namprd12.prod.outlook.com (2603:10b6:208:1db::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20; Tue, 1 Dec
 2020 12:38:37 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31%7]) with mapi id 15.20.3611.025; Tue, 1 Dec 2020
 12:38:37 +0000
Subject: Re: [PATCH 1/8] drm/gem: Write down some rules for vmap usage
To: Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>
References: <20201130120433.7205-1-tzimmermann@suse.de>
 <20201130120433.7205-2-tzimmermann@suse.de>
 <20201130153048.GS401619@phenom.ffwll.local>
 <092068b8-1f3d-4fc8-48fb-cc5dc33ae7c5@amd.com>
 <0237fafc-f57e-b60b-f92c-0b0a79e9448e@suse.de>
 <CAKMK7uG186rtmopf9h-ZrR+D1r7c2-5nrxg86dZxwmnLN1QGZg@mail.gmail.com>
 <d50074f7-145d-2af5-e8cd-08b57e204ede@suse.de>
 <CAKMK7uHe+Or2mnbESXoTm=yTFxyWK01DjHLdnxzGkK=PYb4_9g@mail.gmail.com>
 <56f730f5-eda1-3d87-0d35-63faf91c79e5@suse.de>
 <a8e15d38-2b92-a278-2ad9-e44c368c6a15@amd.com>
 <0e31f447-4195-77fe-a68d-97b96f46f327@suse.de>
 <aa3c4ad6-f99e-de48-e797-0748c9706e9e@amd.com>
 <7211f3d5-8298-6df3-05b5-c56b5e89f162@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <870cfd16-02a8-8a6d-8b7f-8ee4b57ef222@amd.com>
Date: Tue, 1 Dec 2020 13:38:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <7211f3d5-8298-6df3-05b5-c56b5e89f162@suse.de>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM3PR05CA0131.eurprd05.prod.outlook.com
 (2603:10a6:207:2::33) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM3PR05CA0131.eurprd05.prod.outlook.com (2603:10a6:207:2::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17 via Frontend Transport; Tue, 1 Dec 2020 12:38:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5454cd95-e55a-480d-6022-08d895f605d7
X-MS-TrafficTypeDiagnostic: MN2PR12MB4157:
X-Microsoft-Antispam-PRVS: <MN2PR12MB415703B545892BC8C8345F1B83F40@MN2PR12MB4157.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AXUHYrSZMN/5vOYiAnIDKuL121RCf4oglzu8A7voyabFvpjaVYAR76sqUN4NigYN/4/5ZJW5dLriUYneWHsELS+r+H34pW6tWNlVGgnOQS7ZjVoxIIiNwC6ykgLeRpDoGGIUlOChA9rMECkSSvKC4Q0K5/NpJHKPO7yOzBd4zJrlkll/lGh+qvqWOQU/b1t+e/zTJbMRDN8vnoTDLe6Wij99jXqNhnrW8O26DZzjua/lXbPP8Et82NyO9oSJGjwGXdGkL6cNN7La0upjIFMyF0kJ1zzDLODjPZYBjcoVdNZVJ53uFFatYbTxi7dkkXacUDOBwqppeQeKBw/7Sytwzfdyg7tA0XMLBTPg32IRYgxbGagi4DkrYTaC7bv5xrPK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(136003)(366004)(346002)(39860400002)(2616005)(66556008)(66946007)(66476007)(52116002)(31696002)(36756003)(8676002)(31686004)(186003)(6486002)(83380400001)(5660300002)(478600001)(16526019)(316002)(2906002)(110136005)(6666004)(54906003)(86362001)(8936002)(4326008)(66574015)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZjE5K2lVNFlzaXNzOXplWjhDVnM1Y2dhOC80UFU1b2hscE9tKzBRb0RRNXB0?=
 =?utf-8?B?Z3lJdTRHWkVUY0djWU5ReVY0bVdyYmxTbUhqQmRpaG5NUzBrUVJlbDNnenJp?=
 =?utf-8?B?Smp1aGZEVlBBZU8rYjFLWjFtRzdoSG03UFkrMFBYT3U4Rm1rMWpQMFJ6OFp5?=
 =?utf-8?B?dGlzUCtqMkViSEJiRm83ck0yd0FKWkJFMnZhVmpTSWlzdjdmOWc3a0VWdTZP?=
 =?utf-8?B?Yk95c0RMYm1NakFSMUFveUlOY3hRaGRQSHFudDR6ZmxvK2p4amJlTXlkWTlk?=
 =?utf-8?B?ODdiM2lRWGtzeUpDTlVkWk1mUThHZi9xeEk5bnBod0l4VDQ2NzJiK3dJYUtO?=
 =?utf-8?B?a003TGNGRllHbXRuZTV5YTFQeUJyK2ppNFNXUmpnVGxaYWU0UEJpK1l5S05F?=
 =?utf-8?B?ZmVjanBkbnRpN2JsTWVnVGN1NDVsdEh2VENWNXNjaXNxRXVySXBpVmlxY0RP?=
 =?utf-8?B?Z0s5WHcvSjVQeGtDMlNFem9GRlI0T2R4d1cwUXdrdk1OajM4dmxib3dmK3dI?=
 =?utf-8?B?cWlWcVhjaUMwSzV2S3FIR3VCODhDSGIvaDFxZ0xXUysvdno0cVY0dS9kdlFU?=
 =?utf-8?B?SmkyczVyUW5LYUdncHQwaDcyTTZYVFJtUFExWjhOWHplcUN4Ym1xSGdsZ3dD?=
 =?utf-8?B?d1U5SnR5SXpXQnVUamxJZExiRVJEdDNnOElacUtFR0FBbWtoRDBOL3c4NXR3?=
 =?utf-8?B?c2JnZ1RlM0lTZjdlblBKcGZUUFFITW42RnJUQTFjTWMxKzloY1BBQW96UGhL?=
 =?utf-8?B?cXJPd3RreWhWYk1la1VGWlhDV0ozb3R3Rnhrckoxc2ZKaWEzdFRLanJQUzJQ?=
 =?utf-8?B?UWR4aEx5MGhSUmJ1TkxPdnBWN3NzRURzclByRXRDd2t2SDNOYTdQTHBnU0lG?=
 =?utf-8?B?NTNNYzd6ZjY3U01vSks0MUoxNENselJoZHV2S0ljdHQwZElnVWdMQm52Rlpq?=
 =?utf-8?B?Vk8zSFd5aFZpVHplaU52RjVKL1lzMHhBN09CZlNWdHlaeXgvYXVCLzFQN2FE?=
 =?utf-8?B?UDlMa0hxMUZhWk92b2lxeWxBWnlnMFMvRlgrVmRBdXE3NHhFKyt3TFZRU3Rw?=
 =?utf-8?B?WXBtQUNwMkwrUzJicm1uUFZSQk01YUs0dHpIaHhLUFY5eDVqSEdrQzM1UVIz?=
 =?utf-8?B?ZFFhbERYVjMyTHV5ejJLcUR0ZnJ1MUV2MlJzYVRwWjUveXc4UlU3SUJJeTlo?=
 =?utf-8?B?N3dFYm81UERHOWtBRlBkYlo4TWJ1SWE3QXVhcUNhaEdqSmtWcVhTWCtRbm5X?=
 =?utf-8?B?dFlUUlZWbkJkTFIxdXBFMzVMT0cyMUN1QVZpMlBNUDFtbG96U1ZxakpCYnJv?=
 =?utf-8?B?WnJCMWg2bVBVajNmU1U2NGVLV0orbEZpVFh0T1ByTXFubHBPODkzaG5NNXM0?=
 =?utf-8?B?SmRMSThlNXpERVdFa0U0NGRBeFh6S0J5cXVTYUsvYUJBYUlNaWtnRUt5QnFG?=
 =?utf-8?Q?Iv5nNcUT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5454cd95-e55a-480d-6022-08d895f605d7
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2020 12:38:37.3135 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E3jWyfYoYcj+Q5gn8+R/z58FOOf3fPhMpo0y7+LTHatL4W1nVC9SIQyfghG8JPaC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4157
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
Cc: Dave Airlie <airlied@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDEuMTIuMjAgdW0gMTM6MzMgc2NocmllYiBUaG9tYXMgWmltbWVybWFubjoKPiBIaQo+Cj4g
QW0gMDEuMTIuMjAgdW0gMTM6MTQgc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOgo+PiBBbSAwMS4x
Mi4yMCB1bSAxMjozMCBzY2hyaWViIFRob21hcyBaaW1tZXJtYW5uOgo+Pj4gSGkKPj4+Cj4+PiBB
bSAwMS4xMi4yMCB1bSAxMTozNCBzY2hyaWViIENocmlzdGlhbiBLw7ZuaWc6Cj4+Pj4+IFsuLi5d
Cj4+Pj4+IEluIHBhdGNoIDYgb2YgdGhpcyBzZXJpZXMsIHRoZXJlJ3MgYXN0IGN1cnNvciBjb2Rl
IHRoYXQgYWNxdWlyZXMgCj4+Pj4+IHR3byBCTydzIHJlc2VydmF0aW9uIGxvY2tzIGFuZCB2bWFw
cyB0aGVtIGFmdGVyd2FyZHMuIFRoYXQncyAKPj4+Pj4gcHJvYmFibHkgaG93IHlvdSBpbnRlbmQg
dG8gdXNlIGRtYV9idWZfdm1hcF9sb2NhbC4KPj4+Pj4KPj4+Pj4gSG93ZXZlciwgSSB0aGluayBp
dCdzIG1vcmUgbG9naWNhbGx5IHRvIGhhdmUgYSB2bWFwIGNhbGxiYWNrIHRoYXQgCj4+Pj4+IG9u
bHkgZG9lcyB0aGUgYWN0dWFsIHZtYXAuIFRoaXMgaXMgYWxsIHRoYXQgZXhwb3J0ZXJzIHdvdWxk
IGhhdmUgCj4+Pj4+IHRvIGltcGxlbWVudC4KPj4+Pj4KPj4+Pj4gQW5kIHdpdGggdGhhdCwgYnVp
bGQgb25lIGhlbHBlciB0aGF0IHBpbnMgYmVmb3JlIHZtYXAgYW5kIG9uZSAKPj4+Pj4gaGVscGVy
IHRoYXQgZ2V0cyB0aGUgcmVzdiBsb2NrLgo+Pj4+Cj4+Pj4gSSBkb24ndCB0aGluayB0aGF0IHRo
aXMgaXMgd2lsbCB3b3JrIG5vciBpcyBpdCBhIGdvb2QgYXBwcm9hY2guCj4+Pj4KPj4+PiBTZWUg
dGhlIGFzdCBjdXJzb3IgaGFuZGxpbmcgZm9yIGV4YW1wbGUuIFlvdSBuZWVkIHRvIGFjcXVpcmUg
dHdvIAo+Pj4+IEJPcyBoZXJlLCBub3QganVzdCBvbmUuIEFuZCB0aGlzIGNhbid0IGJlIGRvbmUg
Y2xlYW5seSB3aXRoIGEgCj4+Pj4gc2luZ2xlIHZtYXAgY2FsbC4KPj4+Cj4+PiBUaGF0IHNlZW1z
IHRvIGJlIGEgbWlzdW5kZXJzdGFuZGluZy4KPj4+Cj4+PiBJIGRvbid0IG1lbnRpb25lZCBpdCBl
eHBsaWNpdGx5LCBidXQgdGhlcmUncyBvZiBjb3Vyc2UgYW5vdGhlciAKPj4+IGhlbHBlciB0aGF0
IG9ubHkgdm1hcHMgYW5kIG5vdGhpbmcgZWxzZS4gVGhpcyB3b3VsZCBiZSB1c2VmdWwgZm9yIAo+
Pj4gY2FzZXMgbGlrZSB0aGUgY3Vyc29yIGNvZGUuIFNvIHRoZXJlIHdvdWxkIGJlOgo+Pj4KPj4+
IMKgZG1hX2J1Zl92bWFwKCkgLSBwaW4gKyB2bWFwCj4+PiDCoGRtYV9idWZfdm1hcF9sb2NhbCgp
IC0gbG9jayArIHZtYXAKPj4+IMKgZG1hX2J1Zl92bWFwX2xvY2tlZCgpIC0gb25seSB2bWFwOyBj
YWxsZXIgaGFzIHNldCB1cCB0aGUgQk9zCj4+Cj4+IFdlbGwgdGhhdCB6b28gb2YgaGVscGVycyB3
aWxsIGNlcnRhaW5seSBnZXQgYSBOQUsgZnJvbSBteSBzaWRlLgo+Pgo+PiBTZWUgaW50ZXJmYWNl
cyBsaWtlIHRoaXMgc2hvdWxkIGltcGxlbWVudCBzaW1wbGUgZnVuY3Rpb25zIGFuZCBub3QgCj4+
IGhpZGUgd2hhdCdzIGFjdHVhbGx5IG5lZWRzIHRvIGJlIGRvbmUgaW5zaWRlIHRoZSBkcml2ZXJz
IHVzaW5nIHRoaXMgCj4+IGludGVyZmFjZS4KPgo+IElmIDkgb2YgMTAgaW52b2NhdGlvbnMgdXNl
IHRoZSBzYW1lIHBhdHRlcm4sIHdoeSBub3QgcHV0IHRoYXQgcGF0dGVybiAKPiBpbiBhIGhlbHBl
cj8gSSBzZWUgbm90aGluZyB3cm9uZyB3aXRoIHRoYXQuCgpCZWNhdXNlIGl0IGhpZGVzIHRoZSBs
b2NraW5nIHNlbWFudGljcyBpbnNpZGUgdGhlIGhlbHBlci4gU2VlIHdoZW4geW91IApoYXZlIHRo
ZSBsb2NrL3VubG9jayBpbnNpZGUgdGhlIGRyaXZlciBpdCBpcyBvYnZpb3VzIHRoYXQgeW91IG5l
ZWQgdG8gYmUgCmNhcmVmdWwgbm90IHRvIHRha2UgbG9ja3MgaW4gZGlmZmVyZW50IG9yZGVycy4K
Cj4+IFdoYXQgd2UgY291bGQgZG8gaXMgdG8gYWRkIGEgcGluIGNvdW50IHRvIHRoZSBETUEtYnVm
IGFuZCB0aGVuIGRvIAo+PiBXQVJOX09OKGRtYV9idWYtPnBpbl9jb3VudCB8fCBkbWFfcmVzdl9s
b2NrX2hlbHAoZG1hX2J1Zi0+cmVzdikpIGluIAo+PiB0aGUgdm1hcC92dW5tYXAgY2FsbHMuCj4K
PiBNb3N0IG9mIHRoZSB2bWFwIGNvZGUgaXMgZWl0aGVyIENNQSBvciBTSE1FTSBHRU0gc3R1ZmYu
IFRoZXkgZG9uJ3QgCj4gbmVlZCB0byBwaW4uIEl0J3MganVzdCBiYWdnYWdlIHRvIHRoZW0uIFRo
ZSBUVE0gc3R1ZmYgdGhhdCBkb2VzIG5lZWQgCj4gcGlubmluZyBpcyB0aGUgbWlub3JpdHkuCj4K
Pj4KPj4+Cj4+PiBJIGRpZCBzb21lIGNvbnZlcnNpb24gb2YgZHJpdmVycyB0aGF0IHVzZSB2cmFt
IGFuZCBzaG1lbS4gVGhleSAKPj4+IG9jY2FzaW9uYWxseSB1cGRhdGUgYSBidWZmZXIgKGFzdCBj
dXJzb3JzKSBvciBmbHVzaCBhIEJPIGZyb20gc3lzdGVtIAo+Pj4gbWVtb3J5IHRvIEhXICh1ZGws
IGNpcnJ1cywgbWdhZzIwMCkuIEluIHRlcm1zIG9mIHRoZXNlIDMgaW50ZXJmYWNlczogCj4+PiBJ
IG5ldmVyIG5lZWRlZCBkbWFfYnVmX3ZtYXAoKSBiZWNhdXNlIHBpbm5pbmcgd2FzIG5ldmVyIHJl
YWxseSAKPj4+IHJlcXVpcmVkIGhlcmUuIEFsbW9zdCBhbGwgb2YgdGhlIGNhc2VzIHdlcmUgaGFu
ZGxlZCBieSAKPj4+IGRtYV9idWZfdm1hcF9sb2NhbCgpLiBBbmQgdGhlIGFzdCBjdXJzb3IgY29k
ZSB1c2VzIHRoZSBlcXVpdmFsZW50IG9mIAo+Pj4gZG1hX2J1Zl92bWFwX2xvY2tlZCgpLgo+Pgo+
PiBZZWFoLCB0aGF0IGlzIGtpbmQgb2YgZXhwZWN0ZWQuIEkgd2FzIGFscmVhZHkgd29uZGVyaW5n
IGFzIHdlbGwgd2h5IAo+PiB3ZSBkaWRuJ3QgdXNlZCB0aGUgcmVzZXJ2YXRpb24gbG9jayBtb3Jl
IGV4dGVuc2l2ZWx5Lgo+Cj4gQXMgYSBzaWRlIG5vdGUsIEkgZm91bmQgb25seSA2IHRyaXZpYWwg
aW1wbGVtZW50YXRpb25zIG9mIHZtYXAgb3V0c2lkZSAKPiBvZiBkcml2ZXJzL2dwdS9kcm0uIEkg
Y2Fubm90IGZpbmQgYSBzaW5nbGUgaW1wbGVtZW50YXRpb24gb2YgcGluIAo+IHRoZXJlLiDCoFdo
YXQgYW0gSSBtaXNzaW5nPwoKQW1kZ3B1IGlzIHRoZSBvbmx5IG9uZSBjdXJyZW50bHkgaW1wbGVt
ZW50aW5nIHRoZSBuZXcgaW50ZXJmYWNlLiBTbyBmYXIgCndlIGRpZG4ndCBoYWQgdGhlIHRpbWUg
bm9yIHRoZSBuZWVkIHRvIGNvcnJlY3RseSBtb3ZlIHRoZSBsb2NraW5nIGludG8gCnRoZSBjYWxs
aW5nIGRyaXZlcnMuCgpUaGF0J3Mgd2hhdCB0aGUgd2hvbGUgZHluYW1pYyBETUEtYnVmIHBhdGNo
ZXMgd2hlcmUgYWxsIGFib3V0LgoKUmVnYXJkcywKQ2hyaXN0aWFuLgoKPgo+IEJlc3QgcmVnYXJk
cwo+IFRob21hcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1D42A7F96
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 14:22:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C05AF6ED1B;
	Thu,  5 Nov 2020 13:22:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2087.outbound.protection.outlook.com [40.107.94.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CA3D6ED1B
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 13:22:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m+2c40+jFurhjuOTSMiu6B0gUK6qkCWzAr8Diq2WQ59OZ/8uTMFOsEfHG/0r5eDijHTESD0z6HOkIVSi+a2ig+hRNsYzrWLfHx9mHbC/jugYY77x4KYerwuPIl1vZHjOE7v2TTol0hm3dcq0GaAoCyj6wYSmTqjcORZiyeY5t4tWO7xZuW7Q/Z+gWVNwCaOIRCf0zaFFRqJ/JvVy00tYqXOKniDzRzR6aDVaFtUVtfJbjDOFGLyJV3OAbuUmjDDOd2DRnYZ7sE4KNV/0BdXSRSJiTUlck3how390UhVNYzBaP8YLp6PC2csodhc1PyeOln9jYlBnchvA6iLDk6/qaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2xn8CATlSMguyvE9hVD9r+whEFUMXJXTmatwTjDecU8=;
 b=CAWLbUPWIMB4BPZKZ/ZJdXA7xZYWzY4JWiVmZAtKD8ZcapL1gGFymVzaAifE4oAsGvj7j06ZnuE0wTpMYYL4uoAWa1UsoOdY3bgWOcTH1Mg4tVsOGPDHI/9Jc3N0TznxTEdKa+kYPEyrtaPnztHqhFjG7VERCSbY4rtQ93Ah71MPyFM0M+klU9JrVP+INdwPhGqDb7NkOaPQ3tn28VaXmfnpGmH0xy7q7cmvHeJKMlnK04G4zbMIrfOc32M/x2je2NTaTKEfaU/m2RM5VhLqEM/+YjKsqHH5UzRZy7YvRDs44K+jMVNsLbgfXwgqTmh0hV0SarMVzOMaPLVueQvExA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2xn8CATlSMguyvE9hVD9r+whEFUMXJXTmatwTjDecU8=;
 b=jxoFofEWQRt5Wxr7A1uobLpwAVlXqe8n/yr7lqLneco5i3Eq/4w5mK/GXtxNyoAVNKxkqPQQqEqVNSMVqUm/GNT/Ic5WMjSb9qZWD7d/mFMiRcptJcYsoAh915R0yq2rwbrVq61V8yFUEVgg4yteqfQQMKg40XhPuHQ0doqLp9w=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4848.namprd12.prod.outlook.com (2603:10b6:208:1be::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Thu, 5 Nov
 2020 13:22:40 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31%7]) with mapi id 15.20.3499.032; Thu, 5 Nov 2020
 13:22:40 +0000
Subject: Re: [PATCH] drm/ttm: don't set page->mapping
To: Daniel Vetter <daniel@ffwll.ch>
References: <20201104165030.2005167-1-daniel.vetter@ffwll.ch>
 <859e2b9c-c202-25c6-b52f-9841fe32b082@amd.com>
 <CAKMK7uGA3URvu3BUzs617sGS_TchHDhpzzgsMGrVVJtwBpD+Vw@mail.gmail.com>
 <d6cdc22d-9cb2-7985-fdc3-ad3548899f02@amd.com>
 <20201105125009.GV401619@phenom.ffwll.local>
 <614b3893-b735-7ba4-4f0a-55891adbdc8d@amd.com>
 <20201105132016.GY401619@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <d15fa2da-fdc7-f7c8-195c-53f9ca505d80@amd.com>
Date: Thu, 5 Nov 2020 14:22:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201105132016.GY401619@phenom.ffwll.local>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM9P191CA0029.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:21c::34) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM9P191CA0029.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21c::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.21 via Frontend Transport; Thu, 5 Nov 2020 13:22:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a22fdc0b-8fad-4199-c66e-08d8818ddea0
X-MS-TrafficTypeDiagnostic: MN2PR12MB4848:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB48486813D8D7BB090ED3F6DA83EE0@MN2PR12MB4848.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gijV4w2XBdzXXziqRRCq+KyJ1R+oz8wNdbs4kQEIvPu51qkd4PaVMDu/Lu3q6OD8lPCBdIwzaOICMJtaIn45c1nPsZlAW+ejTGow5qdAUFdHQXI9i2gkIpVhBX9dfjtPFPOQl6uUqiR/uvSuCqIM5lhg1PYjlgiXXHSNqBBJV5gLceAugxZNU+WqVJjzjGObFpwX/0rSw5AxnJwOh8vChCLUcDGn871VOousaPmH6ZJkBee3t7nIedT55U7SVf8aFC9CUiaEvVJz3hmDv3S7G0/kAW3dwzZ1CKKw996b5u05G8y32Qs0aTLVpQr4MY0DrPrrA9QDxKhUUXDFxS9tQSjCfVzeyfXnkxBoiGwIqNXCz3Gs9C38IFYX4nbwHv7/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(39860400002)(346002)(366004)(396003)(66476007)(31686004)(31696002)(52116002)(8936002)(83380400001)(66946007)(5660300002)(6666004)(4326008)(186003)(66574015)(66556008)(16526019)(6916009)(2616005)(316002)(6486002)(478600001)(8676002)(36756003)(86362001)(54906003)(53546011)(2906002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: QSKdQjbqmXIWjJJ1BPPLFKCNO+GybQLYUqck8CA8ePCPP6+i6eX0EsI4cO2yJaDf62Ed8OFZF30+B9We06wdLhJ5nSZuG9JwMdYQigWPTM8fKonP53NIudA+CQ7R9DGGj3SbId2IROlFAD5RLsyQZPKpyg4KDCYJk9EwHUYlk+6MrIxZLAX9LG4GSVTVBdSZXqInsMeNOoBaZsPJ0iE0AkkpC5/AuID1q0coSR3yEY2OQtPkiBlef6gEW03OVg66W+Mk48BgQV00ffVkldertpqJ9No5Olwu5JTDcXgTweLGhnNcGjcmAHP96iQZ7U8uWiE6/TayQqLklREWDM3iJXx2tuobqoL4MMnE1US8WOXf9QIKp4cJq+7fdtp4FITUUAvnt44oJm2SC8C/R1NCJE93SvrJZmlF4oFou0qEuuBHL8N/PEEv582Wo+7mDu8xRm5DbPTDiZEoa83UKMcZwT4r+1rbs5O/khgPHHjD62mTOGgFQwPmbIpbSjt0JkM7lX7grOmAM1BIplc5F2mhxbwnFYsnGiJAjsuv85FphxdLpJZOzAVVf3Ay3S+yYRhQZvrXs6n9buN7tpvzbqS8liJXFPiSqBh0K9dJ/zbn+Fj2iTAWgH09o3SM6ZtPuMxacxkHZCRF0XuBKldemrzOllObvSZ4a39c3LFgRog9xYCus2vpPC141vIEOlSxjv2CyUr4wo2nlbbcRb5rUYEtCQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a22fdc0b-8fad-4199-c66e-08d8818ddea0
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2020 13:22:40.0004 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dkZM6XUOU7w3Izu7ZSx6c8xDjuM1C4gABx+xxwDFrWK0Zr4BkCECSO0GLd1dXXW0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4848
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Huang Rui <ray.huang@amd.com>, Brian Paul <brianp@vmware.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDUuMTEuMjAgdW0gMTQ6MjAgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIFRodSwgTm92
IDA1LCAyMDIwIGF0IDAxOjU2OjIyUE0gKzAxMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+
IEFtIDA1LjExLjIwIHVtIDEzOjUwIHNjaHJpZWIgRGFuaWVsIFZldHRlcjoKPj4+IE9uIFRodSwg
Tm92IDA1LCAyMDIwIGF0IDAxOjI5OjUwUE0gKzAxMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6
Cj4+Pj4gQW0gMDUuMTEuMjAgdW0gMTA6MTEgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+Pj4+PiBP
biBUaHUsIE5vdiA1LCAyMDIwIGF0IDk6MDAgQU0gQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFu
LmtvZW5pZ0BhbWQuY29tPiB3cm90ZToKPj4+Pj4+IEFtIDA0LjExLjIwIHVtIDE3OjUwIHNjaHJp
ZWIgRGFuaWVsIFZldHRlcjoKPj4+Pj4+PiBSYW5kb20gb2JzZXJ2YXRpb24gd2hpbGUgdHJ5aW5n
IHRvIHJldmlldyBDaHJpc3RpYW4ncyBwYXRjaCBzZXJpZXMgdG8KPj4+Pj4+PiBzdG9wIGxvb2tp
bmcgYXQgc3RydWN0IHBhZ2UgZm9yIGRtYS1idWYgaW1wb3J0cy4KPj4+Pj4+Pgo+Pj4+Pj4+IFRo
aXMgd2FzIG9yaWdpbmFsbHkgYWRkZWQgaW4KPj4+Pj4+Pgo+Pj4+Pj4+IGNvbW1pdCA1OGFhNjYy
MmQzMmFmN2QyYzA4ZDQ1MDg1ZjQ0YzU0NTU0YTE2ZWQ3Cj4+Pj4+Pj4gQXV0aG9yOiBUaG9tYXMg
SGVsbHN0cm9tIDx0aGVsbHN0cm9tQHZtd2FyZS5jb20+Cj4+Pj4+Pj4gRGF0ZTogICBGcmkgSmFu
IDMgMTE6NDc6MjMgMjAxNCArMDEwMAo+Pj4+Pj4+Cj4+Pj4+Pj4gICAgICAgICBkcm0vdHRtOiBD
b3JyZWN0bHkgc2V0IHBhZ2UgbWFwcGluZyBhbmQgLWluZGV4IG1lbWJlcnMKPj4+Pj4+Pgo+Pj4+
Pj4+ICAgICAgICAgTmVlZGVkIGZvciBzb21lIHZtIG9wZXJhdGlvbnM7IG1vc3Qgbm90YWJseSB1
bm1hcF9tYXBwaW5nX3JhbmdlKCkgd2l0aAo+Pj4+Pj4+ICAgICAgICAgZXZlbl9jb3dzID0gMC4K
Pj4+Pj4+Pgo+Pj4+Pj4+ICAgICAgICAgU2lnbmVkLW9mZi1ieTogVGhvbWFzIEhlbGxzdHJvbSA8
dGhlbGxzdHJvbUB2bXdhcmUuY29tPgo+Pj4+Pj4+ICAgICAgICAgUmV2aWV3ZWQtYnk6IEJyaWFu
IFBhdWwgPGJyaWFucEB2bXdhcmUuY29tPgo+Pj4+Pj4+Cj4+Pj4+Pj4gYnV0IHdlIGRvIG5vdCBo
YXZlIGEgc2luZ2xlIGNhbGxlciBvZiB1bm1hcF9tYXBwaW5nX3JhbmdlIHdpdGgKPj4+Pj4+PiBl
dmVuX2Nvd3MgPT0gMC4gQW5kIGFsbCB0aGUgZ2VtIGRyaXZlcnMgZG9uJ3QgZG8gdGhpcywgc28g
YW5vdGhlcgo+Pj4+Pj4+IHNtYWxsIHRoaW5nIHdlIGNvdWxkIHN0YW5kYXJkaXplIGJldHdlZW4g
ZHJtIGFuZCB0dG0gZHJpdmVycy4KPj4+Pj4+Pgo+Pj4+Pj4+IFBsdXMgSSBkb24ndCByZWFsbHkg
c2VlIGEgbmVlZCBmb3IgdW5hbXBfbWFwcGluZ19yYW5nZSB3aGVyZSB3ZSBkb24ndAo+Pj4+Pj4+
IHdhbnQgdG8gaW5kaXNjcmltaW5hdGVseSBzaG9vdCBkb3duIGFsbCBwdGVzLgo+Pj4+Pj4gTkFL
LCB3ZSB1c2UgdGhpcyB0byBkZXRlcm1pbmUgaWYgYSBwYWdlcyBiZWxvbmdzIHRvIHRoZSBkcml2
ZXIgb3Igbm90IGluCj4+Pj4+PiBhbWRncHUgZm9yIGV4YW1wbGUuCj4+Pj4+Pgo+Pj4+Pj4gTW9z
dGx5IHVzZWQgZm9yIGRlYnVnZ2luZywgYnV0IEkgd291bGQgcmVhbGx5IGxpa2UgdG8ga2VlcCB0
aGF0Lgo+Pj4+PiBDYW4geW91IHBscyBwb2ludCBtZSBhdCB0aGF0IGNvZGU/IEEgcXVpY2sgZ3Jl
cCBoYXNuJ3QgcmVhbGx5IGZvdW5kIG11Y2ggYXQgYWxsLgo+Pj4+IFNlZSBhbWRncHVfaW9tZW1f
cmVhZCgpIGZvciBhbiBleGFtcGxlOgo+Pj4gV2h5IGRvIHlvdSByZWplY3QgdGhpcz8KPj4gV2hl
biBJT01NVSBpcyBkaXNhYmxlZCBvciB1c2VzIGFuIDEgdG8gMSBtYXBwaW5nIHdlIHdvdWxkIG90
aGVyd2lzZSBnaXZlIHRoZQo+PiBzYW1lIGFjY2VzcyBhcyAvZGV2L21lbSB0byBzeXN0ZW0gbWVt
b3J5IGFuZCB0aGF0IGlzIGZvcmJpZGRlbi4gQnV0IGFzIEkKPj4gbm90ZWQgdGhpcyBpcyBqdXN0
IGZvciB0aGUgZGVidWdmcyBmaWxlLgo+IEFoLCB0aGVyZSdzIGEgY29uZmlnIG9wdGlvbiBmb3Ig
dGhhdC4gUGx1cyBpdCdzIGRlYnVnZnMsIGFueXRoaW5nIGdvZXMgaW4KPiBkZWJ1Z2ZzLCBidXQg
aWYgeW91J3JlIHdvcnJpZWQgYWJvdXQgdGhhdCBob2xlIHdlIHNob3VsZCBqdXN0IGRpc2FibGUg
dGhlCj4gZW50aXJlIGRlYnVnZnMgZmlsZSBmb3IgQ09ORklHX1NUUklDVF9ERVZNRU0uIEkgY2Fu
IHBlcmhhcHMgdGhyb3cgdGhhdCBvbgo+IHRvcCwgdGhhdCBmb2xsb3dfcGZuIHBhdGNoIHNlcmll
cyBJJ20gYmFraW5nIGlzIGFsbCBhYm91dCB0aGlzIGtpbmQgb2YKPiBmdW4uCgpBbmQgZXhhY3Rs
eSB0aGF0IHdvdWxkIGdldCBhIE5BSyBmcm9tIHVzLgoKV2UgaGF2ZSBzcGVjaWFsbHkgY3JlYXRl
ZCB0aGF0IGRlYnVnZnMgZmlsZSBhcyBhbiBhbHRlcm5hdGl2ZSB3aGVuIApDT05GSUdfU1RSSUNU
X0RFVk1FTSBpcyBzZXQuCgpSZWdhcmRzLApDaHJpc3RpYW4uCgo+Cj4+IFdoZW4gSSB0cmllZCBh
IGZldyB5ZWFycyBhZ28gdG8gbm90IHNldCB0aGUgcGFnZS0+bWFwcGluZyBJIGltbWVkaWF0ZWx5
IHJhbgo+PiBpbnRvIGlzc3VlcyB3aXRoIG91ciBldmljdGlvbiB0ZXN0LiBTbyBJIHRoaW5rIHRo
YXQgdGhpcyBpcyB1c2VkIGVsc2V3aGVyZQo+PiBhcyB3ZWxsLgo+IFRoYXQncyB0aGUga2luZCBv
ZiBpbnRlcmFjdGlvbiBJJ20gd29ycmllZCBhYm91dCBoZXJlIHRiaC4gSWYgdGhpcyBkb2VzCj4g
c29tZSBraW5kIG9mIHNocmlua2luZyBvZiBzb21lIHNvcnRzLCBJIHRoaW5rIGEgcmVhbCBzaHJp
bmtlciBzaG91bGQgdGFrZQo+IG92ZXIuCj4KPiBBbiBpbXByb3ZlZCBncmVwIHNob3dzIG5vdGhp
bmcgZWxzZSwgc28gdGhlIG9ubHkgdGhlIGFib3ZlIGlzIHRoZSBvbmx5Cj4gdGhpbmcgSSBjYW4g
dGhpbmsgb2YuIFdoYXQga2luZCBvZiBldmljdGlvbiB0ZXN0IGdvZXMgYm9vbSBpZiB5b3UgY2xl
YXIKPiAtPm1hcHBpbmcgaGVyZT8gSSdkIGJlIGhhcHB5IHRvIHR5cGUgdXAgdGhlIGNsZXZlciB0
cmljayBmb3IgdGhlIGRlYnVnZnMKPiBmaWxlcy4KPiAtRGFuaWVsCj4KPj4gUmVnYXJkcywKPj4g
Q2hyaXN0aWFuLgo+Pgo+Pj4gSWYgdGhpcyBpcyB0byBhdm9pZCBpc3N1ZXMgd2l0aCB1c2VycHRy
LCB0aGVuIEkgdGhpbmsgdGhlcmUncyBhIHNpbXBsZQo+Pj4gdHJpY2s6Cj4+PiAtIGdyYWIgcGFn
ZSByZWZlcmVuY2UKPj4+IC0gcmVjaGVjayB0aGF0IHRoZSBpb3ZhIHN0aWxsIHBvaW50cyBhdCB0
aGUgc2FtZSBhZGRyZXNzCj4+PiAtIGRvIHJlYWQvd3JpdGUsIHNhZmUgaW4gdGhlIGtub3dsZWRn
ZSB0aGF0IHRoaXMgcGFnZSBjYW5ub3QgYmUgcmV1c2VkIGZvcgo+Pj4gICAgIGFueXRoaW5nIGVs
c2UKPj4+IC0gZHJvcCBwYWdlIHJlZmVyZW5jZQo+Pj4KPj4+IE9mIGNvdXJzZSB0aGlzIGNhbiBz
dGlsbCByYWNlIGFnYWluc3QgaW92YSB1cGRhdGVzLCBidXQgdGhhdCBzZWVtcyB0byBiZSBhCj4+
PiBmdW5kYW1lbnRhbCBwYXJ0IG9mIHlvdXIgZGVidWcgaW50ZXJmYWNlIGhlcmUuCj4+Pgo+Pj4g
T3IgYW0gSSBtaXNzaW5nIHNvbWV0aGluZz8KPj4+Cj4+PiBKdXN0IHBvbmRlcmluZyB0aGlzIG1v
cmUgc2luY2Ugc2V0dGluZyB0aGUgcGFnZS0+bWFwcGluZyBwb2ludGVyIGZvciBqdXN0Cj4+PiB0
aGlzIHNlZW1zIHNvbWV3aGF0IHdpbGQgYWJ1c2Ugb2YgLT5tYXBwaW5nIHNlbWFudGljcyA6LSkK
Pj4+IC1EYW5pZWwKPj4+Cj4+Pj4+ICAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlm
IChwLT5tYXBwaW5nICE9IGFkZXYtPm1tYW4uYmRldi5kZXZfbWFwcGluZykKPj4+Pj4gICDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAtRVBFUk07
Cj4+Pj4gQ2hyaXN0aWFuLgo+Pj4+Cj4+Pj4+IC1EYW5pZWwKPj4+Pj4KPj4+Pj4+IENocmlzdGlh
bi4KPj4+Pj4+Cj4+Pj4+Pj4gQ2M6IFRob21hcyBIZWxsc3Ryb20gPHRoZWxsc3Ryb21Adm13YXJl
LmNvbT4KPj4+Pj4+PiBDYzogQnJpYW4gUGF1bCA8YnJpYW5wQHZtd2FyZS5jb20+Cj4+Pj4+Pj4g
U2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+Cj4+
Pj4+Pj4gQ2M6IENocmlzdGlhbiBLb2VuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPj4+
Pj4+PiBDYzogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4KPj4+Pj4+PiAtLS0KPj4+Pj4+
PiAgICAgIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3R0LmMgfCAxMiAtLS0tLS0tLS0tLS0KPj4+
Pj4+PiAgICAgIDEgZmlsZSBjaGFuZ2VkLCAxMiBkZWxldGlvbnMoLSkKPj4+Pj4+Pgo+Pj4+Pj4+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV90dC5jIGIvZHJpdmVycy9ncHUv
ZHJtL3R0bS90dG1fdHQuYwo+Pj4+Pj4+IGluZGV4IDg4NjFhNzRhYzMzNS4uNDM4ZWE0M2ZkOGMx
IDEwMDY0NAo+Pj4+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3R0LmMKPj4+Pj4+
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV90dC5jCj4+Pj4+Pj4gQEAgLTI5MSwxNyAr
MjkxLDYgQEAgaW50IHR0bV90dF9zd2Fwb3V0KHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2LCBz
dHJ1Y3QgdHRtX3R0ICp0dG0pCj4+Pj4+Pj4gICAgICAgICAgcmV0dXJuIHJldDsKPj4+Pj4+PiAg
ICAgIH0KPj4+Pj4+Pgo+Pj4+Pj4+IC1zdGF0aWMgdm9pZCB0dG1fdHRfYWRkX21hcHBpbmcoc3Ry
dWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsIHN0cnVjdCB0dG1fdHQgKnR0bSkKPj4+Pj4+PiAtewo+
Pj4+Pj4+IC0gICAgIHBnb2ZmX3QgaTsKPj4+Pj4+PiAtCj4+Pj4+Pj4gLSAgICAgaWYgKHR0bS0+
cGFnZV9mbGFncyAmIFRUTV9QQUdFX0ZMQUdfU0cpCj4+Pj4+Pj4gLSAgICAgICAgICAgICByZXR1
cm47Cj4+Pj4+Pj4gLQo+Pj4+Pj4+IC0gICAgIGZvciAoaSA9IDA7IGkgPCB0dG0tPm51bV9wYWdl
czsgKytpKQo+Pj4+Pj4+IC0gICAgICAgICAgICAgdHRtLT5wYWdlc1tpXS0+bWFwcGluZyA9IGJk
ZXYtPmRldl9tYXBwaW5nOwo+Pj4+Pj4+IC19Cj4+Pj4+Pj4gLQo+Pj4+Pj4+ICAgICAgaW50IHR0
bV90dF9wb3B1bGF0ZShzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiwKPj4+Pj4+PiAgICAgICAg
ICAgICAgICAgICAgICBzdHJ1Y3QgdHRtX3R0ICp0dG0sIHN0cnVjdCB0dG1fb3BlcmF0aW9uX2N0
eCAqY3R4KQo+Pj4+Pj4+ICAgICAgewo+Pj4+Pj4+IEBAIC0zMjAsNyArMzA5LDYgQEAgaW50IHR0
bV90dF9wb3B1bGF0ZShzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiwKPj4+Pj4+PiAgICAgICAg
ICBpZiAocmV0KQo+Pj4+Pj4+ICAgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPj4+Pj4+Pgo+
Pj4+Pj4+IC0gICAgIHR0bV90dF9hZGRfbWFwcGluZyhiZGV2LCB0dG0pOwo+Pj4+Pj4+ICAgICAg
ICAgIHR0bS0+cGFnZV9mbGFncyB8PSBUVE1fUEFHRV9GTEFHX1BSSVZfUE9QVUxBVEVEOwo+Pj4+
Pj4+ICAgICAgICAgIGlmICh1bmxpa2VseSh0dG0tPnBhZ2VfZmxhZ3MgJiBUVE1fUEFHRV9GTEFH
X1NXQVBQRUQpKSB7Cj4+Pj4+Pj4gICAgICAgICAgICAgICAgICByZXQgPSB0dG1fdHRfc3dhcGlu
KHR0bSk7CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

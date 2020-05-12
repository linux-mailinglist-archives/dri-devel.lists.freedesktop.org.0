Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8118C1CF9EB
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 17:56:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E13E86E92C;
	Tue, 12 May 2020 15:56:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2076.outbound.protection.outlook.com [40.107.237.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D9166E92C;
 Tue, 12 May 2020 15:56:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cLxkldQbAZ3OquT1j3BO0CJUKn/TEa4ruA7GCeMHXorAXzBcHgXY8IwxFg5+jxz+Pi8u5MEbG3tXFPXEqdQWw/W2hgrsW6qH1Bk7e6GDW6/Q40+G3tfY4S1HoNSOCk/B1kXR4Oe+3085Qfvz8LesvbmBPJ4rvZS7daotg9p1loWStvqMx+gE0VJhOaDzOk7Yr/Mvzrpk4cdPDlK12N7x0BwrW832he52moC9XvlqurU1ayGcwb7y5F6PKx9lOAdycAEvRyrBs3FRScsncBOuQIYoCobIYCQHeu3rHBP8IL30QVG9SKnQFTcWi5MvcQFF0vur/sPGIcxsyEQ+n3wlPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m76jCPLZqvFAvjX95FNc4uGTJgpMuzxOLhlUpWFTdOY=;
 b=CVD50e/fSaBmrquaawf9gSmzHavUqBcd9/+tNXNFYgblrUcKyeE87izCU7rYFJ+MObBGyzoMwVekbZJdNZ3I3cALgQdY/rh8duPKpu4ucA/1Va2fTWMOfAprEzDfB5WP5gMbnvl+nN4OPy6STcxvh4ociCP+vYtqlVQMcv5h9sLqhBjqm01pNpoM3P53u2GQkkw69NWUB6wMt2CO16Oah5GIrJ+2DgDAZpRBw9oLYt0/uuX8SAn8ibtc5y0n56gu3FoAk3nTo3QqrJZJWt2BdKDL73QgG5EE+0+JYdEsLQG9nylDUGA/XQ0MNr3Zga0PUMYK31Pbd8m9MNrQg88Rvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m76jCPLZqvFAvjX95FNc4uGTJgpMuzxOLhlUpWFTdOY=;
 b=tUNXG2RxqmlFMlEvnh+YZ4dIQWDDvgqHNCF4HrPqsbkxVjQUJgz+8KOfdQGUVCf7W7NhXIaRyCqxKLGpX12kXlN7s0Dg7uHQ72R5otRFXoB3u/u/xnnhceEk2d2jILBT8Np6CGru1pXtagj8y6Pv9VndWAMlbK55Ce9Q9aZL/oQ=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4401.namprd12.prod.outlook.com (2603:10b6:5:2a9::15)
 by DM6PR12MB3081.namprd12.prod.outlook.com (2603:10b6:5:38::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.33; Tue, 12 May
 2020 15:56:50 +0000
Received: from DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766]) by DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766%3]) with mapi id 15.20.2979.033; Tue, 12 May 2020
 15:56:50 +0000
Subject: Re: [RFC 10/17] drm/amdgpu: s/GFP_KERNEL/GFP_ATOMIC in scheduler code
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20200512085944.222637-1-daniel.vetter@ffwll.ch>
 <20200512085944.222637-11-daniel.vetter@ffwll.ch>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <879b127e-2180-bc59-f522-252416a7ac01@amd.com>
Date: Tue, 12 May 2020 17:56:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20200512085944.222637-11-daniel.vetter@ffwll.ch>
Content-Language: en-US
X-ClientProxiedBy: FR2P281CA0034.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::21) To DM6PR12MB4401.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 FR2P281CA0034.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:14::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3000.20 via Frontend Transport; Tue, 12 May 2020 15:56:47 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 99439c64-eb47-4a93-8c70-08d7f68d14be
X-MS-TrafficTypeDiagnostic: DM6PR12MB3081:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3081CA6BC4F5CAE7736BDB4B83BE0@DM6PR12MB3081.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 0401647B7F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ydIa+oJHoAiqPNjZr4kFe48iSUaYv5Lb7i8g4kn7vN/38nqf+vQzmrcIC05J32iMFPbFMscxvbjLlWhl/QVI7lhP1z6oDLWF/OFu7YoRrJYYW78i8YYAXcn9NR74Jc+MAYY0uILe5PwyzmMAp3zdUEd614fXTXafoDsK4UpCzLdzkOOiyHXkFl99GizfzjP9REwz+GgALlVqQZ2lchetP9GyPACHubiAxYeRamqPxMT6Plw7tWpPoSBPoFQsF3EFEKgA8W/FKNSbSYKystoFe0FzTvazOFrfbQmoPBdhrArClPwCefCGl2kYS+uTADP4vf+p5yUQn95qaqpb7XtuJ0c3ssCRthdcU/tz9xT9J78BXFxYEm+zrjbaxdjSw3s1vmI9eNdsPJ8VO0OcJHRwGHVTSg5Dl6mB/9+DIdQXZP+5EvVCmp87cPEjY9LvqVXH8k3dcnXFw02X9hHD1WCq/orkNMX32c/0EyNtBRpYLrfeq3cWdMFukgTNFCG4hhllt2G8QzT9X9fTteiqoqHDONMKv0MWc5jiRy2OUC2DQYjUVlyZ+rYRMnaJtTar9bOt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4401.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(346002)(39860400002)(366004)(396003)(376002)(33430700001)(86362001)(66556008)(16526019)(5660300002)(66476007)(31696002)(54906003)(52116002)(316002)(66946007)(478600001)(6666004)(33440700001)(110136005)(2906002)(31686004)(36756003)(8676002)(186003)(7416002)(2616005)(6486002)(8936002)(4326008)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: LrxnlV7hPQUPawhqdOBYuAHH/w0GjYZGu7iUKxEQVcWRaBJbL9TxZou1Qrkl54X9iDl3pFofC7wuoMfaEYJ6YdCJepbu21BLLugsyJ4FO4INwBTTh8ZlKR9osWo5PS9+Kxy1yDBTLOXCtQ2MpaJYY7M9K2wRRfJcU8tc7Va7tftol7LZ88EN8pz8ZEc4jprEi3ucu9iGZM3IXB4XbJoutO0fFid4iyDli0egucfRqc+MxYvBynSKE1tfOhfKlcKrMkAR5kGoR6GFexvINGRVXoGdgiqbm8oinXpR9Fl0DFU1w4797rTuwZmxH33Pj0MaHrtilgWq0fUR2TizpaEhyYmqEImxd5vH1kOk74eWrqDoj/UYl3ssOxec+dKGJdpAkaaKkhfeup+ZElNCI5rmTw3nTm5dAOObH91+uyanuUq/WN+JA3MpFD8t84b/rUA7gx/46KB70Jgq7AxylH7YvgQpOcDfkglylXFIRtSqjARv4wnxBHfYgnlKkPvNrgUAKlMs1jCdm1G5uvkClnFERxaSD/k4G/wAEq8qIJ75czX9JR/wGwO09ctApqbYkhOA
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99439c64-eb47-4a93-8c70-08d7f68d14be
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2020 15:56:49.9439 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lz5PA8s8e2i6SsSo4/rCGGe+q05HFhHV+zyK1nEBKpRRtm0qtWQaRFuK4ceKTC83
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3081
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
Cc: linux-rdma@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 LKML <linux-kernel@vger.kernel.org>, amd-gfx@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>, linaro-mm-sig@lists.linaro.org,
 Daniel Vetter <daniel.vetter@intel.com>, linux-media@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SHVpIHdoYXQ/IE9mIGhhbmQgdGhhdCBkb2Vzbid0IGxvb2tzIGNvcnJlY3QgdG8gbWUuCgpXaHkg
dGhlIGhlY2sgc2hvdWxkIHRoaXMgYmUgYW4gYXRvbWljIGNvbnRleHQ/IElmIHRoYXQncyBjb3Jy
ZWN0IAphbGxvY2F0aW5nIG1lbW9yeSBpcyB0aGUgbGVhc3Qgb2YgdGhlIHByb2JsZW1zIHdlIGhh
dmUuCgpSZWdhcmRzLApDaHJpc3RpYW4uCgpBbSAxMi4wNS4yMCB1bSAxMDo1OSBzY2hyaWViIERh
bmllbCBWZXR0ZXI6Cj4gTXkgZG1hLWZlbmNlIGxvY2tkZXAgYW5ub3RhdGlvbnMgY2F1Z2h0IGFu
IGludmVyc2lvbiBiZWNhdXNlIHdlCj4gYWxsb2NhdGUgbWVtb3J5IHdoZXJlIHdlIHJlYWxseSBz
aG91bGRuJ3Q6Cj4KPiAJa21lbV9jYWNoZV9hbGxvYysweDJiLzB4NmQwCj4gCWFtZGdwdV9mZW5j
ZV9lbWl0KzB4MzAvMHgzMzAgW2FtZGdwdV0KPiAJYW1kZ3B1X2liX3NjaGVkdWxlKzB4MzA2LzB4
NTUwIFthbWRncHVdCj4gCWFtZGdwdV9qb2JfcnVuKzB4MTBmLzB4MjYwIFthbWRncHVdCj4gCWRy
bV9zY2hlZF9tYWluKzB4MWI5LzB4NDkwIFtncHVfc2NoZWRdCj4gCWt0aHJlYWQrMHgxMmUvMHgx
NTAKPgo+IFRyb3VibGUgcmlnaHQgbm93IGlzIHRoYXQgbG9ja2RlcCBvbmx5IHZhbGlkYXRlcyBh
Z2FpbnN0IEdGUF9GUywgd2hpY2gKPiB3b3VsZCBiZSBnb29kIGVub3VnaCBmb3Igc2hyaW5rZXJz
LiBCdXQgZm9yIG1tdV9ub3RpZmllcnMgd2UgYWN0dWFsbHkKPiBuZWVkICFHRlBfQVRPTUlDLCBz
aW5jZSB0aGV5IGNhbiBiZSBjYWxsZWQgZnJvbSBhbnkgcGFnZSBsYXVuZGVyaW5nLAo+IGV2ZW4g
aWYgR0ZQX05PRlMgb3IgR0ZQX05PSU8gYXJlIHNldC4KPgo+IEkgZ3Vlc3Mgd2Ugc2hvdWxkIGlt
cHJvdmUgdGhlIGxvY2tkZXAgYW5ub3RhdGlvbnMgZm9yCj4gZnNfcmVjbGFpbV9hY3F1aXJlL3Jl
bGVhc2UuCj4KPiBPZmMgcmVhbCBmaXggaXMgdG8gcHJvcGVybHkgcHJlYWxsb2NhdGUgdGhpcyBm
ZW5jZSBhbmQgc3R1ZmYgaXQgaW50bwo+IHRoZSBhbWRncHUgam9iIHN0cnVjdHVyZS4gQnV0IEdG
UF9BVE9NSUMgZ2V0cyB0aGUgbG9ja2RlcCBzcGxhdCBvdXQgb2YKPiB0aGUgd2F5Lgo+Cj4gdjI6
IFR3byBtb3JlIGFsbG9jYXRpb25zIGluIHNjaGVkdWxlciBwYXRocy4KPgo+IEZyaXN0IG9uZToK
Pgo+IAlfX2ttYWxsb2MrMHg1OC8weDcyMAo+IAlhbWRncHVfdm1pZF9ncmFiKzB4MTAwLzB4Y2Ew
IFthbWRncHVdCj4gCWFtZGdwdV9qb2JfZGVwZW5kZW5jeSsweGY5LzB4MTIwIFthbWRncHVdCj4g
CWRybV9zY2hlZF9lbnRpdHlfcG9wX2pvYisweDNmLzB4NDQwIFtncHVfc2NoZWRdCj4gCWRybV9z
Y2hlZF9tYWluKzB4ZjkvMHg0OTAgW2dwdV9zY2hlZF0KPgo+IFNlY29uZCBvbmU6Cj4KPiAJa21l
bV9jYWNoZV9hbGxvYysweDJiLzB4NmQwCj4gCWFtZGdwdV9zeW5jX2ZlbmNlKzB4N2UvMHgxMTAg
W2FtZGdwdV0KPiAJYW1kZ3B1X3ZtaWRfZ3JhYisweDg2Yi8weGNhMCBbYW1kZ3B1XQo+IAlhbWRn
cHVfam9iX2RlcGVuZGVuY3krMHhmOS8weDEyMCBbYW1kZ3B1XQo+IAlkcm1fc2NoZWRfZW50aXR5
X3BvcF9qb2IrMHgzZi8weDQ0MCBbZ3B1X3NjaGVkXQo+IAlkcm1fc2NoZWRfbWFpbisweGY5LzB4
NDkwIFtncHVfc2NoZWRdCj4KPiBDYzogbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnCj4gQ2M6
IGxpbmFyby1tbS1zaWdAbGlzdHMubGluYXJvLm9yZwo+IENjOiBsaW51eC1yZG1hQHZnZXIua2Vy
bmVsLm9yZwo+IENjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBpbnRlbC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gQ2M6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMt
d2lsc29uLmNvLnVrPgo+IENjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RA
bGludXguaW50ZWwuY29tPgo+IENjOiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmln
QGFtZC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBp
bnRlbC5jb20+Cj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZmVu
Y2UuYyB8IDIgKy0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9pZHMuYyAg
IHwgMiArLQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3N5bmMuYyAgfCAy
ICstCj4gICAzIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkK
Pgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZmVuY2Uu
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9mZW5jZS5jCj4gaW5kZXggZDg3
OGZlN2ZlZTUxLi4wNTViNDcyNDFiYjEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2ZlbmNlLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfZmVuY2UuYwo+IEBAIC0xNDMsNyArMTQzLDcgQEAgaW50IGFtZGdwdV9mZW5jZV9l
bWl0KHN0cnVjdCBhbWRncHVfcmluZyAqcmluZywgc3RydWN0IGRtYV9mZW5jZSAqKmYsCj4gICAJ
dWludDMyX3Qgc2VxOwo+ICAgCWludCByOwo+ICAgCj4gLQlmZW5jZSA9IGttZW1fY2FjaGVfYWxs
b2MoYW1kZ3B1X2ZlbmNlX3NsYWIsIEdGUF9LRVJORUwpOwo+ICsJZmVuY2UgPSBrbWVtX2NhY2hl
X2FsbG9jKGFtZGdwdV9mZW5jZV9zbGFiLCBHRlBfQVRPTUlDKTsKPiAgIAlpZiAoZmVuY2UgPT0g
TlVMTCkKPiAgIAkJcmV0dXJuIC1FTk9NRU07Cj4gICAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2lkcy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2lkcy5jCj4gaW5kZXggZmU5MmRjZDk0ZDRhLi5mZGNkNjY1OWY1YWQgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2lkcy5jCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2lkcy5jCj4gQEAgLTIwOCw3ICsyMDgs
NyBAQCBzdGF0aWMgaW50IGFtZGdwdV92bWlkX2dyYWJfaWRsZShzdHJ1Y3QgYW1kZ3B1X3ZtICp2
bSwKPiAgIAlpZiAocmluZy0+dm1pZF93YWl0ICYmICFkbWFfZmVuY2VfaXNfc2lnbmFsZWQocmlu
Zy0+dm1pZF93YWl0KSkKPiAgIAkJcmV0dXJuIGFtZGdwdV9zeW5jX2ZlbmNlKHN5bmMsIHJpbmct
PnZtaWRfd2FpdCwgZmFsc2UpOwo+ICAgCj4gLQlmZW5jZXMgPSBrbWFsbG9jX2FycmF5KHNpemVv
Zih2b2lkICopLCBpZF9tZ3ItPm51bV9pZHMsIEdGUF9LRVJORUwpOwo+ICsJZmVuY2VzID0ga21h
bGxvY19hcnJheShzaXplb2Yodm9pZCAqKSwgaWRfbWdyLT5udW1faWRzLCBHRlBfQVRPTUlDKTsK
PiAgIAlpZiAoIWZlbmNlcykKPiAgIAkJcmV0dXJuIC1FTk9NRU07Cj4gICAKPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3N5bmMuYyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9zeW5jLmMKPiBpbmRleCBiODdjYTE3MTk4NmEuLjMzMDQ3
NmNjMGM4NiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
c3luYy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3N5bmMuYwo+
IEBAIC0xNjgsNyArMTY4LDcgQEAgaW50IGFtZGdwdV9zeW5jX2ZlbmNlKHN0cnVjdCBhbWRncHVf
c3luYyAqc3luYywgc3RydWN0IGRtYV9mZW5jZSAqZiwKPiAgIAlpZiAoYW1kZ3B1X3N5bmNfYWRk
X2xhdGVyKHN5bmMsIGYsIGV4cGxpY2l0KSkKPiAgIAkJcmV0dXJuIDA7Cj4gICAKPiAtCWUgPSBr
bWVtX2NhY2hlX2FsbG9jKGFtZGdwdV9zeW5jX3NsYWIsIEdGUF9LRVJORUwpOwo+ICsJZSA9IGtt
ZW1fY2FjaGVfYWxsb2MoYW1kZ3B1X3N5bmNfc2xhYiwgR0ZQX0FUT01JQyk7Cj4gICAJaWYgKCFl
KQo+ICAgCQlyZXR1cm4gLUVOT01FTTsKPiAgIAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==

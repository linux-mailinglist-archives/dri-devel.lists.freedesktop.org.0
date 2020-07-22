Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B662298FD
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jul 2020 15:10:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 536C06E051;
	Wed, 22 Jul 2020 13:10:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2064.outbound.protection.outlook.com [40.107.92.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5D246E051;
 Wed, 22 Jul 2020 13:10:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j9wn9qgLT/gWOHhRhT5fad71PO2plNlzTybrHcbS0e4U0+ys5iMAHBEn7iaIaZUi3aKBp6MGqA3I3nS+ykeKSYBtyFFQQXi/8NM+PRtb0Fi49KnEzOqrTTkcZ091lfRE3jIIxgp+DQ37hiTLRf5e8GAiFVeTKPCZNZsPuf2/aaGE6x3rXqB6pyOHDCydgiZL6UeXxXNuldZZKvV0tnNmyarz9mgMJyOcN2ceib3AZm3B6dQXJIQyQ9aoaUbzQ4+HMZA78+B4XUnJ3ogbmJA611jZylAOL0592BfqOq6SyD1DzCWUh+M32juZ4EHu4TrZzjRUUav+PXx6BdkVYjqhOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cc6mVWo5J+grqXq6EIYfVZtkIyF+jyTn2BS1a43FbUc=;
 b=D9dZIT19pcrKB26UDBUKc00lTqGmiewwcF9MFgLSJlheuYBd8YuUeGAuJmenLFIQPWqjAn8zAURHU2/s0G3qF+Nset9TNLJH3tWtPFskGyF9Vwf7xxL7u47WFenv89fkT8jv/6goWPVo5s0ERcB0rCverWd+r9n1e7A/JuM7r+q3E38T37iO5gVFmYPmkMamEPP7oIcyd3lvrYcfHu4CEKEozsEjZ7hrLCyFacI7hYEyAXFit/TWQnhLkYSMmgz4S0DCRABTra91l+lfL2KLlVZV33CQYjAlrxjP0KvJGQj83bMb7I3lkJpCiWZ5g32//7zdzKRx+Iin2XzyrMVrtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cc6mVWo5J+grqXq6EIYfVZtkIyF+jyTn2BS1a43FbUc=;
 b=CUx6qUGHRs1hz/b+0jFk2W+G69yRe/rfnNNMCXKSR6MSldvEhtd5tOoy78hzKayBEzKRiIXxv9uIssHuz8HZV+K9JfBfVvq87IZr25Bo5RuK0/zxF9gZXQzM/RFMn4wdwmIUf0RR4w7wQk3KkWeCHQ2blNcO1ootX3751hMAVY8=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (2603:10b6:a03:ae::10)
 by BY5PR12MB4289.namprd12.prod.outlook.com (2603:10b6:a03:204::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.20; Wed, 22 Jul
 2020 13:10:33 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::7d42:c932:e35f:71b1]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::7d42:c932:e35f:71b1%7]) with mapi id 15.20.3216.020; Wed, 22 Jul 2020
 13:10:33 +0000
Subject: Re: [PATCH] drm/amdgpu/dc: Simplify drm_crtc_state::active checks
To: Daniel Vetter <daniel@ffwll.ch>, =?UTF-8?Q?Michel_D=c3=a4nzer?=
 <michel@daenzer.net>
References: <20200722123813.721041-1-michel@daenzer.net>
 <CAKMK7uGO3K0P1yJsdT0urEXOVyBCU_Gsm8JaAW3R0TrBkueYNg@mail.gmail.com>
From: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
Message-ID: <c1bed91c-aa9d-140e-701b-6946995cf24f@amd.com>
Date: Wed, 22 Jul 2020 09:10:27 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAKMK7uGO3K0P1yJsdT0urEXOVyBCU_Gsm8JaAW3R0TrBkueYNg@mail.gmail.com>
Content-Language: en-US
X-ClientProxiedBy: YQBPR0101CA0051.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:1::28) To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.180] (24.212.165.133) by
 YQBPR0101CA0051.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c00:1::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.23 via Frontend
 Transport; Wed, 22 Jul 2020 13:10:32 +0000
X-Originating-IP: [24.212.165.133]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b0e2b4d9-442e-4541-222a-08d82e409d99
X-MS-TrafficTypeDiagnostic: BY5PR12MB4289:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR12MB428958178E41894E7DDEF5E3EC790@BY5PR12MB4289.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CD/Qizm0RGDv8n1Z9YHm+kJI28pnXYwyUTwVFezi+dFzuJekS4DQT8hNI2nUAZxr8WDHgzhUbgxwOB+mf5Ky+RCuZPQSY8uZi4X6j8GkYnLgTtEpHnjukUjJQb5G5qqC59eHZpobKqDlX5BbPvlZR2Ywidg4KPla0C0QAEE6wnpnJ+PmR05KBaEfDlxqH/yBHREmxal76th1+cITTk9O0lJh3QPZlTpRQVf94ska7SpfcwSE7HuyGJTQ/cXNqieoBcd7rm98Y8ZW8UQtf9qGNnSTyng4J4r364an/C6Pqe81HutKh48dKLTDZM0ZtyI+ZmGRHT0Ju5IpXUuAnIm3RRvio+2mVhGqvAkdwt9DWAkdPDDLWwwMPQ9tvdii1hyg3WQ28/z3hFFXnc82MG1FraQKP/QcDNOVKSvMN4mr+WM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3560.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(366004)(39860400002)(376002)(346002)(136003)(956004)(26005)(54906003)(31696002)(316002)(6666004)(110136005)(16576012)(2616005)(8936002)(86362001)(2906002)(5660300002)(4326008)(6486002)(66556008)(966005)(478600001)(36756003)(8676002)(186003)(31686004)(16526019)(66946007)(52116002)(66574015)(66476007)(53546011)(83380400001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: SZKlYdJoHbBP/fPjMclinh7TXyMx+Owyd3g1o8XdlasUTkpgRTfRDquPIeW6P/DhLdrw2c/7RojFs+jMCEscZ3dJ+UotupXiZjBexGdCSe3PQUYLZpSTaSaPDo6E6+z5s7RXputXs6HueMKx8VAt+Peh0D3vdUKVUjAQRQiSOk+PaqLEb3jz//ZP+xhc9Mjef6oL3OP4v6wWifhnoVzvntT9zaxdM1uKVHwqqO1cpNCfpigyjrBwFfTmXOziKuK1wPLM6gL8YNqCjEafQsi/Ra63PJmbCEMG9WPVcgbBg/BdPMgBy59vvykcmzraggJs6z9l0aOMcwDszqMhqorynwQcwCXHN3ce+w6nkAkWwJJstjFESwSQLWAu5Lnl3qx4wWTqN6zKZ0K27chYKNgG+5+dgRXLMyxG1hQ/RI9ww6jUrMGNXa8xFCHSrnhk4gjIjLY+q8REFHpgoW2mHtleoXulWQBJmsp+aHpFXTGQHzA41cbEjfy0ABYAUO3R1rsR
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0e2b4d9-442e-4541-222a-08d82e409d99
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3560.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2020 13:10:33.2756 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XBU/3tTR7v81oVsITI3BqMFomptSVPpFHeVerwTtbbCpnvbadW+0c7Mjzf1r1P/cvf0fqBkSMxnxn3meBtmksA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4289
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
Cc: Leo Li <sunpeng.li@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC0wNy0yMiA4OjUxIGEubS4sIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gT24gV2VkLCBK
dWwgMjIsIDIwMjAgYXQgMjozOCBQTSBNaWNoZWwgRMOkbnplciA8bWljaGVsQGRhZW56ZXIubmV0
PiB3cm90ZToKPj4KPj4gRnJvbTogTWljaGVsIETDpG56ZXIgPG1kYWVuemVyQHJlZGhhdC5jb20+
Cj4+Cj4+IGRybV9hdG9taWNfY3J0Y19jaGVjayBlbmZvcmNlcyB0aGF0IDo6YWN0aXZlIGNhbiBv
bmx5IGJlIHRydWUgaWYKPj4gOjplbmFibGUgaXMgYXMgd2VsbC4KPj4KPj4gU2lnbmVkLW9mZi1i
eTogTWljaGVsIETDpG56ZXIgPG1kYWVuemVyQHJlZGhhdC5jb20+CgpMb29rcyBmaW5lIHRvIG1l
LiBUaGUgY2hlY2sgaXMgc3VmZmljaWVudGx5IG9sZCBlbm91Z2ggdGhhdCBJIGRvbid0IG1pbmQg
CnJlbHlpbmcgb24gdGhlIGNvcmUgZm9yIHRoaXMgZWl0aGVyLgoKUmV2aWV3ZWQtYnk6IE5pY2hv
bGFzIEthemxhdXNrYXMgPG5pY2hvbGFzLmthemxhdXNrYXNAYW1kLmNvbT4KCj4gCj4gbW9kZXNl
dCB2cyBtb2RlcmVzZXQgaXMgYSBiaXQgYW4gaW5nbG9yaW91cyBuYW1lIGNob2ljZSAuLi4gc2lu
Y2UgdGhpcwo+IHNlZW1zIHRvIGJlIGdsdWUgY29kZSBhbmQgbm90IHBhcnQgb2YgY29yZSBkYywg
bWF5YmUgcmVuYW1lIHRvCj4gZW5hYmxlX3JlcXVpcmVkL2Rpc2FibGVfcmVxdWlyZWQgdG8ga2Vl
cCBpdCBjb25zaXN0ZW50IHdpdGggdGhlCj4gd29yZGluZyBhdG9taWMgaGVscGVycyB1c2U/IERD
IGFsc28gc2VlbXMgdG8gdXNlIHJlc2V0IGZvciBhIGxvdCBvZgo+IG90aGVyIHRoaW5ncyBhbHJl
YWR5IChzdGF0ZSByZXNldCwgbGlrZSBhdG9taWMsIG9yIGdwdSByZXNldCBsaWtlCj4gZHJtL3Nj
aGVkdWxlcidzIHRkX3JfKSwgc28gSSB0aGluayB0aGlzIHdvdWxkIGFsc28gaGVscCBjbGFyaXR5
IGZyb20gYQo+IERDIHBlcnNwZWN0aXZlLgo+IAo+IFBhdGNoIGl0c2VsZiBpcyBnb29kLCBhYm92
ZSBqdXN0IGFuIGlkZWEgZm9yIGFub3RoZXIgcGF0Y2ggb24gdG9wLgo+IAo+IFJldmlld2VkLWJ5
OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgoKVGhhdCBzb3VuZHMgbGlr
ZSBhIHJlYXNvbmFibGUgaWRlYSB0byBtZS4gVGhlc2UgYXJlIHVzZWQgbW9yZSBhcyBhIApzdHJl
YW1fY2hhbmdlZCAvIHN0cmVhbV9yZW1vdmVkIGZsYWcsIGJ1dCBJIGRvbid0IHRoaW5rIHRoZXNl
IGhlbHBlcnMgCnJlYWxseSBuZWVkIHRvIGV4aXN0IGF0IGFsbC4KClRoYXQgY291bGQgY29tZSBh
cyBhIGZvbGxvdyB1cCBwYXRjaC4KClJlZ2FyZHMsCk5pY2hvbGFzIEthemxhdXNrYXMKCj4+IC0t
LQo+PiAgIC4uLi9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyAgICB8
IDE2ICsrKy0tLS0tLS0tLS0tLS0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCsp
LCAxMyBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCj4+IGluZGV4IDMxMmM1NDNiMjU4Zi4uZGFiZWYzMDdh
NzRmIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2Rt
L2FtZGdwdV9kbS5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVf
ZG0vYW1kZ3B1X2RtLmMKPj4gQEAgLTM0MTUsMjEgKzM0MTUsMTIgQEAgc3RhdGljIGJvb2wgbW9k
ZXNldF9yZXF1aXJlZChzdHJ1Y3QgZHJtX2NydGNfc3RhdGUgKmNydGNfc3RhdGUsCj4+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBkY19zdHJlYW1fc3RhdGUgKm5ld19zdHJl
YW0sCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBkY19zdHJlYW1fc3Rh
dGUgKm9sZF9zdHJlYW0pCj4+ICAgewo+PiAtICAgICAgIGlmICghZHJtX2F0b21pY19jcnRjX25l
ZWRzX21vZGVzZXQoY3J0Y19zdGF0ZSkpCj4+IC0gICAgICAgICAgICAgICByZXR1cm4gZmFsc2U7
Cj4+IC0KPj4gLSAgICAgICBpZiAoIWNydGNfc3RhdGUtPmVuYWJsZSkKPj4gLSAgICAgICAgICAg
ICAgIHJldHVybiBmYWxzZTsKPj4gLQo+PiAtICAgICAgIHJldHVybiBjcnRjX3N0YXRlLT5hY3Rp
dmU7Cj4+ICsgICAgICAgcmV0dXJuIGNydGNfc3RhdGUtPmFjdGl2ZSAmJiBkcm1fYXRvbWljX2Ny
dGNfbmVlZHNfbW9kZXNldChjcnRjX3N0YXRlKTsKPj4gICB9Cj4+Cj4+ICAgc3RhdGljIGJvb2wg
bW9kZXJlc2V0X3JlcXVpcmVkKHN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAqY3J0Y19zdGF0ZSkKPj4g
ICB7Cj4+IC0gICAgICAgaWYgKCFkcm1fYXRvbWljX2NydGNfbmVlZHNfbW9kZXNldChjcnRjX3N0
YXRlKSkKPj4gLSAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsKPj4gLQo+PiAtICAgICAgIHJl
dHVybiAhY3J0Y19zdGF0ZS0+ZW5hYmxlIHx8ICFjcnRjX3N0YXRlLT5hY3RpdmU7Cj4+ICsgICAg
ICAgcmV0dXJuICFjcnRjX3N0YXRlLT5hY3RpdmUgJiYgZHJtX2F0b21pY19jcnRjX25lZWRzX21v
ZGVzZXQoY3J0Y19zdGF0ZSk7Cj4+ICAgfQo+Pgo+PiAgIHN0YXRpYyB2b2lkIGFtZGdwdV9kbV9l
bmNvZGVyX2Rlc3Ryb3koc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyKQo+PiBAQCAtODEwOCw4
ICs4MDk5LDcgQEAgc3RhdGljIGludCBkbV91cGRhdGVfY3J0Y19zdGF0ZShzdHJ1Y3QgYW1kZ3B1
X2Rpc3BsYXlfbWFuYWdlciAqZG0sCj4+ICAgICAgICAgICAqIFdlIHdhbnQgdG8gZG8gZGMgc3Ry
ZWFtIHVwZGF0ZXMgdGhhdCBkbyBub3QgcmVxdWlyZSBhCj4+ICAgICAgICAgICAqIGZ1bGwgbW9k
ZXNldCBiZWxvdy4KPj4gICAgICAgICAgICovCj4+IC0gICAgICAgaWYgKCEoZW5hYmxlICYmIGFj
b25uZWN0b3IgJiYgbmV3X2NydGNfc3RhdGUtPmVuYWJsZSAmJgo+PiAtICAgICAgICAgICAgIG5l
d19jcnRjX3N0YXRlLT5hY3RpdmUpKQo+PiArICAgICAgIGlmICghKGVuYWJsZSAmJiBhY29ubmVj
dG9yICYmIG5ld19jcnRjX3N0YXRlLT5hY3RpdmUpKQo+PiAgICAgICAgICAgICAgICAgIHJldHVy
biAwOwo+PiAgICAgICAgICAvKgo+PiAgICAgICAgICAgKiBHaXZlbiBhYm92ZSBjb25kaXRpb25z
LCB0aGUgZGMgc3RhdGUgY2Fubm90IGJlIE5VTEwgYmVjYXVzZToKPj4gLS0KPj4gMi4yOC4wLnJj
MAo+Pgo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
PiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKPj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwKPiAKPiAKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 976FFFD043
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 22:23:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F2726E41F;
	Thu, 14 Nov 2019 21:23:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740043.outbound.protection.outlook.com [40.107.74.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9750B6E41F;
 Thu, 14 Nov 2019 21:23:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bLe9emyPwvv1hVniR3tRV18x4KJpoJi1jrhAZ1qa8trIErFu41j9CE1UFizgjdHZ+o61asvd3gAk8yF3o3f5MTE/Ly6RXSo9YPOLQONkNFA6DxEW027s6KBWOJ0O7APdKX4tXGlkir1Eg5l32xAEjE3OlcmLB7kOFI0KUq62XxIOVWyfb55J4985gH9pCu4lcfQt3sGPN3+cbANdB2wKNs8l+nKpm7CiiQWSqc402IzyzOSHWqZ8+3BuUH/9JTiOT35Hs4MM89bSmqqaQlw/DQrHL2gWheBZn+Oa9pXq8yupuSZbBtcWNEobrRwDJjJBU7wtp74rl0bXgDVaSSpBVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z04/1cNneL1JLooh3gmG/jXhdOimWs9oZuh0vnY1LSU=;
 b=hRk5tJuZGcfUGR8tsy8DlDIxVyg1vi6plQZcgi9TSIRcXVh3xsqviefxzG+9hxApnI/J8C80bs/4fSAQZ2LBvM3bL+mPZ+tOMO1JoUinZG9pai96NCfPbw2tzu6KJwMBxuT8Am59Z1SSoUEQuev+/yzW++q8RN1FKqbr+sR0OWCdMRDUkgt7rNXU+Vl96HPxNkEytM87SgYYjPcI6X9TJea6tE0aHDJPkGaLM35t0nsP3exBO+RYlAHXoxor0hRkTbkhV7e1INuu1m7tmsaSHBKEt9ZVJa82AWvuz1VoitMEQsrUMPWLuLARiOSZ7nH+BYId9GxxVVPy9Pu4l12lRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB0037.namprd12.prod.outlook.com (10.172.78.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.20; Thu, 14 Nov 2019 21:23:42 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::449d:52a8:2761:9195]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::449d:52a8:2761:9195%5]) with mapi id 15.20.2451.023; Thu, 14 Nov 2019
 21:23:42 +0000
Subject: Re: [PATCH] drm/amdgpu/dm: Do not throw an error for a display with
 no audio
To: Chris Wilson <chris@chris-wilson.co.uk>, dri-devel@lists.freedesktop.org
References: <20191114204413.457504-1-chris@chris-wilson.co.uk>
From: Harry Wentland <hwentlan@amd.com>
Autocrypt: addr=hwentlan@amd.com; keydata=
 mQENBFhb4C8BCADhHHUNoBQ7K7LupCP0FsUb443Vuqq+dH0uo4A3lnPkMF6FJmGcJ9Sbx1C6
 cd4PbVAaTFZUEmjqfpm+wCRBe11eF55hW3GJ273wvfH69Q/zmAxwO8yk+i5ZWWl8Hns5h69K
 D9QURHLpXxrcwnfHFah0DwV23TrD1KGB7vowCZyJOw93U/GzAlXKESy0FM7ZOYIJH83X7qhh
 Q9KX94iTEYTeH86Wy8hwHtqM6ySviwEz0g+UegpG8ebbz0w3b5QmdKCAg+eZTmBekP5o77YE
 BKqR+Miiwo9+tzm2N5GiF9HDeI2pVe/egOLa5UcmsgdF4Y5FKoMnBbAHNaA6Fev8PHlNABEB
 AAG0J0hhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPokBNwQTAQgAIQUC
 WFvgLwIbAwULCQgHAgYVCAkKCwIEFgIDAQIeAQIXgAAKCRAtWBXJjBS24xUlCAC9MqAlIbZO
 /a37s41h+MQ+D20C6/hVErWO+RA06nA+jFDPUWrDJKYdn6EDQWdLY3ATeAq3X8GIeOTXGrPD
 b2OXD6kOViW/RNvlXdrIsnIDacdr39aoAlY1b+bhTzZVz4pto4l+K1PZb5jlMgTk/ks9HesL
 RfYVq5wOy3qIpocdjdlXnSUKn0WOkGBBd8Nv3o0OI18tiJ1S/QwLBBfZoVvfGinoB2p4j/wO
 kJxpi3F9TaOtLGcdrgfghg31Fb48DP+6kodZ4ircerp4hyAp0U2iKtsrQ/sVWR4mbe3eTfcn
 YjBxGd2JOVdNQZa2VTNf9GshIDMD8IIQK6jN0LfY8Py2uQENBFhb4C8BCAC/0KWY3pIbU2cy
 i7GMj3gqB6h0jGqRuMpMRoSNDoAUIuSh17w+bawuOF6XZPdK3D4lC9cOXMwP3aP9tTJOori2
 8vMH8KW9jp9lAYnGWYhSqLdjzIACquMqi96EBtawJDct1e9pVgp+d4JXHlgIrl11ITJo8rCP
 dEqjro2bCBWxijsIncdCzMjf57+nR7u86SBtGSFcXKapS7YJeWcvM6MzFYgIkxHxxBDvBBvm
 U2/mAXiL72kwmlV1BNrabQxX2UnIb3xt3UovYJehrnDUMdYjxJgSPRBx27wQ/D05xAlhkmmL
 FJ01ZYc412CRCC6gjgFPfUi2y7YJTrQHS79WSyANABEBAAGJAR8EGAEIAAkFAlhb4C8CGwwA
 CgkQLVgVyYwUtuM72Qf+J6JOQ/27pWf5Ulde9GS0BigA1kV9CNfIq396TgvQzeyixHMvgPdq
 Z36x89zZi0otjMZv6ypIdEg5co1Bvz0wFaKbCiNbTjpnA1VAbQVLSFjCZLQiu0vc+BZ1yKDV
 T5ASJ97G4XvQNO+XXGY55MrmhoNqMaeIa/3Jas54fPVd5olcnUAyDty29/VWXNllUq38iBCX
 /0tTF7oav1lzPGfeW2c6B700FFZMTR4YBVSGE8jPIzu2Fj0E8EkDmsgS+nibqSvWXfo1v231
 410h35CjbYDlYQO7Z1YD7asqbaOnF0As+rckyRMweQ9CxZn5+YBijtPJA3x5ldbCfQ9rWiTu XQ==
Message-ID: <129b52ff-6931-bd27-c2e0-6e17767d8fdd@amd.com>
Date: Thu, 14 Nov 2019 16:23:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
In-Reply-To: <20191114204413.457504-1-chris@chris-wilson.co.uk>
Content-Language: en-US
X-ClientProxiedBy: YTOPR0101CA0029.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::42) To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
MIME-Version: 1.0
X-Originating-IP: [165.204.55.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 79d27a2a-7775-41a4-01d1-08d76948ecb0
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0037:
X-MS-Exchange-PUrlCount: 1
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CY4PR1201MB0037CE8DAAC82AD4E5DF6C248C710@CY4PR1201MB0037.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:128;
X-Forefront-PRVS: 02213C82F8
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(376002)(39860400002)(366004)(346002)(189003)(199004)(5660300002)(2906002)(66476007)(305945005)(7736002)(66556008)(58126008)(99286004)(6306002)(6512007)(36756003)(476003)(6436002)(486006)(2616005)(14454004)(81156014)(6246003)(966005)(4001150100001)(446003)(11346002)(229853002)(6486002)(25786009)(6116002)(3846002)(66946007)(81166006)(4326008)(8676002)(316002)(6506007)(230700001)(386003)(186003)(50466002)(26005)(53546011)(66066001)(54906003)(76176011)(47776003)(65956001)(478600001)(65806001)(8936002)(31696002)(52116002)(2486003)(31686004)(23676004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0037;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nnTGgnXKTlZ4KyMIbxWmIILwtTpWBLQtdS0y9vLFZSZRv2uYbDTk++urOH/xcW/TT5h0zh9ObruRP0BMZ5QF5J6rMTUlLuHKp17dC6ZSs/27jzsIP4NbbxuqdzVPcP3Uu68S19uKr0UIN7L3EPkpytCcriNWTdJw9LM7cW1dLJU9zx/thHESb2FDEg3z14bhpCLhoIy4lVdcNEdbdVD7KaI4NT4VtGGZiVdwf6iKVBmDcnptheUIH4eDfQlqN9IZTpEmtqbScvuyoT5OotR1oaF5+1gVsSudb55zZfCK3Jm1MBDxilWraVLTK8ta9kphXksWBz4z20J7latd5EWQmH70Y0Jp9GdYBc/z2W//sd7FB96up0H6qTp/hcwA77snlgzk7ZDeoPR8Jp+Vf3sZ1CluVz2Gki0Cn/uHfLuzCreomDsma209WCbAkSRPMx7T6AhIkeGa1MMsUH8ruwqJoMe+Vzi4PMJn+fa2I+i44VA=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79d27a2a-7775-41a4-01d1-08d76948ecb0
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2019 21:23:42.7583 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Usibvzx9ql8OwBM+bpracNcKYUWqp0lNuSMUai4EcB/fFwqrE8I3eiQ7ckF1309DYl7GaBCNPO9N1YxEnYCnnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0037
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z04/1cNneL1JLooh3gmG/jXhdOimWs9oZuh0vnY1LSU=;
 b=WP0uMkKJXEgRFLG4dq44CALz0AdLDw3H+qEyoyq0a1jlMXZjlV9OrEwPKIbzSlIopBFmV5tUi2pN5AOicZo61boZlGPnEsl869ynlUll04TK3PnUsInPkcdQReYnL8FSjpZE2baQELCtbJsXLIJR+6c8o1TD9OKkcDf1fUa+9VA=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Harry.Wentland@amd.com; 
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
Cc: Alex Deucher <alexander.deucher@amd.com>, intel-gfx@lists.freedesktop.org,
 Jean Delvare <jdelvare@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0xMS0xNCAzOjQ0IHAubS4sIENocmlzIFdpbHNvbiB3cm90ZToKPiBBbiBvbGQgZGlz
cGxheSB3aXRoIG5vIGF1ZGlvIG1heSBub3QgaGF2ZSBhbiBFRElEIHdpdGggYSBDRUEgYmxvY2ss
IG9yCj4gaXQgbWF5IHNpbXBseSBiZSB0b28gb2xkIHRvIHN1cHBvcnQgYXVkaW8uIFRoaXMgaXMg
bm90IGEgZHJpdmVyIGVycm9yLAo+IHNvIGRvbid0IGZsYWcgaXQgYXMgc3VjaC4KPiAKPiBCdWd6
aWxsYTogaHR0cHM6Ly9idWdzLmZyZWVkZXNrdG9wLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTEyMTQw
Cj4gUmVmZXJlbmNlczogYWUyYTM0OTU5NzNlICgiZHJtL2FtZDogYmUgcXVpZXQgd2hlbiBubyBT
QUQgYmxvY2sgaXMgZm91bmQiKQo+IFNpZ25lZC1vZmYtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNA
Y2hyaXMtd2lsc29uLmNvLnVrPgoKUmV2aWV3ZWQtYnk6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53
ZW50bGFuZEBhbWQuY29tPgoKSGFycnkKCj4gQ2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50
bGFuZEBhbWQuY29tPgo+IENjOiBKZWFuIERlbHZhcmUgPGpkZWx2YXJlQHN1c2UuZGU+Cj4gQ2M6
IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KPiAtLS0KPiAgZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1faGVscGVycy5jIHwgMiAt
LQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1faGVscGVycy5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1faGVscGVycy5j
Cj4gaW5kZXggMTFlNTc4NGFhNjJhLi4wNDgwOGRiZWNhYjMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1faGVscGVycy5jCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1faGVscGVy
cy5jCj4gQEAgLTk3LDggKzk3LDYgQEAgZW51bSBkY19lZGlkX3N0YXR1cyBkbV9oZWxwZXJzX3Bh
cnNlX2VkaWRfY2FwcygKPiAgCQkJKHN0cnVjdCBlZGlkICopIGVkaWQtPnJhd19lZGlkKTsKPiAg
Cj4gIAlzYWRfY291bnQgPSBkcm1fZWRpZF90b19zYWQoKHN0cnVjdCBlZGlkICopIGVkaWQtPnJh
d19lZGlkLCAmc2Fkcyk7Cj4gLQlpZiAoc2FkX2NvdW50IDwgMCkKPiAtCQlEUk1fRVJST1IoIkNv
dWxkbid0IHJlYWQgU0FEczogJWRcbiIsIHNhZF9jb3VudCk7Cj4gIAlpZiAoc2FkX2NvdW50IDw9
IDApCj4gIAkJcmV0dXJuIHJlc3VsdDsKPiAgCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==

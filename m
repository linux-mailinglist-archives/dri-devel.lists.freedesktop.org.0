Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2CD10B3DF
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2019 17:51:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBA316E364;
	Wed, 27 Nov 2019 16:51:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820051.outbound.protection.outlook.com [40.107.82.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7C9A6E364;
 Wed, 27 Nov 2019 16:51:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ed1aJUOgjTcFm3IoWplpxFLpBoiivkusFimFf3JGcW34XsKJ9xdpny5Ee2+H9X1BijBwoq3vO1ph8HfHpHZ/bT8VRtYciTF5lB8rLnipXnyQ6TJe6N46CCZ48Nl8c40gRw2pUHceK9wi2fQXIt8VMK1Z8DYeUeS7wMTONHpZK+Ofo8ZCEcksBvPqm1Zz+O6JYcICYRCa124B6Ovu1vGJKtz+OtKtWu03ziP4BypOR5xvtnDzDCbSD/GrG204RKFX9GvI/fAhllEq2uWbK5uWeejt1UpWCeuo7Rrg5QvZUMAeonsuoYHIG1JLcR8vbXrPHjAdYIzCbKsyJ5G8n3w6Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9B6Koo2EvvDyaVBJ22vPJzuddfToTZcrKw+1ZBEKJ/g=;
 b=GP29bIC7NRM4bSFxdkuVYDHDRUt2aprxqA93GmERB8uQVT6iPXZ9PgxTpFGqlYwoe20HFG/qybFDC0JYG4dgGHXMXfXbTj9Bjjxo5K2aAp8Ojt1lYtD0TdSVFaDiWnHIcmL5W/S4AMsJgfLFUoc62eP+X89C4dRH+BUjl5lVZDkNeOSTvJMis0IqxSH1L7JYRHZqM5A7SgzM1IcmNkZmBjbkmmkG7KcqMZO8yz1nE4u6WY9vYsJUS1p996J8qduXfZx4JFYU0vp4cZ52Osbktq49LQ3v4PsdlfCNW9lMevCAQf1g5un0S1Qpnkm2G9yQc60SNCVa6O1U0Q/R1qArFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB2487.namprd12.prod.outlook.com (10.172.116.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.22; Wed, 27 Nov 2019 16:51:36 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::1cdc:d782:cce:6d2b]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::1cdc:d782:cce:6d2b%9]) with mapi id 15.20.2495.014; Wed, 27 Nov 2019
 16:51:35 +0000
Subject: Re: [PATCH][next] drm/amd/display: fix double assignment to msg_id
 field
To: Colin King <colin.king@canonical.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20191120172242.347072-1-colin.king@canonical.com>
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
Message-ID: <9056b19a-f63c-8fc0-d2f7-6df3a20c95a7@amd.com>
Date: Wed, 27 Nov 2019 11:51:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
In-Reply-To: <20191120172242.347072-1-colin.king@canonical.com>
Content-Language: en-US
X-ClientProxiedBy: YTXPR0101CA0032.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::45) To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
MIME-Version: 1.0
X-Originating-IP: [165.204.55.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a8f539bc-760d-4285-c318-08d7735a104e
X-MS-TrafficTypeDiagnostic: CY4PR1201MB2487:|CY4PR1201MB2487:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CY4PR1201MB2487D1652C32AEAB52D655638C440@CY4PR1201MB2487.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-Forefront-PRVS: 023495660C
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(136003)(396003)(376002)(346002)(199004)(189003)(31696002)(2616005)(66946007)(110136005)(58126008)(2906002)(66476007)(99286004)(6512007)(7736002)(316002)(14454004)(6436002)(230700001)(66556008)(36756003)(229853002)(25786009)(305945005)(6116002)(3846002)(6506007)(53546011)(386003)(66066001)(65806001)(8936002)(14444005)(6486002)(65956001)(8676002)(81156014)(81166006)(26005)(186003)(2486003)(76176011)(23676004)(52116002)(446003)(6246003)(31686004)(4326008)(11346002)(478600001)(5660300002)(4001150100001)(47776003)(50466002)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB2487;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HGsiyRldpPwRDoLnckZLKfoTQkjbYP0af0eFfDMSTBQ4BQ7KWbTcgquTGJNbzMlZYl3rkcdb1bhKdkdQlpCaXaQ0JMccHPS/YixYu07FPozKRodLZDCBlQ8r+YWSMcyl47ZVRUzt5Mk1Rq1Z+ZuOBZ0CBeqFWephCWz6/1eF+gnZFciKqUPQRi8OBL7zlqZ9JZXRD12Tl0Prhd83nHCP+mA8bTyKFdd8OnYDkYSLA6/l0n6f2K52Yf8aUBIBQ/9BofarG0mZUwMsFKIu4kOY6hc8M5tniZRH7q9Uhcv0uO/Ipri+Ay0t6PBcWU1FdMpYYQX1MFwpXbuIX4TD34whMcjrA6Vujip04hbAofCjBzLftF31fIFyz5KhEl1nWN0yCXiiVkpIuZggwtzWD+C05ha6UvuahqsegAjcfZPaY/yEb/Q1z8+z/oAFFbuRt2Du
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8f539bc-760d-4285-c318-08d7735a104e
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2019 16:51:35.8620 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QqMqQ0RWQmsk9pcDJpMlYSWnniaHBPkMtmtubqURCKODNeqTBlux+P/JcP2qLhkBppCZDnFP84k69KD/pG8nnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB2487
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9B6Koo2EvvDyaVBJ22vPJzuddfToTZcrKw+1ZBEKJ/g=;
 b=z7xY9YnjT/tz/K3MKnh4xt0nBpP5x+9UFbpoRT6weK8bGyUQMbfcWqTmm2GjXpTLxzfZhJQqZ9hfCtN+/H5aXTLLWblXnhdIkML+CZ3/55GOiI/gGIg0SSQxRw+DgX14V6AJtIZ9oEavxIHcXMIHnA1uOB4d+XHVj8pGXSuaYSw=
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0xMS0yMCAxMjoyMiBwLm0uLCBDb2xpbiBLaW5nIHdyb3RlOgo+IEZyb206IENvbGlu
IElhbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+Cj4gCj4gVGhlIG1zZ19pZCBmaWVs
ZCBpcyBiZWluZyBhc3NpZ25lZCB0d2ljZS4gRml4IHRoaXMgYnkgcmVwbGFjaW5nIHRoZSBzZWNv
bmQKPiBhc3NpZ25tZW50IHdpdGggYW4gYXNzaWdubWVudCB0byBtc2dfc2l6ZS4KPiAKPiBBZGRy
ZXNzZXMtQ292ZXJpdHk6ICgiVW51c2VkIHZhbHVlIikKPiBGaXhlczogMTFhMDA5NjVkMjYxICgi
ZHJtL2FtZC9kaXNwbGF5OiBBZGQgUFNQIGJsb2NrIHRvIHZlcmlmeSBIRENQMi4yIHN0ZXBzIikK
PiBTaWduZWQtb2ZmLWJ5OiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29t
PgoKUmV2aWV3ZWQtYnk6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZD4KCkhhcnJ5Cgo+
IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvbW9kdWxlcy9oZGNwL2hkY3BfcHNw
LmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvbW9kdWxlcy9o
ZGNwL2hkY3BfcHNwLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvbW9kdWxlcy9oZGNw
L2hkY3BfcHNwLmMKPiBpbmRleCAyZGQ1ZmVlYzhlNmMuLjY3OTFjNTg0NGU0MyAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvbW9kdWxlcy9oZGNwL2hkY3BfcHNwLmMK
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvbW9kdWxlcy9oZGNwL2hkY3BfcHNw
LmMKPiBAQCAtNDIsNyArNDIsNyBAQCBzdGF0aWMgdm9pZCBoZGNwMl9tZXNzYWdlX2luaXQoc3Ry
dWN0IG1vZF9oZGNwICpoZGNwLAo+ICAJaW4tPnByb2Nlc3MubXNnMl9kZXNjLm1zZ19pZCA9IFRB
X0hEQ1BfSERDUDJfTVNHX0lEX19OVUxMX01FU1NBR0U7Cj4gIAlpbi0+cHJvY2Vzcy5tc2cyX2Rl
c2MubXNnX3NpemUgPSAwOwo+ICAJaW4tPnByb2Nlc3MubXNnM19kZXNjLm1zZ19pZCA9IFRBX0hE
Q1BfSERDUDJfTVNHX0lEX19OVUxMX01FU1NBR0U7Cj4gLQlpbi0+cHJvY2Vzcy5tc2czX2Rlc2Mu
bXNnX2lkID0gMDsKPiArCWluLT5wcm9jZXNzLm1zZzNfZGVzYy5tc2dfc2l6ZSA9IDA7Cj4gIH0K
PiAgZW51bSBtb2RfaGRjcF9zdGF0dXMgbW9kX2hkY3BfcmVtb3ZlX2Rpc3BsYXlfdG9wb2xvZ3ko
c3RydWN0IG1vZF9oZGNwICpoZGNwKQo+ICB7Cj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==

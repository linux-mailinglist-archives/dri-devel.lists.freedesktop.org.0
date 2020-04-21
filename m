Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A651B2715
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 15:05:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED5F06E947;
	Tue, 21 Apr 2020 13:05:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2089.outbound.protection.outlook.com [40.107.94.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 232076E947;
 Tue, 21 Apr 2020 13:05:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=emlaL6yRkjQE0ZFz2rddeTg2UhdBnF9YNl5kp3tPGvTHwuQDVb4Kbsg12Q3znQEM9qvYv7qhDh/OBTAk++C6Xw7OopDUsRI38XpziLkJ4BM7DpdSZIHsJuYVnSHlFG+GLhv5IkJ9eYAUwtDibzgJ5Ugjf4yejNzJQPSPQIOhZO1pTLNgyykU3sR5l52NR8zW0DaFSZPTVDrHIROgy+2qTL8ysk7S7DIA1xQccvTn+zb91na2LZLEhlD28K2lxLFguDCM9Y1DnZBgTkVQ54oM4FwIwyWEULTvvJyHu41XTa1uvn1yCb61NrAZKWWXGrvBRxSzVPhYx/y8f5yLxGwe2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IHwImg6UcA0H14EWa04BcH/A19IRKG+d7fxqX2m8Fbo=;
 b=eCFzcJ3UPPA9ytkgBqjfXn14okKCfLqgiastUZpV8f6owmARfM1ynpQciGzOzZp/eoxODZTspd5zEnUVHWsjheHe6+EPVOtn5dxMzG3Wa1DQ7HMryTE44qzF/a4+AOxsnzvFc678+dtQ3VX8ahkUf9i31Y0/JmZS56hIoCHkMfb1UO9S8ZxExVuurBu0faWsK1K5rueRanFGze/Kz6v6fCiSioJPHSPrut76tT9jcngVVaPjehcEyPS/DXkdipM/MQ2Rb+xkRaf2oNdu+xh2L3s8ZkqZp+oSaHisr54hiT1Vhu+soQLrlpS6fCxucoaJLnh/4/UtAWiB+vZZupG8SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IHwImg6UcA0H14EWa04BcH/A19IRKG+d7fxqX2m8Fbo=;
 b=caWv+7KMyJhZD9NRe/GKHgvYJL1F6gWKB9TjhBqY+GdFe7ASavwXSrKdgJ6VReZIbxD8TRKAHq82NEWCJ8efQp3kplVLi3S8xSONIX56qXLVWZn5mEuJ3WXUZKQQUL4oIXkNsTyiwDaXnZqfjagFEi/GB3IQBmPu6D9oI+d04us=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM6PR12MB4401.namprd12.prod.outlook.com (2603:10b6:5:2a9::15)
 by DM6PR12MB2892.namprd12.prod.outlook.com (2603:10b6:5:182::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Tue, 21 Apr
 2020 13:05:28 +0000
Received: from DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766]) by DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766%3]) with mapi id 15.20.2921.030; Tue, 21 Apr 2020
 13:05:28 +0000
Subject: Re: [PATCH v4] amdgpu: remove unnecessary condition check
To: Bernard Zhao <bernard@vivo.com>, Felix Kuehling <Felix.Kuehling@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20200421122218.1849-1-bernard@vivo.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <5b4923f6-7f02-ce90-d250-4600616d2176@amd.com>
Date: Tue, 21 Apr 2020 15:05:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20200421122218.1849-1-bernard@vivo.com>
Content-Language: en-US
X-ClientProxiedBy: AM4PR0902CA0024.eurprd09.prod.outlook.com
 (2603:10a6:200:9b::34) To DM6PR12MB4401.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4PR0902CA0024.eurprd09.prod.outlook.com (2603:10a6:200:9b::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25 via Frontend
 Transport; Tue, 21 Apr 2020 13:05:23 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: eaff50fd-e452-4e71-7a66-08d7e5f4aa14
X-MS-TrafficTypeDiagnostic: DM6PR12MB2892:|DM6PR12MB2892:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB2892BB438993B57797476A6D83D50@DM6PR12MB2892.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:883;
X-Forefront-PRVS: 038002787A
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4401.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(396003)(346002)(366004)(376002)(136003)(39860400002)(8676002)(36756003)(31686004)(316002)(8936002)(4326008)(110136005)(66556008)(66476007)(16526019)(186003)(66574012)(66946007)(2616005)(5660300002)(31696002)(2906002)(86362001)(81156014)(6666004)(45080400002)(52116002)(478600001)(6486002);
 DIR:OUT; SFP:1101; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7R8x8xsdLfzqrMNhFpywcjQyU03t02G3k4JzC25lArEMNDjsXkMZUGcbpTDKcpVQ8b/NYHKspHQyBWbtHNirc/hEaiC96sgOD033VzK5SvCMsliYRFtsRXeI5q/FJ5prkOvupuSok7Rf332tNe6BuDYOe+/U22eOTXcrCp3ncRqZfg3thWoN+gIA+2VVV8XepwsEoxnR8GVVlObdgMvOmFpWizmakKLWgbDZyexZGrPO9bMCGG57IwC8j1LTHPKUpoWfmmbdsc8+sjMLzm/U4lqIZXsLVggJ2jY7JArp8HRetSg0f49zCyBswuVcXZ+nmvPELtLeqlwI8rUdDbjat2/L/Jzq6Qn9dLK8kSZMmddXnQfEALSYCpqZex65UbgKVLbREg/VAPyPKv+nsXuP9j74Ek3ATFWRPBKRGWw2piSfJ51gg8ENTAjYxWnfj38X++04CJl3M4uqjhAFaUCm+OSIZr5jZ7aEcWswBGV4af7b+r8/fKnsI1poxrH18e33DX+hK7RkP3ecPPF4zAWx5A==
X-MS-Exchange-AntiSpam-MessageData: CmiHnCrUCo/0BOCMrE9G/tH5uIiFPwB6nJAnbhnj76otSLqjv1w2hz8HEwHYrSoXc2s9//C7LFCwc1C9h/ObWM4K4Wc2mjRHzdvi/J4VKZmOp/G3CQel1njR7RiHigWYNFnxjoGRV61jFruskzY7Fetx/grGA7sCR75Alk+wDjds+RFdwEGSfMBaECFiKy4UB9fHaN64B7GXTAHxQ2DpedxCdYWcF6prt5/C8nK/Jdw0Uy4SRrgoGj/2Qunvx6n8kpwGL8mShlBS9+qKPDzRfrEnAPVzukwJqpv8tmgGFsRNtTjXsR9j0Ati6BE6R7n0TpmHoXutLeVY89XiOGiP9V4YqkUgFrIlFq/69m0Jo39cYUFTb0BEO29sUH+2LvXewHuA3v7nrM5B9pyQ8G4VQ+5ZigZGsMIkpWrgc7xymXqvEXjNbPJgp+ShFlg8qn2ndLJdbWBT7A2Khza0o3K5wfOvsrm1FXEDipPkCaSe2eQw+3+FnskAdFpXNrs+C4ASirEA6oOqhPDbEtcDtPtTYhqybjDiNX01j7lYlt1G0KUDN/kjCwjTawtpKbQA1IMLTC/H83FncjJShYj4kQXYxxVnauXoJU4o/5y12WJLQrHmD2Rp3AOmMafiQTW6mxdgWRfaI7V2NYXzlLtO21Oh1uZwy1Whqo+OS2ZIjHijBqfQBhZyfgBnhqO/f9ygFMXdAauQRX2C8QovK9e1iQKMm6hVTieHb/ssAhSbx66qSOyO1qnBfgX2TrIbe50cMmFtvy0KWwg/YfoHuQeQtFASWOe+bFaKyqf9WiaFSJq4Vf28DxHflPa8/vI6hu7LmiLLoAmugWm3nS61VSpzUSiQX7TonYDPbNUfsNKzlMV3gqc=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eaff50fd-e452-4e71-7a66-08d7e5f4aa14
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2020 13:05:28.8367 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xDoKcfZu2YOJSB7AGJ8734GtqpkOhQhSBdn7s7o52w8HinvuJJ00Agpdmj2ZvWFo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2892
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
Cc: opensource.kernel@vivo.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjEuMDQuMjAgdW0gMTQ6MjIgc2NocmllYiBCZXJuYXJkIFpoYW86Cj4gVGhlcmUgaXMgbm8g
bmVlZCB0byBpZiBjaGVjayBhZ2FpbiwgbWF5YmUgd2UgY291bGQgbWVyZ2UKPiBpbnRvIHRoZSBh
Ym92ZSBlbHNlIGJyYW5jaC4KPgo+IFNpZ25lZC1vZmYtYnk6IEJlcm5hcmQgWmhhbyA8YmVybmFy
ZEB2aXZvLmNvbT4KCllvdSBjb3VsZCBpbXByb3ZlIHRoZSBzdWJqZWN0IGxpbmUgYW5kIGNvbW1p
dCBtZXNzYWdlIGEgYml0LCBlLmcuIApzb21ldGhpbmcgbGlrZToKCltQQVRDSF0gZHJtL2FtZGdw
dTogY2xlYW51cCBjb2Rpbmcgc3R5bGUgaW4gYW1ka2ZkIGEgYml0CgpNYWtlIHRoZSBjb2RlIGEg
Yml0IG1vcmUgcmVhZGFibGUgYnkgdXNpbmcgYSBjb21tb24gZXJyb3IgaGFuZGxpbmcgcGF0dGVy
bi4KCgpXaXRoIHRoYXQgZG9uZSB0aGUgcGF0Y2ggaXMgUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBL
w7ZuaWcgCjxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+LgoKPgo+IENoYW5nZXMgc2luY2UgVjE6
Cj4gKmNvbW1pdCBtZXNzYWdlIGltcHJvdmUKPiAqY29kZSBzdHlsZSByZWZhY3RvcmluZwo+Cj4g
Q2hhbmdlcyBzaW5jZSBWMjoKPiAqY29kZSBzdHlsZSBhZGp1c3QKPgo+IENoYW5nZXMgc2luY2Ug
VjM6Cj4gKmZpbmQgdGhlIGJlc3Qgd2F5IHRvIG1lcmdlIHVubmVjZXNzYXJ5IGlmL2Vsc2UgY2hl
Y2sgYnJhbmNoCj4KPiBMaW5rIGZvciBWMToKPiAqaHR0cHM6Ly9uYW0xMS5zYWZlbGlua3MucHJv
dGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGbG9yZS5rZXJuZWwub3JnJTJG
cGF0Y2h3b3JrJTJGcGF0Y2glMkYxMjI2NTg3JTJGJmFtcDtkYXRhPTAyJTdDMDElN0NjaHJpc3Rp
YW4ua29lbmlnJTQwYW1kLmNvbSU3QzZiNTIxYjY5N2VhODRjZmQzMjQzMDhkN2U1ZWVhYjdmJTdD
M2RkODk2MWZlNDg4NGU2MDhlMTFhODJkOTk0ZTE4M2QlN0MwJTdDMCU3QzYzNzIzMDY4NTU2NDMz
MDA5OCZhbXA7c2RhdGE9bTJsaGZnY0lOdUIlMkJUMyUyQmhoUWp0Uk9JM1pwMzhRREVpbEY5UlRj
ZWczSFklM0QmYW1wO3Jlc2VydmVkPTAKPiAtLS0KPiAgIC4uLi9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2FtZGtmZF9ncHV2bS5jICB8IDIwICsrKysrKysrKy0tLS0tLS0tLS0KPiAgIDEgZmls
ZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYwo+IGluZGV4IDlk
ZmY3OTJjOTI5MC4uYWNiNjEyYzUzYjljIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYwo+IEBAIC02NjAsMTUgKzY2MCwxNSBAQCBz
dGF0aWMgaW50IHJlc2VydmVfYm9fYW5kX3ZtKHN0cnVjdCBrZ2RfbWVtICptZW0sCj4gICAKPiAg
IAlyZXQgPSB0dG1fZXVfcmVzZXJ2ZV9idWZmZXJzKCZjdHgtPnRpY2tldCwgJmN0eC0+bGlzdCwK
PiAgIAkJCQkgICAgIGZhbHNlLCAmY3R4LT5kdXBsaWNhdGVzKTsKPiAtCWlmICghcmV0KQo+IC0J
CWN0eC0+cmVzZXJ2ZWQgPSB0cnVlOwo+IC0JZWxzZSB7Cj4gLQkJcHJfZXJyKCJGYWlsZWQgdG8g
cmVzZXJ2ZSBidWZmZXJzIGluIHR0bVxuIik7Cj4gKwlpZiAocmV0KSB7Cj4gKwkJcHJfZXJyKCJG
YWlsZWQgdG8gcmVzZXJ2ZSBidWZmZXJzIGluIHR0bS5cbiIpOwo+ICAgCQlrZnJlZShjdHgtPnZt
X3BkKTsKPiAgIAkJY3R4LT52bV9wZCA9IE5VTEw7Cj4gKwkJcmV0dXJuIHJldDsKPiAgIAl9Cj4g
ICAKPiAtCXJldHVybiByZXQ7Cj4gKwljdHgtPnJlc2VydmVkID0gdHJ1ZTsKPiArCXJldHVybiAw
Owo+ICAgfQo+ICAgCj4gICAvKioKPiBAQCAtNzMzLDE3ICs3MzMsMTUgQEAgc3RhdGljIGludCBy
ZXNlcnZlX2JvX2FuZF9jb25kX3ZtcyhzdHJ1Y3Qga2dkX21lbSAqbWVtLAo+ICAgCj4gICAJcmV0
ID0gdHRtX2V1X3Jlc2VydmVfYnVmZmVycygmY3R4LT50aWNrZXQsICZjdHgtPmxpc3QsCj4gICAJ
CQkJICAgICBmYWxzZSwgJmN0eC0+ZHVwbGljYXRlcyk7Cj4gLQlpZiAoIXJldCkKPiAtCQljdHgt
PnJlc2VydmVkID0gdHJ1ZTsKPiAtCWVsc2UKPiAtCQlwcl9lcnIoIkZhaWxlZCB0byByZXNlcnZl
IGJ1ZmZlcnMgaW4gdHRtLlxuIik7Cj4gLQo+ICAgCWlmIChyZXQpIHsKPiArCQlwcl9lcnIoIkZh
aWxlZCB0byByZXNlcnZlIGJ1ZmZlcnMgaW4gdHRtLlxuIik7Cj4gICAJCWtmcmVlKGN0eC0+dm1f
cGQpOwo+ICAgCQljdHgtPnZtX3BkID0gTlVMTDsKPiArCQlyZXR1cm4gcmV0Owo+ICAgCX0KPiAg
IAo+IC0JcmV0dXJuIHJldDsKPiArCWN0eC0+cmVzZXJ2ZWQgPSB0cnVlOwo+ICsJcmV0dXJuIDA7
Cj4gICB9Cj4gICAKPiAgIC8qKgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==

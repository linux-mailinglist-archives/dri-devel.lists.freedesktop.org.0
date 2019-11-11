Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E737F7A27
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2019 18:46:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 320736E9A2;
	Mon, 11 Nov 2019 17:46:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720047.outbound.protection.outlook.com [40.107.72.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97B186E9A1;
 Mon, 11 Nov 2019 17:46:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jub1xkEj7F4y+itB8MgWxicwupoQuVVQZahDkgvDZaWmB/piVvZgePSHmsWujriIQ7Qxv3lngVcyt8vWZ0w2RfEh9zGb/Ke21nU7qHJ/WdmaCr3XoNvPb1Ngq9C50X9vvgRN8lhqfqYeFLQFdzI8QqnNFl+EM5XXAqbiCB5ibOIHNne15DBKo9xMSJGxHOx5dsj8r98Cs0XvaGt7NEXHvgzSedZ+gAXf5PMQGwFyxCd+O7951dcWP3NK7zK7ruBlzpfI5+iQDd8vLwiVzZaBHxYNAJs0DagcP3hGE/1QislMT86fhMjhNbrdRfmr92VYPpcDEiGLr6IXsuODeY/FAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kIbKAVm2JC6RQW87vnC+3FtPjG3bn2AnpOwD1nBr24w=;
 b=HNhVf4X7ZNHufvSUfNWkj8moUkL2aTcZ5+44evAwSBMcDVJo/iB4BJGXfakNZA634ZLvNkyeIE6j0MCqTs10JQUYJ/CqhyILxTJ/XuKZCKCZi43qjOsa2bdWNJeJG+el+voEkfySk2Tg68PHFM0oCsUljP0UA3ADdeT/IdOYuibffmr0zy0O/7OxLZYVOVyBe3T+qiEzK6WTafzcJvbJxcHcwZq//DAstm1OPf8MaX85BTimQ+SiL8Bw6jeMq23Zbfe7pVDzjslQk6yDmQi/btZVh77naio0GNLl2k46hVPr17MFlnoPkvWHPAxyo8kaRccdyGov6aPFEdQz49Dxog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BYAPR12MB3013.namprd12.prod.outlook.com (20.178.55.219) by
 BYAPR12MB2917.namprd12.prod.outlook.com (20.179.91.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.25; Mon, 11 Nov 2019 17:46:35 +0000
Received: from BYAPR12MB3013.namprd12.prod.outlook.com
 ([fe80::1174:3feb:de01:4fb9]) by BYAPR12MB3013.namprd12.prod.outlook.com
 ([fe80::1174:3feb:de01:4fb9%6]) with mapi id 15.20.2430.027; Mon, 11 Nov 2019
 17:46:35 +0000
Subject: Re: [PATCH] drm/amd/display: Fix unsigned variable compared to less
 than zero
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Mikita Lipski <mikita.lipski@amd.com>, Lyude Paul <lyude@redhat.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
References: <20191111172543.GA31748@embeddedor>
From: Mikita Lipski <mlipski@amd.com>
Organization: AMD
Message-ID: <b5b41653-3536-b0f0-2f49-2c010370ec99@amd.com>
Date: Mon, 11 Nov 2019 12:46:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
In-Reply-To: <20191111172543.GA31748@embeddedor>
Content-Language: en-US
X-ClientProxiedBy: YTBPR01CA0026.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::39) To BYAPR12MB3013.namprd12.prod.outlook.com
 (2603:10b6:a03:a9::27)
MIME-Version: 1.0
X-Originating-IP: [165.204.55.250]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6b99bc0b-a7d5-403c-f522-08d766cf1898
X-MS-TrafficTypeDiagnostic: BYAPR12MB2917:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR12MB2917298B722196CB447A2B79E4740@BYAPR12MB2917.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 0218A015FA
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(366004)(346002)(136003)(39860400002)(189003)(199004)(53546011)(6506007)(6116002)(6636002)(2906002)(47776003)(65806001)(3846002)(65956001)(36756003)(31696002)(478600001)(66066001)(50466002)(6666004)(36916002)(23676004)(2486003)(76176011)(4326008)(2616005)(476003)(386003)(26005)(446003)(52116002)(14444005)(6246003)(11346002)(486006)(14454004)(186003)(25786009)(81156014)(66946007)(7736002)(66476007)(6512007)(66556008)(305945005)(6486002)(8936002)(81166006)(8676002)(316002)(229853002)(31686004)(5660300002)(58126008)(110136005)(6436002)(230700001)(99286004)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2917;
 H:BYAPR12MB3013.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OTn40hA3u6vgekTxohXck59iaHwOOiLy6gjnEgMLkrKg0j53Vzy6etmerbexw95ClPg08k8FhWBqpzdfhOkldYcFyn2RkaMBonMtC+m029s3ioOsP7SHFrfViOVkLckxOLL/Iho1W+VDs8G2zw22cgSGi43I2eBFZjsWaZ6zx0hciQ+VGFizYydgPQl65Z6q/r27IK1Fix0IVnk3FtsHU3P+aapPO1BdI1ODtFouPw064/uSOOOKpFUq7nZIsgBEDgvXqDaAL6pvk+tCSFbTt2e2iQrXoOv9FkVILEQJEdn5zzEaoBmprCMsgkTT0W+OGT1afVy53baqhLyBoRkCK+le+ExgEeYnjMcz4B9PrglMoaOG9FTeyKL88FttE8VtYaAgYKrdLbYFrleBtR777WXWJH0kNbhxF8H4JjAwJ7lZzCESZHkrm/zWIx33/Heq
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b99bc0b-a7d5-403c-f522-08d766cf1898
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2019 17:46:35.4434 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sfSJwWWlOTV5LZudltTlSAqHKpSGjLNh/u0fOOoj9q+YxLq9W+t1Q4muJWTfkRGY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2917
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kIbKAVm2JC6RQW87vnC+3FtPjG3bn2AnpOwD1nBr24w=;
 b=h68qNZ6Y/mlWeJ190PRdcvVcMbW8Bm/prgdVUba2mxF7q/yN8Fhg9N/wqUJN1bigR0s5bG7gPFzlntjAyi0kXdhYJZCYrr9S60yFjNTOUgqCF2qVAZ2/+cBJGpVah8xROBieEvCPO8wjK2m8cpTcKZHjG5gLE6AeniB3JigGxrk=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mikita.Lipski@amd.com; 
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ClRoYW5rcyBmb3IgY2F0Y2hpbmcgaXQhCgpSZXZpZXdlZC1ieTogTWlraXRhIExpcHNraSA8bWlr
aXRhLmxpcHNraUBhbWQuY29tPgoKCk9uIDExLjExLjIwMTkgMTI6MjUsIEd1c3Rhdm8gQS4gUi4g
U2lsdmEgd3JvdGU6Cj4gQ3VycmVubHksIHRoZSBlcnJvciBjaGVjayBiZWxvdyBvbiB2YXJpYWJs
ZSp2Y3BpX3Nsb3RzKiAgaXMgYWx3YXlzCj4gZmFsc2UgYmVjYXVzZSBpdCBpcyBhIHVpbnQ2NF90
IHR5cGUgdmFyaWFibGUsIGhlbmNlLCB0aGUgdmFsdWVzCj4gdGhpcyB2YXJpYWJsZSBjYW4gaG9s
ZCBhcmUgbmV2ZXIgbGVzcyB0aGFuIHplcm86Cj4gCj4gZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYzoKPiA0ODcwICAgICAgICAgaWYgKGRtX25ld19jb25u
ZWN0b3Jfc3RhdGUtPnZjcGlfc2xvdHMgPCAwKSB7Cj4gNDg3MSAgICAgICAgICAgICAgICAgRFJN
X0RFQlVHX0FUT01JQygiZmFpbGVkIGZpbmRpbmcgdmNwaSBzbG90czogJWRcbiIsIChpbnQpZG1f
bmV3X2Nvbm5lY3Rvcl9zdGF0ICAgICBlLT52Y3BpX3Nsb3RzKTsKPiA0ODcyICAgICAgICAgICAg
ICAgICByZXR1cm4gZG1fbmV3X2Nvbm5lY3Rvcl9zdGF0ZS0+dmNwaV9zbG90czsKPiA0ODczICAg
ICAgICAgfQo+IAo+IEZpeCB0aGlzIGJ5IG1ha2luZyp2Y3BpX3Nsb3RzKiAgb2YgaW50IHR5cGUK
PiAKPiBBZGRyZXNzZXMtQ292ZXJpdHk6IDE0ODc4MzggKCJVbnNpZ25lZCBjb21wYXJlZCBhZ2Fp
bnN0IDAiKQo+IEZpeGVzOiBiNGM1NzhmMDgzNzggKCJkcm0vYW1kL2Rpc3BsYXk6IEFkZCBNU1Qg
YXRvbWljIHJvdXRpbmVzIikKPiBTaWduZWQtb2ZmLWJ5OiBHdXN0YXZvIEEuIFIuIFNpbHZhPGd1
c3Rhdm9AZW1iZWRkZWRvci5jb20+Cj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5oIHwgMiArLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5oCj4gaW5kZXggNmRiMDdlOWUzM2FiLi5hOGZj
OTBhOTI3ZDYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdw
dV9kbS9hbWRncHVfZG0uaAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRn
cHVfZG0vYW1kZ3B1X2RtLmgKPiBAQCAtNDAzLDcgKzQwMyw3IEBAIHN0cnVjdCBkbV9jb25uZWN0
b3Jfc3RhdGUgewo+ICAgCWJvb2wgdW5kZXJzY2FuX2VuYWJsZTsKPiAgIAlib29sIGZyZWVzeW5j
X2NhcGFibGU7Cj4gICAJdWludDhfdCBhYm1fbGV2ZWw7Cj4gLQl1aW50NjRfdCB2Y3BpX3Nsb3Rz
Owo+ICsJaW50IHZjcGlfc2xvdHM7Cj4gICAJdWludDY0X3QgcGJuOwo+ICAgfTsKPiAgIAo+IC0t
IDIuMjMuMAoKLS0gClRoYW5rcywKTWlraXRhIExpcHNraQpTb2Z0d2FyZSBFbmdpbmVlciwgQU1E
Cm1pa2l0YS5saXBza2lAYW1kLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=

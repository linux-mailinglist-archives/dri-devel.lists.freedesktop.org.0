Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F38577BA66
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 09:14:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E57476E6A3;
	Wed, 31 Jul 2019 07:14:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0628.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0d::628])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F9246E4C7;
 Tue, 30 Jul 2019 12:33:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NriWVhBq1EG/g+8owiD7Blh8mf7cOyWhr6jR2/J76XU5sOSJOO9TrdAGlqTkI52AZB1/HyLG9RIF+98+G2LPE2ihiHcrio9ltSSRNveWGb5vFq0WqXKXy1YwQeTpgFolhyb108LqhlX2+eEYIdtDozcQ9pM9QRo8SgmFD7k46lfbj7ZVuXMmjd0bF3COl6Quydn2ZAjoQN7bu6eGZ0ex5w0q+XknqR8H6OGvzVxgH7ADc1ZVuTyCCaLXKFEMF7dPQ3PVuEy8AeLwPhJoKcEOCms4RLnuUL4l67za1smof3oCsA7u4ChmpeGb215NzQInrk1GEFlIBgkjxVc5rVIL2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dIh+Bg+Y7JR5zJCYaI23CwB6oXfe2ZfSo9J/94dn2C0=;
 b=ImLL72JQq6nLdR4wnlre96u8+YI8B++NaXIW+HIlB9bUElqtvs3F0hGsZ9dXt1LPqHHO+I2xDmz1nvE1tm4EmblSd55F+I6Gn32FUq75u9Xu+lxL54pbs61JoGXsSrou+XJmYrpSrmioFSoA8WIE7WtRY3iCBrN2EEJpDV81AIa4GW4JuAXvVoaT0ZnqB+3aS9CwQaPpzl5kBu+rNMMBQuN8MM0TmjQsJRbdNOdUP1UrnSVq6IQSxvwQn/mnXOaGETHMgASjgsJn+h9x0qUQ7/wOEH+4nSUhDDCyVj2ROin+K72UyaMsxP177N0Iq0wm1UU2uYUUupCuI1//iSkbgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=mellanox.com;dmarc=pass action=none
 header.from=mellanox.com;dkim=pass header.d=mellanox.com;arc=none
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB5568.eurprd05.prod.outlook.com (20.177.202.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.13; Tue, 30 Jul 2019 12:33:02 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::5c6f:6120:45cd:2880]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::5c6f:6120:45cd:2880%4]) with mapi id 15.20.2115.005; Tue, 30 Jul 2019
 12:33:02 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 01/13] amdgpu: remove -EAGAIN handling for hmm_range_fault
Thread-Topic: [PATCH 01/13] amdgpu: remove -EAGAIN handling for hmm_range_fault
Thread-Index: AQHVRpr1y4W4rzsfOUifvYDU3qMetqbjGJ+A
Date: Tue, 30 Jul 2019 12:33:02 +0000
Message-ID: <20190730123257.GB24038@mellanox.com>
References: <20190730055203.28467-1-hch@lst.de>
 <20190730055203.28467-2-hch@lst.de>
In-Reply-To: <20190730055203.28467-2-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YQXPR0101CA0037.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:14::14) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [156.34.55.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c63a4ff3-9a95-4980-1049-08d714ea101d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR05MB5568; 
x-ms-traffictypediagnostic: VI1PR05MB5568:
x-microsoft-antispam-prvs: <VI1PR05MB5568EB5E95ABE2AB3D3859E7CFDC0@VI1PR05MB5568.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2733;
x-forefront-prvs: 0114FF88F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(136003)(346002)(376002)(396003)(199004)(189003)(446003)(11346002)(53936002)(486006)(5660300002)(2616005)(476003)(256004)(4744005)(6246003)(26005)(6436002)(6512007)(66946007)(6486002)(102836004)(305945005)(66476007)(68736007)(66446008)(64756008)(66556008)(33656002)(8936002)(186003)(1076003)(66066001)(71200400001)(7736002)(81156014)(81166006)(8676002)(229853002)(7416002)(99286004)(2906002)(6916009)(6116002)(54906003)(316002)(36756003)(3846002)(86362001)(478600001)(76176011)(6506007)(386003)(52116002)(14454004)(4326008)(25786009)(71190400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB5568;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: zmjHbdaV7n0oJaJsMCF4EFNWeB4AiV0cBG47yTB/uXEz0jC2vezO5Gmfz6/l8WPT4rmGJKyqMgmt0ZoQN8cysSTG4ldcq1gfGWib5l5fXUGScTd1yovF+XAYfQVU3wxD+D3JEBpzJBIXODRU1g86gPdjagbzV43xWQ/J43KxioZlzhuyGyiTVMh+AKUklu0DLv/DPBiTHW22Rif0yz4XpAX3doeicjvUkp9ex5TIIJ0dyRD7fCXTF7uvP72wQhNKg2JsUejBIKiFk4C2CTRt6UsWyckOZxJS81s/ALB8+Zm00MxHgsvvTWHZIgxOLo0YdXjwXeUfAsfPYSe4eeTTtMMsSJ3i6ijZQZSbbKS6wz96bUUizSNR2MIUfPHFpBszzGGHk/WgafoMQI4ayHXWkbH32S0JeX2NsVVVSnvNdY0=
Content-ID: <76FBA5B0F135514A885052AAEE17CDB6@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c63a4ff3-9a95-4980-1049-08d714ea101d
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2019 12:33:02.3076 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgg@mellanox.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB5568
X-Mailman-Approved-At: Wed, 31 Jul 2019 07:13:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dIh+Bg+Y7JR5zJCYaI23CwB6oXfe2ZfSo9J/94dn2C0=;
 b=L+PD0lzOlrIv+mTDx/nh9p6/H5db2n3sbrfekUrPBizneQi/ck1kAaq8qKUn6stJjJEkBmx6nOMdHq1j1ayzMucOsxY+LX/FP2qpRYKtelys4vS4Sz8lldxLibXLLby6sfLeCy7jt+WpGDc1Y579+1VUwY406YTCy/0zeE4PKdE=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
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
Cc: Ralph Campbell <rcampbell@nvidia.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 =?iso-8859-1?Q?J=E9r=F4me_Glisse?= <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMzAsIDIwMTkgYXQgMDg6NTE6NTFBTSArMDMwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gaG1tX3JhbmdlX2ZhdWx0IGNhbiBvbmx5IHJldHVybiAtRUFHQUlOIGlmIGNh
bGxlZCB3aXRoIHRoZSBibG9jawo+IGFyZ3VtZW50IHNldCB0byBmYWxzZSwgc28gcmVtb3ZlIHRo
ZSBzcGVjaWFsIGhhbmRsaW5nIGZvciBpdC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGgg
SGVsbHdpZyA8aGNoQGxzdC5kZT4KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3R0bS5jIHwgMjMgKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDMg
aW5zZXJ0aW9ucygrKSwgMjAgZGVsZXRpb25zKC0pCgpSZXZpZXdlZC1ieTogSmFzb24gR3VudGhv
cnBlIDxqZ2dAbWVsbGFub3guY29tPgoKSmFzb24KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A4789090D
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 20:21:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E573112529;
	Thu, 28 Mar 2024 19:21:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=marvell.com header.i=@marvell.com header.b="m/Mffowt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1467 seconds by postgrey-1.36 at gabe;
 Thu, 28 Mar 2024 12:31:56 UTC
Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com
 [67.231.148.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C605112414
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 12:31:56 +0000 (UTC)
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
 by mx0a-0016f401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42SAiZl9023511; Thu, 28 Mar 2024 05:07:00 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
 by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 3x572c8d01-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Mar 2024 05:06:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KmSeZgqQV59cO3NRkYvTT7LhFpSlIxL6aAY+kmvL7xLJJ1LaviPSjkxdLUKI1B5t2Tlh/nvhoCVCXxUxQ+1NYrJ3ZSUmj0k8oVDoS/R6h67tw9ips3tk2N3V6s+pO7LlEN3esAN8Exnots/OdJut+qo/RBMy2blLpSjdTYxqqN5Jips+ppgsfa+17vxbK6MnVS799yD9AmcDSXVT2Hll11WD673fdlZPmhPKUpn/7BlBWt+ax9Xqz+/WaiIe06z8IZGz3K/XKaNDdo2+S+c861DhfvpxD9picJ756L1YPdWNdFoO3quWEewsKAzIe8LIm8vQCUJjzkMt3UNcDNamvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IccNqoaIQ9UikQOwVG6olhlPStUoHD5rzJnziPxFRw0=;
 b=WJ1x/g2eBO3ToQFFH7goIlKI4lvbAJmYkwg7DaJbjZq03zskNvCzApxBKkxRi7MDV8WITjen2HGcVFf6/eT0lit7EqLzdxstu6dWrI9gM+ewyKWY2QYhjOO7+XUK6aeUraakRH4L3Rls9mny6CabY4mYIk9mrt2sxQWecBwEqcueQ3oKdrdS2zRFM3AcrtiRU+euwcv0/i7AFzp8KwytbEJofO6+HyjdjMrG6Km+iZrGMoStozIwpEsOhCJZAL4xXymOfRNXnxMQ9tsubSrjY9bmIvA/FZT34kjaNZbbTENehrH3hVEz+beNj6Uay9P2xc0WNeijn5mB8p4K5PfPDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IccNqoaIQ9UikQOwVG6olhlPStUoHD5rzJnziPxFRw0=;
 b=m/MffowtWcHdfkQhwz2DTWkGHK3kGm6pCPDbTBUqkQ3LO3SjeMFfI73q9uL5uiv4pfrzk1ZIVBXwZr0DI+wxykFY+6RReHUyC9COXIlQnQ6shzoiUH+cN3k9i36znJ0wv1+c6O7xtH/VbdJltxkjkMIBpVeO1QHJO1E8YYZ2hKs=
Received: from SJ2PR18MB5635.namprd18.prod.outlook.com (2603:10b6:a03:55a::21)
 by MN6PR18MB5544.namprd18.prod.outlook.com (2603:10b6:208:476::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Thu, 28 Mar
 2024 12:06:56 +0000
Received: from SJ2PR18MB5635.namprd18.prod.outlook.com
 ([fe80::317:8d8c:2585:2f58]) by SJ2PR18MB5635.namprd18.prod.outlook.com
 ([fe80::317:8d8c:2585:2f58%3]) with mapi id 15.20.7409.031; Thu, 28 Mar 2024
 12:06:56 +0000
From: Naveen Mamindlapalli <naveenm@marvell.com>
To: Julien Panis <jpanis@baylibre.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Russell King
 <linux@armlinux.org.uk>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>, John
 Fastabend <john.fastabend@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>,
 Simon Horman <horms@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Ratheesh Kannoth <rkannoth@marvell.com>
CC: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>
Subject: RE: [PATCH net-next v5 1/3] net: ethernet: ti: Add accessors for
 struct k3_cppi_desc_pool members
Thread-Topic: [PATCH net-next v5 1/3] net: ethernet: ti: Add accessors for
 struct k3_cppi_desc_pool members
Thread-Index: AQHagQht6cb9nrRQTEi0szLWuQOTlQ==
Date: Thu, 28 Mar 2024 12:06:56 +0000
Message-ID: <SJ2PR18MB5635B9F20BB6CE1CC945F3B2A23B2@SJ2PR18MB5635.namprd18.prod.outlook.com>
References: <20240223-am65-cpsw-xdp-basic-v5-0-bc1739170bc6@baylibre.com>
 <20240223-am65-cpsw-xdp-basic-v5-1-bc1739170bc6@baylibre.com>
In-Reply-To: <20240223-am65-cpsw-xdp-basic-v5-1-bc1739170bc6@baylibre.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR18MB5635:EE_|MN6PR18MB5544:EE_
x-ms-office365-filtering-correlation-id: 9069783a-6efc-4d81-e339-08dc4f1f903a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: a0Y5O3AAf1dQZW6rPoUflIoaAshu7SETDh1fH1NQ01fGc179gWewTxyBx7VkJCn6e2iAKD4gqs9Sd4yMDIxUfR77blXS+9Iq97JafOq0p9PNAIv5lhcN8VHINT2PpxAxz/cXUgtbuwXYTnPHFeAjm69l+kIBJGB4iuJzK1hnXojQszHJjM64uwuqY0fDyrEOy+4E5LEDvOH3iTha7nO4n77/vav9ZVYbWeNnlHpSxvbZ5Svf373E8ju1YQIr7sRZWrAKnbh6ZKooWux5myXtPxmJB80V0SuDPAxNUSbNIjM0Cb1RKiFOrApqaytNhl+9TrmoQjjrUxKjOxPScBc92KUmz5BFQeGjh8K2xE8we3IWolTj9nFXgrzqu4V/CqMEmyfVR4xyydLmme5bYCWm+fOc2eceUZWvnhWyujSMgB8bLPEVtPf5QyTibIlxDvEfyhELOeRdX60/03T6vt6IhgZZaaNVp8OXkYmZRT8ex9PDv14i5xwO0kR/h5Bt4tNxg2sbSTa3Om348F766GGUDWgUXxqHqBMjOHbD04Uq01raxyOsmceWpwg1TNfQNh7MJZA538MiYpwaPUs5Sqj+sWTI54Ofw/qIw8G3KWzU4aFKFXecShfkYD72bG+Kv0yyC8s5LlPOI04O9lm8HcpLQPhKZwxwMFR2WG2ndDBv4OCoW/uttxFHAwdSlQPvdPBTqb1INvj27v7Zfjqo0xvRbshBVmoIWVzYdM81TGnP/HA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR18MB5635.namprd18.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(7416005)(366007)(921011)(38070700009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MUR0WEtTWVdKZXYybytNUS90T1FKNVQvajdkMlgxaDM0YXN6ellTaTJ6WnNU?=
 =?utf-8?B?eHE0eXorQkE1bmhsZURwT253OFI1TTg2RWlkcXNWYXNJL0xRQU5SWEVJcThX?=
 =?utf-8?B?QnZLVUZlbUVGYStIRlJYUU8zT2VxT3NYSkNlU05HenFRZVg1ZWF3RG9iUTYv?=
 =?utf-8?B?L09saVkvL3hrd2NxbmtLbVZhaDYyOWUzYVA3M2JGWGZ2NmEwaERzeVdEcWg0?=
 =?utf-8?B?VFBmaCtZNjg0aklmNER5ZFVWemM2T2k5bURWUWNFVW9ieDBRQ0VWMEVaY1Y2?=
 =?utf-8?B?MFpRU2UvcUxGRUczdGp5WjZKNFluWEdSc1h6TTVjN2I0TmdMYmRBU2xob0hO?=
 =?utf-8?B?TUtPSk9IQjRiUEVZVkNtWTRxbWdvTGtTQzFGQ0RGWVNyMDVocGwvNVdQdzU5?=
 =?utf-8?B?bm8zNlkwcjZjVzFvdWZWa04zRUJ1bU4wNTZ0K0RURnJpYWJWTzhmVTd3Lzgr?=
 =?utf-8?B?eFNwRVovUGl5ZndjcDYrbGVXQ3E3Ukh0ZkZFbTBvOXlsVkgxenRnRXEzTnBu?=
 =?utf-8?B?aUdHdktyVkNIWlRPV2pURUVFbzJDaFB4dmF4UmhpVDF5S0MyR3hFUWNIeXRj?=
 =?utf-8?B?TktaTjlhMWRoTFNDRXBwZWQwZVpqejJTRjdFa25HNHViaHdid2pKcVNDWFV4?=
 =?utf-8?B?NkNMTlYySFE2QlNldkhWMVE2Z0Urd09zdWVPblhySHNGZXZXeFFIVU9Eem4z?=
 =?utf-8?B?QmVaTWpPc3d2VVYrcjZWSzNLRjN4dk51WmFaNGc4d1BpYmt0eTQ1dW8veTk2?=
 =?utf-8?B?a1pEUlhtZ0tNamQwQk52ZThIVVFKaVNVOXFGaWwwWi9tODkzUVhPbUJCVldH?=
 =?utf-8?B?WEdjQisveWlsTDBXRWttVisrZnI1V3ZqNDV4ZFFBM3VOaDV4a1NzV2RCRUZy?=
 =?utf-8?B?a21DUkxFQk5UdTkyT0dKd1NsbkxwUzdXV3p1d3pLc0orOGRFdVNvdSsyM1R0?=
 =?utf-8?B?OTQzVDFRWkd5ZFNYY1JmQk4yUUpCMmJRK21pWlNOM0ZNL2xMelRucEFxZ1M0?=
 =?utf-8?B?akgvU3FkTVpyNzR6NDgvbGkrNXp6VzhZb2pXNFhYRGJreDFnQUlkWFdlMGFC?=
 =?utf-8?B?aTNHcGdRTWJKTTU4SCtrMXRLanpUWFZzb2VPSzhoaG5QaXR2dTMwVUovdi9p?=
 =?utf-8?B?Z3JqN0NLanlDbnp2OHRLbzV1RVhaWVl5ZlFJNVJsSFhFVHhWblpoaytYR0dQ?=
 =?utf-8?B?NU1PSU05VVM2NFk0djlCVGF0SDZaM3dkdnhDTzhUbW92MXNEZDBGTjQ4YzRv?=
 =?utf-8?B?N2NWRUJOZHQ1SUpQUnNEVW5RVTlHZDJtVG9JZ0U1MTF5aHZLdDIzdnB6Ty9u?=
 =?utf-8?B?NmR4Z1dOQUhsM01lekFQTXBUWW83elZUVm9QbUpYMzl6U1F2Y0dmK0hHbWVx?=
 =?utf-8?B?VlQ2ZU9nckNmYVBCNnFpT2d2SXM2amNDN05wUWl2anQwTmlwV2liMXN1eXpq?=
 =?utf-8?B?OEs3QnZlY21ob3BzcnV4dVBBMUtkRUtXajZNTWFQU3d1V3ZabDJpcVhTRW13?=
 =?utf-8?B?aGd3bzVKTG1ydFZKeXFZSTVaMjViWjlzd3VGTDdpcXNDL0ptMUtwanUrNlV1?=
 =?utf-8?B?ejR5blZIbG9QUnk1RjFDanZIVEFTbXI1NFlCSnRJL2VDM1Z1VEErT2tyUWw1?=
 =?utf-8?B?b2ZWZWpkZy93aG5HTVBmdWJGdFA4V29JZEFKYzgxZkZxZHpQUE1ocVpMMUF1?=
 =?utf-8?B?ZC91c3h1dUtWZVVZYmtERGw5ZGNyUGdCY29NSHZPcHAxSW5MZHh5Yythb0Z1?=
 =?utf-8?B?SEd3Uit4NjNHeVJueWxzaDFXZG9SbTNpVitFUmZlQ2MrVjRQZStEc2EzdytQ?=
 =?utf-8?B?YjZZZHZwR2pxV3orU2p5OFREMldrSXB3QURXRXJRSXIzd1B0VndXYVN2cUw2?=
 =?utf-8?B?UHhyS0pEYlNjYmRZRDZTdzAyYXZDVlRTK3p3VSt4cStDdXI2V29BTllBbDll?=
 =?utf-8?B?MFY3VEY2cUozVVJoclVHNGdKazRFTXpOZzJkR0dXQm1nRG5PZUFVZE1zcHVD?=
 =?utf-8?B?WDcybnd6dTFoWFB2VHlNNTJaWFF5UUZ0emNudi9sYU5kSnpqZTBsbmJKU3JY?=
 =?utf-8?B?a1hCSnFEUVpBMGd2cnJQNGx2Zng1L0ZlejFFSCtEWjZxWFUxek8ydlZKeFlR?=
 =?utf-8?Q?DD4DuWVho19uZTD9mE/IK6rzP?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR18MB5635.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9069783a-6efc-4d81-e339-08dc4f1f903a
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2024 12:06:56.1873 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RIpdX6ltQijECqYapAqamkOI6llIjgGF7VkfbxaQQi8NBMpf3wozn8sm3+kkShQ5FFqWSA7b2uoy45Q5ZL3mFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR18MB5544
X-Proofpoint-GUID: q0uNC0oKjSaRozF9LXAFXdZxlseYkbZe
X-Proofpoint-ORIG-GUID: q0uNC0oKjSaRozF9LXAFXdZxlseYkbZe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-28_11,2024-03-27_01,2023-05-22_02
X-Mailman-Approved-At: Thu, 28 Mar 2024 19:21:35 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGllbiBQYW5pcyA8anBh
bmlzQGJheWxpYnJlLmNvbT4NCj4gU2VudDogVGh1cnNkYXksIE1hcmNoIDI4LCAyMDI0IDI6NTcg
UE0NCj4gVG86IERhdmlkIFMuIE1pbGxlciA8ZGF2ZW1AZGF2ZW1sb2Z0Lm5ldD47IEVyaWMgRHVt
YXpldA0KPiA8ZWR1bWF6ZXRAZ29vZ2xlLmNvbT47IEpha3ViIEtpY2luc2tpIDxrdWJhQGtlcm5l
bC5vcmc+OyBQYW9sbyBBYmVuaQ0KPiA8cGFiZW5pQHJlZGhhdC5jb20+OyBSdXNzZWxsIEtpbmcg
PGxpbnV4QGFybWxpbnV4Lm9yZy51az47IEFsZXhlaSBTdGFyb3ZvaXRvdg0KPiA8YXN0QGtlcm5l
bC5vcmc+OyBEYW5pZWwgQm9ya21hbm4gPGRhbmllbEBpb2dlYXJib3gubmV0PjsgSmVzcGVyIERh
bmdhYXJkDQo+IEJyb3VlciA8aGF3a0BrZXJuZWwub3JnPjsgSm9obiBGYXN0YWJlbmQgPGpvaG4u
ZmFzdGFiZW5kQGdtYWlsLmNvbT47DQo+IFN1bWl0IFNlbXdhbCA8c3VtaXQuc2Vtd2FsQGxpbmFy
by5vcmc+OyBDaHJpc3RpYW4gS8O2bmlnDQo+IDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+OyBT
aW1vbiBIb3JtYW4gPGhvcm1zQGtlcm5lbC5vcmc+OyBBbmRyZXcNCj4gTHVubiA8YW5kcmV3QGx1
bm4uY2g+OyBSYXRoZWVzaCBLYW5ub3RoIDxya2Fubm90aEBtYXJ2ZWxsLmNvbT4NCj4gQ2M6IG5l
dGRldkB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGJwZkB2
Z2VyLmtlcm5lbC5vcmc7DQo+IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZzsgZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgbGluYXJvLW1tLQ0KPiBzaWdAbGlzdHMubGluYXJvLm9y
ZzsgSnVsaWVuIFBhbmlzIDxqcGFuaXNAYmF5bGlicmUuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0gg
bmV0LW5leHQgdjUgMS8zXSBuZXQ6IGV0aGVybmV0OiB0aTogQWRkIGFjY2Vzc29ycw0KPiBmb3Ig
c3RydWN0IGszX2NwcGlfZGVzY19wb29sIG1lbWJlcnMNCj4gDQo+IFRoaXMgcGF0Y2ggYWRkcyBh
Y2Nlc3NvcnMgZm9yIGRlc2Nfc2l6ZSBhbmQgY3B1bWVtIG1lbWJlcnMuIFRoZXkgbWF5IGJlDQo+
IHVzZWQsIGZvciBpbnN0YW5jZSwgdG8gY29tcHV0ZSBhIGRlc2NyaXB0b3IgaW5kZXguDQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gUGFuaXMgPGpwYW5pc0BiYXlsaWJyZS5jb20+DQo+IC0t
LQ0KPiAgZHJpdmVycy9uZXQvZXRoZXJuZXQvdGkvazMtY3BwaS1kZXNjLXBvb2wuYyB8IDEyICsr
KysrKysrKysrKw0KPiBkcml2ZXJzL25ldC9ldGhlcm5ldC90aS9rMy1jcHBpLWRlc2MtcG9vbC5o
IHwgIDIgKysNCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3RpL2szLWNwcGktZGVzYy1wb29sLmMgYi9k
cml2ZXJzL25ldC9ldGhlcm5ldC90aS9rMy0NCj4gY3BwaS1kZXNjLXBvb2wuYw0KPiBpbmRleCAw
NWNjN2FhYjFlYzguLmZlODIwM2MwNTczMSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9uZXQvZXRo
ZXJuZXQvdGkvazMtY3BwaS1kZXNjLXBvb2wuYw0KPiArKysgYi9kcml2ZXJzL25ldC9ldGhlcm5l
dC90aS9rMy1jcHBpLWRlc2MtcG9vbC5jDQo+IEBAIC0xMzIsNSArMTMyLDE3IEBAIHNpemVfdCBr
M19jcHBpX2Rlc2NfcG9vbF9hdmFpbChzdHJ1Y3QNCj4gazNfY3BwaV9kZXNjX3Bvb2wgKnBvb2wp
ICB9ICBFWFBPUlRfU1lNQk9MX0dQTChrM19jcHBpX2Rlc2NfcG9vbF9hdmFpbCk7DQo+IA0KPiAr
c2l6ZV90IGszX2NwcGlfZGVzY19wb29sX2Rlc2Nfc2l6ZShzdHJ1Y3QgazNfY3BwaV9kZXNjX3Bv
b2wgKnBvb2wpIHsNCj4gKwlyZXR1cm4gcG9vbC0+ZGVzY19zaXplOw0KDQpEb24ndCB5b3UgbmVl
ZCB0byBhZGQgTlVMTCBjaGVjayBvbiBwb29sIHB0ciBzaW5jZSB0aGlzIGZ1bmN0aW9uIGlzIGV4
cG9ydGVkPw0KDQo+ICt9DQo+ICtFWFBPUlRfU1lNQk9MX0dQTChrM19jcHBpX2Rlc2NfcG9vbF9k
ZXNjX3NpemUpOw0KPiArDQo+ICt2b2lkICprM19jcHBpX2Rlc2NfcG9vbF9jcHVhZGRyKHN0cnVj
dCBrM19jcHBpX2Rlc2NfcG9vbCAqcG9vbCkgew0KPiArCXJldHVybiBwb29sLT5jcHVtZW07DQoN
ClNhbWUgaGVyZS4NCg0KPiArfQ0KPiArRVhQT1JUX1NZTUJPTF9HUEwoazNfY3BwaV9kZXNjX3Bv
b2xfY3B1YWRkcik7DQo+ICsNCj4gIE1PRFVMRV9MSUNFTlNFKCJHUEwiKTsNCj4gIE1PRFVMRV9E
RVNDUklQVElPTigiVEkgSzMgQ1BQSTUgZGVzY3JpcHRvcnMgcG9vbCBBUEkiKTsgZGlmZiAtLWdp
dA0KPiBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3RpL2szLWNwcGktZGVzYy1wb29sLmggYi9kcml2
ZXJzL25ldC9ldGhlcm5ldC90aS9rMy1jcHBpLWRlc2MtDQo+IHBvb2wuaA0KPiBpbmRleCBhN2Uz
ZmE1ZTdiNjIuLjE0OWQ1NTc5YTVlMiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJu
ZXQvdGkvazMtY3BwaS1kZXNjLXBvb2wuaA0KPiArKysgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC90
aS9rMy1jcHBpLWRlc2MtcG9vbC5oDQo+IEBAIC0yNiw1ICsyNiw3IEBAIGszX2NwcGlfZGVzY19w
b29sX2RtYTJ2aXJ0KHN0cnVjdCBrM19jcHBpX2Rlc2NfcG9vbA0KPiAqcG9vbCwgZG1hX2FkZHJf
dCBkbWEpOyAgdm9pZCAqazNfY3BwaV9kZXNjX3Bvb2xfYWxsb2Moc3RydWN0DQo+IGszX2NwcGlf
ZGVzY19wb29sICpwb29sKTsgIHZvaWQgazNfY3BwaV9kZXNjX3Bvb2xfZnJlZShzdHJ1Y3QNCj4g
azNfY3BwaV9kZXNjX3Bvb2wgKnBvb2wsIHZvaWQgKmFkZHIpOyAgc2l6ZV90IGszX2NwcGlfZGVz
Y19wb29sX2F2YWlsKHN0cnVjdA0KPiBrM19jcHBpX2Rlc2NfcG9vbCAqcG9vbCk7DQo+ICtzaXpl
X3QgazNfY3BwaV9kZXNjX3Bvb2xfZGVzY19zaXplKHN0cnVjdCBrM19jcHBpX2Rlc2NfcG9vbCAq
cG9vbCk7DQo+ICt2b2lkICprM19jcHBpX2Rlc2NfcG9vbF9jcHVhZGRyKHN0cnVjdCBrM19jcHBp
X2Rlc2NfcG9vbCAqcG9vbCk7DQo+IA0KPiAgI2VuZGlmIC8qIEszX0NQUElfREVTQ19QT09MX0hf
ICovDQo+IA0KPiAtLQ0KPiAyLjM3LjMNCj4gDQoNCg==

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8821A462F
	for <lists+dri-devel@lfdr.de>; Fri, 10 Apr 2020 14:15:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9E5C6ECCC;
	Fri, 10 Apr 2020 12:15:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2059.outbound.protection.outlook.com [40.107.244.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37B426ECCC;
 Fri, 10 Apr 2020 12:15:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bsi2NnczfQLXp/OGZJoGo9oTvgHUDb7GKrd0OBea02IBuuCYERUL39Jzv6G3Exakf0LRZNxXL0Zt6AkBGgjn2ar2pvq8F7k6YBuzb+1/P7h6TxXUCfOv4lLy2qTYSGzXckqhDdC8Z+KCC21pKI0/C+lMgFaXkT6p9RnJBjKeUip1Oqdgb2Jh6+aoatdPify2iEdB+S8WA4XP+4lnmTyUrKeHwc9k/uHgOYVVqagX8VAVG46gj+w2Vir4cO5Ov2U2d6o0fDSrYG1ils0a3g1dN5h+4a+/Q3Lo50J70AscTEjDI4v7AQ3eVRROhA0nVUB0croys9VjWKnhfv2Z7yQz8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hfVDEYc3FICYzaVKFt9VnNIFbAxa1k5Gt08kr12bAuc=;
 b=XWZ6tl5u51ukfayA7PgIHsbND5ni+jeHcDIbFVUBrPLHbJr/nhH5lLzF3A6nr1T8x3xAx0Snlg0Y/Oh5If4AqbREIg5qyGYVjMvXt1pZKnvNxGML4ziEyOd+/lDWNyhlR/nu5lyxdY/5QIHaG6kIaGmqOM53eGKqMZn/OVfT8W+UgmAJH5fbSSxHw3VgLWG3hWANiO/QTXDl6zwJF172NBlhzLAPSz4gbzXKtS1/DWofGuZvDVBh1AKDJFfVcAhyfF/5dPhK7iyY9ksdiDx8CPOrU7WiTCJgnCH3gX51oUJR/9ttFVpvnIteSZ23TMYzEtHe+iO1yfYW7u0QQyBQVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hfVDEYc3FICYzaVKFt9VnNIFbAxa1k5Gt08kr12bAuc=;
 b=tU3NrNsiwoGANN5VHeUQMERjf7YO/XoD5eylACgkiS0G1yU/Y/Vhdy2u6eCeHg26jlqbiAAteD5Tq3rrHwcHLAlRM0ahsgafsZ+rlNnzSKF777ouEzdiGww3Sl8MB/NO3UQPKQ+Po0YFJcNbqJ4e8YzzIv2SdiQcI7wzbgoVRjk=
Received: from DM6PR12MB4401.namprd12.prod.outlook.com (2603:10b6:5:2a9::15)
 by DM6PR12MB3355.namprd12.prod.outlook.com (2603:10b6:5:115::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.15; Fri, 10 Apr
 2020 12:15:40 +0000
Received: from DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::f164:85c4:1b51:14d2]) by DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::f164:85c4:1b51:14d2%4]) with mapi id 15.20.2878.025; Fri, 10 Apr 2020
 12:15:39 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Pan, Xinhui" <Xinhui.Pan@amd.com>
Subject: Re: [PATCH] drm/ttm: Break out the loops if need_resched in bo
 delayed delete worker
Thread-Topic: [PATCH] drm/ttm: Break out the loops if need_resched in bo
 delayed delete worker
Thread-Index: AQHWDzG/gtJiNMndwkSTESxhF8iBIQ==
Date: Fri, 10 Apr 2020 12:15:39 +0000
Message-ID: <c76f92fc-b348-4d65-af6c-399e02969cf3@email.android.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
x-originating-ip: [178.202.40.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 56a72013-1f2b-423b-ac10-08d7dd48e246
x-ms-traffictypediagnostic: DM6PR12MB3355:|DM6PR12MB3355:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB3355666857B6E7DD1B8FE9D183DE0@DM6PR12MB3355.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0369E8196C
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4401.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(396003)(366004)(136003)(346002)(376002)(39860400002)(6636002)(76116006)(450100002)(66476007)(91956017)(86362001)(2906002)(4326008)(316002)(54906003)(6862004)(6512007)(31686004)(6506007)(66556008)(71200400001)(31696002)(66446008)(6486002)(5660300002)(66946007)(9686003)(186003)(8936002)(8676002)(81156014)(66574012)(26005)(478600001)(64756008);
 DIR:OUT; SFP:1101; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: F+BekwSYpQ+rQWfvzI8eHrdQZ1YdQE2/fPyV4x9hm1UlFmxRwO1Rkq3aSwtOK3NC0X2T2yPQ8RgOHhk5BgEfV8wHqBONzzm2g3FpZ1l6RmtsnR5MONJRW77hVFbFAg6E2+KG0qkpelm+VzAxf/N+B+dGxV+VGwdFaZpLx+Y/DliFcev6+ur6Z8B8Ui5v++8SYv+JVqL37A4IvXczwhaD1fSfCyyVcKVJlBJ5yxzFcfSM6nNVii8vGHksei6aFDhfg/pufTSNrSHfK76NeHMyZN2jEZUWpvI8JgM1U0z7odkeeDGEJG39J7zLjX8t3MNXOCkRQG0k5GDjX1vW2qvdNd4E637kgRPnb4137HOr1o5/K8wwcHS9adCc6KtcDAD+SDOoI3ntvzIMqjH6r13KbRXH+2LGLXOoQRwNyTqrqEURLfn9tzmTtP7EOJma8jJr
x-ms-exchange-antispam-messagedata: yDgZlHbF7Uhd0y+p2tAqM4RkzdC90/YL1jmML0aNe7HDofKs2qBav/vfeDfrgEbDsIL1uZNcLjXn1rLvq6CS/59Be4NxUZKjVwII7u3ygznQ80DsNXGTbPUDsy7FlV6+g5BV8BNiqdXvIe9ybuZa1A==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56a72013-1f2b-423b-ac10-08d7dd48e246
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2020 12:15:39.8656 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ygYeZElJf6VGSXMOLYlH/ign+d+eEoMoD8tqc8YJbFL4ZE0VxbjGFV0EalEK5KGv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3355
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0878244140=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0878244140==
Content-Language: de-DE
Content-Type: multipart/alternative;
	boundary="_000_c76f92fcb3484d65af6c399e02969cf3emailandroidcom_"

--_000_c76f92fcb3484d65af6c399e02969cf3emailandroidcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCkFtIDEwLjA0LjIwMjAgMTI6NTggc2NocmllYiAiUGFuLCBYaW5odWkiIDxYaW5odWkuUGFu
QGFtZC5jb20+Og0KVGhlIGRlbGF5ZWQgZGVsZXRlIGxpc3QgaXMgcGVyIGRldmljZSB3aGljaCBt
aWdodCBiZSB2ZXJ5IGh1Z2UuIEFuZCBpbg0KYSBoZWF2eSB3b3JrbG9hZCB0ZXN0LCB0aGUgbGlz
dCBtaWdodCBhbHdheXMgbm90IGJlIGVtcHR5LiBUaGF0IHdpbGwNCnRyaWdnZXIgYW55IFJDVSBz
dGFsbCB3YXJuaW5ncyBvciBzb2Z0bG9ja3VwcyBpbiBub24tcHJlZW1wdGlibGUga2VybmVscw0K
TGV0cyBkbyBicmVhayBvdXQgdGhlIGxvb3BzIGluIHRoYXQgY2FzZS4NCg0KU2lnbmVkLW9mZi1i
eTogeGluaHVpIHBhbiA8eGluaHVpLnBhbkBhbWQuY29tPg0KDQpSZXZpZXdlZC1ieTogQ2hyaXN0
aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPg0KDQotLS0NCiBkcml2ZXJzL2dw
dS9kcm0vdHRtL3R0bV9iby5jIHwgMiArLQ0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1f
Ym8uYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMNCmluZGV4IDllMDdjM2Y3NTE1Ni4u
YzViNTE2ZmE0ZWFlIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYw0K
KysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYw0KQEAgLTUxOCw3ICs1MTgsNyBAQCBz
dGF0aWMgYm9vbCB0dG1fYm9fZGVsYXllZF9kZWxldGUoc3RydWN0IHR0bV9ib19kZXZpY2UgKmJk
ZXYsIGJvb2wgcmVtb3ZlX2FsbCkNCiAgICAgICAgIElOSVRfTElTVF9IRUFEKCZyZW1vdmVkKTsN
Cg0KICAgICAgICAgc3Bpbl9sb2NrKCZnbG9iLT5scnVfbG9jayk7DQotICAgICAgIHdoaWxlICgh
bGlzdF9lbXB0eSgmYmRldi0+ZGRlc3Ryb3kpKSB7DQorICAgICAgIHdoaWxlICghbGlzdF9lbXB0
eSgmYmRldi0+ZGRlc3Ryb3kpICYmICFuZWVkX3Jlc2NoZWQoKSkgew0KICAgICAgICAgICAgICAg
ICBzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvOw0KDQogICAgICAgICAgICAgICAgIGJvID0g
bGlzdF9maXJzdF9lbnRyeSgmYmRldi0+ZGRlc3Ryb3ksIHN0cnVjdCB0dG1fYnVmZmVyX29iamVj
dCwNCi0tDQoyLjE3LjENCg0KDQo=

--_000_c76f92fcb3484d65af6c399e02969cf3emailandroidcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <31F80AC098D1954E9FE25941A04D2D7F@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5Pg0KPGRpdiBkaXI9ImF1
dG8iPg0KPGRpdj48YnI+DQo8ZGl2IGNsYXNzPSJnbWFpbF9leHRyYSI+PGJyPg0KPGRpdiBjbGFz
cz0iZ21haWxfcXVvdGUiPkFtIDEwLjA0LjIwMjAgMTI6NTggc2NocmllYiAmcXVvdDtQYW4sIFhp
bmh1aSZxdW90OyAmbHQ7WGluaHVpLlBhbkBhbWQuY29tJmd0Ozo8YnIgdHlwZT0iYXR0cmlidXRp
b24iPg0KPGJsb2NrcXVvdGUgY2xhc3M9InF1b3RlIiBzdHlsZT0ibWFyZ2luOjAgMCAwIC44ZXg7
Ym9yZGVyLWxlZnQ6MXB4ICNjY2Mgc29saWQ7cGFkZGluZy1sZWZ0OjFleCI+DQo8ZGl2Pjxmb250
IHNpemU9IjIiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTFwdCI+DQo8ZGl2PlRoZSBkZWxheWVk
IGRlbGV0ZSBsaXN0IGlzIHBlciBkZXZpY2Ugd2hpY2ggbWlnaHQgYmUgdmVyeSBodWdlLiBBbmQg
aW48YnI+DQphIGhlYXZ5IHdvcmtsb2FkIHRlc3QsIHRoZSBsaXN0IG1pZ2h0IGFsd2F5cyBub3Qg
YmUgZW1wdHkuIFRoYXQgd2lsbDxicj4NCnRyaWdnZXIgYW55IFJDVSBzdGFsbCB3YXJuaW5ncyBv
ciBzb2Z0bG9ja3VwcyBpbiBub24tcHJlZW1wdGlibGUga2VybmVsczxicj4NCkxldHMgZG8gYnJl
YWsgb3V0IHRoZSBsb29wcyBpbiB0aGF0IGNhc2UuPGJyPg0KPGJyPg0KU2lnbmVkLW9mZi1ieTog
eGluaHVpIHBhbiAmbHQ7eGluaHVpLnBhbkBhbWQuY29tJmd0Ozxicj4NCjwvZGl2Pg0KPC9zcGFu
PjwvZm9udD48L2Rpdj4NCjwvYmxvY2txdW90ZT4NCjwvZGl2Pg0KPC9kaXY+DQo8L2Rpdj4NCjxk
aXYgZGlyPSJhdXRvIj48YnI+DQo8L2Rpdj4NCjxkaXYgZGlyPSJhdXRvIj5SZXZpZXdlZC1ieTog
Q2hyaXN0aWFuIEvDtm5pZyAmbHQ7Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tJmd0OzwvZGl2Pg0K
PGRpdiBkaXI9ImF1dG8iPjxicj4NCjwvZGl2Pg0KPGRpdiBkaXI9ImF1dG8iPg0KPGRpdiBjbGFz
cz0iZ21haWxfZXh0cmEiPg0KPGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPg0KPGJsb2NrcXVvdGUg
Y2xhc3M9InF1b3RlIiBzdHlsZT0ibWFyZ2luOjAgMCAwIC44ZXg7Ym9yZGVyLWxlZnQ6MXB4ICNj
Y2Mgc29saWQ7cGFkZGluZy1sZWZ0OjFleCI+DQo8ZGl2Pjxmb250IHNpemU9IjIiPjxzcGFuIHN0
eWxlPSJmb250LXNpemU6MTFwdCI+DQo8ZGl2Pi0tLTxicj4NCiZuYnNwO2RyaXZlcnMvZ3B1L2Ry
bS90dG0vdHRtX2JvLmMgfCAyICYjNDM7LTxicj4NCiZuYnNwOzEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigmIzQzOyksIDEgZGVsZXRpb24oLSk8YnI+DQo8YnI+DQpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmM8
YnI+DQppbmRleCA5ZTA3YzNmNzUxNTYuLmM1YjUxNmZhNGVhZSAxMDA2NDQ8YnI+DQotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jPGJyPg0KJiM0MzsmIzQzOyYjNDM7IGIvZHJpdmVy
cy9ncHUvZHJtL3R0bS90dG1fYm8uYzxicj4NCkBAIC01MTgsNyAmIzQzOzUxOCw3IEBAIHN0YXRp
YyBib29sIHR0bV9ib19kZWxheWVkX2RlbGV0ZShzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiwg
Ym9vbCByZW1vdmVfYWxsKTxicj4NCiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyBJTklUX0xJU1RfSEVBRCgmYW1wO3JlbW92ZWQpOzxicj4NCiZuYnNwOzxi
cj4NCiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBzcGlu
X2xvY2soJmFtcDtnbG9iLSZndDtscnVfbG9jayk7PGJyPg0KLSZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyB3aGlsZSAoIWxpc3RfZW1wdHkoJmFtcDtiZGV2LSZndDtkZGVzdHJv
eSkpIHs8IS0tIC0tPjxicj4NCiYjNDM7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7IHdoaWxlICghbGlzdF9lbXB0eSgmYW1wO2JkZXYtJmd0O2RkZXN0cm95KSAmYW1wOyZhbXA7
ICFuZWVkX3Jlc2NoZWQoKSkgezwhLS0gLS0+PGJyPg0KJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7IHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm87PGJyPg0KJm5ic3A7
PGJyPg0KJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IGJvID0gbGlzdF9m
aXJzdF9lbnRyeSgmYW1wO2JkZXYtJmd0O2RkZXN0cm95LCBzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmpl
Y3QsPGJyPg0KLS0gPGJyPg0KMi4xNy4xPGJyPg0KPGJyPg0KPC9kaXY+DQo8L3NwYW4+PC9mb250
PjwvZGl2Pg0KPC9ibG9ja3F1b3RlPg0KPC9kaXY+DQo8YnI+DQo8L2Rpdj4NCjwvZGl2Pg0KPC9k
aXY+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_c76f92fcb3484d65af6c399e02969cf3emailandroidcom_--

--===============0878244140==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0878244140==--

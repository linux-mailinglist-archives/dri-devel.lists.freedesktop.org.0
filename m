Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C73F594B243
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 23:41:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D43E810E5F7;
	Wed,  7 Aug 2024 21:41:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="eoh+y125";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D39CE10E5F2;
 Wed,  7 Aug 2024 21:41:05 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20240807214103euoutp0286d834639ba8aa714d9556f0b19d04e6~pkC7SmCzn2897028970euoutp02G;
 Wed,  7 Aug 2024 21:41:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20240807214103euoutp0286d834639ba8aa714d9556f0b19d04e6~pkC7SmCzn2897028970euoutp02G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1723066863;
 bh=U9b5NJ/d7sXrqDLaTOjIBs7J8P7i5Yr/Qh8TY3t8pYk=;
 h=From:To:CC:Subject:Date:In-Reply-To:References:From;
 b=eoh+y125LSEMhYWv1XSGfR8uf+fg0vQ5+ng+xaHOSd1yamPNhVdoqnD4hED9Tz7CL
 4Wkj4mby3HaIBs2swODgu+PynhEcEiL84JjZJx4VBKsW22ajJWte8/NFcCFhjtC06g
 dpU6dpi7jEpVgX0EaWUsHHDcZYw6qdb2B7vJyt+k=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20240807214102eucas1p2ec508ef133b6ed8e34a02166a1a2b3c7~pkC65jyIg1274012740eucas1p2z;
 Wed,  7 Aug 2024 21:41:02 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 6F.54.09620.EE9E3B66; Wed,  7
 Aug 2024 22:41:02 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20240807214101eucas1p217cf97d4159f939dfc39c3d5ac474679~pkC5oDN_T1290512905eucas1p2n;
 Wed,  7 Aug 2024 21:41:01 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20240807214101eusmtrp1022fa8100d0cb6d066eda8ae0bcf4a83~pkC5nD7SL0518405184eusmtrp1s;
 Wed,  7 Aug 2024 21:41:01 +0000 (GMT)
X-AuditID: cbfec7f5-d1bff70000002594-f8-66b3e9ee1a8e
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 8C.D8.08810.DE9E3B66; Wed,  7
 Aug 2024 22:41:01 +0100 (BST)
Received: from CAMSVWEXC01.scsc.local (unknown [106.1.227.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20240807214101eusmtip238d094010ef43e294429215ff51615e4~pkC5Uswv90288002880eusmtip2x;
 Wed,  7 Aug 2024 21:41:01 +0000 (GMT)
Received: from CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348) by
 CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Wed, 7 Aug 2024 22:41:00 +0100
Received: from CAMSVWEXC02.scsc.local ([::1]) by CAMSVWEXC02.scsc.local
 ([fe80::3c08:6c51:fa0a:6384%13]) with mapi id 15.00.1497.012; Wed, 7 Aug
 2024 22:41:00 +0100
From: Daniel Gomez <da.gomez@samsung.com>
To: Nicolas Schier <nicolas@fjasle.eu>
CC: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor
 <nathan@kernel.org>, Lucas De Marchi <lucas.demarchi@intel.com>,
 =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, William Hubbs <w.d.hubbs@gmail.com>, "Chris
 Brannon" <chris@the-brannons.com>, Kirk Reiser <kirk@reisers.ca>, "Samuel
 Thibault" <samuel.thibault@ens-lyon.org>, Paul Moore <paul@paul-moore.com>,
 Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek
 <omosnace@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton
 <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, Suzuki K
 Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, "Bill
 Wendling" <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "speakup@linux-speakup.org" <speakup@linux-speakup.org>,
 "selinux@vger.kernel.org" <selinux@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "kvmarm@lists.linux.dev"
 <kvmarm@lists.linux.dev>, "linux-serial@vger.kernel.org"
 <linux-serial@vger.kernel.org>, "llvm@lists.linux.dev"
 <llvm@lists.linux.dev>, Finn Behrens <me@kloenk.dev>, "Daniel Gomez
 (Samsung)" <d+samsung@kruces.com>, "gost.dev@samsung.com"
 <gost.dev@samsung.com>
Subject: Re: [PATCH 06/12] selinux/genheaders: include bitsperlong and
 posix_types headers
Thread-Topic: [PATCH 06/12] selinux/genheaders: include bitsperlong and
 posix_types headers
Thread-Index: AQHa6FXbkJm8qubdXUykvjPm57XXT7Ib3kMAgABlSYA=
Date: Wed, 7 Aug 2024 21:41:00 +0000
Message-ID: <sbj3c3tlafewy2n4pylbnpb4gwylpnyxovdykfy3dhk2wqmpry@ekhhe3mgqnd6>
In-Reply-To: <20240807-outgoing-charcoal-collie-0ee37e@lindesnes>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [106.210.248.90]
Content-Type: text/plain; charset="utf-8"
Content-ID: <0CB3C3B719E6BE4EB7218E0F9C092221@scsc.local>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02Ta1BUZRjHfc+ey0Jix4WRNwTLHdORYIVB4wWcUsI6Y+N0mSmLyWwHDujE
 bXahzA8NuYIBauCCxsIu9zu1dWAZWLkI6MLKLQYCFBVWwGABgQwQB9lgjxe+/Z73+T////N8
 eIUC0XnKSXgyIpqVRUjDxKQtXmVY6nJ/OFER4vE0cxdq7c/F0EzheYAMpeMCdNVyV4AsVSkC
 1Ds/QyJFnpZEjyvGMTRUX4Shh2pndLksj0SabiOOzJXNOOJG+gi0rK/GUI8+k0TteRcoNJra
 QKKxkUIS5czpcGQaHiBQTaaRQHXaHhJxPY8IFJ9QSKBzJWMkmk22YOhBXSuB0pamSDSdfINC
 g5eu4KhB1Ueh4sdXAOpqMVCoqroDoH+6lAClDw4CNFm9alo5lUKg3HhvdPbOPnSr4A/qgCtT
 rikHTK2hg2TqFrJxRt9UQTI1qrsUk83FMGevTxNMXu0ExnClCSSjSdBgjOXCMMFct+RSTE5s
 moDRGD9hGtTlFDOU1IJ9DANt9wezYSe/Y2V73vnG9kTbzDIW1el8Sr1YgseC2a2JwEYI6b2Q
 Uy4JEoGtUEQXA5hh/Jvii/8AnMm8ivHFIwDV/5qp5yPzkxU43yhaVT3oxV+oLqpLyTWViG4D
 cNAU+sK4d/mOdZykd8N6I2dlB3onXJ47Q66JBHTNq/Dy1G9grWFPfwXb4jpxXnQMFpmGAM++
 UKFQWhNwegdsaFy0vtvRR6B21GBlG/og1C/xPoB2gfdLnljDBLQjvD2ahfE3bIa5GbUCnrfA
 Fb2J5NkNdvSPAp49oK6gHudZDNUD6at64arPbqjV7+HRB/bdD+Hdt8PUJBPFb7MZGtNHn03G
 b4TXOsN5DoC6+Lln7vbQ3FJJJQM31brlVC8DVC8DVOsCVOsCsgFRChzZGHl4KCv3imC/l8il
 4fKYiFBJUGQ4B1Y/TNtKy3w1KDbPSZoAJgRNAAoFYgc7xVEuRGQXLP3hNCuLPC6LCWPlTWCr
 EBc72r0Z/DorokOl0ey3LBvFyp53MaGNUyyWT7pFafEsT7czAcfcHXwizNGer5niM5CreTbS
 vXFngNew6tz2/BSP1rj2Mot9SLZ/Hf0hd2Smfdr90I+f30wrnuQ+5RZcdm3AppTBrbrmQ8mx
 LiFfqgMMqf7DyuTCRD/he6f3PlW+QW7bEXuzoUThN3FvwenP6NR5v5UsTcZx8duBQZ0b93tJ
 yaGRe6hjhR7Qe/912DkwxXFsWja+bSm3v+zGpaSvb435+nsPvg+D4kbyPV8ZePfXUJ+Ri6eK
 3HIyOo8e/N3+I+qAqblb2xFdpqMls4fzTFt+bly5VmD3wYZNkuG2Lt/irqKfPoNfOG8iFE/2
 sWW/5Be+Jer2ua1bDJNMinH5Camnq0Aml/4PNR3JhJ8EAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA02TeVDUZRjHe3/ngrP5k0PeOAw3D7RaWM53jQijqR/dTKVOiLjiChTX7EJT
 1h8gXoAYlzAssCCXXAUth4DAFtLCtiGj4oKRqLAYh4QMEGzDQAs/G/nv88z7/T7P831nHh5u
 kUXb8sKjYqWyKEmEgDIndCvdw69OT9SfcOmcfR71DBRjaKb8AkCaqnEcXVu9h6PVpnQc9S/M
 UCixpJZCS/XjGLrfcQVDfxfYo+zqEgopb2oJNNlwnUCqUT2JllubMXS7NZ9Cv5ek0siQpabQ
 2Gg5hS7PNhLo4YNBErXka0nUXnubQqrbcyQ6m1ROonOVYxR6kraKoUftPSS6ZHxMoem0X2k0
 lJFDILVCT6OKpRyA+ro1NGpq7gXor75MgHKHhgCaajY1bXicTqLis17o9J8e6G5ZHe27l61R
 1gC2TdNLse3/FBFsa2c9xbYo7tFskSqOPd01TbIlbRMYq6pKolhlkhJjV1MfkGzXajHNXo6/
 hLNKbQCrLqih2fsp3djH8HOhtyw6LlbqGBYtj31dEChCrkKRGAld3cVCkZtX0D5XD4Gzj/dx
 aUT4V1KZs89RYZhuZhmLuWH/dcFiJREPntglAzMeZNzhwlQ9kQzMeRZMGYAJdzoA92APf5q/
 Q3JsCZf1yRQnmgWwYjyB5AodgMamc0+LCgBP5S4QaxaK2QM7tCp6ja2YXXB59hS1xjjTshnq
 G15bY0vmMNSduWHS80yaINij9+bk+2BiYua6nGB2QPUvi+sb8ZkPYK1BA7hZGRic7K9ZfzBj
 9sNW4w/rDBgHOFL5L83NsoF/GAoxLgIDS9v6cI6t4cToytNor8DeAcPTyC6wsayD4FgACwZz
 8bXdcFOW2lZnDsVQP3KC674dZqU8pLnVtkBtroFIA/aKDYMVz8yKZ2bFBrNig7kIkFXAShon
 jwyNlIuEckmkPC4qVBgSHakCpvNo0hjrm4FyclbYCTAe6ASQhwus+IkHVScs+Mcl35yUyqKD
 ZXERUnkn8DB9XDpuax0SbbqvqNhgkaeLh8jdU+ziIfZ0E9jw/WPOSyyYUEms9EupNEYq+9+H
 8cxs47Ezgp0Ols7IXL/4XOCsnn/9wKbf1BNWTi8uaFfcbhL2X/TxcT9CUSs3+6yhsW/u6P4h
 JzenY/PioCOKQouUW1bx6WkD1Q7JzVezyTeMYSsXtr5tGH7r2/6Xd86M3O02TLV/dHHLdo04
 UxksfL96bIf3YPWttpV5TR0vxTevMW+315HFk+/M+Qbu7nlXZ5PvJ8g61Lu0uEn9ScB4Biqd
 +DTxoh+/Ir9X2umYnt3dFa7LeSHysI96Fx1lrdFf+/HqlW125TAk3e5Q64fzkqkwf2brwc1R
 WqfhbS/lrdjldCUU+Tt5v7mHTAr4rlDsmHf+vVLdAf33ytHQweq608cCFD8bDamPlgSEPEwi
 2ovL5JL/AKfD4POnBAAA
X-CMS-MailID: 20240807214101eucas1p217cf97d4159f939dfc39c3d5ac474679
X-Msg-Generator: CA
X-RootMTR: 20240807153904eucas1p2264f7363ae2474c20c6dc1b84a232815
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20240807153904eucas1p2264f7363ae2474c20c6dc1b84a232815
References: <20240807-macos-build-support-v1-0-4cd1ded85694@samsung.com>
 <20240807-macos-build-support-v1-6-4cd1ded85694@samsung.com>
 <CGME20240807153904eucas1p2264f7363ae2474c20c6dc1b84a232815@eucas1p2.samsung.com>
 <20240807-outgoing-charcoal-collie-0ee37e@lindesnes>
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

T24gV2VkLCBBdWcgMDcsIDIwMjQgYXQgMDU6Mzg6MjhQTSBHTVQsIE5pY29sYXMgU2NoaWVyIHdy
b3RlOg0KPiBPbiBXZWQsIEF1ZyAwNywgMjAyNCBhdCAwMTowOToyMEFNICswMjAwLCBEYW5pZWwg
R29tZXogdmlhIEI0IFJlbGF5IHdyb3RlOg0KPiA+IEZyb206IERhbmllbCBHb21leiA8ZGEuZ29t
ZXpAc2Ftc3VuZy5jb20+DQo+ID4gDQo+ID4gVGhlIGdlbmhlYWRlcnMgcmVxdWlyZXMgdGhlIGJp
dHNwZXJsb25nLmggYW5kIHBvc2l4X3R5cGVzLmggaGVhZGVycy4NCj4gPiBUbyBlbnN1cmUgdGhl
c2UgaGVhZGVycyBhcmUgZm91bmQgZHVyaW5nIGNvbXBpbGF0aW9uIG9uIG1hY09TIGhvc3RzLA0K
PiA+IGFkZCB1c3IvaW5jbHVkZSB0byBIT1NUX0VYVFJBQ0ZMQUdTIGluIHRoZSBnZW5oZWFkZXJz
IE1ha2VmaWxlLiBUaGlzDQo+ID4gYWRqdXN0bWVudCBhbGxvd3MgdGhlIGNvbXBpbGVyIHRvIGxv
Y2F0ZSBhbGwgbmVjZXNzYXJ5IGhlYWRlcnMgd2hlbiB0aGV5DQo+ID4gYXJlIG5vdCBhdmFpbGFi
bGUgYnkgZGVmYXVsdCBvbiBtYWNPUy4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwg
R29tZXogPGRhLmdvbWV6QHNhbXN1bmcuY29tPg0KPiA+IC0tLQ0KPiA+ICBzY3JpcHRzL3NlbGlu
dXgvZ2VuaGVhZGVycy9NYWtlZmlsZSB8IDMgKystDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvc2NyaXB0
cy9zZWxpbnV4L2dlbmhlYWRlcnMvTWFrZWZpbGUgYi9zY3JpcHRzL3NlbGludXgvZ2VuaGVhZGVy
cy9NYWtlZmlsZQ0KPiA+IGluZGV4IDFmYWY3ZjA3ZThkYi4uMDE3MTQ5YzkwZjhlIDEwMDY0NA0K
PiA+IC0tLSBhL3NjcmlwdHMvc2VsaW51eC9nZW5oZWFkZXJzL01ha2VmaWxlDQo+ID4gKysrIGIv
c2NyaXB0cy9zZWxpbnV4L2dlbmhlYWRlcnMvTWFrZWZpbGUNCj4gPiBAQCAtMiw0ICsyLDUgQEAN
Cj4gPiAgaG9zdHByb2dzLWFsd2F5cy15ICs9IGdlbmhlYWRlcnMNCj4gPiAgSE9TVF9FWFRSQUNG
TEFHUyArPSBcDQo+ID4gIAktSSQoc3JjdHJlZSkvaW5jbHVkZS91YXBpIC1JJChzcmN0cmVlKS9p
bmNsdWRlIFwNCj4gPiAtCS1JJChzcmN0cmVlKS9zZWN1cml0eS9zZWxpbnV4L2luY2x1ZGUNCj4g
PiArCS1JJChzcmN0cmVlKS9zZWN1cml0eS9zZWxpbnV4L2luY2x1ZGUgXA0KPiA+ICsJLUkkKHNy
Y3RyZWUpL3Vzci9pbmNsdWRlDQo+IA0KPiAnbWFrZSBoZWFkZXJzJyBjb21wb3NlcyB0aGUgVUFQ
SSBoZWFkZXIgdHJlZSBpbiAkKG9ianRyZWUpL3Vzci9pbmNsdWRlLg0KPiBTbywgaWYgeW91IGJ1
aWxkIG91dC1vZi1zb3VyY2UsIC1JJChzcmN0cmVlKS91c3IvaW5jbHVkZSB3aWxsIG5vdCBtYXRj
aC4NCj4gSnVzdCByZW1vdmUgdGhlICckKHNyY3RyZWUpLycgcHJlZml4IGFzICckKG9ianRyZWUp
LycgaXMgYWx3YXlzICcuJy4NCg0KVGhlICdoZWFkZXJzJyB0YXJnZXQgYWxzbyBkZXBsb3lzIGlu
c3RhbGxzIHRoZSBoZWFkZXJzIGluIGFyY2gvJChTUkNBUkNIKS8NCmluY2x1ZGUvdWFwaSwgc28g
SSd2ZSB1cGRhdGVkIHNlbGludXgvZ2VuaGVhZGVycy9NYWtlZmlsZSB0byB0aGUgZm9sbG93aW5n
Og0KDQpkaWZmIC0tZ2l0IGEvc2NyaXB0cy9zZWxpbnV4L2dlbmhlYWRlcnMvTWFrZWZpbGUgYi9z
Y3JpcHRzL3NlbGludXgvZ2VuaGVhZGVycy9NYWtlZmlsZQ0KaW5kZXggMWZhZjdmMDdlOGRiLi5h
ZTFmMTk1YjZmNjcgMTAwNjQ0DQotLS0gYS9zY3JpcHRzL3NlbGludXgvZ2VuaGVhZGVycy9NYWtl
ZmlsZQ0KKysrIGIvc2NyaXB0cy9zZWxpbnV4L2dlbmhlYWRlcnMvTWFrZWZpbGUNCkBAIC0yLDQg
KzIsNiBAQA0KIGhvc3Rwcm9ncy1hbHdheXMteSArPSBnZW5oZWFkZXJzDQogSE9TVF9FWFRSQUNG
TEFHUyArPSBcDQogICAgICAgIC1JJChzcmN0cmVlKS9pbmNsdWRlL3VhcGkgLUkkKHNyY3RyZWUp
L2luY2x1ZGUgXA0KLSAgICAgICAtSSQoc3JjdHJlZSkvc2VjdXJpdHkvc2VsaW51eC9pbmNsdWRl
DQorICAgICAgIC1JJChzcmN0cmVlKS9zZWN1cml0eS9zZWxpbnV4L2luY2x1ZGUgXA0KKyAgICAg
ICAtSSQob2JqdHJlZSkvYXJjaC8kKFNSQ0FSQ0gpL2luY2x1ZGUvZ2VuZXJhdGVkL3VhcGkgXA0K
KyAgICAgICAtSSQob2JqdHJlZSkvYXJjaC8kKFNSQ0FSQ0gpL2luY2x1ZGUvdWFwaQ0KDQpUaGUg
aW5jbHVkZSBwYXRoIC1JJChvYmp0cmVlKS9hcmNoLyQoU1JDQVJDSCkvaW5jbHVkZS9nZW5lcmF0
ZWQvdWFwaQ0KZW5hYmxlcyBsb2NhdGluZyB0aGUgYXNtL3R5cGVzLmguDQoNClRoZSBpbmNsdWRl
IHBhdGggLUkkKG9ianRyZWUpL2FyY2gvJChTUkNBUkNIKS9pbmNsdWRlL3VhcGkgZW5hYmxlcw0K
bG9jYXRpbmcgdGhlIGFzbS9iaXRzcGVybG9uZy5oIGFuZCBhc20vcG9zaXhfdHlwZXMuaC4NCg0K
PiANCj4gQnV0IEkgYW0gc3VzcGVjdGluZyB0aGF0IHRoaXMgYnJlYWsgY3Jvc3MtYnVpbGRpbmcu
DQoNCknigJl2ZSB0ZXN0ZWQgdGhpcyBjaGFuZ2Ugb24gbWFjT1Mgd2l0aCBBUkNIPWFybTY0LCBh
cyB3ZWxsIGFzIG9uIERlYmlhbiB3aXRoDQpBUkNIPWFybTY0IGFuZCBBUkNIPXg4Nl82NC4gSXMg
aXQgZW5vdWdoIHRvIGp1c3QgY29uZmlybSB0aGF0IGNyb3NzLWJ1aWxkaW5nDQpzdGlsbCB3b3Jr
cyBhZnRlciB0aGlzIGNoYW5nZT8NCg0KPiANCj4gS2luZCByZWdhcmRzLA0KPiBOaWNvbGFz

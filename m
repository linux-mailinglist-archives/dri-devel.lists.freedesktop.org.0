Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0765D94B12A
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 22:22:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D50B910E5C2;
	Wed,  7 Aug 2024 20:21:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="PJaOcnyV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 483 seconds by postgrey-1.36 at gabe;
 Wed, 07 Aug 2024 08:22:00 UTC
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BD7710E456;
 Wed,  7 Aug 2024 08:22:00 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20240807081355euoutp0246daebd629ca2d671dfec80d6afd0ebe~pZCNRNIiO2254122541euoutp02w;
 Wed,  7 Aug 2024 08:13:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20240807081355euoutp0246daebd629ca2d671dfec80d6afd0ebe~pZCNRNIiO2254122541euoutp02w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1723018435;
 bh=n9u13BLc1/Av6vacu5XOn99roQyFwYtJJqhaCiMmdoc=;
 h=From:To:CC:Subject:Date:In-Reply-To:References:From;
 b=PJaOcnyV+4yJ/to0LVbznuSw5dhddOhL6L4/n6sSOf3fwG7DLXMyQqSauzTvgkp54
 K1V5wNK1VLrUXpm3o53az2ZBvWL6eu3lL/qM9ndeHs5lDjVYc0twciZa4Yf0TBj4uM
 Zsf1ivcXr+aFXkVJD5ENOO60XHi6YWhnwp+qs+6Q=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20240807081355eucas1p192b35d483bbc7c0f5fd8f98537b5d916~pZCNAwd7D2938229382eucas1p1q;
 Wed,  7 Aug 2024 08:13:55 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id E2.24.09620.2CC23B66; Wed,  7
 Aug 2024 09:13:54 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20240807081354eucas1p175713174856919970a701a2b8738b9c7~pZCMU_e8-2943329433eucas1p1e;
 Wed,  7 Aug 2024 08:13:54 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20240807081354eusmtrp23393ddf9d4e20be6fcc4c78e46cb51ae~pZCMSOqwl0317503175eusmtrp2p;
 Wed,  7 Aug 2024 08:13:54 +0000 (GMT)
X-AuditID: cbfec7f5-d1bff70000002594-2b-66b32cc2be5f
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id DC.39.08810.1CC23B66; Wed,  7
 Aug 2024 09:13:54 +0100 (BST)
Received: from CAMSVWEXC01.scsc.local (unknown [106.1.227.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20240807081353eusmtip154691cfcb25d38d126937c3750e07f54~pZCL9A4av2830328303eusmtip1U;
 Wed,  7 Aug 2024 08:13:53 +0000 (GMT)
Received: from CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348) by
 CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Wed, 7 Aug 2024 09:13:52 +0100
Received: from CAMSVWEXC02.scsc.local ([::1]) by CAMSVWEXC02.scsc.local
 ([fe80::3c08:6c51:fa0a:6384%13]) with mapi id 15.00.1497.012; Wed, 7 Aug
 2024 09:13:52 +0100
From: Daniel Gomez <da.gomez@samsung.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor
 <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 =?iso-8859-1?Q?Thomas_Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
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
Subject: Re: [PATCH 04/12] drm/xe: xe_gen_wa_oob: fix
 program_invocation_short_name for macos
Thread-Topic: [PATCH 04/12] drm/xe: xe_gen_wa_oob: fix
 program_invocation_short_name for macos
Thread-Index: AQHa6FXbw2zXqVW9ckie+aU8ZAXkwrIa9tWAgABrNIA=
Date: Wed, 7 Aug 2024 08:13:51 +0000
Message-ID: <mhrznemgfocotpgkyze7l73e6237wygja6lrvmodeka6ehbkgc@h6fzyrcsmci2>
In-Reply-To: <67ahzgfa63gs7ybbunthdiwodlaihzqerb5xmkrgfgrbmghjmw@d57hhuwaf53i>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [106.110.32.67]
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <6061A4101764934EA47CBCA8181EF747@scsc.local>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02TfUxTVxjGPff23lsQ3F0hcmAYYodzOuhwzu04jRhm4s0yNsxIHMwFO7h8
 bFBICxNZokQYWBApCkMqMCjjGwMp0EH5ks9SPjQMKSgyC8LEohQCGiSOjlJc+O/35nnO87zv
 H4eL89IpJ26YKJoVi4ThfNKao+p5dce9w6022GOgyR31jiowZCy5AlBPxSyOmkwTODKpMnB0
 74WRRAlF1SRaqZ3F0KPWUgzN5zmj3yqLSJQ/pOUgQ10nBykf6wj0Wt2AoWF1LokGitIoNJ3Z
 RqKZxyUkKlys56BJ/RiBGnO1BGqpHiaRcniJQEnSEgIll8+QaEFmwtA/Lb0Eynr1jETPZd0U
 Gr+WzUFtch2FylayAbqr6aGQqmEQoCd3rwOUMz4O0FzDemjdswwCKZI+RYkPD6H7xTXU8f1M
 VX4VYJp7Bkmm5WUBh1F31JJMo3yCYgqUMUxi13OCKWp+ijHKCinJ5EvzMcaUpieYLpOCYgrj
 s3AmX3uKacurophHqRrMB/pbHw1iw8N+ZsUfHjtrHXqjUUVGGRxj1ww5nHiwZp8CrLiQ/hjm
 ypKxFGDN5dFlAP75tIG0DMsALi6qN4clAEvnjfibJx163aZQCmB3UxpmFjZc+iSRRehfzzLK
 qP+D9avDhNlF0vtgq1ZJmdmeFkB11+hGO07XvAUX2keBWbCjA2B/0QhpMZ2FtxRS3MKfwUrD
 2IaHQ7vCxobU9SAu15b2hjOXD5jRiv4KXjJdNDsAvQtOla9uVOG0A3ww/TtmueBtqLjZvHnN
 TrimniQt7AYHR6eBhT1gfXErx8K74eWe+6QlRwDHsjI3+TDMudGIW/gDWFI4t8G26/nanGmO
 +SxIp9jAl73JhCXoBJy63bJZbAcNmjpKBtzkW/aTb+mQb+mQb+mQb+koAEQFcGBjJBEhrOSg
 iD0nkAgjJDGiEEFgZIQSrP+Z/jXNiwZQZlgUdACMCzoA5OJ8e9uE08pgnm2Q8HwcK44MEMeE
 s5IO8A6Xw3ew3RPkwvLoEGE0+xPLRrHiNyrGtXKKx+wU5JGB7vIRf7T35B+ykazevMrjzt+v
 6FHcX++W3zScmtfEkts1d3a8f+GYlyzbD+0+YrNd7Oosb0/5ljf6d9c2L897cbcop2075247
 f+ey4p+Q3jdu8rwYtHqm+AtV5LUl4RAYeu2cahN+9UKJLES2Y/mXc6HSWKeiuLT3PvKtOezT
 y17N9PHomvYjJhXBKkF1y2hn4J7P+5y0dmk/1p9eMMIUR88zwL30k4C9fdUhet2v/qGHRhyv
 RzXH42TG8vz5fSKdd6bgG5crT9IdHyaZLk0lSpUPond5l0xE+waC8R9mXRN4Xw/pgm18+9rV
 EUav7i+DDkrCTvKP/tvs59LE7+RzJKHCA/txsUT4Hzj2n2iiBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA02Te1CUZRTGe7/bLjZMX4jyRjTVxthEtLLcfBcUHVP7sJSwBicZgk1WoIBl
 dlmQnGoHxLg2gHJbEYEV4jaByyVArgstMoS0cRcQEDDkEqHExWHYdv1shv9+57zPc54578zh
 4maZHEtuUGi4WBoqCuZRu4ju7c7xDzS2VRfssrNxdHeoAEPLRUkAaUvncHRHP44jfW0qjvr/
 XaZQjKqCQhtVcxiaaP4ZQ3/fsEIZZSoK5eq6CDRf3U4g9fQgibYa6jDU15BDod9VyRw0c62F
 QrPTRRTKX6kh0NTkMInqc7pI1FTRRyF131MSXYkvItGPJbMU+idFj6FHTXdJlL65SKGllN84
 aDQtk0AtykEOKt7IBKi3U8tBtXU9AP3VexWg7NFRgBbqDEOrF1NJVHDlALo85oRGCis5R2yY
 8txywDRqeyimaS2PYBo0VRRTrxznMHlqOXO5Y4lkVI2PMUZdGk8xufG5GKNPniSZDn0Bh8lX
 pONMbpcn03KjnMNMJHZin8Jz/INSiTxc/FagRBZ+iOctQPZ8gRDx7R2FfIHDAR8XeyfefreD
 /uLgoAixdL+bHz8wq76WCpt/7eL2fDahANvmCcCEC2lHqJkcpIxsRhcC2F71Ltu3grdXB0iW
 d8OtwQSDZpdBswLgQnE7yRbdAG4VRnPYohjA1pw5zGih6Pdgc5eaY2Rzmg8bOoYwowinK1+B
 bZox3Piwm/aF3aoBihX5weuKGYJlF1g2PwyMTNDWsL4u0TCIyzWlT8HZOAEbdhODG0+qMWPf
 hD4No/U/GOWAfgM+LHn2PBenLeD9mZsYuwINbzX24izvgY+nt1+sZgt7hmYAy3awprCZYPlt
 GKcdodg5fDicfu0FC2F2Vj3O8vuwKH/hOZvSr8Ku7BkiBVgpd0Qrd9iVO+zKHXblDnseIEuB
 uVguCwkIkQn4MlGITB4awD8vCVEDw4XUajer6kDu/ApfAzAu0ADIxXnmpjFn1RfMTP1FUd+K
 pRJfqTxYLNMAJ8PXpeKWe85LDCcWGu4rcLZzEjg6C+2chM4OPAtT97A4kRkdIAoXfyMWh4ml
 //swromlAou795LWNi0pbu+A8pOVlKt/8KzjVWuHLfwrpta92idg4rGlE6AMj6xN+9xGqw4q
 ifHYnI6N+uo6WTEamOVSxPjfCvduuyiJ+H6vU5JOcSx+zRTbOu2Q+LFOEn242cVV+YVrYY2X
 25k3v7wUFWluWeMjVmzZ3LuELxwaf+J1fMtj1XnfUH+5Z9O5PnmCjfejpDIu/GzEY8kz7FQO
 ZS1sTWiP904+4vPRTyd4JplH+7+LyOjHYqVEU9/J6NWpwQdSHal7MPrnYmxL6PqHsl+jUtZv
 Ry133OG6O559+Po+9+m2jmc9TyeSo+xcvU7aHH0nMvN+q0o1NjB25uuXf/HTFY9XZoTU8AhZ
 oEhgg0tlov8AOGy1gaoEAAA=
X-CMS-MailID: 20240807081354eucas1p175713174856919970a701a2b8738b9c7
X-Msg-Generator: CA
X-RootMTR: 20240807015044eucas1p1998fac358d6afafce6c58478c2834d26
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20240807015044eucas1p1998fac358d6afafce6c58478c2834d26
References: <20240807-macos-build-support-v1-0-4cd1ded85694@samsung.com>
 <20240807-macos-build-support-v1-4-4cd1ded85694@samsung.com>
 <CGME20240807015044eucas1p1998fac358d6afafce6c58478c2834d26@eucas1p1.samsung.com>
 <67ahzgfa63gs7ybbunthdiwodlaihzqerb5xmkrgfgrbmghjmw@d57hhuwaf53i>
X-Mailman-Approved-At: Wed, 07 Aug 2024 20:21:51 +0000
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

On Tue, Aug 06, 2024 at 08:50:09PM GMT, Lucas De Marchi wrote:
> On Wed, Aug 07, 2024 at 01:09:18AM GMT, Daniel Gomez via B4 Relay wrote:
> > From: Daniel Gomez <da.gomez@samsung.com>
> >=20
> > Use getprogname() [1] instead of program_invocation_short_name() [2]
> > for macOS hosts.
> >=20
> > [1]:
> > https://www.gnu.org/software/gnulib/manual/html_node/
> > program_005finvocation_005fshort_005fname.html
> >=20
> > [2]:
> > https://developer.apple.com/library/archive/documentation/System/
> > Conceptual/ManPages_iPhoneOS/man3/getprogname.3.html
> >=20
> > Fixes build error for macOS hosts:
> >=20
> > drivers/gpu/drm/xe/xe_gen_wa_oob.c:34:3: error: use of
> > undeclared identifier 'program_invocation_short_name'    34 |
> > program_invocation_short_name);       |                 ^ 1 error
> > generated.
> >=20
> > Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
> > ---
> > drivers/gpu/drm/xe/xe_gen_wa_oob.c | 8 +++++++-
> > 1 file changed, 7 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_gen_wa_oob.c b/drivers/gpu/drm/xe/xe=
_gen_wa_oob.c
> > index 904cf47925aa..079b8870c461 100644
> > --- a/drivers/gpu/drm/xe/xe_gen_wa_oob.c
> > +++ b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
> > @@ -9,6 +9,12 @@
> > #include <stdbool.h>
> > #include <stdio.h>
> > #include <string.h>
> > +#define PROG_INV_NAME program_invocation_short_name
> > +
> > +#ifdef __APPLE__
> > +#include <stdlib.h>
> > +#define PROG_INV_NAME getprogname()
> > +#endif
> >=20
> > #define HEADER \
> > 	"// SPDX-License-Identifier: MIT\n" \
> > @@ -31,7 +37,7 @@
> > static void print_usage(FILE *f)
> > {
> > 	fprintf(f, "usage: %s <input-rule-file> <generated-c-source-file> <gen=
erated-c-header-file>\n",
> > -		program_invocation_short_name);
> > +		PROG_INV_NAME);
>=20
> instead of doing that, can we a) include stdlib.h unconditionally and b)
> add here a
> `static const char *program_invocation_short_name =3D getprogname()` so w=
e
> don't need to change the common case and just handle the "build on
> macos" as a compat layer?

Does this align with your suggestion (v1 diff)?

Note that static cannot be use here.

diff --git a/drivers/gpu/drm/xe/xe_gen_wa_oob.c b/drivers/gpu/drm/xe/xe_gen=
_wa_oob.c
index 079b8870c461..b3add20ccb01 100644
--- a/drivers/gpu/drm/xe/xe_gen_wa_oob.c
+++ b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
@@ -9,12 +9,7 @@
 #include <stdbool.h>
 #include <stdio.h>
 #include <string.h>
-#define PROG_INV_NAME program_invocation_short_name
-
-#ifdef __APPLE__
 #include <stdlib.h>
-#define PROG_INV_NAME getprogname()
-#endif

 #define HEADER \
        "// SPDX-License-Identifier: MIT\n" \
@@ -36,8 +31,11 @@

 static void print_usage(FILE *f)
 {
+#ifdef __APPLE__
+       const char *program_invocation_short_name =3D getprogname();
+#endif
        fprintf(f, "usage: %s <input-rule-file> <generated-c-source-file> <=
generated-c-header-file>\n",
-               PROG_INV_NAME);
+               program_invocation_short_name);
 }

 static void print_parse_error(const char *err_msg, const char *line,

>=20
> Lucas De Marchi
>=20
> > }
> >=20
> > static void print_parse_error(const char *err_msg, const char *line,
> >=20
> > --=20
> > Git-146)
> >=20
> > =

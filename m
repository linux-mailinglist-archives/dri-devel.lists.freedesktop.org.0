Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE8F94B231
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 23:32:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B73D110E5EE;
	Wed,  7 Aug 2024 21:32:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="MeWSm2qR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91CB610E5EE;
 Wed,  7 Aug 2024 21:32:05 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20240807213202euoutp02a148f524a7a657e987c9d24ef212c670~pj7EBSIgj0460004600euoutp02Y;
 Wed,  7 Aug 2024 21:32:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20240807213202euoutp02a148f524a7a657e987c9d24ef212c670~pj7EBSIgj0460004600euoutp02Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1723066322;
 bh=SFKBfT6GUZl83M60qgQBG2pBPiHhOZwEfwfqr8ok2kY=;
 h=From:To:CC:Subject:Date:In-Reply-To:References:From;
 b=MeWSm2qRSd1Fufbn9AwnijqClGM6HYo+ffeudNyv3fE4Z7mAw+ulmlU9Y86fE/CQ4
 vROriG+42NxG8zXvz3ZQ/CpNHsakGu2h/GbTdTMWpHqh4VzC+CyOpEOBir2fdshyZX
 WoyuA3F/Vp9kAJw4VdEJj1ct+lFej8N+23J0kIbI=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20240807213202eucas1p2f6ac949d7de3743e4ba9217c4664728c~pj7DgXaa60702707027eucas1p2A;
 Wed,  7 Aug 2024 21:32:02 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id AB.05.09875.1D7E3B66; Wed,  7
 Aug 2024 22:32:01 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20240807213201eucas1p25a7f59876849cf9b6d3a755ceabd1417~pj7CYYtZQ0702707027eucas1p2-;
 Wed,  7 Aug 2024 21:32:01 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20240807213201eusmtrp19bba0eeb01c32e1eef6345cc65aa1dd3~pj7CWDOwv0518405184eusmtrp1X;
 Wed,  7 Aug 2024 21:32:01 +0000 (GMT)
X-AuditID: cbfec7f4-11bff70000002693-19-66b3e7d1e8d9
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id BF.C8.08810.0D7E3B66; Wed,  7
 Aug 2024 22:32:00 +0100 (BST)
Received: from CAMSVWEXC02.scsc.local (unknown [106.1.227.72]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20240807213200eusmtip2ec18a8f070e49ba131c0975c2e5ac1d0~pj7B8_snM3109031090eusmtip2I;
 Wed,  7 Aug 2024 21:32:00 +0000 (GMT)
Received: from CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348) by
 CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Wed, 7 Aug 2024 22:31:59 +0100
Received: from CAMSVWEXC02.scsc.local ([::1]) by CAMSVWEXC02.scsc.local
 ([fe80::3c08:6c51:fa0a:6384%13]) with mapi id 15.00.1497.012; Wed, 7 Aug
 2024 22:31:59 +0100
From: Daniel Gomez <da.gomez@samsung.com>
To: Nicolas Schier <nicolas@fjasle.eu>
CC: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor
 <nathan@kernel.org>, Lucas De Marchi <lucas.demarchi@intel.com>,
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
Subject: Re: [PATCH 03/12] file2alias: fix uuid_t definitions for macos
Thread-Topic: [PATCH 03/12] file2alias: fix uuid_t definitions for macos
Thread-Index: AQHa6FXabt2jyI9bkUi8lg+DWdZvjrIb3BUAgABk8gA=
Date: Wed, 7 Aug 2024 21:31:59 +0000
Message-ID: <w7iwghwyhrad4xkfnf3ljit2apvttnbdcgqe7om6spsc7bgzew@cdqc4mb2r5cr>
In-Reply-To: <20240807-sexy-roadrunner-of-acceptance-a84bbf@lindesnes>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [106.210.248.90]
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <F9969BDA2B2AF34C879C0F93942F311A@scsc.local>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02TazCcZxTH+7y3XdKdvEjrSZrbbKXaCAlpedJpO52p1tuLpOqDkY6pHV5k
 yq7sEkVnqoJ2o8YqinVdJuuakrWRdVsTYmWbqDaMS5cSNhJ3Ek0QpdZuOr79znPO//8/58PD
 xW3TOfu454RRrFgoCOdT1kSDbrXH+e6D+pATfYfRrYFSDC0ofwJIV/UQR82bIzjabMjAUd8/
 CxS6WFZLoZX6hxga1ZZjaL5wP/qluoxCRX/qCTSt7iCQaqKfROtNGgz1NhVQ6E5ZGgcZs9oo
 dH9CSSHF0jUC3RsbJFFjgZ5ErbW9FFL1PiZRilRJoh8q71NoUbaJocnWWyTKXp2l0Jysk4MM
 P+cQqE3ez0EVKzkA9XTpOKhB0w3Qg55MgPIMBoBmNFum6tkMEpWmeKCk4bfQ0OU6zvtHmZqi
 GsC06LoppvVJCcE0tddTTKN8hMOUqKKZpJtzJFPWMoUxqiopxRRJizBmM22MZG5ulnIYRUI2
 zhTpfZi2whoOM5rahX0Oz1q/E8yGn7vAio+/F2gd1taUiUfWnf2m6sYalQD+9rwErLiQfhNO
 KOfxS8Caa0tXADgmu2oplgHMl41YiscA9lX3g+eSMXk7ZW6UA9g5mYT9P9WfKrN0bgM4LVXj
 Jsm28+TQXhNT9BtQq1dxTLyHfg2uLyVuC3BasxuWKFK2BXa0F7zRnoibhxhYpjAAM78NmzVt
 mIkJ2gGuDa+QJubR3lCTMbD1zuVa0R/Bxj4n0zOgD8DxyrXtLJy2h38ZizHzCTawNL8FN/PL
 cKPpHmXmY7B7wGg58wS8dllLmJkPCwfzcLOPCxzMzqLMfAr+MaCxsBNUKmZw8zo2UJ9nJEx3
 QTrxRdiTUUWajTxhX9qihe3gdJeaIwPH5Dv2k+/IkO/IkO/IkO/IKAFkFbBnoyURoazETcjG
 uEgEEZJoYahLkChCBbb+zO2NrmUNKJ9ecmkHGBe0A8jF+Xt4F/1UIba8YEFsHCsWfSWODmcl
 7eAVLsG35x0JPsTa0qGCKPZrlo1kxc+7GNdqXwJ2WqovDInP9XOdHzo5tZ4cuNACltVO3W4z
 OUZfx7lYZbr2uzAmPqa0xLGn47xj8cicNissoHx0UlqjYitlnmlPjbucDtscP+/qLuFHRhGz
 Y18eWU3x+dQ5teGg6koQjuo8n/B+33XygsHX78on8GpnQG0O7/rUmQm74EH/M6fhbm+yIGLv
 3X8/8D946l27j4Xuvtqnry8mb+Q1uIocwiM93EdnH7HJNePeHSKv78NFAc9ikxLiGpPi8gU5
 vw7zxl/67c71lsxiWzdv2hk0Dwm8DrwQFJgu/db/1ZhcTPcsPkPxqDn3CyqiQuQUlmLQKtxH
 oz5UVyf8uP8zD6FPtc7hkJBPSMIErkdxsUTwH14Ze1KiBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA02Ta0yTVxiAd75biwnhs8I4I6BLY8xQLJTrwaHOIexzmZvGLSRshHVQQbmU
 tWVO/wwRkctAqmClSqEgINgNKErKtVLkFmUwYcBAoQIqoow1TEcZowM+lvDvOXnf572c5OXi
 vKscJ+6JeLlYGi+K5VObiPvLnWO7+57XHvc4Py5AXUPFGJor+xGgjsppHDVaH+PIWqfA0cDr
 OQqdK6mi0ELtNIbGW8ox9EeBM7pyq4RC6l+7CTRzu41AuslBEi016DHU33CdQg9KsjhoKtdA
 oaeTZRTSmO8Q6IlpmET117tJ1FzVTyFd/zyJUtPLSHSh4imF/syxYuhZcxeJ8iyvKDSb085B
 o5eUBDKoBjno5oISoN7ODg6q0/cA9Lz3MkD5o6MAvdSvFL39SkGi4lQ/lPLIB/1eWs35YCej
 VWsB09TRQzHNb4oIpsFYSzH1qsccpkiXyKTcmyWZkqYXGKOrTKcYdboaY6xZJpK5Zy3mMJqk
 PJxRdx9lDAVaDjOe2YkdgaGCAKkkUS5+N1oik+/lfylEngKhPxJ4evsLhF5+YXs8ffju+wIi
 xbEnvhNL3fd9LYg2NFzGE6pDv69sXaSSwNjBDGDDhbQ3NKmMVAbYxOXRpQBq2qcINuAMa/76
 jWR5C1wazKBWmUebAVywuLLCfQDPDygJ9nETwMEy45pN0a6wpVvHWWV7egdcMievtcBpvR1M
 +TcTrAa20B/BVmMyziYxsEQzCljeAxv1BmyVCXo7XHy0sDaGLX0Y6hVDGNtNicGHhakrApdr
 QwfD+oFdqzmAdoETFYtrjXHaEY5MFWLsCjS80dSLs+wAX0wur6/mBnuGpgDLHvBOacv6+nxY
 MJyPs3UEcDgvl2LZH/YN6dd5FyzTvMTZ2TbD7vwpIgc4qza0Vm3QVRt01QZdtUEvAmQlsBcn
 yuKi4mRCgUwUJ0uMjxJESOJ0YOVE6jostXqgnjELjADjAiOAXJxvb3suRHecZxspOn1GLJWE
 SxNjxTIj8Fn5OwXu5BAhWbmxeHm40NfDR+jt6+/h4+/rxXe0PZSQJuLRUSK5OEYsThBL//cw
 ro1TEnb1gp+5Hck/PqOMnLck+5Zp1fOScL71C7rQvnX6rsZkuJXaln3FxeGHEebDvsPtJ61k
 MD0ymmBqe5DZOTNW83PMdsGE+wFFaH1n5FsBXnAx2q3oYsexi+npP0VoLMF7Z5bkB/IP+b53
 yq5mdnDS81qa3evNhZb0XJd2hcdR3udfFeNB5ccCmoK1fW7X2qqdjbaRBU/KBd/M7Q/8JCwQ
 ++xGILl/iDoSpDIndhLu4W93nH6/4OREyXjI1NmY5S7w7O9sVx+LS5bxzadb00xVeo5fW26s
 SRsoPKujhN9uvWt4J7SR/Cd0XLm74qF3UYZ4RyQRcGpbZdA2ZUjLL1iYY132QT4hixYJd+JS
 meg/iT7qfqsEAAA=
X-CMS-MailID: 20240807213201eucas1p25a7f59876849cf9b6d3a755ceabd1417
X-Msg-Generator: CA
X-RootMTR: 20240807153106eucas1p1d4933e0313419b343e6de66ea84205f8
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20240807153106eucas1p1d4933e0313419b343e6de66ea84205f8
References: <20240807-macos-build-support-v1-0-4cd1ded85694@samsung.com>
 <20240807-macos-build-support-v1-3-4cd1ded85694@samsung.com>
 <CGME20240807153106eucas1p1d4933e0313419b343e6de66ea84205f8@eucas1p1.samsung.com>
 <20240807-sexy-roadrunner-of-acceptance-a84bbf@lindesnes>
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

On Wed, Aug 07, 2024 at 05:30:40PM GMT, Nicolas Schier wrote:
> On Wed, Aug 07, 2024 at 01:09:17AM +0200, Daniel Gomez via B4 Relay wrote=
:
> > From: Daniel Gomez <da.gomez@samsung.com>
> >=20
> > The uuid_t struct defined in sys/types.h on macOS hosts conflicts with
> > the one defined in file2alias, resulting in the typedef redefinition
> > error below. To resolve this conflict, redefine the uuid_t specifically
> > for macOS hosts.
> >=20
> > Error:
> >   HOSTCC  scripts/mod/file2alias.o scripts/mod/file2alias.c:45:3:
> > error: typedef redefinition with different types ('struct uuid_t' vs
> > '__darwin_uuid_t' (aka 'unsigned char[16]'))    45 | } uuid_t;       |
> > ^
> > /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
> >    sys/_types/_uuid_t.h:31:25: note: previous definition is here 31 |
> >    typedef __darwin_uuid_t uuid_t;    |                         ^
> > scripts/mod/file2alias.c:1354:7: error: member reference base
> >  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
> >  'unsigned char[16]') is not a structure or union 1354 |
> >  uuid->b[0], uuid->b[1], uuid->b[2], uuid->b[3], uuid->b[4],      |
> >  ~~~~^ ~
> > /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
> >    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
> >    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
> >    |                                                        ^~~~~~~~~~~
> > scripts/mod/file2alias.c:1354:19: error: member reference base
> >  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
> >  'unsigned char[16]') is not a structure or union 1354 |
> >  uuid->b[0], uuid->b[1], uuid->b[2], uuid->b[3], uuid->b[4],      |
> >  ~~~~^ ~
> > /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
> >    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
> >    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
> >    |                                                        ^~~~~~~~~~~
> > scripts/mod/file2alias.c:1354:31: error: member reference base
> >  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
> >  'unsigned char[16]') is not a structure or union 1354 |
> >  uuid->b[0], uuid->b[1], uuid->b[2], uuid->b[3], uuid->b[4],      |
> >  ~~~~^ ~
> > /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
> >    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
> >    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
> >    |                                                        ^~~~~~~~~~~
> > scripts/mod/file2alias.c:1354:43: error: member reference base
> >  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
> >  'unsigned char[16]') is not a structure or union 1354 |
> >  uuid->b[0], uuid->b[1], uuid->b[2], uuid->b[3], uuid->b[4],      |
> >  ~~~~^ ~
> > /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
> >    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
> >    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
> >    |                                                        ^~~~~~~~~~~
> > scripts/mod/file2alias.c:1354:55: error: member reference base
> >  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
> >  'unsigned char[16]') is not a structure or union 1354 |
> >  uuid->b[0], uuid->b[1], uuid->b[2], uuid->b[3], uuid->b[4],      |
> >  ~~~~^ ~
> > /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
> >    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
> >    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
> >    |                                                        ^~~~~~~~~~~
> > scripts/mod/file2alias.c:1355:7: error: member reference base
> >  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
> >  'unsigned char[16]') is not a structure or union 1355 |
> >  uuid->b[5], uuid->b[6], uuid->b[7], uuid->b[8], uuid->b[9],      |
> >  ~~~~^ ~
> > /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
> >    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
> >    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
> >    |                                                        ^~~~~~~~~~~
> > scripts/mod/file2alias.c:1355:19: error: member reference base
> >  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
> >  'unsigned char[16]') is not a structure or union 1355 |
> >  uuid->b[5], uuid->b[6], uuid->b[7], uuid->b[8], uuid->b[9],      |
> >  ~~~~^ ~
> > /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
> >    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
> >    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
> >    |                                                        ^~~~~~~~~~~
> > scripts/mod/file2alias.c:1355:31: error: member reference base
> >  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
> >  'unsigned char[16]') is not a structure or union 1355 |
> >  uuid->b[5], uuid->b[6], uuid->b[7], uuid->b[8], uuid->b[9],      |
> >  ~~~~^ ~
> > /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
> >    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
> >    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
> >    |                                                        ^~~~~~~~~~~
> > scripts/mod/file2alias.c:1355:43: error: member reference base
> >  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
> >  'unsigned char[16]') is not a structure or union 1355 |
> >  uuid->b[5], uuid->b[6], uuid->b[7], uuid->b[8], uuid->b[9],      |
> >  ~~~~^ ~
> > /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
> >    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
> >    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
> >    |                                                        ^~~~~~~~~~~
> > scripts/mod/file2alias.c:1355:55: error: member reference base
> >  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
> >  'unsigned char[16]') is not a structure or union 1355 |
> >  uuid->b[5], uuid->b[6], uuid->b[7], uuid->b[8], uuid->b[9],      |
> >  ~~~~^ ~
> > /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
> >    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
> >    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
> >    |                                                        ^~~~~~~~~~~
> > scripts/mod/file2alias.c:1356:7: error: member reference base
> >  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
> >  'unsigned char[16]') is not a structure or union 1356 |
> >  uuid->b[10], uuid->b[11], uuid->b[12], uuid->b[13], uuid->b[14],      =
|
> >  ~~~~^ ~
> > /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
> >    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
> >    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
> >    |                                                        ^~~~~~~~~~~
> > scripts/mod/file2alias.c:1356:20: error: member reference base
> >  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
> >  'unsigned char[16]') is not a structure or union 1356 |
> >  uuid->b[10], uuid->b[11], uuid->b[12], uuid->b[13], uuid->b[14],      =
|
> >  ~~~~^ ~
> > /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
> >    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
> >    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
> >    |                                                        ^~~~~~~~~~~
> > scripts/mod/file2alias.c:1356:33: error: member reference base
> >  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
> >  'unsigned char[16]') is not a structure or union 1356 |
> >  uuid->b[10], uuid->b[11], uuid->b[12], uuid->b[13], uuid->b[14],      =
|
> >  ~~~~^ ~
> > /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
> >    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
> >    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
> >    |                                                        ^~~~~~~~~~~
> > scripts/mod/file2alias.c:1356:46: error: member reference base
> >  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
> >  'unsigned char[16]') is not a structure or union 1356 |
> >  uuid->b[10], uuid->b[11], uuid->b[12], uuid->b[13], uuid->b[14],      =
|
> >  ~~~~^ ~
> > /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
> >    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
> >    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
> >    |                                                        ^~~~~~~~~~~
> > scripts/mod/file2alias.c:1356:59: error: member reference base
> >  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
> >  'unsigned char[16]') is not a structure or union 1356 |
> >  uuid->b[10], uuid->b[11], uuid->b[12], uuid->b[13], uuid->b[14],      =
|
> >  ~~~~^ ~
> > /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
> >    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
> >    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
> >    |                                                        ^~~~~~~~~~~
> > scripts/mod/file2alias.c:1357:7: error: member reference base
> >  type 'typeof (((struct tee_client_device_id *)0)->uuid)' (aka
> >  'unsigned char[16]') is not a structure or union 1357 |
> >  uuid->b[15]);      |                 ~~~~^ ~
> > /Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk/usr/include/
> >    secure/_stdio.h:47:56: note: expanded from macro 'sprintf' 47 |
> >    __builtin___sprintf_chk (str, 0, __darwin_obsz(str), __VA_ARGS__)
> >    |                                                        ^~~~~~~~~~~
> > 17 errors generated.
> >=20
> > Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
> > ---
> >  scripts/mod/file2alias.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >=20
> > diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
> > index 99dce93a4188..ab743f6d60ef 100644
> > --- a/scripts/mod/file2alias.c
> > +++ b/scripts/mod/file2alias.c
> > @@ -11,6 +11,9 @@
> >   */
> > =20
> >  #include "modpost.h"
> > +#ifdef __APPLE__
> > +#define uuid_t sys_uuid_t
> > +#endif
> >  #include "devicetable-offsets.h"
> > =20
> >  /* We use the ELF typedefs for kernel_ulong_t but bite the bullet and
> >=20
>=20
> Have you tried to incorporate something like
>=20
>   HOST_EXTRACFLAGS_file2alias.o +=3D -D_UUID_T -D__GETHOSTUUID_H

Thank you for the suggestion. It worked after including the following line =
in
the Makefile:

HOSTCFLAGS_file2alias.o +=3D -D_UUID_T -D__GETHOSTUUID_H

>=20
> for MacOS-based builds into scripts/mod/Makefile (cp. [1])?
>=20
> I think it would be nice to keep cross-os build dependencies in
> Makefiles as far as possible.
>=20
> Kind regards,
> Nicolas
>=20
>=20
> [1]: https://protect2.fireeye.com/v1/url?k=3D74c95bb1-15424ea8-74c8d0fe-7=
4fe485cbfec-af6e3e40b0032f68&q=3D1&e=3D42c5b47d-7d52-4aa1-8a1e-9dbc36fa1953=
&u=3Dhttps%3A%2F%2Fkloenk.eu%2Fposts%2Fbuild-linux-on-m1-macos%2F=

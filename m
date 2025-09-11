Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99252B52D2C
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 11:26:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E54510EA5E;
	Thu, 11 Sep 2025 09:26:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=microsoft.com header.i=@microsoft.com header.b="THHGlCXu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sg2apc01on2131.outbound.protection.outlook.com [40.107.215.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92D5A10EA5E
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 09:26:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zVqiE8qodyznrED14QiOexcCgbUz90kslW4vxybxF0H0OCY4A4mRV68tnUDmAcipUiOHVEwOYc82WMnrXRW4kDXkg89hyzq4BdCC/dkGeuxmyIk06Di+/Qh8+Or9cx09FABAYU4b1C01g5EEluz+mqxVoXHqNiWXM6Ujf0Ddj6abBb1SncEOzgRHEFJmvITJVOsboCz+g1FYZIaG44Sc0kOj8b+YyR+/Bd5OyNBJJz5Rd7DcrAUCxZqrjqu2qIGn1wefArYcbU4rozzfHRA2nxcQJXaw5zddH2FTY4UfRgWIJ9EWJnbYTrFvtNs43Hi9vahZ2atUirsbiV7ONeWSng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TBK23OXsywbgw4hVPUHA5LcDKuySojQzSE8m3JGbyWo=;
 b=MdcQzeTSVW9lz095en1Z1eLFHBfeNDRqyEJW/hZ+MaqfCWTSEU+TQH/We2v7DYo/JJFUWIY5nvE+k33CgOOqG3EMw5KUTkeIf19z+Bl7eSanROHhAp7VQKPYRxkQnDyPLoxM8lP+tgcEBl2p689n5IADwnMR28yNuvPBkMb7jX0hwzchk1HQvoiABPVtxZ8ZdnLyRuh5wZnQlfU9zwHqXnZOPtL5eiDhBWvW6EdLbg0IUfkIC+06GvYRUt9ByD03cHb5jw9A/t9m5cdwA0sonVWieHOLhfdZdyQfDU4YxBPUhMfQ2iOA3yQnrxA5ybcIuFexRWIDsCElmFSgY8HuFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TBK23OXsywbgw4hVPUHA5LcDKuySojQzSE8m3JGbyWo=;
 b=THHGlCXuSMHLnGrxypQ6yWrgIzlZPIYT7B6SXRlDMomSS6ZF58as7JLQLmnDts7Di7IaXx+kWQSziD/WIMIHCEU0dG4qe9dwhrbOqT1ch7wwbD8eS/C840p6aP6053o7zzH1pbKq8R8joQa3+oY30EY3iGSHKdFmRxjp6qkRdpc=
Received: from OSQP153MB1330.APCP153.PROD.OUTLOOK.COM (2603:1096:604:372::16)
 by TYZP153MB0692.APCP153.PROD.OUTLOOK.COM (2603:1096:400:25e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.15; Thu, 11 Sep
 2025 09:26:31 +0000
Received: from OSQP153MB1330.APCP153.PROD.OUTLOOK.COM
 ([fe80::2b00:49bb:7d41:c2dc]) by OSQP153MB1330.APCP153.PROD.OUTLOOK.COM
 ([fe80::2b00:49bb:7d41:c2dc%6]) with mapi id 15.20.9115.010; Thu, 11 Sep 2025
 09:26:30 +0000
From: Meetakshi Setiya <msetiya@microsoft.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Documentation
 <linux-doc@vger.kernel.org>, Linux DAMON <damon@lists.linux.dev>, Linux
 Memory Management List <linux-mm@kvack.org>, Linux Power Management
 <linux-pm@vger.kernel.org>, Linux Block Devices
 <linux-block@vger.kernel.org>, Linux BPF <bpf@vger.kernel.org>, Linux Kernel
 Workflows <workflows@vger.kernel.org>, Linux KASAN
 <kasan-dev@googlegroups.com>, Linux Devicetree <devicetree@vger.kernel.org>,
 Linux fsverity <fsverity@lists.linux.dev>, Linux MTD
 <linux-mtd@lists.infradead.org>, Linux DRI Development
 <dri-devel@lists.freedesktop.org>, Linux Kernel Build System
 <linux-kbuild@vger.kernel.org>, Linux Networking <netdev@vger.kernel.org>,
 Linux Sound <linux-sound@vger.kernel.org>
CC: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
 Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Jonathan Corbet
 <corbet@lwn.net>, SeongJae Park <sj@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>, Lorenzo
 Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport
 <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko
 <mhocko@suse.com>, Huang Rui <ray.huang@amd.com>, "Gautham R. Shenoy"
 <gautham.shenoy@amd.com>, Mario Limonciello <mario.limonciello@amd.com>,
 Perry Yuan <perry.yuan@amd.com>, Jens Axboe <axboe@kernel.dk>, Alexei
 Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii
 Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Eduard
 Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, Yonghong Song
 <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, KP
 Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo
 <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Dwaipayan Ray
 <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Joe
 Perches <joe@perches.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>, Andrey Konovalov
 <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino
 <vincenzo.frascino@arm.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Eric
 Biggers <ebiggers@kernel.org>, "tytso@mit.edu" <tytso@mit.edu>, Richard
 Weinberger <richard@nod.at>, Zhihao Cheng <chengzhihao1@huawei.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Nathan Chancellor
 <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, Ingo Molnar
 <mingo@redhat.com>, Will Deacon <will@kernel.org>, Boqun Feng
 <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, Shay Agroskin <shayagr@amazon.com>, Arthur Kiyanovski
 <akiyano@amazon.com>, David Arinzon <darinzon@amazon.com>, Saeed Bishara
 <saeedb@amazon.com>, Andrew Lunn <andrew@lunn.ch>, Alexandru Ciobotaru
 <alcioa@amazon.com>, The AWS Nitro Enclaves Team
 <aws-nitro-enclaves-devel@amazon.com>, Jesper Dangaard Brouer
 <hawk@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Ranganath V N <vnranganath.20@gmail.com>, Steven French
 <Steven.French@microsoft.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, Bart Van Assche <bvanassche@acm.org>,
 =?iso-8859-1?Q?Thomas_Wei=DFschuh?= <linux@weissschuh.net>, Masahiro Yamada
 <masahiroy@kernel.org>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jani Nikula <jani.nikula@intel.com>
Subject: Re: [EXTERNAL] [PATCH v2 10/13] Documentation: smb: smbdirect:
 Convert KSMBD docs link
Thread-Topic: [EXTERNAL] [PATCH v2 10/13] Documentation: smb: smbdirect:
 Convert KSMBD docs link
Thread-Index: AQHcIf3l00Mre1nk0UWLjBtxz9dfZLSNt5un
Date: Thu, 11 Sep 2025 09:26:30 +0000
Message-ID: <OSQP153MB133044C12B6FFB86DF108725BF09A@OSQP153MB1330.APCP153.PROD.OUTLOOK.COM>
References: <20250910024328.17911-1-bagasdotme@gmail.com>
 <20250910024328.17911-11-bagasdotme@gmail.com>
In-Reply-To: <20250910024328.17911-11-bagasdotme@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2025-09-11T09:26:29.396Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=1;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard; 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSQP153MB1330:EE_|TYZP153MB0692:EE_
x-ms-office365-filtering-correlation-id: 3ed9e36f-e82c-4f44-c11d-08ddf1154a8b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|366016|376014|7416014|921020|38070700021; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?mBGWFTSdoxNR/lbkIR4Da4kAYHa7ahZ6YLFDpVQrpGkWnct1CUpv6frV9F?=
 =?iso-8859-1?Q?YefFV1I20zaV7aTiNolrmYyUTiO7QB0TC/yBs9DHs+PG/LUsjYw9ip83i7?=
 =?iso-8859-1?Q?EEqcpIEWT8MM2coNRzuzYEcqMgeNgJoADT1kuG5OMOxI1c7zLJpJnrUsGz?=
 =?iso-8859-1?Q?ORPLPnPmdKwKdhy9QVkf30jDeVaM5ZQXOA5BJ+PXHeu7cYLC7i6Sdpijx1?=
 =?iso-8859-1?Q?qVK8Q5A3K4k2vEaxdkwws1wYnBkSjJ8m7SNdkPMhXlPAAu2HZa3QSZx67z?=
 =?iso-8859-1?Q?3Bq0As8R1ropE86mEAoA0+iUBLxxSaNCnChCTWP7H24WPUIlAMkH6KLGZ7?=
 =?iso-8859-1?Q?bDIyNqFJ6oMD/MzMDCt8IW/Qlshf9HBqgszA6vvVUsA5ujLnYmfXiA7RxS?=
 =?iso-8859-1?Q?tpSgc38qmp8Yf797+C2yfkuermU8H+ThlDEXnJ5EckFLGnB/ZHpqz+e7Aa?=
 =?iso-8859-1?Q?A8vM20s0yMgcqf9CbsNYpvVcsY5qqp7+EsUK6ea3xcxRYOhmqgXD3M5yvS?=
 =?iso-8859-1?Q?CZl2hQrRnzybM8dTMwxZyhqf8ScNC3r8fbC4PvXqFIRcsbsDeA+dM3uufo?=
 =?iso-8859-1?Q?xG6IclfbR/wcptNl55AFOtqWFy/rpETPm7Kg0Ndf9klt1KUGSDnE1Ukp2b?=
 =?iso-8859-1?Q?0mIMFRD1+wjIS+quDiqG/nAe2vQQFDV7DVWRxi3FG60leUAujbLIZ5mmzl?=
 =?iso-8859-1?Q?Mo3hdvWsHOKdytIkmPhD6JK/4Z65aQmmqVoyVONcMRLQ/kOZ2ng4fPc3un?=
 =?iso-8859-1?Q?MfmimQ3WorMOHs5FYbdPLCpTT5oVILsdd/XVorFdjPgZYUSFwJE/IyC0ZZ?=
 =?iso-8859-1?Q?LwkPMJPAoOt5edepJxpsrnjW/wLkuo+63/yBwvpeE3u6ajkuGrNOMkaNpn?=
 =?iso-8859-1?Q?p47gG/91oxU13IiyAwKhMEziA0NYKLShdRM1BmJ3Mnt9HRW2uxztU1+dAb?=
 =?iso-8859-1?Q?z3JkHj2xNZitl16GYp3MWkET0pgqg6GDDjwrisTyBWPdU3xqov5NDxrkkE?=
 =?iso-8859-1?Q?9DxiZPXKNxrFpCv92Kgw3A0UVjjVxEV+ztwilOQyUeSYXYeHLJkH13hlpE?=
 =?iso-8859-1?Q?yvsDjHz4lIFTPiDWqDLkZLAz5VMZ/h06zRS7p+cDaY08K/8bm5Vudz7rYo?=
 =?iso-8859-1?Q?pC5SABvJqX8GTzUNq5pNN9cYbtCCOkvZsunoyPiFfmj7c2eyHr+Q+NV44j?=
 =?iso-8859-1?Q?kBkw7jh0whjzxzLrbUmI4CD2Kp9CEFZ2xIJ4kQoI0riWZ74GyvB11Yy3bd?=
 =?iso-8859-1?Q?VKiJD+9c/J8eGG1T/s4LjlO1kYpW2sEjQhtgd/UFkS0UOo5qPa6Gj1Xz0C?=
 =?iso-8859-1?Q?4wQ9/GvQN3ru8ws+yc1TUZsuRKX2byIiYTkfG9lZ+9f/KDYyEjtO8C1nY6?=
 =?iso-8859-1?Q?TtD3A5GBQhIEAxGjdsy4Yr8aO3d6jd/RqYr3X8iDZzknixGduJaHyndJvj?=
 =?iso-8859-1?Q?a+WRo4EiikWBXt2IkSQVLWkGiT32phDB0AlaOJdH02UPcZDr9xTDZU1WKh?=
 =?iso-8859-1?Q?Y2mozr2vdoxTb/li2MnmOG?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OSQP153MB1330.APCP153.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(7416014)(921020)(38070700021);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?j4kHAkDUeD6Kepjp54gD2pRReXc3fZLHne+imB/QQoWmrH60eLudcMJ2+1?=
 =?iso-8859-1?Q?hEi4BUaLwtassZEuzaizG6Zr1att6tPtPudpYVWYrMe9OvjevKC1MPmS/d?=
 =?iso-8859-1?Q?dKyhPvAYh5NIHgoVCVBuNK5ffRCD61c+u86quLp63raBxmrfk7/zWjzAn7?=
 =?iso-8859-1?Q?1/JAE5NiCV4YOt8Bh/IE0oSfVeD4GJrKY9AGvW7zsoeWPEaA+PUzTzcFWP?=
 =?iso-8859-1?Q?GIZURXawycmjsXaXLipx1NWz5yL9zlmjh17egPbviAg1nHFLuPt75xaos3?=
 =?iso-8859-1?Q?Kx7eXhA5cOzV60Xl3KJvEenbxFQe6VhB9lo6frZv52S0qFQqF7zZypfREq?=
 =?iso-8859-1?Q?yyONhdDxAphIasOqe4hd4xtgqYDWs25+0fSQHqlYqFXeUvZD69IDJhgCsj?=
 =?iso-8859-1?Q?LCyZfiyyqZofo94QPVDJHKkHcB0H+IBLzEN55qCmT1sKThaaxWnK49A8lW?=
 =?iso-8859-1?Q?FgiQad8xVs13fAIGiF4HMOV46AjkjHwZ5DuznCzR99yUs4Uj51YbwwDx+5?=
 =?iso-8859-1?Q?SyVcwYoEzBu6aIfSpICH32C2dQI1DMZtzz1sTi3A0XMilUKm96ACIajnLN?=
 =?iso-8859-1?Q?OmAmJNSRdufr2LK8gJEIRRtlyJHU0ljSs2IwBSGeSplmJZAv2qCixFm78L?=
 =?iso-8859-1?Q?k7DDRh8myW8cCSRRwpmFkmfiQG6o1e8NlFOljR5S2dQaXaQtNTGyNm1EWa?=
 =?iso-8859-1?Q?V+2oy4M1QSAdKdyAG6A4scQCOPJA7tAdQzmPmZOTgtnOBn0cU+PFRwSIBY?=
 =?iso-8859-1?Q?WtZOTUO7WbX2r8Iy0XbJ/sBMQnmCm9iu40EOQrDGTPBRJCWRWVKk1hhpqE?=
 =?iso-8859-1?Q?0cULcOpjftDD8Gdx5Bc7OdDxQgKG8SZmIev+rU4q83Hv6rsELEtUupEEW0?=
 =?iso-8859-1?Q?IP66mjE2MFiTU4Ux9VyFUEg9msyiI1WG9JJxRNJJ9OZuox6ejVurSJBL/k?=
 =?iso-8859-1?Q?4CxWn44FMqdHHMGsZPw8pQQCQL7scobgIISBjImAvp1CyWHvSPE1nQWtGO?=
 =?iso-8859-1?Q?kG4RrCl8TO9VItEOhdAG0GbJTJuiw7xu/DA220cXhKHz7lzkZCgkWbuEeR?=
 =?iso-8859-1?Q?2wbS9JHNdthL1RjVa6Pd1jQ/Pkv1QIvcTXhq5HzK9QhiKe8MfVp0+TauJb?=
 =?iso-8859-1?Q?aXr/f2FncE8Zndf0bPTB8qqhKpW0ow/o5Ln7MQdLWrlybVx2UJcN6U7doM?=
 =?iso-8859-1?Q?z9ShcgL+KCt6U5Qgnqklw6AOiwwTJoXSiirIP/w8AfH+XTWTOx1+CivlI1?=
 =?iso-8859-1?Q?gQyfvDtb0BLZ8B8zEw0+XWqtrl9EjStuULlLYgnTCjUVFIKTYTQ1M1vyhl?=
 =?iso-8859-1?Q?Ufi9RHy6c0QTPKAB4B75qCsdNNTHY0p+xtpiDt6jRxeYupf7boep0jvrb7?=
 =?iso-8859-1?Q?xQLhSVa8OLV0TQzzmDQdO4+sAHvEFZ4cpiw6egt5Wpt94JWroS8pNQJVvg?=
 =?iso-8859-1?Q?ISfbBgmOTFUbvz6ydDY3WqjgL1DIG8oP45KWiVyww+hOZcOQ4+u0s49Roo?=
 =?iso-8859-1?Q?bLU6EzLRJeSkCOvNLtuRbt25B4f5SPXgZgFZsCML2q3cuXDpx31FFlEgqn?=
 =?iso-8859-1?Q?CjafVAwQM/cPx18NRnGmSrcIFHY//TeBh4NGMesYHG3FOc96sUW0ILj8qK?=
 =?iso-8859-1?Q?1CBMihiV0Xoxw=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSQP153MB1330.APCP153.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ed9e36f-e82c-4f44-c11d-08ddf1154a8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2025 09:26:30.3194 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U/Q8DJoatsv2sSbzzxhnTu+diP/JdGZvQa8EpnmBnmF4xCP5rfCXyVfhnTj1QLr+6Ma0IZQMVGeQWUBCJlsc0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZP153MB0692
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

Reviewed-by: Meetakshi Setiya <msetiya@microsoft.com>

Thanks
Meetakshi

________________________________________
From: Bagas Sanjaya <bagasdotme@gmail.com>
Sent: 10 September 2025 08:13
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>; Linux Documen=
tation <linux-doc@vger.kernel.org>; Linux DAMON <damon@lists.linux.dev>; Li=
nux Memory Management List <linux-mm@kvack.org>; Linux Power Management <li=
nux-pm@vger.kernel.org>; Linux Block Devices <linux-block@vger.kernel.org>;=
 Linux BPF <bpf@vger.kernel.org>; Linux Kernel Workflows <workflows@vger.ke=
rnel.org>; Linux KASAN <kasan-dev@googlegroups.com>; Linux Devicetree <devi=
cetree@vger.kernel.org>; Linux fsverity <fsverity@lists.linux.dev>; Linux M=
TD <linux-mtd@lists.infradead.org>; Linux DRI Development <dri-devel@lists.=
freedesktop.org>; Linux Kernel Build System <linux-kbuild@vger.kernel.org>;=
 Linux Networking <netdev@vger.kernel.org>; Linux Sound <linux-sound@vger.k=
ernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>; Borislav Petkov <bp@alien8.de>; P=
eter Zijlstra <peterz@infradead.org>; Josh Poimboeuf <jpoimboe@kernel.org>;=
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>; Jonathan Corbet <corbet@l=
wn.net>; SeongJae Park <sj@kernel.org>; Andrew Morton <akpm@linux-foundatio=
n.org>; David Hildenbrand <david@redhat.com>; Lorenzo Stoakes <lorenzo.stoa=
kes@oracle.com>; Liam R. Howlett <Liam.Howlett@oracle.com>; Vlastimil Babka=
 <vbabka@suse.cz>; Mike Rapoport <rppt@kernel.org>; Suren Baghdasaryan <sur=
enb@google.com>; Michal Hocko <mhocko@suse.com>; Huang Rui <ray.huang@amd.c=
om>; Gautham R. Shenoy <gautham.shenoy@amd.com>; Mario Limonciello <mario.l=
imonciello@amd.com>; Perry Yuan <perry.yuan@amd.com>; Jens Axboe <axboe@ker=
nel.dk>; Alexei Starovoitov <ast@kernel.org>; Daniel Borkmann <daniel@iogea=
rbox.net>; Andrii Nakryiko <andrii@kernel.org>; Martin KaFai Lau <martin.la=
u@linux.dev>; Eduard Zingerman <eddyz87@gmail.com>; Song Liu <song@kernel.o=
rg>; Yonghong Song <yonghong.song@linux.dev>; John Fastabend <john.fastaben=
d@gmail.com>; KP Singh <kpsingh@kernel.org>; Stanislav Fomichev <sdf@fomich=
ev.me>; Hao Luo <haoluo@google.com>; Jiri Olsa <jolsa@kernel.org>; Dwaipaya=
n Ray <dwaipayanray1@gmail.com>; Lukas Bulwahn <lukas.bulwahn@gmail.com>; J=
oe Perches <joe@perches.com>; Andrey Ryabinin <ryabinin.a.a@gmail.com>; Ale=
xander Potapenko <glider@google.com>; Andrey Konovalov <andreyknvl@gmail.co=
m>; Dmitry Vyukov <dvyukov@google.com>; Vincenzo Frascino <vincenzo.frascin=
o@arm.com>; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@ker=
nel.org>; Conor Dooley <conor+dt@kernel.org>; Eric Biggers <ebiggers@kernel=
.org>; tytso@mit.edu <tytso@mit.edu>; Richard Weinberger <richard@nod.at>; =
Zhihao Cheng <chengzhihao1@huawei.com>; Maarten Lankhorst <maarten.lankhors=
t@linux.intel.com>; Maxime Ripard <mripard@kernel.org>; Thomas Zimmermann <=
tzimmermann@suse.de>; David Airlie <airlied@gmail.com>; Simona Vetter <simo=
na@ffwll.ch>; Nathan Chancellor <nathan@kernel.org>; Nicolas Schier <nicola=
s.schier@linux.dev>; Ingo Molnar <mingo@redhat.com>; Will Deacon <will@kern=
el.org>; Boqun Feng <boqun.feng@gmail.com>; Waiman Long <longman@redhat.com=
>; David S. Miller <davem@davemloft.net>; Eric Dumazet <edumazet@google.com=
>; Jakub Kicinski <kuba@kernel.org>; Paolo Abeni <pabeni@redhat.com>; Simon=
 Horman <horms@kernel.org>; Shay Agroskin <shayagr@amazon.com>; Arthur Kiya=
novski <akiyano@amazon.com>; David Arinzon <darinzon@amazon.com>; Saeed Bis=
hara <saeedb@amazon.com>; Andrew Lunn <andrew@lunn.ch>; Alexandru Ciobotaru=
 <alcioa@amazon.com>; The AWS Nitro Enclaves Team <aws-nitro-enclaves-devel=
@amazon.com>; Jesper Dangaard Brouer <hawk@kernel.org>; Bagas Sanjaya <baga=
sdotme@gmail.com>; Laurent Pinchart <laurent.pinchart@ideasonboard.com>; Ra=
nganath V N <vnranganath.20@gmail.com>; Steven French <Steven.French@micros=
oft.com>; Meetakshi Setiya <msetiya@microsoft.com>; Greg Kroah-Hartman <gre=
gkh@linuxfoundation.org>; Martin K. Petersen <martin.petersen@oracle.com>; =
Bart Van Assche <bvanassche@acm.org>; Thomas Wei=DFschuh <linux@weissschuh.=
net>; Masahiro Yamada <masahiroy@kernel.org>; Mauro Carvalho Chehab <mcheha=
b+huawei@kernel.org>; Jani Nikula <jani.nikula@intel.com>
Subject: [EXTERNAL] [PATCH v2 10/13] Documentation: smb: smbdirect: Convert=
 KSMBD docs link

Convert KSMBD docs link to internal link.

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/filesystems/smb/smbdirect.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/filesystems/smb/smbdirect.rst b/Documentation/fi=
lesystems/smb/smbdirect.rst
index ca6927c0b2c084..6258de919511fa 100644
--- a/Documentation/filesystems/smb/smbdirect.rst
+++ b/Documentation/filesystems/smb/smbdirect.rst
@@ -76,8 +76,8 @@ Installation
 Setup and Usage
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

-- Set up and start a KSMBD server as described in the `KSMBD documentation
-  <https://www.kernel.org/doc/Documentation/filesystems/smb/ksmbd.rst>`_.
+- Set up and start a KSMBD server as described in the :doc:`KSMBD document=
ation
+  <ksmbd>`.
   Also add the "server multi channel support =3D yes" parameter to ksmbd.c=
onf.

 - On the client, mount the share with `rdma` mount option to use SMB Direc=
t
--
An old man doll... just what I always wanted! - Clara

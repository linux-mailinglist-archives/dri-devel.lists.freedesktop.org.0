Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F09142A55
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2020 13:15:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58CD96E928;
	Mon, 20 Jan 2020 12:15:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::60a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1088D6E925;
 Mon, 20 Jan 2020 12:15:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GLboq9TEBqpbBECml8csOAI9PMnffLRxQ4s2za3ubDtTj6oKRh72GsMIqYq317uzxXPycE1U3dJPeJ7+85M+XhMC4msNmbQn1y9GK8PVSiazEkrNLqB2fk9bEMlvhpUWjsIUiLb2Xrg+isvDx48sNMXh9072aORl9K0lFQQEi4Lj3Dc2VG4BiUAOSFw5vqZyeTParXTjnIoF1Gah6lXPdanYI0nxptkerZefHISa/WBDhcRhs3LpTPPqtZXOPaXbrkT+x3X7UPePwOFPAnMhp/PMk8sEeqNrsPaeKVtjIonSv7zgYuzWcSI00yaJf6gfnJoaeXr1wed+6wcCVM71xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f7fy1tCOU8PFTG2of3luuAICqGoAd2EZhart9NygXOQ=;
 b=F0S0q/xsQY7xN60zSEUV0Qo1TfYmuzCxTzDLxyQAefeWdpGo7L7PECqSgVyDGoG1ZOuAMFjcfmUpHvEXbgDTczaQGtq8XVhKZ1OFAl+UD/Y/tm5yed9Vytxhp42tBWP/cdKTGC+/mHfuzLjXFtViaIMcY0GzulgldADKIx09aAm9xZHb+suMHLj6mc3HyV3td3Az8Ghtan1sbncEJEQk6GZES/PQ7VMv2wZQYBZDi1b8nYAFDxcKV7oHzn5wRXUSEj3AgMFE14nG0jY4dQ0WPV0M1qxQO+gUQFTeFZ0xQu/Z7BXZVw5PDsdSR4ghgq3iNkKDxgu8xyDcmez6FcX5SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f7fy1tCOU8PFTG2of3luuAICqGoAd2EZhart9NygXOQ=;
 b=hTm01gaKleZA+5aFMFv3j1XrtEItVw5GEuWBep12NN4fNaVjm8WFjc2r1qfPTM7rlhHpsKZWg4JO8yWNDJD/6r88NKiX2HPBKSf63GgYV9dGVYBYuWl45cmtQNV4Kh5H18XK3LhLfn2iwbNCgenDwxT/wxsKbfHchfZxD+OK2/I=
Received: from MN2PR05MB6141.namprd05.prod.outlook.com (20.178.241.217) by
 MN2PR05MB6063.namprd05.prod.outlook.com (20.178.241.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.15; Mon, 20 Jan 2020 12:15:42 +0000
Received: from MN2PR05MB6141.namprd05.prod.outlook.com
 ([fe80::b4a2:5c46:955a:2850]) by MN2PR05MB6141.namprd05.prod.outlook.com
 ([fe80::b4a2:5c46:955a:2850%7]) with mapi id 15.20.2665.015; Mon, 20 Jan 2020
 12:15:42 +0000
From: Thomas Hellstrom <thellstrom@vmware.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, "airlied@linux.ie"
 <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>, "David1.Zhou@amd.com"
 <David1.Zhou@amd.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "patrik.r.jakobsson@gmail.com"
 <patrik.r.jakobsson@gmail.com>, "robdclark@gmail.com" <robdclark@gmail.com>,
 "sean@poorly.run" <sean@poorly.run>, "benjamin.gaignard@linaro.org"
 <benjamin.gaignard@linaro.org>, "vincent.abriou@st.com"
 <vincent.abriou@st.com>, "yannick.fertre@st.com" <yannick.fertre@st.com>,
 "philippe.cornu@st.com" <philippe.cornu@st.com>, "mcoquelin.stm32@gmail.com"
 <mcoquelin.stm32@gmail.com>, "alexandre.torgue@st.com"
 <alexandre.torgue@st.com>, "eric@anholt.net" <eric@anholt.net>,
 "rodrigosiqueiramelo@gmail.com" <rodrigosiqueiramelo@gmail.com>,
 "hamohammed.sa@gmail.com" <hamohammed.sa@gmail.com>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 "bskeggs@redhat.com" <bskeggs@redhat.com>, "harry.wentland@amd.com"
 <harry.wentland@amd.com>, "sunpeng.li@amd.com" <sunpeng.li@amd.com>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v3 20/22] drm/vmwgfx: Convert to CRTC VBLANK callbacks
Thread-Topic: [PATCH v3 20/22] drm/vmwgfx: Convert to CRTC VBLANK callbacks
Thread-Index: AQHVz2r2D5dcUIrxVEGgJH3SOH/fbg==
Date: Mon, 20 Jan 2020 12:15:42 +0000
Message-ID: <MN2PR05MB6141E734C31A7173C906E76DA1320@MN2PR05MB6141.namprd05.prod.outlook.com>
References: <20200120082314.14756-1-tzimmermann@suse.de>
 <20200120082314.14756-21-tzimmermann@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=thellstrom@vmware.com; 
x-originating-ip: [155.4.205.35]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 18d5d898-5aeb-4045-abfa-08d79da2787c
x-ms-traffictypediagnostic: MN2PR05MB6063:|MN2PR05MB6063:
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR05MB6063E94D6317B4C03CC929CFA1320@MN2PR05MB6063.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:353;
x-forefront-prvs: 0288CD37D9
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(136003)(396003)(366004)(346002)(189003)(199004)(52536014)(7406005)(478600001)(7416002)(2906002)(4326008)(76116006)(91956017)(5660300002)(33656002)(54906003)(8676002)(6506007)(110136005)(8936002)(7696005)(81156014)(81166006)(71200400001)(4744005)(66946007)(186003)(26005)(53546011)(66446008)(64756008)(66556008)(9686003)(66476007)(86362001)(55016002)(316002)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR05MB6063;
 H:MN2PR05MB6141.namprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: vmware.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gTS13OmDCu41gFeOJ0tL99sairAGpV1UOOw/CeBvo+IGQf0NnmUqrIrLOiaDWdFGsAvaS53eco565ZcX2UgJub7YITDEj2djPc9ULQICtr1hiSYdRkOsgvTqJ6QClY60h9s/8Zwd8idpCxfMwJDUpPhaR4m6XKgX2kkjvwvifq3f8w9rE2qLv2DR/K96eygLDJFqHOAAeO4N5ulsZcSJ4CRKG9CTrORQ6ezmcZrtMueG7/wd1NAg+anMRZEYwoka5ATJUMtZSYr9QzYEHuREpPyXaDavgYU68ovV+oQscWUWDkU7oN0hVjiRSfYuGzVfnTJ0W/Ehve7q5hUXDpaCAn7C3FC5zYA46MYofkMarq3H4l4GmwyxT7atZJPAwm/GBgYB4f3B9rRfDXwfBTyceFBepfLmn4aLv6M3z7Dax+UK+RKbZWUFkqFCJNC1H1Vy2BEsUxGaIiLxPhrGlAkRe/vepjGd8+LTJM3mKCM6vveaSbl4k6jHQuAkY0NJ15BQ
x-ms-exchange-antispam-messagedata: NnVnI+tyE4XZ6Z0baPJS2ROkhwgUCAnuVHlH4IKdH9Ja6jSOBsq5nwz0lPrfnAFTeb4QoRZm0mwDGV7RrQbhLjeQ2S2WT8Fy+qjQHH79eo/HeMpaPVjvHy72Sl/wxjk2gd57tRJsjPJzyrzL89VodQ==
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18d5d898-5aeb-4045-abfa-08d79da2787c
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2020 12:15:42.5914 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wGW98KMO66TGAJaYVtYiCVkKqbePUPcT9Y2/2QYzi+dSHKaR8I7uGYZCEQdcVzBqXtnpXKIJCTAiYiC7UiSGnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB6063
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
Cc: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/20/20 9:23 AM, Thomas Zimmermann wrote:
> VBLANK callbacks in struct drm_driver are deprecated in favor of
> their equivalents in struct drm_crtc_funcs. Convert vmwgfx over.
>
> v2:
> 	* remove accidental whitespace fixes
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.c  | 3 ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.h  | 6 +++---
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.c  | 6 +++---
>  drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c  | 3 +++
>  drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c | 3 +++
>  drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c | 3 +++
>  6 files changed, 15 insertions(+), 9 deletions(-)
>
Acked-by: Thomas Hellstrom <thellstrom@vmware.com>


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

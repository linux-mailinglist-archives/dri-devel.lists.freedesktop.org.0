Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6DA3E9AC3
	for <lists+dri-devel@lfdr.de>; Thu, 12 Aug 2021 00:12:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ACC56E198;
	Wed, 11 Aug 2021 22:12:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2059.outbound.protection.outlook.com [40.107.220.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D37C6E198;
 Wed, 11 Aug 2021 22:12:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oPAUHwoHrUwOY3l/Gx8U8a848f6RNh7OgloC0q6gl7RSXe++P1UMhq/VOeWgsEqgyx1jcqWCXbJyYS3sN+F7d41iAnlGShypR7hKQmoWC09CFLcYu7ZRO3/v80Klq5cqcds15fTDU1o2DxSY0GJfVZx2BtFlCJJVEqHXDaxcWhZ2yA4WEiV/UXAJDFV4T6LwE8fufKoAV6n1YSpYxq6AoYPFyVNj2s4B2hTbnYrW8pR/YUZ3BZHxmgif00eP2+NyL4CR0+LD2Fn80RNVQ1cm8FnbshrTtQ1H4w1/NfiotV2GAPMKxDkwMOpXivZFTrQh1tNJVS0u6VqOFzNeT2tjSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oBmk64FYtrjpm9i8g8YXl9SB/XDx+qG6+3jzOjjrq7w=;
 b=WYlJ6b8VTLIomj2qJAwng16ZSkHkCv7Aa4kTa4yWvEyWyeLm4EICdgWPGDnTsCl1oEYZFZtaM3Gp78ZbGDFOjeIjfUQKQGDnKPW/Hj0LYY5/QOtxOatokQQMiSALD5TwauAt8TKK1CqU2WheCSXxtOw+3IHf1XPpTvu1HK3D3VsbhOXBfg8SM0tkTKWjD3n6g2qiAQeF3ofK+nEd5m0vbd/DY8YXYO4vdbENR+DWygpx64fenidawulEUMNnl0NtkVxJA+wSag44V7W2SfeSUjNRNXz/l/5ACll4CD3zUqIh/vCLc2oA7GxTVkUEBPBIDFAsuHJRggQJSw0bfgPI4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oBmk64FYtrjpm9i8g8YXl9SB/XDx+qG6+3jzOjjrq7w=;
 b=lwuDC1wqKbWK9oMbFfGk7v2+rIETho5NgW0psZxl1dOlXk7s/NRTqU+H0vB1ahWFYotekoN5SdHCNDOAsmhFDva02UJ0ZZstwuJGsfQd8d+vYsifgfYBJ7A0O0e6JftXdSdukcylohKP0+SXveyegVlD5cw2uoZRehpRYfQNVYE=
Received: from DM5PR12MB2517.namprd12.prod.outlook.com (2603:10b6:4:bb::13) by
 DM6PR12MB4404.namprd12.prod.outlook.com (2603:10b6:5:2a7::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.16; Wed, 11 Aug 2021 22:12:44 +0000
Received: from DM5PR12MB2517.namprd12.prod.outlook.com
 ([fe80::2560:34ab:f08a:3248]) by DM5PR12MB2517.namprd12.prod.outlook.com
 ([fe80::2560:34ab:f08a:3248%3]) with mapi id 15.20.4394.023; Wed, 11 Aug 2021
 22:12:44 +0000
From: "Zhu, James" <James.Zhu@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 =?iso-8859-1?Q?Michel_D=E4nzer?= <michel@daenzer.net>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>
CC: "Liu, Leo" <Leo.Liu@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/amdgpu: Use mod_delayed_work in JPEG/UVD/VCE/VCN
 ring_end_use hooks
Thread-Topic: [PATCH 2/2] drm/amdgpu: Use mod_delayed_work in JPEG/UVD/VCE/VCN
 ring_end_use hooks
Thread-Index: AQHXjtE+3YKNVwRF7EO/RHavM7Obqatu05sAgAAGs1g=
Date: Wed, 11 Aug 2021 22:12:44 +0000
Message-ID: <DM5PR12MB2517A081A60C1245D2A34019E4F89@DM5PR12MB2517.namprd12.prod.outlook.com>
References: <20210811165211.6811-1-michel@daenzer.net>,
 <20210811165211.6811-2-michel@daenzer.net>,
 <MN2PR12MB377506AD71308A47222A3E9583F89@MN2PR12MB3775.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB377506AD71308A47222A3E9583F89@MN2PR12MB3775.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=True;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-08-11T22:12:42.900Z;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD
 Official Use
 Only; MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard; 
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8751ec2f-1089-4ba2-5908-08d95d1524f2
x-ms-traffictypediagnostic: DM6PR12MB4404:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB440490134263994CEC8B5737E4F89@DM6PR12MB4404.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HG4aHOSZmeomd25ISS2045zjyRXHyJdiLvUltns9Kv+5SAVA97AO/sb9dwBbvOQayRl1lBCkguJAC0voAnULvCPAb9nPiG4pokwAZyGItO6qWkdy4Qa/1ljb36d38SK96e7xkeZmWDcD4QIOk1UuIOyinlPQjmN9eFw+zJHw18uug+c1H+dTlAZ65ydKLPhJWEatH+4MvTsU4rPHhY0LBesI2Jk16IO8oXzHFzv2QZZgvCagAi1UourIn8ZoLy5W4+kWdHT8pEGGixyhb9Zoz/iQ/tDGUPEiGi8eArBpnuCBa7zaYasjDhb46ZbWiGLNlbbtkegM9008r7R76aHbNQJ66ovyBTedgDaCY608euwD/KJ7nLG/E7mZa0YapFARWS3WAc7tHCWCbByJhzxq+Z7RSFZtjVU1q0siuFwwxf606UtJpIwF0r0vLP5rM3T176z4pc/c31k7MHwQlsmHx6JNlrEmQAovN9XKb0UpNll8mww3KukuuCRzNBjyPjB3PjRRwrJBxRVA9vz4AbfXLhrAUH1ZJCPZKDS6gxHokU8S/ZcUQNE+hkABP+LpzXorXMEciWmn6eYMvOu0U3CLOOW5UhOe5edRzSucuZ8EMtf2cXo9Lt6FXOcubYv027rSQ9PA6BemQvnU/dy6WPR4MGI0pluWArBOkKkceo5i2ujOL8YitbmecHmFZGHzH3alS0RwcEuCKaihy5GMBtDdmw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB2517.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(396003)(39860400002)(136003)(366004)(8936002)(52536014)(316002)(54906003)(33656002)(26005)(7696005)(2906002)(38100700002)(478600001)(53546011)(6506007)(5660300002)(6636002)(8676002)(122000001)(110136005)(9686003)(186003)(91956017)(71200400001)(55016002)(83380400001)(76116006)(66476007)(66556008)(66446008)(19627405001)(66946007)(86362001)(38070700005)(4326008)(64756008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?53XlxQoB+dUlWggIkKrwR37vYdoMPeVB0W1wy63BYcPNbwTqyuz2Efjuo0?=
 =?iso-8859-1?Q?oo/7wx2YnttikKb9IXFwrXIbKLBS8qGIAGjIqTE3ppqkSWZMzpkK5Pt4Ok?=
 =?iso-8859-1?Q?7zvpDRY93QkWC/3pxdLpQmMTdVxo/Lz6TTydw6ZbP/+JCNZGPcTGvnoqUs?=
 =?iso-8859-1?Q?LnGrxCUYjR5k4VdMtek3Q2rhfONfCcuXC5AEUOvffqrFxyCpUXG1A1f4cv?=
 =?iso-8859-1?Q?zyxb/ihRDGTPFD4n9MNg2aZeGfJsJ1NuRKf+61IFXPX9Amqparfk7uvlpu?=
 =?iso-8859-1?Q?kb1Xj4JwpWvh1Fpz+i9HvdG9Kxnk2hvjiebJOT6muSYylNa6FHaFBqHM+Q?=
 =?iso-8859-1?Q?5734KZanLjHoGb9+g+nbo0q7LDA6pbdJSRRxnNWsJliT+FMC8JOpD2jrTa?=
 =?iso-8859-1?Q?yNwZ38B5w68jpyk3D2bp1mHiG2xfORwJ+ctOK1/D+OLzOjEwCPRg5PTJDy?=
 =?iso-8859-1?Q?OgdDy5qpV4Qt3bpmrItjkHHnRGSCbb1c6TsffBH2+2oSExRLaNV/TlIxWh?=
 =?iso-8859-1?Q?PVpG/n7JVDHgIeDtXXlO4UJkrXkYEQ1DTdRqQlB8kkcuLYRZmp16QcjRdP?=
 =?iso-8859-1?Q?Qu+NdqJdtC8ZA6qN53rM7/YSR9Lr3Q9xEOBLakq/rH5Ls2OCc6nDSsqKoG?=
 =?iso-8859-1?Q?uQ5jHD0iq9zIH1DLY9wulOu3T/AA0Y/UQ2Kx3WH6hjgYU4GtClp9cTan6z?=
 =?iso-8859-1?Q?cOH7DUI6AF1MfSnHybTXOCF6jmOTTda0Z5yKblGmqPcfH/dd3f3CfbYw4P?=
 =?iso-8859-1?Q?jWQ8Jki/YplEAi7zxo6Sz7u35rjSEyxxyNd/DPmCpMqr5WFOUAopI2V9dt?=
 =?iso-8859-1?Q?a5fV/ona3RsfH4MXHeWvMpkqlHM0KQDg8xwgzzcHbze9VqcbS/EfPdXRtz?=
 =?iso-8859-1?Q?XpMy/RIaXLtm/wOvkoY+eqsygevCQ7wpVHmuK5o7BQ1KPjkPsKkyOyzArR?=
 =?iso-8859-1?Q?fDPgHVS/YJZqlyZ4ZuzwKXwex4Ye7ydPvP8hHjA9tQbCKPKdg6hPvlQZ4r?=
 =?iso-8859-1?Q?tDZ0WIGX+EUkgS4Z8PxZwOY/zKIWYaRKTBkbSio/Jf5Xz40PWh1iPO9DFg?=
 =?iso-8859-1?Q?mF0g7rKKpLlKWYL2Pav8wNgCpNqAPwnUCTm9ggtatRpdztN9+UOsfLXQ2v?=
 =?iso-8859-1?Q?3VeTjz1WTuvN23Ink9sCJdpNTSfMsc6UAUvpAbiZ6I9iYzkt4WCMbtNBRk?=
 =?iso-8859-1?Q?9tWKxgiTdPux5+qW36oVkaSDi7oy77UCKqhMrM7qBsdMrtihBWvMGU4tkP?=
 =?iso-8859-1?Q?vKMxN6TOeQfB4FU6rlaoa9+63N/LzJ6Yn9v8ajNkRlRSCEg0M5GGwe6kfm?=
 =?iso-8859-1?Q?oYuM6nd0GRz0cwYLRLbAReNbbdkd+Sal4z0wAfLdQMEe0ohCGJgcHbcA9O?=
 =?iso-8859-1?Q?IMoiC22s6w?=
Content-Type: multipart/alternative;
 boundary="_000_DM5PR12MB2517A081A60C1245D2A34019E4F89DM5PR12MB2517namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB2517.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8751ec2f-1089-4ba2-5908-08d95d1524f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2021 22:12:44.3635 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nK/YuKs12UnC7J1AiUFs0Zf85ZY3XWyIQtE1LHrI/EE6Hy1fZNuSyYXPUD1tXMg1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4404
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

--_000_DM5PR12MB2517A081A60C1245D2A34019E4F89DM5PR12MB2517namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only]

Hi Christian,

Since we have strict check on queue status, I don't think original design c=
an cause issue here.
But this change should help improve below case:

  1.  both enc thread and dec thread try to start begin_use.
  2.  dec thread gets the chance to finish begin_use process first.
  3.  before dec thread enters end_use, enc thread gets time slot to run th=
rough begin_use(No delay work scheduled at that time)
  4.  dec thread enters end_use, scheduled a delay work
  5.   enc thread enters end_use, modify this delay work.

It will help reduce one delay work call at least.


Thanks & Best Regards!


James Zhu

________________________________
From: Koenig, Christian <Christian.Koenig@amd.com>
Sent: Wednesday, August 11, 2021 5:34 PM
To: Michel D=E4nzer <michel@daenzer.net>; Deucher, Alexander <Alexander.Deu=
cher@amd.com>
Cc: Liu, Leo <Leo.Liu@amd.com>; Zhu, James <James.Zhu@amd.com>; amd-gfx@lis=
ts.freedesktop.org <amd-gfx@lists.freedesktop.org>; dri-devel@lists.freedes=
ktop.org <dri-devel@lists.freedesktop.org>
Subject: AW: [PATCH 2/2] drm/amdgpu: Use mod_delayed_work in JPEG/UVD/VCE/V=
CN ring_end_use hooks

NAK to at least this patch.

Since activating power management while submitting work is problematic canc=
el_delayed_work() must have been called during begin use or otherwise we ha=
ve a serious coding problem in the first place.

So this change shouldn't make a difference and I suggest to really stick wi=
th schedule_delayed_work().

Maybe add a comment how this works?

Need to take a closer look at the first patch when I'm back from vacation, =
but it could be that this applies there as well.

Regards,
Christian.

________________________________
Von: Michel D=E4nzer <michel@daenzer.net>
Gesendet: Mittwoch, 11. August 2021 18:52
An: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian <Chri=
stian.Koenig@amd.com>
Cc: Liu, Leo <Leo.Liu@amd.com>; Zhu, James <James.Zhu@amd.com>; amd-gfx@lis=
ts.freedesktop.org <amd-gfx@lists.freedesktop.org>; dri-devel@lists.freedes=
ktop.org <dri-devel@lists.freedesktop.org>
Betreff: [PATCH 2/2] drm/amdgpu: Use mod_delayed_work in JPEG/UVD/VCE/VCN r=
ing_end_use hooks

From: Michel D=E4nzer <mdaenzer@redhat.com>

In contrast to schedule_delayed_work, this pushes back the work if it
was already scheduled before. Specific behaviour change:

Before:

The scheduled work ran ~1 second after the first time ring_end_use was
called, even if the ring was used again during that second.

After:

The scheduled work runs ~1 second after the last time ring_end_use is
called.

Inspired by the corresponding change in amdgpu_gfx_off_ctrl. While I
haven't run into specific issues in this case, the new behaviour makes
more sense to me.

Signed-off-by: Michel D=E4nzer <mdaenzer@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c  | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c  | 2 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c    | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c b/drivers/gpu/drm/amd=
/amdgpu/amdgpu_jpeg.c
index 8996cb4ed57a..2c0040153f6c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
@@ -110,7 +110,7 @@ void amdgpu_jpeg_ring_begin_use(struct amdgpu_ring *rin=
g)
 void amdgpu_jpeg_ring_end_use(struct amdgpu_ring *ring)
 {
         atomic_dec(&ring->adev->jpeg.total_submission_cnt);
-       schedule_delayed_work(&ring->adev->jpeg.idle_work, JPEG_IDLE_TIMEOU=
T);
+       mod_delayed_work(system_wq, &ring->adev->jpeg.idle_work, JPEG_IDLE_=
TIMEOUT);
 }

 int amdgpu_jpeg_dec_ring_test_ring(struct amdgpu_ring *ring)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_uvd.c
index 0f576f294d8a..b6b1d7eeb8e5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
@@ -1283,7 +1283,7 @@ void amdgpu_uvd_ring_begin_use(struct amdgpu_ring *ri=
ng)
 void amdgpu_uvd_ring_end_use(struct amdgpu_ring *ring)
 {
         if (!amdgpu_sriov_vf(ring->adev))
-               schedule_delayed_work(&ring->adev->uvd.idle_work, UVD_IDLE_=
TIMEOUT);
+               mod_delayed_work(system_wq, &ring->adev->uvd.idle_work, UVD=
_IDLE_TIMEOUT);
 }

 /**
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_vce.c
index 1ae7f824adc7..2253c18a6688 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
@@ -401,7 +401,7 @@ void amdgpu_vce_ring_begin_use(struct amdgpu_ring *ring=
)
 void amdgpu_vce_ring_end_use(struct amdgpu_ring *ring)
 {
         if (!amdgpu_sriov_vf(ring->adev))
-               schedule_delayed_work(&ring->adev->vce.idle_work, VCE_IDLE_=
TIMEOUT);
+               mod_delayed_work(system_wq, &ring->adev->vce.idle_work, VCE=
_IDLE_TIMEOUT);
 }

 /**
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c b/drivers/gpu/drm/amd/am=
dgpu/vcn_v1_0.c
index 284bb42d6c86..d5937ab5ac80 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
@@ -1874,7 +1874,7 @@ void vcn_v1_0_set_pg_for_begin_use(struct amdgpu_ring=
 *ring, bool set_clocks)

 void vcn_v1_0_ring_end_use(struct amdgpu_ring *ring)
 {
-       schedule_delayed_work(&ring->adev->vcn.idle_work, VCN_IDLE_TIMEOUT)=
;
+       mod_delayed_work(system_wq, &ring->adev->vcn.idle_work, VCN_IDLE_TI=
MEOUT);
         mutex_unlock(&ring->adev->vcn.vcn1_jpeg1_workaround);
 }

--
2.32.0


--_000_DM5PR12MB2517A081A60C1245D2A34019E4F89DM5PR12MB2517namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<p style=3D"font-family:Arial;font-size:10pt;color:#0000FF;margin:5pt;" ali=
gn=3D"Left">
[AMD Official Use Only]<br>
</p>
<br>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hi Christian,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Since we have strict check on queue status, I don't think original design c=
an cause issue here.<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
But this change should help improve below case:</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<ol>
<li><span>both enc thread and dec thread try to start begin_use.</span></li=
><li><span>dec thread gets the chance to finish begin_use process first.<br=
>
</span></li><li><span>before dec thread enters end_use, enc thread gets tim=
e slot to run through begin_use(No delay work scheduled at that time)</span=
></li><li><span><span>dec thread enters end_use</span>, scheduled a delay w=
ork<br>
</span></li><li><span><span>&nbsp;enc thread enters end_use</span>, modify =
this delay work.</span></li></ol>
<div>It will help reduce one delay work call at least. <span style=3D"font-=
family:Calibri, Arial, Helvetica, sans-serif;font-size:12pt;color:rgb(0, 0,=
 0)">
<br>
</span></div>
<div><span style=3D"font-family:Calibri, Arial, Helvetica, sans-serif;font-=
size:12pt;color:rgb(0, 0, 0)"><br>
</span></div>
</div>
<div>
<div id=3D"Signature">
<div>
<div id=3D"divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size:12pt; color=
:#000000; font-family:Calibri,Arial,Helvetica,sans-serif">
<p style=3D"margin-top: 0px; margin-bottom: 0px;">Thanks &amp; Best Regards=
!</p>
<p style=3D"margin-top: 0px; margin-bottom: 0px;"><br>
</p>
<p style=3D"margin-top: 0px; margin-bottom: 0px;">James Zhu<br>
</p>
</div>
</div>
</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Koenig, Christian &lt=
;Christian.Koenig@amd.com&gt;<br>
<b>Sent:</b> Wednesday, August 11, 2021 5:34 PM<br>
<b>To:</b> Michel D=E4nzer &lt;michel@daenzer.net&gt;; Deucher, Alexander &=
lt;Alexander.Deucher@amd.com&gt;<br>
<b>Cc:</b> Liu, Leo &lt;Leo.Liu@amd.com&gt;; Zhu, James &lt;James.Zhu@amd.c=
om&gt;; amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&gt;=
; dri-devel@lists.freedesktop.org &lt;dri-devel@lists.freedesktop.org&gt;<b=
r>
<b>Subject:</b> AW: [PATCH 2/2] drm/amdgpu: Use mod_delayed_work in JPEG/UV=
D/VCE/VCN ring_end_use hooks</font>
<div>&nbsp;</div>
</div>
<div>
<div>NAK to at least this patch.</div>
<div><br>
</div>
<div>Since activating power management while submitting work is problematic=
 cancel_delayed_work() must have been called during begin use or otherwise =
we have a serious coding problem in the first place.</div>
<div><br>
</div>
<div>So this change shouldn't make a difference and I suggest to really sti=
ck with schedule_delayed_work().</div>
<div><br>
</div>
<div>Maybe add a comment how this works?</div>
<div><br>
</div>
<div>Need to take a closer look at the first patch when I'm back from vacat=
ion, but it could be that this applies there as well.</div>
<div><br>
</div>
<div>Regards,</div>
<div>Christian.</div>
<div><br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>Von:</b> Michel D=E4nzer &lt;=
michel@daenzer.net&gt;<br>
<b>Gesendet:</b> Mittwoch, 11. August 2021 18:52<br>
<b>An:</b> Deucher, Alexander &lt;Alexander.Deucher@amd.com&gt;; Koenig, Ch=
ristian &lt;Christian.Koenig@amd.com&gt;<br>
<b>Cc:</b> Liu, Leo &lt;Leo.Liu@amd.com&gt;; Zhu, James &lt;James.Zhu@amd.c=
om&gt;; amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&gt;=
; dri-devel@lists.freedesktop.org &lt;dri-devel@lists.freedesktop.org&gt;<b=
r>
<b>Betreff:</b> [PATCH 2/2] drm/amdgpu: Use mod_delayed_work in JPEG/UVD/VC=
E/VCN ring_end_use hooks</font>
<div>&nbsp;</div>
</div>
<div class=3D"x_BodyFragment"><font size=3D"2"><span style=3D"font-size:11p=
t">
<div class=3D"x_PlainText">From: Michel D=E4nzer &lt;mdaenzer@redhat.com&gt=
;<br>
<br>
In contrast to schedule_delayed_work, this pushes back the work if it<br>
was already scheduled before. Specific behaviour change:<br>
<br>
Before:<br>
<br>
The scheduled work ran ~1 second after the first time ring_end_use was<br>
called, even if the ring was used again during that second.<br>
<br>
After:<br>
<br>
The scheduled work runs ~1 second after the last time ring_end_use is<br>
called.<br>
<br>
Inspired by the corresponding change in amdgpu_gfx_off_ctrl. While I<br>
haven't run into specific issues in this case, the new behaviour makes<br>
more sense to me.<br>
<br>
Signed-off-by: Michel D=E4nzer &lt;mdaenzer@redhat.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c | 2 +-<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c&nbsp; | 2 +-<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c&nbsp; | 2 +-<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c&nbsp;&nbsp;&nbsp; | 2 +-<br>
&nbsp;4 files changed, 4 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c b/drivers/gpu/drm/amd=
/amdgpu/amdgpu_jpeg.c<br>
index 8996cb4ed57a..2c0040153f6c 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c<br>
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c<br>
@@ -110,7 +110,7 @@ void amdgpu_jpeg_ring_begin_use(struct amdgpu_ring *rin=
g)<br>
&nbsp;void amdgpu_jpeg_ring_end_use(struct amdgpu_ring *ring)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; atomic_dec(&amp;ring-&gt;a=
dev-&gt;jpeg.total_submission_cnt);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; schedule_delayed_work(&amp;ring-&gt;a=
dev-&gt;jpeg.idle_work, JPEG_IDLE_TIMEOUT);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mod_delayed_work(system_wq, &amp;ring=
-&gt;adev-&gt;jpeg.idle_work, JPEG_IDLE_TIMEOUT);<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;int amdgpu_jpeg_dec_ring_test_ring(struct amdgpu_ring *ring)<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_uvd.c<br>
index 0f576f294d8a..b6b1d7eeb8e5 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c<br>
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c<br>
@@ -1283,7 +1283,7 @@ void amdgpu_uvd_ring_begin_use(struct amdgpu_ring *ri=
ng)<br>
&nbsp;void amdgpu_uvd_ring_end_use(struct amdgpu_ring *ring)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!amdgpu_sriov_vf(ring-=
&gt;adev))<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; schedule_delayed_work(&amp;ring-&gt;adev-&gt;uvd.idle_work, UVD_=
IDLE_TIMEOUT);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; mod_delayed_work(system_wq, &amp;ring-&gt;adev-&gt;uvd.idle_work=
, UVD_IDLE_TIMEOUT);<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;/**<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_vce.c<br>
index 1ae7f824adc7..2253c18a6688 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c<br>
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c<br>
@@ -401,7 +401,7 @@ void amdgpu_vce_ring_begin_use(struct amdgpu_ring *ring=
)<br>
&nbsp;void amdgpu_vce_ring_end_use(struct amdgpu_ring *ring)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!amdgpu_sriov_vf(ring-=
&gt;adev))<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; schedule_delayed_work(&amp;ring-&gt;adev-&gt;vce.idle_work, VCE_=
IDLE_TIMEOUT);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; mod_delayed_work(system_wq, &amp;ring-&gt;adev-&gt;vce.idle_work=
, VCE_IDLE_TIMEOUT);<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;/**<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c b/drivers/gpu/drm/amd/am=
dgpu/vcn_v1_0.c<br>
index 284bb42d6c86..d5937ab5ac80 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c<br>
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c<br>
@@ -1874,7 +1874,7 @@ void vcn_v1_0_set_pg_for_begin_use(struct amdgpu_ring=
 *ring, bool set_clocks)<br>
&nbsp;<br>
&nbsp;void vcn_v1_0_ring_end_use(struct amdgpu_ring *ring)<br>
&nbsp;{<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; schedule_delayed_work(&amp;ring-&gt;a=
dev-&gt;vcn.idle_work, VCN_IDLE_TIMEOUT);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mod_delayed_work(system_wq, &amp;ring=
-&gt;adev-&gt;vcn.idle_work, VCN_IDLE_TIMEOUT);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mutex_unlock(&amp;ring-&gt=
;adev-&gt;vcn.vcn1_jpeg1_workaround);<br>
&nbsp;}<br>
&nbsp;<br>
-- <br>
2.32.0<br>
<br>
</div>
</span></font></div>
</div>
</div>
</body>
</html>

--_000_DM5PR12MB2517A081A60C1245D2A34019E4F89DM5PR12MB2517namp_--

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2121A3E9CA0
	for <lists+dri-devel@lfdr.de>; Thu, 12 Aug 2021 04:42:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E86716E22B;
	Thu, 12 Aug 2021 02:42:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2078.outbound.protection.outlook.com [40.107.236.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EB796E223;
 Thu, 12 Aug 2021 02:42:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X+32lONvv/fQrdnIeXdLpoRuzcuzT0vGabXG0JMLn5Mb0Dwk5i70yM0j/0JYwJifhcEPYZoLnJ+kxY3yIGs9l8YuSr8giYc5aqO8t5JKKE9h3YCHNJO9c2dG93QJOfw2enYiEZj7FIFf/9wwZJXQYg2LA7OYK7btqkluMoCJTr2PfUcha2/6ULOd8RYjUIPAAbsLe7M4OtYcl3QSu4TUVSqzJYAR8GnkmYfextUsQb6XQTEsue/Yfzr1TkqPZKo1GIurw9J6r+4g8R2C1HehieMuYr40JbmHaJKM3kTMyYcecXjIHBtZt9mMCxdu2NI6E8kTO0HXWyOn9KSGqWqrLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B+Lyw0RLn2Tpg5SOnh3Yk54pmxTE2tyKpGqlJhzg+AU=;
 b=f1aEKOzKjGW85QLoe/LH3uo6KAQ10vnEJi0GtsgYnTQGU9iu2Au3cmOixmp2LYvCuE7o0aBg/7v/SDZsxm4eldabhAZAryltALQTvBXbohkLFRQXA3KpW0md5quGqr/2GnDpBhoEqjwoI2OfV5sv8ojkGIMqgJOOW9YJEZBe1Udj2TbSBp/AwPjItJLpgd/neuuNThUSwxg7lG55UweRqBmjCGwGXWlNmLjsKdHXUQQoGQMkxLzGJWcT8r7IhfviF6tx0WJlkAeL15j1PO3UopYw5ujDK4/ooXVNtNbY9YNUfej0Xyv4qghcrZInGprMv0kBxLymwOwonW+F3Gw+Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B+Lyw0RLn2Tpg5SOnh3Yk54pmxTE2tyKpGqlJhzg+AU=;
 b=Jt8TCeS3HWOqlZV+VLYz/i4Df4mMuQ6/COGqlAeH3q/FejXvW92yB7AjJ5bAadY7xXDsCQj2IhB0jS8z8xmT4e6UQlCdlFx/BU9XTaeJdljdf/gtcfyxEkd3fhX3GxRKjV4YbNVnIdSBEhsxOah5Z2VfNGrswen0gC/0ai2PC3U=
Received: from DM6PR12MB2619.namprd12.prod.outlook.com (2603:10b6:5:45::18) by
 DM5PR12MB1866.namprd12.prod.outlook.com (2603:10b6:3:10c::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.21; Thu, 12 Aug 2021 02:42:41 +0000
Received: from DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::e9f8:55de:32f0:a7e6]) by DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::e9f8:55de:32f0:a7e6%7]) with mapi id 15.20.4415.017; Thu, 12 Aug 2021
 02:42:41 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 =?iso-8859-1?Q?Michel_D=E4nzer?= <michel@daenzer.net>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>
CC: "Liu, Leo" <Leo.Liu@amd.com>, "Zhu, James" <James.Zhu@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 2/2] drm/amdgpu: Use mod_delayed_work in JPEG/UVD/VCE/VCN
 ring_end_use hooks
Thread-Topic: [PATCH 2/2] drm/amdgpu: Use mod_delayed_work in JPEG/UVD/VCE/VCN
 ring_end_use hooks
Thread-Index: AQHXjtFMac7jnXQYnkCSpXEV7zYUuKtu05sAgABQhNA=
Date: Thu, 12 Aug 2021 02:42:40 +0000
Message-ID: <DM6PR12MB26196DF7D33462060FC4F607E4F99@DM6PR12MB2619.namprd12.prod.outlook.com>
References: <20210811165211.6811-1-michel@daenzer.net>,
 <20210811165211.6811-2-michel@daenzer.net>
 <MN2PR12MB377506AD71308A47222A3E9583F89@MN2PR12MB3775.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB377506AD71308A47222A3E9583F89@MN2PR12MB3775.namprd12.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=true;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-08-12T02:42:37Z; 
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD Official Use
 Only-AIP 2.0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ActionId=67de9200-d76a-4d9a-8b08-06eefca8ab74;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=1
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8858b314-758c-453a-b706-08d95d3adb01
x-ms-traffictypediagnostic: DM5PR12MB1866:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB1866FDCA32577F5A5902DAF9E4F99@DM5PR12MB1866.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Kt30R8uF1PLmiCNevzNquJsF69MxEP5auFeZ9A5wROR2WJPx50mh/AfVhsdNtjIO+QinfQPywrt58spW9UgZ+EX/S0EBH3wSN9osADWSyAtv2eLioB3a9Pjx6AjD2ky3xXzTu/7oMdHu1PgVNjYMRTvhaPx8DDbTk5HjQ5BrF9dSIrmTStqdhVv934HTigydg9FjHpVLadaolvyYXRI85BdcuBCHOmmJM9vTkwuOJxlCe3zcfOqLzI8O9zkEBe81VcCgpGofkeEih7Cclg392ABlKghyzf+vOJlct3uMsnSw4sz1n/kQXLpjteaPXnLDpjP60eD36GP0K7hNbAn7A9B5zlGau3aWp5Y6ilEzPOJsEAFg9FDlsbO8rAgX3dbd3d510w1Qk+J6h4wJUy0eqV6M2kn3cbFAL9sVxqvJbcY5w999wGB2eXqsdN9Gs9UhZImcaKbvdKwNnAmvkFMTtwjkPTBUW9+GVe1XXFcFYqBBmRv7JHRNHzEKrdfVK46y+DoOFxk2BQ0WBpUoB8C5EebnVOWzZNuM/Hqy6SKIff1u+zBDzJI/KkianfRpswNbUMkE10HfcUEAgpKGsEFAWOgyc3PkiK6g4p8eAO9EVFHH6xBtU6Z1XLJZ1cgoNcNrynr53qNrUquYUh9IkhcI0IC0GjUmYcwYj0VhHy/IZPoBv2li/FSf0jVt5Kt+kkqNT3xXAbGtlINhz9NqALspNA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2619.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(396003)(366004)(39860400002)(66556008)(6506007)(66446008)(86362001)(53546011)(64756008)(9686003)(66946007)(66476007)(186003)(110136005)(4326008)(52536014)(55016002)(316002)(26005)(54906003)(5660300002)(478600001)(71200400001)(8936002)(33656002)(8676002)(38100700002)(83380400001)(76116006)(38070700005)(6636002)(122000001)(7696005)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?MX8Xb0038gLT4u2ytTX4RWnt0ApC2fSIA0F36LHsH5CYFvzWLhqiy/+F8Y?=
 =?iso-8859-1?Q?P0/rQU/QnNJiXFUsf68TtBDgiGlt3i+uQZPYPCFReW0sllHN/Vix9H90bo?=
 =?iso-8859-1?Q?Bsq5afAhoTQXSRFu/hjBcnzTo2BryU1y5Q4MJ7pFksfrgEBZkAkX0Nzg3H?=
 =?iso-8859-1?Q?4nKr0wc8ZZ++u5WRH8Koc5qTmwP+bHbNRO8vawDe0Ya+7LfSEZrDVzZKED?=
 =?iso-8859-1?Q?wqGIMO1uNfk8t580OCW8zZeuVztjAvqp1A1lfC0YPgfREQZt12UsUfaHcv?=
 =?iso-8859-1?Q?ydnWKaNoG5d0Sk3PYOpgc3M5lH2vaSDV64HIkfHyijhEMCUlQyFODY5vJE?=
 =?iso-8859-1?Q?QWZ2wBvAztmqsXZxnD1+jW0v8mMx5NsBiZvdJgqSNtfDxRz5J/Gye3kHh7?=
 =?iso-8859-1?Q?WWlOJqRVVQWT1lxjbQE96RZ8xkCriJDo4X70ViBh70M2Gg2wlT4yGzhj1L?=
 =?iso-8859-1?Q?qlZZRtXkgB7ew9Sx7zYrC8h5AEpn42YAMLWeOR/g5Tdbhkrhb+sWtDKISE?=
 =?iso-8859-1?Q?b4bd+6R1L1ZF5Z2//g1MOwZu3zCyi0VBzkow6AwH7aQWzDnp3GN/QinOrL?=
 =?iso-8859-1?Q?Hq8u9zbOPisLuFlJt3ZTCcgfODl2Tx+3mL5Bx2PF6/ZPZ5wqrz/EJx+fwk?=
 =?iso-8859-1?Q?IwuDOZ3AvhEvyBJBXR3A13JDvGKoYHhrx6jhIF51dK4hvT1VPezR9FX4k5?=
 =?iso-8859-1?Q?skoTzambacGs+m/uvha4365m+C0LWAyEQzXg9VLwCOIIp9lY82H8WPPYy/?=
 =?iso-8859-1?Q?+mqbfwA2AsYARM+3I651aL7bJH5d7XgRl0l7TlTM4/WC3URMhVXApHNRoL?=
 =?iso-8859-1?Q?c+1fvMCFyw+kd8pAWawzXp53HyXtqRVZLfVPecmtH5U7heZO3S6ubovukR?=
 =?iso-8859-1?Q?lssmfoLSWIH5HxlFf2JKzoYQld27D6/b2yr+cp3/03loQnoAiHgp7MLeMK?=
 =?iso-8859-1?Q?Io0ON0ZJCQkOVZ+I64lm7lNLdHWSjDLAu/EMNPQASjnsyXCRynnWXibu+k?=
 =?iso-8859-1?Q?l0xVHn+o8BQ4NRPfKX9QhiT5ElQxdfgCq7xmGzCvWjkA2I/3eeWbHKtf3v?=
 =?iso-8859-1?Q?lZW+ZImWx5+cc3l1HDnYrWJ7a7afxCqS7qa0ynRldWH7rdW38JWcSXkBau?=
 =?iso-8859-1?Q?vzu7rQxVogWJ7yYbSGkUaEnVoHOTZcpVI8fl9LyDI0ejt1XmOQfPYKSiht?=
 =?iso-8859-1?Q?fkK2zGwzSWzGVgrW3YSNI8eGWkyLRn1vDL8V1rgnFs+pXMLAAdNcAwyIuP?=
 =?iso-8859-1?Q?4RaZZh552sHNOBAzTajoWMjhOsCDmJBIMfCSAIDaXNa5i2nfrMpNaPwgef?=
 =?iso-8859-1?Q?SEcdUb3pe7gS8skcNB9fma8aUP8/fOM4r8QGJdKaeS6DY6xcvYB2zcWuY2?=
 =?iso-8859-1?Q?6OgUENEmGJ?=
Content-Type: multipart/alternative;
 boundary="_000_DM6PR12MB26196DF7D33462060FC4F607E4F99DM6PR12MB2619namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2619.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8858b314-758c-453a-b706-08d95d3adb01
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2021 02:42:41.2175 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E8hpys5xAOYhxfbHaHQP5OTGGsuJFobdXYXeWcjWDUvlLQkoOQYEk3zfgF1cnh92
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1866
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

--_000_DM6PR12MB26196DF7D33462060FC4F607E4F99DM6PR12MB2619namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only]

Different from the 1st patch(for amdgpu_gfx_off_ctrl) of the series, "cance=
l_delayed_work_sync(&adev->uvd.idle_work)" will be called on like amdgpu_uv=
d_ring_begin_use().  Under this case, does it make any difference from prev=
ious implementation "schedule_delayed_work"?
Suppose the sequence is as below:

  *   Ring begin use
  *   Ring end use -->  mod_delayed_work() : queue a new delayed work, righ=
t?
  *   Ring begin use (within 1s) --> cancel_delayed_work_sync() will cancel=
 the work submitted above, right?
  *   Ring end use  --> mod_delayed_work(): queue another new scheduled wor=
k, same as previous "schedule_delayed_work"?

BR
Evan
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Koenig, =
Christian
Sent: Thursday, August 12, 2021 5:34 AM
To: Michel D=E4nzer <michel@daenzer.net>; Deucher, Alexander <Alexander.Deu=
cher@amd.com>
Cc: Liu, Leo <Leo.Liu@amd.com>; Zhu, James <James.Zhu@amd.com>; amd-gfx@lis=
ts.freedesktop.org; dri-devel@lists.freedesktop.org
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
Von: Michel D=E4nzer <michel@daenzer.net<mailto:michel@daenzer.net>>
Gesendet: Mittwoch, 11. August 2021 18:52
An: Deucher, Alexander <Alexander.Deucher@amd.com<mailto:Alexander.Deucher@=
amd.com>>; Koenig, Christian <Christian.Koenig@amd.com<mailto:Christian.Koe=
nig@amd.com>>
Cc: Liu, Leo <Leo.Liu@amd.com<mailto:Leo.Liu@amd.com>>; Zhu, James <James.Z=
hu@amd.com<mailto:James.Zhu@amd.com>>; amd-gfx@lists.freedesktop.org<mailto=
:amd-gfx@lists.freedesktop.org> <amd-gfx@lists.freedesktop.org<mailto:amd-g=
fx@lists.freedesktop.org>>; dri-devel@lists.freedesktop.org<mailto:dri-deve=
l@lists.freedesktop.org> <dri-devel@lists.freedesktop.org<mailto:dri-devel@=
lists.freedesktop.org>>
Betreff: [PATCH 2/2] drm/amdgpu: Use mod_delayed_work in JPEG/UVD/VCE/VCN r=
ing_end_use hooks

From: Michel D=E4nzer <mdaenzer@redhat.com<mailto:mdaenzer@redhat.com>>

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

Signed-off-by: Michel D=E4nzer <mdaenzer@redhat.com<mailto:mdaenzer@redhat.=
com>>
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

--_000_DM6PR12MB26196DF7D33462060FC4F607E4F99DM6PR12MB2619namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
p.msipheadera4477989, li.msipheadera4477989, div.msipheadera4477989
	{mso-style-name:msipheadera4477989;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:613287960;
	mso-list-template-ids:1998231192;}
@list l0:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l0:level2
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:1.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l0:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:1.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l0:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:2.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l0:level5
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:2.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l0:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:3.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l0:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:3.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l0:level8
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:4.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l0:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:4.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l1
	{mso-list-id:683213896;
	mso-list-type:hybrid;
	mso-list-template-ids:-135100024 -1809689112 67698691 67698693 67698689 67=
698691 67698693 67698689 67698691 67698693;}
@list l1:level1
	{mso-level-start-at:0;
	mso-level-number-format:bullet;
	mso-level-text:-;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Calibri",sans-serif;
	mso-fareast-font-family:DengXian;}
@list l1:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l1:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l1:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l1:level5
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l1:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l1:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l1:level8
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l1:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"msipheadera4477989" style=3D"margin:0in"><span style=3D"font-si=
ze:10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:blue">[AMD Officia=
l Use Only]</span><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Different from the 1<sup>st</sup> patch(for amdgpu_g=
fx_off_ctrl) of the series, &#8220;cancel_delayed_work_sync(&amp;adev-&gt;u=
vd.idle_work)&#8221; will be called on like amdgpu_uvd_ring_begin_use(). &n=
bsp;Under this case, does it make any difference from previous
 implementation &#8221;schedule_delayed_work&#8221;?<o:p></o:p></p>
<p class=3D"MsoNormal">Suppose the sequence is as below:<o:p></o:p></p>
<ul style=3D"margin-top:0in" type=3D"disc">
<li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l1 level1 =
lfo3">Ring begin use<o:p></o:p></li><li class=3D"MsoListParagraph" style=3D=
"margin-left:0in;mso-list:l1 level1 lfo3">Ring end use
<span style=3D"font-family:Wingdings">=E0</span> &nbsp;mod_delayed_work() :=
 queue a new delayed work, right?<o:p></o:p></li><li class=3D"MsoListParagr=
aph" style=3D"margin-left:0in;mso-list:l1 level1 lfo3">Ring begin use (with=
in 1s)
<span style=3D"font-family:Wingdings">=E0</span> cancel_delayed_work_sync()=
 will cancel the work submitted above, right?<o:p></o:p></li><li class=3D"M=
soListParagraph" style=3D"margin-left:0in;mso-list:l1 level1 lfo3">Ring end=
 use&nbsp;
<span style=3D"font-family:Wingdings">=E0</span> mod_delayed_work(): queue =
another new scheduled work, same as previous &#8220;schedule_delayed_work&#=
8221;?<o:p></o:p></li></ul>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">BR<o:p></o:p></p>
<p class=3D"MsoNormal">Evan<o:p></o:p></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b>From:</b> amd-gfx &lt;amd-gfx-bounces@lists.freed=
esktop.org&gt;
<b>On Behalf Of </b>Koenig, Christian<br>
<b>Sent:</b> Thursday, August 12, 2021 5:34 AM<br>
<b>To:</b> Michel D=E4nzer &lt;michel@daenzer.net&gt;; Deucher, Alexander &=
lt;Alexander.Deucher@amd.com&gt;<br>
<b>Cc:</b> Liu, Leo &lt;Leo.Liu@amd.com&gt;; Zhu, James &lt;James.Zhu@amd.c=
om&gt;; amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org<br>
<b>Subject:</b> AW: [PATCH 2/2] drm/amdgpu: Use mod_delayed_work in JPEG/UV=
D/VCE/VCN ring_end_use hooks<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal">NAK to at least this patch.<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Since activating power management while submitting w=
ork is problematic cancel_delayed_work() must have been called during begin=
 use or otherwise we have a serious coding problem in the first place.<o:p>=
</o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">So this change shouldn't make a difference and I sug=
gest to really stick with schedule_delayed_work().<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Maybe add a comment how this works?<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Need to take a closer look at the first patch when I=
'm back from vacation, but it could be that this applies there as well.<o:p=
></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Christian.<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div class=3D"MsoNormal" align=3D"center" style=3D"text-align:center">
<hr size=3D"2" width=3D"98%" align=3D"center">
</div>
<div id=3D"divRplyFwdMsg">
<p class=3D"MsoNormal"><b><span style=3D"color:black">Von:</span></b><span =
style=3D"color:black"> Michel D=E4nzer &lt;<a href=3D"mailto:michel@daenzer=
.net">michel@daenzer.net</a>&gt;<br>
<b>Gesendet:</b> Mittwoch, 11. August 2021 18:52<br>
<b>An:</b> Deucher, Alexander &lt;<a href=3D"mailto:Alexander.Deucher@amd.c=
om">Alexander.Deucher@amd.com</a>&gt;; Koenig, Christian &lt;<a href=3D"mai=
lto:Christian.Koenig@amd.com">Christian.Koenig@amd.com</a>&gt;<br>
<b>Cc:</b> Liu, Leo &lt;<a href=3D"mailto:Leo.Liu@amd.com">Leo.Liu@amd.com<=
/a>&gt;; Zhu, James &lt;<a href=3D"mailto:James.Zhu@amd.com">James.Zhu@amd.=
com</a>&gt;;
<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.=
org</a> &lt;<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.=
freedesktop.org</a>&gt;;
<a href=3D"mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesk=
top.org</a> &lt;<a href=3D"mailto:dri-devel@lists.freedesktop.org">dri-deve=
l@lists.freedesktop.org</a>&gt;<br>
<b>Betreff:</b> [PATCH 2/2] drm/amdgpu: Use mod_delayed_work in JPEG/UVD/VC=
E/VCN ring_end_use hooks</span>
<o:p></o:p></p>
<div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
</div>
<div>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">From: Michel D=E4nzer=
 &lt;<a href=3D"mailto:mdaenzer@redhat.com">mdaenzer@redhat.com</a>&gt;<br>
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
Signed-off-by: Michel D=E4nzer &lt;<a href=3D"mailto:mdaenzer@redhat.com">m=
daenzer@redhat.com</a>&gt;<br>
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
2.32.0<o:p></o:p></p>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_DM6PR12MB26196DF7D33462060FC4F607E4F99DM6PR12MB2619namp_--

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D68763E9E29
	for <lists+dri-devel@lfdr.de>; Thu, 12 Aug 2021 07:55:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 247936E24D;
	Thu, 12 Aug 2021 05:55:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2063.outbound.protection.outlook.com [40.107.93.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F34476E093;
 Thu, 12 Aug 2021 05:55:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gu9dupk6i45zXmqSCVPew7p6/wDi4NJWyXS/sXwWCgfyfos6ma37P3giV/Kh3EUJe67QWs01Q/CjxGSr77Qj7lrJFwaxrLxhzm56Ox31O+4vxWZbQliklOdV0gJiiNL9ppNGru8yGQPfOO/mjF9hgbT2HL5/+QwsgdSmAnmDLdi9VNiEyeFvZb0/TrNtprOOvnMQKqudgHJ2ZY+53JaTKuat9r8LaX6oM79rHRUahTlgKm48UO2xCSf2Js7p9y2ghufEeZyYTAYLoYFJdvEhff9fL6eTIi9O46A+rzXiQ/iXz4Oq6eoJxaTT9SvMZ/aazW50WBbUIgEMD/JLuB13Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qypTp251koSCqjfKbE38Bja/7W0eKKAVlyUuBRNVOBc=;
 b=gDrt3wRFhHjmr79wEETK7Xk1/TBRxvjyNQvPAJjRH8BUm+R4+Gd7+MOqpTgy43tV3SFeBS0/0tEYJZMCk18Wy9DWtymcxVkWNamb6q43iGPhdVo1FKJRllYCAP6MheUgIyMX/oznYZ93+50U2IQHIYnM3THkj2ZcJeaifegwLTYFGiX0dUBdCtLvdqJawGEcs9TJOk2fY01D8YD541CHa2TUbUIUp9fP0j1I66KjTr/5tSspENFABBqCpesT5qcWbED/WVrXDUO9ZOnLefop6nzAKwBN9m1HLaA0ekYPMpSY+coXgc0MbOFQ7YZeRKy8i2hjBPqnon56Vz4eGvzs5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qypTp251koSCqjfKbE38Bja/7W0eKKAVlyUuBRNVOBc=;
 b=n7Nu97UWo7RsUulcSXoGwyezxDN2dmDSPU0mLvZPTkY1Yksyaw4azfgyrB/83IVhqUNod7MVJdmRIOVlXNSFYtI4kdDC1A9TSvCf+0+oZ7rwVaVH5cBjYOBM4tqmEniIIbthblxu/cgTc1zII2UebyRDxPJSR9H0NVe2jQxJcxc=
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3773.namprd12.prod.outlook.com (2603:10b6:208:164::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.21; Thu, 12 Aug
 2021 05:55:02 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4394.026; Thu, 12 Aug 2021
 05:55:02 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, =?Windows-1252?Q?Michel_D=E4nzer?=
 <michel@daenzer.net>, "Deucher, Alexander" <Alexander.Deucher@amd.com>
CC: "Liu, Leo" <Leo.Liu@amd.com>, "Zhu, James" <James.Zhu@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: AW: [PATCH 2/2] drm/amdgpu: Use mod_delayed_work in JPEG/UVD/VCE/VCN
 ring_end_use hooks
Thread-Topic: [PATCH 2/2] drm/amdgpu: Use mod_delayed_work in JPEG/UVD/VCE/VCN
 ring_end_use hooks
Thread-Index: AQHXjtE+BWy+t4LDY06JadgZjDnxmatu0Vw/gABYcACAADQnDA==
Date: Thu, 12 Aug 2021 05:55:02 +0000
Message-ID: <MN2PR12MB3775E6C1ECA915283108E6D783F99@MN2PR12MB3775.namprd12.prod.outlook.com>
References: <20210811165211.6811-1-michel@daenzer.net>,
 <20210811165211.6811-2-michel@daenzer.net>
 <MN2PR12MB377506AD71308A47222A3E9583F89@MN2PR12MB3775.namprd12.prod.outlook.com>,
 <DM6PR12MB26196DF7D33462060FC4F607E4F99@DM6PR12MB2619.namprd12.prod.outlook.com>
In-Reply-To: <DM6PR12MB26196DF7D33462060FC4F607E4F99@DM6PR12MB2619.namprd12.prod.outlook.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2b88b6aa-e592-4b5e-a63f-08d95d55ba10
x-ms-traffictypediagnostic: MN2PR12MB3773:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3773195C7E6CC05B2759978B83F99@MN2PR12MB3773.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ev71XjnPGmoAkIETYnR0xXL0arz1wvHyabKQb72TiQvfQV/WfPIZsTCcvJDlNwWZiRyQO6DYJ6Kqw4HstTum5ExK/LkTRZXytbBfOe83cAT5NENU8BmsveB7ru2UC+ostwKdkjdykVUnXaKL66CMkO4dmfOgbtbX3yLI1EYfZwcr9jDag+37P+pKTqb4TZPDRYKVN/udzdyynBqS/IZDUHFaNoDhtdcnOdJF4pHz82xdNuYsCANuIWzoexj6mdWHKjtk//ubcTgfyyu0OiesTxD7RL5KS6Kk1Yx6b9+jSTcgw/hxiHWGhEaoUIddQ52iA1tdwTIxmdXMeN08hVx1J/CoS8xZOXr3ZzuagZTCWLUcpESKWXz2tvk10TOm3rxqu0kq0vM17ddVFq06oxoYmXXtthkeREVGP5GfTUq/MWqsSH/6DoYBsoU7h2fMHC8PbgMPcvqzvm0Orf03RjHWl0jEUhKFNkcPFzDmiUGBvmSFBjlOZN3oUjamrs/mah3Go0pkHm8Jt/kc52ZkpC7hGpHQGi0dXOXaf/1qDi01HfnxWByXpGMaXuOLas80prbj207l1nK0qKUUy+sJzYavuXBc8B1tVTLVXL83NMOyUVYRU8dXpSc57wL2t5bIfdpg+KsCu+barkeb8chBHRAYRLV9w3UJg36zasy4oM6UB4KEMMCOnUXgThe0UxCrXZqEeKFoyzZBPH1osTTxR8SYhg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(376002)(396003)(136003)(346002)(53546011)(186003)(54906003)(66574015)(86362001)(110136005)(6506007)(83380400001)(316002)(26005)(5660300002)(478600001)(52536014)(19627235002)(66946007)(4326008)(2906002)(64756008)(66446008)(8676002)(38070700005)(66476007)(66556008)(76116006)(55016002)(33656002)(71200400001)(122000001)(6636002)(38100700002)(8936002)(91956017)(7696005)(9686003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?hMUMBF9226kkViVmP/unVhtJFXgFCRjMOckvQE0LoM3lpPh8nFtPFmf4?=
 =?Windows-1252?Q?8nrXhafjf7sqqdJK8tglZcsp0V4A1KqLFbENXaBdUJVRxkh/plzM9wyp?=
 =?Windows-1252?Q?CXwuORnWYPXI3TRqX2WKCIsT9LlplZJ7xDCLmxCR1qX52ZKuT27SGPHz?=
 =?Windows-1252?Q?YnpLYz6hO4XSnt139CjdalMpDYuGoQ7dHoMnDsAVfMJ9U00ENFFJz2m5?=
 =?Windows-1252?Q?qDPx0h0DnLOIcvuiQaMd3er754JUxpVXpdqKsMjIlnq/8m8u90lYVz6S?=
 =?Windows-1252?Q?D9v4wiAeh2C4+LkXvFGIaEGtLMAM1bMrBX/KylrCfai2G6AGJJgJ9P71?=
 =?Windows-1252?Q?/gSGtvPUSOPYEyu0gSCn65RnlKDOylwFHlNugIAUd2Ku58jGdN3/lcG0?=
 =?Windows-1252?Q?8Eyua2rxy6NKaTEEdK9oafugcaQWZ0unnq3xBuq/ZBK346edZTLBwJbP?=
 =?Windows-1252?Q?Bh11ZQvy/bhz/9po7J8LqPB4oZRqhddvUnQFkwmviDIOIEaYrY/ygD4t?=
 =?Windows-1252?Q?yPVcVU6yKhqusGtDWH5VRqmTGDe2806h4CpsvoDNadmokkPWrBb5aQmr?=
 =?Windows-1252?Q?BXlzoRRXFcIPjefw5TFI5AW4SMd3AelK+znoGjk5YCyBgRW8TXDCzKy4?=
 =?Windows-1252?Q?AFl1HzraebyW/YJ0/4Z16H257a5U9fkWgq7tldVR88Fxk0wSasKP4qPO?=
 =?Windows-1252?Q?tW8ULmpz0hZZxBPbyjZ/cTNxIx1ZwAKxn4W4daZrI63K6TqfCGjVeAV8?=
 =?Windows-1252?Q?7hlz5ZKHz8w3+QTqoaO/H+px2sjVoWuWqliwO6qAjzEv6a3/+6rN5FzJ?=
 =?Windows-1252?Q?/wGpHD/XrBt3VofGadd+cpzpfPRChK9fhPCZ/M1bzUY+aNpzBCuiCGzf?=
 =?Windows-1252?Q?d7UF8u1OmAlxsXuf7XHH7jJw/MgA7nSfl9ILec/P8z7aiW9OwTpdptPq?=
 =?Windows-1252?Q?DZ36AAORYnSIkpuv1ki4hBXR0WYFAOPDmlc3nfybotEbQvYmyWOqMxKA?=
 =?Windows-1252?Q?NmuAYAwm0mP4FApYmUqvuKDwje33Z+emnmC64S8aiQghds1Pp2PemSek?=
 =?Windows-1252?Q?+Yx/EIxMm2C1pOEIcPByOr1+tvj/5kmetiKebzq3fTyUsk3PBakFBqlo?=
 =?Windows-1252?Q?GjRVeOE+q/Uxs2xE1ebB1s81FQjKNZUHj6Nr9pdVIoCbrDem6N7HAAzD?=
 =?Windows-1252?Q?0t0bJgsjTeotVxY2v9BH7gIdZY0UU70Jdei58V7YBlio8/lbUzsR2hT3?=
 =?Windows-1252?Q?cF/5QpmXqx30wCftGf21EelQTugFQ0k8UQAEA5JRPErXPioFQCdWK9C0?=
 =?Windows-1252?Q?BXAotRS48wLSQm6jdaFNHGfxOeLQcAGPEsNuJbgJBhMDZlBOqG1QYsE2?=
 =?Windows-1252?Q?mQ6h8odWRaUGt8Eojnl0p+4pb/Uw37toxfQ=3D?=
Content-Type: multipart/alternative;
 boundary="_000_MN2PR12MB3775E6C1ECA915283108E6D783F99MN2PR12MB3775namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b88b6aa-e592-4b5e-a63f-08d95d55ba10
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2021 05:55:02.3293 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U2XEHBVwZA/Iw5BGySddFyWBCfJarAKn8QOO/Woia+pFGDjW7wlrZ7TxM0p24FP2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3773
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

--_000_MN2PR12MB3775E6C1ECA915283108E6D783F99MN2PR12MB3775namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi James,

Evan seems to have understood how this all works together.

See while any begin/end use critical section is active the work should not =
be active.

When you handle only one ring you can just call cancel in begin use and sch=
edule in end use. But when you have more than one ring you need a lock or c=
ounter to prevent concurrent work items to be started.

Michelle's idea to use mod_delayed_work is a bad one because it assumes tha=
t the delayed work is still running.

Something similar applies to the first patch I think, so when this makes a =
difference it is actually a bug.

Regards,
Christian.
________________________________
Von: Quan, Evan <Evan.Quan@amd.com>
Gesendet: Donnerstag, 12. August 2021 04:42
An: Koenig, Christian <Christian.Koenig@amd.com>; Michel D=E4nzer <michel@d=
aenzer.net>; Deucher, Alexander <Alexander.Deucher@amd.com>
Cc: Liu, Leo <Leo.Liu@amd.com>; Zhu, James <James.Zhu@amd.com>; amd-gfx@lis=
ts.freedesktop.org <amd-gfx@lists.freedesktop.org>; dri-devel@lists.freedes=
ktop.org <dri-devel@lists.freedesktop.org>
Betreff: RE: [PATCH 2/2] drm/amdgpu: Use mod_delayed_work in JPEG/UVD/VCE/V=
CN ring_end_use hooks


[AMD Official Use Only]



Different from the 1st patch(for amdgpu_gfx_off_ctrl) of the series, =93can=
cel_delayed_work_sync(&adev->uvd.idle_work)=94 will be called on like amdgp=
u_uvd_ring_begin_use().  Under this case, does it make any difference from =
previous implementation =94schedule_delayed_work=94?

Suppose the sequence is as below:

  *   Ring begin use
  *   Ring end use -->  mod_delayed_work() : queue a new delayed work, righ=
t?
  *   Ring begin use (within 1s) --> cancel_delayed_work_sync() will cancel=
 the work submitted above, right?
  *   Ring end use  --> mod_delayed_work(): queue another new scheduled wor=
k, same as previous =93schedule_delayed_work=94?



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

--_000_MN2PR12MB3775E6C1ECA915283108E6D783F99MN2PR12MB3775namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
</head>
<body>
<div>Hi James,</div>
<div><br>
</div>
<div>Evan seems to have understood how this all works together.</div>
<div><br>
</div>
<div>See while any begin/end use critical section is active the work should=
 not be active.</div>
<div><br>
</div>
<div>When you handle only one ring you can just call cancel in begin use an=
d schedule in end use. But when you have more than one ring you need a lock=
 or counter to prevent concurrent work items to be started.</div>
<div><br>
</div>
<div>Michelle's idea to use mod_delayed_work is a bad one because it assume=
s that the delayed work is still running.</div>
<div><br>
</div>
<div>Something similar applies to the first patch I think, so when this mak=
es a difference it is actually a bug.</div>
<div><br>
</div>
<div>Regards,</div>
<div>Christian.</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>Von:</b> Quan, Evan &lt;Evan.Qu=
an@amd.com&gt;<br>
<b>Gesendet:</b> Donnerstag, 12. August 2021 04:42<br>
<b>An:</b> Koenig, Christian &lt;Christian.Koenig@amd.com&gt;; Michel D=E4n=
zer &lt;michel@daenzer.net&gt;; Deucher, Alexander &lt;Alexander.Deucher@am=
d.com&gt;<br>
<b>Cc:</b> Liu, Leo &lt;Leo.Liu@amd.com&gt;; Zhu, James &lt;James.Zhu@amd.c=
om&gt;; amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&gt;=
; dri-devel@lists.freedesktop.org &lt;dri-devel@lists.freedesktop.org&gt;<b=
r>
<b>Betreff:</b> RE: [PATCH 2/2] drm/amdgpu: Use mod_delayed_work in JPEG/UV=
D/VCE/VCN ring_end_use hooks</font>
<div>&nbsp;</div>
</div>
<style>
<!--
@font-face
	{font-family:Wingdings}
@font-face
	{font-family:"Cambria Math"}
@font-face
	{font-family:DengXian}
@font-face
	{font-family:Calibri}
@font-face
	{}
p.x_MsoNormal, li.x_MsoNormal, div.x_MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif}
a:link, span.x_MsoHyperlink
	{color:#0563C1;
	text-decoration:underline}
p.x_MsoListParagraph, li.x_MsoListParagraph, div.x_MsoListParagraph
	{margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif}
span.x_EmailStyle19
	{font-family:"Calibri",sans-serif;
	color:windowtext}
p.x_msipheadera4477989, li.x_msipheadera4477989, div.x_msipheadera4477989
	{margin-right:0in;
	margin-left:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif}
.x_MsoChpDefault
	{font-size:10.0pt}
@page WordSection1
	{margin:1.0in 1.0in 1.0in 1.0in}
div.x_WordSection1
	{}
ol
	{margin-bottom:0in}
ul
	{margin-bottom:0in}
-->
</style>
<div lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:b=
reak-word">
<div class=3D"x_WordSection1">
<p class=3D"x_msipheadera4477989" style=3D"margin:0in"><span style=3D"font-=
size:10.0pt; font-family:&quot;Arial&quot;,sans-serif; color:blue">[AMD Off=
icial Use Only]</span></p>
<p class=3D"x_MsoNormal">&nbsp;</p>
<p class=3D"x_MsoNormal">Different from the 1<sup>st</sup> patch(for amdgpu=
_gfx_off_ctrl) of the series, =93cancel_delayed_work_sync(&amp;adev-&gt;uvd=
.idle_work)=94 will be called on like amdgpu_uvd_ring_begin_use(). &nbsp;Un=
der this case, does it make any difference from previous
 implementation =94schedule_delayed_work=94?</p>
<p class=3D"x_MsoNormal">Suppose the sequence is as below:</p>
<ul type=3D"disc" style=3D"margin-top:0in">
<li class=3D"x_MsoListParagraph" style=3D"margin-left:0in">Ring begin use</=
li><li class=3D"x_MsoListParagraph" style=3D"margin-left:0in">Ring end use =
<span style=3D"font-family:Wingdings">
=E0</span> &nbsp;mod_delayed_work() : queue a new delayed work, right?</li>=
<li class=3D"x_MsoListParagraph" style=3D"margin-left:0in">Ring begin use (=
within 1s)
<span style=3D"font-family:Wingdings">=E0</span> cancel_delayed_work_sync()=
 will cancel the work submitted above, right?</li><li class=3D"x_MsoListPar=
agraph" style=3D"margin-left:0in">Ring end use&nbsp; <span style=3D"font-fa=
mily:Wingdings">
=E0</span> mod_delayed_work(): queue another new scheduled work, same as pr=
evious =93schedule_delayed_work=94?</li></ul>
<p class=3D"x_MsoNormal">&nbsp;</p>
<p class=3D"x_MsoNormal">BR</p>
<p class=3D"x_MsoNormal">Evan</p>
<div style=3D"border:none; border-left:solid blue 1.5pt; padding:0in 0in 0i=
n 4.0pt">
<div>
<div style=3D"border:none; border-top:solid #E1E1E1 1.0pt; padding:3.0pt 0i=
n 0in 0in">
<p class=3D"x_MsoNormal"><b>From:</b> amd-gfx &lt;amd-gfx-bounces@lists.fre=
edesktop.org&gt;
<b>On Behalf Of </b>Koenig, Christian<br>
<b>Sent:</b> Thursday, August 12, 2021 5:34 AM<br>
<b>To:</b> Michel D=E4nzer &lt;michel@daenzer.net&gt;; Deucher, Alexander &=
lt;Alexander.Deucher@amd.com&gt;<br>
<b>Cc:</b> Liu, Leo &lt;Leo.Liu@amd.com&gt;; Zhu, James &lt;James.Zhu@amd.c=
om&gt;; amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org<br>
<b>Subject:</b> AW: [PATCH 2/2] drm/amdgpu: Use mod_delayed_work in JPEG/UV=
D/VCE/VCN ring_end_use hooks</p>
</div>
</div>
<p class=3D"x_MsoNormal">&nbsp;</p>
<div>
<p class=3D"x_MsoNormal">NAK to at least this patch.</p>
</div>
<div>
<p class=3D"x_MsoNormal">&nbsp;</p>
</div>
<div>
<p class=3D"x_MsoNormal">Since activating power management while submitting=
 work is problematic cancel_delayed_work() must have been called during beg=
in use or otherwise we have a serious coding problem in the first place.</p=
>
</div>
<div>
<p class=3D"x_MsoNormal">&nbsp;</p>
</div>
<div>
<p class=3D"x_MsoNormal">So this change shouldn't make a difference and I s=
uggest to really stick with schedule_delayed_work().</p>
</div>
<div>
<p class=3D"x_MsoNormal">&nbsp;</p>
</div>
<div>
<p class=3D"x_MsoNormal">Maybe add a comment how this works?</p>
</div>
<div>
<p class=3D"x_MsoNormal">&nbsp;</p>
</div>
<div>
<p class=3D"x_MsoNormal">Need to take a closer look at the first patch when=
 I'm back from vacation, but it could be that this applies there as well.</=
p>
</div>
<div>
<p class=3D"x_MsoNormal">&nbsp;</p>
</div>
<div>
<p class=3D"x_MsoNormal">Regards,</p>
</div>
<div>
<p class=3D"x_MsoNormal">Christian.</p>
</div>
<div>
<p class=3D"x_MsoNormal">&nbsp;</p>
</div>
<div class=3D"x_MsoNormal" align=3D"center" style=3D"text-align:center">
<hr size=3D"2" width=3D"98%" align=3D"center">
</div>
<div id=3D"x_divRplyFwdMsg">
<p class=3D"x_MsoNormal"><b><span style=3D"color:black">Von:</span></b><spa=
n style=3D"color:black"> Michel D=E4nzer &lt;<a href=3D"mailto:michel@daenz=
er.net">michel@daenzer.net</a>&gt;<br>
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
</p>
<div>
<p class=3D"x_MsoNormal">&nbsp;</p>
</div>
</div>
<div>
<div>
<p class=3D"x_MsoNormal" style=3D"margin-bottom:12.0pt">From: Michel D=E4nz=
er &lt;<a href=3D"mailto:mdaenzer@redhat.com">mdaenzer@redhat.com</a>&gt;<b=
r>
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
2.32.0</p>
</div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_MN2PR12MB3775E6C1ECA915283108E6D783F99MN2PR12MB3775namp_--

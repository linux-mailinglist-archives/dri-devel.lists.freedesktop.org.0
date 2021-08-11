Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 674E73E9ADE
	for <lists+dri-devel@lfdr.de>; Thu, 12 Aug 2021 00:22:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 313276E1E8;
	Wed, 11 Aug 2021 22:22:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2049.outbound.protection.outlook.com [40.107.92.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 649CA6E1E6;
 Wed, 11 Aug 2021 22:22:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vh8pqn5pP02FH7o3k/6UF8xrDZ4Vc3huDjC34bJGRy8dFpkSk0QY3wN+EDrsB1ab2q5IkXSVjzmBDBvAHEX4C8RNl41Sa86eMkRT6f8UN1VuwmN+v/6xr0SWV6CDe2u5RXOV/vYaRg5iy5OARuwATQLK6tOm1+xlw7CMZHWsowP3QHY3MG3+Uv8pWZmlc78Ok83hwnZS9nm2u4F35CeYO3cPmkoMYJF34x1QVeU/qaoZtldlNh7jqVsx5lkdwXeBpVekMqBOhFGYdjqClwPIu4veOPbVkwf/MzXzNAi3Xh6TPep/bs0oelCgUsDevNgBTgDqmGUZhnIFP75VNbqIHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9OXXSAc+QSWH7KSwUCV8pNzmWOSRW8bF80yrz4UqCcQ=;
 b=focMSyEkheqq7wyBppsjsBwbjqE8mn4NbypOUap+9i/9ILVTjxWqhoKNNMqfPnYlgNfMNKzBJ4niiIju1zn3I3xrTWmwEEYgKXFwTGrk2cEn5zYReeadQM2qPZ8fALgdHqG/1Kcu/Ep9RCzRnN851v40XsmFOlPJQrmoT7dutLVgclDXuBk2q+BI1bN3ErzA4/pXDMLXrcjqW5bTex81mUxk/0kThQJsorI07xzZW4cBzjuhpN3O5o0tzKflZAyNnrGfLiPm4gi9FD4XltTldLaym/6Hz+jxAW4DKaoEPFf7IpQv8lWBZWfvT1HBqLSPuWe+UQ85q8wnYk8g1jafbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9OXXSAc+QSWH7KSwUCV8pNzmWOSRW8bF80yrz4UqCcQ=;
 b=MPq3x/hkYmcC5dhCvrAcXkRcpfBWjDrZ/P1CF7o3IiQhDtOJ39Gj9SvUfnJnmMIEQxXmVd+Mjl7irr0jqAyHqDSPCCOCPwccjtSNocFJNohIuQvHfnscJcRmKiC10ChIeTGgZc93ndF4LJsbn43h816oN3dEX5jXsW+4U124X+M=
Received: from DM5PR12MB2517.namprd12.prod.outlook.com (2603:10b6:4:bb::13) by
 DM6PR12MB4418.namprd12.prod.outlook.com (2603:10b6:5:28e::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.17; Wed, 11 Aug 2021 22:22:07 +0000
Received: from DM5PR12MB2517.namprd12.prod.outlook.com
 ([fe80::2560:34ab:f08a:3248]) by DM5PR12MB2517.namprd12.prod.outlook.com
 ([fe80::2560:34ab:f08a:3248%3]) with mapi id 15.20.4394.023; Wed, 11 Aug 2021
 22:22:08 +0000
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
Thread-Index: AQHXjtE+3YKNVwRF7EO/RHavM7Obqatu05sAgAAGs1iAAAYLqA==
Date: Wed, 11 Aug 2021 22:22:07 +0000
Message-ID: <DM5PR12MB25170437A4A0C2DA2DF452B6E4F89@DM5PR12MB2517.namprd12.prod.outlook.com>
References: <20210811165211.6811-1-michel@daenzer.net>,
 <20210811165211.6811-2-michel@daenzer.net>,
 <MN2PR12MB377506AD71308A47222A3E9583F89@MN2PR12MB3775.namprd12.prod.outlook.com>,
 <DM5PR12MB2517A081A60C1245D2A34019E4F89@DM5PR12MB2517.namprd12.prod.outlook.com>
In-Reply-To: <DM5PR12MB2517A081A60C1245D2A34019E4F89@DM5PR12MB2517.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=True;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-08-11T22:22:06.911Z;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD
 Official Use
 Only; MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard; 
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 09f519c7-0f52-43ad-870c-08d95d1674d1
x-ms-traffictypediagnostic: DM6PR12MB4418:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB441834160CCD86E3D79A0E50E4F89@DM6PR12MB4418.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SnniL0t5dDSVuVYLMQol23vpk5SS/Hq8/yOo8jzZttNIwDiAsojxBTC54EbT7dEJ8uApwzkGE+laYSZwU50ew3+C8o0hJnsT5sjDfI5xTU8n0O6TVtS+ESlurvWM6VLXkNbE5+U7xGuG3+79jxuxcxn+KE6aQFZuqR2FtPInPW7EUBDv0j93UnXmuW+SVLiDZuJEb3/WmcRjJoQxzFGM6JcSvoIXUgvhESa3PIv/nI/rVTyyocYilGXdiRK73CeWk2/PfprDzq0RMGJtH0CfFZg9IaONxXwDOhF5Qqww1wtdLB34cJ6Gmay2ST9d8Ehy1Ph6pZ36CODoq/XTpw30PtzWDxKKdqokM02GuwXbmbzrut4tgbuumNdPa8z3IDpAbFqIYEQkbQ9jUGXb8uu/QvMFvBcfeTjQcmq/nJDhlxBkb05t2vNMS3gVKY+wTWDy/0+ReeMhLNW4sqX66k1W3QyOd11GtTXF6MMgds/U3sOroO/ocOH9YXca1twWXDxJKz874BzI5nImZ/oy4XR9tq1TcBUumbX7t42ZBF6wL1vzuP3V8lCQ0M2/NGcixXgmm83dnHxUWaORA1Z+FmttGMqfn/jh7XY9UBm7Gt8atyAk9LMVyMhFwKEmYnSWE//wkZmBFA4UKzLgw+4UwWcnAlLf/yPeGE740u6a22qYxz2V4AXNH9DFjQQExbRQZLKqqJlzKfusLlHszGBQSoaXHQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB2517.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66946007)(53546011)(122000001)(76116006)(66446008)(186003)(66556008)(6506007)(110136005)(38100700002)(26005)(55016002)(66476007)(71200400001)(8676002)(83380400001)(64756008)(33656002)(54906003)(316002)(7696005)(9686003)(19627405001)(4326008)(91956017)(52536014)(5660300002)(86362001)(2940100002)(6636002)(8936002)(508600001)(2906002)(38070700005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?WZWZPRG1tUZheA1cds7MJE14bi+bbSsgOhOpspjHvPytzpIC806ODhVbzT?=
 =?iso-8859-1?Q?cBNiOaGLUnciETgBDEBOHgHT5GhojxPPl3lJxrynjYr3+vxOINaxyll1l1?=
 =?iso-8859-1?Q?btq3fbYGc1u1PKJweW8yuPmq5p/aWGbalizz4W+xV1tCvVH/22TtMTtgxP?=
 =?iso-8859-1?Q?FVc+9c4GTFPQvrqSbPbFDNLgQleqZuba4f66YSH92qfp++cl/sv5IeZp+t?=
 =?iso-8859-1?Q?BJSNMeodQIGXrCUc4fzLRipGpbdOk1BQszwigzjNxwG5F2p8xONoj/IQnv?=
 =?iso-8859-1?Q?xozMqvDVWIhwbDZe8Ox1F6ZzT4FRB/nAY6+3P84NESt0QJpEWatOdUjuh9?=
 =?iso-8859-1?Q?E9l6oJgjt1q/SWdySFKeddQI8m0Mm5mqVhIMKeHtXfvYWQ5K8VlRZI/4mq?=
 =?iso-8859-1?Q?iKQ4CwR4WheTZvv6txdXidVRSwZQunbOaxAXsCz0DQJyL6gJSrs5I7Y0aU?=
 =?iso-8859-1?Q?KJaPdkSIv9lCyub4yoQgfPn1cHzixrQij30IH/cQVN2DgnBse387rC7rZu?=
 =?iso-8859-1?Q?dVrLRqR6hSx80cPjXxWU/H2lSG2wR8ihlZG2U6fvYues94agiyAzZkcSPc?=
 =?iso-8859-1?Q?+TcSNUoZ38HCS+aQvkoFEzw0Bj2iuxd7Z5UfpaUpFhkoIQWF+tVTThLiOI?=
 =?iso-8859-1?Q?mT8zpASk6ZahhwKjO7VeyAceJ2Dt7k3cvupe2DNg880Vpw9lyUztBqJWxP?=
 =?iso-8859-1?Q?wmjjTIFJA6Mb5qJ3wxxGkox0uBvRtNh4l7mcyFVr2+UvRYXUy9mF9jgruT?=
 =?iso-8859-1?Q?EVLzpzh4q8BCkbv7b7wTTIpOT9c45Q+8n0Us/sWBkLc+jEK8LR1/ryo6SI?=
 =?iso-8859-1?Q?KzPq1NrSrQwxAs89O+9/i0KP8Qh3x3Oy5JPxnBVTuOO0vE1JNeL2ptRuvX?=
 =?iso-8859-1?Q?SSPIRoeJEy7CWHZWiJp+d5t1daRGlVFuoUuBFdepCroXW/ZXsd20qy768x?=
 =?iso-8859-1?Q?kGdsmz3TFKEWQ2GLZAxcMCQAoiwuF5TvFcknU3bsyNr/tr9QZNJdwMOniJ?=
 =?iso-8859-1?Q?ONsN6R1XRAq9L27e24bakWBXFXE5REFBmV8PmrGsJpHwoF6g6zaxZAuB3Q?=
 =?iso-8859-1?Q?5PW/clkp5okJ41m3BDa3ANxiM8CAWnQBWG8R8QGrDwbV8hCm2xa27fsAxL?=
 =?iso-8859-1?Q?4k+pB4waF/OBpWRJALnOJOLQCCZHUaYQi5mtEVauqtBWhYbi7R/EQ1IodI?=
 =?iso-8859-1?Q?KY/xGR9RRMLNfMO+w1L6i+JjRqrO64togI0ryUTwM9Fbl8+rFZ9wEzFwyc?=
 =?iso-8859-1?Q?I/v0kaCzEpfIYqo28FEHz1jdPsA/1MjpNnXew8HYmJH5g7BS9IWalhu9x+?=
 =?iso-8859-1?Q?mJS8hG/pzAZ+mkFqdxJss+q9AFpBzhGFvSxnRDCeA4FZGZpjxsrpa4joon?=
 =?iso-8859-1?Q?n2wTKoEXcS?=
Content-Type: multipart/alternative;
 boundary="_000_DM5PR12MB25170437A4A0C2DA2DF452B6E4F89DM5PR12MB2517namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB2517.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09f519c7-0f52-43ad-870c-08d95d1674d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2021 22:22:07.8199 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 600qbDWsNdW3rIcj2aloxnkmEMocXA198Bkvb32cbUW2CEysVcTz1vuIu4l/7q4n
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4418
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

--_000_DM5PR12MB25170437A4A0C2DA2DF452B6E4F89DM5PR12MB2517namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only]

I shouldn't say reduce one delay work call ,  For this case, Michael's prop=
osal is closer to idle work design's purpose.


Thanks & Best Regards!


James Zhu

________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Zhu, Jam=
es <James.Zhu@amd.com>
Sent: Wednesday, August 11, 2021 6:12 PM
To: Koenig, Christian <Christian.Koenig@amd.com>; Michel D=E4nzer <michel@d=
aenzer.net>; Deucher, Alexander <Alexander.Deucher@amd.com>
Cc: Liu, Leo <Leo.Liu@amd.com>; amd-gfx@lists.freedesktop.org <amd-gfx@list=
s.freedesktop.org>; dri-devel@lists.freedesktop.org <dri-devel@lists.freede=
sktop.org>
Subject: Re: [PATCH 2/2] drm/amdgpu: Use mod_delayed_work in JPEG/UVD/VCE/V=
CN ring_end_use hooks


[AMD Official Use Only]


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


--_000_DM5PR12MB25170437A4A0C2DA2DF452B6E4F89DM5PR12MB2517namp_
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
I shouldn't say reduce one delay work call ,&nbsp; For this case, Michael's=
 proposal is closer to idle work design's purpose.<br>
</div>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
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
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Zhu, James &lt;James.Zhu@amd.=
com&gt;<br>
<b>Sent:</b> Wednesday, August 11, 2021 6:12 PM<br>
<b>To:</b> Koenig, Christian &lt;Christian.Koenig@amd.com&gt;; Michel D=E4n=
zer &lt;michel@daenzer.net&gt;; Deucher, Alexander &lt;Alexander.Deucher@am=
d.com&gt;<br>
<b>Cc:</b> Liu, Leo &lt;Leo.Liu@amd.com&gt;; amd-gfx@lists.freedesktop.org =
&lt;amd-gfx@lists.freedesktop.org&gt;; dri-devel@lists.freedesktop.org &lt;=
dri-devel@lists.freedesktop.org&gt;<br>
<b>Subject:</b> Re: [PATCH 2/2] drm/amdgpu: Use mod_delayed_work in JPEG/UV=
D/VCE/VCN ring_end_use hooks</font>
<div>&nbsp;</div>
</div>
<style type=3D"text/css" style=3D"display:none">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
<div dir=3D"ltr">
<p align=3D"Left" style=3D"font-family:Arial; font-size:10pt; color:#0000FF=
; margin:5pt">
[AMD Official Use Only]<br>
</p>
<br>
<div>
<p align=3D"Left" style=3D"font-family:Arial; font-size:10pt; color:#0000FF=
; margin:5pt">
[AMD Official Use Only]<br>
</p>
<br>
<div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Hi Christian,</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Since we have strict check on queue status, I don't think original design c=
an cause issue here.<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
But this change should help improve below case:</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
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
family:Calibri,Arial,Helvetica,sans-serif; font-size:12pt; color:rgb(0,0,0)=
">
<br>
</span></div>
<div><span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-si=
ze:12pt; color:rgb(0,0,0)"><br>
</span></div>
</div>
<div>
<div id=3D"x_Signature">
<div>
<div id=3D"x_divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size:12pt; col=
or:#000000; font-family:Calibri,Arial,Helvetica,sans-serif">
<p style=3D"margin-top:0px; margin-bottom:0px">Thanks &amp; Best Regards!</=
p>
<p style=3D"margin-top:0px; margin-bottom:0px"><br>
</p>
<p style=3D"margin-top:0px; margin-bottom:0px">James Zhu<br>
</p>
</div>
</div>
</div>
</div>
<div id=3D"x_appendonsend"></div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Koenig, Christian &=
lt;Christian.Koenig@amd.com&gt;<br>
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
<div id=3D"x_x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif=
" color=3D"#000000" style=3D"font-size:11pt"><b>Von:</b> Michel D=E4nzer &l=
t;michel@daenzer.net&gt;<br>
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
<div class=3D"x_x_BodyFragment"><font size=3D"2"><span style=3D"font-size:1=
1pt">
<div class=3D"x_x_PlainText">From: Michel D=E4nzer &lt;mdaenzer@redhat.com&=
gt;<br>
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
</div>
</div>
</div>
</body>
</html>

--_000_DM5PR12MB25170437A4A0C2DA2DF452B6E4F89DM5PR12MB2517namp_--

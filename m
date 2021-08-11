Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E88783E9A6B
	for <lists+dri-devel@lfdr.de>; Wed, 11 Aug 2021 23:34:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 983006E1CF;
	Wed, 11 Aug 2021 21:34:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2047.outbound.protection.outlook.com [40.107.243.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C6776E1CF;
 Wed, 11 Aug 2021 21:34:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DxBQpQM5opzDm0HCGM0EhM8rWKjYzUXeLf3tqctDyJZ0LVQzDcsLWBNXOw4cAO5XV7npxES20zfZ+asiZgORLYTJxWDmXt7Zr76QM/nPRYZIVXIQzzI07nkWIkbEikL9sZ4/WJYc3HBfDkdS+0BhRQOUGmlbb9zHpAvcq4m6kqOKQjVBhTHxc2pqLAAGeEdh5DszPzA+aWd/vxyx1lAqQb8v7VJtKJDaGY6fTndfSg0Oouj4lNGt6XCui8xbvKSAFHBAjbdnTpgmssil5U3n5hqJkUyWWkdNJ0LEIhtmkgMVacyBmsuZnIEhjNn7dex0nI3mLty38fcFlSLz8f5WbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=61I+zyTg8uWqeVul0hqJQKba5zsWcdFNUoB65+SCRrA=;
 b=eqAsnp5f0fr8ceE37X1a/Xn31e/KwEjv9demjHbjfpsjm4hbIaW+ZDaH06WSNQEbxuYE4lvvJKrXaH0MBEo4Ku5VvtoTUzxlsCsLHxMq5CGgB5kQtGBaGX7CBw7fAknLMZplQS3+a2a2cGAELiw1e3mBQhtDJElCXoWBdEwHNdVNZo1qnJSkgGF4IB54cpUvGItUsOqnmvYWW6iu7nuy4+S8P6oDypK7gpZrzLxT2xEe2xbvMiLOKB9UyCLQnZ6eqIhYJjmq4OltqOqlNsx3BZiKO5Oz5lHFhdnfxkAO+8wwfL5e8R27eNe9OsMI3taFbR7xHsYq4+DNv6YRXctjZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=61I+zyTg8uWqeVul0hqJQKba5zsWcdFNUoB65+SCRrA=;
 b=QKyeFgOq/Egd/dJcPpEHOz/kv8CoNMrxLAGARY76Upksy7YXyU4boqMo55BrugXcCpyDjihQX7goGqyM0Mm2lcnT4Sc6xkVpngA4eESTGX/hQ34UfDCEz3VS4zUZnM3ZYx60V80vFYWyfX0xM89IeIAd2XUB73t6b/v57Vk5T6Q=
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4518.namprd12.prod.outlook.com (2603:10b6:208:266::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15; Wed, 11 Aug
 2021 21:34:10 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4394.023; Wed, 11 Aug 2021
 21:34:10 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: =?iso-8859-1?Q?Michel_D=E4nzer?= <michel@daenzer.net>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>
CC: "Liu, Leo" <Leo.Liu@amd.com>, "Zhu, James" <James.Zhu@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: AW: [PATCH 2/2] drm/amdgpu: Use mod_delayed_work in JPEG/UVD/VCE/VCN
 ring_end_use hooks
Thread-Topic: [PATCH 2/2] drm/amdgpu: Use mod_delayed_work in JPEG/UVD/VCE/VCN
 ring_end_use hooks
Thread-Index: AQHXjtE+BWy+t4LDY06JadgZjDnxmatu0Vw/
Date: Wed, 11 Aug 2021 21:34:10 +0000
Message-ID: <MN2PR12MB377506AD71308A47222A3E9583F89@MN2PR12MB3775.namprd12.prod.outlook.com>
References: <20210811165211.6811-1-michel@daenzer.net>,
 <20210811165211.6811-2-michel@daenzer.net>
In-Reply-To: <20210811165211.6811-2-michel@daenzer.net>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: daenzer.net; dkim=none (message not signed)
 header.d=none;daenzer.net; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 05f0994b-caa0-4c13-2567-08d95d0fc1bd
x-ms-traffictypediagnostic: MN2PR12MB4518:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB4518B602F1F20AD44EE5261183F89@MN2PR12MB4518.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QkAyYQJ0eTNVB+ooxgrSoB4FW6DxZLYTeeIZ0nx/eGxlGU/VULuVS9w8yIo35MWiJ/vfx31psuPiGyAQYzxflD2qBRzXQiC7Bilrx7+XeuQsmOZTQHLlrlv/nFXiZW5mCurr6SjWoNE16NHvxFbXmuPTptK+z1Kj5PVW8QIoQlKnYBH5p0s8zIotohP6IAqf8JBwscWlcwLVj9fUmZwtdOfdmalLFpbX1UOYtswkqYCsaGVryOH4XiduztCKgCmRvDdi2e5LDkS7j7Vrzku46RTRVUvW3+sz2fKIgXC+YtDk++w1AFryfxLmAHQXlTOXIswaR/Q4P2Z4SZ8SlovLtph3zm+Q05EkLYnRYX1aSqWPh5nyxoxiw8wXsUA1lLPgu1OLnWfG9koWc3p+YL15NEv6uUawLMyR0hpZT6QAB8LlFYdFLpXSd06cWVmC6JZHIfuwNrS7WXA1apam71e3H5Li92Jz/XW5/AHgu1bW9mJC89IaobgZYgeuouIfElVdPT4j4UBLJ4+fISxrlsaYiXDnMusZ8Hyo3NpS1ABj2gr2kKNibFTQW/34WuLH+L10W6EHa0eaGcJewoI1hQmhCku9ryjh4PdV7iZMaXK8V+NzpWePeBSgbFhrTf9XfS+87XVZBGNI5K3KRIv3HrzK3pKBJyuvjmdq0AZskuwqeiuhr8OT9G+zZqYwppU589/JDQBWEx3nYV+yDSIebicqKw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(396003)(346002)(136003)(376002)(54906003)(9686003)(55016002)(316002)(66946007)(91956017)(110136005)(76116006)(6506007)(122000001)(478600001)(186003)(38100700002)(7696005)(26005)(38070700005)(71200400001)(83380400001)(5660300002)(52536014)(6636002)(33656002)(8676002)(8936002)(66446008)(2906002)(4326008)(86362001)(66476007)(66556008)(64756008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?MtZkKHdtPz5BRk+Et25Bwi7omo+S9dsCJJCd2Eg6r7sjXlNjjj7qQucZQ8?=
 =?iso-8859-1?Q?aLcx3fndhxSazrlAiQTWEKYnnMUSWZ+3qFe73VUyogQRAz/BpHYtRLq0Ba?=
 =?iso-8859-1?Q?u/tvQEcL2axlXSSh5E5DfHvKBb4VXsMzUsJkfXE84a/Ge/MoLfn9MhqvWE?=
 =?iso-8859-1?Q?54jhU/TFjYMv/wcmFReyAC0ibax/v5grUI9o//4o6AmTdptUVHegYQ/AYU?=
 =?iso-8859-1?Q?RvFqmjAATGgUoatL0I+tGifMIPgzVAVub1y/idLKJU06RsY60psgg3qE9o?=
 =?iso-8859-1?Q?AWcs7gX0TgrLs9GGHO30fDprvBjUH1S01tijrPKKpXwe5nkN8KjHfCbTDw?=
 =?iso-8859-1?Q?fdhfa8jGyyD6YlW2+9Zm69qPLigtBc3rRItI6sQjFg2zSPk6ABza0F5qib?=
 =?iso-8859-1?Q?QP1gjLNbEzN0nMfDOcrGuYz7tG0hSOZs+7AHcs/L2y0QaSEfku1o1dMT+d?=
 =?iso-8859-1?Q?LK6L7VabDP6g4Mw4J06kvVWhehYCV/fMaQPOLpxZSNI8lWyv0QEWCuU/gg?=
 =?iso-8859-1?Q?NVgnXZI/How6xSPgDjAbw320KIrynJOhPQMdkLBUNN5ip0aKgKQTRNG63j?=
 =?iso-8859-1?Q?8JqoZG9oRoNf96mV4HXH+6yO48INA8XX4gZi9ZWjLFemtEPnzrKCwlTU6K?=
 =?iso-8859-1?Q?M0EIaU/x7vg5uq7KHLWtWiSAqrnqbpRWgjO0+HhEhgrJ35xHi20kzCBytE?=
 =?iso-8859-1?Q?Uq38QHsFXl1w8sJsnI/lwWEA651rC9igA493MIJFLog8yRlbgW1IQzNAuq?=
 =?iso-8859-1?Q?/iwAWaHJgrcwCxZItaAopGP8ALz9+4p1nSktZ6YuczNOR8JCckiMJS0/uS?=
 =?iso-8859-1?Q?P7bB5EIzbcYc06c+XrhqtBwhvl3G5QWkQBt4rQ4KkhxVqkVNClj+xkmZNg?=
 =?iso-8859-1?Q?ikxARsmsX8rMvfyX6kLqkF3qUia3X9MMQ3NXs1Fha+ber6yKJYu+y01u+4?=
 =?iso-8859-1?Q?9rZ4YqkPcTzVCxmQFzlpLgdi5xKCTPOnXb82yphOegQ/tlp73WWojLXPJq?=
 =?iso-8859-1?Q?sNLDjD4ePpLFujBC53Qq8AxIOEnvr81pI3BVeNnVENWi/O7scBxUrlUgeo?=
 =?iso-8859-1?Q?X9dq4D1errUYiPJeVY9DBwZQdiXVp3Sa1X7WEmGFgzonmLASTRBVWb6BRV?=
 =?iso-8859-1?Q?/F1jo+DHz7oUCbpVigOkaKVsTvXHAKD25avOehXvgh4/FkLNDnr6be0bWz?=
 =?iso-8859-1?Q?qDQ2K/l4oo6bWJ43SdLmKF8lVfih4I3GOLL0CUv/U6NGOF1hvDBDS/Z1Zb?=
 =?iso-8859-1?Q?HKE21EnW6syoxCQWfnwqjg1AqnnmGBvdA/aFEO5rgv86n8VxHfmszMJfka?=
 =?iso-8859-1?Q?Zm63txHj6diG7VPWtCT2u5p+eDcCdoAl7NuHIzPgOM5/EzE=3D?=
Content-Type: multipart/alternative;
 boundary="_000_MN2PR12MB377506AD71308A47222A3E9583F89MN2PR12MB3775namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05f0994b-caa0-4c13-2567-08d95d0fc1bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2021 21:34:10.4497 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jWWXKagG3ZquqGlJD0NQ9FbnWaqitJ7+4ZaERuQfbdDLvQ2Q7/YLPuBEFGYiaO9N
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4518
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

--_000_MN2PR12MB377506AD71308A47222A3E9583F89MN2PR12MB3775namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

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


--_000_MN2PR12MB377506AD71308A47222A3E9583F89MN2PR12MB3775namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
</head>
<body>
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
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>Von:</b> Michel D=E4nzer &lt;mi=
chel@daenzer.net&gt;<br>
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
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Michel D=E4nzer &lt;mdaenzer@redhat.com&gt;<=
br>
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
</body>
</html>

--_000_MN2PR12MB377506AD71308A47222A3E9583F89MN2PR12MB3775namp_--

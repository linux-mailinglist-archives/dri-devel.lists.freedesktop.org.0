Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E34B1FA6D0
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jun 2020 05:26:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 718106E81C;
	Tue, 16 Jun 2020 03:26:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062.outbound.protection.outlook.com [40.107.220.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82E3B6E81D;
 Tue, 16 Jun 2020 03:26:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PR42pd6BqXd9P0jZ1Rtw72gPrkUz2SYNLP7R6kluKD09xs27jWZHm8xhrkgE0G9JUTAHMerlWlR3EvVHkmsLXDLU8ndFfp4zXLLsI2LNixN8F4tC8qy2QVfWVveZFk4xDMNFszFVDIThGQC6H7G0VHh+ef6HIw70FtzSyj1x7vskBnD5avauZFCU84Hwctz8dTpj/SXLnhsoU/QSyZSs2hC56Ih8rt2wqofAu5/18BAiFk4Yia3x8w4oR36PhJd9cJPLDz5M9EGzriNsZw4Arh5NG+V2+LrRMxPGl7WMKSJXtlyCdsm1UuHTIaAiUHR2hcenmqtE64Utjp0VbZN2Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=950eqgcI9TSXOLEUO53JgvtfFoF2aQqAqU8X8TgjlXk=;
 b=ogqt/h1GPLQqEpNyxQHZDXYH4tWQzJSEJxweV9vP4pE2f3gVx98v6wI0ZESp1qa8doBnJmVWWnPztR+CkwkODnWa6w/1AU8S2DVYikQ+3qzmzk3YUHBBFiVdmEafirDQT+50kv5h+oWOhV0aaRd5JWasst2JO6aS+ledRCOXL1CYvfcvI86ePNWImXcEzwidHi65/BjzuLs2LQa1HKY7kcqu4FwhS11eXYQzC2gDf7CwrHJ0lbt58erepbU1Geq5F+TLULB0Clp2fT2CbFl5GtFtRj7IxC5ImWS0RYDIJjxAHGve80AaWu0gbEcX5td+RmDbQSmbT8bwD7eP1niqWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=950eqgcI9TSXOLEUO53JgvtfFoF2aQqAqU8X8TgjlXk=;
 b=atu2KqCeuudx/c0H9I1ku7NyCPIetMIqkn62uOrSLelWwQsnd9QU6tLPBGLvbO2yQKEURS1SLWqkwF4jnDqvkAnYO2t1E+stGUudXPVKY8gPzMT161GTkhlwlU2V7LyOO26ZFlQdwBe99uoHhnJibQ0Imawy9cwjXaEXy1SFo7o=
Received: from DM6PR12MB2619.namprd12.prod.outlook.com (2603:10b6:5:45::18) by
 DM6PR12MB4435.namprd12.prod.outlook.com (2603:10b6:5:2a6::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3088.18; Tue, 16 Jun 2020 03:26:23 +0000
Received: from DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::c157:8999:dcc3:536f]) by DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::c157:8999:dcc3:536f%3]) with mapi id 15.20.3088.029; Tue, 16 Jun 2020
 03:26:23 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: Aditya Pakki <pakki001@umn.edu>
Subject: RE: [PATCH] drm/radeon: Fix reference count leaks caused by
 pm_runtime_get_sync
Thread-Topic: [PATCH] drm/radeon: Fix reference count leaks caused by
 pm_runtime_get_sync
Thread-Index: AQHWQuauNl/WjlQpGECR+5+KDwzsI6jalfZQ
Date: Tue, 16 Jun 2020 03:26:23 +0000
Message-ID: <DM6PR12MB2619368F4139A00380A5F397E49D0@DM6PR12MB2619.namprd12.prod.outlook.com>
References: <20200614022122.124908-1-pakki001@umn.edu>
In-Reply-To: <20200614022122.124908-1-pakki001@umn.edu>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ActionId=6f7ec339-cbe6-4918-8ec0-00008d425f0f;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=0;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=true;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal
 Use Only - Unrestricted;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2020-06-16T03:26:12Z;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: umn.edu; dkim=none (message not signed)
 header.d=none;umn.edu; dmarc=none action=none header.from=amd.com;
x-originating-ip: [58.247.170.242]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: fb03db33-953b-4ac2-18e0-08d811a50bb2
x-ms-traffictypediagnostic: DM6PR12MB4435:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB4435C1467B52D57D1F2B6C72E49D0@DM6PR12MB4435.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:415;
x-forefront-prvs: 04362AC73B
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NWgMEmcrUgTzZ80qlhbA9BASCrBmZbI6+uvQDHhDvAHUHWGfGVwErGTxzoiLbaOz+LXvJRlvOMLmHv08S9j9vVRvkEmLv+GC3K5EAoPJq0S6izRKYQHDbYiwDQ4IBf7DRiinjV+JnREggmuI/hntX9fYWOCQ+trEfbHgCTWYZ38tNL2jX0USmNrrsd5HO2bCllORjKqHUsN7zlk1gKGV8Uol3/IftF3+Bge8T0Vaty+6iSuoxlDzd8Xijs1A+tfDcIECFxxwTgo4P0XDVJA6bKvKz16DISjSfUyARC95qArYHqp/XhhUcVE6qwg1rDKXY1FprexKu2pRKXl0JOgjUSLZ5dFo5LFf0LfEAwQLt60=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2619.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(366004)(396003)(376002)(346002)(136003)(54906003)(8676002)(83380400001)(478600001)(966005)(45080400002)(52536014)(5660300002)(71200400001)(8936002)(4326008)(33656002)(186003)(26005)(6916009)(6506007)(53546011)(2906002)(316002)(66476007)(66556008)(76116006)(66946007)(66446008)(64756008)(55016002)(86362001)(7696005)(9686003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: dyACNK9uM84la8QsJcgDBC+rpdxApv6b3R5FMR0HDK2I1NiCxjsmUycgiTi9RNI87bOz8BKSHsP7/sux0hu+rNZGqu5WKVtEVBeajgznS6xdm6La7gUu+JMI838zg3qkXPvnzbL1CT+WAeGyd6/cg8I7gvYVqrb3d84HpchqQ+0lFQaxF7nBqDbbtDB4ravqHXvKvv0nEy4gggEq8fjG/Pb2MeNyyydafyY0yNwV2Prloxn1ZgoeyX5m4T/8yCCVx7t3uhpgIXLFBQ25IzXG6SOWgZh4xHbivg7i2qep2RHBeNy9r+ZiVXAxqZp+0Sd8NzhvEDE2RmYj1glEvZed43+q83m/V9+WGUUnaA3LtS77SA/ixuZKinso6LE8HAUa1Ad6rpzX2tiS7c+V62ZlItgIMmbj2DWV1Je7iGgQPFebwwZBVCmvzpiYdqgwSKiNI25vEWZMPlvRWHgpiNztvcbbskCcFLeg5xe39P9q2eEwXYU0FNtP7p/+oqaF6kAB
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb03db33-953b-4ac2-18e0-08d811a50bb2
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2020 03:26:23.5193 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kM0k/oApvg1gruyQCZP1eMQoaKa/nxoWzrnk0dBez/KNbfaRKx+YSLFSToFJXbFJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4435
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
Cc: David Airlie <airlied@linux.ie>, "kjlu@umn.edu" <kjlu@umn.edu>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "wu000273@umn.edu" <wu000273@umn.edu>, "Deucher, 
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only - Internal Distribution Only]

Acked-by: Evan Quan <evan.quan@amd.com>

-----Original Message-----
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Aditya Pakki
Sent: Sunday, June 14, 2020 10:21 AM
To: pakki001@umn.edu
Cc: wu000273@umn.edu; David Airlie <airlied@linux.ie>; kjlu@umn.edu; linux-kernel@vger.kernel.org; amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; Daniel Vetter <daniel@ffwll.ch>; Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>
Subject: [PATCH] drm/radeon: Fix reference count leaks caused by pm_runtime_get_sync

On calling pm_runtime_get_sync() the reference count of the device is incremented. In case of failure, decrement the reference count before returning the error.

Signed-off-by: Aditya Pakki <pakki001@umn.edu>
---
 drivers/gpu/drm/radeon/radeon_display.c | 4 +++-
 drivers/gpu/drm/radeon/radeon_drv.c     | 4 +++-
 drivers/gpu/drm/radeon/radeon_kms.c     | 4 +++-
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/radeon/radeon_display.c
index 35db79a168bf..df1a7eb73651 100644
--- a/drivers/gpu/drm/radeon/radeon_display.c
+++ b/drivers/gpu/drm/radeon/radeon_display.c
@@ -635,8 +635,10 @@ radeon_crtc_set_config(struct drm_mode_set *set,
 dev = set->crtc->dev;

 ret = pm_runtime_get_sync(dev->dev);
-if (ret < 0)
+if (ret < 0) {
+pm_runtime_put_autosuspend(dev->dev);
 return ret;
+}

 ret = drm_crtc_helper_set_config(set, ctx);

diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
index bbb0883e8ce6..62b5069122cc 100644
--- a/drivers/gpu/drm/radeon/radeon_drv.c
+++ b/drivers/gpu/drm/radeon/radeon_drv.c
@@ -549,8 +549,10 @@ long radeon_drm_ioctl(struct file *filp,
 long ret;
 dev = file_priv->minor->dev;
 ret = pm_runtime_get_sync(dev->dev);
-if (ret < 0)
+if (ret < 0) {
+pm_runtime_put_autosuspend(dev->dev);
 return ret;
+}

 ret = drm_ioctl(filp, cmd, arg);

diff --git a/drivers/gpu/drm/radeon/radeon_kms.c b/drivers/gpu/drm/radeon/radeon_kms.c
index c5d1dc9618a4..99ee60f8b604 100644
--- a/drivers/gpu/drm/radeon/radeon_kms.c
+++ b/drivers/gpu/drm/radeon/radeon_kms.c
@@ -638,8 +638,10 @@ int radeon_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv)
 file_priv->driver_priv = NULL;

 r = pm_runtime_get_sync(dev->dev);
-if (r < 0)
+if (r < 0) {
+pm_runtime_put_autosuspend(dev->dev);
 return r;
+}

 /* new gpu have virtual address space support */
 if (rdev->family >= CHIP_CAYMAN) {
--
2.25.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=02%7C01%7Cevan.quan%40amd.com%7Cc86101e02ef24c52b36408d810fdcc14%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637278029582429567&amp;sdata=qtKTCV33q8l2GTxMUX0nlJ4fV32dXaLH7y6hymksQEo%3D&amp;reserved=0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

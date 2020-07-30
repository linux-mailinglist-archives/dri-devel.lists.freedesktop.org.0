Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEFCD233A0D
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jul 2020 22:51:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9DEF6E961;
	Thu, 30 Jul 2020 20:51:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2055.outbound.protection.outlook.com [40.107.220.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3B156E961;
 Thu, 30 Jul 2020 20:51:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fu0PxyYs/6NfMW5dTbKgyVfORBk2J3h636Cr1dscJGLvSi0hNPy6T2AA3Dgz3NuQ0I7vpxm2s1TJr2VZilm9hoK5BSCVN4ApXjWTQUZDUfL3wdzU79aql66umx8PLmGk7HEmKlHiT7NxMGg9Ni8QWHi2dMvkZ3ulV9RTMMKsa6A9xe3XVWTCSxdXu3tWUlr7vl5WxF4r2wPJwW56tt52KR6OzXYSMycRO5O4WPKfqnUadQumCGFf6ZELIuW+Y09gZfveSGiSHcNC2vLZ4W0djA21Hb9Pi0mR8Tg+Zh2GjI/0OtWasBSbZgTVdDyFlDO8DH2i5xXOzkcsw8a7xi0qSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z9t56KwpJaDdSPdBs2OkiVlLyuZUVt4savZfgx5csJo=;
 b=FYPPxIS49vzvrJAQNWF5xujm58ZXVawSaPAEmeXLbditdQIUQVZTkAVPdEhRJPqNGsnj92l6cM7MllijECQd9bKTI77j7hb2FKrCJT3KiFnWD69MpDxkvfJW+/pK5tngtkh5+D7or6bVMH3NJyeS9vP05GQVKmF5rhLvvOjcuMhN7QDkuQaOJqGWPyTKlA4oV70JKD6Cb5hGpC3S69NAhbZJahbWMXv5ki9EGqU7FrDW1sIzaYw8rikQAWxQdRy7LUXYQxnR0oeJ+dm/5qAHPlk4Zj1VPaX+kjOFFh3g4Ixr3SlicdCjifawOLJL8CQWwu5UhmOLG5hgcJWZYStYeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z9t56KwpJaDdSPdBs2OkiVlLyuZUVt4savZfgx5csJo=;
 b=QgvTJRDy70YQ0DSMkLYSEfuI2ZEw0QfJBUk2dgcGdzkheuD8S8Ch/47lW8C7+FAwqO9xng1Dn1co4xebenvrkdE5VJERNmC9TJT5PHfnosQ8zgmE1tNq84X0D5jQ7Kn9pBkTJTKRMlXpoyC2ck+leNDfE9OiJqfMwxtPWshKVCM=
Received: from DM6PR12MB4156.namprd12.prod.outlook.com (2603:10b6:5:218::17)
 by DM6PR12MB4515.namprd12.prod.outlook.com (2603:10b6:5:2a1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Thu, 30 Jul
 2020 20:51:49 +0000
Received: from DM6PR12MB4156.namprd12.prod.outlook.com
 ([fe80::7082:21ba:6e45:32ba]) by DM6PR12MB4156.namprd12.prod.outlook.com
 ([fe80::7082:21ba:6e45:32ba%9]) with mapi id 15.20.3239.017; Thu, 30 Jul 2020
 20:51:48 +0000
From: "Wu, Hersen" <hersenxs.wu@amd.com>
To: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 5/7] drm/amd/display: Reset plane for anything that's not
 a FAST update
Thread-Topic: [PATCH 5/7] drm/amd/display: Reset plane for anything that's not
 a FAST update
Thread-Index: AQHWZrFFUB+6wWawoE2RPw+laMzDa6kgmQqw
Date: Thu, 30 Jul 2020 20:51:48 +0000
Message-ID: <DM6PR12MB4156762504BAA7D93403F882FD710@DM6PR12MB4156.namprd12.prod.outlook.com>
References: <20200730203642.17553-1-nicholas.kazlauskas@amd.com>
 <20200730203642.17553-6-nicholas.kazlauskas@amd.com>
In-Reply-To: <20200730203642.17553-6-nicholas.kazlauskas@amd.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=true;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2020-07-30T20:51:42Z; 
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal Use Only -
 Unrestricted;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ActionId=b36b8883-c7de-4f46-a499-00008c75284c;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=1
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_enabled: true
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_setdate: 2020-07-30T20:51:42Z
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_method: Standard
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_name: Internal Use Only -
 Unrestricted
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_actionid: 0db3b56c-a9e8-4de5-9e61-000004a9fb8e
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_contentbits: 0
msip_justification: I confirm the recipients are approved for sharing this
 content
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [2607:fea8:3c60:9c20:6158:abe:c77:fb4f]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b72db5ea-3d58-43ed-c137-08d834ca6118
x-ms-traffictypediagnostic: DM6PR12MB4515:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB451518590C8122572AABD956FD710@DM6PR12MB4515.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FJkVAw0NGvay9588mgAmwb/DHuX9lvXJRH2fUHt/zLZx737ajMljAxkPgdQqzd5FxP1spAyhzm7z2fjJJRlvWH63mx3PbiVru2JzNKN0Iu1NQklBxrVbcz4/jfFWhK/j2DhLLcgIIFEBKIiZMT8B0DJYu0Bq7VY2pgzBp5Q2lS+XqV1kSgrJ4Qe49d4ibaQd6uUNoMhX3AiH3rPkQzHAeHeXApSAP4Osrv8iSojnb8l2rJdgBrio7Yx0XVs8zIU9WjWh1vo612H0zL4+B2/brC6hYexKL9/Jn/INUD8z6Tyr6Sz5jT3JYH7xzOKkTXVR
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4156.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(39860400002)(136003)(366004)(346002)(396003)(2906002)(8936002)(52536014)(33656002)(186003)(9686003)(55016002)(6506007)(4326008)(53546011)(8676002)(5660300002)(86362001)(15650500001)(83380400001)(7696005)(66946007)(54906003)(110136005)(316002)(478600001)(76116006)(66446008)(66556008)(64756008)(71200400001)(450100002)(66476007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: /EAvo1PCzfj7vt22dEToI2q7LkoV3UPD8TRiXCaA4oe4onpxq4GHFiJ2IydPlsWcFzuu8xZmAlXUAMJsl9X3tMvxd+RpSEwO5Vg2Mqhw5Wvd3r50gr10aWRgYPADQ45/sgWLM270gAJ2XD/0xTRUD+vfrjfu+wUnU8wRzB85gftEhd37bAi0bPDq4pCHz9Tf0IXU+QCfCzJZt8Ank8i7wFB60kK5WV7aqEI/+x01cIQx7Hfi4C+uy0aa2ehAoW0VjI+ga//4Rt+5XXs9SpHwmsW+25v9vO2rIyffirZLhWtLmIT0G3NUrhEZyhyByVM+XvlT0ulXWFhEGcUsm6qVW/UfGaphkn2z79ph6gfSxjhJhAbsTELK+waa0C2neVbXSDKs7GTZrcwTeiQ/6nMMn30hNIUpDjoi1EeXvbIM50DaAQAqAFWsJna87TTBYevEIEUTARwdmvx67wA5uSFc6UShxQOg5PQSppMj6ISpkm3fdNxRbQF3f5+Hr7xa8aQ01Elo1pKdHZ2MKxglvUZ8U5xTsPHaMGjSs/FatgDMB7s=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4156.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b72db5ea-3d58-43ed-c137-08d834ca6118
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2020 20:51:48.8611 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LBAWWXLSRe5HlO1xtb9D9W6BMZd/H6lvYYFrzphrIsKHWBZlT5zKKUsz8E11eHUqNXNaqP4a7g0G5k/XLBOgpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4515
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
Cc: "Lakha, Bhawanpreet" <Bhawanpreet.Lakha@amd.com>, "Kazlauskas,
 Nicholas" <Nicholas.Kazlauskas@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only - Internal Distribution Only]

Reviewed-by: Hersen Wu <hersenxs.wu@amd.com>

-----Original Message-----
From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com> 
Sent: Thursday, July 30, 2020 4:37 PM
To: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
Cc: Kazlauskas, Nicholas <Nicholas.Kazlauskas@amd.com>; Lakha, Bhawanpreet <Bhawanpreet.Lakha@amd.com>; Wu, Hersen <hersenxs.wu@amd.com>
Subject: [PATCH 5/7] drm/amd/display: Reset plane for anything that's not a FAST update

[Why]
MEDIUM or FULL updates can require global validation or affect bandwidth. By treating these all simply as surface updates we aren't actually passing this through DC global validation.

[How]
There's currently no way to pass surface updates through DC global validation, nor do I think it's a good idea to change the interface to accept these.

DC global validation itself is currently stateless, and we can move our update type checking to be stateless as well by duplicating DC surface checks in DM based on DRM properties.

We wanted to rely on DC automatically determining this since DC knows best, but DM is ultimately what fills in everything into DC plane state so it does need to know as well.

There are basically only three paths that we exercise in DM today:

1) Cursor (async update)
2) Pageflip (fast update)
3) Full pipe programming (medium/full updates)

Which means that anything that's more than a pageflip really needs to go down path #3.

So this change duplicates all the surface update checks based on DRM state instead inside of should_reset_plane().

Next step is dropping dm_determine_update_type_for_commit and we no longer require the old DC state at all for global validation.

Optimization can come later so we don't reset DC planes at all for MEDIUM udpates and avoid validation, but we might require some extra checks in DM to achieve this.

Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Cc: Hersen Wu <hersenxs.wu@amd.com>
Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 0d5f45742bb5..2cbb29199e61 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -8336,6 +8336,31 @@ static bool should_reset_plane(struct drm_atomic_state *state,
 		if (old_other_state->crtc != new_other_state->crtc)
 			return true;
 
+		/* Src/dst size and scaling updates. */
+		if (old_other_state->src_w != new_other_state->src_w ||
+		    old_other_state->src_h != new_other_state->src_h ||
+		    old_other_state->crtc_w != new_other_state->crtc_w ||
+		    old_other_state->crtc_h != new_other_state->crtc_h)
+			return true;
+
+		/* Rotation / mirroring updates. */
+		if (old_other_state->rotation != new_other_state->rotation)
+			return true;
+
+		/* Blending updates. */
+		if (old_other_state->pixel_blend_mode !=
+		    new_other_state->pixel_blend_mode)
+			return true;
+
+		/* Alpha updates. */
+		if (old_other_state->alpha != new_other_state->alpha)
+			return true;
+
+		/* Colorspace changes. */
+		if (old_other_state->color_range != new_other_state->color_range ||
+		    old_other_state->color_encoding != new_other_state->color_encoding)
+			return true;
+
 		/* Framebuffer checks fall at the end. */
 		if (!old_other_state->fb || !new_other_state->fb)
 			continue;
--
2.25.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

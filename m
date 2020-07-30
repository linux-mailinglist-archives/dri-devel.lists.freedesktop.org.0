Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 933622339FE
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jul 2020 22:50:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3306F6E039;
	Thu, 30 Jul 2020 20:50:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2079.outbound.protection.outlook.com [40.107.220.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E63806E039;
 Thu, 30 Jul 2020 20:50:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NvEfVcQ/DolkmQnsrdhIMnN3f1g+n6M8Oysd436rcwjJhY3cip4Ws6kIGPZoNv1FY18+fwr+qGdjwhFqH+yXlMTWBYXPQenEwI1z6FJwcIYLHcWp5hvAx2Gdc7abMlpA/O68xMmlHGyzViS9W+Sxyq7JfmfQOObRnMqQ+Zaf380PZD0mfw5+h9h4TnETyhO722hX5rDNQtZNhYSUhTWwKDV9n5bNXI1NWvZwoP9aljqE7xvHPqN5au6Mt5mG69LsA4GOeORwuvASxlNIuSbT/booNGObMbeKemGbr6cvclK2z1IqUfEv+OB1XtiuvbmG4z+xRZL9odpJRfjJ9hdo2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oPPjoqkOAGpq7eT6KTuu2VkqRMqp3PqyKQ9xBdblMkw=;
 b=OwCESgG0WTD538RiD63XOX1NDdpvfN5TFvMJV5v/Htuw87ZdLSTVU6I6e2C7JPLRxdRsa1lla7ITprFFDzUyeLAZL9SxJvp7SnY01pn7z+YjX3O2Kc06cgRQ+ARLVq0QTnjNGQpNdg81dX3CmSaNJmC1xCTpA2QzNB8q2lCR4WFQjYJP29C0qSVWno9sU31ONRi7FgakwomFfEhcEd+u7B64Um7yKMO4ucsSJSNsmVhoyX5I2SlUvHCQRFDnZCWhtSg35njfLvQJFb1lutpStPqZyabUaoqtKsBLszxr5k0Xek5RKCFoKPcY26orDKd6Eg3n34rBoQWUDSDBgsHeHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oPPjoqkOAGpq7eT6KTuu2VkqRMqp3PqyKQ9xBdblMkw=;
 b=eikl401JcEOq3JQhxPbtUnGd3wCEzWRY1K+jyA6fKmq7xQuN691qmYYb/JGu5fPLpxsAIaHRxB13UcdGpQre8bOOLWIi1gqLZFyCPuIvdmys7qbLcjaSTCttgc54plYAkC92YjxK1wkE6sVB1GpXrynZbMSapNwcAvAMBY20cTY=
Received: from DM6PR12MB4156.namprd12.prod.outlook.com (2603:10b6:5:218::17)
 by DM6PR12MB4515.namprd12.prod.outlook.com (2603:10b6:5:2a1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Thu, 30 Jul
 2020 20:50:43 +0000
Received: from DM6PR12MB4156.namprd12.prod.outlook.com
 ([fe80::7082:21ba:6e45:32ba]) by DM6PR12MB4156.namprd12.prod.outlook.com
 ([fe80::7082:21ba:6e45:32ba%9]) with mapi id 15.20.3239.017; Thu, 30 Jul 2020
 20:50:43 +0000
From: "Wu, Hersen" <hersenxs.wu@amd.com>
To: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 2/7] drm/amd/display: Reset plane when tiling flags change
Thread-Topic: [PATCH 2/7] drm/amd/display: Reset plane when tiling flags change
Thread-Index: AQHWZrFBcK4d+qNZMkyx9SZ0YKAlqqkgmCtw
Date: Thu, 30 Jul 2020 20:50:42 +0000
Message-ID: <DM6PR12MB415666BE4336C66C8A98DCC3FD710@DM6PR12MB4156.namprd12.prod.outlook.com>
References: <20200730203642.17553-1-nicholas.kazlauskas@amd.com>
 <20200730203642.17553-3-nicholas.kazlauskas@amd.com>
In-Reply-To: <20200730203642.17553-3-nicholas.kazlauskas@amd.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=true;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2020-07-30T20:50:37Z; 
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal Use Only -
 Unrestricted;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ActionId=b146b8e5-15f4-4463-b466-00003aa2e1f0;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=1
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_enabled: true
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_setdate: 2020-07-30T20:50:37Z
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_method: Standard
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_name: Internal Use Only -
 Unrestricted
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_actionid: badf3739-a1b4-4e0e-92f8-0000aa8d317f
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_contentbits: 0
msip_justification: I confirm the recipients are approved for sharing this
 content
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [2607:fea8:3c60:9c20:6158:abe:c77:fb4f]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 79d52abe-21f6-4e81-f297-08d834ca39c7
x-ms-traffictypediagnostic: DM6PR12MB4515:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB45155999AB7241185DF23C7CFD710@DM6PR12MB4515.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1t4rbKTBOvm/oEKXEMiLR/jdN1gn7TGSH/ctrwhfsL7UTU5iF+8brmovnhNTnvbI6JCI/Irf1c0Mx0d115Vi71chdzefHEzaB7ilK+dSLb4ov/FD1o7ozCoQEXfrKnbq+rMbwgX/c10VArgFeYbZwSjvaRUATqRXRH7ZE6I9UPvZl0e0YmHlsckAHjJR4edyvENik8sOWXswUpBVK0OgYXJdolUDi1mxk8/+tzWX0PF5cH5pw/7/5V0wlXNlbBuk55DYwmfT0L3u4HF0YBylFWzAG8UiLqzAU9Hs/3g64bIQ3yROjg9n3buS03QfbBw8
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4156.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(39860400002)(136003)(366004)(346002)(396003)(2906002)(8936002)(52536014)(33656002)(186003)(9686003)(55016002)(6506007)(4326008)(53546011)(8676002)(5660300002)(86362001)(83380400001)(7696005)(66946007)(54906003)(110136005)(316002)(478600001)(76116006)(66446008)(66556008)(64756008)(71200400001)(450100002)(66476007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: Um1lfW1B+KVfy4rqikohIIfbANJvzX95Uxbxip9vC46Jhds/mv1kGDLeGC8AFwaTepbJMcloHF/TPxhM3Nc+Sx6cpMpJB8ye7khG+VlPZllWp/QQo1RBolnISskjAr9tGz6wTLNOdDas/9wB2or9v0dbgVv/ckk8ww4vJCJZQoDU0mOQ4Zj7aGuvXUnMW6KU8uG87X+XQBvaMRPXAEVCvD06RFThbyPUw2R02nBnm2gzQKf6YFPrZvWImGH91HMEdSwiG1ghqIK3qpdsBtI0G9RmAeW/Jv/j2g4i+j4EPpTEAPTlpO4ljKC6bcDU1RjVXlYEXBksyvY3AewHsCLVkPqmDZ44ZDCtHkw9fH6OjJReTpe9nsY2Nt5W3FUtQzYiYVH2jsGv2aA74TqcGmA0ssUiEGGRjv0g4gkCn0n8dQ0W3tK7zJ0HUv+ldLhIHkCW9o4PkLfO3TqmomgRv4ZWkxDsx+lK1DHGGFklGBM3MKiy2JiY99mYheQwZSUYa6lfsS3J1FJL1tZ/YhlF+v7YOgWFKY5KzMqv0KMuIZVo/ek=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4156.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79d52abe-21f6-4e81-f297-08d834ca39c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2020 20:50:42.8626 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QjQpi/XC5SyJtOdksRIGBv6WxQOi2w8yPUx+guP6YVG2YF71G80yUx+Hg8oi8ngKcrbFuiM+HKmNuTTn5WT7+Q==
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
Cc: "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>, "Lakha,
 Bhawanpreet" <Bhawanpreet.Lakha@amd.com>, "Kazlauskas,
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
Cc: Kazlauskas, Nicholas <Nicholas.Kazlauskas@amd.com>; Lakha, Bhawanpreet <Bhawanpreet.Lakha@amd.com>; Siqueira, Rodrigo <Rodrigo.Siqueira@amd.com>; Wu, Hersen <hersenxs.wu@amd.com>
Subject: [PATCH 2/7] drm/amd/display: Reset plane when tiling flags change

[Why]
Enabling or disable DCC or switching between tiled and linear formats can require bandwidth updates.

They're currently skipping all DC validation by being treated as purely surface updates.

[How]
Treat tiling_flag changes (which encode DCC state) as a condition for resetting the plane.

Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: Hersen Wu <hersenxs.wu@amd.com>
Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 7cc5ab90ce13..bf1881bd492c 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -8332,6 +8332,8 @@ static bool should_reset_plane(struct drm_atomic_state *state,
 	 * TODO: Come up with a more elegant solution for this.
 	 */
 	for_each_oldnew_plane_in_state(state, other, old_other_state, new_other_state, i) {
+		struct dm_plane_state *old_dm_plane_state, *new_dm_plane_state;
+
 		if (other->type == DRM_PLANE_TYPE_CURSOR)
 			continue;
 
@@ -8342,9 +8344,20 @@ static bool should_reset_plane(struct drm_atomic_state *state,
 		if (old_other_state->crtc != new_other_state->crtc)
 			return true;
 
-		/* TODO: Remove this once we can handle fast format changes. */
-		if (old_other_state->fb && new_other_state->fb &&
-		    old_other_state->fb->format != new_other_state->fb->format)
+		/* Framebuffer checks fall at the end. */
+		if (!old_other_state->fb || !new_other_state->fb)
+			continue;
+
+		/* Pixel format changes can require bandwidth updates. */
+		if (old_other_state->fb->format != new_other_state->fb->format)
+			return true;
+
+		old_dm_plane_state = to_dm_plane_state(old_other_state);
+		new_dm_plane_state = to_dm_plane_state(new_other_state);
+
+		/* Tiling and DCC changes also require bandwidth updates. */
+		if (old_dm_plane_state->tiling_flags !=
+		    new_dm_plane_state->tiling_flags)
 			return true;
 	}
 
--
2.25.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

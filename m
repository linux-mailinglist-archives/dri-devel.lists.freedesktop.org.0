Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D690342AF76
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 00:02:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28F8D89CF6;
	Tue, 12 Oct 2021 22:02:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2063.outbound.protection.outlook.com [40.107.93.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30F4589CF6
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Oct 2021 22:02:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c0Py7kcS0I/uG0i8bEFf8AZMosWHEGoBkSwZPfF8ZLx6jOxzeVG5i7c4l7R8FkmSwvUioGif6plcS2tud+VaQlwD0cvPNquw8K7BuPZw9CQdeiREHndLw0KN/IBmLvyrzQ6v57EWZFdQdQ45r0fYsNLtdSnRZyru/pfjkjP9LcTq/OmJ9QT3lPqjcmwcux7rfpmtjA2a8JWc+f0+9dBkLs7/rg9We4Zoonq3l7UYJc1nHrPU/wxUl1T+q/ZpnePnI7HnahswSwP+bRW0WohiAvxbemTccC6yQxx72rEev0CzkVVN8lzMKgjA1sFhygdO2p3pxnNQDbWFW4HJl6/ZMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ojQEo6fq/vASNEObALFmtI81C2pUFELNlOWI/zYwg+g=;
 b=nLgBM/ehPtszQfEbkFoobmJmmh86tROGoJLSPkSAyXJzsxtQs6CcJ0IXHpLB0CN5g8DYKo1CAIgNAE+aOO52LILPXdrE6gdjOf78DofjjHa4sz1UJYZxVhFTixKhthM9fH2OKOqPwp8eDqhZxpokkXIAbmJTsp4LClMldioa0XwMxPIm/SjnJbyPGknjfiVZKC+QVqOOainGpAY0sAuK3TP5b0QBb/r/mmTRzmcMIE+63/L3hIc2+58gMA6Aocssah2R904AURaF28PiYT0jVQX8uVTDP8sff0BlmiA06uVFBHAyEjuPS7x5Uwes6LNli08ARJNZju+eTrGlkDE5FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ojQEo6fq/vASNEObALFmtI81C2pUFELNlOWI/zYwg+g=;
 b=tRKPfbeZ+GOdGQV3OGHxNtolVnc5FEJW0CRfbxQt2+MMnCrl581gGI9lMvV7mRAMIkKJ7smGNkgdCEaNBudFbZRyeIaIxuoSojYRG8x1q5HUTMik9QYotMhhAP7HnNipU+6EDAP2YHGzNLhTZxmX9VPCyCPQETXt0yyYs7Mv24U=
Received: from MW3PR12MB4554.namprd12.prod.outlook.com (2603:10b6:303:55::21)
 by MWHPR12MB1358.namprd12.prod.outlook.com (2603:10b6:300:d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.22; Tue, 12 Oct
 2021 22:02:41 +0000
Received: from MW3PR12MB4554.namprd12.prod.outlook.com
 ([fe80::700d:46f0:61ab:9c1c]) by MW3PR12MB4554.namprd12.prod.outlook.com
 ([fe80::700d:46f0:61ab:9c1c%9]) with mapi id 15.20.4587.026; Tue, 12 Oct 2021
 22:02:41 +0000
From: "Lakha, Bhawanpreet" <Bhawanpreet.Lakha@amd.com>
To: "Zuo, Jerry" <Jerry.Zuo@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "lyude@redhat.com" <lyude@redhat.com>
CC: "Wentland, Harry" <Harry.Wentland@amd.com>, "Lin, Wayne"
 <Wayne.Lin@amd.com>, "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
Subject: Re: [PATCH] drm: Update MST First Link Slot Information Based on
 Encoding Format
Thread-Topic: [PATCH] drm: Update MST First Link Slot Information Based on
 Encoding Format
Thread-Index: AQHXv7Rbz2eW8ZZRyEeiv2tSwmLIGqvP6W0k
Date: Tue, 12 Oct 2021 22:02:41 +0000
Message-ID: <MW3PR12MB4554BC7B5C42768A7036454DF9B69@MW3PR12MB4554.namprd12.prod.outlook.com>
References: <5e463fbc3d633eea1078e838ba5be0065ffbeb1e.camel@redhat.com>
 <20211012215848.1507023-1-Bhawanpreet.Lakha@amd.com>
In-Reply-To: <20211012215848.1507023-1-Bhawanpreet.Lakha@amd.com>
Accept-Language: en-CA, en-US
Content-Language: en-CA
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=True;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-10-12T22:02:40.718Z;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD
 Official Use
 Only; MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard; 
suggested_attachment_session_id: 22993d95-af35-48ba-28ac-8a9a2f0c6071
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1d0c7bdb-e77a-4a0b-1c7e-08d98dcc032f
x-ms-traffictypediagnostic: MWHPR12MB1358:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR12MB135887298B075C2C7389D860F9B69@MWHPR12MB1358.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tuFJogpPEgLmWZE7pOUlsefcnxhWaxI8DvpFmTqwWm644UG56RFOl3V+v8yUH7IF5o58oiPjQjjrcutFdt5QGkClFQSaDSBHmzYM5wLaOd+OHmTgIsK5bd1UJlUYDs0GmY4+NOPgOaNiBULd8ZCyXYFT4GF5m0VYdLPWj8y75AbkJTtgzqTpnfvQNybvnfapBbTWGODQQMYUrMce7qWqiyLvxJB/kkMMb5AXpd6bx9xQnXcTVHO1KYq3Y1ioZZVel/wBIUFLnIoC2ULBiydgXY5SebLvnUIW+dHw1FH2sIb4PPMA6ggvhLxpyjxQoSuXrepWd/P7GotUiImdMHDLdj6KGK24UG8oh7WISpbhmr1pSfgUMapaXwWhIgxvI4VOZJHWMMqkJ/CjuAr3fekaR/r32cBsdhfcZyOkyhooyK3ZBV/JB6ozOCgOorJFPXER41CzWjWrpLLGu7jrkxLYNoe10yOUJu5dqN793n+VDm3KPLVVGzKrTCPJAkflMjFYJ8P5QNIrP/cA0fOY8PXfd5O/MFu5RwdPWrPKPdggJuMvz8Uyighb/CjF8SXanb5IP6dSH6p2iIbvMi32mzaaRikQv1ZgWsla1XRfc0VDl4x5ZsNwybY9/PslC+YHG3FHdB7VdW7qRocYGDuofqRZAhOLnhIi6qkos4iVL1pwzCO/wrvF2cjz0BfigQL2a6XAj353z9s4LeqAgpyJqqQb4w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR12MB4554.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66476007)(186003)(110136005)(8936002)(316002)(66946007)(9686003)(8676002)(53546011)(55016002)(15650500001)(66556008)(64756008)(6506007)(54906003)(5660300002)(76116006)(2906002)(86362001)(38100700002)(83380400001)(66446008)(7696005)(52536014)(122000001)(71200400001)(91956017)(19627405001)(4326008)(508600001)(38070700005)(33656002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?TbliJ6Ltr8eBIth9RKmtMH9cqqaUwAkrqV2sHUa80RPfyjXp88EB5n7mjkR+?=
 =?us-ascii?Q?fbb1bJibLrkJBa6Lx8ZNE8O+Z+Fw1dRMqVAfhvqh6grtiAT8F871SpylLNY2?=
 =?us-ascii?Q?j1nkYItbmbATwOi0BdlSd0iAqGQ3bzzBvzVVnpdi2IO/bHqqi36tDIcN/AN7?=
 =?us-ascii?Q?EaxmjCd6Hqte+9RpVZSmOb52wC+CK1qia+YjvO5qrV7w8Fgp66H4aGQlisA6?=
 =?us-ascii?Q?lXjwQ+H5wJX/1OAwEet4CRdsYliUEsIFmMT4Zf5sEL8XQHtzxDBHh3wKuKQx?=
 =?us-ascii?Q?R8n1iRpkOndtenGP/mMrPXbpeDzNaNs1O7cvQW7UsO0FXiMgiIMkMfFthDdl?=
 =?us-ascii?Q?S9C1AC+D7dUVDdKpAhl3m5u1pwsmBPI0A/n7SW92DondOTP0VVIvIwOl6nOl?=
 =?us-ascii?Q?XchjfRqaqKDjtqx/uAEphQPvFhcXTfhxpMeZ0ui/xD373BxlOSP1bafsAza3?=
 =?us-ascii?Q?jm2hIsErqHTdBdsndRkXey/rLWTPicut0boneYzleRnizcvw7WFV7bZGeGez?=
 =?us-ascii?Q?B6PHeVhcExVTR0cHtlSR/hlAizfYGlte8SeJZ00G9cU47fclEB6wnhq7AQyO?=
 =?us-ascii?Q?HCg5nxh4uNX/86pxEDG6GV/AZevNZLRrDwKmNwBGQtFOrAWG6dC/sLC82/32?=
 =?us-ascii?Q?dCa7wGhAQ7rEbvKuOnd/FcAMKlgWPio8h698LbbLB0WZoO45v7wC3lgGz+dt?=
 =?us-ascii?Q?rDMMgQJmKqcref9ZihRJ4pyPr+sZAH+u4DcNqnCeVrRMc/C1tSZph+Mqvj8w?=
 =?us-ascii?Q?QM2N9dO1Tken+MoE+5mcdXJIXT3oUE0w4dP+/FkUXRTlkiLd3YpSWEycH/id?=
 =?us-ascii?Q?xffyKJFGcHsZhNWu68wXUqjBiT9RQj7ZLJE04urLP/EIj64zlwvRowxI0TsK?=
 =?us-ascii?Q?Qk5XnryYT0y11gCHmPn9irx7ux3323T0pqMV1AYYG6TM0HsTF5Pra5utgOdi?=
 =?us-ascii?Q?knN4JcmzEzdRlgnJdk/i6Pm9Nx8be+Jwsmeua3vmzHSqZOY7ga+DnlkPrbOj?=
 =?us-ascii?Q?5/1w2PnNP+iRT1GrGTafbXarkbX27nMCknEUEl+UP9Ww0I6jKdiS4iBm4p1A?=
 =?us-ascii?Q?TphFwhtrT1TpnvfA6Y5oqQFDKSBq2GwrqJEqQ0i7ChHm5FSBgy9Cn9DzygHj?=
 =?us-ascii?Q?CfmRsE0Y2AR2I3AMnqBFRlTKItef+UU7HcOJipBMsnU8OSzRxbZiU3EF9KdJ?=
 =?us-ascii?Q?x15v+GJ+LIt5QfsJ4dqctVtPHzdSahqbbGv6xmcpVurW5Jhs9ldl2JxtKtT1?=
 =?us-ascii?Q?xuApEjtWjs/kaKe6HaEZX+OmBGf/4LtTCjFI4QeB89Lh7iUY3OpU25IYlB9y?=
 =?us-ascii?Q?xrSyIN4XBqet3pG9DVOjbNLQszD6UQxl/h1frT0yv3gCEw=3D=3D?=
Content-Type: multipart/alternative;
 boundary="_000_MW3PR12MB4554BC7B5C42768A7036454DF9B69MW3PR12MB4554namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4554.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d0c7bdb-e77a-4a0b-1c7e-08d98dcc032f
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2021 22:02:41.3341 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Knpqttq49E34HiEp+Z2YGu5OstR5eusLDxHBNYP9C5vjyxj+4EqJ7VdwMOUvt0YE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1358
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

--_000_MW3PR12MB4554BC7B5C42768A7036454DF9B69MW3PR12MB4554namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only]


Hi Lyude,

Jerry is busy these few weeks so I will be taking a look at this. I added t=
he start/total slots to the mst_state and am updating them in atomic_check.

Also ignore the V2 "* Remove get_mst_link_encoding_cap" I got a bit lost in=
 trying to figure out the patch layout that was sent before.


Thanks,
Bhawan

________________________________
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Sent: October 12, 2021 5:58 PM
To: Zuo, Jerry <Jerry.Zuo@amd.com>; dri-devel@lists.freedesktop.org <dri-de=
vel@lists.freedesktop.org>; lyude@redhat.com <lyude@redhat.com>
Cc: Wentland, Harry <Harry.Wentland@amd.com>; Lin, Wayne <Wayne.Lin@amd.com=
>; Kazlauskas, Nicholas <Nicholas.Kazlauskas@amd.com>; Lakha, Bhawanpreet <=
Bhawanpreet.Lakha@amd.com>
Subject: [PATCH] drm: Update MST First Link Slot Information Based on Encod=
ing Format

8b/10b encoding format requires to reserve the first slot for
recording metadata. Real data transmission starts from the second slot,
with a total of available 63 slots available.

In 128b/132b encoding format, metadata is transmitted separately
in LLCP packet before MTP. Real data transmission starts from
the first slot, with a total of 64 slots available.

v2:
* Remove get_mst_link_encoding_cap
* Move total/start slots to mst_state, and copy it to mst_mgr in
atomic_check

Signed-off-by: Fangzhi Zuo <Jerry.Zuo@amd.com>
Signed-off-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 28 +++++++++++++++
 drivers/gpu/drm/drm_dp_mst_topology.c         | 35 +++++++++++++++----
 include/drm/drm_dp_mst_helper.h               | 13 +++++++
 3 files changed, 69 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gp=
u/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 5020f2d36fe1..4ad50eb0091a 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -10612,6 +10612,8 @@ static int amdgpu_dm_atomic_check(struct drm_device=
 *dev,
 #if defined(CONFIG_DRM_AMD_DC_DCN)
         struct dsc_mst_fairness_vars vars[MAX_PIPES];
 #endif
+       struct drm_dp_mst_topology_state *mst_state;
+       struct drm_dp_mst_topology_mgr *mgr;

         trace_amdgpu_dm_atomic_check_begin(state);

@@ -10819,6 +10821,32 @@ static int amdgpu_dm_atomic_check(struct drm_devic=
e *dev,
                 lock_and_validation_needed =3D true;
         }

+#if defined(CONFIG_DRM_AMD_DC_DCN)
+       for_each_new_mst_mgr_in_state(state, mgr, mst_state, i) {
+               struct amdgpu_dm_connector *aconnector;
+               struct drm_connector *connector;
+               struct drm_connector_list_iter iter;
+               u8 link_coding_cap;
+
+               if (!mgr->mst_state )
+                       continue;
+
+               drm_connector_list_iter_begin(dev, &iter);
+               drm_for_each_connector_iter(connector, &iter) {
+                       int id =3D connector->index;
+
+                       if (id =3D=3D mst_state->mgr->conn_base_id) {
+                               aconnector =3D to_amdgpu_dm_connector(conne=
ctor);
+                               link_coding_cap =3D dc_link_dp_mst_decide_l=
ink_encoding_format(aconnector->dc_link);
+                               drm_dp_mst_update_coding_cap(mst_state, lin=
k_coding_cap);
+
+                               break;
+                       }
+               }
+               drm_connector_list_iter_end(&iter);
+
+       }
+#endif
         /**
          * Streams and planes are reset when there are changes that affect
          * bandwidth. Anything that affects bandwidth needs to go through
diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp=
_mst_topology.c
index ad0795afc21c..fb5c47c4cb2e 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -3368,7 +3368,7 @@ int drm_dp_update_payload_part1(struct drm_dp_mst_top=
ology_mgr *mgr)
         struct drm_dp_payload req_payload;
         struct drm_dp_mst_port *port;
         int i, j;
-       int cur_slots =3D 1;
+       int cur_slots =3D mgr->start_slot;
         bool skip;

         mutex_lock(&mgr->payload_lock);
@@ -4321,7 +4321,7 @@ int drm_dp_find_vcpi_slots(struct drm_dp_mst_topology=
_mgr *mgr,
         num_slots =3D DIV_ROUND_UP(pbn, mgr->pbn_div);

         /* max. time slots - one slot for MTP header */
-       if (num_slots > 63)
+       if (num_slots > mgr->total_avail_slots)
                 return -ENOSPC;
         return num_slots;
 }
@@ -4333,7 +4333,7 @@ static int drm_dp_init_vcpi(struct drm_dp_mst_topolog=
y_mgr *mgr,
         int ret;

         /* max. time slots - one slot for MTP header */
-       if (slots > 63)
+       if (slots > mgr->total_avail_slots)
                 return -ENOSPC;

         vcpi->pbn =3D pbn;
@@ -4507,6 +4507,18 @@ int drm_dp_atomic_release_vcpi_slots(struct drm_atom=
ic_state *state,
 }
 EXPORT_SYMBOL(drm_dp_atomic_release_vcpi_slots);

+void drm_dp_mst_update_coding_cap(struct drm_dp_mst_topology_state *mst_st=
ate, uint8_t link_coding_cap)
+{
+       if (link_coding_cap =3D=3D DP_CAP_ANSI_128B132B) {
+               mst_state->total_avail_slots =3D 64;
+               mst_state->start_slot =3D 0;
+       }
+
+       DRM_DEBUG_KMS("%s coding format on mgr 0x%p\n",
+                       (link_coding_cap =3D=3D DP_CAP_ANSI_128B132B) ? "12=
8b/132b":"8b/10b", mst_state->mgr);
+}
+EXPORT_SYMBOL(drm_dp_mst_update_coding_cap);
+
 /**
  * drm_dp_mst_allocate_vcpi() - Allocate a virtual channel
  * @mgr: manager for this port
@@ -4538,8 +4550,8 @@ bool drm_dp_mst_allocate_vcpi(struct drm_dp_mst_topol=
ogy_mgr *mgr,

         ret =3D drm_dp_init_vcpi(mgr, &port->vcpi, pbn, slots);
         if (ret) {
-               drm_dbg_kms(mgr->dev, "failed to init vcpi slots=3D%d max=
=3D63 ret=3D%d\n",
-                           DIV_ROUND_UP(pbn, mgr->pbn_div), ret);
+               drm_dbg_kms(mgr->dev, "failed to init vcpi slots=3D%d max=
=3D%d ret=3D%d\n",
+                           DIV_ROUND_UP(pbn, mgr->pbn_div), mgr->total_ava=
il_slots, ret);
                 drm_dp_mst_topology_put_port(port);
                 goto out;
         }
@@ -5226,7 +5238,7 @@ drm_dp_mst_atomic_check_vcpi_alloc_limit(struct drm_d=
p_mst_topology_mgr *mgr,
                                          struct drm_dp_mst_topology_state =
*mst_state)
 {
         struct drm_dp_vcpi_allocation *vcpi;
-       int avail_slots =3D 63, payload_count =3D 0;
+       int avail_slots =3D mgr->total_avail_slots, payload_count =3D 0;

         list_for_each_entry(vcpi, &mst_state->vcpis, next) {
                 /* Releasing VCPI is always OK-even if the port is gone */
@@ -5255,7 +5267,7 @@ drm_dp_mst_atomic_check_vcpi_alloc_limit(struct drm_d=
p_mst_topology_mgr *mgr,
                 }
         }
         drm_dbg_atomic(mgr->dev, "[MST MGR:%p] mst state %p VCPI avail=3D%=
d used=3D%d\n",
-                      mgr, mst_state, avail_slots, 63 - avail_slots);
+                      mgr, mst_state, avail_slots, mgr->total_avail_slots =
- avail_slots);

         return 0;
 }
@@ -5421,6 +5433,10 @@ int drm_dp_mst_atomic_check(struct drm_atomic_state =
*state)
                         break;

                 mutex_lock(&mgr->lock);
+
+               mgr->start_slot =3D mst_state->start_slot;
+               mgr->total_avail_slots =3D mst_state->total_avail_slots;
+
                 ret =3D drm_dp_mst_atomic_check_mstb_bw_limit(mgr->mst_pri=
mary,
                                                             mst_state);
                 mutex_unlock(&mgr->lock);
@@ -5527,11 +5543,16 @@ int drm_dp_mst_topology_mgr_init(struct drm_dp_mst_=
topology_mgr *mgr,
         if (!mgr->proposed_vcpis)
                 return -ENOMEM;
         set_bit(0, &mgr->payload_mask);
+       mgr->total_avail_slots =3D 63;
+       mgr->start_slot =3D 1;

         mst_state =3D kzalloc(sizeof(*mst_state), GFP_KERNEL);
         if (mst_state =3D=3D NULL)
                 return -ENOMEM;

+       mst_state->total_avail_slots =3D 63;
+       mst_state->start_slot =3D 1;
+
         mst_state->mgr =3D mgr;
         INIT_LIST_HEAD(&mst_state->vcpis);

diff --git a/include/drm/drm_dp_mst_helper.h b/include/drm/drm_dp_mst_helpe=
r.h
index ddb9231d0309..f8152dfb34ed 100644
--- a/include/drm/drm_dp_mst_helper.h
+++ b/include/drm/drm_dp_mst_helper.h
@@ -554,6 +554,8 @@ struct drm_dp_mst_topology_state {
         struct drm_private_state base;
         struct list_head vcpis;
         struct drm_dp_mst_topology_mgr *mgr;
+       u8 total_avail_slots;
+       u8 start_slot;
 };

 #define to_dp_mst_topology_mgr(x) container_of(x, struct drm_dp_mst_topolo=
gy_mgr, base)
@@ -661,6 +663,16 @@ struct drm_dp_mst_topology_mgr {
          */
         int pbn_div;

+       /**
+        * @total_avail_slots: 63 for 8b/10b, 64 for 128/132b
+        */
+       u8 total_avail_slots;
+
+       /**
+        * @start_slot: 1 for 8b/10b, 0 for 128/132b
+        */
+       u8 start_slot;
+
         /**
          * @funcs: Atomic helper callbacks
          */
@@ -806,6 +818,7 @@ int drm_dp_mst_get_vcpi_slots(struct drm_dp_mst_topolog=
y_mgr *mgr, struct drm_dp

 void drm_dp_mst_reset_vcpi_slots(struct drm_dp_mst_topology_mgr *mgr, stru=
ct drm_dp_mst_port *port);

+void drm_dp_mst_update_coding_cap(struct drm_dp_mst_topology_state *mst_st=
ate, uint8_t link_coding_cap);

 void drm_dp_mst_deallocate_vcpi(struct drm_dp_mst_topology_mgr *mgr,
                                 struct drm_dp_mst_port *port);
--
2.25.1


--_000_MW3PR12MB4554BC7B5C42768A7036454DF9B69MW3PR12MB4554namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
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
<pre>Hi Lyude,<br><br>Jerry is busy these few weeks so I will be taking a l=
ook at this. I added the start/total slots to the mst_state and am updating=
 them in atomic_check.<br><br>Also ignore the V2 &quot;<font size=3D"2"><sp=
an style=3D"font-size:11pt">* Remove get_mst_link_encoding_cap</span></font=
>&quot; I got a bit lost in trying to figure out the patch layout that was =
sent before.<br><br><br>Thanks,<br>Bhawan<br></pre>
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Bhawanpreet Lakha &lt=
;Bhawanpreet.Lakha@amd.com&gt;<br>
<b>Sent:</b> October 12, 2021 5:58 PM<br>
<b>To:</b> Zuo, Jerry &lt;Jerry.Zuo@amd.com&gt;; dri-devel@lists.freedeskto=
p.org &lt;dri-devel@lists.freedesktop.org&gt;; lyude@redhat.com &lt;lyude@r=
edhat.com&gt;<br>
<b>Cc:</b> Wentland, Harry &lt;Harry.Wentland@amd.com&gt;; Lin, Wayne &lt;W=
ayne.Lin@amd.com&gt;; Kazlauskas, Nicholas &lt;Nicholas.Kazlauskas@amd.com&=
gt;; Lakha, Bhawanpreet &lt;Bhawanpreet.Lakha@amd.com&gt;<br>
<b>Subject:</b> [PATCH] drm: Update MST First Link Slot Information Based o=
n Encoding Format</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">8b/10b encoding format requires to reserve the fir=
st slot for<br>
recording metadata. Real data transmission starts from the second slot,<br>
with a total of available 63 slots available.<br>
<br>
In 128b/132b encoding format, metadata is transmitted separately<br>
in LLCP packet before MTP. Real data transmission starts from<br>
the first slot, with a total of 64 slots available.<br>
<br>
v2:<br>
* Remove get_mst_link_encoding_cap<br>
* Move total/start slots to mst_state, and copy it to mst_mgr in<br>
atomic_check<br>
<br>
Signed-off-by: Fangzhi Zuo &lt;Jerry.Zuo@amd.com&gt;<br>
Signed-off-by: Bhawanpreet Lakha &lt;Bhawanpreet.Lakha@amd.com&gt;<br>
---<br>
&nbsp;.../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 28 +++++++++++++++<br=
>
&nbsp;drivers/gpu/drm/drm_dp_mst_topology.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; | 35 +++++++++++++++----<br>
&nbsp;include/drm/drm_dp_mst_helper.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 13 +++++++<br>
&nbsp;3 files changed, 69 insertions(+), 7 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gp=
u/drm/amd/display/amdgpu_dm/amdgpu_dm.c<br>
index 5020f2d36fe1..4ad50eb0091a 100644<br>
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c<br>
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c<br>
@@ -10612,6 +10612,8 @@ static int amdgpu_dm_atomic_check(struct drm_device=
 *dev,<br>
&nbsp;#if defined(CONFIG_DRM_AMD_DC_DCN)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct dsc_mst_fairness_va=
rs vars[MAX_PIPES];<br>
&nbsp;#endif<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_dp_mst_topology_state *mst=
_state;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_dp_mst_topology_mgr *mgr;<=
br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; trace_amdgpu_dm_atomic_che=
ck_begin(state);<br>
&nbsp;<br>
@@ -10819,6 +10821,32 @@ static int amdgpu_dm_atomic_check(struct drm_devic=
e *dev,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; lock_and_validation_needed =3D true;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
+#if defined(CONFIG_DRM_AMD_DC_DCN)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for_each_new_mst_mgr_in_state(state, =
mgr, mst_state, i) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; struct amdgpu_dm_connector *aconnector;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; struct drm_connector *connector;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; struct drm_connector_list_iter iter;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; u8 link_coding_cap;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (!mgr-&gt;mst_state )<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; drm_connector_list_iter_begin(dev, &amp;iter);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; drm_for_each_connector_iter(connector, &amp;iter) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int id =3D conne=
ctor-&gt;index;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (id =3D=3D ms=
t_state-&gt;mgr-&gt;conn_base_id) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; aconnector =3D to_amdgpu_dm_connector(conne=
ctor);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; link_coding_cap =3D dc_link_dp_mst_decide_l=
ink_encoding_format(aconnector-&gt;dc_link);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_dp_mst_update_coding_cap(mst_state, lin=
k_coding_cap);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; drm_connector_list_iter_end(&amp;iter);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+#endif<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /**<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Streams and planes=
 are reset when there are changes that affect<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * bandwidth. Anythin=
g that affects bandwidth needs to go through<br>
diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp=
_mst_topology.c<br>
index ad0795afc21c..fb5c47c4cb2e 100644<br>
--- a/drivers/gpu/drm/drm_dp_mst_topology.c<br>
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c<br>
@@ -3368,7 +3368,7 @@ int drm_dp_update_payload_part1(struct drm_dp_mst_top=
ology_mgr *mgr)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_dp_payload req_=
payload;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_dp_mst_port *po=
rt;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int i, j;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int cur_slots =3D 1;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int cur_slots =3D mgr-&gt;start_slot;=
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool skip;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mutex_lock(&amp;mgr-&gt;pa=
yload_lock);<br>
@@ -4321,7 +4321,7 @@ int drm_dp_find_vcpi_slots(struct drm_dp_mst_topology=
_mgr *mgr,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; num_slots =3D DIV_ROUND_UP=
(pbn, mgr-&gt;pbn_div);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* max. time slots - one s=
lot for MTP header */<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (num_slots &gt; 63)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (num_slots &gt; mgr-&gt;total_avai=
l_slots)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return -ENOSPC;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return num_slots;<br>
&nbsp;}<br>
@@ -4333,7 +4333,7 @@ static int drm_dp_init_vcpi(struct drm_dp_mst_topolog=
y_mgr *mgr,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* max. time slots - one s=
lot for MTP header */<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (slots &gt; 63)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (slots &gt; mgr-&gt;total_avail_sl=
ots)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return -ENOSPC;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vcpi-&gt;pbn =3D pbn;<br>
@@ -4507,6 +4507,18 @@ int drm_dp_atomic_release_vcpi_slots(struct drm_atom=
ic_state *state,<br>
&nbsp;}<br>
&nbsp;EXPORT_SYMBOL(drm_dp_atomic_release_vcpi_slots);<br>
&nbsp;<br>
+void drm_dp_mst_update_coding_cap(struct drm_dp_mst_topology_state *mst_st=
ate, uint8_t link_coding_cap)<br>
+{<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (link_coding_cap =3D=3D DP_CAP_ANS=
I_128B132B) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; mst_state-&gt;total_avail_slots =3D 64;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; mst_state-&gt;start_slot =3D 0;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_DEBUG_KMS(&quot;%s coding format =
on mgr 0x%p\n&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (link_coding_cap=
 =3D=3D DP_CAP_ANSI_128B132B) ? &quot;128b/132b&quot;:&quot;8b/10b&quot;, m=
st_state-&gt;mgr);<br>
+}<br>
+EXPORT_SYMBOL(drm_dp_mst_update_coding_cap);<br>
+<br>
&nbsp;/**<br>
&nbsp; * drm_dp_mst_allocate_vcpi() - Allocate a virtual channel<br>
&nbsp; * @mgr: manager for this port<br>
@@ -4538,8 +4550,8 @@ bool drm_dp_mst_allocate_vcpi(struct drm_dp_mst_topol=
ogy_mgr *mgr,<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D drm_dp_init_vcpi(m=
gr, &amp;port-&gt;vcpi, pbn, slots);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; drm_dbg_kms(mgr-&gt;dev, &quot;failed to init vcpi slots=3D%d ma=
x=3D63 ret=3D%d\n&quot;,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; DIV_ROUND_UP(pbn, mgr-&gt;pbn_div), ret);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; drm_dbg_kms(mgr-&gt;dev, &quot;failed to init vcpi slots=3D%d ma=
x=3D%d ret=3D%d\n&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; DIV_ROUND_UP(pbn, mgr-&gt;pbn_div), mgr-&gt;total_avail_slots, ret)=
;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; drm_dp_mst_topology_put_port(port);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; goto out;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
@@ -5226,7 +5238,7 @@ drm_dp_mst_atomic_check_vcpi_alloc_limit(struct drm_d=
p_mst_topology_mgr *mgr,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; struct drm_dp_mst_topology_state *mst_state)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_dp_vcpi_allocat=
ion *vcpi;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int avail_slots =3D 63, payload_count=
 =3D 0;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int avail_slots =3D mgr-&gt;total_ava=
il_slots, payload_count =3D 0;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; list_for_each_entry(vcpi, =
&amp;mst_state-&gt;vcpis, next) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; /* Releasing VCPI is always OK-even if the port is go=
ne */<br>
@@ -5255,7 +5267,7 @@ drm_dp_mst_atomic_check_vcpi_alloc_limit(struct drm_d=
p_mst_topology_mgr *mgr,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_dbg_atomic(mgr-&gt;dev=
, &quot;[MST MGR:%p] mst state %p VCPI avail=3D%d used=3D%d\n&quot;,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mgr, mst_state, avail_=
slots, 63 - avail_slots);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mgr, mst_state, avail_=
slots, mgr-&gt;total_avail_slots - avail_slots);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&nbsp;}<br>
@@ -5421,6 +5433,10 @@ int drm_dp_mst_atomic_check(struct drm_atomic_state =
*state)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break=
;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; mutex_lock(&amp;mgr-&gt;lock);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; mgr-&gt;start_slot =3D mst_state-&gt;start_slot;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; mgr-&gt;total_avail_slots =3D mst_state-&gt;total_avail_slots;<b=
r>
+<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; ret =3D drm_dp_mst_atomic_check_mstb_bw_limit(mgr-&gt=
;mst_primary,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mst_state);<br=
>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; mutex_unlock(&amp;mgr-&gt;lock);<br>
@@ -5527,11 +5543,16 @@ int drm_dp_mst_topology_mgr_init(struct drm_dp_mst_=
topology_mgr *mgr,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!mgr-&gt;proposed_vcpi=
s)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return -ENOMEM;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set_bit(0, &amp;mgr-&gt;pa=
yload_mask);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mgr-&gt;total_avail_slots =3D 63;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mgr-&gt;start_slot =3D 1;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mst_state =3D kzalloc(size=
of(*mst_state), GFP_KERNEL);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (mst_state =3D=3D NULL)=
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return -ENOMEM;<br>
&nbsp;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mst_state-&gt;total_avail_slots =3D 6=
3;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mst_state-&gt;start_slot =3D 1;<br>
+<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mst_state-&gt;mgr =3D mgr;=
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; INIT_LIST_HEAD(&amp;mst_st=
ate-&gt;vcpis);<br>
&nbsp;<br>
diff --git a/include/drm/drm_dp_mst_helper.h b/include/drm/drm_dp_mst_helpe=
r.h<br>
index ddb9231d0309..f8152dfb34ed 100644<br>
--- a/include/drm/drm_dp_mst_helper.h<br>
+++ b/include/drm/drm_dp_mst_helper.h<br>
@@ -554,6 +554,8 @@ struct drm_dp_mst_topology_state {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_private_state b=
ase;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct list_head vcpis;<br=
>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_dp_mst_topology=
_mgr *mgr;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u8 total_avail_slots;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u8 start_slot;<br>
&nbsp;};<br>
&nbsp;<br>
&nbsp;#define to_dp_mst_topology_mgr(x) container_of(x, struct drm_dp_mst_t=
opology_mgr, base)<br>
@@ -661,6 +663,16 @@ struct drm_dp_mst_topology_mgr {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int pbn_div;<br>
&nbsp;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /**<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * @total_avail_slots: 63 for 8b=
/10b, 64 for 128/132b<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u8 total_avail_slots;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /**<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * @start_slot: 1 for 8b/10b, 0 =
for 128/132b<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u8 start_slot;<br>
+<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /**<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * @funcs: Atomic hel=
per callbacks<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
@@ -806,6 +818,7 @@ int drm_dp_mst_get_vcpi_slots(struct drm_dp_mst_topolog=
y_mgr *mgr, struct drm_dp<br>
&nbsp;<br>
&nbsp;void drm_dp_mst_reset_vcpi_slots(struct drm_dp_mst_topology_mgr *mgr,=
 struct drm_dp_mst_port *port);<br>
&nbsp;<br>
+void drm_dp_mst_update_coding_cap(struct drm_dp_mst_topology_state *mst_st=
ate, uint8_t link_coding_cap);<br>
&nbsp;<br>
&nbsp;void drm_dp_mst_deallocate_vcpi(struct drm_dp_mst_topology_mgr *mgr,<=
br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_dp_mst_port *port);<b=
r>
-- <br>
2.25.1<br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_MW3PR12MB4554BC7B5C42768A7036454DF9B69MW3PR12MB4554namp_--

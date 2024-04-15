Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D70848A4723
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 04:55:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3024010F97B;
	Mon, 15 Apr 2024 02:55:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZlyF/6qM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2063.outbound.protection.outlook.com [40.107.94.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4638610F97B;
 Mon, 15 Apr 2024 02:55:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Du2QOoM7ZupXW46t6dlIdTI8lTH3IZl9PQjuShfekOS53+FBc0dFg+mn/egpHHzwhtopyPCdNTs+ByYMj/KBsyb4ZZUs+0pgG8dFSEZKbFgv3s9LFqC5zFH5ATmsZ3Ihqnw0W6Co+1tXAHiFyc57KcNqDuUcDbPNVEsXT1z0miV2fb6Sqrk+R3okYp2tYNuIX2LIB9JKbDtMa1c2AYcpd3t0Iui6FDWVx6t2NPYSm+cMOAtcEzfsnt7F7bAYvgZjpArDA2hQBWOhaf25HDoKFThsi7qjBWg5X7UGZAo0IVcQz6v4h86wqapYtiyi7EO9+3JYhqNCH25iLtlq8rYTlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7s/HltqpHS/Qkje3eHew2tML4hxTS8b72M4Y8XswspY=;
 b=nY4PpfsmGvCSh3ijkxdGZRUcjBO/OSGwU5S/8sOO5VlFaiCObps6L3cPcU8IDhtiVIMUunC+gPRyLZ27l6abnGpH3v5N48Yu38Qos60FF3meZuYF3KhwkX4MvMZMBGsYffF04ziLKvILymExSTFIE0YxL6CuYlFVxg32k97tCDxg73uKGORw9j6ecEQRkI2VYe9QWDOMCdK5kzkWgx/P3mnryOsbWLWUIhzGl2odnNi35zCVtfgl0Qm/z5lP5I/oVH1Y5gCCxmhs2M8G+9hU8aYv3v7cTgeeuh+JdNrJ6tuLyqWB9HxCiog1g0f/qhNYsZyW+c8ME9m8dFtpQPVBCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7s/HltqpHS/Qkje3eHew2tML4hxTS8b72M4Y8XswspY=;
 b=ZlyF/6qMmeOm2aV14Q9AGHM8krVaGQtOJJAB393UIiMjvtkNjUQNjVJ+9JHH64bhOk3/I1/esLF8LZCI55NoD6TZAhzTOqP7Y9EJGneCx3jw65/dc9Zozz8zrF28q04EHjtU/2bZDcVpjK9QKKtf3Inb4JrgrL5rGoVnHiOCslY=
Received: from CO6PR12MB5489.namprd12.prod.outlook.com (2603:10b6:303:139::18)
 by CH3PR12MB7692.namprd12.prod.outlook.com (2603:10b6:610:145::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.43; Mon, 15 Apr
 2024 02:55:22 +0000
Received: from CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::5f4:a2a9:3d28:3282]) by CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::5f4:a2a9:3d28:3282%4]) with mapi id 15.20.7452.049; Mon, 15 Apr 2024
 02:55:22 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "lyude@redhat.com" <lyude@redhat.com>, "Wentland, Harry"
 <Harry.Wentland@amd.com>, "imre.deak@intel.com" <imre.deak@intel.com>,
 =?iso-8859-1?Q?Leon_Wei=DF?= <leon.weiss@ruhr-uni-bochum.de>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>, "jeffm@suse.com"
 <jeffm@suse.com>
Subject: Re: [PATCH] drm/mst: Fix NULL pointer dereference at
 drm_dp_add_payload_part2
Thread-Topic: [PATCH] drm/mst: Fix NULL pointer dereference at
 drm_dp_add_payload_part2
Thread-Index: AQHacFj2giCMd8JLWkW3Q37cghjqLbFo35Af
Date: Mon, 15 Apr 2024 02:55:22 +0000
Message-ID: <CO6PR12MB5489CA20D64BF9E38FE6CC5FFC092@CO6PR12MB5489.namprd12.prod.outlook.com>
References: <20240307062957.2323620-1-Wayne.Lin@amd.com>
In-Reply-To: <20240307062957.2323620-1-Wayne.Lin@amd.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=True;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2024-04-15T02:55:21.151Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged; 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR12MB5489:EE_|CH3PR12MB7692:EE_
x-ms-office365-filtering-correlation-id: 14ddaacb-be0f-4df0-048b-08dc5cf77e0d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lOkatgVjWG0TDArACfUeFyqWjytl7SGpfddbSQLmVaREvFgxnYLxRv/vbmIWL+QptV3wAFT70n9x1LvBDQrzJCHk4fA2qZDXPvRjqI2qMNxIHiR/rmoaGZFOl0vfkKaFHG/VlRE/NwsbvPji6ggLXXI9Pwwsmz+bT9ko9Svpo7RvSThy15y9nXh9uP4e2T88Xqmtk7YnUIz+krfOJOOfdplaMmbK1Ojpm3EJk+l1cqExXLTsHXktsI7gv3BBzD4iXZl/QpWpbolbasl6jnKh1Ns6TzYEpDZxJDlQJKKFf+Suyx74CgoSaY8/VYDGqA2YM19o7sGQIoUy/aDCbmT9cKavgvffcxmDfhKqhFilpnWYDgUgNaF67uTmvy3ZXQd0WzfSHXT9twXuLKjnVCGxlieOY6/7kid9p1M2497ELoox+sL5cimHDH0FkRwWz3c0zrmomfmoGGjfatmcvCq45m0XBmy+fMFGpsevX9hrbR+pMEonQwpUmYrPDhHoCsz31Nt3zI58abdMLDxNpqTlW0I+onxeaeV4eL8dGwooP3OQazz/RjFBD0662gAVX8oalEeui/UQwlNe5rw6S7kE7Gd2P/crBWYQkTkYWvjOxnFucEVMzbVB5jBQX3P9cYcxpYSlXN99fLfLLxIj7pvl0uX/AltwWxlfcfokaCLjjITkKNzddQi7ZxHtLEs01zRuMHzT75o5rqdzbV6/0cpoK2IfzgVq1jw0ItJkrRQlcX4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5489.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?5Q01Q5Bab/EXyuO4wug5omcw2g+UvezrEAX9hNyf/A5lqZtgt10oJ3HPKz?=
 =?iso-8859-1?Q?lO+i7pvQZxeQKBnAa/vCBQP235Jw3jvgxWCMbKNXZl+6WB4UZVe9Dthy1Q?=
 =?iso-8859-1?Q?xvcjxOJ8Hxuq5cv5AwT0+LUUSaGpcSHKAsQyUn9oBlDnWX7sURqkfXlAbH?=
 =?iso-8859-1?Q?ienb3VoWo87lbshmjHkf5eJKOsErEIy3C8amcWfN7q3rMgJKLDvZ9gHhpn?=
 =?iso-8859-1?Q?bEReltFBvKwtfsg9GXimh+JRPtUWNUD3+A8frSgVG8x8JOXFE6+esBSUtK?=
 =?iso-8859-1?Q?N3wsIYXvyd13AggxCFl1TVaxmnl7pkJSS7a63kskNF8gzYR0MzF53es+sB?=
 =?iso-8859-1?Q?0DorjrplHZvOm8D9WsZCRZqE4kWsmm/L7WiWKpoD/kMdQMDT6Iz57SWmMw?=
 =?iso-8859-1?Q?eRt/Knh4LH/qu9Y+rwKv2pbkkXOg1Uck0SJT3oEwQdU4VTqxdqjttAkj8K?=
 =?iso-8859-1?Q?4vt0lnWQewmYnZuVSfSUm4Uoa9JEORkg2MrPCEs4ahl0JsrjPuPC+QL/rU?=
 =?iso-8859-1?Q?g3/Lx5Xo3KHtA437nR28fpqRBas4jzmoXJYWD4AjOfTR/GBRLwwq00HjNr?=
 =?iso-8859-1?Q?3bUbHN6QWNIs9lZsqm908skKnCVawfGx4B97nNJKYR3AjwS3T/L8SbvKIe?=
 =?iso-8859-1?Q?re8N9dFX6iQZg12ZP7qeqG2z2WpEd7rW7WpYEQfj08LGD7p989Gvc4p+a7?=
 =?iso-8859-1?Q?J+Xez0u10Y0il+/OAH+wshVxf3OzrMC3RigEZ2SQSMvBlEmFpAqdWKdmfn?=
 =?iso-8859-1?Q?Q0e02XPoSWMGmbkBJnhxUUxjT8c+yht2PmQAVtKrUsYK4jYS2YAbH23suZ?=
 =?iso-8859-1?Q?ROoA7+yHdSr2aGKX9HB5arHLfda2lH49kiuk4YdsMpXWQM30ah71BGou14?=
 =?iso-8859-1?Q?BJNSbLp5NhIU33z+c40NNUcw+wXXiCJG4ZtF7/0UAC6yFRlNkx8PW3gj+2?=
 =?iso-8859-1?Q?YM2G9Gzo9VqX+Vvt9j3niAh9Fndjo6XWauTTuGeTQPssJ5RRz5mMB9xWhI?=
 =?iso-8859-1?Q?a0O2rcRmPqW2Z5Aefyq2Pe7I+r/5TCRmW95zhHt2pPP0lws6sZNWqsPTkT?=
 =?iso-8859-1?Q?jZ3DnJAa2U0yrd7+GH8z/vz1HMpMvU+TcX2fZseAWspKto++2NRXvDMkEE?=
 =?iso-8859-1?Q?6jqeNAzwJM1uimtwOA+txQ5/oQQsjvG9ayOfPBrfcbvbdE6q4oOt7vPGxp?=
 =?iso-8859-1?Q?O80CJxDLqycBjblUpXQycKUXVQzgqBDKnpEKRL/71YMlYYFkeAf4CCN4cN?=
 =?iso-8859-1?Q?Vvw1sDA5xb6sCiN0CzlmYLUxKF3BNYJODGC13VXCjOmywVQvMZ/3OIwntd?=
 =?iso-8859-1?Q?ip4XEVaX3FaE0qZdpBLKdpYlemooqFIk79+V4Pd87aS4+7Ue1ztvleHzlI?=
 =?iso-8859-1?Q?jUBg/F6UtYe4EKNAKws8qDekA4Ltup8VyZhc8IRcHF6mIUfJwio+jo7Cgv?=
 =?iso-8859-1?Q?SU9JZErxRau2B7YGJFFYnoa9xFB5dO3y0r7Et4BW4CpovW3cKu2mxndFT3?=
 =?iso-8859-1?Q?ROx/yIvoeDeWZJvQ4XiOBpUCzRJfL1Q/drEGSarI6uHXRffKTqwHr8WXWZ?=
 =?iso-8859-1?Q?2xlfpKHRVTYHSmMJGgrnO5gY2HQck0wpIwTg9A3LvHDKDgwCrGUmfujECc?=
 =?iso-8859-1?Q?vrXn+Uom1b6ow=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5489.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14ddaacb-be0f-4df0-048b-08dc5cf77e0d
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2024 02:55:22.0902 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lZLfBKVOcSaeCAUzhQIsHpCMVLfoVXYH54BWlGqkkcBF+E2DAV5f2BUt0GhY2emHAXrhw/XgQc9Eyk5KHknjXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7692
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

[Public]

Ping for code review. Thanks!

Regards,
Wayne

________________________________________
From: Wayne Lin <Wayne.Lin@amd.com>
Sent: Thursday, March 7, 2024 14:29
To: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org; intel-g=
fx@lists.freedesktop.org
Cc: lyude@redhat.com; Wentland, Harry; imre.deak@intel.com; Lin, Wayne; Leo=
n Wei=DF; stable@vger.kernel.org; regressions@lists.linux.dev
Subject: [PATCH] drm/mst: Fix NULL pointer dereference at drm_dp_add_payloa=
d_part2

[Why]
Commit:
- commit 5aa1dfcdf0a4 ("drm/mst: Refactor the flow for payload allocation/r=
emovement")
accidently overwrite the commit
- commit 54d217406afe ("drm: use mgr->dev in drm_dbg_kms in drm_dp_add_payl=
oad_part2")
which cause regression.

[How]
Recover the original NULL fix and remove the unnecessary input parameter 's=
tate' for
drm_dp_add_payload_part2().

Fixes: 5aa1dfcdf0a4 ("drm/mst: Refactor the flow for payload allocation/rem=
ovement")
Reported-by: Leon Wei=DF <leon.weiss@ruhr-uni-bochum.de>
Link: https://lore.kernel.org/r/38c253ea42072cc825dc969ac4e6b9b600371cc8.ca=
mel@ruhr-uni-bochum.de/
Cc: lyude@redhat.com
Cc: imre.deak@intel.com
Cc: stable@vger.kernel.org
Cc: regressions@lists.linux.dev
Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 2 +-
 drivers/gpu/drm/display/drm_dp_mst_topology.c             | 4 +---
 drivers/gpu/drm/i915/display/intel_dp_mst.c               | 2 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c                   | 2 +-
 include/drm/display/drm_dp_mst_helper.h                   | 1 -
 5 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/dr=
ivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index c27063305a13..2c36f3d00ca2 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -363,7 +363,7 @@ void dm_helpers_dp_mst_send_payload_allocation(
        mst_state =3D to_drm_dp_mst_topology_state(mst_mgr->base.state);
        new_payload =3D drm_atomic_get_mst_payload_state(mst_state, aconnec=
tor->mst_output_port);

-       ret =3D drm_dp_add_payload_part2(mst_mgr, mst_state->base.state, ne=
w_payload);
+       ret =3D drm_dp_add_payload_part2(mst_mgr, new_payload);

        if (ret) {
                amdgpu_dm_set_mst_status(&aconnector->mst_status,
diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/dr=
m/display/drm_dp_mst_topology.c
index 03d528209426..95fd18f24e94 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -3421,7 +3421,6 @@ EXPORT_SYMBOL(drm_dp_remove_payload_part2);
 /**
  * drm_dp_add_payload_part2() - Execute payload update part 2
  * @mgr: Manager to use.
- * @state: The global atomic state
  * @payload: The payload to update
  *
  * If @payload was successfully assigned a starting time slot by drm_dp_ad=
d_payload_part1(), this
@@ -3430,14 +3429,13 @@ EXPORT_SYMBOL(drm_dp_remove_payload_part2);
  * Returns: 0 on success, negative error code on failure.
  */
 int drm_dp_add_payload_part2(struct drm_dp_mst_topology_mgr *mgr,
-                            struct drm_atomic_state *state,
                             struct drm_dp_mst_atomic_payload *payload)
 {
        int ret =3D 0;

        /* Skip failed payloads */
        if (payload->payload_allocation_status !=3D DRM_DP_MST_PAYLOAD_ALLO=
CATION_DFP) {
-               drm_dbg_kms(state->dev, "Part 1 of payload creation for %s =
failed, skipping part 2\n",
+               drm_dbg_kms(mgr->dev, "Part 1 of payload creation for %s fa=
iled, skipping part 2\n",
                            payload->port->connector->name);
                return -EIO;
        }
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/=
i915/display/intel_dp_mst.c
index 53aec023ce92..2fba66aec038 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -1160,7 +1160,7 @@ static void intel_mst_enable_dp(struct intel_atomic_s=
tate *state,
        if (first_mst_stream)
                intel_ddi_wait_for_fec_status(encoder, pipe_config, true);

-       drm_dp_add_payload_part2(&intel_dp->mst_mgr, &state->base,
+       drm_dp_add_payload_part2(&intel_dp->mst_mgr,
                                 drm_atomic_get_mst_payload_state(mst_state=
, connector->port));

        if (DISPLAY_VER(dev_priv) >=3D 12)
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouv=
eau/dispnv50/disp.c
index 0c3d88ad0b0e..88728a0b2c25 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -915,7 +915,7 @@ nv50_msto_cleanup(struct drm_atomic_state *state,
                msto->disabled =3D false;
                drm_dp_remove_payload_part2(mgr, new_mst_state, old_payload=
, new_payload);
        } else if (msto->enabled) {
-               drm_dp_add_payload_part2(mgr, state, new_payload);
+               drm_dp_add_payload_part2(mgr, new_payload);
                msto->enabled =3D false;
        }
 }
diff --git a/include/drm/display/drm_dp_mst_helper.h b/include/drm/display/=
drm_dp_mst_helper.h
index 9b19d8bd520a..6c9145abc7e2 100644
--- a/include/drm/display/drm_dp_mst_helper.h
+++ b/include/drm/display/drm_dp_mst_helper.h
@@ -851,7 +851,6 @@ int drm_dp_add_payload_part1(struct drm_dp_mst_topology=
_mgr *mgr,
                             struct drm_dp_mst_topology_state *mst_state,
                             struct drm_dp_mst_atomic_payload *payload);
 int drm_dp_add_payload_part2(struct drm_dp_mst_topology_mgr *mgr,
-                            struct drm_atomic_state *state,
                             struct drm_dp_mst_atomic_payload *payload);
 void drm_dp_remove_payload_part1(struct drm_dp_mst_topology_mgr *mgr,
                                 struct drm_dp_mst_topology_state *mst_stat=
e,
--
2.37.3


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A39A58EC1
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 10:00:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4317710E3BC;
	Mon, 10 Mar 2025 09:00:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="XB1Db1Ul";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2072.outbound.protection.outlook.com [40.107.94.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EAC310E3BB;
 Mon, 10 Mar 2025 08:59:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K5KVNbRXEyLn/PdkseRNoXhvnWVptSewFSPbndKZrAPJj+GTbI1kURTsFaRmSVSkaFe/h8ct6A86VW5tSXqTSA2ThlLGcIaoIhYjnskgLgGbTpdo8FNJcFwk9BRpmClL/uyZdy5p27/RZohVYJseRvai9mD5kqooRZruXjZISzoO/o4/5ZWdOnPV6E0xNMWxzgyjZG/1N0Z+ukLhKI+F2vwTD+0pZkdrtOZDfXKS/XJx4UHUBzQLCTqXUOpduP8TdYKVoMA8BfyWLE8gYd2JSw+o7PtVTLFjlAhLYjajCft3vDtA33vrHEeRqkAKM0ctECKuFmmCP3orujZGLSGOPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fb5eTUlmuOr4qN/v4OVudn5n8kird+IdZkROsPVV8B4=;
 b=q8+fI7x9OWDt7hoUqIOT1Hetq40Rs3GgNEgH7ygoRTYaNnG/N5ZmCI2BcPOyhm9zJ7Vt215EZtfx3KD1oOcaIe1EdZps5BiHTqhNJ9/6asSDhTRHnIuKwEJTy2jLwacWYKnL2JjNvUN/pxiyNJV2ksI+e1o/TNAM33eBpRZd1FfMlyaNA6OzYa41ZctTRrKEJR1vdy1RP0DzIZ9HVgL1OQ4H5C7H3cgH/4pJfRottxE5zimTpcPWpHBHtci9RJJf/U16tMVSC667yXW3NPlUT8bZI5Wd/b+JFBghRjCRTm5lCRJ/KwIvAnQkH04/EqkPcp5r4k3zamGzKHJUff5B8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fb5eTUlmuOr4qN/v4OVudn5n8kird+IdZkROsPVV8B4=;
 b=XB1Db1Ult9Zuxg47N5YQ5qbqJcsGoa/VkBJqIdnHYXaLbPobBYJ1F8e0X+12+dwRplmnVVxg2g4bISptWH2dIv6q5ddBRORfqXXKucqERtl2FSsPO4tL21sC4Lv+6W+SH0vJmK8RGBHjM5kq0pEAEsJ6x2cfdC8ShLJnow0fWOE=
Received: from CO6PR12MB5489.namprd12.prod.outlook.com (2603:10b6:303:139::18)
 by MN0PR12MB6151.namprd12.prod.outlook.com (2603:10b6:208:3c5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Mon, 10 Mar
 2025 08:59:51 +0000
Received: from CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::5f4:a2a9:3d28:3282]) by CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::5f4:a2a9:3d28:3282%4]) with mapi id 15.20.8511.026; Mon, 10 Mar 2025
 08:59:51 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
To: Imre Deak <imre.deak@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: Lyude Paul <lyude@redhat.com>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>
Subject: RE: [PATCH] drm/dp_mst: Fix locking when skipping CSN before topology
 probing
Thread-Topic: [PATCH] drm/dp_mst: Fix locking when skipping CSN before
 topology probing
Thread-Index: AQHbj482QRprfF/0iEK8Px6Ys6YLELNsC6Bw
Date: Mon, 10 Mar 2025 08:59:51 +0000
Message-ID: <CO6PR12MB5489FF5590A559FD1B48A34EFCD62@CO6PR12MB5489.namprd12.prod.outlook.com>
References: <20250307183152.3822170-1-imre.deak@intel.com>
In-Reply-To: <20250307183152.3822170-1-imre.deak@intel.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=80f5f916-0523-494c-bec2-a6fef43cd6d6;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open Source;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-03-10T08:46:50Z;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Tag=10, 0, 1, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR12MB5489:EE_|MN0PR12MB6151:EE_
x-ms-office365-filtering-correlation-id: 7df9ef35-b3b2-4b91-3e20-08dd5fb1eb06
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?w+pgb9nPEkcNHEtKng1D+SGxSSLWETG0gkeGiFaj5eFErFHA9sADJbZ3kZuL?=
 =?us-ascii?Q?ZkgjpbJWuinD7Fspf6AEdfQ0pIwoqImUXxZ8fd5XHYjiygZAESc8L7X83VND?=
 =?us-ascii?Q?F3iIc7uqsVZg3z36kAXLsXdH7W4v+J7MO6X6lMMgLahYwVsoj4yRvgcwNe4g?=
 =?us-ascii?Q?/Epx5tE/vkVl3iqfMJHvmQxAq6uEAy776c7vu6hAtULWr9hG7gKTZ/qgRtGp?=
 =?us-ascii?Q?cUaI8iz7VGZuKPZyQxf5VjGuDisTgXmKaSLtUyW4y2S8/R8z0tI/7gBfe8FM?=
 =?us-ascii?Q?41OJQ5gtpRWxZQ1x1lzZGY/V5Y4uRcqhiBf71NOCEU2vifT3A8lyKJz1ve31?=
 =?us-ascii?Q?GjGaL3JCqCzsj0u1rW4vWuZTmpdA9hYzTbhmxSgP/TLm6C2/X6zVsi4JxYfL?=
 =?us-ascii?Q?1V98TCXEj1xnOppbnHv0W6BBER3n2MW/UHMXuGsqh8BcP3m2E4vFN5OGuqTb?=
 =?us-ascii?Q?32ZwWCSrrHo2esi0yJvgssTZrJahq8Mh9gNjNp7BGWeyVZV1edE5SDWcT39k?=
 =?us-ascii?Q?6Nl3UVFni1VXfuYPkcR9sHBsj22XBcS0iuq3t/0fjAzS22uIkAHIeyVMTiK3?=
 =?us-ascii?Q?yRMTXeO75xlrNEY4g7m7Vp7Ws/Afz/SQfyjTymak3Zf0UV1zBT010RjhsKtO?=
 =?us-ascii?Q?U8+7yuyYWQ7vgRQsd/izLIOA2meO6tZ//XvNZfCtFBmYXZyN5OrBYRmrElZS?=
 =?us-ascii?Q?1y5Jp+SygcSJGh5DDVzScD8mSG+Ht3In/GCsVvGzWfPPMrawV0RyqIwIFL+Q?=
 =?us-ascii?Q?KNiNSHMgQWyO9emvoydQUhp+40oQzZcxWFc1UhVvvMw5Oslrbkjng/r2vpr8?=
 =?us-ascii?Q?nx2RMRMDInG54DE1sMbHlf5tBKDAx9HPD9XhNh+J78GedTJqK6K3E9mA+38d?=
 =?us-ascii?Q?P7voI81ZwrPU5z2NyKrzFb0rtB/IT71SSoXgtGkTBJaS9asM2n8RiUE+/eZM?=
 =?us-ascii?Q?L+Ip3ISyNE/VKjU5nGZsMzUnqJadJexfl9vT3ij9uRTYzB63C8kaH0xCfFIi?=
 =?us-ascii?Q?vVyAkBKwp4luMUvaFNb2B+K9or89wH5566SiZG7ArfMdh0UdJkGjRwPHOhe+?=
 =?us-ascii?Q?BsQ27BMat73mx7F9I/5E/bY/HaTV4+gZwvhtq5N4XN1XGezgybx92puRiY7m?=
 =?us-ascii?Q?ZtSoPg/72iqb8A1okc7PeStY11MO7aamXEldiEpWXmjuUnTrj4xqKVR3WbX4?=
 =?us-ascii?Q?pbEdDFMpFSBXIkD339T87itckUnxMLBFDIFwTbY4yTQ6nTO+K1X3gl4W4HpT?=
 =?us-ascii?Q?hry0LkBZI9y0me+33nx2kFjzZjwdUjfXJ3VeLEziBrPjVGV1oSMmS3cJ1yrI?=
 =?us-ascii?Q?v1UCjGo0XWcTfFKCnjWgRWN2BoUP0JkhacKK/zlWIkdOq2csHIe0XbyF3SE4?=
 =?us-ascii?Q?ScyXEhMZlDLNoKdgaZ+XB7QRTELoDw1cQ1xmI1oa/dHyJ/EN8yBMtZM8ato0?=
 =?us-ascii?Q?v0BI7/AKV10wYWjPKeGQ8Xr+AXYCCU+V?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5489.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ng329TgCVp6lE9cBv3yqTeFToFQ9LYMgItt7vb3Lml/N5YlEO19t4hn4iFI+?=
 =?us-ascii?Q?DaD2rS4lQgSf2KABzOXszSIAGFVJQ1crfXCLhk+yJNoq1VPlFZ7+Qit+BBrl?=
 =?us-ascii?Q?YEZ4YirPdSfM+Y2Y4mGCttTZOAVSnXGM5xyfhUHDVl/99cD3/DcIc9VO1uzO?=
 =?us-ascii?Q?8xgjUf27GJaOKnz+BYJg8SAS25veG1FHN/eosXHh9EZ2E6YdEOV41LLUNXJU?=
 =?us-ascii?Q?Y+2Fk7NM+vMJEOFk0hHWAO2chVkXQOUTHxEHtuhRRIAwsWpODvQPlsvyy8jQ?=
 =?us-ascii?Q?yFivtcCm2X3Vn4yuVGNrAP4QSTo1jL4Efe2XdGzoohrtIBVGRos60tWdfGqF?=
 =?us-ascii?Q?/TkkifdSdlOkClfvb54dPwR5cw7OIcg7VVFiRMFAdYG/C3Qb4SpAo6KAwvkP?=
 =?us-ascii?Q?C55vcvUN9muCEo/yJ3gt0USYS0wseNKjpCpLtuFiSFqqcqoDx4sieDFhEltH?=
 =?us-ascii?Q?/Ge98Qlt0efr4H3444E25F7YKFBYfwOK2p1kl0Yk31Zlc7b3b0pZzffK5TWw?=
 =?us-ascii?Q?91gJIJIe5WBPiMfhstZ/GfTQB92u3mgzul8SLgn5EHrjgDELC8hig8un7WW0?=
 =?us-ascii?Q?9bGT7IdJecbayiD8DJEljo6tmgOLPOUGp6QgDrjS7hxMeOgaugD/I4EcDxPn?=
 =?us-ascii?Q?KyMpVsNKau31MHsCPPlrA1xZ4q89MmAbJh1KwGo5aQMas95HGcYj6CoM1Ynb?=
 =?us-ascii?Q?EeIcxTN4i5xsaIKNsrzPFDwgrSnWM2DJ/GyUEjGxuKxppbATkStpUeFYooBJ?=
 =?us-ascii?Q?hQ4wsq4geDUlS3ebbuwFqLrYXJO3LQqhkjTY+OKJMCC3nMWmUsH1A0pGBPrb?=
 =?us-ascii?Q?m8OcqEsVJwCechG5VXali292Cc4ZApkZHv+77M6PAhiTGjL0Ly4ixTMZN17Z?=
 =?us-ascii?Q?x4eQ+GW9W8TBJrXDd/BCGPB1gJPAjVJ1wIoK7NUCHqSWhbRTLz+nIzwrRySw?=
 =?us-ascii?Q?rdFEA+MUFrLhNkh8peLzi1jPBiyk4kcX8mdy4F/F3o8A+8Z9zo/6W/hb9xIJ?=
 =?us-ascii?Q?7D4ofaOe6UKg+Hy6vM1MIEXtE4bjnpmnyhsev0xcLxJunmGaRKcgLFKZuPfg?=
 =?us-ascii?Q?r8yJw2wkQnmaoCDxvMaFT3hfLSYPv+zeDVjtr31E6n9bGwF8rTsFPwfhG8+1?=
 =?us-ascii?Q?idUj8uzbxRK9GmQ5fsK5ej/h4CuyQur7UNZuScYoR1m2VaTa0pn3oNzcUNi2?=
 =?us-ascii?Q?pcfq5taN3eXXsR1Tyc9uWimw61wQkZOMYwBXtqxBRYgDiM4RFKBQf3EMVnx8?=
 =?us-ascii?Q?mDWW3msf3EJON6JZ9NKSO6GH6fHXUUgyHCx4Jo2jk97Wppm1ws21KgXnOL7S?=
 =?us-ascii?Q?kKNm39OCOJVOIVXjubk9lJ3FxfunDCxF4hEEHnud7shgplcMsqxa7st+09ck?=
 =?us-ascii?Q?RXp4G12X/y/8dCe0mABmN9AKGnXo1w3JhY0BTpiLTqE261N3rW8hXQVgkxmf?=
 =?us-ascii?Q?VVKyN7m69OibI1UdYEAwJ7L+WAaeFs+Xo9c1N66h24IZhS3p/p2D37trHV1o?=
 =?us-ascii?Q?IlMANmidtPRmxFbWG2xq3+quM2MSYAl9vPwbEJoK1dczdN2REuDX75A/cSgO?=
 =?us-ascii?Q?pzfZo+M8MjDeNEZ/lRg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5489.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7df9ef35-b3b2-4b91-3e20-08dd5fb1eb06
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2025 08:59:51.3191 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lw63W2gBcGmQzbTBeMr32z+Rw6BRYVm74Df+Cm6Fy25uausqjl3QW1oqJJZVvT5ml1jngSSkE1rVAsZj+3CSVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6151
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

> -----Original Message-----
> From: Imre Deak <imre.deak@intel.com>
> Sent: Saturday, March 8, 2025 2:32 AM
> To: intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org; dri-
> devel@lists.freedesktop.org
> Cc: Lin, Wayne <Wayne.Lin@amd.com>; Lyude Paul <lyude@redhat.com>;
> stable@vger.kernel.org
> Subject: [PATCH] drm/dp_mst: Fix locking when skipping CSN before topolog=
y
> probing
>
> The handling of the MST Connection Status Notify message is skipped if th=
e probing
> of the topology is still pending. Acquiring the drm_dp_mst_topology_mgr::=
probe_lock
> for this in
> drm_dp_mst_handle_up_req() is problematic: the task/work this function is=
 called
> from is also responsible for handling MST down-request replies (in
> drm_dp_mst_handle_down_rep()). Thus drm_dp_mst_link_probe_work() - holdin=
g
> already probe_lock - could be blocked waiting for an MST down-request rep=
ly while
> drm_dp_mst_handle_up_req() is waiting for probe_lock while processing a C=
SN
> message. This leads to the probe work's down-request message timing out.
>
> A scenario similar to the above leading to a down-request timeout is hand=
ling a CSN
> message in drm_dp_mst_handle_conn_stat(), holding the probe_lock and send=
ing
> down-request messages while a second CSN message sent by the sink
> subsequently is handled by drm_dp_mst_handle_up_req().
>
> Fix the above by moving the logic to skip the CSN handling to
> drm_dp_mst_process_up_req(). This function is called from a work (separat=
e from
> the task/work handling new up/down messages), already holding probe_lock.=
 This
> solves the above timeout issue, since handling of down-request replies wo=
n't be
> blocked by probe_lock.
>
> Fixes: ddf983488c3e ("drm/dp_mst: Skip CSN if topology probing is not don=
e yet")
> Cc: Wayne Lin <Wayne.Lin@amd.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: stable@vger.kernel.org # v6.6+
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/display/drm_dp_mst_topology.c | 40 +++++++++++--------
>  1 file changed, 24 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> index 8b68bb3fbffb0..3a1f1ffc7b552 100644
> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> @@ -4036,6 +4036,22 @@ static int drm_dp_mst_handle_down_rep(struct
> drm_dp_mst_topology_mgr *mgr)
>       return 0;
>  }
>
> +static bool primary_mstb_probing_is_done(struct drm_dp_mst_topology_mgr
> +*mgr) {
> +     bool probing_done =3D false;
> +
> +     mutex_lock(&mgr->lock);

Thanks for catching this, Imre!
Here I think using mgr->lock is not sufficient for determining probing is d=
one or not by
mst_primary->link_address_sent. Since it might still be probing the rest of=
 the topology
with mst_primary probed. Use probe_lock instead? Thanks!

> +
> +     if (mgr->mst_primary && drm_dp_mst_topology_try_get_mstb(mgr-
> >mst_primary)) {
> +             probing_done =3D mgr->mst_primary->link_address_sent;
> +             drm_dp_mst_topology_put_mstb(mgr->mst_primary);
> +     }
> +
> +     mutex_unlock(&mgr->lock);
> +
> +     return probing_done;
> +}
> +
>  static inline bool
>  drm_dp_mst_process_up_req(struct drm_dp_mst_topology_mgr *mgr,
>                         struct drm_dp_pending_up_req *up_req) @@ -4066,8
> +4082,12 @@ drm_dp_mst_process_up_req(struct drm_dp_mst_topology_mgr
> *mgr,
>
>       /* TODO: Add missing handler for DP_RESOURCE_STATUS_NOTIFY
> events */
>       if (msg->req_type =3D=3D DP_CONNECTION_STATUS_NOTIFY) {
> -             dowork =3D drm_dp_mst_handle_conn_stat(mstb, &msg->u.conn_s=
tat);
> -             hotplug =3D true;
> +             if (!primary_mstb_probing_is_done(mgr)) {
> +                     drm_dbg_kms(mgr->dev, "Got CSN before finish topolo=
gy
> probing. Skip it.\n");
> +             } else {
> +                     dowork =3D drm_dp_mst_handle_conn_stat(mstb, &msg-
> >u.conn_stat);
> +                     hotplug =3D true;
> +             }
>       }
>
>       drm_dp_mst_topology_put_mstb(mstb);
> @@ -4149,10 +4169,11 @@ static int drm_dp_mst_handle_up_req(struct
> drm_dp_mst_topology_mgr *mgr)
>       drm_dp_send_up_ack_reply(mgr, mst_primary, up_req->msg.req_type,
>                                false);
>
> +     drm_dp_mst_topology_put_mstb(mst_primary);
> +
>       if (up_req->msg.req_type =3D=3D DP_CONNECTION_STATUS_NOTIFY) {
>               const struct drm_dp_connection_status_notify *conn_stat =3D
>                       &up_req->msg.u.conn_stat;
> -             bool handle_csn;
>
>               drm_dbg_kms(mgr->dev, "Got CSN: pn: %d ldps:%d ddps: %d mcs=
:
> %d ip: %d pdt: %d\n",
>                           conn_stat->port_number,
> @@ -4161,16 +4182,6 @@ static int drm_dp_mst_handle_up_req(struct
> drm_dp_mst_topology_mgr *mgr)
>                           conn_stat->message_capability_status,
>                           conn_stat->input_port,
>                           conn_stat->peer_device_type);
> -
> -             mutex_lock(&mgr->probe_lock);
> -             handle_csn =3D mst_primary->link_address_sent;
> -             mutex_unlock(&mgr->probe_lock);
> -
> -             if (!handle_csn) {
> -                     drm_dbg_kms(mgr->dev, "Got CSN before finish topolo=
gy
> probing. Skip it.");
> -                     kfree(up_req);
> -                     goto out_put_primary;
> -             }
>       } else if (up_req->msg.req_type =3D=3D DP_RESOURCE_STATUS_NOTIFY) {
>               const struct drm_dp_resource_status_notify *res_stat =3D
>                       &up_req->msg.u.resource_stat;
> @@ -4185,9 +4196,6 @@ static int drm_dp_mst_handle_up_req(struct
> drm_dp_mst_topology_mgr *mgr)
>       list_add_tail(&up_req->next, &mgr->up_req_list);
>       mutex_unlock(&mgr->up_req_lock);
>       queue_work(system_long_wq, &mgr->up_req_work);
> -
> -out_put_primary:
> -     drm_dp_mst_topology_put_mstb(mst_primary);
>  out_clear_reply:
>       reset_msg_rx_state(&mgr->up_req_recv);
>       return ret;
> --
> 2.44.2

--
Regards,
Wayne Lin

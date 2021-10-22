Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD5543740D
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 10:55:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53DD16E90C;
	Fri, 22 Oct 2021 08:55:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2081.outbound.protection.outlook.com [40.107.243.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31BAE6E90B;
 Fri, 22 Oct 2021 08:55:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KRuRdyiUhfjKU+oGdzb23+cfLQf1poXusqUMvZFnfDmLQHkCeQJGNq9tHDE4+djzQ6iA3v6CJUAdMCAfAxaKARgGUYrh+LUkOqclQcL4ADnb+O3vnGk3Ei1za9hb6TZXoAHUj3rsfDBeXWp/jf6+jzDuMaMjhrwd0gjkqEOwlaOsc8ibtytGLBB2IQPQ6vbUQ3s331HiSfuztelHz6Bi9u/+qD0uHrDib1+ZxjfKz5x+jdTElsTZe/u6bHFml8Oteyegsoi3MF4ynpcRM7uWONd2jdlIxIhbpbggFJzgDSnMNqci3SgBc8iAQxksKC5T4s3r2QDlEU45kYFzX8/23w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x32ZiGZlNKQImbCxy2hujeUAvPuYzuUxDGnaqyKhXm4=;
 b=V8cK5f2gzDGtL1wekPOT59wudtrRr0XYD5udvW2vR4WlrreIDU4lHppb87w7KZu9SGSP5fHtl6ASls2y2peADOZpbf6gRMfzDWgnxxhEF0oSm1jDcQTp63EQFrOITpv6QIgyCF5dOYi8cNKk/zaVn4+yYqOlRamJj05OmEQXqNYxTsVR/STikxd9svvIpUB5BoVTIUJbj0mHRAls8heaK66N8j9QPXKz96/oB4lske0D948ny5XBDw2plwl3bbuipHhHjW/YJz/i/sIRWUyh8h2RZJ+m+k7n6XspVkjIfZT8v2TqBa8AU50+LjhyPsP7DF/YsMmjCbxIuNWaoFuvkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x32ZiGZlNKQImbCxy2hujeUAvPuYzuUxDGnaqyKhXm4=;
 b=fN2OMk1++GFSY+0zvy91yylu2MVaqNPx+Ezmt6eEDBlL6gAlRpe4CPG4pJxUEU3JNJR9q5u79N+uNG92THKVQutYNfcDEST7ThEk5Nxwri2iAS3DdiFT4NzA2svScOfYHrPAXNY7Y9A8oGL5MYgSTODIMhzeeWKR/WoPX2VPUMs=
Received: from CO6PR12MB5489.namprd12.prod.outlook.com (2603:10b6:303:139::18)
 by CO6PR12MB5425.namprd12.prod.outlook.com (2603:10b6:303:13e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16; Fri, 22 Oct
 2021 08:55:01 +0000
Received: from CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::14f7:9173:d617:e87c]) by CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::14f7:9173:d617:e87c%2]) with mapi id 15.20.4628.018; Fri, 22 Oct 2021
 08:55:00 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
To: "Lakha, Bhawanpreet" <Bhawanpreet.Lakha@amd.com>, "Zuo, Jerry"
 <Jerry.Zuo@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "lyude@redhat.com" <lyude@redhat.com>
CC: "Wentland, Harry" <Harry.Wentland@amd.com>, "Kazlauskas, Nicholas"
 <Nicholas.Kazlauskas@amd.com>, "Lipski, Mikita" <Mikita.Lipski@amd.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Lakha,
 Bhawanpreet" <Bhawanpreet.Lakha@amd.com>
Subject: RE: [PATCH 4/4] drm/amd/display: Add DP 2.0 MST DM Support
Thread-Topic: [PATCH 4/4] drm/amd/display: Add DP 2.0 MST DM Support
Thread-Index: AQHXxevO6q8blu+kUUCsV8Y75/0nd6vetaPQ
Date: Fri, 22 Oct 2021 08:55:00 +0000
Message-ID: <CO6PR12MB54894F6D18CEA37100A67B5CFC809@CO6PR12MB5489.namprd12.prod.outlook.com>
References: <20211020194715.1107972-1-Bhawanpreet.Lakha@amd.com>
 <20211020194715.1107972-4-Bhawanpreet.Lakha@amd.com>
In-Reply-To: <20211020194715.1107972-4-Bhawanpreet.Lakha@amd.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ActionId=b9d92d96-8f83-4cfa-9492-45f699ce0b84;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=true;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD
 Official Use Only-AIP 2.0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-10-22T08:42:26Z;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 073515b4-428b-45d9-8e85-08d99539a1c1
x-ms-traffictypediagnostic: CO6PR12MB5425:
x-microsoft-antispam-prvs: <CO6PR12MB5425C4A558480741B67DF7E8FC809@CO6PR12MB5425.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: e9gk8uPAfaF6VLN6gmrI4WytUeoR4ZpQdQNIVI8L9hnko1htUMNhxevtyho07c77InMEXvgU3Ci83+6ZTD+JXiDcCpv/N0zbR8TYPqvhxQZ6889MmWRU8i5A6Kt2D1q/fDHfdOYYaSYKPb4t9uyD+6PKY9rKqOogr88Z9RZP6KiIcag+fwv00RMoxyTPdjzi5Vcdh/l8zqB5CFvlxqwIJ959ruDoENzqVRa8VaBqAtY5m/cybFFIS9e8HkTFt3Iko5GLc27IRo8H2X2VHtIZ+u1HenXkVmlFrAg74rxe8MT2b2MrZJGH2WCfzRtyvB5hixXzJJWfJzJ49ddLjhU74s1AXLa7Mx1lkBGjAqDSVI+YHabeamKTOV3CuSWVn9nMf9/Fs75ehMygUBuI/1VGbmaMQ30x04edSGTz2sqLPK0cStBtx/1kXVpDBjiM4+rXYC6lzBIu5bC3p8//jSl/YmjtfPQbxtzglkd93whAR1/ceCPcZWeG/JHvdZL/XQ2HnoTPotvc584BDWUEiAqHrOyIItpBKMgadquMp3Yfh8wwf+Trf6jyzZu84W4B6nGQgy2qBo7f0eMmaAwTokcpbOJGlkq88eg/PTBXXd6syNCl2wjeEfPISFqMKjzUc5r38Bhx647lUhpyx0UykPjv5HmQiT8JiYrRiXPKRTmVWyd0R8IIcS5tn3luLdDqHtbyxTYbfNp9Ur+MSEiOJSbKGA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5489.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38100700002)(508600001)(122000001)(26005)(54906003)(6506007)(186003)(33656002)(5660300002)(38070700005)(53546011)(110136005)(71200400001)(2906002)(316002)(52536014)(76116006)(8936002)(4326008)(9686003)(66946007)(66556008)(64756008)(66476007)(83380400001)(66446008)(55016002)(7696005)(86362001)(8676002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?iKgmg2KGGq+HXWc5BDCwnhEO9EjGzRUiCOX8VHmmuPHX4du8z8f2tnFEOYVZ?=
 =?us-ascii?Q?U3UQmtVe8lasVJgxdKqVuizwaVPOGnf8voXtH7H/XKm8hFaEC/Hl/SRGiMs4?=
 =?us-ascii?Q?8+W2A+xBhK0IPxghx0/2n0+dYRlePuD1fQGOU1TcNylVwlCuShMc2go7Z9y1?=
 =?us-ascii?Q?NF8RPW0m4VblCZSMpxepsWVbAB4J2kuXhtjCPKMbPTIom3lmqErfvsgjroqh?=
 =?us-ascii?Q?/+Q5DAhPEXEBBMMi0nIDyHv/b32bZqL9MqC4f0nNhfFnlEI82iWjiKXhkaXo?=
 =?us-ascii?Q?ovQwGH7Mic4Mbp9uC6gHfpphtRm2PmlmkvV92Jzz+xWEAy5tKMGpuGEzNQIO?=
 =?us-ascii?Q?zWxyQ4RJp30UPeL/5Li7o6n2ozEL9xrpvNLTA3R2GffYR/JJDedQoNEnCoWs?=
 =?us-ascii?Q?QI/p894/7UMhl7oK3ObG5N2OdPIHKu/sZNKV6XfnV5UET99uc01jc+6/TRpQ?=
 =?us-ascii?Q?UdWhnTslIscS/P78b5hZ5kDp2Kaftc6nE47rUcqgnfC4YMwhzk53st7Ax7cs?=
 =?us-ascii?Q?Nf7XaqYD5fnO0lXaOj+gsaFbUItKaQWglQ7mvMUER80Yqf8i5OAKSLeqOkAN?=
 =?us-ascii?Q?q6zz6WBPzIsz/6iJ9NaDTXvxRaccnZrGea3Ca4Dt6RnRf6o8LPB/xYWEc9qD?=
 =?us-ascii?Q?N6MfvsWqjlEDD2CJTWmZAjTm3arY4CLmAkBzED8NkUrMINgB5CehM2KBxfbM?=
 =?us-ascii?Q?LFjmOdh9GJqxNLgWRaGtcVeYtptKKPobpvmCGhtvsqYBoMHnwqhq4HH+VFlr?=
 =?us-ascii?Q?lgCP2F5gV0lBqfvYdO4rUaVCzor2yV0UKM/45bEpoKWGt4r/XTK/jfEhjeT6?=
 =?us-ascii?Q?oqyzbXSL/xVqS+erano4vry27dQ0NqyrN/JOgdd+Wp6bqbLRBvbAkWZh2yNi?=
 =?us-ascii?Q?/oxNSh0VbyRHaH/T/eaj7l3euIOKgJYlaPBthKUks7YIRJJ37yn7ZggI+ied?=
 =?us-ascii?Q?9iEnwziisi+1vqpXWPas85Z4XVU7Id5hEtczucPDIr0ycYly1d6PEE8saJR7?=
 =?us-ascii?Q?TJBmy+97X5jUET+75kAySXcPN4MN98/A4ezLk2abZzvJptE1fTpVB+jeNe/N?=
 =?us-ascii?Q?ojdsdFkkOdtbeN6zOIJXBdsaCqROADHnARaUKjmcNadbq4wL3Rx0UmW6YWGJ?=
 =?us-ascii?Q?wNFUrclf2oMJFCEfGqAFNWfgG9VZKir5D2Mdu+VrfMvbHWo2QqpzfJmBxkHQ?=
 =?us-ascii?Q?yFAkOK+1c6VVy6GlxqYRNFUi5i0djE/XjbJgmGtBXSqm/RgmCpYmQkRILR+5?=
 =?us-ascii?Q?FKOJ5ryzbAlqaNQQ35iRGbyUz+NRrpDHUm126mffnS3unvpphvfVGrhMejUl?=
 =?us-ascii?Q?fPXpALvIGDUIJa6s/pzHKFaI1JjbSeYro3OJZ15G9u9MgkhIjxMmCxIMweHB?=
 =?us-ascii?Q?cVeGAFm2WmbzlAj3fh7scnvPcffIPrLAc/9Q9Hs0Q77a8j2PLPTE324W/+Ff?=
 =?us-ascii?Q?oPA0IRKrjOU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5489.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 073515b4-428b-45d9-8e85-08d99539a1c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2021 08:55:00.5522 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: waynelin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5425
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

[AMD Official Use Only]

Hi Bhawan,
Just a nitpick below. With that fixed, feel free to add:
Reviewed-by: Wayne Lin <Wayne.Lin@amd.com>

Thanks!

Regards,
Wayne
> -----Original Message-----
> From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
> Sent: Thursday, October 21, 2021 3:47 AM
> To: Zuo, Jerry <Jerry.Zuo@amd.com>; dri-devel@lists.freedesktop.org; lyud=
e@redhat.com
> Cc: Wentland, Harry <Harry.Wentland@amd.com>; Lin, Wayne <Wayne.Lin@amd.c=
om>; Kazlauskas, Nicholas
> <Nicholas.Kazlauskas@amd.com>; Lipski, Mikita <Mikita.Lipski@amd.com>; in=
tel-gfx@lists.freedesktop.org; Lakha, Bhawanpreet
> <Bhawanpreet.Lakha@amd.com>
> Subject: [PATCH 4/4] drm/amd/display: Add DP 2.0 MST DM Support
>
> [Why]
> Add DP2 MST and debugfs support
>
> [How]
> Update the slot info based on the link encoding format
>
> Signed-off-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
> Signed-off-by: Fangzhi Zuo <Jerry.Zuo@amd.com>
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 29 +++++++++++++++++++  =
.../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c |
> 3 ++  .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c |  5 +++-
>  3 files changed, 36 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/=
gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index e56f73e299ef..875425ee91d0 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -10741,6 +10741,8 @@ static int amdgpu_dm_atomic_check(struct drm_devi=
ce *dev,  #if defined(CONFIG_DRM_AMD_DC_DCN)
>       struct dsc_mst_fairness_vars vars[MAX_PIPES];  #endif
> +     struct drm_dp_mst_topology_state *mst_state;
> +     struct drm_dp_mst_topology_mgr *mgr;
>
>       trace_amdgpu_dm_atomic_check_begin(state);
>
> @@ -10948,6 +10950,33 @@ static int amdgpu_dm_atomic_check(struct drm_dev=
ice *dev,
>               lock_and_validation_needed =3D true;
>       }
>
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +     /* set the slot info for each mst_state based on the link encoding =
format */
> +     for_each_new_mst_mgr_in_state(state, mgr, mst_state, i) {
> +             struct amdgpu_dm_connector *aconnector;
> +             struct drm_connector *connector;
> +             struct drm_connector_list_iter iter;
> +             u8 link_coding_cap;
> +
> +             if (!mgr->mst_state )
> +                     continue;
> +
> +             drm_connector_list_iter_begin(dev, &iter);
> +             drm_for_each_connector_iter(connector, &iter) {
> +                     int id =3D connector->index;
> +
> +                     if (id =3D=3D mst_state->mgr->conn_base_id) {
> +                             aconnector =3D to_amdgpu_dm_connector(conne=
ctor);
> +                             link_coding_cap =3D dc_link_dp_mst_decide_l=
ink_encoding_format(aconnector->dc_link);
> +                             drm_dp_mst_update_slots(mst_state, link_cod=
ing_cap);
> +
> +                             break;
> +                     }
> +             }
> +             drm_connector_list_iter_end(&iter);
> +
> +     }
> +#endif
>       /**
>        * Streams and planes are reset when there are changes that affect
>        * bandwidth. Anything that affects bandwidth needs to go through d=
iff --git
> a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/drivers/gpu=
/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> index 9b3ad56607bb..1a68a674913c 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> @@ -294,6 +294,9 @@ static ssize_t dp_link_settings_write(struct file *f,=
 const char __user *buf,
>       case LINK_RATE_RBR2:
>       case LINK_RATE_HIGH2:
>       case LINK_RATE_HIGH3:
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +     case LINK_RATE_UHBR10:
> +#endif
>               break;
>       default:
>               valid_input =3D false;
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> index 6169488e2011..53b5cc7b0679 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> @@ -219,6 +219,7 @@ bool dm_helpers_dp_mst_write_payload_allocation_table=
(
>       struct drm_dp_mst_topology_mgr *mst_mgr;
>       struct drm_dp_mst_port *mst_port;
>       bool ret;
> +     u8 link_coding_cap;
>
>       aconnector =3D (struct amdgpu_dm_connector *)stream->dm_stream_cont=
ext;
>       /* Accessing the connector state is required for vcpi_slots allocat=
ion @@ -238,6 +239,8 @@ bool
> dm_helpers_dp_mst_write_payload_allocation_table(
>
>       mst_port =3D aconnector->port;
>
> +     link_coding_cap =3D
> +dc_link_dp_mst_decide_link_encoding_format(aconnector->dc_link);
> +
>       if (enable) {
>
>               ret =3D drm_dp_mst_allocate_vcpi(mst_mgr, mst_port, @@ -251=
,7 +254,7 @@ bool
> dm_helpers_dp_mst_write_payload_allocation_table(
>       }
>
>       /* It's OK for this to fail */
> -     drm_dp_update_payload_part1(mst_mgr, 1);
> +     drm_dp_update_payload_part1(mst_mgr, (link_coding_cap =3D=3D
> +DP_CAP_ANSI_128B132B) ? 0:1);
I think should have format warning here that we need space between the numb=
er and the colon .
i.e. should be "0 : 1"

>
>       /* mst_mgr->->payloads are VC payload notify MST branch using DPCD =
or
>        * AUX message. The sequence is slot 1-63 allocated sequence for ea=
ch
> --
> 2.25.1


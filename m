Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3CA7294DE
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 11:24:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAF2610E668;
	Fri,  9 Jun 2023 09:24:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAB8010E663;
 Fri,  9 Jun 2023 09:24:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d7IG12wI3CAKW31O+h2/iyvQonFEFnolr91htlmHNmDsuxbXU7TBrP9wWS3YOBDkfNl3JqC2iLnwccJNSKYad0SYE2Lz9Al/l31BEkcxfMje2E9a4qYtfR495AHNivD1wY5RqPNhOQBKXFy5xZevztHWe5R+6sZn2nlVpRhWIGCZU8LmhK7dvsGnPM9l+nxT74aaYdzYziGkUdc2sOS3QDW5w3fGeXFRc0PL39B3RgqZh+PaEIXWQqXTsJkRuGaAkZa1ZnYB3fcV1LR/UhEgX2qBgtET1hx7ufdhLB+mkSkqRiwvYRyiKgGXVyeLd9nx+uvNkVUfffmExhW/LgiL6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JaImqi26Acnlr1pmo/C65LZZ+R5gE4IpXYGRqas6xFM=;
 b=lVvbZ85ubQpmKw5c9xd5DDorVhyNWFRO1KjtLIpJ4Dbf6TSzCZWIzsuX8FAVceWmtmcz4yhdnUFBro8YqEKsDwbFoFvB6fB9YXPaljiz6tFtO8WfAsEr7laZgMS9dCT2E9D5D+mTWXWskQbG0SMQKasLvDILWgy8PhuTT+zhnvBQEHxx/CaYTCyAreaRunLMYPecTytY6BtIfS+pX0+oVSIcLkdbkGJH0ucCvWl3OROD1e3NMJfZwGixz0v3mXaeqKdrptVGGlr0SCWsnu1X2z8xt+SZr+itFPkEyo6EzH+mT86taOdlSglh6LecRYqnuZ8+fuwrP4T6vvLR/eNzpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JaImqi26Acnlr1pmo/C65LZZ+R5gE4IpXYGRqas6xFM=;
 b=eUxJMyvCIu7i3T59/0zu+bhFqUpT+MjGNyxZRha3zbT6SusfcqgkN42YCLXT7GVp6zcV+n2DEuVD0NAKbu3FOvbIKZkq62OjpWNixTL1K0SS57KAVTJB6KbyTNdDqoFJamZeied0VPyIh/tAPI+yg5/Hlpnlcs5369S/lu2YjRc=
Received: from CO6PR12MB5489.namprd12.prod.outlook.com (2603:10b6:303:139::18)
 by SJ0PR12MB5456.namprd12.prod.outlook.com (2603:10b6:a03:3ae::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Fri, 9 Jun
 2023 09:23:59 +0000
Received: from CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::caf0:704b:6692:9932]) by CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::caf0:704b:6692:9932%6]) with mapi id 15.20.6455.030; Fri, 9 Jun 2023
 09:23:58 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
To: Jani Nikula <jani.nikula@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v4] drm/dp_mst: Clear MSG_RDY flag before sending new
 message
Thread-Topic: [PATCH v4] drm/dp_mst: Clear MSG_RDY flag before sending new
 message
Thread-Index: AQHZmf6VHDyJTDyps0ObC1UNCjARGa+A1NIAgADs+HCAAGnjgIAAB/QA
Date: Fri, 9 Jun 2023 09:23:58 +0000
Message-ID: <CO6PR12MB54897396E04D0D2932D3F7BEFC51A@CO6PR12MB5489.namprd12.prod.outlook.com>
References: <20230608114316.3078024-1-Wayne.Lin@amd.com>
 <87a5xarvh9.fsf@intel.com>
 <CO6PR12MB548948F83852B367F228F9A9FC51A@CO6PR12MB5489.namprd12.prod.outlook.com>
 <871qilrp8i.fsf@intel.com>
In-Reply-To: <871qilrp8i.fsf@intel.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=948d3ab0-0f61-4d6f-b49b-0141c8082cd9;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP
 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2023-06-09T09:22:01Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR12MB5489:EE_|SJ0PR12MB5456:EE_
x-ms-office365-filtering-correlation-id: 64d86cf0-e8ff-42d0-31fd-08db68cb414f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Vb6dA7RVRUtXX+/rCUBkGaZ9jyxV+ukUvPgZBF6idXZ7PPvawRpDKAuRojzPWxg9Nf5MlYB34BXcM3I4hrIC+YRGQkEtab6yti7GdLcxUZmy5QjBJIkQGh7K2F4ojcZ25BVTEu252YsYHWE82oBbSjq+vZvRCF88lSUDNHNAOQV8PZnjFkDMHxHIjIIxIZeV2iwUT4/YjsvjkaYyIOMU6vCU47m+cFgyHd1NjZ7YCs0CZXQ/JGmzawqd8HNBqVwOrBUVoc7G9BlXYX96UBA5uHdwFLdjvUWVEMoVBIBb9GvoqLsKQV8PjEXgE0nnLjK2H0DiHyS1UpOfeZtb7h3W9ETeqcIrlxtkt3O1QaUL73063lFSU2oHMnABrkN16n0Wm/o4Bk0wtOJD+wE57BxxwM+2DcKxA62JN5JhnccG5B1ib0AL3KUO1EdNqCLDu1qeNNXcd+uMyLIUF4Fkytegy4iB1IOx0uXRj+xRV9WICdDmvDChioBwE7BUrYOuAH5HSZB7g4F/U4IYhnu/anvLd9vzy/GSCIOLD83bvfKcjQD42Hi/NeSC83CDA9atEZqdY4TTB8sUYIn8K2D8J0btCsxpF+R/Ri4OGrdmd1rkruUqlWJ4W5pZVYwsnrIwsZZU
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5489.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(39860400002)(366004)(346002)(376002)(136003)(451199021)(8936002)(8676002)(38070700005)(2906002)(52536014)(86362001)(5660300002)(15650500001)(41300700001)(54906003)(110136005)(478600001)(122000001)(316002)(38100700002)(64756008)(66446008)(66476007)(66556008)(66946007)(4326008)(76116006)(33656002)(7696005)(55016003)(71200400001)(186003)(83380400001)(6506007)(9686003)(26005)(53546011)(55236004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0fB//SigFGb8jeBDEcmKBZczeCENmTFy2ABYS91ZuAw/Si9FA6wIOgSfRxhY?=
 =?us-ascii?Q?SAkmE21uS43gmzZFztJhVbwg09H+sSJMRYBYn5GFQsRvABANh4uacex7DSob?=
 =?us-ascii?Q?B4TMZLm65DOS2CksO9Rn84T4/gQ18wzpEFbnLOBCxlpMwNx0ahrTKNUxHo0l?=
 =?us-ascii?Q?Vi85xj11WY/OY4Gw3awi+W4ZlDwRlmRq2UsOdYptobXcST4Qwhfx/t35bvDD?=
 =?us-ascii?Q?w76olF6s6k2bYneNRBI8e2zsQ3ABsA7FeiWNWKtQ0P5z/FQgOkA4HArNgHeA?=
 =?us-ascii?Q?5VbsK/4+7wIjFeunPSpI8qT4+9XJciLgtXOOpbsRHKPg+F5rC6Ruuzqcdxvm?=
 =?us-ascii?Q?XyjxHMq+P2gS6X+6UDS46tuNKh9eRJteS91GRbvhBQTcsMhKmfLgDfMBXAUJ?=
 =?us-ascii?Q?l18DHPhsB7L1ZG7D1XIrJduQplghZB2S0NuMFPBLJJsxeyMgJLHJbRFlmS9h?=
 =?us-ascii?Q?NLVYBQexGxkM6ng3idIm64ervpsb/AgsQmyxE7jydHoFL7vK6OSnsV4fz3cI?=
 =?us-ascii?Q?OWd5Tgh+SFz6pphyOM9SHrZtnn/2L8htKvmzB5SYoIuJohs5fh0rF+AOYqXb?=
 =?us-ascii?Q?m+9BBgBpmW1oQIPc+K6aYZmeBihtUqb+VeMVQ1Dq1mZmsQur9IMKt2wE+tP/?=
 =?us-ascii?Q?qHNlWI1Ol7r6FwxKoBcs2ovsG76F9nM5kC60GKGMi71JN/uOmP6Chlu0sb0q?=
 =?us-ascii?Q?bPZKjDjkk1vVnjSI1OdqLW/Y/F5P5HAEYDTM9yYg1YfsgKdicXdL6WvEK/dI?=
 =?us-ascii?Q?E2aQf+ic6QVukYjechkQKHlYDmQykme74xRXoQghi+q9HZIGdxDy1+pmEF8o?=
 =?us-ascii?Q?Fy+F1NTqGbGuNwJcgnIYHkyEk6alnk335RyuBZ6Z6WbBxIzBmjo0scMYe44T?=
 =?us-ascii?Q?guz+6o8YIxncLkr92voTRVjBHjS5p9gQjtY7HdyQUkytl+5GNKVf/yfcxhlN?=
 =?us-ascii?Q?DInUqWzFE4Vo4vnZqh/z3vCi9NxHmFXe07ZpDdLnjbVIc6rbUGu+ZnC5icpE?=
 =?us-ascii?Q?TArkKBRJ3H6O8HSeiyyDeWvhSar0GfuYmO+6uI7KsX7elJXVmk3j7AtNfMr5?=
 =?us-ascii?Q?J+/6E/vozDFebIC08uMRoSK/O4zkj3kXtCYQVr70a09oNXfYMIgA9G39c3QO?=
 =?us-ascii?Q?eB7AjBhYNQlTxHAfCnyYU72Zu6++bf469CNebQdz4Duv8UhErZBS3KATiuAK?=
 =?us-ascii?Q?HhasbyKInkD1QkTRi7zQk2w5uDq17HYtlxA7tZurWzEKM3SAX8nMCCrS4nUa?=
 =?us-ascii?Q?WDFUiDtUa1V18tDQ0LaYekfP69TtvhU3qa6v/BQJIoMNuV+b5CX06tMGNTQY?=
 =?us-ascii?Q?uEMk+GZXTUoCQ6N/glL0Lm67Q82SFHPvsGjOQ4N8Xzf7o90i6MPiqpSj45JI?=
 =?us-ascii?Q?tdlE7oW5dp/xiyfhISmbBY4KzC7Lh4jBgIP/BXE3DzoPNC4Eey0R5hdc6gZD?=
 =?us-ascii?Q?j69DHUXsOCKvYthqRPtzBoMv+MoLZxWZT+HdQH0JfTLcFlAuMWrUTK0UoRhn?=
 =?us-ascii?Q?4MFBZfdw+/kDMQJS2hSnh7FWFZPsnVnNRArLd9WvAzJPln/qug9LPgMdZqU/?=
 =?us-ascii?Q?fOez7D16sz/qM/nUc7E=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5489.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64d86cf0-e8ff-42d0-31fd-08db68cb414f
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2023 09:23:58.6122 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iJvwifrtKZtAoT9GJYn0rINaKlwLckG0NyX/UpyGcvDO4FvrZ2RQMOEKNwB2ZiCi48MEzK50hXNwuud70xtRhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5456
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
Cc: "stable@vger.kernel.org" <stable@vger.kernel.org>, "Zuo,
 Jerry" <Jerry.Zuo@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Public]

> -----Original Message-----
> From: Jani Nikula <jani.nikula@intel.com>
> Sent: Friday, June 9, 2023 4:53 PM
> To: Lin, Wayne <Wayne.Lin@amd.com>; dri-devel@lists.freedesktop.org;
> amd-gfx@lists.freedesktop.org
> Cc: lyude@redhat.com; ville.syrjala@linux.intel.com; imre.deak@intel.com;
> Wentland, Harry <Harry.Wentland@amd.com>; Zuo, Jerry
> <Jerry.Zuo@amd.com>; stable@vger.kernel.org
> Subject: RE: [PATCH v4] drm/dp_mst: Clear MSG_RDY flag before sending new
> message
>
> >> > bool *handled)
> >> > +int drm_dp_mst_hpd_irq_handle_event(struct
> drm_dp_mst_topology_mgr
> >> *mgr, const u8 *esi,
> >> > +                               u8 *ack, bool *handled)
> >> >  {
> >> >     int ret =3D 0;
> >> >     int sc;
> >> > @@ -4078,18 +4089,47 @@ int drm_dp_mst_hpd_irq(struct
> >> drm_dp_mst_topology_mgr *mgr, u8 *esi, bool *handl
> >> >     if (esi[1] & DP_DOWN_REP_MSG_RDY) {
> >> >             ret =3D drm_dp_mst_handle_down_rep(mgr);
> >> >             *handled =3D true;
> >> > +           *ack |=3D DP_DOWN_REP_MSG_RDY;
> >>
> >> My idea was that esi and ack would be the same size buffers, so the
> >> caller wouldn't have to worry where exactly to point ack to.
> >>
> >> I think the asymmetry here is misleading, with ack and esi having to
> >> point at different locations.
> >>
> > Thanks, Jani.
> >
> > But Event status Indicator Files (DPCD 0x2000h ~ 0x21FFH) are not all
> > designed to be ack clear, e.g. esi[0] here. My thought is to be
> > precise about what is handled and what is going to be ack clear.
> > Otherwise, write ack[0] to DPCD 0x2002h is not reasonable.
>
> The point is that you have the same indexes everywhere, even if ack[0] en=
ds
> up being unused.
>
> Handle esi[1] & DP_DOWN_REP_MSG_RDY, set ack[1] |=3D
> DP_DOWN_REP_MSG_RDY.
>
> Similar pattern everywhere, drm core and drivers. The only place that nee=
ds to
> know the difference is where the ack is written back to DPCD.
>
> If we end up adding more helpers for drm core handling ESI, we'll keep
> repeating the same pattern, instead of passing individual u8 acks everywh=
ere,
> with the driver having to figure out what pointers to pass.
>
> BR,
> Jani.
Thanks, Jani.
Will update another version.

Regards,
Wayne
>
>
>
>
> --
> Jani Nikula, Intel Open Source Graphics Center

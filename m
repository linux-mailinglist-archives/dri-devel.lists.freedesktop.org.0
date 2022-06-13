Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA035483C7
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 11:55:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5724710E048;
	Mon, 13 Jun 2022 09:54:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2083.outbound.protection.outlook.com [40.107.243.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4782210E048
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 09:54:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C3cGYV1U/lHXkRXhEeQ6bBKIBWGXtx6goHdyB76UPch2kMR+LEfoO5PyvVtPSyfXxXs0m00Yh6MOujTkjNBCHCDVNRJqXlcANU6oYR6tptXnUlKe6e14PWTxt37087TFNc96SzqLXGqn/B5PYKkoIeUPCSIIVn+zrTNmGX3iYXclWgfZdu0nztmg+y4QeoB5x2ITSDCyUT58+gHwZodzAyJJdyImopp1DHcOXEZRMZq6EWYeRSniRJecMAYNlzbyktNQlBzDsPM4LxEAxfK12geA7KQ9idvFzT6sO4+CxowSPV2QF9wz0c3vG1JuIvTl2N+cPGrO0JdlXwThTDz3yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bq9FoEymI65n/O8j807gDKyOvzR/6pGpXK0o+j4STf4=;
 b=i6PQFhOKIrVQv+fJhvk+mYx4tm0STbtb4jHjE+vrWCZYITe0S7idJ9SqQdYnH+qGhTKVPMg3C8VSBu9F6Qjaga2sfaI5Tc8rqridbvL2qmi+ToRz94QX1T2P+Iai7GZJrNgfyehfctfEsAvHo6QKA9phTawpz+8+n5jZSeh30BBn8l589OBmDnpxa1yFsvFPFfTO8U1hyhMxkkGvyhB9D82G9q/zO7uarp4sG056F+0s90F9ayadRr9SAVLvD9q9Ip9pR7D1GL0NUoDEv9ag4Amlk4AwpueOMRPmXnAqMy5KV3QqG6xjVS6dOLctfLapOcMgwMIXLZU+SESscfMRMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bq9FoEymI65n/O8j807gDKyOvzR/6pGpXK0o+j4STf4=;
 b=zcmIbfdFMpepETlOugVSHbS3oAnhCQw/nVfYjQqOTvdtWrgQY1m8lfBTe4m8hsDY/6HeX4mijkiuHBv3OW01ytNnLAVaQhujhej+ApRXxqNvRu2tfKmivV+Ca89d7p3ECyLh0ctp3fqlv27nRcZQIejDA/U3bPKE1MsPOeL6hDM=
Received: from CO6PR12MB5489.namprd12.prod.outlook.com (10.242.165.178) by
 BN6PR12MB1795.namprd12.prod.outlook.com (10.175.101.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5332.17; Mon, 13 Jun 2022 09:54:53 +0000
Received: from CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::68dc:88ad:eb33:1813]) by CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::68dc:88ad:eb33:1813%7]) with mapi id 15.20.5332.020; Mon, 13 Jun 2022
 09:54:52 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
To: Lyude Paul <lyude@redhat.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 1/3] drm/display/dp_mst: Don't validate port refs in
 drm_dp_check_and_send_link_address()
Thread-Topic: [PATCH 1/3] drm/display/dp_mst: Don't validate port refs in
 drm_dp_check_and_send_link_address()
Thread-Index: AQHYdr3zoWQclpOJ6kGx3BfvKy4BF61NJ7kw
Date: Mon, 13 Jun 2022 09:54:52 +0000
Message-ID: <CO6PR12MB5489E9906D3A0E81E01663B5FCAB9@CO6PR12MB5489.namprd12.prod.outlook.com>
References: <20220602201757.30431-1-lyude@redhat.com>
 <20220602201757.30431-2-lyude@redhat.com>
In-Reply-To: <20220602201757.30431-2-lyude@redhat.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2022-06-13T09:54:50Z; 
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=684f895c-fc5c-4c9b-a812-87c376020b94;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dc960a5e-ed32-4759-ce99-08da4d22c34f
x-ms-traffictypediagnostic: BN6PR12MB1795:EE_
x-microsoft-antispam-prvs: <BN6PR12MB17956CC603CFF687D00E5E03FCAB9@BN6PR12MB1795.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Fg034IXWi2p9ED9kalXTnzLmiPaI6MlD5CHECOH3kaaYj/SIuyy06aQwcceLaRR9X3QA0PYEYz2azvOanGetXchPSrRKkJapHsENh1+wsu8j7yDL9p2mQQV1EzkZF4al2Q3P0dwUwQjFR0FaSbsaqvg8mL2W3fPDwHvMEh2Qa+6WYu5mOLEQlRWW08tulBwy7T98faLKGe+y9ac241rO767iLLuU5W1LL9O46CZzyGe8ZLS+MfpDjAH+pAIL23zoxowUeehiVkOv6m6C3JFvkuLe0VRL1l0ilNXtQZSd/kMRr/iHcXeGgLLEa2Bh3DSRb6ETCnn/jLcdiMv50kyNkhn12hNnS5/WuNloEVLYTD8Qo1muAdi0iwkQ7TWv5bHZBoI/7tf+8CMdqpkmp9kvMsmENW/y5s4aRGLDENf9Oovk5K1Dt0/wga3EAfQsw/Np335GMrVHAhBEehQH2t7kpK/+j+5lEueOwZ0IXWlYu4yCPO4kFh6/PvGw954nTV931PtKtfjzLZbCxK9aoCL2QjwOLk20Wz7owKXOQibFLvikUAk9bIAW4cSAukE1XpM4ej2G4Y66NWQTp3C97JNqZhz6Kkg1B5LQoF0HIozlXxpGqbBtRB9FyIkEWEjAo0FRIoJXhJtSbx4E/FDtocFAtoYAohbJZUAHBjQgnZqBrK0jNjYWZFyxjCwEzjBi8WaKg4vOyUek0xz4pjoLiZmr5g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5489.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(2906002)(66946007)(508600001)(52536014)(8676002)(66446008)(66556008)(64756008)(55016003)(4326008)(66476007)(15650500001)(86362001)(316002)(53546011)(7696005)(9686003)(26005)(76116006)(6506007)(54906003)(110136005)(71200400001)(38100700002)(33656002)(83380400001)(186003)(8936002)(122000001)(5660300002)(38070700005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?P/oU54dYsG27GzqooZe8ed6XmmMRoTg+447b5jRkljY3R996dYQMyb2+P87B?=
 =?us-ascii?Q?oDXBS5KIJ81OBCl590TFJ/3OH9NdVjtsTm3P5wbrFCaVqetlNifjRuASX3/e?=
 =?us-ascii?Q?NvA8TW7OglDghD6eH+LkqXeGFm9MFpIdjtG4q0nXXrQFeRUHZb7Z4jmhCXe1?=
 =?us-ascii?Q?rJVSOUGavGgw64SVTHaDqF59m5vq0OMon9Jlub5iJ0RcgxWDaA/+kvaKZf7R?=
 =?us-ascii?Q?+OjJ0nXMjp8zzdo2UgF6vTznL0KEMs+JapoGg7TuxUor5BOCrR/YLytDTXWh?=
 =?us-ascii?Q?tAUZncz+2NeEvfAb3nrtZjYQkqgGFr7KZGPgtMMNWGYd2VVfCzSE+P0oUqrp?=
 =?us-ascii?Q?wPwU8V855taCfC1kZi/poNyay3RmbEsyeHAZLaFgs73ZAk1BXoivt6jHuwfp?=
 =?us-ascii?Q?6bcUZHkAbgHZ5LIL2mxuyWHSHe2XH2Twu0VYBzYqgpO+5VgFZWPATXkoCFJZ?=
 =?us-ascii?Q?ZN4AzGLBpvGX7Lvdd0LOOFDNvY4oEq7lPIvn3Ddh3tBvzqle+fXN83d2jXH3?=
 =?us-ascii?Q?Erwsa4iOAdXxajt4bu+QfeXHCOrBzp15SdESNO3GBlEYyYugN4K4bWp1UB+n?=
 =?us-ascii?Q?h0zKwNSLthxZh5mhW+1/Eb6iPWD8RzXRvyBJdtOIUR56jXBHgDl40gmQIP0s?=
 =?us-ascii?Q?+83YXzHpRtbIvRFyHlYDAaUsd8X1GX4QE0mTFWTxER/dt4OVauLV33Qkwy8h?=
 =?us-ascii?Q?rE7BmaKiKqOn6mOsRCr7JbwMlM3oK7So4/QwAA1yerY610N3RmMdCis+AuTf?=
 =?us-ascii?Q?/QDM5TfHMBae5qHXoboG/y8SHrPhU44PySPT88NvunWEci/1d2Qlx262LYCi?=
 =?us-ascii?Q?vzGqLlHrmKJ+5fEkRwST4VPvluELTFsJDqSV45WyuId+dODk3yopd8ipU5kj?=
 =?us-ascii?Q?hsFWT64TK9nzzqJs+XVKMPGwufWKARYp8fYetqIUQrEcScAVadw8J5fLaBu/?=
 =?us-ascii?Q?lT6+HNKiQaXZ5ZGmyun5sNm3dkCt+bHHVgTQh1HWB76ajEe6WslXV1P3MfoO?=
 =?us-ascii?Q?kkyZ5zT0DpbTxDyD8Pbo8+NmcSVnt+IDgOkx/xo4a/m8J2oXCUWJXQU2HAQ9?=
 =?us-ascii?Q?OZT6VX5wOl7h7ULYTvq5NHxUvl1bNzdrvzdkk5s8Z1ENRwUIeVMaZRBQ9QyR?=
 =?us-ascii?Q?8RQza7zQm1VpkRBuMVWz00hQ7n61Og4ODyGbbZXFc+2PJNOxV47jPbHRqr1l?=
 =?us-ascii?Q?WXQ67ad7RGBQrCEHw3LAzs6y+5h6yxruLBb2RB5xFl6N0a/uu4cBtd9NhUyz?=
 =?us-ascii?Q?4/FOsf/OEdAnN2oUZXXcojfOuErjBE7qLDuWZ1bVdRExuJ2C9Tb5kxZhjDT5?=
 =?us-ascii?Q?w+h9DddquG1LFHxTX4cMCMv3bxryPtp1eBB201+oq8NAtS8PJTxzPrWI8lhI?=
 =?us-ascii?Q?hlvWs7J2QnWg8jeNuj5mvUIA7CC+2mSbiOlAEBeRTiSJ4doyVYsGT5oNCC4i?=
 =?us-ascii?Q?pkdPrdeeep/N6u7WeC+cD9WrfTGnKBOCAa7/RURMyKK1uaZPDNza3u/gFzEV?=
 =?us-ascii?Q?vuhTaPzcNHad6x78kY7SnFnR0FKaGiVFlESafEhUe1SlJiWHAaqIA6CNTItm?=
 =?us-ascii?Q?Lwt87uzUXkZuf76ryM0s9NwbbnMna4I4NRlmWwxwoPujsWcyHt6qXZTxiSb+?=
 =?us-ascii?Q?A7lQL/I3ew4j4+0UIiR1oaybN+m0a6JoRpqbkhqZFlww+zMDZ7ueaiAa3Dco?=
 =?us-ascii?Q?s6/U+Iy+7vjgFd44IjjlsAMSgF/e8lutRpPwOIXL7B+HXpbUsyzoQw7nRwJF?=
 =?us-ascii?Q?dZCTK0+lNA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5489.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc960a5e-ed32-4759-ce99-08da4d22c34f
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2022 09:54:52.7047 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2pbXwx4vYAnsqVMFketfli0qG0ehDe79dxGrI97MJrz5cNVog5ahL7WwkbuL4YsD12Civ6sffeJ1Z1dyMU2pPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1795
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 Jani Nikula <jani.nikula@intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 "Lakha, Bhawanpreet" <Bhawanpreet.Lakha@amd.com>,
 Rajkumar Subbiah <rsubbia@codeaurora.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Public]

Thanks, Lyude.

Feel free to add
Reviewed-by: Wayne Lin <Wayne.Lin@amd.com>

> -----Original Message-----
> From: Lyude Paul <lyude@redhat.com>
> Sent: Friday, June 3, 2022 4:18 AM
> To: dri-devel@lists.freedesktop.org
> Cc: David Airlie <airlied@linux.ie>; Daniel Vetter <daniel@ffwll.ch>; Tho=
mas
> Zimmermann <tzimmermann@suse.de>; Lin, Wayne
> <Wayne.Lin@amd.com>; Jani Nikula <jani.nikula@intel.com>; Lakha,
> Bhawanpreet <Bhawanpreet.Lakha@amd.com>; Rajkumar Subbiah
> <rsubbia@codeaurora.org>; open list <linux-kernel@vger.kernel.org>
> Subject: [PATCH 1/3] drm/display/dp_mst: Don't validate port refs in
> drm_dp_check_and_send_link_address()
>=20
> Drive-by cleanup, we don't need to validate the port references here as w=
e
> already previously went through the effort of refactoring things such tha=
t
> we're guaranteed to be able to access ->mstb and ->port safely from
> drm_dp_check_and_send_link_address(), since the only two places in the
> codebase that drop an MST reference in such a way that it would remove it
> from the topology are both protected under probe_lock.
>=20
> Thanks for that, past Lyude!
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  drivers/gpu/drm/display/drm_dp_mst_topology.c | 22 +++++--------------
>  1 file changed, 6 insertions(+), 16 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> index 67b3b9697da7..d84673b3294b 100644
> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> @@ -2666,24 +2666,14 @@ static int
> drm_dp_check_and_send_link_address(struct drm_dp_mst_topology_mgr
> *mg
>  	}
>=20
>  	list_for_each_entry(port, &mstb->ports, next) {
> -		struct drm_dp_mst_branch *mstb_child =3D NULL;
> -
> -		if (port->input || !port->ddps)
> +		if (port->input || !port->ddps || !port->mstb)
>  			continue;
>=20
> -		if (port->mstb)
> -			mstb_child =3D
> drm_dp_mst_topology_get_mstb_validated(
> -			    mgr, port->mstb);
> -
> -		if (mstb_child) {
> -			ret =3D drm_dp_check_and_send_link_address(mgr,
> -								 mstb_child);
> -			drm_dp_mst_topology_put_mstb(mstb_child);
> -			if (ret =3D=3D 1)
> -				changed =3D true;
> -			else if (ret < 0)
> -				return ret;
> -		}
> +		ret =3D drm_dp_check_and_send_link_address(mgr, port-
> >mstb);
> +		if (ret =3D=3D 1)
> +			changed =3D true;
> +		else if (ret < 0)
> +			return ret;
>  	}
>=20
>  	return changed;
> --
> 2.35.3

--
Regards,
Wayne

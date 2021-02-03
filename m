Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3671F30D1D1
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 03:56:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3E666E25A;
	Wed,  3 Feb 2021 02:56:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2042.outbound.protection.outlook.com [40.107.244.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43AE86E25A
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 02:56:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jLyPqKWX1lc9UeX2q5+yJKGDQtYfPEO8kO+zSs3HqUjjfHoQ0zAjOQkZ9zHYU8jk89U5bzzubidyGe7Vw+FAW4nAug7eBFC9MWHrTaFsTs/ja1sunQbxjMulgtFGImCNMTu7RQSnx44TeeJt8nBZ5moO1dCO8osZ66Hjf4nj9RZMRGLbbDVXzrAPogKrAwBu1/8S3wrQAnhqbyizRuDpHykyz48gyzM3P11PIxV9f83VpqzJdugWV/aGzFH5I9xbPwSyLw4QlfYP5ee6Y3sfHz5UBumrZ2Yv+6o1H7fxrYVH9/7kQaszGz9/RighFdc4oS/xHFDt1in/v/mYObTWzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ZxV7li05rpxDODB6d7gMwtOMy/9gprQijE2kC5/gfY=;
 b=nBx9b9inJ0UM1ZlwsBNzd8mjyD8v3RRHM6XhzRZfsIiD6dME3l7G0tlsb7IFGPL9SEASFGxU3qhc/x00MupyCp6ioJbqJIjav1TjKeaCqlBLTZflw0ILs7HxqSw5QLXQHfGVq47+znEIzgb1le0SQ2o6FEdzdyAvbul02FuhpFb4IjizeH6lqVY+qnRQ01OTKSzEvWcHXENw4TSe0e1G2nM+wM8JRAxnIpR8loluGVqqJ+IwHZ5QyW+kAhHMNyhHGzZ/CsfcaL3Ror7u2EYHoNRNSHEK0nM51h6oX/JVZwFS4IC4R9cmdRZpWOYtjkdkoX3UBHXQMNdll/tjGC4upQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ZxV7li05rpxDODB6d7gMwtOMy/9gprQijE2kC5/gfY=;
 b=2nCy74vQDuS/2bjWqTVJA9X1EXqWPmTvGtQFktzN/wsTmo5wK4w/Cj/oYXN5cjN9XTwUyX3D+GyqfVdNciB/7dXnTvyN/fYtis/FIPmwnKFXbSgJh6dfEGP+JsxOSdB4+wLjLnnklIpySaBn3/iZebYhyBjdSwFcMB3i19gKKSA=
Received: from BN8PR12MB4770.namprd12.prod.outlook.com (2603:10b6:408:a1::30)
 by BN8PR12MB3218.namprd12.prod.outlook.com (2603:10b6:408:6b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.23; Wed, 3 Feb
 2021 02:56:32 +0000
Received: from BN8PR12MB4770.namprd12.prod.outlook.com
 ([fe80::7426:d23d:284:bf8c]) by BN8PR12MB4770.namprd12.prod.outlook.com
 ([fe80::7426:d23d:284:bf8c%3]) with mapi id 15.20.3805.027; Wed, 3 Feb 2021
 02:56:32 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
To: "imre.deak@intel.com" <imre.deak@intel.com>
Subject: RE: [PATCH 2/4] drm/dp_mst: Don't cache EDIDs for physical ports
Thread-Topic: [PATCH 2/4] drm/dp_mst: Don't cache EDIDs for physical ports
Thread-Index: AQHW+JIM7RffgkuJZkqsvkVFYOgUoapENbCAgACEc4CAAQSlEA==
Date: Wed, 3 Feb 2021 02:56:31 +0000
Message-ID: <BN8PR12MB47701F3962FD9BE47FA4F3A1FCB49@BN8PR12MB4770.namprd12.prod.outlook.com>
References: <20210201120145.350258-1-imre.deak@intel.com>
 <20210201120145.350258-2-imre.deak@intel.com>
 <BN8PR12MB4770A088BA001258FCDE973AFCB59@BN8PR12MB4770.namprd12.prod.outlook.com>
 <20210202112207.GA494606@ideak-desk.fi.intel.com>
In-Reply-To: <20210202112207.GA494606@ideak-desk.fi.intel.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ActionId=c68ca1df-f89b-49fc-b6f4-77e41e13a1b3;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=0;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=true;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal
 Use Only - Unrestricted;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2021-02-03T02:54:59Z;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [218.166.240.186]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 2e9faf9e-9b87-4562-539a-08d8c7ef4fb1
x-ms-traffictypediagnostic: BN8PR12MB3218:
x-microsoft-antispam-prvs: <BN8PR12MB321839349926683CF0765AFFFCB49@BN8PR12MB3218.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 02dR5FzFXk7KvardTPmh8bAPfRFgjtiYQrHGe76zUSexQn7hnpHnwrkjcRYEw/Oaxu17IWe5mJAZiqyRZldDe1nOIHWjijn7lOdKIgpN4qF4oM2F4byZ9UHdQwTl9B80GzoOKstkO80PfgaiTdfVk0qEN/d0zhl9E/uRLuzVtwrYFjddi7LoM54plg1i4U25m3LQT9ZpR19FURq8MlV/FH1qDFSBdD4TDdc+2/ULkBdxpv36JylucTKYHMEu8vjOSNE399ZuZgLjYGRvsYjY2/1fJsUiB7acVcvdVOTL4wKkeXuQxaaqw/OemQ9Zg/UdZD7tQWKSHg/VJVPR41N9e2D3OgpPwQhojKEznGKKpTrFYCzJf2vsUKf0P+RSWfBohfOXpmutT900h8ppzQ5vIYuVEi0JQA6lg1NKwHossqgT9x4iD60F8dvSim7n8OvkAQmywsNlxRYJRKpY59RwL5uX86fCcBP4PRCVGy49JOPwK5uiY8XUVU7eFkzJqAhCWA0C6WNFIZm9PbWAgWeOOg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB4770.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(39860400002)(136003)(346002)(376002)(54906003)(5660300002)(66946007)(53546011)(6916009)(6506007)(316002)(7696005)(71200400001)(83380400001)(186003)(26005)(76116006)(66476007)(478600001)(9686003)(52536014)(2906002)(33656002)(4326008)(8676002)(86362001)(66556008)(55016002)(66446008)(64756008)(8936002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?O2rQyHJvbyXzjmg4Nxc08+CTK9KBc716x6G6uWY9Dy1e3s0JeRmS/eOYsJWa?=
 =?us-ascii?Q?na7ZYDajh4bBWVN3+Y22/eiNmi6gZGWx75FYqWdCJZ5zQsiOE+8n8EvyR9Bm?=
 =?us-ascii?Q?nxiau3Q7fqrvhBjTUVZ6q3CMkZ1w6EG6Gz2UFjGOvTM0Uvfh4yU9amkBfMjC?=
 =?us-ascii?Q?nsmw2cbVohvM40zsenReTDkfy8WcODVsPv1OY3r0EQZutbBiqi7mSIJQJnPF?=
 =?us-ascii?Q?+Ymz76vwTYLR1yQBip4pLQNKg3Ap5nq7m5iIEWsgv4KpfzjrVDL8J50Zi46a?=
 =?us-ascii?Q?XbHVIbBDgdYYhzAMPIM5pLDpN+NnugAS7PNdQLV7JX+E3Z5Ssopgk8dQ2wRi?=
 =?us-ascii?Q?QZOE9TLGJevmmeh9lJ7nXjd+5iujYs/fWjBmqtOuOdT36zxGm+2WuSJivlBo?=
 =?us-ascii?Q?Qh/a0f3PX2G1VqWyPamjDTUaFMA+0syuG7jsFCIWc0p8/hnfU/73fExZSljf?=
 =?us-ascii?Q?BC3i74SdHucVc92vDXTRQ7EQf2GBIiF5/2EBaXauG5iUsnprpPEPy7DTCrcL?=
 =?us-ascii?Q?JQkoRIWfx9GovLi+WOgESr+J99iCGQ+EY006uaQeTRMngvew+yXP81A/Wcx3?=
 =?us-ascii?Q?QYsA6k17LblzO8VC5njbcqLQxkUWYSXhrD4nwzonJstnMYphgbUwW9shBPcD?=
 =?us-ascii?Q?S3xIfpqmJoSFHSLybiA4Du1wQyFYeiccEj0ORl1YK4+PGveWTfyS7725MCqG?=
 =?us-ascii?Q?/dbQ30RMzARtoIsmOQ+uW99dzfdcPuxdhheODWUzN3IzM/+Lhw3MhAxwvUDZ?=
 =?us-ascii?Q?5f3hNeBjlooHuFh0+gFxetJhnHK9QYstrW72J8jemzt3uxp5bmexaexWlAZ1?=
 =?us-ascii?Q?+rNCydZT3CLDVriqf5joAtPpNogOA6nk3+6evOxVbGWA7n8tn3lqsromFFFF?=
 =?us-ascii?Q?U/ccVi59HvRlBDV+FH6wP3akrWSq0gbb4i459fsAy4K2VmmFmwQluEfwcZzp?=
 =?us-ascii?Q?t8ewVLUdZTD2G1ylmV24PEBfDEQCXzgmur5xQwlmiqctMEYe4H/DtIzDfShR?=
 =?us-ascii?Q?iLoAFSsfRjPfw+lPrObsjAW/59h4b7/NCDowU7utkTcuqE0XSyeG1bBxMoAg?=
 =?us-ascii?Q?bRVMxcuZ?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB4770.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e9faf9e-9b87-4562-539a-08d8c7ef4fb1
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2021 02:56:31.9868 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rOVqtk2GrPBZTsR8oFvWcZIdstTP2yHTc0UUbFyBF/U7Hd2TnzrLGOdBPpgugla3Mx0Aovb2BzOxjUITGBJ8jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3218
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only - Internal Distribution Only]

> -----Original Message-----
> From: Imre Deak <imre.deak@intel.com>
> Sent: Tuesday, February 2, 2021 7:22 PM
> To: Lin, Wayne <Wayne.Lin@amd.com>
> Cc: dri-devel@lists.freedesktop.org; Lyude Paul <lyude@redhat.com>
> Subject: Re: [PATCH 2/4] drm/dp_mst: Don't cache EDIDs for physical ports
>
> On Tue, Feb 02, 2021 at 03:38:16AM +0000, Lin, Wayne wrote:
> > [AMD Public Use]
> >
> > > -----Original Message-----
> > > From: Imre Deak <imre.deak@intel.com>
> > > Sent: Monday, February 1, 2021 8:02 PM
> > > To: dri-devel@lists.freedesktop.org
> > > Cc: Lin, Wayne <Wayne.Lin@amd.com>; Lyude Paul <lyude@redhat.com>
> > > Subject: [PATCH 2/4] drm/dp_mst: Don't cache EDIDs for physical
> > > ports
> > >
> > > Caching EDIDs for physical ports prevents updating the EDID if a
> > > port gets reconnected via a Connection Status Notification message, fix this.
> > >
> > > Fixes: db1a07956968 ("drm/dp_mst: Handle SST-only branch device
> > > case")
> > > Cc: Wayne Lin <Wayne.Lin@amd.com>
> > > Cc: Lyude Paul <lyude@redhat.com>
> > > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > > ---
> > >  drivers/gpu/drm/drm_dp_mst_topology.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
> > > b/drivers/gpu/drm/drm_dp_mst_topology.c
> > > index deb7995f42fa..309afe61afdd 100644
> > > --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> > > +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> > > @@ -2302,7 +2302,8 @@ drm_dp_mst_port_add_connector(struct
> > > drm_dp_mst_branch *mstb,  }
> > >
> > >  if (port->pdt != DP_PEER_DEVICE_NONE &&
> > > -    drm_dp_mst_is_end_device(port->pdt, port->mcs)) {
> > > +    drm_dp_mst_is_end_device(port->pdt, port->mcs) &&
> > > +    port->port_num >= DP_MST_LOGICAL_PORT_0) {
> > Hi Imre Deak,
> >
> > Thanks for the patch!
> > Just curious that you mean we don't want to fetch the EDID of the sst
> > monitor like below case?
> >
> >     Src->MST device ->SST monitor
>
> The intention of the mst cached_edid logic is to cache the EDID for logical ports where the EDID cannot change anyway. The EDID on
> physical ports is fetched during connector probing just as for any other connector.
>
> > I thought we still need to get the EDID even the monitor is connected
> > to the physical output port of mst device.
>
> For sinks attached to phyisical ports we get the EDID whenever probing the corresponding connector.
>
> > Maybe what we should fix here is why the EDID is not get updated once
> > reconnected via CSN message?
>
> This patch fixes the problem that we stopped updating the EDID for physical connectors. After this change it will get updated when
> probing such connectors.
>
Appreciate for the explanation.
Thanks!
> > Thanks!
> > >  port->cached_edid = drm_get_edid(port->connector,
> > >   &port->aux.ddc);
> > >  drm_connector_set_tile_property(port->connector);
> > > --
> > > 2.25.1
> > Regards,
> > Wayne Lin
Regards,
Wayne Lin
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

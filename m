Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA3413B7D6
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2020 03:40:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D9E1891CE;
	Wed, 15 Jan 2020 02:40:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2088.outbound.protection.outlook.com [40.107.237.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 014D9891CE;
 Wed, 15 Jan 2020 02:40:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a+dzjIAmPNtmvzIE+5MCGy1Ib0hvtKBCnQMbU9c8EQnPESvIaNTbPV/wlpKcGq5cizDAR5zm5DvvBx0R/dTY1W1jSGEBrlJRFOm6K1/FgcsUkeBrSPxxt8OQkFBhtfouZWpXVX6XdOcn2gMB+wLnT0+v04e7imNinjkfODC/+3Ablwv3wKISlbUozHyMO2TInkiuZyxBPRDgU0OXDTnSUmAR483Ye4N/zgmKQLsdgo7xkCUo7Wg39pH54l0iU9IcsAD9fBy8SpgoXu7tsytVlEQTchzZqlP8T5xbbzmrlSL//kqUopat7gvsX0qg7YrX6nRiuKgyS7STfkt+1RitVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6vw6WTSNnXw+EJKLY8mE6y82l79u3+RUXNndtDtxulM=;
 b=QRrQHmwwqv/dvnp4hXEmWlElGhi0DwPGOczFzY1kwWU1w25BP4U/IqIvFkF5Y86Gi+IPVKAduOobLkSM3dgSPLfcIGTvMo5bRQu1RqHRRTnNxk3KUpy56my7ujXOXYHB5XuZBMHeVBY/sbBE8flZvLpO46gw91nrGlWTkAXnzUjlNqfgmabkmN8xPwjJmFJwCJL2FDuy9oWwhJ4RCEwMBZq6ZWGaOPev+gvMO9R+2tHrFV/EQOcXzSAlesCWV2Yu0QEEWUz+dXBNkg0D+MBsmGSGc9cK4qPJ/+hrE1nVnTf4TIJ55yq1uXFBHGe0D1b4XRaKxeGBBkQ4jgIEt8E70Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6vw6WTSNnXw+EJKLY8mE6y82l79u3+RUXNndtDtxulM=;
 b=dlUJl1TOKX/bAv5P0f+x9XuR80IBrXSLKMpX82URufOeB5DMxv1pSPI4q/ijvaNxgnytP7WZTIvnDPi65OLgxoT06/aj37chNbXletvu0wrPzhUgnCDvC/Xdilme8HMPr8WUCi9yJF72e7QEImnhROv0whhBfJGsLt0YzlwBoFQ=
Received: from DM6PR12MB4137.namprd12.prod.outlook.com (10.141.186.21) by
 DM6PR12MB3659.namprd12.prod.outlook.com (10.255.76.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.9; Wed, 15 Jan 2020 02:40:26 +0000
Received: from DM6PR12MB4137.namprd12.prod.outlook.com
 ([fe80::cd1d:def3:d2df:3882]) by DM6PR12MB4137.namprd12.prod.outlook.com
 ([fe80::cd1d:def3:d2df:3882%7]) with mapi id 15.20.2644.015; Wed, 15 Jan 2020
 02:40:26 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
To: Lyude Paul <lyude@redhat.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 1/2] drm/dp_mst: Add a function to determine the mst end
 device
Thread-Topic: [PATCH 1/2] drm/dp_mst: Add a function to determine the mst end
 device
Thread-Index: AQHVxf/7ktN/4D76nUmiuLJ8r0I7Lqfqs5UAgABY5iA=
Date: Wed, 15 Jan 2020 02:40:26 +0000
Message-ID: <DM6PR12MB413739E4A78C2E8A08134249FC370@DM6PR12MB4137.namprd12.prod.outlook.com>
References: <20200108084416.6296-1-Wayne.Lin@amd.com>
 <20200108084416.6296-2-Wayne.Lin@amd.com>
 <e9312adec3c177cd70a4c65d60bbc291ac9d8fb6.camel@redhat.com>
In-Reply-To: <e9312adec3c177cd70a4c65d60bbc291ac9d8fb6.camel@redhat.com>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Enabled=true;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SetDate=2020-01-15T02:34:15Z; 
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Method=Privileged;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Name=Public_0;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ActionId=a6a37699-26d8-4eaa-9499-0000764b165b;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ContentBits=1
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_enabled: true
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_setdate: 2020-01-15T02:40:23Z
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_method: Privileged
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_name: Public_0
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_actionid: 91cb6eb7-9053-4e8a-b535-0000db69c68c
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_contentbits: 0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Wayne.Lin@amd.com; 
x-originating-ip: [165.204.68.36]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3978c252-92a6-4a7e-3e11-08d79964472e
x-ms-traffictypediagnostic: DM6PR12MB3659:|DM6PR12MB3659:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB3659636A6677A8C879693460FC370@DM6PR12MB3659.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 02830F0362
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(366004)(136003)(39860400002)(396003)(199004)(189003)(66446008)(7696005)(6506007)(55016002)(64756008)(76116006)(53546011)(186003)(66946007)(66476007)(33656002)(86362001)(26005)(478600001)(9686003)(4326008)(8936002)(110136005)(52536014)(316002)(8676002)(5660300002)(66556008)(2906002)(71200400001)(81156014)(54906003)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3659;
 H:DM6PR12MB4137.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ghtez9n8WkGSfeR0VAs0Wz6RTX5ABRq45A0PozrQTSQ1LYYDqmXteO4OdcVTgqNdt4CO4iynsvj/pGiEEQ1ZLwk7f8tJP0VTg5oK/qN8LL4G5Z+bdTCLXfdEdLs1XZ+O2nNTeyha6PYaKWZBUfq7ayxpJw0UrcnAq1FANZzcPDYayI+HOYM5Df/S6Xxsh+NKMYQeuFjLlGKcnwTyVp/bwJI7tUJpGBqOBcgmEdlCINNsqdBPn+447JLcjZI+r+WdlQKoZCIU6h1fzX744HSNfhSX5IAQeQGc/64TONlaQAOZzVSkdmEIJ4dxU9K3xixE7TSsRCNouRJENcZS7aSBVYMZXtL31GIyqVWHFDoGyPwVN6HFR91/Af8Vm3h0VAQxHtYG2Xd64NzpCbEujGFOJXLnxQJJm1yg8S+tok9Cjt6v0EMjXqnHA8lrE+7wuamq
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3978c252-92a6-4a7e-3e11-08d79964472e
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2020 02:40:26.4892 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DnUGp11pialz/jUT00kwl7TcrAUfZbQWR2QddzFPOyS4/35ZJXd8OZqaWE6a5w6nSGYxmSlVRBCOYDjVVvRPMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3659
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
Cc: "Zuo, Jerry" <Jerry.Zuo@amd.com>, "Kazlauskas,
 Nicholas" <Nicholas.Kazlauskas@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Public Use]



> -----Original Message-----
> From: Lyude Paul <lyude@redhat.com>
> Sent: Wednesday, January 15, 2020 5:16 AM
> To: Lin, Wayne <Wayne.Lin@amd.com>; dri-devel@lists.freedesktop.org;
> amd-gfx@lists.freedesktop.org
> Cc: Kazlauskas, Nicholas <Nicholas.Kazlauskas@amd.com>; Wentland, Harry
> <Harry.Wentland@amd.com>; Zuo, Jerry <Jerry.Zuo@amd.com>
> Subject: Re: [PATCH 1/2] drm/dp_mst: Add a function to determine the mst end
> device
> 
> This patch series looks awesome so far, thank you for the great work! This
> patch looks great, I think we should just squash it into the next patch though
> since we don't use this function until then.
> 
Thanks for your time.
I will squash it in the new version.

> On Wed, 2020-01-08 at 16:44 +0800, Wayne Lin wrote:
> > [Why]
> > For later usage convenience, add the function
> > drm_dp_mst_is_dp_mst_end_device() to decide whether a peer device
> > connected to a DFP is mst end device. Which also indicates if the peer
> > device is capable of handling message or not.
> >
> > Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
> > ---
> >  drivers/gpu/drm/drm_dp_mst_topology.c | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
> > b/drivers/gpu/drm/drm_dp_mst_topology.c
> > index eebf325d7f48..8f54b241db08 100644
> > --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> > +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> > @@ -1918,6 +1918,22 @@ static u8 drm_dp_calculate_rad(struct
> > drm_dp_mst_port *port,
> >  	return parent_lct + 1;
> >  }
> >
> > +static bool drm_dp_mst_is_dp_mst_end_device(u8 pdt, bool mcs) {
> > +	switch (pdt) {
> > +	case DP_PEER_DEVICE_DP_LEGACY_CONV:
> > +	case DP_PEER_DEVICE_SST_SINK:
> > +		return true;
> > +	case DP_PEER_DEVICE_MST_BRANCHING:
> > +		/* For sst branch device */
> > +		if (!mcs)
> > +			return true;
> > +
> > +		return false;
> > +	}
> > +	return true;
> > +}
> > +
> >  static int drm_dp_port_set_pdt(struct drm_dp_mst_port *port, u8
> > new_pdt)  {
> >  	struct drm_dp_mst_topology_mgr *mgr = port->mgr;
> --
> Cheers,
> 	Lyude Paul
--
Best regards,
Wayne Lin
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

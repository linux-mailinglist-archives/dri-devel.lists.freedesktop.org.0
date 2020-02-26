Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C46A1702DA
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 16:42:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BC316EA94;
	Wed, 26 Feb 2020 15:42:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2081.outbound.protection.outlook.com [40.107.223.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7A8C6EA8F;
 Wed, 26 Feb 2020 15:42:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oFM2wpKNoiGPXDROSc0uMkAAGPXlcfqje5J1baQkc2CCB9AQmwwC3cgKnAvjjAPk+IJME5PRpjFrCZlCzufIuBMukiJ9tFlMaiDfsCXOX3LCWifiX8FRRqjB5u7EZUR+BRLWwQfPuuEWh6sSEu/D+tt8KFWu7gO3HYnov+W3lAqKN/q+RVOZ5dS0gF0XxqN1aDvs1L4RKcjaoAO1908Nz4b4n34vq9biQhv382pSbv6Y1z2c0o6irjrzE/0Z808tILBnfaE/RQzeSs6pQXOXbSwfvLJiu+vyfxVJaxSytLP8ngbJzkDVav6y6NYumDR/UfD3wrhnQVKmK+6Mvgydmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nd7VilfmPQjlzpe4/hiiAnFY6Jz7kIGKzKJ7XPUGUNg=;
 b=fyvbD29lhgIBk6Z+YzEnhAhjamwgOhtEFUduUPjFhZ8q7kFU7vn4V0zxGNtadrugAbgJZW/Zjdv8cOHFEQQCnKIsX/azLU1D9CqnSbUHiI8/pZFQKX4zSG2F81NxMnT2MFWHzc5Df4/Q72WWgLBv3GFktcdEq0gVlot8bMNgb2b+wcMzq+ewu/u4MaC9IG6kKEC+DHW7nwXVTYm3UzvnIEHdFYHUt8NSheulsv3iyksvfy4myGpfm05HMKaZoD6Fq74anS6JDeE0agHPm8/LF8JatzjiUFtBUhg02EbdgLPGyKyL+0HOOk8B71sw64QpLB1REOprtMr0/YpyNoxY5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nd7VilfmPQjlzpe4/hiiAnFY6Jz7kIGKzKJ7XPUGUNg=;
 b=wGCBW4UqlghHbM7/VCSF4v2t9SybUpfG0Aro3HB2cNE5ad03mENBhWbAIyiz35+kXCdApm2MvBXxAkPy9SstSsbOYZZCh9e3XOohj87kbvjoFfzgD5Zwg9TX2ByU0kIHagfwvTUlqqfMw6V5rLpNM/S8WxI0j8CVXI+4B2JSmNE=
Received: from MN2PR12MB4319.namprd12.prod.outlook.com (2603:10b6:208:1dc::10)
 by MN2PR12MB4357.namprd12.prod.outlook.com (2603:10b6:208:262::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.17; Wed, 26 Feb
 2020 15:41:59 +0000
Received: from MN2PR12MB4319.namprd12.prod.outlook.com
 ([fe80::6091:29d2:8a4e:d3c]) by MN2PR12MB4319.namprd12.prod.outlook.com
 ([fe80::6091:29d2:8a4e:d3c%5]) with mapi id 15.20.2750.021; Wed, 26 Feb 2020
 15:41:59 +0000
From: "Zuo, Jerry" <Jerry.Zuo@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: RE: [PATCH 13/15] drm/amdgpu/display: split dp connector registration
 (v3)
Thread-Topic: [PATCH 13/15] drm/amdgpu/display: split dp connector
 registration (v3)
Thread-Index: AQHV7AhHd3YVyUf54E25aK+XlpP6P6gsOTeAgAABlvCAAADeAIAAAtuAgAFd6ICAAAF/AIAAAF6g
Date: Wed, 26 Feb 2020 15:41:59 +0000
Message-ID: <MN2PR12MB4319700D931599D795F893D9E5EA0@MN2PR12MB4319.namprd12.prod.outlook.com>
References: <20200207211713.3870-1-alexander.deucher@amd.com>
 <22cf2c92-52a0-5e1a-e569-4fe421e38022@amd.com>
 <CADnq5_M9yngJYmhOKiUvpR0H-e5yoVOrqwoim+_Ps63wY3QsRg@mail.gmail.com>
 <DM5PR1201MB2554BBEA6B0C7DECFFE8DD3E9EED0@DM5PR1201MB2554.namprd12.prod.outlook.com>
 <DM5PR1201MB2554768A51B1A4625E67BB899EED0@DM5PR1201MB2554.namprd12.prod.outlook.com>
 <CADnq5_M8Hb9YJ-cVzr0x8ABUpQjeL5DwOuCwjEWfdTXFJdbGeQ@mail.gmail.com>
 <MN2PR12MB431991DF654BFF4C028DDD46E5ED0@MN2PR12MB4319.namprd12.prod.outlook.com>
 <CADnq5_Mmg9spo_Zb0PEEo-gx4JeAr3meSmjR693iWurH_rw7aw@mail.gmail.com>
 <CADnq5_NmmhXjTo=qVnZR+hua6W6ReNx8fRDqXebgP9KCbdHF3Q@mail.gmail.com>
 <MN2PR12MB4319E90F772888AEC7A1C209E5EA0@MN2PR12MB4319.namprd12.prod.outlook.com>
 <CADnq5_ObmRccE7tiWYi+_skR6XAOqThLS37DH3g6FoGvAUye4w@mail.gmail.com>
In-Reply-To: <CADnq5_ObmRccE7tiWYi+_skR6XAOqThLS37DH3g6FoGvAUye4w@mail.gmail.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=true;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2020-02-26T15:41:57Z; 
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal Use Only -
 Unrestricted;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ActionId=436648e0-8a82-4e0b-b3ed-00004947c7b5;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=1
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_enabled: true
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_setdate: 2020-02-26T15:41:57Z
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_method: Standard
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_name: Internal Use Only -
 Unrestricted
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_actionid: 50af11d8-f7d3-4ab1-8a15-0000872510c9
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_contentbits: 0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Jerry.Zuo@amd.com; 
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: cf973cf4-edd4-476f-9a64-08d7bad26ad6
x-ms-traffictypediagnostic: MN2PR12MB4357:|MN2PR12MB4357:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB4357894433E4EFFEADEE2342E5EA0@MN2PR12MB4357.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:813;
x-forefront-prvs: 0325F6C77B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(136003)(396003)(366004)(346002)(199004)(189003)(86362001)(186003)(66946007)(7696005)(66446008)(66476007)(316002)(76116006)(54906003)(30864003)(2906002)(64756008)(66556008)(8676002)(55016002)(33656002)(4326008)(71200400001)(8936002)(6916009)(6506007)(81166006)(52536014)(53546011)(81156014)(26005)(9686003)(5660300002)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4357;
 H:MN2PR12MB4319.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: W0Wo3p43xj7t1xvSP7oty5SLH5xvicx1AtsE+6MCpt4nwat6thaM9yPZk29JaSRsqKUNVr9hPGiw9NIEH+OUR8PqlcZG0lZ4JYqkchu/h977TIGgqx1KeVJ5JOTraq55TzbjUZJ4K/eJCxEQh1zO/cEySw8aT7fShEoj/aOh5Z2m2nn1NAtHGgAYlulcQ2cwz/8r0M+jIBuqheMfD1N2zaXaEFOjxXNP9Elm+Li0u32vGBjRcvCPAwQ5hsBSpd1k/BwtIvOKFJQwlv4eeUbWKr5qqe0kQc+lbzbCDaaW576QTvwm9E8sD7q743opNrLabBTfbX6cls14XdxIApgRw/tKj8QFKN8b7tzemooDRd5UIkXPHguegeMFj3+mQnDcgmUa2yWX59CW/y2H6gTscsw9/7D9n5Odc+hJPYfQggPFKWGzcFfZkJaLE2k82a5k
x-ms-exchange-antispam-messagedata: qqHkC//iStve/zW1k3PEERD/8IzFl4WwnsBxuujusXti6gVQl9aso48ButLARey1cU1uG4lhJ9otgQlEued12d409DPrCjK9gv4qGKyg5o+YkZts2W5FE9vNzk6xdSX9bm3N4tyx84QPA74EllvvFw==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf973cf4-edd4-476f-9a64-08d7bad26ad6
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2020 15:41:59.2899 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Sv9GHTIwJg16bkvs3QuWpQPgAkVxGr2Yfnxky5xAx53lqP38zQcHEb+TPvmuiN99
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4357
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
Cc: "Broadworth, Mark" <Mark.Broadworth@amd.com>, "Liu,
 Zhan" <Zhan.Liu@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher, 
 Alexander" <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only - Internal Distribution Only]

Reviewed-by: Jerry (Fangzhi) Zuo <Jerry.Zuo@amd.com>

-----Original Message-----
From: Alex Deucher <alexdeucher@gmail.com> 
Sent: February 26, 2020 10:40 AM
To: Zuo, Jerry <Jerry.Zuo@amd.com>
Cc: Liu, Zhan <Zhan.Liu@amd.com>; Wentland, Harry <Harry.Wentland@amd.com>; amd-gfx list <amd-gfx@lists.freedesktop.org>; Maling list - DRI developers <dri-devel@lists.freedesktop.org>; Deucher, Alexander <Alexander.Deucher@amd.com>; Broadworth, Mark <Mark.Broadworth@amd.com>
Subject: Re: [PATCH 13/15] drm/amdgpu/display: split dp connector registration (v3)

On Wed, Feb 26, 2020 at 10:36 AM Zuo, Jerry <Jerry.Zuo@amd.com> wrote:
>
> [AMD Official Use Only - Internal Distribution Only]
>
> Hi Alex:
>
>      The patch set works. Please let me know when you push the change to drm-next.

Can someone give me and R-b or A-b on the patches?

Thanks,

Alex

>
>      Thanks a lot.
>
> Regards,
> Jerry
>
> -----Original Message-----
> From: Alex Deucher <alexdeucher@gmail.com>
> Sent: February 25, 2020 1:42 PM
> To: Zuo, Jerry <Jerry.Zuo@amd.com>
> Cc: Liu, Zhan <Zhan.Liu@amd.com>; Wentland, Harry 
> <Harry.Wentland@amd.com>; amd-gfx list 
> <amd-gfx@lists.freedesktop.org>; Maling list - DRI developers 
> <dri-devel@lists.freedesktop.org>; Deucher, Alexander 
> <Alexander.Deucher@amd.com>; Broadworth, Mark 
> <Mark.Broadworth@amd.com>
> Subject: Re: [PATCH 13/15] drm/amdgpu/display: split dp connector 
> registration (v3)
>
> On Tue, Feb 25, 2020 at 1:32 PM Alex Deucher <alexdeucher@gmail.com> wrote:
> >
> > On Tue, Feb 25, 2020 at 1:30 PM Zuo, Jerry <Jerry.Zuo@amd.com> wrote:
> > >
> > > [AMD Official Use Only - Internal Distribution Only]
> > >
> > > Hi Alex:
> > >
> > >      It happened when a MST monitor is attached, either in driver load or hotplug later.
> >
> > I think I found the issue.  I'll send a patch shortly.
>
> Attaching two patches.  I think patch 1 should fix it.  Patch 2 is the 
> same patch as before.  I'm not sure
> drm_dp_mst_connector_late_register() is necessary since no other driver calls it.
>
> Alex
>
> >
> > Alex
> >
> >
> > >
> > > Regards,
> > > Jerry
> > >
> > > -----Original Message-----
> > > From: Alex Deucher <alexdeucher@gmail.com>
> > > Sent: February 25, 2020 1:23 PM
> > > To: Liu, Zhan <Zhan.Liu@amd.com>
> > > Cc: Wentland, Harry <Harry.Wentland@amd.com>; Zuo, Jerry 
> > > <Jerry.Zuo@amd.com>; amd-gfx list <amd-gfx@lists.freedesktop.org>; 
> > > Maling list - DRI developers <dri-devel@lists.freedesktop.org>;
> > > Deucher, Alexander <Alexander.Deucher@amd.com>; Broadworth, Mark 
> > > <Mark.Broadworth@amd.com>
> > > Subject: Re: [PATCH 13/15] drm/amdgpu/display: split dp connector 
> > > registration (v3)
> > >
> > > On Tue, Feb 25, 2020 at 1:20 PM Liu, Zhan <Zhan.Liu@amd.com> wrote:
> > > >
> > > >
> > > > > -----Original Message-----
> > > > > From: Liu, Zhan
> > > > > Sent: 2020/February/25, Tuesday 10:10 AM
> > > > > To: Alex Deucher <alexdeucher@gmail.com>; Wentland, Harry 
> > > > > <Harry.Wentland@amd.com>
> > > > > Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>; Maling list 
> > > > > - DRI developers <dri-devel@lists.freedesktop.org>; Deucher, 
> > > > > Alexander <Alexander.Deucher@amd.com>; Broadworth, Mark 
> > > > > <Mark.Broadworth@amd.com>
> > > > > Subject: RE: [PATCH 13/15] drm/amdgpu/display: split dp 
> > > > > connector registration (v3)
> > > > >
> > > > >
> > > > > > -----Original Message-----
> > > > > > From: Alex Deucher <alexdeucher@gmail.com>
> > > > > > Sent: 2020/February/25, Tuesday 9:07 AM
> > > > > > To: Wentland, Harry <Harry.Wentland@amd.com>
> > > > > > Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>; Maling 
> > > > > > list
> > > > > > - DRI developers <dri-devel@lists.freedesktop.org>; Deucher, 
> > > > > > Alexander <Alexander.Deucher@amd.com>; Broadworth, Mark 
> > > > > > <Mark.Broadworth@amd.com>; Liu, Zhan <Zhan.Liu@amd.com>
> > > > > > Subject: Re: [PATCH 13/15] drm/amdgpu/display: split dp 
> > > > > > connector registration (v3)
> > > > > >
> > > > > > On Mon, Feb 24, 2020 at 4:09 PM Harry Wentland 
> > > > > > <hwentlan@amd.com>
> > > > > > wrote:
> > > > > > >
> > > > > > > On 2020-02-07 4:17 p.m., Alex Deucher wrote:
> > > > > > > > Split into init and register functions to avoid a 
> > > > > > > > segfault in some configs when the load/unload callbacks are removed.
> > > > > > > >
> > > > > > >
> > > > > > > Looks like MST is completely broken with this change with 
> > > > > > > a NULL pointer dereference in drm_dp_aux_register.
> > > > > > >
> > > > > > > > v2:
> > > > > > > > - add back accidently dropped has_aux setting
> > > > > > > > - set dev in late_register
> > > > > > > >
> > > > > > > > v3:
> > > > > > > > - fix dp cec ordering
> > > > > > > >
> > > > > > > > Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> > > > > > > > ---
> > > > > > > >  drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c   | 16
> > > > > > ++++++++++++++++
> > > > > > > >  drivers/gpu/drm/amd/amdgpu/atombios_dp.c         | 10 ++--------
> > > > > > > >  .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c  |  7
> > > > > > > > ++++++-
> > > > > > > >  3 files changed, 24 insertions(+), 9 deletions(-)
> > > > > > > >
> > > > > > > > diff --git
> > > > > > > > a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> > > > > > > > b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> > > > > > > > index ec1501e3a63a..f355d9a752d2 100644
> > > > > > > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> > > > > > > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> > > > > > > > @@ -1461,6 +1461,20 @@ static enum drm_mode_status
> > > > > > amdgpu_connector_dp_mode_valid(struct drm_connector
> > > > > > > >       return MODE_OK;
> > > > > > > >  }
> > > > > > > >
> > > > > > > > +static int
> > > > > > > > +amdgpu_connector_late_register(struct drm_connector *connector) {
> > > > > > > > +     struct amdgpu_connector *amdgpu_connector =
> > > > > > to_amdgpu_connector(connector);
> > > > > > > > +     int r = 0;
> > > > > > > > +
> > > > > > > > +     if (amdgpu_connector->ddc_bus->has_aux) {
> > > > > > > > +             amdgpu_connector->ddc_bus->aux.dev =
> > > > > > > > + amdgpu_connector-
> > > > > > >base.kdev;
> > > > > > > > +             r = drm_dp_aux_register(&amdgpu_connector->ddc_bus->aux);
> > > > > > > > +     }
> > > > > > > > +
> > > > > > > > +     return r;
> > > > > > > > +}
> > > > > > > > +
> > > > > > > >  static const struct drm_connector_helper_funcs
> > > > > > amdgpu_connector_dp_helper_funcs = {
> > > > > > > >       .get_modes = amdgpu_connector_dp_get_modes,
> > > > > > > >       .mode_valid = amdgpu_connector_dp_mode_valid, @@
> > > > > > > > -1475,6
> > > > > > > > +1489,7 @@ static const struct drm_connector_funcs
> > > > > > amdgpu_connector_dp_funcs = {
> > > > > > > >       .early_unregister = amdgpu_connector_unregister,
> > > > > > > >       .destroy = amdgpu_connector_destroy,
> > > > > > > >       .force = amdgpu_connector_dvi_force,
> > > > > > > > +     .late_register = amdgpu_connector_late_register,
> > > > > > > >  };
> > > > > > > >
> > > > > > > >  static const struct drm_connector_funcs 
> > > > > > > > amdgpu_connector_edp_funcs = { @@ -1485,6 +1500,7 @@ 
> > > > > > > > static
> > > > > const
> > > > > > > > struct drm_connector_funcs
> > > > > > amdgpu_connector_edp_funcs = {
> > > > > > > >       .early_unregister = amdgpu_connector_unregister,
> > > > > > > >       .destroy = amdgpu_connector_destroy,
> > > > > > > >       .force = amdgpu_connector_dvi_force,
> > > > > > > > +     .late_register = amdgpu_connector_late_register,
> > > > > > > >  };
> > > > > > > >
> > > > > > > >  void
> > > > > > > > diff --git a/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
> > > > > > > > b/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
> > > > > > > > index ea702a64f807..9b74cfdba7b8 100644
> > > > > > > > --- a/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
> > > > > > > > +++ b/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
> > > > > > > > @@ -186,16 +186,10 @@
> > > > > > > > amdgpu_atombios_dp_aux_transfer(struct
> > > > > > > > drm_dp_aux *aux, struct drm_dp_aux_msg *m
> > > > > > > >
> > > > > > > >  void amdgpu_atombios_dp_aux_init(struct 
> > > > > > > > amdgpu_connector
> > > > > > > > *amdgpu_connector)  {
> > > > > > > > -     int ret;
> > > > > > > > -
> > > > > > > >       amdgpu_connector->ddc_bus->rec.hpd =
> > > > > > > > amdgpu_connector-
> > > > > > >hpd.hpd;
> > > > > > > > -     amdgpu_connector->ddc_bus->aux.dev = amdgpu_connector-
> > > > > > >base.kdev;
> > > > > > > >       amdgpu_connector->ddc_bus->aux.transfer =
> > > > > > amdgpu_atombios_dp_aux_transfer;
> > > > > > > > -     ret = drm_dp_aux_register(&amdgpu_connector->ddc_bus->aux);
> > > > > > > > -     if (!ret)
> > > > > > > > -             amdgpu_connector->ddc_bus->has_aux = true;
> > > > > > > > -
> > > > > > > > -     WARN(ret, "drm_dp_aux_register_i2c_bus() failed with error %d\n",
> > > > > > ret);
> > > > > > > > +     drm_dp_aux_init(&amdgpu_connector->ddc_bus->aux);
> > > > > > > > +     amdgpu_connector->ddc_bus->has_aux = true;
> > > > > > > >  }
> > > > > > > >
> > > > > > > >  /***** general DP utility functions *****/ diff --git 
> > > > > > > > a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_ty
> > > > > > > > pe
> > > > > > > > s.c
> > > > > > > > b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_ty
> > > > > > > > pe s.c index 3959c942c88b..d5b9e72f2649 100644
> > > > > > > > ---
> > > > > > a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.
> > > > > > c
> > > > > > > > +++
> > > > > > b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.
> > > > > > c
> > > > > > > > @@ -155,6 +155,11 @@
> > > > > > amdgpu_dm_mst_connector_late_register(struct drm_connector
> > > > > > *connector)
> > > > > > > >       struct amdgpu_dm_connector *amdgpu_dm_connector =
> > > > > > > >               to_amdgpu_dm_connector(connector);
> > > > > > > >       struct drm_dp_mst_port *port = 
> > > > > > > > amdgpu_dm_connector->port;
> > > > > > > > +     int r;
> > > > > > > > +
> > > > > > > > +     r =
> > > > > > > > + drm_dp_aux_register(&amdgpu_dm_connector->dm_dp_aux.au
> > > > > > > > + x)
> > > > > > > > + ;
> > > > > > >
> > > > > > > This calls drm_dp_aux_register_devnode which is also 
> > > > > > > called later in drm_dp_mst_connector_late_register. Wonder if that's a problem.
> > > > > >
> > > > > > Does this patch help?  I'm not too familiar with the MST 
> > > > > > code and I don't have an MST monitor.
> > > > >
> > > > > I have an MST monitor and I can give it a spin. I'll get back to you later.
> > > >
> > > > + Jerry who is following up on this issue
> > > >
> > > > Thank you Alex for your patch. Unfortunately, it doesn't solve the issue.
> > > >
> > > > Jerry is following up on this ticket, and I've added him to this email thread.
> > >
> > > Can you send me the full dmesg output?  Also, does it happen as soon as the driver loads or sometime later?
> > >
> > > Alex
> > >
> > >
> > > >
> > > > Zhan
> > > >
> > > > >
> > > > > Zhan
> > > > >
> > > > > >
> > > > > > Alex
> > > > > >
> > > > > >
> > > > > > >
> > > > > > > Harry
> > > > > > >
> > > > > > > > +     if (r)
> > > > > > > > +             return r;
> > > > > > > >
> > > > > > > >  #if defined(CONFIG_DEBUG_FS)
> > > > > > > >       connector_debugfs_init(amdgpu_dm_connector);
> > > > > > > > @@ -484,7 +489,7 @@ void
> > > > > amdgpu_dm_initialize_dp_connector(struct
> > > > > > amdgpu_display_manager *dm,
> > > > > > > >       aconnector->dm_dp_aux.aux.transfer = dm_dp_aux_transfer;
> > > > > > > >       aconnector->dm_dp_aux.ddc_service =
> > > > > > > > aconnector->dc_link->ddc;
> > > > > > > >
> > > > > > > > -     drm_dp_aux_register(&aconnector->dm_dp_aux.aux);
> > > > > > > > +     drm_dp_aux_init(&aconnector->dm_dp_aux.aux);
> > > > > > > >       drm_dp_cec_register_connector(&aconnector->dm_dp_aux.aux,
> > > > > > > >                                     &aconnector->base);
> > > > > > > >
> > > > > > > >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

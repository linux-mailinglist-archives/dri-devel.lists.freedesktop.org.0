Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB1216EE97
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 20:07:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A61576EB94;
	Tue, 25 Feb 2020 19:07:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2071.outbound.protection.outlook.com [40.107.243.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADA2A6EB94;
 Tue, 25 Feb 2020 19:07:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fXjWFL4vy5nF9nnlaZOir/EXdZLdgEzSptsV6q81X8IPSlrcyh2orwftOMXD4r/iddiagrFBtX62aTwsRVOBMfBNnfmVLBwXk8UqfiyO80z1kIBdngtStRAWCWizrpiFmo4QyXgZSCXRFunSERdcrRmrXEzXPhAlT2De0jPiiAYqjXgqenaY2AO7+qcrz2DjdOoU4UM7vPFWX4yMJsVtMS70f9PXrr/TLv+qDRmd/7EQ/x8dWMQucw0TPg/nUxanMLT29/H3mai9H7Q9rbEPDou0G6iU6OXv6pAMHG9JUwkP2toHMibrvXdj8WfrV0qKHB3Gm3KhJa59J1XIpLWFGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X8MHPkysOif4W4lawlyww+wdnHvweXf+u3JZZs5V9SA=;
 b=dwsaTmdGVEHHzw0wnacb89nd+JLyDTYjttBv6GhhHVEBROeDUuBVO7bBPS9rSBLaZkCXVrzq0ifSHGrm9UWyPCZ/3aUvzfirz3mLA5lLlBHMcaEu7UEQCf/c9Xjt3DBrn3DHmvdC7cE3DxDLRTNBQfNqhXetuIA6CXm4TLsToWnnziRSpSGvHKkptJhyBm9PTwbkxkLe41DzFAMfhkruKjMCO/9DLEeDuZKVJNbx3gKH1a0AyEeC4pyitkY+tFsH+ssk/fy4xJI6FH2zACYSNj7AbNzqJSJNkcegR4cO53DFGo08oHqasC++9czXvcmb5qW+XCXNvi8N0d6UC0e5Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X8MHPkysOif4W4lawlyww+wdnHvweXf+u3JZZs5V9SA=;
 b=csovUPMFO9STP0UgFwb0bFHacnGLXoRQiGpicIw8XkcHa+T3YHHXXMIHgyOnhNo0OSMRMdCMYBVjrUWAnwUghkzbm/MWzhEsKc0LEo7ujJeA0766EZ2HKHrAiYzabQSoVAPW2Vpijm3lMOAMvcsgagi754htzIP5M9SVEgcT1Uo=
Received: from MN2PR12MB4319.namprd12.prod.outlook.com (2603:10b6:208:1dc::10)
 by MN2PR12MB4407.namprd12.prod.outlook.com (2603:10b6:208:260::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.21; Tue, 25 Feb
 2020 19:07:53 +0000
Received: from MN2PR12MB4319.namprd12.prod.outlook.com
 ([fe80::6091:29d2:8a4e:d3c]) by MN2PR12MB4319.namprd12.prod.outlook.com
 ([fe80::6091:29d2:8a4e:d3c%5]) with mapi id 15.20.2750.021; Tue, 25 Feb 2020
 19:07:53 +0000
From: "Zuo, Jerry" <Jerry.Zuo@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: RE: [PATCH 13/15] drm/amdgpu/display: split dp connector registration
 (v3)
Thread-Topic: [PATCH 13/15] drm/amdgpu/display: split dp connector
 registration (v3)
Thread-Index: AQHV7AhHd3YVyUf54E25aK+XlpP6P6gsOTeAgAABlvCAAADeAIAAAtuAgAACu7A=
Date: Tue, 25 Feb 2020 19:07:53 +0000
Message-ID: <MN2PR12MB431926E5803429BA98B9CDC9E5ED0@MN2PR12MB4319.namprd12.prod.outlook.com>
References: <20200207211713.3870-1-alexander.deucher@amd.com>
 <22cf2c92-52a0-5e1a-e569-4fe421e38022@amd.com>
 <CADnq5_M9yngJYmhOKiUvpR0H-e5yoVOrqwoim+_Ps63wY3QsRg@mail.gmail.com>
 <DM5PR1201MB2554BBEA6B0C7DECFFE8DD3E9EED0@DM5PR1201MB2554.namprd12.prod.outlook.com>
 <DM5PR1201MB2554768A51B1A4625E67BB899EED0@DM5PR1201MB2554.namprd12.prod.outlook.com>
 <CADnq5_M8Hb9YJ-cVzr0x8ABUpQjeL5DwOuCwjEWfdTXFJdbGeQ@mail.gmail.com>
 <MN2PR12MB431991DF654BFF4C028DDD46E5ED0@MN2PR12MB4319.namprd12.prod.outlook.com>
 <CADnq5_Mmg9spo_Zb0PEEo-gx4JeAr3meSmjR693iWurH_rw7aw@mail.gmail.com>
 <CADnq5_NmmhXjTo=qVnZR+hua6W6ReNx8fRDqXebgP9KCbdHF3Q@mail.gmail.com>
In-Reply-To: <CADnq5_NmmhXjTo=qVnZR+hua6W6ReNx8fRDqXebgP9KCbdHF3Q@mail.gmail.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=true;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2020-02-25T19:07:51Z; 
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal Use Only -
 Unrestricted;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ActionId=20879ae6-ac07-4e5b-9146-0000a59128ec;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=1
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_enabled: true
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_setdate: 2020-02-25T19:07:51Z
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_method: Standard
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_name: Internal Use Only -
 Unrestricted
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_actionid: ff430c96-182c-4a13-84a1-00004ef4d97c
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_contentbits: 0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Jerry.Zuo@amd.com; 
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c222f201-c6a4-49ce-3753-08d7ba26040e
x-ms-traffictypediagnostic: MN2PR12MB4407:|MN2PR12MB4407:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB440700538707A3B59381A727E5ED0@MN2PR12MB4407.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:519;
x-forefront-prvs: 0324C2C0E2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(39860400002)(136003)(366004)(376002)(189003)(199004)(81166006)(71200400001)(81156014)(8676002)(64756008)(66476007)(186003)(76116006)(33656002)(66946007)(66446008)(26005)(5660300002)(6916009)(316002)(4326008)(8936002)(6506007)(66556008)(7696005)(9686003)(55016002)(53546011)(54906003)(2906002)(52536014)(86362001)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4407;
 H:MN2PR12MB4319.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XyEnYIZgtYst68cN44hcT6mMdOGG/9a5LMswXQviIjJRbWechUU0oRV8nB+oqQlWqTmceRNt275IvCznjO1B4+A6bEHNBM8HlJMkhpPi2oZA9P8RevRCau0FgA1iM4a3Nvdia3A7BCxzXuDnClEhfYICu9TFkdtL7t5iwsWxwGktO6MFpl/gbiPxzyOEQlzPmMF0QUwF5Ee9Qu2GvCN0dero/1Sn85NzGGdmvuI05dVpLvR4AAAY4Iyt3Q/khLPuuExWjc5C/+LnuCQvMvHmNir9VEnIjL7t5NxbkSOrIMF8TUdlXaMRyKJpwbyQRBHMnlKBZOngh1zbzydliXikAT9huPUd6LpNgIeokttjFTBXeHoYKIDWpqFLIThrvSkf5GMo5z/TMmrrKc9/l4F/tPti/eNsXo+4NT/fuboQfzkZCGMzOHjXys9CkKzw+kBr
x-ms-exchange-antispam-messagedata: 1ZnvJ0nQW2J+qEjDh3RnBOndfg+tPnz1SxfjFPOIhlS0Ch4HOOnxvklAwJy3TGJYpqHg/pJ9OS8HA1XFnUvmyysZjbD68KYrQEKakUL96mjElWUg2z34nKuzh9VDdF5viRGlL65hDtvwkHKBOO3Mjg==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c222f201-c6a4-49ce-3753-08d7ba26040e
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2020 19:07:53.4115 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bUdZ8/TKwDdfXABK/WoHsK0xajLqjwj8hbAAaqAisGMcgR+55PDKes53M+uGqYN6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4407
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

Hi Alex:

    The patch set is verified on Ubuntu, and I'll try it out on Chrome as well. 

    Thanks a lot!

Regards,
Jerry

-----Original Message-----
From: Alex Deucher <alexdeucher@gmail.com>
Sent: February 25, 2020 1:42 PM
To: Zuo, Jerry <Jerry.Zuo@amd.com>
Cc: Liu, Zhan <Zhan.Liu@amd.com>; Wentland, Harry <Harry.Wentland@amd.com>; amd-gfx list <amd-gfx@lists.freedesktop.org>; Maling list - DRI developers <dri-devel@lists.freedesktop.org>; Deucher, Alexander <Alexander.Deucher@amd.com>; Broadworth, Mark <Mark.Broadworth@amd.com>
Subject: Re: [PATCH 13/15] drm/amdgpu/display: split dp connector registration (v3)

On Tue, Feb 25, 2020 at 1:32 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> On Tue, Feb 25, 2020 at 1:30 PM Zuo, Jerry <Jerry.Zuo@amd.com> wrote:
> >
> > [AMD Official Use Only - Internal Distribution Only]
> >
> > Hi Alex:
> >
> >      It happened when a MST monitor is attached, either in driver load or hotplug later.
>
> I think I found the issue.  I'll send a patch shortly.

Attaching two patches.  I think patch 1 should fix it.  Patch 2 is the same patch as before.  I'm not sure
drm_dp_mst_connector_late_register() is necessary since no other driver calls it.

Alex

>
> Alex
>
>
> >
> > Regards,
> > Jerry
> >
> > -----Original Message-----
> > From: Alex Deucher <alexdeucher@gmail.com>
> > Sent: February 25, 2020 1:23 PM
> > To: Liu, Zhan <Zhan.Liu@amd.com>
> > Cc: Wentland, Harry <Harry.Wentland@amd.com>; Zuo, Jerry 
> > <Jerry.Zuo@amd.com>; amd-gfx list <amd-gfx@lists.freedesktop.org>; 
> > Maling list - DRI developers <dri-devel@lists.freedesktop.org>;
> > Deucher, Alexander <Alexander.Deucher@amd.com>; Broadworth, Mark 
> > <Mark.Broadworth@amd.com>
> > Subject: Re: [PATCH 13/15] drm/amdgpu/display: split dp connector 
> > registration (v3)
> >
> > On Tue, Feb 25, 2020 at 1:20 PM Liu, Zhan <Zhan.Liu@amd.com> wrote:
> > >
> > >
> > > > -----Original Message-----
> > > > From: Liu, Zhan
> > > > Sent: 2020/February/25, Tuesday 10:10 AM
> > > > To: Alex Deucher <alexdeucher@gmail.com>; Wentland, Harry 
> > > > <Harry.Wentland@amd.com>
> > > > Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>; Maling list - 
> > > > DRI developers <dri-devel@lists.freedesktop.org>; Deucher, 
> > > > Alexander <Alexander.Deucher@amd.com>; Broadworth, Mark 
> > > > <Mark.Broadworth@amd.com>
> > > > Subject: RE: [PATCH 13/15] drm/amdgpu/display: split dp 
> > > > connector registration (v3)
> > > >
> > > >
> > > > > -----Original Message-----
> > > > > From: Alex Deucher <alexdeucher@gmail.com>
> > > > > Sent: 2020/February/25, Tuesday 9:07 AM
> > > > > To: Wentland, Harry <Harry.Wentland@amd.com>
> > > > > Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>; Maling list
> > > > > - DRI developers <dri-devel@lists.freedesktop.org>; Deucher, 
> > > > > Alexander <Alexander.Deucher@amd.com>; Broadworth, Mark 
> > > > > <Mark.Broadworth@amd.com>; Liu, Zhan <Zhan.Liu@amd.com>
> > > > > Subject: Re: [PATCH 13/15] drm/amdgpu/display: split dp 
> > > > > connector registration (v3)
> > > > >
> > > > > On Mon, Feb 24, 2020 at 4:09 PM Harry Wentland 
> > > > > <hwentlan@amd.com>
> > > > > wrote:
> > > > > >
> > > > > > On 2020-02-07 4:17 p.m., Alex Deucher wrote:
> > > > > > > Split into init and register functions to avoid a segfault 
> > > > > > > in some configs when the load/unload callbacks are removed.
> > > > > > >
> > > > > >
> > > > > > Looks like MST is completely broken with this change with a 
> > > > > > NULL pointer dereference in drm_dp_aux_register.
> > > > > >
> > > > > > > v2:
> > > > > > > - add back accidently dropped has_aux setting
> > > > > > > - set dev in late_register
> > > > > > >
> > > > > > > v3:
> > > > > > > - fix dp cec ordering
> > > > > > >
> > > > > > > Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> > > > > > > ---
> > > > > > >  drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c   | 16
> > > > > ++++++++++++++++
> > > > > > >  drivers/gpu/drm/amd/amdgpu/atombios_dp.c         | 10 ++--------
> > > > > > >  .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c  |  7
> > > > > > > ++++++-
> > > > > > >  3 files changed, 24 insertions(+), 9 deletions(-)
> > > > > > >
> > > > > > > diff --git
> > > > > > > a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> > > > > > > b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> > > > > > > index ec1501e3a63a..f355d9a752d2 100644
> > > > > > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> > > > > > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> > > > > > > @@ -1461,6 +1461,20 @@ static enum drm_mode_status
> > > > > amdgpu_connector_dp_mode_valid(struct drm_connector
> > > > > > >       return MODE_OK;
> > > > > > >  }
> > > > > > >
> > > > > > > +static int
> > > > > > > +amdgpu_connector_late_register(struct drm_connector *connector) {
> > > > > > > +     struct amdgpu_connector *amdgpu_connector =
> > > > > to_amdgpu_connector(connector);
> > > > > > > +     int r = 0;
> > > > > > > +
> > > > > > > +     if (amdgpu_connector->ddc_bus->has_aux) {
> > > > > > > +             amdgpu_connector->ddc_bus->aux.dev =
> > > > > > > + amdgpu_connector-
> > > > > >base.kdev;
> > > > > > > +             r = drm_dp_aux_register(&amdgpu_connector->ddc_bus->aux);
> > > > > > > +     }
> > > > > > > +
> > > > > > > +     return r;
> > > > > > > +}
> > > > > > > +
> > > > > > >  static const struct drm_connector_helper_funcs
> > > > > amdgpu_connector_dp_helper_funcs = {
> > > > > > >       .get_modes = amdgpu_connector_dp_get_modes,
> > > > > > >       .mode_valid = amdgpu_connector_dp_mode_valid, @@
> > > > > > > -1475,6
> > > > > > > +1489,7 @@ static const struct drm_connector_funcs
> > > > > amdgpu_connector_dp_funcs = {
> > > > > > >       .early_unregister = amdgpu_connector_unregister,
> > > > > > >       .destroy = amdgpu_connector_destroy,
> > > > > > >       .force = amdgpu_connector_dvi_force,
> > > > > > > +     .late_register = amdgpu_connector_late_register,
> > > > > > >  };
> > > > > > >
> > > > > > >  static const struct drm_connector_funcs 
> > > > > > > amdgpu_connector_edp_funcs = { @@ -1485,6 +1500,7 @@ 
> > > > > > > static
> > > > const
> > > > > > > struct drm_connector_funcs
> > > > > amdgpu_connector_edp_funcs = {
> > > > > > >       .early_unregister = amdgpu_connector_unregister,
> > > > > > >       .destroy = amdgpu_connector_destroy,
> > > > > > >       .force = amdgpu_connector_dvi_force,
> > > > > > > +     .late_register = amdgpu_connector_late_register,
> > > > > > >  };
> > > > > > >
> > > > > > >  void
> > > > > > > diff --git a/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
> > > > > > > b/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
> > > > > > > index ea702a64f807..9b74cfdba7b8 100644
> > > > > > > --- a/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
> > > > > > > +++ b/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
> > > > > > > @@ -186,16 +186,10 @@
> > > > > > > amdgpu_atombios_dp_aux_transfer(struct
> > > > > > > drm_dp_aux *aux, struct drm_dp_aux_msg *m
> > > > > > >
> > > > > > >  void amdgpu_atombios_dp_aux_init(struct amdgpu_connector
> > > > > > > *amdgpu_connector)  {
> > > > > > > -     int ret;
> > > > > > > -
> > > > > > >       amdgpu_connector->ddc_bus->rec.hpd =
> > > > > > > amdgpu_connector-
> > > > > >hpd.hpd;
> > > > > > > -     amdgpu_connector->ddc_bus->aux.dev = amdgpu_connector-
> > > > > >base.kdev;
> > > > > > >       amdgpu_connector->ddc_bus->aux.transfer =
> > > > > amdgpu_atombios_dp_aux_transfer;
> > > > > > > -     ret = drm_dp_aux_register(&amdgpu_connector->ddc_bus->aux);
> > > > > > > -     if (!ret)
> > > > > > > -             amdgpu_connector->ddc_bus->has_aux = true;
> > > > > > > -
> > > > > > > -     WARN(ret, "drm_dp_aux_register_i2c_bus() failed with error %d\n",
> > > > > ret);
> > > > > > > +     drm_dp_aux_init(&amdgpu_connector->ddc_bus->aux);
> > > > > > > +     amdgpu_connector->ddc_bus->has_aux = true;
> > > > > > >  }
> > > > > > >
> > > > > > >  /***** general DP utility functions *****/ diff --git 
> > > > > > > a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_type
> > > > > > > s.c
> > > > > > > b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_type
> > > > > > > s.c index 3959c942c88b..d5b9e72f2649 100644
> > > > > > > ---
> > > > > a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> > > > > > > +++
> > > > > b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> > > > > > > @@ -155,6 +155,11 @@
> > > > > amdgpu_dm_mst_connector_late_register(struct drm_connector
> > > > > *connector)
> > > > > > >       struct amdgpu_dm_connector *amdgpu_dm_connector =
> > > > > > >               to_amdgpu_dm_connector(connector);
> > > > > > >       struct drm_dp_mst_port *port = 
> > > > > > > amdgpu_dm_connector->port;
> > > > > > > +     int r;
> > > > > > > +
> > > > > > > +     r =
> > > > > > > + drm_dp_aux_register(&amdgpu_dm_connector->dm_dp_aux.aux)
> > > > > > > + ;
> > > > > >
> > > > > > This calls drm_dp_aux_register_devnode which is also called 
> > > > > > later in drm_dp_mst_connector_late_register. Wonder if that's a problem.
> > > > >
> > > > > Does this patch help?  I'm not too familiar with the MST code 
> > > > > and I don't have an MST monitor.
> > > >
> > > > I have an MST monitor and I can give it a spin. I'll get back to you later.
> > >
> > > + Jerry who is following up on this issue
> > >
> > > Thank you Alex for your patch. Unfortunately, it doesn't solve the issue.
> > >
> > > Jerry is following up on this ticket, and I've added him to this email thread.
> >
> > Can you send me the full dmesg output?  Also, does it happen as soon as the driver loads or sometime later?
> >
> > Alex
> >
> >
> > >
> > > Zhan
> > >
> > > >
> > > > Zhan
> > > >
> > > > >
> > > > > Alex
> > > > >
> > > > >
> > > > > >
> > > > > > Harry
> > > > > >
> > > > > > > +     if (r)
> > > > > > > +             return r;
> > > > > > >
> > > > > > >  #if defined(CONFIG_DEBUG_FS)
> > > > > > >       connector_debugfs_init(amdgpu_dm_connector);
> > > > > > > @@ -484,7 +489,7 @@ void
> > > > amdgpu_dm_initialize_dp_connector(struct
> > > > > amdgpu_display_manager *dm,
> > > > > > >       aconnector->dm_dp_aux.aux.transfer = dm_dp_aux_transfer;
> > > > > > >       aconnector->dm_dp_aux.ddc_service =
> > > > > > > aconnector->dc_link->ddc;
> > > > > > >
> > > > > > > -     drm_dp_aux_register(&aconnector->dm_dp_aux.aux);
> > > > > > > +     drm_dp_aux_init(&aconnector->dm_dp_aux.aux);
> > > > > > >       drm_dp_cec_register_connector(&aconnector->dm_dp_aux.aux,
> > > > > > >                                     &aconnector->base);
> > > > > > >
> > > > > > >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

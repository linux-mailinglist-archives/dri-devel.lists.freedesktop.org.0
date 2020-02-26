Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCEDE1702AD
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 16:36:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 480C66EA8B;
	Wed, 26 Feb 2020 15:36:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750057.outbound.protection.outlook.com [40.107.75.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E08016EA89;
 Wed, 26 Feb 2020 15:36:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PIAWoSR/NCmZkgReocqrJbEH+B6Zn3WGP38RZ1vAOrGnMWlQBTt1689j8sS6IHV9FDEGIM7X4drFdsWBkQDDQHfvQ+r+hfpDOfieJoD02MNVf02/NpD8fK2nbIqi3mS9Kgwhs8PgyMfhl2IcIbmzFgoT7+3Faf9Z55UZNyM90IvOYPTs87taKBTUcxB+XPTDFfkRlIFb4VCacMa3Gi6bpVE8VXTVedXRDvAflr2MqXXWr/3HahsslBYkwa7RELDTe4MqzA4CAaNLGkwMzJiUjvDxr3dG8t3j9gr6+NIpXs6kFBQrfFX7lETaf8nlStuVW7buSbsEvISn/M7kFa1yCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fD7FT+s1jpoB3qz/AMNf0lT3G018/QvZySnnIVjC/X4=;
 b=EE1puJQoR/llAsmH5yQSXNkefh4NdFgTnDD20h9zneuv1oqMJMfTBLcvd5R7zzYD/P74F3FgKtIuVsAPa7T7tAQQrbjZh95YP0zg9bOsTkRX7fWLp4rtRqPaeZFK75RBWtthb3LvmyzUFJluF5QJUZwK4AOc9SQcxovdZjrvySycs7K2T4ihQi5NIf+BMXJRQVL9yCF/u8qpRsNHG54wxwTO0GlM9aepMfGLuhX0c/mUoq+1kxf+g+t1uMKFZel9u7mI5YP0JLDMoZ98VSmgoYA+pS98RTdFqv5AcVxnOBa5nAh31qQVUiVO38IdjpWDz+lG6L9+1KIWkcnlctiJhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fD7FT+s1jpoB3qz/AMNf0lT3G018/QvZySnnIVjC/X4=;
 b=q9+yhOEjPBBzPzQCMrdUqKSyNaJeC2rhnYF3xS0SQR76BgNUK0S1z+B2mBQYguaJdecq/g+NwnQr0ZJ4nbwosb28dwY3iwVnRBt41EetwXAOmFGKzI/9qMKu61N6vLCB6jY1xVEai8btikn9yy/yCNae9qiE4vNC1OhofxS9m9g=
Received: from MN2PR12MB4319.namprd12.prod.outlook.com (2603:10b6:208:1dc::10)
 by MN2PR12MB4389.namprd12.prod.outlook.com (2603:10b6:208:262::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.21; Wed, 26 Feb
 2020 15:36:22 +0000
Received: from MN2PR12MB4319.namprd12.prod.outlook.com
 ([fe80::6091:29d2:8a4e:d3c]) by MN2PR12MB4319.namprd12.prod.outlook.com
 ([fe80::6091:29d2:8a4e:d3c%5]) with mapi id 15.20.2750.021; Wed, 26 Feb 2020
 15:36:22 +0000
From: "Zuo, Jerry" <Jerry.Zuo@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: RE: [PATCH 13/15] drm/amdgpu/display: split dp connector registration
 (v3)
Thread-Topic: [PATCH 13/15] drm/amdgpu/display: split dp connector
 registration (v3)
Thread-Index: AQHV7AhHd3YVyUf54E25aK+XlpP6P6gsOTeAgAABlvCAAADeAIAAAtuAgAFd6IA=
Date: Wed, 26 Feb 2020 15:36:22 +0000
Message-ID: <MN2PR12MB4319E90F772888AEC7A1C209E5EA0@MN2PR12MB4319.namprd12.prod.outlook.com>
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
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2020-02-26T15:36:20Z; 
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal Use Only -
 Unrestricted;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ActionId=f431758c-1651-453d-995d-0000887fb350;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=1
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_enabled: true
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_setdate: 2020-02-26T15:36:20Z
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_method: Standard
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_name: Internal Use Only -
 Unrestricted
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_actionid: a9e3c694-8d83-4181-b0fe-0000f90b677b
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_contentbits: 0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Jerry.Zuo@amd.com; 
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c7cd85b0-d794-496e-72ef-08d7bad1a1e1
x-ms-traffictypediagnostic: MN2PR12MB4389:|MN2PR12MB4389:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB438968F0587308EE7865D108E5EA0@MN2PR12MB4389.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:813;
x-forefront-prvs: 0325F6C77B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(39860400002)(366004)(346002)(396003)(199004)(189003)(71200400001)(478600001)(81156014)(316002)(2906002)(8676002)(54906003)(4326008)(81166006)(33656002)(53546011)(6506007)(5660300002)(9686003)(8936002)(66446008)(66476007)(66556008)(64756008)(66946007)(52536014)(55016002)(7696005)(26005)(76116006)(6916009)(186003)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4389;
 H:MN2PR12MB4319.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dV/u/Fjkp5YSyz8qtxC7uddguNg8r0zHDEUnheA4egPidPgAKPceh5Im9SVbiD1KgCL6oM89Rh8iGAILk0aYBDsKAa0fNuqtmGD0RE/ID8d7fjgajET8nNS/FNWRghVBqZoU2NvgZIMTRevZdwK9aoJSKKgTy9+5uxZq/59xyrimKzibL8mwGSexGT1kBwcJ9ud3riAFsLEtazXpKeOL2BfAjgEHySiDNgmBFbvEvU8pD/NgrbfHjpG6jXrmrKIkUqL+kTQ9kseN6p0kSUujvU4VMbwlCTM8v6QWeF7MFmjBm81bQcY8noQY7CDXawywO0EO+GcxTxF0hdrjPtmR5I7OujrMgRBm10X+l9eSzWaWiUaELvF+YMDbB3SleofKj+F0bzR9qpzoObh6ZGyMk6M+b/HlfoQMTs2aauZGIswHRMeijwq6p4vvhAdYc0No
x-ms-exchange-antispam-messagedata: kwGgx2KxFJpi7YkdHDQgviNBD5TD6r2ODTSzu4eu+nkL35Brqs576FpnoCllUrGMDONkipw3lYhFEXto72QcTy4j7hrMBr+MIXJsKkRTwxlWONcZ7FQfikVUGBiGlsk1c5CCrfvZw62Xql97XDajqA==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7cd85b0-d794-496e-72ef-08d7bad1a1e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2020 15:36:22.1927 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9pICDaoowaIXyl7o+OXaf2GuhEG0PRy923smvhc66LmXb75gPx6jE7kyOzt1/msG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4389
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

     The patch set works. Please let me know when you push the change to drm-next.

     Thanks a lot.

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

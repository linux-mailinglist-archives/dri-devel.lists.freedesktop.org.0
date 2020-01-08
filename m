Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBDB133922
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 03:34:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF2BA6E172;
	Wed,  8 Jan 2020 02:34:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2045.outbound.protection.outlook.com [40.107.94.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12B816E172;
 Wed,  8 Jan 2020 02:34:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VYnqvyZb6i95rdxfqHOxI/m1FMv4yF/X+HghQsyOrCKxvtuCVnLOXwWjU8+CfKobs8muf++p8i0gyqrXYrS0OOxdzN/zEMCegIadiYtOKfnuQl3gWeaUozvEjgn13BzUd36V1GQptXomfyoyuTzrnI5AZ68Fk4io5uK8LW/RMgjTw70cio8zd4O/KzgH2lq/i2Kqu9h/kKLG6gZQ6J/m+E6GQR8pepcuXOENiXT/QC0QDNyLoshUxa2G/1tcdqBlissRphWSiVxHzY92Z3azgl7GV4oEn8yQyrmdbYKmkX0wT/RWtv9enn4hDcfsbtG/AdS4fxRFBVZ7eD+2mCOBFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uVaSoOPA7TXyQpsOxdXGOSykdcvmuYGSE4PxLZF/IGk=;
 b=FuRmWjBMjKYefgV9BRd3mrFsNLrlztTxywpvp4FpVNgJAn3QUN5ACMtcNdN47L3EZASFqCdE6zg4B/QzzZJ+2GSA86jv2oLUPycwElX6CG5RGa2YOprP4kfLUH0Blg81uNRBh7g1v41pnljvFIuF/In+RDd/hd7OI/3K5EwOZrQsxd+hqBPPyWi68jp2FKAY04izIUZyQv/mBm6ZL+vsRIrZA/+6RQ0ffhZw7+pd6YhWfPwpYFQQLMZ1JkRzaJf0AuPpwISw7xvNWJi8WqB3Pu7YYUKQkHhi3+cWFDP0uK4+9wsvjUnONk+OO7vL5/+SU6y0MJGVbeg16E0TkTIORw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uVaSoOPA7TXyQpsOxdXGOSykdcvmuYGSE4PxLZF/IGk=;
 b=HwMQx0P/nKP6ogs6WudNuVyoEgtt2HsEzLDNKLPh2szKRQRXVo2Qc4wGgCnVPfDfhm7+i485OMjnjrA+EVasuXvWfkL8O43qeK5yY993RcOqAWsz56U/cP0oug1YA0ryd97nioNLbaFXRaeCh/HxLIYazeTDc9YWowUrW1X831o=
Received: from DM6PR12MB4137.namprd12.prod.outlook.com (10.141.186.21) by
 DM6PR12MB3467.namprd12.prod.outlook.com (20.178.199.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.9; Wed, 8 Jan 2020 02:34:09 +0000
Received: from DM6PR12MB4137.namprd12.prod.outlook.com
 ([fe80::cd1d:def3:d2df:3882]) by DM6PR12MB4137.namprd12.prod.outlook.com
 ([fe80::cd1d:def3:d2df:3882%7]) with mapi id 15.20.2602.016; Wed, 8 Jan 2020
 02:34:09 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: RE: [PATCH] drm/dp_mst: correct the shifting in DP_REMOTE_I2C_READ
Thread-Topic: [PATCH] drm/dp_mst: correct the shifting in DP_REMOTE_I2C_READ
Thread-Index: AQHVvt+Vr6mTUvDIfkyiL2AEnl/tiqfShykAgAEPZl6ADAQ/gIAAfvgw
Date: Wed, 8 Jan 2020 02:34:08 +0000
Message-ID: <DM6PR12MB4137A3B62C4BDC871AE521BCFC3E0@DM6PR12MB4137.namprd12.prod.outlook.com>
References: <20191230070516.4760-1-Wayne.Lin@amd.com>
 <87mubaoyi1.fsf@intel.com>
 <DM6PR12MB41375620C8A3030E0C9154CCFC260@DM6PR12MB4137.namprd12.prod.outlook.com>
 <20200107185715.GK1208@intel.com>
In-Reply-To: <20200107185715.GK1208@intel.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Enabled=true;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SetDate=2020-01-08T02:31:51Z; 
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Method=Privileged;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Name=Public_0;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ActionId=36c41ce0-7f9c-44e2-83ab-00004a9ed05c;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ContentBits=1
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_enabled: true
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_setdate: 2020-01-08T02:36:22Z
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_method: Privileged
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_name: Public_0
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_actionid: a742e5c6-452a-4ae7-87fb-0000722dbf46
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_contentbits: 0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Wayne.Lin@amd.com; 
x-originating-ip: [165.204.68.36]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 59cf8a07-749b-4ee7-09d1-08d793e33d44
x-ms-traffictypediagnostic: DM6PR12MB3467:|DM6PR12MB3467:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB3467BD8E9365A244578D65D8FC3E0@DM6PR12MB3467.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2399;
x-forefront-prvs: 02760F0D1C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10001)(10009020)(4636009)(346002)(136003)(39860400002)(376002)(366004)(396003)(199004)(189003)(13464003)(52536014)(966005)(86362001)(5660300002)(66574012)(55016002)(2906002)(316002)(8676002)(8936002)(9686003)(81156014)(81166006)(54906003)(66446008)(64756008)(66556008)(66476007)(45080400002)(76116006)(66946007)(26005)(186003)(6916009)(6506007)(7696005)(53546011)(4326008)(71200400001)(478600001)(33656002)(70780200001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3467;
 H:DM6PR12MB4137.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OwJFYlPpjGk4OGqqyhgY80PCsulhSK5AIoIZGDt7P8CLb2mVU40rd6JRv8sWo6C0edaVgNyhG7SNd11/e+kQhilM5s6ly21ox3MZ2gkrK8f+KF1AMtcDyIlHszTveaqCrpD8qrrhs0Vwk67zb1REMmLYSrhWzvpHFnWK02MMyqZIy8uvKntBpR213OXaDLVt9yIbv0iEr35rKjCfHfXryqIvoDhPYRlJWo4elNcLQXX3PsYpCPuoDB3upqTUWSQMlG0617CseRNrHOegHcmFu6EsWaFjyHtVbJGk0L5tPnJyn4aA8TdGC2MWNo+hIK4+3wG3Ers6rvmRJ2UVo9QHaObAOOEZLmBirfz2ptj4gqTdlMQotZUuS8oHDAdd3uRfhhx6XWXW2K84VQ/zQ/JqdcHPtY+MxLqDlN591qR6k5x8oW7NhlD/6QN8Snt3GY2tAe8ibPnap6VhkHpTskliVAWVnFu78j0lEf2Rc0mnUViaKWLX5pr/73iMJDDw/Pz6SRHXahtlcJYkuQNPmZf/23OmxY3g0mlHaoemSiX5EgEuIChKROb3EzlkCVcA1BqKgsluER03VLKoa5jQ4vTXpy8ju6ulW2jsLR5nsWlHgBL4TiwHDGie3miLYuWnXqDZJkKFpChavxSwSdjDso60qnkddFvy/eVIiuNOCnD7558=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59cf8a07-749b-4ee7-09d1-08d793e33d44
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2020 02:34:09.0265 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UaS+1cl1FIqOY7P8VHlzTQz/eSjVleN4uOTqHSc7Sq270eax3Fttn63s5EySqa5ph5EyoWepfb5MKVM6zSLvjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3467
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
Cc: "Zuo, Jerry" <Jerry.Zuo@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Public Use]



> -----Original Message-----
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Sent: Wednesday, January 8, 2020 2:57 AM
> To: Lin, Wayne <Wayne.Lin@amd.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>; dri-
> devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org; Zuo, Jerry
> <Jerry.Zuo@amd.com>; Kazlauskas, Nicholas
> <Nicholas.Kazlauskas@amd.com>
> Subject: Re: [PATCH] drm/dp_mst: correct the shifting in
> DP_REMOTE_I2C_READ
> =

> On Tue, Dec 31, 2019 at 03:30:47AM +0000, Lin, Wayne wrote:
> > [AMD Official Use Only - Internal Distribution Only]
> >
> > > ________________________________________
> > > From: Jani Nikula <jani.nikula@linux.intel.com>
> > > Sent: Monday, December 30, 2019 19:15
> > > To: Lin, Wayne; dri-devel@lists.freedesktop.org;
> > > amd-gfx@lists.freedesktop.org
> > > Cc: Zuo, Jerry; Kazlauskas, Nicholas; Lin, Wayne
> > > Subject: Re: [PATCH] drm/dp_mst: correct the shifting in
> > > DP_REMOTE_I2C_READ
> > >
> > > On Mon, 30 Dec 2019, Wayne Lin <Wayne.Lin@amd.com> wrote:
> > > > [Why]
> > > > According to DP spec, it should shift left 4 digits for
> > > > NO_STOP_BIT in REMOTE_I2C_READ message. Not 5 digits.
> > > >
> > > > [How]
> > > > Correct the shifting value of NO_STOP_BIT for DP_REMOTE_I2C_READ
> > > > case in drm_dp_encode_sideband_req().
> > >
> > > Which commit introduced the issue? Fixes: tag. Does it need a stable
> > > backport? Does this fix a user visible bug?
> > >
> > > BR,
> > > Jani.
> > >
> > Thanks for your time and reminder.
> >
> > It seems like the issue has been there since very beginning.(commit:
> ad7f8a1).
> > It doesn't introduce user visible bug under my test cases, but this
> > affects the I2C signal between I2C master and I2C slave. Not pretty
> > sure if there is any eeprom will reset the written offset once received=
 I2C
> stop. If so, that might cause wrongly reading EDID.
> > I will Cc to stable. Thanks.
> =

> The segment address should be reset on STOP. So large EDIDs should fail.
> IIRC we had a bug report of some sort about this which I tried to fix by
> confgiuring .no_stop_bit correctly, but apparently I failed to double che=
ck
> that the bit get stuffed onto the wire correctly.
> =

> Ah yes,
> https://bugs.freedesktop.org/show_bug.cgi?id=3D108081
> So you may have just fixed that one, although we seem to have closed it
> already.

Thanks for your time and the explanation.
> =

> > > > Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
> > > > ---
> > > >  drivers/gpu/drm/drm_dp_mst_topology.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
> > > > b/drivers/gpu/drm/drm_dp_mst_topology.c
> > > > index 1d1bfa49ca2b..0557e225ff67 100644
> > > > --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> > > > +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> > > > @@ -393,7 +393,7 @@ drm_dp_encode_sideband_req(const struct
> drm_dp_sideband_msg_req_body *req,
> > > >                       memcpy(&buf[idx], req->u.i2c_read.transaction=
s[i].bytes,
> req->u.i2c_read.transactions[i].num_bytes);
> > > >                       idx +=3D
> > > > req->u.i2c_read.transactions[i].num_bytes;
> > > >
> > > > -                     buf[idx] =3D (req->u.i2c_read.transactions[i]=
.no_stop_bit &
> 0x1) << 5;
> > > > +                     buf[idx] =3D
> > > > + (req->u.i2c_read.transactions[i].no_stop_bit & 0x1) << 4;
> > > >                       buf[idx] |=3D (req-
> >u.i2c_read.transactions[i].i2c_transaction_delay & 0xf);
> > > >                       idx++;
> > > >               }
> > >
> > > --
> > > Jani Nikula, Intel Open Source Graphics Center
> > --
> > Wayne Lin
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flist
> > s.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-
> devel&amp;data=3D02%7C01%7C
> >
> Wayne.Lin%40amd.com%7C7a299e0e845242312acb08d793a36e63%7C3dd896
> 1fe4884
> >
> e608e11a82d994e183d%7C0%7C0%7C637140202457938159&amp;sdata=3DyK4I
> 7fgenrR
> > f%2FXrs5jKXv%2BmOZdjV7dl%2BiNUJcsxnXG0%3D&amp;reserved=3D0
> =

> --
> Ville Syrj=E4l=E4
> Intel
--
Best regards,
Wayne Lin
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

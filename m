Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E5612D5FD
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2019 04:30:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ED806E0C4;
	Tue, 31 Dec 2019 03:30:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690076.outbound.protection.outlook.com [40.107.69.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EE4889A92;
 Tue, 31 Dec 2019 03:30:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jzXiBmvn+gZoO2rUvtB4Mq1Byoc61BffLWzVpZeEkiDAxTQjzA5PTsQ7HxKzgIFj7Fdb7JzkGwxLo5Yj+8CnIvFxsILW2AUQMyaduib78sLACoFTGdl82H+Q5I+/oZCjVWHUMWwfNr0TviC+G/mKD5bYfKmW4XUhQlen6VsWXYpKmxuhRtX5SGy83mSbAVMbodhpsfQ+O33oSfvEK+tTCwnMcj6thUSWvjQyHhCSys7ZGLgj7VNmdPeSTwWeKDbfmQCaopAVW58mIyMA/B9vNyPkPe5oHSTKCtrpssOx8m6JDYdi3vRTpLeawTuwqipXqwgm7ZWFF6nKqcBU8DKLdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=El2eVlz34kUrKztdkmolutY+Rr4Fj8qtHXcw3A8VILA=;
 b=H8JWM30SRmVHVJKuvO5h8I5u73vf7spg9Xe4WbXI0MrFU+tvcV4a5LjWu66WuHMSV3N89HSfN9OU3Fg+QmE7IjEybROKVz7UgLfd3UDXyOsDIOrTbq/zo4/HNyaMoagTaqA+o8azKyKM/gboomBQ23Ry3UPA241QejbDuLR5qgA58tfCoeUoV8gD6eWBjUPHMq87iyebDPTMHsw7h1PN6CK0EFn1WsHhmGweInPzzGY8kIPw92wn1mV5xi8KRRTpjneS1unhLKr/9ikOqDtu9J+JnGB26E3dHsUOf9wXvvot4dcuyNsAbK98H5cSoPbG/O9tPlsIb2kxbQJWG1+KgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=El2eVlz34kUrKztdkmolutY+Rr4Fj8qtHXcw3A8VILA=;
 b=4XIr9oaZY02fFUwJYidGtfgpy5719R8ezvA66VLU2Njl97nJSBO5xXoQPQDq99awPNANOXHsnkMcsrFww1ozH3/YxSluY5fsiM1kBnLy7hvOuM7jrvpVIMhgEYR6FxOsdJh28rQHq7l6RS9k9mEuBSRUxlAPDQaJh6ICV3dtrK0=
Received: from DM6PR12MB4137.namprd12.prod.outlook.com (10.141.186.21) by
 DM6PR12MB3403.namprd12.prod.outlook.com (20.178.31.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2581.11; Tue, 31 Dec 2019 03:30:48 +0000
Received: from DM6PR12MB4137.namprd12.prod.outlook.com
 ([fe80::cd1d:def3:d2df:3882]) by DM6PR12MB4137.namprd12.prod.outlook.com
 ([fe80::cd1d:def3:d2df:3882%7]) with mapi id 15.20.2581.007; Tue, 31 Dec 2019
 03:30:47 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/dp_mst: correct the shifting in DP_REMOTE_I2C_READ
Thread-Topic: [PATCH] drm/dp_mst: correct the shifting in DP_REMOTE_I2C_READ
Thread-Index: AQHVvt+Vr6mTUvDIfkyiL2AEnl/tiqfShykAgAEPZl4=
Date: Tue, 31 Dec 2019 03:30:47 +0000
Message-ID: <DM6PR12MB41375620C8A3030E0C9154CCFC260@DM6PR12MB4137.namprd12.prod.outlook.com>
References: <20191230070516.4760-1-Wayne.Lin@amd.com>,
 <87mubaoyi1.fsf@intel.com>
In-Reply-To: <87mubaoyi1.fsf@intel.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=True;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2019-12-31T03:30:14.707Z;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal
 Distribution
 Only; MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=0;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard; 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Wayne.Lin@amd.com; 
x-originating-ip: [165.204.68.36]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9139edd8-99a6-4e36-a157-08d78da1d3dd
x-ms-traffictypediagnostic: DM6PR12MB3403:|DM6PR12MB3403:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB340326E15B5FBD861ADF29FEFC260@DM6PR12MB3403.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:419;
x-forefront-prvs: 0268246AE7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(376002)(346002)(39860400002)(366004)(189003)(199004)(76116006)(33656002)(71200400001)(8676002)(66446008)(66556008)(64756008)(8936002)(66476007)(66946007)(53546011)(7696005)(26005)(186003)(91956017)(6506007)(9686003)(2906002)(81166006)(81156014)(55016002)(478600001)(5660300002)(54906003)(316002)(110136005)(86362001)(4326008)(52536014)(70780200001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3403;
 H:DM6PR12MB4137.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KAFFeWvbBpNnyypXS6YSPPEhd9ONXmXXparYfBeYs4zpcliAmnqyjgFfpibwR5CW/SKW+YVL4s6AODTeYf1MoscawIqX2rFb1yooZuUFGJz6UsG0FknA61+hRQSJ4MnS8dopTzNfrLQmIio/IP700pCIFz3ljoFgZE6XgqBsTULx8WZgZ/NA8J0gKpgKty5RA7yVh3m638vJIUKwQEWcpSz5NEYeLA1uYBF3hPsKDR3o7rZ9+hwLBraVZrHodR033tseh2IzxdQVf6iFjhCVcUYSpVB+r3+2916IqSmPgTeL0fX4uJuWY5ef2d4YtFfB6CENFOvhAGrgTjHAAGIu3hReFMMF8eqasWayvPc6qMDLsata0Nr54frpf7IuFi7Cg8CgR8FF452AxNsXYcjgGM8BMqg/ziacUX5/djZr73WJAnWIItulPbitFU3ItyOpKnBsLtFgn46hE7KNg2rce/9IVh6bQxbATekcSTzRUvj8hOHfhLcYLdYfSXpMcKWD
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9139edd8-99a6-4e36-a157-08d78da1d3dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Dec 2019 03:30:47.8210 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nZy+uJZQaBm/qy2DhC70Cl8un4LqGgz0rq2D01/iv7GhmXZKuQwoHGRXMj7wglxSeieZRjQ3s645actkDB0TDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3403
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

[AMD Official Use Only - Internal Distribution Only]

> ________________________________________
> From: Jani Nikula <jani.nikula@linux.intel.com>
> Sent: Monday, December 30, 2019 19:15
> To: Lin, Wayne; dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org
> Cc: Zuo, Jerry; Kazlauskas, Nicholas; Lin, Wayne
> Subject: Re: [PATCH] drm/dp_mst: correct the shifting in DP_REMOTE_I2C_READ
>
> On Mon, 30 Dec 2019, Wayne Lin <Wayne.Lin@amd.com> wrote:
> > [Why]
> > According to DP spec, it should shift left 4 digits for NO_STOP_BIT
> > in REMOTE_I2C_READ message. Not 5 digits.
> >
> > [How]
> > Correct the shifting value of NO_STOP_BIT for DP_REMOTE_I2C_READ case in
> > drm_dp_encode_sideband_req().
>
> Which commit introduced the issue? Fixes: tag. Does it need a stable
> backport? Does this fix a user visible bug?
>
> BR,
> Jani.
>
Thanks for your time and reminder.

It seems like the issue has been there since very beginning.(commit: ad7f8a1).
It doesn't introduce user visible bug under my test cases, but this affects the I2C signal
between I2C master and I2C slave. Not pretty sure if there is any eeprom will reset
the written offset once received I2C stop. If so, that might cause wrongly reading EDID.
I will Cc to stable. Thanks.
> > Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
> > ---
> >  drivers/gpu/drm/drm_dp_mst_topology.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
> > index 1d1bfa49ca2b..0557e225ff67 100644
> > --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> > +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> > @@ -393,7 +393,7 @@ drm_dp_encode_sideband_req(const struct drm_dp_sideband_msg_req_body *req,
> >                       memcpy(&buf[idx], req->u.i2c_read.transactions[i].bytes, req->u.i2c_read.transactions[i].num_bytes);
> >                       idx += req->u.i2c_read.transactions[i].num_bytes;
> >
> > -                     buf[idx] = (req->u.i2c_read.transactions[i].no_stop_bit & 0x1) << 5;
> > +                     buf[idx] = (req->u.i2c_read.transactions[i].no_stop_bit & 0x1) << 4;
> >                       buf[idx] |= (req->u.i2c_read.transactions[i].i2c_transaction_delay & 0xf);
> >                       idx++;
> >               }
>
> --
> Jani Nikula, Intel Open Source Graphics Center
--
Wayne Lin
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

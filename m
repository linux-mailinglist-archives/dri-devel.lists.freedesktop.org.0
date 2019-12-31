Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B2C12D60E
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2019 05:00:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6161C892E0;
	Tue, 31 Dec 2019 04:00:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2064.outbound.protection.outlook.com [40.107.237.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62B4989070;
 Tue, 31 Dec 2019 04:00:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SeCqGzE+vsdCXd97/58a2UYE0PxV5cVtC5FF3FHc7pM6m2IxE8eOwsPYca0EcxYHGDZxt8XOubej5gMRx/zwmQ9Dv5nDa4xMnNyZZcSZw1rw7lpMpdB+8uSs/xx5xDM7ADpSK428Iu2I+GidAHCx9RroMUBLqWJn13XzWjMBitdFfTVBwKa/3/m+o+Ev+FenwaJlmandlhTronLdG/NZYXNJrnEnOzz2rgaqZe7Lfmyau9Tar4Tvqt1Kdzmn5GDfCqBCog8KBAiTl9tPBYfwtowRpoAevl0Cbp2f8UF2CbjkFqe8Pe3vYjC0u3socWB5aaUcprW305MF9v4dJ3i/bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FVSyxO0M193UdIl9jGHqGykB3sz1Ag9kLLmD1p3G/Bg=;
 b=kGbJChtuhW3aggqq1vshd7trfPwjJ/wCxRxRn+DDyhCPW6cglvbiMKfHVHPltN9ypocUelOeoVzJjuBWGFuklVRby2AFsPMJG9cqF1dDBO3NrMeSOhoTy2xhQZ3kacrL95tJgVRc/wo6n+SpJPlfO6KY51PM9fL9ctxIwstsLQLe1F18FgQoIEQmklU4wm8j4A/jjZIGqH0XKRI1l10cigJdruAWwV8Adgi+xGDxS/WvL+A57ZDDxd7b5IclCXDkoXaZTKSbwVlAWvqNd17gsazKhCsD5ZtxmyS6g94t6NNcEfcilAENxZsvipyS67hc6KimBs/VBanMdcbR2AVDvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FVSyxO0M193UdIl9jGHqGykB3sz1Ag9kLLmD1p3G/Bg=;
 b=W4I+0sOGuzkIMNNuoL2rshcXfCJ5KSgENV4GYh5iDMaOqRUfkPIDXsxsl3FsUit+gkQp7PsScsQA6viHJCAuguzxPXCtz0mqGUacw7a3aBH9Lfe5/YFGbNj0bOGH2K2n12cUkROu0k9Jis+sKtoMLBO10dn/hO7YaFHGPtsbMN4=
Received: from DM6PR12MB4137.namprd12.prod.outlook.com (10.141.186.21) by
 DM6PR12MB3084.namprd12.prod.outlook.com (20.178.29.217) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2581.12; Tue, 31 Dec 2019 04:00:02 +0000
Received: from DM6PR12MB4137.namprd12.prod.outlook.com
 ([fe80::cd1d:def3:d2df:3882]) by DM6PR12MB4137.namprd12.prod.outlook.com
 ([fe80::cd1d:def3:d2df:3882%7]) with mapi id 15.20.2581.007; Tue, 31 Dec 2019
 04:00:01 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
To: "Wentland, Harry" <Harry.Wentland@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/dp_mst: correct the shifting in DP_REMOTE_I2C_READ
Thread-Topic: [PATCH] drm/dp_mst: correct the shifting in DP_REMOTE_I2C_READ
Thread-Index: AQHVvt+Vr6mTUvDIfkyiL2AEnl/tiqfSzS0AgADKgzg=
Date: Tue, 31 Dec 2019 04:00:01 +0000
Message-ID: <DM6PR12MB413708FA6DB61C4CCE1ADFECFC260@DM6PR12MB4137.namprd12.prod.outlook.com>
References: <20191230070516.4760-1-Wayne.Lin@amd.com>,
 <084e73fe-0f8c-a9da-3b20-0dc6804e8602@amd.com>
In-Reply-To: <084e73fe-0f8c-a9da-3b20-0dc6804e8602@amd.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=True;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2019-12-31T03:59:28.600Z;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal
 Distribution
 Only; MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=0;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard; 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Wayne.Lin@amd.com; 
x-originating-ip: [165.204.68.36]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c05480e5-cfd7-49b6-90b2-08d78da5e943
x-ms-traffictypediagnostic: DM6PR12MB3084:|DM6PR12MB3084:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB3084FA61DFB432A87B5C338EFC260@DM6PR12MB3084.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:243;
x-forefront-prvs: 0268246AE7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(346002)(376002)(396003)(39860400002)(199004)(189003)(4326008)(478600001)(71200400001)(6506007)(66476007)(64756008)(66446008)(66946007)(9686003)(8936002)(66556008)(55016002)(76116006)(91956017)(33656002)(52536014)(5660300002)(7696005)(86362001)(53546011)(26005)(4001150100001)(8676002)(186003)(2906002)(54906003)(110136005)(81166006)(316002)(81156014)(70780200001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3084;
 H:DM6PR12MB4137.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fy55bL+6jlG5C38BQy+zoIfTXhGN5JP2rohRYyXMPpJX/WLwmVqcp6ei9aFvZhOn3GKlciZ0X5PongxDnNZADCO3Zm3965opumv5xsCdAnCT6Mnl44wkIaWV4rALExhUoyaOiPK/ZglnDA9rJb3zwK3Fm6M7FbO+xMZcdHaC2Cbvz8us91dq7P+HPwruhCq+Qo6vq3vsldd+q7tBdCaLDYY7TyxF5zoF6UytgWY2lQ4YyuuVLikFTKhzgmftULG7dSsz0fC/VsQGLeoZG6X55wg/QFs3R+C1fYTWg/ECPdzR5qNaquFWGaQ1WGb5aXxo7bBYTmpkTd3Tl61HOtxaTGwzotR2VE0zKyCN9lpZVQKoaGCpQlEl3tzDwg7vY0chspth0+EKeScl0Jlguh3HFycpLCWgFh9+xmQiz/BzCQSuWdqxi56uGvl5a9D22vsFN6JUlq47iB3UmuqOX+aJsTdBG5qHPdvw3JMrq+adD921HV/tN6nIuBaM5U37qy2Z
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c05480e5-cfd7-49b6-90b2-08d78da5e943
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Dec 2019 04:00:01.7549 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wpHjf72SPYyZyUKYwfajhAgQiufJsRtTlOSuR6C97/LMbVk23R6R/TK5GmHywtMG1Zz1kI2Se7fn3q9Gu0HYpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3084
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
> From: Wentland, Harry <Harry.Wentland@amd.com>
> Sent: Monday, December 30, 2019 23:26
> To: Lin, Wayne; dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org
> Cc: lyude@redhat.com; Zuo, Jerry; Kazlauskas, Nicholas; Wentland, Harry
> Subject: Re: [PATCH] drm/dp_mst: correct the shifting in DP_REMOTE_I2C_READ
>
> On 2019-12-30 2:05 a.m., Wayne Lin wrote:
> > [Why]
> > According to DP spec, it should shift left 4 digits for NO_STOP_BIT
> > in REMOTE_I2C_READ message. Not 5 digits.
> >
> > [How]
> > Correct the shifting value of NO_STOP_BIT for DP_REMOTE_I2C_READ case in
> > drm_dp_encode_sideband_req().
> >
> > Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
>
> Good catch. Looks like this has been there since the beginning of MST in
> the kernel. How did you find this? Did this cause bad EDID reads or some
> other problem? If so the commit message should probably mention it.
>
> Harry
Thanks for your time.

I found this while I was trying to debug MST issues by using AUX monitor.
So far, I don't observe problems that relate to this under my test cases and environment.
However, this bit might affect the I2C signal generated by I2C master, I will mention more
in the commit message.

Thanks.
>
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
> >
--
Wayne Lin
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD20A1416E7
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jan 2020 10:55:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A37106F9E4;
	Sat, 18 Jan 2020 09:55:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com
 [148.163.135.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCE266E4F8
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2020 12:52:10 +0000 (UTC)
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
 by mx0a-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00HCl1wD007167; Fri, 17 Jan 2020 07:51:45 -0500
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
 by mx0a-00128a01.pphosted.com with ESMTP id 2xk0tq1ksa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jan 2020 07:51:44 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UNYXcL9YL9Z3jnf8Rze7QESb7BSiLqfSx91XDDAFCsvsPR1ZWAqh8RPFy53YIgg3Rmxc+7HXeLALHmktCKZvkrQk4BQ0IviIaws7KPbpBT7cyDGvQl691Z2yR3TrM32jIb9L5evOe9JJBkjLVRvU/Ts91m3VCkUHtVW3DT08CoH4rYZyIVuJct0GldoWYHqUXDloSlQWzrWZmBj6/hvwH0XMfKJLU+/Y5o2E/jYvWA5WJa9uVz5LxIviCQ/cL6PCCky0Sai6VWmiti+o4w+d0AwpaXmzJGqru6b/C41+gPc00Aoa+SKXtppl/wBXUFGzbvHsBjwgCYYLyA1eegk5HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P+Kr1q1/99ERNli7/gU7iPXcjG4R3C2UYV7eSH2qgXo=;
 b=eWyIrMIFcnjaEyvNJgNwCODGJg82Xb0sE0n+BfIJKfFaLfOzVvPro1OAHqGqDiHgfLeMQDJ2MGeif/4A4w8DCtrn68Lsb0SioBG9uW6qXyECy6zMda0KSzNSoGK7TL9w9RtsoxKDFBRkb8IRtIowWOn3n/YQ3uc36dGZlT1EAYf1rs0rertMUHskrWjcL5FeeLQNVN7GuPSucahKBKfZyuL98+VC9sJItzfVnsZgn6tz/qxDhGq9W3XAHIosBjoCqOEv2epU85Nl1kT6jSuwq5HWgTQO0xah1FAZpq3r3keBzgGkSE1vC3xuPfOD0hgWWM4Wt8+cUmSsweQOr7WaCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P+Kr1q1/99ERNli7/gU7iPXcjG4R3C2UYV7eSH2qgXo=;
 b=j/mfGuN/nNHuCPmk5/4EPYeDlVRJpxcMfmpRV6dEFDo7lnVQgiyluKnknefUKVKwGy/UTtrqyk+1KcR6KppPDridq9kvic74075r7tKz6vvBOJ+bMlJp4CGWivEcDk5+S+v0A0C2SrIbkWYKZeczUvmKmxS2fvMhOuHAD3ZM6hI=
Received: from DM6PR03MB5274.namprd03.prod.outlook.com (10.186.143.142) by
 DM6PR03MB3436.namprd03.prod.outlook.com (20.176.87.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.20; Fri, 17 Jan 2020 12:51:43 +0000
Received: from DM6PR03MB5274.namprd03.prod.outlook.com
 ([fe80::a873:2c45:8e7d:b826]) by DM6PR03MB5274.namprd03.prod.outlook.com
 ([fe80::a873:2c45:8e7d:b826%7]) with mapi id 15.20.2644.023; Fri, 17 Jan 2020
 12:51:43 +0000
From: "Togorean, Bogdan" <Bogdan.Togorean@analog.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "a.hajda@samsung.com" <a.hajda@samsung.com>
Subject: Re: [RESEND v3 2/2] drm: bridge: adv7511: Add support for ADV7535
Thread-Topic: [RESEND v3 2/2] drm: bridge: adv7511: Add support for ADV7535
Thread-Index: AQHVxV/QIBHqhe06mEOpF9riXPTW9afutrEAgAAH0QCAACB4gA==
Date: Fri, 17 Jan 2020 12:51:42 +0000
Message-ID: <8757b167c45bcab6b51cad923ddf26e0751a51e9.camel@analog.com>
References: <20200107133431.5201-1-bogdan.togorean@analog.com>
 <CGME20200107133859epcas4p45949a65be83ba877e98548d77279666c@epcas4p4.samsung.com>
 <20200107133431.5201-3-bogdan.togorean@analog.com>
 <982e6232-f257-86d2-3ca0-3a99daec3767@samsung.com>
 <97b4a2c6-2c2e-f486-f454-c340a0c3038c@samsung.com>
In-Reply-To: <97b4a2c6-2c2e-f486-f454-c340a0c3038c@samsung.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.71.226.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d3c51cb0-d8ab-4c59-aadb-08d79b4c00ed
x-ms-traffictypediagnostic: DM6PR03MB3436:
x-microsoft-antispam-prvs: <DM6PR03MB3436EB3FC0549CD1D940A0739B310@DM6PR03MB3436.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0285201563
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(366004)(376002)(346002)(136003)(39860400002)(189003)(199004)(6506007)(26005)(53546011)(5660300002)(30864003)(6486002)(2906002)(66946007)(54906003)(36756003)(64756008)(76116006)(110136005)(66446008)(66476007)(6512007)(91956017)(66556008)(71200400001)(81166006)(81156014)(2616005)(186003)(7416002)(8936002)(86362001)(316002)(4326008)(478600001)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR03MB3436;
 H:DM6PR03MB5274.namprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: analog.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: G0GGrzYitO8q1TrbPuUuv+BVwqqvL6LUwRFq7GOV2V6kiRO2gViGCNGH74UvYpP12h6VLwuSLurgkdAyxwD28QCL4M0R5DE+nvntLGmSUWnqaLt4l0hJEjBc+Vrs5v+KVEjfXVSIxppqiSw8okIb8hgDF2pjjjptqKdY2hvUK1cOSNTp8Q0WoYvXyQCeXwBV405JFDf/nNlZUNA1sv1u69Q9LVF/GFkuXotfFA5gESM5LkmeIJSVGlTN30aixzrY+XbUDn8A2QS7vljIMdYV+YOzlvuVtk01WicwhhxZAxkyaJMCti+m8RbsVgHyc9AUE+BhfVog5diFuH6NN0TBqJBelpVfvK/CNpJ3Uxa6evKQjR+DCtfiGu/dMH8abSan7wGSvLFVoEtiJ0zPPOY6axmm07/7CTVOOgSL2Iv/5j/lViK68m8maUH6bA8FBZFH
x-ms-exchange-transport-forked: True
Content-ID: <C7037E80D5C9844F8637B47B5B33B93B@namprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3c51cb0-d8ab-4c59-aadb-08d79b4c00ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2020 12:51:42.8901 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +I8xPXB7CnSMxg03x3d91xI8ORKRiDgGb8usmqU/+xqd1Q8u1i5+NHAvf4oPfr1oHhcH69i7Lyqlg03LiFBy2Xr4MAkLmoJUzbxeh+0uLN8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3436
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-17_03:2020-01-16,
 2020-01-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 mlxlogscore=999
 clxscore=1015 impostorscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1910280000
 definitions=main-2001170102
X-Mailman-Approved-At: Sat, 18 Jan 2020 09:55:11 +0000
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
Cc: "robdclark@chromium.org" <robdclark@chromium.org>,
 "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "jernej.skrabec@siol.net" <jernej.skrabec@siol.net>,
 "narmstrong@baylibre.com" <narmstrong@baylibre.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "sam@ravnborg.org" <sam@ravnborg.org>,
 "matt.redfearn@thinci.com" <matt.redfearn@thinci.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2020-01-17 at 11:55 +0100, Andrzej Hajda wrote:
> [External]
> 
> On 17.01.2020 11:27, Andrzej Hajda wrote:
> > On 07.01.2020 14:34, Bogdan Togorean wrote:
> > > ADV7535 is a DSI to HDMI bridge chip like ADV7533 but it allows
> > > 1080p@60Hz. v1p2 is fixed to 1.8V on ADV7535 but on ADV7533 can
> > > be 1.2V
> > > or 1.8V and is configurable in a register.
> > > 
> > > Signed-off-by: Bogdan Togorean <bogdan.togorean@analog.com>
> > > ---
> > >  drivers/gpu/drm/bridge/adv7511/Kconfig       | 13 ++----
> > >  drivers/gpu/drm/bridge/adv7511/Makefile      |  3 +-
> > >  drivers/gpu/drm/bridge/adv7511/adv7511.h     | 44 +++-----------
> > > ------
> > >  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 35 ++++++++++--
> > > ----
> > >  4 files changed, 32 insertions(+), 63 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/bridge/adv7511/Kconfig
> > > b/drivers/gpu/drm/bridge/adv7511/Kconfig
> > > index 8a56ff81f4fb..47d4eb9e845d 100644
> > > --- a/drivers/gpu/drm/bridge/adv7511/Kconfig
> > > +++ b/drivers/gpu/drm/bridge/adv7511/Kconfig
> > > @@ -4,8 +4,9 @@ config DRM_I2C_ADV7511
> > >  	depends on OF
> > >  	select DRM_KMS_HELPER
> > >  	select REGMAP_I2C
> > > +	select DRM_MIPI_DSI
> > >  	help
> > > -	  Support for the Analog Device ADV7511(W) and ADV7513 HDMI
> > > encoders.
> > > +	  Support for the Analog Device ADV7511(W)/13/33/35 HDMI
> > > encoders.
> > >  
> > >  config DRM_I2C_ADV7511_AUDIO
> > >  	bool "ADV7511 HDMI Audio driver"
> > > @@ -15,16 +16,8 @@ config DRM_I2C_ADV7511_AUDIO
> > >  	  Support the ADV7511 HDMI Audio interface. This is used in
> > >  	  conjunction with the AV7511  HDMI driver.
> > >  
> > > -config DRM_I2C_ADV7533
> > > -	bool "ADV7533 encoder"
> > > -	depends on DRM_I2C_ADV7511
> > > -	select DRM_MIPI_DSI
> > > -	default y
> > > -	help
> > > -	  Support for the Analog Devices ADV7533 DSI to HDMI encoder.
> > > -
> > >  config DRM_I2C_ADV7511_CEC
> > > -	bool "ADV7511/33 HDMI CEC driver"
> > > +	bool "ADV7511/33/35 HDMI CEC driver"
> > >  	depends on DRM_I2C_ADV7511
> > >  	select CEC_CORE
> > >  	default y
> > > diff --git a/drivers/gpu/drm/bridge/adv7511/Makefile
> > > b/drivers/gpu/drm/bridge/adv7511/Makefile
> > > index b46ebeb35fd4..d8ceb534b51f 100644
> > > --- a/drivers/gpu/drm/bridge/adv7511/Makefile
> > > +++ b/drivers/gpu/drm/bridge/adv7511/Makefile
> > > @@ -1,6 +1,5 @@
> > >  # SPDX-License-Identifier: GPL-2.0-only
> > > -adv7511-y := adv7511_drv.o
> > > +adv7511-y := adv7511_drv.o adv7533.o
> > >  adv7511-$(CONFIG_DRM_I2C_ADV7511_AUDIO) += adv7511_audio.o
> > >  adv7511-$(CONFIG_DRM_I2C_ADV7511_CEC) += adv7511_cec.o
> > > -adv7511-$(CONFIG_DRM_I2C_ADV7533) += adv7533.o
> > >  obj-$(CONFIG_DRM_I2C_ADV7511) += adv7511.o
> > > diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h
> > > b/drivers/gpu/drm/bridge/adv7511/adv7511.h
> > > index 52b2adfdc877..ed9cfd944098 100644
> > > --- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
> > > +++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
> > > @@ -220,6 +220,10 @@
> > >  
> > >  #define ADV7533_REG_CEC_OFFSET		0x70
> > >  
> > > +#define ADV7533_REG_SUPPLY_SELECT	0xe4
> > > +
> > > +#define ADV7533_V1P2_ENABLE		BIT(7)
> > > +
> > >  enum adv7511_input_clock {
> > >  	ADV7511_INPUT_CLOCK_1X,
> > >  	ADV7511_INPUT_CLOCK_2X,
> > > @@ -320,6 +324,7 @@ struct adv7511_video_config {
> > >  enum adv7511_type {
> > >  	ADV7511,
> > >  	ADV7533,
> > > +	ADV7535,
> > >  };
> > >  
> > >  #define ADV7511_MAX_ADDRS 3
> > > @@ -393,7 +398,6 @@ static inline int adv7511_cec_init(struct
> > > device *dev, struct adv7511 *adv7511)
> > >  }
> > >  #endif
> > >  
> > > -#ifdef CONFIG_DRM_I2C_ADV7533
> > >  void adv7533_dsi_power_on(struct adv7511 *adv);
> > >  void adv7533_dsi_power_off(struct adv7511 *adv);
> > >  void adv7533_mode_set(struct adv7511 *adv, const struct
> > > drm_display_mode *mode);
> > > @@ -402,44 +406,6 @@ int adv7533_patch_cec_registers(struct
> > > adv7511 *adv);
> > >  int adv7533_attach_dsi(struct adv7511 *adv);
> > >  void adv7533_detach_dsi(struct adv7511 *adv);
> > >  int adv7533_parse_dt(struct device_node *np, struct adv7511
> > > *adv);
> > > -#else
> > > -static inline void adv7533_dsi_power_on(struct adv7511 *adv)
> > > -{
> > > -}
> > > -
> > > -static inline void adv7533_dsi_power_off(struct adv7511 *adv)
> > > -{
> > > -}
> > > -
> > > -static inline void adv7533_mode_set(struct adv7511 *adv,
> > > -				    const struct drm_display_mode
> > > *mode)
> > > -{
> > > -}
> > > -
> > > -static inline int adv7533_patch_registers(struct adv7511 *adv)
> > > -{
> > > -	return -ENODEV;
> > > -}
> > > -
> > > -static inline int adv7533_patch_cec_registers(struct adv7511
> > > *adv)
> > > -{
> > > -	return -ENODEV;
> > > -}
> > > -
> > > -static inline int adv7533_attach_dsi(struct adv7511 *adv)
> > > -{
> > > -	return -ENODEV;
> > > -}
> > > -
> > > -static inline void adv7533_detach_dsi(struct adv7511 *adv)
> > > -{
> > > -}
> > > -
> > > -static inline int adv7533_parse_dt(struct device_node *np,
> > > struct adv7511 *adv)
> > > -{
> > > -	return -ENODEV;
> > > -}
> > > -#endif
> > >  
> > >  #ifdef CONFIG_DRM_I2C_ADV7511_AUDIO
> > >  int adv7511_audio_init(struct device *dev, struct adv7511
> > > *adv7511);
> > > diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > > b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > > index 9e13e466e72c..35595472e771 100644
> > > --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > > +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > > @@ -367,7 +367,7 @@ static void adv7511_power_on(struct adv7511
> > > *adv7511)
> > >  	 */
> > >  	regcache_sync(adv7511->regmap);
> > >  
> > > -	if (adv7511->type == ADV7533)
> > > +	if (adv7511->type == ADV7533 || adv7511->type == ADV7535)
> > >  		adv7533_dsi_power_on(adv7511);
> > >  	adv7511->powered = true;
> > >  }
> > > @@ -387,7 +387,7 @@ static void __adv7511_power_off(struct
> > > adv7511 *adv7511)
> > >  static void adv7511_power_off(struct adv7511 *adv7511)
> > >  {
> > >  	__adv7511_power_off(adv7511);
> > > -	if (adv7511->type == ADV7533)
> > > +	if (adv7511->type == ADV7533 || adv7511->type == ADV7535)
> > >  		adv7533_dsi_power_off(adv7511);
> > >  	adv7511->powered = false;
> > >  }
> > > @@ -761,7 +761,7 @@ static void adv7511_mode_set(struct adv7511
> > > *adv7511,
> > >  	regmap_update_bits(adv7511->regmap, 0x17,
> > >  		0x60, (vsync_polarity << 6) | (hsync_polarity << 5));
> > >  
> > > -	if (adv7511->type == ADV7533)
> > > +	if (adv7511->type == ADV7533 || adv7511->type == ADV7535)
> > >  		adv7533_mode_set(adv7511, adj_mode);
> > >  
> > >  	drm_mode_copy(&adv7511->curr_mode, adj_mode);
> > > @@ -874,7 +874,7 @@ static int adv7511_bridge_attach(struct
> > > drm_bridge *bridge)
> > >  				 &adv7511_connector_helper_funcs);
> > >  	drm_connector_attach_encoder(&adv->connector, bridge->encoder);
> > >  
> > > -	if (adv->type == ADV7533)
> > > +	if (adv->type == ADV7533 || adv->type == ADV7535)
> > >  		ret = adv7533_attach_dsi(adv);
> > >  
> > >  	if (adv->i2c_main->irq)
> > > @@ -903,6 +903,7 @@ static const char * const
> > > adv7511_supply_names[] = {
> > >  	"dvdd-3v",
> > >  };
> > >  
> > > +/* The order of entries is important. If changed update
> > > hardcoded indices */
> > >  static const char * const adv7533_supply_names[] = {
> > >  	"avdd",
> > >  	"dvdd",
> > > @@ -952,7 +953,7 @@ static bool
> > > adv7511_cec_register_volatile(struct device *dev, unsigned int
> > > reg)
> > >  	struct i2c_client *i2c = to_i2c_client(dev);
> > >  	struct adv7511 *adv7511 = i2c_get_clientdata(i2c);
> > >  
> > > -	if (adv7511->type == ADV7533)
> > > +	if (adv7511->type == ADV7533 || adv7511->type == ADV7535)
> > >  		reg -= ADV7533_REG_CEC_OFFSET;
> > >  
> > >  	switch (reg) {
> > > @@ -994,7 +995,7 @@ static int adv7511_init_cec_regmap(struct
> > > adv7511 *adv)
> > >  		goto err;
> > >  	}
> > >  
> > > -	if (adv->type == ADV7533) {
> > > +	if (adv->type == ADV7533 || adv->type == ADV7535) {
> > >  		ret = adv7533_patch_cec_registers(adv);
> > >  		if (ret)
> > >  			goto err;
> > > @@ -1094,8 +1095,9 @@ static int adv7511_probe(struct i2c_client
> > > *i2c, const struct i2c_device_id *id)
> > >  	struct adv7511_link_config link_config;
> > >  	struct adv7511 *adv7511;
> > >  	struct device *dev = &i2c->dev;
> > > +	struct regulator *reg_v1p2;
> > >  	unsigned int val;
> > > -	int ret;
> > > +	int ret, reg_v1p2_uV;
> > >  
> > >  	if (!dev->of_node)
> > >  		return -EINVAL;
> > > @@ -1163,6 +1165,17 @@ static int adv7511_probe(struct i2c_client
> > > *i2c, const struct i2c_device_id *id)
> > >  	if (ret)
> > >  		goto uninit_regulators;
> > >  
> > > +	if (adv7511->type == ADV7533) {
> > > +		reg_v1p2 = adv7511->supplies[5].consumer;
> > > +		reg_v1p2_uV = regulator_get_voltage(reg_v1p2);
> > > +
> > > +		if (reg_v1p2_uV == 1200000) {
> > > +			regmap_update_bits(adv7511->regmap,
> > > +				ADV7533_REG_SUPPLY_SELECT,
> > > ADV7533_V1P2_ENABLE,
> > > +				ADV7533_V1P2_ENABLE);
> > > +		}
> > > +	}
> > > +
> > 
> > In patch adding support for adv7535 you modifies adv7533 path. It
> > looks
> > suspicious, maybe it would be better to extract it to separate
> > patch.
> > Anyway this change requires tests from adv7533 users.
> 
> One more thing, maybe it would be better to add some tolerance to
> 1.2V
> test, quick look at public datasheet suggest +/- 0.06V.
> 
> 
> Regards
> 
> Andrzej

Thank you Andrzej for review.

I'll create separate patch for ADV7533 voltage selection and send V4.

Regards,
Bogdan
> 
> 
> > Beside this the patch looks OK.
> > 
> > 
> > Regards
> > 
> > Andrzej
> > 
> > 
> > >  	adv7511_packet_disable(adv7511, 0xffff);
> > >  
> > >  	adv7511->i2c_edid = i2c_new_ancillary_device(i2c, "edid",
> > > @@ -1242,7 +1255,7 @@ static int adv7511_remove(struct i2c_client
> > > *i2c)
> > >  {
> > >  	struct adv7511 *adv7511 = i2c_get_clientdata(i2c);
> > >  
> > > -	if (adv7511->type == ADV7533)
> > > +	if (adv7511->type == ADV7533 || adv7511->type == ADV7535)
> > >  		adv7533_detach_dsi(adv7511);
> > >  	i2c_unregister_device(adv7511->i2c_cec);
> > >  	if (adv7511->cec_clk)
> > > @@ -1266,9 +1279,8 @@ static const struct i2c_device_id
> > > adv7511_i2c_ids[] = {
> > >  	{ "adv7511", ADV7511 },
> > >  	{ "adv7511w", ADV7511 },
> > >  	{ "adv7513", ADV7511 },
> > > -#ifdef CONFIG_DRM_I2C_ADV7533
> > >  	{ "adv7533", ADV7533 },
> > > -#endif
> > > +	{ "adv7535", ADV7535 },
> > >  	{ }
> > >  };
> > >  MODULE_DEVICE_TABLE(i2c, adv7511_i2c_ids);
> > > @@ -1277,9 +1289,8 @@ static const struct of_device_id
> > > adv7511_of_ids[] = {
> > >  	{ .compatible = "adi,adv7511", .data = (void *)ADV7511 },
> > >  	{ .compatible = "adi,adv7511w", .data = (void *)ADV7511 },
> > >  	{ .compatible = "adi,adv7513", .data = (void *)ADV7511 },
> > > -#ifdef CONFIG_DRM_I2C_ADV7533
> > >  	{ .compatible = "adi,adv7533", .data = (void *)ADV7533 },
> > > -#endif
> > > +	{ .compatible = "adi,adv7535", .data = (void *)ADV7535 },
> > >  	{ }
> > >  };
> > >  MODULE_DEVICE_TABLE(of, adv7511_of_ids);
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

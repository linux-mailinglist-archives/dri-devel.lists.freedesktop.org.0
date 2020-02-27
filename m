Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7ABA171802
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 13:59:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE1DE6ECA0;
	Thu, 27 Feb 2020 12:59:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2051.outbound.protection.outlook.com [40.107.244.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C2E36EC48
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 08:40:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JxE0i9CKmdOWG7zgJeuvOoncSymLINJmwnR5tzC32o7PNgKaFimnhGoRuHSD1bCs3cEwoMSpfdfmLHTKzYy4bcq26KOwXEpZ/6UJpXgMME0aABUEZXf3k51TZVZOEsGSkDfzGXPUF7O2DLmuB14AbRJcA/R9vgOVDMfAmXtFfdrgVqNc0iTRofo7REuUsjw8Dc2Z911r47ozFXK2wfDg1MZXyvhUeQ0lhXlYpXD/btGcwROGUhdQPK7OCqGxsF+5zUQEgRtUrvbCnCqiu3DrNfheGDOBorF8lRbMnmwa0g3j/hPQOHM0U3n/2hT9RhiCIWTZjUxMvEtnxnWmolZTEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i0H9dWV5GDFS14c27Er7qxh3A2SGexAuvCXugA/GLGA=;
 b=BKJhM55c0F/CHGA5qGkMqjOiFaWXwTZRNGmpLTz3jcBZ/BUq+v/0AgcHrbzy/LHBriej26dO2z8j/X4gAvpNOBUtgUZ1lyA8J7uS/sPIgZKcoZVgaTyb35n/FOYkUr/RAfshy2vufTRor/8gbajppwlVaChRbfP2Pngdn7g7d7eQLTpflD72PtG13xVvQcLxAKy8r2OMv7Tbb2b0YCxp2Ky61HtdJIUA77tguVZWlQmXcZiVVqC732K74XvgazL5y0UTxxpVVXEI5GSG2uuW54VUVL7svMOJq+YtB89KyQbRb36l99pGxNuqNRA9BO2x7iSmEokHkLvjWsSDF+/ejA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i0H9dWV5GDFS14c27Er7qxh3A2SGexAuvCXugA/GLGA=;
 b=gWQIbFQjywX+rPlTRxOoaxtl1Lj0CvfzMJIcQ+kGCB+hV7zVHyDeC7zEr+tWKP+dnmsV5yr2ygPMKILbuOf5BuUWkd/pGWPi7O26IPxH8SdSVaCAqxfWflhak2/CB9bCWvZFp1bnLC8VsTljdYMFrJPNNSzmIhw6DXY0cNoDVVk=
Received: from BYAPR02MB4056.namprd02.prod.outlook.com (2603:10b6:a02:fa::20)
 by BYAPR02MB4566.namprd02.prod.outlook.com (2603:10b6:a03:57::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.22; Thu, 27 Feb
 2020 08:40:21 +0000
Received: from BYAPR02MB4056.namprd02.prod.outlook.com
 ([fe80::9dc8:cb6d:9584:576e]) by BYAPR02MB4056.namprd02.prod.outlook.com
 ([fe80::9dc8:cb6d:9584:576e%7]) with mapi id 15.20.2750.021; Thu, 27 Feb 2020
 08:40:20 +0000
From: Rohit Visavalia <RVISAVAL@xilinx.com>
To: Rohit Visavalia <RVISAVAL@xilinx.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "imirkin@alum.mit.edu"
 <imirkin@alum.mit.edu>, "emil.velikov@collabora.com"
 <emil.velikov@collabora.com>
Subject: RE: [PATCH libdrm] modetest: call drmModeCrtcSetGamma() only if
 add_property_optional returns true
Thread-Topic: [PATCH libdrm] modetest: call drmModeCrtcSetGamma() only if
 add_property_optional returns true
Thread-Index: AQHV679WeVrf3O3SQkeitn5ZLHO5bqguuqpw
Date: Thu, 27 Feb 2020 08:40:20 +0000
Message-ID: <BYAPR02MB40561FBCE7FCCF6ECAA96BF5B3EB0@BYAPR02MB4056.namprd02.prod.outlook.com>
References: <1582623496-6094-1-git-send-email-rohit.visavalia@xilinx.com>
In-Reply-To: <1582623496-6094-1-git-send-email-rohit.visavalia@xilinx.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=RVISAVAL@xilinx.com; 
x-originating-ip: [149.199.62.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: bcc81001-057b-48a8-7f5a-08d7bb60ae24
x-ms-traffictypediagnostic: BYAPR02MB4566:|BYAPR02MB4566:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR02MB456683314F877D65D47B0CA2B3EB0@BYAPR02MB4566.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2000;
x-forefront-prvs: 03264AEA72
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(39860400002)(366004)(346002)(396003)(189003)(199004)(7696005)(66446008)(55016002)(66946007)(86362001)(107886003)(66476007)(52536014)(5660300002)(66556008)(4326008)(54906003)(6506007)(81166006)(110136005)(81156014)(64756008)(76116006)(316002)(71200400001)(53546011)(8936002)(186003)(33656002)(2906002)(478600001)(26005)(8676002)(9686003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR02MB4566;
 H:BYAPR02MB4056.namprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: xilinx.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: t6UfJEGpMGHLO6amo7aSHELMV5us2GE+mG9NjaRwUwdJyQ+aKun0Mgu60a2wonqs2oCFnjqZMv+OocPRqEP3s+llwgaGH2egz97uoWBBUd3Ty6060oH0vyV/VTNybOnV0ieDkHgi0Fb+ykIoT1YMMNyflm1+2CbCWFR9MQgB9JV0YkYdYVwl25HexFJ99uQL9UiGUAh4cQjatNtqE/HZsXiqdFG0+Fde0giM1IOt66QzUrqzM+N51obWUyu2ZcVknjdGXNOO9dTjsVhqLk0teyTGP5o5pHz0Vwxf82WQAvVNZQVfZ4rNn4xGNoqHV5Gv6HKQmw5Fek02V7bJvqWKcEf7d9OMhYkyUmTJUquVfblKdSDMX6zvJaks4r0rokqti+24VMwsSzKQXWH+NV/BEIKobSHp+87oG33oKe5WD4LDzf9nbEipF7FEJ6kpEkLd
x-ms-exchange-antispam-messagedata: OBrcNkvUQIoNUh5CktFsbxlJseq6snRnD5x/gDaUoms6UZHJPFnEWg4VFJ3nD/8S3Rxjpmu2N6urG9s4j+Hy/2+9IyLCevgTeXZYHClIStMSJUZvm4LIMfdo2RNmNVI8xwBB8nqe7g4RqcF8bDGkEg==
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcc81001-057b-48a8-7f5a-08d7bb60ae24
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2020 08:40:20.7457 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zvu7X6Ytxo3d+sjraDMJp9FBASv73pAKTjhs/6+900F49iMZkbWgpFW8H6A+VBJuOMVZ0Zvcy/DKL+HfzxqYDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4566
X-Mailman-Approved-At: Thu, 27 Feb 2020 12:59:10 +0000
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
Cc: Ranganathan Sk <rsk@xilinx.com>,
 Varunkumar Allagadapa <VARUNKUM@xilinx.com>,
 Devarsh Thakkar <DEVARSHT@xilinx.com>,
 Dhaval Rajeshbhai Shah <dshah@xilinx.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Gentle reminder.

+ Ilia Mirkin, +Emil Velikov.

Thanks & Regards,
Rohit 

> -----Original Message-----
> From: Rohit Visavalia [mailto:rohit.visavalia@xilinx.com]
> Sent: Tuesday, February 25, 2020 3:08 PM
> To: dri-devel@lists.freedesktop.org
> Cc: Hyun Kwon <hyunk@xilinx.com>; Ranganathan Sk <rsk@xilinx.com>;
> Dhaval Rajeshbhai Shah <dshah@xilinx.com>; Varunkumar Allagadapa
> <VARUNKUM@xilinx.com>; Devarsh Thakkar <DEVARSHT@xilinx.com>; Rohit
> Visavalia <RVISAVAL@xilinx.com>
> Subject: [PATCH libdrm] modetest: call drmModeCrtcSetGamma() only if
> add_property_optional returns true
> 
> gamma is a optional property then also it prints error message, so set gamma
> only if add_property_optional() returns true.
> 
> Signed-off-by: Rohit Visavalia <rohit.visavalia@xilinx.com>
> ---
>  tests/modetest/modetest.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/modetest/modetest.c b/tests/modetest/modetest.c index
> b907ab3..379b9ea 100644
> --- a/tests/modetest/modetest.c
> +++ b/tests/modetest/modetest.c
> @@ -1138,7 +1138,7 @@ static void set_gamma(struct device *dev, unsigned
> crtc_id, unsigned fourcc)
> 
>  	add_property_optional(dev, crtc_id, "DEGAMMA_LUT", 0);
>  	add_property_optional(dev, crtc_id, "CTM", 0);
> -	if (!add_property_optional(dev, crtc_id, "GAMMA_LUT", blob_id)) {
> +	if (add_property_optional(dev, crtc_id, "GAMMA_LUT", blob_id)) {
>  		uint16_t r[256], g[256], b[256];
> 
>  		for (i = 0; i < 256; i++) {
> --
> 2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

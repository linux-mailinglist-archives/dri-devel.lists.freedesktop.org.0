Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5401118FCC
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 19:30:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1CCA6E911;
	Tue, 10 Dec 2019 18:29:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750078.outbound.protection.outlook.com [40.107.75.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 319DD6E911
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 18:29:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oEMVuHLBn1cm+K+wzaWsplWsnyCPMXWCPouCoEcaziPXwEp/riZk9c7xdji+yLaF/a+R3l2vV25gU1vCUKG3dXz9ollglduh28/hXOUlB/CiPgy4sYN102vC1F3q2zfEBEhniqhI5SDq4/q1AcOKEwYU8o4uPW2gsldxkHo7iOTvGU5X2xBZYkqfx31dd42W4gyDUKHnUV0q41sZeGOQpSTRbs9H8oq1290/d0kHKWewgkg5yoI8q+/uR/AZxmXwP3xgUL6faiuRsO+TBSJuX5t6pWSMTYwLv2+WaVwNAgHEJzxoDZYhR3JB4Wdptzhgr6MpbGUyPHM0mqIAEr9Pxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yRUCmULD4HCBLH7Wr/yBrw5jORXn7zPwXK4WRFgumbg=;
 b=OoXIihcVYhca/Iv+Zf23AT+RhvvSixcMcG4kfRSLhdxgpJ0Jx89x2tiliaCS6YjeJudy9xWsCsS9ddb9Um1KgL22ksrFgLywsjB6xggOsvlfTHEyLNW+28ykUIrhpGVZQCTM0PZpdwu1NwzEnb4r2pjNN3JHfsXk/N+EayJnGXNItraWI3bcNZQbGaJ0WSxV44RQ1H1u+4xytn2NAeFEXYy5FWh8JLVrpEZRUtGAU9Uv3Dk9mMonLblu4yZofRnPnony9aORfd6EfFf1at6cjng2gzZkPefPY8Sol9mBoelEMoXEc9DPxwgWGTzwQpQ3MK770DsR6QUsmRLn32IuJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yRUCmULD4HCBLH7Wr/yBrw5jORXn7zPwXK4WRFgumbg=;
 b=jfKdqHG6fsQx4wN1r/rf5CuUr/DtMeqtVhPP2PPI3Z2nmNvL2dSOmOcnGiWObyQrVeeAYlHQsWAip2MQEf04KklMymp5ix5LcgmAeyQ3ZuwMStvR93ylo12SHcPiwxwU42+5ANGXzZQMi1S1aUHFg8FiFhUynb7V6oDpFC4DtfA=
Received: from MN2PR05MB6141.namprd05.prod.outlook.com (20.178.241.217) by
 MN2PR05MB7040.namprd05.prod.outlook.com (52.135.38.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.9; Tue, 10 Dec 2019 18:29:53 +0000
Received: from MN2PR05MB6141.namprd05.prod.outlook.com
 ([fe80::611e:6a6b:9109:5aa8]) by MN2PR05MB6141.namprd05.prod.outlook.com
 ([fe80::611e:6a6b:9109:5aa8%7]) with mapi id 15.20.2538.012; Tue, 10 Dec 2019
 18:29:53 +0000
From: Thomas Hellstrom <thellstrom@vmware.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Linux-graphics-maintainer
 <Linux-graphics-maintainer@vmware.com>, "airlied@linux.ie"
 <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>
Subject: Re: [PATCH v2] drm/vmwgfx: Call vmw_driver_{load,unload}() before
 registering device
Thread-Topic: [PATCH v2] drm/vmwgfx: Call vmw_driver_{load,unload}() before
 registering device
Thread-Index: AQHVr1dxnDZUbhYxE0iPgZhwEMa+JQ==
Date: Tue, 10 Dec 2019 18:29:53 +0000
Message-ID: <MN2PR05MB6141D8BC20D411DDB02F6475A15B0@MN2PR05MB6141.namprd05.prod.outlook.com>
References: <20191210124322.8857-1-tzimmermann@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=thellstrom@vmware.com; 
x-originating-ip: [155.4.205.35]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 24622ebc-92a8-4eac-0c01-08d77d9ef323
x-ms-traffictypediagnostic: MN2PR05MB7040:|MN2PR05MB7040:
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR05MB7040B42A869D22BACFFB1578A15B0@MN2PR05MB7040.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1079;
x-forefront-prvs: 02475B2A01
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(136003)(39860400002)(346002)(396003)(199004)(189003)(7696005)(71200400001)(186003)(53546011)(4326008)(316002)(6506007)(55016002)(9686003)(4744005)(110136005)(478600001)(52536014)(8936002)(64756008)(5660300002)(66446008)(66476007)(76116006)(66946007)(91956017)(81156014)(66556008)(86362001)(33656002)(8676002)(26005)(2906002)(81166006)(142933001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR05MB7040;
 H:MN2PR05MB6141.namprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: vmware.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eaOmgGRP3l545dqEL27mwDcMmS9Kohyu+GCjANUDyLBVXwIGzah3IBEY/+8h7mAjTfvrp0g5OLYLNNmuxOKO1mR/7br1R0IQb3OthCLcliyW7wAM2Ib0UUtEbNzwXXgabnhLtDUxtkwI/aLEOD0AUECAvekki/JcXb2BIQbgPcmv8OJcjx9FuXnWHQFoI138Jm/GjZJypHhvadSLxrLjs8glU+E8hD9/iKYedbehKCP5f+oT2w2kHJRGb8v2C2y0qrP4bw4c3vGtTqVZMVgsNVjKn2a/mn263eJCGTE+oyJrYtJPEWmfDHmUNdbZSeZddgcyZJcwi0pbBlqFA9OoNbr++M6bgtzjr+r7BTUj3oVqv1tgfsD+seHfcpVTQAxAffj5gucMHgyP46AtCRnhreTJo5xpdgLt/WaYi2HDSNiNRzx/80VUCki8HOmxbOMEdCfBfYHpTcEuqaAnjd9DdOLX2uNz3sheww3z+6tUWVveLXfuNOEZ8VE5d025fwvj
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24622ebc-92a8-4eac-0c01-08d77d9ef323
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2019 18:29:53.2820 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hnRIuSmpLP4yeWNvEKDNZ+BcSK+jxkMvzNHoY3wP8Tlp+JoAgC7cjE0i8CT27g/SQdJ5hmq1tZKcIXb3klK6Uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB7040
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

On 12/10/19 1:43 PM, Thomas Zimmermann wrote:
> The load/unload callbacks in struct drm_driver are deprecated. Remove
> them and call functions explicitly.
>
> v2:
> 	* remove accidental whitespace fix
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Thomas Hellstrom <thellstrom@vmware.com>

I'll take this through vmwgfx-next unless told otherwise.

Thanks,

Thomas


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

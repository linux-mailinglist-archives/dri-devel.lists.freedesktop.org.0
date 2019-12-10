Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB1D118542
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 11:37:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEE636E89B;
	Tue, 10 Dec 2019 10:37:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770084.outbound.protection.outlook.com [40.107.77.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8B5B6E89B
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 10:37:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e/fly41Nlm5Fsc+QuNemNkAf21r0QlN5NVfCYUUYSCqOppjovPQ7gJCe9e8Ao4Y9zKOzE5lUC3HWQSDXxj5gQgAHiC3zfCOWXD8kHqP+6ZOnkdk9N5OHkwCmuf0xnoA4d1mut76ECqtm8RBWF3NOWKf8bpb7t/g6b5vCxZ7WDuogPN52i/B0LXlvrTyiny5KoHjpvAHlvMO/ohLHCRdpqHdk6nztlZHR9eOVK+mUz/njQZ5KrnIBZRYhPgS0f1tl5lMCMdQst1Ze97fGUUE2HilRrkjcsR6KtHTwv/T3RL6flOrPQHB2z3TPQYNZnvQ2/9b5ZzGqFm9/q+dmHiJzqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lvS/s9M3aYO7xIjahFMRKZTVYG/KNpMp084sBzC2IzY=;
 b=XwuIHzecnJACpTfD6ht6mMtg36yjWRHBuk/lOL1KZaxdKV3RAMtHvSegRX7kP3+zwdA8ILOc3zHpmL+eR3rEcqnhWFw4NC7l8n+xoQMiBGamXLFbTsCfxQl2oYofcx6m7d2cWmnW9PkPqyqGaO/INPBm8EiJkhnMswwme0fT3ghlJpO29e2pI5lkRPKBWE3hyQFbUKI1nSN+dInuUh28Fmz6ojz3TrEobXxGPMjvQIyD5fzqs5yQeXROXk0oceuOmnzUtONP/dKbQe+3OG8w0dLMUH6QL4pwpIlF2u89J45CZu7tp0RLihaEtE4ScXpwiY9ObxuHSK1b5hhXCdI4bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lvS/s9M3aYO7xIjahFMRKZTVYG/KNpMp084sBzC2IzY=;
 b=l8NmSQetjM1ahFwDE0xqw5NWvhrYI9jQ2wGK3YPO2t8+WT/gGz7GvPtO9pT8G1iSytyan7EgKoUIopHKIthupAeVTYl5WzRd6H7M8IUkQ2kpqyTv1jMzJXpLBTDlUUsYVSJccZPIq7nuyNZPu1Qx3YTFF6XQluhm4t3G56lim9w=
Received: from MN2PR05MB6141.namprd05.prod.outlook.com (20.178.241.217) by
 MN2PR05MB7086.namprd05.prod.outlook.com (52.135.39.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.6; Tue, 10 Dec 2019 10:37:41 +0000
Received: from MN2PR05MB6141.namprd05.prod.outlook.com
 ([fe80::611e:6a6b:9109:5aa8]) by MN2PR05MB6141.namprd05.prod.outlook.com
 ([fe80::611e:6a6b:9109:5aa8%7]) with mapi id 15.20.2538.012; Tue, 10 Dec 2019
 10:37:41 +0000
From: Thomas Hellstrom <thellstrom@vmware.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Linux-graphics-maintainer
 <Linux-graphics-maintainer@vmware.com>, "airlied@linux.ie"
 <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/vmwgfx: Call vmw_driver_{load,unload}() before
 registering device
Thread-Topic: [PATCH] drm/vmwgfx: Call vmw_driver_{load,unload}() before
 registering device
Thread-Index: AQHVroDEdm1GoL3zJ0K38sqhIMCcLA==
Date: Tue, 10 Dec 2019 10:37:41 +0000
Message-ID: <MN2PR05MB61417BEF98B009168F9C5D6DA15B0@MN2PR05MB6141.namprd05.prod.outlook.com>
References: <20191209110641.16134-1-tzimmermann@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=thellstrom@vmware.com; 
x-originating-ip: [155.4.205.35]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8eb38c2e-3d63-4bd0-1207-08d77d5cfc42
x-ms-traffictypediagnostic: MN2PR05MB7086:|MN2PR05MB7086:
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR05MB7086A15BE4FCEABD732DBF34A15B0@MN2PR05MB7086.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2150;
x-forefront-prvs: 02475B2A01
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(366004)(396003)(39860400002)(346002)(199004)(189003)(71200400001)(6506007)(26005)(110136005)(8676002)(81166006)(4744005)(186003)(53546011)(2906002)(76116006)(8936002)(55016002)(81156014)(7696005)(66556008)(64756008)(66446008)(478600001)(33656002)(91956017)(9686003)(316002)(5660300002)(66946007)(66476007)(4326008)(86362001)(52536014)(142933001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR05MB7086;
 H:MN2PR05MB6141.namprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: vmware.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cwIvVpsK70WkcsKF53jbD0mD/0WqS4loluNx9dBtltxBjmLUqUvSEXIs/pouFeCzdpEubWMj+1Ho9fZsc2s6pyOhU+kFdgqJdlhUM3yQF+Cq6DhcDHiXut3gItl7hyrUHd4UUmLpjh9KtKlCobRZD502S9utIQYM1RRNS5tFT93rGLKgyJ4xmtVadU8FnjGXwZ5bFqR1KmWjWGi32c1exoVhGiidbOV1XY7zp+ww2R69KAsa+yjHBCdI1JXfi9Eq2lM4PbSULW1WeKM4Jud8+zxwsuCF8a9WGpy0r9IwHhHlqLO6VAEW4CjI7QDbkkVjhE4mobruzRltjQfif7/QkJJGtABO6hugh+wc15WcUwtk8Io50CeMm/xgjKcA1uvY/VVXMXGFLsKcH9UHSSplIT3Nxh8FrNgxHJOsB3prq7hAE/EET/E/v99fxG9cpBvfboByQEq6yDzuZF+R5RlmC2y7N5SWH/4PRjcuGf8FOJTEm754FA3nYyyjs9sfKSQN
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8eb38c2e-3d63-4bd0-1207-08d77d5cfc42
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2019 10:37:41.7067 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FzMS9677BF11XKNkUHE+R9WbEElcG8HgB/jHfKIDrZ20GmphJ6K0fiD4XOs41fJwOIdtyzEGvXMjJxljufF1BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB7086
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

Hi,

On 12/9/19 12:06 PM, Thomas Zimmermann wrote:
> The load/unload callbacks in struct drm_driver are deprecated. Remove
> them and call functions explicitly.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 44 +++++++

Hmm, which tree is this diff against? I get

Applying: drm/vmwgfx: Call vmw_driver_{load, unload}() before
registering device
Using index info to reconstruct a base tree...
M    drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
error: patch failed: drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:1329
error: drivers/gpu/drm/vmwgfx/vmwgfx_drv.c: patch does not apply
error: Did you hand edit your patch?
It does not apply to blobs recorded in its index.
Patch failed at 0001 drm/vmwgfx: Call vmw_driver_{load, unload}() before
registering device

On both drm-misc-next and linus' master?


Thanks,

Thomas


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

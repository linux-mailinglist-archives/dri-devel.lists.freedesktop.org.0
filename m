Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C096D11A8C3
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 11:21:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04C656EAE7;
	Wed, 11 Dec 2019 10:21:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20626.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::626])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEEBB6EAE7
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 10:20:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LR6SGGeT4PVPpWx7D6pRRN3XsAr422k0W/p9fMhg/LpJPlk+OPDgIfPTfrn9vDyTVK/xJtYpBg6ShYoVH3KmBFi4Cn2Ho5hC7woneKasIWLssxTwiZuK/rR+i2FZtqvCEoVoOzBBStV/2Fd5Jr6JKb8OwY6fObmtavqlVi+EWdbypM0vEQHydUSq0aQA2OTBNeaI6xwvk/eEGQKlC1iFGlg+X6hPSvUKw1UTObUgFI4g4khPfQx6PEJEzs1h8I1lhjkgZdw84BQH8x1YbhxY8uAhHrrM/KATGNLYAr/BLRCcLXPWk1IHRmgqX2/tj1UaFN0bijq/BTxfc2pxl0WrIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ztugeV2lqUrmlTWU6kw5iEJsvKOXk6clMolLMukLndQ=;
 b=Q+7OT90CQPvCQLHm/pMWNryBY7MdI6/nhdHjC5ywE17VhmDX40ryrVN14s7jL0Az5Q8LueA5kdzuYK8fQCe1OWNRQIrcGaY9QeiY1v1MdiAafP7OHuEVSeaa8oWUt8G5OfXGN68i6QyGSVU7REDO3f9GWipbflxu0qFGWaMVFyBwxexZDZUPdbmQL+EjvEIJt5w4MSOjUD8fAEv2w+fTN1tDUHAinpoHMQFTYVQ8YtXVjx9SKH4WgRGTRv88YKhGAl0qlHfK5WgYD6tkghul5K5hZE2gjuQ3mc5FxHaJ5HWwum1TqccscIREmwQW6OXNqugvHoC4GGDKCapZBZSeBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ztugeV2lqUrmlTWU6kw5iEJsvKOXk6clMolLMukLndQ=;
 b=mQs9vctTYH+AYRIuut2OrvCL4ZvCzKfSAJPCgsNq+vIFeK2/2ZFg41Ob020YoWhH5V7WfrjeT7MmzMV2orlju762kekRk8Jwi3TkvbncbTTjVe+1KW18ExempTfAiz58x+NbbHR+P5XFKf4ewK09XxVHlcGm3DMFRH9t3mA308w=
Received: from MN2PR05MB6141.namprd05.prod.outlook.com (20.178.241.217) by
 MN2PR05MB7071.namprd05.prod.outlook.com (52.135.39.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.9; Wed, 11 Dec 2019 10:20:57 +0000
Received: from MN2PR05MB6141.namprd05.prod.outlook.com
 ([fe80::611e:6a6b:9109:5aa8]) by MN2PR05MB6141.namprd05.prod.outlook.com
 ([fe80::611e:6a6b:9109:5aa8%7]) with mapi id 15.20.2538.012; Wed, 11 Dec 2019
 10:20:57 +0000
From: Thomas Hellstrom <thellstrom@vmware.com>
To: Navid Emamdoost <navid.emamdoost@gmail.com>
Subject: Re: [PATCH] drm/vmwgfx: prevent memory leak in vmw_context_define
Thread-Topic: [PATCH] drm/vmwgfx: prevent memory leak in vmw_context_define
Thread-Index: AQHVc1w64ObAevD51UiahaDVPzrR7w==
Date: Wed, 11 Dec 2019 10:20:56 +0000
Message-ID: <MN2PR05MB6141D12006ACDAD96C2F673BA15A0@MN2PR05MB6141.namprd05.prod.outlook.com>
References: <20190925044627.2476-1-navid.emamdoost@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=thellstrom@vmware.com; 
x-originating-ip: [155.4.205.35]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9fa0db10-a6bd-493d-3f43-08d77e23cfb8
x-ms-traffictypediagnostic: MN2PR05MB7071:|MN2PR05MB7071:
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR05MB70717AB4F96368D1A21E5053A15A0@MN2PR05MB7071.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:628;
x-forefront-prvs: 024847EE92
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(346002)(136003)(396003)(366004)(199004)(189003)(4744005)(6916009)(478600001)(91956017)(76116006)(6506007)(186003)(55016002)(86362001)(7696005)(5660300002)(52536014)(54906003)(66556008)(66946007)(64756008)(66446008)(66476007)(316002)(33656002)(8676002)(2906002)(81156014)(8936002)(71200400001)(81166006)(53546011)(26005)(4326008)(9686003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR05MB7071;
 H:MN2PR05MB6141.namprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: vmware.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CPEDh7Z6c0wJ15O/TKtjeXMzQk58R7qyf9SRWCYfuLYLJ8JyAayMStWI+fhI3BDth7S1A2pZVBWILxt1LJce3nJD/cvGaq+ZDn7WtZVjB3Y6Pas+Qg2jhMGIGGY1UMQmEYepPoaqRABHReXJZ+McWVtlhucSVs5GKOFB2jL+xQl1Trr2vUunv8n0KYwztv2NgLOW0d6kEZz3b8RMfdPelJe82SSIpU5sfoNqEQm7xhwUwCSdTJyZJbtMcTSxiLvu1NdK54zNoYD2ev9wrouzFpV1SMLA2DlXwh/IUKLR7vUMB8bO9qMaM0TWtg2lBUFa74No+kV/X9vAmcGMhbom0HWYqJ1S/xVmiWf1Go2enNidPfbgvCHUPbWHBOnOc928XOFZQG6ipqnzK81DpGL/GdlsM8JWBTxowjc8xdrkhqTWs/btZJPk11XxOe56lj0T
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fa0db10-a6bd-493d-3f43-08d77e23cfb8
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2019 10:20:56.7949 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6ITpknx2eFMY/Lpr7DSjzr87hNx+6M7elqAvrXIzD7JwWDIhLO4pwOm/z6Tpb4Rqr5sB+FUZUrb6cktXCIBlIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB7071
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
Cc: David Airlie <airlied@linux.ie>, "kjlu@umn.edu" <kjlu@umn.edu>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "emamd001@umn.edu" <emamd001@umn.edu>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 "smccaman@umn.edu" <smccaman@umn.edu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/25/19 6:46 AM, Navid Emamdoost wrote:
> In vmw_context_define if vmw_context_init fails the allocated resource
> should be unreferenced. The goto label was fixed.
>
> Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_context.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_context.c b/drivers/gpu/drm/vmwgfx/vmwgfx_context.c
> index a56c9d802382..ac42f8a6acf0 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_context.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_context.c
> @@ -773,7 +773,7 @@ static int vmw_context_define(struct drm_device *dev, void *data,
>  
>  	ret = vmw_context_init(dev_priv, res, vmw_user_context_free, dx);
>  	if (unlikely(ret != 0))
> -		goto out_unlock;
> +		goto out_err;
>  
>  	tmp = vmw_resource_reference(&ctx->res);
>  	ret = ttm_base_object_init(tfile, &ctx->base, false, VMW_RES_CONTEXT,

This patch doesn't look correct. vmw_context_init should free up all
resources if failing.

Thanks,

Thomas


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A9E609A73
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 08:21:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46E6210E268;
	Mon, 24 Oct 2022 06:21:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2049.outbound.protection.outlook.com [40.107.223.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A662B10E268;
 Mon, 24 Oct 2022 06:21:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QKP3HFW2Iz1Zp1hQ8KKJFjBGrcubLegtSQVbMHTOJDd2SDlaEidts1p8slR5TCNsq1gyJorfrecyCZ1oVig6dmBSodkC4K8MdEwtZ0l4r9LJ4yROtZzvoLYJ5+quV1F5QdKNsMSUxFgU6U7X281ieu9PZQWbqP5Jroy91H7sgNR6h2uIYVP0bs5lGTul5uGs+Q125f6OfnmphGtWU1E3748k4UcVLxZSr0mQ53YfQ5ONTpbX6jFm3GdcB6D0vkXYU1JSYJNACT2UR/8qhI9ZUfZ7bvUpIxHaqA/vVy2NfO7owYlAQ4gJTnRm/C99UTFp+v60GatK/vwBud37JKsItg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=93nk+j69InSNxh2DAIlfQzi85xkVQnwJq98tllqH8qw=;
 b=GJoHFU16oA1fcYaPtemKCK4OsdeDRFUdiFrMHQ4ssbGRIBrD+QaAeQs9d87DLmlQ9iFGq9++a5P4PysNMEFTWRRFrSr8cVKALw5uoQlJ5aC2worzYgAqNvHPaYRYnhl3aR9JEI4gW80w1cOG7KJU1GmMAcbR69Eg06Nn6WzjgC+vRAmsRArN8sMXR+TaAQRlHnwMP+qN/SFnBYWm773+41Nlcz+WNvJvcXex6iK0LB8FZR9pwsNAkos+oc0mxYNptTaiuHVCVx2xLIqixSl3/VUla5IWYEdn7lFS5l3qSP46tIqmowgmeaTj/wVwt4BTJBOMDj2UhOo/je4dIopy0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=93nk+j69InSNxh2DAIlfQzi85xkVQnwJq98tllqH8qw=;
 b=vbA5+yuiF5xvD5w3XI9auAK+G3uRsuVwtv5RROIEFq/0PR0PGbXMXBXin3U7iKRNu+j4rrbrsiC0LgC/Uy59PH7CGsvG1GvUfC7iLjWiY5ySbGvS5lZ80rI5C5BWr4wzLbn66SFqRug5dfWdZkO29dB9DxcQiRCiuZ8hL9oIGyI=
Received: from DM6PR12MB2619.namprd12.prod.outlook.com (2603:10b6:5:45::18) by
 BL0PR12MB4898.namprd12.prod.outlook.com (2603:10b6:208:1c7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Mon, 24 Oct
 2022 06:20:59 +0000
Received: from DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::9655:dbcc:a395:5c6b]) by DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::9655:dbcc:a395:5c6b%4]) with mapi id 15.20.5746.021; Mon, 24 Oct 2022
 06:20:57 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: don't call drm_fb_helper_lastclose in
 lastclose()
Thread-Topic: [PATCH] drm/amdgpu: don't call drm_fb_helper_lastclose in
 lastclose()
Thread-Index: AQHY5JFiY9m+GYh340a48vXrm7Dv6q4dGElA
Date: Mon, 24 Oct 2022 06:20:57 +0000
Message-ID: <DM6PR12MB26194FC4A9B18912448DA8CEE42E9@DM6PR12MB2619.namprd12.prod.outlook.com>
References: <20221020143603.563929-1-alexander.deucher@amd.com>
In-Reply-To: <20221020143603.563929-1-alexander.deucher@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2022-10-24T06:20:55Z; 
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=b76276b6-bd2b-429d-bfe8-74b142cd2d90;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR12MB2619:EE_|BL0PR12MB4898:EE_
x-ms-office365-filtering-correlation-id: 3e59eb26-dc09-454a-a0f4-08dab587e9b2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lcfMCL/jfCi4vbhR8ahdeHkH+GEw9uKrtGBIZWzAW5Y++Z9XKC+OsRVDju4egQAFxgL1FnL/5Nr4Kkk6UsczJGmidcVCZJjfgkYQustxxX/Iv6HMiZphRB3G4ilXnrsG3MzvDHParhTR2uyZQVIux85KPZq8bz5turN62VLRJt6/nGQ9r0/qMmRPWdeSyCPgdlTB4Nd9a/agKZDEvLswdYtxSJf7VTCd5+9ZLT9pB8eBOJfPOnSA8dJAPPNmHPJ9zFd4RZVtqxYsXCmuYrnXudHxPhp2JISp6dMEZpzjhxu46ZlTwiBo6RxW8KtiAf0EI/9va/DaBPrLH7G1joBgdGltb9SsDC+8Gpx/FH5xCDraihMfBgaJRhOLk5tJsG8ByEBsxjo8qzyciqJVN2JJ6EgwG2JolOVq190LNveOVRwpZ4AKkApNZFGSIuFNyh3ws4ykr6fY05+vWr4jUm88ru8tmjld+hFu9nPo2uStCCqQ8AF/3tljPMTvi6ck0ZIkWGvYhdpmGB6R/aKeAFFxiVCWOkRnRKdsbHfZ0y201EmxUVy+5dN4YLL8TX8Do8LrAy4iOsnhr8I2f4rp7+G4v6cisyg0z2CDHWQbHdWLa3DYUTpTGbfbiADgEAI/DWJC2edVMQ4BqX92ONZT/CEhVQh/4ozUTilRdCIYJQDniGtQr17B5c6SIg+Mg4ZjLlY4skNfkDBuOXR/WUImHBS0LNhpLQyi5/gfry/WNEUOc38iRJoML/UEQmtHJQC0LzbaHhUOryzlsjeeQKkGUPkBbQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2619.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(376002)(136003)(366004)(346002)(39850400004)(451199015)(186003)(83380400001)(38070700005)(86362001)(122000001)(38100700002)(2906002)(41300700001)(8936002)(52536014)(5660300002)(55016003)(478600001)(9686003)(26005)(7696005)(53546011)(6506007)(4326008)(76116006)(66946007)(8676002)(66476007)(66556008)(64756008)(66446008)(71200400001)(316002)(54906003)(110136005)(33656002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ExwYleqr0pCo8kWlrw69qskcoEt38TXRU6wIp4Fh4ibID2RynBJ8pN7qit5L?=
 =?us-ascii?Q?M3tRZPaq4pJewY9Bqz3hAqY3518bxFDIj8QubFFeHP05Y89wVjtr07PMBcsk?=
 =?us-ascii?Q?4GjpCVEvazMQreoSiEyCG/JtTsSSblAD9ZTz1X0Jln6OYJICcWk3YvYAXGhY?=
 =?us-ascii?Q?OaAvhifd81XGr1dUq9iqIEaFC2nbB8OpkxGInqrtQmgDAPgjGVltFowTzCPb?=
 =?us-ascii?Q?Q7lbixsKnVvjqiR42uiej0qLRXxM8bUtBwHINAFXU162zdiO7yKYtYlw75a2?=
 =?us-ascii?Q?P5MAPbMOIGvHmZfJOyy4FYbwQGvmoegSwz/jaomNMfmgU7kUTc/TgibOo0ee?=
 =?us-ascii?Q?4Kh2Gzi10WznNtjYNvL58EM3zp4/Q5q71RXNO61tOk8X36JSkC81Ohnecw6D?=
 =?us-ascii?Q?+xfItxRyMn04aF3MUv66OYsIpOytueNrzb/pZgmfhCodGGeuJubS15VKQfSA?=
 =?us-ascii?Q?R1fg5DmGyjhqepoOTxCyEVCNXAU9sbPgV1Www+TS0e5+MGFhBhxyNg8r+NyH?=
 =?us-ascii?Q?3kXoly+W3g8Y86jtqBnITl8VqvUyrr57cVFaz5K+vHkw6dOAqAahUKkXStHR?=
 =?us-ascii?Q?f2E9JWhlwcyAhG9O+gLfXll2B2PN/dZ1YzXazQihqLRpAzbePHI073XLHEyJ?=
 =?us-ascii?Q?BNg4pH9ldt88dJau3IVNeyGdkQd9IkYb4CarkkjeZZCadT7e18VrH4dIX/hf?=
 =?us-ascii?Q?S9g8QdTWcCfrrPvI5XQhxrOV3lg/h5iodo7tWCT/XA7/A4ZeiDqlMQSEYtE2?=
 =?us-ascii?Q?SEb2f/JjgJ1b2c10oxrSRK/dW8aEX2FMPTsblvPsY2rwyPfykenReZ7uxtmr?=
 =?us-ascii?Q?9BA0hI1Oa7tQpNh6FEekG/THIsoRqnJ50WKZadsFHAcCGVYJhWOruc/GwhOI?=
 =?us-ascii?Q?2NgVPEEuRdH7ZtWZQT/8eDV2V1hQPhFL8lR6ZE3HWL85zUD1qSivOlwiRIel?=
 =?us-ascii?Q?fCX5NdGIITHHLG7imaLfPvnGoUUlBoeKUzZDgeGWmsrluheR+SPsDPEUNqKY?=
 =?us-ascii?Q?rJAoMjo3YLmOv9QcP3JOCQWLNo2ACbH0pU/uStg9d4e9wfaTb32Mc7EzzbPw?=
 =?us-ascii?Q?9QJQDz0iKG+JRQfPeAfHOvb9fpHseDAKYnlySJzBKBSX/OihcfW9NSpd7vFS?=
 =?us-ascii?Q?VOoCvEtZYeWDeAcoWnRHFvL7vUndHTghXxm1QLWKLgiXjaqrt346F1xMreUO?=
 =?us-ascii?Q?ZC8Ggte8hkImBDxsk63z1uUuO1RZjkPESb25ZL0HSNJOxSPs/FRok2/ZImqj?=
 =?us-ascii?Q?+WG9pZ1FIUx1mj96T57L35e/I1KiFbDh6JclYSsW9//5DybtzNV9ZrFI83+a?=
 =?us-ascii?Q?tvL1NLvYYeZYRaremu7sUGFmBwAmgy8q97uPRS6Td+8UlcJk7Az9B+MDui/s?=
 =?us-ascii?Q?ADyUTOnMek051Thv4RXxOqicqg493xpXprmSfbyhxaaRbYQfxIt6eqwzGjCx?=
 =?us-ascii?Q?2yLe//kWYi/5Bi5czyQ0LIFwFWRKO1p/qvFQS7YA/ZrCAVdOo02iAsCrNSoK?=
 =?us-ascii?Q?2mjTy5lOozlysjhDPmh91Fya/+jXemZGRV1rqEEvHciwMZvu8OHdcxUnJDdp?=
 =?us-ascii?Q?q4B3v1BtAMN3rL5eTK4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2619.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e59eb26-dc09-454a-a0f4-08dab587e9b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2022 06:20:57.2044 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SKJ5TdrWb78vdC8l4fFCZWK/Ww3K14NU5IoF8ZVvy3Va+D/TCbQlH0S9zNGSmHK7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4898
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only - General]

Reviewed-by: Evan Quan <evan.quan@amd.com>

> -----Original Message-----
> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Alex
> Deucher
> Sent: Thursday, October 20, 2022 10:36 PM
> To: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Thomas
> Zimmermann <tzimmermann@suse.de>
> Subject: [PATCH] drm/amdgpu: don't call drm_fb_helper_lastclose in
> lastclose()
>=20
> It's used to restore the fbdev console, but as amdgpu uses
> generic fbdev emulation, the console is being restored by the
> DRM client helpers already. See the call to drm_client_dev_restore()
> in drm_lastclose().
>=20
> Fixes: 087451f372bf76 ("drm/amdgpu: use generic fb helpers instead of
> setting up AMD own's.")
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> index fe23e09eec98..474b9f40f792 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> @@ -1106,7 +1106,6 @@ int amdgpu_info_ioctl(struct drm_device *dev,
> void *data, struct drm_file *filp)
>   */
>  void amdgpu_driver_lastclose_kms(struct drm_device *dev)
>  {
> -	drm_fb_helper_lastclose(dev);
>  	vga_switcheroo_process_delayed_switch();
>  }
>=20
> --
> 2.37.3

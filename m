Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C0F4267FD
	for <lists+dri-devel@lfdr.de>; Fri,  8 Oct 2021 12:34:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D84726F41C;
	Fri,  8 Oct 2021 10:34:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2089.outbound.protection.outlook.com [40.107.244.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 143416F41C;
 Fri,  8 Oct 2021 10:34:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hfs+8W6EQDI8BUwe5T4svH8HP4r0OkGygsatGekUWvEm3jEBv4LV5lBZ5/aaIk4GbZjAZiR1eY/8jD7jMg5qrd1YcMYU2McdSaiUvS3OldXErP9XntCJszRsXq0skxDVLSQ/+UN/DZNk20rIUCZK6ht5sw5HL+GkfJvhachaujZx6rRST5E4LDKSACDZbXv/82j+qpKPxaKRthLn4KNXbc8qSvlWhJlB+bA/TkWwpyL6BhQ0u4HBElUWcxJO1gPkZBnwnyKm7mb+IF8SeArBQM8h96shJ1YsX+qS4NZxSU9YONMcms9MWzYWoK0QP9T8gbZFMgeCIuLv29DOsL3wnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iUW5IZMDSp+aNTrRCOZCVoezWAbZ/+TxIhHT8j6HBto=;
 b=SRNVWN1kTZRA9SZLzY6eB9TnHLETcGO84rmJFnfQBn61gl7pD2Hy/EhY9sQZMC8Qumgc/IGIE23cINmHAbk5HpPsCMUGiCz85rnarzjt6wSWQbI+ZZaJwUAIcszHFNtxlvV+/qVCIBC8z+iId8j8TLXh0th/7L0Tt1RSXuT1wpXdLcIvUhMzFjLfcfunwLnvXerfyfKthi7xbAn+ehhLmon5YvpnbMRZQEFP6nJB+ET9HqSPK/eS0CiGjj0fjfZBAjiWAReqdEJ6TSkE2ZWzIGLQ5vf23lXd3ggItGz9Xv+XsLRQVcUCoT/mtMRt21l/H/nK27xfRKzCrQ6kaTLYEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iUW5IZMDSp+aNTrRCOZCVoezWAbZ/+TxIhHT8j6HBto=;
 b=LU66ggFoIoYK/wLtoXYEFSnDRdkv6340MyyEwOwqcKItmyiFUKvBWoqNZUTq9TX+Ai6x+QaYj2/epY80ayPAxP0XqHQ5LFza37UiOjF9FijMg+wG1OQsDpdgZ1ZRLFVfcMBq3g3mlo7Ra/wYmRcucTle8L3sB3X9EMxKzWKo6F8=
Received: from DM4PR12MB5136.namprd12.prod.outlook.com (2603:10b6:5:393::23)
 by DM4PR12MB5325.namprd12.prod.outlook.com (2603:10b6:5:39e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.20; Fri, 8 Oct
 2021 10:34:29 +0000
Received: from DM4PR12MB5136.namprd12.prod.outlook.com
 ([fe80::555a:2980:a5c2:8d29]) by DM4PR12MB5136.namprd12.prod.outlook.com
 ([fe80::555a:2980:a5c2:8d29%8]) with mapi id 15.20.4587.022; Fri, 8 Oct 2021
 10:34:29 +0000
From: "Das, Nirmoy" <Nirmoy.Das@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Pan, Xinhui"
 <Xinhui.Pan@amd.com>
Subject: Re: [PATCH 3/5] drm/radeon: check dri root before debugfs init
Thread-Topic: [PATCH 3/5] drm/radeon: check dri root before debugfs init
Thread-Index: AQHXvCVPdhBZmeU9DU+wqmicvlcr/avI5LMAgAACNIA=
Date: Fri, 8 Oct 2021 10:34:29 +0000
Message-ID: <DM4PR12MB51365EC00912F06E301732D78BB29@DM4PR12MB5136.namprd12.prod.outlook.com>
References: <20211008091704.27094-1-nirmoy.das@amd.com>
 <20211008091704.27094-3-nirmoy.das@amd.com>
 <221c5237-6e7d-11d2-1de4-39e77c539663@amd.com>
In-Reply-To: <221c5237-6e7d-11d2-1de4-39e77c539663@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=True;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-10-08T10:34:29.979Z;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD
 Official Use
 Only; MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard; 
suggested_attachment_session_id: 1392e3c9-5655-3602-111b-c14c1abaa4ee
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 623fb49e-5e5d-420e-1cc0-08d98a473582
x-ms-traffictypediagnostic: DM4PR12MB5325:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM4PR12MB53255B3E78FBC9C71E168AE08BB29@DM4PR12MB5325.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OK9pBV7YEqAIafacy/fj+DzolCmyAKsQt2P7gSfZ1HeTkhGxCj/jueB7WTkE76O/7sgAaIMcyPlEWMQpibH3Ce0/6dLKg/0/tbul8xuaOf1lGRrThNSIaFHPqPZ9WaN3QmPKbLb+Xata46/qynLOCvev6YGQhD0raBQwLRhik+artWVbaXgSPDg4LuwtpdNwtdme1nETww4DuVgr03qz8u/rnJAqjGY+Tf1XcJhLrv07swEmQM0aWcD441vouTxXmGfWYEv5r5XZkRZQZp6FDFkUccwGTRbroIgI6OcNLZY1yMBtb4Jwb3T2VvrTw6SnySFuXHuTBu0wSNj78rxPGKWqIJwKTopdBFAbsVuJ44ujALB5T/RGi2fCLaf+bHlX7E9qZoGjWj+/NLM3PW9v9fIIrcncOIlTEfLLPS1WQZVA38s9ibg+lPiHH+1Tjdx/2W54JzO0ZdGULXQYKBSbrc2yN33xvknWaF52IfRg+bnuYL+NQtF42FL5whKRTzl1vkeap0L2ebyUE57uqRRX3mo7Z4l6JK+aTxE6dG8MwAvjtuU+mo2hQPNha0lBAiBNSJeATFQNj1KYcBumVGlzJ7W7sLaZnBmn73I5RxhLc1gGWrOq7AH2CNUDZHIlvfse0knNwkTf1rw9TmxG9aDT3QMdatDrqvMeROcQbfbG/wO9h+aiiz0bSgjTwu+1FKDZeX2XQ+AZ01vQTRTzSu8TjQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5136.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(122000001)(86362001)(166002)(19627405001)(7696005)(8936002)(5660300002)(110136005)(53546011)(55016002)(33656002)(38100700002)(6506007)(83380400001)(186003)(508600001)(450100002)(316002)(966005)(54906003)(26005)(9686003)(52536014)(66946007)(4326008)(64756008)(66476007)(66446008)(66556008)(66574015)(2906002)(8676002)(76116006)(71200400001)(38070700005)(91956017);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?zs7O6otHVqdqnfvSL7y/+Xacct0LWAGc0S+vYv+hNr2C9op6P1BQH7MeSF?=
 =?iso-8859-1?Q?1SI6xyA1dKxsCoQobLV2/Ef3PC8ry0i20ys8rFCrYuNUVujKrAJeB+/vOZ?=
 =?iso-8859-1?Q?sMpKzoWu6LLNLdO8Feca4TmaXfmz67o1VZk9OfFjN8m/E5gHfLYXiW4Y23?=
 =?iso-8859-1?Q?e3pNhlJIbIr1qw10LXi89eca9PKv7SK8hMQ0SAaVX+IitN4TiDrfsxuTyH?=
 =?iso-8859-1?Q?xGm/L4743m9lwjNiLQI0jb4hSxvGvJUaMG2eDPFRG4ozDrzzJORx10zwxH?=
 =?iso-8859-1?Q?Bzs3QQQhM7SzrrWn6v6ijkJ5UhXqgcrUrY5Ha9/mIJkt7N1Pov7XyGXNQz?=
 =?iso-8859-1?Q?JgvmWNsc4X1SDyBUW3nmB7jOq/eDRD8giEQpqppfOARu0zSCSWw5v8Wqa6?=
 =?iso-8859-1?Q?eQajxWBW4LThkp2WB4U8NtjHElVjH/Gx88RjSEMrqgr4eaa11o/OF/wXZm?=
 =?iso-8859-1?Q?dF8SDhsm8N8dS0uXacxuQXx4HfdPqyqbZH72SIv5Ip9Mg3Wnp4um20Wu67?=
 =?iso-8859-1?Q?HBIXM8+RkTUgyMpgoUW3Vrk01uzzu5fnleT7OUZP50yKmIITBe7xSkGzHo?=
 =?iso-8859-1?Q?MFeqyBtpNk2Av0dlYhbeu5FMSYPNNJ5Eeyz93z4s/mUxR6AzbBdoQopqcY?=
 =?iso-8859-1?Q?ohmVnfrHGJ4XcPMUTHEjOAj/hM1IDhpz6bRsEwORwO76tgf9XDp1xSjx68?=
 =?iso-8859-1?Q?WEyDjkmbSg7Reo23pgWUfvr63TPBHsKX9jXAawlrfBlDEWpQVVQihpe2Kq?=
 =?iso-8859-1?Q?MF/aA93qwcoyzVrvEE++mUhUS/T2VCVCxKlnEFKih8AktFQ2z9ON2AcvWd?=
 =?iso-8859-1?Q?OeIYDlTguSsqS1E56U+UwLB4qrRWsA3vEDcY2lmvOCDP2vEPcCtzJB0L9J?=
 =?iso-8859-1?Q?cm1E7EI4jKR8befojr0dYvcTkvuL2w6feXFAFMHiFOxJKhIvspLujMHWiC?=
 =?iso-8859-1?Q?WC3b51xCT7k6lJAdqlw19SjJVSPYdW0388KAN/8sOEFJ9X/+aAoHSEGJBg?=
 =?iso-8859-1?Q?qG/INYmX4dAiLt/nqHt31smXZ20aCYcQYtbkCpneBlv1D/065MDb/QezL3?=
 =?iso-8859-1?Q?7T6lRI0bND3cYoFOeWbNQNVARHdcdlMsvUoVxV+oVx6EH98nsN39R5wUg7?=
 =?iso-8859-1?Q?TK05wqM0G/dtf2cWOK8SjJwGXxfL30/DtgnomHN6Kai7bgTz45mngv3bn/?=
 =?iso-8859-1?Q?CnICUQqLFbNdzvqbH/J2k1HG1nme0g4NLELrj99CIMIObmrTVSdw9Wn7zz?=
 =?iso-8859-1?Q?QSHmpOQxAdM9rf3gIBNbtwuZJm934WFOuw00mEgn478vQIlD+ULeaXYZdY?=
 =?iso-8859-1?Q?sVs3a1ZsF8ANKvazkF2L/htAlPB4q3QPcraBHV/loVOIYLA=3D?=
Content-Type: multipart/alternative;
 boundary="_000_DM4PR12MB51365EC00912F06E301732D78BB29DM4PR12MB5136namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5136.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 623fb49e-5e5d-420e-1cc0-08d98a473582
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2021 10:34:29.3272 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oRgOTlU/UzHFo4VqP14OFNCtcMHmIljnx+cdSdkKEiatnTOY+GXlGRoHF4mQjcEPV/AERRuJUuJOSNm+DS78Dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5325
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_DM4PR12MB51365EC00912F06E301732D78BB29DM4PR12MB5136namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only]

I sent all the patches to dr-devel. I think there is an issue with our emai=
l server. Thunderbird is asking for a password every few minutes.

https://patchwork.freedesktop.org/series/95603/

Nirmoy
[sending this from my browser]
________________________________
From: Koenig, Christian <Christian.Koenig@amd.com>
Sent: Friday, October 8, 2021 12:23 PM
To: Das, Nirmoy <Nirmoy.Das@amd.com>; dri-devel@lists.freedesktop.org <dri-=
devel@lists.freedesktop.org>
Cc: intel-gfx@lists.freedesktop.org <intel-gfx@lists.freedesktop.org>; Deuc=
her, Alexander <Alexander.Deucher@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com=
>
Subject: Re: [PATCH 3/5] drm/radeon: check dri root before debugfs init

Am 08.10.21 um 11:17 schrieb Nirmoy Das:
> Return early if dri minor root dentry is NULL.
>
> CC: Alex Deucher <alexander.deucher@amd.com>
> CC: "Christian K=F6nig" <christian.koenig@amd.com>
> CC: "Pan, Xinhui" <Xinhui.Pan@amd.com>
>
> Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>

Acked-by: Christian K=F6nig <christian.koenig@amd.com>

Where are the other patches from the series?

Thanks,
Christian.

> ---
>   drivers/gpu/drm/radeon/r100.c          | 9 +++++++++
>   drivers/gpu/drm/radeon/r300.c          | 3 +++
>   drivers/gpu/drm/radeon/r420.c          | 3 +++
>   drivers/gpu/drm/radeon/r600.c          | 3 +++
>   drivers/gpu/drm/radeon/radeon_dp_mst.c | 3 +++
>   drivers/gpu/drm/radeon/radeon_fence.c  | 3 +++
>   drivers/gpu/drm/radeon/radeon_gem.c    | 3 +++
>   drivers/gpu/drm/radeon/radeon_ib.c     | 3 +++
>   drivers/gpu/drm/radeon/radeon_pm.c     | 5 ++++-
>   drivers/gpu/drm/radeon/radeon_ring.c   | 3 +++
>   drivers/gpu/drm/radeon/radeon_ttm.c    | 3 +++
>   drivers/gpu/drm/radeon/rs400.c         | 3 +++
>   drivers/gpu/drm/radeon/rv515.c         | 3 +++
>   13 files changed, 46 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/radeon/r100.c b/drivers/gpu/drm/radeon/r100.=
c
> index 2dd85ba1faa2..ae6c95b34013 100644
> --- a/drivers/gpu/drm/radeon/r100.c
> +++ b/drivers/gpu/drm/radeon/r100.c
> @@ -3059,6 +3059,9 @@ void  r100_debugfs_rbbm_init(struct radeon_device *=
rdev)
>   #if defined(CONFIG_DEBUG_FS)
>        struct dentry *root =3D rdev->ddev->primary->debugfs_root;
>
> +     if (!root)
> +             return;
> +
>        debugfs_create_file("r100_rbbm_info", 0444, root, rdev,
>                            &r100_debugfs_rbbm_info_fops);
>   #endif
> @@ -3069,6 +3072,9 @@ void r100_debugfs_cp_init(struct radeon_device *rde=
v)
>   #if defined(CONFIG_DEBUG_FS)
>        struct dentry *root =3D rdev->ddev->primary->debugfs_root;
>
> +     if (!root)
> +             return;
> +
>        debugfs_create_file("r100_cp_ring_info", 0444, root, rdev,
>                            &r100_debugfs_cp_ring_info_fops);
>        debugfs_create_file("r100_cp_csq_fifo", 0444, root, rdev,
> @@ -3081,6 +3087,9 @@ void  r100_debugfs_mc_info_init(struct radeon_devic=
e *rdev)
>   #if defined(CONFIG_DEBUG_FS)
>        struct dentry *root =3D rdev->ddev->primary->debugfs_root;
>
> +     if (!root)
> +             return;
> +
>        debugfs_create_file("r100_mc_info", 0444, root, rdev,
>                            &r100_debugfs_mc_info_fops);
>   #endif
> diff --git a/drivers/gpu/drm/radeon/r300.c b/drivers/gpu/drm/radeon/r300.=
c
> index 621ff174dff3..b22969e2394f 100644
> --- a/drivers/gpu/drm/radeon/r300.c
> +++ b/drivers/gpu/drm/radeon/r300.c
> @@ -618,6 +618,9 @@ static void rv370_debugfs_pcie_gart_info_init(struct =
radeon_device *rdev)
>   #if defined(CONFIG_DEBUG_FS)
>        struct dentry *root =3D rdev->ddev->primary->debugfs_root;
>
> +     if (!root)
> +             return;
> +
>        debugfs_create_file("rv370_pcie_gart_info", 0444, root, rdev,
>                            &rv370_debugfs_pcie_gart_info_fops);
>   #endif
> diff --git a/drivers/gpu/drm/radeon/r420.c b/drivers/gpu/drm/radeon/r420.=
c
> index 7e6320e8c6a0..cdb4ac3e346b 100644
> --- a/drivers/gpu/drm/radeon/r420.c
> +++ b/drivers/gpu/drm/radeon/r420.c
> @@ -494,6 +494,9 @@ void r420_debugfs_pipes_info_init(struct radeon_devic=
e *rdev)
>   #if defined(CONFIG_DEBUG_FS)
>        struct dentry *root =3D rdev->ddev->primary->debugfs_root;
>
> +     if (!root)
> +             return;
> +
>        debugfs_create_file("r420_pipes_info", 0444, root, rdev,
>                            &r420_debugfs_pipes_info_fops);
>   #endif
> diff --git a/drivers/gpu/drm/radeon/r600.c b/drivers/gpu/drm/radeon/r600.=
c
> index ca3fcae2adb5..d8f525cf0c3b 100644
> --- a/drivers/gpu/drm/radeon/r600.c
> +++ b/drivers/gpu/drm/radeon/r600.c
> @@ -4360,6 +4360,9 @@ static void r600_debugfs_mc_info_init(struct radeon=
_device *rdev)
>   #if defined(CONFIG_DEBUG_FS)
>        struct dentry *root =3D rdev->ddev->primary->debugfs_root;
>
> +     if (!root)
> +             return;
> +
>        debugfs_create_file("r600_mc_info", 0444, root, rdev,
>                            &r600_debugfs_mc_info_fops);
>
> diff --git a/drivers/gpu/drm/radeon/radeon_dp_mst.c b/drivers/gpu/drm/rad=
eon/radeon_dp_mst.c
> index ec867fa880a4..cf06da89bb7c 100644
> --- a/drivers/gpu/drm/radeon/radeon_dp_mst.c
> +++ b/drivers/gpu/drm/radeon/radeon_dp_mst.c
> @@ -771,6 +771,9 @@ void radeon_mst_debugfs_init(struct radeon_device *rd=
ev)
>   #if defined(CONFIG_DEBUG_FS)
>        struct dentry *root =3D rdev->ddev->primary->debugfs_root;
>
> +     if (!root)
> +             return;
> +
>        debugfs_create_file("radeon_mst_info", 0444, root, rdev,
>                            &radeon_debugfs_mst_info_fops);
>
> diff --git a/drivers/gpu/drm/radeon/radeon_fence.c b/drivers/gpu/drm/rade=
on/radeon_fence.c
> index 73e3117420bf..11f30349de46 100644
> --- a/drivers/gpu/drm/radeon/radeon_fence.c
> +++ b/drivers/gpu/drm/radeon/radeon_fence.c
> @@ -1006,6 +1006,9 @@ void radeon_debugfs_fence_init(struct radeon_device=
 *rdev)
>   #if defined(CONFIG_DEBUG_FS)
>        struct dentry *root =3D rdev->ddev->primary->debugfs_root;
>
> +     if (!root)
> +             return;
> +
>        debugfs_create_file("radeon_gpu_reset", 0444, root, rdev,
>                            &radeon_debugfs_gpu_reset_fops);
>        debugfs_create_file("radeon_fence_info", 0444, root, rdev,
> diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon=
/radeon_gem.c
> index 458f92a70887..e6df1451af37 100644
> --- a/drivers/gpu/drm/radeon/radeon_gem.c
> +++ b/drivers/gpu/drm/radeon/radeon_gem.c
> @@ -890,6 +890,9 @@ void radeon_gem_debugfs_init(struct radeon_device *rd=
ev)
>   #if defined(CONFIG_DEBUG_FS)
>        struct dentry *root =3D rdev->ddev->primary->debugfs_root;
>
> +     if (!root)
> +             return;
> +
>        debugfs_create_file("radeon_gem_info", 0444, root, rdev,
>                            &radeon_debugfs_gem_info_fops);
>
> diff --git a/drivers/gpu/drm/radeon/radeon_ib.c b/drivers/gpu/drm/radeon/=
radeon_ib.c
> index 62b116727b4f..28316eb4fd49 100644
> --- a/drivers/gpu/drm/radeon/radeon_ib.c
> +++ b/drivers/gpu/drm/radeon/radeon_ib.c
> @@ -311,6 +311,9 @@ static void radeon_debugfs_sa_init(struct radeon_devi=
ce *rdev)
>   #if defined(CONFIG_DEBUG_FS)
>        struct dentry *root =3D rdev->ddev->primary->debugfs_root;
>
> +     if (!root)
> +             return;
> +
>        debugfs_create_file("radeon_sa_info", 0444, root, rdev,
>                            &radeon_debugfs_sa_info_fops);
>   #endif
> diff --git a/drivers/gpu/drm/radeon/radeon_pm.c b/drivers/gpu/drm/radeon/=
radeon_pm.c
> index c67b6ddb29a4..c09e574d04f0 100644
> --- a/drivers/gpu/drm/radeon/radeon_pm.c
> +++ b/drivers/gpu/drm/radeon/radeon_pm.c
> @@ -1958,6 +1958,9 @@ static void radeon_debugfs_pm_init(struct radeon_de=
vice *rdev)
>   #if defined(CONFIG_DEBUG_FS)
>        struct dentry *root =3D rdev->ddev->primary->debugfs_root;
>
> +     if (!root)
> +             return;
> +
>        debugfs_create_file("radeon_pm_info", 0444, root, rdev,
>                            &radeon_debugfs_pm_info_fops);
>
> diff --git a/drivers/gpu/drm/radeon/radeon_ring.c b/drivers/gpu/drm/radeo=
n/radeon_ring.c
> index 7e207276df37..31a5b1ebf7c9 100644
> --- a/drivers/gpu/drm/radeon/radeon_ring.c
> +++ b/drivers/gpu/drm/radeon/radeon_ring.c
> @@ -550,6 +550,9 @@ static void radeon_debugfs_ring_init(struct radeon_de=
vice *rdev, struct radeon_r
>        const char *ring_name =3D radeon_debugfs_ring_idx_to_name(ring->id=
x);
>        struct dentry *root =3D rdev->ddev->primary->debugfs_root;
>
> +     if (!root)
> +             return;
> +
>        if (ring_name)
>                debugfs_create_file(ring_name, 0444, root, ring,
>                                    &radeon_debugfs_ring_info_fops);
> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon=
/radeon_ttm.c
> index 11b21d605584..2e18ec93768d 100644
> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> @@ -942,6 +942,9 @@ static void radeon_ttm_debugfs_init(struct radeon_dev=
ice *rdev)
>        struct drm_minor *minor =3D rdev->ddev->primary;
>        struct dentry *root =3D minor->debugfs_root;
>
> +     if (!root)
> +             return;
> +
>        debugfs_create_file("radeon_vram", 0444, root, rdev,
>                            &radeon_ttm_vram_fops);
>
> diff --git a/drivers/gpu/drm/radeon/rs400.c b/drivers/gpu/drm/radeon/rs40=
0.c
> index 6383f7a34bd8..b41a903a29c3 100644
> --- a/drivers/gpu/drm/radeon/rs400.c
> +++ b/drivers/gpu/drm/radeon/rs400.c
> @@ -380,6 +380,9 @@ static void rs400_debugfs_pcie_gart_info_init(struct =
radeon_device *rdev)
>   #if defined(CONFIG_DEBUG_FS)
>        struct dentry *root =3D rdev->ddev->primary->debugfs_root;
>
> +     if (!root)
> +             return;
> +
>        debugfs_create_file("rs400_gart_info", 0444, root, rdev,
>                            &rs400_debugfs_gart_info_fops);
>   #endif
> diff --git a/drivers/gpu/drm/radeon/rv515.c b/drivers/gpu/drm/radeon/rv51=
5.c
> index 63fb06e8e2d7..f39b6ab554f2 100644
> --- a/drivers/gpu/drm/radeon/rv515.c
> +++ b/drivers/gpu/drm/radeon/rv515.c
> @@ -257,6 +257,9 @@ void rv515_debugfs(struct radeon_device *rdev)
>   #if defined(CONFIG_DEBUG_FS)
>        struct dentry *root =3D rdev->ddev->primary->debugfs_root;
>
> +     if (!root)
> +             return;
> +
>        debugfs_create_file("rv515_pipes_info", 0444, root, rdev,
>                            &rv515_debugfs_pipes_info_fops);
>        debugfs_create_file("rv515_ga_info", 0444, root, rdev,
> --
> 2.32.0
>


--_000_DM4PR12MB51365EC00912F06E301732D78BB29DM4PR12MB5136namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<p style=3D"font-family:Arial;font-size:10pt;color:#0000FF;margin:5pt;" ali=
gn=3D"Left">
[AMD Official Use Only]<br>
</p>
<br>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
I sent all the patches to dr-devel. I think there is an issue with our emai=
l server. Thunderbird is asking for a password every few minutes.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<a href=3D"https://patchwork.freedesktop.org/series/95603/" id=3D"LPlnk6313=
21">https://patchwork.freedesktop.org/series/95603/</a><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
Nirmoy</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<span style=3D"margin: 0px; font-size: 12pt; color: rgb(0, 0, 0); backgroun=
d-color: rgb(255, 255, 255);">[sending this from my browser]</span><br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Koenig, Christian &lt=
;Christian.Koenig@amd.com&gt;<br>
<b>Sent:</b> Friday, October 8, 2021 12:23 PM<br>
<b>To:</b> Das, Nirmoy &lt;Nirmoy.Das@amd.com&gt;; dri-devel@lists.freedesk=
top.org &lt;dri-devel@lists.freedesktop.org&gt;<br>
<b>Cc:</b> intel-gfx@lists.freedesktop.org &lt;intel-gfx@lists.freedesktop.=
org&gt;; Deucher, Alexander &lt;Alexander.Deucher@amd.com&gt;; Pan, Xinhui =
&lt;Xinhui.Pan@amd.com&gt;<br>
<b>Subject:</b> Re: [PATCH 3/5] drm/radeon: check dri root before debugfs i=
nit</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Am 08.10.21 um 11:17 schrieb Nirmoy Das:<br>
&gt; Return early if dri minor root dentry is NULL.<br>
&gt;<br>
&gt; CC: Alex Deucher &lt;alexander.deucher@amd.com&gt;<br>
&gt; CC: &quot;Christian K=F6nig&quot; &lt;christian.koenig@amd.com&gt;<br>
&gt; CC: &quot;Pan, Xinhui&quot; &lt;Xinhui.Pan@amd.com&gt;<br>
&gt;<br>
&gt; Signed-off-by: Nirmoy Das &lt;nirmoy.das@amd.com&gt;<br>
<br>
Acked-by: Christian K=F6nig &lt;christian.koenig@amd.com&gt;<br>
<br>
Where are the other patches from the series?<br>
<br>
Thanks,<br>
Christian.<br>
<br>
&gt; ---<br>
&gt;&nbsp;&nbsp; drivers/gpu/drm/radeon/r100.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; | 9 +++++++++<br>
&gt;&nbsp;&nbsp; drivers/gpu/drm/radeon/r300.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; | 3 +++<br>
&gt;&nbsp;&nbsp; drivers/gpu/drm/radeon/r420.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; | 3 +++<br>
&gt;&nbsp;&nbsp; drivers/gpu/drm/radeon/r600.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; | 3 +++<br>
&gt;&nbsp;&nbsp; drivers/gpu/drm/radeon/radeon_dp_mst.c | 3 +++<br>
&gt;&nbsp;&nbsp; drivers/gpu/drm/radeon/radeon_fence.c&nbsp; | 3 +++<br>
&gt;&nbsp;&nbsp; drivers/gpu/drm/radeon/radeon_gem.c&nbsp;&nbsp;&nbsp; | 3 =
+++<br>
&gt;&nbsp;&nbsp; drivers/gpu/drm/radeon/radeon_ib.c&nbsp;&nbsp;&nbsp;&nbsp;=
 | 3 +++<br>
&gt;&nbsp;&nbsp; drivers/gpu/drm/radeon/radeon_pm.c&nbsp;&nbsp;&nbsp;&nbsp;=
 | 5 ++++-<br>
&gt;&nbsp;&nbsp; drivers/gpu/drm/radeon/radeon_ring.c&nbsp;&nbsp; | 3 +++<b=
r>
&gt;&nbsp;&nbsp; drivers/gpu/drm/radeon/radeon_ttm.c&nbsp;&nbsp;&nbsp; | 3 =
+++<br>
&gt;&nbsp;&nbsp; drivers/gpu/drm/radeon/rs400.c&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; | 3 +++<br>
&gt;&nbsp;&nbsp; drivers/gpu/drm/radeon/rv515.c&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; | 3 +++<br>
&gt;&nbsp;&nbsp; 13 files changed, 46 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/radeon/r100.c b/drivers/gpu/drm/radeon/r1=
00.c<br>
&gt; index 2dd85ba1faa2..ae6c95b34013 100644<br>
&gt; --- a/drivers/gpu/drm/radeon/r100.c<br>
&gt; +++ b/drivers/gpu/drm/radeon/r100.c<br>
&gt; @@ -3059,6 +3059,9 @@ void&nbsp; r100_debugfs_rbbm_init(struct radeon_=
device *rdev)<br>
&gt;&nbsp;&nbsp; #if defined(CONFIG_DEBUG_FS)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct dentry *root =3D rdev=
-&gt;ddev-&gt;primary-&gt;debugfs_root;<br>
&gt;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (!root)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return;<br>
&gt; +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; debugfs_create_file(&quot;r1=
00_rbbm_info&quot;, 0444, root, rdev,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; &amp;r100_debugfs_rbbm_info_fops);<br>
&gt;&nbsp;&nbsp; #endif<br>
&gt; @@ -3069,6 +3072,9 @@ void r100_debugfs_cp_init(struct radeon_device *=
rdev)<br>
&gt;&nbsp;&nbsp; #if defined(CONFIG_DEBUG_FS)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct dentry *root =3D rdev=
-&gt;ddev-&gt;primary-&gt;debugfs_root;<br>
&gt;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (!root)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return;<br>
&gt; +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; debugfs_create_file(&quot;r1=
00_cp_ring_info&quot;, 0444, root, rdev,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; &amp;r100_debugfs_cp_ring_info_fops);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; debugfs_create_file(&quot;r1=
00_cp_csq_fifo&quot;, 0444, root, rdev,<br>
&gt; @@ -3081,6 +3087,9 @@ void&nbsp; r100_debugfs_mc_info_init(struct rade=
on_device *rdev)<br>
&gt;&nbsp;&nbsp; #if defined(CONFIG_DEBUG_FS)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct dentry *root =3D rdev=
-&gt;ddev-&gt;primary-&gt;debugfs_root;<br>
&gt;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (!root)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return;<br>
&gt; +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; debugfs_create_file(&quot;r1=
00_mc_info&quot;, 0444, root, rdev,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; &amp;r100_debugfs_mc_info_fops);<br>
&gt;&nbsp;&nbsp; #endif<br>
&gt; diff --git a/drivers/gpu/drm/radeon/r300.c b/drivers/gpu/drm/radeon/r3=
00.c<br>
&gt; index 621ff174dff3..b22969e2394f 100644<br>
&gt; --- a/drivers/gpu/drm/radeon/r300.c<br>
&gt; +++ b/drivers/gpu/drm/radeon/r300.c<br>
&gt; @@ -618,6 +618,9 @@ static void rv370_debugfs_pcie_gart_info_init(stru=
ct radeon_device *rdev)<br>
&gt;&nbsp;&nbsp; #if defined(CONFIG_DEBUG_FS)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct dentry *root =3D rdev=
-&gt;ddev-&gt;primary-&gt;debugfs_root;<br>
&gt;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (!root)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return;<br>
&gt; +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; debugfs_create_file(&quot;rv=
370_pcie_gart_info&quot;, 0444, root, rdev,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; &amp;rv370_debugfs_pcie_gart_info_fops);<br>
&gt;&nbsp;&nbsp; #endif<br>
&gt; diff --git a/drivers/gpu/drm/radeon/r420.c b/drivers/gpu/drm/radeon/r4=
20.c<br>
&gt; index 7e6320e8c6a0..cdb4ac3e346b 100644<br>
&gt; --- a/drivers/gpu/drm/radeon/r420.c<br>
&gt; +++ b/drivers/gpu/drm/radeon/r420.c<br>
&gt; @@ -494,6 +494,9 @@ void r420_debugfs_pipes_info_init(struct radeon_de=
vice *rdev)<br>
&gt;&nbsp;&nbsp; #if defined(CONFIG_DEBUG_FS)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct dentry *root =3D rdev=
-&gt;ddev-&gt;primary-&gt;debugfs_root;<br>
&gt;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (!root)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return;<br>
&gt; +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; debugfs_create_file(&quot;r4=
20_pipes_info&quot;, 0444, root, rdev,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; &amp;r420_debugfs_pipes_info_fops);<br>
&gt;&nbsp;&nbsp; #endif<br>
&gt; diff --git a/drivers/gpu/drm/radeon/r600.c b/drivers/gpu/drm/radeon/r6=
00.c<br>
&gt; index ca3fcae2adb5..d8f525cf0c3b 100644<br>
&gt; --- a/drivers/gpu/drm/radeon/r600.c<br>
&gt; +++ b/drivers/gpu/drm/radeon/r600.c<br>
&gt; @@ -4360,6 +4360,9 @@ static void r600_debugfs_mc_info_init(struct rad=
eon_device *rdev)<br>
&gt;&nbsp;&nbsp; #if defined(CONFIG_DEBUG_FS)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct dentry *root =3D rdev=
-&gt;ddev-&gt;primary-&gt;debugfs_root;<br>
&gt;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (!root)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return;<br>
&gt; +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; debugfs_create_file(&quot;r6=
00_mc_info&quot;, 0444, root, rdev,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; &amp;r600_debugfs_mc_info_fops);<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/radeon/radeon_dp_mst.c b/drivers/gpu/drm/=
radeon/radeon_dp_mst.c<br>
&gt; index ec867fa880a4..cf06da89bb7c 100644<br>
&gt; --- a/drivers/gpu/drm/radeon/radeon_dp_mst.c<br>
&gt; +++ b/drivers/gpu/drm/radeon/radeon_dp_mst.c<br>
&gt; @@ -771,6 +771,9 @@ void radeon_mst_debugfs_init(struct radeon_device =
*rdev)<br>
&gt;&nbsp;&nbsp; #if defined(CONFIG_DEBUG_FS)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct dentry *root =3D rdev=
-&gt;ddev-&gt;primary-&gt;debugfs_root;<br>
&gt;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (!root)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return;<br>
&gt; +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; debugfs_create_file(&quot;ra=
deon_mst_info&quot;, 0444, root, rdev,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; &amp;radeon_debugfs_mst_info_fops);<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/radeon/radeon_fence.c b/drivers/gpu/drm/r=
adeon/radeon_fence.c<br>
&gt; index 73e3117420bf..11f30349de46 100644<br>
&gt; --- a/drivers/gpu/drm/radeon/radeon_fence.c<br>
&gt; +++ b/drivers/gpu/drm/radeon/radeon_fence.c<br>
&gt; @@ -1006,6 +1006,9 @@ void radeon_debugfs_fence_init(struct radeon_dev=
ice *rdev)<br>
&gt;&nbsp;&nbsp; #if defined(CONFIG_DEBUG_FS)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct dentry *root =3D rdev=
-&gt;ddev-&gt;primary-&gt;debugfs_root;<br>
&gt;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (!root)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return;<br>
&gt; +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; debugfs_create_file(&quot;ra=
deon_gpu_reset&quot;, 0444, root, rdev,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; &amp;radeon_debugfs_gpu_reset_fops);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; debugfs_create_file(&quot;ra=
deon_fence_info&quot;, 0444, root, rdev,<br>
&gt; diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/rad=
eon/radeon_gem.c<br>
&gt; index 458f92a70887..e6df1451af37 100644<br>
&gt; --- a/drivers/gpu/drm/radeon/radeon_gem.c<br>
&gt; +++ b/drivers/gpu/drm/radeon/radeon_gem.c<br>
&gt; @@ -890,6 +890,9 @@ void radeon_gem_debugfs_init(struct radeon_device =
*rdev)<br>
&gt;&nbsp;&nbsp; #if defined(CONFIG_DEBUG_FS)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct dentry *root =3D rdev=
-&gt;ddev-&gt;primary-&gt;debugfs_root;<br>
&gt;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (!root)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return;<br>
&gt; +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; debugfs_create_file(&quot;ra=
deon_gem_info&quot;, 0444, root, rdev,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; &amp;radeon_debugfs_gem_info_fops);<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/radeon/radeon_ib.c b/drivers/gpu/drm/rade=
on/radeon_ib.c<br>
&gt; index 62b116727b4f..28316eb4fd49 100644<br>
&gt; --- a/drivers/gpu/drm/radeon/radeon_ib.c<br>
&gt; +++ b/drivers/gpu/drm/radeon/radeon_ib.c<br>
&gt; @@ -311,6 +311,9 @@ static void radeon_debugfs_sa_init(struct radeon_d=
evice *rdev)<br>
&gt;&nbsp;&nbsp; #if defined(CONFIG_DEBUG_FS)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct dentry *root =3D rdev=
-&gt;ddev-&gt;primary-&gt;debugfs_root;<br>
&gt;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (!root)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return;<br>
&gt; +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; debugfs_create_file(&quot;ra=
deon_sa_info&quot;, 0444, root, rdev,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; &amp;radeon_debugfs_sa_info_fops);<br>
&gt;&nbsp;&nbsp; #endif<br>
&gt; diff --git a/drivers/gpu/drm/radeon/radeon_pm.c b/drivers/gpu/drm/rade=
on/radeon_pm.c<br>
&gt; index c67b6ddb29a4..c09e574d04f0 100644<br>
&gt; --- a/drivers/gpu/drm/radeon/radeon_pm.c<br>
&gt; +++ b/drivers/gpu/drm/radeon/radeon_pm.c<br>
&gt; @@ -1958,6 +1958,9 @@ static void radeon_debugfs_pm_init(struct radeon=
_device *rdev)<br>
&gt;&nbsp;&nbsp; #if defined(CONFIG_DEBUG_FS)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct dentry *root =3D rdev=
-&gt;ddev-&gt;primary-&gt;debugfs_root;<br>
&gt;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (!root)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return;<br>
&gt; +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; debugfs_create_file(&quot;ra=
deon_pm_info&quot;, 0444, root, rdev,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; &amp;radeon_debugfs_pm_info_fops);<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/radeon/radeon_ring.c b/drivers/gpu/drm/ra=
deon/radeon_ring.c<br>
&gt; index 7e207276df37..31a5b1ebf7c9 100644<br>
&gt; --- a/drivers/gpu/drm/radeon/radeon_ring.c<br>
&gt; +++ b/drivers/gpu/drm/radeon/radeon_ring.c<br>
&gt; @@ -550,6 +550,9 @@ static void radeon_debugfs_ring_init(struct radeon=
_device *rdev, struct radeon_r<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const char *ring_name =3D ra=
deon_debugfs_ring_idx_to_name(ring-&gt;idx);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct dentry *root =3D rdev=
-&gt;ddev-&gt;primary-&gt;debugfs_root;<br>
&gt;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (!root)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return;<br>
&gt; +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ring_name)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; debugfs_create_file(ring_name, 0444, root, ring,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;radeo=
n_debugfs_ring_info_fops);<br>
&gt; diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/rad=
eon/radeon_ttm.c<br>
&gt; index 11b21d605584..2e18ec93768d 100644<br>
&gt; --- a/drivers/gpu/drm/radeon/radeon_ttm.c<br>
&gt; +++ b/drivers/gpu/drm/radeon/radeon_ttm.c<br>
&gt; @@ -942,6 +942,9 @@ static void radeon_ttm_debugfs_init(struct radeon_=
device *rdev)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_minor *minor =3D =
rdev-&gt;ddev-&gt;primary;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct dentry *root =3D mino=
r-&gt;debugfs_root;<br>
&gt;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (!root)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return;<br>
&gt; +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; debugfs_create_file(&quot;ra=
deon_vram&quot;, 0444, root, rdev,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; &amp;radeon_ttm_vram_fops);<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/radeon/rs400.c b/drivers/gpu/drm/radeon/r=
s400.c<br>
&gt; index 6383f7a34bd8..b41a903a29c3 100644<br>
&gt; --- a/drivers/gpu/drm/radeon/rs400.c<br>
&gt; +++ b/drivers/gpu/drm/radeon/rs400.c<br>
&gt; @@ -380,6 +380,9 @@ static void rs400_debugfs_pcie_gart_info_init(stru=
ct radeon_device *rdev)<br>
&gt;&nbsp;&nbsp; #if defined(CONFIG_DEBUG_FS)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct dentry *root =3D rdev=
-&gt;ddev-&gt;primary-&gt;debugfs_root;<br>
&gt;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (!root)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return;<br>
&gt; +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; debugfs_create_file(&quot;rs=
400_gart_info&quot;, 0444, root, rdev,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; &amp;rs400_debugfs_gart_info_fops);<br>
&gt;&nbsp;&nbsp; #endif<br>
&gt; diff --git a/drivers/gpu/drm/radeon/rv515.c b/drivers/gpu/drm/radeon/r=
v515.c<br>
&gt; index 63fb06e8e2d7..f39b6ab554f2 100644<br>
&gt; --- a/drivers/gpu/drm/radeon/rv515.c<br>
&gt; +++ b/drivers/gpu/drm/radeon/rv515.c<br>
&gt; @@ -257,6 +257,9 @@ void rv515_debugfs(struct radeon_device *rdev)<br>
&gt;&nbsp;&nbsp; #if defined(CONFIG_DEBUG_FS)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct dentry *root =3D rdev=
-&gt;ddev-&gt;primary-&gt;debugfs_root;<br>
&gt;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (!root)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return;<br>
&gt; +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; debugfs_create_file(&quot;rv=
515_pipes_info&quot;, 0444, root, rdev,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; &amp;rv515_debugfs_pipes_info_fops);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; debugfs_create_file(&quot;rv=
515_ga_info&quot;, 0444, root, rdev,<br>
&gt; --<br>
&gt; 2.32.0<br>
&gt;<br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_DM4PR12MB51365EC00912F06E301732D78BB29DM4PR12MB5136namp_--

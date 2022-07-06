Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2AE56860C
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 12:47:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D390E11361D;
	Wed,  6 Jul 2022 10:47:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2065.outbound.protection.outlook.com [40.107.93.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4169E112FF5;
 Wed,  6 Jul 2022 10:47:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YYL4bbAkCcU2HDdj+/gVA188kSHXsEwRJy1zFi0n9GVushMvAFXXXzcPITTgQVM+2R8imgxuIt235fuEnbkE+GY3fBYf+nVq45CFJLkOi517llbBEe/HjBL2+WLgET3q/VkpJt9bho1HADUq+h4SFpvdX4u+t9XkhDp0a7ISExmJqaeyq1sAsaB0/C+Dz6UGnJfc2SwwNH6LU7KToooVaFk3wvN3WiwOwBci61r+jq8LRX2tYqX7D9732eq3cN7Dp0h377BVe5NfcgpoIjlm0baKyUoABqoxInweaQWI7uFuKI47c70uA03gfsnzhFeBxmWnFeYpT6pW1PhSxW22kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JfJcZD/TYYKGI8YQhnU7XiGAnXrhCN7nLwq2VkCL5es=;
 b=Zo2FalLWEWDUfn6n+EiWiWB7MEzzTZDlRTmuR1W2H7Tvgwvm7q/nTykouLY94A0il89g5Kvgg4KUs87gTBlgO0F2KW7REx8S9Hj+Y4WKxKbxT00y3HduaibKZakI1dgxDoY6nwrVwEw9F+ORO/Ng2ImqWrY7T6VhuykIv9wyzKXWE5TjvIZO4DnvP9a90cIQOdwjfid9Euywn5A/4E7vArN5gSPmgn6vcIGmLYbcX0I74L6oa/Trj8bI5N9+RpaR0+zUB2kcxqhEgJ5A3JtP9JrBQskcgNWWJDL+iPBhLGvwCzSL//mJ6tY91OA47/MTKaKftNGXEJX+RsHNDNGutg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JfJcZD/TYYKGI8YQhnU7XiGAnXrhCN7nLwq2VkCL5es=;
 b=4fm9lyBqA7qdSKE17o+3inO5QQN51ebway9zQtgmNbirAlE+tngvoVNfX9bFEr2L8hRudpONww7PBo6LaEtKJOJ2a9Jc2/6g0zIU4jddVkJeRE4O01uAYcXSPf9hD2UOOJjbVWA4rW/11+LL8bR6WY5mVkmAV4RvrgWJ0r3NBN8=
Received: from DM4PR12MB5152.namprd12.prod.outlook.com (2603:10b6:5:393::16)
 by PH7PR12MB6611.namprd12.prod.outlook.com (2603:10b6:510:211::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Wed, 6 Jul
 2022 10:47:00 +0000
Received: from DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::7d16:a6b1:7a6a:aae8]) by DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::7d16:a6b1:7a6a:aae8%9]) with mapi id 15.20.5395.022; Wed, 6 Jul 2022
 10:47:00 +0000
From: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>
To: "dri-devel-bounces@lists.freedesktop.org"
 <dri-devel-bounces@lists.freedesktop.org>, "open list:DRM DRIVERS"
 <dri-devel@lists.freedesktop.org>
Subject: RE: drm/syncobj: flatten dma_fence_chains on transfer
Thread-Topic: drm/syncobj: flatten dma_fence_chains on transfer
Thread-Index: AdiRIu+rWeE+J5QBQ5ymcARY8GpauQAAqkBw
Date: Wed, 6 Jul 2022 10:46:59 +0000
Message-ID: <DM4PR12MB5152C2BDEDCD081D5974123AE3809@DM4PR12MB5152.namprd12.prod.outlook.com>
References: <DM4PR12MB515234346C965FD8936F5DEFE3809@DM4PR12MB5152.namprd12.prod.outlook.com>
In-Reply-To: <DM4PR12MB515234346C965FD8936F5DEFE3809@DM4PR12MB5152.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2022-07-06T10:11:07Z; 
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=cb34ef39-0f9a-4f5e-96f8-6a10539cad14;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=1
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_enabled: true
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_setdate: 2022-07-06T10:46:58Z
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_method: Standard
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_name: General
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_actionid: 51685f78-50d0-4205-8f90-ad7f88b47925
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0d25063a-2147-4a6f-1672-08da5f3cdad2
x-ms-traffictypediagnostic: PH7PR12MB6611:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RhQnnGOhoCdI5bfhWPiq1R/CehDkumTwIA3rVRgX8d9ogYChP+XGoT1nYL/bZmOzVgEM2a3vZMGw1Lb3Oq469qgATnS/fnMZSA0IHm/IGbUv96q+EbRtUs4PMEixUpsCeMye+aFIRpy3Ju8I5R506PLRg30htU75kQz1I3vShSC0SbKDAyTN6FadkV5DHz97mzBKp5i7U5QQ4LHXyp3d2X2owmKKMMVbx85+guTyRAA18Roq4QeFLIyOfNSi8rOyG08oHGq+m4mYEoJcMrcX5CRyJE/uAZ7Gp/N2pGl8v+TTPEkfB7xLPPRg9kdtrzJ93P9ZUwIzd8QtMXWKFdpntcN9ITDI965am8xTdgeZwTXJ4i8z1ZYM/pk4ThHiFA8zaiy355NxuO1eUAfETXxjZoHwxY5uQXsbunPBitZ7PxCN0dxrshRYjWfHhNNOMGFRRYkR9Dcs0yM2h+Y9D9cyilXMi8Euqe3o79XodSfCzMZqMLiP/4RdxaIAGRyan320PWopN02+0/ijqxzZpURConsgFN19Upgqk4NtFfKv9YoiW4cFQz+HnqviOd5INRgGXwHBExkdPP3lLsH6A17BmrlW3LI7s2Ov/E4h0ph186+r7TtU2GHkuB8oqLS/NF3SN3rMosedKOoTd583MDZXdKDw5iwAmDO76Qmr7R/8TxnfhUvqYBD3vDSe0roE1BTc/0sf5BttHaD2LgCjyzXa+8DJ+2UlCi7KB/DOZ5LJ/jgnq+rY1+MhuGCtA6/8gC3P9EnSGaSUywZSFlGSWMvksJmTZFxuGPsxKNwkRWsEn5XJibih0LYq+lufWu72/wOd
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5152.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(396003)(346002)(136003)(366004)(376002)(9686003)(26005)(52536014)(478600001)(86362001)(38100700002)(2940100002)(6506007)(7696005)(53546011)(33656002)(2906002)(41300700001)(186003)(5660300002)(8936002)(122000001)(4744005)(110136005)(38070700005)(54906003)(55016003)(316002)(71200400001)(66946007)(76116006)(66556008)(66476007)(66446008)(64756008)(4326008)(8676002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?p9SRJxxZxDYD3NHWg/fvFGKsT9QiPnypGBPO3GK9cIa41Eiq+iwPO9OifnmR?=
 =?us-ascii?Q?N9tS/HvXfVgyHJUh62IhN3O9Ot34s2hwv8EuKvxOFoznvDvSUCE5xkSZeJJ+?=
 =?us-ascii?Q?PrWL11ezEvJYBcvdhcGL5rdzN+EjzUoZyDO5vtdw7Y2358wjYLD4C4EV1Bxo?=
 =?us-ascii?Q?stDcvB9ED6A1BXgd8xIfaT36eGa57uhMGmsgrr662OralLMNPkwHy7bIM5Jy?=
 =?us-ascii?Q?Q/7dfQr/RNhyGzcPLA5TugjWlKupbKYpsViKpCE6CIO5Sb2lenPwrenz3sgC?=
 =?us-ascii?Q?lM3IjbICosobZgzgaG8BSUyXKyxbWs23E2855zMRyigCZ7THO6uN38j9ssle?=
 =?us-ascii?Q?EKdCdeHtyBcgEQPy4LuCG1IuoNmkG+UApqt398eA5TfStDtOr+NCKQReOSWO?=
 =?us-ascii?Q?W8AyeuwBcDenkHK8fY6HN1VLvt4rXUA+nOdBYcJ0cTl25i9vkJ0Y/IurlKBi?=
 =?us-ascii?Q?AHAJZxfSA2mVr15iFcy6AYIJgwW16sKzTfnjas5TUwSr6PMXL0ZCMrJBZXrb?=
 =?us-ascii?Q?AFduiUBn91D6vuyVVY9Vitu1MIg+HWIN/ff74G0VFxFTLcsDRO2f1izCFC1b?=
 =?us-ascii?Q?fyo/TrbEbQN5xKU1FOdhdCm21IQZgAjCXlg5ISr15ANARNmV+JKdz9+gyiQl?=
 =?us-ascii?Q?qQVZUu5lSHYytRNk9hFRMckQCq00uqpXqvRCsla28ivi0pmJk26Kd7TXFqbf?=
 =?us-ascii?Q?4ItMz/pnNu2gTS3HNis4TjGqntN5lENJI7ST129jdgJ3Spzl4H3u/eqZZeC9?=
 =?us-ascii?Q?iuSA0IlwYgc2dLnwPXrzf7dQjzBSfkBPkkyWO4oZqsAKLq2D7Vjjh+RFDzmv?=
 =?us-ascii?Q?2glcyB7R9PDTrq3M9srr5Ym9KoYudpGyl9/85MSwOxLMgVePfCO3ogrg2G4/?=
 =?us-ascii?Q?VENO904VYRdgBSyzTB3H6yuRW5TT37S7y3AFf4olzABcg3V5fcTzrfarjAhx?=
 =?us-ascii?Q?zmjyTqBAtlgx+6NeahKHxxrZrnY/7fDW80aTOdGtbWIJV6b4eupfSQY2KcN0?=
 =?us-ascii?Q?Se8Vblbb+OnjDtqf/K3Qjto3ssQK17StqngmpYgXVD/iY7R7fXHP3BXATYSt?=
 =?us-ascii?Q?LIN4B3+qhQAZm8xWwPYcxe5DY7DhVmwZetBXesURLNdHFn2M79FMl+IhPVc/?=
 =?us-ascii?Q?vuHsEHieAULPnv2g0iU0YvAFZ/m55RGAz6DHhsoqUJxwLubMO3lWSF+2UiCY?=
 =?us-ascii?Q?zZRewA9B3pT/DkTNxa/v2r0tS/SV1BpYPMVXJ+v3zzvVCvktQABXBzANciDp?=
 =?us-ascii?Q?AjsPAQLP8B9kfcM+XGg6ZuVsZjQorZUXamEgZuwgiXszFzFlFgEyWKJrETE5?=
 =?us-ascii?Q?l+mBgoY0b+y6nZtowlldDhemcQZpfmAonHE9PmMUSvT0/BX2+t53sq0DeM/d?=
 =?us-ascii?Q?s6325A0HwgF1NBwfLSihqemtxeh+qcutnIjM2R9/dCkjoebe1UecRA3p5SUq?=
 =?us-ascii?Q?qA/4m3C31FWC0KNPNHmSzLbSooWEoKrRE6nq20qPt2bXbz1U+FRlh90duiEH?=
 =?us-ascii?Q?UXhfy0TzoHvu0N7k7oFeikGFGKfr0R2gpah499ylljGLhjXquLtGRU05POn/?=
 =?us-ascii?Q?pmyt+nslWEUZs5s9yedQAUFPRL06lbTBiYs86+QY?=
Content-Type: multipart/alternative;
 boundary="_000_DM4PR12MB5152C2BDEDCD081D5974123AE3809DM4PR12MB5152namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5152.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d25063a-2147-4a6f-1672-08da5f3cdad2
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2022 10:46:59.9755 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0aeq4KG4LQhDu4QW6zPjqB841CFP8RuHj/SbdLieg5p/NmEkflBbLw+rQp/ay/uPapz4+NC5P9GeKfw/uUtRHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6611
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
Cc: Nirmoy Das <nirmoy.das@linux.intel.com>,
 "lucas.demarchi@intel.com" <lucas.demarchi@intel.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>,
 "lionel.g.landwerlin@intel.com" <lionel.g.landwerlin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_DM4PR12MB5152C2BDEDCD081D5974123AE3809DM4PR12MB5152namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - General]

+ Lionel

From: Zhang, Jesse(Jie)
Sent: Wednesday, 6 July 2022 6:41 pm
To: dri-devel-bounces@lists.freedesktop.org; open list:DRM DRIVERS <dri-dev=
el@lists.freedesktop.org>
Cc: Koenig, Christian <Christian.Koenig@amd.com>; lucas.demarchi@intel.com;=
 Nirmoy Das <nirmoy.das@linux.intel.com>
Subject: drm/syncobj: flatten dma_fence_chains on transfer


[AMD Official Use Only - General]

Fix sync syncobj issue by enable the signaling of the base fence.


diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index d5db818f1c76..971ad97a2f54 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -887,6 +887,7 @@ static int drm_syncobj_flatten_chain(struct dma_fence *=
*f)
                goto free_fences;

        dma_fence_put(*f);
+       dma_fence_enable_sw_signaling(&array->base);
        *f =3D array->fences[0];
        return 0;

--_000_DM4PR12MB5152C2BDEDCD081D5974123AE3809DM4PR12MB5152namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
p.msipheaderdf3d92d6, li.msipheaderdf3d92d6, div.msipheaderdf3d92d6
	{mso-style-name:msipheaderdf3d92d6;
	mso-margin-top-alt:auto;
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"msipheaderdf3d92d6" style=3D"margin:0cm"><span style=3D"font-si=
ze:10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:blue">[AMD Officia=
l Use Only - General]</span><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">+ Lionel<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal"><b>From:</b> Zhang, Jesse(Jie) <br>
<b>Sent:</b> Wednesday, 6 July 2022 6:41 pm<br>
<b>To:</b> dri-devel-bounces@lists.freedesktop.org; open list:DRM DRIVERS &=
lt;dri-devel@lists.freedesktop.org&gt;<br>
<b>Cc:</b> Koenig, Christian &lt;Christian.Koenig@amd.com&gt;; lucas.demarc=
hi@intel.com; Nirmoy Das &lt;nirmoy.das@linux.intel.com&gt;<br>
<b>Subject:</b> drm/syncobj: flatten dma_fence_chains on transfer<o:p></o:p=
></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"msipheaderdf3d92d6" style=3D"margin:0cm"><span style=3D"font-si=
ze:10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:blue">[AMD Officia=
l Use Only - General]</span><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Fix sync syncobj issue by enable the signaling of th=
e base fence.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers=
/gpu/drm/drm_syncobj.c<o:p></o:p></p>
<p class=3D"MsoNormal">index d5db818f1c76..971ad97a2f54 100644<o:p></o:p></=
p>
<p class=3D"MsoNormal">--- a/drivers/gpu/drm/drm_syncobj.c<o:p></o:p></p>
<p class=3D"MsoNormal">+++ b/drivers/gpu/drm/drm_syncobj.c<o:p></o:p></p>
<p class=3D"MsoNormal">@@ -887,6 +887,7 @@ static int drm_syncobj_flatten_c=
hain(struct dma_fence **f)<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto free_fences;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dma_fence=
_put(*f);<o:p></o:p></p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dma_fence_enab=
le_sw_signaling(&amp;array-&gt;base);<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *f =3D ar=
ray-&gt;fences[0];<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;=
<o:p></o:p></p>
</div>
</body>
</html>

--_000_DM4PR12MB5152C2BDEDCD081D5974123AE3809DM4PR12MB5152namp_--

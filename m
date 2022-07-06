Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D812A5685DA
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 12:41:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EC1A11354D;
	Wed,  6 Jul 2022 10:41:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2047.outbound.protection.outlook.com [40.107.101.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4DF511354D;
 Wed,  6 Jul 2022 10:41:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WBGDcN6Gi7JkC/xLxUkoHLZiBWinJvPg8S9PBW32CRVwPl0nt8XVBREsry0P4aZTOt2uxiz2f0wmNi9FvbZSh5xKOdJAWlKEoDMTVW+xiQMMDlk8OV42eaLaVzGYd54rtGTEpdXtQAe1CkS+Q74qYwWaq7vMFYZ91lNQk74LJde4UQeoEdAgQHgO67Dedsk4P1h0yPugsG2dM02k2WQfVVZI5+aI9pKVsFE25sG5xyhmxa9FM4gFwp9j/Wf4zpLz83A7BLbiBd6lfqZViuMwGSOHCy2RoCtQSg8lKbo7RCj1TkGq+muBDEpbgjByDXktgi9O54NuamaILLC/0Fdwmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=urG1v+IdMoY/cfjv6RASi2q/u5Q716ZXijBnjuNXwEQ=;
 b=i2V8E+nPqPJJu/C3VDoRDJBFUBZMgRv1CWHgXftqjBu+Qri0WQaWNsuYqkmkmdN6fwUZ+PUsEAxghaNlg+Qyx+j8H2RoH6N6jBqTjjKcFXWfxxfAdK7+PBqeCEewSWjSe0u/pj3nKYloqyLUZmby8hXEiQ3Sq9ynXXqsEVKAv39bxujp3ILGV6LBCPNDwzBc5ZjMHi19okbwVwMMp+DAIvHxoyYVdhN6Ov/WCow6nskVWTwwKkTlfJevvCA9KKm4BKVjdJjIjCZECwvtdldyH7tNfEvapyQedcCyaUE+TV9x6r5KU0Pa1SM0zXP7U/9KTayvL1wUZx/Im9tCaijXJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=urG1v+IdMoY/cfjv6RASi2q/u5Q716ZXijBnjuNXwEQ=;
 b=Vlw+j60jdgeYY9O5l1prh5lJBWplYEREz1jsTLI5anTNLt7YMgWoCBRc5eSACTvkHKlP05GJoH1VHjzktQMQdLIjYnQuBGU/ZISo8DMuMuGLcjlzHRGJzDU2CAavFTHTjmEPvmedtiPQhC8RegdpruyIRgt12q5uY78FsWVD7vs=
Received: from DM4PR12MB5152.namprd12.prod.outlook.com (2603:10b6:5:393::16)
 by DS0PR12MB6391.namprd12.prod.outlook.com (2603:10b6:8:cd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.22; Wed, 6 Jul
 2022 10:41:08 +0000
Received: from DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::7d16:a6b1:7a6a:aae8]) by DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::7d16:a6b1:7a6a:aae8%9]) with mapi id 15.20.5395.022; Wed, 6 Jul 2022
 10:41:08 +0000
From: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>
To: "dri-devel-bounces@lists.freedesktop.org"
 <dri-devel-bounces@lists.freedesktop.org>, "open list:DRM DRIVERS"
 <dri-devel@lists.freedesktop.org>
Subject: drm/syncobj: flatten dma_fence_chains on transfer
Thread-Topic: drm/syncobj: flatten dma_fence_chains on transfer
Thread-Index: AdiRIu+rWeE+J5QBQ5ymcARY8GpauQ==
Date: Wed, 6 Jul 2022 10:41:08 +0000
Message-ID: <DM4PR12MB515234346C965FD8936F5DEFE3809@DM4PR12MB5152.namprd12.prod.outlook.com>
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
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_setdate: 2022-07-06T10:41:06Z
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_method: Standard
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_name: General
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_actionid: 7e6ba956-c79e-4df9-9375-57f6bceb586e
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 30c80146-c6e7-4bfa-4a29-08da5f3c091f
x-ms-traffictypediagnostic: DS0PR12MB6391:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +MZK77Ns+4bkq9/z2u+MI/tyNbJRE4DMkFAmSpDd7JPCzzM6gGeBhGyzsTkY7ZHLGqkYo3vH1i9A44WZNJkDyIYhQMTchn4mn/WuAlusYXhR2bO0R6OWV1YTXIxLYy1wNQByqta7gySEmzzYUtVNcjRtwyysJdWpkiiiQ3MQ//0IYf9L/y//PFl1Gmwxh6xOAavBnonzilwS44zUminfbsjH9PAgwM2hfbjNr5Bn5fNXJODWaUOosLWvxgs+ZN7dj4srZsZf7mrb3aPJ3bAT3z7czrsjMjHDLjRxPLIQQgRFew8Z/KRZ07Ye7p2h/ao4Q5bU07zpyFG2W/WsWxEs1LQaZm+IspAZ2GJxviC6T79P+XTLO/dkpsrheLQllLM5QVfVfxZqhL3Mk2fnpF0XebdDAhmr/5236r4ZkwxYW1QV7L8fvqEpfcN+AHmKXByEUXxguy+Sia1VsclqnQx3bYNmQFjHwTytGuM/9VhbAjlzHfjRaJH2pXSYfGNqeDQIyBliZ/bE4GKEgOzcuaZHNE3wLj+G/9nfiBSI5ZBD/Uqv61jbc1H91/qsyu8RQZEkj6rtpLprkZcqzG+l0jxZQCXkdehquTnZtTOu1Cj2OhhDNm3WO4sykSxiFuNbjuVQP6yiscSIsg76yAZmjTtcMhl6LOdufdyPrt9vTbKYsEWBWz86AMvkQnI/XzddojmmkhOS6JXswXrgm+nFhnKaRmfxjnTUq0kSe4FZnSWFvY4vr8dteAlahQ7aXn2L5xYt1VjnWUdIdSMuuAK/Ya2vniWI1JwT/ylwe0vCoCKvwAiD354kq2H3F8n7lDPqOvOd
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5152.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(39860400002)(136003)(396003)(366004)(376002)(186003)(71200400001)(55016003)(26005)(6506007)(41300700001)(2906002)(54906003)(38070700005)(110136005)(316002)(7696005)(122000001)(38100700002)(52536014)(8936002)(5660300002)(86362001)(4744005)(66556008)(33656002)(478600001)(66946007)(4326008)(8676002)(9686003)(64756008)(66446008)(66476007)(76116006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Ltv6+OzbiqcFskFVuf+0n68QMmYLMK1BErfUJazsrdbEZ/+iPx3WFPVFDuay?=
 =?us-ascii?Q?nNmCyBh9FuU1NKpWl1hkh2tVo7OX8JrSgos1Z8IF60PBO4+R+Mby3DzgxP+w?=
 =?us-ascii?Q?vGsfwd9C7y35zx3YbVSqF03Wa2QldZqGFRUVnjaxFw17lFn+YGAUq8QXxhkO?=
 =?us-ascii?Q?EBlr2epLtvfP4betdGGJsF+HFA6yBBCCHbRdLhW/Sipmwp8tDwtkUM+yfl3B?=
 =?us-ascii?Q?kWN2jhRSZl1tasPuDJki63rF97A97w3SfgKid3uIU/GhKt8lTZsyDeqh9Lpa?=
 =?us-ascii?Q?qpa6KKbCUcbDAeRKqzST3y/2d49YGB5bJASE1NpNfWRz0FQNOv1yVV5HN2j0?=
 =?us-ascii?Q?ZLroQ/2mBm5s3/sgBy5Z1RZdXYdx/fdM3IBtezZJuYNn4Sht27QD7K6qCkTd?=
 =?us-ascii?Q?qwvnhPojd5TtOGl1YtoXNJ7HkQSw52FYNymQdhU5QBh6TRU5gPuOYRzonvM9?=
 =?us-ascii?Q?ALB2spKpU9XL9wInfhjMDB3Uq3sSHiwdqalMRpDH8MsGSVmlB/JYGLssr0X7?=
 =?us-ascii?Q?c2/WV51DUf1pIbYgXDRsrDj0/ETo2jRnosMRm3BV2u6SybgIFFBw8L2dLtHm?=
 =?us-ascii?Q?erGAdxpzPGoUCJzpFWf5iljpnif/PwMy3a1lRyK9G6ZgaGWw8HWB3CYTGDqj?=
 =?us-ascii?Q?qFaZmAugkYnh2RJmFkdwSOk/hJDglu0PJZApylIKCU/jjf4neueb2gFT6Ij4?=
 =?us-ascii?Q?qM9rKjEe1CjymhqSB+UsRM2yAHMgWFYPlvX/yunOxIoFASk7LDtzMTmiAuXY?=
 =?us-ascii?Q?GsjaMBXWYz3Aj1f4vG60G+eHcZnmqU0+YNo0MxC1qrKASgyEYSNxzJFTUEjQ?=
 =?us-ascii?Q?glIJLaZ6xz0kPqf1kBXESgllCNTbqkbh7mo6ivpBPsZrkHdWkg+L4d2SAOyg?=
 =?us-ascii?Q?9bmq3+f5ivWXeIOies2obnyyw6IUftGh3E189ADptSG++Gs/Wy+F1AM5ACk9?=
 =?us-ascii?Q?wbEYkh7Ry6zbSVO17B7W2+yZBQUaXOz5GEnmCDAwFCceOaH/wYNuRVTosAXu?=
 =?us-ascii?Q?34xbRyYgwxX2LhMMTFK5jOKZFBdR5g9GULIayB0qnzNSzwPhvUPIPBkFui8p?=
 =?us-ascii?Q?OpWCbNpAUBJuV59jFrRNWBxFYmzNvXN0wEKQ9Vz+PiTz5m3kfodhTC4rPe3N?=
 =?us-ascii?Q?lzSZJWWnE9o3NO/TOw2ZzQ9eb51P+nAcHJW7AoEsR3iiv/rq7QE2PZ70foUp?=
 =?us-ascii?Q?gU+wnpLsQliAahy5lXWHhgIH46b0J+4sKhUyr4LXkQa85K+U7ybworP7x4b2?=
 =?us-ascii?Q?Y8c7zeTikCCtc4pgkuZm1n2IKDbsmiy6KeeL0fWSiBL/6cMj+rqBMN20D21O?=
 =?us-ascii?Q?zhqYecVTQACYrqHxp+MffezpuFvFOX2BS/E65Ul0C5nDYa5wDJaMvwkpT+ou?=
 =?us-ascii?Q?eQX9A/8dElzjFtbPZ66g2cQXGE0i/DHXE3EZzF3TMLVc/ZIPcrw3D53pkEbj?=
 =?us-ascii?Q?AaJ6+jYvIX72RI2Mjy1ROStKWnpnuXnh1zNus/7aAnictG+rpJ1JuWVPGvd9?=
 =?us-ascii?Q?tI/8gW8waVA3i9bsiq4gRB3c/i5gTuOWdPr1/o1LpThI4Kp14vtnckBxzeOo?=
 =?us-ascii?Q?7yaBjDrqculRTLqz2UYZWhEAwMQJJnXwaooFa+w2?=
Content-Type: multipart/alternative;
 boundary="_000_DM4PR12MB515234346C965FD8936F5DEFE3809DM4PR12MB5152namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5152.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30c80146-c6e7-4bfa-4a29-08da5f3c091f
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2022 10:41:08.1756 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kHq6HTfrPBeQbEEXpyUx97uwP8SS3P3p2jF0wPdpyWrY20MUN2eHCAa0eOXVmXk8eQk+2dwkmQrs58/BsWcx5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6391
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
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_DM4PR12MB515234346C965FD8936F5DEFE3809DM4PR12MB5152namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

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

--_000_DM4PR12MB515234346C965FD8936F5DEFE3809DM4PR12MB5152namp_
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
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
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
<p class=3D"msipheaderdf3d92d6" align=3D"Left" style=3D"margin:0"><span sty=
le=3D"font-size:10.0pt;font-family:Arial;color:#0000FF">[AMD Official Use O=
nly - General]</span></p>
<br>
<div class=3D"WordSection1">
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

--_000_DM4PR12MB515234346C965FD8936F5DEFE3809DM4PR12MB5152namp_--

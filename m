Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2DA65F0E4
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 17:11:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1773B10E14F;
	Thu,  5 Jan 2023 16:11:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2061.outbound.protection.outlook.com [40.107.102.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62F9710E14F;
 Thu,  5 Jan 2023 16:11:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c078cjraN1pBltUV3cu1dEhww0Mx3rVOMwQ4by6CqzQzPHehW1j41sNLCLJYhFIigpCQTOKxYruK5zPFr6iG2mRpgPYOo3GhVClcEfFSSN1+2gIC3r1/b9C6PosfCrkjgADtX9W8fVwSIg2LahtcQPKrXq7bDJqZnMCwItDlNIOYz8cFDbGi2Gw0jVC/138ve6vFV3TQS3SQbHV99TZgD22cg/FaijJRwdHgj4fgWKkdDyJvkrpQAYiNU2oET+ytEXZmPaPF3cDZ7Ul1MOciES/xwWz8zo5nWdS20qGlzAuU9yS68jevTAW+LEiE0rUt9tpZa/u3SfLlTBDZ+Q8NZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8y2T4/0YnGLA9+g24Fp3ulzk6xOOqed2lQmNrWZoWxI=;
 b=cpl2PmgaDzitzzLbgjd7xoiMttuG0oJtno2rdCEmhTV8K6gdHzUc8rUAL5eLO6MAeZYEHAOtGwNy9bsOfNdgPlBheKEab39wfwK5Um2FocDXnGRHi5PSYVS225ZUqEZLTez8+2cVUZpVOjyMTSGIbMG+dcX07MEW4wSyy2VlK+WtcpMwVMLohonWt/rMw1op8G8DjPLXqJQcpvpvjwM7lfMD1JkkIcHS9OpdH/0vWGWjK3U23uLrbeb6pyHnHBvkwo0drTda2sthbzS5KTLWb/0qXub2BIauXzBITt41hj71JzW4X0/lR97WyDB9/JNGPzemHlnteXNl0MsuVe4lYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8y2T4/0YnGLA9+g24Fp3ulzk6xOOqed2lQmNrWZoWxI=;
 b=reJrq8/+LFil2fMJ2EzKbqhYH1aze61K3GPfFWQu/oURe27IzBcVtH82ND2Hm4X7GlvYz9sJFaAhjsUxHFQ5gTW8+x2fBUWUg4DGAYR9ab+lA8bm8vBz8v4DnUqlWXLfNdUjEV53eESLw74o819WNb9kgoNiYc9dyZaQHMuqJi0=
Received: from BYAPR12MB4614.namprd12.prod.outlook.com (2603:10b6:a03:a6::22)
 by MW3PR12MB4570.namprd12.prod.outlook.com (2603:10b6:303:5f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 16:11:40 +0000
Received: from BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::457b:5c58:8ad2:40fa]) by BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::457b:5c58:8ad2:40fa%6]) with mapi id 15.20.5944.019; Thu, 5 Jan 2023
 16:11:40 +0000
From: "Lazar, Lijo" <Lijo.Lazar@amd.com>
To: "Limonciello, Mario" <Mario.Limonciello@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 20/45] drm/amd: Parse both v1 and v2 TA microcode
 headers using same function
Thread-Topic: [PATCH v6 20/45] drm/amd: Parse both v1 and v2 TA microcode
 headers using same function
Thread-Index: AQHZILgLm+0DOnwe/E6fL/AHByU5Iq6P0A4AgAAtYYCAAADRGA==
Date: Thu, 5 Jan 2023 16:11:40 +0000
Message-ID: <BYAPR12MB4614A65CE7A1FFABA5CA100F97FA9@BYAPR12MB4614.namprd12.prod.outlook.com>
References: <20230105034327.1439-1-mario.limonciello@amd.com>
 <20230105034327.1439-21-mario.limonciello@amd.com>
 <142113d4-b958-c55e-eacd-04ff4ef3243f@amd.com>
 <MN0PR12MB6101E4C5B4718736A2F9B2EBE2FA9@MN0PR12MB6101.namprd12.prod.outlook.com>
In-Reply-To: <MN0PR12MB6101E4C5B4718736A2F9B2EBE2FA9@MN0PR12MB6101.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=True;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-01-05T16:04:48.0000000Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4614:EE_|MW3PR12MB4570:EE_
x-ms-office365-filtering-correlation-id: aed809cc-9a14-4602-8bcf-08daef378792
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NHrndlMif3PkgBhFCSSfavu2nonRzL71an4SGjyYbu8l6sqfjVjhopGoqZ6gPc2A9M/szL8aXipcjM0mP6s5O5MqltQxN3M0Q9Wa/X+iJH8525UnKENS26NM+gL9p4k4OR88Ib+GlKPwnICWugb52f9xJA1Dvu9HerjT5g3zrCAQtOqy4tB6PduUdVH8dMIpWQTwAaBgpH2Q1Art6bIOMZS8xSztDks+e1x2IwJJzMw4va1vD1/Wa0PyewZLdnZEhitVMaSwqHIkyMQ/KKJvCUJcWE5LVaS1Gmd5BhT0DIevVv3q/evkgWm3tSw33NOfirjLnppYQeU48J0vuKy/exwA7kge/18/UIxPmNOKpvDyZJ8GwWkVXp0XACKmPfY3NcHEh3iRRaR8QnOp0XUAh9xG6I1B5XcV3J3qSoYdqaoppn3IKMEsSfV3EsdKEjJm0AiYto7HymeJyaJiU6yZyu5XoW/huVWw6KgaC1AjysksxGZnHcyZ0Vw4jNHpXmOF9XrRDJrCvWneMSd1NxARAJKeJjDDxzspQjvjlgmISOrpnpSb4iCoLonkIN9wyb5tfqQ21+JEK+QZtnFSGvupxCVVQ91HouaritYw2EKe067/62KQgXopM/shglT7UZbzoBDSS2QueIdyIRyvpJj8A03Dm3er3MKrF4I9okj4tQV4XyNC3C1+HF/jgquRq1ifEGeoRjcvKFpA1xxinry12w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB4614.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(136003)(39860400002)(376002)(346002)(396003)(451199015)(186003)(9686003)(26005)(53546011)(38100700002)(38070700005)(55016003)(83380400001)(86362001)(122000001)(30864003)(66946007)(41300700001)(316002)(52536014)(8936002)(5660300002)(8676002)(66476007)(91956017)(4326008)(66556008)(76116006)(66446008)(478600001)(7696005)(6506007)(64756008)(54906003)(110136005)(71200400001)(2906002)(33656002)(579004)(559001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?5xu5y8HPxOQIWObhCt5gZceq62PMf5nZXMzZomz1EBgWkczEcnHkXwq63aIJ?=
 =?us-ascii?Q?404veJt1/96sb8tknztOsEN6pU1eR28uLCFM8FnjJZe/YgcQdGP4RvYlZf4T?=
 =?us-ascii?Q?XH14jsN5jrXK4tEAU7iP/KJzKQia6w+UmDQDkPoa4ewD+PUZNv4oXmc3+d7f?=
 =?us-ascii?Q?uoZn7NVpyeqoPjWMI5UIUwaiEKLyfNXroj3nGjH5g7xyqNcYmSuSwSh8kl2h?=
 =?us-ascii?Q?bQBcw3OPeUzmdTl9ypQtJ2hQGyW1+3wAubtr0h+WpjmAQfFUjcgVAtDTq6R5?=
 =?us-ascii?Q?F5IP/MlfdMHZ25IAuKeocd2/BRA1TXUCUtgZp+Owh9oClcF5SKUkKpITJHFK?=
 =?us-ascii?Q?xoaCnlKAsx3Z40AiuKOJhR9ITAftSAWEjYRYhAJUrGhDiRGjU1VMt5gswQjG?=
 =?us-ascii?Q?66wSpwOhqu+EF590le7MNtoYESB09a4Ow4vXzvjQquPhsRY1Mct4DJL+t8fs?=
 =?us-ascii?Q?zoQd5CbhQ8KGZ7nMaQDyIx7h1rFdP/4QSk7kuOh8tAp1EnyPRuV0B84NCng9?=
 =?us-ascii?Q?iZri9kOmk0PmTdqCrtIDgSQb1mX5fznugpnuOF6Sg5vyTKGUPqnNQxqjnBvP?=
 =?us-ascii?Q?JCp+3/aSANRTHofnQHonnrNzZpDSxk1+tfPzvMtTC8pGexjofDZl8NQQVAYr?=
 =?us-ascii?Q?RBbQeq/eQDV2nTSb1n5dsQfBAJ7vETeQH8HJ0mUKka7zesuP7Ci392fn6vpY?=
 =?us-ascii?Q?QDSipvNYSMbOlUPIDjOviq+uIb5AsOp+mFyieUWszzaVs/1T8UCuZK+Ua08X?=
 =?us-ascii?Q?YiDmbv5WbPFZx0tW95KdBKfw0Ga0xQbve/kbj8HrZgMYsHTNvWyozISlKyHe?=
 =?us-ascii?Q?/8KHHIoZ/k9IHNup+TWrS46Fuu/2HSXatnt0YxwmqVRXvbAvb7MS70wTnUte?=
 =?us-ascii?Q?PzVBy4XHF2AHI9RtmAPORlVG+b6qv2FNS1mqffg5QiQZj7FNhOBxP/5y1qzx?=
 =?us-ascii?Q?65V1tfzViB+AeY/yffBwlBpsUVCvfFIqlKDY/6L+5BztweZj1ySX2zqQK6dK?=
 =?us-ascii?Q?9XFQhviTLiFR3to219RteL18OiQN1JeaPzUgmgZ7AuBUN+b/0yd+OT/TttOD?=
 =?us-ascii?Q?L7QMKPalXHthoVpTDlO1g99osNyO7kawomSwr7CUD1oqW8A+3wYZvDptasmq?=
 =?us-ascii?Q?my7ZU5KgX/BCjWoh7z8CteLs1Gpvvl5cEHMnzKm9Xpb6kT2WojOSp4i/drK2?=
 =?us-ascii?Q?z3NCFP99YtVbMZ00Ihgdx9+cS8JLcNZ5qQnjwEV95Jwo/whLZbVpJlgyJnRj?=
 =?us-ascii?Q?bHgIQduoKLoIPXffImMBIBTUs2i/sIaAZtJ8POVjyY5Af68wsuY0mW2qP8VE?=
 =?us-ascii?Q?hBKkfRlDxPW8AUWvr1BUwAH1EkHK94NsQeEnbOlLeudMcBpGTbn6XM1w0Xbd?=
 =?us-ascii?Q?2f+YQZQS9BXhtaGX7qVMh+JqkOuUfk3gBrBhFKGTb6sjEkmCRfwz/VX2iCGE?=
 =?us-ascii?Q?ICkC5ACjMAngwZSFJByuPku5p9OpNTCBPhSbqbsQBBeGFaAZyshRptUSYY2P?=
 =?us-ascii?Q?k9uOOnzbXssuRlUi9Cwk2Kw+sn2ixI973PKb/xybBSojzk/1XK0M8VrsR4w7?=
 =?us-ascii?Q?mrc97XjwiZrgbJfcqbDsIfcw+baTjxlG8EPNpCfA?=
Content-Type: multipart/alternative;
 boundary="_000_BYAPR12MB4614A65CE7A1FFABA5CA100F97FA9BYAPR12MB4614namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4614.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aed809cc-9a14-4602-8bcf-08daef378792
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2023 16:11:40.2801 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZL+TGR3IwujeP5YZ5FIRb4Kwkd1BvysG07m3Tv4/q4ADEH7mwOjcs1UdbJu2XXl6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4570
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Carlos Soriano Sanchez <csoriano@redhat.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_BYAPR12MB4614A65CE7A1FFABA5CA100F97FA9BYAPR12MB4614namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - General]

In general, one file carries multiple binaries. Maybe the check is there as=
 the same binary file is used in a derivative of Renoir or PSP v12 based SO=
Cs.

Keeping size of the binary as 0 prevents the load (I think there's a check)=
.

Apart from this one, rest of the series is

Reviewed-by: Lijo Lazar <lijo.lazar@amd.com<mailto:lijo.lazar@amd.com>>


Thanks,
Lijo
________________________________
From: Limonciello, Mario <Mario.Limonciello@amd.com>
Sent: Thursday, January 5, 2023 9:34:49 PM
To: Lazar, Lijo <Lijo.Lazar@amd.com>; Deucher, Alexander <Alexander.Deucher=
@amd.com>; linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>
Cc: Javier Martinez Canillas <javierm@redhat.com>; Carlos Soriano Sanchez <=
csoriano@redhat.com>; amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesk=
top.org>; dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>=
; David Airlie <airlied@gmail.com>; Daniel Vetter <daniel@ffwll.ch>; Koenig=
, Christian <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>
Subject: RE: [PATCH v6 20/45] drm/amd: Parse both v1 and v2 TA microcode he=
aders using same function

[AMD Official Use Only - General]



> -----Original Message-----
> From: Lazar, Lijo <Lijo.Lazar@amd.com>
> Sent: Thursday, January 5, 2023 07:22
> To: Limonciello, Mario <Mario.Limonciello@amd.com>; Deucher, Alexander
> <Alexander.Deucher@amd.com>; linux-kernel@vger.kernel.org
> Cc: Javier Martinez Canillas <javierm@redhat.com>; Carlos Soriano Sanchez
> <csoriano@redhat.com>; amd-gfx@lists.freedesktop.org; dri-
> devel@lists.freedesktop.org; David Airlie <airlied@gmail.com>; Daniel Vet=
ter
> <daniel@ffwll.ch>; Koenig, Christian <Christian.Koenig@amd.com>; Pan,
> Xinhui <Xinhui.Pan@amd.com>
> Subject: Re: [PATCH v6 20/45] drm/amd: Parse both v1 and v2 TA microcode
> headers using same function
>
>
>
> On 1/5/2023 9:12 AM, Mario Limonciello wrote:
> > Several IP versions duplicate code and can't use the common helpers.
> > Move this code into a single function so that the helpers can be used.
> >
> > Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
> > Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> > ---
> > v5->v6:
> >   * Rebase on earlier patches
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c | 120
> ++++++++++++++++++------
> >   drivers/gpu/drm/amd/amdgpu/psp_v10_0.c  |  64 +------------
> >   drivers/gpu/drm/amd/amdgpu/psp_v11_0.c  |  77 ++-------------
> >   drivers/gpu/drm/amd/amdgpu/psp_v12_0.c  |  62 +-----------
> >   4 files changed, 109 insertions(+), 214 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
> > index 7a2fc920739b..d971e3785eaf 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
> > @@ -3272,41 +3272,75 @@ static int parse_ta_bin_descriptor(struct
> psp_context *psp,
> >      return 0;
> >   }
> >
> > -int psp_init_ta_microcode(struct psp_context *psp,
> > -                     const char *chip_name)
> > +static int parse_ta_v1_microcode(struct psp_context *psp)
> >   {
> > +   const struct ta_firmware_header_v1_0 *ta_hdr;
> >      struct amdgpu_device *adev =3D psp->adev;
> > -   char fw_name[PSP_FW_NAME_LEN];
> > -   const struct ta_firmware_header_v2_0 *ta_hdr;
> > -   int err =3D 0;
> > -   int ta_index =3D 0;
> >
> > -   if (!chip_name) {
> > -           dev_err(adev->dev, "invalid chip name for ta microcode\n");
> > +   ta_hdr =3D (const struct ta_firmware_header_v1_0 *)
> > +                    adev->psp.ta_fw->data;
> > +
> > +   if (le16_to_cpu(ta_hdr->header.header_version_major) !=3D 1)
> >              return -EINVAL;
> > +
> > +   adev->psp.xgmi_context.context.bin_desc.fw_version =3D
> > +           le32_to_cpu(ta_hdr->xgmi.fw_version);
> > +   adev->psp.xgmi_context.context.bin_desc.size_bytes =3D
> > +           le32_to_cpu(ta_hdr->xgmi.size_bytes);
> > +   adev->psp.xgmi_context.context.bin_desc.start_addr =3D
> > +           (uint8_t *)ta_hdr +
> > +           le32_to_cpu(ta_hdr->header.ucode_array_offset_bytes);
> > +   adev->psp.ta_fw_version =3D le32_to_cpu(ta_hdr-
> >header.ucode_version);
> > +   adev->psp.ras_context.context.bin_desc.fw_version =3D
> > +           le32_to_cpu(ta_hdr->ras.fw_version);
> > +   adev->psp.ras_context.context.bin_desc.size_bytes =3D
> > +           le32_to_cpu(ta_hdr->ras.size_bytes);
> > +   adev->psp.ras_context.context.bin_desc.start_addr =3D
> > +           (uint8_t *)adev-
> >psp.xgmi_context.context.bin_desc.start_addr +
> > +           le32_to_cpu(ta_hdr->ras.offset_bytes);
> > +   adev->psp.hdcp_context.context.bin_desc.fw_version =3D
> > +           le32_to_cpu(ta_hdr->hdcp.fw_version);
> > +   adev->psp.hdcp_context.context.bin_desc.size_bytes =3D
> > +           le32_to_cpu(ta_hdr->hdcp.size_bytes);
> > +   adev->psp.hdcp_context.context.bin_desc.start_addr =3D
> > +           (uint8_t *)ta_hdr +
> > +           le32_to_cpu(ta_hdr->header.ucode_array_offset_bytes);
> > +   adev->psp.ta_fw_version =3D le32_to_cpu(ta_hdr-
> >header.ucode_version);
> > +   adev->psp.dtm_context.context.bin_desc.fw_version =3D
> > +           le32_to_cpu(ta_hdr->dtm.fw_version);
> > +   adev->psp.dtm_context.context.bin_desc.size_bytes =3D
> > +           le32_to_cpu(ta_hdr->dtm.size_bytes);
> > +   adev->psp.dtm_context.context.bin_desc.start_addr =3D
> > +           (uint8_t *)adev-
> >psp.hdcp_context.context.bin_desc.start_addr +
> > +           le32_to_cpu(ta_hdr->dtm.offset_bytes);
> > +   if (adev->apu_flags & AMD_APU_IS_RENOIR) {
> > +           adev-
> >psp.securedisplay_context.context.bin_desc.fw_version =3D
> > +                   le32_to_cpu(ta_hdr->securedisplay.fw_version);
> > +           adev-
> >psp.securedisplay_context.context.bin_desc.size_bytes =3D
> > +                   le32_to_cpu(ta_hdr->securedisplay.size_bytes);
> > +           adev-
> >psp.securedisplay_context.context.bin_desc.start_addr =3D
> > +                   (uint8_t *)adev-
> >psp.hdcp_context.context.bin_desc.start_addr +
> > +                   le32_to_cpu(ta_hdr->securedisplay.offset_bytes);
> >      }
>
> psp_v10_0_init_microcode used to get securedisplay_context
> unconditionally and now this is restricted to RENOIR following the logic
> in psp v12.

Good catch, thanks.  I'll fix that.

> Better is to fetch all FW details unconditionally and make
> the size_bytes to 0 (just to be sure) in specific PSP versions to
> prevent their load.

I do have to wonder if this was just an oversight or it's intentional?

For now I'll return it to just check in Renoir in psp-v12 code though.
We can remove that bit later if it was just an oversight.

>
> Thanks,
> Lijo
>
> >
> > -   snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_ta.bin",
> chip_name);
> > -   err =3D request_firmware(&adev->psp.ta_fw, fw_name, adev->dev);
> > -   if (err)
> > -           goto out;
> > +   return 0;
> > +}
> >
> > -   err =3D amdgpu_ucode_validate(adev->psp.ta_fw);
> > -   if (err)
> > -           goto out;
> > +static int parse_ta_v2_microcode(struct psp_context *psp)
> > +{
> > +   const struct ta_firmware_header_v2_0 *ta_hdr;
> > +   struct amdgpu_device *adev =3D psp->adev;
> > +   int err =3D 0;
> > +   int ta_index =3D 0;
> >
> >      ta_hdr =3D (const struct ta_firmware_header_v2_0 *)adev-
> >psp.ta_fw->data;
> >
> > -   if (le16_to_cpu(ta_hdr->header.header_version_major) !=3D 2) {
> > -           dev_err(adev->dev, "unsupported TA header version\n");
> > -           err =3D -EINVAL;
> > -           goto out;
> > -   }
> > +   if (le16_to_cpu(ta_hdr->header.header_version_major) !=3D 2)
> > +           return -EINVAL;
> >
> >      if (le32_to_cpu(ta_hdr->ta_fw_bin_count) >=3D
> UCODE_MAX_PSP_PACKAGING) {
> >              dev_err(adev->dev, "packed TA count exceeds maximum
> limit\n");
> > -           err =3D -EINVAL;
> > -           goto out;
> > +           return -EINVAL;
> >      }
> >
> >      for (ta_index =3D 0; ta_index < le32_to_cpu(ta_hdr-
> >ta_fw_bin_count); ta_index++) {
> > @@ -3314,14 +3348,46 @@ int psp_init_ta_microcode(struct psp_context
> *psp,
> >                                            &ta_hdr->ta_fw_bin[ta_index]=
,
> >                                            ta_hdr);
> >              if (err)
> > -                   goto out;
> > +                   return err;
> >      }
> >
> >      return 0;
> > -out:
> > -   dev_err(adev->dev, "fail to initialize ta microcode\n");
> > -   release_firmware(adev->psp.ta_fw);
> > -   adev->psp.ta_fw =3D NULL;
> > +}
> > +
> > +int psp_init_ta_microcode(struct psp_context *psp, const char
> *chip_name)
> > +{
> > +   const struct common_firmware_header *hdr;
> > +   struct amdgpu_device *adev =3D psp->adev;
> > +   char fw_name[PSP_FW_NAME_LEN];
> > +   int err;
> > +
> > +   snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_ta.bin",
> chip_name);
> > +   err =3D request_firmware(&adev->psp.ta_fw, fw_name, adev->dev);
> > +   if (err)
> > +           return err;
> > +   err =3D amdgpu_ucode_validate(adev->psp.ta_fw);
> > +   if (err)
> > +           return err;
> > +
> > +   hdr =3D (const struct common_firmware_header *)adev->psp.ta_fw-
> >data;
> > +   switch (le16_to_cpu(hdr->header_version_major)) {
> > +   case 1:
> > +           err =3D parse_ta_v1_microcode(psp);
> > +           break;
> > +   case 2:
> > +           err =3D parse_ta_v2_microcode(psp);
> > +           break;
> > +   default:
> > +           dev_err(adev->dev, "unsupported TA header version\n");
> > +           err =3D -EINVAL;
> > +   }
> > +
> > +   if (err) {
> > +           dev_err(adev->dev, "fail to initialize ta microcode\n");
> > +           release_firmware(adev->psp.ta_fw);
> > +           adev->psp.ta_fw =3D NULL;
> > +   }
> > +
> >      return err;
> >   }
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v10_0.c
> b/drivers/gpu/drm/amd/amdgpu/psp_v10_0.c
> > index 9de46fa8f46c..f14fcfb9c425 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/psp_v10_0.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/psp_v10_0.c
> > @@ -48,9 +48,8 @@ static int psp_v10_0_init_microcode(struct
> psp_context *psp)
> >   {
> >      struct amdgpu_device *adev =3D psp->adev;
> >      const char *chip_name;
> > -   char fw_name[30];
> > +   char ucode_prefix[30];
> >      int err =3D 0;
> > -   const struct ta_firmware_header_v1_0 *ta_hdr;
> >      DRM_DEBUG("\n");
> >
> >      switch (adev->asic_type) {
> > @@ -64,66 +63,13 @@ static int psp_v10_0_init_microcode(struct
> psp_context *psp)
> >              break;
> >      default: BUG();
> >      }
> > +   amdgpu_ucode_ip_version_decode(adev, MP0_HWIP,
> ucode_prefix, sizeof(ucode_prefix));
> >
> > -   err =3D psp_init_asd_microcode(psp, chip_name);
> > +   err =3D psp_init_asd_microcode(psp, ucode_prefix);
> >      if (err)
> > -           goto out;
> > -
> > -   snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_ta.bin",
> chip_name);
> > -   err =3D request_firmware(&adev->psp.ta_fw, fw_name, adev->dev);
> > -   if (err) {
> > -           release_firmware(adev->psp.ta_fw);
> > -           adev->psp.ta_fw =3D NULL;
> > -           dev_info(adev->dev,
> > -                    "psp v10.0: Failed to load firmware \"%s\"\n",
> > -                    fw_name);
> > -   } else {
> > -           err =3D amdgpu_ucode_validate(adev->psp.ta_fw);
> > -           if (err)
> > -                   goto out2;
> > -
> > -           ta_hdr =3D (const struct ta_firmware_header_v1_0 *)
> > -                            adev->psp.ta_fw->data;
> > -           adev->psp.hdcp_context.context.bin_desc.fw_version =3D
> > -                   le32_to_cpu(ta_hdr->hdcp.fw_version);
> > -           adev->psp.hdcp_context.context.bin_desc.size_bytes =3D
> > -                   le32_to_cpu(ta_hdr->hdcp.size_bytes);
> > -           adev->psp.hdcp_context.context.bin_desc.start_addr =3D
> > -                   (uint8_t *)ta_hdr +
> > -                   le32_to_cpu(ta_hdr-
> >header.ucode_array_offset_bytes);
> > -
> > -           adev->psp.dtm_context.context.bin_desc.fw_version =3D
> > -                   le32_to_cpu(ta_hdr->dtm.fw_version);
> > -           adev->psp.dtm_context.context.bin_desc.size_bytes =3D
> > -                   le32_to_cpu(ta_hdr->dtm.size_bytes);
> > -           adev->psp.dtm_context.context.bin_desc.start_addr =3D
> > -                   (uint8_t *)adev-
> >psp.hdcp_context.context.bin_desc.start_addr +
> > -                   le32_to_cpu(ta_hdr->dtm.offset_bytes);
> > -
> > -           adev-
> >psp.securedisplay_context.context.bin_desc.fw_version =3D
> > -                   le32_to_cpu(ta_hdr->securedisplay.fw_version);
> > -           adev-
> >psp.securedisplay_context.context.bin_desc.size_bytes =3D
> > -                   le32_to_cpu(ta_hdr->securedisplay.size_bytes);
> > -           adev-
> >psp.securedisplay_context.context.bin_desc.start_addr =3D
> > -                   (uint8_t *)adev-
> >psp.hdcp_context.context.bin_desc.start_addr +
> > -                   le32_to_cpu(ta_hdr->securedisplay.offset_bytes);
> > -
> > -           adev->psp.ta_fw_version =3D le32_to_cpu(ta_hdr-
> >header.ucode_version);
> > -   }
> > -
> > -   return 0;
> > -
> > -out2:
> > -   release_firmware(adev->psp.ta_fw);
> > -   adev->psp.ta_fw =3D NULL;
> > -out:
> > -   if (err) {
> > -           dev_err(adev->dev,
> > -                   "psp v10.0: Failed to load firmware \"%s\"\n",
> > -                   fw_name);
> > -   }
> > +           return err;
> >
> > -   return err;
> > +   return psp_init_ta_microcode(psp, ucode_prefix);
> >   }
> >
> >   static int psp_v10_0_ring_create(struct psp_context *psp,
> > diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
> b/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
> > index bd3e3e23a939..21d20ca2377a 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
> > @@ -89,9 +89,8 @@ static int psp_v11_0_init_microcode(struct
> psp_context *psp)
> >   {
> >      struct amdgpu_device *adev =3D psp->adev;
> >      const char *chip_name;
> > -   char fw_name[PSP_FW_NAME_LEN];
> > +   char ucode_prefix[30];
> >      int err =3D 0;
> > -   const struct ta_firmware_header_v1_0 *ta_hdr;
> >
> >      DRM_DEBUG("\n");
> >
> > @@ -129,6 +128,7 @@ static int psp_v11_0_init_microcode(struct
> psp_context *psp)
> >      default:
> >              BUG();
> >      }
> > +   amdgpu_ucode_ip_version_decode(adev, MP0_HWIP,
> ucode_prefix, sizeof(ucode_prefix));
> >
> >
> >      switch (adev->ip_versions[MP0_HWIP][0]) {
> > @@ -140,35 +140,9 @@ static int psp_v11_0_init_microcode(struct
> psp_context *psp)
> >              err =3D psp_init_asd_microcode(psp, chip_name);
> >              if (err)
> >                      return err;
> > -           snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_ta.bin",
> chip_name);
> > -           err =3D request_firmware(&adev->psp.ta_fw, fw_name, adev-
> >dev);
> > -           if (err) {
> > -                   release_firmware(adev->psp.ta_fw);
> > -                   adev->psp.ta_fw =3D NULL;
> > -                   dev_info(adev->dev,
> > -                            "psp v11.0: Failed to load firmware
> \"%s\"\n", fw_name);
> > -           } else {
> > -                   err =3D amdgpu_ucode_validate(adev->psp.ta_fw);
> > -                   if (err)
> > -                           goto out2;
> > -
> > -                   ta_hdr =3D (const struct ta_firmware_header_v1_0
> *)adev->psp.ta_fw->data;
> > -                   adev-
> >psp.xgmi_context.context.bin_desc.fw_version =3D
> > -                           le32_to_cpu(ta_hdr->xgmi.fw_version);
> > -                   adev-
> >psp.xgmi_context.context.bin_desc.size_bytes =3D
> > -                           le32_to_cpu(ta_hdr->xgmi.size_bytes);
> > -                   adev-
> >psp.xgmi_context.context.bin_desc.start_addr =3D
> > -                           (uint8_t *)ta_hdr +
> > -                           le32_to_cpu(ta_hdr-
> >header.ucode_array_offset_bytes);
> > -                   adev->psp.ta_fw_version =3D le32_to_cpu(ta_hdr-
> >header.ucode_version);
> > -                   adev->psp.ras_context.context.bin_desc.fw_version
> =3D
> > -                           le32_to_cpu(ta_hdr->ras.fw_version);
> > -                   adev->psp.ras_context.context.bin_desc.size_bytes
> =3D
> > -                           le32_to_cpu(ta_hdr->ras.size_bytes);
> > -                   adev->psp.ras_context.context.bin_desc.start_addr
> =3D
> > -                           (uint8_t *)adev-
> >psp.xgmi_context.context.bin_desc.start_addr +
> > -                           le32_to_cpu(ta_hdr->ras.offset_bytes);
> > -           }
> > +           err =3D psp_init_ta_microcode(psp, ucode_prefix);
> > +           if (err)
> > +                   return err;
> >              break;
> >      case IP_VERSION(11, 0, 0):
> >      case IP_VERSION(11, 0, 5):
> > @@ -179,39 +153,9 @@ static int psp_v11_0_init_microcode(struct
> psp_context *psp)
> >              err =3D psp_init_asd_microcode(psp, chip_name);
> >              if (err)
> >                      return err;
> > -           snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_ta.bin",
> chip_name);
> > -           err =3D request_firmware(&adev->psp.ta_fw, fw_name, adev-
> >dev);
> > -           if (err) {
> > -                   release_firmware(adev->psp.ta_fw);
> > -                   adev->psp.ta_fw =3D NULL;
> > -                   dev_info(adev->dev,
> > -                            "psp v11.0: Failed to load firmware
> \"%s\"\n", fw_name);
> > -           } else {
> > -                   err =3D amdgpu_ucode_validate(adev->psp.ta_fw);
> > -                   if (err)
> > -                           goto out2;
> > -
> > -                   ta_hdr =3D (const struct ta_firmware_header_v1_0
> *)adev->psp.ta_fw->data;
> > -                   adev-
> >psp.hdcp_context.context.bin_desc.fw_version =3D
> > -                           le32_to_cpu(ta_hdr->hdcp.fw_version);
> > -                   adev-
> >psp.hdcp_context.context.bin_desc.size_bytes =3D
> > -                           le32_to_cpu(ta_hdr->hdcp.size_bytes);
> > -                   adev-
> >psp.hdcp_context.context.bin_desc.start_addr =3D
> > -                           (uint8_t *)ta_hdr +
> > -                           le32_to_cpu(
> > -                                   ta_hdr-
> >header.ucode_array_offset_bytes);
> > -
> > -                   adev->psp.ta_fw_version =3D le32_to_cpu(ta_hdr-
> >header.ucode_version);
> > -
> > -                   adev-
> >psp.dtm_context.context.bin_desc.fw_version =3D
> > -                           le32_to_cpu(ta_hdr->dtm.fw_version);
> > -                   adev-
> >psp.dtm_context.context.bin_desc.size_bytes =3D
> > -                           le32_to_cpu(ta_hdr->dtm.size_bytes);
> > -                   adev-
> >psp.dtm_context.context.bin_desc.start_addr =3D
> > -                           (uint8_t *)adev->psp.hdcp_context.context
> > -                                   .bin_desc.start_addr +
> > -                           le32_to_cpu(ta_hdr->dtm.offset_bytes);
> > -           }
> > +           err =3D psp_init_ta_microcode(psp, ucode_prefix);
> > +           if (err)
> > +                   return err;
> >              break;
> >      case IP_VERSION(11, 0, 7):
> >      case IP_VERSION(11, 0, 11):
> > @@ -237,11 +181,6 @@ static int psp_v11_0_init_microcode(struct
> psp_context *psp)
> >      }
> >
> >      return 0;
> > -
> > -out2:
> > -   release_firmware(adev->psp.ta_fw);
> > -   adev->psp.ta_fw =3D NULL;
> > -   return err;
> >   }
> >
> >   static int psp_v11_0_wait_for_bootloader(struct psp_context *psp)
> > diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v12_0.c
> b/drivers/gpu/drm/amd/amdgpu/psp_v12_0.c
> > index 8ed2281b6557..634fa2822d8a 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/psp_v12_0.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/psp_v12_0.c
> > @@ -49,9 +49,8 @@ static int psp_v12_0_init_microcode(struct
> psp_context *psp)
> >   {
> >      struct amdgpu_device *adev =3D psp->adev;
> >      const char *chip_name;
> > -   char fw_name[30];
> > +   char ucode_prefix[30];
> >      int err =3D 0;
> > -   const struct ta_firmware_header_v1_0 *ta_hdr;
> >      DRM_DEBUG("\n");
> >
> >      switch (adev->asic_type) {
> > @@ -64,67 +63,12 @@ static int psp_v12_0_init_microcode(struct
> psp_context *psp)
> >      default:
> >              BUG();
> >      }
> > +   amdgpu_ucode_ip_version_decode(adev, MP0_HWIP,
> ucode_prefix, sizeof(ucode_prefix));
> >
> >      err =3D psp_init_asd_microcode(psp, chip_name);
> >      if (err)
> >              return err;
> > -
> > -   snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_ta.bin",
> chip_name);
> > -   err =3D request_firmware(&adev->psp.ta_fw, fw_name, adev->dev);
> > -   if (err) {
> > -           release_firmware(adev->psp.ta_fw);
> > -           adev->psp.ta_fw =3D NULL;
> > -           dev_info(adev->dev,
> > -                    "psp v12.0: Failed to load firmware \"%s\"\n",
> > -                    fw_name);
> > -   } else {
> > -           err =3D amdgpu_ucode_validate(adev->psp.ta_fw);
> > -           if (err)
> > -                   goto out;
> > -
> > -           ta_hdr =3D (const struct ta_firmware_header_v1_0 *)
> > -                            adev->psp.ta_fw->data;
> > -           adev->psp.hdcp_context.context.bin_desc.fw_version =3D
> > -                   le32_to_cpu(ta_hdr->hdcp.fw_version);
> > -           adev->psp.hdcp_context.context.bin_desc.size_bytes =3D
> > -                   le32_to_cpu(ta_hdr->hdcp.size_bytes);
> > -           adev->psp.hdcp_context.context.bin_desc.start_addr =3D
> > -                   (uint8_t *)ta_hdr +
> > -                   le32_to_cpu(ta_hdr-
> >header.ucode_array_offset_bytes);
> > -
> > -           adev->psp.ta_fw_version =3D le32_to_cpu(ta_hdr-
> >header.ucode_version);
> > -
> > -           adev->psp.dtm_context.context.bin_desc.fw_version =3D
> > -                   le32_to_cpu(ta_hdr->dtm.fw_version);
> > -           adev->psp.dtm_context.context.bin_desc.size_bytes =3D
> > -                   le32_to_cpu(ta_hdr->dtm.size_bytes);
> > -           adev->psp.dtm_context.context.bin_desc.start_addr =3D
> > -                   (uint8_t *)adev-
> >psp.hdcp_context.context.bin_desc.start_addr +
> > -                   le32_to_cpu(ta_hdr->dtm.offset_bytes);
> > -
> > -           if (adev->apu_flags & AMD_APU_IS_RENOIR) {
> > -                   adev-
> >psp.securedisplay_context.context.bin_desc.fw_version =3D
> > -                           le32_to_cpu(ta_hdr-
> >securedisplay.fw_version);
> > -                   adev-
> >psp.securedisplay_context.context.bin_desc.size_bytes =3D
> > -                           le32_to_cpu(ta_hdr-
> >securedisplay.size_bytes);
> > -                   adev-
> >psp.securedisplay_context.context.bin_desc.start_addr =3D
> > -                           (uint8_t *)adev-
> >psp.hdcp_context.context.bin_desc.start_addr +
> > -                           le32_to_cpu(ta_hdr-
> >securedisplay.offset_bytes);
> > -           }
> > -   }
> > -
> > -   return 0;
> > -
> > -out:
> > -   release_firmware(adev->psp.ta_fw);
> > -   adev->psp.ta_fw =3D NULL;
> > -   if (err) {
> > -           dev_err(adev->dev,
> > -                   "psp v12.0: Failed to load firmware \"%s\"\n",
> > -                   fw_name);
> > -   }
> > -
> > -   return err;
> > +   return psp_init_ta_microcode(psp, ucode_prefix);
> >   }
> >
> >   static int psp_v12_0_bootloader_load_sysdrv(struct psp_context *psp)

--_000_BYAPR12MB4614A65CE7A1FFABA5CA100F97FA9BYAPR12MB4614namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<p style=3D"font-family:Arial;font-size:10pt;color:#0000FF;margin:5pt;" ali=
gn=3D"Left">
[AMD Official Use Only - General]<br>
</p>
<br>
<div>
<div style=3D"color: rgb(33, 33, 33); background-color: rgb(255, 255, 255);=
" dir=3D"auto">
In general, one file carries multiple binaries. Maybe the check is there as=
 the same binary file is used in a derivative of Renoir or PSP v12 based SO=
Cs.</div>
<div style=3D"color: rgb(33, 33, 33); background-color: rgb(255, 255, 255);=
" dir=3D"auto">
<br>
</div>
<div style=3D"color: rgb(33, 33, 33); background-color: rgb(255, 255, 255);=
" dir=3D"auto">
Keeping size of the binary as 0 prevents the load (I think there's a check)=
.</div>
<div style=3D"color: rgb(33, 33, 33); background-color: rgb(255, 255, 255);=
" dir=3D"auto">
<br>
</div>
<div style=3D"color: rgb(33, 33, 33); background-color: rgb(255, 255, 255);=
" dir=3D"auto">
Apart from this one, rest of the series is</div>
<div style=3D"color: rgb(33, 33, 33); background-color: rgb(255, 255, 255);=
" dir=3D"auto">
<br>
</div>
<div style=3D"color: rgb(33, 33, 33); background-color: rgb(255, 255, 255);=
" dir=3D"auto">
<span style=3D"font-family: -apple-system, HelveticaNeue; font-size: 14.666=
7px; display: inline !important;">Reviewed-by: Lijo Lazar &lt;</span><a hre=
f=3D"mailto:lijo.lazar@amd.com" class=3D"ms-outlook-linkify" style=3D"font-=
family: -apple-system, HelveticaNeue; font-size: 14.6667px;">lijo.lazar@amd=
.com</a><span style=3D"font-family: -apple-system, HelveticaNeue; font-size=
: 14.6667px; display: inline !important;">&gt;</span><br>
</div>
<div style=3D"color: rgb(33, 33, 33); background-color: rgb(255, 255, 255);=
" dir=3D"auto">
<br>
</div>
<div id=3D"ms-outlook-mobile-signature" dir=3D"auto">
<div><br>
</div>
Thanks,<br>
Lijo</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Limonciello, Mario &l=
t;Mario.Limonciello@amd.com&gt;<br>
<b>Sent:</b> Thursday, January 5, 2023 9:34:49 PM<br>
<b>To:</b> Lazar, Lijo &lt;Lijo.Lazar@amd.com&gt;; Deucher, Alexander &lt;A=
lexander.Deucher@amd.com&gt;; linux-kernel@vger.kernel.org &lt;linux-kernel=
@vger.kernel.org&gt;<br>
<b>Cc:</b> Javier Martinez Canillas &lt;javierm@redhat.com&gt;; Carlos Sori=
ano Sanchez &lt;csoriano@redhat.com&gt;; amd-gfx@lists.freedesktop.org &lt;=
amd-gfx@lists.freedesktop.org&gt;; dri-devel@lists.freedesktop.org &lt;dri-=
devel@lists.freedesktop.org&gt;; David Airlie &lt;airlied@gmail.com&gt;;
 Daniel Vetter &lt;daniel@ffwll.ch&gt;; Koenig, Christian &lt;Christian.Koe=
nig@amd.com&gt;; Pan, Xinhui &lt;Xinhui.Pan@amd.com&gt;<br>
<b>Subject:</b> RE: [PATCH v6 20/45] drm/amd: Parse both v1 and v2 TA micro=
code headers using same function</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">[AMD Official Use Only - General]<br>
<br>
<br>
<br>
&gt; -----Original Message-----<br>
&gt; From: Lazar, Lijo &lt;Lijo.Lazar@amd.com&gt;<br>
&gt; Sent: Thursday, January 5, 2023 07:22<br>
&gt; To: Limonciello, Mario &lt;Mario.Limonciello@amd.com&gt;; Deucher, Ale=
xander<br>
&gt; &lt;Alexander.Deucher@amd.com&gt;; linux-kernel@vger.kernel.org<br>
&gt; Cc: Javier Martinez Canillas &lt;javierm@redhat.com&gt;; Carlos Sorian=
o Sanchez<br>
&gt; &lt;csoriano@redhat.com&gt;; amd-gfx@lists.freedesktop.org; dri-<br>
&gt; devel@lists.freedesktop.org; David Airlie &lt;airlied@gmail.com&gt;; D=
aniel Vetter<br>
&gt; &lt;daniel@ffwll.ch&gt;; Koenig, Christian &lt;Christian.Koenig@amd.co=
m&gt;; Pan,<br>
&gt; Xinhui &lt;Xinhui.Pan@amd.com&gt;<br>
&gt; Subject: Re: [PATCH v6 20/45] drm/amd: Parse both v1 and v2 TA microco=
de<br>
&gt; headers using same function<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; On 1/5/2023 9:12 AM, Mario Limonciello wrote:<br>
&gt; &gt; Several IP versions duplicate code and can't use the common helpe=
rs.<br>
&gt; &gt; Move this code into a single function so that the helpers can be =
used.<br>
&gt; &gt;<br>
&gt; &gt; Reviewed-by: Alex Deucher &lt;alexander.deucher@amd.com&gt;<br>
&gt; &gt; Signed-off-by: Mario Limonciello &lt;mario.limonciello@amd.com&gt=
;<br>
&gt; &gt; ---<br>
&gt; &gt; v5-&gt;v6:<br>
&gt; &gt;&nbsp;&nbsp; * Rebase on earlier patches<br>
&gt; &gt; ---<br>
&gt; &gt;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c | 120<br>
&gt; ++++++++++++++++++------<br>
&gt; &gt;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/psp_v10_0.c&nbsp; |&nbsp; =
64 +------------<br>
&gt; &gt;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/psp_v11_0.c&nbsp; |&nbsp; =
77 ++-------------<br>
&gt; &gt;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/psp_v12_0.c&nbsp; |&nbsp; =
62 +-----------<br>
&gt; &gt;&nbsp;&nbsp; 4 files changed, 109 insertions(+), 214 deletions(-)<=
br>
&gt; &gt;<br>
&gt; &gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c<br>
&gt; b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c<br>
&gt; &gt; index 7a2fc920739b..d971e3785eaf 100644<br>
&gt; &gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c<br>
&gt; &gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c<br>
&gt; &gt; @@ -3272,41 +3272,75 @@ static int parse_ta_bin_descriptor(struct=
<br>
&gt; psp_context *psp,<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt; &gt;&nbsp;&nbsp; }<br>
&gt; &gt;<br>
&gt; &gt; -int psp_init_ta_microcode(struct psp_context *psp,<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const char *chip_n=
ame)<br>
&gt; &gt; +static int parse_ta_v1_microcode(struct psp_context *psp)<br>
&gt; &gt;&nbsp;&nbsp; {<br>
&gt; &gt; +&nbsp;&nbsp; const struct ta_firmware_header_v1_0 *ta_hdr;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_device *adev =3D psp-=
&gt;adev;<br>
&gt; &gt; -&nbsp;&nbsp; char fw_name[PSP_FW_NAME_LEN];<br>
&gt; &gt; -&nbsp;&nbsp; const struct ta_firmware_header_v2_0 *ta_hdr;<br>
&gt; &gt; -&nbsp;&nbsp; int err =3D 0;<br>
&gt; &gt; -&nbsp;&nbsp; int ta_index =3D 0;<br>
&gt; &gt;<br>
&gt; &gt; -&nbsp;&nbsp; if (!chip_name) {<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev=
_err(adev-&gt;dev, &quot;invalid chip name for ta microcode\n&quot;);<br>
&gt; &gt; +&nbsp;&nbsp; ta_hdr =3D (const struct ta_firmware_header_v1_0 *)=
<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;psp.ta_fw-&gt;d=
ata;<br>
&gt; &gt; +<br>
&gt; &gt; +&nbsp;&nbsp; if (le16_to_cpu(ta_hdr-&gt;header.header_version_ma=
jor) !=3D 1)<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; return -EINVAL;<br>
&gt; &gt; +<br>
&gt; &gt; +&nbsp;&nbsp; adev-&gt;psp.xgmi_context.context.bin_desc.fw_versi=
on =3D<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; le3=
2_to_cpu(ta_hdr-&gt;xgmi.fw_version);<br>
&gt; &gt; +&nbsp;&nbsp; adev-&gt;psp.xgmi_context.context.bin_desc.size_byt=
es =3D<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; le3=
2_to_cpu(ta_hdr-&gt;xgmi.size_bytes);<br>
&gt; &gt; +&nbsp;&nbsp; adev-&gt;psp.xgmi_context.context.bin_desc.start_ad=
dr =3D<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (ui=
nt8_t *)ta_hdr +<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; le3=
2_to_cpu(ta_hdr-&gt;header.ucode_array_offset_bytes);<br>
&gt; &gt; +&nbsp;&nbsp; adev-&gt;psp.ta_fw_version =3D le32_to_cpu(ta_hdr-<=
br>
&gt; &gt;header.ucode_version);<br>
&gt; &gt; +&nbsp;&nbsp; adev-&gt;psp.ras_context.context.bin_desc.fw_versio=
n =3D<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; le3=
2_to_cpu(ta_hdr-&gt;ras.fw_version);<br>
&gt; &gt; +&nbsp;&nbsp; adev-&gt;psp.ras_context.context.bin_desc.size_byte=
s =3D<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; le3=
2_to_cpu(ta_hdr-&gt;ras.size_bytes);<br>
&gt; &gt; +&nbsp;&nbsp; adev-&gt;psp.ras_context.context.bin_desc.start_add=
r =3D<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (ui=
nt8_t *)adev-<br>
&gt; &gt;psp.xgmi_context.context.bin_desc.start_addr +<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; le3=
2_to_cpu(ta_hdr-&gt;ras.offset_bytes);<br>
&gt; &gt; +&nbsp;&nbsp; adev-&gt;psp.hdcp_context.context.bin_desc.fw_versi=
on =3D<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; le3=
2_to_cpu(ta_hdr-&gt;hdcp.fw_version);<br>
&gt; &gt; +&nbsp;&nbsp; adev-&gt;psp.hdcp_context.context.bin_desc.size_byt=
es =3D<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; le3=
2_to_cpu(ta_hdr-&gt;hdcp.size_bytes);<br>
&gt; &gt; +&nbsp;&nbsp; adev-&gt;psp.hdcp_context.context.bin_desc.start_ad=
dr =3D<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (ui=
nt8_t *)ta_hdr +<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; le3=
2_to_cpu(ta_hdr-&gt;header.ucode_array_offset_bytes);<br>
&gt; &gt; +&nbsp;&nbsp; adev-&gt;psp.ta_fw_version =3D le32_to_cpu(ta_hdr-<=
br>
&gt; &gt;header.ucode_version);<br>
&gt; &gt; +&nbsp;&nbsp; adev-&gt;psp.dtm_context.context.bin_desc.fw_versio=
n =3D<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; le3=
2_to_cpu(ta_hdr-&gt;dtm.fw_version);<br>
&gt; &gt; +&nbsp;&nbsp; adev-&gt;psp.dtm_context.context.bin_desc.size_byte=
s =3D<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; le3=
2_to_cpu(ta_hdr-&gt;dtm.size_bytes);<br>
&gt; &gt; +&nbsp;&nbsp; adev-&gt;psp.dtm_context.context.bin_desc.start_add=
r =3D<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (ui=
nt8_t *)adev-<br>
&gt; &gt;psp.hdcp_context.context.bin_desc.start_addr +<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; le3=
2_to_cpu(ta_hdr-&gt;dtm.offset_bytes);<br>
&gt; &gt; +&nbsp;&nbsp; if (adev-&gt;apu_flags &amp; AMD_APU_IS_RENOIR) {<b=
r>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ade=
v-<br>
&gt; &gt;psp.securedisplay_context.context.bin_desc.fw_version =3D<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; le32_to_cpu(ta_hdr-&gt;secured=
isplay.fw_version);<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ade=
v-<br>
&gt; &gt;psp.securedisplay_context.context.bin_desc.size_bytes =3D<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; le32_to_cpu(ta_hdr-&gt;secured=
isplay.size_bytes);<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ade=
v-<br>
&gt; &gt;psp.securedisplay_context.context.bin_desc.start_addr =3D<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (uint8_t *)adev-<br>
&gt; &gt;psp.hdcp_context.context.bin_desc.start_addr +<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; le32_to_cpu(ta_hdr-&gt;secured=
isplay.offset_bytes);<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; <br>
&gt; psp_v10_0_init_microcode used to get securedisplay_context<br>
&gt; unconditionally and now this is restricted to RENOIR following the log=
ic<br>
&gt; in psp v12. <br>
<br>
Good catch, thanks.&nbsp; I'll fix that.<br>
<br>
&gt; Better is to fetch all FW details unconditionally and make<br>
&gt; the size_bytes to 0 (just to be sure) in specific PSP versions to<br>
&gt; prevent their load.<br>
<br>
I do have to wonder if this was just an oversight or it's intentional?<br>
<br>
For now I'll return it to just check in Renoir in psp-v12 code though.<br>
We can remove that bit later if it was just an oversight.<br>
<br>
&gt; <br>
&gt; Thanks,<br>
&gt; Lijo<br>
&gt; <br>
&gt; &gt;<br>
&gt; &gt; -&nbsp;&nbsp; snprintf(fw_name, sizeof(fw_name), &quot;amdgpu/%s_=
ta.bin&quot;,<br>
&gt; chip_name);<br>
&gt; &gt; -&nbsp;&nbsp; err =3D request_firmware(&amp;adev-&gt;psp.ta_fw, f=
w_name, adev-&gt;dev);<br>
&gt; &gt; -&nbsp;&nbsp; if (err)<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; got=
o out;<br>
&gt; &gt; +&nbsp;&nbsp; return 0;<br>
&gt; &gt; +}<br>
&gt; &gt;<br>
&gt; &gt; -&nbsp;&nbsp; err =3D amdgpu_ucode_validate(adev-&gt;psp.ta_fw);<=
br>
&gt; &gt; -&nbsp;&nbsp; if (err)<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; got=
o out;<br>
&gt; &gt; +static int parse_ta_v2_microcode(struct psp_context *psp)<br>
&gt; &gt; +{<br>
&gt; &gt; +&nbsp;&nbsp; const struct ta_firmware_header_v2_0 *ta_hdr;<br>
&gt; &gt; +&nbsp;&nbsp; struct amdgpu_device *adev =3D psp-&gt;adev;<br>
&gt; &gt; +&nbsp;&nbsp; int err =3D 0;<br>
&gt; &gt; +&nbsp;&nbsp; int ta_index =3D 0;<br>
&gt; &gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ta_hdr =3D (const struct ta_firmwar=
e_header_v2_0 *)adev-<br>
&gt; &gt;psp.ta_fw-&gt;data;<br>
&gt; &gt;<br>
&gt; &gt; -&nbsp;&nbsp; if (le16_to_cpu(ta_hdr-&gt;header.header_version_ma=
jor) !=3D 2) {<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev=
_err(adev-&gt;dev, &quot;unsupported TA header version\n&quot;);<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; err=
 =3D -EINVAL;<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; got=
o out;<br>
&gt; &gt; -&nbsp;&nbsp; }<br>
&gt; &gt; +&nbsp;&nbsp; if (le16_to_cpu(ta_hdr-&gt;header.header_version_ma=
jor) !=3D 2)<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret=
urn -EINVAL;<br>
&gt; &gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (le32_to_cpu(ta_hdr-&gt;ta_fw_bi=
n_count) &gt;=3D<br>
&gt; UCODE_MAX_PSP_PACKAGING) {<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; dev_err(adev-&gt;dev, &quot;packed TA count exceeds maximum<br=
>
&gt; limit\n&quot;);<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; err=
 =3D -EINVAL;<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; got=
o out;<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret=
urn -EINVAL;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (ta_index =3D 0; ta_index &lt; =
le32_to_cpu(ta_hdr-<br>
&gt; &gt;ta_fw_bin_count); ta_index++) {<br>
&gt; &gt; @@ -3314,14 +3348,46 @@ int psp_init_ta_microcode(struct psp_cont=
ext<br>
&gt; *psp,<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;ta_hdr-&gt;ta_fw_bin[ta_ind=
ex],<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ta_hdr);<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; if (err)<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto out;<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return err;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt; &gt; -out:<br>
&gt; &gt; -&nbsp;&nbsp; dev_err(adev-&gt;dev, &quot;fail to initialize ta m=
icrocode\n&quot;);<br>
&gt; &gt; -&nbsp;&nbsp; release_firmware(adev-&gt;psp.ta_fw);<br>
&gt; &gt; -&nbsp;&nbsp; adev-&gt;psp.ta_fw =3D NULL;<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +int psp_init_ta_microcode(struct psp_context *psp, const char<br=
>
&gt; *chip_name)<br>
&gt; &gt; +{<br>
&gt; &gt; +&nbsp;&nbsp; const struct common_firmware_header *hdr;<br>
&gt; &gt; +&nbsp;&nbsp; struct amdgpu_device *adev =3D psp-&gt;adev;<br>
&gt; &gt; +&nbsp;&nbsp; char fw_name[PSP_FW_NAME_LEN];<br>
&gt; &gt; +&nbsp;&nbsp; int err;<br>
&gt; &gt; +<br>
&gt; &gt; +&nbsp;&nbsp; snprintf(fw_name, sizeof(fw_name), &quot;amdgpu/%s_=
ta.bin&quot;,<br>
&gt; chip_name);<br>
&gt; &gt; +&nbsp;&nbsp; err =3D request_firmware(&amp;adev-&gt;psp.ta_fw, f=
w_name, adev-&gt;dev);<br>
&gt; &gt; +&nbsp;&nbsp; if (err)<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret=
urn err;<br>
&gt; &gt; +&nbsp;&nbsp; err =3D amdgpu_ucode_validate(adev-&gt;psp.ta_fw);<=
br>
&gt; &gt; +&nbsp;&nbsp; if (err)<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret=
urn err;<br>
&gt; &gt; +<br>
&gt; &gt; +&nbsp;&nbsp; hdr =3D (const struct common_firmware_header *)adev=
-&gt;psp.ta_fw-<br>
&gt; &gt;data;<br>
&gt; &gt; +&nbsp;&nbsp; switch (le16_to_cpu(hdr-&gt;header_version_major)) =
{<br>
&gt; &gt; +&nbsp;&nbsp; case 1:<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; err=
 =3D parse_ta_v1_microcode(psp);<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bre=
ak;<br>
&gt; &gt; +&nbsp;&nbsp; case 2:<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; err=
 =3D parse_ta_v2_microcode(psp);<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bre=
ak;<br>
&gt; &gt; +&nbsp;&nbsp; default:<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev=
_err(adev-&gt;dev, &quot;unsupported TA header version\n&quot;);<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; err=
 =3D -EINVAL;<br>
&gt; &gt; +&nbsp;&nbsp; }<br>
&gt; &gt; +<br>
&gt; &gt; +&nbsp;&nbsp; if (err) {<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev=
_err(adev-&gt;dev, &quot;fail to initialize ta microcode\n&quot;);<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rel=
ease_firmware(adev-&gt;psp.ta_fw);<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ade=
v-&gt;psp.ta_fw =3D NULL;<br>
&gt; &gt; +&nbsp;&nbsp; }<br>
&gt; &gt; +<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return err;<br>
&gt; &gt;&nbsp;&nbsp; }<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v10_0.c<br>
&gt; b/drivers/gpu/drm/amd/amdgpu/psp_v10_0.c<br>
&gt; &gt; index 9de46fa8f46c..f14fcfb9c425 100644<br>
&gt; &gt; --- a/drivers/gpu/drm/amd/amdgpu/psp_v10_0.c<br>
&gt; &gt; +++ b/drivers/gpu/drm/amd/amdgpu/psp_v10_0.c<br>
&gt; &gt; @@ -48,9 +48,8 @@ static int psp_v10_0_init_microcode(struct<br>
&gt; psp_context *psp)<br>
&gt; &gt;&nbsp;&nbsp; {<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_device *adev =3D psp-=
&gt;adev;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const char *chip_name;<br>
&gt; &gt; -&nbsp;&nbsp; char fw_name[30];<br>
&gt; &gt; +&nbsp;&nbsp; char ucode_prefix[30];<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int err =3D 0;<br>
&gt; &gt; -&nbsp;&nbsp; const struct ta_firmware_header_v1_0 *ta_hdr;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_DEBUG(&quot;\n&quot;);<br>
&gt; &gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switch (adev-&gt;asic_type) {<br>
&gt; &gt; @@ -64,66 +63,13 @@ static int psp_v10_0_init_microcode(struct<br=
>
&gt; psp_context *psp)<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; break;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default: BUG();<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &gt; +&nbsp;&nbsp; amdgpu_ucode_ip_version_decode(adev, MP0_HWIP,<br>
&gt; ucode_prefix, sizeof(ucode_prefix));<br>
&gt; &gt;<br>
&gt; &gt; -&nbsp;&nbsp; err =3D psp_init_asd_microcode(psp, chip_name);<br>
&gt; &gt; +&nbsp;&nbsp; err =3D psp_init_asd_microcode(psp, ucode_prefix);<=
br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (err)<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; got=
o out;<br>
&gt; &gt; -<br>
&gt; &gt; -&nbsp;&nbsp; snprintf(fw_name, sizeof(fw_name), &quot;amdgpu/%s_=
ta.bin&quot;,<br>
&gt; chip_name);<br>
&gt; &gt; -&nbsp;&nbsp; err =3D request_firmware(&amp;adev-&gt;psp.ta_fw, f=
w_name, adev-&gt;dev);<br>
&gt; &gt; -&nbsp;&nbsp; if (err) {<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rel=
ease_firmware(adev-&gt;psp.ta_fw);<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ade=
v-&gt;psp.ta_fw =3D NULL;<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev=
_info(adev-&gt;dev,<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;psp v10.0: Failed =
to load firmware \&quot;%s\&quot;\n&quot;,<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fw_name);<br>
&gt; &gt; -&nbsp;&nbsp; } else {<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; err=
 =3D amdgpu_ucode_validate(adev-&gt;psp.ta_fw);<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if =
(err)<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto out2;<br>
&gt; &gt; -<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ta_=
hdr =3D (const struct ta_firmware_header_v1_0 *)<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;psp.ta_fw-&gt;data;<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ade=
v-&gt;psp.hdcp_context.context.bin_desc.fw_version =3D<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; le32_to_cpu(ta_hdr-&gt;hdcp.fw=
_version);<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ade=
v-&gt;psp.hdcp_context.context.bin_desc.size_bytes =3D<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; le32_to_cpu(ta_hdr-&gt;hdcp.si=
ze_bytes);<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ade=
v-&gt;psp.hdcp_context.context.bin_desc.start_addr =3D<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (uint8_t *)ta_hdr +<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; le32_to_cpu(ta_hdr-<br>
&gt; &gt;header.ucode_array_offset_bytes);<br>
&gt; &gt; -<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ade=
v-&gt;psp.dtm_context.context.bin_desc.fw_version =3D<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; le32_to_cpu(ta_hdr-&gt;dtm.fw_=
version);<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ade=
v-&gt;psp.dtm_context.context.bin_desc.size_bytes =3D<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; le32_to_cpu(ta_hdr-&gt;dtm.siz=
e_bytes);<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ade=
v-&gt;psp.dtm_context.context.bin_desc.start_addr =3D<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (uint8_t *)adev-<br>
&gt; &gt;psp.hdcp_context.context.bin_desc.start_addr +<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; le32_to_cpu(ta_hdr-&gt;dtm.off=
set_bytes);<br>
&gt; &gt; -<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ade=
v-<br>
&gt; &gt;psp.securedisplay_context.context.bin_desc.fw_version =3D<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; le32_to_cpu(ta_hdr-&gt;secured=
isplay.fw_version);<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ade=
v-<br>
&gt; &gt;psp.securedisplay_context.context.bin_desc.size_bytes =3D<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; le32_to_cpu(ta_hdr-&gt;secured=
isplay.size_bytes);<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ade=
v-<br>
&gt; &gt;psp.securedisplay_context.context.bin_desc.start_addr =3D<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (uint8_t *)adev-<br>
&gt; &gt;psp.hdcp_context.context.bin_desc.start_addr +<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; le32_to_cpu(ta_hdr-&gt;secured=
isplay.offset_bytes);<br>
&gt; &gt; -<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ade=
v-&gt;psp.ta_fw_version =3D le32_to_cpu(ta_hdr-<br>
&gt; &gt;header.ucode_version);<br>
&gt; &gt; -&nbsp;&nbsp; }<br>
&gt; &gt; -<br>
&gt; &gt; -&nbsp;&nbsp; return 0;<br>
&gt; &gt; -<br>
&gt; &gt; -out2:<br>
&gt; &gt; -&nbsp;&nbsp; release_firmware(adev-&gt;psp.ta_fw);<br>
&gt; &gt; -&nbsp;&nbsp; adev-&gt;psp.ta_fw =3D NULL;<br>
&gt; &gt; -out:<br>
&gt; &gt; -&nbsp;&nbsp; if (err) {<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev=
_err(adev-&gt;dev,<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;psp v10.0: Failed to loa=
d firmware \&quot;%s\&quot;\n&quot;,<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fw_name);<br>
&gt; &gt; -&nbsp;&nbsp; }<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret=
urn err;<br>
&gt; &gt;<br>
&gt; &gt; -&nbsp;&nbsp; return err;<br>
&gt; &gt; +&nbsp;&nbsp; return psp_init_ta_microcode(psp, ucode_prefix);<br=
>
&gt; &gt;&nbsp;&nbsp; }<br>
&gt; &gt;<br>
&gt; &gt;&nbsp;&nbsp; static int psp_v10_0_ring_create(struct psp_context *=
psp,<br>
&gt; &gt; diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c<br>
&gt; b/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c<br>
&gt; &gt; index bd3e3e23a939..21d20ca2377a 100644<br>
&gt; &gt; --- a/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c<br>
&gt; &gt; +++ b/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c<br>
&gt; &gt; @@ -89,9 +89,8 @@ static int psp_v11_0_init_microcode(struct<br>
&gt; psp_context *psp)<br>
&gt; &gt;&nbsp;&nbsp; {<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_device *adev =3D psp-=
&gt;adev;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const char *chip_name;<br>
&gt; &gt; -&nbsp;&nbsp; char fw_name[PSP_FW_NAME_LEN];<br>
&gt; &gt; +&nbsp;&nbsp; char ucode_prefix[30];<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int err =3D 0;<br>
&gt; &gt; -&nbsp;&nbsp; const struct ta_firmware_header_v1_0 *ta_hdr;<br>
&gt; &gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_DEBUG(&quot;\n&quot;);<br>
&gt; &gt;<br>
&gt; &gt; @@ -129,6 +128,7 @@ static int psp_v11_0_init_microcode(struct<br=
>
&gt; psp_context *psp)<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default:<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; BUG();<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &gt; +&nbsp;&nbsp; amdgpu_ucode_ip_version_decode(adev, MP0_HWIP,<br>
&gt; ucode_prefix, sizeof(ucode_prefix));<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switch (adev-&gt;ip_versions[MP0_HW=
IP][0]) {<br>
&gt; &gt; @@ -140,35 +140,9 @@ static int psp_v11_0_init_microcode(struct<b=
r>
&gt; psp_context *psp)<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; err =3D psp_init_asd_microcode(psp, chip_name);<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; if (err)<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return err;<br=
>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; snp=
rintf(fw_name, sizeof(fw_name), &quot;amdgpu/%s_ta.bin&quot;,<br>
&gt; chip_name);<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; err=
 =3D request_firmware(&amp;adev-&gt;psp.ta_fw, fw_name, adev-<br>
&gt; &gt;dev);<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if =
(err) {<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; release_firmware(adev-&gt;psp.=
ta_fw);<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;psp.ta_fw =3D NULL;<b=
r>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_info(adev-&gt;dev,<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &quot;psp v11.0: Failed to load firmware<br>
&gt; \&quot;%s\&quot;\n&quot;, fw_name);<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } e=
lse {<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; err =3D amdgpu_ucode_validate(=
adev-&gt;psp.ta_fw);<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (err)<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; goto out2;<br>
&gt; &gt; -<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ta_hdr =3D (const struct ta_fi=
rmware_header_v1_0<br>
&gt; *)adev-&gt;psp.ta_fw-&gt;data;<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-<br>
&gt; &gt;psp.xgmi_context.context.bin_desc.fw_version =3D<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; le32_to_cpu(ta_hdr-&gt;xgmi.fw_version);<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-<br>
&gt; &gt;psp.xgmi_context.context.bin_desc.size_bytes =3D<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; le32_to_cpu(ta_hdr-&gt;xgmi.size_bytes);<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-<br>
&gt; &gt;psp.xgmi_context.context.bin_desc.start_addr =3D<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; (uint8_t *)ta_hdr +<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; le32_to_cpu(ta_hdr-<br>
&gt; &gt;header.ucode_array_offset_bytes);<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;psp.ta_fw_version =3D=
 le32_to_cpu(ta_hdr-<br>
&gt; &gt;header.ucode_version);<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;psp.ras_context.conte=
xt.bin_desc.fw_version<br>
&gt; =3D<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; le32_to_cpu(ta_hdr-&gt;ras.fw_version);<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;psp.ras_context.conte=
xt.bin_desc.size_bytes<br>
&gt; =3D<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; le32_to_cpu(ta_hdr-&gt;ras.size_bytes);<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;psp.ras_context.conte=
xt.bin_desc.start_addr<br>
&gt; =3D<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; (uint8_t *)adev-<br>
&gt; &gt;psp.xgmi_context.context.bin_desc.start_addr +<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; le32_to_cpu(ta_hdr-&gt;ras.offset_bytes);<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<b=
r>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; err=
 =3D psp_init_ta_microcode(psp, ucode_prefix);<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if =
(err)<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return err;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; break;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case IP_VERSION(11, 0, 0):<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case IP_VERSION(11, 0, 5):<br>
&gt; &gt; @@ -179,39 +153,9 @@ static int psp_v11_0_init_microcode(struct<b=
r>
&gt; psp_context *psp)<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; err =3D psp_init_asd_microcode(psp, chip_name);<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; if (err)<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return err;<br=
>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; snp=
rintf(fw_name, sizeof(fw_name), &quot;amdgpu/%s_ta.bin&quot;,<br>
&gt; chip_name);<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; err=
 =3D request_firmware(&amp;adev-&gt;psp.ta_fw, fw_name, adev-<br>
&gt; &gt;dev);<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if =
(err) {<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; release_firmware(adev-&gt;psp.=
ta_fw);<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;psp.ta_fw =3D NULL;<b=
r>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_info(adev-&gt;dev,<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &quot;psp v11.0: Failed to load firmware<br>
&gt; \&quot;%s\&quot;\n&quot;, fw_name);<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } e=
lse {<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; err =3D amdgpu_ucode_validate(=
adev-&gt;psp.ta_fw);<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (err)<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; goto out2;<br>
&gt; &gt; -<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ta_hdr =3D (const struct ta_fi=
rmware_header_v1_0<br>
&gt; *)adev-&gt;psp.ta_fw-&gt;data;<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-<br>
&gt; &gt;psp.hdcp_context.context.bin_desc.fw_version =3D<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; le32_to_cpu(ta_hdr-&gt;hdcp.fw_version);<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-<br>
&gt; &gt;psp.hdcp_context.context.bin_desc.size_bytes =3D<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; le32_to_cpu(ta_hdr-&gt;hdcp.size_bytes);<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-<br>
&gt; &gt;psp.hdcp_context.context.bin_desc.start_addr =3D<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; (uint8_t *)ta_hdr +<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; le32_to_cpu(<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ta_hdr-<b=
r>
&gt; &gt;header.ucode_array_offset_bytes);<br>
&gt; &gt; -<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;psp.ta_fw_version =3D=
 le32_to_cpu(ta_hdr-<br>
&gt; &gt;header.ucode_version);<br>
&gt; &gt; -<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-<br>
&gt; &gt;psp.dtm_context.context.bin_desc.fw_version =3D<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; le32_to_cpu(ta_hdr-&gt;dtm.fw_version);<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-<br>
&gt; &gt;psp.dtm_context.context.bin_desc.size_bytes =3D<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; le32_to_cpu(ta_hdr-&gt;dtm.size_bytes);<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-<br>
&gt; &gt;psp.dtm_context.context.bin_desc.start_addr =3D<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; (uint8_t *)adev-&gt;psp.hdcp_context.context<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .bin_desc=
.start_addr +<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; le32_to_cpu(ta_hdr-&gt;dtm.offset_bytes);<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<b=
r>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; err=
 =3D psp_init_ta_microcode(psp, ucode_prefix);<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if =
(err)<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return err;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; break;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case IP_VERSION(11, 0, 7):<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case IP_VERSION(11, 0, 11):<br>
&gt; &gt; @@ -237,11 +181,6 @@ static int psp_v11_0_init_microcode(struct<b=
r>
&gt; psp_context *psp)<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt; &gt; -<br>
&gt; &gt; -out2:<br>
&gt; &gt; -&nbsp;&nbsp; release_firmware(adev-&gt;psp.ta_fw);<br>
&gt; &gt; -&nbsp;&nbsp; adev-&gt;psp.ta_fw =3D NULL;<br>
&gt; &gt; -&nbsp;&nbsp; return err;<br>
&gt; &gt;&nbsp;&nbsp; }<br>
&gt; &gt;<br>
&gt; &gt;&nbsp;&nbsp; static int psp_v11_0_wait_for_bootloader(struct psp_c=
ontext *psp)<br>
&gt; &gt; diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v12_0.c<br>
&gt; b/drivers/gpu/drm/amd/amdgpu/psp_v12_0.c<br>
&gt; &gt; index 8ed2281b6557..634fa2822d8a 100644<br>
&gt; &gt; --- a/drivers/gpu/drm/amd/amdgpu/psp_v12_0.c<br>
&gt; &gt; +++ b/drivers/gpu/drm/amd/amdgpu/psp_v12_0.c<br>
&gt; &gt; @@ -49,9 +49,8 @@ static int psp_v12_0_init_microcode(struct<br>
&gt; psp_context *psp)<br>
&gt; &gt;&nbsp;&nbsp; {<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_device *adev =3D psp-=
&gt;adev;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const char *chip_name;<br>
&gt; &gt; -&nbsp;&nbsp; char fw_name[30];<br>
&gt; &gt; +&nbsp;&nbsp; char ucode_prefix[30];<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int err =3D 0;<br>
&gt; &gt; -&nbsp;&nbsp; const struct ta_firmware_header_v1_0 *ta_hdr;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_DEBUG(&quot;\n&quot;);<br>
&gt; &gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switch (adev-&gt;asic_type) {<br>
&gt; &gt; @@ -64,67 +63,12 @@ static int psp_v12_0_init_microcode(struct<br=
>
&gt; psp_context *psp)<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default:<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; BUG();<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &gt; +&nbsp;&nbsp; amdgpu_ucode_ip_version_decode(adev, MP0_HWIP,<br>
&gt; ucode_prefix, sizeof(ucode_prefix));<br>
&gt; &gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; err =3D psp_init_asd_microcode(psp,=
 chip_name);<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (err)<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; return err;<br>
&gt; &gt; -<br>
&gt; &gt; -&nbsp;&nbsp; snprintf(fw_name, sizeof(fw_name), &quot;amdgpu/%s_=
ta.bin&quot;,<br>
&gt; chip_name);<br>
&gt; &gt; -&nbsp;&nbsp; err =3D request_firmware(&amp;adev-&gt;psp.ta_fw, f=
w_name, adev-&gt;dev);<br>
&gt; &gt; -&nbsp;&nbsp; if (err) {<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rel=
ease_firmware(adev-&gt;psp.ta_fw);<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ade=
v-&gt;psp.ta_fw =3D NULL;<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev=
_info(adev-&gt;dev,<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;psp v12.0: Failed =
to load firmware \&quot;%s\&quot;\n&quot;,<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fw_name);<br>
&gt; &gt; -&nbsp;&nbsp; } else {<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; err=
 =3D amdgpu_ucode_validate(adev-&gt;psp.ta_fw);<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if =
(err)<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto out;<br>
&gt; &gt; -<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ta_=
hdr =3D (const struct ta_firmware_header_v1_0 *)<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;psp.ta_fw-&gt;data;<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ade=
v-&gt;psp.hdcp_context.context.bin_desc.fw_version =3D<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; le32_to_cpu(ta_hdr-&gt;hdcp.fw=
_version);<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ade=
v-&gt;psp.hdcp_context.context.bin_desc.size_bytes =3D<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; le32_to_cpu(ta_hdr-&gt;hdcp.si=
ze_bytes);<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ade=
v-&gt;psp.hdcp_context.context.bin_desc.start_addr =3D<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (uint8_t *)ta_hdr +<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; le32_to_cpu(ta_hdr-<br>
&gt; &gt;header.ucode_array_offset_bytes);<br>
&gt; &gt; -<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ade=
v-&gt;psp.ta_fw_version =3D le32_to_cpu(ta_hdr-<br>
&gt; &gt;header.ucode_version);<br>
&gt; &gt; -<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ade=
v-&gt;psp.dtm_context.context.bin_desc.fw_version =3D<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; le32_to_cpu(ta_hdr-&gt;dtm.fw_=
version);<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ade=
v-&gt;psp.dtm_context.context.bin_desc.size_bytes =3D<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; le32_to_cpu(ta_hdr-&gt;dtm.siz=
e_bytes);<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ade=
v-&gt;psp.dtm_context.context.bin_desc.start_addr =3D<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (uint8_t *)adev-<br>
&gt; &gt;psp.hdcp_context.context.bin_desc.start_addr +<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; le32_to_cpu(ta_hdr-&gt;dtm.off=
set_bytes);<br>
&gt; &gt; -<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if =
(adev-&gt;apu_flags &amp; AMD_APU_IS_RENOIR) {<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-<br>
&gt; &gt;psp.securedisplay_context.context.bin_desc.fw_version =3D<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; le32_to_cpu(ta_hdr-<br>
&gt; &gt;securedisplay.fw_version);<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-<br>
&gt; &gt;psp.securedisplay_context.context.bin_desc.size_bytes =3D<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; le32_to_cpu(ta_hdr-<br>
&gt; &gt;securedisplay.size_bytes);<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-<br>
&gt; &gt;psp.securedisplay_context.context.bin_desc.start_addr =3D<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; (uint8_t *)adev-<br>
&gt; &gt;psp.hdcp_context.context.bin_desc.start_addr +<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; le32_to_cpu(ta_hdr-<br>
&gt; &gt;securedisplay.offset_bytes);<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<b=
r>
&gt; &gt; -&nbsp;&nbsp; }<br>
&gt; &gt; -<br>
&gt; &gt; -&nbsp;&nbsp; return 0;<br>
&gt; &gt; -<br>
&gt; &gt; -out:<br>
&gt; &gt; -&nbsp;&nbsp; release_firmware(adev-&gt;psp.ta_fw);<br>
&gt; &gt; -&nbsp;&nbsp; adev-&gt;psp.ta_fw =3D NULL;<br>
&gt; &gt; -&nbsp;&nbsp; if (err) {<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev=
_err(adev-&gt;dev,<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;psp v12.0: Failed to loa=
d firmware \&quot;%s\&quot;\n&quot;,<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fw_name);<br>
&gt; &gt; -&nbsp;&nbsp; }<br>
&gt; &gt; -<br>
&gt; &gt; -&nbsp;&nbsp; return err;<br>
&gt; &gt; +&nbsp;&nbsp; return psp_init_ta_microcode(psp, ucode_prefix);<br=
>
&gt; &gt;&nbsp;&nbsp; }<br>
&gt; &gt;<br>
&gt; &gt;&nbsp;&nbsp; static int psp_v12_0_bootloader_load_sysdrv(struct ps=
p_context *psp)<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_BYAPR12MB4614A65CE7A1FFABA5CA100F97FA9BYAPR12MB4614namp_--

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7CA31AA965
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 16:08:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A97DD6E7D2;
	Wed, 15 Apr 2020 14:08:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2044.outbound.protection.outlook.com [40.107.237.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56CA16E7D2;
 Wed, 15 Apr 2020 14:08:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OtMhZqMWqUYGGTTdsujcNySAU0VVPpqN5ppgD7v4J9IBoaVZGYqtNMGD/PLjY8uMo3AKH5HNNUBhjNG9x+lFWHBTYiY6tKCf1q1bUKI9DBXpJtl/tPngMogYXNiUGqKj75X0gjhIlI4AV019poflEFlSAyLLq0i74VqZvGTrmrct6H7gXQLUjOVYdufjYrKfJ5yBRAnLHPYcLf3emS3MWzec2FXd2d49PbHs7ubrjOehZ7VwgYtImuK8PFomSX3qThKK5qd0NrBPtfn/85bfzsF7HOyvhb694KAgMcaV7wQ+p/2V1y15q2iVMD9SR4Cxy1WYZ1ik4VMaZctcWikGkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7HUih/KDaX5SwTNgrPmthwZIUqKKYfvRIzt14C7yMKw=;
 b=gQBbim8upLUixPGG46PAvX4sgmVz9vMkhHrAD3LKKIXNdZlLN/9BIFWQJ193+JUc1agWFfKo1+ySl2xOrQY5UD6vTd7qAIoU+vbTE7TGF4qd5YC7OP2ALnxsPpPm/379RMf2vm/a5MwXOilXaDHW5Oq9QxM+j/zFpKRrgQ8dXt+uoOtaqYcPJnh+liWqr6xKEHDCDjpus0k5XMmLhTjK4t54LJgrL8nBHnD+7Nc1DfvBLgF7pNKQ7W756osX6Jkt6ccAXukZ9HMsSk5a+H4DvGLQ7BpSzBy9tSWl9nL49ConDVukwJB6xgByTIKl4qRJDrd2LwLx8Xsl256uaohn7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7HUih/KDaX5SwTNgrPmthwZIUqKKYfvRIzt14C7yMKw=;
 b=KPfgh9mAcDa+yMc866WcTfBYnyHn0NlzLS6SC7vO27W/QiohyzfmajCCxowy2nCNMy8/TK4kpYd+Yhc0T57W+dqrAC8clikjy9qFi3ycLBCGJqPIjqas+rwqorJGcEZ98mBCZk0qYFsVkL3jY952FVTzWURGZIGuZb37AH2M8eg=
Received: from MN2PR12MB4488.namprd12.prod.outlook.com (2603:10b6:208:24e::19)
 by MN2PR12MB3614.namprd12.prod.outlook.com (2603:10b6:208:c6::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.26; Wed, 15 Apr
 2020 14:08:06 +0000
Received: from MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::5868:c9cf:2687:6e03]) by MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::5868:c9cf:2687:6e03%2]) with mapi id 15.20.2900.028; Wed, 15 Apr 2020
 14:08:06 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Alex Deucher <alexdeucher@gmail.com>, Bernard
 Zhao <bernard@vivo.com>
Subject: Re: [PATCH] Optimized division operation to shift operation
Thread-Topic: [PATCH] Optimized division operation to shift operation
Thread-Index: AQHWElDOphctbVDwzky6oxRY89/LXqh47JqAgADhWoCAAARfAIAAZ4LW
Date: Wed, 15 Apr 2020 14:08:06 +0000
Message-ID: <MN2PR12MB448868370D02A066FACA9955F7DB0@MN2PR12MB4488.namprd12.prod.outlook.com>
References: <1586864113-30682-1-git-send-email-bernard@vivo.com>
 <CADnq5_Phca3L-HGOQz0DPBoARHgwcJRK_a7-WmeFMPkrPWeOeg@mail.gmail.com>
 <87lfmx5h72.fsf@intel.com>,<b5ffc6b7-bfa5-0827-a267-4e8c20027982@amd.com>
In-Reply-To: <b5ffc6b7-bfa5-0827-a267-4e8c20027982@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Enabled=True;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SetDate=2020-04-15T14:08:05.440Z;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Name=AMD
 Public; MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ContentBits=0;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Method=Privileged; 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Alexander.Deucher@amd.com; 
x-originating-ip: [172.58.187.145]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 2181de0b-94d2-4733-a187-08d7e1466b90
x-ms-traffictypediagnostic: MN2PR12MB3614:|MN2PR12MB3614:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3614EE530A87799F517E1BBCF7DB0@MN2PR12MB3614.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0374433C81
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4488.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(376002)(39860400002)(346002)(136003)(366004)(396003)(86362001)(45080400002)(26005)(71200400001)(9686003)(4326008)(19627405001)(33656002)(186003)(966005)(8676002)(8936002)(54906003)(81156014)(55016002)(2906002)(478600001)(5660300002)(7696005)(316002)(66476007)(66946007)(76116006)(6506007)(66446008)(52536014)(66556008)(53546011)(64756008)(110136005);
 DIR:OUT; SFP:1101; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: b9/nTt7Vr+aap2o1fAH5EMW2cxVcL9h2Z/KMzoqGxe6M5uEVZtQmErZnVdgNvoAFhbTeddvczceOo+cQIMW1KPOoTb+eQtIGM9ppoIXndrrEVnXTOYspKUmBNbHctB80Ol9ps22fnI/zn0shalpRwL1GoySNTvKPvy+Qt67PuWxyVHudnNo87Ds4fUafT42BsvZmFcyoIj5rbxvyzlf6NWh00lxmgREbs+w8fanFWr0MZcA/EG3vZj+HAfffoGhMVORB26S6NUwxo3qPn12Ni8W0EGWROr63jsn7s7uh8hLgihLET1e29ACzvcaq20aRZhsDtc2XOyBq1ozPNMalWCyQJbNrxpNbko4ZolbEosedMDFKPThG2T2n+4tOdcgDupCT1+utbXjbP276hRXAnWUbCD5HIj8EVWH0bSgeXU68L1USVX3n7F8tr9Th18pw2UoTRM2TlNGeElKE81lwqlQBDLp340XsTB/tCEAVCNM=
x-ms-exchange-antispam-messagedata: A3xqHIaS8V/iGiH2fA2+QeI/KIZU0P1jHoKY5lmSTPFraZbxfqcrh4jS9C62nNNd9E1ijzr9tOiX/D73A5aQFxjUoKM8acNgCBqdEBIuiy6IMifI/X/TlLICxrneEzWUHS3uIZzGL8LAsdfPqM7O8w==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2181de0b-94d2-4733-a187-08d7e1466b90
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2020 14:08:06.3212 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5ZP2QuONUcUszC8YcYl5FsbzUhjCto3n8kyuiPw1K1cccfNOhqaEE3ouM+EoXylCglrIMOq4tbvkWxKTv7SLZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3614
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
Cc: "Sierra Guiza, Alejandro \(Alex\)" <Alex.Sierra@amd.com>,
 David Airlie <airlied@linux.ie>, "Zeng, Oak" <Oak.Zeng@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "kernel@vivo.com" <kernel@vivo.com>, "Huang, Ray" <Ray.Huang@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Yuan,
 Xiaojie" <Xiaojie.Yuan@amd.com>, Sam Ravnborg <sam@ravnborg.org>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>, "Russell, Kent" <Kent.Russell@amd.com>
Content-Type: multipart/mixed; boundary="===============0316639365=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0316639365==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB448868370D02A066FACA9955F7DB0MN2PR12MB4488namp_"

--_000_MN2PR12MB448868370D02A066FACA9955F7DB0MN2PR12MB4488namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Public Use]

I've gone ahead and dropped the patch.

Alex
________________________________
From: Koenig, Christian <Christian.Koenig@amd.com>
Sent: Wednesday, April 15, 2020 3:57 AM
To: Jani Nikula <jani.nikula@linux.intel.com>; Alex Deucher <alexdeucher@gm=
ail.com>; Bernard Zhao <bernard@vivo.com>
Cc: Sierra Guiza, Alejandro (Alex) <Alex.Sierra@amd.com>; Zeng, Oak <Oak.Ze=
ng@amd.com>; Maling list - DRI developers <dri-devel@lists.freedesktop.org>=
; David Airlie <airlied@linux.ie>; Kuehling, Felix <Felix.Kuehling@amd.com>=
; LKML <linux-kernel@vger.kernel.org>; amd-gfx list <amd-gfx@lists.freedesk=
top.org>; kernel@vivo.com <kernel@vivo.com>; Huang, Ray <Ray.Huang@amd.com>=
; Russell, Kent <Kent.Russell@amd.com>; Deucher, Alexander <Alexander.Deuch=
er@amd.com>; Sam Ravnborg <sam@ravnborg.org>; Yuan, Xiaojie <Xiaojie.Yuan@a=
md.com>
Subject: Re: [PATCH] Optimized division operation to shift operation

Am 15.04.20 um 09:41 schrieb Jani Nikula:
> On Tue, 14 Apr 2020, Alex Deucher <alexdeucher@gmail.com> wrote:
>> On Tue, Apr 14, 2020 at 9:05 AM Bernard Zhao <bernard@vivo.com> wrote:
>>> On some processors, the / operate will call the compiler`s div lib,
>>> which is low efficient, We can replace the / operation with shift,
>>> so that we can replace the call of the division library with one
>>> shift assembly instruction.
> This was applied already, and it's not in a driver I look after... but
> to me this feels like something that really should be
> justified. Using >> instead of / for multiples of 2 division mattered 20
> years ago, I'd be surprised if it still did on modern compilers.

I have similar worries, especially since we replace the "/ (4 * 2)" with
">> 3" it's making the code just a bit less readable.

And that the code runs exactly once while loading the driver and pushing
the firmware into the hardware. So performance is completely irrelevant
here.

Regards,
Christian.

>
> BR,
> Jani.
>
>
>>> Signed-off-by: Bernard Zhao <bernard@vivo.com>
>> Applied.  thanks.
>>
>> Alex
>>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c | 4 ++--
>>>   drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c | 4 ++--
>>>   drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c | 4 ++--
>>>   3 files changed, 6 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c b/drivers/gpu/drm/am=
d/amdgpu/gmc_v6_0.c
>>> index b205039..66cd078 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
>>> @@ -175,10 +175,10 @@ static int gmc_v6_0_mc_load_microcode(struct amdg=
pu_device *adev)
>>>          amdgpu_ucode_print_mc_hdr(&hdr->header);
>>>
>>>          adev->gmc.fw_version =3D le32_to_cpu(hdr->header.ucode_version=
);
>>> -       regs_size =3D le32_to_cpu(hdr->io_debug_size_bytes) / (4 * 2);
>>> +       regs_size =3D le32_to_cpu(hdr->io_debug_size_bytes) >> 3;
>>>          new_io_mc_regs =3D (const __le32 *)
>>>                  (adev->gmc.fw->data + le32_to_cpu(hdr->io_debug_array_=
offset_bytes));
>>> -       ucode_size =3D le32_to_cpu(hdr->header.ucode_size_bytes) / 4;
>>> +       ucode_size =3D le32_to_cpu(hdr->header.ucode_size_bytes) >> 2;
>>>          new_fw_data =3D (const __le32 *)
>>>                  (adev->gmc.fw->data + le32_to_cpu(hdr->header.ucode_ar=
ray_offset_bytes));
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c b/drivers/gpu/drm/am=
d/amdgpu/gmc_v7_0.c
>>> index 9da9596..ca26d63 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
>>> @@ -193,10 +193,10 @@ static int gmc_v7_0_mc_load_microcode(struct amdg=
pu_device *adev)
>>>          amdgpu_ucode_print_mc_hdr(&hdr->header);
>>>
>>>          adev->gmc.fw_version =3D le32_to_cpu(hdr->header.ucode_version=
);
>>> -       regs_size =3D le32_to_cpu(hdr->io_debug_size_bytes) / (4 * 2);
>>> +       regs_size =3D le32_to_cpu(hdr->io_debug_size_bytes) >> 3;
>>>          io_mc_regs =3D (const __le32 *)
>>>                  (adev->gmc.fw->data + le32_to_cpu(hdr->io_debug_array_=
offset_bytes));
>>> -       ucode_size =3D le32_to_cpu(hdr->header.ucode_size_bytes) / 4;
>>> +       ucode_size =3D le32_to_cpu(hdr->header.ucode_size_bytes) >> 2;
>>>          fw_data =3D (const __le32 *)
>>>                  (adev->gmc.fw->data + le32_to_cpu(hdr->header.ucode_ar=
ray_offset_bytes));
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c b/drivers/gpu/drm/am=
d/amdgpu/gmc_v8_0.c
>>> index 27d83204..295039c 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
>>> @@ -318,10 +318,10 @@ static int gmc_v8_0_tonga_mc_load_microcode(struc=
t amdgpu_device *adev)
>>>          amdgpu_ucode_print_mc_hdr(&hdr->header);
>>>
>>>          adev->gmc.fw_version =3D le32_to_cpu(hdr->header.ucode_version=
);
>>> -       regs_size =3D le32_to_cpu(hdr->io_debug_size_bytes) / (4 * 2);
>>> +       regs_size =3D le32_to_cpu(hdr->io_debug_size_bytes) >> 3;
>>>          io_mc_regs =3D (const __le32 *)
>>>                  (adev->gmc.fw->data + le32_to_cpu(hdr->io_debug_array_=
offset_bytes));
>>> -       ucode_size =3D le32_to_cpu(hdr->header.ucode_size_bytes) / 4;
>>> +       ucode_size =3D le32_to_cpu(hdr->header.ucode_size_bytes) >> 2;
>>>          fw_data =3D (const __le32 *)
>>>                  (adev->gmc.fw->data + le32_to_cpu(hdr->header.ucode_ar=
ray_offset_bytes));
>>>
>>> --
>>> 2.7.4
>>>
>>> _______________________________________________
>>> amd-gfx mailing list
>>> amd-gfx@lists.freedesktop.org
>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flis=
ts.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=3D02%7C01%7Cchri=
stian.koenig%40amd.com%7C1e91f7edcfe0473b0d7008d7e11074a8%7C3dd8961fe4884e6=
08e11a82d994e183d%7C0%7C0%7C637225333103893889&amp;sdata=3DVDJlEY2%2Bl1SSO8=
Fw1dYqqPFqQtyHpsxQ0Tm7iVOgJQY%3D&amp;reserved=3D0
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flist=
s.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;data=3D02%7C01%7Cchr=
istian.koenig%40amd.com%7C1e91f7edcfe0473b0d7008d7e11074a8%7C3dd8961fe4884e=
608e11a82d994e183d%7C0%7C0%7C637225333103893889&amp;sdata=3DEpqRRbCiksur%2B=
jMlVQplExuJsmw6UPODhyBOutOVukw%3D&amp;reserved=3D0


--_000_MN2PR12MB448868370D02A066FACA9955F7DB0MN2PR12MB4488namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<p style=3D"font-family:Arial;font-size:10pt;color:#317100;margin:15pt;" al=
ign=3D"Left">
[AMD Public Use]<br>
</p>
<br>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
I've gone ahead and dropped the patch.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Alex<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Koenig, Christian &lt=
;Christian.Koenig@amd.com&gt;<br>
<b>Sent:</b> Wednesday, April 15, 2020 3:57 AM<br>
<b>To:</b> Jani Nikula &lt;jani.nikula@linux.intel.com&gt;; Alex Deucher &l=
t;alexdeucher@gmail.com&gt;; Bernard Zhao &lt;bernard@vivo.com&gt;<br>
<b>Cc:</b> Sierra Guiza, Alejandro (Alex) &lt;Alex.Sierra@amd.com&gt;; Zeng=
, Oak &lt;Oak.Zeng@amd.com&gt;; Maling list - DRI developers &lt;dri-devel@=
lists.freedesktop.org&gt;; David Airlie &lt;airlied@linux.ie&gt;; Kuehling,=
 Felix &lt;Felix.Kuehling@amd.com&gt;; LKML &lt;linux-kernel@vger.kernel.or=
g&gt;;
 amd-gfx list &lt;amd-gfx@lists.freedesktop.org&gt;; kernel@vivo.com &lt;ke=
rnel@vivo.com&gt;; Huang, Ray &lt;Ray.Huang@amd.com&gt;; Russell, Kent &lt;=
Kent.Russell@amd.com&gt;; Deucher, Alexander &lt;Alexander.Deucher@amd.com&=
gt;; Sam Ravnborg &lt;sam@ravnborg.org&gt;; Yuan, Xiaojie &lt;Xiaojie.Yuan@=
amd.com&gt;<br>
<b>Subject:</b> Re: [PATCH] Optimized division operation to shift operation=
</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Am 15.04.20 um 09:41 schrieb Jani Nikula:<br>
&gt; On Tue, 14 Apr 2020, Alex Deucher &lt;alexdeucher@gmail.com&gt; wrote:=
<br>
&gt;&gt; On Tue, Apr 14, 2020 at 9:05 AM Bernard Zhao &lt;bernard@vivo.com&=
gt; wrote:<br>
&gt;&gt;&gt; On some processors, the / operate will call the compiler`s div=
 lib,<br>
&gt;&gt;&gt; which is low efficient, We can replace the / operation with sh=
ift,<br>
&gt;&gt;&gt; so that we can replace the call of the division library with o=
ne<br>
&gt;&gt;&gt; shift assembly instruction.<br>
&gt; This was applied already, and it's not in a driver I look after... but=
<br>
&gt; to me this feels like something that really should be<br>
&gt; justified. Using &gt;&gt; instead of / for multiples of 2 division mat=
tered 20<br>
&gt; years ago, I'd be surprised if it still did on modern compilers.<br>
<br>
I have similar worries, especially since we replace the &quot;/ (4 * 2)&quo=
t; with <br>
&quot;&gt;&gt; 3&quot; it's making the code just a bit less readable.<br>
<br>
And that the code runs exactly once while loading the driver and pushing <b=
r>
the firmware into the hardware. So performance is completely irrelevant <br=
>
here.<br>
<br>
Regards,<br>
Christian.<br>
<br>
&gt;<br>
&gt; BR,<br>
&gt; Jani.<br>
&gt;<br>
&gt;<br>
&gt;&gt;&gt; Signed-off-by: Bernard Zhao &lt;bernard@vivo.com&gt;<br>
&gt;&gt; Applied.&nbsp; thanks.<br>
&gt;&gt;<br>
&gt;&gt; Alex<br>
&gt;&gt;<br>
&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c | 4 &#43;&#4=
3;--<br>
&gt;&gt;&gt;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c | 4 &#43;&#4=
3;--<br>
&gt;&gt;&gt;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c | 4 &#43;&#4=
3;--<br>
&gt;&gt;&gt;&nbsp;&nbsp; 3 files changed, 6 insertions(&#43;), 6 deletions(=
-)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c b/drivers/g=
pu/drm/amd/amdgpu/gmc_v6_0.c<br>
&gt;&gt;&gt; index b205039..66cd078 100644<br>
&gt;&gt;&gt; --- a/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c<br>
&gt;&gt;&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c<br>
&gt;&gt;&gt; @@ -175,10 &#43;175,10 @@ static int gmc_v6_0_mc_load_microcod=
e(struct amdgpu_device *adev)<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_u=
code_print_mc_hdr(&amp;hdr-&gt;header);<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt=
;gmc.fw_version =3D le32_to_cpu(hdr-&gt;header.ucode_version);<br>
&gt;&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; regs_size =3D le32_to_cp=
u(hdr-&gt;io_debug_size_bytes) / (4 * 2);<br>
&gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; regs_size =3D le32_t=
o_cpu(hdr-&gt;io_debug_size_bytes) &gt;&gt; 3;<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; new_io_m=
c_regs =3D (const __le32 *)<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (adev-&gt;gmc.fw-&gt;data &#43; le3=
2_to_cpu(hdr-&gt;io_debug_array_offset_bytes));<br>
&gt;&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ucode_size =3D le32_to_c=
pu(hdr-&gt;header.ucode_size_bytes) / 4;<br>
&gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ucode_size =3D le32_=
to_cpu(hdr-&gt;header.ucode_size_bytes) &gt;&gt; 2;<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; new_fw_d=
ata =3D (const __le32 *)<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (adev-&gt;gmc.fw-&gt;data &#43; le3=
2_to_cpu(hdr-&gt;header.ucode_array_offset_bytes));<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c b/drivers/g=
pu/drm/amd/amdgpu/gmc_v7_0.c<br>
&gt;&gt;&gt; index 9da9596..ca26d63 100644<br>
&gt;&gt;&gt; --- a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c<br>
&gt;&gt;&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c<br>
&gt;&gt;&gt; @@ -193,10 &#43;193,10 @@ static int gmc_v7_0_mc_load_microcod=
e(struct amdgpu_device *adev)<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_u=
code_print_mc_hdr(&amp;hdr-&gt;header);<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt=
;gmc.fw_version =3D le32_to_cpu(hdr-&gt;header.ucode_version);<br>
&gt;&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; regs_size =3D le32_to_cp=
u(hdr-&gt;io_debug_size_bytes) / (4 * 2);<br>
&gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; regs_size =3D le32_t=
o_cpu(hdr-&gt;io_debug_size_bytes) &gt;&gt; 3;<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; io_mc_re=
gs =3D (const __le32 *)<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (adev-&gt;gmc.fw-&gt;data &#43; le3=
2_to_cpu(hdr-&gt;io_debug_array_offset_bytes));<br>
&gt;&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ucode_size =3D le32_to_c=
pu(hdr-&gt;header.ucode_size_bytes) / 4;<br>
&gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ucode_size =3D le32_=
to_cpu(hdr-&gt;header.ucode_size_bytes) &gt;&gt; 2;<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fw_data =
=3D (const __le32 *)<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (adev-&gt;gmc.fw-&gt;data &#43; le3=
2_to_cpu(hdr-&gt;header.ucode_array_offset_bytes));<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c b/drivers/g=
pu/drm/amd/amdgpu/gmc_v8_0.c<br>
&gt;&gt;&gt; index 27d83204..295039c 100644<br>
&gt;&gt;&gt; --- a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c<br>
&gt;&gt;&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c<br>
&gt;&gt;&gt; @@ -318,10 &#43;318,10 @@ static int gmc_v8_0_tonga_mc_load_mi=
crocode(struct amdgpu_device *adev)<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_u=
code_print_mc_hdr(&amp;hdr-&gt;header);<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt=
;gmc.fw_version =3D le32_to_cpu(hdr-&gt;header.ucode_version);<br>
&gt;&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; regs_size =3D le32_to_cp=
u(hdr-&gt;io_debug_size_bytes) / (4 * 2);<br>
&gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; regs_size =3D le32_t=
o_cpu(hdr-&gt;io_debug_size_bytes) &gt;&gt; 3;<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; io_mc_re=
gs =3D (const __le32 *)<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (adev-&gt;gmc.fw-&gt;data &#43; le3=
2_to_cpu(hdr-&gt;io_debug_array_offset_bytes));<br>
&gt;&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ucode_size =3D le32_to_c=
pu(hdr-&gt;header.ucode_size_bytes) / 4;<br>
&gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ucode_size =3D le32_=
to_cpu(hdr-&gt;header.ucode_size_bytes) &gt;&gt; 2;<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fw_data =
=3D (const __le32 *)<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (adev-&gt;gmc.fw-&gt;data &#43; le3=
2_to_cpu(hdr-&gt;header.ucode_array_offset_bytes));<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; --<br>
&gt;&gt;&gt; 2.7.4<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; _______________________________________________<br>
&gt;&gt;&gt; amd-gfx mailing list<br>
&gt;&gt;&gt; amd-gfx@lists.freedesktop.org<br>
&gt;&gt;&gt; <a href=3D"https://nam11.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;a=
mp;data=3D02%7C01%7Cchristian.koenig%40amd.com%7C1e91f7edcfe0473b0d7008d7e1=
1074a8%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637225333103893889&amp;=
amp;sdata=3DVDJlEY2%2Bl1SSO8Fw1dYqqPFqQtyHpsxQ0Tm7iVOgJQY%3D&amp;amp;reserv=
ed=3D0">
https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.f=
reedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;amp;data=3D02%7C01%7Cchri=
stian.koenig%40amd.com%7C1e91f7edcfe0473b0d7008d7e11074a8%7C3dd8961fe4884e6=
08e11a82d994e183d%7C0%7C0%7C637225333103893889&amp;amp;sdata=3DVDJlEY2%2Bl1=
SSO8Fw1dYqqPFqQtyHpsxQ0Tm7iVOgJQY%3D&amp;amp;reserved=3D0</a><br>
&gt;&gt; _______________________________________________<br>
&gt;&gt; dri-devel mailing list<br>
&gt;&gt; dri-devel@lists.freedesktop.org<br>
&gt;&gt; <a href=3D"https://nam11.safelinks.protection.outlook.com/?url=3Dh=
ttps%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;amp=
;data=3D02%7C01%7Cchristian.koenig%40amd.com%7C1e91f7edcfe0473b0d7008d7e110=
74a8%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637225333103893889&amp;am=
p;sdata=3DEpqRRbCiksur%2BjMlVQplExuJsmw6UPODhyBOutOVukw%3D&amp;amp;reserved=
=3D0">
https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.f=
reedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;amp;data=3D02%7C01%7Cch=
ristian.koenig%40amd.com%7C1e91f7edcfe0473b0d7008d7e11074a8%7C3dd8961fe4884=
e608e11a82d994e183d%7C0%7C0%7C637225333103893889&amp;amp;sdata=3DEpqRRbCiks=
ur%2BjMlVQplExuJsmw6UPODhyBOutOVukw%3D&amp;amp;reserved=3D0</a><br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_MN2PR12MB448868370D02A066FACA9955F7DB0MN2PR12MB4488namp_--

--===============0316639365==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0316639365==--

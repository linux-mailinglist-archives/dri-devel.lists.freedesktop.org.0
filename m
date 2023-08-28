Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D1C78B3E4
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 17:02:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71E3310E2FB;
	Mon, 28 Aug 2023 15:02:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2082.outbound.protection.outlook.com [40.107.93.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ACD510E2F8;
 Mon, 28 Aug 2023 15:02:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H6Ov7Dutq+XiUXRZ6u7zHjFWGFTRV5ihTcc5UDjVHDq8vGxqwpV4MyqdMuqN7QmRdiQIzVA6ESyUwP/rKmoi3itR6NZtZTNcHhM4M2uQHR73d8OgwizDJXkTmfDz+S9d0kwkOKWhYdBJsj+TO/D7EoQOjW2mgPYBvGGTc7zpaOALbHKoGeJ9vQigHiGitJkh3tUQD/0qFI6Xi0dLHt4YhGE44ZHOy6hSRPwmMXX5Ok1IJa0r0uSG1ZhcIMtDP9HCdZ7/dSsPnKp25OSdFsKBABjn9MBQczaItOEuyWN+kOp3OO4gJpo8q5usAzM0VpMm2/1FqB3zjIWH/Z8qMPRlBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5KMO3022AYQs/ZICxnsdEIBetRsvXORlwLBhBZq2TRk=;
 b=Br1Y5SpXjFkkOBAgUoODzuRyEE0hRtAFqoCYQo3O27SMOWktFJPrE7K6/eXWGpjWA2FYEKvAD/4urS5KCQdcQbcL2TJ/hX9WzkiNZW4U5LElgfGSReddQxWguCR9mOHRUQxxx3nR0+5QLbllm5HZmaJ9aYbnXe7tcYQhe2oAEa67XdFUIl1UL7+5DCxuIH04c7GphBNo8cdbSXwK38Xx2M+TMDq00BNrc6x8uvUM/2WCMjoc4GFI3kEAkQes4r0UYP3j41BcvNfYX1w52HSDFoWC41ql/4XXmrxwgAb61j5n63mIRTPSzfquPF7GI8bL+cMSjQiGkk8jTjqjrYJYjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5KMO3022AYQs/ZICxnsdEIBetRsvXORlwLBhBZq2TRk=;
 b=PR28YtF2xFedLfyPMQf8Gs97GEN8Gny663RR9oyPsKqSlQVmdVMWfJPY5sZLvUbU9MmR2reua127kB3LnMhtzfCwDIzNMylO1jlDlxvWdc/+JPdT/PXSzv63TV3CQparTCQyk0LvVEX8DJaN4H8qp8RD58wCmkVmdWYDffCZwjI=
Received: from BYAPR12MB4614.namprd12.prod.outlook.com (2603:10b6:a03:a6::22)
 by PH8PR12MB7110.namprd12.prod.outlook.com (2603:10b6:510:22e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Mon, 28 Aug
 2023 15:02:13 +0000
Received: from BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::af11:a0ea:b4e4:d1e0]) by BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::af11:a0ea:b4e4:d1e0%5]) with mapi id 15.20.6699.034; Mon, 28 Aug 2023
 15:02:13 +0000
From: "Lazar, Lijo" <Lijo.Lazar@amd.com>
To: "Yadav, Arvind" <Arvind.Yadav@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>, 
 "Sharma, Shashank" <Shashank.Sharma@amd.com>, "Pan, Xinhui"
 <Xinhui.Pan@amd.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "Kuehling, Felix"
 <Felix.Kuehling@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v3 0/7] GPU workload hints for better performance
Thread-Topic: [PATCH v3 0/7] GPU workload hints for better performance
Thread-Index: AQHZ2ar684ekOm6tc0OGiyh0gu1Wy6//yLj3
Date: Mon, 28 Aug 2023 15:02:13 +0000
Message-ID: <BYAPR12MB4614D2C51DD24B7163B3652397E0A@BYAPR12MB4614.namprd12.prod.outlook.com>
References: <20230828122614.3815122-1-Arvind.Yadav@amd.com>
In-Reply-To: <20230828122614.3815122-1-Arvind.Yadav@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=True;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-08-28T14:43:37.4505272Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4614:EE_|PH8PR12MB7110:EE_
x-ms-office365-filtering-correlation-id: 5cbcbb49-c64e-4f83-7f78-08dba7d7c332
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KlDRgAn9FH1VHfu8Mf7kWaTKAaXar4tSjdZLriqjA89DWrUuitQPg1Sk0e4I3ldaZwLsd+t5eWTkjvCS+SqwUxPUI8Ly5R8M6m4oQcd2bVTGem4QH7UxZNwbLVYxbNbQtpG9pIt/zx4W8JkvjUEEczdukwqa8dMqCp7Lb8cAmu1gh4NePmz9rlzsFRdVr26Oe5xILxHyxufFAuIY/AxxpNHWGA89j1vc8bWt0txv3odcIefBjclZu841YvwpWqleW8RHBG39klzyToXoWw/iaANYAyBtqxCBRTtcHsfHQoYKlb5S9tbYczxvYTFuIQXyjiAV4cim9TQe7n3NtiS8Kr5nsPw3/5arf9XJchAwiQ0XkDhLKiegu1rBLJAvA/PFFLzbR+G1/LCWugoM7h7/56ddR8aCSpwTSHqYSUoWuacPKd4R9+f4yAnU8+7hq64wTf9I3qLXbQr/EzBdPzWh3Rmntz7aqZmJcYvSwhGo0A1INejkhnDyEbrTY8Hktwe/VvbDBsx36jBbu8uuzWjK2c3e8R88cAIgAmKKxFTSCkvfQ3kosR22ZS7qdJx+s0vd4UAOluX7599P4qtvlrlJjVAtbFrulIu2XImEZz6kj0LaiTsomjVJDigEJM2qQ3XvdbD87skGoR9+OLC37NSMeg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB4614.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(136003)(346002)(39860400002)(376002)(451199024)(1800799009)(186009)(6506007)(66946007)(2906002)(83380400001)(53546011)(66446008)(41300700001)(66556008)(66476007)(9686003)(5660300002)(8676002)(4326008)(478600001)(110136005)(8936002)(52536014)(54906003)(316002)(76116006)(55016003)(26005)(71200400001)(7696005)(64756008)(122000001)(33656002)(921005)(38100700002)(38070700005)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?misV30A/3R6EJdPZf4GAWDoQbZ+dpEBhlIGBVPJk8M5k/uKjXA9xCZ7gZb+/?=
 =?us-ascii?Q?xmN4yu74xwP6g5BOfql5nw97HwWjuka9kl6GVv3I56zA3RCVeButiH/x7BHR?=
 =?us-ascii?Q?2zBecS+TEUjkFACkEDNU+S0VZdF5KKW5q9vTnZoc8hGLN8CzqhGvsIRechj1?=
 =?us-ascii?Q?n9EAEoXjePoDFVbbTchixDPG7QlmlRx3jlQWCjbrf4CLUngpblTefS2f125+?=
 =?us-ascii?Q?7Vlf98OftxaozSMYKlYhbjGY2BKd7+rQmSTPxuWpH1M672eoSoOF9Om0Cvhe?=
 =?us-ascii?Q?hCaTMHTmYKQVRavmDopNAMAghoYdFkPBWMvngWOA7tGexV5goG6/igYo4lK+?=
 =?us-ascii?Q?0YXdwABWqeaR8zpTEb2B3/gpBCQtX7A5T4VllfaEyToLQex4EUWHVkaPYnCP?=
 =?us-ascii?Q?fxDBHf+NXEIdqroBfQCsWNFzffUohGOKQDOTPz34Xb8ff1l0FYH20FoIDzex?=
 =?us-ascii?Q?b3LtX/e6cvPuCk+0c4DNDASFP3fI6SSkIpeGPvl2zxx9yqI3v1NEGYratSrS?=
 =?us-ascii?Q?IWrq9f6+MCL0JerUJqkERLfBCvTlBishc8DXEox/yQS3ZABzWRKJXzm5kAgd?=
 =?us-ascii?Q?gfmwZ/9OuJKB6mZBMWApw3BcEwgYAE4beOFehKKuDsSTr4veTFdBOGyhPDE0?=
 =?us-ascii?Q?+CMn9mJTmPlooxnPjExlxKZHycLaOP2fWbCBjZ47/+Xcpu0uR5X+EFak3gCi?=
 =?us-ascii?Q?6FeH/qTtQK7G6GbjMdy3kkAulHZDuQAlDzURR0ZhtNMT6/e0NeCW1GQ43x0n?=
 =?us-ascii?Q?6oJBQnL8ZakHDHPOn3iVe/2s7G1ByZzChxVQippdkXTA2Ah/B1hn6WKBqvqg?=
 =?us-ascii?Q?Fk6v9lMiOqBHU75Q9RgCqJBatmFzLNkQAZkKvcgpEpQ9f8+0UV2Cmq/3G1aw?=
 =?us-ascii?Q?WVnGIxo9qskNCBCo82LnaH5eg7rYwPdP1i/PNgKEwmt+cfKP48atBEdWXvp4?=
 =?us-ascii?Q?KXt1GCw4Rx9RB9MqxNeArmdG6B5qOg6NoXXK+LYkloo18qICyof5YWgA13er?=
 =?us-ascii?Q?FO+Lz16m+/qwvhyCXpbuRrPOmXnNpJO75aKlsuG18ERI4MFkc4PCXHEWTnZv?=
 =?us-ascii?Q?qKTF9ke03sU05XntFHOuV34t0O6Ani6FuikZAkPC2LeEu/stQnr9I4EpeOLy?=
 =?us-ascii?Q?jhdYOp3qxh4eT1ClhuPGOzlK0WOeFBCZxAdO01iGKjogezXTgbxJYWPt1n7z?=
 =?us-ascii?Q?xXL6Ip+bNgCg1BxuTYpdx4709raj5matHMR7zRGZ1e35P1t/Fvw0kBwO7gEi?=
 =?us-ascii?Q?sUozsE3L7AN2eqbhB9uiOBnMgKYP46jeR/AQzmpb2bai4Vpg/DZad1KcH+yg?=
 =?us-ascii?Q?jLX0eFHlxOifVCqw997DsUGlFM/oZpntoFbD9/K4NUTofjvuRejWZuaP9Frg?=
 =?us-ascii?Q?/LvenEwl34s7JAilGgb4RcCkXGsWnDocDlzCRunDbyo7lI3/U3OmXHO9z8MC?=
 =?us-ascii?Q?bFm0XPdLNuza5W7tlPK8K2S6UPNtlHgt5216T0zz628rO64YOgDNk1Ol8mR4?=
 =?us-ascii?Q?MBDa+s55+mT/E+39YrOwzdlElSPvtVBvBQKw48viesoqbHieFaF7/yoR02g6?=
 =?us-ascii?Q?7Qj5N+CwMnVrMFXGV3pYM+Bd/i9sqB11Qt+QJb30?=
Content-Type: multipart/alternative;
 boundary="_000_BYAPR12MB4614D2C51DD24B7163B3652397E0ABYAPR12MB4614namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4614.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cbcbb49-c64e-4f83-7f78-08dba7d7c332
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2023 15:02:13.7404 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rvX9OkMjCTztwyxf+GDw9JOve3EfFvrreW2fOxhK0bYN+Z3IN73pVfS0NRxaCc+h
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7110
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Yadav,
 Arvind" <Arvind.Yadav@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_BYAPR12MB4614D2C51DD24B7163B3652397E0ABYAPR12MB4614namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - General]

As mentioned with an older version of this series, this is an 'abuse' of po=
wer profile interface.

This series is oversimplifying what PMFW algorithms are supposed to be doin=
g. Whatever this series is doing, FW can do it better.

To explain in simpler terms - it just tries to boost a profile based on rin=
g type without even knowing how much of activity a job can trigger on a par=
ticular ring. A job scheduled to a GFX ring doesn't deserve a profile boost=
 unless it can create a certain level of activity. In CPU terms, a job sche=
duled to a processor doesn't mean it deserves a frequency boost of that CPU=
.  At minimum it depends on more details like whether that job is compute b=
ound or memory bound or memory bound.

While FW algorithms are designed to do that, this series tries to trivialis=
e all such things.

Unless you are able to show the tangible benefits in some terms like perfor=
mance, power, or performance per watt,  I don't think this should be the de=
fault behaviour where driver tries to override FW just based on job submiss=
ions to rings.

Thanks,
Lijo
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Arvind Y=
adav <Arvind.Yadav@amd.com>
Sent: Monday, August 28, 2023 5:56:07 PM
To: Koenig, Christian <Christian.Koenig@amd.com>; Deucher, Alexander <Alexa=
nder.Deucher@amd.com>; Sharma, Shashank <Shashank.Sharma@amd.com>; Pan, Xin=
hui <Xinhui.Pan@amd.com>; airlied@gmail.com <airlied@gmail.com>; daniel@ffw=
ll.ch <daniel@ffwll.ch>; Kuehling, Felix <Felix.Kuehling@amd.com>; amd-gfx@=
lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Cc: Yadav, Arvind <Arvind.Yadav@amd.com>; linux-kernel@vger.kernel.org <lin=
ux-kernel@vger.kernel.org>; dri-devel@lists.freedesktop.org <dri-devel@list=
s.freedesktop.org>
Subject: [PATCH v3 0/7] GPU workload hints for better performance

AMDGPU SOCs supports dynamic workload based power profiles, which can
provide fine-tuned performance for a particular type of workload.
This patch series adds an interface to set/reset these power profiles
based on the submitted job. The driver can dynamically switch
the power profiles based on submitted job. This can optimize the power
performance when the particular workload is on.

v2:
- Splitting workload_profile_set and workload_profile_put
  into two separate patches.
- Addressed review comment.
- Added new suspend function.
- Added patch to switches the GPU workload mode for KFD.

v3:
- Addressed all review comment.
- Changed the function name from *_set() to *_get().
- Now clearing all the profile in work handler.
- Added *_clear_all function to clear all the power profile.


Arvind Yadav (7):
  drm/amdgpu: Added init/fini functions for workload
  drm/amdgpu: Add new function to set GPU power profile
  drm/amdgpu: Add new function to put GPU power profile
  drm/amdgpu: Add suspend function to clear the GPU power profile.
  drm/amdgpu: Set/Reset GPU workload profile
  drm/amdgpu: switch workload context to/from compute
  Revert "drm/amd/amdgpu: switch on/off vcn power profile mode"

 drivers/gpu/drm/amd/amdgpu/Makefile           |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |   3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c    |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |   6 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c       |   5 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c       |  14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c  | 226 ++++++++++++++++++
 drivers/gpu/drm/amd/include/amdgpu_workload.h |  61 +++++
 8 files changed, 309 insertions(+), 16 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
 create mode 100644 drivers/gpu/drm/amd/include/amdgpu_workload.h

--
2.34.1


--_000_BYAPR12MB4614D2C51DD24B7163B3652397E0ABYAPR12MB4614namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<p style=3D"font-family:Arial;font-size:10pt;color:#0000FF;margin:5pt;font-=
style:normal;font-weight:normal;text-decoration:none;" align=3D"Left">
[AMD Official Use Only - General]<br>
</p>
<br>
<div>
<div dir=3D"auto">As mentioned with an older version of this series, this i=
s an 'abuse' of power profile interface.</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">This series is oversimplifying what PMFW algorithms are s=
upposed to be doing. Whatever this series is doing, FW can do it better.<sp=
an></span></div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">To explain in simpler terms - it just tries to boost a pr=
ofile based on ring type without even knowing how much of activity a job ca=
n trigger on a partic<span>ular ring. A job scheduled to a GFX ring doesn't=
 deserve a profile boost unless it
 can create a certain level of activity. In CPU terms, a job scheduled to a=
 processor doesn't mean it deserves a frequency boost of that CPU.&nbsp; At=
 minimum it depends on more details like whether that job is compute bound =
or memory bound or memory bound.&nbsp;</span></div>
<div dir=3D"auto"><span><br>
</span></div>
<div dir=3D"auto"><span>While FW algorithms are designed to do that, this s=
eries tries to trivialise all such things.</span></div>
<div dir=3D"auto"><span><br>
</span></div>
<div dir=3D"auto"><span>Unless you are able to show the tangible benefits i=
n some terms like performance, power, or performance per watt,&nbsp; I don'=
t think this should be the default behaviour where driver tries to override=
 FW just based on job submissions to rings.<span></span></span></div>
<div dir=3D"auto"></div>
<div dir=3D"auto"><br>
</div>
<div id=3D"ms-outlook-mobile-signature" dir=3D"auto">Thanks,<br>
Lijo</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Arvind Yadav &lt;Arvind.Yadav=
@amd.com&gt;<br>
<b>Sent:</b> Monday, August 28, 2023 5:56:07 PM<br>
<b>To:</b> Koenig, Christian &lt;Christian.Koenig@amd.com&gt;; Deucher, Ale=
xander &lt;Alexander.Deucher@amd.com&gt;; Sharma, Shashank &lt;Shashank.Sha=
rma@amd.com&gt;; Pan, Xinhui &lt;Xinhui.Pan@amd.com&gt;; airlied@gmail.com =
&lt;airlied@gmail.com&gt;; daniel@ffwll.ch &lt;daniel@ffwll.ch&gt;;
 Kuehling, Felix &lt;Felix.Kuehling@amd.com&gt;; amd-gfx@lists.freedesktop.=
org &lt;amd-gfx@lists.freedesktop.org&gt;<br>
<b>Cc:</b> Yadav, Arvind &lt;Arvind.Yadav@amd.com&gt;; linux-kernel@vger.ke=
rnel.org &lt;linux-kernel@vger.kernel.org&gt;; dri-devel@lists.freedesktop.=
org &lt;dri-devel@lists.freedesktop.org&gt;<br>
<b>Subject:</b> [PATCH v3 0/7] GPU workload hints for better performance</f=
ont>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">AMDGPU SOCs supports dynamic workload based power =
profiles, which can<br>
provide fine-tuned performance for a particular type of workload.<br>
This patch series adds an interface to set/reset these power profiles<br>
based on the submitted job. The driver can dynamically switch<br>
the power profiles based on submitted job. This can optimize the power<br>
performance when the particular workload is on. <br>
<br>
v2:<br>
- Splitting workload_profile_set and workload_profile_put<br>
&nbsp; into two separate patches.<br>
- Addressed review comment.<br>
- Added new suspend function.<br>
- Added patch to switches the GPU workload mode for KFD. <br>
<br>
v3:<br>
- Addressed all review comment.<br>
- Changed the function name from *_set() to *_get().<br>
- Now clearing all the profile in work handler.<br>
- Added *_clear_all function to clear all the power profile.<br>
<br>
<br>
Arvind Yadav (7):<br>
&nbsp; drm/amdgpu: Added init/fini functions for workload<br>
&nbsp; drm/amdgpu: Add new function to set GPU power profile<br>
&nbsp; drm/amdgpu: Add new function to put GPU power profile<br>
&nbsp; drm/amdgpu: Add suspend function to clear the GPU power profile.<br>
&nbsp; drm/amdgpu: Set/Reset GPU workload profile<br>
&nbsp; drm/amdgpu: switch workload context to/from compute<br>
&nbsp; Revert &quot;drm/amd/amdgpu: switch on/off vcn power profile mode&qu=
ot;<br>
<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/Makefile&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 2 +-<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 3 +<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c&nbsp;&nbsp;&nbsp; |&nbsp;&=
nbsp; 8 +-<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_device.c&nbsp;&nbsp;&nbsp; |&nbsp;&=
nbsp; 6 +<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_job.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; |&nbsp;&nbsp; 5 +<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; |&nbsp; 14 +-<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c&nbsp; | 226 ++++++++++++=
++++++<br>
&nbsp;drivers/gpu/drm/amd/include/amdgpu_workload.h |&nbsp; 61 +++++<br>
&nbsp;8 files changed, 309 insertions(+), 16 deletions(-)<br>
&nbsp;create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c<br>
&nbsp;create mode 100644 drivers/gpu/drm/amd/include/amdgpu_workload.h<br>
<br>
-- <br>
2.34.1<br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_BYAPR12MB4614D2C51DD24B7163B3652397E0ABYAPR12MB4614namp_--

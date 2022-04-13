Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C34B14FF79D
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 15:28:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E83FB10F120;
	Wed, 13 Apr 2022 13:28:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2061.outbound.protection.outlook.com [40.107.212.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDEE810F104;
 Wed, 13 Apr 2022 13:28:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZihZ40ugYB82jVbDH+gKcdp6bk92g2FasFqOpOmTdqOGuwNCJHhkCwwRR/Y1wrx3miaiMtmuVYQMu6WG++q+eh0uHh8pTiJ79/BElX+a/mInI85TrVnvSPBv89+14KRB86f2pVGtzB2isFOGBjeT2S3CaT5Z6hXNXaVSoZqt2FVTz/aFWKL0okI2qlavRaCAeS0OT3rqhTvcdj3rCOC5LBvfQ6yyQEkAikJl+Ju3V6e6bgLFYN5c3/EdgYRsQzHa8pMJgTyIuXgUUlRgFQ5weqGvh97Lh/jT3O/ChW/FfPiMugsW4ZmJ3TaqvLxzLx7Gn1fDEfteV2nXDgLGNOZ6Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=geJ6+fjGWBJhvFNKtYr049bilB2+IryVWUFr/RPxdZA=;
 b=idMpkWk1iejS+ZFYwdxlr20897EpSX9AHop9eArvCu4nB+v5y9SVceLhGG/ZDCKk2l8oYHZQBZOlHPDahJ8K2kmoby7NW3oiRuX82ZJkd8cGbO8EKC80Fq0CcfhO7wFFODPZkaeZjyYT1LTT+qbGvDbT5QWSxjLkwN6HDh2idr+fhQdGsRqLVkCswZRVZpUdcUCSVV8RpCR5/4o62PnorDuXQw8hbTf34TGAURjeAwWTv8UE1dTO4o9bk0iQhJjvX3p3mUpbkYDk66rHpdX09mtF6sE2HbEcBSkjBJo1ZzBpq8wTTgB8NMKpAiMZ2DF21q0uVi0RRVi03ivyxxlA2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=geJ6+fjGWBJhvFNKtYr049bilB2+IryVWUFr/RPxdZA=;
 b=jNpWAzXh8cUmLOwANaoxj12qU2lSXFBcKwYxUAJ0ao71g43LKO0NLuHjpA8Bt/AyypVfiTDRqaz6lAKABbebGk0wIrJIBeS5VpM9ReJY7aPzisrkWoLspyk9b0M8luvr+q9Xyyou5p/TQaFOfsJQ8DoNDrbXKL6eQ3PGzHyurow=
Received: from BL1PR12MB5157.namprd12.prod.outlook.com (2603:10b6:208:308::15)
 by DM6PR12MB3355.namprd12.prod.outlook.com (2603:10b6:5:115::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Wed, 13 Apr
 2022 13:28:29 +0000
Received: from BL1PR12MB5157.namprd12.prod.outlook.com
 ([fe80::3157:3164:59df:b603]) by BL1PR12MB5157.namprd12.prod.outlook.com
 ([fe80::3157:3164:59df:b603%7]) with mapi id 15.20.5164.018; Wed, 13 Apr 2022
 13:28:29 +0000
From: "Limonciello, Mario" <Mario.Limonciello@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, Paul Menzel <pmenzel@molgen.mpg.de>
Subject: RE: [PATCHv4] drm/amdgpu: disable ASPM on Intel Alder Lake based
 systems
Thread-Topic: [PATCHv4] drm/amdgpu: disable ASPM on Intel Alder Lake based
 systems
Thread-Index: AQHYTreTlqxj65YQFkOrqD4z/riAc6ztdvoAgABYlgCAAAE94A==
Date: Wed, 13 Apr 2022 13:28:28 +0000
Message-ID: <BL1PR12MB515779F96AF6727B238BB32FE2EC9@BL1PR12MB5157.namprd12.prod.outlook.com>
References: <20220412215000.897344-1-richard.gong@amd.com>
 <d4ba3998-34aa-86d2-bde9-bc6ae9d8d08d@molgen.mpg.de>
 <CADnq5_MgvcGPWf2gYn_3qCr+Gq1P39tvv-W-o8NhivvMpMwUBA@mail.gmail.com>
In-Reply-To: <CADnq5_MgvcGPWf2gYn_3qCr+Gq1P39tvv-W-o8NhivvMpMwUBA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2022-04-13T13:05:22Z; 
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=4fda3441-5478-408d-a1ca-ec140ca8e456;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_enabled: true
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_setdate: 2022-04-13T13:28:27Z
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_method: Privileged
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_name: Public-AIP 2.0
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_actionid: ebdc4f7d-e83b-4f3e-8d21-9c0f57247881
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7c8e7bf3-4e0b-429e-a774-08da1d517f3f
x-ms-traffictypediagnostic: DM6PR12MB3355:EE_
x-microsoft-antispam-prvs: <DM6PR12MB33558B3DD6FEF5A2BD061CC0E2EC9@DM6PR12MB3355.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FsSbI3snsUn12kGefU/zb/R4SK2QrlVWGPS/+geibNuznpt7q9GpFsbPW0O6arKCSi8Ky4K8hCjqkboESyKle+sLD6Ff1RCPRLruMKO7bXgGo+KE1iW/8NFeLQ1iTKm828WKjW6W8Vm1lZzgs9fmuOrcPHMSUqhwQSUpGoBpJ+MbnJdtLXPRN7dUSEhMMOAbzd+FWI7XcN/EisYjuInERocP7UbiH82RmiP3qLJWTivOhDCva3FVUtxcGBsbN+vAoWrbrHHt15VrAodzuhBJG9dSWkftevV3ACV5nEEf4PwqQZ7xo5wQ9c8PK8kqMhWeuroS9lSjDNxUHYR2dbdkksZATsFKspTtIVtw3BpgluePTZwCmmeClESyDGimEvQNwo3adQMsEL5vWfkfzd8CxJ5slqy9jtUid+mxn7n4vEDpei7FhRFVS0LmFjPNVF07LXSAuTGDs24K7uTVQA+PFr2bX3kbe8cQ3jRBHdlOrU8FwWVM23uOk27azSMahg9Dt1eGm72ndl8iKrnjmkN/2p0CujBAGLbS+Pi0r2kmLtgRIZGEsNJvfad9awTbvjcKo0R2mGQl2XNFw9OTLyUrSJgX7aR02EZ7nCUZhDiLDXsddqNc4bStMEY4jjRHSk3rxJsFHWvqNUUrGWENBn28B2tVTUrYz8wAek9c0D8xyl43GBCZPaiNkggQN+83eLguUtg+h106dQTfqzc3nuPxDOv/j7onBa7KNzVCfszU493gLYgSNeCyZe0ztY90d01ENI81Urhjmx/Iwia3/s+cK7/+mP2RyU/M8wxqM2y++dw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5157.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(54906003)(52536014)(8936002)(33656002)(508600001)(186003)(110136005)(2906002)(7696005)(122000001)(38070700005)(53546011)(9686003)(5660300002)(66476007)(316002)(6506007)(86362001)(966005)(38100700002)(71200400001)(45080400002)(55016003)(8676002)(66556008)(66446008)(64756008)(76116006)(66946007)(4326008)(83380400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?bcyL1nKXDINJNRIetQT2XPS5LN55u7LozsdhEwQLFTMwvcH80tToXWBBO5Vl?=
 =?us-ascii?Q?FIqNjZ+ys/LcxpX+Bh7aXHA2PYP2od28JCblQ3PZvp5I4IRvxCwb5IgZaLUF?=
 =?us-ascii?Q?Lrs8XHQdTK1nCKuLB23q5VTpNkeAMj8TBJW6+xWzAt0pNdr3Za23FM0ynbfb?=
 =?us-ascii?Q?K0+ptrd7aU9hULp4D6Ytm6ucWVkMYRGLqp7kePwpOQymdASgu3O3H/Z3iils?=
 =?us-ascii?Q?rtWSeXRvKS8gqOj8rAAN02Ad0OeF+TEPj3GjuCNvtjLj0OppxhEp9t+I/csJ?=
 =?us-ascii?Q?tvlaZa2fHOdezRYrwS80PulW8NtPAfXv1gdgPcm8IUULdNz4qg2zfBpOd/5K?=
 =?us-ascii?Q?M8sHX3qf80TLwQbfBAg2OA51kt3O5SyPn4dKpoza4tAmFbR2QewjGGxUk06e?=
 =?us-ascii?Q?QfeCIXlgF/AyfV1ygUzaxHzJrHtsR3/zg5F2+/zexZ8OQ8io7ogCNgEQcOyV?=
 =?us-ascii?Q?K4HeIZP3T4DmKR1AVXGqEng8VYFGB+DYB44BynYBcV1mW4bcWLM+uMqYQOZ3?=
 =?us-ascii?Q?B8sDBKolG10wpYIcxD1Hua9zlX9oVkfn64z//kUWerqOETw/t2Wxhj+EPT8J?=
 =?us-ascii?Q?vlzrp19blbrLNi1FybYN58qSs5GH3327GY+yrW1uXLJ+CoHPvsNnsz4JR6Kv?=
 =?us-ascii?Q?kLvXlZXYJ6puv0Mq+2JPYb5A3gR1bMTenOpNlgDSNbdK+SGDlINnkGnLPd2v?=
 =?us-ascii?Q?vVInJWHcY9kJaHNqYChA0i3faPM7y0xHpYkvRz6tQesqhTvoczrHBDTcS6+s?=
 =?us-ascii?Q?ZfltY02AQb4gXYe68HbDLhBkCnTFMb9zWoAoSaBuL761flTELzUZVjod+tHK?=
 =?us-ascii?Q?RceRKqReTYomsNO1S9vSsTOzmF9DeFYTZ0t+BRwJursFEzdtlhcupjdZIfvF?=
 =?us-ascii?Q?V+/IaNyApqoviHJpPYCnSG43rA2jmZeZmHlGQU9vFoYz1g0pXyqOeaTvWIQE?=
 =?us-ascii?Q?8LCpoct22IN2Cn735eVfroYK+Ct0jNsNrMRA9zit+E4b6ZmJ5JWojguMH0nf?=
 =?us-ascii?Q?uVi5QlBDDB2aLCVLKijIhW22f6R5ng2ixvJGg6Q+fUheJX42G+gXZyCdzPWU?=
 =?us-ascii?Q?IstTxJyOapjMCbgDQz2ILyptBHWywdvBj68s1tco6pIdARBGopUFVs285e63?=
 =?us-ascii?Q?Ex9RTqT1o+7Rv8IBzpD0j/IEqZIBECRmfg6VAZg6O40DiS2h3wAHUYECzYPo?=
 =?us-ascii?Q?rUcaznaK++y+dSkzD4AlRYiNgreapc2mwdy3KDb6saXbplFnmvtScyB8UR2i?=
 =?us-ascii?Q?6HMlgeLv2KvNiJ0lDAbKfZo2XU89IWoG+sOQ1y0lghubZvnoVP4iJ3MeBlE0?=
 =?us-ascii?Q?22XnuK5bFfuMcwjYmHPWMsCtTVajY5bbNHw3c6ALohl5A1WAYwKBDzOCv6m3?=
 =?us-ascii?Q?CUmJ1m+M3igUOqSWL87maruaLeN7EKs/Bb90XYWQYf4V2UloGff58TFRGoFE?=
 =?us-ascii?Q?45YVFvWoFbwuKmtrOGwNiTWp+jJWyoCnZbDtwH0Qncs6Lbl9afq1liAUP8Uo?=
 =?us-ascii?Q?fod24GM3iIoVx82W1hedxUJGCZPNZQOO7zAo5ZhmdeNYdirZHDmX65Bo9WsJ?=
 =?us-ascii?Q?ZcsRvTYgSd6XzK3l6BzXRgeug8aTUgBMUp6q+d7AiZ5+4zJwkbb1/u5AIOUO?=
 =?us-ascii?Q?42egr1kqFWo0PBiksj+KoD0nqmQsTmYw5g4OyGgdAF9x/hLUoWnTlLPncmc1?=
 =?us-ascii?Q?+PCHgW2OR1Q6VOcMIsVOReBHvSsZCHv5RS5XQEQ32wpiCiefhdaI+lmH7AXX?=
 =?us-ascii?Q?9PwAhxHpl20bLUKisL6A2euz93yurisVgrTjm9qEkVZ5NZIyoi+7FOsYLcd+?=
x-ms-exchange-antispam-messagedata-1: ujPFipS+iFzkXw==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5157.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c8e7bf3-4e0b-429e-a774-08da1d517f3f
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2022 13:28:28.9687 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: twWqoZn+VVRnafJbKjf/S4fLi/Oo7I30GtJjfaJbHoIH3HBwlFl8MRb5nLa1GdPj7C3WOq5cVz1ux2Xd1noe8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3355
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
Cc: kernel test robot <lkp@intel.com>, Dave Airlie <airlied@linux.ie>, "Gong,
 Richard" <Richard.Gong@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig, 
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Public]

=20
> On Wed, Apr 13, 2022 at 3:43 AM Paul Menzel <pmenzel@molgen.mpg.de>
> wrote:
> >
> > Dear Richard,
> >
> >
> > Thank you for sending out v4.
> >
> > Am 12.04.22 um 23:50 schrieb Richard Gong:
> > > Active State Power Management (ASPM) feature is enabled since kernel
> 5.14.
> > > There are some AMD GFX cards (such as WX3200 and RX640) that won't
> work
> > > with ASPM-enabled Intel Alder Lake based systems. Using these GFX
> cards as
> > > video/display output, Intel Alder Lake based systems will hang during
> > > suspend/resume.
> >
> > I am still not clear, what "hang during suspend/resume" means. I guess
> > suspending works fine? During resume (S3 or S0ix?), where does it hang?
> > The system is functional, but there are only display problems?

I believe Intel would need to identify the state of the SOC to determine wh=
ere
the PCIE problem actually occurs; on the way down or up.

As he said in the commit message it results in a hang.

> >
> > > The issue was initially reported on one system (Dell Precision 3660 w=
ith
> > > BIOS version 0.14.81), but was later confirmed to affect at least 4 A=
lder
> > > Lake based systems.
> > >
> > > Add extra check to disable ASPM on Intel Alder Lake based systems.
> > >
> > > Fixes: 0064b0ce85bb ("drm/amd/pm: enable ASPM by default")
> > > Link:
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgitla
> b.freedesktop.org%2Fdrm%2Famd%2F-
> %2Fissues%2F1885&amp;data=3D04%7C01%7Cmario.limonciello%40amd.com%
> 7Cfe4b6b553c3b47c1288f08da1d4da9c8%7C3dd8961fe4884e608e11a82d994e
> 183d%7C0%7C0%7C637854516675116782%7CUnknown%7CTWFpbGZsb3d8ey
> JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%
> 7C3000&amp;sdata=3DgvFmP1HQP%2FyzLfT0gYYCupAQBIG%2FtiDYelQNqTLAx
> ck%3D&amp;reserved=3D0
> > > Reported-by: kernel test robot <lkp@intel.com>
> >
> > This tag is a little confusing. Maybe clarify that it was for an issue
> > in a previous patch iteration?
> >
> > > Signed-off-by: Richard Gong <richard.gong@amd.com>
> > > ---
> > > v4: s/CONFIG_X86_64/CONFIG_X86
> > >      enhanced check logic
> > > v3: s/intel_core_asom_chk/aspm_support_quirk_check
> > >      correct build error with W=3D1 option
> > > v2: correct commit description
> > >      move the check from chip family to problematic platform
> > > ---
> > >   drivers/gpu/drm/amd/amdgpu/vi.c | 17 ++++++++++++++++-
> > >   1 file changed, 16 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/vi.c
> b/drivers/gpu/drm/amd/amdgpu/vi.c
> > > index 039b90cdc3bc..b33e0a9bee65 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/vi.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/vi.c
> > > @@ -81,6 +81,10 @@
> > >   #include "mxgpu_vi.h"
> > >   #include "amdgpu_dm.h"
> > >
> > > +#if IS_ENABLED(CONFIG_X86)
> > > +#include <asm/intel-family.h>
> > > +#endif
> > > +
> > >   #define ixPCIE_LC_L1_PM_SUBSTATE    0x100100C6
> > >   #define
> PCIE_LC_L1_PM_SUBSTATE__LC_L1_SUBSTATES_OVERRIDE_EN_MASK
> 0x00000001L
> > >   #define
> PCIE_LC_L1_PM_SUBSTATE__LC_PCI_PM_L1_2_OVERRIDE_MASK
> 0x00000002L
> > > @@ -1134,13 +1138,24 @@ static void vi_enable_aspm(struct
> amdgpu_device *adev)
> > >               WREG32_PCIE(ixPCIE_LC_CNTL, data);
> > >   }
> > >
> > > +static bool aspm_support_quirk_check(void)
> > > +{
> > > +     if (IS_ENABLED(CONFIG_X86)) {
> > > +             struct cpuinfo_x86 *c =3D &cpu_data(0);
> > > +
> > > +             return !(c->x86 =3D=3D 6 && c->x86_model =3D=3D
> INTEL_FAM6_ALDERLAKE);

Don't you need to check x86_vendor?  Although extremely unlikely if you don=
't
check x86_vendor nothing to stop another X86 manufacturer from having a
design that has same model # as INTEL_FAM6_ALDERLAKE.

> > > +     }
> > > +
> > > +     return true;
> > > +}
> > > +
> > >   static void vi_program_aspm(struct amdgpu_device *adev)
> > >   {
> > >       u32 data, data1, orig;
> > >       bool bL1SS =3D false;
> > >       bool bClkReqSupport =3D true;
> > >
> > > -     if (!amdgpu_device_should_use_aspm(adev))
> > > +     if (!amdgpu_device_should_use_aspm(adev) ||
> !aspm_support_quirk_check())
> > >               return;
> >
> > Can users still forcefully enable ASPM with the parameter `amdgpu.aspm`=
?

amdgpu.aspm is module wide not just for one card.  That is it covers all AM=
D GPU cards
in the system.  If it's set to 1 or pcie_aspm_enabled returns true it will =
enable for other
GPUs besides these.

There is the possibility to move this quirk check within " amdgpu_device_sh=
ould_use_aspm"
and only match this combination when set to amdgpu.aspm is set to "-1" (the=
 default), something
like this:

--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -1335,6 +1335,8 @@ bool amdgpu_device_should_use_aspm(struct amdgpu_devi=
ce *adev)
        default:
                return false;
        }
+       if (amdgpu_device_is_quirked_for_aspm(adev))
+               return false;
        return pcie_aspm_enabled(adev->pdev);
 }


> >
> > >
> > >       if (adev->flags & AMD_IS_APU ||
> >
> > If I remember correctly, there were also newer cards, where ASPM worked
> > with Intel Alder Lake, right? Can only the problematic generations for
> > WX3200 and RX640 be excluded from ASPM?
>=20
> This patch only disables it for the generation that was problematic.
>=20
> Alex
>=20
> >
> >
> > Kind regards,
> >
> > Paul

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD5B78A489
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 04:15:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6093110E078;
	Mon, 28 Aug 2023 02:15:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2056.outbound.protection.outlook.com [40.107.243.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4622510E078;
 Mon, 28 Aug 2023 02:14:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YzCTAj1R9Ju4qYNqbKGi6XJR0rohXV+0b/XDAAlR3/tN43vGJQ/m0qk6nXlIIISTM9KNDfJgqQKcUawkeIAjs08PaW93ctpJFqBGzj+68+wlpr6a6CAaX1zhYagkPu6ib9k/ifywKqF9UkO+u4IMcXcoqtOdwDKKLXfNnDoFmMrnEoaULQQrJQFY80PGFgcttvf/BqoQbVTMfcRkqyNuGmRcX/hQLONfgrvCjByRTfNBcLgrjxPY+IZUtt7mASip54HCvTEPy7S6HyPuvsp98nlXbSXefcFbb3HBnpZ+QcQjRh3ZBi7tmwpi5VCMm0YCu/tLT9oDKpwac7yGbNZGaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s9Naiw/BDXnru/w38Q5SrWUrTRTHwQYrspdNf0YyTF8=;
 b=R+NaGpRF6r1BnqP5pk9TapEJyoPTfQDMPiy76RGTxkPj869oBjEjhMgwvR4xbW1hERqvrf2ngusyN60Shh3sJjgN/JDO9uKXq9i38X+qJWA5dJDLWs+q2K65Khr4Pnp2iBZ4mC0N/nVn1cd4xIzG38u+1V6RB1JIIIOF1413b7idHFPfIC5nyR9F+oIp1VFFfFISydlg32yYUP6VIEtGUtqdn8LGJz1WzMuZ5+EINvYr6cACiFi480y4ZlTN6oMN7U+ymb8Wy7rKcnYUr+XCg0Tjg/H8F8/ktugZ0kNt7wT6eXaCXhHmzdM8YeM5/8sNmeSEZi8F1hk9JMHCyJ1PaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s9Naiw/BDXnru/w38Q5SrWUrTRTHwQYrspdNf0YyTF8=;
 b=3sNraYaCJtnnJVHc9az85732LXe7uKhjSOcrqUcCPhuEH6T7kxIjnvSBrot+oRPbpOH9/fiMn0qblElp06+cK/DuX6yIe8O8N7TvNuMsbm7x6XSELbiuP/46AnQqxXCQ17vtn6/xfMVooJcecf40UBi/vm7qYBdxl9Pdr/3rvM4=
Received: from BYAPR12MB4614.namprd12.prod.outlook.com (2603:10b6:a03:a6::22)
 by DS7PR12MB6046.namprd12.prod.outlook.com (2603:10b6:8:85::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Mon, 28 Aug
 2023 02:14:53 +0000
Received: from BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::af11:a0ea:b4e4:d1e0]) by BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::af11:a0ea:b4e4:d1e0%5]) with mapi id 15.20.6699.034; Mon, 28 Aug 2023
 02:14:52 +0000
From: "Lazar, Lijo" <Lijo.Lazar@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, "lenb@kernel.org" <lenb@kernel.org>,
 "johannes@sipsolutions.net" <johannes@sipsolutions.net>,
 "davem@davemloft.net" <davem@davemloft.net>, "edumazet@google.com"
 <edumazet@google.com>, "kuba@kernel.org" <kuba@kernel.org>,
 "pabeni@redhat.com" <pabeni@redhat.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "rafael@kernel.org" <rafael@kernel.org>,
 "Limonciello, Mario" <Mario.Limonciello@amd.com>
Subject: Re: [V10 5/8] drm/amd/pm: setup the framework to support Wifi RFI
 mitigation feature
Thread-Topic: [V10 5/8] drm/amd/pm: setup the framework to support Wifi RFI
 mitigation feature
Thread-Index: AQHZ1y/jOda+KqpmCUeUZE8aDKlj76/7DQeAgAPpmoCAAAWYzQ==
Date: Mon, 28 Aug 2023 02:14:52 +0000
Message-ID: <BYAPR12MB46143BE29D90DD842030176F97E0A@BYAPR12MB4614.namprd12.prod.outlook.com>
References: <20230825083846.4001973-1-evan.quan@amd.com>
 <20230825083846.4001973-6-evan.quan@amd.com>
 <a45c6e51-0dbf-af27-1723-fb1477e6155d@amd.com>
 <DM6PR12MB2619813D48392AF01BB5EA42E4E0A@DM6PR12MB2619.namprd12.prod.outlook.com>
In-Reply-To: <DM6PR12MB2619813D48392AF01BB5EA42E4E0A@DM6PR12MB2619.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=True;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-08-28T01:50:00.0000000Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4614:EE_|DS7PR12MB6046:EE_
x-ms-office365-filtering-correlation-id: d00bbdb7-93d6-4ebb-7895-08dba76c9073
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qLisEQ4tb7Tkj2+FmKbaFJyJvL6d5cESnGFUzvbeBjvrTnT9/UgvTTI1SDY/3ik3pj3Hpc4wnFDn+YN1Bp45MUQPc6KYW7kSsAOLbaJutClHeYjJrCwXAvoo63wfHtA1fxPCpO7JXOFA7iyJEF5SPedd8aG/KvPIhiUuehParQI/9ghlAm8YmmxoBokeBQ2sbeQf82/aFiTFSND+Vx8jcvuDmXPBwbCj7MWlwL+E89sbRcWIEVDfPgu5zeGtzbTiKQv7XIcTejhqzwi5+SmmcTP++o2n9C116r/uyf1Sc9wFo3dXZ83bx4j2HXOq/6hlgp51GNWTpme3ajtgrbScLeMITyuQH/oV6gSTetBnv38K13zTV6yAwuzIH8I2JQMz112kKd8kN5TNiQBSgtbG/rtCJPJ0y71JbEiKmsx/FMHPDE0/olxRR506PHoTuUly94Dcv8f6fUfeoQOyXQzNGnj7l1fAkKfl42gKoqTvNbbDTnnFq8t9+NhVKzH3kABanHzsXuZNhJdfZm7OCNjyOSC7C+uWwAWdW723PEXK//mrpx9zl3W7nPosbvQ8HOFjPhCwpBEiFnLsRzYYznZbPByydKiEiXEBk15sosDNhBVgYQgnthJLSvJlbY/GafU9ynjo77EC9Yf4nCs9U5R2vx9ccNbMNzA4NsjUA28SUmk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB4614.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(136003)(366004)(396003)(376002)(186009)(1800799009)(451199024)(55016003)(71200400001)(53546011)(6506007)(7696005)(9686003)(110136005)(52536014)(7416002)(2906002)(33656002)(30864003)(86362001)(5660300002)(6636002)(4326008)(38070700005)(54906003)(8676002)(8936002)(66946007)(66556008)(66446008)(64756008)(66476007)(41300700001)(76116006)(316002)(38100700002)(122000001)(921005)(478600001)(83380400001)(26005)(309714004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?TsjuqgdXwthvx0b0LGiDibZ8mTkFuHub5KsYA0xGOHET4eghzV1bnCbn?=
 =?Windows-1252?Q?gtGRf5EpUH/7LVSpVq+YFlReMFRBJ79kLEnuVvT/7xHL4m8u2vLMnxTs?=
 =?Windows-1252?Q?+apy6cPyCCR11jdnqan6REndrb35sY+76848XksnwXVgDrWYsZUcYfiv?=
 =?Windows-1252?Q?lph8bjyfQiSYrFcr29qvotiWCvH3NImsYuklCdvZY0Ml3Zrto6aKTrts?=
 =?Windows-1252?Q?DYE5UIWuAPx/ywtLfErlDu7g7Vh+rgtOZCMdv5NmjqEseFZno2xQ6mvM?=
 =?Windows-1252?Q?74haIqVyZlob0Ppart//3JJ0Ez38mc7Dnc5+JH8e0l6+PjbQ+YDIwHaU?=
 =?Windows-1252?Q?xgHe55QmsC7utDCiGzMMGLTgk+mbcyK0uhYwjhp41qRjwE0KHjZU4gNe?=
 =?Windows-1252?Q?fR8JUm5R2nbLpHSbIuEs2y99GfJ+QIX43rg+Z81+jBhtbJQd1QlY3XPH?=
 =?Windows-1252?Q?l8kMLx7V2By3DwjQTWNxZl9D8+wiz7M+PoRCc/lC01ht2wFKFlolLmGV?=
 =?Windows-1252?Q?FA7veTqDh9zgL4hNzNln+EblDMsOJTn/bko9fTyniz0ShqrSs/U9LEvH?=
 =?Windows-1252?Q?okfjnJvh5xPxbw8Tw4MO9y15paagDT4pZurSrGREJyAV15bWyAmB4ITa?=
 =?Windows-1252?Q?MrXEaugRwuZFNW/RlzYNzvfWAcMslWD1Tt0Y1v9p9+G8Y6JJNXMeszS3?=
 =?Windows-1252?Q?aJd3iNi0aLAUbKkUkTXGYDSgdKnhsnpnDGss6gIOxYdNnbZu6wg6y3uf?=
 =?Windows-1252?Q?r2oHeNO5KqmyBJPcNJfpdPtlncihiFD4uu9kHDTo26QSCPCm8TOw3aje?=
 =?Windows-1252?Q?xD+eZH61wH2cnVgjCrrAmh/l3aZkiSYJwLtuf/OdkrI5zlKcG2ftFN+K?=
 =?Windows-1252?Q?Lp3LwCAaRk7p2FIKUsebonvzQJhCWCZVWE7a3guC2DRZDI1POZQiB2Td?=
 =?Windows-1252?Q?gA8VDuZi4rcY+B63LgFTrsXJ1xEL8YKwMjSSGUTW3UFx3OUDbFWH/6Rs?=
 =?Windows-1252?Q?x2Kj+7WoqMNrnb9My/uofGH0sevoyfu3+emC9q6J8FkXPhZE/Av4NdyY?=
 =?Windows-1252?Q?RT0wMLLL3p3it/eIhqOzuNtzfpEgZR+ks+ucZ1T/0BD8l5vQLfw/eTE1?=
 =?Windows-1252?Q?VmYRBFLMR5fEJJ9d/LqnEQK8D9++pp5T44ZwR6yRvd5OsL2riUrwE8xB?=
 =?Windows-1252?Q?n5nXEpsmsSUlrWAdF86XEuyq9X8dspo9cp7byXH3P1UBhmYaQvi0oJGx?=
 =?Windows-1252?Q?WrPzVBoCSlFwfIFk5Kq5FKCkILJpjs8D4O5N1qUA0VBQjq30ZwxO+RYq?=
 =?Windows-1252?Q?kYa9wkyxM3AeKqspViyM5SiLKe+rxneqWlF3kaPDsM3sR3EaWj+Zez10?=
 =?Windows-1252?Q?oRqIBq6BhzCWx1rV+DccItCA72QFuujMVkeEUOe1nsDrvqq8XneHr99O?=
 =?Windows-1252?Q?k/NikdHnvuqqxQJSVRQcDaicamwrwUCmKO+pxYsoIeydg5lpfrzCBxrH?=
 =?Windows-1252?Q?frf5aO5cToSKdCypgDPJo+gyZQDW9PKcTqtkowfqMTu3g/h/UBo9jSgM?=
 =?Windows-1252?Q?vv71HDQIOpNhqInBVAZ4DJQYI9Csw9BxEkk5EfuKfBQi8KYMg+gGubGW?=
 =?Windows-1252?Q?bV1rv6KjedCUKynoYtwR00Y6TJcyui8NTM58MPfL3UhabRAmpRmzK6gT?=
 =?Windows-1252?Q?UezaeUVETFICv7TV/T5sPDnHoA0FIGez?=
Content-Type: multipart/alternative;
 boundary="_000_BYAPR12MB46143BE29D90DD842030176F97E0ABYAPR12MB4614namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4614.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d00bbdb7-93d6-4ebb-7895-08dba76c9073
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2023 02:14:52.4519 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g/J1yXsG2J6krdn9azhaCMUG95HA39QnD+ovWdEUnJ2FjVJ4QRgEkBwcqxTLiHQO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6046
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
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_BYAPR12MB46143BE29D90DD842030176F97E0ABYAPR12MB4614namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - General]

> 'j' was initially set as 'num_of_wbrf_ranges - 1'. So, I suppose 'num_of_=
wbrf_ranges' should be set as 'j' instead of 'j - 1'. Right?

Yes.

Thanks,
Lijo
________________________________
From: Quan, Evan <Evan.Quan@amd.com>
Sent: Monday, August 28, 2023 7:23:55 AM
To: Lazar, Lijo <Lijo.Lazar@amd.com>; lenb@kernel.org <lenb@kernel.org>; jo=
hannes@sipsolutions.net <johannes@sipsolutions.net>; davem@davemloft.net <d=
avem@davemloft.net>; edumazet@google.com <edumazet@google.com>; kuba@kernel=
.org <kuba@kernel.org>; pabeni@redhat.com <pabeni@redhat.com>; Deucher, Ale=
xander <Alexander.Deucher@amd.com>; rafael@kernel.org <rafael@kernel.org>; =
Limonciello, Mario <Mario.Limonciello@amd.com>
Cc: linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>; linux-acpi=
@vger.kernel.org <linux-acpi@vger.kernel.org>; amd-gfx@lists.freedesktop.or=
g <amd-gfx@lists.freedesktop.org>; dri-devel@lists.freedesktop.org <dri-dev=
el@lists.freedesktop.org>; linux-wireless@vger.kernel.org <linux-wireless@v=
ger.kernel.org>; netdev@vger.kernel.org <netdev@vger.kernel.org>
Subject: RE: [V10 5/8] drm/amd/pm: setup the framework to support Wifi RFI =
mitigation feature

[AMD Official Use Only - General]

> -----Original Message-----
> From: Lazar, Lijo <Lijo.Lazar@amd.com>
> Sent: Friday, August 25, 2023 10:09 PM
> To: Quan, Evan <Evan.Quan@amd.com>; lenb@kernel.org;
> johannes@sipsolutions.net; davem@davemloft.net; edumazet@google.com;
> kuba@kernel.org; pabeni@redhat.com; Deucher, Alexander
> <Alexander.Deucher@amd.com>; rafael@kernel.org; Limonciello, Mario
> <Mario.Limonciello@amd.com>
> Cc: linux-kernel@vger.kernel.org; linux-acpi@vger.kernel.org; amd-
> gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux-
> wireless@vger.kernel.org; netdev@vger.kernel.org
> Subject: Re: [V10 5/8] drm/amd/pm: setup the framework to support Wifi
> RFI mitigation feature
>
>
>
> On 8/25/2023 2:08 PM, Evan Quan wrote:
> > With WBRF feature supported, as a driver responding to the
> > frequencies, amdgpu driver is able to do shadow pstate switching to
> > mitigate possible interference(between its (G-)DDR memory clocks and
> > local radio module frequency bands used by Wifi 6/6e/7).
> >
> > Signed-off-by: Evan Quan <evan.quan@amd.com>
> > Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> > --
> > v1->v2:
> >    - update the prompt for feature support(Lijo)
> > v8->v9:
> >    - update parameter document for smu_wbrf_event_handler(Simon)
> > v9->v10:
> >   - correct the logics for wbrf range sorting(Lijo)
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu.h           |   2 +
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  17 ++
> >   drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c     | 195
> ++++++++++++++++++
> >   drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h |  23 +++
> >   drivers/gpu/drm/amd/pm/swsmu/smu_internal.h   |   3 +
> >   5 files changed, 240 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> > b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> > index a3b86b86dc47..2bfc9111ab00 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> > @@ -247,6 +247,8 @@ extern int amdgpu_sg_display;
> >
> >   extern int amdgpu_user_partt_mode;
> >
> > +extern int amdgpu_wbrf;
> > +
> >   #define AMDGPU_VM_MAX_NUM_CTX                     4096
> >   #define AMDGPU_SG_THRESHOLD                       (256*1024*1024)
> >   #define AMDGPU_WAIT_IDLE_TIMEOUT_IN_MS            3000
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > index 0593ef8fe0a6..1c574bd3b60d 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > @@ -195,6 +195,7 @@ int amdgpu_use_xgmi_p2p =3D 1;
> >   int amdgpu_vcnfw_log;
> >   int amdgpu_sg_display =3D -1; /* auto */
> >   int amdgpu_user_partt_mode =3D
> AMDGPU_AUTO_COMPUTE_PARTITION_MODE;
> > +int amdgpu_wbrf =3D -1;
> >
> >   static void amdgpu_drv_delayed_reset_work_handler(struct work_struct
> > *work);
> >
> > @@ -981,6 +982,22 @@ module_param_named(user_partt_mode,
> amdgpu_user_partt_mode, uint, 0444);
> >   module_param(enforce_isolation, bool, 0444);
> >   MODULE_PARM_DESC(enforce_isolation, "enforce process isolation
> > between graphics and compute . enforce_isolation =3D on");
> >
> > +/**
> > + * DOC: wbrf (int)
> > + * Enable Wifi RFI interference mitigation feature.
> > + * Due to electrical and mechanical constraints there may be likely
> > +interference of
> > + * relatively high-powered harmonics of the (G-)DDR memory clocks
> > +with local radio
> > + * module frequency bands used by Wifi 6/6e/7. To mitigate the
> > +possible RFI interference,
> > + * with this feature enabled, PMFW will use either =93shadowed P-State=
=94
> > +or =93P-State=94 based
> > + * on active list of frequencies in-use (to be avoided) as part of
> > +initial setting or
> > + * P-state transition. However, there may be potential performance
> > +impact with this
> > + * feature enabled.
> > + * (0 =3D disabled, 1 =3D enabled, -1 =3D auto (default setting, will =
be
> > +enabled if supported))  */ MODULE_PARM_DESC(wbrf,
> > +   "Enable Wifi RFI interference mitigation (0 =3D disabled, 1 =3D ena=
bled,
> > +-1 =3D auto(default)"); module_param_named(wbrf, amdgpu_wbrf, int,
> > +0444);
> > +
> >   /* These devices are not supported by amdgpu.
> >    * They are supported by the mach64, r128, radeon drivers
> >    */
> > diff --git a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
> > b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
> > index ce41a8309582..bdfd234d1558 100644
> > --- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
> > +++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
> > @@ -1228,6 +1228,174 @@ static int
> smu_get_thermal_temperature_range(struct smu_context *smu)
> >     return ret;
> >   }
> >
> > +/**
> > + * smu_wbrf_handle_exclusion_ranges - consume the wbrf exclusion
> > +ranges
> > + *
> > + * @smu: smu_context pointer
> > + *
> > + * Retrieve the wbrf exclusion ranges and send them to PMFW for proper
> handling.
> > + * Returns 0 on success, error on failure.
> > + */
> > +static int smu_wbrf_handle_exclusion_ranges(struct smu_context *smu)
> > +{
> > +   struct wbrf_ranges_in_out wbrf_exclusion =3D {0};
> > +   struct exclusion_range *wifi_bands =3D wbrf_exclusion.band_list;
> > +   struct amdgpu_device *adev =3D smu->adev;
> > +   uint32_t num_of_wbrf_ranges =3D MAX_NUM_OF_WBRF_RANGES;
> > +   uint64_t start, end;
> > +   int ret, i, j;
> > +
> > +   ret =3D acpi_amd_wbrf_retrieve_exclusions(adev->dev,
> &wbrf_exclusion);
> > +   if (ret) {
> > +           dev_err(adev->dev, "Failed to retrieve exclusion ranges!\n"=
);
> > +           return ret;
> > +   }
> > +
> > +   /*
> > +    * The exclusion ranges array we got might be filled with holes and
> duplicate
> > +    * entries. For example:
> > +    * {(2400, 2500), (0, 0), (6882, 6962), (2400, 2500), (0, 0), (6117=
,
> 6189), (0, 0)...}
> > +    * We need to do some sortups to eliminate those holes and duplicat=
e
> entries.
> > +    * Expected output: {(2400, 2500), (6117, 6189), (6882, 6962), (0,
> 0)...}
> > +    */
> > +   for (i =3D 0; i < num_of_wbrf_ranges; i++) {
> > +           start =3D wifi_bands[i].start;
> > +           end =3D wifi_bands[i].end;
> > +
> > +           /* get the last valid entry to fill the intermediate hole *=
/
> > +           if (!start && !end) {
> > +                   for (j =3D num_of_wbrf_ranges - 1; j > i; j--)
> > +                           if (wifi_bands[j].start &&
> > +                               wifi_bands[j].end)
> > +                                   break;
> > +
> > +                   /* no valid entry left */
> > +                   if (j <=3D i)
> > +                           break;
> > +
> > +                   wifi_bands[i].start =3D wifi_bands[j].start;
> > +                   wifi_bands[i].end =3D wifi_bands[j].end;
>
> start/end variables remain 0. Thus it won't have any effect on the loop b=
elow
> which looks for duplicates. start/end need to be reassigned here.
Ah, right. Thanks, I can fix that.
>
> > +                   wifi_bands[j].start =3D 0;
> > +                   wifi_bands[j].end =3D 0;
> > +                   num_of_wbrf_ranges--;
>
> Instead of decrementing by 1, this can be kept equal to j - 1 as jth entr=
y is 0
> now.
'j' was initially set as 'num_of_wbrf_ranges - 1'. So, I suppose 'num_of_wb=
rf_ranges' should be set as 'j' instead of 'j - 1'. Right?

Evan
>
> Thanks,
> Lijo
>
> > +           }
> > +
> > +           /* eliminate duplicate entries */
> > +           for (j =3D i + 1; j < num_of_wbrf_ranges; j++) {
> > +                   if ((wifi_bands[j].start =3D=3D start) &&
> > +                        (wifi_bands[j].end =3D=3D end)) {
> > +                           wifi_bands[j].start =3D 0;
> > +                           wifi_bands[j].end =3D 0;
> > +                   }
> > +           }
> > +   }
> > +
> > +   /* Send the sorted wifi_bands to PMFW */
> > +   ret =3D smu_set_wbrf_exclusion_ranges(smu, wifi_bands);
> > +   /* Give it another chance */
> > +   if (unlikely(ret =3D=3D -EBUSY)) {
> > +           mdelay(5);
> > +           ret =3D smu_set_wbrf_exclusion_ranges(smu, wifi_bands);
> > +   }
> > +
> > +   return ret;
> > +}
> > +
> > +/**
> > + * smu_wbrf_event_handler - handle notify events
> > + *
> > + * @nb: notifier block
> > + * @action: event type
> > + * @_arg: event data
> > + *
> > + * Calls relevant amdgpu function in response to wbrf event
> > + * notification from kernel.
> > + */
> > +static int smu_wbrf_event_handler(struct notifier_block *nb,
> > +                             unsigned long action, void *_arg) {
> > +   struct smu_context *smu =3D container_of(nb, struct smu_context,
> > +                                          wbrf_notifier);
> > +
> > +   switch (action) {
> > +   case WBRF_CHANGED:
> > +           smu_wbrf_handle_exclusion_ranges(smu);
> > +           break;
> > +   default:
> > +           return NOTIFY_DONE;
> > +   };
> > +
> > +   return NOTIFY_OK;
> > +}
> > +
> > +/**
> > + * smu_wbrf_support_check - check wbrf support
> > + *
> > + * @smu: smu_context pointer
> > + *
> > + * Verifies the ACPI interface whether wbrf is supported.
> > + */
> > +static void smu_wbrf_support_check(struct smu_context *smu) {
> > +   struct amdgpu_device *adev =3D smu->adev;
> > +
> > +   smu->wbrf_supported =3D smu_is_asic_wbrf_supported(smu) &&
> > +                         !!amdgpu_wbrf &&
> > +                         acpi_amd_wbrf_supported_consumer(adev->dev);
> > +
> > +   if (smu->wbrf_supported)
> > +           dev_info(adev->dev, "RF interference mitigation is
> supported\n"); }
> > +
> > +/**
> > + * smu_wbrf_init - init driver wbrf support
> > + *
> > + * @smu: smu_context pointer
> > + *
> > + * Verifies the AMD ACPI interfaces and registers with the wbrf
> > + * notifier chain if wbrf feature is supported.
> > + * Returns 0 on success, error on failure.
> > + */
> > +static int smu_wbrf_init(struct smu_context *smu) {
> > +   struct amdgpu_device *adev =3D smu->adev;
> > +   int ret;
> > +
> > +   if (!smu->wbrf_supported)
> > +           return 0;
> > +
> > +   smu->wbrf_notifier.notifier_call =3D smu_wbrf_event_handler;
> > +   ret =3D acpi_amd_wbrf_register_notifier(&smu->wbrf_notifier);
> > +   if (ret)
> > +           return ret;
> > +
> > +   /*
> > +    * Some wifiband exclusion ranges may be already there
> > +    * before our driver loaded. To make sure our driver
> > +    * is awared of those exclusion ranges.
> > +    */
> > +   ret =3D smu_wbrf_handle_exclusion_ranges(smu);
> > +   if (ret)
> > +           dev_err(adev->dev, "Failed to handle wbrf exclusion
> ranges\n");
> > +
> > +   return ret;
> > +}
> > +
> > +/**
> > + * smu_wbrf_fini - tear down driver wbrf support
> > + *
> > + * @smu: smu_context pointer
> > + *
> > + * Unregisters with the wbrf notifier chain.
> > + */
> > +static void smu_wbrf_fini(struct smu_context *smu) {
> > +   if (!smu->wbrf_supported)
> > +           return;
> > +
> > +   acpi_amd_wbrf_unregister_notifier(&smu->wbrf_notifier);
> > +}
> > +
> >   static int smu_smc_hw_setup(struct smu_context *smu)
> >   {
> >     struct smu_feature *feature =3D &smu->smu_feature; @@ -1320,6
> > +1488,15 @@ static int smu_smc_hw_setup(struct smu_context *smu)
> >     if (ret)
> >             return ret;
> >
> > +   /* Enable UclkShadow on wbrf supported */
> > +   if (smu->wbrf_supported) {
> > +           ret =3D smu_enable_uclk_shadow(smu, true);
> > +           if (ret) {
> > +                   dev_err(adev->dev, "Failed to enable UclkShadow
> feature to support wbrf!\n");
> > +                   return ret;
> > +           }
> > +   }
> > +
> >     /*
> >      * With SCPM enabled, these actions(and relevant messages) are
> >      * not needed and permitted.
> > @@ -1416,6 +1593,15 @@ static int smu_smc_hw_setup(struct
> smu_context *smu)
> >      */
> >     ret =3D smu_set_min_dcef_deep_sleep(smu,
> >                                       smu->smu_table.boot_values.dcefcl=
k
> / 100);
> > +   if (ret) {
> > +           dev_err(adev->dev, "Error setting min deepsleep dcefclk\n")=
;
> > +           return ret;
> > +   }
> > +
> > +   /* Init wbrf support. Properly setup the notifier */
> > +   ret =3D smu_wbrf_init(smu);
> > +   if (ret)
> > +           dev_err(adev->dev, "Error during wbrf init call\n");
> >
> >     return ret;
> >   }
> > @@ -1471,6 +1657,13 @@ static int smu_hw_init(void *handle)
> >             return ret;
> >     }
> >
> > +   /*
> > +    * Check whether wbrf is supported. This needs to be done
> > +    * before SMU setup starts since part of SMU configuration
> > +    * relies on this.
> > +    */
> > +   smu_wbrf_support_check(smu);
> > +
> >     if (smu->is_apu) {
> >             ret =3D smu_set_gfx_imu_enable(smu);
> >             if (ret)
> > @@ -1623,6 +1816,8 @@ static int smu_smc_hw_cleanup(struct
> smu_context *smu)
> >     struct amdgpu_device *adev =3D smu->adev;
> >     int ret =3D 0;
> >
> > +   smu_wbrf_fini(smu);
> > +
> >     cancel_work_sync(&smu->throttling_logging_work);
> >     cancel_work_sync(&smu->interrupt_work);
> >
> > diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
> > b/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
> > index 6e2069dcb6b9..3eb1c72a76f1 100644
> > --- a/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
> > +++ b/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
> > @@ -22,6 +22,8 @@
> >   #ifndef __AMDGPU_SMU_H__
> >   #define __AMDGPU_SMU_H__
> >
> > +#include <linux/acpi_amd_wbrf.h>
> > +
> >   #include "amdgpu.h"
> >   #include "kgd_pp_interface.h"
> >   #include "dm_pp_interface.h"
> > @@ -575,6 +577,10 @@ struct smu_context
> >     u32 debug_resp_reg;
> >
> >     struct delayed_work             swctf_delayed_work;
> > +
> > +   /* data structures for wbrf feature support */
> > +   bool                            wbrf_supported;
> > +   struct notifier_block           wbrf_notifier;
> >   };
> >
> >   struct i2c_adapter;
> > @@ -1356,6 +1362,23 @@ struct pptable_funcs {
> >      * @init_pptable_microcode: Prepare the pptable microcode to upload
> via PSP
> >      */
> >     int (*init_pptable_microcode)(struct smu_context *smu);
> > +
> > +   /**
> > +    * @is_asic_wbrf_supported: check whether PMFW supports the wbrf
> feature
> > +    */
> > +   bool (*is_asic_wbrf_supported)(struct smu_context *smu);
> > +
> > +   /**
> > +    * @enable_uclk_shadow: Enable the uclk shadow feature on wbrf
> supported
> > +    */
> > +   int (*enable_uclk_shadow)(struct smu_context *smu,
> > +                             bool enablement);
> > +
> > +   /**
> > +    * @set_wbrf_exclusion_ranges: notify SMU the wifi bands occupied
> > +    */
> > +   int (*set_wbrf_exclusion_ranges)(struct smu_context *smu,
> > +                                    struct exclusion_range
> *exclusion_ranges);
> >   };
> >
> >   typedef enum {
> > diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu_internal.h
> > b/drivers/gpu/drm/amd/pm/swsmu/smu_internal.h
> > index ceb13c838067..67d7495ab49e 100644
> > --- a/drivers/gpu/drm/amd/pm/swsmu/smu_internal.h
> > +++ b/drivers/gpu/drm/amd/pm/swsmu/smu_internal.h
> > @@ -97,6 +97,9 @@
> >   #define smu_get_default_config_table_settings(smu, config_table)
>       smu_ppt_funcs(get_default_config_table_settings, -EOPNOTSUPP,
> smu, config_table)
> >   #define smu_set_config_table(smu, config_table)
>       smu_ppt_funcs(set_config_table, -EOPNOTSUPP, smu, config_table)
> >   #define smu_init_pptable_microcode(smu)
>       smu_ppt_funcs(init_pptable_microcode, 0, smu)
> > +#define smu_is_asic_wbrf_supported(smu)
>       smu_ppt_funcs(is_asic_wbrf_supported, false, smu)
> > +#define smu_enable_uclk_shadow(smu, enablement)
>               smu_ppt_funcs(enable_uclk_shadow, 0, smu, enablement)
> > +#define smu_set_wbrf_exclusion_ranges(smu, exclusion_ranges)
>       smu_ppt_funcs(set_wbrf_exclusion_ranges, -EOPNOTSUPP, smu,
> exclusion_ranges)
> >
> >   #endif
> >   #endif

--_000_BYAPR12MB46143BE29D90DD842030176F97E0ABYAPR12MB4614namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
</head>
<body>
<p style=3D"font-family:Arial;font-size:10pt;color:#0000FF;margin:5pt;font-=
style:normal;font-weight:normal;text-decoration:none;" align=3D"Left">
[AMD Official Use Only - General]<br>
</p>
<br>
<div>
<div dir=3D"auto">&gt;&nbsp;<span style=3D"font-family: &quot;Times New Rom=
an&quot;; font-size: 14.6667px; display: inline !important; color: rgb(0, 0=
, 0); background-color: rgb(255, 255, 255);">'j' was initially set as 'num_=
of_wbrf_ranges - 1'. So, I suppose 'num_of_wbrf_ranges'
 should be set as 'j' instead of 'j - 1'. Right?</span></div>
<div dir=3D"auto"><span style=3D"font-family: &quot;Times New Roman&quot;; =
font-size: 14.6667px; display: inline !important; color: rgb(0, 0, 0); back=
ground-color: rgb(255, 255, 255);"><br>
</span></div>
<div dir=3D"auto"><span style=3D"font-family: &quot;Times New Roman&quot;; =
font-size: 14.6667px; display: inline !important; color: rgb(0, 0, 0); back=
ground-color: rgb(255, 255, 255);">Yes.</span></div>
<div id=3D"ms-outlook-mobile-signature" dir=3D"auto">
<div><br>
</div>
Thanks,<br>
Lijo</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Quan, Evan &lt;Evan.Q=
uan@amd.com&gt;<br>
<b>Sent:</b> Monday, August 28, 2023 7:23:55 AM<br>
<b>To:</b> Lazar, Lijo &lt;Lijo.Lazar@amd.com&gt;; lenb@kernel.org &lt;lenb=
@kernel.org&gt;; johannes@sipsolutions.net &lt;johannes@sipsolutions.net&gt=
;; davem@davemloft.net &lt;davem@davemloft.net&gt;; edumazet@google.com &lt=
;edumazet@google.com&gt;; kuba@kernel.org &lt;kuba@kernel.org&gt;; pabeni@r=
edhat.com
 &lt;pabeni@redhat.com&gt;; Deucher, Alexander &lt;Alexander.Deucher@amd.co=
m&gt;; rafael@kernel.org &lt;rafael@kernel.org&gt;; Limonciello, Mario &lt;=
Mario.Limonciello@amd.com&gt;<br>
<b>Cc:</b> linux-kernel@vger.kernel.org &lt;linux-kernel@vger.kernel.org&gt=
;; linux-acpi@vger.kernel.org &lt;linux-acpi@vger.kernel.org&gt;; amd-gfx@l=
ists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&gt;; dri-devel@lists=
.freedesktop.org &lt;dri-devel@lists.freedesktop.org&gt;;
 linux-wireless@vger.kernel.org &lt;linux-wireless@vger.kernel.org&gt;; net=
dev@vger.kernel.org &lt;netdev@vger.kernel.org&gt;<br>
<b>Subject:</b> RE: [V10 5/8] drm/amd/pm: setup the framework to support Wi=
fi RFI mitigation feature</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font face=3D"Times New Roman" size=3D"3"><span=
 style=3D"font-size:12pt;"><a name=3D"BM_BEGIN"></a>
<div><font size=3D"2"><span style=3D"font-size:11pt;">[AMD Official Use Onl=
y - General]<br>
<br>
&gt; -----Original Message-----<br>
&gt; From: Lazar, Lijo &lt;Lijo.Lazar@amd.com&gt;<br>
&gt; Sent: Friday, August 25, 2023 10:09 PM<br>
&gt; To: Quan, Evan &lt;Evan.Quan@amd.com&gt;; lenb@kernel.org;<br>
&gt; johannes@sipsolutions.net; davem@davemloft.net; edumazet@google.com;<b=
r>
&gt; kuba@kernel.org; pabeni@redhat.com; Deucher, Alexander<br>
&gt; &lt;Alexander.Deucher@amd.com&gt;; rafael@kernel.org; Limonciello, Mar=
io<br>
&gt; &lt;Mario.Limonciello@amd.com&gt;<br>
&gt; Cc: linux-kernel@vger.kernel.org; linux-acpi@vger.kernel.org; amd-<br>
&gt; gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux-<br>
&gt; wireless@vger.kernel.org; netdev@vger.kernel.org<br>
&gt; Subject: Re: [V10 5/8] drm/amd/pm: setup the framework to support Wifi=
<br>
&gt; RFI mitigation feature<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On 8/25/2023 2:08 PM, Evan Quan wrote:<br>
&gt; &gt; With WBRF feature supported, as a driver responding to the<br>
&gt; &gt; frequencies, amdgpu driver is able to do shadow pstate switching =
to<br>
&gt; &gt; mitigate possible interference(between its (G-)DDR memory clocks =
and<br>
&gt; &gt; local radio module frequency bands used by Wifi 6/6e/7).<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Evan Quan &lt;evan.quan@amd.com&gt;<br>
&gt; &gt; Reviewed-by: Mario Limonciello &lt;mario.limonciello@amd.com&gt;<=
br>
&gt; &gt; --<br>
&gt; &gt; v1-&gt;v2:<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; - update the prompt for feature support(Lijo)<b=
r>
&gt; &gt; v8-&gt;v9:<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; - update parameter document for smu_wbrf_event_=
handler(Simon)<br>
&gt; &gt; v9-&gt;v10:<br>
&gt; &gt;&nbsp;&nbsp; - correct the logics for wbrf range sorting(Lijo)<br>
&gt; &gt; ---<br>
&gt; &gt;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu.h&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 2 +<br>
&gt; &gt;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; |&nbsp; 17 ++<br>
&gt; &gt;&nbsp;&nbsp; drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c&nbsp;&nbsp;=
&nbsp;&nbsp; | 195<br>
&gt; ++++++++++++++++++<br>
&gt; &gt;&nbsp;&nbsp; drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h |&nbsp;=
 23 +++<br>
&gt; &gt;&nbsp;&nbsp; drivers/gpu/drm/amd/pm/swsmu/smu_internal.h&nbsp;&nbs=
p; |&nbsp;&nbsp; 3 +<br>
&gt; &gt;&nbsp;&nbsp; 5 files changed, 240 insertions(+)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h<br>
&gt; &gt; b/drivers/gpu/drm/amd/amdgpu/amdgpu.h<br>
&gt; &gt; index a3b86b86dc47..2bfc9111ab00 100644<br>
&gt; &gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h<br>
&gt; &gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h<br>
&gt; &gt; @@ -247,6 +247,8 @@ extern int amdgpu_sg_display;<br>
&gt; &gt;<br>
&gt; &gt;&nbsp;&nbsp; extern int amdgpu_user_partt_mode;<br>
&gt; &gt;<br>
&gt; &gt; +extern int amdgpu_wbrf;<br>
&gt; &gt; +<br>
&gt; &gt;&nbsp;&nbsp; #define AMDGPU_VM_MAX_NUM_CTX&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; 4096<br>
&gt; &gt;&nbsp;&nbsp; #define AMDGPU_SG_THRESHOLD&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (256*1024*1024)<br>
&gt; &gt;&nbsp;&nbsp; #define AMDGPU_WAIT_IDLE_TIMEOUT_IN_MS&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3000<br>
&gt; &gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c<br>
&gt; &gt; b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c<br>
&gt; &gt; index 0593ef8fe0a6..1c574bd3b60d 100644<br>
&gt; &gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c<br>
&gt; &gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c<br>
&gt; &gt; @@ -195,6 +195,7 @@ int amdgpu_use_xgmi_p2p =3D 1;<br>
&gt; &gt;&nbsp;&nbsp; int amdgpu_vcnfw_log;<br>
&gt; &gt;&nbsp;&nbsp; int amdgpu_sg_display =3D -1; /* auto */<br>
&gt; &gt;&nbsp;&nbsp; int amdgpu_user_partt_mode =3D<br>
&gt; AMDGPU_AUTO_COMPUTE_PARTITION_MODE;<br>
&gt; &gt; +int amdgpu_wbrf =3D -1;<br>
&gt; &gt;<br>
&gt; &gt;&nbsp;&nbsp; static void amdgpu_drv_delayed_reset_work_handler(str=
uct work_struct<br>
&gt; &gt; *work);<br>
&gt; &gt;<br>
&gt; &gt; @@ -981,6 +982,22 @@ module_param_named(user_partt_mode,<br>
&gt; amdgpu_user_partt_mode, uint, 0444);<br>
&gt; &gt;&nbsp;&nbsp; module_param(enforce_isolation, bool, 0444);<br>
&gt; &gt;&nbsp;&nbsp; MODULE_PARM_DESC(enforce_isolation, &quot;enforce pro=
cess isolation<br>
&gt; &gt; between graphics and compute . enforce_isolation =3D on&quot;);<b=
r>
&gt; &gt;<br>
&gt; &gt; +/**<br>
&gt; &gt; + * DOC: wbrf (int)<br>
&gt; &gt; + * Enable Wifi RFI interference mitigation feature.<br>
&gt; &gt; + * Due to electrical and mechanical constraints there may be lik=
ely<br>
&gt; &gt; +interference of<br>
&gt; &gt; + * relatively high-powered harmonics of the (G-)DDR memory clock=
s<br>
&gt; &gt; +with local radio<br>
&gt; &gt; + * module frequency bands used by Wifi 6/6e/7. To mitigate the<b=
r>
&gt; &gt; +possible RFI interference,<br>
&gt; &gt; + * with this feature enabled, PMFW will use either =93shadowed P=
-State=94<br>
&gt; &gt; +or =93P-State=94 based<br>
&gt; &gt; + * on active list of frequencies in-use (to be avoided) as part =
of<br>
&gt; &gt; +initial setting or<br>
&gt; &gt; + * P-state transition. However, there may be potential performan=
ce<br>
&gt; &gt; +impact with this<br>
&gt; &gt; + * feature enabled.<br>
&gt; &gt; + * (0 =3D disabled, 1 =3D enabled, -1 =3D auto (default setting,=
 will be<br>
&gt; &gt; +enabled if supported))&nbsp; */ MODULE_PARM_DESC(wbrf,<br>
&gt; &gt; +&nbsp;&nbsp; &quot;Enable Wifi RFI interference mitigation (0 =
=3D disabled, 1 =3D enabled,<br>
&gt; &gt; +-1 =3D auto(default)&quot;); module_param_named(wbrf, amdgpu_wbr=
f, int,<br>
&gt; &gt; +0444);<br>
&gt; &gt; +<br>
&gt; &gt;&nbsp;&nbsp; /* These devices are not supported by amdgpu.<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; * They are supported by the mach64, r128, radeo=
n drivers<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; */<br>
&gt; &gt; diff --git a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c<br>
&gt; &gt; b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c<br>
&gt; &gt; index ce41a8309582..bdfd234d1558 100644<br>
&gt; &gt; --- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c<br>
&gt; &gt; +++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c<br>
&gt; &gt; @@ -1228,6 +1228,174 @@ static int<br>
&gt; smu_get_thermal_temperature_range(struct smu_context *smu)<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&gt; &gt;&nbsp;&nbsp; }<br>
&gt; &gt;<br>
&gt; &gt; +/**<br>
&gt; &gt; + * smu_wbrf_handle_exclusion_ranges - consume the wbrf exclusion=
<br>
&gt; &gt; +ranges<br>
&gt; &gt; + *<br>
&gt; &gt; + * @smu: smu_context pointer<br>
&gt; &gt; + *<br>
&gt; &gt; + * Retrieve the wbrf exclusion ranges and send them to PMFW for =
proper<br>
&gt; handling.<br>
&gt; &gt; + * Returns 0 on success, error on failure.<br>
&gt; &gt; + */<br>
&gt; &gt; +static int smu_wbrf_handle_exclusion_ranges(struct smu_context *=
smu)<br>
&gt; &gt; +{<br>
&gt; &gt; +&nbsp;&nbsp; struct wbrf_ranges_in_out wbrf_exclusion =3D {0};<b=
r>
&gt; &gt; +&nbsp;&nbsp; struct exclusion_range *wifi_bands =3D wbrf_exclusi=
on.band_list;<br>
&gt; &gt; +&nbsp;&nbsp; struct amdgpu_device *adev =3D smu-&gt;adev;<br>
&gt; &gt; +&nbsp;&nbsp; uint32_t num_of_wbrf_ranges =3D MAX_NUM_OF_WBRF_RAN=
GES;<br>
&gt; &gt; +&nbsp;&nbsp; uint64_t start, end;<br>
&gt; &gt; +&nbsp;&nbsp; int ret, i, j;<br>
&gt; &gt; +<br>
&gt; &gt; +&nbsp;&nbsp; ret =3D acpi_amd_wbrf_retrieve_exclusions(adev-&gt;=
dev,<br>
&gt; &amp;wbrf_exclusion);<br>
&gt; &gt; +&nbsp;&nbsp; if (ret) {<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev=
_err(adev-&gt;dev, &quot;Failed to retrieve exclusion ranges!\n&quot;);<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret=
urn ret;<br>
&gt; &gt; +&nbsp;&nbsp; }<br>
&gt; &gt; +<br>
&gt; &gt; +&nbsp;&nbsp; /*<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp; * The exclusion ranges array we got might be =
filled with holes and<br>
&gt; duplicate<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp; * entries. For example:<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp; * {(2400, 2500), (0, 0), (6882, 6962), (2400,=
 2500), (0, 0), (6117,<br>
&gt; 6189), (0, 0)...}<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp; * We need to do some sortups to eliminate tho=
se holes and duplicate<br>
&gt; entries.<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp; * Expected output: {(2400, 2500), (6117, 6189=
), (6882, 6962), (0,<br>
&gt; 0)...}<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp; */<br>
&gt; &gt; +&nbsp;&nbsp; for (i =3D 0; i &lt; num_of_wbrf_ranges; i++) {<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sta=
rt =3D wifi_bands[i].start;<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; end=
 =3D wifi_bands[i].end;<br>
&gt; &gt; +<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* =
get the last valid entry to fill the intermediate hole */<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if =
(!start &amp;&amp; !end) {<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (j =3D num_of_wbrf_ranges =
- 1; j &gt; i; j--)<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; if (wifi_bands[j].start &amp;&amp;<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; wifi_bands[j].end)<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br=
>
&gt; &gt; +<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* no valid entry left */<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (j &lt;=3D i)<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; break;<br>
&gt; &gt; +<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; wifi_bands[i].start =3D wifi_b=
ands[j].start;<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; wifi_bands[i].end =3D wifi_ban=
ds[j].end;<br>
&gt;<br>
&gt; start/end variables remain 0. Thus it won't have any effect on the loo=
p below<br>
&gt; which looks for duplicates. start/end need to be reassigned here.<br>
Ah, right. Thanks, I can fix that.<br>
&gt;<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; wifi_bands[j].start =3D 0;<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; wifi_bands[j].end =3D 0;<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; num_of_wbrf_ranges--;<br>
&gt;<br>
&gt; Instead of decrementing by 1, this can be kept equal to j - 1 as jth e=
ntry is 0<br>
&gt; now.<br>
'j' was initially set as 'num_of_wbrf_ranges - 1'. So, I suppose 'num_of_wb=
rf_ranges' should be set as 'j' instead of 'j - 1'. Right?<br>
<br>
Evan<br>
&gt;<br>
&gt; Thanks,<br>
&gt; Lijo<br>
&gt;<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<b=
r>
&gt; &gt; +<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* =
eliminate duplicate entries */<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for=
 (j =3D i + 1; j &lt; num_of_wbrf_ranges; j++) {<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ((wifi_bands[j].start =3D=
=3D start) &amp;&amp;<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
(wifi_bands[j].end =3D=3D end)) {<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; wifi_bands[j].start =3D 0;<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; wifi_bands[j].end =3D 0;<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<b=
r>
&gt; &gt; +&nbsp;&nbsp; }<br>
&gt; &gt; +<br>
&gt; &gt; +&nbsp;&nbsp; /* Send the sorted wifi_bands to PMFW */<br>
&gt; &gt; +&nbsp;&nbsp; ret =3D smu_set_wbrf_exclusion_ranges(smu, wifi_ban=
ds);<br>
&gt; &gt; +&nbsp;&nbsp; /* Give it another chance */<br>
&gt; &gt; +&nbsp;&nbsp; if (unlikely(ret =3D=3D -EBUSY)) {<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mde=
lay(5);<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret=
 =3D smu_set_wbrf_exclusion_ranges(smu, wifi_bands);<br>
&gt; &gt; +&nbsp;&nbsp; }<br>
&gt; &gt; +<br>
&gt; &gt; +&nbsp;&nbsp; return ret;<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +/**<br>
&gt; &gt; + * smu_wbrf_event_handler - handle notify events<br>
&gt; &gt; + *<br>
&gt; &gt; + * @nb: notifier block<br>
&gt; &gt; + * @action: event type<br>
&gt; &gt; + * @_arg: event data<br>
&gt; &gt; + *<br>
&gt; &gt; + * Calls relevant amdgpu function in response to wbrf event<br>
&gt; &gt; + * notification from kernel.<br>
&gt; &gt; + */<br>
&gt; &gt; +static int smu_wbrf_event_handler(struct notifier_block *nb,<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned long action, void *_arg) {<br>
&gt; &gt; +&nbsp;&nbsp; struct smu_context *smu =3D container_of(nb, struct=
 smu_context,<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; wbrf_notifier);<br>
&gt; &gt; +<br>
&gt; &gt; +&nbsp;&nbsp; switch (action) {<br>
&gt; &gt; +&nbsp;&nbsp; case WBRF_CHANGED:<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smu=
_wbrf_handle_exclusion_ranges(smu);<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bre=
ak;<br>
&gt; &gt; +&nbsp;&nbsp; default:<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret=
urn NOTIFY_DONE;<br>
&gt; &gt; +&nbsp;&nbsp; };<br>
&gt; &gt; +<br>
&gt; &gt; +&nbsp;&nbsp; return NOTIFY_OK;<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +/**<br>
&gt; &gt; + * smu_wbrf_support_check - check wbrf support<br>
&gt; &gt; + *<br>
&gt; &gt; + * @smu: smu_context pointer<br>
&gt; &gt; + *<br>
&gt; &gt; + * Verifies the ACPI interface whether wbrf is supported.<br>
&gt; &gt; + */<br>
&gt; &gt; +static void smu_wbrf_support_check(struct smu_context *smu) {<br=
>
&gt; &gt; +&nbsp;&nbsp; struct amdgpu_device *adev =3D smu-&gt;adev;<br>
&gt; &gt; +<br>
&gt; &gt; +&nbsp;&nbsp; smu-&gt;wbrf_supported =3D smu_is_asic_wbrf_support=
ed(smu) &amp;&amp;<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; !!amdgpu_wbrf &amp;&amp;<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; acpi_amd_wbrf_supported_consumer(adev-&gt;dev);<br>
&gt; &gt; +<br>
&gt; &gt; +&nbsp;&nbsp; if (smu-&gt;wbrf_supported)<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev=
_info(adev-&gt;dev, &quot;RF interference mitigation is<br>
&gt; supported\n&quot;); }<br>
&gt; &gt; +<br>
&gt; &gt; +/**<br>
&gt; &gt; + * smu_wbrf_init - init driver wbrf support<br>
&gt; &gt; + *<br>
&gt; &gt; + * @smu: smu_context pointer<br>
&gt; &gt; + *<br>
&gt; &gt; + * Verifies the AMD ACPI interfaces and registers with the wbrf<=
br>
&gt; &gt; + * notifier chain if wbrf feature is supported.<br>
&gt; &gt; + * Returns 0 on success, error on failure.<br>
&gt; &gt; + */<br>
&gt; &gt; +static int smu_wbrf_init(struct smu_context *smu) {<br>
&gt; &gt; +&nbsp;&nbsp; struct amdgpu_device *adev =3D smu-&gt;adev;<br>
&gt; &gt; +&nbsp;&nbsp; int ret;<br>
&gt; &gt; +<br>
&gt; &gt; +&nbsp;&nbsp; if (!smu-&gt;wbrf_supported)<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret=
urn 0;<br>
&gt; &gt; +<br>
&gt; &gt; +&nbsp;&nbsp; smu-&gt;wbrf_notifier.notifier_call =3D smu_wbrf_ev=
ent_handler;<br>
&gt; &gt; +&nbsp;&nbsp; ret =3D acpi_amd_wbrf_register_notifier(&amp;smu-&g=
t;wbrf_notifier);<br>
&gt; &gt; +&nbsp;&nbsp; if (ret)<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret=
urn ret;<br>
&gt; &gt; +<br>
&gt; &gt; +&nbsp;&nbsp; /*<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp; * Some wifiband exclusion ranges may be alrea=
dy there<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp; * before our driver loaded. To make sure our =
driver<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp; * is awared of those exclusion ranges.<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp; */<br>
&gt; &gt; +&nbsp;&nbsp; ret =3D smu_wbrf_handle_exclusion_ranges(smu);<br>
&gt; &gt; +&nbsp;&nbsp; if (ret)<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev=
_err(adev-&gt;dev, &quot;Failed to handle wbrf exclusion<br>
&gt; ranges\n&quot;);<br>
&gt; &gt; +<br>
&gt; &gt; +&nbsp;&nbsp; return ret;<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +/**<br>
&gt; &gt; + * smu_wbrf_fini - tear down driver wbrf support<br>
&gt; &gt; + *<br>
&gt; &gt; + * @smu: smu_context pointer<br>
&gt; &gt; + *<br>
&gt; &gt; + * Unregisters with the wbrf notifier chain.<br>
&gt; &gt; + */<br>
&gt; &gt; +static void smu_wbrf_fini(struct smu_context *smu) {<br>
&gt; &gt; +&nbsp;&nbsp; if (!smu-&gt;wbrf_supported)<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret=
urn;<br>
&gt; &gt; +<br>
&gt; &gt; +&nbsp;&nbsp; acpi_amd_wbrf_unregister_notifier(&amp;smu-&gt;wbrf=
_notifier);<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt;&nbsp;&nbsp; static int smu_smc_hw_setup(struct smu_context *smu)<=
br>
&gt; &gt;&nbsp;&nbsp; {<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; struct smu_feature *feature =3D &amp;smu-=
&gt;smu_feature; @@ -1320,6<br>
&gt; &gt; +1488,15 @@ static int smu_smc_hw_setup(struct smu_context *smu)<=
br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; return ret;<br>
&gt; &gt;<br>
&gt; &gt; +&nbsp;&nbsp; /* Enable UclkShadow on wbrf supported */<br>
&gt; &gt; +&nbsp;&nbsp; if (smu-&gt;wbrf_supported) {<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret=
 =3D smu_enable_uclk_shadow(smu, true);<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if =
(ret) {<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_err(adev-&gt;dev, &quot;Fa=
iled to enable UclkShadow<br>
&gt; feature to support wbrf!\n&quot;);<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<b=
r>
&gt; &gt; +&nbsp;&nbsp; }<br>
&gt; &gt; +<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * With SCPM enabled, these actions(=
and relevant messages) are<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * not needed and permitted.<br>
&gt; &gt; @@ -1416,6 +1593,15 @@ static int smu_smc_hw_setup(struct<br>
&gt; smu_context *smu)<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D smu_set_min_dcef_deep_sleep(smu,<=
br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; smu-&gt;smu_table.boot_values.dcefclk<br>
&gt; / 100);<br>
&gt; &gt; +&nbsp;&nbsp; if (ret) {<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev=
_err(adev-&gt;dev, &quot;Error setting min deepsleep dcefclk\n&quot;);<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret=
urn ret;<br>
&gt; &gt; +&nbsp;&nbsp; }<br>
&gt; &gt; +<br>
&gt; &gt; +&nbsp;&nbsp; /* Init wbrf support. Properly setup the notifier *=
/<br>
&gt; &gt; +&nbsp;&nbsp; ret =3D smu_wbrf_init(smu);<br>
&gt; &gt; +&nbsp;&nbsp; if (ret)<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev=
_err(adev-&gt;dev, &quot;Error during wbrf init call\n&quot;);<br>
&gt; &gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&gt; &gt;&nbsp;&nbsp; }<br>
&gt; &gt; @@ -1471,6 +1657,13 @@ static int smu_hw_init(void *handle)<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; return ret;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &gt;<br>
&gt; &gt; +&nbsp;&nbsp; /*<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp; * Check whether wbrf is supported. This needs=
 to be done<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp; * before SMU setup starts since part of SMU c=
onfiguration<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp; * relies on this.<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp; */<br>
&gt; &gt; +&nbsp;&nbsp; smu_wbrf_support_check(smu);<br>
&gt; &gt; +<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; if (smu-&gt;is_apu) {<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; ret =3D smu_set_gfx_imu_enable(smu);<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; if (ret)<br>
&gt; &gt; @@ -1623,6 +1816,8 @@ static int smu_smc_hw_cleanup(struct<br>
&gt; smu_context *smu)<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_device *adev =3D smu-&gt;ad=
ev;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; int ret =3D 0;<br>
&gt; &gt;<br>
&gt; &gt; +&nbsp;&nbsp; smu_wbrf_fini(smu);<br>
&gt; &gt; +<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; cancel_work_sync(&amp;smu-&gt;throttling_=
logging_work);<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; cancel_work_sync(&amp;smu-&gt;interrupt_w=
ork);<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h<br>
&gt; &gt; b/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h<br>
&gt; &gt; index 6e2069dcb6b9..3eb1c72a76f1 100644<br>
&gt; &gt; --- a/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h<br>
&gt; &gt; +++ b/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h<br>
&gt; &gt; @@ -22,6 +22,8 @@<br>
&gt; &gt;&nbsp;&nbsp; #ifndef __AMDGPU_SMU_H__<br>
&gt; &gt;&nbsp;&nbsp; #define __AMDGPU_SMU_H__<br>
&gt; &gt;<br>
&gt; &gt; +#include &lt;linux/acpi_amd_wbrf.h&gt;<br>
&gt; &gt; +<br>
&gt; &gt;&nbsp;&nbsp; #include &quot;amdgpu.h&quot;<br>
&gt; &gt;&nbsp;&nbsp; #include &quot;kgd_pp_interface.h&quot;<br>
&gt; &gt;&nbsp;&nbsp; #include &quot;dm_pp_interface.h&quot;<br>
&gt; &gt; @@ -575,6 +577,10 @@ struct smu_context<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; u32 debug_resp_reg;<br>
&gt; &gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; struct delayed_work&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; swctf_delayed_work;<br>
&gt; &gt; +<br>
&gt; &gt; +&nbsp;&nbsp; /* data structures for wbrf feature support */<br>
&gt; &gt; +&nbsp;&nbsp; bool&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; wbrf_supported;<br>
&gt; &gt; +&nbsp;&nbsp; struct notifier_block&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; wbrf_notifier;<br>
&gt; &gt;&nbsp;&nbsp; };<br>
&gt; &gt;<br>
&gt; &gt;&nbsp;&nbsp; struct i2c_adapter;<br>
&gt; &gt; @@ -1356,6 +1362,23 @@ struct pptable_funcs {<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * @init_pptable_microcode: Prepare =
the pptable microcode to upload<br>
&gt; via PSP<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; int (*init_pptable_microcode)(struct smu_=
context *smu);<br>
&gt; &gt; +<br>
&gt; &gt; +&nbsp;&nbsp; /**<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp; * @is_asic_wbrf_supported: check whether PMFW=
 supports the wbrf<br>
&gt; feature<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp; */<br>
&gt; &gt; +&nbsp;&nbsp; bool (*is_asic_wbrf_supported)(struct smu_context *=
smu);<br>
&gt; &gt; +<br>
&gt; &gt; +&nbsp;&nbsp; /**<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp; * @enable_uclk_shadow: Enable the uclk shadow=
 feature on wbrf<br>
&gt; supported<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp; */<br>
&gt; &gt; +&nbsp;&nbsp; int (*enable_uclk_shadow)(struct smu_context *smu,<=
br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool enablement);<br>
&gt; &gt; +<br>
&gt; &gt; +&nbsp;&nbsp; /**<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp; * @set_wbrf_exclusion_ranges: notify SMU the =
wifi bands occupied<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp; */<br>
&gt; &gt; +&nbsp;&nbsp; int (*set_wbrf_exclusion_ranges)(struct smu_context=
 *smu,<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; str=
uct exclusion_range<br>
&gt; *exclusion_ranges);<br>
&gt; &gt;&nbsp;&nbsp; };<br>
&gt; &gt;<br>
&gt; &gt;&nbsp;&nbsp; typedef enum {<br>
&gt; &gt; diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu_internal.h<br>
&gt; &gt; b/drivers/gpu/drm/amd/pm/swsmu/smu_internal.h<br>
&gt; &gt; index ceb13c838067..67d7495ab49e 100644<br>
&gt; &gt; --- a/drivers/gpu/drm/amd/pm/swsmu/smu_internal.h<br>
&gt; &gt; +++ b/drivers/gpu/drm/amd/pm/swsmu/smu_internal.h<br>
&gt; &gt; @@ -97,6 +97,9 @@<br>
&gt; &gt;&nbsp;&nbsp; #define smu_get_default_config_table_settings(smu, co=
nfig_table)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smu_ppt_funcs(get_default_config_t=
able_settings, -EOPNOTSUPP,<br>
&gt; smu, config_table)<br>
&gt; &gt;&nbsp;&nbsp; #define smu_set_config_table(smu, config_table)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smu_ppt_funcs(set_config_table, -E=
OPNOTSUPP, smu, config_table)<br>
&gt; &gt;&nbsp;&nbsp; #define smu_init_pptable_microcode(smu)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smu_ppt_funcs(init_pptable_microco=
de, 0, smu)<br>
&gt; &gt; +#define smu_is_asic_wbrf_supported(smu)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smu_ppt_funcs(is_asic_wbrf_support=
ed, false, smu)<br>
&gt; &gt; +#define smu_enable_uclk_shadow(smu, enablement)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; smu_ppt_funcs(enable_uclk_shadow, 0, smu, enablement)<br>
&gt; &gt; +#define smu_set_wbrf_exclusion_ranges(smu, exclusion_ranges)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smu_ppt_funcs(set_wbrf_exclusion_r=
anges, -EOPNOTSUPP, smu,<br>
&gt; exclusion_ranges)<br>
&gt; &gt;<br>
&gt; &gt;&nbsp;&nbsp; #endif<br>
&gt; &gt;&nbsp;&nbsp; #endif<br>
</span></font></div>
</span></font></div>
</div>
</body>
</html>

--_000_BYAPR12MB46143BE29D90DD842030176F97E0ABYAPR12MB4614namp_--

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B876CC6F6
	for <lists+dri-devel@lfdr.de>; Tue, 28 Mar 2023 17:46:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3921488284;
	Tue, 28 Mar 2023 15:45:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2064.outbound.protection.outlook.com [40.107.243.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFF4810E6A0;
 Tue, 28 Mar 2023 15:45:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kP6wN2FRwlk8ajTgO661a2LNykARhPuG7QCiGZvpLRdMjaJOvhWOJew54JCOoGFLIR9qYtS00/z38ozWOJHHLdsqw6pxclEkiTrC7PwG9CYKduZUxgGIFwAfLonoGWot0+qxG9FcZ4F0XVmQZch9WgdXrm3W8oSx+94W6a0G8qLsOfgK1SyQ8kqru6lR4Sa+NCXetTt4RHKsEuse6vSPYNw74J0iuMmft63ZJJdYKocYcef2l5kB6bIEP8nJ7rZuQ5xy8rEE4t1vxyechWuu5XMAWa7w64BqEYTYq1GxEWgdly0mLTB97J4M2o/tBvu24OGz+vVtwCWKyUB8FdYNkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FdAbPHZqe+d8J9bJ2Ph/bI2uhu7myqJqb/Nhwh3eBF8=;
 b=GwQFd2z+EnYg0Q4adqDb5vJZ4ZnxVFGn4mOnb5+xB978Mc38vQhQOUzLjWBaEXHLA3YRk1r33iLkG6CgdFQ+TPFaArhf75D5/NAGZGWo+gLreFdudgbGtbY9Od7vKhCUlHHslQAoHO/WxYsD8b8XgEztQPncdEqqCxm6rSgzAOrKIlug+y9nDDxkKGZeM6nclRdih+qvnOu4nSixCKMexj22d7mb3yFpJEEspeFYQAf9m9JxqtfyQe1DHF2yug8HpQ7dqMxBLy5MHLrHirnSehmOlUnmcL4C5bGBeIFBor8UtZLDo1v+24uD88U/yRtQtBnDaHoRgWbr1CKRoDzAHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FdAbPHZqe+d8J9bJ2Ph/bI2uhu7myqJqb/Nhwh3eBF8=;
 b=qJeQxy7OcFuY/2vW8gV0RpXOHF7n4Ny/XYyKaGiqoqJmW0n/WBmxIeVENsbolYoFbF7+hXa1NwARaIAiG9irTeKGUzLtwNdGmo1Qj2HRjjM6eLnHsXiI5ExM7byAOKvr4/tfiE1qmCbfgZvX47w/wnGdTEs6SsjhygmGWX+70sY=
Received: from CY8PR12MB7435.namprd12.prod.outlook.com (2603:10b6:930:51::6)
 by CH0PR12MB5313.namprd12.prod.outlook.com (2603:10b6:610:d4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Tue, 28 Mar
 2023 15:45:48 +0000
Received: from CY8PR12MB7435.namprd12.prod.outlook.com
 ([fe80::37b:ac1c:6025:63da]) by CY8PR12MB7435.namprd12.prod.outlook.com
 ([fe80::37b:ac1c:6025:63da%3]) with mapi id 15.20.6222.031; Tue, 28 Mar 2023
 15:45:48 +0000
From: "Kim, Jonathan" <Jonathan.Kim@amd.com>
To: "Russell, Kent" <Kent.Russell@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 12/34] drm/amdgpu: add configurable grace period for unmap
 queues
Thread-Topic: [PATCH 12/34] drm/amdgpu: add configurable grace period for
 unmap queues
Thread-Index: AQHZYNwXTzO100DN1EyZLwjBFQbFOa8QT54AgAAHNqA=
Date: Tue, 28 Mar 2023 15:45:48 +0000
Message-ID: <CY8PR12MB7435E34C7AD0382931244DD785889@CY8PR12MB7435.namprd12.prod.outlook.com>
References: <20230327184339.125016-1-jonathan.kim@amd.com>
 <20230327184339.125016-12-jonathan.kim@amd.com>
 <DM5PR12MB13086F42DA34557B6497CA9285889@DM5PR12MB1308.namprd12.prod.outlook.com>
In-Reply-To: <DM5PR12MB13086F42DA34557B6497CA9285889@DM5PR12MB1308.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=5b88e0ce-db57-4302-a35f-304c946a8658;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP
 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2023-03-28T15:45:19Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7435:EE_|CH0PR12MB5313:EE_
x-ms-office365-filtering-correlation-id: 3f81b23f-865a-4fc8-92fe-08db2fa38092
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: c43bv8vDW7kjL6t3S79NkKCRuRTRFh6bwJMYQ78WUCaeUs8/P6kzwqzb6UnTOKcUFfN11dvn3uod2jwIVlEIhnaROwJwQqco9POCw2lMjUs6ymmO+AoQrJC09La9xMPZZXAJfluD4FGO4WqpqaRrjjlAB4CxvCHf2wbjKq9o82BHfWaIw0nBne68QhwEUj7RqMpG36THIVgHd2AyhZFURPsMUEUFMItr98C12DMpLQdGaNMrhoxr48BqdDLQZv9uG8fp9wno2Kn46gDQO5g4ie5OxHdHMGlSLS+m1gOO/A1FXltG3IiIjYXjSpr7MOIUZAhv8tDvu7kF81cjB0Iz7KEb5C7eCBCRoGNApewg8YwsZRNwIAfss9IpTrpohsP8naR5e1sEU3p0pWrah1FTOb632emfogr3BdzZDWwfg8cOhW1T+uTcfiXbOcpbKouBIKM3D7QH+fRQJESf+d+GFf9j5j1SQhVnxkB5xUcFg06cMRISrka/yd8WSzz3nKvUz5TaMCAMcr5gIpNdUWdO9GmvPgJd0NOrMRTJuHrZKI7YoHTiCyYgzKlHlgRMlLSNizFDNxBCwYAd7odf73xRHlMC5Ryi9XFwwf5ET+7sxLG30UCIobR6v277yV6tvxNb
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR12MB7435.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(346002)(376002)(39860400002)(136003)(366004)(451199021)(316002)(8936002)(30864003)(41300700001)(52536014)(4326008)(64756008)(66476007)(76116006)(450100002)(66556008)(8676002)(5660300002)(66946007)(2906002)(66446008)(71200400001)(7696005)(110136005)(478600001)(66899021)(53546011)(26005)(9686003)(186003)(6506007)(38100700002)(83380400001)(38070700005)(86362001)(55016003)(33656002)(122000001)(559001)(579004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?SPPd/ZMVaGJjOZkiYB4IIxrtPHf3TmNkZYLffk/l/nxjk5kNrsKs8qFQGdPj?=
 =?us-ascii?Q?767GZdCZ6tB7DdIzpQ0mCBIaD7VmEx7foIO9HkWjdeKXbTQGkl8ynT9XmFlU?=
 =?us-ascii?Q?NDdZcQQV5HHS6hwmGUQV8QprB7+MKKU8VTdgDKzYO3SFk7xwaY8MSAxFijBG?=
 =?us-ascii?Q?Zl4s1GQZHBuLOhFzxXkfc0ApQ0SQnMZvcYrwddySHUSPHRpBWmqtbrHVqoTA?=
 =?us-ascii?Q?UBF0l1F9hw68vaZxttVEZ02NULw/2rlqFEWZOwTfvnQ04Sbj7pSVR+c+HeaH?=
 =?us-ascii?Q?m4lTCEJjTzhFW4B8FzpF5rAImw210TC4Wy5BQdhLvO+w7Nqp67DLBdBB4VKi?=
 =?us-ascii?Q?S3AvyVNjMaUSxwYWuQnd8JOEfNQ1Zg4hKi7Pk0/fMlcmNOAHXjzaMPnxmcpo?=
 =?us-ascii?Q?SORAipjtxoS+cDtIL8+KPg6PwmNyLOhO8vz8HPTMJEAfwVJG3GGFwsK7J4vT?=
 =?us-ascii?Q?Np7PerEwKBmHQVn5xlwlM4DItwwZ2QodK+JmQpzAmVDogw5Yc+/B9oB+JOSe?=
 =?us-ascii?Q?wio0y/FLowPWdnsAKw87UpDw1LjyiHTYgs0l78irP294KHn6x/WhJr7Rwdwb?=
 =?us-ascii?Q?HxjdctA7CEwv7Wkaq6TW/+zxUm7IJUglc7/ReyzMEgcsIfytrapnvvgjQ7eS?=
 =?us-ascii?Q?XmgGL3bvpymwRjrl9RKyfZj4rRwv3/zrwQjW5iFnFwrA58zdobAyQSjFQ06E?=
 =?us-ascii?Q?VDgBmXu8eCbSvOkiP5f+nG/NDT0ulb9lFj9xAHexQMdTMulwN9N/ygM7A8aw?=
 =?us-ascii?Q?EvV/W7Z2UFBcvRdY1+4/n3FxzAG2p7RVk0fvzhxsfCBbvjz3BLSmPv+o4Lrd?=
 =?us-ascii?Q?2RPAGLqc/ijOvb875G3I2I4ju1V2Q58HEBTSrgLCrGt9okrmGeaWALNudjzD?=
 =?us-ascii?Q?xED3+115ZZ6PvlpZRWJexqwwITVwym9BK/+o34JrkFz463KwrJrr919E3EZe?=
 =?us-ascii?Q?N5kEjilkuLfRHqhciUgiP5hvwRNk7pSF08qV0osHwVkquetrViBzOHmjglI2?=
 =?us-ascii?Q?hZ9XbiP5C8taaRUFs6TEng8EuApLMj8MoLEz8KVx0G5Ok2jsC/3tx0PTcPWe?=
 =?us-ascii?Q?jZP4BezD2RUbZdE7Y5JyEsNf5F+M3DjL0JUF23rzexafNWF7tTgNHJ23B2lp?=
 =?us-ascii?Q?/JL4sXoR2EaMQstdeOs6WgbmIjBGl3lDGfneJqXrpmaYniBg+RSJgGNgxJ9Z?=
 =?us-ascii?Q?AAgtwh3wREuksmF92X4jqzDoFQ3P2N0z5/ZruFjGnn1AKcIdHFR91yvvj0Sy?=
 =?us-ascii?Q?9g5XKKK+gjhY/hkBN9FRnZRJByNVUl55EQ58HzaN8+zWDh8CTb3YiA/dr3Mq?=
 =?us-ascii?Q?f+2z/R9Fq+2ANJqZGbb9CB6Un2Yu9+m57i7bhjDhCBla3fqyJuwTUzxN5Xyz?=
 =?us-ascii?Q?mmHV+rpQfDAFWnQqqaphRMCK1TnWHtEHu0SsidAmQ2Lj6/sjrz7FZJZBuyzA?=
 =?us-ascii?Q?QAjwAvYin87Hdcgtt4JhRRlVaNDFLfOhUYuQzEJbJg4gkwOK1RMO3S25BT23?=
 =?us-ascii?Q?t8R9uaJ5dFefMBmHb2ONYCmlYEXuMFjvIUOYmnruEYibUUt7fNGM3sqMoPgT?=
 =?us-ascii?Q?GlQFn4VuMgWoqkzzmSI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7435.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f81b23f-865a-4fc8-92fe-08db2fa38092
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2023 15:45:48.6036 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tgObMICcZCruC1JKqzw+IaE2a9UtvQRWv79toySnlPc3R4h5RVbxIr/QSlTKLefJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5313
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Public]

Thanks for catch Kent.
I'll fix up the typos with a follow-on.

Jon

> -----Original Message-----
> From: Russell, Kent <Kent.Russell@amd.com>
> Sent: Tuesday, March 28, 2023 11:19 AM
> To: Kim, Jonathan <Jonathan.Kim@amd.com>; amd-gfx@lists.freedesktop.org;
> dri-devel@lists.freedesktop.org
> Cc: Kuehling, Felix <Felix.Kuehling@amd.com>; Kim, Jonathan
> <Jonathan.Kim@amd.com>
> Subject: RE: [PATCH 12/34] drm/amdgpu: add configurable grace period for
> unmap queues
>
> [AMD Official Use Only - General]
>
> 3 tiny grammar/spelling things inline (not critical)
>
>  Kent
>
> > -----Original Message-----
> > From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of
> > Jonathan Kim
> > Sent: Monday, March 27, 2023 2:43 PM
> > To: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> > Cc: Kuehling, Felix <Felix.Kuehling@amd.com>; Kim, Jonathan
> > <Jonathan.Kim@amd.com>
> > Subject: [PATCH 12/34] drm/amdgpu: add configurable grace period for
> unmap
> > queues
> >
> > The HWS schedule allows a grace period for wave completion prior to
> > preemption for better performance by avoiding CWSR on waves that can
> > potentially complete quickly. The debugger, on the other hand, will
> > want to inspect wave status immediately after it actively triggers
> > preemption (a suspend function to be provided).
> >
> > To minimize latency between preemption and debugger wave inspection,
> allow
> > immediate preemption by setting the grace period to 0.
> >
> > Note that setting the preepmtion grace period to 0 will result in an
> > infinite grace period being set due to a CP FW bug so set it to 1 for n=
ow.
> >
> > v2: clarify purpose in the description of this patch
> >
> > Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
> > Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>
> > ---
> >  .../drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c  |  2 +
> >  .../drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c   |  2 +
> >  .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c    | 43 ++++++++++++
> >  .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h    |  6 ++
> >  .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c  |  2 +
> >  .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c | 43 ++++++++++++
> >  .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h |  9 ++-
> >  .../drm/amd/amdkfd/kfd_device_queue_manager.c | 62 +++++++++++++-----
> >  .../drm/amd/amdkfd/kfd_device_queue_manager.h |  2 +
> >  .../gpu/drm/amd/amdkfd/kfd_packet_manager.c   | 32 +++++++++
> >  .../drm/amd/amdkfd/kfd_packet_manager_v9.c    | 39 +++++++++++
> >  .../gpu/drm/amd/amdkfd/kfd_pm4_headers_ai.h   | 65
> +++++++++++++++++++
> >  drivers/gpu/drm/amd/amdkfd/kfd_priv.h         |  5 ++
> >  13 files changed, 291 insertions(+), 21 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c
> > b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c
> > index a6f98141c29c..b811a0985050 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c
> > @@ -82,5 +82,7 @@ const struct kfd2kgd_calls aldebaran_kfd2kgd =3D {
> >     .get_cu_occupancy =3D kgd_gfx_v9_get_cu_occupancy,
> >     .enable_debug_trap =3D kgd_aldebaran_enable_debug_trap,
> >     .disable_debug_trap =3D kgd_aldebaran_disable_debug_trap,
> > +   .get_iq_wait_times =3D kgd_gfx_v9_get_iq_wait_times,
> > +   .build_grace_period_packet_info =3D
> > kgd_gfx_v9_build_grace_period_packet_info,
> >     .program_trap_handler_settings =3D
> > kgd_gfx_v9_program_trap_handler_settings,
> >  };
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
> > b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
> > index d2918e5c0dea..a62bd0068515 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
> > @@ -410,6 +410,8 @@ const struct kfd2kgd_calls arcturus_kfd2kgd =3D {
> >
> >     kgd_gfx_v9_set_vm_context_page_table_base,
> >     .enable_debug_trap =3D kgd_arcturus_enable_debug_trap,
> >     .disable_debug_trap =3D kgd_arcturus_disable_debug_trap,
> > +   .get_iq_wait_times =3D kgd_gfx_v9_get_iq_wait_times,
> > +   .build_grace_period_packet_info =3D
> > kgd_gfx_v9_build_grace_period_packet_info,
> >     .get_cu_occupancy =3D kgd_gfx_v9_get_cu_occupancy,
> >     .program_trap_handler_settings =3D
> > kgd_gfx_v9_program_trap_handler_settings
> >  };
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
> > b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
> > index 969015281510..605387e55d33 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
> > @@ -802,6 +802,47 @@ uint32_t kgd_gfx_v10_disable_debug_trap(struct
> > amdgpu_device *adev,
> >     return 0;
> >  }
> >
> > +/* kgd_gfx_v10_get_iq_wait_times: Returns the mmCP_IQ_WAIT_TIME1/2
> > values
> > + * The values read are:
> > + *     ib_offload_wait_time     -- Wait Count for Indirect Buffer Offl=
oads.
> > + *     atomic_offload_wait_time -- Wait Count for L2 and GDS Atomics
> > Offloads.
> > + *     wrm_offload_wait_time    -- Wait Count for WAIT_REG_MEM Offload=
s.
> > + *     gws_wait_time            -- Wait Count for Global Wave Syncs.
> > + *     que_sleep_wait_time      -- Wait Count for Dequeue Retry.
> > + *     sch_wave_wait_time       -- Wait Count for Scheduling Wave Mess=
age.
> > + *     sem_rearm_wait_time      -- Wait Count for Semaphore re-arm.
> > + *     deq_retry_wait_time      -- Wait Count for Global Wave Syncs.
> > + */
> > +void kgd_gfx_v10_get_iq_wait_times(struct amdgpu_device *adev,
> > +                                   uint32_t *wait_times)
> > +
> > +{
> > +   *wait_times =3D RREG32(SOC15_REG_OFFSET(GC, 0,
> > mmCP_IQ_WAIT_TIME2));
> > +}
> > +
> > +void kgd_gfx_v10_build_grace_period_packet_info(struct amdgpu_device
> > *adev,
> > +                                           uint32_t wait_times,
> > +                                           uint32_t grace_period,
> > +                                           uint32_t *reg_offset,
> > +                                           uint32_t *reg_data)
> > +{
> > +   *reg_data =3D wait_times;
> > +
> > +   /*
> > +    * The CP cannont handle a 0 grace period input and will result in
>
>
> cannont -> cannot
>
> > +    * an infinite grace period being set so set to 1 to prevent this.
>
>
> Maybe throw in a comma after "being set" for clarity
>
> > +    */
> > +   if (grace_period =3D=3D 0)
> > +           grace_period =3D 1;
> > +
> > +   *reg_data =3D REG_SET_FIELD(*reg_data,
> > +                   CP_IQ_WAIT_TIME2,
> > +                   SCH_WAVE,
> > +                   grace_period);
> > +
> > +   *reg_offset =3D SOC15_REG_OFFSET(GC, 0, mmCP_IQ_WAIT_TIME2);
> > +}
> > +
> >  static void program_trap_handler_settings(struct amdgpu_device *adev,
> >             uint32_t vmid, uint64_t tba_addr, uint64_t tma_addr)
> >  {
> > @@ -846,5 +887,7 @@ const struct kfd2kgd_calls gfx_v10_kfd2kgd =3D {
> >     .set_vm_context_page_table_base =3D
> > set_vm_context_page_table_base,
> >     .enable_debug_trap =3D kgd_gfx_v10_enable_debug_trap,
> >     .disable_debug_trap =3D kgd_gfx_v10_disable_debug_trap,
> > +   .get_iq_wait_times =3D kgd_gfx_v10_get_iq_wait_times,
> > +   .build_grace_period_packet_info =3D
> > kgd_gfx_v10_build_grace_period_packet_info,
> >     .program_trap_handler_settings =3D program_trap_handler_settings,
> >  };
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h
> > b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h
> > index 370d6c312981..0abc1e805180 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h
> > @@ -26,3 +26,9 @@ uint32_t kgd_gfx_v10_enable_debug_trap(struct
> > amdgpu_device *adev,
> >  uint32_t kgd_gfx_v10_disable_debug_trap(struct amdgpu_device *adev,
> >                                     bool keep_trap_enabled,
> >                                     uint32_t vmid);
> > +void kgd_gfx_v10_get_iq_wait_times(struct amdgpu_device *adev, uint32_=
t
> > *wait_times);
> > +void kgd_gfx_v10_build_grace_period_packet_info(struct amdgpu_device
> > *adev,
> > +                                          uint32_t wait_times,
> > +                                          uint32_t grace_period,
> > +                                          uint32_t *reg_offset,
> > +                                          uint32_t *reg_data);
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c
> > b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c
> > index 73e3b9ae1fb0..c57f2a6b6e23 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c
> > @@ -670,6 +670,8 @@ const struct kfd2kgd_calls gfx_v10_3_kfd2kgd =3D {
> >     .get_atc_vmid_pasid_mapping_info =3D
> > get_atc_vmid_pasid_mapping_info_v10_3,
> >     .set_vm_context_page_table_base =3D
> > set_vm_context_page_table_base_v10_3,
> >     .program_trap_handler_settings =3D
> > program_trap_handler_settings_v10_3,
> > +   .get_iq_wait_times =3D kgd_gfx_v10_get_iq_wait_times,
> > +   .build_grace_period_packet_info =3D
> > kgd_gfx_v10_build_grace_period_packet_info,
> >     .enable_debug_trap =3D kgd_gfx_v10_enable_debug_trap,
> >     .disable_debug_trap =3D kgd_gfx_v10_disable_debug_trap
> >  };
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
> > b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
> > index e0bd61e16847..f231903bfec3 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
> > @@ -736,6 +736,24 @@ uint32_t kgd_gfx_v9_disable_debug_trap(struct
> > amdgpu_device *adev,
> >     return 0;
> >  }
> >
> > +/* kgd_gfx_v9_get_iq_wait_times: Returns the mmCP_IQ_WAIT_TIME1/2
> > values
> > + * The values read are:
> > + *     ib_offload_wait_time     -- Wait Count for Indirect Buffer Offl=
oads.
> > + *     atomic_offload_wait_time -- Wait Count for L2 and GDS Atomics
> > Offloads.
> > + *     wrm_offload_wait_time    -- Wait Count for WAIT_REG_MEM Offload=
s.
> > + *     gws_wait_time            -- Wait Count for Global Wave Syncs.
> > + *     que_sleep_wait_time      -- Wait Count for Dequeue Retry.
> > + *     sch_wave_wait_time       -- Wait Count for Scheduling Wave Mess=
age.
> > + *     sem_rearm_wait_time      -- Wait Count for Semaphore re-arm.
> > + *     deq_retry_wait_time      -- Wait Count for Global Wave Syncs.
> > + */
> > +void kgd_gfx_v9_get_iq_wait_times(struct amdgpu_device *adev,
> > +                                   uint32_t *wait_times)
> > +
> > +{
> > +   *wait_times =3D RREG32(SOC15_REG_OFFSET(GC, 0,
> > mmCP_IQ_WAIT_TIME2));
> > +}
> > +
> >  void kgd_gfx_v9_set_vm_context_page_table_base(struct amdgpu_device
> > *adev,
> >                     uint32_t vmid, uint64_t page_table_base)
> >  {
> > @@ -920,6 +938,29 @@ void kgd_gfx_v9_get_cu_occupancy(struct
> > amdgpu_device *adev, int pasid,
> >                             adev->gfx.cu_info.max_waves_per_simd;
> >  }
> >
> > +void kgd_gfx_v9_build_grace_period_packet_info(struct amdgpu_device
> > *adev,
> > +           uint32_t wait_times,
> > +           uint32_t grace_period,
> > +           uint32_t *reg_offset,
> > +           uint32_t *reg_data)
> > +{
> > +   *reg_data =3D wait_times;
> > +
> > +   /*
> > +    * The CP cannont handle a 0 grace period input and will result in
> cannont again
>
>  Kent
> > +    * an infinite grace period being set so set to 1 to prevent this.
> > +    */
> > +   if (grace_period =3D=3D 0)
> > +           grace_period =3D 1;
> > +
> > +   *reg_data =3D REG_SET_FIELD(*reg_data,
> > +                   CP_IQ_WAIT_TIME2,
> > +                   SCH_WAVE,
> > +                   grace_period);
> > +
> > +   *reg_offset =3D SOC15_REG_OFFSET(GC, 0, mmCP_IQ_WAIT_TIME2);
> > +}
> > +
> >  void kgd_gfx_v9_program_trap_handler_settings(struct amdgpu_device
> *adev,
> >                          uint32_t vmid, uint64_t tba_addr, uint64_t tma=
_addr)
> >  {
> > @@ -963,6 +1004,8 @@ const struct kfd2kgd_calls gfx_v9_kfd2kgd =3D {
> >     .set_vm_context_page_table_base =3D
> > kgd_gfx_v9_set_vm_context_page_table_base,
> >     .enable_debug_trap =3D kgd_gfx_v9_enable_debug_trap,
> >     .disable_debug_trap =3D kgd_gfx_v9_disable_debug_trap,
> > +   .get_iq_wait_times =3D kgd_gfx_v9_get_iq_wait_times,
> > +   .build_grace_period_packet_info =3D
> > kgd_gfx_v9_build_grace_period_packet_info,
> >     .get_cu_occupancy =3D kgd_gfx_v9_get_cu_occupancy,
> >     .program_trap_handler_settings =3D
> > kgd_gfx_v9_program_trap_handler_settings,
> >  };
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h
> > b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h
> > index d39256162616..c0866497cb5c 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h
> > @@ -20,8 +20,6 @@
> >   * OTHER DEALINGS IN THE SOFTWARE.
> >   */
> >
> > -
> > -
> >  void kgd_gfx_v9_program_sh_mem_settings(struct amdgpu_device *adev,
> > uint32_t vmid,
> >             uint32_t sh_mem_config,
> >             uint32_t sh_mem_ape1_base, uint32_t sh_mem_ape1_limit,
> > @@ -51,7 +49,6 @@ int kgd_gfx_v9_wave_control_execute(struct
> > amdgpu_device *adev,
> >                                     uint32_t sq_cmd);
> >  bool kgd_gfx_v9_get_atc_vmid_pasid_mapping_info(struct amdgpu_device
> > *adev,
> >                                     uint8_t vmid, uint16_t *p_pasid);
> > -
> >  void kgd_gfx_v9_set_vm_context_page_table_base(struct amdgpu_device
> > *adev,
> >                     uint32_t vmid, uint64_t page_table_base);
> >  void kgd_gfx_v9_get_cu_occupancy(struct amdgpu_device *adev, int pasid=
,
> > @@ -67,3 +64,9 @@ uint32_t kgd_gfx_v9_enable_debug_trap(struct
> > amdgpu_device *adev,
> >  uint32_t kgd_gfx_v9_disable_debug_trap(struct amdgpu_device *adev,
> >                                     bool keep_trap_enabled,
> >                                     uint32_t vmid);
> > +void kgd_gfx_v9_get_iq_wait_times(struct amdgpu_device *adev, uint32_t
> > *wait_times);
> > +void kgd_gfx_v9_build_grace_period_packet_info(struct amdgpu_device
> > *adev,
> > +                                          uint32_t wait_times,
> > +                                          uint32_t grace_period,
> > +                                          uint32_t *reg_offset,
> > +                                          uint32_t *reg_data);
> > diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> > b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> > index bf3fe7db76f3..807cad60d21e 100644
> > --- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> > +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> > @@ -46,10 +46,13 @@ static int set_pasid_vmid_mapping(struct
> > device_queue_manager *dqm,
> >
> >  static int execute_queues_cpsch(struct device_queue_manager *dqm,
> >                             enum kfd_unmap_queues_filter filter,
> > -                           uint32_t filter_param);
> > +                           uint32_t filter_param,
> > +                           uint32_t grace_period);
> >  static int unmap_queues_cpsch(struct device_queue_manager *dqm,
> >                             enum kfd_unmap_queues_filter filter,
> > -                           uint32_t filter_param, bool reset);
> > +                           uint32_t filter_param,
> > +                           uint32_t grace_period,
> > +                           bool reset);
> >
> >  static int map_queues_cpsch(struct device_queue_manager *dqm);
> >
> > @@ -839,7 +842,7 @@ static int update_queue(struct device_queue_manager
> > *dqm, struct queue *q,
> >     if (dqm->sched_policy !=3D KFD_SCHED_POLICY_NO_HWS) {
> >             if (!dqm->dev->shared_resources.enable_mes)
> >                     retval =3D unmap_queues_cpsch(dqm,
> > -
> > KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0, false);
> > +
> > KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0,
> > USE_DEFAULT_GRACE_PERIOD, false);
> >             else if (prev_active)
> >                     retval =3D remove_queue_mes(dqm, q, &pdd->qpd);
> >
> > @@ -1015,7 +1018,8 @@ static int evict_process_queues_cpsch(struct
> > device_queue_manager *dqm,
> >             retval =3D execute_queues_cpsch(dqm,
> >                                           qpd->is_debug ?
> >
> > KFD_UNMAP_QUEUES_FILTER_ALL_QUEUES :
> > -
> > KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0);
> > +
> > KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0,
> > +                                         USE_DEFAULT_GRACE_PERIOD);
> >
> >  out:
> >     dqm_unlock(dqm);
> > @@ -1155,8 +1159,7 @@ static int restore_process_queues_cpsch(struct
> > device_queue_manager *dqm,
> >     }
> >     if (!dqm->dev->shared_resources.enable_mes)
> >             retval =3D execute_queues_cpsch(dqm,
> > -
> > KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0);
> > -
> > +
> > KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0,
> > USE_DEFAULT_GRACE_PERIOD);
> >     eviction_duration =3D get_jiffies_64() - pdd->last_evict_timestamp;
> >     atomic64_add(eviction_duration, &pdd->evict_duration_counter);
> >  vm_not_acquired:
> > @@ -1492,6 +1495,9 @@ static int initialize_cpsch(struct
> > device_queue_manager *dqm)
> >
> >     init_sdma_bitmaps(dqm);
> >
> > +   if (dqm->dev->kfd2kgd->get_iq_wait_times)
> > +           dqm->dev->kfd2kgd->get_iq_wait_times(dqm->dev->adev,
> > +                                   &dqm->wait_times);
> >     return 0;
> >  }
> >
> > @@ -1531,7 +1537,7 @@ static int start_cpsch(struct device_queue_manage=
r
> > *dqm)
> >     dqm->is_resetting =3D false;
> >     dqm->sched_running =3D true;
> >     if (!dqm->dev->shared_resources.enable_mes)
> > -           execute_queues_cpsch(dqm,
> > KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0);
> > +           execute_queues_cpsch(dqm,
> > KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0,
> > USE_DEFAULT_GRACE_PERIOD);
> >     dqm_unlock(dqm);
> >
> >     return 0;
> > @@ -1556,7 +1562,7 @@ static int stop_cpsch(struct device_queue_manager
> > *dqm)
> >
> >     if (!dqm->is_hws_hang) {
> >             if (!dqm->dev->shared_resources.enable_mes)
> > -                   unmap_queues_cpsch(dqm,
> > KFD_UNMAP_QUEUES_FILTER_ALL_QUEUES, 0, false);
> > +                   unmap_queues_cpsch(dqm,
> > KFD_UNMAP_QUEUES_FILTER_ALL_QUEUES, 0,
> > USE_DEFAULT_GRACE_PERIOD, false);
> >             else
> >                     remove_all_queues_mes(dqm);
> >     }
> > @@ -1598,7 +1604,8 @@ static int create_kernel_queue_cpsch(struct
> > device_queue_manager *dqm,
> >     list_add(&kq->list, &qpd->priv_queue_list);
> >     increment_queue_count(dqm, qpd, kq->queue);
> >     qpd->is_debug =3D true;
> > -   execute_queues_cpsch(dqm,
> > KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0);
> > +   execute_queues_cpsch(dqm,
> > KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0,
> > +                   USE_DEFAULT_GRACE_PERIOD);
> >     dqm_unlock(dqm);
> >
> >     return 0;
> > @@ -1612,7 +1619,8 @@ static void destroy_kernel_queue_cpsch(struct
> > device_queue_manager *dqm,
> >     list_del(&kq->list);
> >     decrement_queue_count(dqm, qpd, kq->queue);
> >     qpd->is_debug =3D false;
> > -   execute_queues_cpsch(dqm,
> > KFD_UNMAP_QUEUES_FILTER_ALL_QUEUES, 0);
> > +   execute_queues_cpsch(dqm,
> > KFD_UNMAP_QUEUES_FILTER_ALL_QUEUES, 0,
> > +                   USE_DEFAULT_GRACE_PERIOD);
> >     /*
> >      * Unconditionally decrement this counter, regardless of the queue'=
s
> >      * type.
> > @@ -1689,7 +1697,7 @@ static int create_queue_cpsch(struct
> > device_queue_manager *dqm, struct queue *q,
> >
> >             if (!dqm->dev->shared_resources.enable_mes)
> >                     retval =3D execute_queues_cpsch(dqm,
> > -
> >     KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0);
> > +
> >     KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0,
> > USE_DEFAULT_GRACE_PERIOD);
> >             else
> >                     retval =3D add_queue_mes(dqm, q, qpd);
> >             if (retval)
> > @@ -1778,7 +1786,9 @@ static int map_queues_cpsch(struct
> > device_queue_manager *dqm)
> >  /* dqm->lock mutex has to be locked before calling this function */
> >  static int unmap_queues_cpsch(struct device_queue_manager *dqm,
> >                             enum kfd_unmap_queues_filter filter,
> > -                           uint32_t filter_param, bool reset)
> > +                           uint32_t filter_param,
> > +                           uint32_t grace_period,
> > +                           bool reset)
> >  {
> >     int retval =3D 0;
> >     struct mqd_manager *mqd_mgr;
> > @@ -1790,6 +1800,12 @@ static int unmap_queues_cpsch(struct
> > device_queue_manager *dqm,
> >     if (!dqm->active_runlist)
> >             return retval;
> >
> > +   if (grace_period !=3D USE_DEFAULT_GRACE_PERIOD) {
> > +           retval =3D pm_update_grace_period(&dqm->packet_mgr,
> > grace_period);
> > +           if (retval)
> > +                   return retval;
> > +   }
> > +
> >     retval =3D pm_send_unmap_queue(&dqm->packet_mgr, filter,
> > filter_param, reset);
> >     if (retval)
> >             return retval;
> > @@ -1822,6 +1838,13 @@ static int unmap_queues_cpsch(struct
> > device_queue_manager *dqm,
> >             return -ETIME;
> >     }
> >
> > +   /* We need to reset the grace period value for this device */
> > +   if (grace_period !=3D USE_DEFAULT_GRACE_PERIOD) {
> > +           if (pm_update_grace_period(&dqm->packet_mgr,
> > +                                   USE_DEFAULT_GRACE_PERIOD))
> > +                   pr_err("Failed to reset grace period\n");
> > +   }
> > +
> >     pm_release_ib(&dqm->packet_mgr);
> >     dqm->active_runlist =3D false;
> >
> > @@ -1837,7 +1860,7 @@ static int reset_queues_cpsch(struct
> > device_queue_manager *dqm,
> >     dqm_lock(dqm);
> >
> >     retval =3D unmap_queues_cpsch(dqm,
> > KFD_UNMAP_QUEUES_FILTER_BY_PASID,
> > -                   pasid, true);
> > +                   pasid, USE_DEFAULT_GRACE_PERIOD, true);
> >
> >     dqm_unlock(dqm);
> >     return retval;
> > @@ -1846,13 +1869,14 @@ static int reset_queues_cpsch(struct
> > device_queue_manager *dqm,
> >  /* dqm->lock mutex has to be locked before calling this function */
> >  static int execute_queues_cpsch(struct device_queue_manager *dqm,
> >                             enum kfd_unmap_queues_filter filter,
> > -                           uint32_t filter_param)
> > +                           uint32_t filter_param,
> > +                           uint32_t grace_period)
> >  {
> >     int retval;
> >
> >     if (dqm->is_hws_hang)
> >             return -EIO;
> > -   retval =3D unmap_queues_cpsch(dqm, filter, filter_param, false);
> > +   retval =3D unmap_queues_cpsch(dqm, filter, filter_param, grace_peri=
od,
> > false);
> >     if (retval)
> >             return retval;
> >
> > @@ -1910,7 +1934,8 @@ static int destroy_queue_cpsch(struct
> > device_queue_manager *dqm,
> >             if (!dqm->dev->shared_resources.enable_mes) {
> >                     decrement_queue_count(dqm, qpd, q);
> >                     retval =3D execute_queues_cpsch(dqm,
> > -
> > KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0);
> > +
> > KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0,
> > +
> > USE_DEFAULT_GRACE_PERIOD);
> >                     if (retval =3D=3D -ETIME)
> >                             qpd->reset_wavefronts =3D true;
> >             } else {
> > @@ -2195,7 +2220,7 @@ static int process_termination_cpsch(struct
> > device_queue_manager *dqm,
> >     }
> >
> >     if (!dqm->dev->shared_resources.enable_mes)
> > -           retval =3D execute_queues_cpsch(dqm, filter, 0);
> > +           retval =3D execute_queues_cpsch(dqm, filter, 0,
> > USE_DEFAULT_GRACE_PERIOD);
> >
> >     if ((!dqm->is_hws_hang) && (retval || qpd->reset_wavefronts)) {
> >             pr_warn("Resetting wave fronts (cpsch) on dev %p\n", dqm-
> > >dev);
> > @@ -2540,7 +2565,8 @@ int dqm_debugfs_hang_hws(struct
> > device_queue_manager *dqm)
> >             return r;
> >     }
> >     dqm->active_runlist =3D true;
> > -   r =3D execute_queues_cpsch(dqm,
> > KFD_UNMAP_QUEUES_FILTER_ALL_QUEUES, 0);
> > +   r =3D execute_queues_cpsch(dqm,
> > KFD_UNMAP_QUEUES_FILTER_ALL_QUEUES,
> > +                           0, USE_DEFAULT_GRACE_PERIOD);
> >     dqm_unlock(dqm);
> >
> >     return r;
> > diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
> > b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
> > index a537b9ef3e16..fb48b124161f 100644
> > --- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
> > +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
> > @@ -37,6 +37,7 @@
> >
> >  #define KFD_MES_PROCESS_QUANTUM            100000
> >  #define KFD_MES_GANG_QUANTUM               10000
> > +#define USE_DEFAULT_GRACE_PERIOD 0xffffffff
> >
> >  struct device_process_node {
> >     struct qcm_process_device *qpd;
> > @@ -256,6 +257,7 @@ struct device_queue_manager {
> >     struct work_struct      hw_exception_work;
> >     struct kfd_mem_obj      hiq_sdma_mqd;
> >     bool                    sched_running;
> > +   uint32_t                wait_times;
> >  };
> >
> >  void device_queue_manager_init_cik(
> > diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager.c
> > b/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager.c
> > index ed02b6d8bf63..c57f9a46dfcc 100644
> > --- a/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager.c
> > +++ b/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager.c
> > @@ -369,6 +369,38 @@ int pm_send_query_status(struct packet_manager
> > *pm, uint64_t fence_address,
> >     return retval;
> >  }
> >
> > +int pm_update_grace_period(struct packet_manager *pm, uint32_t
> > grace_period)
> > +{
> > +   int retval =3D 0;
> > +   uint32_t *buffer, size;
> > +
> > +   size =3D pm->pmf->set_grace_period_size;
> > +
> > +   mutex_lock(&pm->lock);
> > +
> > +   if (size) {
> > +           kq_acquire_packet_buffer(pm->priv_queue,
> > +                   size / sizeof(uint32_t),
> > +                   (unsigned int **)&buffer);
> > +
> > +           if (!buffer) {
> > +                   pr_err("Failed to allocate buffer on kernel queue\n=
");
> > +                   retval =3D -ENOMEM;
> > +                   goto out;
> > +           }
> > +
> > +           retval =3D pm->pmf->set_grace_period(pm, buffer, grace_peri=
od);
> > +           if (!retval)
> > +                   kq_submit_packet(pm->priv_queue);
> > +           else
> > +                   kq_rollback_packet(pm->priv_queue);
> > +   }
> > +
> > +out:
> > +   mutex_unlock(&pm->lock);
> > +   return retval;
> > +}
> > +
> >  int pm_send_unmap_queue(struct packet_manager *pm,
> >                     enum kfd_unmap_queues_filter filter,
> >                     uint32_t filter_param, bool reset)
> > diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c
> > b/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c
> > index 18250845a989..f0cdc8695b8c 100644
> > --- a/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c
> > +++ b/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c
> > @@ -251,6 +251,41 @@ static int pm_map_queues_v9(struct
> packet_manager
> > *pm, uint32_t *buffer,
> >     return 0;
> >  }
> >
> > +static int pm_set_grace_period_v9(struct packet_manager *pm,
> > +           uint32_t *buffer,
> > +           uint32_t grace_period)
> > +{
> > +   struct pm4_mec_write_data_mmio *packet;
> > +   uint32_t reg_offset =3D 0;
> > +   uint32_t reg_data =3D 0;
> > +
> > +   pm->dqm->dev->kfd2kgd->build_grace_period_packet_info(
> > +                   pm->dqm->dev->adev,
> > +                   pm->dqm->wait_times,
> > +                   grace_period,
> > +                   &reg_offset,
> > +                   &reg_data);
> > +
> > +   if (grace_period =3D=3D USE_DEFAULT_GRACE_PERIOD)
> > +           reg_data =3D pm->dqm->wait_times;
> > +
> > +   packet =3D (struct pm4_mec_write_data_mmio *)buffer;
> > +   memset(buffer, 0, sizeof(struct pm4_mec_write_data_mmio));
> > +
> > +   packet->header.u32All =3D pm_build_pm4_header(IT_WRITE_DATA,
> > +                                   sizeof(struct
> > pm4_mec_write_data_mmio));
> > +
> > +   packet->bitfields2.dst_sel  =3D
> > dst_sel___write_data__mem_mapped_register;
> > +   packet->bitfields2.addr_incr =3D
> > +                   addr_incr___write_data__do_not_increment_address;
> > +
> > +   packet->bitfields3.dst_mmreg_addr =3D reg_offset;
> > +
> > +   packet->data =3D reg_data;
> > +
> > +   return 0;
> > +}
> > +
> >  static int pm_unmap_queues_v9(struct packet_manager *pm, uint32_t
> *buffer,
> >                     enum kfd_unmap_queues_filter filter,
> >                     uint32_t filter_param, bool reset)
> > @@ -333,6 +368,7 @@ const struct packet_manager_funcs kfd_v9_pm_funcs
> =3D
> > {
> >     .set_resources          =3D pm_set_resources_v9,
> >     .map_queues             =3D pm_map_queues_v9,
> >     .unmap_queues           =3D pm_unmap_queues_v9,
> > +   .set_grace_period       =3D pm_set_grace_period_v9,
> >     .query_status           =3D pm_query_status_v9,
> >     .release_mem            =3D NULL,
> >     .map_process_size       =3D sizeof(struct pm4_mes_map_process),
> > @@ -340,6 +376,7 @@ const struct packet_manager_funcs kfd_v9_pm_funcs
> =3D
> > {
> >     .set_resources_size     =3D sizeof(struct pm4_mes_set_resources),
> >     .map_queues_size        =3D sizeof(struct pm4_mes_map_queues),
> >     .unmap_queues_size      =3D sizeof(struct pm4_mes_unmap_queues),
> > +   .set_grace_period_size  =3D sizeof(struct pm4_mec_write_data_mmio),
> >     .query_status_size      =3D sizeof(struct pm4_mes_query_status),
> >     .release_mem_size       =3D 0,
> >  };
> > @@ -350,6 +387,7 @@ const struct packet_manager_funcs
> > kfd_aldebaran_pm_funcs =3D {
> >     .set_resources          =3D pm_set_resources_v9,
> >     .map_queues             =3D pm_map_queues_v9,
> >     .unmap_queues           =3D pm_unmap_queues_v9,
> > +   .set_grace_period       =3D pm_set_grace_period_v9,
> >     .query_status           =3D pm_query_status_v9,
> >     .release_mem            =3D NULL,
> >     .map_process_size       =3D sizeof(struct
> > pm4_mes_map_process_aldebaran),
> > @@ -357,6 +395,7 @@ const struct packet_manager_funcs
> > kfd_aldebaran_pm_funcs =3D {
> >     .set_resources_size     =3D sizeof(struct pm4_mes_set_resources),
> >     .map_queues_size        =3D sizeof(struct pm4_mes_map_queues),
> >     .unmap_queues_size      =3D sizeof(struct pm4_mes_unmap_queues),
> > +   .set_grace_period_size  =3D sizeof(struct pm4_mec_write_data_mmio),
> >     .query_status_size      =3D sizeof(struct pm4_mes_query_status),
> >     .release_mem_size       =3D 0,
> >  };
> > diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_pm4_headers_ai.h
> > b/drivers/gpu/drm/amd/amdkfd/kfd_pm4_headers_ai.h
> > index a666710ed403..795001c947e1 100644
> > --- a/drivers/gpu/drm/amd/amdkfd/kfd_pm4_headers_ai.h
> > +++ b/drivers/gpu/drm/amd/amdkfd/kfd_pm4_headers_ai.h
> > @@ -583,6 +583,71 @@ struct pm4_mec_release_mem {
> >
> >  #endif
> >
> > +#ifndef PM4_MEC_WRITE_DATA_DEFINED
> > +#define PM4_MEC_WRITE_DATA_DEFINED
> > +
> > +enum WRITE_DATA_dst_sel_enum {
> > +   dst_sel___write_data__mem_mapped_register =3D 0,
> > +   dst_sel___write_data__tc_l2 =3D 2,
> > +   dst_sel___write_data__gds =3D 3,
> > +   dst_sel___write_data__memory =3D 5,
> > +   dst_sel___write_data__memory_mapped_adc_persistent_state =3D 6,
> > +};
> > +
> > +enum WRITE_DATA_addr_incr_enum {
> > +   addr_incr___write_data__increment_address =3D 0,
> > +   addr_incr___write_data__do_not_increment_address =3D 1
> > +};
> > +
> > +enum WRITE_DATA_wr_confirm_enum {
> > +   wr_confirm___write_data__do_not_wait_for_write_confirmation =3D 0,
> > +   wr_confirm___write_data__wait_for_write_confirmation =3D 1
> > +};
> > +
> > +enum WRITE_DATA_cache_policy_enum {
> > +   cache_policy___write_data__lru =3D 0,
> > +   cache_policy___write_data__stream =3D 1
> > +};
> > +
> > +
> > +struct pm4_mec_write_data_mmio {
> > +   union {
> > +           union PM4_MES_TYPE_3_HEADER header;     /*header */
> > +           unsigned int ordinal1;
> > +   };
> > +
> > +   union {
> > +           struct {
> > +                   unsigned int reserved1:8;
> > +                   unsigned int dst_sel:4;
> > +                   unsigned int reserved2:4;
> > +                   unsigned int addr_incr:1;
> > +                   unsigned int reserved3:2;
> > +                   unsigned int resume_vf:1;
> > +                   unsigned int wr_confirm:1;
> > +                   unsigned int reserved4:4;
> > +                   unsigned int cache_policy:2;
> > +                   unsigned int reserved5:5;
> > +           } bitfields2;
> > +           unsigned int ordinal2;
> > +   };
> > +
> > +   union {
> > +           struct {
> > +                   unsigned int dst_mmreg_addr:18;
> > +                   unsigned int reserved6:14;
> > +           } bitfields3;
> > +           unsigned int ordinal3;
> > +   };
> > +
> > +   uint32_t reserved7;
> > +
> > +   uint32_t data;
> > +
> > +};
> > +
> > +#endif
> > +
> >  enum {
> >     CACHE_FLUSH_AND_INV_TS_EVENT =3D 0x00000014
> >  };
> > diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> > b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> > index a34b000f1d25..c5f99a471211 100644
> > --- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> > +++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> > @@ -1298,6 +1298,8 @@ struct packet_manager_funcs {
> >     int (*unmap_queues)(struct packet_manager *pm, uint32_t *buffer,
> >                     enum kfd_unmap_queues_filter mode,
> >                     uint32_t filter_param, bool reset);
> > +   int (*set_grace_period)(struct packet_manager *pm, uint32_t *buffer=
,
> > +                   uint32_t grace_period);
> >     int (*query_status)(struct packet_manager *pm, uint32_t *buffer,
> >                     uint64_t fence_address, uint64_t fence_value);
> >     int (*release_mem)(uint64_t gpu_addr, uint32_t *buffer);
> > @@ -1308,6 +1310,7 @@ struct packet_manager_funcs {
> >     int set_resources_size;
> >     int map_queues_size;
> >     int unmap_queues_size;
> > +   int set_grace_period_size;
> >     int query_status_size;
> >     int release_mem_size;
> >  };
> > @@ -1330,6 +1333,8 @@ int pm_send_unmap_queue(struct packet_manager
> > *pm,
> >
> >  void pm_release_ib(struct packet_manager *pm);
> >
> > +int pm_update_grace_period(struct packet_manager *pm, uint32_t
> > grace_period);
> > +
> >  /* Following PM funcs can be shared among VI and AI */
> >  unsigned int pm_build_pm4_header(unsigned int opcode, size_t packet_si=
ze);
> >
> > --
> > 2.25.1

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E5775E9E6
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 04:51:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD7DC10E268;
	Mon, 24 Jul 2023 02:51:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2080.outbound.protection.outlook.com [40.107.220.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6247210E267;
 Mon, 24 Jul 2023 02:51:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LmbXic1d626F174bOB5hJ6vt/i9qw+vkPIHGgAInbN1LQ+ZnxCf9OSyeMHybjsIdYq0WG+wA0jjqkKozwUf+6NiJSHKFTaR7HUC+btBvX1My4b/1T471ALlMFwoNbDg9jmvAcfSwc00OiF869uGp7SE8rCQsRS/qglUQ5940WezO+EuGKLYd4XGLgSzAJ931X7UqPqJzUrL/RTts1csquiw42ftUMoDwecxPA/9sxtu0GBjVsUlzxTtFDSgqrj2LAYpvB6Fha1+IsERlTjBbYAZNj71eUqNDxdMAS5AXBhjLT6uEUo2/XRKUws4fG6t7v7Sgs/IIHwIIwhoiqAA1kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pQHMARlxq46sbxzK0uQCVQHQRQZ+PYoWHO7U6Y+0lJs=;
 b=fs0iTusaLo5OemP76lZd2vZG/qGlSuncInqMZpeGZC1INZsH9G+FDVoWBAOcqbTH+6J1Q0sc5pUAcRZib6IqAWOVGghBhZuUMUpvbM90seabY66EXOReJ6SL9nSh9RYm3r6HhBgNeE98kWvy0aMZgu7dV9/2RyAseVsC6BME2VP8PvekgAMfhdUqlNS/9Qdsl627PRRhQ4rB+CwoSCHzQguH3gPY4oQLGAtfgvxwkVxTzqjqh7KQ3YJEr6vP8sD2tTQtByUATq4JK1++75/3rvkoNTF0ukjQhulYwEsetf/Yl6Q/DOMypdvkspuJNTKAgig7icNHvaFqw6Dvp2faog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pQHMARlxq46sbxzK0uQCVQHQRQZ+PYoWHO7U6Y+0lJs=;
 b=O+o2FPVHpyH8Lg5TaulTB5cMLSJ4wWa984XK7VyPtqveiQJzSHyjyb8WW/6QJmBiPQvMAYL2z/ivXM9ljLdJ7K82UJHidC+spXFprn4mkR+2jrbsZAhrww4wNtFOT/BmDNNRyl2tAtuEw2y+516Fns9Q81GsemIiTsxThI9WVV4=
Received: from DM6PR12MB2619.namprd12.prod.outlook.com (2603:10b6:5:45::18) by
 CO6PR12MB5459.namprd12.prod.outlook.com (2603:10b6:303:13b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 02:50:58 +0000
Received: from DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::ed2a:4807:1825:170f]) by DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::ed2a:4807:1825:170f%5]) with mapi id 15.20.6609.031; Mon, 24 Jul 2023
 02:50:58 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "rafael@kernel.org" <rafael@kernel.org>, "lenb@kernel.org"
 <lenb@kernel.org>, "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig, 
 Christian" <Christian.Koenig@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, 
 "johannes@sipsolutions.net" <johannes@sipsolutions.net>,
 "davem@davemloft.net" <davem@davemloft.net>, "edumazet@google.com"
 <edumazet@google.com>, "kuba@kernel.org" <kuba@kernel.org>,
 "pabeni@redhat.com" <pabeni@redhat.com>, "Limonciello, Mario"
 <Mario.Limonciello@amd.com>, "mdaenzer@redhat.com" <mdaenzer@redhat.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, "hdegoede@redhat.com"
 <hdegoede@redhat.com>, "jingyuwang_vip@163.com" <jingyuwang_vip@163.com>,
 "Lazar, Lijo" <Lijo.Lazar@amd.com>, "jim.cromie@gmail.com"
 <jim.cromie@gmail.com>, "bellosilicio@gmail.com" <bellosilicio@gmail.com>,
 "andrealmeid@igalia.com" <andrealmeid@igalia.com>, "trix@redhat.com"
 <trix@redhat.com>, "jsg@jsg.id.au" <jsg@jsg.id.au>, "arnd@arndb.de"
 <arnd@arndb.de>, "andrew@lunn.ch" <andrew@lunn.ch>
Subject: RE: [PATCH V7 0/9] Enable Wifi RFI interference mitigation feature
 support
Thread-Topic: [PATCH V7 0/9] Enable Wifi RFI interference mitigation feature
 support
Thread-Index: AQHZuh+bU1agtU7QBUGPiE/gTc/eTK/IPmfQ
Date: Mon, 24 Jul 2023 02:50:58 +0000
Message-ID: <DM6PR12MB26196938844FBB1678754C8AE402A@DM6PR12MB2619.namprd12.prod.outlook.com>
References: <20230719090020.2716892-1-evan.quan@amd.com>
In-Reply-To: <20230719090020.2716892-1-evan.quan@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=1d3b4eab-0a34-441f-903b-4abfb76c44ce;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-07-24T02:48:28Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR12MB2619:EE_|CO6PR12MB5459:EE_
x-ms-office365-filtering-correlation-id: 79ba1727-e3f1-45c1-32b8-08db8bf0ced3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AMKeM33EIaOwMU+flD84wyjmsmJTaF6SVXDphDl2JBNfjcMX68oAgBFAq2qXwR970nVAfBIHv1Qdcj1N9C2ird31oz+sI2FVVmBgy2ui/Pc+jffYsp0nyqL20OwGHgth5qimobik91pk3VTGjb2nvUgt8DfEHCrNgOWfy0sN6lpvdv5uYSMQCmS9Jtmzk9+wLficW9zy142qmPlWSlSWRn+TCnN5K8eqsYmN+qzd2F5bV2RccGF4L3Br1u99QekCScpaDF8Rr8jRoN9qsNpE1f3r1ZiTLv1OBpICVpiHtdNrQIMBlbKu6rOBbE0hTgbqKjmGewfdbUT9/O69f1STNhFQJoqmZRcW/oBJPSn7SP0xKWP2Fd4BUubvKUJj2zMlIF4Qz3jYCpnRxEKk/CYjCoBzRi7JBqqGRxkLrKjmaulioWzCevTwLH1aPgc2IPUSlxWl3arV+dXMS2ZEGZATAio8L00+VjzgY5r9c2gYri7txgWO4yKK3qxZq4mgLJowzkmZH7atyRJRMHKsou+itm5JpwjYkcHz7yHN+h2LWwq+5ruHig5LJgPLwDNGSnYFDMUlME/SvWjD1FtiEIi9ibnNFePzhGxdVpE+y6DaAIXoIhlqDMDY85PgnJ3Hx9O7kz56wHewhoQZThi0RzaNAQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2619.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(136003)(376002)(39860400002)(396003)(366004)(84040400005)(451199021)(55016003)(186003)(26005)(71200400001)(6506007)(53546011)(66476007)(64756008)(83380400001)(66556008)(66946007)(76116006)(66446008)(4326008)(316002)(52536014)(8676002)(7416002)(41300700001)(8936002)(5660300002)(7696005)(9686003)(54906003)(478600001)(2906002)(110136005)(38100700002)(122000001)(921005)(33656002)(86362001)(38070700005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?CMBzjF8jqnatMj1D11QjZ/ZmOFJjRyi/WXZDapEv1Y5EoBsk5IL5GlYpHH/n?=
 =?us-ascii?Q?CFN+rMvUTX1r217tlCyaDDzHUMeRKc4gROe5JUFU5a0CbW+FEx+YbDK3r4cU?=
 =?us-ascii?Q?heIMyLIw4A/g+2ZC98radLYIw3NFkf6HFvCsvcLKljzz5Z8AroSbMkmha2rh?=
 =?us-ascii?Q?l2CRvxL5A2FEAwYZWMiac4AgRlyMUOf2lzlwDOOXVu/OsffeVUfNKMr25QHD?=
 =?us-ascii?Q?4dnQxRajjpUratSbAf+y1MqZ5hX79G0NaXmdhrqXWAYyY5pfenju5HKl4Z+Q?=
 =?us-ascii?Q?2ttpHEO44s9qlQrJ9L711NBaVhU+haSyyggwUlQgPJaMic5uQ7ub8HQ1bQWA?=
 =?us-ascii?Q?BTfSMG4z1d5Bg5FUhnkyAxhytMusw8LX07umjt2FpJwlkGHIV18lpGJAECow?=
 =?us-ascii?Q?FBtITuVgdSTjAXV/tEuNMIlnH0LzyqrI+bfSEyxF/T/HcgZVyIupXEb+HfHL?=
 =?us-ascii?Q?CzDeHpAF7PC+77t9MzjueO4M5hvuOJJpwQvO3irDhfOYKQnKrwT9B1sb/Ll7?=
 =?us-ascii?Q?g5O5U7HruX0v/zLXOe7E7ILRaqVs8ejdSIPqdyqTUDJsJZjkl/cRVCEAJyWb?=
 =?us-ascii?Q?HaPkn4S3DGRfzK3mUISB9YJHa5XtdE7mkIO6k5neIWTeFf2aQYCQhRotCI1z?=
 =?us-ascii?Q?yjghxA8Yuvz4g8EWumKfaC3mG2+QB/gMdkiDM3Aq/d7+nqzT0UijkpezLv4c?=
 =?us-ascii?Q?A10gUT0QiCRu8QcUgzIdYJ0Ykvkgk0eOvxKFMbmzLOmMMEv0B8bry2H5+eEf?=
 =?us-ascii?Q?/vLWAud8wHB9Wj+BVR6pSfmJUKQtoU7kTI+nxKjxaJxcPhY6QLqtkucA2WQQ?=
 =?us-ascii?Q?6Mkx1SiVdZWLCxSW00euEDZ0Ns6/+aMbu5gVUnkbt2zGndJN5AIk+MizKkoR?=
 =?us-ascii?Q?XttfYKkqVXs5cK4Ubep+co5/dSDxRRWfwMAk+QgmTjM5mxZ7Pa8PNgvs2d6C?=
 =?us-ascii?Q?A9OhUxWhL1LuTLtfNbTg5p579oeAgN2UkLBtmS9PfGXFWH8RsU/E2muOY/H4?=
 =?us-ascii?Q?sHz5by+Dc+9rydgXVfIFBG86u3bnjjW1dEoVQg6L9jzcgoxJPynE3NcBXVxT?=
 =?us-ascii?Q?YxAg/7xsL1XqXuK4X9E8+8yqA/1z0M573l4P7kmXurQ6nG7wUHmPIHelDbf3?=
 =?us-ascii?Q?wE0k+6LyHtJA2fW+3nEMoFIdgPp9NU6jRyEJru7wwpKC7OM/1te1Z5uGl0gT?=
 =?us-ascii?Q?zv0YxFP9caRwioF2eTYszvhlR1pilKIRERG+mu8ilukeB08sK9CxQdBhZUqE?=
 =?us-ascii?Q?w5oCHRzDlzCWjLv35X24+HbQEFK72Zd9BZspOA9iWpWsfPdrEA/zOmNme9DC?=
 =?us-ascii?Q?CGlFn10dzPB44HxaOi4kNhbptkcopT8B6khYbhXnUTrVtZDDhT9zIjY0UWWz?=
 =?us-ascii?Q?N2vtxhlaDUIWvm1p/SYr+7IDXZ7oXTD5cW5TsU3uajPrFkLRrucTWeyCSfVR?=
 =?us-ascii?Q?4reUobk+2O3Ebjevh7EsQVZYXU/jImSKo496yeR8ivFOJqTlbpVX1bY6Gfsu?=
 =?us-ascii?Q?dscaRlYd0jS2Z/ZAQmhVDSU1NpzryM3p2CEBTUsD0NeMQePu4Z4UdOovHFqn?=
 =?us-ascii?Q?ij2lzbYCYXQ/0jBtj7M=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2619.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79ba1727-e3f1-45c1-32b8-08db8bf0ced3
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2023 02:50:58.0933 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 20dZrXCHnyynUOSq9v84G+FdfFTcnsIuUJRgAwUiOu6B3RMMrGTujjq/O3oS1+ja
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5459
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

[AMD Official Use Only - General]

Gentle ping on this series.

Hi Rafael and Andrew,

Can you help to check this latest series and share your thoughts if any?

BR,
Evan
> -----Original Message-----
> From: Quan, Evan <Evan.Quan@amd.com>
> Sent: Wednesday, July 19, 2023 5:00 PM
> To: rafael@kernel.org; lenb@kernel.org; Deucher, Alexander
> <Alexander.Deucher@amd.com>; Koenig, Christian
> <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>;
> airlied@gmail.com; daniel@ffwll.ch; johannes@sipsolutions.net;
> davem@davemloft.net; edumazet@google.com; kuba@kernel.org;
> pabeni@redhat.com; Limonciello, Mario <Mario.Limonciello@amd.com>;
> mdaenzer@redhat.com; maarten.lankhorst@linux.intel.com;
> tzimmermann@suse.de; hdegoede@redhat.com; jingyuwang_vip@163.com;
> Lazar, Lijo <Lijo.Lazar@amd.com>; jim.cromie@gmail.com;
> bellosilicio@gmail.com; andrealmeid@igalia.com; trix@redhat.com;
> jsg@jsg.id.au; arnd@arndb.de; andrew@lunn.ch
> Cc: linux-kernel@vger.kernel.org; linux-acpi@vger.kernel.org; amd-
> gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux-
> wireless@vger.kernel.org; netdev@vger.kernel.org; Quan, Evan
> <Evan.Quan@amd.com>
> Subject: [PATCH V7 0/9] Enable Wifi RFI interference mitigation feature
> support
>
> Due to electrical and mechanical constraints in certain platform designs =
there
> may
> be likely interference of relatively high-powered harmonics of the (G-)DD=
R
> memory
> clocks with local radio module frequency bands used by Wifi 6/6e/7. To
> mitigate
> possible RFI interference producers can advertise the frequencies in use =
and
> consumers can use this information to avoid using these frequencies for
> sensitive features.
>
> The whole patch set is based on Linux 6.4. With some brief introductions =
as
> below:
> Patch1 - 2:  Core functionality setup for WBRF feature support
> Patch3 - 4:  Bring WBRF support to wifi subsystem.
> Patch5 - 9:  Bring WBRF support to AMD graphics driver.
>
> Evan Quan (9):
>   drivers core: Add support for Wifi band RF mitigations
>   driver core: add ACPI based WBRF mechanism introduced by AMD
>   cfg80211: expose nl80211_chan_width_to_mhz for wide sharing
>   wifi: mac80211: Add support for ACPI WBRF
>   drm/amd/pm: update driver_if and ppsmc headers for coming wbrf feature
>   drm/amd/pm: setup the framework to support Wifi RFI mitigation feature
>   drm/amd/pm: add flood detection for wbrf events
>   drm/amd/pm: enable Wifi RFI mitigation feature support for SMU13.0.0
>   drm/amd/pm: enable Wifi RFI mitigation feature support for SMU13.0.7
>
>  drivers/acpi/Makefile                         |   2 +
>  drivers/acpi/amd_wbrf.c                       | 282 ++++++++++++++++++
>  drivers/base/Kconfig                          |  37 +++
>  drivers/base/Makefile                         |   1 +
>  drivers/base/wbrf.c                           | 256 ++++++++++++++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h           |   1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  19 ++
>  drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c     | 213 +++++++++++++
>  drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h |  33 ++
>  .../inc/pmfw_if/smu13_driver_if_v13_0_0.h     |  14 +-
>  .../inc/pmfw_if/smu13_driver_if_v13_0_7.h     |  14 +-
>  .../pm/swsmu/inc/pmfw_if/smu_v13_0_0_ppsmc.h  |   3 +-
>  .../pm/swsmu/inc/pmfw_if/smu_v13_0_7_ppsmc.h  |   3 +-
>  drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h  |   3 +-
>  drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h  |   3 +
>  .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c    |   9 +
>  .../drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c  |  60 ++++
>  .../drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c  |  59 ++++
>  drivers/gpu/drm/amd/pm/swsmu/smu_internal.h   |   3 +
>  include/linux/acpi_amd_wbrf.h                 |  24 ++
>  include/linux/ieee80211.h                     |   1 +
>  include/linux/wbrf.h                          |  72 +++++
>  include/net/cfg80211.h                        |   8 +
>  net/mac80211/Makefile                         |   2 +
>  net/mac80211/chan.c                           |   9 +
>  net/mac80211/ieee80211_i.h                    |  19 ++
>  net/mac80211/main.c                           |   2 +
>  net/mac80211/wbrf.c                           | 103 +++++++
>  net/wireless/chan.c                           |   3 +-
>  29 files changed, 1252 insertions(+), 6 deletions(-)
>  create mode 100644 drivers/acpi/amd_wbrf.c
>  create mode 100644 drivers/base/wbrf.c
>  create mode 100644 include/linux/acpi_amd_wbrf.h
>  create mode 100644 include/linux/wbrf.h
>  create mode 100644 net/mac80211/wbrf.c
>
> --
> 2.34.1


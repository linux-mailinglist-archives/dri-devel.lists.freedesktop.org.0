Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E352758B54
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 04:29:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9DAF10E0AD;
	Wed, 19 Jul 2023 02:29:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2055.outbound.protection.outlook.com [40.107.95.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A07F410E0AD;
 Wed, 19 Jul 2023 02:29:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vj540kJKu/n6d00Zh6M1dUET6i4U0cmP0GFMBkL6P3MQtU11SgtlzVxzadH1+zpfe3u5isoNhxFNAM69NMxF95wDl3gcqXNWvKnd2Yrlx/me9N0eZFuN37bYhG24LtaoKB0z2syKcWplgvD880NAvAwiy0NHw/tjX+oRKm8FGSSWaFoBAoOXzEgoWPrrsthqRNvjlwwt5csQGQGeP13TImN01JzJOzZhU0tMq+tevr2Hz3rWhAar7zTqgHx6+kbxRhgf70FGuqoV9OwKzepXJ0pYUQu5oh6384hAhkUAbbjYG3vv7R/DHMF6LxBnotcxVU1sb8n0BCOKDiIRtmHZqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZaVCpHOPaBUR/NZJWYFrraFTfmsRWHmM2UZewpxm+B4=;
 b=XGOVFCMQLmb3LgbdBRn517vxdmLUIdenjsZXN4O5UUo3lfH2zk1f5J/viAA/SMs152bfTmVMPfHf6cvWQvpISW95y3hojMxaTT074+iXyOlwVF53obPjKmmlcyhjGf34eWBYzStoBzo+ZVDh/rJnCWE1rVv1DS2fJTk4AV9v9qwHUoEupvYcg5/kWuBWHY1mj2opu8fDbMEW8pqkG5h8WfWdOmwQQFN67LFwnGE5f4ffT8eESBK88wopdAz3lPUdg4CZ+q3S605GsBDNA1YbbXeTBfM71VjYMiu+VnUopdsAFaI7ohqB89yRmd114JxhHM+WeE4RBbaE1S4kHlRy5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZaVCpHOPaBUR/NZJWYFrraFTfmsRWHmM2UZewpxm+B4=;
 b=tMTsyGfOkOXhQESCZp26L9Mp8eWRkYTo4ZNZocSHPUz6sW9YH5Rm6zS3WAEna7GjcX8nPf4i3rRvwklTw31ALRnO+kLx0EUmnujuMgU9HjTyTXcOdVlBJTTFNqOzGksaSBp3nTMX3ELaznERADJKqheYYk+6qp19J9aP+KBo750=
Received: from DM6PR12MB2619.namprd12.prod.outlook.com (2603:10b6:5:45::18) by
 CO6PR12MB5396.namprd12.prod.outlook.com (2603:10b6:303:139::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6609.24; Wed, 19 Jul 2023 02:29:41 +0000
Received: from DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::93dc:de92:88e7:b765]) by DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::93dc:de92:88e7:b765%4]) with mapi id 15.20.6588.031; Wed, 19 Jul 2023
 02:29:41 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: Andrew Lunn <andrew@lunn.ch>
Subject: RE: [PATCH V6 1/9] drivers core: Add support for Wifi band RF
 mitigations
Thread-Topic: [PATCH V6 1/9] drivers core: Add support for Wifi band RF
 mitigations
Thread-Index: AQHZswnuaUrcGkEUvkO69ZFpbKmfV6+2xnYAgAiUksCAAEOtgIAAzFPg
Date: Wed, 19 Jul 2023 02:29:40 +0000
Message-ID: <DM6PR12MB26193915145D5C32ECC345D5E439A@DM6PR12MB2619.namprd12.prod.outlook.com>
References: <20230710083641.2132264-1-evan.quan@amd.com>
 <20230710083641.2132264-2-evan.quan@amd.com>
 <5439dd61-7b5f-4fc9-8ccd-f7df43a791dd@lunn.ch>
 <DM6PR12MB2619CF4D4601864FF251A1FAE438A@DM6PR12MB2619.namprd12.prod.outlook.com>
 <642e3f4d-976b-4ee1-8f63-844b9568462e@lunn.ch>
In-Reply-To: <642e3f4d-976b-4ee1-8f63-844b9568462e@lunn.ch>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=0a4e7673-5735-4d66-9a58-992e97d36ed8;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-07-19T02:27:25Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR12MB2619:EE_|CO6PR12MB5396:EE_
x-ms-office365-filtering-correlation-id: c8309da3-b302-43f2-322d-08db88000186
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: f+9P7GH8uHLy2OSUISPGVeNaEQqGzFTDJ3l8QmNw7WibK7tFQun/5ntOCgYhFIjVACjos3AiwDjU3BYVySz4pRMHFGoMXBvJPGrlBPvc60PmAM3hyv/pV7R4A0Ga/AZ/SSRW1IZeOowiF3hyS7RzyB6EyvRsc6Q3l7T61SlBYdC/Sc4R+MiwZCJHVpymFomG7YOVb6hda5cyNuFlqVSIgbFqTe+EUZe3yVgC5EOSU+u/aQJZDY3l0HEM3gaT2ecPiC39Mg5xyZesoEPNcn+XmFimZxpwRGxWSwcdW2Pa1m12yAeHZgq+G6dk6iLd1bejCuDo2t66/1oRiMbWv5rxZDamu95LvCpVuBNqwhSlGB+WWNdFU18C4ebydf0cvZGr2dpfxRQ5XrVfZtmUTMx04v4aHy4B7NEJ4af3PXnbeKuJAOGbfSO98RH0ppzFLPe3OgLhSm6w4toetebmwlgJIEtsmeAvpLVfQDtC6ccx/VoWDqQH8nTQSsOC3r5kk7cFbaAcC3ypMuy6SQkdoXGuWERlOJ1zEuQtLaHSmOzn7O7agqqHs8xJ1WoqPpTdTOPzEFrUB7Ap7wsRv7Y+sKOUqqOKHvdzdaMF2WQcWovlKIR2kTvHYM3/MZw/KcD9WLNg
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2619.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(136003)(376002)(396003)(366004)(346002)(451199021)(55016003)(54906003)(478600001)(38070700005)(86362001)(186003)(26005)(33656002)(6506007)(53546011)(71200400001)(122000001)(83380400001)(38100700002)(9686003)(2906002)(7696005)(7416002)(8936002)(8676002)(52536014)(6916009)(41300700001)(64756008)(76116006)(66446008)(66476007)(66556008)(66946007)(5660300002)(316002)(4326008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?VYbk73/l3kpVglm4+2oNneT0ERyB2weVQXH+SkIpMnB8T9wKFdFExIAzzwpM?=
 =?us-ascii?Q?K+xjJVUHSVo5Jt5eH3kkab93N8VDcpD6J1xK7tXfXJi+o3gxNuNcmmIHs9cg?=
 =?us-ascii?Q?YhHe7N1ewWuqHinss5vI5PiVUQ6F6rh0fyqv6ZNsxVfhLMZjpxQ+KLcgnUsI?=
 =?us-ascii?Q?B8YxO/HSdMs1vxGw3033M4oSkWZX9bWxk+25QPPnNTXaEpFz7zTCiH4YhuaM?=
 =?us-ascii?Q?UhNrMikX9IaYlxdJVX4sWCB+LvUfq7aUPmTViv0BR60jQQNZoMbRT/hFIS2W?=
 =?us-ascii?Q?vEzehbGLHGnt5AT1swtX2N7QklE8q7/FprjyRP95NnmBDaRzOtGlIyn29cvY?=
 =?us-ascii?Q?Sp4bJ1XimkADms4G45PHd8auhN2Lk/UIsUP4TBrDMJzG2Sp5qgNSoTwheKlO?=
 =?us-ascii?Q?rcdXCcQWekoD96YABC+i+qRx4HlsU+7lQtIyGZ3Pv0dePSUoTsORVxiMUWLe?=
 =?us-ascii?Q?vMmryrBwndoKEzyyUCCRPlnSTwUarzDLm6Z+fhfTIjFszkdHAepqOdcC+iU4?=
 =?us-ascii?Q?13oCXY85OE3GJYhu6TEAKxSym0m4o9PeUChdRW8yt9buLxWta3PB2449oBt6?=
 =?us-ascii?Q?BIhbNDpxMuO3i6NOafaAjWEKftHqJu0KHDGslRDuqI7OrLgqQYZ1iI89p4Df?=
 =?us-ascii?Q?W3qH2/dwukKaKR++QDTUEY1epM5sKb1Yf9vUi+0ZzWipJ8QkF68GjK6S4Ffm?=
 =?us-ascii?Q?C981bcVWzO4M5sFgYPoFHDN1SFHFJvBQJaQadHQdoCAmDFysoKR0AW19aXQ6?=
 =?us-ascii?Q?rWq0i43R+d6dnNNwznj5p+EZBUcR1wBDO/OGob8t9AyxMMuEj0N0SS0Nkv/R?=
 =?us-ascii?Q?YPcX+BXgfZY0t0RjitIzL7ExZUwamub9tZpdQnC2OIxhUjjDpMZv8GzEohsg?=
 =?us-ascii?Q?wDPHuypYjIiWxcVdj7b7xkAJG1iyHYKY09V7TwukbfK/eJjUGkP6rgp2T/13?=
 =?us-ascii?Q?R8TMS1TweAgkGvI0xHMUEuhIVUesurXJVLWzy+7Co7TSw8mjlftAXwXGWUAs?=
 =?us-ascii?Q?GsnVo9JEOw8P2UCuEd3HRbS1GjA6HfYo4uN2d/T0XjRZfxJhwMh5xMvcy5k1?=
 =?us-ascii?Q?+vXdveLW1OS7EmSdOfqjcgHlS1//ztgZ3Llh7KWCdo3rUltcu/sCExi38A8b?=
 =?us-ascii?Q?8Ktl5WPttA1/JHi8Giq9OfBt1w/aFGdW0WIhvrFgxXAo/evs0zv5eMQSvbJM?=
 =?us-ascii?Q?wWRJS1gFVSK2YYSk2A6KoGqX2AEP7UixjDlWm07PzjGUcZsQclKFbZIf3lzA?=
 =?us-ascii?Q?hP6uB0YR4fS2gjp9RsSeFjMkbnBqUAHp1ZcO2sv0o9u1v7Gd6377sLvjqb9a?=
 =?us-ascii?Q?sbmxQjxwMgxiKUrkVNxRmd1gUOXtfugT1NDjp2MzNWWQZ+tcfs5/acTb1ahs?=
 =?us-ascii?Q?THbVyX7jBr+icjW5Mslpb0enb1A443iq3ndqdio6GVs9L8FLyhwZQEJYWtQE?=
 =?us-ascii?Q?wINS9EyvPSA0dJ2aL0bwEAHKzK9M1Cgmmu3GXpVbR5mIwqymwpBfDM/siqKp?=
 =?us-ascii?Q?zaYPvdm56mujDw/bRAePNpXQqbT/JO24WmfaWOqJujx3X09Rp6xiitW+u4SV?=
 =?us-ascii?Q?joJkHv5n5aFbwiukh3M=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2619.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8309da3-b302-43f2-322d-08db88000186
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2023 02:29:40.9977 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iWFoeuvMkpnEILYdRKxNBwuRqq+vsQslesngGyOqMSd7qsl5EZw30XGjpC4wZPAB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5396
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
Cc: "jingyuwang_vip@163.com" <jingyuwang_vip@163.com>,
 "bellosilicio@gmail.com" <bellosilicio@gmail.com>,
 "rafael@kernel.org" <rafael@kernel.org>, "trix@redhat.com" <trix@redhat.com>,
 "Lazar, Lijo" <Lijo.Lazar@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mdaenzer@redhat.com" <mdaenzer@redhat.com>, "Limonciello,
 Mario" <Mario.Limonciello@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
 "kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>,
 "lenb@kernel.org" <lenb@kernel.org>,
 "andrealmeid@igalia.com" <andrealmeid@igalia.com>,
 "arnd@arndb.de" <arnd@arndb.de>, "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "edumazet@google.com" <edumazet@google.com>, "Koenig, 
 Christian" <Christian.Koenig@amd.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 "johannes@sipsolutions.net" <johannes@sipsolutions.net>,
 "davem@davemloft.net" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only - General]

> -----Original Message-----
> From: Andrew Lunn <andrew@lunn.ch>
> Sent: Tuesday, July 18, 2023 10:16 PM
> To: Quan, Evan <Evan.Quan@amd.com>
> Cc: rafael@kernel.org; lenb@kernel.org; Deucher, Alexander
> <Alexander.Deucher@amd.com>; Koenig, Christian
> <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>;
> airlied@gmail.com; daniel@ffwll.ch; johannes@sipsolutions.net;
> davem@davemloft.net; edumazet@google.com; kuba@kernel.org;
> pabeni@redhat.com; Limonciello, Mario <Mario.Limonciello@amd.com>;
> mdaenzer@redhat.com; maarten.lankhorst@linux.intel.com;
> tzimmermann@suse.de; hdegoede@redhat.com; jingyuwang_vip@163.com;
> Lazar, Lijo <Lijo.Lazar@amd.com>; jim.cromie@gmail.com;
> bellosilicio@gmail.com; andrealmeid@igalia.com; trix@redhat.com;
> jsg@jsg.id.au; arnd@arndb.de; linux-kernel@vger.kernel.org; linux-
> acpi@vger.kernel.org; amd-gfx@lists.freedesktop.org; dri-
> devel@lists.freedesktop.org; linux-wireless@vger.kernel.org;
> netdev@vger.kernel.org
> Subject: Re: [PATCH V6 1/9] drivers core: Add support for Wifi band RF
> mitigations
>
> > The wbrf_supported_producer and wbrf_supported_consumer APIs seem
> > unnecessary for the generic implementation.
>
> I'm happy with these, once the description is corrected. As i said in ano=
ther
> comment, 'can' should be replaced with 'should'. The device itself knows =
if it
> can, only the core knows if it should, based on the policy of if actions =
need to
> be taken, and there are both providers and consumers registered with the
> core.
Sure, will update that in V7.

Evan
>
>    Andrew

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 494F177B2DF
	for <lists+dri-devel@lfdr.de>; Mon, 14 Aug 2023 09:47:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 785A610E149;
	Mon, 14 Aug 2023 07:47:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2056.outbound.protection.outlook.com [40.107.243.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2425710E145;
 Mon, 14 Aug 2023 07:47:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KyHpqzjaEJbTRGy0g8YvJ2O9ceeCjhGp4N92lt6kOL5I35rVZhl3R+QwQJE1zFezvY+Ca/LflTeSKPwk5AaAmtdK/BNE39TIKaWaL+PvskZIxJaK/8BxsMG8rb4Ky1NnDNLrpkL5VLODIYFmgOEqaZun1+77+A6/pCZOtCTsHjTCdIC21v6ynNHJ3XvD34706L/gsleR60dMqm/aec+jtqhxTGaOYHzOA8TY07/XVgHjMiyNrRXIqwYV4JRsz4pZeAqcOzsm6Jzs07SLMgHbRL5mrpWyNx7bG6cFQUQ3VuzIOsjv7XbAQh0KvorPmjCNtth42CdVOOON5qAYLUhwNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6BdtJuUwuwfwtIcoNVR/TBdg9eTbXzCDEGhbKzAXMkY=;
 b=TRJ+W7dyd3vvptJyuWm3ZfGEzE8u622q+9vOgq2UefjeZ0rGBvEg1pfmBfF6hHMdE1nH438UKe+g7gpN6l6oTFur4gfMAqOEt6EWO1f1cPbufrpKxRVSmCwYdPQI/3FO0Rn0c589qJT4OZ0XhgG/VVGDGQygIxckK+axVO892haTy7AdGZ9ULIiLXpx74fmpoPXu8ThaRbtbG3fUD3M7I1hQJBEoHHFEIWcqteEyPRuNxG3SY4Veh1YxUisYFkL9QhQC/hHK3Hkzd57GwYf2FoIo7jHxI2OAPzt1/nP83Uh1fgc3lVp96L/IfehyvnhE86V06OCBmj1h3wlxHFOD+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6BdtJuUwuwfwtIcoNVR/TBdg9eTbXzCDEGhbKzAXMkY=;
 b=NthudOvj5gkDk7KZnlLNqFU6t5A0CYJDge/HQamzyq8tsVmd4Ajc29dBdvwVc6MF9BOzWimZhazZ1IoAxkpFnvZJTfHJNP7ljwRX2CltKNiqY3sFQXJH3oY5LQM7q3Evjiq+5JErD5SyT341m3xIqufb1UQW2+4WWdN0vkEec7U=
Received: from DM6PR12MB2619.namprd12.prod.outlook.com (2603:10b6:5:45::18) by
 DM4PR12MB7694.namprd12.prod.outlook.com (2603:10b6:8:102::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6678.24; Mon, 14 Aug 2023 07:47:34 +0000
Received: from DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::ed2a:4807:1825:170f]) by DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::ed2a:4807:1825:170f%5]) with mapi id 15.20.6678.022; Mon, 14 Aug 2023
 07:47:34 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: Simon Horman <horms@kernel.org>
Subject: RE: [PATCH V8 6/9] drm/amd/pm: setup the framework to support Wifi
 RFI mitigation feature
Thread-Topic: [PATCH V8 6/9] drm/amd/pm: setup the framework to support Wifi
 RFI mitigation feature
Thread-Index: AQHZy14e3OnvhnQIWky/lZoPSxsKIK/k12uAgASYsXA=
Date: Mon, 14 Aug 2023 07:47:33 +0000
Message-ID: <DM6PR12MB261906B335C4490EAB5DA6B3E417A@DM6PR12MB2619.namprd12.prod.outlook.com>
References: <20230810073803.1643451-1-evan.quan@amd.com>
 <20230810073803.1643451-7-evan.quan@amd.com> <ZNYAuyrEWbRiHm55@vergenet.net>
In-Reply-To: <ZNYAuyrEWbRiHm55@vergenet.net>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-08-14T07:47:31Z; 
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=5c97aa45-4901-401b-bddc-26d30f32ed97;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR12MB2619:EE_|DM4PR12MB7694:EE_
x-ms-office365-filtering-correlation-id: ee8da75f-8d78-4174-23c0-08db9c9ab89b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +4qHWNErIOCaJrVF/PVYCIXmKtnMBGcLpbZTdhK/gnH+PSKvlZcXL4OMTzUIpVVBEwbX949G5sHJ+EBTOKq1/s7W0DRd10EqBtTuTGSU8PIcjBwuisWuEAhwsJ6e3q48NcusIKfbLZ7EoOjgHvMK/46W9LprCzMZcLXDRHGr03Uxdj5rbx4IWaxsaFFEr5Sj6ObT9TN1iwZznvYQzFo3j0iQUF4vpRFXkYQ9SLlp2y+ooGUVdLa6cxGc1BDk9tMG4g9g4PCsoHO2JmpTveCTbcV8Z2D1J3RO8O3Yz/yhdNGGVbLeXYPMY26p9GGIVRQQZ9cnKum0aOluTnpwiv9umaiZ/H0YTrRfb0TeqYyfvk6so7Gmv8ae2GWa+qq9uZS0GQDIOdS6AYjZuYZz3kMnyUaZhFpujoqTRG/0JXeJh2IaNbqOC83QrZFkjiO4dnS6igXwo5TeenYNNyOPvEccu6KI6ZHRT9YTqMklpeKUIJc/eE9uaLZV+te7KSV5kTfK+n4WbwARlWgfjLN8wZG3EXkuaGtaQvGO97pLMmOhg+1Chfz8Osu5EDr083t3LBu8gKj83Z0vcVpKBFKJj/xQUblUaYmvwr2JkC7Fe83TajiaD0ohxMLUHEeqHwMHynHv
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2619.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(136003)(396003)(366004)(376002)(39860400002)(1800799006)(186006)(451199021)(6506007)(53546011)(26005)(8936002)(41300700001)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006)(8676002)(316002)(9686003)(83380400001)(71200400001)(7696005)(122000001)(478600001)(38100700002)(55016003)(54906003)(33656002)(86362001)(6916009)(4326008)(5660300002)(2906002)(7416002)(38070700005)(52536014);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?zTw92pJI5GQsExsRS2oCZIZqr83TTQOELRfwUDXlZCDcJOZhM4qZLGJSxS0I?=
 =?us-ascii?Q?0NxmEcodIBVWP/GNKmfqvs4hxKDwnncwP48HytGvRiUvWNvm14CCMJrMrrF0?=
 =?us-ascii?Q?LUGQ94rvof8kiE7T4jkDMo6BWp5GZkJB+0CW+/rxTk5+A5tHllT+LKFXtA9V?=
 =?us-ascii?Q?wzlldhfwqtZL/9jGmQ++XJAIVN+gP5G7ZLsbTynxop1uouejIBIWqdxSCbgm?=
 =?us-ascii?Q?LHuRoARl3NI7OY7ho3pJbPDEQL9zGxxwSaTZj0oTkO1trIGqht1tgvL8+R93?=
 =?us-ascii?Q?RIMy4/hPDJjOFWC4Y/Q0Y0YwC1DGuRauotbwzAbmk92VroIujtzuIka6mAwC?=
 =?us-ascii?Q?y048B/0amF2ddxSAyg93X5lep4DHYCG86yUI9VN8rVBTCED4+YFW1LwFHtL9?=
 =?us-ascii?Q?AhxHc/+sfchhGSz9rOb3A/IVPTSFUWPsbP1FDefm2wMZlaVcW4nl7LHnk/z4?=
 =?us-ascii?Q?ZBeYYxDT5NM9ja/0Is+oGgEthraaVtICfVlAff4eV0Na2lfvhTy3C9HrFsTW?=
 =?us-ascii?Q?RlTlvRPeGHOMGtR7E45rDCu2JuVcBle4rtY0sYHsMn6rcFf1oJfMp1wEU7kb?=
 =?us-ascii?Q?H6i2VzQRW4IrzeQk67rSjI1445wkTs2uz1WJfK9nH1Vuv8vD/j9ZQdTR256i?=
 =?us-ascii?Q?N8jld8/Osm6eoZSig5taylTs44GUirlOJWQvQuMXro47em3rwpr64IWa60iu?=
 =?us-ascii?Q?rH6mKJgu8wBO8c+ZgidMPoJ2/VDFU1x1V5sqBftw+Ieg7t+nUk1zSlt3kmSh?=
 =?us-ascii?Q?VIuzHjaHKMzmjMrt0Wn78Ak52/62pYNmXSZzh03qf1ZCcP/qSrn1fUqr5OpC?=
 =?us-ascii?Q?hm2TMWLkeIV3syvJDv2/LOpC3uxYEek3AVl3kXq2YSZrKaaxtUjQI8FyYDf2?=
 =?us-ascii?Q?H4d4a60vh//QaLgRSXbpfMqx3nO0DggcTSNYB8mWUP2wOrC6GzAd3+DRlQWB?=
 =?us-ascii?Q?VP+I+zmUMAAFBcaYd3nqAkehm5a+i+JgZnXJunxuBU8UBpFu0N1fjf3x/iJg?=
 =?us-ascii?Q?cJH1A4674jbAB41ZRbVUqwTLPhu+N/rphiF47gNMAM/hi+HBsOYFVmm0nxmr?=
 =?us-ascii?Q?5yYHdSToU3mER+FxvdzpWiIaieduVrzUbmgfzFoHIPOsXo/pEwy/h7aRK/rE?=
 =?us-ascii?Q?A671ZbTi6mt7rUlK++uI2TrbkaVasHmDA1i4oLi8HkH29uZaITNe4AUFB8e3?=
 =?us-ascii?Q?KCEeUQtDnb14Y4OQJNTX/GlH7CIm1TacbAerWgpVvyk7JkKLgBGilbQT0Juc?=
 =?us-ascii?Q?8wyj1AK/iJBel7kf2sKPpLjyFIOWjoTSn9TRfFRKzWPbeYDqG7QIqgq5c4ew?=
 =?us-ascii?Q?MnwYtKXAPM//n8f23eO+5S/gvpb8KfvkJzxn43fG6HHiXgeEkDZ8IyODzsMQ?=
 =?us-ascii?Q?oYyjCHCEnL4Yke5Yya81mXPs/t2bLjV5RXlXkHRb9bkVfMLgWIsG38rUKEMM?=
 =?us-ascii?Q?ZgZ0DmXkt1RwR29pno70tFA0Ey9shSBxoSlVEHRkyARXdEQ1NPM1jUeGvT/e?=
 =?us-ascii?Q?MoXXj+xm4K/Yvv1/HfspI301VwhtgkHc5ZlmwMm/nHjzyWtOTqg4t10OcxSu?=
 =?us-ascii?Q?NfBKqfivDBggJzkHRZ0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2619.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee8da75f-8d78-4174-23c0-08db9c9ab89b
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2023 07:47:33.9096 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bXakM/97IT+kIfTTWzAgliDYmWc04arfXhima65n/Bz7grEB1vztdlrPhaGBIPC0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7694
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
Cc: "andrew@lunn.ch" <andrew@lunn.ch>,
 "jingyuwang_vip@163.com" <jingyuwang_vip@163.com>,
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
> From: Simon Horman <horms@kernel.org>
> Sent: Friday, August 11, 2023 5:35 PM
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
> jsg@jsg.id.au; arnd@arndb.de; andrew@lunn.ch; linux-
> kernel@vger.kernel.org; linux-acpi@vger.kernel.org; amd-
> gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux-
> wireless@vger.kernel.org; netdev@vger.kernel.org
> Subject: Re: [PATCH V8 6/9] drm/amd/pm: setup the framework to support
> Wifi RFI mitigation feature
>=20
> On Thu, Aug 10, 2023 at 03:38:00PM +0800, Evan Quan wrote:
> > With WBRF feature supported, as a driver responding to the frequencies,
> > amdgpu driver is able to do shadow pstate switching to mitigate possibl=
e
> > interference(between its (G-)DDR memory clocks and local radio module
> > frequency bands used by Wifi 6/6e/7).
> >
> > Signed-off-by: Evan Quan <evan.quan@amd.com>
> > Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
>=20
> ...
>=20
> > +/**
> > + * smu_wbrf_event_handler - handle notify events
> > + *
> > + * @nb: notifier block
> > + * @action: event type
> > + * @data: event data
>=20
> Hi Evan,
>=20
> a minor nit from my side: although it is documented here,
> smu_wbrf_event_handler has no @data parameter, while
> it does have an undocumented _arg parameter.
Thanks for pointing this out. I will fix this.

Evan
>=20
> > + *
> > + * Calls relevant amdgpu function in response to wbrf event
> > + * notification from kernel.
> > + */
> > +static int smu_wbrf_event_handler(struct notifier_block *nb,
> > +				  unsigned long action, void *_arg)
> > +{
> > +	struct smu_context *smu =3D container_of(nb, struct smu_context,
> > +					       wbrf_notifier);
> > +
> > +	switch (action) {
> > +	case WBRF_CHANGED:
> > +		smu_wbrf_handle_exclusion_ranges(smu);
> > +		break;
> > +	default:
> > +		return NOTIFY_DONE;
> > +	};
> > +
> > +	return NOTIFY_OK;
> > +}
>=20
> ...

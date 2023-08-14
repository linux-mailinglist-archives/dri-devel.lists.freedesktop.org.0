Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E034A77B2D8
	for <lists+dri-devel@lfdr.de>; Mon, 14 Aug 2023 09:46:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72B8310E141;
	Mon, 14 Aug 2023 07:46:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::61c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1158A10E137;
 Mon, 14 Aug 2023 07:46:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BbIwKUmcAtGGgGu/6+gb9X/6IsYPPqjR0rpDbGLNn746+fWRQ3Z8IbfhJ553xfkTQogacZsInmNatI03kZMM5UWwcvLC3aMUAS4sJCMKvxskyzNzVYi5zuM9A9/3LSShKM9/rMk2bBOFseFxlGxcQULVPOc+YkFQ+JrKzERrqqEre587g3qS73rD13yC5iTZJ0pXoqT9S36964h3tZ8ldt6+gGvr/8uWyE6VLrm0+2zhjnwmSowgrbMO7TPICw0QUDaTBUjA7xYdzmeSF1LWwUPWU7DqF6kNJP0KHmZdzfEJkqE81qScX+C6Si4Tv4nNTOQKPkRWr9Mt19ssDAKcfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JdFvQyk693fVqmIOaAwwFy/qgIKoizkoOGNT6QJXr9E=;
 b=YMv89hGJ8MDdfhsU40Bjn9WokzUOduQm756naeAESnV9kR0OSby1Xsc1bYa8jL46JZx/0ReLa7hPA+H2b2I/6P9BC476bKVxOoM2464cDpjxv9K8LLNlAUW8twlJqzS+lRZAjHxbO69DYTHPXQnxuYBCxV+vDcFkT8b6PUsHY8D7N8hX2FRGTOEywQnp2wDT+191x4EY7Xogp5befXxqiLDtGyj2i7XiRL2BCkqvAF/9G08/34lxboqGt6CetDk/oRGAb8rUX3VAhlPtqhUdbXwcZLkCkphB7Tgy7I+gfk9/nPWAn3Sst2RVOXZz7xroAgli0V8PgbuV+hSRxrAZqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JdFvQyk693fVqmIOaAwwFy/qgIKoizkoOGNT6QJXr9E=;
 b=c4+ebAWDg/+bv7cZRAE5VXirB04ZeyZahf/aQhWMfhTYf+ghiC43YgiPYMkAcTcBVj8dCeP37EBlsYZLCdnlbA3mAs5AetLpUrAqZGj01SLBsYmOes2bOJkmOIeisoeVCbLiJoeWJlrkdV0Vxo1jZAJ3DYuipwsh+kheXrTWLWI=
Received: from DM6PR12MB2619.namprd12.prod.outlook.com (2603:10b6:5:45::18) by
 DM4PR12MB7694.namprd12.prod.outlook.com (2603:10b6:8:102::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6678.24; Mon, 14 Aug 2023 07:46:11 +0000
Received: from DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::ed2a:4807:1825:170f]) by DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::ed2a:4807:1825:170f%5]) with mapi id 15.20.6678.022; Mon, 14 Aug 2023
 07:46:10 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: Simon Horman <horms@kernel.org>
Subject: RE: [PATCH V8 2/9] drivers core: add ACPI based WBRF mechanism
 introduced by AMD
Thread-Topic: [PATCH V8 2/9] drivers core: add ACPI based WBRF mechanism
 introduced by AMD
Thread-Index: AQHZy13cCCFdkuqP4kWyz/74g5zCw6/k2DIAgASXm2A=
Date: Mon, 14 Aug 2023 07:46:10 +0000
Message-ID: <DM6PR12MB26197EFD7E9F1ACC6F52C40AE417A@DM6PR12MB2619.namprd12.prod.outlook.com>
References: <20230810073803.1643451-1-evan.quan@amd.com>
 <20230810073803.1643451-3-evan.quan@amd.com> <ZNYBYuUSaio66vLN@vergenet.net>
In-Reply-To: <ZNYBYuUSaio66vLN@vergenet.net>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-08-14T07:46:07Z; 
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=3e316eeb-438d-4aa2-b94f-4442fa998ea8;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR12MB2619:EE_|DM4PR12MB7694:EE_
x-ms-office365-filtering-correlation-id: f303e7c8-1a2b-4d4a-9d37-08db9c9a86fa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8GFLli7fZetMbMiR3j1ooqzc7r+Rx4K0zgrD7IeJGBNBZ2BC2EtcIh+uQLqzdlq+deSH48U7bhNdOMxGDYVjPrABs/usrxZfgPfm/hOC3foAnov2Dg7+qvS2SsFYhiNxdmjggPaSTP6V3iPZllOHxmnlJfpWqHjoeInfJedNWlSaGWtoQmNaAl6FKIcRiXRx3Xf/0nH9X2RiP7zfryKvex1Z9gNyqfd/Y27XsL1ezQzoS/8WqO0X/sMbtY/mvgXaiWbqRHqqv5SIMa8GwHz9bpfifKcKkbRPtYb5pTeSdKD9iu2lUA0KuJZrmvwznRoXH67j+dGRRz06qH4OO1587cAG88BfthxGyTLjJnC71UXjuoYdlIq7ZkwhSVcFOIaGXzP0AUBh4gEhHGf4nUHPrlih7NTHJhHZpGRJhA2j1X3MvOR/Gb6S/+NbFk337PLC5pgCBFeLSpMqag5p7dQbGBR1oJvM2xW9DORZBQZwCQqstCiPtlE2X2RHljephgCCBvKPy9ISb+9AOwJL5qo1Vk3OISxuj9uiD0I2JdG7EwPc6sVwQiutVzpixXc7ujY7DSiUoy1nR+zPPjg9rmxeg3ZSFfk0XzOhPgUF4Afzu+0lEJXWzTEsA6MQZw2l00Je
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2619.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(136003)(396003)(366004)(376002)(39860400002)(1800799006)(186006)(451199021)(6506007)(53546011)(26005)(8936002)(41300700001)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006)(8676002)(316002)(9686003)(83380400001)(71200400001)(7696005)(122000001)(478600001)(38100700002)(55016003)(54906003)(33656002)(86362001)(6916009)(4326008)(5660300002)(2906002)(7416002)(38070700005)(52536014);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?T8ydrTOgW3G3EhajlAuvLaRhdCZ67Og7EOvIRl++EsZb0Txj0ga6pr48gC55?=
 =?us-ascii?Q?wu1dtmM8Rk4mdoVU+kmEDiDpPrGQdeOjBm+AIHFq4+kHYVhEPa+2sGK1FaNY?=
 =?us-ascii?Q?mTjAplBWUxq8Pf1jiu8CYr9lO+ER+zkal153L3vIVn1wUZioyIvk3ZSWwEoo?=
 =?us-ascii?Q?LCkLTql+V19G59YO7+aTAGC1HLPVmkp+9l/7buNjr+mYEVA+MIqsKK9XIwGM?=
 =?us-ascii?Q?dbk9SqTlTUNVZTLqcfuic36RPy36rRKe7p1X1N2XVu3rcVFJyZwl/smLz94i?=
 =?us-ascii?Q?90OyP726tXYU31dnFEeDjj5Oil/mFxpAyp4IsKCDhVn/vq+UjsbhDqLwEIrs?=
 =?us-ascii?Q?/jsB++QwxS9TbdgiRzNw493Kbn5jk7IdJTNmy4WmiWP2teikCUDc3onnPaVa?=
 =?us-ascii?Q?jAwbcn962Otn1r2GsbbgmMTRg5+UK4bCQCLOjNMkng0dk5ik5iirUorvpzg+?=
 =?us-ascii?Q?cA4oTJ57Nku6ZEDZtgSlJaUhz3WRWNb7klixDWFKz/uzQRTspyi1OiRUhRdk?=
 =?us-ascii?Q?5afQ3FQf1Ua3+rtdjTlPKBT3PCKfAJ6UYyDqkdb6ZneBuXj+qhA451Y9Xo61?=
 =?us-ascii?Q?v5BV1oPeyvI3fgzeGUQzkFYUoOitrLMX+0O8V0Wp37nQGtKRrv8yVLQB1QT1?=
 =?us-ascii?Q?b7sgcT2RRL9pmLE+HiEVBUEPFbC00fqAsDgETCmS/6ESz9i20Rs/Yr9158/8?=
 =?us-ascii?Q?MIiQA/BPIsOowJv1pb4fkDFuI2z/TDpozNlnPQouUL0WrzImmqhSiNREWGl4?=
 =?us-ascii?Q?E4EcMmbfExHkJ4aov58hbGqjefOfgBnjwW7GDm0O7NgpMRCKCDWYNAw09Lcs?=
 =?us-ascii?Q?xsGsaeHe25cYfCrGacVTb0ck9DYQ9JbHDVsvSKZjmg5EJgwyawdwIKg41u4E?=
 =?us-ascii?Q?DeK+X3xUpP/GAuhSr6otI3Rgmna9RWy7/ESJC4bs8YTzANTREsUL//AP8CI2?=
 =?us-ascii?Q?ulwfxUo2wjHYl8TW60Ukh0OCyuZaHz16ZBrnO+TLL5ATT2rFi4S3KpTNYqBr?=
 =?us-ascii?Q?Q/iuQQGeTzUCiy3C25VyDQePLn1XYZDxcxmuET0G3siPi/rNDWtQe0gJwAv5?=
 =?us-ascii?Q?EblfAVSgSzdSlhsCBlM735bUBlI1Pu9iE8NCosJSEoKdMQfy0DIVLVx0yBpd?=
 =?us-ascii?Q?uLjOJpDmk5oIQ6LRLU04fQAFhlmJf1DuK/VbZcZWNH7YGgHPUSfRhL+Zs/aV?=
 =?us-ascii?Q?0WPS6aPvBZPIm+WWbm2CCdxAwkr4rrV08h/jsacqZiTO4hCx7l3WOcMpFtNs?=
 =?us-ascii?Q?9FcxwYwIwD9iAZPrHjijhoxOIMZWZthwqylOrX0EVaBQrDZISP/DJv7A8X15?=
 =?us-ascii?Q?NVKBpRiOvdcsH1V4K+r0OA8/GHfQtzcH78Sk3nhY6jEV2TwI6w0qNj6jFrSV?=
 =?us-ascii?Q?elNtJZHo0WIWtL3D61kquFDM3TCy4tJxqRnB3lSTVe8LBxVVSxKcw5rWAJjY?=
 =?us-ascii?Q?o+8TwnjLZ0Bf3p3ryfQbyJiTTOw2LUlXG5IoD7EJ0UCsLufsu69UBkThu4Wt?=
 =?us-ascii?Q?P2QKj+gi8oaApaPn382YnHqDWb7SkdfnKu/CSyB3epp9RvXnvUJundwvqC7L?=
 =?us-ascii?Q?mY7c0LI4dgwDModjSwI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2619.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f303e7c8-1a2b-4d4a-9d37-08db9c9a86fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2023 07:46:10.6428 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3qDDNDPjlC8m0GfXSN+AYeI09M2nwDasViMuZ+4+NYqtHq8/YRykSAe7x9lN4SRE
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
> Sent: Friday, August 11, 2023 5:38 PM
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
> Subject: Re: [PATCH V8 2/9] drivers core: add ACPI based WBRF mechanism
> introduced by AMD
>=20
> On Thu, Aug 10, 2023 at 03:37:56PM +0800, Evan Quan wrote:
> > AMD has introduced an ACPI based mechanism to support WBRF for some
> > platforms with AMD dGPU + WLAN. This needs support from BIOS equipped
> > with necessary AML implementations and dGPU firmwares.
> >
> > For those systems without the ACPI mechanism and developing solutions,
> > user can use/fall-back the generic WBRF solution for diagnosing potenti=
al
> > interference issues.
> >
> > And for the platform which does not equip with the necessary AMD ACPI
> > implementations but with CONFIG_WBRF_AMD_ACPI built as 'y', it will
> > fall back to generic WBRF solution if the `wbrf` is set as "on".
> >
> > Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
> > Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> > Co-developed-by: Evan Quan <evan.quan@amd.com>
> > Signed-off-by: Evan Quan <evan.quan@amd.com>
>=20
> ...
>=20
> > diff --git a/drivers/acpi/amd_wbrf.c b/drivers/acpi/amd_wbrf.c
>=20
> ...
>=20
> > +static bool check_acpi_wbrf(acpi_handle handle, u64 rev, u64 funcs)
> > +{
> > +	int i;
> > +	u64 mask =3D 0;
> > +	union acpi_object *obj;
> > +
> > +	if (funcs =3D=3D 0)
> > +		return false;
> > +
> > +	obj =3D acpi_evaluate_wbrf(handle, rev, 0);
> > +	if (!obj)
> > +		return false;
> > +
> > +	if (obj->type !=3D ACPI_TYPE_BUFFER)
> > +		return false;
> > +
> > +	/*
> > +	 * Bit vector providing supported functions information.
> > +	 * Each bit marks support for one specific function of the WBRF
> method.
> > +	 */
> > +	for (i =3D 0; i < obj->buffer.length && i < 8; i++)
> > +		mask |=3D (((u64)obj->buffer.pointer[i]) << (i * 8));
> > +
> > +	ACPI_FREE(obj);
> > +
> > +	if ((mask & BIT(WBRF_ENABLED)) &&
> > +	     (mask & funcs) =3D=3D funcs)
>=20
> Hi Evan,
>=20
> a minor nit from my side: the indentation of the line above seems odd.
Thanks. Will update this.

Evan
>=20
> 	if ((mask & BIT(WBRF_ENABLED)) &&
> 	    (mask & funcs) =3D=3D funcs)
>=20
> > +		return true;
> > +
> > +	return false;
> > +}
>=20
> ...=

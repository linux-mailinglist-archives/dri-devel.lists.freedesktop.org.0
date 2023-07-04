Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 569657467E0
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 05:24:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36E1B10E273;
	Tue,  4 Jul 2023 03:24:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2087.outbound.protection.outlook.com [40.107.92.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E5C410E273;
 Tue,  4 Jul 2023 03:24:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T27jCgJwYGr19UifPxbdDJK4uLp8lXJMyIKKWadoHfHmNG0dNzGO+JZPvzo3xgHUlh7lgtjPANHl9JT9bEDNIWe+NrhNXnhJsiy8JcItXazj6Ep8gyHejTA/BWL/tu2q4E4Fpz0ESviky8xhvjy55zEJAXgYJ/gowDo4hpGMtOLi1BgRZViQN+N6SohFWwR+Cl1CPRrqsMvMkxWlVaM00OlTHcSL8VqTcWIWusTl1iccdfeAlTUri5/PkkkgoBI+g+YJq6a7fj8+TUhsNa41s8CMOOr/ui/hTe9r50Gyqu+qnPA/JVzpMniGURI7DJ+v3Bob3MlZXclWsn1Ft2Z2nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xUtuA9ZShFQfyeHWAfDe+CjDl+kY8+Fbdju7Z5mw0xo=;
 b=H605SODf6Q5lZxkCdhfX+16baS4B4CrKlrY8smrtx3h4KIOnIO3j3SSDk920UIznXYvGTxW5SAbWmKJdzsvD2n3SyhfhlLnx3iyGU67MUHQBtbM8Ji08p3hxJjmOu2trJ+xX65IVnP1WwZlY3DujVyoDHTlk2bT5u7BPxCUL2W/ljdwQSaCoPQ8r7wfelaZl7I7/6NmFXDUwEtxCe4FiVX+QnwkGF5LHFfeRYKNRX/ZXeQ+BPtXKj5rohldmNQItCitZRensgN2kdIhFAiBCwDz+Kz/jz6kM1jTSn9u02K03X+ytjK/fXIZ1hlK25TUVuvKO783uT78fcty4bJtmvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xUtuA9ZShFQfyeHWAfDe+CjDl+kY8+Fbdju7Z5mw0xo=;
 b=SM3MlNAwFiEzOLafYXhsyzevoDJ3WgbZUiEC1pgYOAyKUUZn6kZDdRC6ZtKIjQkk08A2820GdPGteNcqTDx9a3gtJedZP7Wfj8FJzk7FyHCsK1eJ7uKX7wgDCUGcCvh3o8Bc8/kTapX6mZ7DuIJb17ObFXJO6oyv51U3NVntWN0=
Received: from DM6PR12MB2619.namprd12.prod.outlook.com (2603:10b6:5:45::18) by
 CH3PR12MB7500.namprd12.prod.outlook.com (2603:10b6:610:148::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 03:24:29 +0000
Received: from DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::3bef:2463:a3e0:e51c]) by DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::3bef:2463:a3e0:e51c%4]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 03:24:28 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: Andrew Lunn <andrew@lunn.ch>
Subject: RE: [PATCH V5 2/9] driver core: add ACPI based WBRF mechanism
 introduced by AMD
Thread-Topic: [PATCH V5 2/9] driver core: add ACPI based WBRF mechanism
 introduced by AMD
Thread-Index: AQHZqz52T6YCQrNClEekLNE2cM7+3K+kFdIAgATesgA=
Date: Tue, 4 Jul 2023 03:24:28 +0000
Message-ID: <DM6PR12MB2619198AA122E528AA22BF9EE42EA@DM6PR12MB2619.namprd12.prod.outlook.com>
References: <20230630103240.1557100-1-evan.quan@amd.com>
 <20230630103240.1557100-3-evan.quan@amd.com>
 <4b2d5e30-1962-40f4-8c36-bfc35eba503c@lunn.ch>
In-Reply-To: <4b2d5e30-1962-40f4-8c36-bfc35eba503c@lunn.ch>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=e99396e9-cae8-4f9f-9c39-028889d0f4e7;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-07-04T03:13:28Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR12MB2619:EE_|CH3PR12MB7500:EE_
x-ms-office365-filtering-correlation-id: c60e702b-d397-4085-93ca-08db7c3e2d08
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lrF2CCgnArI+cfAe0iuBh+TdLTPZokexA5yCd8yCOwQ7LpeofmkK1UJ8QgANvrSIGs4VqZX5lYhsWOdjQoStt3P6Mt6lUocjYzQfNXk+Lnh8O4ZXvGNydzAgNSnvkpkNcJL+m9gjWoOKqpcIKCTMkQlXF4zMtugOCP9SGuhcin7xfC7OmbWCgkdNK92YtNSMuxBv9F7WAHkZCAywHdrIC3Z60ksHproGkoDLe/beuKRMwW6J+gGhkf2SA2/XKn+8zc1yM4bzkPMVCy2g6hykXMFQsJqdz7nQ5ZNig6+Vq/tUE9xyq6/6iQUGoEYOD5EhSJb8wYDR+KI00BAOWoBWgxNM0vxcbDCPoA5AKrM0ugRz3op4dcwLI+m+H5QW0saBucLq1F5Eo7hBliIlza2wPXBhnbj4QI9ZkctpP3zczKLPEeQYuyVKJ8eQ0de7CLiqgkNdvpco5S01Ig4fLbODP19g2QlqQCAx4h1mUp1Nu94nudvucUIY1adRtjORsMuxUIXoGF9oixicgM58Z2mq4zAR836WQWtjChLEmG1k++5Gg6/sRr4mm1ezEs76M4vTgsGwYaeA1NdmcTb5JHpFi2kCJCltr0zoX+zXwE1PuIhIjjRS3fWjW7wLRWfrYcAx
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2619.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(39860400002)(366004)(376002)(396003)(136003)(451199021)(26005)(478600001)(9686003)(71200400001)(6506007)(86362001)(186003)(38100700002)(54906003)(66476007)(64756008)(6916009)(66556008)(4326008)(66946007)(66446008)(83380400001)(7696005)(53546011)(76116006)(316002)(122000001)(5660300002)(8676002)(8936002)(52536014)(7416002)(38070700005)(41300700001)(2906002)(55016003)(33656002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?aliWxJl/Oc5OQ709UD4wY768uSF8WCn6Im2gzv5WoCziVg534QYnpC+LPIqs?=
 =?us-ascii?Q?DTvL7a8tgudeXeUL84fWphOjpsP3xnFQxqHFQf+gRzIl9lRWc+RaUZo6P3Tg?=
 =?us-ascii?Q?1Z+IjAdIKUxPDqDbmavFNLRdo51C24rSxH6xg6afkDDEmVEveMJMDcuphMwd?=
 =?us-ascii?Q?a1hdIZCTez0eaZbs7TFgFGkWDjKKr1QX31kYvNzDW5Y8knXVP3EDvymWB3oH?=
 =?us-ascii?Q?tVbSmMEa4ysOMZV9gLk37f0jjDqPDM69jmMSZ3e/YkOF5y/uaHME80e1vwER?=
 =?us-ascii?Q?r4zyBee9Z3k+KLGMB9KwH7bPmO7HRzAwf0JFS99+FQu+hqYm7aOOF2IesElO?=
 =?us-ascii?Q?yozdEqTVVmmPRAkEx9ZaOzZ7l46iWzIxajj9CtUBQF33vFpRQisqZIPf15CG?=
 =?us-ascii?Q?MR3RoZaQNMyEK66HDal/P+Cl0oyPqr4tyWrvkTmMvnArhkk+XMNZokVxx88k?=
 =?us-ascii?Q?bLd87OFLJP87PVFMklCvpY2+vPH8ukbAfRrGMtRxZR1Op88TEfo9W4CSLR52?=
 =?us-ascii?Q?yJ53DR4Unk+9LsjCsEa5U4AkoI/pnYi/4fqF9Pll0HazcGLpio1GgPZh/iKK?=
 =?us-ascii?Q?orPIhjHCMQ9w9dfDmD3t5TtUuphYpe78JzPKxMmoX+oClEkWq1eXpeirb/Ns?=
 =?us-ascii?Q?AvkVrp4my6j2rJ+QzJE/u65+gAFyEX3sXuQBMYVvMp/yiLTgVUibTFMxQrNn?=
 =?us-ascii?Q?XobAtE8NglAzKflYImmh3Ji95kl186CZmeHjsAugw3AxLRLdEtAiEKLQM34s?=
 =?us-ascii?Q?V0IIBYJD+9wwhiDTQZNwA44AgAn3MRs/45tWZ+cUIPLsAo7ICEBz+qsgf+79?=
 =?us-ascii?Q?aTLRvWLiCrBo0jHyfCXXRfVR4v3n35jsKZ/BCO/vQvDaTn685ce+PedrT0Tg?=
 =?us-ascii?Q?jbyUkic5lZ4usGHlTBLKNfzlZhOFfgcS43ajBAAz3+mASgrOCEdFv7JUCZou?=
 =?us-ascii?Q?YNGErqLt5yydqk4Z8vsVhpOW9FA9eLijWpvgt6ee4L0dzeBXXhc3y4XJ/cP/?=
 =?us-ascii?Q?n0eY/0x9HSdZlyhTvcVhYwoS8DcvdbqEJEqg18E/sSx7s48FE2kC7Db0nz0x?=
 =?us-ascii?Q?xvKnOlOyjMmVYZWIxk2Z3gcpRUt5RGPMjyuUALLuq/ym/WSG0Uo+d3Mxrq97?=
 =?us-ascii?Q?ADAcI2rqEPMdSNRuCdXRznB9VpmSDPWcCrRkUIV8ppSBIbR3WYE/oUGjcyij?=
 =?us-ascii?Q?CphO6oofJ/5+sGFzZIKGTDXO0H2XHZLxdKX7fLxmWDPPCGNoObFnsPPZtqco?=
 =?us-ascii?Q?58Vy7bK4Jw37M0M0DeOiIpPi/Y3OV+NtWUz0G3kVZMYR/zSxcPcQNt+9tdyk?=
 =?us-ascii?Q?goTibGhyseeSt58uUfNs4rlhp9r0EAqx1VPOrG8uMXBnV+fpUoI5bXf17va4?=
 =?us-ascii?Q?Z6CnHKGpeb8wHaCMZFMnZV7iopJmiNZs95Q3BfCVSmrECIsObPi70yCk1jDq?=
 =?us-ascii?Q?LcaXBWcJWoeEG9Agpdjr2EK4eO/jTGwKqGW2Gdfc8Mk8Vsc0hq1pQ6sNMpey?=
 =?us-ascii?Q?I786q0lm8JIzM5AqQR+NV0DqFhdaKlBrT5v1mYFujWDGoGU2BFReTrhvMSkF?=
 =?us-ascii?Q?8QjDMWb56R3eKfxpA2c=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2619.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c60e702b-d397-4085-93ca-08db7c3e2d08
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2023 03:24:28.7857 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HWL/C1ni54KneQf9fVP/SkVLABvWz5cFPjc8V7Nbmt4NcQgC0CnLN8KwaHYodixM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7500
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
> Sent: Saturday, July 1, 2023 8:51 AM
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
> Subject: Re: [PATCH V5 2/9] driver core: add ACPI based WBRF mechanism
> introduced by AMD
>
> > +   argv4 =3D kzalloc(sizeof(*argv4) * (2 * num_of_ranges + 2 + 1),
> GFP_KERNEL);
> > +   if (!argv4)
> > +           return -ENOMEM;
> > +
> > +   argv4[arg_idx].package.type =3D ACPI_TYPE_PACKAGE;
> > +   argv4[arg_idx].package.count =3D 2 + 2 * num_of_ranges;
> > +   argv4[arg_idx++].package.elements =3D &argv4[1];
> > +   argv4[arg_idx].integer.type =3D ACPI_TYPE_INTEGER;
> > +   argv4[arg_idx++].integer.value =3D num_of_ranges;
> > +   argv4[arg_idx].integer.type =3D ACPI_TYPE_INTEGER;
> > +   argv4[arg_idx++].integer.value =3D action;
>
> There is a lot of magic numbers in that kzalloc. It is being used as an a=
rray,
> kcalloc() would be a good start to make it more readable.
> Can some #define's be used to explain what the other numbers mean?
Sure, will update accordingly.
>
> > +   /*
> > +    * Bit 0 indicates whether there's support for any functions other =
than
> > +    * function 0.
> > +    */
>
> Please make use of the BIT macro to give the different bits informative n=
ames.
Sure.
>
> > +   if ((mask & 0x1) && (mask & funcs) =3D=3D funcs)
> > +           return true;
> > +
> > +   return false;
> > +}
> > +
>
> > +int acpi_amd_wbrf_retrieve_exclusions(struct device *dev,
> > +                                 struct wbrf_ranges_out *out) {
> > +   struct acpi_device *adev =3D ACPI_COMPANION(dev);
> > +   union acpi_object *obj;
> > +
> > +   if (!adev)
> > +           return -ENODEV;
> > +
> > +   obj =3D acpi_evaluate_wbrf(adev->handle,
> > +                            WBRF_REVISION,
> > +                            WBRF_RETRIEVE);
> > +   if (!obj)
> > +           return -EINVAL;
> > +
> > +   WARN(obj->buffer.length !=3D sizeof(*out),
> > +           "Unexpected buffer length");
> > +   memcpy(out, obj->buffer.pointer, obj->buffer.length);
>
> You WARN, and then overwrite whatever i passed the end of out?  Please at
> least use min(obj->buffer.length, sizeof(*out)), but better still:
>
>    if (obj->buffer.length !=3D sizeof(*out)) {
>          dev_err(dev, "BIOS FUBAR, ignoring wrong sized WBRT information"=
);
>        return -EINVAL;
>    }
OK. Sounds reasonable. Will update as suggested.
>
> > +#if defined(CONFIG_WBRF_GENERIC)
> >  static struct exclusion_range_pool wbrf_pool;
> >
> >  static int _wbrf_add_exclusion_ranges(struct wbrf_ranges_in *in) @@
> > -89,6 +92,7 @@ static int _wbrf_retrieve_exclusion_ranges(struct
> > wbrf_ranges_out *out)
> >
> >     return 0;
> >  }
> > +#endif
>
> I was expecting you would keep these tables, and then call into the BIOS =
as
> well. Having this table in debugfs seems like a useful thing to have for
> debugging the BIOS.
I'm not sure. Since these interfaces what we designed now kind of serve as =
a library.
When and where the debugfs should be created will be quite tricky.
>
> > +#ifdef CONFIG_WBRF_AMD_ACPI
> > +#else
> > +static inline bool
> > +acpi_amd_wbrf_supported_consumer(struct device *dev) { return false;
> > +} static inline bool acpi_amd_wbrf_supported_producer(struct device
> > +*dev) {return false; } static inline int
> > +acpi_amd_wbrf_remove_exclusion(struct device *dev,
> > +                          struct wbrf_ranges_in *in) { return -ENODEV;=
 }
> static
> > +inline int acpi_amd_wbrf_add_exclusion(struct device *dev,
> > +                       struct wbrf_ranges_in *in) { return -ENODEV; } =
static
> inline
> > +int acpi_amd_wbrf_retrieve_exclusions(struct device *dev,
> > +                             struct wbrf_ranges_out *out) { return -
> ENODEV; }
>
> Do you actually need these stub versions?
Yes, these can be dropped. Let me update accordingly.

Evan
>
>       Andrew

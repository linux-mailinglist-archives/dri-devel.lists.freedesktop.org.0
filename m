Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFBBA9F459B
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 09:02:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F1E010E1A7;
	Tue, 17 Dec 2024 08:02:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="CJhoCKd+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20631.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2619110E1A7;
 Tue, 17 Dec 2024 08:02:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HRtAUCHQDc/6ihqhJXxMqbg4K+legaIZF1ctsUpL5Krzmhc8khB81v42BRPt4TAzqX2ENTJm+/NBg8yjdXksf86BUBhb12BRKOPkv2HGM5asN7k3LzJ0k7Zxgsnh1EijCv94qfz/v5t4LIvIHNeqP/BtFwn+YiT1/XNZOez38WLY9gP0TDRPLyqcypNttcu4SmaUfD8KNY3AlNxZpJR26g+E+3vJkg6BJYznGOK1Lq/PGdkE63pZnjbI5b/nbaV81dvKy/6dEK6OyCXzQAdGh4CpUYgQcxKe+wofN0D56YGB6vscipQEGWyWaFNkgNJc7z2dZLrxPu7vFJFh9/h/Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JEOqSimkHgicgiy/5kLSLopg4A3q4zDltc2XBlJ7GLo=;
 b=re3gVuwptHDnrpZWzLoD2Ph/8ZtauMcWLdKLYKOGBrZkny3qp8QjkU5I27P/tcGqbBcoBqFo/7pF5e4kexTTiZp7Mb29I3qOeC6hqSIyMowL6PLXMSQGNDzPCm+eLEULCCJwQjasmCA8M54J6JBh4CiGy47/Jhx4bZTuUutPap4stpL/Ts/II9guc6Oj0DD8w85OANDmq8n7GHN7J63Hnhtbweu6Y+Acpb4rwN5tB9+LiAboAmHG7vVy3SVWbkgVSuJkiIDKTTU/WX+Ww+5QwgwOlgMapJ6VFpoAJ0BXi1lS7/kyr5nJUITbWRKaTj4kn2HQ40dQqO91JQ2P9nFkyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JEOqSimkHgicgiy/5kLSLopg4A3q4zDltc2XBlJ7GLo=;
 b=CJhoCKd+PPIgL5kY0jsW8YaHiEOj7pNGHS1MsXvV3RBhUELg1nMJwLI3GyYvGFIINI+xsAL+BNJ8/Htt/h1kofYWsA1XnZaGD4D+nfWX+VZ4GeIYAqKFsVkn2SYeG0/dzFIQg8aYO6v98OwE2+kZpjWqE7SengcXlN76F+jyGaE=
Received: from CO6PR12MB5489.namprd12.prod.outlook.com (2603:10b6:303:139::18)
 by PH0PR12MB7864.namprd12.prod.outlook.com (2603:10b6:510:26c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Tue, 17 Dec
 2024 08:02:39 +0000
Received: from CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::5f4:a2a9:3d28:3282]) by CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::5f4:a2a9:3d28:3282%4]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 08:02:34 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
To: "imre.deak@intel.com" <imre.deak@intel.com>, "Wentland, Harry"
 <Harry.Wentland@amd.com>, "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
CC: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Lyude
 Paul <lyude@redhat.com>, Karol Herbst <kherbst@redhat.com>, Danilo Krummrich
 <dakr@kernel.org>, Jani Nikula <jani.nikula@intel.com>
Subject: RE: [PATCH v3 04/11] drm/dp_mst: Register connectors via
 drm_connector_dynamic_register()
Thread-Topic: [PATCH v3 04/11] drm/dp_mst: Register connectors via
 drm_connector_dynamic_register()
Thread-Index: AQHbTCDUG68fePxi8kyFnkD2FE89YbLo0niAgAFHv6A=
Date: Tue, 17 Dec 2024 08:02:33 +0000
Message-ID: <CO6PR12MB54899E3C8EAEE8300DCD905EFC042@CO6PR12MB5489.namprd12.prod.outlook.com>
References: <20241211230328.4012496-1-imre.deak@intel.com>
 <20241211230328.4012496-5-imre.deak@intel.com>
 <Z2Ab14yzMJNoRNE8@ideak-desk.fi.intel.com>
In-Reply-To: <Z2Ab14yzMJNoRNE8@ideak-desk.fi.intel.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=9407b489-bfab-41de-a921-8a043f79a84e;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open Source;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2024-12-17T07:57:09Z;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR12MB5489:EE_|PH0PR12MB7864:EE_
x-ms-office365-filtering-correlation-id: c9f61bed-16f2-4c0c-6d05-08dd1e7129f0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?27CgyPDNJOckWo3wbizyFwTdMmRxRiuPNwoM08/XiCckIbtoJHSLaRWCzVEx?=
 =?us-ascii?Q?DBsxdCHc9qcpdoNDQNGJPT6keS+8XQyknFBG5KuczJwBh3vRjsbIGHo4YZhg?=
 =?us-ascii?Q?AxrWn8SSfKqwQWMfbELhhX67j5ceTpUAzRMYkgwFseTnq+Qdor8tI7GdLq1R?=
 =?us-ascii?Q?uW1/P16KYwBhnablGJExA6CYwPX9AleYv3Z/I+pgAVI8S2NFuDl3V66aipGs?=
 =?us-ascii?Q?lW8xKJZwYlE0MPmAalgB/85FOmPAl51B99b4BBXfF+IdLn3LyJDOJokjcDjg?=
 =?us-ascii?Q?SFdjrCcWHNm85zuuZoExVBtVjj6v4u74ggY7t1kbEmXv5zmQI8VuIiqIu8AR?=
 =?us-ascii?Q?trA2h8VsDn+q+Ali5Kp9v+EpOXBG98ngIvcOXIXqtuFKoVRIBL7oSPH1VxhQ?=
 =?us-ascii?Q?ZQgDyrNrBKzZNKUBaDmmlrE/U+WduEQ2wshXb/gX2ISuTCkO95aT8+JIwrt9?=
 =?us-ascii?Q?PBWEWwj6KeKoC28TioSyprffWtHAf1n53A6BA24mTpW2Jp5DlNgvJ7WHxdi9?=
 =?us-ascii?Q?I9C64+OwbW16mIsZzgqUfuP4/kYIgV2M+/dFKx3/fzgePorKh0AStxKv53mC?=
 =?us-ascii?Q?VeYiXv+unqa81FOnHe930J+T173yi6aZ8ww8f6tlno46zWQ4RUf+OauSKAqr?=
 =?us-ascii?Q?DPILxuhqsBYrNaatxu6jsUxk1DBYyvJirCyFpuFQjkRuXh6RU4JDLnd6g8VU?=
 =?us-ascii?Q?WSQTKqbuHYnb9oEjvyXEr2+H7rmcFwUbqKSjKbya3529jHL3jxm8OgfKwm9k?=
 =?us-ascii?Q?fnAPZ+q+TYjixmlgiqsZ6dNQ1VJk4D7vmkCHrWy8ubmTLtiPPThr7g6EpibT?=
 =?us-ascii?Q?5kZrxw8VHxeCF72GyUc0GuTNSM6qnwMDD2F5WersFFABv9zhND0I79ZFnrCM?=
 =?us-ascii?Q?ZKTR93QrbEEcKKy//5DRfIFIVBn5kyziaNOvBUHhemKshG/CJySe1sJcxhnA?=
 =?us-ascii?Q?j2Y2JLsJti9lpKj6e8/20zEWFfebwllWig0sJFMvokFAj6JjtgC3KVg4JzYa?=
 =?us-ascii?Q?mpBi48M6PLQoy4hbQ+TiN9q+8uNdVkJsUQJ9WiH3RCB5GjUt/UBZ/HmxEog7?=
 =?us-ascii?Q?LJ2yW2RF+E50kK5csfrWeutnj1iDoZRiBFu7qafLyhbCAa9SHHFDYDfUWF/Z?=
 =?us-ascii?Q?RNt5ct7XggO16b6E5i4Rnwc3oTUj59mY3+Xa1DWxE6SxZgVkgu+v+7qMU0Om?=
 =?us-ascii?Q?T8XbyIBLJ0xlEruC5RP95638LZa7DDS7N7tNpputi+h05VOnf1zSXio+6+Ma?=
 =?us-ascii?Q?BAqswvHJDiTxAsdnpBzw0q1I1dyiYCZv5BEJLyZZQGmZ184PUv8uI1RCwVLd?=
 =?us-ascii?Q?HmzfhfHiC9uGQ+1BkA3GotVBKFQuuOG6YGz4MqoY7uohCqY0BXrdyLQo/Ji/?=
 =?us-ascii?Q?hjSa5tfRIuGiveWwz1hgvJd8jYtZLRGDdY658gg1YRA29DqJF6rgTOB3n4n4?=
 =?us-ascii?Q?3lDvVDnz+5vSucKcFbEtoQKNjpQPNNwM?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5489.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?MP+Gk+62zOpdXP2rKG/QKbGVgUwjbBk/keF2ZwsG8Jthb3bkZ/DLb7eo/pbG?=
 =?us-ascii?Q?bxq7yPOi37pSHaps4BNA4/U7I5rE6bk9+kdacrrSeL5w1ZbGDQDopu98m+SQ?=
 =?us-ascii?Q?4Vf3THokcTn6J8wIigg/o0g9XDbq5Ilj21XenW1rwKeqck3QdttmzPtpWyFQ?=
 =?us-ascii?Q?yQnHiS702lAeZmlF7+W6AC0zBk3ni/NkVez7jUpMLUK6J4HwZD14h065iTek?=
 =?us-ascii?Q?zXIgGuOFFkkisn0iw1mUG4JCSze9fKzE4IBAAP/nLjh8CYyFEWhpVkL4t5e4?=
 =?us-ascii?Q?yv0j+Fto8plQHw9Aas6yUKt61lf/69LbaDNHoH5g0dbFUOcXjfIJz+XRL/01?=
 =?us-ascii?Q?KpKpStpv9EGv1MIAL/ayHAH0S3oSqqMf05zWIaoHVxXmecjvnHEQuTdqoqRI?=
 =?us-ascii?Q?7QFqxWg4VBSOy801fU1mMGAHcspdVw2NOovDg0uWHn+q/t20HF4NbToLMU2Y?=
 =?us-ascii?Q?cmbjnXCtiBpEe0L5f3Lmpc100z5MUNrKsUc6H4h+nHfw1RgePILq3sa5j3k7?=
 =?us-ascii?Q?5//EHgpzfaMjhyi9Wc+7d6F9xyH+hlc/itQwto8+htq0i83fhyqS83u0bnQu?=
 =?us-ascii?Q?PHXKVUbhe9XBQRhklj1fum575QvGj57UwG2/dUaA5VDZjUGBUL733cmpwbxB?=
 =?us-ascii?Q?+oWt+/hDDJ2d3LUYXIvIFMgeXbZV2X2iDan7u/ziKW+7K2Kdv7rD9yEPufX/?=
 =?us-ascii?Q?Ew/vcTu3VtPMtRCmxtH7tCXV8NL6SkIHwDa2EoPk4DfGqUK/Tfu4oZjubnLF?=
 =?us-ascii?Q?6MSprQ01zRCun6VA+SfpSduNllsCF79EcKmmAVTAJ74O+EElNaOfCKW7v5Wr?=
 =?us-ascii?Q?Vu+iKCVnAcC2jTrnCZn0Hkt3RuOdagsv2bjJnHXclrzsKxE/TfODUE3c1H38?=
 =?us-ascii?Q?IHGWO9bI443ddTy8NGIV+RUzoCCuWJcWtTMveVUu33VymXpxrAGe51fNwGjc?=
 =?us-ascii?Q?0tMZLPoZUwKmmNmB9buxd5dM0cOlM0CtUVIwn6ec+lzE1VyihdOGDHy59PSr?=
 =?us-ascii?Q?jE/+7EYNfUwoy6u0WGl24p48xT7cH1DfAqWpBqNNcU6Er7q8+w4F/7+Yiv/P?=
 =?us-ascii?Q?Ue9MhyhlLa2ag6hjqT82XAh0U/UfDrTkwx7xIZe+DBqJtyuGQJodkKkWBFOD?=
 =?us-ascii?Q?pXSaC/yMJBCIfaksnHBB4iMB3XdX1aAzoB0t/4sqWYwp9nPHOUQGLpP41JR5?=
 =?us-ascii?Q?kRCWd0ibq4Dw3nJGZgzvSOC3/p+7dolshgAI5zlVua4ovHUU8gjhebahmDha?=
 =?us-ascii?Q?VFU3Dpf78Ka8+qW+Ued1v1UClyJD3ulpz5ILrhUokP1N7pyFm+C9buutEsBZ?=
 =?us-ascii?Q?p97mOEEXmO2GkfYdEGHOTWgR/OKkVux6Q2b2Qnv1NwNDrmKykxn9T66MyDb4?=
 =?us-ascii?Q?kclYLZ8hASKiBfRCREm8hzxSOZqUzJB9gtXFlvEJq60aaQaAuSbw3L86tJuL?=
 =?us-ascii?Q?5zayXN5sEgYhXNovS9yfSAKQ22UuBIkd3QfQAySfwuG4K19WyqX9Iir1cZH9?=
 =?us-ascii?Q?df4QRRN0TRXFH675PIin54HmzK7l2c6VDQB1B8o8uhaoAmjiMPA/JNXKmvjR?=
 =?us-ascii?Q?cYVQukCs9U/AWKSNYDA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5489.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9f61bed-16f2-4c0c-6d05-08dd1e7129f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2024 08:02:33.9860 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SOjBfOhyYc5/rTO5iKGF7wrlZxmXkorh7txcUJryYSAgQcF9ppGyddVJWlxF2VUjfuX8VxkEROnS9jU+poCnaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7864
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Public]

Hi Imre,

Thanks for the patch set!
Patch 1~4 & patch 6 & patch 8 are:
Acked-by: Wayne Lin <Wayne.Lin@amd.com>

> -----Original Message-----
> From: Imre Deak <imre.deak@intel.com>
> Sent: Monday, December 16, 2024 8:24 PM
> To: Wentland, Harry <Harry.Wentland@amd.com>; Li, Sun peng (Leo)
> <Sunpeng.Li@amd.com>; Lin, Wayne <Wayne.Lin@amd.com>; Deucher,
> Alexander <Alexander.Deucher@amd.com>
> Cc: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; Lyu=
de Paul
> <lyude@redhat.com>; Karol Herbst <kherbst@redhat.com>; Danilo Krummrich
> <dakr@kernel.org>; Jani Nikula <jani.nikula@intel.com>
> Subject: Re: [PATCH v3 04/11] drm/dp_mst: Register connectors via
> drm_connector_dynamic_register()
>
> Hi Harry, Leo, Alex, Wayne,
>
> could you please ack this change?
>
> Thanks,
> Imre
>
> On Thu, Dec 12, 2024 at 01:03:21AM +0200, Imre Deak wrote:
> > MST connectors should be initialized/registered by calling
> > drm_connector_dynamic_init()/drm_connector_dynamic_register(). The
> > previous patch adding these functions explains the issue with the
> > current drm_connector_init*()/drm_connector_register() interface for
> > MST connectors.
> >
> > Based on the above adjust here the registration part and change the
> > initialization part in follow-up patches for each driver.
> >
> > For now, drivers are allowed to keep using the drm_connector_init*()
> > functions, by drm_connector_dynamic_register() checking for this (see
> > drm_connector_add()). A patch later will change this to WARN in such
> > cases.
> >
> > Cc: Lyude Paul <lyude@redhat.com>
> > Cc: Harry Wentland <harry.wentland@amd.com>
> > Cc: Leo Li <sunpeng.li@amd.com>
> > Cc: Wayne Lin <wayne.lin@amd.com>
> > Cc: Alex Deucher <alexander.deucher@amd.com>
> > Cc: Karol Herbst <kherbst@redhat.com>
> > Cc: Danilo Krummrich <dakr@kernel.org>
> > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > ---
> >  drivers/gpu/drm/display/drm_dp_mst_topology.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > index 687c70308d82b..f8cd094efa3c0 100644
> > --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > @@ -2281,7 +2281,7 @@ drm_dp_mst_port_add_connector(struct
> drm_dp_mst_branch *mstb,
> >             port->cached_edid =3D drm_edid_read_ddc(port->connector,
> >                                                   &port->aux.ddc);
> >
> > -   drm_connector_register(port->connector);
> > +   drm_connector_dynamic_register(port->connector);
> >     return;
> >
> >  error:
> > --
> > 2.44.2
> >

--
Regards,
Wayne Lin

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C96A7467CD
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 05:12:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 013F810E26E;
	Tue,  4 Jul 2023 03:12:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCFEE10E26E;
 Tue,  4 Jul 2023 03:12:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WpwqnlO6yIf1LW8C98Ez/TPHf6kkktUsc466/7Xdpm6o6GfvJ9vWH4ob6ZbvstLvDuyjHbeYYA+rUDOJKuUGO2mOd3LcQo7CoPpiJDRHh26V45lsGNQ1vHmT4Rzeb8I7SoY0SmtWsXZbVhxX7vxWwISEIi0uZeH1SzpM3wDvQ5x71Ejf1sQukAflYT2Js0H2HzCFlJ6POO538mgDg7BpAXJYYm1+JIUWPAP8Gj+sQaCBYaVGr6mKUAjufycXyj8zrzAv0G3ztm9VZ7Of4xjCf1ur6BBAppeNOzNyOkr/2XzY+djudrVaOKjojQWYhPssn+kaXquhKVLNHm3vELORXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/I0YjmFORRcWScKU4dS+PZSXG2mwmEtb153yDfaDfEI=;
 b=D/w9qjoN4pGs+5Vft3Vse1jl3XnUUWu10xOLySM/N/PaDqGjvZqWZvHAXI7aq9oZ4XxPud8wW4TijAIu3NrwSCQPWS84KGlBEK8NYoynqb0sASHOJST3m0PG5QLHatsGvKZurEzQ89cE6PN1g4FR2R7SRzVpPCEgmoTz4CFTAPufpPfkvAufEgxPK3yoK4xlgAKfJOLZxsqDtPeupPhsDq4i3OFJSd+DtNV0IUC0cq7ThCOauD7a+u8bCXNPJfT3Ucq7HXic9dGWtQ8fjm+x9ARob78uZImrgjCBuzzK6Z7jv0Y+zwOM1HA81m/nuJ70PDMlBWh2TRc9mU2saLv+fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/I0YjmFORRcWScKU4dS+PZSXG2mwmEtb153yDfaDfEI=;
 b=eyOTZ3eoSyhyOuC6fC/lzvRwayeO3fuL7iha3d19oiJ61KCxT/vQmrWB8kXqbjC4SQg/F5SqE+7g9AaKcmmuBaRY/WT0pXY17twaF/SR1A5OZ+6Xc1T4d49ufsY5TGQV7S5L4wmjz868+iOsCW2/zdxBl3D5dfuQsGiEJc8p9eQ=
Received: from DM6PR12MB2619.namprd12.prod.outlook.com (2603:10b6:5:45::18) by
 DM4PR12MB7695.namprd12.prod.outlook.com (2603:10b6:8:101::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6544.24; Tue, 4 Jul 2023 03:12:33 +0000
Received: from DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::3bef:2463:a3e0:e51c]) by DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::3bef:2463:a3e0:e51c%4]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 03:12:32 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: Andrew Lunn <andrew@lunn.ch>
Subject: RE: [PATCH V5 4/9] wifi: mac80211: Add support for ACPI WBRF
Thread-Topic: [PATCH V5 4/9] wifi: mac80211: Add support for ACPI WBRF
Thread-Index: AQHZqz58lOnIu4ubzUSpiLI9KxUZ9K+kGN0AgATX3UA=
Date: Tue, 4 Jul 2023 03:12:32 +0000
Message-ID: <DM6PR12MB26193E8CC8B770D3569A5DEDE42EA@DM6PR12MB2619.namprd12.prod.outlook.com>
References: <20230630103240.1557100-1-evan.quan@amd.com>
 <20230630103240.1557100-5-evan.quan@amd.com>
 <3868dbae-79e5-470d-a144-0884659206d9@lunn.ch>
In-Reply-To: <3868dbae-79e5-470d-a144-0884659206d9@lunn.ch>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=6bbaeb71-92de-408d-9f4d-0c4ae63ccfa3;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-07-04T02:59:54Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR12MB2619:EE_|DM4PR12MB7695:EE_
x-ms-office365-filtering-correlation-id: e62f6059-917b-464c-68a3-08db7c3c81da
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WEuVbxJXWU0wiV0HXWTNirMS0rPBHI+3+bAxG5CpU12dbApGqqxF7ESU3bW+ALdaCz+yXiH373oh5Jf5XX52DN9yL+fqkjblESo2vDIt5Tx4VrAUeKtWCBPuiJOO6J4kHxpJ1vDrCq7pj54iRz8dPscydZwaZhUoReNMzSOlpxw7NYB9H9vW8yg//YHeBG7eg0rFnmkZ9KEs7+2MvHO4eXpw3pzFcjnMFmiWoioO3Yv/Tvikj+dZPTGRxr39i5qIlqL3HRd669qoSs7FObEl1hXClDSaIPa5AMxxPFEun7N12WZIpgmTWoqnuxeu+3kihoCZfTe0NGzBcAh48GCQPZL3i5M4+umkmaSZa0qlux3ytXN2g3HT+f5j/P2dp5KFLhEQYtKcD4LmwBX1NkrSqN+VIAotESHrHkHBy7+mCbBEdup3JTtY8kfWTk7fwT2hvsHO4pbTnIUYRbVt8kEvSWeMucWDZaprrX15n6lNiw7bGoDlzVq/PSPXVoqObcFth/bJKoabLXs4mDXZbf0yAmWJHjvKE00F0ox876WUta261uUSPpCnlwSxRcC9PzqtJaKkUX44IdgHH4sKQ3dGFtveSn8i8cThnp9bAN42FvG/0vnGtzGx3mMEl3wr+o+h
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2619.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(396003)(39860400002)(376002)(136003)(366004)(451199021)(33656002)(186003)(71200400001)(7696005)(478600001)(7416002)(9686003)(26005)(5660300002)(52536014)(2906002)(86362001)(83380400001)(4326008)(76116006)(66946007)(316002)(8936002)(6916009)(54906003)(66556008)(66476007)(64756008)(66446008)(41300700001)(8676002)(38070700005)(53546011)(55016003)(6506007)(122000001)(38100700002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3lIcMnQtjBpeRQ68A18Y7UitT09VIPkNKZKs7DM2lZ43x6nkugkvIRqq17V8?=
 =?us-ascii?Q?1YFq3WrV07cv1qiVbfBpZxPcToJmIoHKJY9tBv4EP/j8TomRvjCX77r3K7B6?=
 =?us-ascii?Q?oUsOEvR+qgSCHfSRe3cmCqVEZmxciw+ttBfbIvwsXDH06A0Mz1Ihzwl28wEX?=
 =?us-ascii?Q?TqDDKDWWafFDEsP/4rXRxhKpSOfUBLv9eAhm8bpGVFfxrzhSNODGNb85huES?=
 =?us-ascii?Q?LLu3vZZ96Z92schaFBFYqHSIqYBwJrbBbEh+7iEbxzwKKuto/6pSaPsndb2/?=
 =?us-ascii?Q?I4VwHTG6qd4lN+ukFyT5YhX/vzG783I1mnzwzPdUCHajAmcG+7WwUkZRMW06?=
 =?us-ascii?Q?i86eJB6WHpovz5tMACAyh4zOiTaeQDCJBbw9C428zTH+/vFBZbQMIykcRfFW?=
 =?us-ascii?Q?YWDofkO/ozeiY6HscSP5rAxHDRHnnOUEN37cXX+Zt3+Tn9iRQCG7OwzAYe3C?=
 =?us-ascii?Q?8KB7UlJq8jr8q4o5EVnh8JeedCOIU9+zj+SKe7OLxFZtnJSrrGKhMcpWv6LG?=
 =?us-ascii?Q?+WNaF8VHWIAe6mCrk3ZbIIgCqoUw9ZpS553ht/Zb70iBIjlgxrWs/vT5Inwx?=
 =?us-ascii?Q?ozbnxDLMG2ei+CV2nBtt/pWv4GwlCzUEMghS0QTrAqTZddeLSe75837qcVHz?=
 =?us-ascii?Q?2VbnDCxVB78Tt8VNqTPZqG7GjfNoS+T0moGDDpNr9S6BlJ7O9d/NGw3j2hgu?=
 =?us-ascii?Q?pQmD8/+I3aWskfp3AOrofTs2cJPgQMFv1JMq9zUYmU+Na0tMpEY+ZJqSNvAU?=
 =?us-ascii?Q?b4hxYOj4n3O8LrNHRYPPYQvZIHEJfMpT7V0uy3D4wrgw/aSe8k5WpDPFvKz/?=
 =?us-ascii?Q?IRghwY5ikBVOIrBWLZfMI3MZp1x+kUkIQ2FFmFBWb9lM1aoO0719aq3CNvpe?=
 =?us-ascii?Q?lR3egoUcfdPrDIW5LgFTlEHmOhLfqCvaqsl1E6eUGLgR2e8+lPdTnhBwp1Qt?=
 =?us-ascii?Q?Bfd7ypFyYjz6VGmdyuSZKNk9VmdMDE5xh4flgeK7YxNWYSUg+FM8gGXkeYGI?=
 =?us-ascii?Q?KC0NDiHdmH0SFEBCz7FbvXl7ES0j1vrIsgkNiA3lSFDgJI68fql7XKoWYvOK?=
 =?us-ascii?Q?n8Qzua+1rdZuvYktGUbpMoQbKwrcwUKbMOWs+apYQfcQIiV83bK8SID+qg2J?=
 =?us-ascii?Q?67i7VfGN66Irca1YHvyBiD8hlUlPdKh6ET/kUE7kX/JQNycl7OLE3hO9c2JM?=
 =?us-ascii?Q?KuGvBB5cxObB3UxWRWT/tUZ2pocNRIO6vBfRLjAopS8pzBQX2+21hFzzy8Td?=
 =?us-ascii?Q?azYzVaEIuDYZsVC6CSnOONCdML4tzSyeaCkaQUr6LrK+rV8b6Atc/4BxmPet?=
 =?us-ascii?Q?0eXG7oqkTwNVa3afFwsFyVMN6en6pIwuX4kYJQKLE7tU4TC1z7GMr1NpOXr5?=
 =?us-ascii?Q?JQ2oCXBIZTWtASrl+8Abn7x14nY4iUW8K5EK5Um7TIKB2/yQyU1KLe0qebsK?=
 =?us-ascii?Q?UyxvSsdaRAox3VpfnubC4ZWqv1uw+6pU/IGqF84ByNxbkDnjqVthP0LUrW5F?=
 =?us-ascii?Q?/iLyI+RED9KplP1+QGftvr81eJ7q0l4v2uMPQnRwDrNcj6uLn8bQ0qoptAtE?=
 =?us-ascii?Q?nBKWg/r+LA1BsemQfJU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2619.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e62f6059-917b-464c-68a3-08db7c3c81da
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2023 03:12:32.1306 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N1TmYv/czGjIv+p2qxbVRJ3qadvXWBT9CnqXiFyTnpO93THfpNwsLZKqfSw+ZIi9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7695
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

Hi Andrew,

> -----Original Message-----
> From: Andrew Lunn <andrew@lunn.ch>
> Sent: Saturday, July 1, 2023 9:02 AM
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
> Subject: Re: [PATCH V5 4/9] wifi: mac80211: Add support for ACPI WBRF
>
> > +static void get_chan_freq_boundary(u32 center_freq,
> > +                              u32 bandwidth,
> > +                              u64 *start,
> > +                              u64 *end)
> > +{
> > +   bandwidth =3D MHZ_TO_KHZ(bandwidth);
> > +   center_freq =3D MHZ_TO_KHZ(center_freq);
> > +
> > +   *start =3D center_freq - bandwidth / 2;
> > +   *end =3D center_freq + bandwidth / 2;
> > +
> > +   /* Frequency in HZ is expected */
> > +   *start =3D KHZ_TO_HZ(*start);
> > +   *end =3D KHZ_TO_HZ(*end);
> > +}
>
> This seems pretty generic, so maybe it should be moved into the shared co=
de?
> It can then become a NOP when the functionality if disabled.
The shared code you mean is some place around mac80211?
Actually, there are two similar variants existed already: cfg80211_get_star=
t_freq and cfg80211_get_end_freq.
The outputs of them are really what most mac80211 logics care.
The new API here is unlikely to be shared by other mac80211 part.
So, I suppose placing it here(only in wbrf.c) seems proper.
How do you think?

Evan
>
>       Andrew


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 120527467F0
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 05:31:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2803F10E27A;
	Tue,  4 Jul 2023 03:30:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2078.outbound.protection.outlook.com [40.107.93.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C831910E279;
 Tue,  4 Jul 2023 03:30:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nmhW5bp8zLpssPjFbiUe/wvYHCriLdVacoJNfZqmUO3qn/DMbEtDB3D5XiyCDGGYlM5Y3bL+x3qeb/tGMWY13YdecAyWr2m0ngsV/qSWxd6cHHgxlDe3q4ryQx5j4PbuMwvSI9ry27Gmz85vGeRJqMd7n/i4nKwvV1NM/0a7p7L5K+NPqByJUvb9C9SToGsHEzHIZvFpZMEqCit27fuQb0Lm71n2g8vrXbqUqs+yN4JMn3jdkqovNgp26ZP1dZ1jS2f4NRCNMPptVxIz9lGVWrZocT4mt14pikqTGT0pFUVVPSWZOwX+w2sSaFlTTdsa/iQp2xNohYrsWFozWlEBbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6a7vyl/fKsnv0PPF7a4cqx3qtZSj20TI7XDdikm7FLA=;
 b=SDhRcrr2WqNmq+2GlZfVclFFRcmFfGzyGLF4T6feFQvRucLx3TyPfeJMn7xFZ5DVyxj+kracwWVGCYlNOQPH3yw3m6fl9t+qsOE4TzjgHeSWI+IdY/7dPLd2gH7GS0FJ5OWvCRZvD4mP6b/9TXpPsWHg4Obn5DU++jTpngw+RyVGl8IMC+IrzfEQ8jkln3/KJs4RxlC0/KEWesS9K/BzT9dy75Rt2mWuuAE3LMm7es4JLOvsC2YOnwezq8Q1aw4jqJ35vfL72KGRbSFeIUxlK13ym6FMopfZPO8dBYD0+KzRQ80qvlcAFVBLRx1FOX5/0fvsxxTS76V8YRnEAuEUhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6a7vyl/fKsnv0PPF7a4cqx3qtZSj20TI7XDdikm7FLA=;
 b=kygluwGdA710N9JIVeT5At3J+jZrCZ2wyiquimRkB6ubzCbyNK5CpAkJrjfUXx6J5VO9kZ7Esb0y5xxtoOtv1pgzJ/QHy1kPUhMkOmTnEdPRJFIa6S3NV83cbvBrFFlPrViIkhrIrSKcxYrdnEw+kqmDdfsnSTcgJ+hUgnh0IzM=
Received: from DM6PR12MB2619.namprd12.prod.outlook.com (2603:10b6:5:45::18) by
 SJ1PR12MB6193.namprd12.prod.outlook.com (2603:10b6:a03:459::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 03:30:53 +0000
Received: from DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::3bef:2463:a3e0:e51c]) by DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::3bef:2463:a3e0:e51c%4]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 03:30:53 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: Andrew Lunn <andrew@lunn.ch>
Subject: RE: [PATCH V5 1/9] drivers core: Add support for Wifi band RF
 mitigations
Thread-Topic: [PATCH V5 1/9] drivers core: Add support for Wifi band RF
 mitigations
Thread-Index: AQHZqz5nCvlP5HKi7kqHZhT1UyZB3K+kDOyAgATrEhA=
Date: Tue, 4 Jul 2023 03:30:53 +0000
Message-ID: <DM6PR12MB2619591A7706A30362E11DC5E42EA@DM6PR12MB2619.namprd12.prod.outlook.com>
References: <20230630103240.1557100-1-evan.quan@amd.com>
 <20230630103240.1557100-2-evan.quan@amd.com>
 <7e7db6eb-4f46-407a-8d1f-16688554ad80@lunn.ch>
In-Reply-To: <7e7db6eb-4f46-407a-8d1f-16688554ad80@lunn.ch>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=7db39b51-76fc-475f-a353-db22ab1b192d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-07-04T03:25:54Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR12MB2619:EE_|SJ1PR12MB6193:EE_
x-ms-office365-filtering-correlation-id: 0913433f-c26f-4676-9b28-08db7c3f123c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BP4uy9MJpO/AAXghqSifaPyFNc13SdZzkPy0sXi0mbCbx1uP/UtiQmdwAU5Dl0pu9H1+AuGLynJfuFtWj50ogp96ktjiH5thl9bsmYuRyNvHoqvmStqOtQSd+1LhkRkc3bTwmsoKXr9XIcySCxzs4745tJyVFubacSLz4jtWBGXOZ46Gd55Fz7vWtiaZAtrj4M7aCS5J15TXvXhYzNip2R8N4bKAA4PKfufNCUtbAKUwodKZGSU3tHy0gv/8s6O9lznz4U4jq1MgsM10FFGA0bwuX0HMPYPgkRPPMG8XZkgZhHUbZlTlknAzIVmdkcmK1roWntuOfqp5BbhKQ53OznmBdktnWaRgdtTQbIIKiV8uhCQRfxOk+Hxshw97qB5aXnIwRgt0zNKY642B7nqy4bYMQjV2ijpVf1t12YbKQIHWDsuVVennW2CW3V2ve/bz4B56LDf0dYkdsVxvp/BJibwNjGD3JCtKGaju2yHjBMP1M4MqRYnJDEKU1pSvJOgW5ZAUL4cbLBG52gPqv2pa1TRJrgT26/YrN7Yx6bQYGqAcZtzP4HSufdaNt8vllD8FS0ShW+RtOlNzSYcgUZ1it1DCwt7xDso/+uCfzLUyQzHl+bSx7XoXu0vdqBi9K53T
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2619.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(376002)(396003)(366004)(346002)(39860400002)(451199021)(7416002)(6916009)(66446008)(66556008)(66946007)(64756008)(66476007)(4326008)(76116006)(478600001)(316002)(2906002)(8676002)(33656002)(8936002)(52536014)(5660300002)(66899021)(41300700001)(54906003)(86362001)(55016003)(9686003)(38070700005)(7696005)(38100700002)(53546011)(186003)(6506007)(26005)(71200400001)(122000001)(83380400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/8WDHES9GN7s+qtRjpXkVzNYxHNpypGmUOKnGUwLc92Cj3IuTttNjUGx88qA?=
 =?us-ascii?Q?I5FwsyILrZeyvSW4YPRuvts555uyh3sRUP1ZRjuf9yzKCtBfkHdkfAjYX9RI?=
 =?us-ascii?Q?Zrf37isx0/4sCI5txk7+WvF/S5MIYTkehoZHpK+1mRL6q9kVF7ZKAhUDETyA?=
 =?us-ascii?Q?SKGMx2P2WedyX0FWLPoQsOAAXD4gsi3MW7pjGtKjpLIDPYYhl4pWQnFR11Kl?=
 =?us-ascii?Q?HkQQM3aTiFf3fPxJMNyFIGIDIs0jcd15LZaT9vM7eQ4Xuu/R1ihMtypW5UUK?=
 =?us-ascii?Q?cpNn9XijM1WYpt6jntG5QoShWJlJq56gR9Q2YCSoAJQutsHnsf15Pka8IJlW?=
 =?us-ascii?Q?ZJRXIrKwVpY3pHL9haDMIVSzP9jTs9+Qv4sYVTd14+bWuPOnEI77ORW4i6yP?=
 =?us-ascii?Q?lK/c6ATOS0TSWuzq0Mez/LtsXxxuxogUYZp9cYgelPklCnY4/Emvp0D3YWI4?=
 =?us-ascii?Q?R8J4KEUwsO4BYKJ9oj6ShFgqg6kCzogwfpLsm0MMrH+ga9CEaGAWG+IiXtFU?=
 =?us-ascii?Q?CCNHBSuLDazq/ngdGV7Z1Mancs0K5cxOzSuTkP0Wr95YBjp2vfeYJgVF2dow?=
 =?us-ascii?Q?ts5ZIDA/dNYOwwHTR1jrCZtDS93U8b2Dzi7emO6uAuxFrlU2Wqgf3v7Dbuuh?=
 =?us-ascii?Q?Rztec8EbGd6qv1rtRrHyvlYFTWsLSJaT66oxoH6Q5W/8W3SQl18ujNjJZkbA?=
 =?us-ascii?Q?G4Sw7Z54bzLlyy+626S+H/8uW+jVQjnlkfBWzWTAz/qhQ4NR3Dd2sjU1rhyY?=
 =?us-ascii?Q?tRVbN1Oa+KoUFAVKLtoBUNtJWwP3+jHHPX1HHDIc/gj99Yk/NxbABCU5FCfZ?=
 =?us-ascii?Q?XsUtEHlDuL7++G9CZYAJUa0XCF0rwa9bLOoZHTcgSJUK5PsEY9uuKIL4vXpB?=
 =?us-ascii?Q?aKd92Es5kTIO8hHTCTysU1EmsHOE0weN1WOSlxL3XY9RjPVyDRt/7SDi5cyB?=
 =?us-ascii?Q?EyJdNcOJsvDpZQI8TuArQ1jcK5qth2/uc6xKABWce6UvqvFC5vsB9wUYLefP?=
 =?us-ascii?Q?aAgofybp5lwW1QIz+1o7l1YxbZWB5G5KuTqMrYKOptLdHt//FdBV+L45Pnug?=
 =?us-ascii?Q?VjicpEV/tbLe9vddrd7rGFRPuxKJfOoDpb9NAmVGYq1Z7KI11jLOg2MVJLaM?=
 =?us-ascii?Q?ppg8jbC+w+RX2mv8KBSQjwJ31D/hbCAupi24EThQXLjbasnswVIQLozW4LOb?=
 =?us-ascii?Q?7/h2ENL/BaZt5blIRloj//56lalL0fJOJQLnMAczUu7uQ/C39e8NvIbDjBcR?=
 =?us-ascii?Q?xwUMWEJ7v9piRoNbJTS7m6CmBo8dSPZZrfjZPalxPiA8frxYKn4f02TCsW4f?=
 =?us-ascii?Q?JoFP6+f0Tt2FSYVnbk+5xUVNdI8/74QLzXBonOXnYClRMig/lls5dywpHVVY?=
 =?us-ascii?Q?p610g3T1Pwaki9G38+83/1R6S1+55DuhbxVMk79Lw7U2i5sonrTNhJ0miWmy?=
 =?us-ascii?Q?3u6/wqqPiBl3icmbSZHUqO1RfwZBazR0ivSLLooLlcsnAIx66uy9MRi1YAJG?=
 =?us-ascii?Q?pEiaPjf68XFAysH3U4RzqmZGeTsrJ0/W2b2j5hwSkFPcrIJQ1DEMjMIqV9oh?=
 =?us-ascii?Q?fbbc+mrOV7jWjENq7S4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2619.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0913433f-c26f-4676-9b28-08db7c3f123c
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2023 03:30:53.3272 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qoIPedvGCApfJuInLsE++r/9U4+KTNoK7Kdy/ehugmXHXAoyepOb0ZhxU5ntV8AS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6193
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
> Sent: Saturday, July 1, 2023 8:20 AM
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
> Subject: Re: [PATCH V5 1/9] drivers core: Add support for Wifi band RF
> mitigations
>
> > Drivers/subsystems contributing frequencies:
> >
> > 1) During probe, check `wbrf_supported_producer` to see if WBRF
> supported
> >    for the device.
>
> What is the purpose of this stage? Why would it not be supported for this
> device?
This is needed for wbrf support via ACPI mechanism. If BIOS(AML code) does =
not support the wbrf adding/removing for some device,
it should speak that out so that the device can be aware of that.
>
> > +#ifdef CONFIG_WBRF
> > +bool wbrf_supported_producer(struct device *dev); int
> > +wbrf_add_exclusion(struct device *adev,
> > +                  struct wbrf_ranges_in *in);
> > +int wbrf_remove_exclusion(struct device *dev,
> > +                     struct wbrf_ranges_in *in);
> > +int wbrf_retrieve_exclusions(struct device *dev,
> > +                        struct wbrf_ranges_out *out); bool
> > +wbrf_supported_consumer(struct device *dev);
> > +
> > +int wbrf_register_notifier(struct notifier_block *nb); int
> > +wbrf_unregister_notifier(struct notifier_block *nb); #else static
> > +inline bool wbrf_supported_producer(struct device *dev) { return
> > +false; } static inline int wbrf_add_exclusion(struct device *adev,
> > +                                struct wbrf_ranges_in *in) { return -
> ENODEV; } static inline
> > +int wbrf_remove_exclusion(struct device *dev,
> > +                                   struct wbrf_ranges_in *in) { return=
 -
> ENODEV; }
>
> The normal aim of stubs is that so long as it is not expected to be fatal=
 if the
> functionality is missing, the caller should not care if it is missing. So=
 i would
> expect these to return 0, indicating everything worked as expected.
Sure, that makes sense.
>
> > +static inline int wbrf_retrieve_exclusions(struct device *dev,
> > +                                      struct wbrf_ranges_out *out)
> { return -ENODEV; }
>
> This is more complex. Ideally you want to return an empty set, so there i=
s
> nothing to do. So i think the stub probably wants to do a memset and then
> return 0.
Right, will update it accordingly.
>
> > +static inline bool wbrf_supported_consumer(struct device *dev) {
> > +return false; } static inline int wbrf_register_notifier(struct
> > +notifier_block *nb) { return -ENODEV; } static inline int
> > +wbrf_unregister_notifier(struct notifier_block *nb) { return -ENODEV;
> > +}
>
> And these can just return 0.
Will update it.

Evan
>
>     Andrew

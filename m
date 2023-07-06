Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D41207493F2
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 04:59:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A12310E1CF;
	Thu,  6 Jul 2023 02:59:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2057.outbound.protection.outlook.com [40.107.243.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A9A910E1CF;
 Thu,  6 Jul 2023 02:58:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PC6P3qVfQoYj2TXJRf1xp7xn4Qb9FTuZbwss/jXfRFsc1iB5BlM2gJnIYI8n0NOVzmqkGjQm7cLghZ6l8DjVkFv7lQpYg4WJ/mIwaQI+d5/6mxD3lnqj1JaUdFaXv0NGWt3I6VlcK1KOpwwGoNJOZl8n8NHE8C7qgkE0c2YwoZo7ZNUi3y7hZt2Q3bh2JmMWOqUggvlkGcdscHcLxzdizc9UA4uNM4ii/KstEMV0nBDTCuSnpV8dlrQBY6NjZVag86LKsoXDAYxZnyTEgPuYk8ZpUhJglc0+jucO+SiUTal415JHT6JvdHksnWBx0VnmImARo73Ha07yquKlj9echQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3nzMFBeX37sOBYyC2WXcj6qtKPd9NPPMmNhFjOnO9S4=;
 b=UrAaFeEjr+l3aYR6oDlTTNxUmctHXRG+Aw8brqA211Nf/3c+3/q7kGPio46s2wgTefGLGpeCjVvVkQhMxzSntvH6quL8MkDbkuzeoitOCFbkdpg64CNw22pKqOfg/ZcWdw+8n/q1J21HBpwwYE/f1cVYU0zkvxivn2AJDa2msP6+/z9VJKk1tTvLWGIkF3UU4/8FFTzdN8oBZERtLjQmwpVea3BOhvA3V/5M9Cxl8tMCMmI2oQAXJpmlGniX0jzBIfO7ZEgrU7awp0H0xjm3YaGwuSoKQNErAHYiICRpwQdYyYVzteUdIB2GDMECluEGHE5TAQsN142SiLnG5lLnWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3nzMFBeX37sOBYyC2WXcj6qtKPd9NPPMmNhFjOnO9S4=;
 b=CAchPgZF0sloAFj7WYJlii2aGSZ0nQJ+eH+CvexZvdBBxZhuEtDknUUUq0A7P6eK6lk3GQYqxb9ymYFGxHjkIrrgKssqn+HZwjeEhOP6tgbMukTMBH9ThnCgMJwf/8tPAyBSdgmQt5d+DnahT+OVxZwfL2RNlfVAv3gQuIr3U9U=
Received: from DM6PR12MB2619.namprd12.prod.outlook.com (2603:10b6:5:45::18) by
 CYYPR12MB8729.namprd12.prod.outlook.com (2603:10b6:930:c2::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.17; Thu, 6 Jul 2023 02:58:54 +0000
Received: from DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::3bef:2463:a3e0:e51c]) by DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::3bef:2463:a3e0:e51c%4]) with mapi id 15.20.6565.016; Thu, 6 Jul 2023
 02:58:54 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: Andrew Lunn <andrew@lunn.ch>
Subject: RE: [PATCH V5 1/9] drivers core: Add support for Wifi band RF
 mitigations
Thread-Topic: [PATCH V5 1/9] drivers core: Add support for Wifi band RF
 mitigations
Thread-Index: AQHZqz5nCvlP5HKi7kqHZhT1UyZB3K+kDOyAgATrEhCAAKJtgIACaF9A
Date: Thu, 6 Jul 2023 02:58:53 +0000
Message-ID: <DM6PR12MB26198720EBBAAB8C989F8D4BE42CA@DM6PR12MB2619.namprd12.prod.outlook.com>
References: <20230630103240.1557100-1-evan.quan@amd.com>
 <20230630103240.1557100-2-evan.quan@amd.com>
 <7e7db6eb-4f46-407a-8d1f-16688554ad80@lunn.ch>
 <DM6PR12MB2619591A7706A30362E11DC5E42EA@DM6PR12MB2619.namprd12.prod.outlook.com>
 <18dfe989-2610-4234-ade2-ffbc2f233c19@lunn.ch>
In-Reply-To: <18dfe989-2610-4234-ade2-ffbc2f233c19@lunn.ch>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=e4b0b34c-4fda-4a3d-9f25-1d15a394cbbc;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-07-06T01:53:19Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR12MB2619:EE_|CYYPR12MB8729:EE_
x-ms-office365-filtering-correlation-id: 742f7eae-7400-416d-3f71-08db7dcceebd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ugh975M4mkJTtmcRsZz7kRBE9awXV/qMW24NoPvganV7xs3AXvgmmUfY3/2ihPJflP0YQzX7TG9cv1BmYhix2rfSJdj0kjW7VyEfrTdhF/iL9F7N618fNjgc4+HIlnxm1hX1HtjvsXrJUQvl1K6TYVnSsLkO1uoOGb/sSJR+snKqRuY/mPFCp+QO1BMTfxrCw0YOQ1PITyFe1f6zxOwHDqGGBBhC9jGoQ4JG5YJe4IditVgkrRQeKYmnOH0R1teeIso/tMtU6KqlekybmWFUHWoN3PlMd8WjNGGM4EVuFY/jRvObXhTW2L6esd+2fdXEjg238G8QD9T+FkjG/mkZkHDxvEFclad5NVEOUDQq7JxsxgmjRz9RpnK92X9XVAxjVAFuOMZpUe+sqTE7rpwuI7rFKaKqZRADBwUJ2me9fX2XlS/B2mhzLQrtNqOol2M04XYwrJA3K0Ga5o1rwf56XHZaXZ1kdG+jxk9qSfi78SiE7+nqbj07H/+EneS42PEXzgeBI5BWPZmleCAN1nO5woJncQqODMN9p+hsDpzmQBm61gg8xsbpWhTgAwWqvEcYi9xKOzfM8gj7OPmsuqVs99XXpftJDLrlP6QA+8TvaAQb+Htwn94AU7yob3zMSmBX
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2619.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(39860400002)(376002)(366004)(346002)(396003)(451199021)(66446008)(8676002)(8936002)(2906002)(55016003)(5660300002)(52536014)(26005)(53546011)(7416002)(6506007)(186003)(66556008)(64756008)(41300700001)(7696005)(122000001)(71200400001)(66476007)(76116006)(4326008)(316002)(33656002)(83380400001)(6916009)(66946007)(54906003)(478600001)(38070700005)(9686003)(38100700002)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Xzb67GpqRNMbkw4nkpJSD2GNZIFycPiS+PBLtthdg0buE1P+cLWrEX1/pWEl?=
 =?us-ascii?Q?F7c5wSOW10K8roNpqhWlqfo8fp7Z83GyyZUbFrBwdgmzD2q2aHAuFQnR79fO?=
 =?us-ascii?Q?+fXsUeS7i8KRwtAwO2qONuuLNo1ZHTqCVF+2Ed87egHmXIvEjU5hmXY36TOT?=
 =?us-ascii?Q?L6Lxbr2lAl9w2vbfKuR3bIHjevrzmi8TwSy+j4G2DxWDO9ThjdfxVgU2KyNe?=
 =?us-ascii?Q?rUvIuOaA8Lzn0tM+fzgxbUFabuRDaFIwJn055r3IcCrtiX509NZN2POG/QrZ?=
 =?us-ascii?Q?mPCifJafP+WfQXEGzZF5x3RmtyB8uYcxLhjGoPc74HoDjaYUgza7e/O0DHOd?=
 =?us-ascii?Q?IBY3RicGD17cNCfr1hoDrH/iTc+NOM6NETRt7LugqUZ9ykEELiQ2xsO6MBmj?=
 =?us-ascii?Q?pzulffV7YRTgwYSRSqHMAZmt91sqkeRDElJCmnUjxve81gcIMtBh2TBGGwpL?=
 =?us-ascii?Q?mTXwF5dPbmRm9GjdK998i9FvycxDmps5BPkdke8+xoy0zfrvXo8T7524Tcqp?=
 =?us-ascii?Q?m3grpvlW+8xpsKBeHc1bJUxQpsfmJDzQ3b1/4g4SZbON7MNXBNNZ4Z2a9gcU?=
 =?us-ascii?Q?OuIYVDNS89uNEpBuI/1cTQGIFi8z/eZ26+oEyuvCPzLmRjLAXnAy9YJzAO3t?=
 =?us-ascii?Q?bV16PcSGYq8XdGfDBStEel1a41KabeK18J41A0Yx75+WCHg0pCeaVVAj6mhV?=
 =?us-ascii?Q?qu7cMiOdaDhMX3H5yXjc0IlzaTXZVAzYO4vnhV7H33pbEk82DQN40MPGZj13?=
 =?us-ascii?Q?YA3RNwx631dDe7YUbIBRcSzRMNa0zpbFQ08wbPPjGAtFv+Yw0Tbnx3J8sGp3?=
 =?us-ascii?Q?AksDO1PCJ7UoefI45D8QKpnurYd0gHj36JzfgFlcm6cUldazx8iXL9qf8EM7?=
 =?us-ascii?Q?eqxdK+g/jZFdR8Ue1/JDKHzKp+ZH/NIsL8Ew/Z5rBmALlZsj8Aakz4o0/Fag?=
 =?us-ascii?Q?OGhmDkZwokX2s6CeaLE4W5j+9kdzj2U8neRcI/yfEZaxr16VoyxVEZolDSQk?=
 =?us-ascii?Q?GV5wqbeUhR/+3K5nG8N/c1AXoq/n0+2eo90GmWUG1l/oT+9E6OPqEBan8yp/?=
 =?us-ascii?Q?RByAIDxEJrmcBrz6rivaqwrFx8Grtavw28tij4l8+gm6L7w4F3+UqhYT8I0B?=
 =?us-ascii?Q?DxTTY9qwf8rAlfGhariUEEOqvwC5dxorf3CDAVeqUbTlhN3Wj/HwdjFFxOMp?=
 =?us-ascii?Q?B3AmGJg/Q4cbukd+0Kp8gjNfDUu9EcZYlunaWGAZ6ZEwN6dlgu6cN+RsJc98?=
 =?us-ascii?Q?zcERYioOY60kW5EUpaf4UbNppOTPixr7m44YEXuJCD0l1Of5GIC2yazRl7aZ?=
 =?us-ascii?Q?i6oJN8T2VT78KvVTU29IbNoMzNsi++hvCN9sDG7mhc8zzW4tWKt9TDv05+MC?=
 =?us-ascii?Q?9ljuHQ9Bf3Pss1OAxZzpUsJfQo3nURGFqan0aJvLsf4Rlo9mxPRFNKaSpBIQ?=
 =?us-ascii?Q?N/cthY8T2esfKu4puDPGoALmEvY3sjoqFFTx92famZTqmLxb/Kt8RTNOl9jf?=
 =?us-ascii?Q?bZE3yBb3KWg1GcFVA6doYsklXSjPzOl4Fu8LJpUw6Rjc+9HMjL2/nJcStJFW?=
 =?us-ascii?Q?EoDH5PglSWFSJsIwbr0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2619.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 742f7eae-7400-416d-3f71-08db7dcceebd
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2023 02:58:53.4911 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LxB84/e1OdUEVY41H7G1+FOJlC6EQqJdU9beL4Lv1jLQGAZTYewN5SuEhtl7COs8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8729
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

I discussed with Mario about your proposal/concerns here.
We believe some changes below might address your concerns.
- place/move the wbrf_supported_producer check inside acpi_amd_wbrf_add_exc=
lusion and acpi_amd_wbrf_add_exclusion
- place the wbrf_supported_consumer check inside acpi_amd_wbrf_retrieve_exc=
lusions
So that the wbrf_supported_producer and wbrf_supported_consumer can be drop=
ped.
We made some prototypes and even performed some tests which showed technica=
lly it is absolutely practicable.

However, we found several issues with that.
- The overhead caused by the extra _producer/_consumer check on every calli=
ng of wbrf_add/remove/retrieve_ecxclusion.
  Especially when you consider there might be multiple producers and consum=
ers in the system at the same time. And some of
  them might do in-use band/frequency switching frequently.
- Some extra costs caused by the "know it only at the last minute". For exa=
mple, to support WBRF, amdgpu driver needs some preparations: install the n=
otification hander,
  setup the delay workqueue(to handle possible events flooding) and even no=
tify firmware engine to be ready. However, only on the 1st notification rec=
eiving,
  it is realized(reported by wbrf_supported_consumer check) the WBRF featur=
e is actually not supported. All those extra costs can be actually avoided =
if we can know the WBRF is not supported at first.
  This could happen to other consumers and producers too.

After a careful consideration, we think the changes do not benefit us much.=
 It does not deserve us to spend extra efforts.
Thus we would like to stick with original implementations. That is to have =
wbrf_supported_producer and wbrf_supported_consumer interfaces exposed.
Then other drivers/subsystems can do necessary wbrf support check in advanc=
e and coordinate their actions accordingly.
Please let us know your thoughts.

BR,
Evan
> -----Original Message-----
> From: Andrew Lunn <andrew@lunn.ch>
> Sent: Tuesday, July 4, 2023 9:07 PM
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
> > > What is the purpose of this stage? Why would it not be supported for
> > > this device?
> > This is needed for wbrf support via ACPI mechanism. If BIOS(AML code)
> > does not support the wbrf adding/removing for some device, it should
> speak that out so that the device can be aware of that.
>
> How much overhead is this adding? How deep do you need to go to find the
> BIOS does not support it? And how often is this called?
>
> Where do we want to add complexity? In the generic API? Or maybe a little
> deeper in the ACPI specific code?
>
>        Andrew


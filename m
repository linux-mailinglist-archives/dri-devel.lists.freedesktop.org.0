Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49098C62922
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 07:47:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E42510E194;
	Mon, 17 Nov 2025 06:46:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="eway4Mic";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013066.outbound.protection.outlook.com
 [40.93.201.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F2EF10E194
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 06:46:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s9azzEcA5/DQWWFHasGOIJJLgPjwPPKzbPHYfZ8QAIUmSDW/psUoqWPK83dYQCaPXi4+FXV4wqq0FGEM5QYPEPvwlZAFU5UIneAskxlSyh8u69f2UiQ339n8gL0JLdTB/RDvUYASJvnuSG4/k+OAm9cUKY23w0StHlQuC7NS1L2UhuOfnXWTRNiXOZPOQsRzSAiBMnX0205/sU1sm3vuLSdLkDSmdKaCZBAIMZh86KMdLBSWGwHhQwYGk2uCgM/kF7y6UhVgxDjGRtb/sajupeAVpHwwLvsl+gVhP/7z9f94zkIMlkWpzgyWTWGJLSDpdC5qbihDc9xiOe/wCl22cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4xC1VZKVmq6ddvJwl/6u0IABXRLtbJIlCJNv3zyycEg=;
 b=Jcx5g3eooSSjDQEQEYTNag8II2woTHkqKeMDEcJ7l768ZtDxrSxr7N7JM4N7I/XOEYWHk6LnKM47iniwcmcxOKvLeCOf7j7FZXJUguKeV85mqavSVSabMzUBoEr4y2MArKsBiJv08jZgZs5E50OO4ZnVh2wMvKtLR9X7SaovgdymhQUPqVuoIaL39qIx+ZSJdDEraoXlsorti1k1HJjsNse8Q5qdIZsCUsabBP9AIYMynh02DwOst5Lg+w+5npU6fR1a9O33V1sQkOTOwrD9FPCAhlhAiix5DFrTyrVRyMC9bA5zAieQLmEHSM+amR0xT85oJs+XqyOe6f8iamuzOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4xC1VZKVmq6ddvJwl/6u0IABXRLtbJIlCJNv3zyycEg=;
 b=eway4MicR34QqT/3VnloOkDvssvbtpz6RFkppC/yK7u56R1y3LzViBxI2a59bjeBnqhunmxGa2gccMi8gZSEoIPkz9KP+5/+VxlkZkUff11m6+LLBKtjjBswoFMVGYYOkI/9FJbO4APvaOsFkvokYHr/WS5vfMX/B6SDB8+1H3c=
Received: from SA3PR12MB7922.namprd12.prod.outlook.com (2603:10b6:806:314::12)
 by MW6PR12MB8959.namprd12.prod.outlook.com (2603:10b6:303:23c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 06:46:53 +0000
Received: from SA3PR12MB7922.namprd12.prod.outlook.com
 ([fe80::9b6:464:1a68:ed47]) by SA3PR12MB7922.namprd12.prod.outlook.com
 ([fe80::9b6:464:1a68:ed47%6]) with mapi id 15.20.9320.019; Mon, 17 Nov 2025
 06:46:53 +0000
From: "Katakam, Harini" <harini.katakam@amd.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, "Simek, Michal" <michal.simek@amd.com>, Ulf
 Hansson <ulf.hansson@linaro.org>, Michael Tretter <m.tretter@pengutronix.de>, 
 "Pandey, Radhey Shyam" <radhey.shyam.pandey@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-mmc@vger.kernel.org"
 <linux-mmc@vger.kernel.org>
Subject: RE: [PATCH 2/3] dt-bindings: dma: xilinx: Simplify dma-coherent
 property
Thread-Topic: [PATCH 2/3] dt-bindings: dma: xilinx: Simplify dma-coherent
 property
Thread-Index: AQHcVipjsH7TYINoC0qSGcnNCETQ07T2b1gA
Date: Mon, 17 Nov 2025 06:46:53 +0000
Message-ID: <SA3PR12MB7922C34E4E40FA70212B0FD49EC9A@SA3PR12MB7922.namprd12.prod.outlook.com>
References: <20251115122120.35315-4-krzk@kernel.org>
 <20251115122120.35315-5-krzk@kernel.org>
In-Reply-To: <20251115122120.35315-5-krzk@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-11-17T06:46:31.0000000Z;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source; MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR12MB7922:EE_|MW6PR12MB8959:EE_
x-ms-office365-filtering-correlation-id: 576955ba-ae9b-48f0-e107-08de25a517f0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|921020|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?goFhREWHpu7VsjZUPsvmuYfTndZknAeB8NR5/n+VWLIKkllrrwQ0GYfUrVwP?=
 =?us-ascii?Q?hs2aU4/jSSrHaGeYsU6t8N+TvyFpvNeKLEm4PxW++DC+9xCTmUUMVRcIfPub?=
 =?us-ascii?Q?l9IiutOw3h2GRzE5r0EXUMfA+01R5GeZCigUWq30jrXJsC2i6VGPB4slp/Tg?=
 =?us-ascii?Q?tsjcvSQ2KmRfcMA252cdkDK5V8SW4/+6VDfEvv0+gxY72+klkWgsHe90MvFL?=
 =?us-ascii?Q?lNHsP/6OhM8eeS7kx/d/kSlwUafPrqsOhjiCC9mslwMIOoyNmJouAIoEIo86?=
 =?us-ascii?Q?5OoS8ixVoRoB3Nzm8MN4Kd4JnCMICRSjsN5a50yZg/94dJfLk61r9JlWIJqj?=
 =?us-ascii?Q?WBab8dRfBkwFwaieGvuqDo88cHtPg1lYuRLlu9CGDBOXE7sGD7kZEhVmupuX?=
 =?us-ascii?Q?02YeTZQsOjjs6TzzPJGWLA5nYU4vqB8HT8SKUrJxybV/6j65Q8ybNfhIkybD?=
 =?us-ascii?Q?oEIS8tkydDaaNtF9dSOBnBFHqkZ9iCcU407nP0uWNmOnHtEDw+XCCtq101wO?=
 =?us-ascii?Q?b2agwkJELIJNQ83i8kY9SG8AX9xIiLHm78LYUfi5fZyhTRhUX6ektxvIQkbe?=
 =?us-ascii?Q?6BumZqSDgH8JkBB4ySeC+sc5A+h6INKBVbay2S24dB1J8e+PL16KiGMYvXnm?=
 =?us-ascii?Q?wiuawmePzB5nlvFWUqvQ7+BIMTdd4xh0+OwxyrGZFHfX300KkuRPGCdIQnDd?=
 =?us-ascii?Q?knG2FH50WYIg/7zuxKPvNPo7IhRE7cyrVrJ5/sWJIcPEMiyat0pOAQCyqTm0?=
 =?us-ascii?Q?cElhHG8IHeQmGJJuMt69R3Q6ZtGdY6WRfAqvYJ9cxpLh3KgU7kZc+LedjM66?=
 =?us-ascii?Q?viBVTT02XH34lVXFxJ2Ya0IqLfP0jHcpskTeQQYlqj9EbEAw3KCM2L1dKyqG?=
 =?us-ascii?Q?DedM3H5/8ypgcK+DQVg7PjTivpesIQ6urltyLckM/xdJRlb/zkOGakYU7ZXx?=
 =?us-ascii?Q?PVXurAPY6auNKQx9JPcWAhKWla28mLoX1BYwgJ6vFAxUzELCf1g27GwLHZQ1?=
 =?us-ascii?Q?8epIRO8MLbHffUBaX8XcbfbN7Huc7OT4jMJksFNHx1GdkIG5MoiqI4xGPXe/?=
 =?us-ascii?Q?gfvlTP0QN7XYx1PXz1kIx9K5/YpgkTdlZYQJfoNpGAdk68YlaYNtORI4Kkf6?=
 =?us-ascii?Q?bO5G0ukqC/O60iw0dPDd/EMTVNplvEAe6M2vYiT2kX0eRRSsAUcwXQ7KaX94?=
 =?us-ascii?Q?ULyDImBaaQhMEhA8JV2MRLolH7GQFHPAThFlmQskk0n0o5ngcA3qviJlCiO6?=
 =?us-ascii?Q?GE9OuAFPL29S93PTMNTmwhLOu8qmP2R+1yqQl/GR8vU1X4Uq2x8IWs34YApZ?=
 =?us-ascii?Q?lhZmRbPgrPkJ1oKjEE7Z1oeT59WwJtpl6zJgAdMR50zMhIFKrTYv0AhxDo8M?=
 =?us-ascii?Q?6S8uDaiUKvN679EzTg70gScW1W5KjQHLtd2HnVHhY3N0BJugTr3DLvTIaCt8?=
 =?us-ascii?Q?Ns2pqbMU5hi5gEp9VHFVEL05A3LHjG3e4ybTg+m9+D7KpcnF0bYyHRQCtDo9?=
 =?us-ascii?Q?iT3XvHO8xSQX7j0YIv/iG5hKdyZhYF9orP04h9nrE7D1MhcVmac52Sjnbg?=
 =?us-ascii?Q?=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR12MB7922.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(921020)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?afJpNG7HT4SUZgQdvdhMDB1HjNWGliBl/1e2PV+RmDLuxs+sF30HfcCLxoGo?=
 =?us-ascii?Q?LabL21Ra/A/k9zBcABhx2r/UVtk+v9edJVm978m/VZZkDAiddoK1DsmgyWwM?=
 =?us-ascii?Q?/72HHzVugSrNgqIEREUP5A6BX/MrTf/RbRO5fX49qJWn4EgA+kzBjeQU+mCu?=
 =?us-ascii?Q?cBbO1DrY0E84AuVpxcMpoaOaZj8/sPP3gBHtYGfX9VUssLtZxzL/VMoT7ciq?=
 =?us-ascii?Q?GGOpDCKFGQ9TzFIWniOfkzmUr/PyZsiml8o1w7s2y15lYbfTaH85iNVieDTa?=
 =?us-ascii?Q?ZIpN6lM0JtLY5UtYVjUTN1kPuenpV2hqHG4k6xe+9nOl4+386iiSd1OpH+dy?=
 =?us-ascii?Q?9jtypV21IDjHzbzSXn2sFpJG9QxpHKrqIZ1OXkgUDMIkh3PWABuyFIrxbyXa?=
 =?us-ascii?Q?CZWiYqokde0SCdb+JtvOedzarURO65U5VThZesnphJiuPdeRl0th52Fc+W+V?=
 =?us-ascii?Q?b7N5Gn1NT7mUY57w79nD9BWvsO2exluwnauPcoKzz7Uq4EmvFo0IEIQJE7Zp?=
 =?us-ascii?Q?G+mL0ffRqq1BlCQ1fqqDVW3STY69fT87+tHDDhygmVdDegLZptRHA4Oiu154?=
 =?us-ascii?Q?zuEwJYFmuwmdVWhcKf2tQemvjXZEKRDZqo7Iktgvc+uPe9ey9cBzSobXr31U?=
 =?us-ascii?Q?EV6lpxROh5Sk49g43uO91pLm31cLXyJkrfUuJThNCLFawDrRoUFMXmOUYo87?=
 =?us-ascii?Q?sqokAOqk4Hki8l4REjb3O/9MTwu9+4LIequA82kdfGgQOJHwm4b5g3YHTdXv?=
 =?us-ascii?Q?RQ26+OTQden8zZmir1J5ay3VHHFyk4yFtTG1CDfO3IRSp2ndFwgcBQcPGQ08?=
 =?us-ascii?Q?yDGEUooDsNOo4ITDnhl3gGHpja5vG79oiXLdj8qvZzBNbgkpFsJ0EUbMqTxm?=
 =?us-ascii?Q?mRL0UEcwr7CoorDZU0fQGfOf+Yd0jasTdCHPm/YKKzzG+B8FhDKkT3Jh3Rdy?=
 =?us-ascii?Q?1VWM9Z4fuUE75+N91kLc4SqL6F9qL6fk/ED70GDFQNFzrlXQX3a7BDnGwziE?=
 =?us-ascii?Q?nfhd1zwVr6GEhLUIEivgRos1vW8uixZUqz0+Jm5b9aRNgaoJGBdBYIzg/jJT?=
 =?us-ascii?Q?MM06MmAjWm31ZGoAb6myQeFDiUWHhMwh2odRAR+SDOaiNcu+sRv90YiM7aHy?=
 =?us-ascii?Q?2uHcfKQMEIhkkT22sfqvtuieeoDeB17a8unvcFjjHHYkhUxhNbu129Qtq+iv?=
 =?us-ascii?Q?JvJ8DZdl1pOQVnXDZbzdV8/HszHM7t7KOifztol6kwQni8AAl5sZE0B3WZge?=
 =?us-ascii?Q?OBflo9s9Gb1/OPDRNF85R3oKMteML7UaYZOAmRVydsToiODv0t58DLn2hK0n?=
 =?us-ascii?Q?ejhPnSmZ37iU8XChq10vxyc+iMe4vORPSC21Ft5FYpdLQ8LWeHpl5ahbEGqF?=
 =?us-ascii?Q?g2+Pn/7ohmSFREzIW2kal4xKDDC6LEAb7PWeBPKuNUpKVGS5rAg3Nof1e13u?=
 =?us-ascii?Q?2qDh20GWY/SiGfGoOEnvro7XNJQjmq+s7MAYH1K6crdo5URAQfIs2mLLrqr0?=
 =?us-ascii?Q?1y68yiffMLDKrBse7HecaLPXEmFvYlrPDV1tr9iOwf5MEvM49lIeSCfCv+MI?=
 =?us-ascii?Q?BwFI6+fiWiap6n/OVI0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR12MB7922.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 576955ba-ae9b-48f0-e107-08de25a517f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2025 06:46:53.4601 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oBcAoMJtPmoBxGynewwqXoTnWZtNbpGjgCVG8G7dWWqskHXFUGifEzOICOG9Hbu3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8959
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

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk@kernel.org>
> Sent: Saturday, November 15, 2025 5:51 PM
> To: Jyri Sarha <jyri.sarha@iki.fi>; Tomi Valkeinen
> <tomi.valkeinen@ideasonboard.com>; David Airlie <airlied@gmail.com>;
> Simona Vetter <simona@ffwll.ch>; Maarten Lankhorst
> <maarten.lankhorst@linux.intel.com>; Maxime Ripard <mripard@kernel.org>;
> Thomas Zimmermann <tzimmermann@suse.de>; Rob Herring
> <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley
> <conor+dt@kernel.org>; Vinod Koul <vkoul@kernel.org>; Simek, Michal
> <michal.simek@amd.com>; Ulf Hansson <ulf.hansson@linaro.org>; Michael
> Tretter <m.tretter@pengutronix.de>; Katakam, Harini
> <harini.katakam@amd.com>; Pandey, Radhey Shyam
> <radhey.shyam.pandey@amd.com>; dri-devel@lists.freedesktop.org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org;
> dmaengine@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> mmc@vger.kernel.org
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Subject: [PATCH 2/3] dt-bindings: dma: xilinx: Simplify dma-coherent prop=
erty
>
> Common boolean properties need to be only allowed in the binding (":true"=
),
> because their type is already defined by core DT schema.
> Simplify dma-coherent property to match common syntax.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Thanks,
Reviewed-by: Harini Katakam <harini.katakam@amd.com>

Regards,
Harini

> ---
>  .../devicetree/bindings/dma/xilinx/xlnx,zynqmp-dma-1.0.yaml    | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-dma=
-
> 1.0.yaml b/Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-
> dma-1.0.yaml
> index b5399c65a731..2da86037ad79 100644
> --- a/Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-dma-
> 1.0.yaml
> +++ b/Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-dma-
> 1.0.y
> +++ aml
> @@ -59,8 +59,7 @@ properties:
>    power-domains:
>      maxItems: 1
>
> -  dma-coherent:
> -    description: present if dma operations are coherent
> +  dma-coherent: true
>
>  required:
>    - "#dma-cells"
> --
> 2.48.1


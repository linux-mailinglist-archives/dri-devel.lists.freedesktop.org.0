Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC909573BE6
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 19:21:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01C1E18A16A;
	Wed, 13 Jul 2022 17:21:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBC7A18A0E8;
 Wed, 13 Jul 2022 17:21:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VY0ydSusdqongXI5PWnTRuIDNUT6UD1vQ8VEkfGr2xOj73Oy/vzLqkHOXivtDzsmyAkWgmZfRqmuL8HxG3CapSM2s1FV4AWueH1qFrRPA1EYPsz7DTIv27rqUOEiCoX1ZYEeiJnOtwnaj/PjuO184cTe/C4mLkc0ckEINh2dGVpIltvvHdCoy0VFNAjhowMX9ZSU4ZTfavDAxDtupI0yroAS2hPtTOcWAqTNZWg7goErN3JZcuEqJgl+Pb9HBHBCntqTQu+1chma4VnEOGTeGm15Ld2+i0mZs/CtYI56mxQdvRCsz7twdLBikPQD3LRb/Dzx01wuJI25GGWYov/Rxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ms8EHQpmEeIxItel4ZlELWtfHSncb/Xk6olR2eoG7s=;
 b=JcJgVNxw+rl0mm517d4iFteZ4HYvYClmXJSCrHP2aigZIRwWtd08fL21u0PG3uNc1910OhKPnk9nAKGhqdupU/v83yn3+MKqOQe4cixQ8HFeODYjcvbweaH3/CpNnIcMIJS661tD8Rw8GFaMYYfaLv5qevrc+R2mvn3SGXnpzUHlUQd1qzeMOFJ50fG5Rdvdb4WgeNoXmdy9wySCUGAE4yoCGvq0qbEOAjDZd8MV4Lc5dfFxSvyvxKxoAQv0xix+B1tHGh7rMDz2ulKw7g6mIWTEFrxzFhsRivpF8PQxn6pLJWDTZSDROQAC/9l0m3T6oxWSXkxqsGpjYs8L1yqL0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ms8EHQpmEeIxItel4ZlELWtfHSncb/Xk6olR2eoG7s=;
 b=Nt1L2cluR1655YV4K1LiJTvvga1WJmVPtMht1COI7fsJM/O7dLbd7hyIUi+cBqCBnMjWrRv3hVlILiWOFX/EmqXXhECoeDZCgqLLaVPvkICP51oeBYXipt9UDT4huuumaaIjS0QNYkSzOb8Jve/hpGaldbsvDX3dYsPcjHQv5/8=
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by IA1PR12MB6308.namprd12.prod.outlook.com (2603:10b6:208:3e4::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26; Wed, 13 Jul
 2022 17:21:37 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::1143:10a5:987a:7598]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::1143:10a5:987a:7598%6]) with mapi id 15.20.5417.026; Wed, 13 Jul 2022
 17:21:37 +0000
From: "Limonciello, Mario" <Mario.Limonciello@amd.com>
To: Werner Sembach <wse@tuxedocomputers.com>, Hans de Goede
 <hdegoede@redhat.com>, Ben Skeggs <bskeggs@redhat.com>, Karol Herbst
 <kherbst@redhat.com>, Lyude <lyude@redhat.com>, Daniel Dadap
 <ddadap@nvidia.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Pan@vger.kernel.org" <Pan@vger.kernel.org>, "Pan, Xinhui"
 <Xinhui.Pan@amd.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Mika
 Westerberg <mika.westerberg@linux.intel.com>, Lukas Wunner <lukas@wunner.de>, 
 Mark Gross <markgross@kernel.org>, Andy Shevchenko <andy@kernel.org>
Subject: RE: [PATCH v2 27/29] ACPI: video: Drop Clevo/TUXEDO NL5xRU and NL5xNU
 acpi_backlight=native quirks
Thread-Topic: [PATCH v2 27/29] ACPI: video: Drop Clevo/TUXEDO NL5xRU and
 NL5xNU acpi_backlight=native quirks
Thread-Index: AQHYliiU1lGHet08KUuSJYj1QLg/kK18icGAgAADprA=
Date: Wed, 13 Jul 2022 17:21:37 +0000
Message-ID: <MN0PR12MB6101A54D0F72B0501BE818DBE2899@MN0PR12MB6101.namprd12.prod.outlook.com>
References: <20220712193910.439171-1-hdegoede@redhat.com>
 <20220712193910.439171-28-hdegoede@redhat.com>
 <82521ebc-3f14-8d3b-5601-6b4a36ef19af@tuxedocomputers.com>
In-Reply-To: <82521ebc-3f14-8d3b-5601-6b4a36ef19af@tuxedocomputers.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2022-07-13T17:20:36Z; 
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=d22c3410-c061-4ee3-8e05-4d520ff4a02f;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_enabled: true
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_setdate: 2022-07-13T17:21:35Z
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_method: Privileged
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_name: Public-AIP 2.0
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_actionid: 5393b922-e26c-41f9-b8b1-c8450bb886ff
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 03b88fa2-1c28-4f47-fb3f-08da64f42485
x-ms-traffictypediagnostic: IA1PR12MB6308:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Jry3H0v5tMftvVnYUD8WdrCXdo9jO/rEAsphSSwv2rIN/qQq7E9jKua5Ry7fPtxG6dDQ20eeW13tMNbcO0J1YoYmJzTUVzvJgeo1vwUYqPKrmZ6dHYiHZxxWkrCaLKUgHM4Vji7NH+VA7AiIBZ2TrW0gr5YLWR1NuxPV/eXM5Utm5RYwK8F7DIAIuw0LSE3Hi9l/GxKr42gqp2fbCyplI00FPb1eukkRMbE8L++KDsvfsnFtYaeJcTEf7uClF1I0B1Fy2YvCH4oAWhZ9H7wNbCz0ag0Zvxbx6B0TtjA+MlJffymg/EpBaEpNHJbilonmEfTy+AkDTsM1Q3LlwUplgvi4NSlhxyXZuq18y/4U0k3uS07lwVHRh4Nv0+3atA7ucU9GZsYa5RqJKfUn8pmjdwTRrxNSKVNluuXfGd2nA0espzGfFXCQoHsJu8deV9GY53F7Cftl6Tk1mUPpmbS4EolGewwoZmo+tXO0Wai/ojhaYD85bUbJ+8uM0kaJ5jS7Kwb8OPKCmDS+N+V+HWJ0m5oxbY4NxOyV87znXkDtEhsMTnA5RVFrkCWnCMGpByJPFaIzZuKE30Y+uyO838aOhnmSbcDGqDc63t2VOBntgOgZu/thQrj99quVmw8ErRDhk04TLq7GONhHZs0JBpAt/LEYYGejbET1ROMcr+fbk3kFNxlT5KCvrm7i0zUgI+0ShBKp5nay/pj01kZDPbxiDLsuB8BqFmqX76dkgt0Az4wG2fv9Cd8pzzq/nNpgPbmQbMzJjQXVabyVts6Y6yNwnw0Yd/r1bfqQHRHPKUMSZRXXSlE3rtJ7pYRyCpL4LojDa2EOH6pgr0J5iHQfFm+pKuD/fCL5HwEUUqiLqQJSseEhRMBRpNUZWYkkDmywO75ktyPwP+5hQj3RMm2qbKb5bQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(136003)(346002)(39860400002)(366004)(396003)(4326008)(110136005)(66446008)(8676002)(54906003)(66946007)(5660300002)(7416002)(66476007)(64756008)(66556008)(8936002)(52536014)(86362001)(6506007)(41300700001)(76116006)(316002)(53546011)(9686003)(38100700002)(71200400001)(33656002)(38070700005)(921005)(2906002)(7696005)(966005)(55016003)(186003)(83380400001)(122000001)(478600001)(32563001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?alVBWGdPb1lESVZMTWU3MjlGVjR0WFVWalJVQk0wYXp4dGpxVUMrcjV0UFBW?=
 =?utf-8?B?OXp1ekNveklGMlY5eCtTOGVqaUhSb0VSb0Fpc0dWQUtBTWYyTXptU2lyYkk3?=
 =?utf-8?B?bFhXQzJwZDdMdGxONDczcjZITndMUVR4d09yVFl5MTNEcFBXQ21vdDFSeVdq?=
 =?utf-8?B?U21zVmpleXVTWVM5Ums3VnpXQ3IrM3ZDNTdEYTdKeWpnUEd0QkxSOS91SGYv?=
 =?utf-8?B?L1hScmtPUExCUE0xbnVYWjd6Qm1qL0Qvd1poblhSUmJZd2Y1UDJVRUk3bmY2?=
 =?utf-8?B?SUs2bjdmMTBKdUxVcVBTZkRFOVc3dWtMeU5EdTNic01OdGFxNzNzZlNYZ0xN?=
 =?utf-8?B?bW1hL0hyR0U2Y2pDWkRnTTZ5MmtVRVBrV0l1U095VWFDMlQ0TGp2dmJsTzlq?=
 =?utf-8?B?Wkt4eTQxVk9VRkR5Q0NvdmRtMkZUVFkzM0ZkUnBoNWtud3g5YWxBRnNSMGxi?=
 =?utf-8?B?bWlrMUtOaUZzQUZTS29nNXZvbC85WS85cjNSRVE2Z1grSXRDeDFKTjArT2c0?=
 =?utf-8?B?YlNQZm9ueUhDb1cyT2hadHh4Mnd6bUZGbExWbnRFMSt0SXdFS1ZleEd4TUwv?=
 =?utf-8?B?MVFUVk1VWUg0a0RrOVh5WEZYcGtWQkZoeUZyeDBVelA0UmE0SURZdmZ5ZzVL?=
 =?utf-8?B?WlB0bmRkWmRnd0VxbEs5ZmRMVHR1UWs0UTBXMHY5TVVKbzhxOU8yWTdKWlY3?=
 =?utf-8?B?c25YOHFsQ2FtdzNJenpjRDhGMlJWQ0d1L1hRRC9rMTUxNlQ1Z3lEYldnYzFS?=
 =?utf-8?B?ZkI4WVNkRlhLMlRRNzllUVg0aVVWdTZ3dkpUSDBlcEVvUXR0VEZ6bGo2amJw?=
 =?utf-8?B?cVJJT1dvc3Q0eXpzV2FyL1E2YmFOb2o1M2RlZ2NJdFdldkZ3QlExRzExcENx?=
 =?utf-8?B?UVZ0eFhNcG9CNm0rb1VhSGlIa3JVOUMrYkh4cmQvUS9lRkhNejVNaGNmNytx?=
 =?utf-8?B?eU45OFp1MWljMnNSbHFnY21GVC85RmRXSkdKR3NMUWNjZWhoM2xwaFRaem10?=
 =?utf-8?B?amRGVXR5WmZ5MTNYYnpXUFpYVlRtWUJyQko3dENLYjhHeTFGWVQ0OS9FMytY?=
 =?utf-8?B?aUMxUklkTFRRZ0tGMEFyR2hPcWhpem1rQmFrOEVKWU1mSGNPUDJGWXBOZlBq?=
 =?utf-8?B?STlsL0dJblZmQlFYOUROWTdZTDIrek9uQ1dYeDFPVjB1cHVLTkE1eHg2Wld6?=
 =?utf-8?B?OENFQzRhczVSc2Q2S1gxcnVWWXk3VmMvK3BocU9KU2VLZ0Fqb0wzd0JEMlRE?=
 =?utf-8?B?cUh2Nm1jYzBmaE9lV3VZci9vYUV1RlhBUEtvTjhaVFh6cjVMaDlpZXN3VXcy?=
 =?utf-8?B?L3lnTzBFWlRWRloxMEVPMWd3QnYxUERJcCtFYnVvQlVCUVorU0JDcU01QjBV?=
 =?utf-8?B?QkF6ekRBblRkNWxSck43ZlZGNm9JMmdOVTFNc2JTNDJIM1J5M081WVZHeXNl?=
 =?utf-8?B?bW82MEIyb0s5M0RjMkhyeFFyK0lBWEh1cUl3dmlSZWpIVlRKa1JOcGhJQ1gx?=
 =?utf-8?B?YXZoVSsvM1dtbktxOE1mN2l2c3R4TzY4Y0p1UEhEVGRnM1ozbExsSTFLUkcy?=
 =?utf-8?B?dDhLanI2N0xVRXNpSTVLSGUzVHBLQVc2NWRYTnJ6TjFqNnBaeXA5UHQ3Zkp1?=
 =?utf-8?B?K1pWZTJoWGhjeHlzQ3lQZDdKWjB2cm5ieUV6bVlpa1ZBeXFRN1VpVW1NOUJq?=
 =?utf-8?B?ZVdzM1dneW8vMEdKSzdJeVFIajEvaTBDQU1VMFZsZU9WM3RGTElOWDR2N25j?=
 =?utf-8?B?VFV3czNoZi9OZ01lY0J6UlhRc0liY3RCTlhUcVdXT29WaEhnL0Y2ZmE2ZFZV?=
 =?utf-8?B?Zml6YnA1MURzTWZYVTVIbXlQMXA3RWUvbDZia0p6YUZqVzhkdExZKzF6YVhV?=
 =?utf-8?B?YnJqc0J1b0JRTFVtNXhRL1V4cGgzQUlna1BoNndZS0lYSUIvalhCNHZsM1ZL?=
 =?utf-8?B?Y0NuWWVtNVo1dUFEOEMwVTU2cXhlYUQ4bWVXcEYxbS9kekxIZkRwSzArbmdu?=
 =?utf-8?B?MktQTWVjMGNmRHRrR3dXTVhSWEhSNU53UGZUOTd1ZU5hdTJPWUtVWVJwZ1N4?=
 =?utf-8?B?NFJIY09oYTVhN0ZHT1lNYlRQck9JbFhweWdTZEJQM1QyenJqVFI1bUM3RUts?=
 =?utf-8?B?dkszK0hYamtwTTh3NG13TVBwRysyMW1aYURjdHYxZENpTkl5L0c2VmFYUEZi?=
 =?utf-8?Q?jAfn9byjEA+xO9Bno+ag93E=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03b88fa2-1c28-4f47-fb3f-08da64f42485
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2022 17:21:37.3279 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /yzEoDC+Vxl5et5xdJD/8qLeoPATndTjaKA2MKQRQc9g8Kx5MPofxPSrE6rxyhRG6xqW8JMFr2a0mbCnWnS8kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6308
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
Cc: David Airlie <airlied@linux.ie>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Len Brown <lenb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W1B1YmxpY10NCg0KDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogV2Vy
bmVyIFNlbWJhY2ggPHdzZUB0dXhlZG9jb21wdXRlcnMuY29tPg0KPiBTZW50OiBXZWRuZXNkYXks
IEp1bHkgMTMsIDIwMjIgMTI6MDgNCj4gVG86IEhhbnMgZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhh
dC5jb20+OyBCZW4gU2tlZ2dzDQo+IDxic2tlZ2dzQHJlZGhhdC5jb20+OyBLYXJvbCBIZXJic3Qg
PGtoZXJic3RAcmVkaGF0LmNvbT47IEx5dWRlDQo+IDxseXVkZUByZWRoYXQuY29tPjsgRGFuaWVs
IERhZGFwIDxkZGFkYXBAbnZpZGlhLmNvbT47IE1hYXJ0ZW4NCj4gTGFua2hvcnN0IDxtYWFydGVu
Lmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+OyBNYXhpbWUgUmlwYXJkDQo+IDxtcmlwYXJkQGtl
cm5lbC5vcmc+OyBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT47DQo+IEph
bmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBsaW51eC5pbnRlbC5jb20+OyBKb29uYXMgTGFodGluZW4N
Cj4gPGpvb25hcy5sYWh0aW5lbkBsaW51eC5pbnRlbC5jb20+OyBSb2RyaWdvIFZpdmkgPHJvZHJp
Z28udml2aUBpbnRlbC5jb20+Ow0KPiBUdnJ0a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AbGlu
dXguaW50ZWwuY29tPjsgRGV1Y2hlciwgQWxleGFuZGVyDQo+IDxBbGV4YW5kZXIuRGV1Y2hlckBh
bWQuY29tPjsgS29lbmlnLCBDaHJpc3RpYW4NCj4gPENocmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT47
IFBhbkB2Z2VyLmtlcm5lbC5vcmc7IFBhbiwgWGluaHVpDQo+IDxYaW5odWkuUGFuQGFtZC5jb20+
OyBSYWZhZWwgSiAuIFd5c29ja2kgPHJhZmFlbEBrZXJuZWwub3JnPjsgTWlrYQ0KPiBXZXN0ZXJi
ZXJnIDxtaWthLndlc3RlcmJlcmdAbGludXguaW50ZWwuY29tPjsgTHVrYXMgV3VubmVyDQo+IDxs
dWthc0B3dW5uZXIuZGU+OyBNYXJrIEdyb3NzIDxtYXJrZ3Jvc3NAa2VybmVsLm9yZz47IEFuZHkN
Cj4gU2hldmNoZW5rbyA8YW5keUBrZXJuZWwub3JnPg0KPiBDYzogbm91dmVhdUBsaXN0cy5mcmVl
ZGVza3RvcC5vcmc7IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD47IERhdmlkDQo+IEFp
cmxpZSA8YWlybGllZEBsaW51eC5pZT47IGludGVsLWdmeCA8aW50ZWwtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZz47IGRyaS0NCj4gZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBhbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgTGVuIEJyb3duDQo+IDxsZW5iQGtlcm5lbC5vcmc+OyBs
aW51eC1hY3BpQHZnZXIua2VybmVsLm9yZzsgcGxhdGZvcm0tZHJpdmVyLQ0KPiB4ODZAdmdlci5r
ZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMjcvMjldIEFDUEk6IHZpZGVvOiBE
cm9wIENsZXZvL1RVWEVETyBOTDV4UlUgYW5kDQo+IE5MNXhOVSBhY3BpX2JhY2tsaWdodD1uYXRp
dmUgcXVpcmtzDQo+IA0KPiBIaSwNCj4gDQo+IE9uIDcvMTIvMjIgMjE6MzksIEhhbnMgZGUgR29l
ZGUgd3JvdGU6DQo+ID4gYWNwaV9iYWNrbGlnaHQ9bmF0aXZlIGlzIHRoZSBkZWZhdWx0IGZvciB0
aGVzZSwgYnV0IGFzIHRoZSBjb21tZW50DQo+ID4gZXhwbGFpbnMgdGhlIHF1aXJrIHdhcyBzdGls
bCBuZWNlc3NhcnkgYmVjYXVzZSBldmVuIGJyaWVmbHkgcmVnaXN0ZXJpbmcNCj4gPiB0aGUgYWNw
aV92aWRlbzAgYmFja2xpZ2h0OyBhbmQgdGhlbiB1bnJlZ2lzdGVyaW5nIGl0IG9uY2UgdGhlIG5h
dGl2ZQ0KPiA+IGRyaXZlciBzaG93ZWQgdXAsIHdhcyBsZWFkaW5nIHRvIGlzc3Vlcy4NCj4gPg0K
PiA+IEFmdGVyIHRoZSAiQUNQSTogdmlkZW86IE1ha2UgYmFja2xpZ2h0IGNsYXNzIGRldmljZSBy
ZWdpc3RyYXRpb24NCj4gPiBhIHNlcGFyYXRlIHN0ZXAiIHBhdGNoIGZyb20gZWFybGllciBpbiB0
aGlzIHBhdGNoLXNlcmllcywgd2Ugbm8NCj4gPiBsb25nZXIgYnJpZWZseSByZWdpc3RlciB0aGUg
YWNwaV92aWRlbzAgYmFja2xpZ2h0IG9uIHN5c3RlbXMgd2hlcmUNCj4gPiB0aGUgbmF0aXZlIGRy
aXZlciBzaG91bGQgYmUgdXNlZC4NCj4gPg0KPiA+IFNvIHRoaXMgaXMgbm8gbG9uZ2VyIGFuIGlz
c3VlIGFuIHRoZSBxdWlya3MgYXJlIG5vIGxvbmdlciBuZWVkZWQuDQo+ID4NCj4gPiBDYzogV2Vy
bmVyIFNlbWJhY2ggPHdzZUB0dXhlZG9jb21wdXRlcnMuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6
IEhhbnMgZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+DQo+IA0KPiBUZXN0ZWQgYW5kIGNh
biBjb25maXJtOiBUaGUgcXVpcmtzIGFyZSBubyBsb25nZXIgbmVlZGVkIHdpdGggdGhpcyBQYXRj
aHNldC4NCj4gDQo+IFRlc3RlZC1ieTogV2VybmVyIFNlbWJhY2ggPHdzZUB0dXhlZG9jb21wdXRl
cnMuY29tPg0KDQpQcm9iYWJseSBzaG91bGQgaW5jbHVkZSB0aGlzIGxpbmsgdGFnIGluIHRoaXMg
Y29tbWl0IHRvbyB0aGVuIGFzIGl0IGZpeGVzDQp0aGUgVG9uZyBGYW5nIHN5c3RlbXMgdG9vLg0K
DQpMaW5rOiBodHRwczovL2J1Z3ppbGxhLmtlcm5lbC5vcmcvc2hvd19idWcuY2dpP2lkPTIxNTY4
Mw0KDQo+IA0KPiBLaW5kIFJlZ2FyZHMsDQo+IA0KPiBXZXJuZXIgU2VtYmFjaA0KPiANCj4gPiAt
LS0NCj4gPiAgIGRyaXZlcnMvYWNwaS92aWRlb19kZXRlY3QuYyB8IDc1IC0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCA3NSBkZWxldGlv
bnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2FjcGkvdmlkZW9fZGV0ZWN0LmMg
Yi9kcml2ZXJzL2FjcGkvdmlkZW9fZGV0ZWN0LmMNCj4gPiBpbmRleCAyYTRkMzc2YTcwM2UuLjRi
OTM5NWQxYmRhNyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2FjcGkvdmlkZW9fZGV0ZWN0LmMN
Cj4gPiArKysgYi9kcml2ZXJzL2FjcGkvdmlkZW9fZGV0ZWN0LmMNCj4gPiBAQCAtNTk5LDgxICs1
OTksNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRtaV9zeXN0ZW1faWQNCj4gdmlkZW9fZGV0ZWN0
X2RtaV90YWJsZVtdID0gew0KPiA+ICAgCQlETUlfTUFUQ0goRE1JX0JPQVJEX05BTUUsICJOMjUw
UCIpLA0KPiA+ICAgCQl9LA0KPiA+ICAgCX0sDQo+ID4gLQkvKg0KPiA+IC0JICogQ2xldm8gTkw1
eFJVIGFuZCBOTDV4TlUvVFVYRURPIEF1cmEgMTUgR2VuMSBhbmQgR2VuMiBoYXZlDQo+IGJvdGgg
YQ0KPiA+IC0JICogd29ya2luZyBuYXRpdmUgYW5kIHZpZGVvIGludGVyZmFjZS4gSG93ZXZlciB0
aGUgZGVmYXVsdCBkZXRlY3Rpb24NCj4gPiAtCSAqIG1lY2hhbmlzbSBmaXJzdCByZWdpc3RlcnMg
dGhlIHZpZGVvIGludGVyZmFjZSBiZWZvcmUgdW5yZWdpc3RlcmluZw0KPiA+IC0JICogaXQgYWdh
aW4gYW5kIHN3aXRjaGluZyB0byB0aGUgbmF0aXZlIGludGVyZmFjZSBkdXJpbmcgYm9vdC4gVGhp
cw0KPiA+IC0JICogcmVzdWx0cyBpbiBhIGRhbmdsaW5nIFNCSU9TIHJlcXVlc3QgZm9yIGJhY2ts
aWdodCBjaGFuZ2UgZm9yIHNvbWUNCj4gPiAtCSAqIHJlYXNvbiwgY2F1c2luZyB0aGUgYmFja2xp
Z2h0IHRvIHN3aXRjaCB0byB+MiUgb25jZSBwZXIgYm9vdCBvbg0KPiB0aGUNCj4gPiAtCSAqIGZp
cnN0IHBvd2VyIGNvcmQgY29ubmVjdCBvciBkaXNjb25uZWN0IGV2ZW50LiBTZXR0aW5nIHRoZSBu
YXRpdmUNCj4gPiAtCSAqIGludGVyZmFjZSBleHBsaWNpdGx5IGNpcmN1bXZlbnRzIHRoaXMgYnVn
Z3kgYmVoYXZpb3VyLCBieSBhdm9pZGluZw0KPiA+IC0JICogdGhlIHVucmVnaXN0ZXJpbmcgcHJv
Y2Vzcy4NCj4gPiAtCSAqLw0KPiA+IC0Jew0KPiA+IC0JLmNhbGxiYWNrID0gdmlkZW9fZGV0ZWN0
X2ZvcmNlX25hdGl2ZSwNCj4gPiAtCS5pZGVudCA9ICJDbGV2byBOTDV4UlUiLA0KPiA+IC0JLm1h
dGNoZXMgPSB7DQo+ID4gLQkJRE1JX01BVENIKERNSV9TWVNfVkVORE9SLCAiVFVYRURPIiksDQo+
ID4gLQkJRE1JX01BVENIKERNSV9CT0FSRF9OQU1FLCAiTkw1eFJVIiksDQo+ID4gLQkJfSwNCj4g
PiAtCX0sDQo+ID4gLQl7DQo+ID4gLQkuY2FsbGJhY2sgPSB2aWRlb19kZXRlY3RfZm9yY2VfbmF0
aXZlLA0KPiA+IC0JLmlkZW50ID0gIkNsZXZvIE5MNXhSVSIsDQo+ID4gLQkubWF0Y2hlcyA9IHsN
Cj4gPiAtCQlETUlfTUFUQ0goRE1JX1NZU19WRU5ET1IsDQo+ICJTY2hlbmtlclRlY2hub2xvZ2ll
c0dtYkgiKSwNCj4gPiAtCQlETUlfTUFUQ0goRE1JX0JPQVJEX05BTUUsICJOTDV4UlUiKSwNCj4g
PiAtCQl9LA0KPiA+IC0JfSwNCj4gPiAtCXsNCj4gPiAtCS5jYWxsYmFjayA9IHZpZGVvX2RldGVj
dF9mb3JjZV9uYXRpdmUsDQo+ID4gLQkuaWRlbnQgPSAiQ2xldm8gTkw1eFJVIiwNCj4gPiAtCS5t
YXRjaGVzID0gew0KPiA+IC0JCURNSV9NQVRDSChETUlfU1lTX1ZFTkRPUiwgIk5vdGVib29rIiks
DQo+ID4gLQkJRE1JX01BVENIKERNSV9CT0FSRF9OQU1FLCAiTkw1eFJVIiksDQo+ID4gLQkJfSwN
Cj4gPiAtCX0sDQo+ID4gLQl7DQo+ID4gLQkuY2FsbGJhY2sgPSB2aWRlb19kZXRlY3RfZm9yY2Vf
bmF0aXZlLA0KPiA+IC0JLmlkZW50ID0gIkNsZXZvIE5MNXhSVSIsDQo+ID4gLQkubWF0Y2hlcyA9
IHsNCj4gPiAtCQlETUlfTUFUQ0goRE1JX1NZU19WRU5ET1IsICJUVVhFRE8iKSwNCj4gPiAtCQlE
TUlfTUFUQ0goRE1JX0JPQVJEX05BTUUsICJBVVJBMTUwMSIpLA0KPiA+IC0JCX0sDQo+ID4gLQl9
LA0KPiA+IC0Jew0KPiA+IC0JLmNhbGxiYWNrID0gdmlkZW9fZGV0ZWN0X2ZvcmNlX25hdGl2ZSwN
Cj4gPiAtCS5pZGVudCA9ICJDbGV2byBOTDV4UlUiLA0KPiA+IC0JLm1hdGNoZXMgPSB7DQo+ID4g
LQkJRE1JX01BVENIKERNSV9TWVNfVkVORE9SLCAiVFVYRURPIiksDQo+ID4gLQkJRE1JX01BVENI
KERNSV9CT0FSRF9OQU1FLCAiRURVQk9PSzE1MDIiKSwNCj4gPiAtCQl9LA0KPiA+IC0JfSwNCj4g
PiAtCXsNCj4gPiAtCS5jYWxsYmFjayA9IHZpZGVvX2RldGVjdF9mb3JjZV9uYXRpdmUsDQo+ID4g
LQkuaWRlbnQgPSAiQ2xldm8gTkw1eE5VIiwNCj4gPiAtCS5tYXRjaGVzID0gew0KPiA+IC0JCURN
SV9NQVRDSChETUlfU1lTX1ZFTkRPUiwgIlRVWEVETyIpLA0KPiA+IC0JCURNSV9NQVRDSChETUlf
Qk9BUkRfTkFNRSwgIk5MNXhOVSIpLA0KPiA+IC0JCX0sDQo+ID4gLQl9LA0KPiA+IC0Jew0KPiA+
IC0JLmNhbGxiYWNrID0gdmlkZW9fZGV0ZWN0X2ZvcmNlX25hdGl2ZSwNCj4gPiAtCS5pZGVudCA9
ICJDbGV2byBOTDV4TlUiLA0KPiA+IC0JLm1hdGNoZXMgPSB7DQo+ID4gLQkJRE1JX01BVENIKERN
SV9TWVNfVkVORE9SLA0KPiAiU2NoZW5rZXJUZWNobm9sb2dpZXNHbWJIIiksDQo+ID4gLQkJRE1J
X01BVENIKERNSV9CT0FSRF9OQU1FLCAiTkw1eE5VIiksDQo+ID4gLQkJfSwNCj4gPiAtCX0sDQo+
ID4gLQl7DQo+ID4gLQkuY2FsbGJhY2sgPSB2aWRlb19kZXRlY3RfZm9yY2VfbmF0aXZlLA0KPiA+
IC0JLmlkZW50ID0gIkNsZXZvIE5MNXhOVSIsDQo+ID4gLQkubWF0Y2hlcyA9IHsNCj4gPiAtCQlE
TUlfTUFUQ0goRE1JX1NZU19WRU5ET1IsICJOb3RlYm9vayIpLA0KPiA+IC0JCURNSV9NQVRDSChE
TUlfQk9BUkRfTkFNRSwgIk5MNXhOVSIpLA0KPiA+IC0JCX0sDQo+ID4gLQl9LA0KPiA+DQo+ID4g
ICAJLyoNCj4gPiAgIAkgKiBEZXNrdG9wcyB3aGljaCBmYWxzZWx5IHJlcG9ydCBhIGJhY2tsaWdo
dCBhbmQgd2hpY2ggb3VyIGhldXJpc3RpY3MNCg==

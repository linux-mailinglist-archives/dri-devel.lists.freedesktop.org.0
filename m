Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7788865D766
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 16:42:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45BC410E4FB;
	Wed,  4 Jan 2023 15:42:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2064.outbound.protection.outlook.com [40.107.102.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C654510E4FB;
 Wed,  4 Jan 2023 15:42:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hqceszIB3H75/sGccYfE1gXlZFZ6noPAgq/TlJ/sVFmH/3Yi/uodF8Pgz7V3VC51eld/ESpjYG4HvzGaQjaLXCBmN1x2CteJk1e1VTahs5/gZb9hZ3hwTw5jidvDnY368RNbSj3OJY9ynHAzu44T8lhWt4fupCgYMRvDYf2Vg85v9pWFIOw2pZAy3clBFd8bFq1FifvhVwCgY1MCx7FS9HmczpfikoHeBP3bZ2PJHXKyx0NBxMK03xDLaL1beGAet8teBJpJ4OTgKKk4U2XrKW/qV/s6vBNYOM8SBHoqUhx7yyH+GbnPTcCkYuATstYJZN3oji821WSj+KPvkqjb3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h3+AGEGaz+4O71Dg+VxvUJskZRIaPGnqJew7pb8PN+k=;
 b=CD3xj6I1tU7dFRvnpj5e9lTF4J0YtmkpHHPQyexDbW4n0oj5tbU0+983T4ZmVYhqCY/M5O1DOb5k0J69rfTKp/2oA/+qF1h9mXIL7TbycZNXUCkKSHrJrOkBHHkpIrSMzHxLp2XcmyqEd3jNqduwdjpTkrpKz8y4aE87qpeUMeIuIiScQwrArJ/+EMCwzfbeMCwlqlmiakZ88jl0FJgxnDPkWi83lGGuZVBB5phFpCabRTCqsthcuHLlYSqQnHDb0zYfY8XNyrkmzxSCLus+WXWQEmd+IcJtMxW8p6ybadDPY1sfmp1ko3IdAlamOCSRQlsZ2U2DBCRMvHElse8i8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h3+AGEGaz+4O71Dg+VxvUJskZRIaPGnqJew7pb8PN+k=;
 b=3tHk8dSxypoWictYia14hPiBiOKris2fX/dPI8c/TqelXlmcJBgkGPvwfCZ0KuCd0qJxJTd7MXHx0qo8ZZUri2SdlyoDj2mGNJCsHUmFiLqhfPzIzPhxTXwxSRhCyS4O8mHULHnzcgoYGJbWkTJc/8QMlAJay2mo0D/K/zPw40U=
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SJ0PR12MB5488.namprd12.prod.outlook.com (2603:10b6:a03:3ad::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 15:42:27 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::ff3c:2d37:75f3:442a]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::ff3c:2d37:75f3:442a%6]) with mapi id 15.20.5944.019; Wed, 4 Jan 2023
 15:42:27 +0000
From: "Limonciello, Mario" <Mario.Limonciello@amd.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v4 27/27] drm/amd: Optimize SRIOV switch/case for PSP
 microcode load
Thread-Topic: [PATCH v4 27/27] drm/amd: Optimize SRIOV switch/case for PSP
 microcode load
Thread-Index: AQHZH8GOkoThN7KnekeHP+0LeT7Uw66OPoQAgAAoCAA=
Date: Wed, 4 Jan 2023 15:42:27 +0000
Message-ID: <MN0PR12MB610118EF0744B168A331DCC6E2F59@MN0PR12MB6101.namprd12.prod.outlook.com>
References: <20230103221852.22813-1-mario.limonciello@amd.com>
 <20230103221852.22813-28-mario.limonciello@amd.com>
 <61ed5d45-c79c-0c5e-ae18-b51d8925386f@gmail.com>
In-Reply-To: <61ed5d45-c79c-0c5e-ae18-b51d8925386f@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2023-01-04T15:42:24Z; 
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=9dc4db82-e8db-4f9c-b18d-9fa1f396dff9;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_enabled: true
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_setdate: 2023-01-04T15:42:25Z
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_method: Privileged
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_name: Public-AIP 2.0
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_actionid: 9cd3760f-49fc-4ee7-88d9-a055abed8cd4
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB6101:EE_|SJ0PR12MB5488:EE_
x-ms-office365-filtering-correlation-id: 20be33f4-d813-4835-5264-08daee6a482e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AzhAho5DkY59TyBs77dbCjpzQUv6ytLZg4BV/xwfg0l8ZWIee00u9qwSqT388Cbxn0hA+Ze9LF2+ImYiDv0B1tG/SHsXP4CsFzck3vRlHqmT/xI9GnHtBNJijM5jL+jtr/SBuSt1+1s/aIPgF/EhW7LNm/FjQAg8CsiBpbjrQUYPmzUdOESFST0dyKMTiwqpDub/epeDyFRgX2mCH+q8C6AwUUjQjUuTdGg93lfQW0rd6q6P/FpryqidsU1sW+83h4wuPF0bXe6Yk1jDG4eSJQ4wjmFVyfRNOBDcCILMpFHVzKu1siAk1m/saHkBtBphQhLKmwafNfdIkeiNJzqyjiZ3CQq7MIvoB2RWd689Qa8iQVcF1npdz8QurJv08QiD5iEnIStiVCna3QcbTZT8KxvUdrAGHe1G/MwMbf/arycA0uadQiWaeF9entbr13GiBU9R2Mb/fp4T2kp3Yy89Ge4zeFdHvcUPuOcY0VEhJ+q135lLRRhCLjze7zScTBE72r/ydvvAVvIlg4hgUxbjRCIdYxRf1Wg7Botjsc2ZMyrOdk8ZO0t8IYjoQAWeH8i6WaJgP6Xn/KFm/qZbbdZIqed09f4uKKAKcYR5oq15h274kaYphVEjgG6NuRNacKWswe5aZDRFHrSEIlVh0ifqW6R20kzhGoX0rMNq+P+hqafbwjz/nZnzLG+0O5RcFkBtPeufihjpMtq0HmiFIlShBg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(39860400002)(346002)(376002)(396003)(136003)(451199015)(9686003)(26005)(71200400001)(186003)(6506007)(53546011)(478600001)(110136005)(7696005)(66446008)(8676002)(66946007)(76116006)(4326008)(66556008)(8936002)(64756008)(41300700001)(66476007)(52536014)(83380400001)(5660300002)(2906002)(38100700002)(122000001)(55016003)(33656002)(38070700005)(86362001)(316002)(54906003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eXNuRW9NZVg2U21tdGF4Q1Zvbnl5SkNoenlGeFVWaGNHYUJ2cDMzZGNRY3dU?=
 =?utf-8?B?TDBtZ2lrZG42YzFtTlZrUUJadmd1bU9zZDNnN2ZtR3B0ZUlDZ0FpRUk3cEg3?=
 =?utf-8?B?bVR4NEhmRlNXM2ZTTDBSalNkWkhtZk9nOENEVUVOcTRuZ2tIUmdCQnNySjFk?=
 =?utf-8?B?a3NhMU1sZms5SUNxTis0azEyRXArWmE3eU5FNFczdlE1MHlEQURtV0R6SCt2?=
 =?utf-8?B?UU1idFphazVMdUVGWkMyOFE1Qis0Z3g1WlFSU3RjQ09KdkVzSFc2bzZnQkR6?=
 =?utf-8?B?UklicnY0cmQ3d0orQVdhd0JlMUV2Yzg2RTRqZFdsdkJ0Rm9uRjF0am1ZOXJN?=
 =?utf-8?B?MW1uREdlVnJheXNYMXNTM1NDOTdTeWMxUTZCOWIxLzNYZ1dUeEtaSkJXY1l6?=
 =?utf-8?B?RnRZQ3dNMllmVVdVKzloMWlJUS80R0JQMDduUktsMkg0WGlmNW93OHkxME05?=
 =?utf-8?B?OTIvVWpscCtqMzRPTVBreXFHM3dMUmpSNGIxbkhLMWVaWVFBUlNFUjNleVVF?=
 =?utf-8?B?WFA0Q2U4WmswYzB5NmlEQTNoRmNJU2h5ZCsrVmlQWlZnekpEcVZtRFF6MDlz?=
 =?utf-8?B?eHAwMXlPRHdtQlFMenczbkxBTkRsVGdJZGJlZllwOUQ0c2FKTFZwMHhLVnEx?=
 =?utf-8?B?ZmNqeGF2bUp0Y2FGbU1vWmN4UjFGTVM0UXhQekVLclFRTFYwOXBzVkkzajJx?=
 =?utf-8?B?N0U0VDdtNE5acVZaWHM0eXNJRStUSEdvc0JOYjBabEcvMHNxQjZwOXFZUHh4?=
 =?utf-8?B?NldGVGFITFMvRkhZcjJSRFg1c1lsc2hXc0VoSlRrVGxtaXd0dVM1d0pjQUMz?=
 =?utf-8?B?VE5YK0VELzY3MjRxWXI1Q3dpTXIzd2hMV09WWGdFcTZDYmx3YlV3Sk1QNmta?=
 =?utf-8?B?VHF0eFdkUUxPNlFkK0tPMGc0VlF3MzZCY09vRkN4L2xCbm9Cb05RNjdKRkph?=
 =?utf-8?B?dE90OUh2ZEZ4Sm9JaVN4eFpIdE4rcFNCejhTMVdjNm9zcFEwMi9ZNjJwK1hK?=
 =?utf-8?B?OHFpSEZNcmoxVjlBenhsV0RaRTRwbTNjelo0VEVlWlorN3RyY1VOMU9RRkhL?=
 =?utf-8?B?UGJja3ZndGxjZVFFbWpRTnBEZWFGVS8rdE44V0pLNzNPdEQvL2NVaW9TcVpv?=
 =?utf-8?B?cHNlOEtlZm16dzljK3Z0TGo4UkRkQU1qTlljNzJVRVpZVkhCNmYxM1Vnd1Vm?=
 =?utf-8?B?S0ROSHZDSUJxMDE2Y0tjQi9qaXZEUUkzVDdLZHpTMTZZa2h5L3gwMmhudDdo?=
 =?utf-8?B?SnhEWWdDNTFXekJwN1IrWVQ4ck5hOTBWQ1ltNCsrUGpVVXZsQVZBZFB0Y2Er?=
 =?utf-8?B?T01PUU1waThqTjgwY3hJTldRY1lCZUlabW5CMDZMOVZ5cmZRa0xhVWRpYzgv?=
 =?utf-8?B?OGQyRFJoRmk5N05xU2lwWXA0VmN1VzlQS1NwTDlDTWh0VHp5UlRiZTJrUy9l?=
 =?utf-8?B?MDR0S1FSdVQ1WUlTa0pkL2lkYWFGaWJqdDJuR3ZKU1NHY3AzWXJMT0ljZTN1?=
 =?utf-8?B?VnhwdTRHbFBuR2YzY1k1WGk0ZDREZ0plRWNBUFlITUE3cmZRdWxqL2JsZjRu?=
 =?utf-8?B?ak51U3RWNUpRWUo1aEE3eDB2RjQ4cURpUmlWWWh0dU9aQ1dxcnJITTV2Wk9F?=
 =?utf-8?B?aTk1akw2enk2TlRKT0drcHdWbFVyWDliWWs0bXFCQzRCeUpWS3pSWFpKNTB6?=
 =?utf-8?B?Uys0anhta3hWRm0zd2hSdGppOEpvc01YSm03bGI3aW9QSDRDVFpoa0tXd0sw?=
 =?utf-8?B?OHZhMGc1MWhHRldycFFldTFTV2E0SktpVlhMbllEdlU0NzZHdGt4WExjZ0FZ?=
 =?utf-8?B?aXpXd1ZObUdVNHZlMzdHZXF6dUdUR21PNVVGUXd4WUt4U01vRVVjR3g5OXpW?=
 =?utf-8?B?VFk2cHJwaDJVSDFKMGFSdk1GY25hbjF0b2ZLQ2lGMitYNkdNaHc0eVluTFR3?=
 =?utf-8?B?NnIyRVI1bTRTdmFFWFlKaVFFaVJpWWlrQUFSNVc5U21BaDRFNXNUbG1hY3Fy?=
 =?utf-8?B?MGVvbExjWTF6dFJudHFSblZiZ3B0ODhKL3Y5Q1NiajhacERJVjFmWmh5VktU?=
 =?utf-8?B?RFVMYmN0L0dIL0Jhdk9SRGg4ekpQL082SlVya0k4WjJ4THdwSW00S2FHYmhG?=
 =?utf-8?Q?GfYk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20be33f4-d813-4835-5264-08daee6a482e
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jan 2023 15:42:27.0660 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0Xhs7GrfOWsp79e/1Ndk+DrREhfxtnUGOI83/2NcmYTqb0lTwLkKkP6XjGyzE1vhDJjmIR9w8dVM+au1IN9S3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5488
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, "Lazar, Lijo" <Lijo.Lazar@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Carlos Soriano Sanchez <csoriano@redhat.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W1B1YmxpY10NCg0KDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQ2hy
aXN0aWFuIEvDtm5pZyA8Y2tvZW5pZy5sZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+DQo+IFNlbnQ6
IFdlZG5lc2RheSwgSmFudWFyeSA0LCAyMDIzIDA3OjE4DQo+IFRvOiBMaW1vbmNpZWxsbywgTWFy
aW8gPE1hcmlvLkxpbW9uY2llbGxvQGFtZC5jb20+OyBEZXVjaGVyLCBBbGV4YW5kZXINCj4gPEFs
ZXhhbmRlci5EZXVjaGVyQGFtZC5jb20+OyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+
IENjOiBQYW4sIFhpbmh1aSA8WGluaHVpLlBhbkBhbWQuY29tPjsgTGF6YXIsIExpam8gPExpam8u
TGF6YXJAYW1kLmNvbT47DQo+IEphdmllciBNYXJ0aW5leiBDYW5pbGxhcyA8amF2aWVybUByZWRo
YXQuY29tPjsgZHJpLQ0KPiBkZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnOyBEYW5pZWwgVmV0dGVyDQo+IDxkYW5pZWxAZmZ3bGwuY2g+OyBD
YXJsb3MgU29yaWFubyBTYW5jaGV6IDxjc29yaWFub0ByZWRoYXQuY29tPjsgRGF2aWQNCj4gQWly
bGllIDxhaXJsaWVkQGdtYWlsLmNvbT47IEtvZW5pZywgQ2hyaXN0aWFuIDxDaHJpc3RpYW4uS29l
bmlnQGFtZC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjQgMjcvMjddIGRybS9hbWQ6IE9w
dGltaXplIFNSSU9WIHN3aXRjaC9jYXNlIGZvciBQU1ANCj4gbWljcm9jb2RlIGxvYWQNCj4gDQo+
IEFtIDAzLjAxLjIzIHVtIDIzOjE4IHNjaHJpZWIgTWFyaW8gTGltb25jaWVsbG86DQo+ID4gTm93
IHRoYXQgSVAgdmVyc2lvbiBkZWNvZGluZyBpcyB1c2VkLCBhIG51bWJlciBvZiBjYXNlIHN0YXRl
bWVudHMNCj4gPiBjYW4gYmUgY29tYmluZWQuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBNYXJp
byBMaW1vbmNpZWxsbyA8bWFyaW8ubGltb25jaWVsbG9AYW1kLmNvbT4NCj4gDQo+IFRoaXMgcGF0
Y2ggY2FuIHByb2JhYmx5IGJlIHB1c2hlZCBhcyBzbWFsbCBjbGVhbnVwIGluZGVwZW5kZW50IG9m
IHRoZQ0KPiBwcmV2aW91cyBwYXRjaGVzLg0KPiANCj4gSW4gZ2VuZXJhbCBJIHVzdWFsbHkgc3Vn
Z2VzdCB0byBwdXNoIHRob3NlIHNlcGFyYXRlbHkgdG8gbWFrZSB0aGUgcGF0Y2gNCj4gc2V0IGNv
bmNlbnRyYXRlIG9uIHRoZSByZWFsIGNoYW5nZXMgYXQgaGFuZC4NCj4gDQo+IEFueXdheSB0aGlz
IHBhdGNoIGhlcmUgaXMgUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcNCj4gPGNocmlzdGlh
bi5rb2VuaWdAYW1kLmNvbT4NCj4gDQoNClRoYW5rcyENClRoaXMgb3B0aW1pemF0aW9uIGlzIG9u
bHkgcG9zc2libGUgYmVjYXVzZSBvZiBlYXJsaWVyIGNoYW5nZXMgaW4gdGhlIHNlcmllcy4NCldp
bGwgYWRkIHlvdXIgdGFnIGZvciB2NS4NCg0KPiBSZWdhcmRzLA0KPiBDaHJpc3RpYW4uDQo+IA0K
PiA+IC0tLQ0KPiA+IHYzLT52NDoNCj4gPiAgICogTmV3IHBhdGNoDQo+ID4NCj4gPiAgIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuYyB8IDggKy0tLS0tLS0NCj4gPiAgIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNyBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmMNCj4gYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmMNCj4gPiBpbmRleCBmNDUzNjJk
ZDgyMjguLjgzZTI1M2I1ZDkyOCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfcHNwLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfcHNwLmMNCj4gPiBAQCAtMTMyLDE0ICsxMzIsOCBAQCBzdGF0aWMgaW50IHBzcF9p
bml0X3NyaW92X21pY3JvY29kZShzdHJ1Y3QNCj4gcHNwX2NvbnRleHQgKnBzcCkNCj4gPg0KPiA+
ICAgCXN3aXRjaCAoYWRldi0+aXBfdmVyc2lvbnNbTVAwX0hXSVBdWzBdKSB7DQo+ID4gICAJY2Fz
ZSBJUF9WRVJTSU9OKDksIDAsIDApOg0KPiA+IC0JCWFkZXYtPnZpcnQuYXV0b2xvYWRfdWNvZGVf
aWQgPQ0KPiBBTURHUFVfVUNPREVfSURfQ1BfTUVDMjsNCj4gPiAtCQlyZXQgPSBwc3BfaW5pdF9j
YXBfbWljcm9jb2RlKHBzcCwgdWNvZGVfcHJlZml4KTsNCj4gPiAtCQlicmVhazsNCj4gPiAtCWNh
c2UgSVBfVkVSU0lPTigxMSwgMCwgOSk6DQo+ID4gLQkJYWRldi0+dmlydC5hdXRvbG9hZF91Y29k
ZV9pZCA9DQo+IEFNREdQVV9VQ09ERV9JRF9DUF9NRUMyOw0KPiA+IC0JCXJldCA9IHBzcF9pbml0
X2NhcF9taWNyb2NvZGUocHNwLCB1Y29kZV9wcmVmaXgpOw0KPiA+IC0JCWJyZWFrOw0KPiA+ICAg
CWNhc2UgSVBfVkVSU0lPTigxMSwgMCwgNyk6DQo+ID4gKwljYXNlIElQX1ZFUlNJT04oMTEsIDAs
IDkpOg0KPiA+ICAgCQlhZGV2LT52aXJ0LmF1dG9sb2FkX3Vjb2RlX2lkID0NCj4gQU1ER1BVX1VD
T0RFX0lEX0NQX01FQzI7DQo+ID4gICAJCXJldCA9IHBzcF9pbml0X2NhcF9taWNyb2NvZGUocHNw
LCB1Y29kZV9wcmVmaXgpOw0KPiA+ICAgCQlicmVhazsNCg==
